@interface ICQDaemonOfferRequestBuilder
- (ICQDaemonOfferRequestBuilder)initWithAccount:(id)a3 accountManager:(id)a4;
- (id)requestWithQuotaKey:(id)a3 reason:(id)a4 offerStub:(id)a5 notificationID:(id)a6 contextDictionary:(id)a7 mlDaemonExtraFields:(id)a8 sourceIsServerSample:(BOOL)a9;
- (void)addPremiumOffersHeaderIfNeededForRequest:(id)a3;
- (void)renewAuthHeadersForRequest:(id)a3 completion:(id)a4;
@end

@implementation ICQDaemonOfferRequestBuilder

- (ICQDaemonOfferRequestBuilder)initWithAccount:(id)a3 accountManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICQDaemonOfferRequestBuilder;
  v9 = [(ICQDaemonOfferRequestBuilder *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    v11 = [[ICQRequestProvider alloc] initWithAccount:v7];
    requestProvider = v10->_requestProvider;
    v10->_requestProvider = v11;

    objc_storeStrong((id *)&v10->_accountManager, a4);
  }

  return v10;
}

- (id)requestWithQuotaKey:(id)a3 reason:(id)a4 offerStub:(id)a5 notificationID:(id)a6 contextDictionary:(id)a7 mlDaemonExtraFields:(id)a8 sourceIsServerSample:(BOOL)a9
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  v15 = (__CFString *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (__CFString *)[a3 copy];
  int v21 = [(__CFString *)v20 isEqualToString:@"buddy:quotaFetchOffersURL"];
  if (v21)
  {
    v22 = @"quotaFetchOffersURL";

    v20 = v22;
  }
  uint64_t v23 = [(ICQRequestProvider *)self->_requestProvider urlForQuotaKey:v20 offerStub:v16 notificationID:v17];
  v24 = (void *)v23;
  if (v23)
  {
    v81 = (void *)v23;
    v82 = v19;
    v25 = [MEMORY[0x1E4F28E88] requestWithURL:v23 cachePolicy:1 timeoutInterval:30.0];
    requestProvider = self->_requestProvider;
    v27 = [v16 offerId];
    LODWORD(requestProvider) = [(ICQRequestProvider *)requestProvider willUseNewKey:v20 offerID:v27 notificationID:v17];

    int v80 = v21;
    if (!requestProvider)
    {
      v83[0] = @"event";
      v83[1] = @"ck_hw_id";
      v84[0] = @"quota_alert";
      v84[1] = @"ALL";
      v83[2] = @"dsid";
      v34 = [(ACAccount *)self->_account aa_personID];
      v84[2] = v34;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
      v36 = (void *)[v35 mutableCopy];

      [v36 setObject:v15 forKeyedSubscript:@"reason"];
      if (v16)
      {
        +[ICQRequestProvider addEntriesToPostDictionary:v36 forStub:v16];
        v37 = v82;
      }
      else
      {
        v37 = v82;
        if ([(__CFString *)v20 isEqualToString:@"quotaFetchOffersURL"])
        {
          if (a9)
          {
            [v25 setValue:@"true" forHTTPHeaderField:@"X-Apple-All-Device-Offers"];
            [v25 setValue:@"t" forHTTPHeaderField:@"X-Apple-InvoiceEvent-Simulate"];
            [v25 setValue:@"AlmostFull" forHTTPHeaderField:@"X-Apple-QuotaEvent-Simulate"];
          }
          else
          {
            +[ICQRequestProvider addEntriesToPostDictionary:v36 forStub:0];
          }
          if ([MEMORY[0x1E4F4DC48] deviceOffersContainType:2]) {
            [v25 setValue:@"true" forHTTPHeaderField:@"X-Apple-Storage-Has-SubscriptionOffer"];
          }
        }
      }
      if (_isWAPIDevice_onceToken != -1) {
        dispatch_once(&_isWAPIDevice_onceToken, &__block_literal_global_0);
      }
      if (_isWAPIDevice_sIsWAPIDevice) {
        [v36 setObject:@"true" forKey:@"useWlanTerm"];
      }
      if (v17) {
        [v36 setObject:v17 forKey:@"notificationId"];
      }
      if (v18) {
        [v36 setObject:v18 forKey:@"contextDictionary"];
      }
      if (v37)
      {
        v60 = _ICQGetLogSystem();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v82;
          _os_log_impl(&dword_1D5851000, v60, OS_LOG_TYPE_DEFAULT, "[SUBD] Setting extra request fields [%@].", buf, 0xCu);
        }

        [v36 addEntriesFromDictionary:v82];
      }
      v61 = (void *)[v36 copy];
      v62 = _ICQGetLogSystem();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v86 = v61;
        _os_log_impl(&dword_1D5851000, v62, OS_LOG_TYPE_DEFAULT, "fetchOffer(s) with postDict %@", buf, 0xCu);
      }

      BOOL v63 = +[ICQRequestProvider attemptSetRequest:v25 toPostWithJSONDict:v61];
      if (!v63)
      {
        id v33 = 0;
LABEL_76:
        id v19 = v82;

        v24 = v81;
        goto LABEL_77;
      }
      id v79 = v18;
LABEL_67:
      v64 = v15;
      [(ICQDaemonOfferRequestBuilder *)self addPremiumOffersHeaderIfNeededForRequest:v25];
      if (v80) {
        [v25 setValue:@"true" forHTTPHeaderField:@"X-Apple-Storage-Include-BuddyOffer"];
      }
      account = self->_account;
      v66 = [(_ICQAccountManager *)self->_accountManager accountStore];
      BOOL v67 = +[_ICQHelperFunctions isBackupEnabledForAccount:account accountStore:v66];

      if (v67) {
        [v25 setValue:@"true" forHTTPHeaderField:@"X-Apple-Storage-Include-BackupOffer"];
      }
      [(ICQRequestProvider *)self->_requestProvider addCommonHeadersToRequest:v25];
      v68 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v69 = objc_msgSend(v68, "ams_activeiTunesAccount");
      v70 = v69;
      if (v69)
      {
        v71 = objc_msgSend(v69, "ams_DSID");

        if (v71)
        {
          v72 = objc_msgSend(v70, "ams_DSID");
          v73 = [v72 stringValue];
          [v25 setValue:v73 forHTTPHeaderField:@"X-Apple-Itunes-DSID"];
        }
      }
      id v33 = [v25 copy];

      v15 = v64;
      id v18 = v79;
      goto LABEL_76;
    }
    id v76 = v17;
    id v79 = v18;
    v28 = [v16 conditionsWhenChosen];

    if (v28)
    {
      v29 = [v16 conditionsWhenChosen];
      int v30 = [v29 isPhotosCloudEnabled];

      v31 = [v16 conditionsWhenChosen];
      int v32 = [v31 isPhotosOptimizeEnabled];
    }
    else
    {
      int v30 = +[ICQDaemonOfferConditions isPhotosCloudEnabled];
      int v32 = +[ICQDaemonOfferConditions isPhotosOptimizeEnabled];
    }
    if (v30) {
      v38 = @"true";
    }
    else {
      v38 = @"false";
    }
    v39 = v38;
    if (v32) {
      v40 = @"true";
    }
    else {
      v40 = @"false";
    }
    v41 = v40;
    v77 = v41;
    if (v20 == @"quotaFetchOffersURL")
    {
      v42 = v41;
      v43 = objc_opt_new();
      v36 = v43;
      if (v15) {
        v44 = v15;
      }
      else {
        v44 = &stru_1F2DCE430;
      }
      [v43 setObject:v44 forKeyedSubscript:@"reason"];
      [v36 setObject:v39 forKey:@"iCPLEnabled"];
      [v36 setObject:v42 forKey:@"optimizeEnabled"];
      v45 = +[ICQAppLaunchLinkTracker shared];
      v46 = [v45 allDaysSinceLastShown];

      if (v46) {
        [v36 setObject:v46 forKey:@"appLaunch"];
      }
      if (a9)
      {
        [v25 setValue:@"true" forHTTPHeaderField:@"X-Apple-All-Device-Offers"];
        [v25 setValue:@"t" forHTTPHeaderField:@"X-Apple-InvoiceEvent-Simulate"];
        [v25 setValue:@"AlmostFull" forHTTPHeaderField:@"X-Apple-QuotaEvent-Simulate"];
      }
      if ([MEMORY[0x1E4F4DC48] deviceOffersContainType:2]) {
        [v25 setValue:@"true" forHTTPHeaderField:@"X-Apple-Storage-Has-SubscriptionOffer"];
      }

      if (!v36) {
        goto LABEL_47;
      }
    }
    else
    {
      if (v20 != @"quotaRefreshOfferDetailsURL")
      {
        v36 = 0;
LABEL_47:
        v57 = self->_requestProvider;
        v58 = [v16 offerId];
        v59 = [(ICQRequestProvider *)v57 httpMethodForKey:v20 offerID:v58 notificationID:v17];
        [v25 setHTTPMethod:v59];

        goto LABEL_67;
      }
      v47 = (void *)MEMORY[0x1E4F29088];
      v48 = [v25 URL];
      v49 = [v47 componentsWithURL:v48 resolvingAgainstBaseURL:1];

      uint64_t v50 = [MEMORY[0x1E4F290C8] queryItemWithName:@"photos-icp" value:v39];
      [MEMORY[0x1E4F290C8] queryItemWithName:@"photos-optimize" value:v77];
      v78 = (void *)v50;
      v88 = uint64_t v87 = v50;
      v75 = (void *)v88;
      v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:2];
      [v49 setQueryItems:v51];

      v52 = (void *)MEMORY[0x1E4F28E88];
      v53 = [v49 URL];
      v54 = [v52 requestWithURL:v53 cachePolicy:1 timeoutInterval:30.0];

      v25 = v54;
      [v54 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      id v17 = v76;
      if (v82 && [v82 count])
      {
        v55 = _ICQGetLogSystem();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v82;
          _os_log_impl(&dword_1D5851000, v55, OS_LOG_TYPE_DEFAULT, "[SUBD] Setting extra request fields [%@].", buf, 0xCu);
        }

        v36 = (void *)[v82 mutableCopy];
      }
      else
      {
        v36 = 0;
      }

      if (!v36) {
        goto LABEL_47;
      }
    }
    if (!+[ICQRequestProvider attemptSetRequest:v25 toPostWithJSONDict:v36])
    {
      v56 = _ICQGetLogSystem();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        -[ICQDaemonOfferRequestBuilder requestWithQuotaKey:reason:offerStub:notificationID:contextDictionary:mlDaemonExtraFields:sourceIsServerSample:](v56);
      }

      v25 = 0;
    }
    goto LABEL_47;
  }
  v25 = _ICQGetLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[ICQDaemonOfferRequestBuilder requestWithQuotaKey:reason:offerStub:notificationID:contextDictionary:mlDaemonExtraFields:sourceIsServerSample:](v25);
  }
  id v33 = 0;
LABEL_77:

  return v33;
}

- (void)renewAuthHeadersForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  account = self->_account;
  accountManager = self->_accountManager;
  id v9 = a3;
  v10 = [(_ICQAccountManager *)accountManager accountStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__ICQDaemonOfferRequestBuilder_renewAuthHeadersForRequest_completion___block_invoke;
  v12[3] = &unk_1E6A51EC8;
  id v13 = v6;
  id v11 = v6;
  objc_msgSend(v9, "icq_renewAuthorizationHeadersForAccount:store:completion:", account, v10, v12);
}

uint64_t __70__ICQDaemonOfferRequestBuilder_renewAuthHeadersForRequest_completion___block_invoke(uint64_t a1, char a2)
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __70__ICQDaemonOfferRequestBuilder_renewAuthHeadersForRequest_completion___block_invoke_cold_1(a2, v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addPremiumOffersHeaderIfNeededForRequest:(id)a3
{
  id v3 = a3;
  v4 = +[_ICQHelperFunctions defaultValueForKey:@"_ICQEnableServerPremiumOffers"];
  v5 = v4;
  if (v4 && [v4 BOOLValue]) {
    [v3 setValue:@"true" forHTTPHeaderField:@"x-apple-opt-in-flow"];
  }
  id v6 = +[_ICQHelperFunctions defaultValueForKey:@"_ICQAddFetchOffersHeaders"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__ICQDaemonOfferRequestBuilder_addPremiumOffersHeaderIfNeededForRequest___block_invoke;
  v8[3] = &unk_1E6A51EF0;
  id v9 = v3;
  id v7 = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __73__ICQDaemonOfferRequestBuilder_addPremiumOffersHeaderIfNeededForRequest___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_requestProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)requestWithQuotaKey:(os_log_t)log reason:offerStub:notificationID:contextDictionary:mlDaemonExtraFields:sourceIsServerSample:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "No url found. Failed to generate a urlRequest.", v1, 2u);
}

- (void)requestWithQuotaKey:(os_log_t)log reason:offerStub:notificationID:contextDictionary:mlDaemonExtraFields:sourceIsServerSample:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "Could not set dictionary on request object.", v1, 2u);
}

void __70__ICQDaemonOfferRequestBuilder_renewAuthHeadersForRequest_completion___block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D5851000, a2, OS_LOG_TYPE_DEBUG, "ICQDaemonOfferRequestBuilder renewAuthHeadersForRequest validation completed with success: %d", (uint8_t *)v2, 8u);
}

@end