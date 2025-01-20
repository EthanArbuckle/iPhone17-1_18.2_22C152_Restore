@interface SearchUIMobileTimerUtilities
+ (void)getEnablementStatusForAlarmWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SearchUIMobileTimerUtilities

+ (void)getEnablementStatusForAlarmWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__SearchUIMobileTimerUtilities_getEnablementStatusForAlarmWithIdentifier_completion___block_invoke;
  v9[3] = &unk_1E6E72C68;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v9];
}

void __85__SearchUIMobileTimerUtilities_getEnablementStatusForAlarmWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v2 = (void *)getMTAlarmManagerClass_softClass;
  uint64_t v20 = getMTAlarmManagerClass_softClass;
  if (!getMTAlarmManagerClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMTAlarmManagerClass_block_invoke;
    v22 = &unk_1E6E72C90;
    v23 = &v17;
    __getMTAlarmManagerClass_block_invoke((uint64_t)buf);
    v2 = (void *)v18[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v17, 8);
  v4 = objc_opt_new();
  id v5 = objc_msgSend(v4, "alarmWithIDString:", *(void *)(a1 + 32), v17);
  id v6 = SearchUIGeneralLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = [v5 isEnabled];
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v9;
      _os_log_impl(&dword_1E45B5000, v6, OS_LOG_TYPE_DEFAULT, "Resolved enablement state (%d) for alarm of identifier: %@", buf, 0x12u);
    }

    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v5 isEnabled]);
  }
  else
  {
    if (v7)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_impl(&dword_1E45B5000, v6, OS_LOG_TYPE_DEFAULT, "Fetching sleepMode enablement state for alarm of identifier: %@", buf, 0xCu);
    }

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FA5570]) initWithIdentifier:@"com.apple.SearchUI"];
    v12 = [v11 currentSleepScheduleWithError:0];
    v13 = [v12 occurrences];
    v14 = [v13 firstObject];
    v15 = [v14 alarmConfiguration];

    if (v15)
    {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v15 isEnabled]);
    }
    else
    {
      v16 = SearchUIGeneralLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __85__SearchUIMobileTimerUtilities_getEnablementStatusForAlarmWithIdentifier_completion___block_invoke_cold_1(v16);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __85__SearchUIMobileTimerUtilities_getEnablementStatusForAlarmWithIdentifier_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Unable to query sleepAlarmConfiguration", v1, 2u);
}

@end