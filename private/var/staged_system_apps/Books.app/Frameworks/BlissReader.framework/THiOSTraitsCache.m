@interface THiOSTraitsCache
- (BOOL)isCompactHeight;
- (BOOL)isCompactWidth;
- (THiOSTraitsCache)init;
- (void)setCompactHeight:(BOOL)a3;
- (void)setCompactWidth:(BOOL)a3;
- (void)updateTraitsWithCollection:(id)a3;
@end

@implementation THiOSTraitsCache

- (THiOSTraitsCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)THiOSTraitsCache;
  result = [(THiOSTraitsCache *)&v3 init];
  if (result) {
    result->_accessLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)updateTraitsWithCollection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v5 = [v4 horizontalSizeClass] == (char *)&dword_0 + 1;
  [v4 horizontalSizeClass];
  BOOL v6 = [v4 verticalSizeClass] == (char *)&dword_0 + 1;
  [v4 verticalSizeClass];

  os_unfair_lock_lock(&self->_accessLock);
  self->mCompactWidth = v5;
  self->mCompactHeight = v6;

  os_unfair_lock_unlock(&self->_accessLock);
}

- (BOOL)isCompactWidth
{
  v2 = self;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  LOBYTE(v2) = v2->mCompactWidth;
  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (BOOL)isCompactHeight
{
  v2 = self;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  LOBYTE(v2) = v2->mCompactHeight;
  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (void)setCompactWidth:(BOOL)a3
{
  self->mCompactWidth = a3;
}

- (void)setCompactHeight:(BOOL)a3
{
  self->mCompactHeight = a3;
}

@end