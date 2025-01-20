@interface WebMainThreadInvoker
- (WebMainThreadInvoker)initWithTarget:(id)a3;
- (id).cxx_construct;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)handleException:(id)a3;
@end

@implementation WebMainThreadInvoker

- (WebMainThreadInvoker)initWithTarget:(id)a3
{
  self->target = a3;
  return self;
}

- (void)forwardInvocation:(id)a3
{
  [a3 setTarget:self->target];
  [a3 performSelectorOnMainThread:sel__webkit_invokeAndHandleException_ withObject:self waitUntilDone:1];
  m_ptr = self->exception.m_ptr;
  if (m_ptr)
  {
    self->exception.m_ptr = 0;
    id v7 = (id)CFMakeCollectable(m_ptr);
    objc_exception_throw(v7);
  }
  if (strchr((char *)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "methodReturnType"), 64))
  {
    CFTypeRef cf = 0;
    [a3 getReturnValue:&cf];
    CFTypeRef v6 = (id)CFMakeCollectable(cf);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->target methodSignatureForSelector:a3];
}

- (void)handleException:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->exception.m_ptr;
  self->exception.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->exception.m_ptr;
  self->exception.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end