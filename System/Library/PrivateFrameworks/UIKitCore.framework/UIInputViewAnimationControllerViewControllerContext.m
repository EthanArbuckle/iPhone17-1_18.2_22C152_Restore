@interface UIInputViewAnimationControllerViewControllerContext
+ (id)contextWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5 transitionContext:(id)a6;
- (CGRect)fromKeyboardFrame;
- (CGRect)toKeyboardFrame;
- (UIInputViewAnimationControllerViewControllerContext)initWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5 transitionContext:(id)a6;
- (UIView)fromKeyboard;
- (UIView)toKeyboard;
- (UIViewControllerContextTransitioning)mainContext;
- (void)dealloc;
@end

@implementation UIInputViewAnimationControllerViewControllerContext

- (UIInputViewAnimationControllerViewControllerContext)initWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5 transitionContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v86.receiver = self;
  v86.super_class = (Class)UIInputViewAnimationControllerViewControllerContext;
  v15 = [(UIInputViewAnimationControllerViewControllerContext *)&v86 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_host, a3);
    objc_storeStrong((id *)&v16->_context, a6);
    v17 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    if ([v12 showsInputViews])
    {
      id v82 = v14;
      [v11 updateToPlacement:v12 withNormalAnimationsAndNotifications:0];
      v18 = [v11 transitioningView];
      v19 = [v11 inputViewSnapshotOfView:v18 afterScreenUpdates:0];

      v20 = [v11 viewForTransitionScreenSnapshot];
      v21 = [v11 transitioningView];
      objc_msgSend(v20, "convertPoint:toView:", v21, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      double v23 = v22;
      double v25 = v24;

      double v26 = -v23;
      double v27 = -v25;
      [v19 frame];
      objc_msgSend(v19, "setFrame:", v26, v27);
      v28 = [UIView alloc];
      v29 = [v11 viewForTransitionScreenSnapshot];
      [v29 frame];
      v30 = -[UIView initWithFrame:](v28, "initWithFrame:");

      [(UIView *)v30 setClipsToBounds:1];
      [(UIView *)v30 addSubview:v19];
      v31 = +[UIKeyboardImpl activeInstance];
      v32 = [v31 keyboardWindowSnapshot];

      if (v32)
      {
        if ([v17 preservingInputViews])
        {
          v33 = [v31 keyboardWindowSnapshot];
          [v17 setPreservedKeyboardWindowSnapshot:v33];
        }
        [v19 frame];
        double v35 = v34;
        double v37 = v36;
        v38 = [v31 keyboardWindowSnapshot];
        objc_msgSend(v38, "setFrame:", v26, v27, v35, v37);

        v39 = [v31 keyboardWindowSnapshot];
        [(UIView *)v30 addSubview:v39];

        [v31 clearKeyboardWindowSnapshot];
        +[UIKeyboard forceKeyboardAlpha:0.0];
        [v11 setKeyboardWindowSnapshotOn:1];
      }
      v40 = [UIView alloc];
      v41 = [v11 transitioningView];
      [v41 frame];
      uint64_t v42 = -[UIView initWithFrame:](v40, "initWithFrame:");
      from = v16->_from;
      v16->_from = (UIView *)v42;

      [(UIView *)v16->_from setUserInteractionEnabled:0];
      [(UIView *)v16->_from addSubview:v30];
      [v11 transitioningFrame];
      v16->_fromRect.origin.x = v44;
      v16->_fromRect.origin.y = v45;
      v16->_fromRect.size.width = v46;
      v16->_fromRect.size.height = v47;
      v48 = [v11 transitioningView];
      v49 = [v48 superview];
      [v49 addSubview:v16->_from];

      id v14 = v82;
    }
    if ([v13 showsInputViews])
    {
      if (+[UIKeyboard usesInputSystemUI]
        && !v16->_preservedInputViewSet)
      {
        v50 = [v17 preservedKeyboardWindowSnapshot];
        if (v50)
        {
        }
        else
        {
          v51 = +[UIKeyboardInputModeController sharedInputModeController];
          v52 = [v51 currentInputMode];
          char v53 = [v52 isExtensionInputMode];

          if ((v53 & 1) == 0)
          {
            uint64_t v54 = [(UIInputViewAnimationHost *)v16->_host inputViewSet];
            preservedInputViewSet = v16->_preservedInputViewSet;
            v16->_preservedInputViewSet = (UIInputViewSet *)v54;

            v56 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
            [v56 loadLocalKeyboardForHost:v16->_host];

            +[UIKeyboard forceKeyboardAlpha:0.0];
          }
        }
      }
      if ([v17 restoringInputViews]) {
        [v17 setTakingSnapshot:1];
      }
      v57 = [v17 preservedKeyboardWindowSnapshot];

      if (v57)
      {
        uint64_t v58 = [v17 preservedKeyboardWindowSnapshot];
        to = v16->_to;
        v16->_to = (UIView *)v58;

        [v17 setPreservedKeyboardWindowSnapshot:0];
      }
      else if (!+[UIKeyboard usesInputSystemUI] {
             || (+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), v60 = objc_claimAutoreleasedReturnValue(), [v60 currentInputMode], v61 = objc_claimAutoreleasedReturnValue(), char v62 = objc_msgSend(v61, "isExtensionInputMode"), v61, v60, (v62 & 1) == 0))
      }
      {
        [v11 updateToPlacement:v13 withNormalAnimationsAndNotifications:0];
        v63 = [v11 transitioningView];
        uint64_t v64 = +[UIKBViewTreeSnapshotter snapshotterForKeyboardView:v63 afterScreenUpdates:1];
        kbSnapshotter = v16->_kbSnapshotter;
        v16->_kbSnapshotter = (UIKBViewTreeSnapshotter *)v64;

        uint64_t v66 = [(UIKBViewTreeSnapshotter *)v16->_kbSnapshotter snapshotView];
        v67 = v16->_to;
        v16->_to = (UIView *)v66;
      }
      [v11 transitioningFrame];
      v16->_toRect.origin.x = v68;
      v16->_toRect.origin.y = v69;
      v16->_toRect.size.width = v70;
      v16->_toRect.size.height = v71;
      v72 = [v11 transitioningView];
      v73 = [v72 superview];
      [v73 addSubview:v16->_to];

      if (([MEMORY[0x1E4F39CF8] currentState] & 8) != 0)
      {
        v74 = [(UIView *)v16->_to window];
        v75 = v74;
        if (v74 && [v74 _isHostedInAnotherProcess])
        {
          v76 = v16->_to;
          id v77 = objc_initWeak(&location, v76);
          [(UIView *)v76 setAlpha:0.0];

          Current = CFRunLoopGetCurrent();
          v79 = (const void *)*MEMORY[0x1E4F1D410];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __114__UIInputViewAnimationControllerViewControllerContext_initWithHost_startPlacement_endPlacement_transitionContext___block_invoke;
          block[3] = &unk_1E52DC308;
          objc_copyWeak(&v84, &location);
          CFRunLoopPerformBlock(Current, v79, block);
          v80 = CFRunLoopGetCurrent();
          CFRunLoopWakeUp(v80);
          objc_destroyWeak(&v84);
          objc_destroyWeak(&location);
        }
      }
    }
    [v11 setInputViewsHidden:1];
  }
  return v16;
}

void __114__UIInputViewAnimationControllerViewControllerContext_initWithHost_startPlacement_endPlacement_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlpha:1.0];
}

- (void)dealloc
{
  preservedInputViewSet = self->_preservedInputViewSet;
  if (preservedInputViewSet)
  {
    v4 = +[UIInputViewSet inputSetWithOriginalInputSet:preservedInputViewSet duplicateInputView:1 duplicateInputAccessoryView:1 duplicateInputAssistantView:0];
    [(UIInputViewAnimationHost *)self->_host changeToInputViewSet:v4];
    v5 = self->_preservedInputViewSet;
    self->_preservedInputViewSet = 0;
  }
  +[UIKeyboard forceKeyboardAlpha:1.0];
  [(UIInputViewAnimationHost *)self->_host setInputViewsHidden:0];
  [(UIInputViewAnimationHost *)self->_host setKeyboardWindowSnapshotOn:0];
  [(UIView *)self->_from removeFromSuperview];
  [(UIView *)self->_to removeFromSuperview];
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewAnimationControllerViewControllerContext;
  [(UIInputViewAnimationControllerViewControllerContext *)&v6 dealloc];
}

+ (id)contextWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5 transitionContext:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[UIInputViewAnimationControllerViewControllerContext alloc] initWithHost:v12 startPlacement:v11 endPlacement:v10 transitionContext:v9];

  return v13;
}

- (UIViewControllerContextTransitioning)mainContext
{
  return (UIViewControllerContextTransitioning *)self->_context;
}

- (UIView)fromKeyboard
{
  return self->_from;
}

- (CGRect)fromKeyboardFrame
{
  double x = self->_fromRect.origin.x;
  double y = self->_fromRect.origin.y;
  double width = self->_fromRect.size.width;
  double height = self->_fromRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)toKeyboard
{
  return self->_to;
}

- (CGRect)toKeyboardFrame
{
  double x = self->_toRect.origin.x;
  double y = self->_toRect.origin.y;
  double width = self->_toRect.size.width;
  double height = self->_toRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preservedInputViewSet, 0);
  objc_storeStrong((id *)&self->_kbSnapshotter, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end