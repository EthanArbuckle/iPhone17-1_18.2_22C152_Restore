@interface _UIContextMenuView
- (BOOL)_allowsChangingFirstResponderForFocusUpdateWithContext:(id)a3;
- (BOOL)_touchSupportsAutoNavigation:(id)a3;
- (BOOL)allowsBackgroundViewInteraction;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasTrackingTouch;
- (BOOL)isComputingPreferredSize;
- (BOOL)kickstartActionScrubbingWithGesture:(id)a3;
- (BOOL)retainHighlightOnMenuNavigation;
- (BOOL)reversesActionOrder;
- (BOOL)scrubbingEnabled;
- (BOOL)shouldAvoidInputViews;
- (BOOL)showsShadow;
- (BOOL)wantsFocusDeferralIfSupported;
- (CGRect)_rectOfNodeParentElement:(id)a3;
- (CGRect)activeSubmenuFrameInCoordinateSpace:(id)a3;
- (CGSize)maxContainerSize;
- (CGSize)preferredContentSizeWithinContainerSize:(CGSize)a3;
- (CGSize)visibleContentSize;
- (NSArray)visibleMenus;
- (NSDate)appearanceDate;
- (NSIndexPath)unselectableIndexPath;
- (NSTimer)autoNavigationTimer;
- (NSTimer)autoUnhighlightTimer;
- (NSTimer)hoverAutoExitTimer;
- (UICollectionViewDiffableDataSource)collectionViewDataSource;
- (UIHoverGestureRecognizer)highlightHoverGestureRecognizer;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (_UIContextMenuHierarchyLayout)layout;
- (_UIContextMenuLinkedList)submenus;
- (_UIContextMenuListView)currentListView;
- (_UIContextMenuNode)departingNode;
- (_UIContextMenuNode)hoveredNode;
- (_UIContextMenuSelectionDelayGestureRecognizer)selectionDelayGestureRecognizer;
- (_UIContextMenuView)initWithFrame:(CGRect)a3;
- (_UIContextMenuViewDelegate)delegate;
- (_UIContinuousSelectionGestureRecognizer)selectionGestureRecognizer;
- (_UIVelocityIntegrator)hoverVelocityIntegrator;
- (double)closestScrollTruncationDetentToHeight:(double)a3;
- (double)preferredScrollTruncationDetent;
- (id)_newListViewWithMenu:(id)a3 position:(unint64_t)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hoveredListView;
- (id)keyCommands;
- (id)preferredFocusEnvironments;
- (unint64_t)attachmentEdge;
- (unint64_t)hierarchyStyle;
- (void)_clearAutoNavigationTimer;
- (void)_clearHoverAutoExitTimer;
- (void)_displayMenu:(id)a3 inPlaceOfMenu:(id)a4 updateType:(unint64_t)a5 alongsideAnimations:(id)a6;
- (void)_handleEscapeKey:(id)a3;
- (void)_handleHoverGestureRecognizer:(id)a3;
- (void)_handleMenuPressGesture:(id)a3;
- (void)_handleRightArrowKey:(id)a3;
- (void)_handleSelectPressGesture:(id)a3;
- (void)_handleSelectionForElement:(id)a3;
- (void)_handleSelectionGesture:(id)a3;
- (void)_performActionForElement:(id)a3;
- (void)_selectPreviousMenuIfPossible;
- (void)_setAutoNavigationTimerIfNecessaryForElement:(id)a3 isTrackpadHover:(BOOL)a4;
- (void)_setHighlightedIndexPath:(id)a3 playFeedback:(BOOL)a4 atLocation:(CGPoint)a5 allowAutoNavigation:(BOOL)a6;
- (void)_setHoverAutoExitTimer;
- (void)_testing_tapAnAction;
- (void)_updateSelectionGestureAllowableMovementForGestureBeginningAtIndexPath:(id)a3;
- (void)didCompleteMenuAppearanceAnimation;
- (void)didMoveToWindow;
- (void)displayMenu:(id)a3 updateType:(unint64_t)a4 alongsideAnimations:(id)a5;
- (void)flashScrollIndicators;
- (void)layoutSubviews;
- (void)replaceVisibleMenu:(id)a3 withMenu:(id)a4 alongsideAnimations:(id)a5;
- (void)scrollToFirstSignificantAction;
- (void)setAllowsBackgroundViewInteraction:(BOOL)a3;
- (void)setAppearanceDate:(id)a3;
- (void)setAttachmentEdge:(unint64_t)a3;
- (void)setAutoNavigationTimer:(id)a3;
- (void)setAutoUnhighlightTimer:(id)a3;
- (void)setCollectionViewDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDepartingNode:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setHasTrackingTouch:(BOOL)a3;
- (void)setHierarchyStyle:(unint64_t)a3;
- (void)setHighlightHoverGestureRecognizer:(id)a3;
- (void)setHoverAutoExitTimer:(id)a3;
- (void)setHoverVelocityIntegrator:(id)a3;
- (void)setHoveredNode:(id)a3;
- (void)setIsComputingPreferredSize:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setMaxContainerSize:(CGSize)a3;
- (void)setPreferredScrollTruncationDetent:(double)a3;
- (void)setRetainHighlightOnMenuNavigation:(BOOL)a3;
- (void)setReversesActionOrder:(BOOL)a3;
- (void)setScrubbingEnabled:(BOOL)a3;
- (void)setSelectionDelayGestureRecognizer:(id)a3;
- (void)setSelectionGestureRecognizer:(id)a3;
- (void)setShouldAvoidInputViews:(BOOL)a3;
- (void)setShowsShadow:(BOOL)a3;
- (void)setSubmenus:(id)a3;
- (void)setUnselectableIndexPath:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setVisibleContentSize:(CGSize)a3;
- (void)setWantsFocusDeferralIfSupported:(BOOL)a3;
@end

@implementation _UIContextMenuView

- (_UIContextMenuView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)_UIContextMenuView;
  v3 = -[UIView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    [(UIView *)v4 _setSafeAreaInsetsFrozen:1];
    v6 = [(UIGestureRecognizer *)[_UIContinuousSelectionGestureRecognizer alloc] initWithTarget:v4 action:sel__handleSelectionGesture_];
    [(_UIContextMenuView *)v4 setSelectionGestureRecognizer:v6];

    v7 = [(_UIContextMenuView *)v4 selectionGestureRecognizer];
    [v7 setName:@"com.apple.UIKit.ContextMenuActionsListSelection"];

    v8 = [(_UIContextMenuView *)v4 selectionGestureRecognizer];
    [v8 setDelegate:v4];

    v9 = [(_UIContextMenuView *)v4 selectionGestureRecognizer];
    [(UIView *)v4 addGestureRecognizer:v9];

    v10 = [(UIGestureRecognizer *)[_UIContextMenuSelectionDelayGestureRecognizer alloc] initWithTarget:0 action:0];
    [(_UIContextMenuView *)v4 setSelectionDelayGestureRecognizer:v10];

    v11 = [(_UIContextMenuView *)v4 selectionDelayGestureRecognizer];
    [v11 setName:@"com.apple.UIKit.ContextMenuActionsListSelectionDelay"];

    v12 = [(_UIContextMenuView *)v4 selectionDelayGestureRecognizer];
    [v12 setDelegate:v4];

    v13 = [(_UIContextMenuView *)v4 selectionDelayGestureRecognizer];
    [(UIView *)v4 addGestureRecognizer:v13];

    v14 = [[UITapGestureRecognizer alloc] initWithTarget:v4 action:sel__handleSelectPressGesture_];
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
    [(UIGestureRecognizer *)v14 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(UITapGestureRecognizer *)v14 setAllowedPressTypes:&unk_1ED3EF098];
    [(UIGestureRecognizer *)v14 setCancelsTouchesInView:1];
    [(UIView *)v4 addGestureRecognizer:v14];
    v16 = [[UITapGestureRecognizer alloc] initWithTarget:v4 action:sel__handleMenuPressGesture_];

    [(UIGestureRecognizer *)v16 setAllowedTouchTypes:v15];
    [(UITapGestureRecognizer *)v16 setAllowedPressTypes:&unk_1ED3EF0B0];
    [(UIView *)v4 addGestureRecognizer:v16];
    v17 = [[UIHoverGestureRecognizer alloc] initWithTarget:v4 action:sel__handleHoverGestureRecognizer_];
    [(_UIContextMenuView *)v4 setHighlightHoverGestureRecognizer:v17];

    v18 = [(_UIContextMenuView *)v4 highlightHoverGestureRecognizer];
    [v18 setName:@"com.apple.UIKit.ContextMenuActionsListHover"];

    v19 = [(_UIContextMenuView *)v4 highlightHoverGestureRecognizer];
    [v19 setDelegate:v4];

    v20 = [(_UIContextMenuView *)v4 highlightHoverGestureRecognizer];
    [(UIView *)v4 addGestureRecognizer:v20];

    v21 = +[_UISelectionFeedbackGeneratorConfiguration defaultConfiguration];
    v22 = [v21 tweakedConfigurationForClass:objc_opt_class() usage:@"retarget"];

    v23 = [(UIFeedbackGenerator *)[UISelectionFeedbackGenerator alloc] initWithConfiguration:v22 view:v4];
    [(_UIContextMenuView *)v4 setFeedbackGenerator:v23];

    v24 = objc_opt_new();
    [(_UIContextMenuView *)v4 setSubmenus:v24];

    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v25 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v27 = _UIInternalPreference_ClickUIDebugEnabled;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
      {
        while (v25 >= v27)
        {
          _UIInternalPreferenceSync(v25, &_UIInternalPreference_ClickUIDebugEnabled, @"ClickUIDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v27 = _UIInternalPreference_ClickUIDebugEnabled;
          if (v25 == _UIInternalPreference_ClickUIDebugEnabled) {
            goto LABEL_5;
          }
        }
        if (byte_1E8FD4F1C)
        {
          v28 = [(UIView *)v4 layer];
          [v28 setBorderWidth:1.0];

          id v29 = +[UIColor magentaColor];
          uint64_t v30 = [v29 CGColor];
          v31 = [(UIView *)v4 layer];
          [v31 setBorderColor:v30];
        }
      }
    }
LABEL_5:
  }
  return v4;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuView;
  -[UIView setUserInteractionEnabled:](&v7, sel_setUserInteractionEnabled_);
  v5 = [(_UIContextMenuView *)self selectionGestureRecognizer];
  [v5 setEnabled:v3];

  v6 = [(_UIContextMenuView *)self highlightHoverGestureRecognizer];
  [v6 setEnabled:v3];
}

- (void)setShowsShadow:(BOOL)a3
{
  if (self->_showsShadow != a3)
  {
    self->_showsShadow = a3;
    if (a3) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
    id v4 = [(_UIContextMenuView *)self currentListView];
    [v4 setShadowAlpha:v3];
  }
}

- (void)setReversesActionOrder:(BOOL)a3
{
  if (self->_reversesActionOrder != a3)
  {
    self->_reversesActionOrder = a3;
    id v4 = [(_UIContextMenuView *)self submenus];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45___UIContextMenuView_setReversesActionOrder___block_invoke;
    v5[3] = &unk_1E52DA980;
    v5[4] = self;
    [v4 enumerateNodes:v5];
  }
}

- (void)setHierarchyStyle:(unint64_t)a3
{
  if (self->_hierarchyStyle != a3)
  {
    self->_hierarchyStyle = a3;
    id v4 = (id)[objc_alloc((Class)objc_opt_class()) initWithMenuView:self];
    [(_UIContextMenuView *)self setLayout:v4];
  }
}

- (BOOL)kickstartActionScrubbingWithGesture:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UIContextMenuView *)self selectionGestureRecognizer];
  v6 = [v4 _activeEvents];
  if ([v6 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v7 = [(UIView *)self gestureRecognizers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ![v12 state]) {
            -[UIGestureRecognizer addTouchesFromGestureRecognizer:](v12, (id *)v4);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    if (![v5 state]) {
      -[UIGestureRecognizer transferTouchesFromGestureRecognizer:](v5, (id *)v4);
    }
  }
  BOOL v13 = [v5 state] > 0;

  return v13;
}

- (void)scrollToFirstSignificantAction
{
  id v2 = [(_UIContextMenuView *)self currentListView];
  [v2 scrollToFirstSignificantAction];
}

- (void)flashScrollIndicators
{
  id v3 = [(_UIContextMenuView *)self currentListView];
  id v2 = [v3 collectionView];
  [v2 flashScrollIndicators];
}

- (void)didCompleteMenuAppearanceAnimation
{
  [(_UIContextMenuView *)self flashScrollIndicators];
  id v3 = [(_UIContextMenuView *)self currentListView];
  [v3 didCompleteMenuAppearanceAnimation];
}

- (CGRect)activeSubmenuFrameInCoordinateSpace:(id)a3
{
  id v4 = a3;
  v5 = [(_UIContextMenuView *)self currentListView];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4, v7, v9, v11, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuView;
  [(UIView *)&v4 didMoveToWindow];
  if ([(_UIContextMenuView *)self wantsFocusDeferralIfSupported])
  {
    id v3 = [(UIView *)self _focusSystem];
    [v3 _startDeferringFocusIfSupported];

    [(_UIContextMenuView *)self setWantsFocusDeferralIfSupported:0];
  }
}

- (CGSize)preferredContentSizeWithinContainerSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[_UIContextMenuView setMaxContainerSize:](self, "setMaxContainerSize:");
  double v6 = [(_UIContextMenuView *)self submenus];
  double v7 = [v6 nodes];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    double v9 = [(_UIContextMenuView *)self currentListView];
    objc_msgSend(v9, "preferredContentSizeWithinContainerSize:", width, height);
    objc_msgSend(v9, "setNativeContentSize:");
    [v9 nativeContentSize];
  }
  else
  {
    [(_UIContextMenuView *)self setIsComputingPreferredSize:1];
    -[_UIContextMenuView setVisibleContentSize:](self, "setVisibleContentSize:", width, 44.0);
    [(UIView *)self setNeedsLayout];
    [(UIView *)self layoutIfNeeded];
    double v9 = [(_UIContextMenuView *)self layout];
    [v9 encompassingSize];
  }
  double v12 = v10;
  double v13 = v11;

  double v14 = v12;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (double)closestScrollTruncationDetentToHeight:(double)a3
{
  [(_UIContextMenuView *)self preferredScrollTruncationDetent];
  if (v5 <= 0.0)
  {
    double v7 = [(_UIContextMenuView *)self currentListView];
    [v7 closestScrollTruncationDetentToHeight:a3];
    double v9 = v8;

    [(_UIContextMenuView *)self setPreferredScrollTruncationDetent:v9];
    return v9;
  }
  else
  {
    [(_UIContextMenuView *)self preferredScrollTruncationDetent];
  }
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_UIContextMenuView;
  [(UIView *)&v5 layoutSubviews];
  id v3 = [(_UIContextMenuView *)self layout];
  BOOL v4 = [(_UIContextMenuView *)self isComputingPreferredSize];
  [(_UIContextMenuView *)self maxContainerSize];
  objc_msgSend(v3, "performLayoutForComputingPreferredContentSize:withMaxContainerSize:", v4);

  if ([(_UIContextMenuView *)self isComputingPreferredSize]) {
    [(_UIContextMenuView *)self setIsComputingPreferredSize:0];
  }
}

- (_UIContextMenuListView)currentListView
{
  id v2 = [(_UIContextMenuView *)self submenus];
  id v3 = [v2 current];
  BOOL v4 = [v3 listView];

  return (_UIContextMenuListView *)v4;
}

- (id)hoveredListView
{
  id v2 = [(_UIContextMenuView *)self hoveredNode];
  id v3 = [v2 listView];

  return v3;
}

- (NSArray)visibleMenus
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(_UIContextMenuView *)self submenus];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34___UIContextMenuView_visibleMenus__block_invoke;
  v7[3] = &unk_1E52DA980;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateNodes:v7];

  return (NSArray *)v5;
}

- (void)replaceVisibleMenu:(id)a3 withMenu:(id)a4 alongsideAnimations:(id)a5
{
}

- (void)displayMenu:(id)a3 updateType:(unint64_t)a4 alongsideAnimations:(id)a5
{
}

- (void)_displayMenu:(id)a3 inPlaceOfMenu:(id)a4 updateType:(unint64_t)a5 alongsideAnimations:(id)a6
{
  id v10 = a3;
  id v69 = a6;
  id v11 = a4;
  double v12 = [(_UIContextMenuView *)self submenus];
  double v13 = v12;
  if (v11) {
    id v14 = v11;
  }
  else {
    id v14 = v10;
  }
  double v15 = [v12 nodeForMenu:v14];

  if (a5 == 3)
  {
    id v16 = v15;
    [v16 setMenu:v10];
    double v17 = 0;
    goto LABEL_6;
  }
  v26 = [(_UIContextMenuView *)self departingNode];
  id v27 = [v26 menu];
  id v28 = v10;
  double v19 = v28;
  if (v27 == v28)
  {
  }
  else
  {
    if (!v28 || !v27)
    {

      if (v15) {
        goto LABEL_17;
      }
      goto LABEL_38;
    }
    char v29 = [v27 isEqual:v28];

    if ((v29 & 1) == 0)
    {
      if (v15)
      {
LABEL_17:
        id v16 = v15;
        uint64_t v30 = [(_UIContextMenuView *)self submenus];
        double v17 = [v30 popNode];

        v31 = [(_UIContextMenuView *)self departingNode];
        objc_super v32 = [v31 listView];
        [v32 removeFromSuperview];

        [(_UIContextMenuView *)self setDepartingNode:v17];
        v68 = 0;
        a5 = 2;
        goto LABEL_32;
      }
LABEL_38:
      v46 = [(_UIContextMenuView *)self submenus];
      double v17 = [v46 current];

      v47 = [(_UIContextMenuView *)self departingNode];
      v48 = [v47 listView];
      [v48 removeFromSuperview];

      [(_UIContextMenuView *)self setDepartingNode:0];
      id v16 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v33 = [(_UIContextMenuView *)self departingNode];
  v34 = [(_UIContextMenuView *)self submenus];
  double v17 = [v34 current];

  [(_UIContextMenuView *)self setDepartingNode:0];
  id v16 = 0;
  if (v33)
  {
    v68 = 0;
    unint64_t v20 = a5;
    id v16 = (id)v33;
LABEL_30:
    v39 = [(_UIContextMenuView *)self submenus];
    [v39 addNode:v16];

    goto LABEL_31;
  }
LABEL_6:
  double v18 = [(_UIContextMenuView *)self delegate];
  double v19 = [v18 contextMenuView:self willDisplayMenu:v10];

  if (v19)
  {
    unint64_t v20 = a5;
    if (([v19 metadata] & 0x1000000) != 0)
    {
LABEL_22:
      v68 = 0;
      if (a5 == 3)
      {
LABEL_31:
        a5 = v20;
        goto LABEL_32;
      }
      goto LABEL_23;
    }
  }
  double v21 = [(_UIContextMenuView *)self submenus];
  double v22 = [v21 first];

  if (v15 == v22)
  {
    unint64_t v20 = 5;
    goto LABEL_22;
  }
  if (!v15)
  {

    double v17 = 0;
    v68 = 0;
    goto LABEL_32;
  }
  double v23 = [(_UIContextMenuView *)self submenus];
  v68 = [v23 removeNode:v15];

  double v24 = [(_UIContextMenuView *)self submenus];
  uint64_t v25 = [v24 current];

  double v17 = 0;
  unint64_t v20 = 4;
  id v16 = (id)v25;
  if (a5 != 3)
  {
LABEL_23:
    if (!v16)
    {
      v35 = [(_UIContextMenuView *)self visibleMenus];
      uint64_t v36 = [v35 count];

      uint64_t v37 = 0;
      if (v20 != 3 && v36)
      {
        if ([(_UIContextMenuView *)self hierarchyStyle] == 1) {
          uint64_t v37 = 1;
        }
        else {
          uint64_t v37 = 2;
        }
      }
      id v16 = (id)objc_opt_new();
      id v38 = [(_UIContextMenuView *)self _newListViewWithMenu:v19 position:v37];
      [v16 setListView:v38];

      [v16 setMenu:v19];
    }
    goto LABEL_30;
  }
  a5 = 4;
  id v16 = (id)v25;
LABEL_32:
  v40 = [v16 listView];
  v41 = [v17 listView];
  BOOL v42 = [(_UIContextMenuView *)self retainHighlightOnMenuNavigation];
  [v41 setAllowsFocus:0];
  [v40 setAllowsFocus:1];
  if (a5 == 5 || v41 != v40)
  {
    switch(a5)
    {
      case 0uLL:
        v43 = [(UIView *)self traitCollection];
        objc_msgSend(v16, "setLeftOfParentWhenCascading:", objc_msgSend(v43, "layoutDirection") == 1);

        [(UIView *)self addSubview:v40];
        if (v69)
        {
          v44 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.4];
          v90[0] = MEMORY[0x1E4F143A8];
          v90[1] = 3221225472;
          v90[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke;
          v90[3] = &unk_1E52DA9A8;
          id v91 = v69;
          uint64_t v92 = 0;
          +[UIView _animateUsingSpringBehavior:v44 tracking:1 animations:v90 completion:0];

          v45 = v91;
          goto LABEL_47;
        }
        break;
      case 1uLL:
        v49 = [(_UIContextMenuView *)self layout];
        [v49 navigateDownFromNode:v17 toNode:v16 alongsideAnimations:v69 completion:0];
        goto LABEL_42;
      case 2uLL:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_3;
        aBlock[3] = &unk_1E52DA9D0;
        aBlock[4] = self;
        v49 = _Block_copy(aBlock);
        v50 = [(_UIContextMenuView *)self layout];
        [v50 navigateUpFromNode:v17 toNode:v16 alongsideAnimations:v69 completion:v49];

LABEL_42:
        break;
      case 3uLL:
        v65 = [v40 collectionView];
        v51 = [v40 highlightedIndexPath];
        uint64_t v52 = [v40 elementAtIndexPath:v51];

        [v40 willStartInPlaceMenuTransition];
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_4;
        v86[3] = &unk_1E52D9F98;
        id v53 = v40;
        id v87 = v53;
        id v88 = v19;
        +[UIView _performWithoutRetargetingAnimations:v86];
        v67 = (void *)v52;
        uint64_t v54 = [v53 indexPathForElement:v52];
        if (v54) {
          [v53 highlightItemAtIndexPath:v54];
        }
        v64 = objc_opt_new();
        [v64 setTrackingDampingRatio:1.0 response:0.4 dampingRatioSmoothing:1.0 responseSmoothing:1.0];
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_5;
        v81[3] = &unk_1E52DAA20;
        v81[4] = self;
        id v84 = v69;
        uint64_t v85 = 3;
        id v82 = v53;
        id v55 = v65;
        v66 = (void *)v54;
        id v56 = v55;
        id v83 = v55;
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_8;
        v78[3] = &unk_1E52DA9F8;
        id v79 = v55;
        id v80 = v82;
        id v57 = v56;
        +[UIView _animateUsingSpringBehavior:v64 tracking:1 animations:v81 completion:v78];

        v45 = v67;
        goto LABEL_47;
      case 4uLL:
        v58 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.32];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_9;
        v72[3] = &unk_1E52DAA20;
        id v76 = v69;
        uint64_t v77 = 4;
        id v73 = v40;
        id v74 = v68;
        v75 = self;
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_11;
        v70[3] = &unk_1E52DA9D0;
        id v71 = v74;
        +[UIView _animateUsingSpringBehavior:v58 tracking:0 animations:v72 completion:v70];

        v45 = v76;
LABEL_47:

        break;
      case 5uLL:
        if (v69) {
          (*((void (**)(id, uint64_t))v69 + 2))(v69, 5);
        }
        break;
      default:
        break;
    }
  }
  v59 = [(_UIContextMenuView *)self submenus];
  v60 = [v59 current];

  if (v60)
  {
    if (!v42)
    {
      v61 = [(UIView *)self _focusSystem];
      v62 = v61;
      if (v61) {
        [v61 _startDeferringFocusIfSupported];
      }
      else {
        [(_UIContextMenuView *)self setWantsFocusDeferralIfSupported:1];
      }
    }
    [(UIView *)self setNeedsFocusUpdate];
    [(_UIContextMenuView *)self setRetainHighlightOnMenuNavigation:0];
    v63 = [MEMORY[0x1E4F1C9C8] now];
    [(_UIContextMenuView *)self setAppearanceDate:v63];
  }
}

- (id)_newListViewWithMenu:(id)a3 position:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = ([v6 metadata] & 0x10000) != 0
    && [(_UIContextMenuView *)self hierarchyStyle] == 2;
  __int16 v8 = [v6 metadata];
  uint64_t v9 = [v6 metadata];
  id v10 = [(UIView *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];
  double v12 = _UIContextMenuGetPlatformMetrics(v11);
  [v12 defaultMenuWidth];
  double v14 = v13;
  int v15 = [v12 leadingIndentationContributesToWidth];
  double v16 = 0.0;
  double v17 = 0.0;
  if ((v8 & 0x100) != 0 && v15)
  {
    double v18 = _UIContextMenuGetPlatformMetrics(v11);
    [v18 leadingIndentationWidth];
    double v17 = v19;
  }
  double v20 = v14 + v17;
  if (v7)
  {
    double v21 = _UIContextMenuGetPlatformMetrics(v11);
    [v21 menuGutterWidth];
    double v16 = v22;
  }
  double v23 = v20 + v16;
  if ((v9 & 0x100000000) != 0)
  {
    [v12 largePaletteWidthExtension];
    double v23 = v23 + v24;
  }

  uint64_t v25 = -[_UIContextMenuListView initWithFrame:]([_UIContextMenuListView alloc], "initWithFrame:", 0.0, 0.0, v23, 44.0);
  BOOL v26 = [(_UIContextMenuView *)self showsShadow];
  double v27 = 1.0;
  if (!v26) {
    double v27 = 0.0;
  }
  [(_UIContextMenuListView *)v25 setShadowAlpha:v27];
  [(_UIContextMenuListView *)v25 setParentHierarchyStyle:[(_UIContextMenuView *)self hierarchyStyle]];
  [(_UIContextMenuListView *)v25 setPosition:a4];
  [(_UIContextMenuListView *)v25 setReversesActionOrder:[(_UIContextMenuView *)self reversesActionOrder]];
  [(_UIContextMenuView *)self visibleContentSize];
  -[_UIContextMenuListView setVisibleContentSize:](v25, "setVisibleContentSize:");
  id v28 = [(UIView *)self layer];
  [v28 anchorPoint];
  double v30 = v29;
  double v32 = v31;
  uint64_t v33 = [(UIView *)v25 layer];
  objc_msgSend(v33, "setAnchorPoint:", v30, v32);

  [(_UIContextMenuListView *)v25 setDisplayedMenu:v6];
  [(_UIContextMenuListView *)v25 setAllowsBackgroundViewInteraction:[(_UIContextMenuView *)self allowsBackgroundViewInteraction]];
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v34 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v36 = _UIInternalPreference_ClickUIDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
    {
      while (v34 >= v36)
      {
        _UIInternalPreferenceSync(v34, &_UIInternalPreference_ClickUIDebugEnabled, @"ClickUIDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v36 = _UIInternalPreference_ClickUIDebugEnabled;
        if (v34 == _UIInternalPreference_ClickUIDebugEnabled) {
          goto LABEL_16;
        }
      }
      if (byte_1E8FD4F1C)
      {
        uint64_t v37 = [(UIView *)v25 layer];
        [v37 setBorderWidth:1.0];

        id v38 = +[UIColor blueColor];
        uint64_t v39 = [v38 CGColor];
        v40 = [(UIView *)v25 layer];
        [v40 setBorderColor:v39];
      }
    }
  }
LABEL_16:

  return v25;
}

- (void)_updateSelectionGestureAllowableMovementForGestureBeginningAtIndexPath:(id)a3
{
  id v10 = a3;
  double v4 = 10.0;
  double v5 = 10.0;
  if ([(_UIContextMenuView *)self scrubbingEnabled])
  {
    id v6 = [(_UIContextMenuView *)self currentListView];
    [v6 selectionGestureAllowableMovementForGestureBeginningAtIndexPath:v10];
    double v4 = v7;
    double v5 = v8;
  }
  uint64_t v9 = [(_UIContextMenuView *)self selectionGestureRecognizer];
  objc_msgSend(v9, "setAllowableMovement:", v4, v5);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuView *)self selectionGestureRecognizer];

  if (v5 != v4) {
    goto LABEL_4;
  }
  [v4 locationInView:self];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = -[UIGestureRecognizer _activeTouchesEvent](v4);
  uint64_t v11 = -[_UIContextMenuView hitTest:withEvent:](self, "hitTest:withEvent:", v10, v7, v9);

  objc_opt_class();
  LOBYTE(v10) = objc_opt_isKindOfClass();

  if (v10) {
    BOOL v12 = 0;
  }
  else {
LABEL_4:
  }
    BOOL v12 = 1;

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIContextMenuView *)self selectionGestureRecognizer];

  if (v8 == v7)
  {
    uint64_t v10 = [v6 view];
    char v9 = [v10 isDescendantOfView:self];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIContextMenuView *)self selectionGestureRecognizer];

  if (v8 == v7)
  {
    id v10 = [(_UIContextMenuView *)self selectionDelayGestureRecognizer];

    if (v10 == v6)
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      uint64_t v11 = [(_UIContextMenuView *)self currentListView];
      BOOL v12 = [v11 collectionView];

      double v13 = [v6 view];
      double v14 = v13;
      if (v13 == v12 || ![v13 isDescendantOfView:v12]) {
        LOBYTE(v9) = 0;
      }
      else {
        int v9 = [v6 _isGestureType:9] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (void)_handleSelectionForElement:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuView *)self currentListView];
  id v6 = [v5 displayedMenu];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    id v8 = [(_UIContextMenuView *)self submenus];
    int v9 = [v8 current];
    id v10 = [v9 previous];
    uint64_t v11 = [v10 menu];

    id v4 = (id)v11;
  }
  if ([v4 _canBeHighlighted])
  {
    [(_UIContextMenuView *)self _performActionForElement:v4];
    if ([v4 _isLeaf])
    {
      if ([v4 keepsMenuPresented])
      {
        BOOL v12 = [(_UIContextMenuView *)self currentListView];
        double v13 = [v12 highlightedIndexPath];

        if (v13)
        {
          double v14 = (void *)MEMORY[0x1E4F1CB00];
          uint64_t v16 = MEMORY[0x1E4F143A8];
          uint64_t v17 = 3221225472;
          double v18 = __49___UIContextMenuView__handleSelectionForElement___block_invoke;
          double v19 = &unk_1E52DAA48;
          id v20 = v5;
          id v21 = v13;
          int v15 = [v14 scheduledTimerWithTimeInterval:0 repeats:&v16 block:0.1];
          -[_UIContextMenuView setAutoUnhighlightTimer:](self, "setAutoUnhighlightTimer:", v15, v16, v17, v18, v19);
        }
      }
    }
  }
}

- (void)_handleSelectionGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuView *)self currentListView];
  [v4 locationInView:v5];
  id v6 = objc_msgSend(v5, "indexPathForItemAtPoint:");
  uint64_t v7 = [v4 state];
  BOOL v8 = v7 != 1;
  if (v7 == 1)
  {
    int v9 = [(_UIContextMenuView *)self autoUnhighlightTimer];
    [v9 invalidate];

    [(_UIContextMenuView *)self setAutoUnhighlightTimer:0];
    [(_UIContextMenuView *)self _updateSelectionGestureAllowableMovementForGestureBeginningAtIndexPath:v6];
    id v10 = [(_UIContextMenuView *)self feedbackGenerator];
    [v4 locationInView:v5];
    objc_msgSend(v10, "userInteractionStartedAtLocation:");
  }
  uint64_t v11 = [v4 buttonMask];
  BOOL v12 = [v5 highlightedIndexPath];
  uint64_t v13 = [v4 state];
  if (v12)
  {
    BOOL v15 = v13 == 3 && v11 != 2;
    if ([v4 state] > 2)
    {
      if (v15)
      {
        BOOL v8 = 0;
        BOOL v15 = 1;
LABEL_20:
        double v23 = [(_UIContextMenuView *)self feedbackGenerator];
        [v4 locationInView:v5];
        objc_msgSend(v23, "userInteractionEndedAtLocation:");

        [(_UIContextMenuView *)self setUnselectableIndexPath:0];
        goto LABEL_22;
      }
LABEL_14:

      if (v11 != 2)
      {
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x3032000000;
        v43 = __Block_byref_object_copy__8;
        v44 = __Block_byref_object_dispose__8;
        id v45 = 0;
        uint64_t v16 = [(_UIContextMenuView *)self submenus];
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        int v36 = __46___UIContextMenuView__handleSelectionGesture___block_invoke;
        uint64_t v37 = &unk_1E52DAA70;
        id v38 = v4;
        uint64_t v39 = &v40;
        [v16 reverseEnumerateNodes:&v34];

        uint64_t v17 = (void *)v41[5];
        if (v17)
        {
          double v18 = [(_UIContextMenuView *)self currentListView];

          if (v17 != v18)
          {
            double v19 = [(_UIContextMenuView *)self submenus];
            id v20 = [v19 current];
            id v21 = [v20 previous];
            double v22 = [v21 menu];
            [(_UIContextMenuView *)self _performActionForElement:v22];
          }
        }

        _Block_object_dispose(&v40, 8);
      }
      BOOL v15 = 0;
      id v6 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    if (v13 > 2) {
      goto LABEL_14;
    }
    BOOL v15 = 0;
  }
LABEL_22:
  double v24 = [(_UIContextMenuView *)self currentListView];

  if (v5 == v24)
  {
    uint64_t v25 = [v4 _allActiveTouches];
    BOOL v26 = [v25 anyObject];
    BOOL v27 = [(_UIContextMenuView *)self _touchSupportsAutoNavigation:v26];

    [v4 locationInView:v5];
    -[_UIContextMenuView _setHighlightedIndexPath:playFeedback:atLocation:allowAutoNavigation:](self, "_setHighlightedIndexPath:playFeedback:atLocation:allowAutoNavigation:", v6, v8, v27);
    if (!v15) {
      goto LABEL_30;
    }
  }
  else if (!v15)
  {
    goto LABEL_30;
  }
  id v28 = [v5 elementAtIndexPath:v12];
  uint64_t v29 = -[UIGestureRecognizer _activeTouchesEvent](v4);
  if (v29)
  {
    double v30 = (void *)v29;
    int v31 = [v28 _acceptBoolMenuVisit:0 commandVisit:&__block_literal_global_12 actionVisit:&__block_literal_global_98];

    if (v31)
    {
      double v32 = -[UIGestureRecognizer _activeTouchesEvent](v4);
      uint64_t v33 = [v32 _authenticationMessage];
      +[UIPasteboard _attemptAuthenticationWithMessage:v33];
    }
  }
  [(_UIContextMenuView *)self _handleSelectionForElement:v28];

LABEL_30:
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 state] > 2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v5 = [(_UIContextMenuView *)self autoUnhighlightTimer];
    [v5 invalidate];

    [(_UIContextMenuView *)self setAutoUnhighlightTimer:0];
    id v6 = [(_UIContextMenuView *)self currentListView];
    [v4 locationInView:v6];
    uint64_t v7 = objc_msgSend(v6, "indexPathForItemAtPoint:");
    BOOL v8 = [(_UIContextMenuView *)self hoverVelocityIntegrator];

    if (!v8)
    {
      int v9 = objc_opt_new();
      [(_UIContextMenuView *)self setHoverVelocityIntegrator:v9];

      id v10 = [(_UIContextMenuView *)self hoverVelocityIntegrator];
      [v10 setMinimumRequiredMovement:1.0];
    }
    uint64_t v11 = [(_UIContextMenuView *)self hoverVelocityIntegrator];
    [v4 locationInView:self];
    objc_msgSend(v11, "addSample:");
  }
  if ([(_UIContextMenuView *)self hierarchyStyle] == 2)
  {
    BOOL v12 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.4];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    double v18 = __52___UIContextMenuView__handleHoverGestureRecognizer___block_invoke;
    double v19 = &unk_1E52D9F98;
    id v20 = v4;
    id v21 = self;
    +[UIView _animateUsingSpringBehavior:v12 tracking:0 animations:&v16 completion:0];
  }
  uint64_t v13 = objc_msgSend(v4, "_allActiveTouches", v16, v17, v18, v19);
  double v14 = [v13 anyObject];
  BOOL v15 = [(_UIContextMenuView *)self _touchSupportsAutoNavigation:v14];

  [v4 locationInView:self];
  -[_UIContextMenuView _setHighlightedIndexPath:playFeedback:atLocation:allowAutoNavigation:](self, "_setHighlightedIndexPath:playFeedback:atLocation:allowAutoNavigation:", v7, 0, v15);
}

- (void)_setHighlightedIndexPath:(id)a3 playFeedback:(BOOL)a4 atLocation:(CGPoint)a5 allowAutoNavigation:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  BOOL v9 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  BOOL v12 = [(_UIContextMenuView *)self currentListView];
  uint64_t v13 = [v12 highlightedIndexPath];
  double v14 = [(_UIContextMenuView *)self selectionGestureRecognizer];
  uint64_t v15 = [v14 numberOfTouches];

  if ((((v15 != 0) ^ [(_UIContextMenuView *)self hasTrackingTouch]) & 1) != 0
    || ([v11 isEqual:v13] & 1) == 0
    && ([(_UIContextMenuView *)self unselectableIndexPath],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v11 isEqual:v16],
        v16,
        (v17 & 1) == 0))
  {
    [(_UIContextMenuView *)self setHasTrackingTouch:v15 != 0];
    [(_UIContextMenuView *)self _clearAutoNavigationTimer];
    [(_UIContextMenuView *)self setUnselectableIndexPath:0];
    if (v13) {
      [v12 unHighlightItemAtIndexPath:v13];
    }
    if (v11)
    {
      double v18 = [v12 elementAtIndexPath:v11];
    }
    else
    {
      double v18 = 0;
    }
    if ([v18 _canBeHighlighted])
    {
      BOOL v30 = v9;
      double v19 = [v18 image];
      id v20 = _UIImageName(v19);
      int v21 = [v20 isEqualToString:@"doc.on.clipboard"];

      if (v21)
      {
        double v22 = [(_UIContextMenuView *)self appearanceDate];
        _UIPasteboardAnalyticsReportEvent(@"ContextMenu", v22);
      }
      BOOL v23 = v30;
      if (v6 && (v15 || [(_UIContextMenuView *)self hierarchyStyle] == 2))
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        double v24 = [(_UIContextMenuView *)self highlightHoverGestureRecognizer];
        uint64_t v25 = [v24 _allActiveTouches];

        uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v32 != v27) {
                objc_enumerationMutation(v25);
              }
              if ([*(id *)(*((void *)&v31 + 1) + 8 * i) _isPointerTouch])
              {
                uint64_t v26 = 1;
                goto LABEL_25;
              }
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v35 count:16];
            if (v26) {
              continue;
            }
            break;
          }
LABEL_25:
          BOOL v23 = v30;
        }

        [(_UIContextMenuView *)self _setAutoNavigationTimerIfNecessaryForElement:v18 isTrackpadHover:v26];
      }
      [v12 highlightItemAtIndexPath:v11 forHover:v15 == 0 playFeedback:1];
      if (v23)
      {
        uint64_t v29 = [(_UIContextMenuView *)self feedbackGenerator];
        objc_msgSend(v29, "selectionChangedAtLocation:", x, y);
      }
    }
  }
}

- (BOOL)_touchSupportsAutoNavigation:(id)a3
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = __Block_byref_object_copy__8;
  BOOL v23 = __Block_byref_object_dispose__8;
  id v24 = 0;
  [(UIView *)self bounds];
  v26.double x = x;
  v26.double y = y;
  if (CGRectContainsPoint(v27, v26))
  {
    v18.receiver = self;
    v18.super_class = (Class)_UIContextMenuView;
    uint64_t v8 = -[UIView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    BOOL v9 = (void *)v20[5];
    v20[5] = v8;
  }
  else
  {
    id v10 = [(_UIContextMenuView *)self submenus];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40___UIContextMenuView_hitTest_withEvent___block_invoke;
    v13[3] = &unk_1E52DAAD8;
    double v16 = x;
    double v17 = y;
    v13[4] = self;
    uint64_t v15 = &v19;
    id v14 = v7;
    [v10 reverseEnumerateNodes:v13];
  }
  id v11 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (void)_setAutoNavigationTimerIfNecessaryForElement:(id)a3 isTrackpadHover:(BOOL)a4
{
  id v5 = a3;
  if (([v5 _isLeaf] & 1) == 0)
  {
    objc_initWeak(&location, self);
    if ([(_UIContextMenuView *)self hierarchyStyle] == 1) {
      double v6 = 0.5;
    }
    else {
      double v6 = 0.1;
    }
    id v7 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __83___UIContextMenuView__setAutoNavigationTimerIfNecessaryForElement_isTrackpadHover___block_invoke;
    BOOL v12 = &unk_1E52DAB00;
    objc_copyWeak(&v15, &location);
    id v13 = v5;
    id v14 = self;
    uint64_t v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:&v9 block:v6];
    -[_UIContextMenuView setAutoNavigationTimer:](self, "setAutoNavigationTimer:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)_clearAutoNavigationTimer
{
  id v3 = [(_UIContextMenuView *)self autoNavigationTimer];
  [v3 invalidate];

  [(_UIContextMenuView *)self setAutoNavigationTimer:0];
}

- (void)_setHoverAutoExitTimer
{
  objc_initWeak(&location, self);
  id v3 = [(_UIContextMenuView *)self hoverAutoExitTimer];

  if (!v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __44___UIContextMenuView__setHoverAutoExitTimer__block_invoke;
    uint64_t v9 = &unk_1E52DAB28;
    objc_copyWeak(&v10, &location);
    id v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:&v6 block:0.1];
    -[_UIContextMenuView setHoverAutoExitTimer:](self, "setHoverAutoExitTimer:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

- (void)_clearHoverAutoExitTimer
{
  id v3 = [(_UIContextMenuView *)self hoverAutoExitTimer];
  [v3 invalidate];

  [(_UIContextMenuView *)self setHoverAutoExitTimer:0];
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(_UIContextMenuView *)self currentListView];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_allowsChangingFirstResponderForFocusUpdateWithContext:(id)a3
{
  return 0;
}

- (id)keyCommands
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v2 = __33___UIContextMenuView_keyCommands__block_invoke(@"UIKeyInputEscape", (uint64_t)sel__handleEscapeKey_);
  v7[0] = v2;
  id v3 = __33___UIContextMenuView_keyCommands__block_invoke(@"UIKeyInputLeftArrow", (uint64_t)sel__handleLeftArrowKey_);
  v7[1] = v3;
  id v4 = __33___UIContextMenuView_keyCommands__block_invoke(@"UIKeyInputRightArrow", (uint64_t)sel__handleRightArrowKey_);
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel__handleLeftArrowKey_ == a3)
  {
    uint64_t v8 = [(_UIContextMenuView *)self submenus];
    uint64_t v9 = [v8 current];
    if ([v9 leftOfParentWhenCascading])
    {
      unsigned __int8 v7 = 0;
    }
    else
    {
      id v13 = [(_UIContextMenuView *)self submenus];
      id v14 = [v13 current];
      id v15 = [(_UIContextMenuView *)self submenus];
      double v16 = [v15 first];
      unsigned __int8 v7 = v14 != v16;
    }
    goto LABEL_16;
  }
  if (sel__handleRightArrowKey_ == a3)
  {
    id v10 = [(_UIContextMenuView *)self currentListView];
    uint64_t v8 = [v10 highlightedIndexPath];

    if (!v8)
    {
      unsigned __int8 v7 = 0;
LABEL_17:

      goto LABEL_18;
    }
    id v11 = [(_UIContextMenuView *)self currentListView];
    uint64_t v9 = [v11 elementAtIndexPath:v8];

    if ([v9 _isLeaf])
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      double v17 = [(_UIContextMenuView *)self currentListView];
      objc_super v18 = [v17 displayedMenu];
      int v12 = [v9 isEqual:v18] ^ 1;
    }
    uint64_t v19 = [(_UIContextMenuView *)self submenus];
    id v20 = [v19 current];
    if ([v20 leftOfParentWhenCascading])
    {
      uint64_t v21 = [(_UIContextMenuView *)self submenus];
      double v22 = [v21 current];
      BOOL v23 = [(_UIContextMenuView *)self submenus];
      id v24 = [v23 first];
      BOOL v25 = v22 != v24;
    }
    else
    {
      BOOL v25 = 0;
    }

    unsigned __int8 v7 = v12 | v25;
LABEL_16:

    goto LABEL_17;
  }
  v27.receiver = self;
  v27.super_class = (Class)_UIContextMenuView;
  unsigned __int8 v7 = [(UIView *)&v27 canPerformAction:a3 withSender:v6];
LABEL_18:

  return v7;
}

- (void)_handleEscapeKey:(id)a3
{
  id v4 = [(_UIContextMenuView *)self delegate];
  [v4 didSelectCancelActionInContextMenuView:self];
}

- (void)_selectPreviousMenuIfPossible
{
  id v3 = [(_UIContextMenuView *)self submenus];
  id v4 = [v3 current];
  id v5 = [(_UIContextMenuView *)self submenus];
  id v6 = [v5 first];

  if (v4 != v6)
  {
    unsigned __int8 v7 = [(_UIContextMenuView *)self submenus];
    uint64_t v8 = [v7 current];
    uint64_t v9 = [v8 previous];
    id v10 = [v9 menu];

    [(_UIContextMenuView *)self setRetainHighlightOnMenuNavigation:1];
    [(_UIContextMenuView *)self _handleSelectionForElement:v10];
  }
}

- (void)_handleRightArrowKey:(id)a3
{
  id v4 = [(_UIContextMenuView *)self currentListView];
  id v16 = [v4 highlightedIndexPath];

  id v5 = v16;
  if (v16)
  {
    id v6 = [(_UIContextMenuView *)self currentListView];
    unsigned __int8 v7 = [v6 elementAtIndexPath:v16];

    if (([v7 _isLeaf] & 1) != 0
      || ([(_UIContextMenuView *)self currentListView],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          [v8 displayedMenu],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v7 isEqual:v9],
          v9,
          v8,
          (v10 & 1) != 0))
    {
      id v11 = [(_UIContextMenuView *)self submenus];
      int v12 = [v11 current];
      int v13 = [v12 leftOfParentWhenCascading];

      if (v13) {
        [(_UIContextMenuView *)self _selectPreviousMenuIfPossible];
      }
    }
    else
    {
      id v14 = [(_UIContextMenuView *)self currentListView];
      id v15 = [v14 elementAtIndexPath:v16];

      [(_UIContextMenuView *)self setRetainHighlightOnMenuNavigation:1];
      [(_UIContextMenuView *)self _handleSelectionForElement:v15];
    }
    id v5 = v16;
  }
}

- (void)_handleMenuPressGesture:(id)a3
{
  id v4 = [(_UIContextMenuView *)self delegate];
  [v4 didSelectCancelActionInContextMenuView:self];
}

- (void)_handleSelectPressGesture:(id)a3
{
  id v4 = [(_UIContextMenuView *)self currentListView];
  id v7 = [v4 highlightedIndexPath];

  if (v7)
  {
    id v5 = [(_UIContextMenuView *)self currentListView];
    id v6 = [v5 elementAtIndexPath:v7];

    [(_UIContextMenuView *)self setRetainHighlightOnMenuNavigation:1];
    [(_UIContextMenuView *)self _handleSelectionForElement:v6];
  }
}

- (void)_performActionForElement:(id)a3
{
  id v4 = a3;
  [(_UIContextMenuView *)self _clearAutoNavigationTimer];
  [(_UIContextMenuView *)self setUnselectableIndexPath:0];
  id v5 = [(_UIContextMenuView *)self delegate];
  [v5 contextMenuView:self didSelectElement:v4];
}

- (CGRect)_rectOfNodeParentElement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 previous];
  id v6 = [v5 listView];
  id v7 = [v4 menu];

  uint64_t v8 = [v6 cellForElement:v7];

  uint64_t v9 = [v8 window];

  if (v9)
  {
    char v10 = [v8 superview];
    [v8 frame];
    objc_msgSend(v10, "convertRect:toView:", self);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB20];
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)_testing_tapAnAction
{
  id v3 = [(_UIContextMenuView *)self currentListView];
  id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  id v6 = [v3 elementAtIndexPath:v4];

  id v5 = v6;
  if (v6)
  {
    [(_UIContextMenuView *)self _performActionForElement:v6];
    id v5 = v6;
  }
}

- (_UIContextMenuViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIContextMenuViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsShadow
{
  return self->_showsShadow;
}

- (BOOL)reversesActionOrder
{
  return self->_reversesActionOrder;
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  self->_scrubbingEnabled = a3;
}

- (BOOL)allowsBackgroundViewInteraction
{
  return self->_allowsBackgroundViewInteraction;
}

- (void)setAllowsBackgroundViewInteraction:(BOOL)a3
{
  self->_allowsBackgroundViewInteraction = a3;
}

- (CGSize)visibleContentSize
{
  double width = self->_visibleContentSize.width;
  double height = self->_visibleContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setVisibleContentSize:(CGSize)a3
{
  self->_visibleContentSize = a3;
}

- (unint64_t)hierarchyStyle
{
  return self->_hierarchyStyle;
}

- (unint64_t)attachmentEdge
{
  return self->_attachmentEdge;
}

- (void)setAttachmentEdge:(unint64_t)a3
{
  self->_attachmentEdge = a3;
}

- (_UIContextMenuNode)departingNode
{
  return self->_departingNode;
}

- (void)setDepartingNode:(id)a3
{
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return self->_collectionViewDataSource;
}

- (void)setCollectionViewDataSource:(id)a3
{
}

- (_UIContinuousSelectionGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (void)setSelectionGestureRecognizer:(id)a3
{
}

- (_UIContextMenuSelectionDelayGestureRecognizer)selectionDelayGestureRecognizer
{
  return self->_selectionDelayGestureRecognizer;
}

- (void)setSelectionDelayGestureRecognizer:(id)a3
{
}

- (NSDate)appearanceDate
{
  return self->_appearanceDate;
}

- (void)setAppearanceDate:(id)a3
{
}

- (UIHoverGestureRecognizer)highlightHoverGestureRecognizer
{
  return self->_highlightHoverGestureRecognizer;
}

- (void)setHighlightHoverGestureRecognizer:(id)a3
{
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (_UIContextMenuLinkedList)submenus
{
  return self->_submenus;
}

- (void)setSubmenus:(id)a3
{
}

- (BOOL)isComputingPreferredSize
{
  return self->_isComputingPreferredSize;
}

- (void)setIsComputingPreferredSize:(BOOL)a3
{
  self->_isComputingPreferredSize = a3;
}

- (BOOL)retainHighlightOnMenuNavigation
{
  return self->_retainHighlightOnMenuNavigation;
}

- (void)setRetainHighlightOnMenuNavigation:(BOOL)a3
{
  self->_retainHighlightOnMenuNavigation = a3;
}

- (BOOL)shouldAvoidInputViews
{
  return self->_shouldAvoidInputViews;
}

- (void)setShouldAvoidInputViews:(BOOL)a3
{
  self->_shouldAvoidInputViews = a3;
}

- (NSTimer)autoNavigationTimer
{
  return self->_autoNavigationTimer;
}

- (void)setAutoNavigationTimer:(id)a3
{
}

- (NSTimer)autoUnhighlightTimer
{
  return self->_autoUnhighlightTimer;
}

- (void)setAutoUnhighlightTimer:(id)a3
{
}

- (NSIndexPath)unselectableIndexPath
{
  return self->_unselectableIndexPath;
}

- (void)setUnselectableIndexPath:(id)a3
{
}

- (BOOL)hasTrackingTouch
{
  return self->_hasTrackingTouch;
}

- (void)setHasTrackingTouch:(BOOL)a3
{
  self->_hasTrackingTouch = a3;
}

- (CGSize)maxContainerSize
{
  double width = self->_maxContainerSize.width;
  double height = self->_maxContainerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxContainerSize:(CGSize)a3
{
  self->_maxContainerSize = a3;
}

- (_UIContextMenuHierarchyLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (_UIContextMenuNode)hoveredNode
{
  return self->_hoveredNode;
}

- (void)setHoveredNode:(id)a3
{
}

- (_UIVelocityIntegrator)hoverVelocityIntegrator
{
  return self->_hoverVelocityIntegrator;
}

- (void)setHoverVelocityIntegrator:(id)a3
{
}

- (NSTimer)hoverAutoExitTimer
{
  return self->_hoverAutoExitTimer;
}

- (void)setHoverAutoExitTimer:(id)a3
{
}

- (double)preferredScrollTruncationDetent
{
  return self->_preferredScrollTruncationDetent;
}

- (void)setPreferredScrollTruncationDetent:(double)a3
{
  self->_preferredScrollTruncationDetent = a3;
}

- (BOOL)wantsFocusDeferralIfSupported
{
  return self->_wantsFocusDeferralIfSupported;
}

- (void)setWantsFocusDeferralIfSupported:(BOOL)a3
{
  self->_wantsFocusDeferralIfSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverAutoExitTimer, 0);
  objc_storeStrong((id *)&self->_hoverVelocityIntegrator, 0);
  objc_storeStrong((id *)&self->_hoveredNode, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_unselectableIndexPath, 0);
  objc_storeStrong((id *)&self->_autoUnhighlightTimer, 0);
  objc_storeStrong((id *)&self->_autoNavigationTimer, 0);
  objc_storeStrong((id *)&self->_submenus, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_highlightHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_appearanceDate, 0);
  objc_storeStrong((id *)&self->_selectionDelayGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_departingNode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end