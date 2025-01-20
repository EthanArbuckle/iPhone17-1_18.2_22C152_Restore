@interface _UIRemoteViewControllerWeakWrapperProxy
+ (id)wrapperWithTarget:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
@end

@implementation _UIRemoteViewControllerWeakWrapperProxy

+ (id)wrapperWithTarget:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UIRemoteViewControllerWeakWrapperProxy);
  objc_storeWeak(&v4->_target, v3);
  uint64_t v5 = objc_opt_class();

  v4->_targetClass = (Class)v5;
  return v4;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(objc_class *)self->_targetClass instanceMethodSignatureForSelector:a3];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end