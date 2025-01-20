@interface BRCSharingAcceptFlowOperation
+ (id)_runningShareIDs;
- (BOOL)_isDirectoryLinkInsideFolderShare;
- (BOOL)_isDocumentLinkInsideFolderShare;
- (BOOL)_isFolderShare;
- (BOOL)_isLinkInsideFolderShare;
- (BOOL)_isOwner;
- (BOOL)_isOwnerOrShareAlreadyAccepted;
- (BOOL)_isiWorkLinkInsideFolderShare;
- (BOOL)_isiWorkShare;
- (BOOL)shouldRetryForError:(id)a3;
- (BOOL)skipOpenInApp;
- (BRCSharingAcceptFlowOperation)initWithShareMetadata:(id)a3 client:(id)a4 session:(id)a5 userNotifier:(id)a6 userActionsNavigator:(id)a7;
- (NSString)identifier;
- (id)_stepNameAtIndex:(unint64_t)a3 withPrefix:(id)a4;
- (id)createActivity;
- (id)subclassableDescriptionWithContext:(id)a3;
- (void)_activateSharedZoneIfNeeded;
- (void)_checkIfShouldWaitUntilDownloadCompletion_step;
- (void)_completeWithError:(id)a3;
- (void)_createServerFaultIfPossibleWithCompletion:(id)a3;
- (void)_createSideFaultOnDisk_step;
- (void)_endAcceptationFlow_step;
- (void)_fetchOpenInfoOnFileObjectID:(id)a3 completion:(id)a4;
- (void)_finishShareAccept_step;
- (void)_isAccountRestricted_step;
- (void)_isAppInstalled_step;
- (void)_isFolderSharingSupported_step;
- (void)_isUserSignedInToiCloudDrive_step;
- (void)_isiWorkShare;
- (void)_jumpToSelector:(SEL)a3;
- (void)_jumpToSelectorInQueue:(SEL)a3;
- (void)_locateSharedItemOnDisk_step;
- (void)_locateSharedItemOnOwner_step;
- (void)_locateSharedItemOnRecipient_step;
- (void)_openDocumentInDocumentsAppIfInstalled:(id)a3;
- (void)_openSharedItemIfStillNeeded_step;
- (void)_openSharedSideFaultFileWithAppID:(id)a3;
- (void)_openSharedSideFaultFile_step;
- (void)_openiWorkAppPreemptively_step;
- (void)_parseShareMetadata_step;
- (void)_performNextStep;
- (void)_performNextStepInQueue;
- (void)_prepareToDownloadSharedDocument_step;
- (void)_setSpotlightAttribute_step;
- (void)_showSharingJoinDialog_step;
- (void)_startShareAccept_step;
- (void)_waitForSharedItemToBeOnDiskOnOwner_step;
- (void)_waitForSharedItemToBeOnDiskOnRecipient_step;
- (void)_waitForSharedItemToSyncDownOnOwner_step;
- (void)_waitForSharedItemToSyncDownOnRecipient_step;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)moveDialogToFront;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
- (void)setSkipOpenInApp:(BOOL)a3;
@end

@implementation BRCSharingAcceptFlowOperation

- (BRCSharingAcceptFlowOperation)initWithShareMetadata:(id)a3 client:(id)a4 session:(id)a5 userNotifier:(id)a6 userActionsNavigator:(id)a7
{
  id v13 = a3;
  id v29 = a4;
  id v14 = a5;
  id v28 = a6;
  id v27 = a7;
  v15 = [v14 syncContextProvider];
  v16 = [v15 sharedMetadataSyncContext];
  v30.receiver = self;
  v30.super_class = (Class)BRCSharingAcceptFlowOperation;
  v17 = [(_BRCOperation *)&v30 initWithName:@"sharing/accept-flow" syncContext:v16 sessionContext:v14];

  if (v17)
  {
    v18 = [v13 share];
    uint64_t v19 = [v18 URL];
    shareURL = v17->_shareURL;
    v17->_shareURL = (NSURL *)v19;

    objc_storeStrong((id *)&v17->_shareMetadata, a3);
    objc_storeStrong((id *)&v17->_session, a5);
    [(_BRCOperation *)v17 setNonDiscretionary:1];
    [(BRCSharingAcceptFlowOperation *)v17 setQueuePriority:8];
    objc_storeStrong((id *)&v17->_xpcClient, a4);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("accept-flow-next-step", v21);

    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    v24 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
    [(_BRCOperation *)v17 setGroup:v24];

    v25 = +[BRCUserDefaults defaultsForMangledID:0];
    v17->_allowsDirectoryFaults = [v25 forceDeltaInitialSync] ^ 1;

    objc_storeStrong((id *)&v17->_userNotification, a6);
    objc_storeStrong((id *)&v17->_userActionsNavigator, a7);
    v17->_hadProcessedCompletionError = 0;
  }

  return v17;
}

- (void)moveDialogToFront
{
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing/accept-flow", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.clouddocs.accept-shared-url";
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)_stepNameAtIndex:(unint64_t)a3 withPrefix:(id)a4
{
  id v6 = a4;
  if ([(NSArray *)self->_acceptationFlow count])
  {
    if ([(NSArray *)self->_acceptationFlow count] <= a3)
    {
      v10 = @"complete";
    }
    else
    {
      v7 = [(NSArray *)self->_acceptationFlow objectAtIndexedSubscript:a3];
      v8 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:&stru_26F3822F0];

      if (v6)
      {
        v9 = [NSString stringWithFormat:@"%@:%@", v6, v8];
      }
      else
      {
        v9 = v8;
      }
      v10 = v9;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  unint64_t stepIndex = self->_stepIndex;
  BOOL v4 = stepIndex != 0;
  unint64_t v5 = stepIndex - 1;
  if (v4) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 0;
  }
  return [(BRCSharingAcceptFlowOperation *)self _stepNameAtIndex:v6 withPrefix:@"step:"];
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v50 = brc_bread_crumbs();
    v51 = brc_default_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.5();
    }
  }
  self->_hadProcessedCompletionError = 1;
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke;
  v81[3] = &unk_26507F990;
  v81[4] = self;
  unint64_t v5 = (void (**)(void, void))MEMORY[0x2455D9A50](v81);
  unint64_t v6 = [v4 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F32360]];

  if (!v7)
  {
    id v13 = [v4 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x263EFD498]];

    if (v14)
    {
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 3))
      {
        userNotification = self->_userNotification;
        shareMetadata = self->_shareMetadata;
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        v68[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_48;
        v68[3] = &unk_26507ED98;
        v68[4] = self;
        id v69 = v4;
        [(BRCUserNotifier *)userNotification showErrorDeviceOfflineForShareMetadata:shareMetadata reply:v68];
        v12 = v69;
        goto LABEL_41;
      }
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 4))
      {
        v26 = self->_userNotification;
        id v27 = self->_shareMetadata;
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_49;
        v66[3] = &unk_26507ED98;
        v66[4] = self;
        id v67 = v4;
        [(BRCUserNotifier *)v26 showErrorServerNotReachableForShareMetadata:v27 reply:v66];
        v12 = v67;
        goto LABEL_41;
      }
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 29))
      {
        v41 = self->_userNotification;
        v42 = self->_shareMetadata;
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_3;
        v63[3] = &unk_265085050;
        v65 = v5;
        v63[4] = self;
        id v64 = v4;
        [(BRCUserNotifier *)v41 showErrorParticipantLimitReachedForShareMetadata:v42 reply:v63];

        v12 = v65;
        goto LABEL_41;
      }
      if ((objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 32) & 1) != 0
        || (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
        || objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 10))
      {
        v45 = self->_userNotification;
        v46 = self->_shareMetadata;
        v61[0] = MEMORY[0x263EF8330];
        v61[1] = 3221225472;
        v61[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_4;
        v61[3] = &unk_26507ED98;
        v61[4] = self;
        id v62 = v4;
        [(BRCUserNotifier *)v45 showErrorItemUnavailableOrAccessRestrictedForShareMetadata:v46 reply:v61];
        v12 = v62;
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v19 = [v4 domain];
      int v20 = [v19 isEqualToString:*MEMORY[0x263F08438]];

      if (v20)
      {
        uint64_t v21 = [v4 code];
        if (v21 == 35)
        {
          v43 = self->_userNotification;
          v44 = self->_shareMetadata;
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_6;
          v56[3] = &unk_26507ED98;
          v56[4] = self;
          id v57 = v4;
          [(BRCUserNotifier *)v43 showErrorReasonUnknownForShareMetadata:v44 reply:v56];
          v12 = v57;
          goto LABEL_41;
        }
        if (v21 == 1)
        {
          dispatch_queue_t v22 = self->_userNotification;
          v23 = self->_shareMetadata;
          v58[0] = MEMORY[0x263EF8330];
          v58[1] = 3221225472;
          v58[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_5;
          v58[3] = &unk_265085078;
          v60 = v5;
          v58[4] = self;
          id v59 = v4;
          [(BRCUserNotifier *)v22 showErrorNativeAppDisabledByProfileForShareMetadata:v23 reply:v58];

          v12 = v60;
          goto LABEL_41;
        }
      }
    }
    goto LABEL_42;
  }
  uint64_t v8 = [v4 code];
  v9 = @"appMissing";
  if (v8 <= 32)
  {
    if (v8 <= 22)
    {
      if (v8 != 1)
      {
        if (v8 == 2)
        {
          v10 = self->_userNotification;
          v11 = self->_shareMetadata;
          v73[0] = MEMORY[0x263EF8330];
          v73[1] = 3221225472;
          v73[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46;
          v73[3] = &unk_265085028;
          v73[4] = self;
          v75 = v5;
          id v74 = v4;
          [(BRCUserNotifier *)v10 showErrorSignInToiCloudForShareMetadata:v11 reply:v73];

          v12 = v75;
LABEL_41:

          goto LABEL_45;
        }
        goto LABEL_42;
      }
LABEL_43:
      ((void (**)(void, __CFString *))v5)[2](v5, v9);
      goto LABEL_44;
    }
    if (v8 != 23)
    {
      if (v8 == 29)
      {
        v24 = self->_userNotification;
        v25 = self->_shareMetadata;
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2;
        v76[3] = &unk_265085028;
        v76[4] = self;
        v78 = v5;
        id v77 = v4;
        [(BRCUserNotifier *)v24 showErrorInstallNativeAppForShareMetadata:v25 reply:v76];

        v12 = v78;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
LABEL_44:
    [(_BRCOperation *)self completedWithResult:0 error:v4];
    goto LABEL_45;
  }
  if (v8 <= 129)
  {
    if (v8 != 33)
    {
      if (v8 == 35)
      {
        v17 = self->_userNotification;
        v18 = self->_shareMetadata;
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        v70[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_47;
        v70[3] = &unk_265085028;
        v70[4] = self;
        v72 = v5;
        id v71 = v4;
        [(BRCUserNotifier *)v17 showErrorTurnOniCloudDriveForShareMetadata:v18 reply:v70];

        v12 = v72;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    goto LABEL_44;
  }
  if (v8 == 138) {
    goto LABEL_43;
  }
  if (v8 != 130)
  {
LABEL_42:
    v9 = @"other";
    goto LABEL_43;
  }
  id v28 = v4;
  id v29 = [v28 underlyingErrors];
  uint64_t v30 = [v29 count];

  if (v30 != 1)
  {
    v52 = brc_bread_crumbs();
    v53 = brc_default_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.4();
    }
  }
  v31 = [v28 underlyingErrors];
  uint64_t v32 = [v31 count];

  if (v32 == 1)
  {
    v33 = [v28 underlyingErrors];
    uint64_t v34 = [v33 objectAtIndexedSubscript:0];

    id v28 = (id)v34;
  }
  if (!self->_shareMetadata)
  {
    v54 = brc_bread_crumbs();
    v55 = brc_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:]();
    }
  }
  v35 = brc_bread_crumbs();
  v36 = brc_default_log();
  if (os_log_type_enabled(v36, (os_log_type_t)0x90u)) {
    -[BRCSharingAcceptFlowOperation _completeWithError:]((uint64_t)v28);
  }

  v37 = +[BRCSystemResourcesManager manager];
  char v38 = [v37 isNetworkReachable];

  if (v38)
  {
    v39 = self->_userNotification;
    v40 = self->_shareMetadata;
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_43;
    v79[3] = &unk_26507ED98;
    v79[4] = self;
    id v80 = v28;
    [(BRCUserNotifier *)v39 showErrorReasonUnknownForShareMetadata:v40 reply:v79];
  }
  else
  {
    v47 = brc_bread_crumbs();
    v48 = brc_default_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:]();
    }

    v49 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFD498] code:3 userInfo:0];
    [(_BRCOperation *)self completedWithResult:0 error:v49];
  }
LABEL_45:
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  unint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_cold_1((uint64_t)v3);
  }

  [*(id *)(*(void *)(a1 + 32) + 512) openShareURLInWebBrowser:*(void *)(*(void *)(a1 + 32) + 544) withReason:v3];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_43(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2 && a3)
  {
    v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_2();
    }

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 544);
    if (!v9)
    {
      int v14 = brc_bread_crumbs();
      v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 544);
    }
    v10 = *(void **)(v8 + 512);
    v11 = objc_msgSend(v9, "brc_applicationBundleID");
    [v10 openAppStoreForBundleID:v11];

    goto LABEL_11;
  }
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_11:
  [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2 && a3)
  {
    uint64_t v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46_cold_1();
    }

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    [*(id *)(*(void *)(a1 + 32) + 512) openiCloudSettings];
    goto LABEL_10;
  }
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_10:
  [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_47(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2 && a3)
  {
    uint64_t v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46_cold_1();
    }

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    [*(id *)(*(void *)(a1 + 32) + 512) openiCloudSettings];
    goto LABEL_10;
  }
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_10:
  [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_49(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_3(void *a1, int a2)
{
  if (a2) {
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  return [v3 completedWithResult:0 error:v4];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_5(void *a1, int a2)
{
  if (a2) {
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  return [v3 completedWithResult:0 error:v4];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(BRCSharingAcceptFlowOperation *)self _isFolderShare])
  {
    uint64_t v8 = @"folderShare-";
  }
  else if ([(BRCSharingAcceptFlowOperation *)self _isiWorkShare])
  {
    uint64_t v8 = @"iWorkShare-";
  }
  else
  {
    uint64_t v8 = @"documentShare-";
  }
  v9 = [(BRCSharingAcceptFlowOperation *)self _stepNameAtIndex:self->_stepIndex withPrefix:0];
  v10 = [(__CFString *)v8 stringByAppendingString:v9];

  if (self->_accessedSecurityScope)
  {
    [(NSURL *)self->_liveFileURL stopAccessingSecurityScopedResource];
    self->_accessedSecurityScope = 0;
  }
  if (v7)
  {
    v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      shareURL = self->_shareURL;
      *(_DWORD *)buf = 138412802;
      v33 = shareURL;
      __int16 v34 = 2112;
      id v35 = v7;
      __int16 v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] share acceptation %@ failed with error %@%@", buf, 0x20u);
    }

    if (([(BRCSharingAcceptFlowOperation *)self isCancelled] & 1) == 0
      && !self->_hadProcessedCompletionError)
    {
      id v28 = brc_bread_crumbs();
      id v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[BRCSharingAcceptFlowOperation finishWithResult:error:]();
      }
    }
    [(BRCSharingAcceptFlowOperation *)self _activateSharedZoneIfNeeded];
    int v14 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
    session = self->_session;
    if (session && ![(BRCAccountSessionFPFS *)session isCancelled])
    {
      if (v14)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke;
        block[3] = &unk_26507ED70;
        block[4] = self;
        dispatch_async(v14, block);
      }
      else
      {
        v26 = brc_bread_crumbs();
        id v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          -[BRCSharingAcceptFlowOperation finishWithResult:error:]();
        }
      }
    }
  }
  else
  {
    int v14 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_shareURL;
      v18 = [(NSURL *)self->_liveFileURL path];
      *(_DWORD *)buf = 138412802;
      v33 = v17;
      __int16 v34 = 2112;
      id v35 = v18;
      __int16 v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] share acceptation %@ succeed and document is now live on disk at %@%@", buf, 0x20u);
    }
  }

  uint64_t v19 = +[BRCEventsAnalytics sharedAnalytics];
  int v20 = [(BRCClientZone *)self->_clientZone mangledID];
  BOOL v21 = [(BRCClientZone *)self->_clientZone enhancedDrivePrivacyEnabled];
  dispatch_queue_t v22 = [(BRCItemID *)self->_linkItemID itemIDString];
  v23 = [(BRCAccountSessionFPFS *)self->_session analyticsReporter];
  [v19 registerAndSendNewShareAcceptationWithLastStep:v10 zoneMangledID:v20 enhancedDrivePrivacyEnabled:v21 itemIDString:v22 error:v7 analyticsReporter:v23];

  [(BRCAppLibrary *)self->_appLibrary removeForegroundClient:self];
  if (![(BRCSharingAcceptFlowOperation *)self _isOwner])
  {
    v24 = [(BRCClientZone *)self->_clientZone serverZone];
    [v24 removeForegroundClient:self];
  }
  [(BRCUserNotifier *)self->_userNotification close];
  if (self->_shareID)
  {
    id v25 = +[BRCSharingAcceptFlowOperation _runningShareIDs];
    objc_sync_enter(v25);
    [v25 removeObject:self->_shareID];
    objc_sync_exit(v25);
  }
  v30.receiver = self;
  v30.super_class = (Class)BRCSharingAcceptFlowOperation;
  [(_BRCOperation *)&v30 finishWithResult:v6 error:v7];
}

void __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 576))
  {
    id v3 = objc_msgSend(*(id *)(v2 + 608), "itemByItemID:");
    uint64_t v4 = v3;
    if (v3 && [v3 isShareAcceptationFault])
    {
      unint64_t v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1();
      }

      id v7 = [v4 asShareAcceptationFault];
      [v7 deleteShareAcceptationFault];
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if ([(id)v2 _isLinkInsideFolderShare])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(void *)(v8 + 584))
    {
      v9 = objc_msgSend(*(id *)(v8 + 608), "itemByItemID:");
      v10 = v9;
      if (v9 && [v9 isShareAcceptationFault])
      {
        v11 = brc_bread_crumbs();
        v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1();
        }

        id v13 = [v10 asShareAcceptationFault];
        [v13 deleteShareAcceptationFault];
      }
    }
  }
}

- (void)main
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    shareURL = self->_shareURL;
    *(_DWORD *)buf = 138412546;
    v39 = shareURL;
    __int16 v40 = 2112;
    v41 = v3;
    _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] User clicked on share link %@%@", buf, 0x16u);
  }

  if ([(BRCSharingAcceptFlowOperation *)self _isFolderShare])
  {
    uint64_t v24 = NSStringFromSelector(sel__isAppInstalled_step);
    v37[0] = v24;
    uint64_t v22 = NSStringFromSelector(sel__isFolderSharingSupported_step);
    v37[1] = v22;
    __int16 v34 = NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
    v37[2] = v34;
    v33 = NSStringFromSelector(sel__showSharingJoinDialog_step);
    v37[3] = v33;
    uint64_t v32 = NSStringFromSelector(sel__parseShareMetadata_step);
    v37[4] = v32;
    v31 = NSStringFromSelector(sel__startShareAccept_step);
    v37[5] = v31;
    objc_super v30 = NSStringFromSelector(sel__openiWorkAppPreemptively_step);
    v37[6] = v30;
    id v29 = NSStringFromSelector(sel__locateSharedItemOnOwner_step);
    v37[7] = v29;
    id v28 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
    v37[8] = v28;
    id v27 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
    v37[9] = v27;
    v26 = NSStringFromSelector(sel__createSideFaultOnDisk_step);
    v37[10] = v26;
    id v25 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
    v37[11] = v25;
    id v6 = NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
    v37[12] = v6;
    id v7 = NSStringFromSelector(sel__openSharedSideFaultFile_step);
    v37[13] = v7;
    uint64_t v8 = NSStringFromSelector(sel__finishShareAccept_step);
    v37[14] = v8;
    v9 = NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
    v37[15] = v9;
    v10 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
    v37[16] = v10;
    v11 = NSStringFromSelector(sel__locateSharedItemOnDisk_step);
    v37[17] = v11;
    acceptationFlow = NSStringFromSelector(sel__setSpotlightAttribute_step);
    v37[18] = acceptationFlow;
    id v13 = NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
    v37[19] = v13;
    int v14 = NSStringFromSelector(sel__endAcceptationFlow_step);
    v37[20] = v14;
    v15 = (void *)MEMORY[0x263EFF8C0];
    v16 = v37;
  }
  else
  {
    if (![(BRCSharingAcceptFlowOperation *)self _isiWorkShare])
    {
      int v20 = NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
      v35[0] = v20;
      uint64_t v19 = NSStringFromSelector(sel__showSharingJoinDialog_step);
      v35[1] = v19;
      __int16 v34 = NSStringFromSelector(sel__parseShareMetadata_step);
      v35[2] = v34;
      v33 = NSStringFromSelector(sel__startShareAccept_step);
      v35[3] = v33;
      uint64_t v32 = NSStringFromSelector(sel__locateSharedItemOnOwner_step);
      v35[4] = v32;
      v31 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
      v35[5] = v31;
      objc_super v30 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
      v35[6] = v30;
      id v29 = NSStringFromSelector(sel__createSideFaultOnDisk_step);
      v35[7] = v29;
      id v28 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
      v35[8] = v28;
      id v27 = NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
      v35[9] = v27;
      v26 = NSStringFromSelector(sel__openSharedSideFaultFile_step);
      v35[10] = v26;
      id v25 = NSStringFromSelector(sel__finishShareAccept_step);
      v35[11] = v25;
      id v6 = NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
      v35[12] = v6;
      id v7 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
      v35[13] = v7;
      uint64_t v8 = NSStringFromSelector(sel__prepareToDownloadSharedDocument_step);
      v35[14] = v8;
      v9 = NSStringFromSelector(sel__setSpotlightAttribute_step);
      v35[15] = v9;
      v10 = NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
      v35[16] = v10;
      v11 = NSStringFromSelector(sel__endAcceptationFlow_step);
      v35[17] = v11;
      BOOL v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:18];
      acceptationFlow = self->_acceptationFlow;
      self->_acceptationFlow = v21;
      goto LABEL_9;
    }
    uint64_t v24 = NSStringFromSelector(sel__isAppInstalled_step);
    v36[0] = v24;
    uint64_t v22 = NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
    v36[1] = v22;
    __int16 v34 = NSStringFromSelector(sel__isAccountRestricted_step);
    v36[2] = v34;
    v33 = NSStringFromSelector(sel__showSharingJoinDialog_step);
    v36[3] = v33;
    uint64_t v32 = NSStringFromSelector(sel__parseShareMetadata_step);
    v36[4] = v32;
    v31 = NSStringFromSelector(sel__startShareAccept_step);
    v36[5] = v31;
    objc_super v30 = NSStringFromSelector(sel__openiWorkAppPreemptively_step);
    v36[6] = v30;
    id v29 = NSStringFromSelector(sel__locateSharedItemOnOwner_step);
    v36[7] = v29;
    id v28 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
    v36[8] = v28;
    id v27 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
    v36[9] = v27;
    v26 = NSStringFromSelector(sel__createSideFaultOnDisk_step);
    v36[10] = v26;
    id v25 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
    v36[11] = v25;
    id v6 = NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
    v36[12] = v6;
    id v7 = NSStringFromSelector(sel__openSharedSideFaultFile_step);
    v36[13] = v7;
    uint64_t v8 = NSStringFromSelector(sel__finishShareAccept_step);
    v36[14] = v8;
    v9 = NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
    v36[15] = v9;
    v10 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
    v36[16] = v10;
    v11 = NSStringFromSelector(sel__prepareToDownloadSharedDocument_step);
    v36[17] = v11;
    acceptationFlow = NSStringFromSelector(sel__setSpotlightAttribute_step);
    v36[18] = acceptationFlow;
    id v13 = NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
    v36[19] = v13;
    int v14 = NSStringFromSelector(sel__endAcceptationFlow_step);
    v36[20] = v14;
    v15 = (void *)MEMORY[0x263EFF8C0];
    v16 = v36;
  }
  objc_msgSend(v15, "arrayWithObjects:count:", v16, 21, v22);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = self->_acceptationFlow;
  self->_acceptationFlow = v17;

  uint64_t v19 = v23;
  int v20 = (void *)v24;
LABEL_9:

  self->_unint64_t stepIndex = 0;
  [(BRCSharingAcceptFlowOperation *)self _performNextStep];
}

- (void)_performNextStepInQueue
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Accept flow completed successfully.%@", v2, v3, v4, v5, v6);
}

- (void)_performNextStep
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BRCSharingAcceptFlowOperation__performNextStep__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__BRCSharingAcceptFlowOperation__performNextStep__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStepInQueue];
}

- (void)_jumpToSelectorInQueue:(SEL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NSStringFromSelector(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = -[NSArray indexOfObject:](self->_acceptationFlow, "indexOfObject:");
  if (v5 >= [(NSArray *)self->_acceptationFlow count])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 84, @"can't fast forward to download step (currentIndex: %lu, downloadIndex: %lu, stepCount: %lu)", self->_stepIndex, v5, -[NSArray count](self->_acceptationFlow, "count"));
  }
  else
  {
    if (self->_stepIndex < v5)
    {
      self->_unint64_t stepIndex = v5;
      [(BRCSharingAcceptFlowOperation *)self _performNextStepInQueue];
      goto LABEL_7;
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 10, @"can't fast forward to download step from current position (currentIndex: %lu)", self->_stepIndex);
  }
  id v7 = (void *)v6;
  [(BRCSharingAcceptFlowOperation *)self _completeWithError:v6];

LABEL_7:
}

- (void)_jumpToSelector:(SEL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__BRCSharingAcceptFlowOperation__jumpToSelector___block_invoke;
  v4[3] = &unk_265080558;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__BRCSharingAcceptFlowOperation__jumpToSelector___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _jumpToSelectorInQueue:*(void *)(a1 + 40)];
}

- (BOOL)_isOwner
{
  shareMetadata = self->_shareMetadata;
  if (!shareMetadata)
  {
    unint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:]();
    }

    shareMetadata = self->_shareMetadata;
  }
  return [(CKShareMetadata *)shareMetadata participantRole] == CKShareParticipantRoleOwner;
}

- (BOOL)_isOwnerOrShareAlreadyAccepted
{
  shareMetadata = self->_shareMetadata;
  if (!shareMetadata)
  {
    unint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:]();
    }

    shareMetadata = self->_shareMetadata;
  }
  uint64_t v4 = [(CKShareMetadata *)shareMetadata participantRole];
  if (v4 != 1) {
    LOBYTE(v4) = [(CKShareMetadata *)self->_shareMetadata participantStatus] == CKShareParticipantAcceptanceStatusAccepted;
  }
  return v4;
}

- (BOOL)_isFolderShare
{
  uint64_t v2 = [(CKShareMetadata *)self->_shareMetadata share];
  char v3 = [v2 isFolderShare];

  return v3;
}

- (BOOL)_isLinkInsideFolderShare
{
  if ([(BRCSharingAcceptFlowOperation *)self _isFolderShare])
  {
    char v3 = [(CKShareMetadata *)self->_shareMetadata sharedItemHierarchyIDs];
    uint64_t v4 = [v3 lastObject];
    unint64_t v5 = objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);

    uint64_t v6 = [(CKRecordID *)self->_shareID brc_shareItemID];
    if (v5) {
      int v7 = [v5 isEqualToItemID:v6] ^ 1;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)_isDocumentLinkInsideFolderShare
{
  BOOL v3 = [(BRCSharingAcceptFlowOperation *)self _isLinkInsideFolderShare];
  if (v3)
  {
    uint64_t v4 = [(CKShareMetadata *)self->_shareMetadata sharedItemHierarchyIDs];
    unint64_t v5 = [v4 lastObject];

    uint64_t v6 = [v5 recordName];
    char v7 = [v6 hasPrefix:@"documentContent/"];

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)_isDirectoryLinkInsideFolderShare
{
  if (![(BRCSharingAcceptFlowOperation *)self _isFolderShare]) {
    return 0;
  }
  BOOL v3 = [(CKShareMetadata *)self->_shareMetadata sharedItemHierarchyIDs];
  uint64_t v4 = [v3 lastObject];

  unint64_t v5 = objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);
  uint64_t v6 = [(CKRecordID *)self->_shareID brc_shareItemID];
  if ([v5 isEqualToItemID:v6])
  {
    char v7 = [v4 recordName];
    char v8 = [v7 hasPrefix:@"directory/"];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_isiWorkLinkInsideFolderShare
{
  if (![(BRCSharingAcceptFlowOperation *)self _isDocumentLinkInsideFolderShare]) {
    return 0;
  }
  BOOL v3 = [(NSURL *)self->_shareURL brc_applicationContainerID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_isiWorkShare
{
  shareMetadata = self->_shareMetadata;
  if (shareMetadata)
  {
    BOOL v4 = [(CKShareMetadata *)shareMetadata share];
    char v5 = [v4 isFolderShare];

    if (v5) {
      return 0;
    }
    uint64_t v6 = [(CKShareMetadata *)self->_shareMetadata share];
    char v7 = [v6 URL];
    char v8 = objc_msgSend(v7, "brc_applicationName");

    if (!v8)
    {
      return 0;
    }
    else
    {
      v9 = [(CKShareMetadata *)self->_shareMetadata share];
      v10 = objc_msgSend(v9, "brc_sharedRootExtension");

      if (v10)
      {
        v11 = (void *)MEMORY[0x263EFFA08];
        v12 = [MEMORY[0x263F32640] iWorkShareableExtensions];
        id v13 = [v11 setWithArray:v12];

        char v14 = [v13 containsObject:v10];
      }
      else
      {
        char v14 = 1;
      }
    }
  }
  else
  {
    shareURL = self->_shareURL;
    if (!shareURL)
    {
      v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[BRCSharingAcceptFlowOperation _isiWorkShare]();
      }

      shareURL = self->_shareURL;
    }
    v16 = [(NSURL *)shareURL brc_applicationContainerID];
    char v14 = v16 != 0;
  }
  return v14;
}

- (void)_fetchOpenInfoOnFileObjectID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
  v9 = [v6 asString];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__BRCSharingAcceptFlowOperation__fetchOpenInfoOnFileObjectID_completion___block_invoke;
  v12[3] = &unk_265081300;
  id v13 = v6;
  char v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 getUserVisibleURLForItemIdentifier:v9 completionHandler:v12];
}

void __73__BRCSharingAcceptFlowOperation__fetchOpenInfoOnFileObjectID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    char v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v12 = a1[4];
      int v13 = 138412802;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_23FA42000, v8, (os_log_type_t)0x90u, "[ERROR] Can't find the user visible URL for %@ - %@%@", (uint8_t *)&v13, 0x20u);
    }
  }
  uint64_t v9 = a1[5];
  id v10 = *(void **)(v9 + 648);
  *(void *)(v9 + 648) = v5;
  id v11 = v5;

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_activateSharedZoneIfNeeded
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx activating shared zone%@");
}

uint64_t __60__BRCSharingAcceptFlowOperation__activateSharedZoneIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 608) resume];
}

- (void)openResourceOperationDidComplete:(id)a3
{
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingAcceptFlowOperation openResourceOperationDidComplete:]();
  }

  [(BRCSharingAcceptFlowOperation *)self _performNextStep];
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
    -[BRCSharingAcceptFlowOperation openResourceOperation:didFailWithError:]((uint64_t)v5);
  }

  char v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
  [(BRCSharingAcceptFlowOperation *)self _completeWithError:v8];
}

- (void)_isFolderSharingSupported_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx checking if document sharing is supported%@");
}

- (void)_isAppInstalled_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Check if app is installed%@");
}

- (void)_isUserSignedInToiCloudDrive_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Check if a user is signed in to iCloud and iCloud Drive is turned on%@");
}

- (void)_isAccountRestricted_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Check if app is profile disabled%@");
}

- (void)_showSharingJoinDialog_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Show sharing join dialog%@");
}

void __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _completeWithError:v5];
  }
  else
  {
    if (a2)
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 544);
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v8;
        __int16 v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] User has accepted to open shared document at %@%@", buf, 0x16u);
      }

      uint64_t v9 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke_140;
      block[3] = &unk_26507ED70;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v9, block);
    }
    else
    {
      id v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 544);
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v12;
        __int16 v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] User has refused to open shared document at %@%@", buf, 0x16u);
      }

      int v13 = *(void **)(a1 + 32);
      uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
      [v13 _completeWithError:v9];
    }
  }
}

uint64_t __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke_140(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_parseShareMetadata_step
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Pre-creating accept operation to block next sync down %@%@", (void)v3, DWORD2(v3));
}

void __57__BRCSharingAcceptFlowOperation__parseShareMetadata_step__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  os_log_t v2 = *(void **)(v1 + 520);
  id v3 = [*(id *)(v1 + 560) share];
  [v2 learnParticipantIdentitiesForShare:v3 forceUpdate:1];
}

- (void)_startShareAccept_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Start accepting share URL%@");
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v19 = *(_OWORD *)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 56);
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    id v22 = (id)v19;
    __int16 v23 = 2112;
    id v24 = v5;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received share access completion - metadata %@, operationError - %@%@", buf, 0x2Au);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6) {
      goto LABEL_5;
    }
    int v13 = [v5 share];
    uint64_t v14 = [v13 recordID];
    __int16 v15 = (void *)*((void *)WeakRetained + 69);
    *((void *)WeakRetained + 69) = v14;

    if (*((void *)WeakRetained + 69)) {
      goto LABEL_9;
    }
    __int16 v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_2();
    }

    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: No operation error and no share id");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:
      id v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = v6;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to accept share - %@%@", buf, 0x16u);
      }

      id v6 = v6;
      uint64_t v12 = (void *)*((void *)WeakRetained + 88);
      *((void *)WeakRetained + 88) = v6;
    }
    else
    {
LABEL_9:
      uint64_t v12 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_1();
      }

      id v6 = 0;
    }

    dispatch_group_leave(*((dispatch_group_t *)WeakRetained + 83));
  }

  __brc_leave_section((uint64_t *)&v19);
}

- (void)_openiWorkAppPreemptively_step
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _linkItemID%@", v2, v3, v4, v5, v6);
}

void __63__BRCSharingAcceptFlowOperation__openiWorkAppPreemptively_step__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 608) itemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  if ([v3 isLive]) {
    char v2 = 0;
  }
  else {
    char v2 = [v3 isLost] ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (void)_locateSharedItemOnOwner_step
{
  if (![(BRCSharingAcceptFlowOperation *)self _isOwner]) {
    goto LABEL_3;
  }
  id v3 = [(BRCClientZone *)self->_clientZone serverZone];
  char v4 = [v3 state];
  uint64_t v5 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
  uint8_t v6 = [v5 serverZone];
  char v7 = v4 & [v6 state];

  if ((v7 & 4) == 0)
  {
    uint64_t v8 = self->_session;
    uint64_t v9 = self->_linkItemID;
    id v10 = self->_clientZone;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke;
    v14[3] = &unk_2650850F0;
    v14[4] = self;
    __int16 v15 = v8;
    uint64_t v16 = v10;
    __int16 v17 = v9;
    id v11 = v9;
    uint64_t v12 = v10;
    int v13 = v8;
    [(BRCSharingAcceptFlowOperation *)self _createServerFaultIfPossibleWithCompletion:v14];
  }
  else
  {
LABEL_3:
    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v3 _completeWithError:v9];
  }
  else
  {
    char v4 = [*(id *)(a1 + 40) clientDB];
    uint64_t v5 = [v4 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_2;
    block[3] = &unk_26507EE10;
    id v11 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    id v12 = v6;
    uint64_t v13 = v7;
    id v14 = v8;
    dispatch_async(v5, block);
  }
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_2(id *a1)
{
  char v2 = [a1[4] itemByItemID:a1[5]];
  id v3 = [v2 st];
  uint64_t v4 = [v3 parentID];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
  }
  else
  {
    id v6 = [a1[4] serverItemByItemID:a1[5]];
    uint64_t v5 = [v6 parentItemIDOnServer];

    if (!v5)
    {
LABEL_5:
      [a1[6] _performNextStep];
      goto LABEL_10;
    }
  }
  if ([v2 isOnDisk]) {
    goto LABEL_5;
  }
  uint64_t v7 = [a1[4] fetchParentChainIfNecessaryWithParentItemID:v5 isUserWaiting:1];
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_3;
    v10[3] = &unk_2650850F0;
    id v11 = a1[7];
    id v12 = a1[4];
    id v8 = a1[5];
    id v9 = a1[6];
    id v13 = v8;
    id v14 = v9;
    [v7 addFetchParentChainCompletionBlock:v10];
  }
  else
  {
    [a1[6] _performNextStep];
  }

LABEL_10:
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) clientDB];
  uint64_t v5 = [v4 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_4;
  block[3] = &unk_2650850C8;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = v3;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v13 = v6;
  uint64_t v14 = v7;
  id v8 = v3;
  dispatch_sync(v5, block);
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) insertParentChainForItem:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v3;
      _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't insert parent chain for %@ after fetch - %@%@", buf, 0x20u);
    }
  }
  uint64_t v7 = [*(id *)(a1 + 56) clientDB];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_148;
  v8[3] = &unk_26507ED70;
  v8[4] = *(void *)(a1 + 64);
  [v7 scheduleFlushWithCheckpoint:0 whenFlushed:v8];
}

uint64_t __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_148(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_waitForSharedItemToSyncDownOnOwner_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Wait for shared item to sync down%@");
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) callbackQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2;
  v5[3] = &unk_2650806E8;
  char v6 = a2;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async_with_logs_10(v4, v5);
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    char v2 = [*(id *)(*(void *)(a1 + 32) + 520) clientTruthWorkloop];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_150;
    v14[3] = &unk_26507ED70;
    v14[4] = *(void *)(a1 + 32);
    dispatch_async_with_logs_10(v2, v14);
  }
  else
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_cold_1();
    }

    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    char v6 = [*(id *)(*(void *)(a1 + 32) + 560) share];
    uint64_t v7 = objc_msgSend(v6, "brc_sharedRootDisplayName");
    if (v7)
    {
      id v8 = objc_msgSend(v5, "brc_errorItemNotFound:", v7);
    }
    else
    {
      id v9 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      id v8 = objc_msgSend(v5, "brc_errorItemNotFound:", v9);
    }
    uint64_t v10 = *(void **)(a1 + 32);
    __int16 v11 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", v8);
    [v10 _completeWithError:v11];

    uint64_t v12 = *(void *)(a1 + 32);
    __int16 v13 = *(void **)(v12 + 592);
    *(void *)(v12 + 592) = 0;
  }
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_150(uint64_t a1)
{
  char v2 = [*(id *)(*(void *)(a1 + 32) + 608) itemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  uint64_t v3 = [v2 fileObjectID];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 592);
  *(void *)(v4 + 592) = v3;

  char v6 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_151;
  v7[3] = &unk_26507ED70;
  v7[4] = *(void *)(a1 + 32);
  [v6 scheduleFlushWithCheckpoint:0 whenFlushed:v7];
}

uint64_t __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_151(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_waitForSharedItemToBeOnDiskOnOwner_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Wait for item to be on disk%@");
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 592);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't get user visible file on %@ - %@%@", buf, 0x20u);
    }
  }
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
  __int16 v11 = [v10 serialQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_152;
  v14[3] = &unk_26507ED98;
  uint64_t v12 = *(void *)(a1 + 32);
  id v15 = v5;
  uint64_t v16 = v12;
  id v13 = v5;
  dispatch_async_with_logs_10(v11, v14);
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_152(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 648), v2);
    uint64_t v3 = [*(id *)(a1 + 40) callbackQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_2;
    v11[3] = &unk_26507ED70;
    v11[4] = *(void *)(a1 + 40);
    dispatch_async_with_logs_10(v3, v11);
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    id v5 = [*(id *)(*(void *)(a1 + 40) + 560) share];
    id v6 = objc_msgSend(v5, "brc_sharedRootDisplayName");
    if (v6)
    {
      objc_msgSend(v4, "brc_errorItemNotFound:", v6);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 576) itemIDString];
      objc_msgSend(v4, "brc_errorItemNotFound:", v7);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", v10);
    [v8 _completeWithError:v9];
  }
}

uint64_t __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_createSideFaultOnDisk_step
{
  uint64_t v3 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke;
  block[3] = &unk_26507ED70;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 544))
  {
    uint64_t v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1();
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 560))
  {
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_2();
    }
  }
  memset(v21, 0, sizeof(v21));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _createSideFaultOnDisk_step]_block_invoke", 1385, v21);
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_1();
  }

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  dispatch_group_t v5 = dispatch_group_create();
  id v6 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153;
  v14[3] = &unk_265085140;
  void v14[4] = *(void *)(a1 + 32);
  uint64_t v16 = &v17;
  uint64_t v7 = v5;
  id v15 = v7;
  [v6 groupInBatch:v14];

  if (!*((unsigned char *)v18 + 24))
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 520) clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_170;
    block[3] = &unk_26507ED70;
    void block[4] = *(void *)(a1 + 32);
    dispatch_group_notify(v7, v8, block);
  }
  _Block_object_dispose(&v17, 8);
  __brc_leave_section(v21);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 576);
  id v3 = *(id *)(*(void *)(a1 + 32) + 584);
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 608) itemByItemID:v2];
  if ([*(id *)(a1 + 32) _isLinkInsideFolderShare])
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 608) itemByItemID:v3];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;
  id v7 = *(id *)(*(void *)(a1 + 32) + 672);
  id v8 = *(id *)(*(void *)(a1 + 32) + 680);
  uint64_t v9 = v8;
  if (v4)
  {
    id v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_7((uint64_t)v4);
    }

    if ([v4 isLive])
    {
      uint64_t v12 = [v4 fileObjectID];
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(v13 + 592);
      *(void *)(v13 + 592) = v12;
    }
    else
    {
      if ([v4 isAlmostDead])
      {
        char v20 = brc_bread_crumbs();
        __int16 v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_5((uint64_t)v4);
        }

        id v22 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F08438], 35, @"Share %@ can not be accepted right now.", *(void *)(*(void *)(a1 + 32) + 544));
        [*(id *)(a1 + 32) _completeWithError:v22];
      }
      else
      {
        __int16 v27 = v9;
        id v28 = *(void **)(a1 + 32);
        uint64_t v29 = brc_bread_crumbs();
        objc_super v30 = brc_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
          __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_6((uint64_t)v4);
        }

        id v22 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: item is in an unknown state: %@:", v4);
        [v28 _completeWithError:v22];
        uint64_t v9 = v27;
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    goto LABEL_57;
  }
  id v77 = v8;
  int v15 = [*(id *)(a1 + 32) _isOwner];
  uint64_t v16 = *(id **)(a1 + 32);
  if (!v15)
  {
    id v74 = v6;
    id v75 = v7;
    [v16[77] recreateDocumentsFolderIfNeededInDB];
    if ([*(id *)(*(void *)(a1 + 32) + 560) participantPermission] == 2) {
      uint64_t v23 = 100;
    }
    else {
      uint64_t v23 = 68;
    }
    id v73 = v3;
    if ([*(id *)(a1 + 32) _isFolderShare])
    {
      uint64_t v9 = v77;
      if (([*(id *)(a1 + 32) _isLinkInsideFolderShare] & 1) == 0)
      {
        id v24 = [*(id *)(*(void *)(a1 + 32) + 608) fetchDirectoryContentsIfNecessary:v3 isUserWaiting:1 rescheduleApplyScheduler:1];
        [v24 beginObservingChangesWithDelegate:0];
      }
      __int16 v25 = *(NSObject **)(a1 + 40);
      id v26 = [*(id *)(*(void *)(a1 + 32) + 520) serverTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_163;
      block[3] = &unk_26507ED70;
      void block[4] = *(void *)(a1 + 32);
      dispatch_group_async(v25, v26, block);

      if (v6)
      {
        v76 = 0;
      }
      else
      {
        v39 = [BRCShareAcceptationDirectoryFault alloc];
        uint64_t v40 = *(void *)(a1 + 32);
        uint64_t v41 = *(void *)(v40 + 616);
        [*(id *)(v40 + 608) asSharedClientZone];
        v43 = id v42 = v3;
        v76 = [(BRCShareAcceptationDirectoryFault *)v39 initWithFilename:v75 itemID:v42 parentIDWhenSubitem:0 appLibrary:v41 clientZone:v43 sharingOptions:v23];

        id v3 = v42;
        uint64_t v9 = v77;
      }
      if ([*(id *)(a1 + 32) _isLinkInsideFolderShare])
      {
        uint64_t v44 = v23 & 0x60;
        if ([*(id *)(a1 + 32) _isDocumentLinkInsideFolderShare])
        {
          v45 = BRCShareAcceptationDocumentFault;
        }
        else
        {
          if (![*(id *)(a1 + 32) _isDirectoryLinkInsideFolderShare])
          {
            id v69 = *(void **)(a1 + 32);
            v70 = brc_bread_crumbs();
            id v71 = brc_default_log();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
              __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_4();
            }

            v72 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: item isn't a document or directory");
            [v69 _completeWithError:v72];

            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_56;
          }
          v45 = BRCShareAcceptationDirectoryFault;
        }
        id v46 = [v45 alloc];
        uint64_t v47 = *(void *)(a1 + 32);
        uint64_t v48 = *(void *)(v47 + 616);
        uint64_t v49 = [*(id *)(v47 + 608) asSharedClientZone];
        id v50 = v3;
        v51 = (void *)v49;
        uint64_t v38 = (void *)[v46 initWithFilename:v9 itemID:v2 parentIDWhenSubitem:v50 appLibrary:v48 clientZone:v49 sharingOptions:v44];
      }
      else
      {
        uint64_t v38 = 0;
      }
      v37 = (BRCShareAcceptationDocumentFault *)v76;
    }
    else
    {
      v31 = [BRCShareAcceptationDocumentFault alloc];
      uint64_t v32 = *(void *)(a1 + 32);
      uint64_t v33 = *(void *)(v32 + 616);
      uint64_t v34 = [*(id *)(v32 + 608) asSharedClientZone];
      id v35 = v3;
      __int16 v36 = (void *)v34;
      v37 = [(BRCShareAcceptationDocumentFault *)v31 initWithFilename:v75 itemID:v35 parentIDWhenSubitem:0 appLibrary:v33 clientZone:v34 sharingOptions:v23];

      uint64_t v38 = 0;
    }
    v76 = (BRCShareAcceptationDirectoryFault *)v37;
    v52 = [(BRCLocalItem *)v37 parentClientZone];
    v53 = [(BRCLocalItem *)v37 st];
    v54 = [v53 parentID];
    v55 = [(BRCLocalItem *)v37 st];
    v56 = [v55 logicalName];
    id v57 = [v52 itemByParentID:v54 andLogicalName:v56];

    if (v57)
    {
      v58 = [v57 itemID];
      id v59 = [(BRCLocalItem *)v76 itemID];
      char v60 = [v58 isEqualToItemID:v59];

      if ((v60 & 1) == 0)
      {
        if (([v57 isDead] & 1) != 0 || -[BRCLocalItem isOwnedByMe](v76, "isOwnedByMe"))
        {
          [v57 markBouncedToNextAvailableBounceNumber:506];
          [v57 saveToDB];
        }
        else
        {
          [(BRCLocalItem *)v76 markBouncedToNextAvailableBounceNumber:507];
        }
      }
    }
    [(BRCLocalItem *)v76 saveToDBForServerEdit:1 keepAliases:0];
    [v38 saveToDBForServerEdit:1 keepAliases:0];
    v61 = [v38 fileObjectID];
    id v62 = v61;
    if (!v61)
    {
      id v62 = [(BRCLocalItem *)v76 fileObjectID];
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 592), v62);
    uint64_t v9 = v77;
    if (!v61) {

    }
    v63 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
    [v63 flush];

    id v64 = brc_bread_crumbs();
    v65 = brc_default_log();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_3((uint64_t)v76);
    }

    if (v38)
    {
      v66 = brc_bread_crumbs();
      id v67 = brc_default_log();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_2((uint64_t)v38);
      }
    }
    v68 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
    [v68 flushToMakeEditsVisibleToIPCReaders];

    id v3 = v73;
LABEL_56:
    id v6 = v74;

    id v7 = v75;
    goto LABEL_57;
  }
  uint64_t v17 = brc_bread_crumbs();
  uint64_t v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_1();
  }

  uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: document doesn't exists anymore");
  [v16 _completeWithError:v19];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v9 = v77;
LABEL_57:
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_163(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 608) serverZone];
  [v1 clearStateBits:4];
}

uint64_t __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_170(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_checkIfShouldWaitUntilDownloadCompletion_step
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] _checkIfShouldWaitUntilDownloadCompletion is not relevant in FPFS.%@", v2, v3, v4, v5, v6);
}

- (void)_openSharedSideFaultFileWithAppID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKRecordID *)self->_shareID recordName];
  uint8_t v6 = self->_liveFileURL;
  BOOL v7 = [(NSURL *)self->_liveFileURL startAccessingSecurityScopedResource];
  if (self->_skipOpenInApp)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:]();
    }

    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    BOOL v10 = v7;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = v6;
    id v13 = v4;
    id v14 = v5;
    FPExtendBookmarkForDocumentURL();
    if (v10) {
      [(NSURL *)self->_liveFileURL stopAccessingSecurityScopedResource];
    }
  }
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5)
  {
    uint8_t v6 = brc_bread_crumbs();
    BOOL v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      char v20 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = v20;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Got bookmark string %@ for URL %@%@", buf, 0x20u);
    }
    id v8 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v9 = *MEMORY[0x263F01830];
    v21[0] = *MEMORY[0x263F01808];
    v21[1] = v9;
    v22[0] = v5;
    v22[1] = MEMORY[0x263EFFA88];
    BOOL v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_2(a1, (uint64_t)v11, v12);
    }

    id v13 = [v8 operationToOpenResource:*(void *)(a1 + 32) usingApplication:*(void *)(a1 + 48) uniqueDocumentIdentifier:*(void *)(a1 + 56) isContentManaged:BRCurrentPersonaIsDataSeparated() sourceAuditToken:0 userInfo:v10 options:0 delegate:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) addSubOperation:v13];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F32360];
    if (a3)
    {
      uint64_t v29 = *MEMORY[0x263F08608];
      v30[0] = a3;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v17 = [*(id *)(a1 + 32) path];
    id v8 = objc_msgSend(v14, "br_errorWithDomain:code:userInfo:description:", v15, 10, v16, @"Can't get bookmark string at %@", v17);

    if (a3) {
    uint64_t v18 = brc_bread_crumbs();
    }
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
      __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_1((id *)(a1 + 32));
    }

    [*(id *)(a1 + 40) _completeWithError:v8];
  }
}

- (void)_openDocumentInDocumentsAppIfInstalled:(id)a3
{
  id v4 = a3;
  if (self->_skipOpenInApp)
  {
    id v5 = brc_bread_crumbs();
    uint8_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:]();
    }

    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    BOOL v7 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.DocumentsApp"];
    id v8 = [v7 appState];
    int v9 = [v8 isInstalled];

    if (v9)
    {
      BOOL v10 = [MEMORY[0x263F01880] defaultWorkspace];
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v4 resolvingAgainstBaseURL:0];
      [v11 setScheme:@"shareddocuments"];
      uint64_t v12 = [v11 URL];
      id v18 = 0;
      [v10 openSensitiveURL:v12 withOptions:0 error:&v18];
      id v13 = v18;

      if (v13)
      {
        id v14 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", v13);
        [(BRCSharingAcceptFlowOperation *)self _completeWithError:v14];
      }
      else
      {
        [(BRCSharingAcceptFlowOperation *)self _performNextStep];
      }
    }
    else
    {
      userNotification = self->_userNotification;
      shareURL = self->_shareURL;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __72__BRCSharingAcceptFlowOperation__openDocumentInDocumentsAppIfInstalled___block_invoke;
      v17[3] = &unk_26507ED70;
      v17[4] = self;
      [(BRCUserNotifier *)userNotification showErrorDocumentsAppNotVisibleForShareURL:shareURL reply:v17];
    }
  }
}

uint64_t __72__BRCSharingAcceptFlowOperation__openDocumentInDocumentsAppIfInstalled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_openSharedSideFaultFile_step
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _liveFileURL%@", v2, v3, v4, v5, v6);
}

- (void)_finishShareAccept_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Waiting for share accept to finish%@");
}

void __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 704);
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke_cold_1((uint64_t)v2);
  }

  if ((objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 3) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 4) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 29) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 32) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
    || objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 10))
  {
    [*(id *)(a1 + 32) _completeWithError:v2];
    goto LABEL_10;
  }
  if (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 9))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
LABEL_16:
    id v8 = (void *)v6;
    [v5 _completeWithError:v6];

    goto LABEL_10;
  }
  BOOL v7 = *(void **)(a1 + 32);
  if (!v2)
  {
    [v7 _performNextStep];
    goto LABEL_10;
  }
  if (([v7 finishIfCancelled] & 1) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", v2);
    goto LABEL_16;
  }
LABEL_10:
}

- (void)_createServerFaultIfPossibleWithCompletion:(id)a3
{
  id v4 = a3;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:]", 1844, v15);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:]();
  }

  if (!self->_clientZone)
  {
    int v9 = brc_bread_crumbs();
    BOOL v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:]();
    }
  }
  if (!self->_linkItemID)
  {
    uint64_t v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _openiWorkAppPreemptively_step]();
    }
  }
  if (self->_allowsDirectoryFaults)
  {
    BOOL v7 = [(BRCClientZone *)self->_clientZone db];
    id v8 = [v7 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke;
    block[3] = &unk_26507F850;
    void block[4] = self;
    id v14 = v4;
    dispatch_async(v8, block);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
  __brc_leave_section(v15);
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 608) serverItemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _performNextStep];
    return;
  }
  int v4 = [v3 _isDocumentLinkInsideFolderShare];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 560) sharedItemHierarchyIDs];
  unint64_t v6 = [v5 count];
  if (v4) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 1;
  }

  if (v6 <= v7)
  {
    if (![*(id *)(a1 + 32) _isOwner]
      || ([*(id *)(*(void *)(a1 + 32) + 576) isEqualToItemID:*(void *)(*(void *)(a1 + 32) + 584)] & 1) == 0&& (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 608), "serverItemByItemID:", *(void *)(*(void *)(a1 + 32) + 584)), uint64_t v33 = objc_claimAutoreleasedReturnValue(), v33, v33))
    {
      uint64_t v34 = brc_bread_crumbs();
      id v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_2();
      }

      [*(id *)(a1 + 32) _performNextStep];
      return;
    }
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 608) serverZone];
  int v9 = [*(id *)(*(void *)(a1 + 32) + 560) rootRecordID];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v11 = [[BRCFetchRecordSubResourcesOperation alloc] initAndScheduleWithServerZone:v8 parentOperation:*(void *)(a1 + 32) pendingChangesStream:0 contentRecordsFetchedInline:1 sessionContext:*(void *)(*(void *)(a1 + 32) + 256)];
  [v10 addObject:v9];
  [v10 addObject:*(void *)(*(void *)(a1 + 32) + 552)];
  uint64_t v12 = [v9 recordName];
  if (![v12 hasPrefix:@"documentContent/"]) {
    goto LABEL_12;
  }
  int v13 = [v8 isPrivateZone];

  if (v13)
  {
    id v14 = [v9 recordName];
    uint64_t v12 = [v14 substringFromIndex:objc_msgSend(@"documentContent/", "length")];

    uint64_t v15 = [@"documentStructure/" stringByAppendingString:v12];
    id v16 = objc_alloc(MEMORY[0x263EFD7E8]);
    uint64_t v17 = [v9 zoneID];
    id v18 = (void *)[v16 initWithRecordName:v15 zoneID:v17];

    [v10 addObject:v18];
LABEL_12:
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 560) sharedItemHierarchyIDs];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v19);
        }
        [v10 addObject:*(void *)(*((void *)&v44 + 1) + 8 * i)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v21);
  }

  if (!v9)
  {
    __int16 v36 = brc_bread_crumbs();
    v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_1();
    }
  }
  id v24 = objc_alloc(MEMORY[0x263EFD6D8]);
  __int16 v25 = [v10 allObjects];
  id v26 = (void *)[v24 initWithRecordIDs:v25];

  __int16 v27 = [MEMORY[0x263EFD7C8] desiredKeysWithMask:185];
  [v26 setDesiredKeys:v27];

  [v26 setShouldFetchAssetContent:0];
  id v28 = [v11 callbackQueue];
  [v26 setCallbackQueue:v28];

  uint64_t v38 = MEMORY[0x263EF8330];
  uint64_t v39 = 3221225472;
  uint64_t v40 = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191;
  uint64_t v41 = &unk_2650823D8;
  id v43 = *(id *)(a1 + 40);
  id v29 = v11;
  id v42 = v29;
  [v26 setFetchRecordsCompletionBlock:&v38];
  int v30 = objc_msgSend(v8, "isPrivateZone", v38, v39, v40, v41);
  v31 = *(id **)(a1 + 32);
  if (v30)
  {
    uint64_t v32 = [v31[77] transferSyncContext];
    [v31 addSubOperation:v26 overrideContext:v32 allowsCellularAccess:0];
  }
  else
  {
    [v31 addSubOperation:v26];
  }
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    unint64_t v6 = brc_bread_crumbs();
    unint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191_cold_1((uint64_t)v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [a2 allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 32) addRecord:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    int v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_192;
    v14[3] = &unk_26507F850;
    id v15 = v13;
    id v16 = *(id *)(a1 + 40);
    [v15 notifyWhenRecordsAreFetchedAndFinish:v14];
  }
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_192(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_192_cold_2();
  }

  int v4 = [*(id *)(a1 + 32) saveRecordsWithQueryCursor:0];
  id v5 = [*(id *)(a1 + 32) error];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) error];
  }
  else
  {
    if (v4)
    {
      (*(void (**)(void, void))(v6 + 16))(*(void *)(a1 + 40), 0);
      return;
    }
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_192_cold_1();
    }

    uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: couldn't save to server truth when creating server fault");
  }
  uint64_t v10 = (void *)v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
}

- (void)_locateSharedItemOnRecipient_step
{
  if ([(BRCSharingAcceptFlowOperation *)self _isOwner]) {
    goto LABEL_3;
  }
  uint64_t v3 = [(BRCClientZone *)self->_clientZone serverZone];
  char v4 = [v3 state];
  id v5 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
  uint64_t v6 = [v5 serverZone];
  char v7 = v4 & [v6 state];

  if ((v7 & 4) != 0)
  {
LABEL_3:
    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke;
    v8[3] = &unk_26507EBD8;
    v8[4] = self;
    [(BRCSharingAcceptFlowOperation *)self _createServerFaultIfPossibleWithCompletion:v8];
  }
}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 520) clientTruthWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_2;
  block[3] = &unk_26507ED70;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 608) serverItemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  if (v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 520) serverAliasItemForSharedItem:v2];
    char v4 = *(id **)(a1 + 32);
    if (v3)
    {
      [v4 _performNextStep];
    }
    else
    {
      char v7 = [v4[77] defaultClientZone];
      id v8 = [v2 itemGlobalID];
      uint64_t v9 = [v7 serverZone];
      uint64_t v10 = +[BRCItemID shareAliasRecordIDFromTargetItemID:v8 zone:v9 hasDerivedShareAlias:0];

      uint64_t v11 = [v7 locateRecordIfNecessaryForRecordID:v10 isUserWaiting:1];
      if (v11)
      {
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_198;
        v14[3] = &unk_26507F5E0;
        id v12 = v10;
        uint64_t v13 = *(void *)(a1 + 32);
        id v15 = v12;
        uint64_t v16 = v13;
        [v11 addLocateRecordCompletionBlock:v14];
      }
      else
      {
        [*(id *)(a1 + 32) _performNextStep];
      }
    }
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v18 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't create a directory fault%@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _performNextStep];
  }
}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_198(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = brc_bread_crumbs();
  char v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = @"fail";
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    if (a2) {
      id v8 = @"success";
    }
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    long long v17 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] Fetch share alias for share alias record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }

  [*(id *)(a1 + 40) _performNextStep];
}

- (void)_waitForSharedItemToSyncDownOnRecipient_step
{
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _waitForSharedItemToSyncDownOnRecipient_step]", 1964, v7);
  uint64_t v3 = brc_bread_crumbs();
  char v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingAcceptFlowOperation _waitForSharedItemToSyncDownOnOwner_step]();
  }

  if ([(BRCSharingAcceptFlowOperation *)self _isOwner])
  {
    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    clientZone = self->_clientZone;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke;
    v6[3] = &unk_265084838;
    v6[4] = self;
    [(BRCClientZone *)clientZone performBlock:v6 whenSyncDownCompletesLookingForItemID:self->_linkItemID];
    [(BRCSharingAcceptFlowOperation *)self _activateSharedZoneIfNeeded];
  }
  __brc_leave_section(v7);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke(uint64_t a1, char a2)
{
  char v4 = [*(id *)(a1 + 32) callbackQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2;
  v5[3] = &unk_2650806E8;
  char v6 = a2;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async_with_logs_10(v4, v5);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 520) clientTruthWorkloop];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_205;
    v14[3] = &unk_26507ED70;
    void v14[4] = *(void *)(a1 + 32);
    dispatch_async_with_logs_10(v2, v14);
  }
  else
  {
    uint64_t v3 = brc_bread_crumbs();
    char v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2_cold_1();
    }

    id v5 = (void *)MEMORY[0x263F087E8];
    char v6 = [*(id *)(*(void *)(a1 + 32) + 560) share];
    char v7 = objc_msgSend(v6, "brc_sharedRootDisplayName");
    if (v7)
    {
      id v8 = objc_msgSend(v5, "brc_errorItemNotFound:", v7);
    }
    else
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      id v8 = objc_msgSend(v5, "brc_errorItemNotFound:", v9);
    }
    int v10 = *(void **)(a1 + 32);
    uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", v8);
    [v10 _completeWithError:v11];

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 592);
    *(void *)(v12 + 592) = 0;
  }
}

uint64_t __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_205(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 608) itemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  uint64_t v3 = [v2 fileObjectID];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 592);
  *(void *)(v4 + 592) = v3;

  char v6 = *(void **)(a1 + 32);
  return [v6 _performNextStep];
}

- (void)_waitForSharedItemToBeOnDiskOnRecipient_step
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _linkFileObjectID%@", v2, v3, v4, v5, v6);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 592);
      *(_DWORD *)buf = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v13 = 2112;
      __int16 v14 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't get user visible file on %@ - %@%@", buf, 0x20u);
    }
  }
  char v7 = [*(id *)(*(void *)(a1 + 32) + 520) clientTruthWorkloop];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_206;
  v8[3] = &unk_26507ED70;
  v8[4] = *(void *)(a1 + 32);
  dispatch_async_with_logs_10(v7, v8);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_206(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 648))
  {
    [(id)v2 _performNextStep];
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = [*(id *)(v2 + 560) share];
    uint64_t v5 = objc_msgSend(v4, "brc_sharedRootDisplayName");
    if (v5)
    {
      objc_msgSend(v3, "brc_errorItemNotFound:", v5);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      objc_msgSend(v3, "brc_errorItemNotFound:", v6);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    char v7 = *(void **)(a1 + 32);
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", v9);
    [v7 _completeWithError:v8];
  }
}

- (void)_locateSharedItemOnDisk_step
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Locate shared folder on disk%@");
}

void __61__BRCSharingAcceptFlowOperation__locateSharedItemOnDisk_step__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 608) itemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  if ([v2 isOnDisk])
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
    [v3 flushToMakeEditsVisibleToIPCReaders];

    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v2 fileObjectID];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__BRCSharingAcceptFlowOperation__locateSharedItemOnDisk_step__block_invoke_207;
    uint64_t v15[3] = &unk_26507EBD8;
    v15[4] = *(void *)(a1 + 32);
    [v4 _fetchOpenInfoOnFileObjectID:v5 completion:v15];
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    char v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 576);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ wasn't able to be found on disk.  We must have reset or be broken structure or it was deleted locally.%@", buf, 0x16u);
    }

    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 560) share];
    __int16 v11 = objc_msgSend(v10, "brc_sharedRootDisplayName");
    if (v11)
    {
      uint64_t v5 = objc_msgSend(v9, "brc_errorItemNotFound:", v11);
    }
    else
    {
      id v12 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      uint64_t v5 = objc_msgSend(v9, "brc_errorItemNotFound:", v12);
    }
    __int16 v13 = *(void **)(a1 + 32);
    __int16 v14 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
    [v13 _completeWithError:v14];
  }
}

void __61__BRCSharingAcceptFlowOperation__locateSharedItemOnDisk_step__block_invoke_207(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _completeWithError:v4];
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    [v3 _performNextStep];
  }
}

- (void)_prepareToDownloadSharedDocument_step
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Going to download a dataless item that is already accepted%@", v2, v3, v4, v5, v6);
}

- (void)_setSpotlightAttribute_step
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] _setSpotlightAttribute is not relevant in FPFS%@", v2, v3, v4, v5, v6);
}

- (void)_openSharedItemIfStillNeeded_step
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->_liveFileURL)
  {
    id v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFile_step]();
    }
  }
  memset(v11, 0, sizeof(v11));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _openSharedItemIfStillNeeded_step]", 2223, v11);
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v11[0];
    uint64_t v8 = [(NSURL *)self->_liveFileURL path];
    *(_DWORD *)buf = 134218498;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Open shared document if still needed at %@%@", buf, 0x20u);
  }
  if (!self->_liveFileURL)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"_liveFileURL", 0);
    uint8_t v6 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
    [(BRCSharingAcceptFlowOperation *)self _completeWithError:v6];

LABEL_11:
    goto LABEL_12;
  }
  if ([(BRCSharingAcceptFlowOperation *)self _isFolderShare])
  {
    uint64_t v5 = [(NSURL *)self->_shareURL brc_applicationContainerID];
    if (v5) {
      [(BRCSharingAcceptFlowOperation *)self _openSharedSideFaultFileWithAppID:v5];
    }
    else {
      [(BRCSharingAcceptFlowOperation *)self _openDocumentInDocumentsAppIfInstalled:self->_liveFileURL];
    }
    goto LABEL_11;
  }
  [(BRCSharingAcceptFlowOperation *)self _performNextStep];
LABEL_12:
  __brc_leave_section(v11);
}

- (void)_endAcceptationFlow_step
{
}

+ (id)_runningShareIDs
{
  if (_runningShareIDs_onceToken != -1) {
    dispatch_once(&_runningShareIDs_onceToken, &__block_literal_global_50);
  }
  uint64_t v2 = (void *)_runningShareIDs_ret;
  return v2;
}

void __49__BRCSharingAcceptFlowOperation__runningShareIDs__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)_runningShareIDs_ret;
  _runningShareIDs_ret = v0;
}

- (BOOL)skipOpenInApp
{
  return self->_skipOpenInApp;
}

- (void)setSkipOpenInApp:(BOOL)a3
{
  self->_skipOpenInApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareAcceptationError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_linkFilename, 0);
  objc_storeStrong((id *)&self->_rootFilename, 0);
  objc_storeStrong((id *)&self->_shareAcceptGroup, 0);
  objc_storeStrong((id *)&self->_liveFileURL, 0);
  objc_storeStrong((id *)&self->_acceptOperation, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_unsaltedBookmarkData, 0);
  objc_storeStrong((id *)&self->_linkFileObjectID, 0);
  objc_storeStrong((id *)&self->_rootItemID, 0);
  objc_storeStrong((id *)&self->_linkItemID, 0);
  objc_storeStrong((id *)&self->_linkItemRecordID, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_acceptationFlow, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_userActionsNavigator, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
}

- (void)_completeWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] network is unreachable, replacing error with generic network error%@", v2, v3, v4, v5, v6);
}

- (void)_completeWithError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] failing share acceptation with %@%@", (void)v3, DWORD2(v3));
}

- (void)_completeWithError:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _shareMetadata%@", v2, v3, v4, v5, v6);
}

- (void)_completeWithError:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: error.underlyingErrors.count == 1%@", v2, v3, v4, v5, v6);
}

- (void)_completeWithError:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: error _completeWithError must be called only in case we should complete with an error%@", v2, v3, v4, v5, v6);
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] fallback to iCloud Web with reason: %@%@", (void)v3, DWORD2(v3));
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self->_shareURL%@", v2, v3, v4, v5, v6);
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !(goToAppStore && openWebPreview)%@", v2, v3, v4, v5, v6);
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !(goToSettings && openWebPreview)%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Session is not cancelled but DBs serial queue is nil!%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.cancelled || _hadProcessedCompletionError completedWithResult:error: called with error directly. Should call _completeWithError: instead.%@", v2, v3, v4, v5, v6);
}

void __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] delete share acceptation fault because operation failed%@", v2, v3, v4, v5, v6);
}

- (void)_isiWorkShare
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _shareURL%@", v2, v3, v4, v5, v6);
}

- (void)openResourceOperationDidComplete:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Open application completed successfully%@", v2, v3, v4, v5, v6);
}

- (void)openResourceOperation:(uint64_t)a1 didFailWithError:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] Failed to open the target app - %@%@", (void)v3, DWORD2(v3));
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] accept operation completed with success%@", v2, v3, v4, v5, v6);
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: No operation error and no share id%@", v2, v3, v4, v5, v6);
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: %@ wasn't found after syncing down on the owner%@");
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Preparing side fault%@");
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self->_shareMetadata%@", v2, v3, v4, v5, v6);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: document doesn't exists anymore%@", v2, v3, v4, v5, v6);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] created link shared item-to-be in db: %@%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] created shared item-to-be in db: %@%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: item isn't a document or directory%@", v2, v3, v4, v5, v6);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_5(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] share item %@ is in transient state, should try again later%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_6(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: item is in an unknown state: %@:%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_153_cold_7(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] found share item %@%@", (void)v3, DWORD2(v3));
}

- (void)_openSharedSideFaultFileWithAppID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Skipping open in app%@", v2, v3, v4, v5, v6);
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 path];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_23FA42000, v2, v3, "[ERROR] can't get bookmark string at %@%@", v4, v5, v6, v7, v8);
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_3();
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] doing open operation on \"%@\" with \"%@\"%@", v7, 0x20u);
}

void __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Share accept finished with error %@%@", (void)v3, DWORD2(v3));
}

- (void)_createServerFaultIfPossibleWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _clientZone%@", v2, v3, v4, v5, v6);
}

- (void)_createServerFaultIfPossibleWithCompletion:.cold.3()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Creating server fault if possible%@");
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: rootRecordID%@", v2, v3, v4, v5, v6);
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] We don't have need to fetch deeply into the folder. Letting the list directory take care of fetching%@", v2, v3, v4, v5, v6);
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Failed to fetch record for server fault - %@%@", (void)v3, DWORD2(v3));
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_192_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: couldn't save to server truth when creating server fault%@", v2, v3, v4, v5, v6);
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_192_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Finished fetching records for server fault%@", v2, v3, v4, v5, v6);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] %@ wasn't found after syncing down%@");
}

@end