@interface _UIViewControllerTransitionRequest
- (BOOL)keyboardShouldAnimateAlongsideForInteractiveTransitions;
- (UIResponder)pinningInputViewsResponder;
- (UIViewControllerAnimatedTransitioning)animator;
- (UIViewControllerInteractiveTransitioning)interactor;
- (_UIViewControllerAnimatedTransitionHandoffData)handoffData;
- (_UIViewControllerKeyboardAnimationStyle)keyboardAnimationStyle;
- (_UIViewControllerOneToOneTransitionContext)transitionContext;
- (_UIViewControllerTransitionRequest)initWithTransitionContext:(id)a3 animator:(id)a4 interactor:(id)a5 interactiveUpdateHandler:(id)a6 keyboardShouldAnimateAlongsideForInteractiveTransitions:(BOOL)a7 keyboardAnimationStyle:(id)a8 pinningInputViewsResponder:(id)a9 extraPinningInputViewsBlock:(id)a10 handoffData:(id)a11;
- (id)extraPinningInputViewsBlock;
- (id)interactiveUpdateHandler;
@end

@implementation _UIViewControllerTransitionRequest

- (_UIViewControllerOneToOneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (UIResponder)pinningInputViewsResponder
{
  return self->_pinningInputViewsResponder;
}

- (BOOL)keyboardShouldAnimateAlongsideForInteractiveTransitions
{
  return self->_keyboardShouldAnimateAlongsideForInteractiveTransitions;
}

- (_UIViewControllerKeyboardAnimationStyle)keyboardAnimationStyle
{
  return self->_keyboardAnimationStyle;
}

- (UIViewControllerInteractiveTransitioning)interactor
{
  return self->_interactor;
}

- (id)interactiveUpdateHandler
{
  return self->_interactiveUpdateHandler;
}

- (_UIViewControllerTransitionRequest)initWithTransitionContext:(id)a3 animator:(id)a4 interactor:(id)a5 interactiveUpdateHandler:(id)a6 keyboardShouldAnimateAlongsideForInteractiveTransitions:(BOOL)a7 keyboardAnimationStyle:(id)a8 pinningInputViewsResponder:(id)a9 extraPinningInputViewsBlock:(id)a10 handoffData:(id)a11
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v17 = a6;
  id v29 = a8;
  id v28 = a9;
  id v18 = a10;
  id v19 = a11;
  v33.receiver = self;
  v33.super_class = (Class)_UIViewControllerTransitionRequest;
  v20 = [(_UIViewControllerTransitionRequest *)&v33 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_transitionContext, a3);
    objc_storeStrong((id *)&v21->_animator, a4);
    objc_storeStrong((id *)&v21->_interactor, a5);
    v22 = _Block_copy(v17);
    id interactiveUpdateHandler = v21->_interactiveUpdateHandler;
    v21->_id interactiveUpdateHandler = v22;

    v21->_keyboardShouldAnimateAlongsideForInteractiveTransitions = a7;
    objc_storeStrong((id *)&v21->_keyboardAnimationStyle, a8);
    objc_storeStrong((id *)&v21->_pinningInputViewsResponder, a9);
    uint64_t v24 = [v18 copy];
    id extraPinningInputViewsBlock = v21->_extraPinningInputViewsBlock;
    v21->_id extraPinningInputViewsBlock = (id)v24;

    objc_storeStrong((id *)&v21->_handoffData, a11);
  }

  return v21;
}

- (id)extraPinningInputViewsBlock
{
  return self->_extraPinningInputViewsBlock;
}

- (UIViewControllerAnimatedTransitioning)animator
{
  return self->_animator;
}

- (_UIViewControllerAnimatedTransitionHandoffData)handoffData
{
  return self->_handoffData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffData, 0);
  objc_storeStrong(&self->_extraPinningInputViewsBlock, 0);
  objc_storeStrong((id *)&self->_pinningInputViewsResponder, 0);
  objc_storeStrong((id *)&self->_keyboardAnimationStyle, 0);
  objc_storeStrong(&self->_interactiveUpdateHandler, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end