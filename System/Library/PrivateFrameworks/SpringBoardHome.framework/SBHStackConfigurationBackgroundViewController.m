@interface SBHStackConfigurationBackgroundViewController
- (CCUICustomContentModuleBackgroundViewController)backgroundViewController;
- (CGSize)apertureSize;
- (void)loadView;
- (void)setApertureSize:(CGSize)a3;
- (void)setBackgroundViewController:(id)a3;
- (void)setFooterButtons:(id)a3;
- (void)viewDidLoad;
@end

@implementation SBHStackConfigurationBackgroundViewController

- (void)loadView
{
  v3 = [SBHTouchPassThroughView alloc];
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  v5 = -[SBHTouchPassThroughView initWithFrame:](v3, "initWithFrame:");

  [(SBHTouchPassThroughView *)v5 setAutoresizingMask:18];
  [(SBHStackConfigurationBackgroundViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SBHStackConfigurationBackgroundViewController;
  [(SBHStackConfigurationBackgroundViewController *)&v17 viewDidLoad];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v3 = (void *)getCCUICustomContentModuleBackgroundViewControllerClass_softClass;
  uint64_t v22 = getCCUICustomContentModuleBackgroundViewControllerClass_softClass;
  if (!getCCUICustomContentModuleBackgroundViewControllerClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke;
    v18[3] = &unk_1E6AAD648;
    v18[4] = &v19;
    __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke((uint64_t)v18);
    v3 = (void *)v20[3];
  }
  v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = objc_alloc_init(v4);
  [(SBHStackConfigurationBackgroundViewController *)self setBackgroundViewController:v5];
  [(SBHStackConfigurationBackgroundViewController *)self bs_addChildViewController:v5];
  v6 = [v5 view];
  [v6 setAutoresizingMask:18];

  v7 = [v5 requiredVisualStyleCategories];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) integerValue];
        v12 = [MEMORY[0x1E4F743E8] _visualStylingProviderForRecipe:4 andCategory:v11];
        [v5 setVisualStylingProvider:v12 forCategory:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)setApertureSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBHStackConfigurationBackgroundViewController *)self loadViewIfNeeded];
  id v6 = [(SBHStackConfigurationBackgroundViewController *)self backgroundViewController];
  [v6 setExpandedContentModuleWidth:width];
  [v6 setExpandedContentModuleHeight:height];
}

- (void)setFooterButtons:(id)a3
{
  id v4 = a3;
  id v7 = [(SBHStackConfigurationBackgroundViewController *)self backgroundViewController];
  id v5 = objc_msgSend(v4, "bs_compactMap:", &__block_literal_global_7);

  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1)
  {
    id v6 = objc_msgSend(v5, "bs_reverse");
    [v7 setFooterButtons:v6];
  }
  else
  {
    [v7 setFooterButtons:v5];
  }
}

id __66__SBHStackConfigurationBackgroundViewController_setFooterButtons___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  Class v3 = NSClassFromString(&cfstr_Ccuilabeledrou.isa);
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (CGSize)apertureSize
{
  double width = self->_apertureSize.width;
  double height = self->_apertureSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CCUICustomContentModuleBackgroundViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (void)setBackgroundViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end