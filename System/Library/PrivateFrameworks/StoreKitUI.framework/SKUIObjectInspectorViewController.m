@interface SKUIObjectInspectorViewController
+ (void)showInspectableObject:(id)a3;
- (CGRect)calculateContentViewFrameWithParentBounds:(CGRect)a3 withTraitCollection:(id)a4;
- (NSMutableArray)sections;
- (NSString)friendlyName;
- (NSString)information;
- (SKUIInspectableObject)inspectableObject;
- (SKUIObjectInspectorViewController)initWithInspectableObject:(id)a3;
- (UINavigationBar)navigationBar;
- (UITableView)tableView;
- (UIView)contentView;
- (UIVisualEffectView)backgroundView;
- (_SKUIInspectablePropertySection)currentSection;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)beginSectionWithFriendlyName:(id)a3;
- (void)dismiss;
- (void)endSection;
- (void)exposePropertyWithFriendlyName:(id)a3 value:(id)a4;
- (void)handleBackgroundTap:(id)a3;
- (void)populate;
- (void)setBackgroundView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentSection:(id)a3;
- (void)setFriendlyName:(id)a3;
- (void)setInformation:(id)a3;
- (void)setInspectableObject:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setSections:(id)a3;
- (void)setTableView:(id)a3;
- (void)setupConstraints;
- (void)showFromViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIObjectInspectorViewController

+ (void)showInspectableObject:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIObjectInspectorViewController showInspectableObject:]();
  }
  v4 = [[SKUIObjectInspectorViewController alloc] initWithInspectableObject:v3];

  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  v6 = [v5 keyWindow];
  v7 = [v6 rootViewController];

  [(SKUIObjectInspectorViewController *)v4 showFromViewController:v7];
}

- (SKUIObjectInspectorViewController)initWithInspectableObject:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIObjectInspectorViewController initWithInspectableObject:]();
  }
  v5 = [(SKUIObjectInspectorViewController *)self initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(SKUIObjectInspectorViewController *)v5 setInspectableObject:v4];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(SKUIObjectInspectorViewController *)v6 setSections:v7];
  }
  return v6;
}

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)SKUIObjectInspectorViewController;
  [(SKUIObjectInspectorViewController *)&v37 viewDidLoad];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
  id v4 = [(SKUIObjectInspectorViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = [MEMORY[0x1E4FB1618] clearColor];
  v6 = [(SKUIObjectInspectorViewController *)self view];
  [v6 setBackgroundColor:v5];

  id v7 = [(SKUIObjectInspectorViewController *)self view];
  [v7 setOpaque:0];

  id v8 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v9 = [MEMORY[0x1E4FB14C8] effectWithStyle:2];
  v10 = (void *)[v8 initWithEffect:v9];
  [(SKUIObjectInspectorViewController *)self setBackgroundView:v10];

  v11 = [(SKUIObjectInspectorViewController *)self backgroundView];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleBackgroundTap_];
  [v11 addGestureRecognizer:v12];

  id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v14 = [(SKUIObjectInspectorViewController *)self view];
  [v14 bounds];
  v15 = objc_msgSend(v13, "initWithFrame:");
  [(SKUIObjectInspectorViewController *)self setContentView:v15];

  v16 = [MEMORY[0x1E4FB1618] whiteColor];
  v17 = [(SKUIObjectInspectorViewController *)self contentView];
  [v17 setBackgroundColor:v16];

  id v18 = objc_alloc(MEMORY[0x1E4FB19D0]);
  double v19 = *MEMORY[0x1E4F1DB28];
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], v20, v21, v22);
  [(SKUIObjectInspectorViewController *)self setNavigationBar:v23];

  v24 = [(SKUIObjectInspectorViewController *)self navigationBar];
  v25 = [(SKUIObjectInspectorViewController *)self navigationItem];
  [v24 pushNavigationItem:v25 animated:0];

  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", 0, v19, v20, v21, v22);
  [(SKUIObjectInspectorViewController *)self setTableView:v26];

  v27 = [(SKUIObjectInspectorViewController *)self tableView];
  [v27 setDataSource:self];

  v28 = [(SKUIObjectInspectorViewController *)self tableView];
  [v28 setDelegate:self];

  v29 = [(SKUIObjectInspectorViewController *)self view];
  v30 = [(SKUIObjectInspectorViewController *)self backgroundView];
  [v29 addSubview:v30];

  v31 = [(SKUIObjectInspectorViewController *)self view];
  v32 = [(SKUIObjectInspectorViewController *)self contentView];
  [v31 addSubview:v32];

  v33 = [(SKUIObjectInspectorViewController *)self contentView];
  v34 = [(SKUIObjectInspectorViewController *)self tableView];
  [v33 addSubview:v34];

  v35 = [(SKUIObjectInspectorViewController *)self contentView];
  v36 = [(SKUIObjectInspectorViewController *)self navigationBar];
  [v35 addSubview:v36];

  [(SKUIObjectInspectorViewController *)self setupConstraints];
  [(SKUIObjectInspectorViewController *)self populate];
}

- (void)setupConstraints
{
  id v3 = [(SKUIObjectInspectorViewController *)self backgroundView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(SKUIObjectInspectorViewController *)self backgroundView];
  v5 = [v4 widthAnchor];
  v6 = [(SKUIObjectInspectorViewController *)self view];
  id v7 = [v6 widthAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  v9 = [(SKUIObjectInspectorViewController *)self backgroundView];
  v10 = [v9 heightAnchor];
  v11 = [(SKUIObjectInspectorViewController *)self view];
  v12 = [v11 heightAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [(SKUIObjectInspectorViewController *)self backgroundView];
  v15 = [v14 centerXAnchor];
  v16 = [(SKUIObjectInspectorViewController *)self view];
  v17 = [v16 centerXAnchor];
  id v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  double v19 = [(SKUIObjectInspectorViewController *)self backgroundView];
  double v20 = [v19 centerYAnchor];
  double v21 = [(SKUIObjectInspectorViewController *)self view];
  double v22 = [v21 centerYAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(SKUIObjectInspectorViewController *)self contentView];
  id v56 = [v24 topAnchor];

  v25 = [(SKUIObjectInspectorViewController *)self contentView];
  v26 = [v25 leftAnchor];

  v27 = [(SKUIObjectInspectorViewController *)self contentView];
  v28 = [v27 bottomAnchor];

  v29 = [(SKUIObjectInspectorViewController *)self contentView];
  v30 = [v29 rightAnchor];

  v31 = [(SKUIObjectInspectorViewController *)self navigationBar];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  v32 = [(SKUIObjectInspectorViewController *)self navigationBar];
  v33 = [v32 topAnchor];
  v34 = [v33 constraintEqualToAnchor:v56];
  [v34 setActive:1];

  v35 = [(SKUIObjectInspectorViewController *)self navigationBar];
  v36 = [v35 leftAnchor];
  objc_super v37 = [v36 constraintEqualToAnchor:v26];
  [v37 setActive:1];

  v38 = [(SKUIObjectInspectorViewController *)self navigationBar];
  v39 = [v38 rightAnchor];
  v40 = [v39 constraintEqualToAnchor:v30];
  [v40 setActive:1];

  v41 = [(SKUIObjectInspectorViewController *)self tableView];
  [v41 setTranslatesAutoresizingMaskIntoConstraints:0];

  v42 = [(SKUIObjectInspectorViewController *)self tableView];
  v43 = [v42 topAnchor];
  v44 = [(SKUIObjectInspectorViewController *)self navigationBar];
  v45 = [v44 bottomAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  v47 = [(SKUIObjectInspectorViewController *)self tableView];
  v48 = [v47 leftAnchor];
  v49 = [v48 constraintEqualToAnchor:v26];
  [v49 setActive:1];

  v50 = [(SKUIObjectInspectorViewController *)self tableView];
  v51 = [v50 bottomAnchor];
  v52 = [v51 constraintEqualToAnchor:v28];
  [v52 setActive:1];

  v53 = [(SKUIObjectInspectorViewController *)self tableView];
  v54 = [v53 rightAnchor];
  v55 = [v54 constraintEqualToAnchor:v30];
  [v55 setActive:1];
}

- (void)handleBackgroundTap:(id)a3
{
  if ([a3 state] == 3)
  {
    [(SKUIObjectInspectorViewController *)self dismiss];
  }
}

- (void)showFromViewController:(id)a3
{
  id v4 = a3;
  v5 = [v4 view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(SKUIObjectInspectorViewController *)self view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  v15 = [(SKUIObjectInspectorViewController *)self backgroundView];
  [v15 setAlpha:0.0];

  v16 = [(SKUIObjectInspectorViewController *)self view];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [v4 traitCollection];
  -[SKUIObjectInspectorViewController calculateContentViewFrameWithParentBounds:withTraitCollection:](self, "calculateContentViewFrameWithParentBounds:withTraitCollection:", v25, v18, v20, v22, v24);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(SKUIObjectInspectorViewController *)self contentView];
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  CGAffineTransformMakeScale(&v40, 0.9, 0.9);
  v35 = [(SKUIObjectInspectorViewController *)self contentView];
  CGAffineTransform v39 = v40;
  [v35 setTransform:&v39];

  v36 = [(SKUIObjectInspectorViewController *)self contentView];
  [v36 setAlpha:0.0];

  objc_super v37 = [(SKUIObjectInspectorViewController *)self view];
  [v5 addSubview:v37];

  [v4 addChildViewController:self];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __60__SKUIObjectInspectorViewController_showFromViewController___block_invoke;
  v38[3] = &unk_1E6422020;
  v38[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v38 animations:0.2];
}

void __60__SKUIObjectInspectorViewController_showFromViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) contentView];
  [v3 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) contentView];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setTransform:v6];
}

- (void)dismiss
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__SKUIObjectInspectorViewController_dismiss__block_invoke;
  v3[3] = &unk_1E6422020;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__SKUIObjectInspectorViewController_dismiss__block_invoke_2;
  v2[3] = &unk_1E64223D0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:v2 completion:0.2];
}

void __44__SKUIObjectInspectorViewController_dismiss__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) contentView];
  [v3 setAlpha:0.0];

  CGAffineTransformMakeScale(&v6, 0.9, 0.9);
  id v4 = [*(id *)(a1 + 32) contentView];
  CGAffineTransform v5 = v6;
  [v4 setTransform:&v5];
}

void __44__SKUIObjectInspectorViewController_dismiss__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromParentViewController];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];
}

- (CGRect)calculateContentViewFrameWithParentBounds:(CGRect)a3 withTraitCollection:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [a4 userInterfaceIdiom];
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v19);
  double v10 = v9;
  if (v8)
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double v11 = CGRectGetHeight(v20);
    if (v10 < v11) {
      double v11 = v10;
    }
    double v12 = round(v11 * 0.8);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double v13 = CGRectGetMidX(v21) - v12 * 0.5;
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double v14 = CGRectGetMidY(v22) - v12 * 0.5;
    double v15 = v12;
  }
  else
  {
    double v12 = v9 * 0.95;
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    double v15 = CGRectGetHeight(v23) * 0.9;
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double v13 = CGRectGetMidX(v24) - v12 * 0.5;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double v14 = CGRectGetMidY(v25) - v15 * 0.5;
  }
  double v16 = v13;
  double v17 = v12;
  double v18 = v15;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__SKUIObjectInspectorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E6422278;
  v4[4] = self;
  [a4 animateAlongsideTransition:0 completion:v4];
}

void __88__SKUIObjectInspectorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v21 = [v2 view];
  [v21 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v2, "calculateContentViewFrameWithParentBounds:withTraitCollection:", v11, v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  CGRect v20 = [*(id *)(a1 + 32) contentView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (void)populate
{
  double v3 = [(SKUIObjectInspectorViewController *)self inspectableObject];
  [v3 populateObjectInspector:self];

  double v4 = [(SKUIObjectInspectorViewController *)self friendlyName];

  if (!v4)
  {
    double v5 = [(SKUIObjectInspectorViewController *)self inspectableObject];
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    [(SKUIObjectInspectorViewController *)self setFriendlyName:v7];
  }
  id v8 = [(SKUIObjectInspectorViewController *)self tableView];
  [v8 reloadData];
}

- (void)setFriendlyName:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIObjectInspectorViewController *)self navigationItem];
  [v5 setTitle:v4];
}

- (NSString)friendlyName
{
  id v2 = [(SKUIObjectInspectorViewController *)self navigationItem];
  double v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setInformation:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIObjectInspectorViewController *)self navigationItem];
  [v5 setPrompt:v4];
}

- (NSString)information
{
  id v2 = [(SKUIObjectInspectorViewController *)self navigationItem];
  double v3 = [v2 prompt];

  return (NSString *)v3;
}

- (void)beginSectionWithFriendlyName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_SKUIInspectablePropertySection);
  [(SKUIObjectInspectorViewController *)self setCurrentSection:v5];

  id v6 = [(SKUIObjectInspectorViewController *)self currentSection];
  [v6 setFriendlyName:v4];
}

- (void)endSection
{
  double v3 = [(SKUIObjectInspectorViewController *)self currentSection];

  if (v3)
  {
    id v4 = [(SKUIObjectInspectorViewController *)self sections];
    id v5 = [(SKUIObjectInspectorViewController *)self currentSection];
    [v4 addObject:v5];

    [(SKUIObjectInspectorViewController *)self setCurrentSection:0];
  }
}

- (void)exposePropertyWithFriendlyName:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v10 = objc_alloc_init(_SKUIInspectableProperty);
  [(_SKUIInspectableProperty *)v10 setFriendlyName:v7];

  [(_SKUIInspectableProperty *)v10 setValue:v6];
  id v8 = [(SKUIObjectInspectorViewController *)self currentSection];
  double v9 = [v8 properties];
  [v9 addObject:v10];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  double v3 = [(SKUIObjectInspectorViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(SKUIObjectInspectorViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 properties];
  int64_t v8 = [v7 count];

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  int64_t v4 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"PropertyReuseIdentifier", a4);
  if (!v4) {
    int64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PropertyReuseIdentifier"];
  }

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(SKUIObjectInspectorViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 friendlyName];

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  double v9 = [(SKUIObjectInspectorViewController *)self sections];
  double v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  double v11 = [v10 properties];
  uint64_t v12 = [v7 row];

  id v17 = [v11 objectAtIndexedSubscript:v12];

  double v13 = [v17 friendlyName];
  double v14 = [v8 textLabel];
  [v14 setText:v13];

  double v15 = [v17 valueString];
  double v16 = [v8 detailTextLabel];

  [v16 setText:v15];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SKUIObjectInspectorViewController *)self sections];
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  double v10 = [v9 properties];
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  double v11 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  uint64_t v12 = NSString;
  double v13 = [v16 friendlyName];
  double v14 = [v16 valueString];
  double v15 = [v12 stringWithFormat:@"%@: %@", v13, v14];

  [v11 setString:v15];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (SKUIInspectableObject)inspectableObject
{
  return self->_inspectableObject;
}

- (void)setInspectableObject:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (_SKUIInspectablePropertySection)currentSection
{
  return self->_currentSection;
}

- (void)setCurrentSection:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_currentSection, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_inspectableObject, 0);
}

+ (void)showInspectableObject:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIObjectInspectorViewController showInspectableObject:]";
}

- (void)initWithInspectableObject:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIObjectInspectorViewController initWithInspectableObject:]";
}

@end