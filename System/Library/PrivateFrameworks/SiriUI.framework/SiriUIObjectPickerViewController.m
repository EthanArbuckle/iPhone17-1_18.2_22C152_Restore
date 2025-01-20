@interface SiriUIObjectPickerViewController
+ (id)pickerControllerWithPicker:(id)a3;
- (SAUIDomainObjectPicker)_picker;
- (SiriUIObjectPickerViewController)initWithPicker:(id)a3;
- (SiriUIObjectPickerViewControllerDelegate)pickerDelegate;
- (void)setPickerDelegate:(id)a3;
@end

@implementation SiriUIObjectPickerViewController

+ (id)pickerControllerWithPicker:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = [(SiriUIObjectPickerViewController *)[SiriUIPersonPickerViewController alloc] initWithPicker:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (SiriUIObjectPickerViewController)initWithPicker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriUIObjectPickerViewController;
  v6 = [(SiriUIObjectPickerViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_picker, a3);
  }

  return v7;
}

- (SiriUIObjectPickerViewControllerDelegate)pickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerDelegate);
  return (SiriUIObjectPickerViewControllerDelegate *)WeakRetained;
}

- (void)setPickerDelegate:(id)a3
{
}

- (SAUIDomainObjectPicker)_picker
{
  return self->_picker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_destroyWeak((id *)&self->_pickerDelegate);
}

@end