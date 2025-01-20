@interface _UIColorPickerSceneHostingImpl
- (UIColorPickerViewController)delegateColorPickerViewController;
- (_UIRemoteSheet)_remoteSheet;
- (void)_pickerDidDismissEyedropper;
- (void)_pickerDidFinish;
- (void)_pickerDidFloatEyedropper;
- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5;
- (void)_pickerDidShowEyedropper;
- (void)clientIsReady;
- (void)dismissEyedropper:(BOOL)a3;
- (void)setDelegateColorPickerViewController:(id)a3;
- (void)setRemoteConfiguration:(id)a3;
- (void)setRemoteSelectedColor:(id)a3;
- (void)setupRemoteHosting;
@end

@implementation _UIColorPickerSceneHostingImpl

- (void)setupRemoteHosting
{
  if (!self->_hostingController)
  {
    v3 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
    [v3 _beginDelayingPresentation:&__block_literal_global_432 cancellationHandler:3.0];

    id v12 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:@"com.apple.UIKit.ColorPickerUIService"];
    v4 = [_UISceneHostingController alloc];
    v5 = +[FBSSceneSpecification specification];
    v6 = [(_UISceneHostingController *)v4 initWithProcessIdentity:v12 sceneSpecification:v5];
    hostingController = self->_hostingController;
    self->_hostingController = v6;

    [(_UISceneHostingController *)self->_hostingController setDelegate:self];
    v8 = [(_UISceneHostingController *)self->_hostingController sceneViewController];
    v9 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
    [v9 _setChildViewController:v8];

    v10 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
    v11 = [v10 configuration];
    [(_UIColorPickerSceneHostingImpl *)self setRemoteConfiguration:v11];
  }
}

- (void)setRemoteSelectedColor:(id)a3
{
  id v4 = a3;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v4 CGColor]);
  CGColorSpaceGetName(ColorSpace);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = +[_UIColorPickerActionHostToClient actionForSelectedColor:v4 withColorSpace:v7];

  [(_UISceneHostingController *)self->_hostingController sendAction:v6];
}

- (void)setRemoteConfiguration:(id)a3
{
  id v4 = +[_UIColorPickerActionHostToClient actionForConfiguration:a3];
  [(_UISceneHostingController *)self->_hostingController sendAction:v4];
}

- (void)dismissEyedropper:(BOOL)a3
{
  id v4 = +[_UIColorPickerActionHostToClient actionForDismissEyeDropper:a3];
  [(_UISceneHostingController *)self->_hostingController sendAction:v4];
}

- (void)clientIsReady
{
  v3 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
  id v4 = [v3 _selectedColor];
  [(_UIColorPickerSceneHostingImpl *)self setRemoteSelectedColor:v4];

  id v5 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
  [v5 _endDelayingPresentation];
}

- (_UIRemoteSheet)_remoteSheet
{
  return 0;
}

- (void)_pickerDidDismissEyedropper
{
  v3 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
  [v3 _pickerDidDismissEyedropper];

  [(BSInvalidatable *)self->_foregroundAssertion invalidate];
  foregroundAssertion = self->_foregroundAssertion;
  self->_foregroundAssertion = 0;
}

- (void)_pickerDidFinish
{
  id v2 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
  [v2 _pickerDidFinish];
}

- (void)_pickerDidFloatEyedropper
{
  id v2 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
  [v2 _pickerDidFloatEyedropper];
}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
  [v10 _pickerDidSelectColor:v9 colorSpace:v8 isVolatile:v5];
}

- (void)_pickerDidShowEyedropper
{
  v3 = [(_UIColorPickerSceneHostingImpl *)self delegateColorPickerViewController];
  [v3 _pickerDidShowEyedropper];

  id v6 = [(_UISceneHostingController *)self->_hostingController activationStateComponent];
  id v4 = [v6 foregroundAssertionForReason:@"eyedropper"];
  foregroundAssertion = self->_foregroundAssertion;
  self->_foregroundAssertion = v4;
}

- (UIColorPickerViewController)delegateColorPickerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegateColorPickerViewController);
  return (UIColorPickerViewController *)WeakRetained;
}

- (void)setDelegateColorPickerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegateColorPickerViewController);
  objc_storeStrong((id *)&self->_foregroundAssertion, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
}

@end