@interface _AnimationManagerRunner
- (_AnimationManagerRunner)initWithAnimationManager:(void *)a3;
- (void)animationDidResume:(id)a3;
- (void)animationDidStop:(id)a3;
@end

@implementation _AnimationManagerRunner

- (_AnimationManagerRunner)initWithAnimationManager:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_AnimationManagerRunner;
  v4 = [(_AnimationManagerRunner *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_animationManager = a3;
    v6 = v4;
  }

  return v5;
}

- (void)animationDidStop:(id)a3
{
}

- (void)animationDidResume:(id)a3
{
}

@end