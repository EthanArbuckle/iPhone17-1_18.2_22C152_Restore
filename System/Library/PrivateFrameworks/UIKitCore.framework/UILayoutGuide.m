@interface UILayoutGuide
+ (double)_defaultSpacingBetweenGuidesForResolvingSymbolicConstant;
- (BOOL)_allowOwningViewSetting;
- (BOOL)_allowsNegativeDimensions;
- (BOOL)_isLockedToOwningView;
- (BOOL)_isSafeAreaAspectFitLayoutGuide;
- (BOOL)_shouldBeArchived;
- (BOOL)_ui_usesManualLayout;
- (BOOL)_uili_isFocusGuide;
- (BOOL)_uili_requiresObservationForVariable:(id)a3;
- (BOOL)_useManualLayoutFrame;
- (BOOL)hasAmbiguousLayout;
- (BOOL)nsis_shouldIntegralizeVariable:(id)a3;
- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3;
- (BOOL)nsli_defaultResolvedValue:(double *)a3 forSymbolicConstant:(id)a4 inConstraint:(id)a5 error:(id *)a6;
- (BOOL)nsli_descriptionIncludesPointer;
- (BOOL)nsli_isCollectingConstraintChangesForLaterCoordinatedFlush:(id)a3;
- (BOOL)nsli_isFlipped;
- (BOOL)nsli_isLegalConstraintItem;
- (BOOL)nsli_isRTL;
- (BOOL)nsli_lowerAttribute:(int)a3 intoExpression:(id)a4 withCoefficient:(double)a5 container:(id)a6;
- (BOOL)nsli_lowerAttribute:(int)a3 intoExpression:(id)a4 withCoefficient:(double)a5 forConstraint:(id)a6;
- (BOOL)nsli_removeConstraint:(id)a3;
- (BOOL)nsli_resolvedValue:(double *)a3 forSymbolicConstant:(id)a4 inConstraint:(id)a5 error:(id *)a6;
- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4;
- (CGRect)frameInView:(id)a3;
- (CGRect)layoutFrame;
- (CGSize)nsli_convertSizeFromEngineSpace:(CGSize)a3;
- (CGSize)nsli_convertSizeToEngineSpace:(CGSize)a3;
- (CGSize)nsli_engineToUserScalingCoefficients;
- (NSArray)_systemConstraints;
- (NSArray)constraintsAffectingLayoutForAxis:(UILayoutConstraintAxis)axis;
- (NSISVariable)_boundsHeightVariable;
- (NSISVariable)_boundsWidthVariable;
- (NSISVariable)_minXVariable;
- (NSISVariable)_minYVariable;
- (NSLayoutDimension)heightAnchor;
- (NSLayoutDimension)widthAnchor;
- (NSLayoutXAxisAnchor)centerXAnchor;
- (NSLayoutXAxisAnchor)leadingAnchor;
- (NSLayoutXAxisAnchor)leftAnchor;
- (NSLayoutXAxisAnchor)rightAnchor;
- (NSLayoutXAxisAnchor)trailingAnchor;
- (NSLayoutYAxisAnchor)bottomAnchor;
- (NSLayoutYAxisAnchor)centerYAnchor;
- (NSLayoutYAxisAnchor)topAnchor;
- (NSMapTable)_stashedLayoutVariableObservations;
- (NSString)description;
- (NSString)identifier;
- (UILayoutGuide)init;
- (UILayoutGuide)initWithCoder:(id)a3;
- (UITraitCollection)traitCollection;
- (UIView)owningView;
- (double)nsli_marginOffsetForAttribute:(int64_t)a3;
- (id)_autolayoutTraceAtLevel:(int64_t)a3 recursively:(BOOL)a4;
- (id)_createAnchorWithClass:(Class)a3 attribute:(int64_t)a4;
- (id)_layoutRect;
- (id)_nearestViewController;
- (id)_uili_existingBaseFrameVariables;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)nsis_descriptionOfVariable:(id)a3;
- (id)nsli_boundsHeightVariable;
- (id)nsli_boundsWidthVariable;
- (id)nsli_constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 toAnchor:(id)a5 withSystemSpacingMultipliedBy:(double)a6;
- (id)nsli_contentHeightVariable;
- (id)nsli_contentWidthVariable;
- (id)nsli_description;
- (id)nsli_installedConstraints;
- (id)nsli_layoutEngine;
- (id)nsli_minXVariable;
- (id)nsli_minYVariable;
- (id)nsli_superitem;
- (int)nsis_orientationHintForVariable:(id)a3;
- (unint64_t)nsli_autoresizingMask;
- (void)_addConstraintToBeProcessedAfterDecoding:(id)a3;
- (void)_invalidateLayoutFrame;
- (void)_owningViewIsDeallocating;
- (void)_referenceView;
- (void)_setAllowOwningViewSetting:(BOOL)a3;
- (void)_setAllowsNegativeDimensions:(BOOL)a3;
- (void)_setLockedToOwningView:(BOOL)a3;
- (void)_setManualLayoutFrame:(CGRect)a3;
- (void)_setOwningView:(id)a3;
- (void)_setShouldBeArchived:(BOOL)a3;
- (void)_setSystemConstraints:(id)a3;
- (void)_snipReferencingConstraints;
- (void)_ui_addSubLayoutItem:(id)a3;
- (void)_ui_addToView:(id)a3 atIndex:(int64_t)a4;
- (void)_ui_insertSubLayoutItem:(id)a3 atIndex:(int64_t)a4;
- (void)_ui_removeFromParentLayoutItem;
- (void)_uili_removeLayoutVariableObservationsOnlyToSupportTAMICChange:(BOOL)a3;
- (void)_uili_stashLayoutVariableObservation:(id)a3 forVariable:(id)a4;
- (void)_updateLayoutFrameInOwningView:(id)a3 fromEngine:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)nsis_valueOfVariable:(id)a3 didChangeInEngine:(id)a4;
- (void)nsli_addConstraint:(id)a3;
- (void)setIdentifier:(NSString *)identifier;
- (void)setOwningView:(UIView *)owningView;
@end

@implementation UILayoutGuide

- (BOOL)_uili_isFocusGuide
{
  return 0;
}

- (id)nsli_minXVariable
{
  minXVariable = self->_minXVariable;
  if (!minXVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, 0, 1);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_minXVariable;
    self->_minXVariable = v4;

    minXVariable = self->_minXVariable;
  }
  return minXVariable;
}

- (void)_referenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);

  return WeakRetained;
}

- (id)nsli_superitem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  return WeakRetained;
}

- (BOOL)nsli_lowerAttribute:(int)a3 intoExpression:(id)a4 withCoefficient:(double)a5 forConstraint:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  v13 = [v11 container];
  if (!v13 || WeakRetained && ([WeakRetained isDescendantOfView:v13] & 1) != 0)
  {
    char v14 = objc_msgSend(WeakRetained, "nsli_lowerAttribute:intoExpression:withCoefficient:forConstraint:onBehalfOfLayoutGuide:", v8, v10, v11, self, a5);
  }
  else
  {
    v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &nsli_lowerAttribute_intoExpression_withCoefficient_forConstraint____s_category)+ 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = (void *)[v13 performSelector:sel_recursiveDescription];
      id v18 = v17;
      uint64_t v19 = [WeakRetained superview];
      v20 = (void *)v19;
      int v23 = 138413314;
      v21 = @"NO SUPERVIEW";
      v24 = self;
      if (v19) {
        v21 = (__CFString *)v19;
      }
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      v28 = v17;
      __int16 v29 = 2112;
      id v30 = WeakRetained;
      __int16 v31 = 2112;
      v32 = v21;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "UILayoutGuide's owningView hierarchy unprepared for constraint.\n\tself = %@\n\tConstraint: %@\n\tContainer hierarchy: \n%@\n\tView not found in container hierarchy: %@\n\tThat view's superview: %@", (uint8_t *)&v23, 0x34u);
    }
    char v14 = 0;
  }

  return v14;
}

- (id)nsli_minYVariable
{
  minYVariable = self->_minYVariable;
  if (!minYVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, 0, 1);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_minYVariable;
    self->_minYVariable = v4;

    minYVariable = self->_minYVariable;
  }
  return minYVariable;
}

- (id)nsli_boundsWidthVariable
{
  boundsWidthVariable = self->_boundsWidthVariable;
  if (!boundsWidthVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, [(UILayoutGuide *)self _allowsNegativeDimensions] ^ 1, 1);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_boundsWidthVariable;
    self->_boundsWidthVariable = v4;

    boundsWidthVariable = self->_boundsWidthVariable;
  }
  return boundsWidthVariable;
}

- (id)nsli_boundsHeightVariable
{
  boundsHeightVariable = self->_boundsHeightVariable;
  if (!boundsHeightVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, [(UILayoutGuide *)self _allowsNegativeDimensions] ^ 1, 1);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_boundsHeightVariable;
    self->_boundsHeightVariable = v4;

    boundsHeightVariable = self->_boundsHeightVariable;
  }
  return boundsHeightVariable;
}

- (BOOL)_allowsNegativeDimensions
{
  return self->__allowsNegativeDimensions;
}

- (void)_setOwningView:(id)a3
{
  obj = (UIView *)a3;
  id WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_owningView);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [(UILayoutGuide *)self _snipReferencingConstraints];
    }
    objc_storeWeak((id *)&self->_owningView, obj);
    self->_unsafeUnretainedOwningView = obj;
    [(UILayoutGuide *)self _invalidateLayoutFrame];
  }
}

- (void)_invalidateLayoutFrame
{
  if (!self->_useManualLayoutFrame) {
    self->_isLayoutFrameValid = 0;
  }
}

- (NSLayoutDimension)widthAnchor
{
  widthAnchor = self->_widthAnchor;
  if (!widthAnchor)
  {
    v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:7];
    v5 = self->_widthAnchor;
    self->_widthAnchor = v4;

    widthAnchor = self->_widthAnchor;
  }
  return widthAnchor;
}

- (NSLayoutYAxisAnchor)topAnchor
{
  topAnchor = self->_topAnchor;
  if (!topAnchor)
  {
    v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:3];
    v5 = self->_topAnchor;
    self->_topAnchor = v4;

    topAnchor = self->_topAnchor;
  }
  return topAnchor;
}

- (NSLayoutXAxisAnchor)trailingAnchor
{
  trailingAnchor = self->_trailingAnchor;
  if (!trailingAnchor)
  {
    v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:6];
    v5 = self->_trailingAnchor;
    self->_trailingAnchor = v4;

    trailingAnchor = self->_trailingAnchor;
  }
  return trailingAnchor;
}

- (NSLayoutXAxisAnchor)leadingAnchor
{
  leadingAnchor = self->_leadingAnchor;
  if (!leadingAnchor)
  {
    v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:5];
    v5 = self->_leadingAnchor;
    self->_leadingAnchor = v4;

    leadingAnchor = self->_leadingAnchor;
  }
  return leadingAnchor;
}

- (id)_createAnchorWithClass:(Class)a3 attribute:(int64_t)a4
{
  v4 = (void *)[[a3 alloc] initWithItem:self attribute:a4];
  return v4;
}

- (NSArray)_systemConstraints
{
  return self->_systemConstraints;
}

- (CGRect)layoutFrame
{
  if (self->_useManualLayoutFrame)
  {
    CGFloat x = self->_layoutFrame.origin.x;
    CGFloat y = self->_layoutFrame.origin.y;
    CGFloat width = self->_layoutFrame.size.width;
    CGFloat height = self->_layoutFrame.size.height;
  }
  else
  {
    v7 = [(UILayoutGuide *)self nsli_layoutEngine];
    uint64_t v8 = [v7 delegate];
    if (-[UIView _usesLayoutEngineHostingConstraints]((uint64_t)v8)) {
      -[UIView _resetLayoutEngineHostConstraints](v8);
    }
    v9 = [(UILayoutGuide *)self nsli_layoutEngine];
    -[NSISEngine _UIKitPerformPendingChangeNotifications]((uint64_t)v9);

    if (!self->_isLayoutFrameValid)
    {
      CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->_layoutFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->_layoutFrame.size = v10;
      if (v7)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
        v12 = WeakRetained;
        if ((WeakRetained[13] & 4) == 0 && (!v8 || (v8[13] & 0x20) == 0)) {
          -[UIView _updateConstraintsAtEngineLevelIfNeededWithViewForVariableChangeNotifications:](WeakRetained, WeakRetained);
        }
        [(UILayoutGuide *)self _updateLayoutFrameInOwningView:v12 fromEngine:v7];
      }
    }
    id v13 = objc_loadWeakRetained((id *)&self->_owningView);
    objc_msgSend(v13, "_layoutGuide:adjustedLayoutFrameForFrame:", self, self->_layoutFrame.origin.x, self->_layoutFrame.origin.y, self->_layoutFrame.size.width, self->_layoutFrame.size.height);
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)nsis_valueOfVariable:(id)a3 didChangeInEngine:(id)a4
{
  id v5 = a4;
  id v6 = [(UILayoutGuide *)self nsli_layoutEngine];

  if (v6 == v5)
  {
    [(UILayoutGuide *)self _invalidateLayoutFrame];
  }
}

- (id)nsli_layoutEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  v3 = objc_msgSend(WeakRetained, "nsli_layoutEngine");

  return v3;
}

- (BOOL)_uili_requiresObservationForVariable:(id)a3
{
  return 1;
}

- (id)_uili_existingBaseFrameVariables
{
  if (self->_minXVariable || self->_minYVariable || self->_boundsWidthVariable || self->_boundsHeightVariable)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    v4 = v3;
    if (self->_minXVariable) {
      objc_msgSend(v3, "addObject:");
    }
    if (self->_minYVariable) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_boundsWidthVariable) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_boundsHeightVariable) {
      objc_msgSend(v4, "addObject:");
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_setLockedToOwningView:(BOOL)a3
{
  if (self->_isLockedToOwningView != a3)
  {
    if (!self->_isLockedToOwningView)
    {
      systemConstraints = self->_systemConstraints;
      self->_systemConstraints = 0;
    }
    self->_isLockedToOwningView = a3;
  }
}

- (void)_setAllowsNegativeDimensions:(BOOL)a3
{
  self->__allowsNegativeDimensions = a3;
}

- (void)_setSystemConstraints:(id)a3
{
  id v6 = a3;
  id v12 = v6;
  if (self->_isLockedToOwningView
    || ([MEMORY[0x1E4F28B00] currentHandler],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 handleFailureInMethod:a2 object:self file:@"UILayoutGuide.m" lineNumber:79 description:@"The layout guide must be locked to its owning view before retaining system constraints"], v11, id v6 = v12, self->_isLockedToOwningView))
  {
    if ((systemConstraints = self->_systemConstraints,
          p_systemConstraints = &self->_systemConstraints,
          v7 = systemConstraints,
          !v6)
      && v7
      || (char v10 = [v6 isEqualToArray:v7], v6 = v12, (v10 & 1) == 0))
    {
      objc_storeStrong((id *)p_systemConstraints, a3);
      id v6 = v12;
    }
  }
}

- (NSLayoutYAxisAnchor)bottomAnchor
{
  bottomAnchor = self->_bottomAnchor;
  if (!bottomAnchor)
  {
    v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:4];
    id v5 = self->_bottomAnchor;
    self->_bottomAnchor = v4;

    bottomAnchor = self->_bottomAnchor;
  }
  return bottomAnchor;
}

- (void)dealloc
{
  p_owningView = &self->_owningView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);

  if (WeakRetained)
  {
    [(UILayoutGuide *)self _setLockedToOwningView:0];
    id v5 = objc_loadWeakRetained((id *)p_owningView);
    [v5 removeLayoutGuide:self];
  }
  [(NSISVariable *)self->_minXVariable setDelegate:0];
  [(NSISVariable *)self->_minYVariable setDelegate:0];
  [(NSISVariable *)self->_boundsWidthVariable setDelegate:0];
  [(NSISVariable *)self->_boundsHeightVariable setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)UILayoutGuide;
  [(UILayoutGuide *)&v6 dealloc];
}

- (void)_updateLayoutFrameInOwningView:(id)a3 fromEngine:(id)a4
{
  if (!self->_useManualLayoutFrame)
  {
    float64x2_t v13 = 0uLL;
    long long v11 = 0u;
    float64x2_t v12 = 0u;
    -[UIView _nsis_center:bounds:inEngine:forLayoutGuide:](a3, v13.f64, (double *)&v11, a4, self);
    CGSize v5 = (CGSize)v12;
    __asm { FMOV            V3.2D, #-0.5 }
    self->_layoutFrame.origin = (CGPoint)vaddq_f64(v13, vmulq_f64(v12, _Q3));
    self->_layoutFrame.size = v5;
    self->_isLayoutFrameValid = 1;
  }
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (NSISVariable *)a3;
  CGSize v5 = v4;
  if (self->_minXVariable == v4 || self->_boundsWidthVariable == v4) {
    goto LABEL_10;
  }
  if (self->_minYVariable == v4 || self->_boundsHeightVariable == v4)
  {
    int v9 = 1;
    goto LABEL_12;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v7 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    uint64_t v8 = [(NSISVariable *)v5 delegate];
    int v11 = 138412802;
    float64x2_t v12 = self;
    __int16 v13 = 2112;
    double v14 = v5;
    __int16 v15 = 2112;
    double v16 = v8;
    _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "%@ got asked for the orientationHint of a variable it doesn't know about: %@, which is owned by:%@", (uint8_t *)&v11, 0x20u);
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  objc_super v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &nsis_orientationHintForVariable____s_category) + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    uint64_t v8 = [(NSISVariable *)v5 delegate];
    int v11 = 138412802;
    float64x2_t v12 = self;
    __int16 v13 = 2112;
    double v14 = v5;
    __int16 v15 = 2112;
    double v16 = v8;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%@ got asked for the orientationHint of a variable it doesn't know about: %@, which is owned by:%@", (uint8_t *)&v11, 0x20u);
    goto LABEL_8;
  }
LABEL_10:
  int v9 = 0;
LABEL_12:

  return v9;
}

- (void)nsli_addConstraint:(id)a3
{
  p_owningView = &self->_owningView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_owningView);
  objc_msgSend(WeakRetained, "nsli_addConstraint:", v4);
}

- (UIView)owningView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  return (UIView *)WeakRetained;
}

- (void)setOwningView:(UIView *)owningView
{
  id v4 = owningView;
  if (self->_allowOwningViewSetting
    || (objc_super v6 = v4,
        [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Do not use -[UILayoutGuide setOwningView:] directly. Use -[UIView add/removeLayoutGuide:] instead" userInfo:0], CGSize v5 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "raise"), v5, v4 = v6, self->_allowOwningViewSetting))
  {
    if (!self->_isLockedToOwningView)
    {
      v7 = v4;
      [(UILayoutGuide *)self _setOwningView:v4];
      id v4 = v7;
      self->_allowOwningViewSetting = 0;
    }
  }
}

- (void)_setAllowOwningViewSetting:(BOOL)a3
{
  self->_allowOwningViewSetting = a3;
}

- (BOOL)_isLockedToOwningView
{
  return self->_isLockedToOwningView;
}

- (NSLayoutXAxisAnchor)centerXAnchor
{
  centerXAnchor = self->_centerXAnchor;
  if (!centerXAnchor)
  {
    id v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:9];
    CGSize v5 = self->_centerXAnchor;
    self->_centerXAnchor = v4;

    centerXAnchor = self->_centerXAnchor;
  }
  return centerXAnchor;
}

- (NSLayoutYAxisAnchor)centerYAnchor
{
  centerYAnchor = self->_centerYAnchor;
  if (!centerYAnchor)
  {
    id v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:10];
    CGSize v5 = self->_centerYAnchor;
    self->_centerYAnchor = v4;

    centerYAnchor = self->_centerYAnchor;
  }
  return centerYAnchor;
}

- (NSLayoutDimension)heightAnchor
{
  heightAnchor = self->_heightAnchor;
  if (!heightAnchor)
  {
    id v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:8];
    CGSize v5 = self->_heightAnchor;
    self->_heightAnchor = v4;

    heightAnchor = self->_heightAnchor;
  }
  return heightAnchor;
}

- (void)_owningViewIsDeallocating
{
  if (self->_unsafeUnretainedOwningView) {
    [(UILayoutGuide *)self _snipReferencingConstraints];
  }
  self->_unsafeUnretainedOwningView = 0;
}

- (void)_snipReferencingConstraints
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = self->_unsafeUnretainedOwningView;
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    do
    {
      objc_super v6 = objc_msgSend(v4, "nsli_installedConstraints");
      if ([v6 count])
      {
        if (!v5) {
          id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v15;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v15 != v10) {
                objc_enumerationMutation(v7);
              }
              float64x2_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
              if ([v12 _referencesLayoutItem:self]) {
                [v5 addObject:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v9);
        }
      }
      uint64_t v13 = objc_msgSend(v4, "nsli_superitem");

      id v4 = (void *)v13;
    }
    while (v13);
  }
  else
  {
    id v5 = 0;
  }
  [MEMORY[0x1E4F5B268] deactivateConstraints:v5];
}

- (void)_uili_removeLayoutVariableObservationsOnlyToSupportTAMICChange:(BOOL)a3
{
}

- (UILayoutGuide)init
{
  v6.receiver = self;
  v6.super_class = (Class)UILayoutGuide;
  v2 = [(UILayoutGuide *)&v6 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1ED0E84C0;
  }
  return v3;
}

- (void)setIdentifier:(NSString *)identifier
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSLayoutXAxisAnchor)leftAnchor
{
  leftAnchor = self->_leftAnchor;
  if (!leftAnchor)
  {
    id v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:1];
    id v5 = self->_leftAnchor;
    self->_leftAnchor = v4;

    leftAnchor = self->_leftAnchor;
  }
  return leftAnchor;
}

- (NSLayoutXAxisAnchor)rightAnchor
{
  rightAnchor = self->_rightAnchor;
  if (!rightAnchor)
  {
    id v4 = [(UILayoutGuide *)self _createAnchorWithClass:objc_opt_class() attribute:2];
    id v5 = self->_rightAnchor;
    self->_rightAnchor = v4;

    rightAnchor = self->_rightAnchor;
  }
  return rightAnchor;
}

- (void)_setShouldBeArchived:(BOOL)a3
{
  self->__shouldBeArchived = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerYAnchor, 0);
  objc_storeStrong((id *)&self->_centerXAnchor, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_widthAnchor, 0);
  objc_storeStrong((id *)&self->_bottomAnchor, 0);
  objc_storeStrong((id *)&self->_topAnchor, 0);
  objc_storeStrong((id *)&self->_rightAnchor, 0);
  objc_storeStrong((id *)&self->_leftAnchor, 0);
  objc_storeStrong((id *)&self->_trailingAnchor, 0);
  objc_storeStrong((id *)&self->_leadingAnchor, 0);
  objc_storeStrong((id *)&self->_stashedLayoutVariableObservations, 0);
  objc_storeStrong((id *)&self->_systemConstraints, 0);
  objc_storeStrong((id *)&self->_boundsHeightVariable, 0);
  objc_storeStrong((id *)&self->_boundsWidthVariable, 0);
  objc_storeStrong((id *)&self->_minYVariable, 0);
  objc_storeStrong((id *)&self->_minXVariable, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_owningView);
  objc_storeStrong((id *)&self->_constraintsToBeProcessedAfterDecoding, 0);
  objc_storeStrong((id *)&self->_layoutRect, 0);
}

- (id)nsli_constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 toAnchor:(id)a5 withSystemSpacingMultipliedBy:(double)a6
{
  uint64_t v9 = _MergedGlobals_1313;
  id v10 = a5;
  id v11 = a3;
  if (v9 != -1) {
    dispatch_once(&_MergedGlobals_1313, &__block_literal_global_635);
  }
  float64x2_t v12 = objc_msgSend((id)qword_1EB264EF8, "nsli_constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:", v11, a4, v10, a6);

  return v12;
}

+ (double)_defaultSpacingBetweenGuidesForResolvingSymbolicConstant
{
  return 8.0;
}

- (void)_setManualLayoutFrame:(CGRect)a3
{
  self->_useManualLayoutFrame = 1;
  self->_isLayoutFrameValid = 1;
  self->_layoutFrame = a3;
}

void __92__UILayoutGuide_nsli_constraintWithAnchor_relatedBy_toAnchor_withSystemSpacingMultipliedBy___block_invoke()
{
  v0 = objc_alloc_init(UIView);
  v1 = (void *)qword_1EB264EF8;
  qword_1EB264EF8 = (uint64_t)v0;
}

- (UILayoutGuide)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UILayoutGuide;
  id v5 = [(UILayoutGuide *)&v25 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectForKey:@"UILayoutGuideOwningView"];
    objc_storeWeak((id *)&v5->_owningView, v6);

    uint64_t v7 = [v4 decodeObjectForKey:@"UILayoutGuideIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v5->_isLockedToOwningView = [v4 decodeBoolForKey:@"UILayoutGuideOwningViewIsLocked"];
    v5->__shouldBeArchived = [v4 decodeBoolForKey:@"UILayoutGuideShouldBeArchived"];
    v5->__allowsNegativeDimensions = [v4 decodeBoolForKey:@"UILayoutGuideAllowsNegativeDimensions"];
    if (v5->_isLockedToOwningView)
    {
      uint64_t v9 = [v4 decodeObjectForKey:@"UILayoutGuideSystemConstraints"];
      systemConstraints = v5->_systemConstraints;
      v5->_systemConstraints = (NSArray *)v9;
    }
    id WeakRetained = (id *)objc_loadWeakRetained((id *)&v5->_owningView);
    -[UIView _finishDecodingLayoutGuideConnections:](WeakRetained, v5);

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    float64x2_t v12 = v5->_constraintsToBeProcessedAfterDecoding;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          double v18 = objc_msgSend(v17, "container", (void)v21);
          [v18 _faultInGuidesForConstraint:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
    }

    constraintsToBeProcessedAfterDecoding = v5->_constraintsToBeProcessedAfterDecoding;
    v5->_constraintsToBeProcessedAfterDecoding = 0;
  }
  return v5;
}

- (BOOL)_ui_usesManualLayout
{
  return 0;
}

- (void)_ui_addToView:(id)a3 atIndex:(int64_t)a4
{
}

- (void)_ui_addSubLayoutItem:(id)a3
{
  id v4 = a3;
  id v5 = [(UILayoutGuide *)self owningView];
  objc_msgSend(v4, "_ui_addToView:atIndex:", v5, -1);
}

- (void)_ui_insertSubLayoutItem:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UILayoutGuide *)self owningView];
  objc_msgSend(v6, "_ui_addToView:atIndex:", v7, a4);
}

- (void)_ui_removeFromParentLayoutItem
{
  id v3 = [(UILayoutGuide *)self owningView];
  [v3 removeLayoutGuide:self];
}

- (UITraitCollection)traitCollection
{
  v2 = [(UILayoutGuide *)self _ui_view];
  id v3 = [v2 traitCollection];

  return (UITraitCollection *)v3;
}

- (NSArray)constraintsAffectingLayoutForAxis:(UILayoutConstraintAxis)axis
{
  CGRect result = [(UIView *)[(UILayoutGuide *)self owningView] constraintsAffectingLayoutForAxis:axis ofItem:self];
  if (!result)
  {
    id v4 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v4 array];
  }
  return result;
}

- (BOOL)hasAmbiguousLayout
{
  return [(id)_layoutVariablesWithAmbiguousValueForLayoutItem(self) count] != 0;
}

- (id)_autolayoutTraceAtLevel:(int64_t)a3 recursively:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"\n", a4);
  if (a3 >= 1)
  {
    do
    {
      [v6 appendString:@"|   "];
      --a3;
    }
    while (a3);
  }
  id v7 = (void *)_layoutVariablesWithAmbiguousValueForLayoutItem(self);
  if ([v7 count])
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v8, "appendString:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "description"));
          [v8 appendString:@", "];
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 2, 2);
    id v13 = [(UILayoutGuide *)self _descriptionForLayoutTrace];
    if (v8) {
      uint64_t v14 = (__CFString *)[NSString stringWithFormat:@"- AMBIGUOUS LAYOUT for %@", v8];
    }
    else {
      uint64_t v14 = @" - AMBIGUOUS LAYOUT";
    }
  }
  else
  {
    id v13 = [(UILayoutGuide *)self _descriptionForLayoutTrace];
    uint64_t v14 = &stru_1ED0E84C0;
  }
  [v6 appendFormat:@"*%@%@", v13, v14];
  return v6;
}

- (id)_layoutRect
{
  layoutRect = self->_layoutRect;
  if (!layoutRect)
  {
    id v4 = (void *)MEMORY[0x1E4F5B278];
    id v5 = [(UILayoutGuide *)self leadingAnchor];
    id v6 = [(UILayoutGuide *)self topAnchor];
    id v7 = [(UILayoutGuide *)self widthAnchor];
    uint64_t v8 = [(UILayoutGuide *)self heightAnchor];
    uint64_t v9 = [v4 layoutRectWithLeadingAnchor:v5 topAnchor:v6 widthAnchor:v7 heightAnchor:v8];
    uint64_t v10 = self->_layoutRect;
    self->_layoutRect = v9;

    layoutRect = self->_layoutRect;
  }
  return layoutRect;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  [v5 encodeObject:WeakRetained forKey:@"UILayoutGuideOwningView"];

  [v5 encodeObject:self->_identifier forKey:@"UILayoutGuideIdentifier"];
  [v5 encodeBool:self->_isLockedToOwningView forKey:@"UILayoutGuideOwningViewIsLocked"];
  [v5 encodeBool:self->__shouldBeArchived forKey:@"UILayoutGuideShouldBeArchived"];
  [v5 encodeBool:self->__allowsNegativeDimensions forKey:@"UILayoutGuideAllowsNegativeDimensions"];
  if (self->_isLockedToOwningView) {
    [v5 encodeObject:self->_systemConstraints forKey:@"UILayoutGuideSystemConstraints"];
  }
}

- (BOOL)_isSafeAreaAspectFitLayoutGuide
{
  return 0;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(UILayoutGuide *)self identifier];
  [(UILayoutGuide *)self layoutFrame];
  id v7 = NSStringFromCGRect(v12);
  uint64_t v8 = [(UILayoutGuide *)self owningView];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p - \"%@\", layoutFrame = %@, owningView = %@>", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (void)_addConstraintToBeProcessedAfterDecoding:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    constraintsToBeProcessedAfterDecoding = self->_constraintsToBeProcessedAfterDecoding;
    id v8 = v4;
    if (!constraintsToBeProcessedAfterDecoding)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v7 = self->_constraintsToBeProcessedAfterDecoding;
      self->_constraintsToBeProcessedAfterDecoding = v6;

      constraintsToBeProcessedAfterDecoding = self->_constraintsToBeProcessedAfterDecoding;
    }
    [(NSMutableArray *)constraintsToBeProcessedAfterDecoding addObject:v8];
    id v4 = v8;
  }
}

- (CGSize)nsli_convertSizeToEngineSpace:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "nsli_convertSizeToEngineSpace:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)nsli_convertSizeFromEngineSpace:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "nsli_convertSizeFromEngineSpace:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)nsli_resolvedValue:(double *)a3 forSymbolicConstant:(id)a4 inConstraint:(id)a5 error:(id *)a6
{
  *a3 = 0.0;
  return 1;
}

- (BOOL)nsli_defaultResolvedValue:(double *)a3 forSymbolicConstant:(id)a4 inConstraint:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  CGRect v12 = [(UILayoutGuide *)self owningView];
  LOBYTE(a6) = objc_msgSend(v12, "nsli_defaultResolvedValue:forSymbolicConstant:inConstraint:error:", a3, v11, v10, a6);

  return (char)a6;
}

- (id)nsli_description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  double v6 = [(UILayoutGuide *)self identifier];
  double v7 = [v3 stringWithFormat:@"%@:%p'%@'", v5, self, v6];

  return v7;
}

- (BOOL)nsli_descriptionIncludesPointer
{
  return 1;
}

- (unint64_t)nsli_autoresizingMask
{
  return 0;
}

- (BOOL)nsli_isFlipped
{
  return 1;
}

- (BOOL)nsli_removeConstraint:(id)a3
{
  p_owningView = &self->_owningView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_owningView);
  char v6 = objc_msgSend(WeakRetained, "nsli_removeConstraint:", v4);

  return v6;
}

- (id)nsli_installedConstraints
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (double)nsli_marginOffsetForAttribute:(int64_t)a3
{
  return 0.0;
}

- (BOOL)nsli_lowerAttribute:(int)a3 intoExpression:(id)a4 withCoefficient:(double)a5 container:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &nsli_lowerAttribute_intoExpression_withCoefficient_container____s_category_0)+ 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315138;
    double v9 = "-[UILayoutGuide nsli_lowerAttribute:intoExpression:withCoefficient:container:]";
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unexpected call to %s", (uint8_t *)&v8, 0xCu);
  }
  return 0;
}

- (id)nsli_contentWidthVariable
{
  return 0;
}

- (id)nsli_contentHeightVariable
{
  return 0;
}

- (BOOL)nsli_isCollectingConstraintChangesForLaterCoordinatedFlush:(id)a3
{
  return 0;
}

- (BOOL)nsli_isLegalConstraintItem
{
  return 1;
}

- (BOOL)nsli_isRTL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  char v3 = objc_msgSend(WeakRetained, "nsli_isRTL");

  return v3;
}

- (CGSize)nsli_engineToUserScalingCoefficients
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  p_owningView = &self->_owningView;
  id WeakRetained = objc_loadWeakRetained((id *)p_owningView);

  if (has_internal_diagnostics)
  {
    if (!WeakRetained)
    {
      uint64_t v14 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Unexpected access to UILayoutGuide without an owning view", buf, 2u);
      }
    }
  }
  else if (!WeakRetained)
  {
    uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &nsli_engineToUserScalingCoefficients___s_category) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v16 = 0;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Unexpected access to UILayoutGuide without an owning view", v16, 2u);
    }
  }
  id v6 = objc_loadWeakRetained((id *)p_owningView);

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_owningView);
    objc_msgSend(v7, "nsli_engineToUserScalingCoefficients");
    uint64_t v9 = v8;
    uint64_t v11 = v10;
  }
  else
  {
    self;
    uint64_t v9 = 0x3F66C16C16C16C17;
    uint64_t v11 = 0x3F66C16C16C16C17;
  }
  double v12 = *(double *)&v9;
  double v13 = *(double *)&v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)_uili_stashLayoutVariableObservation:(id)a3 forVariable:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  stashedLayoutVariableObservations = self->_stashedLayoutVariableObservations;
  if (!stashedLayoutVariableObservations)
  {
    uint64_t v8 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:4];
    uint64_t v9 = self->_stashedLayoutVariableObservations;
    self->_stashedLayoutVariableObservations = v8;

    stashedLayoutVariableObservations = self->_stashedLayoutVariableObservations;
  }
  [(NSMapTable *)stashedLayoutVariableObservations setObject:v10 forKey:v6];
}

- (BOOL)nsis_shouldIntegralizeVariable:(id)a3
{
  return 0;
}

- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3
{
  return 1;
}

- (id)nsis_descriptionOfVariable:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_owningView);
    uint64_t v7 = objc_msgSend(v6, "nsis_descriptionOfVariable:", v4);
LABEL_5:
    uint64_t v9 = (void *)v7;

    goto LABEL_6;
  }
  uint64_t v8 = NSString;
  if (self->_identifier)
  {
    id v6 = [NSString stringWithFormat:@", %@,", self->_identifier];
    uint64_t v7 = [v8 stringWithFormat:@"variable for UILayoutGuide%@ with no owning view.", v6];
    goto LABEL_5;
  }
  uint64_t v9 = [NSString stringWithFormat:@"variable for UILayoutGuide%@ with no owning view.", &stru_1ED0E84C0];
LABEL_6:

  return v9;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    v10.receiver = self;
    v10.super_class = (Class)UILayoutGuide;
    [(UILayoutGuide *)&v10 forwardInvocation:v4];
  }
  else
  {
    p_owningView = &self->_owningView;
    id WeakRetained = objc_loadWeakRetained((id *)p_owningView);

    if (WeakRetained)
    {
      uint64_t v7 = objc_loadWeakRetained((id *)p_owningView);
      [v4 invokeWithTarget:v7];
    }
    else
    {
      uint64_t v7 = [v4 methodSignature];
      size_t v8 = [v7 methodReturnLength];
      if (v8)
      {
        memset(v11, 0, sizeof(v11));
        if (v8 <= 0x20)
        {
          [v4 setReturnValue:v11];
        }
        else
        {
          uint64_t v9 = malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL);
          [v4 setReturnValue:v9];
          free(v9);
        }
      }
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (dyld_program_sdk_at_least())
  {
    v11.receiver = self;
    v11.super_class = (Class)UILayoutGuide;
    uint64_t v5 = [(UILayoutGuide *)&v11 methodSignatureForSelector:a3];
  }
  else
  {
    p_owningView = &self->_owningView;
    id WeakRetained = objc_loadWeakRetained((id *)p_owningView);

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)p_owningView);
      uint64_t v9 = [v8 methodSignatureForSelector:a3];

      goto LABEL_7;
    }
    uint64_t v5 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  uint64_t v9 = (void *)v5;
LABEL_7:
  return v9;
}

- (BOOL)_allowOwningViewSetting
{
  return self->_allowOwningViewSetting;
}

- (NSISVariable)_minXVariable
{
  return self->_minXVariable;
}

- (NSISVariable)_minYVariable
{
  return self->_minYVariable;
}

- (NSISVariable)_boundsWidthVariable
{
  return self->_boundsWidthVariable;
}

- (NSISVariable)_boundsHeightVariable
{
  return self->_boundsHeightVariable;
}

- (BOOL)_useManualLayoutFrame
{
  return self->_useManualLayoutFrame;
}

- (NSMapTable)_stashedLayoutVariableObservations
{
  return self->_stashedLayoutVariableObservations;
}

- (BOOL)_shouldBeArchived
{
  return self->__shouldBeArchived;
}

- (CGRect)frameInView:(id)a3
{
  [(UILayoutGuide *)self _frameInCoordinateSpace:a3 window:0];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  id v5 = a3;
  double v6 = [(UILayoutGuide *)self owningView];
  [(UILayoutGuide *)self layoutFrame];
  objc_msgSend(v6, "convertRect:toCoordinateSpace:", v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)_nearestViewController
{
  return 0;
}

@end