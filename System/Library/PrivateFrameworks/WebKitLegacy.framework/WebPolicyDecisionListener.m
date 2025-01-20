@interface WebPolicyDecisionListener
- (id)_initWithTarget:(id)a3 action:(SEL)a4;
- (void)_invalidate;
- (void)_usePolicy:(unsigned __int8)a3;
- (void)dealloc;
- (void)download;
- (void)ignore;
- (void)use;
@end

@implementation WebPolicyDecisionListener

- (id)_initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WebPolicyDecisionListener;
  v6 = [(WebPolicyDecisionListener *)&v8 init];
  if (v6) {
    v6->_private = [[WebPolicyDecisionListenerPrivate alloc] initWithTarget:a3 action:a4];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebPolicyDecisionListener;
  [(WebPolicyDecisionListener *)&v3 dealloc];
}

- (void)_usePolicy:(unsigned __int8)a3
{
  objc_super v3 = self->_private;
  m_ptr = v3->target.m_ptr;
  if (m_ptr)
  {
    action = v3->action;
    if (action) {
      objc_msgSend(m_ptr, action, a3);
    }
    else {
      objc_msgSend(m_ptr, 0, a3);
    }
  }
}

- (void)_invalidate
{
  v2 = self->_private;
  m_ptr = v2->target.m_ptr;
  v2->target.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (void)use
{
}

- (void)ignore
{
}

- (void)download
{
}

@end