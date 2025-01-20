@interface _UIViewWeakCAAnimationDelegate
+ (id)weakAnimationDelegate:(id)a3;
- (CAAnimationDelegate)animationDelegate;
- (_UIViewWeakCAAnimationDelegate)initWithAnimationDelegate:(id)a3;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation _UIViewWeakCAAnimationDelegate

- (_UIViewWeakCAAnimationDelegate)initWithAnimationDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewWeakCAAnimationDelegate;
  v5 = [(_UIViewWeakCAAnimationDelegate *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_animationDelegate, v4);
    *(unsigned char *)&v6->_flags = *(unsigned char *)&v6->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&v6->_flags = *(unsigned char *)&v6->_flags & 0xFD | v7;
  }

  return v6;
}

+ (id)weakAnimationDelegate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAnimationDelegate:v4];

  return v5;
}

- (void)animationDidStart:(id)a3
{
  if (*(unsigned char *)&self->_flags)
  {
    p_animationDelegate = &self->_animationDelegate;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_animationDelegate);
    [WeakRetained animationDidStart:v4];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    BOOL v4 = a4;
    p_animationDelegate = &self->_animationDelegate;
    id v6 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_animationDelegate);
    [WeakRetained animationDidStop:v6 finished:v4];
  }
}

- (CAAnimationDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  return (CAAnimationDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end