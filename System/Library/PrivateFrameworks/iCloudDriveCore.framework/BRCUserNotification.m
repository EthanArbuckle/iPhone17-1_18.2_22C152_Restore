@interface BRCUserNotification
+ (id)defaultInstance;
- (BRCUserNotification)init;
- (id)_localizationKey:(id)a3 forOSAndTypeOfShare:(id)a4;
- (id)_localizationKey:(id)a3 forTypeOfShare:(id)a4;
- (id)_localizationKeyForOS:(id)a3;
- (id)_logWrapUserReplyBlock:(id)a3;
- (void)_displayDialogWithType:(unint64_t)a3 dict:(id)a4 options:(id)a5 userReplyBlock:(id)a6;
- (void)_displayDialogWithType:(unint64_t)a3 dict:(id)a4 userReplyBlock:(id)a5;
- (void)_hideCurrentDialog;
- (void)_updateDialogWithType:(unint64_t)a3 dict:(id)a4;
- (void)_updateDialogWithType:(unint64_t)a3 dict:(id)a4 userReplyBlock:(id)a5;
- (void)close;
- (void)dealloc;
- (void)showCloudDocsNotSupportedSimulatorRunningOnOldHost;
- (void)showErrorDeviceOfflineForShareMetadata:(id)a3 reply:(id)a4;
- (void)showErrorDocumentsAppNotVisibleForShareURL:(id)a3 reply:(id)a4;
- (void)showErrorInstallNativeAppForShareMetadata:(id)a3 reply:(id)a4;
- (void)showErrorItemUnavailableOrAccessRestrictedForShareMetadata:(id)a3 reply:(id)a4;
- (void)showErrorNativeAppDisabledByProfileForShareMetadata:(id)a3 reply:(id)a4;
- (void)showErrorParticipantLimitReachedForShareMetadata:(id)a3 reply:(id)a4;
- (void)showErrorReasonUnknownForShareMetadata:(id)a3 reply:(id)a4;
- (void)showErrorServerNotReachableForShareMetadata:(id)a3 reply:(id)a4;
- (void)showErrorSignInToiCloudForShareMetadata:(id)a3 reply:(id)a4;
- (void)showErrorTurnOniCloudDriveForShareMetadata:(id)a3 reply:(id)a4;
- (void)showErrorVolumeNotSupportedWithReason:(unint64_t)a3;
- (void)showJoinDialogForShareMetadata:(id)a3 ckContainer:(id)a4 reply:(id)a5;
@end

@implementation BRCUserNotification

+ (id)defaultInstance
{
  if (defaultInstance_once != -1) {
    dispatch_once(&defaultInstance_once, &__block_literal_global_15);
  }
  v2 = (void *)defaultInstance_defaultInstance;
  return v2;
}

void __38__BRCUserNotification_defaultInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)defaultInstance_defaultInstance;
  defaultInstance_defaultInstance = v0;
}

- (BRCUserNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)BRCUserNotification;
  result = [(BRCUserNotification *)&v3 init];
  if (result) {
    result->_nextDisplayBeginTime = 0;
  }
  return result;
}

- (void)dealloc
{
  if (self->_progressSubscriber)
  {
    objc_msgSend(MEMORY[0x263F08AB8], "_removeSubscriber:");
    id progressSubscriber = self->_progressSubscriber;
    self->_id progressSubscriber = 0;
  }
  cfUserNotification = self->_cfUserNotification;
  if (cfUserNotification)
  {
    CFUserNotificationCancel(cfUserNotification);
    CFRelease(self->_cfUserNotification);
  }
  displaySource = self->_displaySource;
  if (displaySource) {
    dispatch_source_cancel(displaySource);
  }
  source = self->_source;
  if (source) {
    CFRelease(source);
  }
  v7.receiver = self;
  v7.super_class = (Class)BRCUserNotification;
  [(BRCUserNotification *)&v7 dealloc];
}

- (void)_hideCurrentDialog
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  displaySource = self->_displaySource;
  if (displaySource)
  {
    dispatch_source_cancel(displaySource);
    v4 = self->_displaySource;
    self->_displaySource = 0;
  }
  source = self->_source;
  if (source)
  {
    CFRunLoopSourceInvalidate(source);
    CFRelease(self->_source);
    self->_source = 0;
  }
  if (self->_cfUserNotification)
  {
    userNotificationRefToCompletionBlock();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = self->_cfUserNotification;
    [v7 removeObjectForKey:v6];
    CFUserNotificationCancel(self->_cfUserNotification);
    CFRelease(self->_cfUserNotification);

    self->_cfUserNotification = 0;
  }
}

- (void)_displayDialogWithType:(unint64_t)a3 dict:(id)a4 userReplyBlock:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  v9 = +[BRCAccountsManager sharedManager];
  char v10 = [v9 isInSyncBubble];

  if ((v10 & 1) == 0) {
    [(BRCUserNotification *)self _displayDialogWithType:a3 dict:v11 options:0 userReplyBlock:v8];
  }
}

- (id)_logWrapUserReplyBlock:(id)a3
{
  id v3 = a3;
  long long v19 = 0uLL;
  uint64_t v20 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCUserNotification _logWrapUserReplyBlock:]", 187, &v19);
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCUserNotification _logWrapUserReplyBlock:]();
  }

  long long v21 = v19;
  uint64_t v22 = v20;
  v6 = [MEMORY[0x263F841B0] sharedManager];
  id v7 = objc_msgSend(v6, "br_currentPersonaID");

  id v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCUserNotification _logWrapUserReplyBlock:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke;
  v14[3] = &unk_265080EB8;
  long long v17 = v21;
  uint64_t v18 = v22;
  id v15 = v7;
  id v16 = v3;
  id v10 = v3;
  id v11 = v7;
  v12 = (void *)MEMORY[0x2455D9A50](v14);

  return v12;
}

void __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  BRPerformWithPersonaAndError();
}

void __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke_2_cold_1();
  }

  (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 64), v6);
  __brc_leave_section((uint64_t *)&v7);
}

- (void)_displayDialogWithType:(unint64_t)a3 dict:(id)a4 options:(id)a5 userReplyBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = [(BRCUserNotification *)self _logWrapUserReplyBlock:a6];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke;
  block[3] = &unk_265080F08;
  block[4] = self;
  id v17 = v10;
  id v19 = v12;
  unint64_t v20 = a3;
  id v18 = v11;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    objc_msgSend(MEMORY[0x263F08AB8], "_removeSubscriber:");
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  v5 = *(NSObject **)(v2 + 24);
  if (v5) {
    dispatch_source_cancel(v5);
  }
  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = v6;

  uint64_t v9 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v9;

  v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"MinimalDisplayTime"];
  id v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"WaitingTimeBeforeDisplay"];
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(NSObject **)(v14 + 24);
  dispatch_time_t v16 = dispatch_time(*(void *)(v14 + 32), [v13 unsignedLongLongValue]);
  dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(void **)(v17 + 24);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2;
  v27[3] = &unk_265080EE0;
  unint64_t v20 = *(void **)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 64);
  v27[4] = v17;
  uint64_t v30 = v19;
  id v29 = v20;
  id v21 = v12;
  id v28 = v21;
  uint64_t v22 = v18;
  v23 = v27;
  v24 = v23;
  v25 = v23;
  if (*MEMORY[0x263F32768])
  {
    v25 = ((void (*)(void *))*MEMORY[0x263F32768])(v23);
  }
  dispatch_block_t v26 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v25);
  dispatch_source_set_event_handler(v22, v26);

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
}

void __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideCurrentDialog];
  SInt32 error = 0;
  *(void *)(*(void *)(a1 + 32) + 8) = CFUserNotificationCreate(0, 0.0, *(void *)(a1 + 56), &error, *(CFDictionaryRef *)(*(void *)(a1 + 32) + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(__CFUserNotification **)(v2 + 8);
  if (v3) {
    BOOL v4 = error == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    if (*(void *)(v2 + 16))
    {
      id v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2_cold_2((uint64_t)v13, v14);
      }

      uint64_t v3 = *(__CFUserNotification **)(*(void *)(a1 + 32) + 8);
    }
    *(void *)(*(void *)(a1 + 32) + 16) = CFUserNotificationCreateRunLoopSource(0, v3, (CFUserNotificationCallBack)_notificationCallback, 0);
    if (*(void *)(*(void *)(a1 + 32) + 16))
    {
      Current = CFRunLoopGetCurrent();
      CFStringRef v8 = CFRunLoopCopyCurrentMode(Current);
      if (!v8) {
        CFStringRef v8 = (const __CFString *)CFRetain((CFTypeRef)*MEMORY[0x263EFFE78]);
      }
      uint64_t v9 = userNotificationRefToCompletionBlock();
      id v10 = *(id *)(*(void *)(a1 + 32) + 8);
      id v11 = (void *)[*(id *)(a1 + 48) copy];
      [v9 setObject:v11 forKey:v10];

      CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(*(void *)(a1 + 32) + 16), v8);
      CFRelease(v8);
      v12 = *(void **)(a1 + 40);
      if (v12) {
        v12 = (void *)dispatch_time(0, [v12 unsignedLongLongValue]);
      }
      *(void *)(*(void *)(a1 + 32) + 32) = v12;
    }
  }
  else
  {
    v5 = brc_bread_crumbs();
    dispatch_source_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2_cold_1(&error, (uint64_t)v5, v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_updateDialogWithType:(unint64_t)a3 dict:(id)a4
{
}

- (void)_updateDialogWithType:(unint64_t)a3 dict:(id)a4 userReplyBlock:(id)a5
{
  id v8 = a4;
  uint64_t v9 = [(BRCUserNotification *)self _logWrapUserReplyBlock:a5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke;
  v12[3] = &unk_265080F58;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1[4];
  if (*(void *)(v1 + 40))
  {
    uint64_t v3 = (void *)a1[5];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke_17;
    v11[3] = &unk_265080F30;
    v11[4] = v1;
    [v3 enumerateKeysAndObjectsUsingBlock:v11];
    uint64_t v4 = CFUserNotificationUpdate(*(CFUserNotificationRef *)(a1[4] + 8), 0.0, a1[7], *(CFDictionaryRef *)(a1[4] + 48));
    if (v4)
    {
      uint64_t v5 = v4;
      dispatch_source_t v6 = brc_bread_crumbs();
      uint64_t v7 = brc_default_log();
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
        __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke_cold_1((uint64_t)v6, v5, v7);
      }
    }
    else
    {
      if (!a1[6]) {
        return;
      }
      dispatch_source_t v6 = userNotificationRefToCompletionBlock();
      id v8 = *(void **)(a1[4] + 8);
      uint64_t v9 = (void *)a1[6];
      id v10 = v8;
      uint64_t v7 = [v9 copy];
      [v6 setObject:v7 forKey:v10];
    }
  }
  else
  {
    dispatch_source_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] ignore user notification udate: no KVO observer registered%@", buf, 0xCu);
    }
  }
}

uint64_t __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setObject:a3 forKeyedSubscript:a2];
}

- (id)_localizationKey:(id)a3 forTypeOfShare:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 lowercaseString];
  char v8 = [v7 isEqualToString:@"keynote"];

  if (v8)
  {
    uint64_t v9 = @"_KEYNOTE";
  }
  else
  {
    id v10 = [v6 lowercaseString];
    char v11 = [v10 isEqualToString:@"numbers"];

    if (v11)
    {
      uint64_t v9 = @"_NUMBERS";
    }
    else
    {
      v12 = [v6 lowercaseString];
      char v13 = [v12 isEqualToString:@"pages"];

      if (v13)
      {
        uint64_t v9 = @"_PAGES";
      }
      else if ([v6 isEqualToString:*MEMORY[0x263F32750]])
      {
        uint64_t v9 = @"_FOLDER";
      }
      else
      {
        uint64_t v9 = @"_DEFAULT";
      }
    }
  }
  uint64_t v14 = [v5 stringByAppendingString:v9];

  return v14;
}

- (id)_localizationKeyForOS:(id)a3
{
  return (id)[a3 stringByAppendingString:@"_IOS"];
}

- (id)_localizationKey:(id)a3 forOSAndTypeOfShare:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 stringByAppendingString:@"_IOS"];
  char v8 = [(BRCUserNotification *)self _localizationKey:v7 forTypeOfShare:v6];

  return v8;
}

- (void)close
{
  uint64_t v3 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__BRCUserNotification_close__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __28__BRCUserNotification_close__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _hideCurrentDialog];
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  return result;
}

- (void)showJoinDialogForShareMetadata:(id)a3 ckContainer:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v8 share];
  v12 = objc_msgSend(v11, "brc_sharedRootDisplayName");

  if ([v12 hasSuffix:@":nooverride"])
  {
    uint64_t v13 = [v12 substringToIndex:objc_msgSend(v12, "length") - objc_msgSend(@":nooverride", "length")];

    v12 = (void *)v13;
  }
  uint64_t v14 = [v8 share];
  unint64_t v15 = [v14 URL];
  dispatch_time_t v16 = objc_msgSend(v12, "brc_fixDocumentExtensionIfNeededForShareURL:", v15);

  uint64_t v17 = objc_msgSend(v16, "br_displayFilenameWithExtensionHidden:", 1);

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__11;
  v30[4] = __Block_byref_object_dispose__11;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__11;
  v28[4] = __Block_byref_object_dispose__11;
  id v29 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __72__BRCUserNotification_showJoinDialogForShareMetadata_ckContainer_reply___block_invoke;
  v21[3] = &unk_265080FA8;
  id v18 = v10;
  id v25 = v18;
  dispatch_block_t v26 = v30;
  v27 = v28;
  id v19 = v8;
  id v22 = v19;
  id v20 = v17;
  id v23 = v20;
  v24 = self;
  [v9 fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:v21];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
}

void __72__BRCUserNotification_showJoinDialogForShareMetadata_ckContainer_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v46[4] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v42 = v8;
    if (v7)
    {
      uint64_t v10 = objc_msgSend(v7, "br_formattedNameWithNonBreakingSpaces");
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    uint64_t v13 = [*(id *)(a1 + 32) ownerIdentity];
    uint64_t v14 = [v13 nameComponents];
    uint64_t v15 = objc_msgSend(v14, "br_formattedNameWithNonBreakingSpaces");

    dispatch_time_t v16 = [*(id *)(a1 + 32) share];
    int v17 = [v16 isFolderShare];

    id v18 = [*(id *)(a1 + 32) share];
    id v19 = [v18 URL];
    uint64_t v20 = objc_msgSend(v19, "brc_applicationName");

    id v21 = (void *)*MEMORY[0x263F32750];
    if (!v17) {
      id v21 = (void *)v20;
    }
    id v22 = v21;
    if ([*(id *)(a1 + 40) length])
    {
      if (v17)
      {
        id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v24 = _BRLocalizedStringWithFormat();
LABEL_16:
        v40 = v22;

        v27 = [*(id *)(a1 + 32) share];
        [v27 publicPermission];

        id v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v41 = (void *)v20;
        v39 = (void *)v15;
        uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        id v29 = _BRLocalizedStringWithFormat();

        uint64_t v30 = *MEMORY[0x263EFFFD8];
        v45[0] = *MEMORY[0x263EFFFC8];
        v45[1] = v30;
        id v31 = (void *)v24;
        v46[0] = v24;
        v46[1] = v29;
        v45[2] = *MEMORY[0x263EFFFE8];
        v32 = objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class(), v15, v38);
        v33 = _BRLocalizedStringWithFormat();
        v46[2] = v33;
        v45[3] = *MEMORY[0x263F00000];
        v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v35 = _BRLocalizedStringWithFormat();
        v46[3] = v35;
        v36 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:4];

        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __72__BRCUserNotification_showJoinDialogForShareMetadata_ckContainer_reply___block_invoke_2;
        v43[3] = &unk_265080F80;
        v37 = *(void **)(a1 + 48);
        id v44 = *(id *)(a1 + 56);
        [v37 _displayDialogWithType:3 dict:v36 userReplyBlock:v43];

        id v8 = v42;
        goto LABEL_17;
      }
      dispatch_block_t v26 = *(void **)(a1 + 48);
      if (v20) {
        [v26 _localizationKey:@"SHARING_JOIN_HEADER" forTypeOfShare:v20];
      }
      else {
      id v23 = [v26 _localizationKeyForOS:@"SHARING_JOIN_HEADER_DEFAULT_APP"];
      }
      id v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    }
    else
    {
      id v23 = [*(id *)(a1 + 48) _localizationKey:@"SHARING_JOIN_HEADER_NO_DOCUMENT_NAME" forOSAndTypeOfShare:v22];
      id v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    }
    uint64_t v24 = _BRLocalizedStringWithFormat();

    goto LABEL_16;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_17:
}

uint64_t __72__BRCUserNotification_showJoinDialogForShareMetadata_ckContainer_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorSignInToiCloudForShareMetadata:(id)a3 reply:(id)a4
{
  v33[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v29 = a4;
  id v7 = [v6 share];
  int v8 = [v7 isFolderShare];

  id v28 = v6;
  if (v8)
  {
    id v9 = (id)*MEMORY[0x263F32750];
  }
  else
  {
    uint64_t v10 = [v6 share];
    uint64_t v11 = [v10 URL];
    objc_msgSend(v11, "brc_applicationName");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v23 = v9;
  v32[0] = *MEMORY[0x263EFFFC8];
  v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  dispatch_block_t v26 = _BRLocalizedStringWithFormat();
  v33[0] = v26;
  v32[1] = *MEMORY[0x263EFFFD8];
  id v25 = [(BRCUserNotification *)self _localizationKey:@"SHARING_ICLOUD_SETUP_MESSAGE_IOS" forTypeOfShare:v9];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = _BRLocalizedStringWithFormat();
  v33[1] = v13;
  v32[2] = *MEMORY[0x263EFFFE8];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = _BRLocalizedStringWithFormat();
  v33[2] = v15;
  v32[3] = *MEMORY[0x263F00020];
  dispatch_time_t v16 = [(BRCUserNotification *)self _localizationKey:@"PREVIEW_BUTTON" forTypeOfShare:v9];
  uint64_t v24 = self;
  int v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v18 = _BRLocalizedStringWithFormat();
  v33[3] = v18;
  v32[4] = *MEMORY[0x263F00000];
  id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v20 = _BRLocalizedStringWithFormat();
  v33[4] = v20;
  id v21 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __69__BRCUserNotification_showErrorSignInToiCloudForShareMetadata_reply___block_invoke;
  v30[3] = &unk_265080F80;
  id v31 = v29;
  id v22 = v29;
  [(BRCUserNotification *)v24 _displayDialogWithType:3 dict:v21 userReplyBlock:v30];
}

uint64_t __69__BRCUserNotification_showErrorSignInToiCloudForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorTurnOniCloudDriveForShareMetadata:(id)a3 reply:(id)a4
{
  v38[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v34 = a4;
  id v7 = [v6 share];
  int v8 = [v7 isFolderShare];

  if (v8)
  {
    id v9 = (id)*MEMORY[0x263F32750];
  }
  else
  {
    uint64_t v10 = [v6 share];
    uint64_t v11 = [v10 URL];
    objc_msgSend(v11, "brc_applicationName");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)MEMORY[0x263F08A78];
  uint64_t v13 = [v6 ownerIdentity];
  [v13 nameComponents];
  uint64_t v14 = v33 = v6;
  v32 = [v12 localizedStringFromPersonNameComponents:v14 style:0 options:0];

  v37[0] = *MEMORY[0x263EFFFC8];
  id v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v30 = _BRLocalizedStringWithFormat();
  v38[0] = v30;
  v37[1] = *MEMORY[0x263EFFFD8];
  id v28 = [(BRCUserNotification *)self _localizationKey:@"SHARING_ICLOUD_DRIVE_SETUP_MESSAGE_IOS" forTypeOfShare:v9];
  uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  dispatch_time_t v16 = _BRLocalizedStringWithFormat();
  v38[1] = v16;
  v37[2] = *MEMORY[0x263EFFFE8];
  objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class(), v32);
  id v17 = v9;
  id v18 = v29 = v9;
  id v19 = _BRLocalizedStringWithFormat();
  v38[2] = v19;
  v37[3] = *MEMORY[0x263F00020];
  uint64_t v20 = [(BRCUserNotification *)self _localizationKey:@"PREVIEW_BUTTON" forTypeOfShare:v17];
  v27 = self;
  id v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v22 = _BRLocalizedStringWithFormat();
  v38[3] = v22;
  v37[4] = *MEMORY[0x263F00000];
  id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v24 = _BRLocalizedStringWithFormat();
  v38[4] = v24;
  id v25 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __72__BRCUserNotification_showErrorTurnOniCloudDriveForShareMetadata_reply___block_invoke;
  v35[3] = &unk_265080F80;
  id v36 = v34;
  id v26 = v34;
  [(BRCUserNotification *)v27 _displayDialogWithType:3 dict:v25 userReplyBlock:v35];
}

uint64_t __72__BRCUserNotification_showErrorTurnOniCloudDriveForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorInstallNativeAppForShareMetadata:(id)a3 reply:(id)a4
{
  v41[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 share];
  int v9 = [v8 isFolderShare];

  if (v9)
  {
    v27 = brc_bread_crumbs();
    id v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[BRCUserNotification showErrorInstallNativeAppForShareMetadata:reply:]((uint64_t)v27, v28);
    }
  }
  uint64_t v10 = [v6 share];
  uint64_t v11 = [v10 URL];
  v12 = objc_msgSend(v11, "brc_applicationName");

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x263F08A78];
    uint64_t v14 = [v6 ownerIdentity];
    [v14 nameComponents];
    uint64_t v15 = v36 = v7;
    uint64_t v30 = [v13 localizedStringFromPersonNameComponents:v15 style:0 options:0];

    v40[0] = *MEMORY[0x263EFFFC8];
    id v37 = v6;
    v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v34 = _BRLocalizedStringWithFormat();
    v41[0] = v34;
    v40[1] = *MEMORY[0x263EFFFD8];
    v33 = [(BRCUserNotification *)self _localizationKey:@"SHARING_APP_NOT_INSTALLED_MESSAGE_IOS", v12, v12 forTypeOfShare];
    id v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v29 = _BRLocalizedStringWithFormat();
    v41[1] = v29;
    v40[2] = *MEMORY[0x263EFFFE8];
    dispatch_time_t v16 = objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class(), v30);
    uint64_t v17 = _BRLocalizedStringWithFormat();
    id v18 = self;
    v32 = self;
    id v19 = (void *)v17;
    v41[2] = v17;
    v40[3] = *MEMORY[0x263F00020];
    uint64_t v20 = [(BRCUserNotification *)v18 _localizationKey:@"PREVIEW_BUTTON" forTypeOfShare:v12];
    id v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v22 = _BRLocalizedStringWithFormat();
    v41[3] = v22;
    v40[4] = *MEMORY[0x263F00000];
    id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v24 = _BRLocalizedStringWithFormat();
    v41[4] = v24;
    id v25 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:5];

    id v6 = v37;
    id v7 = v36;

    id v26 = (void *)v30;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __71__BRCUserNotification_showErrorInstallNativeAppForShareMetadata_reply___block_invoke;
    v38[3] = &unk_265080F80;
    id v39 = v36;
    [(BRCUserNotification *)v32 _displayDialogWithType:3 dict:v25 userReplyBlock:v38];
  }
  else
  {
    id v26 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"shareMetadata", v6);
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v26);
  }
}

uint64_t __71__BRCUserNotification_showErrorInstallNativeAppForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorNativeAppDisabledByProfileForShareMetadata:(id)a3 reply:(id)a4
{
  v31[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v27 = a4;
  id v7 = [v6 share];
  int v8 = [v7 isFolderShare];

  id v26 = v6;
  if (v8)
  {
    id v9 = (id)*MEMORY[0x263F32750];
  }
  else
  {
    uint64_t v10 = [v6 share];
    uint64_t v11 = [v10 URL];
    objc_msgSend(v11, "brc_applicationName");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30[0] = *MEMORY[0x263EFFFC8];
  id v25 = [(BRCUserNotification *)self _localizationKey:@"SHARING_PROFILE_DISABLED_HEADER_IOS" forTypeOfShare:v9];
  uint64_t v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v23 = _BRLocalizedStringWithFormat();
  v31[0] = v23;
  v30[1] = *MEMORY[0x263EFFFD8];
  v12 = [(BRCUserNotification *)self _localizationKey:@"SHARING_PROFILE_DISABLED_MESSAGE_IOS" forTypeOfShare:v9];
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = _BRLocalizedStringWithFormat();
  v31[1] = v14;
  v30[2] = *MEMORY[0x263F00020];
  uint64_t v15 = [(BRCUserNotification *)self _localizationKey:@"PREVIEW_BUTTON" forTypeOfShare:v9];
  id v22 = self;
  dispatch_time_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = _BRLocalizedStringWithFormat();
  v31[2] = v17;
  v30[3] = *MEMORY[0x263F00000];
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = _BRLocalizedStringWithFormat();
  v31[3] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __81__BRCUserNotification_showErrorNativeAppDisabledByProfileForShareMetadata_reply___block_invoke;
  v28[3] = &unk_265080F80;
  id v29 = v27;
  id v21 = v27;
  [(BRCUserNotification *)v22 _displayDialogWithType:3 dict:v20 userReplyBlock:v28];
}

uint64_t __81__BRCUserNotification_showErrorNativeAppDisabledByProfileForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorReasonUnknownForShareMetadata:(id)a3 reply:(id)a4
{
  v28[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  id v7 = [v6 share];
  int v8 = [v7 isFolderShare];

  id v23 = v6;
  if (v8)
  {
    id v9 = (id)*MEMORY[0x263F32750];
  }
  else
  {
    uint64_t v10 = [v6 share];
    uint64_t v11 = [v10 URL];
    objc_msgSend(v11, "brc_applicationName");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = *MEMORY[0x263EFFFC8];
  v12 = [(BRCUserNotification *)self _localizationKey:@"SHARING_GENERIC_ERROR_HEADER" forOSAndTypeOfShare:v9];
  id v22 = self;
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = _BRLocalizedStringWithFormat();
  v28[0] = v14;
  v27[1] = *MEMORY[0x263EFFFD8];
  uint64_t v15 = [(BRCUserNotification *)self _localizationKey:@"SHARING_GENERIC_ERROR_MESSAGE" forOSAndTypeOfShare:v9];
  dispatch_time_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = _BRLocalizedStringWithFormat();
  v28[1] = v17;
  v27[2] = *MEMORY[0x263F00000];
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = _BRLocalizedStringWithFormat();
  v28[2] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __68__BRCUserNotification_showErrorReasonUnknownForShareMetadata_reply___block_invoke;
  v25[3] = &unk_265080F80;
  id v26 = v24;
  id v21 = v24;
  [(BRCUserNotification *)v22 _displayDialogWithType:3 dict:v20 userReplyBlock:v25];
}

uint64_t __68__BRCUserNotification_showErrorReasonUnknownForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorDeviceOfflineForShareMetadata:(id)a3 reply:(id)a4
{
  v28[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  id v7 = [v6 share];
  int v8 = [v7 isFolderShare];

  id v23 = v6;
  if (v8)
  {
    id v9 = (id)*MEMORY[0x263F32750];
  }
  else
  {
    uint64_t v10 = [v6 share];
    uint64_t v11 = [v10 URL];
    objc_msgSend(v11, "brc_applicationName");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = *MEMORY[0x263EFFFC8];
  v12 = [(BRCUserNotification *)self _localizationKey:@"SHARING_DEVICE_OFFLINE_ERROR_HEADER" forOSAndTypeOfShare:v9];
  id v22 = self;
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = _BRLocalizedStringWithFormat();
  v28[0] = v14;
  v27[1] = *MEMORY[0x263EFFFD8];
  uint64_t v15 = [(BRCUserNotification *)self _localizationKey:@"SHARING_DEVICE_OFFLINE_ERROR_MESSAGE" forOSAndTypeOfShare:v9];
  dispatch_time_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = _BRLocalizedStringWithFormat();
  v28[1] = v17;
  v27[2] = *MEMORY[0x263F00000];
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = _BRLocalizedStringWithFormat();
  v28[2] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __68__BRCUserNotification_showErrorDeviceOfflineForShareMetadata_reply___block_invoke;
  v25[3] = &unk_265080F80;
  id v26 = v24;
  id v21 = v24;
  [(BRCUserNotification *)v22 _displayDialogWithType:3 dict:v20 userReplyBlock:v25];
}

uint64_t __68__BRCUserNotification_showErrorDeviceOfflineForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorServerNotReachableForShareMetadata:(id)a3 reply:(id)a4
{
  v28[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  id v7 = [v6 share];
  int v8 = [v7 isFolderShare];

  id v23 = v6;
  if (v8)
  {
    id v9 = (id)*MEMORY[0x263F32750];
  }
  else
  {
    uint64_t v10 = [v6 share];
    uint64_t v11 = [v10 URL];
    objc_msgSend(v11, "brc_applicationName");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = *MEMORY[0x263EFFFC8];
  v12 = [(BRCUserNotification *)self _localizationKey:@"SHARING_ICLOUD_NOT_REACHABLE_HEADER" forOSAndTypeOfShare:v9];
  id v22 = self;
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = _BRLocalizedStringWithFormat();
  v28[0] = v14;
  v27[1] = *MEMORY[0x263EFFFD8];
  uint64_t v15 = [(BRCUserNotification *)self _localizationKey:@"SHARING_ICLOUD_NOT_REACHABLE_MESSAGE" forOSAndTypeOfShare:v9];
  dispatch_time_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = _BRLocalizedStringWithFormat();
  v28[1] = v17;
  v27[2] = *MEMORY[0x263F00000];
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = _BRLocalizedStringWithFormat();
  v28[2] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __73__BRCUserNotification_showErrorServerNotReachableForShareMetadata_reply___block_invoke;
  v25[3] = &unk_265080F80;
  id v26 = v24;
  id v21 = v24;
  [(BRCUserNotification *)v22 _displayDialogWithType:3 dict:v20 userReplyBlock:v25];
}

uint64_t __73__BRCUserNotification_showErrorServerNotReachableForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorItemUnavailableOrAccessRestrictedForShareMetadata:(id)a3 reply:(id)a4
{
  v28[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  id v7 = [v6 share];
  int v8 = [v7 isFolderShare];

  id v23 = v6;
  if (v8)
  {
    id v9 = (id)*MEMORY[0x263F32750];
  }
  else
  {
    uint64_t v10 = [v6 share];
    uint64_t v11 = [v10 URL];
    objc_msgSend(v11, "brc_applicationName");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = *MEMORY[0x263EFFFC8];
  v12 = [(BRCUserNotification *)self _localizationKey:@"SHARING_NO_LONGER_SHARED_HEADER" forOSAndTypeOfShare:v9];
  id v22 = self;
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = _BRLocalizedStringWithFormat();
  v28[0] = v14;
  v27[1] = *MEMORY[0x263EFFFD8];
  uint64_t v15 = [(BRCUserNotification *)self _localizationKey:@"SHARING_NO_LONGER_SHARED_MESSAGE" forOSAndTypeOfShare:v9];
  dispatch_time_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = _BRLocalizedStringWithFormat();
  v28[1] = v17;
  v27[2] = *MEMORY[0x263F00000];
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = _BRLocalizedStringWithFormat();
  v28[2] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __88__BRCUserNotification_showErrorItemUnavailableOrAccessRestrictedForShareMetadata_reply___block_invoke;
  v25[3] = &unk_265080F80;
  id v26 = v24;
  id v21 = v24;
  [(BRCUserNotification *)v22 _displayDialogWithType:3 dict:v20 userReplyBlock:v25];
}

uint64_t __88__BRCUserNotification_showErrorItemUnavailableOrAccessRestrictedForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorParticipantLimitReachedForShareMetadata:(id)a3 reply:(id)a4
{
  v34[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v30 = a4;
  id v7 = [v6 share];
  int v8 = [v7 isFolderShare];

  id v29 = v6;
  if (v8)
  {
    id v9 = (id)*MEMORY[0x263F32750];
  }
  else
  {
    uint64_t v10 = [v6 share];
    uint64_t v11 = [v10 URL];
    objc_msgSend(v11, "brc_applicationName");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33[0] = *MEMORY[0x263EFFFC8];
  id v28 = [(BRCUserNotification *)self _localizationKey:@"SHARING_PARTICIPANT_LIMIT_REACHED_HEADER" forOSAndTypeOfShare:v9];
  id v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v26 = _BRLocalizedStringWithFormat();
  v34[0] = v26;
  v33[1] = *MEMORY[0x263EFFFD8];
  v12 = [(BRCUserNotification *)self _localizationKey:@"SHARING_PARTICIPANT_LIMIT_REACHED_MESSAGE" forOSAndTypeOfShare:v9];
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = _BRLocalizedStringWithFormat();
  v34[1] = v14;
  v33[2] = *MEMORY[0x263EFFFE8];
  uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v16 = _BRLocalizedStringWithFormat();
  id v17 = v9;
  id v25 = v9;
  id v18 = self;
  id v19 = (void *)v16;
  v34[2] = v16;
  v33[3] = *MEMORY[0x263F00000];
  uint64_t v20 = [(BRCUserNotification *)v18 _localizationKey:@"PREVIEW_BUTTON" forTypeOfShare:v17];
  id v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v22 = _BRLocalizedStringWithFormat();
  v34[3] = v22;
  id v23 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __78__BRCUserNotification_showErrorParticipantLimitReachedForShareMetadata_reply___block_invoke;
  v31[3] = &unk_265080F80;
  id v32 = v30;
  id v24 = v30;
  [(BRCUserNotification *)v18 _displayDialogWithType:3 dict:v23 userReplyBlock:v31];
}

uint64_t __78__BRCUserNotification_showErrorParticipantLimitReachedForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showErrorDocumentsAppNotVisibleForShareURL:(id)a3 reply:(id)a4
{
  v17[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x263F795D0];
  v17[0] = MEMORY[0x263EFFA88];
  uint64_t v7 = *MEMORY[0x263EFFFC8];
  v16[0] = v6;
  v16[1] = v7;
  int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = _BRLocalizedStringWithFormat();
  v17[1] = v9;
  v16[2] = *MEMORY[0x263F00000];
  uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = _BRLocalizedStringWithFormat();
  v17[2] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__BRCUserNotification_showErrorDocumentsAppNotVisibleForShareURL_reply___block_invoke;
  v14[3] = &unk_265080F80;
  id v15 = v5;
  id v13 = v5;
  [(BRCUserNotification *)self _displayDialogWithType:3 dict:v12 userReplyBlock:v14];
}

uint64_t __72__BRCUserNotification_showErrorDocumentsAppNotVisibleForShareURL_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showCloudDocsNotSupportedSimulatorRunningOnOldHost
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263EFFFC8];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = _BRLocalizedStringWithFormat();
  v11[0] = v4;
  v10[1] = *MEMORY[0x263EFFFD8];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = _BRLocalizedStringWithFormat();
  v11[1] = v6;
  v10[2] = *MEMORY[0x263F00000];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v8 = _BRLocalizedStringWithFormat();
  v11[2] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  [(BRCUserNotification *)self _displayDialogWithType:3 dict:v9 userReplyBlock:&__block_literal_global_195];
}

- (void)showErrorVolumeNotSupportedWithReason:(unint64_t)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"ICLOUD_DRIVE_VOLUME_NOT_SUPPORTED_NON_LOCAL_ALERT_MESSAGE";
  if (a3 == 2) {
    uint64_t v4 = @"ICLOUD_DRIVE_VOLUME_NOT_SUPPORTED_NON_APFS_ALERT_MESSAGE";
  }
  v14[0] = *MEMORY[0x263EFFFC8];
  id v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = v4;
  uint64_t v7 = [v5 bundleForClass:objc_opt_class()];
  int v8 = _BRLocalizedStringWithFormat();
  v15[0] = v8;
  v14[1] = *MEMORY[0x263EFFFD8];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = _BRLocalizedStringWithFormat();

  v15[1] = v10;
  v14[2] = *MEMORY[0x263F00000];
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = _BRLocalizedStringWithFormat();
  v15[2] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  [(BRCUserNotification *)self _displayDialogWithType:3 dict:v13 userReplyBlock:&__block_literal_global_209];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogInfo, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_displaySource, 0);
}

- (void)_logWrapUserReplyBlock:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] User notification completion block should run with %@ persona%@");
}

- (void)_logWrapUserReplyBlock:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┣%llx updating dialog...%@");
}

void __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┳%llx sending user reply%@");
}

void __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2_cold_1(_DWORD *a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = *a1;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_13_0(&dword_23FA42000, a2, a3, "[ERROR] can't create user notification: %d%@", v3, (void)v4, WORD4(v4), *MEMORY[0x263EF8340]);
}

void __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: self->_source == NULL%@", (uint8_t *)&v2, 0xCu);
}

void __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a1;
  OUTLINED_FUNCTION_13_0(&dword_23FA42000, a2, a3, "[ERROR] can't update user notification: %d%@", v3, (void)v4, WORD4(v4), *MEMORY[0x263EF8340]);
}

- (void)showErrorInstallNativeAppForShareMetadata:(uint64_t)a1 reply:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !shareMetadata.share.isFolderShare%@", (uint8_t *)&v2, 0xCu);
}

@end