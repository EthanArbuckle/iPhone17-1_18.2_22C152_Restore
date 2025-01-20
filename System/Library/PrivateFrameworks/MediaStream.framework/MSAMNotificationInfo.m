@interface MSAMNotificationInfo
+ (id)info;
- (MSAlertManager)owner;
- (NSString)personID;
- (__CFRunLoopSource)runLoopSource;
- (__CFUserNotification)userNotification;
- (id)completionBlock;
- (void)dealloc;
- (void)setCompletionBlock:(id)a3;
- (void)setOwner:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setUserNotification:(__CFUserNotification *)a3;
@end

@implementation MSAMNotificationInfo

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_personID, 0);

  objc_destroyWeak((id *)&self->_owner);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setPersonID:(id)a3
{
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setOwner:(id)a3
{
}

- (MSAlertManager)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (MSAlertManager *)WeakRetained;
}

- (void)dealloc
{
  userNotification = self->_userNotification;
  if (userNotification) {
    CFRelease(userNotification);
  }
  if (self->_runLoopSource)
  {
    v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    v5 = (__CFRunLoop *)[v4 getCFRunLoop];
    CFRunLoopRemoveSource(v5, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);

    CFRelease(self->_runLoopSource);
  }
  v6.receiver = self;
  v6.super_class = (Class)MSAMNotificationInfo;
  [(MSAMNotificationInfo *)&v6 dealloc];
}

- (void)setUserNotification:(__CFUserNotification *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  userNotification = self->_userNotification;
  if (userNotification) {
    CFRelease(userNotification);
  }
  self->_userNotification = a3;
}

- (__CFUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  if (self->_runLoopSource)
  {
    v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    objc_super v6 = (__CFRunLoop *)[v5 getCFRunLoop];
    CFRunLoopRemoveSource(v6, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);

    CFRelease(self->_runLoopSource);
  }
  self->_runLoopSource = a3;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

+ (id)info
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

@end