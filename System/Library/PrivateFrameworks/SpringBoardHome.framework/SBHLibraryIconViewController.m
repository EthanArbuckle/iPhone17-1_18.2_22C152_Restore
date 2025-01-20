@interface SBHLibraryIconViewController
- (BOOL)isEditing;
- (BOOL)isOverlapping;
- (BOOL)isUserInteractionEnabled;
- (BOOL)showsSquareCorners;
- (CGPoint)focusEffectCenter;
- (CGRect)focusEffectBounds;
- (CGRect)visibleBounds;
- (NSString)description;
- (SBHLibraryCategoriesFolderDataSource)libraryDataSource;
- (SBHLibraryCategoryStackView)categoryStackView;
- (SBHLibraryIconViewController)initWithCoder:(id)a3;
- (SBHLibraryIconViewController)initWithListLayoutProvider:(id)a3;
- (SBHLibraryIconViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBIconImageInfo)iconImageInfo;
- (UIView)dismissalView;
- (double)brightness;
- (double)continuousCornerRadius;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_reloadCategoryViewsForDataSourceChangeAnimated:(BOOL)a3;
- (void)categoriesDataSource:(id)a3 shouldAnimateLayoutForCategories:(id)a4;
- (void)categoriesDataSourceNeedsAnimatedReload:(id)a3;
- (void)dealloc;
- (void)setBrightness:(double)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setLibraryDataSource:(id)a3;
- (void)setOverlapping:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SBHLibraryIconViewController

- (SBHLibraryIconViewController)initWithListLayoutProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryIconViewController;
  v6 = [(SBHLibraryIconViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listLayoutProvider, a3);
  }

  return v7;
}

- (SBHLibraryIconViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (SBHLibraryIconViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  [(SBHLibraryCategoriesFolderDataSource *)self->_libraryDataSource removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryIconViewController;
  [(SBHLibraryIconViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryIconViewController;
  [(SBHLibraryIconViewController *)&v8 viewDidLoad];
  objc_super v3 = [(SBHLibraryIconViewController *)self view];
  v4 = [SBHLibraryCategoryStackView alloc];
  [v3 bounds];
  id v5 = -[SBHLibraryCategoryStackView initWithFrame:](v4, "initWithFrame:");
  [(SBHLibraryCategoryStackView *)v5 setAutoresizingMask:18];
  -[SBHLibraryCategoryStackView setIconImageInfo:](v5, "setIconImageInfo:", self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius);
  [v3 addSubview:v5];
  categoryStackView = self->_categoryStackView;
  self->_categoryStackView = v5;
  v7 = v5;

  [(SBHLibraryCategoryStackView *)v7 setAlpha:1.0];
  [(SBHLibraryIconViewController *)self _reloadCategoryViewsForDataSourceChangeAnimated:0];
}

- (void)setLibraryDataSource:(id)a3
{
  id v5 = (SBHLibraryCategoriesFolderDataSource *)a3;
  libraryDataSource = self->_libraryDataSource;
  if (libraryDataSource != v5)
  {
    objc_super v8 = v5;
    [(SBHLibraryCategoriesFolderDataSource *)self->_libraryDataSource removeObserver:self];
    objc_storeStrong((id *)&self->_libraryDataSource, a3);
    [(SBHLibraryCategoriesFolderDataSource *)v8 addObserver:self];
    int v7 = [(SBHLibraryIconViewController *)self isViewLoaded];
    id v5 = v8;
    if (v7)
    {
      [(SBHLibraryIconViewController *)self _reloadCategoryViewsForDataSourceChangeAnimated:libraryDataSource != 0];
      id v5 = v8;
    }
  }
}

- (SBHLibraryCategoryStackView)categoryStackView
{
  [(SBHLibraryIconViewController *)self loadViewIfNeeded];
  categoryStackView = self->_categoryStackView;
  return categoryStackView;
}

- (UIView)dismissalView
{
  [(SBHLibraryIconViewController *)self loadViewIfNeeded];
  dismissalView = self->_dismissalView;
  return (UIView *)dismissalView;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHLibraryCategoryStackView setIconImageInfo:](self->_categoryStackView, "setIconImageInfo:", v10, v9, v8, v7);
    dismissalView = self->_dismissalView;
    -[SBHLibraryDismissalView setIconImageInfo:](dismissalView, "setIconImageInfo:", v10, v9, v8, v7);
  }
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[SBHLibraryCategoryStackView setEditing:](self->_categoryStackView, "setEditing:");
  }
}

- (void)setOverlapping:(BOOL)a3
{
  if (self->_overlapping != a3)
  {
    self->_overlapping = a3;
    -[SBHLibraryCategoryStackView setOverlapping:](self->_categoryStackView, "setOverlapping:");
  }
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (void)setBrightness:(double)a3
{
  if (self->_brightness != a3)
  {
    self->_brightness = a3;
    [(SBHLibraryCategoryStackView *)self->_categoryStackView setHighlighted:BSFloatIsOne() ^ 1];
    dismissalView = self->_dismissalView;
    [(SBHLibraryDismissalView *)dismissalView setBrightness:a3];
  }
}

- (CGRect)focusEffectBounds
{
  [(SBHLibraryCategoryStackView *)self->_categoryStackView visibleContentFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)focusEffectCenter
{
  [(SBHLibraryIconViewController *)self focusEffectBounds];
  UIRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)visibleBounds
{
  [(SBHLibraryIconViewController *)self iconImageInfo];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)continuousCornerRadius
{
  [(SBHLibraryIconViewController *)self iconImageInfo];
  return v2;
}

- (void)categoriesDataSource:(id)a3 shouldAnimateLayoutForCategories:(id)a4
{
}

- (void)categoriesDataSourceNeedsAnimatedReload:(id)a3
{
}

- (void)_reloadCategoryViewsForDataSourceChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v5 = [(SBHLibraryCategoriesFolderDataSource *)self->_libraryDataSource categoryIdentifiers];
  categoryStackView = self->_categoryStackView;
  unint64_t v7 = [v5 count];
  if (v7 <= 1) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = v7;
  }
  if (v8 >= 3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = v8;
  }
  [(SBHLibraryCategoryStackView *)categoryStackView setNumberOfCategories:v9];
  libraryDataSource = self->_libraryDataSource;
  v11 = [v5 firstObject];
  v12 = [(SBHLibraryCategoriesFolderDataSource *)libraryDataSource categoryForIdentifier:v11];

  v13 = SBLogLibrary();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    v18 = self;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "[%@] reloading pod icons for updated topmost category: %@", (uint8_t *)&v17, 0x16u);
  }

  v14 = [v12 compactPodFolder];
  v15 = self->_categoryStackView;
  v16 = [v14 icons];
  [(SBHLibraryCategoryStackView *)v15 setInnerIcons:v16 animated:v3];
}

- (NSString)description
{
  return (NSString *)[(SBHLibraryIconViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  double v2 = [(SBHLibraryIconViewController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBHLibraryIconViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  double v5 = [(SBHLibraryIconViewController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBHLibraryIconViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AACA90;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __70__SBHLibraryIconViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) libraryDataSource];
  id v4 = (id)[v2 appendObject:v3 withName:@"libraryDataSource"];

  double v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) categoryStackView];
  id v7 = (id)[v5 appendObject:v6 withName:@"categoryStackView"];

  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isEditing"), @"isEditing", 1);
  uint64_t v9 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) brightness];
  return (id)objc_msgSend(v9, "appendFloat:withName:", @"brightness");
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isOverlapping
{
  return self->_overlapping;
}

- (double)brightness
{
  return self->_brightness;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (SBHLibraryCategoriesFolderDataSource)libraryDataSource
{
  return self->_libraryDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryDataSource, 0);
  objc_storeStrong((id *)&self->_dismissalView, 0);
  objc_storeStrong((id *)&self->_categoryStackView, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
}

@end