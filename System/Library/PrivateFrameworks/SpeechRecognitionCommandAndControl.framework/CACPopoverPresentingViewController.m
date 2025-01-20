@interface CACPopoverPresentingViewController
- (BOOL)_canShowWhileLocked;
- (CGRect)portraitUpSourceRect;
- (UIPopoverPresentationControllerDelegate)popoverPresentationDelegate;
- (UIViewController)viewControllerInPopover;
- (unint64_t)permittedArrowDirections;
- (void)loadView;
- (void)setPermittedArrowDirections:(unint64_t)a3;
- (void)setPopoverPresentationDelegate:(id)a3;
- (void)setPortraitUpSourceRect:(CGRect)a3;
- (void)setViewControllerInPopover:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CACPopoverPresentingViewController

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x263F82E00]);
  v3 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v3];

  [(CACPopoverPresentingViewController *)self setView:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CACPopoverPresentingViewController;
  [(CACPopoverPresentingViewController *)&v19 viewDidAppear:a3];
  [MEMORY[0x263F82AA8] _setAlwaysAllowPopoverPresentations:1];
  id v4 = [(CACPopoverPresentingViewController *)self viewControllerInPopover];
  [v4 setModalPresentationStyle:7];

  v5 = [(CACPopoverPresentingViewController *)self viewControllerInPopover];
  v6 = [v5 popoverPresentationController];

  v7 = [(CACPopoverPresentingViewController *)self view];
  [v6 setSourceView:v7];

  [(CACPopoverPresentingViewController *)self portraitUpSourceRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(CACPopoverPresentingViewController *)self view];
  objc_msgSend(v6, "setSourceRect:", CACViewRectFromPortraitUpRect(v16, v9, v11, v13, v15));

  [v6 setCanOverlapSourceViewRect:1];
  v17 = [(CACPopoverPresentingViewController *)self popoverPresentationDelegate];
  [v6 setDelegate:v17];

  objc_msgSend(v6, "setPermittedArrowDirections:", -[CACPopoverPresentingViewController permittedArrowDirections](self, "permittedArrowDirections"));
  v18 = [(CACPopoverPresentingViewController *)self viewControllerInPopover];
  [(CACPopoverPresentingViewController *)self presentViewController:v18 animated:1 completion:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x263F82AA8] _setAlwaysAllowPopoverPresentations:0];
  v5.receiver = self;
  v5.super_class = (Class)CACPopoverPresentingViewController;
  [(CACPopoverPresentingViewController *)&v5 viewWillDisappear:v3];
  [(CACPopoverPresentingViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIPopoverPresentationControllerDelegate)popoverPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverPresentationDelegate);
  return (UIPopoverPresentationControllerDelegate *)WeakRetained;
}

- (void)setPopoverPresentationDelegate:(id)a3
{
}

- (UIViewController)viewControllerInPopover
{
  return self->_viewControllerInPopover;
}

- (void)setViewControllerInPopover:(id)a3
{
}

- (CGRect)portraitUpSourceRect
{
  double x = self->_portraitUpSourceRect.origin.x;
  double y = self->_portraitUpSourceRect.origin.y;
  double width = self->_portraitUpSourceRect.size.width;
  double height = self->_portraitUpSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPortraitUpSourceRect:(CGRect)a3
{
  self->_portraitUpSourceRect = a3;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerInPopover, 0);
  objc_destroyWeak((id *)&self->_popoverPresentationDelegate);
}

@end