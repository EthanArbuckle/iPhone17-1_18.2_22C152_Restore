@interface SFBlockBasedCAAnimationDelegate
+ (id)animationDelegateWithDidStopBlock:(id)a3;
- (id)animationDidStopBlock;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)associateLifetimeWithAnimation:(id)a3;
- (void)setAnimationDidStopBlock:(id)a3;
@end

@implementation SFBlockBasedCAAnimationDelegate

+ (id)animationDelegateWithDidStopBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setAnimationDidStopBlock:v4];

  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  animationDidStopBlock = (void (**)(id, id, BOOL))self->_animationDidStopBlock;
  id v8 = v6;
  if (animationDidStopBlock)
  {
    animationDidStopBlock[2](animationDidStopBlock, v6, v4);
    id v6 = v8;
  }
  [v6 setValue:0 forKey:@"blockBasedAnimationDelegate"];
}

- (void)associateLifetimeWithAnimation:(id)a3
{
}

- (id)animationDidStopBlock
{
  return self->_animationDidStopBlock;
}

- (void)setAnimationDidStopBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end