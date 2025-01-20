@interface UITextSelectionDisplayInteraction
+ (BOOL)isModernSelectionViewEnabled;
+ (BOOL)isTextAccelerationUIEnabled;
- (BOOL)_clientManagesSelectionViewSubviewOrder;
- (BOOL)_isCursorAccessoryViewEnabled;
- (BOOL)_isCursorAccessoryViewVisible;
- (BOOL)_isCursorVisible;
- (BOOL)_isDictationRunning;
- (BOOL)_isDisplayingVerticalSelection;
- (BOOL)_isHighlightVisible;
- (BOOL)_isManagedSelectionSubview:(id)a3;
- (BOOL)_isRangeAdjustmentUIVisible;
- (BOOL)_isVisible;
- (BOOL)_shouldHitTestSelectionGrabbers;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)cursorBlinks;
- (BOOL)cursorVisible;
- (BOOL)ghostAppearance;
- (BOOL)isActivated;
- (BOOL)isCursorHidden;
- (CGAffineTransform)_caretTransform;
- (CGAffineTransform)_lollipopTransformForSelectionRect:(SEL)a3 view:(id)a4;
- (CGAffineTransform)_transformRelativeToTextInputCoordinateSpace:(SEL)a3 forView:(CGAffineTransform *)a4;
- (CGRect)_caretRect;
- (CGRect)_caretRectAtStartOfLine;
- (CGRect)_caretRectForDictationTrailingGlowView;
- (CGRect)_caretRectForPosition:(id)a3;
- (CGRect)_contentBoundsForPlacement:(int64_t)a3;
- (CGRect)_grabberDotRectForTextRangeAdjustmentEdgeRect:(CGRect)a3 isVertical:(BOOL)a4 direction:(unint64_t)a5;
- (CGRect)_selectionClipRectAt:(int64_t)a3;
- (CGRect)_textInputRectInSelectionViewCoordinateSpace:(CGRect)a3;
- (CGRect)_textRangeAdjustmentRectForEdge:(unint64_t)a3 selectionRects:(id)a4;
- (CGRect)paddedTextRangeAdjustmentHitRegionForEdge:(unint64_t)a3 precision:(unint64_t)a4;
- (CGRect)textRangeAdjustmentRectForEdge:(unint64_t)a3;
- (CGRect)textSelectionMenuSourceRect;
- (NSArray)_preferredLayoutRectsForEditMenu;
- (NSArray)handleViews;
- (UIColor)_cursorTintColor;
- (UIEdgeInsets)_paddedEdgeInsetsForGrabberDirection:(unint64_t)a3 isVertical:(BOOL)a4 scale:(double)a5;
- (UIStandardTextCursorView)_cursorView;
- (UITextCursorAssertionController)_cursorAssertionController;
- (UITextSelectionDisplayInteraction)initWithTextInput:(id)textInput delegate:(id)delegate;
- (UIView)cursorView;
- (UIView)highlightView;
- (UIView)view;
- (_UIContainerWindowPortalInteraction)cursorPortalInteraction;
- (_UIContainerWindowPortalInteraction)trailingPortalInteraction;
- (_UICursorAccessoryViewController)_cursorAccessoryViewController;
- (_UITextCursorTrailingGlowView)_trailingGlowView;
- (_UITextSelectionHighlightView)_highlightView;
- (_UITextSelectionRangeAdjustmentContainerView)_rangeAdjustmentViewContainer;
- (_UITextUnderlineView)_existingUnderlineView;
- (_UITextUnderlineView)_underlineView;
- (double)_cursorAlpha;
- (double)_highlightAndRangeAdjustmentAlpha;
- (id)_activeSelection;
- (id)_allManagedSubviews;
- (id)_beginFloatingCursorSessionAtPoint:(CGPoint)a3 inContainer:(id)a4;
- (id)_hostViewAboveText;
- (id)_hostViewBelowText;
- (id)_initWithTextInput:(id)a3 delegate:(id)a4 activated:(BOOL)a5;
- (id)_internalDelegate;
- (id)_managedSubviewsAboveText;
- (id)_managedSubviewsBelowText;
- (id)_managedViewForType:(int64_t)a3;
- (id)_obtainGhostCursorAssertion;
- (id)_obtainGrabberSuppressionAssertion;
- (id)_obtainHideCursorAccessoriesAssertionWithReason:(id)a3;
- (id)_obtainSelectionUIHiddenAssertionForReason:(id)a3 animated:(BOOL)a4;
- (id)_obtainShimmerHighlightAssertion;
- (id)_proofreadingUnderlineView;
- (id)_selectedRange;
- (id)_tintColorOrDefault:(id)a3;
- (id)_tintColorOrDefault:(id)a3 alpha:(double)a4;
- (id)_underlineRectsForRange:(id)a3;
- (id)_underlineTextInRange:(id)a3 animated:(BOOL)a4;
- (id)_underlineTextInRange:(id)a3 animated:(BOOL)a4 preferredUUID:(id)a5;
- (id)_visibleSelectionRectsForRange:(id)a3;
- (id)defaultUnderlineColor;
- (id)delegate;
- (id)inputModeForDictationLanguage:(id)a3;
- (id)obtainBlinkSuppressionAssertionForReason:(id)a3;
- (id)obtainGhostCursorAssertionForReason:(id)a3;
- (id)textInput;
- (id)textRangeAdjustmentViewForEdge:(unint64_t)a3;
- (int)_glowViewMode;
- (int)rangeViewMode;
- (unint64_t)activeIndicators;
- (void)_addInteractiveUnderlines:(id)a3 animated:(BOOL)a4;
- (void)_cursorAccessoryViewController:(id)a3 didActivateCursorAccessory:(id)a4;
- (void)_dictationDidBeginNotification:(id)a3;
- (void)_dictationDidFinishNotification:(id)a3;
- (void)_dictationDidPauseNotification:(id)a3;
- (void)_dictationDidResumeNotification:(id)a3;
- (void)_dictationWillInsertHypothesisNotification:(id)a3;
- (void)_didBeginRangeAdjustmentInteraction:(id)a3;
- (void)_didEndRangeAdjustmentInteraction:(id)a3;
- (void)_didReceiveApplicationWillResumeNotification:(id)a3;
- (void)_didReceiveApplicationWillSuspendNotification:(id)a3;
- (void)_enableDictationPortalViews;
- (void)_filterArchivedSubviews:(id)a3;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_initializeDictationSupport;
- (void)_initializeManagedDictationViewsIfNecessary;
- (void)_installManagedSubviewsIfNecessary;
- (void)_layoutManagedSubviewsResettingBlinkingAnimation:(BOOL)a3;
- (void)_performCursorBulgeAnimation;
- (void)_removeAllInteractiveUnderlinesAnimated:(BOOL)a3;
- (void)_removeAllProofreadingUnderlinesAnimated:(BOOL)a3;
- (void)_removeInteractiveUndelines:(id)a3 animiated:(BOOL)a4;
- (void)_removeManagedSubviews;
- (void)_removeUnderlineWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)_resetDictationPortalViews;
- (void)_setCursorFadedHiddenForFloatingCursor:(BOOL)a3 animated:(BOOL)a4;
- (void)_setGlowViewMode:(int)a3;
- (void)_trackingViewportDidLayout:(id)a3;
- (void)_updateAccessibilityNonBlinkingAssertion;
- (void)_updateAnimatedUnderlinesIfNeeded;
- (void)_updateDelegateConformance;
- (void)_updateDictationUI;
- (void)_updateHighlightViewWithShimmerState;
- (void)_updateSelectionIfNeeded;
- (void)_updateSelectionIfNeededResettingBlinkingAnimation:(id)a3;
- (void)_updateTextInputConformance;
- (void)_updateUnderlinesIfNeeded;
- (void)_updateViewConformance;
- (void)_viewVisibilityDidChange;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)cleanUpProofreading;
- (void)clearDeleteButtonCursorAssertion;
- (void)clearInputModeCursorAssertion;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)layoutManagedSubviews;
- (void)setActivated:(BOOL)activated;
- (void)setActiveIndicators:(unint64_t)a3;
- (void)setActiveIndicators:(unint64_t)a3 animationStyle:(int64_t)a4;
- (void)setCursorBlinks:(BOOL)a3;
- (void)setCursorHidden:(BOOL)a3;
- (void)setCursorPortalInteraction:(id)a3;
- (void)setCursorView:(UIView *)cursorView;
- (void)setCursorVisible:(BOOL)a3;
- (void)setGhostAppearance:(BOOL)a3;
- (void)setHandleViews:(NSArray *)handleViews;
- (void)setHighlightView:(UIView *)highlightView;
- (void)setNeedsSelectionUpdate;
- (void)setRangeViewMode:(int)a3;
- (void)setTrailingPortalInteraction:(id)a3;
- (void)set_dictationBlinkSuppressionAssertion:(uint64_t)a1;
- (void)set_isDictationRunning:(BOOL)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UITextSelectionDisplayInteraction

- (void)_trackingViewportDidLayout:(id)a3
{
  id v4 = a3;
  if (self->_needsUpdate && (*(unsigned char *)&self->_textInputRespondsTo & 0x10) != 0)
  {
    id v9 = v4;
    v5 = [v4 object];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    v7 = [WeakRetained textLayoutManager];
    v8 = [v7 textViewportLayoutController];

    if (v5 == v8) {
      [(UITextSelectionDisplayInteraction *)self _updateSelectionIfNeeded];
    }

    id v4 = v9;
  }
}

- (void)_updateSelectionIfNeeded
{
  [(UITextSelectionDisplayInteraction *)self _updateSelectionIfNeededResettingBlinkingAnimation:MEMORY[0x1E4F1CC38]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  v3 = [WeakRetained textInputView];
  [v3 _selectionDidUpdate];
}

- (void)willMoveToView:(id)a3
{
  [(UITextSelectionDisplayInteraction *)self _removeManagedSubviews];
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)_removeManagedSubviews
{
  v3 = [(UITextSelectionDisplayInteraction *)self _hostViewAboveText];
  -[UIView _removeGeometryChangeObserver:](v3, self);

  id v4 = [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];
  -[UIView _removeGeometryChangeObserver:](v4, self);

  [(NSArray *)self->_managedSubviewsBelowText makeObjectsPerformSelector:sel_removeFromSuperview];
  managedSubviewsBelowText = self->_managedSubviewsBelowText;
  self->_managedSubviewsBelowText = 0;

  [(NSArray *)self->_managedSubviewsAboveText makeObjectsPerformSelector:sel_removeFromSuperview];
  managedSubviewsAboveText = self->_managedSubviewsAboveText;
  self->_managedSubviewsAboveText = 0;

  self->_didInstallManagedSubviews = 0;
}

- (CGRect)_textInputRectInSelectionViewCoordinateSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
  p_textInput = &self->_textInput;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  v10 = [WeakRetained textInputView];
  -[UIView convertRect:fromView:](rangeAdjustmentViewContainer, "convertRect:fromView:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  id v19 = objc_loadWeakRetained((id *)p_textInput);
  v20 = [v19 textInputView];
  [v20 contentScaleFactor];
  double v22 = UIRectIntegralWithScale(v12, v14, v16, v18, v21);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)_contentBoundsForPlacement:(int64_t)a3
{
  if (a3) {
    [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];
  }
  else {
  v3 = [(UITextSelectionDisplayInteraction *)self _hostViewAboveText];
  }
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  if (objc_msgSend(v3, "__isKindOfUIScrollView"))
  {
    [v3 contentSize];
    BOOL v10 = v8 > v5;
    if (v9 > v7) {
      BOOL v10 = 1;
    }
    if (v10)
    {
      double v5 = v8;
      double v7 = v9;
    }
  }

  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = v5;
  double v14 = v7;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (id)_hostViewAboveText
{
  char viewRespondsTo = (char)self->_viewRespondsTo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  double v4 = WeakRetained;
  if (viewRespondsTo) {
    [WeakRetained _selectionContainerViewAboveText];
  }
  else {
  double v5 = [WeakRetained textInputView];
  }

  return v5;
}

- (id)_selectedRange
{
  v2 = [(UITextSelectionDisplayInteraction *)self _activeSelection];
  v3 = [v2 selectedRange];

  return v3;
}

- (void)_updateSelectionIfNeededResettingBlinkingAnimation:(id)a3
{
  uint64_t v304 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_needsUpdate)
  {
    [(UITextSelectionDisplayInteraction *)self _selectionClipRectAt:1];
    CGFloat x = v305.origin.x;
    CGFloat y = v305.origin.y;
    CGFloat width = v305.size.width;
    CGFloat height = v305.size.height;
    BOOL IsNull = CGRectIsNull(v305);
    p_textInput = &self->_textInput;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    double v11 = [WeakRetained textInputView];
    [v11 _scaleFromLayerTransforms];
    double v13 = v12;

    double v14 = 1.0;
    if (v13 > 1.0) {
      double v14 = 1.0 / v13;
    }
    double v266 = v14;
    v267 = [(UITextSelectionDisplayInteraction *)self _activeSelection];
    v268 = [v267 selectedRange];
    double v15 = -[UITextSelectionDisplayInteraction _visibleSelectionRectsForRange:](self, "_visibleSelectionRectsForRange:");
    v278 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v297 = 0u;
    long long v298 = 0u;
    long long v299 = 0u;
    long long v300 = 0u;
    obuint64_t j = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v297 objects:v303 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v298;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v298 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v297 + 1) + 8 * i);
          double v21 = (void *)[v20 mutableCopy];
          highlightView = self->_highlightView;
          [v20 rect];
          double v24 = v23;
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          id v31 = objc_loadWeakRetained((id *)&self->_textInput);
          double v32 = [v31 textInputView];
          -[UITextSelectionHighlightView convertRect:fromView:](highlightView, "convertRect:fromView:", v32, v24, v26, v28, v30);
          double v34 = v33;
          double v36 = v35;
          double v38 = v37;
          double v40 = v39;

          if (!IsNull)
          {
            v306.origin.CGFloat x = x;
            v306.origin.CGFloat y = y;
            v306.size.CGFloat width = width;
            v306.size.CGFloat height = height;
            v322.origin.CGFloat x = v34;
            v322.origin.CGFloat y = v36;
            v322.size.CGFloat width = v38;
            v322.size.CGFloat height = v40;
            CGRect v307 = CGRectIntersection(v306, v322);
            double v34 = v307.origin.x;
            double v36 = v307.origin.y;
            double v38 = v307.size.width;
            double v40 = v307.size.height;
          }
          if (UIRectIsDiscrete(v34, v36, v38, v40))
          {
            id v41 = objc_loadWeakRetained((id *)&self->_textInput);
            v42 = [v41 textInputView];

            objc_msgSend(v21, "setRect:fromView:", v42, v34, v36, v38, v40);
            v43 = [v21 _path];
            if (v43)
            {
              if (v42)
              {
                [v42 transform];
                if (!CGAffineTransformIsIdentity(&v296))
                {
                  memset(&v295, 0, sizeof(v295));
                  [v42 transform];
                  goto LABEL_18;
                }
              }
              else
              {
                memset(&v296, 0, sizeof(v296));
                if (!CGAffineTransformIsIdentity(&v296))
                {
                  memset(&v295, 0, sizeof(v295));
                  memset(&v294, 0, sizeof(v294));
LABEL_18:
                  CGAffineTransformInvert(&v295, &v294);
                  CGAffineTransform v293 = v295;
                  [v43 applyTransform:&v293];
                }
              }
            }
            [v278 addObject:v21];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v297 objects:v303 count:16];
      }
      while (v17);
    }

    v44 = [v278 array];
    BOOL v45 = [(UITextSelectionDisplayInteraction *)self _isHighlightVisible];
    v46 = self->_highlightView;
    if (!v45)
    {
      [(UITextSelectionHighlightView *)v46 setHidden:1];
      goto LABEL_58;
    }
    [(UITextSelectionHighlightView *)v46 setHidden:0];
    [(UITextSelectionDisplayInteraction *)self _contentBoundsForPlacement:1];
    -[UITextSelectionHighlightView setFrame:](self->_highlightView, "setFrame:");
    [(UITextSelectionHighlightView *)self->_highlightView setSelectionRects:v44];
    [(UITextSelectionDisplayInteraction *)self _highlightAndRangeAdjustmentAlpha];
    -[UITextSelectionHighlightView setAlpha:](self->_highlightView, "setAlpha:");
    v47 = self;
    id v48 = objc_loadWeakRetained((id *)&self->_view);
    v49 = [v48 traitCollection];
    BOOL v275 = [v49 userInterfaceStyle] == 2;

    v50 = &selRef_secureCandidateHeight;
    if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_32; {
    id v51 = objc_loadWeakRetained((id *)&self->_textInput);
    }
    if (objc_opt_respondsToSelector())
    {
      id v52 = objc_loadWeakRetained((id *)&self->_textInput);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v53 = objc_loadWeakRetained((id *)&self->_textInput);
        NSProtocolFromString(&cfstr_Betextinput.isa);
        v55 = v54 = v44;
        int dyb = [v53 conformsToProtocolCached:v55];

        v44 = v54;
        v50 = &selRef_secureCandidateHeight;
        if (dyb)
        {
          id v56 = objc_loadWeakRetained((id *)p_textInput);
          v57 = [v56 performSelector:sel_extendedTextInputTraits];

          if (objc_opt_respondsToSelector())
          {
            v58 = [v57 performSelector:sel_selectionHighlightColor];
            self = v47;
            goto LABEL_38;
          }
          self = v47;
          goto LABEL_42;
        }
LABEL_32:
        self = v47;
        if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_43; {
        v57 = objc_loadWeakRetained((id *)p_textInput);
        }
        if (objc_opt_respondsToSelector())
        {
          id v59 = objc_loadWeakRetained((id *)p_textInput);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v60 = v50;
            id v61 = objc_loadWeakRetained((id *)p_textInput);
            int v62 = [v61 conformsToProtocolCached:&unk_1ED6D1028];

            v50 = v60;
            if (!v62) {
              goto LABEL_43;
            }
            id v63 = objc_loadWeakRetained((id *)p_textInput);
            v57 = [v63 extendedTraitsDelegate];

            if (objc_opt_respondsToSelector())
            {
              v58 = [v57 selectionHighlightColor];
LABEL_38:

              if (v58)
              {
                id v64 = v58;
                goto LABEL_46;
              }
LABEL_43:
              id v65 = objc_loadWeakRetained((id *)p_textInput);
              v66 = v50[200];
              char v67 = objc_opt_respondsToSelector();

              if ((v67 & 1) == 0
                || (id v68 = objc_loadWeakRetained((id *)p_textInput),
                    [v68 performSelector:v66],
                    v69 = objc_claimAutoreleasedReturnValue(),
                    v68,
                    !v69))
              {
                double v72 = dbl_186B94D20[v275];
                v70 = +[UIColor selectionHighlightColor];
                id v71 = [(UITextSelectionDisplayInteraction *)self _tintColorOrDefault:v70 alpha:v72];

LABEL_48:
                [(UITextSelectionHighlightView *)self->_highlightView setTintColor:v71];

                if (self->_concreteHighlightView)
                {
                  id v73 = objc_loadWeakRetained((id *)p_textInput);
                  char v74 = objc_opt_respondsToSelector();

                  double v75 = 0.0;
                  double v76 = 0.0;
                  if (v74)
                  {
                    id v77 = objc_loadWeakRetained((id *)p_textInput);
                    [v77 selectionBorderWidth];
                    double v76 = v78;
                  }
                  [(_UITextSelectionHighlightView *)self->_concreteHighlightView _setSelectionBorderWidth:v76];
                  id v79 = objc_loadWeakRetained((id *)p_textInput);
                  char v80 = objc_opt_respondsToSelector();

                  if (v80)
                  {
                    id v81 = objc_loadWeakRetained((id *)p_textInput);
                    [v81 selectionCornerRadius];
                    double v75 = v82;
                  }
                  [(_UITextSelectionHighlightView *)self->_concreteHighlightView _setSelectionCornerRadius:v75];
                  id v83 = objc_loadWeakRetained((id *)p_textInput);
                  char v84 = objc_opt_respondsToSelector();

                  double v85 = 0.0;
                  double v86 = 0.0;
                  double v87 = 0.0;
                  double v88 = 0.0;
                  if (v84)
                  {
                    id v89 = objc_loadWeakRetained((id *)p_textInput);
                    [v89 selectionEdgeInsets];
                    double v88 = v90;
                    double v87 = v91;
                    double v86 = v92;
                    double v85 = v93;
                  }
                  -[_UITextSelectionHighlightView _setSelectionEdgeInsets:](self->_concreteHighlightView, "_setSelectionEdgeInsets:", v88, v87, v86, v85);
                  v94 = +[UIColor clearColor];
                  id v95 = objc_loadWeakRetained((id *)p_textInput);
                  char v96 = objc_opt_respondsToSelector();

                  if (v96)
                  {
                    id v97 = objc_loadWeakRetained((id *)p_textInput);
                    uint64_t v98 = [v97 selectionBorderColor];

                    v94 = (void *)v98;
                  }
                  id v99 = v94;

                  [(_UITextSelectionHighlightView *)self->_concreteHighlightView _setSelectionBorderColor:v99];
                }
LABEL_58:
                if (!-[UITextSelectionDisplayInteraction _isRangeAdjustmentUIVisible](self, "_isRangeAdjustmentUIVisible")|| ![v44 count])
                {
                  [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer setHidden:1];
                  goto LABEL_141;
                }
                [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer setHidden:0];
                [(UITextSelectionDisplayInteraction *)self _contentBoundsForPlacement:0];
                -[UIView setFrame:](self->_rangeAdjustmentViewContainer, "setFrame:");
                [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer setShapeScale:v266];
                v100 = [v44 firstObject];
                -[_UITextSelectionRangeAdjustmentContainerView setVertical:](self->_rangeAdjustmentViewContainer, "setVertical:", [v100 isVertical]);

                [(UITextSelectionDisplayInteraction *)self _highlightAndRangeAdjustmentAlpha];
                -[UIView setAlpha:](self->_rangeAdjustmentViewContainer, "setAlpha:");
                v101 = +[UITextSelectionRect startRectFromRects:v44];
                v102 = +[UITextSelectionRect endRectFromRects:v44];
                rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
                [v101 _startEdgeRect];
                -[UIView convertRect:fromView:](rangeAdjustmentViewContainer, "convertRect:fromView:", self->_highlightView);
                -[_UITextSelectionRangeAdjustmentContainerView setStartEdge:](self->_rangeAdjustmentViewContainer, "setStartEdge:");
                v104 = self->_rangeAdjustmentViewContainer;
                [v102 _endEdgeRect];
                -[UIView convertRect:fromView:](v104, "convertRect:fromView:", self->_highlightView);
                -[_UITextSelectionRangeAdjustmentContainerView setEndEdge:](self->_rangeAdjustmentViewContainer, "setEndEdge:");
                [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer layoutSubviews];
                uint64_t v105 = [(UITextSelectionDisplayInteraction *)self _hostViewAboveText];
                v106 = [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer leadingLollipopView];
                v261 = [v101 _startCustomSelectionPath];
                v107 = [v261 bezierPathForHostView:v105 targetView:v106];
                [v106 setCustomShape:v107];

                v108 = [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer trailingLollipopView];
                v259 = [v102 _endCustomSelectionPath];
                v264 = (void *)v105;
                v109 = [v259 bezierPathForHostView:v105 targetView:v108];
                [v108 setCustomShape:v109];

                v265 = v101;
                [(UITextSelectionDisplayInteraction *)self _lollipopTransformForSelectionRect:v101 view:v106];
                v292[0] = v292[3];
                v292[1] = v292[4];
                v292[2] = v292[5];
                v262 = v106;
                [v106 setTransform:v292];
                v276 = self;
                v263 = v102;
                [(UITextSelectionDisplayInteraction *)self _lollipopTransformForSelectionRect:v102 view:v108];
                v291[0] = v291[3];
                v291[1] = v291[4];
                v291[2] = v291[5];
                v260 = v108;
                [v108 setTransform:v291];
                if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_69; {
                id v110 = objc_loadWeakRetained((id *)p_textInput);
                }
                if (objc_opt_respondsToSelector())
                {
                  id v111 = objc_loadWeakRetained((id *)p_textInput);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v112 = objc_loadWeakRetained((id *)p_textInput);
                    NSProtocolFromString(&cfstr_Betextinput.isa);
                    v114 = v113 = v44;
                    int v115 = [v112 conformsToProtocolCached:v114];

                    v44 = v113;
                    if (v115)
                    {
                      id v116 = objc_loadWeakRetained((id *)p_textInput);
                      v117 = [v116 performSelector:sel_extendedTextInputTraits];

                      if (objc_opt_respondsToSelector())
                      {
                        uint64_t v118 = [v117 performSelector:sel_selectionHandleColor];
                        goto LABEL_75;
                      }
                      goto LABEL_78;
                    }
LABEL_69:
                    if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_79; {
                    v117 = objc_loadWeakRetained((id *)p_textInput);
                    }
                    if (objc_opt_respondsToSelector())
                    {
                      id v119 = objc_loadWeakRetained((id *)p_textInput);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v120 = objc_loadWeakRetained((id *)p_textInput);
                        int v121 = [v120 conformsToProtocolCached:&unk_1ED6D1028];

                        if (!v121) {
                          goto LABEL_79;
                        }
                        id v122 = objc_loadWeakRetained((id *)p_textInput);
                        v117 = [v122 extendedTraitsDelegate];

                        if (objc_opt_respondsToSelector())
                        {
                          uint64_t v118 = [v117 selectionHandleColor];
LABEL_75:
                          v123 = (void *)v118;

                          if (v123)
                          {
LABEL_96:
                            id v142 = v123;
                            goto LABEL_103;
                          }
LABEL_79:
                          id v124 = objc_loadWeakRetained((id *)p_textInput);
                          char v125 = objc_opt_respondsToSelector();

                          if (v125)
                          {
                            id v126 = objc_loadWeakRetained((id *)p_textInput);
                            v127 = [v126 performSelector:sel_selectionHandleColor];

                            id v128 = v127;
                            if (v127) {
                              goto LABEL_106;
                            }
                          }
                          if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_89; {
                          id v129 = objc_loadWeakRetained((id *)p_textInput);
                          }
                          if (objc_opt_respondsToSelector())
                          {
                            id v130 = objc_loadWeakRetained((id *)p_textInput);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v131 = objc_loadWeakRetained((id *)p_textInput);
                              NSProtocolFromString(&cfstr_Betextinput.isa);
                              v133 = v132 = v44;
                              int v134 = [v131 conformsToProtocolCached:v133];

                              v44 = v132;
                              if (v134)
                              {
                                id v135 = objc_loadWeakRetained((id *)p_textInput);
                                v136 = [v135 performSelector:sel_extendedTextInputTraits];

                                if (objc_opt_respondsToSelector())
                                {
                                  v123 = [v136 performSelector:sel_selectionBarColor];
                                  v137 = v276;
                                  goto LABEL_95;
                                }
                                v137 = v276;
                                goto LABEL_99;
                              }
LABEL_89:
                              v137 = v276;
                              if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_100; {
                              v136 = objc_loadWeakRetained((id *)p_textInput);
                              }
                              if (objc_opt_respondsToSelector())
                              {
                                id v138 = objc_loadWeakRetained((id *)p_textInput);
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v139 = objc_loadWeakRetained((id *)p_textInput);
                                  int v140 = [v139 conformsToProtocolCached:&unk_1ED6D1028];

                                  if (!v140) {
                                    goto LABEL_100;
                                  }
                                  id v141 = objc_loadWeakRetained((id *)p_textInput);
                                  v136 = [v141 extendedTraitsDelegate];

                                  if (objc_opt_respondsToSelector())
                                  {
                                    v123 = [v136 selectionBarColor];
LABEL_95:

                                    if (v123) {
                                      goto LABEL_96;
                                    }
LABEL_100:
                                    id v143 = objc_loadWeakRetained((id *)p_textInput);
                                    char v144 = objc_opt_respondsToSelector();

                                    if ((v144 & 1) == 0
                                      || (id v145 = objc_loadWeakRetained((id *)p_textInput),
                                          [v145 performSelector:sel_selectionBarColor],
                                          v146 = objc_claimAutoreleasedReturnValue(),
                                          v145,
                                          !v146))
                                    {
                                      v147 = +[UIColor selectionGrabberColor];
                                      id v128 = [(UITextSelectionDisplayInteraction *)v137 _tintColorOrDefault:v147];

                                      goto LABEL_105;
                                    }
                                    id v142 = v146;
LABEL_103:
                                    v147 = v142;
                                    id v128 = v142;
LABEL_105:

LABEL_106:
                                    long long v289 = 0u;
                                    long long v290 = 0u;
                                    long long v287 = 0u;
                                    long long v288 = 0u;
                                    v148 = [(_UITextSelectionRangeAdjustmentContainerView *)v276->_rangeAdjustmentViewContainer selectionGrabbers];
                                    uint64_t v149 = [v148 countByEnumeratingWithState:&v287 objects:v302 count:16];
                                    if (v149)
                                    {
                                      uint64_t v150 = v149;
                                      uint64_t v151 = *(void *)v288;
                                      do
                                      {
                                        for (uint64_t j = 0; j != v150; ++j)
                                        {
                                          if (*(void *)v288 != v151) {
                                            objc_enumerationMutation(v148);
                                          }
                                          [*(id *)(*((void *)&v287 + 1) + 8 * j) setTintColor:v128];
                                        }
                                        uint64_t v150 = [v148 countByEnumeratingWithState:&v287 objects:v302 count:16];
                                      }
                                      while (v150);
                                    }

                                    if ([(_UITextSelectionRangeAdjustmentContainerView *)v276->_rangeAdjustmentViewContainer areSelectionGrabbersConcreteImpl])
                                    {
                                      id v258 = v4;
                                      v153 = +[_UITextSelectionLollipopView _visualStyle];
                                      [v153 minimumStemLength];
                                      double v155 = v154;

                                      [v265 _startEdgeRect];
                                      double v156 = CGRectGetHeight(v308);
                                      uint64_t v157 = [v264 _enclosingScrollerIncludingSelf];
                                      v158 = (void *)v157;
                                      if (v157) {
                                        v159 = (void *)v157;
                                      }
                                      else {
                                        v159 = v264;
                                      }
                                      id v160 = v159;

                                      long long v285 = 0u;
                                      long long v286 = 0u;
                                      long long v283 = 0u;
                                      long long v284 = 0u;
                                      id v270 = [(_UITextSelectionRangeAdjustmentContainerView *)v276->_rangeAdjustmentViewContainer selectionGrabbers];
                                      uint64_t v161 = [v270 countByEnumeratingWithState:&v283 objects:v301 count:16];
                                      if (v161)
                                      {
                                        uint64_t v162 = v161;
                                        uint64_t v163 = *(void *)v284;
                                        double v164 = -0.0;
                                        if (v155 - v156 > 0.0) {
                                          double v164 = (v155 - v156) * -2.0;
                                        }
                                        dCGFloat y = v164;
                                        do
                                        {
                                          uint64_t v165 = 0;
                                          do
                                          {
                                            if (*(void *)v284 != v163) {
                                              objc_enumerationMutation(v270);
                                            }
                                            v166 = *(void **)(*((void *)&v283 + 1) + 8 * v165);
                                            [v160 visibleBounds];
                                            if ((*(unsigned char *)&v276->_textInputRespondsTo & 8) != 0)
                                            {
                                              id v175 = objc_loadWeakRetained((id *)p_textInput);
                                              [v175 unobscuredContentRect];
                                              double v177 = v176;
                                              double v179 = v178;
                                              double v181 = v180;
                                              double v183 = v182;

                                              id v184 = objc_loadWeakRetained((id *)p_textInput);
                                              v185 = [v184 textInputView];
                                              objc_msgSend(v160, "convertRect:fromView:", v185, v177, v179, v181, v183);
                                              CGFloat v171 = v186;
                                              CGFloat v172 = v187;
                                              CGFloat v173 = v188;
                                              CGFloat v174 = v189;
                                            }
                                            else
                                            {
                                              CGFloat v171 = v167;
                                              CGFloat v172 = v168;
                                              CGFloat v173 = v169;
                                              CGFloat v174 = v170;
                                            }
                                            [v166 dotViewFrame];
                                            objc_msgSend(v160, "convertRect:fromView:", v166);
                                            double v191 = v190;
                                            double v193 = v192;
                                            double v195 = v194;
                                            double v197 = v196;
                                            id v198 = objc_loadWeakRetained((id *)&v276->_view);
                                            [v198 contentScaleFactor];
                                            double v200 = UIRectIntegralWithScale(v191, v193, v195, v197, v199);
                                            CGFloat v202 = v201;
                                            CGFloat v204 = v203;
                                            CGFloat v206 = v205;

                                            v309.origin.CGFloat x = v200;
                                            v309.origin.CGFloat y = v202;
                                            v309.size.CGFloat width = v204;
                                            v309.size.CGFloat height = v206;
                                            CGRect v310 = CGRectInset(v309, 0.0, dy);
                                            CGFloat v207 = v310.origin.x;
                                            CGFloat v208 = v310.origin.y;
                                            CGFloat v209 = v310.size.width;
                                            CGFloat v210 = v310.size.height;
                                            v310.origin.CGFloat x = v171;
                                            v310.origin.CGFloat y = v172;
                                            v310.size.CGFloat width = v173;
                                            v310.size.CGFloat height = v174;
                                            v323.origin.CGFloat x = v207;
                                            v323.origin.CGFloat y = v208;
                                            v323.size.CGFloat width = v209;
                                            v323.size.CGFloat height = v210;
                                            if (CGRectContainsRect(v310, v323)) {
                                              goto LABEL_134;
                                            }
                                            v311.origin.CGFloat x = v171;
                                            v311.origin.CGFloat y = v172;
                                            v311.size.CGFloat width = v173;
                                            v311.size.CGFloat height = v174;
                                            v324.origin.CGFloat x = v207;
                                            v324.origin.CGFloat y = v208;
                                            v324.size.CGFloat width = v209;
                                            v324.size.CGFloat height = v210;
                                            CGRect v312 = CGRectIntersection(v311, v324);
                                            CGFloat v211 = v312.origin.x;
                                            CGFloat v212 = v312.origin.y;
                                            CGFloat v213 = v312.size.width;
                                            CGFloat v214 = v312.size.height;
                                            if (CGRectGetHeight(v312) <= 0.0)
                                            {
                                              v313.origin.CGFloat x = v211;
                                              v313.origin.CGFloat y = v212;
                                              v313.size.CGFloat width = v213;
                                              v313.size.CGFloat height = v214;
                                              if (CGRectGetWidth(v313) <= 0.0) {
                                                goto LABEL_134;
                                              }
                                            }
                                            if ([v166 direction] == 2) {
                                              goto LABEL_132;
                                            }
                                            v314.origin.CGFloat x = v211;
                                            v314.origin.CGFloat y = v212;
                                            v314.size.CGFloat width = v213;
                                            v314.size.CGFloat height = v214;
                                            double MinY = CGRectGetMinY(v314);
                                            v315.origin.CGFloat x = v207;
                                            v315.origin.CGFloat y = v208;
                                            v315.size.CGFloat width = v209;
                                            v315.size.CGFloat height = v210;
                                            if (MinY == CGRectGetMinY(v315))
                                            {
LABEL_132:
                                              if ([v166 direction] == 8)
                                              {
                                                BOOL v215 = 1;
                                              }
                                              else
                                              {
                                                v316.origin.CGFloat x = v211;
                                                v316.origin.CGFloat y = v212;
                                                v316.size.CGFloat width = v213;
                                                v316.size.CGFloat height = v214;
                                                double MaxY = CGRectGetMaxY(v316);
                                                v317.origin.CGFloat x = v207;
                                                v317.origin.CGFloat y = v208;
                                                v317.size.CGFloat width = v209;
                                                v317.size.CGFloat height = v210;
                                                BOOL v215 = MaxY == CGRectGetMaxY(v317);
                                              }
                                            }
                                            else
                                            {
LABEL_134:
                                              BOOL v215 = 0;
                                            }
                                            [v166 setPortalsDotToContainerWindow:v215];
                                            ++v165;
                                          }
                                          while (v162 != v165);
                                          uint64_t v217 = [v270 countByEnumeratingWithState:&v283 objects:v301 count:16];
                                          uint64_t v162 = v217;
                                        }
                                        while (v217);
                                      }

                                      id v4 = v258;
                                    }

                                    self = v276;
LABEL_141:
                                    [(UITextSelectionDisplayInteraction *)self _caretRect];
                                    CGFloat v219 = v218;
                                    CGFloat v221 = v220;
                                    CGFloat v223 = v222;
                                    CGFloat v225 = v224;
                                    v226 = [(UITextSelectionDisplayInteraction *)self _cursorTintColor];
                                    if (IsNull)
                                    {
                                      BOOL v227 = 1;
                                      double v228 = v219;
                                      double v229 = v221;
                                      double v230 = v223;
                                      double v231 = v225;
                                    }
                                    else
                                    {
                                      [(UITextSelectionDisplayInteraction *)self _selectionClipRectAt:0];
                                      v325.origin.CGFloat x = v219;
                                      v325.origin.CGFloat y = v221;
                                      v325.size.CGFloat width = v223;
                                      v325.size.CGFloat height = v225;
                                      CGRect v319 = CGRectIntersection(v318, v325);
                                      double v228 = v319.origin.x;
                                      double v229 = v319.origin.y;
                                      double v230 = v319.size.width;
                                      double v231 = v319.size.height;
                                      if (!UIRectIsDiscrete(v319.origin.x, v319.origin.y, v319.size.width, v319.size.height))
                                      {
                                        [(UITextSelectionDisplayInteraction *)self _isCursorVisible];
                                        goto LABEL_155;
                                      }
                                      v320.origin.CGFloat x = v228;
                                      v320.origin.CGFloat y = v229;
                                      v320.size.CGFloat width = v230;
                                      v320.size.CGFloat height = v231;
                                      BOOL v227 = !CGRectIsEmpty(v320);
                                    }
                                    if ([(UITextSelectionDisplayInteraction *)self _isCursorVisible]
                                      && v227)
                                    {
                                      double v271 = v225;
                                      double dya = v223;
                                      double v277 = v221;
                                      double v281 = v219;
                                      v232 = [(UITextCursorView *)self->_cursorView layer];
                                      [v232 anchorPoint];
                                      double v234 = v233;
                                      double v236 = v235;

                                      double v237 = *MEMORY[0x1E4F1DAD8];
                                      double v238 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
                                      double v239 = v228 + v230 * v234;
                                      double v240 = v229 + v231 * v236;
                                      if ((*(unsigned char *)&self->_delegateRespondsTo & 0x10) != 0)
                                      {
                                        v241 = [(UITextSelectionDisplayInteraction *)self _internalDelegate];
                                        objc_msgSend(v241, "_selectionViewManager:convertPointToRenderSpace:textRange:", self, v268, v239, v240);
                                        double v239 = v242;
                                        double v240 = v243;
                                      }
                                      -[UITextCursorView setBounds:](self->_cursorView, "setBounds:", v237, v238, v230, v231);
                                      -[UITextCursorView setCenter:](self->_cursorView, "setCenter:", v239, v240);
                                      [(UITextSelectionDisplayInteraction *)self _caretTransform];
                                      cursorView = self->_cursorView;
                                      v282[0] = v282[3];
                                      v282[1] = v282[4];
                                      v282[2] = v282[5];
                                      [(UITextCursorView *)cursorView setTransform:v282];
                                      [(UITextCursorView *)self->_cursorView setHidden:0];
                                      [(UITextCursorView *)self->_cursorView setTintColor:v226];
                                      [(UITextSelectionDisplayInteraction *)self _cursorAlpha];
                                      -[UITextCursorView setAlpha:](self->_cursorView, "setAlpha:");
                                      [(UIStandardTextCursorView *)self->_concreteCursorView _setShapeScale:v266];
                                      v245 = v267;
                                      if ([v4 BOOLValue]) {
                                        [(UITextCursorView *)self->_cursorView resetBlinkAnimation];
                                      }
                                      if (_AXSZoomTouchEnabled())
                                      {
                                        [(UITextCursorView *)self->_cursorView bounds];
                                        UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint, v321, (UIView *)self->_cursorView);
                                      }
                                      [(UITextSelectionDisplayInteraction *)self _updateDictationUI];
                                      [(UITextSelectionDisplayInteraction *)self _updateUnderlinesIfNeeded];
                                      -[_UICursorAccessoryViewController setCursorRect:](self->_cursorAccessoryViewController, "setCursorRect:", v281, v277, dya, v271);
                                      [(_UICursorAccessoryViewController *)self->_cursorAccessoryViewController setSelectedRange:v268];
                                      [(_UICursorAccessoryViewController *)self->_cursorAccessoryViewController setSelectionRects:v44];
                                      [(_UICursorAccessoryViewController *)self->_cursorAccessoryViewController setAccessoryTintColor:v226];
                                      goto LABEL_156;
                                    }
LABEL_155:
                                    [(UITextCursorView *)self->_cursorView setHidden:1];
                                    [(_UITextFloatingCursorSession *)self->_activeFloatingCursorSession _invalidate];
                                    activeFloatingCursorSession = self->_activeFloatingCursorSession;
                                    self->_activeFloatingCursorSession = 0;

                                    [(UITextSelectionDisplayInteraction *)self _updateDictationUI];
                                    [(UITextSelectionDisplayInteraction *)self _updateUnderlinesIfNeeded];
                                    v245 = v267;
LABEL_156:
                                    uint64_t v247 = [(UITextSelectionDisplayInteraction *)self _isCursorAccessoryViewEnabled] ^ 1;
                                    v248 = [(UIViewController *)self->_cursorAccessoryViewController view];
                                    [v248 setHidden:v247];

                                    [(UITextSelectionDisplayInteraction *)self _contentBoundsForPlacement:0];
                                    double v250 = v249;
                                    double v252 = v251;
                                    double v254 = v253;
                                    double v256 = v255;
                                    v257 = [(UIViewController *)self->_cursorAccessoryViewController view];
                                    objc_msgSend(v257, "setFrame:", v250, v252, v254, v256);

                                    self->_needsUpdate = 0;
                                    goto LABEL_157;
                                  }
                                }
                                else
                                {
                                }
                              }
LABEL_99:

                              goto LABEL_100;
                            }
                          }
                          goto LABEL_89;
                        }
                      }
                      else
                      {
                      }
                    }
LABEL_78:

                    goto LABEL_79;
                  }
                }
                goto LABEL_69;
              }
              id v64 = v69;
LABEL_46:
              v70 = v64;
              id v71 = v64;
              goto LABEL_48;
            }
          }
          else
          {
          }
        }
LABEL_42:

        goto LABEL_43;
      }

      v50 = &selRef_secureCandidateHeight;
    }

    goto LABEL_32;
  }
LABEL_157:
}

- (CGRect)_selectionClipRectAt:(int64_t)a3
{
  double v5 = (double *)MEMORY[0x1E4F1DB20];
  if ((*(unsigned char *)&self->_viewRespondsTo & 8) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained conformsToProtocolCached:&unk_1ED7009A0];

    id v11 = objc_loadWeakRetained((id *)&self->_view);
    [v11 selectionClipRect];
  }
  else
  {
    if ((*(unsigned char *)&self->_viewRespondsTo & 4) == 0)
    {
      double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      double v9 = *MEMORY[0x1E4F1DB20];
      double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      goto LABEL_7;
    }
    id v11 = objc_loadWeakRetained((id *)&self->_view);
    [v11 _selectionClipRect];
  }
  double v9 = v12;
  double v8 = v13;
  double v7 = v14;
  double v6 = v15;

LABEL_7:
  v31.origin.CGFloat x = v9;
  v31.origin.CGFloat y = v8;
  v31.size.CGFloat width = v7;
  v31.size.CGFloat height = v6;
  if (CGRectIsNull(v31))
  {
    double v16 = *v5;
    double v17 = v5[1];
    double v18 = v5[2];
    double v19 = v5[3];
  }
  else
  {
    if (a3) {
      [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];
    }
    else {
    v20 = [(UITextSelectionDisplayInteraction *)self _hostViewAboveText];
    }
    id v21 = objc_loadWeakRetained((id *)&self->_textInput);
    double v22 = [v21 textInputView];
    objc_msgSend(v20, "convertRect:fromView:", v22, v9, v8, v7, v6);
    double v16 = v23;
    double v17 = v24;
    double v18 = v25;
    double v19 = v26;
  }
  double v27 = v16;
  double v28 = v17;
  double v29 = v18;
  double v30 = v19;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (BOOL)_isHighlightVisible
{
  if (!self->_activated) {
    return 0;
  }
  v2 = [(UITextSelectionDisplayInteraction *)self _selectedRange];
  char v3 = [v2 _isRanged];

  return v3;
}

- (id)_hostViewBelowText
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 1) == 0
    || (id v3 = objc_loadWeakRetained((id *)&self->_delegate),
        [v3 selectionContainerViewBelowTextForSelectionDisplayInteraction:self],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    if ((*(unsigned char *)&self->_viewRespondsTo & 2) == 0
      || (id v5 = objc_loadWeakRetained((id *)&self->_view),
          [v5 selectionContainerView],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v4))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      id v4 = [WeakRetained textInputView];
    }
  }
  return v4;
}

- (void)_updateDictationUI
{
  if ([(UITextSelectionDisplayInteraction *)self _isDictationRunning])
  {
    if ([(UITextSelectionDisplayInteraction *)self _isCursorVisible])
    {
      [(UITextSelectionDisplayInteraction *)self _caretRectForDictationTrailingGlowView];
      double v4 = v3;
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      if (+[UIKeyboard isInlineDictationGlowEffectEnabled])
      {
        if ([(UITextSelectionDisplayInteraction *)self _glowViewMode] == 2)
        {
          if (self)
          {
            double x = self->__previousCursorFrame.origin.x;
            double y = self->__previousCursorFrame.origin.y;
          }
          else
          {
            double y = 0.0;
            double x = 0.0;
          }
          BOOL v13 = v4 >= x;
          BOOL v14 = v4 < x || v6 != y;
          if (v6 == y)
          {
            uint64_t v15 = 0;
          }
          else
          {
            [(UITextSelectionDisplayInteraction *)self _caretRectAtStartOfLine];
            BOOL v14 = v4 < v39 || v6 != v40;
            uint64_t v15 = v14 ^ 1;
            BOOL v13 = v15;
            if (self && !v14)
            {
              BOOL v14 = 0;
              self->__previousCursorFrame.origin.double x = v39;
              self->__previousCursorFrame.origin.double y = v40;
              uint64_t v15 = 1;
              BOOL v13 = 1;
              self->__previousCursorFrame.size.double width = v41;
              self->__previousCursorFrame.size.double height = v42;
            }
          }
        }
        else
        {
          uint64_t v15 = 0;
          BOOL v13 = 0;
          BOOL v14 = [(UITextSelectionDisplayInteraction *)self _glowViewMode] == 1;
        }
      }
      else
      {
        uint64_t v15 = 0;
        BOOL v13 = 0;
        BOOL v14 = 0;
      }
      double v16 = [(UITextSelectionDisplayInteraction *)self cursorView];
      double v17 = [v16 tintColor];
      double v18 = [(UITextSelectionDisplayInteraction *)self _trailingGlowView];
      [v18 setTintColor:v17];

      double v19 = [(UITextSelectionDisplayInteraction *)self _trailingGlowView];
      v20 = v19;
      CGFloat v21 = 0.0;
      double v22 = 0.0;
      double width = 0.0;
      double height = 0.0;
      double v25 = 0.0;
      if (self)
      {
        double v25 = self->__previousCursorFrame.origin.x;
        double v22 = self->__previousCursorFrame.origin.y;
        double width = self->__previousCursorFrame.size.width;
        double height = self->__previousCursorFrame.size.height;
      }
      objc_msgSend(v19, "cursorDidMoveToFrame:fromPreviousFrame:isNewLine:", v15, v4, v6, v8, v10, v25, v22, width, height);

      CGFloat v26 = 0.0;
      CGFloat v27 = 0.0;
      CGFloat v28 = 0.0;
      if (self)
      {
        CGFloat v28 = self->__previousCursorFrame.origin.x;
        CGFloat v21 = self->__previousCursorFrame.origin.y;
        CGFloat v26 = self->__previousCursorFrame.size.width;
        CGFloat v27 = self->__previousCursorFrame.size.height;
      }
      CGFloat v29 = v21;
      v45.origin.double x = v4;
      v45.origin.double y = v6;
      v45.size.double width = v8;
      v45.size.double height = v10;
      BOOL v30 = CGRectEqualToRect(*(CGRect *)&v28, v45);
      if (self && !v30)
      {
        self->__previousCursorFrame.origin.double x = v4;
        self->__previousCursorFrame.origin.double y = v6;
        self->__previousCursorFrame.size.double width = v8;
        self->__previousCursorFrame.size.double height = v10;
      }
      CGRect v31 = [(UITextSelectionDisplayInteraction *)self cursorView];
      double v32 = [v31 _scroller];

      if ([v32 _canScrollY]) {
        [(UITextSelectionDisplayInteraction *)self _resetDictationPortalViews];
      }
      else {
        [(UITextSelectionDisplayInteraction *)self _enableDictationPortalViews];
      }
    }
    else
    {
      BOOL v13 = 0;
      BOOL v14 = 0;
    }
    double v33 = [(UITextSelectionDisplayInteraction *)self _cursorView];
    [v33 setGlowEffectEnabled:v14];

    double v34 = +[_UIDictationSettingsDomain rootSettings];
    int v35 = [v34 soundReactiveCursorEnabled];

    if (!v14 && v13 && v35)
    {
      double v36 = [(UITextSelectionDisplayInteraction *)self _cursorView];
      [v36 setGlowEffectEnabled:1];
    }
    double v37 = [(UITextSelectionDisplayInteraction *)self _trailingGlowView];
    [v37 setTrailingAnimationEnabled:v13];

    id v43 = [(UITextSelectionDisplayInteraction *)self _cursorView];
    double v38 = +[UIDictationController activeInstance];
    [v43 setAudioLevelProvider:v38];
  }
}

- (id)_visibleSelectionRectsForRange:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
    if ((~*(unsigned char *)&self->_textInputRespondsTo & 6) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
      NSUInteger v8 = [WeakRetained _nsrangeForTextRange:v6];
      NSUInteger v10 = v9;

      id v11 = objc_loadWeakRetained((id *)&self->_textInput);
      uint64_t v12 = [v11 _visibleRangeWithLayout:0];
      uint64_t v14 = v13;

      if (v14)
      {
        uint64_t v15 = 2000;
        if (v12 > 2000) {
          uint64_t v15 = v12;
        }
        v23.location = v15 - 2000;
        v23.length = v14 + 4000;
        v24.location = v8;
        v24.length = v10;
        NSRange v16 = NSIntersectionRange(v23, v24);
        id v17 = objc_loadWeakRetained((id *)&self->_textInput);
        uint64_t v18 = objc_msgSend(v17, "_textRangeFromNSRange:", v16.location, v16.length);

        id v6 = (id)v18;
      }
    }
    id v19 = objc_loadWeakRetained((id *)&self->_textInput);
    v20 = [v19 selectionRectsForRange:v6];
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v20;
}

- (void)_updateUnderlinesIfNeeded
{
  if ([(NSMutableDictionary *)self->_proofreadingUnderlines count])
  {
    [(UITextSelectionDisplayInteraction *)self _updateAnimatedUnderlinesIfNeeded];
  }
}

- (BOOL)_isRangeAdjustmentUIVisible
{
  if (*(unsigned char *)&self->_textInputRespondsTo)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    char v5 = [WeakRetained _shouldSuppressSelectionHandles];

    char v3 = v5 ^ 1;
  }
  else
  {
    char v3 = 1;
  }
  if (self->_rangeViewMode) {
    return 0;
  }
  else {
    return [(UITextSelectionDisplayInteraction *)self _isHighlightVisible] & v3;
  }
}

- (BOOL)_isDictationRunning
{
  return self->__isDictationRunning;
}

- (BOOL)_isCursorVisible
{
  char v3 = [(UITextSelectionDisplayInteraction *)self _activeSelection];
  int v4 = [v3 hasEditableSelection];
  if (self->_activated && !self->_cursorHidden)
  {
    int v6 = v4;
    double v7 = [v3 selectedRange];
    BOOL v5 = ([v7 isEmpty] & v6) == 1 && !self->_hiddenForApplicationSuspend;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isCursorAccessoryViewEnabled
{
  if (!self->_activated || self->_cursorAccessoryViewHidden) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (-[UIView _isInVisibleHierarchy]((uint64_t)WeakRetained))
  {
    BOOL v5 = [(UITextSelectionDisplayInteraction *)self _activeSelection];
    char v3 = [v5 hasEditableSelection];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (UIColor)_cursorTintColor
{
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_9; {
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  id v4 = objc_loadWeakRetained((id *)&self->_textInput);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  id v5 = objc_loadWeakRetained((id *)&self->_textInput);
  int v6 = NSProtocolFromString(&cfstr_Betextinput.isa);
  int v7 = [v5 conformsToProtocolCached:v6];

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_textInput);
    NSUInteger v9 = [v8 performSelector:sel_extendedTextInputTraits];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v9 performSelector:sel_insertionPointColor];
      goto LABEL_15;
    }
    goto LABEL_18;
  }
LABEL_9:
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_19; {
  NSUInteger v9 = objc_loadWeakRetained((id *)&self->_textInput);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_18:

    goto LABEL_19;
  }
  id v11 = objc_loadWeakRetained((id *)&self->_textInput);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_18;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_textInput);
  int v13 = [v12 conformsToProtocolCached:&unk_1ED6D1028];

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_textInput);
    NSUInteger v9 = [v14 extendedTraitsDelegate];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v9 insertionPointColor];
LABEL_15:
      uint64_t v15 = (void *)v10;

      if (v15) {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_19:
  id v16 = objc_loadWeakRetained((id *)&self->_textInput);
  char v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) == 0
    || (id v18 = objc_loadWeakRetained((id *)&self->_textInput),
        [v18 performSelector:sel_insertionPointColor],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v15))
  {
    id v19 = +[UIColor insertionPointColor];
    uint64_t v15 = [(UITextSelectionDisplayInteraction *)self _tintColorOrDefault:v19];
  }
LABEL_22:
  return (UIColor *)v15;
}

- (CGRect)_caretRect
{
  char v3 = [(UITextSelectionDisplayInteraction *)self _selectedRange];
  id v4 = [v3 end];

  [(UITextSelectionDisplayInteraction *)self _caretRectForPosition:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_caretRectForPosition:(id)a3
{
  if (a3)
  {
    p_textInput = &self->_textInput;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_textInput);
    [WeakRetained caretRectForPosition:v5];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    -[UITextSelectionDisplayInteraction _textInputRectInSelectionViewCoordinateSpace:](self, "_textInputRectInSelectionViewCoordinateSpace:", v8, v10, v12, v14);
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)_activeSelection
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 2) != 0)
  {
    double v6 = [(UITextSelectionDisplayInteraction *)self _internalDelegate];
    id v5 = [v6 activeSelection];
  }
  else
  {
    char v3 = [UITextSelection alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    id v5 = [(UITextSelection *)v3 initWithDocument:WeakRetained];

    [(UITextSelection *)v5 selectionChanged];
  }
  return v5;
}

- (id)_internalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (id)_tintColorOrDefault:(id)a3 alpha:(double)a4
{
  id v6 = a3;
  self = (UITextSelectionDisplayInteraction *)((char *)self + 200);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  double v8 = [WeakRetained tintColor];

  id v9 = objc_loadWeakRetained((id *)&self->super.isa);
  double v10 = +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", [v9 _userInterfaceIdiom]);

  id v11 = v8;
  id v12 = v10;
  double v13 = v12;
  if (v11 == v12)
  {

    double v16 = v11;
    id v15 = v6;
LABEL_9:

    goto LABEL_10;
  }
  if (!v11 || !v12)
  {

    goto LABEL_8;
  }
  char v14 = [v11 isEqual:v12];

  id v15 = v6;
  if ((v14 & 1) == 0)
  {
LABEL_8:
    id v15 = v11;
    double v16 = v6;
    goto LABEL_9;
  }
LABEL_10:
  if (a4 >= 1.0)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [v15 colorWithAlphaComponent:a4];
  }
  double v18 = v17;

  return v18;
}

- (id)_tintColorOrDefault:(id)a3
{
  return [(UITextSelectionDisplayInteraction *)self _tintColorOrDefault:a3 alpha:1.0];
}

+ (BOOL)isModernSelectionViewEnabled
{
  return +[UIKeyboard isRedesignedTextCursorEnabled];
}

- (void)setNeedsSelectionUpdate
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (!self->_needsUpdate)
  {
    self->_needsUpdate = 1;
    v4[0] = *MEMORY[0x1E4F1C4B0];
    char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
    [(UITextSelectionDisplayInteraction *)self performSelector:sel__updateSelectionIfNeededResettingBlinkingAnimation_ withObject:MEMORY[0x1E4F1CC38] afterDelay:v3 inModes:0.0];
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setActivated:(BOOL)activated
{
  self->_activated = activated;
  if (activated)
  {
    [(UITextSelectionDisplayInteraction *)self _installManagedSubviewsIfNecessary];
    id v4 = [(UITextSelectionDisplayInteraction *)self _activeSelection];
    [v4 selectionChanged];
  }
  else
  {
    [(UITextSelectionDisplayInteraction *)self _resetDictationPortalViews];
  }
  [(UITextSelectionDisplayInteraction *)self setNeedsSelectionUpdate];
}

- (void)_resetDictationPortalViews
{
  char v3 = [(UITextSelectionDisplayInteraction *)self cursorPortalInteraction];
  [v3 setEnabled:0];

  id v4 = [(UITextSelectionDisplayInteraction *)self trailingPortalInteraction];
  [v4 setEnabled:0];
}

- (_UIContainerWindowPortalInteraction)trailingPortalInteraction
{
  return self->_trailingPortalInteraction;
}

- (_UIContainerWindowPortalInteraction)cursorPortalInteraction
{
  return self->_cursorPortalInteraction;
}

- (id)_initWithTextInput:(id)a3 delegate:(id)a4 activated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)UITextSelectionDisplayInteraction;
  double v10 = [(UITextSelectionDisplayInteraction *)&v20 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_textInput, v8);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_activated = a5;
    id v12 = [[_UIAssertionController alloc] initWithAssertionSubject:v11];
    assertionController = v11->_assertionController;
    v11->_assertionController = v12;

    char v14 = objc_alloc_init(UITextCursorAssertionController);
    cursorAssertionController = v11->_cursorAssertionController;
    v11->_cursorAssertionController = v14;

    [(UITextCursorAssertionController *)v11->_cursorAssertionController setSubject:v11];
    double v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v11 selector:sel__didReceiveApplicationWillSuspendNotification_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v16 addObserver:v11 selector:sel__didReceiveApplicationWillResumeNotification_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v16 addObserver:v11 selector:sel__trackingViewportDidLayout_ name:@"_UITextViewportLayoutControllerDidLayout" object:0];
    [v16 addObserver:v11 selector:sel__didReceiveAXNonBlinkingDidChangeNotification_ name:*MEMORY[0x1E4F17458] object:0];
    id v17 = +[_UITextInputImplicitObjectWrapper wrapperForObject:v11];
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_textInput);
    objc_setAssociatedObject(WeakRetained, &_UITextInputImplicitSelectionDisplayInteractionKey, v17, (void *)1);

    [(UITextSelectionDisplayInteraction *)v11 _updateDelegateConformance];
    [(UITextSelectionDisplayInteraction *)v11 _updateTextInputConformance];
    [(UITextSelectionDisplayInteraction *)v11 _initializeDictationSupport];
    [(UITextSelectionDisplayInteraction *)v11 _updateAccessibilityNonBlinkingAssertion];
  }
  return v11;
}

- (void)_initializeDictationSupport
{
  if (!+[UIKeyboard inputUIOOP]
    || +[UIKeyboard usesInputSystemUI])
  {
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__dictationDidBeginNotification_ name:@"UIKeyboardDidBeginDictationNotification" object:0];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__dictationDidFinishNotification_ name:@"UIDictationControllerDictationDidFinish" object:0];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__dictationDidPauseNotification_ name:@"UIDictationControllerDidPauseNotification" object:0];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__dictationDidResumeNotification_ name:@"UIDictationControllerDidResumeNotification" object:0];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel__dictationWillInsertHypothesisNotification_ name:0x1ED143380 object:0];
  }
}

- (void)_updateTextInputConformance
{
  p_textInput = &self->_textInput;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  *(unsigned char *)&self->_textInputRespondsTo = *(unsigned char *)&self->_textInputRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

  id v5 = objc_loadWeakRetained((id *)p_textInput);
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_textInputRespondsTo = *(unsigned char *)&self->_textInputRespondsTo & 0xFD | v6;

  id v7 = objc_loadWeakRetained((id *)p_textInput);
  if (objc_opt_respondsToSelector()) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_textInputRespondsTo = *(unsigned char *)&self->_textInputRespondsTo & 0xFB | v8;

  id v9 = objc_loadWeakRetained((id *)p_textInput);
  if (objc_opt_respondsToSelector()) {
    char v10 = 8;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)&self->_textInputRespondsTo = *(unsigned char *)&self->_textInputRespondsTo & 0xF7 | v10;

  id v11 = objc_loadWeakRetained((id *)p_textInput);
  if (objc_opt_respondsToSelector()) {
    char v12 = 16;
  }
  else {
    char v12 = 0;
  }
  *(unsigned char *)&self->_textInputRespondsTo = *(unsigned char *)&self->_textInputRespondsTo & 0xEF | v12;

  id v13 = objc_loadWeakRetained((id *)p_textInput);
  if (objc_opt_respondsToSelector()) {
    char v14 = 32;
  }
  else {
    char v14 = 0;
  }
  *(unsigned char *)&self->_textInputRespondsTo = *(unsigned char *)&self->_textInputRespondsTo & 0xDF | v14;

  id v16 = objc_loadWeakRetained((id *)p_textInput);
  if (objc_opt_respondsToSelector()) {
    char v15 = 64;
  }
  else {
    char v15 = 0;
  }
  *(unsigned char *)&self->_textInputRespondsTo = *(unsigned char *)&self->_textInputRespondsTo & 0xBF | v15;
}

- (void)_updateDelegateConformance
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

  id v5 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFD | v6;

  id v7 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFB | v8;

  id v9 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v10 = 8;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xF7 | v10;

  id v12 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v11 = 16;
  }
  else {
    char v11 = 0;
  }
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xEF | v11;
}

- (void)_updateAccessibilityNonBlinkingAssertion
{
  int v3 = AXPrefersNonBlinkingTextInsertionIndicator();
  accessibilityNonBlinkingAssertion = self->_accessibilityNonBlinkingAssertion;
  if (v3)
  {
    if (accessibilityNonBlinkingAssertion) {
      return;
    }
    id v5 = [(UITextCursorAssertionController *)self->_cursorAssertionController nonBlinkingAssertionWithReason:@"AXPrefersNonBlinkingTextInsertionIndicator"];
  }
  else
  {
    if (!accessibilityNonBlinkingAssertion) {
      return;
    }
    [(UITextCursorAssertion *)accessibilityNonBlinkingAssertion invalidate];
    id v5 = 0;
  }
  char v6 = self->_accessibilityNonBlinkingAssertion;
  self->_accessibilityNonBlinkingAssertion = v5;
}

- (void)layoutManagedSubviews
{
}

- (void)_layoutManagedSubviewsResettingBlinkingAnimation:(BOOL)a3
{
  self->_needsUpdate = 1;
  id v4 = [NSNumber numberWithBool:a3];
  [(UITextSelectionDisplayInteraction *)self _updateSelectionIfNeededResettingBlinkingAnimation:v4];
}

- (void)didMoveToView:(id)a3
{
  id v4 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    [(UITextSelectionDisplayInteraction *)self _updateViewConformance];
    [(UITextSelectionDisplayInteraction *)self _installManagedSubviewsIfNecessary];
  }
}

- (void)_updateViewConformance
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  *(unsigned char *)&self->_char viewRespondsTo = *(unsigned char *)&self->_viewRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

  id v5 = objc_loadWeakRetained((id *)p_view);
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_char viewRespondsTo = *(unsigned char *)&self->_viewRespondsTo & 0xFD | v6;

  id v7 = objc_loadWeakRetained((id *)p_view);
  if (objc_opt_respondsToSelector()) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_char viewRespondsTo = *(unsigned char *)&self->_viewRespondsTo & 0xFB | v8;

  id v10 = objc_loadWeakRetained((id *)p_view);
  if (objc_opt_respondsToSelector()) {
    char v9 = 8;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_char viewRespondsTo = *(unsigned char *)&self->_viewRespondsTo & 0xF7 | v9;
}

- (void)_installManagedSubviewsIfNecessary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_activated && !self->_didInstallManagedSubviews)
  {
    int v3 = [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = [(UITextSelectionDisplayInteraction *)self _managedSubviewsBelowText];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 addSubview:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    char v9 = [v3 layer];
    [v9 setAllowsGroupBlending:0];

    id v10 = [(UITextSelectionDisplayInteraction *)self _hostViewAboveText];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    char v11 = [(UITextSelectionDisplayInteraction *)self _managedSubviewsAboveText];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          [v10 addSubview:*(void *)(*((void *)&v18 + 1) + 8 * j)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v13);
    }

    id v16 = [(UITextSelectionDisplayInteraction *)self _hostViewAboveText];
    -[UIView _addGeometryChangeObserver:](v16, self);

    id v17 = [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];
    -[UIView _addGeometryChangeObserver:](v17, self);

    [(_UICursorAccessoryViewController *)self->_cursorAccessoryViewController setVisible:0];
    [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer setHidden:1];
    [(UITextSelectionHighlightView *)self->_highlightView setHidden:1];
    [(UITextCursorView *)self->_cursorView setHidden:1];
    self->_didInstallManagedSubviews = 1;
    [(UITextSelectionDisplayInteraction *)self setNeedsSelectionUpdate];
  }
}

- (void)dealloc
{
  int v3 = objc_getAssociatedObject(self, &_UITextInputImplicitSelectionDisplayInteractionKey);
  id v4 = [v3 weakObject];

  if (v4 == self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    objc_setAssociatedObject(WeakRetained, &_UITextInputImplicitSelectionDisplayInteractionKey, 0, (void *)1);
  }
  v6.receiver = self;
  v6.super_class = (Class)UITextSelectionDisplayInteraction;
  [(UITextSelectionDisplayInteraction *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingPortalInteraction, 0);
  objc_storeStrong((id *)&self->_cursorPortalInteraction, 0);
  objc_storeStrong((id *)&self->__dictationBlinkSuppressionAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_textInput);
  objc_storeStrong((id *)&self->_concreteHighlightView, 0);
  objc_storeStrong((id *)&self->_concreteCursorView, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_showDeleteButtonCursorAssertion, 0);
  objc_storeStrong((id *)&self->_showInputModesCursorAssertion, 0);
  objc_storeStrong((id *)&self->_trailingGlowView, 0);
  objc_storeStrong((id *)&self->_activeFloatingCursorSession, 0);
  objc_storeStrong((id *)&self->_accessibilityNonBlinkingAssertion, 0);
  objc_storeStrong((id *)&self->_cursorAssertionController, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_managedSubviewsBelowText, 0);
  objc_storeStrong((id *)&self->_managedSubviewsAboveText, 0);
  objc_storeStrong((id *)&self->_proofreadingUnderlines, 0);
  objc_storeStrong((id *)&self->_cursorAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_proofreadingUnderlineView, 0);
  objc_storeStrong((id *)&self->_underlineView, 0);
  objc_storeStrong((id *)&self->_savedHighlightView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_cursorView, 0);
  objc_storeStrong((id *)&self->_rangeAdjustmentViewContainer, 0);
}

- (_UITextCursorTrailingGlowView)_trailingGlowView
{
  trailingGlowView = self->_trailingGlowView;
  if (!trailingGlowView)
  {
    id v4 = [_UITextCursorTrailingGlowView alloc];
    uint64_t v5 = -[_UITextCursorTrailingGlowView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_super v6 = self->_trailingGlowView;
    self->_trailingGlowView = v5;

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__UITextSelectionDisplayInteraction_Dictation___trailingGlowView__block_invoke;
    v8[3] = &unk_1E52DC308;
    objc_copyWeak(&v9, &location);
    [(_UITextCursorTrailingGlowView *)self->_trailingGlowView setTransitionBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    trailingGlowView = self->_trailingGlowView;
  }
  return trailingGlowView;
}

void __65__UITextSelectionDisplayInteraction_Dictation___trailingGlowView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _isDictationRunning])
  {
    v1 = [WeakRetained _cursorView];
    [v1 setGlowEffectEnabled:1];
  }
}

- (void)_initializeManagedDictationViewsIfNecessary
{
  if (!self->_didInitializeManagedDictationViews)
  {
    if ([(UITextSelectionDisplayInteraction *)self isActivated])
    {
      int v3 = objc_alloc_init(_UIContainerWindowPortalInteraction);
      [(UITextSelectionDisplayInteraction *)self setCursorPortalInteraction:v3];

      id v4 = [(UITextSelectionDisplayInteraction *)self cursorView];
      uint64_t v5 = [(UITextSelectionDisplayInteraction *)self cursorPortalInteraction];
      [v4 addInteraction:v5];

      objc_super v6 = objc_alloc_init(_UIContainerWindowPortalInteraction);
      [(UITextSelectionDisplayInteraction *)self setTrailingPortalInteraction:v6];

      uint64_t v7 = [(UITextSelectionDisplayInteraction *)self _trailingGlowView];
      char v8 = [(UITextSelectionDisplayInteraction *)self trailingPortalInteraction];
      [v7 addInteraction:v8];

      self->_didInitializeManagedDictationViews = 1;
    }
  }
}

- (void)_enableDictationPortalViews
{
  int v3 = [(UITextSelectionDisplayInteraction *)self cursorPortalInteraction];
  [v3 setEnabled:1];

  id v4 = [(UITextSelectionDisplayInteraction *)self trailingPortalInteraction];
  [v4 setEnabled:1];
}

- (void)_dictationDidBeginNotification:(id)a3
{
  [(UITextSelectionDisplayInteraction *)self set_isDictationRunning:1];
  if ([(UITextSelectionDisplayInteraction *)self _isCursorVisible])
  {
    [(UITextSelectionDisplayInteraction *)self _initializeManagedDictationViewsIfNecessary];
    if (+[UIKeyboard isInlineDictationGlowEffectEnabled])
    {
      [(UITextSelectionDisplayInteraction *)self _setGlowViewMode:1];
      [(UITextSelectionDisplayInteraction *)self _enableDictationPortalViews];
      id v4 = [(UITextSelectionDisplayInteraction *)self obtainBlinkSuppressionAssertionForReason:@"dictation"];
      -[UITextSelectionDisplayInteraction set_dictationBlinkSuppressionAssertion:]((uint64_t)self, v4);

      uint64_t v5 = [(UITextSelectionDisplayInteraction *)self _cursorView];
      [v5 _setNeedsInitialDictationAnimation];

      [(UITextSelectionDisplayInteraction *)self _updateDictationUI];
    }
  }
  else
  {
    objc_super v6 = +[UIKeyboardImpl activeInstance];
    [v6 presentDictationMenu];

    id v7 = [(UITextSelectionDisplayInteraction *)self obtainBlinkSuppressionAssertionForReason:@"dictation"];
    -[UITextSelectionDisplayInteraction set_dictationBlinkSuppressionAssertion:]((uint64_t)self, v7);
  }
}

- (void)_dictationDidFinishNotification:(id)a3
{
  [(UITextSelectionDisplayInteraction *)self set_isDictationRunning:0];
  if (+[UIKeyboard isInlineDictationGlowEffectEnabled])
  {
    [(UITextSelectionDisplayInteraction *)self _setGlowViewMode:0];
    [(UITextSelectionDisplayInteraction *)self _resetDictationPortalViews];
    if (self) {
      dictationBlinkSuppressionAssertion = self->__dictationBlinkSuppressionAssertion;
    }
    else {
      dictationBlinkSuppressionAssertion = 0;
    }
    uint64_t v5 = dictationBlinkSuppressionAssertion;
    [(UITextCursorAssertion *)v5 invalidate];

    -[UITextSelectionDisplayInteraction set_dictationBlinkSuppressionAssertion:]((uint64_t)self, 0);
    objc_super v6 = [(UITextSelectionDisplayInteraction *)self _cursorView];
    [v6 setGlowEffectEnabled:0];

    id v7 = [(UITextSelectionDisplayInteraction *)self _trailingGlowView];
    [v7 setTrailingAnimationEnabled:0];
  }
}

- (void)_dictationDidPauseNotification:(id)a3
{
  if (+[UIKeyboard isInlineDictationGlowEffectEnabled])
  {
    [(UITextSelectionDisplayInteraction *)self _setGlowViewMode:0];
    id v4 = +[UIKeyboardImpl activeInstance];
    [v4 clearDictationMenuTimer];
  }
}

- (void)_dictationDidResumeNotification:(id)a3
{
  if (+[UIKeyboard isInlineDictationGlowEffectEnabled]&& [(UITextSelectionDisplayInteraction *)self _isDictationRunning])
  {
    [(UITextSelectionDisplayInteraction *)self _setGlowViewMode:1];
    if (self) {
      dictationBlinkSuppressionAssertion = self->__dictationBlinkSuppressionAssertion;
    }
    else {
      dictationBlinkSuppressionAssertion = 0;
    }
    uint64_t v5 = dictationBlinkSuppressionAssertion;

    if (!v5)
    {
      objc_super v6 = [(UITextSelectionDisplayInteraction *)self obtainBlinkSuppressionAssertionForReason:@"dictation"];
      -[UITextSelectionDisplayInteraction set_dictationBlinkSuppressionAssertion:]((uint64_t)self, v6);
    }
    id v7 = +[UIKeyboardImpl activeInstance];
    [v7 representDictationMenu];
  }
}

- (void)_dictationWillInsertHypothesisNotification:(id)a3
{
  id v8 = a3;
  if (+[UIKeyboard isInlineDictationGlowEffectEnabled]
    && [(UITextSelectionDisplayInteraction *)self _isDictationRunning])
  {
    id v4 = [v8 userInfo];

    if (v4)
    {
      uint64_t v5 = [v8 userInfo];
      objc_super v6 = [v5 objectForKeyedSubscript:@"UIDictationGlowViewMode"];
      uint64_t v7 = [v6 intValue];
    }
    else
    {
      uint64_t v7 = 2;
    }
    [(UITextSelectionDisplayInteraction *)self _setGlowViewMode:v7];
  }
}

+ (BOOL)isTextAccelerationUIEnabled
{
  return _os_feature_enabled_impl();
}

- (UITextSelectionDisplayInteraction)initWithTextInput:(id)textInput delegate:(id)delegate
{
  return (UITextSelectionDisplayInteraction *)[(UITextSelectionDisplayInteraction *)self _initWithTextInput:textInput delegate:delegate activated:1];
}

- (void)_didReceiveApplicationWillSuspendNotification:(id)a3
{
  self->_hiddenForApplicationSuspend = 1;
  [(UITextSelectionDisplayInteraction *)self layoutManagedSubviews];
}

- (void)_didReceiveApplicationWillResumeNotification:(id)a3
{
  self->_hiddenForApplicationSuspend = 0;
  [(UITextSelectionDisplayInteraction *)self layoutManagedSubviews];
}

- (UIView)cursorView
{
  cursorView = self->_cursorView;
  if (!cursorView)
  {
    id v4 = [UIStandardTextCursorView alloc];
    uint64_t v5 = -[UIStandardTextCursorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UITextSelectionDisplayInteraction *)self setCursorView:v5];

    cursorView = self->_cursorView;
  }
  return (UIView *)cursorView;
}

- (void)setCursorView:(UIView *)cursorView
{
  uint64_t v5 = cursorView;
  objc_storeStrong((id *)&self->_cursorView, cursorView);
  uint64_t v6 = objc_opt_class();
  id v10 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v10;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  concreteCursorView = self->_concreteCursorView;
  self->_concreteCursorView = v8;

  [(UITextCursorAssertionController *)self->_cursorAssertionController _updateSubjectWithAssertionState];
}

- (UIView)highlightView
{
  highlightView = self->_highlightView;
  if (!highlightView)
  {
    id v4 = [_UITextSelectionHighlightView alloc];
    uint64_t v5 = -[_UITextSelectionHighlightView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UITextSelectionDisplayInteraction *)self setHighlightView:v5];

    highlightView = self->_highlightView;
  }
  return (UIView *)highlightView;
}

- (void)setHighlightView:(UIView *)highlightView
{
  uint64_t v5 = highlightView;
  objc_storeStrong((id *)&self->_highlightView, highlightView);
  uint64_t v6 = objc_opt_class();
  id v10 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v10;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  concreteHighlightView = self->_concreteHighlightView;
  self->_concreteHighlightView = v8;
}

- (void)setHandleViews:(NSArray *)handleViews
{
  uint64_t v5 = handleViews;
  if ([(NSArray *)v5 count] != 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"UITextSelectionDisplayInteraction.m", 420, @"You must provide exactly two handle views to UITextSelectionDisplayInteraction, one for the leading selection handle and one for the trailing selection handle." object file lineNumber description];
  }
  id v7 = [(UITextSelectionDisplayInteraction *)self _rangeAdjustmentViewContainer];
  [v7 setSelectionGrabbers:v5];
}

- (NSArray)handleViews
{
  v2 = [(UITextSelectionDisplayInteraction *)self _rangeAdjustmentViewContainer];
  int v3 = [v2 selectionGrabbers];

  return (NSArray *)v3;
}

- (_UITextSelectionRangeAdjustmentContainerView)_rangeAdjustmentViewContainer
{
  rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
  if (!rangeAdjustmentViewContainer)
  {
    id v4 = [_UITextSelectionRangeAdjustmentContainerView alloc];
    uint64_t v5 = -[_UITextSelectionRangeAdjustmentContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_rangeAdjustmentViewContainer;
    self->_rangeAdjustmentViewContainer = v5;

    rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
  }
  return rangeAdjustmentViewContainer;
}

- (_UITextUnderlineView)_underlineView
{
  underlineView = self->_underlineView;
  if (!underlineView)
  {
    id v4 = [_UITextUnderlineView alloc];
    uint64_t v5 = -[_UITextUnderlineView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_underlineView;
    self->_underlineView = v5;

    [(_UITextUnderlineView *)self->_underlineView setUseDirectionalLightEffect:0];
    underlineView = self->_underlineView;
  }
  return underlineView;
}

- (_UITextUnderlineView)_existingUnderlineView
{
  return self->_underlineView;
}

- (id)_proofreadingUnderlineView
{
  proofreadingUnderlineView = self->_proofreadingUnderlineView;
  if (!proofreadingUnderlineView)
  {
    id v4 = [_UITextUnderlineView alloc];
    uint64_t v5 = -[_UITextUnderlineView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_proofreadingUnderlineView;
    self->_proofreadingUnderlineView = v5;

    [(_UITextUnderlineView *)self->_proofreadingUnderlineView setUseDirectionalLightEffect:1];
    id v7 = [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];
    [v7 addSubview:self->_proofreadingUnderlineView];

    proofreadingUnderlineView = self->_proofreadingUnderlineView;
  }
  return proofreadingUnderlineView;
}

- (_UICursorAccessoryViewController)_cursorAccessoryViewController
{
  cursorAccessoryViewController = self->_cursorAccessoryViewController;
  if (!cursorAccessoryViewController)
  {
    id v4 = objc_alloc_init(_UICursorAccessoryViewController);
    uint64_t v5 = self->_cursorAccessoryViewController;
    self->_cursorAccessoryViewController = v4;

    [(_UICursorAccessoryViewController *)self->_cursorAccessoryViewController setDelegate:self];
    cursorAccessoryViewController = self->_cursorAccessoryViewController;
  }
  return cursorAccessoryViewController;
}

- (id)_managedViewForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v3 = [(UITextSelectionDisplayInteraction *)self highlightView];
      goto LABEL_8;
    case 1:
      uint64_t v3 = [(UITextSelectionDisplayInteraction *)self _underlineView];
      goto LABEL_8;
    case 2:
      uint64_t v3 = [(UITextSelectionDisplayInteraction *)self _trailingGlowView];
      goto LABEL_8;
    case 3:
      uint64_t v3 = [(UITextSelectionDisplayInteraction *)self cursorView];
      goto LABEL_8;
    case 4:
      uint64_t v3 = [(UITextSelectionDisplayInteraction *)self _rangeAdjustmentViewContainer];
LABEL_8:
      id v4 = (void *)v3;
      break;
    case 5:
      uint64_t v6 = [(UITextSelectionDisplayInteraction *)self _cursorAccessoryViewController];
      id v4 = [v6 view];

      break;
    default:
      id v4 = 0;
      break;
  }
  return v4;
}

- (id)_managedSubviewsAboveText
{
  managedSubviewsAboveText = self->_managedSubviewsAboveText;
  if (!managedSubviewsAboveText)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    for (uint64_t i = 3; i != 6; ++i)
    {
      uint64_t v6 = [(UITextSelectionDisplayInteraction *)self _managedViewForType:i];
      [(NSArray *)v4 addObject:v6];
    }
    id v7 = self->_managedSubviewsAboveText;
    self->_managedSubviewsAboveText = v4;

    managedSubviewsAboveText = self->_managedSubviewsAboveText;
  }
  return managedSubviewsAboveText;
}

- (id)_managedSubviewsBelowText
{
  managedSubviewsBelowText = self->_managedSubviewsBelowText;
  if (!managedSubviewsBelowText)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v6 = [(UITextSelectionDisplayInteraction *)self _managedViewForType:i];
      [(NSArray *)v4 addObject:v6];
    }
    id v7 = self->_managedSubviewsBelowText;
    self->_managedSubviewsBelowText = v4;

    managedSubviewsBelowText = self->_managedSubviewsBelowText;
  }
  return managedSubviewsBelowText;
}

- (id)_allManagedSubviews
{
  uint64_t v3 = [(UITextSelectionDisplayInteraction *)self _managedSubviewsAboveText];
  id v4 = [(UITextSelectionDisplayInteraction *)self _managedSubviewsBelowText];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (void)_updateHighlightViewWithShimmerState
{
  uint64_t v14 = self->_highlightView;
  if (self->_shouldDisplayShimmerHighlights)
  {
    uint64_t v3 = [_UITextSelectionHighlightShimmerView alloc];
    id v4 = -[_UITextSelectionHighlightShimmerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v5 = v14;
    savedHighlightView = self->_savedHighlightView;
    self->_savedHighlightView = v5;
  }
  else
  {
    id v7 = self->_savedHighlightView;
    if (!v7)
    {
      id v4 = 0;
      goto LABEL_6;
    }
    id v4 = v7;
    savedHighlightView = self->_savedHighlightView;
    self->_savedHighlightView = 0;
  }

LABEL_6:
  if (self->_activated || self->_didInstallManagedSubviews)
  {
    id v8 = [(UITextSelectionHighlightView *)v14 superview];
    id v9 = [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];

    if (v8 == v9)
    {
      [(UIView *)v4 setHidden:[(UITextSelectionHighlightView *)v14 isHidden]];
      char v11 = [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];
      [v11 insertSubview:v4 belowSubview:v14];

      [(UITextSelectionHighlightView *)v14 removeFromSuperview];
    }
    else
    {
      [(UIView *)v4 setHidden:1];
      id v10 = [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];
      [v10 insertSubview:v4 atIndex:0];
    }
  }
  [(UITextSelectionDisplayInteraction *)self setHighlightView:v4];
  managedSubviewsBelowText = self->_managedSubviewsBelowText;
  self->_managedSubviewsBelowText = 0;

  id v13 = [(UITextSelectionDisplayInteraction *)self _managedSubviewsBelowText];
  if (self->_activated || self->_didInstallManagedSubviews) {
    [(UITextSelectionDisplayInteraction *)self _updateSelectionIfNeededResettingBlinkingAnimation:MEMORY[0x1E4F1CC28]];
  }
}

- (double)_cursorAlpha
{
  if (self->_cursorFadedHiddenForFloatingCursor) {
    return 0.0101;
  }
  double result = 0.0101;
  if (!self->_selectionUIHiddenForAssertion) {
    return 1.0;
  }
  return result;
}

- (double)_highlightAndRangeAdjustmentAlpha
{
  double result = 0.0;
  if (!self->_selectionUIHiddenForAssertion) {
    return 1.0;
  }
  return result;
}

- (BOOL)_isCursorAccessoryViewVisible
{
  BOOL v3 = [(UITextSelectionDisplayInteraction *)self _isCursorAccessoryViewEnabled];
  if (v3)
  {
    id v4 = [(UITextSelectionDisplayInteraction *)self _cursorAccessoryViewController];
    char v5 = [v4 isVisible];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (CGAffineTransform)_transformRelativeToTextInputCoordinateSpace:(SEL)a3 forView:(CGAffineTransform *)a4
{
  [a5 center];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  CGAffineTransformMakeTranslation(retstr, -v7, -v9);
  long long v11 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v11;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a4->tx;
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v17.c = v12;
  *(_OWORD *)&v17.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&v19, &t1, &v17);
  long long v13 = *(_OWORD *)&v19.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v19.tx;
  long long v14 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v14;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&retstr->tx;
  double result = CGAffineTransformTranslate(&v19, &t1, v8, v10);
  long long v16 = *(_OWORD *)&v19.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
  *(_OWORD *)&retstr->c = v16;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v19.tx;
  return result;
}

- (CGAffineTransform)_caretTransform
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v5 + 32);
  double v7 = [(UITextSelectionDisplayInteraction *)self _selectedRange];
  CGFloat v8 = [v7 end];

  if ((*(unsigned char *)&self->_textInputRespondsTo & 0x20) != 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    CGFloat v10 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained caretTransformForPosition:v8];
      goto LABEL_8;
    }
LABEL_7:
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    goto LABEL_8;
  }
  if ((*(unsigned char *)&self->_textInputRespondsTo & 0x40) != 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    id v9 = objc_loadWeakRetained((id *)&self->_textInput);
    CGFloat v10 = v9;
    if (v9)
    {
      [v9 _caretTransformForPosition:v8];
LABEL_8:

      long long v12 = [(UITextSelectionDisplayInteraction *)self cursorView];
      v15[0] = v16;
      v15[1] = v17;
      v15[2] = v18;
      [(UITextSelectionDisplayInteraction *)self _transformRelativeToTextInputCoordinateSpace:v15 forView:v12];
      long long v13 = v15[4];
      *(_OWORD *)&retstr->a = v15[3];
      *(_OWORD *)&retstr->c = v13;
      *(_OWORD *)&retstr->tdouble x = v15[5];

      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:

  return result;
}

- (CGRect)_caretRectForDictationTrailingGlowView
{
  [(UITextSelectionDisplayInteraction *)self _caretRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v11 = [(UITextSelectionDisplayInteraction *)self _hostViewBelowText];
  objc_msgSend(v11, "convertRect:fromView:", self->_rangeAdjustmentViewContainer, v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)_caretRectAtStartOfLine
{
  double v3 = [(UITextSelectionDisplayInteraction *)self _selectedRange];
  double v4 = [v3 end];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  double v6 = [WeakRetained tokenizer];

  if (v6)
  {
    uint64_t v7 = [v6 positionFromPosition:v4 toBoundary:4 inDirection:1];

    double v4 = (void *)v7;
  }
  [(UITextSelectionDisplayInteraction *)self _caretRectForPosition:v4];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGAffineTransform)_lollipopTransformForSelectionRect:(SEL)a3 view:(id)a4
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = MEMORY[0x1E4F1DAB8];
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v11;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v10 + 32);
  memset(&v16, 0, sizeof(v16));
  if (v8) {
    [v8 transform];
  }
  CGAffineTransform v15 = v16;
  if (!CGAffineTransformIsIdentity(&v15))
  {
    CGAffineTransform v14 = v16;
    [(UITextSelectionDisplayInteraction *)self _transformRelativeToTextInputCoordinateSpace:&v14 forView:v9];
    long long v12 = *(_OWORD *)&v15.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v15.tx;
  }

  return result;
}

- (void)_setGlowViewMode:(int)a3
{
  self->_glowViewMode = a3;
  [(UITextSelectionDisplayInteraction *)self setNeedsSelectionUpdate];
}

- (void)setCursorHidden:(BOOL)a3
{
  self->_cursorHidden = a3;
  [(UITextSelectionDisplayInteraction *)self setNeedsSelectionUpdate];
}

- (void)setRangeViewMode:(int)a3
{
  self->_rangeViewMode = a3;
  [(UITextSelectionDisplayInteraction *)self setNeedsSelectionUpdate];
}

- (void)_performCursorBulgeAnimation
{
}

- (void)_addInteractiveUnderlines:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UITextSelectionDisplayInteraction *)self _underlineView];
  [v7 addUnderlines:v6 animated:v4];
}

- (void)_removeInteractiveUndelines:(id)a3 animiated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UITextSelectionDisplayInteraction *)self _existingUnderlineView];
  [v7 removeUnderlines:v6 animated:v4];
}

- (void)_removeAllInteractiveUnderlinesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UITextSelectionDisplayInteraction *)self _existingUnderlineView];
  [v4 clearAllUnderlinesAnimated:v3];
}

- (id)_underlineRectsForRange:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  id v6 = [WeakRetained _underlineRectsByDocumentLineForSelectionRange:v4];

  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [(UITextSelectionDisplayInteraction *)self textInput];
  id v8 = [v7 textInputView];

  id v9 = [(UITextSelectionDisplayInteraction *)self _proofreadingUnderlineView];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        CGAffineTransform v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v14 rect];
        objc_msgSend(v9, "convertRect:fromView:", v8);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        [v14 baselineOffset];
        if (v23 == 0.0) {
          double v24 = v22 * 0.75;
        }
        else {
          double v24 = v23;
        }
        if (v14) {
          [v14 transform];
        }
        else {
          memset(v30, 0, sizeof(v30));
        }
        long long v25 = +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", v30, v16, v18, v20, v22, v24);
        [v25 setAssociatedTextRange:v4];
        CGFloat v26 = [(UITextSelectionDisplayInteraction *)self defaultUnderlineColor];
        [v25 setUnderlineColor:v26];

        if (v25) {
          [v29 addObject:v25];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  return v29;
}

- (id)_underlineTextInRange:(id)a3 animated:(BOOL)a4
{
  return [(UITextSelectionDisplayInteraction *)self _underlineTextInRange:a3 animated:a4 preferredUUID:0];
}

- (id)_underlineTextInRange:(id)a3 animated:(BOOL)a4 preferredUUID:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!self->_proofreadingUnderlines)
  {
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    proofreadingUnderlines = self->_proofreadingUnderlines;
    self->_proofreadingUnderlines = v10;
  }
  uint64_t v12 = [(UITextSelectionDisplayInteraction *)self _underlineRectsForRange:v8];
  if (v9)
  {
    double v13 = [(NSMutableDictionary *)self->_proofreadingUnderlines objectForKeyedSubscript:v9];
    char v14 = [v12 isEqualToArray:v13];

    id v15 = v9;
    if (v14) {
      goto LABEL_8;
    }
    [(UITextSelectionDisplayInteraction *)self _removeUnderlineWithIdentifier:v15 animated:0];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F29128] UUID];
  }
  [(NSMutableDictionary *)self->_proofreadingUnderlines setObject:v12 forKey:v15];
  double v16 = [(UITextSelectionDisplayInteraction *)self _proofreadingUnderlineView];
  [v16 addUnderlines:v12 animated:v6];

LABEL_8:
  return v15;
}

- (void)_removeUnderlineWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  BOOL v6 = -[NSMutableDictionary objectForKey:](self->_proofreadingUnderlines, "objectForKey:");
  if (v6)
  {
    [(NSMutableDictionary *)self->_proofreadingUnderlines removeObjectForKey:v8];
    id v7 = [(UITextSelectionDisplayInteraction *)self _proofreadingUnderlineView];
    [v7 removeUnderlines:v6 animated:v4];
  }
  if (![(NSMutableDictionary *)self->_proofreadingUnderlines count]) {
    [(UITextSelectionDisplayInteraction *)self cleanUpProofreading];
  }
}

- (void)_removeAllProofreadingUnderlinesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(NSMutableDictionary *)self->_proofreadingUnderlines allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        uint64_t v11 = [(UITextSelectionDisplayInteraction *)self _proofreadingUnderlineView];
        [v11 removeUnderlines:v10 animated:v3];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)self->_proofreadingUnderlines removeAllObjects];
  [(UITextSelectionDisplayInteraction *)self cleanUpProofreading];
}

- (void)_updateAnimatedUnderlinesIfNeeded
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_proofreadingUnderlines count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v3 = [(NSMutableDictionary *)self->_proofreadingUnderlines allKeys];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v9 = [(NSMutableDictionary *)self->_proofreadingUnderlines objectForKey:v8];
          uint64_t v10 = v9;
          if (v9)
          {
            uint64_t v11 = [v9 firstObject];
            long long v12 = [v11 associatedTextRange];

            long long v13 = [(UITextSelectionDisplayInteraction *)self _underlineRectsForRange:v12];
            long long v14 = v13;
            if (v13)
            {
              if (([v13 isEqual:v10] & 1) == 0)
              {
                long long v15 = [(UITextSelectionDisplayInteraction *)self _proofreadingUnderlineView];
                [v15 removeUnderlines:v10 animated:0];

                [(NSMutableDictionary *)self->_proofreadingUnderlines setObject:v14 forKey:v8];
                double v16 = [(UITextSelectionDisplayInteraction *)self _proofreadingUnderlineView];
                [v16 addUnderlines:v14 animated:0];
              }
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }
  }
}

- (void)cleanUpProofreading
{
  [(UIView *)self->_proofreadingUnderlineView removeFromSuperview];
  proofreadingUnderlineView = self->_proofreadingUnderlineView;
  self->_proofreadingUnderlineView = 0;
}

- (id)defaultUnderlineColor
{
  BOOL v3 = [(UITextSelectionDisplayInteraction *)self textInput];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(UITextSelectionDisplayInteraction *)self textInput];
    uint64_t v6 = [v5 insertionPointColor];
    goto LABEL_5;
  }
  uint64_t v7 = [(UITextSelectionDisplayInteraction *)self view];

  if (v7)
  {
    uint64_t v5 = [(UITextSelectionDisplayInteraction *)self view];
    uint64_t v6 = [v5 tintColor];
LABEL_5:
    uint64_t v8 = (void *)v6;

    if (v8) {
      goto LABEL_7;
    }
  }
  uint64_t v8 = +[UIColor insertionPointColor];
LABEL_7:
  return v8;
}

- (NSArray)_preferredLayoutRectsForEditMenu
{
  return 0;
}

- (BOOL)_shouldHitTestSelectionGrabbers
{
  if ((self->_rangeViewMode & 0xFFFFFFFE) == 4) {
    return 0;
  }
  BOOL v3 = [(UITextSelectionDisplayInteraction *)self _selectedRange];
  char v4 = [v3 _isRanged];

  return v4;
}

- (id)_beginFloatingCursorSessionAtPoint:(CGPoint)a3 inContainer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  activeFloatingCursorSession = self->_activeFloatingCursorSession;
  if (activeFloatingCursorSession)
  {
    [(_UITextFloatingCursorSession *)activeFloatingCursorSession _invalidate];
    uint64_t v9 = self->_activeFloatingCursorSession;
    self->_activeFloatingCursorSession = 0;
  }
  uint64_t v10 = [[_UITextFloatingCursorSession alloc] initWithCursorView:self->_concreteCursorView selectionManager:self];
  uint64_t v11 = self->_activeFloatingCursorSession;
  self->_activeFloatingCursorSession = v10;

  -[_UITextFloatingCursorSession updateWithPoint:inContainer:animated:](self->_activeFloatingCursorSession, "updateWithPoint:inContainer:animated:", v7, 1, x, y);
  long long v12 = self->_activeFloatingCursorSession;

  return v12;
}

- (BOOL)_clientManagesSelectionViewSubviewOrder
{
  p_textInput = &self->_textInput;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  if (objc_opt_respondsToSelector())
  {
    id v4 = objc_loadWeakRetained((id *)p_textInput);
    uint64_t v5 = [v4 selectionContainerView];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_filterArchivedSubviews:(id)a3
{
  id v6 = a3;
  id v4 = [(UITextSelectionDisplayInteraction *)self _allManagedSubviews];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    [v6 minusSet:v5];
  }
}

- (BOOL)_isManagedSelectionSubview:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(UITextSelectionDisplayInteraction *)self _allManagedSubviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) containsView:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CGRect)_textRangeAdjustmentRectForEdge:(unint64_t)a3 selectionRects:(id)a4
{
  if (a3) {
    +[UITextSelectionRect endEdgeFromRects:a4];
  }
  else {
    +[UITextSelectionRect startEdgeFromRects:a4];
  }
  rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
  highlightView = self->_highlightView;
  -[UIView convertRect:fromView:](rangeAdjustmentViewContainer, "convertRect:fromView:", highlightView);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)_grabberDotRectForTextRangeAdjustmentEdgeRect:(CGRect)a3 isVertical:(BOOL)a4 direction:(unint64_t)a5
{
  BOOL v6 = a4;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = +[_UITextSelectionLollipopView _visualStyle];
  [v9 dotSizeWithEngagedEffect:0];
  double v11 = v10;

  long long v12 = +[_UITextSelectionLollipopView _visualStyle];
  [v12 minimumStemLength];
  double v14 = v13;

  double v15 = -v14;
  double v16 = v11 * 0.5;
  if (a5 == 4) {
    double v17 = -v14;
  }
  else {
    double v17 = v14;
  }
  double v18 = x + v17;
  if (a5 != 2) {
    double v15 = v14;
  }
  double v19 = y + v15;
  double v20 = x - v16;
  if (v6) {
    double v21 = v19;
  }
  else {
    double v21 = y - v16;
  }
  if (v6) {
    double v22 = v20;
  }
  else {
    double v22 = v18;
  }
  double v23 = v11;
  double v24 = v11;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v21;
  result.origin.double x = v22;
  return result;
}

- (BOOL)_isDisplayingVerticalSelection
{
  return [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer isVertical];
}

- (BOOL)_isVisible
{
  BOOL v3 = [(UITextSelectionDisplayInteraction *)self _isCursorVisible];
  if (v3) {
    LOBYTE(v3) = !self->_selectionUIHiddenForAssertion;
  }
  return v3;
}

- (void)_didBeginRangeAdjustmentInteraction:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer areSelectionGrabbersConcreteImpl];
  uint64_t v5 = v9;
  if (v4)
  {
    char v6 = [v9 baseIsStart];
    rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
    if (v6) {
      [(_UITextSelectionRangeAdjustmentContainerView *)rangeAdjustmentViewContainer trailingLollipopView];
    }
    else {
    double v8 = [(_UITextSelectionRangeAdjustmentContainerView *)rangeAdjustmentViewContainer leadingLollipopView];
    }
    [v8 setEngaged:1];

    uint64_t v5 = v9;
  }
}

- (void)_didEndRangeAdjustmentInteraction:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer areSelectionGrabbersConcreteImpl])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    BOOL v4 = [(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer selectionGrabbers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setEngaged:0];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_viewVisibilityDidChange
{
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 8) != 0) {
    [(UITextSelectionDisplayInteraction *)self setNeedsSelectionUpdate];
  }
}

- (UIEdgeInsets)_paddedEdgeInsetsForGrabberDirection:(unint64_t)a3 isVertical:(BOOL)a4 scale:(double)a5
{
  BOOL v6 = a4;
  uint64_t v8 = +[_UITextSelectionLollipopView _visualStyle];
  [v8 smallPaddedInset];
  double v10 = v9;

  long long v11 = +[_UITextSelectionLollipopView _visualStyle];
  [v11 bigPaddedInset];
  double v13 = v12;

  uint64_t v14 = +[_UITextSelectionLollipopView _visualStyle];
  char v15 = [v14 useGrabberDotsForSelection];

  if (!v6)
  {
    double v16 = v10 / a5;
    double v17 = v13 / a5;
    if ((v15 & 1) == 0)
    {
      if (a3 == 4) {
        double v19 = v16 + v17;
      }
      else {
        double v19 = v10 / a5;
      }
      if (a3 != 4) {
        double v16 = v16 + v17;
      }
      goto LABEL_16;
    }
LABEL_10:
    double v19 = v16;
LABEL_16:
    double v18 = v17;
    goto LABEL_17;
  }
  double v16 = v13 / a5;
  double v17 = v10 / a5;
  if (v15) {
    goto LABEL_10;
  }
  if (a3 == 2) {
    double v18 = v17 + v16;
  }
  else {
    double v18 = v10 / a5;
  }
  if (a3 != 2) {
    double v17 = v17 + v16;
  }
  double v19 = v13 / a5;
LABEL_17:
  result.right = v16;
  result.bottom = v17;
  result.left = v19;
  result.top = v18;
  return result;
}

- (CGRect)textRangeAdjustmentRectForEdge:(unint64_t)a3
{
  uint64_t v5 = [(UITextSelectionHighlightView *)self->_highlightView selectionRects];
  [(UITextSelectionDisplayInteraction *)self _textRangeAdjustmentRectForEdge:a3 selectionRects:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)paddedTextRangeAdjustmentHitRegionForEdge:(unint64_t)a3 precision:(unint64_t)a4
{
  if ([(UITextSelectionDisplayInteraction *)self _shouldHitTestSelectionGrabbers])
  {
    [(UITextSelectionDisplayInteraction *)self textRangeAdjustmentRectForEdge:a3];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(UITextSelectionDisplayInteraction *)self textRangeAdjustmentViewForEdge:a3];
    double v16 = +[_UITextSelectionLollipopView _visualStyle];
    int v17 = [v16 useGrabberDotsForSelection];

    double v18 = v14;
    double v19 = v12;
    double v20 = v10;
    double v21 = v8;
    if (v17)
    {
      -[UITextSelectionDisplayInteraction _grabberDotRectForTextRangeAdjustmentEdgeRect:isVertical:direction:](self, "_grabberDotRectForTextRangeAdjustmentEdgeRect:isVertical:direction:", [v15 isVertical], objc_msgSend(v15, "direction"), v8, v10, v12, v14);
      double v21 = v22;
      double v20 = v23;
    }
    double v43 = v19;
    double v44 = v18;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    long long v25 = [WeakRetained textInputView];
    [v25 _scaleFromLayerTransforms];
    double v27 = v26;
    double v29 = v28;

    if (v27 < 1.0) {
      double v27 = 1.0;
    }
    if (a4 == 2)
    {
      if (v29 >= 1.0) {
        double v30 = -6.0 / v29;
      }
      else {
        double v30 = -6.0;
      }
      v45.origin.double x = v8;
      v45.origin.double y = v10;
      v45.size.double width = v12;
      v45.size.double height = v14;
      CGRect v46 = CGRectInset(v45, -6.0 / v27, v30);
      double x = v46.origin.x;
      double y = v46.origin.y;
      double width = v46.size.width;
      double height = v46.size.height;
    }
    else
    {
      -[UITextSelectionDisplayInteraction _paddedEdgeInsetsForGrabberDirection:isVertical:scale:](self, "_paddedEdgeInsetsForGrabberDirection:isVertical:scale:", [v15 direction], objc_msgSend(v15, "isVertical"), v27);
      double x = v21 + v35;
      double y = v20 + v36;
      double width = v43 - (v35 + v37);
      double height = v44 - (v36 + v38);
    }
  }
  else
  {
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v39 = x;
  double v40 = y;
  double v41 = width;
  double v42 = height;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (id)textRangeAdjustmentViewForEdge:(unint64_t)a3
{
  rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
  if (a3) {
    [(_UITextSelectionRangeAdjustmentContainerView *)rangeAdjustmentViewContainer trailingLollipopView];
  }
  else {
  BOOL v4 = [(_UITextSelectionRangeAdjustmentContainerView *)rangeAdjustmentViewContainer leadingLollipopView];
  }
  return v4;
}

- (void)_setCursorFadedHiddenForFloatingCursor:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_cursorFadedHiddenForFloatingCursor != a3)
  {
    self->_cursorFadedHiddenForFloatingCursor = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      void v4[2] = __85__UITextSelectionDisplayInteraction__setCursorFadedHiddenForFloatingCursor_animated___block_invoke;
      v4[3] = &unk_1E52D9F70;
      v4[4] = self;
      +[UIView animateWithDuration:117440512 delay:v4 options:0 animations:0.15 completion:0.0];
    }
    else
    {
      [(UITextSelectionDisplayInteraction *)self layoutManagedSubviews];
    }
  }
}

uint64_t __85__UITextSelectionDisplayInteraction__setCursorFadedHiddenForFloatingCursor_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutManagedSubviews];
}

- (id)_obtainShimmerHighlightAssertion
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:3 initialState:1 reason:@"Shimmer Highlight assertion" requiresExplicitInvalidation:0];
}

- (id)_obtainGrabberSuppressionAssertion
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:0 initialState:1 reason:@"Generic grabber suppression" requiresExplicitInvalidation:0];
}

- (id)_obtainSelectionUIHiddenAssertionForReason:(id)a3 animated:(BOOL)a4
{
  self->_shouldAnimateSelectionUIHiddenAssertionState = a4;
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:4 initialState:1 reason:a3];
}

- (id)_obtainGhostCursorAssertion
{
  return [(UITextSelectionDisplayInteraction *)self obtainGhostCursorAssertionForReason:@"Generic ghost assertion"];
}

- (id)obtainGhostCursorAssertionForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextSelectionDisplayInteraction *)self _cursorAssertionController];
  double v6 = [v5 nonBlinkingGhostAssertionWithReason:v4];

  return v6;
}

- (id)obtainBlinkSuppressionAssertionForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextSelectionDisplayInteraction *)self _cursorAssertionController];
  double v6 = [v5 nonBlinkingAssertionWithReason:v4];

  return v6;
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  BOOL result = 0;
  uint64_t v5 = 21;
  switch(a3)
  {
    case 0uLL:
      if (![(_UITextSelectionRangeAdjustmentContainerView *)self->_rangeAdjustmentViewContainer areSelectionGrabbersHidden])goto LABEL_4; {
      return 1;
      }
    case 1uLL:
      goto LABEL_6;
    case 3uLL:
LABEL_4:
      uint64_t v5 = 25;
      goto LABEL_6;
    case 4uLL:
      uint64_t v5 = 26;
LABEL_6:
      BOOL result = *((unsigned char *)&self->super.isa + v5) != 0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  switch(a4)
  {
    case 0uLL:
      rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
      [(_UITextSelectionRangeAdjustmentContainerView *)rangeAdjustmentViewContainer setSelectionGrabbersHidden:a3];
      break;
    case 1uLL:
      self->_cursorAccessoryViewHidden = a3;
      [(UITextSelectionDisplayInteraction *)self setNeedsSelectionUpdate];
      break;
    case 3uLL:
      self->_shouldDisplayShimmerHighlights = a3;
      -[_UITextSelectionRangeAdjustmentContainerView setSelectionGrabbersHidden:](self->_rangeAdjustmentViewContainer, "setSelectionGrabbersHidden:");
      [(UITextSelectionDisplayInteraction *)self _updateHighlightViewWithShimmerState];
      break;
    case 4uLL:
      self->_selectionUIHiddenForAssertion = a3;
      [(UITextSelectionDisplayInteraction *)self setNeedsSelectionUpdate];
      if (self->_shouldAnimateSelectionUIHiddenAssertionState)
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __84__UITextSelectionDisplayInteraction_assertionActivationStateChangedToState_forType___block_invoke;
        v6[3] = &unk_1E52D9F70;
        v6[4] = self;
        +[UIView animateWithDuration:4 delay:v6 options:0 animations:0.15 completion:0.0];
      }
      break;
    default:
      return;
  }
}

uint64_t __84__UITextSelectionDisplayInteraction_assertionActivationStateChangedToState_forType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSelectionIfNeeded];
}

- (id)_obtainHideCursorAccessoriesAssertionWithReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:1 initialState:1 reason:a3];
}

- (int)_glowViewMode
{
  return self->_glowViewMode;
}

- (UIStandardTextCursorView)_cursorView
{
  return self->_concreteCursorView;
}

- (_UITextSelectionHighlightView)_highlightView
{
  return self->_concreteHighlightView;
}

- (UITextCursorAssertionController)_cursorAssertionController
{
  return self->_cursorAssertionController;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (id)textInput
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  return WeakRetained;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)isCursorHidden
{
  return self->_cursorHidden;
}

- (int)rangeViewMode
{
  return self->_rangeViewMode;
}

- (CGRect)textSelectionMenuSourceRect
{
  double x = self->_textSelectionMenuSourceRect.origin.x;
  double y = self->_textSelectionMenuSourceRect.origin.y;
  double width = self->_textSelectionMenuSourceRect.size.width;
  double height = self->_textSelectionMenuSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_dictationBlinkSuppressionAssertion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

- (void)setCursorPortalInteraction:(id)a3
{
}

- (void)setTrailingPortalInteraction:(id)a3
{
}

- (void)set_isDictationRunning:(BOOL)a3
{
  self->__isDictationRunning = a3;
}

- (BOOL)cursorBlinks
{
  v2 = [(UITextSelectionDisplayInteraction *)self cursorView];
  char v3 = [v2 isBlinking];

  return v3;
}

- (void)setCursorBlinks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UITextSelectionDisplayInteraction *)self cursorView];
  [v4 setBlinking:v3];
}

- (BOOL)cursorVisible
{
  return ![(UITextSelectionDisplayInteraction *)self isCursorHidden];
}

- (void)setCursorVisible:(BOOL)a3
{
}

- (BOOL)ghostAppearance
{
  v2 = [(UITextSelectionDisplayInteraction *)self _cursorView];
  char v3 = [v2 isGhostEffectEnabled];

  return v3;
}

- (void)setGhostAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UITextSelectionDisplayInteraction *)self _cursorView];
  [v4 setGhostEffectEnabled:v3];
}

- (unint64_t)activeIndicators
{
  return self->_activeIndicators;
}

- (void)clearInputModeCursorAssertion
{
  [(UITextCursorAssertion *)self->_showInputModesCursorAssertion invalidate];
  showInputModesCursorAssertion = self->_showInputModesCursorAssertion;
  self->_showInputModesCursorAssertion = 0;
}

- (void)clearDeleteButtonCursorAssertion
{
  [(UITextCursorAssertion *)self->_showDeleteButtonCursorAssertion invalidate];
  showDeleteButtonCursorAssertion = self->_showDeleteButtonCursorAssertion;
  self->_showDeleteButtonCursorAssertion = 0;
}

- (id)inputModeForDictationLanguage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v5 = [v4 keyboardLanguageForDictationLanguage:v3];
  double v6 = (void *)v5;
  if (v5) {
    double v7 = (void *)v5;
  }
  else {
    double v7 = v3;
  }
  id v8 = v7;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v9 = +[UIKeyboardInputModeController sharedInputModeController];
  double v10 = [v9 activeInputModes];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v21;
LABEL_6:
    uint64_t v15 = 0;
    double v16 = v13;
    while (1)
    {
      if (*(void *)v21 != v14) {
        objc_enumerationMutation(v10);
      }
      id v13 = *(id *)(*((void *)&v20 + 1) + 8 * v15);

      int v17 = [v13 languageWithRegion];
      char v18 = [v8 isEqualToString:v17];

      if (v18) {
        break;
      }
      ++v15;
      double v16 = v13;
      if (v12 == v15)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          goto LABEL_6;
        }

        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    id v13 = 0;
  }

  return v13;
}

- (void)setActiveIndicators:(unint64_t)a3
{
}

- (void)setActiveIndicators:(unint64_t)a3 animationStyle:(int64_t)a4
{
  unint64_t v5 = a3;
  double v6 = self;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if ((a3 & 4) != 0 || self->_activeIndicators != a3)
  {
    self->_activeIndicators = a3;
    id v71 = objc_opt_new();
    if ((v5 & 8) != 0)
    {
      LODWORD(v8) = a4 == 1;
      if ((v5 & 4) == 0)
      {
        uint64_t v14 = objc_alloc_init(_UIDictationCursorAccessory);
        [(_UICursorAccessory *)v14 setIdentifier:@"dic"];
        [(_UICursorAccessory *)v14 setStyle:1];
        [(_UICursorAccessory *)v14 setInteractive:1];
        [v71 addObject:v14];
      }
      if ((v5 & 0x10) != 0)
      {
        if (+[UIDictationUtilities shouldAddDeleteMenuElement])
        {
          uint64_t v15 = objc_alloc_init(_UIDeleteCursorAccessory);
          [(_UICursorAccessory *)v15 setIdentifier:@"del"];
          [(_UICursorAccessory *)v15 setStyle:1];
          [(_UICursorAccessory *)v15 setInteractive:1];
          if ((v5 & 4) != 0) {
            [(_UICursorAccessory *)v15 setStyle:2];
          }
          [v71 addObject:v15];
        }
        else
        {
          [(UITextSelectionDisplayInteraction *)v6 clearDeleteButtonCursorAssertion];
        }
      }
      long long v23 = +[UIKeyboardImpl activeInstance];
      double v24 = [v23 activeDictationLanguage];

      if ((v5 & 4) != 0)
      {
        long long v31 = v24;
        BOOL v66 = a4 == 1;
        int64_t v68 = a4;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v81 = 0u;
        long long v80 = 0u;
        long long v32 = +[UIKeyboardInputModeController sharedInputModeController];
        long long v33 = [v32 enabledDictationLanguages];

        id obja = v33;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v80 objects:v85 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v81;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v81 != v36) {
                objc_enumerationMutation(obja);
              }
              double v38 = *(void **)(*((void *)&v80 + 1) + 8 * i);
              double v39 = [(UITextSelectionDisplayInteraction *)v6 inputModeForDictationLanguage:v38];
              double v40 = v6;
              double v41 = objc_alloc_init(_UIInputModeCursorAccessory);
              double v42 = [v39 identifier];
              [(_UIInputModeCursorAccessory *)v41 setInputModeIdentifier:v42];

              [(_UIInputModeCursorAccessory *)v41 setDictationLanguage:v38];
              -[_UICursorAccessory setStyle:](v41, "setStyle:", [v38 isEqualToString:v31]);
              [(_UICursorAccessory *)v41 setInteractive:1];
              [(_UICursorAccessory *)v41 setLarge:1];
              [v71 addObject:v41];

              double v6 = v40;
            }
            uint64_t v35 = [obja countByEnumeratingWithState:&v80 objects:v85 count:16];
          }
          while (v35);
        }

        LODWORD(v8) = v66;
        a4 = v68;
        double v24 = v31;
      }
      else
      {
        uint64_t v25 = +[UIKeyboardInputModeController sharedInputModeController];
        double v26 = [v25 enabledDictationLanguages];
        unint64_t v27 = [v26 count];

        if (a4 == 1 && v27 >= 2)
        {
          double v28 = objc_alloc_init(_UIInputModeCursorAccessory);
          double v29 = [(UITextSelectionDisplayInteraction *)v6 inputModeForDictationLanguage:v24];
          double v30 = [v29 identifier];
          [(_UIInputModeCursorAccessory *)v28 setInputModeIdentifier:v30];

          [(_UIInputModeCursorAccessory *)v28 setDictationLanguage:v24];
          [(_UICursorAccessory *)v28 setStyle:1];
          [(_UICursorAccessory *)v28 setInteractive:1];
          [v71 addObject:v28];

          LODWORD(v8) = 1;
        }
      }
    }
    else
    {
      if ((v5 & 0x20) != 0)
      {
        double v7 = objc_alloc_init(_UIModifierKeyCursorAccessory);
        [(_UIModifierKeyCursorAccessory *)v7 setModifierType:3];
        [(_UICursorAccessory *)v7 setStyle:2];
        [v71 addObject:v7];
      }
      uint64_t v8 = (v5 >> 1) & 1;
      if ((v5 & 2) != 0)
      {
        double v9 = objc_alloc_init(_UIInputModeCursorAccessory);
        double v10 = v9;
        if ((v5 & 4) != 0)
        {
          uint64_t v65 = (v5 >> 1) & 1;
          int64_t v67 = a4;
          obuint64_t j = v6;
          id v63 = v9;
          char v64 = v5;
          if ((v5 & 0x40) != 0)
          {
            double v43 = +[UIInputSwitcher sharedInstance];
            char v18 = [v43 selectedInputMode];

            double v19 = +[UIInputSwitcher sharedInstance];
            long long v22 = [v19 availableInputModes];
          }
          else
          {
            double v16 = +[UIKeyboardInputModeController sharedInputModeController];
            int v17 = [v16 currentInputMode];
            char v18 = [v17 identifier];

            double v19 = +[UIKeyboardInputModeController sharedInputModeController];
            long long v20 = [v19 activeInputModeIdentifiers];
            long long v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_490];
            long long v22 = [v20 filteredArrayUsingPredicate:v21];
          }
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v44 = v22;
          uint64_t v45 = [v44 countByEnumeratingWithState:&v76 objects:v84 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v77;
            do
            {
              for (uint64_t j = 0; j != v46; ++j)
              {
                if (*(void *)v77 != v47) {
                  objc_enumerationMutation(v44);
                }
                v49 = *(void **)(*((void *)&v76 + 1) + 8 * j);
                v50 = objc_alloc_init(_UIInputModeCursorAccessory);
                id v51 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v49];
                id v52 = [v51 identifier];
                [(_UIInputModeCursorAccessory *)v50 setInputModeIdentifier:v52];

                -[_UICursorAccessory setStyle:](v50, "setStyle:", [v49 isEqual:v18]);
                [(_UICursorAccessory *)v50 setInteractive:1];
                [(_UICursorAccessory *)v50 setLarge:1];
                [v71 addObject:v50];
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v76 objects:v84 count:16];
            }
            while (v46);
          }

          a4 = v67;
          double v6 = obj;
          LOBYTE(v5) = v64;
          LODWORD(v8) = v65;
          double v10 = v63;
        }
        else
        {
          uint64_t v11 = UIKeyboardGetCurrentInputMode();
          uint64_t v12 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v11];

          id v13 = [v12 identifier];
          [(_UIInputModeCursorAccessory *)v10 setInputModeIdentifier:v13];

          [(_UICursorAccessory *)v10 setStyle:1];
          [(_UICursorAccessory *)v10 setInteractive:1];
          [v71 addObject:v10];
        }
      }
      if ((v5 & 5) != 1)
      {
LABEL_44:
        id v53 = [(UITextSelectionDisplayInteraction *)v6 textInput];
        if (objc_opt_respondsToSelector())
        {
          int v54 = [v53 _systemCursorAccessoriesDisabled] ^ 1;
          if (!v8)
          {
LABEL_49:
            if (!v54)
            {
LABEL_59:

              return;
            }
            if ([v71 count])
            {
              BOOL v57 = [(UITextSelectionDisplayInteraction *)v6 _isCursorAccessoryViewEnabled];
              v58 = [(UITextSelectionDisplayInteraction *)v6 _cursorAccessoryViewController];
              id v59 = v58;
              if (v57)
              {
                uint64_t v60 = 1;
                [v58 setAccessories:v71 animated:1];
                id v61 = 0;
LABEL_55:
                [v59 setTouchFallbackEnabled:v8 & v60];
                if (a4 == 2) {
                  uint64_t v62 = 2;
                }
                else {
                  uint64_t v62 = a4 == 1;
                }
                [v59 setVisible:v60 animationStyle:v62 completion:v61];

                goto LABEL_59;
              }
            }
            else
            {
              id v59 = [(UITextSelectionDisplayInteraction *)v6 _cursorAccessoryViewController];
            }
            objc_initWeak(&location, v59);
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __84__UITextSelectionDisplayInteraction_Assertions__setActiveIndicators_animationStyle___block_invoke_2;
            aBlock[3] = &unk_1E52D9960;
            objc_copyWeak(&v74, &location);
            id v73 = v71;
            id v61 = _Block_copy(aBlock);

            objc_destroyWeak(&v74);
            objc_destroyWeak(&location);
            uint64_t v60 = 0;
            goto LABEL_55;
          }
        }
        else
        {
          int v54 = 1;
          if (!v8) {
            goto LABEL_49;
          }
        }
        v55 = [v53 interactionAssistant];
        id v56 = [v55 _editMenuAssistant];

        [v56 _hideSelectionCommandsWithReason:0];
        goto LABEL_49;
      }
      double v24 = objc_alloc_init(_UIModifierKeyCursorAccessory);
      [(_UIModifierKeyCursorAccessory *)v24 setModifierType:2];
      [(_UICursorAccessory *)v24 setStyle:1];
      [(_UICursorAccessory *)v24 setInteractive:1];
      [v71 addObject:v24];
    }

    goto LABEL_44;
  }
}

uint64_t __84__UITextSelectionDisplayInteraction_Assertions__setActiveIndicators_animationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIKeyboardInputModeController sharedInputModeController];
  id v4 = [v3 inputModeWithIdentifier:v2];

  if ([v4 isEmojiInputMode])
  {
    uint64_t v5 = 0;
  }
  else
  {
    double v6 = [v4 primaryLanguage];
    if (UIKeyboardInputModeIsNonLinguistic(v6)) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [v4 isExtensionInputMode] ^ 1;
    }
  }
  return v5;
}

void __84__UITextSelectionDisplayInteraction_Assertions__setActiveIndicators_animationStyle___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = [WeakRetained isVisible];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 setAccessories:*(void *)(a1 + 32) animated:0];
  }
}

- (void)_cursorAccessoryViewController:(id)a3 didActivateCursorAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 _inputModeCursorAccessory];
  double v9 = v8;
  if (v8)
  {
    double v10 = [v8 dictationLanguage];

    showInputModesCursorAssertion = self->_showInputModesCursorAssertion;
    if (v10)
    {
      if (showInputModesCursorAssertion)
      {
        uint64_t v12 = +[UIKeyboardImpl activeInstance];
        id v13 = [v12 activeDictationLanguage];

        uint64_t v14 = [v9 dictationLanguage];
        char v15 = [v14 isEqualToString:v13];

        if ((v15 & 1) == 0)
        {
          double v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
          objc_initWeak(&location, v16);

          uint64_t v51 = 0;
          id v52 = &v51;
          uint64_t v53 = 0x3032000000;
          int v54 = __Block_byref_object_copy__178;
          v55 = __Block_byref_object_dispose__178;
          id v56 = 0;
          id v17 = objc_loadWeakRetained(&location);
          char v18 = [MEMORY[0x1E4F28F08] mainQueue];
          uint64_t v44 = MEMORY[0x1E4F143A8];
          uint64_t v45 = 3221225472;
          uint64_t v46 = __107__UITextSelectionDisplayInteraction_Assertions___cursorAccessoryViewController_didActivateCursorAccessory___block_invoke;
          uint64_t v47 = &unk_1E52FC678;
          id v48 = v9;
          objc_copyWeak(&v50, &location);
          v49 = &v51;
          uint64_t v19 = [v17 addObserverForName:@"UIDictationControllerDictationDidFinish" object:0 queue:v18 usingBlock:&v44];
          long long v20 = (void *)v52[5];
          v52[5] = v19;

          if (+[UIDictationController isRunning])
          {
            long long v21 = +[UIDictationView sharedInstance];
            [v21 setSwitchingLanguage:1];

            long long v22 = +[UIDictationController activeInstance];
            [v22 setReasonType:28];

            long long v23 = +[UIDictationController activeInstance];
            [v23 cancelDictation];
          }
          _Block_object_dispose(&v51, 8);

          objc_destroyWeak(&v50);
          objc_destroyWeak(&location);
        }
        [(UITextSelectionDisplayInteraction *)self clearInputModeCursorAssertion];
      }
      else
      {
        id v13 = [(UITextSelectionDisplayInteraction *)self _cursorAssertionController];
        double v28 = [v13 inputModeSelectorAssertionWithReason:@"Show input modes" userInfo:MEMORY[0x1E4F1CC08]];
        double v29 = self->_showInputModesCursorAssertion;
        self->_showInputModesCursorAssertion = v28;
      }
    }
    else
    {
      if (showInputModesCursorAssertion)
      {
        double v24 = +[UIKeyboardInputModeController sharedInputModeController];
        uint64_t v25 = [v9 inputModeIdentifier];
        double v26 = [v24 inputModeWithIdentifier:v25];

        unint64_t v27 = +[UIKeyboardImpl sharedInstance];
        [v27 setKeyboardInputMode:v26 userInitiated:1];

        [(UITextSelectionDisplayInteraction *)self clearInputModeCursorAssertion];
        goto LABEL_14;
      }
      double v30 = [(UITextSelectionDisplayInteraction *)self _cursorAssertionController];
      long long v31 = [v30 inputModeSelectorAssertionWithReason:@"Show input modes" userInfo:MEMORY[0x1E4F1CC08]];
      long long v32 = self->_showInputModesCursorAssertion;
      self->_showInputModesCursorAssertion = v31;

      id v13 = +[UIKeyboardImpl sharedInstance];
      long long v33 = [v13 inputModeIndicatorController];
      [v33 inputModeSelectorDidOpen];
    }
  }
LABEL_14:
  uint64_t v34 = [v7 identifier];

  if (v34 == @"dic")
  {
    uint64_t v35 = +[UIDictationController activeInstance];
    [v35 setReasonType:29];

    uint64_t v36 = +[UIDictationController activeInstance];
    [v36 stopDictation];

    [(UITextSelectionDisplayInteraction *)self clearInputModeCursorAssertion];
  }
  double v37 = [v7 identifier];

  if (v37 == @"del")
  {
    double v38 = +[UIKeyboardImpl activeInstance];
    double v39 = [v38 inputDelegateManager];
    [v39 deleteBackward];

    double v40 = +[UIKeyboardImpl activeInstance];
    [v40 dismissDictationMenu];

    [(UITextSelectionDisplayInteraction *)self clearDeleteButtonCursorAssertion];
  }
  double v41 = [v7 _modifierKeyCursorAccessory];
  uint64_t v42 = [v41 modifierType];

  if (v42 == 2)
  {
    double v43 = +[UIKeyboardImpl activeInstance];
    [v43 _resetCapsLock];
  }
}

void __107__UITextSelectionDisplayInteraction_Assertions___cursorAccessoryViewController_didActivateCursorAccessory___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__UITextSelectionDisplayInteraction_Assertions___cursorAccessoryViewController_didActivateCursorAccessory___block_invoke_2;
  block[3] = &unk_1E52D9F70;
  id v5 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __107__UITextSelectionDisplayInteraction_Assertions___cursorAccessoryViewController_didActivateCursorAccessory___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = +[UIDictationController sharedInstance];
  id v3 = [*(id *)(a1 + 32) dictationLanguage];
  char v4 = +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:@"UIDictationInputModeInvocationSourceDictationPopUpUILanguageSwitcherIcon"];
  [v2 switchToDictationLanguage:v3 inputOptions:v4];

  id v5 = +[UIDictationView sharedInstance];
  [v5 setSwitchingLanguage:0];
}

@end