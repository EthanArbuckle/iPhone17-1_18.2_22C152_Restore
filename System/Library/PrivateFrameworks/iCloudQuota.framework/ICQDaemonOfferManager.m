@interface ICQDaemonOfferManager
+ (NSString)ckBackupDeviceID;
+ (id)getCkBackupDeviceIDWithCompletionHandler:(id)a3;
+ (id)sharedDaemonOfferManager;
- (BOOL)_isCacheValidForRequestType:(int64_t)a3 offerStubs:(id)a4;
- (BOOL)_isCachedDaemonOfferValid:(id)a3 forAccount:(id)a4;
- (BOOL)_useFetchOffersDataDirectly;
- (BOOL)isBuddyOfferEnabled;
- (BOOL)isLegacyDeviceStorageLevelNotificationEnabled;
- (BOOL)isSimulatedDeviceStorageAlmostFull;
- (BOOL)shouldDirectToStorageManagement;
- (Class)_classForOfferStub:(id)a3;
- (Class)_daemonOfferClassForRequestType:(int64_t)a3;
- (Class)daemonOfferClassFromBundleId:(id)a3 options:(id)a4;
- (ICQDaemonOfferManager)init;
- (ICQDaemonOfferManager)initWithAccountManager:(id)a3;
- (NSNumber)simulatedPhotosLibrarySize;
- (NSURLSession)sharedURLSession;
- (_ICQAccountManager)accountManager;
- (_TtC11iCloudQuota15ICQTaskLimiters)taskLimiters;
- (id)_getFetchOfferStubsFromStubs:(id)a3;
- (id)_getHandlerForBundleId:(id)a3 options:(id)a4;
- (id)_getStubsForRequestType:(int64_t)a3 fromDaemonStubs:(id)a4;
- (id)_placeholderOfferForAccount:(id)a3 requestType:(int64_t)a4 error:(id)a5;
- (id)_storageManagementFollowupActions;
- (id)_storageManagementFollowupItem;
- (id)_storageManagementFollowupNotification;
- (id)soonestOfferOrStubExpirationDate;
- (unint64_t)daemonOfferSource;
- (void)_clearCachedStubsIfOfferIDIsNew:(id)a3;
- (void)_clearStorageManagementFollowup;
- (void)_coalescedDaemonOfferStubsDictionaryForAccount:(id)a3 requestType:(int64_t)a4 quotaReason:(id)a5 completion:(id)a6;
- (void)_coalescedFetchDaemonOfferForAccount:(id)a3 stub:(id)a4 notificationID:(id)a5 completion:(id)a6;
- (void)_coalescedReconsiderOffersForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 options:(id)a6 choiceHandler:(id)a7 completion:(id)a8;
- (void)_daemonLocalOfferStubsDictionaryForAccount:(id)a3 requestType:(int64_t)a4 completion:(id)a5;
- (void)_daemonOfferStubsDictionaryForAccount:(id)a3 requestType:(int64_t)a4 quotaReason:(id)a5 completion:(id)a6;
- (void)_fetchDaemonOfferForAccount:(id)a3 stub:(id)a4 notificationID:(id)a5 completion:(id)a6;
- (void)_fetchDaemonOfferStubsForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 completion:(id)a6;
- (void)_fetchDictionaryForAccount:(id)a3 quotaKey:(id)a4 quotaReason:(id)a5 stub:(id)a6 notificationID:(id)a7 contextDictionary:(id)a8 mlDaemonExtraFields:(id)a9 completion:(id)a10;
- (void)_handlerMultipleStubs:(id)a3 forAccount:(id)a4 requestType:(int64_t)a5 completion:(id)a6;
- (void)_logErrorsForFetchOfferResultWithOffer:(id)a3 error:(id)a4 isForBuddy:(BOOL)a5;
- (void)_mockFetchDictionaryForAccount:(id)a3 quotaKey:(id)a4 stub:(id)a5 notificationID:(id)a6 contextDictionary:(id)a7 completion:(id)a8;
- (void)_persistAndNotifyMissingPlaceholdersForRequestType:(int64_t)a3 account:(id)a4;
- (void)_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:(int64_t)a3;
- (void)_postFollowupForDaemonOffer:(id)a3 replaceExisting:(BOOL)a4 completion:(id)a5;
- (void)_postOfferType:(id)a3 isForBuddy:(BOOL)a4;
- (void)_postStorageManagementFollowup;
- (void)_postUserNotification:(id)a3 replaceExisting:(BOOL)a4 offerID:(id)a5 completion:(id)a6;
- (void)_processOfferStub:(id)a3 account:(id)a4 offerType:(int64_t)a5 completion:(id)a6;
- (void)_processPushNotificationCheckHardwareIDWithDictionary:(id)a3 completion:(id)a4;
- (void)_processPushNotificationDictionary:(id)a3 completion:(id)a4;
- (void)_reconsiderLocalOffersWithReason:(id)a3 account:(id)a4 completion:(id)a5;
- (void)_reconsiderOffersForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 choiceHandler:(id)a6 completion:(id)a7;
- (void)_reconsiderOffersForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 options:(id)a6 choiceHandler:(id)a7 completion:(id)a8;
- (void)_showDaemonAlertForOffer:(id)a3 notificationDictionary:(id)a4 store:(id)a5 account:(id)a6 completion:(id)a7;
- (void)_subdDisplayDelayedOfferWithContext:(id)a3 completion:(id)a4;
- (void)_subdFetchDaemonOfferForAccount:(id)a3 stub:(id)a4 notificationID:(id)a5 isoNewOfferResponse:(id)a6 completion:(id)a7;
- (void)_subdFetchNewOfferResponseWithContent:(id)a3 andMaxDelaySecs:(id)a4 completion:(id)a5;
- (void)_subdHandleFetchOffersStub:(id)a3 account:(id)a4 requestType:(int64_t)a5 group:(id)a6 completion:(id)a7;
- (void)_subdRefreshOfferDetailsAndDisplay:(id)a3 completion:(id)a4 account:(id)a5 accountStore:(id)a6 notificationID:(id)a7 isoNewOfferResponse:(id)a8;
- (void)_subdStopFailsafeActivity;
- (void)_subdTearDown;
- (void)_teardownCachedBuddyOffer;
- (void)_teardownCachedDefaultOfferAndNotify:(BOOL)a3;
- (void)_teardownCachedEventOfferAndNotify:(BOOL)a3;
- (void)_teardownCachedOfferAndNotify:(BOOL)a3;
- (void)_teardownCachedOffersAndNotify:(BOOL)a3;
- (void)_teardownCachedPremiumOfferAndNotify:(BOOL)a3;
- (void)_updateOffer:(id)a3 buttonId:(id)a4 info:(id)a5 account:(id)a6 accountStore:(id)a7 completion:(id)a8;
- (void)_updateQuotaForAccount:(id)a3 withServerDictionary:(id)a4;
- (void)addCommonHeadersToRequest:(id)a3;
- (void)addPremiumOffersHeaderIfNeededForRequest:(id)a3;
- (void)clearAllFollowupsWithCompletion:(id)a3;
- (void)clearFollowupsOfferType:(int64_t)a3 completion:(id)a4;
- (void)clearLegacyFollowups;
- (void)daemonBuddyOfferDictionaryForAccount:(id)a3 completion:(id)a4;
- (void)daemonOfferDictionaryForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4;
- (void)forcePostFollowup;
- (void)postBuddyOfferType:(id)a3;
- (void)postOfferType:(id)a3;
- (void)reconsiderOffersWithCompletion:(id)a3;
- (void)reconsiderOffersWithReason:(id)a3 reuseLocalOffers:(BOOL)a4 completion:(id)a5;
- (void)renewCredentialsWithCompletion:(id)a3;
- (void)setBuddyOfferEnabled:(BOOL)a3;
- (void)setLegacyDeviceStorageLevelNotificationEnabled:(BOOL)a3;
- (void)setShouldDirectToStorageManagement:(BOOL)a3;
- (void)setSimulatedDeviceStorageAlmostFull:(BOOL)a3;
- (void)setSimulatedPhotosLibrarySize:(id)a3;
- (void)setTaskLimiters:(id)a3;
- (void)startDirectingToStorageManagement;
- (void)stopDirectingToStorageManagement;
- (void)tearDownCachedEventOffer;
- (void)tearDownCachedPremiumOffer;
- (void)teardownCachedOffer;
- (void)teardownCachedOffers;
- (void)teardownOffersForAccount:(id)a3 completion:(id)a4;
- (void)updateOfferForAccount:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7;
@end

@implementation ICQDaemonOfferManager

+ (id)sharedDaemonOfferManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ICQDaemonOfferManager_sharedDaemonOfferManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonOfferManager_onceToken != -1) {
    dispatch_once(&sharedDaemonOfferManager_onceToken, block);
  }
  v2 = (void *)sharedDaemonOfferManager_sDaemonOfferManager;
  return v2;
}

- (void)stopDirectingToStorageManagement
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  [(ICQDaemonOfferManager *)v2 _clearStorageManagementFollowup];
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[ICQDaemonOfferManager stopDirectingToStorageManagement]";
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "%s successfully cleared CFU", (uint8_t *)&v5, 0xCu);
  }

  if ([(ICQDaemonOfferManager *)v2 shouldDirectToStorageManagement])
  {
    [(ICQDaemonOfferManager *)v2 setShouldDirectToStorageManagement:0];
  }
  else
  {
    v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[ICQDaemonOfferManager stopDirectingToStorageManagement]";
    }
  }
  objc_sync_exit(v2);
}

- (BOOL)shouldDirectToStorageManagement
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"_ICQShouldDirectToStorageManagement", @"com.apple.cloud.quota", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  BOOL v3 = !v2;
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = @"NO";
    if (v3) {
      int v5 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    v9 = "-[ICQDaemonOfferManager shouldDirectToStorageManagement]";
    __int16 v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "%s: returning value %{public}@.", buf, 0x16u);
  }

  return v3;
}

- (void)_clearStorageManagementFollowup
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  followUpController = self->_followUpController;
  id v9 = 0;
  [(FLFollowUpController *)followUpController clearPendingFollowUpItemsWithUniqueIdentifiers:&unk_1F2DE1AC8 error:&v9];
  id v3 = v9;
  v4 = _ICQGetLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      v6 = "Error clearing Storage Management followup; error: %{public}@";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "Cleared Storage Management followup";
    uint64_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

- (id)soonestOfferOrStubExpirationDate
{
  BOOL v2 = +[ICQDaemonPersisted persistedObject];
  uint64_t v3 = [v2 expirationDate];

  v4 = +[ICQDaemonPersisted persistedObject];
  uint64_t v5 = [v4 expirationDate];

  if (v3 | v5)
  {
    if (v3) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (v5) {
        uint64_t v7 = (void *)v5;
      }
      else {
        uint64_t v7 = (void *)v3;
      }
      id v9 = v7;
    }
    else
    {
      id v9 = [(id)v3 earlierDate:v5];
    }
    uint32_t v8 = v9;
  }
  else
  {
    uint32_t v8 = 0;
  }

  return v8;
}

- (void)reconsiderOffersWithReason:(id)a3 reuseLocalOffers:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(ICQDaemonOfferManager *)self accountManager];
  id v11 = [v10 accountStore];

  uint64_t v12 = objc_msgSend(v11, "aa_primaryAppleAccount");
  if (v6)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__ICQDaemonOfferManager_reconsiderOffersWithReason_reuseLocalOffers_completion___block_invoke;
    v19[3] = &unk_1E6A528F8;
    v19[4] = self;
    id v21 = v11;
    id v22 = v9;
    id v20 = v8;
    id v13 = v9;
    id v14 = v11;
    [(ICQDaemonOfferManager *)self _reconsiderLocalOffersWithReason:v20 account:v12 completion:v19];
  }
  else
  {
    +[ICQDaemonPersisted clearPersistedObject];
    v23 = @"isForFetchOffers";
    v24[0] = MEMORY[0x1E4F1CC38];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__ICQDaemonOfferManager_reconsiderOffersWithReason_reuseLocalOffers_completion___block_invoke_2;
    v16[3] = &unk_1E6A52920;
    id v17 = v11;
    id v18 = v9;
    id v15 = v9;
    id v13 = v11;
    [(ICQDaemonOfferManager *)self _reconsiderOffersForAccount:v12 isForBuddy:0 quotaReason:v8 options:v14 choiceHandler:0 completion:v16];
  }
}

- (_ICQAccountManager)accountManager
{
  return self->_accountManager;
}

void __98__ICQDaemonOfferManager__daemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 6);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _coalescedDaemonOfferStubsDictionaryForAccount:a1[4] requestType:a1[7] quotaReason:a1[5] completion:v4];
}

uint64_t __80__ICQDaemonOfferManager_reconsiderOffersWithReason_reuseLocalOffers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Finished getting stubs", buf, 2u);
  }

  if (v5 && !v6)
  {
    id v8 = [[ICQDaemonOfferStubs alloc] initWithDictionary:v5];
    if (!v8)
    {
      v27 = _ICQGetLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v5;
        _os_log_impl(&dword_1D5851000, v27, OS_LOG_TYPE_DEFAULT, "Error: Unable to create offer stubs from dict %@", buf, 0xCu);
      }

      v28 = _ICQGetLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v28, OS_LOG_TYPE_DEFAULT, "Persisting placeholder & clearing any existing followups", buf, 2u);
      }

      id v9 = ICQCreateErrorWithMessage(996, @"malformed daemon offer stubs");
      if (*(unsigned char *)(a1 + 80)) {
        uint64_t v29 = 4;
      }
      else {
        uint64_t v29 = 3;
      }
      id v17 = [*(id *)(a1 + 32) _placeholderOfferForAccount:*(void *)(a1 + 40) requestType:v29 error:v9];
      [v17 persistObject];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_38;
    }
    id v9 = objc_opt_new();
    uint64_t v10 = *(void *)(a1 + 64);
    if (v10
      && ((*(void (**)(uint64_t, ICQDaemonOfferStubs *))(v10 + 16))(v10, v8),
          id v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      uint64_t v12 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      id v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v12;
        _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "Choice handler block returned stub %@", buf, 0xCu);
      }

      if (v12)
      {
        v43 = v12;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];

        id v9 = (void *)v14;
      }
    }
    else
    {
      [*(id *)(a1 + 32) _getStubsForRequestType:*(void *)(a1 + 72) fromDaemonStubs:v8];
      v9 = uint64_t v12 = v9;
    }

    v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_384];
    id v17 = [v9 filteredArrayUsingPredicate:v16];

    if ([v17 count])
    {
      if ([v17 count] != 1)
      {
        [*(id *)(a1 + 32) _handlerMultipleStubs:v17 forAccount:*(void *)(a1 + 40) requestType:*(void *)(a1 + 72) completion:*(void *)(a1 + 48)];
LABEL_38:

        goto LABEL_39;
      }
      id v18 = [v17 firstObject];
      v19 = [v18 serverDictionary];
      BOOL v20 = +[ICQMLProtocolParser shouldCallMlDaemonForFetchOfferStub:v19];

      if (v20)
      {
        id v21 = [MEMORY[0x1E4FB8348] shared];
        id v22 = [v18 serverDictionary];
        v23 = [v21 parseNotification:v22];

        v24 = [v18 serverDictionary];
        v25 = +[ICQMLProtocolParser parseMaxDelaySecsFromFetchOffersResponse:v24];

        v26 = *(void **)(a1 + 32);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_385;
        v38[3] = &unk_1E6A52DD8;
        v38[4] = v26;
        id v39 = *(id *)(a1 + 40);
        id v40 = v18;
        char v42 = *(unsigned char *)(a1 + 80);
        id v41 = *(id *)(a1 + 56);
        [v26 _subdFetchNewOfferResponseWithContent:v23 andMaxDelaySecs:v25 completion:v38];
      }
      else
      {
        v33 = *(void **)(a1 + 32);
        uint64_t v34 = *(void *)(a1 + 40);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3_387;
        v35[3] = &unk_1E6A52DB0;
        v35[4] = v33;
        char v37 = *(unsigned char *)(a1 + 80);
        id v36 = *(id *)(a1 + 56);
        [v33 _fetchDaemonOfferForAccount:v34 stub:v18 notificationID:0 completion:v35];
      }
    }
    else
    {
      if (*(void *)(a1 + 72) == 1)
      {
        v30 = _ICQGetLogSystem();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3_cold_1(v30);
        }
      }
      v31 = _ICQGetLogSystem();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:*(void *)(a1 + 72)];
        *(_DWORD *)buf = 138412290;
        id v45 = v32;
        _os_log_impl(&dword_1D5851000, v31, OS_LOG_TYPE_DEFAULT, "No stub matched for %@ offer -- persisting placeholder", buf, 0xCu);
      }
      id v18 = [*(id *)(a1 + 32) _placeholderOfferForAccount:*(void *)(a1 + 40) requestType:*(void *)(a1 + 72) error:0];
      [v18 persistObject];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }

    goto LABEL_38;
  }
  id v15 = _ICQGetLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v6;
    _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "Unable to get offer stubs; error: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_39:
}

uint64_t __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke(void *a1)
{
  BOOL v2 = a1 + 5;
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v3 = _ICQSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = *v2;
  if (*v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ReconsiderOffers", "", v8, 2u);
  }

  id v6 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_cold_1();
  }

  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void __109__ICQDaemonOfferManager__reconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 64);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _coalescedReconsiderOffersForAccount:*(void *)(a1 + 32) isForBuddy:*(unsigned __int8 *)(a1 + 72) quotaReason:*(void *)(a1 + 40) options:*(void *)(a1 + 48) choiceHandler:*(void *)(a1 + 56) completion:v4];
}

- (void)_reconsiderOffersForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 options:(id)a6 choiceHandler:(id)a7 completion:(id)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v28 = a5;
  id v15 = a6;
  id v29 = a7;
  id v16 = a8;
  id v17 = [v15 objectForKeyedSubscript:@"bundleIdentifier"];
  id v18 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:v15 bundleId:v17 isBuddy:v12]);
  v19 = NSString;
  BOOL v20 = objc_msgSend(v14, "aa_altDSID");
  id v21 = [v19 stringWithFormat:@"%@", v20];
  id v22 = [v21 stringByAppendingString:v18];

  objc_initWeak(&location, self);
  v23 = [(ICQDaemonOfferManager *)self taskLimiters];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __109__ICQDaemonOfferManager__reconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke;
  v30[3] = &unk_1E6A52CF0;
  objc_copyWeak(&v35, &location);
  id v24 = v14;
  id v31 = v24;
  BOOL v36 = v12;
  id v25 = v28;
  id v32 = v25;
  id v26 = v15;
  id v33 = v26;
  id v27 = v29;
  id v34 = v27;
  [v23 performClosureNoParamsWithIdentifier:v22 task:v30 completion:v16];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (void)_reconsiderLocalOffersWithReason:(id)a3 account:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Reconsidering local offers", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke;
  v12[3] = &unk_1E6A52948;
  id v13 = v7;
  id v14 = v8;
  v12[4] = self;
  id v10 = v7;
  id v11 = v8;
  [(ICQDaemonOfferManager *)self _daemonLocalOfferStubsDictionaryForAccount:v10 requestType:0 completion:v12];
}

- (void)_daemonOfferStubsDictionaryForAccount:(id)a3 requestType:(int64_t)a4 quotaReason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = NSString;
  id v14 = objc_msgSend(v10, "aa_altDSID");
  id v15 = [v13 stringWithFormat:@"%@", v14];
  id v16 = [v15 stringByAppendingString:@"FetchOffers"];

  objc_initWeak(&location, self);
  id v17 = [(ICQDaemonOfferManager *)self taskLimiters];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__ICQDaemonOfferManager__daemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke;
  v20[3] = &unk_1E6A529C0;
  objc_copyWeak(v23, &location);
  id v18 = v10;
  id v21 = v18;
  v23[1] = (id)a4;
  id v19 = v11;
  id v22 = v19;
  [v17 performWithIdentifier:v16 task:v20 completion:v12];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (_TtC11iCloudQuota15ICQTaskLimiters)taskLimiters
{
  return self->_taskLimiters;
}

- (void)_coalescedReconsiderOffersForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 options:(id)a6 choiceHandler:(id)a7 completion:(id)a8
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v14 = a6;
  id v39 = a7;
  id v15 = a8;
  id v40 = a5;
  id v16 = _ICQGetLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v59 = v14;
    _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "Reconsidering offers with options %@", buf, 0xCu);
  }

  id v41 = [v14 objectForKeyedSubscript:@"bundleIdentifier"];
  uint64_t v17 = +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", v14);
  id v18 = _ICQSignpostLogSystem();
  id v19 = objc_opt_new();
  os_signpost_id_t v20 = _ICQSignpostCreateWithObject(v18, v19);
  uint64_t v22 = v21;

  v23 = _ICQSignpostLogSystem();
  id v24 = v23;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    id v25 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:v17];
    *(_DWORD *)buf = 138412290;
    id v59 = v25;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "ReconsiderOffers", " enableTelemetry=YES %@", buf, 0xCu);
  }
  id v26 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[ICQDaemonOfferManager _coalescedReconsiderOffersForAccount:isForBuddy:quotaReason:options:choiceHandler:completion:](v20, v17, v26);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke;
  aBlock[3] = &unk_1E6A52D18;
  os_signpost_id_t v56 = v20;
  uint64_t v57 = v22;
  id v27 = v15;
  id v55 = v27;
  id v28 = _Block_copy(aBlock);
  switch(v17)
  {
    case 0:
      +[ICQDaemonPersisted clearPersistedObject];
      +[ICQDaemonAlert dismissAlertsWithNotificationID:0];
      +[ICQDaemonPersisted clearPersistedObject];
      +[ICQDaemonPersisted clearPersistedObject];
      +[ICQDaemonPersisted clearPersistedObject];
      id v29 = +[ICQLiftUICache sharedCache];
      [v29 discardCaches];

      goto LABEL_16;
    case 1:
      goto LABEL_12;
    case 2:
      v30 = ICQDaemonPremiumOffer;
      goto LABEL_15;
    case 4:
      +[ICQDaemonPersisted clearPersistedObject];
      v30 = ICQDaemonOfferStubs;
      goto LABEL_15;
    case 5:
      v30 = ICQDaemonEventOffer;
      goto LABEL_15;
    default:
      +[ICQDaemonAlert dismissAlertsWithNotificationID:0];
      +[ICQDaemonPersisted clearPersistedObject];
LABEL_12:
      v30 = ICQDaemonDefaultOffer;
LABEL_15:
      [(__objc2_class *)v30 clearPersistedObject];
LABEL_16:
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_375;
      v49[3] = &unk_1E6A52D68;
      v49[4] = self;
      uint64_t v52 = v17;
      id v31 = v38;
      id v50 = v31;
      BOOL v53 = a4;
      id v32 = v28;
      id v51 = v32;
      id v33 = _Block_copy(v49);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3;
      v42[3] = &unk_1E6A52E00;
      v42[4] = self;
      id v43 = v31;
      BOOL v48 = a4;
      id v44 = v32;
      id v45 = v33;
      id v46 = v39;
      uint64_t v47 = v17;
      id v34 = v39;
      id v35 = v33;
      id v36 = v31;
      id v37 = v32;
      [(ICQDaemonOfferManager *)self _daemonOfferStubsDictionaryForAccount:v36 requestType:v17 quotaReason:v40 completion:v42];

      return;
  }
}

- (void)_coalescedDaemonOfferStubsDictionaryForAccount:(id)a3 requestType:(int64_t)a4 quotaReason:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void))a6;
  [(ICQDaemonOfferManager *)self clearLegacyFollowups];
  id v13 = _ICQSignpostLogSystem();
  id v14 = objc_opt_new();
  os_signpost_id_t v15 = _ICQSignpostCreateWithObject(v13, v14);
  uint64_t v17 = v16;

  id v18 = _ICQSignpostLogSystem();
  id v19 = v18;
  unint64_t v20 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchOffers", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v21 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:]();
  }

  if (v10)
  {
    uint64_t v22 = +[ICQDaemonPersisted persistedObject];
    if ([v22 isValidForAccount:v10]
      && ([v22 isExpired] & 1) == 0
      && [(ICQDaemonOfferManager *)self _isCacheValidForRequestType:a4 offerStubs:v22])
    {
      v23 = _ICQGetLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v22 expirationDate];
        *(_DWORD *)buf = 138412290;
        id v37 = v24;
        _os_log_impl(&dword_1D5851000, v23, OS_LOG_TYPE_DEFAULT, "using cached offer stubs - expires %@", buf, 0xCu);
      }
      id v25 = [v22 _persistenceDictionary];
      v12[2](v12, v25, 0);

      _ICQSignpostGetNanoseconds(v15, v17);
      id v26 = _ICQSignpostLogSystem();
      id v27 = v26;
      if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D5851000, v27, OS_SIGNPOST_INTERVAL_END, v15, "FetchOffers", "", buf, 2u);
      }

      id v28 = _ICQSignpostLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:]();
      }
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __107__ICQDaemonOfferManager__coalescedDaemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke;
      v32[3] = &unk_1E6A529E8;
      os_signpost_id_t v34 = v15;
      uint64_t v35 = v17;
      id v33 = v12;
      [(ICQDaemonOfferManager *)self _fetchDaemonOfferStubsForAccount:v10 isForBuddy:a4 == 4 quotaReason:v11 completion:v32];
      id v28 = v33;
    }
  }
  else
  {
    id v29 = ICQCreateError(8);
    ((void (**)(id, void *, void *))v12)[2](v12, 0, v29);

    _ICQSignpostGetNanoseconds(v15, v17);
    v30 = _ICQSignpostLogSystem();
    id v31 = v30;
    if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v31, OS_SIGNPOST_INTERVAL_END, v15, "FetchOffers", "", buf, 2u);
    }

    uint64_t v22 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:]();
    }
  }
}

- (void)clearLegacyFollowups
{
}

- (void)_daemonLocalOfferStubsDictionaryForAccount:(id)a3 requestType:(int64_t)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a5;
  id v10 = _ICQSignpostLogSystem();
  id v11 = objc_opt_new();
  os_signpost_id_t v12 = _ICQSignpostCreateWithObject(v10, v11);
  uint64_t v14 = v13;

  os_signpost_id_t v15 = _ICQSignpostLogSystem();
  uint64_t v16 = v15;
  unint64_t v17 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v30) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchOffers", " enableTelemetry=YES ", (uint8_t *)&v30, 2u);
  }

  id v18 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:]();
  }

  if (v8)
  {
    id v19 = +[ICQDaemonPersisted persistedObject];
    if ([v19 isValidForAccount:v8]
      && ([v19 isExpired] & 1) == 0
      && [(ICQDaemonOfferManager *)self _isCacheValidForRequestType:a4 offerStubs:v19])
    {
      unint64_t v20 = _ICQGetLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v19 expirationDate];
        int v30 = 138412290;
        id v31 = v21;
        _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "using cached offer stubs - expires %@", (uint8_t *)&v30, 0xCu);
      }
      uint64_t v22 = [v19 _persistenceDictionary];
      v9[2](v9, v22, 0);
    }
    else
    {
      v23 = _ICQGetLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[ICQDaemonOfferManager _daemonLocalOfferStubsDictionaryForAccount:requestType:completion:](v23);
      }

      uint64_t v22 = ICQCreateError(11);
      ((void (**)(id, void *, void *))v9)[2](v9, 0, v22);
    }

    _ICQSignpostGetNanoseconds(v12, v14);
    id v24 = _ICQSignpostLogSystem();
    id v25 = v24;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      LOWORD(v30) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v25, OS_SIGNPOST_INTERVAL_END, v12, "FetchOffers", "", (uint8_t *)&v30, 2u);
    }

    id v26 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:]();
    }
  }
  else
  {
    id v27 = ICQCreateError(8);
    ((void (**)(id, void *, void *))v9)[2](v9, 0, v27);

    _ICQSignpostGetNanoseconds(v12, v14);
    id v28 = _ICQSignpostLogSystem();
    id v29 = v28;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      LOWORD(v30) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v29, OS_SIGNPOST_INTERVAL_END, v12, "FetchOffers", "", (uint8_t *)&v30, 2u);
    }

    id v19 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:]();
    }
  }
}

void __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v8 = [[ICQDaemonOfferStubs alloc] initWithDictionary:v5];
    id v9 = [(ICQDaemonOfferStubs *)v8 chooseStub];
    id v10 = [(ICQDaemonOfferStubs *)v8 choosePremiumStub];
    id v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    os_signpost_id_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_241;
    v24[3] = &unk_1E6A524A0;
    uint64_t v14 = v11;
    id v25 = v14;
    [v12 _processOfferStub:v9 account:v13 offerType:3 completion:v24];
    dispatch_group_enter(v14);
    os_signpost_id_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_2;
    v22[3] = &unk_1E6A524A0;
    v23 = v14;
    unint64_t v17 = v14;
    [v15 _processOfferStub:v10 account:v16 offerType:2 completion:v22];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_3;
    block[3] = &unk_1E6A528D0;
    id v21 = *(id *)(a1 + 48);
    dispatch_group_notify(v17, MEMORY[0x1E4F14428], block);

LABEL_9:
    goto LABEL_10;
  }
  id v18 = _ICQGetLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl(&dword_1D5851000, v18, OS_LOG_TYPE_DEFAULT, "Unable to get offer stubs; error: %@", buf, 0xCu);
  }

  uint64_t v19 = *(void *)(a1 + 48);
  if (!v7)
  {
    ICQCreateError(11);
    id v8 = (ICQDaemonOfferStubs *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, ICQDaemonOfferStubs *))(v19 + 16))(v19, v8);
    goto LABEL_9;
  }
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v7);
LABEL_10:
}

uint64_t __80__ICQDaemonOfferManager_reconsiderOffersWithReason_reuseLocalOffers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) reconsiderOffersWithReason:*(void *)(a1 + 40) reuseLocalOffers:0 completion:*(void *)(a1 + 56)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __49__ICQDaemonOfferManager_sharedDaemonOfferManager__block_invoke()
{
  sharedDaemonOfferManager_sDaemonOfferManager = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (ICQDaemonOfferManager)init
{
  uint64_t v3 = objc_alloc_init(_ICQAccountManager);
  id v4 = [(ICQDaemonOfferManager *)self initWithAccountManager:v3];

  return v4;
}

- (ICQDaemonOfferManager)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICQDaemonOfferManager;
  id v6 = [(ICQDaemonOfferManager *)&v24 init];
  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([MEMORY[0x1E4F4C010] sharedSessionWithNoUrlCache],
          id v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = objc_opt_respondsToSelector(),
          v7,
          (v8 & 1) != 0))
    {
      id v9 = _ICQGetLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Using AAA provided session.", v23, 2u);
      }

      id v10 = [MEMORY[0x1E4F4C010] sharedSessionWithNoUrlCache];
      uint64_t v11 = [v10 urlSession];
    }
    else
    {
      os_signpost_id_t v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Unable to use AAA provided session.", v23, 2u);
      }

      id v10 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:@"ICQFetchOfferURLSession"];
      objc_msgSend(v10, "set_appleIDContext:", v13);

      uint64_t v11 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v10];
    }
    sharedURLSession = v6->_sharedURLSession;
    v6->_sharedURLSession = (NSURLSession *)v11;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F5B768]) initWithClientIdentifier:@"com.apple.icloud.quota"];
    followUpController = v6->_followUpController;
    v6->_followUpController = (FLFollowUpController *)v15;

    objc_storeStrong((id *)&v6->_accountManager, a3);
    uint64_t v17 = objc_opt_new();
    taskLimiters = v6->_taskLimiters;
    v6->_taskLimiters = (_TtC11iCloudQuota15ICQTaskLimiters *)v17;

    id v19 = +[ICQDaemonOfferManager ckBackupDeviceID];
    uint64_t v20 = objc_opt_new();
    throttleController = v6->_throttleController;
    v6->_throttleController = (ICQNetworkThrottleController *)v20;
  }
  return v6;
}

- (void)daemonOfferDictionaryForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"bundleIdentifier"];
  if (![v11 isEqualToString:@"com.apple.purplebuddy"])
  {
    if (!v8)
    {
      os_signpost_id_t v12 = ICQCreateError(8);
      v10[2](v10, 0, v12);
LABEL_28:

      goto LABEL_29;
    }
    if (+[_ICQHelperFunctions backupRestoreCompletedInOptions:v9])
    {
      +[_ICQHelperFunctions setUserDefaultsBool:1 forKey:@"backupRestoreComplete"];
    }
    os_signpost_id_t v12 = [v9 objectForKeyedSubscript:@"contextDictionary"];
    if (v12)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke;
      v34[3] = &unk_1E6A52810;
      id v35 = v8;
      id v37 = v10;
      id v36 = v12;
      [(ICQDaemonOfferManager *)self _fetchDictionaryForAccount:v35 quotaKey:@"quotaFetchOffersURL" quotaReason:v11 stub:0 notificationID:0 contextDictionary:v36 mlDaemonExtraFields:0 completion:v34];

      uint64_t v13 = v35;
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v14 = [(ICQDaemonOfferManager *)self daemonOfferClassFromBundleId:v11 options:v9];
    uint64_t v15 = [(objc_class *)v14 persistedObject];
    uint64_t v13 = v15;
    if (v15)
    {
      if ([v15 isValidForAccount:v8])
      {
        int v16 = [v13 isExpired];
        uint64_t v17 = _ICQGetLogSystem();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (!v16)
        {
          if (v18)
          {
            *(_DWORD *)buf = 138412290;
            id v39 = v14;
            _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "Returning persisted daemon offer of class %@", buf, 0xCu);
          }

          id v21 = [v13 _persistenceDictionary];
          ((void (**)(id, void *, void *))v10)[2](v10, v21, 0);
          goto LABEL_26;
        }
        if (v18)
        {
          id v19 = [v13 retrievalDate];
          [v13 callbackInterval];
          *(_DWORD *)buf = 138543874;
          id v39 = v14;
          __int16 v40 = 2112;
          id v41 = v19;
          __int16 v42 = 2048;
          id v43 = v20;
          _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "Skipping persisted daemon offer of class %{public}@ because it expired: daemon offer retrieval date %@, callback interval: %f", buf, 0x20u);
        }
        id v21 = [v13 notificationID];
LABEL_20:
        if ([v21 length])
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_183;
          v30[3] = &unk_1E6A52860;
          void v30[4] = self;
          id v31 = v9;
          id v32 = v11;
          id v33 = v10;
          [(ICQDaemonOfferManager *)self _fetchDaemonOfferForAccount:v8 stub:0 notificationID:v21 completion:v30];
        }
        else
        {
          id v25 = [(ICQDaemonOfferManager *)self _getHandlerForBundleId:v11 options:v9];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_3;
          v26[3] = &unk_1E6A52888;
          v26[4] = self;
          id v27 = v11;
          id v28 = v9;
          id v29 = v10;
          [(ICQDaemonOfferManager *)self _reconsiderOffersForAccount:v8 isForBuddy:0 quotaReason:v27 options:v28 choiceHandler:v25 completion:v26];
        }
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v22 = _ICQGetLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v24 = [v13 accountAltDSID];
        v23 = objc_msgSend(v8, "aa_altDSID");
        *(_DWORD *)buf = 138544130;
        id v39 = v14;
        __int16 v40 = 2112;
        id v41 = v24;
        __int16 v42 = 2112;
        id v43 = v23;
        __int16 v44 = 2112;
        id v45 = v13;
        _os_log_impl(&dword_1D5851000, v22, OS_LOG_TYPE_DEFAULT, "Skipping persisted daemon offer of class %{public}@ due to account mismatch: daemon offer account alt dsid: %@, account alt dsid: %@. Persisted offer was %@", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v22 = _ICQGetLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = v14;
        _os_log_impl(&dword_1D5851000, v22, OS_LOG_TYPE_DEFAULT, "Did not find a persisted daemon offer of class %{public}@", buf, 0xCu);
      }
    }

    id v21 = 0;
    goto LABEL_20;
  }
  [(ICQDaemonOfferManager *)self daemonBuddyOfferDictionaryForAccount:v8 completion:v10];
LABEL_29:
}

void __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    int v16 = _ICQGetLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = a1[5];
      int v20 = 138412802;
      id v21 = v7;
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "error %@ fetching offers with context dictionary %{public}@ resulting in serverDict %@", (uint8_t *)&v20, 0x20u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v8 = [[ICQDaemonOfferStubs alloc] _initWithAccount:a1[4] serverDictionary:v5];
    id v9 = [v8 chooseFirstStub];
    if (v9)
    {
      id v10 = [ICQDaemonOffer alloc];
      uint64_t v11 = a1[4];
      os_signpost_id_t v12 = [v9 serverDictionary];
      id v13 = [(ICQDaemonOffer *)v10 _initWithAccount:v11 serverDictionary:v12];

      [v13 cacheLiftUIContent];
      uint64_t v14 = a1[6];
      uint64_t v15 = [v13 _persistenceDictionary];
      (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
    }
    else
    {
      BOOL v18 = _ICQGetLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D5851000, v18, OS_LOG_TYPE_DEFAULT, "context dictionary response is missing device offers", (uint8_t *)&v20, 2u);
      }

      uint64_t v19 = a1[6];
      ICQCreateErrorWithMessage(996, @"context dictionary response is missing device offers");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v13);
    }
  }
}

void __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_2;
  v13[3] = &unk_1E6A52838;
  id v7 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = *(id *)(a1 + 56);
  id v18 = v6;
  id v19 = v10;
  id v17 = v5;
  id v11 = v6;
  id v12 = v5;
  [v7 _postFollowupForDaemonOffer:v12 replaceExisting:1 completion:v13];
}

void __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 48), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", *(void *)(a1 + 32), *(void *)(a1 + 40), 0));
  uint64_t v2 = *(void *)(a1 + 72);
  id v3 = [*(id *)(a1 + 56) _persistenceDictionary];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 64));
}

void __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "daemonOfferClassFromBundleId:options:", *(void *)(a1 + 40), *(void *)(a1 + 48)), "persistedObject");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [v4 _persistenceDictionary];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, 0);
}

- (id)_getHandlerForBundleId:(id)a3 options:(id)a4
{
  int64_t v4 = +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:a4 bundleId:a3 isBuddy:0];
  if ((unint64_t)(v4 - 1) > 4) {
    return 0;
  }
  else {
    return *(&off_1E6A52FF0 + v4 - 1);
  }
}

uint64_t __56__ICQDaemonOfferManager__getHandlerForBundleId_options___block_invoke(uint64_t a1, void *a2)
{
  return [a2 chooseFirstDefaultStub];
}

uint64_t __56__ICQDaemonOfferManager__getHandlerForBundleId_options___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 chooseFirstPremiumStub];
}

uint64_t __56__ICQDaemonOfferManager__getHandlerForBundleId_options___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 chooseFirstEventStub];
}

- (Class)daemonOfferClassFromBundleId:(id)a3 options:(id)a4
{
  +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:a4 bundleId:a3 isBuddy:0];
  int64_t v4 = objc_opt_class();
  return (Class)v4;
}

- (void)daemonBuddyOfferDictionaryForAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__ICQDaemonOfferManager_daemonBuddyOfferDictionaryForAccount_completion___block_invoke;
  v8[3] = &unk_1E6A528D0;
  id v9 = v6;
  id v7 = v6;
  [(ICQDaemonOfferManager *)self _reconsiderOffersForAccount:a3 isForBuddy:1 quotaReason:@"com.apple.purplebuddy" choiceHandler:0 completion:v8];
}

void __73__ICQDaemonOfferManager_daemonBuddyOfferDictionaryForAccount_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v4 = +[ICQDaemonPersisted persistedObject];
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [v4 _persistenceDictionary];
    (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, 0);
  }
}

- (void)teardownOffersForAccount:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  int v8 = objc_msgSend(v6, "aa_isPrimaryAccount");
  id v9 = _ICQGetLogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "teardown offers related to primary account %@", (uint8_t *)&v11, 0xCu);
    }

    [(ICQDaemonOfferManager *)self _teardownCachedOffersAndNotify:1];
    if (!v7) {
      goto LABEL_10;
    }
LABEL_9:
    v7[2](v7);
    goto LABEL_10;
  }
  if (v10)
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "teardown for non-primary account %@ - ignoring", (uint8_t *)&v11, 0xCu);
  }

  if (v7) {
    goto LABEL_9;
  }
LABEL_10:
}

- (void)addCommonHeadersToRequest:(id)a3
{
  id v4 = a3;
  id v5 = [ICQRequestProvider alloc];
  id v6 = [(ICQDaemonOfferManager *)self accountManager];
  id v7 = [v6 accountStore];
  int v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  id v9 = [(ICQRequestProvider *)v5 initWithAccount:v8];

  [(ICQRequestProvider *)v9 addCommonHeadersToRequest:v4];
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[ICQDaemonOfferManager renewCredentialsWithCompletion:]";
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "%s - Renewing credentials", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [MEMORY[0x1E4F179C8] defaultStore];
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  [v5 renewCredentialsForAccount:v6 force:0 reason:0 completion:v3];
}

- (id)_storageManagementFollowupActions
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F5B760];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"DEVICE_FULL_FOLLOWUP_MANAGE_STORAGE_BUTTON_TITLE" value:&stru_1F2DCE430 table:@"Localizable"];
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
  id v6 = [v2 actionWithLabel:v4 url:v5];

  int v7 = (void *)MEMORY[0x1E4F5B760];
  int v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"DEVICE_FULL_FOLLOWUP_LEARN_MORE_BUTTON_TITLE" value:&stru_1F2DCE430 table:@"Localizable"];
  BOOL v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/HT206504"];
  int v11 = [v7 actionWithLabel:v9 url:v10];

  v14[0] = v6;
  v14[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  return v12;
}

- (id)_storageManagementFollowupNotification
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F5B778]);
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = _ICQModelSpecificLocalizedStringKeyForKey(@"DEVICE_FULL_ALERT_TITLE");
  id v5 = [v3 localizedStringForKey:v4 value:&stru_1F2DCE430 table:@"Localizable"];
  [v2 setTitle:v5];

  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v7 = _ICQModelSpecificLocalizedStringKeyForKey(@"DEVICE_FULL_ALERT_MESSAGE");
  int v8 = [v6 localizedStringForKey:v7 value:&stru_1F2DCE430 table:@"Localizable"];
  [v2 setInformativeText:v8];

  uint64_t v9 = (void *)MEMORY[0x1E4F5B760];
  BOOL v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v11 = [v10 localizedStringForKey:@"DEVICE_FULL_ALERT_ACTIVATE_BUTTON_TITLE" value:&stru_1F2DCE430 table:@"Localizable"];
  id v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
  uint64_t v13 = [v9 actionWithLabel:v11 url:v12];
  [v2 setActivateAction:v13];

  [v2 setFrequency:86400.0];
  id v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = *MEMORY[0x1E4F5B750];
  v19[0] = *MEMORY[0x1E4F5B748];
  v19[1] = v15;
  v19[2] = *MEMORY[0x1E4F5B758];
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  id v17 = [v14 setWithArray:v16];
  [v2 setOptions:v17];

  return v2;
}

- (id)_storageManagementFollowupItem
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F5B770]);
  [v3 setUniqueIdentifier:@"com.apple.iCloudQuota.StorageManagement.followup"];
  [v3 setGroupIdentifier:*MEMORY[0x1E4F5B728]];
  [v3 setDisplayStyle:1];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = _ICQModelSpecificLocalizedStringKeyForKey(@"DEVICE_FULL_FOLLOWUP_TITLE");
  id v6 = [v4 localizedStringForKey:v5 value:&stru_1F2DCE430 table:@"Localizable"];
  [v3 setTitle:v6];

  int v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v8 = _ICQModelSpecificLocalizedStringKeyForKey(@"DEVICE_FULL_FOLLOWUP_MESSAGE");
  uint64_t v9 = [v7 localizedStringForKey:v8 value:&stru_1F2DCE430 table:@"Localizable"];
  [v3 setInformativeText:v9];

  BOOL v10 = [(ICQDaemonOfferManager *)self _storageManagementFollowupActions];
  [v3 setActions:v10];

  int v11 = [(ICQDaemonOfferManager *)self _storageManagementFollowupNotification];
  [v3 setNotification:v11];

  return v3;
}

- (void)_postStorageManagementFollowup
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICQDaemonOfferManager *)self _storageManagementFollowupItem];
  followUpController = self->_followUpController;
  id v11 = 0;
  [(FLFollowUpController *)followUpController postFollowUpItem:v3 error:&v11];
  id v5 = v11;
  id v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v3;
      __int16 v14 = 2114;
      id v15 = v5;
      int v8 = "Error posting Storage Management followup %{public}@; error: %{public}@";
      uint64_t v9 = v6;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v3;
    int v8 = "Posted Storage Management followup %{public}@";
    uint64_t v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

- (void)startDirectingToStorageManagement
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if ([(ICQDaemonOfferManager *)v2 shouldDirectToStorageManagement])
  {
    id v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[ICQDaemonOfferManager startDirectingToStorageManagement]";
LABEL_6:
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    [(ICQDaemonOfferManager *)v2 setShouldDirectToStorageManagement:1];
    [(ICQDaemonOfferManager *)v2 _teardownCachedOffersAndNotify:1];
    [(ICQDaemonOfferManager *)v2 _postStorageManagementFollowup];
    id v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[ICQDaemonOfferManager startDirectingToStorageManagement]";
      id v4 = "%s successfully posted CFU";
      goto LABEL_6;
    }
  }

  objc_sync_exit(v2);
}

- (void)reconsiderOffersWithCompletion:(id)a3
{
}

void __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_241(uint64_t a1)
{
}

void __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isCachedDaemonOfferValid:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  if ([v5 isValidForAccount:a4]) {
    int v6 = [v5 isExpired] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_processOfferStub:(id)a3 account:(id)a4 offerType:(int64_t)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = (void (**)(void))a6;
  if (a3)
  {
    id v12 = [a3 persistedOffer];
    if ([(ICQDaemonOfferManager *)self _isCachedDaemonOfferValid:v12 forAccount:v10])
    {
      uint64_t v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:a5];
        *(_DWORD *)buf = 138412290;
        __int16 v24 = v14;
        _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "%@ offer is valid, posting CFU with replaceExisting: NO", buf, 0xCu);
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__ICQDaemonOfferManager__processOfferStub_account_offerType_completion___block_invoke_242;
      v17[3] = &unk_1E6A52970;
      v17[4] = self;
      int64_t v19 = a5;
      id v18 = v11;
      [(ICQDaemonOfferManager *)self _postFollowupForDaemonOffer:v12 replaceExisting:0 completion:v17];
    }
    else
    {
      v11[2](v11);
    }
  }
  else
  {
    id v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:a5];
      *(_DWORD *)buf = 138412290;
      __int16 v24 = v16;
      _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "%@ offer is no longer valid, removing CFU.", buf, 0xCu);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__ICQDaemonOfferManager__processOfferStub_account_offerType_completion___block_invoke;
    v20[3] = &unk_1E6A52970;
    void v20[4] = self;
    int64_t v22 = a5;
    id v21 = v11;
    [(ICQDaemonOfferManager *)self clearFollowupsOfferType:a5 completion:v20];
  }
}

uint64_t __72__ICQDaemonOfferManager__processOfferStub_account_offerType_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:*(void *)(a1 + 48)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __72__ICQDaemonOfferManager__processOfferStub_account_offerType_completion___block_invoke_242(uint64_t a1)
{
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:*(void *)(a1 + 48)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)clearAllFollowupsWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Clearing all followups", buf, 2u);
  }

  int v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke;
  v15[3] = &unk_1E6A524A0;
  uint64_t v7 = v6;
  uint64_t v16 = v7;
  [(ICQDaemonOfferManager *)self clearFollowupsOfferType:3 completion:v15];
  dispatch_group_enter(v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke_2;
  v13[3] = &unk_1E6A524A0;
  int v8 = v7;
  __int16 v14 = v8;
  [(ICQDaemonOfferManager *)self clearFollowupsOfferType:2 completion:v13];
  dispatch_group_enter(v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke_3;
  v11[3] = &unk_1E6A524A0;
  id v12 = v8;
  uint64_t v9 = v8;
  [(ICQDaemonOfferManager *)self clearFollowupsOfferType:5 completion:v11];
  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v9, v10);
  v4[2](v4);
}

void __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke(uint64_t a1)
{
}

void __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke_2(uint64_t a1)
{
}

void __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke_3(uint64_t a1)
{
}

- (void)clearFollowupsOfferType:(int64_t)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:a3];
    *(_DWORD *)buf = 138412290;
    id v15 = v8;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to clear followup! offer type: %@", buf, 0xCu);
  }
  followUpController = self->_followUpController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__ICQDaemonOfferManager_clearFollowupsOfferType_completion___block_invoke;
  v11[3] = &unk_1E6A52998;
  id v12 = v6;
  int64_t v13 = a3;
  id v10 = v6;
  +[_ICQFollowupSpecification clearFollowupWithController:followUpController offerType:a3 completion:v11];
}

void __60__ICQDaemonOfferManager_clearFollowupsOfferType_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ICQGetLogSystem();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:*(void *)(a1 + 40)];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Succeeded at clearing followup! offerType: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __60__ICQDaemonOfferManager_clearFollowupsOfferType_completion___block_invoke_cold_1((uint64_t)v5, a1);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (unint64_t)daemonOfferSource
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"_ICQOfferSource", @"com.apple.cloud.quota");
  if ([v2 isEqualToString:@"local-sample"])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"server-sample"])
  {
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_useFetchOffersDataDirectly
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"_ICQUseFetchOffersDataDirectly", @"com.apple.cloud.quota");
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

void __107__ICQDaemonOfferManager__coalescedDaemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  id v5 = a1 + 5;
  id v8 = a3;
  id v9 = a2;
  _ICQSignpostGetNanoseconds(v6, v7);
  int v10 = _ICQSignpostLogSystem();
  id v11 = v10;
  os_signpost_id_t v12 = *v5;
  if (*v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchOffers", "", v16, 2u);
  }

  int64_t v13 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __107__ICQDaemonOfferManager__coalescedDaemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke_cold_1();
  }

  uint64_t v14 = a1[4];
  id v15 = [v9 _persistenceDictionary];

  (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v8);
}

- (BOOL)_isCacheValidForRequestType:(int64_t)a3 offerStubs:(id)a4
{
  if (a3 != 1) {
    return 1;
  }
  id v4 = [a4 chooseDefaultStub];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_processPushNotificationCheckHardwareIDWithDictionary:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = _ICQSignpostLogSystem();
  os_signpost_id_t v9 = _ICQSignpostCreate(v8);

  int v10 = _ICQSignpostLogSystem();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v11, OS_SIGNPOST_EVENT, v9, "PushNotification", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v12 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ICQDaemonOfferManager _processPushNotificationCheckHardwareIDWithDictionary:completion:]();
  }

  int64_t v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "_processPushNotificationDictionary: %@", buf, 0xCu);
  }

  uint64_t v14 = [v6 objectForKeyedSubscript:@"event"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ICQDaemonOfferManager *)self clearLegacyFollowups];
    v26[0] = @"CKHardwareID";
    v26[1] = @"hardwareId";
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v16 = _ICQStringForOneOfKeys(v6, v15);

    if (v16
      && ([v16 lowercaseString],
          id v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v17 isEqualToString:@"all"],
          v17,
          (v18 & 1) == 0))
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __90__ICQDaemonOfferManager__processPushNotificationCheckHardwareIDWithDictionary_completion___block_invoke;
      v21[3] = &unk_1E6A52A10;
      id v22 = v16;
      uint64_t v25 = v7;
      uint64_t v23 = self;
      id v24 = v6;
      id v20 = +[ICQDaemonOfferManager getCkBackupDeviceIDWithCompletionHandler:v21];
    }
    else
    {
      [(ICQDaemonOfferManager *)self _processPushNotificationDictionary:v6 completion:v7];
    }
  }
  else
  {
    int64_t v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v14;
      _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, "push notification with bad event %@", buf, 0xCu);
    }

    v7[2](v7);
  }
}

void __90__ICQDaemonOfferManager__processPushNotificationCheckHardwareIDWithDictionary_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) isEqualToString:v3];
  BOOL v5 = _ICQGetLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "push targeted to this device only with CKHardwareID:%@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 40) _processPushNotificationDictionary:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    if (v6)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "ignoring push (CKHardwareID:%@ does not match local CKHardwareID:%@)", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_processPushNotificationDictionary:(id)a3 completion:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  int v8 = [v6 objectForKeyedSubscript:@"dsId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 stringValue];

    int v8 = (void *)v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)&long long v47 = 0;
    *((void *)&v47 + 1) = &v47;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__5;
    id v50 = __Block_byref_object_dispose__5;
    __int16 v10 = [(ICQDaemonOfferManager *)self accountManager];
    id v51 = [v10 accountStore];

    id v11 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 40), "aa_primaryAppleAccount");
    uint64_t v12 = objc_msgSend(v11, "aa_personID");
    char v13 = [v8 isEqual:v12];

    if (v13)
    {
      uint64_t v14 = [v6 objectForKeyedSubscript:@"event"];
      id v15 = _ICQGetLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = v14;
        _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "handling push event %@", buf, 0xCu);
      }

      uint64_t v16 = [v6 objectForKeyedSubscript:@"notificationId"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v17 = _ICQGetLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v46 = v16;
          _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "push notification with bad notificationId %@", buf, 0xCu);
        }

        uint64_t v16 = 0;
      }
      if ([v14 isEqualToString:@"alert"])
      {
        char v18 = _ICQGetLogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D5851000, v18, OS_LOG_TYPE_DEFAULT, "push event (alert)", buf, 2u);
        }

        int64_t v19 = _ICQGetLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v46 = v16;
          _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, "refreshing offer details for notificationID %@", buf, 0xCu);
        }

        if (v6) {
          id v20 = v6;
        }
        else {
          id v20 = (id)MEMORY[0x1E4F1CC08];
        }
        +[ICQMLBiomePublisher publishEventWithPushNotification:v20];
        if (+[ICQMLProtocolParser shouldCallMlDaemonForPushNotification:v6])
        {
          id v21 = [MEMORY[0x1E4FB8348] shared];
          id v22 = [v21 parseNotification:v6];

          uint64_t v23 = +[ICQMLProtocolParser parseMaxDelaySecsFromPushNotification:v6];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke;
          v39[3] = &unk_1E6A52A38;
          v39[4] = self;
          id v40 = v6;
          id v43 = v7;
          id v41 = v11;
          __int16 v44 = &v47;
          id v42 = v16;
          [(ICQDaemonOfferManager *)self _subdFetchNewOfferResponseWithContent:v22 andMaxDelaySecs:v23 completion:v39];
        }
        else
        {
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_2;
          v34[3] = &unk_1E6A52A88;
          void v34[4] = self;
          id v35 = v6;
          uint64_t v38 = &v47;
          id v36 = v11;
          id v37 = v7;
          [(ICQDaemonOfferManager *)self _fetchDaemonOfferForAccount:v36 stub:0 notificationID:v16 completion:v34];
        }
      }
      else if (([v14 isEqualToString:@"dismiss"] & 1) != 0 {
             || [v14 isEqualToString:@"teardown"])
      }
      {
        id v28 = _ICQGetLogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v46 = v14;
          _os_log_impl(&dword_1D5851000, v28, OS_LOG_TYPE_DEFAULT, "push event (%{public}@)", buf, 0xCu);
        }

        [(ICQDaemonOfferManager *)self _teardownCachedOffersAndNotify:0];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_265;
        v30[3] = &unk_1E6A52AD8;
        void v30[4] = self;
        id v31 = v11;
        id v33 = &v47;
        id v32 = v7;
        [(ICQDaemonOfferManager *)self reconsiderOffersWithReason:@"PushTeardown" reuseLocalOffers:0 completion:v30];
      }
      else
      {
        uint64_t v29 = _ICQGetLogSystem();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v46 = v14;
          _os_log_impl(&dword_1D5851000, v29, OS_LOG_TYPE_DEFAULT, "push notification with unexpected event %@ (ignored)", buf, 0xCu);
        }

        v7[2](v7);
      }
    }
    else
    {
      id v27 = _ICQGetLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v27, OS_LOG_TYPE_DEFAULT, "dsid mismatch: ignoring", buf, 2u);
      }

      v7[2](v7);
    }

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    id v24 = _ICQGetLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = (objc_class *)objc_opt_class();
      uint64_t v26 = NSStringFromClass(v25);
      LODWORD(v47) = 138412290;
      *(void *)((char *)&v47 + 4) = v26;
      _os_log_impl(&dword_1D5851000, v24, OS_LOG_TYPE_DEFAULT, "push notification with bad dsid of class %@", (uint8_t *)&v47, 0xCu);
    }
    v7[2](v7);
  }
}

uint64_t __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _subdRefreshOfferDetailsAndDisplay:*(void *)(a1 + 40) completion:*(void *)(a1 + 64) account:*(void *)(a1 + 48) accountStore:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) notificationID:*(void *)(a1 + 56) isoNewOfferResponse:a2];
}

void __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v7;
      _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "fetch error %@", buf, 0xCu);
    }

    uint64_t v16 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_264;
    v17[3] = &unk_1E6A52920;
    v17[4] = v16;
    id v11 = &v18;
    id v18 = *(id *)(a1 + 56);
    [v16 clearAllFollowupsWithCompletion:v17];
  }
  else
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v5 offerId];
    [v8 _clearCachedStubsIfOfferIDIsNew:v9];

    __int16 v10 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_3;
    v19[3] = &unk_1E6A52A60;
    void v19[4] = v10;
    id v11 = &v20;
    id v12 = v5;
    id v20 = v12;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 64);
    id v21 = v13;
    uint64_t v24 = v14;
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 56);
    [v10 _postFollowupForDaemonOffer:v12 replaceExisting:1 completion:v19];
  }
}

uint64_t __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  id v2 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"debugAlert"];

  if (v2) {
    [*(id *)(a1 + 40) _addSampleAlert];
  }
  BOOL v3 = +[ICQDaemonAlert shouldShowForDaemonOffer:*(void *)(a1 + 40)];
  char v4 = _ICQGetLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "showing alert", buf, 2u);
    }

    return [*(id *)(a1 + 32) _showDaemonAlertForOffer:*(void *)(a1 + 40) notificationDictionary:*(void *)(a1 + 48) store:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) account:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "skipping alert", v7, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_264(uint64_t a1)
{
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:3];
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:1];
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:2];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_265(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_2_266;
  v4[3] = &unk_1E6A52AB0;
  id v5 = *(id *)(a1 + 48);
  [v1 _updateOffer:0 buttonId:@"teardown" info:0 account:v2 accountStore:v3 completion:v4];
}

void __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_2_266(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "reconsidered offers success:%d error:%{public}@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_clearCachedStubsIfOfferIDIsNew:(id)a3
{
  id v3 = a3;
  char v4 = +[ICQDaemonPersisted persistedObject];
  int v5 = [v4 containsOfferID:v3];
  id v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[ICQDaemonOfferManager _clearCachedStubsIfOfferIDIsNew:](v6);
    }
  }
  else
  {
    if (v7) {
      -[ICQDaemonOfferManager _clearCachedStubsIfOfferIDIsNew:]();
    }

    +[ICQDaemonPersisted clearPersistedObject];
  }
}

- (void)_fetchDictionaryForAccount:(id)a3 quotaKey:(id)a4 quotaReason:(id)a5 stub:(id)a6 notificationID:(id)a7 contextDictionary:(id)a8 mlDaemonExtraFields:(id)a9 completion:(id)a10
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v51 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v50 = a9;
  id v21 = (void (**)(id, void *, void))a10;
  id v22 = _ICQGetLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v67 = v51;
    *(_WORD *)v68 = 2112;
    *(void *)&v68[2] = v18;
    *(_WORD *)&v68[10] = 2112;
    *(void *)&v68[12] = v19;
    __int16 v69 = 2112;
    id v70 = v20;
    _os_log_impl(&dword_1D5851000, v22, OS_LOG_TYPE_DEFAULT, "_fetchDictionaryForAccount:%@ quotaKey:%@ quotaReason:%@ stub:%@ notificationID:%@ contextDictionary:%@", buf, 0x3Eu);
  }

  if (+[_ICQHelperFunctions isServerMockingEnabled])
  {
    [(ICQDaemonOfferManager *)self _mockFetchDictionaryForAccount:v16 quotaKey:v17 stub:v18 notificationID:v19 contextDictionary:v20 completion:v21];
  }
  else if (v16)
  {
    if (v18
      && [(ICQDaemonOfferManager *)self _useFetchOffersDataDirectly]
      && ([v18 serverDictionary],
          id v23 = objc_claimAutoreleasedReturnValue(),
          BOOL v24 = v23 == 0,
          v23,
          !v24))
    {
      uint64_t v25 = [v18 serverDictionary];
      v21[2](v21, v25, 0);
    }
    else
    {
      uint64_t v26 = [ICQDaemonOfferRequestBuilder alloc];
      uint64_t v27 = [(ICQDaemonOfferManager *)self accountManager];
      v49 = [(ICQDaemonOfferRequestBuilder *)v26 initWithAccount:v16 accountManager:v27];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v67 = __Block_byref_object_copy__5;
      *(void *)v68 = __Block_byref_object_dispose__5;
      LOBYTE(v43) = [(ICQDaemonOfferManager *)self daemonOfferSource] == 2;
      id v28 = [(ICQDaemonOfferRequestBuilder *)v49 requestWithQuotaKey:v17 reason:v51 offerStub:v18 notificationID:v19 contextDictionary:v20 mlDaemonExtraFields:v50 sourceIsServerSample:v43];
      *(void *)&v68[8] = [v28 mutableCopy];

      if (*(void *)(*(void *)&buf[8] + 40))
      {
        if (-[ICQNetworkThrottleController requestShouldThrottle:](self->_throttleController, "requestShouldThrottle:"))
        {
          if (v21)
          {
            uint64_t v29 = [NSString stringWithFormat:@"Request throttling active for request: %@", *(void *)(*(void *)&buf[8] + 40)];
            int v30 = ICQCreateErrorWithMessage(16, v29);
            ((void (**)(id, void *, void *))v21)[2](v21, 0, v30);
          }
        }
        else
        {
          id v36 = _ICQGetLogSystem();
          BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG);

          if (v37)
          {
            uint64_t v38 = _ICQGetLogSystem();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              id v45 = *(void **)(*(void *)&buf[8] + 40);
              uint64_t v48 = [v45 allHTTPHeaderFields];
              id v39 = [*(id *)(*(void *)&buf[8] + 40) HTTPBody];
              id v44 = [NSString alloc];
              long long v47 = [*(id *)(*(void *)&buf[8] + 40) HTTPBody];
              *(_DWORD *)v63 = 138413058;
              *(void *)&v63[4] = v45;
              *(_WORD *)&v63[12] = 2112;
              *(void *)&v63[14] = v48;
              *(_WORD *)&v63[22] = 2112;
              v64 = v39;
              LOWORD(v65) = 2112;
              uint64_t v46 = (void *)[v44 initWithData:v47 encoding:4];
              *(void *)((char *)&v65 + 2) = v46;
              _os_log_debug_impl(&dword_1D5851000, v38, OS_LOG_TYPE_DEBUG, "request: %@ headers: %@ body: %@ body (as string): %@", v63, 0x2Au);
            }
          }
          else
          {
            uint64_t v38 = _ICQGetLogSystem();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v63 = 0;
              _os_log_impl(&dword_1D5851000, v38, OS_LOG_TYPE_DEFAULT, "sending request for latest offer", v63, 2u);
            }
          }

          *(void *)v63 = 0;
          *(void *)&v63[8] = v63;
          *(void *)&v63[16] = 0x3032000000;
          v64 = __Block_byref_object_copy__5;
          *(void *)&long long v65 = __Block_byref_object_dispose__5;
          *((void *)&v65 + 1) = [[ICQNetworkRequestController alloc] initWithSession:self->_sharedURLSession numberOfSecondsBetweenRetries:&unk_1F2DE1AE0];
          v61[0] = 0;
          v61[1] = v61;
          v61[2] = 0x3032000000;
          v61[3] = __Block_byref_object_copy__5;
          v61[4] = __Block_byref_object_dispose__5;
          v62 = self->_throttleController;
          id v40 = *(void **)(*(void *)&v63[8] + 40);
          uint64_t v41 = *(void *)(*(void *)&buf[8] + 40);
          id v42 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2DE1AF8];
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __142__ICQDaemonOfferManager__fetchDictionaryForAccount_quotaKey_quotaReason_stub_notificationID_contextDictionary_mlDaemonExtraFields_completion___block_invoke;
          v59[3] = &unk_1E6A52B00;
          uint64_t v60 = v49;
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __142__ICQDaemonOfferManager__fetchDictionaryForAccount_quotaKey_quotaReason_stub_notificationID_contextDictionary_mlDaemonExtraFields_completion___block_invoke_2;
          v52[3] = &unk_1E6A52B28;
          id v53 = v18;
          id v54 = v19;
          os_signpost_id_t v56 = v61;
          uint64_t v57 = buf;
          id v55 = v21;
          v58 = v63;
          [v40 executeRequest:v41 acceptedStatusCodes:v42 renewHeadersBlock:v59 completion:v52];

          _Block_object_dispose(v61, 8);
          _Block_object_dispose(v63, 8);
        }
      }
      else if (v21)
      {
        id v32 = NSString;
        id v33 = [v18 offerId];
        os_signpost_id_t v34 = [v32 stringWithFormat:@"Failed to build request for key: %@ reason: %@ offerID: %@ notificationID: %@ contextDictionary: %@", v17, v51, v33, v19, v20];
        id v35 = ICQCreateErrorWithMessage(6, v34);
        ((void (**)(id, void *, void *))v21)[2](v21, 0, v35);
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else if (v21)
  {
    id v31 = ICQCreateError(8);
    ((void (**)(id, void *, void *))v21)[2](v21, 0, v31);
  }
}

uint64_t __142__ICQDaemonOfferManager__fetchDictionaryForAccount_quotaKey_quotaReason_stub_notificationID_contextDictionary_mlDaemonExtraFields_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) renewAuthHeadersForRequest:a2 completion:a3];
}

void __142__ICQDaemonOfferManager__fetchDictionaryForAccount_quotaKey_quotaReason_stub_notificationID_contextDictionary_mlDaemonExtraFields_completion___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  __int16 v8 = @"refreshOffer";
  if (!a1[4] && !a1[5]) {
    __int16 v8 = @"fetchOffer";
  }
  id v9 = a4;
  ICQLogDataTaskComplete(v8, v7, a3, v9);
  [*(id *)(*(void *)(a1[7] + 8) + 40) request:*(void *)(*(void *)(a1[8] + 8) + 40) didCompleteWithError:v9];

  if (v7)
  {
    id v17 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v17];
    id v11 = v17;
    if (v11)
    {
      id v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v11;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "error parsing fetched offer: %@", buf, 0xCu);
      }

      id v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
        *(_DWORD *)buf = 138412290;
        id v19 = v14;
        _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v15 = *(void *)(a1[9] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;
}

- (void)addPremiumOffersHeaderIfNeededForRequest:(id)a3
{
  id v3 = a3;
  char v4 = +[_ICQHelperFunctions defaultValueForKey:@"_ICQEnableServerPremiumOffers"];
  int v5 = v4;
  if (v4 && [v4 BOOLValue]) {
    [v3 setValue:@"true" forHTTPHeaderField:@"x-apple-opt-in-flow"];
  }
  id v6 = +[_ICQHelperFunctions defaultValueForKey:@"_ICQAddFetchOffersHeaders"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__ICQDaemonOfferManager_addPremiumOffersHeaderIfNeededForRequest___block_invoke;
  v8[3] = &unk_1E6A51EF0;
  id v9 = v3;
  id v7 = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __66__ICQDaemonOfferManager_addPremiumOffersHeaderIfNeededForRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      [*(id *)(a1 + 32) setValue:v5 forHTTPHeaderField:v6];
    }
  }
}

- (void)_mockFetchDictionaryForAccount:(id)a3 quotaKey:(id)a4 stub:(id)a5 notificationID:(id)a6 contextDictionary:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void *, void))a8;
  uint64_t v15 = _ICQGetLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "Mocking the server response", buf, 2u);
  }

  id v35 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([(__CFString *)v11 isEqualToString:@"quotaFetchOffersURL"])
  {
    id v16 = @"_ICQ_MOCK_FETCH_OFFER";
    goto LABEL_12;
  }
  if (![(__CFString *)v11 isEqualToString:@"quotaRefreshOfferDetailsURL"])
  {
    id v17 = _ICQGetLogSystem();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      id v16 = 0;
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v11;
    id v18 = "Mocking Not Supported for %@";
    id v19 = v17;
    uint32_t v20 = 12;
LABEL_10:
    _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_11;
  }
  if (v13)
  {
    id v16 = [NSString stringWithFormat:@"_ICQ_MOCK_%@", v13];
    goto LABEL_12;
  }
  if (!v12)
  {
    id v17 = _ICQGetLogSystem();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    id v18 = "Mocking Not Supported in case of both stub and notification id are nil";
    id v19 = v17;
    uint32_t v20 = 2;
    goto LABEL_10;
  }
  id v32 = NSString;
  id v33 = [v12 offerId];
  id v16 = [v32 stringWithFormat:@"_ICQ_MOCK_%@", v33];

LABEL_12:
  id v21 = _ICQGetLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v16;
    _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "getting mock server dict from %@", buf, 0xCu);
  }

  id v22 = +[_ICQHelperFunctions defaultStringValueForKey:v16];
  id v23 = [v22 dataUsingEncoding:4];
  if (v23)
  {
    id v36 = 0;
    BOOL v24 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v23 options:0 error:&v36];
    uint64_t v25 = (__CFString *)v36;
    if (!v25) {
      goto LABEL_23;
    }
    uint64_t v26 = _ICQGetLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v25;
      _os_log_impl(&dword_1D5851000, v26, OS_LOG_TYPE_DEFAULT, "error parsing mock offer: %@", buf, 0xCu);
    }

    uint64_t v27 = _ICQGetLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v34 = v11;
      id v28 = v13;
      id v29 = v12;
      int v30 = (__CFString *)[[NSString alloc] initWithData:v23 encoding:4];
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v30;
      _os_log_impl(&dword_1D5851000, v27, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

      id v12 = v29;
      id v13 = v28;
      id v11 = v34;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }
  BOOL v24 = 0;
LABEL_23:
  id v31 = _ICQGetLogSystem();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v24;
    _os_log_impl(&dword_1D5851000, v31, OS_LOG_TYPE_DEFAULT, "mockServerDict = %@", buf, 0xCu);
  }

  v14[2](v14, v24, 0);
}

- (void)_updateQuotaForAccount:(id)a3 withServerDictionary:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ICQDictionaryForKey(a4, @"quotaInfo");
  id v7 = [v6 objectForKeyedSubscript:@"totalQuota"];
  __int16 v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 objectForKeyedSubscript:@"total_quota"];
  }
  uint64_t v10 = v9;

  if (objc_opt_respondsToSelector())
  {
    id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
  }
  else
  {
    id v11 = 0;
  }
  id v12 = objc_msgSend(v5, "aa_lastKnownQuota");
  id v13 = v12;
  if (v11 && ([v12 isEqualToNumber:v11] & 1) == 0)
  {
    uint64_t v14 = (void *)[v5 copy];
    [v14 reload];
    objc_msgSend(v14, "aa_setLastKnownQuota:", v11);
    uint64_t v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412802;
      id v18 = v5;
      __int16 v19 = 2112;
      uint32_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "Quota for %@ changed from %@ to %@; updating last known quota",
        (uint8_t *)&v17,
        0x20u);
    }

    id v16 = [v5 accountStore];
    [v16 saveVerifiedAccount:v14 withCompletionHandler:&__block_literal_global_335];
  }
}

void __69__ICQDaemonOfferManager__updateQuotaForAccount_withServerDictionary___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (a2) {
      id v6 = @"YES";
    }
    int v7 = 138412546;
    __int16 v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Updated account quota information with success: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_fetchDaemonOfferForAccount:(id)a3 stub:(id)a4 notificationID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", +[_ICQHelperFunctions _offerRequestTypeForStub:v11]);
  uint64_t v15 = NSString;
  id v16 = objc_msgSend(v10, "aa_altDSID");
  int v17 = [v15 stringWithFormat:@"%@", v16];
  id v18 = [v17 stringByAppendingString:v14];

  if (v12)
  {
    uint64_t v19 = [v18 stringByAppendingString:v12];

    id v18 = (void *)v19;
  }
  objc_initWeak(&location, self);
  uint32_t v20 = [(ICQDaemonOfferManager *)self taskLimiters];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __84__ICQDaemonOfferManager__fetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke;
  v24[3] = &unk_1E6A52B70;
  objc_copyWeak(&v28, &location);
  id v21 = v10;
  id v25 = v21;
  id v22 = v11;
  id v26 = v22;
  id v23 = v12;
  id v27 = v23;
  [v20 performWithIdentifier:v18 task:v24 completion:v13];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __84__ICQDaemonOfferManager__fetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke(void *a1, void *a2)
{
  id v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _coalescedFetchDaemonOfferForAccount:a1[4] stub:a1[5] notificationID:a1[6] completion:v4];
}

- (void)_coalescedFetchDaemonOfferForAccount:(id)a3 stub:(id)a4 notificationID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  if (!(v11 | v12))
  {
    uint64_t v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "WARNING: both stub and notificationID are nil -- attempting blind refresh", buf, 2u);
    }
  }
  uint64_t v15 = _ICQSignpostLogSystem();
  id v16 = objc_opt_new();
  os_signpost_id_t v17 = _ICQSignpostCreateWithObject(v15, v16);
  uint64_t v19 = v18;

  uint32_t v20 = _ICQSignpostLogSystem();
  id v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RefreshOfferDetails", " enableTelemetry=YES ", buf, 2u);
  }

  id v22 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[ICQDaemonOfferManager _coalescedFetchDaemonOfferForAccount:stub:notificationID:completion:]();
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke;
  v27[3] = &unk_1E6A52BB8;
  id v28 = (id)v11;
  id v29 = self;
  id v30 = v10;
  id v31 = (id)v12;
  os_signpost_id_t v33 = v17;
  uint64_t v34 = v19;
  id v32 = v13;
  id v23 = v13;
  id v24 = (id)v12;
  id v25 = v10;
  id v26 = (id)v11;
  [(ICQDaemonOfferManager *)self _fetchDictionaryForAccount:v25 quotaKey:@"quotaRefreshOfferDetailsURL" quotaReason:@"RefreshOfferDetails" stub:v26 notificationID:v24 contextDictionary:0 mlDaemonExtraFields:0 completion:v27];
}

void __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = (ICQDaemonOfferStub *)*(id *)(a1 + 32);
  __int16 v8 = [[ICQDaemonOfferStub alloc] initWithServerDictionary:v5];
  if (v5) {
    id v9 = v5;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }
  +[ICQMLBiomePublisher publishEventWithRefreshOfferDetailsResponse:v9];
  if (v7)
  {
    if (v5)
    {
      id v10 = [(ICQDaemonOfferStub *)v7 offerId];
      unint64_t v11 = [(ICQDaemonOfferStub *)v8 offerId];
      char v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = _ICQGetLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_cold_1(v8, v7);
        }
      }
      if ([(ICQDaemonOfferStub *)v7 isBuddyOffer]
        && ![(ICQDaemonOfferStub *)v8 isBuddyOffer])
      {
        uint64_t v14 = _ICQGetLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "missing buddyOffer flag after refresh offer details", buf, 2u);
        }
      }
    }
  }
  else
  {
    int v7 = v8;
  }
  uint64_t v15 = [(ICQDaemonOfferStub *)v7 conditionsWhenChosen];
  if (v15) {
    [(ICQDaemonOfferStub *)v7 conditionsWhenChosen];
  }
  else {
  id v16 = +[ICQDaemonOfferConditions currentConditions];
  }

  os_signpost_id_t v17 = [(ICQDaemonOfferStub *)v8 criteria];
  char v18 = [v17 isSatisfiedByConditions:v16];

  if (v18)
  {
    if (v5)
    {
      id v46 = v6;
      uint64_t v19 = (objc_class *)[*(id *)(a1 + 40) _classForOfferStub:v8];
      ICQLogOfferDetailsForServerDictionary(v5);
      [*(id *)(a1 + 40) _updateQuotaForAccount:*(void *)(a1 + 48) withServerDictionary:v5];
      uint32_t v20 = (void *)[[v19 alloc] _initWithAccount:*(void *)(a1 + 48) serverDictionary:v5];
      [v20 setNotificationID:*(void *)(a1 + 56)];
      [v20 cacheLiftUIContent];
      [v20 persistObject];
      unint64_t Nanoseconds = _ICQSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
      id v22 = _ICQSignpostLogSystem();
      id v23 = v22;
      os_signpost_id_t v24 = *(void *)(a1 + 72);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v48 = v19;
        _os_signpost_emit_with_name_impl(&dword_1D5851000, v23, OS_SIGNPOST_INTERVAL_END, v24, "RefreshOfferDetails", "%@", buf, 0xCu);
      }

      id v25 = _ICQSignpostLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)uint64_t v48 = *(unsigned __int16 *)(a1 + 72);
        *(_WORD *)&v48[4] = 2048;
        *(double *)&v48[6] = (double)Nanoseconds / 1000000000.0;
        *(_WORD *)&v48[14] = 2112;
        *(void *)&v48[16] = v19;
        _os_log_debug_impl(&dword_1D5851000, v25, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) RefreshOfferDetails %@", buf, 0x1Cu);
      }

      id v26 = _ICQGetLogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v20 expirationDate];
        *(_DWORD *)buf = 138543618;
        *(void *)uint64_t v48 = v19;
        *(_WORD *)&v48[8] = 2112;
        *(void *)&v48[10] = v27;
        _os_log_impl(&dword_1D5851000, v26, OS_LOG_TYPE_DEFAULT, "Finished persisting %{public}@ offer; expires on %@",
          buf,
          0x16u);
      }
      uint64_t v28 = *(void *)(a1 + 64);
      if (v28) {
        (*(void (**)(uint64_t, void *, void))(v28 + 16))(v28, v20, 0);
      }

      id v29 = v46;
      goto LABEL_58;
    }
  }
  else
  {
    id v30 = _ICQGetLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v30, OS_LOG_TYPE_DEFAULT, "Fetched offer is not valid in current conditions, invalidating both old and new offers", buf, 2u);
    }

    id v31 = [(ICQDaemonOfferStub *)v8 offerResetURL];

    id v32 = _ICQGetLogSystem();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v32, OS_LOG_TYPE_DEFAULT, "Updating server with invalid fetched offer status", buf, 2u);
      }

      [*(id *)(a1 + 40) _fetchDictionaryForAccount:*(void *)(a1 + 48) quotaKey:@"quotaOfferReset" quotaReason:@"OfferReset" stub:v8 notificationID:*(void *)(a1 + 56) contextDictionary:0 mlDaemonExtraFields:0 completion:&__block_literal_global_347];
    }
    else
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v32, OS_LOG_TYPE_DEFAULT, "No offerResetURL provided in fetched offer, unable to notify server", buf, 2u);
      }
    }
  }
  uint64_t v34 = _ICQGetLogSystem();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    if ([(ICQDaemonOfferStub *)v7 isBuddyOffer]) {
      id v35 = @"buddy ";
    }
    else {
      id v35 = &stru_1F2DCE430;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)uint64_t v48 = v6;
    *(_WORD *)&v48[8] = 2114;
    *(void *)&v48[10] = v35;
    _os_log_impl(&dword_1D5851000, v34, OS_LOG_TYPE_DEFAULT, "error %{public}@ occurred fetching %{public}@offer -- persisting placeholder", buf, 0x16u);
  }

  uint64_t v36 = [*(id *)(a1 + 40) _classForOfferStub:v7];
  id v29 = v6;
  objc_msgSend(*(id *)(a1 + 40), "_placeholderOfferForAccount:requestType:error:", *(void *)(a1 + 48), -[ICQDaemonOfferStub requestType](v7, "requestType"), v6);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 cacheLiftUIContent];
  [v5 persistObject];
  unint64_t v37 = _ICQSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
  uint64_t v38 = _ICQSignpostLogSystem();
  uint64_t v39 = v38;
  os_signpost_id_t v40 = *(void *)(a1 + 72);
  if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v48 = v36;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v39, OS_SIGNPOST_INTERVAL_END, v40, "RefreshOfferDetails", "%@", buf, 0xCu);
  }

  uint64_t v41 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)uint64_t v48 = *(unsigned __int16 *)(a1 + 72);
    *(_WORD *)&v48[4] = 2048;
    *(double *)&v48[6] = (double)v37 / 1000000000.0;
    *(_WORD *)&v48[14] = 2112;
    *(void *)&v48[16] = v36;
    _os_log_debug_impl(&dword_1D5851000, v41, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) RefreshOfferDetails %@", buf, 0x1Cu);
  }

  id v42 = _ICQGetLogSystem();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    if ([(ICQDaemonOfferStub *)v7 isBuddyOffer]) {
      uint64_t v43 = @"buddy ";
    }
    else {
      uint64_t v43 = &stru_1F2DCE430;
    }
    id v44 = [v5 expirationDate];
    *(_DWORD *)buf = 138543618;
    *(void *)uint64_t v48 = v43;
    *(_WORD *)&v48[8] = 2112;
    *(void *)&v48[10] = v44;
    _os_log_impl(&dword_1D5851000, v42, OS_LOG_TYPE_DEFAULT, "Finished persisting placeholder %{public}@ offer; expires on %@",
      buf,
      0x16u);
  }
  uint64_t v45 = *(void *)(a1 + 64);
  if (v45) {
    (*(void (**)(uint64_t, id, void))(v45 + 16))(v45, v5, 0);
  }
LABEL_58:
}

void __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_345(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_345_cold_1();
    }
  }
}

- (Class)_classForOfferStub:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 offerClass];
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = v3;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Fetched daemon offer of class %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return (Class)v3;
}

- (void)_fetchDaemonOfferStubsForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unint64_t v11 = (void (**)(id, NSObject *, void))a6;
  id v12 = a5;
  if ([(ICQDaemonOfferManager *)self daemonOfferSource] == 1)
  {
    id v13 = +[ICQDaemonOfferStubs daemonOfferStubsDictionarySample];
    uint64_t v14 = _ICQGetLogSystem();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "fetched local sample offer", buf, 2u);
      }

      uint64_t v14 = [[ICQDaemonOfferStubs alloc] _initWithAccount:v10 serverDictionary:v13];
      [v14 persistObject];
      id v16 = _ICQGetLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        os_signpost_id_t v17 = [v14 expirationDate];
        *(_DWORD *)buf = 138412290;
        id v27 = v17;
        _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "Finished persisting local offer stubs; expires on %@",
          buf,
          0xCu);
      }
      if (v11) {
        v11[2](v11, v14, 0);
      }
    }
    else if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "Unable to get local offer stubs; dropping through to server stubs",
        buf,
        2u);
    }
  }
  char v18 = &ICQAccountQuotaFetchOffersForBuddyURLKey;
  if (!v8) {
    char v18 = &ICQAccountQuotaFetchOffersURLKey;
  }
  uint64_t v19 = *v18;
  uint32_t v20 = _ICQGetLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v19;
    _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "Fetching offer stubs - calling %@", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  id v23[2] = __92__ICQDaemonOfferManager__fetchDaemonOfferStubsForAccount_isForBuddy_quotaReason_completion___block_invoke;
  v23[3] = &unk_1E6A52BE0;
  v23[4] = self;
  id v24 = v10;
  id v25 = v11;
  id v21 = v11;
  id v22 = v10;
  [(ICQDaemonOfferManager *)self _fetchDictionaryForAccount:v22 quotaKey:v19 quotaReason:v12 stub:0 notificationID:0 contextDictionary:0 mlDaemonExtraFields:0 completion:v23];
}

void __92__ICQDaemonOfferManager__fetchDaemonOfferStubsForAccount_isForBuddy_quotaReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _ICQGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "fetched offers:\n%@", (uint8_t *)&v14, 0xCu);
    }

    +[ICQMLBiomePublisher publishEventWithFetchOffersResponse:v5];
    [*(id *)(a1 + 32) _updateQuotaForAccount:*(void *)(a1 + 40) withServerDictionary:v5];
    id v9 = [[ICQDaemonOfferStubs alloc] _initWithAccount:*(void *)(a1 + 40) serverDictionary:v5];
    [v9 persistObject];
    id v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = [v9 expirationDate];
      int v14 = 138412290;
      id v15 = v11;
      id v12 = "Finished persisting offer stubs; expires on %@";
LABEL_10:
      _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "error %{public}@ occurred fetching offer stubs -- persisting placeholder", (uint8_t *)&v14, 0xCu);
    }

    id v9 = [[ICQDaemonOfferStubs alloc] _initWithAccount:*(void *)(a1 + 40) error:v6];
    [v9 persistObject];
    id v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = [v9 expirationDate];
      int v14 = 138412290;
      id v15 = v11;
      id v12 = "Finished persisting placeholder stubs; expires on %@";
      goto LABEL_10;
    }
  }

  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v9, 0);
  }
}

- (void)_showDaemonAlertForOffer:(id)a3 notificationDictionary:(id)a4 store:(id)a5 account:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke;
  block[3] = &unk_1E6A52C30;
  id v23 = v12;
  id v24 = v14;
  id v20 = v11;
  id v21 = self;
  id v22 = v13;
  id v15 = v12;
  id v16 = v13;
  id v17 = v14;
  id v18 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke(id *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v24 = v3;
    _os_log_impl(&dword_1D5851000, v2, OS_LOG_TYPE_DEFAULT, "showing alert for daemonOffer %@", buf, 0xCu);
  }

  if (sDaemonAlert)
  {
    [(id)sDaemonAlert dismissAlert];
    id v4 = (void *)sDaemonAlert;
    sDaemonAlert = 0;
  }
  BOOL v5 = +[ICQDaemonAlert shouldShowForDaemonOffer:a1[4]];
  id v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      BOOL v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1[4], "level"));
      id v9 = [a1[4] alertSpecification];
      *(_DWORD *)buf = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Showing alert from daemon with offer level %@ alertSpecification %@", buf, 0x16u);
    }
    id v10 = [[ICQDaemonAlert alloc] initWithDaemonOffer:a1[4]];
    id v11 = (void *)sDaemonAlert;
    sDaemonAlert = (uint64_t)v10;

    +[ICQMLBiomePublisher publishOfferDisplayActionEvent];
    id v12 = (void *)sDaemonAlert;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke_351;
    v18[3] = &unk_1E6A52C08;
    int8x16_t v17 = *((int8x16_t *)a1 + 2);
    id v13 = (id)v17.i64[0];
    int8x16_t v19 = vextq_s8(v17, v17, 8uLL);
    id v20 = a1[6];
    id v21 = a1[7];
    id v22 = a1[8];
    [v12 showAlertWithCompletion:v18];
  }
  else
  {
    if (v7)
    {
      id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1[4], "level"));
      id v15 = [a1[4] alertSpecification];
      *(_DWORD *)buf = 138412546;
      id v24 = v14;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Skipping alert from daemon offer level %@ alertSpecification %@", buf, 0x16u);
    }
    id v16 = (void (**)(void))a1[8];
    if (v16) {
      v16[2]();
    }
  }
}

void __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke_351(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = _ICQStringForAction(a2);
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Daemon alert completed with action %@ parameters %@", buf, 0x16u);
  }
  if (a2 == 4) {
    +[ICQMLBiomePublisher publishOfferBuyActionEvent];
  }
  BOOL v8 = [v5 objectForKeyedSubscript:@"ServerLinkId"];
  if (v8)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) offerId];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke_352;
    v15[3] = &unk_1E6A52AB0;
    id v16 = *(id *)(a1 + 64);
    [v9 _updateOffer:v10 buttonId:v8 info:0 account:v11 accountStore:v12 completion:v15];
  }
  else
  {
    id v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "no buttonId, skipping teardown ack", buf, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 64);
    if (v14) {
      (*(void (**)(void))(v14 + 16))();
    }
  }
}

uint64_t __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke_352(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = _ICQGetLogSystem();
  id v5 = v4;
  if (a3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:a3];
      int v13 = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "posting push received darwin notification: %@", (uint8_t *)&v13, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    id v5 = +[_ICQHelperFunctions _darwinNotificationNameForRequestType:a3];
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)v5, 0, 0, 1u);
    BOOL v8 = _ICQSignpostLogSystem();
    os_signpost_id_t v9 = _ICQSignpostCreate(v8);

    id v10 = _ICQSignpostLogSystem();
    uint64_t v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      int v13 = 138412290;
      uint64_t v14 = v5;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v11, OS_SIGNPOST_EVENT, v9, "DarwinNotification", " enableTelemetry=YES %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v12 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICQDaemonOfferManager _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:]();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[ICQDaemonOfferManager _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:](v5);
  }
}

- (void)_persistAndNotifyMissingPlaceholdersForRequestType:(int64_t)a3 account:(id)a4
{
  id v6 = a4;
  if (a3 == 5)
  {
    int v13 = [(objc_class *)[(ICQDaemonOfferManager *)self _daemonOfferClassForRequestType:5] persistedObject];

    if (!v13)
    {
      uint64_t v14 = [(ICQDaemonOfferManager *)self _placeholderOfferForAccount:v6 requestType:5 error:0];
      [v14 persistObject];
    }
  }
  else if (a3)
  {
    uint64_t v15 = [(objc_class *)[(ICQDaemonOfferManager *)self _daemonOfferClassForRequestType:a3] persistedObject];

    if (!v15)
    {
      id v16 = [(ICQDaemonOfferManager *)self _placeholderOfferForAccount:v6 requestType:a3 error:0];
      [v16 persistObject];

      [(ICQDaemonOfferManager *)self _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:a3];
    }
  }
  else
  {
    BOOL v7 = +[ICQDaemonPersisted persistedObject];

    if (!v7)
    {
      BOOL v8 = [(ICQDaemonOfferManager *)self _placeholderOfferForAccount:v6 requestType:3 error:0];
      [v8 persistObject];

      [(ICQDaemonOfferManager *)self _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:3];
    }
    os_signpost_id_t v9 = +[ICQDaemonPersisted persistedObject];

    if (!v9)
    {
      id v10 = [(ICQDaemonOfferManager *)self _placeholderOfferForAccount:v6 requestType:1 error:0];
      [v10 persistObject];

      [(ICQDaemonOfferManager *)self _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:1];
    }
    uint64_t v11 = +[ICQDaemonPersisted persistedObject];

    if (!v11)
    {
      uint64_t v12 = [(ICQDaemonOfferManager *)self _placeholderOfferForAccount:v6 requestType:2 error:0];
      [v12 persistObject];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __84__ICQDaemonOfferManager__persistAndNotifyMissingPlaceholdersForRequestType_account___block_invoke;
      v17[3] = &unk_1E6A524A0;
      v17[4] = self;
      [(ICQDaemonOfferManager *)self _postFollowupForDaemonOffer:v12 replaceExisting:1 completion:v17];
    }
  }
}

uint64_t __84__ICQDaemonOfferManager__persistAndNotifyMissingPlaceholdersForRequestType_account___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:2];
}

- (void)updateOfferForAccount:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v16 accountStore];
  [(ICQDaemonOfferManager *)self _updateOffer:v15 buttonId:v14 info:v13 account:v16 accountStore:v17 completion:v12];
}

- (void)_updateOffer:(id)a3 buttonId:(id)a4 info:(id)a5 account:(id)a6 accountStore:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = objc_alloc_init(ICQOfferUpdateRequestContext);
  [(ICQOfferUpdateRequestContext *)v20 setAccount:v17];
  [(ICQOfferUpdateRequestContext *)v20 setButtonId:v15];
  id v26 = v14;
  [(ICQOfferUpdateRequestContext *)v20 setOfferId:v14];
  uint64_t v21 = [v16 objectForKeyedSubscript:@"ICQUpdateOfferKeyIsZeroAction"];
  LOBYTE(v14) = objc_opt_respondsToSelector();

  if (v14)
  {
    id v22 = [v16 objectForKeyedSubscript:@"ICQUpdateOfferKeyIsZeroAction"];
    -[ICQOfferUpdateRequestContext setZeroAction:](v20, "setZeroAction:", [v22 BOOLValue]);
  }
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__5;
  void v30[4] = __Block_byref_object_dispose__5;
  id v23 = v18;
  id v31 = v23;
  id v24 = [[ICQOfferUpdateController alloc] initWithSession:self->_sharedURLSession];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __84__ICQDaemonOfferManager__updateOffer_buttonId_info_account_accountStore_completion___block_invoke;
  v27[3] = &unk_1E6A52C58;
  id v29 = v30;
  id v25 = v19;
  id v28 = v25;
  [(ICQOfferUpdateController *)v24 performOfferUpdateWithContext:v20 completion:v27];

  _Block_object_dispose(v30, 8);
}

void __84__ICQDaemonOfferManager__updateOffer_buttonId_info_account_accountStore_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

- (void)_teardownCachedOfferAndNotify:(BOOL)a3
{
  +[ICQDaemonAlert dismissAlertsWithNotificationID:0];
  +[ICQDaemonPersisted clearPersistedObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ICQDaemonOfferManager__teardownCachedOfferAndNotify___block_invoke;
  v5[3] = &unk_1E6A52C80;
  BOOL v6 = a3;
  v5[4] = self;
  [(ICQDaemonOfferManager *)self clearFollowupsOfferType:3 completion:v5];
}

void __55__ICQDaemonOfferManager__teardownCachedOfferAndNotify___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = _ICQGetLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "regular daemon offer / alerts / followups were torn down without replacement; notifying clients",
        buf,
        2u);
    }

    [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:3];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "regular daemon offer / alerts / followups were torn down but will be replaced; not notifying clients until then",
        v5,
        2u);
    }
  }
}

- (void)_teardownCachedDefaultOfferAndNotify:(BOOL)a3
{
  +[ICQDaemonPersisted clearPersistedObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__ICQDaemonOfferManager__teardownCachedDefaultOfferAndNotify___block_invoke;
  v5[3] = &unk_1E6A52C80;
  BOOL v6 = a3;
  v5[4] = self;
  [(ICQDaemonOfferManager *)self clearFollowupsOfferType:3 completion:v5];
}

void __62__ICQDaemonOfferManager__teardownCachedDefaultOfferAndNotify___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = _ICQGetLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "default daemon offer torn down without replacement; notifying clients",
        buf,
        2u);
    }

    [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:1];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "default daemon offer torn down but will be replaced; not notifying clients until then",
        v5,
        2u);
    }
  }
}

- (void)_teardownCachedBuddyOffer
{
}

- (void)_teardownCachedPremiumOfferAndNotify:(BOOL)a3
{
  +[ICQDaemonPersisted clearPersistedObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__ICQDaemonOfferManager__teardownCachedPremiumOfferAndNotify___block_invoke;
  v5[3] = &unk_1E6A52C80;
  BOOL v6 = a3;
  v5[4] = self;
  [(ICQDaemonOfferManager *)self clearFollowupsOfferType:2 completion:v5];
}

void __62__ICQDaemonOfferManager__teardownCachedPremiumOfferAndNotify___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = _ICQGetLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "premium daemon offer / followups were torn down without replacement; notifying clients",
        buf,
        2u);
    }

    [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:2];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "premium daemon offer / alerts / followups were torn down but will be replaced; not notifying clients until then",
        v5,
        2u);
    }
  }
}

- (void)_teardownCachedEventOfferAndNotify:(BOOL)a3
{
  +[ICQDaemonPersisted clearPersistedObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__ICQDaemonOfferManager__teardownCachedEventOfferAndNotify___block_invoke;
  v5[3] = &unk_1E6A52C80;
  BOOL v6 = a3;
  v5[4] = self;
  [(ICQDaemonOfferManager *)self clearFollowupsOfferType:5 completion:v5];
}

void __60__ICQDaemonOfferManager__teardownCachedEventOfferAndNotify___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = _ICQGetLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "premium daemon offer / followups were torn down without replacement; notifying clients",
        buf,
        2u);
    }

    [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:5];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "premium daemon offer / alerts / followups were torn down but will be replaced; not notifying clients until then",
        v5,
        2u);
    }
  }
}

- (void)_teardownCachedOffersAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _ICQSignpostLogSystem();
  os_signpost_id_t v6 = _ICQSignpostCreate(v5);

  uint64_t v7 = _ICQSignpostLogSystem();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v9 = &stru_1F2DCE430;
    if (v3) {
      os_signpost_id_t v9 = @"and notify";
    }
    int v11 = 138412290;
    id v12 = v9;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v8, OS_SIGNPOST_EVENT, v6, "TeardownAllOffers", " enableTelemetry=YES %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(ICQDaemonOfferManager *)v6 _teardownCachedOffersAndNotify:v10];
  }

  +[ICQDaemonPersisted clearPersistedObject];
  [(ICQDaemonOfferManager *)self _teardownCachedBuddyOffer];
  [(ICQDaemonOfferManager *)self _teardownCachedPremiumOfferAndNotify:v3];
  [(ICQDaemonOfferManager *)self _teardownCachedEventOfferAndNotify:v3];
  [(ICQDaemonOfferManager *)self _teardownCachedOfferAndNotify:v3];
  [(ICQDaemonOfferManager *)self _teardownCachedDefaultOfferAndNotify:v3];
  [(ICQDaemonOfferManager *)self _subdTearDown];
}

+ (NSString)ckBackupDeviceID
{
  return (NSString *)+[ICQDaemonOfferManager getCkBackupDeviceIDWithCompletionHandler:0];
}

+ (id)getCkBackupDeviceIDWithCompletionHandler:(id)a3
{
  BOOL v3 = (void (**)(id, void *))a3;
  if (getCkBackupDeviceIDWithCompletionHandler__onceToken != -1) {
    dispatch_once(&getCkBackupDeviceIDWithCompletionHandler__onceToken, &__block_literal_global_360);
  }
  if (v3)
  {
    BOOL v4 = [(id)getCkBackupDeviceIDWithCompletionHandler__loader value];

    if (v4)
    {
      uint64_t v5 = [(id)getCkBackupDeviceIDWithCompletionHandler__loader value];
      v3[2](v3, v5);
    }
    else
    {
      [(id)getCkBackupDeviceIDWithCompletionHandler__loader setDidUpdate:v3];
    }
  }
  os_signpost_id_t v6 = [(id)getCkBackupDeviceIDWithCompletionHandler__loader value];

  return v6;
}

uint64_t __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke()
{
  v0 = [[ICQAsyncValueLoader alloc] initWithDefaultValue:0 valueFetcher:&__block_literal_global_364];
  uint64_t v1 = getCkBackupDeviceIDWithCompletionHandler__loader;
  getCkBackupDeviceIDWithCompletionHandler__loader = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.ind"];

  if (v5)
  {
    os_signpost_id_t v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Fetching CloudKit backup container device id...", buf, 2u);
    }

    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2050000000;
    uint64_t v7 = (void *)getCKContainerClass_softClass;
    uint64_t v20 = getCKContainerClass_softClass;
    if (!getCKContainerClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __getCKContainerClass_block_invoke;
      id v15 = &unk_1E6A52090;
      id v16 = &v17;
      __getCKContainerClass_block_invoke((uint64_t)buf);
      uint64_t v7 = (void *)v18[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v17, 8);
    os_signpost_id_t v9 = [v8 containerWithIdentifier:@"com.apple.backup.ios"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_371;
    v10[3] = &unk_1E6A52CC8;
    id v11 = v2;
    [v9 fetchCurrentDeviceIDWithCompletionHandler:v10];
  }
  else
  {
    (*((void (**)(id, void))v2 + 2))(v2, 0);
  }
}

void __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_371(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _ICQGetLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_371_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Fetched CloudKit backup container device id: %@", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (Class)_daemonOfferClassForRequestType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (id)_placeholderOfferForAccount:(id)a3 requestType:(int64_t)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_msgSend(objc_alloc(-[ICQDaemonOfferManager _daemonOfferClassForRequestType:](self, "_daemonOfferClassForRequestType:", a4)), "_initWithAccount:error:", v9, v8);

  [v10 setNotificationID:&stru_1F2DCE430];
  return v10;
}

- (void)_reconsiderOffersForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 choiceHandler:(id)a6 completion:(id)a7
{
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_375(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _persistAndNotifyMissingPlaceholdersForRequestType:*(void *)(a1 + 56) account:*(void *)(a1 + 40)];
  if (!*(unsigned char *)(a1 + 64))
  {
    int v4 = [v3 isDefaultOffer];
    id v5 = *(void **)(a1 + 32);
    if (!v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_2;
      v6[3] = &unk_1E6A52D40;
      v6[4] = v5;
      id v7 = v3;
      id v8 = *(id *)(a1 + 48);
      [v5 _postFollowupForDaemonOffer:v7 replaceExisting:1 completion:v6];

      goto LABEL_6;
    }
    [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_6:
}

uint64_t __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_381(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 offerId];
  int v4 = [v3 isEqualToString:&stru_1F2DCE430];

  if (v4)
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v2 serverDictionary];
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Missing offer id in stub %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return v4 ^ 1u;
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_385(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_2_386;
  v6[3] = &unk_1E6A52DB0;
  v6[4] = v3;
  char v8 = *(unsigned char *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _subdFetchDaemonOfferForAccount:v4 stub:v5 notificationID:0 isoNewOfferResponse:a2 completion:v6];
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_2_386(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  id v7 = a2;
  [v5 _logErrorsForFetchOfferResultWithOffer:v7 error:a3 isForBuddy:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3_387(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  id v7 = a2;
  [v5 _logErrorsForFetchOfferResultWithOffer:v7 error:a3 isForBuddy:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_getStubsForRequestType:(int64_t)a3 fromDaemonStubs:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  switch(a3)
  {
    case 0:
      char v8 = _ICQGetLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Choosing all available stubs", buf, 2u);
      }

      id v9 = [(ICQDaemonOfferManager *)self _getFetchOfferStubsFromStubs:v7];
      goto LABEL_28;
    case 1:
      uint64_t v10 = [v6 chooseDefaultStub];
      if (!v10) {
        goto LABEL_26;
      }
      uint64_t v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v10;
        _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Chose default stub %@", buf, 0xCu);
      }

      uint64_t v21 = v10;
      id v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = &v21;
      goto LABEL_25;
    case 2:
      uint64_t v10 = [v6 choosePremiumStub];
      if (!v10) {
        goto LABEL_26;
      }
      id v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v10;
        _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "Chose premium stub %@", buf, 0xCu);
      }

      id v22 = v10;
      id v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = &v22;
      goto LABEL_25;
    case 4:
      uint64_t v10 = [v6 chooseBuddyStub];
      id v16 = _ICQGetLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v10;
        _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "ChooseBuddyStub returned stub %@", buf, 0xCu);
      }

      if (!v10) {
        goto LABEL_26;
      }
      id v23 = v10;
      id v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = &v23;
      goto LABEL_25;
    case 5:
      uint64_t v10 = [v6 chooseEventStub];
      if (!v10) {
        goto LABEL_26;
      }
      uint64_t v17 = _ICQGetLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v10;
        _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "Chose backup restored stub %@", buf, 0xCu);
      }

      uint64_t v20 = v10;
      id v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = &v20;
      goto LABEL_25;
    default:
      uint64_t v10 = [v6 chooseStub];
      if (v10)
      {
        id v15 = _ICQGetLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v10;
          _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "Chose regular stub %@", buf, 0xCu);
        }

        uint64_t v19 = v10;
        id v12 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v13 = &v19;
LABEL_25:
        id v9 = [v12 arrayWithObjects:v13 count:1];
      }
      else
      {
LABEL_26:
        id v9 = 0;
      }

LABEL_28:
      return v9;
  }
}

- (id)_getFetchOfferStubsFromStubs:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v3 chooseStub];
  id v6 = [v3 choosePremiumStub];
  id v7 = [v3 chooseEventStub];
  char v8 = [v3 chooseDefaultStub];

  if (v5)
  {
    id v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Adding regular offer stub %@", (uint8_t *)&v14, 0xCu);
    }

    [v4 addObject:v5];
  }
  if (v6)
  {
    uint64_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "Adding premium offer stub %@", (uint8_t *)&v14, 0xCu);
    }

    [v4 addObject:v6];
  }
  if (v7)
  {
    uint64_t v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Adding event offer stub %@", (uint8_t *)&v14, 0xCu);
    }

    [v4 addObject:v7];
  }
  if (v8)
  {
    id v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Adding default offer stub %@", (uint8_t *)&v14, 0xCu);
    }

    [v4 addObject:v8];
  }

  return v4;
}

- (void)_handlerMultipleStubs:(id)a3 forAccount:(id)a4 requestType:(int64_t)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v21 = (void (**)(void))a6;
  uint64_t v11 = dispatch_group_create();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    uint64_t v20 = v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "serverDictionary", v20);
        BOOL v18 = +[ICQMLProtocolParser shouldCallMlDaemonForFetchOfferStub:v17];

        if (v18)
        {
          [(ICQDaemonOfferManager *)self _subdHandleFetchOffersStub:v16 account:v10 requestType:a5 group:v11 completion:v21];
        }
        else
        {
          dispatch_group_enter(v11);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v25[0] = __81__ICQDaemonOfferManager__handlerMultipleStubs_forAccount_requestType_completion___block_invoke;
          v25[1] = &unk_1E6A52E50;
          v25[2] = self;
          uint64_t v26 = v11;
          [(ICQDaemonOfferManager *)self _fetchDaemonOfferForAccount:v10 stub:v16 notificationID:0 completion:v24];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }

  dispatch_time_t v19 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v11, v19);
  [(ICQDaemonOfferManager *)self _persistAndNotifyMissingPlaceholdersForRequestType:a5 account:v10];
  v21[2](v21);
}

void __81__ICQDaemonOfferManager__handlerMultipleStubs_forAccount_requestType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) _logErrorsForFetchOfferResultWithOffer:v5 error:a3 isForBuddy:0];
  if (v5 && ![v5 isBuddyOffer])
  {
    int v6 = [v5 isDefaultOffer];
    id v7 = *(void **)(a1 + 32);
    if (!v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __81__ICQDaemonOfferManager__handlerMultipleStubs_forAccount_requestType_completion___block_invoke_2;
      v8[3] = &unk_1E6A52E28;
      void v8[4] = v7;
      id v9 = v5;
      id v10 = *(id *)(a1 + 40);
      [v7 _postFollowupForDaemonOffer:v9 replaceExisting:1 completion:v8];

      goto LABEL_6;
    }
    [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:1];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_6:
}

void __81__ICQDaemonOfferManager__handlerMultipleStubs_forAccount_requestType_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  id v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

- (void)_logErrorsForFetchOfferResultWithOffer:(id)a3 error:(id)a4 isForBuddy:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v8;
      id v10 = "Unexpected error %@";
      uint64_t v11 = v9;
      uint32_t v12 = 12;
LABEL_15:
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
LABEL_16:

    goto LABEL_17;
  }
  if (!v7)
  {
    id v9 = _ICQGetLogSystem();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v14) = 0;
    id v10 = "Error: Unexpected nil daemonOffer";
    goto LABEL_14;
  }
  int v13 = [v7 isBuddyOffer];
  if (v5)
  {
    if ((v13 & 1) == 0)
    {
      id v9 = _ICQGetLogSystem();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      LOWORD(v14) = 0;
      id v10 = "Error: Requested buddy offer but got non-buddy offer!";
LABEL_14:
      uint64_t v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_15;
    }
  }
  else if (v13)
  {
    id v9 = _ICQGetLogSystem();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v14) = 0;
    id v10 = "Error: Requested offer but got buddy offer!";
    goto LABEL_14;
  }
LABEL_17:
}

- (void)_postFollowupForDaemonOffer:(id)a3 replaceExisting:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = [v8 followupSpecification];
  if (v10)
  {
    followUpController = self->_followUpController;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__ICQDaemonOfferManager__postFollowupForDaemonOffer_replaceExisting_completion___block_invoke;
    v19[3] = &unk_1E6A526A0;
    id v20 = v8;
    uint64_t v21 = v9;
    [v10 postFollowupWithController:followUpController replaceExisting:v6 completion:v19];
  }
  else
  {
    -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", [v8 requestType], 0);
    uint32_t v12 = [v8 lockScreenInfo];

    if (v12)
    {
      int v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "there's no follow up info but lock screen info ... attempting to post a user notification", buf, 2u);
      }

      uint64_t v14 = [v8 offerId];
      id v15 = (void *)v14;
      uint64_t v16 = @"Unknown";
      if (v14) {
        uint64_t v16 = (__CFString *)v14;
      }
      uint64_t v17 = v16;

      BOOL v18 = [v8 lockScreenInfo];
      [(ICQDaemonOfferManager *)self _postUserNotification:v18 replaceExisting:v6 offerID:v17 completion:v9];
    }
    else
    {
      v9[2](v9);
    }
  }
}

void __80__ICQDaemonOfferManager__postFollowupForDaemonOffer_replaceExisting_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _ICQGetLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "error %{public}@ posting followup", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v6)
  {
    id v7 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", [*(id *)(a1 + 32) requestType]);
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "posted followup for offer type: %@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_postUserNotification:(id)a3 replaceExisting:(BOOL)a4 offerID:(id)a5 completion:(id)a6
{
  BOOL v41 = a4;
  v51[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v8 objectForKeyedSubscript:@"lockTitle"];
  uint32_t v12 = +[_ICQHelperFunctions parseTemplates:v11];

  int v13 = [v8 objectForKeyedSubscript:@"lockSubTitle"];
  uint64_t v14 = +[_ICQHelperFunctions parseTemplates:v13];

  id v15 = [v8 objectForKeyedSubscript:@"lockMessage"];
  uint64_t v16 = +[_ICQHelperFunctions parseTemplates:v15];

  uint64_t v17 = (void *)v14;
  BOOL v18 = [v12 objectForKeyedSubscript:@"default"];
  dispatch_time_t v19 = [v17 objectForKeyedSubscript:@"default"];
  uint64_t v20 = [v16 objectForKeyedSubscript:@"default"];
  uint64_t v21 = (void *)v20;
  if (!v18 || !v20) {
    goto LABEL_18;
  }
  unint64_t v37 = v19;
  uint64_t v38 = v17;
  uint64_t v22 = [v8 objectForKeyedSubscript:@"actParams"];
  unint64_t v23 = 0x1E4F1C000uLL;
  os_signpost_id_t v40 = (void *)v22;
  if (!v22)
  {
    uint64_t v39 = 0;
    goto LABEL_12;
  }
  uint64_t v24 = [v8 objectForKeyedSubscript:@"action"];
  if (!v24) {
    goto LABEL_9;
  }
  id v25 = (void *)v24;
  v50[0] = @"actParams";
  v50[1] = @"action";
  v51[0] = v40;
  v51[1] = v24;
  v50[2] = @"display";
  v51[2] = &stru_1F2DCE430;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
  long long v27 = _ICQLinkForServerMessageParameter(v26);

  if (!v27)
  {
LABEL_9:
    uint64_t v39 = 0;
LABEL_10:
    unint64_t v23 = 0x1E4F1C000;
LABEL_12:
    id v31 = [*(id *)(v23 + 2832) URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/MANAGE_STORAGE"];
    goto LABEL_13;
  }
  uint64_t v39 = v27;
  long long v28 = [v27 parameters];
  long long v29 = [v28 objectForKeyedSubscript:@"openURL"];

  if (!v29
    || ([MEMORY[0x1E4F1CB10] URLWithString:v29], (uint64_t v30 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v39 action] == 105)
    {
      id v31 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/STORAGE_UPGRADE"];

      unint64_t v23 = 0x1E4F1C000uLL;
      if (v31) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }

    goto LABEL_10;
  }
  id v31 = (void *)v30;

LABEL_13:
  uint64_t v32 = [v8 objectForKeyedSubscript:@"notificationId"];
  BOOL v33 = (void *)v32;
  uint64_t v34 = @"OOBE_EXPIRED";
  if (v32) {
    uint64_t v34 = (__CFString *)v32;
  }
  id v35 = v34;

  uint64_t v36 = _ICQGetLogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v45 = v18;
    __int16 v46 = 2112;
    long long v47 = v21;
    __int16 v48 = 2112;
    uint64_t v49 = v31;
    _os_log_impl(&dword_1D5851000, v36, OS_LOG_TYPE_DEFAULT, "posting user notification, title:%@, message:%@, url:%@", buf, 0x20u);
  }

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __82__ICQDaemonOfferManager__postUserNotification_replaceExisting_offerID_completion___block_invoke;
  v42[3] = &unk_1E6A52E78;
  id v43 = v10;
  +[ICQUserNotifications postUserNotificationWithIdentifier:v35 title:v18 subTitle:v37 bodyText:v21 url:v31 replaceExisting:v41 offerID:v9 completion:v42];

  dispatch_time_t v19 = v37;
  uint64_t v17 = v38;
LABEL_18:
}

void __82__ICQDaemonOfferManager__postUserNotification_replaceExisting_offerID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __82__ICQDaemonOfferManager__postUserNotification_replaceExisting_offerID_completion___block_invoke_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)postOfferType:(id)a3
{
}

- (void)postBuddyOfferType:(id)a3
{
}

- (void)_postOfferType:(id)a3 isForBuddy:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICQDaemonOfferManager *)self accountManager];
  id v8 = [v7 accountStore];

  id v9 = objc_msgSend(v8, "aa_primaryAppleAccount");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__ICQDaemonOfferManager__postOfferType_isForBuddy___block_invoke;
  aBlock[3] = &unk_1E6A52EA0;
  id v10 = v6;
  id v19 = v10;
  BOOL v20 = v4;
  uint64_t v11 = _Block_copy(aBlock);
  if (!v4) {
    +[ICQDaemonPersisted clearPersistedObject];
  }
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__ICQDaemonOfferManager__postOfferType_isForBuddy___block_invoke_2;
  v15[3] = &unk_1E6A52678;
  id v16 = v8;
  dispatch_semaphore_t v17 = v12;
  int v13 = v12;
  id v14 = v8;
  [(ICQDaemonOfferManager *)self _reconsiderOffersForAccount:v9 isForBuddy:v4 quotaReason:@"icqctl" choiceHandler:v11 completion:v15];
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
}

id __51__ICQDaemonOfferManager__postOfferType_isForBuddy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = _ICQOfferTypeForString(v3);
  if (*(unsigned char *)(a1 + 40)) {
    [v4 chooseBuddyStubForOfferType:v5];
  }
  else {
  id v6 = [v4 chooseStubForOfferType:v5];
  }

  return v6;
}

intptr_t __51__ICQDaemonOfferManager__postOfferType_isForBuddy___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)forcePostFollowup
{
  id v3 = [(ICQDaemonOfferManager *)self accountManager];
  id v4 = [v3 accountStore];

  uint64_t v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ICQDaemonOfferManager_forcePostFollowup__block_invoke;
  v9[3] = &unk_1E6A52678;
  id v10 = v4;
  dispatch_semaphore_t v11 = v6;
  id v7 = v6;
  id v8 = v4;
  [(ICQDaemonOfferManager *)self _reconsiderOffersForAccount:v5 isForBuddy:0 quotaReason:@"icqctl" choiceHandler:0 completion:v9];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __42__ICQDaemonOfferManager_forcePostFollowup__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)teardownCachedOffer
{
}

- (void)tearDownCachedPremiumOffer
{
}

- (void)tearDownCachedEventOffer
{
}

- (void)teardownCachedOffers
{
}

- (void)setShouldDirectToStorageManagement:(BOOL)a3
{
  int v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = [(ICQDaemonOfferManager *)self shouldDirectToStorageManagement];
  uint64_t v5 = _ICQGetLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == v3)
  {
    if (v6)
    {
      int v8 = 136315138;
      id v9 = "-[ICQDaemonOfferManager setShouldDirectToStorageManagement:]";
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "%s: value didn't change. Exiting early.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v3)
    {
      if (v6)
      {
        int v8 = 136315138;
        id v9 = "-[ICQDaemonOfferManager setShouldDirectToStorageManagement:]";
        _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "%s: setting cached value to true.", (uint8_t *)&v8, 0xCu);
      }

      id v7 = (const void *)*MEMORY[0x1E4F1CFD0];
    }
    else
    {
      if (v6)
      {
        int v8 = 136315138;
        id v9 = "-[ICQDaemonOfferManager setShouldDirectToStorageManagement:]";
        _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "%s: removing cached value.", (uint8_t *)&v8, 0xCu);
      }

      id v7 = 0;
    }
    CFPreferencesSetAppValue(@"_ICQShouldDirectToStorageManagement", v7, @"com.apple.cloud.quota");
    CFPreferencesAppSynchronize(@"com.apple.cloud.quota");
  }
}

- (BOOL)isSimulatedDeviceStorageAlmostFull
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"_ICQSimulatedDeviceStorageAlmostFull", @"com.apple.cloud.quota", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  BOOL v3 = !v2;
  int v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (v3) {
      uint64_t v5 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    id v9 = "-[ICQDaemonOfferManager isSimulatedDeviceStorageAlmostFull]";
    __int16 v10 = 2114;
    dispatch_semaphore_t v11 = v5;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "%s: returning value %{public}@.", buf, 0x16u);
  }

  return v3;
}

- (void)setSimulatedDeviceStorageAlmostFull:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = _ICQGetLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v7 = 136315138;
      int v8 = "-[ICQDaemonOfferManager setSimulatedDeviceStorageAlmostFull:]";
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "%s: setting cached value to true.", (uint8_t *)&v7, 0xCu);
    }

    BOOL v6 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  else
  {
    if (v5)
    {
      int v7 = 136315138;
      int v8 = "-[ICQDaemonOfferManager setSimulatedDeviceStorageAlmostFull:]";
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "%s: removing cached value.", (uint8_t *)&v7, 0xCu);
    }

    BOOL v6 = 0;
  }
  CFPreferencesSetAppValue(@"_ICQSimulatedDeviceStorageAlmostFull", v6, @"com.apple.cloud.quota");
  CFPreferencesAppSynchronize(@"com.apple.cloud.quota");
}

- (BOOL)isBuddyOfferEnabled
{
  BOOL v2 = (void *)CFPreferencesCopyAppValue(@"_ICQBuddyOfferEnable", @"com.apple.cloud.quota");
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (void)setBuddyOfferEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    char v3 = 0;
  }
  CFPreferencesSetAppValue(@"_ICQBuddyOfferEnable", v3, @"com.apple.cloud.quota");
  CFPreferencesAppSynchronize(@"com.apple.cloud.quota");
}

- (NSNumber)simulatedPhotosLibrarySize
{
  BOOL v2 = (void *)CFPreferencesCopyAppValue(@"_ICQSimulatedPhotosLibrarySize", @"com.apple.cloud.quota");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));

    BOOL v2 = (void *)v3;
  }
  return (NSNumber *)v2;
}

- (void)setSimulatedPhotosLibrarySize:(id)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  CFPreferencesSetAppValue(@"_ICQSimulatedPhotosLibrarySize", v3, @"com.apple.cloud.quota");
  CFPreferencesAppSynchronize(@"com.apple.cloud.quota");
}

- (BOOL)isLegacyDeviceStorageLevelNotificationEnabled
{
  return CFPreferencesGetAppBooleanValue(@"_ICQLegacyDeviceStorageLevelNotification", @"com.apple.cloud.quota", 0) != 0;
}

- (void)setLegacyDeviceStorageLevelNotificationEnabled:(BOOL)a3
{
  if (a3) {
    id v3 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    id v3 = 0;
  }
  CFPreferencesSetAppValue(@"_ICQLegacyDeviceStorageLevelNotification", v3, @"com.apple.cloud.quota");
  CFPreferencesAppSynchronize(@"com.apple.cloud.quota");
}

- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "[SUBD] Previously delayed offer is ready to be presented.", v9, 2u);
  }

  [(ICQDaemonOfferManager *)self _subdDisplayDelayedOfferWithContext:v7 completion:v6];
}

- (void)setTaskLimiters:(id)a3
{
}

- (NSURLSession)sharedURLSession
{
  return self->_sharedURLSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_taskLimiters, 0);
  objc_storeStrong((id *)&self->_throttleController, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_sharedURLSession, 0);
}

- (void)_subdStopFailsafeActivity
{
  BOOL v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1D5851000, v2, OS_LOG_TYPE_DEFAULT, "[SUBD] Cancelling the failsafe activity.", v3, 2u);
  }

  +[ICQDelayedOfferFailsafeActivityController stopActivityWithCompletion:&__block_literal_global_570];
}

void __85__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdStopFailsafeActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully cancelled failsafe activity. error=[%@]", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_subdRefreshOfferDetailsAndDisplay:(id)a3 completion:(id)a4 account:(id)a5 accountStore:(id)a6 notificationID:(id)a7 isoNewOfferResponse:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  BOOL v20 = _ICQGetLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v18;
    _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "refreshing offer details for notificationID %@", buf, 0xCu);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke;
  void v25[3] = &unk_1E6A52EF0;
  v25[4] = self;
  id v26 = v14;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  id v21 = v15;
  id v22 = v16;
  id v23 = v17;
  id v24 = v14;
  [(ICQDaemonOfferManager *)self _subdFetchDaemonOfferForAccount:v22 stub:0 notificationID:v18 isoNewOfferResponse:v19 completion:v25];
}

void __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    int v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v7;
      _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "fetch error %@", buf, 0xCu);
    }

    id v14 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke_571;
    v15[3] = &unk_1E6A52920;
    void v15[4] = v14;
    dispatch_semaphore_t v11 = &v16;
    id v16 = *(id *)(a1 + 64);
    [v14 clearAllFollowupsWithCompletion:v15];
  }
  else
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v5 offerId];
    [v8 _clearCachedStubsIfOfferIDIsNew:v9];

    __int16 v10 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke_2;
    v17[3] = &unk_1E6A52EC8;
    v17[4] = v10;
    dispatch_semaphore_t v11 = &v18;
    id v12 = v5;
    id v18 = v12;
    id v19 = *(id *)(a1 + 40);
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 64);
    [v10 _postFollowupForDaemonOffer:v12 replaceExisting:1 completion:v17];
  }
}

uint64_t __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  id v2 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"debugAlert"];

  if (v2) {
    [*(id *)(a1 + 40) _addSampleAlert];
  }
  BOOL v3 = +[ICQDaemonAlert shouldShowForDaemonOffer:*(void *)(a1 + 40)];
  int v4 = _ICQGetLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "showing alert", buf, 2u);
    }

    return [*(id *)(a1 + 32) _showDaemonAlertForOffer:*(void *)(a1 + 40) notificationDictionary:*(void *)(a1 + 48) store:*(void *)(a1 + 56) account:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "skipping alert", v7, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke_571(uint64_t a1)
{
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:3];
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:1];
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:2];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_subdFetchDaemonOfferForAccount:(id)a3 stub:(id)a4 notificationID:(id)a5 isoNewOfferResponse:(id)a6 completion:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  unint64_t v13 = (unint64_t)a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  id v16 = a7;
  if (!(v13 | v14))
  {
    id v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "WARNING: both stub and notificationID are nil -- attempting blind refresh", buf, 2u);
    }
  }
  id v18 = _ICQSignpostLogSystem();
  id v19 = objc_opt_new();
  os_signpost_id_t v20 = _ICQSignpostCreateWithObject(v18, v19);
  uint64_t v33 = v21;

  id v22 = _ICQSignpostLogSystem();
  id v23 = v22;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v20, "RefreshOfferDetails", " enableTelemetry=YES ", buf, 2u);
  }

  id v24 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[ICQDaemonOfferManager _coalescedFetchDaemonOfferForAccount:stub:notificationID:completion:]();
  }

  if (v15 && ([v15 error], uint64_t v25 = objc_claimAutoreleasedReturnValue(), v25, !v25))
  {
    id v27 = [v15 toContext];
    uint64_t v32 = _ICQGetLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v27;
      _os_log_impl(&dword_1D5851000, v32, OS_LOG_TYPE_DEFAULT, "[SUBD] RefreshOfferDetails request will contain extra fields=[%@].", buf, 0xCu);
    }

    if ([v15 shouldDisplayOfferNow]) {
      [(ICQDaemonOfferManager *)self _subdStopFailsafeActivity];
    }
  }
  else
  {
    id v26 = _ICQGetLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v15;
      _os_log_impl(&dword_1D5851000, v26, OS_LOG_TYPE_DEFAULT, "[SUBD] Not passing extra RefreshOfferDetails arguments. isoNewOfferResponse=[%@]", buf, 0xCu);
    }

    id v27 = 0;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __143__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchDaemonOfferForAccount_stub_notificationID_isoNewOfferResponse_completion___block_invoke;
  v34[3] = &unk_1E6A52BB8;
  id v35 = (id)v13;
  uint64_t v36 = self;
  id v37 = v12;
  id v38 = (id)v14;
  os_signpost_id_t v40 = v20;
  uint64_t v41 = v33;
  id v39 = v16;
  id v28 = v16;
  id v29 = (id)v14;
  id v30 = v12;
  id v31 = (id)v13;
  [(ICQDaemonOfferManager *)self _fetchDictionaryForAccount:v30 quotaKey:@"quotaRefreshOfferDetailsURL" quotaReason:@"RefreshOfferDetails" stub:v31 notificationID:v29 contextDictionary:0 mlDaemonExtraFields:v27 completion:v34];
}

void __143__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchDaemonOfferForAccount_stub_notificationID_isoNewOfferResponse_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (ICQDaemonOfferStub *)*(id *)(a1 + 32);
  int v8 = [[ICQDaemonOfferStub alloc] initWithServerDictionary:v5];
  if (v5) {
    id v9 = v5;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }
  +[ICQMLBiomePublisher publishEventWithRefreshOfferDetailsResponse:v9];
  if (v7)
  {
    if (v5)
    {
      __int16 v10 = [(ICQDaemonOfferStub *)v7 offerId];
      dispatch_semaphore_t v11 = [(ICQDaemonOfferStub *)v8 offerId];
      char v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        unint64_t v13 = _ICQGetLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_cold_1(v8, v7);
        }
      }
      if ([(ICQDaemonOfferStub *)v7 isBuddyOffer]
        && ![(ICQDaemonOfferStub *)v8 isBuddyOffer])
      {
        unint64_t v14 = _ICQGetLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "missing buddyOffer flag after refresh offer details", buf, 2u);
        }
      }
    }
  }
  else
  {
    id v7 = v8;
  }
  id v15 = [(ICQDaemonOfferStub *)v7 conditionsWhenChosen];
  if (v15) {
    [(ICQDaemonOfferStub *)v7 conditionsWhenChosen];
  }
  else {
  id v16 = +[ICQDaemonOfferConditions currentConditions];
  }

  id v17 = [(ICQDaemonOfferStub *)v8 criteria];
  char v18 = [v17 isSatisfiedByConditions:v16];

  if (v18)
  {
    if (v5)
    {
      id v46 = v6;
      id v19 = (objc_class *)[*(id *)(a1 + 40) _classForOfferStub:v8];
      ICQLogOfferDetailsForServerDictionary(v5);
      [*(id *)(a1 + 40) _updateQuotaForAccount:*(void *)(a1 + 48) withServerDictionary:v5];
      os_signpost_id_t v20 = (void *)[[v19 alloc] _initWithAccount:*(void *)(a1 + 48) serverDictionary:v5];
      [v20 setNotificationID:*(void *)(a1 + 56)];
      [v20 cacheLiftUIContent];
      [v20 persistObject];
      unint64_t Nanoseconds = _ICQSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
      id v22 = _ICQSignpostLogSystem();
      id v23 = v22;
      os_signpost_id_t v24 = *(void *)(a1 + 72);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)__int16 v48 = v19;
        _os_signpost_emit_with_name_impl(&dword_1D5851000, v23, OS_SIGNPOST_INTERVAL_END, v24, "RefreshOfferDetails", "%@", buf, 0xCu);
      }

      uint64_t v25 = _ICQSignpostLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)__int16 v48 = *(unsigned __int16 *)(a1 + 72);
        *(_WORD *)&v48[4] = 2048;
        *(double *)&v48[6] = (double)Nanoseconds / 1000000000.0;
        *(_WORD *)&v48[14] = 2112;
        *(void *)&v48[16] = v19;
        _os_log_debug_impl(&dword_1D5851000, v25, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) RefreshOfferDetails %@", buf, 0x1Cu);
      }

      id v26 = _ICQGetLogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v20 expirationDate];
        *(_DWORD *)buf = 138543618;
        *(void *)__int16 v48 = v19;
        *(_WORD *)&v48[8] = 2112;
        *(void *)&v48[10] = v27;
        _os_log_impl(&dword_1D5851000, v26, OS_LOG_TYPE_DEFAULT, "Finished persisting %{public}@ offer; expires on %@",
          buf,
          0x16u);
      }
      uint64_t v28 = *(void *)(a1 + 64);
      if (v28) {
        (*(void (**)(uint64_t, void *, void))(v28 + 16))(v28, v20, 0);
      }

      id v29 = v46;
      goto LABEL_58;
    }
  }
  else
  {
    id v30 = _ICQGetLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v30, OS_LOG_TYPE_DEFAULT, "Fetched offer is not valid in current conditions, invalidating both old and new offers", buf, 2u);
    }

    id v31 = [(ICQDaemonOfferStub *)v8 offerResetURL];

    uint64_t v32 = _ICQGetLogSystem();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v32, OS_LOG_TYPE_DEFAULT, "Updating server with invalid fetched offer status", buf, 2u);
      }

      [*(id *)(a1 + 40) _fetchDictionaryForAccount:*(void *)(a1 + 48) quotaKey:@"quotaOfferReset" quotaReason:@"OfferReset" stub:v8 notificationID:*(void *)(a1 + 56) contextDictionary:0 mlDaemonExtraFields:0 completion:&__block_literal_global_574];
    }
    else
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v32, OS_LOG_TYPE_DEFAULT, "No offerResetURL provided in fetched offer, unable to notify server", buf, 2u);
      }
    }
  }
  uint64_t v34 = _ICQGetLogSystem();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    if ([(ICQDaemonOfferStub *)v7 isBuddyOffer]) {
      id v35 = @"buddy ";
    }
    else {
      id v35 = &stru_1F2DCE430;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)__int16 v48 = v6;
    *(_WORD *)&v48[8] = 2114;
    *(void *)&v48[10] = v35;
    _os_log_impl(&dword_1D5851000, v34, OS_LOG_TYPE_DEFAULT, "error %{public}@ occurred fetching %{public}@offer -- persisting placeholder", buf, 0x16u);
  }

  uint64_t v36 = [*(id *)(a1 + 40) _classForOfferStub:v7];
  id v29 = v6;
  objc_msgSend(*(id *)(a1 + 40), "_placeholderOfferForAccount:requestType:error:", *(void *)(a1 + 48), -[ICQDaemonOfferStub requestType](v7, "requestType"), v6);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 persistObject];
  unint64_t v37 = _ICQSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
  id v38 = _ICQSignpostLogSystem();
  id v39 = v38;
  os_signpost_id_t v40 = *(void *)(a1 + 72);
  if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v48 = v36;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v39, OS_SIGNPOST_INTERVAL_END, v40, "RefreshOfferDetails", "%@", buf, 0xCu);
  }

  uint64_t v41 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v48 = *(unsigned __int16 *)(a1 + 72);
    *(_WORD *)&v48[4] = 2048;
    *(double *)&v48[6] = (double)v37 / 1000000000.0;
    *(_WORD *)&v48[14] = 2112;
    *(void *)&v48[16] = v36;
    _os_log_debug_impl(&dword_1D5851000, v41, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) RefreshOfferDetails %@", buf, 0x1Cu);
  }

  id v42 = _ICQGetLogSystem();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    if ([(ICQDaemonOfferStub *)v7 isBuddyOffer]) {
      id v43 = @"buddy ";
    }
    else {
      id v43 = &stru_1F2DCE430;
    }
    uint64_t v44 = [v5 expirationDate];
    *(_DWORD *)buf = 138543618;
    *(void *)__int16 v48 = v43;
    *(_WORD *)&v48[8] = 2112;
    *(void *)&v48[10] = v44;
    _os_log_impl(&dword_1D5851000, v42, OS_LOG_TYPE_DEFAULT, "Finished persisting placeholder %{public}@ offer; expires on %@",
      buf,
      0x16u);
  }
  uint64_t v45 = *(void *)(a1 + 64);
  if (v45) {
    (*(void (**)(uint64_t, id, void))(v45 + 16))(v45, v5, 0);
  }
LABEL_58:
}

void __143__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchDaemonOfferForAccount_stub_notificationID_isoNewOfferResponse_completion___block_invoke_572(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    int v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_345_cold_1();
    }
  }
}

- (void)_subdFetchNewOfferResponseWithContent:(id)a3 andMaxDelaySecs:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v7 shouldCallMlDaemon];
  dispatch_semaphore_t v11 = _ICQGetLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8 && v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = [v8 intValue];
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "[SUBD] Installing a the failsafe activity with maxDelaySecs=[%d].", buf, 8u);
    }

    [v8 doubleValue];
    uint64_t v14 = (uint64_t)v13;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke;
    v15[3] = &unk_1E6A52F40;
    id v16 = v7;
    id v17 = v9;
    +[ICQDelayedOfferFailsafeActivityController startActivityWithDelaySecs:v14 completion:v15];
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "[SUBD] Skipping call to SubscriptionD and using the normal IND code flow. notificationContent=[%@] maxDelaySecs=[%@]", buf, 0x16u);
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_cold_2();
    }
  }
  id v5 = _ICQSignpostLogSystem();
  id v6 = objc_opt_new();
  os_signpost_id_t v7 = _ICQSignpostCreateWithObject(v5, v6);
  uint64_t v9 = v8;

  int v10 = _ICQSignpostLogSystem();
  dispatch_semaphore_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "QuotaClientNewOffer", " enableTelemetry=YES ", buf, 2u);
  }

  BOOL v12 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_cold_1();
  }

  double v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v14;
    _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "[SUBD] Calling SubscriptionD with content=[%@].", buf, 0xCu);
  }

  id v15 = [MEMORY[0x1E4FB8348] shared];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_575;
  v17[3] = &unk_1E6A52F18;
  os_signpost_id_t v19 = v7;
  uint64_t v20 = v9;
  uint64_t v16 = *(void *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  [v15 newOffer:v16 andCallback:v17];
}

void __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_575(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t Nanoseconds = _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _ICQSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v9 = 138412290;
    *(void *)int v10 = v3;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v6, OS_SIGNPOST_INTERVAL_END, v7, "QuotaClientNewOffer", "[SUBD] Async call to SubscriptionD with response=[%@].", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 67109634;
    *(_DWORD *)int v10 = *((unsigned __int16 *)a1 + 20);
    *(_WORD *)&void v10[4] = 2048;
    *(double *)&v10[6] = (double)Nanoseconds / 1000000000.0;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_debug_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) QuotaClientNewOffer [SUBD] Async call to SubscriptionD with response=[%@].", (uint8_t *)&v9, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)_subdHandleFetchOffersStub:(id)a3 account:(id)a4 requestType:(int64_t)a5 group:(id)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_group_enter(v12);
  uint64_t v13 = [MEMORY[0x1E4FB8348] shared];
  uint64_t v14 = [v10 serverDictionary];
  id v15 = [v13 parseNotification:v14];

  uint64_t v16 = [v10 serverDictionary];
  id v17 = +[ICQMLProtocolParser parseMaxDelaySecsFromFetchOffersResponse:v16];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke;
  v21[3] = &unk_1E6A52F68;
  void v21[4] = self;
  id v22 = v11;
  id v23 = v10;
  os_signpost_id_t v24 = v12;
  id v18 = v12;
  id v19 = v10;
  id v20 = v11;
  [(ICQDaemonOfferManager *)self _subdFetchNewOfferResponseWithContent:v15 andMaxDelaySecs:v17 completion:v21];
}

void __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke_2;
  v6[3] = &unk_1E6A52E50;
  v6[4] = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _subdFetchDaemonOfferForAccount:v4 stub:v5 notificationID:0 isoNewOfferResponse:a2 completion:v6];
}

void __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) _logErrorsForFetchOfferResultWithOffer:v5 error:a3 isForBuddy:0];
  if (v5 && ![v5 isBuddyOffer])
  {
    int v6 = [v5 isDefaultOffer];
    id v7 = *(void **)(a1 + 32);
    if (!v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke_3;
      v8[3] = &unk_1E6A52E28;
      void v8[4] = v7;
      id v9 = v5;
      id v10 = *(id *)(a1 + 40);
      [v7 _postFollowupForDaemonOffer:v9 replaceExisting:1 completion:v8];

      goto LABEL_6;
    }
    [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:1];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_6:
}

void __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  id v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

- (void)_subdDisplayDelayedOfferWithContext:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4FB8348];
  id v8 = a3;
  id v9 = [v7 shared];
  id v10 = [v9 parseDelayedOfferFromJson:v8];

  id v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v10;
    _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "[SUBD] Parsed the delayed offer context=[%@].", buf, 0xCu);
  }

  if (v10)
  {
    id v12 = [v10 serverDict];
    uint64_t v13 = (void *)[v10 newOfferResponse];
    uint64_t v14 = [v12 objectForKeyedSubscript:@"notificationId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
    }
    else
    {
      if (v12)
      {
        uint64_t v16 = [[ICQDaemonOfferStub alloc] initWithServerDictionary:v12];
        id v15 = 0;
LABEL_11:

        goto LABEL_12;
      }
      id v15 = 0;
    }
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  uint64_t v13 = 0;
  id v15 = 0;
  uint64_t v16 = 0;
LABEL_12:
  id v17 = [MEMORY[0x1E4F179C8] defaultStore];
  id v18 = objc_msgSend(v17, "aa_primaryAppleAccount");
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke;
  v22[3] = &unk_1E6A52860;
  void v22[4] = self;
  id v23 = v17;
  id v24 = v18;
  id v25 = v6;
  id v19 = v6;
  id v20 = v18;
  id v21 = v17;
  [(ICQDaemonOfferManager *)self _subdFetchDaemonOfferForAccount:v20 stub:v16 notificationID:v15 isoNewOfferResponse:v13 completion:v22];
}

void __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v7;
      _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Fetch offer error [%@] for a delayed offer notification.", buf, 0xCu);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_577;
    void v14[3] = &unk_1E6A52FB8;
    v14[4] = v13;
    id v9 = &v16;
    id v16 = *(id *)(a1 + 56);
    id v11 = &v15;
    id v15 = v7;
    [v13 clearAllFollowupsWithCompletion:v14];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_2;
    v17[3] = &unk_1E6A52F90;
    void v17[4] = v8;
    id v9 = &v18;
    id v10 = v5;
    id v18 = v10;
    id v11 = &v19;
    id v19 = *(id *)(a1 + 40);
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    [v8 _postFollowupForDaemonOffer:v10 replaceExisting:1 completion:v17];
  }
}

void __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  BOOL v2 = +[ICQDaemonAlert shouldShowForDaemonOffer:*(void *)(a1 + 40)];
  id v3 = _ICQGetLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "Showing the alert triggered by a delayed offer notification.", buf, 2u);
    }

    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_576;
    v9[3] = &unk_1E6A528D0;
    id v10 = *(id *)(a1 + 64);
    [v5 _showDaemonAlertForOffer:v6 notificationDictionary:0 store:v7 account:v8 completion:v9];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "Skipping alert from a delayed offer notification.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_576(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_577(uint64_t a1)
{
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:3];
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:1];
  [*(id *)(a1 + 32) _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:2];
  BOOL v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)_subdTearDown
{
  id v2 = [MEMORY[0x1E4FB8348] shared];
  [v2 clearNotificationState:&__block_literal_global_579];
}

void __73__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdTearDown__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _ICQGetLogSystem();
  BOOL v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __73__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdTearDown__block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Successfully cleaned up the Subscription Daemon state.", v5, 2u);
  }
}

void __60__ICQDaemonOfferManager_clearFollowupsOfferType_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:*(void *)(a2 + 40)];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D5851000, v3, v4, "Failed to clear followup with error %{public}@, offerType: %@", v5, v6, v7, v8, 2u);
}

- (void)_coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D5851000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) FetchOffers ", v2, v3, v4, v5, v6);
}

- (void)_coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST BEGIN [id: %hu]: FetchOffers  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __107__ICQDaemonOfferManager__coalescedDaemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D5851000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) FetchOffers ", v2, v3, v4, v5, v6);
}

- (void)_daemonLocalOfferStubsDictionaryForAccount:(os_log_t)log requestType:completion:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "Invalid cache while reconsidering offers locally", v1, 2u);
}

- (void)_processPushNotificationCheckHardwareIDWithDictionary:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST EVENT [id: %hu] PushNotification  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

- (void)_clearCachedStubsIfOfferIDIsNew:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D5851000, log, OS_LOG_TYPE_DEBUG, "Found a matching cached offer. Skipping cache clear for fetchOffers on alert push.", v1, 2u);
}

- (void)_clearCachedStubsIfOfferIDIsNew:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D5851000, v0, OS_LOG_TYPE_DEBUG, "Offer ID %@ is a new offer! Clearing fetchOffers cache.", v1, 0xCu);
}

- (void)_coalescedFetchDaemonOfferForAccount:stub:notificationID:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST BEGIN [id: %hu]: RefreshOfferDetails  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v3 = [a1 offerId];
  uint64_t v4 = [a2 offerId];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D5851000, v5, v6, "Fetched offerId (%@) does not match requested offerId (%@)", v7, v8, v9, v10, 2u);
}

void __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_345_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "Updated server with offer reset failed with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 134218242;
  uint64_t v2 = 0;
  __int16 v3 = 2080;
  uint64_t v4 = "-[ICQDaemonOfferManager _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:]";
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "Invalid type %ld passed to %s. Must post darwin notifications for individual offer types.", (uint8_t *)&v1, 0x16u);
}

- (void)_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_8(&dword_1D5851000, v0, v1, "SIGNPOST EVENT [id: %hu] DarwinNotification  enableTelemetry=YES %@");
}

- (void)_teardownCachedOffersAndNotify:(NSObject *)a3 .cold.1(unsigned __int16 a1, uint64_t a2, NSObject *a3)
{
  __int16 v3 = &stru_1F2DCE430;
  if (a2) {
    __int16 v3 = @"and notify";
  }
  LODWORD(v4) = 67109378;
  HIDWORD(v4) = a1;
  LOWORD(v5) = 2112;
  *(void *)((char *)&v5 + 2) = v3;
  OUTLINED_FUNCTION_8(&dword_1D5851000, a2, a3, "SIGNPOST EVENT [id: %hu] TeardownAllOffers  enableTelemetry=YES %@", v4, (void)v5, HIWORD(v3), *MEMORY[0x1E4F143B8]);
}

void __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_371_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "Error fetching CloudKit backup container device id: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_coalescedReconsiderOffersForAccount:(NSObject *)a3 isForBuddy:quotaReason:options:choiceHandler:completion:.cold.1(unsigned __int16 a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = a1;
  uint64_t v5 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:a2];
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_debug_impl(&dword_1D5851000, a3, OS_LOG_TYPE_DEBUG, "SIGNPOST BEGIN [id: %hu]: ReconsiderOffers  enableTelemetry=YES %@", (uint8_t *)v6, 0x12u);
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D5851000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) ReconsiderOffers ", v2, v3, v4, v5, v6);
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "Default offer is missing from fetchOffers response! Something went wrong", v1, 2u);
}

void __82__ICQDaemonOfferManager__postUserNotification_replaceExisting_offerID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "failed to post user notificaiton: %@", v2, v3, v4, v5, v6);
}

void __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST BEGIN [id: %hu]: QuotaClientNewOffer  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "[SUBD] Failed to setup the failsafe activity. error=[%@]", v2, v3, v4, v5, v6);
}

void __73__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdTearDown__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "Failed to clean up the Subscription Daemon state with error=[%@].", v2, v3, v4, v5, v6);
}

@end