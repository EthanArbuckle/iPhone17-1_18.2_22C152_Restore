@interface ICSBackupManager
+ (NSString)defaultSubtitle;
+ (NSString)notificationName;
+ (id)bundleIDFor:(id)a3;
+ (id)displayNameFor:(id)a3;
- (BOOL)_backupDidFail;
- (BOOL)_shouldShowFailedMessageForErrorCode:(int64_t)a3;
- (BOOL)hasBackupError;
- (ICSBackupManager)initWithAccount:(id)a3;
- (id)_localizedHistoricalDurationStringFromDate:(id)a3 toDate:(id)a4;
- (id)dateOfLastBackup;
- (int64_t)_numberOfWeeksSinceLastBackup:(id)a3;
- (void)dateOfLastBackup;
- (void)fetchBackupDetailLabelWithCompletion:(id)a3;
- (void)fetchBackupStatusDotColorWithCompletion:(id)a3;
- (void)fetchBackupSubtitleWithCompletion:(id)a3;
- (void)fetchVisibleDomainInfoList:(id)a3;
@end

@implementation ICSBackupManager

- (ICSBackupManager)initWithAccount:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICSBackupManager;
  v5 = [(ICSBackupManager *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F559D8]);
    id v12 = 0;
    uint64_t v7 = [v6 initWithAccount:v4 delegate:v5 eventQueue:MEMORY[0x263EF83A0] error:&v12];
    id v8 = v12;
    mbManager = v5->_mbManager;
    v5->_mbManager = (MBManager *)v7;

    if (v8)
    {
      v10 = LogSubsystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ICSBackupManager initWithAccount:]();
      }
    }
  }

  return v5;
}

- (void)fetchBackupDetailLabelWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(2, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke;
  v7[3] = &unk_2655B5AC8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[1] backupState];
    int v5 = [v4 state];

    if ((v5 - 1) > 1)
    {
      id v8 = [v3[1] restoreState];
      int v9 = [v8 state];

      if ((v9 - 1) > 1)
      {
        if ([v3[1] isBackupEnabled])
        {
          id v11 = v3[1];
          id v28 = 0;
          id v12 = [v11 dateOfLastBackupWithError:&v28];
          id v7 = v28;
          if (v7)
          {
            objc_super v13 = LogSubsystem();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_cold_1();
            }
          }
          v14 = LogSubsystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v12;
            _os_log_impl(&dword_262993000, v14, OS_LOG_TYPE_DEFAULT, "Last backup date: %@", buf, 0xCu);
          }

          if (v12)
          {
            v21[0] = MEMORY[0x263EF8330];
            v21[1] = 3221225472;
            v21[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2_49;
            v21[3] = &unk_2655B5AA0;
            id v22 = v12;
            id v15 = *(id *)(a1 + 40);
            uint64_t v23 = *(void *)(a1 + 32);
            id v24 = v15;
            dispatch_async(MEMORY[0x263EF83A0], v21);

            id v16 = v22;
          }
          else
          {
            v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v19 = [v18 localizedStringForKey:@"SUBTITLE_ON" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];

            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            v25[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_48;
            v25[3] = &unk_2655B5A78;
            id v20 = *(id *)(a1 + 40);
            id v26 = v19;
            id v27 = v20;
            id v16 = v19;
            dispatch_async(MEMORY[0x263EF83A0], v25);
          }
        }
        else
        {
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_4;
          v29[3] = &unk_2655B5A78;
          id v17 = *(id *)(a1 + 40);
          v29[4] = *(void *)(a1 + 32);
          id v30 = v17;
          dispatch_async(MEMORY[0x263EF83A0], v29);
          id v7 = v30;
        }
      }
      else
      {
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_3;
        v31[3] = &unk_2655B5A78;
        id v10 = *(id *)(a1 + 40);
        v31[4] = *(void *)(a1 + 32);
        id v32 = v10;
        dispatch_async(MEMORY[0x263EF83A0], v31);
        id v7 = v32;
      }
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2;
      block[3] = &unk_2655B5A78;
      id v6 = *(id *)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      id v34 = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);
      id v7 = v34;
    }
  }
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v2 = [v3 localizedStringForKey:@"IN_PROGRESS_SUBTITLE" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v2 = [v3 localizedStringForKey:@"SUBTITLE_RESTORE_IN_PROGRESS" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v2 = [v3 localizedStringForKey:@"SUBTITLE_OFF" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2_49(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v3 = v2;
  id v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2_49_cold_1(v4, v3);
  }

  id v6 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [MEMORY[0x263EFF910] date];
  int v9 = [v6 _localizedHistoricalDurationStringFromDate:v7 toDate:v8];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);
}

- (void)fetchBackupSubtitleWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = dispatch_get_global_queue(2, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke;
  v7[3] = &unk_2655B5AF0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[1];
    id v19 = 0;
    uint64_t v5 = [v4 dateOfLastBackupWithError:&v19];
    id v6 = v19;
    if (v6)
    {
      uint64_t v7 = LogSubsystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_cold_1();
      }
    }
    id v8 = LogSubsystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "Last backup date: %@", buf, 0xCu);
    }

    if (v5)
    {
      id v9 = a1 + 4;
      if ([a1[4] _numberOfWeeksSinceLastBackup:v5] > 12)
      {
        id v15 = v18;
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_51;
        v18[3] = &unk_2655B5A78;
        v18[5] = a1[5];
LABEL_21:
        v15[4] = *v9;
        dispatch_async(MEMORY[0x263EF83A0], v15);

        goto LABEL_22;
      }
      id v10 = LogSubsystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_cold_1(v10);
      }
    }
    if ([v3[1] isBackupEnabled])
    {
      id v11 = [v3[1] backupState];
      if ([v11 state] == 6)
      {
        id v12 = [v3[1] backupState];
        objc_super v13 = [v12 error];
        int v14 = objc_msgSend(v3, "_shouldShowFailedMessageForErrorCode:", objc_msgSend(v13, "code"));

        if (v14)
        {
          id v15 = v17;
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_55;
          v17[3] = &unk_2655B5A78;
          v17[5] = a1[5];
LABEL_20:
          id v9 = a1 + 4;
          goto LABEL_21;
        }
      }
      else
      {
      }
    }
    id v15 = v16;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_2;
    v16[3] = &unk_2655B5A78;
    v16[5] = a1[5];
    goto LABEL_20;
  }
LABEL_22:
}

void __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_51(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v2 = [v3 localizedStringForKey:@"BACKUP_NEEDED" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_55(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v2 = [v3 localizedStringForKey:@"FAILED_SUBTITLE" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [(id)objc_opt_class() defaultSubtitle];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)fetchBackupStatusDotColorWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke;
  block[3] = &unk_2655B5B18;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[1] isBackupEnabled])
    {
      char v4 = [v3 _backupDidFail];
      uint64_t v5 = (id *)v6;
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke_3;
      v6[3] = &unk_2655B56D8;
      char v7 = v4;
    }
    else
    {
      uint64_t v5 = (id *)v8;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke_2;
      v8[3] = &unk_2655B5728;
    }
    v5[4] = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

void __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F825C8] systemGrayColor];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    [MEMORY[0x263F825C8] systemRedColor];
  }
  else {
  id v2 = [MEMORY[0x263F825C8] systemGreenColor];
  }
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)fetchVisibleDomainInfoList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__ICSBackupManager_fetchVisibleDomainInfoList___block_invoke;
  v7[3] = &unk_2655B5750;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__ICSBackupManager_fetchVisibleDomainInfoList___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) domainInfoList];
  id v4 = v3;
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
          id v10 = [getPSGBackupUtilsClass() bundleIdForDomainInfo:v9];
          if (([getPSGBackupUtilsClass() shouldIgnoreBundleId:v10] & 1) == 0) {
            [v2 addObject:v9];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (NSString)notificationName
{
  return (NSString *)(id)*MEMORY[0x263F55A08];
}

+ (NSString)defaultSubtitle
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"THIS_DEVICE"];
  id v4 = [v2 localizedStringForKey:v3 value:&stru_270DEF3F8 table:@"Localizable-iCloud"];

  return (NSString *)v4;
}

- (BOOL)hasBackupError
{
  int v3 = [(MBManager *)self->_mbManager isBackupEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(ICSBackupManager *)self _backupDidFail];
  }
  return v3;
}

- (BOOL)_backupDidFail
{
  int v3 = [(MBManager *)self->_mbManager backupState];
  if ([v3 state] == 6)
  {
    id v4 = [(MBManager *)self->_mbManager backupState];
    uint64_t v5 = [v4 error];
    BOOL v6 = -[ICSBackupManager _shouldShowFailedMessageForErrorCode:](self, "_shouldShowFailedMessageForErrorCode:", [v5 code]);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldShowFailedMessageForErrorCode:(int64_t)a3
{
  return a3 != 13 && a3 != 209 && a3 != 300 && (a3 & 0xFFFFFFFFFFFFFFFBLL) != 304 && a3 != 202;
}

+ (id)displayNameFor:(id)a3
{
  id v3 = a3;
  id v4 = [getPSGBackupUtilsClass() displayNameForDomainInfo:v3];

  return v4;
}

+ (id)bundleIDFor:(id)a3
{
  id v3 = a3;
  id v4 = [getPSGBackupUtilsClass() bundleIdForDomainInfo:v3];

  return v4;
}

- (id)dateOfLastBackup
{
  mbManager = self->_mbManager;
  id v8 = 0;
  id v3 = [(MBManager *)mbManager dateOfLastBackupWithError:&v8];
  id v4 = v8;
  if (v4)
  {
    uint64_t v5 = LogSubsystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICSBackupManager dateOfLastBackup]();
    }

    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)_localizedHistoricalDurationStringFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 currentCalendar];
  uint64_t v9 = [v8 components:8432 fromDate:v7 toDate:v6 options:0];

  if ([v9 weekOfYear] < 1)
  {
    if ([v9 day] < 1)
    {
      if ([v9 hour] < 1)
      {
        if ([v9 minute] < 1)
        {
          if ([v9 second] < 1) {
            goto LABEL_3;
          }
          long long v11 = NSString;
          long long v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          long long v13 = [v12 localizedStringForKey:@"X_SECONDS_AGO" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
          uint64_t v14 = [v9 second];
        }
        else
        {
          long long v11 = NSString;
          long long v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          long long v13 = [v12 localizedStringForKey:@"X_MINUTES_AGO" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
          uint64_t v14 = [v9 minute];
        }
      }
      else
      {
        long long v11 = NSString;
        long long v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        long long v13 = [v12 localizedStringForKey:@"X_HOURS_AGO" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
        uint64_t v14 = [v9 hour];
      }
    }
    else
    {
      long long v11 = NSString;
      long long v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v13 = [v12 localizedStringForKey:@"X_DAYS_AGO" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
      uint64_t v14 = [v9 day];
    }
  }
  else
  {
    if ([v9 weekOfYear] > 12)
    {
LABEL_3:
      id v10 = &stru_270DEF3F8;
      goto LABEL_14;
    }
    long long v11 = NSString;
    long long v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v13 = [v12 localizedStringForKey:@"X_WEEKS_AGO" value:&stru_270DEF3F8 table:@"Localizable-iCloud"];
    uint64_t v14 = [v9 weekOfYear];
  }
  objc_msgSend(v11, "stringWithFormat:", v13, v14);
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_14:

  return v10;
}

- (int64_t)_numberOfWeeksSinceLastBackup:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  id v6 = [MEMORY[0x263EFF910] date];
  id v7 = [v5 components:0x2000 fromDate:v4 toDate:v6 options:0];

  int64_t v8 = [v7 weekOfYear];
  return v8;
}

- (void).cxx_destruct
{
}

- (void)initWithAccount:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_262993000, v0, v1, "Error initializing MBManager: %@", v2, v3, v4, v5, v6);
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_262993000, v0, v1, "Failed to fetch last backup date w/ error: %@", v2, v3, v4, v5, v6);
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2_49_cold_1(NSObject *a1, double a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  OUTLINED_FUNCTION_1_0();
  __int16 v6 = 2048;
  double v7 = a2;
  _os_log_debug_impl(&dword_262993000, a1, OS_LOG_TYPE_DEBUG, "NSDate.date: %@, lastBackupInterval: %f", v5, 0x16u);
}

void __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_262993000, log, OS_LOG_TYPE_DEBUG, "Last backup date is not beyond 12 weeks.", v1, 2u);
}

- (void)dateOfLastBackup
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_262993000, v0, v1, "ICSBackupManager error while fetching date of last backup: %@", v2, v3, v4, v5, v6);
}

@end