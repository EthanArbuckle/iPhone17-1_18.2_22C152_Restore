@interface SBSystemApertureProvidedContentElement
- (BOOL)_canShowWhileLocked;
- (BOOL)isExpanding;
- (BOOL)isPreviewing;
- (BOOL)isProminent;
- (BOOL)isUrgent;
- (BOOL)shouldSuppressElementWhileOnCoversheet;
- (CGSize)_sizeForEdgeView:(id)a3 thatFits:(CGSize)a4 layoutMode:(int64_t)a5;
- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (NSString)clientIdentifier;
- (NSString)elementIdentifier;
- (SAElementHosting)elementHost;
- (SAUILayoutHosting)layoutHost;
- (SBSystemAperturePlatformElementHosting)platformElementHost;
- (SBSystemApertureProvidedContentElement)initWithIdentifier:(id)a3 contentProvider:(id)a4;
- (UIView)leadingView;
- (UIView)minimalView;
- (UIView)trailingView;
- (double)_edgeSpacingWithConcentricPositioningIfNecessaryForView:(id)a3 withFrame:(CGRect)a4 inContainerView:(id)a5;
- (id)_actionView;
- (id)_primaryView;
- (id)_secondaryView;
- (id)elementDescription;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)preferredLayoutMode;
- (int64_t)systemApertureLayoutCustomizingOptions;
- (void)addElementLayoutSpecifierObserver:(id)a3;
- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5;
- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3;
- (void)pop;
- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3;
- (void)removeElementLayoutSpecifierObserver:(id)a3;
- (void)setElementHost:(id)a3;
- (void)setExpanding:(BOOL)a3;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setMaximumSupportedLayoutMode:(int64_t)a3;
- (void)setMinimumSupportedLayoutMode:(int64_t)a3;
- (void)setPlatformElementHost:(id)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)setPreviewing:(BOOL)a3;
- (void)setProminent:(BOOL)a3;
- (void)setUrgent:(BOOL)a3;
@end

@implementation SBSystemApertureProvidedContentElement

- (SBSystemApertureProvidedContentElement)initWithIdentifier:(id)a3 contentProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBSystemApertureProvidedContentElement.m", 45, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBSystemApertureProvidedContentElement.m", 46, @"Invalid parameter not satisfying: %@", @"contentProvider" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)SBSystemApertureProvidedContentElement;
  v10 = [(SBSystemApertureProvidedContentElement *)&v22 init];
  if (v10)
  {
    v11 = [v7 elementIdentifier];
    uint64_t v12 = [v11 copy];
    v13 = (void *)*((void *)v10 + 8);
    *((void *)v10 + 8) = v12;

    v14 = [v7 clientIdentifier];
    uint64_t v15 = [v14 copy];
    v16 = (void *)*((void *)v10 + 9);
    *((void *)v10 + 9) = v15;

    objc_storeStrong((id *)v10 + 1, a4);
    *(int64x2_t *)(v10 + 120) = vdupq_n_s64(3uLL);
    *((void *)v10 + 17) = 3;
    uint64_t v17 = -[SBSystemActionElementPreviewingCoordinator initWithElement:]([SBSystemActionElementPreviewingCoordinator alloc], v10);
    v18 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v17;
  }
  return (SBSystemApertureProvidedContentElement *)v10;
}

- (id)elementDescription
{
  v7[1] = *MEMORY[0x1E4F143B8];
  contentProvider = self->_contentProvider;
  v6 = @"contentProvider";
  v7[0] = contentProvider;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = SAElementIdentityDescription();

  return v4;
}

- (UIView)leadingView
{
  leadingView = self->_leadingView;
  if (!leadingView)
  {
    v4 = [(SBUISystemApertureContentProviding *)self->_contentProvider leadingContentViewProvider];
    [v4 setContentContainer:self];
    v5 = [v4 providedView];
    v6 = self->_leadingView;
    self->_leadingView = v5;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    v4 = [(SBUISystemApertureContentProviding *)self->_contentProvider trailingContentViewProvider];
    [v4 setContentContainer:self];
    v5 = [v4 providedView];
    v6 = self->_trailingView;
    self->_trailingView = v5;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (UIView)minimalView
{
  minimalView = self->_minimalView;
  if (!minimalView)
  {
    v4 = [(SBUISystemApertureContentProviding *)self->_contentProvider minimalContentViewProvider];
    [v4 setContentContainer:self];
    v5 = [v4 providedView];
    v6 = self->_minimalView;
    self->_minimalView = v5;

    minimalView = self->_minimalView;
  }
  return minimalView;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t layoutMode = self->_layoutMode;
  if (layoutMode != a3)
  {
    self->_int64_t layoutMode = a3;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 elementLayoutSpecifier:self layoutModeDidChange:layoutMode reason:a4];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = (UIView *)a4;
  uint64_t v10 = v9;
  if (v9 && (self->_leadingView == v9 || self->_trailingView == v9 || self->_minimalView == v9))
  {
    -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", v9, a5, width, height);
    double v11 = v13;
    double v12 = v14;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB30];
    double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v15 = v11;
  double v16 = v12;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double bottom = result.bottom;
  if (a3 == 3)
  {
    CGFloat trailing = a5.trailing;
    CGFloat leading = a5.leading;
    CGFloat top = result.top;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", result.top, result.leading, result.bottom, result.trailing, a5.top, a5.leading, a5.bottom);
    [v9 _referenceBounds];
    double v11 = v10 + -20.0;

    SBUISystemApertureHorizontalItemSpacing();
    double v13 = v11 + v12 * -2.0;
    -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", self->_leadingView, 3, v13, 1.79769313e308);
    double v15 = v14;
    double v17 = v16;
    -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", self->_trailingView, 3, v13, 1.79769313e308);
    double v20 = v19;
    double v21 = -(v15 + 26.0);
    if (!self->_leadingView) {
      double v21 = -13.0;
    }
    double v22 = v13 + v21;
    double v23 = -(v18 + 26.0);
    if (!self->_trailingView) {
      double v23 = -13.0;
    }
    double v24 = v22 + v23;
    v25 = [(SBSystemApertureProvidedContentElement *)self _primaryView];
    objc_msgSend(v25, "systemLayoutSizeFittingSize:", v24, 1.79769313e308);
    double v45 = v26;

    v27 = [(SBSystemApertureProvidedContentElement *)self _secondaryView];
    objc_msgSend(v27, "systemLayoutSizeFittingSize:", v24, 1.79769313e308);
    double v29 = v28;

    v30 = [(SBSystemApertureProvidedContentElement *)self _actionView];
    objc_msgSend(v30, "systemLayoutSizeFittingSize:", v24, 1.79769313e308);
    double v32 = v31;
    double v34 = v33;

    if (v17 < v20) {
      double v17 = v20;
    }
    if (v17 > 0.0)
    {
      SBUISystemApertureInterItemSpacing();
      double v36 = v17 + v35 * 2.0;
      if (v36 > 50.0) {
        double v36 = 50.0;
      }
      if (v17 < v36) {
        double v17 = v36;
      }
    }
    double v37 = v17 + -36.6666667;
    if (v17 + -36.6666667 < 0.0) {
      double v37 = 0.0;
    }
    if (v37 < v45 + v29) {
      double v37 = v45 + v29;
    }
    double v38 = v34 + v37;
    if (v37 > 0.0)
    {
      SBUISystemApertureVerticalItemSpacing();
      double v38 = v38 + v39;
    }
    if (v32 != *MEMORY[0x1E4F1DB30] || v34 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      SBUISystemApertureControlEdgeSpacing();
      double v38 = v38 + v41;
    }
    if (bottom - v38 <= bottom + -50.0) {
      double bottom = bottom - v38;
    }
    else {
      double bottom = bottom + -50.0;
    }
    result.CGFloat top = top;
  }
  else
  {
    CGFloat leading = result.leading;
    CGFloat trailing = result.trailing;
  }
  double v42 = leading;
  double v43 = bottom;
  double v44 = trailing;
  result.CGFloat trailing = v44;
  result.double bottom = v43;
  result.CGFloat leading = v42;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  id v4 = a3;
  if ([(SBSystemApertureProvidedContentElement *)self layoutMode] == 3)
  {
    uint64_t v5 = [v4 effectiveUserInterfaceLayoutDirection];
    v6 = [v4 traitCollection];
    [v6 displayScale];
    uint64_t v8 = v7;

    [v4 bounds];
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    -[UIView systemLayoutSizeFittingSize:](self->_actionView, "systemLayoutSizeFittingSize:", v13, v15);
    double v214 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v215 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v197 = *MEMORY[0x1E4F1DB30];
    double v199 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    BOOL v19 = v18 == *MEMORY[0x1E4F1DB30] && v17 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v209 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v212 = *MEMORY[0x1E4F1DB28];
    uint64_t v196 = v8;
    if (v19)
    {
      double v194 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v195 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v188 = *MEMORY[0x1E4F1DB28];
      CGFloat v189 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    }
    else
    {
      SBUISystemApertureControlEdgeSpacing();
      BSRectWithSize();
      CGFloat v21 = v20;
      CGFloat recta = v22;
      CGFloat v205 = v14;
      CGFloat v23 = v14;
      CGFloat v24 = v12;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      v219.origin.CGFloat x = v10;
      v219.origin.CGFloat y = v24;
      v219.size.double width = v23;
      v219.size.double height = v16;
      CGRectGetMaxY(v219);
      v220.origin.CGFloat x = v21;
      v220.origin.CGFloat y = recta;
      v220.size.double width = v26;
      v220.size.double height = v28;
      CGRectGetHeight(v220);
      uint64_t v187 = v8;
      UIRectCenteredXInRectScale();
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      v221.origin.CGFloat x = v10;
      v221.origin.CGFloat y = v24;
      v221.size.double width = v205;
      v221.size.double height = v16;
      CGRectGetMaxY(v221);
      CGFloat v188 = v30;
      CGFloat v189 = v32;
      v222.origin.CGFloat x = v30;
      v222.origin.CGFloat y = v32;
      double v194 = v36;
      double v195 = v34;
      v222.size.double width = v34;
      v222.size.double height = v36;
      CGRectGetMinY(v222);
      UIRectInsetEdges();
      double v14 = v37;
      double v16 = v38;
    }
    uint64_t v39 = 88;
    if (v5 == 1) {
      uint64_t v39 = 96;
    }
    id v40 = *(id *)((char *)&self->super.isa + v39);
    if (v40)
    {
      -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", v40, 3, v14, v16);
      BSRectWithSize();
      -[SBSystemApertureProvidedContentElement _edgeSpacingWithConcentricPositioningIfNecessaryForView:withFrame:inContainerView:](self, "_edgeSpacingWithConcentricPositioningIfNecessaryForView:withFrame:inContainerView:", v40, v4);
      uint64_t v187 = v196;
      UIRectCenteredYInRectScale();
      double height = v223.size.height;
      double width = v223.size.width;
      CGRectGetMaxX(v223);
      UIRectInsetEdges();
      CGFloat v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      double v49 = v209;
    }
    else
    {
      UIRectInsetEdges();
      CGFloat v42 = v50;
      double v44 = v51;
      double v46 = v52;
      double v48 = v53;
      double v49 = v209;
      double height = v215;
      double width = v209;
    }
    if (v5 == 1) {
      p_leadingView = &self->_leadingView;
    }
    else {
      p_leadingView = &self->_trailingView;
    }
    v55 = *p_leadingView;
    if (v55)
    {
      -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", v55, 3, v46, v48);
      BSRectWithSize();
      CGFloat v56 = v44;
      CGFloat v207 = v44;
      CGFloat v58 = v57;
      CGFloat v60 = v59;
      CGFloat v62 = v61;
      CGFloat v64 = v63;
      -[SBSystemApertureProvidedContentElement _edgeSpacingWithConcentricPositioningIfNecessaryForView:withFrame:inContainerView:](self, "_edgeSpacingWithConcentricPositioningIfNecessaryForView:withFrame:inContainerView:", v55, v4);
      v224.size.double height = v48;
      v224.origin.CGFloat x = v42;
      v224.origin.CGFloat y = v56;
      v224.size.double width = v46;
      CGRectGetMaxX(v224);
      v225.origin.CGFloat x = v58;
      v225.origin.CGFloat y = v60;
      v225.size.double width = v62;
      v225.size.double height = v64;
      CGRectGetWidth(v225);
      uint64_t v187 = v196;
      UIRectCenteredYInRectScale();
      CGFloat v66 = v65;
      CGFloat v68 = v67;
      CGFloat v70 = v69;
      CGFloat v72 = v71;
      v226.origin.CGFloat x = v42;
      v226.origin.CGFloat y = v207;
      v226.size.double width = v46;
      v226.size.double height = v48;
      CGRectGetMaxX(v226);
      v227.origin.CGFloat x = v66;
      v227.origin.CGFloat y = v68;
      double v190 = v70;
      double v191 = v72;
      v227.size.double width = v70;
      v227.size.double height = v72;
      CGRectGetMinX(v227);
      UIRectInsetEdges();
    }
    else
    {
      UIRectInsetEdges();
      double v190 = v49;
      double v191 = v215;
    }
    if (v195 == v197 && v194 == v199)
    {
      BOOL v73 = 1;
    }
    else
    {
      BOOL v73 = 0;
      if (width == v197 && height == v199) {
        BOOL v73 = v191 == v199 && v190 == v197;
      }
    }
    SBUISystemApertureHorizontalItemSpacing();
    UIRectInsetEdges();
    SBUISystemApertureVerticalItemSpacing();
    UIRectInsetEdges();
    CGFloat v77 = v76;
    CGFloat v79 = v78;
    CGFloat v80 = v75;
    if (v74 >= 0.0) {
      double v81 = v74;
    }
    else {
      double v81 = 0.0;
    }
    -[UIView systemLayoutSizeFittingSize:](self->_secondaryView, "systemLayoutSizeFittingSize:", v81, v75, v187);
    if (v83 == v197 && v82 == v199)
    {
      double v89 = v81;
      double v90 = v80;
      CGFloat v91 = v212;
      CGFloat v88 = v215;
      double v206 = v214;
      double v208 = v209;
      CGFloat rect = v212;
    }
    else
    {
      double v85 = v82;
      v228.origin.CGFloat x = v77;
      v228.origin.CGFloat y = v79;
      v228.size.double width = v81;
      v228.size.double height = v80;
      double v86 = CGRectGetHeight(v228);
      CGFloat v87 = v81;
      if (v85 <= v86) {
        CGFloat v88 = v85;
      }
      else {
        CGFloat v88 = v86;
      }
      if (v73)
      {
        double v89 = v87;
        double v206 = v79;
        double v208 = v87;
        double v90 = v80;
        CGFloat rect = v77;
      }
      else
      {
        v229.origin.CGFloat x = v77;
        v229.origin.CGFloat y = v79;
        v229.size.double width = v87;
        v229.size.double height = v80;
        double MaxY = CGRectGetMaxY(v229);
        v230.origin.CGFloat x = v77;
        v230.origin.CGFloat y = v79;
        v230.size.double width = v87;
        v230.size.double height = v88;
        CGFloat v93 = v80;
        CGFloat v94 = MaxY - CGRectGetHeight(v230);
        v231.origin.CGFloat x = v77;
        v231.origin.CGFloat y = v79;
        v231.size.double width = v87;
        v231.size.double height = v93;
        CGRectGetMaxY(v231);
        v232.origin.CGFloat x = v77;
        double v206 = v94;
        v232.origin.CGFloat y = v94;
        v232.size.double width = v87;
        v232.size.double height = v88;
        CGRectGetMinY(v232);
        UIRectInsetEdges();
        double v95 = v77;
        CGFloat v77 = v96;
        CGFloat v79 = v97;
        double v89 = v98;
        double v208 = v87;
        double v90 = v99;
        CGFloat rect = v95;
      }
      CGFloat v91 = v212;
    }
    -[UIView systemLayoutSizeFittingSize:](self->_primaryView, "systemLayoutSizeFittingSize:", v89, v90);
    double v101 = v100;
    BOOL v103 = v102 == v197 && v100 == v199;
    double r2 = v88;
    if (v103)
    {
      CGFloat v106 = v209;
    }
    else
    {
      v233.origin.CGFloat x = v77;
      v233.origin.CGFloat y = v79;
      v233.size.double width = v89;
      v233.size.double height = v90;
      double v104 = CGRectGetHeight(v233);
      if (v101 <= v104) {
        CGFloat v105 = v101;
      }
      else {
        CGFloat v105 = v104;
      }
      CGFloat v215 = v105;
      if (v73)
      {
        CGFloat v91 = v77;
        double v214 = v79;
      }
      else
      {
        v234.origin.CGFloat x = v77;
        v234.origin.CGFloat y = v79;
        v234.size.double width = v89;
        v234.size.double height = v90;
        double v107 = CGRectGetMaxY(v234);
        v235.origin.CGFloat x = v77;
        v235.origin.CGFloat y = v79;
        v235.size.double width = v89;
        v235.size.double height = v105;
        CGFloat v108 = v107 - CGRectGetHeight(v235);
        v236.origin.CGFloat x = v77;
        v236.origin.CGFloat y = v79;
        v236.size.double width = v89;
        v236.size.double height = v90;
        CGRectGetMaxY(v236);
        v237.origin.CGFloat x = v77;
        double v214 = v108;
        v237.origin.CGFloat y = v108;
        v237.size.double width = v89;
        v237.size.double height = v105;
        CGRectGetMinY(v237);
        UIRectInsetEdges();
        CGFloat v91 = v77;
      }
      CGFloat v106 = v89;
      CGFloat v88 = r2;
    }
    CGFloat v213 = v91;
    v238.origin.CGFloat x = v91;
    v238.origin.CGFloat y = v214;
    v238.size.double height = v215;
    v238.size.double width = v106;
    double v109 = CGRectGetHeight(v238);
    v239.origin.CGFloat x = rect;
    v239.origin.CGFloat y = v206;
    v239.size.double width = v208;
    v239.size.double height = v88;
    double v110 = CGRectGetHeight(v239);
    double v111 = v106;
    if (v73 && (double v112 = v110, v113 = v109 + v110, (BSFloatIsZero() & 1) == 0))
    {
      v115 = [(UIView *)self->_primaryView traitCollection];
      [v115 displayScale];
      UIRectCenteredYInRectScale();
      double v210 = v117;
      CGFloat v213 = v116;
      double v216 = v118;
      double v120 = v119;

      double v114 = v120;
      double v111 = v210;
      UIRectCenteredYInRectScale();
      double r2 = v122;
      CGFloat rect = v121;
      double v208 = v123;
      double v124 = v113 * 0.5 - v109;
      double v214 = v216 - (v109 * 0.5 + v124);
      double v206 = v112 * 0.5 - v124 + v125;
    }
    else
    {
      double v114 = v215;
    }
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v128 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v129 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (v111 != v197 || v114 != v199)
    {
      v251.origin.CGFloat x = v213;
      v251.origin.CGFloat y = v214;
      v251.size.double width = v111;
      v251.size.double height = v114;
      CGRect v240 = CGRectUnion(*MEMORY[0x1E4F1DB20], v251);
      CGFloat x = v240.origin.x;
      CGFloat y = v240.origin.y;
      CGFloat v128 = v240.size.width;
      CGFloat v129 = v240.size.height;
    }
    double v131 = v208;
    CGFloat v217 = v114;
    CGFloat v211 = v111;
    if (v208 != v197 || r2 != v199)
    {
      v241.origin.CGFloat x = x;
      v241.origin.CGFloat y = y;
      v241.size.double width = v128;
      v241.size.double height = v129;
      CGFloat v132 = rect;
      double v133 = v206;
      double v134 = r2;
      CGRect v242 = CGRectUnion(v241, *(CGRect *)(&v131 - 2));
      CGFloat x = v242.origin.x;
      CGFloat y = v242.origin.y;
      CGFloat v128 = v242.size.width;
      CGFloat v129 = v242.size.height;
    }
    v243.origin.CGFloat x = x;
    v243.origin.CGFloat y = y;
    v243.size.double width = v128;
    v243.size.double height = v129;
    CGRectIsNull(v243);
    UIRectCenteredYInRectScale();
    double v200 = v135;
    double v137 = v136;
    double v139 = v138;
    double v141 = v140;
    UIRectCenteredYInRectScale();
    double v146 = v142;
    double v147 = v143;
    double v148 = v144;
    double v149 = v145;
    if (v5 != 1)
    {
      double v142 = v200;
      double v143 = v137;
      double v144 = v139;
      double v145 = v141;
    }
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_leadingView, "sb_setBoundsAndPositionFromFrame:", v142, v143, v144, v145, v196);
    if (v5 == 1) {
      double v150 = v200;
    }
    else {
      double v150 = v146;
    }
    if (v5 == 1) {
      double v151 = v137;
    }
    else {
      double v151 = v147;
    }
    if (v5 == 1) {
      double v152 = v139;
    }
    else {
      double v152 = v148;
    }
    if (v5 == 1) {
      double v153 = v141;
    }
    else {
      double v153 = v149;
    }
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_trailingView, "sb_setBoundsAndPositionFromFrame:", v150, v151, v152, v153);
    v154 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
    [v154 sensorRegionSize];
    double v156 = v155;
    CGFloat v158 = v157;

    [v4 bounds];
    double v159 = CGRectGetWidth(v244) - v156;
    if (v159 <= 0.0) {
      double v160 = 0.0;
    }
    else {
      double v160 = v159 * 0.5;
    }
    v252.origin.CGFloat y = 0.0;
    double v161 = v214;
    v245.origin.CGFloat x = v213;
    v245.origin.CGFloat y = v214;
    v245.size.double width = v211;
    v245.size.double height = v217;
    v252.origin.CGFloat x = v160;
    v252.size.double width = v156;
    v252.size.double height = v158;
    if (CGRectIntersectsRect(v245, v252))
    {
      [v4 bounds];
      CGFloat v201 = v160;
      double v162 = CGRectGetHeight(v246);
      v247.origin.CGFloat x = v213;
      v247.origin.CGFloat y = v214;
      v247.size.double width = v211;
      v247.size.double height = v217;
      double v163 = CGRectGetMaxY(v247);
      v248.origin.CGFloat x = rect;
      v248.origin.CGFloat y = v206;
      v248.size.double width = v208;
      CGFloat v198 = v158;
      double v164 = r2;
      v248.size.double height = r2;
      double v165 = CGRectGetMaxY(v248);
      if (v163 >= v165) {
        double v165 = v163;
      }
      v249.origin.CGFloat y = 0.0;
      double v166 = fmax(v162 - v165, 0.0);
      v249.size.double height = v198;
      v249.origin.CGFloat x = v201;
      v249.size.double width = v156;
      double v167 = CGRectGetMaxY(v249);
      v250.origin.CGFloat x = v213;
      v250.origin.CGFloat y = v214;
      v250.size.double width = v211;
      v250.size.double height = v217;
      CGFloat MinY = CGRectGetMinY(v250);
      double v169 = v208;
      double v170 = v167 - MinY;
      CGFloat v171 = rect;
      if (v166 < v170) {
        double v170 = v166;
      }
      double v161 = v214 + v170;
      double v172 = v206 + v170;
      CGFloat v174 = v188;
      CGFloat v173 = v189;
    }
    else
    {
      CGFloat v174 = v188;
      CGFloat v173 = v189;
      double v164 = r2;
      CGFloat v171 = rect;
      double v172 = v206;
      double v169 = v208;
    }
    v218[0] = MEMORY[0x1E4F143A8];
    v218[1] = 3221225472;
    v218[2] = __83__SBSystemApertureProvidedContentElement_layoutHostContainerViewDidLayoutSubviews___block_invoke;
    v218[3] = &unk_1E6AFA140;
    v218[4] = self;
    *(CGFloat *)&v218[5] = v174;
    *(CGFloat *)&v218[6] = v173;
    *(double *)&v218[7] = v195;
    *(double *)&v218[8] = v194;
    *(CGFloat *)&v218[9] = v213;
    *(double *)&v218[10] = v161;
    *(CGFloat *)&v218[11] = v211;
    *(CGFloat *)&v218[12] = v217;
    *(CGFloat *)&v218[13] = v171;
    *(double *)&v218[14] = v172;
    *(double *)&v218[15] = v169;
    *(double *)&v218[16] = v164;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v218];
  }
  v175 = [(SBSystemApertureProvidedContentElement *)self _primaryView];
  v176 = v175;
  if (self->_layoutMode >= 3) {
    double v177 = 1.0;
  }
  else {
    double v177 = 0.0;
  }
  [v175 setAlpha:v177];

  v178 = [(SBSystemApertureProvidedContentElement *)self _secondaryView];
  v179 = v178;
  if (self->_layoutMode >= 3) {
    double v180 = 1.0;
  }
  else {
    double v180 = 0.0;
  }
  [v178 setAlpha:v180];

  v181 = [(SBSystemApertureProvidedContentElement *)self _actionView];
  v182 = v181;
  if (self->_layoutMode >= 3) {
    double v183 = 1.0;
  }
  else {
    double v183 = 0.0;
  }
  [v181 setAlpha:v183];

  v184 = [(SBSystemApertureProvidedContentElement *)self minimalView];
  v185 = v184;
  if (self->_layoutMode == 1) {
    double v186 = 1.0;
  }
  else {
    double v186 = 0.0;
  }
  [v184 setAlpha:v186];
}

uint64_t __83__SBSystemApertureProvidedContentElement_layoutHostContainerViewDidLayoutSubviews___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "sb_setBoundsAndPositionFromFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "sb_setBoundsAndPositionFromFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  double v3 = *(double *)(a1 + 104);
  double v4 = *(double *)(a1 + 112);
  double v5 = *(double *)(a1 + 120);
  double v6 = *(double *)(a1 + 128);
  return objc_msgSend(v2, "sb_setBoundsAndPositionFromFrame:", v3, v4, v5, v6);
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (self->_layoutMode == 3)
  {
    double v9 = [(SBSystemApertureProvidedContentElement *)self _primaryView];
    [v7 addSubview:v9];

    CGFloat v10 = [(SBSystemApertureProvidedContentElement *)self _secondaryView];
    [v7 addSubview:v10];

    double v11 = [(SBSystemApertureProvidedContentElement *)self _actionView];
    [v7 addSubview:v11];
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __116__SBSystemApertureProvidedContentElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v13[3] = &unk_1E6B087B8;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v14 = v12;
  [v8 animateAlongsideTransition:v13 completion:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __116__SBSystemApertureProvidedContentElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained layoutHostContainerViewDidLayoutSubviews:*(void *)(a1 + 32)];
}

- (void)addElementLayoutSpecifierObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      double v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeElementLayoutSpecifierObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (void)setPreviewing:(BOOL)a3
{
  if (self->_previewing != a3)
  {
    self->_previewing = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setUrgent:(BOOL)a3
{
  if (self->_urgent != a3)
  {
    self->_urgent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setProminent:(BOOL)a3
{
  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (void)pop
{
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  return [(SBSystemApertureProvidedContentElement *)self isProminent];
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
}

- (id)_primaryView
{
  primaryView = self->_primaryView;
  if (!primaryView)
  {
    id v4 = [(SBUISystemApertureContentProviding *)self->_contentProvider primaryContentViewProvider];
    [v4 setContentContainer:self];
    double v5 = [v4 providedView];
    double v6 = self->_primaryView;
    self->_primaryView = v5;

    primaryView = self->_primaryView;
  }
  return primaryView;
}

- (id)_secondaryView
{
  secondaryView = self->_secondaryView;
  if (!secondaryView)
  {
    id v4 = [(SBUISystemApertureContentProviding *)self->_contentProvider secondaryContentViewProvider];
    [v4 setContentContainer:self];
    double v5 = [v4 providedView];
    double v6 = self->_secondaryView;
    self->_secondaryView = v5;

    secondaryView = self->_secondaryView;
  }
  return secondaryView;
}

- (id)_actionView
{
  actionView = self->_actionView;
  if (!actionView)
  {
    id v4 = [(SBUISystemApertureContentProviding *)self->_contentProvider actionContentViewProvider];
    [v4 setContentContainer:self];
    double v5 = [v4 providedView];
    double v6 = self->_actionView;
    self->_actionView = v5;

    actionView = self->_actionView;
  }
  return actionView;
}

- (double)_edgeSpacingWithConcentricPositioningIfNecessaryForView:(id)a3 withFrame:(CGRect)a4 inContainerView:(id)a5
{
  double height = a4.size.height;
  id v8 = (UIView *)a3;
  id v9 = a5;
  if (self->_leadingView == v8 || (double v10 = 26.0, self->_trailingView == v8))
  {
    double v10 = 26.0;
    if (!self->_actionView && !self->_secondaryView && BSFloatApproximatelyEqualToFloat())
    {
      [v9 frame];
      double v10 = (v11 - height) * 0.5;
    }
  }

  return v10;
}

- (CGSize)_sizeForEdgeView:(id)a3 thatFits:(CGSize)a4 layoutMode:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  if (!v10)
  {
    double v17 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_17;
  }
  uint64_t v11 = [(SBSystemApertureProvidedContentElement *)self leadingView];
  id v12 = v10;
  if ((id)v11 == v10) {
    goto LABEL_8;
  }
  double v13 = (void *)v11;
  uint64_t v14 = [(SBSystemApertureProvidedContentElement *)self trailingView];
  if ((id)v14 == v10)
  {

    id v12 = v13;
    goto LABEL_8;
  }
  id v15 = (void *)v14;
  id v16 = [(SBSystemApertureProvidedContentElement *)self minimalView];

  if (v16 != v10)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBSystemApertureProvidedContentElement.m" lineNumber:488 description:@"Why are we trying to determine the edge-view size of a non-edge view?"];
LABEL_8:
  }
  objc_msgSend(v10, "systemLayoutSizeFittingSize:", width, height);
  double v17 = v19;
  double v18 = v20;
  if (a5 == 3) {
    double v21 = 37.0;
  }
  else {
    double v21 = 0.0;
  }
  if (BSSizeLessThanSize() && BSSizeLessThanSize())
  {
    double v18 = v21;
    double v17 = v21;
  }
  id v22 = [(SBSystemApertureProvidedContentElement *)self minimalView];

  if (v22 == v10)
  {
    BSSizeSwap();
    double v17 = v23;
    double v18 = v24;
  }
LABEL_17:

  double v25 = v17;
  double v26 = v18;
  result.double height = v26;
  result.double width = v25;
  return result;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (SAElementHosting)elementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementHost);
  return (SAElementHosting *)WeakRetained;
}

- (void)setElementHost:(id)a3
{
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)minimumSupportedLayoutMode
{
  return self->_minimumSupportedLayoutMode;
}

- (void)setMinimumSupportedLayoutMode:(int64_t)a3
{
  self->_minimumSupportedLayoutMode = a3;
}

- (int64_t)maximumSupportedLayoutMode
{
  return self->_maximumSupportedLayoutMode;
}

- (void)setMaximumSupportedLayoutMode:(int64_t)a3
{
  self->_maximumSupportedLayoutMode = a3;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  self->_preferredLayoutMode = a3;
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (void)setLayoutHost:(id)a3
{
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformElementHost);
  return (SBSystemAperturePlatformElementHosting *)WeakRetained;
}

- (void)setPlatformElementHost:(id)a3
{
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformElementHost);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_elementHost);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previewingCoordinator, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
}

@end