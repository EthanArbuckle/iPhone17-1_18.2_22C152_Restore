@interface PXCloudQuotaUpsellSheetManager
+ (void)presentUpsellSheetIfNecessaryWithActivationOptions:(int64_t)a3;
@end

@implementation PXCloudQuotaUpsellSheetManager

uint64_t __85__PXCloudQuotaUpsellSheetManager_presentUpsellSheetIfNecessaryWithActivationOptions___block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    v6 = PLUserStatusGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = 0;
      v8 = "No iCloud Quota upsell currently available";
      v9 = (uint8_t *)&v11;
LABEL_10:
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    }
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3 - *(double *)(a1 + 32);
  v5 = PLUserStatusGetLog();
  v6 = v5;
  if (v4 > 1.0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      v8 = "Request for iCloud Quota upsell timed out: Deny presentation";
      v9 = v12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Request for iCloud Quota upsell returned current offer: Allow presentation", buf, 2u);
  }
  uint64_t v7 = 1;
LABEL_12:

  return v7;
}

+ (void)presentUpsellSheetIfNecessaryWithActivationOptions:(int64_t)a3
{
  double v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"PXCloudQuotaUpsellSheetManagerDisabled"];

  v6 = PLUserStatusGetLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Will not request iCloud Quota upsell: Disabled by user default", buf, 2u);
    }
    goto LABEL_32;
  }
  os_signpost_id_t v8 = os_signpost_id_generate(v6);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "iCloudQuotaUpsellCheck", "", buf, 2u);
  }

  __int16 v11 = PXPreferencesWelcomeViewLastPresentationDate();
  if (v11)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v13 = v12;
    [v11 timeIntervalSinceReferenceDate];
    if (v13 - v14 < 86400.0)
    {
      v15 = PLUserStatusGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Will not request iCloud Quota upsell: Welcome views presented too recently";
LABEL_14:
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
        goto LABEL_31;
      }
      goto LABEL_31;
    }
  }
  if (a3 == 2)
  {
    v15 = PLUserStatusGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Will not request iCloud Quota upsell: Photos launched with some connection options";
      goto LABEL_14;
    }
LABEL_31:

LABEL_32:
    return;
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v17 = (void *)getICQOfferManagerClass_softClass;
  uint64_t v41 = getICQOfferManagerClass_softClass;
  if (!getICQOfferManagerClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __getICQOfferManagerClass_block_invoke;
    v36 = &unk_1E5DD2B08;
    v37 = &v38;
    __getICQOfferManagerClass_block_invoke((uint64_t)buf);
    v17 = (void *)v39[3];
  }
  id v18 = v17;
  _Block_object_dispose(&v38, 8);
  v15 = [v18 sharedOfferManager];
  char v19 = objc_opt_respondsToSelector();
  v20 = PLUserStatusGetLog();
  v21 = v20;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_ERROR, "Cannot request iCloud Quota upsell: Device OS version too old", buf, 2u);
    }

    goto LABEL_27;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEFAULT, "Will request iCloud Quota upsell", buf, 2u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v23 = v22;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  v24 = (uint64_t *)getICQUIUpsellTriggerEventAppLaunchSymbolLoc_ptr;
  uint64_t v41 = getICQUIUpsellTriggerEventAppLaunchSymbolLoc_ptr;
  if (!getICQUIUpsellTriggerEventAppLaunchSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __getICQUIUpsellTriggerEventAppLaunchSymbolLoc_block_invoke;
    v36 = &unk_1E5DD2B08;
    v37 = &v38;
    v25 = iCloudQuotaUILibrary();
    v26 = dlsym(v25, "ICQUIUpsellTriggerEventAppLaunch");
    *(void *)(v37[1] + 24) = v26;
    getICQUIUpsellTriggerEventAppLaunchSymbolLoc_ptr = *(void *)(v37[1] + 24);
    v24 = (uint64_t *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (v24)
  {
    uint64_t v27 = *v24;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __85__PXCloudQuotaUpsellSheetManager_presentUpsellSheetIfNecessaryWithActivationOptions___block_invoke;
    v32[3] = &__block_descriptor_40_e8_B12__0B8l;
    v32[4] = v23;
    [v15 fetchAndPresentUpsellForBundleIdentifier:@"com.apple.mobileslideshow" event:v27 completion:v32];
LABEL_27:
    v28 = v10;
    v29 = v28;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v29, OS_SIGNPOST_INTERVAL_END, v8, "iCloudQuotaUpsellCheck", "", buf, 2u);
    }

    goto LABEL_31;
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  v31 = [NSString stringWithUTF8String:"NSString *getICQUIUpsellTriggerEventAppLaunch(void)"];
  objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"PXCloudQuotaUpsellSheetManager.m", 20, @"%s", dlerror());

  __break(1u);
}

@end