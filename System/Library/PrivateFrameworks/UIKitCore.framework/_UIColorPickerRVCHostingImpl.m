@interface _UIColorPickerRVCHostingImpl
- (NSCopying)extensionRequestIdentifier;
- (NSExtension)extension;
- (UIColorPickerViewController)delegateColorPickerViewController;
- (_UIColorPickerRemoteViewController)remoteViewController;
- (void)_colorPickerViewServiceDidTerminateWithError:(id)a3;
- (void)_pickerDidDismissEyedropper;
- (void)_pickerDidFinish;
- (void)_pickerDidFloatEyedropper;
- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5;
- (void)_pickerDidShowEyedropper;
- (void)_tryLaunchingExtension:(int64_t)a3;
- (void)dealloc;
- (void)dismissEyedropper:(BOOL)a3;
- (void)setDelegateColorPickerViewController:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionRequestIdentifier:(id)a3;
- (void)setRemoteConfiguration:(id)a3;
- (void)setRemoteSelectedColor:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setupRemoteHosting;
@end

@implementation _UIColorPickerRVCHostingImpl

- (void)setupRemoteHosting
{
}

- (void)setRemoteSelectedColor:(id)a3
{
  id v4 = a3;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v4 CGColor]);
  CGColorSpaceGetName(ColorSpace);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(_UIColorPickerRVCHostingImpl *)self remoteViewController];
  v7 = [v6 serviceViewControllerProxy];
  [v7 _setSelectedColor:v4 colorSpace:v8];
}

- (void)setRemoteConfiguration:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIColorPickerRVCHostingImpl *)self remoteViewController];
  v5 = [v6 serviceViewControllerProxy];
  [v5 _setConfiguration:v4];
}

- (void)dismissEyedropper:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIColorPickerRVCHostingImpl *)self remoteViewController];
  id v4 = [v5 serviceViewControllerProxy];
  [v4 dismissEyedropper:v3];
}

- (void)_tryLaunchingExtension:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.UIKit.ColorPicker" error:0];
  [(_UIColorPickerRVCHostingImpl *)self setExtension:v5];

  id v6 = [(_UIColorPickerRVCHostingImpl *)self delegateColorPickerViewController];
  [v6 _beginDelayingPresentation:0 cancellationHandler:3.0];

  objc_initWeak(&location, self);
  v7 = [(_UIColorPickerRVCHostingImpl *)self extension];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke;
  v8[3] = &unk_1E5304350;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = (id)a3;
  [v7 instantiateViewControllerWithInputItems:MEMORY[0x1E4F1CBF0] connectionHandler:v8];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  if (self->_extensionRequestIdentifier) {
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
  }
  v3.receiver = self;
  v3.super_class = (Class)_UIColorPickerRVCHostingImpl;
  [(_UIColorPickerRVCHostingImpl *)&v3 dealloc];
}

- (void)_colorPickerViewServiceDidTerminateWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIColorPicker", &_colorPickerViewServiceDidTerminateWithError____s_category)+ 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = v5;
    v7 = [v4 localizedDescription];
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Extension terminated with error: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [(_UIColorPickerRVCHostingImpl *)self _tryLaunchingExtension:3];
}

- (void)_pickerDidDismissEyedropper
{
  id v2 = [(_UIColorPickerRVCHostingImpl *)self delegateColorPickerViewController];
  [v2 _pickerDidDismissEyedropper];
}

- (void)_pickerDidFinish
{
  id v2 = [(_UIColorPickerRVCHostingImpl *)self delegateColorPickerViewController];
  [v2 _pickerDidFinish];
}

- (void)_pickerDidFloatEyedropper
{
  id v2 = [(_UIColorPickerRVCHostingImpl *)self delegateColorPickerViewController];
  [v2 _pickerDidFloatEyedropper];
}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_UIColorPickerRVCHostingImpl *)self delegateColorPickerViewController];
  [v10 _pickerDidSelectColor:v9 colorSpace:v8 isVolatile:v5];
}

- (void)_pickerDidShowEyedropper
{
  id v2 = [(_UIColorPickerRVCHostingImpl *)self delegateColorPickerViewController];
  [v2 _pickerDidShowEyedropper];
}

- (UIColorPickerViewController)delegateColorPickerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegateColorPickerViewController);
  return (UIColorPickerViewController *)WeakRetained;
}

- (void)setDelegateColorPickerViewController:(id)a3
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

- (_UIColorPickerRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->delegateColorPickerViewController);
}

@end