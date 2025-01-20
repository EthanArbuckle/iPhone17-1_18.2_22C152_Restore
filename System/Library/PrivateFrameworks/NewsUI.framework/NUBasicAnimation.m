@interface NUBasicAnimation
+ (id)animationWithKeyPath:(id)a3;
- (id)completion;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setCompletion:(id)a3;
@end

@implementation NUBasicAnimation

+ (id)animationWithKeyPath:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___NUBasicAnimation;
  v3 = objc_msgSendSuper2(&v5, sel_animationWithKeyPath_, a3);
  [v3 setDelegate:v3];

  return v3;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(NUBasicAnimation *)self completion];

  if (v6)
  {
    v7 = [(NUBasicAnimation *)self completion];
    v7[2](v7, v4);
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end