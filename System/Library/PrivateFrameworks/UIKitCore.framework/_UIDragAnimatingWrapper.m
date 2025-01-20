@interface _UIDragAnimatingWrapper
- (_UIDragAnimatingWrapper)initWithPropertyAnimator:(id)a3;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
@end

@implementation _UIDragAnimatingWrapper

- (_UIDragAnimatingWrapper)initWithPropertyAnimator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDragAnimatingWrapper;
  v6 = [(_UIDragAnimatingWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_animator, a3);
  }

  return v7;
}

- (void)addAnimations:(id)a3
{
}

- (void)addCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end