@interface _SUUIStatusBarAlertViewController
- (BOOL)isOnScreen;
- (NSString)message;
- (UIView)statusBarView;
- (_SUUIStatusBarAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_SUUIStatusBarAlertViewControllerDelegate)delegate;
- (int64_t)style;
- (unint64_t)defaultInterfaceOrientations;
- (unint64_t)supportedInterfaceOrientations;
- (void)endAllAnimations;
- (void)handleLabelTap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)updateLabelFrame;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _SUUIStatusBarAlertViewController

- (_SUUIStatusBarAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_SUUIStatusBarAlertViewController;
  v4 = [(_SUUIStatusBarAlertViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(_SUUIStatusBarAlertViewController *)v4 setSupportedInterfaceOrientations:[(_SUUIStatusBarAlertViewController *)v4 defaultInterfaceOrientations]];
  }
  return v5;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)_SUUIStatusBarAlertViewController;
  [(_SUUIStatusBarAlertViewController *)&v14 viewDidLoad];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  label = self->_label;
  self->_label = v3;

  [(UILabel *)self->_label setTextAlignment:1];
  [(UILabel *)self->_label setNumberOfLines:1];
  [(UILabel *)self->_label setMarqueeEnabled:1];
  v5 = [MEMORY[0x263F825C8] whiteColor];
  [(UILabel *)self->_label setTextColor:v5];

  BOOL v6 = [(_SUUIStatusBarAlertViewController *)self isOnScreen];
  double v7 = 0.0;
  if (v6) {
    double v7 = 1.0;
  }
  [(UILabel *)self->_label setAlpha:v7];
  SUUIStatusBarAlertStyleGetColor((void *)[(_SUUIStatusBarAlertViewController *)self style]);
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 CGColor];
  v10 = [(UILabel *)self->_label layer];
  [v10 setBackgroundColor:v9];

  [(UILabel *)self->_label setUserInteractionEnabled:1];
  v11 = self->_label;
  v12 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleLabelTap_];
  [(UILabel *)v11 addGestureRecognizer:v12];

  v13 = [(_SUUIStatusBarAlertViewController *)self view];
  [v13 addSubview:self->_label];

  [(_SUUIStatusBarAlertViewController *)self updateLabelFrame];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  label = self->_label;
  id v6 = a4;
  [(UILabel *)label setHidden:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88___SUUIStatusBarAlertViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_265400820;
  v7[4] = self;
  [v6 animateAlongsideTransition:0 completion:v7];
}

- (void)updateLabelFrame
{
  v3 = [MEMORY[0x263F82438] sharedApplication];
  [v3 statusBarFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(_SUUIStatusBarAlertViewController *)self view];
  v13 = [(_SUUIStatusBarAlertViewController *)self view];
  objc_super v14 = [v13 window];
  objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v14, v5, v7, v9, v11);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  -[UILabel setFrame:](self->_label, "setFrame:", v16, v18, v20, v22);
  v25.origin.x = v16;
  v25.origin.y = v18;
  v25.size.width = v20;
  v25.size.height = v22;
  id v23 = [MEMORY[0x263F81708] boldSystemFontOfSize:CGRectGetHeight(v25) * 0.7];
  [(UILabel *)self->_label setFont:v23];
}

- (void)endAllAnimations
{
  id v2 = [(UILabel *)self->_label layer];
  [v2 removeAllAnimations];
}

- (void)handleLabelTap:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(_SUUIStatusBarAlertViewController *)self delegate];
    [v4 statusBarAlertViewControllerWasTapped:self];
  }
}

- (UIView)statusBarView
{
  [(_SUUIStatusBarAlertViewController *)self loadViewIfNeeded];
  label = self->_label;
  return (UIView *)label;
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    BOOL v3 = a3;
    self->_onScreen = a3;
    double v5 = 0.0;
    if (a3) {
      double v5 = 1.0;
    }
    [(UILabel *)self->_label setAlpha:v5];
    label = self->_label;
    [(UILabel *)label setMarqueeRunning:v3];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    SUUIStatusBarAlertStyleGetColor((void *)a3);
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v6 CGColor];
    double v5 = [(UILabel *)self->_label layer];
    [v5 setBackgroundColor:v4];
  }
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  [(_SUUIStatusBarAlertViewController *)self loadViewIfNeeded];
  [(UILabel *)self->_label setText:v4];

  BOOL v5 = [(_SUUIStatusBarAlertViewController *)self isOnScreen];
  label = self->_label;
  [(UILabel *)label setMarqueeRunning:v5];
}

- (NSString)message
{
  return [(UILabel *)self->_label text];
}

- (unint64_t)defaultInterfaceOrientations
{
  v3.receiver = self;
  v3.super_class = (Class)_SUUIStatusBarAlertViewController;
  return [(_SUUIStatusBarAlertViewController *)&v3 supportedInterfaceOrientations];
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (_SUUIStatusBarAlertViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SUUIStatusBarAlertViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_label, 0);
}

@end