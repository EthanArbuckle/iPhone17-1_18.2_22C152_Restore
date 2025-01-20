@interface SBHDefaultIconListLayoutProvider
+ (SBHDefaultIconListLayoutProvider)frameworkFallbackInstance;
+ (unint64_t)defaultLayoutOptions;
+ (unint64_t)extendedFloatingDockCapacityIconCount;
- (BOOL)isLayoutCompatibleWithDefaultListLayoutProvider:(id)a3 forIconLocation:(id)a4;
- (NSString)description;
- (SBHDefaultIconListLayoutProvider)init;
- (SBHDefaultIconListLayoutProvider)initWithLayoutOptions:(unint64_t)a3;
- (SBHDefaultIconListLayoutProvider)initWithScreenType:(unint64_t)a3;
- (SBHDefaultIconListLayoutProvider)initWithScreenType:(unint64_t)a3 layoutOptions:(unint64_t)a4;
- (UIEdgeInsets)homeScreenSearchOverlayInsetsForScreenType:(unint64_t)a3 iconLocation:(id)a4 layoutOptions:(unint64_t)a5 forAppLibrary:(BOOL)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)gridSizeClassSizesForScreenType:(unint64_t)a3 numberOfColumns:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6;
- (id)layoutForIconLocation:(id)a3;
- (id)makeLayoutForIconLocation:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)supportedIconGridSizeClassesForScreenType:(unint64_t)a3 iconLocation:(id)a4 layoutOptions:(unint64_t)a5;
- (unint64_t)layoutOptions;
- (unint64_t)layoutOptionsForIconLocation:(id)a3;
- (unint64_t)screenType;
- (void)configureAppLibraryConfiguration:(id)a3 forScreenType:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6;
- (void)configureFloatingDockConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5;
- (void)configureFloatyFolderConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5;
- (void)configureFolderIconConfiguration:(id)a3 forScreenType:(unint64_t)a4 numberOfRows:(unint64_t)a5 layoutOptions:(unint64_t)a6;
- (void)configureIconAccessoryConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5;
- (void)configureLabelConfigurations:(id)a3 forScreenType:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6;
- (void)configureRootFolderConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5;
- (void)configureSidebarConfiguration:(id)a3 forScreenType:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6;
@end

@implementation SBHDefaultIconListLayoutProvider

- (id)layoutForIconLocation:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_cachedListLayouts objectForKey:v4];
  if (!v5)
  {
    if (!self->_cachedListLayouts)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      cachedListLayouts = self->_cachedListLayouts;
      self->_cachedListLayouts = v6;
    }
    v5 = [(SBHDefaultIconListLayoutProvider *)self makeLayoutForIconLocation:v4];
    [(NSMutableDictionary *)self->_cachedListLayouts setObject:v5 forKey:v4];
  }

  return v5;
}

+ (unint64_t)defaultLayoutOptions
{
  return 0;
}

- (SBHDefaultIconListLayoutProvider)init
{
  uint64_t v3 = [(id)objc_opt_class() currentDeviceScreenType];
  uint64_t v4 = [(id)objc_opt_class() defaultLayoutOptions];
  return [(SBHDefaultIconListLayoutProvider *)self initWithScreenType:v3 layoutOptions:v4];
}

- (SBHDefaultIconListLayoutProvider)initWithScreenType:(unint64_t)a3
{
  uint64_t v5 = [(id)objc_opt_class() defaultLayoutOptions];
  return [(SBHDefaultIconListLayoutProvider *)self initWithScreenType:a3 layoutOptions:v5];
}

- (SBHDefaultIconListLayoutProvider)initWithLayoutOptions:(unint64_t)a3
{
  uint64_t v5 = [(id)objc_opt_class() currentDeviceScreenType];
  return [(SBHDefaultIconListLayoutProvider *)self initWithScreenType:v5 layoutOptions:a3];
}

- (SBHDefaultIconListLayoutProvider)initWithScreenType:(unint64_t)a3 layoutOptions:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBHDefaultIconListLayoutProvider;
  result = [(SBHDefaultIconListLayoutProvider *)&v7 init];
  if (result)
  {
    result->_screenType = a3;
    result->_layoutOptions = a4;
  }
  return result;
}

- (id)makeLayoutForIconLocation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBHDefaultIconListLayoutProvider *)self screenType];
  unint64_t v6 = [(SBHDefaultIconListLayoutProvider *)self layoutOptionsForIconLocation:v4];
  objc_super v7 = _SBHDefaultIconGridSizeClassIconImageInfos(v5, v6);
  uint64_t v8 = _SBHDefaultIconGridSizeClassEditingAnimationStrengths(v4, v5);
  v9 = objc_alloc_init(SBIconListGridLayoutConfiguration);
  [(SBIconListGridLayoutConfiguration *)v9 setEditingAnimationStrengths:v8];
  v191[0] = MEMORY[0x1E4F143A8];
  v191[1] = 3221225472;
  v191[2] = __62__SBHDefaultIconListLayoutProvider_makeLayoutForIconLocation___block_invoke;
  v191[3] = &unk_1E6AB2BF8;
  id v10 = v7;
  id v192 = v10;
  v11 = v9;
  v193 = v11;
  SBHEnumerateIconGridSizeClasses(v191);
  [(SBIconListGridLayoutConfiguration *)v11 setWidgetContentMargins:SBHDefaultWidgetContentMargins(v5)];
  [(SBIconListGridLayoutConfiguration *)v11 sidebarVisualConfiguration];
  v154 = v170 = self;
  -[SBHDefaultIconListLayoutProvider configureSidebarConfiguration:forScreenType:iconLocation:layoutOptions:](self, "configureSidebarConfiguration:forScreenType:iconLocation:layoutOptions:");
  uint64_t v12 = _SBHDefaultNumberOfRowsAndColumnsInFolders(v5);
  double v13 = *MEMORY[0x1E4FB2848];
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v18 = *MEMORY[0x1E4F1DB30];
  double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v19 = @"SBHIconGridSizeClassDefault";
  v151 = v10;
  v152 = (void *)v8;
  v150 = v4;
  unint64_t v169 = v6;
  uint64_t v155 = v12;
  double v166 = v13;
  double v167 = v15;
  double v161 = v14;
  if ([v4 isEqualToString:@"SBIconLocationFloatingDock"])
  {
    if ((v6 & 4) != 0) {
      uint64_t v20 = [(id)objc_opt_class() extendedFloatingDockCapacityIconCount];
    }
    else {
      uint64_t v20 = 0;
    }
    double v153 = v17;
    uint64_t v25 = v5;
    switch(v5)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x16uLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x19uLL:
      case 0x1AuLL:
      case 0x1BuLL:
      case 0x1CuLL:
        uint64_t v32 = 0;
        BOOL v33 = 0;
        uint64_t v24 = 0;
        uint64_t v34 = 0;
        uint64_t v39 = 4;
        break;
      case 0x1DuLL:
      case 0x1FuLL:
      case 0x20uLL:
      case 0x23uLL:
      case 0x24uLL:
      case 0x25uLL:
      case 0x26uLL:
      case 0x27uLL:
      case 0x29uLL:
      case 0x2BuLL:
      case 0x2CuLL:
      case 0x2EuLL:
        uint64_t v32 = 0;
        BOOL v33 = 0;
        uint64_t v24 = 0;
        uint64_t v34 = 0;
        uint64_t v39 = v20 + 14;
        break;
      case 0x1EuLL:
      case 0x22uLL:
        uint64_t v32 = 0;
        BOOL v33 = 0;
        uint64_t v24 = 0;
        uint64_t v34 = 0;
        uint64_t v39 = v20 + 12;
        break;
      case 0x21uLL:
      case 0x28uLL:
      case 0x2AuLL:
      case 0x2DuLL:
      case 0x2FuLL:
        uint64_t v32 = 0;
        BOOL v33 = 0;
        uint64_t v24 = 0;
        uint64_t v34 = 0;
        uint64_t v39 = v20 + 17;
        break;
      default:
        uint64_t v25 = v5;
        uint64_t v32 = 0;
        BOOL v33 = 0;
        uint64_t v24 = 0;
        uint64_t v34 = 0;
        uint64_t v39 = 0;
        break;
    }
    uint64_t v38 = 1;
    double v148 = v15;
    double v149 = v16;
    double v147 = v14;
    double v35 = v13;
    double v37 = v16;
    double v157 = v15;
    double v160 = v14;
    double v156 = v13;
    double v31 = v16;
    goto LABEL_54;
  }
  if ([v4 isEqualToString:@"SBIconLocationDock"])
  {
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v182 = 0u;
    getRootMetrics(v5, v6, (uint64_t)&v182);
    SBHGetScreenSpecification(v5, (uint64_t)v181);
    double v162 = *(double *)v181;
    double v153 = *(double *)&v181[1];
    UIEdgeInsetsAdd();
    double v21 = v13;
    double v22 = v16;
    double v23 = v15;
    uint64_t v24 = 1;
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    UIEdgeInsetsAdd();
    uint64_t v25 = v5;
    _SBHDefaultDockAdditionalIconInset(v5, v6);
    UIEdgeInsetsAdd();
    double v13 = v26;
    double v27 = v14;
    double v14 = v28;
    double v15 = v29;
    double v31 = v30;
    uint64_t v32 = 0;
    BOOL v33 = 0;
    uint64_t v34 = 4;
    double v148 = v23;
    double v149 = v22;
    double v147 = v27;
    double v35 = v21;
    double v36 = v22;
    double v157 = v23;
    double v160 = v27;
    double v16 = v22;
    double v18 = v162;
    double v156 = v21;
    double v37 = v36;
    uint64_t v38 = 1;
    uint64_t v39 = 4;
    goto LABEL_54;
  }
  if ([v4 isEqualToString:@"SBIconLocationFolder"])
  {
    double v153 = v17;
    double v163 = v18;
    double v158 = v16;
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v182 = 0u;
    getRootMetrics(v5, v6, (uint64_t)&v182);
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    UIEdgeInsetsAdd();
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    [v10 iconImageInfoForGridSizeClass:v19];
    double v49 = v48;
    double v51 = v50;
    SBHGetScreenSpecification(v5, (uint64_t)v180);
    double v52 = SBHCalculateIconSpacing(v182, v180[0], v180[1], v41, v43, v45, v47, v49);
    double v53 = v52;
    double v55 = v54;
    if (v5 > 0x2F)
    {
      double v15 = 0.0;
      double v37 = 0.0;
      v82 = v170;
      double v16 = v158;
    }
    else
    {
      double v16 = v158;
      if (((1 << v5) & 0x1FFFFFFF) != 0)
      {
        double v15 = 52.0;
        double v37 = v52;
      }
      else
      {
        if (((1 << v5) & 0x5AFDE0000000) != 0)
        {
          double v37 = 43.0;
          *(double *)&uint64_t v64 = 64.0;
        }
        else
        {
          double v37 = 63.0;
          *(double *)&uint64_t v64 = 80.0;
        }
        double v15 = *(double *)&v64;
      }
      v82 = v170;
    }
    v83 = [(SBIconListGridLayoutConfiguration *)v11 floatyFolderVisualConfiguration];
    objc_msgSend(v83, "setContentBackgroundSize:", v53 * (double)(unint64_t)(v12 + 1) + v49 * (double)(unint64_t)v12, v53 + v51 * (double)(unint64_t)v12 + v55 * (double)(unint64_t)(v12 - 1) + 16.0 + 36.0);
    [v83 setPageControlAreaHeight:36.0];
    v84 = v82;
    uint64_t v85 = v12;
    uint64_t v25 = v5;
    [(SBHDefaultIconListLayoutProvider *)v84 configureFloatyFolderConfiguration:v83 forScreenType:v5 layoutOptions:v6];

    uint64_t v32 = 0;
    BOOL v33 = 0;
    uint64_t v24 = 0;
    uint64_t v34 = 0;
    double v35 = v166;
    double v148 = v167;
    double v149 = v16;
    double v147 = v14;
    double v157 = v15;
    double v160 = v37;
    double v156 = v37;
    double v31 = v37;
    double v14 = v37;
    double v13 = v37;
    uint64_t v38 = v85;
    uint64_t v39 = v85;
    double v18 = v163;
    goto LABEL_54;
  }
  unint64_t v56 = v6 & 0x18;
  if (([v4 isEqualToString:@"SBIconLocationRoot"] & 1) != 0
    || [v4 isEqualToString:@"SBIconLocationRootWithWidgets"])
  {
    v164 = v19;
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v182 = 0u;
    getRootMetrics(v5, v6, (uint64_t)&v182);
    unint64_t v57 = v5;
    if ([v4 isEqualToString:@"SBIconLocationRoot"])
    {
      unsigned int v58 = v182;
      unsigned int v59 = BYTE1(v182);
      unsigned int v60 = BYTE2(v182);
      unsigned int v61 = BYTE3(v182);
      double v156 = *((double *)&v184 + 1);
      double v160 = *(double *)&v185;
      v62 = (double *)&v186;
      double v63 = *((double *)&v185 + 1);
    }
    else
    {
      unsigned int v58 = BYTE8(v186);
      unsigned int v59 = BYTE9(v186);
      unsigned int v60 = BYTE10(v186);
      unsigned int v61 = BYTE11(v186);
      double v160 = *((double *)&v189 + 1);
      double v156 = *(double *)&v189;
      v62 = (double *)&v190 + 1;
      double v63 = *(double *)&v190;
    }
    double v157 = v63;
    double v37 = *v62;
    uint64_t v39 = v58;
    uint64_t v38 = v59;
    uint64_t v34 = v60;
    uint64_t v24 = v61;
    SBHDefaultAdditionalWidgetLayoutInsetsForOrientation();
    double v35 = v65;
    double v147 = v66;
    double v148 = v67;
    double v149 = v68;
    SBHDefaultAdditionalWidgetLayoutInsetsForOrientation();
    double v166 = v69;
    double v167 = v70;
    double v161 = v71;
    double v16 = v72;
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    UIEdgeInsetsAdd();
    double v13 = v73;
    double v14 = v74;
    double v15 = v75;
    double v31 = v76;
    BOOL IsPhone = SBHScreenTypeIsPhone(v57);
    double v78 = 0.0;
    if (v56)
    {
      uint64_t v32 = IsPhone;
    }
    else
    {
      double v78 = v15;
      uint64_t v32 = 0;
    }
    if (v56) {
      BOOL v33 = 0;
    }
    else {
      BOOL v33 = IsPhone;
    }
    if (IsPhone) {
      double v15 = v78;
    }
    uint64_t v25 = v57;
    if (SBHScreenTypeIsPad(v57))
    {
      v19 = @"SBHIconGridSizeClassLarge";
    }
    else
    {
      v19 = v164;
    }
    SBHGetScreenSpecification(v25, (uint64_t)v179);
    double v18 = *(double *)v179;
    double v153 = *(double *)&v179[1];
    goto LABEL_54;
  }
  if (([v4 isEqualToString:@"SBIconLocationAppLibrary"] & 1) != 0
    || [v4 isEqualToString:@"SBIconLocationAppLibraryOverlay"])
  {
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v182 = 0u;
    uint64_t v79 = _SBHEquivalentPhoneScreenTypeForScreenType(v5);
    getRootMetrics(v79, v6, (uint64_t)&v182);
    double v160 = *(double *)&v183;
    double v80 = *(double *)&v184;
    if (SBHScreenTypeIsPhone(v5))
    {
      uint64_t v34 = v182;
      double v156 = 8.0;
      double v81 = 20.0;
      double v37 = v80;
    }
    else
    {
      v86 = _SBHDefaultIconGridSizeClassIconImageInfos(v79, v6);
      [v86 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
      double v159 = v16;
      double v87 = v13;
      uint64_t v89 = v88;
      double v90 = v15;
      uint64_t v92 = v91;
      uint64_t v94 = v93;
      [v10 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
      uint64_t v96 = v95;
      v173[0] = MEMORY[0x1E4F143A8];
      v173[1] = 3221225472;
      v173[2] = __62__SBHDefaultIconListLayoutProvider_makeLayoutForIconLocation___block_invoke_2;
      v173[3] = &unk_1E6AB0778;
      v174 = v11;
      uint64_t v175 = v89;
      uint64_t v176 = v92;
      double v13 = v87;
      double v16 = v159;
      double v15 = v90;
      uint64_t v177 = v96;
      uint64_t v178 = v94;
      SBHEnumerateIconGridSizeClasses(v173);

      double v37 = 0.0;
      uint64_t v34 = 4;
      double v81 = 130.0;
      double v160 = 0.0;
      double v156 = 0.0;
    }
    if (SBHScreenTypeHasHomeButton(v5) && SBHScreenTypeIsPhone(v5))
    {
      uint64_t v25 = v5;
      uint64_t v97 = SBHDefaultScreenSizeBucket(v5);
      double v98 = 35.0;
      if (!v97) {
        double v98 = 24.0;
      }
      double v157 = v81 + v98;
    }
    else
    {
      double v157 = v81;
      uint64_t v25 = v5;
    }
    SBHGetScreenSpecification(v79, (uint64_t)v172);
    uint64_t v32 = 0;
    BOOL v33 = 0;
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    double v148 = v15;
    double v149 = v16;
    double v18 = *(double *)v172;
    double v153 = *(double *)&v172[1];
    double v147 = v14;
    double v35 = v13;
    double v31 = v37;
    double v15 = v157;
    double v14 = v160;
    double v13 = v156;
    uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_51:
    uint64_t v39 = v34;
    goto LABEL_54;
  }
  if (([v4 isEqualToString:@"SBIconLocationAppLibraryCategoryPod"] & 1) != 0
    || ([v4 isEqualToString:@"SBIconLocationAppLibraryCategoryPodSuggestions"] & 1) != 0
    || [v4 isEqualToString:@"SBIconLocationAppLibraryCategoryPodRecents"])
  {
    double v37 = _SBHDefaultCategoryPodIconInset(v5);
    uint64_t v25 = v5;
    unint64_t v113 = _SBHEquivalentPhoneScreenTypeForScreenType(v5);
    v114 = _SBHDefaultIconGridSizeClassIconImageInfos(v113, v6);
    [v114 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
    double v18 = v115;
    double v153 = v116;

    uint64_t v32 = 0;
    BOOL v33 = 0;
    uint64_t v24 = 2;
    double v148 = v15;
    double v149 = v16;
    double v147 = v14;
    double v35 = v13;
    double v157 = v37;
    double v160 = v37;
    double v156 = v37;
    double v31 = v37;
    double v15 = v37;
    double v14 = v37;
    double v13 = v37;
    uint64_t v34 = 2;
    uint64_t v38 = 2;
    uint64_t v39 = 2;
    goto LABEL_54;
  }
  double v153 = v17;
  if ([v4 isEqualToString:@"SBIconLocationAppLibraryCategoryPodAdditionalItems"])
  {
    uint64_t v25 = v5;
    uint64_t v32 = 0;
    BOOL v33 = 0;
    uint64_t v24 = 0;
    uint64_t v34 = 0;
    double v37 = 0.0;
    double v157 = 0.0;
    double v160 = 0.0;
    uint64_t v155 = 2;
    double v148 = v15;
    double v149 = v16;
    double v147 = v14;
    double v156 = 0.0;
    double v31 = 0.0;
    double v35 = v13;
    double v15 = 0.0;
    double v14 = 0.0;
    double v13 = 0.0;
    uint64_t v38 = 2;
    uint64_t v39 = 2;
    goto LABEL_54;
  }
  if (![v4 isEqualToString:@"SBIconLocationAppLibraryCategoryPodExpanded"])
  {
    if ([v4 isEqualToString:@"SBIconLocationAppLibrarySearch"])
    {
      uint64_t v25 = v5;
      [v10 iconImageInfoForGridSizeClass:v19];
      -[SBIconListGridLayoutConfiguration setIconImageInfo:forGridSizeClass:](v11, "setIconImageInfo:forGridSizeClass:", v19, 48.0, 48.0, v122, SBHDefaultIconImageContinuousCornerRadius(48.0));
      uint64_t v32 = 0;
      BOOL v33 = 0;
      uint64_t v24 = 0;
      uint64_t v34 = 0;
      uint64_t v38 = 1;
      double v148 = v15;
      double v149 = v16;
      double v147 = v14;
      double v35 = v13;
      double v157 = v15;
      double v160 = v14;
      double v156 = v13;
      double v31 = v16;
      double v37 = v16;
      uint64_t v39 = 1;
      goto LABEL_54;
    }
    if (([v4 isEqualToString:@"SBIconLocationTodayView"] & 1) == 0
      && ![v4 isEqualToString:@"SBIconLocationTodayViewOverlay"])
    {
      uint64_t v25 = v5;
      uint64_t v32 = 0;
      BOOL v33 = 0;
      uint64_t v24 = 0;
      uint64_t v34 = 0;
      uint64_t v38 = 3;
      double v148 = v15;
      double v149 = v16;
      double v147 = v14;
      double v35 = v13;
      double v37 = v16;
      double v157 = v15;
      double v160 = v14;
      double v156 = v13;
      double v31 = v16;
      uint64_t v39 = 3;
      goto LABEL_54;
    }
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v182 = 0u;
    getRootMetrics(v5, v6, (uint64_t)&v182);
    BOOL IsPad = SBHScreenTypeIsPad(v5);
    if (IsPad) {
      uint64_t v34 = 2;
    }
    else {
      uint64_t v34 = 4;
    }
    [v154 searchBarTopOffset];
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    double v37 = 0.0;
    UIEdgeInsetsAdd();
    double v156 = v126;
    double v157 = v127;
    double v160 = v128;
    double v130 = v129;
    SBHDefaultAdditionalWidgetLayoutInsetsForOrientation();
    double v35 = v131;
    double v147 = v132;
    double v148 = v133;
    double v149 = v134;
    SBHDefaultAdditionalWidgetLayoutInsetsForOrientation();
    double v166 = v135;
    double v167 = v136;
    double v161 = v137;
    double v16 = v138;
    BOOL v139 = SBHScreenTypeIsPhone(v5);
    if (v56) {
      BOOL v33 = 0;
    }
    else {
      BOOL v33 = v139;
    }
    uint64_t v140 = _SBHEquivalentPhoneScreenTypeForScreenType(v5);
    SBHGetScreenSpecification(v140, (uint64_t)v171);
    double v18 = *(double *)v171;
    double v153 = *(double *)&v171[1];
    if (IsPad)
    {
      uint64_t v25 = v5;
      v141 = _SBHDefaultIconGridSizeClassIconImageInfos(v5, v169);
      [v141 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
      double v143 = v142;
      double v145 = v144;
      [v10 iconImageInfoForGridSizeClass:v19];
      -[SBIconListGridLayoutConfiguration setIconImageInfo:forGridSizeClass:](v11, "setIconImageInfo:forGridSizeClass:", v19, v143, v145);

      uint64_t v32 = 0;
      double v160 = 0.0;
    }
    else
    {
      uint64_t v25 = v5;
      uint64_t v32 = v56 != 0;
      double v146 = v157;
      if (v56) {
        double v146 = 0.0;
      }
      double v157 = v146;
      double v37 = v130;
    }
    uint64_t v24 = -1;
    double v31 = v37;
    double v15 = v157;
    double v14 = v160;
    double v13 = v156;
    uint64_t v38 = -1;
    goto LABEL_51;
  }
  unint64_t v117 = _SBHEquivalentPhoneScreenTypeForScreenType(v5);
  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v182 = 0u;
  getRootMetrics(v117, v6, (uint64_t)&v182);
  if (SBHScreenTypeIsPhone(v5))
  {
    unint64_t v118 = v5;
    uint64_t v39 = v182;
    if (BYTE2(v182)) {
      uint64_t v34 = BYTE2(v182);
    }
    else {
      uint64_t v34 = v182;
    }
    double v160 = *(double *)&v185;
    double v119 = *(double *)&v186;
    double v156 = *((double *)&v184 + 1);
    double v157 = *((double *)&v185 + 1);
    uint64_t v25 = v118;
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    double v37 = v119;
    UIEdgeInsetsAdd();
    double v14 = v120;
    double v31 = v121;
    double v15 = v120;
  }
  else
  {
    unint64_t v123 = SBHLibraryScreenSizeBucket(v5);
    double v15 = 0.0;
    double v31 = 0.0;
    double v124 = 0.0;
    if (v123 <= 2)
    {
      double v31 = dbl_1D81E81A0[v123];
      double v124 = dbl_1D81E81B8[v123];
      double v15 = 56.0;
    }
    uint64_t v25 = v5;
    uint64_t v34 = 6;
    if (v5 == 34) {
      double v37 = 164.5;
    }
    else {
      double v37 = v124;
    }
    double v157 = v15;
    double v160 = v37;
    double v156 = v15;
    double v14 = v31;
    uint64_t v39 = 6;
  }
  uint64_t v32 = 0;
  BOOL v33 = 0;
  uint64_t v24 = -1;
  double v148 = v167;
  double v149 = v16;
  double v147 = v161;
  double v35 = v13;
  double v13 = v15;
  uint64_t v38 = -1;
LABEL_54:
  [(SBIconListGridLayoutConfiguration *)v11 setNumberOfPortraitRows:v38];
  [(SBIconListGridLayoutConfiguration *)v11 setNumberOfPortraitColumns:v39];
  if (v24 && v34)
  {
    [(SBIconListGridLayoutConfiguration *)v11 setNumberOfLandscapeRows:v24];
    [(SBIconListGridLayoutConfiguration *)v11 setNumberOfLandscapeColumns:v34];
  }
  -[SBIconListGridLayoutConfiguration setPortraitLayoutInsets:](v11, "setPortraitLayoutInsets:", v13, v14, v15, v31);
  -[SBIconListGridLayoutConfiguration setLandscapeLayoutInsets:](v11, "setLandscapeLayoutInsets:", v156, v160, v157, v37);
  -[SBIconListGridLayoutConfiguration setPortraitAdditionalWidgetLayoutInsets:](v11, "setPortraitAdditionalWidgetLayoutInsets:", v35, v147, v148, v149);
  -[SBIconListGridLayoutConfiguration setLandscapeAdditionalWidgetLayoutInsets:](v11, "setLandscapeAdditionalWidgetLayoutInsets:", v166, v161, v167, v16);
  [(SBIconListGridLayoutConfiguration *)v11 setLayoutInsetsEnforcementAxis:v33];
  v165 = v19;
  [(SBIconListGridLayoutConfiguration *)v11 setRotatedLayoutClusterGridSizeClass:v19];
  -[SBIconListGridLayoutConfiguration setListSizeForIconSpacingCalculation:](v11, "setListSizeForIconSpacingCalculation:", v18, v153);
  [(SBIconListGridLayoutConfiguration *)v11 setIconSpacingAxisMatchingBehavior:v32];
  v168 = [(SBHDefaultIconListLayoutProvider *)v170 gridSizeClassSizesForScreenType:v25 numberOfColumns:v39 iconLocation:v150 layoutOptions:v169];
  -[SBIconListGridLayoutConfiguration setIconGridSizeClassSizes:](v11, "setIconGridSizeClassSizes:");
  v99 = [(SBHDefaultIconListLayoutProvider *)v170 supportedIconGridSizeClassesForScreenType:v25 iconLocation:v150 layoutOptions:v169];
  [(SBIconListGridLayoutConfiguration *)v11 setSupportedIconGridSizeClasses:v99];
  [(SBHDefaultIconListLayoutProvider *)v170 configureLabelConfigurations:v11 forScreenType:v25 iconLocation:v150 layoutOptions:v169];
  if (([v150 isEqualToString:@"SBIconLocationAppLibrary"] & 1) != 0
    || [v150 isEqualToString:@"SBIconLocationAppLibraryOverlay"])
  {
    v100 = [(SBIconListGridLayoutConfiguration *)v11 iconLabelVisualConfigurationForContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    [v100 setExtraWidth:0.0];

    v101 = [(SBIconListGridLayoutConfiguration *)v11 iconLabelVisualConfigurationForContentSizeCategory:*MEMORY[0x1E4FB27C0]];
    [v101 setExtraWidth:0.0];

    v102 = [(SBIconListGridLayoutConfiguration *)v11 iconLabelVisualConfigurationForContentSizeCategory:*MEMORY[0x1E4FB27B8]];
    [v102 setExtraWidth:0.0];

    v103 = [(SBIconListGridLayoutConfiguration *)v11 iconLabelVisualConfigurationForContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    [v103 setExtraWidth:0.0];

    v104 = [(SBIconListGridLayoutConfiguration *)v11 iconLabelVisualConfigurationForContentSizeCategory:*MEMORY[0x1E4FB2798]];
    [v104 setExtraWidth:0.0];
  }
  v105 = [(SBIconListGridLayoutConfiguration *)v11 iconAccessoryVisualConfiguration];
  [(SBHDefaultIconListLayoutProvider *)v170 configureIconAccessoryConfiguration:v105 forScreenType:v25 layoutOptions:v169];
  v106 = [(SBIconListGridLayoutConfiguration *)v11 folderIconVisualConfiguration];
  [(SBHDefaultIconListLayoutProvider *)v170 configureFolderIconConfiguration:v106 forScreenType:v25 numberOfRows:v155 layoutOptions:v169];
  v107 = [(SBIconListGridLayoutConfiguration *)v11 rootFolderVisualConfiguration];
  [(SBHDefaultIconListLayoutProvider *)v170 configureRootFolderConfiguration:v107 forScreenType:v25 layoutOptions:v169];
  v108 = [(SBIconListGridLayoutConfiguration *)v11 floatingDockVisualConfiguration];
  [(SBHDefaultIconListLayoutProvider *)v170 configureFloatingDockConfiguration:v108 forScreenType:v25 layoutOptions:v169];
  if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupAppLibrary", v150))
  {
    v109 = [(SBIconListGridLayoutConfiguration *)v11 appLibraryVisualConfiguration];
    [(SBHDefaultIconListLayoutProvider *)v170 configureAppLibraryConfiguration:v109 forScreenType:v25 iconLocation:v150 layoutOptions:v169];
  }
  v110 = self;

  v111 = (void *)[objc_alloc((Class)v110) initWithLayoutConfiguration:v11];
  return v111;
}

void __62__SBHDefaultIconListLayoutProvider_makeLayoutForIconLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 iconImageInfoForGridSizeClass:v4];
  objc_msgSend(*(id *)(a1 + 40), "setIconImageInfo:forGridSizeClass:", v4);
}

uint64_t __62__SBHDefaultIconListLayoutProvider_makeLayoutForIconLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:forGridSizeClass:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)gridSizeClassSizesForScreenType:(unint64_t)a3 numberOfColumns:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6
{
  return SBHDefaultGridSizeClassSizes(a3, a5);
}

- (id)supportedIconGridSizeClassesForScreenType:(unint64_t)a3 iconLocation:(id)a4 layoutOptions:(unint64_t)a5
{
  id v6 = a4;
  objc_super v7 = [(SBHIconGridSizeClassSet *)[SBHMutableIconGridSizeClassSet alloc] initWithGridSizeClass:@"SBHIconGridSizeClassDefault"];
  if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupRoot", v6))
  {
    [(SBHMutableIconGridSizeClassSet *)v7 addGridSizeClass:@"SBHIconGridSizeClassDefault"];
    [(SBHMutableIconGridSizeClassSet *)v7 addGridSizeClass:@"SBHIconGridSizeClassSmall"];
    [(SBHMutableIconGridSizeClassSet *)v7 addGridSizeClass:@"SBHIconGridSizeClassMedium"];
    [(SBHMutableIconGridSizeClassSet *)v7 addGridSizeClass:@"SBHIconGridSizeClassLarge"];
    if (!SBHScreenTypeIsPad(a3)) {
      goto LABEL_7;
    }
    uint64_t v8 = SBHIconGridSizeClassExtraLarge;
  }
  else
  {
    if (!SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v6)) {
      goto LABEL_7;
    }
    [(SBHMutableIconGridSizeClassSet *)v7 removeGridSizeClass:@"SBHIconGridSizeClassDefault"];
    [(SBHMutableIconGridSizeClassSet *)v7 addGridSizeClass:@"SBHIconGridSizeClassSmall"];
    [(SBHMutableIconGridSizeClassSet *)v7 addGridSizeClass:@"SBHIconGridSizeClassMedium"];
    [(SBHMutableIconGridSizeClassSet *)v7 addGridSizeClass:@"SBHIconGridSizeClassLarge"];
    uint64_t v8 = SBHIconGridSizeClassNewsLargeTall;
  }
  [(SBHMutableIconGridSizeClassSet *)v7 addGridSizeClass:*v8];
LABEL_7:

  return v7;
}

- (void)configureLabelConfigurations:(id)a3 forScreenType:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6
{
  char v6 = a6;
  id v27 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  v11 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  uint64_t v12 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  double v13 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  double v14 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  if (a4 <= 0x2F)
  {
    double v15 = dbl_1D81E81D0[a4];
    double v16 = dbl_1D81E8350[a4];
    [(SBHIconLabelVisualConfiguration *)v10 setFontSize:12.0];
    [(SBHIconLabelVisualConfiguration *)v11 setFontSize:13.0];
    [(SBHIconLabelVisualConfiguration *)v12 setFontSize:14.0];
    [(SBHIconLabelVisualConfiguration *)v13 setFontSize:v15];
    [(SBHIconLabelVisualConfiguration *)v14 setFontSize:v16];
    double v17 = dbl_1D81E84D0[a4];
    double v18 = dbl_1D81E8650[a4];
    [(SBHIconLabelVisualConfiguration *)v10 setBaselineOffsetFromImage:16.0];
    [(SBHIconLabelVisualConfiguration *)v11 setBaselineOffsetFromImage:v17];
    [(SBHIconLabelVisualConfiguration *)v12 setBaselineOffsetFromImage:v18];
    [(SBHIconLabelVisualConfiguration *)v13 setBaselineOffsetFromImage:v18];
    [(SBHIconLabelVisualConfiguration *)v14 setBaselineOffsetFromImage:v18];
    double v19 = dbl_1D81E87D0[a4];
    [(SBHIconLabelVisualConfiguration *)v10 setHeight:v19];
    [(SBHIconLabelVisualConfiguration *)v11 setHeight:v19];
    [(SBHIconLabelVisualConfiguration *)v12 setHeight:v19];
    [(SBHIconLabelVisualConfiguration *)v13 setHeight:v19];
    [(SBHIconLabelVisualConfiguration *)v14 setHeight:v19];
    double v20 = dbl_1D81E8950[a4];
    double v21 = dbl_1D81E8AD0[a4];
    [(SBHIconLabelVisualConfiguration *)v10 setExtraWidth:v20];
    [(SBHIconLabelVisualConfiguration *)v11 setExtraWidth:v20];
    [(SBHIconLabelVisualConfiguration *)v12 setExtraWidth:v20];
    [(SBHIconLabelVisualConfiguration *)v13 setExtraWidth:v20];
    [(SBHIconLabelVisualConfiguration *)v14 setExtraWidth:v21];
  }
  [v27 setIconLabelVisualConfiguration:v10 forContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  [v27 setIconLabelVisualConfiguration:v11 forContentSizeCategory:*MEMORY[0x1E4FB27C0]];
  [v27 setIconLabelVisualConfiguration:v12 forContentSizeCategory:*MEMORY[0x1E4FB27B8]];
  [v27 setIconLabelVisualConfiguration:v13 forContentSizeCategory:*MEMORY[0x1E4FB27B0]];
  [v27 setIconLabelVisualConfiguration:v14 forContentSizeCategory:*MEMORY[0x1E4FB2798]];
  int v22 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupDock", v9);
  if (v22) {
    double v23 = @"dock";
  }
  else {
    double v23 = @"default";
  }
  uint64_t v24 = v22 ^ 1u;
  if ((v6 & 0x10) != 0
    && ([v9 isEqualToString:@"SBIconLocationAppLibrary"] & 1) == 0
    && ([v9 isEqualToString:@"SBIconLocationAppLibraryOverlay"] & 1) == 0)
  {
    uint64_t v25 = NSString;
    double v26 = SBHStringForDefaultListLayoutProviderLayoutOptions(v6);
    double v23 = [v25 stringWithFormat:@"layout provider options: %@", v26];

    uint64_t v24 = 0;
  }
  [v27 setShowsLabels:v24];
}

- (void)configureIconAccessoryConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5
{
  char v5 = a5;
  id v10 = a3;
  uint64_t v7 = SBHDefaultIconSizeBucket(a4, v5);
  double v8 = 11.0;
  double v9 = 26.0;
  if (v7 > 1679)
  {
    if (v7 == 1680 || v7 == 1800 || v7 == 1920) {
      goto LABEL_4;
    }
  }
  else
  {
    if ((unint64_t)(v7 - 112) > 0x37) {
      goto LABEL_5;
    }
    if (((1 << (v7 - 112)) & 0x10001010101) != 0) {
      goto LABEL_4;
    }
    if (v7 == 167)
    {
      double v8 = 12.0;
      double v9 = 27.0;
LABEL_4:
      objc_msgSend(v10, "setFontSize:");
      objc_msgSend(v10, "setSize:", v9, v9);
      objc_msgSend(v10, "setOffset:", v8, v8);
    }
  }
LABEL_5:
}

- (void)configureAppLibraryConfiguration:(id)a3 forScreenType:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  unint64_t v12 = SBHLibraryScreenSizeBucket(a4);
  if (SBHScreenTypeIsPhone(a4))
  {
    memset(v58, 0, sizeof(v58));
    getRootMetrics(a4, a6, (uint64_t)v58);
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    UIEdgeInsetsAdd();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    SBHGetScreenSpecification(a4, (uint64_t)v57);
    double v21 = *(double *)v57;
    double v22 = *(double *)&v57[1];
    double v23 = SBHDefaultIconImageSize(a4, a6);
    double v24 = SBHCalculateIconSpacing(LOBYTE(v58[0]), v21, v22, v14, v16, v18, v20, v23);
    double v25 = v24;
    double v27 = v26;
    double v28 = v26;
    double v29 = v24;
  }
  else if (v12 == 2)
  {
    double v25 = -123.0;
    double v24 = 36.0;
    double v29 = 42.0;
    double v28 = 56.0;
    double v27 = 83.0;
  }
  else if (v12 == 1)
  {
    double v25 = -123.0;
    double v24 = 26.0;
    double v29 = 36.0;
    double v28 = 46.0;
    double v27 = 55.0;
  }
  else
  {
    double v27 = 0.0;
    double v25 = 0.0;
    double v28 = 0.0;
    double v29 = 0.0;
    double v24 = 0.0;
    if (!v12)
    {
      double v25 = -123.0;
      double v24 = 20.0;
      double v29 = 36.0;
      double v28 = 46.0;
      double v27 = 54.0;
    }
  }
  objc_msgSend(v10, "setPortraitCategoryPodIconSpacing:", v24, v28);
  objc_msgSend(v10, "setLandscapeCategoryPodIconSpacing:", v29, v28);
  objc_msgSend(v10, "setExpandedCategoryPodIconSpacing:", v25, v27);
  [v10 setUsesInsetPlatterSearchAppearance:SBHScreenTypeIsPad(a4)];
  [v10 setSearchContinuousCornerRadius:16.0];
  if (SBHScreenTypeIsPhone(a4))
  {
    [(SBHDefaultIconListLayoutProvider *)self homeScreenSearchOverlayInsetsForScreenType:a4 iconLocation:v11 layoutOptions:a6 forAppLibrary:1];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    uint64_t v38 = [v10 standardSearchVisualConfiguration];
    [v38 setTextFieldWidth:0.0];
    objc_msgSend(v38, "setTextFieldPortraitLayoutInsets:", v31, v33, v35, v37);
    objc_msgSend(v38, "setTextFieldLandscapeLayoutInsets:", v31, v33, v35, v37);
    [v10 setActiveSearchVisualConfiguration:v38];
    [v10 setCompactSearchVisualConfiguration:v38];
    [v10 setExtendedSearchVisualConfiguration:v38];
    uint64_t v39 = [v10 standardSearchVisualConfiguration];
    double v40 = [v10 activeSearchVisualConfiguration];
    char v41 = [v39 isEqual:v40];

    if ((v41 & 1) == 0) {
      NSLog(&cfstr_PhonesShouldUs.isa);
    }
  }
  else
  {
    uint64_t v38 = [v10 extendedSearchVisualConfiguration];
    double v42 = [v10 standardSearchVisualConfiguration];
    double v43 = [v10 compactSearchVisualConfiguration];
    double v44 = [v10 activeSearchVisualConfiguration];
    [v38 setTextFieldWidth:334.0];
    [v42 setTextFieldWidth:334.0];
    [v43 setTextFieldWidth:334.0];
    [v44 setTextFieldWidth:556.0];
    double v45 = 0.0;
    double v46 = 0.0;
    double v47 = 0.0;
    double v48 = 0.0;
    double v49 = 0.0;
    double v50 = 0.0;
    double v51 = 0.0;
    double v52 = 0.0;
    double v53 = 0.0;
    double v54 = 0.0;
    if (v12 <= 2)
    {
      double v46 = dbl_1D81E8C50[v12];
      double v47 = dbl_1D81E8C68[v12];
      double v48 = dbl_1D81E8C80[v12];
      double v49 = dbl_1D81E8C98[v12];
      double v50 = dbl_1D81E8CB0[v12];
      double v51 = dbl_1D81E8CC8[v12];
      double v52 = dbl_1D81E8CE0[v12];
      double v53 = dbl_1D81E8CF8[v12];
      double v45 = 24.0;
      double v54 = dbl_1D81E8D10[v12];
    }
    double v56 = v46;
    if (a4 == 34)
    {
      double v53 = 260.0;
      double v50 = 164.0;
      double v55 = 66.0;
      double v48 = 72.0;
      double v54 = 72.0;
    }
    else if (a4 == 31)
    {
      double v53 = 240.0;
      double v50 = 144.0;
      double v55 = 66.0;
      double v48 = 68.0;
    }
    else
    {
      double v55 = v46;
    }
    objc_msgSend(v38, "setTextFieldLandscapeLayoutInsets:", v54, 0.0, v52, 0.0);
    objc_msgSend(v38, "setTextFieldPortraitLayoutInsets:", v53, 0.0, v52, 0.0);
    objc_msgSend(v42, "setTextFieldLandscapeLayoutInsets:", v47, 0.0, v51, 0.0);
    objc_msgSend(v42, "setTextFieldPortraitLayoutInsets:", v50, 0.0, v49, 0.0);
    objc_msgSend(v43, "setTextFieldLandscapeLayoutInsets:", v47, 0.0, v51, 0.0);
    objc_msgSend(v43, "setTextFieldPortraitLayoutInsets:", v55, 0.0, v48, 0.0);
    objc_msgSend(v44, "setTextFieldLandscapeLayoutInsets:", v47, 0.0, v45, 0.0);
    objc_msgSend(v44, "setTextFieldPortraitLayoutInsets:", v56, 0.0, v45, 0.0);
  }
}

- (void)configureFloatyFolderConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5
{
  id v11 = a3;
  if (a4 <= 0x2F)
  {
    if (((1 << a4) & 0x1FFFFFFF) != 0)
    {
      double v6 = 38.0;
    }
    else
    {
      if (((1 << a4) & 0x5AFDE0000000) != 0)
      {
        double v7 = 487.0;
        double v6 = 55.0;
      }
      else
      {
        double v7 = 617.0;
        double v6 = 79.0;
      }
      objc_msgSend(v11, "setContentBackgroundSize:", v7, v7);
    }
    [v11 setContinuousCornerRadius:v6];
  }
  BOOL IsPad = SBHScreenTypeIsPad(a4);
  double v9 = 7.0;
  if (IsPad)
  {
    double v9 = 15.0;
    double v10 = 44.0;
  }
  else
  {
    double v10 = 36.0;
  }
  [v11 setTitleHorizontalInset:v9];
  [v11 setTitleFontSize:v10];
  objc_msgSend(v11, "setPageControlCustomPadding:", 0.0, 8.0);
  if (a4 <= 0x2F) {
    [v11 setRubberBandIntervalForOverscroll:dbl_1D81E8D28[a4]];
  }
}

- (void)configureFolderIconConfiguration:(id)a3 forScreenType:(unint64_t)a4 numberOfRows:(unint64_t)a5 layoutOptions:(unint64_t)a6
{
  char v6 = a6;
  id v9 = a3;
  if (a5 <= 2)
  {
    uint64_t v10 = SBHDefaultScreenSizeBucket(a4);
    double v11 = round(SBHDefaultIconImageSize(a4, v6) * 0.4);
    if (v10 == 2)
    {
      double v12 = 7.0;
    }
    else if (v10 == 1)
    {
      double v12 = 6.0;
    }
    else
    {
      double v12 = 0.0;
      if (!v10) {
        double v12 = 5.0;
      }
    }
    goto LABEL_36;
  }
  if (a5 == 3)
  {
    double v11 = 13.0;
    double v12 = 3.0;
    goto LABEL_36;
  }
  uint64_t v13 = SBHDefaultIconSizeBucket(a4, v6);
  double v12 = 0.0;
  if (v13 <= 151)
  {
    if (v13 <= 127)
    {
      if (v13 != 112)
      {
        double v11 = 0.0;
        if (v13 != 120) {
          goto LABEL_36;
        }
      }
      goto LABEL_19;
    }
    if (v13 == 128) {
      goto LABEL_35;
    }
    if (v13 == 136) {
      double v11 = 11.0;
    }
    else {
      double v11 = 0.0;
    }
    if (v13 == 136) {
      double v12 = 3.0;
    }
  }
  else
  {
    if (v13 > 1679)
    {
      if (v13 != 1680)
      {
        if (v13 != 1920)
        {
          double v11 = 0.0;
          if (v13 != 1800) {
            goto LABEL_36;
          }
          goto LABEL_19;
        }
LABEL_35:
        double v12 = 2.75;
        double v11 = 10.25;
        goto LABEL_36;
      }
LABEL_19:
      double v11 = 9.5;
      double v12 = 2.5;
      goto LABEL_36;
    }
    double v14 = 12.0;
    double v15 = 3.5;
    if (v13 != 167)
    {
      double v15 = 0.0;
      double v14 = 0.0;
    }
    if (v13 == 152) {
      double v12 = 3.0;
    }
    else {
      double v12 = v15;
    }
    if (v13 == 152) {
      double v11 = 11.0;
    }
    else {
      double v11 = v14;
    }
  }
LABEL_36:
  if ((v6 & 8) != 0 && SBHScreenTypeIsPhone(a4))
  {
    SBHDefaultIconImageSize(a4, v6);
    SBHDefaultIconImageSize(a4, v6 & 0xE7);
    SBHGetScreenSpecification(a4, (uint64_t)v18);
    UIRoundToScale();
    double v11 = v16;
    UIRoundToScale();
    double v12 = v17;
  }
  objc_msgSend(v9, "setGridCellSize:", v11, v11);
  objc_msgSend(v9, "setGridCellSpacing:", v12, v12);
}

- (void)configureSidebarConfiguration:(id)a3 forScreenType:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      SBHGetScreenSpecification(a4, (uint64_t)v15);
      [v10 setContentWidth:v15[0]];
      [v10 setContentFullscreen:1];
      break;
    case 0x1DuLL:
    case 0x29uLL:
    case 0x2EuLL:
      double v13 = 145.0;
      goto LABEL_7;
    case 0x1EuLL:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, 156.0, 64.0);
      [v10 setContentWidth:329.0];
      double v14 = 29.0;
      goto LABEL_11;
    case 0x1FuLL:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, 160.0, 64.0);
      [v10 setContentWidth:329.0];
      double v14 = 37.0;
      goto LABEL_11;
    case 0x20uLL:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, 166.0, 64.0);
      [v10 setContentWidth:329.0];
      double v14 = 44.0;
      goto LABEL_11;
    case 0x21uLL:
    case 0x28uLL:
    case 0x2AuLL:
    case 0x2DuLL:
    case 0x2FuLL:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, 193.0, 64.0);
      double v12 = 364.0;
      goto LABEL_8;
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
      double v13 = 175.0;
      goto LABEL_7;
    case 0x26uLL:
    case 0x27uLL:
    case 0x2BuLL:
    case 0x2CuLL:
      double v13 = 166.0;
LABEL_7:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, v13, 64.0);
      double v12 = 329.0;
LABEL_8:
      [v10 setContentWidth:v12];
      break;
    default:
      break;
  }
  if (a4 - 29 <= 0x12)
  {
    double v14 = dbl_1D81E8EA8[a4 - 29];
LABEL_11:
    [v10 setFirstWidgetTopOffset:v14];
  }
  [(SBHDefaultIconListLayoutProvider *)self homeScreenSearchOverlayInsetsForScreenType:a4 iconLocation:v11 layoutOptions:a6 forAppLibrary:0];
  objc_msgSend(v10, "setSearchBarTopOffset:");
}

- (void)configureRootFolderConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = v8;
  if (a4 <= 0x2F) {
    [v8 setIdleTextVerticalOffset:dbl_1D81E8F40[a4]];
  }
  double v10 = 12.0;
  double v11 = 10.0;
  double v12 = 25.0;
  double v13 = 26.0;
  double v14 = 20.0;
  double v15 = 22.0;
  double v16 = 30.0;
  double v17 = 18.0;
  double v18 = 66.0;
  double v19 = 14.0;
  double v20 = 60.0;
  double v21 = 24.0;
  double v22 = 3.0;
  *(double *)&uint64_t v23 = 52.0;
  double v24 = 2.0;
  double v25 = 58.0;
  double v26 = 50.0;
  double v27 = 10.0;
  double v28 = 10.0;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 5.0, 6.0, 10.0, 12.0, 22.0, 18.0, 25.0, 2.0);
      objc_msgSend(v9, "setEditModeButtonSize:", 50.0, 24.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
      [v9 setPageControlVerticalOffset:5.66666667];
LABEL_48:
      objc_msgSend(v9, "setPageControlFrameInset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v37 = 7.0;
      double v38 = 7.0;
      goto LABEL_56;
    case 3uLL:
    case 6uLL:
    case 8uLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
      double v21 = 26.0;
      double v24 = 16.0;
      double v26 = 60.0;
      double v22 = 16.0;
      goto LABEL_5;
    case 4uLL:
      goto LABEL_19;
    case 5uLL:
    case 7uLL:
      double v21 = 26.0;
      double v22 = 16.0;
      double v24 = 28.0;
      double v26 = 60.0;
LABEL_5:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v24, v22, 10.0, 12.0, 22.0, 18.0, 25.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v26, v21);
      goto LABEL_6;
    case 9uLL:
      goto LABEL_13;
    case 0xAuLL:
      goto LABEL_16;
    case 0xBuLL:
      goto LABEL_26;
    case 0xCuLL:
      double v27 = 16.0;
      double v11 = 13.0;
      goto LABEL_19;
    case 0xDuLL:
      goto LABEL_30;
    case 0xEuLL:
      goto LABEL_23;
    case 0xFuLL:
      double v19 = 25.0;
      double v25 = 64.0;
LABEL_13:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v19, 19.0, 10.0, 12.0, 22.0, 18.0, 25.0, 2.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v25, 26.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_14:
      double v30 = 11.3333333;
      goto LABEL_42;
    case 0x10uLL:
      double v28 = 18.0;
      double v11 = 16.0;
      *(double *)&uint64_t v23 = 60.0;
LABEL_16:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v11, v28);
      double v31 = v9;
      double v32 = *(double *)&v23;
      double v33 = 26.0;
      goto LABEL_35;
    case 0x11uLL:
      double v14 = 30.0;
      double v20 = 66.0;
      goto LABEL_26;
    case 0x12uLL:
      double v27 = 16.0;
      double v11 = 18.0;
LABEL_19:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v11, v27);
      objc_msgSend(v9, "setEditModeButtonSize:", 60.0, 26.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_20:
      double v30 = 9.0;
      goto LABEL_42;
    case 0x13uLL:
      double v14 = 23.0;
      double v18 = 68.0;
      *(double *)&uint64_t v34 = 42.0;
      goto LABEL_29;
    case 0x14uLL:
      double v15 = 28.0;
      double v18 = 68.0;
      double v13 = 28.0;
LABEL_23:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v15, 20.0, 10.0, 12.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v18, v13);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_24:
      double v30 = 14.0;
      goto LABEL_42;
    case 0x15uLL:
      double v13 = 28.0;
      double v17 = 16.0;
      double v20 = 66.0;
      double v14 = 37.0;
LABEL_26:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v14, v17, 10.0, 12.0, 22.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v20, v13);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_27:
      double v30 = 5.66666667;
      goto LABEL_42;
    case 0x16uLL:
      goto LABEL_34;
    case 0x17uLL:
      double v14 = 16.0;
      double v18 = 68.0;
      *(double *)&uint64_t v34 = 50.0;
LABEL_29:
      double v16 = *(double *)&v34;
LABEL_30:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v16, v14, 10.0, 12.0, 22.0, 18.0, 25.0, 2.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v18, 28.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_31:
      double v30 = 13.0;
      goto LABEL_42;
    case 0x18uLL:
      goto LABEL_40;
    case 0x19uLL:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 39.0, 19.0, 10.0, 12.0, 22.0, 18.0, 25.0, 2.0);
      objc_msgSend(v9, "setEditModeButtonSize:", 66.0, 28.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
      double v29 = 7.66666667;
      goto LABEL_53;
    case 0x1AuLL:
      double v11 = 12.0;
LABEL_34:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 25.0, v11);
      double v32 = 66.0;
      double v33 = 28.0;
      double v31 = v9;
LABEL_35:
      objc_msgSend(v31, "setEditModeButtonSize:", v32, v33);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_36:
      double v30 = 7.66666667;
      goto LABEL_42;
    case 0x1BuLL:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 50.0, 19.0, 10.0, 12.0, 22.0, 18.0, 25.0, 2.0);
      objc_msgSend(v9, "setEditModeButtonSize:", 68.0, 28.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_38:
      double v29 = 15.6666667;
LABEL_53:
      [v9 setPageControlVerticalOffset:v29];
LABEL_54:
      double v35 = 0.0;
      double v36 = -13.5;
LABEL_55:
      objc_msgSend(v9, "setPageControlFrameInset:", v35, v36);
      double v37 = 15.0;
      double v38 = 15.0;
LABEL_56:
      objc_msgSend(v9, "setPageControlCustomPadding:", v37, v38);
LABEL_57:
      objc_msgSend(v9, "setScrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView:", -1.0, v29);
      if (a4 <= 0x2F)
      {
        if (((1 << a4) & 0x1FFFFFF8) != 0)
        {
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v87 = 0u;
          getRootMetrics(a4, v5, (uint64_t)&v87);
          double v39 = *(double *)&v88;
          SBHDefaultIconImageSize(a4, v5);
          if ((v5 & 8) != 0) {
            SBHDefaultIconImageSize(a4, 0);
          }
          double v41 = v40;
          double v44 = _SBHDefaultDockPlatterMetrics(a4, v5);
          double v45 = v42;
          double v46 = v39 - v44;
          if (v43 <= -100.0) {
            double v47 = v39 - v44;
          }
          else {
            double v47 = v43;
          }
          double v48 = v47 + v41 + v42 + v47;
          double v49 = SBHDisplayCornerRadiusForScreenType(a4) - v44;
          double v50 = SBHDefaultIconImageContinuousCornerRadius(v41) + v46;
          if (v49 >= v50) {
            double v51 = v49;
          }
          else {
            double v51 = v50;
          }
          double v52 = _SBHDefaultDockCornerRadiusAdjustment(a4, v5) + v51;
          [v9 setDockViewHeight:v48];
          [v9 setDockBackgroundViewCornerRadius:v52];
          objc_msgSend(v9, "setDockBackgroundViewInsets:", 0.0, v44, v45, v44);
          double v53 = 0.0;
          double v54 = 0.0;
          double v55 = 0.0;
          double v56 = v9;
          double v57 = v45;
        }
        else if (((1 << a4) & 0xFFFFE0000000) != 0)
        {
          [v9 setDockViewHeight:0.0];
          [v9 setDockBackgroundViewCornerRadius:0.0];
          double v58 = *MEMORY[0x1E4FB2848];
          double v59 = *(double *)(MEMORY[0x1E4FB2848] + 8);
          double v60 = *(double *)(MEMORY[0x1E4FB2848] + 16);
          double v61 = *(double *)(MEMORY[0x1E4FB2848] + 24);
          objc_msgSend(v9, "setDockBackgroundViewInsets:", *MEMORY[0x1E4FB2848], v59, v60, v61);
          double v56 = v9;
          double v53 = v58;
          double v54 = v59;
          double v57 = v60;
          double v55 = v61;
        }
        else
        {
LABEL_88:
          [v9 setDockViewHeight:96.0];
          [v9 setDockBackgroundViewCornerRadius:0.0];
          objc_msgSend(v9, "setDockBackgroundViewInsets:", 4.0, 0.0, 0.0, 0.0);
          double v53 = 4.0;
          double v54 = 0.0;
          double v57 = 0.0;
          double v55 = 0.0;
          double v56 = v9;
        }
        objc_msgSend(v56, "setDockListViewInsets:", v53, v54, v57, v55);
      }
      [v9 setPageManagementPageCheckboxVerticalMargin:12.0];
      double v62 = 36.0;
      [v9 setPageManagementPageCheckboxDiameter:36.0];
      objc_msgSend(v9, "setPageManagementFocusModeOptionsButtonSize:", 132.0, 42.0);
      if (a4 - 29 >= 0x13)
      {
        uint64_t v70 = SBHDefaultScreenSizeBucket(a4);
        double v66 = 0.45;
        if (v70)
        {
          if (v70 == 2)
          {
            double v84 = 26.0;
            double v86 = 28.0;
            double v85 = 0.21;
            double v82 = 52.0;
            double v83 = 216.0;
            double v68 = 36.0;
            double v64 = 0.32;
            double v69 = 108.0;
            double v65 = 42.0;
            double v63 = 42.0;
            double v67 = 42.0;
          }
          else
          {
            if (v70 != 1) {
              goto LABEL_81;
            }
            double v84 = 20.0;
            double v86 = 26.0;
            double v85 = 0.21;
            double v82 = 40.0;
            double v83 = 160.0;
            double v68 = 32.0;
            double v64 = 0.32;
            double v69 = 96.0;
            double v67 = 38.0;
            double v65 = 36.0;
            double v63 = 36.0;
          }
          double v62 = v68;
        }
        else
        {
          double v84 = 16.0;
          double v86 = 21.0;
          double v68 = 24.0;
          double v85 = 0.21;
          double v65 = 32.0;
          double v83 = 120.0;
          double v64 = 0.32;
          double v69 = 48.0;
          double v67 = 38.0;
          double v63 = 32.0;
          double v62 = 24.0;
          double v82 = 32.0;
        }
      }
      else
      {
        double v85 = 0.22;
        double v63 = 40.0;
        double v86 = 64.0;
        double v64 = 0.35;
        double v65 = 56.0;
        double v66 = 0.48;
        double v67 = 56.0;
        double v68 = 40.0;
        double v69 = 40.0;
        double v83 = 40.0;
        double v84 = 36.0;
        double v82 = 40.0;
      }
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 0, 0.0, 0.0, 0.0, v66);
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 1, v65, v63, 0.0, v64);
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 2, v67, v68, v69, v64);
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 3, v86, v62, v83, v85);
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 4, v86, v84, v82, v85);
LABEL_81:
      double v71 = 14.0;
      if (a4 < 0x1D) {
        goto LABEL_84;
      }
      if (a4 - 29 <= 0x12)
      {
        double v71 = -10000.0;
LABEL_84:
        [v9 setEditingEntryAreaHorizontalInset:v71];
      }
      if (([(SBHDefaultIconListLayoutProvider *)self layoutOptions] & 8) != 0)
      {
        [v9 dockBackgroundViewInsets];
        UIEdgeInsetsAdd();
        double v73 = v72;
        double v75 = v74;
        double v77 = v76;
        double v79 = v78;
        [v9 dockBackgroundViewCornerRadius];
        double v81 = v80;
        objc_msgSend(v9, "setDockBackgroundViewInsets:", v73, v75, v77, v79);
        [v9 setDockBackgroundViewCornerRadius:v81 + 0.0];
      }

      return;
    case 0x1CuLL:
      double v10 = 14.0;
LABEL_40:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 40.0, v10, 10.0);
      objc_msgSend(v9, "setEditModeButtonSize:", 68.0, 27.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_41:
      double v30 = 12.6666667;
LABEL_42:
      objc_msgSend(v9, "setPageControlVerticalOffset:", v30, v29);
LABEL_43:
      switch(a4)
      {
        case 0uLL:
          goto LABEL_48;
        case 1uLL:
          objc_msgSend(v9, "setPageControlFrameInset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
          objc_msgSend(v9, "setPageControlCustomPadding:", 4.5, 4.5);
          [v9 setScrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView:-1.0];
          goto LABEL_88;
        case 3uLL:
        case 6uLL:
        case 8uLL:
        case 9uLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x14uLL:
        case 0x18uLL:
        case 0x1CuLL:
          goto LABEL_51;
        case 4uLL:
        case 0xAuLL:
        case 0xCuLL:
        case 0x10uLL:
        case 0x12uLL:
        case 0x16uLL:
        case 0x1AuLL:
          objc_msgSend(v9, "setPageControlFrameInset:", 0.0, -2.5);
          double v37 = *MEMORY[0x1E4F1DB30];
          double v38 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          goto LABEL_56;
        case 5uLL:
        case 7uLL:
        case 0xBuLL:
        case 0xDuLL:
        case 0x11uLL:
        case 0x13uLL:
        case 0x15uLL:
        case 0x17uLL:
        case 0x19uLL:
        case 0x1BuLL:
          goto LABEL_54;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x29uLL:
        case 0x2EuLL:
          double v35 = *MEMORY[0x1E4F1DB30];
          double v36 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          goto LABEL_55;
        case 0x21uLL:
        case 0x28uLL:
        case 0x2AuLL:
        case 0x2DuLL:
        case 0x2FuLL:
          objc_msgSend(v9, "setPageControlFrameInset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
          double v38 = 13.0;
          double v37 = 19.0;
          goto LABEL_56;
        case 0x26uLL:
        case 0x27uLL:
        case 0x2BuLL:
        case 0x2CuLL:
          objc_msgSend(v9, "setPageControlFrameInset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
          double v38 = 13.0;
          double v37 = 18.0;
          goto LABEL_56;
        default:
          goto LABEL_57;
      }
    default:
LABEL_6:
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0, v15, v17, v12, v24);
      double v29 = 7.66666667;
      double v30 = 0.666666667;
      switch(a4)
      {
        case 0uLL:
        case 1uLL:
          goto LABEL_42;
        case 3uLL:
        case 6uLL:
          double v30 = 13.3333333;
          goto LABEL_42;
        case 4uLL:
        case 0xCuLL:
        case 0x12uLL:
          goto LABEL_20;
        case 5uLL:
        case 0x19uLL:
          goto LABEL_53;
        case 7uLL:
          double v29 = 6.5;
          goto LABEL_53;
        case 8uLL:
          objc_msgSend(v9, "setPageControlVerticalOffset:", 13.0, 7.66666667);
LABEL_51:
          double v35 = 0.0;
          double v36 = -2.5;
          goto LABEL_55;
        case 9uLL:
        case 0xFuLL:
          goto LABEL_14;
        case 0xAuLL:
        case 0x10uLL:
        case 0x16uLL:
        case 0x1AuLL:
          goto LABEL_36;
        case 0xBuLL:
        case 0x11uLL:
        case 0x15uLL:
          goto LABEL_27;
        case 0xDuLL:
        case 0x13uLL:
        case 0x17uLL:
          goto LABEL_31;
        case 0xEuLL:
        case 0x14uLL:
          goto LABEL_24;
        case 0x18uLL:
        case 0x1CuLL:
          goto LABEL_41;
        case 0x1BuLL:
          goto LABEL_38;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x26uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x29uLL:
        case 0x2AuLL:
        case 0x2BuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2EuLL:
        case 0x2FuLL:
          double v30 = 0.0;
          goto LABEL_42;
        default:
          goto LABEL_43;
      }
  }
}

- (void)configureFloatingDockConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5
{
  if ((a5 & 0x18) != 0)
  {
    double v6 = SBHDefaultIconImageSize(a4, a5 & 0xE7);
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  objc_msgSend(a3, "setMaximumEditingIconSize:", v6, v7);
}

+ (unint64_t)extendedFloatingDockCapacityIconCount
{
  return 3;
}

+ (SBHDefaultIconListLayoutProvider)frameworkFallbackInstance
{
  if (frameworkFallbackInstance_onceToken != -1) {
    dispatch_once(&frameworkFallbackInstance_onceToken, &__block_literal_global_71);
  }
  v2 = (void *)frameworkFallbackInstance_instance;
  return (SBHDefaultIconListLayoutProvider *)v2;
}

void __61__SBHDefaultIconListLayoutProvider_frameworkFallbackInstance__block_invoke()
{
  v0 = objc_alloc_init(SBHDefaultIconListLayoutProvider);
  v1 = (void *)frameworkFallbackInstance_instance;
  frameworkFallbackInstance_instance = (uint64_t)v0;
}

- (UIEdgeInsets)homeScreenSearchOverlayInsetsForScreenType:(unint64_t)a3 iconLocation:(id)a4 layoutOptions:(unint64_t)a5 forAppLibrary:(BOOL)a6
{
  BOOL v6 = a6;
  char v7 = a5;
  id v9 = a4;
  memset(v21, 0, sizeof(v21));
  getRootMetrics(a3, v7, (uint64_t)v21);
  double v10 = *((double *)v21 + 1);
  if ([v9 isEqualToString:@"SBIconLocationTodayViewOverlay"]) {
    int v11 = 1;
  }
  else {
    int v11 = [v9 isEqualToString:@"SBIconLocationAppLibraryOverlay"];
  }
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      double v16 = *((double *)v21 + 1) + -20.0 + -4.0;
      BOOL v15 = v11 == 0;
      goto LABEL_15;
    case 2uLL:
      double v14 = *((double *)v21 + 1) + -20.0 + -6.0;
      BOOL v13 = v11 == 0;
      goto LABEL_10;
    case 3uLL:
    case 5uLL:
    case 7uLL:
    case 9uLL:
    case 0xBuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x11uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1BuLL:
    case 0x1CuLL:
      BOOL v13 = v11 == 0;
      double v14 = 12.0;
LABEL_10:
      if (!v13) {
        double v10 = v14;
      }
      double v12 = 24.0;
      if (!v11) {
        goto LABEL_20;
      }
      goto LABEL_18;
    case 4uLL:
    case 6uLL:
    case 8uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0x10uLL:
    case 0x12uLL:
    case 0x16uLL:
    case 0x1AuLL:
      BOOL v15 = v11 == 0;
      double v16 = 6.0;
LABEL_15:
      if (!v15) {
        double v10 = v16;
      }
      double v12 = 12.0;
      if (v11) {
        goto LABEL_18;
      }
      goto LABEL_20;
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
      if (v6) {
        NSLog(&cfstr_AppLibraryOnIp.isa);
      }
      double v12 = 0.0;
      if (!v11) {
        goto LABEL_20;
      }
      double v10 = 0.0;
LABEL_18:
      if (SBHScreenTypeIsPhone(a3)) {
        double v10 = v10 + 4.0;
      }
LABEL_20:

      double v17 = 0.0;
      double v18 = 0.0;
      double v19 = v10;
      double v20 = v12;
      result.right = v18;
      result.bottom = v20;
      result.left = v17;
      result.top = v19;
      return result;
    default:
      double v12 = 0.0;
      if (!v11) {
        goto LABEL_20;
      }
      goto LABEL_18;
  }
}

- (unint64_t)layoutOptionsForIconLocation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBHDefaultIconListLayoutProvider *)self layoutOptions];
  if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupAppLibrary", v4)
    && ![v4 isEqualToString:@"SBIconLocationAppLibraryCategoryPodExpanded"])
  {
    v5 &= 0xFFFFFFFFFFFFFFE7;
  }

  return v5;
}

- (BOOL)isLayoutCompatibleWithDefaultListLayoutProvider:(id)a3 forIconLocation:(id)a4
{
  return SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(self, a3, a4, 1);
}

- (NSString)description
{
  return (NSString *)[(SBHDefaultIconListLayoutProvider *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHDefaultIconListLayoutProvider *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBHDefaultIconListLayoutProvider *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBHDefaultIconListLayoutProvider *)self succinctDescriptionBuilder];
  unint64_t v5 = SBHStringForScreenType([(SBHDefaultIconListLayoutProvider *)self screenType]);
  [v4 appendString:v5 withName:@"screenType"];

  BOOL v6 = SBHStringForDefaultListLayoutProviderLayoutOptions([(SBHDefaultIconListLayoutProvider *)self layoutOptions]);
  if ([v6 length]) {
    [v4 appendString:v6 withName:@"layoutOptions"];
  }

  return v4;
}

- (unint64_t)screenType
{
  return self->_screenType;
}

- (unint64_t)layoutOptions
{
  return self->_layoutOptions;
}

- (void).cxx_destruct
{
}

@end