@interface SBStripContinuousExposeSwitcherModifier
- (BOOL)_isAppLayoutEffectivelyOnStage:(id)a3;
- (BOOL)_isGroupForAppLayoutHighlightedFromHover:(id)a3;
- (BOOL)_isGroupForAppLayoutHighlightedFromTouch:(id)a3;
- (BOOL)isContinuousExposeConfigurationChangeTransition;
- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3;
- (CGPoint)_positionForPositionIn3DContainerSpace:(CGPoint)a3 layerPosition:(CGPoint)a4 layerSize:(CGSize)a5 layerAnchorPoint:(CGPoint)a6 layerTransform:(CATransform3D *)a7 containerPerspective:(double)a8;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)_cachedOrFallbackFrameForIndex:(unint64_t)a3 cacheValidityToken:(id)a4;
- (CGRect)_stripFrame;
- (CGRect)frameForIndex:(unint64_t)a3;
- (NSMutableSet)highlightedByHoverAppLayouts;
- (NSMutableSet)highlightedByTouchAppLayouts;
- (SBStripContinuousExposeSwitcherModifier)init;
- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_appStripOriginX;
- (double)_cachedOrFallbackScaleForIndex:(unint64_t)a3 cacheValidityToken:(id)a4;
- (double)_highlightScaleForAppLayout:(id)a3;
- (double)_wallpaperDimmingForIndex:(unint64_t)a3;
- (double)adjustedSpaceAccessoryViewScale:(double)a3 forAppLayout:(id)a4;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (id)_currentLayoutCalculationsValidityToken;
- (id)_orderedVisibleAppLayoutsIgnoringProgress:(BOOL)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsForContinuousExposeIdentifier:(id)a3;
- (id)buildLayoutCalculationsForCache:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleHighlightEvent:(id)a3;
- (id)inactiveAppLayoutsReachableByKeyboardShortcut;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)_indexInContinuousExposeIdentifierPileForAppLayout:(id)a3;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
- (void)_invalidateAppStripOriginX;
- (void)setContinuousExposeConfigurationChangeTransition:(BOOL)a3;
- (void)setHighlightedByHoverAppLayouts:(id)a3;
- (void)setHighlightedByTouchAppLayouts:(id)a3;
@end

@implementation SBStripContinuousExposeSwitcherModifier

- (SBStripContinuousExposeSwitcherModifier)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  v2 = [(SBSwitcherModifier *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    highlightedByTouchAppLayouts = v2->_highlightedByTouchAppLayouts;
    v2->_highlightedByTouchAppLayouts = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    highlightedByHoverAppLayouts = v2->_highlightedByHoverAppLayouts;
    v2->_highlightedByHoverAppLayouts = v5;

    v7 = objc_alloc_init(SBSwitcherLayoutCalculationsCache);
    stripLayoutCache = v2->_stripLayoutCache;
    v2->_stripLayoutCache = v7;

    [(SBSwitcherLayoutCalculationsCache *)v2->_stripLayoutCache setDelegate:v2];
  }
  return v2;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  v5 = [(SBStripContinuousExposeSwitcherModifier *)&v14 appLayoutsForContinuousExposeIdentifier:v4];
  v6 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutOnStage];
  v7 = v6;
  if (v6
    && ([v6 continuousExposeIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = BSEqualStrings(),
        v8,
        v9))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__SBStripContinuousExposeSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke;
    v13[3] = &unk_1E6AF4B60;
    v13[4] = self;
    objc_msgSend(v5, "bs_filter:", v13);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v5;
  }
  v11 = v10;

  return v11;
}

uint64_t __83__SBStripContinuousExposeSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isAppLayoutEffectivelyOnStage:a2] ^ 1;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  -[SBStripContinuousExposeSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  int v9 = [(SBStripContinuousExposeSwitcherModifier *)self appLayouts];
  id v10 = [v9 objectAtIndex:a3];

  v11 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v10];

  v12 = [(SBStripContinuousExposeSwitcherModifier *)self _currentLayoutCalculationsValidityToken];
  [(SBStripContinuousExposeSwitcherModifier *)self _cachedOrFallbackFrameForIndex:a3 cacheValidityToken:v12];
  double v14 = v13;
  double v16 = v15;

  v17 = [(SBStripContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersInStrip];
  v18 = [v11 continuousExposeIdentifier];
  if ([v17 containsObject:v18])
  {
    [(SBStripContinuousExposeSwitcherModifier *)self _appStripOriginX];
    double v14 = v19;
  }

  double v20 = v14 - v6 * 0.5;
  double v21 = v16 - v8 * 0.5;
  double v22 = v6;
  double v23 = v8;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  double v5 = [(SBStripContinuousExposeSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  double v7 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v6];

  double v8 = [v7 continuousExposeIdentifier];
  int v9 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v8];

  id v10 = [(SBStripContinuousExposeSwitcherModifier *)self switcherSettings];
  v11 = [v10 chamoisSettings];
  unint64_t v12 = [v11 numberOfVisibleItemsPerGroup];

  unint64_t v13 = [v9 count];
  if (v13 < v12) {
    unint64_t v12 = v13;
  }
  double v14 = 0.0;
  if (v12 >= 2)
  {
    double v15 = [(SBStripContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
    [v15 stripCardScale];
    double v17 = v16;
    [v15 stripStackDistance];
    double v19 = v18;
    double v20 = [(SBStripContinuousExposeSwitcherModifier *)self _currentLayoutCalculationsValidityToken];
    [(SBStripContinuousExposeSwitcherModifier *)self _cachedOrFallbackFrameForIndex:a3 cacheValidityToken:v20];
    double v22 = v21;
    [(SBStripContinuousExposeSwitcherModifier *)self _cachedOrFallbackScaleForIndex:a3 cacheValidityToken:v20];
    double v24 = v23;
    uint64_t v25 = [v9 indexOfObject:v7];
    if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v26 = 0;
    }
    else {
      unint64_t v26 = v25;
    }
    double v14 = v17 / v24 * (v19 / v22) * (double)v26 - ((double)v12 + -1.0) * (v17 / v24 * (v19 / v22));
  }
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    double v14 = 1.0 - v14;
  }

  double v27 = 0.5;
  double v28 = v14;
  result.y = v27;
  result.x = v28;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5 = [(SBStripContinuousExposeSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  double v7 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v6];

  double v8 = [(SBStripContinuousExposeSwitcherModifier *)self _currentLayoutCalculationsValidityToken];
  [(SBStripContinuousExposeSwitcherModifier *)self _cachedOrFallbackScaleForIndex:a3 cacheValidityToken:v8];
  double v10 = v9;
  v11 = [v7 continuousExposeIdentifier];
  unint64_t v12 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v11];

  if ((unint64_t)[v12 count] >= 2)
  {
    *(void *)&rect.origin.y = self;
    *(void *)&rect.size.width = SBStripContinuousExposeSwitcherModifier;
    [(CGFloat *)(objc_super *)&rect.origin.y frameForIndex:a3];
    rect.origin.x = v13;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [(SBStripContinuousExposeSwitcherModifier *)self _cachedOrFallbackFrameForIndex:a3 cacheValidityToken:v8];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    uint64_t v28 = [v12 indexOfObject:v7];
    if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v29 = 0;
    }
    else {
      unint64_t v29 = v28;
    }
    v35.origin.x = v21;
    v35.origin.y = v23;
    v35.size.width = v25;
    v35.size.height = v27;
    double Height = CGRectGetHeight(v35);
    v36.origin.x = rect.origin.x;
    v36.origin.y = v15;
    v36.size.width = v17;
    v36.size.height = v19;
    double v10 = (double)v29 * -0.01 + v10 * (Height / CGRectGetHeight(v36));
  }
  [(SBStripContinuousExposeSwitcherModifier *)self _highlightScaleForAppLayout:v7];
  double v32 = v10 * v31;

  return v32;
}

- (double)_highlightScaleForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = 1.0;
  if (![(SBStripContinuousExposeSwitcherModifier *)self _indexInContinuousExposeIdentifierPileForAppLayout:v4])
  {
    BOOL v6 = [(SBStripContinuousExposeSwitcherModifier *)self _isGroupForAppLayoutHighlightedFromHover:v4];
    BOOL v7 = [(SBStripContinuousExposeSwitcherModifier *)self _isGroupForAppLayoutHighlightedFromTouch:v4];
    if (v6 && v7)
    {
      double v5 = 0.98;
    }
    else
    {
      double v8 = 1.1;
      if (!v6) {
        double v8 = 1.0;
      }
      if (v7) {
        double v5 = 0.9;
      }
      else {
        double v5 = v8;
      }
    }
  }

  return v5;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  CGFloat y = a3.y;
  uint64_t v5 = objc_msgSend((id)*MEMORY[0x1E4F43630], "userInterfaceLayoutDirection", a4, a3.x);
  double v6 = 0.0;
  if (v5 == 1) {
    double v6 = 1.0;
  }
  double v7 = y;
  result.CGFloat y = v7;
  result.x = v6;
  return result;
}

- (double)adjustedSpaceAccessoryViewScale:(double)a3 forAppLayout:(id)a4
{
  [(SBStripContinuousExposeSwitcherModifier *)self _highlightScaleForAppLayout:a4];
  return a3 / v5;
}

- (id)visibleAppLayouts
{
  v2 = [(SBStripContinuousExposeSwitcherModifier *)self _orderedVisibleAppLayoutsIgnoringProgress:0];
  v3 = [v2 set];

  return v3;
}

- (id)_orderedVisibleAppLayoutsIgnoringProgress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  [(SBStripContinuousExposeSwitcherModifier *)self continuousExposeStripProgress];
  if ((BSFloatGreaterThanFloat() & 1) != 0
    || (!self->_requireStripContentsInViewHierarchy ? (BOOL v6 = !v3) : (BOOL v6 = 0), !v6))
  {
    CGFloat v23 = [(SBStripContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersInStrip];
    uint64_t v7 = [v23 count];
    double v8 = [(SBStripContinuousExposeSwitcherModifier *)self switcherSettings];
    double v9 = [v8 chamoisSettings];
    unint64_t v10 = [v9 numberOfVisibleItemsPerGroup];

    id v11 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v22 = v7;
    if (v7)
    {
      uint64_t v12 = 0;
      CGFloat v21 = self;
      do
      {
        CGFloat v13 = [v23 objectAtIndex:v12];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        double v14 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v13];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              [v11 addObject:v13];
              if ([v11 countForObject:v13] <= v10) {
                [v5 addObject:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v16);
        }

        ++v12;
        self = v21;
      }
      while (v12 != v22);
    }
  }
  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  id v8 = a4;
  [(SBStripContinuousExposeSwitcherModifier *)&v16 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
  double v10 = v9;
  unint64_t v11 = -[SBStripContinuousExposeSwitcherModifier _indexInContinuousExposeIdentifierPileForAppLayout:](self, "_indexInContinuousExposeIdentifierPileForAppLayout:", v8, v16.receiver, v16.super_class);

  uint64_t v12 = [(SBStripContinuousExposeSwitcherModifier *)self switcherSettings];
  CGFloat v13 = [v12 chamoisSettings];
  unint64_t v14 = [v13 numberOfVisibleItemsPerGroup];

  double result = 0.0;
  if (v11 <= v14) {
    return v10;
  }
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  id v5 = [(SBStripContinuousExposeSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  if ([(SBStripContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
  {
    v20.receiver = self;
    v20.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
    [(SBStripContinuousExposeSwitcherModifier *)&v20 cornerRadiiForIndex:a3];
  }
  else
  {
    unint64_t v11 = [(SBStripContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
    [v11 stripCornerRadii];

    [(SBStripContinuousExposeSwitcherModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
  }
  double v12 = v7;
  double v13 = v8;
  double v14 = v9;
  double v15 = v10;

  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.topRight = v19;
  result.bottomRight = v18;
  result.bottomLeft = v17;
  result.topLeft = v16;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  id v5 = [(SBStripContinuousExposeSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  [(SBStripContinuousExposeSwitcherModifier *)self _wallpaperDimmingForIndex:a3];
  double v8 = v7;
  double v9 = 0.0;
  double v10 = 0.0;
  if ((BSFloatLessThanOrEqualToFloat() & 1) == 0)
  {
    [(SBStripContinuousExposeSwitcherModifier *)self perspectiveAngleForAppLayout:v6];
    CGFloat v12 = v11;
    double v9 = v8;
    double v10 = v8;
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      double v13 = [(SBStripContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
      [v13 screenEdgePadding];
      double v49 = v14;
      [v13 stripWidth];
      double v48 = v15;
      [v13 containerPerspective];
      uint64_t v47 = v16;
      [(SBStripContinuousExposeSwitcherModifier *)self frameForIndex:a3];
      double v18 = v17;
      double v20 = v19;
      [(SBStripContinuousExposeSwitcherModifier *)self scaleForIndex:a3];
      CGFloat v22 = v21;
      [(SBStripContinuousExposeSwitcherModifier *)self anchorPointForIndex:a3];
      double v45 = v24;
      double v46 = v23;
      UIRectGetCenter();
      double v26 = v25;
      double v28 = v27;
      memset(&v54, 0, sizeof(v54));
      CATransform3DMakeScale(&v54, v22, v22, 1.0);
      memset(&v53, 0, sizeof(v53));
      CATransform3DMakeRotation(&v53, v12, 0.0, 1.0, 0.0);
      memset(&v52, 0, sizeof(v52));
      CATransform3D a = v54;
      CATransform3D b = v53;
      CATransform3DConcat(&v52, &a, &b);
      CATransform3D a = v52;
      -[SBStripContinuousExposeSwitcherModifier _positionForPositionIn3DContainerSpace:layerPosition:layerSize:layerAnchorPoint:layerTransform:containerPerspective:](self, "_positionForPositionIn3DContainerSpace:layerPosition:layerSize:layerAnchorPoint:layerTransform:containerPerspective:", &a, v18 * -0.5, 0.0, v26, v28, v18, v20, v46, v45, v47);
      double v44 = v29;
      CATransform3D a = v52;
      -[SBStripContinuousExposeSwitcherModifier _positionForPositionIn3DContainerSpace:layerPosition:layerSize:layerAnchorPoint:layerTransform:containerPerspective:](self, "_positionForPositionIn3DContainerSpace:layerPosition:layerSize:layerAnchorPoint:layerTransform:containerPerspective:", &a, v18 * 0.5, 0.0, v26, v28, v18, v20, v46, v45, v47);
      double v31 = v30;
      [v13 minimumDefaultWindowSize];
      char IsZero = BSFloatIsZero();
      double v33 = 0.25;
      if ((IsZero & 1) == 0)
      {
        int v34 = [(SBStripContinuousExposeSwitcherModifier *)self prefersStripHidden];
        double v33 = 0.6;
        if (v34) {
          double v33 = 0.25;
        }
      }
      double v35 = v8 + v33;
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
      {
        [(SBStripContinuousExposeSwitcherModifier *)self containerViewBounds];
        double v36 = v35 - v8;
        double v37 = v48 - v49;
        double v38 = (v35 - v8) * (CGRectGetMaxX(v56) - v44 - v49) / (v48 - v49);
        [(SBStripContinuousExposeSwitcherModifier *)self containerViewBounds];
        double v39 = CGRectGetMaxX(v57) - v31 - v49;
      }
      else
      {
        double v39 = v35 - v8;
        double v37 = v48 - v49;
        double v38 = (v44 - v49) * (v35 - v8) / (v48 - v49);
        double v36 = v31 - v49;
      }
      double v40 = v8 + v38;
      double v41 = v8 + v36 * v39 / v37;
      if (v8 + v38 >= v35) {
        double v40 = v35;
      }
      if (v40 >= v8) {
        double v10 = v40;
      }
      else {
        double v10 = v8;
      }
      if (v41 >= v35) {
        double v41 = v35;
      }
      if (v41 >= v8) {
        double v9 = v41;
      }
      else {
        double v9 = v8;
      }
    }
  }
  SBSwitcherWallpaperGradientAttributesMakeEmpty();

  double v42 = v9;
  double v43 = v10;
  result.trailingAlphCATransform3D a = v43;
  result.leadingAlphCATransform3D a = v42;
  return result;
}

- (double)_wallpaperDimmingForIndex:(unint64_t)a3
{
  id v5 = [(SBStripContinuousExposeSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  BOOL v7 = [(SBStripContinuousExposeSwitcherModifier *)self _isGroupForAppLayoutHighlightedFromHover:v6];
  unint64_t v8 = [(SBStripContinuousExposeSwitcherModifier *)self _indexInContinuousExposeIdentifierPileForAppLayout:v6];
  double v9 = (double)v8 * 0.25 + 0.1 + 0.1;
  if (!v8) {
    double v9 = 0.0;
  }
  if (v7) {
    double v10 = v9;
  }
  else {
    double v10 = (double)v8 * 0.25 + 0.1;
  }

  return v10;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  id v5 = [(SBStripContinuousExposeSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  if ([(SBStripContinuousExposeSwitcherModifier *)self _indexInContinuousExposeIdentifierPileForAppLayout:v6])
  {
    double v7 = 0.0;
  }
  else
  {
    double v7 = 1.0;
  }

  return v7;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  uint64_t v4 = objc_msgSend((id)*MEMORY[0x1E4F43630], "userInterfaceLayoutDirection", a3);
  id v5 = [(SBStripContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  [v5 stripTiltAngle];
  if (v4 == 1) {
    double v7 = -v6;
  }
  else {
    double v7 = v6;
  }

  return v7;
}

- (id)topMostLayoutElements
{
  v2 = [(SBStripContinuousExposeSwitcherModifier *)self _orderedVisibleAppLayoutsIgnoringProgress:0];
  BOOL v3 = [v2 array];

  return v3;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 0;
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  v2 = [(SBStripContinuousExposeSwitcherModifier *)self _orderedVisibleAppLayoutsIgnoringProgress:1];
  BOOL v3 = [v2 array];

  return v3;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  [(SBStripContinuousExposeSwitcherModifier *)self _invalidateAppStripOriginX];
  ++self->_modifierEventGenCount;
  int v5 = [(SBStripContinuousExposeSwitcherModifier *)self requireStripContentsInViewHierarchy];
  int v6 = [(SBStripContinuousExposeSwitcherModifier *)self isContinuousExposeConfigurationChangeTransition] | v5;
  if (self->_requireStripContentsInViewHierarchy == v6)
  {
    double v7 = 0;
  }
  else
  {
    self->_requireStripContentsInViewHierarchCGFloat y = v6;
    unint64_t v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:0];
    double v7 = SBAppendSwitcherModifierResponse(v8, 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  double v9 = [(SBChainableModifier *)&v12 handleEvent:v4];
  double v10 = SBAppendSwitcherModifierResponse(v7, v9);

  return v10;
}

- (id)handleHighlightEvent:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  int v5 = [(SBSwitcherModifier *)&v35 handleHighlightEvent:v4];
  int v6 = [v4 appLayout];
  if (([v4 isHandled] & 1) == 0 && v6 && (objc_msgSend(v4, "isPencilHoverEvent") & 1) == 0)
  {
    unint64_t v7 = [v4 phase] - 1;
    BOOL v8 = [(SBStripContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6];
    int v9 = [v4 isHoverEvent];
    if (!v8 && v7 > 1)
    {
      if (v9) {
        uint64_t v10 = 152;
      }
      else {
        uint64_t v10 = 144;
      }
      [*(id *)((char *)&self->super.super.super.isa + v10) addObject:v6];
      goto LABEL_37;
    }
    if (v7 < 2) {
      int v11 = v9;
    }
    else {
      int v11 = 0;
    }
    if (v11 == 1)
    {
      uint64_t v12 = 152;
      if (![(NSMutableSet *)self->_highlightedByHoverAppLayouts containsObject:v6])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        double v13 = (void *)[(NSMutableSet *)self->_highlightedByHoverAppLayouts copy];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              double v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if ([v18 containsAnyItemFromAppLayout:v6]) {
                [(NSMutableSet *)self->_highlightedByHoverAppLayouts removeObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
          }
          while (v15);
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v12 = 144;
      if (![(NSMutableSet *)self->_highlightedByTouchAppLayouts containsObject:v6])
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        double v13 = (void *)[(NSMutableSet *)self->_highlightedByTouchAppLayouts copy];
        uint64_t v19 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(v13);
              }
              double v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              if ([v23 containsAnyItemFromAppLayout:v6]) {
                [(NSMutableSet *)self->_highlightedByTouchAppLayouts removeObject:v23];
              }
            }
            uint64_t v20 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
          }
          while (v20);
        }
        goto LABEL_36;
      }
    }
    [*(id *)((char *)&self->super.super.super.isa + v12) removeObject:v6];
LABEL_37:
    double v24 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:12 updateMode:0];
    uint64_t v25 = SBAppendSwitcherModifierResponse(v24, v5);

    [v4 handleWithReason:@"Full Screen Continuous Expose"];
    int v5 = (void *)v25;
  }

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  BOOL v3 = [(SBStripContinuousExposeSwitcherModifier *)&v6 animationAttributesForLayoutElement:a3];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setUpdateMode:3];
  return v4;
}

- (id)_currentLayoutCalculationsValidityToken
{
  BOOL v3 = [SBSwitcherLayoutCalculationsCacheValidityToken alloc];
  uint64_t v4 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutsGenerationCount];
  uint64_t v5 = [(SBStripContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersGenerationCount];
  uint64_t v6 = [(SBStripContinuousExposeSwitcherModifier *)self switcherInterfaceOrientation];
  [(SBStripContinuousExposeSwitcherModifier *)self containerViewBounds];
  unint64_t v7 = -[SBSwitcherLayoutCalculationsCacheValidityToken initWithAppLayoutsGenCount:continuousExposeIdentifiersGenCount:switcherInterfaceOrientation:containerViewBounds:modifierEventGenCount:](v3, "initWithAppLayoutsGenCount:continuousExposeIdentifiersGenCount:switcherInterfaceOrientation:containerViewBounds:modifierEventGenCount:", v4, v5, v6, self->_modifierEventGenCount);
  return v7;
}

- (id)buildLayoutCalculationsForCache:(id)a3
{
  BOOL v3 = self;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SBStripContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersInStrip];
  unint64_t v60 = [v4 count];
  uint64_t v5 = [(SBStripContinuousExposeSwitcherModifier *)v3 chamoisLayoutAttributes];
  [v5 stripWidth];
  uint64_t v61 = v6;
  [v5 stripStackDistance];
  uint64_t v8 = v7;
  [v5 stripCardScale];
  double v10 = v9;
  [v5 stripInterItemSpacing];
  double v12 = v11;
  [(SBStripContinuousExposeSwitcherModifier *)v3 containerViewBounds];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  double v20 = v19;
  uint64_t v21 = [(SBStripContinuousExposeSwitcherModifier *)v3 switcherSettings];
  CGFloat v22 = [v21 chamoisSettings];

  uint64_t v23 = [v22 numberOfVisibleItemsPerGroup];
  if (([(SBStripContinuousExposeSwitcherModifier *)v3 prefersDockHidden] & 1) == 0) {
    [(SBStripContinuousExposeSwitcherModifier *)v3 floatingDockHeight];
  }
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __75__SBStripContinuousExposeSwitcherModifier_buildLayoutCalculationsForCache___block_invoke;
  v67[3] = &__block_descriptor_88_e8_d16__0Q8l;
  v67[4] = v14;
  v67[5] = v16;
  v67[6] = v18;
  *(double *)&v67[7] = v20;
  v67[8] = v61;
  v67[9] = v8;
  v67[10] = v23;
  uint64_t v24 = MEMORY[0x1D948C7A0](v67);
  v59 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v60];
  v58 = (void *)v24;
  if (v60)
  {
    CGRect v56 = v22;
    CGRect v57 = v5;
    unint64_t v25 = 0;
    double v26 = 0.0;
    do
    {
      long long v27 = objc_msgSend(v4, "objectAtIndex:", v25, v56, v57);
      long long v28 = [(SBStripContinuousExposeSwitcherModifier *)v3 appLayoutsForContinuousExposeIdentifier:v27];
      uint64_t v29 = [v28 count];
      long long v30 = [v28 firstObject];
      v62 = [(SBSwitcherModifier *)v3 autoLayoutSpaceForAppLayout:v30];
      if (v29 == 1
        && ([v30 allItems],
            long long v31 = objc_claimAutoreleasedReturnValue(),
            long long v32 = v3,
            uint64_t v33 = [v31 count],
            v31,
            BOOL v34 = v33 == 1,
            BOOL v3 = v32,
            v34))
      {
        objc_super v35 = [v30 allItems];
        double v36 = [v35 firstObject];
        [v62 autoLayoutItemForDisplayItem:v36];
        v38 = double v37 = v4;
        [v38 size];
        double v40 = v39;
        double v42 = v41;

        uint64_t v4 = v37;
        uint64_t v24 = (uint64_t)v58;

        BOOL v3 = v32;
      }
      else
      {
        objc_super v35 = [(SBSwitcherModifier *)v3 autoLayoutSpaceForAppLayout:v30];
        [v35 boundingBox];
        double v40 = v43;
        double v42 = v44;
      }

      double v45 = (*(double (**)(uint64_t, uint64_t))(v24 + 16))(v24, v29);
      double v46 = v10;
      if (v40 > v45) {
        double v46 = v10 * (v45 / v40);
      }
      uint64_t v47 = objc_alloc_init(SBSwitcherLayoutCalculations);
      [(SBSwitcherLayoutCalculations *)v47 setScale:v46];
      -[SBSwitcherLayoutCalculations setFrame:](v47, "setFrame:", 0.0, v26 + v42 * v46 * 0.5, v40, v42);
      [v59 setObject:v47 forKey:v27];
      ++v25;
      double v48 = -0.0;
      if (v25 < v60) {
        double v48 = v12;
      }
      double v26 = v48 + v26 + v42 * v46;
    }
    while (v60 != v25);
    CGFloat v22 = v56;
    uint64_t v5 = v57;
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v49 = v59;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v64 != v52) {
          objc_enumerationMutation(v49);
        }
        CATransform3D v54 = [v49 objectForKey:*(void *)(*((void *)&v63 + 1) + 8 * i)];
        [v54 frame];
        objc_msgSend(v54, "setFrame:");
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v51);
  }

  return v49;
}

double __75__SBStripContinuousExposeSwitcherModifier_buildLayoutCalculationsForCache___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 48)
       + *(double *)(a1 + 64) * -2.0
       + *(double *)(a1 + 72) * (double)(unint64_t)(*(void *)(a1 + 80) - a2);
}

- (unint64_t)_indexInContinuousExposeIdentifierPileForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 continuousExposeIdentifier];
  uint64_t v6 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v5];
  unint64_t v7 = [v6 indexOfObject:v4];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v7;
  }
}

- (double)_appStripOriginX
{
  [(SBStripContinuousExposeSwitcherModifier *)self continuousExposeStripProgress];
  double v4 = v3;
  if (self->_cached_appStripOriginX == 0.0 || (BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cached_appStripUnocclusionProgress = v4;
    uint64_t v5 = [(SBStripContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
    [v5 stripWidth];
    double v7 = v6;
    [v5 screenEdgePadding];
    double v9 = v4 * (v7 + v8) - v7;
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      [(SBStripContinuousExposeSwitcherModifier *)self containerViewBounds];
      double v9 = v10 - v9;
    }
    self->_cached_appStripOriginX = v9;
  }
  return self->_cached_appStripOriginX;
}

- (void)_invalidateAppStripOriginX
{
  self->_cached_appStripOriginX = 0.0;
  self->_cached_appStripUnocclusionProgress = -1.0;
}

- (CGRect)_stripFrame
{
  [(SBStripContinuousExposeSwitcherModifier *)self containerViewBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(SBStripContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  [v11 stripWidth];
  double v13 = v12;

  v20.origin.x = v4;
  v20.origin.CGFloat y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  CGFloat Height = CGRectGetHeight(v20);
  uint64_t v15 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  double Width = 0.0;
  if (v15 == 1)
  {
    v21.origin.x = v4;
    v21.origin.CGFloat y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    double Width = CGRectGetWidth(v21);
  }
  double v17 = 0.0;
  double v18 = v13;
  double v19 = Height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.CGFloat y = v17;
  result.origin.x = Width;
  return result;
}

- (CGPoint)_positionForPositionIn3DContainerSpace:(CGPoint)a3 layerPosition:(CGPoint)a4 layerSize:(CGSize)a5 layerAnchorPoint:(CGPoint)a6 layerTransform:(CATransform3D *)a7 containerPerspective:(double)a8
{
  [(SBStripContinuousExposeSwitcherModifier *)self containerViewBounds];
  double v9 = v8;
  double v16 = v10;
  CAPointApplyTransform();
  CAPointApplyTransform();
  double v14 = v9 * 0.5 + v11 / v12;
  double v15 = v16 * 0.5 + v13 / v12;
  result.CGFloat y = v15;
  result.x = v14;
  return result;
}

- (BOOL)_isGroupForAppLayoutHighlightedFromTouch:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBStripContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v4])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    CGFloat v6 = [v4 continuousExposeIdentifier];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v7 = self->_highlightedByTouchAppLayouts;
    uint64_t v5 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v7);
          }
          double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "continuousExposeIdentifier", (void)v13);
          char v11 = [v10 isEqualToString:v6];

          if (v11)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (BOOL)_isGroupForAppLayoutHighlightedFromHover:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBStripContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v4])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    CGFloat v6 = [v4 continuousExposeIdentifier];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v7 = self->_highlightedByHoverAppLayouts;
    uint64_t v5 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v7);
          }
          double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "continuousExposeIdentifier", (void)v13);
          char v11 = [v10 isEqualToString:v6];

          if (v11)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (BOOL)_isAppLayoutEffectivelyOnStage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutOnStage];
  CGFloat v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  if (([v5 containsAllItemsFromAppLayout:v4] & 1) == 0
    && ([v4 containsAllItemsFromAppLayout:v6] & 1) == 0)
  {
    uint64_t v8 = [(SBStripContinuousExposeSwitcherModifier *)self switcherSettings];
    double v9 = [v8 chamoisSettings];
    uint64_t v10 = [v9 maximumNumberOfAppsOnStage];

    char v11 = [v6 allItems];
    if ([v11 count] == v10)
    {
      double v12 = [v4 allItems];
      uint64_t v13 = [v12 count];

      if (v13 == v10)
      {
        long long v14 = [v4 allItems];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __74__SBStripContinuousExposeSwitcherModifier__isAppLayoutEffectivelyOnStage___block_invoke;
        v17[3] = &unk_1E6AF4B38;
        id v18 = v6;
        long long v15 = objc_msgSend(v14, "bs_filter:", v17);

        BOOL v7 = [v15 count] == v10 - 1;
        goto LABEL_10;
      }
    }
    else
    {
    }
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

uint64_t __74__SBStripContinuousExposeSwitcherModifier__isAppLayoutEffectivelyOnStage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2];
}

- (CGRect)_cachedOrFallbackFrameForIndex:(unint64_t)a3 cacheValidityToken:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(SBStripContinuousExposeSwitcherModifier *)self appLayouts];
  uint64_t v8 = [v7 objectAtIndex:a3];

  double v9 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v8];

  uint64_t v10 = [v9 continuousExposeIdentifier];
  stripLayoutCache = self->_stripLayoutCache;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __93__SBStripContinuousExposeSwitcherModifier__cachedOrFallbackFrameForIndex_cacheValidityToken___block_invoke;
  v24[3] = &unk_1E6B00CB0;
  v24[4] = self;
  v24[5] = a3;
  [(SBSwitcherLayoutCalculationsCache *)stripLayoutCache frameForKey:v10 validityToken:v6 fallback:v24];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.CGFloat y = v21;
  result.origin.x = v20;
  return result;
}

double __93__SBStripContinuousExposeSwitcherModifier__cachedOrFallbackFrameForIndex_cacheValidityToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v26.receiver = *(id *)(a1 + 32);
  v26.super_class = (Class)SBStripContinuousExposeSwitcherModifier;
  objc_msgSendSuper2(&v26, sel_frameForIndex_, v2);
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [*(id *)(a1 + 32) containerViewBounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat rect = v15;
  CGFloat v17 = v16;
  double v18 = [*(id *)(a1 + 32) chamoisLayoutAttributes];
  [v18 stripWidth];
  double v20 = v19;

  v27.origin.x = v4;
  v27.origin.CGFloat y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  double Width = CGRectGetWidth(v27);
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    v28.origin.x = v12;
    v28.origin.CGFloat y = v14;
    v28.size.width = rect;
    v28.size.height = v17;
    double v22 = v20 + CGRectGetWidth(v28);
  }
  else
  {
    double v22 = 0.0 - v20;
  }
  v29.size.width = rect;
  double v23 = v22 - Width * 0.5;
  v29.origin.x = v12;
  v29.origin.CGFloat y = v14;
  v29.size.height = v17;
  CGRectGetHeight(v29);
  return v23;
}

- (double)_cachedOrFallbackScaleForIndex:(unint64_t)a3 cacheValidityToken:(id)a4
{
  id v6 = a4;
  double v7 = [(SBStripContinuousExposeSwitcherModifier *)self appLayouts];
  CGFloat v8 = [v7 objectAtIndex:a3];

  double v9 = [(SBStripContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v8];

  CGFloat v10 = [v9 continuousExposeIdentifier];
  stripLayoutCache = self->_stripLayoutCache;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__SBStripContinuousExposeSwitcherModifier__cachedOrFallbackScaleForIndex_cacheValidityToken___block_invoke;
  v15[3] = &unk_1E6AFD028;
  v15[4] = self;
  [(SBSwitcherLayoutCalculationsCache *)stripLayoutCache scaleForKey:v10 validityToken:v6 fallback:v15];
  double v13 = v12;

  return v13;
}

double __93__SBStripContinuousExposeSwitcherModifier__cachedOrFallbackScaleForIndex_cacheValidityToken___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) chamoisLayoutAttributes];
  [v1 stripCardScale];
  double v3 = v2;

  return v3;
}

- (NSMutableSet)highlightedByTouchAppLayouts
{
  return self->_highlightedByTouchAppLayouts;
}

- (void)setHighlightedByTouchAppLayouts:(id)a3
{
}

- (NSMutableSet)highlightedByHoverAppLayouts
{
  return self->_highlightedByHoverAppLayouts;
}

- (void)setHighlightedByHoverAppLayouts:(id)a3
{
}

- (BOOL)isContinuousExposeConfigurationChangeTransition
{
  return self->_continuousExposeConfigurationChangeTransition;
}

- (void)setContinuousExposeConfigurationChangeTransition:(BOOL)a3
{
  self->_continuousExposeConfigurationChangeTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedByHoverAppLayouts, 0);
  objc_storeStrong((id *)&self->_highlightedByTouchAppLayouts, 0);
  objc_storeStrong((id *)&self->_stripLayoutCache, 0);
}

@end