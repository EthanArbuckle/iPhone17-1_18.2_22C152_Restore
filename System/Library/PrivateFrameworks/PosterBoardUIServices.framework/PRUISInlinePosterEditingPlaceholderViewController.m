@interface PRUISInlinePosterEditingPlaceholderViewController
- (PRUISInlinePosterEditingPlaceholderViewControllerDelegate)delegate;
- (void)_dismissRecognizerTapped:(id)a3;
- (void)_updateBackgroundColorForWindow:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillMoveToWindow:(id)a3;
@end

@implementation PRUISInlinePosterEditingPlaceholderViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PRUISInlinePosterEditingPlaceholderViewController;
  [(PRUISInlinePosterEditingPlaceholderViewController *)&v5 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__dismissRecognizerTapped_];
  v4 = [(PRUISInlinePosterEditingPlaceholderViewController *)self view];
  [v4 addGestureRecognizer:v3];
}

- (void)_dismissRecognizerTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained placeholderViewController:self requestsDismissalWithAnimation:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PRUISInlinePosterEditingPlaceholderViewController;
  [(PRUISInlinePosterEditingPlaceholderViewController *)&v6 viewWillAppear:a3];
  v4 = [(PRUISInlinePosterEditingPlaceholderViewController *)self view];
  objc_super v5 = [v4 window];
  [(PRUISInlinePosterEditingPlaceholderViewController *)self _updateBackgroundColorForWindow:v5];
}

- (void)viewWillMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PRUISInlinePosterEditingPlaceholderViewController;
  id v4 = a3;
  [(PRUISInlinePosterEditingPlaceholderViewController *)&v5 viewWillMoveToWindow:v4];
  -[PRUISInlinePosterEditingPlaceholderViewController _updateBackgroundColorForWindow:](self, "_updateBackgroundColorForWindow:", v4, v5.receiver, v5.super_class);
}

- (void)_updateBackgroundColorForWindow:(id)a3
{
  id v4 = [a3 windowScene];
  objc_super v5 = [v4 screen];
  objc_super v6 = [v5 displayConfiguration];
  int v7 = [v6 isExternal];

  v8 = [(PRUISInlinePosterEditingPlaceholderViewController *)self view];
  if (v7)
  {
    id v11 = v8;
    v9 = [MEMORY[0x263F1C550] systemGrayColor];
    v10 = [v9 colorWithAlphaComponent:0.5];
    [v11 setBackgroundColor:v10];

    v8 = v11;
  }
}

- (PRUISInlinePosterEditingPlaceholderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PRUISInlinePosterEditingPlaceholderViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end