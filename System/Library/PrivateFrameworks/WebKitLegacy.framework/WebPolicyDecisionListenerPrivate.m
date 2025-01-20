@interface WebPolicyDecisionListenerPrivate
- (WebPolicyDecisionListenerPrivate)initWithTarget:(id)a3 action:(SEL)a4;
- (id).cxx_construct;
@end

@implementation WebPolicyDecisionListenerPrivate

- (WebPolicyDecisionListenerPrivate)initWithTarget:(id)a3 action:(SEL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WebPolicyDecisionListenerPrivate;
  v6 = [(WebPolicyDecisionListenerPrivate *)&v10 init];
  if (v6)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v6->target.m_ptr;
    v6->target.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (a4) {
      SEL v8 = a4;
    }
    else {
      SEL v8 = 0;
    }
    v6->action = v8;
  }
  return v6;
}

- (void).cxx_destruct
{
  m_ptr = self->target.m_ptr;
  self->target.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end