@interface SBSwitcherChamoisLayoutAttributes
- (BOOL)isAdditiveModelEnabled;
- (BOOL)isAutoLayoutEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersDockHidden;
- (BOOL)prefersStripHidden;
- (BOOL)requiresFullScreen;
- (BOOL)usesStripAreaForOverlapping;
- (CGRect)containerBounds;
- (CGSize)defaultWindowSize;
- (CGSize)minimumDefaultWindowSize;
- (NSArray)gridHeights;
- (NSArray)gridWidths;
- (NSString)description;
- (SBSwitcherChamoisSettings)settings;
- (SBSwitcherChamoisSnapPaddingSettings)snapPaddingSettings;
- (double)containerPerspective;
- (double)maximumWindowHeightWithDock;
- (double)maximumWindowWidthForOverlapping;
- (double)minimumWindowWidth;
- (double)partiallyOccludedStageScaleForItemWithSize:(CGSize)a3;
- (double)screenEdgePadding;
- (double)stageCornerRadii;
- (double)stageInterItemSpacing;
- (double)stageOccludedAppScale;
- (double)stageOcclusionDodgingPeekLength;
- (double)stageOcclusionDodgingPeekScale;
- (double)stageStatusBarClearingAppScale;
- (double)stripCardScale;
- (double)stripCornerRadii;
- (double)stripIconLength;
- (double)stripInterItemSpacing;
- (double)stripStackDistance;
- (double)stripTiltAngle;
- (double)stripVerticalEdgeSpacing;
- (double)stripWidth;
- (double)switcherHeightForIconAndLabelsUnderEachPile;
- (double)switcherHorizontalEdgeSpacing;
- (double)switcherHorizontalInterItemSpacing;
- (double)switcherPileCardMinimumPeekAmount;
- (double)switcherPileCompactingFactor;
- (double)switcherVerticalEdgeSpacing;
- (double)switcherVerticalInterItemSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)numberOfRowsWhileInApp;
- (void)setContainerBounds:(CGRect)a3;
- (void)setContainerPerspective:(double)a3;
- (void)setDefaultWindowSize:(CGSize)a3;
- (void)setGridHeights:(id)a3;
- (void)setGridWidths:(id)a3;
- (void)setIsAdditiveModelEnabled:(BOOL)a3;
- (void)setIsAutoLayoutEnabled:(BOOL)a3;
- (void)setMaximumWindowHeightWithDock:(double)a3;
- (void)setMaximumWindowWidthForOverlapping:(double)a3;
- (void)setMinimumDefaultWindowSize:(CGSize)a3;
- (void)setMinimumWindowWidth:(double)a3;
- (void)setNumberOfRowsWhileInApp:(unint64_t)a3;
- (void)setPrefersDockHidden:(BOOL)a3;
- (void)setPrefersStripHidden:(BOOL)a3;
- (void)setRequiresFullScreen:(BOOL)a3;
- (void)setScreenEdgePadding:(double)a3;
- (void)setSettings:(id)a3;
- (void)setSnapPaddingSettings:(id)a3;
- (void)setStageCornerRadii:(double)a3;
- (void)setStageInterItemSpacing:(double)a3;
- (void)setStageOccludedAppScale:(double)a3;
- (void)setStageOcclusionDodgingPeekLength:(double)a3;
- (void)setStageOcclusionDodgingPeekScale:(double)a3;
- (void)setStageStatusBarClearingAppScale:(double)a3;
- (void)setStripCardScale:(double)a3;
- (void)setStripCornerRadii:(double)a3;
- (void)setStripIconLength:(double)a3;
- (void)setStripInterItemSpacing:(double)a3;
- (void)setStripStackDistance:(double)a3;
- (void)setStripTiltAngle:(double)a3;
- (void)setStripVerticalEdgeSpacing:(double)a3;
- (void)setStripWidth:(double)a3;
- (void)setSwitcherHeightForIconAndLabelsUnderEachPile:(double)a3;
- (void)setSwitcherHorizontalEdgeSpacing:(double)a3;
- (void)setSwitcherHorizontalInterItemSpacing:(double)a3;
- (void)setSwitcherPileCardMinimumPeekAmount:(double)a3;
- (void)setSwitcherPileCompactingFactor:(double)a3;
- (void)setSwitcherVerticalEdgeSpacing:(double)a3;
- (void)setSwitcherVerticalInterItemSpacing:(double)a3;
- (void)setUsesStripAreaForOverlapping:(BOOL)a3;
@end

@implementation SBSwitcherChamoisLayoutAttributes

- (double)stageInterItemSpacing
{
  return self->_stageInterItemSpacing;
}

- (double)partiallyOccludedStageScaleForItemWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(SBSwitcherChamoisLayoutAttributes *)self settings];
  v7 = v6;
  if (v6)
  {
    [v6 stageOccludedAppScaleFactor];
    double v9 = v8;
  }
  else
  {
    double v9 = 1.0;
  }
  if (width == self->_containerBounds.size.width && height == self->_containerBounds.size.height)
  {
    [(SBSwitcherChamoisLayoutAttributes *)self stageStatusBarClearingAppScale];
    double v12 = v13;
  }
  else
  {
    [(SBSwitcherChamoisLayoutAttributes *)self stageOccludedAppScale];
    double v12 = v9 * v11;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSwitcherChamoisLayoutAttributes *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(SBSwitcherChamoisLayoutAttributes *)v5 containerBounds];
      v26.origin.x = v6;
      v26.origin.y = v7;
      v26.size.double width = v8;
      v26.size.double height = v9;
      if (CGRectEqualToRect(self->_containerBounds, v26))
      {
        BOOL requiresFullScreen = self->_requiresFullScreen;
        if (requiresFullScreen == [(SBSwitcherChamoisLayoutAttributes *)v5 requiresFullScreen])
        {
          [(SBSwitcherChamoisLayoutAttributes *)v5 defaultWindowSize];
          BOOL v12 = 0;
          if (self->_defaultWindowSize.width != v13) {
            goto LABEL_46;
          }
          if (self->_defaultWindowSize.height != v11) {
            goto LABEL_46;
          }
          [(SBSwitcherChamoisLayoutAttributes *)v5 minimumDefaultWindowSize];
          BOOL v12 = 0;
          if (self->_minimumDefaultWindowSize.width != v15 || self->_minimumDefaultWindowSize.height != v14) {
            goto LABEL_46;
          }
          [(SBSwitcherChamoisLayoutAttributes *)v5 maximumWindowHeightWithDock];
          if (BSFloatEqualToFloat())
          {
            [(SBSwitcherChamoisLayoutAttributes *)v5 maximumWindowWidthForOverlapping];
            if (BSFloatEqualToFloat())
            {
              [(SBSwitcherChamoisLayoutAttributes *)v5 minimumWindowWidth];
              if (BSFloatEqualToFloat())
              {
                [(SBSwitcherChamoisLayoutAttributes *)v5 containerPerspective];
                if (BSFloatEqualToFloat())
                {
                  [(SBSwitcherChamoisLayoutAttributes *)v5 screenEdgePadding];
                  if (BSFloatEqualToFloat())
                  {
                    [(SBSwitcherChamoisLayoutAttributes *)v5 stripWidth];
                    if (BSFloatEqualToFloat())
                    {
                      [(SBSwitcherChamoisLayoutAttributes *)v5 stripVerticalEdgeSpacing];
                      if (BSFloatEqualToFloat())
                      {
                        [(SBSwitcherChamoisLayoutAttributes *)v5 stripInterItemSpacing];
                        if (BSFloatEqualToFloat())
                        {
                          [(SBSwitcherChamoisLayoutAttributes *)v5 stripTiltAngle];
                          if (BSFloatEqualToFloat())
                          {
                            [(SBSwitcherChamoisLayoutAttributes *)v5 stripIconLength];
                            if (BSFloatEqualToFloat())
                            {
                              [(SBSwitcherChamoisLayoutAttributes *)v5 stripStackDistance];
                              if (BSFloatEqualToFloat())
                              {
                                [(SBSwitcherChamoisLayoutAttributes *)v5 stripCardScale];
                                if (BSFloatEqualToFloat())
                                {
                                  [(SBSwitcherChamoisLayoutAttributes *)v5 stripCornerRadii];
                                  if (BSFloatEqualToFloat())
                                  {
                                    [(SBSwitcherChamoisLayoutAttributes *)v5 stageCornerRadii];
                                    if (BSFloatEqualToFloat())
                                    {
                                      [(SBSwitcherChamoisLayoutAttributes *)v5 stageInterItemSpacing];
                                      if (BSFloatEqualToFloat())
                                      {
                                        [(SBSwitcherChamoisLayoutAttributes *)v5 stageOccludedAppScale];
                                        if (BSFloatEqualToFloat())
                                        {
                                          [(SBSwitcherChamoisLayoutAttributes *)v5 stageStatusBarClearingAppScale];
                                          if (BSFloatEqualToFloat())
                                          {
                                            [(SBSwitcherChamoisLayoutAttributes *)v5 stageOcclusionDodgingPeekLength];
                                            if (BSFloatEqualToFloat())
                                            {
                                              [(SBSwitcherChamoisLayoutAttributes *)v5 stageOcclusionDodgingPeekScale];
                                              if (BSFloatEqualToFloat())
                                              {
                                                unint64_t numberOfRowsWhileInApp = self->_numberOfRowsWhileInApp;
                                                if (numberOfRowsWhileInApp == [(SBSwitcherChamoisLayoutAttributes *)v5 numberOfRowsWhileInApp])
                                                {
                                                  BOOL isAutoLayoutEnabled = self->_isAutoLayoutEnabled;
                                                  if (isAutoLayoutEnabled == [(SBSwitcherChamoisLayoutAttributes *)v5 isAutoLayoutEnabled])
                                                  {
                                                    BOOL isAdditiveModelEnabled = self->_isAdditiveModelEnabled;
                                                    if (isAdditiveModelEnabled == [(SBSwitcherChamoisLayoutAttributes *)v5 isAdditiveModelEnabled])
                                                    {
                                                      BOOL prefersStripHidden = self->_prefersStripHidden;
                                                      if (prefersStripHidden == [(SBSwitcherChamoisLayoutAttributes *)v5 prefersStripHidden])
                                                      {
                                                        BOOL prefersDockHidden = self->_prefersDockHidden;
                                                        if (prefersDockHidden == [(SBSwitcherChamoisLayoutAttributes *)v5 prefersDockHidden])
                                                        {
                                                          BOOL usesStripAreaForOverlapping = self->_usesStripAreaForOverlapping;
                                                          if (usesStripAreaForOverlapping == [(SBSwitcherChamoisLayoutAttributes *)v5 usesStripAreaForOverlapping])
                                                          {
                                                            v22 = [(SBSwitcherChamoisLayoutAttributes *)v5 gridWidths];
                                                            if (BSEqualArrays())
                                                            {
                                                              v23 = [(SBSwitcherChamoisLayoutAttributes *)v5 gridHeights];
                                                              if (BSEqualArrays()
                                                                && ([(SBSwitcherChamoisLayoutAttributes *)v5 switcherHorizontalEdgeSpacing], BSFloatEqualToFloat())&& ([(SBSwitcherChamoisLayoutAttributes *)v5 switcherHorizontalInterItemSpacing], BSFloatEqualToFloat())&& ([(SBSwitcherChamoisLayoutAttributes *)v5 switcherVerticalEdgeSpacing], BSFloatEqualToFloat())&& ([(SBSwitcherChamoisLayoutAttributes *)v5 switcherVerticalInterItemSpacing], BSFloatEqualToFloat())&& ([(SBSwitcherChamoisLayoutAttributes *)v5 switcherHeightForIconAndLabelsUnderEachPile], BSFloatEqualToFloat())
                                                                && ([(SBSwitcherChamoisLayoutAttributes *)v5 switcherPileCardMinimumPeekAmount], BSFloatEqualToFloat()))
                                                              {
                                                                [(SBSwitcherChamoisLayoutAttributes *)v5 switcherPileCompactingFactor];
                                                                char v24 = BSFloatEqualToFloat();
                                                              }
                                                              else
                                                              {
                                                                char v24 = 0;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              char v24 = 0;
                                                            }

                                                            BOOL v12 = v24;
                                                            goto LABEL_46;
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      BOOL v12 = 0;
LABEL_46:

      goto LABEL_47;
    }
    BOOL v12 = 0;
  }
LABEL_47:

  return v12;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_defaultWindowSize.width + self->_defaultWindowSize.height * 13.0);
}

- (NSString)description
{
  return (NSString *)[(SBSwitcherChamoisLayoutAttributes *)self descriptionWithMultilinePrefix:&stru_1F3084718];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSwitcherChamoisLayoutAttributes *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(SBSwitcherChamoisLayoutAttributes *)self defaultWindowSize];
  id v5 = (id)objc_msgSend(v4, "appendSize:withName:", @"defaultWindowSize");
  [(SBSwitcherChamoisLayoutAttributes *)self minimumDefaultWindowSize];
  id v6 = (id)objc_msgSend(v4, "appendSize:withName:", @"minimumDefaultWindowSize");
  CGFloat v7 = [(SBSwitcherChamoisLayoutAttributes *)self gridWidths];
  id v8 = (id)[v4 appendObject:v7 withName:@"gridWidths"];

  CGFloat v9 = [(SBSwitcherChamoisLayoutAttributes *)self gridHeights];
  id v10 = (id)[v4 appendObject:v9 withName:@"gridHeights"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBSwitcherChamoisLayoutAttributes *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setContainerBounds:", self->_containerBounds.origin.x, self->_containerBounds.origin.y, self->_containerBounds.size.width, self->_containerBounds.size.height);
  [v4 setRequiresFullScreen:self->_requiresFullScreen];
  objc_msgSend(v4, "setDefaultWindowSize:", self->_defaultWindowSize.width, self->_defaultWindowSize.height);
  objc_msgSend(v4, "setMinimumDefaultWindowSize:", self->_minimumDefaultWindowSize.width, self->_minimumDefaultWindowSize.height);
  [v4 setMaximumWindowHeightWithDock:self->_maximumWindowHeightWithDock];
  [v4 setMaximumWindowWidthForOverlapping:self->_maximumWindowWidthForOverlapping];
  [v4 setMinimumWindowWidth:self->_minimumWindowWidth];
  [v4 setContainerPerspective:self->_containerPerspective];
  [v4 setScreenEdgePadding:self->_screenEdgePadding];
  [v4 setStripWidth:self->_stripWidth];
  [v4 setStripVerticalEdgeSpacing:self->_stripVerticalEdgeSpacing];
  [v4 setStripInterItemSpacing:self->_stripInterItemSpacing];
  [v4 setStripTiltAngle:self->_stripTiltAngle];
  [v4 setStripIconLength:self->_stripIconLength];
  [v4 setStripStackDistance:self->_stripStackDistance];
  [v4 setStripCardScale:self->_stripCardScale];
  [v4 setStripCornerRadii:self->_stripCornerRadii];
  [v4 setStageCornerRadii:self->_stageCornerRadii];
  [v4 setStageInterItemSpacing:self->_stageInterItemSpacing];
  [v4 setStageOccludedAppScale:self->_stageOccludedAppScale];
  [v4 setStageStatusBarClearingAppScale:self->_stageStatusBarClearingAppScale];
  [v4 setStageOcclusionDodgingPeekLength:self->_stageOcclusionDodgingPeekLength];
  [v4 setStageOcclusionDodgingPeekScale:self->_stageOcclusionDodgingPeekScale];
  [v4 setNumberOfRowsWhileInApp:self->_numberOfRowsWhileInApp];
  [v4 setIsAutoLayoutEnabled:self->_isAutoLayoutEnabled];
  [v4 setIsAdditiveModelEnabled:self->_isAdditiveModelEnabled];
  [v4 setPrefersStripHidden:self->_prefersStripHidden];
  [v4 setPrefersDockHidden:self->_prefersDockHidden];
  [v4 setUsesStripAreaForOverlapping:self->_usesStripAreaForOverlapping];
  [v4 setGridWidths:self->_gridWidths];
  [v4 setGridHeights:self->_gridHeights];
  [v4 setSwitcherHorizontalEdgeSpacing:self->_switcherHorizontalEdgeSpacing];
  [v4 setSwitcherHorizontalInterItemSpacing:self->_switcherHorizontalInterItemSpacing];
  [v4 setSwitcherVerticalEdgeSpacing:self->_switcherVerticalEdgeSpacing];
  [v4 setSwitcherVerticalInterItemSpacing:self->_switcherVerticalInterItemSpacing];
  [v4 setSwitcherHeightForIconAndLabelsUnderEachPile:self->_switcherHeightForIconAndLabelsUnderEachPile];
  [v4 setSwitcherPileCardMinimumPeekAmount:self->_switcherPileCardMinimumPeekAmount];
  [v4 setSwitcherPileCompactingFactor:self->_switcherPileCompactingFactor];
  return v4;
}

- (BOOL)requiresFullScreen
{
  return self->_requiresFullScreen;
}

- (void)setRequiresFullScreen:(BOOL)a3
{
  self->_BOOL requiresFullScreen = a3;
}

- (CGSize)defaultWindowSize
{
  double width = self->_defaultWindowSize.width;
  double height = self->_defaultWindowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDefaultWindowSize:(CGSize)a3
{
  self->_defaultWindowSize = a3;
}

- (CGSize)minimumDefaultWindowSize
{
  double width = self->_minimumDefaultWindowSize.width;
  double height = self->_minimumDefaultWindowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumDefaultWindowSize:(CGSize)a3
{
  self->_minimumDefaultWindowSize = a3;
}

- (double)maximumWindowHeightWithDock
{
  return self->_maximumWindowHeightWithDock;
}

- (void)setMaximumWindowHeightWithDock:(double)a3
{
  self->_maximumWindowHeightWithDock = a3;
}

- (double)maximumWindowWidthForOverlapping
{
  return self->_maximumWindowWidthForOverlapping;
}

- (void)setMaximumWindowWidthForOverlapping:(double)a3
{
  self->_maximumWindowWidthForOverlapping = a3;
}

- (double)minimumWindowWidth
{
  return self->_minimumWindowWidth;
}

- (void)setMinimumWindowWidth:(double)a3
{
  self->_minimumWindowWidth = a3;
}

- (double)containerPerspective
{
  return self->_containerPerspective;
}

- (void)setContainerPerspective:(double)a3
{
  self->_containerPerspective = a3;
}

- (double)screenEdgePadding
{
  return self->_screenEdgePadding;
}

- (void)setScreenEdgePadding:(double)a3
{
  self->_screenEdgePadding = a3;
}

- (SBSwitcherChamoisSnapPaddingSettings)snapPaddingSettings
{
  return self->_snapPaddingSettings;
}

- (void)setSnapPaddingSettings:(id)a3
{
  self->_snapPaddingSettings = (SBSwitcherChamoisSnapPaddingSettings *)a3;
}

- (double)stripWidth
{
  return self->_stripWidth;
}

- (void)setStripWidth:(double)a3
{
  self->_stripWidth = a3;
}

- (double)stripVerticalEdgeSpacing
{
  return self->_stripVerticalEdgeSpacing;
}

- (void)setStripVerticalEdgeSpacing:(double)a3
{
  self->_stripVerticalEdgeSpacing = a3;
}

- (double)stripInterItemSpacing
{
  return self->_stripInterItemSpacing;
}

- (void)setStripInterItemSpacing:(double)a3
{
  self->_stripInterItemSpacing = a3;
}

- (double)stripTiltAngle
{
  return self->_stripTiltAngle;
}

- (void)setStripTiltAngle:(double)a3
{
  self->_stripTiltAngle = a3;
}

- (double)stripIconLength
{
  return self->_stripIconLength;
}

- (void)setStripIconLength:(double)a3
{
  self->_stripIconLength = a3;
}

- (double)stripStackDistance
{
  return self->_stripStackDistance;
}

- (void)setStripStackDistance:(double)a3
{
  self->_stripStackDistance = a3;
}

- (double)stripCardScale
{
  return self->_stripCardScale;
}

- (void)setStripCardScale:(double)a3
{
  self->_stripCardScale = a3;
}

- (double)stripCornerRadii
{
  return self->_stripCornerRadii;
}

- (void)setStripCornerRadii:(double)a3
{
  self->_stripCornerRadii = a3;
}

- (double)stageCornerRadii
{
  return self->_stageCornerRadii;
}

- (void)setStageCornerRadii:(double)a3
{
  self->_stageCornerRadii = a3;
}

- (void)setStageInterItemSpacing:(double)a3
{
  self->_stageInterItemSpacing = a3;
}

- (double)stageOccludedAppScale
{
  return self->_stageOccludedAppScale;
}

- (void)setStageOccludedAppScale:(double)a3
{
  self->_stageOccludedAppScale = a3;
}

- (double)stageStatusBarClearingAppScale
{
  return self->_stageStatusBarClearingAppScale;
}

- (void)setStageStatusBarClearingAppScale:(double)a3
{
  self->_stageStatusBarClearingAppScale = a3;
}

- (double)stageOcclusionDodgingPeekLength
{
  return self->_stageOcclusionDodgingPeekLength;
}

- (void)setStageOcclusionDodgingPeekLength:(double)a3
{
  self->_stageOcclusionDodgingPeekLength = a3;
}

- (double)stageOcclusionDodgingPeekScale
{
  return self->_stageOcclusionDodgingPeekScale;
}

- (void)setStageOcclusionDodgingPeekScale:(double)a3
{
  self->_stageOcclusionDodgingPeekScale = a3;
}

- (unint64_t)numberOfRowsWhileInApp
{
  return self->_numberOfRowsWhileInApp;
}

- (void)setNumberOfRowsWhileInApp:(unint64_t)a3
{
  self->_unint64_t numberOfRowsWhileInApp = a3;
}

- (BOOL)isAutoLayoutEnabled
{
  return self->_isAutoLayoutEnabled;
}

- (void)setIsAutoLayoutEnabled:(BOOL)a3
{
  self->_BOOL isAutoLayoutEnabled = a3;
}

- (BOOL)isAdditiveModelEnabled
{
  return self->_isAdditiveModelEnabled;
}

- (void)setIsAdditiveModelEnabled:(BOOL)a3
{
  self->_BOOL isAdditiveModelEnabled = a3;
}

- (BOOL)prefersStripHidden
{
  return self->_prefersStripHidden;
}

- (void)setPrefersStripHidden:(BOOL)a3
{
  self->_BOOL prefersStripHidden = a3;
}

- (BOOL)prefersDockHidden
{
  return self->_prefersDockHidden;
}

- (void)setPrefersDockHidden:(BOOL)a3
{
  self->_BOOL prefersDockHidden = a3;
}

- (BOOL)usesStripAreaForOverlapping
{
  return self->_usesStripAreaForOverlapping;
}

- (void)setUsesStripAreaForOverlapping:(BOOL)a3
{
  self->_BOOL usesStripAreaForOverlapping = a3;
}

- (NSArray)gridWidths
{
  return self->_gridWidths;
}

- (void)setGridWidths:(id)a3
{
}

- (NSArray)gridHeights
{
  return self->_gridHeights;
}

- (void)setGridHeights:(id)a3
{
}

- (double)switcherHorizontalEdgeSpacing
{
  return self->_switcherHorizontalEdgeSpacing;
}

- (void)setSwitcherHorizontalEdgeSpacing:(double)a3
{
  self->_switcherHorizontalEdgeSpacing = a3;
}

- (double)switcherHorizontalInterItemSpacing
{
  return self->_switcherHorizontalInterItemSpacing;
}

- (void)setSwitcherHorizontalInterItemSpacing:(double)a3
{
  self->_switcherHorizontalInterItemSpacing = a3;
}

- (double)switcherVerticalEdgeSpacing
{
  return self->_switcherVerticalEdgeSpacing;
}

- (void)setSwitcherVerticalEdgeSpacing:(double)a3
{
  self->_switcherVerticalEdgeSpacing = a3;
}

- (double)switcherVerticalInterItemSpacing
{
  return self->_switcherVerticalInterItemSpacing;
}

- (void)setSwitcherVerticalInterItemSpacing:(double)a3
{
  self->_switcherVerticalInterItemSpacing = a3;
}

- (double)switcherHeightForIconAndLabelsUnderEachPile
{
  return self->_switcherHeightForIconAndLabelsUnderEachPile;
}

- (void)setSwitcherHeightForIconAndLabelsUnderEachPile:(double)a3
{
  self->_switcherHeightForIconAndLabelsUnderEachPile = a3;
}

- (double)switcherPileCardMinimumPeekAmount
{
  return self->_switcherPileCardMinimumPeekAmount;
}

- (void)setSwitcherPileCardMinimumPeekAmount:(double)a3
{
  self->_switcherPileCardMinimumPeekAmount = a3;
}

- (double)switcherPileCompactingFactor
{
  return self->_switcherPileCompactingFactor;
}

- (void)setSwitcherPileCompactingFactor:(double)a3
{
  self->_switcherPileCompactingFactor = a3;
}

- (CGRect)containerBounds
{
  double x = self->_containerBounds.origin.x;
  double y = self->_containerBounds.origin.y;
  double width = self->_containerBounds.size.width;
  double height = self->_containerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (SBSwitcherChamoisSettings)settings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settings);
  return (SBSwitcherChamoisSettings *)WeakRetained;
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settings);
  objc_storeStrong((id *)&self->_gridHeights, 0);
  objc_storeStrong((id *)&self->_gridWidths, 0);
}

@end