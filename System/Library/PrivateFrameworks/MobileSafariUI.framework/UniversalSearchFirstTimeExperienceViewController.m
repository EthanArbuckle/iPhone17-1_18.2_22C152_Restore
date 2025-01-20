@interface UniversalSearchFirstTimeExperienceViewController
+ (BOOL)hasShownParsecFirstTimeUserExperience;
+ (void)userDidInteractWithParsecFirstTimeUserExperience;
- (UniversalSearchFirstTimeExperienceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UniversalSearchFirstTimeExperienceViewControllerDelegate)delegate;
- (void)firstTimeExperienceContinueButtonPressed;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)unifiedFieldDidChange;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation UniversalSearchFirstTimeExperienceViewController

+ (BOOL)hasShownParsecFirstTimeUserExperience
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSParsecHasShownFirstTimeUserExperience"];

  return v3;
}

+ (void)userDidInteractWithParsecFirstTimeUserExperience
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setBool:1 forKey:@"WBSParsecHasShownFirstTimeUserExperience"];
  [v2 synchronize];
}

- (UniversalSearchFirstTimeExperienceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)UniversalSearchFirstTimeExperienceViewController;
  v8 = [(UniversalSearchFirstTimeExperienceViewController *)&v26 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = +[WBSParsecDSession sharedPARSession];
    v10 = [v9 bag];

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v11 = (void *)getSearchUIFirstTimeExperienceViewControllerClass_softClass;
    uint64_t v31 = getSearchUIFirstTimeExperienceViewControllerClass_softClass;
    if (!getSearchUIFirstTimeExperienceViewControllerClass_softClass)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __getSearchUIFirstTimeExperienceViewControllerClass_block_invoke;
      v27[3] = &unk_1E6D77CE0;
      v27[4] = &v28;
      __getSearchUIFirstTimeExperienceViewControllerClass_block_invoke((uint64_t)v27);
      v11 = (void *)v29[3];
    }
    v12 = v11;
    _Block_object_dispose(&v28, 8);
    id v25 = [v12 alloc];
    v13 = [v10 enabledDomains];
    uint64_t v14 = [v13 containsObject:*MEMORY[0x1E4F99328]];
    if ([v13 containsObject:*MEMORY[0x1E4F99320]]) {
      v14 |= 8uLL;
    }
    if ([v13 containsObject:*MEMORY[0x1E4F99318]]) {
      v14 |= 0x20uLL;
    }
    if ([v13 containsObject:@"itunes"]) {
      v14 |= 2uLL;
    }
    if ([v13 containsObject:@"app_store"]) {
      v14 |= 4uLL;
    }
    if ([v13 containsObject:@"restaurants"]) {
      uint64_t v15 = v14 | 0x10;
    }
    else {
      uint64_t v15 = v14;
    }
    v16 = NSString;
    v17 = [v10 firstUseDescriptionText];
    v18 = [v16 stringWithFormat:@"%@ ", v17];
    v19 = [v10 firstUseLearnMoreText];
    v20 = _WBSLocalizedString();
    uint64_t v21 = [v25 initWithSupportedDomains:v15 explanationText:v18 learnMoreText:v19 continueButtonTitle:v20];
    firstTimeExperienceViewController = v8->_firstTimeExperienceViewController;
    v8->_firstTimeExperienceViewController = (SearchUIFirstTimeExperienceViewController *)v21;

    v23 = v8;
  }

  return v8;
}

- (void)loadView
{
  char v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setKeyboardDismissMode:2];
  v5 = self->_scrollView;
  [(UniversalSearchFirstTimeExperienceViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)UniversalSearchFirstTimeExperienceViewController;
  [(UniversalSearchFirstTimeExperienceViewController *)&v6 viewDidLoad];
  [(UniversalSearchFirstTimeExperienceViewController *)self addChildViewController:self->_firstTimeExperienceViewController];
  [(SearchUIFirstTimeExperienceViewController *)self->_firstTimeExperienceViewController didMoveToParentViewController:self];
  [(SearchUIFirstTimeExperienceViewController *)self->_firstTimeExperienceViewController setDelegate:self];
  char v3 = [(SearchUIFirstTimeExperienceViewController *)self->_firstTimeExperienceViewController view];
  [v3 setAutoresizingMask:0];

  v4 = [(UniversalSearchFirstTimeExperienceViewController *)self view];
  v5 = [(SearchUIFirstTimeExperienceViewController *)self->_firstTimeExperienceViewController view];
  [v4 addSubview:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UniversalSearchFirstTimeExperienceViewController;
  [(UniversalSearchFirstTimeExperienceViewController *)&v4 viewDidAppear:a3];
  [(UIScrollView *)self->_scrollView flashScrollIndicators];
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)UniversalSearchFirstTimeExperienceViewController;
  [(UniversalSearchFirstTimeExperienceViewController *)&v12 viewWillLayoutSubviews];
  char v3 = [(SearchUIFirstTimeExperienceViewController *)self->_firstTimeExperienceViewController view];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v5 = v4;
  objc_super v6 = [(UniversalSearchFirstTimeExperienceViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = fmax(v5, v10);
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v8, v11);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v8, v11);
}

- (void)unifiedFieldDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didInteractWithUniversalSearchFirstTimeExperienceViewController:self];
}

- (void)firstTimeExperienceContinueButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained firstTimeExperienceContinueButtonPressed];
}

- (UniversalSearchFirstTimeExperienceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UniversalSearchFirstTimeExperienceViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_firstTimeExperienceViewController, 0);
}

@end