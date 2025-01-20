@interface _UIScreenRoutePickerRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (NSCopying)extensionRequestIdentifier;
- (NSExtension)extension;
- (_UIScreenRoutePickerViewController)publicController;
- (void)_dismissViewController;
- (void)invalidate;
- (void)setExtension:(id)a3;
- (void)setExtensionRequestIdentifier:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPublicController:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _UIScreenRoutePickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED700EE0];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED5960B0];
}

- (void)invalidate
{
  [(NSExtension *)self->_extension cancelExtensionRequestWithIdentifier:self->_extensionRequestIdentifier];
  [(_UIScreenRoutePickerRemoteViewController *)self setExtension:0];
  [(_UIScreenRoutePickerRemoteViewController *)self setExtensionRequestIdentifier:0];
  [(_UIScreenRoutePickerRemoteViewController *)self setPublicController:0];
}

- (void)_dismissViewController
{
  v3 = [(_UIScreenRoutePickerRemoteViewController *)self publicController];
  v4 = [v3 presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v5 _invalidate];

  [(_UIScreenRoutePickerRemoteViewController *)self setPublicController:0];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIScreenRoutePickerRemoteViewController;
  [(_UIRemoteViewController *)&v4 viewServiceDidTerminateWithError:a3];
  [(_UIScreenRoutePickerRemoteViewController *)self _dismissViewController];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(_UIScreenRoutePickerRemoteViewController *)self publicController];
  uint64_t v7 = [v6 modalPresentationStyle];

  if (v7 != 7) {
    double width = 0.0;
  }
  v8 = [(_UIScreenRoutePickerRemoteViewController *)self publicController];
  objc_msgSend(v8, "setPreferredContentSize:", width, height);

  v9.receiver = self;
  v9.super_class = (Class)_UIScreenRoutePickerRemoteViewController;
  -[UIViewController setPreferredContentSize:](&v9, sel_setPreferredContentSize_, width, height);
}

- (_UIScreenRoutePickerViewController)publicController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publicController);
  return (_UIScreenRoutePickerViewController *)WeakRetained;
}

- (void)setPublicController:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_publicController);
}

@end