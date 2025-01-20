@interface URTUserNotificationPresentation
+ (void)invokeHandlerForUserNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
+ (void)registerUserNotification:(__CFUserNotification *)a3 handler:(id)a4;
+ (void)unregisterHandlerForUserNotification:(__CFUserNotification *)a3;
- (NSDictionary)contents;
- (URTUserNotificationPresentation)initWithContents:(id)a3 flags:(unint64_t)a4;
- (__CFRunLoopSource)createRunLoopSourceOrdered:(int64_t)a3 handler:(id)a4;
- (int)error;
- (unint64_t)creationFlags;
- (void)dismiss;
- (void)invalidate;
- (void)present;
@end

@implementation URTUserNotificationPresentation

+ (void)registerUserNotification:(__CFUserNotification *)a3 handler:(id)a4
{
  id v8 = a4;
  if (registerUserNotification_handler__onceToken != -1) {
    dispatch_once(&registerUserNotification_handler__onceToken, &__block_literal_global_0);
  }
  id v5 = (id)handlersForUserNotifications;
  objc_sync_enter(v5);
  v6 = (void *)handlersForUserNotifications;
  v7 = (void *)MEMORY[0x22A64BD90](v8);
  [v6 setObject:v7 forKey:a3];

  objc_sync_exit(v5);
}

uint64_t __68__URTUserNotificationPresentation_registerUserNotification_handler___block_invoke()
{
  handlersForUserNotifications = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:1];
  return MEMORY[0x270F9A758]();
}

+ (void)invokeHandlerForUserNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  id v6 = (id)handlersForUserNotifications;
  objc_sync_enter(v6);
  uint64_t v8 = [(id)handlersForUserNotifications objectForKey:a3];
  [(id)handlersForUserNotifications removeObjectForKey:a3];
  objc_sync_exit(v6);

  v7 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, __CFUserNotification *, unint64_t))(v8 + 16))(v8, a3, a4);
    v7 = (void *)v8;
  }
}

+ (void)unregisterHandlerForUserNotification:(__CFUserNotification *)a3
{
  id obj = (id)handlersForUserNotifications;
  objc_sync_enter(obj);
  [(id)handlersForUserNotifications removeObjectForKey:a3];
  objc_sync_exit(obj);
}

- (URTUserNotificationPresentation)initWithContents:(id)a3 flags:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)URTUserNotificationPresentation;
  uint64_t v8 = [(URTUserNotificationPresentation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_error = 0;
    objc_storeStrong((id *)&v8->_contents, a3);
    v9->_creationFlags = a4;
  }

  return v9;
}

- (__CFRunLoopSource)createRunLoopSourceOrdered:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  [(id)objc_opt_class() registerUserNotification:self->_userNotification handler:v6];

  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  userNotification = self->_userNotification;
  return CFUserNotificationCreateRunLoopSource(v7, userNotification, (CFUserNotificationCallBack)_URTUserNotificationRunLoopCallback, a3);
}

- (void)present
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_2262C3000, a2, OS_LOG_TYPE_ERROR, "failed to create CFUserNotification, error %i", (uint8_t *)v3, 8u);
}

- (void)dismiss
{
  userNotification = self->_userNotification;
  if (userNotification) {
    CFUserNotificationCancel(userNotification);
  }
}

- (void)invalidate
{
  if (self->_userNotification)
  {
    [(id)objc_opt_class() unregisterHandlerForUserNotification:self->_userNotification];
    CFRelease(self->_userNotification);
    self->_userNotification = 0;
  }
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (unint64_t)creationFlags
{
  return self->_creationFlags;
}

- (int)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end