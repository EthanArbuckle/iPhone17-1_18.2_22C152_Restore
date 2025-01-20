@interface UISwipeOccurrence
- ($A7B7FA971CD029BAA4A09478E9E1AEDA)prepareWithSwipeDirection:(SEL)a3 configuration:(unint64_t)a4;
- ($B18736ADBBD355D2E16F2B3CA0B0347D)currentSwipeInfo;
- (BOOL)_didReloadData;
- (BOOL)_hasAmbiguousIndexPath;
- (BOOL)_isSwipeDirectionExposingLeadingEdgePullView:(unint64_t)a3;
- (BOOL)active;
- (BOOL)shouldDismissWithTouchLocation:(CGPoint)a3;
- (BOOL)swipedViewMaskWasRemoved;
- (CGRect)_frameForPullView:(id)a3 inSwipedItem:(id)a4 withContainer:(id)a5;
- (CGRect)swipedViewRestingFrame;
- (NSIndexPath)indexPath;
- (NSString)description;
- (UIContextualAction)currentAction;
- (UIEdgeInsets)extraInsets;
- (UISwipeOccurrence)initWithController:(id)a3 indexPath:(id)a4 defaultStyle:(unint64_t)a5;
- (_UISwipedView)swipedView;
- (double)_extraOffsetForOffset:(double)a3 withDirection:(unint64_t)a4;
- (double)confirmationDistanceForPrimaryActionInSwipeActionPullView:(id)a3;
- (double)offset;
- (double)velocity;
- (id)_actionView;
- (id)_pullViewForLeadingEdge:(BOOL)a3;
- (id)_pullViewForSwipeDirection:(unint64_t)a3;
- (id)lockActionViewForAnimation;
- (int64_t)_styleFromConfiguration;
- (int64_t)direction;
- (int64_t)state;
- (unint64_t)_style;
- (unint64_t)_styleForConfiguration:(id)a3;
- (unint64_t)_swipeDirectionForPullView:(id)a3;
- (unint64_t)configuredDirection;
- (void)_executeLifecycleForPerformedAction:(id)a3 sourceView:(id)a4 completionHandler:(id)a5;
- (void)_forceTeardown;
- (void)_freezeSwipedViewInsets;
- (void)_moveItemWithSwipeInfo:(id *)a3 alongsideAnimations:(id)a4 completion:(id)a5;
- (void)_performSwipeAction:(id)a3 inPullView:(id)a4 swipeInfo:(id *)a5;
- (void)_removeAndResetPullViewImmediately:(id)a3;
- (void)_resetItemWithSwipeInfo:(id *)a3 animated:(BOOL)a4 deletion:(BOOL)a5 completion:(id)a6;
- (void)_setDidReloadData;
- (void)_setHasAmbiguousIndexPath;
- (void)_transitionToState:(int64_t)a3;
- (void)_unfreezeSwipedViewInsets;
- (void)_updateLayoutUsingCurrentSwipeInfo:(BOOL)a3;
- (void)_updatePullView:(id)a3;
- (void)_updateSwipedStateOnSwipedView:(BOOL)a3;
- (void)beginSwipeTracking:(BOOL)a3;
- (void)endSwipe;
- (void)performPrimaryActionWithSwipeInfo:(id *)a3;
- (void)resetAnimated:(BOOL)a3 completion:(id)a4;
- (void)resetForReconfiguration;
- (void)resetWhilePreparing;
- (void)setActive:(BOOL)a3;
- (void)setConfiguredDirection:(unint64_t)a3;
- (void)setCurrentAction:(id)a3;
- (void)setCurrentSwipeInfo:(id *)a3;
- (void)setExtraInsets:(UIEdgeInsets)a3;
- (void)setIndexPath:(id)a3;
- (void)setOffset:(double)a3;
- (void)setSwipedView:(id)a3;
- (void)setSwipedViewMaskWasRemoved:(BOOL)a3;
- (void)setupManipulatorWithController:(id)a3;
- (void)swipeActionPullView:(id)a3 tappedAction:(id)a4;
- (void)unlockActionViewForAnimation:(id)a3;
- (void)updateLayout;
- (void)updateOffsetWithSwipeInfo:(id *)a3 isTracking:(BOOL)a4 completion:(id)a5;
- (void)updateSwipedView;
@end

@implementation UISwipeOccurrence

- (UISwipeOccurrence)initWithController:(id)a3 indexPath:(id)a4 defaultStyle:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"UISwipeOccurrence.m" lineNumber:111 description:@"Index path must not be nil"];
  }
  v16.receiver = self;
  v16.super_class = (Class)UISwipeOccurrence;
  v11 = [(UISwipeOccurrence *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_controller, v9);
    [(UISwipeOccurrence *)v12 setIndexPath:v10];
    v12->_defaultStyle = a5;
    if ([v9 _prefersRTL]) {
      char v13 = 16;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&v12->_flags = *(unsigned char *)&v12->_flags & 0xEF | v13;
    [(UISwipeOccurrence *)v12 setupManipulatorWithController:v9];
    [(UISwipeOccurrence *)v12 updateSwipedView];
  }

  return v12;
}

- (void)setupManipulatorWithController:(id)a3
{
  id v9 = a3;
  v4 = [v9 _internalSwipeActionHost];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || ([v9 _internalSwipeActionHost],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 swipeViewManipulatorForSwipeActionController:v9],
        v7 = (_UIDefaultSwipeViewManipulator *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v7 = objc_alloc_init(_UIDefaultSwipeViewManipulator);
  }
  manipulator = self->_manipulator;
  self->_manipulator = (_UISwipeViewManipulator *)v7;
}

- (unint64_t)_styleForConfiguration:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 _swipeActionsStyle];
    p_defaultStyle = (unint64_t *)((char *)&unk_186B9D2B8 + 8 * v6 - 8);
    if ((unint64_t)(v6 - 1) >= 3) {
      p_defaultStyle = &self->_defaultStyle;
    }
  }
  else
  {
    p_defaultStyle = &self->_defaultStyle;
  }
  unint64_t v8 = *p_defaultStyle;

  return v8;
}

- ($A7B7FA971CD029BAA4A09478E9E1AEDA)prepareWithSwipeDirection:(SEL)a3 configuration:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (a4)
  {
    self->_direction = a4 == 2;
    self->_style = [(UISwipeOccurrence *)self _styleForConfiguration:v9];
    if (v9) {
      [v9 _roundedStyleCornerRadius];
    }
    else {
      double v10 = 0.0;
    }
    self->_roundedStyleCornerRadius = v10;
    v15 = [(UISwipeOccurrence *)self _pullViewForSwipeDirection:a4];
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var3 = 0u;
    [(UISwipeOccurrence *)self _removeAndResetPullViewImmediately:self->_leadingPullView];
    [(UISwipeOccurrence *)self _removeAndResetPullViewImmediately:self->_trailingPullView];
    self->_configuredDirection = 0;
    objc_super v16 = [v9 actions];
    if ([v16 count])
    {
      objc_msgSend(v15, "setAutosizesButtons:", objc_msgSend(v9, "_autosizesButtons"));
      [v15 configureWithSwipeActions:v16];
      if (self->_swipedView)
      {
        SEL v37 = a3;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        v18 = [WeakRetained _internalSwipeActionHost];
        char v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) == 0)
        {
          v25 = [(_UISwipedView *)self->_swipedView superview];
          [v25 addSubview:v15];
          goto LABEL_18;
        }
        id v20 = objc_loadWeakRetained((id *)&self->_controller);
        v21 = [v20 _internalSwipeActionHost];
        id v22 = objc_loadWeakRetained((id *)&self->_controller);
        int v23 = [v21 swipeActionController:v22 insertActionsView:v15 forItemAtIndexPath:self->_indexPath];

        if (v23)
        {
          v24 = [v15 superview];

          if (v24)
          {
LABEL_19:
            v29 = [v15 primarySwipeAction];
            if ([v9 performsFirstActionWithFullSwipe])
            {
              v30 = [v29 _menu];
              BOOL v31 = v30 == 0;
            }
            else
            {
              BOOL v31 = 0;
            }
            char v32 = [v29 isDestructive];
            [v15 openThreshold];
            double v34 = v33;
            [v15 confirmationThreshold];
            retstr->var0 = a4;
            retstr->var1 = v32;
            retstr->var2 = v31;
            *(_DWORD *)(&retstr->var2 + 1) = 0;
            *(_WORD *)(&retstr->var2 + 5) = 0;
            retstr->var3 = v34;
            retstr->var4 = v35;
            self->_configuredDirection = a4;
            self->_styleFromConfiguration = [v9 _swipeActionsStyle];
            [(UISwipeOccurrence *)self _updatePullView:v15];
            [(UISwipeOccurrence *)self setActive:1];
            [(UISwipeOccurrence *)self _updateSwipedStateOnSwipedView:1];
            if ([(_UISwipedView *)self->_swipedView isUserInteractionEnabled])
            {
              [(_UISwipedView *)self->_swipedView _resignIfContainsFirstResponder];
              if ([(UISwipeOccurrence *)self active])
              {
                *(unsigned char *)&self->_flags |= 8u;
                [(_UISwipedView *)self->_swipedView setUserInteractionEnabled:0];
              }
            }

            if (![(UISwipeOccurrence *)self active])
            {
              [(UISwipeOccurrence *)self _removeAndResetPullViewImmediately:v15];
              self->_styleFromConfiguration = 0;
            }
            goto LABEL_27;
          }
          v25 = [MEMORY[0x1E4F28B00] currentHandler];
          v26 = NSStringFromSelector(sel_swipeActionController_insertActionsView_forItemAtIndexPath_);
          id v27 = objc_loadWeakRetained((id *)&self->_controller);
          v28 = [v27 swipeActionHost];
          [v25 handleFailureInMethod:v37, self, @"UISwipeOccurrence.m", 187, @"Actions view not added to view hierarchy after calling -%@ on %@", v26, v28 object file lineNumber description];

LABEL_18:
          goto LABEL_19;
        }
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v12 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    char v13 = NSStringFromSelector(a3);
    v14 = NSStringFromUISwipeDirection(0);
    *(_DWORD *)buf = 138412546;
    v39 = v13;
    __int16 v40 = 2112;
    v41 = v14;
    _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: -%@ was called with a swipe direction of %@.", buf, 0x16u);
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &prepareWithSwipeDirection_configuration____s_category) + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    char v13 = NSStringFromSelector(a3);
    v14 = NSStringFromUISwipeDirection(0);
    *(_DWORD *)buf = 138412546;
    v39 = v13;
    __int16 v40 = 2112;
    v41 = v14;
    _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: -%@ was called with a swipe direction of %@.", buf, 0x16u);
    goto LABEL_7;
  }
LABEL_9:
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
LABEL_28:

  return result;
}

- (void)resetWhilePreparing
{
}

- (void)setOffset:(double)a3
{
  if (self->_state == 2)
  {
    BOOL v5 = 1;
  }
  else
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UISwipeOccurrence.m" lineNumber:256 description:@"Manually modifyng the offset is only allowed while in .tracking state."];

    BOOL v5 = self->_state == 2;
  }
  long long v9 = *(_OWORD *)&self->_currentSwipeInfo.direction;
  *(_DWORD *)v11 = *(_DWORD *)(&self->_currentSwipeInfo.animated + 1);
  *(_DWORD *)&v11[3] = *((_DWORD *)&self->_currentSwipeInfo.animated + 1);
  double springStiffness = self->_currentSwipeInfo.springStiffness;
  char v10 = 0;
  double v12 = a3;
  uint64_t v13 = 0;
  double v14 = springStiffness;
  [(UISwipeOccurrence *)self updateOffsetWithSwipeInfo:&v9 isTracking:v5 completion:0];
}

- (double)velocity
{
  return self->_currentSwipeInfo.initialSpringVelocity;
}

- (void)beginSwipeTracking:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_swipedView)
  {
    if (objc_opt_respondsToSelector()) {
      [(_UISwipeViewManipulator *)self->_manipulator removeAnimationsFromSwipedView:self->_swipedView atIndexPath:self->_indexPath];
    }
    [(UISwipeOccurrence *)self _freezeSwipedViewInsets];
  }
  [(UISwipeActionPullView *)self->_leadingPullView freeze];
  [(UISwipeActionPullView *)self->_trailingPullView freeze];
  if (v3)
  {
    [(UISwipeOccurrence *)self _transitionToState:2];
  }
}

- (void)_forceTeardown
{
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    *(unsigned char *)&self->_flags |= 2u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [WeakRetained swipeOccurrence:self willFinishWithDeletion:0];
  }
  [(UISwipeOccurrence *)self endSwipe];
  self->_styleFromConfiguration = 0;
}

- (void)endSwipe
{
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    [(UISwipeOccurrence *)self _unfreezeSwipedViewInsets];
    *(_OWORD *)&self->_currentSwipeInfo.initialSpringVelocity = 0u;
    *(_OWORD *)&self->_currentSwipeInfo.animated = 0u;
    *(_OWORD *)&self->_currentSwipeInfo.direction = 0u;
    *(unsigned char *)&self->_flags |= 4u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [WeakRetained swipeOccurrenceDidFinish:self];
  }
}

- (void)updateOffsetWithSwipeInfo:(id *)a3 isTracking:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  if (a3->var3 != 0.0 || a4)
  {
    long long v13 = *(_OWORD *)&a3->var2;
    long long v14 = *(_OWORD *)&a3->var0;
    long long v15 = v13;
    long long v16 = *(_OWORD *)&a3->var4;
    [(UISwipeOccurrence *)self _moveItemWithSwipeInfo:&v14 alongsideAnimations:0 completion:v8];
    if (a4)
    {
      uint64_t v12 = 2;
      goto LABEL_7;
    }
  }
  else
  {
    BOOL var2 = a3->var2;
    long long v10 = *(_OWORD *)&a3->var2;
    long long v11 = *(_OWORD *)&a3->var4;
    long long v14 = *(_OWORD *)&a3->var0;
    long long v15 = v10;
    long long v16 = v11;
    [(UISwipeOccurrence *)self _resetItemWithSwipeInfo:&v14 animated:var2 deletion:0 completion:v8];
  }
  uint64_t v12 = a3->var3 != 0.0;
LABEL_7:
  [(UISwipeOccurrence *)self _transitionToState:v12];
}

- (CGRect)swipedViewRestingFrame
{
  if (objc_opt_respondsToSelector())
  {
    [(_UISwipeViewManipulator *)self->_manipulator restingFrameForSwipedView:self->_swipedView atIndexPath:self->_indexPath];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_moveItemWithSwipeInfo:(id *)a3 alongsideAnimations:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(void))a4;
  id v9 = a5;
  self->_offset = a3->var3;
  if (self->_swipedView)
  {
    long long v10 = *(_OWORD *)&a3->var0;
    long long v11 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&self->_currentSwipeInfo.initialSpringVelocity = *(_OWORD *)&a3->var4;
    *(_OWORD *)&self->_currentSwipeInfo.animated = v11;
    *(_OWORD *)&self->_currentSwipeInfo.direction = v10;
    if (a3->var2)
    {
      uint64_t v12 = +[_UISwipeAnimationFactory animatorForMoveWithOccurrence:self];
    }
    else
    {
      uint64_t v12 = 0;
    }
    if ((*(unsigned char *)&self->_flags & 0x60) == 0)
    {
      manipulator = self->_manipulator;
      swipedView = self->_swipedView;
      indexPath = self->_indexPath;
      long long v16 = *(_OWORD *)&a3->var2;
      v22[0] = *(_OWORD *)&a3->var0;
      v22[1] = v16;
      v22[2] = *(_OWORD *)&a3->var4;
      [(_UISwipeViewManipulator *)manipulator moveSwipedView:swipedView atIndexPath:indexPath withSwipeInfo:v22 animator:v12];
    }
    if (a3->var0)
    {
      v17 = -[UISwipeOccurrence _pullViewForSwipeDirection:](self, "_pullViewForSwipeDirection:");
      [v17 setState:a3->var1];
      double var3 = a3->var3;
      [(UISwipeOccurrence *)self _extraOffsetForOffset:a3->var0 withDirection:var3];
      [v17 moveToOffset:v12 extraOffset:var3 animator:v19 usingSpringWithStiffness:a3->var5 initialVelocity:a3->var4];
    }
    if (v12)
    {
      if (v8) {
        [v12 addAnimations:v8];
      }
      if (v9)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __75__UISwipeOccurrence__moveItemWithSwipeInfo_alongsideAnimations_completion___block_invoke;
        v20[3] = &unk_1E52E5E20;
        id v21 = v9;
        [v12 addCompletion:v20];
      }
      [v12 startAnimation];
    }
    else
    {
      if (v8) {
        v8[2](v8);
      }
      if (v9) {
        (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
      }
    }
  }
}

uint64_t __75__UISwipeOccurrence__moveItemWithSwipeInfo_alongsideAnimations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)resetAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    long long v10 = UISwipeInfoNoneAnimated;
    long long v11 = unk_186B9D290;
    long long v12 = xmmword_186B9D2A0;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  if ([(UISwipeOccurrence *)self state] == 4)
  {
    v7 = [(UISwipeOccurrence *)self currentAction];
    BOOL v8 = [v7 style] == 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  [(UISwipeOccurrence *)self _resetItemWithSwipeInfo:v9 animated:v4 deletion:v8 completion:v6];
}

- (void)resetForReconfiguration
{
  memset(v2, 0, sizeof(v2));
  [(UISwipeOccurrence *)self _resetItemWithSwipeInfo:v2 animated:0 deletion:0 completion:0];
}

- (void)_resetItemWithSwipeInfo:(id *)a3 animated:(BOOL)a4 deletion:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  [(UISwipeOccurrence *)self setActive:0];
  if (self->_configuredDirection)
  {
    if (v7)
    {
      if ((self->_state & 0xFFFFFFFFFFFFFFFELL) == 4) {
        int v11 = *(unsigned char *)&self->_flags & 1;
      }
      else {
        int v11 = 1;
      }
      BOOL v24 = v11;
    }
    else
    {
      BOOL v24 = 0;
    }
    currentAction = self->_currentAction;
    if (currentAction)
    {
      [(UIContextualAction *)currentAction cancel];
      long long v13 = self->_currentAction;
      self->_currentAction = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__UISwipeOccurrence__resetItemWithSwipeInfo_animated_deletion_completion___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    aBlock[4] = self;
    v25 = _Block_copy(aBlock);
    long long v14 = self->_leadingPullView;
    long long v15 = self->_trailingPullView;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __74__UISwipeOccurrence__resetItemWithSwipeInfo_animated_deletion_completion___block_invoke_2;
    v29[3] = &unk_1E5308410;
    v29[4] = self;
    long long v16 = v14;
    v30 = v16;
    v17 = v15;
    BOOL v31 = v17;
    BOOL v33 = v6;
    id v32 = v10;
    v18 = _Block_copy(v29);
    long long v27 = 0u;
    long long v28 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    id v20 = [WeakRetained swipeHandler];
    id v21 = v20;
    if (v20)
    {
      [v20 currentSwipeConfig];
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }

    if (!a3->var0)
    {
      a3->BOOL var2 = v24;
      a3->var0 = v27;
      if (v24) {
        *(_OWORD *)&a3->var4 = xmmword_186B89740;
      }
      a3->double var3 = 0.0;
    }
    self->_configuredDirection = 0;
    *(unsigned char *)&self->_flags |= 2u;
    id v22 = objc_loadWeakRetained((id *)&self->_controller);
    [v22 swipeOccurrence:self willFinishWithDeletion:v6];

    if (v6) {
      [(UISwipeOccurrence *)self endSwipe];
    }
    long long v23 = *(_OWORD *)&a3->var2;
    v26[0] = *(_OWORD *)&a3->var0;
    v26[1] = v23;
    v26[2] = *(_OWORD *)&a3->var4;
    [(UISwipeOccurrence *)self _moveItemWithSwipeInfo:v26 alongsideAnimations:v25 completion:v18];
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
}

uint64_t __74__UISwipeOccurrence__resetItemWithSwipeInfo_animated_deletion_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v2 + 8) & 8) != 0)
  {
    [*(id *)(v2 + 136) setUserInteractionEnabled:1];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  return [(id)v2 _updateSwipedStateOnSwipedView:0];
}

uint64_t __74__UISwipeOccurrence__resetItemWithSwipeInfo_animated_deletion_completion___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) active] & 1) == 0)
  {
    [*(id *)(a1 + 32) _removeAndResetPullViewImmediately:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _removeAndResetPullViewImmediately:*(void *)(a1 + 48)];
    if (!*(unsigned char *)(a1 + 64)) {
      [*(id *)(a1 + 32) endSwipe];
    }
  }
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (int64_t)_styleFromConfiguration
{
  return self->_styleFromConfiguration;
}

- (void)updateLayout
{
  if (!self->_currentAction) {
    [(UISwipeOccurrence *)self _updateLayoutUsingCurrentSwipeInfo:0];
  }
}

- (void)_updateLayoutUsingCurrentSwipeInfo:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UISwipeOccurrence *)self active]) {
    return;
  }
  unint64_t v5 = [(UISwipeOccurrence *)self state];
  if (v5 <= 5 && ((1 << v5) & 0x25) != 0
    || (v18[0] = 0, *(_DWORD *)((char *)v18 + 3) = 0, long long v17 = xmmword_186B9D270, v3))
  {
    unint64_t direction = self->_currentSwipeInfo.direction;
    unint64_t targetSwipeState = self->_currentSwipeInfo.targetSwipeState;
    v18[0] = *(_DWORD *)(&self->_currentSwipeInfo.animated + 1);
    *(_DWORD *)((char *)v18 + 3) = *((_DWORD *)&self->_currentSwipeInfo.animated + 1);
    double xOffset = self->_currentSwipeInfo.xOffset;
    long long v17 = *(_OWORD *)&self->_currentSwipeInfo.initialSpringVelocity;
    if (!direction) {
      return;
    }
    goto LABEL_5;
  }
  long long v15 = 0u;
  v16[0] = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  long long v12 = [WeakRetained swipeHandler];
  long long v13 = v12;
  if (v12)
  {
    [v12 currentSwipeConfig];
  }
  else
  {
    long long v15 = 0u;
    v16[0] = 0u;
  }

  unint64_t targetSwipeState = 0;
  unint64_t direction = v15;
  double xOffset = *(double *)v16;
  if ((void)v15)
  {
LABEL_5:
    [(UISwipeOccurrence *)self _unfreezeSwipedViewInsets];
    long long v15 = 0uLL;
    *(_OWORD *)((char *)v16 + 1) = unk_186B9D261;
    v16[1] = xmmword_186B9D270;
    LOBYTE(v16[0]) = 0;
    [(UISwipeOccurrence *)self _moveItemWithSwipeInfo:&v15 alongsideAnimations:0 completion:0];
    id v9 = [(UISwipeOccurrence *)self _pullViewForSwipeDirection:direction];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v14[0] = *MEMORY[0x1E4F1DAB8];
    v14[1] = v10;
    v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v9 setTransform:v14];
    [(UISwipeOccurrence *)self _updatePullView:v9];
    [(UISwipeOccurrence *)self _freezeSwipedViewInsets];
    *(void *)&long long v15 = direction;
    *((void *)&v15 + 1) = targetSwipeState;
    LOBYTE(v16[0]) = 0;
    *(_DWORD *)((char *)v16 + 1) = v18[0];
    DWORD1(v16[0]) = *(_DWORD *)((char *)v18 + 3);
    *((double *)v16 + 1) = xOffset;
    v16[1] = v17;
    [(UISwipeOccurrence *)self _moveItemWithSwipeInfo:&v15 alongsideAnimations:0 completion:0];
  }
}

- (void)updateSwipedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  BOOL v4 = [WeakRetained _swipedViewForItemAtIndexPath:self->_indexPath];
  swipedView = self->_swipedView;
  self->_swipedView = v4;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(_UISwipedView *)self->_swipedView frame];
    double MinX = CGRectGetMinX(v9);
    manipulator = self->_manipulator;
    [(_UISwipeViewManipulator *)manipulator setSwipedViewRestingOffset:MinX];
  }
}

- (void)_updateSwipedStateOnSwipedView:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    swipedView = self->_swipedView;
    [(_UISwipedView *)swipedView _setSwiped:v3];
  }
}

- (void)_freezeSwipedViewInsets
{
  [(_UISwipedView *)self->_swipedView _setSafeAreaInsetsFrozen:1];
  swipedView = self->_swipedView;
  [(_UISwipedView *)swipedView _setDontUpdateInferredLayoutMargins:1];
}

- (void)_unfreezeSwipedViewInsets
{
  [(_UISwipedView *)self->_swipedView _setSafeAreaInsetsFrozen:0];
  [(_UISwipedView *)self->_swipedView _setDontUpdateInferredLayoutMargins:0];
  swipedView = self->_swipedView;
  [(_UISwipedView *)swipedView _updateInferredLayoutMargins];
}

- (void)performPrimaryActionWithSwipeInfo:(id *)a3
{
  unint64_t v5 = [(UISwipeOccurrence *)self _pullViewForSwipeDirection:a3->var0];
  BOOL v6 = [v5 primarySwipeAction];
  long long v7 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a3->var4;
  [(UISwipeOccurrence *)self _performSwipeAction:v6 inPullView:v5 swipeInfo:v8];
}

- (BOOL)shouldDismissWithTouchLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  long long v7 = [WeakRetained containerView];
  BOOL v8 = objc_msgSend(v7, "hitTest:withEvent:", 0, x, y);

  p_leadingPullView = &self->_leadingPullView;
  long long v10 = [(UIView *)self->_leadingPullView window];

  if (!v10)
  {
    trailingPullView = self->_trailingPullView;
    p_trailingPullView = &self->_trailingPullView;
    long long v13 = [(UIView *)trailingPullView window];

    if (!v13)
    {
      LOBYTE(v14) = 1;
      goto LABEL_5;
    }
    p_leadingPullView = p_trailingPullView;
  }
  int v14 = [v8 isDescendantOfView:*p_leadingPullView] ^ 1;
LABEL_5:

  return v14;
}

- (void)_transitionToState:(int64_t)a3
{
  char flags = (char)self->_flags;
  *(unsigned char *)&self->_char flags = flags | 1;
  int64_t state = self->_state;
  if ((state & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    int64_t v7 = a3;
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    CGRect v9 = v8;
    long long v10 = @".closed";
    int v11 = @".triggered";
    if (state != 4) {
      int v11 = @".closed";
    }
    if (state == 5) {
      int v11 = @".cancelled";
    }
    if ((unint64_t)(v7 - 1) <= 4) {
      long long v10 = off_1E5308480[v7 - 1];
    }
    [v8 handleFailureInMethod:a2, self, @"UISwipeOccurrence.m", 678, @"Transitioning from %@ to %@ is not a valid transition.", v11, v10 object file lineNumber description];

    a3 = v7;
  }
  self->_int64_t state = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained swipeOccurrence:self didChangeStateFrom:state];

  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | flags & 1;
}

- (void)_setHasAmbiguousIndexPath
{
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (BOOL)_hasAmbiguousIndexPath
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_setDidReloadData
{
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (BOOL)_didReloadData
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (unint64_t)_style
{
  return self->_style;
}

- (void)_executeLifecycleForPerformedAction:(id)a3 sourceView:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_controller);
  long long v15 = [(UISwipeOccurrence *)v13 indexPath];
  objc_storeStrong((id *)&v13->_currentAction, a3);
  long long v16 = [WeakRetained swipeActionHost];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    v18 = [WeakRetained swipeActionHost];
    [v18 swipeActionController:WeakRetained willPerformAction:v10 atIndexPath:v15];
  }
  [(UISwipeOccurrence *)v13 _transitionToState:3];
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v19 = v13->_actionExecutionCounter + 1;
  v13->_actionExecutionCounter = v19;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SwipeActions", &_MergedGlobals_1239);
  id v21 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v22 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), v13);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v23 = v22;
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "ExecuteSwipeActionHandler", "", buf, 2u);
    }
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __86__UISwipeOccurrence__executeLifecycleForPerformedAction_sourceView_completionHandler___block_invoke;
  v35[3] = &unk_1E5308438;
  __int16 v40 = &v49;
  v35[4] = v13;
  SEL v42 = a2;
  uint64_t v43 = v19;
  id v24 = v12;
  id v39 = v24;
  id v25 = v10;
  id v36 = v25;
  id v26 = WeakRetained;
  id v37 = v26;
  id v27 = v15;
  id v38 = v27;
  v41 = &v45;
  [v25 executeHandlerWithView:v11 completionHandler:v35];
  unint64_t v28 = __UILogGetCategoryCachedImpl("SwipeActions", &qword_1EB2634B8);
  v29 = *(id *)(v28 + 8);
  os_signpost_id_t v30 = os_signpost_id_make_with_pointer(*(os_log_t *)(v28 + 8), v13);
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v29, OS_SIGNPOST_INTERVAL_END, v31, "ExecuteSwipeActionHandler", "", buf, 2u);
    }
  }

  id v32 = [v26 swipeActionHost];
  char v33 = objc_opt_respondsToSelector();

  if (v33)
  {
    double v34 = [v26 swipeActionHost];
    [v34 swipeActionController:v26 didPerformAction:v25 atIndexPath:v27];
  }
  *((unsigned char *)v46 + 24) = 1;
  if (*((unsigned char *)v50 + 24) && (v13->_state & 0xFFFFFFFFFFFFFFFELL) != 4) {
    [(UISwipeOccurrence *)v13 _transitionToState:5];
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
}

void __86__UISwipeOccurrence__executeLifecycleForPerformedAction_sourceView_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 88) object:*(void *)(a1 + 32) file:@"UISwipeOccurrence.m" lineNumber:759 description:@"A UIContextualAction's completionHandler was called multiple times."];

    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  }
  *(unsigned char *)(v4 + 24) = 1;
  unint64_t v5 = *(void **)(a1 + 32);
  if (v5[2] != *(void *)(a1 + 96))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    UIContextualActionAlertForOutdatedCompletionHandlerExecution(*(void **)(a1 + 40));
    goto LABEL_16;
  }
  if (([v5 state] & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    if (a2)
    {
      if ([*(id *)(a1 + 40) style] != 1)
      {
        BOOL v6 = *(void **)(a1 + 32);
        uint64_t v7 = 4;
        goto LABEL_14;
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
        goto LABEL_15;
      }
      BOOL v6 = *(void **)(a1 + 32);
      if (v6[15] != 3) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v6 = *(void **)(a1 + 32);
    }
    uint64_t v7 = 5;
LABEL_14:
    [v6 _transitionToState:v7];
  }
LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_16:
  BOOL v8 = [*(id *)(a1 + 48) swipeActionHost];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v11 = [*(id *)(a1 + 48) swipeActionHost];
    [v11 swipeActionController:*(void *)(a1 + 48) didCompleteAction:*(void *)(a1 + 40) cancelled:a2 ^ 1u atIndexPath:*(void *)(a1 + 56)];
  }
}

- (void)_performSwipeAction:(id)a3 inPullView:(id)a4 swipeInfo:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v11 = [(UISwipeOccurrence *)self indexPath];
  id v12 = [WeakRetained _swipedViewForItemAtIndexPath:v11];

  if (v12 && ([(UISwipeOccurrence *)self state] & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    [v8 executePreHandlerWithView:v9];
    if (self->_direction) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    [(UISwipeOccurrence *)self _extraOffsetForOffset:v13 withDirection:self->_offset];
    [v9 _performAction:v8 offset:self->_offset extraOffset:v14];
    memset(v35, 0, 7);
    unint64_t var0 = a5->var0;
    if (a5->var0)
    {
      unint64_t var1 = a5->var1;
      BOOL var2 = a5->var2;
      v35[0] = *(_DWORD *)(&a5->var2 + 1);
      *(_DWORD *)((char *)v35 + 3) = *((_DWORD *)&a5->var2 + 1);
      double var3 = a5->var3;
      double var4 = a5->var4;
      double var5 = a5->var5;
    }
    else
    {
      unint64_t var0 = [(UISwipeOccurrence *)self _swipeDirectionForPullView:v9];
      double var5 = 1.0;
      double var3 = 0.0;
      BOOL var2 = 1;
      unint64_t var1 = 2;
      double var4 = 0.0;
    }
    id v21 = [v9 sourceViewForAction:v8];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke;
    _OWORD v22[3] = &unk_1E5308460;
    id v23 = WeakRetained;
    id v24 = v8;
    id v25 = self;
    id v26 = v9;
    id v27 = v12;
    unint64_t v28 = var0;
    unint64_t v29 = var1;
    BOOL v30 = var2;
    *(_DWORD *)os_signpost_id_t v31 = v35[0];
    *(_DWORD *)&v31[3] = *(_DWORD *)((char *)v35 + 3);
    double v32 = var3;
    double v33 = var4;
    double v34 = var5;
    [(UISwipeOccurrence *)self _executeLifecycleForPerformedAction:v24 sourceView:v21 completionHandler:v22];
  }
}

void __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) swipeActionHost];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if ([*(id *)(a1 + 40) isDestructive]) {
      BOOL v6 = a2 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      uint64_t v7 = *(void **)(a1 + 48);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke_3;
      v21[3] = &unk_1E52DAFB8;
      id v22 = *(id *)(a1 + 32);
      id v8 = *(id *)(a1 + 40);
      char v25 = a2;
      uint64_t v9 = *(void *)(a1 + 48);
      id v23 = v8;
      uint64_t v24 = v9;
      long long v10 = *(_OWORD *)(a1 + 88);
      long long v26 = *(_OWORD *)(a1 + 72);
      long long v27 = v10;
      long long v28 = *(_OWORD *)(a1 + 104);
      [v7 _resetItemWithSwipeInfo:&v26 animated:1 deletion:0 completion:v21];

      id v20 = v22;
    }
    else
    {
      id v11 = [*(id *)(a1 + 32) containerView];
      [v11 layoutIfNeeded];

      [*(id *)(a1 + 48) _updateLayoutUsingCurrentSwipeInfo:1];
      [*(id *)(a1 + 56) setAutoresizesSubviews:0];
      [*(id *)(a1 + 56) setClipsToBounds:1];
      id v12 = [*(id *)(a1 + 32) swipeActionHost];
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      char v17 = [*(id *)(a1 + 48) indexPath];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke_2;
      v29[3] = &unk_1E52E7A38;
      v18 = *(void **)(a1 + 56);
      v29[4] = *(void *)(a1 + 48);
      id v30 = v18;
      id v31 = *(id *)(a1 + 32);
      id v32 = *(id *)(a1 + 40);
      char v33 = a2;
      long long v19 = *(_OWORD *)(a1 + 88);
      long long v26 = *(_OWORD *)(a1 + 72);
      long long v27 = v19;
      long long v28 = *(_OWORD *)(a1 + 104);
      [v12 swipeActionController:v15 animateView:v13 actionsView:v14 forDestructiveAction:v16 atIndexPath:v17 withSwipeInfo:&v26 completion:v29];

      id v20 = v30;
    }
  }
}

void __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  memset(v12, 0, sizeof(v12));
  [v2 _resetItemWithSwipeInfo:v12 animated:0 deletion:1 completion:0];
  [*(id *)(a1 + 40) setAutoresizesSubviews:1];
  objc_msgSend(*(id *)(a1 + 40), "setClipsToBounds:", objc_msgSend(*(id *)(a1 + 40), "buttonsUnderlapSwipedView"));
  BOOL v3 = [*(id *)(a1 + 48) swipeActionHost];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [*(id *)(a1 + 48) swipeActionHost];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    BOOL v8 = *(unsigned char *)(a1 + 64) == 0;
    uint64_t v9 = [*(id *)(a1 + 32) indexPath];
    [v5 swipeActionController:v6 didCompleteAnimationOfAction:v7 canceled:v8 atIndexPath:v9];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 144);
  *(void *)(v10 + 144) = 0;
}

void __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) swipeActionHost];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = [*(id *)(a1 + 32) swipeActionHost];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    BOOL v7 = *(unsigned char *)(a1 + 56) == 0;
    BOOL v8 = [*(id *)(a1 + 48) indexPath];
    [v4 swipeActionController:v5 didCompleteAnimationOfAction:v6 canceled:v7 atIndexPath:v8];
  }
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void **)(v9 + 144);
  *(void *)(v9 + 144) = 0;
}

- (double)_extraOffsetForOffset:(double)a3 withDirection:(unint64_t)a4
{
  double result = 0.0;
  if (a4 == 2)
  {
    if (a3 > 0.0)
    {
      [(UISwipeOccurrence *)self extraInsets];
      return v7;
    }
  }
  else if (a4 == 1 && a3 < 0.0)
  {
    [(UISwipeOccurrence *)self extraInsets];
    return v6;
  }
  return result;
}

- (BOOL)_isSwipeDirectionExposingLeadingEdgePullView:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      double v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v11 = 134217984;
        unint64_t v12 = a3;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Attempted to request the pull view for an unsupported swipe direction (%ld)", (uint8_t *)&v11, 0xCu);
      }

      goto LABEL_13;
    }
  }
  else if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    BOOL v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_isSwipeDirectionExposingLeadingEdgePullView____s_category)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134217984;
      unint64_t v12 = a3;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Attempted to request the pull view for an unsupported swipe direction (%ld)", (uint8_t *)&v11, 0xCu);
    }
LABEL_13:
    int v5 = (*(unsigned char *)&self->_flags >> 4) & 1;
    return a3 == 1 && v5 != 0;
  }
  int v5 = (*(unsigned char *)&self->_flags >> 4) & 1;
  if (a3 == 2 && !v5) {
    return 1;
  }
  return a3 == 1 && v5 != 0;
}

- (id)_pullViewForSwipeDirection:(unint64_t)a3
{
  char v3 = [(UISwipeOccurrence *)self _pullViewForLeadingEdge:[(UISwipeOccurrence *)self _isSwipeDirectionExposingLeadingEdgePullView:a3]];
  return v3;
}

- (unint64_t)_swipeDirectionForPullView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v4 = (UISwipeActionPullView *)a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  trailingPullView = self->_trailingPullView;
  if (has_internal_diagnostics)
  {
    if (trailingPullView != v4 && self->_leadingPullView != v4)
    {
      int v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v4;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Attempted to request the swipe direction for an unknown pull view: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else if (trailingPullView != v4 && self->_leadingPullView != v4)
  {
    unint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_swipeDirectionForPullView____s_category) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = v4;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Attempted to request the swipe direction for an unknown pull view: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v7 = 1;
  if (self->_leadingPullView == v4) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  if (self->_leadingPullView == v4) {
    uint64_t v7 = 2;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }

  return v9;
}

- (id)_pullViewForLeadingEdge:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    p_leadingPullView = &self->_leadingPullView;
    leadingPullView = self->_leadingPullView;
    if (!leadingPullView)
    {
      if (self->_trailingPullView) {
        goto LABEL_12;
      }
LABEL_8:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      unint64_t v9 = [WeakRetained swipeActionHost];
      char v10 = objc_opt_respondsToSelector();

      id v11 = objc_loadWeakRetained((id *)&self->_controller);
      unint64_t v12 = v11;
      if (v10)
      {
        int v13 = [v11 swipeActionHost];
        id v14 = objc_loadWeakRetained((id *)&self->_controller);
        [v13 swipeActionController:v14 extraInsetsForItemAtIndexPath:self->_indexPath];
        self->_extraInsets.top = v15;
        self->_extraInsets.double left = v16;
        self->_extraInsets.bottom = v17;
        self->_extraInsets.double right = v18;
      }
      else
      {
        int v13 = [v11 containerView];
        [v13 safeAreaInsets];
        self->_extraInsets.top = v19;
        self->_extraInsets.double left = v20;
        self->_extraInsets.bottom = v21;
        self->_extraInsets.double right = v22;
      }

LABEL_12:
      uint64_t v23 = 2;
      if (v3) {
        uint64_t v24 = 8;
      }
      else {
        uint64_t v24 = 2;
      }
      if (!v3) {
        uint64_t v23 = 8;
      }
      if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = v23;
      }
      id v26 = objc_loadWeakRetained((id *)&self->_controller);
      long long v27 = [v26 swipeActionHost];
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        id v29 = objc_loadWeakRetained((id *)&self->_controller);
        id v30 = [v29 swipeActionHost];
        id v31 = objc_loadWeakRetained((id *)&self->_controller);
        id v32 = [v30 swipeActionController:v31 backgroundColorForItemAtIndexPath:self->_indexPath];
      }
      else
      {
        id v32 = 0;
      }
      [(_UISwipedView *)self->_swipedView bounds];
      uint64_t v7 = -[UISwipeActionPullView initWithFrame:cellEdge:style:]([UISwipeActionPullView alloc], "initWithFrame:cellEdge:style:", v25, self->_style, 0.0, 0.0, 0.0, CGRectGetHeight(v38));
      [(UISwipeActionPullView *)v7 _setRoundedStyleCornerRadius:self->_roundedStyleCornerRadius];
      [(UISwipeActionPullView *)v7 setBackgroundPullColor:v32];
      [(UISwipeActionPullView *)v7 setDelegate:self];
      if ((*(unsigned char *)&self->_flags & 0x10) != 0)
      {
        if (v3) {
          goto LABEL_25;
        }
      }
      else if (!v3)
      {
LABEL_25:
        double right = self->_extraInsets.right;
        double left = 0.0;
LABEL_28:
        -[UISwipeActionPullView setContentInsets:](v7, "setContentInsets:", 0.0, left, 0.0, right);
        if (v3) {
          p_trailingPullView = p_leadingPullView;
        }
        else {
          p_trailingPullView = &self->_trailingPullView;
        }
        objc_storeStrong((id *)p_trailingPullView, v7);

        goto LABEL_32;
      }
      double left = self->_extraInsets.left;
      double right = 0.0;
      goto LABEL_28;
    }
  }
  else
  {
    leadingPullView = self->_trailingPullView;
    if (!leadingPullView)
    {
      p_leadingPullView = &self->_leadingPullView;
      if (self->_leadingPullView) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
  }
  uint64_t v7 = leadingPullView;
LABEL_32:
  return v7;
}

- (void)_updatePullView:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    double v6 = [v4 superview];

    if (v6)
    {
      swipedView = self->_swipedView;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      unint64_t v9 = [WeakRetained containerView];
      [(UISwipeOccurrence *)self _frameForPullView:v5 inSwipedItem:swipedView withContainer:v9];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      CGFloat v18 = [v5 superview];
      objc_msgSend(v18, "convertRect:fromView:", self->_swipedView, v11, v13, v15, v17);
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;

      objc_msgSend(v5, "setFrame:", v20, v22, v24, v26);
      if (self->_style == 1)
      {
        id v27 = objc_loadWeakRetained((id *)&self->_controller);
        char v28 = [v27 containerView];
        [v28 frame];
        double Width = CGRectGetWidth(v53);
        [(_UISwipedView *)self->_swipedView frame];
        double v30 = Width - CGRectGetWidth(v54);

        double v31 = -v30;
        if (v30 >= 0.0) {
          double v31 = v30;
        }
        double v32 = v31 * 0.5;
        BOOL v33 = v32 > 20.0;
        double v34 = 0.0;
        if (v32 <= 20.0) {
          double v34 = v32;
        }
        objc_msgSend(v5, "setContentInsets:", 0.0, v34, 0.0, 0.0);
        double v35 = v5;
        BOOL v36 = v33;
      }
      else
      {
        CGRect v38 = [v5 superview];
        [(_UISwipedView *)self->_swipedView bounds];
        objc_msgSend(v38, "convertRect:fromView:", self->_swipedView);
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        CGFloat v44 = v43;
        CGFloat v46 = v45;

        if (self->_configuredDirection == 1)
        {
          uint64_t v47 = [v5 superview];
          [v47 bounds];
          double v48 = CGRectGetWidth(v55);
          v56.origin.double x = v40;
          v56.origin.double y = v42;
          v56.size.width = v44;
          v56.size.height = v46;
          double MinX = v48 - CGRectGetMaxX(v56);
        }
        else
        {
          v57.origin.double x = v40;
          v57.origin.double y = v42;
          v57.size.width = v44;
          v57.size.height = v46;
          double MinX = CGRectGetMinX(v57);
        }
        BOOL v36 = fmax(MinX, 0.0) > 2.22044605e-16;
        double v35 = v5;
      }
      [v35 setButtonsUnderlapSwipedView:v36];
    }
    else if (os_variant_has_internal_diagnostics())
    {
      v50 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v50, OS_LOG_TYPE_FAULT, "The pullView is not in a view hierarchy. This is a UIKit bug.", buf, 2u);
      }
    }
    else
    {
      id v37 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updatePullView____s_category) + 8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v51 = 0;
        _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "The pullView is not in a view hierarchy. This is a UIKit bug.", v51, 2u);
      }
    }
  }
}

- (CGRect)_frameForPullView:(id)a3 inSwipedItem:(id)a4 withContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 frame];
  double Height = CGRectGetHeight(v51);
  double v12 = Height;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 separatorStyle])
  {
    [v9 _separatorHeight];
    double v12 = Height - v13;
  }
  double v14 = 0.0;
  if (self->_style == 1)
  {
    [v10 visibleBounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [v10 contentInset];
    objc_msgSend(v9, "convertRect:fromView:", v10, v16 + v26, v18 + v23, v20 - (v26 + v24), v22 - (v23 + v25));
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    [v9 bounds];
    v56.origin.CGFloat x = v35;
    v56.origin.CGFloat y = v36;
    v56.size.CGFloat width = v37;
    v56.size.height = v38;
    v52.origin.CGFloat x = v28;
    v52.origin.CGFloat y = v30;
    v52.size.CGFloat width = v32;
    v52.size.height = v34;
    CGRect v53 = CGRectIntersection(v52, v56);
    CGFloat x = v53.origin.x;
    CGFloat y = v53.origin.y;
    CGFloat width = v53.size.width;
    CGFloat v42 = v53.size.height;
    +[UISwipeActionCircularButton maximumButtonHeight];
    if (v12 >= v43) {
      double v12 = v43;
    }
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.height = v42;
    CGRectGetMidY(v54);
    UIRoundToViewScale(v9);
    double v45 = v44;
  }
  else
  {
    double v45 = 0.0;
  }
  if ([v8 cellEdge] == 8)
  {
    [v9 frame];
    UIRoundToViewScale(v9);
    double v14 = v46;
  }

  double v47 = 0.0;
  double v48 = v14;
  double v49 = v45;
  double v50 = v12;
  result.size.height = v50;
  result.size.CGFloat width = v47;
  result.origin.CGFloat y = v49;
  result.origin.CGFloat x = v48;
  return result;
}

- (void)_removeAndResetPullViewImmediately:(id)a3
{
  id v17 = a3;
  int v5 = [v17 superview];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    uint64_t v7 = [WeakRetained _internalSwipeActionHost];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_controller);
      id v10 = [v9 _internalSwipeActionHost];
      id v11 = objc_loadWeakRetained((id *)&self->_controller);
      [v10 swipeActionController:v11 cleanupActionsView:v17 forItemAtIndexPath:self->_indexPath];

      double v12 = [v17 window];

      if (v12)
      {
        double v13 = [MEMORY[0x1E4F28B00] currentHandler];
        double v14 = NSStringFromSelector(sel_swipeActionController_cleanupActionsView_forItemAtIndexPath_);
        id v15 = objc_loadWeakRetained((id *)&self->_controller);
        double v16 = [v15 swipeActionHost];
        [v13 handleFailureInMethod:a2, self, @"UISwipeOccurrence.m", 1113, @"Actions view not removed from view hierarchy after calling -%@ on %@", v14, v16 object file lineNumber description];
      }
    }
    else
    {
      [v17 removeFromSuperview];
    }
  }
  [v17 resetView];
}

- (id)_actionView
{
  [(UISwipeOccurrence *)self currentSwipeInfo];
  return 0;
}

- (id)lockActionViewForAnimation
{
  uint64_t v2 = [(UISwipeOccurrence *)self _actionView];
  [v2 setAutoresizesSubviews:0];
  [v2 setClipsToBounds:1];
  return v2;
}

- (void)unlockActionViewForAnimation:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"UISwipeOccurrence.m", 1151, @"Invalid parameter not satisfying: %@", @"[pullView isKindOfClass:[UISwipeActionPullView class]]" object file lineNumber description];
  }
  [v6 setAutoresizesSubviews:1];
  objc_msgSend(v6, "setClipsToBounds:", objc_msgSend(v6, "buttonsUnderlapSwipedView"));
}

- (void)swipeActionPullView:(id)a3 tappedAction:(id)a4
{
  memset(v4, 0, sizeof(v4));
  [(UISwipeOccurrence *)self _performSwipeAction:a4 inPullView:a3 swipeInfo:v4];
}

- (double)confirmationDistanceForPrimaryActionInSwipeActionPullView:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(UISwipeOccurrence *)self _swipeDirectionForPullView:v4];
  int v6 = [v4 primaryActionIsDestructive];

  if (v6)
  {
    [(_UISwipedView *)self->_swipedView frame];
    double v8 = v7;
    [(UISwipeOccurrence *)self extraInsets];
    double result = v8 - v9 + -64.0;
    double v12 = v8 - v11 + -29.0;
    if (v5 == 1) {
      return v12;
    }
  }
  else
  {
    [(_UISwipedView *)self->_swipedView frame];
    return v13 * 0.525;
  }
  return result;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t state = self->_state;
  if (state > 5) {
    int v6 = @".open";
  }
  else {
    int v6 = off_1E53084A8[state];
  }
  double v7 = @"right";
  if (!self->_direction) {
    double v7 = @"left";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; indexPath: %@, state: %@, direction: %@, offset: %g>",
                       v4,
                       self,
                       self->_indexPath,
                       v6,
                       v7,
                       *(void *)&self->_offset);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (int64_t)direction
{
  return self->_direction;
}

- (double)offset
{
  return self->_offset;
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)configuredDirection
{
  return self->_configuredDirection;
}

- (void)setConfiguredDirection:(unint64_t)a3
{
  self->_configuredDirection = a3;
}

- ($B18736ADBBD355D2E16F2B3CA0B0347D)currentSwipeInfo
{
  long long v3 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr->unint64_t var0 = *(_OWORD *)&self[3].var5;
  *(_OWORD *)&retstr->BOOL var2 = v3;
  *(_OWORD *)&retstr->double var4 = *(_OWORD *)&self[4].var3;
  return self;
}

- (void)setCurrentSwipeInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_currentSwipeInfo.initialSpringVelocitCGFloat y = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_currentSwipeInfo.animated = v4;
  *(_OWORD *)&self->_currentSwipeInfo.unint64_t direction = v3;
}

- (UIEdgeInsets)extraInsets
{
  double top = self->_extraInsets.top;
  double left = self->_extraInsets.left;
  double bottom = self->_extraInsets.bottom;
  double right = self->_extraInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setExtraInsets:(UIEdgeInsets)a3
{
  self->_extraInsets = a3;
}

- (_UISwipedView)swipedView
{
  return self->_swipedView;
}

- (void)setSwipedView:(id)a3
{
}

- (BOOL)swipedViewMaskWasRemoved
{
  return self->_swipedViewMaskWasRemoved;
}

- (void)setSwipedViewMaskWasRemoved:(BOOL)a3
{
  self->_swipedViewMaskWasRemoved = a3;
}

- (UIContextualAction)currentAction
{
  return self->_currentAction;
}

- (void)setCurrentAction:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_storeStrong((id *)&self->_swipedView, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_manipulator, 0);
  objc_storeStrong((id *)&self->_trailingPullView, 0);
  objc_storeStrong((id *)&self->_leadingPullView, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end