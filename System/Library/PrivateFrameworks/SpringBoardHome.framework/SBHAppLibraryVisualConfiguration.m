@interface SBHAppLibraryVisualConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)usesInsetPlatterSearchAppearance;
- (CGSize)expandedCategoryPodIconSpacing;
- (CGSize)landscapeCategoryPodIconSpacing;
- (CGSize)portraitCategoryPodIconSpacing;
- (NSString)description;
- (SBHAppLibraryVisualConfiguration)init;
- (SBHSearchVisualConfiguration)activeSearchVisualConfiguration;
- (SBHSearchVisualConfiguration)compactSearchVisualConfiguration;
- (SBHSearchVisualConfiguration)extendedSearchVisualConfiguration;
- (SBHSearchVisualConfiguration)standardSearchVisualConfiguration;
- (double)searchContinuousCornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setActiveSearchVisualConfiguration:(id)a3;
- (void)setCompactSearchVisualConfiguration:(id)a3;
- (void)setExpandedCategoryPodIconSpacing:(CGSize)a3;
- (void)setExtendedSearchVisualConfiguration:(id)a3;
- (void)setLandscapeCategoryPodIconSpacing:(CGSize)a3;
- (void)setPortraitCategoryPodIconSpacing:(CGSize)a3;
- (void)setSearchContinuousCornerRadius:(double)a3;
- (void)setStandardSearchVisualConfiguration:(id)a3;
- (void)setUsesInsetPlatterSearchAppearance:(BOOL)a3;
@end

@implementation SBHAppLibraryVisualConfiguration

- (SBHAppLibraryVisualConfiguration)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBHAppLibraryVisualConfiguration;
  v2 = [(SBHAppLibraryVisualConfiguration *)&v14 init];
  v3 = (SBHAppLibraryVisualConfiguration *)v2;
  if (v2)
  {
    long long v4 = *MEMORY[0x1E4F1DB30];
    *(_OWORD *)(v2 + 56) = *MEMORY[0x1E4F1DB30];
    *(_OWORD *)(v2 + 72) = v4;
    *(_OWORD *)(v2 + 88) = v4;
    v2[8] = 0;
    *((void *)v2 + 2) = 0x4030000000000000;
    v5 = objc_alloc_init(SBHSearchVisualConfiguration);
    extendedSearchVisualConfiguration = v3->_extendedSearchVisualConfiguration;
    v3->_extendedSearchVisualConfiguration = v5;

    v7 = objc_alloc_init(SBHSearchVisualConfiguration);
    standardSearchVisualConfiguration = v3->_standardSearchVisualConfiguration;
    v3->_standardSearchVisualConfiguration = v7;

    v9 = objc_alloc_init(SBHSearchVisualConfiguration);
    compactSearchVisualConfiguration = v3->_compactSearchVisualConfiguration;
    v3->_compactSearchVisualConfiguration = v9;

    v11 = objc_alloc_init(SBHSearchVisualConfiguration);
    activeSearchVisualConfiguration = v3->_activeSearchVisualConfiguration;
    v3->_activeSearchVisualConfiguration = v11;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (char *)objc_alloc_init((Class)objc_opt_class());
  v6 = v5;
  if (v5)
  {
    *(CGSize *)(v5 + 56) = self->_portraitCategoryPodIconSpacing;
    *(CGSize *)(v5 + 72) = self->_landscapeCategoryPodIconSpacing;
    *(CGSize *)(v5 + 88) = self->_expandedCategoryPodIconSpacing;
    v5[8] = self->_usesInsetPlatterSearchAppearance;
    *((void *)v5 + 2) = *(void *)&self->_searchContinuousCornerRadius;
    id v7 = [(SBHSearchVisualConfiguration *)self->_extendedSearchVisualConfiguration copyWithZone:a3];
    v8 = (void *)v6[3];
    v6[3] = v7;

    id v9 = [(SBHSearchVisualConfiguration *)self->_standardSearchVisualConfiguration copyWithZone:a3];
    v10 = (void *)v6[4];
    v6[4] = v9;

    id v11 = [(SBHSearchVisualConfiguration *)self->_compactSearchVisualConfiguration copyWithZone:a3];
    v12 = (void *)v6[5];
    v6[5] = v11;

    id v13 = [(SBHSearchVisualConfiguration *)self->_activeSearchVisualConfiguration copyWithZone:a3];
    objc_super v14 = (void *)v6[6];
    v6[6] = v13;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (SBHAppLibraryVisualConfiguration *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      v8 = v7;
      BOOL v9 = self->_portraitCategoryPodIconSpacing.width == v7->_portraitCategoryPodIconSpacing.width
        && self->_portraitCategoryPodIconSpacing.height == v7->_portraitCategoryPodIconSpacing.height;
      if (v9
        && (self->_landscapeCategoryPodIconSpacing.width == v7->_landscapeCategoryPodIconSpacing.width
          ? (BOOL v10 = self->_landscapeCategoryPodIconSpacing.height == v7->_landscapeCategoryPodIconSpacing.height)
          : (BOOL v10 = 0),
            v10
         && (self->_expandedCategoryPodIconSpacing.width == v7->_expandedCategoryPodIconSpacing.width
           ? (BOOL v11 = self->_expandedCategoryPodIconSpacing.height == v7->_expandedCategoryPodIconSpacing.height)
           : (BOOL v11 = 0),
             v11
          && self->_usesInsetPlatterSearchAppearance == v7->_usesInsetPlatterSearchAppearance
          && self->_searchContinuousCornerRadius == v7->_searchContinuousCornerRadius
          && BSEqualObjects()
          && BSEqualObjects()
          && BSEqualObjects())))
      {
        char v12 = BSEqualObjects();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  double width = self->_expandedCategoryPodIconSpacing.width;
  CGFloat v4 = self->_portraitCategoryPodIconSpacing.width
     + self->_portraitCategoryPodIconSpacing.height
     + self->_landscapeCategoryPodIconSpacing.width
     + self->_landscapeCategoryPodIconSpacing.height
     + width
     + self->_expandedCategoryPodIconSpacing.height;
  LOBYTE(width) = self->_usesInsetPlatterSearchAppearance;
  double v5 = self->_searchContinuousCornerRadius + v4 + (double)*(unint64_t *)&width;
  double v6 = v5 + (double)[(SBHSearchVisualConfiguration *)self->_extendedSearchVisualConfiguration hash];
  double v7 = v6 + (double)[(SBHSearchVisualConfiguration *)self->_standardSearchVisualConfiguration hash];
  double v8 = v7 + (double)[(SBHSearchVisualConfiguration *)self->_compactSearchVisualConfiguration hash];
  return (unint64_t)(v8
                          + (double)[(SBHSearchVisualConfiguration *)self->_activeSearchVisualConfiguration hash]);
}

- (NSString)description
{
  return (NSString *)[(SBHAppLibraryVisualConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHAppLibraryVisualConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBHAppLibraryVisualConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  CGFloat v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  CGFloat v4 = [(SBHAppLibraryVisualConfiguration *)self succinctDescriptionBuilder];
  [(SBHAppLibraryVisualConfiguration *)self portraitCategoryPodIconSpacing];
  id v5 = (id)objc_msgSend(v4, "appendSize:withName:", @"portraitCategoryPodIconSpacing");
  [(SBHAppLibraryVisualConfiguration *)self landscapeCategoryPodIconSpacing];
  id v6 = (id)objc_msgSend(v4, "appendSize:withName:", @"landscapeCategoryPodIconSpacing");
  [(SBHAppLibraryVisualConfiguration *)self expandedCategoryPodIconSpacing];
  id v7 = (id)objc_msgSend(v4, "appendSize:withName:", @"expandedCategoryPodIconSpacing");
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBHAppLibraryVisualConfiguration usesInsetPlatterSearchAppearance](self, "usesInsetPlatterSearchAppearance"), @"usesInsetPlatterSearchAppearance");
  [(SBHAppLibraryVisualConfiguration *)self searchContinuousCornerRadius];
  id v9 = (id)objc_msgSend(v4, "appendFloat:withName:", @"searchContinuousCornerRadius");
  BOOL v10 = [(SBHAppLibraryVisualConfiguration *)self extendedSearchVisualConfiguration];
  id v11 = (id)[v4 appendObject:v10 withName:@"extendedSearchVisualConfiguration"];

  char v12 = [(SBHAppLibraryVisualConfiguration *)self standardSearchVisualConfiguration];
  id v13 = (id)[v4 appendObject:v12 withName:@"standardSearchVisualConfiguration"];

  objc_super v14 = [(SBHAppLibraryVisualConfiguration *)self compactSearchVisualConfiguration];
  id v15 = (id)[v4 appendObject:v14 withName:@"compactSearchVisualConfiguration"];

  v16 = [(SBHAppLibraryVisualConfiguration *)self activeSearchVisualConfiguration];
  id v17 = (id)[v4 appendObject:v16 withName:@"activeSearchVisualConfiguration"];

  return v4;
}

- (CGSize)portraitCategoryPodIconSpacing
{
  double width = self->_portraitCategoryPodIconSpacing.width;
  double height = self->_portraitCategoryPodIconSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPortraitCategoryPodIconSpacing:(CGSize)a3
{
  self->_portraitCategoryPodIconSpacing = a3;
}

- (CGSize)landscapeCategoryPodIconSpacing
{
  double width = self->_landscapeCategoryPodIconSpacing.width;
  double height = self->_landscapeCategoryPodIconSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLandscapeCategoryPodIconSpacing:(CGSize)a3
{
  self->_landscapeCategoryPodIconSpacing = a3;
}

- (CGSize)expandedCategoryPodIconSpacing
{
  double width = self->_expandedCategoryPodIconSpacing.width;
  double height = self->_expandedCategoryPodIconSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setExpandedCategoryPodIconSpacing:(CGSize)a3
{
  self->_expandedCategoryPodIconSpacing = a3;
}

- (BOOL)usesInsetPlatterSearchAppearance
{
  return self->_usesInsetPlatterSearchAppearance;
}

- (void)setUsesInsetPlatterSearchAppearance:(BOOL)a3
{
  self->_usesInsetPlatterSearchAppearance = a3;
}

- (double)searchContinuousCornerRadius
{
  return self->_searchContinuousCornerRadius;
}

- (void)setSearchContinuousCornerRadius:(double)a3
{
  self->_searchContinuousCornerRadius = a3;
}

- (SBHSearchVisualConfiguration)extendedSearchVisualConfiguration
{
  return self->_extendedSearchVisualConfiguration;
}

- (void)setExtendedSearchVisualConfiguration:(id)a3
{
}

- (SBHSearchVisualConfiguration)standardSearchVisualConfiguration
{
  return self->_standardSearchVisualConfiguration;
}

- (void)setStandardSearchVisualConfiguration:(id)a3
{
}

- (SBHSearchVisualConfiguration)compactSearchVisualConfiguration
{
  return self->_compactSearchVisualConfiguration;
}

- (void)setCompactSearchVisualConfiguration:(id)a3
{
}

- (SBHSearchVisualConfiguration)activeSearchVisualConfiguration
{
  return self->_activeSearchVisualConfiguration;
}

- (void)setActiveSearchVisualConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSearchVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_compactSearchVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_standardSearchVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_extendedSearchVisualConfiguration, 0);
}

@end