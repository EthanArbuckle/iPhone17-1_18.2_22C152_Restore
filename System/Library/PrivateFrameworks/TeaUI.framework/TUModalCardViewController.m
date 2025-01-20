@interface TUModalCardViewController
- (BOOL)usesMaterialBackground;
- (TUModalCardViewController)initWithRootViewController:(id)a3;
- (TUModalCardViewController)initWithRootViewController:(id)a3 useMaterialBackground:(BOOL)a4;
- (UIButton)closeButton;
- (UIViewController)rootViewController;
- (UIVisualEffectView)backgroundView;
- (id)onDisappear;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)handleClose;
- (void)setOnDisappear:(id)a3;
- (void)setUsesMaterialBackground:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TUModalCardViewController

- (TUModalCardViewController)initWithRootViewController:(id)a3
{
  return [(TUModalCardViewController *)self initWithRootViewController:a3 useMaterialBackground:0];
}

- (TUModalCardViewController)initWithRootViewController:(id)a3 useMaterialBackground:(BOOL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUModalCardViewController;
  v8 = [(TUModalCardViewController *)&v14 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_rootViewController, a3);
    v9->_usesMaterialBackground = a4;
    v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if (v11)
    {
      [(TUModalCardViewController *)v9 setModalPresentationStyle:2];
    }
    else
    {
      [(TUModalCardViewController *)v9 setModalPresentationStyle:7];
      v12 = [(TUModalCardViewController *)v9 popoverPresentationController];
      [v12 setDelegate:v9];
    }
  }

  return v9;
}

- (void)viewDidLoad
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)TUModalCardViewController;
  [(TUModalCardViewController *)&v23 viewDidLoad];
  if (self->_usesMaterialBackground)
  {
    v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
    v4 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v3];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    v6 = [(TUModalCardViewController *)self view];
    [v6 addSubview:self->_backgroundView];
  }
  id v7 = [(TUModalCardViewController *)self rootViewController];
  [v7 willMoveToParentViewController:self];

  v8 = [(TUModalCardViewController *)self view];
  v9 = [(TUModalCardViewController *)self rootViewController];
  v10 = [v9 view];
  [v8 addSubview:v10];

  uint64_t v11 = [(TUModalCardViewController *)self rootViewController];
  [(TUModalCardViewController *)self addChildViewController:v11];

  v12 = [MEMORY[0x1E4FB14D0] buttonWithType:7];
  closeButton = self->_closeButton;
  self->_closeButton = v12;

  objc_super v14 = [(TUModalCardViewController *)self view];
  v15 = [(TUModalCardViewController *)self closeButton];
  [v14 addSubview:v15];

  v16 = [(TUModalCardViewController *)self closeButton];
  v24[0] = v16;
  v17 = [(TUModalCardViewController *)self rootViewController];
  v18 = [v17 view];
  v24[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v20 = [(TUModalCardViewController *)self view];
  [v20 setAccessibilityElements:v19];

  v21 = [MEMORY[0x1E4FB1618] clearColor];
  v22 = [(TUModalCardViewController *)self view];
  [v22 setBackgroundColor:v21];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUModalCardViewController;
  [(TUModalCardViewController *)&v6 viewDidDisappear:a3];
  v4 = [(TUModalCardViewController *)self onDisappear];

  if (v4)
  {
    v5 = [(TUModalCardViewController *)self onDisappear];
    v5[2]();
  }
}

- (void)viewDidLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)TUModalCardViewController;
  [(TUModalCardViewController *)&v21 viewDidLayoutSubviews];
  if (self->_usesMaterialBackground)
  {
    backgroundView = self->_backgroundView;
    v4 = [(TUModalCardViewController *)self view];
    [v4 bounds];
    -[UIVisualEffectView setFrame:](backgroundView, "setFrame:");
  }
  v5 = [(TUModalCardViewController *)self rootViewController];
  objc_super v6 = [v5 view];
  id v7 = [(TUModalCardViewController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");

  v8 = [(TUModalCardViewController *)self closeButton];
  [v8 sizeToFit];

  v9 = (void *)MEMORY[0x1E4FB1EB0];
  v10 = [(TUModalCardViewController *)self view];
  uint64_t v11 = objc_msgSend(v9, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v10, "semanticContentAttribute"));

  double v12 = 16.0;
  if (v11 != 1)
  {
    v13 = [(TUModalCardViewController *)self view];
    [v13 bounds];
    double MaxX = CGRectGetMaxX(v22);
    v15 = [(TUModalCardViewController *)self closeButton];
    [v15 bounds];
    double v12 = MaxX - CGRectGetWidth(v23) + -16.0;
  }
  v16 = [(TUModalCardViewController *)self closeButton];
  v17 = [(TUModalCardViewController *)self closeButton];
  [v17 bounds];
  double Width = CGRectGetWidth(v24);
  v19 = [(TUModalCardViewController *)self closeButton];
  [v19 bounds];
  objc_msgSend(v16, "setFrame:", v12, 16.0, Width, CGRectGetHeight(v25));

  v20 = [(TUModalCardViewController *)self closeButton];
  [v20 addTarget:self action:sel_handleClose forControlEvents:64];
}

- (void)handleClose
{
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FB22A0];
  id v5 = a4;
  objc_super v6 = [v4 _mediumDetent];
  v9[0] = v6;
  id v7 = [MEMORY[0x1E4FB22A0] _largeDetent];
  v9[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v5 _setDetents:v8];

  [v5 _setWidthFollowsPreferredContentSizeWhenBottomAttached:1];
  [v5 _setWantsBottomAttachedInCompactHeight:1];
}

- (id)onDisappear
{
  return self->_onDisappear;
}

- (void)setOnDisappear:(id)a3
{
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (BOOL)usesMaterialBackground
{
  return self->_usesMaterialBackground;
}

- (void)setUsesMaterialBackground:(BOOL)a3
{
  self->_usesMaterialBackground = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong(&self->_onDisappear, 0);
}

@end