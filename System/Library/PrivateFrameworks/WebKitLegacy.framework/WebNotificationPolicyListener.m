@interface WebNotificationPolicyListener
- (BOOL)shouldClearCache;
- (WebNotificationPolicyListener)initWithPermissionHandler:(void *)a3;
- (id).cxx_construct;
- (void)allow;
- (void)deny;
@end

@implementation WebNotificationPolicyListener

- (WebNotificationPolicyListener)initWithPermissionHandler:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WebNotificationPolicyListener;
  v4 = [(WebNotificationPolicyListener *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)a3;
    *(void *)a3 = 0;
    value = v4->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_;
    v5->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_ = v6;
    if (value) {
      (*(void (**)(void *))(*(void *)value + 8))(value);
    }
  }
  return v5;
}

- (void)allow
{
  value = self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  if (value)
  {
    self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    (*(void (**)(void *, uint64_t))(*(void *)value + 16))(value, 2);
    v3 = *(void (**)(void *))(*(void *)value + 8);
    v3(value);
  }
}

- (void)deny
{
  value = self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  if (value)
  {
    self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    (*(void (**)(void *, uint64_t))(*(void *)value + 16))(value, 1);
    v3 = *(void (**)(void *))(*(void *)value + 8);
    v3(value);
  }
}

- (BOOL)shouldClearCache
{
  return 0;
}

- (void).cxx_destruct
{
  value = self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end