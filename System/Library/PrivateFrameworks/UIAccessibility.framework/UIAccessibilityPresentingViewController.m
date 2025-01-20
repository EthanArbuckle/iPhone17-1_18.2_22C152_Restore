@interface UIAccessibilityPresentingViewController
- (UIAccessibilityPresentingViewController)init;
- (void)_cleanUpPresentationWindow;
- (void)_voiceOverStatusChanged;
- (void)dealloc;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)loadView;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation UIAccessibilityPresentingViewController

- (UIAccessibilityPresentingViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityPresentingViewController;
  v2 = [(UIAccessibilityPresentingViewController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__voiceOverStatusChanged name:*MEMORY[0x1E4F43580] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43580] object:0];
  [(UIAccessibilityPresentingViewController *)self _cleanUpPresentationWindow];

  v4.receiver = self;
  v4.super_class = (Class)UIAccessibilityPresentingViewController;
  [(UIAccessibilityPresentingViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 setBackgroundColor:v3];

  [(UIAccessibilityPresentingViewController *)self setView:v4];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = (objc_class *)MEMORY[0x1E4F43058];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  v12 = [(UIAccessibilityPresentingViewController *)self _screen];
  [v12 bounds];
  v13 = (UIWindow *)objc_msgSend(v11, "initWithFrame:");
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = v13;

  [(UIWindow *)self->_presentationWindow setWindowLevel:*MEMORY[0x1E4F43628]];
  v15 = [(UIAccessibilityPresentingViewController *)self view];
  [(UIWindow *)self->_presentationWindow bounds];
  objc_msgSend(v15, "setFrame:");
  [(UIWindow *)self->_presentationWindow setRootViewController:self];
  [(UIWindow *)self->_presentationWindow addSubview:v15];
  [(UIWindow *)self->_presentationWindow makeKeyAndVisible];
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityPresentingViewController;
  [(UIAccessibilityPresentingViewController *)&v16 presentViewController:v10 animated:v5 completion:v9];
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__UIAccessibilityPresentingViewController_dismissViewControllerWithTransition_completion___block_invoke;
  aBlock[3] = &unk_1E59B9D48;
  aBlock[4] = self;
  id v11 = v6;
  id v7 = v6;
  v8 = _Block_copy(aBlock);
  v9.receiver = self;
  v9.super_class = (Class)UIAccessibilityPresentingViewController;
  [(UIAccessibilityPresentingViewController *)&v9 dismissViewControllerWithTransition:v4 completion:v8];
}

uint64_t __90__UIAccessibilityPresentingViewController_dismissViewControllerWithTransition_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 _cleanUpPresentationWindow];
}

- (void)_cleanUpPresentationWindow
{
  [(UIWindow *)self->_presentationWindow setHidden:1];
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = 0;
}

- (void)_voiceOverStatusChanged
{
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v3 = [(UIAccessibilityPresentingViewController *)self presentedViewController];

    if (v3)
    {
      [(UIAccessibilityPresentingViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void).cxx_destruct
{
}

@end