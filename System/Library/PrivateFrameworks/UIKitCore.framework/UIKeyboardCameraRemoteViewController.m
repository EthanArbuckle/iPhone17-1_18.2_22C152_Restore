@interface UIKeyboardCameraRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (UIKeyboardCameraRemoteViewControllerHost)delegate;
- (void)keyboardCameraDidAccept;
- (void)keyboardCameraDidCancel;
- (void)keyboardCameraDidUpdateString:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation UIKeyboardCameraRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED700FA0];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED5E1AB8];
}

- (void)keyboardCameraDidUpdateString:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained keyboardCameraDidUpdateString:v4];
}

- (void)keyboardCameraDidAccept
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained keyboardCameraDidAccept];
}

- (void)keyboardCameraDidCancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained keyboardCameraDidCancel];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIKeyboardCameraRemoteViewControllerHost)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardCameraRemoteViewControllerHost *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end