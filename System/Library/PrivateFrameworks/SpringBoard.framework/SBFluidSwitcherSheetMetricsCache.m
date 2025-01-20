@interface SBFluidSwitcherSheetMetricsCache
- (CGAffineTransform)transformForCardUnderSheetForBoundsSize:(SEL)a3;
- (CGRect)pageSheetFrameForBounds:(CGRect)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5;
- (CGRect)pageSheetFrameForBounds:(CGRect)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5 userInterfaceIdiom:(int64_t)a6 displayScale:(double)a7 displayEdgeInfo:(id)a8;
- (CGSize)pageSheetMetricsForBoundsSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5;
- (CGSize)pageSheetMetricsForBoundsSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5 userInterfaceIdiom:(int64_t)a6 displayScale:(double)a7 displayEdgeInfo:(id)a8;
- (id)_displayEdgeInfo;
@end

@implementation SBFluidSwitcherSheetMetricsCache

- (id)_displayEdgeInfo
{
  if (_displayEdgeInfo_sOnceToken != -1) {
    dispatch_once(&_displayEdgeInfo_sOnceToken, &__block_literal_global_63);
  }
  v2 = (void *)_displayEdgeInfo_sDisplayEdgeInfo;
  return v2;
}

void __52__SBFluidSwitcherSheetMetricsCache__displayEdgeInfo__block_invoke()
{
  [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
  double v1 = v0;
  objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend(v4, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:", v1);
  v3 = (void *)_displayEdgeInfo_sDisplayEdgeInfo;
  _displayEdgeInfo_sDisplayEdgeInfo = v2;
}

- (CGAffineTransform)transformForCardUnderSheetForBoundsSize:(SEL)a3
{
  v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
  v7 = [(NSMutableDictionary *)self->_boundsToTransformMap objectForKey:v6];
  v8 = v7;
  if (v7)
  {
    [v7 CGAffineTransformValue];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F42FF0]);
    BSRectWithSize();
    v10 = objc_msgSend(v9, "initWithFrame:");
    _UISheetMinimumTopInset();
    uint64_t v12 = v11;
    uint64_t v13 = MEMORY[0x1E4F1DAB8];
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v13 + 32);
    BSRectWithSize();
    BSRectWithSize();
    _UISheetTransform();
    long long v15 = v23;
    *(_OWORD *)&retstr->a = v22;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tx = v24;
    boundsToTransformMap = self->_boundsToTransformMap;
    if (!boundsToTransformMap)
    {
      v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v18 = self->_boundsToTransformMap;
      self->_boundsToTransformMap = v17;

      boundsToTransformMap = self->_boundsToTransformMap;
    }
    long long v19 = *(_OWORD *)&retstr->c;
    long long v22 = *(_OWORD *)&retstr->a;
    long long v23 = v19;
    long long v24 = *(_OWORD *)&retstr->tx;
    v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGAffineTransform:", &v22, v12, 0x3FF0000000000000);
    [(NSMutableDictionary *)boundsToTransformMap setObject:v20 forKey:v6];
  }
  return result;
}

- (CGSize)pageSheetMetricsForBoundsSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  v10 = [(SBFluidSwitcherSheetMetricsCache *)self _displayEdgeInfo];
  uint64_t v11 = [MEMORY[0x1E4F42948] currentDevice];
  -[SBFluidSwitcherSheetMetricsCache pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:](self, "pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, a5, [v11 userInterfaceIdiom], v10, width, height, SBScreenScale());
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGSize)pageSheetMetricsForBoundsSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5 userInterfaceIdiom:(int64_t)a6 displayScale:(double)a7 displayEdgeInfo:(id)a8
{
  double height = a3.height;
  double width = a3.width;
  id v15 = a8;
  double v16 = -[_SBFluidSwitcherSheetMetricsCacheKey initWithBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:]([_SBFluidSwitcherSheetMetricsCacheKey alloc], "initWithBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, a5, a6, v15, width, height, a7);
  double v17 = [(NSMutableDictionary *)self->_cacheKeyToSizeValueMap objectForKey:v16];
  if (v17)
  {
    v18 = v17;
    [v17 CGSizeValue];
    double width = v19;
    double height = v20;
  }
  else
  {
    v21 = [_SBFluidSwitcherSheetMetricsView alloc];
    BSRectWithSize();
    long long v22 = -[_SBFluidSwitcherSheetMetricsView initWithFrame:](v21, "initWithFrame:");
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __149__SBFluidSwitcherSheetMetricsCache_pageSheetMetricsForBoundsSize_interfaceOrientation_configuration_userInterfaceIdiom_displayScale_displayEdgeInfo___block_invoke;
    v44[3] = &__block_descriptor_64_e27_v16__0___UIMutableTraits__8l;
    v44[4] = a6;
    *(double *)&v44[5] = a7;
    *(double *)&v44[6] = width;
    *(double *)&v44[7] = height;
    long long v23 = [MEMORY[0x1E4F42F80] traitCollectionWithTraits:v44];
    objc_msgSend(v15, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", a4, v23);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    [(_SBFluidSwitcherSheetMetricsView *)v22 _setLocalOverrideTraitCollection:v23];
    -[_SBFluidSwitcherSheetMetricsView setOverrideSafeAreaInsets:](v22, "setOverrideSafeAreaInsets:", v25, v27, v29, v31);
    [(_SBFluidSwitcherSheetMetricsView *)v22 _setSafeAreaInsetsFrozen:1];
    [(_SBFluidSwitcherSheetMetricsView *)v22 _setSafeAreaInsetsFrozen:0];
    [(_SBFluidSwitcherSheetMetricsView *)v22 _setSafeAreaInsetsFrozen:1];
    if (a5 == 1)
    {
      v34 = +[SBAppSwitcherDomain rootSettings];
      v35 = [v34 centerWindowSizingSettings];

      if ([v35 useCustomSizingForNewWindows])
      {
        [v35 fullWidthScaleFactor];
        double v37 = v36;
        [v35 fullHeightScaleFactor];
        double width = width * v37;
        double height = height * v38;
      }
    }
    else
    {
      if (a5) {
        _UISheetFormSize();
      }
      else {
        _UISheetPageSize();
      }
      double width = v32;
      double height = v33;
    }
    v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height);
    cacheKeyToSizeValueMap = self->_cacheKeyToSizeValueMap;
    if (!cacheKeyToSizeValueMap)
    {
      v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v41 = self->_cacheKeyToSizeValueMap;
      self->_cacheKeyToSizeValueMap = v40;

      cacheKeyToSizeValueMap = self->_cacheKeyToSizeValueMap;
    }
    [(NSMutableDictionary *)cacheKeyToSizeValueMap setObject:v18 forKey:v16];
  }
  double v42 = width;
  double v43 = height;
  result.double height = v43;
  result.double width = v42;
  return result;
}

void __149__SBFluidSwitcherSheetMetricsCache_pageSheetMetricsForBoundsSize_interfaceOrientation_configuration_userInterfaceIdiom_displayScale_displayEdgeInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setUserInterfaceIdiom:v3];
  [v4 setDisplayScale:*(double *)(a1 + 40)];
  [v4 setHorizontalSizeClass:_UIUserInterfaceSizeClassForWidth()];
  [v4 setVerticalSizeClass:_UIUserInterfaceSizeClassForHeight()];
}

- (CGRect)pageSheetFrameForBounds:(CGRect)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = [(SBFluidSwitcherSheetMetricsCache *)self _displayEdgeInfo];
  double v13 = [MEMORY[0x1E4F42948] currentDevice];
  -[SBFluidSwitcherSheetMetricsCache pageSheetFrameForBounds:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:](self, "pageSheetFrameForBounds:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, a5, [v13 userInterfaceIdiom], v12, x, y, width, height, SBScreenScale());
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)pageSheetFrameForBounds:(CGRect)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5 userInterfaceIdiom:(int64_t)a6 displayScale:(double)a7 displayEdgeInfo:(id)a8
{
  if (a5 == 1)
  {
    -[SBFluidSwitcherSheetMetricsCache pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:](self, "pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, 1, a6, a8, a3.size.width, a3.size.height, a7);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = +[SBAppSwitcherDomain rootSettings];
    double v17 = [v16 centerWindowSizingSettings];

    if ([v17 useCustomSizingForNewWindows])
    {
      [v17 topInset];
      UIRectInsetEdges();
      [v17 bottomInset];
      UIRectInsetEdges();
      [v17 leftInset];
      UIRectInsetEdges();
      [v17 rightInset];
      UIRectInsetEdges();
      double v9 = v18;
      double v11 = v19;
      double v13 = v20;
      double v15 = v21;
    }
  }
  else
  {
    -[SBFluidSwitcherSheetMetricsCache pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:](self, "pageSheetMetricsForBoundsSize:interfaceOrientation:configuration:userInterfaceIdiom:displayScale:displayEdgeInfo:", a4, a5, a6, a8, a3.size.width, a3.size.height, a7);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    double v9 = v22;
    double v11 = v23;
    double v13 = v24;
    double v15 = v25;
  }
  double v26 = v9;
  double v27 = v11;
  double v28 = v13;
  double v29 = v15;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundsToTransformMap, 0);
  objc_storeStrong((id *)&self->_cacheKeyToSizeValueMap, 0);
}

@end