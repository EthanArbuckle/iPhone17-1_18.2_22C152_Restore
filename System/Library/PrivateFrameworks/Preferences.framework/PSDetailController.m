@interface PSDetailController
- (CGRect)paneFrame;
- (PSEditingPane)pane;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)loadPane;
- (void)loadView;
- (void)saveChanges;
- (void)setPane:(id)a3;
- (void)statusBarWillAnimateByHeight:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation PSDetailController

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  v3 = +[PSEditingPane defaultBackgroundColor];
  [v4 setBackgroundColor:v3];

  [(PSDetailController *)self setView:v4];
}

- (void)viewDidUnload
{
  v4.receiver = self;
  v4.super_class = (Class)PSDetailController;
  [(PSDetailController *)&v4 viewDidUnload];
  [(PSEditingPane *)self->_pane setDelegate:0];
  pane = self->_pane;
  self->_pane = 0;
}

- (void)dealloc
{
  [(PSEditingPane *)self->_pane setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PSDetailController;
  [(PSDetailController *)&v3 dealloc];
}

- (CGRect)paneFrame
{
  editPaneClass = self->super._specifier->editPaneClass;
  if (!editPaneClass) {
    editPaneClass = objc_opt_class();
  }
  objc_super v4 = [(PSDetailController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if (objc_opt_respondsToSelector())
  {
    [editPaneClass preferredHeight];
    if (v13 > 0.0) {
      double v12 = v13;
    }
  }
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PSDetailController;
  -[PSDetailController willRotateToInterfaceOrientation:duration:](&v7, sel_willRotateToInterfaceOrientation_duration_);
  [(PSEditingPane *)self->_pane willRotateToInterfaceOrientation:a3 duration:a4];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PSDetailController;
  -[PSDetailController willAnimateRotationToInterfaceOrientation:duration:](&v12, sel_willAnimateRotationToInterfaceOrientation_duration_);
  pane = self->_pane;
  [(PSDetailController *)self paneFrame];
  -[PSEditingPane setFrame:](pane, "setFrame:");
  uint64_t v9 = [(PSEditingPane *)self->_pane methodForSelector:a2];
  uint64_t v10 = +[PSEditingPane instanceMethodForSelector:a2];
  double v11 = self->_pane;
  if (v9 == v10) {
    [(PSEditingPane *)v11 layoutBelowIfNeeded];
  }
  else {
    [(PSEditingPane *)v11 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
}

- (void)setPane:(id)a3
{
  double v5 = (PSEditingPane *)a3;
  p_pane = &self->_pane;
  pane = self->_pane;
  double v8 = v5;
  double v14 = v5;
  if (pane != v5)
  {
    if (pane)
    {
      uint64_t v9 = [(PSEditingPane *)pane childViewControllerForHostingViewController];
      uint64_t v10 = v9;
      if (v9)
      {
        [v9 willMoveToParentViewController:0];
        [v10 removeFromParentViewController];
      }
      [(PSEditingPane *)*p_pane setViewController:0];
      [(PSEditingPane *)*p_pane removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_pane, a3);
    if (*p_pane)
    {
      double v11 = [(PSEditingPane *)*p_pane childViewControllerForHostingViewController];
      if (v11)
      {
        [(PSViewController *)self addChildViewController:v11];
        objc_super v12 = [(PSDetailController *)self view];
        [v12 addSubview:*p_pane];

        [v11 didMoveToParentViewController:self];
      }
      else
      {
        float v13 = [(PSDetailController *)self view];
        [v13 addSubview:*p_pane];
      }
      [(PSEditingPane *)*p_pane setViewController:self];
      if ([(PSEditingPane *)*p_pane shouldInsetContent]) {
        [(PSEditingPane *)*p_pane insetContent];
      }

      double v8 = *p_pane;
    }
    else
    {
      double v8 = 0;
    }
  }
  if ([(PSEditingPane *)v8 requiresKeyboard]) {
    [(PSEditingPane *)*p_pane becomeFirstResponder];
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PSDetailController;
  [(PSDetailController *)&v6 viewDidLayoutSubviews];
  pane = self->_pane;
  if (pane)
  {
    if ([(PSEditingPane *)pane shouldInsetContent])
    {
      objc_super v4 = self->_pane;
      double v5 = [(PSDetailController *)self view];
      [v5 bounds];
      [(PSEditingPane *)v4 layoutInsetContent:"layoutInsetContent:"];
    }
  }
}

- (PSEditingPane)pane
{
  return self->_pane;
}

- (void)loadPane
{
  if (!self->_pane)
  {
    editPaneClass = self->super._specifier->editPaneClass;
    if (!editPaneClass) {
      editPaneClass = (objc_class *)objc_opt_class();
    }
    id v4 = [editPaneClass alloc];
    [(PSDetailController *)self paneFrame];
    id v7 = (id)objc_msgSend(v4, "initWithFrame:");
    [v7 setDelegate:self];
    [v7 setPreferenceSpecifier:self->super._specifier];
    specifier = self->super._specifier;
    if (specifier->getter)
    {
      objc_super v6 = [(PSSpecifier *)specifier performGetter];
      [v7 setPreferenceValue:v6];
    }
    [(PSDetailController *)self setPane:v7];
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PSDetailController;
  [(PSViewController *)&v4 viewDidLoad];
  objc_super v3 = [(PSSpecifier *)self->super._specifier name];
  [(PSDetailController *)self setTitle:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSDetailController;
  [(PSViewController *)&v4 viewWillAppear:a3];
  [(PSDetailController *)self loadPane];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSDetailController;
  [(PSViewController *)&v4 viewDidAppear:a3];
  [(PSEditingPane *)self->_pane viewDidBecomeVisible];
}

- (void)saveChanges
{
  objc_super v3 = [(PSDetailController *)self pane];
  id v6 = [v3 preferenceSpecifier];

  objc_super v4 = [(PSDetailController *)self pane];
  double v5 = [v4 preferenceValue];

  if (v5) {
    [v6 performSetterWithValue:v5];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSDetailController;
  [(PSViewController *)&v6 viewWillDisappear:a3];
  objc_super v4 = [(PSDetailController *)self pane];
  char v5 = [v4 handlesDoneButton];

  if ((v5 & 1) == 0) {
    [(PSDetailController *)self saveChanges];
  }
}

- (void)statusBarWillAnimateByHeight:(double)a3
{
  [(PSEditingPane *)self->_pane frame];
  v9[1] = 3221225472;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[2] = __51__PSDetailController_statusBarWillAnimateByHeight___block_invoke;
  v9[3] = &unk_1E5C5DFE8;
  v9[4] = self;
  v9[5] = v5;
  v9[6] = v6;
  v9[7] = v7;
  *(double *)&v9[8] = v8 + a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v9 options:0 animations:0.35 completion:0.0];
}

uint64_t __51__PSDetailController_statusBarWillAnimateByHeight___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1024), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(*(void *)(a1 + 32) + 1024);
  return [v2 layoutIfNeeded];
}

- (void).cxx_destruct
{
}

@end