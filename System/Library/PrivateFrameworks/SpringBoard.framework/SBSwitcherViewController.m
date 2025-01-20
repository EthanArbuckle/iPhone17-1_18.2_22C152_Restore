@interface SBSwitcherViewController
- (BOOL)shouldAutorotate;
- (SBSwitcherViewControllerDelegate)delegate;
- (int64_t)_overrideInterfaceOrientationMechanics;
- (int64_t)contentOrientation;
- (unint64_t)supportedInterfaceOrientations;
- (void)addContentView:(id)a3;
- (void)setContentOrientation:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBSwitcherViewController

- (void)setContentOrientation:(int64_t)a3
{
}

- (int64_t)_overrideInterfaceOrientationMechanics
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v4 = [WeakRetained overrideInterfaceOrientationMechanicsForSwitcherViewController:self];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherViewController;
  -[SBSwitcherViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewWillAppearForSwitcherViewController:self animated:v3];
}

- (int64_t)contentOrientation
{
  return [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView contentOrientation];
}

- (void)addContentView:(id)a3
{
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherViewController;
  [(SBSwitcherViewController *)&v9 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F4F8D0]);
  int64_t v4 = [(SBSwitcherViewController *)self view];
  [v4 bounds];
  v5 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v3, "initWithFrame:");
  contentWrapperView = self->_contentWrapperView;
  self->_contentWrapperView = v5;

  [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView setAutoresizingMask:18];
  v7 = [(SBSwitcherViewController *)self view];
  [v7 addSubview:self->_contentWrapperView];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewDidLoadForSwitcherViewController:self];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (SBSwitcherViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
}

@end