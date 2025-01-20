@interface SBIconListGridLayoutConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)showsLabels;
- (CGSize)listSizeForIconSpacingCalculation;
- (NSString)description;
- (NSString)rotatedLayoutClusterGridSizeClass;
- (SBHAppLibraryVisualConfiguration)appLibraryVisualConfiguration;
- (SBHFloatingDockVisualConfiguration)floatingDockVisualConfiguration;
- (SBHFloatyFolderVisualConfiguration)floatyFolderVisualConfiguration;
- (SBHFolderIconVisualConfiguration)folderIconVisualConfiguration;
- (SBHIconAccessoryVisualConfiguration)iconAccessoryVisualConfiguration;
- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes;
- (SBHIconGridSizeClassSizeMap)rotatedIconGridSizeClassSizes;
- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration;
- (SBHSidebarVisualConfiguration)sidebarVisualConfiguration;
- (SBIconImageInfo)iconImageInfo;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3 orientation:(id)a4;
- (SBIconListGridLayoutConfiguration)init;
- (UIEdgeInsets)landscapeAdditionalWidgetLayoutInsets;
- (UIEdgeInsets)landscapeLayoutInsets;
- (UIEdgeInsets)portraitAdditionalWidgetLayoutInsets;
- (UIEdgeInsets)portraitLayoutInsets;
- (UIEdgeInsets)widgetContentMargins;
- (double)editingAnimationStrengthForGridSizeClass:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)iconLabelVisualConfigurationForContentSizeCategory:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)iconSpacingAxisMatchingBehavior;
- (unint64_t)hash;
- (unint64_t)layoutInsetsEnforcementAxis;
- (unint64_t)numberOfLandscapeColumns;
- (unint64_t)numberOfLandscapeRows;
- (unint64_t)numberOfPortraitColumns;
- (unint64_t)numberOfPortraitRows;
- (void)setAppLibraryVisualConfiguration:(id)a3;
- (void)setEditingAnimationStrength:(double)a3 forGridSizeClass:(id)a4;
- (void)setEditingAnimationStrengths:(id)a3;
- (void)setFloatyFolderVisualConfiguration:(id)a3;
- (void)setFolderIconVisualConfiguration:(id)a3;
- (void)setIconAccessoryVisualConfiguration:(id)a3;
- (void)setIconGridSizeClassSizes:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4;
- (void)setIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4 orientation:(int64_t)a5;
- (void)setIconLabelVisualConfiguration:(id)a3 forContentSizeCategory:(id)a4;
- (void)setIconSpacingAxisMatchingBehavior:(int64_t)a3;
- (void)setLandscapeAdditionalWidgetLayoutInsets:(UIEdgeInsets)a3;
- (void)setLandscapeLayoutInsets:(UIEdgeInsets)a3;
- (void)setLayoutInsetsEnforcementAxis:(unint64_t)a3;
- (void)setListSizeForIconSpacingCalculation:(CGSize)a3;
- (void)setNumberOfLandscapeColumns:(unint64_t)a3;
- (void)setNumberOfLandscapeRows:(unint64_t)a3;
- (void)setNumberOfPortraitColumns:(unint64_t)a3;
- (void)setNumberOfPortraitRows:(unint64_t)a3;
- (void)setPortraitAdditionalWidgetLayoutInsets:(UIEdgeInsets)a3;
- (void)setPortraitLayoutInsets:(UIEdgeInsets)a3;
- (void)setRotatedIconGridSizeClassSizes:(id)a3;
- (void)setRotatedLayoutClusterGridSizeClass:(id)a3;
- (void)setShowsLabels:(BOOL)a3;
- (void)setSidebarVisualConfiguration:(id)a3;
- (void)setSupportedIconGridSizeClasses:(id)a3;
- (void)setWidgetContentMargins:(UIEdgeInsets)a3;
@end

@implementation SBIconListGridLayoutConfiguration

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3 orientation:(id)a4
{
  id v7 = a4;
  if ((unint64_t)(a5 - 3) > 1
    || (p_iconGridSizeClassIconImageInfos = &self->_landscapeIconGridSizeClassIconImageInfos,
        ![(SBHIconGridSizeClassIconImageInfoMap *)self->_landscapeIconGridSizeClassIconImageInfos hasIconImageInfoForGridSizeClass:v7]))
  {
    p_iconGridSizeClassIconImageInfos = &self->_iconGridSizeClassIconImageInfos;
  }
  [(SBHIconGridSizeClassIconImageInfoMap *)*p_iconGridSizeClassIconImageInfos iconImageInfoForGridSizeClass:v7];

  return result;
}

- (SBIconImageInfo)iconImageInfo
{
  return [(SBIconListGridLayoutConfiguration *)self iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassDefault"];
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  return [(SBHIconGridSizeClassIconImageInfoMap *)self->_iconGridSizeClassIconImageInfos iconImageInfoForGridSizeClass:a4];
}

- (unint64_t)numberOfPortraitColumns
{
  return self->_numberOfPortraitColumns;
}

- (id)iconLabelVisualConfigurationForContentSizeCategory:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_iconLabelVisualConfigurations)
  {
LABEL_18:
    v10 = objc_alloc_init(SBHIconLabelVisualConfiguration);
    v6 = v5;
    goto LABEL_19;
  }
  v6 = SBHContentSizeCategoryClip(v4, (void *)*MEMORY[0x1E4FB27D0], (void *)*MEMORY[0x1E4FB2778]);

  uint64_t v7 = [(NSMutableDictionary *)self->_iconLabelVisualConfigurations objectForKey:v6];
  BOOL v8 = v7 == 0;
  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  if (!v9)
  {
    uint64_t v11 = *MEMORY[0x1E4FB27D8];
    while (([v6 isEqualToString:v11] & 1) == 0)
    {
      uint64_t v12 = SBHContentSizeCategoryOneSmallerThanSizeCategory(v6);

      uint64_t v13 = [(NSMutableDictionary *)self->_iconLabelVisualConfigurations objectForKey:v12];
      BOOL v8 = v13 == 0;
      if (v13) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v12 == 0;
      }
      v6 = (void *)v12;
      if (v14)
      {
        v10 = (SBHIconLabelVisualConfiguration *)v13;
        v6 = (void *)v12;
        goto LABEL_15;
      }
    }
    v5 = v6;
    goto LABEL_18;
  }
  v10 = (SBHIconLabelVisualConfiguration *)v7;
LABEL_15:
  v5 = v6;
  if (v8) {
    goto LABEL_18;
  }
LABEL_19:

  return v10;
}

- (CGSize)listSizeForIconSpacingCalculation
{
  double width = self->_listSizeForIconSpacingCalculation.width;
  double height = self->_listSizeForIconSpacingCalculation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)numberOfLandscapeColumns
{
  return self->_numberOfLandscapeColumns;
}

- (BOOL)showsLabels
{
  return self->_showsLabels;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  return self->_rootFolderVisualConfiguration;
}

- (SBHFloatyFolderVisualConfiguration)floatyFolderVisualConfiguration
{
  return self->_floatyFolderVisualConfiguration;
}

- (SBHFolderIconVisualConfiguration)folderIconVisualConfiguration
{
  return self->_folderIconVisualConfiguration;
}

- (UIEdgeInsets)portraitLayoutInsets
{
  double top = self->_portraitLayoutInsets.top;
  double left = self->_portraitLayoutInsets.left;
  double bottom = self->_portraitLayoutInsets.bottom;
  double right = self->_portraitLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)numberOfPortraitRows
{
  return self->_numberOfPortraitRows;
}

- (unint64_t)numberOfLandscapeRows
{
  return self->_numberOfLandscapeRows;
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return self->_iconSpacingAxisMatchingBehavior;
}

- (SBHIconAccessoryVisualConfiguration)iconAccessoryVisualConfiguration
{
  return self->_iconAccessoryVisualConfiguration;
}

- (SBIconListGridLayoutConfiguration)init
{
  v25.receiver = self;
  v25.super_class = (Class)SBIconListGridLayoutConfiguration;
  v2 = [(SBIconListGridLayoutConfiguration *)&v25 init];
  v3 = v2;
  if (v2)
  {
    *(int64x2_t *)&v2->_numberOfPortraitColumns = vdupq_n_s64(3uLL);
    id v4 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
    iconGridSizeClassSizes = v3->_iconGridSizeClassSizes;
    v3->_iconGridSizeClassSizes = v4;

    uint64_t v6 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
    supportedIconGridSizeClasses = v3->_supportedIconGridSizeClasses;
    v3->_supportedIconGridSizeClasses = (SBHIconGridSizeClassSet *)v6;

    objc_storeStrong((id *)&v3->_rotatedLayoutClusterGridSizeClass, @"SBHIconGridSizeClassDefault");
    v3->_showsLabels = 1;
    BOOL v8 = objc_alloc_init(SBHIconAccessoryVisualConfiguration);
    iconAccessoryVisualConfiguration = v3->_iconAccessoryVisualConfiguration;
    v3->_iconAccessoryVisualConfiguration = v8;

    v10 = objc_alloc_init(SBHFolderIconVisualConfiguration);
    folderIconVisualConfiguration = v3->_folderIconVisualConfiguration;
    v3->_folderIconVisualConfiguration = v10;

    uint64_t v12 = objc_alloc_init(SBHFloatyFolderVisualConfiguration);
    floatyFolderVisualConfiguration = v3->_floatyFolderVisualConfiguration;
    v3->_floatyFolderVisualConfiguration = v12;

    BOOL v14 = objc_alloc_init(SBHSidebarVisualConfiguration);
    sidebarVisualConfiguration = v3->_sidebarVisualConfiguration;
    v3->_sidebarVisualConfiguration = v14;

    v16 = objc_alloc_init(SBHRootFolderVisualConfiguration);
    rootFolderVisualConfiguration = v3->_rootFolderVisualConfiguration;
    v3->_rootFolderVisualConfiguration = v16;

    v18 = objc_alloc_init(SBHAppLibraryVisualConfiguration);
    appLibraryVisualConfiguration = v3->_appLibraryVisualConfiguration;
    v3->_appLibraryVisualConfiguration = v18;

    v20 = objc_alloc_init(SBHFloatingDockVisualConfiguration);
    floatingDockVisualConfiguration = v3->_floatingDockVisualConfiguration;
    v3->_floatingDockVisualConfiguration = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    iconGridSizeClassEditingAnimationStrengths = v3->_iconGridSizeClassEditingAnimationStrengths;
    v3->_iconGridSizeClassEditingAnimationStrengths = v22;
  }
  return v3;
}

- (void)setIconLabelVisualConfiguration:(id)a3 forContentSizeCategory:(id)a4
{
  id v11 = a3;
  uint64_t v6 = SBHContentSizeCategoryClip(a4, (void *)*MEMORY[0x1E4FB27D0], (void *)*MEMORY[0x1E4FB2778]);
  iconLabelVisualConfigurations = self->_iconLabelVisualConfigurations;
  if (!iconLabelVisualConfigurations)
  {
    BOOL v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v9 = self->_iconLabelVisualConfigurations;
    self->_iconLabelVisualConfigurations = v8;

    iconLabelVisualConfigurations = self->_iconLabelVisualConfigurations;
  }
  v10 = (void *)[v11 copy];
  [(NSMutableDictionary *)iconLabelVisualConfigurations setObject:v10 forKey:v6];
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4
{
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4 orientation:(int64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  v15 = a3;
  v22 = v15;
  if ((char *)a4 - 3 <= (char *)1)
  {
    landscapeIconGridSizeClassIconImageInfos = self->_landscapeIconGridSizeClassIconImageInfos;
    p_landscapeIconGridSizeClassIconImageInfos = &self->_landscapeIconGridSizeClassIconImageInfos;
    v16 = landscapeIconGridSizeClassIconImageInfos;
    if (landscapeIconGridSizeClassIconImageInfos) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  iconGridSizeClassIconImageInfos = self->_iconGridSizeClassIconImageInfos;
  p_landscapeIconGridSizeClassIconImageInfos = &self->_iconGridSizeClassIconImageInfos;
  v16 = iconGridSizeClassIconImageInfos;
  if (!iconGridSizeClassIconImageInfos)
  {
LABEL_3:
    v19 = objc_alloc_init(SBHMutableIconGridSizeClassIconImageInfoMap);
    v20 = *p_landscapeIconGridSizeClassIconImageInfos;
    *p_landscapeIconGridSizeClassIconImageInfos = v19;

    v16 = *p_landscapeIconGridSizeClassIconImageInfos;
    v15 = v22;
  }
LABEL_4:
  -[SBHMutableIconGridSizeClassIconImageInfoMap setIconImageInfo:forGridSizeClass:](v16, "setIconImageInfo:forGridSizeClass:", v15, v13, v12, v11, v10);
}

- (double)editingAnimationStrengthForGridSizeClass:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_iconGridSizeClassEditingAnimationStrengths objectForKey:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (void)setEditingAnimationStrength:(double)a3 forGridSizeClass:(id)a4
{
  iconGridSizeClassEditingAnimationStrengths = self->_iconGridSizeClassEditingAnimationStrengths;
  double v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(NSMutableDictionary *)iconGridSizeClassEditingAnimationStrengths setObject:v8 forKey:v7];
}

- (void)setEditingAnimationStrengths:(id)a3
{
  id v4 = (NSMutableDictionary *)[a3 mutableCopy];
  iconGridSizeClassEditingAnimationStrengths = self->_iconGridSizeClassEditingAnimationStrengths;
  self->_iconGridSizeClassEditingAnimationStrengths = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_alloc_init((Class)objc_opt_class());
  double v6 = v5;
  if (v5)
  {
    v5[6] = self->_numberOfPortraitColumns;
    v5[7] = self->_numberOfPortraitRows;
    v5[8] = self->_numberOfLandscapeColumns;
    v5[9] = self->_numberOfLandscapeRows;
    id v7 = [(SBHIconGridSizeClassSizeMap *)self->_iconGridSizeClassSizes copyWithZone:a3];
    id v8 = (void *)v6[10];
    v6[10] = v7;

    id v9 = [(SBHIconGridSizeClassSizeMap *)self->_rotatedIconGridSizeClassSizes copyWithZone:a3];
    double v10 = (void *)v6[11];
    v6[11] = v9;

    id v11 = [(SBHIconGridSizeClassSet *)self->_supportedIconGridSizeClasses copyWithZone:a3];
    double v12 = (void *)v6[12];
    v6[12] = v11;

    long long v13 = *(_OWORD *)&self->_portraitLayoutInsets.top;
    *(_OWORD *)(v6 + 27) = *(_OWORD *)&self->_portraitLayoutInsets.bottom;
    *(_OWORD *)(v6 + 25) = v13;
    long long v14 = *(_OWORD *)&self->_landscapeLayoutInsets.top;
    *(_OWORD *)(v6 + 31) = *(_OWORD *)&self->_landscapeLayoutInsets.bottom;
    *(_OWORD *)(v6 + 29) = v14;
    long long v15 = *(_OWORD *)&self->_portraitAdditionalWidgetLayoutInsets.bottom;
    *(_OWORD *)(v6 + 33) = *(_OWORD *)&self->_portraitAdditionalWidgetLayoutInsets.top;
    *(_OWORD *)(v6 + 35) = v15;
    long long v16 = *(_OWORD *)&self->_landscapeAdditionalWidgetLayoutInsets.bottom;
    *(_OWORD *)(v6 + 37) = *(_OWORD *)&self->_landscapeAdditionalWidgetLayoutInsets.top;
    *(_OWORD *)(v6 + 39) = v16;
    v6[13] = self->_layoutInsetsEnforcementAxis;
    long long v17 = *(_OWORD *)&self->_widgetContentMargins.bottom;
    *(_OWORD *)(v6 + 41) = *(_OWORD *)&self->_widgetContentMargins.top;
    *(_OWORD *)(v6 + 43) = v17;
    *((unsigned char *)v6 + 40) = self->_showsLabels;
    id v18 = [(SBHIconGridSizeClassIconImageInfoMap *)self->_iconGridSizeClassIconImageInfos mutableCopyWithZone:a3];
    v19 = (void *)v6[2];
    v6[2] = v18;

    id v20 = [(SBHIconGridSizeClassIconImageInfoMap *)self->_landscapeIconGridSizeClassIconImageInfos mutableCopyWithZone:a3];
    v21 = (void *)v6[3];
    v6[3] = v20;

    uint64_t v22 = [(NSMutableDictionary *)self->_iconGridSizeClassEditingAnimationStrengths mutableCopyWithZone:a3];
    v23 = (void *)v6[4];
    v6[4] = v22;

    objc_storeStrong((id *)v6 + 14, self->_rotatedLayoutClusterGridSizeClass);
    *(CGSize *)(v6 + 23) = self->_listSizeForIconSpacingCalculation;
    v6[15] = self->_iconSpacingAxisMatchingBehavior;
    id v24 = [(SBHIconAccessoryVisualConfiguration *)self->_iconAccessoryVisualConfiguration copyWithZone:a3];
    objc_super v25 = (void *)v6[16];
    v6[16] = v24;

    uint64_t v26 = [(NSMutableDictionary *)self->_iconLabelVisualConfigurations copyWithZone:a3];
    v27 = (void *)v6[1];
    v6[1] = v26;

    id v28 = [(SBHFolderIconVisualConfiguration *)self->_folderIconVisualConfiguration copyWithZone:a3];
    v29 = (void *)v6[17];
    v6[17] = v28;

    id v30 = [(SBHFloatyFolderVisualConfiguration *)self->_floatyFolderVisualConfiguration copyWithZone:a3];
    v31 = (void *)v6[18];
    v6[18] = v30;

    id v32 = [(SBHSidebarVisualConfiguration *)self->_sidebarVisualConfiguration copyWithZone:a3];
    v33 = (void *)v6[20];
    v6[20] = v32;

    id v34 = [(SBHRootFolderVisualConfiguration *)self->_rootFolderVisualConfiguration copyWithZone:a3];
    v35 = (void *)v6[21];
    v6[21] = v34;

    id v36 = [(SBHAppLibraryVisualConfiguration *)self->_appLibraryVisualConfiguration copyWithZone:a3];
    v37 = (void *)v6[19];
    v6[19] = v36;

    id v38 = [(SBHFloatingDockVisualConfiguration *)self->_floatingDockVisualConfiguration copyWithZone:a3];
    v39 = (void *)v6[22];
    v6[22] = v38;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBIconListGridLayoutConfiguration *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    double v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      id v8 = v7;
      if (self->_numberOfPortraitColumns != v7->_numberOfPortraitColumns) {
        goto LABEL_34;
      }
      if (self->_numberOfPortraitRows != v7->_numberOfPortraitRows) {
        goto LABEL_34;
      }
      if (self->_numberOfLandscapeColumns != v7->_numberOfLandscapeColumns) {
        goto LABEL_34;
      }
      if (self->_numberOfLandscapeRows != v7->_numberOfLandscapeRows) {
        goto LABEL_34;
      }
      if (!BSEqualObjects()) {
        goto LABEL_34;
      }
      if (!BSEqualObjects()) {
        goto LABEL_34;
      }
      if (!BSEqualObjects()) {
        goto LABEL_34;
      }
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_portraitLayoutInsets.top, *(float64x2_t *)&v8->_portraitLayoutInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_portraitLayoutInsets.bottom, *(float64x2_t *)&v8->_portraitLayoutInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_34; {
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_landscapeLayoutInsets.top, *(float64x2_t *)&v8->_landscapeLayoutInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_landscapeLayoutInsets.bottom, *(float64x2_t *)&v8->_landscapeLayoutInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_34;
      }
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_portraitAdditionalWidgetLayoutInsets.top, *(float64x2_t *)&v8->_portraitAdditionalWidgetLayoutInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_portraitAdditionalWidgetLayoutInsets.bottom, *(float64x2_t *)&v8->_portraitAdditionalWidgetLayoutInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_34; {
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_landscapeAdditionalWidgetLayoutInsets.top, *(float64x2_t *)&v8->_landscapeAdditionalWidgetLayoutInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_landscapeAdditionalWidgetLayoutInsets.bottom, *(float64x2_t *)&v8->_landscapeAdditionalWidgetLayoutInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_34;
      }
      if (self->_layoutInsetsEnforcementAxis != v8->_layoutInsetsEnforcementAxis) {
        goto LABEL_34;
      }
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_widgetContentMargins.top, *(float64x2_t *)&v8->_widgetContentMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_widgetContentMargins.bottom, *(float64x2_t *)&v8->_widgetContentMargins.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_34; {
      if (!BSEqualObjects())
      }
        goto LABEL_34;
      if (!BSEqualObjects()) {
        goto LABEL_34;
      }
      if (!BSEqualDictionaries()) {
        goto LABEL_34;
      }
      rotatedLayoutClusterGridSizeClass = self->_rotatedLayoutClusterGridSizeClass;
      if (rotatedLayoutClusterGridSizeClass != v8->_rotatedLayoutClusterGridSizeClass
        && !-[NSString isEqualToString:](rotatedLayoutClusterGridSizeClass, "isEqualToString:"))
      {
        goto LABEL_34;
      }
      char v10 = 0;
      if (self->_listSizeForIconSpacingCalculation.width != v8->_listSizeForIconSpacingCalculation.width
        || self->_listSizeForIconSpacingCalculation.height != v8->_listSizeForIconSpacingCalculation.height)
      {
        goto LABEL_35;
      }
      if (self->_showsLabels == v8->_showsLabels
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects())
      {
        char v10 = BSEqualObjects();
      }
      else
      {
LABEL_34:
        char v10 = 0;
      }
LABEL_35:

      goto LABEL_36;
    }
    char v10 = 0;
  }
LABEL_36:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_numberOfPortraitRows
     + self->_numberOfPortraitColumns
     + self->_numberOfLandscapeColumns
     + self->_numberOfLandscapeRows;
  unint64_t v4 = [(SBHIconGridSizeClassSizeMap *)self->_iconGridSizeClassSizes hash];
  unint64_t v5 = v3 + v4 + [(SBHIconGridSizeClassSizeMap *)self->_rotatedIconGridSizeClassSizes hash];
  CGFloat v6 = self->_widgetContentMargins.left
     + self->_widgetContentMargins.bottom
     + self->_widgetContentMargins.right
     + self->_widgetContentMargins.top
     + self->_landscapeAdditionalWidgetLayoutInsets.left
     + self->_landscapeAdditionalWidgetLayoutInsets.bottom
     + self->_landscapeAdditionalWidgetLayoutInsets.right
     + self->_landscapeAdditionalWidgetLayoutInsets.top
     + self->_portraitAdditionalWidgetLayoutInsets.left
     + self->_portraitAdditionalWidgetLayoutInsets.bottom
     + self->_portraitAdditionalWidgetLayoutInsets.right
     + self->_portraitAdditionalWidgetLayoutInsets.top
     + self->_landscapeLayoutInsets.left
     + self->_landscapeLayoutInsets.bottom
     + self->_landscapeLayoutInsets.right
     + self->_landscapeLayoutInsets.top
     + self->_portraitLayoutInsets.left
     + self->_portraitLayoutInsets.bottom
     + self->_portraitLayoutInsets.right
     + self->_portraitLayoutInsets.top
     + (double)(v5 + [(SBHIconGridSizeClassSet *)self->_supportedIconGridSizeClasses hash])
     + (double)self->_layoutInsetsEnforcementAxis;
  CGFloat v7 = v6 + (double)[(SBHIconGridSizeClassIconImageInfoMap *)self->_iconGridSizeClassIconImageInfos hash];
  CGFloat v8 = v7
     + (double)[(SBHIconGridSizeClassIconImageInfoMap *)self->_landscapeIconGridSizeClassIconImageInfos hash];
  CGFloat v9 = v8
     + (double)(unint64_t)[(NSMutableDictionary *)self->_iconGridSizeClassEditingAnimationStrengths hash];
  unint64_t v10 = [(NSString *)self->_rotatedLayoutClusterGridSizeClass hash];
  double width = self->_listSizeForIconSpacingCalculation.width;
  CGFloat v12 = self->_listSizeForIconSpacingCalculation.height + width + v9 + (double)v10;
  LOBYTE(width) = self->_showsLabels;
  CGFloat v13 = v12
      + (double)*(unint64_t *)&width
      + (double)[(SBHIconAccessoryVisualConfiguration *)self->_iconAccessoryVisualConfiguration hash];
  CGFloat v14 = v13 + (double)(unint64_t)[(NSMutableDictionary *)self->_iconLabelVisualConfigurations hash];
  CGFloat v15 = v14 + (double)[(SBHFolderIconVisualConfiguration *)self->_folderIconVisualConfiguration hash];
  CGFloat v16 = v15 + (double)[(SBHFloatyFolderVisualConfiguration *)self->_floatyFolderVisualConfiguration hash];
  CGFloat v17 = v16 + (double)[(SBHSidebarVisualConfiguration *)self->_sidebarVisualConfiguration hash];
  CGFloat v18 = v17 + (double)[(SBHRootFolderVisualConfiguration *)self->_rootFolderVisualConfiguration hash];
  CGFloat v19 = v18 + (double)[(SBHAppLibraryVisualConfiguration *)self->_appLibraryVisualConfiguration hash];
  return (unint64_t)(v19
                          + (double)[(SBHFloatingDockVisualConfiguration *)self->_floatingDockVisualConfiguration hash]);
}

- (NSString)description
{
  return (NSString *)[(SBIconListGridLayoutConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIconListGridLayoutConfiguration *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(SBIconListGridLayoutConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  unint64_t v4 = [(SBIconListGridLayoutConfiguration *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendUnsignedInteger:self->_numberOfPortraitColumns withName:@"numberOfPortraitColumns"];
  id v6 = (id)[v4 appendUnsignedInteger:self->_numberOfPortraitRows withName:@"numberOfPortraitRows"];
  id v7 = (id)[v4 appendUnsignedInteger:self->_numberOfLandscapeColumns withName:@"numberOfLandscapeColumns"];
  id v8 = (id)[v4 appendUnsignedInteger:self->_numberOfLandscapeRows withName:@"numberOfLandscapeRows"];
  CGFloat v9 = NSStringFromUIEdgeInsets(self->_portraitLayoutInsets);
  [v4 appendString:v9 withName:@"portraitLayoutInsets"];

  unint64_t v10 = NSStringFromUIEdgeInsets(self->_landscapeLayoutInsets);
  [v4 appendString:v10 withName:@"landscapeLayoutInsets"];

  id v11 = NSStringFromUIEdgeInsets(self->_widgetContentMargins);
  [v4 appendString:v11 withName:@"widgetContentMargins"];

  CGFloat v12 = NSStringFromUIEdgeInsets(self->_portraitAdditionalWidgetLayoutInsets);
  [v4 appendString:v12 withName:@"portraitAdditionalWidgetLayoutInsets"];

  CGFloat v13 = NSStringFromUIEdgeInsets(self->_landscapeAdditionalWidgetLayoutInsets);
  [v4 appendString:v13 withName:@"landscapeAdditionalWidgetLayoutInsets"];

  [(SBIconListGridLayoutConfiguration *)self iconImageInfo];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __75__SBIconListGridLayoutConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v41[3] = &unk_1E6AACA38;
  id v22 = v4;
  id v42 = v22;
  uint64_t v43 = v15;
  uint64_t v44 = v17;
  uint64_t v45 = v19;
  uint64_t v46 = v21;
  [v22 appendBodySectionWithName:@"iconImageInfo" multilinePrefix:0 block:v41];
  id v23 = (id)[v22 appendObject:self->_iconGridSizeClassSizes withName:@"iconGridSizeClassSizes"];
  id v24 = (id)[v22 appendObject:self->_rotatedIconGridSizeClassSizes withName:@"rotatedIconGridSizeClassSizes" skipIfNil:1];
  id v25 = (id)[v22 appendObject:self->_supportedIconGridSizeClasses withName:@"supportedIconGridSizeClasses"];
  uint64_t v26 = SBHStringForIconGridSizeClass(self->_rotatedLayoutClusterGridSizeClass);
  [v22 appendString:v26 withName:@"rotatedLayoutClusterGridSizeClass"];

  id v27 = (id)objc_msgSend(v22, "appendSize:withName:", @"listSizeForIconSpacingCalculation", self->_listSizeForIconSpacingCalculation.width, self->_listSizeForIconSpacingCalculation.height);
  id v28 = (id)[v22 appendObject:self->_iconGridSizeClassIconImageInfos withName:@"iconGridSizeClassIconImageInfos"];
  id v29 = (id)[v22 appendObject:self->_landscapeIconGridSizeClassIconImageInfos withName:@"landscapeIconGridSizeClassIconImageInfos" skipIfNil:1];
  id v30 = SBHStringForIconListIconSpacingAxisMatchingBehavior(self->_iconSpacingAxisMatchingBehavior);
  [v22 appendString:v30 withName:@"iconSpacingAxisMatchingBehavior"];

  id v31 = (id)[v22 appendBool:self->_showsLabels withName:@"showsLabels"];
  id v32 = (id)[v22 appendObject:self->_iconAccessoryVisualConfiguration withName:@"iconAccessoryConfiguration"];
  id v33 = (id)[v22 appendObject:self->_iconLabelVisualConfigurations withName:@"iconLabelVisualConfigurations"];
  id v34 = (id)[v22 appendObject:self->_folderIconVisualConfiguration withName:@"folderIconVisualConfiguration"];
  id v35 = (id)[v22 appendObject:self->_floatyFolderVisualConfiguration withName:@"floatyFolderVisualConfiguration"];
  id v36 = (id)[v22 appendObject:self->_sidebarVisualConfiguration withName:@"sidebarVisualConfiguration"];
  id v37 = (id)[v22 appendObject:self->_rootFolderVisualConfiguration withName:@"rootFolderVisualConfiguration"];
  id v38 = (id)[v22 appendObject:self->_appLibraryVisualConfiguration withName:@"appLibraryVisualConfiguration"];
  id v39 = (id)[v22 appendObject:self->_floatingDockVisualConfiguration withName:@"floatingDockVisualConfiguration"];

  return v22;
}

id __75__SBIconListGridLayoutConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", @"size", *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v3 = (id)[*(id *)(a1 + 32) appendFloat:@"scale" withName:*(double *)(a1 + 56)];
  return (id)[*(id *)(a1 + 32) appendFloat:@"continuousCornerRadius" withName:*(double *)(a1 + 64)];
}

- (void)setNumberOfPortraitColumns:(unint64_t)a3
{
  self->_numberOfPortraitColumns = a3;
}

- (void)setNumberOfPortraitRows:(unint64_t)a3
{
  self->_numberOfPortraitRows = a3;
}

- (void)setNumberOfLandscapeColumns:(unint64_t)a3
{
  self->_numberOfLandscapeColumns = a3;
}

- (void)setNumberOfLandscapeRows:(unint64_t)a3
{
  self->_numberOfLandscapeRows = a3;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_iconGridSizeClassSizes;
}

- (void)setIconGridSizeClassSizes:(id)a3
{
}

- (SBHIconGridSizeClassSizeMap)rotatedIconGridSizeClassSizes
{
  return self->_rotatedIconGridSizeClassSizes;
}

- (void)setRotatedIconGridSizeClassSizes:(id)a3
{
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  return self->_supportedIconGridSizeClasses;
}

- (void)setSupportedIconGridSizeClasses:(id)a3
{
}

- (void)setPortraitLayoutInsets:(UIEdgeInsets)a3
{
  self->_portraitLayoutInsets = a3;
}

- (UIEdgeInsets)landscapeLayoutInsets
{
  double top = self->_landscapeLayoutInsets.top;
  double left = self->_landscapeLayoutInsets.left;
  double bottom = self->_landscapeLayoutInsets.bottom;
  double right = self->_landscapeLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLandscapeLayoutInsets:(UIEdgeInsets)a3
{
  self->_landscapeLayoutInsets = a3;
}

- (UIEdgeInsets)portraitAdditionalWidgetLayoutInsets
{
  double top = self->_portraitAdditionalWidgetLayoutInsets.top;
  double left = self->_portraitAdditionalWidgetLayoutInsets.left;
  double bottom = self->_portraitAdditionalWidgetLayoutInsets.bottom;
  double right = self->_portraitAdditionalWidgetLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPortraitAdditionalWidgetLayoutInsets:(UIEdgeInsets)a3
{
  self->_portraitAdditionalWidgetLayoutInsets = a3;
}

- (UIEdgeInsets)landscapeAdditionalWidgetLayoutInsets
{
  double top = self->_landscapeAdditionalWidgetLayoutInsets.top;
  double left = self->_landscapeAdditionalWidgetLayoutInsets.left;
  double bottom = self->_landscapeAdditionalWidgetLayoutInsets.bottom;
  double right = self->_landscapeAdditionalWidgetLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLandscapeAdditionalWidgetLayoutInsets:(UIEdgeInsets)a3
{
  self->_landscapeAdditionalWidgetLayoutInsets = a3;
}

- (unint64_t)layoutInsetsEnforcementAxis
{
  return self->_layoutInsetsEnforcementAxis;
}

- (void)setLayoutInsetsEnforcementAxis:(unint64_t)a3
{
  self->_layoutInsetsEnforcementAxis = a3;
}

- (UIEdgeInsets)widgetContentMargins
{
  double top = self->_widgetContentMargins.top;
  double left = self->_widgetContentMargins.left;
  double bottom = self->_widgetContentMargins.bottom;
  double right = self->_widgetContentMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setWidgetContentMargins:(UIEdgeInsets)a3
{
  self->_widgetContentMargins = a3;
}

- (NSString)rotatedLayoutClusterGridSizeClass
{
  return self->_rotatedLayoutClusterGridSizeClass;
}

- (void)setRotatedLayoutClusterGridSizeClass:(id)a3
{
}

- (void)setListSizeForIconSpacingCalculation:(CGSize)a3
{
  self->_listSizeForIconSpacingCalculation = a3;
}

- (void)setIconSpacingAxisMatchingBehavior:(int64_t)a3
{
  self->_iconSpacingAxisMatchingBehavior = a3;
}

- (void)setIconAccessoryVisualConfiguration:(id)a3
{
}

- (void)setShowsLabels:(BOOL)a3
{
  self->_showsLabels = a3;
}

- (void)setFolderIconVisualConfiguration:(id)a3
{
}

- (void)setFloatyFolderVisualConfiguration:(id)a3
{
}

- (SBHAppLibraryVisualConfiguration)appLibraryVisualConfiguration
{
  return self->_appLibraryVisualConfiguration;
}

- (void)setAppLibraryVisualConfiguration:(id)a3
{
}

- (SBHSidebarVisualConfiguration)sidebarVisualConfiguration
{
  return self->_sidebarVisualConfiguration;
}

- (void)setSidebarVisualConfiguration:(id)a3
{
}

- (SBHFloatingDockVisualConfiguration)floatingDockVisualConfiguration
{
  return self->_floatingDockVisualConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingDockVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_rootFolderVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_sidebarVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_appLibraryVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_floatyFolderVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_folderIconVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_iconAccessoryVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_rotatedLayoutClusterGridSizeClass, 0);
  objc_storeStrong((id *)&self->_supportedIconGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_rotatedIconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassEditingAnimationStrengths, 0);
  objc_storeStrong((id *)&self->_landscapeIconGridSizeClassIconImageInfos, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassIconImageInfos, 0);
  objc_storeStrong((id *)&self->_iconLabelVisualConfigurations, 0);
}

@end