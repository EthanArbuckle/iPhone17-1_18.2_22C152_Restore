@interface _UISheetLayoutInfo
- (BOOL)_allowsAsymmetricVerticalMargins;
- (BOOL)_allowsInteractiveDismissWhenFullScreen;
- (BOOL)_alwaysAllowsEdgeAttached;
- (BOOL)_anyDescendantWantsFullScreen;
- (BOOL)_containsFirstResponder;
- (BOOL)_dismissesHorizontally;
- (BOOL)_firstResponderRequiresKeyboard;
- (BOOL)_hasActiveFullDetent;
- (BOOL)_hasChildSheet;
- (BOOL)_hasParentSheet;
- (BOOL)_insetsContentViewForGrabber;
- (BOOL)_isAnyDescendantDragging;
- (BOOL)_isAnyDescendantTransitioning;
- (BOOL)_isDimmingEnabled;
- (BOOL)_isDismissible;
- (BOOL)_isDragging;
- (BOOL)_isEdgeAttached;
- (BOOL)_isEffectiveDismissible;
- (BOOL)_isEffectivePresented;
- (BOOL)_isExpanded;
- (BOOL)_isForcedFullScreen;
- (BOOL)_isFunctionallyFullScreen;
- (BOOL)_isGrabberBlurEnabled;
- (BOOL)_isHidden;
- (BOOL)_isHidingUnderneathDescendant;
- (BOOL)_isHidingUnderneathDescendantForDepthLevel;
- (BOOL)_isHosting;
- (BOOL)_isInteractionEnabled;
- (BOOL)_isInverted;
- (BOOL)_isModelDimmingEnabled;
- (BOOL)_isPresented;
- (BOOL)_isReduceMotionEnabled;
- (BOOL)_isScrollInteractionEnabled;
- (BOOL)_isTransitioning;
- (BOOL)_peeksWhenFloating;
- (BOOL)_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge;
- (BOOL)_prefersScrollingResizesWhenDetentDirectionIsDown;
- (BOOL)_presentsWithGesture;
- (BOOL)_remoteContainsFirstResponder;
- (BOOL)_remoteFirstResponderRequiresKeyboard;
- (BOOL)_scalesDownBehindDescendants;
- (BOOL)_shouldAdjustDetentsToAvoidKeyboard;
- (BOOL)_shouldDimmingIgnoreTouches;
- (BOOL)_shouldDismissWhenTappedOutside;
- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance;
- (BOOL)_shouldScaleDownBehindDescendants;
- (BOOL)_stacksWithChild;
- (BOOL)_stacksWithParent;
- (BOOL)_supportsAttachedEdge;
- (BOOL)_tucksIntoUnsafeAreaInCompactHeight;
- (BOOL)_wantsEdgeAttached;
- (BOOL)_wantsEdgeAttachedInCompactHeight;
- (BOOL)_wantsFloatingInRegularWidthCompactHeight;
- (BOOL)_wantsFullScreen;
- (BOOL)_wantsGrabber;
- (BOOL)_wantsInvertedWhenFloating;
- (BOOL)_widthFollowsPreferredContentSizeWhenEdgeAttached;
- (CGAffineTransform)_transform;
- (CGPoint)_currentOffset;
- (CGPoint)_rawCurrentOffset;
- (CGRect)_containerBounds;
- (CGRect)_dismissSourceFrame;
- (CGRect)_effectiveKeyboardFrame;
- (CGRect)_frameOfPresentedViewInContainerView;
- (CGRect)_fullHeightUntransformedFrame;
- (CGRect)_fullHeightUntransformedFrameForDepthLevel;
- (CGRect)_hostParentFullHeightUntransformedFrameForDepthLevel;
- (CGRect)_hostParentStackAlignmentFrame;
- (CGRect)_hostedDismissFrame;
- (CGRect)_hostedFrameOfPresentedViewInContainerView;
- (CGRect)_hostedUntransformedFrame;
- (CGRect)_keyboardFrame;
- (CGRect)_parentFullHeightUntransformedFrameForDepthLevel;
- (CGRect)_remoteKeyboardFrame;
- (CGRect)_sourceFrame;
- (CGRect)_stackAlignmentFrame;
- (CGRect)_untransformedFrame;
- (CGSize)_preferredSize;
- (CGSize)_screenSize;
- (NSArray)_activeDetents;
- (NSArray)_ancestorSheetIDs;
- (NSArray)_detentValues;
- (NSArray)_detents;
- (NSMutableArray)_mutableActiveDetents;
- (NSMutableArray)_mutableDetentValues;
- (NSSet)_descendantHiddenAncestorSheetIDs;
- (NSString)_hiddenAncestorSheetID;
- (NSString)_selectedDetentIdentifier;
- (NSString)_sheetID;
- (NSString)description;
- (UIEdgeInsets)_containerSafeAreaInsets;
- (UIEdgeInsets)_margins;
- (UIEdgeInsets)_marginsWhenFloating;
- (UIEdgeInsets)_touchInsets;
- (UIEdgeInsets)_unsafeInsets;
- (UIRectCornerRadii)_cornerRadii;
- (UIRectCornerRadii)_hostedCornerRadii;
- (UITraitCollection)_containerTraitCollection;
- (UIView)_containerView;
- (UIViewController)_presentedViewController;
- (UIViewController)_presentingViewController;
- (_UISheetLayoutInfo)_childLayoutInfo;
- (_UISheetLayoutInfo)_parentLayoutInfo;
- (_UISheetLayoutInfo)initWithMetrics:(id)a3;
- (_UISheetLayoutInfoDelegate)_delegate;
- (_UISheetPresentationControllerAppearance)_edgeAttachedCompactHeightAppearance;
- (_UISheetPresentationControllerAppearance)_effectiveAppearance;
- (_UISheetPresentationControllerAppearance)_floatingAppearance;
- (_UISheetPresentationControllerAppearance)_standardAppearance;
- (_UISheetPresentationMetrics)_metrics;
- (double)_additionalMinimumTopInset;
- (double)_alpha;
- (double)_confinedPercentDimmed;
- (double)_confinedPercentLightened;
- (double)_depthLevel;
- (double)_dismissCornerRadius;
- (double)_dismissOffset;
- (double)_fullDetentValue;
- (double)_grabberAlpha;
- (double)_grabberSpacing;
- (double)_hostParentDepthLevel;
- (double)_invertedDepthLevel;
- (double)_latestUserChosenOffset;
- (double)_magicShadowOpacity;
- (double)_marginInCompactHeight;
- (double)_marginInRegularWidthRegularHeight;
- (double)_maximumDepthLevelInChain;
- (double)_nonFullHeightOffset;
- (double)_offsetAdjustment;
- (double)_offsetForCurrentActiveDetent;
- (double)_parentDepthLevel;
- (double)_percentDimmed;
- (double)_percentDimmedFromOffset;
- (double)_percentFullHeight;
- (double)_percentFullScreen;
- (double)_percentPresented;
- (double)_preferredCornerRadius;
- (double)_preferredShadowOpacity;
- (double)_proposedDepthLevel;
- (double)_proposedDepthLevelIncrement;
- (double)_remoteProposedDepthLevel;
- (double)_rubberBandExtentBeyondMaximumOffset;
- (double)_rubberBandExtentBeyondMinimumOffset;
- (double)_shadowOpacity;
- (double)_shadowRadius;
- (double)_smallestNonDismissDetentOffset;
- (double)_tearOffset;
- (double)maximumDetentValue;
- (id)_currentOffsetGetter;
- (id)_descendantDescription;
- (id)_indexOfCurrentActiveOrDismissDetentWasInvalidated;
- (id)_rubberBandExtentBeyondMaximumOffsetWasInvalidated;
- (id)_rubberBandExtentBeyondMinimumOffsetWasInvalidated;
- (int64_t)_adjustedIndexOfCurrentActiveDetentForContainedFirstResponder;
- (int64_t)_grabberAction;
- (int64_t)_horizontalAlignment;
- (int64_t)_indexOfActiveDetentForTappingGrabber;
- (int64_t)_indexOfActiveDimmingDetent;
- (int64_t)_indexOfCurrentActiveDetent;
- (int64_t)_indexOfCurrentActiveOrDismissDetent;
- (int64_t)_mode;
- (int64_t)_numberOfActiveNonDismissDetents;
- (void)_layout;
- (void)_setAdditionalMinimumTopInset:(double)a3;
- (void)_setAllowsAsymmetricVerticalMargins:(BOOL)a3;
- (void)_setAllowsInteractiveDismissWhenFullScreen:(BOOL)a3;
- (void)_setAlwaysAllowsEdgeAttached:(BOOL)a3;
- (void)_setChildSheetLayoutInfo:(id)a3;
- (void)_setContainerBounds:(CGRect)a3;
- (void)_setContainerSafeAreaInsets:(UIEdgeInsets)a3;
- (void)_setContainerTraitCollection:(id)a3;
- (void)_setContainerView:(id)a3;
- (void)_setContainsFirstResponder:(BOOL)a3;
- (void)_setCurrentOffsetGetter:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setDetents:(id)a3;
- (void)_setDismissCornerRadius:(double)a3;
- (void)_setDismissSourceFrame:(CGRect)a3;
- (void)_setDismissible:(BOOL)a3;
- (void)_setDragging:(BOOL)a3;
- (void)_setEdgeAttachedCompactHeightAppearance:(id)a3;
- (void)_setFirstResponderRequiresKeyboard:(BOOL)a3;
- (void)_setFloatingAppearance:(id)a3;
- (void)_setGrabberBlurEnabled:(BOOL)a3;
- (void)_setGrabberSpacing:(double)a3;
- (void)_setHidden:(BOOL)a3;
- (void)_setHiddenAncestorSheetID:(id)a3;
- (void)_setHorizontalAlignment:(int64_t)a3;
- (void)_setHostParentDepthLevel:(double)a3;
- (void)_setHostParentFullHeightUntransformedFrameForDepthLevel:(CGRect)a3;
- (void)_setHostParentStackAlignmentFrame:(CGRect)a3;
- (void)_setHosting:(BOOL)a3;
- (void)_setInsetsContentViewForGrabber:(BOOL)a3;
- (void)_setKeyboardFrame:(CGRect)a3;
- (void)_setLatestUserChosenOffset:(double)a3;
- (void)_setMarginInCompactHeight:(double)a3;
- (void)_setMarginInRegularWidthRegularHeight:(double)a3;
- (void)_setMode:(int64_t)a3;
- (void)_setParentSheetLayoutInfo:(id)a3;
- (void)_setPeeksWhenFloating:(BOOL)a3;
- (void)_setPreferredCornerRadius:(double)a3;
- (void)_setPreferredShadowOpacity:(double)a3;
- (void)_setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:(BOOL)a3;
- (void)_setPrefersScrollingResizesWhenDetentDirectionIsDown:(BOOL)a3;
- (void)_setPresented:(BOOL)a3;
- (void)_setPresentedViewController:(id)a3;
- (void)_setPresentingViewController:(id)a3;
- (void)_setPresentsWithGesture:(BOOL)a3;
- (void)_setReduceMotionEnabled:(BOOL)a3;
- (void)_setRemoteContainsFirstResponder:(BOOL)a3;
- (void)_setRemoteFirstResponderRequiresKeyboard:(BOOL)a3;
- (void)_setRemoteKeyboardFrame:(CGRect)a3;
- (void)_setRemoteProposedDepthLevel:(double)a3;
- (void)_setScreenSize:(CGSize)a3;
- (void)_setSelectedDetentIdentifier:(id)a3;
- (void)_setShadowRadius:(double)a3;
- (void)_setSheetID:(id)a3;
- (void)_setShouldAdjustDetentsToAvoidKeyboard:(BOOL)a3;
- (void)_setShouldDismissWhenTappedOutside:(BOOL)a3;
- (void)_setShouldScaleDownBehindDescendants:(BOOL)a3;
- (void)_setSourceFrame:(CGRect)a3;
- (void)_setStandardAppearance:(id)a3;
- (void)_setTearOffset:(double)a3;
- (void)_setTransitioning:(BOOL)a3;
- (void)_setTucksIntoUnsafeAreaInCompactHeight:(BOOL)a3;
- (void)_setWantsEdgeAttached:(BOOL)a3;
- (void)_setWantsEdgeAttachedInCompactHeight:(BOOL)a3;
- (void)_setWantsFloatingInRegularWidthCompactHeight:(BOOL)a3;
- (void)_setWantsFullScreen:(BOOL)a3;
- (void)_setWantsGrabber:(BOOL)a3;
- (void)_setWantsInvertedWhenFloating:(BOOL)a3;
- (void)_setWidthFollowsPreferredContentSizeWhenEdgeAttached:(BOOL)a3;
- (void)set_indexOfCurrentActiveOrDismissDetentWasInvalidated:(id)a3;
- (void)set_rubberBandExtentBeyondMaximumOffsetWasInvalidated:(id)a3;
- (void)set_rubberBandExtentBeyondMinimumOffsetWasInvalidated:(id)a3;
@end

@implementation _UISheetLayoutInfo

- (BOOL)_wantsFullScreen
{
  return self->__wantsFullScreen;
}

- (void)_setContainerSafeAreaInsets:(UIEdgeInsets)a3
{
  if (self->__containerSafeAreaInsets.left != a3.left
    || self->__containerSafeAreaInsets.top != a3.top
    || self->__containerSafeAreaInsets.right != a3.right
    || self->__containerSafeAreaInsets.bottom != a3.bottom)
  {
    self->__containerSafeAreaInsets = a3;
    v6 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v6);
    _UISheetLayoutInfoDirtyMargins(v6);
    _UISheetLayoutInfoDirtyActiveDetents(v6);
    _UISheetLayoutInfoDirtyRubberBandExtentBeyondMinimumOffset(v6);
    _UISheetLayoutInfoDirtyRubberBandExtentBeyondMaximumOffset(v6);
    _UISheetLayoutInfoDirtyExpanded(v6);
    _UISheetLayoutInfoDirtyShouldPresentedViewControllerControlStatusBarAppearance(v6);
  }
}

- (BOOL)_hasParentSheet
{
  v3 = [(_UISheetLayoutInfo *)self _parentLayoutInfo];
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    [(_UISheetLayoutInfo *)self _hostParentStackAlignmentFrame];
    BOOL v4 = !CGRectIsNull(v6);
  }

  return v4;
}

- (double)maximumDetentValue
{
  [(_UISheetLayoutInfo *)self _fullHeightPresentedViewFrame];
  double Height = CGRectGetHeight(v9);
  BOOL v4 = [(_UISheetLayoutInfo *)self _isEdgeAttached];
  double v5 = 0.0;
  if (v4)
  {
    BOOL v6 = [(_UISheetLayoutInfo *)self _isInverted];
    [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
    if (!v6) {
      double v5 = v7;
    }
  }
  return Height - v5;
}

- (BOOL)_isEdgeAttached
{
  if ((*((unsigned char *)&self->_clean + 1) & 0x40) == 0)
  {
    [(_UISheetLayoutInfo *)self _marginsWhenFloating];
    double v4 = v3;
    double v6 = v5;
    [(_UISheetLayoutInfo *)self _containerBounds];
    double Width = CGRectGetWidth(v12);
    v8 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
    if ([(_UISheetLayoutInfo *)self _supportsAttachedEdge])
    {
      if ([(_UISheetLayoutInfo *)self _wantsEdgeAttached]
        || [(_UISheetLayoutInfo *)self _wantsFullScreen]
        || ([(_UISheetLayoutInfo *)self _preferredSize], v9 > Width - v4 - v6)
        || [v8 horizontalSizeClass] == 1)
      {
        BOOL v10 = 1;
LABEL_11:
        self->__edgeAttached = v10;
        *(void *)&self->_clean |= 0x4000uLL;

        return self->__edgeAttached;
      }
      if ([v8 verticalSizeClass] == 1)
      {
        BOOL v10 = ![(_UISheetLayoutInfo *)self _wantsFloatingInRegularWidthCompactHeight];
        goto LABEL_11;
      }
    }
    BOOL v10 = 0;
    goto LABEL_11;
  }
  return self->__edgeAttached;
}

- (CGRect)_fullHeightUntransformedFrame
{
  if (*((unsigned char *)&self->_clean + 3))
  {
    double x = self->__fullHeightUntransformedFrame.origin.x;
    double y = self->__fullHeightUntransformedFrame.origin.y;
    double width = self->__fullHeightUntransformedFrame.size.width;
    double height = self->__fullHeightUntransformedFrame.size.height;
  }
  else
  {
    if ([(_UISheetLayoutInfo *)self _isFunctionallyFullScreen]) {
      [(_UISheetLayoutInfo *)self _containerBounds];
    }
    else {
      [(_UISheetLayoutInfo *)self _stackAlignmentFrame];
    }
    self->__fullHeightUntransformedFrame.origin.double x = x;
    self->__fullHeightUntransformedFrame.origin.double y = y;
    self->__fullHeightUntransformedFrame.size.double width = width;
    self->__fullHeightUntransformedFrame.size.double height = height;
    *(void *)&self->_clean |= 0x1000000uLL;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)_containerSafeAreaInsets
{
  double top = self->__containerSafeAreaInsets.top;
  double left = self->__containerSafeAreaInsets.left;
  double bottom = self->__containerSafeAreaInsets.bottom;
  double right = self->__containerSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)_wantsEdgeAttached
{
  return self->__wantsEdgeAttached;
}

- (BOOL)_stacksWithParent
{
  double v3 = [(_UISheetLayoutInfo *)self _parentLayoutInfo];
  double v4 = v3;
  if (v3) {
    [v3 _stackAlignmentFrame];
  }
  else {
    [(_UISheetLayoutInfo *)self _hostParentStackAlignmentFrame];
  }
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  CGFloat v11 = v7;
  CGFloat v12 = v8;
  [(_UISheetLayoutInfo *)self _stackAlignmentFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v21 = [(_UISheetLayoutInfo *)self _metrics];
  char v22 = _UISheetLayoutInfoStacks(v21, v9, v10, v11, v12, v14, v16, v18, v20);

  return v22;
}

- (_UISheetPresentationMetrics)_metrics
{
  return self->__metrics;
}

- (CGRect)_stackAlignmentFrame
{
  if ((*((unsigned char *)&self->_clean + 2) & 0x40) != 0) {
    goto LABEL_44;
  }
  [(_UISheetLayoutInfo *)self _containerBounds];
  CGFloat v4 = v3;
  CGFloat rect = v5;
  CGFloat v7 = v6;
  double v9 = v8;
  [(_UISheetLayoutInfo *)self _additionalMinimumTopInset];
  double v78 = v10;
  [(_UISheetLayoutInfo *)self _margins];
  double v77 = v11;
  double v79 = v12;
  double v73 = v13;
  double v15 = v14;
  BOOL v16 = [(_UISheetLayoutInfo *)self _isInverted];
  [(_UISheetLayoutInfo *)self _sourceFrame];
  double x = v80.origin.x;
  double y = v80.origin.y;
  double width = v80.size.width;
  double height = v80.size.height;
  if (CGRectIsNull(v80))
  {
    v21 = [(_UISheetLayoutInfo *)self _containerView];
    int v22 = [v21 _shouldReverseLayoutDirection];

    int64_t v23 = [(_UISheetLayoutInfo *)self _horizontalAlignment];
    if (v23 == 2)
    {
      double v24 = v79;
      double v25 = v9;
      CGFloat v27 = rect;
      CGFloat v26 = v4;
      if (!v22) {
        goto LABEL_9;
      }
    }
    else
    {
      if (v23 != 1)
      {
        v81.origin.double x = v4;
        v81.origin.double y = rect;
        v81.size.double width = v7;
        double v25 = v9;
        CGFloat v27 = rect;
        v81.size.double height = v25;
        double MidX = CGRectGetMidX(v81);
        double v24 = v79;
LABEL_14:
        v82.origin.double x = v4;
        v82.origin.double y = v27;
        v82.size.double width = v7;
        v82.size.double height = v25;
        double MidY = CGRectGetMidY(v82);
        goto LABEL_15;
      }
      double v24 = v79;
      double v25 = v9;
      CGFloat v26 = v4;
      if (v22)
      {
        CGFloat v27 = rect;
LABEL_9:
        CGFloat v30 = v27;
        CGFloat v31 = v7;
        double v32 = v25;
        double MaxX = CGRectGetMaxX(*(CGRect *)&v26);
LABEL_13:
        double MidX = MaxX;
        goto LABEL_14;
      }
      CGFloat v27 = rect;
    }
    CGFloat v34 = v27;
    CGFloat v35 = v7;
    double v36 = v25;
    double MaxX = CGRectGetMinX(*(CGRect *)&v26);
    goto LABEL_13;
  }
  double MidX = x + width * 0.5;
  double MidY = y + height * 0.5;
  double v24 = v79;
  double v25 = v9;
  CGFloat v27 = rect;
LABEL_15:
  v83.origin.double x = v4;
  v83.origin.double y = v27;
  v83.size.double width = v7;
  v83.size.double height = v25;
  double v37 = CGRectGetWidth(v83) - v24 - v15;
  BOOL v38 = [(_UISheetLayoutInfo *)self _isEdgeAttached];
  v39 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
  v40 = v39;
  if (v38)
  {
    BOOL v41 = [(_UISheetLayoutInfo *)self _widthFollowsPreferredContentSizeWhenEdgeAttached];
    double v42 = v37;
    if (v41)
    {
      if (objc_msgSend(v40, "horizontalSizeClass", v37) != 1
        || (v43 = [v40 verticalSizeClass], double v42 = v37, v43 != 2))
      {
        [(_UISheetLayoutInfo *)self _preferredSize];
      }
    }
    if (v42 >= v37) {
      double v42 = v37;
    }
    double v44 = fmax(v24 + (v37 - (v37 - v42)) * 0.5, fmin(MidX, v24 + (v37 + v37 - v42) * 0.5));
    double v45 = v78 + v77;
    double v46 = v73;
    if (!v16) {
      double v46 = v78 + v77;
    }
    double v47 = v44 - v42 * 0.5;
    if (v16) {
      double v45 = 0.0;
    }
    self->__stackAlignmentFrame.origin.double x = v47;
    self->__stackAlignmentFrame.origin.double y = v45;
    self->__stackAlignmentFrame.size.double width = v42;
    self->__stackAlignmentFrame.size.double height = v25 - v46;
  }
  else
  {
    uint64_t v48 = [v39 userInterfaceIdiom];

    [(_UISheetLayoutInfo *)self _preferredSize];
    if (v48 == 6)
    {
      self->__stackAlignmentFrame.origin.double x = MidX - v49 * 0.5;
      self->__stackAlignmentFrame.origin.double y = MidY - v50 * 0.5;
      self->__stackAlignmentFrame.size.double width = v49;
      self->__stackAlignmentFrame.size.double height = v50;
    }
    else
    {
      double recta = MidX;
      double v51 = v25 - v77 - v73;
      double v52 = v51 - v78;
      if (v49 >= v37) {
        double v53 = v37;
      }
      else {
        double v53 = v49;
      }
      if (v50 >= v52) {
        double v54 = v51 - v78;
      }
      else {
        double v54 = v50;
      }
      int64_t v55 = [(_UISheetLayoutInfo *)self _mode];
      double v56 = v53 * 1.41421356;
      if (v54 < v53 * 1.41421356) {
        double v56 = v54;
      }
      if (v55) {
        double v56 = v54;
      }
      double v74 = v56;
      [(_UISheetLayoutInfo *)self _effectiveKeyboardFrame];
      CGFloat v57 = v84.origin.x;
      CGFloat v58 = v84.origin.y;
      CGFloat v59 = v84.size.width;
      CGFloat v60 = v84.size.height;
      if (!CGRectIsNull(v84))
      {
        v85.origin.double x = v57;
        v85.origin.double y = v58;
        v85.size.double width = v59;
        v85.size.double height = v60;
        double v61 = CGRectGetMinY(v85) * 0.5;
        if (MidY >= v61) {
          double MidY = v61;
        }
      }
      double v72 = MidY;
      CGFloat v62 = v52 - v74;
      CGFloat v63 = v78 + v77 + (v52 - (v52 - v74)) * 0.5;
      v86.origin.double x = v79 + (v37 - (v37 - v53)) * 0.5;
      v86.origin.double y = v63;
      v86.size.double width = v37 - v53;
      v86.size.double height = v52 - v74;
      double MinX = CGRectGetMinX(v86);
      v87.origin.double x = v79 + (v37 - (v37 - v53)) * 0.5;
      v87.origin.double y = v63;
      v87.size.double width = v37 - v53;
      v87.size.double height = v52 - v74;
      double v65 = fmax(MinX, fmin(recta, CGRectGetMaxX(v87)));
      v88.origin.double x = v79 + (v37 - (v37 - v53)) * 0.5;
      v88.origin.double y = v63;
      v88.size.double width = v37 - v53;
      v88.size.double height = v52 - v74;
      double MinY = CGRectGetMinY(v88);
      v89.origin.double x = v79 + (v37 - (v37 - v53)) * 0.5;
      v89.origin.double y = v63;
      v89.size.double width = v37 - v53;
      v89.size.double height = v62;
      double MaxY = CGRectGetMaxY(v89);
      self->__stackAlignmentFrame.origin.double x = v65 - v53 * 0.5;
      self->__stackAlignmentFrame.origin.double y = fmax(MinY, fmin(v72, MaxY)) - v74 * 0.5;
      self->__stackAlignmentFrame.size.double width = v53;
      self->__stackAlignmentFrame.size.double height = v74;
    }
  }
  *(void *)&self->_clean |= 0x400000uLL;
LABEL_44:
  double v68 = self->__stackAlignmentFrame.origin.x;
  double v69 = self->__stackAlignmentFrame.origin.y;
  double v70 = self->__stackAlignmentFrame.size.width;
  double v71 = self->__stackAlignmentFrame.size.height;
  result.size.double height = v71;
  result.size.double width = v70;
  result.origin.double y = v69;
  result.origin.double x = v68;
  return result;
}

- (CGRect)_hostParentStackAlignmentFrame
{
  double x = self->__hostParentStackAlignmentFrame.origin.x;
  double y = self->__hostParentStackAlignmentFrame.origin.y;
  double width = self->__hostParentStackAlignmentFrame.size.width;
  double height = self->__hostParentStackAlignmentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_widthFollowsPreferredContentSizeWhenEdgeAttached
{
  return self->__widthFollowsPreferredContentSizeWhenEdgeAttached;
}

- (UIRectCornerRadii)_cornerRadii
{
  if ((*((unsigned char *)&self->_clean + 13) & 0x10) == 0)
  {
    double v3 = [(_UISheetLayoutInfo *)self _metrics];
    [v3 cornerRadius];
    double v5 = v4;

    double v6 = [(_UISheetLayoutInfo *)self _containerView];
    CGFloat v7 = [v6 window];
    double v8 = [v7 windowScene];
    double v9 = [v8 _effectiveUISettings];
    double v10 = [v9 cornerRadiusConfiguration];

    double v11 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
    [v11 _cornerRadii];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(_UISheetLayoutInfo *)self _depthLevel];
    double v74 = v20;
    [(_UISheetLayoutInfo *)self _percentFullScreen];
    double v75 = v21;
    [(_UISheetLayoutInfo *)self _percentPresented];
    double v73 = v22;
    [(_UISheetLayoutInfo *)self _preferredCornerRadius];
    if (v23 == 1.79769313e308) {
      double v24 = v5;
    }
    else {
      double v24 = v23;
    }
    [(_UISheetLayoutInfo *)self _dismissCornerRadius];
    if (v25 == 1.79769313e308) {
      double v25 = v24;
    }
    double v76 = v25;
    if (v11)
    {
      [v10 topLeft];
      if (v13 != 1.79769313e308) {
        double v26 = v13;
      }
      double v27 = v19;
      double v28 = v5 * 0.5;
      double v72 = v5 * 0.5 + fmax(v5, v26) * 0.5;
      [v10 bottomLeft];
      if (v15 != 1.79769313e308) {
        double v29 = v15;
      }
      double v30 = v28 + fmax(v5, v29) * 0.5;
      [v10 bottomRight];
      if (v17 != 1.79769313e308) {
        double v31 = v17;
      }
      double v32 = v28 + fmax(v5, v31) * 0.5;
      [v10 topRight];
      double v34 = v72;
      if (v27 != 1.79769313e308) {
        double v33 = v27;
      }
      double v35 = v28 + fmax(v5, v33) * 0.5;
    }
    else
    {
      double v35 = v5 * 0.5 + v24 * 0.5;
      double v32 = v35;
      double v34 = v35;
      double v30 = v35;
    }
    double v36 = v74;
    double v37 = fmax(fmin(v74, 1.0), 0.0);
    double v38 = (1.0 - v37) * v24;
    double v39 = v38 + v37 * v34;
    double v40 = v38 + v37 * v30;
    double v41 = v38 + v37 * v32;
    double v42 = v38 + v37 * v35;
    double v43 = v75;
    if ([(_UISheetLayoutInfo *)self _isEdgeAttached])
    {
      double v44 = v73;
      if (v74 == 0.0)
      {
        [(_UISheetLayoutInfo *)self _untransformedFrame];
        double Width = CGRectGetWidth(v77);
        [(_UISheetLayoutInfo *)self _containerBounds];
        BOOL v53 = Width == CGRectGetWidth(v78);
        double v36 = v74;
        if (v53) {
          double v46 = 1.79769313e308;
        }
        else {
          double v46 = 0.0;
        }
        BOOL v47 = [(_UISheetLayoutInfo *)self _isInverted];
        if (v47) {
          double v42 = v46;
        }
        else {
          double v41 = v46;
        }
        if (v47) {
          double v39 = v46;
        }
        else {
          double v40 = v46;
        }
        double v43 = v75;
      }
    }
    else
    {
      double v44 = v73;
    }
    if ([(_UISheetLayoutInfo *)self _isExpanded] && v36 == 0.0)
    {
      [(_UISheetLayoutInfo *)self _untransformedFrame];
      double v48 = CGRectGetWidth(v79);
      [(_UISheetLayoutInfo *)self _containerBounds];
      if (v48 == CGRectGetWidth(v80)) {
        double v49 = 1.79769313e308;
      }
      else {
        double v49 = 0.0;
      }
      BOOL v50 = [(_UISheetLayoutInfo *)self _isInverted];
      if (v50) {
        double v41 = v49;
      }
      else {
        double v42 = v49;
      }
      if (v50) {
        double v40 = v49;
      }
      else {
        double v39 = v49;
      }
      double v43 = v75;
    }
    [v10 topLeft];
    double v52 = 1.79769313e308;
    BOOL v53 = v39 == 1.79769313e308 || v43 == 1.0;
    double v54 = 1.0 - v43;
    double v55 = (1.0 - v43) * v39 + v43 * v51;
    if (v53) {
      double v55 = 1.79769313e308;
    }
    if (v44 != 1.0 || v55 != 1.79769313e308)
    {
      if (v55 != 1.79769313e308) {
        double v51 = v55;
      }
      double v52 = (1.0 - v44) * v76 + v44 * v51;
    }
    [v10 bottomLeft];
    double v57 = 1.79769313e308;
    BOOL v58 = v40 == 1.79769313e308 || v43 == 1.0;
    double v59 = v54 * v40 + v43 * v56;
    if (v58) {
      double v59 = 1.79769313e308;
    }
    if (v44 != 1.0 || v59 != 1.79769313e308)
    {
      if (v59 != 1.79769313e308) {
        double v56 = v59;
      }
      double v57 = (1.0 - v44) * v76 + v44 * v56;
    }
    [v10 bottomRight];
    double v61 = 1.79769313e308;
    BOOL v62 = v41 == 1.79769313e308 || v43 == 1.0;
    double v63 = v54 * v41 + v43 * v60;
    if (v62) {
      double v63 = 1.79769313e308;
    }
    if (v44 != 1.0 || v63 != 1.79769313e308)
    {
      if (v63 != 1.79769313e308) {
        double v60 = v63;
      }
      double v61 = (1.0 - v44) * v76 + v44 * v60;
    }
    [v10 topRight];
    double v65 = 1.79769313e308;
    BOOL v66 = v42 == 1.79769313e308 || v43 == 1.0;
    double v67 = v54 * v42 + v43 * v64;
    if (v66) {
      double v67 = 1.79769313e308;
    }
    if (v44 != 1.0 || v67 != 1.79769313e308)
    {
      if (v67 != 1.79769313e308) {
        double v64 = v67;
      }
      double v65 = (1.0 - v44) * v76 + v44 * v64;
    }
    self->__cornerRadii.double topLeft = v52;
    self->__cornerRadii.double bottomLeft = v57;
    self->__cornerRadii.double bottomRight = v61;
    self->__cornerRadii.double topRight = v65;
    *((_DWORD *)&self->_clean + 3) |= 0x1000u;
  }
  double topLeft = self->__cornerRadii.topLeft;
  double bottomLeft = self->__cornerRadii.bottomLeft;
  double bottomRight = self->__cornerRadii.bottomRight;
  double topRight = self->__cornerRadii.topRight;
  result.double topRight = topRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topLeft = topLeft;
  return result;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (double)_percentPresented
{
  if ((*((unsigned char *)&self->_clean + 12) & 0x20) != 0) {
    return self->__percentPresented;
  }
  [(_UISheetLayoutInfo *)self _currentOffset];
  double v4 = v3;
  [(_UISheetLayoutInfo *)self _dismissOffset];
  double v6 = v5;
  [(_UISheetLayoutInfo *)self _smallestNonDismissDetentOffset];
  double result = fmax(fmin((v4 - v6) / (v7 - v6), 1.0), 0.0);
  self->__percentPresented = result;
  *((_DWORD *)&self->_clean + 3) |= 0x20u;
  return result;
}

- (CGAffineTransform)_transform
{
  double v4 = self;
  if ((BYTE5(self->c) & 0x40) == 0)
  {
    double v6 = self + 28;
    int v7 = [(CGAffineTransform *)self _isHosting];
    if (v7
      && ([(CGAffineTransform *)v4 _childLayoutInfo],
          (double v3 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v30 = MEMORY[0x1E4F1DAB8];
      long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v6->a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v4[28].c = v31;
      *(_OWORD *)&v4[28].tdouble x = *(_OWORD *)(v30 + 32);
    }
    else
    {
      double v8 = [(CGAffineTransform *)v4 _presentedViewController];
      double v9 = [v8 view];
      [(CGAffineTransform *)v4 _untransformedFrame];
      CGFloat v33 = v11;
      CGFloat v34 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [(CGAffineTransform *)v4 _fullHeightUntransformedFrameForDepthLevel];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      [(CGAffineTransform *)v4 _stackAlignmentFrame];
      double MinY = CGRectGetMinY(v36);
      [(CGAffineTransform *)v4 _depthLevel];
      double v26 = v25;
      if ([(CGAffineTransform *)v4 _isEdgeAttached]) {
        int v27 = 1;
      }
      else {
        int v27 = [(CGAffineTransform *)v4 _peeksWhenFloating];
      }
      double v28 = [(CGAffineTransform *)v4 _metrics];
      _UISheetTransformForMetrics((uint64_t)v35, v9, v27, v28, v34, v33, v13, v15, v17, v19, v21, v23, MinY, v26);
      long long v29 = v35[1];
      *(_OWORD *)&v6->a = v35[0];
      *(_OWORD *)&v4[28].c = v29;
      *(_OWORD *)&v4[28].tdouble x = v35[2];

      if (!v7) {
        goto LABEL_11;
      }
    }

LABEL_11:
    HIDWORD(v4->c) |= 0x4000u;
  }
  long long v32 = *(_OWORD *)&v4[28].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v4[28].a;
  *(_OWORD *)&retstr->c = v32;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v4[28].tx;
  return self;
}

- (CGRect)_untransformedFrame
{
  if ((*((unsigned char *)&self->_clean + 13) & 1) == 0)
  {
    BOOL v3 = [(_UISheetLayoutInfo *)self _dismissesHorizontally];
    [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
    CGFloat rect = v4;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    if (v3) {
      [(_UISheetLayoutInfo *)self _rawCurrentOffset];
    }
    else {
      [(_UISheetLayoutInfo *)self _currentOffset];
    }
    double v13 = v11;
    double v14 = v12;
    int v15 = [(_UISheetLayoutInfo *)self _isEdgeAttached];
    int v16 = [(_UISheetLayoutInfo *)self _isInverted];
    int v17 = [(_UISheetLayoutInfo *)self _isExpanded];
    [(_UISheetLayoutInfo *)self _offsetAdjustment];
    double v19 = v18;
    double v20 = [(_UISheetLayoutInfo *)self _activeDetents];
    [(_UISheetLayoutInfo *)self _smallestNonDismissDetentOffset];
    double v22 = v21;
    CGFloat v23 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
    [v23 displayScale];
    double v25 = v24;
    [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
    self->__untransformedFrame.origin.double x = _UISheetLayoutInfoUntransformedFrame(v15, v3, v16, v17, v20, v13, v14, v19, v22, v25, v27, v28, v29, rect, v6, v8, v10, v26);
    self->__untransformedFrame.origin.double y = v30;
    self->__untransformedFrame.size.double width = v31;
    self->__untransformedFrame.size.double height = v32;

    [(_UISheetLayoutInfo *)self _dismissSourceFrame];
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    if (![(_UISheetLayoutInfo *)self _isEffectivePresented]
      && ![(_UISheetLayoutInfo *)self _isDragging])
    {
      v50.origin.double x = v34;
      v50.origin.double y = v36;
      v50.size.double width = v38;
      v50.size.double height = v40;
      if (!CGRectIsNull(v50))
      {
        v51.origin.double x = v34;
        v51.origin.double y = v36;
        v51.size.double width = v38;
        v51.size.double height = v40;
        double MinX = CGRectGetMinX(v51);
        v52.origin.double x = rect;
        v52.origin.double y = v6;
        v52.size.double width = v8;
        v52.size.double height = v10;
        self->__untransformedFrame.origin.double x = self->__untransformedFrame.origin.x + MinX - CGRectGetMinX(v52);
        BOOL v42 = [(_UISheetLayoutInfo *)self _isInverted];
        double v43 = 0.0;
        if (v42)
        {
          double Height = CGRectGetHeight(self->__untransformedFrame);
          v53.origin.double x = v34;
          v53.origin.double y = v36;
          v53.size.double width = v38;
          v53.size.double height = v40;
          double v43 = Height - CGRectGetHeight(v53);
        }
        self->__untransformedFrame.origin.double y = v43 + self->__untransformedFrame.origin.y;
        self->__untransformedFrame.size.double width = v38;
        self->__untransformedFrame.size.double height = v40;
      }
    }
    *((_DWORD *)&self->_clean + 3) |= 0x100u;
  }
  double x = self->__untransformedFrame.origin.x;
  double y = self->__untransformedFrame.origin.y;
  double width = self->__untransformedFrame.size.width;
  double v48 = self->__untransformedFrame.size.height;
  result.size.double height = v48;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)_currentOffset
{
  if ((*((unsigned char *)&self->_clean + 12) & 2) == 0)
  {
    [(_UISheetLayoutInfo *)self _rawCurrentOffset];
    self->__currentOffset.double x = v3;
    self->__currentOffset.double y = v4;
    if (![(_UISheetLayoutInfo *)self _isEffectivePresented]
      && ![(_UISheetLayoutInfo *)self _isEffectiveDismissible])
    {
      [(_UISheetLayoutInfo *)self _dismissOffset];
      double v6 = v5;
      [(_UISheetLayoutInfo *)self _offsetForCurrentActiveDetent];
      self->__currentOffset.double y = self->__currentOffset.y + v6 - v7;
    }
    *((_DWORD *)&self->_clean + 3) |= 2u;
  }
  double x = self->__currentOffset.x;
  double y = self->__currentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)_depthLevel
{
  if ((*((unsigned char *)&self->_clean + 1) & 0x20) != 0) {
    return self->__depthLevel;
  }
  BOOL v3 = [(_UISheetLayoutInfo *)self _isEffectivePresented];
  double result = 0.0;
  if (v3)
  {
    if ([(_UISheetLayoutInfo *)self _hasParentSheet]) {
      BOOL v5 = [(_UISheetLayoutInfo *)self _stacksWithParent];
    }
    else {
      BOOL v5 = [(_UISheetLayoutInfo *)self _isEdgeAttached];
    }
    BOOL v6 = v5;
    [(_UISheetLayoutInfo *)self _percentFullHeight];
    if (v7 == 0.0
      && v6
      && ![(_UISheetLayoutInfo *)self _isHidingUnderneathDescendantForDepthLevel])
    {
      [(_UISheetLayoutInfo *)self _parentDepthLevel];
    }
    else
    {
      [(_UISheetLayoutInfo *)self _proposedDepthLevel];
    }
  }
  self->__depthLevel = result;
  *(void *)&self->_clean |= 0x2000uLL;
  return result;
}

- (double)_offsetAdjustment
{
  if ((*((unsigned char *)&self->_clean + 12) & 0x10) == 0)
  {
    int v3 = [(_UISheetLayoutInfo *)self _isInverted];
    BOOL v4 = [(_UISheetLayoutInfo *)self _isHidingUnderneathDescendant];
    BOOL v5 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
    if (![(_UISheetLayoutInfo *)self _isEffectivePresented]
      || !v5
      || v3 != [v5 _isInverted])
    {
      self->__double offsetAdjustment = 0.0;
LABEL_17:
      *((_DWORD *)&self->_clean + 3) |= 0x10u;

      return self->__offsetAdjustment;
    }
    double v6 = 1.0;
    if (!v4)
    {
      [(_UISheetLayoutInfo *)self _percentFullHeight];
      double v6 = 1.0 - v7;
    }
    [v5 _nonFullHeightOffset];
    double v9 = v8;
    [(_UISheetLayoutInfo *)self _offsetForCurrentActiveDetent];
    double offsetAdjustment = v6 * (v9 - v10);
    self->__double offsetAdjustment = offsetAdjustment;
    if (v4)
    {
      if (![(_UISheetLayoutInfo *)self _isAnyDescendantTransitioning]) {
        goto LABEL_17;
      }
      double offsetAdjustment = self->__offsetAdjustment;
    }
    if (offsetAdjustment <= 0.0) {
      double v12 = offsetAdjustment;
    }
    else {
      double v12 = 0.0;
    }
    double v13 = fmax(offsetAdjustment, 0.0);
    if (v3) {
      double v13 = v12;
    }
    self->__double offsetAdjustment = v13;
    goto LABEL_17;
  }
  return self->__offsetAdjustment;
}

- (BOOL)_isEffectivePresented
{
  v2 = self;
  if (*(unsigned char *)&self->_clean)
  {
    LOBYTE(self) = self->__effectivePresented;
  }
  else
  {
    LODWORD(self) = [(_UISheetLayoutInfo *)self _isPresented];
    if (self) {
      LOBYTE(self) = ![(_UISheetLayoutInfo *)v2 _isHidden];
    }
    v2->__effectivePresented = (char)self;
    *(void *)&v2->_clean |= 1uLL;
  }
  return (char)self;
}

- (BOOL)_isHidingUnderneathDescendant
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_clean & 0x10) == 0)
  {
    self->__hidingUnderneathDescendant = 0;
    int v3 = [(_UISheetLayoutInfo *)self _ancestorSheetIDs];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v4 = [(_UISheetLayoutInfo *)self _descendantHiddenAncestorSheetIDs];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([v3 containsObject:*(void *)(*((void *)&v10 + 1) + 8 * i)])
          {
            self->__hidingUnderneathDescendant = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    *(void *)&self->_clean |= 0x10uLL;
  }
  return self->__hidingUnderneathDescendant;
}

- (CGRect)_dismissSourceFrame
{
  double x = self->__dismissSourceFrame.origin.x;
  double y = self->__dismissSourceFrame.origin.y;
  double width = self->__dismissSourceFrame.size.width;
  double height = self->__dismissSourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_dismissOffset
{
  if ((*((unsigned char *)&self->_clean + 3) & 4) != 0) {
    return self->__dismissOffset;
  }
  [(_UISheetLayoutInfo *)self _containerBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(_UISheetLayoutInfo *)self _dismissSourceFrame];
  double result = _UISheetDismissOffset([(_UISheetLayoutInfo *)self _isInverted], v4, v6, v8, v10, v11, v12, v13, v14);
  self->__dismissOffset = result;
  *(void *)&self->_clean |= 0x4000000uLL;
  return result;
}

- (CGRect)_frameOfPresentedViewInContainerView
{
  if ((*((unsigned char *)&self->_clean + 13) & 4) == 0)
  {
    if ([(_UISheetLayoutInfo *)self _isHidden]) {
      [(_UISheetLayoutInfo *)self _dismissOffset];
    }
    else {
      [(_UISheetLayoutInfo *)self _offsetForCurrentActiveDetent];
    }
    double v4 = v3;
    int v5 = [(_UISheetLayoutInfo *)self _isEdgeAttached];
    char v6 = [(_UISheetLayoutInfo *)self _dismissesHorizontally];
    int v7 = [(_UISheetLayoutInfo *)self _isInverted];
    int v8 = [(_UISheetLayoutInfo *)self _isExpanded];
    [(_UISheetLayoutInfo *)self _offsetAdjustment];
    double v10 = v9;
    CGFloat v11 = [(_UISheetLayoutInfo *)self _activeDetents];
    [(_UISheetLayoutInfo *)self _smallestNonDismissDetentOffset];
    double v13 = v12;
    CGFloat v14 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
    [v14 displayScale];
    double v16 = v15;
    [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
    self->__frameOfPresentedViewInContainerView.origin.double x = _UISheetLayoutInfoUntransformedFrame(v5, v6, v7, v8, v11, 0.0, v4, v10, v13, v16, v26, v27, v28, v18, v20, v22, v24, v25);
    self->__frameOfPresentedViewInContainerView.origin.double y = v29;
    self->__frameOfPresentedViewInContainerView.size.double width = v30;
    self->__frameOfPresentedViewInContainerView.size.double height = v31;

    *((_DWORD *)&self->_clean + 3) |= 0x400u;
  }
  double x = self->__frameOfPresentedViewInContainerView.origin.x;
  double y = self->__frameOfPresentedViewInContainerView.origin.y;
  double width = self->__frameOfPresentedViewInContainerView.size.width;
  double height = self->__frameOfPresentedViewInContainerView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UITraitCollection)_containerTraitCollection
{
  return self->__containerTraitCollection;
}

- (BOOL)_dismissesHorizontally
{
  v2 = self;
  if ((*((unsigned char *)&self->_clean + 1) & 0x80) != 0)
  {
    LOBYTE(self) = self->__dismissesHorizontally;
  }
  else
  {
    self = [(_UISheetLayoutInfo *)self _horizontalAlignment];
    if (self) {
      LOBYTE(self) = ![(_UISheetLayoutInfo *)v2 _isEdgeAttached];
    }
    v2->__dismissesHorizontalldouble y = (char)self;
    *(void *)&v2->_clean |= 0x8000uLL;
  }
  return (char)self;
}

- (BOOL)_isExpanded
{
  v2 = self;
  if ((*((unsigned char *)&self->_clean + 12) & 4) != 0)
  {
    LOBYTE(self) = self->__expanded;
  }
  else
  {
    LODWORD(self) = [(_UISheetLayoutInfo *)self _hasActiveFullDetent];
    if (self)
    {
      LODWORD(self) = [(_UISheetLayoutInfo *)v2 _isEdgeAttached];
      if (self)
      {
        if ([(_UISheetLayoutInfo *)v2 _isFunctionallyFullScreen])
        {
          LOBYTE(self) = 0;
        }
        else
        {
          [(_UISheetLayoutInfo *)v2 _currentOffset];
          double v4 = v3;
          [(_UISheetLayoutInfo *)v2 _containerSafeAreaInsets];
          LOBYTE(self) = v4 <= v5;
        }
      }
    }
    v2->__expanded = (char)self;
    *((_DWORD *)&v2->_clean + 3) |= 4u;
  }
  return (char)self;
}

- (int64_t)_horizontalAlignment
{
  return self->__horizontalAlignment;
}

- (CGRect)_hostedFrameOfPresentedViewInContainerView
{
  if ([(_UISheetLayoutInfo *)self _isHosting]) {
    [(_UISheetLayoutInfo *)self _containerBounds];
  }
  else {
    [(_UISheetLayoutInfo *)self _frameOfPresentedViewInContainerView];
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)_isHosting
{
  return self->__hosting;
}

- (double)_preferredCornerRadius
{
  return self->__preferredCornerRadius;
}

- (double)_dismissCornerRadius
{
  return self->__dismissCornerRadius;
}

- (BOOL)_isInverted
{
  if ((*((unsigned char *)&self->_clean + 2) & 2) != 0) {
    return self->__inverted;
  }
  BOOL result = ![(_UISheetLayoutInfo *)self _isEdgeAttached]
        && [(_UISheetLayoutInfo *)self _wantsInvertedWhenFloating];
  self->__inverted = result;
  *(void *)&self->_clean |= 0x20000uLL;
  return result;
}

- (BOOL)_isFunctionallyFullScreen
{
  if ((*((unsigned char *)&self->_clean + 2) & 8) != 0) {
    return self->__functionallyFullScreen;
  }
  BOOL result = [(_UISheetLayoutInfo *)self _isForcedFullScreen]
        || [(_UISheetLayoutInfo *)self _wantsFullScreen];
  self->__functionallyFullScreen = result;
  *(void *)&self->_clean |= 0x80000uLL;
  return result;
}

- (BOOL)_shouldDimmingIgnoreTouches
{
  if ((*((unsigned char *)&self->_clean + 14) & 0x40) != 0) {
    return self->__shouldDimmingIgnoreTouches;
  }
  if ([(_UISheetLayoutInfo *)self _isEdgeAttached])
  {
    BOOL v3 = [(_UISheetLayoutInfo *)self _isInverted];
    [(_UISheetLayoutInfo *)self _currentOffset];
    double v5 = v4;
    if (v3)
    {
      [(_UISheetLayoutInfo *)self _containerBounds];
      double Height = CGRectGetHeight(v11);
      [(_UISheetLayoutInfo *)self _margins];
      if (v5 < Height - v7) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    [(_UISheetLayoutInfo *)self _margins];
    if (v5 <= v9)
    {
LABEL_10:
      [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
      double Width = CGRectGetWidth(v12);
      [(_UISheetLayoutInfo *)self _containerBounds];
      if (Width != CGRectGetWidth(v13)
        && [(_UISheetLayoutInfo *)self _shouldDismissWhenTappedOutside])
      {
        goto LABEL_12;
      }
LABEL_13:
      BOOL result = 1;
      goto LABEL_14;
    }
  }
  else if (![(_UISheetLayoutInfo *)self _shouldDismissWhenTappedOutside])
  {
    goto LABEL_13;
  }
LABEL_12:
  BOOL result = [(_UISheetLayoutInfo *)self _isDragging];
LABEL_14:
  self->__shouldDimmingIgnoreTouches = result;
  *((_DWORD *)&self->_clean + 3) |= 0x400000u;
  return result;
}

- (BOOL)_isDimmingEnabled
{
  if (*((unsigned char *)&self->_clean + 15)) {
    return self->__dimmingEnabled;
  }
  [(_UISheetLayoutInfo *)self _percentDimmedFromOffset];
  BOOL result = v3 > 0.0;
  self->__dimmingEnabled = v3 > 0.0;
  *((_DWORD *)&self->_clean + 3) |= 0x1000000u;
  return result;
}

- (double)_shadowRadius
{
  return self->__shadowRadius;
}

- (BOOL)_isInteractionEnabled
{
  if ((*((unsigned char *)&self->_clean + 14) & 8) == 0)
  {
    if (([(_UISheetLayoutInfo *)self _isEffectivePresented]
       || [(_UISheetLayoutInfo *)self _presentsWithGesture])
      && (([(_UISheetLayoutInfo *)self _percentFullScreen], v3 != 1.0)
       || [(_UISheetLayoutInfo *)self _allowsInteractiveDismissWhenFullScreen]))
    {
      if ([(_UISheetLayoutInfo *)self _dismissesHorizontally])
      {
        double v4 = [(_UISheetLayoutInfo *)self _activeDetents];
        self->__interactionEnabled = [v4 count] != 1;

LABEL_11:
        *((_DWORD *)&self->_clean + 3) |= 0x80000u;
        return self->__interactionEnabled;
      }
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = 0;
    }
    self->__interactionEnabled = v5;
    goto LABEL_11;
  }
  return self->__interactionEnabled;
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  if ((*((unsigned char *)&self->_clean + 14) & 0x20) != 0)
  {
    return self->__shouldPresentedViewControllerControlStatusBarAppearance;
  }
  else
  {
    if ([(_UISheetLayoutInfo *)self _isHosting])
    {
      BOOL v3 = 0;
    }
    else
    {
      [(_UISheetLayoutInfo *)self _untransformedFrame];
      CGFloat x = v24.origin.x;
      CGFloat y = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;
      double MidX = CGRectGetMidX(v24);
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v25);
      memset(&v23, 0, sizeof(v23));
      CGAffineTransformMakeTranslation(&t1, -MidX, -MidY);
      [(_UISheetLayoutInfo *)self _transform];
      CGAffineTransformConcat(&v22, &t1, &t2);
      CGAffineTransformMakeTranslation(&v19, MidX, MidY);
      CGAffineTransformConcat(&v23, &v22, &v19);
      CGAffineTransform v18 = v23;
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      CGRect v27 = CGRectApplyAffineTransform(v26, &v18);
      double MinY = CGRectGetMinY(v27);
      CGRect v11 = [(_UISheetLayoutInfo *)self _containerView];
      CGRect v12 = [v11 window];
      CGRect v13 = [v12 windowScene];
      CGFloat v14 = [v13 statusBarManager];
      [v14 defaultStatusBarHeight];
      double v16 = v15 * 0.5;

      BOOL v3 = MinY <= v16;
    }
    self->__shouldPresentedViewControllerControlStatusBarAppearance = v3;
    *((_DWORD *)&self->_clean + 3) |= 0x200000u;
  }
  return v3;
}

- (double)_shadowOpacity
{
  if ((*((unsigned char *)&self->_clean + 14) & 2) != 0) {
    return self->__shadowOpacity;
  }
  [(_UISheetLayoutInfo *)self _percentDimmedFromOffset];
  double v4 = v3;
  BOOL v5 = [(_UISheetLayoutInfo *)self _isHosting];
  double result = 0.0;
  if (!v5)
  {
    [(_UISheetLayoutInfo *)self _preferredShadowOpacity];
    double v8 = (1.0 - v4) * v7;
    [(_UISheetLayoutInfo *)self _percentPresented];
    double result = v8 * v9;
  }
  self->__shadowOpacitCGFloat y = result;
  *((_DWORD *)&self->_clean + 3) |= 0x20000u;
  return result;
}

- (double)_magicShadowOpacity
{
  return self->__magicShadowOpacity;
}

- (double)_percentDimmed
{
  if ((*((unsigned char *)&self->_clean + 14) & 1) == 0)
  {
    if ([(_UISheetPresentationMetrics *)self->__metrics wantsDimming])
    {
      double v3 = [(_UISheetLayoutInfo *)self _parentLayoutInfo];
      [v3 _percentFullScreen];
      double v5 = v4;
      [(_UISheetLayoutInfo *)self _percentDimmedFromOffset];
      double v7 = v6;
      if ([v3 _stacksWithChild])
      {
        self->__percentDimmed = 0.0;
        if (v5 != 1.0
          || [(_UISheetLayoutInfo *)self _isEdgeAttached]
          && [v3 _scalesDownBehindDescendants])
        {
          double v8 = 0.0;
          if ([(_UISheetLayoutInfo *)self _stacksWithChild])
          {
            double v9 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
            [v9 _percentDimmedFromOffset];
            double v8 = v10 * 0.2;
          }
          double v7 = v7 * 0.6 + v8;
        }
        self->__confinedPercentDimmed = v7;
        double v11 = 0.0;
      }
      else
      {
        if (v5 == 1.0)
        {
          self->__percentDimmed = 0.0;
          self->__confinedPercentDimmed = v7;
        }
        else
        {
          self->__percentDimmed = v7;
          self->__confinedPercentDimmed = 0.0;
        }
        double v11 = 0.0;
        if (![(_UISheetLayoutInfo *)self _isHosting])
        {
          [(_UISheetLayoutInfo *)self _percentFullScreen];
          if (v12 != 1.0) {
            double v11 = v7;
          }
        }
      }
      self->__magicShadowOpacitCGFloat y = v11;
      CGRect v13 = [v3 _presentedViewController];
      CGFloat v14 = [v13 traitCollection];

      double v15 = 0.0;
      if (v14 && [v14 userInterfaceStyle] == 2)
      {
        if ([v14 userInterfaceLevel]) {
          double v15 = 0.0;
        }
        else {
          double v15 = 1.0 - v5;
        }
      }
      self->__confinedPercentLightened = v15;
    }
    else
    {
      self->__confinedPercentLightened = 0.0;
      self->__percentDimmed = 0.0;
      self->__confinedPercentDimmed = 0.0;
    }
    *((_DWORD *)&self->_clean + 3) |= 0x10000u;
  }
  return self->__percentDimmed;
}

- (BOOL)_isGrabberBlurEnabled
{
  return self->__grabberBlurEnabled;
}

- (UIRectCornerRadii)_hostedCornerRadii
{
  if ((*((unsigned char *)&self->_clean + 13) & 0x20) != 0)
  {
    double topLeft = self->__hostedCornerRadii.topLeft;
    double bottomLeft = self->__hostedCornerRadii.bottomLeft;
    double bottomRight = self->__hostedCornerRadii.bottomRight;
    double topRight = self->__hostedCornerRadii.topRight;
  }
  else
  {
    if ([(_UISheetLayoutInfo *)self _isHosting])
    {
      double topLeft = 1.79769313e308;
      double bottomLeft = 1.79769313e308;
      double bottomRight = 1.79769313e308;
      double topRight = 1.79769313e308;
    }
    else
    {
      [(_UISheetLayoutInfo *)self _cornerRadii];
    }
    self->__hostedCornerRadii.double topLeft = topLeft;
    self->__hostedCornerRadii.double bottomLeft = bottomLeft;
    self->__hostedCornerRadii.double bottomRight = bottomRight;
    self->__hostedCornerRadii.double topRight = topRight;
    *((_DWORD *)&self->_clean + 3) |= 0x2000u;
  }
  result.double topRight = topRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topLeft = topLeft;
  return result;
}

- (double)_grabberAlpha
{
  if ((*((unsigned char *)&self->_clean + 15) & 2) != 0) {
    return self->__grabberAlpha;
  }
  double v3 = 0.0;
  if ([(_UISheetLayoutInfo *)self _wantsGrabber]
    && ![(_UISheetLayoutInfo *)self _isHosting])
  {
    double v4 = [(_UISheetLayoutInfo *)self _childLayoutInfo];

    if (v4)
    {
      double v5 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
      [v5 _percentDimmedFromOffset];
      double v3 = 1.0 - v6;
    }
    else
    {
      double v3 = 1.0;
    }
  }
  [(_UISheetLayoutInfo *)self _percentFullScreen];
  double result = v3 * (1.0 - v8);
  self->__grabberAlpha = result;
  *((_DWORD *)&self->_clean + 3) |= 0x2000000u;
  return result;
}

- (double)_percentFullScreen
{
  if ((*((unsigned char *)&self->_clean + 2) & 0x10) != 0) {
    return self->__percentFullScreen;
  }
  double v3 = [(_UISheetLayoutInfo *)self _metrics];
  char v4 = [v3 exclusivelyUsesZPositionForTransform];

  BOOL v5 = [(_UISheetLayoutInfo *)self _isForcedFullScreen];
  double result = 1.0;
  if (!v5 && (v4 & 1) == 0)
  {
    BOOL v7 = [(_UISheetLayoutInfo *)self _wantsFullScreen];
    double result = 0.0;
    if (v7)
    {
      [(_UISheetLayoutInfo *)self _depthLevel];
      double result = fmax(fmin(1.0 - v8, 1.0), 0.0);
    }
  }
  self->__percentFullScreen = result;
  *(void *)&self->_clean |= 0x100000uLL;
  return result;
}

- (BOOL)_isForcedFullScreen
{
  if ((*((unsigned char *)&self->_clean + 2) & 4) == 0)
  {
    double v3 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
    if ([v3 verticalSizeClass] == 1
      && ![(_UISheetLayoutInfo *)self _wantsEdgeAttachedInCompactHeight])
    {
      if ([v3 horizontalSizeClass] == 1) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = ![(_UISheetLayoutInfo *)self _wantsFloatingInRegularWidthCompactHeight];
      }
    }
    else
    {
      BOOL v4 = 0;
    }
    self->__forcedFullScreen = v4;
    *(void *)&self->_clean |= 0x40000uLL;
  }
  return self->__forcedFullScreen;
}

- (double)_confinedPercentLightened
{
  return self->__confinedPercentLightened;
}

- (double)_confinedPercentDimmed
{
  return self->__confinedPercentDimmed;
}

- (BOOL)_wantsGrabber
{
  return self->__wantsGrabber;
}

- (double)_grabberSpacing
{
  return self->__grabberSpacing;
}

- (_UISheetLayoutInfo)_parentLayoutInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parentLayoutInfo);
  return (_UISheetLayoutInfo *)WeakRetained;
}

- (int64_t)_mode
{
  return self->__mode;
}

- (_UISheetPresentationControllerAppearance)_standardAppearance
{
  return self->__standardAppearance;
}

- (_UISheetPresentationControllerAppearance)_floatingAppearance
{
  return self->__floatingAppearance;
}

- (_UISheetPresentationControllerAppearance)_edgeAttachedCompactHeightAppearance
{
  return self->__edgeAttachedCompactHeightAppearance;
}

- (BOOL)_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge
{
  return self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge;
}

- (BOOL)_wantsEdgeAttachedInCompactHeight
{
  return self->__wantsEdgeAttachedInCompactHeight;
}

- (BOOL)_prefersScrollingResizesWhenDetentDirectionIsDown
{
  return self->__prefersScrollingResizesWhenDetentDirectionIsDown;
}

- (double)_preferredShadowOpacity
{
  return self->__preferredShadowOpacity;
}

- (BOOL)_peeksWhenFloating
{
  return self->__peeksWhenFloating;
}

- (BOOL)_insetsContentViewForGrabber
{
  return self->__insetsContentViewForGrabber;
}

- (BOOL)_wantsInvertedWhenFloating
{
  return self->__wantsInvertedWhenFloating;
}

- (double)_additionalMinimumTopInset
{
  return self->__additionalMinimumTopInset;
}

- (BOOL)_isHidden
{
  return self->__hidden;
}

- (UIViewController)_presentedViewController
{
  return self->__presentedViewController;
}

- (CGRect)_fullHeightUntransformedFrameForDepthLevel
{
  if ((*((unsigned char *)&self->_clean + 3) & 2) != 0)
  {
    double x = self->__fullHeightUntransformedFrameForDepthLevel.origin.x;
    double y = self->__fullHeightUntransformedFrameForDepthLevel.origin.y;
    double width = self->__fullHeightUntransformedFrameForDepthLevel.size.width;
    double height = self->__fullHeightUntransformedFrameForDepthLevel.size.height;
  }
  else
  {
    if ([(_UISheetLayoutInfo *)self _stacksWithParent]
      && ([(_UISheetLayoutInfo *)self _parentDepthLevel],
          double v4 = v3,
          [(_UISheetLayoutInfo *)self _depthLevel],
          v4 == v5))
    {
      [(_UISheetLayoutInfo *)self _parentFullHeightUntransformedFrameForDepthLevel];
    }
    else
    {
      [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
    }
    self->__fullHeightUntransformedFrameForDepthLevel.origin.double x = x;
    self->__fullHeightUntransformedFrameForDepthLevel.origin.double y = y;
    self->__fullHeightUntransformedFrameForDepthLevel.size.double width = width;
    self->__fullHeightUntransformedFrameForDepthLevel.size.double height = height;
    *(void *)&self->_clean |= 0x2000000uLL;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_offsetForCurrentActiveDetent
{
  if (!self->_clean.offsetForCurrentActiveDetent)
  {
    double v3 = [(_UISheetLayoutInfo *)self _activeDetents];
    double v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[_UISheetLayoutInfo _indexOfCurrentActiveDetent](self, "_indexOfCurrentActiveDetent"));
    [v4 _value];
    self->__offsetForCurrentActiveDetent = v5;

    self->_clean.offsetForCurrentActiveDetent = 1;
  }
  return self->__offsetForCurrentActiveDetent;
}

- (BOOL)_isModelDimmingEnabled
{
  if ((*((unsigned char *)&self->_clean + 14) & 0x80) != 0) {
    return self->__modelDimmingEnabled;
  }
  int64_t v3 = [(_UISheetLayoutInfo *)self _indexOfActiveDimmingDetent];
  BOOL v4 = v3 != 0x7FFFFFFFFFFFFFFFLL
    && [(_UISheetLayoutInfo *)self _indexOfCurrentActiveDetent] <= v3;
  self->__modelDimmingEnabled = v4;
  double v6 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
  int v7 = [v6 _isModelDimmingEnabled];

  if (![(_UISheetLayoutInfo *)self _isHidingUnderneathDescendant])
  {
    if (self->__modelDimmingEnabled) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v7;
    }
    self->__modelDimmingEnabled = v8;
    if (!v8) {
      goto LABEL_8;
    }
LABEL_13:
    BOOL result = [(_UISheetLayoutInfo *)self _isEffectivePresented];
    goto LABEL_14;
  }
  self->__modelDimmingEnabled = v7;
  if (v7) {
    goto LABEL_13;
  }
LABEL_8:
  BOOL result = 0;
LABEL_14:
  self->__modelDimmingEnabled = result;
  *((_DWORD *)&self->_clean + 3) |= 0x800000u;
  return result;
}

- (int64_t)_indexOfCurrentActiveDetent
{
  id v3 = [(_UISheetLayoutInfo *)self _activeDetents];
  return self->__indexOfCurrentActiveDetent;
}

- (BOOL)_isPresented
{
  return self->__presented;
}

- (BOOL)_hasActiveFullDetent
{
  return self->__hasActiveFullDetent;
}

- (double)_alpha
{
  if ((*((unsigned char *)&self->_clean + 14) & 4) != 0) {
    return self->__alpha;
  }
  id v3 = [(_UISheetLayoutInfo *)self _metrics];
  double v4 = 1.0;
  if ([v3 fadeOutIfAnyDescendantWantsFullScreen])
  {
    double v5 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
    double v4 = (double)([v5 _anyDescendantWantsFullScreen] ^ 1);
  }
  self->__alpha = v4;
  *((_DWORD *)&self->_clean + 3) |= 0x40000u;
  return v4;
}

- (CGRect)_sourceFrame
{
  double x = self->__sourceFrame.origin.x;
  double y = self->__sourceFrame.origin.y;
  double width = self->__sourceFrame.size.width;
  double height = self->__sourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_presentsWithGesture
{
  return self->__presentsWithGesture;
}

- (BOOL)_isScrollInteractionEnabled
{
  if ((*((unsigned char *)&self->_clean + 14) & 0x10) != 0) {
    return self->__scrollInteractionEnabled;
  }
  if ([(_UISheetLayoutInfo *)self _isInverted]) {
    BOOL result = [(_UISheetLayoutInfo *)self _prefersScrollingResizesWhenDetentDirectionIsDown];
  }
  else {
    BOOL result = 1;
  }
  self->__scrollInteractionEnabled = result;
  *((_DWORD *)&self->_clean + 3) |= 0x100000u;
  return result;
}

- (double)_parentDepthLevel
{
  id v3 = [(_UISheetLayoutInfo *)self _parentLayoutInfo];
  double v4 = v3;
  if (v3) {
    [v3 _depthLevel];
  }
  else {
    [(_UISheetLayoutInfo *)self _hostParentDepthLevel];
  }
  double v6 = v5;

  return v6;
}

- (CGRect)_parentFullHeightUntransformedFrameForDepthLevel
{
  id v3 = [(_UISheetLayoutInfo *)self _parentLayoutInfo];
  double v4 = v3;
  if (v3) {
    [v3 _fullHeightUntransformedFrameForDepthLevel];
  }
  else {
    [(_UISheetLayoutInfo *)self _hostParentFullHeightUntransformedFrameForDepthLevel];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (BOOL)_allowsInteractiveDismissWhenFullScreen
{
  return self->__allowsInteractiveDismissWhenFullScreen;
}

- (BOOL)_supportsAttachedEdge
{
  if ([(_UISheetLayoutInfo *)self _alwaysAllowsEdgeAttached]) {
    return 1;
  }
  double v4 = [(_UISheetLayoutInfo *)self _metrics];
  double v5 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
  char v6 = [v4 supportsEdgeAttachedForTraitCollection:v5];

  return v6;
}

- (BOOL)_alwaysAllowsEdgeAttached
{
  return self->__alwaysAllowsEdgeAttached;
}

- (void)_setScreenSize:(CGSize)a3
{
  if (self->__screenSize.width != a3.width || self->__screenSize.height != a3.height)
  {
    self->__screenSize = a3;
    _UISheetLayoutInfoDirtyPreferredSize(self);
  }
}

- (void)_layout
{
  v2 = self;
  id v3 = [(_UISheetLayoutInfo *)v2 _childLayoutInfo];

  if (v3)
  {
    do
    {
      double v4 = [(_UISheetLayoutInfo *)v2 _childLayoutInfo];

      double v5 = [(_UISheetLayoutInfo *)v4 _childLayoutInfo];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    double v4 = v2;
  }
  char v6 = v4;
  double v13 = v6;
  if (v6)
  {
    double v7 = v6;
    do
    {
      double v8 = [v7 _delegate];
      [v8 _sheetLayoutInfoPrelayout:v7];

      uint64_t v9 = [v7 _parentLayoutInfo];

      double v7 = (void *)v9;
    }
    while (v9);
    double v10 = v13;
    do
    {
      double v11 = [(_UISheetLayoutInfo *)v10 _delegate];
      [v11 _sheetLayoutInfoLayout:v10];

      uint64_t v12 = [(_UISheetLayoutInfo *)v10 _parentLayoutInfo];

      double v10 = (_UISheetLayoutInfo *)v12;
    }
    while (v12);
  }
}

- (void)_setChildSheetLayoutInfo:(id)a3
{
  double v5 = (_UISheetLayoutInfo *)a3;
  if (self->__childLayoutInfo != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->__childLayoutInfo, a3);
    char v6 = self;
    _UISheetLayoutInfoDirtyAnyDescendantTransitioning(v6);
    _UISheetLayoutInfoDirtyDescendantHiddenAncestorSheetIDs(v6);
    _UISheetLayoutInfoDirtyProposedDepthLevelIncrement(v6);
    _UISheetLayoutInfoDirtyProposedDepthLevel(v6);
    _UISheetLayoutInfoDirtyEffectiveKeyboardFrame(v6);
    _UISheetLayoutInfoDirtyStacksWithChild(v6);
    _UISheetLayoutInfoDirtyNonFullHeightOffset(v6);
    _UISheetLayoutInfoDirtyOffsetAdjustment(v6);
    _UISheetLayoutInfoDirtyAnyDescendantDragging(v6);
    _UISheetLayoutInfoDirtyAnyDescendantWantsFullScreen(v6);
    _UISheetLayoutInfoDirtyCornerRadii(v6);
    _UISheetLayoutInfoDirtyTransform(v6);
    _UISheetLayoutInfoDirtyPercentDimmedFromOffset(v6);
    _UISheetLayoutInfoDirtyPercentDimmed(v6);
    _UISheetLayoutInfoDirtyGrabberAlpha(v6);
    _UISheetLayoutInfoDirtyAlpha(v6);
    _UISheetLayoutInfoDirtyModelDimmingEnabled(v6);

    double v5 = v7;
  }
}

- (NSSet)_descendantHiddenAncestorSheetIDs
{
  if ((*(unsigned char *)&self->_clean & 8) == 0)
  {
    id v3 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
    double v4 = v3;
    if (v3 && [v3 _isEffectivePresented])
    {
      double v5 = [v4 _hiddenAncestorSheetID];
      char v6 = [v4 _descendantHiddenAncestorSheetIDs];
      double v7 = v6;
      if (v5)
      {
        double v8 = [v6 setByAddingObject:v5];
      }
      else
      {
        double v8 = v6;
      }
      descendantHiddenAncestorSheetIDs = self->__descendantHiddenAncestorSheetIDs;
      self->__descendantHiddenAncestorSheetIDs = v8;
    }
    else
    {
      uint64_t v9 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      double v5 = self->__descendantHiddenAncestorSheetIDs;
      self->__descendantHiddenAncestorSheetIDs = v9;
    }

    *(void *)&self->_clean |= 8uLL;
  }
  double v11 = self->__descendantHiddenAncestorSheetIDs;
  return v11;
}

- (NSString)_hiddenAncestorSheetID
{
  return self->__hiddenAncestorSheetID;
}

- (double)_proposedDepthLevel
{
  if ((*((unsigned char *)&self->_clean + 1) & 0x10) == 0)
  {
    if ([(_UISheetLayoutInfo *)self _scalesDownBehindDescendants])
    {
      id v3 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
      if (![(_UISheetLayoutInfo *)self _isHosting] || v3)
      {
        BOOL v5 = [(_UISheetLayoutInfo *)self _stacksWithChild];
        double v4 = 0.0;
        if (v5)
        {
          objc_msgSend(v3, "_proposedDepthLevel", 0.0);
          double v7 = v6;
          BOOL v8 = [(_UISheetLayoutInfo *)self _isHidingUnderneathDescendantForDepthLevel];
          double v9 = 0.0;
          if (!v8) {
            [(_UISheetLayoutInfo *)self _proposedDepthLevelIncrement];
          }
          double v4 = v7 + v9;
        }
      }
      else
      {
        [(_UISheetLayoutInfo *)self _remoteProposedDepthLevel];
      }
      self->__proposedDepthLevel = v4;
    }
    else
    {
      self->__proposedDepthLevel = 0.0;
    }
    *(void *)&self->_clean |= 0x1000uLL;
  }
  return self->__proposedDepthLevel;
}

- (BOOL)_stacksWithChild
{
  if ((*((unsigned char *)&self->_clean + 2) & 0x80) == 0)
  {
    id v3 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
    if (v3)
    {
      [(_UISheetLayoutInfo *)self _stackAlignmentFrame];
      CGFloat v5 = v4;
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      [v3 _stackAlignmentFrame];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v20 = [(_UISheetLayoutInfo *)self _metrics];
      self->__stacksWithChild = _UISheetLayoutInfoStacks(v20, v5, v7, v9, v11, v13, v15, v17, v19);
    }
    else
    {
      self->__stacksWithChild = 0;
    }
    *(void *)&self->_clean |= 0x800000uLL;
  }
  return self->__stacksWithChild;
}

- (BOOL)_scalesDownBehindDescendants
{
  id v3 = [(_UISheetLayoutInfo *)self _metrics];
  double v4 = [(_UISheetLayoutInfo *)self _containerView];
  [(_UISheetLayoutInfo *)self _containerBounds];
  char v5 = objc_msgSend(v3, "shouldScaleDownBehindDescendantsForContainer:withBounds:", v4);

  if (![(_UISheetLayoutInfo *)self _shouldScaleDownBehindDescendants]
    || [(_UISheetLayoutInfo *)self _isReduceMotionEnabled]
    || (v5 & 1) == 0 && [(_UISheetLayoutInfo *)self _wantsFullScreen])
  {
    return 0;
  }
  double v8 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
  BOOL v6 = [v8 verticalSizeClass] != 1;

  return v6;
}

- (BOOL)_shouldScaleDownBehindDescendants
{
  return self->__shouldScaleDownBehindDescendants;
}

- (double)_percentFullHeight
{
  if ((*((unsigned char *)&self->_clean + 1) & 2) == 0)
  {
    [(_UISheetLayoutInfo *)self _stackAlignmentFrame];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    CGFloat v11 = [(_UISheetLayoutInfo *)self _activeDetents];
    BOOL v12 = [(_UISheetLayoutInfo *)self _isInverted];
    uint64_t v13 = v4;
    uint64_t v14 = v6;
    uint64_t v15 = v8;
    uint64_t v16 = v10;
    if (v12) {
      double MaxY = CGRectGetMaxY(*(CGRect *)&v13);
    }
    else {
      double MaxY = CGRectGetMinY(*(CGRect *)&v13);
    }
    double v18 = MaxY;
    CGFloat v19 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
    [v19 displayScale];
    double v21 = v20;

    CGAffineTransform v22 = [v11 objectAtIndexedSubscript:0];
    [v22 _value];
    UIRoundToScale(v23, v21);
    double v25 = v24;
    UIRoundToScale(v18, v21);
    if (v25 <= v26)
    {
    }
    else
    {
      BOOL v27 = [(_UISheetLayoutInfo *)self _isFunctionallyFullScreen];

      double v28 = 0.0;
      if (!v27)
      {
LABEL_13:
        self->__percentFulldouble Height = v28;
        *(void *)&self->_clean |= 0x200uLL;

        return self->__percentFullHeight;
      }
    }
    if ((unint64_t)objc_msgSend(v11, "count", v28) <= 1)
    {
      [(_UISheetLayoutInfo *)self _dismissOffset];
      double v31 = v32;
    }
    else
    {
      CGFloat v29 = [v11 objectAtIndexedSubscript:1];
      [v29 _value];
      double v31 = v30;
    }
    [(_UISheetLayoutInfo *)self _currentOffset];
    double v28 = fmax(fmin((v33 - v31) / (v18 - v31), 1.0), 0.0);
    goto LABEL_13;
  }
  return self->__percentFullHeight;
}

- (int64_t)_indexOfActiveDimmingDetent
{
  id v3 = [(_UISheetLayoutInfo *)self _activeDetents];
  return self->__indexOfActiveDimmingDetent;
}

- (double)_smallestNonDismissDetentOffset
{
  id v3 = [(_UISheetLayoutInfo *)self _activeDetents];
  return self->__smallestNonDismissDetentOffset;
}

- (NSArray)_activeDetents
{
  if ((*((unsigned char *)&self->_clean + 3) & 8) != 0) {
    goto LABEL_96;
  }
  if dyld_program_sdk_at_least() && (*(unsigned char *)&self->_computing)
  {
    v100 = [MEMORY[0x1E4F28B00] currentHandler];
    [v100 handleFailureInMethod:a2 object:self file:@"_UISheetMetrics.m" lineNumber:3064 description:@"Cannot call _activeDetents reentrantly."];
  }
  SEL v103 = a2;
  *(unsigned char *)&self->_computing |= 1u;
  [(NSMutableArray *)self->__mutableDetentValues removeAllObjects];
  [(NSMutableArray *)self->__mutableActiveDetents removeAllObjects];
  [(_UISheetLayoutInfo *)self _containerBounds];
  [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  BOOL v12 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
  [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
  double v106 = v14;
  double v107 = v13;
  double v16 = v15;
  double v18 = v17;
  CGFloat v19 = [(_UISheetLayoutInfo *)self _detents];
  double v20 = [(_UISheetLayoutInfo *)self _selectedDetentIdentifier];
  double v21 = [(_UISheetLayoutInfo *)self _effectiveAppearance];
  uint64_t v22 = [v21 _largestUndimmedDetentIdentifier];
  double v23 = [v21 _smallestDimmedDetentIdentifier];
  [(_UISheetLayoutInfo *)self _latestUserChosenOffset];
  double v25 = v24;
  uint64_t v26 = [(_UISheetLayoutInfo *)self _isEdgeAttached];
  int v108 = [(_UISheetLayoutInfo *)self _isInverted];
  if (qword_1EB25FFC8 != -1) {
    dispatch_once(&qword_1EB25FFC8, &__block_literal_global_46);
  }
  v110 = (void *)v22;
  [(id)qword_1EB25FFC0 resolvedValueInContext:self];
  double v28 = v27;
  _UISheetLayoutInfoResolvedDetentValue(v27, v107, v106, v16, v18, v26, v108);
  double v105 = v29;
  v109 = v23;
  if (![(_UISheetLayoutInfo *)self _isFunctionallyFullScreen] && v12)
  {
    v104 = v21;
    v102 = v12;
    if ([v19 count])
    {
      unint64_t v30 = 0;
      do
      {
        double v31 = [v19 objectAtIndexedSubscript:v30];
        [v31 resolvedValueInContext:self];
        double v33 = v32;

        mutableDetentValues = self->__mutableDetentValues;
        double v35 = [NSNumber numberWithDouble:v33];
        [(NSMutableArray *)mutableDetentValues addObject:v35];

        if (v33 != 1.79769313e308)
        {
          CGFloat v36 = [v19 objectAtIndexedSubscript:v30];
          double v37 = [v36 identifier];

          if ([v37 isEqualToString:@"com.apple.UIKit.full"]) {
            [(_UISheetLayoutInfo *)self _fullDetentValue];
          }
          else {
            [(_UISheetLayoutInfo *)self maximumDetentValue];
          }
          if (v33 < v38) {
            double v38 = v33;
          }
          _UISheetLayoutInfoResolvedDetentValue(v38, v107, v106, v16, v18, v26, v108);
          mutableActiveDetents = self->__mutableActiveDetents;
          double v41 = -[_UISheetActiveDetent initWithIdentifier:value:]([_UISheetActiveDetent alloc], "initWithIdentifier:value:", v37, v40, v5, v7, v9, v11);
          [(NSMutableArray *)mutableActiveDetents addObject:v41];
        }
        ++v30;
      }
      while (v30 < [v19 count]);
    }
    if (![(NSMutableArray *)self->__mutableActiveDetents count])
    {
      v101 = [MEMORY[0x1E4F28B00] currentHandler];
      [v101 handleFailureInMethod:v103 object:self file:@"_UISheetMetrics.m" lineNumber:3119 description:@"At least one detent must be active."];
    }
    BOOL v42 = self->__mutableActiveDetents;
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __36___UISheetLayoutInfo__activeDetents__block_invoke_2;
    v115[3] = &__block_descriptor_33_e55_q24__0___UISheetActiveDetent_8___UISheetActiveDetent_16l;
    char v116 = v108;
    [(NSMutableArray *)v42 sortUsingComparator:v115];
    int64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
    self->__indexOfCurrentActiveDetent = 0x7FFFFFFFFFFFFFFFLL;
    p_indexOfCurrentActiveDetent = &self->__indexOfCurrentActiveDetent;
    if ([v21 _prefersDimmingVisible]) {
      int64_t v43 = [(NSMutableArray *)self->__mutableActiveDetents count] - 1;
    }
    self->__int64_t indexOfActiveDimmingDetent = v43;
    self->__hasActiveFullDetent = 0;
    if ([(NSMutableArray *)self->__mutableActiveDetents count])
    {
      int64_t v45 = 0;
      while (1)
      {
        double v46 = [(NSMutableArray *)self->__mutableActiveDetents objectAtIndexedSubscript:v45];
        id v47 = [v46 _identifier];
        id v48 = v20;
        double v49 = v48;
        if (v47 == v48) {
          break;
        }
        if (!v20 || !v47)
        {

          goto LABEL_34;
        }
        int v50 = [v47 isEqual:v48];

        if (v50) {
          goto LABEL_31;
        }
LABEL_34:
        id v52 = v47;
        id v53 = v110;
        double v54 = v53;
        if (v52 == v53)
        {

LABEL_40:
          int64_t v56 = v45 - 1;
          if (!v45) {
            int64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
          }
          self->__int64_t indexOfActiveDimmingDetent = v56;
          goto LABEL_44;
        }
        if (!v110 || !v52)
        {

          goto LABEL_44;
        }
        int v55 = [v52 isEqual:v53];

        if (v55) {
          goto LABEL_40;
        }
LABEL_44:
        id v57 = v52;
        id v58 = v109;
        double v59 = v58;
        if (v57 == v58)
        {
        }
        else
        {
          if (!v109 || !v57)
          {

            goto LABEL_52;
          }
          int v60 = [v57 isEqual:v58];

          if (!v60) {
            goto LABEL_52;
          }
        }
        self->__int64_t indexOfActiveDimmingDetent = v45;
LABEL_52:
        if ([v57 isEqualToString:@"com.apple.UIKit.full"]) {
          self->__hasActiveFullDetent = 1;
        }

        if (++v45 >= (unint64_t)[(NSMutableArray *)self->__mutableActiveDetents count]) {
          goto LABEL_55;
        }
      }

LABEL_31:
      int64_t *p_indexOfCurrentActiveDetent = v45;
      if (v25 == 1.79769313e308)
      {
        [v46 _value];
        double v25 = v51;
      }
      goto LABEL_34;
    }
LABEL_55:
    if ([(_UISheetLayoutInfo *)self _isHosting])
    {
      double v21 = v104;
      double v23 = v109;
      if ([(_UISheetLayoutInfo *)self _remoteContainsFirstResponder])
      {
        BOOL v61 = [(_UISheetLayoutInfo *)self _remoteFirstResponderRequiresKeyboard];
LABEL_61:
        BOOL v66 = v61;
        goto LABEL_63;
      }
    }
    else
    {
      double v21 = v104;
      double v23 = v109;
      if ([(_UISheetLayoutInfo *)self _containsFirstResponder])
      {
        BOOL v61 = [(_UISheetLayoutInfo *)self _firstResponderRequiresKeyboard];
        goto LABEL_61;
      }
    }
    BOOL v66 = 0;
LABEL_63:
    [(_UISheetLayoutInfo *)self _effectiveKeyboardFrame];
    v121.origin.CGFloat y = v106;
    v121.origin.CGFloat x = v107;
    v121.size.CGFloat width = v16;
    v121.size.CGFloat height = v18;
    CGRect v119 = CGRectIntersection(v118, v121);
    if (!v66
      || (CGFloat x = v119.origin.x, y = v119.origin.y, width = v119.size.width, height = v119.size.height, CGRectIsEmpty(v119))
      || (v108 & 1) != 0
      || ![(_UISheetLayoutInfo *)self _shouldAdjustDetentsToAvoidKeyboard])
    {
      self->__adjustedIndexOfCurrentActiveDetentForContainedFirstResponder = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      double v71 = [(NSMutableArray *)self->__mutableActiveDetents firstObject];
      [v71 _value];
      double v73 = v72;

      if (v73 > v105)
      {
        double v74 = self->__mutableActiveDetents;
        double v75 = [_UISheetActiveDetent alloc];
        v120.origin.CGFloat x = x;
        v120.origin.CGFloat y = y;
        v120.size.CGFloat width = width;
        v120.size.CGFloat height = height;
        double v76 = v73 - CGRectGetHeight(v120);
        if (v76 < v105) {
          double v76 = v105;
        }
        CGRect v77 = [(_UISheetActiveDetent *)v75 initWithIdentifier:0 value:v76];
        [(NSMutableArray *)v74 insertObject:v77 atIndex:0];

        int64_t indexOfActiveDimmingDetent = self->__indexOfActiveDimmingDetent;
        if (indexOfActiveDimmingDetent == 0x7FFFFFFFFFFFFFFFLL) {
          int64_t v79 = 0;
        }
        else {
          int64_t v79 = indexOfActiveDimmingDetent + 1;
        }
        self->__int64_t indexOfActiveDimmingDetent = v79;
      }
      int64_t *p_indexOfCurrentActiveDetent = 0;
      self->__adjustedIndexOfCurrentActiveDetentForContainedFirstResponder = 0;
    }
    BOOL v12 = v102;
    goto LABEL_77;
  }
  BOOL v62 = self->__mutableDetentValues;
  double v63 = [NSNumber numberWithDouble:v28];
  [(NSMutableArray *)v62 addObject:v63];

  double v64 = self->__mutableActiveDetents;
  double v65 = [[_UISheetActiveDetent alloc] initWithIdentifier:0 value:v105];
  [(NSMutableArray *)v64 addObject:v65];

  *(_OWORD *)&self->__indexOfCurrentActiveDetent = xmmword_186B8D250;
  self->__int64_t indexOfActiveDimmingDetent = 0;
  self->__hasActiveFullDetent = 0;
LABEL_77:
  if (![(NSMutableArray *)self->__mutableActiveDetents count])
  {
    v97 = [MEMORY[0x1E4F28B00] currentHandler];
    [v97 handleFailureInMethod:v103 object:self file:@"_UISheetMetrics.m" lineNumber:3209 description:@"At least one detent must be active."];
  }
  if (v25 == 1.79769313e308)
  {
    CGRect v80 = [(NSMutableArray *)self->__mutableActiveDetents lastObject];
    [v80 _value];
    double v25 = v81;
  }
  if (v25 == 1.79769313e308)
  {
    v98 = [MEMORY[0x1E4F28B00] currentHandler];
    [v98 handleFailureInMethod:v103 object:self file:@"_UISheetMetrics.m" lineNumber:3216 description:@"_latestUserChosenOffset must be resolved to a concrete value by this point."];
  }
  if (self->__indexOfCurrentActiveDetent == 0x7FFFFFFFFFFFFFFFLL)
  {
    CGRect v82 = v20;
    uint64_t v83 = [(NSMutableArray *)self->__mutableActiveDetents count];
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v112 = __36___UISheetLayoutInfo__activeDetents__block_invoke_3;
    v113 = &unk_1E52E13D0;
    v114 = self;
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = 0;
      int64_t v86 = 0x7FFFFFFFFFFFFFFFLL;
      double v87 = 1.79769313e308;
      do
      {
        double v88 = vabdd_f64(v112((uint64_t)v111, v85), v25);
        if (v88 < v87)
        {
          int64_t v86 = v85;
          double v87 = v88;
        }
        ++v85;
      }
      while (v84 != v85);
    }
    else
    {
      int64_t v86 = 0x7FFFFFFFFFFFFFFFLL;
    }
    self->__indexOfCurrentActiveDetent = v86;
    BOOL v89 = v86 == 0x7FFFFFFFFFFFFFFFLL;
    double v20 = v82;
    double v23 = v109;
    if (v89)
    {
      v99 = [MEMORY[0x1E4F28B00] currentHandler];
      [v99 handleFailureInMethod:v103 object:self file:@"_UISheetMetrics.m" lineNumber:3227 description:@"indexOfCurrentActiveDetent must be a concrete index by this point."];
    }
  }
  v90 = [(NSMutableArray *)self->__mutableActiveDetents lastObject];
  [v90 _value];
  self->__smallestNonDismissDetentOffset = v91;

  self->__numberOfActiveNonDismissDetents = [(NSMutableArray *)self->__mutableActiveDetents count];
  if ([(_UISheetLayoutInfo *)self _isEffectiveDismissible])
  {
    v92 = self->__mutableActiveDetents;
    v93 = [_UISheetActiveDetent alloc];
    [(_UISheetLayoutInfo *)self _dismissOffset];
    v94 = -[_UISheetActiveDetent initWithIdentifier:value:](v93, "initWithIdentifier:value:", 0);
    [(NSMutableArray *)v92 addObject:v94];
  }
  *(unsigned char *)&self->_computing &= ~1u;
  *(void *)&self->_clean |= 0x8000000uLL;

LABEL_96:
  v95 = self->__mutableActiveDetents;
  return (NSArray *)v95;
}

- (double)_percentDimmedFromOffset
{
  if ((*((unsigned char *)&self->_clean + 13) & 0x80) != 0) {
    return self->__percentDimmedFromOffset;
  }
  int64_t v3 = [(_UISheetLayoutInfo *)self _indexOfActiveDimmingDetent];
  double v4 = 0.0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = v3;
    unint64_t v6 = v3 + 1;
    uint64_t v7 = [(_UISheetLayoutInfo *)self _activeDetents];
    uint64_t v8 = [v7 objectAtIndexedSubscript:v5];
    [v8 _value];
    double v10 = v9;

    if (v6 >= [v7 count])
    {
      [(_UISheetLayoutInfo *)self _dismissOffset];
      double v13 = v15;
    }
    else
    {
      uint64_t v11 = [v7 objectAtIndexedSubscript:v6];
      [v11 _value];
      double v13 = v12;
    }
    [(_UISheetLayoutInfo *)self _currentOffset];
    double v4 = fmax(fmin((v16 - v13) / (v10 - v13), 1.0), 0.0);
  }
  double v17 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
  [v17 _percentDimmedFromOffset];
  double v19 = v18;

  BOOL v20 = [(_UISheetLayoutInfo *)self _isHidingUnderneathDescendant];
  if (v4 < v19 || v20) {
    double result = v19;
  }
  else {
    double result = v4;
  }
  self->__percentDimmedFromOffset = result;
  *((_DWORD *)&self->_clean + 3) |= 0x8000u;
  return result;
}

- (NSString)_selectedDetentIdentifier
{
  return self->__selectedDetentIdentifier;
}

- (NSArray)_detents
{
  return self->__detents;
}

- (BOOL)_isEffectiveDismissible
{
  v2 = self;
  if (*((unsigned char *)&self->_clean + 2))
  {
    LOBYTE(self) = self->__effectiveDismissible;
  }
  else
  {
    LODWORD(self) = [(_UISheetLayoutInfo *)self _isDismissible];
    if (self) {
      LOBYTE(self) = ![(_UISheetLayoutInfo *)v2 _dismissesHorizontally];
    }
    v2->__effectiveDismissible = (char)self;
    *(void *)&v2->_clean |= 0x10000uLL;
  }
  return (char)self;
}

- (CGPoint)_rawCurrentOffset
{
  if ((*((unsigned char *)&self->_clean + 12) & 1) == 0)
  {
    [(_UISheetLayoutInfo *)self _containerBounds];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    currentOffsetGetter = (void (**)(void))self->__currentOffsetGetter;
    if (currentOffsetGetter)
    {
      currentOffsetGetter[2]();
    }
    else
    {
      BOOL v22 = [(_UISheetLayoutInfo *)self _isInverted];
      uint64_t v23 = v4;
      uint64_t v24 = v6;
      uint64_t v25 = v8;
      uint64_t v26 = v10;
      if (v22) {
        double MaxY = CGRectGetMaxY(*(CGRect *)&v23);
      }
      else {
        double MaxY = CGRectGetMinY(*(CGRect *)&v23);
      }
      CGFloat v21 = MaxY;
      CGFloat v20 = 0.0;
    }
    self->__rawCurrentOffset.double x = v20;
    self->__rawCurrentOffset.double y = v21;
    if (![(_UISheetLayoutInfo *)self _isEffectivePresented]
      && [(_UISheetLayoutInfo *)self _dismissesHorizontally])
    {
      double v28 = [(_UISheetLayoutInfo *)self _containerView];
      if ([v28 _shouldReverseLayoutDirection]) {
        uint64_t v29 = 2;
      }
      else {
        uint64_t v29 = 1;
      }

      int64_t v30 = [(_UISheetLayoutInfo *)self _horizontalAlignment];
      uint64_t v31 = v4;
      uint64_t v32 = v6;
      uint64_t v33 = v8;
      uint64_t v34 = v10;
      if (v30 == v29)
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v31);
        v40.origin.double x = v12;
        v40.origin.double y = v14;
        v40.size.CGFloat width = v16;
        v40.size.CGFloat height = v18;
        double MaxX = CGRectGetMaxX(v40);
      }
      else
      {
        double MinX = CGRectGetMaxX(*(CGRect *)&v31);
        v41.origin.double x = v12;
        v41.origin.double y = v14;
        v41.size.CGFloat width = v16;
        v41.size.CGFloat height = v18;
        double MaxX = CGRectGetMinX(v41);
      }
      self->__rawCurrentOffset.double x = MinX - MaxX + self->__rawCurrentOffset.x;
    }
    *((_DWORD *)&self->_clean + 3) |= 1u;
  }
  double x = self->__rawCurrentOffset.x;
  double y = self->__rawCurrentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)_containerBounds
{
  double x = self->__containerBounds.origin.x;
  double y = self->__containerBounds.origin.y;
  double width = self->__containerBounds.size.width;
  double height = self->__containerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_latestUserChosenOffset
{
  return self->__latestUserChosenOffset;
}

- (BOOL)_isDismissible
{
  return self->__dismissible;
}

- (_UISheetPresentationControllerAppearance)_effectiveAppearance
{
  if ((*((unsigned char *)&self->_clean + 4) & 2) == 0)
  {
    uint64_t v3 = [(_UISheetLayoutInfo *)self _standardAppearance];
    if ([(_UISheetLayoutInfo *)self _isEdgeAttached])
    {
      uint64_t v4 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
      uint64_t v5 = [v4 verticalSizeClass];

      if (v5 != 1)
      {
        uint64_t v9 = v3;
        effectiveAppearance = self->__effectiveAppearance;
        self->__effectiveAppearance = v9;
LABEL_11:

        *(void *)&self->_clean |= 0x200000000uLL;
        goto LABEL_12;
      }
      uint64_t v6 = [(_UISheetLayoutInfo *)self _edgeAttachedCompactHeightAppearance];
    }
    else
    {
      uint64_t v6 = [(_UISheetLayoutInfo *)self _floatingAppearance];
    }
    effectiveAppearance = (_UISheetPresentationControllerAppearance *)v6;
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    else {
      uint64_t v8 = v3;
    }
    objc_storeStrong((id *)&self->__effectiveAppearance, v8);
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v10 = self->__effectiveAppearance;
  return v10;
}

- (BOOL)_isReduceMotionEnabled
{
  return self->__reduceMotionEnabled;
}

- (void)_setContainerTraitCollection:(id)a3
{
  id v7 = a3;
  if (!-[UITraitCollection isEqual:](self->__containerTraitCollection, "isEqual:"))
  {
    objc_storeStrong((id *)&self->__containerTraitCollection, a3);
    uint64_t v5 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v5);
    _UISheetLayoutInfoDirtyMargins(v5);
    _UISheetLayoutInfoDirtyPreferredSize(v5);
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(v5);
    _UISheetLayoutInfoDirtyEdgeAttached(v5);
    _UISheetLayoutInfoDirtyForcedFullScreen(v5);
    uint64_t clean = (uint64_t)v5->_clean;
    if ((clean & 0x200000000) != 0)
    {
      *(void *)&v5->_uint64_t clean = clean & 0xFFFFFFFDFFFFFFFFLL;
      _UISheetLayoutInfoDirtyActiveDetents(v5);
    }
    _UISheetLayoutInfoDirtyActiveDetents(v5);
    _UISheetLayoutInfoDirtyStackAlignmentFrame(v5);
    _UISheetLayoutInfoDirtyUntransformedFrame(v5);
    _UISheetLayoutInfoDirtyFrameOfPresentedViewInContainerView(v5);
    _UISheetLayoutInfoDirtyPercentFullHeight(v5);
    _UISheetLayoutInfoDirtyInteractionEnabled(v5);
  }
}

- (_UISheetLayoutInfoDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);
  return (_UISheetLayoutInfoDelegate *)WeakRetained;
}

- (_UISheetLayoutInfo)_childLayoutInfo
{
  return self->__childLayoutInfo;
}

- (id)_indexOfCurrentActiveOrDismissDetentWasInvalidated
{
  return self->__indexOfCurrentActiveOrDismissDetentWasInvalidated;
}

- (CGRect)_effectiveKeyboardFrame
{
  if ((*((unsigned char *)&self->_clean + 2) & 0x20) == 0)
  {
    uint64_t v3 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
    if ([(_UISheetLayoutInfo *)self _isHosting])
    {
      [(_UISheetLayoutInfo *)self _remoteKeyboardFrame];
    }
    else if (v3)
    {
      [v3 _effectiveKeyboardFrame];
    }
    else
    {
      [(_UISheetLayoutInfo *)self _keyboardFrame];
    }
    self->__effectiveKeyboardFrame.origin.double x = v4;
    self->__effectiveKeyboardFrame.origin.double y = v5;
    self->__effectiveKeyboardFrame.size.double width = v6;
    self->__effectiveKeyboardFrame.size.double height = v7;
    *(void *)&self->_clean |= 0x200000uLL;
  }
  double x = self->__effectiveKeyboardFrame.origin.x;
  double y = self->__effectiveKeyboardFrame.origin.y;
  double width = self->__effectiveKeyboardFrame.size.width;
  double height = self->__effectiveKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_containsFirstResponder
{
  return self->__containsFirstResponder;
}

- (double)_proposedDepthLevelIncrement
{
  if ((*((unsigned char *)&self->_clean + 1) & 8) == 0)
  {
    uint64_t v3 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
    if ([v3 _isHidingUnderneathDescendantForDepthLevel]) {
      [v3 _proposedDepthLevelIncrement];
    }
    else {
      [v3 _percentFullHeight];
    }
    self->__proposedDepthLevelIncrement = v4;
    *(void *)&self->_clean |= 0x800uLL;
  }
  return self->__proposedDepthLevelIncrement;
}

- (BOOL)_isHidingUnderneathDescendantForDepthLevel
{
  v2 = self;
  if ((*((unsigned char *)&self->_clean + 1) & 4) != 0)
  {
    LOBYTE(self) = self->__hidingUnderneathDescendantForDepthLevel;
  }
  else
  {
    LODWORD(self) = [(_UISheetLayoutInfo *)self _isHidingUnderneathDescendant];
    if (self) {
      LOBYTE(self) = [(_UISheetLayoutInfo *)v2 _isEdgeAttached];
    }
    v2->__hidingUnderneathDescendantForDepthLevel = (char)self;
    *(void *)&v2->_clean |= 0x400uLL;
  }
  return (char)self;
}

- (double)_nonFullHeightOffset
{
  if ((*((unsigned char *)&self->_clean + 12) & 8) != 0) {
    return self->__nonFullHeightOffset;
  }
  [(_UISheetLayoutInfo *)self _containerBounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(_UISheetLayoutInfo *)self _percentFullHeight];
  double v12 = v11;
  int v13 = [(_UISheetLayoutInfo *)self _isInverted];
  if (![(_UISheetLayoutInfo *)self _isEffectivePresented]) {
    goto LABEL_12;
  }
  if (v12 == 0.0
    || ([(_UISheetLayoutInfo *)self _parentLayoutInfo],
        CGFloat v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 _isHidingUnderneathDescendant],
        v14,
        v15))
  {
    [(_UISheetLayoutInfo *)self _currentOffset];
    double v17 = v16;
    BOOL v18 = [(_UISheetLayoutInfo *)self _isEffectiveDismissible];
    if (v13)
    {
      if (v18) {
        [(_UISheetLayoutInfo *)self _smallestNonDismissDetentOffset];
      }
      else {
        CGFloat MaxY = -INFINITY;
      }
      if (v17 >= MaxY) {
        CGFloat MaxY = v17;
      }
    }
    else
    {
      if (v18) {
        [(_UISheetLayoutInfo *)self _smallestNonDismissDetentOffset];
      }
      else {
        CGFloat MaxY = INFINITY;
      }
      if (v17 < MaxY) {
        CGFloat MaxY = v17;
      }
    }
    goto LABEL_22;
  }
  if (v12 < 1.0)
  {
    [(_UISheetLayoutInfo *)self _smallestNonDismissDetentOffset];
  }
  else
  {
LABEL_12:
    uint64_t v20 = v4;
    uint64_t v21 = v6;
    uint64_t v22 = v8;
    uint64_t v23 = v10;
    if (v13) {
      CGFloat MaxY = CGRectGetMaxY(*(CGRect *)&v20);
    }
    else {
      CGFloat MaxY = CGRectGetMinY(*(CGRect *)&v20);
    }
  }
LABEL_22:
  self->__double nonFullHeightOffset = MaxY;
  uint64_t v24 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
  if ((v12 != 1.0 || [(_UISheetLayoutInfo *)self _isHidingUnderneathDescendant])
    && v24
    && v13 == [v24 _isInverted])
  {
    double nonFullHeightOffset = self->__nonFullHeightOffset;
    [v24 _nonFullHeightOffset];
    if (nonFullHeightOffset >= v26) {
      double v27 = v26;
    }
    else {
      double v27 = nonFullHeightOffset;
    }
    if (nonFullHeightOffset >= v26) {
      double v26 = nonFullHeightOffset;
    }
    if (v13) {
      double v26 = v27;
    }
    self->__double nonFullHeightOffset = v26;
  }
  *((_DWORD *)&self->_clean + 3) |= 8u;

  return self->__nonFullHeightOffset;
}

- (CGRect)_keyboardFrame
{
  double x = self->__keyboardFrame.origin.x;
  double y = self->__keyboardFrame.origin.y;
  double width = self->__keyboardFrame.size.width;
  double height = self->__keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)_indexOfCurrentActiveOrDismissDetent
{
  if ((*((unsigned char *)&self->_clean + 3) & 0x40) == 0)
  {
    if ([(_UISheetLayoutInfo *)self _isEffectivePresented]
      || [(_UISheetLayoutInfo *)self _dismissesHorizontally])
    {
      self->__indexOfCurrentActiveOrDismissDetent = [(_UISheetLayoutInfo *)self _indexOfCurrentActiveDetent];
    }
    else
    {
      uint64_t v3 = [(_UISheetLayoutInfo *)self _activeDetents];
      self->__indexOfCurrentActiveOrDismissDetent = [v3 count] - 1;
    }
    *(void *)&self->_clean |= 0x40000000uLL;
  }
  return self->__indexOfCurrentActiveOrDismissDetent;
}

- (NSArray)_ancestorSheetIDs
{
  if ((*(unsigned char *)&self->_clean & 4) == 0)
  {
    uint64_t v3 = [(_UISheetLayoutInfo *)self _sheetID];
    uint64_t v4 = [(_UISheetLayoutInfo *)self _parentLayoutInfo];
    uint64_t v5 = [v4 _ancestorSheetIDs];
    uint64_t v6 = (void *)v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      uint64_t v7 = (void *)v5;
    }
    id v8 = v7;

    if (v3)
    {
      uint64_t v9 = [v8 arrayByAddingObject:v3];
    }
    else
    {
      uint64_t v9 = (NSArray *)v8;
    }
    ancestorSheetIDs = self->__ancestorSheetIDs;
    self->__ancestorSheetIDs = v9;

    *(void *)&self->_clean |= 4uLL;
  }
  double v11 = self->__ancestorSheetIDs;
  return v11;
}

- (NSString)_sheetID
{
  return self->__sheetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutableActiveDetents, 0);
  objc_storeStrong((id *)&self->__mutableDetentValues, 0);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong(&self->__rubberBandExtentBeyondMaximumOffsetWasInvalidated, 0);
  objc_storeStrong(&self->__rubberBandExtentBeyondMinimumOffsetWasInvalidated, 0);
  objc_storeStrong(&self->__indexOfCurrentActiveOrDismissDetentWasInvalidated, 0);
  objc_storeStrong((id *)&self->__childLayoutInfo, 0);
  objc_destroyWeak((id *)&self->__parentLayoutInfo);
  objc_storeStrong(&self->__currentOffsetGetter, 0);
  objc_storeStrong((id *)&self->__hiddenAncestorSheetID, 0);
  objc_storeStrong((id *)&self->__sheetID, 0);
  objc_storeStrong((id *)&self->__floatingAppearance, 0);
  objc_storeStrong((id *)&self->__edgeAttachedCompactHeightAppearance, 0);
  objc_storeStrong((id *)&self->__standardAppearance, 0);
  objc_storeStrong((id *)&self->__selectedDetentIdentifier, 0);
  objc_storeStrong((id *)&self->__detents, 0);
  objc_storeStrong((id *)&self->__containerTraitCollection, 0);
  objc_storeStrong((id *)&self->__metrics, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->__presentedViewController, 0);
  objc_destroyWeak((id *)&self->__presentingViewController);
  objc_storeStrong((id *)&self->__effectiveAppearance, 0);
  objc_storeStrong((id *)&self->__descendantHiddenAncestorSheetIDs, 0);
  objc_storeStrong((id *)&self->__ancestorSheetIDs, 0);
}

- (void)_setContainerView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  uint64_t v6 = v5;
  if (self->__containerView != v5)
  {
    double v12 = v5;
    p_containerView = (id *)&self->__containerView;
    BOOL v8 = [(_UISheetLayoutInfo *)self _tucksIntoUnsafeAreaInCompactHeight];
    containerView = self->__containerView;
    if (containerView) {
      BOOL v10 = !v8;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      [(UIView *)containerView _removeBoundingPathChangeObserver:self];
    }
    objc_storeStrong((id *)&self->__containerView, a3);
    if (*p_containerView) {
      BOOL v11 = v8;
    }
    else {
      BOOL v11 = 0;
    }
    uint64_t v6 = v12;
    if (v11)
    {
      [*p_containerView _addBoundingPathChangeObserver:self];
      uint64_t v6 = v12;
    }
  }
}

- (UIEdgeInsets)_marginsWhenFloating
{
  if ((*(unsigned char *)&self->_clean & 0x40) == 0)
  {
    [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
    double v24 = v4;
    double v25 = v3;
    double v6 = v5;
    double v8 = v7;
    uint64_t v9 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
    [(_UISheetLayoutInfo *)self _marginInCompactHeight];
    double v11 = v10;
    [(_UISheetLayoutInfo *)self _marginInRegularWidthRegularHeight];
    double v13 = v12;
    int v14 = [(_UISheetLayoutInfo *)self _tucksIntoUnsafeAreaInCompactHeight];
    [(_UISheetLayoutInfo *)self _unsafeInsets];
    int v15 = [(_UISheetLayoutInfo *)self _allowsAsymmetricVerticalMargins];
    double v16 = [(_UISheetLayoutInfo *)self _metrics];
    self->__marginsWhenFloating.double top = _UISheetLayoutInfoMargins(v9, 0, v14, v15, v16, v25, v24, v6, v8, v11, v13);
    self->__marginsWhenFloating.double left = v17;
    self->__marginsWhenFloating.double bottom = v18;
    self->__marginsWhenFloating.double right = v19;

    *(void *)&self->_clean |= 0x40uLL;
  }
  double top = self->__marginsWhenFloating.top;
  double left = self->__marginsWhenFloating.left;
  double bottom = self->__marginsWhenFloating.bottom;
  double right = self->__marginsWhenFloating.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)_margins
{
  if ((*(unsigned char *)&self->_clean & 0x80) == 0)
  {
    if ([(_UISheetLayoutInfo *)self _isEdgeAttached])
    {
      [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
      double v28 = v4;
      double v29 = v3;
      double v6 = v5;
      double v8 = v7;
      uint64_t v9 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
      [(_UISheetLayoutInfo *)self _marginInCompactHeight];
      double v11 = v10;
      [(_UISheetLayoutInfo *)self _marginInRegularWidthRegularHeight];
      double v13 = v12;
      int v14 = [(_UISheetLayoutInfo *)self _tucksIntoUnsafeAreaInCompactHeight];
      [(_UISheetLayoutInfo *)self _unsafeInsets];
      int v15 = [(_UISheetLayoutInfo *)self _allowsAsymmetricVerticalMargins];
      double v16 = [(_UISheetLayoutInfo *)self _metrics];
      self->__margins.double top = _UISheetLayoutInfoMargins(v9, 1, v14, v15, v16, v29, v28, v6, v8, v11, v13);
      self->__margins.double left = v17;
      self->__margins.double bottom = v18;
      self->__margins.double right = v19;
    }
    else
    {
      [(_UISheetLayoutInfo *)self _marginsWhenFloating];
      self->__margins.double top = v20;
      self->__margins.double left = v21;
      self->__margins.double bottom = v22;
      self->__margins.double right = v23;
    }
    *(void *)&self->_clean |= 0x80uLL;
  }
  double top = self->__margins.top;
  double left = self->__margins.left;
  double bottom = self->__margins.bottom;
  double right = self->__margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)_tucksIntoUnsafeAreaInCompactHeight
{
  return self->__tucksIntoUnsafeAreaInCompactHeight;
}

- (UIEdgeInsets)_unsafeInsets
{
  if ((*(unsigned char *)&self->_clean & 0x20) != 0)
  {
    double top = self->__unsafeInsets.top;
    double left = self->__unsafeInsets.left;
    double bottom = self->__unsafeInsets.bottom;
    double right = self->__unsafeInsets.right;
  }
  else
  {
    [(_UISheetLayoutInfo *)self _containerBounds];
    CGFloat v37 = v4;
    CGFloat v38 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    uint64_t v9 = [(_UISheetLayoutInfo *)self _containerView];
    double right = 0.0;
    objc_msgSend(v9, "_rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:", 2, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v39.origin.double x = v12;
    v39.origin.double y = v14;
    v39.size.double width = v16;
    v39.size.double height = v18;
    double left = 0.0;
    if (!CGRectIsNull(v39))
    {
      v40.origin.double x = v12;
      v40.origin.double y = v14;
      v40.size.double width = v16;
      v40.size.double height = v18;
      double MinX = CGRectGetMinX(v40);
      v41.origin.double y = v37;
      v41.origin.double x = v38;
      v41.size.double width = v6;
      v41.size.double height = v8;
      double left = MinX - CGRectGetMinX(v41);
    }
    CGFloat v21 = [(_UISheetLayoutInfo *)self _containerView];
    objc_msgSend(v21, "_rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:", 8, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    v42.origin.double x = v23;
    v42.origin.double y = v25;
    v42.size.double width = v27;
    v42.size.double height = v29;
    if (!CGRectIsNull(v42))
    {
      v43.origin.double x = v38;
      v43.origin.double y = v37;
      v43.size.double height = v35;
      v43.size.double width = v36;
      double MaxX = CGRectGetMaxX(v43);
      v44.origin.double x = v23;
      v44.origin.double y = v25;
      v44.size.double width = v27;
      v44.size.double height = v29;
      double right = MaxX - CGRectGetMaxX(v44);
    }
    self->__unsafeInsets.double top = 0.0;
    self->__unsafeInsets.double left = left;
    self->__unsafeInsets.double bottom = 0.0;
    self->__unsafeInsets.double right = right;
    *(void *)&self->_clean |= 0x20uLL;
    double bottom = 0.0;
    double top = 0.0;
  }
  double v33 = left;
  double v34 = right;
  result.double right = v34;
  result.double bottom = bottom;
  result.double left = v33;
  result.double top = top;
  return result;
}

- (double)_marginInRegularWidthRegularHeight
{
  return self->__marginInRegularWidthRegularHeight;
}

- (double)_marginInCompactHeight
{
  return self->__marginInCompactHeight;
}

- (BOOL)_allowsAsymmetricVerticalMargins
{
  return self->__allowsAsymmetricVerticalMargins;
}

- (UIEdgeInsets)_touchInsets
{
  if ((*((unsigned char *)&self->_clean + 13) & 8) != 0)
  {
    double top = self->__touchInsets.top;
    double left = self->__touchInsets.left;
    double bottom = self->__touchInsets.bottom;
    double right = self->__touchInsets.right;
  }
  else
  {
    [(_UISheetLayoutInfo *)self _untransformedFrame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat rect = v7;
    CGFloat v10 = v9;
    [(_UISheetLayoutInfo *)self _hostedUntransformedFrame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    v33.origin.double x = v4;
    CGFloat v28 = v6;
    CGFloat v29 = v4;
    v33.origin.double y = v6;
    v33.size.double width = v8;
    v33.size.double height = v10;
    double MinY = CGRectGetMinY(v33);
    v34.origin.double x = v12;
    v34.origin.double y = v14;
    v34.size.double width = v16;
    v34.size.double height = v18;
    CGFloat v31 = MinY - CGRectGetMinY(v34);
    v35.origin.double x = v4;
    v35.origin.double y = v6;
    v35.size.double width = rect;
    v35.size.double height = v10;
    double MinX = CGRectGetMinX(v35);
    v36.origin.double x = v12;
    v36.origin.double y = v14;
    v36.size.double width = v16;
    v36.size.double height = v18;
    CGFloat v30 = MinX - CGRectGetMinX(v36);
    v37.origin.double x = v12;
    v37.origin.double y = v14;
    v37.size.double width = v16;
    v37.size.double height = v18;
    double MaxY = CGRectGetMaxY(v37);
    v38.origin.double x = v29;
    v38.origin.double y = v28;
    v38.size.double width = rect;
    v38.size.double height = v10;
    double bottom = MaxY - CGRectGetMaxY(v38);
    v39.origin.double x = v12;
    v39.origin.double y = v14;
    v39.size.double width = v16;
    v39.size.double height = v18;
    double MaxX = CGRectGetMaxX(v39);
    v40.origin.double x = v29;
    v40.origin.double y = v28;
    v40.size.double width = rect;
    v40.size.double height = v10;
    double right = MaxX - CGRectGetMaxX(v40);
    double left = v30;
    double top = v31;
    self->__touchInsets.double top = v31;
    self->__touchInsets.double left = v30;
    self->__touchInsets.double bottom = bottom;
    self->__touchInsets.double right = right;
    *((_DWORD *)&self->_clean + 3) |= 0x800u;
  }
  double v27 = bottom;
  result.double right = right;
  result.double bottom = v27;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)_hostedUntransformedFrame
{
  if ((*((unsigned char *)&self->_clean + 13) & 2) != 0)
  {
    double x = self->__hostedUntransformedFrame.origin.x;
    double y = self->__hostedUntransformedFrame.origin.y;
    double width = self->__hostedUntransformedFrame.size.width;
    double height = self->__hostedUntransformedFrame.size.height;
  }
  else
  {
    if ([(_UISheetLayoutInfo *)self _isHosting]) {
      [(_UISheetLayoutInfo *)self _containerBounds];
    }
    else {
      [(_UISheetLayoutInfo *)self _untransformedFrame];
    }
    self->__hostedUntransformedFrame.origin.double x = x;
    self->__hostedUntransformedFrame.origin.double y = y;
    self->__hostedUntransformedFrame.size.double width = width;
    self->__hostedUntransformedFrame.size.double height = height;
    *((_DWORD *)&self->_clean + 3) |= 0x200u;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setParentSheetLayoutInfo:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parentLayoutInfo);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__parentLayoutInfo, obj);
    CGFloat v6 = self;
    _UISheetLayoutInfoDirtyDepthLevel(v6);
    _UISheetLayoutInfoDirtyAncestorSheetIDs(v6);
    _UISheetLayoutInfoDirtyParentDepthLevel(v6);
    _UISheetLayoutInfoDirtyParentDepthLevel(v6);
    _UISheetLayoutInfoDirtyFullHeightUntransformedFrameForDepthLevel(v6);
    _UISheetLayoutInfoDirtyPercentDimmed(v6);

    double v5 = obj;
  }
}

- (void)_setPresentedViewController:(id)a3
{
}

- (void)_setPresentingViewController:(id)a3
{
}

- (void)_setContainerBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->__containerBounds, a3))
  {
    self->__containerBounds.origin.CGFloat x = x;
    self->__containerBounds.origin.CGFloat y = y;
    self->__containerBounds.size.CGFloat width = width;
    self->__containerBounds.size.CGFloat height = height;
    CGFloat v8 = self;
    _UISheetLayoutInfoDirtyUnsafeInsets(v8);
    _UISheetLayoutInfoDirtyPreferredSize(v8);
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(v8);
    _UISheetLayoutInfoDirtyEdgeAttached(v8);
    _UISheetLayoutInfoDirtyStackAlignmentFrame(v8);
    _UISheetLayoutInfoDirtyFullHeightUntransformedFrame(v8);
    _UISheetLayoutInfoDirtyDismissOffset(v8);
    _UISheetLayoutInfoDirtyRawCurrentOffset(v8);
    _UISheetLayoutInfoDirtyNonFullHeightOffset(v8);
    _UISheetLayoutInfoDirtyActiveDetents(v8);
    _UISheetLayoutInfoDirtyRubberBandExtentBeyondMinimumOffset(v8);
    _UISheetLayoutInfoDirtyRubberBandExtentBeyondMaximumOffset(v8);
    _UISheetLayoutInfoDirtyHostedUntransformedFrame(v8);
    _UISheetLayoutInfoDirtyFrameOfPresentedViewInContainerView(v8);
    _UISheetLayoutInfoDirtyCornerRadii(v8);
    _UISheetLayoutInfoDirtyShouldDimmingIgnoreTouches(v8);
  }
}

- (void)_setTransitioning:(BOOL)a3
{
  if (self->__transitioning != a3)
  {
    self->__transitioning = a3;
    _UISheetLayoutInfoDirtyAnyDescendantTransitioning(self);
  }
}

- (void)_setPresented:(BOOL)a3
{
  if (self->__presented != a3)
  {
    self->__presented = a3;
    _UISheetLayoutInfoDirtyEffectivePresented(self);
  }
}

- (void)_setPresentsWithGesture:(BOOL)a3
{
  if (self->__presentsWithGesture != a3)
  {
    self->__presentsWithGesture = a3;
    _UISheetLayoutInfoDirtyInteractionEnabled(self);
  }
}

- (BOOL)_isAnyDescendantDragging
{
  if ((*((unsigned char *)&self->_clean + 12) & 0x40) == 0)
  {
    if ([(_UISheetLayoutInfo *)self _isDragging])
    {
      self->__anyDescendantDragging = 1;
    }
    else
    {
      double v3 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
      self->__anyDescendantDragging = [v3 _isAnyDescendantDragging];
    }
    *((_DWORD *)&self->_clean + 3) |= 0x40u;
  }
  return self->__anyDescendantDragging;
}

- (BOOL)_isDragging
{
  return self->__dragging;
}

- (_UISheetLayoutInfo)initWithMetrics:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UISheetLayoutInfo;
  CGFloat v6 = [(_UISheetLayoutInfo *)&v23 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__metrics, a3);
    v7->__mode = [v5 defaultMode];
    CGSize v21 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    CGPoint v22 = (CGPoint)*MEMORY[0x1E4F1DB20];
    v7->__sourceFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v7->__sourceFrame.size = v21;
    int64x2_t v20 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&v7->__marginInCompactdouble Height = v20;
    v7->__keyboardFrame.origin = v22;
    v7->__keyboardFrame.size = v21;
    v7->__remoteKeyboardFrame.origin = v22;
    v7->__remoteKeyboardFrame.size = v21;
    v7->__shouldAdjustDetentsToAvoidKeyboard = 1;
    v7->__shouldScaleDownBehindDescendants = 1;
    v7->__reduceMotionEnabled = _AXSReduceMotionEnabled() != 0;
    v7->__peeksWhenFloating = 1;
    v7->__dismissible = 1;
    CGFloat v8 = +[UISheetPresentationControllerDetent largeDetent];
    v24[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    detents = v7->__detents;
    v7->__detents = (NSArray *)v9;

    double v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableDetentValues = v7->__mutableDetentValues;
    v7->__mutableDetentValues = v11;

    double v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableActiveDetents = v7->__mutableActiveDetents;
    v7->__mutableActiveDetents = v13;

    uint64_t v15 = +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:1];
    standardAppearance = v7->__standardAppearance;
    v7->__standardAppearance = (_UISheetPresentationControllerAppearance *)v15;

    *(_WORD *)&v7->__prefersScrollingResizesWhenDetentDirectionIsDown = 257;
    v7->__latestUserChosenOffset = 1.79769313e308;
    v7->__grabberSpacing = 5.0;
    v7->__grabberBlurEnabled = 1;
    v7->__dismissSourceFrame.origin = v22;
    v7->__dismissSourceFrame.size = v21;
    *(int64x2_t *)&v7->__dismissCornerRadius = v20;
    [v5 preferredShadowOpacity];
    v7->__preferredShadowOpacitCGFloat y = v17;
    [v5 shadowRadius];
    v7->__shadowRadius = v18;
    v7->__shouldDismissWhenTappedOutside = 1;
    v7->__hostParentStackAlignmentFrame.origin = v22;
    v7->__hostParentStackAlignmentFrame.size = v21;
    v7->__hostParentFullHeightUntransformedFrameForDepthLevel.origin = v22;
    v7->__hostParentFullHeightUntransformedFrameForDepthLevel.size = v21;
  }

  return v7;
}

- (void)_setMode:(int64_t)a3
{
  if (self->__mode != a3)
  {
    self->__mode = a3;
    _UISheetLayoutInfoDirtyPreferredSize(self);
  }
}

- (void)_setDelegate:(id)a3
{
}

- (void)_setAlwaysAllowsEdgeAttached:(BOOL)a3
{
  self->__alwaysAllowsEdgeAttached = a3;
}

- (void)_setWantsFullScreen:(BOOL)a3
{
  if (self->__wantsFullScreen != a3)
  {
    self->__wantsFullScreen = a3;
    double v3 = self;
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(v3);
    _UISheetLayoutInfoDirtyFunctionallyFullScreen(v3);
    _UISheetLayoutInfoDirtyPercentFullScreen(v3);
    _UISheetLayoutInfoDirtyAnyDescendantWantsFullScreen(v3);
  }
}

- (void)_setShouldScaleDownBehindDescendants:(BOOL)a3
{
  if (self->__shouldScaleDownBehindDescendants != a3)
  {
    self->__shouldScaleDownBehindDescendants = a3;
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(self);
  }
}

- (void)_setWantsGrabber:(BOOL)a3
{
  if (self->__wantsGrabber != a3)
  {
    self->__wantsGrabber = a3;
    _UISheetLayoutInfoDirtyGrabberAlpha(self);
  }
}

- (CGSize)_preferredSize
{
  if ((*((unsigned char *)&self->_clean + 1) & 1) == 0)
  {
    int64_t v3 = [(_UISheetLayoutInfo *)self _mode];
    if (v3 == 1)
    {
      CGFloat v14 = [(_UISheetLayoutInfo *)self _presentedViewController];
      [(_UISheetLayoutInfo *)self _containerBounds];
      double v16 = v15;
      double v18 = v17;
      CGFloat v19 = [(_UISheetLayoutInfo *)self _presentingViewController];
      int64x2_t v20 = [(_UISheetLayoutInfo *)self _presentedViewController];
      double v21 = _UISheetContentContainerSize(v19, v20, v16, v18);
      double v23 = v22;
      [(_UISheetLayoutInfo *)self _screenSize];
      objc_msgSend(v14, "_formSheetSizeForWindowWithSize:screenSize:", v21, v23, v24, v25);
      self->__preferredSize.double width = v26;
      self->__preferredSize.CGFloat height = v27;
    }
    else if (!v3)
    {
      if (qword_1EB25FFB8 != -1) {
        dispatch_once(&qword_1EB25FFB8, &__block_literal_global_40_0);
      }
      CGFloat v4 = [(_UISheetLayoutInfo *)self _presentedViewController];
      id v5 = [v4 view];
      +[UIViewController _boundsWidthWithMinimumHorizontalContentMarginForView:v5 preservingContentWidth:*(double *)&qword_1EB25FFB0];
      double v7 = v6;

      double v8 = __UIViewReadableWidthForFont(0);
      uint64_t v9 = [(_UISheetLayoutInfo *)self _presentedViewController];
      CGFloat v10 = [v9 view];
      +[UIViewController _boundsWidthWithMinimumHorizontalContentMarginForView:v10 preservingContentWidth:v8];
      double v12 = v11;

      if (v7 < v12) {
        double v7 = v12;
      }
      [(_UISheetLayoutInfo *)self _containerBounds];
      CGFloat Height = CGRectGetHeight(v31);
      self->__preferredSize.double width = v7;
      self->__preferredSize.CGFloat height = Height;
    }
    *(void *)&self->_clean |= 0x100uLL;
  }
  double width = self->__preferredSize.width;
  double v29 = self->__preferredSize.height;
  result.CGFloat height = v29;
  result.double width = width;
  return result;
}

- (CGSize)_screenSize
{
  double width = self->__screenSize.width;
  double height = self->__screenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIViewController)_presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (NSArray)_detentValues
{
  id v3 = [(_UISheetLayoutInfo *)self _activeDetents];
  mutableDetentValues = self->__mutableDetentValues;
  return (NSArray *)mutableDetentValues;
}

- (void)set_rubberBandExtentBeyondMinimumOffsetWasInvalidated:(id)a3
{
}

- (void)set_rubberBandExtentBeyondMaximumOffsetWasInvalidated:(id)a3
{
}

- (void)set_indexOfCurrentActiveOrDismissDetentWasInvalidated:(id)a3
{
}

- (void)_setCurrentOffsetGetter:(id)a3
{
}

- (void)_setWantsEdgeAttached:(BOOL)a3
{
  if (self->__wantsEdgeAttached != a3)
  {
    self->__wantsEdgeAttached = a3;
    _UISheetLayoutInfoDirtyEdgeAttached(self);
  }
}

- (void)_setAllowsInteractiveDismissWhenFullScreen:(BOOL)a3
{
  if (self->__allowsInteractiveDismissWhenFullScreen != a3)
  {
    self->__allowsInteractiveDismissWhenFullScreen = a3;
    _UISheetLayoutInfoDirtyInteractionEnabled(self);
  }
}

- (void)_setSelectedDetentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->__selectedDetentIdentifier;
  double v6 = (NSString *)v4;
  CGFloat v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    selectedDetentIdentifier = self->__selectedDetentIdentifier;
    self->__selectedDetentIdentifier = v8;

    _UISheetLayoutInfoDirtyActiveDetents(self);
    [(_UISheetLayoutInfo *)self _setLatestUserChosenOffset:1.79769313e308];
  }
LABEL_9:
}

- (void)_setDetents:(id)a3
{
  id v8 = a3;
  if (!-[NSArray isEqualToArray:](self->__detents, "isEqualToArray:"))
  {
    if (![v8 count])
    {
      char v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"_UISheetMetrics.m" lineNumber:1887 description:@"_detents must have at least one element."];
    }
    id v5 = (NSArray *)[v8 copy];
    detents = self->__detents;
    self->__detents = v5;

    _UISheetLayoutInfoDirtyActiveDetents(self);
    [(_UISheetLayoutInfo *)self _setLatestUserChosenOffset:1.79769313e308];
  }
}

- (void)_setLatestUserChosenOffset:(double)a3
{
  if (self->__latestUserChosenOffset != a3)
  {
    self->__latestUserChosenOffset = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setWantsInvertedWhenFloating:(BOOL)a3
{
  if (self->__wantsInvertedWhenFloating != a3)
  {
    self->__wantsInvertedWhenFloating = a3;
    _UISheetLayoutInfoDirtyInverted(self);
  }
}

- (void)_setWidthFollowsPreferredContentSizeWhenEdgeAttached:(BOOL)a3
{
  if (self->__widthFollowsPreferredContentSizeWhenEdgeAttached != a3)
  {
    self->__widthFollowsPreferredContentSizeWhenEdgeAttached = a3;
    _UISheetLayoutInfoDirtyStackAlignmentFrame(self);
  }
}

- (void)_setWantsEdgeAttachedInCompactHeight:(BOOL)a3
{
  if (self->__wantsEdgeAttachedInCompactHeight != a3)
  {
    self->__wantsEdgeAttachedInCompactCGFloat Height = a3;
    _UISheetLayoutInfoDirtyForcedFullScreen(self);
  }
}

- (void)_setPrefersScrollingResizesWhenDetentDirectionIsDown:(BOOL)a3
{
  if (self->__prefersScrollingResizesWhenDetentDirectionIsDown != a3)
  {
    self->__prefersScrollingResizesWhenDetentDirectionIsDown = a3;
    _UISheetLayoutInfoDirtyScrollInteractionEnabled(self);
  }
}

- (void)_setPeeksWhenFloating:(BOOL)a3
{
  if (self->__peeksWhenFloating != a3)
  {
    self->__peeksWhenFloating = a3;
    _UISheetLayoutInfoDirtyTransform(self);
  }
}

- (void)_setAdditionalMinimumTopInset:(double)a3
{
  if (self->__additionalMinimumTopInset != a3)
  {
    self->__additionalMinimumTopInset = a3;
    _UISheetLayoutInfoDirtyStackAlignmentFrame(self);
  }
}

- (void)_setWantsFloatingInRegularWidthCompactHeight:(BOOL)a3
{
  if (self->__wantsFloatingInRegularWidthCompactHeight != a3)
  {
    self->__wantsFloatingInRegularWidthCompactCGFloat Height = a3;
    id v3 = self;
    _UISheetLayoutInfoDirtyEdgeAttached(v3);
    _UISheetLayoutInfoDirtyForcedFullScreen(v3);
  }
}

- (void)_setMarginInRegularWidthRegularHeight:(double)a3
{
  if (self->__marginInRegularWidthRegularHeight != a3)
  {
    self->__marginInRegularWidthRegularCGFloat Height = a3;
    id v3 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v3);
    _UISheetLayoutInfoDirtyMargins(v3);
  }
}

- (void)_setMarginInCompactHeight:(double)a3
{
  if (self->__marginInCompactHeight != a3)
  {
    self->__marginInCompactCGFloat Height = a3;
    id v3 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v3);
    _UISheetLayoutInfoDirtyMargins(v3);
  }
}

- (void)_setHidden:(BOOL)a3
{
  if (self->__hidden != a3)
  {
    self->__hidden = a3;
    id v3 = self;
    _UISheetLayoutInfoDirtyEffectivePresented(v3);
    _UISheetLayoutInfoDirtyFrameOfPresentedViewInContainerView(v3);
  }
}

- (void)_setAllowsAsymmetricVerticalMargins:(BOOL)a3
{
  if (self->__allowsAsymmetricVerticalMargins != a3)
  {
    self->__allowsAsymmetricVerticalMargins = a3;
    id v3 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v3);
    _UISheetLayoutInfoDirtyMargins(v3);
  }
}

- (void)_setHorizontalAlignment:(int64_t)a3
{
  if (self->__horizontalAlignment != a3)
  {
    self->__horizontalAlignment = a3;
    id v3 = self;
    _UISheetLayoutInfoDirtyDismissesHorizontally(v3);
    _UISheetLayoutInfoDirtyStackAlignmentFrame(v3);
    _UISheetLayoutInfoDirtyRawCurrentOffset(v3);
  }
}

- (void)_setTucksIntoUnsafeAreaInCompactHeight:(BOOL)a3
{
  if (self->__tucksIntoUnsafeAreaInCompactHeight != a3)
  {
    BOOL v3 = a3;
    self->__tucksIntoUnsafeAreaInCompactCGFloat Height = a3;
    id v4 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v4);
    _UISheetLayoutInfoDirtyMargins(v4);

    id v5 = [(_UISheetLayoutInfo *)v4 _containerView];
    id v6 = v5;
    if (v3) {
      [v5 _addBoundingPathChangeObserver:v4];
    }
    else {
      [v5 _removeBoundingPathChangeObserver:v4];
    }
  }
}

- (void)_setSheetID:(id)a3
{
  id v5 = a3;
  id v6 = self->__sheetID;
  char v7 = (NSString *)v5;
  uint64_t v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(NSString *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->__sheetID, a3);
    _UISheetLayoutInfoDirtyAncestorSheetIDs(self);
  }
LABEL_9:
}

- (void)_setGrabberSpacing:(double)a3
{
  if (self->__grabberSpacing != a3)
  {
    self->__grabberSpacing = a3;
    BOOL v3 = self;
    id v4 = [(_UISheetLayoutInfo *)v3 _delegate];
    [v4 _sheetLayoutInfoDidInvalidateOutput:v3];
  }
}

- (void)_setGrabberBlurEnabled:(BOOL)a3
{
  if (self->__grabberBlurEnabled != a3)
  {
    self->__grabberBlurEnabled = a3;
    BOOL v3 = self;
    id v4 = [(_UISheetLayoutInfo *)v3 _delegate];
    [v4 _sheetLayoutInfoDidInvalidateOutput:v3];
  }
}

- (void)_setFloatingAppearance:(id)a3
{
  id v5 = a3;
  id v6 = self->__floatingAppearance;
  char v7 = (_UISheetPresentationControllerAppearance *)v5;
  CGFloat v10 = v7;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  if (v7 && v6)
  {
    BOOL v8 = [(_UISheetPresentationControllerAppearance *)v6 isEqual:v7];

    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->__floatingAppearance, a3);
  uint64_t clean = (uint64_t)self->_clean;
  if ((clean & 0x200000000) != 0)
  {
    *(void *)&self->_uint64_t clean = clean & 0xFFFFFFFDFFFFFFFFLL;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
LABEL_10:
}

- (void)_setStandardAppearance:(id)a3
{
  id v5 = a3;
  id v6 = self->__standardAppearance;
  char v7 = (_UISheetPresentationControllerAppearance *)v5;
  CGFloat v10 = v7;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  if (v7 && v6)
  {
    BOOL v8 = [(_UISheetPresentationControllerAppearance *)v6 isEqual:v7];

    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->__standardAppearance, a3);
  uint64_t clean = (uint64_t)self->_clean;
  if ((clean & 0x200000000) != 0)
  {
    *(void *)&self->_uint64_t clean = clean & 0xFFFFFFFDFFFFFFFFLL;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
LABEL_10:
}

- (void)_setSourceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->__sourceFrame, a3))
  {
    self->__sourceFrame.origin.CGFloat x = x;
    self->__sourceFrame.origin.CGFloat y = y;
    self->__sourceFrame.size.CGFloat width = width;
    self->__sourceFrame.size.CGFloat height = height;
    _UISheetLayoutInfoDirtyStackAlignmentFrame(self);
  }
}

- (void)_setKeyboardFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->__keyboardFrame, a3))
  {
    self->__keyboardFrame.origin.CGFloat x = x;
    self->__keyboardFrame.origin.CGFloat y = y;
    self->__keyboardFrame.size.CGFloat width = width;
    self->__keyboardFrame.size.CGFloat height = height;
    _UISheetLayoutInfoDirtyEffectiveKeyboardFrame(self);
  }
}

- (void)_setRemoteKeyboardFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->__remoteKeyboardFrame, a3))
  {
    self->__remoteKeyboardFrame.origin.CGFloat x = x;
    self->__remoteKeyboardFrame.origin.CGFloat y = y;
    self->__remoteKeyboardFrame.size.CGFloat width = width;
    self->__remoteKeyboardFrame.size.CGFloat height = height;
    _UISheetLayoutInfoDirtyEffectiveKeyboardFrame(self);
  }
}

- (void)_setContainsFirstResponder:(BOOL)a3
{
  if (self->__containsFirstResponder != a3)
  {
    self->__containsFirstResponder = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setFirstResponderRequiresKeyboard:(BOOL)a3
{
  if (self->__firstResponderRequiresKeyboard != a3)
  {
    self->__firstResponderRequiresKeyboard = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setRemoteContainsFirstResponder:(BOOL)a3
{
  if (self->__remoteContainsFirstResponder != a3)
  {
    self->__remoteContainsFirstResponder = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setRemoteFirstResponderRequiresKeyboard:(BOOL)a3
{
  if (self->__remoteFirstResponderRequiresKeyboard != a3)
  {
    self->__remoteFirstResponderRequiresKeyboard = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setShouldAdjustDetentsToAvoidKeyboard:(BOOL)a3
{
  if (self->__shouldAdjustDetentsToAvoidKeyboard != a3)
  {
    self->__shouldAdjustDetentsToAvoidKeyboard = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setReduceMotionEnabled:(BOOL)a3
{
  if (self->__reduceMotionEnabled != a3)
  {
    self->__reduceMotionEnabled = a3;
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(self);
  }
}

- (void)_setHosting:(BOOL)a3
{
  if (self->__hosting != a3)
  {
    self->__hosting = a3;
    BOOL v3 = self;
    _UISheetLayoutInfoDirtyProposedDepthLevel(v3);
    _UISheetLayoutInfoDirtyEffectiveKeyboardFrame(v3);
    _UISheetLayoutInfoDirtyActiveDetents(v3);
    _UISheetLayoutInfoDirtyHostedUntransformedFrame(v3);
    _UISheetLayoutInfoDirtyFrameOfPresentedViewInContainerView(v3);
    _UISheetLayoutInfoDirtyHostedCornerRadii(v3);
    _UISheetLayoutInfoDirtyTransform(v3);
    _UISheetLayoutInfoDirtyGrabberAlpha(v3);
    _UISheetLayoutInfoDirtyInteractionEnabled(v3);
    _UISheetLayoutInfoDirtyPercentDimmed(v3);
    _UISheetLayoutInfoDirtyShadowOpacity(v3);
    _UISheetLayoutInfoDirtyShouldPresentedViewControllerControlStatusBarAppearance(v3);
  }
}

- (void)_setDismissible:(BOOL)a3
{
  if (self->__dismissible != a3)
  {
    self->__dismissible = a3;
    _UISheetLayoutInfoDirtyEffectiveDismissible(self);
  }
}

- (void)_setEdgeAttachedCompactHeightAppearance:(id)a3
{
  id v5 = a3;
  id v6 = self->__edgeAttachedCompactHeightAppearance;
  char v7 = (_UISheetPresentationControllerAppearance *)v5;
  CGFloat v10 = v7;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  if (v7 && v6)
  {
    BOOL v8 = [(_UISheetPresentationControllerAppearance *)v6 isEqual:v7];

    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->__edgeAttachedCompactHeightAppearance, a3);
  uint64_t clean = (uint64_t)self->_clean;
  if ((clean & 0x200000000) != 0)
  {
    *(void *)&self->_uint64_t clean = clean & 0xFFFFFFFDFFFFFFFFLL;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
LABEL_10:
}

- (void)_setHiddenAncestorSheetID:(id)a3
{
  id v5 = a3;
  id v6 = self->__hiddenAncestorSheetID;
  char v7 = (NSString *)v5;
  double v11 = v7;
  if (v6 == v7)
  {

    uint64_t v9 = v11;
LABEL_10:

    goto LABEL_11;
  }
  if (!v7 || !v6)
  {

LABEL_8:
    objc_storeStrong((id *)&self->__hiddenAncestorSheetID, a3);
    CGFloat v10 = [(_UISheetLayoutInfo *)self _parentLayoutInfo];
    uint64_t v9 = v10;
    if (v10) {
      _UISheetLayoutInfoDirtyDescendantHiddenAncestorSheetIDs(v10);
    }
    goto LABEL_10;
  }
  char v8 = [(NSString *)v6 isEqual:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_11:
}

- (void)_setShouldDismissWhenTappedOutside:(BOOL)a3
{
  if (self->__shouldDismissWhenTappedOutside != a3)
  {
    self->__shouldDismissWhenTappedOutside = a3;
    _UISheetLayoutInfoDirtyShouldDimmingIgnoreTouches(self);
  }
}

- (void)_setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:(BOOL)a3
{
  if (self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge != a3)
  {
    self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge = a3;
    BOOL v3 = self;
    id v4 = [(_UISheetLayoutInfo *)v3 _delegate];
    [v4 _sheetLayoutInfoDidInvalidateOutput:v3];
  }
}

- (void)_setInsetsContentViewForGrabber:(BOOL)a3
{
  if (self->__insetsContentViewForGrabber != a3)
  {
    self->__insetsContentViewForGrabber = a3;
    BOOL v3 = self;
    id v4 = [(_UISheetLayoutInfo *)v3 _delegate];
    [v4 _sheetLayoutInfoDidInvalidateOutput:v3];
  }
}

- (void)_setDragging:(BOOL)a3
{
  if (self->__dragging != a3)
  {
    self->__dragging = a3;
    BOOL v3 = self;
    _UISheetLayoutInfoDirtyAnyDescendantDragging(v3);
    _UISheetLayoutInfoDirtyShouldDimmingIgnoreTouches(v3);
  }
}

- (void)_setDismissSourceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->__dismissSourceFrame, a3))
  {
    self->__dismissSourceFrame.origin.CGFloat x = x;
    self->__dismissSourceFrame.origin.CGFloat y = y;
    self->__dismissSourceFrame.size.CGFloat width = width;
    self->__dismissSourceFrame.size.CGFloat height = height;
    char v8 = self;
    _UISheetLayoutInfoDirtyDismissOffset(v8);
    _UISheetLayoutInfoDirtyUntransformedFrame(v8);
  }
}

- (void)_setDismissCornerRadius:(double)a3
{
  if (self->__dismissCornerRadius != a3)
  {
    self->__dismissCornerRadius = a3;
    _UISheetLayoutInfoDirtyCornerRadii(self);
  }
}

- (void)_setPreferredCornerRadius:(double)a3
{
  if (self->__preferredCornerRadius != a3)
  {
    self->__preferredCornerRadius = a3;
    _UISheetLayoutInfoDirtyCornerRadii(self);
  }
}

- (void)_setPreferredShadowOpacity:(double)a3
{
  if (self->__preferredShadowOpacity != a3)
  {
    self->__preferredShadowOpacitCGFloat y = a3;
    _UISheetLayoutInfoDirtyShadowOpacity(self);
  }
}

- (void)_setShadowRadius:(double)a3
{
  if (self->__shadowRadius != a3)
  {
    self->__shadowRadius = a3;
    BOOL v3 = self;
    id v4 = [(_UISheetLayoutInfo *)v3 _delegate];
    [v4 _sheetLayoutInfoDidInvalidateOutput:v3];
  }
}

- (void)_setRemoteProposedDepthLevel:(double)a3
{
  if (self->__remoteProposedDepthLevel != a3)
  {
    self->__remoteProposedDepthLevel = a3;
    _UISheetLayoutInfoDirtyProposedDepthLevel(self);
  }
}

- (void)_setHostParentStackAlignmentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->__hostParentStackAlignmentFrame, a3))
  {
    self->__hostParentStackAlignmentFrame.origin.CGFloat x = x;
    self->__hostParentStackAlignmentFrame.origin.CGFloat y = y;
    self->__hostParentStackAlignmentFrame.size.CGFloat width = width;
    self->__hostParentStackAlignmentFrame.size.CGFloat height = height;
    char v8 = self;
    _UISheetLayoutInfoDirtyDepthLevel(v8);
    _UISheetLayoutInfoDirtyParentDepthLevel(v8);
  }
}

- (void)_setHostParentFullHeightUntransformedFrameForDepthLevel:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->__hostParentFullHeightUntransformedFrameForDepthLevel, a3))
  {
    self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.CGFloat x = x;
    self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.CGFloat y = y;
    self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.CGFloat width = width;
    self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.CGFloat height = height;
    _UISheetLayoutInfoDirtyFullHeightUntransformedFrameForDepthLevel(self);
  }
}

- (void)_setHostParentDepthLevel:(double)a3
{
  if (self->__hostParentDepthLevel != a3)
  {
    self->__hostParentDepthLevel = a3;
    _UISheetLayoutInfoDirtyParentDepthLevel(self);
  }
}

- (BOOL)_isAnyDescendantTransitioning
{
  if ((*(unsigned char *)&self->_clean & 2) == 0)
  {
    if ([(_UISheetLayoutInfo *)self _isTransitioning])
    {
      self->__anyDescendantTransitioning = 1;
    }
    else
    {
      BOOL v3 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
      self->__anyDescendantTransitioning = [v3 _isAnyDescendantTransitioning];
    }
    *(void *)&self->_clean |= 2uLL;
  }
  return self->__anyDescendantTransitioning;
}

- (double)_fullDetentValue
{
  BOOL v3 = [(_UISheetLayoutInfo *)self _isEdgeAttached];
  [(_UISheetLayoutInfo *)self maximumDetentValue];
  double v5 = v4;
  if (v3)
  {
    [(_UISheetLayoutInfo *)self _fullHeightPresentedViewFrame];
    double MinY = CGRectGetMinY(v9);
    [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
    return v5 + MinY - v7;
  }
  return v5;
}

- (BOOL)_anyDescendantWantsFullScreen
{
  if ((*((unsigned char *)&self->_clean + 12) & 0x80) == 0)
  {
    if ([(_UISheetLayoutInfo *)self _wantsFullScreen]
      && [(_UISheetLayoutInfo *)self _isEffectivePresented])
    {
      self->__anyDescendantWantsFullScreen = 1;
    }
    else
    {
      BOOL v3 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
      self->__anyDescendantWantsFullScreen = [v3 _anyDescendantWantsFullScreen];
    }
    *((_DWORD *)&self->_clean + 3) |= 0x80u;
  }
  return self->__anyDescendantWantsFullScreen;
}

- (int64_t)_adjustedIndexOfCurrentActiveDetentForContainedFirstResponder
{
  id v3 = [(_UISheetLayoutInfo *)self _activeDetents];
  return self->__adjustedIndexOfCurrentActiveDetentForContainedFirstResponder;
}

- (int64_t)_numberOfActiveNonDismissDetents
{
  id v3 = [(_UISheetLayoutInfo *)self _activeDetents];
  return self->__numberOfActiveNonDismissDetents;
}

- (int64_t)_indexOfActiveDetentForTappingGrabber
{
  if ((*((unsigned char *)&self->_clean + 3) & 0x10) != 0) {
    return self->__indexOfActiveDetentForTappingGrabber;
  }
  int64_t v3 = [(_UISheetLayoutInfo *)self _numberOfActiveNonDismissDetents];
  int64_t result = (v3 + [(_UISheetLayoutInfo *)self _indexOfCurrentActiveDetent] - 1) % v3;
  self->__indexOfActiveDetentForTappingGrabber = result;
  *(void *)&self->_clean |= 0x10000000uLL;
  return result;
}

- (int64_t)_grabberAction
{
  if ((*((unsigned char *)&self->_clean + 3) & 0x20) != 0) {
    return self->__grabberAction;
  }
  if ([(_UISheetLayoutInfo *)self _adjustedIndexOfCurrentActiveDetentForContainedFirstResponder] == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v3 = [(_UISheetLayoutInfo *)self _indexOfActiveDetentForTappingGrabber];
    int64_t v4 = [(_UISheetLayoutInfo *)self _indexOfCurrentActiveDetent];
    if (v4 == v3)
    {
      int64_t result = 1;
    }
    else if (v4 < v3)
    {
      int64_t result = 2;
    }
    else
    {
      int64_t result = 3;
    }
    self->__grabberAction = result;
  }
  else
  {
    int64_t result = 0;
    self->__grabberAction = 0;
  }
  *(void *)&self->_clean |= 0x20000000uLL;
  return result;
}

- (double)_rubberBandExtentBeyondMinimumOffset
{
  if ((*((unsigned char *)&self->_clean + 3) & 0x80) == 0)
  {
    if ([(_UISheetLayoutInfo *)self _isInverted])
    {
      if (![(_UISheetLayoutInfo *)self _dismissesHorizontally])
      {
        [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
        self->__rubberBandExtentBeyondMinimumOffset = fmax(fmin(CGRectGetHeight(v12) * 0.25, 200.0), 0.0);
        goto LABEL_8;
      }
      int64_t v3 = [(_UISheetLayoutInfo *)self _metrics];
      [v3 topOffset];
      self->__rubberBandExtentBeyondMinimumOffset = v4;
    }
    else
    {
      [(_UISheetLayoutInfo *)self _containerBounds];
      double MinY = CGRectGetMinY(v11);
      int64_t v3 = [(_UISheetLayoutInfo *)self _activeDetents];
      id v6 = [v3 firstObject];
      [v6 _value];
      double v8 = MinY + v7;
      [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
      self->__rubberBandExtentBeyondMinimumOffset = fmax(fmin(v8 - v9, 100.0), 0.0);
    }
LABEL_8:
    *(void *)&self->_clean |= 0x80000000uLL;
  }
  return self->__rubberBandExtentBeyondMinimumOffset;
}

- (double)_rubberBandExtentBeyondMaximumOffset
{
  if ((*((unsigned char *)&self->_clean + 4) & 1) == 0)
  {
    if ([(_UISheetLayoutInfo *)self _isInverted])
    {
      [(_UISheetLayoutInfo *)self _containerBounds];
      double MaxY = CGRectGetMaxY(v11);
      double v4 = [(_UISheetLayoutInfo *)self _activeDetents];
      double v5 = [v4 firstObject];
      [v5 _value];
      double v7 = MaxY - v6;
      [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
      self->__rubberBandExtentBeyondMaximumOffset = fmax(fmin(v7 - v8, 100.0), 0.0);
    }
    else
    {
      if (![(_UISheetLayoutInfo *)self _dismissesHorizontally])
      {
        [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
        self->__rubberBandExtentBeyondMaximumOffset = fmax(fmin(CGRectGetHeight(v12) * 0.25, 200.0), 0.0);
        goto LABEL_8;
      }
      double v4 = [(_UISheetLayoutInfo *)self _metrics];
      [v4 topOffset];
      self->__rubberBandExtentBeyondMaximumOffset = v9;
    }

LABEL_8:
    *(void *)&self->_clean |= 0x100000000uLL;
  }
  return self->__rubberBandExtentBeyondMaximumOffset;
}

- (CGRect)_hostedDismissFrame
{
  [(_UISheetLayoutInfo *)self _dismissOffset];
  double v4 = v3;
  if ([(_UISheetLayoutInfo *)self _isHosting])
  {
    [(_UISheetLayoutInfo *)self _containerBounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    int v13 = [(_UISheetLayoutInfo *)self _isEdgeAttached];
    char v14 = [(_UISheetLayoutInfo *)self _dismissesHorizontally];
    int v15 = [(_UISheetLayoutInfo *)self _isInverted];
    int v16 = [(_UISheetLayoutInfo *)self _isExpanded];
    [(_UISheetLayoutInfo *)self _offsetAdjustment];
    double v18 = v17;
    CGFloat v19 = [(_UISheetLayoutInfo *)self _activeDetents];
    [(_UISheetLayoutInfo *)self _smallestNonDismissDetentOffset];
    double v21 = v20;
    double v22 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
    [v22 displayScale];
    double v24 = v23;
    [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
    double v6 = _UISheetLayoutInfoUntransformedFrame(v13, v14, v15, v16, v19, 0.0, v4, v18, v21, v24, v34, v35, v36, v26, v28, v30, v32, v33);
    double v8 = v37;
    double v10 = v38;
    double v12 = v39;
  }
  double v40 = v6;
  double v41 = v8;
  double v42 = v10;
  double v43 = v12;
  result.size.CGFloat height = v43;
  result.size.CGFloat width = v42;
  result.origin.CGFloat y = v41;
  result.origin.CGFloat x = v40;
  return result;
}

- (NSString)description
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(_UISheetLayoutInfo *)self _containerBounds];
  id v4 = (id)objc_msgSend(v3, "appendRect:withName:", @"_containerBounds");
  [(_UISheetLayoutInfo *)self _containerSafeAreaInsets];
  id v5 = (id)objc_msgSend(v3, "ui_appendEdgeInsets:withName:", @"_containerSafeAreaInsets");
  double v6 = [(_UISheetLayoutInfo *)self _containerTraitCollection];
  id v7 = (id)objc_msgSend(v3, "ui_appendObject:withName:usingLightweightDescription:", v6, @"_containerTraitCollection", 1);

  [(_UISheetLayoutInfo *)self _additionalMinimumTopInset];
  id v8 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_additionalMinimumTopInset");
  id v9 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _mode](self, "_mode"), @"_mode");
  [(_UISheetLayoutInfo *)self _sourceFrame];
  id v10 = (id)objc_msgSend(v3, "ui_appendRect:withName:ifNotEqualTo:", @"_sourceFrame");
  id v11 = (id)objc_msgSend(v3, "ui_appendInteger:withName:ifNotEqualTo:", -[_UISheetLayoutInfo _horizontalAlignment](self, "_horizontalAlignment"), @"_horizontalAlignment", 0);
  [(_UISheetLayoutInfo *)self _marginInCompactHeight];
  id v12 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_marginInCompactHeight");
  [(_UISheetLayoutInfo *)self _marginInRegularWidthRegularHeight];
  id v13 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_marginInRegularWidthRegularHeight");
  id v14 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _tucksIntoUnsafeAreaInCompactHeight](self, "_tucksIntoUnsafeAreaInCompactHeight"), @"_tucksIntoUnsafeAreaInCompactHeight", 1);
  id v15 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _allowsAsymmetricVerticalMargins](self, "_allowsAsymmetricVerticalMargins"), @"_allowsAsymmetricVerticalMargins", 1);
  [(_UISheetLayoutInfo *)self _keyboardFrame];
  id v16 = (id)objc_msgSend(v3, "ui_appendRect:withName:ifNotEqualTo:", @"_keyboardFrame");
  id v17 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _wantsFullScreen](self, "_wantsFullScreen"), @"_wantsFullScreen", 1);
  id v18 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _wantsEdgeAttached](self, "_wantsEdgeAttached"), @"_wantsEdgeAttached", 1);
  id v19 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _wantsEdgeAttachedInCompactHeight](self, "_wantsEdgeAttachedInCompactHeight"), @"_wantsEdgeAttachedInCompactHeight", 1);
  id v20 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _widthFollowsPreferredContentSizeWhenEdgeAttached](self, "_widthFollowsPreferredContentSizeWhenEdgeAttached"), @"_widthFollowsPreferredContentSizeWhenEdgeAttached", 1);
  id v21 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isPresented](self, "_isPresented"), @"_presented");
  id v22 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _shouldScaleDownBehindDescendants](self, "_shouldScaleDownBehindDescendants"), @"_shouldScaleDownBehindDescendants", 0);
  id v23 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isReduceMotionEnabled](self, "_isReduceMotionEnabled"), @"_reduceMotionEnabled", 1);
  id v24 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isHosting](self, "_isHosting"), @"_hosting", 1);
  id v25 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isDismissible](self, "_isDismissible"), @"_dismissible");
  CGFloat v26 = [(_UISheetLayoutInfo *)self _detents];
  id v27 = (id)[v3 appendObject:v26 withName:@"_detents"];

  CGFloat v28 = [(_UISheetLayoutInfo *)self _selectedDetentIdentifier];
  [v3 appendString:v28 withName:@"_selectedDetentIdentifier"];

  double v29 = [(_UISheetLayoutInfo *)self _standardAppearance];
  id v30 = (id)[v3 appendObject:v29 withName:@"_standardAppearance"];

  double v31 = [(_UISheetLayoutInfo *)self _edgeAttachedCompactHeightAppearance];
  id v32 = (id)[v3 appendObject:v31 withName:@"_edgeAttachedCompactHeightAppearance" skipIfNil:1];

  double v33 = [(_UISheetLayoutInfo *)self _floatingAppearance];
  id v34 = (id)[v3 appendObject:v33 withName:@"_floatingAppearance" skipIfNil:1];

  double v35 = [(_UISheetLayoutInfo *)self _sheetID];
  [v3 appendString:v35 withName:@"_sheetID" skipIfEmpty:1];

  double v36 = [(_UISheetLayoutInfo *)self _hiddenAncestorSheetID];
  [v3 appendString:v36 withName:@"_hiddenAncestorSheetID" skipIfEmpty:1];

  id v37 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _shouldDismissWhenTappedOutside](self, "_shouldDismissWhenTappedOutside"), @"_shouldDismissWhenTappedOutside", 0);
  id v38 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _allowsInteractiveDismissWhenFullScreen](self, "_allowsInteractiveDismissWhenFullScreen"), @"_allowsInteractiveDismissWhenFullScreen", 1);
  id v39 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _prefersScrollingResizesWhenDetentDirectionIsDown](self, "_prefersScrollingResizesWhenDetentDirectionIsDown"), @"_prefersScrollingResizesWhenDetentDirectionIsDown", 0);
  id v40 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge](self, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"), @"_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge", 0);
  [(_UISheetLayoutInfo *)self _latestUserChosenOffset];
  id v41 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_latestUserChosenOffset");
  id v42 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _wantsGrabber](self, "_wantsGrabber"), @"_wantsGrabber", 1);
  [(_UISheetLayoutInfo *)self _grabberSpacing];
  id v43 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_grabberSpacing");
  id v44 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _insetsContentViewForGrabber](self, "_insetsContentViewForGrabber"), @"_insetsContentViewForGrabber", 1);
  id v45 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isDragging](self, "_isDragging"), @"_dragging", 1);
  [(_UISheetLayoutInfo *)self _dismissSourceFrame];
  id v46 = (id)objc_msgSend(v3, "ui_appendRect:withName:ifNotEqualTo:", @"_dismissSourceFrame");
  [(_UISheetLayoutInfo *)self _dismissCornerRadius];
  id v47 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_dismissCornerRadius");
  [(_UISheetLayoutInfo *)self _preferredCornerRadius];
  id v48 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_preferredCornerRadius");
  [(_UISheetLayoutInfo *)self _preferredShadowOpacity];
  double v50 = v49;
  double v51 = [(_UISheetLayoutInfo *)self _metrics];
  [v51 preferredShadowOpacity];
  id v53 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_preferredShadowOpacity", v50, v52);

  [(_UISheetLayoutInfo *)self _shadowRadius];
  double v55 = v54;
  int64_t v56 = [(_UISheetLayoutInfo *)self _metrics];
  [v56 shadowRadius];
  id v58 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_shadowRadius", v55, v57);

  double v59 = [(_UISheetLayoutInfo *)self _ancestorSheetIDs];
  id v60 = (id)objc_msgSend(v3, "ui_appendArray:withName:skipIfEmpty:", v59, @"_ancestorSheetIDs", 1);

  BOOL v61 = [(_UISheetLayoutInfo *)self _descendantHiddenAncestorSheetIDs];
  id v62 = (id)objc_msgSend(v3, "ui_appendSet:withName:skipIfEmpty:", v61, @"_descendantHiddenAncestorSheetIDs", 1);

  id v63 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isHidingUnderneathDescendant](self, "_isHidingUnderneathDescendant"), @"_hidingUnderneathDescendant", 1);
  [(_UISheetLayoutInfo *)self _marginsWhenFloating];
  id v64 = (id)objc_msgSend(v3, "ui_appendEdgeInsets:withName:", @"_marginsWhenFloating");
  [(_UISheetLayoutInfo *)self _margins];
  id v65 = (id)objc_msgSend(v3, "ui_appendEdgeInsets:withName:", @"_margins");
  [(_UISheetLayoutInfo *)self _preferredSize];
  id v66 = (id)objc_msgSend(v3, "appendSize:withName:", @"_preferredSize");
  [(_UISheetLayoutInfo *)self _percentFullHeight];
  id v67 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_percentFullHeight");
  id v68 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isHidingUnderneathDescendantForDepthLevel](self, "_isHidingUnderneathDescendantForDepthLevel"), @"_hidingUnderneathDescendantForDepthLevel", 1);
  [(_UISheetLayoutInfo *)self _proposedDepthLevel];
  id v69 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_proposedDepthLevel");
  [(_UISheetLayoutInfo *)self _depthLevel];
  id v70 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", @"_depthLevel");
  id v71 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _scalesDownBehindDescendants](self, "_scalesDownBehindDescendants"), @"_scalesDownBehindDescendants", 0);
  id v72 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached"), @"_edgeAttached", 1);
  id v73 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isForcedFullScreen](self, "_isForcedFullScreen"), @"_forcedFullScreen", 1);
  id v74 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isFunctionallyFullScreen](self, "_isFunctionallyFullScreen"), @"_functionallyFullScreen", 1);
  [(_UISheetLayoutInfo *)self _percentFullScreen];
  id v75 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_percentFullScreen");
  [(_UISheetLayoutInfo *)self _effectiveKeyboardFrame];
  id v76 = (id)objc_msgSend(v3, "ui_appendRect:withName:ifNotEqualTo:", @"_effectiveKeyboardFrame");
  [(_UISheetLayoutInfo *)self _stackAlignmentFrame];
  id v77 = (id)objc_msgSend(v3, "appendRect:withName:", @"_stackAlignmentFrame");
  id v78 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _stacksWithChild](self, "_stacksWithChild"), @"_stacksWithChild");
  [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrame];
  id v79 = (id)objc_msgSend(v3, "appendRect:withName:", @"_fullHeightUntransformedFrame");
  [(_UISheetLayoutInfo *)self _fullHeightUntransformedFrameForDepthLevel];
  id v80 = (id)objc_msgSend(v3, "appendRect:withName:", @"_fullHeightUntransformedFrameForDepthLevel");
  [(_UISheetLayoutInfo *)self _dismissOffset];
  id v81 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_dismissOffset");
  CGRect v82 = [(_UISheetLayoutInfo *)self _effectiveAppearance];
  id v83 = (id)[v3 appendObject:v82 withName:@"_effectiveAppearance"];

  [(_UISheetLayoutInfo *)self _offsetForCurrentActiveDetent];
  id v84 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_offsetForCurrentActiveDetent");
  [(_UISheetLayoutInfo *)self _currentOffset];
  id v85 = (id)objc_msgSend(v3, "appendPoint:withName:", @"_currentOffset");
  [(_UISheetLayoutInfo *)self _nonFullHeightOffset];
  id v86 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_nonFullHeightOffset");
  [(_UISheetLayoutInfo *)self _offsetAdjustment];
  id v87 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_offsetAdjustment");
  [(_UISheetLayoutInfo *)self _percentPresented];
  id v88 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_percentPresented");
  id v89 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented"), @"_effectivePresented");
  id v90 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isAnyDescendantDragging](self, "_isAnyDescendantDragging"), @"_anyDescendantDragging", 1);
  id v91 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _anyDescendantWantsFullScreen](self, "_anyDescendantWantsFullScreen"), @"_anyDescendantWantsFullScreen", 1);
  v92 = [(_UISheetLayoutInfo *)self _detentValues];
  id v93 = (id)[v3 appendObject:v92 withName:@"_detentValues"];

  v94 = [(_UISheetLayoutInfo *)self _activeDetents];
  id v95 = (id)[v3 appendObject:v94 withName:@"_activeDetents"];

  id v96 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _indexOfCurrentActiveDetent](self, "_indexOfCurrentActiveDetent"), @"_indexOfCurrentActiveDetent");
  id v97 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _indexOfActiveDimmingDetent](self, "_indexOfActiveDimmingDetent"), @"_indexOfActiveDimmingDetent");
  [(_UISheetLayoutInfo *)self _smallestNonDismissDetentOffset];
  id v98 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_smallestNonDismissDetentOffset");
  id v99 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _numberOfActiveNonDismissDetents](self, "_numberOfActiveNonDismissDetents"), @"_numberOfActiveNonDismissDetents");
  id v100 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _indexOfActiveDetentForTappingGrabber](self, "_indexOfActiveDetentForTappingGrabber"), @"_indexOfActiveDetentForTappingGrabber");
  id v101 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _grabberAction](self, "_grabberAction"), @"_grabberAction");
  id v102 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _indexOfCurrentActiveOrDismissDetent](self, "_indexOfCurrentActiveOrDismissDetent"), @"_indexOfCurrentActiveOrDismissDetent");
  [(_UISheetLayoutInfo *)self _rubberBandExtentBeyondMinimumOffset];
  id v103 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_rubberBandExtentBeyondMinimumOffset");
  [(_UISheetLayoutInfo *)self _rubberBandExtentBeyondMaximumOffset];
  id v104 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_rubberBandExtentBeyondMaximumOffset");
  [(_UISheetLayoutInfo *)self _untransformedFrame];
  id v105 = (id)objc_msgSend(v3, "appendRect:withName:", @"_untransformedFrame");
  [(_UISheetLayoutInfo *)self _hostedUntransformedFrame];
  id v106 = (id)objc_msgSend(v3, "appendRect:withName:", @"_hostedUntransformedFrame");
  [(_UISheetLayoutInfo *)self _frameOfPresentedViewInContainerView];
  id v107 = (id)objc_msgSend(v3, "appendRect:withName:", @"_frameOfPresentedViewInContainerView");
  [(_UISheetLayoutInfo *)self _touchInsets];
  id v108 = (id)objc_msgSend(v3, "ui_appendEdgeInsets:withName:", @"_touchInsets");
  [(_UISheetLayoutInfo *)self _cornerRadii];
  id v109 = (id)objc_msgSend(v3, "ui_appendCornerRadii:withName:", @"_cornerRadii");
  [(_UISheetLayoutInfo *)self _transform];
  id v110 = (id)objc_msgSend(v3, "ui_appendTransform:withName:", &v125, @"_transform");
  [(_UISheetLayoutInfo *)self _percentDimmedFromOffset];
  id v111 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_percentDimmedFromOffset");
  [(_UISheetLayoutInfo *)self _percentDimmed];
  id v112 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_percentDimmed");
  [(_UISheetLayoutInfo *)self _confinedPercentDimmed];
  id v113 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_confinedPercentDimmed");
  [(_UISheetLayoutInfo *)self _magicShadowOpacity];
  id v114 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_magicShadowOpacity");
  [(_UISheetLayoutInfo *)self _shadowOpacity];
  id v115 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_shadowOpacity");
  [(_UISheetLayoutInfo *)self _alpha];
  id v116 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_alpha");
  [(_UISheetLayoutInfo *)self _grabberAlpha];
  id v117 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", @"_grabberAlpha");
  id v118 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isInteractionEnabled](self, "_isInteractionEnabled"), @"_interactionEnabled");
  id v119 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _shouldPresentedViewControllerControlStatusBarAppearance](self, "_shouldPresentedViewControllerControlStatusBarAppearance"), @"_shouldPresentedViewControllerControlStatusBarAppearance");
  id v120 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _shouldDimmingIgnoreTouches](self, "_shouldDimmingIgnoreTouches"), @"_shouldDimmingIgnoreTouches");
  id v121 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isDimmingEnabled](self, "_isDimmingEnabled"), @"_dimmingEnabled");
  id v122 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isExpanded](self, "_isExpanded"), @"_expanded");
  v123 = [v3 build];

  return (NSString *)v123;
}

- (id)_descendantDescription
{
  v2 = self;
  double v3 = [(_UISheetLayoutInfo *)v2 _parentLayoutInfo];

  if (v3)
  {
    do
    {
      id v4 = [(_UISheetLayoutInfo *)v2 _parentLayoutInfo];

      id v5 = [(_UISheetLayoutInfo *)v4 _parentLayoutInfo];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v7 = [(_UISheetLayoutInfo *)v4 description];
  id v8 = (void *)[v6 initWithString:v7];

  id v9 = [(_UISheetLayoutInfo *)v4 _childLayoutInfo];

  if (v9)
  {
    do
    {
      id v10 = [(_UISheetLayoutInfo *)v4 _childLayoutInfo];

      [v8 appendString:@"\n"];
      id v11 = [(_UISheetLayoutInfo *)v10 description];
      [v8 appendString:v11];

      id v12 = [(_UISheetLayoutInfo *)v10 _childLayoutInfo];

      id v4 = v10;
    }
    while (v12);
  }
  else
  {
    id v10 = v4;
  }

  return v8;
}

- (BOOL)_hasChildSheet
{
  v2 = [(_UISheetLayoutInfo *)self _childLayoutInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (double)_invertedDepthLevel
{
  [(_UISheetLayoutInfo *)self _maximumDepthLevelInChain];
  double v4 = v3;
  [(_UISheetLayoutInfo *)self _depthLevel];
  return v4 - v5;
}

- (double)_maximumDepthLevelInChain
{
  v2 = self;
  uint64_t v3 = [(_UISheetLayoutInfo *)v2 _parentLayoutInfo];
  if (v3)
  {
    double v4 = (void *)v3;
    do
    {
      double v5 = v4;

      double v4 = [(_UISheetLayoutInfo *)v5 _parentLayoutInfo];

      v2 = v5;
    }
    while (v4);
  }
  else
  {
    double v5 = v2;
  }
  [(_UISheetLayoutInfo *)v5 _depthLevel];
  double v7 = v6;

  return v7;
}

- (CGRect)_remoteKeyboardFrame
{
  double x = self->__remoteKeyboardFrame.origin.x;
  double y = self->__remoteKeyboardFrame.origin.y;
  double width = self->__remoteKeyboardFrame.size.width;
  double height = self->__remoteKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_firstResponderRequiresKeyboard
{
  return self->__firstResponderRequiresKeyboard;
}

- (BOOL)_remoteContainsFirstResponder
{
  return self->__remoteContainsFirstResponder;
}

- (BOOL)_remoteFirstResponderRequiresKeyboard
{
  return self->__remoteFirstResponderRequiresKeyboard;
}

- (BOOL)_shouldAdjustDetentsToAvoidKeyboard
{
  return self->__shouldAdjustDetentsToAvoidKeyboard;
}

- (BOOL)_wantsFloatingInRegularWidthCompactHeight
{
  return self->__wantsFloatingInRegularWidthCompactHeight;
}

- (BOOL)_isTransitioning
{
  return self->__transitioning;
}

- (BOOL)_shouldDismissWhenTappedOutside
{
  return self->__shouldDismissWhenTappedOutside;
}

- (double)_tearOffset
{
  return self->__tearOffset;
}

- (void)_setTearOffset:(double)a3
{
  self->__tearOffset = a3;
}

- (double)_remoteProposedDepthLevel
{
  return self->__remoteProposedDepthLevel;
}

- (CGRect)_hostParentFullHeightUntransformedFrameForDepthLevel
{
  double x = self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.x;
  double y = self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.y;
  double width = self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.width;
  double height = self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_hostParentDepthLevel
{
  return self->__hostParentDepthLevel;
}

- (id)_currentOffsetGetter
{
  return self->__currentOffsetGetter;
}

- (id)_rubberBandExtentBeyondMinimumOffsetWasInvalidated
{
  return self->__rubberBandExtentBeyondMinimumOffsetWasInvalidated;
}

- (id)_rubberBandExtentBeyondMaximumOffsetWasInvalidated
{
  return self->__rubberBandExtentBeyondMaximumOffsetWasInvalidated;
}

- (NSMutableArray)_mutableDetentValues
{
  return self->__mutableDetentValues;
}

- (NSMutableArray)_mutableActiveDetents
{
  return self->__mutableActiveDetents;
}

@end