@interface VMVoicemailManager
- (BOOL)canChangeGreeting;
- (BOOL)canChangePassword;
- (BOOL)isAccountOnline:(id)a3;
- (BOOL)isAccountSubscribed:(id)a3;
- (BOOL)isCallVoicemailSupportedForAccountUUID:(id)a3;
- (BOOL)isGreetingChangeSupportedForAccountUUID:(id)a3;
- (BOOL)isMessageWaiting;
- (BOOL)isOnline;
- (BOOL)isPasscodeChangeSupportedForAccountUUID:(id)a3;
- (BOOL)isSubscribed;
- (BOOL)isSyncInProgress;
- (BOOL)isTranscribing;
- (BOOL)isTranscriptionEnabled;
- (BOOL)mailboxRequiresSetup;
- (NSArray)accounts;
- (NSArray)allVoicemails;
- (NSMutableSet)trashedMessages;
- (NSOrderedSet)voicemails;
- (NSProgress)transcriptionProgress;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)delegate_queue;
- (OS_dispatch_queue)internalClientQueue;
- (VMClientWrapper)client;
- (VMServerXPCProtocol)serverConnection;
- (VMVoicemailCapabilities)capabilities;
- (VMVoicemailManagedDelegate)delegate;
- (VMVoicemailManager)init;
- (VMVoicemailManager)initWithClient:(id)a3 synchronously:(BOOL)a4 queryState:(BOOL)a5 fetchMail:(BOOL)a6 session:(id)a7 delegate:(id)a8 delegateQueue:(id)a9;
- (VMVoicemailManager)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (VMVoicemailManager)initWithStateSync:(BOOL)a3 mailSync:(BOOL)a4 delegate:(id)a5 delegateQueue:(id)a6;
- (VMVoicemailManager)initWithoutMailSync;
- (double)maximumGreetingDurationForAccountUUID:(id)a3;
- (id)asynchronousServerConnectionWithErrorHandler:(id)a3;
- (id)dataForVoicemailWithIdentifier:(unint64_t)a3;
- (id)deleteVoicemail:(id)a3;
- (id)deleteVoicemails:(id)a3;
- (id)fetchAccounts;
- (id)initAsync:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (id)initAsyncWithStateSync:(BOOL)a3 mailSync:(BOOL)a4 session:(id)a5 delegate:(id)a6 delegateQueue:(id)a7;
- (id)markVoicemailAsRead:(id)a3;
- (id)markVoicemailsAsRead:(id)a3;
- (id)messagesForMailboxType:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5 error:(id *)a6;
- (id)messagesForMailboxType:(int64_t)a3 read:(BOOL)a4 limit:(int64_t)a5 offset:(int64_t)a6 error:(id *)a7;
- (id)removeVoicemailFromTrash:(id)a3;
- (id)removeVoicemailsFromTrash:(id)a3;
- (id)serverConnection:(BOOL)a3 withErrorHandler:(id)a4;
- (id)synchronousServerConnectionWithErrorHandler:(id)a3;
- (id)trashVoicemail:(id)a3;
- (id)trashVoicemails:(id)a3;
- (id)uniqueIdentifierForVoiceMail:(id)a3;
- (id)voicemailWithIdentifier:(unint64_t)a3;
- (id)voicemailsPassingTest:(id)a3;
- (int)token;
- (int64_t)maximumPasscodeLengthForAccountUUID:(id)a3;
- (int64_t)messageCountForMailboxType:(int64_t)a3 error:(id *)a4;
- (int64_t)messageCountForMailboxType:(int64_t)a3 read:(BOOL)a4 error:(id *)a5;
- (int64_t)minimumPasscodeLengthForAccountUUID:(id)a3;
- (int64_t)unreadCount;
- (os_unfair_lock_s)accessorLock;
- (unint64_t)countOfVoicemailsPassingTest:(id)a3;
- (unint64_t)storageUsage;
- (void)_checkFirstUnlock;
- (void)_fetchInitialStateIfNecessaryWithForce:(BOOL)a3 waitStates:(BOOL)a4 waitMails:(BOOL)a5 waitAccounts:(BOOL)a6 session:(id)a7;
- (void)call_accountsDidChange;
- (void)call_capabilitiesDidChange;
- (void)call_greetingDidChangeByCarrier:(id)a3;
- (void)call_managerStorageUsageDidChange;
- (void)call_onlineStatusDidChange;
- (void)call_subscriptionStateStatusDidChange;
- (void)call_syncInProgresDidChange;
- (void)call_transcribingStatusDidChange;
- (void)call_voicemailsDidChange:(id)a3;
- (void)changePassword:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)greetingChangedByCarrier:(id)a3;
- (void)greetingForAccountUUID:(id)a3 completion:(id)a4;
- (void)insertVoicemail:(id)a3;
- (void)messageCountForMailboxType:(int64_t)a3 completion:(id)a4;
- (void)messageCountForMailboxType:(int64_t)a3 read:(BOOL)a4 completion:(id)a5;
- (void)obliterate;
- (void)performAtomicAccessorBlock:(id)a3;
- (void)performSynchronousBlock:(id)a3;
- (void)remapAccount:(id)a3 toAccount:(id)a4;
- (void)reportTranscriptionProblemForVoicemail:(id)a3;
- (void)reportTranscriptionRatedAccurate:(BOOL)a3 forVoicemail:(id)a4;
- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3;
- (void)resetNetworkSettings;
- (void)retrieveDataForVoicemail:(id)a3;
- (void)saveGreeting:(id)a3 withCompletionHandler:(id)a4;
- (void)setAccounts:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setClient:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate_queue:(id)a3;
- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 completion:(id)a5;
- (void)setMessageWaiting:(BOOL)a3;
- (void)setOnline:(BOOL)a3;
- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 completion:(id)a5;
- (void)setStorageUsage:(unint64_t)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)setSyncInProgress:(BOOL)a3;
- (void)setToken:(int)a3;
- (void)setTranscribing:(BOOL)a3;
- (void)setTrashedMessages:(id)a3;
- (void)setVoicemails:(id)a3;
- (void)startMailSyncing;
- (void)synchronize;
- (void)updateAccounts:(id)a3;
- (void)voicemailsUpdated:(id)a3;
@end

@implementation VMVoicemailManager

uint64_t __34__VMVoicemailManager_isSubscribed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 15);
  return result;
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x263EFFA68];
    if (v3) {
      v6 = v3;
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2;
    v11[3] = &unk_26441FD70;
    v11[4] = WeakRetained;
    id v3 = v6;
    id v12 = v3;
    id v13 = *(id *)(a1 + 32);
    uint64_t v7 = MEMORY[0x21D4B0600](v11);
    v8 = (void *)v7;
    if (*(unsigned char *)(a1 + 48))
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
    else
    {
      v10 = [v5 internalClientQueue];
      dispatch_async(v10, v8);
    }
  }
  else
  {
    v9 = *(NSObject **)(a1 + 32);
    if (v9) {
      dispatch_group_leave(v9);
    }
  }
}

- (VMVoicemailManager)init
{
  id v3 = objc_alloc_init(VMClientWrapper);
  v4 = [(VMVoicemailManager *)self initWithClient:v3 synchronously:1 queryState:1 fetchMail:1 session:0 delegate:0 delegateQueue:0];

  return v4;
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2_23;
    v10[3] = &unk_26441FDE8;
    v10[4] = WeakRetained;
    id v11 = v3;
    id v12 = *(id *)(a1 + 40);
    uint64_t v6 = MEMORY[0x21D4B0600](v10);
    uint64_t v7 = (void *)v6;
    if (*(unsigned char *)(a1 + 56))
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
    else
    {
      v9 = [v5 internalClientQueue];
      dispatch_async(v9, v7);
    }
  }
  else
  {
    v8 = *(NSObject **)(a1 + 32);
    if (v8) {
      dispatch_group_leave(v8);
    }
  }
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2_23(uint64_t a1)
{
  v2 = vm_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21C797000, v2, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM voicemails - replied", v8, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v5;
  id v7 = v4;

  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 11) = 1;
  objc_msgSend(*(id *)(a1 + 32), "call_voicemailsDidChange:", v7);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)call_voicemailsDidChange:(id)a3
{
  v26[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(VMVoicemailManager *)self voicemails];
    uint64_t v6 = [v5 arrayBySubtractingOrderedSet:v4];
    id v7 = [v4 arrayBySubtractingOrderedSet:v5];
    v8 = [v5 arrayByIntersectingWithOrderedSet:v4];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke;
    v23[3] = &unk_26441FED8;
    id v24 = v4;
    v9 = [v8 indexesOfObjectsPassingTest:v23];
    v10 = [v8 objectsAtIndexes:v9];

    if (![v6 count] && !objc_msgSend(v7, "count") && !objc_msgSend(v10, "count"))
    {

      id v14 = 0;
      goto LABEL_10;
    }
    v25[0] = @"VMVoicemailVoicemailsAddedKey";
    v25[1] = @"VMVoicemailVoicemailsDeletedKey";
    v26[0] = v6;
    v26[1] = v7;
    v25[2] = @"VMVoicemailVoicemailFlagsChangedKey";
    v26[2] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  }
  else
  {
    id v11 = 0;
    v10 = 0;
    id v7 = 0;
    uint64_t v6 = 0;
  }
  id v5 = [(VMVoicemailManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(VMVoicemailManager *)self delegate_queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke_2;
    block[3] = &unk_26441FF18;
    id v18 = v5;
    id v19 = v4;
    id v20 = v6;
    id v21 = v7;
    id v22 = v10;
    dispatch_async(v12, block);
  }
  id v13 = [(VMVoicemailManager *)self completionQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke_3;
  v15[3] = &unk_26441FF48;
  v15[4] = self;
  id v14 = v11;
  id v16 = v14;
  dispatch_async(v13, v15);

LABEL_10:
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_27(uint64_t a1, void *a2, char a3, char a4, char a5, char a6)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v13 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    id v20 = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2_28;
    id v21 = &unk_26441FE60;
    id v22 = WeakRetained;
    id v23 = v11;
    char v25 = a3;
    char v26 = a4;
    char v27 = a5;
    char v28 = a6;
    id v24 = *(id *)(a1 + 40);
    uint64_t v14 = MEMORY[0x21D4B0600](&v18);
    v15 = (void *)v14;
    if (*(unsigned char *)(a1 + 56))
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }
    else
    {
      v17 = objc_msgSend(v13, "internalClientQueue", v18, v19, v20, v21, v22, v23);
      dispatch_async(v17, v15);
    }
  }
  else
  {
    id v16 = *(NSObject **)(a1 + 32);
    if (v16) {
      dispatch_group_leave(v16);
    }
  }
}

uint64_t __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2_28(uint64_t a1)
{
  v2 = vm_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C797000, v2, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM states - replied", v4, 2u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 15) = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(*(void *)(a1 + 32) + 14) = *(unsigned char *)(a1 + 57);
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = *(unsigned char *)(a1 + 58);
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = *(unsigned char *)(a1 + 59);
  objc_msgSend(*(id *)(a1 + 32), "call_capabilitiesDidChange");
  objc_msgSend(*(id *)(a1 + 32), "call_subscriptionStateStatusDidChange");
  objc_msgSend(*(id *)(a1 + 32), "call_onlineStatusDidChange");
  objc_msgSend(*(id *)(a1 + 32), "call_syncInProgresDidChange");
  objc_msgSend(*(id *)(a1 + 32), "call_transcribingStatusDidChange");
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  int v4 = v3[9];
  id v5 = vm_framework_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM voicemails", buf, 2u);
    }

    uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_21;
    v14[3] = &unk_26441FD48;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    id v15 = *(id *)(a1 + 32);
    v8 = [v3 serverConnection:v7 withErrorHandler:v14];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_22;
    v9[3] = &unk_26441FE10;
    objc_copyWeak(&v12, (id *)(a1 + 48));
    id v11 = *(id *)(a1 + 40);
    char v13 = v7;
    id v10 = *(id *)(a1 + 32);
    [v8 allVoicemails:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v16);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "mail fetch is not requested - skipping to accounts", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM accounts", buf, 2u);
  }

  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_16;
  v11[3] = &unk_26441FD48;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  BOOL v6 = [v3 serverConnection:v5 withErrorHandler:v11];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_17;
  v7[3] = &unk_26441FD98;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v8 = *(id *)(a1 + 32);
  char v10 = v5;
  [v6 accounts:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v13);
}

- (id)serverConnection:(BOOL)a3 withErrorHandler:(id)a4
{
  if (a3) {
    [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:a4];
  }
  else {
  int v4 = [(VMVoicemailManager *)self asynchronousServerConnectionWithErrorHandler:a4];
  }
  return v4;
}

- (id)synchronousServerConnectionWithErrorHandler:(id)a3
{
  BOOL fHasDeviceBeenUnlockedSinceBoot = self->fHasDeviceBeenUnlockedSinceBoot;
  id v5 = a3;
  if (fHasDeviceBeenUnlockedSinceBoot)
  {
    BOOL v6 = [(VMVoicemailManager *)self client];
    uint64_t v7 = [v6 clientConnection];
    id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v5];
  }
  else
  {
    id v9 = vm_framework_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_21C797000, v9, OS_LOG_TYPE_DEFAULT, "rejected, synchronousServerConnectionWithErrorHandler", v12, 2u);
    }

    char v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:35 userInfo:0];
    (*((void (**)(id, void *))v5 + 2))(v5, v10);

    id v8 = 0;
  }
  return v8;
}

- (VMClientWrapper)client
{
  return self->_client;
}

- (VMVoicemailManager)initWithClient:(id)a3 synchronously:(BOOL)a4 queryState:(BOOL)a5 fetchMail:(BOOL)a6 session:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v37.receiver = self;
  v37.super_class = (Class)VMVoicemailManager;
  id v20 = [(VMVoicemailManager *)&v37 init];
  id v21 = v20;
  if (v20)
  {
    v20->_accessorLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_client, a3);
    [(VMClientWrapper *)v21->_client setManager:v21];
    v21->fMailSyncExpected = v11;
    v21->fSyncStateExpected = v12 || v11;
    *(_WORD *)&v21->fMailLoadingInProgress = 0;
    id v22 = vm_framework_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = "NO";
      if (v12) {
        id v24 = "YES";
      }
      else {
        id v24 = "NO";
      }
      if (v11) {
        id v23 = "YES";
      }
      *(_DWORD *)buf = 136315394;
      v39 = v24;
      __int16 v40 = 2080;
      v41 = v23;
      _os_log_impl(&dword_21C797000, v22, OS_LOG_TYPE_DEFAULT, "starting with statesync: %s, mailsync: %s", buf, 0x16u);
    }

    char v25 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.voicemail.VMVoicemailManager.serialQueue", v25);
    internalClientQueue = v21->_internalClientQueue;
    v21->_internalClientQueue = (OS_dispatch_queue *)v26;

    dispatch_queue_set_specific((dispatch_queue_t)v21->_internalClientQueue, (const void *)VMVoicemailManagerSerialQueueContextKey, v21, 0);
    if (v19) {
      dispatch_queue_t v28 = (dispatch_queue_t)v19;
    }
    else {
      dispatch_queue_t v28 = dispatch_queue_create("com.apple.voicemail.VMVoicemailManager.delegate", v25);
    }
    delegate_queue = v21->_delegate_queue;
    v21->_delegate_queue = (OS_dispatch_queue *)v28;

    objc_storeWeak((id *)&v21->_delegate, v18);
    voicemails = v21->_voicemails;
    v21->_voicemails = 0;

    [(VMVoicemailManager *)v21 _checkFirstUnlock];
    [(VMVoicemailManager *)v21 _fetchInitialStateIfNecessaryWithForce:0 waitStates:v13 waitMails:v13 waitAccounts:v13 session:v17];
    objc_initWeak((id *)buf, v21);
    v31 = (const char *)[@"com.apple.voicemail.VMXPCConnectionAvailable" UTF8String];
    v32 = v21->_internalClientQueue;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __103__VMVoicemailManager_initWithClient_synchronously_queryState_fetchMail_session_delegate_delegateQueue___block_invoke;
    v34[3] = &unk_26441FCA8;
    objc_copyWeak(&v36, (id *)buf);
    v35 = v21;
    notify_register_dispatch(v31, &v21->_token, v32, v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
  return v21;
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_3;
  v3[3] = &unk_26441FD70;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performSynchronousBlock:v3];
}

- (BOOL)isSubscribed
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__VMVoicemailManager_isSubscribed__block_invoke;
  v4[3] = &unk_26441FC58;
  v4[4] = self;
  v4[5] = &v5;
  [(VMVoicemailManager *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific((const void *)VMVoicemailManagerSerialQueueContextKey) == self)
  {
    BOOL v6 = (void (*)(void))*((void *)a3 + 2);
    uint64_t v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    uint64_t v7 = [(VMVoicemailManager *)self internalClientQueue];
    dispatch_sync(v7, v5);
  }
}

- (OS_dispatch_queue)internalClientQueue
{
  return self->_internalClientQueue;
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_3(uint64_t a1)
{
  char v2 = vm_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C797000, v2, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM accounts - replied", v4, 2u);
  }

  [*(id *)(a1 + 32) setAccounts:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(a1 + 48);
  if (v3) {
    dispatch_group_leave(v3);
  }
}

- (void)setAccounts:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  unint64_t v5 = self->_accounts;
  unint64_t v9 = (unint64_t)v4;
  if (v9 | v5)
  {
    if (v9)
    {
      char v6 = [(id)v5 isEqual:v9];

      if (v6) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v7 = (NSArray *)[(id)v9 copy];
    accounts = self->_accounts;
    self->_accounts = v7;

    [(VMVoicemailManager *)self call_accountsDidChange];
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (void)call_syncInProgresDidChange
{
  id v3 = [(VMVoicemailManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(VMVoicemailManager *)self delegate_queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__VMVoicemailManager_call_syncInProgresDidChange__block_invoke;
    block[3] = &unk_26441FD20;
    id v8 = v3;
    dispatch_async(v4, block);
  }
  unint64_t v5 = [(VMVoicemailManager *)self completionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__VMVoicemailManager_call_syncInProgresDidChange__block_invoke_2;
  v6[3] = &unk_26441FD20;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)call_subscriptionStateStatusDidChange
{
  id v3 = [(VMVoicemailManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(VMVoicemailManager *)self delegate_queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__VMVoicemailManager_call_subscriptionStateStatusDidChange__block_invoke;
    block[3] = &unk_26441FD20;
    id v8 = v3;
    dispatch_async(v4, block);
  }
  unint64_t v5 = [(VMVoicemailManager *)self completionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__VMVoicemailManager_call_subscriptionStateStatusDidChange__block_invoke_2;
  v6[3] = &unk_26441FD20;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)call_onlineStatusDidChange
{
  id v3 = [(VMVoicemailManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(VMVoicemailManager *)self delegate_queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__VMVoicemailManager_call_onlineStatusDidChange__block_invoke;
    block[3] = &unk_26441FD20;
    id v8 = v3;
    dispatch_async(v4, block);
  }
  unint64_t v5 = [(VMVoicemailManager *)self completionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__VMVoicemailManager_call_onlineStatusDidChange__block_invoke_2;
  v6[3] = &unk_26441FD20;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)call_capabilitiesDidChange
{
  id v3 = [(VMVoicemailManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(VMVoicemailManager *)self delegate_queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__VMVoicemailManager_call_capabilitiesDidChange__block_invoke;
    block[3] = &unk_26441FD20;
    id v8 = v3;
    dispatch_async(v4, block);
  }
  unint64_t v5 = [(VMVoicemailManager *)self completionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__VMVoicemailManager_call_capabilitiesDidChange__block_invoke_2;
  v6[3] = &unk_26441FD20;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)call_transcribingStatusDidChange
{
  id v3 = [(VMVoicemailManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(VMVoicemailManager *)self delegate_queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__VMVoicemailManager_call_transcribingStatusDidChange__block_invoke;
    block[3] = &unk_26441FD20;
    id v8 = v3;
    dispatch_async(v4, block);
  }
  unint64_t v5 = [(VMVoicemailManager *)self completionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__VMVoicemailManager_call_transcribingStatusDidChange__block_invoke_2;
  v6[3] = &unk_26441FD20;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (VMVoicemailManagedDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VMVoicemailManagedDelegate *)WeakRetained;
}

- (OS_dispatch_queue)completionQueue
{
  p_completionQueue = &self->_completionQueue;
  completionQueue = self->_completionQueue;
  if (!completionQueue)
  {
    objc_storeStrong((id *)p_completionQueue, MEMORY[0x263EF83A0]);
    completionQueue = *p_completionQueue;
  }
  return completionQueue;
}

- (void)call_accountsDidChange
{
  id v3 = [(VMVoicemailManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(VMVoicemailManager *)self delegate_queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__VMVoicemailManager_call_accountsDidChange__block_invoke;
    block[3] = &unk_26441FD20;
    id v8 = v3;
    dispatch_async(v4, block);
  }
  unint64_t v5 = [(VMVoicemailManager *)self completionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__VMVoicemailManager_call_accountsDidChange__block_invoke_2;
  v6[3] = &unk_26441FD20;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)_fetchInitialStateIfNecessaryWithForce:(BOOL)a3 waitStates:(BOOL)a4 waitMails:(BOOL)a5 waitAccounts:(BOOL)a6 session:(id)a7
{
  BOOL v12 = a7;
  BOOL v13 = v12;
  if (v12) {
    dispatch_group_enter(v12);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke;
  v15[3] = &unk_26441FEB0;
  v15[4] = self;
  id v16 = v13;
  BOOL v17 = a3;
  BOOL v18 = a6;
  BOOL v19 = a5;
  BOOL v20 = a4;
  uint64_t v14 = v13;
  [(VMVoicemailManager *)self performSynchronousBlock:v15];
}

- (void)_checkFirstUnlock
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C797000, a2, OS_LOG_TYPE_ERROR, "MKBDeviceUnlockedSinceBoot (1) failed with %d", (uint8_t *)v2, 8u);
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v2 = *(unsigned char **)(a1 + 32);
  if (!v2[9] && !v2[8])
  {
    uint64_t v3 = vm_framework_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = (id)objc_opt_class();
      id v10 = v28;
      _os_log_impl(&dword_21C797000, v3, OS_LOG_TYPE_DEFAULT, "%@ client initialized without expecting mail or states sync", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if (v2[10])
  {
    uint64_t v3 = vm_framework_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = (id)objc_opt_class();
      id v4 = v28;
      _os_log_impl(&dword_21C797000, v3, OS_LOG_TYPE_DEFAULT, "%@ mail loading is already in progress", buf, 0xCu);
    }
LABEL_17:

    BOOL v12 = *(NSObject **)(a1 + 40);
    if (v12) {
      dispatch_group_leave(v12);
    }
    return;
  }
  if (v2[11] && !*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = vm_framework_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = (id)objc_opt_class();
      id v11 = v28;
      _os_log_impl(&dword_21C797000, v3, OS_LOG_TYPE_DEFAULT, "%@ mail already loaded - bailing out", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if (v2[9])
  {
    v2[11] = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
    char v2 = *(unsigned char **)(a1 + 32);
  }
  objc_initWeak((id *)buf, v2);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_15;
  v23[3] = &unk_26441FDC0;
  char v26 = *(unsigned char *)(a1 + 49);
  objc_copyWeak(&v25, (id *)buf);
  id v24 = *(id *)(a1 + 40);
  unint64_t v5 = (void *)[v23 copy];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_20;
  v18[3] = &unk_26441FE38;
  char v22 = *(unsigned char *)(a1 + 50);
  objc_copyWeak(&v21, (id *)buf);
  id v19 = *(id *)(a1 + 40);
  id v6 = v5;
  id v20 = v6;
  uint64_t v7 = (void *)[v18 copy];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_25;
  v13[3] = &unk_26441FE38;
  char v17 = *(unsigned char *)(a1 + 51);
  objc_copyWeak(&v16, (id *)buf);
  id v14 = *(id *)(a1 + 40);
  id v8 = v7;
  id v15 = v8;
  unint64_t v9 = (void (**)(void, void))MEMORY[0x21D4B0600](v13);
  v9[2](v9, *(void *)(a1 + 32));

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM states", buf, 2u);
  }

  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_26;
  v12[3] = &unk_26441FD48;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v13 = *(id *)(a1 + 32);
  id v6 = [v3 serverConnection:v5 withErrorHandler:v12];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_27;
  v7[3] = &unk_26441FE88;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v9 = *(id *)(a1 + 40);
  char v11 = v5;
  id v8 = *(id *)(a1 + 32);
  [v6 requestInitialState:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v14);
}

void __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"VMVoicemailVoicemailsChangedNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

void __48__VMVoicemailManager_call_onlineStatusDidChange__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"VMVoicemailOnlineStatusChangedNotification" object:*(void *)(a1 + 32)];
}

void __48__VMVoicemailManager_call_capabilitiesDidChange__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"VMVoicemailCapabilitiesChangedNotification" object:*(void *)(a1 + 32)];
}

void __44__VMVoicemailManager_call_accountsDidChange__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"VMVoicemailManagerAccountsDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __54__VMVoicemailManager_call_transcribingStatusDidChange__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"VMVoicemailTranscriptionInProgressChangedNotification" object:*(void *)(a1 + 32)];
}

void __49__VMVoicemailManager_call_syncInProgresDidChange__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"VMVoicemailSyncInProgressChangedNotification" object:*(void *)(a1 + 32)];
}

void __59__VMVoicemailManager_call_subscriptionStateStatusDidChange__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"VMVoicemailSubscriptionStateStatusChangedNotification" object:*(void *)(a1 + 32)];
}

- (VMVoicemailManager)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(VMClientWrapper);
  id v9 = [(VMVoicemailManager *)self initWithClient:v8 synchronously:1 queryState:1 fetchMail:1 session:0 delegate:v7 delegateQueue:v6];

  return v9;
}

- (id)initAsync:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = objc_alloc_init(VMClientWrapper);
  BOOL v12 = [(VMVoicemailManager *)self initWithClient:v11 synchronously:0 queryState:1 fetchMail:1 session:v10 delegate:v9 delegateQueue:v8];

  return v12;
}

void __103__VMVoicemailManager_initWithClient_synchronously_queryState_fetchMail_session_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = vm_framework_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = (id)objc_opt_class();
      id v3 = v5;
      _os_log_impl(&dword_21C797000, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling VMXPCConnectionAvailable.", (uint8_t *)&v4, 0xCu);
    }
    [WeakRetained _fetchInitialStateIfNecessaryWithForce:1 waitStates:0 waitMails:0 waitAccounts:0 session:0];
  }
}

- (VMVoicemailManager)initWithoutMailSync
{
  return (VMVoicemailManager *)[(VMVoicemailManager *)self initAsyncWithStateSync:0 mailSync:0 session:0 delegate:0 delegateQueue:0];
}

- (VMVoicemailManager)initWithStateSync:(BOOL)a3 mailSync:(BOOL)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = a5;
  BOOL v12 = objc_alloc_init(VMClientWrapper);
  id v13 = [(VMVoicemailManager *)self initWithClient:v12 synchronously:1 queryState:v8 fetchMail:v7 session:0 delegate:v11 delegateQueue:v10];

  return v13;
}

- (id)initAsyncWithStateSync:(BOOL)a3 mailSync:(BOOL)a4 session:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = objc_alloc_init(VMClientWrapper);
  id v16 = [(VMVoicemailManager *)self initWithClient:v15 synchronously:0 queryState:v10 fetchMail:v9 session:v14 delegate:v13 delegateQueue:v12];

  return v16;
}

- (void)dealloc
{
  notify_cancel([(VMVoicemailManager *)self token]);
  v3.receiver = self;
  v3.super_class = (Class)VMVoicemailManager;
  [(VMVoicemailManager *)&v3 dealloc];
}

void __39__VMVoicemailManager__checkFirstUnlock__block_invoke(uint64_t a1)
{
  id v2 = vm_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21C797000, v2, OS_LOG_TYPE_DEFAULT, "Device became unlocked after boot", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 12) = 1;
  }
  notify_cancel(*(_DWORD *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v5 _fetchInitialStateIfNecessaryWithForce:0 waitStates:0 waitMails:0 waitAccounts:0 session:0];
}

- (id)asynchronousServerConnectionWithErrorHandler:(id)a3
{
  BOOL fHasDeviceBeenUnlockedSinceBoot = self->fHasDeviceBeenUnlockedSinceBoot;
  id v5 = a3;
  if (fHasDeviceBeenUnlockedSinceBoot)
  {
    uint64_t v6 = [(VMVoicemailManager *)self client];
    BOOL v7 = [v6 clientConnection];
    BOOL v8 = [v7 remoteObjectProxyWithErrorHandler:v5];
  }
  else
  {
    BOOL v9 = vm_framework_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_21C797000, v9, OS_LOG_TYPE_DEFAULT, "rejected asynchronousServerConnectionWithErrorHandler", v12, 2u);
    }

    BOOL v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:35 userInfo:0];
    (*((void (**)(id, void *))v5 + 2))(v5, v10);

    BOOL v8 = 0;
  }
  return v8;
}

- (VMServerXPCProtocol)serverConnection
{
  return (VMServerXPCProtocol *)[(VMVoicemailManager *)self asynchronousServerConnectionWithErrorHandler:&__block_literal_global_2];
}

void __38__VMVoicemailManager_serverConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__VMVoicemailManager_serverConnection__block_invoke_cold_1();
  }
}

- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3
{
  int v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Client woke up, asking to recheck. Pinging daemon.", buf, 2u);
  }

  if (self->fHasDeviceBeenUnlockedSinceBoot)
  {
    id v5 = [(VMVoicemailManager *)self client];
    [v5 setPingRetry:1];
    uint64_t v6 = [(VMVoicemailManager *)self asynchronousServerConnectionWithErrorHandler:&__block_literal_global_11];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke_12;
    v8[3] = &unk_26441FCF8;
    id v9 = v5;
    BOOL v7 = v5;
    [v6 ping:v8];
  }
  else
  {
    BOOL v7 = vm_framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C797000, v7, OS_LOG_TYPE_DEFAULT, "Cannot ping when device is locked.", buf, 2u);
    }
  }
}

void __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke_cold_1();
  }
}

void __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke_12(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setPingRetry:0];
  objc_super v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = "NO";
    if (a2) {
      int v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl(&dword_21C797000, v3, OS_LOG_TYPE_DEFAULT, "VMD server replied with %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)startMailSyncing
{
  objc_super v3 = [(VMVoicemailManager *)self internalClientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__VMVoicemailManager_startMailSyncing__block_invoke;
  block[3] = &unk_26441FD20;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __38__VMVoicemailManager_startMailSyncing__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 9);
  objc_super v3 = vm_framework_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_21C797000, v3, OS_LOG_TYPE_DEFAULT, "requested startMailSyncing while it was already active - skipping", v5, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C797000, v3, OS_LOG_TYPE_DEFAULT, "requested startMailSyncing - starting sync", buf, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
    [*(id *)(a1 + 32) _fetchInitialStateIfNecessaryWithForce:0 waitStates:0 waitMails:0 waitAccounts:0 session:0];
  }
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_16_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 10) = 0;
  }
  uint64_t v7 = *(NSObject **)(a1 + 32);
  if (v7) {
    dispatch_group_leave(v7);
  }
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_21_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 10) = 0;
  }
  uint64_t v7 = *(NSObject **)(a1 + 32);
  if (v7) {
    dispatch_group_leave(v7);
  }
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_21_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 10) = 0;
  }
  uint64_t v7 = *(NSObject **)(a1 + 32);
  if (v7) {
    dispatch_group_leave(v7);
  }
}

uint64_t __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
    if ([v6 hasSameContent:v3]) {
      uint64_t v5 = [v6 hasSameFlags:v3] ^ 1;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  return v5;
}

uint64_t __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke_2(void *a1)
{
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  if ([(id)a1[6] count]) {
    uint64_t v4 = a1[6];
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(id)a1[7] count]) {
    uint64_t v5 = a1[7];
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(id)a1[8] count]) {
    uint64_t v6 = a1[8];
  }
  else {
    uint64_t v6 = 0;
  }
  return [v2 voicemailsDidChangeInitial:v3 == 0 added:v4 deleted:v5 updated:v6];
}

uint64_t __48__VMVoicemailManager_call_onlineStatusDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) onlineStatusDidChange];
}

uint64_t __48__VMVoicemailManager_call_capabilitiesDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) capabilitiesDidChange];
}

uint64_t __59__VMVoicemailManager_call_subscriptionStateStatusDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) subscriptionStateStatusDidChange];
}

uint64_t __49__VMVoicemailManager_call_syncInProgresDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncInProgresDidChange];
}

- (void)call_managerStorageUsageDidChange
{
  uint64_t v3 = [(VMVoicemailManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(VMVoicemailManager *)self delegate_queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__VMVoicemailManager_call_managerStorageUsageDidChange__block_invoke;
    block[3] = &unk_26441FD20;
    id v8 = v3;
    dispatch_async(v4, block);
  }
  uint64_t v5 = [(VMVoicemailManager *)self completionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__VMVoicemailManager_call_managerStorageUsageDidChange__block_invoke_2;
  v6[3] = &unk_26441FD20;
  v6[4] = self;
  dispatch_async(v5, v6);
}

uint64_t __55__VMVoicemailManager_call_managerStorageUsageDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) managerStorageUsageDidChange];
}

void __55__VMVoicemailManager_call_managerStorageUsageDidChange__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"VMVoicemailManagerStorageUsageChangedNotification" object:*(void *)(a1 + 32)];
}

uint64_t __54__VMVoicemailManager_call_transcribingStatusDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) transcribingStatusDidChange];
}

uint64_t __44__VMVoicemailManager_call_accountsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accountsDidChange];
}

- (void)call_greetingDidChangeByCarrier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMVoicemailManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(VMVoicemailManager *)self delegate_queue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__VMVoicemailManager_call_greetingDidChangeByCarrier___block_invoke;
    v7[3] = &unk_26441FF48;
    id v8 = v5;
    id v9 = v4;
    dispatch_async(v6, v7);
  }
}

uint64_t __54__VMVoicemailManager_call_greetingDidChangeByCarrier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) greetingDidChangeByCarrier:*(void *)(a1 + 40)];
}

- (BOOL)isOnline
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__VMVoicemailManager_isOnline__block_invoke;
  v4[3] = &unk_26441FC58;
  v4[4] = self;
  v4[5] = &v5;
  [(VMVoicemailManager *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__VMVoicemailManager_isOnline__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 14);
  return result;
}

- (BOOL)isSyncInProgress
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__VMVoicemailManager_isSyncInProgress__block_invoke;
  v4[3] = &unk_26441FC58;
  v4[4] = self;
  v4[5] = &v5;
  [(VMVoicemailManager *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__VMVoicemailManager_isSyncInProgress__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (BOOL)isTranscribing
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__VMVoicemailManager_isTranscribing__block_invoke;
  v4[3] = &unk_26441FC58;
  v4[4] = self;
  v4[5] = &v5;
  [(VMVoicemailManager *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __36__VMVoicemailManager_isTranscribing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 17);
  return result;
}

- (BOOL)isMessageWaiting
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__VMVoicemailManager_isMessageWaiting__block_invoke;
  v4[3] = &unk_26441FC58;
  v4[4] = self;
  v4[5] = &v5;
  [(VMVoicemailManager *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__VMVoicemailManager_isMessageWaiting__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 13);
  return result;
}

- (void)synchronize
{
  id v2 = [(VMVoicemailManager *)self serverConnection];
  [v2 synchronize];
}

- (void)retrieveDataForVoicemail:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VMVoicemailManager *)self isOnline];
  if ([(VMVoicemailManager *)self isSyncInProgress]) {
    char v6 = 0;
  }
  else {
    char v6 = [v4 isDownloading] ^ 1;
  }
  uint64_t v7 = [(VMVoicemailManager *)self internalClientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__VMVoicemailManager_retrieveDataForVoicemail___block_invoke;
  block[3] = &unk_26441FFA8;
  BOOL v11 = v5;
  char v12 = v6;
  void block[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

void __47__VMVoicemailManager_retrieveDataForVoicemail___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) && *(unsigned char *)(a1 + 49))
  {
    id v2 = [*(id *)(a1 + 32) serverConnection];
    objc_msgSend(v2, "retrieveDataForIdentifier:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  }
}

- (NSArray)allVoicemails
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__0;
  id v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__VMVoicemailManager_allVoicemails__block_invoke;
  v4[3] = &unk_26441FC58;
  v4[4] = self;
  v4[5] = &v5;
  [(VMVoicemailManager *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __35__VMVoicemailManager_allVoicemails__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) voicemails];
  if (v4)
  {
    v1 = [*(id *)(a1 + 32) voicemails];
    uint64_t v3 = [v1 array];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263EFFA68];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (v4)
  {
  }
}

- (int64_t)unreadCount
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__VMVoicemailManager_unreadCount__block_invoke;
  v4[3] = &unk_26441FC58;
  v4[4] = self;
  v4[5] = &v5;
  [(VMVoicemailManager *)self performSynchronousBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __33__VMVoicemailManager_unreadCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) countOfVoicemailsPassingTest:&__block_literal_global_53];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __33__VMVoicemailManager_unreadCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isRead] & 1) != 0
    || ([v2 isDeleted] & 1) != 0
    || ([v2 isTrashed] & 1) != 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 isBlocked] ^ 1;
  }

  return v3;
}

- (id)voicemailWithIdentifier:(unint64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  BOOL v11 = __Block_byref_object_copy__0;
  char v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v4 = [(VMVoicemailManager *)self allVoicemails];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__VMVoicemailManager_voicemailWithIdentifier___block_invoke;
  v7[3] = &unk_26441FFF0;
  void v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__VMVoicemailManager_voicemailWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 identifier] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)dataForVoicemailWithIdentifier:(unint64_t)a3
{
  uint64_t v3 = [(VMVoicemailManager *)self voicemailWithIdentifier:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 data];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)voicemailsPassingTest:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (unsigned int (**)(id, void))a3;
  id v5 = [MEMORY[0x263EFF980] array];
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    char v6 = [(VMVoicemailManager *)self allVoicemails];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (v4[2](v4, v11)) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  char v12 = (void *)[v5 copy];

  return v12;
}

- (unint64_t)countOfVoicemailsPassingTest:(id)a3
{
  uint64_t v3 = [(VMVoicemailManager *)self voicemailsPassingTest:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)uniqueIdentifierForVoiceMail:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  id v5 = [v4 senderDestinationID];
  char v6 = NSNumber;
  uint64_t v7 = [v4 date];
  [v7 timeIntervalSince1970];
  uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isDeleted"));
  uint64_t v10 = NSNumber;
  uint64_t v11 = [v4 isTrashed];

  char v12 = [v10 numberWithBool:v11];
  id v13 = [v3 stringWithFormat:@"%@-%@-%@-%@", v5, v8, v9, v12];

  return v13;
}

- (void)remapAccount:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VMVoicemailManager *)self internalClientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__VMVoicemailManager_remapAccount_toAccount___block_invoke;
  block[3] = &unk_26441FD70;
  id v12 = v6;
  id v13 = v7;
  long long v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__VMVoicemailManager_remapAccount_toAccount___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = vm_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_21C797000, v2, OS_LOG_TYPE_DEFAULT, "remap account %@ to %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 48) serverConnection];
  [v5 remapAccount:*(void *)(a1 + 32) toAccount:*(void *)(a1 + 40)];
}

- (void)resetNetworkSettings
{
  uint64_t v3 = [(VMVoicemailManager *)self internalClientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__VMVoicemailManager_resetNetworkSettings__block_invoke;
  block[3] = &unk_26441FD20;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __42__VMVoicemailManager_resetNetworkSettings__block_invoke(uint64_t a1)
{
  id v2 = vm_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21C797000, v2, OS_LOG_TYPE_DEFAULT, "resetNetworkSettings", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) serverConnection];
  [v3 resetNetworkSettings];
}

- (id)deleteVoicemail:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  int v6 = [v4 arrayWithObjects:&v10 count:1];

  uint64_t v7 = -[VMVoicemailManager deleteVoicemails:](self, "deleteVoicemails:", v6, v10, v11);
  __int16 v8 = [v7 firstObject];

  return v8;
}

- (id)deleteVoicemails:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v3;
    _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Perform delete for voicemails %@", buf, 0xCu);
  }

  id v5 = [MEMORY[0x263EFF980] array];
  int v6 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v12 isDeleted] & 1) == 0)
        {
          id v13 = (void *)[v12 mutableCopy];
          [v13 setDeleted:1];
          long long v14 = (void *)[v13 copy];
          [v5 addObject:v14];

          long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
          [v6 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    long long v16 = [(VMVoicemailManager *)self internalClientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__VMVoicemailManager_deleteVoicemails___block_invoke;
    block[3] = &unk_26441FF48;
    void block[4] = self;
    id v21 = v6;
    dispatch_async(v16, block);
  }
  long long v17 = (void *)[v5 copy];

  return v17;
}

void __39__VMVoicemailManager_deleteVoicemails___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) serverConnection];
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  [v3 setDeletedForIdentifiers:v2];
}

- (id)markVoicemailAsRead:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  int v6 = [v4 arrayWithObjects:&v10 count:1];

  id v7 = -[VMVoicemailManager markVoicemailsAsRead:](self, "markVoicemailsAsRead:", v6, v10, v11);
  uint64_t v8 = [v7 firstObject];

  return v8;
}

- (id)markVoicemailsAsRead:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = vm_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "Perform mark as read for voicemails %@", buf, 0xCu);
  }

  int v6 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v12 isRead] & 1) == 0)
        {
          id v13 = (void *)[v12 mutableCopy];
          [v13 setRead:1];
          long long v14 = (void *)[v13 copy];
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  long long v15 = (void *)[v6 copy];
  if ([v15 count])
  {
    long long v16 = [(VMVoicemailManager *)self internalClientQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__VMVoicemailManager_markVoicemailsAsRead___block_invoke;
    v18[3] = &unk_26441FF48;
    id v19 = v15;
    id v20 = self;
    dispatch_async(v16, v18);
  }
  return v15;
}

void __43__VMVoicemailManager_markVoicemailsAsRead___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
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
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "identifier", (void)v11));
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [*(id *)(a1 + 40) serverConnection];
  uint64_t v10 = (void *)[v2 copy];
  [v9 setReadForIdentifiers:v10];
}

- (id)trashVoicemail:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v10 count:1];

  uint64_t v7 = -[VMVoicemailManager trashVoicemails:](self, "trashVoicemails:", v6, v10, v11);
  uint64_t v8 = [v7 firstObject];

  return v8;
}

- (id)trashVoicemails:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = vm_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "Perform trashed for voicemails %@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v13 isTrashed] & 1) == 0)
        {
          long long v14 = (void *)[v13 mutableCopy];
          [v14 setTrashed:1];
          long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "identifier"));
          [v7 addObject:v15];

          uint64_t v16 = (void *)[v14 copy];
          [v6 addObject:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  long long v17 = (void *)[v6 copy];
  if ([v7 count])
  {
    BOOL v18 = [(VMVoicemailManager *)self internalClientQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __38__VMVoicemailManager_trashVoicemails___block_invoke;
    v20[3] = &unk_26441FF48;
    v20[4] = self;
    id v21 = v7;
    dispatch_async(v18, v20);
  }
  return v17;
}

void __38__VMVoicemailManager_trashVoicemails___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverConnection];
  [v2 setTrashedForIdentifiers:*(void *)(a1 + 40)];
}

- (id)removeVoicemailFromTrash:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v10 count:1];

  uint64_t v7 = -[VMVoicemailManager removeVoicemailsFromTrash:](self, "removeVoicemailsFromTrash:", v6, v10, v11);
  id v8 = [v7 firstObject];

  return v8;
}

- (id)removeVoicemailsFromTrash:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = vm_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "Remove voicemails %@ from trash", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v12 isTrashed])
        {
          long long v13 = (void *)[v12 mutableCopy];
          [v13 setTrashed:0];
          long long v14 = (void *)[v13 copy];
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  long long v15 = (void *)[v6 copy];
  if ([v15 count])
  {
    uint64_t v16 = [(VMVoicemailManager *)self internalClientQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __48__VMVoicemailManager_removeVoicemailsFromTrash___block_invoke;
    v18[3] = &unk_26441FF48;
    id v19 = v15;
    id v20 = self;
    dispatch_async(v16, v18);
  }
  return v15;
}

void __48__VMVoicemailManager_removeVoicemailsFromTrash___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "serverConnection", (void)v9);
        objc_msgSend(v8, "removeVoicemailFromTrashWithIdentifier:", objc_msgSend(v7, "identifier"));

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)voicemailsUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMVoicemailManager *)self internalClientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__VMVoicemailManager_voicemailsUpdated___block_invoke;
  v7[3] = &unk_26441FF48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__VMVoicemailManager_voicemailsUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) voicemails];
  [*(id *)(a1 + 32) setVoicemails:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "call_voicemailsDidChange:", v2);
}

- (void)setOnline:(BOOL)a3
{
  uint64_t v5 = [(VMVoicemailManager *)self internalClientQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__VMVoicemailManager_setOnline___block_invoke;
  v6[3] = &unk_264420018;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __32__VMVoicemailManager_setOnline___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v2 + 14) != v3) {
    *(unsigned char *)(v2 + 14) = v3;
  }
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 14)) {
      uint64_t v5 = @"ONLINE";
    }
    else {
      uint64_t v5 = @"OFFLINE";
    }
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Client received online state change message from vmd. vmd is %@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "call_onlineStatusDidChange");
}

- (void)setTranscribing:(BOOL)a3
{
  uint64_t v5 = [(VMVoicemailManager *)self internalClientQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__VMVoicemailManager_setTranscribing___block_invoke;
  v6[3] = &unk_264420018;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __38__VMVoicemailManager_setTranscribing___block_invoke(uint64_t result)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 17) != v2)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 17) = v2;
    int v4 = *(unsigned __int8 *)(result + 40);
    uint64_t v5 = *(void **)(result + 32);
    if (v4)
    {
      id v6 = [v5 asynchronousServerConnectionWithErrorHandler:&__block_literal_global_67];
      uint64_t v7 = [v6 requestTranscriptionProgress:&__block_literal_global_70];
      uint64_t v8 = *(void *)(v3 + 32);
      uint64_t v9 = *(void **)(v8 + 56);
      *(void *)(v8 + 56) = v7;

      long long v10 = vm_framework_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(v3 + 32) + 56);
        int v15 = 138412290;
        uint64_t v16 = v11;
        _os_log_impl(&dword_21C797000, v10, OS_LOG_TYPE_DEFAULT, "Received progress from server: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      long long v12 = (void *)v5[7];
      v5[7] = 0;
    }
    long long v13 = vm_framework_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *(unsigned __int8 *)(v3 + 40);
      int v15 = 67109120;
      LODWORD(v16) = v14;
      _os_log_impl(&dword_21C797000, v13, OS_LOG_TYPE_DEFAULT, "Client received transcribing: %d state change", (uint8_t *)&v15, 8u);
    }

    return objc_msgSend(*(id *)(v3 + 32), "call_transcribingStatusDidChange");
  }
  return result;
}

void __38__VMVoicemailManager_setTranscribing___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__VMVoicemailManager_setTranscribing___block_invoke_2_cold_1();
  }
}

void __38__VMVoicemailManager_setTranscribing___block_invoke_68(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = vm_framework_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __38__VMVoicemailManager_setTranscribing___block_invoke_68_cold_1(v2);
    }
  }
}

- (void)setSubscribed:(BOOL)a3
{
  uint64_t v5 = [(VMVoicemailManager *)self internalClientQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__VMVoicemailManager_setSubscribed___block_invoke;
  v6[3] = &unk_264420018;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __36__VMVoicemailManager_setSubscribed___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v2 + 15) != v3) {
    *(unsigned char *)(v2 + 15) = v3;
  }
  int v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 15)) {
      uint64_t v5 = @"SUBSCRIBED";
    }
    else {
      uint64_t v5 = @"UNSUBSCRIBED";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Client received subscription state change message from vmd. vmd is %@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "call_subscriptionStateStatusDidChange");
}

- (void)setMessageWaiting:(BOOL)a3
{
  uint64_t v5 = [(VMVoicemailManager *)self internalClientQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__VMVoicemailManager_setMessageWaiting___block_invoke;
  v6[3] = &unk_264420018;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __40__VMVoicemailManager_setMessageWaiting___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 13) != v2)
  {
    *(unsigned char *)(v1 + 13) = v2;
    int v4 = vm_framework_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 40)) {
        uint64_t v5 = @"MESSAGE WAITING";
      }
      else {
        uint64_t v5 = @"NO MESSAGE WAITING";
      }
      int v6 = 138412290;
      BOOL v7 = v5;
      _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Client received message waiting change message from vmd. vmd has %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setCapabilities:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMVoicemailManager *)self internalClientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__VMVoicemailManager_setCapabilities___block_invoke;
  v7[3] = &unk_26441FF48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__VMVoicemailManager_setCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(v2 + 104);
  id v4 = (id *)(v2 + 104);
  if (v5 != v3)
  {
    objc_storeStrong(v4, v3);
    id v6 = vm_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [*(id *)(a1 + 40) debugDescription];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_21C797000, v6, OS_LOG_TYPE_DEFAULT, "Client received new capabilities from vmd. vmd capabilities are %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)setSyncInProgress:(BOOL)a3
{
  uint64_t v5 = [(VMVoicemailManager *)self internalClientQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__VMVoicemailManager_setSyncInProgress___block_invoke;
  v6[3] = &unk_264420018;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __40__VMVoicemailManager_setSyncInProgress___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 16) != v2)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 16) = v2;
    id v4 = vm_framework_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(v3 + 40)) {
        uint64_t v5 = @"SYNCHRONIZING";
      }
      else {
        uint64_t v5 = @"NOT SYNCHRONIZING";
      }
      int v6 = 138412290;
      BOOL v7 = v5;
      _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Client received sync in progress change message from vmd. vmd is %@", (uint8_t *)&v6, 0xCu);
    }

    return objc_msgSend(*(id *)(v3 + 32), "call_syncInProgresDidChange");
  }
  return result;
}

- (void)setStorageUsage:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = vm_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v9 = a3;
    _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "Client received new storage usage from vmd. Current storage level is %lu%%", buf, 0xCu);
  }

  int v6 = [(VMVoicemailManager *)self internalClientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__VMVoicemailManager_setStorageUsage___block_invoke;
  v7[3] = &unk_26441FC80;
  void v7[4] = self;
  void v7[5] = a3;
  dispatch_async(v6, v7);
}

uint64_t __38__VMVoicemailManager_setStorageUsage___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(v1 + 48) != v2)
  {
    uint64_t v3 = result;
    *(void *)(v1 + 48) = v2;
    id v4 = vm_framework_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [NSNumber numberWithUnsignedInteger:*(void *)(v3 + 40)];
      int v6 = 138412290;
      BOOL v7 = v5;
      _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Client received storage usage changed message from vmd. storage usage is %@", (uint8_t *)&v6, 0xCu);
    }
    return objc_msgSend(*(id *)(v3 + 32), "call_managerStorageUsageDidChange");
  }
  return result;
}

- (void)obliterate
{
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21C797000, v3, OS_LOG_TYPE_DEFAULT, "Initiating VVM reset (obliterate)...", v5, 2u);
  }

  id v4 = [(VMVoicemailManager *)self asynchronousServerConnectionWithErrorHandler:&__block_literal_global_90];
  [v4 obliterate];
}

void __32__VMVoicemailManager_obliterate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __32__VMVoicemailManager_obliterate__block_invoke_cold_1();
  }
}

- (void)insertVoicemail:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMVoicemailManager *)self internalClientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__VMVoicemailManager_insertVoicemail___block_invoke;
  v7[3] = &unk_26441FF48;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__VMVoicemailManager_insertVoicemail___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverConnection];
  [v2 insertVoicemail:*(void *)(a1 + 40)];
}

- (void)performAtomicAccessorBlock:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v6[2]();
    os_unfair_lock_unlock(&self->_accessorLock);
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"VMVoicemailManager.m", 1011, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (id)fetchAccounts
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v2 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:&__block_literal_global_102];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__VMVoicemailManager_fetchAccounts__block_invoke_103;
  v6[3] = &unk_264420040;
  v6[4] = &v7;
  [v2 accounts:v6];

  uint64_t v3 = (void *)v8[5];
  if (!v3)
  {
    v8[5] = MEMORY[0x263EFFA68];

    uint64_t v3 = (void *)v8[5];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__VMVoicemailManager_fetchAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_16_cold_1();
  }
}

void __35__VMVoicemailManager_fetchAccounts__block_invoke_103(uint64_t a1, void *a2)
{
}

- (NSArray)accounts
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  accounts = self->_accounts;
  if (!accounts)
  {
    uint64_t v5 = [(VMVoicemailManager *)self fetchAccounts];
    id v6 = (NSArray *)[v5 copy];
    uint64_t v7 = self->_accounts;
    self->_accounts = v6;

    accounts = self->_accounts;
  }
  id v8 = accounts;
  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (BOOL)isAccountSubscribed:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__VMVoicemailManager_isAccountSubscribed___block_invoke;
  v9[3] = &unk_264420068;
  id v5 = v4;
  id v10 = v5;
  id v6 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__VMVoicemailManager_isAccountSubscribed___block_invoke_104;
  v8[3] = &unk_264420090;
  void v8[4] = &v11;
  [v6 isAccountSubscribed:v5 reply:v8];

  LOBYTE(v6) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v6;
}

void __42__VMVoicemailManager_isAccountSubscribed___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__VMVoicemailManager_isAccountSubscribed___block_invoke_cold_1();
  }
}

uint64_t __42__VMVoicemailManager_isAccountSubscribed___block_invoke_104(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAccountOnline:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__VMVoicemailManager_isAccountOnline___block_invoke;
  v9[3] = &unk_264420068;
  id v5 = v4;
  id v10 = v5;
  id v6 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__VMVoicemailManager_isAccountOnline___block_invoke_105;
  v8[3] = &unk_264420090;
  void v8[4] = &v11;
  [v6 isAccountOnline:v5 reply:v8];

  LOBYTE(v6) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v6;
}

void __38__VMVoicemailManager_isAccountOnline___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__VMVoicemailManager_isAccountOnline___block_invoke_cold_1();
  }
}

uint64_t __38__VMVoicemailManager_isAccountOnline___block_invoke_105(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isCallVoicemailSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke;
  v9[3] = &unk_264420068;
  id v5 = v4;
  id v10 = v5;
  id v6 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke_106;
  v8[3] = &unk_264420090;
  void v8[4] = &v11;
  [v6 isCallVoicemailSupportedForAccountUUID:v5 reply:v8];

  LOBYTE(v6) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v6;
}

void __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke_cold_1();
  }
}

uint64_t __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke_106(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isPasscodeChangeSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke;
  v9[3] = &unk_264420068;
  id v5 = v4;
  id v10 = v5;
  id v6 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke_107;
  v8[3] = &unk_264420090;
  void v8[4] = &v11;
  [v6 isPasscodeChangeSupportedForAccountUUID:v5 reply:v8];

  LOBYTE(v6) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v6;
}

void __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke_cold_1();
  }
}

uint64_t __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke_107(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)minimumPasscodeLengthForAccountUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke;
  v10[3] = &unk_264420068;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke_108;
  v9[3] = &unk_2644200B8;
  void v9[4] = &v12;
  [v6 minimumPasscodeLengthForAccountUUID:v5 reply:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke_cold_1();
  }
}

uint64_t __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke_108(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)maximumPasscodeLengthForAccountUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke;
  v10[3] = &unk_264420068;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke_110;
  v9[3] = &unk_2644200B8;
  void v9[4] = &v12;
  [v6 maximumPasscodeLengthForAccountUUID:v5 reply:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke_cold_1();
  }
}

uint64_t __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke_110(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke;
  v19[3] = &unk_2644200E0;
  id v10 = v8;
  id v20 = v10;
  id v11 = v9;
  id v21 = v11;
  id v12 = a3;
  uint64_t v13 = [(VMVoicemailManager *)self asynchronousServerConnectionWithErrorHandler:v19];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_111;
  v16[3] = &unk_264420108;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  [v13 setPasscode:v12 forAccountUUID:v15 reply:v16];
}

void __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_111(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = vm_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "Received reply for accountUUID: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateAccounts:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = vm_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "Updating accounts: %@", (uint8_t *)&v6, 0xCu);
  }

  [(VMVoicemailManager *)self setAccounts:v4];
}

- (BOOL)isGreetingChangeSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke;
  v9[3] = &unk_264420068;
  id v5 = v4;
  id v10 = v5;
  int v6 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke_113;
  v8[3] = &unk_264420090;
  void v8[4] = &v11;
  [v6 isGreetingChangeSupportedForAccountUUID:v5 reply:v8];

  LOBYTE(v6) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v6;
}

void __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke_cold_1();
  }
}

uint64_t __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke_113(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (double)maximumGreetingDurationForAccountUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke;
  v10[3] = &unk_264420068;
  id v5 = v4;
  id v11 = v5;
  int v6 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke_114;
  v9[3] = &unk_264420130;
  void v9[4] = &v12;
  [v6 maximumGreetingDurationForAccountUUID:v5 reply:v9];

  double v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke_cold_1();
  }
}

uint64_t __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke_114(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)greetingForAccountUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke;
  v14[3] = &unk_2644200E0;
  id v15 = v6;
  id v8 = v7;
  id v16 = v8;
  id v9 = v6;
  id v10 = [(VMVoicemailManager *)self asynchronousServerConnectionWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke_116;
  v12[3] = &unk_264420158;
  id v13 = v8;
  id v11 = v8;
  [v10 greetingForAccountUUID:v9 reply:v12];
}

void __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__VMVoicemailManager_setGreeting_forAccountUUID_completion___block_invoke;
  v17[3] = &unk_2644200E0;
  id v18 = v8;
  id v10 = v9;
  id v19 = v10;
  id v11 = v8;
  id v12 = a3;
  id v13 = [(VMVoicemailManager *)self asynchronousServerConnectionWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__VMVoicemailManager_setGreeting_forAccountUUID_completion___block_invoke_118;
  v15[3] = &unk_264420180;
  id v16 = v10;
  id v14 = v10;
  [v13 setGreeting:v12 forAccountUUID:v11 reply:v15];
}

void __60__VMVoicemailManager_setGreeting_forAccountUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __60__VMVoicemailManager_setGreeting_forAccountUUID_completion___block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)greetingChangedByCarrier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = vm_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "greetingChangedByCarrier: %@", buf, 0xCu);
  }

  id v6 = [(VMVoicemailManager *)self internalClientQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__VMVoicemailManager_greetingChangedByCarrier___block_invoke;
  v8[3] = &unk_26441FF48;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __47__VMVoicemailManager_greetingChangedByCarrier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "call_greetingDidChangeByCarrier:", *(void *)(a1 + 40));
}

- (int64_t)messageCountForMailboxType:(int64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke;
  v11[3] = &unk_2644201A8;
  void v11[4] = &v18;
  void v11[5] = &v12;
  id v6 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_119;
  v10[3] = &unk_2644200B8;
  void v10[4] = &v18;
  [v6 messageCountForMailboxType:a3 reply:v10];

  if (a4)
  {
    id v7 = (void *)v13[5];
    if (v7) {
      *a4 = v7;
    }
  }
  int64_t v8 = v19[3];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1();
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_119(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)messageCountForMailboxType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__VMVoicemailManager_messageCountForMailboxType_completion___block_invoke;
  v12[3] = &unk_26441FBC8;
  id v7 = v6;
  id v13 = v7;
  int64_t v8 = [(VMVoicemailManager *)self asynchronousServerConnectionWithErrorHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__VMVoicemailManager_messageCountForMailboxType_completion___block_invoke_120;
  v10[3] = &unk_2644201D0;
  id v11 = v7;
  id v9 = v7;
  [v8 messageCountForMailboxType:a3 reply:v10];
}

void __60__VMVoicemailManager_messageCountForMailboxType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__VMVoicemailManager_messageCountForMailboxType_completion___block_invoke_120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)messageCountForMailboxType:(int64_t)a3 read:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  uint64_t v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__VMVoicemailManager_messageCountForMailboxType_read_error___block_invoke;
  v13[3] = &unk_2644201A8;
  void v13[4] = &v20;
  v13[5] = &v14;
  int64_t v8 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__VMVoicemailManager_messageCountForMailboxType_read_error___block_invoke_121;
  v12[3] = &unk_2644200B8;
  void v12[4] = &v20;
  [v8 messageCountForMailboxType:a3 read:v6 reply:v12];

  if (a5)
  {
    id v9 = (void *)v15[5];
    if (v9) {
      *a5 = v9;
    }
  }
  int64_t v10 = v21[3];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __60__VMVoicemailManager_messageCountForMailboxType_read_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1();
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __60__VMVoicemailManager_messageCountForMailboxType_read_error___block_invoke_121(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)messageCountForMailboxType:(int64_t)a3 read:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__VMVoicemailManager_messageCountForMailboxType_read_completion___block_invoke;
  v14[3] = &unk_26441FBC8;
  id v9 = v8;
  id v15 = v9;
  int64_t v10 = [(VMVoicemailManager *)self asynchronousServerConnectionWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__VMVoicemailManager_messageCountForMailboxType_read_completion___block_invoke_122;
  v12[3] = &unk_2644201D0;
  id v13 = v9;
  id v11 = v9;
  [v10 messageCountForMailboxType:a3 read:v5 reply:v12];
}

void __65__VMVoicemailManager_messageCountForMailboxType_read_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__VMVoicemailManager_messageCountForMailboxType_read_completion___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)messagesForMailboxType:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5 error:(id *)a6
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__0;
  char v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke;
  v15[3] = &unk_2644201A8;
  void v15[4] = &v22;
  void v15[5] = &v16;
  int64_t v10 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_123;
  v14[3] = &unk_264420040;
  void v14[4] = &v22;
  [v10 messagesForMailboxType:a3 limit:a4 offset:a5 reply:v14];

  if (a6)
  {
    id v11 = (void *)v17[5];
    if (v11) {
      *a6 = v11;
    }
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

uint64_t __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_123(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];
  return MEMORY[0x270F9A758]();
}

- (id)messagesForMailboxType:(int64_t)a3 read:(BOOL)a4 limit:(int64_t)a5 offset:(int64_t)a6 error:(id *)a7
{
  BOOL v10 = a4;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__0;
  uint64_t v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__0;
  uint64_t v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__VMVoicemailManager_messagesForMailboxType_read_limit_offset_error___block_invoke;
  v17[3] = &unk_2644201A8;
  void v17[4] = &v24;
  v17[5] = &v18;
  id v12 = [(VMVoicemailManager *)self synchronousServerConnectionWithErrorHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__VMVoicemailManager_messagesForMailboxType_read_limit_offset_error___block_invoke_124;
  v16[3] = &unk_264420040;
  void v16[4] = &v24;
  [v12 messagesForMailboxType:a3 read:v10 limit:a5 offset:a6 reply:v16];

  if (a7)
  {
    id v13 = (void *)v19[5];
    if (v13) {
      *a7 = v13;
    }
  }
  id v14 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __69__VMVoicemailManager_messagesForMailboxType_read_limit_offset_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

uint64_t __69__VMVoicemailManager_messagesForMailboxType_read_limit_offset_error___block_invoke_124(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];
  return MEMORY[0x270F9A758]();
}

- (BOOL)isTranscriptionEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(VMVoicemailManager *)self internalClientQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__VMVoicemailManager_isTranscriptionEnabled__block_invoke;
  v5[3] = &unk_26441FC58;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __44__VMVoicemailManager_isTranscriptionEnabled__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) capabilities];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isTranscriptionEnabled];
}

- (void)reportTranscriptionProblemForVoicemail:(id)a3
{
  id v4 = a3;
  id v6 = [(VMVoicemailManager *)self serverConnection];
  uint64_t v5 = [v4 identifier];

  [v6 reportTranscriptionProblemForIdentifier:v5];
}

- (void)reportTranscriptionRatedAccurate:(BOOL)a3 forVoicemail:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(VMVoicemailManager *)self serverConnection];
  uint64_t v7 = [v6 identifier];

  [v8 reportTranscriptionRatedAccurate:v4 forIdentifier:v7];
}

- (void)changePassword:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)saveGreeting:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)setCompletionQueue:(id)a3
{
}

- (BOOL)canChangePassword
{
  return self->_canChangePassword;
}

- (BOOL)canChangeGreeting
{
  return self->_canChangeGreeting;
}

- (BOOL)mailboxRequiresSetup
{
  return self->_mailboxRequiresSetup;
}

- (unint64_t)storageUsage
{
  return self->_storageUsage;
}

- (NSProgress)transcriptionProgress
{
  return self->_transcriptionProgress;
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSOrderedSet)voicemails
{
  return self->_voicemails;
}

- (void)setVoicemails:(id)a3
{
}

- (NSMutableSet)trashedMessages
{
  return self->_trashedMessages;
}

- (void)setTrashedMessages:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (OS_dispatch_queue)delegate_queue
{
  return self->_delegate_queue;
}

- (void)setDelegate_queue:(id)a3
{
}

- (VMVoicemailCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_internalClientQueue, 0);
  objc_storeStrong((id *)&self->_delegate_queue, 0);
  objc_storeStrong((id *)&self->_trashedMessages, 0);
  objc_storeStrong((id *)&self->_voicemails, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transcriptionProgress, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

void __38__VMVoicemailManager_serverConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21C797000, v0, v1, "Received error while communicating with vmd: %@", v2, v3, v4, v5, v6);
}

void __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21C797000, v0, v1, "Cannot ping due to connection error %@", v2, v3, v4, v5, v6);
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21C797000, v0, v1, "Could not retrieve accounts due to connection error %@", v2, v3, v4, v5, v6);
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21C797000, v0, v1, "Could not retrieve states due to connection error %@", v2, v3, v4, v5, v6);
}

void __38__VMVoicemailManager_setTranscribing___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21C797000, v0, v1, "Error fetching initial state: %@", v2, v3, v4, v5, v6);
}

void __38__VMVoicemailManager_setTranscribing___block_invoke_68_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C797000, log, OS_LOG_TYPE_ERROR, "Error fetching progress", v1, 2u);
}

void __32__VMVoicemailManager_obliterate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21C797000, v0, v1, "Error resetting VVM: %@", v2, v3, v4, v5, v6);
}

void __42__VMVoicemailManager_isAccountSubscribed___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not retrieve subscribed status for account UUID %@ due to error %@");
}

void __38__VMVoicemailManager_isAccountOnline___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not retrieve online status for account UUID %@ due to error %@");
}

void __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not retrieve call voicemail status for account UUID %@ due to error %@");
}

void __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not determine whether passcode change is supported for account UUID %@ due to error %@");
}

void __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not retrieve minimum passcode length for account UUID %@ due to error %@");
}

void __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not retrieve maximum password length for account UUID %@ due to error %@");
}

void __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not set passcode for account UUID %@ due to error %@");
}

void __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not whether greeting change is supported for account UUID %@ due to error %@");
}

void __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not retrieve maximum greeting duration for account UUID %@ due to error %@");
}

void __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C797000, v0, v1, "Could not retrieve greeting for account UUID %@ due to error %@");
}

void __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21C797000, v0, v1, "Could not retrieve message count due to error %@", v2, v3, v4, v5, v6);
}

void __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21C797000, v0, v1, "Could not retrieve messages due to error %@", v2, v3, v4, v5, v6);
}

@end