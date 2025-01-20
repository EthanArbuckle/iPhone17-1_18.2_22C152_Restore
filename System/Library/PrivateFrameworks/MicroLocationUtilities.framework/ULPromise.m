@interface ULPromise
+ (id)promise;
- (BOOL)respondsToSelector:(SEL)a3;
- (ULFuture)future;
- (ULPromise)init;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)cancel;
@end

@implementation ULPromise

+ (id)promise
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (ULPromise)init
{
  v6.receiver = self;
  v6.super_class = (Class)ULPromise;
  id v2 = [(ULPromise *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ULFuture);
    future = v2->_future;
    v2->_future = v3;
  }
  return v2;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ULPromise;
  if (-[ULPromise respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ULPromise;
  objc_super v5 = -[ULPromise methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(ULFuture *)self->_future methodSignatureForSelector:a3];
  }
  v8 = v7;

  return v8;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_future;
}

- (void)cancel
{
}

- (ULFuture)future
{
  return (ULFuture *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end