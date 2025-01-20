@interface BCCardStackTransitionAnimatorWrapper
- (BCCardStackTransitionAnimatorWrapper)initWithAnimator:(id)a3 context:(id)a4 waitUntilReadyBlock:(id)a5 setupBeforeAnimationBlock:(id)a6;
- (double)transitionDuration:(id)a3;
- (void)_setupBeforeAnimationIfNeeded;
- (void)animateTransition:(id)a3;
- (void)waitUntilReady:(id)a3;
- (void)waitUntilReadyThenAnimate;
@end

@implementation BCCardStackTransitionAnimatorWrapper

- (BCCardStackTransitionAnimatorWrapper)initWithAnimator:(id)a3 context:(id)a4 waitUntilReadyBlock:(id)a5 setupBeforeAnimationBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BCCardStackTransitionAnimatorWrapper;
  v15 = [(BCCardStackTransitionAnimatorWrapper *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_animator, a3);
    objc_storeStrong((id *)&v16->_context, a4);
    id v17 = [v13 copy];
    id waitUntilReadyBlock = v16->_waitUntilReadyBlock;
    v16->_id waitUntilReadyBlock = v17;

    id v19 = [v14 copy];
    id setupBeforeAnimationBlock = v16->_setupBeforeAnimationBlock;
    v16->_id setupBeforeAnimationBlock = v19;
  }
  return v16;
}

- (void)waitUntilReady:(id)a3
{
  id waitUntilReadyBlock = self->_waitUntilReadyBlock;
  v5 = (void (**)(void))a3;
  v7 = (void (**)(void))objc_retainBlock(waitUntilReadyBlock);
  id v6 = self->_waitUntilReadyBlock;
  self->_id waitUntilReadyBlock = 0;

  if (v7) {
    v7[2]();
  }
  else {
    v5[2](v5);
  }
}

- (void)waitUntilReadyThenAnimate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_2FB90;
  v2[3] = &unk_2C3C50;
  v2[4] = self;
  [(BCCardStackTransitionAnimatorWrapper *)self waitUntilReady:v2];
}

- (void)_setupBeforeAnimationIfNeeded
{
  id v3 = objc_retainBlock(self->_setupBeforeAnimationBlock);
  v4 = v3;
  if (v3) {
    (*((void (**)(id))v3 + 2))(v3);
  }

  id setupBeforeAnimationBlock = self->_setupBeforeAnimationBlock;
  self->_id setupBeforeAnimationBlock = 0;
}

- (void)animateTransition:(id)a3
{
  v4 = (BCCardStackTransitionContext *)a3;
  context = self->_context;
  if (context != v4)
  {
    [(BCCardStackTransitionContext *)context setOuterContext:v4];
    id v6 = [(BCCardStackTransitionContext *)v4 containerView];
    v7 = [(BCCardStackTransitionContext *)v4 viewForKey:UITransitionContextToViewKey];
    [v6 addSubview:v7];
  }
  [(BCCardStackTransitionAnimatorWrapper *)self _setupBeforeAnimationIfNeeded];
  if ([(BCCardStackTransitionContext *)self->_context isAnimated])
  {
    [(BCCardStackTransitionAnimator *)self->_animator animateTransition:self->_context];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2FD00;
    v8[3] = &unk_2C3C50;
    v8[4] = self;
    +[UIView performWithoutAnimation:v8];
  }
}

- (double)transitionDuration:(id)a3
{
  if (![(BCCardStackTransitionContext *)self->_context isAnimated]) {
    return 0.0;
  }
  animator = self->_animator;
  context = self->_context;

  [(BCCardStackTransitionAnimator *)animator transitionDuration:context];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupBeforeAnimationBlock, 0);
  objc_storeStrong(&self->_waitUntilReadyBlock, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_animator, 0);
}

@end