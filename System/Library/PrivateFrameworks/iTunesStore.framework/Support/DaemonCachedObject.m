@interface DaemonCachedObject
- (id)copyExpirationTimer;
- (id)object;
- (void)dealloc;
- (void)setExpirationTimer:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation DaemonCachedObject

- (void)dealloc
{
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)expirationTimer);
    dispatch_release((dispatch_object_t)self->_expirationTimer);
  }

  v4.receiver = self;
  v4.super_class = (Class)DaemonCachedObject;
  [(DaemonCachedObject *)&v4 dealloc];
}

- (id)copyExpirationTimer
{
  expirationTimer = self->_expirationTimer;
  if (expirationTimer) {
    dispatch_retain((dispatch_object_t)self->_expirationTimer);
  }
  return expirationTimer;
}

- (void)setExpirationTimer:(id)a3
{
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)expirationTimer);
    dispatch_release((dispatch_object_t)self->_expirationTimer);
  }
  self->_expirationTimer = (OS_dispatch_source *)a3;
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

@end