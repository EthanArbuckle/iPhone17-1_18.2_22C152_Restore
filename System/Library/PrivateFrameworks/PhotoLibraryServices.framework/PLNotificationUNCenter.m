@interface PLNotificationUNCenter
+ (id)_UNNotificationInitialize;
+ (id)_categoryIdentifierForNotification:(id)a3;
+ (id)_contentUserInfoForNotification:(id)a3;
+ (id)_expiringCMMCategory;
+ (id)_invitationAcceptedCategory;
+ (id)_invitationsCategoryWithJunkAction:(BOOL)a3;
+ (id)_notificationEnablementKeyForNotificationType:(int64_t)a3;
+ (id)_readyToViewInvitationCMMCategory;
+ (id)_sharedLibraryParticipantAssetTrashNotificationCategory;
+ (id)_sharedLibrarySuggestionsCategory;
+ (id)_soundForNotification:(id)a3;
+ (id)_threadIdentifierForNotification:(id)a3;
+ (id)_updatesCategory;
+ (id)_updatesCommentedCategory;
+ (id)_updatesLikedCategory;
+ (unint64_t)_interruptionLevelForNotification:(id)a3;
- (PLNotificationUNCenter)init;
- (PLNotificationUNCenterDelegate)delegate;
- (id)_copiedContentFromContent:(id)a3 WithImageData:(id)a4 identifier:(id)a5;
- (id)_makeTempThumbnailFileForImageData:(id)a3 identifier:(id)a4;
- (id)_makeTempThumbnailFileForNotification:(id)a3;
- (id)_notificationContentWithNotification:(id)a3 withImageURL:(id)a4 sound:(BOOL)a5;
- (void)_findNotificationForRequestIdentifier:(id)a3 withPendingHandler:(id)a4 deliveredHandler:(id)a5 completionHandler:(id)a6;
- (void)_updateAppBadge;
- (void)enumerateExistingNotificationsUsingBlock:(id)a3;
- (void)findExistingNotificationByIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)mergeExistingAndSendNotificationForNotification:(id)a3 requestIdentifier:(id)a4 thumbnailHandler:(id)a5;
- (void)mergeExistingAndSendNotificationForNotification:(id)a3 thumbnailHandler:(id)a4;
- (void)removeAllNotifications;
- (void)removeNotificationWithRequestIdentifiers:(id)a3;
- (void)removeNotificationsForNotifications:(id)a3;
- (void)sendNotificationForNotification:(id)a3;
- (void)sendNotificationForNotification:(id)a3 withAttachmentURL:(id)a4 forceToSound:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)updateBadgeCountWithDelay:(unint64_t)a3;
- (void)updateImageData:(id)a3 forNotificationWithIdentifier:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PLNotificationUNCenter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unc, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PLNotificationUNCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLNotificationUNCenterDelegate *)WeakRetained;
}

- (void)_updateAppBadge
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(PLNotificationUNCenter *)self delegate];
  uint64_t v4 = [v3 currentAppBadgeCountForNotificationUNCenter:self];

  v5 = [(UNUserNotificationCenter *)self->_unc badgeNumber];
  unsigned int v6 = [v5 unsignedIntValue];

  if (v4 != v6)
  {
    v7 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v4;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "[Badge Count] Changed application badge count from %lu to %lu", (uint8_t *)&v8, 0x16u);
    }
  }
  [(UNUserNotificationCenter *)self->_unc setBadgeCount:v4 withCompletionHandler:0];
}

- (id)_copiedContentFromContent:(id)a3 WithImageData:(id)a4 identifier:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 921, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  v13 = [v9 title];
  [v12 setTitle:v13];

  v14 = [v9 body];
  [v12 setBody:v14];

  v15 = [v9 categoryIdentifier];
  [v12 setCategoryIdentifier:v15];

  v16 = [v9 threadIdentifier];
  [v12 setThreadIdentifier:v16];

  v17 = [v9 defaultActionURL];
  [v12 setDefaultActionURL:v17];

  v18 = [v9 sound];
  [v12 setSound:v18];

  v19 = [(PLNotificationUNCenter *)self _makeTempThumbnailFileForImageData:v10 identifier:v11];
  if (v19)
  {
    id v31 = 0;
    v20 = [MEMORY[0x1E4F445F0] attachmentWithIdentifier:@"my_image" URL:v19 options:0 error:&v31];
    id v21 = v31;
    if (v20)
    {
      v36[0] = v20;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      [v12 setAttachments:v22];

      v23 = (void *)MEMORY[0x1E4F1CA60];
      v24 = [v9 userInfo];
      v25 = [v23 dictionaryWithDictionary:v24];

      v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F8C760]];
      [v26 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F8C7F0]];

      [v12 setUserInfo:v25];
    }
    else
    {
      v27 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = [v21 localizedDescription];
        *(_DWORD *)buf = 138412546;
        v33 = v19;
        __int16 v34 = 2112;
        v35 = v28;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "ERROR: create attachment for URL (%@) failed, error: %@", buf, 0x16u);
      }
      v25 = v12;
      id v12 = 0;
    }
  }
  else
  {

    id v12 = 0;
  }

  return v12;
}

- (id)_notificationContentWithNotification:(id)a3 withImageURL:(id)a4 sound:(BOOL)a5
{
  BOOL v5 = a5;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 887, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  id v12 = [v9 title];
  [v11 setTitle:v12];

  v13 = [v9 message];
  [v11 setBody:v13];

  v14 = [(id)objc_opt_class() _categoryIdentifierForNotification:v9];
  [v11 setCategoryIdentifier:v14];

  v15 = [(id)objc_opt_class() _threadIdentifierForNotification:v9];
  [v11 setThreadIdentifier:v15];

  objc_msgSend(v11, "setInterruptionLevel:", objc_msgSend((id)objc_opt_class(), "_interruptionLevelForNotification:", v9));
  v16 = (void *)MEMORY[0x1E4F1CB10];
  v17 = [v9 destinationURLString];
  v18 = [v16 URLWithString:v17];
  [v11 setDefaultActionURL:v18];

  v19 = [(id)objc_opt_class() _contentUserInfoForNotification:v9];
  [v11 setUserInfo:v19];

  if (v5)
  {
    v20 = [(id)objc_opt_class() _soundForNotification:v9];
    [v11 setSound:v20];
  }
  if (v10)
  {
    id v27 = 0;
    id v21 = [MEMORY[0x1E4F445F0] attachmentWithIdentifier:@"my_image" URL:v10 options:0 error:&v27];
    id v22 = v27;
    if (v21)
    {
      v32[0] = v21;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      [v11 setAttachments:v23];
    }
    else
    {
      v23 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = [v22 localizedDescription];
        *(_DWORD *)buf = 138412546;
        id v29 = v10;
        __int16 v30 = 2112;
        id v31 = v24;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "ERROR: create attachment for URL (%@) failed, error: %@", buf, 0x16u);
      }
    }
  }
  return v11;
}

- (id)_makeTempThumbnailFileForImageData:(id)a3 identifier:(id)a4
{
  uint64_t v4 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    int v8 = NSTemporaryDirectory();
    id v9 = [NSString stringWithFormat:@"notificationTempImage_%@.jpg", v6];

    id v10 = [v8 stringByAppendingPathComponent:v9];

    id v15 = 0;
    LODWORD(v8) = [v7 writeToFile:v10 options:1 error:&v15];

    id v11 = v15;
    if (v8)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
    }
    else
    {
      id v12 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [v11 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "ERROR: Writing temp file for notification thumbnail failed: %@", buf, 0xCu);
      }
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (id)_makeTempThumbnailFileForNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 thumbnailImageData];
  if (v5 && ([v4 requestIdentifier], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    int v8 = [(PLNotificationUNCenter *)self _makeTempThumbnailFileForImageData:v5 identifier:v6];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v6 = (void (**)(void))a5;
  PLProcessNotificationResponse(a4);
  v6[2]();
}

- (void)enumerateExistingNotificationsUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 428, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  unc = self->_unc;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke;
  v9[3] = &unk_1E586EF90;
  id v7 = v5;
  id v10 = v7;
  id v11 = v12;
  v9[4] = self;
  [(UNUserNotificationCenter *)unc getPendingNotificationRequestsWithCompletionHandler:v9];

  _Block_object_dispose(v12, 8);
}

void __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_2;
  void v12[3] = &unk_1E586EF18;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v13 = v4;
  uint64_t v14 = v5;
  [a2 enumerateObjectsUsingBlock:v12];
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_3;
  v9[3] = &unk_1E586EF68;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 getDeliveredNotificationsWithCompletionHandler:v9];
}

void __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 content];
  id v7 = [v6 userInfo];
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8C760]];

  uint64_t v8 = v9;
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v8 = v9;
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

void __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_4;
  v6[3] = &unk_1E586EF40;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 enumerateObjectsUsingBlock:v6];
}

void __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 request];
  id v7 = [v6 content];
  uint64_t v8 = [v7 userInfo];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F8C760]];

  id v9 = v10;
  if (v10)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v9 = v10;
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (void)findExistingNotificationByIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 414, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 415, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E586EEC8;
  v17[4] = v18;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E586EEF0;
  v16[4] = v18;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E5870D98;
  id v10 = v9;
  id v14 = v10;
  id v15 = v18;
  [(PLNotificationUNCenter *)self _findNotificationForRequestIdentifier:v7 withPendingHandler:v17 deliveredHandler:v16 completionHandler:v13];

  _Block_object_dispose(v18, 8);
}

uint64_t __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)mergeExistingAndSendNotificationForNotification:(id)a3 requestIdentifier:(id)a4 thumbnailHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32[0] = 0;
  v32[1] = v32;
  void v32[2] = 0x2020000000;
  char v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke;
  v25[3] = &unk_1E586EE50;
  v25[4] = self;
  id v26 = v9;
  id v27 = v8;
  v28 = v30;
  id v29 = v32;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_2;
  v19[3] = &unk_1E586EE78;
  v23 = v32;
  id v20 = v27;
  id v21 = self;
  id v11 = v26;
  id v22 = v11;
  v24 = v30;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_68;
  v14[3] = &unk_1E586EEA0;
  v17 = v32;
  v14[4] = self;
  id v12 = v20;
  id v15 = v12;
  uint64_t v18 = v30;
  id v13 = v10;
  id v16 = v13;
  [(PLNotificationUNCenter *)self _findNotificationForRequestIdentifier:v11 withPendingHandler:v25 deliveredHandler:v19 completionHandler:v14];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

void __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void *)(a1 + 40);
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  uint64_t v6 = [v4 arrayWithObjects:&v13 count:1];
  objc_msgSend(v3, "removePendingNotificationRequestsWithIdentifiers:", v6, v13, v14);

  id v7 = [v5 content];

  id v8 = [v7 userInfo];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F8C760]];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 48) notificationByMergingWithNotificationDictionary:v9];
    if (v10)
    {
      [*(id *)(a1 + 32) sendNotificationForNotification:v10];
      id v11 = [v10 thumbnailImageData];

      if (!v11) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [*(id *)(a1 + 32) sendNotificationForNotification:*(void *)(a1 + 48)];
    id v12 = [*(id *)(a1 + 48) thumbnailImageData];

    if (!v12) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
}

void __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v3 = [a2 request];
    id v4 = [v3 content];
    id v5 = [v4 userInfo];
    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8C760]];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) notificationByMergingWithNotificationDictionary:v6];
      if (v7)
      {
        id v8 = [*(id *)(a1 + 40) _makeTempThumbnailFileForNotification:v7];
        id v9 = [*(id *)(a1 + 40) _notificationContentWithNotification:v7 withImageURL:v8 sound:0];
        uint64_t v10 = *(void *)(a1 + 48);
        id v11 = *(void **)(*(void *)(a1 + 40) + 8);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_3;
        void v12[3] = &unk_1E5873440;
        id v13 = v7;
        [v11 replaceContentForRequestWithIdentifier:v10 replacementContent:v9 completionHandler:v12];
        if (!v8) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
    }
  }
}

uint64_t __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_68(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [*(id *)(a1 + 32) sendNotificationForNotification:*(void *)(a1 + 40)];
    v2 = [*(id *)(a1 + 40) thumbnailImageData];

    if (!v2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "PLNotification replaced notification content: %@ (error: %@)", (uint8_t *)&v6, 0x16u);
  }
}

- (void)mergeExistingAndSendNotificationForNotification:(id)a3 thumbnailHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 requestIdentifier];
  [(PLNotificationUNCenter *)self mergeExistingAndSendNotificationForNotification:v7 requestIdentifier:v8 thumbnailHandler:v6];
}

- (void)removeNotificationWithRequestIdentifiers:(id)a3
{
  unc = self->_unc;
  id v5 = a3;
  [(UNUserNotificationCenter *)unc removePendingNotificationRequestsWithIdentifiers:v5];
  [(UNUserNotificationCenter *)self->_unc removeDeliveredNotificationsWithIdentifiers:v5];

  [(PLNotificationUNCenter *)self updateBadgeCountWithDelay:1];
}

- (void)_findNotificationForRequestIdentifier:(id)a3 withPendingHandler:(id)a4 deliveredHandler:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  unint64_t v12 = (unint64_t)a4;
  unint64_t v13 = (unint64_t)a5;
  id v14 = a6;
  if (!v11)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 262, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  BOOL v15 = (v12 | v13) == 0;
  if (!(v12 | v13))
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 263, @"Invalid parameter not satisfying: %@", @"pendingHandler || deliveredHandler" object file lineNumber description];
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke;
  v35[3] = &unk_1E586EDB0;
  v35[4] = self;
  id v16 = v11;
  id v36 = v16;
  id v17 = (id)v13;
  id v37 = v17;
  id v18 = v14;
  id v38 = v18;
  char v19 = (void *)MEMORY[0x19F38D650](v35);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_4;
  v29[3] = &unk_1E586EE28;
  v29[4] = self;
  id v30 = v16;
  id v31 = (id)v12;
  id v32 = v17;
  id v20 = v19;
  id v33 = v20;
  id v34 = v18;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = (id)v12;
  uint64_t v25 = MEMORY[0x19F38D650](v29);
  id v26 = (void *)v25;
  if (!v15)
  {
    if (!v12) {
      uint64_t v25 = (uint64_t)v20;
    }
    (*(void (**)(void))(v25 + 16))();
  }
}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_2;
  v3[3] = &unk_1E586ED88;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 getDeliveredNotificationsWithCompletionHandler:v3];
}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_5;
  v3[3] = &unk_1E586EE00;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v2 getPendingNotificationRequestsWithCompletionHandler:v3];
}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(void *)(a1 + 40))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_6;
    v8[3] = &unk_1E586EDD8;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v6 enumerateObjectsUsingBlock:v8];
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v7 = *(void *)(a1 + 56);
LABEL_6:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v3, v4, v5);
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    goto LABEL_6;
  }
LABEL_7:
}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 identifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *a4 = 1;
  }
}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_3;
  v9[3] = &unk_1E586ED60;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  [a2 enumerateObjectsUsingBlock:v9];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v4, v5, v6, v7);
  }
}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [v9 request];
  uint64_t v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *a4 = 1;
  }
}

- (void)updateImageData:(id)a3 forNotificationWithIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    unint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 195, @"Invalid parameter not satisfying: %@", @"imageData" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 196, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke;
  void v18[3] = &unk_1E586ED10;
  v18[4] = self;
  id v19 = v7;
  id v20 = v9;
  id v21 = v22;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_59;
  v14[3] = &unk_1E586ED38;
  id v17 = v22;
  v14[4] = self;
  id v10 = v19;
  id v15 = v10;
  id v11 = v20;
  id v16 = v11;
  [(PLNotificationUNCenter *)self _findNotificationForRequestIdentifier:v11 withPendingHandler:v18 deliveredHandler:v14 completionHandler:0];

  _Block_object_dispose(v22, 8);
}

void __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 content];
  uint64_t v5 = [v4 attachments];

  if (![v5 count])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [v3 content];
    id v8 = [v6 _copiedContentFromContent:v7 WithImageData:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48)];

    if (v8)
    {
      id v9 = *(void **)(*(void *)(a1 + 32) + 8);
      v21[0] = *(void *)(a1 + 48);
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v9 removePendingNotificationRequestsWithIdentifiers:v10];

      id v11 = [v3 trigger];
      unint64_t v12 = [MEMORY[0x1E4F44628] requestWithIdentifier:*(void *)(a1 + 48) content:v8 trigger:v11];
      objc_initWeak(&location, *(id *)(a1 + 32));
      unint64_t v13 = *(void **)(*(void *)(a1 + 32) + 8);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_2;
      v15[3] = &unk_1E586ECE8;
      objc_copyWeak(&v19, &location);
      id v16 = v8;
      id v17 = *(id *)(a1 + 48);
      id v14 = v12;
      id v18 = v14;
      [v13 addNotificationRequest:v14 withCompletionHandler:v15];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

void __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_59(void *a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = [a2 request];
    uint64_t v5 = [v4 content];
    id v7 = [v3 _copiedContentFromContent:v5 WithImageData:a1[5] identifier:a1[6]];

    uint64_t v6 = v7;
    if (v7)
    {
      [*(id *)(a1[4] + 8) replaceContentForRequestWithIdentifier:a1[6] replacementContent:v7 completionHandler:&__block_literal_global_74559];
      uint64_t v6 = v7;
    }
  }
}

void __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_2_60(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PLNotification updated thumbnail image (error: %@)", (uint8_t *)&v4, 0xCu);
  }
}

void __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v3 localizedDescription];
      int v12 = 138412290;
      unint64_t v13 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "ERROR: PLNotification failed to post a notifcation (error: %@)", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained updateBadgeCountWithDelay:0];

    int v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) title];
      id v8 = [*(id *)(a1 + 32) body];
      id v9 = [*(id *)(a1 + 32) defaultActionURL];
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      int v12 = 138413314;
      unint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "PLNotification replaced a notification (title: %@, body: %@, defaultActionURL: %@, requestIdentifier: %@, request: %@)", (uint8_t *)&v12, 0x34u);
    }
  }
}

- (void)updateBadgeCountWithDelay:(unint64_t)a3
{
  objc_initWeak(&location, self);
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * a3);
  id v5 = dispatch_get_global_queue(17, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PLNotificationUNCenter_updateBadgeCountWithDelay___block_invoke;
  v6[3] = &unk_1E5875F08;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__PLNotificationUNCenter_updateBadgeCountWithDelay___block_invoke(uint64_t a1)
{
  id v2 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PLNotificationUNCenter_updateBadgeCountWithDelay___block_invoke_2;
  v3[3] = &unk_1E5875F08;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  [v2 performBlock:v3];
  objc_destroyWeak(&v4);
}

void __52__PLNotificationUNCenter_updateBadgeCountWithDelay___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAppBadge];
}

- (void)removeNotificationsForNotifications:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 157, @"Invalid parameter not satisfying: %@", @"notifications" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PLNotificationUNCenter_removeNotificationsForNotifications___block_invoke;
  v9[3] = &unk_1E586ECC0;
  id v10 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v9];
  [(UNUserNotificationCenter *)self->_unc removePendingNotificationRequestsWithIdentifiers:v7];
  [(UNUserNotificationCenter *)self->_unc removeDeliveredNotificationsWithIdentifiers:v7];
  [(PLNotificationUNCenter *)self updateBadgeCountWithDelay:1];
}

void __62__PLNotificationUNCenter_removeNotificationsForNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 requestIdentifier];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

- (void)removeAllNotifications
{
  [(UNUserNotificationCenter *)self->_unc removeAllPendingNotificationRequests];
  unc = self->_unc;
  [(UNUserNotificationCenter *)unc removeAllDeliveredNotifications];
}

- (void)sendNotificationForNotification:(id)a3 withAttachmentURL:(id)a4 forceToSound:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 63, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];
  }
  uint64_t v11 = objc_msgSend((id)objc_opt_class(), "_notificationEnablementKeyForNotificationType:", objc_msgSend(v9, "notificationType"));
  if (v11 && (PLIsNotificationTypeEnabledForKey() & 1) == 0)
  {
    unint64_t v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v9;
      __int16 v32 = 2114;
      id v33 = v11;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Ignoring disabled notification %@, enablement key: %{public}@", location, 0x16u);
    }
  }
  else
  {
    double v12 = 0.001;
    switch([v9 notificationType])
    {
      case 0:
      case 1:
        double v12 = 2.0;
        break;
      case 2:
      case 3:
      case 4:
      case 5:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
        double v12 = 10.0;
        break;
      case 6:
        __int16 v20 = [v9 notificationDeliveryDate];
        uint64_t v21 = v20;
        if (v20)
        {
          [v20 timeIntervalSinceNow];
          double v12 = v22;
        }
        else
        {
          double v12 = 0.001;
        }
        char v23 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        id v24 = [v23 objectForKey:@"PhotosMemoriesNotificationDelayOverride"];

        if (v24)
        {
          [v24 doubleValue];
          double v12 = v25;
        }

        break;
      default:
        break;
    }
    if (v12 < 0.001) {
      double v12 = 0.001;
    }
    unint64_t v13 = [MEMORY[0x1E4F44670] triggerWithTimeInterval:0 repeats:v12];
    __int16 v14 = [(PLNotificationUNCenter *)self _notificationContentWithNotification:v9 withImageURL:v10 sound:v5];
    id v15 = [v9 requestIdentifier];
    __int16 v16 = [MEMORY[0x1E4F44628] requestWithIdentifier:v15 content:v14 trigger:v13];
    objc_initWeak((id *)location, self);
    unc = self->_unc;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __89__PLNotificationUNCenter_sendNotificationForNotification_withAttachmentURL_forceToSound___block_invoke;
    v27[3] = &unk_1E5873468;
    objc_copyWeak(v30, (id *)location);
    v30[1] = *(id *)&v12;
    id v18 = v14;
    id v28 = v18;
    id v19 = v15;
    id v29 = v19;
    [(UNUserNotificationCenter *)unc addNotificationRequest:v16 withCompletionHandler:v27];

    objc_destroyWeak(v30);
    objc_destroyWeak((id *)location);
  }
}

void __89__PLNotificationUNCenter_sendNotificationForNotification_withAttachmentURL_forceToSound___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = [v3 localizedDescription];
      int v12 = 138412290;
      unint64_t v13 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "ERROR: PLNotification failed to post a notifcation (error: %@)", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained updateBadgeCountWithDelay:(unint64_t)*(double *)(a1 + 56)];

    id v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) title];
      id v8 = [*(id *)(a1 + 32) body];
      id v9 = [*(id *)(a1 + 32) defaultActionURL];
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138413314;
      unint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2048;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "PLNotification Posted: Title: %@, Body: %@, defaultActionURL: %@, delay:%.3fs, requestIdentifier: %@", (uint8_t *)&v12, 0x34u);
    }
  }
}

- (void)sendNotificationForNotification:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLNotificationUNCenter.m", 56, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = [(PLNotificationUNCenter *)self _makeTempThumbnailFileForNotification:v5];
  [(PLNotificationUNCenter *)self sendNotificationForNotification:v8 withAttachmentURL:v6 forceToSound:1];
}

- (PLNotificationUNCenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLNotificationUNCenter;
  id v2 = [(PLNotificationUNCenter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() _UNNotificationInitialize];
    unc = v2->_unc;
    v2->_unc = (UNUserNotificationCenter *)v3;

    [(UNUserNotificationCenter *)v2->_unc setDelegate:v2];
  }
  return v2;
}

+ (id)_contentUserInfoForNotification:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PLNotificationUNCenter.m", 962, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "notificationType"));
  [v6 setObject:v7 forKey:*MEMORY[0x1E4F8C7A8]];

  id v8 = [v5 mainAssetUUID];

  if (v8)
  {
    id v9 = [v5 mainAssetUUID];
    [v6 setObject:v9 forKey:*MEMORY[0x1E4F8C710]];
  }
  uint64_t v10 = [v5 albumCloudGUID];

  if (v10)
  {
    uint64_t v11 = [v5 albumCloudGUID];
    [v6 setObject:v11 forKey:*MEMORY[0x1E4F8C6E0]];
  }
  int v12 = [v5 interestingMemoryUUID];

  if (v12)
  {
    unint64_t v13 = [v5 interestingMemoryUUID];
    [v6 setObject:v13 forKey:*MEMORY[0x1E4F8C780]];
  }
  __int16 v14 = [v5 photoLibraryURLString];

  if (v14)
  {
    id v15 = [v5 photoLibraryURLString];
    [v6 setObject:v15 forKey:*MEMORY[0x1E4F8C7C8]];
  }
  __int16 v16 = [v5 suppressionContexts];

  if (v16)
  {
    id v17 = [v5 suppressionContexts];
    [v6 setObject:v17 forKey:*MEMORY[0x1E4F8C7E0]];
  }
  __int16 v18 = [v5 dictionaryRepresentation];
  if (v18) {
    [v6 setObject:v18 forKey:*MEMORY[0x1E4F8C760]];
  }

  return v6;
}

+ (unint64_t)_interruptionLevelForNotification:(id)a3
{
  unint64_t v3 = [a3 notificationType];
  if (v3 > 0x10) {
    return 0;
  }
  else {
    return qword_19BA9EB50[v3];
  }
}

+ (id)_threadIdentifierForNotification:(id)a3
{
  unint64_t v3 = [a3 notificationType];
  if (v3 > 5) {
    return 0;
  }
  else {
    return off_1E586F028[v3];
  }
}

+ (id)_categoryIdentifierForNotification:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 notificationType];
  id v5 = 0;
  id v6 = (id *)MEMORY[0x1E4F8C680];
  switch(v4)
  {
    case 0:
      int v7 = [v3 offerToReportAsJunk];
      id v6 = (id *)MEMORY[0x1E4F8C688];
      if (v7) {
        id v6 = (id *)MEMORY[0x1E4F8C690];
      }
      goto LABEL_15;
    case 1:
      goto LABEL_15;
    case 3:
      id v6 = (id *)MEMORY[0x1E4F8C6C0];
      goto LABEL_15;
    case 4:
      id v6 = (id *)MEMORY[0x1E4F8C6C8];
      goto LABEL_15;
    case 5:
      id v6 = (id *)MEMORY[0x1E4F8C6D8];
      goto LABEL_15;
    case 6:
      id v6 = (id *)MEMORY[0x1E4F8C6D0];
      goto LABEL_15;
    case 9:
      id v6 = (id *)MEMORY[0x1E4F8C678];
      goto LABEL_15;
    case 10:
      id v6 = (id *)MEMORY[0x1E4F8C698];
      goto LABEL_15;
    case 12:
      id v6 = (id *)MEMORY[0x1E4F8C6B8];
      goto LABEL_15;
    case 13:
      id v6 = (id *)MEMORY[0x1E4F8C6A0];
      goto LABEL_15;
    case 14:
      id v6 = (id *)MEMORY[0x1E4F8C6B0];
      goto LABEL_15;
    case 16:
      id v6 = (id *)MEMORY[0x1E4F8C6A8];
LABEL_15:
      id v5 = *v6;
      break;
    default:
      break;
  }

  return v5;
}

+ (id)_notificationEnablementKeyForNotificationType:(int64_t)a3
{
  if (unint64_t)a3 <= 0xE && ((0x567Fu >> a3))
  {
    id v4 = **((id **)&unk_1E586EFB0 + a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)_soundForNotification:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F445C0];
  id v4 = a3;
  id v5 = [v3 soundWithAlertType:9];
  uint64_t v6 = [v4 notificationType];

  int v7 = (void *)MEMORY[0x1E4FAF620];
  if (v6 != 6) {
    int v7 = (void *)MEMORY[0x1E4FAF628];
  }
  [v5 setAlertTopic:*v7];
  return v5;
}

+ (id)_sharedLibraryParticipantAssetTrashNotificationCategory
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F445D8];
  uint64_t v3 = *MEMORY[0x1E4F8CB80];
  id v4 = PLServicesSharedLibraryLocalizedFrameworkString();
  id v5 = [v2 actionWithIdentifier:v3 title:v4 options:0];

  uint64_t v6 = (void *)MEMORY[0x1E4F44600];
  uint64_t v7 = *MEMORY[0x1E4F8C6B0];
  v11[0] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [v6 categoryWithIdentifier:v7 actions:v8 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];

  return v9;
}

+ (id)_sharedLibrarySuggestionsCategory
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F445D8];
  uint64_t v3 = *MEMORY[0x1E4F8CB80];
  id v4 = PLServicesSharedLibraryLocalizedFrameworkString();
  id v5 = [v2 actionWithIdentifier:v3 title:v4 options:0];

  uint64_t v6 = (void *)MEMORY[0x1E4F445D8];
  uint64_t v7 = *MEMORY[0x1E4F8C670];
  id v8 = PLServicesSharedLibraryLocalizedFrameworkString();
  id v9 = [v6 actionWithIdentifier:v7 title:v8 options:0];

  uint64_t v10 = (void *)MEMORY[0x1E4F44600];
  uint64_t v11 = *MEMORY[0x1E4F8C6B8];
  v15[0] = v5;
  v15[1] = v9;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  unint64_t v13 = [v10 categoryWithIdentifier:v11 actions:v12 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];

  return v13;
}

+ (id)_readyToViewInvitationCMMCategory
{
  return (id)[MEMORY[0x1E4F44600] categoryWithIdentifier:*MEMORY[0x1E4F8C698] actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];
}

+ (id)_expiringCMMCategory
{
  return (id)[MEMORY[0x1E4F44600] categoryWithIdentifier:*MEMORY[0x1E4F8C678] actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];
}

+ (id)_invitationAcceptedCategory
{
  return (id)[MEMORY[0x1E4F44600] categoryWithIdentifier:*MEMORY[0x1E4F8C680] actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];
}

+ (id)_invitationsCategoryWithJunkAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = (id)*MEMORY[0x1E4F8C688];
  if (v3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F445D8];
    uint64_t v7 = *MEMORY[0x1E4F8C660];
    id v8 = PLServicesLocalizedFrameworkStringForAssetsd();
    id v9 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"xmark.bin"];
    uint64_t v10 = [v6 actionWithIdentifier:v7 title:v8 options:0 icon:v9];

    [v4 addObject:v10];
    id v11 = (id)*MEMORY[0x1E4F8C690];

    id v5 = v11;
  }
  int v12 = (void *)MEMORY[0x1E4F445D8];
  uint64_t v13 = *MEMORY[0x1E4F8C600];
  __int16 v14 = PLServicesLocalizedFrameworkStringForAssetsd();
  id v15 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"checkmark.circle"];
  __int16 v16 = [v12 actionWithIdentifier:v13 title:v14 options:0 icon:v15];

  [v4 addObject:v16];
  id v17 = (void *)MEMORY[0x1E4F445D8];
  uint64_t v18 = *MEMORY[0x1E4F8C658];
  uint64_t v19 = PLServicesLocalizedFrameworkStringForAssetsd();
  __int16 v20 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"xmark.circle"];
  uint64_t v21 = [v17 actionWithIdentifier:v18 title:v19 options:0 icon:v20];

  [v4 addObject:v21];
  uint64_t v22 = [MEMORY[0x1E4F44600] categoryWithIdentifier:v5 actions:v4 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];

  return v22;
}

+ (id)_updatesCommentedCategory
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F44660];
  uint64_t v3 = *MEMORY[0x1E4F8C608];
  id v4 = PLServicesLocalizedFrameworkStringForAssetsd();
  id v5 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"bubble.left"];
  uint64_t v6 = PLServicesLocalizedFrameworkStringForAssetsd();
  uint64_t v7 = [v2 actionWithIdentifier:v3 title:v4 options:0 icon:v5 textInputButtonTitle:v6 textInputPlaceholder:&stru_1EEB2EB80];

  id v8 = (void *)MEMORY[0x1E4F44600];
  uint64_t v9 = *MEMORY[0x1E4F8C6C8];
  v13[0] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v11 = [v8 categoryWithIdentifier:v9 actions:v10 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];

  return v11;
}

+ (id)_updatesLikedCategory
{
  return (id)[MEMORY[0x1E4F44600] categoryWithIdentifier:*MEMORY[0x1E4F8C6D8] actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];
}

+ (id)_updatesCategory
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F445D8];
  uint64_t v3 = *MEMORY[0x1E4F8C668];
  id v4 = PLServicesLocalizedFrameworkStringForAssetsd();
  id v5 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"hand.thumbsup"];
  uint64_t v6 = [v2 actionWithIdentifier:v3 title:v4 options:0 icon:v5];

  uint64_t v7 = (void *)MEMORY[0x1E4F44660];
  uint64_t v8 = *MEMORY[0x1E4F8C608];
  uint64_t v9 = PLServicesLocalizedFrameworkStringForAssetsd();
  uint64_t v10 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"bubble.left"];
  id v11 = PLServicesLocalizedFrameworkStringForAssetsd();
  int v12 = [v7 actionWithIdentifier:v8 title:v9 options:0 icon:v10 textInputButtonTitle:v11 textInputPlaceholder:&stru_1EEB2EB80];

  v16[0] = v6;
  v16[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  __int16 v14 = [MEMORY[0x1E4F44600] categoryWithIdentifier:*MEMORY[0x1E4F8C6C0] actions:v13 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];

  return v14;
}

+ (id)_UNNotificationInitialize
{
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.mobileslideshow"];
  __int16 v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = [(id)objc_opt_class() _updatesCategory];
  id v2 = [(id)objc_opt_class() _updatesLikedCategory];
  uint64_t v3 = [(id)objc_opt_class() _updatesCommentedCategory];
  id v4 = [(id)objc_opt_class() _invitationsCategoryWithJunkAction:0];
  id v5 = [(id)objc_opt_class() _invitationsCategoryWithJunkAction:1];
  uint64_t v6 = [(id)objc_opt_class() _invitationAcceptedCategory];
  uint64_t v7 = [(id)objc_opt_class() _expiringCMMCategory];
  uint64_t v8 = [(id)objc_opt_class() _readyToViewInvitationCMMCategory];
  uint64_t v9 = [(id)objc_opt_class() _sharedLibrarySuggestionsCategory];
  uint64_t v10 = [(id)objc_opt_class() _sharedLibraryParticipantAssetTrashNotificationCategory];
  id v11 = objc_msgSend(v14, "setWithObjects:", v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, 0);

  [v15 setNotificationCategories:v11];
  return v15;
}

@end