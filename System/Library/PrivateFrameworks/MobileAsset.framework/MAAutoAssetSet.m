@interface MAAutoAssetSet
+ (BOOL)supportsSecureCoding;
+ (id)defaultDispatchQueue;
+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5;
+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6;
+ (id)endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8;
+ (id)frameworkDispatchQueue;
+ (id)frameworkInstanceUUID;
+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4;
+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6 completion:(id)a7;
+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 completion:(id)a6;
+ (void)endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9;
+ (void)frameworkInstanceSetLogDomain;
- (BOOL)shortTermLocker;
- (MAAutoAssetSet)initWithCoder:(id)a3;
- (NSArray)autoAssetEntries;
- (NSString)assetSetIdentifier;
- (NSString)autoAssetSetClientName;
- (NSString)clientDomainName;
- (NSString)updateCategoryDesiredByClient;
- (OS_dispatch_queue)completionDispatchQueue;
- (id)_eliminateAtomicSync:(id)a3 awaitingUnlocked:(BOOL)a4;
- (id)_endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8;
- (id)_newProxyObjectForSetProgressBlock:(id)a3;
- (id)_readLockedSetStatusFromSharedLockFile:(id)a3 error:(id *)a4;
- (id)_shortTermCurrentSetStatusSync:(id *)a3;
- (id)_shortTermEndAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4;
- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5;
- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6;
- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 error:(id *)a9;
- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 shouldVerifyContent:(BOOL)a9 error:(id *)a10;
- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4;
- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5;
- (id)assetSetForStagingSync:(id)a3 asEntriesWhenTargeting:(id)a4;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9 reportingProgress:(id)a10;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 discoveredAtomicEntries:(id *)a6 error:(id *)a7;
- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4;
- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5;
- (id)currentSetStatusSync:(id *)a3;
- (id)endAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4;
- (id)formSubAtomicInstanceSync:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 error:(id *)a6;
- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 error:(id *)a5;
- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 asShortTermLocker:(BOOL)a6 comprisedOfEntries:(id)a7 usingDesiredPolicyCategory:(id)a8 completingFromQueue:(id)a9 error:(id *)a10;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 completingFromQueue:(id)a7 error:(id *)a8;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 error:(id *)a7;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 completingFromQueue:(id)a8 error:(id *)a9;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 error:(id *)a8;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7 reportingProgress:(id)a8;
- (id)lockAtomicSyncWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6;
- (id)mapLockedAtomicEntrySync:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 mappedSelector:(id *)a6;
- (id)needForAtomicSync:(id)a3;
- (id)needForAtomicSync:(id)a3 withNeedPolicy:(id)a4;
- (id)summary;
- (int)_shortTermOpenSharedLockFile:(id)a3 lockingAtomicInstance:(id)a4 forLockReason:(id)a5 verifyingLocalContentURLs:(BOOL)a6 openingFilename:(id)a7 providingLockedSetStatus:(id *)a8 sharedLockError:(id *)a9;
- (void)_closeAndRemoveShortTermLock:(id)a3 forShortTermLock:(id)a4;
- (void)_eliminateAtomic:(id)a3 awaitingUnlocked:(BOOL)a4 completion:(id)a5;
- (void)_endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9;
- (void)_failedCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_failedCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_failedFormSubAtomicInstance:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_failedMapLockedAtomicEntry:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_failedOperation:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_lockAtomicStatusProgress:(id)a3 lockAtomicError:(id)a4 progressBlock:(id)a5;
- (void)_lockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6;
- (void)_shortTermCurrentSetStatus:(id)a3;
- (void)_shortTermEndAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5;
- (void)_shortTermLockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5;
- (void)_shortTermLockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6;
- (void)_shortTermLogResult:(id)a3 forLockReason:(id)a4 forAtomicInstance:(id)a5 atomicInstanceFilename:(id)a6 forShortTermLock:(id)a7 withSetStatus:(id)a8 returningError:(id)a9;
- (void)_successCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 newerInstanceDiscovered:(id)a5 discoveredAtomicEntries:(id)a6 completion:(id)a7;
- (void)_successCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetStatus:(id)a5 completion:(id)a6;
- (void)_successFormSubAtomicInstance:(id)a3 formedSubAtomicInstance:(id)a4 completion:(id)a5;
- (void)_successLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 lockedAtomicInstance:(id)a5 lockedAtomicEntries:(id)a6 sandboxExtension:(id)a7 sandboxExtensionPath:(id)a8 completion:(id)a9;
- (void)_successMapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 forMappedSelector:(id)a5 completion:(id)a6;
- (void)_successOperation:(id)a3 forAssetSetIdentifier:(id)a4 completion:(id)a5;
- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 completion:(id)a5;
- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6;
- (void)assetSetForStaging:(id)a3 asEntriesWhenTargeting:(id)a4 completion:(id)a5;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 completion:(id)a8;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 reportingProgress:(id)a8 completion:(id)a9;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 completion:(id)a7;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)connectToServerFrameworkCompletion:(id)a3;
- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5;
- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6;
- (void)currentSetStatus:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5;
- (void)formSubAtomicInstance:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 completion:(id)a6;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7;
- (void)mapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 completion:(id)a6;
- (void)needForAtomic:(id)a3 completion:(id)a4;
- (void)needForAtomic:(id)a3 withNeedPolicy:(id)a4 completion:(id)a5;
- (void)setAssetSetIdentifier:(id)a3;
- (void)setAutoAssetEntries:(id)a3;
- (void)setAutoAssetSetClientName:(id)a3;
- (void)setClientDomainName:(id)a3;
- (void)setUpdateCategoryDesiredByClient:(id)a3;
@end

@implementation MAAutoAssetSet

void __47__MAAutoAssetSet_frameworkInstanceSetLogDomain__block_invoke()
{
  id v1 = (id)[[NSString alloc] initWithFormat:@"%@.%s", @"com.apple.MAAutoSetClient", getprogname()];
  v0 = [MEMORY[0x1E4FA56C0] sharedCore];
  [v0 useDomain:v1];
}

void __40__MAAutoAssetSet_frameworkDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetset.framework" UTF8String];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)frameworkDispatchQueue_setFrameworkQueue;
  frameworkDispatchQueue_setFrameworkQueue = (uint64_t)v1;
}

uint64_t __166__MAAutoAssetSet_initUsingClientDomain_forClientName_forAssetSetIdentifier_asShortTermLocker_comprisedOfEntries_usingDesiredPolicyCategory_completingFromQueue_error___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("process.MobileAssetFramework.shortTermLocker", v0);
  v2 = (void *)__maAutoAssetSetShortTermLockerDispatchQueue;
  __maAutoAssetSetShortTermLockerDispatchQueue = (uint64_t)v1;

  __maAutoAssetSetSharedProcessByClientDomainName = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_updateCategoryDesiredByClient, 0);
  objc_storeStrong((id *)&self->_autoAssetEntries, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_autoAssetSetClientName, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 completingFromQueue:(id)a7 error:(id *)a8
{
  return [(MAAutoAssetSet *)self initUsingClientDomain:a3 forClientName:a4 forAssetSetIdentifier:a5 asShortTermLocker:0 comprisedOfEntries:a6 usingDesiredPolicyCategory:0 completingFromQueue:a7 error:a8];
}

- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7
{
  return [(MAAutoAssetSet *)self initUsingClientDomain:a3 forClientName:@"SHORT_TERM_LOCKER" forAssetSetIdentifier:a4 asShortTermLocker:1 comprisedOfEntries:0 usingDesiredPolicyCategory:a5 completingFromQueue:a6 error:a7];
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 asShortTermLocker:(BOOL)a6 comprisedOfEntries:(id)a7 usingDesiredPolicyCategory:(id)a8 completingFromQueue:(id)a9 error:(id *)a10
{
  BOOL v12 = a6;
  id v17 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a7;
  id v26 = a8;
  id v18 = a9;
  v30.receiver = self;
  v30.super_class = (Class)MAAutoAssetSet;
  v19 = [(MAAutoAssetSet *)&v30 init];
  if (!v19)
  {
    v21 = 0;
    goto LABEL_24;
  }
  +[MAAutoAssetSet frameworkInstanceSetLogDomain];
  objc_storeStrong((id *)&v19->_clientDomainName, a3);
  objc_storeStrong((id *)&v19->_autoAssetSetClientName, a4);
  objc_storeStrong((id *)&v19->_assetSetIdentifier, a5);
  v19->_shortTermLocker = v12;
  objc_storeStrong((id *)&v19->_autoAssetEntries, a7);
  objc_storeStrong((id *)&v19->_updateCategoryDesiredByClient, a8);
  if (v18)
  {
    v20 = (OS_dispatch_queue *)v18;
  }
  else
  {
    v20 = +[MAAutoAssetSet defaultDispatchQueue];
  }
  completionDispatchQueue = v19->_completionDispatchQueue;
  v19->_completionDispatchQueue = v20;

  if (!v12)
  {
    if (v19->_completionDispatchQueue) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if (__maAutoAssetSetShortTermLockerOnce != -1) {
    dispatch_once(&__maAutoAssetSetShortTermLockerOnce, &__block_literal_global_15);
  }
  if (!v19->_completionDispatchQueue)
  {
LABEL_16:
    v23 = @"no completion dispatch queue";
    goto LABEL_18;
  }
  if (__maAutoAssetSetShortTermLockerDispatchQueue)
  {
    if (!__maAutoAssetSetSharedProcessByClientDomainName)
    {
      v23 = @"no SHORT-TERM lock tracking dictionary";
      goto LABEL_18;
    }
LABEL_14:
    v24 = 0;
    if (!a10) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v23 = @"no SHORT-TERM locker dispatch queue";
LABEL_18:
  v24 = +[MAAutoAssetError buildError:6101 fromOperation:@"auto-set(initUsingClientDomain)" underlyingError:0 withDescription:v23];
  if (a10) {
LABEL_19:
  }
    *a10 = v24;
LABEL_20:
  if (v24) {
    v21 = 0;
  }
  else {
    v21 = v19;
  }

LABEL_24:
  return v21;
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_setFrameworkLogDomainOnce != -1) {
    dispatch_once(&frameworkInstanceSetLogDomain_setFrameworkLogDomainOnce, &__block_literal_global_765);
  }
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5
{
  return [(MAAutoAssetSet *)self lockAtomicSyncWithContentValidationOption:a3 forAtomicInstance:a4 performContentValidation:1 error:a5];
}

void __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) assetSetIdentifier];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)_closeAndRemoveShortTermLock:(id)a3 forShortTermLock:(id)a4
{
  *(void *)&v33[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  int v8 = [v7 lockedFileDescriptor];
  if (([v7 lockedFileDescriptor] & 0x80000000) == 0)
  {
    int v9 = close([v7 lockedFileDescriptor]);
    [v7 setLockedFileDescriptor:0xFFFFFFFFLL];
    if (v9)
    {
      int v10 = *__error();
      v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
      BOOL v12 = [v11 oslog];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [v7 assetSetAtomicInstance];
        v14 = [v7 summary];
        int v26 = 138544386;
        id v27 = v6;
        __int16 v28 = 1024;
        int v29 = v8;
        __int16 v30 = 2114;
        v31 = v13;
        __int16 v32 = 1024;
        *(_DWORD *)v33 = v10;
        v33[2] = 2114;
        *(void *)&v33[3] = v14;
        _os_log_error_impl(&dword_1B275B000, v12, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | WARNING | failed close of shared lock file | errno:%d | shortTermLock:%{public}@", (uint8_t *)&v26, 0x2Cu);
LABEL_9:
      }
    }
    else
    {
      id v17 = [MEMORY[0x1E4FA56C8] sharedLogger];
      BOOL v12 = [v17 oslog];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v7 assetSetAtomicInstance];
        v14 = [v7 summary];
        int v26 = 138544130;
        id v27 = v6;
        __int16 v28 = 1024;
        int v29 = v8;
        __int16 v30 = 2114;
        v31 = v13;
        __int16 v32 = 2114;
        *(void *)v33 = v14;
        _os_log_impl(&dword_1B275B000, v12, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | released shared lock | shortTermLock:%{public}@", (uint8_t *)&v26, 0x26u);
        goto LABEL_9;
      }
    }

    id v18 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
    v19 = [(MAAutoAssetSet *)self clientDomainName];
    v16 = [v18 safeObjectForKey:v19 ofClass:objc_opt_class()];

    if (v16)
    {
      v20 = [(MAAutoAssetSet *)self assetSetIdentifier];
      v21 = [v16 safeObjectForKey:v20 ofClass:objc_opt_class()];

      if (v21)
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v7 setLockCountByReason:v22];

        [v7 setTotalLockCount:0];
        v23 = [v7 assetSetAtomicInstance];
        [v21 removeObjectForKey:v23];
      }
      else
      {
        v25 = [MEMORY[0x1E4FA56C8] sharedLogger];
        v23 = [v25 oslog];

        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[MAAutoAssetSet _closeAndRemoveShortTermLock:forShortTermLock:]((uint64_t)v6, v7);
        }
      }
    }
    else
    {
      v24 = [MEMORY[0x1E4FA56C8] sharedLogger];
      v21 = [v24 oslog];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[MAAutoAssetSet _closeAndRemoveShortTermLock:forShortTermLock:]((uint64_t)v6, v7);
      }
    }

    goto LABEL_19;
  }
  v15 = [MEMORY[0x1E4FA56C8] sharedLogger];
  v16 = [v15 oslog];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[MAAutoAssetSet _closeAndRemoveShortTermLock:forShortTermLock:]((uint64_t)v6, v7);
  }
LABEL_19:
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = a1 + 32;
  if (!*(void *)(a1 + 32))
  {
    if (v2)
    {
      v16 = (void *)[[NSString alloc] initWithFormat:@"Cannot end SHORT-TERM locks of all atomic-instances when lock-reason provided | endLockReason:%@", *(void *)(a1 + 40)];
      uint64_t v17 = +[MAAutoAssetError buildError:6111 fromOperation:@"auto-set(_shortTermEndAtomicLockSync)" underlyingError:0 withDescription:v16];
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      int v9 = 0;
      goto LABEL_69;
    }
    id v27 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
    __int16 v28 = [*(id *)(a1 + 48) clientDomainName];
    int v29 = [v27 safeObjectForKey:v28 ofClass:objc_opt_class()];

    if (!v29)
    {
      v56 = (void *)[[NSString alloc] initWithFormat:@"Cannot end SHORT-TERM locks of all atomic-instances (byAssetSetIdenfier empty) | endLockReason:%@", *(void *)(a1 + 40)];
      uint64_t v57 = +[MAAutoAssetError buildError:6111 fromOperation:@"auto-set(_shortTermEndAtomicLockSync)" underlyingError:0 withDescription:v56];
      uint64_t v58 = *(void *)(*(void *)(a1 + 56) + 8);
      v59 = *(void **)(v58 + 40);
      *(void *)(v58 + 40) = v57;

      int v9 = 0;
LABEL_68:

      goto LABEL_69;
    }
    __int16 v30 = [*(id *)(a1 + 48) assetSetIdentifier];
    v31 = [v29 safeObjectForKey:v30 ofClass:objc_opt_class()];

    if (!v31)
    {
      v63 = (void *)[[NSString alloc] initWithFormat:@"Cannot end SHORT-TERM locks of all atomic-instances (byAtomicInstance empty) | endLockReason:%@", *(void *)(a1 + 40)];
      uint64_t v64 = +[MAAutoAssetError buildError:6111 fromOperation:@"auto-set(_shortTermEndAtomicLockSync)" underlyingError:0 withDescription:v63];
      uint64_t v65 = *(void *)(*(void *)(a1 + 56) + 8);
      v66 = *(void **)(v65 + 40);
      *(void *)(v65 + 40) = v64;

      int v9 = 0;
LABEL_67:

      goto LABEL_68;
    }
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v33 = v31;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v84 objects:v88 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v85 != v36) {
            objc_enumerationMutation(v33);
          }
          [v32 addObject:*(void *)(*((void *)&v84 + 1) + 8 * i)];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v84 objects:v88 count:16];
      }
      while (v35);
    }

    uint64_t v38 = [v32 count];
    if (v38 < 1)
    {
      id v40 = 0;
    }
    else
    {
      uint64_t v39 = v38;
      v81 = v29;
      id v40 = 0;
      char v41 = 0;
      for (uint64_t j = 0; j != v39; ++j)
      {
        v43 = [v32 objectAtIndex:j];
        LOBYTE(v80) = 0;
        v44 = [*(id *)(a1 + 48) _shortTermLockForAtomicInstance:v43 locking:0 withLockedFileDescriptor:0xFFFFFFFFLL forLockReason:0 justCreated:0 providingLockedSetStatus:0 shouldVerifyContent:v80 error:0];
        [v33 removeObjectForKey:v43];
        if (v44)
        {
          [*(id *)(a1 + 48) _closeAndRemoveShortTermLock:@"_shortTermEndAtomicLockSync(ending all locks of atomic-instances and lock-reasons)" forShortTermLock:v44];
          if (v40) {
            char v41 = 1;
          }
          else {
            id v40 = v44;
          }
        }
      }
      if (v41)
      {
        int v9 = 0;
        int v29 = v81;
LABEL_66:

        goto LABEL_67;
      }
      int v29 = v81;
    }
    id v40 = v40;
    int v9 = v40;
    goto LABEL_66;
  }
  v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  int v8 = *(void **)(v5 + 40);
  id v7 = (id *)(v5 + 40);
  id v6 = v8;
  if (v2)
  {
    obuint64_t j = v6;
    LOBYTE(v80) = 0;
    int v9 = objc_msgSend(v4, "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:", v80, &obj);
    objc_storeStrong(v7, obj);
    if (v9)
    {
      int v10 = [v9 lockCountByReason];
      v11 = [v10 safeObjectForKey:*(void *)(a1 + 40) ofClass:objc_opt_class()];

      if (v11)
      {
        uint64_t v12 = [v11 intValue];
        uint64_t v13 = v12;
        if ((int)v12 > 0)
        {
          if (v12 != 1)
          {
            uint64_t v60 = [objc_alloc(NSNumber) initWithInteger:(v12 - 1)];

            v61 = [v9 lockCountByReason];
            [v61 setSafeObject:v60 forKey:*(void *)(a1 + 40)];

            if ([v9 totalLockCount] < 2)
            {
              v67 = [MEMORY[0x1E4FA56C8] sharedLogger];
              int v26 = [v67 oslog];

              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_4(v3, (uint64_t)v9);
              }
              v11 = (void *)v60;
              goto LABEL_62;
            }
            objc_msgSend(v9, "setTotalLockCount:", objc_msgSend(v9, "totalLockCount") - 1);
            v11 = (void *)v60;
            goto LABEL_60;
          }
          v14 = [v9 lockCountByReason];
          [v14 removeObjectForKey:*(void *)(a1 + 40)];

          uint64_t v15 = [v9 totalLockCount];
          if (v15 < 1)
          {
            v68 = [MEMORY[0x1E4FA56C8] sharedLogger];
            v69 = [v68 oslog];

            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
              __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_3(v3, (uint64_t)v9);
            }
          }
          else
          {
            objc_msgSend(v9, "setTotalLockCount:", objc_msgSend(v9, "totalLockCount") - 1);
          }
          v70 = [v9 lockCountByReason];
          if ([v70 count])
          {
          }
          else
          {
            uint64_t v71 = [v9 totalLockCount];

            if (v71 > 0)
            {
              if (v15 < 1)
              {
LABEL_63:

                goto LABEL_69;
              }
              goto LABEL_60;
            }
            [*(id *)(a1 + 48) _closeAndRemoveShortTermLock:@"_shortTermEndAtomicLockSync(ending specific atomic-instance lock)" forShortTermLock:v9];
          }
          if (v15 <= 0) {
            goto LABEL_63;
          }
LABEL_60:
          v72 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
          v73 = [*(id *)(a1 + 48) clientDomainName];
          int v26 = [v72 safeObjectForKey:v73 ofClass:objc_opt_class()];

          if (v26)
          {
            v74 = [*(id *)(a1 + 48) assetSetIdentifier];
            v75 = [v26 safeObjectForKey:v74 ofClass:objc_opt_class()];

            v76 = [v9 assetSetAtomicInstance];
            [v75 setSafeObject:v9 forKey:v76];

            v77 = [*(id *)(a1 + 48) assetSetIdentifier];
            [v26 setSafeObject:v75 forKey:v77];

            v78 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
            v79 = [*(id *)(a1 + 48) clientDomainName];
            [v78 setSafeObject:v26 forKey:v79];
          }
          goto LABEL_62;
        }
        id v50 = [NSString alloc];
        int v26 = [v9 summary];
        v51 = [v50 initWithFormat:@"SHORT-TERM lock lockCountForReason has invalid lock count | shortTermLock:%@ | endLockReason:%@ | lockCount:%d", v26, *(void *)(a1 + 40), v13];
        uint64_t v52 = +[MAAutoAssetError buildError:6501 fromOperation:@"auto-set(_shortTermEndAtomicLockSync)" underlyingError:0 withDescription:v51];
        uint64_t v53 = *(void *)(*(void *)(a1 + 56) + 8);
        v54 = *(void **)(v53 + 40);
        *(void *)(v53 + 40) = v52;

        goto LABEL_45;
      }
      id v45 = [NSString alloc];
      int v26 = [v9 summary];
      v46 = (void *)[v45 initWithFormat:@"SHORT-TERM lock is not currently locked for reason to end-lock for | shortTermLock:%@ | endLockReason:%@", v26, *(void *)(a1 + 40)];
      uint64_t v47 = +[MAAutoAssetError buildError:6501 fromOperation:@"auto-set(_shortTermEndAtomicLockSync)" underlyingError:0 withDescription:v46];
      uint64_t v48 = *(void *)(*(void *)(a1 + 56) + 8);
      v49 = *(void **)(v48 + 40);
      *(void *)(v48 + 40) = v47;

      v11 = 0;
      goto LABEL_62;
    }
  }
  else
  {
    id v83 = v6;
    LOBYTE(v80) = 0;
    int v9 = objc_msgSend(v4, "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:", v80, &v83);
    objc_storeStrong(v7, v83);
    v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v20 && [v20 code] == 6110)
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      id v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = 0;
    }
    if (v9)
    {
      v23 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
      v24 = [*(id *)(a1 + 48) clientDomainName];
      v11 = [v23 safeObjectForKey:v24 ofClass:objc_opt_class()];

      if (!v11)
      {
        v55 = [MEMORY[0x1E4FA56C8] sharedLogger];
        int v26 = [v55 oslog];

        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_1(v3, (uint64_t)v9);
        }
        goto LABEL_62;
      }
      v25 = [*(id *)(a1 + 48) assetSetIdentifier];
      int v26 = [v11 safeObjectForKey:v25 ofClass:objc_opt_class()];

      if (!v26)
      {
        v62 = [MEMORY[0x1E4FA56C8] sharedLogger];
        v51 = [v62 oslog];

        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_2(v3, (uint64_t)v9);
        }
LABEL_45:

        goto LABEL_62;
      }
      [*(id *)(a1 + 48) _closeAndRemoveShortTermLock:@"_shortTermEndAtomicLockSync(ending specific atomic-instance locks - all lock-reasons)" forShortTermLock:v9];
LABEL_62:

      goto LABEL_63;
    }
  }
LABEL_69:
  [*(id *)(a1 + 48) _shortTermLogResult:@"_shortTermEndAtomicLockSync" forLockReason:*(void *)(a1 + 40) forAtomicInstance:*(void *)(a1 + 32) atomicInstanceFilename:0 forShortTermLock:v9 withSetStatus:0 returningError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 shouldVerifyContent:(BOOL)a9 error:(id *)a10
{
  uint64_t v11 = *(void *)&a5;
  BOOL v12 = a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  v16 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
  uint64_t v17 = [(MAAutoAssetSet *)self clientDomainName];
  id v18 = [v16 safeObjectForKey:v17 ofClass:objc_opt_class()];

  v81 = v14;
  if (!v18)
  {
    if (v12)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v34 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
      uint64_t v35 = [(MAAutoAssetSet *)self clientDomainName];
      [v34 setSafeObject:v18 forKey:v35];

      if (v18) {
        goto LABEL_2;
      }
      v25 = 0;
      BOOL v36 = 0;
      id v28 = 0;
    }
    else
    {
      uint64_t v47 = (void *)[[NSString alloc] initWithFormat:@"No current SHORT-TERM lock (by clientDomainName) | assetSetAtomicInstance:%@ | lockReason:%@", v14, v15];
      id v28 = +[MAAutoAssetError buildError:6110 fromOperation:@"auto-set(_shortTermLockForAtomicInstance)" underlyingError:0 withDescription:v47];

      id v18 = 0;
      v25 = 0;
      BOOL v36 = 0;
    }
    id v27 = 0;
    id v22 = 0;
    uint64_t v48 = a8;
    goto LABEL_47;
  }
LABEL_2:
  id v80 = v15;
  v19 = [(MAAutoAssetSet *)self assetSetIdentifier];
  id v20 = [v18 safeObjectForKey:v19 ofClass:objc_opt_class()];

  if (!v20)
  {
    if (!v12)
    {
      v49 = (void *)[[NSString alloc] initWithFormat:@"No current SHORT-TERM lock (by assetSetIdentifier) | assetSetAtomicInstance:%@ | lockReason:%@", v14, v80];
      id v28 = +[MAAutoAssetError buildError:6110 fromOperation:@"auto-set(_shortTermLockForAtomicInstance)" underlyingError:0 withDescription:v49];

      id v20 = 0;
      goto LABEL_24;
    }
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v37 = [(MAAutoAssetSet *)self assetSetIdentifier];
    [v18 setSafeObject:v20 forKey:v37];

    if (!v20)
    {
      v25 = 0;
LABEL_43:
      BOOL v36 = 0;
      id v28 = 0;
      goto LABEL_44;
    }
  }
  uint64_t v21 = [v20 safeObjectForKey:v14 ofClass:objc_opt_class()];
  if (!v21)
  {
    if (v12)
    {
      [(MAAutoAssetSet *)self clientDomainName];
      v39 = id v38 = v14;
      id v40 = [(MAAutoAssetSet *)self assetSetIdentifier];
      id v41 = v38;
      v25 = +[MAAutoAssetSetStatus shortTermLockFilename:v39 forAssetSetIdentifier:v40 forSetAtomicInstance:v38];

      if ((v11 & 0x80000000) != 0)
      {
        id v84 = 0;
        id v85 = 0;
        uint64_t v62 = [(MAAutoAssetSet *)self _shortTermOpenSharedLockFile:@"auto-set(_shortTermLockForAtomicInstance)[atomic-instance]" lockingAtomicInstance:v41 forLockReason:v80 verifyingLocalContentURLs:a9 openingFilename:v25 providingLockedSetStatus:&v85 sharedLockError:&v84];
        id v27 = v85;
        id v28 = v84;
        if ((v62 & 0x80000000) == 0)
        {
          id v22 = [[MAAutoAssetSetShortTermLock alloc] initForAssetSetAtomicInstance:v81 withLockedFilename:v25 withLockedFileDescriptor:v62 forFirstLockReason:v80];
          if (!v22)
          {
            v73 = (void *)[[NSString alloc] initWithFormat:@"Unable to allocate SHORT-TERM lock tracking | lockReason:%@ | atomicInstanceFilename:%@", v80, v25];
            uint64_t v74 = +[MAAutoAssetError buildError:6582 fromOperation:@"auto-set(_shortTermLockForAtomicInstance)" underlyingError:0 withDescription:v73];

            BOOL v36 = 0;
            id v28 = (id)v74;
            goto LABEL_46;
          }
          [v20 setSafeObject:v22 forKey:v81];
          v63 = [(MAAutoAssetSet *)self assetSetIdentifier];
          [v18 setSafeObject:v20 forKey:v63];

          uint64_t v64 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
          uint64_t v65 = [(MAAutoAssetSet *)self clientDomainName];
          [v64 setSafeObject:v18 forKey:v65];

          v66 = [MEMORY[0x1E4FA56C8] sharedLogger];
          v67 = [v66 oslog];

          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            v68 = [v22 summary];
            *(_DWORD *)buf = 138543874;
            *(void *)long long v87 = v81;
            *(_WORD *)&v87[8] = 2114;
            *(void *)&v87[10] = v80;
            *(_WORD *)&v87[18] = 2114;
            *(void *)&v87[20] = v68;
            _os_log_impl(&dword_1B275B000, v67, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockForAtomicInstance} (%{public}@) | lockReason:%{public}@ | holding shared lock | shortTermLock:%{public}@", buf, 0x20u);
          }
          goto LABEL_39;
        }
        BOOL v36 = 0;
LABEL_45:
        id v22 = 0;
        goto LABEL_46;
      }
      id v42 = [[MAAutoAssetSetShortTermLock alloc] initForAssetSetAtomicInstance:v41 withLockedFilename:v25 withLockedFileDescriptor:v11 forFirstLockReason:v80];
      id v43 = v41;
      if (v42)
      {
        id v22 = v42;
        [v20 setSafeObject:v42 forKey:v41];
        v44 = [(MAAutoAssetSet *)self assetSetIdentifier];
        [v18 setSafeObject:v20 forKey:v44];

        id v45 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
        v46 = [(MAAutoAssetSet *)self clientDomainName];
        [v45 setSafeObject:v18 forKey:v46];

        id v28 = 0;
        id v27 = 0;
LABEL_39:
        BOOL v36 = 1;
        goto LABEL_46;
      }
      v69 = [MEMORY[0x1E4FA56C8] sharedLogger];
      v70 = [v69 oslog];

      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)long long v87 = v43;
        *(_WORD *)&v87[8] = 2114;
        *(void *)&v87[10] = v80;
        *(_WORD *)&v87[18] = 2114;
        *(void *)&v87[20] = v25;
        _os_log_error_impl(&dword_1B275B000, v70, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockForAtomicInstance} (%{public}@) | lockReason:%{public}@ | WARNING | unable to allocate MAAutoAssetSetShortTermLock (when already locked) | atomicInstanceFilename:%{public}@", buf, 0x20u);
      }

      goto LABEL_43;
    }
    id v50 = (void *)[[NSString alloc] initWithFormat:@"No current SHORT-TERM lock (by atomicInstance) | assetSetAtomicInstance:%@ | lockReason:%@", v14, v80];
    id v28 = +[MAAutoAssetError buildError:6110 fromOperation:@"auto-set(_shortTermLockForAtomicInstance)" underlyingError:0 withDescription:v50];

LABEL_24:
    v25 = 0;
    BOOL v36 = 0;
LABEL_44:
    id v27 = 0;
    goto LABEL_45;
  }
  id v22 = (id)v21;
  if (v12)
  {
    v23 = [(MAAutoAssetSet *)self clientDomainName];
    v24 = [(MAAutoAssetSet *)self assetSetIdentifier];
    v25 = +[MAAutoAssetSetStatus shortTermLockFilename:v23 forAssetSetIdentifier:v24 forSetAtomicInstance:v81];

    id v82 = 0;
    id v83 = 0;
    int v26 = [(MAAutoAssetSet *)self _shortTermOpenSharedLockFile:@"auto-set(_shortTermLockForAtomicInstance)[atomic-instance]" lockingAtomicInstance:v81 forLockReason:v80 verifyingLocalContentURLs:a9 openingFilename:v25 providingLockedSetStatus:&v83 sharedLockError:&v82];
    id v27 = v83;
    id v28 = v82;
    if (v26 < 0)
    {
LABEL_33:
      BOOL v36 = 0;
      goto LABEL_46;
    }
    int v29 = [v22 lockCountByReason];
    v77 = [v29 safeObjectForKey:v80 ofClass:objc_opt_class()];

    if (close(v26))
    {
      int v75 = v26;
      int v30 = *__error();
      v31 = [MEMORY[0x1E4FA56C8] sharedLogger];
      id v32 = [v31 oslog];

      os_log_t log = v32;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = [v27 latestDownloadedAtomicInstance];
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)long long v87 = v75;
        *(_WORD *)&v87[4] = 2114;
        *(void *)&v87[6] = v33;
        *(_WORD *)&v87[14] = 2114;
        *(void *)&v87[16] = v80;
        *(_WORD *)&v87[24] = 2114;
        *(void *)&v87[26] = v25;
        __int16 v88 = 1024;
        int v89 = v30;
        _os_log_error_impl(&dword_1B275B000, v32, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockForAtomicInstance}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | WARNING | failed close of validation lock file | atomicInstanceFilename:%{public}@ | errno:%d", buf, 0x2Cu);
LABEL_27:

        unint64_t v53 = 0x1E4F28000;
LABEL_29:

        v54 = [v22 lockCountByReason];
        id v55 = objc_alloc(*(Class *)(v53 + 3792));
        if (v77) {
          uint64_t v56 = (int)([v77 intValue] + 1);
        }
        else {
          uint64_t v56 = 1;
        }
        uint64_t v57 = (void *)[v55 initWithInteger:v56];
        [v54 setSafeObject:v57 forKey:v80];

        objc_msgSend(v22, "setTotalLockCount:", objc_msgSend(v22, "totalLockCount") + 1);
        uint64_t v58 = [v22 assetSetAtomicInstance];
        [v20 setSafeObject:v22 forKey:v58];

        v59 = [(MAAutoAssetSet *)self assetSetIdentifier];
        [v18 setSafeObject:v20 forKey:v59];

        uint64_t v60 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
        v61 = [(MAAutoAssetSet *)self clientDomainName];
        [v60 setSafeObject:v18 forKey:v61];

        goto LABEL_33;
      }
    }
    else
    {
      v51 = [MEMORY[0x1E4FA56C8] sharedLogger];
      uint64_t v52 = [v51 oslog];

      os_log_t log = v52;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = [v27 latestDownloadedAtomicInstance];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)long long v87 = v26;
        *(_WORD *)&v87[4] = 2114;
        *(void *)&v87[6] = v33;
        *(_WORD *)&v87[14] = 2114;
        *(void *)&v87[16] = v80;
        *(_WORD *)&v87[24] = 2114;
        *(void *)&v87[26] = v25;
        id v32 = v52;
        _os_log_impl(&dword_1B275B000, v52, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockForAtomicInstance}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | released validateFileDescriptor | atomicInstanceFilename:%{public}@ ", buf, 0x26u);
        goto LABEL_27;
      }
    }
    unint64_t v53 = 0x1E4F28000uLL;
    id v32 = log;
    goto LABEL_29;
  }
  v25 = 0;
  BOOL v36 = 0;
  id v28 = 0;
  id v27 = 0;
LABEL_46:
  uint64_t v48 = a8;

  id v15 = v80;
LABEL_47:
  if (a7) {
    *a7 = v36;
  }
  if (v48) {
    *uint64_t v48 = v27;
  }
  if (a10) {
    *a10 = v28;
  }
  [(MAAutoAssetSet *)self _shortTermLogResult:@"_shortTermLockForAtomicInstance" forLockReason:v15 forAtomicInstance:v81 atomicInstanceFilename:v25 forShortTermLock:v22 withSetStatus:0 returningError:v28];
  id v71 = v22;

  return v71;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)_shortTermLogResult:(id)a3 forLockReason:(id)a4 forAtomicInstance:(id)a5 atomicInstanceFilename:(id)a6 forShortTermLock:(id)a7 withSetStatus:(id)a8 returningError:(id)a9
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v15 = (__CFString *)a4;
  v16 = (__CFString *)a5;
  uint64_t v17 = (__CFString *)a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  uint64_t v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v22 = [v21 oslog];

  if (!v20)
  {
    BOOL v27 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v27)
      {
        uint64_t v28 = [(MAAutoAssetSet *)self assetSetIdentifier];
        int v29 = @"N";
        if (v15) {
          int v30 = v15;
        }
        else {
          int v30 = @"N";
        }
        v49 = v30;
        uint64_t v52 = (void *)v28;
        v31 = [v18 summary];
        if (v19)
        {
          int v29 = [v19 summary];
        }
        *(_DWORD *)buf = 138544386;
        id v56 = v54;
        __int16 v57 = 2114;
        uint64_t v58 = v52;
        __int16 v59 = 2114;
        uint64_t v60 = v49;
        __int16 v61 = 2114;
        uint64_t v62 = v31;
        __int16 v63 = 2114;
        uint64_t v64 = v29;
        _os_log_impl(&dword_1B275B000, v22, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ SUCCESS | lockReason:%{public}@ | shortTermLock:%{public}@ | setStatus:%{public}@", buf, 0x34u);
        if (v19) {
      }
        }
      goto LABEL_22;
    }
    if (!v27) {
      goto LABEL_53;
    }
    unint64_t v53 = [(MAAutoAssetSet *)self assetSetIdentifier];
    uint64_t v35 = @"N";
    if (v15) {
      id v40 = v15;
    }
    else {
      id v40 = @"N";
    }
    if (v16) {
      id v41 = v16;
    }
    else {
      id v41 = @"N";
    }
    if (v17) {
      id v42 = v17;
    }
    else {
      id v42 = @"N";
    }
    if (v19)
    {
      id v43 = v42;
      uint64_t v44 = [v19 summary];
      id v42 = v43;
      uint64_t v35 = (__CFString *)v44;
    }
    *(_DWORD *)buf = 138544642;
    id v56 = v54;
    __int16 v57 = 2114;
    uint64_t v58 = v53;
    __int16 v59 = 2114;
    uint64_t v60 = v40;
    __int16 v61 = 2114;
    uint64_t v62 = v41;
    __int16 v63 = 2114;
    uint64_t v64 = v42;
    __int16 v65 = 2114;
    v66 = v35;
    _os_log_impl(&dword_1B275B000, v22, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ SUCCESS | lockReason:%{public}@ | forAtomicInstance:%{public}@ | atomicInstanceFilename:%{public}@ | setStatus:%{public}@", buf, 0x3Eu);
    if (!v19)
    {
LABEL_52:

      goto LABEL_53;
    }
LABEL_51:

    goto LABEL_52;
  }
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
  if (!v18)
  {
    if (!v23) {
      goto LABEL_53;
    }
    uint64_t v34 = [(MAAutoAssetSet *)self assetSetIdentifier];
    uint64_t v35 = @"N";
    if (v15) {
      BOOL v36 = v15;
    }
    else {
      BOOL v36 = @"N";
    }
    if (v16) {
      v37 = v16;
    }
    else {
      v37 = @"N";
    }
    id v50 = v37;
    unint64_t v53 = (void *)v34;
    if (v17) {
      id v38 = v17;
    }
    else {
      id v38 = @"N";
    }
    v46 = v38;
    if (v19)
    {
      uint64_t v35 = [v19 summary];
    }
    uint64_t v39 = objc_msgSend(v20, "checkedDescription", v46);
    *(_DWORD *)buf = 138544898;
    id v56 = v54;
    __int16 v57 = 2114;
    uint64_t v58 = v53;
    __int16 v59 = 2114;
    uint64_t v60 = v36;
    __int16 v61 = 2114;
    uint64_t v62 = v50;
    __int16 v63 = 2114;
    uint64_t v64 = v47;
    __int16 v65 = 2114;
    v66 = v35;
    __int16 v67 = 2114;
    v68 = v39;
    _os_log_error_impl(&dword_1B275B000, v22, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ ERROR | lockReason:%{public}@ | forAtomicInstance:%{public}@ | atomicInstanceFilename:%{public}@ | setStatus:%{public}@ | error:%{public}@", buf, 0x48u);

    if (!v19) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  if (v23)
  {
    v51 = [(MAAutoAssetSet *)self assetSetIdentifier];
    v24 = @"N";
    if (v15) {
      v25 = v15;
    }
    else {
      v25 = @"N";
    }
    objc_msgSend(v18, "summary", v25);
    uint64_t v48 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v24 = [v19 summary];
    }
    int v26 = [v20 checkedDescription];
    *(_DWORD *)buf = 138544642;
    id v56 = v54;
    __int16 v57 = 2114;
    uint64_t v58 = v51;
    __int16 v59 = 2114;
    uint64_t v60 = v45;
    __int16 v61 = 2114;
    uint64_t v62 = v48;
    __int16 v63 = 2114;
    uint64_t v64 = v24;
    __int16 v65 = 2114;
    v66 = v26;
    _os_log_error_impl(&dword_1B275B000, v22, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ ERROR | lockReason:%{public}@ | shortTermLock:%{public}@ | setStatus:%{public}@ | error:%{public}@", buf, 0x3Eu);

    if (v19) {
  }
    }
LABEL_22:

  id v32 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v22 = [v32 oslog];

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = [v18 lockCountByReason];
    *(_DWORD *)buf = 138543362;
    id v56 = v33;
    _os_log_impl(&dword_1B275B000, v22, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] lockCountByReason:\n%{public}@", buf, 0xCu);
  }
LABEL_53:
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

void __92__MAAutoAssetSet__shortTermLockAtomicSync_forAtomicInstance_performContentValidation_error___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  unsigned __int8 v58 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3)
  {
    id v19 = [*(id *)(a1 + 40) clientDomainName];
    id v20 = [*(id *)(a1 + 40) assetSetIdentifier];
    uint64_t v21 = +[MAAutoAssetSetStatus shortTermLockFilename:v19 forAssetSetIdentifier:v20 forSetAtomicInstance:0];

    id v22 = *(void **)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    uint64_t v26 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
    id v56 = *(id *)(v27 + 40);
    id v57 = v25;
    uint64_t v28 = [v22 _shortTermOpenSharedLockFile:@"auto-set(_shortTermLockAtomicSync)[atomic-instance]" lockingAtomicInstance:v2 forLockReason:v23 verifyingLocalContentURLs:v26 openingFilename:v21 providingLockedSetStatus:&v57 sharedLockError:&v56];
    objc_storeStrong((id *)(v24 + 40), v57);
    objc_storeStrong((id *)(v27 + 40), v56);
    if ((v28 & 0x80000000) != 0)
    {
      int v10 = 0;
      goto LABEL_17;
    }
    uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) latestDownloadedAtomicInstance];

    int v30 = *(void **)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 48);
    char v32 = *(unsigned char *)(a1 + 72);
    uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
    id v55 = *(id *)(v33 + 40);
    LOBYTE(v52) = v32;
    int v10 = [v30 _shortTermLockForAtomicInstance:v29 locking:1 withLockedFileDescriptor:v28 forLockReason:v31 justCreated:&v58 providingLockedSetStatus:0 shouldVerifyContent:v52 error:&v55];
    objc_storeStrong((id *)(v33 + 40), v55);
    if (v10)
    {
      int v34 = v58;
      uint64_t v35 = [MEMORY[0x1E4FA56C8] sharedLogger];
      uint64_t v13 = [v35 oslog];

      BOOL v36 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v36)
        {
          uint64_t v37 = *(void *)(a1 + 48);
          id v38 = [v10 summary];
          *(_DWORD *)buf = 138543874;
          *(void *)uint64_t v60 = v29;
          *(_WORD *)&v60[8] = 2114;
          *(void *)&v60[10] = v37;
          *(_WORD *)&v60[18] = 2114;
          *(void *)&v60[20] = v38;
          uint64_t v39 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ |"
                " holding shared lock | shortTermLock:%{public}@";
          id v40 = v13;
          uint32_t v41 = 32;
LABEL_27:
          _os_log_impl(&dword_1B275B000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v36)
      {
        uint64_t v44 = *(void *)(a1 + 48);
        id v45 = [v10 summary];
        *(_DWORD *)buf = 138543874;
        *(void *)uint64_t v60 = v29;
        *(_WORD *)&v60[8] = 2114;
        *(void *)&v60[10] = v44;
        *(_WORD *)&v60[18] = 2114;
        *(void *)&v60[20] = v45;
        _os_log_impl(&dword_1B275B000, v13, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ | additional (locally tracked usage) of shared lock | shortTermLock:%{public}@", buf, 0x20u);
      }
    }
    if (close(v28))
    {
      int v46 = *__error();
      uint64_t v47 = [MEMORY[0x1E4FA56C8] sharedLogger];
      uint64_t v13 = [v47 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)uint64_t v60 = v28;
        *(_WORD *)&v60[4] = 2114;
        *(void *)&v60[6] = v29;
        *(_WORD *)&v60[14] = 2114;
        *(void *)&v60[16] = v48;
        *(_WORD *)&v60[24] = 1024;
        *(_DWORD *)&v60[26] = v46;
        _os_log_error_impl(&dword_1B275B000, v13, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | WARNING | (extraFileLockToClose) failed close of sharedLockedFileDescriptor, errno:%d", buf, 0x22u);
      }
      goto LABEL_16;
    }
    v49 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v13 = [v49 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = *(void *)(a1 + 48);
      id v38 = [v10 summary];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)uint64_t v60 = v28;
      *(_WORD *)&v60[4] = 2114;
      *(void *)&v60[6] = v29;
      *(_WORD *)&v60[14] = 2114;
      *(void *)&v60[16] = v50;
      *(_WORD *)&v60[24] = 2114;
      *(void *)&v60[26] = v38;
      uint64_t v39 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync}\n"
            "[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | (extraFileLockToClose) released sharedLockedFi"
            "leDescriptor | shortTermLock:%{public}@";
      id v40 = v13;
      uint32_t v41 = 38;
      goto LABEL_27;
    }
LABEL_16:

    id v2 = (id)v29;
    goto LABEL_17;
  }
  v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  char v8 = *(unsigned char *)(a1 + 72);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v53 = *(id *)(v9 + 40);
  obuint64_t j = v7;
  LOBYTE(v51) = v8;
  int v10 = [v4 _shortTermLockForAtomicInstance:v3 locking:1 withLockedFileDescriptor:0xFFFFFFFFLL forLockReason:v5 justCreated:&v58 providingLockedSetStatus:&obj shouldVerifyContent:v51 error:&v53];
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v9 + 40), v53);
  if (v10)
  {
    int v11 = v58;
    BOOL v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v13 = [v12 oslog];

    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 48);
        uint64_t v17 = [v10 summary];
        *(_DWORD *)buf = 138543874;
        *(void *)uint64_t v60 = v15;
        *(_WORD *)&v60[8] = 2114;
        *(void *)&v60[10] = v16;
        *(_WORD *)&v60[18] = 2114;
        *(void *)&v60[20] = v17;
        id v18 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ | h"
              "olding shared lock | shortTermLock:%{public}@";
LABEL_14:
        _os_log_impl(&dword_1B275B000, v13, OS_LOG_TYPE_DEFAULT, v18, buf, 0x20u);
      }
    }
    else if (v14)
    {
      uint64_t v42 = *(void *)(a1 + 32);
      uint64_t v43 = *(void *)(a1 + 48);
      uint64_t v17 = [v10 summary];
      *(_DWORD *)buf = 138543874;
      *(void *)uint64_t v60 = v42;
      *(_WORD *)&v60[8] = 2114;
      *(void *)&v60[10] = v43;
      *(_WORD *)&v60[18] = 2114;
      *(void *)&v60[20] = v17;
      id v18 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ | add"
            "itional (locally tracked usage) of shared lock | shortTermLock:%{public}@";
      goto LABEL_14;
    }
    uint64_t v21 = 0;
    uint64_t v29 = (uint64_t)v2;
    goto LABEL_16;
  }
  uint64_t v21 = 0;
LABEL_17:
  [*(id *)(a1 + 40) _shortTermLogResult:@"_shortTermLockAtomicSync" forLockReason:*(void *)(a1 + 48) forAtomicInstance:*(void *)(a1 + 32) atomicInstanceFilename:v21 forShortTermLock:v10 withSetStatus:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) returningError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (int)_shortTermOpenSharedLockFile:(id)a3 lockingAtomicInstance:(id)a4 forLockReason:(id)a5 verifyingLocalContentURLs:(BOOL)a6 openingFilename:(id)a7 providingLockedSetStatus:(id *)a8 sharedLockError:(id *)a9
{
  BOOL v89 = a6;
  uint64_t v13 = a9;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  uint64_t v15 = (__CFString *)a4;
  id v16 = a5;
  uint64_t v17 = v15;
  id v18 = v16;
  id v19 = a7;
  id v20 = @"SYMLINK";
  if (v15) {
    id v20 = v15;
  }
  uint64_t v21 = v20;
  id v22 = v19;
  int v23 = open((const char *)[v22 UTF8String], 20);
  int v24 = v23;
  uint64_t v90 = v17;
  if (v23 < 0)
  {
    int v92 = v23;
    uint64_t v28 = a9;
    uint64_t v31 = *__error();
    id v32 = [NSString alloc];
    uint64_t v33 = v21;
    id v34 = v18;
    uint64_t v29 = v33;
    uint64_t v35 = [v32 initWithFormat:@"Unable to obtain shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@ | errno:%d", v33, v18, v22, v31];
    id v36 = v14;
    uint64_t v37 = (void *)v35;
    id v38 = v36;
    uint64_t v27 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6582);

    uint64_t v39 = [MEMORY[0x1E4FA56C8] sharedLogger];
    v25 = [v39 oslog];

    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v87 = 0;
      uint64_t v88 = 0;
      id v14 = v38;
      id v18 = v34;
      goto LABEL_44;
    }
    *(_DWORD *)buf = 138544386;
    id v14 = v38;
    id v100 = v38;
    __int16 v101 = 2114;
    *(void *)v102 = v29;
    *(_WORD *)&v102[8] = 2114;
    id v18 = v34;
    uint64_t v21 = v29;
    *(void *)&v102[10] = v18;
    *(_WORD *)&v102[18] = 2114;
    *(void *)&v102[20] = v22;
    *(_WORD *)&v102[28] = 1024;
    *(_DWORD *)&v102[30] = v31;
    _os_log_error_impl(&dword_1B275B000, v25, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile} (%{public}@) | lockReason:%{public}@ | unable to obtain shared lock | atomicInstanceFilename:%{public}@ | errno:%d", buf, 0x30u);
    uint64_t v87 = 0;
    uint64_t v88 = 0;
LABEL_45:
    BOOL v45 = v89;
    int v46 = a8;

    v25 = 0;
    uint64_t v13 = v28;
    uint64_t v17 = v90;
    goto LABEL_46;
  }
  id v98 = 0;
  v25 = [(MAAutoAssetSet *)self _readLockedSetStatusFromSharedLockFile:v22 error:&v98];
  id v26 = v98;
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = a9;
    uint64_t v29 = v21;
    id v30 = v18;
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    goto LABEL_37;
  }
  if (!v25)
  {
    id v85 = 0;
    uint64_t v61 = (void *)[[NSString alloc] initWithFormat:@"Unable to read contents of shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@", v21, v18, v22];
    uint64_t v62 = 6582;
LABEL_34:
    uint64_t v27 = +[MAAutoAssetError buildError:v62 fromOperation:v14 underlyingError:0 withDescription:v61];
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    int v46 = a8;
    goto LABEL_35;
  }
  [MEMORY[0x1E4FA56C8] sharedLogger];
  id v40 = v86 = v14;
  uint32_t v41 = [v40 oslog];

  id v14 = v86;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v100 = v86;
    __int16 v101 = 1024;
    *(_DWORD *)v102 = v24;
    *(_WORD *)&v102[4] = 2114;
    *(void *)&v102[6] = v21;
    *(_WORD *)&v102[14] = 2112;
    *(void *)&v102[16] = v18;
    *(_WORD *)&v102[24] = 2114;
    *(void *)&v102[26] = v22;
    _os_log_impl(&dword_1B275B000, v41, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile}\n[SHORT_FILE_OPEN][%d] (%{public}@) | lockReason:%@ | successfully opened SHORT-TERM | atomicInstanceFilename:%{public}@ | ", buf, 0x30u);
  }

  uint64_t v42 = [v25 latestDownloadedAtomicInstance];

  if (!v42)
  {
    id v85 = v25;
    uint64_t v61 = (void *)[[NSString alloc] initWithFormat:@"No latestDownloadedAtomicInstance in locked set-status from shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@", v21, v18, v22];
    uint64_t v62 = 6111;
    goto LABEL_34;
  }
  uint64_t v43 = [v25 latestDowloadedAtomicInstanceEntries];
  uint64_t v44 = [v43 count];

  if (!v44)
  {
    id v85 = v25;
    uint64_t v61 = (void *)[[NSString alloc] initWithFormat:@"Empty latestDowloadedAtomicInstanceEntries in locked set-status from shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@", v21, v18, v22];
    uint64_t v62 = 6110;
    id v14 = v86;
    goto LABEL_34;
  }
  int v92 = v24;
  BOOL v45 = v89;
  if (!v89)
  {
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    uint64_t v27 = 0;
    id v14 = v86;
    int v46 = a8;
    goto LABEL_46;
  }
  id v83 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  obuint64_t j = [v25 latestDowloadedAtomicInstanceEntries];
  int v46 = a8;
  uint64_t v81 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
  if (!v81)
  {
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    uint64_t v27 = 0;
    id v14 = v86;
    int v24 = v92;
    goto LABEL_66;
  }
  uint64_t v87 = 0;
  uint64_t v88 = 0;
  uint64_t v82 = *(void *)v95;
  int v24 = v92;
  id v79 = v18;
  while (2)
  {
    uint64_t v47 = 0;
    do
    {
      if (*(void *)v95 != v82) {
        objc_enumerationMutation(obj);
      }
      uint64_t v48 = *(void **)(*((void *)&v94 + 1) + 8 * v47);
      v49 = [v48 localContentURL];

      if (!v49)
      {
        id v73 = [NSString alloc];
        id v84 = [v48 summary];
        id v18 = v79;
        id v57 = (void *)[v73 initWithFormat:@"AtomicEntry in locked set-status has nil localContentURL (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@", v21, v79, v22, v84];
        id v14 = v86;
        uint64_t v27 = +[MAAutoAssetError buildError:6108 fromOperation:v86 underlyingError:0 withDescription:v57];
        goto LABEL_65;
      }
      uint64_t v50 = [v48 localContentURL];
      uint64_t v51 = [v50 lastPathComponent];

      int v52 = [MEMORY[0x1E4FA56C0] stringIsEqual:v51 to:@".AssetData"];
      id v84 = (void *)v51;
      if ((v52 & 1) == 0 && ([MEMORY[0x1E4FA56C0] stringIsEqual:v51 to:@"AssetData"] & 1) == 0)
      {
        id v74 = [NSString alloc];
        id v57 = [v48 summary];
        id v18 = v79;
        int v75 = (void *)[v74 initWithFormat:@"AtomicEntry in locked set-status that is neither standard nor secure asset (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@", v21, v79, v22, v57];
        uint64_t v27 = +[MAAutoAssetError buildError:6108 fromOperation:v86 underlyingError:0 withDescription:v75];

        id v14 = v86;
LABEL_63:
        int v24 = v92;
LABEL_65:

        int v46 = a8;
        goto LABEL_66;
      }
      id v53 = v21;
      id v54 = [v48 localContentURL];
      id v55 = [v54 URLByDeletingLastPathComponent];
      id v56 = [v55 URLByAppendingPathComponent:@"Info.plist"];
      id v57 = [v56 path];

      if (!v57 || ([v83 fileExistsAtPath:v57] & 1) == 0)
      {
        id v70 = [NSString alloc];
        id v71 = [v48 summary];
        id v18 = v79;
        v72 = (void *)[v70 initWithFormat:@"AtomicEntry in locked set-status has localContentURL where Info.plist is missing (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@ | infoPlistPath:%@", v53, v79, v22, v71, v57];
        id v14 = v86;
        uint64_t v27 = +[MAAutoAssetError buildError:6108 fromOperation:v86 underlyingError:0 withDescription:v72];

        uint64_t v21 = v53;
        goto LABEL_62;
      }
      if (v52)
      {
        unsigned __int8 v58 = [v48 localContentURL];
        __int16 v59 = [v58 path];
        uint64_t v60 = [v59 stringByAppendingPathComponent:@"System/Library/CoreServices/RestoreVersion.plist"];

        if ([v83 fileExistsAtPath:v60])
        {
          uint64_t v21 = v53;
          ++v87;

          goto LABEL_28;
        }
        id v76 = [NSString alloc];
        v77 = [v48 summary];
        id v18 = v79;
        v78 = (void *)[v76 initWithFormat:@"AtomicEntry in locked set-status for secure grafted/mounted auto-asset where required content is missing (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@ | secureGraftedReqiredFilename:%@", v53, v79, v22, v77, v60];
        uint64_t v27 = +[MAAutoAssetError buildError:6108 fromOperation:v86 underlyingError:0 withDescription:v78];

        uint64_t v21 = v53;
        id v14 = v86;
LABEL_62:
        uint64_t v17 = v90;
        uint64_t v13 = a9;
        goto LABEL_63;
      }
      ++v88;
      uint64_t v21 = v53;
LABEL_28:

      ++v47;
      uint64_t v13 = a9;
      id v14 = v86;
      uint64_t v17 = v90;
      int v24 = v92;
    }
    while (v81 != v47);
    uint64_t v27 = 0;
    id v18 = v79;
    int v46 = a8;
    uint64_t v81 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
    if (v81) {
      continue;
    }
    break;
  }
LABEL_66:
  id v85 = v25;

  uint64_t v61 = v83;
LABEL_35:

  if (v27)
  {
    uint64_t v28 = v13;
    uint64_t v29 = v21;
    id v30 = v18;
    v25 = v85;
LABEL_37:
    int v63 = v24;
    if (close(v24))
    {
      int v93 = *__error();
      uint64_t v64 = [MEMORY[0x1E4FA56C8] sharedLogger];
      __int16 v65 = [v64 oslog];

      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544642;
        id v100 = v14;
        __int16 v101 = 1024;
        *(_DWORD *)v102 = v63;
        *(_WORD *)&v102[4] = 2114;
        *(void *)&v102[6] = v29;
        *(_WORD *)&v102[14] = 2112;
        id v18 = v30;
        *(void *)&v102[16] = v30;
        *(_WORD *)&v102[24] = 2114;
        *(void *)&v102[26] = v22;
        *(_WORD *)&v102[34] = 1024;
        *(_DWORD *)&v102[36] = v93;
        _os_log_error_impl(&dword_1B275B000, v65, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%@ | WARNING | failed close of shared lock file | atomicInstanceFilename:%{public}@ | errno:%d", buf, 0x36u);
        goto LABEL_43;
      }
LABEL_42:
      id v18 = v30;
    }
    else
    {
      v66 = [MEMORY[0x1E4FA56C8] sharedLogger];
      __int16 v65 = [v66 oslog];

      if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      *(_DWORD *)buf = 138544386;
      id v100 = v14;
      __int16 v101 = 1024;
      *(_DWORD *)v102 = v63;
      *(_WORD *)&v102[4] = 2114;
      *(void *)&v102[6] = v29;
      *(_WORD *)&v102[14] = 2112;
      id v18 = v30;
      *(void *)&v102[16] = v30;
      *(_WORD *)&v102[24] = 2114;
      *(void *)&v102[26] = v22;
      _os_log_impl(&dword_1B275B000, v65, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%@ | released sharedLockFileDescriptor | atomicInstanceFilename:%{public}@", buf, 0x30u);
    }
LABEL_43:

    int v92 = -1;
LABEL_44:
    uint64_t v21 = v29;
    goto LABEL_45;
  }
  int v92 = v24;
  BOOL v45 = v89;
  v25 = v85;
LABEL_46:
  if (v46) {
    id *v46 = v25;
  }
  if (v13) {
    id *v13 = v27;
  }
  if (v45 && !v27 && v25)
  {
    __int16 v67 = [MEMORY[0x1E4FA56C8] sharedLogger];
    v68 = [v67 oslog];

    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544642;
      id v100 = v14;
      __int16 v101 = 2114;
      *(void *)v102 = v22;
      *(_WORD *)&v102[8] = 2112;
      *(void *)&v102[10] = v21;
      *(_WORD *)&v102[18] = 2114;
      *(void *)&v102[20] = v18;
      *(_WORD *)&v102[28] = 2048;
      *(void *)&v102[30] = v88;
      *(_WORD *)&v102[38] = 2048;
      uint64_t v103 = v87;
      _os_log_impl(&dword_1B275B000, v68, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile} | successfully locked SHORT-TERM (%{public}@) | lockReason:%@ | atomicInstanceFilename:%{public}@ | standardURLs:%ld | secureURLs:%ld", buf, 0x3Eu);
    }
  }
  return v92;
}

void __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v1 = +[MAAutoAssetSet frameworkInstanceUUID];
  id v30 = [v1 UUIDString];

  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  BOOL v12 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
  id v14 = (void *)__maAutoAssetSetSharedClientProcessName;
  __maAutoAssetSetSharedClientProcessName = v13;

  __maAutoAssetSetSharedClientProcessID = getpid();
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:NEED_FOR_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:CHECK_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:LOCK_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:MAP_LOCKED_ATOMIC_ENTRY"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:FORM_SUB_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:CONTINUE_ATOMIC_LOCK"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:END_ATOMIC_LOCK"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:ASSET_SET_FOR_STAGING"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:CURRENT_SET_STATUS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:ELIMINATE_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):ALTER_ENTRIES_REPRESENTING_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):NEED_FOR_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):CHECK_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):LOCK_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):MAP_LOCKED_ATOMIC_ENTRY"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):FORM_SUB_ATOMIC"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):CONTINUE_ATOMIC_LOCK"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):END_ATOMIC_LOCK"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):END_ATOMIC_LOCKS_FOR_CLIENT"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):ASSET_SET_FOR_STAGING"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):CURRENT_SET_STATUS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):ELIMINATE_ATOMIC"];
  uint64_t v15 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v16 = [v15 oslog];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B275B000, v16, OS_LOG_TYPE_DEFAULT, "MA-auto-set{connectToServerFrameworkCompletion} set all the allowlisted classes for the client policy for all delegate callbacks", buf, 2u);
  }

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FA56A8]) initForServiceName:@"com.apple.mobileasset.autoasset" delegate:*(void *)(a1 + 32) clientID:v30];
  id v18 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = objc_opt_class();
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  id v20 = [v18 setWithArray:v19];
  [v17 setProxyObjectClasses:v20];

  uint64_t v21 = [objc_alloc(MEMORY[0x1E4FA56A0]) initWithClientPolicy:v17];
  id v22 = (void *)__maAutoAssetSetSharedConnectionClient;
  __maAutoAssetSetSharedConnectionClient = v21;

  if (__maAutoAssetSetSharedConnectionClient)
  {
    int v23 = [MEMORY[0x1E4FA56C8] sharedLogger];
    int v24 = [v23 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B275B000, v24, OS_LOG_TYPE_DEFAULT, "MA-auto-set{connectToServerFrameworkCompletion} connection client initialized for server connection", buf, 2u);
    }
  }
  else
  {
    uint64_t v25 = +[MAAutoAssetError buildError:6104 fromOperation:@"auto-set(connectToServerFrameworkCompletion)" underlyingError:0 withDescription:@"unable to create shared SUCoreConnectClient for the client process"];
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    uint64_t v28 = [MEMORY[0x1E4FA56C8] sharedLogger];
    int v24 = [v28 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke_cold_1();
    }
  }
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 reportingProgress:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  if (v19)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      id v20 = [(MAAutoAssetSet *)self assetSetIdentifier];
      [(MAAutoAssetSet *)self _failedCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v20 withErrorCode:6580 withResponseError:0 description:@"not supported for SHORT-TERM locker instance" completion:v19];
    }
    else
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke;
      v23[3] = &unk_1E6005C10;
      v23[4] = self;
      id v24 = v16;
      id v25 = v17;
      BOOL v30 = a5;
      id v26 = v15;
      int64_t v29 = a7;
      id v27 = v18;
      id v28 = v19;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v23];
    }
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:]();
    }
  }
}

- (void)endAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (![(MAAutoAssetSet *)self shortTermLocker])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_2;
      v15[3] = &unk_1E60041A8;
      v15[4] = self;
      id v16 = v9;
      id v17 = v8;
      id v18 = v10;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v15];

      goto LABEL_8;
    }
    uint64_t v11 = [(MAAutoAssetSet *)self _shortTermEndAtomicLockSync:v8 ofAtomicInstance:v9];
    BOOL v12 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke;
    block[3] = &unk_1E60056A8;
    id v20 = v11;
    id v21 = v10;
    block[4] = self;
    uint64_t v13 = v11;
    dispatch_async(v12, block);
  }
  else
  {
    id v14 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v13 = [v14 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet endAtomicLock:ofAtomicInstance:completion:]();
    }
  }

LABEL_8:
}

- (id)lockAtomicSyncWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = @"auto-set(lockAtomicSync:fast)";
  if (v7) {
    BOOL v12 = @"auto-set(lockAtomicSync)";
  }
  uint64_t v13 = v12;
  if (![(MAAutoAssetSet *)self shortTermLocker])
  {
    id v15 = +[MAAutoAssetError buildError:6581 fromOperation:v13 underlyingError:0 withDescription:@"restricted to SHORT-TERM locker instance"];
    id v14 = 0;
    if (!a6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v17 = 0;
  id v14 = [(MAAutoAssetSet *)self _shortTermLockAtomicSync:v10 forAtomicInstance:v11 performContentValidation:v7 error:&v17];
  id v15 = v17;
  if (a6) {
LABEL_7:
  }
    *a6 = v15;
LABEL_8:

  return v14;
}

- (BOOL)shortTermLocker
{
  return self->_shortTermLocker;
}

- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__8;
  id v34 = __Block_byref_object_dispose__8;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__8;
  id v28 = __Block_byref_object_dispose__8;
  id v29 = 0;
  BOOL v12 = __maAutoAssetSetShortTermLockerDispatchQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__MAAutoAssetSet__shortTermLockAtomicSync_forAtomicInstance_performContentValidation_error___block_invoke;
  v17[3] = &unk_1E6005DC8;
  id v13 = v11;
  id v18 = v13;
  id v19 = self;
  id v14 = v10;
  BOOL v23 = a5;
  id v20 = v14;
  id v21 = &v30;
  id v22 = &v24;
  dispatch_sync(v12, v17);
  if (a6) {
    *a6 = (id) v25[5];
  }
  id v15 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (id)_shortTermEndAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__8;
  id v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  id v8 = __maAutoAssetSetShortTermLockerDispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke;
  v13[3] = &unk_1E6005DF0;
  id v14 = v7;
  id v15 = v6;
  id v16 = self;
  id v17 = &v18;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v13);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)connectToServerFrameworkCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke;
  v5[3] = &unk_1E6005608;
  v5[4] = self;
  v5[5] = &v6;
  if (__maAutoAssetSetSharedDispatchOnce != -1) {
    dispatch_once(&__maAutoAssetSetSharedDispatchOnce, v5);
  }
  v4[2](v4, v7[5]);
  _Block_object_dispose(&v6, 8);
}

- (id)_newProxyObjectForSetProgressBlock:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3042000000;
  v15[3] = __Block_byref_object_copy__747;
  v15[4] = __Block_byref_object_dispose__748;
  objc_initWeak(&v16, self);
  id v5 = objc_alloc(MEMORY[0x1E4FA56B0]);
  uint64_t v6 = +[MAAutoAssetSet frameworkInstanceUUID];
  id v7 = [v6 UUIDString];
  uint64_t v8 = +[MAAutoAssetSet frameworkDispatchQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke;
  v12[3] = &unk_1E6005E90;
  id v14 = v15;
  id v9 = v4;
  id v13 = v9;
  id v10 = (void *)[v5 initWithClientID:v7 completionQueue:v8 genericBlock:v12];

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v10;
}

void __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v24 = [MAAutoAssetSetInfoInstance alloc];
    uint64_t v6 = [*(id *)(a1 + 32) clientDomainName];
    id v7 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v8 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v9 = __maAutoAssetSetSharedClientProcessID;
    id v10 = [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v11 = *(void *)(a1 + 40);
    BOOL v12 = [*(id *)(a1 + 32) autoAssetEntries];
    id v13 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v14 = [(MAAutoAssetSetInfoInstance *)v24 initUsingClientDomain:v6 forClientName:v7 withProcessName:v8 withProcessID:v9 forAssetSetIdentifier:v10 forAtomicInstance:v11 comprisedOfEntries:v12 asEntriesWhenTargeting:0 associatingFrameworkUUID:v13];

    id v15 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:*(void *)(a1 + 48) reasonDesired:*(void *)(a1 + 56) awaitingDownloadOfDiscovered:*(unsigned __int8 *)(a1 + 88) withCheckWaitTimeout:*(void *)(a1 + 80) withLockWaitTimeout:-101 desiringProgress:*(void *)(a1 + 64) != 0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = +[MAAutoAssetSet frameworkInstanceUUID];
    uint64_t v18 = [v17 UUIDString];

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:CHECK_ATOMIC" clientID:v18 version:0 message:v16];
    uint64_t v20 = (void *)[*(id *)(a1 + 32) _newProxyObjectForSetProgressBlock:*(void *)(a1 + 64)];
    id v21 = (void *)__maAutoAssetSetSharedConnectionClient;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2;
    v25[3] = &unk_1E6005540;
    uint64_t v22 = *(void *)(a1 + 32);
    id v26 = v20;
    uint64_t v27 = v22;
    id v28 = *(id *)(a1 + 72);
    id v23 = v20;
    [v21 connectClientSendServerMessage:v19 proxyObject:v23 withReply:v25];
  }
}

- (NSString)autoAssetSetClientName
{
  return self->_autoAssetSetClientName;
}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_setFrameworkUUIDOnce != -1) {
    dispatch_once(&frameworkInstanceUUID_setFrameworkUUIDOnce, &__block_literal_global_774);
  }
  id v2 = (void *)frameworkInstanceUUID_setFrameworkUUID;
  return v2;
}

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_setFrameworkQueueOnce != -1) {
    dispatch_once(&frameworkDispatchQueue_setFrameworkQueueOnce, &__block_literal_global_772);
  }
  id v2 = (void *)frameworkDispatchQueue_setFrameworkQueue;
  return v2;
}

uint64_t __63__MAAutoAssetSet__readLockedSetStatusFromSharedLockFile_error___block_invoke()
{
  _readLockedSetStatusFromSharedLockFile_error__recordArray = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return MEMORY[0x1F41817F8]();
}

- (id)_readLockedSetStatusFromSharedLockFile:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_superclass = MAAutoAssetSelector.superclass;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  if (_readLockedSetStatusFromSharedLockFile_error__readSetStatusSetupDispatchOnce != -1) {
    dispatch_once(&_readLockedSetStatusFromSharedLockFile_error__readSetStatusSetupDispatchOnce, &__block_literal_global_607);
  }
  id v7 = v5;
  uint64_t v8 = MAAutoAssetSelector.superclass;
  if (realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], v49))
  {
    uint64_t v9 = [NSString stringWithUTF8String:v49];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v10 = (id)_readLockedSetStatusFromSharedLockFile_error__recordArray;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
        id v16 = [v15 lockerFileRealPath];
        int v17 = [v16 isEqualToString:v9];

        if (v17) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v12) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      if ([v15 isCurrentlyValid])
      {
        id v19 = [v15 setStatus];

        id v18 = 0;
        uint64_t v20 = 0;
        id v21 = 0;
        id v22 = 0;
        goto LABEL_43;
      }
      id v18 = v15;
      id v25 = [MEMORY[0x1E4FA56C8] sharedLogger];
      id v26 = [v25 oslog];

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v7;
        _os_log_impl(&dword_1B275B000, v26, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] _readLockedSetStatusFromSharedLockFile: In memory record for lock file(%@) not valid. Discarding", buf, 0xCu);
      }

      uint64_t v8 = MAAutoAssetSelector.superclass;
      p_superclass = MAAutoAssetSelector.superclass;
      if (v18) {
        [(id)_readLockedSetStatusFromSharedLockFile_error__recordArray removeObject:v18];
      }
    }
    else
    {
LABEL_12:

      id v18 = 0;
      uint64_t v8 = (__objc2_class **)(MAAutoAssetSelector + 8);
      p_superclass = (__objc2_class **)(MAAutoAssetSelector + 8);
    }
  }
  else
  {
    id v23 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v24 = [v23 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v7;
      _os_log_impl(&dword_1B275B000, v24, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] _readLockedSetStatusFromSharedLockFile: Failed to determine realpath for %@. Skipping caching", buf, 0xCu);
    }

    uint64_t v9 = 0;
    id v18 = 0;
  }
  id v27 = objc_alloc(MEMORY[0x1E4FA56D0]);
  char v28 = objc_opt_respondsToSelector();

  id v29 = objc_alloc(MEMORY[0x1E4FA56D0]);
  uint64_t v30 = p_superclass[74];
  if (v28) {
    uint64_t v31 = (void *)[v29 initWithDispatchQueue:v30 withPersistencePath:v7 forPolicyVersion:@"1.0" issuingDefaultLevelLogging:0];
  }
  else {
    uint64_t v31 = (void *)[v29 initWithDispatchQueue:v30 withPersistencePath:v7 forPolicyVersion:@"1.0"];
  }
  uint64_t v20 = v31;
  if (!v31)
  {
    uint64_t v34 = [[NSString alloc] initWithFormat:@"Unable to create persisted-state for shared lock file | sharedLockFilename:%@", v7];
    goto LABEL_33;
  }
  if (![v31 loadPersistedState])
  {
    uint64_t v34 = [[NSString alloc] initWithFormat:@"Unable to load persisted-state for shared lock file | sharedLockFilename:%@", v7];
    goto LABEL_33;
  }
  uint64_t v32 = [v20 secureCodedObjectForKey:@"sharedLockSetStatus" ofClass:objc_opt_class()];
  if (!v32)
  {
    uint64_t v34 = [[NSString alloc] initWithFormat:@"Unable to read set-status from persisted-state for shared lock file | sharedLockFilename:%@", v7];
LABEL_33:
    id v35 = (void *)v34;
    id v21 = +[MAAutoAssetError buildError:6101 fromOperation:@"auto-set(_readLockedSetStatusFromSharedLockFile)" underlyingError:0 withDescription:v34];

    uint64_t v33 = 0;
    if (!a4) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  uint64_t v33 = (void *)v32;
  id v21 = 0;
  if (a4) {
LABEL_34:
  }
    *a4 = v21;
LABEL_35:
  if (v33 && v9)
  {
    if ((unint64_t)[(__objc2_class *)v8[70] count] >= 7) {
      [(__objc2_class *)v8[70] removeObjectAtIndex:0];
    }
    id v36 = [[MAAutoAssetSetShortTermLockInMemoryRecord alloc] initWithPathAndSetStatus:v9 setStatus:v33];
    [(__objc2_class *)v8[70] addObject:v36];
    uint64_t v37 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v38 = [v37 oslog];

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v45 = v7;
      __int16 v46 = 2112;
      uint64_t v47 = v9;
      _os_log_impl(&dword_1B275B000, v38, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] _readLockedSetStatusFromSharedLockFile: Updating in memory record for lockerFile:'%@' realPath:'%@'", buf, 0x16u);
    }
  }
  id v22 = v33;
  id v19 = v22;
LABEL_43:

  return v19;
}

uint64_t __39__MAAutoAssetSet_frameworkInstanceUUID__block_invoke()
{
  frameworkInstanceUUID_setFrameworkUUID = (uint64_t)objc_alloc_init(MEMORY[0x1E4F29128]);
  return MEMORY[0x1F41817F8]();
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[MAAutoAssetSet defaultDispatchQueue];
  id v17 = [(MAAutoAssetSet *)self initUsingClientDomain:v15 forClientName:v14 forAssetSetIdentifier:v13 asShortTermLocker:0 comprisedOfEntries:v12 usingDesiredPolicyCategory:0 completingFromQueue:v16 error:a7];

  return v17;
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = +[MAAutoAssetSet defaultDispatchQueue];
  id v20 = [(MAAutoAssetSet *)self initUsingClientDomain:v18 forClientName:v17 forAssetSetIdentifier:v16 asShortTermLocker:0 comprisedOfEntries:v15 usingDesiredPolicyCategory:v14 completingFromQueue:v19 error:a8];

  return v20;
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 completingFromQueue:(id)a8 error:(id *)a9
{
  return [(MAAutoAssetSet *)self initUsingClientDomain:a3 forClientName:a4 forAssetSetIdentifier:a5 asShortTermLocker:0 comprisedOfEntries:a6 usingDesiredPolicyCategory:a7 completingFromQueue:a8 error:a9];
}

- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[MAAutoAssetSet defaultDispatchQueue];
  id v11 = [(MAAutoAssetSet *)self initUsingClientDomain:v9 forClientName:@"SHORT_TERM_LOCKER" forAssetSetIdentifier:v8 asShortTermLocker:1 comprisedOfEntries:0 usingDesiredPolicyCategory:0 completingFromQueue:v10 error:a5];

  return v11;
}

- (MAAutoAssetSet)initWithCoder:(id)a3
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetSet;
  id v5 = [(MAAutoAssetSet *)&v20 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAssetSetClientName"];
    autoAssetSetClientName = v5->_autoAssetSetClientName;
    v5->_autoAssetSetClientName = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v13;

    v5->_shortTermLocker = [v4 decodeBoolForKey:@"shortTermLocker"];
    uint64_t v15 = [v4 decodeObjectOfClasses:v8 forKey:@"autoAssetEntries"];
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateCategoryDesiredByClient"];
    updateCategoryDesiredByClient = v5->_updateCategoryDesiredByClient;
    v5->_updateCategoryDesiredByClient = (NSString *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MAAutoAssetSet *)self clientDomainName];
  [v4 encodeObject:v5 forKey:@"clientDomainName"];

  uint64_t v6 = [(MAAutoAssetSet *)self autoAssetSetClientName];
  [v4 encodeObject:v6 forKey:@"autoAssetSetClientName"];

  id v7 = [(MAAutoAssetSet *)self assetSetIdentifier];
  [v4 encodeObject:v7 forKey:@"assetSetIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"), @"shortTermLocker");
  id v8 = [(MAAutoAssetSet *)self autoAssetEntries];
  [v4 encodeObject:v8 forKey:@"autoAssetEntries"];

  id v9 = [(MAAutoAssetSet *)self updateCategoryDesiredByClient];
  [v4 encodeObject:v9 forKey:@"updateCategoryDesiredByClient"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 completion:(id)a5
{
}

- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      id v14 = [(MAAutoAssetSet *)self assetSetIdentifier];
      [(MAAutoAssetSet *)self _failedOperation:@"alterEntriesRepresentingAtomic" forAssetSetIdentifier:v14 withErrorCode:6580 withResponseError:0 description:@"not supported for SHORT-TERM locker instance" completion:v13];
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke;
      v17[3] = &unk_1E6005BC0;
      void v17[4] = self;
      id v18 = v11;
      id v19 = v12;
      id v20 = v10;
      id v21 = v13;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v17];
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:]();
    }
  }
}

void __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedOperation:@"alterEntriesRepresentingAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v6 = [MAAutoAssetSetInfoInstance alloc];
    id v7 = [*(id *)(a1 + 32) clientDomainName];
    id v8 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    id v11 = [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v14 = [(MAAutoAssetSetInfoInstance *)v6 initUsingClientDomain:v7 forClientName:v8 withProcessName:v9 withProcessID:v10 forAssetSetIdentifier:v11 forAtomicInstance:0 comprisedOfEntries:v12 asEntriesWhenTargeting:0 associatingFrameworkUUID:v13];

    id v15 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:*(void *)(a1 + 48) reasonDesired:*(void *)(a1 + 56) awaitingDownloadOfDiscovered:0 withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v18 = [v17 UUIDString];

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke_2;
    v21[3] = &unk_1E6004158;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 64);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [v6 assetSetIdentifier];
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0;
      id v12 = v5;
    }
    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104;
      id v12 = 0;
    }
    [v9 _failedOperation:@"alterEntriesRepresentingAtomic" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successOperation:@"alterEntriesRepresentingAtomic" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4
{
  return [(MAAutoAssetSet *)self alterEntriesRepresentingAtomicSync:a3 toBeComprisedOfEntries:a4 withNeedPolicy:0];
}

- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__8;
  v33[4] = __Block_byref_object_dispose__8;
  id v34 = 0;
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__8;
  uint64_t v31 = __Block_byref_object_dispose__8;
  id v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke;
  v17[3] = &unk_1E6005BE8;
  id v19 = v23;
  id v20 = v33;
  id v21 = &v27;
  id v22 = v25;
  id v12 = v11;
  id v18 = v12;
  [(MAAutoAssetSet *)self alterEntriesRepresentingAtomic:v8 toBeComprisedOfEntries:v9 withNeedPolicy:v10 completion:v17];
  if (+[MAAutoAssetSet waitOnSemaphore:v12 withDaemonTriggeredTimeout:-100])
  {
    id v13 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_3;
    block[3] = &unk_1E60053D8;
    block[4] = v25;
    void block[5] = v23;
    block[6] = v33;
    block[7] = &v27;
    dispatch_sync(v13, block);
  }
  id v14 = (id)v28[5];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v33, 8);
  return v14;
}

void __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    id v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(alterEntriesRepresentingAtomicSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for alter-entries-representing-atomic to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)needForAtomic:(id)a3 completion:(id)a4
{
}

- (void)needForAtomic:(id)a3 withNeedPolicy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      long long v11 = [(MAAutoAssetSet *)self assetSetIdentifier];
      [(MAAutoAssetSet *)self _failedOperation:@"needForAtomic" forAssetSetIdentifier:v11 withErrorCode:6580 withResponseError:0 description:@"not supported for SHORT-TERM locker instance" completion:v10];
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke;
      v14[3] = &unk_1E60041A8;
      v14[4] = self;
      id v15 = v9;
      id v16 = v8;
      id v17 = v10;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v14];
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v13 = [v12 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet needForAtomic:withNeedPolicy:completion:]();
    }
  }
}

void __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedOperation:@"needForAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = [MAAutoAssetSetInfoInstance alloc];
    id v7 = [*(id *)(a1 + 32) clientDomainName];
    id v8 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    long long v11 = [*(id *)(a1 + 32) assetSetIdentifier];
    id v12 = [*(id *)(a1 + 32) autoAssetEntries];
    id v13 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v14 = [(MAAutoAssetSetInfoInstance *)v6 initUsingClientDomain:v7 forClientName:v8 withProcessName:v9 withProcessID:v10 forAssetSetIdentifier:v11 forAtomicInstance:0 comprisedOfEntries:v12 asEntriesWhenTargeting:0 associatingFrameworkUUID:v13];

    id v15 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:*(void *)(a1 + 40) reasonDesired:*(void *)(a1 + 48) awaitingDownloadOfDiscovered:0 withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v18 = [v17 UUIDString];

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:NEED_FOR_ATOMIC" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke_2;
    v21[3] = &unk_1E6004158;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 56);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 assetSetIdentifier];
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0;
      id v12 = v5;
    }
    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104;
      id v12 = 0;
    }
    [v9 _failedOperation:@"needForAtomic" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successOperation:@"needForAtomic" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)needForAtomicSync:(id)a3
{
  return [(MAAutoAssetSet *)self needForAtomicSync:a3 withNeedPolicy:0];
}

- (id)needForAtomicSync:(id)a3 withNeedPolicy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__8;
  v30[4] = __Block_byref_object_dispose__8;
  id v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__8;
  char v28 = __Block_byref_object_dispose__8;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke;
  v14[3] = &unk_1E6005BE8;
  id v16 = v20;
  id v17 = v30;
  id v18 = &v24;
  id v19 = v22;
  uint64_t v9 = v8;
  id v15 = v9;
  [(MAAutoAssetSet *)self needForAtomic:v6 withNeedPolicy:v7 completion:v14];
  if (+[MAAutoAssetSet waitOnSemaphore:v9 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v10 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v22;
    void block[5] = v20;
    block[6] = v30;
    block[7] = &v24;
    dispatch_sync(v10, block);
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);
  return v11;
}

void __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(needForAtomicSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for need-for-atomic to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 completion:(id)a7
{
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8
{
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7
{
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 completion:(id)a8
{
}

void __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  if (!v24 || v5)
  {
    long long v15 = *(void **)(a1 + 40);
    id v7 = [v15 assetSetIdentifier];
    if (v5)
    {
      long long v16 = @"failure reported by server";
      uint64_t v17 = v15;
      id v18 = v7;
      uint64_t v19 = 0;
      id v20 = v5;
    }
    else
    {
      long long v16 = @"no response message from server";
      uint64_t v17 = v15;
      id v18 = v7;
      uint64_t v19 = 6104;
      id v20 = 0;
    }
    [v17 _failedCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v18 withErrorCode:v19 withResponseError:v20 description:v16 completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = [v24 message];
    id v7 = [v6 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];

    if (v7)
    {
      id v8 = [v7 currentSetStatus];
      id v9 = [v8 newerVersionError];

      id v10 = *(void **)(a1 + 40);
      long long v11 = [v10 assetSetIdentifier];
      id v12 = [v7 currentSetStatus];
      id v13 = v12;
      if (v9)
      {
        id v14 = [v12 newerVersionError];
        [v10 _failedCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v11 withErrorCode:0 withResponseError:v14 description:@"found-information indicated error" completion:*(void *)(a1 + 48)];
      }
      else
      {
        id v14 = [v12 newerAtomicInstanceDiscovered];
        id v22 = [v7 currentSetStatus];
        char v23 = [v22 newerDiscoveredAtomicEntries];
        [v10 _successCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v11 newerInstanceDiscovered:v14 discoveredAtomicEntries:v23 completion:*(void *)(a1 + 48)];
      }
    }
    else
    {
      char v21 = *(void **)(a1 + 40);
      long long v11 = [v21 assetSetIdentifier];
      [v21 _failedCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v11 withErrorCode:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 discoveredAtomicEntries:(id *)a6 error:(id *)a7
{
  return [(MAAutoAssetSet *)self checkAtomicSync:a3 forAtomicInstance:a4 awaitingDownload:0 withNeedPolicy:0 withTimeout:a5 discoveredAtomicEntries:a6 error:a7 reportingProgress:0];
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8
{
  return [(MAAutoAssetSet *)self checkAtomicSync:a3 forAtomicInstance:a4 awaitingDownload:a5 withNeedPolicy:0 withTimeout:a6 discoveredAtomicEntries:a7 error:a8 reportingProgress:0];
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9
{
  return [(MAAutoAssetSet *)self checkAtomicSync:a3 forAtomicInstance:a4 awaitingDownload:a5 withNeedPolicy:0 withTimeout:a6 discoveredAtomicEntries:a7 error:a8 reportingProgress:a9];
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8
{
  return [(MAAutoAssetSet *)self checkAtomicSync:a3 forAtomicInstance:a4 awaitingDownload:0 withNeedPolicy:a5 withTimeout:a6 discoveredAtomicEntries:a7 error:a8 reportingProgress:0];
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9
{
  return [(MAAutoAssetSet *)self checkAtomicSync:a3 forAtomicInstance:a4 awaitingDownload:a5 withNeedPolicy:a6 withTimeout:a7 discoveredAtomicEntries:a8 error:a9 reportingProgress:0];
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9 reportingProgress:(id)a10
{
  BOOL v24 = a5;
  id v22 = a3;
  id v12 = a4;
  id v13 = a6;
  id v21 = a10;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__8;
  v58[4] = __Block_byref_object_dispose__8;
  id v59 = 0;
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__8;
  id v56 = __Block_byref_object_dispose__8;
  id v57 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__8;
  uint64_t v50 = __Block_byref_object_dispose__8;
  id v51 = 0;
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x3032000000;
  long long v43 = __Block_byref_object_copy__8;
  uint64_t v44 = __Block_byref_object_dispose__8;
  id v45 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke;
  v27[3] = &unk_1E6005C60;
  uint64_t v30 = v36;
  id v31 = v58;
  id v15 = v12;
  id v28 = v15;
  id v32 = &v52;
  uint64_t v33 = &v46;
  id v34 = &v40;
  id v35 = v38;
  long long v16 = v14;
  id v29 = v16;
  [(MAAutoAssetSet *)self checkAtomic:v22 forAtomicInstance:v15 awaitingDownload:v24 withNeedPolicy:v13 withTimeout:a7 reportingProgress:v21 completion:v27];
  if (+[MAAutoAssetSet waitOnSemaphore:v16 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v17 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_3;
    block[3] = &unk_1E6005C88;
    void block[4] = v38;
    void block[5] = v36;
    block[6] = v58;
    block[7] = &v52;
    void block[8] = &v46;
    block[9] = &v40;
    dispatch_sync(v17, block);
  }
  if (a8) {
    *a8 = (id) v47[5];
  }
  if (a9) {
    *a9 = (id) v41[5];
  }
  id v18 = (id)v53[5];

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(v58, 8);
  return v18;
}

void __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_2;
  block[3] = &unk_1E6005C38;
  long long v21 = *(_OWORD *)(a1 + 48);
  id v16 = *(id *)(a1 + 32);
  id v17 = v7;
  long long v11 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 64);
  long long v23 = v11;
  id v18 = v8;
  id v19 = v9;
  id v20 = *(id *)(a1 + 40);
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_sync(v10, block);
}

intptr_t __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 72) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 80) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 96) + 8) + 40), *(id *)(v1 + 48));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 104) + 8) + 40), *(id *)(v1 + 56));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 112) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 64);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    uint64_t v4 = *(void *)(v1[7] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    uint64_t v6 = *(void *)(v1[8] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    *(void *)(*(void *)(v1[9] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(checkAtomicSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for check-atomic to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7
{
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      id v19 = [(MAAutoAssetSet *)self assetSetIdentifier];
      [(MAAutoAssetSet *)self _failedLockAtomic:@"lockAtomic" forAssetSetIdentifier:v19 withErrorCode:6580 withResponseError:0 description:@"not supported for SHORT-TERM locker instance" completion:v18];
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke;
      void v22[3] = &unk_1E6005CB0;
      v22[4] = self;
      id v23 = v15;
      id v24 = v16;
      id v25 = v14;
      int64_t v28 = a6;
      id v26 = v17;
      id v27 = v18;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v22];
    }
  }
  else
  {
    id v20 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v21 = [v20 oslog];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:]();
    }
  }
}

void __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedLockAtomic:@"lockAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 72)];
  }
  else
  {
    id v24 = [MAAutoAssetSetInfoInstance alloc];
    uint64_t v6 = [*(id *)(a1 + 32) clientDomainName];
    id v7 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v8 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v9 = __maAutoAssetSetSharedClientProcessID;
    id v10 = [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) autoAssetEntries];
    id v13 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v14 = [(MAAutoAssetSetInfoInstance *)v24 initUsingClientDomain:v6 forClientName:v7 withProcessName:v8 withProcessID:v9 forAssetSetIdentifier:v10 forAtomicInstance:v11 comprisedOfEntries:v12 asEntriesWhenTargeting:0 associatingFrameworkUUID:v13];

    id v15 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:*(void *)(a1 + 48) reasonDesired:*(void *)(a1 + 56) awaitingDownloadOfDiscovered:1 withCheckWaitTimeout:-101 withLockWaitTimeout:*(void *)(a1 + 80) desiringProgress:*(void *)(a1 + 64) != 0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v18 = [v17 UUIDString];

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:LOCK_ATOMIC" clientID:v18 version:0 message:v16];
    id v20 = (void *)[*(id *)(a1 + 32) _newProxyObjectForSetProgressBlock:*(void *)(a1 + 64)];
    long long v21 = (void *)__maAutoAssetSetSharedConnectionClient;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2;
    void v25[3] = &unk_1E6005540;
    uint64_t v22 = *(void *)(a1 + 32);
    id v26 = v20;
    uint64_t v27 = v22;
    id v28 = *(id *)(a1 + 72);
    id v23 = v20;
    [v21 connectClientSendServerMessage:v19 proxyObject:v23 withReply:v25];
  }
}

void __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if (!v30 || v5)
  {
    id v19 = *(void **)(a1 + 40);
    id v7 = [v19 assetSetIdentifier];
    if (v5)
    {
      id v20 = @"failure reported by server";
      long long v21 = v19;
      uint64_t v22 = v7;
      uint64_t v23 = 0;
      id v24 = v5;
    }
    else
    {
      id v20 = @"no response message from server";
      long long v21 = v19;
      uint64_t v22 = v7;
      uint64_t v23 = 6104;
      id v24 = 0;
    }
    [v21 _failedLockAtomic:@"lockAtomic" forAssetSetIdentifier:v22 withErrorCode:v23 withResponseError:v24 description:v20 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v6 = [v30 message];
    id v7 = [v6 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];

    uint64_t v8 = [v30 message];
    uint64_t v9 = [v8 safeStringForKey:@"sandboxExtensionKey"];

    id v10 = [v30 message];
    uint64_t v11 = [v10 safeStringForKey:@"sandboxExtensionPathKey"];

    if (v7)
    {
      id v12 = [v7 currentSetStatus];
      id v13 = [v12 availableForUseError];

      id v14 = *(void **)(a1 + 40);
      id v15 = [v14 assetSetIdentifier];
      id v16 = [v7 currentSetStatus];
      id v17 = v16;
      if (v13)
      {
        id v18 = [v16 availableForUseError];
        [v14 _failedLockAtomic:@"lockAtomic" forAssetSetIdentifier:v15 withErrorCode:0 withResponseError:v18 description:@"found-information indicated error" completion:*(void *)(a1 + 48)];
      }
      else
      {
        id v29 = [v16 latestDownloadedAtomicInstance];
        [v7 currentSetStatus];
        v27 = id v26 = v9;
        id v28 = [v27 latestDowloadedAtomicInstanceEntries];
        [v14 _successLockAtomic:@"lockAtomic" forAssetSetIdentifier:v15 lockedAtomicInstance:v29 lockedAtomicEntries:v28 sandboxExtension:v26 sandboxExtensionPath:v11 completion:*(void *)(a1 + 48)];

        uint64_t v9 = v26;
      }
    }
    else
    {
      id v25 = *(void **)(a1 + 40);
      id v15 = [v25 assetSetIdentifier];
      [v25 _failedLockAtomic:@"lockAtomic" forAssetSetIdentifier:v15 withErrorCode:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7
{
  return [(MAAutoAssetSet *)self lockAtomicSync:a3 forAtomicInstance:a4 withNeedPolicy:0 withTimeout:a5 lockedAtomicEntries:a6 error:a7 reportingProgress:0];
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8
{
  return [(MAAutoAssetSet *)self lockAtomicSync:a3 forAtomicInstance:a4 withNeedPolicy:a5 withTimeout:a6 lockedAtomicEntries:a7 error:a8 reportingProgress:0];
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  return [(MAAutoAssetSet *)self lockAtomicSync:a3 forAtomicInstance:a4 withNeedPolicy:0 withTimeout:a5 lockedAtomicEntries:a6 error:a7 reportingProgress:a8];
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a9;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = __Block_byref_object_copy__8;
  uint64_t v54 = __Block_byref_object_dispose__8;
  id v55 = 0;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__8;
  uint64_t v48 = __Block_byref_object_dispose__8;
  id v49 = 0;
  uint64_t v38 = 0;
  char v39 = &v38;
  uint64_t v40 = 0x3032000000;
  long long v41 = __Block_byref_object_copy__8;
  uint64_t v42 = __Block_byref_object_dispose__8;
  id v43 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke;
  v27[3] = &unk_1E6005CD8;
  id v29 = v34;
  id v30 = &v50;
  id v17 = v14;
  id v31 = &v44;
  id v32 = &v38;
  id v18 = v12;
  uint64_t v33 = v36;
  id v19 = v16;
  id v28 = v19;
  [(MAAutoAssetSet *)self lockAtomic:v12 forAtomicInstance:v13 withNeedPolicy:v14 withTimeout:a6 reportingProgress:v15 completion:v27];
  if (+[MAAutoAssetSet waitOnSemaphore:v19 withDaemonTriggeredTimeout:-100])
  {
    id v20 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_3;
    block[3] = &unk_1E6005810;
    void block[4] = v36;
    void block[5] = v34;
    block[6] = &v50;
    block[7] = &v44;
    void block[8] = &v38;
    dispatch_sync(v20, block);
  }
  if (a7) {
    *a7 = (id) v45[5];
  }
  if (a8) {
    *a8 = (id) v39[5];
  }
  id v21 = (id)v51[5];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v21;
}

void __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke(_OWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v16 = a1[2];
  long long v11 = a1[4];
  long long v22 = a1[3];
  long long v23 = v11;
  block[2] = __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_2;
  block[3] = &unk_1E60054A0;
  id v18 = v7;
  id v19 = v8;
  id v20 = v9;
  id v12 = (id)v16;
  long long v21 = v16;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_sync(v10, block);
}

intptr_t __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8) + 40), *(id *)(v1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 96) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 56);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    uint64_t v4 = *(void *)(v1[7] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    *(void *)(*(void *)(v1[8] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(lockAtomicSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for lock-atomic to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)mapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      id v14 = [(MAAutoAssetSet *)self assetSetIdentifier];
      [(MAAutoAssetSet *)self _failedMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAssetSetIdentifier:v14 withErrorCode:6580 withResponseError:0 description:@"not supported for SHORT-TERM locker instance" completion:v13];
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke;
      v17[3] = &unk_1E6005BC0;
      id v18 = v12;
      id v19 = self;
      id v20 = v11;
      id v21 = v10;
      id v22 = v13;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v17];
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:]();
    }
  }
}

void __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 64)];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = [MAAutoAssetSetEntry alloc];
    id v8 = [*(id *)(a1 + 32) assetType];
    id v9 = [*(id *)(a1 + 32) assetSpecifier];
    id v10 = [*(id *)(a1 + 32) assetVersion];
    id v27 = [(MAAutoAssetSetEntry *)v7 initForAssetType:v8 withAssetSpecifier:v9 matchingAssetVersion:v10];

    id v11 = v6;
    [v6 addObject:v27];
    id v12 = [MAAutoAssetSetInfoInstance alloc];
    id v13 = [*(id *)(a1 + 40) clientDomainName];
    id v14 = [*(id *)(a1 + 40) autoAssetSetClientName];
    uint64_t v15 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v16 = __maAutoAssetSetSharedClientProcessID;
    id v17 = [*(id *)(a1 + 40) assetSetIdentifier];
    uint64_t v18 = *(void *)(a1 + 48);
    id v19 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v20 = [(MAAutoAssetSetInfoInstance *)v12 initUsingClientDomain:v13 forClientName:v14 withProcessName:v15 withProcessID:v16 forAssetSetIdentifier:v17 forAtomicInstance:v18 comprisedOfEntries:v11 asEntriesWhenTargeting:0 associatingFrameworkUUID:v19];

    id v21 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:0 reasonDesired:*(void *)(a1 + 56) awaitingDownloadOfDiscovered:0 withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v23 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v24 = [v23 UUIDString];

    [v22 setSafeObject:v20 forKey:@"setInstance"];
    [v22 setSafeObject:v21 forKey:@"setDesire"];
    id v25 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:MAP_LOCKED_ATOMIC_ENTRY" clientID:v24 version:0 message:v22];
    id v26 = (void *)__maAutoAssetSetSharedConnectionClient;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke_2;
    v28[3] = &unk_1E6005D00;
    v28[4] = *(void *)(a1 + 40);
    id v31 = *(id *)(a1 + 64);
    id v29 = *(id *)(a1 + 32);
    id v30 = *(id *)(a1 + 48);
    [v26 connectClientSendServerMessage:v25 proxyObject:0 withReply:v28];

    id v3 = 0;
  }
}

void __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v28 = a1;
    id v29 = *(void **)(a1 + 32);
    id v9 = [v29 assetSetIdentifier];
    if (v7)
    {
      id v30 = @"failure reported by server";
      id v31 = v29;
      id v32 = v9;
      uint64_t v33 = 0;
      id v34 = v7;
    }
    else
    {
      id v30 = @"no response message from server";
      id v31 = v29;
      id v32 = v9;
      uint64_t v33 = 6104;
      id v34 = 0;
    }
    [v31 _failedMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAssetSetIdentifier:v32 withErrorCode:v33 withResponseError:v34 description:v30 completion:*(void *)(v28 + 56)];
    goto LABEL_25;
  }
  uint64_t v44 = a1;
  id v8 = [v5 message];
  id v9 = [v8 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];

  if (!v9)
  {
    char v35 = *(void **)(v44 + 32);
    id v36 = [v35 assetSetIdentifier];
    [v35 _failedMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAssetSetIdentifier:v36 withErrorCode:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(v44 + 56)];

    goto LABEL_25;
  }
  id v40 = v5;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  char v39 = v9;
  id v10 = [v9 currentSetStatus];
  id v11 = [v10 latestDowloadedAtomicInstanceEntries];

  obuint64_t j = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
  uint64_t v13 = v44;
  if (!v12)
  {
LABEL_15:

    goto LABEL_23;
  }
  uint64_t v14 = v12;
  uint64_t v15 = *(void *)v46;
  unint64_t v16 = 0x1E4FA5000uLL;
  uint64_t v41 = *(void *)v46;
LABEL_6:
  uint64_t v17 = 0;
  uint64_t v42 = v14;
  while (1)
  {
    if (*(void *)v46 != v15) {
      objc_enumerationMutation(obj);
    }
    uint64_t v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
    id v19 = *(void **)(v16 + 1728);
    id v20 = [v18 fullAssetSelector];
    id v21 = [v20 assetType];
    id v22 = [*(id *)(v13 + 40) assetType];
    if (([v19 stringIsEqual:v21 to:v22] & 1) == 0)
    {

      goto LABEL_13;
    }
    long long v23 = *(void **)(v16 + 1728);
    id v24 = [v18 fullAssetSelector];
    [v24 assetSpecifier];
    id v26 = v25 = v16;
    id v27 = [*(id *)(v13 + 40) assetSpecifier];
    LOBYTE(v23) = [v23 stringIsEqual:v26 to:v27];

    uint64_t v13 = v44;
    unint64_t v16 = v25;
    uint64_t v14 = v42;

    uint64_t v15 = v41;
    if (v23) {
      break;
    }
LABEL_13:
    if (v14 == ++v17)
    {
      uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v14) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  char v37 = [v18 fullAssetSelector];

  if (v37)
  {
    [*(id *)(v44 + 32) _successMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAtomicInstance:*(void *)(v44 + 48) forMappedSelector:v37 completion:*(void *)(v44 + 56)];
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v38 = *(void **)(v13 + 32);
  char v37 = [v38 assetSetIdentifier];
  [v38 _failedMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAssetSetIdentifier:v37 withErrorCode:6102 withResponseError:0 description:@"found-information did not include latest downloaded atomic-instance-entry for mapped selector" completion:*(void *)(v13 + 56)];
LABEL_24:
  id v9 = v39;
  id v7 = 0;

  id v5 = v40;
LABEL_25:
}

- (id)mapLockedAtomicEntrySync:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 mappedSelector:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__8;
  char v39 = __Block_byref_object_dispose__8;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__8;
  uint64_t v33 = __Block_byref_object_dispose__8;
  id v34 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke;
  v19[3] = &unk_1E6005D28;
  id v21 = v25;
  id v22 = &v35;
  long long v23 = &v29;
  id v24 = v27;
  uint64_t v14 = v13;
  id v20 = v14;
  [(MAAutoAssetSet *)self mapLockedAtomicEntry:v10 forAtomicInstance:v11 mappingSelector:v12 completion:v19];
  if (+[MAAutoAssetSet waitOnSemaphore:v14 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v15 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v27;
    void block[5] = v25;
    block[6] = &v35;
    block[7] = &v29;
    dispatch_sync(v15, block);
  }
  if (a6) {
    *a6 = (id) v36[5];
  }
  id v16 = (id)v30[5];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v16;
}

void __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v12 = *(_OWORD *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 48);
  block[2] = __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v14 = v6;
  id v15 = v7;
  uint64_t v18 = *(void *)(a1 + 64);
  id v9 = (id)v12;
  long long v16 = v12;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v8, block);
}

intptr_t __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(mapLockedAtomicEntrySync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for map-locked-atomic-entry to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5
{
}

- (void)_lockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      [(MAAutoAssetSet *)self _shortTermLockAtomic:v10 forAtomicInstance:v11 performContentValidation:v7 completion:v12];
    }
    else
    {
      id v15 = [(MAAutoAssetSet *)self completionDispatchQueue];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __111__MAAutoAssetSet__lockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke;
      v16[3] = &unk_1E6005D50;
      BOOL v18 = v7;
      id v17 = v12;
      dispatch_async(v15, v16);
    }
  }
  else
  {
    dispatch_semaphore_t v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:]();
    }
  }
}

void __111__MAAutoAssetSet__lockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v2 = @"auto-set(lockAtomic)";
  }
  else {
    uint64_t v2 = @"auto-set(lockAtomic:Fast)";
  }
  id v3 = +[MAAutoAssetError buildError:6581 fromOperation:v2 underlyingError:0 withDescription:@"restricted to SHORT-TERM locker instance"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)formSubAtomicInstance:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      id v14 = [(MAAutoAssetSet *)self assetSetIdentifier];
      [(MAAutoAssetSet *)self _failedOperation:@"formSubAtomicInstance" forAssetSetIdentifier:v14 withErrorCode:6580 withResponseError:0 description:@"not supported for SHORT-TERM locker instance" completion:v13];
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke;
      v17[3] = &unk_1E6005BC0;
      void v17[4] = self;
      id v18 = v11;
      id v19 = v12;
      id v20 = v10;
      id v21 = v13;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v17];
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:]();
    }
  }
}

void __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 64);
    [v3 _failedFormSubAtomicInstance:@"formSubAtomicInstance" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetSetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) clientDomainName];
    BOOL v7 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v8 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v9 = __maAutoAssetSetSharedClientProcessID;
    id v10 = [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v14 = [(MAAutoAssetSetInfoInstance *)v5 initUsingClientDomain:v6 forClientName:v7 withProcessName:v8 withProcessID:v9 forAssetSetIdentifier:v10 forAtomicInstance:v11 comprisedOfEntries:v12 asEntriesWhenTargeting:0 associatingFrameworkUUID:v13];

    id v15 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:0 reasonDesired:*(void *)(a1 + 56) awaitingDownloadOfDiscovered:0 withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v18 = [v17 UUIDString];

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:FORM_SUB_ATOMIC" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke_2;
    v21[3] = &unk_1E6004158;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 64);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (!v14 || v5)
  {
    if (v5)
    {
      uint64_t v11 = @"failure reported by server";
      uint64_t v12 = 0;
      id v13 = v5;
    }
    else
    {
      uint64_t v11 = @"no response message from server";
      uint64_t v12 = 6104;
      id v13 = 0;
    }
    [*(id *)(a1 + 32) _failedFormSubAtomicInstance:@"formSubAtomicInstance" withErrorCode:v12 withResponseError:v13 description:v11 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v14 message];
    BOOL v7 = [v6 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];

    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v7 currentSetStatus];
    id v10 = [v9 newerAtomicInstanceDiscovered];
    [v8 _successFormSubAtomicInstance:@"formSubAtomicInstance" formedSubAtomicInstance:v10 completion:*(void *)(a1 + 40)];
  }
}

- (id)formSubAtomicInstanceSync:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__8;
  char v39 = __Block_byref_object_dispose__8;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__8;
  uint64_t v33 = __Block_byref_object_dispose__8;
  id v34 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke;
  v19[3] = &unk_1E6005BE8;
  id v21 = v25;
  id v22 = &v35;
  long long v23 = &v29;
  id v24 = v27;
  id v14 = v13;
  id v20 = v14;
  [(MAAutoAssetSet *)self formSubAtomicInstance:v10 fromAtomicInstance:v11 toBeComprisedOfEntries:v12 completion:v19];
  if (+[MAAutoAssetSet waitOnSemaphore:v14 withDaemonTriggeredTimeout:-100])
  {
    id v15 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v27;
    void block[5] = v25;
    block[6] = &v35;
    block[7] = &v29;
    dispatch_sync(v15, block);
  }
  if (a6) {
    *a6 = (id) v30[5];
  }
  id v16 = (id)v36[5];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v16;
}

void __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(formSubAtomicInstanceSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for form-sub-atomic-instance to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5
{
}

- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      id v14 = [(MAAutoAssetSet *)self assetSetIdentifier];
      [(MAAutoAssetSet *)self _failedOperation:@"continueAtomicLock" forAssetSetIdentifier:v14 withErrorCode:6580 withResponseError:0 description:@"not supported for SHORT-TERM locker instance" completion:v13];
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke;
      v17[3] = &unk_1E6005BC0;
      void v17[4] = self;
      id v18 = v11;
      id v19 = v12;
      id v20 = v10;
      id v21 = v13;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v17];
    }
  }
  else
  {
    long long v15 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:]();
    }
  }
}

void __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedOperation:@"continueAtomicLock" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 64)];
  }
  else
  {
    id v6 = [MAAutoAssetSetInfoInstance alloc];
    BOOL v7 = [*(id *)(a1 + 32) clientDomainName];
    id v8 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    id v11 = [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v14 = [(MAAutoAssetSetInfoInstance *)v6 initUsingClientDomain:v7 forClientName:v8 withProcessName:v9 withProcessID:v10 forAssetSetIdentifier:v11 forAtomicInstance:v12 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v13];

    id v15 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:*(void *)(a1 + 48) reasonDesired:*(void *)(a1 + 56) awaitingDownloadOfDiscovered:0 withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v18 = [v17 UUIDString];

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:CONTINUE_ATOMIC_LOCK" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke_2;
    v21[3] = &unk_1E6004158;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 64);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  BOOL v7 = [v6 assetSetIdentifier];
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0;
      id v12 = v5;
    }
    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104;
      id v12 = 0;
    }
    [v9 _failedOperation:@"continueAtomicLock" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successOperation:@"continueAtomicLock" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4
{
  return [(MAAutoAssetSet *)self continueAtomicLockSync:a3 ofAtomicInstance:a4 withNeedPolicy:0];
}

- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__8;
  v33[4] = __Block_byref_object_dispose__8;
  id v34 = 0;
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__8;
  uint64_t v31 = __Block_byref_object_dispose__8;
  id v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke;
  v17[3] = &unk_1E6005BE8;
  id v19 = v23;
  id v20 = v33;
  id v21 = &v27;
  id v22 = v25;
  id v12 = v11;
  id v18 = v12;
  [(MAAutoAssetSet *)self continueAtomicLock:v8 ofAtomicInstance:v9 withNeedPolicy:v10 completion:v17];
  if (+[MAAutoAssetSet waitOnSemaphore:v12 withDaemonTriggeredTimeout:-100])
  {
    id v13 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v25;
    void block[5] = v23;
    block[6] = v33;
    block[7] = &v27;
    dispatch_sync(v13, block);
  }
  id v14 = (id)v28[5];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v33, 8);
  return v14;
}

void __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(continueAtomicLockSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for continue-atomic-lock to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

void __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedOperation:@"endAtomicLock" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = [MAAutoAssetSetInfoInstance alloc];
    BOOL v7 = [*(id *)(a1 + 32) clientDomainName];
    id v8 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    long long v11 = [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v14 = [(MAAutoAssetSetInfoInstance *)v6 initUsingClientDomain:v7 forClientName:v8 withProcessName:v9 withProcessID:v10 forAssetSetIdentifier:v11 forAtomicInstance:v12 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v13];

    id v15 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:0 reasonDesired:*(void *)(a1 + 48) awaitingDownloadOfDiscovered:0 withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v18 = [v17 UUIDString];

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:END_ATOMIC_LOCK" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_3;
    v21[3] = &unk_1E6004158;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 56);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  BOOL v7 = [v6 assetSetIdentifier];
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0;
      id v12 = v5;
    }
    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104;
      id v12 = 0;
    }
    [v9 _failedOperation:@"endAtomicLock" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successOperation:@"endAtomicLock" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)endAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__8;
  id v32 = __Block_byref_object_dispose__8;
  id v33 = 0;
  if ([(MAAutoAssetSet *)self shortTermLocker])
  {
    uint64_t v8 = [(MAAutoAssetSet *)self _shortTermEndAtomicLockSync:v6 ofAtomicInstance:v7];
    uint64_t v9 = (void *)v29[5];
    v29[5] = v8;
  }
  else
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__8;
    v26[4] = __Block_byref_object_dispose__8;
    id v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    char v25 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 0;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke;
    v16[3] = &unk_1E6005BE8;
    id v18 = v22;
    id v19 = v26;
    id v20 = &v28;
    id v21 = v24;
    uint64_t v11 = v10;
    uint64_t v17 = v11;
    [(MAAutoAssetSet *)self endAtomicLock:v6 ofAtomicInstance:v7 completion:v16];
    if (+[MAAutoAssetSet waitOnSemaphore:v11 withDaemonTriggeredTimeout:-100])
    {
      id v12 = +[MAAutoAssetSet frameworkDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_3;
      block[3] = &unk_1E60053D8;
      void block[4] = v24;
      void block[5] = v22;
      block[6] = v26;
      block[7] = &v28;
      dispatch_sync(v12, block);
    }
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);
  }
  id v13 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v13;
}

void __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(endAtomicLockSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for end-atomic-lock to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)assetSetForStaging:(id)a3 asEntriesWhenTargeting:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      long long v11 = [(MAAutoAssetSet *)self assetSetIdentifier];
      [(MAAutoAssetSet *)self _failedOperation:@"assetSetForStaging" forAssetSetIdentifier:v11 withErrorCode:6580 withResponseError:0 description:@"not supported for SHORT-TERM locker instance" completion:v10];
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke;
      v14[3] = &unk_1E60041A8;
      void v14[4] = self;
      id v15 = v9;
      id v16 = v8;
      id v17 = v10;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v14];
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v13 = [v12 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet assetSetForStaging:asEntriesWhenTargeting:completion:]();
    }
  }
}

void __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedOperation:@"assetSetForStaging" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = [MAAutoAssetSetInfoInstance alloc];
    id v7 = [*(id *)(a1 + 32) clientDomainName];
    id v8 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    long long v11 = [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v14 = [(MAAutoAssetSetInfoInstance *)v6 initUsingClientDomain:v7 forClientName:v8 withProcessName:v9 withProcessID:v10 forAssetSetIdentifier:v11 forAtomicInstance:0 comprisedOfEntries:0 asEntriesWhenTargeting:v12 associatingFrameworkUUID:v13];

    id v15 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:0 reasonDesired:*(void *)(a1 + 48) awaitingDownloadOfDiscovered:0 withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v18 = [v17 UUIDString];

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:ASSET_SET_FOR_STAGING" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke_2;
    v21[3] = &unk_1E6004158;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 56);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 assetSetIdentifier];
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0;
      id v12 = v5;
    }
    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104;
      id v12 = 0;
    }
    [v9 _failedOperation:@"assetSetForStaging" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successOperation:@"assetSetForStaging" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)assetSetForStagingSync:(id)a3 asEntriesWhenTargeting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy__8;
  id v27 = __Block_byref_object_dispose__8;
  id v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke;
  v14[3] = &unk_1E6005D78;
  id v16 = v19;
  id v17 = &v23;
  id v18 = v21;
  uint64_t v9 = v8;
  id v15 = v9;
  [(MAAutoAssetSet *)self assetSetForStaging:v6 asEntriesWhenTargeting:v7 completion:v14];
  if (+[MAAutoAssetSet waitOnSemaphore:v9 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v10 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v21;
    void block[5] = v19;
    block[6] = &v23;
    dispatch_sync(v10, block);
  }
  id v11 = (id)v24[5];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  block[2] = __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v10 = v4;
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_sync(v5, block);
}

intptr_t __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(assetSetForStagingSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for asset-set-for-staging to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)currentSetStatus:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(MAAutoAssetSet *)self shortTermLocker])
    {
      [(MAAutoAssetSet *)self _shortTermCurrentSetStatus:v4];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __35__MAAutoAssetSet_currentSetStatus___block_invoke;
      v7[3] = &unk_1E60054F0;
      v7[4] = self;
      id v8 = v4;
      [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v7];
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet currentSetStatus:]();
    }
  }
}

void __35__MAAutoAssetSet_currentSetStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedCurrentSetStatus:@"currentSetStatus" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [MAAutoAssetSetInfoInstance alloc];
    id v7 = [*(id *)(a1 + 32) clientDomainName];
    id v8 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    long long v11 = [*(id *)(a1 + 32) assetSetIdentifier];
    long long v12 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v13 = [(MAAutoAssetSetInfoInstance *)v6 initUsingClientDomain:v7 forClientName:v8 withProcessName:v9 withProcessID:v10 forAssetSetIdentifier:v11 forAtomicInstance:0 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v12];

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v16 = [v15 UUIDString];

    [v14 setSafeObject:v13 forKey:@"setInstance"];
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:CURRENT_SET_STATUS" clientID:v16 version:0 message:v14];
    id v18 = (void *)__maAutoAssetSetSharedConnectionClient;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__MAAutoAssetSet_currentSetStatus___block_invoke_2;
    void v20[3] = &unk_1E6004158;
    id v19 = *(void **)(a1 + 40);
    v20[4] = *(void *)(a1 + 32);
    id v21 = v19;
    [v18 connectClientSendServerMessage:v17 proxyObject:0 withReply:v20];
  }
}

void __35__MAAutoAssetSet_currentSetStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  if (!v20 || v5)
  {
    long long v12 = *(void **)(a1 + 32);
    id v7 = [v12 assetSetIdentifier];
    if (v5)
    {
      id v13 = @"failure reported by server";
      id v14 = v12;
      id v15 = v7;
      uint64_t v16 = 0;
      id v17 = v5;
    }
    else
    {
      id v13 = @"no response message from server";
      id v14 = v12;
      id v15 = v7;
      uint64_t v16 = 6104;
      id v17 = 0;
    }
    [v14 _failedCurrentSetStatus:@"currentSetStatus" forAssetSetIdentifier:v15 withErrorCode:v16 withResponseError:v17 description:v13 completion:*(void *)(a1 + 40)];
    goto LABEL_14;
  }
  id v6 = [v20 message];
  id v7 = [v6 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];

  if (!v7)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 assetSetIdentifier];
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = @"no found-information provided by server";
LABEL_12:
    [v9 _failedCurrentSetStatus:@"currentSetStatus" forAssetSetIdentifier:v10 withErrorCode:6104 withResponseError:0 description:v19 completion:v18];
    goto LABEL_13;
  }
  id v8 = [v7 currentSetStatus];

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v9 assetSetIdentifier];
  if (!v8)
  {
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = @"found-information yet no set-status provided";
    goto LABEL_12;
  }
  long long v11 = [v7 currentSetStatus];
  [v9 _successCurrentSetStatus:@"currentSetStatus" forAssetSetIdentifier:v10 withAssetSetStatus:v11 completion:*(void *)(a1 + 40)];

LABEL_13:
LABEL_14:
}

- (id)currentSetStatusSync:(id *)a3
{
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__8;
  uint64_t v38 = __Block_byref_object_dispose__8;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__8;
  id v32 = __Block_byref_object_dispose__8;
  id v33 = 0;
  if ([(MAAutoAssetSet *)self shortTermLocker])
  {
    id v5 = v29;
    id v27 = v29[5];
    uint64_t v6 = [(MAAutoAssetSet *)self _shortTermCurrentSetStatusSync:&v27];
    objc_storeStrong(v5 + 5, v27);
    id v7 = (void *)v35[5];
    v35[5] = v6;

    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  void v25[3] = __Block_byref_object_copy__8;
  void v25[4] = __Block_byref_object_dispose__8;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__MAAutoAssetSet_currentSetStatusSync___block_invoke;
  v14[3] = &unk_1E6005DA0;
  uint64_t v16 = v21;
  id v17 = v25;
  void v14[4] = self;
  uint64_t v18 = &v34;
  id v19 = &v28;
  id v20 = v23;
  long long v11 = v10;
  id v15 = v11;
  [(MAAutoAssetSet *)self currentSetStatus:v14];
  if (+[MAAutoAssetSet waitOnSemaphore:v11 withDaemonTriggeredTimeout:-100])
  {
    long long v12 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_3;
    block[3] = &unk_1E6005810;
    void block[4] = v23;
    void block[5] = v21;
    block[6] = v25;
    void block[7] = &v34;
    void block[8] = &v28;
    dispatch_sync(v12, block);
  }
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  if (a3) {
LABEL_3:
  }
    *a3 = v29[5];
LABEL_4:
  id v8 = (id)v35[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v8;
}

void __39__MAAutoAssetSet_currentSetStatusSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_2;
  block[3] = &unk_1E60054A0;
  long long v8 = *(_OWORD *)(a1 + 56);
  void block[4] = *(void *)(a1 + 32);
  id v15 = v5;
  id v16 = v6;
  long long v9 = *(_OWORD *)(a1 + 72);
  long long v18 = v8;
  long long v19 = v9;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v13;
  long long v17 = v13;
  id v11 = v6;
  id v12 = v5;
  dispatch_sync(v7, block);
}

intptr_t __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    intptr_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) assetSetIdentifier];
    uint64_t v3 = *(void *)(*(void *)(v1 + 72) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8) + 40), *(id *)(v1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 96) + 8) + 24) = 1;
    id v5 = *(NSObject **)(v1 + 56);
    return dispatch_semaphore_signal(v5);
  }
  return result;
}

void *__39__MAAutoAssetSet_currentSetStatusSync___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    uint64_t v4 = *(void *)(v1[7] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    *(void *)(*(void *)(v1[8] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(currentSetStatusSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for current-set-status to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_shortTermLockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v21 = 0;
  id v11 = [(MAAutoAssetSet *)self _shortTermLockAtomicSync:a3 forAtomicInstance:a4 performContentValidation:v6 error:&v21];
  id v12 = v21;
  long long v13 = [(MAAutoAssetSet *)self completionDispatchQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __120__MAAutoAssetSet__shortTermLockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke;
  v17[3] = &unk_1E60056A8;
  id v19 = v12;
  id v20 = v10;
  id v18 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);
}

uint64_t __120__MAAutoAssetSet__shortTermLockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_shortTermLockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5
{
}

- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5
{
  return [(MAAutoAssetSet *)self _shortTermLockAtomicSync:a3 forAtomicInstance:a4 performContentValidation:1 error:a5];
}

- (void)_shortTermEndAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5
{
  id v8 = a5;
  long long v9 = [(MAAutoAssetSet *)self _shortTermEndAtomicLockSync:a3 ofAtomicInstance:a4];
  id v10 = [(MAAutoAssetSet *)self completionDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MAAutoAssetSet__shortTermEndAtomicLock_ofAtomicInstance_completion___block_invoke;
  block[3] = &unk_1E60056A8;
  id v14 = v9;
  id v15 = v8;
  void block[4] = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);
}

void __70__MAAutoAssetSet__shortTermEndAtomicLock_ofAtomicInstance_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) assetSetIdentifier];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)_shortTermCurrentSetStatus:(id)a3
{
  id v4 = a3;
  id v15 = 0;
  id v5 = [(MAAutoAssetSet *)self _shortTermCurrentSetStatusSync:&v15];
  id v6 = v15;
  id v7 = [(MAAutoAssetSet *)self completionDispatchQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__MAAutoAssetSet__shortTermCurrentSetStatus___block_invoke;
  v11[3] = &unk_1E60056A8;
  id v13 = v6;
  id v14 = v4;
  id v12 = v5;
  id v8 = v6;
  id v9 = v5;
  id v10 = v4;
  dispatch_async(v7, v11);
}

uint64_t __45__MAAutoAssetSet__shortTermCurrentSetStatus___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_shortTermCurrentSetStatusSync:(id *)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__8;
  long long v17 = __Block_byref_object_dispose__8;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__8;
  id v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MAAutoAssetSet__shortTermCurrentSetStatusSync___block_invoke;
  block[3] = &unk_1E6005E18;
  void block[4] = self;
  void block[5] = &v13;
  block[6] = &v7;
  dispatch_sync((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue, block);
  if (a3) {
    *a3 = (id) v8[5];
  }
  id v4 = (id)v14[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __49__MAAutoAssetSet__shortTermCurrentSetStatusSync___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) clientDomainName];
  id v3 = [*(id *)(a1 + 32) assetSetIdentifier];
  id v4 = +[MAAutoAssetSetStatus shortTermLockFilename:v2 forAssetSetIdentifier:v3 forSetAtomicInstance:0];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v21 = *(id *)(v8 + 40);
  obuint64_t j = v7;
  int v9 = [v5 _shortTermOpenSharedLockFile:@"auto-set(_shortTermCurrentSetStatus)" lockingAtomicInstance:0 forLockReason:0 verifyingLocalContentURLs:0 openingFilename:v4 providingLockedSetStatus:&obj sharedLockError:&v21];
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v8 + 40), v21);
  if ((v9 & 0x80000000) == 0)
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v20 = *(id *)(v11 + 40);
    uint64_t v12 = [v10 _readLockedSetStatusFromSharedLockFile:v4 error:&v20];
    objc_storeStrong((id *)(v11 + 40), v20);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if (close(v9))
    {
      int v15 = *__error();
      id v16 = [MEMORY[0x1E4FA56C8] sharedLogger];
      long long v17 = [v16 oslog];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) latestDownloadedAtomicInstance];
        *(_DWORD *)buf = 67109890;
        int v24 = v9;
        __int16 v25 = 2114;
        id v26 = v18;
        __int16 v27 = 2114;
        uint64_t v28 = v4;
        __int16 v29 = 1024;
        int v30 = v15;
        _os_log_error_impl(&dword_1B275B000, v17, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermCurrentSetStatusSync}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | WARNING | failed close of shared lock file | latestAtomicInstanceFilename:%{public}@ | errno:%d", buf, 0x22u);
LABEL_7:
      }
    }
    else
    {
      id v19 = [MEMORY[0x1E4FA56C8] sharedLogger];
      long long v17 = [v19 oslog];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) latestDownloadedAtomicInstance];
        *(_DWORD *)buf = 67109634;
        int v24 = v9;
        __int16 v25 = 2114;
        id v26 = v18;
        __int16 v27 = 2114;
        uint64_t v28 = v4;
        _os_log_impl(&dword_1B275B000, v17, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermCurrentSetStatusSync}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | released sharedLockedFileDescriptor | | latestAtomicInstanceFilename:%{public}@", buf, 0x1Cu);
        goto LABEL_7;
      }
    }
  }
  [*(id *)(a1 + 32) _shortTermLogResult:@"_shortTermCurrentSetStatusSync" forLockReason:0 forAtomicInstance:0 atomicInstanceFilename:v4 forShortTermLock:0 withSetStatus:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) returningError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 error:(id *)a9
{
  LOBYTE(v10) = 1;
  return [(MAAutoAssetSet *)self _shortTermLockForAtomicInstance:a3 locking:a4 withLockedFileDescriptor:*(void *)&a5 forLockReason:a6 justCreated:a7 providingLockedSetStatus:a8 shouldVerifyContent:v10 error:a9];
}

- (id)summary
{
  id v3 = [NSString alloc];
  id v4 = [(MAAutoAssetSet *)self autoAssetSetClientName];
  id v5 = [(MAAutoAssetSet *)self assetSetIdentifier];
  if ([(MAAutoAssetSet *)self shortTermLocker]) {
    uint64_t v6 = @"Y";
  }
  else {
    uint64_t v6 = @"N";
  }
  uint64_t v7 = [(MAAutoAssetSet *)self autoAssetEntries];
  if (v7)
  {
    id v8 = [NSString alloc];
    int v9 = [(MAAutoAssetSet *)self autoAssetEntries];
    uint64_t v10 = objc_msgSend(v8, "initWithFormat:", @"%ld", objc_msgSend(v9, "count"));
    uint64_t v11 = (void *)[v3 initWithFormat:@"autoAssetSetClientName:%@|assetSetIdentifier:%@|shortTermLocker:%@|autoAssetEntries:%@", v4, v5, v6, v10];
  }
  else
  {
    uint64_t v11 = (void *)[v3 initWithFormat:@"autoAssetSetClientName:%@|assetSetIdentifier:%@|shortTermLocker:%@|autoAssetEntries:%@", v4, v5, v6, @"N"];
  }

  return v11;
}

+ (void)endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (v19)
  {
    id v27 = v14;
    id v20 = [MAAutoAssetSet alloc];
    id v21 = +[MAAutoAssetSet defaultDispatchQueue];
    id v34 = 0;
    id v22 = [(MAAutoAssetSet *)v20 initUsingClientDomain:v15 forClientName:v16 forAssetSetIdentifier:v17 comprisedOfEntries:0 usingDesiredPolicyCategory:0 completingFromQueue:v21 error:&v34];
    uint64_t v23 = v34;

    if (v23)
    {
      int v24 = +[MAAutoAssetSet defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      __int16 v25 = &v31;
      id v31 = v19;
      id v29 = v17;
      int v30 = v23;
      dispatch_async(v24, block);
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      void v32[2] = __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke;
      v32[3] = &unk_1E6005E40;
      __int16 v25 = &v33;
      id v33 = v19;
      [v22 _endAtomicLocks:v27 usingClientDomain:v15 forClientName:v16 forAssetSetIdentifier:v17 ofAtomicInstance:v18 removingLockCount:a8 completion:v32];
    }

    id v14 = v27;
  }
  else
  {
    +[MAAutoAssetSet frameworkInstanceSetLogDomain];
    id v26 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v23 = [v26 oslog];

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAssetSet endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:]();
    }
  }
}

uint64_t __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if (v20)
  {
    if (!v15 && a8 != -1)
    {
      id v21 = @"endLockReason is nil but endLockCount is not MA_END_ATOMIC_LOCKS_COUNT_ALL";
LABEL_13:
      [(MAAutoAssetSet *)self _failedOperation:@"endAtomicLocks" forAssetSetIdentifier:v18 withErrorCode:6108 withResponseError:0 description:v21 completion:v20];
      goto LABEL_15;
    }
    if ([v19 isEqualToString:@"ALL_INSTANCES"])
    {
      if (a8 != -1)
      {
        id v21 = @"MA_END_ATOMIC_LOCKS_ALL_INSTANCES is specified but endLockCount is not MA_END_ATOMIC_LOCKS_COUNT_ALL";
        goto LABEL_13;
      }
      if (v15)
      {
        id v21 = @"MA_END_ATOMIC_LOCKS_ALL_INSTANCES is specified but endLockReason is not nil";
        goto LABEL_13;
      }
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke;
    void v24[3] = &unk_1E6005E68;
    id v25 = v16;
    id v26 = v17;
    id v27 = v18;
    id v28 = v19;
    int64_t v32 = a8;
    id v29 = v15;
    int v30 = self;
    id v31 = v20;
    [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v24];

    goto LABEL_15;
  }
  id v22 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v23 = [v22 oslog];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[MAAutoAssetSet _endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:]();
  }

LABEL_15:
}

void __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke(uint64_t *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = a1[6];
    id v4 = (void *)a1[9];
    uint64_t v5 = a1[10];
    [v4 _failedOperation:@"endAtomicLocks" forAssetSetIdentifier:v3 withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v5];
  }
  else
  {
    uint64_t v6 = [MAAutoAssetSetInfoInstance alloc];
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    uint64_t v11 = a1[6];
    uint64_t v12 = a1[7];
    uint64_t v13 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v14 = [(MAAutoAssetSetInfoInstance *)v6 initUsingClientDomain:v7 forClientName:v8 withProcessName:v9 withProcessID:v10 forAssetSetIdentifier:v11 forAtomicInstance:v12 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v13];

    id v15 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:0 reasonDesired:a1[8] awaitingDownloadOfDiscovered:0 withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];
    id v16 = [[MAAutoAssetSetInfoEnd alloc] initWithLockReason:a1[8] endingLockCount:a1[11]];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v18 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v19 = [v18 UUIDString];

    [v17 setSafeObject:v14 forKey:@"setInstance"];
    [v17 setSafeObject:v15 forKey:@"setDesire"];
    [v17 setSafeObject:v16 forKey:@"setEnd"];
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT" clientID:v19 version:0 message:v17];
    id v21 = (void *)__maAutoAssetSetSharedConnectionClient;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2;
    void v22[3] = &unk_1E6005540;
    v22[4] = a1[9];
    id v23 = (id)a1[6];
    id v24 = (id)a1[10];
    [v21 connectClientSendServerMessage:v20 proxyObject:0 withReply:v22];
  }
}

void __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  if (!v11 || v5)
  {
    if (v5)
    {
      uint64_t v8 = @"failure reported by server";
      uint64_t v9 = 0;
      id v10 = v5;
    }
    else
    {
      uint64_t v8 = @"no response message from server";
      uint64_t v9 = 6104;
      id v10 = 0;
    }
    [v6 _failedOperation:@"endAtomicLocks" forAssetSetIdentifier:v7 withErrorCode:v9 withResponseError:v10 description:v8 completion:a1[6]];
  }
  else
  {
    [v6 _successOperation:@"endAtomicLocks" forAssetSetIdentifier:v7 completion:a1[6]];
  }
}

+ (id)endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = [MAAutoAssetSet alloc];
  id v19 = +[MAAutoAssetSet defaultDispatchQueue];
  id v23 = 0;
  id v20 = [(MAAutoAssetSet *)v18 initUsingClientDomain:v14 forClientName:v15 forAssetSetIdentifier:v16 comprisedOfEntries:0 usingDesiredPolicyCategory:0 completingFromQueue:v19 error:&v23];
  id v21 = v23;

  if (!v21)
  {
    id v21 = [v20 _endAtomicLocksSync:v13 usingClientDomain:v14 forClientName:v15 forAssetSetIdentifier:v16 ofAtomicInstance:v17 removingLockCount:a8];
  }

  return v21;
}

- (id)_endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__8;
  id v39 = __Block_byref_object_dispose__8;
  id v40 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke;
  v26[3] = &unk_1E6005D78;
  id v28 = v31;
  id v29 = &v35;
  int v30 = v33;
  id v19 = v18;
  id v27 = v19;
  id v20 = v13;
  [(MAAutoAssetSet *)self _endAtomicLocks:v13 usingClientDomain:v14 forClientName:v15 forAssetSetIdentifier:v16 ofAtomicInstance:v17 removingLockCount:a8 completion:v26];
  if (+[MAAutoAssetSet waitOnSemaphore:v19 withDaemonTriggeredTimeout:-100])
  {
    id v21 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v33;
    void block[5] = v31;
    block[6] = &v35;
    dispatch_sync(v21, block);
  }
  id v22 = (id)v36[5];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  return v22;
}

void __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  block[2] = __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v10 = v4;
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_sync(v5, block);
}

intptr_t __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(endAtomicLocks)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for end-atomic-locks to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 completion:(id)a6
{
}

+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v14)
  {
    id v15 = [MAAutoAssetSet alloc];
    id v16 = +[MAAutoAssetSet defaultDispatchQueue];
    id v28 = 0;
    id v17 = [(MAAutoAssetSet *)v15 initUsingClientDomain:v12 forClientName:@"ALL_CLIENTS" forAssetSetIdentifier:v13 comprisedOfEntries:0 usingDesiredPolicyCategory:0 completingFromQueue:v16 error:&v28];
    dispatch_semaphore_t v18 = v28;

    if (v18)
    {
      id v19 = +[MAAutoAssetSet defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      id v20 = &v25;
      id v25 = v14;
      id v23 = v13;
      id v24 = v18;
      dispatch_async(v19, block);
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke;
      v26[3] = &unk_1E6005E40;
      id v20 = &v27;
      id v27 = v14;
      [v17 _eliminateAtomic:v11 awaitingUnlocked:v8 completion:v26];
    }
  }
  else
  {
    +[MAAutoAssetSet frameworkInstanceSetLogDomain];
    id v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
    dispatch_semaphore_t v18 = [v21 oslog];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAssetSet eliminateAtomic:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:completion:]();
    }
  }
}

uint64_t __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_eliminateAtomic:(id)a3 awaitingUnlocked:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    void v12[4] = self;
    id v13 = v8;
    BOOL v15 = a4;
    id v14 = v9;
    [(MAAutoAssetSet *)self connectToServerFrameworkCompletion:v12];
  }
  else
  {
    id v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _eliminateAtomic:awaitingUnlocked:completion:]();
    }
  }
}

void __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 assetSetIdentifier];
    [v4 _failedOperation:@"eliminateAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = [MAAutoAssetSetInfoInstance alloc];
    id v7 = [*(id *)(a1 + 32) clientDomainName];
    id v8 = [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    id v11 = [*(id *)(a1 + 32) assetSetIdentifier];
    id v12 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v13 = [(MAAutoAssetSetInfoInstance *)v6 initUsingClientDomain:v7 forClientName:v8 withProcessName:v9 withProcessID:v10 forAssetSetIdentifier:v11 forAtomicInstance:0 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v12];

    id v14 = [[MAAutoAssetSetInfoDesire alloc] initForClientAssetSetPolicy:0 reasonDesired:*(void *)(a1 + 40) awaitingDownloadOfDiscovered:*(unsigned __int8 *)(a1 + 56) withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = +[MAAutoAssetSet frameworkInstanceUUID];
    id v17 = [v16 UUIDString];

    [v15 setSafeObject:v13 forKey:@"setInstance"];
    [v15 setSafeObject:v14 forKey:@"setDesire"];
    dispatch_semaphore_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET:ELIMINATE_ATOMIC" clientID:v17 version:0 message:v15];
    id v19 = (void *)__maAutoAssetSetSharedConnectionClient;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke_2;
    void v20[3] = &unk_1E6004158;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    [v19 connectClientSendServerMessage:v18 proxyObject:0 withReply:v20];
  }
}

void __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 assetSetIdentifier];
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0;
      id v12 = v5;
    }
    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104;
      id v12 = 0;
    }
    [v9 _failedOperation:@"eliminateAtomic" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successOperation:@"eliminateAtomic" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5
{
  return (id)[a1 eliminateAtomicSync:a3 usingClientDomain:a4 forAssetSetIdentifier:a5 awaitingUnlocked:0];
}

+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = [MAAutoAssetSet alloc];
  id v13 = +[MAAutoAssetSet defaultDispatchQueue];
  id v17 = 0;
  id v14 = [(MAAutoAssetSet *)v12 initUsingClientDomain:v11 forClientName:@"ALL_CLIENTS" forAssetSetIdentifier:v10 comprisedOfEntries:0 usingDesiredPolicyCategory:0 completingFromQueue:v13 error:&v17];

  id v15 = v17;
  if (!v15)
  {
    id v15 = [v14 _eliminateAtomicSync:v9 awaitingUnlocked:v6];
  }

  return v15;
}

- (id)_eliminateAtomicSync:(id)a3 awaitingUnlocked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__8;
  id v26 = __Block_byref_object_dispose__8;
  id v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke;
  v13[3] = &unk_1E6005D78;
  id v15 = v18;
  id v16 = &v22;
  id v17 = v20;
  id v8 = v7;
  id v14 = v8;
  [(MAAutoAssetSet *)self _eliminateAtomic:v6 awaitingUnlocked:v4 completion:v13];
  if (+[MAAutoAssetSet waitOnSemaphore:v8 withDaemonTriggeredTimeout:-100])
  {
    id v9 = +[MAAutoAssetSet frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v20;
    void block[5] = v18;
    block[6] = &v22;
    dispatch_sync(v9, block);
  }
  id v10 = (id)v23[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[MAAutoAssetSet frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  block[2] = __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v10 = v4;
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_sync(v5, block);
}

intptr_t __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-set(eliminateAtomicSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for eliminate-atomic to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MAAutoAssetSet frameworkDispatchQueue];
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (!WeakRetained)
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  if (!v3)
  {
    long long v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v8 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_2();
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v9 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_3();
    }
LABEL_11:

    goto LABEL_12;
  }
  [WeakRetained _lockAtomicStatusProgress:v3 lockAtomicError:0 progressBlock:*(void *)(a1 + 32)];
LABEL_12:
}

- (void)_successCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 newerInstanceDiscovered:(id)a5 discoveredAtomicEntries:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    id v17 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__MAAutoAssetSet__successCheckAtomic_forAssetSetIdentifier_newerInstanceDiscovered_discoveredAtomicEntries_completion___block_invoke;
    block[3] = &unk_1E6005EB8;
    char v21 = v12;
    id v22 = v13;
    id v25 = v16;
    id v23 = v14;
    id v24 = v15;
    dispatch_async(v17, block);

    dispatch_semaphore_t v18 = v21;
  }
  else
  {
    char v19 = [MEMORY[0x1E4FA56C8] sharedLogger];
    dispatch_semaphore_t v18 = [v19 oslog];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successCheckAtomic:forAssetSetIdentifier:newerInstanceDiscovered:discoveredAtomicEntries:completion:]();
    }
  }
}

uint64_t __119__MAAutoAssetSet__successCheckAtomic_forAssetSetIdentifier_newerInstanceDiscovered_discoveredAtomicEntries_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successCheckAtomic:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (void)_failedCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    char v19 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6005EE0;
    id v27 = v16;
    int64_t v32 = a5;
    id v28 = v14;
    id v29 = v15;
    id v30 = v17;
    id v31 = v18;
    dispatch_async(v19, block);

    id v20 = v27;
  }
  else
  {
    id v21 = [NSString alloc];
    if (v16)
    {
      id v22 = [v16 checkedDescription];
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }
    else
    {
      id v22 = +[MAAutoAssetError summaryForCode:a5 fromOperation:v14];
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }
    id v20 = (void *)v23;

    id v24 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v25 = [v24 oslog];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v14;
      __int16 v35 = 2114;
      uint64_t v36 = v20;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_error_impl(&dword_1B275B000, v25, OS_LOG_TYPE_ERROR, "MA-auto-set{_failedCheckAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block", buf, 0x20u);
    }
  }
}

void __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 72)) != 0
    && (v6 = (void *)[[NSString alloc] initWithFormat:@"auto-set(%@) | assetSetIdentifier:%@", *(void *)(a1 + 40), *(void *)(a1 + 48)], +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(void *)(a1 + 56)), id v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v7 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v7 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedCheckAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS", buf, 0x20u);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_successCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetStatus:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = [(MAAutoAssetSet *)self completionDispatchQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __95__MAAutoAssetSet__successCurrentSetStatus_forAssetSetIdentifier_withAssetSetStatus_completion___block_invoke;
    v17[3] = &unk_1E6005F08;
    id v18 = v10;
    id v19 = v11;
    id v21 = v13;
    id v20 = v12;
    dispatch_async(v14, v17);

    __int16 v15 = v18;
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4FA56C8] sharedLogger];
    __int16 v15 = [v16 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successCurrentSetStatus:forAssetSetIdentifier:withAssetSetStatus:completion:]();
    }
  }
}

uint64_t __95__MAAutoAssetSet__successCurrentSetStatus_forAssetSetIdentifier_withAssetSetStatus_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successCurrentSetStatus:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)_failedCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    id v19 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6005EE0;
    id v27 = v16;
    int64_t v32 = a5;
    id v28 = v14;
    id v29 = v15;
    id v30 = v17;
    id v31 = v18;
    dispatch_async(v19, block);

    id v20 = v27;
  }
  else
  {
    id v21 = [NSString alloc];
    if (v16)
    {
      id v22 = [v16 checkedDescription];
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }
    else
    {
      id v22 = +[MAAutoAssetError summaryForCode:a5 fromOperation:v14];
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }
    id v20 = (void *)v23;

    id v24 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v25 = [v24 oslog];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v14;
      __int16 v35 = 2114;
      uint64_t v36 = v20;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_error_impl(&dword_1B275B000, v25, OS_LOG_TYPE_ERROR, "MA-auto-set{_failedCurrentSetStatus:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block", buf, 0x20u);
    }
  }
}

void __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 72)) != 0
    && (v6 = (void *)[[NSString alloc] initWithFormat:@"auto-set(%@) | assetSetIdentifier:%@", *(void *)(a1 + 40), *(void *)(a1 + 48)], +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(void *)(a1 + 56)), id v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v7 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v7 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedCurrentSetStatus:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS", buf, 0x20u);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_lockAtomicStatusProgress:(id)a3 lockAtomicError:(id)a4 progressBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = +[MAAutoAssetSet frameworkDispatchQueue];
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    uint64_t v10 = [(MAAutoAssetSet *)self completionDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__MAAutoAssetSet__lockAtomicStatusProgress_lockAtomicError_progressBlock___block_invoke;
    v14[3] = &unk_1E60042B8;
    uint64_t v16 = v8;
    id v15 = v7;
    dispatch_async(v10, v14);

    uint64_t v11 = v16;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v11 = [v12 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [v7 summary];
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl(&dword_1B275B000, v11, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_lockAtomicStatusProgress} | no client progress block | %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __74__MAAutoAssetSet__lockAtomicStatusProgress_lockAtomicError_progressBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_successLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 lockedAtomicInstance:(id)a5 lockedAtomicEntries:(id)a6 sandboxExtension:(id)a7 sandboxExtensionPath:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if (v19)
  {
    +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:a7 forPath:a8];
    id v20 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __149__MAAutoAssetSet__successLockAtomic_forAssetSetIdentifier_lockedAtomicInstance_lockedAtomicEntries_sandboxExtension_sandboxExtensionPath_completion___block_invoke;
    block[3] = &unk_1E6005EB8;
    id v24 = v15;
    id v25 = v16;
    id v28 = v19;
    id v26 = v17;
    id v27 = v18;
    dispatch_async(v20, block);

    id v21 = v24;
  }
  else
  {
    id v22 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v21 = [v22 oslog];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successLockAtomic:forAssetSetIdentifier:lockedAtomicInstance:lockedAtomicEntries:sandboxExtension:sandboxExtensionPath:completion:]();
    }
  }
}

uint64_t __149__MAAutoAssetSet__successLockAtomic_forAssetSetIdentifier_lockedAtomicInstance_lockedAtomicEntries_sandboxExtension_sandboxExtensionPath_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successLockAtomic:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (void)_failedLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    id v19 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6005EE0;
    id v27 = v16;
    int64_t v32 = a5;
    id v28 = v14;
    id v29 = v15;
    id v30 = v17;
    id v31 = v18;
    dispatch_async(v19, block);

    id v20 = v27;
  }
  else
  {
    id v21 = [NSString alloc];
    if (v16)
    {
      id v22 = [v16 checkedDescription];
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }
    else
    {
      id v22 = +[MAAutoAssetError summaryForCode:a5 fromOperation:v14];
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }
    id v20 = (void *)v23;

    id v24 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v25 = [v24 oslog];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v14;
      __int16 v35 = 2114;
      uint64_t v36 = v20;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_error_impl(&dword_1B275B000, v25, OS_LOG_TYPE_ERROR, "MA-auto-set{_failedLockAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block", buf, 0x20u);
    }
  }
}

void __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 72)) != 0
    && (v6 = (void *)[[NSString alloc] initWithFormat:@"auto-set(%@) | assetSetIdentifier:%@", *(void *)(a1 + 40), *(void *)(a1 + 48)], +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(void *)(a1 + 56)), id v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v7 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v7 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedLockAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS", buf, 0x20u);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_successMapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 forMappedSelector:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = [(MAAutoAssetSet *)self completionDispatchQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __94__MAAutoAssetSet__successMapLockedAtomicEntry_forAtomicInstance_forMappedSelector_completion___block_invoke;
    void v18[3] = &unk_1E6005F30;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    id v22 = v13;
    dispatch_async(v14, v18);

    __int16 v15 = v19;
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4FA56C8] sharedLogger];
    __int16 v15 = [v16 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v12)
      {
        uint64_t v17 = [v12 summary];
      }
      else
      {
        uint64_t v17 = @"N";
      }
      *(_DWORD *)buf = 138543874;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v11;
      __int16 v27 = 2114;
      id v28 = v17;
      _os_log_error_impl(&dword_1B275B000, v15, OS_LOG_TYPE_ERROR, "MA-auto-set{_successMapLockedAtomicEntry:%{public}@}| assetSetAtomicInstance:%{public}@ | mappedSelector:%{public}@ | no client completion block", buf, 0x20u);
      if (v12) {
    }
      }
  }
}

uint64_t __94__MAAutoAssetSet__successMapLockedAtomicEntry_forAtomicInstance_forMappedSelector_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) summary];
    int v8 = 138543874;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successMapLockedAtomicEntry:%{public}@} | assetSetAtomicInstance:%{public}@ | mappedSelector:%{public}@ | SUCCESS", (uint8_t *)&v8, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_failedMapLockedAtomicEntry:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    id v19 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6005EE0;
    id v27 = v16;
    int64_t v32 = a5;
    id v28 = v14;
    id v29 = v15;
    id v30 = v17;
    id v31 = v18;
    dispatch_async(v19, block);

    id v20 = v27;
  }
  else
  {
    id v21 = [NSString alloc];
    if (v16)
    {
      id v22 = [v16 checkedDescription];
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }
    else
    {
      id v22 = +[MAAutoAssetError summaryForCode:a5 fromOperation:v14];
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }
    id v20 = (void *)v23;

    id v24 = [MEMORY[0x1E4FA56C8] sharedLogger];
    __int16 v25 = [v24 oslog];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v14;
      __int16 v35 = 2114;
      uint64_t v36 = v20;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_error_impl(&dword_1B275B000, v25, OS_LOG_TYPE_ERROR, "MA-auto-set{_failedMapLockedAtomicEntry:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block", buf, 0x20u);
    }
  }
}

void __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 72)) != 0
    && (v6 = (void *)[[NSString alloc] initWithFormat:@"auto-set(%@) | assetSetIdentifier:%@", *(void *)(a1 + 40), *(void *)(a1 + 48)], +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(void *)(a1 + 56)), id v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v7 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v7 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedMapLockedAtomicEntry:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS", buf, 0x20u);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_successFormSubAtomicInstance:(id)a3 formedSubAtomicInstance:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__MAAutoAssetSet__successFormSubAtomicInstance_formedSubAtomicInstance_completion___block_invoke;
    block[3] = &unk_1E60056D0;
    __int16 v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, block);

    uint64_t v12 = v15;
  }
  else
  {
    __int16 v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v12 = [v13 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successFormSubAtomicInstance:formedSubAtomicInstance:completion:]();
    }
  }
}

uint64_t __83__MAAutoAssetSet__successFormSubAtomicInstance_formedSubAtomicInstance_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successFormSubAtomicInstance:%{public}@} | subAtomicInstance:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_failedFormSubAtomicInstance:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }
  else
  {
    id v18 = [NSString alloc];
    if (v13)
    {
      id v19 = [v13 checkedDescription];
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }
    else
    {
      id v19 = +[MAAutoAssetError summaryForCode:a4 fromOperation:v12];
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }
    id v17 = (void *)v20;

    id v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _failedFormSubAtomicInstance:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (v6 = (void *)[[NSString alloc] initWithFormat:@"auto-set(%@)", *(void *)(a1 + 40)], +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(void *)(a1 + 48)), id v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, v2);
    }
  }
  else
  {
    int v7 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v7 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedFormSubAtomicInstance:%{public}@} | %{public}@ | SUCCESS", buf, 0x16u);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_successOperation:(id)a3 forAssetSetIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MAAutoAssetSet__successOperation_forAssetSetIdentifier_completion___block_invoke;
    block[3] = &unk_1E60056D0;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, block);

    __int16 v12 = v15;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
    __int16 v12 = [v13 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successOperation:forAssetSetIdentifier:completion:]();
    }
  }
}

uint64_t __69__MAAutoAssetSet__successOperation_forAssetSetIdentifier_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successOperation:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_failedOperation:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    id v19 = [(MAAutoAssetSet *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    id v27 = v16;
    int64_t v31 = a5;
    id v28 = v14;
    id v29 = v17;
    id v30 = v18;
    dispatch_async(v19, block);

    uint64_t v20 = v27;
  }
  else
  {
    id v21 = [NSString alloc];
    if (v16)
    {
      id v22 = [v16 checkedDescription];
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }
    else
    {
      id v22 = +[MAAutoAssetError summaryForCode:a5 fromOperation:v14];
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }
    uint64_t v20 = (void *)v23;

    id v24 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v25 = [v24 oslog];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (v6 = (void *)[[NSString alloc] initWithFormat:@"auto-set(%@)", *(void *)(a1 + 40)], +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(void *)(a1 + 48)), id v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, v2);
    }
  }
  else
  {
    int v7 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v4 = [v7 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedOperation:%{public}@} | %{public}@ | SUCCESS", buf, 0x16u);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_setDefaultQueueOnce != -1) {
    dispatch_once(&defaultDispatchQueue_setDefaultQueueOnce, &__block_literal_global_770);
  }
  id v2 = (void *)defaultDispatchQueue_setDefaultQueue;
  return v2;
}

void __38__MAAutoAssetSet_defaultDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetset.client" UTF8String];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  id v2 = (void *)defaultDispatchQueue_setDefaultQueue;
  defaultDispatchQueue_setDefaultQueue = (uint64_t)v1;
}

+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)setClientDomainName:(id)a3
{
}

- (void)setAutoAssetSetClientName:(id)a3
{
}

- (void)setAssetSetIdentifier:(id)a3
{
}

- (void)setAutoAssetEntries:(id)a3
{
}

- (NSString)updateCategoryDesiredByClient
{
  return self->_updateCategoryDesiredByClient;
}

- (void)setUpdateCategoryDesiredByClient:(id)a3
{
}

- (void)alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"alterEntriesRepresentingAtomic"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{alterEntriesRepresentingAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)needForAtomic:withNeedPolicy:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"needForAtomic"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{needForAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"checkAtomic"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{checkAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"lockAtomic"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{lockAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"mapLockedAtomicEntry"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{mapLockedAtomicEntry} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"formSubAtomicInstance"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{formSubAtomicInstance} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"continueAtomicLock"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{continueAtomicLock} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)endAtomicLock:ofAtomicInstance:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"endAtomicLock"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{endAtomicLock} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)assetSetForStaging:asEntriesWhenTargeting:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"assetSetForStaging"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{assetSetForStaging} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)currentSetStatus:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"currentSetStatus"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{currentSetStatus} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_12(a1, a2), "summary");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | unable to locate byAssetSetIdentifier when ending SHORT-TERM locks for all lock reasons | shortTermLock:%@", v5, v6, v7, v8, v9);
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_12(a1, a2), "summary");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | unable to locate byAtomicInstance when ending SHORT-TERM locks for all lock reasons | shortTermLock:%@", v5, v6, v7, v8, v9);
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_12(a1, a2), "summary");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | inconsistent totalLockCount (ending last lock) | shortTermLock:%@", v5, v6, v7, v8, v9);
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_12(a1, a2), "summary");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | inconsistent totalLockCount (not last lock) | shortTermLock:%@", v5, v6, v7, v8, v9);
}

- (void)_closeAndRemoveShortTermLock:(uint64_t)a1 forShortTermLock:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 summary];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock} | WARNING | invalid lockedFileDesciptor | shortTermLock:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_closeAndRemoveShortTermLock:(uint64_t)a1 forShortTermLock:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 summary];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock} | WARNING | unable to locate byAssetSetIdentifier when ending SHORT-TERM lock | shortTermLock:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_closeAndRemoveShortTermLock:(uint64_t)a1 forShortTermLock:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 summary];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock} | WARNING | unable to locate byAtomicInstance when ending SHORT-TERM lock | shortTermLock:%{public}@", v5, v6, v7, v8, v9);
}

+ (void)endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+endAtomicLocks"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{+endAtomicLocks} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"_endAtomicLocks"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{_endAtomicLocks} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)eliminateAtomic:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+eliminateAtomic"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{+eliminateAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_eliminateAtomic:awaitingUnlocked:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"_eliminateAtomic"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set{_eliminateAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

void __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto-set{connectToServerFrameworkCompletion} unable to create shared SUCoreConnectClient for the client process", v2, v3, v4, v5, v6);
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto-set{_newProxyObjectForSetProgressBlock} | Unable to capture retained strong self reference", v2, v3, v4, v5, v6);
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto-set{_newProxyObjectForSetProgressBlock} | no progress provided | no progress reported to client at this time", v2, v3, v4, v5, v6);
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto-set{_newProxyObjectForSetProgressBlock} | no progress provided | unexpected type for setStatusWithProgress", v2, v3, v4, v5, v6);
}

- (void)_successCheckAtomic:forAssetSetIdentifier:newerInstanceDiscovered:discoveredAtomicEntries:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set{_successCheckAtomic:%{public}@}| assetSetIdentifier:%{public}@ | no client completion block");
}

void __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(a1, a2), "checkedDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_1(&dword_1B275B000, v3, v4, "MA-auto-set{_failedCheckAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successCurrentSetStatus:forAssetSetIdentifier:withAssetSetStatus:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set{_successCurrentSetStatus:%{public}@}| assetSetIdentifier:%{public}@ | no client completion block");
}

void __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(a1, a2), "checkedDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_1(&dword_1B275B000, v3, v4, "MA-auto-set{_failedCurrentSetStatus:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successLockAtomic:forAssetSetIdentifier:lockedAtomicInstance:lockedAtomicEntries:sandboxExtension:sandboxExtensionPath:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set{_successLockAtomic:%{public}@}| assetSetIdentifier:%{public}@ | no client completion block");
}

void __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(a1, a2), "checkedDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_1(&dword_1B275B000, v3, v4, "MA-auto-set{_failedLockAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@", v5, v6, v7, v8, v9);
}

void __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(a1, a2), "checkedDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_1(&dword_1B275B000, v3, v4, "MA-auto-set{_failedMapLockedAtomicEntry:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successFormSubAtomicInstance:formedSubAtomicInstance:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set{_successFormSubAtomicInstance:%{public}@}| subAtomicInstance:%{public}@ | no client completion block");
}

- (void)_failedFormSubAtomicInstance:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set{_failedFormSubAtomicInstance:%{public}@} | %{public}@ | no client completion block");
}

void __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 checkedDescription];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_14(&dword_1B275B000, v3, v4, "MA-auto-set{_failedFormSubAtomicInstance:%{public}@} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successOperation:forAssetSetIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set{_successOperation:%{public}@} | assetSetIdentifier:%{public}@ | no client completion block");
}

- (void)_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set{_failedOperation:%{public}@} | no client completion block | %{public}@");
}

void __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 checkedDescription];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_14(&dword_1B275B000, v3, v4, "MA-auto-set{_failedOperation:%{public}@} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

@end