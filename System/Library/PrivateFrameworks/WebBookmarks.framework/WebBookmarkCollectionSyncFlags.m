@interface WebBookmarkCollectionSyncFlags
- (BOOL)postSyncNotificationWhenUnlocking;
- (BOOL)syncAllowed;
- (BOOL)unlockSyncRequested;
- (NSMutableSet)lockSyncHoldRequestorPointers;
- (WebBookmarkCollectionSyncFlags)initWithSyncAllowed:(BOOL)a3;
- (int)syncLockFileDescriptor;
- (int64_t)syncNotificationType;
- (void)setPostSyncNotificationWhenUnlocking:(BOOL)a3;
- (void)setSyncLockFileDescriptor:(int)a3;
- (void)setSyncNotificationType:(int64_t)a3;
- (void)setUnlockSyncRequested:(BOOL)a3;
@end

@implementation WebBookmarkCollectionSyncFlags

- (void)setSyncNotificationType:(int64_t)a3
{
  self->_syncNotificationType = a3;
}

- (int)syncLockFileDescriptor
{
  return self->_syncLockFileDescriptor;
}

- (void)setUnlockSyncRequested:(BOOL)a3
{
  self->_unlockSyncRequested = a3;
}

- (void)setSyncLockFileDescriptor:(int)a3
{
  self->_syncLockFileDescriptor = a3;
}

- (BOOL)postSyncNotificationWhenUnlocking
{
  return self->_postSyncNotificationWhenUnlocking;
}

- (NSMutableSet)lockSyncHoldRequestorPointers
{
  return self->_lockSyncHoldRequestorPointers;
}

- (WebBookmarkCollectionSyncFlags)initWithSyncAllowed:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WebBookmarkCollectionSyncFlags;
  v4 = [(WebBookmarkCollectionSyncFlags *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_syncAllowed = a3;
    v4->_syncLockFileDescriptor = -1;
    v4->_postSyncNotificationWhenUnlocking = 0;
    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    lockSyncHoldRequestorPointers = v5->_lockSyncHoldRequestorPointers;
    v5->_lockSyncHoldRequestorPointers = (NSMutableSet *)v6;

    v5->_syncNotificationType = 0;
    v8 = v5;
  }

  return v5;
}

- (BOOL)syncAllowed
{
  return self->_syncAllowed;
}

- (int64_t)syncNotificationType
{
  return self->_syncNotificationType;
}

- (void)setPostSyncNotificationWhenUnlocking:(BOOL)a3
{
  self->_postSyncNotificationWhenUnlocking = a3;
}

- (BOOL)unlockSyncRequested
{
  return self->_unlockSyncRequested;
}

- (void).cxx_destruct
{
}

@end