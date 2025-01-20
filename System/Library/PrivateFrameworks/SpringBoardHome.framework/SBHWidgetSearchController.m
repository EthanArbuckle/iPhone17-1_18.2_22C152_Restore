@interface SBHWidgetSearchController
- (BOOL)alwaysShowBarBackground;
- (BOOL)applicationCellIncludesGalleryListView;
- (BOOL)shouldInsetContentForGrabber;
- (NSString)widthDefiningGridSizeClass;
- (SBHWidgetSearchController)initWithAddWidgetSheetStyle:(unint64_t)a3 placeholderText:(id)a4;
- (SBIconListLayoutProvider)listLayoutProvider;
- (UIView)searchBarBackgroundView;
- (UIView)searchBarTextFieldBackgroundView;
- (double)grabberTopSpacing;
- (double)textFieldExtraHeight;
- (double)textFieldToBarBackgroundBottomSpacing;
- (double)textFieldToWidgetsSpacing;
- (id)_textFieldFont;
- (unint64_t)addWidgetSheetStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_setupBarBackground;
- (void)_setupSearchBar;
- (void)_setupTextFieldBackground;
- (void)_setupTextFieldMetrics;
- (void)_setupTextFieldWithPlaceholderText:(id)a3;
- (void)dealloc;
- (void)setAddWidgetSheetStyle:(unint64_t)a3;
- (void)setAlwaysShowBarBackground:(BOOL)a3;
- (void)setApplicationCellIncludesGalleryListView:(BOOL)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setSearchBarBackgroundView:(id)a3;
- (void)setShouldInsetContentForGrabber:(BOOL)a3;
- (void)setTextFieldExtraHeight:(double)a3;
- (void)setTextFieldToBarBackgroundBottomSpacing:(double)a3;
- (void)setTextFieldToWidgetsSpacing:(double)a3;
- (void)setWidthDefiningGridSizeClass:(id)a3;
- (void)updateSearchBarBackgroundForScrollDistance:(double)a3 forClient:(id)a4;
- (void)updateSearchBarContentInsetsWithWidth:(double)a3;
@end

@implementation SBHWidgetSearchController

- (SBHWidgetSearchController)initWithAddWidgetSheetStyle:(unint64_t)a3 placeholderText:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBHWidgetSearchController;
  v7 = [(SBHWidgetSearchController *)&v13 initWithSearchResultsController:0];
  v8 = v7;
  if (v7)
  {
    v7->_addWidgetSheetStyle = a3;
    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    scrollProgressByClient = v8->_scrollProgressByClient;
    v8->_scrollProgressByClient = (NSMapTable *)v9;

    v8->_shouldInsetContentForGrabber = 1;
    [(SBHWidgetSearchController *)v8 _setupTextFieldMetrics];
    [(SBHWidgetSearchController *)v8 _setupSearchBar];
    [(SBHWidgetSearchController *)v8 _setupTextFieldWithPlaceholderText:v6];
    [(SBHWidgetSearchController *)v8 _setupTextFieldBackground];
    [(SBHWidgetSearchController *)v8 _setupBarBackground];
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v8 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetSearchController;
  [(SBHWidgetSearchController *)&v4 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(SBHWidgetSearchController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ([(SBHWidgetSearchController *)self addWidgetSheetStyle] == 1 || v4 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)setAlwaysShowBarBackground:(BOOL)a3
{
  if (self->_alwaysShowBarBackground != a3)
  {
    self->_alwaysShowBarBackground = a3;
    if (a3)
    {
      searchBarBackgroundView = self->_searchBarBackgroundView;
      uint64_t v4 = objc_opt_class();
      v5 = searchBarBackgroundView;
      if (v4)
      {
        if (objc_opt_isKindOfClass()) {
          id v6 = v5;
        }
        else {
          id v6 = 0;
        }
      }
      else
      {
        id v6 = 0;
      }
      v7 = v6;

      id v8 = [(UIView *)v7 topItem];

      [v8 _setManualScrollEdgeAppearanceProgress:1.0];
    }
  }
}

- (void)setShouldInsetContentForGrabber:(BOOL)a3
{
  if (self->_shouldInsetContentForGrabber != a3)
  {
    self->_shouldInsetContentForGrabber = a3;
    id v5 = [(SBHWidgetSearchController *)self view];
    [v5 bounds];
    [(SBHWidgetSearchController *)self updateSearchBarContentInsetsWithWidth:v4];
  }
}

- (void)setApplicationCellIncludesGalleryListView:(BOOL)a3
{
  if (self->_applicationCellIncludesGalleryListView != a3)
  {
    self->_applicationCellIncludesGalleryListView = a3;
    [(SBHWidgetSearchController *)self _setupTextFieldMetrics];
    id v5 = [(SBHWidgetSearchController *)self view];
    [v5 bounds];
    [(SBHWidgetSearchController *)self updateSearchBarContentInsetsWithWidth:v4];
  }
}

- (void)setWidthDefiningGridSizeClass:(id)a3
{
  double v4 = (NSString *)a3;
  widthDefiningGridSizeClass = self->_widthDefiningGridSizeClass;
  if (widthDefiningGridSizeClass != v4)
  {
    v11 = v4;
    BOOL v6 = [(NSString *)widthDefiningGridSizeClass isEqualToString:v4];
    double v4 = v11;
    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v11 copy];
      id v8 = self->_widthDefiningGridSizeClass;
      self->_widthDefiningGridSizeClass = v7;

      uint64_t v9 = [(SBHWidgetSearchController *)self view];
      [v9 bounds];
      [(SBHWidgetSearchController *)self updateSearchBarContentInsetsWithWidth:v10];

      double v4 = v11;
    }
  }
}

- (void)_setupTextFieldMetrics
{
  unint64_t v3 = [(SBHWidgetSearchController *)self addWidgetSheetStyle];
  double v4 = 6.0;
  if (v3 == 1)
  {
    double v4 = 0.0;
    double v5 = 21.0;
  }
  else
  {
    double v5 = 26.3333333;
  }
  double v6 = 16.0;
  if (!self->_applicationCellIncludesGalleryListView) {
    double v6 = 8.0;
  }
  double v7 = v4 + v6;
  -[SBHWidgetSearchController setTextFieldExtraHeight:](self, "setTextFieldExtraHeight:");
  [(SBHWidgetSearchController *)self setTextFieldToWidgetsSpacing:v5];
  [(SBHWidgetSearchController *)self setTextFieldToBarBackgroundBottomSpacing:v7];
}

- (void)_setupSearchBar
{
  id v8 = [(SBHWidgetSearchController *)self searchBar];
  [v8 setDrawsBackground:0];
  [v8 setCenterPlaceholder:1];
  [v8 _setDisableDictationButton:1];
  v2 = (id *)MEMORY[0x1E4FB2608];
  uint64_t v3 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  double v4 = 10.0;
  if (v3 == 1) {
    double v4 = 0.0;
  }
  objc_msgSend(v8, "setPositionAdjustment:forSearchBarIcon:", 0, v4, 0.0);
  uint64_t v5 = [*v2 userInterfaceLayoutDirection];
  double v6 = -10.0;
  if (v5 == 1) {
    double v6 = 0.0;
  }
  objc_msgSend(v8, "setPositionAdjustment:forSearchBarIcon:", 1, v6, 0.0);
  double v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v8 setTintColor:v7];
}

- (void)_setupTextFieldWithPlaceholderText:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBHWidgetSearchController *)self searchBar];
  double v6 = [v5 searchTextField];
  double v7 = [(SBHWidgetSearchController *)self _textFieldFont];
  [v6 setFont:v7];

  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 _setBackgroundFillColor:v8];

  uint64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
  [v6 setTextColor:v9];

  double v10 = [v6 leftView];
  v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v10 setTintColor:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v18 = *MEMORY[0x1E4FB0700];
  objc_super v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v19[0] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v15 = (void *)[v12 initWithString:v4 attributes:v14];

  [v6 setAttributedPlaceholder:v15];
  v16 = SBHSearchIconImageSymbolConfiguration();
  v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill" withConfiguration:v16];
  [v5 setImage:v17 forSearchBarIcon:1 state:0];
  if (_setupTextFieldWithPlaceholderText__onceToken != -1) {
    dispatch_once(&_setupTextFieldWithPlaceholderText__onceToken, &__block_literal_global_78);
  }
}

void __64__SBHWidgetSearchController__setupTextFieldWithPlaceholderText___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB14D0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  v2 = [v0 appearanceWhenContainedInInstancesOfClasses:v1];
  uint64_t v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v2 setTintColor:v3];
}

- (void)_setupTextFieldBackground
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v22 = [(SBHWidgetSearchController *)self searchBar];
  uint64_t v3 = [v22 searchTextField];
  id v4 = [[SBHWidgetSearchBarBackgroundView alloc] initWithAddWidgetSheetStyle:[(SBHWidgetSearchController *)self addWidgetSheetStyle]];
  [(SBHWidgetSearchBarBackgroundView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v22 insertSubview:v4 atIndex:0];
  [(SBHWidgetSearchController *)self textFieldExtraHeight];
  double v6 = v5;
  v16 = (void *)MEMORY[0x1E4F28DC8];
  v21 = [(SBHWidgetSearchBarBackgroundView *)v4 leadingAnchor];
  v20 = [v3 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v23[0] = v19;
  uint64_t v18 = [(SBHWidgetSearchBarBackgroundView *)v4 trailingAnchor];
  v17 = [v3 trailingAnchor];
  v15 = [v18 constraintEqualToAnchor:v17];
  v23[1] = v15;
  double v7 = [(SBHWidgetSearchBarBackgroundView *)v4 topAnchor];
  id v8 = [v3 topAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8 constant:-v6];
  v23[2] = v9;
  double v10 = [(SBHWidgetSearchBarBackgroundView *)v4 bottomAnchor];
  v11 = [v3 bottomAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11 constant:v6];
  v23[3] = v12;
  objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v16 activateConstraints:v13];

  searchBarTextFieldBackgroundView = self->_searchBarTextFieldBackgroundView;
  self->_searchBarTextFieldBackgroundView = &v4->super;
}

- (void)_setupBarBackground
{
  v34[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBHWidgetSearchController *)self searchBar];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB19D0]);
  id v5 = objc_alloc_init(MEMORY[0x1E4FB19F0]);
  v34[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  [v4 setItems:v6];

  [v5 _setManualScrollEdgeAppearanceEnabled:1];
  if (self->_alwaysShowBarBackground) {
    [v5 _setManualScrollEdgeAppearanceProgress:1.0];
  }
  v31 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    [v7 configureWithOpaqueBackground];
  }
  else
  {
    [v7 configureWithDefaultBackground];
    id v8 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:16.0];
    v33 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    [v7 setBackgroundEffects:v9];
  }
  [v4 setStandardAppearance:v7];
  double v10 = (UIView *)v4;
  [(UIView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 insertSubview:v10 atIndex:0];
  [v3 setAutoresizingMask:34];
  v22 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [(UIView *)v10 topAnchor];
  v29 = [v3 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v32[0] = v28;
  v25 = [(UIView *)v10 leadingAnchor];
  v24 = [v3 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v32[1] = v23;
  [(UIView *)v10 trailingAnchor];
  id v12 = v11 = v3;
  v26 = v11;
  [v11 trailingAnchor];
  objc_super v13 = v27 = v7;
  v14 = [v12 constraintEqualToAnchor:v13];
  v32[2] = v14;
  v15 = [(UIView *)v10 bottomAnchor];
  v16 = [v11 searchTextField];
  v17 = [v16 bottomAnchor];
  [(SBHWidgetSearchController *)self textFieldToBarBackgroundBottomSpacing];
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
  v19 = uint64_t v18 = self;
  v32[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  [v22 activateConstraints:v20];

  searchBarBackgroundView = v18->_searchBarBackgroundView;
  v18->_searchBarBackgroundView = v10;
}

- (void)updateSearchBarBackgroundForScrollDistance:(double)a3 forClient:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!self->_alwaysShowBarBackground)
  {
    scrollProgressByClient = self->_scrollProgressByClient;
    if (a3 == 2.22507386e-308)
    {
      [(NSMapTable *)self->_scrollProgressByClient removeObjectForKey:v6];
    }
    else
    {
      id v8 = [NSNumber numberWithDouble:a3];
      [(NSMapTable *)scrollProgressByClient setObject:v8 forKey:v6];
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [(NSMapTable *)self->_scrollProgressByClient objectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) doubleValue];
          if (a3 < v14) {
            a3 = v14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    searchBarBackgroundView = self->_searchBarBackgroundView;
    uint64_t v16 = objc_opt_class();
    v17 = searchBarBackgroundView;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    v19 = v18;

    v20 = [(UIView *)v19 topItem];

    objc_msgSend(v20, "_setManualScrollEdgeAppearanceProgress:", fmin(fmax(a3 * 0.0625, 0.0), 1.0));
  }
}

- (void)updateSearchBarContentInsetsWithWidth:(double)a3
{
  id v21 = [(SBHWidgetSearchController *)self searchBar];
  id v5 = objc_alloc_init(SBHDefaultIconListLayoutProvider);
  id v6 = [(SBHDefaultIconListLayoutProvider *)v5 layoutForIconLocation:@"SBIconLocationRoot"];
  id v7 = v6;
  widthDefiningGridSizeClass = self->_widthDefiningGridSizeClass;
  if (!widthDefiningGridSizeClass) {
    goto LABEL_7;
  }
  double v9 = fmax(SBHIconListLayoutIconImageInfoForGridSizeClass(v6, widthDefiningGridSizeClass), 0.0);
  listLayoutProvider = self->_listLayoutProvider;
  if (listLayoutProvider)
  {
    uint64_t v11 = [(SBIconListLayoutProvider *)listLayoutProvider layoutForIconLocation:@"SBIconLocationRoot"];
    double v12 = SBHIconListLayoutIconImageInfoForGridSizeClass(v11, self->_widthDefiningGridSizeClass);
    if (v12 > 0.0) {
      double v9 = v12;
    }
  }
  if (v9 <= 0.0)
  {
LABEL_7:
    uint64_t v13 = SBHScreenTypeForCurrentDevice();
    if (self->_addWidgetSheetStyle == 1)
    {
      double v9 = 450.0;
    }
    else if ((unint64_t)(v13 - 29) >= 0x13)
    {
      double v9 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, @"SBHIconGridSizeClassMedium");
    }
    else
    {
      double v9 = dbl_1D81E9678[v13 - 29];
    }
  }
  double v14 = (a3 - v9) * 0.5;
  [(SBHWidgetSearchController *)self textFieldExtraHeight];
  double v16 = v15;
  [(SBHWidgetSearchController *)self textFieldToWidgetsSpacing];
  double v18 = v17;
  if (self->_addWidgetSheetStyle == 1)
  {
    if (self->_shouldInsetContentForGrabber)
    {
      if (_SBHAddWidgetSheetGrabberHeight_onceToken[0] != -1) {
        dispatch_once(_SBHAddWidgetSheetGrabberHeight_onceToken, &__block_literal_global_115_0);
      }
      double v19 = *(double *)&_SBHAddWidgetSheetGrabberHeight_grabberHeight + 21.0;
    }
    else
    {
      double v19 = 0.0;
    }
  }
  else
  {
    double v20 = 27.0;
    if (self->_shouldInsetContentForGrabber) {
      double v20 = v14;
    }
    double v19 = v16 + v20;
    double v18 = v16 + v18;
  }
  objc_msgSend(v21, "setContentInset:", v19, v14, v18, v14);
}

- (double)grabberTopSpacing
{
  uint64_t v3 = [(SBHWidgetSearchController *)self searchBar];
  id v4 = [v3 searchTextField];
  [v4 frame];
  double MinY = CGRectGetMinY(v9);
  [(SBHWidgetSearchController *)self textFieldExtraHeight];
  double v7 = v6;

  if (_SBHAddWidgetSheetGrabberHeight_onceToken[0] != -1) {
    dispatch_once(_SBHAddWidgetSheetGrabberHeight_onceToken, &__block_literal_global_115_0);
  }
  return (MinY - v7 - *(double *)&_SBHAddWidgetSheetGrabberHeight_grabberHeight) * 0.5;
}

- (id)_textFieldFont
{
  unint64_t v2 = [(SBHWidgetSearchController *)self addWidgetSheetStyle];
  uint64_t v3 = (uint64_t *)MEMORY[0x1E4FB28C8];
  if (v2 != 1) {
    uint64_t v3 = (uint64_t *)MEMORY[0x1E4FB2998];
  }
  uint64_t v4 = *v3;
  id v5 = (void *)MEMORY[0x1E4FB08E0];
  return (id)[v5 preferredFontForTextStyle:v4];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v6 = [(SBHWidgetSearchController *)self searchBar];
  uint64_t v4 = [v6 searchTextField];
  id v5 = [(SBHWidgetSearchController *)self _textFieldFont];
  [v4 setFont:v5];
}

- (UIView)searchBarTextFieldBackgroundView
{
  return self->_searchBarTextFieldBackgroundView;
}

- (UIView)searchBarBackgroundView
{
  return self->_searchBarBackgroundView;
}

- (void)setSearchBarBackgroundView:(id)a3
{
}

- (double)textFieldToWidgetsSpacing
{
  return self->_textFieldToWidgetsSpacing;
}

- (void)setTextFieldToWidgetsSpacing:(double)a3
{
  self->_textFieldToWidgetsSpacing = a3;
}

- (BOOL)alwaysShowBarBackground
{
  return self->_alwaysShowBarBackground;
}

- (BOOL)shouldInsetContentForGrabber
{
  return self->_shouldInsetContentForGrabber;
}

- (BOOL)applicationCellIncludesGalleryListView
{
  return self->_applicationCellIncludesGalleryListView;
}

- (NSString)widthDefiningGridSizeClass
{
  return self->_widthDefiningGridSizeClass;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (double)textFieldExtraHeight
{
  return self->_textFieldExtraHeight;
}

- (void)setTextFieldExtraHeight:(double)a3
{
  self->_textFieldExtraHeight = a3;
}

- (double)textFieldToBarBackgroundBottomSpacing
{
  return self->_textFieldToBarBackgroundBottomSpacing;
}

- (void)setTextFieldToBarBackgroundBottomSpacing:(double)a3
{
  self->_textFieldToBarBackgroundBottomSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_widthDefiningGridSizeClass, 0);
  objc_storeStrong((id *)&self->_searchBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchBarTextFieldBackgroundView, 0);
  objc_storeStrong((id *)&self->_scrollProgressByClient, 0);
}

@end