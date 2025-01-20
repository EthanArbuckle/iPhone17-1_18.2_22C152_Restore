@interface SAUIMonolithicElementViewController
- (SAUIMonolithicElementViewController)initWithMonolithicElementViewProvider:(id)a3;
- (SAUIMonolithicElementViewProviding)elementViewProvider;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SAUIMonolithicElementViewController

- (SAUIMonolithicElementViewController)initWithMonolithicElementViewProvider:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SAUIMonolithicElementViewController;
  return [(SAUILayoutSpecifyingElementViewController *)&v4 initWithElementViewProvider:a3];
}

- (SAUIMonolithicElementViewProviding)elementViewProvider
{
  v6.receiver = self;
  v6.super_class = (Class)SAUIMonolithicElementViewController;
  v2 = [(SAUILayoutSpecifyingElementViewController *)&v6 elementViewProvider];
  if (objc_opt_respondsToSelector()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  objc_super v4 = v3;

  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SAUIMonolithicElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v6 viewDidLoad];
  v3 = [(SAUIMonolithicElementViewController *)self view];
  [v3 setClipsToBounds:1];
  objc_super v4 = [(SAUIMonolithicElementViewController *)self elementViewProvider];
  v5 = [v4 monolithicView];
  [v3 addSubview:v5];
}

- (void)viewWillLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SAUIMonolithicElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v28 viewWillLayoutSubviews];
  v3 = [(SAUIMonolithicElementViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SAUIMonolithicElementViewController *)self elementViewProvider];
  v13 = [v12 monolithicView];

  objc_msgSend(v13, "sizeThatFits:", v9, v11);
  BSRectWithSize();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  int64_t v22 = [(SAUILayoutSpecifyingElementViewController *)self layoutMode];
  if (v22 != 3)
  {
    if (v22 == 2)
    {
      uint64_t v27 = 0;
      UIRectCenteredIntegralRectScale();
      double v5 = v23;
      double v7 = v24;
      double v9 = v25;
      double v11 = v26;
    }
    else
    {
      double v9 = v19;
      double v11 = v21;
      double v7 = v17;
      double v5 = v15;
    }
  }
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11, v27);
}

@end