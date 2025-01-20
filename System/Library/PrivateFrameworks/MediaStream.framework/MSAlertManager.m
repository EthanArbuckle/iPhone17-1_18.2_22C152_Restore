@interface MSAlertManager
+ (id)sharedAlertManager;
- (MSAlertManager)init;
- (void)_dismissNotificationForPersonID:(id)a3;
- (void)_showNotificationInfo:(id)a3;
- (void)_userDidRespondToNotification:(__CFUserNotification *)a3 info:(id)a4 responseFlags:(unint64_t)a5;
- (void)displayAlertForPersonID:(id)a3 notificationDict:(id)a4 completionBlock:(id)a5;
@end

@implementation MSAlertManager

- (void).cxx_destruct
{
}

- (void)displayAlertForPersonID:(id)a3 notificationDict:(id)a4 completionBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  SInt32 error = 0;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, &error, (CFDictionaryRef)a4);
  if (v11)
  {
    v12 = v11;
    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(v10, v11, (CFUserNotificationCallBack)_notificationCallBack, 0);
    if (RunLoopSource)
    {
      CFRunLoopSourceRef v14 = RunLoopSource;
      v15 = +[MSAMNotificationInfo info];
      [v15 setOwner:self];
      [v15 setPersonID:v8];
      [v15 setRunLoopSource:v14];
      [v15 setUserNotification:v12];
      [v15 setCompletionBlock:v9];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Showing alert to user.", buf, 2u);
      }
      [(MSAlertManager *)self _showNotificationInfo:v15];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create user notification run loop source. Cannot display notification.", buf, 2u);
      }
      CFRelease(v12);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = error;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create user notification. Error: %ld", buf, 0xCu);
  }
}

- (void)_showNotificationInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 personID];
  [(MSAlertManager *)self _dismissNotificationForPersonID:v5];

  Mutable = (__CFDictionary *)_notificationToInfo_dict;
  if (!_notificationToInfo_dict)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    _notificationToInfo_dict = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, (const void *)[v4 userNotification], v4);
  personIDToNotification = self->_personIDToNotification;
  uint64_t v8 = [v4 userNotification];
  id v9 = [v4 personID];
  [(NSMutableDictionary *)personIDToNotification setObject:v8 forKey:v9];

  CFAllocatorRef v10 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  v11 = (__CFRunLoop *)[v10 getCFRunLoop];
  v12 = (__CFRunLoopSource *)[v4 runLoopSource];

  CFRunLoopAddSource(v11, v12, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  id v13 = +[MSPowerAssertionManager sharedManager];
  [v13 retainUIBusy];
}

- (void)_dismissNotificationForPersonID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_personIDToNotification objectForKey:v4];

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Dismissing notification for personID %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v6 = [(NSMutableDictionary *)self->_personIDToNotification objectForKey:v4];
    if (v6)
    {
      v7 = (void *)v6;
      CFDictionaryRef Mutable = (const __CFDictionary *)_notificationToInfo_dict;
      if (!_notificationToInfo_dict)
      {
        CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        _notificationToInfo_dict = (uint64_t)Mutable;
      }
      id v9 = CFDictionaryGetValue(Mutable, v7);
      CFUserNotificationCancel((CFUserNotificationRef)v7);
      [(NSMutableDictionary *)self->_personIDToNotification removeObjectForKey:v4];
      CFAllocatorRef v10 = (__CFDictionary *)_notificationToInfo_dict;
      if (!_notificationToInfo_dict)
      {
        CFAllocatorRef v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        _notificationToInfo_dict = (uint64_t)v10;
      }
      CFDictionaryRemoveValue(v10, v7);
      v11 = [v9 completionBlock];

      if (v11)
      {
        v12 = [v9 completionBlock];
        v12[2](v12, 0, 3);
      }
      id v13 = +[MSPowerAssertionManager sharedManager];
      [v13 releaseUIBusy];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot find notification associated with person ID %@ to dismiss. Ignoring.", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_userDidRespondToNotification:(__CFUserNotification *)a3 info:(id)a4 responseFlags:(unint64_t)a5
{
  id v14 = a4;
  CFDictionaryRef Mutable = (__CFDictionary *)_notificationToInfo_dict;
  if (!_notificationToInfo_dict)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    _notificationToInfo_dict = (uint64_t)Mutable;
  }
  CFDictionaryRemoveValue(Mutable, a3);
  personIDToNotification = self->_personIDToNotification;
  CFAllocatorRef v10 = [v14 personID];
  [(NSMutableDictionary *)personIDToNotification removeObjectForKey:v10];

  v11 = [v14 completionBlock];

  if (v11)
  {
    v12 = [v14 completionBlock];
    v12[2](v12, 1, a5);
  }
  id v13 = +[MSPowerAssertionManager sharedManager];
  [v13 releaseUIBusy];
}

- (MSAlertManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSAlertManager;
  v2 = [(MSAlertManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    personIDToNotification = v2->_personIDToNotification;
    v2->_personIDToNotification = v3;
  }
  return v2;
}

+ (id)sharedAlertManager
{
  if (sharedAlertManager_onceToken != -1) {
    dispatch_once(&sharedAlertManager_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)sharedAlertManager_mgr;

  return v2;
}

uint64_t __36__MSAlertManager_sharedAlertManager__block_invoke()
{
  sharedAlertManager_mgr = objc_alloc_init(MSAlertManager);

  return MEMORY[0x1F41817F8]();
}

@end