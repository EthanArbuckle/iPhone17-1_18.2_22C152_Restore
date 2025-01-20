@interface ICCollaborationController
+ (BOOL)showCloudKitShareAcceptancePartialFailureAlertForError:(id)a3 alertBlock:(id)a4;
+ (ICCollaborationController)sharedInstance;
+ (UIImage)shareSheetFolderThumbnailImage;
+ (UIImage)shareSheetNoteThumbnailImage;
+ (id)highlightColorForUserID:(id)a3 inNote:(id)a4 isDark:(BOOL)a5;
+ (id)newShareForObject:(id)a3;
+ (id)rootRecordForObject:(id)a3;
+ (id)serverShareCheckingParent:(id)a3 managedObjectContext:(id)a4;
+ (id)serverShareIfRootObject:(id)a3 managedObjectContext:(id)a4;
+ (id)updatedShareForObject:(id)a3 includeHierarchicalShare:(BOOL)a4 managedObjectContext:(id)a5;
+ (int64_t)shareStatusOfFolder:(id)a3 objectsForMakingDecision:(id)a4;
+ (void)didFailToUpdateShareWithError:(id)a3;
+ (void)genericShareErrorAlert:(id)a3;
+ (void)postDidUpdateShareNotificationForObject:(id)a3;
+ (void)saveActivityType:(id)a3 isCollaborationSelected:(BOOL)a4 error:(id)a5 completed:(BOOL)a6 forNote:(id)a7;
+ (void)showQuotaExceededAlertIfNeededWithRecordID:(id)a3 accountID:(id)a4;
+ (void)trackShare:(id)a3 forNote:(id)a4;
- (ICCollaborationAnalyticsDelegate)collaborationAnalyticsDelegate;
- (ICCollaborationAnalyticsTracker)collaborationAnalyticsTracker;
- (ICCollaborationController)initWithDelegate:(id)a3;
- (ICCollaborationControllerDelegate)collaborationControllerDelegate;
- (ICSelectorDelayer)updateSharesDelayer;
- (NSMutableDictionary)ckShareIDToRootRecordID;
- (id)backgroundContext;
- (id)cloudContext;
- (id)containerForAccountID:(id)a3;
- (id)containerForUserRecordID:(id)a3;
- (id)objectForCKShareRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)objectForShare:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)viewContext;
- (void)acceptShareWithMetadata:(id)a3 attemptNumber:(id)a4 container:(id)a5 accountID:(id)a6 fetchObjectWithCompletionHandler:(id)a7;
- (void)acceptShareWithMetadata:(id)a3 container:(id)a4 accountID:(id)a5 fetchObjectWithCompletionHandler:(id)a6;
- (void)acceptShareWithMetadata:(id)a3 managedObjectContext:(id)a4 completionHandler:(id)a5;
- (void)didSaveShare:(id)a3 accountID:(id)a4;
- (void)didStopSharing:(id)a3 recordID:(id)a4 accountID:(id)a5;
- (void)fetchAndAcceptShareMetadataWithURL:(id)a3 managedObjectContext:(id)a4 alertBlock:(id)a5 showObjectBlock:(id)a6;
- (void)fetchShareIfNecessaryForObject:(id)a3 completionHandler:(id)a4;
- (void)managedObjectContextObjectsDidChange:(id)a3;
- (void)prepareShare:(id)a3 forObject:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6;
- (void)processShareAcceptanceWithMetadata:(id)a3 managedObjectContext:(id)a4 alertBlock:(id)a5 showObjectBlock:(id)a6;
- (void)registerShareForObject:(id)a3 itemProvider:(id)a4 generateThumbnails:(BOOL)a5;
- (void)registerShareForObject:(id)a3 itemProvider:(id)a4 generateThumbnails:(BOOL)a5 sharePreparationHandler:(id)a6;
- (void)removeShareIfNeededWithOwnedObjectID:(id)a3 countParticipants:(BOOL)a4 completionHandler:(id)a5;
- (void)saveServerShare:(id)a3 persistParticipantEvents:(BOOL)a4 accountID:(id)a5;
- (void)saveShare:(id)a3 attemptNumber:(id)a4 forObject:(id)a5 accountID:(id)a6 container:(id)a7 qualityOfService:(int64_t)a8 retryPrepHandler:(id)a9 completionHandler:(id)a10;
- (void)saveShare:(id)a3 forObject:(id)a4 accountID:(id)a5 container:(id)a6 qualityOfService:(int64_t)a7 retryPrepHandler:(id)a8 completionHandler:(id)a9;
- (void)saveShare:(id)a3 forObject:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6;
- (void)saveShare:(id)a3 withRootRecord:(id)a4 object:(id)a5 accountID:(id)a6 container:(id)a7 qualityOfService:(int64_t)a8 completionHandler:(id)a9;
- (void)setCkShareIDToRootRecordID:(id)a3;
- (void)setCollaborationAnalyticsDelegate:(id)a3;
- (void)setCollaborationAnalyticsTracker:(id)a3;
- (void)setCollaborationControllerDelegate:(id)a3;
- (void)updatePendingInvitationsInAccountWithID:(id)a3 receivedSince:(id)a4;
- (void)updateRootRecordMapWithShare:(id)a3;
- (void)updateShares;
@end

@implementation ICCollaborationController

uint64_t __43__ICCollaborationController_sharedInstance__block_invoke()
{
  sharedInstance_instance = [[ICCollaborationController alloc] initWithDelegate:0];
  return MEMORY[0x1F41817F8]();
}

- (void)setCollaborationAnalyticsDelegate:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_collaborationAnalyticsDelegate, v6);
  if (v6)
  {
    v4 = [[ICCollaborationAnalyticsTracker alloc] initWithDelegate:v6];
    collaborationAnalyticsTracker = self->_collaborationAnalyticsTracker;
    self->_collaborationAnalyticsTracker = v4;
  }
  else
  {
    collaborationAnalyticsTracker = self->_collaborationAnalyticsTracker;
    self->_collaborationAnalyticsTracker = 0;
  }
}

- (ICCollaborationController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICCollaborationController;
  v5 = [(ICCollaborationController *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collaborationControllerDelegate, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    ckShareIDToRootRecordID = v6->_ckShareIDToRootRecordID;
    v6->_ckShareIDToRootRecordID = (NSMutableDictionary *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:v6 selector:sel_updateShares delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:3.0];
    updateSharesDelayer = v6->_updateSharesDelayer;
    v6->_updateSharesDelayer = (ICSelectorDelayer *)v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel_managedObjectContextObjectsDidChange_ name:*MEMORY[0x1E4F1BE30] object:0];

    v12 = [(ICCollaborationController *)v6 updateSharesDelayer];
    [v12 requestFire];
  }
  return v6;
}

- (ICSelectorDelayer)updateSharesDelayer
{
  return self->_updateSharesDelayer;
}

uint64_t __66__ICCollaborationController_managedObjectContextObjectsDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 changedValues];
  v3 = [v2 allKeys];
  id v4 = NSStringFromSelector(sel_isShareDirty);
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

- (void)managedObjectContextObjectsDidChange:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 object];
  id v6 = ICCheckedDynamicCast();

  objc_opt_class();
  uint64_t v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1BDF8]];
  uint64_t v9 = ICCheckedDynamicCast();
  v10 = objc_msgSend(v9, "ic_objectsOfClass:", objc_opt_class());

  objc_opt_class();
  v35 = v4;
  v11 = [v4 userInfo];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA8]];
  v13 = ICCheckedDynamicCast();
  objc_super v14 = objc_msgSend(v13, "ic_objectsOfClass:", objc_opt_class());

  v33 = objc_msgSend(v14, "ic_objectsPassingTest:", &__block_literal_global_126);
  if ([v33 count])
  {
    v15 = [(ICCollaborationController *)self updateSharesDelayer];
    [v15 requestFire];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v34 = v14;
  v16 = [v10 setByAddingObjectsFromSet:v14];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v22 = [v21 serverShare];
        if (v22)
        {
          v23 = (void *)v22;
          v24 = [v21 invitation];

          if (!v24)
          {
            v25 = (void *)MEMORY[0x1E4F833B8];
            v26 = [v21 serverShare];
            v27 = [v26 URL];
            v28 = [v25 invitationWithShareURL:v27 context:v6];

            if (v28)
            {
              [v28 setRootObject:v21];
              v29 = [v21 serverShare];
              [v28 updateFromShare:v29];

              v30 = os_log_create("com.apple.notes", "Collaboration");
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v36 = [v21 serverShare];
                v31 = objc_msgSend(v36, "ic_loggingDescription");
                v32 = [v21 objectID];
                *(_DWORD *)buf = 138412546;
                v42 = v31;
                __int16 v43 = 2112;
                v44 = v32;
                _os_log_debug_impl(&dword_1B08EB000, v30, OS_LOG_TYPE_DEBUG, "Updated invitation and associated it with object {share: %@, objectID: %@}", buf, 0x16u);
              }
            }
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v18);
  }
}

- (void)setCollaborationControllerDelegate:(id)a3
{
}

+ (ICCollaborationController)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_56);
  }
  v2 = (void *)sharedInstance_instance;
  return (ICCollaborationController *)v2;
}

- (id)viewContext
{
  v3 = [(ICCollaborationController *)self collaborationControllerDelegate];
  if (v3)
  {
    id v4 = [(ICCollaborationController *)self collaborationControllerDelegate];
    [v4 viewContextForCollaborationController:self];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F83428] sharedContext];
    [v4 managedObjectContext];
  uint64_t v5 = };

  return v5;
}

- (id)backgroundContext
{
  v3 = [(ICCollaborationController *)self collaborationControllerDelegate];
  if (v3)
  {
    id v4 = [(ICCollaborationController *)self collaborationControllerDelegate];
    [v4 backgroundContextForCollaborationController:self];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F83428] sharedContext];
    [v4 workerManagedObjectContext];
  uint64_t v5 = };

  return v5;
}

- (id)cloudContext
{
  v3 = [(ICCollaborationController *)self collaborationControllerDelegate];
  if (v3)
  {
    id v4 = [(ICCollaborationController *)self collaborationControllerDelegate];
    uint64_t v5 = [v4 cloudContextForCollaborationController:self];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F83318] sharedContext];
  }

  return v5;
}

- (void)registerShareForObject:(id)a3 itemProvider:(id)a4 generateThumbnails:(BOOL)a5
{
}

- (void)registerShareForObject:(id)a3 itemProvider:(id)a4 generateThumbnails:(BOOL)a5 sharePreparationHandler:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_super v14 = [v10 shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    v32 = v14;
    _os_log_impl(&dword_1B08EB000, v13, OS_LOG_TYPE_INFO, "Registering cloud sharing service for %@", buf, 0xCu);
  }
  v15 = os_log_create("com.apple.notes", "Collaboration");
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  uint64_t v17 = v15;
  uint64_t v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "com.apple.notes.collaboration.registerShare", "", buf, 2u);
  }

  uint64_t v19 = [v10 cloudAccount];
  if ([v19 accountType] == 1)
  {
    v20 = [v19 identifier];
    uint64_t v21 = [v20 length];

    if (v21)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke;
      v23[3] = &unk_1E5FDC9E0;
      v23[4] = self;
      id v24 = v19;
      id v25 = v10;
      id v26 = v11;
      id v28 = v12;
      BOOL v30 = a5;
      v27 = v18;
      os_signpost_id_t v29 = v16;
      [v24 performBlockInPersonaContext:v23];
    }
    else
    {
      uint64_t v22 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ICCollaborationController registerShareForObject:itemProvider:generateThumbnails:sharePreparationHandler:]();
      }
    }
  }
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 containerForAccountID:v3];

  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 40) managedObjectContext];
    v8 = [v5 serverShareCheckingParent:v6 managedObjectContext:v7];

    uint64_t v9 = os_log_create("com.apple.notes", "Collaboration");
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_3((uint64_t)v8, (id *)(a1 + 48));
      }

      [*(id *)(a1 + 32) updateRootRecordMapWithShare:v8];
      id v11 = *(void **)(a1 + 56);
      id v12 = [MEMORY[0x1E4F19E40] standardOptions];
      [v11 registerCKShare:v8 container:v4 allowedSharingOptions:v12];
    }
    else
    {
      if (v10) {
        __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_2((id *)(a1 + 48));
      }

      v13 = _Block_copy(*(const void **)(a1 + 72));
      if (v13) {
        objc_super v14 = v13;
      }
      else {
        objc_super v14 = &__block_literal_global_31;
      }
      if (*(unsigned char *)(a1 + 88)) {
        objc_msgSend(MEMORY[0x1E4F1A390], "ic_cacheThumbnailsForObject:", *(void *)(a1 + 48));
      }
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      id v24 = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_2;
      id v25 = &unk_1E5FDC9B8;
      id v30 = v14;
      id v15 = *(id *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 32);
      id v26 = v15;
      uint64_t v27 = v16;
      id v28 = *(id *)(a1 + 48);
      id v17 = *(id *)(a1 + 64);
      uint64_t v18 = *(void *)(a1 + 80);
      id v29 = v17;
      uint64_t v31 = v18;
      id v12 = v14;
      uint64_t v19 = _Block_copy(&v22);
      v20 = *(void **)(a1 + 56);
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F19E40], "standardOptions", v22, v23, v24, v25);
      [v20 registerCKShareWithContainer:v4 allowedSharingOptions:v21 preparationHandler:v19];
    }
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_1();
    }
  }
}

uint64_t __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_28(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 64);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_3;
  v12[3] = &unk_1E5FDC990;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = v7;
  id v17 = v3;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  id v16 = v8;
  uint64_t v18 = v9;
  BOOL v10 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v11 = v3;
  v10(v4, v12);
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_4;
  v8[3] = &unk_1E5FDC990;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v5;
  id v13 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 72);
  id v12 = v6;
  uint64_t v14 = v7;
  [v2 performBlock:v8];
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_4(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_5;
  v6[3] = &unk_1E5FDC990;
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 72);
  id v9 = v4;
  uint64_t v11 = v5;
  [v2 performBlockInPersonaContext:v6];
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_5(uint64_t a1)
{
  v2 = (void *)[(id)objc_opt_class() newShareForObject:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) identifier];
  [*(id *)(a1 + 32) updateRootRecordMapWithShare:v2];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_6;
  v10[3] = &unk_1E5FDC968;
  id v11 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 72);
  id v12 = v6;
  id v13 = v3;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v16 = v7;
  uint64_t v14 = v8;
  id v9 = v3;
  [v4 prepareShare:v2 forObject:v5 qualityOfService:25 completionHandler:v10];
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_7;
  v19[3] = &unk_1E5FDB0C8;
  id v22 = *(id *)(a1 + 64);
  id v8 = v5;
  id v20 = v8;
  id v9 = v6;
  id v21 = v9;
  [v7 performBlockInPersonaContext:v19];
  id v10 = *(id *)(a1 + 40);
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "com.apple.notes.collaboration.registerShare", "", v18, 2u);
  }

  if (v8)
  {
    id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v13, "ic_setNonNilObject:forNonNilKey:", v8, *MEMORY[0x1E4F83178]);
    objc_msgSend(v13, "ic_setNonNilObject:forNonNilKey:", *(void *)(a1 + 48), *MEMORY[0x1E4F83170]);
    uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v15 = *MEMORY[0x1E4F83168];
    uint64_t v16 = *(void *)(a1 + 56);
    id v17 = (void *)[v13 copy];
    [v14 postNotificationName:v15 object:v16 userInfo:v17];
  }
}

uint64_t __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_7(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (int64_t)shareStatusOfFolder:(id)a3 objectsForMakingDecision:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  uint64_t v7 = ICDynamicCast();

  if (v7)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 1;
    id v8 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__ICCollaborationController_shareStatusOfFolder_objectsForMakingDecision___block_invoke;
    v10[3] = &unk_1E5FD9D20;
    id v11 = v5;
    id v13 = &v14;
    id v12 = v6;
    [v8 performBlockAndWait:v10];

    uint64_t v7 = (void *)v15[3];
    _Block_object_dispose(&v14, 8);
  }

  return (int64_t)v7;
}

uint64_t __74__ICCollaborationController_shareStatusOfFolder_objectsForMakingDecision___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSharedViaICloud];
  if (result)
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) canBeSharedViaICloud];
    if (result)
    {
      id v4 = *(void **)(a1 + 40);
      id v5 = +[ICMoveDecision objectsForMakingDecisionForNonSharedFolder:*(void *)(a1 + 32)];
      [v4 addObjectsFromArray:v5];

      uint64_t result = objc_msgSend(*(id *)(a1 + 40), "ic_containsObjectPassingTest:", &__block_literal_global_39);
      if (result)
      {
        uint64_t v3 = 4;
      }
      else
      {
        uint64_t result = objc_msgSend(*(id *)(a1 + 40), "ic_containsObjectPassingTest:", &__block_literal_global_41_0);
        if (!result) {
          return result;
        }
        uint64_t v3 = 5;
      }
    }
    else
    {
      uint64_t v3 = 3;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

uint64_t __74__ICCollaborationController_shareStatusOfFolder_objectsForMakingDecision___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSharedRootObject] && !objc_msgSend(v2, "isOwnedByCurrentUser")) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isPasswordProtected];
  }

  return v3;
}

uint64_t __74__ICCollaborationController_shareStatusOfFolder_objectsForMakingDecision___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSharedRootObject]) {
    uint64_t v3 = [v2 isOwnedByCurrentUser];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (UIImage)shareSheetNoteThumbnailImage
{
  if (shareSheetNoteThumbnailImage_onceToken != -1) {
    dispatch_once(&shareSheetNoteThumbnailImage_onceToken, &__block_literal_global_43_0);
  }
  id v2 = (void *)shareSheetNoteThumbnailImage_thumbnailImage;
  return (UIImage *)v2;
}

void __57__ICCollaborationController_shareSheetNoteThumbnailImage__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v0 bundleIdentifier];

  v1 = v8;
  if (v8)
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v8];
    uint64_t v3 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F298]];
    id v4 = [v2 imageForDescriptor:v3];
    if ([v4 placeholder])
    {
      uint64_t v5 = [v2 prepareImageForDescriptor:v3];

      id v4 = (void *)v5;
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithCGImage:", objc_msgSend(v4, "CGImage"));
    uint64_t v7 = (void *)shareSheetNoteThumbnailImage_thumbnailImage;
    shareSheetNoteThumbnailImage_thumbnailImage = v6;

    v1 = v8;
  }
}

+ (UIImage)shareSheetFolderThumbnailImage
{
  if (shareSheetFolderThumbnailImage_onceToken != -1) {
    dispatch_once(&shareSheetFolderThumbnailImage_onceToken, &__block_literal_global_52);
  }
  id v2 = (void *)shareSheetFolderThumbnailImage_thumbnailImage;
  return (UIImage *)v2;
}

uint64_t __59__ICCollaborationController_shareSheetFolderThumbnailImage__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] imageNamed:@"ios_collaboration_share_sheet_folder_icon"];
  shareSheetFolderThumbnailImage_thumbnailImage = v0;
  return MEMORY[0x1F41817F8](v0);
}

+ (id)rootRecordForObject:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__48;
  uint64_t v15 = __Block_byref_object_dispose__48;
  id v16 = 0;
  id v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__ICCollaborationController_rootRecordForObject___block_invoke;
  v8[3] = &unk_1E5FD91F8;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 performBlockAndWait:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __49__ICCollaborationController_rootRecordForObject___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) serverRecord];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) shortLoggingDescription];
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEFAULT, "Trying to get root record for %@, but we don't have a server record. This likely won't work.", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v8 = [*(id *)(a1 + 32) makeCloudKitRecordForApproach:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

+ (id)newShareForObject:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 rootRecordForObject:v4];
  id v6 = [v4 serverRecord];
  uint64_t v7 = [v6 share];

  id v8 = objc_alloc(MEMORY[0x1E4F1A390]);
  uint64_t v9 = v8;
  if (v7)
  {
    id v10 = [v4 serverRecord];
    int v11 = [v10 share];
    id v12 = [v11 recordID];
    uint64_t v13 = (void *)[v9 initWithRootRecord:v5 shareID:v12];

    uint64_t v14 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = objc_msgSend(v13, "ic_loggingDescription");
      id v16 = [v4 shortLoggingDescription];
      int v19 = 138412546;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      uint64_t v17 = "Created share %@ with existing share reference for %@";
LABEL_6:
      _os_log_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    uint64_t v13 = (void *)[v8 initWithRootRecord:v5];
    uint64_t v14 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = objc_msgSend(v13, "ic_loggingDescription");
      id v16 = [v4 shortLoggingDescription];
      int v19 = 138412546;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      uint64_t v17 = "Created share %@ for %@";
      goto LABEL_6;
    }
  }

  objc_msgSend(v13, "ic_updateFromObject:", v4);
  return v13;
}

+ (id)serverShareIfRootObject:(id)a3 managedObjectContext:(id)a4
{
  return (id)[a1 updatedShareForObject:a3 includeHierarchicalShare:0 managedObjectContext:a4];
}

+ (id)serverShareCheckingParent:(id)a3 managedObjectContext:(id)a4
{
  return (id)[a1 updatedShareForObject:a3 includeHierarchicalShare:1 managedObjectContext:a4];
}

+ (id)updatedShareForObject:(id)a3 includeHierarchicalShare:(BOOL)a4 managedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
LABEL_4:
    uint64_t v18 = 0;
    int v19 = &v18;
    uint64_t v20 = 0x3032000000;
    __int16 v21 = __Block_byref_object_copy__48;
    id v22 = __Block_byref_object_dispose__48;
    id v23 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __97__ICCollaborationController_updatedShareForObject_includeHierarchicalShare_managedObjectContext___block_invoke;
    v13[3] = &unk_1E5FDCA08;
    BOOL v17 = a4;
    id v14 = v7;
    id v16 = &v18;
    id v15 = v9;
    [v15 performBlockAndWait:v13];
    id v11 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    goto LABEL_5;
  }
  id v10 = [v7 managedObjectContext];
  if (v10) {
    goto LABEL_4;
  }
  id v11 = 0;
LABEL_5:

  return v11;
}

void __97__ICCollaborationController_updatedShareForObject_includeHierarchicalShare_managedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __97__ICCollaborationController_updatedShareForObject_includeHierarchicalShare_managedObjectContext___block_invoke_cold_1();
  }

  id v3 = *(id *)(a1 + 32);
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    do
    {
      if (([v4 shareMatchesRecord] & 1) == 0)
      {
        id v6 = os_log_create("com.apple.notes", "Collaboration");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v8 = [v4 serverShare];
          uint64_t v9 = objc_msgSend(v8, "ic_loggingDescription");
          id v10 = [*(id *)(a1 + 32) shortLoggingDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = v9;
          __int16 v21 = 2112;
          id v22 = v10;
          _os_log_error_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_ERROR, "Removing mismatched share for object. Share %@, object %@", buf, 0x16u);
        }
        [v4 setServerShare:0];
        char v5 = 1;
        [v4 setNeedsToBeFetchedFromCloud:1];
      }
      uint64_t v7 = [v4 parentCloudObject];

      id v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    char v5 = 0;
  }
  id v11 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56)) {
    [v11 serverShareCheckingParent];
  }
  else {
  uint64_t v12 = [v11 serverShare];
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  id v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v15)
  {
    objc_msgSend(v15, "ic_updateFromObject:", *(void *)(a1 + 32));
    id v16 = [*(id *)(a1 + 32) invitation];
    [v16 updateFromShare:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    if (!((*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0) | v5 & 1)) {
      return;
    }
  }
  else if ((v5 & 1) == 0)
  {
    return;
  }
  BOOL v17 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v18 = v17;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    [v17 addObject:@"Share updated from object metadata"];
  }
  if (v5) {
    [v18 addObject:@"Mismatched share removed from object"];
  }
  objc_msgSend(*(id *)(a1 + 40), "ic_saveWithLogDescription:", @"Reasons: %@", v18);
}

- (void)prepareShare:(id)a3 forObject:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v42 = 0;
  __int16 v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__48;
  uint64_t v46 = __Block_byref_object_dispose__48;
  id v47 = 0;
  uint64_t v13 = [v11 managedObjectContext];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke;
  v38[3] = &unk_1E5FD93E0;
  id v14 = v10;
  id v39 = v14;
  id v15 = v11;
  id v40 = v15;
  v41 = &v42;
  [v13 performBlockAndWait:v38];

  id v16 = os_log_create("com.apple.notes", "Collaboration");
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  uint64_t v18 = v16;
  int v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "com.apple.notes.collaboration.prepareShare", "", buf, 2u);
  }

  if ((ICInternalSettingsIsAlexandriaDemoModeEnabled() & 1) == 0)
  {
    uint64_t v20 = [v15 managedObjectContext];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_63;
    v35[3] = &unk_1E5FD8DF0;
    id v36 = v15;
    [v20 performBlockAndWait:v35];
  }
  __int16 v21 = [(ICCollaborationController *)self cloudContext];
  uint64_t v22 = v43[5];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_2;
  v27[3] = &unk_1E5FDCA58;
  id v23 = v15;
  id v28 = v23;
  id v29 = self;
  id v24 = v14;
  id v30 = v24;
  int64_t v33 = a5;
  id v25 = v19;
  uint64_t v31 = v25;
  os_signpost_id_t v34 = v17;
  id v26 = v12;
  id v32 = v26;
  [v21 finishOperationsForRecordID:v22 qualityOfService:a5 completionHandler:v27];

  _Block_object_dispose(&v42, 8);
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 40) recordID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_63(uint64_t a1)
{
  [*(id *)(a1 + 32) redactAuthorAttributionsToCurrentUser];
  [*(id *)(a1 + 32) updateChangeCountWithReason:@"Redacted author attributions"];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  objc_msgSend(v2, "ic_save");
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_2(id *a1)
{
  id v2 = a1[4];
  id v3 = a1[6];
  id v4 = a1[7];
  id v5 = a1[8];
  performBlockOnMainThread();
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_4;
  v13[3] = &unk_1E5FD8DF0;
  id v14 = *(id *)(a1 + 32);
  [v2 performBlockAndWait:v13];

  id v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 72);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_67;
  v9[3] = &unk_1E5FDCA30;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 80);
  id v10 = v7;
  uint64_t v12 = v8;
  id v11 = *(id *)(a1 + 64);
  [v4 saveShare:v3 forObject:v5 qualityOfService:v6 completionHandler:v9];
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_4_cold_1(a1);
  }
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v8, OS_SIGNPOST_INTERVAL_END, v9, "com.apple.notes.collaboration.prepareShare", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)saveShare:(id)a3 forObject:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
}

- (void)saveShare:(id)a3 attemptNumber:(id)a4 forObject:(id)a5 accountID:(id)a6 container:(id)a7 qualityOfService:(int64_t)a8 retryPrepHandler:(id)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  if (![v17 unsignedIntegerValue])
  {

    id v17 = &unk_1F09A43E8;
  }
  if ((unint64_t)[v17 unsignedIntegerValue] < 6)
  {
    dispatch_time_t v24 = dispatch_time(0, 1000000000 * [v17 unsignedIntegerValue] - 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __135__ICCollaborationController_saveShare_attemptNumber_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke;
    block[3] = &unk_1E5FDCAA8;
    block[4] = self;
    id v26 = v16;
    id v27 = v18;
    id v28 = v19;
    id v29 = v20;
    int64_t v33 = a8;
    id v31 = v21;
    id v30 = v17;
    id v32 = v22;
    dispatch_after(v24, MEMORY[0x1E4F14428], block);
  }
  else if (v22)
  {
    id v23 = ICGenericError();
    (*((void (**)(id, void, void *))v22 + 2))(v22, 0, v23);
  }
}

void __135__ICCollaborationController_saveShare_attemptNumber_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 80);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __135__ICCollaborationController_saveShare_attemptNumber_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5FDCA80;
  uint64_t v8 = *(void *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v21 = v9;
  uint64_t v16 = v10;
  id v17 = v11;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 96);
  id v20 = v12;
  uint64_t v23 = v13;
  id v22 = *(id *)(a1 + 80);
  [v2 saveShare:v3 forObject:v4 accountID:v5 container:v8 qualityOfService:v6 retryPrepHandler:v7 completionHandler:v14];
}

void __135__ICCollaborationController_saveShare_attemptNumber_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ((!v10 || v5)
    && objc_msgSend(v5, "ic_shouldRetryCloudKitError")
    && (unint64_t)[*(id *)(a1 + 32) unsignedIntegerValue] < 5)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") + 1);
    [v8 saveShare:v7 attemptNumber:v9 forObject:*(void *)(a1 + 56) accountID:*(void *)(a1 + 64) container:*(void *)(a1 + 72) qualityOfService:*(void *)(a1 + 96) retryPrepHandler:*(void *)(a1 + 88) completionHandler:*(void *)(a1 + 80)];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 80);
    if (v6) {
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v10, v5);
    }
  }
}

- (void)saveShare:(id)a3 forObject:(id)a4 accountID:(id)a5 container:(id)a6 qualityOfService:(int64_t)a7 retryPrepHandler:(id)a8 completionHandler:(id)a9
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v28 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  if (v16)
  {
    if (v15)
    {
LABEL_3:
      uint64_t v42 = 0;
      __int16 v43 = &v42;
      uint64_t v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__48;
      uint64_t v46 = __Block_byref_object_dispose__48;
      id v47 = [(id)objc_opt_class() rootRecordForObject:v16];
      if (v43[5])
      {
        id v20 = [v16 managedObjectContext];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke;
        v39[3] = &unk_1E5FD91D0;
        id v21 = v15;
        id v40 = v21;
        id v22 = v16;
        id v41 = v22;
        [v20 performBlockAndWait:v39];

        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2;
        v29[3] = &unk_1E5FDCB98;
        id v30 = v22;
        id v31 = self;
        id v32 = v21;
        long long v37 = &v42;
        id v33 = v28;
        id v34 = v17;
        int64_t v38 = a7;
        id v35 = v18;
        id v36 = v19;
        objc_msgSend(v32, "ic_updateThumbnailsFromObject:completion:", v30, v29);

        uint64_t v23 = v40;
      }
      else
      {
        id v26 = os_log_create("com.apple.notes", "Collaboration");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [v16 shortLoggingDescription];
          *(_DWORD *)buf = 138412290;
          v49 = v27;
          _os_log_impl(&dword_1B08EB000, v26, OS_LOG_TYPE_DEFAULT, "No root record for %@", buf, 0xCu);
        }
        uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F83668] code:208 userInfo:0];
        if (v19) {
          (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v23);
        }
      }

      _Block_object_dispose(&v42, 8);
      goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((object) != nil)", "-[ICCollaborationController saveShare:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:]", 1, 0, @"Expected non-nil value for '%s'", "object");
    if (v15) {
      goto LABEL_3;
    }
  }
  dispatch_time_t v24 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[ICCollaborationController saveShare:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:]();
  }

  id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F83668] code:208 userInfo:0];
  if (v19) {
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v25);
  }

LABEL_16:
}

uint64_t __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ic_updateFromObject:", *(void *)(a1 + 40));
}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5FDCB70;
  uint64_t v3 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 40);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 88);
  id v9 = v4;
  uint64_t v15 = v5;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 96);
  id v12 = v6;
  uint64_t v16 = v7;
  id v13 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 80);
  [v2 performBlock:v8];
}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_4;
  v13[3] = &unk_1E5FDCB48;
  id v14 = v6;
  id v15 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 72);
  uint64_t v21 = *(void *)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 32);
  id v19 = v9;
  uint64_t v16 = v10;
  id v17 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 96);
  id v18 = v11;
  uint64_t v22 = v12;
  id v20 = *(id *)(a1 + 80);
  [v2 saveShare:v3 withRootRecord:v5 object:v14 accountID:v7 container:v8 qualityOfService:v4 completionHandler:v13];
}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v9 = [*(id *)(a1 + 32) managedObjectContext];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_5;
    v15[3] = &unk_1E5FDCB20;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 72);
    uint64_t v23 = *(void *)(a1 + 88);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void **)(a1 + 56);
    id v21 = v10;
    uint64_t v18 = v11;
    id v19 = v12;
    id v13 = *(id *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 96);
    id v20 = v13;
    uint64_t v24 = v14;
    id v22 = *(id *)(a1 + 80);
    [v9 performBlock:v15];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 80);
    if (v8) {
      (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v5, 0);
    }
  }
}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    v58 = v3;
    _os_log_impl(&dword_1B08EB000, v2, OS_LOG_TYPE_DEFAULT, "Retrying to save share for %@", buf, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) serverShare];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [*(id *)(a1 + 40) recordChangeTag];
    uint64_t v7 = [*(id *)(a1 + 32) serverShare];
    uint64_t v8 = [v7 recordChangeTag];
    id v9 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v6) {
      id v10 = 0;
    }
    else {
      id v10 = v6;
    }
    unint64_t v11 = v10;
    if (v9 == v8) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v8;
    }
    unint64_t v13 = v12;
    if (v11 | v13)
    {
      uint64_t v14 = (void *)v13;
      if (v11) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {

LABEL_22:
        id v26 = os_log_create("com.apple.notes", "Collaboration");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [*(id *)(a1 + 32) serverShare];
          id v28 = objc_msgSend(v27, "ic_loggingDescription");
          *(_DWORD *)buf = 138412290;
          v58 = v28;
          _os_log_impl(&dword_1B08EB000, v26, OS_LOG_TYPE_DEFAULT, "Using updated server share when retrying %@", buf, 0xCu);
        }
        uint64_t v29 = *(void *)(a1 + 72);
        if (v29) {
          (*(void (**)(void))(v29 + 16))();
        }
        id v30 = [*(id *)(a1 + 32) serverShare];
        id v31 = (void *)[v30 copy];

        objc_msgSend(v31, "ic_updateFromObject:", *(void *)(a1 + 32));
        id v32 = *(void **)(a1 + 32);
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_78;
        v48[3] = &unk_1E5FDCAF8;
        id v33 = v32;
        uint64_t v34 = *(void *)(a1 + 88);
        uint64_t v35 = *(void *)(a1 + 48);
        id v36 = *(void **)(a1 + 56);
        id v49 = v33;
        uint64_t v50 = v35;
        uint64_t v55 = v34;
        id v51 = v31;
        id v52 = v36;
        id v37 = *(id *)(a1 + 64);
        uint64_t v38 = *(void *)(a1 + 96);
        id v53 = v37;
        uint64_t v56 = v38;
        id v54 = *(id *)(a1 + 80);
        id v24 = v31;
        objc_msgSend(v24, "ic_updateThumbnailsFromObject:completion:", v33, v48);

        goto LABEL_27;
      }
      char v25 = [(id)v11 isEqual:v13];

      if ((v25 & 1) == 0) {
        goto LABEL_22;
      }
    }
    else
    {
    }
  }
  uint64_t v16 = *(void *)(a1 + 72);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
  objc_msgSend(*(id *)(a1 + 40), "ic_updateFromObject:", *(void *)(a1 + 32));
  id v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void **)(a1 + 40);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_3_80;
  v40[3] = &unk_1E5FDCAF8;
  id v19 = v17;
  uint64_t v20 = *(void *)(a1 + 88);
  id v41 = v19;
  uint64_t v46 = v20;
  int8x16_t v39 = *(int8x16_t *)(a1 + 40);
  id v21 = (id)v39.i64[0];
  int8x16_t v42 = vextq_s8(v39, v39, 8uLL);
  id v43 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 64);
  uint64_t v23 = *(void *)(a1 + 96);
  id v44 = v22;
  uint64_t v47 = v23;
  id v45 = *(id *)(a1 + 80);
  objc_msgSend(v18, "ic_updateThumbnailsFromObject:completion:", v19, v40);

  id v24 = v41;
LABEL_27:
}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_78(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2_79;
  v7[3] = &unk_1E5FDCAD0;
  uint64_t v13 = *(void *)(a1 + 80);
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 88);
  id v11 = v4;
  uint64_t v14 = v5;
  id v12 = *(id *)(a1 + 72);
  [v2 performBlock:v7];
}

uint64_t __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2_79(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() rootRecordForObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return [*(id *)(a1 + 32) saveShare:*(void *)(a1 + 48) withRootRecord:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) object:*(void *)(a1 + 40) accountID:*(void *)(a1 + 56) container:*(void *)(a1 + 64) qualityOfService:*(void *)(a1 + 88) completionHandler:*(void *)(a1 + 72)];
}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_3_80(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_4_81;
  v7[3] = &unk_1E5FDCAD0;
  uint64_t v13 = *(void *)(a1 + 80);
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 88);
  id v11 = v4;
  uint64_t v14 = v5;
  id v12 = *(id *)(a1 + 72);
  [v2 performBlock:v7];
}

uint64_t __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_4_81(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() rootRecordForObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return [*(id *)(a1 + 32) saveShare:*(void *)(a1 + 48) withRootRecord:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) object:*(void *)(a1 + 40) accountID:*(void *)(a1 + 56) container:*(void *)(a1 + 64) qualityOfService:*(void *)(a1 + 88) completionHandler:*(void *)(a1 + 72)];
}

- (void)saveShare:(id)a3 withRootRecord:(id)a4 object:(id)a5 accountID:(id)a6 container:(id)a7 qualityOfService:(int64_t)a8 completionHandler:(id)a9
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v57 = a7;
  id v19 = (void (**)(id, void, void *))a9;
  if (v15 && v16)
  {
    if (!v18)
    {
      uint64_t v20 = [v17 cloudAccount];
      id v18 = [v20 identifier];
    }
    if ([v18 length])
    {
      if ([v17 isSharedReadOnly])
      {
        id v21 = (void *)MEMORY[0x1E4F836F8];
        id v22 = objc_msgSend(v15, "ic_loggingDescription");
        uint64_t v23 = objc_msgSend(v17, "ic_loggingDescription");
        [v21 handleFailedAssertWithCondition:"__objc_no", "-[ICCollaborationController saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:]", 1, 0, @"Tried to save a read-only share (%@) for object: %@", v22, v23 functionName simulateCrash showAlert format];

        if (v19)
        {
LABEL_8:
          id v24 = ICGenericError();
          v19[2](v19, 0, v24);
        }
      }
      else
      {
        uint64_t v56 = self;
        id v28 = [v15 rootRecordID];
        if (!v28) {
          goto LABEL_19;
        }
        uint64_t v29 = [v15 rootRecordID];
        id v30 = [v16 recordID];
        char v31 = [v29 isEqual:v30];

        if ((v31 & 1) == 0)
        {
          id v49 = os_log_create("com.apple.notes", "Collaboration");
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            -[ICCollaborationController saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:](v15, v17);
          }

          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCollaborationController saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:]" simulateCrash:1 showAlert:1 format:@"Tried to save a mismatched share"];
          if (v19) {
            ((void (**)(id, id, void *))v19)[2](v19, v15, 0);
          }
        }
        else
        {
LABEL_19:
          id v32 = os_log_create("com.apple.notes", "Collaboration");
          os_signpost_id_t v33 = os_signpost_id_generate(v32);
          uint64_t v34 = v32;
          uint64_t v35 = v34;
          if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B08EB000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "com.apple.notes.collaboration.saveShare", "", buf, 2u);
          }
          id v54 = v35;
          uint64_t v55 = (void *)v33;

          if (!v57)
          {
            id v57 = [(ICCollaborationController *)v56 containerForAccountID:v18];
          }
          id v36 = objc_alloc(MEMORY[0x1E4F1A198]);
          v68[0] = v15;
          v68[1] = v16;
          id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
          uint64_t v38 = (void *)[v36 initWithRecordsToSave:v37 recordIDsToDelete:0];

          [v38 setQualityOfService:a8];
          int8x16_t v39 = [v38 configuration];
          [v39 setDiscretionaryNetworkBehavior:0];

          id v40 = [v15 recordID];
          id v41 = objc_msgSend(v57, "databaseWithDatabaseScope:", objc_msgSend(v40, "databaseScope"));
          [v38 setDatabase:v41];

          objc_initWeak(&location, v38);
          int8x16_t v42 = os_log_create("com.apple.notes", "Collaboration");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "ic_loggingDescription");
            id v53 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "ic_loggingDescription");
            id v43 = (id)objc_claimAutoreleasedReturnValue();
            id v44 = objc_loadWeakRetained(&location);
            id v45 = objc_msgSend(v44, "ic_loggingDescription");
            *(_DWORD *)buf = 138412802;
            id v70 = v53;
            __int16 v71 = 2112;
            id v72 = v43;
            __int16 v73 = 2112;
            v74 = v45;
            _os_log_impl(&dword_1B08EB000, v42, OS_LOG_TYPE_INFO, "Saving Share: %@ with root record: %@ %@", buf, 0x20u);
          }
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke;
          v58[3] = &unk_1E5FDCC58;
          objc_copyWeak(v66, &location);
          id v59 = v17;
          id v60 = v15;
          v61 = v56;
          id v62 = v16;
          id v18 = v18;
          id v63 = v18;
          uint64_t v46 = v54;
          v64 = v46;
          v66[1] = v55;
          v65 = v19;
          [v38 setModifyRecordsCompletionBlock:v58];
          id v47 = objc_alloc_init(MEMORY[0x1E4F1A218]);
          [v47 setName:@"SaveShare"];
          [v47 setQuantity:1];
          [v47 setExpectedSendSize:1];
          [v47 setExpectedReceiveSize:1];
          [v38 setGroup:v47];
          v48 = [v38 database];
          [v48 addOperation:v38];

          objc_destroyWeak(v66);
          objc_destroyWeak(&location);
        }
      }
    }
    else
    {
      id v27 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[ICCollaborationController saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:](v15, v17);
      }

      if (v19) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    char v25 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = objc_msgSend(v15, "ic_loggingDescription");
      id v51 = objc_msgSend(v16, "ic_loggingDescription");
      id v52 = objc_msgSend(v17, "ic_loggingDescription");
      *(_DWORD *)buf = 138412802;
      id v70 = v50;
      __int16 v71 = 2112;
      id v72 = v51;
      __int16 v73 = 2112;
      v74 = v52;
      _os_log_error_impl(&dword_1B08EB000, v25, OS_LOG_TYPE_ERROR, "Tried to save a nil share (%@) or a nil root record (%@) for object: %@", buf, 0x20u);
    }
    if (v19)
    {
      id v26 = ICGenericError();
      v19[2](v19, 0, v26);
    }
  }
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 11);
  uint64_t v13 = v7;
  id v14 = a1[4];
  id v15 = a1[5];
  id v16 = WeakRetained;
  id v17 = a1[7];
  id v18 = a1[8];
  id v19 = a1[9];
  uint64_t v20 = v6;
  id v21 = a1[10];
  id v9 = v6;
  id v10 = WeakRetained;
  id v11 = v7;
  performBlockOnMainThread();
  id v12 = [a1[6] cloudContext];
  [v12 informCloudAnalyticsDelegateForOperationDidEnd:v10 recordsByRecordID:MEMORY[0x1E4F1CC08] operationError:v11];
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) managedObjectContext];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_3;
    v39[3] = &unk_1E5FDA5F8;
    id v40 = *(id *)(a1 + 48);
    id v41 = *(id *)(a1 + 40);
    id v42 = *(id *)(a1 + 56);
    id v43 = *(id *)(a1 + 32);
    [v2 performBlockAndWait:v39];

    uint64_t v3 = [*(id *)(a1 + 32) code];
    if (v3 == 2)
    {
      uint64_t v13 = [*(id *)(a1 + 40) managedObjectContext];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_91;
      v36[3] = &unk_1E5FD91D0;
      id v37 = *(id *)(a1 + 40);
      id v38 = *(id *)(a1 + 56);
      [v13 performBlockAndWait:v36];

      id v14 = [*(id *)(a1 + 32) userInfo];
      id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_92;
      v30[3] = &unk_1E5FDCBE8;
      id v31 = *(id *)(a1 + 40);
      id v32 = *(id *)(a1 + 56);
      id v33 = *(id *)(a1 + 72);
      id v34 = *(id *)(a1 + 80);
      id v35 = *(id *)(a1 + 48);
      [v15 enumerateKeysAndObjectsUsingBlock:v30];

      uint64_t v5 = v37;
    }
    else
    {
      if (v3 != 25) {
        goto LABEL_13;
      }
      id v4 = objc_opt_class();
      uint64_t v5 = [*(id *)(a1 + 72) recordID];
      [v4 showQuotaExceededAlertIfNeededWithRecordID:v5 accountID:*(void *)(a1 + 80)];
    }

LABEL_13:
    id v16 = *(id *)(a1 + 88);
    id v17 = v16;
    os_signpost_id_t v18 = *(void *)(a1 + 112);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B08EB000, v17, OS_SIGNPOST_INTERVAL_END, v18, "com.apple.notes.collaboration.saveShare", "", buf, 2u);
    }

    uint64_t v19 = *(void *)(a1 + 104);
    if (v19) {
      (*(void (**)(uint64_t, void, void))(v19 + 16))(v19, 0, *(void *)(a1 + 32));
    }

    id v11 = v40;
    goto LABEL_25;
  }
  id v6 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
    int8x16_t v8 = objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
    *(_DWORD *)buf = 138412546;
    id v45 = v7;
    __int16 v46 = 2112;
    id v47 = v8;
    _os_log_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_INFO, "Saved share %@ %@", buf, 0x16u);
  }
  uint64_t v9 = [*(id *)(a1 + 96) indexOfObjectPassingTest:&__block_literal_global_102];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_cold_1();
    }
    id v11 = 0;
    id v12 = v10;
  }
  else
  {
    uint64_t v20 = [*(id *)(a1 + 96) objectAtIndex:v9];
    id v21 = [*(id *)(a1 + 40) managedObjectContext];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_103;
    v26[3] = &unk_1E5FD8FE8;
    id v27 = *(id *)(a1 + 40);
    id v11 = v20;
    id v28 = v11;
    id v29 = v21;
    id v12 = v21;
    [v12 performBlockAndWait:v26];

    id v10 = v27;
  }

  id v22 = *(id *)(a1 + 88);
  uint64_t v23 = v22;
  os_signpost_id_t v24 = *(void *)(a1 + 112);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "com.apple.notes.collaboration.saveShare", "", buf, 2u);
  }

  uint64_t v25 = *(void *)(a1 + 104);
  if (v25) {
    (*(void (**)(uint64_t, id, void))(v25 + 16))(v25, v11, 0);
  }
LABEL_25:
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_3()
{
  uint64_t v0 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_3_cold_1();
  }
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_91(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) shortLoggingDescription];
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    int8x16_t v8 = v4;
    _os_log_impl(&dword_1B08EB000, v2, OS_LOG_TYPE_DEFAULT, "Partial failure saving share for %@ %@", (uint8_t *)&v5, 0x16u);
  }
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_92(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = [a1[4] managedObjectContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_93;
  v19[3] = &unk_1E5FDA5F8;
  id v20 = a1[4];
  id v8 = v5;
  id v21 = v8;
  id v22 = a1[5];
  id v9 = v6;
  id v23 = v9;
  [v7 performBlockAndWait:v19];

  if ([v9 code] == 14)
  {
    id v10 = [a1[4] managedObjectContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_94;
    v11[3] = &unk_1E5FDCBC0;
    id v12 = v9;
    id v13 = v8;
    id v14 = a1[6];
    id v15 = a1[4];
    id v16 = a1[5];
    id v17 = a1[7];
    id v18 = a1[8];
    [v10 performBlockAndWait:v11];
  }
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_93(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) shortLoggingDescription];
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    id v5 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
    uint64_t v6 = *(void *)(a1 + 56);
    int v7 = 138413058;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1B08EB000, v2, OS_LOG_TYPE_DEFAULT, "Error saving share for %@ when saving record ID %@ %@: %@", (uint8_t *)&v7, 0x2Au);
  }
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_94(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F19D10]];

  if (!v3)
  {
    id v10 = os_log_create("com.apple.notes", "Collaboration");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_15;
    }
    __int16 v11 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    id v12 = [*(id *)(a1 + 56) shortLoggingDescription];
    __int16 v13 = objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
    int v21 = 138412802;
    id v22 = v11;
    __int16 v23 = 2112;
    os_signpost_id_t v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    _os_log_impl(&dword_1B08EB000, v10, OS_LOG_TYPE_DEFAULT, "No server record from error saving share for %@ %@ %@", (uint8_t *)&v21, 0x20u);

LABEL_8:
    goto LABEL_9;
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) recordID];
  LODWORD(v4) = [v4 isEqual:v5];

  if (!v4)
  {
    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v15 = [*(id *)(a1 + 80) recordID];
    LODWORD(v14) = [v14 isEqual:v15];

    if (!v14) {
      goto LABEL_15;
    }
    id v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_msgSend(v3, "ic_loggingDescription");
      id v18 = [*(id *)(a1 + 56) shortLoggingDescription];
      uint64_t v19 = objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
      int v21 = 138412802;
      id v22 = v17;
      __int16 v23 = 2112;
      os_signpost_id_t v24 = v18;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_1B08EB000, v16, OS_LOG_TYPE_DEFAULT, "Saving server share %@ for %@ %@", (uint8_t *)&v21, 0x20u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 56) setServerShareIfNewer:v3];
      goto LABEL_15;
    }
    id v10 = os_log_create("com.apple.notes", "Collaboration");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v11 = objc_msgSend(v3, "ic_loggingDescription");
    id v12 = objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
    int v21 = 138412546;
    id v22 = v11;
    __int16 v23 = 2112;
    os_signpost_id_t v24 = v12;
    _os_log_impl(&dword_1B08EB000, v10, OS_LOG_TYPE_DEFAULT, "Server record %@ is not a share %@", (uint8_t *)&v21, 0x16u);
    goto LABEL_8;
  }
  uint64_t v6 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = objc_msgSend(v3, "ic_loggingDescription");
    id v8 = [*(id *)(a1 + 56) shortLoggingDescription];
    __int16 v9 = objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
    int v21 = 138412802;
    id v22 = v7;
    __int16 v23 = 2112;
    os_signpost_id_t v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEFAULT, "Saving server record %@ for %@ %@", (uint8_t *)&v21, 0x20u);
  }
  [*(id *)(a1 + 56) objectWasFetchedFromCloudWithRecord:v3 accountID:*(void *)(a1 + 72)];
LABEL_15:
  id v20 = [*(id *)(a1 + 56) managedObjectContext];
  objc_msgSend(v20, "ic_saveWithLogDescription:", @"Saving Share");
}

uint64_t __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_99(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_103(uint64_t a1)
{
  [*(id *)(a1 + 32) setServerShareIfNewer:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 48);
  return objc_msgSend(v2, "ic_save");
}

- (void)fetchShareIfNecessaryForObject:(id)a3 completionHandler:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(void))a4;
  int v7 = [v5 cloudAccount];
  id v8 = [v7 identifier];

  uint64_t v9 = [v8 length];
  id v10 = os_log_create("com.apple.notes", "Collaboration");
  __int16 v11 = v10;
  if (v9)
  {
    id v12 = (char *)os_signpost_id_generate(v10);
    __int16 v13 = v11;
    uint64_t v14 = v13;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B08EB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "com.apple.notes.collaboration.fetchShare", "", buf, 2u);
    }

    uint64_t v15 = [v5 serverRecord];
    id v16 = [v15 share];
    id v17 = [v16 recordID];

    if (v17
      && ([v5 serverShare],
          id v18 = objc_claimAutoreleasedReturnValue(),
          BOOL v19 = v18 == 0,
          v18,
          v19))
    {
      id v22 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v37 = [v5 serverRecord];
        __int16 v23 = [v37 share];
        os_signpost_id_t v24 = [v23 recordID];
        id v36 = objc_msgSend(v24, "ic_loggingDescription");
        __int16 v25 = [v5 shortLoggingDescription];
        *(_DWORD *)buf = 138412546;
        id v49 = v36;
        __int16 v50 = 2112;
        id v51 = v25;
        _os_log_impl(&dword_1B08EB000, v22, OS_LOG_TYPE_INFO, "Need to fetch share %@ for %@", buf, 0x16u);
      }
      id v26 = [(ICCollaborationController *)self containerForAccountID:v8];
      id v27 = objc_alloc(MEMORY[0x1E4F1A0A8]);
      id v47 = v17;
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      id v29 = (void *)[v27 initWithRecordIDs:v28];

      id v30 = objc_msgSend(v26, "databaseWithDatabaseScope:", objc_msgSend(v17, "databaseScope"));
      [v29 setDatabase:v30];

      [v29 setQueuePriority:8];
      [v29 setQualityOfService:17];
      id v31 = [v29 configuration];
      [v31 setDiscretionaryNetworkBehavior:0];

      objc_initWeak(&location, v29);
      id v32 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v17, "ic_loggingDescription");
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "ic_loggingDescription");
        objc_claimAutoreleasedReturnValue();
        -[ICCollaborationController fetchShareIfNecessaryForObject:completionHandler:]();
      }

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __78__ICCollaborationController_fetchShareIfNecessaryForObject_completionHandler___block_invoke;
      v39[3] = &unk_1E5FDCC80;
      id v40 = v17;
      objc_copyWeak(v45, &location);
      id v41 = self;
      id v42 = v8;
      id v43 = v14;
      v45[1] = v12;
      id v44 = v6;
      [v29 setFetchRecordsCompletionBlock:v39];
      id v34 = objc_alloc_init(MEMORY[0x1E4F1A218]);
      [v34 setName:@"FetchShare"];
      [v34 setQuantity:1];
      [v34 setExpectedSendSize:1];
      [v34 setExpectedReceiveSize:1];
      [v29 setGroup:v34];
      id v35 = [v29 database];
      [v35 addOperation:v29];

      objc_destroyWeak(v45);
      objc_destroyWeak(&location);
    }
    else
    {
      id v20 = v14;
      int v21 = v20;
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B08EB000, v21, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v12, "com.apple.notes.collaboration.fetchShare", "", buf, 2u);
      }

      v6[2](v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICCollaborationController fetchShareIfNecessaryForObject:completionHandler:]();
    }

    if (v6) {
      v6[2](v6);
    }
  }
}

void __78__ICCollaborationController_fetchShareIfNecessaryForObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  int v7 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v8 = ICDynamicCast();

  uint64_t v9 = os_log_create("com.apple.notes", "Collaboration");
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __78__ICCollaborationController_fetchShareIfNecessaryForObject_completionHandler___block_invoke_cold_1(v8, a1);
    }

    [*(id *)(a1 + 40) saveServerShare:v8 persistParticipantEvents:0 accountID:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      id v18 = objc_msgSend(WeakRetained, "ic_loggingDescription");
      int v19 = 138412802;
      id v20 = v16;
      __int16 v21 = 2112;
      id v22 = v18;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_error_impl(&dword_1B08EB000, v10, OS_LOG_TYPE_ERROR, "Error fetching share %@ %@: %@", (uint8_t *)&v19, 0x20u);
    }
  }
  __int16 v11 = *(id *)(a1 + 56);
  id v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 80);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "com.apple.notes.collaboration.fetchShare", "", (uint8_t *)&v19, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  uint64_t v14 = [*(id *)(a1 + 40) cloudContext];
  id v15 = objc_loadWeakRetained((id *)(a1 + 72));
  [v14 informCloudAnalyticsDelegateForOperationDidEnd:v15 recordsByRecordID:v5 operationError:v6];
}

- (void)didSaveShare:(id)a3 accountID:(id)a4
{
}

- (void)saveServerShare:(id)a3 persistParticipantEvents:(BOOL)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ICCollaborationController *)self viewContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__ICCollaborationController_saveServerShare_persistParticipantEvents_accountID___block_invoke;
  v14[3] = &unk_1E5FDA5A8;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  BOOL v18 = a4;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [v11 performBlock:v14];
}

void __80__ICCollaborationController_saveServerShare_persistParticipantEvents_accountID___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForShare:*(void *)(a1 + 40) accountID:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  uint64_t v3 = os_log_create("com.apple.notes", "Collaboration");
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v5 = objc_opt_class();
      id v6 = v5;
      int v7 = [v2 identifier];
      id v8 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
      *(_DWORD *)buf = 138412802;
      id v28 = v5;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_1B08EB000, v4, OS_LOG_TYPE_INFO, "Setting server share on %@ %@ %@", buf, 0x20u);
    }
    id v9 = [v2 serverShare];
    [v2 setServerShareIfNewer:*(void *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 64))
    {
      id v10 = [*(id *)(a1 + 32) collaborationControllerDelegate];
      [v10 collaborationController:*(void *)(a1 + 32) persistParticipantActivityEventsOnObject:v2 oldShare:v9 newShare:*(void *)(a1 + 40)];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = objc_msgSend(v2, "associatedNoteParticipants", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(a1 + 56) deleteObject:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 56), "ic_save");
    id v16 = objc_alloc(MEMORY[0x1E4F83470]);
    id v17 = [*(id *)(a1 + 32) backgroundContext];
    id v4 = [v16 initWithManagedObjectContext:v17];

    [v4 updateWithCompletion:0];
    [(id)objc_opt_class() postDidUpdateShareNotificationForObject:v2];
    objc_opt_class();
    BOOL v18 = ICDynamicCast();
    if (v18 && *(void *)(a1 + 40))
    {
      int v19 = [*(id *)(a1 + 32) collaborationAnalyticsTracker];
      [v19 saveNewShare:*(void *)(a1 + 40) forNote:v18];
    }
    id v20 = [*(id *)(a1 + 32) collaborationAnalyticsDelegate];
    [v20 trackCollaborationActionSecondShareForObject:v2 share:*(void *)(a1 + 40) isInviting:1];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
      *(_DWORD *)buf = 138412290;
      id v28 = v21;
      _os_log_impl(&dword_1B08EB000, v4, OS_LOG_TYPE_DEFAULT, "Couldn't find cloud object for share %@", buf, 0xCu);
    }
    id v9 = v4;
  }
}

+ (void)postDidUpdateShareNotificationForObject:(id)a3
{
  id v3 = a3;
  id v10 = [v3 serverShareCheckingParent];
  id v4 = [v10 recordID];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v4 forKey:@"ICCloudSyncingObjectShareRecordID"];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F1A390], "ic_systemFieldsValueTransformer");
  int v7 = [v6 transformedValue:v10];
  [v5 setObject:v7 forKeyedSubscript:@"ICCloudSyncingObjectShareData"];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = (void *)[v5 copy];
  [v8 postNotificationName:@"ICCloudSyncingObjectDidUpdateShare" object:v3 userInfo:v9];
}

- (id)objectForShare:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F831C8]];
  uint64_t v12 = [v11 recordID];
  if (v12)
  {
    uint64_t v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F831D0]];
    if (!v13)
    {
      uint64_t v14 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[ICCollaborationController objectForShare:accountID:context:](v8);
      }
    }
    os_log_t v15 = [(ICCollaborationController *)self cloudContext];
    id v16 = [v15 existingCloudObjectForRecordID:v12 recordType:v13 accountID:v9 context:v10];
  }
  else
  {
    os_log_t v15 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_msgSend(v8, "ic_loggingDescription");
      int v19 = 138412290;
      id v20 = v17;
      _os_log_impl(&dword_1B08EB000, v15, OS_LOG_TYPE_DEFAULT, "No root record reference for share %@", (uint8_t *)&v19, 0xCu);
    }
    id v16 = 0;
    uint64_t v13 = v15;
  }

  return v16;
}

- (void)removeShareIfNeededWithOwnedObjectID:(id)a3 countParticipants:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    id v11 = [(ICCollaborationController *)self viewContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke;
    v13[3] = &unk_1E5FDCCF8;
    id v14 = v11;
    id v15 = v8;
    BOOL v18 = a4;
    id v16 = self;
    id v17 = v10;
    id v12 = v11;
    [v12 performBlock:v13];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  id v2 = objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(void *)(a1 + 40));
  id v3 = ICDynamicCast();

  if (!v3
    || ![v3 isOwnedByCurrentUser]
    || ([v3 serverShare], (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_6:
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, 0);
    }
    goto LABEL_8;
  }
  id v5 = v4;
  if (*(unsigned char *)(a1 + 64))
  {
    int v6 = [v3 isPubliclySharedOrHasInvitees];

    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  objc_opt_class();
  id v8 = ICDynamicCast();
  if (v8)
  {
    id v9 = [*(id *)(a1 + 48) collaborationAnalyticsTracker];
    [v9 unshareNote:v8];
  }
  id v10 = [*(id *)(a1 + 48) cloudContext];
  v18[0] = v3;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5FDCCD0;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 48);
  id v17 = v12;
  [v10 deleteSharesForObjects:v11 completionHandler:v13];

LABEL_8:
}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5FDCCA8;
  id v9 = v3;
  id v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v3;
  [v4 performBlock:v8];
}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3_cold_2();
    }

    uint64_t v4 = *(void *)(a1 + 64);
    if (v4) {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, *v2);
    }
  }
  else
  {
    objc_opt_class();
    id v5 = objc_msgSend(*(id *)(a1 + 48), "ic_existingObjectWithID:", *(void *)(a1 + 40));
    uint64_t v6 = ICDynamicCast();

    [v6 setNeedsToBeFetchedFromCloud:1];
    [v6 setServerShare:0];
    [v6 removeAllCloudSyncingObjectActivityEvents];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = [v6 allChildCloudObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * v11++) removeAllCloudSyncingObjectActivityEvents];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = objc_msgSend(v6, "associatedNoteParticipants", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(a1 + 48) deleteObject:*(void *)(*((void *)&v21 + 1) + 8 * v16++)];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 48), "ic_save");
    id v17 = [*(id *)(a1 + 56) backgroundContext];
    if (v17)
    {
      BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F83470]) initWithManagedObjectContext:v17];
      [v18 updateWithCompletion:0];
    }
    [(id)objc_opt_class() postDidUpdateShareNotificationForObject:v6];
    int v19 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3_cold_1();
    }

    uint64_t v20 = *(void *)(a1 + 64);
    if (v20) {
      (*(void (**)(uint64_t, uint64_t, void))(v20 + 16))(v20, 1, 0);
    }
  }
}

- (void)didStopSharing:(id)a3 recordID:(id)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ICCollaborationController *)self viewContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke;
  v16[3] = &unk_1E5FDCD20;
  id v17 = v8;
  BOOL v18 = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v9;
  id v12 = v9;
  id v13 = v11;
  id v14 = v10;
  id v15 = v8;
  [v13 performBlock:v16];
}

void __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3) {
    [v2 objectForShare:v3 accountID:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  }
  else {
  uint64_t v4 = [v2 objectForCKShareRecordID:*(void *)(a1 + 64) accountID:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  }
  id v5 = os_log_create("com.apple.notes", "Collaboration");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
      id v8 = *(void **)(a1 + 64);
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v7;
      __int16 v30 = 2112;
      uint64_t v31 = v8;
      __int16 v32 = 2112;
      uint64_t v33 = v9;
      _os_log_impl(&dword_1B08EB000, v5, OS_LOG_TYPE_DEFAULT, "Successfully fetched cloudObject for share %@ recordID %@ accountID %@", buf, 0x20u);
    }
    int v10 = [v4 isOwnedByCurrentUser];
    uint64_t v11 = os_log_create("com.apple.notes", "Collaboration");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        id v13 = [v4 shortLoggingDescription];
        id v14 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
        uint64_t v15 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138412802;
        __int16 v29 = v13;
        __int16 v30 = 2112;
        uint64_t v31 = v14;
        __int16 v32 = 2112;
        uint64_t v33 = v15;
        _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "User stopped sharing %@ share %@ recordID %@", buf, 0x20u);
      }
      uint64_t v16 = *(void **)(a1 + 40);
      id v17 = [v4 objectID];
      [v16 removeShareIfNeededWithOwnedObjectID:v17 countParticipants:0 completionHandler:0];
    }
    else
    {
      if (v12)
      {
        id v20 = [v4 shortLoggingDescription];
        id v21 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
        uint64_t v22 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138412802;
        __int16 v29 = v20;
        __int16 v30 = 2112;
        uint64_t v31 = v21;
        __int16 v32 = 2112;
        uint64_t v33 = v22;
        _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "User removed themselves from shared %@ share %@ recordID %@", buf, 0x20u);
      }
      long long v23 = [*(id *)(a1 + 40) collaborationControllerDelegate];
      [v23 collaborationController:*(void *)(a1 + 40) persistLeaveActivityEventOnObject:v4];

      long long v24 = [*(id *)(a1 + 40) cloudContext];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_121;
      v25[3] = &unk_1E5FDBE50;
      id v26 = *(id *)(a1 + 56);
      id v27 = v4;
      [v24 syncWithReason:@"SyncAfterDidStopSharing" completionHandler:v25];

      id v17 = v26;
    }

    id v5 = [*(id *)(a1 + 40) collaborationAnalyticsDelegate];
    [v5 trackCollaborationActionSecondCancelForObject:v4 share:*(void *)(a1 + 32) isInviting:0];
  }
  else
  {
    if (v6)
    {
      BOOL v18 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
      id v19 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      __int16 v29 = v18;
      __int16 v30 = 2112;
      uint64_t v31 = v19;
      _os_log_impl(&dword_1B08EB000, v5, OS_LOG_TYPE_DEFAULT, "Couldn't find cloud object for share %@ recordID %@", buf, 0x16u);
    }
  }
}

void __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_121(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_121_cold_1();
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_2;
    v6[3] = &unk_1E5FD91D0;
    id v7 = v5;
    id v8 = *(id *)(a1 + 40);
    [v7 performBlock:v6];

    uint64_t v4 = v7;
  }
}

void __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectID];
  uint64_t v4 = objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  ICDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v5 markForDeletion];
    [v5 deleteFromLocalDatabase];
    objc_msgSend(*(id *)(a1 + 32), "ic_save");
  }
}

+ (void)didFailToUpdateShareWithError:(id)a3
{
  id v4 = a3;
  id v7 = [a1 sharedInstance];
  id v5 = [v7 collaborationControllerDelegate];
  BOOL v6 = [a1 sharedInstance];
  [v5 collaborationController:v6 didFailToSaveShareWithError:v4];
}

- (void)acceptShareWithMetadata:(id)a3 managedObjectContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "Accepting share for metadata %@", (uint8_t *)&buf, 0xCu);
  }

  BOOL v12 = [v8 callingParticipant];
  id v13 = [v12 userIdentity];
  id v14 = [v13 userRecordID];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x3032000000;
  uint64_t v56 = __Block_byref_object_copy__48;
  id v57 = __Block_byref_object_dispose__48;
  id v58 = [v8 selectedAccountID];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v15 = -[ICCollaborationController containerForAccountID:](self, "containerForAccountID:");
    uint64_t v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)__int16 v50 = 138412546;
      id v51 = v15;
      __int16 v52 = 2112;
      uint64_t v53 = v17;
      _os_log_impl(&dword_1B08EB000, v16, OS_LOG_TYPE_DEFAULT, "Using container %@ for metadata selected accountID %@", v50, 0x16u);
    }
    goto LABEL_25;
  }
  BOOL v18 = [v14 recordName];
  int v19 = [v18 isEqualToString:*MEMORY[0x1E4F19C08]];

  if (v19)
  {
    id v20 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:].cold.5();
    }

    id v21 = [MEMORY[0x1E4F836D8] sharedInstance];
    uint64_t v22 = [v21 primaryICloudACAccount];
    uint64_t v23 = [v22 identifier];
    long long v24 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v23;

    if (![*(id *)(*((void *)&buf + 1) + 40) length]) {
      goto LABEL_16;
    }
    uint64_t v15 = [(ICCollaborationController *)self containerForAccountID:*(void *)(*((void *)&buf + 1) + 40)];
  }
  else
  {
    long long v25 = [(ICCollaborationController *)self cloudContext];
    id v26 = [v25 containersByAccountID];
    BOOL v27 = (unint64_t)[v26 count] > 1;

    if (!v27) {
      goto LABEL_16;
    }
    long long v28 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:].cold.6();
    }

    uint64_t v15 = [(ICCollaborationController *)self containerForUserRecordID:v14];
    __int16 v29 = [v15 options];
    __int16 v30 = [v29 accountOverrideInfo];
    uint64_t v31 = [v30 accountID];
    __int16 v32 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v31;
  }
  if (!v15)
  {
LABEL_16:
    uint64_t v33 = [v8 containerIdentifier];
    BOOL v34 = v33 == 0;

    if (v34)
    {
      uint64_t v15 = 0;
    }
    else
    {
      id v35 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:].cold.4();
      }

      id v36 = (void *)MEMORY[0x1E4F19EC8];
      id v37 = [v8 containerIdentifier];
      uint64_t v15 = [v36 containerWithIdentifier:v37];
    }
  }
  if ([*(id *)(*((void *)&buf + 1) + 40) length]) {
    goto LABEL_26;
  }
  id v38 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:]();
  }

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke;
  v47[3] = &unk_1E5FD91F8;
  p_long long buf = &buf;
  uint64_t v48 = v9;
  [v48 performBlockAndWait:v47];
  uint64_t v16 = v48;
LABEL_25:

LABEL_26:
  if (!v15)
  {
    int8x16_t v39 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:]();
    }
    goto LABEL_34;
  }
  if (![*(id *)(*((void *)&buf + 1) + 40) length])
  {
    int8x16_t v39 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:]();
    }
LABEL_34:

    id v40 = ICGenericError();
    (*((void (**)(id, void *, void, void))v10 + 2))(v10, v40, 0, 0);

    goto LABEL_35;
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke_133;
  v41[3] = &unk_1E5FDCD90;
  v41[4] = self;
  id v42 = v8;
  __int16 v46 = &buf;
  id v43 = v9;
  id v45 = v10;
  id v44 = v15;
  [v43 performBlock:v41];

LABEL_35:
  _Block_object_dispose(&buf, 8);
}

void __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F83278] cloudKitAccountInContext:*(void *)(a1 + 32)];
  uint64_t v2 = [v5 identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke_133(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) share];
  id v4 = [v2 objectForShare:v3 accountID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) context:*(void *)(a1 + 48)];

  if (v4
    && ([v4 serverShare], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)
    && (BOOL v6 = (void *)v5, v7 = [v4 markedForDeletion], v6, (v7 & 1) == 0))
  {
    id v14 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v4 shortLoggingDescription];
      uint64_t v16 = [*(id *)(a1 + 40) share];
      uint64_t v17 = objc_msgSend(v16, "ic_loggingDescription");
      *(_DWORD *)long long buf = 138412546;
      long long v25 = v15;
      __int16 v26 = 2112;
      BOOL v27 = v17;
      _os_log_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_DEFAULT, "Found existing object %@ for share metadata %@", buf, 0x16u);
    }
    BOOL v18 = [*(id *)(a1 + 40) share];
    [v4 didAcceptShare:v18];

    objc_msgSend(*(id *)(a1 + 48), "ic_save");
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v8 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [*(id *)(a1 + 40) share];
      id v10 = objc_msgSend(v9, "ic_loggingDescription");
      *(_DWORD *)long long buf = 138412290;
      long long v25 = v10;
      _os_log_impl(&dword_1B08EB000, v8, OS_LOG_TYPE_INFO, "No existing object for share metadata %@", buf, 0xCu);
    }
    uint64_t v11 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke_134;
    block[3] = &unk_1E5FDCD68;
    BOOL v12 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v21 = v12;
    id v22 = *(id *)(a1 + 56);
    long long v19 = *(_OWORD *)(a1 + 64);
    id v13 = (id)v19;
    long long v23 = v19;
    dispatch_async(v11, block);
  }
}

uint64_t __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke_134(uint64_t a1)
{
  return [*(id *)(a1 + 32) acceptShareWithMetadata:*(void *)(a1 + 40) container:*(void *)(a1 + 48) accountID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) fetchObjectWithCompletionHandler:*(void *)(a1 + 56)];
}

- (id)containerForUserRecordID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 recordName];
  uint64_t v5 = [(ICCollaborationController *)self cloudContext];
  BOOL v6 = [v5 containersByAccountID];
  char v7 = [v6 allValues];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        BOOL v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = objc_msgSend(MEMORY[0x1E4F83318], "userRecordNameForContainer:", v12, (void)v15);
        if ([v13 isEqualToString:v4])
        {
          id v9 = v12;

          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)containerForAccountID:(id)a3
{
  id v4 = a3;
  if (![v4 length]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"accountID.length > 0" functionName:"-[ICCollaborationController containerForAccountID:]" simulateCrash:1 showAlert:0 format:@"Must have an account ID to get container."];
  }
  if ([v4 length])
  {
    uint64_t v5 = [(ICCollaborationController *)self cloudContext];
    BOOL v6 = [v5 containersByAccountID];
    char v7 = [v6 objectForKeyedSubscript:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)acceptShareWithMetadata:(id)a3 container:(id)a4 accountID:(id)a5 fetchObjectWithCompletionHandler:(id)a6
{
}

- (void)acceptShareWithMetadata:(id)a3 attemptNumber:(id)a4 container:(id)a5 accountID:(id)a6 fetchObjectWithCompletionHandler:(id)a7
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v38 = a5;
  id v39 = a6;
  id v41 = a7;
  id v13 = [v11 share];
  id v40 = [v13 URL];

  if (!v40) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((shareURL) != nil)", "-[ICCollaborationController acceptShareWithMetadata:attemptNumber:container:accountID:fetchObjectWithCompletionHandler:]", 1, 0, @"Expected non-nil value for '%s'", "shareURL");
  }
  id v14 = os_log_create("com.apple.notes", "Collaboration");
  long long v15 = (char *)os_signpost_id_generate(v14);
  long long v16 = v14;
  long long v17 = v16;
  if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "com.apple.notes.collaboration.acceptShare", "", buf, 2u);
  }

  if (![v12 unsignedIntegerValue])
  {

    id v12 = &unk_1F09A43E8;
  }
  if ((unint64_t)[v12 unsignedIntegerValue] < 6)
  {
    id v21 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      id v57 = v40;
      __int16 v58 = 2112;
      id v59 = v39;
      __int16 v60 = 2112;
      id v61 = v12;
      _os_log_impl(&dword_1B08EB000, v21, OS_LOG_TYPE_DEFAULT, "Accepting shared object at URL: %@, account ID = %@, attemptNumber = %@", buf, 0x20u);
    }

    id v22 = objc_alloc(MEMORY[0x1E4F19E10]);
    id v55 = v11;
    long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    uint64_t v20 = (void *)[v22 initWithShareMetadatas:v23];

    [v20 setQualityOfService:25];
    [v20 setQueuePriority:8];
    long long v24 = [v20 configuration];
    [v24 setContainer:v38];

    long long v25 = [v20 configuration];
    [v25 setDiscretionaryNetworkBehavior:0];

    objc_initWeak(&location, v20);
    __int16 v26 = [MEMORY[0x1E4F1CA60] dictionary];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke;
    v52[3] = &unk_1E5FDCDB8;
    id v27 = v26;
    id v53 = v27;
    [v20 setPerShareCompletionBlock:v52];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2;
    v42[3] = &unk_1E5FDCE58;
    id v28 = v11;
    id v43 = v28;
    objc_copyWeak(v51, &location);
    id v44 = v12;
    id v45 = self;
    id v46 = v38;
    id v47 = v39;
    id v50 = v41;
    uint64_t v48 = v17;
    v51[1] = v15;
    id v29 = v27;
    id v49 = v29;
    [v20 setAcceptSharesCompletionBlock:v42];
    id v30 = objc_alloc_init(MEMORY[0x1E4F1A218]);
    [v30 setName:@"AcceptShare"];
    [v30 setQuantity:1];
    [v30 setExpectedSendSize:1];
    [v30 setExpectedReceiveSize:1];
    [v20 setGroup:v30];
    uint64_t v31 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v32 = [v28 share];
      objc_msgSend(v32, "ic_loggingDescription");
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v34 = objc_msgSend(v20, "ic_loggingDescription");
      *(_DWORD *)long long buf = 138412546;
      id v57 = v33;
      __int16 v58 = 2112;
      id v59 = v34;
      _os_log_impl(&dword_1B08EB000, v31, OS_LOG_TYPE_DEFAULT, "Accepting %@ with %@", buf, 0x16u);
    }
    id v35 = [(ICCollaborationController *)self cloudContext];
    id v36 = [v35 operationQueue];
    [v36 addOperation:v20];

    objc_destroyWeak(v51);
    objc_destroyWeak(&location);
    goto LABEL_19;
  }
  long long v18 = v17;
  long long v19 = v18;
  if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v19, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v15, "com.apple.notes.collaboration.acceptShare", "", buf, 2u);
  }

  if (v41)
  {
    uint64_t v20 = ICGenericError();
    (*((void (**)(id, void *, void, id))v41 + 2))(v41, v20, 0, v39);
LABEL_19:
  }
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = a3;
    id v5 = [v4 recordID];
    [v3 setObject:v4 forKeyedSubscript:v5];
  }
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Collaboration");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2_cold_2(a1, (uint64_t)v3, v5);
    }

    if (objc_msgSend(v3, "ic_shouldRetryCloudKitError")
      && (unint64_t)[*(id *)(a1 + 40) unsignedIntegerValue] <= 4)
    {
      dispatch_time_t v6 = dispatch_time(0, 1000000000 * [*(id *)(a1 + 40) unsignedIntegerValue]);
      char v7 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2_cold_1(a1);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_143;
      block[3] = &unk_1E5FDCDE0;
      block[4] = *(void *)(a1 + 48);
      id v46 = *(id *)(a1 + 32);
      id v47 = *(id *)(a1 + 40);
      id v48 = *(id *)(a1 + 56);
      id v49 = *(id *)(a1 + 64);
      id v50 = *(id *)(a1 + 88);
      dispatch_after(v6, MEMORY[0x1E4F14428], block);
    }
    else
    {
      id v8 = *(id *)(a1 + 72);
      id v9 = v8;
      os_signpost_id_t v10 = *(void *)(a1 + 104);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B08EB000, v9, OS_SIGNPOST_INTERVAL_END, v10, "com.apple.notes.collaboration.acceptShare", "", buf, 2u);
      }

      uint64_t v11 = *(void *)(a1 + 88);
      if (v11) {
        (*(void (**)(uint64_t, id, void, void))(v11 + 16))(v11, v3, 0, *(void *)(a1 + 64));
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v12 = [*(id *)(a1 + 32) share];
      id v13 = [v12 URL];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
      long long v15 = objc_msgSend(WeakRetained, "ic_loggingDescription");
      *(_DWORD *)long long buf = 138412546;
      id v53 = v13;
      __int16 v54 = 2112;
      id v55 = v15;
      _os_log_impl(&dword_1B08EB000, v5, OS_LOG_TYPE_INFO, "Share accepted for URL %@ %@", buf, 0x16u);
    }
    long long v16 = [*(id *)(a1 + 32) hierarchicalRootRecordID];
    long long v17 = os_log_create("com.apple.notes", "Collaboration");
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        long long v19 = objc_msgSend(v16, "ic_loggingDescription");
        uint64_t v20 = *(void **)(a1 + 64);
        *(_DWORD *)long long buf = 138412546;
        id v53 = v19;
        __int16 v54 = 2112;
        id v55 = v20;
        _os_log_impl(&dword_1B08EB000, v17, OS_LOG_TYPE_DEFAULT, "Fetching record from share %@, account ID = %@", buf, 0x16u);
      }
      id v21 = [*(id *)(a1 + 48) cloudContext];
      id v51 = v16;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
      uint64_t v23 = *(void *)(a1 + 64);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_147;
      v35[3] = &unk_1E5FDCE30;
      id v24 = v16;
      uint64_t v25 = *(void *)(a1 + 48);
      id v36 = v24;
      uint64_t v37 = v25;
      id v38 = *(id *)(a1 + 32);
      id v39 = *(id *)(a1 + 80);
      objc_copyWeak(v44, (id *)(a1 + 96));
      id v40 = *(id *)(a1 + 64);
      id v26 = *(id *)(a1 + 72);
      id v27 = *(void **)(a1 + 104);
      id v41 = v26;
      v44[1] = v27;
      id v28 = *(id *)(a1 + 88);
      id v42 = 0;
      id v43 = v28;
      [v21 fetchRecordIDs:v22 accountID:v23 operationGroupName:@"FetchRecordForAcceptedShare" completionHandler:v35];

      objc_destroyWeak(v44);
    }
    else
    {
      if (v18)
      {
        id v29 = [*(id *)(a1 + 32) share];
        id v30 = objc_msgSend(v29, "ic_loggingDescription");
        *(_DWORD *)long long buf = 138412290;
        id v53 = v30;
        _os_log_impl(&dword_1B08EB000, v17, OS_LOG_TYPE_DEFAULT, "No root record when accepting share: %@", buf, 0xCu);
      }
      uint64_t v31 = *(id *)(a1 + 72);
      __int16 v32 = v31;
      os_signpost_id_t v33 = *(void *)(a1 + 104);
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B08EB000, v32, OS_SIGNPOST_INTERVAL_END, v33, "com.apple.notes.collaboration.acceptShare", "", buf, 2u);
      }

      uint64_t v34 = *(void *)(a1 + 88);
      if (v34) {
        (*(void (**)(uint64_t, void, void, void))(v34 + 16))(v34, 0, 0, *(void *)(a1 + 64));
      }
    }
  }
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_143(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "unsignedIntegerValue") + 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 acceptShareWithMetadata:v3 attemptNumber:v4 container:*(void *)(a1 + 56) accountID:*(void *)(a1 + 64) fetchObjectWithCompletionHandler:*(void *)(a1 + 72)];
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_147(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Collaboration");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_147_cold_1(a1);
    }
    dispatch_time_t v6 = v5;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
      *(_DWORD *)long long buf = 138412290;
      id v24 = v7;
      _os_log_impl(&dword_1B08EB000, v5, OS_LOG_TYPE_DEFAULT, "Fetched record from share %@", buf, 0xCu);
    }
    id v8 = [*(id *)(a1 + 40) backgroundContext];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_148;
    v15[3] = &unk_1E5FDCE08;
    long long v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    objc_copyWeak(&v22, (id *)(a1 + 96));
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 64);
    dispatch_time_t v6 = v8;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v20 = v6;
    uint64_t v21 = v9;
    [v6 performBlockAndWait:v15];

    objc_destroyWeak(&v22);
    id v5 = v16;
  }

  os_signpost_id_t v10 = *(id *)(a1 + 72);
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 104);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "com.apple.notes.collaboration.acceptShare", "", buf, 2u);
  }

  uint64_t v13 = *(void *)(a1 + 88);
  if (v13) {
    (*(void (**)(uint64_t, void, void, void))(v13 + 16))(v13, *(void *)(a1 + 80), 0, *(void *)(a1 + 64));
  }
  id v14 = [*(id *)(a1 + 40) cloudContext];
  [v14 syncWithReason:@"SyncAfterAcceptShare" uploadUnsyncedChanges:0 completionHandler:0];
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_148(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) share];
  id v3 = [v2 recordID];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) share];
  dispatch_time_t v6 = [v5 recordID];
  char v7 = [v4 objectForKeyedSubscript:v6];

  id v8 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_148_cold_2(v7, a1);
  }

  if (!v7)
  {
LABEL_5:
    char v7 = [*(id *)(a1 + 32) share];
    uint64_t v9 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_148_cold_1(v7, a1);
    }
  }
  os_signpost_id_t v10 = [MEMORY[0x1E4F83328] objectWithRecordID:*(void *)(a1 + 48) accountID:*(void *)(a1 + 56) context:*(void *)(a1 + 64)];
  [v10 didAcceptShare:v7];
  uint64_t v11 = [*(id *)(a1 + 72) collaborationAnalyticsDelegate];
  os_signpost_id_t v12 = [v7 URL];
  [v11 trackCollaborationNotificationAcceptanceForObject:v10 shareURL:v12];

  uint64_t v13 = [*(id *)(a1 + 72) collaborationControllerDelegate];
  [v13 collaborationController:*(void *)(a1 + 72) persistJoinActivityEventOnObject:v10];

  objc_msgSend(*(id *)(a1 + 64), "ic_save");
}

- (void)fetchAndAcceptShareMetadataWithURL:(id)a3 managedObjectContext:(id)a4 alertBlock:(id)a5 showObjectBlock:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    id v14 = [(ICCollaborationController *)self collaborationControllerDelegate];
    v22[0] = v10;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke;
    v17[3] = &unk_1E5FDCED0;
    v17[4] = self;
    id v20 = v12;
    id v18 = v10;
    id v19 = v11;
    id v21 = v13;
    [v14 collaborationController:self fetchShareMetadataWithURLs:v15 completion:v17];
  }
  else
  {
    long long v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ICCollaborationController fetchAndAcceptShareMetadataWithURL:managedObjectContext:alertBlock:showObjectBlock:]();
    }
  }
}

void __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v9 = a4;
  id v13 = a1[7];
  id v10 = v6;
  id v11 = a1[5];
  id v12 = a1[6];
  id v14 = a1[8];
  id v7 = v6;
  id v8 = v9;
  performBlockOnMainThread();
}

void __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_2_cold_1();
    }

    [(id)objc_opt_class() genericShareErrorAlert:*(void *)(a1 + 72)];
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 56)];
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 72);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_155;
    v8[3] = &unk_1E5FDCE80;
    id v7 = *(void **)(a1 + 48);
    void v8[4] = *(void *)(a1 + 40);
    id v9 = v7;
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 80);
    [v3 processShareAcceptanceWithMetadata:v4 managedObjectContext:v5 alertBlock:v6 showObjectBlock:v8];
  }
}

void __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_155(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v7 = a2;
  id v4 = [v3 collaborationControllerDelegate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v4 collaborationController:v5 userAcceptedInvitationWithShareMetadata:v6 associatedObjectID:v7];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)processShareAcceptanceWithMetadata:(id)a3 managedObjectContext:(id)a4 alertBlock:(id)a5 showObjectBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke;
  v18[3] = &unk_1E5FDCF20;
  id v19 = v10;
  id v20 = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v14 = v13;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  [(ICCollaborationController *)self acceptShareWithMetadata:v17 managedObjectContext:v15 completionHandler:v18];
}

void __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) hierarchicalRootRecordID];
  id v10 = (void *)v9;
  if (v7)
  {
    id v11 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke_cold_1();
    }

    if (([(id)objc_opt_class() showCloudKitShareAcceptancePartialFailureAlertForError:v7 alertBlock:*(void *)(a1 + 56)] & 1) == 0)objc_msgSend((id)objc_opt_class(), "genericShareErrorAlert:", *(void *)(a1 + 56)); {
  }
    }
  else
  {
    if (v8) {
      BOOL v12 = v9 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    char v13 = !v12;
    id v14 = os_log_create("com.apple.notes", "Collaboration");
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        id v16 = objc_msgSend(v10, "ic_loggingDescription");
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_DEFAULT, "Trying to show shared object %@", (uint8_t *)&buf, 0xCu);
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v58 = 0x3032000000;
      id v59 = __Block_byref_object_copy__48;
      __int16 v60 = __Block_byref_object_dispose__48;
      id v61 = 0;
      uint64_t v49 = 0;
      id v50 = &v49;
      uint64_t v51 = 0x3032000000;
      __int16 v52 = __Block_byref_object_copy__48;
      id v53 = __Block_byref_object_dispose__48;
      id v54 = 0;
      uint64_t v45 = 0;
      id v46 = &v45;
      uint64_t v47 = 0x2020000000;
      char v48 = 0;
      id v17 = *(void **)(a1 + 48);
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      uint64_t v37 = __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke_158;
      id v38 = &unk_1E5FDCEF8;
      p_long long buf = &buf;
      id v39 = v10;
      id v40 = v8;
      id v41 = *(id *)(a1 + 48);
      id v43 = &v49;
      id v44 = &v45;
      [v17 performBlockAndWait:&v35];
      if (*(void *)(*((void *)&buf + 1) + 40))
      {
        int v18 = *((unsigned __int8 *)v46 + 24);
        id v19 = os_log_create("com.apple.notes", "Collaboration");
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (v20)
          {
            id v21 = (void *)v50[5];
            *(_DWORD *)id v55 = 138412290;
            uint64_t v56 = v21;
            _os_log_impl(&dword_1B08EB000, v19, OS_LOG_TYPE_DEFAULT, "Showing shared object %@", v55, 0xCu);
          }

          uint64_t v22 = *(void *)(a1 + 64);
          id v23 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "objectID", v35, v36, v37, v38, v39, v40);
          (*(void (**)(uint64_t, void *, uint64_t))(v22 + 16))(v22, v23, a3);
        }
        else
        {
          if (v20)
          {
            id v29 = (void *)v50[5];
            *(_DWORD *)id v55 = 138412290;
            uint64_t v56 = v29;
            _os_log_impl(&dword_1B08EB000, v19, OS_LOG_TYPE_DEFAULT, "Found shared %@, but doing nothing", v55, 0xCu);
          }

          id v23 = objc_msgSend(MEMORY[0x1E4F83770], "localizedFrameworkStringForKey:value:table:allowSiri:", @"Item Unavailable", @"Item Unavailable", 0, 1, v35, v36, v37, v38, v39, v40);
          id v30 = [MEMORY[0x1E4FB16C8] currentDevice];
          uint64_t v31 = [v30 userInterfaceIdiom];

          if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
            __int16 v32 = @"To view this item, update to the latest version of iPadOS.";
          }
          else {
            __int16 v32 = @"To view this item, update to the latest version of iOS.";
          }
          uint64_t v33 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v32 value:v32 table:0 allowSiri:1];
          uint64_t v34 = (void *)v33;
          if (v23 && v33) {
            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          }
        }
      }
      else
      {
        id v26 = os_log_create("com.apple.notes", "Collaboration");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = objc_msgSend(*(id *)(a1 + 32), "share", v35, v36, v37, v38, v39, v40);
          id v28 = objc_msgSend(v27, "ic_loggingDescription");
          *(_DWORD *)id v55 = 138412290;
          uint64_t v56 = v28;
          _os_log_impl(&dword_1B08EB000, v26, OS_LOG_TYPE_DEFAULT, "Unable to find note after accepting share %@", v55, 0xCu);
        }
        [(id)objc_opt_class() genericShareErrorAlert:*(void *)(a1 + 56)];
      }

      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(&v49, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (v15)
      {
        id v24 = [*(id *)(a1 + 32) share];
        uint64_t v25 = objc_msgSend(v24, "ic_loggingDescription");
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v25;
        _os_log_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_DEFAULT, "No root record or no accountID when accepting share: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

uint64_t __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke_158(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F83328] objectWithRecordID:a1[4] accountID:a1[5] context:a1[6]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (result)
  {
    uint64_t v6 = [(id)result shortLoggingDescription];
    uint64_t v7 = *(void *)(a1[8] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), uint64_t result = objc_opt_isKindOfClass(), (result))
    {
      uint64_t result = [*(id *)(*(void *)(a1[7] + 8) + 40) isUnsupported];
      char v9 = result ^ 1;
    }
    else
    {
      char v9 = 0;
    }
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = v9;
  }
  return result;
}

+ (void)genericShareErrorAlert:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v7 = [v4 localizedFrameworkStringForKey:@"Can’t Open Note" value:@"Can’t Open Note" table:0 allowSiri:1];
  uint64_t v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Sorry, this note can’t be opened right now. Please try again later.", @"Sorry, this note can’t be opened right now. Please try again later.", 0, 1 value table allowSiri];
  (*((void (**)(id, id, void *))a3 + 2))(v5, v7, v6);
}

+ (BOOL)showCloudKitShareAcceptancePartialFailureAlertForError:(id)a3 alertBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_6;
  }
  id v7 = [v5 domain];
  if (([v7 isEqualToString:*MEMORY[0x1E4F19C40]] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v8 = [v5 code];

  if (v8 != 2)
  {
LABEL_6:
    BOOL v11 = 0;
    goto LABEL_7;
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  char v9 = [v5 userInfo];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__ICCollaborationController_showCloudKitShareAcceptancePartialFailureAlertForError_alertBlock___block_invoke;
  v13[3] = &unk_1E5FDCF48;
  id v14 = v6;
  BOOL v15 = &v16;
  [v10 enumerateKeysAndObjectsUsingBlock:v13];
  BOOL v11 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
LABEL_7:

  return v11;
}

void __95__ICCollaborationController_showCloudKitShareAcceptancePartialFailureAlertForError_alertBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 code] == 29)
  {
    id v7 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1B08EB000, v7, OS_LOG_TYPE_DEFAULT, "Share is at maximum capacity, showing alert for error: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    char v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Note at Capacity" value:@"Note at Capacity" table:0 allowSiri:1];
    id v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"This note is at maximum capacity right now. Try again soon." value:@"This note is at maximum capacity right now. Try again soon." table:0 allowSiri:1];
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)highlightColorForUserID:(id)a3 inNote:(id)a4 isDark:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  char v9 = [v7 collaborationColorManager];
  id v10 = [v9 highlightColorForUserID:v8 note:v7];

  double v11 = 0.8;
  if (!v5) {
    double v11 = 1.0;
  }
  id v12 = [v10 colorWithAlphaComponent:v11];

  return v12;
}

- (void)updateShares
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Updating shares…", v2, v3, v4, v5, v6);
}

void __41__ICCollaborationController_updateShares__block_invoke(int8x16_t *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)a1[2].i64[0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__ICCollaborationController_updateShares__block_invoke_2;
  v9[3] = &unk_1E5FD8FE8;
  id v10 = v4;
  int8x16_t v8 = a1[2];
  id v6 = (id)v8.i64[0];
  int8x16_t v11 = vextq_s8(v8, v8, 8uLL);
  id v7 = v4;
  [v5 performBlock:v9];
}

void __41__ICCollaborationController_updateShares__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v1 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __41__ICCollaborationController_updateShares__block_invoke_2_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 40) setIsShareDirty:0];
    uint64_t v3 = *(void **)(a1 + 48);
    objc_msgSend(v3, "ic_saveWithLogDescription:", @"Finished updating share");
  }
}

- (void)updatePendingInvitationsInAccountWithID:(id)a3 receivedSince:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((updatePendingInvitationsInAccountWithID_receivedSince__isUpdatingPendingInvitations & 1) == 0)
  {
    int8x16_t v8 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138413058;
      id v17 = v6;
      __int16 v18 = 2112;
      __int16 v20 = 2080;
      id v19 = v7;
      id v21 = "-[ICCollaborationController updatePendingInvitationsInAccountWithID:receivedSince:]";
      __int16 v22 = 1024;
      int v23 = 1520;
      _os_log_impl(&dword_1B08EB000, v8, OS_LOG_TYPE_DEFAULT, "Updating pending invitations… {accountID: %@, receivedSince: %@}%s:%d", buf, 0x26u);
    }

    updatePendingInvitationsInAccountWithID_receivedSince__isUpdatingPendingInvitations = 1;
    char v9 = [(ICCollaborationController *)self viewContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke;
    v11[3] = &unk_1E5FDA5F8;
    id v12 = v6;
    id v13 = v9;
    id v14 = v7;
    BOOL v15 = self;
    id v10 = v9;
    [v10 performBlock:v11];
  }
}

void __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_opt_class();
    uint64_t v2 = [*(id *)(a1 + 40) objectWithID:*(void *)(a1 + 32)];
    uint64_t v3 = ICCheckedDynamicCast();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [MEMORY[0x1E4F833B8] predicateForPendingInvitationsInAccount:v3 receivedSince:*(void *)(a1 + 48)];
  uint64_t v5 = [MEMORY[0x1E4F833B8] invitationsMatchingPredicate:v4 context:*(void *)(a1 + 40)];
  id v6 = objc_msgSend(v5, "ic_map:", &__block_literal_global_192);
  id v7 = [*(id *)(a1 + 56) collaborationControllerDelegate];
  uint64_t v8 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke_3;
  v10[3] = &unk_1E5FDCFB8;
  id v11 = v3;
  id v12 = *(id *)(a1 + 40);
  id v9 = v3;
  [v7 collaborationController:v8 fetchShareMetadataWithURLs:v6 completion:v10];
}

uint64_t __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 shareURL];
}

void __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v9 = a4;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v9;
  performBlockOnMainThread();
}

void __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke_4(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) objectID];
      id v4 = *(const char **)(a1 + 32);
      *(_DWORD *)long long buf = 138413058;
      id v28 = v3;
      __int16 v29 = 2112;
      id v30 = v4;
      __int16 v31 = 2080;
      __int16 v32 = "-[ICCollaborationController updatePendingInvitationsInAccountWithID:receivedSince:]_block_invoke_4";
      __int16 v33 = 1024;
      int v34 = 1541;
      _os_log_impl(&dword_1B08EB000, v2, OS_LOG_TYPE_DEFAULT, "Error updating pending invitations {accountID: %@, error: %@}%s:%d", buf, 0x26u);
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [*(id *)(a1 + 48) allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v23;
      unint64_t v10 = 0x1E4F83000uLL;
      *(void *)&long long v7 = 138412546;
      long long v20 = v7;
      id v21 = v5;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v13 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v12, v20);
          id v14 = [v13 share];

          BOOL v15 = [*(id *)(v10 + 952) invitationWithShareURL:v12 context:*(void *)(a1 + 56)];
          [v15 updateFromShare:v14];
          uint64_t v16 = os_log_create("com.apple.notes", "Collaboration");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            id v17 = objc_msgSend(v14, "ic_loggingDescription");
            __int16 v18 = [v15 objectID];
            *(_DWORD *)long long buf = v20;
            id v28 = v17;
            __int16 v29 = 2112;
            id v30 = v18;
            _os_log_debug_impl(&dword_1B08EB000, v16, OS_LOG_TYPE_DEBUG, "Updated invitation {share: %@, objectID: %@}", buf, 0x16u);

            unint64_t v10 = 0x1E4F83000;
            uint64_t v5 = v21;
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 56), "ic_save");
    uint64_t v2 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [*(id *)(a1 + 40) objectID];
      *(_DWORD *)long long buf = 138412802;
      id v28 = v19;
      __int16 v29 = 2080;
      id v30 = "-[ICCollaborationController updatePendingInvitationsInAccountWithID:receivedSince:]_block_invoke";
      __int16 v31 = 1024;
      LODWORD(v32) = 1558;
      _os_log_impl(&dword_1B08EB000, v2, OS_LOG_TYPE_DEFAULT, "Updated pending invitations {accountID: %@}%s:%d", buf, 0x1Cu);
    }
  }

  updatePendingInvitationsInAccountWithID_receivedSince__isUpdatingPendingInvitations = 0;
}

+ (void)showQuotaExceededAlertIfNeededWithRecordID:(id)a3 accountID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [a1 sharedInstance];
  uint64_t v8 = [v10 collaborationControllerDelegate];
  uint64_t v9 = [a1 sharedInstance];
  [v8 collaborationController:v9 showQuotaExceededAlertIfNeededWithRecordID:v7 accountID:v6];
}

- (id)objectForCKShareRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    id v10 = a3;
    id v11 = [(ICCollaborationController *)self ckShareIDToRootRecordID];
    uint64_t v12 = [v11 objectForKeyedSubscript:v10];

    if (v12)
    {
      id v13 = [(ICCollaborationController *)self cloudContext];
      id v14 = [v13 existingCloudObjectForRecordID:v12 recordType:0 accountID:v8 context:v9];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)updateRootRecordMapWithShare:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F831C8]];
    id v6 = [v5 recordID];
    id v7 = [v13 recordID];
    if (v7 && v6)
    {
      id v8 = [(ICCollaborationController *)self ckShareIDToRootRecordID];
      id v9 = [v8 allKeys];
      id v10 = [v13 recordID];
      char v11 = [v9 containsObject:v10];

      if (v11)
      {
LABEL_7:

        id v4 = v13;
        goto LABEL_8;
      }
      id v7 = [(ICCollaborationController *)self ckShareIDToRootRecordID];
      uint64_t v12 = [v13 recordID];
      [v7 setObject:v6 forKeyedSubscript:v12];
    }
    goto LABEL_7;
  }
LABEL_8:
}

+ (void)saveActivityType:(id)a3 isCollaborationSelected:(BOOL)a4 error:(id)a5 completed:(BOOL)a6 forNote:(id)a7
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v16 = [a1 sharedInstance];
  BOOL v15 = [v16 collaborationAnalyticsTracker];
  [v15 saveActivityType:v14 isCollaborationSelected:v9 error:v13 completed:v7 forNote:v12];
}

+ (void)trackShare:(id)a3 forNote:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [a1 sharedInstance];
  id v8 = [v9 collaborationAnalyticsTracker];
  [v8 trackShare:v7 forNote:v6];
}

- (ICCollaborationControllerDelegate)collaborationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collaborationControllerDelegate);
  return (ICCollaborationControllerDelegate *)WeakRetained;
}

- (ICCollaborationAnalyticsDelegate)collaborationAnalyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collaborationAnalyticsDelegate);
  return (ICCollaborationAnalyticsDelegate *)WeakRetained;
}

- (ICCollaborationAnalyticsTracker)collaborationAnalyticsTracker
{
  return self->_collaborationAnalyticsTracker;
}

- (void)setCollaborationAnalyticsTracker:(id)a3
{
}

- (NSMutableDictionary)ckShareIDToRootRecordID
{
  return self->_ckShareIDToRootRecordID;
}

- (void)setCkShareIDToRootRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckShareIDToRootRecordID, 0);
  objc_storeStrong((id *)&self->_updateSharesDelayer, 0);
  objc_storeStrong((id *)&self->_collaborationAnalyticsTracker, 0);
  objc_destroyWeak((id *)&self->_collaborationAnalyticsDelegate);
  objc_destroyWeak((id *)&self->_collaborationControllerDelegate);
}

- (void)registerShareForObject:itemProvider:generateThumbnails:sharePreparationHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Trying to registerShareForObject with empty accountID", v2, v3, v4, v5, v6);
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Trying to registerShareForObject with nil container", v2, v3, v4, v5, v6);
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_2(id *a1)
{
  uint64_t v1 = [*a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "No existing share for %@", v4, v5, v6, v7, v8);
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_3(uint64_t a1, id *a2)
{
  uint64_t v2 = [*a2 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v3, v4, "Hierarchical share exists, using share %@ for managing sharing for %@", v5, v6, v7, v8, 2u);
}

void __97__ICCollaborationController_updatedShareForObject_includeHierarchicalShare_managedObjectContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_10_0(v1) shortLoggingDescription];
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(v0 + 56)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v4, v5, "Checking for an existing share for %@, includeHierarchicalShare=%@", v6, v7, v8, v9, v10);
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_0(v1), "ic_loggingDescription");
  uint64_t v3 = [*(id *)(v0 + 40) shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v4, v5, "Preparing share %@ for %@", v6, v7, v8, v9, v10);
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_4_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10_0(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Finished waiting for operations before preparing share for %@", v4, v5, v6, v7, v8);
}

- (void)saveShare:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "saveShare:forObject:qualityOfService:completionHandler: shareArgument is nil", v2, v3, v4, v5, v6);
}

- (void)saveShare:(void *)a1 withRootRecord:(void *)a2 object:accountID:container:qualityOfService:completionHandler:.cold.1(void *a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a1, "ic_loggingDescription");
  uint64_t v4 = objc_msgSend(a2, "ic_loggingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_1B08EB000, v5, v6, "Tried to save a share (%@) without an account ID for object: %@", v7, v8, v9, v10, 2u);
}

- (void)saveShare:(void *)a1 withRootRecord:(void *)a2 object:accountID:container:qualityOfService:completionHandler:.cold.2(void *a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a1, "ic_loggingDescription");
  uint64_t v4 = objc_msgSend(a2, "ic_loggingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_1B08EB000, v5, v6, "Tried to save a mismatched share (%@) for object: %@", v7, v8, v9, v10, 2u);
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11();
  uint64_t v2 = [*(id *)(v1 + 40) shortLoggingDescription];
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 56), "ic_loggingDescription");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v4, v5, "No CKShare or error returned for %@ %@", v6, v7, v8, v9, v10);
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_11();
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(*(id *)(v2 + 32), "ic_loggingDescription");
  uint64_t v4 = [*(id *)(v1 + 40) shortLoggingDescription];
  uint64_t v5 = objc_msgSend(*(id *)(v1 + 48), "ic_loggingDescription");
  uint64_t v6 = *(void *)(v1 + 56);
  int v7 = 138413058;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint8_t v10 = v4;
  __int16 v11 = 2112;
  id v12 = v5;
  __int16 v13 = 2112;
  uint64_t v14 = v6;
  _os_log_error_impl(&dword_1B08EB000, v0, OS_LOG_TYPE_ERROR, "Error saving share %@ for %@ %@: %@", (uint8_t *)&v7, 0x2Au);
}

- (void)fetchShareIfNecessaryForObject:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Trying to fetchShareIfNecessaryForObject with empty accountID", v2, v3, v4, v5, v6);
}

- (void)fetchShareIfNecessaryForObject:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_11();
  *(_DWORD *)uint64_t v2 = 138412546;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2112;
  *(void *)(v2 + 14) = v4;
  _os_log_debug_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEBUG, "Fetching share %@ with %@", v5, 0x16u);
}

void __78__ICCollaborationController_fetchShareIfNecessaryForObject_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(a1, "ic_loggingDescription");
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 72));
  uint64_t v5 = objc_msgSend(WeakRetained, "ic_loggingDescription");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v6, v7, "Fetched share %@ %@", v8, v9, v10, v11, v12);
}

- (void)objectForShare:(void *)a1 accountID:context:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "No record type in share %@", v4, v5, v6, v7, v8);
}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "removeShareIfNeededWithOwnedObjectID :: Deleting share for objectID %@ succeeded", v2, v3, v4, v5, v6);
}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1B08EB000, v1, OS_LOG_TYPE_ERROR, "removeShareIfNeededWithOwnedObjectID :: Deleting share for objectID %@ failed with error %@", v2, 0x16u);
}

void __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_121_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "An error has occured when syncing the deletion of the share in didStopSharing: %@", v2, v3, v4, v5, v6);
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Couldn't find container for metadata %@", v2, v3, v4, v5, v6);
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Couldn't find account id for container %@", v2, v3, v4, v5, v6);
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Single account or unable to fetch account ID. Using cloudKitAccountInContext.", v2, v3, v4, v5, v6);
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Single account or unable to fetch container. Using containerWithIdentifier.", v2, v3, v4, v5, v6);
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "userRecordID is CKCurrentUserDefaultName. Fetching accountID and container.", v2, v3, v4, v5, v6);
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Multiple accounts detected. Fetching container and accountID.", v2, v3, v4, v5, v6);
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v2 = [(id)OUTLINED_FUNCTION_10_0(a1) share];
  uint64_t v3 = [v2 URL];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  uint64_t v5 = objc_msgSend(WeakRetained, "ic_loggingDescription");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_0(&dword_1B08EB000, v6, v7, "Retrying accept share at URL %@ %@", v8, v9, v10, v11, v12);
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) share];
  uint64_t v7 = [v6 URL];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  uint64_t v9 = objc_msgSend(WeakRetained, "ic_loggingDescription");
  int v11 = 138412802;
  uint8_t v12 = v7;
  OUTLINED_FUNCTION_2();
  __int16 v13 = v10;
  uint64_t v14 = a2;
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Error accepting share at URL %@ %@: %@", (uint8_t *)&v11, 0x20u);
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_147_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_10_0(a1), "ic_loggingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v2, v3, "Error fetching record from share %@: %@", v4, v5, v6, v7, v8);
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_148_cold_1(void *a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(a1, "ic_loggingDescription");
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 80));
  uint64_t v5 = objc_msgSend(WeakRetained, "ic_loggingDescription");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v6, v7, "Falling back to share from metadata %@: %@", v8, v9, v10, v11, v12);
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_148_cold_2(void *a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(a1, "ic_loggingDescription");
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 80));
  uint64_t v5 = objc_msgSend(WeakRetained, "ic_loggingDescription");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v6, v7, "Using share from per-share completion block %@: %@", v8, v9, v10, v11, v12);
}

- (void)fetchAndAcceptShareMetadataWithURL:managedObjectContext:alertBlock:showObjectBlock:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "URL was nil, cannot fetch and accept share.", v2, v3, v4, v5, v6);
}

void __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Error fetching share. %@", v2, v3, v4, v5, v6);
}

void __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Error accepting share. %@", v2, v3, v4, v5, v6);
}

void __41__ICCollaborationController_updateShares__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Error updating share {error: %@}", v2, v3, v4, v5, v6);
}

@end