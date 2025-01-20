@interface PKUserNotificationAuthorizationController
+ (id)sharedInstance;
- (PKUserNotificationAuthorizationController)init;
- (unint64_t)_contentTypeToDisplayWithPasses:(id)a3;
- (void)_authorizationStatusRequiresPromptWithCompletion:(id)a3;
- (void)_shouldOfferAuthorizationPromptForPayLaterReasonWithPasses:(id)a3 completion:(id)a4;
- (void)_shouldOfferAuthorizationPromptForPeerPaymentReasonWithPeerPaymentPass:(id)a3 completion:(id)a4;
- (void)addDelegate:(id)a3;
- (void)authorizationStatusWithCompletion:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)requestNotificationAuthorizationWithCompletion:(id)a3;
- (void)setPresentedNotificationAuthorizationPromptShown;
- (void)shouldOfferAuthorizationPromptWithPasses:(id)a3 completion:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PKUserNotificationAuthorizationController

- (void)shouldOfferAuthorizationPromptWithPasses:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x3032000000;
    v75[3] = __Block_byref_object_copy__17;
    v75[4] = __Block_byref_object_dispose__17;
    id v76 = 0;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x2020000000;
    char v74 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    unint64_t v72 = 0;
    unint64_t v72 = [(PKUserNotificationAuthorizationController *)self _contentTypeToDisplayWithPasses:v6];
    v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    unint64_t v11 = PKGetNotificationAuthorizationPromptCount();
    v12 = +[PKPaymentWebService sharedService];
    v13 = [v12 context];
    v14 = [v13 configuration];
    unint64_t v15 = [v14 notificationAuthorizationPromptPresentationCount];

    if (v11 >= v15) {
      char v16 = 1;
    }
    else {
      char v16 = PKHasPromptedNotificationAuthorizationForContentType(v70[3]);
    }
    if (PKBypassNotificationAuthorizationPromptCount())
    {
      v17 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: bypassing notification count & delay due to toggle", buf, 2u);
      }
      char v16 = 0;
    }
    else
    {
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke;
      v65[3] = &unk_1E56E0F18;
      v18 = v9;
      v66 = v9;
      v67 = v75;
      [(PKAsyncUnaryOperationComposer *)v8 addOperation:v65];
      v17 = v66;
    }

    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_2;
    v61[3] = &unk_1E56E0F90;
    v19 = v9;
    v62 = v9;
    v63 = self;
    v64 = v75;
    [(PKAsyncUnaryOperationComposer *)v8 addOperation:v61];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_5;
    v57[3] = &unk_1E56E0F90;
    v20 = v9;
    v58 = v9;
    id v21 = v6;
    id v59 = v21;
    v60 = v75;
    [(PKAsyncUnaryOperationComposer *)v8 addOperation:v57];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_6;
    v50[3] = &unk_1E56E1008;
    v22 = v9;
    v51 = v9;
    id v23 = v21;
    char v56 = v16;
    id v52 = v23;
    v53 = self;
    v54 = v73;
    v55 = v75;
    [(PKAsyncUnaryOperationComposer *)v8 addOperation:v50];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_9;
    v43[3] = &unk_1E56E1080;
    v24 = v9;
    v44 = v9;
    v45 = self;
    id v46 = v23;
    v47 = v73;
    v48 = v75;
    v49 = &v69;
    [(PKAsyncUnaryOperationComposer *)v8 addOperation:v43];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_12;
    v38[3] = &unk_1E56E10A8;
    v25 = v9;
    char v42 = v16;
    v39 = v9;
    v40 = v75;
    v41 = v73;
    [(PKAsyncUnaryOperationComposer *)v8 addOperation:v38];
    v26 = [MEMORY[0x1E4F1CA98] null];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_13;
    v29[3] = &unk_1E56E10D0;
    v27 = v9;
    v30 = v9;
    v31 = self;
    v33 = v73;
    v34 = &v69;
    char v37 = v16;
    v35 = v75;
    unint64_t v36 = v11;
    id v32 = v7;
    id v28 = [(PKAsyncUnaryOperationComposer *)v8 evaluateWithInput:v26 completion:v29];

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(v73, 8);
    _Block_object_dispose(v75, 8);
  }
}

void __59__PKUserNotificationAuthorizationController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKUserNotificationAuthorizationController);
  v1 = (void *)_MergedGlobals_209;
  _MergedGlobals_209 = (uint64_t)v0;
}

- (PKUserNotificationAuthorizationController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKUserNotificationAuthorizationController;
  v2 = [(PKUserNotificationAuthorizationController *)&v10 init];
  if (v2)
  {
    if (PKRunningInPassbook())
    {
      uint64_t v3 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    }
    else
    {
      uint64_t v3 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.Passbook"];
    }
    center = v2->_center;
    v2->_center = (UNUserNotificationCenter *)v3;

    [(UNUserNotificationCenter *)v2->_center setDelegate:v2];
    v2->_delegatesLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v5;

    id v7 = objc_alloc_init(PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v7;
  }
  return v2;
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_3;
  v13[3] = &unk_1E56E0F68;
  v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  id v16 = v7;
  uint64_t v17 = v10;
  id v14 = v9;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 _authorizationStatusRequiresPromptWithCompletion:v13];
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    *(void *)(*(void *)(a1 + 40) + 40) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  else if (*(unsigned char *)(a1 + 88))
  {
    *(unsigned char *)(v8 + 24) = 0;
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"not required as the presentation count limit has been reached presented: %lu times", *(void *)(a1 + 80));
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  id v12 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = @"YES";
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      v13 = @"NO";
    }
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    unint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) - 1;
    if (v15 > 5) {
      id v16 = @"generic";
    }
    else {
      id v16 = off_1E56E12C8[v15];
    }
    *(_DWORD *)buf = 138543874;
    v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: shouldOfferAuthorizationPromptWithDataProvider %{public}@ reason: %@, contentType %{public}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v15 = a3;
  id v6 = a4;
  id v7 = PKLastUserNotificationAuthorizationPromptDate();
  [v7 timeIntervalSinceNow];
  double v9 = fabs(v8);
  BOOL v10 = v9 >= 600.0 || v7 == 0;
  uint64_t v11 = !v10;
  if (!v10)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"not required as it was presented in the last seconds: %lu", (unint64_t)v9);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  v6[2](v6, v15, v11);
}

- (unint64_t)_contentTypeToDisplayWithPasses:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v3)
  {
    unint64_t v17 = 0;
    goto LABEL_36;
  }
  uint64_t v4 = v3;
  char v5 = 0;
  char v6 = 0;
  char v7 = 0;
  BOOL v8 = 0;
  char v9 = 0;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        uint64_t v14 = v13;
        if ((v9 & 1) != 0 || [v13 cardType] == 1 || objc_msgSend(v14, "isEMoneyPass"))
        {
          char v9 = 1;
          if (v5) {
            goto LABEL_11;
          }
LABEL_18:
          char v5 = [v14 isAppleCardPass];
          if (v6) {
            goto LABEL_19;
          }
LABEL_12:
          char v6 = [v14 isTransitPass];
          if ((v7 & 1) == 0) {
            goto LABEL_13;
          }
LABEL_20:
          char v7 = 1;
        }
        else
        {
          char v9 = 0;
          if ((v5 & 1) == 0) {
            goto LABEL_18;
          }
LABEL_11:
          char v5 = 1;
          if ((v6 & 1) == 0) {
            goto LABEL_12;
          }
LABEL_19:
          char v6 = 1;
          if (v7) {
            goto LABEL_20;
          }
LABEL_13:
          char v7 = [v14 isIdentityPass];
        }

        continue;
      }
      BOOL v8 = v8 || [v12 style] == 4;
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v4);
  uint64_t v15 = 2;
  if ((v6 & 1) == 0) {
    uint64_t v15 = 3;
  }
  if (v5) {
    uint64_t v15 = 1;
  }
  uint64_t v16 = 5;
  if (!v8) {
    uint64_t v16 = 0;
  }
  if (v9) {
    uint64_t v16 = 4;
  }
  if (((v5 | v6) | v7)) {
    unint64_t v17 = v15;
  }
  else {
    unint64_t v17 = v16;
  }
LABEL_36:

  return v17;
}

- (void)_authorizationStatusRequiresPromptWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: _authorizationStatusRequiresPromptWithCompletion", buf, 2u);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __94__PKUserNotificationAuthorizationController__authorizationStatusRequiresPromptWithCompletion___block_invoke;
    v6[3] = &unk_1E56E1280;
    id v7 = v4;
    [(PKUserNotificationAuthorizationController *)self authorizationStatusWithCompletion:v6];
  }
}

- (void)authorizationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: getting notification settings", buf, 2u);
    }

    center = self->_center;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__PKUserNotificationAuthorizationController_authorizationStatusWithCompletion___block_invoke;
    v7[3] = &unk_1E56E12A8;
    id v8 = v4;
    [(UNUserNotificationCenter *)center getNotificationSettingsWithCompletionHandler:v7];
  }
}

+ (id)sharedInstance
{
  if (qword_1EB402C68 != -1) {
    dispatch_once(&qword_1EB402C68, &__block_literal_global_47);
  }
  v2 = (void *)_MergedGlobals_209;
  return v2;
}

- (void)addDelegate:(id)a3
{
  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    id v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    [(NSHashTable *)self->_delegates addObject:v5];

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

uint64_t __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = @"Authorization status";
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __79__PKUserNotificationAuthorizationController_authorizationStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: notification settings: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void, uint64_t, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v3 authorizationStatus], v3 != 0);
}

uint64_t __94__PKUserNotificationAuthorizationController__authorizationStatusRequiresPromptWithCompletion___block_invoke(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = (0x19u >> a2) & 1;
  if (!a3) {
    unsigned int v4 = 0;
  }
  if (a2 <= 4) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  id v6 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v5) {
      uint64_t v7 = @"YES";
    }
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: _authorizationStatusRequiresPromptWithCompletion requiresPrompt: %@", (uint8_t *)&v9, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_3(uint64_t a1, char a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_4;
  block[3] = &unk_1E56E0F40;
  char v9 = a2;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v8 = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [*(id *)(a1 + 40) count];
  if (!v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = @"0 passes";
  }
  v6[2](v6, v10, v7 == 0);
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 40) firstObject];
  char v9 = [v8 secureElementPass];

  BOOL v10 = [*(id *)(a1 + 40) count] != 1 || v9 == 0;
  if (v10 || ![v9 hasAssociatedPeerPaymentAccount] || *(unsigned char *)(a1 + 72))
  {
    v7[2](v7, v6, 0);
  }
  else
  {
    uint64_t v11 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_7;
    v12[3] = &unk_1E56E0FE0;
    id v13 = *(id *)(a1 + 32);
    long long v16 = *(_OWORD *)(a1 + 56);
    uint64_t v15 = v7;
    id v14 = v6;
    [v11 _shouldOfferAuthorizationPromptForPeerPaymentReasonWithPeerPaymentPass:v9 completion:v12];
  }
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_8;
  block[3] = &unk_1E56E0FB8;
  char v15 = a2;
  uint64_t v14 = *(void *)(a1 + 64);
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v9;
  long long v13 = v9;
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(a1 + 72);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_10;
  v13[3] = &unk_1E56E1058;
  id v10 = *(id *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 72);
  id v15 = v6;
  id v16 = v7;
  id v14 = v10;
  id v11 = v6;
  id v12 = v7;
  [v8 _shouldOfferAuthorizationPromptForPayLaterReasonWithPasses:v9 completion:v13];
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_10(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 64);
  block[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_11;
  block[3] = &unk_1E56E1030;
  char v15 = a2;
  id v11 = v5;
  id v7 = (id)v9;
  long long v13 = v9;
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_11(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(a1 + 80);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 6;
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_12(uint64_t a1, uint64_t a2, void *a3, void (**a4)(void, void, void))
{
  if (*(unsigned char *)(a1 + 56))
  {
    ((void (**)(void, void *, void))a4)[2](a4, a3, 0);
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = @"new content type";
    id v8 = a4;
    id v9 = a3;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    (*((void (**)(id, id, uint64_t))v8 + 2))(v8, v9, 1);
  }
}

- (void)_shouldOfferAuthorizationPromptForPeerPaymentReasonWithPeerPaymentPass:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void, void))v6;
  if (v6)
  {
    if (v5)
    {
      id v8 = [v5 devicePrimaryPaymentApplication];

      if (v8)
      {
        id v9 = +[PKPeerPaymentService sharedInstance];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __127__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPeerPaymentReasonWithPeerPaymentPass_completion___block_invoke;
        v10[3] = &unk_1E56E10F8;
        id v11 = v7;
        [v9 accountWithCompletion:v10];
      }
      else
      {
        ((void (**)(void, void, __CFString *))v7)[2](v7, 0, @"Apple Cash is ghost pass");
      }
    }
    else
    {
      (*((void (**)(id, void, __CFString *))v6 + 2))(v6, 0, @"no apple cash pass");
    }
  }
}

void __127__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPeerPaymentReasonWithPeerPaymentPass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 stage] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [v3 state];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_shouldOfferAuthorizationPromptForPayLaterReasonWithPasses:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, __CFString *))a4;
  if (v6)
  {
    if (objc_msgSend(v5, "pk_containsObjectPassingTest:", &__block_literal_global_95))
    {
      if (PKHasPromptedNotificationAuthorizationForContentType(6))
      {
        v6[2](v6, 0, @"has already prompted for delinquent pay later financing plan");
      }
      else
      {
        id v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
        id v8 = +[PKAccountService sharedInstance];
        v31[0] = 0;
        v31[1] = v31;
        v31[2] = 0x3032000000;
        v31[3] = __Block_byref_object_copy__17;
        v31[4] = __Block_byref_object_dispose__17;
        id v32 = 0;
        v29[0] = 0;
        v29[1] = v29;
        v29[2] = 0x2020000000;
        char v30 = 0;
        v27[0] = 0;
        v27[1] = v27;
        v27[2] = 0x3032000000;
        v27[3] = __Block_byref_object_copy__17;
        v27[4] = __Block_byref_object_dispose__17;
        id v28 = 0;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_2;
        v22[3] = &unk_1E56E11B8;
        id v9 = v8;
        id v23 = v9;
        uint64_t v25 = v27;
        v26 = v31;
        id v24 = v5;
        [(PKAsyncUnaryOperationComposer *)v7 addOperation:v22];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_6;
        v17[3] = &unk_1E56E1230;
        __int16 v19 = v31;
        id v10 = v9;
        id v18 = v10;
        long long v20 = v29;
        long long v21 = v27;
        [(PKAsyncUnaryOperationComposer *)v7 addOperation:v17];
        id v11 = [MEMORY[0x1E4F1CA98] null];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_3_118;
        v13[3] = &unk_1E56E1258;
        long long v14 = v6;
        char v15 = v29;
        id v16 = v27;
        id v12 = [(PKAsyncUnaryOperationComposer *)v7 evaluateWithInput:v11 completion:v13];

        _Block_object_dispose(v27, 8);
        _Block_object_dispose(v29, 8);
        _Block_object_dispose(v31, 8);
      }
    }
    else
    {
      v6[2](v6, 0, @"no passes with an account");
    }
  }
}

BOOL __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 paymentPass];
  id v3 = [v2 associatedAccountServiceAccountIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_3;
  v11[3] = &unk_1E56E1190;
  id v14 = v7;
  id v12 = v6;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v8 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v7;
  [v8 defaultAccountForFeature:3 completion:v11];
}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_4;
  block[3] = &unk_1E56E1168;
  id v10 = v3;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v8;
  long long v13 = v8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 64);
  id v11 = v5;
  uint64_t v14 = v6;
  id v12 = *(id *)(a1 + 40);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accountIdentifier];
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 32));
    id v3 = *(void **)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_5;
    v8[3] = &unk_1E56E1140;
    id v9 = v2;
    if ((objc_msgSend(v3, "pk_containsObjectPassingTest:", v8) & 1) == 0)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = @"no pay later pass";
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = @"no pay later account";

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 paymentPass];
  uint64_t v4 = [v3 associatedAccountServiceAccountIdentifier];
  id v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  long long v8 = v7;
  if (v6 == v7)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    if (v6 && v7) {
      uint64_t v9 = [v6 isEqualToString:v7];
    }
  }

  return v9;
}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [PKAccountServicePayLaterFinancingPlanQuery alloc];
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) accountIdentifier];
  id v10 = [(PKAccountServicePayLaterFinancingPlanQuery *)v8 initWithAccountIdentifier:v9 queryItems:64];

  [(PKAccountServicePayLaterFinancingPlanQuery *)v10 setCountFinancingPlanStates:&unk_1EE22ACE8];
  id v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_112;
  v14[3] = &unk_1E56E1208;
  id v15 = v6;
  id v16 = v7;
  long long v17 = *(_OWORD *)(a1 + 48);
  id v12 = v6;
  id v13 = v7;
  [v11 financingPlansWithQuery:v10 completion:v14];
}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_112(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_2_113;
  block[3] = &unk_1E56E11E0;
  id v6 = v3;
  id v8 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 48);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_2_113(uint64_t a1)
{
  if ([*(id *)(a1 + 32) financingPlanCount])
  {
    PKSetHasPromptedNotificationAuthorizationForContentType(6, 1);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = @"has delinquent pay later loan";
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

uint64_t __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_3_118(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: requesting authoirzation", buf, 2u);
  }

  paymentService = self->_paymentService;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__PKUserNotificationAuthorizationController_requestNotificationAuthorizationWithCompletion___block_invoke;
  v8[3] = &unk_1E56D8B08;
  id v9 = v4;
  id v7 = v4;
  [(PKPaymentService *)paymentService requestNotificationAuthorizationWithCompletion:v8];
}

void __92__PKUserNotificationAuthorizationController_requestNotificationAuthorizationWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: requestAuthorizationWithOptions success: %@ error: %@", buf, 0x16u);
  }

  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__PKUserNotificationAuthorizationController_requestNotificationAuthorizationWithCompletion___block_invoke_122;
    block[3] = &unk_1E56D8478;
    id v11 = v8;
    char v12 = a2;
    id v10 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __92__PKUserNotificationAuthorizationController_requestNotificationAuthorizationWithCompletion___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)setPresentedNotificationAuthorizationPromptShown
{
  id v3 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: presentation count incremented", v5, 2u);
  }

  PKIncrementNotificationAuthorizationPromptCount();
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  PKSetLastUserNotificationAuthorizationPromptDate(v4);

  PKSetHasPromptedNotificationAuthorizationForContentType(self->_previouslyCheckedContentType, 1);
}

- (void)removeDelegate:(id)a3
{
  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    id v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    [(NSHashTable *)self->_delegates removeObject:v5];

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v8;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: willPresentNotification: %@", buf, 0xCu);
  }

  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  char v12 = [(NSHashTable *)self->_delegates allObjects];
  os_unfair_lock_unlock(p_delegatesLock);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    uint64_t v17 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * v18);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __114__PKUserNotificationAuthorizationController_userNotificationCenter_willPresentNotification_withCompletionHandler___block_invoke;
        block[3] = &unk_1E56D89F0;
        void block[4] = v19;
        id v22 = v8;
        id v23 = v9;
        dispatch_async(v17, block);

        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16, v20);
    }
    while (v15);
  }
}

uint64_t __114__PKUserNotificationAuthorizationController_userNotificationCenter_willPresentNotification_withCompletionHandler___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 willPresentNotification:v4 withCompletionHandler:v5];
  }
  return result;
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: openSettingsForNotification : %@", buf, 0xCu);
  }

  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  id v10 = [(NSHashTable *)self->_delegates allObjects];
  os_unfair_lock_unlock(p_delegatesLock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    uint64_t v15 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __96__PKUserNotificationAuthorizationController_userNotificationCenter_openSettingsForNotification___block_invoke;
        v18[3] = &unk_1E56D8A90;
        v18[4] = v17;
        id v19 = v7;
        dispatch_async(v15, v18);

        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
}

uint64_t __96__PKUserNotificationAuthorizationController_userNotificationCenter_openSettingsForNotification___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 openSettingsForNotification:v4];
  }
  return result;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v9;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: didReceiveNotificationResponse: %@", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v12 = [v9 actionIdentifier];
  uint64_t v13 = PKUserNotificationActionFromUNNotificationActionIdentifier(v12);

  paymentService = self->_paymentService;
  uint64_t v15 = [v9 notification];
  uint64_t v16 = [v15 request];
  uint64_t v17 = [v16 identifier];
  [(PKPaymentService *)paymentService userNotificationActionPerformed:v13 applicationMessageContentIdentifier:v17 completion:0];

  if (v10) {
    v10[2](v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_center, 0);
}

@end