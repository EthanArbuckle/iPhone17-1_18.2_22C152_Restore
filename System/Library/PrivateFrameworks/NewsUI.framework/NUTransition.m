@interface NUTransition
+ (id)animation;
- (id)completion;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setCompletion:(id)a3;
@end

@implementation NUTransition

+ (id)animation
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NUTransition;
  v2 = objc_msgSendSuper2(&v4, sel_animation);
  [v2 setDelegate:v2];

  return v2;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(NUTransition *)self completion];

  if (v6)
  {
    v7 = [(NUTransition *)self completion];
    v7[2](v7, v4);
  }

  [(NUTransition *)self setDelegate:0];
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