@interface SBIconListGridLayout
- (BOOL)enforceLayoutInsetsForAxis:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsLabels;
- (BOOL)widgetsSupportDynamicText;
- (NSString)description;
- (NSString)rotatedLayoutClusterGridSizeClass;
- (SBHAppLibraryVisualConfiguration)appLibraryVisualConfiguration;
- (SBHFloatingDockVisualConfiguration)floatingDockVisualConfiguration;
- (SBHFloatyFolderVisualConfiguration)floatyFolderVisualConfiguration;
- (SBHFolderIconVisualConfiguration)folderIconVisualConfiguration;
- (SBHIconAccessoryVisualConfiguration)iconAccessoryVisualConfiguration;
- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes;
- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration;
- (SBHSidebarVisualConfiguration)sidebarVisualConfiguration;
- (SBIconImageInfo)iconImageInfo;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3 orientation:(id)a4;
- (SBIconListGridLayout)init;
- (SBIconListGridLayout)initWithLayoutConfiguration:(id)a3;
- (SBIconListGridLayoutConfiguration)layoutConfiguration;
- (UIEdgeInsets)additionalWidgetLayoutInsetsForOrientation:(int64_t)a3;
- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3;
- (UIEdgeInsets)widgetContentMargins;
- (double)editingAnimationStrengthForGridSizeClass:(id)a3;
- (id)accessoryBoldFont;
- (id)accessoryFont;
- (id)accessoryFontForContentSizeCategory:(id)a3 options:(unint64_t)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)iconGridSizeClassSizesForOrientation:(int64_t)a3;
- (id)labelFontForContentSizeCategory:(id)a3 options:(unint64_t)a4;
- (id)labelVisualConfigurationForContentSizeCategory:(id)a3 options:(unint64_t)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)iconSpacingAxisMatchingBehavior;
- (unint64_t)hash;
- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3;
- (unint64_t)numberOfRowsForOrientation:(int64_t)a3;
@end

@implementation SBIconListGridLayout

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3 orientation:(id)a4
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconImageInfoForGridSizeClass:a4 orientation:a5];
}

- (SBIconImageInfo)iconImageInfo
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconImageInfo];
}

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  layoutConfiguration = self->_layoutConfiguration;
  if ((unint64_t)(a3 - 3) > 1)
  {
    return [(SBIconListGridLayoutConfiguration *)layoutConfiguration numberOfPortraitColumns];
  }
  else
  {
    unint64_t result = [(SBIconListGridLayoutConfiguration *)layoutConfiguration numberOfLandscapeColumns];
    if (!result)
    {
      v6 = self->_layoutConfiguration;
      return [(SBIconListGridLayoutConfiguration *)v6 numberOfPortraitRows];
    }
  }
  return result;
}

- (id)labelVisualConfigurationForContentSizeCategory:(id)a3 options:(unint64_t)a4
{
  return -[SBIconListGridLayoutConfiguration iconLabelVisualConfigurationForContentSizeCategory:](self->_layoutConfiguration, "iconLabelVisualConfigurationForContentSizeCategory:", a3, a4);
}

- (SBIconListGridLayoutConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (BOOL)showsLabels
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration showsLabels];
}

- (id)labelFontForContentSizeCategory:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  int v7 = [MEMORY[0x1E4F29060] isMainThread];
  v8 = [NSString stringWithFormat:@"%@:%lu", v6, v4 & 1];
  if (!v7
    || ([(NSMutableDictionary *)self->_labelFonts objectForKey:v8],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v10 = [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconLabelVisualConfigurationForContentSizeCategory:v6];
    [v10 fontSize];
    if (v11 <= 0.0) {
      +[SBIconLabelImageParametersBuilder defaultFontForContentSizeCategory:v6 languageInsets:0];
    }
    else {
    v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:weight:");
    }
    if (v7) {
      [(NSMutableDictionary *)self->_labelFonts setObject:v9 forKey:v8];
    }
  }
  return v9;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration rootFolderVisualConfiguration];
}

- (SBHFloatyFolderVisualConfiguration)floatyFolderVisualConfiguration
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration floatyFolderVisualConfiguration];
}

- (SBHFolderIconVisualConfiguration)folderIconVisualConfiguration
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration folderIconVisualConfiguration];
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  layoutConfiguration = self->_layoutConfiguration;
  if ((unint64_t)(a3 - 3) > 1) {
    [(SBIconListGridLayoutConfiguration *)layoutConfiguration portraitLayoutInsets];
  }
  else {
    [(SBIconListGridLayoutConfiguration *)layoutConfiguration landscapeLayoutInsets];
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  layoutConfiguration = self->_layoutConfiguration;
  if ((unint64_t)(a3 - 3) > 1)
  {
    return [(SBIconListGridLayoutConfiguration *)layoutConfiguration numberOfPortraitRows];
  }
  else
  {
    unint64_t result = [(SBIconListGridLayoutConfiguration *)layoutConfiguration numberOfLandscapeRows];
    if (!result)
    {
      double v6 = self->_layoutConfiguration;
      return [(SBIconListGridLayoutConfiguration *)v6 numberOfPortraitColumns];
    }
  }
  return result;
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconSpacingAxisMatchingBehavior];
}

- (SBHIconAccessoryVisualConfiguration)iconAccessoryVisualConfiguration
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconAccessoryVisualConfiguration];
}

- (id)accessoryFontForContentSizeCategory:(id)a3 options:(unint64_t)a4
{
  if (a4) {
    [(SBIconListGridLayout *)self accessoryBoldFont];
  }
  else {
  double v4 = [(SBIconListGridLayout *)self accessoryFont];
  }
  return v4;
}

- (id)accessoryFont
{
  int v3 = [MEMORY[0x1E4F29060] isMainThread];
  if (!v3 || (double v4 = self->_accessoryFont) == 0)
  {
    double v5 = [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconAccessoryVisualConfiguration];
    [v5 fontSize];
    double v7 = v6;

    double v8 = 16.0;
    if (v7 > 0.0) {
      double v8 = v7;
    }
    double v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v8];
    if (v3) {
      objc_storeStrong((id *)&self->_accessoryFont, v4);
    }
  }
  return v4;
}

- (SBIconListGridLayout)initWithLayoutConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIconListGridLayout;
  double v5 = [(SBIconListGridLayout *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    layoutConfiguration = v5->_layoutConfiguration;
    v5->_layoutConfiguration = (SBIconListGridLayoutConfiguration *)v6;

    double v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    labelFonts = v5->_labelFonts;
    v5->_labelFonts = v8;
  }
  return v5;
}

- (SBIconListGridLayout)init
{
  int v3 = objc_alloc_init(SBIconListGridLayoutConfiguration);
  -[SBIconListGridLayoutConfiguration setIconImageInfo:](v3, "setIconImageInfo:", 70.0, 70.0, 2.0, 20.0);
  id v4 = [(SBIconListGridLayout *)self initWithLayoutConfiguration:v3];

  return v4;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconImageInfoForGridSizeClass:a4];
}

- (double)editingAnimationStrengthForGridSizeClass:(id)a3
{
  [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration editingAnimationStrengthForGridSizeClass:a3];
  return result;
}

- (UIEdgeInsets)additionalWidgetLayoutInsetsForOrientation:(int64_t)a3
{
  layoutConfiguration = self->_layoutConfiguration;
  if ((unint64_t)(a3 - 3) > 1) {
    [(SBIconListGridLayoutConfiguration *)layoutConfiguration portraitAdditionalWidgetLayoutInsets];
  }
  else {
    [(SBIconListGridLayoutConfiguration *)layoutConfiguration landscapeAdditionalWidgetLayoutInsets];
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (BOOL)enforceLayoutInsetsForAxis:(unint64_t)a3
{
  return ([(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration layoutInsetsEnforcementAxis] & a3) != 0;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconGridSizeClassSizes];
}

- (id)iconGridSizeClassSizesForOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 1
    || ([(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration rotatedIconGridSizeClassSizes], (double v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v4 = [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconGridSizeClassSizes];
  }
  return v4;
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration supportedIconGridSizeClasses];
}

- (NSString)rotatedLayoutClusterGridSizeClass
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration rotatedLayoutClusterGridSizeClass];
}

- (UIEdgeInsets)widgetContentMargins
{
  [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration widgetContentMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)widgetsSupportDynamicText
{
  return 1;
}

- (id)accessoryBoldFont
{
  int v3 = [MEMORY[0x1E4F29060] isMainThread];
  if (!v3 || (double v4 = self->_accessoryBoldFont) == 0)
  {
    double v5 = [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration iconAccessoryVisualConfiguration];
    [v5 fontSize];
    double v7 = v6;

    double v8 = 16.0;
    if (v7 > 0.0) {
      double v8 = v7;
    }
    double v4 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:v8];
    if (v3) {
      objc_storeStrong((id *)&self->_accessoryBoldFont, v4);
    }
  }
  return v4;
}

- (SBHSidebarVisualConfiguration)sidebarVisualConfiguration
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration sidebarVisualConfiguration];
}

- (SBHAppLibraryVisualConfiguration)appLibraryVisualConfiguration
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration appLibraryVisualConfiguration];
}

- (SBHFloatingDockVisualConfiguration)floatingDockVisualConfiguration
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration floatingDockVisualConfiguration];
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SBIconListGridLayout *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    double v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      char v7 = BSEqualObjects();
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(SBIconListGridLayoutConfiguration *)self->_layoutConfiguration hash];
}

- (NSString)description
{
  return (NSString *)[(SBIconListGridLayout *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  double v2 = [(SBIconListGridLayout *)self succinctDescriptionBuilder];
  int v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(SBIconListGridLayout *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v4 = [(SBIconListGridLayout *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_layoutConfiguration withName:@"layoutConfiguration"];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_accessoryBoldFont, 0);
  objc_storeStrong((id *)&self->_accessoryFont, 0);
  objc_storeStrong((id *)&self->_labelFonts, 0);
}

@end