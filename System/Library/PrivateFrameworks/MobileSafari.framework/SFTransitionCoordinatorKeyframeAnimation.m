@interface SFTransitionCoordinatorKeyframeAnimation
- (double)initWithStartTime:(double)a3 duration:(double)a4 animations:;
- (void)invokeInContext:(id)a3;
@end

@implementation SFTransitionCoordinatorKeyframeAnimation

- (double)initWithStartTime:(double)a3 duration:(double)a4 animations:
{
  if (!a1) {
    return 0;
  }
  v11.receiver = a1;
  v11.super_class = (Class)SFTransitionCoordinatorKeyframeAnimation;
  id v6 = a2;
  v7 = (double *)objc_msgSendSuper2(&v11, sel_init);
  v8 = _Block_copy(v6);

  v9 = (void *)*((void *)v7 + 1);
  *((void *)v7 + 1) = v8;

  v7[2] = a4;
  v7[3] = a3;
  return v7;
}

- (void)invokeInContext:(id)a3
{
  id v4 = a3;
  if ([v4 usesKeyframeAnimations])
  {
    v5 = (void *)MEMORY[0x1E4FB1EB0];
    double duration = self->_duration;
    double startTime = self->_startTime;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__SFTransitionCoordinatorKeyframeAnimation_invokeInContext___block_invoke;
    v8[3] = &unk_1E54E9A60;
    v8[4] = self;
    id v9 = v4;
    [v5 addKeyframeWithRelativeStartTime:v8 relativeDuration:startTime animations:duration];
  }
  else
  {
    (*((void (**)(void))self->_animations + 2))();
  }
}

uint64_t __60__SFTransitionCoordinatorKeyframeAnimation_invokeInContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
}

- (void).cxx_destruct
{
}

@end