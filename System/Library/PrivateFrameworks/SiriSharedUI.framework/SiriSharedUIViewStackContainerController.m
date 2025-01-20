@interface SiriSharedUIViewStackContainerController
- (BOOL)_canShowWhileLocked;
- (SiriSharedUIViewStackContainer)viewStackContainer;
- (void)loadView;
- (void)viewStackContainer:(id)a3 didBeginHostingChildViewController:(id)a4;
- (void)viewStackContainer:(id)a3 willBeginHostingChildViewController:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SiriSharedUIViewStackContainerController

- (void)loadView
{
  v3 = [SiriSharedUIViewStackContainer alloc];
  v4 = -[SiriSharedUIViewStackContainer initWithFrame:contentViews:](v3, "initWithFrame:contentViews:", MEMORY[0x263EFFA68], *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(SiriSharedUIViewStackContainer *)v4 setDelegate:self];
  [(SiriSharedUIViewStackContainerController *)self setView:v4];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUIViewStackContainerController;
  id v6 = a4;
  [(SiriSharedUIViewStackContainerController *)&v8 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __102__SiriSharedUIViewStackContainerController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_2640E3A00;
  v7[4] = self;
  [v6 animateAlongsideTransition:v7 completion:0];
}

void __102__SiriSharedUIViewStackContainerController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewStackContainer];
  [v1 relayout];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUIViewStackContainerController;
  id v7 = a4;
  -[SiriSharedUIViewStackContainerController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__SiriSharedUIViewStackContainerController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_2640E3A00;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __95__SiriSharedUIViewStackContainerController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewStackContainer];
  [v1 updateConstraints];
}

- (SiriSharedUIViewStackContainer)viewStackContainer
{
  v2 = [(SiriSharedUIViewStackContainerController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (void)viewStackContainer:(id)a3 willBeginHostingChildViewController:(id)a4
{
}

- (void)viewStackContainer:(id)a3 didBeginHostingChildViewController:(id)a4
{
}

- (BOOL)_canShowWhileLocked
{
  v2 = [MEMORY[0x263F75488] sharedInstance];
  char v3 = [v2 isSiriSafeForLockScreen];

  return v3;
}

@end