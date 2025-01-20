@interface NNMKSyncProvider
+ (BOOL)prepareForSystemAppDeletion:(id *)a3;
- (BOOL)_isConnectedToWatch;
- (BOOL)_isPaired;
- (BOOL)_isUsingCompaionSync;
- (BOOL)_pairedDeviceSupportsMultipleMailboxes;
- (BOOL)_verifyDatabaseOkForFullSyncVersion:(unint64_t)a3;
- (BOOL)_verifyDatabaseOkForFullSyncVersion:(unint64_t)a3 mailbox:(id)a4;
- (BOOL)containsSyncedMailbox:(id)a3;
- (BOOL)fullSyncRecoveredInThisSession;
- (BOOL)isMessageOkForSyncedMailboxes:(id)a3;
- (BOOL)isPaired;
- (BOOL)organizeByThread;
- (BOOL)pairedDeviceSupportsStandaloneMode;
- (BOOL)setupPairedDeviceRegistry;
- (BOOL)syncStateManagerShouldAddFavoriteSubsectionForMailboxId:(id)a3;
- (BOOL)triggeredInitialSyncToRecoverFromSyncVersionMismatch;
- (NNMKAccountsSyncServiceServer)accountsSyncService;
- (NNMKBatchRequestHandler)batchRequestHandler;
- (NNMKDeviceSyncRegistry)pairedDeviceRegistry;
- (NNMKDirectoryProvider)directoryProvider;
- (NNMKFetchesSyncServiceServer)fetchesSyncService;
- (NNMKInitialSyncProgressTracker)initialSyncProgressTracker;
- (NNMKMailboxSelection)mailboxSelection;
- (NNMKMessageContentSyncServiceServer)contentSyncService;
- (NNMKMessagesSyncServiceServer)messagesSyncService;
- (NNMKPairedDeviceInfo)pairedDeviceInfo;
- (NNMKProtectedContentSyncServiceServer)protectedContentSyncService;
- (NNMKProtectedSyncServiceServer)protectedSyncService;
- (NNMKResendScheduler)resendScheduler;
- (NNMKSyncController)syncController;
- (NNMKSyncPersistenceHandler)persistenceHandler;
- (NNMKSyncProvider)initWithDelegate:(id)a3;
- (NNMKSyncProvider)initWithDelegate:(id)a3 syncStateManager:(id)a4 directoryProvider:(id)a5;
- (NNMKSyncProviderDelegate)delegate;
- (NNMKSyncSessionController)sessionController;
- (NNMKSyncStateManager)syncStateManager;
- (NSMutableDictionary)fullSyncTimeoutTimersByMailboxId;
- (OS_dispatch_queue)providerQueue;
- (id)_bbSubsectionIdsForMessage:(id)a3;
- (id)_createDefaultSyncStateManager;
- (id)_handleFetchRequest:(id)a3 shouldResumeSync:(BOOL *)a4;
- (id)_initialSyncForMailbox:(id)a3 messages:(id)a4 shouldUseProtectedChannel:(BOOL)a5;
- (id)_legacy_sendFirstMessages:(id)a3 syncedMailbox:(id)a4 shouldUseProtectedChannel:(BOOL)a5;
- (id)_messageProtobufForMessage:(id)a3;
- (id)_sendFirstMessages:(id)a3 mailboxes:(id)a4 shouldUseProtectedChannel:(BOOL)a5;
- (id)_watchAccounts;
- (id)bulletinFlagsForMessageStatus:(unint64_t)a3 dateReceived:(id)a4 messageWillBeAddedToSyncProvider:(BOOL)a5 mailboxId:(id)a6;
- (id)currentDeviceRegistry;
- (id)requestWatchAccounts;
- (id)syncServiceEndpoints;
- (id)syncedMailboxes;
- (id)watchAccounts;
- (unint64_t)resendScheduler:(id)a3 didRequestNewResendIntervalForPreviousResendInterval:(unint64_t)a4 errorCode:(int64_t)a5;
- (void)_addAttachmentData:(id)a3 forMessageId:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6 mailbox:(id)a7;
- (void)_addMessageContent:(id)a3 forMessage:(id)a4 loadedProtected:(BOOL)a5 mailbox:(id)a6;
- (void)_addMessages:(id)a3 mailbox:(id)a4;
- (void)_addMessages:(id)a3 messagesAreNew:(BOOL)a4 mailbox:(id)a5;
- (void)_cancelFullSyncTimeoutTimerForMailboxId:(id)a3;
- (void)_checkBatchFetchedMessages;
- (void)_checkConnectivityBasedSuspensionTimer:(BOOL)a3;
- (void)_deleteMessagesWithIds:(id)a3 mailbox:(id)a4;
- (void)_fastForwardToFullSyncVersion:(unint64_t)a3;
- (void)_handleDidFailSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4;
- (void)_handleDidPairWithNewDevice;
- (void)_handleDidUnpair;
- (void)_handleFetchRequestFromWatch:(id)a3;
- (void)_handleHaltSyncForMailbox:(id)a3;
- (void)_handleMailboxesDesync;
- (void)_markConversationIdForNotify:(id)a3 messages:(id)a4 includesProtectedMessages:(BOOL)a5 mailbox:(id)a6;
- (void)_markConversationWithId:(id)a3 forState:(unint64_t)a4 include:(BOOL)a5 mailbox:(id)a6;
- (void)_notifyDelegateThatMessagesStatusWereUpdated:(id)a3;
- (void)_replyWithMessagesToResend:(id)a3 includesProtectedMessages:(BOOL)a4 mailbox:(id)a5;
- (void)_replyWithMoreMessages:(id)a3 forConversationWithId:(id)a4 includesProtectedMessages:(BOOL)a5 mailbox:(id)a6;
- (void)_replyWithMoreMessages:(id)a3 forDateReceivedBefore:(id)a4 includesProtectedMessages:(BOOL)a5 mailbox:(id)a6 messagesForSpecialMailbox:(unint64_t)a7;
- (void)_reportMessageContentDownloadFailureForMessageId:(id)a3 mailbox:(id)a4;
- (void)_requestDelegateForAccounts;
- (void)_requestDelegateForContentForMessageIds:(id)a3 highPriority:(BOOL)a4;
- (void)_requestDelegateForContentForMessageWithId:(id)a3 highPriority:(BOOL)a4;
- (void)_requestDelegateForFetchForMailboxes:(id)a3;
- (void)_requestDelegateForFirstMessagesForMailboxes:(id)a3;
- (void)_requestDelegateForMessagesToSendAsFetchResponseForMessageIds:(id)a3;
- (void)_requestDelegateForMoreMessagesBeforeDateReceived:(id)a3 forConversationWithId:(id)a4 mailbox:(id)a5;
- (void)_requestDelegateForMoreMessagesWithMailbox:(id)a3 beforeDate:(id)a4 messagesForspecialMailboxFilterType:(unint64_t)a5;
- (void)_requestDelegateForResendingAccountWithId:(id)a3;
- (void)_requestDelegateForResendingMessagesWithIds:(id)a3;
- (void)_requestDelegateForVIPList:(id)a3;
- (void)_requestDelegateToSendComposedMessage:(id)a3;
- (void)_requestDelegateToStopDownloadingAllMessageElements;
- (void)_requestDelegateToStopDownloadingMessageElementsForMessageWithId:(id)a3;
- (void)_sendStandaloneAccountIdentity:(id)a3 resendInterval:(unint64_t)a4;
- (void)_sendUpdatedMailboxSelection:(unint64_t)a3;
- (void)_sendUpdatedMailboxSelection:(unint64_t)a3 resendInterval:(unint64_t)a4;
- (void)_sendWatchAccountStatusRequest;
- (void)_setPairedDeviceSupportsMultipleMailboxes:(BOOL)a3;
- (void)_shouldHandleForwardForNotification:(id)a3 withCompletion:(id)a4;
- (void)_startFullSyncTimeoutForMailboxId:(id)a3;
- (void)_stopTaks;
- (void)_storeScreenRelatedValues;
- (void)_triggerFullSyncForMailbox:(id)a3;
- (void)_triggerFullSyncForMailboxes:(id)a3;
- (void)_triggerInitialSync;
- (void)_triggerInitialSyncToRecoverFromSyncVersionMismatch;
- (void)_triggerInitialSyncTrackingProgress:(BOOL)a3;
- (void)_updateMailboxSelection:(id)a3 notifyClient:(BOOL)a4;
- (void)_updateMessagesStatus:(id)a3 mailbox:(id)a4;
- (void)_verifyPairingForcingSync:(BOOL)a3;
- (void)accountsSyncServiceServer:(id)a3 didChangeAccountSourceType:(id)a4;
- (void)accountsSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5;
- (void)accountsSyncServiceServer:(id)a3 didReceivedAccountAuthenticationStatus:(id)a4 requestTime:(double)a5;
- (void)accountsSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4;
- (void)addAttachmentData:(id)a3 forMessageId:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6;
- (void)addImageAttachment:(id)a3 forMessageId:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6;
- (void)addMessageContent:(id)a3 forMessage:(id)a4 loadedProtected:(BOOL)a5;
- (void)addMessages:(id)a3;
- (void)addUpdateOrDeleteAccounts:(id)a3;
- (void)batchRequestHandlerDidTimeoutFetchRequest:(id)a3;
- (void)dealloc;
- (void)deleteMessagesWithIds:(id)a3;
- (void)fetchesSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5;
- (void)fetchesSyncServiceServer:(id)a3 didNotifyAboutWebKitStatus:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didNotifyInitialSyncFinished:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didRequestContent:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didRequestFetch:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didRequestFetchInBatch:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didRequestFullSync:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didRequestHaltSync:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didRequestMoreMessages:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didRequestMoreMessagesForConversation:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didRequestMoreMessagesInBatch:(id)a4;
- (void)fetchesSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4;
- (void)markConversationIdForNotNotify:(id)a3;
- (void)markConversationIdForNotify:(id)a3 messages:(id)a4 includesProtectedMessages:(BOOL)a5;
- (void)messageContentSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5;
- (void)messageContentSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4;
- (void)messagesSyncServiceServer:(id)a3 didDeleteMessages:(id)a4;
- (void)messagesSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5;
- (void)messagesSyncServiceServer:(id)a3 didMoveMessages:(id)a4;
- (void)messagesSyncServiceServer:(id)a3 didRecieveAttachmentsAtURL:(id)a4 composedMessageId:(id)a5;
- (void)messagesSyncServiceServer:(id)a3 didRequestCompactMessages:(id)a4;
- (void)messagesSyncServiceServer:(id)a3 didRequestSendMessage:(id)a4;
- (void)messagesSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4;
- (void)messagesSyncServiceServer:(id)a3 didUpdateMailboxSelection:(id)a4;
- (void)messagesSyncServiceServer:(id)a3 didUpdateMessagesStatus:(id)a4;
- (void)messagesSyncServiceServer:(id)a3 didWarnMessagesFilteredOut:(id)a4;
- (void)messagesSyncServiceServerConnectivityChanged:(id)a3;
- (void)messagesSyncServiceServerSpaceBecameAvailable:(id)a3;
- (void)notifyFetchCompleted;
- (void)notifyFetchCompletedForMailboxId:(id)a3 error:(id)a4;
- (void)replyWithAccountToResend:(id)a3;
- (void)replyWithAccounts:(id)a3;
- (void)replyWithFirstMessages:(id)a3 includesProtectedMessages:(BOOL)a4 mailboxes:(id)a5 organizedByThread:(BOOL)a6;
- (void)replyWithMessageSendingProgress:(int64_t)a3 forComposedMessageId:(id)a4;
- (void)replyWithMessagesToResend:(id)a3 includesProtectedMessages:(BOOL)a4;
- (void)replyWithMessagesToSendAsFetchResponse:(id)a3 includesProtectedMessages:(BOOL)a4;
- (void)replyWithMoreMessages:(id)a3 context:(id)a4;
- (void)reportMessageContentDownloadFailureForMessageId:(id)a3;
- (void)reportWillDownloadFirstMessages;
- (void)resendObjectsForIDSIdentifier:(id)a3;
- (void)resendScheduler:(id)a3 didRequestDequeueIDSIdentifierForResend:(id)a4;
- (void)resendScheduler:(id)a3 didRequestEnqueueIDSIdentifierForResend:(id)a4 date:(id)a5 silent:(BOOL)a6;
- (void)resendScheduler:(id)a3 didRequestEnqueueIDSIdentifiersForResend:(id)a4;
- (void)resendScheduler:(id)a3 didRequestRetryFullSyncForMailboxes:(id)a4;
- (void)resendScheduler:(id)a3 didRequestRetrySendingAccountIdentifier:(id)a4 resendInterval:(unint64_t)a5;
- (void)resendScheduler:(id)a3 didRequestRetrySendingAccountWithId:(id)a4;
- (void)resendScheduler:(id)a3 didRequestRetrySendingComposeMessageProgress:(int64_t)a4 messageId:(id)a5 resendInterval:(unint64_t)a6;
- (void)resendScheduler:(id)a3 didRequestRetrySendingContentForMessageId:(id)a4 highPriority:(BOOL)a5;
- (void)resendScheduler:(id)a3 didRequestRetrySendingDeletionForAccountWithId:(id)a4 resendInterval:(unint64_t)a5;
- (void)resendScheduler:(id)a3 didRequestRetrySendingMailboxSelectionWithResendInterval:(unint64_t)a4;
- (void)resendScheduler:(id)a3 didRequestRetrySendingMessageDeletions:(id)a4 deletionsMessageIds:(id)a5 resendInterval:(unint64_t)a6;
- (void)resendScheduler:(id)a3 didRequestRetrySendingMessageWithIds:(id)a4;
- (void)resendScheduler:(id)a3 didRequestRetrySendingVIPListWithResendInterval:(unint64_t)a4;
- (void)setAccountsSyncService:(id)a3;
- (void)setBatchRequestHandler:(id)a3;
- (void)setContentSyncService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectoryProvider:(id)a3;
- (void)setFetchesSyncService:(id)a3;
- (void)setFullSyncRecoveredInThisSession:(BOOL)a3;
- (void)setFullSyncTimeoutTimersByMailboxId:(id)a3;
- (void)setInitialSyncProgressTracker:(id)a3;
- (void)setMessagesSyncService:(id)a3;
- (void)setOrganizeByThread:(BOOL)a3;
- (void)setPairedDeviceRegistry:(id)a3;
- (void)setPersistenceHandler:(id)a3;
- (void)setProtectedContentSyncService:(id)a3;
- (void)setProtectedSyncService:(id)a3;
- (void)setProviderQueue:(id)a3;
- (void)setResendScheduler:(id)a3;
- (void)setSessionController:(id)a3;
- (void)setSyncController:(id)a3;
- (void)setSyncStateManager:(id)a3;
- (void)setTriggeredInitialSyncToRecoverFromSyncVersionMismatch:(BOOL)a3;
- (void)setupPairedDeviceRegistry;
- (void)syncStandaloneAccountIdentity:(id)a3;
- (void)syncStateManager:(id)a3 handleForwardForNotification:(id)a4 completion:(id)a5;
- (void)syncStateManagerDidBeginSyncSession:(id)a3 syncSessionType:(id)a4 syncSessionIdentifier:(id)a5;
- (void)syncStateManagerDidChangePairedDevice:(id)a3;
- (void)syncStateManagerDidInvalidateSyncSession:(id)a3 syncSessionIdentifier:(id)a4;
- (void)syncStateManagerDidUnpair:(id)a3;
- (void)tearDown;
- (void)trackerDidFinishSendingInitialSyncContentToPairedDevice:(id)a3;
- (void)updateConversationId:(id)a3 mute:(BOOL)a4;
- (void)updateConversationId:(id)a3 notify:(BOOL)a4 messages:(id)a5;
- (void)updateMailboxSelection:(id)a3;
- (void)updateMessagesStatus:(id)a3;
- (void)updateVIPSenderList:(id)a3;
- (void)updateVIPSenderList:(id)a3 requestContext:(id)a4;
@end

@implementation NNMKSyncProvider

+ (BOOL)prepareForSystemAppDeletion:(id *)a3
{
  v4 = [MEMORY[0x263F57730] sharedInstance];
  v5 = [v4 pairingStorePath];

  if (v5)
  {
    v6 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v5 isDirectory:1];
    v7 = [v6 URLByAppendingPathComponent:@"NanoMail/registry.sqlite" isDirectory:0];
    v8 = [v7 URLByDeletingLastPathComponent];

    v9 = [MEMORY[0x263F08850] defaultManager];
    char v10 = [v9 removeItemAtURL:v8 error:a3];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (NNMKSyncProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(NNMKDirectoryProvider);
  v6 = [(NNMKSyncProvider *)self initWithDelegate:v4 syncStateManager:0 directoryProvider:v5];

  return v6;
}

- (NNMKSyncProvider)initWithDelegate:(id)a3 syncStateManager:(id)a4 directoryProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.nanomail.providerQueue", 0);
  v19.receiver = self;
  v19.super_class = (Class)NNMKSyncProvider;
  v12 = [(NNMKSyncEndpoint *)&v19 initWithQueue:v11];
  if (v12)
  {
    nnmk_setupLoggingSubsystems();
    objc_storeWeak((id *)&v12->_delegate, v8);
    objc_storeStrong((id *)&v12->_providerQueue, v11);
    providerQueue = v12->_providerQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__NNMKSyncProvider_initWithDelegate_syncStateManager_directoryProvider___block_invoke;
    block[3] = &unk_264E9A308;
    v16 = v12;
    id v17 = v10;
    id v18 = v9;
    dispatch_sync(providerQueue, block);
  }
  return v12;
}

void __72__NNMKSyncProvider_initWithDelegate_syncStateManager_directoryProvider___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(NNMKSyncSessionController);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = v2;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), *(id *)(a1 + 40));
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v5;

  id v8 = [*(id *)(*(void *)(a1 + 32) + 152) pairedDeviceRegistryPath];
  if (v8)
  {
    id v9 = [MEMORY[0x263F08850] defaultManager];
    int v10 = [v9 fileExistsAtPath:v8 isDirectory:0];

    if (v10)
    {
      dispatch_queue_t v11 = [[NNMKDeviceSyncRegistry alloc] initWithPath:v8];
      uint64_t v12 = *(void *)(a1 + 32);
      v13 = *(void **)(v12 + 72);
      *(void *)(v12 + 72) = v11;
    }
  }
  v14 = objc_alloc_init(NNMKSyncController);
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 136);
  *(void *)(v15 + 136) = v14;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "setDelegate:");
  id v17 = *(void **)(a1 + 48);
  id v18 = v17;
  if (!v17)
  {
    id v18 = [*(id *)(a1 + 32) _createDefaultSyncStateManager];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v18);
  if (!v17) {

  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
  objc_super v19 = objc_alloc_init(NNMKSyncPersistenceHandler);
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(void **)(v20 + 80);
  *(void *)(v20 + 80) = v19;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 80) setSyncController:*(void *)(*(void *)(a1 + 32) + 136)];
  [*(id *)(*(void *)(a1 + 32) + 80) setSyncStateManager:*(void *)(*(void *)(a1 + 32) + 64)];
  [*(id *)(*(void *)(a1 + 32) + 80) setSessionController:*(void *)(*(void *)(a1 + 32) + 144)];
  v22 = objc_alloc_init(NNMKInitialSyncProgressTracker);
  uint64_t v23 = *(void *)(a1 + 32);
  v24 = *(void **)(v23 + 168);
  *(void *)(v23 + 168) = v22;

  [*(id *)(*(void *)(a1 + 32) + 168) setExecutionQueue:*(void *)(*(void *)(a1 + 32) + 56)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 168) setSyncStateManager:*(void *)(*(void *)(a1 + 32) + 64)];
  v25 = objc_alloc_init(NNMKResendScheduler);
  uint64_t v26 = *(void *)(a1 + 32);
  v27 = *(void **)(v26 + 160);
  *(void *)(v26 + 160) = v25;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 160) setSyncController:*(void *)(*(void *)(a1 + 32) + 136)];
  v28 = objc_alloc_init(NNMKBatchRequestHandler);
  uint64_t v29 = *(void *)(a1 + 32);
  v30 = *(void **)(v29 + 176);
  *(void *)(v29 + 176) = v28;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 176), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 176) setResendScheduler:*(void *)(*(void *)(a1 + 32) + 160)];
  [*(id *)(*(void *)(a1 + 32) + 176) setSyncController:*(void *)(*(void *)(a1 + 32) + 136)];
  [*(id *)(*(void *)(a1 + 32) + 176) setExecutionQueue:*(void *)(*(void *)(a1 + 32) + 56)];
  [*(id *)(*(void *)(a1 + 32) + 80) setBatchRequestHandler:*(void *)(*(void *)(a1 + 32) + 176)];
  v31 = [[NNMKMessagesSyncServiceServer alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v32 = *(void *)(a1 + 32);
  v33 = *(void **)(v32 + 88);
  *(void *)(v32 + 88) = v31;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "setDelegate:");
  v34 = [[NNMKMessageContentSyncServiceServer alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v35 = *(void *)(a1 + 32);
  v36 = *(void **)(v35 + 96);
  *(void *)(v35 + 96) = v34;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setDelegate:");
  v37 = [[NNMKAccountsSyncServiceServer alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v38 = *(void *)(a1 + 32);
  v39 = *(void **)(v38 + 104);
  *(void *)(v38 + 104) = v37;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "setDelegate:");
  v40 = [[NNMKFetchesSyncServiceServer alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v41 = *(void *)(a1 + 32);
  v42 = *(void **)(v41 + 112);
  *(void *)(v41 + 112) = v40;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "setDelegate:");
  v43 = [[NNMKProtectedSyncServiceServer alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v44 = *(void *)(a1 + 32);
  v45 = *(void **)(v44 + 120);
  *(void *)(v44 + 120) = v43;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "setDelegate:");
  v46 = [[NNMKProtectedContentSyncServiceServer alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v47 = *(void *)(a1 + 32);
  v48 = *(void **)(v47 + 128);
  *(void *)(v47 + 128) = v46;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setDelegate:");
  v49 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D3DF000, v49, OS_LOG_TYPE_DEFAULT, "SyncProvider Created...", buf, 2u);
  }
  [*(id *)(*(void *)(a1 + 32) + 72) resetSyncRequestedFromMailboxes];
  if ([*(id *)(*(void *)(a1 + 32) + 72) recreatedFromScratch])
  {
    v50 = [*(id *)(a1 + 32) providerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__NNMKSyncProvider_initWithDelegate_syncStateManager_directoryProvider___block_invoke_19;
    block[3] = &unk_264E99F20;
    id v53 = *(id *)(a1 + 32);
    dispatch_async(v50, block);
  }
  [*(id *)(a1 + 32) _verifyPairingForcingSync:0];
  v51 = [*(id *)(a1 + 32) resendScheduler];
  [v51 forceRetryingAllPendingIDSMessages];

  objc_msgSend(*(id *)(a1 + 32), "_checkConnectivityBasedSuspensionTimer:", objc_msgSend(*(id *)(a1 + 32), "_isConnectedToWatch"));
}

uint64_t __72__NNMKSyncProvider_initWithDelegate_syncStateManager_directoryProvider___block_invoke_19(uint64_t a1)
{
  v2 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "Triggering #initial-sync because database was created from scratch.", v4, 2u);
  }
  return [*(id *)(a1 + 32) _triggerInitialSync];
}

- (void)dealloc
{
  [(NNMKBatchRequestHandler *)self->_batchRequestHandler cancelFetchTimeout];
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  self->_pairedDeviceRegistry = 0;

  syncStateManager = self->_syncStateManager;
  self->_syncStateManager = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)NNMKSyncProvider;
  [(NNMKSyncEndpoint *)&v5 dealloc];
}

- (void)tearDown
{
  self->_pairedDeviceRegistry = 0;
  MEMORY[0x270F9A758]();
}

- (void)_triggerInitialSyncToRecoverFromSyncVersionMismatch
{
  if (self->_triggeredInitialSyncToRecoverFromSyncVersionMismatch)
  {
    v2 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "Ignoring #initial-sync request. Already one in progress.", v3, 2u);
    }
  }
  else
  {
    self->_triggeredInitialSyncToRecoverFromSyncVersionMismatch = 1;
    [(NNMKSyncProvider *)self _triggerInitialSync];
  }
}

- (void)_triggerInitialSync
{
}

- (void)_triggerInitialSyncTrackingProgress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v5 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    pairedDeviceRegistry = self->_pairedDeviceRegistry;
    v7 = v5;
    int v15 = 134217984;
    uint64_t v16 = [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry fullSyncVersion];
    _os_log_impl(&dword_23D3DF000, v7, OS_LOG_TYPE_DEFAULT, "#initial-sync triggered. (Previous #sync-version: %lu)", (uint8_t *)&v15, 0xCu);
  }
  if (v3)
  {
    id v8 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
    [v8 startTrackingInitialSync];
  }
  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry cleanUpForInitialSync];
  id v9 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = self->_pairedDeviceRegistry;
    dispatch_queue_t v11 = v9;
    uint64_t v12 = [(NNMKDeviceSyncRegistry *)v10 fullSyncVersion];
    int v15 = 134217984;
    uint64_t v16 = v12;
    _os_log_impl(&dword_23D3DF000, v11, OS_LOG_TYPE_DEFAULT, "Incrementing #sync-version. %lu", (uint8_t *)&v15, 0xCu);
  }
  v13 = objc_alloc_init(NNMKProtoPrepareForFullSyncRequest);
  [(NNMKProtoPrepareForFullSyncRequest *)v13 setFullSyncVersion:[(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion]];
  [(NNMKFetchesSyncServiceServer *)self->_fetchesSyncService requestPrepareForFullSync:v13];
  [(NNMKSyncProvider *)self _requestDelegateForAccounts];
  v14 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_23D3DF000, v14, OS_LOG_TYPE_DEFAULT, "Requesting VIP List due to #initial-sync", (uint8_t *)&v15, 2u);
  }
  [(NNMKSyncProvider *)self _requestDelegateForVIPList:0];
}

- (void)replyWithAccounts:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__NNMKSyncProvider_replyWithAccounts___block_invoke;
  v7[3] = &unk_264E99F48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

void __38__NNMKSyncProvider_replyWithAccounts___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    v2 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v3 = *(void **)(a1 + 40);
      id v4 = v2;
      int v15 = 134217984;
      uint64_t v16 = [v3 count];
      _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "Received accounts from MobileMail to sync to watch. %lu accounts.", (uint8_t *)&v15, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 42) = 0;
    [*(id *)(*(void *)(a1 + 32) + 72) deleteAllMailboxes];
    [*(id *)(*(void *)(a1 + 32) + 72) beginUpdates];
    objc_super v5 = [*(id *)(a1 + 32) persistenceHandler];
    id v6 = [v5 persistAccounts:*(void *)(a1 + 40)];

    v7 = objc_msgSend(*(id *)(a1 + 40), "nnmk_map:", &__block_literal_global_9);
    id v8 = [*(id *)(*(void *)(a1 + 32) + 104) sendInitialAccountsSync:v6];
    id v9 = [*(id *)(a1 + 32) resendScheduler];
    [v9 registerIDSIdentifier:v8 objectIds:v7 type:@"Account" resendInterval:0];

    [*(id *)(*(void *)(a1 + 32) + 72) endUpdates];
    int v10 = [*(id *)(a1 + 32) initialSyncProgressTracker];
    [v10 updateProgressWithAccountsSent];

    objc_msgSend(*(id *)(a1 + 32), "_sendUpdatedMailboxSelection:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "fullSyncVersion"));
    dispatch_queue_t v11 = [*(id *)(a1 + 32) syncController];
    uint64_t v12 = [v11 mailboxesToSync];

    if ([v12 count])
    {
      v13 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes due to initial account sync.", (uint8_t *)&v15, 2u);
      }
      [*(id *)(a1 + 32) _triggerFullSyncForMailboxes:v12];
    }
    else
    {
      v14 = [*(id *)(a1 + 32) initialSyncProgressTracker];
      [v14 finishedSendingInitialSyncContentToPairedDevice];
    }
  }
}

uint64_t __38__NNMKSyncProvider_replyWithAccounts___block_invoke_24(uint64_t a1, void *a2)
{
  return [a2 accountId];
}

- (void)_triggerFullSyncForMailbox:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [(NNMKSyncProvider *)self _triggerFullSyncForMailboxes:v6];
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider _triggerFullSyncForMailbox:]();
  }
}

- (void)_triggerFullSyncForMailboxes:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    objc_super v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v4;
    id v6 = v4;
    uint64_t v28 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (!v28) {
      goto LABEL_16;
    }
    uint64_t v7 = *(void *)v30;
    v27 = self;
    while (1)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v6);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        pairedDeviceRegistry = self->_pairedDeviceRegistry;
        uint64_t v11 = [v9 mailboxId];
        uint64_t v12 = [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry mailboxWithId:v11];

        LOBYTE(v11) = [v12 syncRequested];
        v13 = (void *)qword_26AC21850;
        BOOL v14 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (!v14) {
            goto LABEL_14;
          }
          int v15 = v13;
          uint64_t v16 = [v9 mailboxId];
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = (uint64_t)v16;
          _os_log_impl(&dword_23D3DF000, v15, OS_LOG_TYPE_DEFAULT, "It will not request #full-sync for mailbox, because it has already been requested before. %{public}@", buf, 0xCu);
        }
        else
        {
          if (v14)
          {
            uint64_t v17 = self->_pairedDeviceRegistry;
            id v18 = v13;
            uint64_t v19 = [(NNMKDeviceSyncRegistry *)v17 fullSyncVersion];
            [v9 mailboxId];
            uint64_t v20 = v7;
            id v21 = v6;
            uint64_t v23 = v22 = v5;
            *(_DWORD *)buf = 134218242;
            uint64_t v34 = v19;
            __int16 v35 = 2114;
            v36 = v23;
            _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "#full-sync triggered for mailbox. Requesting messages from MobileMail (#sync-version: %lu, mailbox:%{public}@).", buf, 0x16u);

            objc_super v5 = v22;
            id v6 = v21;
            uint64_t v7 = v20;
            self = v27;
          }
          [v5 addObject:v9];
          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry cleanUpForFullSyncWithMailbox:v9];
          [v9 setSyncRequested:1];
          v24 = [v9 mailboxId];
          [(NNMKSyncProvider *)self _startFullSyncTimeoutForMailboxId:v24];

          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry updateSyncRequestedForMailbox:v9];
          int v15 = [(NNMKSyncProvider *)self resendScheduler];
          uint64_t v16 = [v9 mailboxId];
          [v15 deletePendingIDSMessagesForMailboxId:v16];
        }

LABEL_14:
      }
      uint64_t v28 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (!v28)
      {
LABEL_16:

        if ([v5 count])
        {
          v25 = [(NNMKSyncProvider *)self resendScheduler];
          [v25 resetInitialSyncResendInterval];

          [(NNMKSyncProvider *)self _requestDelegateForFirstMessagesForMailboxes:v5];
        }

        id v4 = v26;
        goto LABEL_21;
      }
    }
  }
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
    -[NNMKSyncProvider _triggerFullSyncForMailboxes:]();
  }
LABEL_21:
}

- (void)_startFullSyncTimeoutForMailboxId:(id)a3
{
  id v4 = a3;
  if (MGGetBoolAnswer())
  {
    objc_initWeak(&location, self);
    objc_super v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_providerQueue);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    int v10 = __54__NNMKSyncProvider__startFullSyncTimeoutForMailboxId___block_invoke;
    uint64_t v11 = &unk_264E9A900;
    objc_copyWeak(&v14, &location);
    uint64_t v12 = self;
    id v6 = v4;
    id v13 = v6;
    dispatch_source_set_event_handler(v5, &v8);
    dispatch_resume(v5);
    if (v5)
    {
      dispatch_time_t v7 = dispatch_time(0, 600000000000);
      dispatch_source_set_timer(v5, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fullSyncTimeoutTimersByMailboxId, "setObject:forKeyedSubscript:", v5, v6, v8, v9, v10, v11, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __54__NNMKSyncProvider__startFullSyncTimeoutForMailboxId___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v2 = objc_loadWeakRetained(&to);

  if (v2)
  {
    BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 72) mailboxWithId:*(void *)(a1 + 40)];
    if ([v3 syncRequested])
    {
      id v4 = objc_alloc_init(NNMKProtoInitialMessagesSyncFailure);
      [(NNMKProtoInitialMessagesSyncFailure *)v4 setMailboxId:*(void *)(a1 + 40)];
      [(NNMKProtoInitialMessagesSyncFailure *)v4 setErrorDomain:@"com.apple.nanomail"];
      [(NNMKProtoInitialMessagesSyncFailure *)v4 setErrorCode:41];
      id v5 = objc_loadWeakRetained(&to);
      id v6 = [v5 messagesSyncService];
      dispatch_time_t v7 = [v6 notifyInitialMessageSyncFailed:v4];

      uint64_t v8 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v7;
        _os_log_impl(&dword_23D3DF000, v8, OS_LOG_TYPE_DEFAULT, "Notifying client that full sync timed out (IDS Identifier: %{public}@)...", buf, 0xCu);
      }
    }
    id v9 = objc_loadWeakRetained(&to);
    int v10 = [v9 fullSyncTimeoutTimersByMailboxId];
    [v10 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  objc_destroyWeak(&to);
}

- (void)_cancelFullSyncTimeoutTimerForMailboxId:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_fullSyncTimeoutTimersByMailboxId, "objectForKeyedSubscript:");
  id v5 = v4;
  if (v4)
  {
    dispatch_source_cancel(v4);
    [(NSMutableDictionary *)self->_fullSyncTimeoutTimersByMailboxId setObject:0 forKeyedSubscript:v6];
  }
}

- (void)replyWithFirstMessages:(id)a3 includesProtectedMessages:(BOOL)a4 mailboxes:(id)a5 organizedByThread:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  providerQueue = self->_providerQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__NNMKSyncProvider_replyWithFirstMessages_includesProtectedMessages_mailboxes_organizedByThread___block_invoke;
  v15[3] = &unk_264E9A928;
  v15[4] = self;
  id v16 = v10;
  BOOL v18 = a6;
  id v17 = v11;
  BOOL v19 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(providerQueue, v15);
}

void __97__NNMKSyncProvider_replyWithFirstMessages_includesProtectedMessages_mailboxes_organizedByThread___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 72);
  BOOL v3 = qword_26AC21850;
  BOOL v4 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = *(void **)(a1 + 40);
      id v6 = v3;
      int v13 = 134217984;
      uint64_t v14 = [v5 count];
      _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Received first messages from MobileMail (Message count: %lu).", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 72) setOrganizeByThread:*(unsigned __int8 *)(a1 + 56)];
    if ([*(id *)(a1 + 32) _pairedDeviceSupportsMultipleMailboxes])
    {
      dispatch_time_t v7 = [*(id *)(a1 + 32) _sendFirstMessages:*(void *)(a1 + 40) mailboxes:*(void *)(a1 + 48) shouldUseProtectedChannel:*(unsigned __int8 *)(a1 + 57)];
LABEL_12:
      uint64_t v12 = [*(id *)(a1 + 32) initialSyncProgressTracker];
      [v12 updateProgressWithMessageHeadersSent:v7];

      return;
    }
    uint64_t v8 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_23D3DF000, v8, OS_LOG_TYPE_DEFAULT, "Paired device does not support multiple mailboxes. Sending first messages to default mailbox.", (uint8_t *)&v13, 2u);
    }
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 72) mailboxWithId:@"-1"];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "_legacy_sendFirstMessages:syncedMailbox:shouldUseProtectedChannel:", *(void *)(a1 + 40), v9, *(unsigned __int8 *)(a1 + 57));

      dispatch_time_t v7 = 0;
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __97__NNMKSyncProvider_replyWithFirstMessages_includesProtectedMessages_mailboxes_organizedByThread___block_invoke_cold_1();
    }
  }
  else if (v4)
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "No paired device. It won't sync messages for #full-sync.", (uint8_t *)&v13, 2u);
  }
}

- (id)_sendFirstMessages:(id)a3 mailboxes:(id)a4 shouldUseProtectedChannel:(BOOL)a5
{
  BOOL v59 = a5;
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(NNMKSyncProvider *)self syncController];
  v60 = [v9 groupMessagesByMailboxId:v7];

  v57 = objc_alloc_init(NNMKProtoInitialMessagesSyncBatch);
  id v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v67 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v66 + 1) + 8 * i) mailboxId];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v66 objects:v77 count:16];
    }
    while (v13);
  }

  id v17 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v18 = v17;
    BOOL v19 = objc_msgSend(v10, "nnmk_description");
    *(_DWORD *)buf = 138543362;
    uint64_t v71 = (uint64_t)v19;
    _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "Preparing to send #full-sync for mailboxes. %{public}@", buf, 0xCu);
  }
  v54 = v7;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count", v10));
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry beginUpdates];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v11;
  uint64_t v61 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
  if (v61)
  {
    uint64_t v58 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v61; ++j)
      {
        if (*(void *)v63 != v58) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        pairedDeviceRegistry = self->_pairedDeviceRegistry;
        uint64_t v23 = [v21 mailboxId];
        v24 = [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry mailboxWithId:v23];

        if (v24)
        {
          int v25 = [v21 syncActive];
          if (v25 != [v24 syncActive]
            || (int v26 = [v21 syncEnabled], v26 != objc_msgSend(v24, "syncEnabled")))
          {
            objc_msgSend(v21, "setSyncActive:", objc_msgSend(v24, "syncActive"));
            objc_msgSend(v21, "setSyncEnabled:", objc_msgSend(v24, "syncEnabled"));
          }
        }
        v27 = [(NNMKSyncProvider *)self syncController];
        uint64_t v28 = [v21 mailboxId];
        long long v29 = [v60 objectForKeyedSubscript:v28];
        long long v30 = [v27 filterMessages:v29 byAlreadySynced:0 byMailbox:v21];

        long long v31 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          long long v32 = v31;
          v33 = [v21 mailboxId];
          uint64_t v34 = self->_pairedDeviceRegistry;
          __int16 v35 = [v21 mailboxId];
          uint64_t v36 = [(NNMKDeviceSyncRegistry *)v34 syncVersionForMailboxId:v35];
          uint64_t v37 = [v30 count];
          *(_DWORD *)buf = 138543874;
          uint64_t v71 = (uint64_t)v33;
          __int16 v72 = 2048;
          uint64_t v73 = v36;
          __int16 v74 = 2048;
          uint64_t v75 = v37;
          _os_log_impl(&dword_23D3DF000, v32, OS_LOG_TYPE_DEFAULT, "Preparing messages to send for mailbox. (Mailbox: %{public}@, #mailbox-sync-version: %lu, Message count: %lu)", buf, 0x20u);
        }
        uint64_t v38 = [(NNMKSyncProvider *)self _initialSyncForMailbox:v21 messages:v30 shouldUseProtectedChannel:v59];
        if (v38)
        {
          [(NNMKProtoInitialMessagesSyncBatch *)v57 addInitialMessagesSync:v38];
          [v56 addObjectsFromArray:v30];
        }
        else
        {
          v39 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            uint64_t v41 = [v21 mailboxId];
            *(_DWORD *)buf = 138543362;
            uint64_t v71 = (uint64_t)v41;
            _os_log_impl(&dword_23D3DF000, v40, OS_LOG_TYPE_DEFAULT, "It won't send mailbox on #full-sync. %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
    }
    while (v61);
  }

  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry endUpdates];
  [(NNMKProtoInitialMessagesSyncBatch *)v57 setFullSyncVersion:[(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion]];
  v42 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
  if (v59) {
    v42 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
  }
  id v43 = *(id *)((char *)&self->super.super.isa + *v42);
  uint64_t v44 = [v43 sendBatchedInitialMessagesSync:v57];
  v45 = [(NNMKSyncProvider *)self resendScheduler];
  v46 = (void *)[v53 copy];
  uint64_t v47 = [(NNMKSyncProvider *)self resendScheduler];
  objc_msgSend(v45, "registerIDSIdentifier:objectIds:type:resendInterval:", v44, v46, @"InitialSync", objc_msgSend(v47, "initialSyncResendInterval"));

  v48 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    v49 = v48;
    uint64_t v50 = [v56 count];
    v51 = objc_msgSend(v53, "nnmk_description");
    *(_DWORD *)buf = 134218498;
    uint64_t v71 = v50;
    __int16 v72 = 2114;
    uint64_t v73 = (uint64_t)v44;
    __int16 v74 = 2114;
    uint64_t v75 = (uint64_t)v51;
    _os_log_impl(&dword_23D3DF000, v49, OS_LOG_TYPE_DEFAULT, "#full-sync messages sent (%lu messages - IDS identifier: %{public}@ - Mailbox ids: %{public}@).", buf, 0x20u);
  }
  return v56;
}

- (id)_initialSyncForMailbox:(id)a3 messages:(id)a4 shouldUseProtectedChannel:(BOOL)a5
{
  BOOL v46 = a5;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([v7 syncActive] & 1) != 0 || (objc_msgSend(v7, "syncEnabled") & 1) == 0)
  {
    uint64_t v36 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = v36;
      uint64_t v38 = [v7 mailboxId];
      *(_DWORD *)buf = 138543874;
      v52 = v38;
      __int16 v53 = 2048;
      unint64_t v54 = [v7 syncActive];
      __int16 v55 = 2048;
      unint64_t v56 = [v7 syncEnabled];
      _os_log_impl(&dword_23D3DF000, v37, OS_LOG_TYPE_DEFAULT, "Ignoring MobileMail reply for first messages. Mailbox: %{public}@, active: %lu, enabled: %lu.", buf, 0x20u);
    }
    id v17 = 0;
  }
  else
  {
    uint64_t v9 = objc_alloc_init(NNMKProtoInitialMessagesSync);
    uint64_t v10 = 72;
    [(NNMKProtoInitialMessagesSync *)v9 setFullSyncVersion:[(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion]];
    id v11 = (void *)MEMORY[0x263F08910];
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    uint64_t v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
    [(NNMKProtoInitialMessagesSync *)v9 setDateSynced:v13];

    uint64_t v14 = +[NNMKProtoMailbox protoMailboxFromMailbox:v7];
    [(NNMKProtoInitialMessagesSync *)v9 setMailbox:v14];

    pairedDeviceRegistry = self->_pairedDeviceRegistry;
    uint64_t v41 = v7;
    id v16 = [v7 mailboxId];
    [(NNMKProtoInitialMessagesSync *)v9 setMailboxSyncVersion:[(NNMKDeviceSyncRegistry *)pairedDeviceRegistry syncVersionForMailboxId:v16]];

    id v17 = v9;
    [(NNMKProtoInitialMessagesSync *)v9 setOrganizedByThread:[(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry organizeByThread]];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v40 = v8;
    obuint64_t j = v8;
    uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v48;
      id v43 = v17;
      uint64_t v44 = self;
      uint64_t v42 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v23 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            v24 = v23;
            int v25 = [v22 messageId];
            [v22 accountId];
            v27 = uint64_t v26 = v10;
            [v22 dateReceived];
            long long v29 = v28 = v19;
            long long v30 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v22 status]);
            long long v31 = [v22 messageIdHeader];
            *(_DWORD *)buf = 138544386;
            v52 = v25;
            __int16 v53 = 2114;
            unint64_t v54 = (unint64_t)v27;
            __int16 v55 = 2114;
            unint64_t v56 = (unint64_t)v29;
            __int16 v57 = 2112;
            uint64_t v58 = v30;
            __int16 v59 = 2114;
            v60 = v31;
            _os_log_impl(&dword_23D3DF000, v24, OS_LOG_TYPE_DEFAULT, "Message ADDED (Id: %{public}@ - Account Id: %{public}@ - Date Received: %{public}@ - Status: %@ - Message ID Header %{public}@ - Reason: #full-sync)", buf, 0x34u);

            uint64_t v19 = v28;
            uint64_t v10 = v26;
            uint64_t v20 = v42;

            id v17 = v43;
            self = v44;
          }
          long long v32 = -[NNMKSyncProvider _messageProtobufForMessage:](self, "_messageProtobufForMessage:", v22, v40);
          [(NNMKProtoInitialMessagesSync *)v17 addInitialMessage:v32];

          v33 = [[NNMKSyncedMessage alloc] initWithMessage:v22];
          [(NNMKSyncedMessage *)v33 setUsedProtectedChannelForMessageSync:v46];
          uint64_t v34 = [(NNMKSyncProvider *)self batchRequestHandler];
          [v34 handleMessageAdded:v22];

          [*(id *)((char *)&self->super.super.isa + v10) addOrUpdateSyncedMessage:v33];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
      }
      while (v19);
    }

    id v7 = v41;
    [v41 setSyncActive:1];
    [v41 setSyncRequested:0];
    __int16 v35 = [v41 mailboxId];
    [(NNMKSyncProvider *)self _cancelFullSyncTimeoutTimerForMailboxId:v35];

    [*(id *)((char *)&self->super.super.isa + v10) updateSyncActiveForMailbox:v41];
    [*(id *)((char *)&self->super.super.isa + v10) updateSyncRequestedForMailbox:v41];
    id v8 = v40;
  }

  return v17;
}

- (id)_legacy_sendFirstMessages:(id)a3 syncedMailbox:(id)a4 shouldUseProtectedChannel:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (NNMKSyncedMessage *)a4;
  if ([(NNMKSyncedMessage *)v9 syncActive])
  {
    uint64_t v10 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "Reply from delegate for didRequestFirstMessages but mailbox is already active.", buf, 2u);
    }
    obuint64_t j = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    [(NNMKSyncedMessage *)v9 setSyncEnabled:1];
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry updateSyncEnabledForMailbox:v9];
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry beginUpdates];
    id v11 = [(NNMKSyncProvider *)self syncController];
    id v47 = v8;
    [v11 filterMessages:v8 byAlreadySynced:0 byMailbox:v9];
    v13 = uint64_t v12 = v9;

    uint64_t v14 = objc_alloc_init(NNMKProtoInitialMessagesSync);
    [(NNMKProtoInitialMessagesSync *)v14 setFullSyncVersion:[(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion]];
    uint64_t v15 = (void *)MEMORY[0x263F08910];
    id v16 = [MEMORY[0x263EFF910] date];
    id v17 = [v15 archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];
    [(NNMKProtoInitialMessagesSync *)v14 setDateSynced:v17];

    uint64_t v18 = +[NNMKProtoMailbox protoMailboxFromMailbox:v12];
    [(NNMKProtoInitialMessagesSync *)v14 setMailbox:v18];

    unint64_t v19 = +[NNMKMailbox syncedTypeFromMailbox:v12];
    BOOL v46 = v12;
    if (v12)
    {
      [(NNMKProtoInitialMessagesSync *)v14 setSyncedMailboxType:v19];
      uint64_t v20 = [(NNMKSyncedMessage *)v12 accountId];
      [(NNMKProtoInitialMessagesSync *)v14 setSyncedMailboxAccountId:v20];

      id v21 = [(NNMKSyncedMessage *)v12 url];
      v22 = [v21 absoluteString];
      [(NNMKProtoInitialMessagesSync *)v14 setSyncedMailboxURL:v22];

      uint64_t v23 = [(NNMKSyncedMessage *)v12 customName];
      [(NNMKProtoInitialMessagesSync *)v14 setSyncedMailboxCustomName:v23];
    }
    else
    {
      [(NNMKProtoInitialMessagesSync *)v14 setSyncedMailboxType:0];
    }
    if ([v13 count])
    {
      v24 = [v13 lastObject];
      int v25 = (void *)MEMORY[0x263F08910];
      uint64_t v12 = [v24 dateReceived];
      uint64_t v26 = [v25 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
      [(NNMKProtoInitialMessagesSync *)v14 setDateForRequestingMoreMessages:v26];
    }
    v27 = v14;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = v13;
    uint64_t v28 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v33 = [(NNMKSyncProvider *)self _messageProtobufForMessage:v32];
          [(NNMKProtoInitialMessagesSync *)v27 addInitialMessage:v33];

          uint64_t v12 = [[NNMKSyncedMessage alloc] initWithMessage:v32 useDefaultMailbox:1];
          [(NNMKSyncedMessage *)v12 setUsedProtectedChannelForMessageSync:v5];
          uint64_t v34 = [(NNMKSyncProvider *)self batchRequestHandler];
          [v34 handleMessageAdded:v32];

          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry addOrUpdateSyncedMessage:v12];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
      }
      while (v29);
    }

    __int16 v35 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
    if (v5) {
      __int16 v35 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
    }
    id v45 = *(id *)((char *)&self->super.super.isa + *v35);
    uint64_t v36 = [v45 sendInitialMessagesSync:v27];
    uint64_t v37 = [(NNMKSyncProvider *)self resendScheduler];
    uint64_t v9 = v46;
    if (v46)
    {
      uint64_t v12 = [(NNMKSyncedMessage *)v46 mailboxId];
      __int16 v59 = v12;
      uint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
    }
    else
    {
      uint64_t v38 = (void *)MEMORY[0x263EFFA68];
    }
    v39 = [(NNMKSyncProvider *)self resendScheduler];
    objc_msgSend(v37, "registerIDSIdentifier:objectIds:type:resendInterval:", v36, v38, @"InitialSync", objc_msgSend(v39, "initialSyncResendInterval"));

    if (v46)
    {
    }
    [(NNMKSyncedMessage *)v46 setSyncActive:1];
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry updateSyncActiveForMailbox:v46];
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry endUpdates];
    id v40 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = v40;
      uint64_t v42 = [obj count];
      id v43 = [(NNMKSyncedMessage *)v46 mailboxId];
      *(_DWORD *)buf = 134218498;
      uint64_t v54 = v42;
      __int16 v55 = 2114;
      unint64_t v56 = v43;
      __int16 v57 = 2114;
      uint64_t v58 = v36;
      _os_log_impl(&dword_23D3DF000, v41, OS_LOG_TYPE_DEFAULT, "#full-sync messages sent (%lu messages - Mailbox id: %{public}@ IDS identifier: %{public}@).", buf, 0x20u);
    }
    id v8 = v47;
  }

  return obj;
}

- (void)replyWithMoreMessages:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__NNMKSyncProvider_replyWithMoreMessages_context___block_invoke;
  block[3] = &unk_264E9A308;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(providerQueue, block);
}

void __50__NNMKSyncProvider_replyWithMoreMessages_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) syncController];
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 48) mailboxes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __50__NNMKSyncProvider_replyWithMoreMessages_context___block_invoke_2;
  v7[3] = &unk_264E9A950;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v2 groupMessagesByMailbox:v3 mailboxes:v4 block:v7];
}

void __50__NNMKSyncProvider_replyWithMoreMessages_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 conversationId];
  uint64_t v9 = [v8 length];

  id v10 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  if (v9)
  {
    id v12 = [v10 conversationId];
    objc_msgSend(v11, "_replyWithMoreMessages:forConversationWithId:includesProtectedMessages:mailbox:", v7, v12, objc_msgSend(*(id *)(a1 + 32), "hasProtectedMessages"), v6);
  }
  else
  {
    id v12 = [v10 beforeDate];
    objc_msgSend(v11, "_replyWithMoreMessages:forDateReceivedBefore:includesProtectedMessages:mailbox:messagesForSpecialMailbox:", v7, v12, objc_msgSend(*(id *)(a1 + 32), "hasProtectedMessages"), v6, objc_msgSend(*(id *)(a1 + 32), "messagesForSpecialMailbox"));
  }
}

- (void)_replyWithMoreMessages:(id)a3 forDateReceivedBefore:(id)a4 includesProtectedMessages:(BOOL)a5 mailbox:(id)a6 messagesForSpecialMailbox:(unint64_t)a7
{
  BOOL v9 = a5;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if ([v14 syncActive])
  {
    if (a7)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v34;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v19++), "setIsSpecialMailboxSpecific:", a7, (void)v33);
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
        }
        while (v17);
      }
    }
    uint64_t v20 = [(NNMKSyncProvider *)self syncController];
    id v21 = [v20 filterMessages:v12 byAlreadySynced:1 byMailbox:v14];

    v22 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = v22;
      uint64_t v24 = [v21 count];
      int v25 = [v14 mailboxId];
      *(_DWORD *)buf = 134218754;
      uint64_t v38 = v24;
      __int16 v39 = 2048;
      unint64_t v40 = a7;
      __int16 v41 = 2114;
      id v42 = v13;
      __int16 v43 = 2114;
      uint64_t v44 = v25;
      _os_log_impl(&dword_23D3DF000, v23, OS_LOG_TYPE_DEFAULT, "MobileMail responded for #LOAD_MORE_MESSAGES request. (Message Count: %lu, Special Mailbox Request: %lu, Date Request: %{public}@, Mailbox id: %{public}@)", buf, 0x2Au);
    }
    uint64_t v26 = [(NNMKSyncProvider *)self persistenceHandler];
    v27 = [v26 addMoreMessages:v21 mailbox:v14 isProtectedData:v9];

    uint64_t v28 = +[NNMKMessage messageIdsFromMessages:v21];
    uint64_t v29 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
    if (v9) {
      uint64_t v29 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
    }
    uint64_t v30 = [*(id *)((char *)&self->super.super.isa + *v29) sendMoreMessages:v27];
    long long v31 = [(NNMKSyncProvider *)self resendScheduler];
    [v31 registerIDSIdentifier:v30 objectIds:v28 type:@"Message" resendInterval:0];

    [(NNMKSyncProvider *)self _requestDelegateForContentForMessageIds:v28 highPriority:0];
  }
  else
  {
    uint64_t v32 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v32, OS_LOG_TYPE_DEFAULT, "MobileMail responded for #LOAD_MORE_MESSAGES request but we were actually expecting another response.", buf, 2u);
    }
  }
}

- (void)_replyWithMoreMessages:(id)a3 forConversationWithId:(id)a4 includesProtectedMessages:(BOOL)a5 mailbox:(id)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v12 syncActive])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v17++), "setIsThreadSpecific:", 1, (void)v30);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v15);
    }

    uint64_t v18 = [(NNMKSyncProvider *)self syncController];
    uint64_t v19 = [v18 filterMessages:v13 byAlreadySynced:1 byMailbox:v12];

    uint64_t v20 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      uint64_t v22 = [v19 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v22;
      _os_log_impl(&dword_23D3DF000, v21, OS_LOG_TYPE_DEFAULT, "MobileMail responded for #LOAD_MORE_MESSAGES conversation request. (Message count: %lu)", buf, 0xCu);
    }
    uint64_t v23 = [(NNMKSyncProvider *)self persistenceHandler];
    uint64_t v24 = [v23 addMoreConversationSpecificMessages:v19 conversationId:v11 mailbox:v12 isProtectedData:v7];

    int v25 = +[NNMKMessage messageIdsFromMessages:v19];
    uint64_t v26 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
    if (v7) {
      uint64_t v26 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
    }
    v27 = [*(id *)((char *)&self->super.super.isa + *v26) sendMoreMessagesForConversation:v24];
    uint64_t v28 = [(NNMKSyncProvider *)self resendScheduler];
    [v28 registerIDSIdentifier:v27 objectIds:v25 type:@"Message" resendInterval:0];

    [(NNMKSyncProvider *)self _requestDelegateForContentForMessageIds:v25 highPriority:0];
  }
  else
  {
    uint64_t v29 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v29, OS_LOG_TYPE_DEFAULT, "MobileMail responded for #LOAD_MORE_MESSAGES conversation request but we were actually expecting another response.", buf, 2u);
    }
  }
}

- (void)replyWithMessagesToSendAsFetchResponse:(id)a3 includesProtectedMessages:(BOOL)a4
{
  id v5 = a3;
  providerQueue = self->_providerQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__NNMKSyncProvider_replyWithMessagesToSendAsFetchResponse_includesProtectedMessages___block_invoke;
  v8[3] = &unk_264E99F48;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(providerQueue, v8);
}

uint64_t __85__NNMKSyncProvider_replyWithMessagesToSendAsFetchResponse_includesProtectedMessages___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    BOOL v4 = v2;
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = [v3 count];
    _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "MobileMail replied with full headers messages for %lu message IDs for #BATCHED_RESPONSE. Checking if we can now send batch back to Watch...", buf, 0xCu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        id v11 = objc_msgSend(*(id *)(a1 + 40), "batchRequestHandler", (void)v13);
        [v11 handleMessageAdded:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return [*(id *)(a1 + 40) _checkBatchFetchedMessages];
}

- (void)replyWithMessagesToResend:(id)a3 includesProtectedMessages:(BOOL)a4
{
  id v6 = a3;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__NNMKSyncProvider_replyWithMessagesToResend_includesProtectedMessages___block_invoke;
  block[3] = &unk_264E9A9A0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(providerQueue, block);
}

void __72__NNMKSyncProvider_replyWithMessagesToResend_includesProtectedMessages___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) syncController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__NNMKSyncProvider_replyWithMessagesToResend_includesProtectedMessages___block_invoke_2;
  v4[3] = &unk_264E9A978;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 48);
  [v2 groupMessagesByMailbox:v3 mailboxes:0 block:v4];
}

uint64_t __72__NNMKSyncProvider_replyWithMessagesToResend_includesProtectedMessages___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _replyWithMessagesToResend:a2 includesProtectedMessages:*(unsigned __int8 *)(a1 + 40) mailbox:a3];
}

- (void)_replyWithMessagesToResend:(id)a3 includesProtectedMessages:(BOOL)a4 mailbox:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ([v9 syncActive])
  {
    id v10 = [(NNMKSyncProvider *)self persistenceHandler];
    BOOL v11 = [v10 addMessagesToResend:v8 mailbox:v9 isProtectedData:v6];

    id v12 = [v11 messageIdsWithDefaultPriority];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      long long v14 = &OBJC_IVAR___NNMKSyncProvider__messagesSyncService;
      if (v6) {
        long long v14 = &OBJC_IVAR___NNMKSyncProvider__protectedSyncService;
      }
      id v15 = *(id *)((char *)&self->super.super.isa + *v14);
      long long v16 = [v11 protoMessagesWithDefaultPriority];
      uint64_t v17 = [v15 addMessages:v16 notificationPriority:0];

      uint64_t v18 = [(NNMKSyncProvider *)self resendScheduler];
      uint64_t v19 = [v11 messageIdsWithDefaultPriority];
      objc_msgSend(v18, "registerIDSIdentifier:objectIds:type:resendInterval:", v17, v19, @"Message", objc_msgSend(v11, "resendInterval"));

      uint64_t v20 = (void *)qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = v20;
        uint64_t v22 = [v11 messageIdsWithDefaultPriority];
        int v23 = 134218498;
        uint64_t v24 = [v22 count];
        __int16 v25 = 2114;
        uint64_t v26 = v17;
        __int16 v27 = 2048;
        uint64_t v28 = [v11 resendInterval];
        _os_log_impl(&dword_23D3DF000, v21, OS_LOG_TYPE_DEFAULT, "Messages RESENT (Count: %lu - IDS Identifier: %{public}@ - Resend Interval: %lu).", (uint8_t *)&v23, 0x20u);
      }
    }
  }
}

- (void)replyWithAccountToResend:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __45__NNMKSyncProvider_replyWithAccountToResend___block_invoke;
  v7[3] = &unk_264E99F48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

void __45__NNMKSyncProvider_replyWithAccountToResend___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v1)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3)
    {
      id v4 = [v3 accountId];
      char v5 = [v1 syncedAccountForAccountWithId:v4];

      if (v5 && ([v5 resendRequested] & 1) != 0)
      {
        id v6 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = *(void **)(a1 + 40);
          id v8 = v6;
          id v9 = [v7 accountId];
          *(_DWORD *)buf = 138543362;
          long long v49 = v9;
          _os_log_impl(&dword_23D3DF000, v8, OS_LOG_TYPE_DEFAULT, "Account RESENT (Id: %{public}@).", buf, 0xCu);
        }
        [*(id *)(*(void *)(a1 + 32) + 72) beginUpdates];
        id v10 = objc_alloc_init(NNMKProtoAccountAdditionOrUpdate);
        BOOL v11 = [*(id *)(a1 + 40) accountId];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setAccountId:v11];

        id v12 = [*(id *)(a1 + 40) displayName];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setDisplayName:v12];

        -[NNMKProtoAccountAdditionOrUpdate setShouldArchive:](v10, "setShouldArchive:", [*(id *)(a1 + 40) shouldArchive]);
        -[NNMKProtoAccountAdditionOrUpdate setFullSyncVersion:](v10, "setFullSyncVersion:", [*(id *)(*(void *)(a1 + 32) + 72) fullSyncVersion]);
        uint64_t v13 = [*(id *)(a1 + 40) username];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setUsername:v13];

        long long v14 = [*(id *)(a1 + 40) localId];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setLocalId:v14];

        id v15 = [*(id *)(a1 + 40) parentAccountIdentifier];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setParentId:v15];

        long long v16 = [*(id *)(a1 + 40) typeIdentifier];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setTypeIdentifier:v16];

        uint64_t v17 = [*(id *)(a1 + 40) emailAddressToken];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setEmailAddressToken:v17];

        uint64_t v18 = [*(id *)(a1 + 40) pccEmailAddress];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setPccEmailAddress:v18];

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v19 = objc_msgSend(*(id *)(a1 + 40), "emailAddresses", 0);
        uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v43;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v43 != v22) {
                objc_enumerationMutation(v19);
              }
              [(NNMKProtoAccountAdditionOrUpdate *)v10 addEmail:*(void *)(*((void *)&v42 + 1) + 8 * v23++)];
            }
            while (v21 != v23);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
          }
          while (v21);
        }

        uint64_t v24 = [*(id *)(a1 + 40) defaultEmailAddress];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setDefaultEmail:v24];

        __int16 v25 = [*(id *)(a1 + 32) persistenceHandler];
        uint64_t v26 = [v25 updateMailboxListForAccount:*(void *)(a1 + 40) mailboxListChanged:0];
        [(NNMKProtoAccountAdditionOrUpdate *)v10 setMailboxes:v26];

        uint64_t v27 = [v5 resendInterval];
        uint64_t v28 = [*(id *)(a1 + 40) displayName];
        [v5 setDisplayName:v28];

        objc_msgSend(v5, "setShouldArchive:", objc_msgSend(*(id *)(a1 + 40), "shouldArchive"));
        uint64_t v29 = [*(id *)(a1 + 40) emailAddresses];
        [v5 setEmailAddresses:v29];

        long long v30 = [*(id *)(a1 + 40) defaultEmailAddress];
        [v5 setDefaultEmailAddress:v30];

        long long v31 = [*(id *)(a1 + 40) typeIdentifier];
        [v5 setTypeIdentifier:v31];

        long long v32 = [*(id *)(a1 + 40) emailAddressToken];
        [v5 setEmailAddressToken:v32];

        long long v33 = [*(id *)(a1 + 40) pccEmailAddress];
        [v5 setPccEmailAddress:v33];

        [v5 setResendRequested:0];
        [v5 setResendInterval:0];
        [*(id *)(*(void *)(a1 + 32) + 72) addOrUpdateSyncedAccount:v5];
        long long v34 = [*(id *)(*(void *)(a1 + 32) + 104) addOrUpdateAccount:v10];
        uint64_t v35 = [*(id *)(a1 + 32) resendScheduler];
        long long v36 = [*(id *)(a1 + 40) accountId];
        uint64_t v46 = v36;
        uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
        [v35 registerIDSIdentifier:v34 objectIds:v37 type:@"Account" resendInterval:v27];

        [*(id *)(*(void *)(a1 + 32) + 72) endUpdates];
      }
      else
      {
        uint64_t v38 = (void *)qword_26AC21850;
        if (!os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:

          return;
        }
        __int16 v39 = *(void **)(a1 + 40);
        id v10 = v38;
        unint64_t v40 = [v39 accountId];
        *(_DWORD *)buf = 138543362;
        long long v49 = v40;
        _os_log_impl(&dword_23D3DF000, &v10->super.super, OS_LOG_TYPE_DEFAULT, "Unexpected reply from delegate for 'account to resend' (Id: %{public}@).", buf, 0xCu);
      }
      goto LABEL_18;
    }
    __int16 v41 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v41, OS_LOG_TYPE_DEFAULT, "Account does not exist anymore. It will not resend", buf, 2u);
    }
  }
}

- (void)replyWithMessageSendingProgress:(int64_t)a3 forComposedMessageId:(id)a4
{
  id v6 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__NNMKSyncProvider_replyWithMessageSendingProgress_forComposedMessageId___block_invoke;
  block[3] = &unk_264E9A488;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(providerQueue, block);
}

void __73__NNMKSyncProvider_replyWithMessageSendingProgress_forComposedMessageId___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 72) hasMailboxSyncedActive])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2 == 0x7FFFFFFF || v2 == -1) {
      [*(id *)(*(void *)(a1 + 32) + 72) removeProgressForComposedMessageWithId:*(void *)(a1 + 40)];
    }
    else {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setProgress:forComposedMessageWithId:");
    }
    id v4 = objc_alloc_init(NNMKProtoComposedMessageSendingProgressReport);
    [(NNMKProtoComposedMessageSendingProgressReport *)v4 setComposedMessageId:*(void *)(a1 + 40)];
    [(NNMKProtoComposedMessageSendingProgressReport *)v4 setProgress:*(unsigned int *)(a1 + 48)];
    char v5 = [*(id *)(*(void *)(a1 + 32) + 112) reportComposedMessageSendingProgress:v4];
    id v6 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v5;
      _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Sending progress for composed message (Id: %{public}@ - Progress: %li - IDS Identifier: %{public}@)...", buf, 0x20u);
    }
    id v9 = [*(id *)(a1 + 32) resendScheduler];
    uint64_t v12 = *(void *)(a1 + 40);
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    [v9 registerIDSIdentifier:v5 objectIds:v10 type:@"SendingProgress" resendInterval:0];

    if (*(void *)(a1 + 48) == -1)
    {
      int64_t v11 = +[NNMKAnalytics sharedInstance];
      [v11 reportMessageDeliveryFailedInMode:0];
    }
  }
}

- (void)addMessages:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __32__NNMKSyncProvider_addMessages___block_invoke;
  v7[3] = &unk_264E99F48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

void __32__NNMKSyncProvider_addMessages___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) syncController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__NNMKSyncProvider_addMessages___block_invoke_2;
  v4[3] = &unk_264E9A9C8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 groupMessagesByMailbox:v3 mailboxes:0 block:v4];
}

uint64_t __32__NNMKSyncProvider_addMessages___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _addMessages:a2 mailbox:a3];
}

- (void)_addMessages:(id)a3 mailbox:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 syncActive];
  id v9 = (void *)qword_26AC21850;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      int64_t v11 = [v7 mailboxId];
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2048;
      uint64_t v15 = [v6 count];
      _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "Adding new messages for mailbox. %{public}@ - count: %lu", (uint8_t *)&v12, 0x16u);
    }
    [(NNMKSyncProvider *)self _addMessages:v6 messagesAreNew:1 mailbox:v7];
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider _addMessages:mailbox:](v9, v7, (uint64_t)v6);
  }
}

- (void)updateMessagesStatus:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __41__NNMKSyncProvider_updateMessagesStatus___block_invoke;
  v7[3] = &unk_264E99F48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

void __41__NNMKSyncProvider_updateMessagesStatus___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) syncController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__NNMKSyncProvider_updateMessagesStatus___block_invoke_2;
  v4[3] = &unk_264E9A9C8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 groupMessagesByMailbox:v3 mailboxes:0 block:v4];
}

uint64_t __41__NNMKSyncProvider_updateMessagesStatus___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateMessagesStatus:a2 mailbox:a3];
}

- (void)_updateMessagesStatus:(id)a3 mailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 syncActive])
  {
    id v8 = [(NNMKSyncProvider *)self persistenceHandler];
    id v9 = [v8 updateMessagesStatus:v6 mailbox:v7];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __50__NNMKSyncProvider__updateMessagesStatus_mailbox___block_invoke;
    v27[3] = &unk_264E9A9F0;
    v27[4] = self;
    id v10 = (void (**)(void, void, void, void, void))MEMORY[0x23ED00AC0](v27);
    messagesSyncService = self->_messagesSyncService;
    int v12 = [v9 protoMessageUpdatesWithNotificationPriority];
    uint64_t v13 = [v9 messageIdsWithNotificationPriority];
    ((void (**)(void, NNMKMessagesSyncServiceServer *, void *, void *, uint64_t))v10)[2](v10, messagesSyncService, v12, v13, 1);

    __int16 v14 = self->_messagesSyncService;
    uint64_t v15 = [v9 protoMessageUpdatesWithDefaultPriority];
    uint64_t v16 = [v9 messageIdsWithDefaultPriority];
    ((void (**)(void, NNMKMessagesSyncServiceServer *, void *, void *, void))v10)[2](v10, v14, v15, v16, 0);

    protectedSyncService = self->_protectedSyncService;
    uint64_t v18 = [v9 protoMessageUpdatesWithDefaultPriorityAndProtectedChannel];
    uint64_t v19 = [v9 messageIdsWithDefaultPriorityAndProtectedChannel];
    ((void (**)(void, NNMKProtectedSyncServiceServer *, void *, void *, void))v10)[2](v10, protectedSyncService, v18, v19, 0);

    uint64_t v20 = [v9 messageIdsToDelete];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      uint64_t v22 = [v9 messageIdsToDelete];
      [(NNMKSyncProvider *)self deleteMessagesWithIds:v22];
    }
    uint64_t v23 = [v9 messagesToAdd];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      __int16 v25 = [v9 messagesToAdd];
      [(NNMKSyncProvider *)self _addMessages:v25 messagesAreNew:0 mailbox:v7];
    }
  }
  else
  {
    uint64_t v26 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider _updateMessagesStatus:mailbox:](v26, v7, (uint64_t)v6);
    }
  }
}

void __50__NNMKSyncProvider__updateMessagesStatus_mailbox___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v13 = a2;
  id v9 = a3;
  id v10 = a4;
  if ([v9 messageStatusUpdatesCount])
  {
    int64_t v11 = [v13 updateMessagesStatus:v9 notificationPriority:a5];
    int v12 = [*(id *)(a1 + 32) resendScheduler];
    [v12 registerIDSIdentifier:v11 objectIds:v10 type:@"Message" resendInterval:0];
  }
}

- (void)deleteMessagesWithIds:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __42__NNMKSyncProvider_deleteMessagesWithIds___block_invoke;
  v7[3] = &unk_264E99F48;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

void __42__NNMKSyncProvider_deleteMessagesWithIds___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*(void *)(a1 + 40) + 72) syncedMessageForMessageWithId:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v9 = [*(id *)(a1 + 40) syncController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__NNMKSyncProvider_deleteMessagesWithIds___block_invoke_2;
  v10[3] = &unk_264E9A9C8;
  v10[4] = *(void *)(a1 + 40);
  [v9 groupMessagesByMailbox:v2 mailboxes:0 block:v10];
}

void __42__NNMKSyncProvider_deleteMessagesWithIds___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = +[NNMKMessage messageIdsFromMessages:a2];
  [v4 _deleteMessagesWithIds:v6 mailbox:v5];
}

- (void)_deleteMessagesWithIds:(id)a3 mailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 syncActive])
  {
    id v8 = [(NNMKSyncProvider *)self persistenceHandler];
    id v9 = [v8 deleteMessagesWithIds:v6 mailbox:v7];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __51__NNMKSyncProvider__deleteMessagesWithIds_mailbox___block_invoke;
    v20[3] = &unk_264E9AA18;
    v20[4] = self;
    id v10 = (void (**)(void, void, void, void, void))MEMORY[0x23ED00AC0](v20);
    protectedSyncService = self->_protectedSyncService;
    long long v12 = [v9 protectedProtobuf];
    long long v13 = [v9 protectedMessageIds];
    ((void (**)(void, NNMKProtectedSyncServiceServer *, void *, void *, void))v10)[2](v10, protectedSyncService, v12, v13, 0);

    messagesSyncService = self->_messagesSyncService;
    uint64_t v15 = [v9 unprotectedNotificationProtobuf];
    uint64_t v16 = [v9 unprotectedNotificationMessageIds];
    ((void (**)(void, NNMKMessagesSyncServiceServer *, void *, void *, uint64_t))v10)[2](v10, messagesSyncService, v15, v16, 1);

    __int16 v17 = self->_messagesSyncService;
    uint64_t v18 = [v9 unprotectedDefaultProtobuf];
    uint64_t v19 = [v9 unprotectedDefaultMessageIds];
    ((void (**)(void, NNMKMessagesSyncServiceServer *, void *, void *, void))v10)[2](v10, v17, v18, v19, 0);
  }
}

void __51__NNMKSyncProvider__deleteMessagesWithIds_mailbox___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if ([v10 messageDeletionsCount])
  {
    long long v12 = [v9 deleteMessages:v10 notificationPriority:a5];
    long long v13 = [*(id *)(a1 + 32) resendScheduler];
    [v13 registerIDSIdentifier:v12 objectIds:v11 type:@"Message" resendInterval:0];

    long long v14 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_impl(&dword_23D3DF000, v14, OS_LOG_TYPE_DEFAULT, "Deletion operation sent to watch. (IDS Identifier: %{public}@, Channel: %{public}@)", buf, 0x16u);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(a1 + 32), "_requestDelegateToStopDownloadingMessageElementsForMessageWithId:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (void)updateConversationId:(id)a3 notify:(BOOL)a4 messages:(id)a5
{
  if (a4) {
    [(NNMKSyncProvider *)self markConversationIdForNotify:a3 messages:a5 includesProtectedMessages:0];
  }
  else {
    -[NNMKSyncProvider markConversationIdForNotNotify:](self, "markConversationIdForNotNotify:", a3, a4, a5);
  }
}

- (void)updateConversationId:(id)a3 mute:(BOOL)a4
{
  id v6 = a3;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NNMKSyncProvider_updateConversationId_mute___block_invoke;
  block[3] = &unk_264E9A9A0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(providerQueue, block);
}

void __46__NNMKSyncProvider_updateConversationId_mute___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 72) syncedMessagesForConversationWithId:*(void *)(a1 + 40)];
  if ([v2 count])
  {
    id v3 = [*(id *)(a1 + 32) syncController];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_2;
    v6[3] = &unk_264E9AA40;
    id v4 = *(id *)(a1 + 40);
    char v9 = *(unsigned char *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = v4;
    uint64_t v8 = v5;
    [v3 groupMessagesByMailbox:v2 mailboxes:0 block:v6];
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
  {
    __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_cold_1();
  }
}

void __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 syncActive])
  {
    uint64_t v5 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      _os_log_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_DEFAULT, "Conversation muted status updated (Id: %{public}@, Muted: %lu).", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 40) _markConversationWithId:*(void *)(a1 + 32) forState:2048 include:*(unsigned __int8 *)(a1 + 48) mailbox:v4];
  }
}

- (void)markConversationIdForNotify:(id)a3 messages:(id)a4 includesProtectedMessages:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  providerQueue = self->_providerQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke;
  v13[3] = &unk_264E9AA68;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  BOOL v17 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(providerQueue, v13);
}

void __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(id **)(a1 + 40);
  if (v3)
  {
    id v4 = [v2 syncController];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_46;
    v10[3] = &unk_264E9AA40;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    id v11 = v6;
    char v12 = *(unsigned char *)(a1 + 56);
    [v4 groupMessagesByMailbox:v5 mailboxes:0 block:v10];
  }
  else
  {
    uint64_t v7 = [v2[9] syncedMessagesForConversationWithId:*(void *)(a1 + 48)];
    if ([v7 count])
    {
      id v8 = [*(id *)(a1 + 40) syncController];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_2;
      v13[3] = &unk_264E9AA40;
      id v9 = *(void **)(a1 + 48);
      void v13[4] = *(void *)(a1 + 40);
      id v14 = v9;
      char v15 = *(unsigned char *)(a1 + 56);
      [v8 groupMessagesByMailbox:v7 mailboxes:0 block:v13];
    }
    else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
    {
      __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_cold_1();
    }
  }
}

uint64_t __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _markConversationIdForNotify:*(void *)(a1 + 40) messages:0 includesProtectedMessages:*(unsigned __int8 *)(a1 + 48) mailbox:a3];
}

uint64_t __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _markConversationIdForNotify:*(void *)(a1 + 40) messages:a2 includesProtectedMessages:*(unsigned __int8 *)(a1 + 48) mailbox:a3];
}

- (void)_markConversationIdForNotify:(id)a3 messages:(id)a4 includesProtectedMessages:(BOOL)a5 mailbox:(id)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v11 syncActive])
  {
    char v12 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v9;
      _os_log_impl(&dword_23D3DF000, v12, OS_LOG_TYPE_DEFAULT, "Conversation marked for notify (Id: %{public}@).", (uint8_t *)&v13, 0xCu);
    }
    [(NNMKSyncProvider *)self _markConversationWithId:v9 forState:128 include:1 mailbox:v11];
    if (v10) {
      [(NNMKSyncProvider *)self _addMessages:v10 mailbox:v11];
    }
  }
}

- (void)markConversationIdForNotNotify:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __51__NNMKSyncProvider_markConversationIdForNotNotify___block_invoke;
  v7[3] = &unk_264E99F48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

void __51__NNMKSyncProvider_markConversationIdForNotNotify___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 72) syncedMessagesForConversationWithId:*(void *)(a1 + 40)];
  if ([v2 count])
  {
    uint64_t v3 = [*(id *)(a1 + 32) syncController];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__NNMKSyncProvider_markConversationIdForNotNotify___block_invoke_2;
    v6[3] = &unk_264E9A950;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = v4;
    uint64_t v8 = v5;
    [v3 groupMessagesByMailbox:v2 mailboxes:0 block:v6];
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
  {
    __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_cold_1();
  }
}

void __51__NNMKSyncProvider_markConversationIdForNotNotify___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 syncActive])
  {
    uint64_t v5 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_DEFAULT, "Conversation marked for stop notifying (Id: %{public}@).", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 40) _markConversationWithId:*(void *)(a1 + 32) forState:128 include:0 mailbox:v4];
  }
}

- (void)addMessageContent:(id)a3 forMessage:(id)a4 loadedProtected:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  providerQueue = self->_providerQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__NNMKSyncProvider_addMessageContent_forMessage_loadedProtected___block_invoke;
  v13[3] = &unk_264E9AA68;
  void v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  BOOL v16 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(providerQueue, v13);
}

void __65__NNMKSyncProvider_addMessageContent_forMessage_loadedProtected___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) syncController];
  uint64_t v3 = a1 + 40;
  id v4 = [*(id *)(a1 + 40) mailboxId];
  uint64_t v5 = [v2 mailboxWithId:v4];

  if (v5)
  {
    [*(id *)(a1 + 32) _addMessageContent:*(void *)(a1 + 48) forMessage:*(void *)(a1 + 40) loadedProtected:*(unsigned __int8 *)(a1 + 56) mailbox:v5];
  }
  else
  {
    uint64_t v6 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __65__NNMKSyncProvider_addMessageContent_forMessage_loadedProtected___block_invoke_cold_1(v3, v6);
    }
  }
}

- (void)_addMessageContent:(id)a3 forMessage:(id)a4 loadedProtected:(BOOL)a5 mailbox:(id)a6
{
  BOOL v7 = a5;
  v77[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v12 syncActive])
  {
    int v13 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_INFO))
    {
      id v14 = v13;
      id v15 = [v11 mailboxId];
      *(_DWORD *)buf = 138543362;
      long long v64 = v15;
      _os_log_impl(&dword_23D3DF000, v14, OS_LOG_TYPE_INFO, "Received message content from MobileMail - Id %{public}@", buf, 0xCu);
    }
    BOOL v16 = [v10 messageId];

    if (v16)
    {
      BOOL v17 = +[NNMKAnalytics sharedInstance];
      objc_msgSend(v17, "reportOriginalMessageContentSizeInBytes:source:", objc_msgSend(v10, "originalContentSize"), 0);

      uint64_t v18 = [(NNMKSyncProvider *)self persistenceHandler];
      uint64_t v19 = [v18 addMessageContent:v10 forMessage:v11 mailbox:v12 isProtectedData:v7];

      long long v20 = [v19 protoMessageContentSync];

      if (!v20)
      {
        __int16 v25 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = v25;
          __int16 v27 = [v10 messageId];
          int v28 = [v19 messageDoesNotExist] ^ 1;
          int v29 = [v19 alreadySyncedWithCurrentPriority];
          *(_DWORD *)buf = 138543874;
          long long v64 = v27;
          __int16 v65 = 1024;
          int v66 = v28;
          __int16 v67 = 1024;
          int v68 = v29;
          _os_log_impl(&dword_23D3DF000, v26, OS_LOG_TYPE_DEFAULT, "Message Content ADDED but not synced (Message Id: %{public}@ Message Had Been Synced: %d, Already Synced With Current Priority: %d).", buf, 0x18u);
        }
        goto LABEL_26;
      }
      if (v7)
      {
        long long v21 = [(NNMKSyncProvider *)self currentDeviceRegistry];
        int v22 = [v21 protectedContentChannelSupported];
        long long v23 = &OBJC_IVAR___NNMKSyncProvider__contentSyncService;
        if (v22) {
          long long v23 = &OBJC_IVAR___NNMKSyncProvider__protectedContentSyncService;
        }
        uint64_t v24 = (NNMKMessageContentSyncServiceServer *)*(id *)((char *)&self->super.super.isa + *v23);
      }
      else
      {
        uint64_t v24 = self->_contentSyncService;
      }
      long long v30 = [v19 protoMessageContentSync];
      uint64_t v61 = v24;
      uint64_t v62 = -[NNMKMessageContentSyncServiceServer syncMessageContent:notificationPriority:userRequested:](v24, "syncMessageContent:notificationPriority:userRequested:", v30, [v19 isNotificationPriority], objc_msgSend(v19, "isUserRequest"));

      long long v31 = [(NNMKSyncProvider *)self sessionController];
      long long v32 = [v31 notificationPayloadAcks];
      long long v33 = [v10 messageId];
      uint64_t v34 = [v32 objectForKeyedSubscript:v33];
      if (v34)
      {
        uint64_t v35 = (void *)v34;
        int v36 = [v19 isNotificationPriority];

        if (!v36)
        {
LABEL_21:
          long long v44 = [(NNMKSyncProvider *)self resendScheduler];
          long long v45 = [v10 messageId];
          v77[0] = v45;
          uint64_t v46 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v19, "isUserRequest"));
          id v47 = [v46 stringValue];
          v77[1] = v47;
          long long v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
          objc_msgSend(v44, "registerIDSIdentifier:objectIds:type:resendInterval:", v62, v48, @"MessageContent", objc_msgSend(v19, "resendInterval"));

          long long v49 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            log = v49;
            __int16 v59 = [v10 messageId];
            int v58 = [v19 isNotificationPriority];
            int v50 = [v19 isUserRequest];
            long long v51 = [v10 textData];
            uint64_t v52 = [v51 length];
            uint64_t v53 = [v19 compressedTextDataLength];
            uint64_t v54 = [v19 protoMessageContentSync];
            int v55 = [v54 fullSyncVersion];
            *(_DWORD *)buf = 138544898;
            long long v64 = v59;
            __int16 v65 = 1024;
            int v66 = v58;
            __int16 v67 = 1024;
            int v68 = v50;
            __int16 v69 = 2048;
            uint64_t v70 = v52;
            __int16 v71 = 2048;
            uint64_t v72 = v53;
            __int16 v73 = 2114;
            __int16 v74 = v62;
            __int16 v75 = 1024;
            int v76 = v55;
            _os_log_impl(&dword_23D3DF000, log, OS_LOG_TYPE_DEFAULT, "Message Content ADDED (Id: %{public}@ - Notification Priority: %d - User Requested: %d - Data Length: %lu - Compressed Data Length: %lu - IDS Identifier: %{public}@ (#sync-version: %u)).", buf, 0x3Cu);
          }
          if ([v19 isContentCompletelySynced])
          {
            unint64_t v56 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
            __int16 v57 = [v11 messageId];
            [v56 updateProgressWithContentCompletelySyncedForMessageId:v57];
          }
LABEL_26:

          goto LABEL_27;
        }
        uint64_t v37 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = v37;
          __int16 v39 = [v10 messageId];
          *(_DWORD *)buf = 138543362;
          long long v64 = v39;
          _os_log_impl(&dword_23D3DF000, v38, OS_LOG_TYPE_DEFAULT, "Notifying BulletinDistributor Ping Subscriber that we synced content for notification. (Message Id: %{public}@)", buf, 0xCu);
        }
        unint64_t v40 = [(NNMKSyncProvider *)self sessionController];
        __int16 v41 = [v40 notificationPayloadAcks];
        long long v42 = [v10 messageId];
        long long v43 = [v41 objectForKeyedSubscript:v42];
        v43[2](v43, 1);

        long long v31 = [(NNMKSyncProvider *)self sessionController];
        long long v32 = [v31 notificationPayloadAcks];
        long long v33 = [v10 messageId];
        [v32 setObject:0 forKeyedSubscript:v33];
      }

      goto LABEL_21;
    }
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider _addMessageContent:forMessage:loadedProtected:mailbox:]();
    }
  }
LABEL_27:
}

- (void)reportMessageContentDownloadFailureForMessageId:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __68__NNMKSyncProvider_reportMessageContentDownloadFailureForMessageId___block_invoke;
  v7[3] = &unk_264E99F48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

void __68__NNMKSyncProvider_reportMessageContentDownloadFailureForMessageId___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) syncController];
  id v4 = [v2 mailboxForMessageWithId:*(void *)(a1 + 40)];

  uint64_t v3 = v4;
  if (v4)
  {
    [*(id *)(a1 + 32) _reportMessageContentDownloadFailureForMessageId:*(void *)(a1 + 40) mailbox:v4];
    uint64_t v3 = v4;
  }
}

- (void)_reportMessageContentDownloadFailureForMessageId:(id)a3 mailbox:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 syncActive])
  {
    id v8 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = v6;
      _os_log_impl(&dword_23D3DF000, v8, OS_LOG_TYPE_DEFAULT, "Reported failure downloading content for message (Id: %{public}@).", (uint8_t *)&v18, 0xCu);
    }
    id v9 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncedMessageForMessageWithId:v6];
    if (v9)
    {
      id v10 = objc_alloc_init(NNMKProtoErrorDownloadingContentForMessageWarning);
      id v11 = [(NNMKSyncProvider *)self syncController];
      id v12 = [v11 watchMessageIdFromMessageId:v6];
      [(NNMKProtoErrorDownloadingContentForMessageWarning *)v10 setMessageId:v12];

      int v13 = [v7 mailboxId];
      [(NNMKProtoErrorDownloadingContentForMessageWarning *)v10 setMailboxId:v13];

      fetchesSyncService = self->_fetchesSyncService;
      uint64_t v15 = [v9 usedNotificationPriorityForMessageSync];
      if ([v9 contentSyncedBecauseUserRequested]) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = [v9 contentRequestedByUser];
      }
      [(NNMKFetchesSyncServiceServer *)fetchesSyncService warnErrorDownloadingContentForMessage:v10 notificationPriority:v15 userRequested:v16];
      [v9 setContentRequestedByUser:0];
      BOOL v17 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
      [v17 updateProgressWithMessageContentDownloadFailed:v6];

      [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry addOrUpdateSyncedMessage:v9];
    }
  }
}

- (void)addAttachmentData:(id)a3 forMessageId:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__NNMKSyncProvider_addAttachmentData_forMessageId_contentId_loadedProtected___block_invoke;
  block[3] = &unk_264E9AA90;
  void block[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  BOOL v21 = a6;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(providerQueue, block);
}

void __77__NNMKSyncProvider_addAttachmentData_forMessageId_contentId_loadedProtected___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) syncController];
  id v4 = [v2 mailboxForMessageWithId:*(void *)(a1 + 40)];

  uint64_t v3 = v4;
  if (v4)
  {
    [*(id *)(a1 + 32) _addAttachmentData:*(void *)(a1 + 48) forMessageId:*(void *)(a1 + 40) contentId:*(void *)(a1 + 56) loadedProtected:*(unsigned __int8 *)(a1 + 64) mailbox:v4];
    uint64_t v3 = v4;
  }
}

- (void)addImageAttachment:(id)a3 forMessageId:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__NNMKSyncProvider_addImageAttachment_forMessageId_contentId_loadedProtected___block_invoke;
  block[3] = &unk_264E9AA90;
  void block[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  BOOL v21 = a6;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(providerQueue, block);
}

void __78__NNMKSyncProvider_addImageAttachment_forMessageId_contentId_loadedProtected___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) syncController];
  id v4 = [v2 mailboxForMessageWithId:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v3 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 48), 0.9);
    [*(id *)(a1 + 32) _addAttachmentData:v3 forMessageId:*(void *)(a1 + 40) contentId:*(void *)(a1 + 56) loadedProtected:*(unsigned __int8 *)(a1 + 64) mailbox:v4];
  }
}

- (void)_addAttachmentData:(id)a3 forMessageId:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6 mailbox:(id)a7
{
  BOOL v8 = a6;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([a7 syncActive])
  {
    if (v12)
    {
      id v15 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncedMessageForMessageWithId:v13];
      int v16 = [v15 contentSyncedUsingNotificationPriority];
      unsigned int v44 = [v15 contentSyncedBecauseUserRequested];
      BOOL v17 = [v15 attachmentsContentIdsNotYetSynced];
      int v18 = [v17 containsObject:v14];

      [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry beginUpdates];
      if (v15) {
        BOOL v21 = v18 == 0;
      }
      else {
        BOOL v21 = 1;
      }
      if (v21)
      {
        int v22 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          id v46 = v13;
          __int16 v47 = 2114;
          id v48 = v14;
          __int16 v49 = 1024;
          *(_DWORD *)int v50 = v15 != 0;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = v18;
          _os_log_impl(&dword_23D3DF000, v22, OS_LOG_TYPE_DEFAULT, "Attachment ADDED but not synced (Message Id: %{public}@, Content Id: %{public}@, Message Had Been Synced: %d, Attachment Not Yet Synced: %d).", buf, 0x22u);
        }
      }
      else
      {
        if (v16)
        {
          double v19 = (double)(unint64_t)[v12 length];
          double v20 = 1048576.0;
          BOOL v43 = v19 <= 1048576.0;
        }
        else
        {
          BOOL v43 = 0;
        }
        double v24 = (double)(unint64_t)objc_msgSend(v12, "length", v19, v20);
        if (v24 > 2097152.0)
        {
          objc_msgSend(MEMORY[0x263EFF8F8], "data", v24, 2097152.0);
        }
        id v25 = v12;
        uint64_t v26 = objc_alloc_init(NNMKProtoAttachmentSync);
        [(NNMKProtoAttachmentSync *)v26 setFullSyncVersion:[(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion]];
        __int16 v27 = (void *)MEMORY[0x263F08910];
        int v28 = [MEMORY[0x263EFF910] date];
        int v29 = [v27 archivedDataWithRootObject:v28 requiringSecureCoding:1 error:0];
        [(NNMKProtoAttachmentSync *)v26 setDateSynced:v29];

        long long v30 = [(NNMKSyncProvider *)self syncController];
        long long v31 = [v30 watchMessageIdFromMessageId:v13];
        [(NNMKProtoAttachmentSync *)v26 setMessageId:v31];

        long long v32 = [v15 mailboxId];
        [(NNMKProtoAttachmentSync *)v26 setMailboxId:v32];

        long long v33 = [(NNMKSyncProvider *)self syncController];
        uint64_t v34 = [v33 watchAttachmentContentIdFromContentId:v14];
        [(NNMKProtoAttachmentSync *)v26 setContentId:v34];

        [(NNMKProtoAttachmentSync *)v26 setAttachmentData:v25];
        if (v8
          && [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry protectedContentChannelSupported])
        {
          uint64_t v35 = &OBJC_IVAR___NNMKSyncProvider__protectedContentSyncService;
        }
        else
        {
          uint64_t v35 = &OBJC_IVAR___NNMKSyncProvider__contentSyncService;
        }
        id v36 = *(id *)((char *)&self->super.super.isa + *v35);
        uint64_t v37 = [v36 syncAttachment:v26 notificationPriority:v43 userRequested:v44];
        uint64_t v38 = [v15 attachmentsContentIdsNotYetSynced];
        [v38 removeObject:v14];

        __int16 v39 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v40 = v39;
          *(_DWORD *)buf = 138544130;
          id v46 = v13;
          __int16 v47 = 2114;
          id v48 = v14;
          __int16 v49 = 2048;
          *(void *)int v50 = [v25 length];
          *(_WORD *)&v50[8] = 2114;
          long long v51 = v37;
          _os_log_impl(&dword_23D3DF000, v40, OS_LOG_TYPE_DEFAULT, "Attachment ADDED (Message Id: %{public}@, Content Id: %{public}@, Bytes: %lu, - IDS Identifier: %{public}@).", buf, 0x2Au);
        }
      }
      if ([v15 isContentCompletelySynced])
      {
        __int16 v41 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
        long long v42 = [v15 messageId];
        [v41 updateProgressWithContentCompletelySyncedForMessageId:v42];
      }
      [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry addOrUpdateSyncedMessage:v15];
      [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry endUpdates];
    }
    else
    {
      long long v23 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v46 = v13;
        __int16 v47 = 2114;
        id v48 = v14;
        _os_log_impl(&dword_23D3DF000, v23, OS_LOG_TYPE_DEFAULT, "Received data to send = nil. MobileMail probably failed downloading it. Ignoring so we can re-try later upon user request (Message Id: %{public}@ - Content Id: %{public}@).", buf, 0x16u);
      }
    }
  }
}

- (void)reportWillDownloadFirstMessages
{
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NNMKSyncProvider_reportWillDownloadFirstMessages__block_invoke;
  block[3] = &unk_264E99F20;
  void block[4] = self;
  dispatch_async(providerQueue, block);
}

void __51__NNMKSyncProvider_reportWillDownloadFirstMessages__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    id v2 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "MobileMail will download headers for the messages that are part of the #initial-sync. We're ignoring the download for the sake of reporting to PairedSync. Notifying client that we're done sending everything...", v4, 2u);
    }
    uint64_t v3 = [*(id *)(a1 + 32) initialSyncProgressTracker];
    [v3 finishedSendingInitialSyncContentToPairedDevice];
  }
}

- (void)addUpdateOrDeleteAccounts:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __46__NNMKSyncProvider_addUpdateOrDeleteAccounts___block_invoke;
  v7[3] = &unk_264E99F48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

void __46__NNMKSyncProvider_addUpdateOrDeleteAccounts___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v163 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (!v2) {
    return;
  }
  [v2 beginUpdates];
  v126 = [*(id *)(*(void *)(v1 + 32) + 72) allSyncedAccountsKeyedByAccountId];
  v129 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v126, "count"));
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  obuint64_t j = *(id *)(v1 + 40);
  uint64_t v131 = v1;
  uint64_t v127 = [obj countByEnumeratingWithState:&v145 objects:v162 count:16];
  if (!v127)
  {
    int v117 = 0;
    int v123 = 0;
    goto LABEL_53;
  }
  int v117 = 0;
  int v123 = 0;
  uint64_t v124 = *(void *)v146;
  unint64_t v3 = 0x263F08000uLL;
  do
  {
    for (uint64_t i = 0; i != v127; ++i)
    {
      if (*(void *)v146 != v124) {
        objc_enumerationMutation(obj);
      }
      uint64_t v5 = *(void **)(*((void *)&v145 + 1) + 8 * i);
      id v6 = [v5 accountId];
      [v129 addObject:v6];

      id v7 = [v5 accountId];
      id v8 = [v126 objectForKeyedSubscript:v7];

      char v144 = 0;
      id v9 = [*(id *)(v1 + 32) persistenceHandler];
      v130 = [v9 updateMailboxListForAccount:v5 mailboxListChanged:&v144];

      if (v8)
      {
        int v10 = [(NNMKSyncedAccount *)v8 shouldArchive];
        if (v10 == [v5 shouldArchive])
        {
          double v20 = *(void **)(v3 + 2880);
          BOOL v21 = [(NNMKSyncedAccount *)v8 displayName];
          int v22 = [v5 displayName];
          if ([v20 isString:v21 equalToNullableString:v22])
          {
            long long v23 = *(void **)(v3 + 2880);
            double v24 = [(NNMKSyncedAccount *)v8 username];
            id v25 = [v5 username];
            if ([v23 isString:v24 equalToNullableString:v25])
            {
              v114 = v25;
              v118 = v24;
              uint64_t v26 = (void *)MEMORY[0x263EFFA08];
              uint64_t v116 = [(NNMKSyncedAccount *)v8 emailAddresses];
              __int16 v27 = objc_msgSend(v26, "setWithArray:");
              int v28 = (void *)MEMORY[0x263EFFA08];
              uint64_t v29 = [v5 emailAddresses];
              [v28 setWithArray:v29];
              v112 = v115 = v27;
              v113 = (void *)v29;
              if (objc_msgSend(v27, "isEqualToSet:"))
              {
                unint64_t v30 = v3;
                long long v31 = *(void **)(v3 + 2880);
                uint64_t v32 = [(NNMKSyncedAccount *)v8 defaultEmailAddress];
                v110 = [v5 defaultEmailAddress];
                v111 = (void *)v32;
                if (objc_msgSend(v31, "isString:equalToNullableString:", v32))
                {
                  long long v33 = *(void **)(v30 + 2880);
                  uint64_t v34 = [(NNMKSyncedAccount *)v8 typeIdentifier];
                  v108 = [v5 typeIdentifier];
                  v109 = (void *)v34;
                  if (objc_msgSend(v33, "isString:equalToNullableString:", v34))
                  {
                    uint64_t v35 = *(void **)(v30 + 2880);
                    uint64_t v36 = [(NNMKSyncedAccount *)v8 emailAddressToken];
                    v106 = [v5 emailAddressToken];
                    v107 = (void *)v36;
                    if (objc_msgSend(v35, "isString:equalToNullableString:", v36))
                    {
                      uint64_t v37 = *(void **)(v30 + 2880);
                      uint64_t v38 = [(NNMKSyncedAccount *)v8 pccEmailAddress];
                      __int16 v39 = [v5 pccEmailAddress];
                      int v11 = [v37 isString:v38 equalToNullableString:v39] ^ 1;
                    }
                    else
                    {
                      int v11 = 1;
                    }
                    double v24 = v118;
                    unint64_t v40 = (void *)v116;
                    id v25 = v114;
                  }
                  else
                  {
                    int v11 = 1;
                    double v24 = v118;
                    unint64_t v40 = (void *)v116;
                    id v25 = v114;
                  }
                }
                else
                {
                  int v11 = 1;
                  double v24 = v118;
                  unint64_t v40 = (void *)v116;
                  id v25 = v114;
                }
              }
              else
              {
                int v11 = 1;
                double v24 = v118;
                unint64_t v40 = (void *)v116;
                id v25 = v114;
              }
            }
            else
            {
              int v11 = 1;
            }

            uint64_t v1 = v131;
          }
          else
          {
            int v11 = 1;
          }

          if ((v11 & 1) == 0 && !v144)
          {
            __int16 v41 = v130;
            goto LABEL_49;
          }
        }
        else
        {
          int v11 = 1;
        }
        long long v42 = [v5 displayName];
        [(NNMKSyncedAccount *)v8 setDisplayName:v42];

        BOOL v43 = [v5 username];
        [(NNMKSyncedAccount *)v8 setUsername:v43];

        -[NNMKSyncedAccount setShouldArchive:](v8, "setShouldArchive:", [v5 shouldArchive]);
        unsigned int v44 = [v5 emailAddresses];
        [(NNMKSyncedAccount *)v8 setEmailAddresses:v44];

        long long v45 = [v5 defaultEmailAddress];
        [(NNMKSyncedAccount *)v8 setDefaultEmailAddress:v45];

        id v46 = [v5 typeIdentifier];
        [(NNMKSyncedAccount *)v8 setTypeIdentifier:v46];

        __int16 v47 = [v5 emailAddressToken];
        [(NNMKSyncedAccount *)v8 setEmailAddressToken:v47];

        id v48 = [v5 pccEmailAddress];
        [(NNMKSyncedAccount *)v8 setPccEmailAddress:v48];

        if (v11)
        {
          __int16 v49 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            int v50 = v49;
            long long v51 = [v5 accountId];
            uint64_t v52 = [v5 displayName];
            uint64_t v53 = [v5 username];
            int v54 = [v5 shouldArchive];
            int v55 = [v5 emailAddresses];
            unint64_t v56 = objc_msgSend(v55, "nnmk_description");
            *(_DWORD *)buf = 138544386;
            v155 = v51;
            __int16 v156 = 2114;
            uint64_t v157 = (uint64_t)v52;
            __int16 v158 = 2114;
            *(void *)v159 = v53;
            *(_WORD *)&v159[8] = 1024;
            *(_DWORD *)&v159[10] = v54;
            uint64_t v1 = v131;
            __int16 v160 = 2114;
            v161 = v56;
            _os_log_impl(&dword_23D3DF000, v50, OS_LOG_TYPE_DEFAULT, "Account UPDATED (Id: %{public}@ - Display Name: %{public}@ - Username: %{public}@ - Should Archive: %d - Email addresses: %{public}@).", buf, 0x30u);
          }
        }
        double v19 = v130;
        if (v144)
        {
          __int16 v57 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            int v58 = v57;
            __int16 v59 = [v5 accountId];
            uint64_t v60 = [v130 count];
            *(_DWORD *)buf = 138543618;
            v155 = v59;
            __int16 v156 = 2048;
            uint64_t v157 = v60;
            _os_log_impl(&dword_23D3DF000, v58, OS_LOG_TYPE_DEFAULT, "Account mailboxes UPDATED (Id: %{public}@ - New Mailboxes Count: %lu).", buf, 0x16u);
          }
        }
        int v117 = 1;
      }
      else
      {
        id v8 = [[NNMKSyncedAccount alloc] initWithAccount:v5];
        id v12 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = v12;
          id v14 = [v5 accountId];
          id v15 = [v5 displayName];
          int v16 = [v5 shouldArchive];
          BOOL v17 = [v5 emailAddresses];
          int v18 = objc_msgSend(v17, "nnmk_description");
          *(_DWORD *)buf = 138544130;
          v155 = v14;
          __int16 v156 = 2114;
          uint64_t v157 = (uint64_t)v15;
          __int16 v158 = 1024;
          *(_DWORD *)v159 = v16;
          *(_WORD *)&v159[4] = 2114;
          *(void *)&v159[6] = v18;
          _os_log_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_DEFAULT, "Account ADDED (Id: %{public}@ - Display Name: %{public}@ - Should Archive: %d - Email addresses: %{public}@).", buf, 0x26u);

          uint64_t v1 = v131;
        }
        int v123 = 1;
        double v19 = v130;
      }
      uint64_t v61 = objc_alloc_init(NNMKProtoAccountAdditionOrUpdate);
      uint64_t v62 = [v5 accountId];
      [(NNMKProtoAccountAdditionOrUpdate *)v61 setAccountId:v62];

      long long v63 = [v5 displayName];
      [(NNMKProtoAccountAdditionOrUpdate *)v61 setDisplayName:v63];

      -[NNMKProtoAccountAdditionOrUpdate setShouldArchive:](v61, "setShouldArchive:", [v5 shouldArchive]);
      -[NNMKProtoAccountAdditionOrUpdate setFullSyncVersion:](v61, "setFullSyncVersion:", [*(id *)(*(void *)(v1 + 32) + 72) fullSyncVersion]);
      long long v64 = [v5 parentAccountIdentifier];
      [(NNMKProtoAccountAdditionOrUpdate *)v61 setParentId:v64];

      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      __int16 v65 = [v5 emailAddresses];
      uint64_t v66 = [v65 countByEnumeratingWithState:&v140 objects:v153 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v141;
        do
        {
          for (uint64_t j = 0; j != v67; ++j)
          {
            if (*(void *)v141 != v68) {
              objc_enumerationMutation(v65);
            }
            [(NNMKProtoAccountAdditionOrUpdate *)v61 addEmail:*(void *)(*((void *)&v140 + 1) + 8 * j)];
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v140 objects:v153 count:16];
        }
        while (v67);
      }

      uint64_t v70 = [v5 defaultEmailAddress];
      [(NNMKProtoAccountAdditionOrUpdate *)v61 setDefaultEmail:v70];

      __int16 v71 = [v5 username];
      [(NNMKProtoAccountAdditionOrUpdate *)v61 setUsername:v71];

      uint64_t v72 = [v5 localId];
      [(NNMKProtoAccountAdditionOrUpdate *)v61 setLocalId:v72];

      __int16 v73 = [v5 typeIdentifier];
      [(NNMKProtoAccountAdditionOrUpdate *)v61 setTypeIdentifier:v73];

      __int16 v74 = [v5 emailAddressToken];
      [(NNMKProtoAccountAdditionOrUpdate *)v61 setEmailAddressToken:v74];

      __int16 v75 = [v5 pccEmailAddress];
      [(NNMKProtoAccountAdditionOrUpdate *)v61 setPccEmailAddress:v75];

      [(NNMKProtoAccountAdditionOrUpdate *)v61 setMailboxes:v19];
      [*(id *)(*(void *)(v1 + 32) + 72) addOrUpdateSyncedAccount:v8];
      int v76 = [*(id *)(*(void *)(v1 + 32) + 104) addOrUpdateAccount:v61];
      v77 = [*(id *)(v1 + 32) resendScheduler];
      uint64_t v78 = [v5 accountId];
      v152 = v78;
      [MEMORY[0x263EFF8C0] arrayWithObjects:&v152 count:1];
      v79 = __int16 v41 = v19;
      [v77 registerIDSIdentifier:v76 objectIds:v79 type:@"Account" resendInterval:0];

LABEL_49:
      unint64_t v3 = 0x263F08000;
    }
    uint64_t v127 = [obj countByEnumeratingWithState:&v145 objects:v162 count:16];
  }
  while (v127);
LABEL_53:

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v122 = [v126 allKeys];
  uint64_t v80 = [v122 countByEnumeratingWithState:&v136 objects:v151 count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    uint64_t v82 = *(void *)v137;
    uint64_t v119 = *(void *)v137;
    do
    {
      uint64_t v83 = 0;
      id obja = (id)v81;
      do
      {
        if (*(void *)v137 != v82) {
          objc_enumerationMutation(v122);
        }
        v84 = *(void **)(*((void *)&v136 + 1) + 8 * v83);
        if (([v129 containsObject:v84] & 1) == 0)
        {
          v85 = qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v155 = v84;
            _os_log_impl(&dword_23D3DF000, v85, OS_LOG_TYPE_DEFAULT, "Account DELETED (Id: %{public}@).", buf, 0xCu);
          }
          uint64_t v128 = v83;
          v86 = [*(id *)(v1 + 32) sessionController];
          [v86 deleteStandaloneStateForAccountId:v84];

          v87 = objc_alloc_init(NNMKProtoAccountDeletion);
          [(NNMKProtoAccountDeletion *)v87 setAccountId:v84];
          v125 = v87;
          -[NNMKProtoAccountDeletion setFullSyncVersion:](v87, "setFullSyncVersion:", [*(id *)(*(void *)(v1 + 32) + 72) fullSyncVersion]);
          [*(id *)(*(void *)(v1 + 32) + 72) removeSyncedAccountForAccountWithId:v84];
          v88 = [*(id *)(*(void *)(v1 + 32) + 72) mailboxesForAccountId:v84];
          long long v132 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          uint64_t v89 = [v88 countByEnumeratingWithState:&v132 objects:v150 count:16];
          if (v89)
          {
            uint64_t v90 = v89;
            uint64_t v91 = *(void *)v133;
            do
            {
              for (uint64_t k = 0; k != v90; ++k)
              {
                if (*(void *)v133 != v91) {
                  objc_enumerationMutation(v88);
                }
                v93 = *(void **)(*((void *)&v132 + 1) + 8 * k);
                v94 = (void *)qword_26AC21850;
                if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
                {
                  v95 = v94;
                  v96 = [v93 mailboxId];
                  *(_DWORD *)buf = 138543618;
                  v155 = v96;
                  __int16 v156 = 2114;
                  uint64_t v157 = (uint64_t)v84;
                  _os_log_impl(&dword_23D3DF000, v95, OS_LOG_TYPE_DEFAULT, "Mailbox DELETED (Id: %{public}@, Account Id: %{public}@).", buf, 0x16u);

                  uint64_t v1 = v131;
                }
                v97 = *(void **)(*(void *)(v1 + 32) + 72);
                v98 = [v93 mailboxId];
                [v97 deleteMailboxWithId:v98 startTransaction:0];
              }
              uint64_t v90 = [v88 countByEnumeratingWithState:&v132 objects:v150 count:16];
            }
            while (v90);
          }
          v99 = [*(id *)(*(void *)(v1 + 32) + 104) deleteAccount:v125];
          v100 = [*(id *)(v1 + 32) resendScheduler];
          v149 = v84;
          int v123 = 1;
          v101 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v149 count:1];
          [v100 registerIDSIdentifier:v99 objectIds:v101 type:@"Account" resendInterval:0];

          uint64_t v82 = v119;
          uint64_t v81 = (uint64_t)obja;
          uint64_t v83 = v128;
        }
        ++v83;
      }
      while (v83 != v81);
      uint64_t v81 = [v122 countByEnumeratingWithState:&v136 objects:v151 count:16];
    }
    while (v81);
  }

  [*(id *)(*(void *)(v1 + 32) + 72) endUpdates];
  if ((v123 | v117))
  {
    v102 = qword_26AC21860;
    if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v102, OS_LOG_TYPE_DEFAULT, "Requesting watch accounts authentication status from watch due to account update", buf, 2u);
    }
    [*(id *)(v1 + 32) _sendWatchAccountStatusRequest];
  }
  if (v123)
  {
    v103 = [*(id *)(v1 + 32) syncController];
    v104 = [v103 mailboxWithId:@"-1"];

    if (v104)
    {
      v105 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D3DF000, v105, OS_LOG_TYPE_DEFAULT, "Triggering #initial-sync due to account add or deleted.", buf, 2u);
      }
      [*(id *)(v1 + 32) _triggerInitialSync];
    }
  }
}

- (void)updateMailboxSelection:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __43__NNMKSyncProvider_updateMailboxSelection___block_invoke;
  v7[3] = &unk_264E99F48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

void __43__NNMKSyncProvider_updateMailboxSelection___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) _isPaired]) {
    return;
  }
  if (([*(id *)(a1 + 32) _pairedDeviceSupportsMultipleMailboxes] & 1) == 0
    || ![*(id *)(*(void *)(a1 + 32) + 72) fullSyncVersion])
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 72) mailboxWithId:@"-1"];
    uint64_t v5 = [v4 url];

    id v6 = [*(id *)(a1 + 40) mailboxesWithAllMessagesSyncEnabled];
    uint64_t v7 = [v6 count];

    if (v5) {
      BOOL v8 = v7 == 1;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      int v10 = [*(id *)(a1 + 40) mailboxesWithAllMessagesSyncEnabled];
      int v11 = [v10 firstObject];

      id v12 = [v11 url];
      id v13 = [v4 url];
      char v14 = [v12 isEqual:v13];

      if (v14)
      {
LABEL_18:

        return;
      }
    }
    else if ((v5 != 0) == (v7 == 1))
    {
      uint64_t v9 = [v4 filterType];
      if (v9 == [*(id *)(a1 + 40) aggregatedMailboxesFilterTypes]) {
        goto LABEL_18;
      }
    }
    id v15 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_23D3DF000, v15, OS_LOG_TYPE_DEFAULT, "Synced mailbox changed. Triggering #initial-sync", v16, 2u);
    }
    [*(id *)(a1 + 32) _triggerInitialSync];
    goto LABEL_18;
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  [v2 _updateMailboxSelection:v3 notifyClient:1];
}

- (void)updateVIPSenderList:(id)a3
{
}

- (void)updateVIPSenderList:(id)a3 requestContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NNMKSyncProvider_updateVIPSenderList_requestContext___block_invoke;
  block[3] = &unk_264E9A308;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(providerQueue, block);
}

void __55__NNMKSyncProvider_updateVIPSenderList_requestContext___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v9 = 134217984;
    uint64_t v10 = [v3 count];
    _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "Received VIP List. Count: %lu", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v5 = [*(id *)(a1 + 40) accountsSyncService];
  id v6 = +[NNMKProtoVIPSenderList protoVIPList:*(void *)(a1 + 32)];
  id v7 = [v5 syncVIPList:v6];

  BOOL v8 = [*(id *)(a1 + 40) resendScheduler];
  objc_msgSend(v8, "registerIDSIdentifier:objectIds:type:resendInterval:", v7, 0, @"VIPList", objc_msgSend(*(id *)(a1 + 48), "resendInterval"));
}

- (void)_updateMailboxSelection:(id)a3 notifyClient:(BOOL)a4
{
  BOOL v56 = a4;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v68 = v56;
    _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Mailbox selection changed. (Notify client: %lu)", buf, 0xCu);
  }
  id v7 = [NNMKMailboxSelection alloc];
  BOOL v8 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncEnabledMailboxes];
  int v9 = [(NNMKMailboxSelection *)v7 initWithMailboxes:v8];

  if ([(NNMKMailboxSelection *)v9 isEqual:v5])
  {
    uint64_t v10 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "Requested to udpate mailbox selection, but it has not changed. Ignoring.", buf, 2u);
    }
  }
  else
  {
    if (v56)
    {
      uint64_t v11 = +[NNMKAnalytics sharedInstance];
      [v11 reportMailboxSelectionChanged:v5 source:0];
    }
    id v12 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      unint64_t v68 = (unint64_t)v5;
      __int16 v69 = 2114;
      uint64_t v70 = v9;
      _os_log_impl(&dword_23D3DF000, v12, OS_LOG_TYPE_DEFAULT, "New Selection: [%{public}@], Previous Selection: [%{public}@]", buf, 0x16u);
    }
    id v13 = [(NNMKSyncProvider *)self syncController];
    uint64_t v14 = [v13 removeInvalidMailboxesFromMailboxSelection:v5];

    uint64_t v53 = (void *)v14;
    id v15 = +[NNMKMailboxSelection mailboxChangesApplyingSelection:v14 previousSelection:v9];
    int v16 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = v16;
      int v18 = [v15 mailboxesToUpdate];
      double v19 = objc_msgSend(v18, "nnmk_description");
      *(_DWORD *)buf = 138543362;
      unint64_t v68 = (unint64_t)v19;
      _os_log_impl(&dword_23D3DF000, v17, OS_LOG_TYPE_DEFAULT, "Mailboxes to update. %{public}@", buf, 0xCu);
    }
    double v20 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = v20;
      int v22 = [v15 mailboxesToReSync];
      long long v23 = objc_msgSend(v22, "nnmk_description");
      *(_DWORD *)buf = 138543362;
      unint64_t v68 = (unint64_t)v23;
      _os_log_impl(&dword_23D3DF000, v21, OS_LOG_TYPE_DEFAULT, "Mailboxes to re-sync. %{public}@", buf, 0xCu);
    }
    int v54 = v9;
    double v24 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = v24;
      uint64_t v26 = [v15 mailboxesToDisableSync];
      __int16 v27 = objc_msgSend(v26, "nnmk_description");
      *(_DWORD *)buf = 138543362;
      unint64_t v68 = (unint64_t)v27;
      _os_log_impl(&dword_23D3DF000, v25, OS_LOG_TYPE_DEFAULT, "Mailboxes to disable sync. %{public}@", buf, 0xCu);
    }
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry beginUpdates];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    int v55 = v15;
    int v28 = [v15 mailboxesToUpdate];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v62 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          pairedDeviceRegistry = self->_pairedDeviceRegistry;
          uint64_t v35 = [v33 mailboxId];
          uint64_t v36 = [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry mailboxWithId:v35];

          objc_msgSend(v33, "setSyncActive:", objc_msgSend(v36, "syncActive"));
          if ([v33 syncRequested])
          {
            [v33 setSyncEnabled:1];
            if (!v56)
            {
              [v33 setSyncRequested:0];
              uint64_t v37 = [v33 mailboxId];
              [(NNMKSyncProvider *)self _cancelFullSyncTimeoutTimerForMailboxId:v37];
            }
          }
          uint64_t v38 = qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            unint64_t v68 = (unint64_t)v33;
            _os_log_impl(&dword_23D3DF000, v38, OS_LOG_TYPE_DEFAULT, "Updating mailbox. %{public}@", buf, 0xCu);
          }
          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry addOrUpdateMailbox:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v30);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    __int16 v39 = [v55 mailboxesToDisableSync];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v58 != v42) {
            objc_enumerationMutation(v39);
          }
          unsigned int v44 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          long long v45 = qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            unint64_t v68 = (unint64_t)v44;
            _os_log_impl(&dword_23D3DF000, v45, OS_LOG_TYPE_DEFAULT, "Disabling sync for mailbox. %{public}@", buf, 0xCu);
          }
          [v44 setSyncEnabled:0];
          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry updateSyncEnabledForMailbox:v44];
          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry cleanUpForFullSyncWithMailbox:v44];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v41);
    }

    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry endUpdates];
    if (v56) {
      [(NNMKSyncProvider *)self _sendUpdatedMailboxSelection:[(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion]];
    }
    id v46 = [v55 mailboxesToReSync];
    uint64_t v47 = [v46 count];

    int v9 = v54;
    if (v47)
    {
      id v48 = (void *)qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v49 = v48;
        int v50 = [v55 mailboxesToReSync];
        long long v51 = objc_msgSend(v50, "nnmk_description");
        *(_DWORD *)buf = 138543362;
        unint64_t v68 = (unint64_t)v51;
        _os_log_impl(&dword_23D3DF000, v49, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes due to mailbox-selection changed. %{public}@", buf, 0xCu);
      }
      uint64_t v52 = [v55 mailboxesToReSync];
      [(NNMKSyncProvider *)self _triggerFullSyncForMailboxes:v52];
    }
    id v5 = v53;
  }
}

- (void)_sendUpdatedMailboxSelection:(unint64_t)a3
{
}

- (void)_sendUpdatedMailboxSelection:(unint64_t)a3 resendInterval:(unint64_t)a4
{
  id v7 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_23D3DF000, v7, OS_LOG_TYPE_DEFAULT, "Sending updated mailbox selection.", v14, 2u);
  }
  BOOL v8 = [NNMKMailboxSelection alloc];
  int v9 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncEnabledMailboxes];
  uint64_t v10 = [(NNMKMailboxSelection *)v8 initWithMailboxes:v9];

  uint64_t v11 = +[NNMKProtoMailboxSelection protoMailboxSelectionFromMailboxSelection:v10 fullSyncVersion:a3];
  id v12 = [(NNMKMessagesSyncServiceServer *)self->_messagesSyncService updateMailboxSelection:v11];
  id v13 = [(NNMKSyncProvider *)self resendScheduler];
  [v13 registerIDSIdentifier:v12 objectIds:0 type:@"MailboxSelection" resendInterval:a4];
}

- (void)notifyFetchCompleted
{
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NNMKSyncProvider_notifyFetchCompleted__block_invoke;
  block[3] = &unk_264E99F20;
  void block[4] = self;
  dispatch_async(providerQueue, block);
}

uint64_t __40__NNMKSyncProvider_notifyFetchCompleted__block_invoke(uint64_t a1)
{
  id v2 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "#FETCH Manual Completed.", v6, 2u);
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 112);
  id v4 = objc_alloc_init(NNMKProtoFetchRequestCompletedNotification);
  [v3 notifyFetchRequestCompleted:v4];

  return [*(id *)(a1 + 32) _checkBatchFetchedMessages];
}

- (void)notifyFetchCompletedForMailboxId:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NNMKSyncProvider_notifyFetchCompletedForMailboxId_error___block_invoke;
  block[3] = &unk_264E9A308;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(providerQueue, block);
}

void __59__NNMKSyncProvider_notifyFetchCompletedForMailboxId_error___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void *)(a1 + 40) != 0;
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    BOOL v9 = v4;
    _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "#FETCH Manual Completed (mailboxId: %{public}@, error: %d)", (uint8_t *)&v6, 0x12u);
  }
  id v5 = objc_alloc_init(NNMKProtoFetchRequestCompletedNotification);
  [(NNMKProtoFetchRequestCompletedNotification *)v5 setMailboxId:*(void *)(a1 + 32)];
  [(NNMKProtoFetchRequestCompletedNotification *)v5 setFailed:*(void *)(a1 + 40) != 0];
  [*(id *)(*(void *)(a1 + 48) + 112) notifyFetchRequestCompleted:v5];
  [*(id *)(a1 + 48) _checkBatchFetchedMessages];
}

- (id)bulletinFlagsForMessageStatus:(unint64_t)a3 dateReceived:(id)a4 messageWillBeAddedToSyncProvider:(BOOL)a5 mailboxId:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__1;
  __int16 v27 = __Block_byref_object_dispose__1;
  id v28 = [MEMORY[0x263EFF9A0] dictionary];
  providerQueue = self->_providerQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __106__NNMKSyncProvider_bulletinFlagsForMessageStatus_dateReceived_messageWillBeAddedToSyncProvider_mailboxId___block_invoke;
  v17[3] = &unk_264E9AAB8;
  v17[4] = self;
  id v18 = v11;
  BOOL v22 = a5;
  double v20 = &v23;
  unint64_t v21 = a3;
  id v19 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_sync(providerQueue, v17);
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __106__NNMKSyncProvider_bulletinFlagsForMessageStatus_dateReceived_messageWillBeAddedToSyncProvider_mailboxId___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) syncController];
  id v7 = [v2 mailboxWithId:*(void *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 72)
    && [v7 syncActive]
    && [v7 filterType]
    && ([*(id *)(a1 + 32) syncController],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isValidMessageStatus:*(void *)(a1 + 64) forMailbox:v7],
        v3,
        v4))
  {
    if ([v7 filterType] == 64) {
      uint64_t v5 = objc_msgSend(*(id *)(a1 + 48), "nnmk_isToday");
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  int v6 = [NSNumber numberWithBool:v5];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v6 forKeyedSubscript:@"MessageWillBeSynced"];
}

- (BOOL)isPaired
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__NNMKSyncProvider_isPaired__block_invoke;
  v5[3] = &unk_264E9A550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__NNMKSyncProvider_isPaired__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPaired];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isPaired
{
  return self->_pairedDeviceRegistry != 0;
}

- (NNMKMailboxSelection)mailboxSelection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__NNMKSyncProvider_mailboxSelection__block_invoke;
  v5[3] = &unk_264E9A550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NNMKMailboxSelection *)v3;
}

void __36__NNMKSyncProvider_mailboxSelection__block_invoke(uint64_t a1)
{
  id v2 = [NNMKMailboxSelection alloc];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 72) syncEnabledMailboxes];
  uint64_t v3 = [(NNMKMailboxSelection *)v2 initWithMailboxes:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)syncedMailboxes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__NNMKSyncProvider_syncedMailboxes__block_invoke;
  v5[3] = &unk_264E9A550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __35__NNMKSyncProvider_syncedMailboxes__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) syncEnabledMailboxes];
  return MEMORY[0x270F9A758]();
}

- (BOOL)containsSyncedMailbox:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NNMKSyncProvider *)self syncedMailboxes];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "mailboxId", (void)v18);
        id v12 = [v10 mailboxId];
        char v13 = [v11 isEqual:v12];

        if (v13)
        {
          LOBYTE(v14) = 1;
          id v15 = v5;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if ([(NNMKSyncProvider *)self _pairedDeviceSupportsMultipleMailboxes])
  {
    LOBYTE(v14) = 0;
  }
  else
  {
    id v15 = [v5 firstObject];
    BOOL v17 = [v15 url];

    if (v17) {
      LOBYTE(v14) = 0;
    }
    else {
      BOOL v14 = [v4 type] == 1;
    }
LABEL_12:
  }
  return v14;
}

- (void)syncStandaloneAccountIdentity:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __50__NNMKSyncProvider_syncStandaloneAccountIdentity___block_invoke;
  v7[3] = &unk_264E99F48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

uint64_t __50__NNMKSyncProvider_syncStandaloneAccountIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendStandaloneAccountIdentity:*(void *)(a1 + 40) resendInterval:0];
}

- (id)watchAccounts
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__NNMKSyncProvider_watchAccounts__block_invoke;
  v5[3] = &unk_264E9A550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __33__NNMKSyncProvider_watchAccounts__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _watchAccounts];
  return MEMORY[0x270F9A758]();
}

- (id)requestWatchAccounts
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__NNMKSyncProvider_requestWatchAccounts__block_invoke;
  v5[3] = &unk_264E9A550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__NNMKSyncProvider_requestWatchAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _watchAccounts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NNMKSyncProvider_requestWatchAccounts__block_invoke_2;
  block[3] = &unk_264E99F20;
  void block[4] = v5;
  dispatch_async(v6, block);
}

uint64_t __40__NNMKSyncProvider_requestWatchAccounts__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = qword_26AC21860;
  if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "Requesting watch accounts authentication status from watch", v4, 2u);
  }
  return [*(id *)(a1 + 32) _sendWatchAccountStatusRequest];
}

- (id)_watchAccounts
{
  uint64_t v3 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry allSyncedAccountsKeyedByAccountId];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__NNMKSyncProvider__watchAccounts__block_invoke;
  v9[3] = &unk_264E9AAE0;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __34__NNMKSyncProvider__watchAccounts__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 account];
  id v4 = [*(id *)(a1 + 32) sessionController];
  id v5 = [v6 accountId];
  objc_msgSend(v6, "setStandaloneState:", objc_msgSend(v4, "standaloneStateForAccountId:", v5));

  [*(id *)(a1 + 40) addObject:v6];
}

- (void)_sendStandaloneAccountIdentity:(id)a3 resendInterval:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(NNMKSyncProvider *)self persistenceHandler];
  uint64_t v8 = [v7 addStandaloneAccountIdentity:v6];

  if (v8)
  {
    char v9 = (void *)qword_26AC21860;
    if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [v6 accountId];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v11;
      _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "Sending standalone account identity: %{public}@", buf, 0xCu);
    }
    id v12 = [MEMORY[0x263EFF910] date];
    [v12 timeIntervalSince1970];
    -[NNMKSyncSessionController setAccountAuthRequestLastRequestTime:](self->_sessionController, "setAccountAuthRequestLastRequestTime:");

    char v13 = [(NNMKSyncProvider *)self sessionController];
    BOOL v14 = [v13 syncingAccountIdentityByUsername];
    id v15 = [v6 username];
    [v14 setObject:v6 forKeyedSubscript:v15];

    int v16 = [(NNMKSyncProvider *)self accountsSyncService];
    BOOL v17 = [v16 sendStandaloneAccountIdentity:v8];

    long long v18 = [(NNMKSyncProvider *)self resendScheduler];
    long long v19 = [v6 username];
    long long v21 = v19;
    long long v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    [v18 registerIDSIdentifier:v17 objectIds:v20 type:@"AccountIdentity" resendInterval:a4];
  }
}

- (void)_sendWatchAccountStatusRequest
{
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  -[NNMKSyncSessionController setAccountAuthRequestLastRequestTime:](self->_sessionController, "setAccountAuthRequestLastRequestTime:");

  id v7 = [(NNMKSyncProvider *)self accountsSyncService];
  id v4 = [(NNMKSyncProvider *)self persistenceHandler];
  [(NNMKSyncSessionController *)self->_sessionController accountAuthRequestLastRequestTime];
  id v5 = objc_msgSend(v4, "addAccountAuthenticationStatusRequest:");
  id v6 = (id)[v7 requestWatchAccountsStatus:v5];
}

- (BOOL)organizeByThread
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__NNMKSyncProvider_organizeByThread__block_invoke;
  v5[3] = &unk_264E9A550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__NNMKSyncProvider_organizeByThread__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) organizeByThread];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setOrganizeByThread:(BOOL)a3
{
  providerQueue = self->_providerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__NNMKSyncProvider_setOrganizeByThread___block_invoke;
  v4[3] = &unk_264E9AB08;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(providerQueue, v4);
}

void __40__NNMKSyncProvider_setOrganizeByThread___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    int v3 = [v2 organizeByThread];
    int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 != v3)
    {
      [*(id *)(*(void *)(a1 + 32) + 72) setOrganizeByThread:v4 != 0];
      BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 72) allSyncedAccountsKeyedByAccountId];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(NSObject **)(v7 + 56);
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __40__NNMKSyncProvider_setOrganizeByThread___block_invoke_2;
        v9[3] = &unk_264E9AB08;
        char v10 = *(unsigned char *)(a1 + 40);
        v9[4] = v7;
        dispatch_async(v8, v9);
      }
      else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
      {
        __40__NNMKSyncProvider_setOrganizeByThread___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __40__NNMKSyncProvider_setOrganizeByThread___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "Triggering #initial-sync because \"organized by thread\" flag changed. %lu", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _triggerInitialSync];
}

- (NNMKPairedDeviceInfo)pairedDeviceInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__1;
  char v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  providerQueue = self->_providerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__NNMKSyncProvider_pairedDeviceInfo__block_invoke;
  v5[3] = &unk_264E9A550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(providerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NNMKPairedDeviceInfo *)v3;
}

uint64_t __36__NNMKSyncProvider_pairedDeviceInfo__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) deviceScreenWidth];
  double v3 = v2;
  [*(id *)(*(void *)(a1 + 32) + 72) deviceScreenScale];
  uint64_t v5 = +[NNMKPairedDeviceInfo pairedDeviceInfoWithScreenWidth:v3 screenScale:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(a1 + 32) + 72) deviceScreenWidth];
  if (v8 == 0.0 || (uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) deviceScreenScale], v10 != 0.0))
  {
    [*(id *)(a1 + 32) _storeScreenRelatedValues];
    [*(id *)(*(void *)(a1 + 32) + 72) deviceScreenWidth];
    double v12 = v11;
    [*(id *)(*(void *)(a1 + 32) + 72) deviceScreenScale];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NNMKPairedDeviceInfo pairedDeviceInfoWithScreenWidth:v12 screenScale:v13];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)resendObjectsForIDSIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKSyncProvider *)self resendScheduler];
  [v5 resendObjectsForIDSIdentifier:v4];
}

- (void)messagesSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5
{
}

- (void)messagesSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
  int v7 = [v6 isTrackingInitialSync];

  if (v7)
  {
    double v8 = [(NNMKSyncProvider *)self resendScheduler];
    char v9 = [v8 messageTypeForIDSIdentifier:v5];

    if ([v9 isEqualToString:@"InitialSync"])
    {
      double v10 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
      [v10 updateProgressWithMessageHeadersArrivedInPairedDevice];

      double v11 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v5;
        _os_log_impl(&dword_23D3DF000, v11, OS_LOG_TYPE_DEFAULT, "#full-sync sent successfully by IDS (IDS Identifier: %{public}@).", (uint8_t *)&v13, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG))
    {
      -[NNMKSyncProvider messagesSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:]();
    }
  }
  double v12 = [(NNMKSyncProvider *)self resendScheduler];
  [v12 handleIDSMessageSentSuccessfullyWithId:v5];
}

- (void)messagesSyncServiceServerSpaceBecameAvailable:(id)a3
{
  id v4 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "IDS Reported Space Became Available.", v6, 2u);
  }
  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry prepareIDSIdentifiersForResendForErrorCode:27];
  id v5 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry datesForIDSIdentifiersScheduledToBeResent];
  [(NNMKSyncEndpoint *)self enqueueIDSIdentifiersForResend:v5];
}

- (void)messagesSyncServiceServerConnectivityChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = [(NNMKSyncProvider *)self _isConnectedToWatch];
  id v5 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_INFO))
  {
    messagesSyncService = self->_messagesSyncService;
    int v7 = v5;
    v9[0] = 67109376;
    v9[1] = v4;
    __int16 v10 = 2048;
    uint64_t v11 = [(NNMKSyncServiceEndpoint *)messagesSyncService connectivityState];
    _os_log_impl(&dword_23D3DF000, v7, OS_LOG_TYPE_INFO, "Connectivity changed (Connected: %d - Connectivity type: %lu)", (uint8_t *)v9, 0x12u);
  }
  double v8 = [(NNMKSyncProvider *)self sessionController];
  objc_msgSend(v8, "setDeviceInStandalone:", -[NNMKSyncProvider _isUsingCompaionSync](self, "_isUsingCompaionSync") ^ 1);

  [(NNMKSyncProvider *)self _checkConnectivityBasedSuspensionTimer:v4];
}

- (void)messagesSyncServiceServer:(id)a3 didUpdateMessagesStatus:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a4;
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  int v7 = [(NNMKSyncProvider *)self syncController];
  double v8 = [v5 messageStatusUpdates];
  char v9 = [v8 firstObject];
  __int16 v10 = [v9 messageId];
  uint64_t v11 = [v7 messageIdFromWatchMessageId:v10];
  uint64_t v12 = [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry syncedMessageForMessageWithId:v11];

  int v13 = [(NNMKSyncProvider *)self syncController];
  id v14 = [v12 mailboxId];
  uint64_t v15 = [v13 mailboxWithId:v14];

  if (v15
    && -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", [v5 fullSyncVersion], v15))
  {
    uint64_t v42 = v15;
    BOOL v43 = v12;
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry beginUpdates];
    id v46 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "messageStatusUpdatesCount"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v44 = v5;
    obuint64_t j = [v5 messageStatusUpdates];
    uint64_t v16 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
    if (!v16) {
      goto LABEL_21;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        long long v21 = [(NNMKSyncProvider *)self syncController];
        BOOL v22 = [v20 messageId];
        uint64_t v23 = [v21 messageIdFromWatchMessageId:v22];

        uint64_t v24 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncedMessageForMessageWithId:v23];
        if (!v24)
        {
          uint64_t v34 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = v34;
            uint64_t v36 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v20 updatedStatus]);
            *(_DWORD *)buf = 138543618;
            uint64_t v52 = v23;
            __int16 v53 = 2112;
            int v54 = v36;
            _os_log_impl(&dword_23D3DF000, v35, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED but we don't have it in our records. Updating anyway... (Id: %{public}@ - Status: %@ - Source: Watch).", buf, 0x16u);
          }
          goto LABEL_17;
        }
        unsigned int v25 = [v20 statusVersion];
        unint64_t v26 = [v24 statusVersion];
        __int16 v27 = (void *)qword_26AC21850;
        BOOL v28 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
        if (v26 <= v25)
        {
          if (v28)
          {
            uint64_t v37 = v27;
            uint64_t v38 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v20 updatedStatus]);
            *(_DWORD *)buf = 138543618;
            uint64_t v52 = v23;
            __int16 v53 = 2112;
            int v54 = v38;
            _os_log_impl(&dword_23D3DF000, v37, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED (Id: %{public}@ - Status: %@ - Source: Watch).", buf, 0x16u);
          }
          objc_msgSend(v24, "setStatus:", objc_msgSend(v20, "updatedStatus"));
          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry addOrUpdateSyncedMessage:v24];
LABEL_17:
          uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "updatedStatus"));
          [v46 setObject:v29 forKeyedSubscript:v23];
          goto LABEL_18;
        }
        if (!v28) {
          goto LABEL_19;
        }
        uint64_t v29 = v27;
        uint64_t v30 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v20 updatedStatus]);
        uint64_t v31 = +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", [v24 status]);
        uint64_t v32 = [v20 statusVersion];
        uint64_t v33 = [v24 statusVersion];
        *(_DWORD *)buf = 138544386;
        uint64_t v52 = v23;
        __int16 v53 = 2112;
        int v54 = v30;
        __int16 v55 = 2112;
        BOOL v56 = v31;
        __int16 v57 = 2048;
        uint64_t v58 = v32;
        __int16 v59 = 2048;
        uint64_t v60 = v33;
        _os_log_impl(&dword_23D3DF000, v29, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED but version is outdated (Id: %{public}@ - Status: %@ - Local Status: %@ - Client Version: %lu - Local Version: %lu - Source: Watch).", buf, 0x34u);

LABEL_18:
LABEL_19:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
      if (!v17)
      {
LABEL_21:

        [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry endUpdates];
        if ([v46 count]) {
          [(NNMKSyncProvider *)self _notifyDelegateThatMessagesStatusWereUpdated:v46];
        }

        uint64_t v12 = v43;
        id v5 = v44;
        uint64_t v15 = v42;
        goto LABEL_26;
      }
    }
  }
  __int16 v39 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = v39;
    uint64_t v41 = [v12 messageId];
    *(_DWORD *)buf = 138543362;
    uint64_t v52 = v41;
    _os_log_impl(&dword_23D3DF000, v40, OS_LOG_TYPE_DEFAULT, "Message Status DROPPED (Id: %{public}@ - Source: Watch).", buf, 0xCu);
  }
LABEL_26:
}

- (void)messagesSyncServiceServer:(id)a3 didDeleteMessages:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 messageDeletions];
  int v7 = [v6 firstObject];
  double v8 = [v7 messageId];

  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  __int16 v10 = [(NNMKSyncProvider *)self syncController];
  uint64_t v11 = [v10 messageIdFromWatchMessageId:v8];
  uint64_t v12 = [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry syncedMessageForMessageWithId:v11];

  int v13 = [(NNMKSyncProvider *)self syncController];
  id v14 = [v12 mailboxId];
  uint64_t v15 = [v13 mailboxWithId:v14];

  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", [v5 fullSyncVersion], v15))
  {
    __int16 v39 = v15;
    uint64_t v40 = v12;
    uint64_t v41 = v8;
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry beginUpdates];
    uint64_t v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "messageDeletionsCount"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v42 = v5;
    obuint64_t j = [v5 messageDeletions];
    uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v44 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v46 != v44) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v21 = [(NNMKSyncProvider *)self syncController];
          BOOL v22 = [v20 messageId];
          uint64_t v23 = [v21 messageIdFromWatchMessageId:v22];

          uint64_t v24 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncedMessageForMessageWithId:v23];
          unsigned int v25 = (void *)qword_26AC21850;
          BOOL v26 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
          if (v24)
          {
            if (v26)
            {
              __int16 v27 = v25;
              unsigned int v28 = [v20 deletionState];
              *(_DWORD *)buf = 138543618;
              long long v51 = v23;
              __int16 v52 = 2048;
              *(void *)__int16 v53 = v28;
              _os_log_impl(&dword_23D3DF000, v27, OS_LOG_TYPE_DEFAULT, "Message DELETED from Client (Id: %{public}@ - Deletion State: %lu).", buf, 0x16u);
            }
            [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry removeSyncedMessageForMessageWithId:v23];
            uint64_t v29 = [(NNMKSyncProvider *)self sessionController];
            uint64_t v30 = [v29 messageIdsToIgnoreStatusUpdates];
            [v30 addObject:v23];
          }
          else if (v26)
          {
            uint64_t v31 = v25;
            unsigned int v32 = [v20 deletionState];
            *(_DWORD *)buf = 138543618;
            long long v51 = v23;
            __int16 v52 = 2048;
            *(void *)__int16 v53 = v32;
            _os_log_impl(&dword_23D3DF000, v31, OS_LOG_TYPE_DEFAULT, "Message DELETED from Client but we don't have it in our records. Deleting anyway... (Id: %{public}@ - Deletion State: %lu).", buf, 0x16u);
          }
          uint64_t v33 = [(NNMKSyncProvider *)self sessionController];
          uint64_t v34 = [v33 notificationPayloadAcks];
          [v34 removeObjectForKey:v23];

          [(NNMKSyncProvider *)self _requestDelegateToStopDownloadingMessageElementsForMessageWithId:v23];
          uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "deletionState"));
          [v16 setObject:v35 forKeyedSubscript:v23];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v18);
    }

    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry endUpdates];
    if ([v16 count]) {
      [(NNMKSyncProvider *)self _notifyDelegateThatMessagesStatusWereUpdated:v16];
    }

    double v8 = v41;
    id v5 = v42;
    uint64_t v15 = v39;
    uint64_t v12 = v40;
  }
  else
  {
    uint64_t v36 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = v36;
      uint64_t v38 = [v12 mailboxId];
      *(_DWORD *)buf = 138543874;
      long long v51 = v38;
      __int16 v52 = 1024;
      *(_DWORD *)__int16 v53 = v15 != 0;
      *(_WORD *)&v53[4] = 2114;
      *(void *)&v53[6] = v8;
      _os_log_error_impl(&dword_23D3DF000, v37, OS_LOG_TYPE_ERROR, "Ignoring deletion. Mailbox: %{public}@ (exists: %d), messageId: %{public}@", buf, 0x1Cu);
    }
  }
}

- (void)messagesSyncServiceServer:(id)a3 didRequestSendMessage:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (([v5 hasComposedMessageId] & 1) != 0
    || [v5 tosCount]
    || [v5 ccsCount]
    || ([v5 hasSubject] & 1) != 0)
  {
    uint64_t v6 = objc_alloc_init(NNMKComposedMessage);
    if ([v5 hasComposedMessageId])
    {
      int v7 = [v5 composedMessageId];
      [(NNMKComposedMessage *)v6 setComposedMessageId:v7];
    }
    else
    {
      int v7 = [MEMORY[0x263F08C38] UUID];
      double v8 = [v7 UUIDString];
      [(NNMKComposedMessage *)v6 setComposedMessageId:v8];
    }
    -[NNMKComposedMessage setSendingType:](v6, "setSendingType:", [v5 sendingType]);
    char v9 = [v5 tos];
    [(NNMKComposedMessage *)v6 setTo:v9];

    __int16 v10 = [v5 ccs];
    [(NNMKComposedMessage *)v6 setCc:v10];

    uint64_t v11 = [v5 subject];
    [(NNMKComposedMessage *)v6 setSubject:v11];

    uint64_t v12 = [v5 from];
    [(NNMKComposedMessage *)v6 setFrom:v12];

    int v13 = [v5 body];
    [(NNMKComposedMessage *)v6 setBody:v13];

    if ([v5 hasReferenceMessageId])
    {
      id v14 = [(NNMKSyncProvider *)self syncController];
      uint64_t v15 = [v5 referenceMessageId];
      uint64_t v16 = [v14 messageIdFromWatchMessageId:v15];
      [(NNMKComposedMessage *)v6 setReferenceMessageId:v16];
    }
    else
    {
      [(NNMKComposedMessage *)v6 setReferenceMessageId:&stru_26F11E918];
    }
    if ([v5 hasIncludeAttachments]) {
      uint64_t v17 = [v5 includeAttachments];
    }
    else {
      uint64_t v17 = 0;
    }
    [(NNMKComposedMessage *)v6 setIncludeAttachments:v17];
    uint64_t v18 = [v5 accountId];
    [(NNMKComposedMessage *)v6 setAccountId:v18];

    pairedDeviceRegistry = self->_pairedDeviceRegistry;
    long long v20 = [(NNMKComposedMessage *)v6 composedMessageId];
    [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry setProgress:0 forComposedMessageWithId:v20];

    if ([v5 includeAttachments])
    {
      long long v21 = self->_pairedDeviceRegistry;
      BOOL v22 = [(NNMKComposedMessage *)v6 composedMessageId];
      uint64_t v23 = [(NNMKDeviceSyncRegistry *)v21 attachmentsForComposedMessageId:v22];

      if (!v23)
      {
        [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry storePendingComposedMessage:v6];
        uint64_t v29 = (void *)qword_26AC21850;
        if (!os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        unsigned int v25 = v29;
        BOOL v26 = [v5 composedMessageId];
        int v30 = 138543362;
        uint64_t v31 = v26;
        _os_log_impl(&dword_23D3DF000, v25, OS_LOG_TYPE_DEFAULT, "Waiting to send Composed Message until attachment recieved (Composed Message Id: %{public}@).", (uint8_t *)&v30, 0xCu);
        goto LABEL_19;
      }
      [(NNMKComposedMessage *)v6 setAttachments:v23];
    }
    [(NNMKSyncProvider *)self _requestDelegateToSendComposedMessage:v6];
    uint64_t v24 = (void *)qword_26AC21850;
    if (!os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:

      goto LABEL_21;
    }
    unsigned int v25 = v24;
    BOOL v26 = [(NNMKComposedMessage *)v6 composedMessageId];
    uint64_t v27 = [(NNMKComposedMessage *)v6 sendingType];
    unsigned int v28 = [(NNMKComposedMessage *)v6 referenceMessageId];
    int v30 = 138543874;
    uint64_t v31 = v26;
    __int16 v32 = 2048;
    uint64_t v33 = v27;
    __int16 v34 = 2114;
    uint64_t v35 = v28;
    _os_log_impl(&dword_23D3DF000, v25, OS_LOG_TYPE_DEFAULT, "Composed Message SENT from Client (Composed Message Id: %{public}@, Send Type: %lu - Message Id: %{public}@).", (uint8_t *)&v30, 0x20u);

LABEL_19:
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
    -[NNMKSyncProvider messagesSyncServiceServer:didRequestSendMessage:]();
  }
LABEL_21:
}

- (void)messagesSyncServiceServer:(id)a3 didUpdateMailboxSelection:(id)a4
{
  id v5 = a4;
  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:](self, "_verifyDatabaseOkForFullSyncVersion:", [v5 fullSyncVersion]))
  {
    uint64_t v6 = [v5 mailboxSelection];
    int v7 = [NNMKMailboxSelection alloc];
    double v8 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncEnabledMailboxes];
    char v9 = [(NNMKMailboxSelection *)v7 initWithMailboxes:v8];

    if ([(NNMKMailboxSelection *)v9 isEqual:v6])
    {
      __int16 v10 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "Requested to update mailbox selection but no changes was found. Ignoring.", v14, 2u);
      }
    }
    else
    {
      [(NNMKSyncProvider *)self _updateMailboxSelection:v6 notifyClient:0];
      uint64_t v11 = [(NNMKSyncProvider *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        int v13 = [(NNMKSyncProvider *)self delegate];
        [v13 syncProvider:self didUpdateMailboxSelection:v6];
      }
    }
  }
}

- (void)messagesSyncServiceServer:(id)a3 didMoveMessages:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(NNMKSyncProvider *)self syncController];
  int v7 = [v5 mailboxId];
  double v8 = [v6 mailboxWithId:v7];

  BOOL v31 = -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", [v5 fullSyncVersion], v8);
  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry beginUpdates];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  __int16 v32 = v5;
  obuint64_t j = [v5 messageIds];
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v14 = [(NNMKSyncProvider *)self syncController];
        uint64_t v15 = [v14 messageIdFromWatchMessageId:v13];

        uint64_t v16 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncedMessageForMessageWithId:v15];
        uint64_t v17 = (void *)qword_26AC21850;
        BOOL v18 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v31)
          {
            if (v18)
            {
              long long v19 = v17;
              long long v20 = [v32 mailboxId];
              *(_DWORD *)buf = 138543618;
              uint64_t v38 = v13;
              __int16 v39 = 2114;
              uint64_t v40 = v20;
              _os_log_impl(&dword_23D3DF000, v19, OS_LOG_TYPE_DEFAULT, "Message MOVED from Client (Id: %{public}@ - mailboxId: %{public}@).", buf, 0x16u);
            }
            long long v21 = [v32 mailboxId];
            [v16 setMailboxId:v21];

            [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry addOrUpdateSyncedMessage:v16];
          }
          else
          {
            if (v18)
            {
              uint64_t v24 = v17;
              unsigned int v25 = [v32 mailboxId];
              *(_DWORD *)buf = 138543618;
              uint64_t v38 = v13;
              __int16 v39 = 2114;
              uint64_t v40 = v25;
              _os_log_impl(&dword_23D3DF000, v24, OS_LOG_TYPE_DEFAULT, "Message MOVED from Client but new mailbox isn't active so deleting message (Id: %{public}@ - mailboxId: %{public}@).", buf, 0x16u);
            }
            [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry removeSyncedMessageForMessageWithId:v15];
          }
        }
        else if (v18)
        {
          BOOL v22 = v17;
          uint64_t v23 = [v32 mailboxId];
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v13;
          __int16 v39 = 2114;
          uint64_t v40 = v23;
          _os_log_impl(&dword_23D3DF000, v22, OS_LOG_TYPE_DEFAULT, "Message MOVED but we don't have it in our records. Updating anyway... (Id: %{public}@ - mailboxId: %{public}@ - Source: Watch).", buf, 0x16u);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v10);
  }

  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry endUpdates];
  BOOL v26 = [(NNMKSyncProvider *)self delegate];
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    unsigned int v28 = [(NNMKSyncProvider *)self delegate];
    uint64_t v29 = [v32 messageIds];
    [v28 syncProvider:self didMoveMessageIds:v29 toMailbox:v8];
  }
}

- (void)messagesSyncServiceServer:(id)a3 didRecieveAttachmentsAtURL:(id)a4 composedMessageId:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry pendingComposedMessageWithId:v8];
  if (v9)
  {
    uint64_t v10 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry attachmentsFromURL:v7];
    [v9 setAttachments:v10];
    [(NNMKSyncProvider *)self _requestDelegateToSendComposedMessage:v9];
    uint64_t v11 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = v11;
      uint64_t v13 = [v9 composedMessageId];
      uint64_t v14 = [v9 sendingType];
      uint64_t v15 = [v9 referenceMessageId];
      int v17 = 138543874;
      id v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      BOOL v22 = v15;
      _os_log_impl(&dword_23D3DF000, v12, OS_LOG_TYPE_DEFAULT, "Recieved attachments and SENT Composed Message from Client (Composed Message Id: %{public}@, Send Type: %lu - Message Id: %{public}@).", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    uint64_t v16 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v8;
      _os_log_impl(&dword_23D3DF000, v16, OS_LOG_TYPE_DEFAULT, "Recieved attachments, but waiting for composedMesageId: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry saveAttachmentsForComposedMessageId:v8 temporaryURL:v7];
  }
}

- (void)messagesSyncServiceServer:(id)a3 didWarnMessagesFilteredOut:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(NNMKSyncProvider *)self syncController];
  id v7 = [v5 mailboxId];
  id v8 = [v6 mailboxWithId:v7];

  if (v8
    && -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", [v5 fullSyncVersion], v8))
  {
    uint64_t v20 = v8;
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = [v5 removedMessageIdsCount];
      _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "Messages filtered out. (Count: %lu).", buf, 0xCu);
    }
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry beginUpdates];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = [v5 removedMessageIds];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
          pairedDeviceRegistry = self->_pairedDeviceRegistry;
          id v18 = [(NNMKSyncProvider *)self syncController];
          __int16 v19 = [v18 messageIdFromWatchMessageId:v16];
          [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry removeSyncedMessageForMessageWithId:v19];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry endUpdates];
    id v8 = v20;
  }
}

- (void)messagesSyncServiceServer:(id)a3 didRequestCompactMessages:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NNMKSyncProvider *)self syncController];
  id v7 = [v5 mailboxId];
  id v8 = [v6 mailboxWithId:v7];

  if (v8
    && -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", [v5 fullSyncVersion], v8))
  {
    uint64_t v9 = (void *)MEMORY[0x263F08928];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v5 beforeDateReceived];
    uint64_t v12 = [v9 unarchivedObjectOfClass:v10 fromData:v11 error:0];

    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry removeSyncedMessagesBeforeDateReceived:v12 mailbox:v8];
  }
  else
  {
    uint64_t v13 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider messagesSyncServiceServer:didRequestCompactMessages:](v13, v5);
    }
  }
}

- (void)messageContentSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5
{
}

- (void)messageContentSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
  int v7 = [v6 isTrackingInitialSync];

  if (v7)
  {
    id v8 = [(NNMKSyncProvider *)self resendScheduler];
    uint64_t v9 = [v8 objectIdsForPendingIDSIdentifier:v5];

    if ([v9 count])
    {
      uint64_t v10 = [v9 objectAtIndexedSubscript:0];
      uint64_t v11 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
      [v11 updateProgressWithMessageContentArrivedInPairedDevice:v10];
    }
  }
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
    -[NNMKSyncProvider messageContentSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:]();
  }
  uint64_t v12 = [(NNMKSyncProvider *)self resendScheduler];
  [v12 handleIDSMessageSentSuccessfullyWithId:v5];
}

- (void)accountsSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5
{
}

- (void)accountsSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
  [v6 updateProgressWithAccountsArrivedInPairedDevice];

  int v7 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_23D3DF000, v7, OS_LOG_TYPE_DEFAULT, "Accounts sent successfully by IDS (IDS Identifier: %{public}@).", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(NNMKSyncProvider *)self resendScheduler];
  [v8 handleIDSMessageSentSuccessfullyWithId:v5];
}

- (void)accountsSyncServiceServer:(id)a3 didChangeAccountSourceType:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:](self, "_verifyDatabaseOkForFullSyncVersion:", [v5 fullSyncVersion]))
  {
    uint64_t v6 = objc_alloc_init(NNMKAccount);
    int v7 = [v5 accountId];
    [(NNMKAccount *)v6 setAccountId:v7];

    -[NNMKAccount setSourceType:](v6, "setSourceType:", [v5 sourceType]);
    pairedDeviceRegistry = self->_pairedDeviceRegistry;
    int v9 = [(NNMKAccount *)v6 accountId];
    uint64_t v10 = [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry accountSourceTypeForAccountId:v9];

    uint64_t v11 = (void *)qword_26AC21860;
    if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      uint64_t v13 = [(NNMKAccount *)v6 accountId];
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v13;
      __int16 v38 = 2048;
      uint64_t v39 = [(NNMKAccount *)v6 sourceType];
      __int16 v40 = 2048;
      uint64_t v41 = v10;
      _os_log_impl(&dword_23D3DF000, v12, OS_LOG_TYPE_DEFAULT, "Received account source type change from watch. Id: %{public}@, Source Type: %lu, Previous: %lu", buf, 0x20u);
    }
    uint64_t v14 = self->_pairedDeviceRegistry;
    uint64_t v15 = [(NNMKAccount *)v6 sourceType];
    uint64_t v16 = [(NNMKAccount *)v6 accountId];
    [(NNMKDeviceSyncRegistry *)v14 updateSourceType:v15 forAccountId:v16];

    if (![(NNMKAccount *)v6 sourceType])
    {
      int v17 = (void *)qword_26AC21860;
      if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        __int16 v19 = [(NNMKAccount *)v6 accountId];
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v19;
        _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "Account source type changed back to source type companion. Triggering #full-sync for all synced enabled mailboxes from account id %{public}@", buf, 0xCu);
      }
      uint64_t v20 = self->_pairedDeviceRegistry;
      long long v21 = [(NNMKAccount *)v6 accountId];
      long long v22 = [(NNMKDeviceSyncRegistry *)v20 mailboxesForAccountId:v21];

      if ([v22 count])
      {
        id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v24 = v22;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v32 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if (objc_msgSend(v29, "syncEnabled", (void)v31)) {
                [v23 addObject:v29];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v26);
        }

        [(NNMKSyncProvider *)self _triggerFullSyncForMailboxes:v23];
        [(NNMKSyncProvider *)self _requestDelegateForFetchForMailboxes:v24];
      }
    }
  }
  else
  {
    int v30 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider accountsSyncServiceServer:didChangeAccountSourceType:](v30);
    }
  }
}

- (void)accountsSyncServiceServer:(id)a3 didReceivedAccountAuthenticationStatus:(id)a4 requestTime:(double)a5
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = qword_26AC21860;
  if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "Received watch accounts authentication status from watch.", buf, 2u);
  }
  if (a5 <= 0.0
    || ([(NNMKSyncSessionController *)self->_sessionController accountAuthRequestLastRequestTime], v11 <= a5))
  {
    id v60 = v8;
    uint64_t v16 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry allSyncedAccountsKeyedByAccountId];
    int v17 = (void *)[v16 mutableCopy];

    id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    __int16 v19 = [MEMORY[0x263EFF980] array];
    uint64_t v20 = [MEMORY[0x263EFF980] array];
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke;
    v73[3] = &unk_264E9AB58;
    id v21 = v17;
    id v74 = v21;
    __int16 v75 = self;
    id v22 = v19;
    id v76 = v22;
    id v23 = v20;
    id v77 = v23;
    id v58 = v18;
    id v78 = v58;
    [v9 enumerateKeysAndObjectsUsingBlock:v73];
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_77;
    v69[3] = &unk_264E9AB80;
    v69[4] = self;
    uint64_t v72 = 0;
    id v24 = v22;
    id v70 = v24;
    id v25 = v23;
    id v71 = v25;
    __int16 v59 = v21;
    [v21 enumerateKeysAndObjectsUsingBlock:v69];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v23) = objc_opt_respondsToSelector();

    if (v23)
    {
      id v27 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v28 = [(NNMKSyncProvider *)self _watchAccounts];
      [v27 syncProvider:self didUpdateWatchAccounts:v28];
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v29 = v24;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v65 objects:v80 count:16];
    id v31 = v29;
    if (v30)
    {
      uint64_t v32 = v30;
      uint64_t v33 = *(void *)v66;
LABEL_11:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v66 != v33) {
          objc_enumerationMutation(v29);
        }
        if ([*(id *)(*((void *)&v65 + 1) + 8 * v34) maySupportStandaloneMode]) {
          break;
        }
        if (v32 == ++v34)
        {
          uint64_t v32 = [v29 countByEnumeratingWithState:&v65 objects:v80 count:16];
          if (v32) {
            goto LABEL_11;
          }
          id v31 = v29;
          goto LABEL_22;
        }
      }

      id v35 = objc_loadWeakRetained((id *)&self->_delegate);
      char v36 = objc_opt_respondsToSelector();

      if ((v36 & 1) == 0) {
        goto LABEL_23;
      }
      uint64_t v37 = (void *)qword_26AC21860;
      if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v38 = v37;
        uint64_t v39 = [v29 firstObject];
        __int16 v40 = [v39 accountId];
        uint64_t v41 = [v29 firstObject];
        uint64_t v42 = [v41 standaloneState];
        *(_DWORD *)buf = 138543618;
        double v82 = *(double *)&v40;
        __int16 v83 = 2048;
        uint64_t v84 = v42;
        _os_log_impl(&dword_23D3DF000, v38, OS_LOG_TYPE_DEFAULT, "Requesting re-authentication for account: %{public}@ - State: %lu", buf, 0x16u);
      }
      id v31 = objc_loadWeakRetained((id *)&self->_delegate);
      BOOL v43 = [v29 firstObject];
      [v31 syncProvider:self didRequestReauthenticationForAccount:v43];
    }
LABEL_22:

LABEL_23:
    __int16 v57 = v29;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v44 = v25;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v61 objects:v79 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v62 != v47) {
            objc_enumerationMutation(v44);
          }
          long long v49 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          id v50 = objc_loadWeakRetained((id *)&self->_delegate);
          char v51 = objc_opt_respondsToSelector();

          if (v51)
          {
            __int16 v52 = (void *)qword_26AC21860;
            if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v53 = v52;
              uint64_t v54 = [v49 accountId];
              uint64_t v55 = [v49 standaloneState];
              *(_DWORD *)buf = 138543618;
              double v82 = *(double *)&v54;
              __int16 v83 = 2048;
              uint64_t v84 = v55;
              _os_log_impl(&dword_23D3DF000, v53, OS_LOG_TYPE_DEFAULT, "Notifying authentication failed for account: %{public}@ - State: %lu", buf, 0x16u);
            }
            id v56 = objc_loadWeakRetained((id *)&self->_delegate);
            [v56 syncProvider:self didFailAuthenticatingAccount:v49];
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v61 objects:v79 count:16];
      }
      while (v46);
    }

    id v8 = v60;
  }
  else
  {
    uint64_t v12 = (void *)qword_26AC21860;
    if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
    {
      sessionController = self->_sessionController;
      uint64_t v14 = v12;
      [(NNMKSyncSessionController *)sessionController accountAuthRequestLastRequestTime];
      *(_DWORD *)buf = 134218240;
      double v82 = a5;
      __int16 v83 = 2048;
      uint64_t v84 = v15;
      _os_log_impl(&dword_23D3DF000, v14, OS_LOG_TYPE_DEFAULT, "Received outdated accounts status, Ignoring. requestTime: %f, lastRequestTime: %f", buf, 0x16u);
    }
  }
}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v7)
  {
    [*(id *)(a1 + 32) removeObjectForKey:v5];
    id v8 = [v7 username];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 40) sessionController];
      uint64_t v10 = [v9 syncingAccountIdentityByUsername];
      double v11 = [v7 username];
      [v10 removeObjectForKey:v11];
    }
    uint64_t v12 = [*(id *)(a1 + 40) sessionController];
    uint64_t v13 = [v7 accountId];
    uint64_t v14 = [v12 standaloneStateForAccountId:v13];

    uint64_t v15 = [v6 standaloneState];
    if (v14 != v15)
    {
      uint64_t v16 = qword_26AC21860;
      if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v33 = v5;
        __int16 v34 = 2048;
        uint64_t v35 = v15;
        _os_log_impl(&dword_23D3DF000, v16, OS_LOG_TYPE_DEFAULT, "Updating standalone state for account. Account: %{public}@ - State: %lu", buf, 0x16u);
      }
      int v17 = [*(id *)(a1 + 40) sessionController];
      [v17 updateStandaloneState:v15 forAccountId:v5];

      if (v14 == 2 && v15 != 2)
      {
        id v18 = *(void **)(a1 + 48);
LABEL_15:
        __int16 v19 = [v7 account];
        [v18 addObject:v19];

        goto LABEL_16;
      }
      if (v14 == 1 && v15 != 2)
      {
        id v18 = *(void **)(a1 + 56);
        goto LABEL_15;
      }
    }
LABEL_16:
    uint64_t v20 = [v7 emailAddressToken];
    if (v20)
    {
      id v21 = (void *)v20;
      id v22 = [v7 emailAddressToken];
      id v23 = [v6 emailAddressToken];
      char v24 = [v22 isEqualToString:v23];

      if (v24)
      {
LABEL_19:
        uint64_t v28 = [NSNumber numberWithUnsignedInteger:v15];
        [*(id *)(a1 + 64) setObject:v28 forKeyedSubscript:v5];

        goto LABEL_20;
      }
    }
    else
    {
      id v29 = [v6 emailAddressToken];

      if (!v29) {
        goto LABEL_19;
      }
    }
    id v25 = [v6 emailAddressToken];
    [v7 setEmailAddressToken:v25];

    uint64_t v26 = [v6 pccEmailAddress];
    [v7 setPccEmailAddress:v26];

    [*(id *)(*(void *)(a1 + 40) + 72) addOrUpdateSyncedAccount:v7];
    id v27 = [v7 account];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_74;
    v30[3] = &unk_264E9AB30;
    id v31 = v7;
    +[NNMKStandaloneAccountHelper saveLocalAccountProperties:v27 withCompletion:v30];

    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR)) {
    __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_cold_1();
  }
LABEL_20:
}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_74(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)qword_26AC21860;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(void **)(a1 + 32);
      id v8 = v6;
      id v9 = [v7 emailAddressToken];
      v10[0] = 67109120;
      v10[1] = v9 != 0;
      _os_log_impl(&dword_23D3DF000, v8, OS_LOG_TYPE_DEFAULT, "#cloud-notifications Updated local account properties (hasToken: %d)", (uint8_t *)v10, 8u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR))
  {
    __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_74_cold_1(a1, v6);
  }
}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) sessionController];
  uint64_t v8 = [v7 standaloneStateForAccountId:v5];

  if (v8 != *(void *)(a1 + 56))
  {
    id v9 = qword_26AC21860;
    if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      int v20 = 138543618;
      id v21 = v5;
      __int16 v22 = 2048;
      uint64_t v23 = v10;
      _os_log_impl(&dword_23D3DF000, v9, OS_LOG_TYPE_DEFAULT, "Updating standalone state for account. Account: %{public}@ - State: %lu", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v11 = [*(id *)(a1 + 32) sessionController];
    [v11 updateStandaloneState:*(void *)(a1 + 56) forAccountId:v5];

    uint64_t v12 = [v6 username];

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) sessionController];
      uint64_t v14 = [v13 syncingAccountIdentityByUsername];
      uint64_t v15 = [v6 username];
      [v14 removeObjectForKey:v15];
    }
    uint64_t v16 = [v6 account];
    int v17 = [*(id *)(a1 + 32) sessionController];
    id v18 = [v16 accountId];
    objc_msgSend(v16, "setStandaloneState:", objc_msgSend(v17, "standaloneStateForAccountId:", v18));

    if (v8 == 1)
    {
      __int16 v19 = (id *)(a1 + 48);
    }
    else
    {
      if (v8 != 2)
      {
LABEL_11:

        goto LABEL_12;
      }
      __int16 v19 = (id *)(a1 + 40);
    }
    [*v19 addObject:v16];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)fetchesSyncServiceServer:(id)a3 didFailSendingProtobufWithIDSIdentifier:(id)a4 errorCode:(int64_t)a5
{
}

- (void)fetchesSyncServiceServer:(id)a3 didSendProtobufSuccessfullyWithIDSIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(NNMKSyncProvider *)self resendScheduler];
  [v6 handleIDSMessageSentSuccessfullyWithId:v5];
}

- (void)fetchesSyncServiceServer:(id)a3 didRequestFetchInBatch:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = -[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:](self, "_verifyDatabaseOkForFullSyncVersion:", [v5 fullSyncVersion]);
  int v7 = (void *)qword_26AC21850;
  BOOL v8 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = v7;
      uint64_t v10 = [v5 fetchRequests];
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = [v10 count];
      _os_log_impl(&dword_23D3DF000, v9, OS_LOG_TYPE_DEFAULT, "#FETCH requested (Requests: %lu)", buf, 0xCu);
    }
    uint64_t v11 = (void *)MEMORY[0x263EFF980];
    uint64_t v12 = [v5 fetchRequests];
    uint64_t v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

    uint64_t v14 = (void *)MEMORY[0x263EFF980];
    uint64_t v15 = [v5 fetchRequests];
    uint64_t v32 = objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v31 = v5;
    uint64_t v16 = [v5 fetchRequests];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          char v33 = 0;
          __int16 v22 = [(NNMKSyncProvider *)self _handleFetchRequest:v21 shouldResumeSync:&v33];
          if (v22)
          {
            uint64_t v23 = (void *)qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = v23;
              if ([v21 wantsBatchedResponse]) {
                id v25 = @"#BATCHED_RESPONSE";
              }
              else {
                id v25 = &stru_26F11E918;
              }
              uint64_t v26 = [v22 mailboxId];
              *(_DWORD *)buf = 138543618;
              uint64_t v39 = (uint64_t)v25;
              __int16 v40 = 2114;
              uint64_t v41 = v26;
              _os_log_impl(&dword_23D3DF000, v24, OS_LOG_TYPE_DEFAULT, "Handling #FETCH %{public}@. (Mailbox id: %{public}@)", buf, 0x16u);
            }
            [v13 addObject:v22];
            if (v33) {
              [v32 addObject:v22];
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v18);
    }

    id v5 = v31;
    if ([v31 wantsBatchedResponse])
    {
      id v27 = [(NNMKSyncProvider *)self batchRequestHandler];
      [v27 startFetchTimeout];
    }
    if ([v13 count]) {
      [(NNMKSyncProvider *)self _requestDelegateForFetchForMailboxes:v13];
    }
    if ([v32 count])
    {
      uint64_t v28 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D3DF000, v28, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes to resume sync due to fetch request.", buf, 2u);
      }
      [(NNMKSyncProvider *)self _triggerFullSyncForMailboxes:v32];
    }
    [(NNMKSyncProvider *)self _verifyPairingForcingSync:0];
  }
  else
  {
    if (v8)
    {
      id v29 = v7;
      uint64_t v30 = [v5 fetchRequests];
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = [v30 count];
      _os_log_impl(&dword_23D3DF000, v29, OS_LOG_TYPE_DEFAULT, "#FETCH requested but #sync-version verification failed. (Requests: %lu)", buf, 0xCu);
    }
    [(NNMKSyncProvider *)self _verifyPairingForcingSync:1];
  }
}

- (id)_handleFetchRequest:(id)a3 shouldResumeSync:(BOOL *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(NNMKSyncProvider *)self syncController];
  BOOL v8 = [v6 mailboxId];
  id v9 = [v7 mailboxWithId:v8];

  if (v9)
  {
    if (![v9 syncActive]
      || ![v9 syncEnabled]
      || [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry isMessagesSyncSuspendedByConnectivity])
    {
      if ([v9 syncRequested])
      {
        uint64_t v10 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = v10;
          uint64_t v12 = [v6 mailboxId];
          uint64_t v13 = [v9 syncRequestedDate];
          int v25 = 138543618;
          uint64_t v26 = v12;
          __int16 v27 = 2114;
          uint64_t v28 = v13;
          _os_log_impl(&dword_23D3DF000, v11, OS_LOG_TYPE_DEFAULT, "Not enabling mailbox because syncRequested for mailbox: %{public}@, request date: %{public}@", (uint8_t *)&v25, 0x16u);
        }
      }
      else if (a4)
      {
        char v15 = [v9 syncEnabled];
        uint64_t v16 = (void *)qword_26AC21850;
        BOOL v17 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v17)
          {
            uint64_t v18 = v16;
            uint64_t v19 = [v6 mailboxId];
            int v25 = 138543362;
            uint64_t v26 = v19;
            _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "Ending suspensions, as we've received a fetch request for mailbox: %{public}@", (uint8_t *)&v25, 0xCu);
          }
        }
        else
        {
          if (v17)
          {
            int v20 = v16;
            id v21 = [v6 mailboxId];
            int v25 = 138543362;
            uint64_t v26 = v21;
            _os_log_impl(&dword_23D3DF000, v20, OS_LOG_TYPE_DEFAULT, "Enabling mailbox due to a fetch request from the mailbox: %{public}@", (uint8_t *)&v25, 0xCu);
          }
          [v9 setSyncEnabled:1];
          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry updateSyncEnabledForMailbox:v9];
        }
        *a4 = 1;
      }
      [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setIsMessagesSyncSuspendedByConnectivity:0];
      [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setDisconnectedSince:0];
    }
    __int16 v22 = [(NNMKSyncProvider *)self batchRequestHandler];
    [v22 handleBatchRequest:v6];

    id v23 = v9;
  }
  else
  {
    uint64_t v14 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider _handleFetchRequest:shouldResumeSync:](v14);
    }
    [(NNMKSyncProvider *)self _handleMailboxesDesync];
  }

  return v9;
}

- (void)_handleMailboxesDesync
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "Ignoring mailboxes desync and #initial-sync because no accounts are synced yet", v2, v3, v4, v5, v6);
}

void __42__NNMKSyncProvider__handleMailboxesDesync__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NNMKSyncProvider__handleMailboxesDesync__block_invoke_2;
  block[3] = &unk_264E99F20;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __42__NNMKSyncProvider__handleMailboxesDesync__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "Triggering #initial-sync because of mailbox desync detected", v5, 2u);
  }
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [*(id *)(*(void *)(a1 + 32) + 144) setLastSyncDueToMailboxesMismatchRequestTime:v3];

  return [*(id *)(a1 + 32) _triggerInitialSync];
}

- (void)fetchesSyncServiceServer:(id)a3 didRequestFetch:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 fullSyncVersion];
  int v7 = [(NNMKSyncProvider *)self syncController];
  BOOL v8 = [v5 mailboxId];
  id v9 = [v7 mailboxWithId:v8];
  LOBYTE(v6) = [(NNMKSyncProvider *)self _verifyDatabaseOkForFullSyncVersion:v6 mailbox:v9];

  if (v6)
  {
    char v18 = 0;
    uint64_t v10 = [(NNMKSyncProvider *)self _handleFetchRequest:v5 shouldResumeSync:&v18];
    if ([v5 wantsBatchedResponse])
    {
      uint64_t v11 = [(NNMKSyncProvider *)self batchRequestHandler];
      [v11 startFetchTimeout];
    }
    if (v10)
    {
      int v20 = v10;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
      [(NNMKSyncProvider *)self _requestDelegateForFetchForMailboxes:v12];

      if (v18)
      {
        uint64_t v13 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes to resume sync due to fetch request.", buf, 2u);
        }
        uint64_t v19 = v10;
        uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
        [(NNMKSyncProvider *)self _triggerFullSyncForMailboxes:v14];
      }
    }
    [(NNMKSyncProvider *)self _verifyPairingForcingSync:0];
  }
  else
  {
    char v15 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      BOOL v17 = [v5 mailboxId];
      *(_DWORD *)buf = 138543362;
      __int16 v22 = v17;
      _os_log_impl(&dword_23D3DF000, v16, OS_LOG_TYPE_DEFAULT, "Fetch Requested but #sync-version verification failed. (Mailbox: %{public}@)", buf, 0xCu);
    }
    [(NNMKSyncProvider *)self _verifyPairingForcingSync:1];
  }
}

- (void)fetchesSyncServiceServer:(id)a3 didRequestMoreMessagesInBatch:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:](self, "_verifyDatabaseOkForFullSyncVersion:", [v5 fullSyncVersion]))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = objc_msgSend(v5, "moreMessagesRequests", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [(NNMKSyncProvider *)self _handleFetchRequestFromWatch:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider fetchesSyncServiceServer:didRequestMoreMessagesInBatch:]();
  }
}

- (void)fetchesSyncServiceServer:(id)a3 didRequestMoreMessages:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NNMKSyncProvider *)self syncController];
  uint64_t v7 = [v5 mailboxId];
  uint64_t v8 = [v6 mailboxWithId:v7];

  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", [v5 fullSyncVersion], v8))
  {
    [(NNMKSyncProvider *)self _handleFetchRequestFromWatch:v5];
  }
  else
  {
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider fetchesSyncServiceServer:didRequestMoreMessages:](v9, v5);
    }
  }
}

- (void)_handleFetchRequestFromWatch:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = [v4 filterType];
  uint64_t v6 = [(NNMKSyncProvider *)self syncController];
  uint64_t v7 = [v4 mailboxId];
  uint64_t v8 = [v6 mailboxWithId:v7];

  if (v8)
  {
    uint64_t v9 = v5;
    uint64_t v10 = [v8 filterType];
    if (v5) {
      BOOL v11 = v10 == v5;
    }
    else {
      BOOL v11 = 1;
    }
    int v12 = !v11;
    if (!v11) {
      [v8 setFilterType:v5];
    }
    long long v13 = (void *)MEMORY[0x263F08928];
    uint64_t v14 = objc_opt_class();
    char v15 = [v4 beforeDateReceived];
    uint64_t v16 = [v13 unarchivedObjectOfClass:v14 fromData:v15 error:0];

    BOOL v17 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = v17;
      uint64_t v19 = [v8 mailboxId];
      int v24 = 138543874;
      int v25 = v16;
      __int16 v26 = 2048;
      uint64_t v27 = v9;
      __int16 v28 = 2114;
      uint64_t v29 = v19;
      _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "#LOAD_MORE_MESSAGES Requested (Date Request: %{public}@, Filter type: %lu, Mailbox: %{public}@)", (uint8_t *)&v24, 0x20u);
    }
    if (v12) {
      uint64_t v20 = [v8 filterType];
    }
    else {
      uint64_t v20 = 0;
    }
    [(NNMKSyncProvider *)self _requestDelegateForMoreMessagesWithMailbox:v8 beforeDate:v16 messagesForspecialMailboxFilterType:v20];
  }
  else
  {
    id v21 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = v21;
      uint64_t v23 = [v4 mailboxId];
      int v24 = 138543362;
      int v25 = v23;
      _os_log_impl(&dword_23D3DF000, v22, OS_LOG_TYPE_DEFAULT, "No mailbox found. #LOAD_MORE_MESSAGES request will be ignored. Id: %{public}@", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)fetchesSyncServiceServer:(id)a3 didRequestMoreMessagesForConversation:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(NNMKSyncProvider *)self syncController];
  uint64_t v7 = [v5 mailboxId];
  uint64_t v8 = [v6 mailboxWithId:v7];

  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", [v5 fullSyncVersion], v8)&& -[NNMKDeviceSyncRegistry organizeByThread](self->_pairedDeviceRegistry, "organizeByThread"))
  {
    uint64_t v9 = [v5 conversationId];
    uint64_t v10 = (void *)MEMORY[0x263F08928];
    uint64_t v11 = objc_opt_class();
    int v12 = [v5 beforeDateReceived];
    long long v13 = [v10 unarchivedObjectOfClass:v11 fromData:v12 error:0];

    uint64_t v14 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      BOOL v17 = v9;
      _os_log_impl(&dword_23D3DF000, v14, OS_LOG_TYPE_DEFAULT, "#LOAD_MORE_MESSAGES Requested (Conversation Id: %{public}@)", (uint8_t *)&v16, 0xCu);
    }
    [(NNMKSyncProvider *)self _requestDelegateForMoreMessagesBeforeDateReceived:v13 forConversationWithId:v9 mailbox:v8];
  }
  else
  {
    char v15 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider fetchesSyncServiceServer:didRequestMoreMessagesForConversation:](v15);
    }
  }
}

- (void)fetchesSyncServiceServer:(id)a3 didRequestContent:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(NNMKSyncProvider *)self syncController];
  uint64_t v7 = [v5 messageId];
  uint64_t v8 = [v6 messageIdFromWatchMessageId:v7];

  uint64_t v9 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncedMessageForMessageWithId:v8];
  uint64_t v10 = [v9 mailboxId];

  uint64_t v11 = [(NNMKSyncProvider *)self syncController];
  int v12 = [v11 mailboxWithId:v10];

  if (-[NNMKSyncProvider _verifyDatabaseOkForFullSyncVersion:mailbox:](self, "_verifyDatabaseOkForFullSyncVersion:mailbox:", [v5 fullSyncVersion], v12))
  {
    long long v13 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncedMessageForMessageWithId:v8];
    if (v13)
    {
      if (([v5 highPriority] & 1) != 0 || (objc_msgSend(v13, "contentSynced") & 1) == 0)
      {
        BOOL v17 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = v17;
          int v19 = 138543618;
          uint64_t v20 = v8;
          __int16 v21 = 1024;
          int v22 = [v5 highPriority];
          _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "Message Content Requested (Id: %{public}@, High Priority: %d).", (uint8_t *)&v19, 0x12u);
        }
        if ([v5 highPriority] && (objc_msgSend(v13, "contentRequestedByUser") & 1) == 0)
        {
          [v13 setContentRequestedByUser:1];
          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry addOrUpdateSyncedMessage:v13];
        }
        -[NNMKSyncProvider _requestDelegateForContentForMessageWithId:highPriority:](self, "_requestDelegateForContentForMessageWithId:highPriority:", v8, [v5 highPriority]);
      }
      else
      {
        uint64_t v14 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          char v15 = v14;
          int v19 = 138543618;
          uint64_t v20 = v8;
          __int16 v21 = 1024;
          int v22 = [v5 highPriority];
          _os_log_impl(&dword_23D3DF000, v15, OS_LOG_TYPE_DEFAULT, "Message Content Requested but not processed, as it has been requested multiple times (Id: %{public}@, High Priority: %d).", (uint8_t *)&v19, 0x12u);
        }
      }
    }
  }
  else
  {
    int v16 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138543874;
      uint64_t v20 = v10;
      __int16 v21 = 1024;
      int v22 = v12 != 0;
      __int16 v23 = 2114;
      int v24 = v8;
      _os_log_error_impl(&dword_23D3DF000, v16, OS_LOG_TYPE_ERROR, "Ignoring did request content. Mailbox %{public}@ (exists: %d), messageId: %{public}@", (uint8_t *)&v19, 0x1Cu);
    }
  }
}

- (void)fetchesSyncServiceServer:(id)a3 didRequestFullSync:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_pairedDeviceRegistry)
  {
    -[NNMKSyncProvider _fastForwardToFullSyncVersion:](self, "_fastForwardToFullSyncVersion:", [v7 fullSyncVersion]);
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      int v13 = 134217984;
      uint64_t v14 = [v8 fullSyncVersion];
      _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "#full-sync requested (Version in Client: %lu). Triggering #initial-sync...", (uint8_t *)&v13, 0xCu);
    }
    [(NNMKSyncProvider *)self _triggerInitialSync];
  }
  else
  {
    uint64_t v11 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v11;
      int v13 = 134217984;
      uint64_t v14 = [v8 fullSyncVersion];
      _os_log_impl(&dword_23D3DF000, v12, OS_LOG_TYPE_DEFAULT, "#full-sync requested, but we haven't detected any pairing yet. Ignoring the #full-sync request and waiting... (Version in Client: %lu)", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)fetchesSyncServiceServer:(id)a3 didRequestHaltSync:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  uint64_t v9 = (void *)qword_26AC21850;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
  if (pairedDeviceRegistry)
  {
    if (v10)
    {
      uint64_t v11 = v9;
      *(_DWORD *)buf = 134217984;
      unint64_t v30 = [v7 fullSyncVersion];
      _os_log_impl(&dword_23D3DF000, v11, OS_LOG_TYPE_DEFAULT, "halt-sync requested (Version in Client: %lu). Triggering...", buf, 0xCu);
    }
    int v12 = [v7 mailboxId];

    if (v12)
    {
      int v13 = [(NNMKSyncProvider *)self syncController];
      uint64_t v14 = [v7 mailboxId];
      uint64_t v15 = [v13 mailboxWithId:v14];

      if (v15)
      {
        [(NNMKSyncProvider *)self _handleHaltSyncForMailbox:v15];
      }
      else
      {
        __int16 v21 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = v21;
          __int16 v23 = [v7 mailboxId];
          *(_DWORD *)buf = 138543362;
          unint64_t v30 = (unint64_t)v23;
          _os_log_impl(&dword_23D3DF000, v22, OS_LOG_TYPE_DEFAULT, "halt-sync requested for unknown mailbox %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v15 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry activeMailboxes];
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v15);
            }
            [(NNMKSyncProvider *)self _handleHaltSyncForMailbox:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          }
          uint64_t v18 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v18);
      }
    }
  }
  else if (v10)
  {
    int v16 = v9;
    *(_DWORD *)buf = 134217984;
    unint64_t v30 = [v7 fullSyncVersion];
    _os_log_impl(&dword_23D3DF000, v16, OS_LOG_TYPE_DEFAULT, "halt-sync requested, but we haven't detected any pairing yet. Ignoring the halt sync request and waiting... (Version in Client: %lu)", buf, 0xCu);
  }
}

- (void)_handleHaltSyncForMailbox:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 syncEnabled] && (objc_msgSend(v4, "syncActive") & 1) == 0)
  {
    uint64_t v8 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      BOOL v10 = [v4 mailboxId];
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl(&dword_23D3DF000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring halt-sync request. Mailbox is not active. (Mailbox Id: %{public}@)", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v5 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [v4 mailboxId];
      int v11 = 138543362;
      int v12 = v7;
      _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "halt-sync started for mailbox. (Mailbox id: %{public}@)", (uint8_t *)&v11, 0xCu);
    }
    [v4 setSyncActive:0];
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry updateSyncActiveForMailbox:v4];
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry cleanUpForFullSyncWithMailbox:v4];
  }
}

- (void)fetchesSyncServiceServer:(id)a3 didNotifyInitialSyncFinished:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
  if ([v6 isTrackingInitialSync])
  {
    int v7 = [v5 fullSyncVersion];
    unint64_t v8 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion];

    if (v8 == v7)
    {
      uint64_t v9 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
      [v9 syncCompleted];

      goto LABEL_7;
    }
  }
  else
  {
  }
  BOOL v10 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = v10;
    int v12 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
    int v13 = [v12 isTrackingInitialSync];
    unint64_t v14 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion];
    v15[0] = 67109376;
    v15[1] = v13;
    __int16 v16 = 2048;
    unint64_t v17 = v14;
    _os_log_impl(&dword_23D3DF000, v11, OS_LOG_TYPE_DEFAULT, "#initial-sync finished notification received. However, we're no longer waiting for it. Ignoring... (Tracking: %d - Current #sync-version: %lu)", (uint8_t *)v15, 0x12u);
  }
LABEL_7:
}

- (void)fetchesSyncServiceServer:(id)a3 didNotifyAboutWebKitStatus:(id)a4
{
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a4, "supportsWebKit", a3));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setSupportsWebKit:v5];
}

- (void)syncStateManagerDidUnpair:(id)a3
{
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NNMKSyncProvider_syncStateManagerDidUnpair___block_invoke;
  block[3] = &unk_264E99F20;
  void block[4] = self;
  dispatch_async(providerQueue, block);
}

uint64_t __46__NNMKSyncProvider_syncStateManagerDidUnpair___block_invoke(uint64_t a1)
{
  uint64_t v2 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Unpairing detected. Triggering verification to insure we don't stop sync'ing if we still have another device we're talking to...", v4, 2u);
  }
  return [*(id *)(a1 + 32) _verifyPairingForcingSync:0];
}

- (void)syncStateManagerDidChangePairedDevice:(id)a3
{
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NNMKSyncProvider_syncStateManagerDidChangePairedDevice___block_invoke;
  block[3] = &unk_264E99F20;
  void block[4] = self;
  dispatch_async(providerQueue, block);
}

uint64_t __58__NNMKSyncProvider_syncStateManagerDidChangePairedDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Paired device changed. Handling as unpaired...", v4, 2u);
  }
  [*(id *)(a1 + 32) _handleDidUnpair];
  return [*(id *)(a1 + 32) _verifyPairingForcingSync:0];
}

- (void)syncStateManagerDidBeginSyncSession:(id)a3 syncSessionType:(id)a4 syncSessionIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__NNMKSyncProvider_syncStateManagerDidBeginSyncSession_syncSessionType_syncSessionIdentifier___block_invoke;
  block[3] = &unk_264E9A308;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(providerQueue, block);
}

void __94__NNMKSyncProvider_syncStateManagerDidBeginSyncSession_syncSessionType_syncSessionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) pairedDeviceRegistryPath];
  uint64_t v3 = qword_26AC21850;
  BOOL v4 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v11 = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE New session began, but we're already paired. (Type: %{public}@, Session ID: %{public}@). Responding with success...", (uint8_t *)&v11, 0x16u);
    }
    id v7 = [*(id *)(a1 + 32) initialSyncProgressTracker];
    [v7 startTrackingInitialSync];

    id v8 = [*(id *)(a1 + 32) initialSyncProgressTracker];
    [v8 syncCompleted];
  }
  else
  {
    if (v4)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE New session began, requesting #initial-sync (Type: %{public}@, Session ID: %{public}@). Triggering #initial-sync...", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 32) _handleDidPairWithNewDevice];
  }
}

- (void)syncStateManagerDidInvalidateSyncSession:(id)a3 syncSessionIdentifier:(id)a4
{
  id v5 = a4;
  providerQueue = self->_providerQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__NNMKSyncProvider_syncStateManagerDidInvalidateSyncSession_syncSessionIdentifier___block_invoke;
  v8[3] = &unk_264E99F48;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(providerQueue, v8);
}

uint64_t __83__NNMKSyncProvider_syncStateManagerDidInvalidateSyncSession_syncSessionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Session invalidate. Invalidating #full-sync (Session ID: %{public}@). We'll verify if everything seems alright...", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) _verifyPairingForcingSync:0];
}

- (BOOL)syncStateManagerShouldAddFavoriteSubsectionForMailboxId:(id)a3
{
  uint64_t v3 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry mailboxWithId:a3];
  BOOL v4 = [v3 type] != 1;

  return v4;
}

- (void)_handleDidPairWithNewDevice
{
  uint64_t v3 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE New Pairing Detected. Will trigger #initial-sync.", buf, 2u);
  }
  if ([(NNMKSyncProvider *)self setupPairedDeviceRegistry])
  {
    [(NNMKSyncProvider *)self _triggerInitialSyncTrackingProgress:1];
    [(NNMKSyncProvider *)self _storeScreenRelatedValues];
  }
  else
  {
    BOOL v4 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE No device registry path found. Unpairing...", v5, 2u);
    }
    [(NNMKSyncProvider *)self _handleDidUnpair];
  }
}

- (BOOL)setupPairedDeviceRegistry
{
  uint64_t v3 = [(NNMKSyncStateManager *)self->_syncStateManager pairingStorePath];
  BOOL v4 = v3;
  if (v3)
  {
    int v5 = [v3 stringByAppendingPathComponent:@"NanoMail/registry.sqlite"];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      uint64_t v7 = [[NNMKDeviceSyncRegistry alloc] initWithPath:v5];
      pairedDeviceRegistry = self->_pairedDeviceRegistry;
      self->_pairedDeviceRegistry = v7;

      [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setOrganizeByThread:1];
      [(NNMKDirectoryProvider *)self->_directoryProvider setPairedDeviceRegistryPath:v5];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider setupPairedDeviceRegistry]();
    }
    id v9 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
    [v9 startTrackingInitialSync];

    uint64_t v10 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
    [v10 syncFailedWithError:@"PairedDeviceRegistry returned no devices."];

    BOOL v6 = 0;
  }

  return v6;
}

- (void)_handleDidUnpair
{
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  self->_pairedDeviceRegistry = 0;

  [(NNMKDirectoryProvider *)self->_directoryProvider setPairedDeviceRegistryPath:0];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  int v5 = [(NNMKSyncProvider *)self sessionController];
  [v5 setMessageIdsToIgnoreStatusUpdates:v4];

  BOOL v6 = [(NNMKSyncProvider *)self sessionController];
  uint64_t v7 = [v6 notificationPayloadAcks];
  [v7 removeAllObjects];

  [(NNMKSyncProvider *)self _requestDelegateToStopDownloadingAllMessageElements];
  [(NNMKBatchRequestHandler *)self->_batchRequestHandler cancelFetchTimeout];
  batchRequestHandler = self->_batchRequestHandler;
  [(NNMKBatchRequestHandler *)batchRequestHandler reset];
}

- (void)_verifyPairingForcingSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v5 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
    -[NNMKSyncProvider _verifyPairingForcingSync:](v3, v5);
  }
  BOOL v6 = [(NNMKDirectoryProvider *)self->_directoryProvider pairedDeviceRegistryPath];
  uint64_t v7 = [(NNMKSyncStateManager *)self->_syncStateManager pairingStorePath];
  BOOL v8 = [(NNMKSyncProvider *)self _isPaired];
  if (v7) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    int v10 = 0;
  }
  else {
    int v10 = [v6 hasPrefix:v7] ^ 1;
  }
  BOOL v11 = [(NNMKSyncStateManager *)self->_syncStateManager isInitialSyncRestricted];
  if ((((v7 != 0) ^ v8) & 1) == 0 && !v10)
  {
    if (v8 && v3)
    {
      if ([(NNMKSyncProvider *)self _pairedDeviceSupportsMultipleMailboxes])
      {
        uint64_t v12 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_23D3DF000, v12, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE We are paired, but force re-sync was requested. Triggering #initial-sync", (uint8_t *)&v24, 2u);
        }
        [(NNMKSyncProvider *)self _triggerInitialSyncToRecoverFromSyncVersionMismatch];
      }
      else
      {
        __int16 v21 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncEnabledMailboxes];
        uint64_t v22 = [v21 count];

        if (!v22)
        {
          __int16 v23 = qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_23D3DF000, v23, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE We should be paired, but we don't have any synced mailbox. Forcing #initial-sync", (uint8_t *)&v24, 2u);
          }
          [(NNMKSyncProvider *)self _triggerInitialSync];
        }
      }
    }
    else
    {
      uint64_t v15 = (void *)qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        syncStateManager = self->_syncStateManager;
        unint64_t v17 = v15;
        uint64_t v18 = [(NNMKSyncStateManager *)syncStateManager pairingStorePath];
        LODWORD(v24) = 67240962;
        HIDWORD(v24) = v8;
        __int16 v25 = 1026;
        BOOL v26 = v7 != 0;
        __int16 v27 = 1024;
        BOOL v28 = v3;
        __int16 v29 = 2114;
        unint64_t v30 = v18;
        _os_log_impl(&dword_23D3DF000, v17, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE State has not changed. Initial sync will not be triggered (paired: %{public}d, should: %{public}d, force: %{piblic}d). SyncStateManager.pairingStorePath %{public}@", (uint8_t *)&v24, 0x1Eu);
      }
    }
    goto LABEL_38;
  }
  if (v7)
  {
    if (v8)
    {
      __int16 v13 = qword_26AC21850;
      if (!os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
LABEL_37:
        [(NNMKSyncProvider *)self _handleDidPairWithNewDevice];
        goto LABEL_38;
      }
      LOWORD(v24) = 0;
      uint64_t v14 = "#PAIRING_STATE Pairing verification determined we're paired with a new device. Will start syncing with new device...";
LABEL_20:
      _os_log_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v24, 2u);
      goto LABEL_37;
    }
    if (!v11)
    {
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
        -[NNMKSyncProvider _verifyPairingForcingSync:]();
      }
      goto LABEL_37;
    }
    if (v3
      && ![(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry isMessagesSyncSuspendedByConnectivity])
    {
      __int16 v13 = qword_26AC21850;
      if (!os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      LOWORD(v24) = 0;
      uint64_t v14 = "#PAIRING_STATE Pairing verification determined we're paired and we should force syncing, even though PairedS"
            "ync hasn't told Mail to start yet. Will force syncing...";
      goto LABEL_20;
    }
    uint64_t v20 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_23D3DF000, v20, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Pairing verification determined we're paired. However, we're waiting for PairedSync to tell us to start syncing. Waiting...", (uint8_t *)&v24, 2u);
    }
  }
  else
  {
    uint64_t v19 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_23D3DF000, v19, OS_LOG_TYPE_DEFAULT, "#PAIRING_STATE Pairing verification determined we're no longer paired. Will unpair...", (uint8_t *)&v24, 2u);
    }
    [(NNMKSyncProvider *)self _handleDidUnpair];
  }
LABEL_38:
}

- (void)_storeScreenRelatedValues
{
  BOOL v3 = [(NNMKSyncStateManager *)self->_syncStateManager pairedDeviceScreenSize];
  id v9 = v3;
  if (v3) {
    [v3 CGSizeValue];
  }
  else {
    double v4 = 200.0;
  }
  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setDeviceScreenWidth:v4];
  int v5 = [(NNMKSyncStateManager *)self->_syncStateManager pairedDeviceScreenScale];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 2.0;
  }
  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setDeviceScreenScale:v8];
  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setProtectedContentChannelSupported:[(NNMKSyncStateManager *)self->_syncStateManager pairedDeviceSupportsMailContentProtectedChannel]];
}

- (void)resendScheduler:(id)a3 didRequestRetryFullSyncForMailboxes:(id)a4
{
  id v5 = a4;
  BOOL v6 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v7 = 0;
    _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync for mailboxes due to retry.", v7, 2u);
  }
  [(NNMKSyncProvider *)self _triggerFullSyncForMailboxes:v5];
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingMailboxSelectionWithResendInterval:(unint64_t)a4
{
  unint64_t v6 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion];
  [(NNMKSyncProvider *)self _sendUpdatedMailboxSelection:v6 resendInterval:a4];
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingMessageWithIds:(id)a4
{
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingMessageDeletions:(id)a4 deletionsMessageIds:(id)a5 resendInterval:(unint64_t)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  char v33 = v8;
  obuint64_t j = [v8 allKeys];
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v35;
    *(void *)&long long v11 = 138543362;
    long long v30 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        __int16 v16 = -[NNMKDeviceSyncRegistry mailboxWithId:](self->_pairedDeviceRegistry, "mailboxWithId:", v15, v30);
        if (v16)
        {
          unint64_t v17 = [v33 objectForKeyedSubscript:v15];
          objc_msgSend(v17, "setFullSyncVersion:", -[NNMKDeviceSyncRegistry fullSyncVersion](self->_pairedDeviceRegistry, "fullSyncVersion"));
          uint64_t v18 = (void *)MEMORY[0x263F08910];
          uint64_t v19 = [MEMORY[0x263EFF910] date];
          uint64_t v20 = [v18 archivedDataWithRootObject:v19 requiringSecureCoding:1 error:0];
          [v17 setDateSynced:v20];

          __int16 v21 = [v16 mailboxId];
          [v17 setMailboxId:v21];

          pairedDeviceRegistry = self->_pairedDeviceRegistry;
          __int16 v23 = [v16 mailboxId];
          objc_msgSend(v17, "setMailboxSyncVersion:", -[NNMKDeviceSyncRegistry syncVersionForMailboxId:](pairedDeviceRegistry, "syncVersionForMailboxId:", v23));

          uint64_t v24 = [(NNMKMessagesSyncServiceServer *)self->_messagesSyncService deleteMessages:v17 notificationPriority:0];
          __int16 v25 = [(NNMKSyncProvider *)self resendScheduler];
          [v25 registerIDSIdentifier:v24 objectIds:v9 type:@"Message" resendInterval:a6];

          BOOL v26 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v27 = v26;
            BOOL v28 = objc_msgSend(v9, "nnmk_description");
            *(_DWORD *)buf = 138543618;
            uint64_t v39 = v24;
            __int16 v40 = 2114;
            uint64_t v41 = v28;
            _os_log_impl(&dword_23D3DF000, v27, OS_LOG_TYPE_DEFAULT, "Retrying sending message deletions. (IDS Identifier: %{public}@, deletions: %{public}@)", buf, 0x16u);
          }
        }
        else
        {
          __int16 v29 = qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            uint64_t v39 = v15;
            _os_log_impl(&dword_23D3DF000, v29, OS_LOG_TYPE_DEFAULT, "Mailbox does not exist anymore. Ignoring resend deletion. %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v12);
  }
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingContentForMessageId:(id)a4 highPriority:(BOOL)a5
{
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingAccountWithId:(id)a4
{
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingAccountIdentifier:(id)a4 resendInterval:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [(NNMKSyncProvider *)self sessionController];
  id v9 = [v8 syncingAccountIdentityByUsername];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    [(NNMKSyncProvider *)self _sendStandaloneAccountIdentity:v10 resendInterval:a5];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider resendScheduler:didRequestRetrySendingAccountIdentifier:resendInterval:]();
    }
    long long v11 = [(NNMKSyncProvider *)self pairedDeviceRegistry];
    uint64_t v12 = [v11 accountIdForUsername:v7];

    uint64_t v13 = [(NNMKSyncProvider *)self sessionController];
    [v13 updateStandaloneState:0 forAccountId:v12];
  }
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingVIPListWithResendInterval:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v6 = objc_alloc_init(NNMKRequestContext);
  [(NNMKRequestContext *)v6 setResendInterval:a4];
  id v7 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a4;
    _os_log_impl(&dword_23D3DF000, v7, OS_LOG_TYPE_DEFAULT, "Requesting VIP List to retry. Resend Interval: %lu", (uint8_t *)&v8, 0xCu);
  }
  [(NNMKSyncProvider *)self _requestDelegateForVIPList:v6];
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingDeletionForAccountWithId:(id)a4 resendInterval:(unint64_t)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  int v8 = objc_alloc_init(NNMKProtoAccountDeletion);
  [(NNMKProtoAccountDeletion *)v8 setAccountId:v7];
  unint64_t v9 = [(NNMKAccountsSyncServiceServer *)self->_accountsSyncService deleteAccount:v8];
  uint64_t v10 = [(NNMKSyncProvider *)self resendScheduler];
  v15[0] = v7;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v10 registerIDSIdentifier:v9 objectIds:v11 type:@"Account" resendInterval:a5];

  uint64_t v12 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    uint64_t v14 = v9;
    _os_log_impl(&dword_23D3DF000, v12, OS_LOG_TYPE_DEFAULT, "Retrying sending deletion for account. (IDS Identifier: %{public}@)", (uint8_t *)&v13, 0xCu);
  }
}

- (void)resendScheduler:(id)a3 didRequestRetrySendingComposeMessageProgress:(int64_t)a4 messageId:(id)a5 resendInterval:(unint64_t)a6
{
  v20[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(NNMKProtoComposedMessageSendingProgressReport);
  [(NNMKProtoComposedMessageSendingProgressReport *)v10 setComposedMessageId:v9];
  [(NNMKProtoComposedMessageSendingProgressReport *)v10 setProgress:a4];
  long long v11 = [(NNMKFetchesSyncServiceServer *)self->_fetchesSyncService reportComposedMessageSendingProgress:v10];
  uint64_t v12 = [(NNMKSyncProvider *)self resendScheduler];
  v20[0] = v9;
  int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  [v12 registerIDSIdentifier:v11 objectIds:v13 type:@"SendingProgress" resendInterval:a6];

  if (a4 == -1)
  {
    uint64_t v14 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      id v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      _os_log_impl(&dword_23D3DF000, v14, OS_LOG_TYPE_DEFAULT, "Failing composed message, as we restarted before even adding the message to the Outbox queue. (Composed Message Id: %{public}@ - IDS Identifier: %{public}@).", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v15 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v11;
    _os_log_impl(&dword_23D3DF000, v15, OS_LOG_TYPE_DEFAULT, "Retrying sending compose message progress. (IDS Identifier: %{public}@)", (uint8_t *)&v16, 0xCu);
  }
}

- (void)resendScheduler:(id)a3 didRequestEnqueueIDSIdentifierForResend:(id)a4 date:(id)a5 silent:(BOOL)a6
{
}

- (void)resendScheduler:(id)a3 didRequestEnqueueIDSIdentifiersForResend:(id)a4
{
}

- (void)resendScheduler:(id)a3 didRequestDequeueIDSIdentifierForResend:(id)a4
{
}

- (unint64_t)resendScheduler:(id)a3 didRequestNewResendIntervalForPreviousResendInterval:(unint64_t)a4 errorCode:(int64_t)a5
{
  return [(NNMKSyncEndpoint *)self newResendIntervalForPreviousResendInterval:a4 errorCode:a5];
}

- (BOOL)_verifyDatabaseOkForFullSyncVersion:(unint64_t)a3 mailbox:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  if (v6 && ([v6 syncActive] & 1) != 0)
  {
    BOOL v8 = [(NNMKSyncProvider *)self _verifyDatabaseOkForFullSyncVersion:a3];
  }
  else
  {
    [(NNMKSyncProvider *)self _fastForwardToFullSyncVersion:a3];
    id v9 = (void *)qword_26AC21850;
    BOOL v8 = 0;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      long long v11 = [v7 mailboxId];
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "Message received but sync isn't active. (Mailbox id: %{public}@) Discarding...", (uint8_t *)&v13, 0xCu);

      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_verifyDatabaseOkForFullSyncVersion:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion];
  unint64_t v6 = v5;
  if (v5 <= a3)
  {
    if (v5 >= a3) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
    {
      int v16 = v12;
      int v18 = 134218496;
      unint64_t v19 = a3;
      __int16 v20 = 2048;
      unint64_t v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = [(NNMKSyncProvider *)self _isPaired];
      _os_log_error_impl(&dword_23D3DF000, v16, OS_LOG_TYPE_ERROR, "Client has a #sync-version higher than what the server has (Version in Client: %lu - Local: %lu - Paired: %lu). Triggering #initial-sync...", (uint8_t *)&v18, 0x20u);
    }
    [(NNMKSyncProvider *)self _fastForwardToFullSyncVersion:a3];
    [(NNMKSyncProvider *)self _triggerInitialSyncToRecoverFromSyncVersionMismatch];
    int v13 = +[NNMKAnalytics sharedInstance];
    [v13 reportFullSyncRequestedFromDevice:1 corruptionDetected:0 migrationRelated:0 idsFailureRelated:0 fullSyncVersionMatchRelated:1];

    BOOL v14 = [(NNMKSyncProvider *)self _isPaired];
    LOBYTE(v10) = 0;
    if (v14) {
LABEL_15:
    }
      LOBYTE(v10) = 1;
  }
  else
  {
    if ((int)a3 - (int)v5 >= 0) {
      unsigned int v7 = a3 - v5;
    }
    else {
      unsigned int v7 = v5 - a3;
    }
    BOOL fullSyncRecoveredInThisSession = self->_fullSyncRecoveredInThisSession;
    id v9 = qword_26AC21850;
    BOOL v10 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
    if (!fullSyncRecoveredInThisSession && v7 >= 3)
    {
      if (v10)
      {
        int v18 = 134218240;
        unint64_t v19 = v6;
        __int16 v20 = 2048;
        unint64_t v21 = a3;
        _os_log_impl(&dword_23D3DF000, v9, OS_LOG_TYPE_DEFAULT, "Received message that has a #sync-version so distant from the local one that we're triggering a #initial-sync. (Local: %lu - Client: %lu).", (uint8_t *)&v18, 0x16u);
      }
      self->_BOOL fullSyncRecoveredInThisSession = 1;
      [(NNMKSyncProvider *)self _triggerInitialSyncToRecoverFromSyncVersionMismatch];
      uint64_t v15 = +[NNMKAnalytics sharedInstance];
      [v15 reportFullSyncRequestedFromDevice:1 corruptionDetected:0 migrationRelated:0 idsFailureRelated:0 fullSyncVersionMatchRelated:1];

      goto LABEL_19;
    }
    if (v10)
    {
      int v18 = 134218240;
      unint64_t v19 = v6;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      _os_log_impl(&dword_23D3DF000, v9, OS_LOG_TYPE_DEFAULT, "Message discarded because #sync-version is different (Local: %lu - Client: %lu).", (uint8_t *)&v18, 0x16u);
LABEL_19:
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (void)_addMessages:(id)a3 messagesAreNew:(BOOL)a4 mailbox:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(NNMKSyncProvider *)self persistenceHandler];
  uint64_t v55 = v8;
  long long v11 = [v10 addMessages:v8 containsNewMessages:v6 mailbox:v9];

  uint64_t v12 = [v11 protoMessagesWithNotificationPriority];
  uint64_t v13 = [v12 messageAdditionsCount];

  if (v13)
  {
    messagesSyncService = self->_messagesSyncService;
    uint64_t v15 = [v11 protoMessagesWithNotificationPriority];
    int v16 = [(NNMKMessagesSyncServiceServer *)messagesSyncService addMessages:v15 notificationPriority:1];

    id v17 = [(NNMKSyncProvider *)self resendScheduler];
    int v18 = [v11 messageIdsWithNotificationPriority];
    [v17 registerIDSIdentifier:v16 objectIds:v18 type:@"Message" resendInterval:0];

    unint64_t v19 = [v11 messageIdsWithNotificationPriority];
    [(NNMKSyncProvider *)self _requestDelegateForContentForMessageIds:v19 highPriority:1];

    __int16 v20 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      log = v20;
      unint64_t v21 = [v11 protoMessagesWithNotificationPriority];
      int v22 = v6;
      uint64_t v6 = [v21 messageAdditionsCount];
      uint64_t v23 = [v9 mailboxId];
      pairedDeviceRegistry = self->_pairedDeviceRegistry;
      __int16 v25 = [v9 mailboxId];
      *(_DWORD *)buf = 134218754;
      uint64_t v57 = v6;
      LODWORD(v6) = v22;
      __int16 v58 = 2114;
      __int16 v59 = v16;
      __int16 v60 = 2114;
      long long v61 = v23;
      __int16 v62 = 2048;
      uint64_t v63 = [(NNMKDeviceSyncRegistry *)pairedDeviceRegistry syncVersionForMailboxId:v25];
      _os_log_impl(&dword_23D3DF000, log, OS_LOG_TYPE_DEFAULT, "Messages sent with URGENT priority. (Count: %lu - IDS Identifier: %{public}@ - Mailbox: %{public}@ - #mailbox-sync-version: %lu).", buf, 0x2Au);
    }
  }
  BOOL v26 = [v11 protoMessagesWithDefaultPriority];
  uint64_t v27 = [v26 messageAdditionsCount];

  if (v27)
  {
    BOOL v28 = self->_messagesSyncService;
    __int16 v29 = [v11 protoMessagesWithDefaultPriority];
    long long v30 = [(NNMKMessagesSyncServiceServer *)v28 addMessages:v29 notificationPriority:0];

    uint64_t v31 = [(NNMKSyncProvider *)self resendScheduler];
    uint64_t v32 = [v11 messageIdsWithDefaultPriority];
    [v31 registerIDSIdentifier:v30 objectIds:v32 type:@"Message" resendInterval:0];

    char v33 = [v11 messageIdsWithDefaultPriority];
    long long v34 = v33;
    if (v6)
    {
      uint64_t v35 = [v33 count];

      if (v35)
      {
        unint64_t v36 = 1;
        do
        {
          long long v37 = [v11 messageIdsWithDefaultPriority];
          __int16 v38 = [v37 objectAtIndexedSubscript:v36 - 1];

          [(NNMKSyncProvider *)self _requestDelegateForContentForMessageWithId:v38 highPriority:0];
          uint64_t v39 = [v11 messageIdsWithDefaultPriority];
          unint64_t v40 = [v39 count];

          if (v36 >= v40) {
            break;
          }
        }
        while (v36++ < 0xA);
      }
    }
    else
    {
      [(NNMKSyncProvider *)self _requestDelegateForContentForMessageIds:v33 highPriority:0];
    }
    uint64_t v42 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      loga = v42;
      uint64_t v43 = [v11 protoMessagesWithDefaultPriority];
      uint64_t v44 = [v43 messageAdditionsCount];
      uint64_t v45 = [v9 mailboxId];
      uint64_t v46 = [(NNMKSyncProvider *)self currentDeviceRegistry];
      [v9 mailboxId];
      v48 = id v47 = v9;
      uint64_t v49 = [v46 syncVersionForMailboxId:v48];
      *(_DWORD *)buf = 134218754;
      uint64_t v57 = v44;
      __int16 v58 = 2114;
      __int16 v59 = v30;
      __int16 v60 = 2114;
      long long v61 = v45;
      __int16 v62 = 2048;
      uint64_t v63 = v49;
      _os_log_impl(&dword_23D3DF000, loga, OS_LOG_TYPE_DEFAULT, "Messages sent with DEFAULT priority. (Count: %lu - IDS Identifier: %{public}@ - Mailbox: %{public}@ - #mailbox-sync-version: %lu).", buf, 0x2Au);

      id v9 = v47;
    }
  }
  if ([v11 receivedOldMessages])
  {
    id v50 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v50, OS_LOG_TYPE_DEFAULT, "Old messages are available for fetching. Sending notification to client...", buf, 2u);
    }
    char v51 = objc_alloc_init(NNMKProtoOldMessagesAvailableNotification);
    [(NNMKProtoOldMessagesAvailableNotification *)v51 setFullSyncVersion:[(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion]];
    __int16 v52 = [v9 mailboxId];
    [(NNMKProtoOldMessagesAvailableNotification *)v51 setMailboxId:v52];

    [(NNMKFetchesSyncServiceServer *)self->_fetchesSyncService notifyOldMessagesAvailable:v51];
  }
}

- (void)_markConversationWithId:(id)a3 forState:(unint64_t)a4 include:(BOOL)a5 mailbox:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = [(NNMKSyncProvider *)self persistenceHandler];
  uint64_t v13 = [v12 updateMessagesFromConversation:v11 withState:a4 include:v6 mailbox:v10];

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __69__NNMKSyncProvider__markConversationWithId_forState_include_mailbox___block_invoke;
  v27[3] = &unk_264E9A9F0;
  v27[4] = self;
  BOOL v14 = (void (**)(void, void, void, void, void))MEMORY[0x23ED00AC0](v27);
  messagesSyncService = self->_messagesSyncService;
  int v16 = [v13 protoMessageUpdatesWithNotificationPriority];
  id v17 = [v13 messageIdsWithNotificationPriority];
  ((void (**)(void, NNMKMessagesSyncServiceServer *, void *, void *, uint64_t))v14)[2](v14, messagesSyncService, v16, v17, 1);

  int v18 = self->_messagesSyncService;
  unint64_t v19 = [v13 protoMessageUpdatesWithDefaultPriority];
  __int16 v20 = [v13 messageIdsWithDefaultPriority];
  ((void (**)(void, NNMKMessagesSyncServiceServer *, void *, void *, void))v14)[2](v14, v18, v19, v20, 0);

  protectedSyncService = self->_protectedSyncService;
  int v22 = [v13 protoMessageUpdatesWithDefaultPriorityAndProtectedChannel];
  uint64_t v23 = [v13 messageIdsWithDefaultPriorityAndProtectedChannel];
  ((void (**)(void, NNMKProtectedSyncServiceServer *, void *, void *, void))v14)[2](v14, protectedSyncService, v22, v23, 0);

  uint64_t v24 = [v13 messageIdsToDelete];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    BOOL v26 = [v13 messageIdsToDelete];
    [(NNMKSyncProvider *)self deleteMessagesWithIds:v26];
  }
}

void __69__NNMKSyncProvider__markConversationWithId_forState_include_mailbox___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v13 = a2;
  id v9 = a3;
  id v10 = a4;
  if ([v9 messageStatusUpdatesCount])
  {
    id v11 = [v13 updateMessagesStatus:v9 notificationPriority:a5];
    uint64_t v12 = [*(id *)(a1 + 32) resendScheduler];
    [v12 registerIDSIdentifier:v11 objectIds:v10 type:@"Message" resendInterval:0];
  }
}

- (id)_bbSubsectionIdsForMessage:(id)a3
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x263EFF9C0];
  unint64_t v5 = [v3 accountId];
  BOOL v6 = [v4 setWithObject:v5];

  if ([v3 checkState:64]) {
    [v6 addObject:@"com.apple.mobilemail.bulletin-subsection.VIP"];
  }
  if ([v3 checkState:128]) {
    [v6 addObject:@"com.apple.mobilemail.bulletin-subsection.ThreadNotify"];
  }

  return v6;
}

- (void)syncStateManager:(id)a3 handleForwardForNotification:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__NNMKSyncProvider_syncStateManager_handleForwardForNotification_completion___block_invoke;
  block[3] = &unk_264E9ABA8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(providerQueue, block);
}

uint64_t __77__NNMKSyncProvider_syncStateManager_handleForwardForNotification_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shouldHandleForwardForNotification:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)_shouldHandleForwardForNotification:(id)a3 withCompletion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [v6 request];
  id v9 = [v8 content];
  id v10 = [v9 userInfo];
  id v11 = [v10 objectForKeyedSubscript:@"com.apple.mail.nanoMessageId"];

  if (v11)
  {
    if (v7)
    {
      uint64_t v12 = [(NNMKSyncProvider *)self pairedDeviceRegistry];
      id v13 = [v12 syncedMessageForMessageWithId:v11];

      if (v13)
      {
        id v14 = [(NNMKSyncProvider *)self pairedDeviceRegistry];
        uint64_t v15 = [v13 mailboxId];
        int v16 = [v14 mailboxWithId:v15];

        id v17 = [v16 accountId];
      }
      else
      {
        int v16 = [v6 request];
        unint64_t v19 = [v16 content];
        __int16 v20 = [v19 userInfo];
        id v17 = [v20 objectForKeyedSubscript:@"com.apple.mail.accountReference"];
      }
      unint64_t v21 = [(NNMKSyncProvider *)self pairedDeviceRegistry];
      int v22 = [v21 syncedAccountForAccountWithId:v17];

      if ([v22 sourceType])
      {
        uint64_t v23 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = v23;
          uint64_t v25 = [v22 accountId];
          int v38 = 138543618;
          uint64_t v39 = v11;
          __int16 v40 = 2114;
          uint64_t v41 = v25;
          _os_log_impl(&dword_23D3DF000, v24, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Suppressing notification for message because account is in standalone mode. Message Id: %{public}@ - Account Id: %{public}@", (uint8_t *)&v38, 0x16u);
        }
        v7[2](v7, 0);
      }
      else
      {
        pairedDeviceRegistry = self->_pairedDeviceRegistry;
        if (pairedDeviceRegistry
          && ([(NNMKDeviceSyncRegistry *)pairedDeviceRegistry syncedMessageForMessageWithId:v11], (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          BOOL v28 = v27;
          if ([v27 contentSyncedUsingNotificationPriority])
          {
            __int16 v29 = qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
            {
              int v38 = 138543362;
              uint64_t v39 = v11;
              _os_log_impl(&dword_23D3DF000, v29, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message, but we already sync'ed the content through the high priority channel for this message. Notifying back... (Message Id: %{public}@)", (uint8_t *)&v38, 0xCu);
            }
            v7[2](v7, 1);
          }
          else
          {
            char v33 = [v28 usedNotificationPriorityForMessageSync];
            long long v34 = qword_26AC21850;
            if (v33)
            {
              if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
              {
                int v38 = 138543362;
                uint64_t v39 = v11;
                _os_log_impl(&dword_23D3DF000, v34, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message. We already have the message. Waiting for the content... (Message Id: %{public}@)", (uint8_t *)&v38, 0xCu);
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
                -[NNMKSyncProvider _shouldHandleForwardForNotification:withCompletion:]();
              }
              [v28 setUsedNotificationPriorityForMessageSync:1];
              if ([v28 contentSynced])
              {
                [v28 setContentSyncedBecauseUserRequested:0];
                [v28 setContentSynced:0];
                [(NNMKSyncProvider *)self _requestDelegateForContentForMessageWithId:v11 highPriority:1];
              }
              [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry addOrUpdateSyncedMessage:v28];
            }
            uint64_t v35 = (void *)MEMORY[0x23ED00AC0](v7);
            unint64_t v36 = [(NNMKSyncProvider *)self sessionController];
            long long v37 = [v36 notificationPayloadAcks];
            [v37 setObject:v35 forKeyedSubscript:v11];
          }
        }
        else
        {
          long long v30 = qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            int v38 = 138543362;
            uint64_t v39 = v11;
            _os_log_impl(&dword_23D3DF000, v30, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message. Waiting... (Message Id: %{public}@)", (uint8_t *)&v38, 0xCu);
          }
          BOOL v28 = (void *)MEMORY[0x23ED00AC0](v7);
          uint64_t v31 = [(NNMKSyncProvider *)self sessionController];
          uint64_t v32 = [v31 notificationPayloadAcks];
          [v32 setObject:v28 forKeyedSubscript:v11];
        }
      }
    }
    else
    {
      int v18 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_INFO))
      {
        int v38 = 138543362;
        uint64_t v39 = v11;
        _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_INFO, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message, but the ack handler was NULL. Ignoring... (Message Id: %{public}@)", (uint8_t *)&v38, 0xCu);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncProvider _shouldHandleForwardForNotification:withCompletion:]();
    }
    v7[2](v7, 1);
  }
}

- (void)_fastForwardToFullSyncVersion:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  if (pairedDeviceRegistry)
  {
    if ([(NNMKDeviceSyncRegistry *)pairedDeviceRegistry fullSyncVersion] < a3)
    {
      *(void *)&long long v6 = 134218240;
      long long v11 = v6;
      do
      {
        id v7 = (void *)qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = self->_pairedDeviceRegistry;
          id v9 = v7;
          uint64_t v10 = [(NNMKDeviceSyncRegistry *)v8 fullSyncVersion];
          *(_DWORD *)buf = v11;
          unint64_t v13 = a3 + 1;
          __int16 v14 = 2048;
          uint64_t v15 = v10;
          _os_log_impl(&dword_23D3DF000, v9, OS_LOG_TYPE_DEFAULT, "Fast forwarding #sync-version (To: %lu - Current: %lu).", buf, 0x16u);
        }
        -[NNMKDeviceSyncRegistry setFullSyncVersion:](self->_pairedDeviceRegistry, "setFullSyncVersion:", a3, v11);
        [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry cleanUpForInitialSync];
      }
      while ([(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion] < a3);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider _fastForwardToFullSyncVersion:]();
  }
}

- (void)_stopTaks
{
  [(NNMKSyncServiceEndpoint *)self->_messagesSyncService resetRepeatPreventionHistory];
  [(NNMKSyncServiceEndpoint *)self->_contentSyncService resetRepeatPreventionHistory];
  [(NNMKSyncServiceEndpoint *)self->_protectedSyncService resetRepeatPreventionHistory];
  [(NNMKSyncServiceEndpoint *)self->_protectedContentSyncService resetRepeatPreventionHistory];
  [(NNMKSyncServiceEndpoint *)self->_fetchesSyncService resetRepeatPreventionHistory];
  [(NNMKSyncServiceEndpoint *)self->_accountsSyncService resetRepeatPreventionHistory];
  id v3 = [(NNMKSyncProvider *)self sessionController];
  double v4 = [v3 notificationPayloadAcks];
  [v4 removeAllObjects];

  [(NNMKSyncProvider *)self _requestDelegateToStopDownloadingAllMessageElements];
}

- (BOOL)isMessageOkForSyncedMailboxes:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  providerQueue = self->_providerQueue;
  char v14 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__NNMKSyncProvider_isMessageOkForSyncedMailboxes___block_invoke;
  block[3] = &unk_264E9A500;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(providerQueue, block);
  LOBYTE(providerQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)providerQueue;
}

void __50__NNMKSyncProvider_isMessageOkForSyncedMailboxes___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) syncController];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 doesMessageBelongToSyncedMailboxes:*(void *)(a1 + 40)];
}

- (id)_messageProtobufForMessage:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NNMKSyncProvider *)self persistenceHandler];
  id v6 = [v5 protoMessageFromMessage:v4];

  return v6;
}

- (void)_checkConnectivityBasedSuspensionTimer:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry disconnectedSince];
  BOOL v6 = v5 != 0;

  if ((v6 ^ v3))
  {
    if (v3) {
      return;
    }
    goto LABEL_14;
  }
  id v7 = qword_26AC21850;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v7, OS_LOG_TYPE_DEFAULT, "Is now disconnected. Initiating timer to suspend sync.", buf, 2u);
    }
    id v9 = [MEMORY[0x263EFF910] date];
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setDisconnectedSince:v9];

LABEL_14:
    uint64_t v10 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry disconnectedSince];

    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x263EFF910];
      double v12 = *(double *)&kIntervalBeforeSuspendingDueToLackOfConnectivity;
      uint64_t v13 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry disconnectedSince];
      char v14 = [v11 dateWithTimeInterval:v13 sinceDate:v12];

      [v14 timeIntervalSinceNow];
      dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
      providerQueue = self->_providerQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__NNMKSyncProvider__checkConnectivityBasedSuspensionTimer___block_invoke;
      block[3] = &unk_264E99F20;
      void block[4] = self;
      dispatch_after(v16, providerQueue, block);
    }
    return;
  }
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
    -[NNMKSyncProvider _checkConnectivityBasedSuspensionTimer:]();
  }
  [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setDisconnectedSince:0];
  if ([(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry isMessagesSyncSuspendedByConnectivity])
  {
    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry setIsMessagesSyncSuspendedByConnectivity:0];
    id v8 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v8, OS_LOG_TYPE_DEFAULT, "Sync was suspending due to lack of connectivity. We're connected now, so resuming...", buf, 2u);
    }
    [(NNMKSyncProvider *)self _verifyPairingForcingSync:1];
  }
}

void __59__NNMKSyncProvider__checkConnectivityBasedSuspensionTimer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) disconnectedSince];
  if (v2)
  {
    BOOL v3 = (void *)v2;
    char v4 = [*(id *)(*(void *)(a1 + 32) + 72) isMessagesSyncSuspendedByConnectivity];

    if ((v4 & 1) == 0)
    {
      unint64_t v5 = (void *)MEMORY[0x263EFF910];
      double v6 = *(double *)&kIntervalBeforeSuspendingDueToLackOfConnectivity;
      id v7 = [*(id *)(*(void *)(a1 + 32) + 72) disconnectedSince];
      id v8 = [v5 dateWithTimeInterval:v7 sinceDate:v6];

      id v9 = [MEMORY[0x263EFF910] date];
      uint64_t v10 = [v9 compare:v8];

      if (v10 != -1)
      {
        uint64_t v11 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl(&dword_23D3DF000, v11, OS_LOG_TYPE_DEFAULT, "Suspending sync due to lack of connectivity...", v13, 2u);
        }
        [*(id *)(*(void *)(a1 + 32) + 72) setIsMessagesSyncSuspendedByConnectivity:1];
        double v12 = +[NNMKAnalytics sharedInstance];
        [v12 reportHaltSyncRequestedFromSource:0];

        [*(id *)(*(void *)(a1 + 32) + 72) cleanUpForInitialSync];
        [*(id *)(a1 + 32) _stopTaks];
      }
    }
  }
}

- (void)batchRequestHandlerDidTimeoutFetchRequest:(id)a3
{
  char v4 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "#FETCH #BATCHED_RESPONSE timed out. It will check if headers are available to respond back.", v5, 2u);
  }
  [(NNMKSyncProvider *)self _checkBatchFetchedMessages];
}

- (BOOL)_isConnectedToWatch
{
  return [(NNMKSyncProvider *)self _isUsingCompaionSync]
      || [(NNMKSyncServiceEndpoint *)self->_messagesSyncService connectivityState] == 4;
}

- (BOOL)_isUsingCompaionSync
{
  return [(NNMKSyncServiceEndpoint *)self->_messagesSyncService connectivityState] == 2
      || [(NNMKSyncServiceEndpoint *)self->_messagesSyncService connectivityState] == 3;
}

- (void)_checkBatchFetchedMessages
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NNMKSyncProvider *)self batchRequestHandler];
  char v4 = [v3 checkBatchFetchedMessages];

  unint64_t v5 = [v4 fetchResults];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v47 = v4;
    id v7 = [v4 fetchResults];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v53 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            char v14 = v12;
            double v15 = [v13 mailboxId];
            *(_DWORD *)buf = 138543362;
            uint64_t v58 = (uint64_t)v15;
            _os_log_impl(&dword_23D3DF000, v14, OS_LOG_TYPE_DEFAULT, "Responding for #FETCH #BATCHED_RESPONSE request. (Mailbox id: %{public}@)", buf, 0xCu);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v9);
    }

    char v4 = v47;
    dispatch_time_t v16 = [v47 fetchResults];
    uint64_t v17 = [v16 count];

    if (v17 == 1)
    {
      messagesSyncService = self->_messagesSyncService;
      unint64_t v19 = [v47 fetchResults];
      __int16 v20 = [(NNMKProtoCoalescedBatchedFetchResult *)v19 firstObject];
      id v21 = [(NNMKMessagesSyncServiceServer *)messagesSyncService sendBatchedFetchResult:v20];
    }
    else
    {
      unint64_t v19 = objc_alloc_init(NNMKProtoCoalescedBatchedFetchResult);
      int v22 = [v47 fetchResults];
      uint64_t v23 = (void *)[v22 mutableCopy];
      [(NNMKProtoCoalescedBatchedFetchResult *)v19 setFetchResults:v23];

      id v24 = [(NNMKMessagesSyncServiceServer *)self->_messagesSyncService sendCoalescedBatchedFetchResult:v19];
    }

    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry beginUpdates];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v25 = [v47 messageIdsForRequestingContentDownload];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v49 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry syncedMessageForMessageWithId:*(void *)(*((void *)&v48 + 1) + 8 * j)];
          [v30 setContentRequestedByUser:1];
          [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry addOrUpdateSyncedMessage:v30];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v27);
    }

    [(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry endUpdates];
    uint64_t v31 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = v31;
      char v33 = [v47 messageIdsForRequestingContentDownload];
      uint64_t v34 = [v33 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v58 = v34;
      _os_log_impl(&dword_23D3DF000, v32, OS_LOG_TYPE_DEFAULT, "Requesting message body for %lu most recent headers for #BATCHED_RESPONSE.", buf, 0xCu);
    }
    uint64_t v35 = [v47 messageIdsForRequestingContentDownload];
    [(NNMKSyncProvider *)self _requestDelegateForContentForMessageIds:v35 highPriority:1];
  }
  unint64_t v36 = [v4 missingMessageHeaderIds];
  uint64_t v37 = [v36 count];

  if (v37)
  {
    int v38 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = v38;
      __int16 v40 = [v4 missingMessageHeaderIds];
      uint64_t v41 = [v40 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v58 = v41;
      _os_log_impl(&dword_23D3DF000, v39, OS_LOG_TYPE_DEFAULT, "Requesting message headers from MobileMail to respond for #BATCHED_RESPONSE. %li", buf, 0xCu);
    }
    uint64_t v42 = [v4 missingMessageHeaderIds];
    [(NNMKSyncProvider *)self _requestDelegateForMessagesToSendAsFetchResponseForMessageIds:v42];
  }
  uint64_t v43 = [v4 mailboxesToTriggerFullSync];
  uint64_t v44 = [v43 count];

  if (v44)
  {
    uint64_t v45 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v45, OS_LOG_TYPE_DEFAULT, "Triggering #full-sync because we exceeded attempts for requesting missing headers for #BATCHED_RESPONSE.", buf, 2u);
    }
    uint64_t v46 = [v4 mailboxesToTriggerFullSync];
    [(NNMKSyncProvider *)self _triggerFullSyncForMailboxes:v46];
  }
}

- (void)_handleDidFailSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NNMKSyncProvider *)self initialSyncProgressTracker];
  [v7 syncFailedWithError:@"IDS failed sending messages."];

  id v8 = [(NNMKSyncProvider *)self resendScheduler];
  [v8 handleIDSMessageFailedWithId:v6 errorCode:a4];
}

- (void)_notifyDelegateThatMessagesStatusWereUpdated:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncProvider:self didUpdateMessagesStatus:v5];
}

- (void)_requestDelegateForAccounts
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained syncProviderDidRequestAccounts:self];
}

- (void)_requestDelegateForVIPList:(id)a3
{
  id v7 = a3;
  char v4 = [(NNMKSyncProvider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NNMKSyncProvider *)self delegate];
    [v6 syncProvider:self didRequestVIPSenderListWithRequestContext:v7];
  }
}

- (void)_requestDelegateForMoreMessagesWithMailbox:(id)a3 beforeDate:(id)a4 messagesForspecialMailboxFilterType:(unint64_t)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(NNMKRequestContext);
  [(NNMKRequestContext *)v10 setBeforeDate:v8];

  [(NNMKRequestContext *)v10 setCount:20];
  v13[0] = v9;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];

  [(NNMKRequestContext *)v10 setMailboxes:v11];
  [(NNMKRequestContext *)v10 setMessagesForSpecialMailbox:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained syncProvider:self didRequestMessagesWithContext:v10];
}

- (void)_requestDelegateForMoreMessagesBeforeDateReceived:(id)a3 forConversationWithId:(id)a4 mailbox:(id)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = objc_alloc_init(NNMKRequestContext);
    [(NNMKRequestContext *)v11 setBeforeDate:v8];
    [(NNMKRequestContext *)v11 setCount:20];
    v14[0] = v10;
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [(NNMKRequestContext *)v11 setMailboxes:v12];

    [(NNMKRequestContext *)v11 setConversationId:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained syncProvider:self didRequestMessagesWithContext:v11];
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncProvider _requestDelegateForMoreMessagesBeforeDateReceived:forConversationWithId:mailbox:]();
  }
}

- (void)_requestDelegateForFirstMessagesForMailboxes:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_DEBUG)) {
    -[NNMKSyncProvider _requestDelegateForFirstMessagesForMailboxes:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained syncProvider:self didRequestFirstMessages:20 mailboxes:v4];
}

- (void)_requestDelegateForContentForMessageIds:(id)a3 highPriority:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v16;
    *(void *)&long long v8 = 138543362;
    long long v14 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        uint64_t v13 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v14;
          uint64_t v20 = v12;
          _os_log_debug_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_DEBUG, "Requesting content for message: %{public}@.", buf, 0xCu);
        }
        -[NNMKSyncProvider _requestDelegateForContentForMessageWithId:highPriority:](self, "_requestDelegateForContentForMessageWithId:highPriority:", v12, v4, v14);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_requestDelegateForContentForMessageWithId:(id)a3 highPriority:(BOOL)a4
{
  BOOL v4 = a4;
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncProvider:self didRequestContentForMessageWithId:v7 highPriority:v4];
}

- (void)_requestDelegateToStopDownloadingMessageElementsForMessageWithId:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncProvider:self didRequestStopDownloadingMessageElementsForMessageWithId:v5];
}

- (void)_requestDelegateToStopDownloadingAllMessageElements
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained syncProviderDidRequestStopDownloadingAllMessageElements:self];
}

- (void)_requestDelegateForFetchForMailboxes:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NNMKSyncProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NNMKSyncProvider *)self delegate];
    [v7 syncProvider:self didRequestFetchForMailboxes:v4];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "syncProviderDidRequestFetch:forConversationId:mailbox:", self, 0, v12, (void)v14);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)_requestDelegateToSendComposedMessage:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncProvider:self didRequestSendComposedMessage:v5];
}

- (void)_requestDelegateForResendingMessagesWithIds:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncProvider:self didRequestResendMessagesWithIds:v5];
}

- (void)_requestDelegateForResendingAccountWithId:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncProvider:self didRequestResendAccountWithId:v5];
}

- (void)trackerDidFinishSendingInitialSyncContentToPairedDevice:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(NNMKProtoInitialContentSyncCompletedNotification);
  [(NNMKProtoInitialContentSyncCompletedNotification *)v4 setFullSyncVersion:[(NNMKDeviceSyncRegistry *)self->_pairedDeviceRegistry fullSyncVersion]];
  id v5 = [(NNMKMessageContentSyncServiceServer *)self->_contentSyncService notifyInitialContentSyncCompleted:v4];
  char v6 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Notifying client that all content has been sync'ed (IDS Identifier: %{public}@)...", (uint8_t *)&v7, 0xCu);
  }
}

- (id)syncServiceEndpoints
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", self->_messagesSyncService, self->_contentSyncService, self->_accountsSyncService, self->_fetchesSyncService, self->_protectedSyncService, self->_protectedContentSyncService, 0);
}

- (void)_requestDelegateForMessagesToSendAsFetchResponseForMessageIds:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncProvider:self didRequestMessagesToSendAsFetchResponseForMessageIds:v5];
}

- (id)_createDefaultSyncStateManager
{
  uint64_t v2 = objc_alloc_init(NNMKSyncStateManager);
  return v2;
}

- (void)_setPairedDeviceSupportsMultipleMailboxes:(BOOL)a3
{
  self->_pairedDeviceSupportsMultipleMailboxes = a3;
}

- (BOOL)_pairedDeviceSupportsMultipleMailboxes
{
  return self->_pairedDeviceSupportsMultipleMailboxes
      || [(NNMKSyncStateManager *)self->_syncStateManager pairedDeviceSupportsMultipleMailboxes];
}

- (id)currentDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (BOOL)pairedDeviceSupportsStandaloneMode
{
  return [(NNMKSyncStateManager *)self->_syncStateManager pairedDeviceSupportsStandaloneMode];
}

- (NNMKSyncProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKSyncProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)providerQueue
{
  return self->_providerQueue;
}

- (void)setProviderQueue:(id)a3
{
}

- (NNMKSyncStateManager)syncStateManager
{
  return self->_syncStateManager;
}

- (void)setSyncStateManager:(id)a3
{
}

- (NNMKDeviceSyncRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (void)setPairedDeviceRegistry:(id)a3
{
}

- (BOOL)fullSyncRecoveredInThisSession
{
  return self->_fullSyncRecoveredInThisSession;
}

- (void)setFullSyncRecoveredInThisSession:(BOOL)a3
{
  self->_BOOL fullSyncRecoveredInThisSession = a3;
}

- (NNMKSyncPersistenceHandler)persistenceHandler
{
  return self->_persistenceHandler;
}

- (void)setPersistenceHandler:(id)a3
{
}

- (NNMKMessagesSyncServiceServer)messagesSyncService
{
  return self->_messagesSyncService;
}

- (void)setMessagesSyncService:(id)a3
{
}

- (NNMKMessageContentSyncServiceServer)contentSyncService
{
  return self->_contentSyncService;
}

- (void)setContentSyncService:(id)a3
{
}

- (NNMKAccountsSyncServiceServer)accountsSyncService
{
  return self->_accountsSyncService;
}

- (void)setAccountsSyncService:(id)a3
{
}

- (NNMKFetchesSyncServiceServer)fetchesSyncService
{
  return self->_fetchesSyncService;
}

- (void)setFetchesSyncService:(id)a3
{
}

- (NNMKProtectedSyncServiceServer)protectedSyncService
{
  return self->_protectedSyncService;
}

- (void)setProtectedSyncService:(id)a3
{
}

- (NNMKProtectedContentSyncServiceServer)protectedContentSyncService
{
  return self->_protectedContentSyncService;
}

- (void)setProtectedContentSyncService:(id)a3
{
}

- (NNMKSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
}

- (NNMKSyncSessionController)sessionController
{
  return self->_sessionController;
}

- (void)setSessionController:(id)a3
{
}

- (NNMKDirectoryProvider)directoryProvider
{
  return self->_directoryProvider;
}

- (void)setDirectoryProvider:(id)a3
{
}

- (NNMKResendScheduler)resendScheduler
{
  return self->_resendScheduler;
}

- (void)setResendScheduler:(id)a3
{
}

- (NNMKInitialSyncProgressTracker)initialSyncProgressTracker
{
  return self->_initialSyncProgressTracker;
}

- (void)setInitialSyncProgressTracker:(id)a3
{
}

- (NNMKBatchRequestHandler)batchRequestHandler
{
  return self->_batchRequestHandler;
}

- (void)setBatchRequestHandler:(id)a3
{
}

- (BOOL)triggeredInitialSyncToRecoverFromSyncVersionMismatch
{
  return self->_triggeredInitialSyncToRecoverFromSyncVersionMismatch;
}

- (void)setTriggeredInitialSyncToRecoverFromSyncVersionMismatch:(BOOL)a3
{
  self->_triggeredInitialSyncToRecoverFromSyncVersionMismatch = a3;
}

- (NSMutableDictionary)fullSyncTimeoutTimersByMailboxId
{
  return self->_fullSyncTimeoutTimersByMailboxId;
}

- (void)setFullSyncTimeoutTimersByMailboxId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullSyncTimeoutTimersByMailboxId, 0);
  objc_storeStrong((id *)&self->_batchRequestHandler, 0);
  objc_storeStrong((id *)&self->_initialSyncProgressTracker, 0);
  objc_storeStrong((id *)&self->_resendScheduler, 0);
  objc_storeStrong((id *)&self->_directoryProvider, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_protectedContentSyncService, 0);
  objc_storeStrong((id *)&self->_protectedSyncService, 0);
  objc_storeStrong((id *)&self->_fetchesSyncService, 0);
  objc_storeStrong((id *)&self->_accountsSyncService, 0);
  objc_storeStrong((id *)&self->_contentSyncService, 0);
  objc_storeStrong((id *)&self->_messagesSyncService, 0);
  objc_storeStrong((id *)&self->_persistenceHandler, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_syncStateManager, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_triggerFullSyncForMailbox:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "Mailbox should not be empty for a #full-sync", v2, v3, v4, v5, v6);
}

- (void)_triggerFullSyncForMailboxes:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "No mailbox for triggering a #full-sync", v2, v3, v4, v5, v6);
}

void __97__NNMKSyncProvider_replyWithFirstMessages_includesProtectedMessages_mailboxes_organizedByThread___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "No mailbox for default id. Since paired device does not support multiple mailboxes, we should have default mailbox.", v2, v3, v4, v5, v6);
}

- (void)_addMessages:(uint64_t)a3 mailbox:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 mailboxId];
  int v7 = +[NNMKMessage messageIdsFromMessages:a3];
  uint64_t v8 = objc_msgSend(v7, "nnmk_description");
  int v9 = 138543618;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_ERROR, "Dropping messages to add because mailbox is not active. (Mailbox: %{public}@ - Messages: %{public}@)", (uint8_t *)&v9, 0x16u);
}

- (void)_updateMessagesStatus:(uint64_t)a3 mailbox:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 mailboxId];
  uint64_t v7 = [a2 syncRequested];
  uint64_t v8 = [a2 syncRequestedDate];
  int v9 = +[NNMKMessage messageIdsFromMessages:a3];
  uint64_t v10 = objc_msgSend(v9, "nnmk_description");
  int v11 = 138544130;
  uint64_t v12 = v6;
  __int16 v13 = 2048;
  uint64_t v14 = v7;
  __int16 v15 = 2114;
  long long v16 = v8;
  __int16 v17 = 2114;
  long long v18 = v10;
  _os_log_error_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_ERROR, "Dropping messages to update because mailbox is not active. (Mailbox: %{public}@ - Sync Requested: %lu - Request Date - %{public}@ - Messages: %{public}@)", (uint8_t *)&v11, 0x2Au);
}

void __46__NNMKSyncProvider_updateConversationId_mute___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_23D3DF000, v0, v1, "No messages to mark as NOT notify in database for conversation id %{public}@", v2, v3, v4, v5, v6);
}

void __83__NNMKSyncProvider_markConversationIdForNotify_messages_includesProtectedMessages___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_23D3DF000, v0, v1, "No messages to mark as notify in database for conversation id %{public}@", v2, v3, v4, v5, v6);
}

void __65__NNMKSyncProvider_addMessageContent_forMessage_loadedProtected___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_3() mailboxId];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_23D3DF000, v2, v5, "Could not find mailbox with Id %{public}@", v6);
}

- (void)_addMessageContent:forMessage:loadedProtected:mailbox:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "Received Message Content with nil messageId, ignoring it.", v2, v3, v4, v5, v6);
}

void __40__NNMKSyncProvider_setOrganizeByThread___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_23D3DF000, v0, v1, "Ignoring \"organized by thread\" flag changed because no accounts are synced yet. %lu", v2, v3, v4, v5, v6);
}

- (void)messagesSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_23D3DF000, v0, OS_LOG_TYPE_DEBUG, "Messages sent successfully by IDS (IDS Identifier: %{public}@).", v1, 0xCu);
}

- (void)messagesSyncServiceServer:didRequestSendMessage:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "Composed Message SENT from Client with too many NULL fields. Ignoring...", v2, v3, v4, v5, v6);
}

- (void)messagesSyncServiceServer:(void *)a1 didRequestCompactMessages:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 mailboxId];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8_0(&dword_23D3DF000, v5, v6, "Ignoring compact request. Mailbox: %{public}@ (exists: %d)", v7, v8, v9, v10, v11);
}

- (void)messageContentSyncServiceServer:didSendProtobufSuccessfullyWithIDSIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_23D3DF000, v0, OS_LOG_TYPE_DEBUG, "Content sent successfully by IDS (IDS Identifier: %{public}@).", v1, 0xCu);
}

- (void)accountsSyncServiceServer:(void *)a1 didChangeAccountSourceType:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_3() fullSyncVersion];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_23D3DF000, v1, v3, "Account Source type ignored. Full sync version mismatch %lu", v4);
}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_23D3DF000, v0, v1, "No account for watch account. Standalone state will be dropped. %{public}@", v2, v3, v4, v5, v6);
}

void __97__NNMKSyncProvider_accountsSyncServiceServer_didReceivedAccountAuthenticationStatus_requestTime___block_invoke_74_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_3() emailAddressToken];
  v5[0] = 67109120;
  v5[1] = v4 != 0;
  _os_log_error_impl(&dword_23D3DF000, v2, OS_LOG_TYPE_ERROR, "#cloud-notifications Failed to update local account properties (hasToken: %d)", (uint8_t *)v5, 8u);
}

- (void)_handleFetchRequest:(void *)a1 shouldResumeSync:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_3() mailboxId];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_23D3DF000, v1, v4, "Dropping #FETCH request for mailbox because we do not have this mailbox anymore. %{public}@", v5);
}

- (void)fetchesSyncServiceServer:didRequestMoreMessagesInBatch:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "Ignoring #LOAD_MORE_MESSAGES request because #sync-version is wrong.", v2, v3, v4, v5, v6);
}

- (void)fetchesSyncServiceServer:(void *)a1 didRequestMoreMessages:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 mailboxId];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8_0(&dword_23D3DF000, v5, v6, "Ignoring #LOAD_MORE_MESSAGES request. Mailbox: %{public}@ (exists: %d)", v7, v8, v9, v10, v11);
}

- (void)fetchesSyncServiceServer:(void *)a1 didRequestMoreMessagesForConversation:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_3() mailboxId];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_23D3DF000, v1, v4, "Ignoring #LOAD_MORE_MESSAGES conversation request. Mailbox %{public}@", v5);
}

- (void)setupPairedDeviceRegistry
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "#PAIRING_STATE PairedSync asked us to do a #full-sync, but NanoRegistry returned no devices. Replying to PairedSync with an error.", v2, v3, v4, v5, v6);
}

- (void)_verifyPairingForcingSync:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "#PAIRING_STATE Please file a radar. Pairing verification determined we're paired and PairedSync already ran. However, PairedSync never told Mail to start syncing. Will force syncing...", v2, v3, v4, v5, v6);
}

- (void)_verifyPairingForcingSync:(char)a1 .cold.2(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_DEBUG, "Verifying pairing (forceSyncIfPaired: %d)...", (uint8_t *)v2, 8u);
}

- (void)resendScheduler:didRequestRetrySendingAccountIdentifier:resendInterval:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_23D3DF000, v0, v1, "Attempting to retry sending account identity but information is not available anymore. %{public}@", v2, v3, v4, v5, v6);
}

- (void)_shouldHandleForwardForNotification:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "#BulletinDistributor missing messageId from notification. Ignoring bulletin", v2, v3, v4, v5, v6);
}

- (void)_shouldHandleForwardForNotification:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_23D3DF000, v0, v1, "#BulletinDistributor Ping Subscriber asked us to notify them back when we added content for a message, but they had told us that message was NOT going to generate a notification. Bumping message to Notification priority and potentially re-requesting content... (Message Id: %{public}@)", v2, v3, v4, v5, v6);
}

- (void)_fastForwardToFullSyncVersion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_23D3DF000, v0, v1, "Requested to Fast Forward #sync-version, but we're not yet paired. Ignoring... (#sync-version requested: %lu).", v2, v3, v4, v5, v6);
}

- (void)_checkConnectivityBasedSuspensionTimer:.cold.1()
{
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_23D3DF000, v0, OS_LOG_TYPE_DEBUG, "Is now connected.", v1, 2u);
}

- (void)_requestDelegateForMoreMessagesBeforeDateReceived:forConversationWithId:mailbox:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "Requesting more message without mailbox.", v2, v3, v4, v5, v6);
}

- (void)_requestDelegateForFirstMessagesForMailboxes:.cold.1()
{
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_23D3DF000, v0, OS_LOG_TYPE_DEBUG, "Requesting first messages from delegate.", v1, 2u);
}

@end