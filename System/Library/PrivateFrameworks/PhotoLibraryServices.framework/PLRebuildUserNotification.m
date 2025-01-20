@interface PLRebuildUserNotification
- (BOOL)_shouldShowUserNotification;
- (NSString)message;
- (PLRebuildUserNotification)initWithMessage:(id)a3;
- (int64_t)showAlertAndWaitForResponse;
- (void)_snoozeForHours:(unint64_t)a3;
@end

@implementation PLRebuildUserNotification

- (void).cxx_destruct
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)_snoozeForHours:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)a3 * 60.0 * 60.0];
  v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218242;
    unint64_t v9 = a3;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "PLRebuildUserNotification snooze for %tu hour(s) until %@", (uint8_t *)&v8, 0x16u);
  }

  [v6 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "setDouble:forKey:", @"PLRebuildUserNotificationSnoozeUntilTime");
  [v5 setObject:self->_message forKey:@"PLRebuildUserNotificationSnoozeLastMessageKey"];
}

- (BOOL)_shouldShowUserNotification
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[PLDeviceRestoreMigrationSupport isDataMigrationInProgress])
  {
    v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "PLRebuildUserNotification: Data migration is in progress. Not showing the alert.", (uint8_t *)&v13, 2u);
    }
    BOOL v4 = 0;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 doubleForKey:@"PLRebuildUserNotificationSnoozeUntilTime"];
    double v6 = v5;
    v7 = [v3 stringForKey:@"PLRebuildUserNotificationSnoozeLastMessageKey"];
    int v8 = [MEMORY[0x1E4F1C9C8] now];
    if ([v7 isEqualToString:self->_message]
      && ([v8 timeIntervalSinceReferenceDate], v9 < v6))
    {
      __int16 v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6];
        int v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Should NOT show PLRebuildUserNotification because of snooze until %@", (uint8_t *)&v13, 0xCu);
      }
      BOOL v4 = 0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (int64_t)showAlertAndWaitForResponse
{
  v25[7] = *MEMORY[0x1E4F143B8];
  if ([(PLRebuildUserNotification *)self _shouldShowUserNotification])
  {
    uint64_t v3 = *MEMORY[0x1E4F1D990];
    v25[0] = @"Photos Library Rebuild";
    uint64_t v4 = *MEMORY[0x1E4F1D9A8];
    v24[0] = v3;
    v24[1] = v4;
    double v5 = [(PLRebuildUserNotification *)self message];
    uint64_t v6 = *MEMORY[0x1E4F1D9E0];
    v25[1] = v5;
    v25[2] = @"Not now";
    uint64_t v7 = *MEMORY[0x1E4F1D9D0];
    v24[2] = v6;
    v24[3] = v7;
    uint64_t v8 = *MEMORY[0x1E4F1DA10];
    v25[3] = @"Rebuild";
    v25[4] = @"Ignore for 1 hour";
    uint64_t v9 = *MEMORY[0x1E4F1D9B8];
    v24[4] = v8;
    v24[5] = v9;
    v24[6] = *MEMORY[0x1E4FA7328];
    v25[5] = MEMORY[0x1E4F1CC38];
    v25[6] = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];

    SInt32 error = 0;
    v11 = CFUserNotificationCreate(0, 60.0, 3uLL, &error, v10);
    uint64_t v12 = PLBackendGetLog();
    int v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        message = self->_message;
        *(_DWORD *)buf = 138412290;
        v23 = message;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "PLRebuildUserNotification waiting for response to message: %@", buf, 0xCu);
      }

      CFOptionFlags v20 = 0;
      CFUserNotificationReceiveResponse(v11, 60.0, &v20);
      CFRelease(v11);
      CFOptionFlags v15 = v20 & 3;
      v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = [NSNumber numberWithUnsignedLong:v15];
        *(_DWORD *)buf = 138412290;
        v23 = v17;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "PLRebuildUserNotification buttonPressed is %@", buf, 0xCu);
      }
      switch(v15)
      {
        case 2uLL:
          [(PLRebuildUserNotification *)self _snoozeForHours:1];
LABEL_17:
          int64_t v18 = 2;
          goto LABEL_19;
        case 1uLL:
          int64_t v18 = 1;
          goto LABEL_19;
        case 0uLL:
          goto LABEL_17;
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = error;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Could not create user notification for rebuild: %d", buf, 8u);
      }
    }
    int64_t v18 = 0;
LABEL_19:

    return v18;
  }
  return 2;
}

- (PLRebuildUserNotification)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRebuildUserNotification;
  uint64_t v6 = [(PLRebuildUserNotification *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

@end