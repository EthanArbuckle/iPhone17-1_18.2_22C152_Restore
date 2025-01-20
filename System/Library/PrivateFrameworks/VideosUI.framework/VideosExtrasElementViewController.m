@interface VideosExtrasElementViewController
+ (id)_borderView;
- (BOOL)isWide;
- (VideosExtrasElementViewController)init;
- (id)_installBackdrop:(id)a3;
- (id)backgroundViewController;
- (unint64_t)extrasSize;
- (void)_configureBannerWithElement:(id)a3;
- (void)_didActivateButtonWithItem:(id)a3;
- (void)configureBackgroundWithElements:(id)a3;
- (void)dealloc;
- (void)setWide:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VideosExtrasElementViewController

- (VideosExtrasElementViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasElementViewController;
  v2 = [(VideosExtrasElementViewController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    v2->_wide = [v3 userInterfaceIdiom] == 1;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VideosExtrasElementViewController;
  [(VideosExtrasElementViewController *)&v2 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasElementViewController;
  [(VideosExtrasElementViewController *)&v4 viewWillAppear:a3];
  [(VideosExtrasElementViewController *)self _prepareLayout];
}

- (unint64_t)extrasSize
{
  objc_super v2 = [(VideosExtrasElementViewController *)self view];
  [v2 bounds];
  double v4 = v3;

  if (v4 <= 480.0) {
    return 0;
  }
  if (v4 <= 568.0) {
    return 1;
  }
  if (v4 <= 687.0) {
    return 2;
  }
  unint64_t result = 3;
  if (v4 > 736.0 && v4 > 812.0)
  {
    if (v4 <= 896.0) {
      return 3;
    }
    else {
      return 4;
    }
  }
  return result;
}

- (id)backgroundViewController
{
  return self->_backgroundViewController;
}

+ (id)_borderView
{
  objc_super v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
  double v3 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.1];
  [v2 setBackgroundColor:v3];

  double v4 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  v7 = [v4 constraintWithItem:v2 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0 / v6];

  [v2 addConstraint:v7];
  return v2;
}

- (void)configureBackgroundWithElements:(id)a3
{
  id v10 = a3;
  backgroundViewController = self->_backgroundViewController;
  if (backgroundViewController)
  {
    [(VideosExtrasBackgroundViewController *)backgroundViewController willMoveToParentViewController:0];
    objc_super v5 = [(VideosExtrasBackgroundViewController *)self->_backgroundViewController view];
    [v5 removeFromSuperview];

    [(VideosExtrasBackgroundViewController *)self->_backgroundViewController removeFromParentViewController];
  }
  double v6 = [[VideosExtrasBackgroundViewController alloc] initWithBackgroundElements:v10];
  v7 = self->_backgroundViewController;
  self->_backgroundViewController = v6;

  v8 = [(VideosExtrasElementViewController *)self view];
  v9 = [(VideosExtrasBackgroundViewController *)self->_backgroundViewController view];
  [v8 bounds];
  objc_msgSend(v9, "setFrame:");
  [(VideosExtrasElementViewController *)self addChildViewController:self->_backgroundViewController];
  [v8 addSubview:v9];
  [(VideosExtrasBackgroundViewController *)self->_backgroundViewController didMoveToParentViewController:self];
}

- (void)_configureBannerWithElement:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  bannerButtonMap = self->_bannerButtonMap;
  self->_bannerButtonMap = v5;

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v24 = v4;
  [v4 buttons];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          v13 = [v12 text];
          v14 = [v13 text];
          v15 = [v14 string];

          v16 = [(VideosExtrasElementViewController *)self navigationController];
          v17 = [v16 navigationBar];
          v18 = +[VideosExtrasNavigationBarButton extrasNavigationButton:](VideosExtrasNavigationBarButton, "extrasNavigationButton:", [v17 _activeBarMetrics]);

          [v18 setTitle:v15 forState:0];
          [v18 addTarget:self action:sel__didActivateButtonWithItem_ forControlEvents:64];
          [v18 sizeToFit];
          v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v18];
          [(NSMapTable *)self->_bannerButtonMap setObject:v12 forKey:v18];

          [v25 addObject:v19];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
  v20 = [(VideosExtrasElementViewController *)self navigationItem];
  [v20 setRightBarButtonItems:v25];

  v21 = [v24 title];
  v22 = [v21 text];
  v23 = [v22 string];

  [(VideosExtrasElementViewController *)self setTitle:v23];
}

- (id)_installBackdrop:(id)a3
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 contentInset];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, v6, 0.0, 0.0);
  [v4 addSubview:v22];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2030];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setGroupName:@"VideosExtrasBlurGroupName"];
  uint64_t v8 = [(VideosExtrasElementViewController *)self view];
  [v8 addSubview:v7];

  uint64_t v9 = [(VideosExtrasElementViewController *)self view];
  [v9 addSubview:v4];

  id v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7 attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:1.0 constant:0.0];
  v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7 attribute:8 relatedBy:0 toItem:v4 attribute:8 multiplier:1.0 constant:0.0];
  id v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7 attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:0.0];
  v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7 attribute:3 relatedBy:0 toItem:v22 attribute:3 multiplier:1.0 constant:0.0];
  LODWORD(v14) = 1148682240;
  [v13 setPriority:v14];
  v15 = (void *)MEMORY[0x1E4F28DC8];
  v16 = [(VideosExtrasElementViewController *)self view];
  v17 = [v16 safeAreaLayoutGuide];
  v18 = [v15 constraintWithItem:v7 attribute:3 relatedBy:1 toItem:v17 attribute:3 multiplier:1.0 constant:0.0];

  v19 = [(VideosExtrasElementViewController *)self view];
  v23[0] = v10;
  v23[1] = v11;
  v23[2] = v12;
  v23[3] = v13;
  v23[4] = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:5];
  [v19 addConstraints:v20];

  return v7;
}

- (void)_didActivateButtonWithItem:(id)a3
{
  id v3 = [(NSMapTable *)self->_bannerButtonMap objectForKey:a3];
  [v3 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
}

- (BOOL)isWide
{
  return self->_wide;
}

- (void)setWide:(BOOL)a3
{
  self->_wide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerButtonMap, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
}

@end