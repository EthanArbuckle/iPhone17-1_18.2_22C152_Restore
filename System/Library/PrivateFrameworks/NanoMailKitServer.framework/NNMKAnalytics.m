@interface NNMKAnalytics
+ (BOOL)_reportingEnabled;
+ (id)sharedInstance;
- (id)stringForAction:(unint64_t)a3;
- (id)stringForAttachmentType:(unint64_t)a3;
- (id)stringForCompositionSource:(int64_t)a3;
- (id)stringForDeviceMode:(unint64_t)a3;
- (id)stringForDeviceSource:(unint64_t)a3;
- (id)stringForFetchType:(unint64_t)a3;
- (id)stringForMailboxFilterType:(unint64_t)a3;
- (id)stringForMailboxType:(unint64_t)a3;
- (id)stringForMessageType:(unint64_t)a3;
- (id)stringForSendingType:(unint64_t)a3;
- (id)stringForSource:(unint64_t)a3;
- (int64_t)_delayInMSFromDate:(id)a3;
- (void)NNMKSendEventLazyWithKey:(id)a3 metadataBuilder:(id)a4;
- (void)reportAction:(unint64_t)a3 source:(unint64_t)a4;
- (void)reportAppBackgroundRefreshed;
- (void)reportAppLaunched;
- (void)reportAppResumed;
- (void)reportAttachmentDataReceivedWithType:(unint64_t)a3 sizeInBytes:(unint64_t)a4 mode:(unint64_t)a5;
- (void)reportAttachmentDisplayedWithType:(unint64_t)a3 actionable:(BOOL)a4 source:(unint64_t)a5;
- (void)reportAttachmentDownloadFailedInMode:(unint64_t)a3;
- (void)reportAttachmentTappedWithType:(unint64_t)a3 actionable:(BOOL)a4 source:(unint64_t)a5;
- (void)reportCannedReplyUsed:(id)a3 sendingType:(unint64_t)a4;
- (void)reportCellRighSwipeActionChanged:(id)a3;
- (void)reportContentDisplayedForMessageWithId:(id)a3 hasMainAlternative:(BOOL)a4 hasTextAlternative:(BOOL)a5;
- (void)reportContentDownloadFailedInMode:(unint64_t)a3;
- (void)reportContentDownloadedForMessageWithId:(id)a3 textSizeInBytes:(unint64_t)a4 htmlSizeInBytes:(unint64_t)a5 startTime:(id)a6;
- (void)reportContentSyncedForMessageWithId:(id)a3 textSizeInBytes:(unint64_t)a4 htmlSizeInBytes:(unint64_t)a5 fullSyncVersion:(unint64_t)a6 dateSynced:(id)a7;
- (void)reportCredentialsExpired;
- (void)reportDisplayingMessageWithType:(unint64_t)a3 isNotification:(BOOL)a4;
- (void)reportFailedFetchWithType:(unint64_t)a3 inMode:(unint64_t)a4;
- (void)reportFetch:(unint64_t)a3 inMode:(unint64_t)a4 accountType:(id)a5;
- (void)reportFullSyncRequestedFromDevice:(unint64_t)a3 corruptionDetected:(BOOL)a4 migrationRelated:(BOOL)a5 idsFailureRelated:(BOOL)a6 fullSyncVersionMatchRelated:(BOOL)a7;
- (void)reportHaltSyncRequestedFromSource:(unint64_t)a3;
- (void)reportMailboxSelectionChanged:(id)a3 source:(unint64_t)a4;
- (void)reportMessageDeletionReceivedForMessageWithId:(id)a3 fullSyncVersion:(unint64_t)a4 dateSynced:(id)a5;
- (void)reportMessageDeliveryDurationWithStartDate:(id)a3 inMode:(unint64_t)a4;
- (void)reportMessageDeliveryFailedInMode:(unint64_t)a3;
- (void)reportMessageReceivedWithId:(id)a3 willGenerateNotification:(BOOL)a4 fullSyncVersion:(unint64_t)a5 dateSynced:(id)a6;
- (void)reportMessageSentFrom:(int64_t)a3 sendingType:(unint64_t)a4 attachmentCount:(unint64_t)a5 sizeInBytes:(unint64_t)a6;
- (void)reportMessageUpdateReceivedForMessageWithId:(id)a3 fullSyncVersion:(unint64_t)a4 dateSynced:(id)a5;
- (void)reportMoreMessagesReceivedConversationSpecific:(BOOL)a3 fullSyncVersion:(unint64_t)a4 dateSynced:(id)a5;
- (void)reportNotificationReceivedInMode:(unint64_t)a3 accountType:(id)a4;
- (void)reportNotificationReceivedInMode:(unint64_t)a3 isPCC:(BOOL)a4 accountType:(id)a5;
- (void)reportOpenedMailboxWithFilter:(id)a3 mailboxType:(unint64_t)a4 accountType:(id)a5;
- (void)reportOriginalMessageContentSizeInBytes:(unint64_t)a3 source:(unint64_t)a4;
- (void)reportReachedActionButtonsWithSource:(unint64_t)a3;
- (void)reportRenderedNotificationUsingLocalContent:(BOOL)a3 mailboxSynced:(BOOL)a4 messageSynced:(BOOL)a5 contentDownloaded:(BOOL)a6;
- (void)reportSubscribedToNotificationForAccountType:(id)a3 isPCC:(BOOL)a4;
- (void)reportThreadViewedWithMessageCount:(int64_t)a3;
- (void)reportWebKitLinkTapped;
- (void)reportWebKitRenderingProcessCrash;
@end

@implementation NNMKAnalytics

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)_instance;
  return v2;
}

uint64_t __31__NNMKAnalytics_sharedInstance__block_invoke()
{
  _instance = objc_alloc_init(NNMKAnalytics);
  return MEMORY[0x270F9A758]();
}

- (void)reportFetch:(unint64_t)a3 inMode:(unint64_t)a4 accountType:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__NNMKAnalytics_reportFetch_inMode_accountType___block_invoke;
  v10[3] = &unk_264E99B10;
  unint64_t v12 = a3;
  unint64_t v13 = a4;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.fetch" metadataBuilder:v10];
}

id __48__NNMKAnalytics_reportFetch_inMode_accountType___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"type";
  v2 = [*(id *)(a1 + 32) stringForFetchType:*(void *)(a1 + 48)];
  v9[0] = v2;
  v8[1] = @"mode";
  uint64_t v3 = [*(id *)(a1 + 32) stringForDeviceMode:*(void *)(a1 + 56)];
  v4 = (void *)v3;
  v8[2] = @"accountType";
  v5 = *(__CFString **)(a1 + 40);
  if (!v5) {
    v5 = @"unknown";
  }
  v9[1] = v3;
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (void)reportFailedFetchWithType:(unint64_t)a3 inMode:(unint64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__NNMKAnalytics_reportFailedFetchWithType_inMode___block_invoke;
  v4[3] = &unk_264E99B38;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.fetch.failure" metadataBuilder:v4];
}

id __50__NNMKAnalytics_reportFailedFetchWithType_inMode___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"type";
  v2 = [*(id *)(a1 + 32) stringForFetchType:*(void *)(a1 + 40)];
  v6[1] = @"mode";
  v7[0] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) stringForDeviceMode:*(void *)(a1 + 48)];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportMessageReceivedWithId:(id)a3 willGenerateNotification:(BOOL)a4 fullSyncVersion:(unint64_t)a5 dateSynced:(id)a6
{
  id v10 = a3;
  int64_t v11 = [(NNMKAnalytics *)self _delayInMSFromDate:a6];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __97__NNMKAnalytics_reportMessageReceivedWithId_willGenerateNotification_fullSyncVersion_dateSynced___block_invoke;
  v13[3] = &unk_264E99B60;
  id v14 = v10;
  int64_t v15 = v11;
  BOOL v17 = a4;
  unint64_t v16 = a5;
  id v12 = v10;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.messageReceived" metadataBuilder:v13];
}

id __97__NNMKAnalytics_reportMessageReceivedWithId_willGenerateNotification_fullSyncVersion_dateSynced___block_invoke(uint64_t a1)
{
  void v9[4] = *MEMORY[0x263EF8340];
  v8[0] = @"delay";
  v2 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = @"messageId";
  v8[2] = @"willGenerateNotification";
  v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v9[2] = v4;
  void v8[3] = @"fullSyncVersion";
  v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v9[3] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)reportMoreMessagesReceivedConversationSpecific:(BOOL)a3 fullSyncVersion:(unint64_t)a4 dateSynced:(id)a5
{
  int64_t v8 = [(NNMKAnalytics *)self _delayInMSFromDate:a5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91__NNMKAnalytics_reportMoreMessagesReceivedConversationSpecific_fullSyncVersion_dateSynced___block_invoke;
  v9[3] = &__block_descriptor_49_e19___NSDictionary_8__0l;
  BOOL v10 = a3;
  void v9[4] = v8;
  void v9[5] = a4;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.moreMessagesReceived" metadataBuilder:v9];
}

id __91__NNMKAnalytics_reportMoreMessagesReceivedConversationSpecific_fullSyncVersion_dateSynced___block_invoke(uint64_t a1)
{
  void v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"forConversation";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v8[0] = v2;
  v7[1] = @"delay";
  uint64_t v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 32)];
  v8[1] = v3;
  v7[2] = @"fullSyncVersion";
  v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v8[2] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)reportMessageUpdateReceivedForMessageWithId:(id)a3 fullSyncVersion:(unint64_t)a4 dateSynced:(id)a5
{
  id v8 = a3;
  int64_t v9 = [(NNMKAnalytics *)self _delayInMSFromDate:a5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__NNMKAnalytics_reportMessageUpdateReceivedForMessageWithId_fullSyncVersion_dateSynced___block_invoke;
  v11[3] = &unk_264E99B38;
  id v12 = v8;
  int64_t v13 = v9;
  unint64_t v14 = a4;
  id v10 = v8;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.messageUpdated" metadataBuilder:v11];
}

id __88__NNMKAnalytics_reportMessageUpdateReceivedForMessageWithId_fullSyncVersion_dateSynced___block_invoke(void *a1)
{
  void v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"delay";
  v2 = [NSNumber numberWithLongLong:a1[5]];
  uint64_t v3 = a1[4];
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"messageId";
  v7[2] = @"fullSyncVersion";
  v4 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v8[2] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)reportMessageDeletionReceivedForMessageWithId:(id)a3 fullSyncVersion:(unint64_t)a4 dateSynced:(id)a5
{
  id v8 = a3;
  int64_t v9 = [(NNMKAnalytics *)self _delayInMSFromDate:a5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__NNMKAnalytics_reportMessageDeletionReceivedForMessageWithId_fullSyncVersion_dateSynced___block_invoke;
  v11[3] = &unk_264E99B38;
  id v12 = v8;
  int64_t v13 = v9;
  unint64_t v14 = a4;
  id v10 = v8;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.messageDeleted" metadataBuilder:v11];
}

id __90__NNMKAnalytics_reportMessageDeletionReceivedForMessageWithId_fullSyncVersion_dateSynced___block_invoke(void *a1)
{
  void v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"delay";
  v2 = [NSNumber numberWithLongLong:a1[5]];
  uint64_t v3 = a1[4];
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"messageId";
  v7[2] = @"fullSyncVersion";
  v4 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v8[2] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)reportOpenedMailboxWithFilter:(id)a3 mailboxType:(unint64_t)a4 accountType:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__NNMKAnalytics_reportOpenedMailboxWithFilter_mailboxType_accountType___block_invoke;
  v12[3] = &unk_264E99BA8;
  id v13 = v8;
  unint64_t v14 = self;
  id v15 = v9;
  unint64_t v16 = a4;
  id v10 = v9;
  id v11 = v8;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.Mailbox.Displayed" metadataBuilder:v12];
}

id __71__NNMKAnalytics_reportOpenedMailboxWithFilter_mailboxType_accountType___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  uint64_t v3 = NSNumber;
  v4 = [*(id *)(a1 + 32) mailboxIds];
  v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  [v2 setObject:v5 forKeyedSubscript:@"size"];

  v6 = [*(id *)(a1 + 32) mailboxIds];
  if ((unint64_t)[v6 count] > 1) {
    objc_msgSend(*(id *)(a1 + 40), "stringForMailboxFilterType:", objc_msgSend(*(id *)(a1 + 32), "mailboxType"));
  }
  else {
  v7 = [*(id *)(a1 + 40) stringForMailboxType:*(void *)(a1 + 56)];
  }
  [v2 setObject:v7 forKeyedSubscript:@"type"];

  if ([*(id *)(a1 + 48) length])
  {
    if (*(void *)(a1 + 48)) {
      id v8 = *(__CFString **)(a1 + 48);
    }
    else {
      id v8 = @"unknown";
    }
    [v2 setObject:v8 forKeyedSubscript:@"accountType"];
  }
  return v2;
}

- (void)reportThreadViewedWithMessageCount:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__NNMKAnalytics_reportThreadViewedWithMessageCount___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.Thread.Displayed" metadataBuilder:v3];
}

id __52__NNMKAnalytics_reportThreadViewedWithMessageCount___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"size";
  v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportOriginalMessageContentSizeInBytes:(unint64_t)a3 source:(unint64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__NNMKAnalytics_reportOriginalMessageContentSizeInBytes_source___block_invoke;
  v4[3] = &unk_264E99B38;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.addedContent" metadataBuilder:v4];
}

id __64__NNMKAnalytics_reportOriginalMessageContentSizeInBytes_source___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"size";
  v2 = [NSNumber numberWithDouble:(double)*(unint64_t *)(a1 + 40) / 1000.0];
  v6[1] = @"source";
  v7[0] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) stringForDeviceSource:*(void *)(a1 + 48)];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportContentSyncedForMessageWithId:(id)a3 textSizeInBytes:(unint64_t)a4 htmlSizeInBytes:(unint64_t)a5 fullSyncVersion:(unint64_t)a6 dateSynced:(id)a7
{
  id v12 = a3;
  int64_t v13 = [(NNMKAnalytics *)self _delayInMSFromDate:a7];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __112__NNMKAnalytics_reportContentSyncedForMessageWithId_textSizeInBytes_htmlSizeInBytes_fullSyncVersion_dateSynced___block_invoke;
  v15[3] = &unk_264E99BF0;
  unint64_t v18 = a5;
  int64_t v19 = v13;
  id v16 = v12;
  unint64_t v17 = a4;
  unint64_t v20 = a6;
  id v14 = v12;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.contentReceived" metadataBuilder:v15];
}

id __112__NNMKAnalytics_reportContentSyncedForMessageWithId_textSizeInBytes_htmlSizeInBytes_fullSyncVersion_dateSynced___block_invoke(void *a1)
{
  void v10[5] = *MEMORY[0x263EF8340];
  v9[0] = @"textSize";
  v2 = [NSNumber numberWithDouble:(double)(unint64_t)a1[5] / 1000.0];
  v10[0] = v2;
  v9[1] = @"htmlSize";
  uint64_t v3 = [NSNumber numberWithDouble:(double)(unint64_t)a1[6] / 1000.0];
  v10[1] = v3;
  v9[2] = @"delay";
  v4 = [NSNumber numberWithLongLong:a1[7]];
  uint64_t v5 = a1[4];
  v10[2] = v4;
  v10[3] = v5;
  v9[3] = @"messageId";
  void v9[4] = @"fullSyncVersion";
  v6 = [NSNumber numberWithUnsignedInteger:a1[8]];
  v10[4] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (void)reportContentDownloadedForMessageWithId:(id)a3 textSizeInBytes:(unint64_t)a4 htmlSizeInBytes:(unint64_t)a5 startTime:(id)a6
{
  id v10 = a3;
  int64_t v11 = [(NNMKAnalytics *)self _delayInMSFromDate:a6];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __99__NNMKAnalytics_reportContentDownloadedForMessageWithId_textSizeInBytes_htmlSizeInBytes_startTime___block_invoke;
  v13[3] = &unk_264E99C18;
  unint64_t v16 = a5;
  int64_t v17 = v11;
  id v14 = v10;
  unint64_t v15 = a4;
  id v12 = v10;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.contentDownloaded" metadataBuilder:v13];
}

id __99__NNMKAnalytics_reportContentDownloadedForMessageWithId_textSizeInBytes_htmlSizeInBytes_startTime___block_invoke(void *a1)
{
  void v9[4] = *MEMORY[0x263EF8340];
  v8[0] = @"textSize";
  v2 = [NSNumber numberWithDouble:(double)(unint64_t)a1[5] / 1000.0];
  v9[0] = v2;
  v8[1] = @"htmlSize";
  uint64_t v3 = [NSNumber numberWithDouble:(double)(unint64_t)a1[6] / 1000.0];
  v9[1] = v3;
  v8[2] = @"duration";
  v4 = [NSNumber numberWithLongLong:a1[7]];
  void v8[3] = @"messageId";
  uint64_t v5 = a1[4];
  v9[2] = v4;
  v9[3] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)reportContentDownloadFailedInMode:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__NNMKAnalytics_reportContentDownloadFailedInMode___block_invoke;
  v3[3] = &unk_264E99C40;
  v3[4] = self;
  void v3[5] = a3;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.contentDownload.failure" metadataBuilder:v3];
}

id __51__NNMKAnalytics_reportContentDownloadFailedInMode___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"mode";
  v1 = [*(id *)(a1 + 32) stringForDeviceMode:*(void *)(a1 + 40)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportAttachmentDataReceivedWithType:(unint64_t)a3 sizeInBytes:(unint64_t)a4 mode:(unint64_t)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __71__NNMKAnalytics_reportAttachmentDataReceivedWithType_sizeInBytes_mode___block_invoke;
  v5[3] = &unk_264E99C18;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a3;
  v5[7] = a5;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.attachmentReceived" metadataBuilder:v5];
}

id __71__NNMKAnalytics_reportAttachmentDataReceivedWithType_sizeInBytes_mode___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  uint64_t v3 = [NSNumber numberWithDouble:(double)*(unint64_t *)(a1 + 40) / 1000.0];
  [v2 setObject:v3 forKeyedSubscript:@"size"];

  v4 = [*(id *)(a1 + 32) stringForAttachmentType:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"type"];

  uint64_t v5 = [*(id *)(a1 + 32) stringForDeviceMode:*(void *)(a1 + 56)];
  [v2 setObject:v5 forKeyedSubscript:@"mode"];

  return v2;
}

- (void)reportAttachmentDisplayedWithType:(unint64_t)a3 actionable:(BOOL)a4 source:(unint64_t)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __69__NNMKAnalytics_reportAttachmentDisplayedWithType_actionable_source___block_invoke;
  v5[3] = &unk_264E99B60;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a5;
  BOOL v6 = a4;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.attachmentDisplayed" metadataBuilder:v5];
}

id __69__NNMKAnalytics_reportAttachmentDisplayedWithType_actionable_source___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  uint64_t v3 = [*(id *)(a1 + 32) stringForAttachmentType:*(void *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"type"];

  v4 = [*(id *)(a1 + 32) stringForSource:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"source"];

  uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [v2 setObject:v5 forKeyedSubscript:@"actionable"];

  return v2;
}

- (void)reportAttachmentTappedWithType:(unint64_t)a3 actionable:(BOOL)a4 source:(unint64_t)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __66__NNMKAnalytics_reportAttachmentTappedWithType_actionable_source___block_invoke;
  v5[3] = &unk_264E99B60;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a5;
  BOOL v6 = a4;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.attachmentTapped" metadataBuilder:v5];
}

id __66__NNMKAnalytics_reportAttachmentTappedWithType_actionable_source___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  uint64_t v3 = [*(id *)(a1 + 32) stringForAttachmentType:*(void *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"type"];

  v4 = [*(id *)(a1 + 32) stringForSource:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"source"];

  uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [v2 setObject:v5 forKeyedSubscript:@"actionable"];

  return v2;
}

- (void)reportAttachmentDownloadFailedInMode:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__NNMKAnalytics_reportAttachmentDownloadFailedInMode___block_invoke;
  v3[3] = &unk_264E99C40;
  v3[4] = self;
  void v3[5] = a3;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.attachmentDownload.failure" metadataBuilder:v3];
}

id __54__NNMKAnalytics_reportAttachmentDownloadFailedInMode___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"mode";
  v1 = [*(id *)(a1 + 32) stringForDeviceMode:*(void *)(a1 + 40)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportReachedActionButtonsWithSource:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__NNMKAnalytics_reportReachedActionButtonsWithSource___block_invoke;
  v3[3] = &unk_264E99C40;
  v3[4] = self;
  void v3[5] = a3;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.action.reached" metadataBuilder:v3];
}

id __54__NNMKAnalytics_reportReachedActionButtonsWithSource___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"source";
  v1 = [*(id *)(a1 + 32) stringForSource:*(void *)(a1 + 40)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportAppLaunched
{
}

uint64_t __34__NNMKAnalytics_reportAppLaunched__block_invoke()
{
  return 0;
}

- (void)reportAppResumed
{
}

uint64_t __33__NNMKAnalytics_reportAppResumed__block_invoke()
{
  return 0;
}

- (void)reportAppBackgroundRefreshed
{
}

uint64_t __45__NNMKAnalytics_reportAppBackgroundRefreshed__block_invoke()
{
  return 0;
}

- (void)reportNotificationReceivedInMode:(unint64_t)a3 accountType:(id)a4
{
}

- (void)reportNotificationReceivedInMode:(unint64_t)a3 isPCC:(BOOL)a4 accountType:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__NNMKAnalytics_reportNotificationReceivedInMode_isPCC_accountType___block_invoke;
  v10[3] = &unk_264E99C88;
  id v11 = v8;
  unint64_t v12 = a3;
  BOOL v13 = a4;
  v10[4] = self;
  id v9 = v8;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.notification.received" metadataBuilder:v10];
}

id __68__NNMKAnalytics_reportNotificationReceivedInMode_isPCC_accountType___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"mode";
  v2 = [*(id *)(a1 + 32) stringForDeviceMode:*(void *)(a1 + 48)];
  v9[0] = v2;
  v8[1] = @"pccNotification";
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v4 = (void *)v3;
  v8[2] = @"accountType";
  uint64_t v5 = *(__CFString **)(a1 + 40);
  if (!v5) {
    uint64_t v5 = @"unknown";
  }
  v9[1] = v3;
  v9[2] = v5;
  BOOL v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (void)reportRenderedNotificationUsingLocalContent:(BOOL)a3 mailboxSynced:(BOOL)a4 messageSynced:(BOOL)a5 contentDownloaded:(BOOL)a6
{
  BOOL v6 = @"forwardedContentNotDownloadedByCompanion";
  if (a6) {
    BOOL v6 = @"forwardedContentNotSynced";
  }
  if (!a5) {
    BOOL v6 = @"forwardedMessageAndContent";
  }
  if (!a4) {
    BOOL v6 = @"mailboxNotSynced";
  }
  if (a3) {
    BOOL v6 = @"realContent";
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __107__NNMKAnalytics_reportRenderedNotificationUsingLocalContent_mailboxSynced_messageSynced_contentDownloaded___block_invoke;
  void v7[3] = &unk_264E99CB0;
  id v8 = v6;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.notificationRendered" metadataBuilder:v7];
}

id __107__NNMKAnalytics_reportRenderedNotificationUsingLocalContent_mailboxSynced_messageSynced_contentDownloaded___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"type";
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)reportSubscribedToNotificationForAccountType:(id)a3 isPCC:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__NNMKAnalytics_reportSubscribedToNotificationForAccountType_isPCC___block_invoke;
  void v8[3] = &unk_264E99CD8;
  BOOL v10 = a4;
  id v9 = v6;
  id v7 = v6;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.notification.subscribed" metadataBuilder:v8];
}

id __68__NNMKAnalytics_reportSubscribedToNotificationForAccountType_isPCC___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"pccNotification";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = @"accountType";
  v7[0] = v2;
  uint64_t v3 = *(__CFString **)(a1 + 32);
  if (!v3) {
    uint64_t v3 = @"unknown";
  }
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportFullSyncRequestedFromDevice:(unint64_t)a3 corruptionDetected:(BOOL)a4 migrationRelated:(BOOL)a5 idsFailureRelated:(BOOL)a6 fullSyncVersionMatchRelated:(BOOL)a7
{
  id v7 = @"none";
  if (a7) {
    id v7 = @"versionMatch";
  }
  if (a6) {
    id v7 = @"IDSFailure";
  }
  if (a5) {
    id v7 = @"migration";
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __133__NNMKAnalytics_reportFullSyncRequestedFromDevice_corruptionDetected_migrationRelated_idsFailureRelated_fullSyncVersionMatchRelated___block_invoke;
  void v8[3] = &unk_264E99D00;
  if (a4) {
    id v7 = @"corruption";
  }
  id v9 = v7;
  BOOL v10 = self;
  unint64_t v11 = a3;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.fullSync" metadataBuilder:v8];
}

id __133__NNMKAnalytics_reportFullSyncRequestedFromDevice_corruptionDetected_migrationRelated_idsFailureRelated_fullSyncVersionMatchRelated___block_invoke(void *a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  uint64_t v1 = (void *)a1[5];
  v6[0] = @"reason";
  v6[1] = @"source";
  v7[0] = v2;
  uint64_t v3 = [v1 stringForDeviceSource:a1[6]];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportHaltSyncRequestedFromSource:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__NNMKAnalytics_reportHaltSyncRequestedFromSource___block_invoke;
  v3[3] = &unk_264E99C40;
  v3[4] = self;
  void v3[5] = a3;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.haltSyncRequested" metadataBuilder:v3];
}

id __51__NNMKAnalytics_reportHaltSyncRequestedFromSource___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"source";
  uint64_t v1 = [*(id *)(a1 + 32) stringForDeviceSource:*(void *)(a1 + 40)];
  v5[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportContentDisplayedForMessageWithId:(id)a3 hasMainAlternative:(BOOL)a4 hasTextAlternative:(BOOL)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __94__NNMKAnalytics_reportContentDisplayedForMessageWithId_hasMainAlternative_hasTextAlternative___block_invoke;
  v5[3] = &__block_descriptor_34_e19___NSDictionary_8__0l;
  BOOL v6 = a4;
  BOOL v7 = a5;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.Content.Text.Rendered" metadataBuilder:v5];
}

id __94__NNMKAnalytics_reportContentDisplayedForMessageWithId_hasMainAlternative_hasTextAlternative___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v1 = @"main";
  }
  else if (*(unsigned char *)(a1 + 33))
  {
    uint64_t v1 = @"text";
  }
  else
  {
    uint64_t v1 = @"none";
  }
  v4 = @"alternativeType";
  v5[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)reportDisplayingMessageWithType:(unint64_t)a3 isNotification:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__NNMKAnalytics_reportDisplayingMessageWithType_isNotification___block_invoke;
  v4[3] = &unk_264E99D48;
  v4[4] = self;
  v4[5] = a3;
  BOOL v5 = a4;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.Content.Displayed" metadataBuilder:v4];
}

id __64__NNMKAnalytics_reportDisplayingMessageWithType_isNotification___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"type";
  uint64_t v2 = [*(id *)(a1 + 32) stringForMessageType:*(void *)(a1 + 40)];
  v6[1] = @"source";
  v7[0] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) stringForSource:*(unsigned __int8 *)(a1 + 48)];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportWebKitRenderingProcessCrash
{
}

uint64_t __50__NNMKAnalytics_reportWebKitRenderingProcessCrash__block_invoke()
{
  return 0;
}

- (void)reportMailboxSelectionChanged:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__NNMKAnalytics_reportMailboxSelectionChanged_source___block_invoke;
  void v8[3] = &unk_264E99D00;
  id v9 = v6;
  unint64_t v10 = a4;
  void v8[4] = self;
  id v7 = v6;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.mailboxSelectionChanged" metadataBuilder:v8];
}

id __54__NNMKAnalytics_reportMailboxSelectionChanged_source___block_invoke(uint64_t a1)
{
  v33[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF9A0]);
  v32[0] = @"source";
  uint64_t v3 = [*(id *)(a1 + 32) stringForDeviceSource:*(void *)(a1 + 48)];
  v32[1] = @"mailboxCount";
  v33[0] = v3;
  v4 = NSNumber;
  BOOL v5 = [*(id *)(a1 + 40) allMailboxesSyncEnabled];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v33[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  id v8 = (void *)[v2 initWithDictionary:v7];

  id v9 = [*(id *)(a1 + 40) aggregatedMailboxes];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 1));
    [v8 setObject:v11 forKeyedSubscript:@"allInboxes"];

    unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 2));
    [v8 setObject:v12 forKeyedSubscript:@"vip"];

    BOOL v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 4));
    [v8 setObject:v13 forKeyedSubscript:@"flagged"];

    id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 8));
    [v8 setObject:v14 forKeyedSubscript:@"unread"];

    unint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 16));
    [v8 setObject:v15 forKeyedSubscript:@"toOrCC"];

    unint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 32));
    [v8 setObject:v16 forKeyedSubscript:@"importantThreads"];

    int64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 64));
    [v8 setObject:v17 forKeyedSubscript:@"today"];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    unint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "mailboxesWithAllMessagesSyncEnabled", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = objc_msgSend(*(id *)(a1 + 32), "stringForMailboxType:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "type"));
          v24 = [v8 objectForKeyedSubscript:v23];
          v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v24, "intValue") - 1);
          [v8 setObject:v25 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);
    }
  }
  return v8;
}

- (void)reportAction:(unint64_t)a3 source:(unint64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__NNMKAnalytics_reportAction_source___block_invoke;
  v4[3] = &unk_264E99B38;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.action" metadataBuilder:v4];
}

id __37__NNMKAnalytics_reportAction_source___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"type";
  id v2 = [*(id *)(a1 + 32) stringForAction:*(void *)(a1 + 40)];
  v6[1] = @"source";
  v7[0] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) stringForSource:*(void *)(a1 + 48)];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportCellRighSwipeActionChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __50__NNMKAnalytics_reportCellRighSwipeActionChanged___block_invoke;
  v6[3] = &unk_264E99CB0;
  id v7 = v4;
  id v5 = v4;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.cellSwipe.changed" metadataBuilder:v6];
}

id __50__NNMKAnalytics_reportCellRighSwipeActionChanged___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = @"type";
  v4[1] = @"side";
  v5[0] = v1;
  v5[1] = @"right";
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)reportWebKitLinkTapped
{
}

uint64_t __39__NNMKAnalytics_reportWebKitLinkTapped__block_invoke()
{
  return 0;
}

- (void)reportMessageSentFrom:(int64_t)a3 sendingType:(unint64_t)a4 attachmentCount:(unint64_t)a5 sizeInBytes:(unint64_t)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __79__NNMKAnalytics_reportMessageSentFrom_sendingType_attachmentCount_sizeInBytes___block_invoke;
  v6[3] = &unk_264E99BF0;
  void v6[4] = self;
  v6[5] = a4;
  v6[6] = a6;
  v6[7] = a3;
  v6[8] = a5;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.composedMessage" metadataBuilder:v6];
}

id __79__NNMKAnalytics_reportMessageSentFrom_sendingType_attachmentCount_sizeInBytes___block_invoke(uint64_t a1)
{
  void v9[4] = *MEMORY[0x263EF8340];
  v8[0] = @"type";
  id v2 = [*(id *)(a1 + 32) stringForSendingType:*(void *)(a1 + 40)];
  v9[0] = v2;
  v8[1] = @"size";
  uint64_t v3 = [NSNumber numberWithDouble:(double)*(unint64_t *)(a1 + 48) / 1000.0];
  v9[1] = v3;
  v8[2] = @"source";
  id v4 = [*(id *)(a1 + 32) stringForCompositionSource:*(void *)(a1 + 56)];
  v9[2] = v4;
  void v8[3] = @"includesAttachments";
  id v5 = [NSNumber numberWithInt:*(void *)(a1 + 64) != 0];
  v9[3] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)reportMessageDeliveryFailedInMode:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__NNMKAnalytics_reportMessageDeliveryFailedInMode___block_invoke;
  v3[3] = &unk_264E99C40;
  v3[4] = self;
  void v3[5] = a3;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.composedMessage.failure" metadataBuilder:v3];
}

id __51__NNMKAnalytics_reportMessageDeliveryFailedInMode___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"mode";
  uint64_t v1 = [*(id *)(a1 + 32) stringForDeviceMode:*(void *)(a1 + 40)];
  v5[0] = v1;
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportMessageDeliveryDurationWithStartDate:(id)a3 inMode:(unint64_t)a4
{
  int64_t v6 = [(NNMKAnalytics *)self _delayInMSFromDate:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__NNMKAnalytics_reportMessageDeliveryDurationWithStartDate_inMode___block_invoke;
  void v7[3] = &unk_264E99B38;
  void v7[4] = self;
  v7[5] = v6;
  v7[6] = a4;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.messageDelivery.duration" metadataBuilder:v7];
}

id __67__NNMKAnalytics_reportMessageDeliveryDurationWithStartDate_inMode___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"duration";
  id v2 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  v6[1] = @"mode";
  v7[0] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) stringForDeviceMode:*(void *)(a1 + 48)];
  v7[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportCannedReplyUsed:(id)a3 sendingType:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__NNMKAnalytics_reportCannedReplyUsed_sendingType___block_invoke;
  void v8[3] = &unk_264E99D00;
  id v9 = v6;
  unint64_t v10 = a4;
  void v8[4] = self;
  id v7 = v6;
  [(NNMKAnalytics *)self NNMKSendEventLazyWithKey:@"com.apple.NanoMail.composedMessage.cannedReply" metadataBuilder:v8];
}

id __51__NNMKAnalytics_reportCannedReplyUsed_sendingType___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"type";
  id v2 = [*(id *)(a1 + 32) stringForSendingType:*(void *)(a1 + 48)];
  v5[1] = @"value";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 40);
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (void)reportCredentialsExpired
{
}

uint64_t __41__NNMKAnalytics_reportCredentialsExpired__block_invoke()
{
  return 0;
}

+ (BOOL)_reportingEnabled
{
  return 1;
}

- (void)NNMKSendEventLazyWithKey:(id)a3 metadataBuilder:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

uint64_t __58__NNMKAnalytics_NNMKSendEventLazyWithKey_metadataBuilder___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_delayInMSFromDate:(id)a3
{
  [a3 timeIntervalSinceNow];
  double v4 = v3 * -1000.0;
  if ((unint64_t)(uint64_t)v4 <= 0xEA60) {
    return (uint64_t)v4;
  }
  else {
    return 0;
  }
}

- (id)stringForAction:(unint64_t)a3
{
  if (a3 - 1 > 0xA) {
    return @"read";
  }
  else {
    return off_264E99D90[a3 - 1];
  }
}

- (id)stringForDeviceSource:(unint64_t)a3
{
  if (a3) {
    return @"watch";
  }
  else {
    return @"phone";
  }
}

- (id)stringForSource:(unint64_t)a3
{
  double v3 = @"messageView";
  if (a3 == 1) {
    double v3 = @"notification";
  }
  if (a3 == 2) {
    return @"swipeAction";
  }
  else {
    return v3;
  }
}

- (id)stringForMailboxType:(unint64_t)a3
{
  if (a3 - 1 > 8) {
    return @"none";
  }
  else {
    return off_264E99DE8[a3 - 1];
  }
}

- (id)stringForMailboxFilterType:(unint64_t)a3
{
  id result = @"unknown";
  if ((uint64_t)a3 > 15)
  {
    double v4 = @"importantThreads";
    id v5 = @"today";
    if (a3 != 64) {
      id v5 = @"unknown";
    }
    if (a3 != 32) {
      double v4 = v5;
    }
    if (a3 == 16) {
      return @"toOrCC";
    }
    else {
      return v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        id result = @"allInboxes";
        break;
      case 2uLL:
        id result = @"vip";
        break;
      case 4uLL:
        id result = @"flagged";
        break;
      case 8uLL:
        id result = @"unread";
        break;
      default:
        return result;
    }
  }
  return result;
}

- (id)stringForSendingType:(unint64_t)a3
{
  double v3 = @"reply";
  if (a3 == 1) {
    double v3 = @"compose";
  }
  if (a3 == 4) {
    return @"forward";
  }
  else {
    return v3;
  }
}

- (id)stringForDeviceMode:(unint64_t)a3
{
  double v3 = @"sync";
  if (a3 == 1) {
    double v3 = @"standalone";
  }
  if (a3 == 2) {
    return @"cloud";
  }
  else {
    return v3;
  }
}

- (id)stringForFetchType:(unint64_t)a3
{
  double v3 = @"manual";
  if (a3 == 1) {
    double v3 = @"resume";
  }
  if (a3 == 2) {
    return @"older";
  }
  else {
    return v3;
  }
}

- (id)stringForMessageType:(unint64_t)a3
{
  if (a3) {
    return @"html";
  }
  else {
    return @"text";
  }
}

- (id)stringForAttachmentType:(unint64_t)a3
{
  if (a3 - 1 > 0x16) {
    return @"unknown";
  }
  else {
    return off_264E99E30[a3 - 1];
  }
}

- (id)stringForCompositionSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"nanoMail";
  }
  else {
    return off_264E99EE8[a3 - 1];
  }
}

@end