@interface UIKeyboardCameraViewController
+ (BOOL)isCameraRestricted;
+ (BOOL)isEnabled;
+ (BOOL)isLiveTextEnabled;
+ (BOOL)isSupportedByDevice;
+ (void)_updateIsCameraRestricted;
- (BOOL)_canShowWhileLocked;
- (NSExtension)extension;
- (NSString)textContentType;
- (UIKeyboardCameraRemoteViewController)remoteViewController;
- (UIKeyboardCameraViewController)init;
- (UIKeyboardCameraViewControllerDelegate)delegate;
- (id)_backgroundColorForModalFormSheet;
- (void)keyboardCameraDidAccept;
- (void)keyboardCameraDidCancel;
- (void)keyboardCameraDidUpdateString:(id)a3;
- (void)prepareWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setTextContentType:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UIKeyboardCameraViewController

+ (BOOL)isLiveTextEnabled
{
  v2 = +[_UIKeyboardCameraLiveTextEnabledObserver sharedInstance];
  char v3 = [v2 isLiveTextEnabled];

  return v3;
}

+ (void)_updateIsCameraRestricted
{
  _MergedGlobals_1_27 = MGGetBoolAnswer();
}

+ (BOOL)isCameraRestricted
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!qword_1EB25BF70)
  {
    [a1 _updateIsCameraRestricted];
    objc_initWeak(&location, a1);
    v8[0] = @"cameraRestriction";
    char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v4 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v6, &location);
    qword_1EB25BF70 = MGRegisterForUpdates();

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return _MergedGlobals_1_27;
}

void __52__UIKeyboardCameraViewController_isCameraRestricted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateIsCameraRestricted];
    id WeakRetained = v2;
  }
}

+ (BOOL)isSupportedByDevice
{
  if (qword_1EB25BF78 != -1) {
    dispatch_once(&qword_1EB25BF78, &__block_literal_global_25_6);
  }
  return byte_1EB25BF59;
}

uint64_t __53__UIKeyboardCameraViewController_isSupportedByDevice__block_invoke()
{
  uint64_t result = MGIsQuestionValid();
  if (result)
  {
    uint64_t result = MGGetBoolAnswer();
    if (result) {
      uint64_t result = MGGetBoolAnswer();
    }
  }
  byte_1EB25BF59 = result;
  return result;
}

+ (BOOL)isEnabled
{
  int v3 = [a1 isSupportedByDevice];
  if (v3)
  {
    int v3 = [a1 isLiveTextEnabled];
    if (v3) {
      LOBYTE(v3) = [a1 isCameraRestricted] ^ 1;
    }
  }
  return v3;
}

- (UIKeyboardCameraViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardCameraViewController;
  return [(UIViewController *)&v3 initWithNibName:0 bundle:0];
}

- (id)_backgroundColorForModalFormSheet
{
  return +[UIColor clearColor];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCameraViewController;
  [(UIViewController *)&v5 viewDidLoad];
  objc_super v3 = +[UIColor blackColor];
  id v4 = [(UIViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCameraViewController;
  [(UIViewController *)&v5 viewDidDisappear:a3];
  id v4 = [(UIKeyboardCameraViewController *)self remoteViewController];
  [v4 removeFromParentViewController];

  [(UIKeyboardCameraViewController *)self setRemoteViewController:0];
  [(UIKeyboardCameraViewController *)self setExtension:0];
}

- (void)prepareWithCompletion:(id)a3
{
  id v4 = a3;
  if (+[UIKeyboardCameraViewController isSupportedByDevice])
  {
    objc_super v5 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.VisionKit.KeyboardCamera" error:0];
    [(UIKeyboardCameraViewController *)self setExtension:v5];

    objc_initWeak(&location, self);
    id v6 = [(UIKeyboardCameraViewController *)self extension];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__UIKeyboardCameraViewController_prepareWithCompletion___block_invoke;
    v7[3] = &unk_1E52E8680;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [v6 instantiateViewControllerWithInputItems:MEMORY[0x1E4F1CBF0] connectionHandler:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __56__UIKeyboardCameraViewController_prepareWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = v6;
    if (v8 && !a4)
    {
      id v35 = v6;
      [WeakRetained setRemoteViewController:v8];
      [v8 setDelegate:WeakRetained];
      id v9 = [v8 serviceViewControllerProxy];
      v10 = [WeakRetained textContentType];
      v34 = v9;
      [v9 setTextContentType:v10];

      [WeakRetained addChildViewController:v8];
      v11 = [v8 view];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
      v12 = [WeakRetained view];
      [v12 addSubview:v11];

      v26 = (void *)MEMORY[0x1E4F5B268];
      v32 = [v11 topAnchor];
      v33 = [WeakRetained view];
      v31 = [v33 topAnchor];
      v30 = [v32 constraintEqualToAnchor:v31];
      v36[0] = v30;
      v28 = [v11 leftAnchor];
      v29 = [WeakRetained view];
      v27 = [v29 leftAnchor];
      v25 = [v28 constraintEqualToAnchor:v27];
      v36[1] = v25;
      v23 = [v11 rightAnchor];
      v24 = [WeakRetained view];
      v13 = [v24 rightAnchor];
      v14 = [v23 constraintEqualToAnchor:v13];
      v36[2] = v14;
      v15 = [v11 bottomAnchor];
      v16 = [WeakRetained view];
      v17 = [v16 bottomAnchor];
      v18 = [v15 constraintEqualToAnchor:v17];
      v36[3] = v18;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
      v19 = uint64_t v22 = a1;
      [v26 activateConstraints:v19];

      uint64_t v20 = *(void *)(v22 + 32);
      if (v20) {
        (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, 1);
      }

      id v6 = v35;
    }
  }
  else
  {
    uint64_t v21 = *(void *)(a1 + 32);
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
    }
  }
}

- (void)keyboardCameraDidUpdateString:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardCameraViewController *)self delegate];
  [v5 keyboardCameraDidUpdateString:v4];
}

- (void)keyboardCameraDidAccept
{
  id v2 = [(UIKeyboardCameraViewController *)self delegate];
  [v2 keyboardCameraDidAccept];
}

- (void)keyboardCameraDidCancel
{
  id v2 = [(UIKeyboardCameraViewController *)self delegate];
  [v2 keyboardCameraDidCancel];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIKeyboardCameraViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardCameraViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  self->_textContentType = (NSString *)a3;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (UIKeyboardCameraRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end