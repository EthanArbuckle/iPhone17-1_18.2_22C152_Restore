@interface VUIPresentationContainerViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (void)loadView;
- (void)tapped;
- (void)viewDidLayoutSubviews;
@end

@implementation VUIPresentationContainerViewController

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)VUIPresentationContainerViewController;
  [(VUIPresentationContainerViewController *)&v7 loadView];
  v3 = [(VUIPresentationContainerViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapped];
  v6 = [(VUIPresentationContainerViewController *)self view];
  [v6 addGestureRecognizer:v5];

  [v5 setDelegate:self];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  v5 = objc_msgSend(a4, "view", a3);
  v6 = [(VUIPresentationContainerViewController *)self view];
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (void)tapped
{
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)VUIPresentationContainerViewController;
  [(VUIPresentationContainerViewController *)&v15 viewDidLayoutSubviews];
  v3 = [(VUIPresentationContainerViewController *)self childViewControllers];
  v4 = [v3 lastObject];

  v5 = [v4 view];
  v6 = [(VUIPresentationContainerViewController *)self view];
  [v6 bounds];

  objc_super v7 = self;
  [(VUIPresentationContainerViewController *)v7 preferredContentSize];
  if (*MEMORY[0x1E4F1DB30] == v9 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(VUIPresentationContainerViewController *)v7 topViewController];
    }
    else
    {
      v12 = [(VUIPresentationContainerViewController *)v7 childViewControllers];
      uint64_t v13 = [v12 count];

      if (!v13) {
        goto LABEL_11;
      }
      v14 = [(VUIPresentationContainerViewController *)v7 childViewControllers];
      v11 = [v14 lastObject];
    }
    [v11 preferredContentSize];
  }
LABEL_11:
  UIRectCenteredIntegralRect();
  objc_msgSend(v5, "setFrame:");
}

@end