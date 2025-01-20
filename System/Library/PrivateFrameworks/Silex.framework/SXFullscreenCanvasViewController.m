@interface SXFullscreenCanvasViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)isTransitioning;
- (BOOL)prefersStatusBarHidden;
- (SXFullscreenCanvasViewControllerDelegate)delegate;
- (id)keyCommands;
- (int64_t)preferredStatusBarUpdateAnimation;
- (int64_t)statusBarStyle;
- (void)dismiss;
- (void)scrollToNext;
- (void)scrollToPrevious;
- (void)setDelegate:(id)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SXFullscreenCanvasViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SXFullscreenCanvasViewController;
  [(SXFullscreenCanvasViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3D0] modifierFlags:0 action:sel_dismiss];
  [v3 setWantsPriorityOverSystemBehavior:1];
  v4 = [MEMORY[0x263F1C708] keyCommandWithInput:@" " modifierFlags:0 action:sel_dismiss];
  [v4 setWantsPriorityOverSystemBehavior:1];
  [(SXFullscreenCanvasViewController *)self addKeyCommand:v3];
  [(SXFullscreenCanvasViewController *)self addKeyCommand:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenCanvasViewController;
  [(SXFullscreenCanvasViewController *)&v4 viewWillAppear:a3];
  [(SXFullscreenCanvasViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenCanvasViewController;
  [(SXFullscreenCanvasViewController *)&v4 viewDidAppear:a3];
  [(SXFullscreenCanvasViewController *)self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
  [(SXFullscreenCanvasViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden
{
  return ![(SXFullscreenCanvasViewController *)self isTransitioning];
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SXFullscreenCanvasViewController;
  -[SXFullscreenCanvasViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = [(SXFullscreenCanvasViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(SXFullscreenCanvasViewController *)self delegate];
    objc_msgSend(v10, "fullscreenCanvasViewController:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);
  }
}

- (void)dismiss
{
  v3 = [(SXFullscreenCanvasViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SXFullscreenCanvasViewController *)self delegate];
    [v5 fullScreenCanvasViewControllerWantsToDismiss:self];
  }
}

- (void)scrollToNext
{
  id v2 = [(SXFullscreenCanvasViewController *)self delegate];
  [v2 handleNextCommand];
}

- (void)scrollToPrevious
{
  id v2 = [(SXFullscreenCanvasViewController *)self delegate];
  [v2 handlePreviousCommand];
}

- (id)keyCommands
{
  v7[3] = *MEMORY[0x263EF8340];
  if ([(SXFullscreenCanvasViewController *)self isTransitioning])
  {
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v3 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3D0] modifierFlags:0 action:sel_dismiss];
    [v3 setWantsPriorityOverSystemBehavior:1];
    char v4 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3E0] modifierFlags:0 action:sel_scrollToNext];
    [v4 setWantsPriorityOverSystemBehavior:1];
    id v5 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3D8] modifierFlags:0 action:sel_scrollToPrevious];
    [v5 setWantsPriorityOverSystemBehavior:1];
    v7[0] = v3;
    v7[1] = v4;
    v7[2] = v5;
    id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  }
  return v2;
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyle = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (SXFullscreenCanvasViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXFullscreenCanvasViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end