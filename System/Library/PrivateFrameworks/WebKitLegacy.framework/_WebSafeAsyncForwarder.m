@interface _WebSafeAsyncForwarder
- (BOOL)respondsToSelector:(SEL)a3;
- (_WebSafeAsyncForwarder)initWithForwarder:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (uint64_t)forwardInvocation:(WTF *)this;
- (uint64_t)forwardInvocation:(uint64_t)a1;
- (void)forwardInvocation:(id)a3;
- (void)forwardInvocation:(void *)a1;
@end

@implementation _WebSafeAsyncForwarder

- (_WebSafeAsyncForwarder)initWithForwarder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WebSafeAsyncForwarder;
  v4 = [(_WebSafeAsyncForwarder *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak((id *)&v4->_forwarder, a3);
  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  if (WebThreadIsCurrent())
  {
    WTF::RunLoop::main((WTF::RunLoop *)[a3 retainArguments]);
    id Weak = objc_loadWeak((id *)&self->_forwarder);
    id v6 = Weak;
    if (Weak) {
      CFRetain(Weak);
    }
    if (a3) {
      CFRetain(a3);
    }
    objc_super v7 = (void *)WTF::fastMalloc((WTF *)0x18);
    *objc_super v7 = &unk_1F3C7B588;
    v7[1] = v6;
    v7[2] = a3;
    v9 = v7;
    WTF::RunLoop::dispatch();
    if (v9) {
      (*(void (**)(void *))(*v9 + 8))(v9);
    }
  }
  else
  {
    id v8 = objc_loadWeak((id *)&self->_forwarder);
    [v8 forwardInvocation:a3];
  }
}

- (uint64_t)forwardInvocation:(uint64_t)a1
{
  return [*(id *)(a1 + 8) forwardInvocation:*(void *)(a1 + 16)];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id Weak = objc_loadWeak((id *)&self->_forwarder);
  return (id)[Weak methodSignatureForSelector:a3];
}

- (void).cxx_destruct
{
}

- (void)forwardInvocation:(void *)a1
{
  *a1 = &unk_1F3C7B588;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)forwardInvocation:(WTF *)this
{
  *(void *)this = &unk_1F3C7B588;
  v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }
  return WTF::fastFree(this, a2);
}

@end