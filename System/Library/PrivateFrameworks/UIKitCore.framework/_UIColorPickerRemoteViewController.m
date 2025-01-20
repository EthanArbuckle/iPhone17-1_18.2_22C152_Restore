@interface _UIColorPickerRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (_UIColorPickerRemoteViewControllerHost)_delegate;
- (void)_pickerDidDismissEyedropper;
- (void)_pickerDidFinish;
- (void)_pickerDidFloatEyedropper;
- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5;
- (void)_pickerDidShowEyedropper;
- (void)set_delegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _UIColorPickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED701B40];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED6329E8];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained _colorPickerViewServiceDidTerminateWithError:v4];
}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  BOOL v5 = a5;
  p_delegate = &self->_delegate;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained _pickerDidSelectColor:v9 colorSpace:v8 isVolatile:v5];
}

- (void)_pickerDidShowEyedropper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained _pickerDidShowEyedropper];
}

- (void)_pickerDidDismissEyedropper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained _pickerDidDismissEyedropper];
}

- (void)_pickerDidFloatEyedropper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained _pickerDidFloatEyedropper];
}

- (void)_pickerDidFinish
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained _pickerDidFinish];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIColorPickerRemoteViewControllerHost)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIColorPickerRemoteViewControllerHost *)WeakRetained;
}

- (void)set_delegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end