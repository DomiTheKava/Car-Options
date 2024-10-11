import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: Initialized things
    
    var enginePicker: UIPickerView!
    var colorPicker: UIPickerView!
    var interiorPicker: UIPickerView!
    var tirePicker: UIPickerView!

    let engineOptions = ["V6", "V8", "Electric"]
    let colorOptions = ["Red", "Blue", "Black"]
    let interiorOptions = ["Leather", "Fabric"]
    let tireOptions = ["Sport", "Off-road"]

    var selectedEngine: String?
    var selectedColor: String?
    var selectedInterior: String?
    var selectedTires: String?
    
    // MARK: on load

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        setupPickers()
        setupLabels()
        setupDoneButton()
    }
    
    // MARK: functions
    
    func setupPickers() {
        enginePicker = createPicker(at: CGPoint(x: 20, y: 100))
        colorPicker = createPicker(at: CGPoint(x: 20, y: 200))
        interiorPicker = createPicker(at: CGPoint(x: 20, y: 300))
        tirePicker = createPicker(at: CGPoint(x: 20, y: 400))
        
        view.addSubview(enginePicker)
        view.addSubview(colorPicker)
        view.addSubview(interiorPicker)
        view.addSubview(tirePicker)
    }

    func setupLabels() {
        let labels = ["Engine:", "Color:", "Interior:", "Tires:"]
        for (index, text) in labels.enumerated() {
            let label = UILabel(frame: CGRect(x: 20, y: 70 + (index * 100), width: 200, height: 30))
            label.text = text
            view.addSubview(label)
        }
    }

    func setupDoneButton() {
        let doneButton = UIButton(type: .system)
        doneButton.frame = CGRect(x: 95, y: 500, width: 200, height: 50)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        view.addSubview(doneButton)
    }

    func createPicker(at position: CGPoint) -> UIPickerView {
        let picker = UIPickerView(frame: CGRect(x: position.x, y: position.y, width: view.frame.width - 40, height: 100))
        picker.delegate = self
        picker.dataSource = self
        return picker
    }

    @objc func doneButtonTapped() {
        let selectedCustomizations = """
        Engine: \(selectedEngine ?? engineOptions[0])
        Color: \(selectedColor ?? colorOptions[0])
        Interior: \(selectedInterior ?? interiorOptions[0])
        Tires: \(selectedTires ?? tireOptions[0])
        """

        // Pass back data
        if let parentVC = presentingViewController as? ViewController {
            parentVC.updateCustomizations(s: selectedCustomizations)
        }
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - UIPickerView Stuff

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case enginePicker:
            return engineOptions.count
        case colorPicker:
            return colorOptions.count
        case interiorPicker:
            return interiorOptions.count
        case tirePicker:
            return tireOptions.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case enginePicker:
            return engineOptions[row]
        case colorPicker:
            return colorOptions[row]
        case interiorPicker:
            return interiorOptions[row]
        case tirePicker:
            return tireOptions[row]
        default:
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case enginePicker:
            selectedEngine = engineOptions[row]
        case colorPicker:
            selectedColor = colorOptions[row]
        case interiorPicker:
            selectedInterior = interiorOptions[row]
        case tirePicker:
            selectedTires = tireOptions[row]
        default:
            break
        }
    }
}

#Preview {
    SecondViewController()
}
