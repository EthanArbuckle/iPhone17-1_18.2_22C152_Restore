@interface UIInterfaceActionGroupViewController
- (BOOL)isSpringLoaded;
- (UIInterfaceActionGroup)actionGroup;
- (UIInterfaceActionGroupViewController)initWithActionGroup:(id)a3;
- (UIInterfaceActionVisualStyle)visualStyle;
- (UIInterfaceActionVisualStyleProviding)visualStyleProvider;
- (id)defaultVisualStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4;
- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5;
- (void)loadView;
- (void)reloadVisualStyle;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setVisualStyleProvider:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIInterfaceActionGroupViewController

- (UIInterfaceActionGroupViewController)initWithActionGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIInterfaceActionGroupViewController;
  v6 = [(UIViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_actionGroup, a3);
  }

  return v7;
}

- (void)reloadVisualStyle
{
  id v2 = [(UIInterfaceActionGroupViewController *)self actionGroupView];
  [v2 reloadVisualStyle];
}

- (void)setVisualStyleProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_visualStyleProvider, obj);
    id v5 = [(UIInterfaceActionGroupViewController *)self actionGroupView];
    [v5 setVisualStyleProvider:obj];
  }
}

- (UIInterfaceActionVisualStyleProviding)visualStyleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleProvider);
  return (UIInterfaceActionVisualStyleProviding *)WeakRetained;
}

- (UIInterfaceActionVisualStyle)visualStyle
{
  id v2 = [(UIInterfaceActionGroupViewController *)self actionGroupView];
  v3 = [v2 visualStyle];

  return (UIInterfaceActionVisualStyle *)v3;
}

- (id)defaultVisualStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = [(UIInterfaceActionGroupViewController *)self actionGroupView];
  v8 = [v7 defaultVisualStyleForTraitCollection:v6 presentationStyle:a4];

  return v8;
}

- (void)loadView
{
  v3 = [UIInterfaceActionGroupView alloc];
  v4 = [(UIInterfaceActionGroupViewController *)self actionGroup];
  id v5 = [(UIInterfaceActionGroupViewController *)self visualStyleProvider];
  id v6 = [(UIInterfaceActionGroupView *)v3 _initWithActionGroup:v4 visualStyleProvider:v5 actionHandlerInvocationDelegate:self];
  actionGroupView = self->_actionGroupView;
  self->_actionGroupView = v6;

  [(UIInterfaceActionGroupView *)self->_actionGroupView setSpringLoaded:[(UIInterfaceActionGroupViewController *)self isSpringLoaded]];
  v8 = self->_actionGroupView;
  [(UIViewController *)self setView:v8];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__UIInterfaceActionGroupViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E52DA598;
  v9[4] = self;
  id v6 = a4;
  id v7 = a3;
  [v6 animateAlongsideTransition:v9 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)UIInterfaceActionGroupViewController;
  [(UIViewController *)&v8 willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];
}

uint64_t __98__UIInterfaceActionGroupViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadVisualStyle];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionGroupViewController;
  [(UIViewController *)&v6 viewWillAppear:a3];
  actionGroupView = self->_actionGroupView;
  id v5 = [(UIViewController *)self transitionCoordinator];
  [(UIInterfaceActionGroupView *)actionGroupView configureForPresentAlongsideTransitionCoordinator:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionGroupViewController;
  [(UIViewController *)&v6 viewWillDisappear:a3];
  actionGroupView = self->_actionGroupView;
  id v5 = [(UIViewController *)self transitionCoordinator];
  [(UIInterfaceActionGroupView *)actionGroupView configureForDismissAlongsideTransitionCoordinator:v5];
}

- (void)setSpringLoaded:(BOOL)a3
{
  self->_springLoaded = a3;
  -[UIInterfaceActionGroupView setSpringLoaded:](self->_actionGroupView, "setSpringLoaded:");
}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  objc_super v9 = (void (**)(id, id, char *))a4;
  v10 = (void (**)(void))a5;
  char v11 = 1;
  if (v9 && (v9[2](v9, v8, &v11), !v11)) {
    v10[2](v10);
  }
  else {
    [(UIViewController *)self dismissViewControllerAnimated:1 completion:v10];
  }
}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (UIInterfaceActionGroup)actionGroup
{
  return self->_actionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGroup, 0);
  objc_storeStrong((id *)&self->_actionGroupView, 0);
  objc_destroyWeak((id *)&self->_visualStyleProvider);
}

@end