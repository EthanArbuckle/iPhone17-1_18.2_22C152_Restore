@interface PLCAAnimationDelegate
- (id)completion;
- (id)start;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)setCompletion:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation PLCAAnimationDelegate

- (void)setStart:(id)a3
{
}

- (id)start
{
  return self->_start;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if ([(PLCAAnimationDelegate *)self completion])
  {
    v5 = *(void (**)(void))([(PLCAAnimationDelegate *)self completion] + 16);
    v5();
  }
}

- (void)animationDidStart:(id)a3
{
  if ([(PLCAAnimationDelegate *)self start])
  {
    v4 = *(void (**)(void))([(PLCAAnimationDelegate *)self start] + 16);
    v4();
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLCAAnimationDelegate;
  [(PLCAAnimationDelegate *)&v3 dealloc];
}

@end