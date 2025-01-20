@interface _UITextFormattingSceneHostingImpl
- (UITextFormattingViewController)delegateTextFormattingViewController;
- (_UIRemoteSheet)_remoteSheet;
- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4;
- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4;
- (void)_presentTypographySettingsForFont:(id)a3;
- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4;
- (void)_textFormattingDidFinish;
- (void)clientIsReady;
- (void)setDelegateTextFormattingViewController:(id)a3;
- (void)setRemoteConfiguration:(id)a3;
- (void)setRemoteFormattingDescriptor:(id)a3;
- (void)setupRemoteHosting;
- (void)setupSceneHosting;
@end

@implementation _UITextFormattingSceneHostingImpl

- (void)setupRemoteHosting
{
  if (!self->_hostingController)
  {
    v3 = [(_UITextFormattingSceneHostingImpl *)self delegateTextFormattingViewController];
    [v3 _beginDelayingPresentation:&__block_literal_global_533 cancellationHandler:3.0];

    [(_UITextFormattingSceneHostingImpl *)self setupSceneHosting];
  }
}

- (void)setRemoteConfiguration:(id)a3
{
  hostingController = self->_hostingController;
  id v4 = +[_UITextFormattingActionHostToClient actionForConfiguration:a3];
  [(_UISceneHostingController *)hostingController sendAction:v4];
}

- (void)setRemoteFormattingDescriptor:(id)a3
{
  hostingController = self->_hostingController;
  id v4 = +[_UITextFormattingActionHostToClient actionForFormattingDescriptor:a3];
  [(_UISceneHostingController *)hostingController sendAction:v4];
}

- (void)setupSceneHosting
{
  if (!self->_hostingController)
  {
    id v11 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:@"com.apple.UIKit.FontPickerUIService"];
    v3 = [_UISceneHostingController alloc];
    id v4 = +[FBSSceneSpecification specification];
    v5 = [(_UISceneHostingController *)v3 initWithProcessIdentity:v11 sceneSpecification:v4];
    hostingController = self->_hostingController;
    self->_hostingController = v5;

    [(_UISceneHostingController *)self->_hostingController setDelegate:self];
    v7 = [(_UISceneHostingController *)self->_hostingController sceneViewController];
    v8 = [(_UITextFormattingSceneHostingImpl *)self delegateTextFormattingViewController];
    [v8 _setChildViewController:v7];

    v9 = [(_UITextFormattingSceneHostingImpl *)self delegateTextFormattingViewController];
    v10 = [v9 configuration];
    [(_UITextFormattingSceneHostingImpl *)self setRemoteConfiguration:v10];
  }
}

- (void)clientIsReady
{
  id v2 = [(_UITextFormattingSceneHostingImpl *)self delegateTextFormattingViewController];
  [v2 _endDelayingPresentation];
}

- (_UIRemoteSheet)_remoteSheet
{
  return (_UIRemoteSheet *)self->_hostingController;
}

- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UITextFormattingSceneHostingImpl *)self delegateTextFormattingViewController];
  [v8 _textFormattingDidChangeValue:v7 textAttributesData:v6];
}

- (void)_textFormattingDidFinish
{
  id v2 = [(_UITextFormattingSceneHostingImpl *)self delegateTextFormattingViewController];
  [v2 _textFormattingDidFinish];
}

- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = [(_UITextFormattingSceneHostingImpl *)self delegateTextFormattingViewController];
  objc_msgSend(v10, "_presentColorPicker:selectedColor:", v9, x, y, width, height);
}

- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UITextFormattingSceneHostingImpl *)self delegateTextFormattingViewController];
  [v8 _presentFontPickerWithConfiguration:v7 selectedFonts:v6];
}

- (void)_presentTypographySettingsForFont:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextFormattingSceneHostingImpl *)self delegateTextFormattingViewController];
  [v5 _presentTypographySettingsForFont:v4];
}

- (UITextFormattingViewController)delegateTextFormattingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegateTextFormattingViewController);
  return (UITextFormattingViewController *)WeakRetained;
}

- (void)setDelegateTextFormattingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegateTextFormattingViewController);
  objc_storeStrong((id *)&self->_hostingController, 0);
}

@end