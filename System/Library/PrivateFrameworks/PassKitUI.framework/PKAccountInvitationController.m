@interface PKAccountInvitationController
+ (BOOL)canInviteAccountUserWithAccount:(id)a3;
+ (void)presentCreateAccountUserInvitationWithViewController:(id)a3 account:(id)a4 accountUserCollection:(id)a5 familyMemberCollection:(id)a6 context:(int64_t)a7 completion:(id)a8;
- (BOOL)isCurrentFamilyMemberAnOrganizer;
- (PKAccount)account;
- (PKAccountInvitationController)initWithAccount:(id)a3 context:(int64_t)a4 familyMemberCollection:(id)a5;
- (PKApplyController)applyController;
- (PKDeviceSharingCapabilitiesManager)deviceCapabiltiesManager;
- (PKFamilyMember)familyMember;
- (PKFamilyMemberCollection)familyMemberCollection;
- (id)_filteredFamilyMembersFromFamilyMembers:(id)a3 accountUsers:(id)a4 invitations:(id)a5;
- (int64_t)context;
- (int64_t)familyCircleCount;
- (unint64_t)accessLevel;
- (unint64_t)feature;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_fetchFamilyMemberDeviceCapabilties;
- (void)_informObserversOfFamilyMemberChange;
- (void)accessLevelOptionsWithCompletion:(id)a3;
- (void)didAddAccountPendingFamilyMembers:(id)a3;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)familyMembersForceReload:(BOOL)a3 completion:(id)a4;
- (void)nextViewControllerWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setAccessLevel:(unint64_t)a3;
- (void)setFamilyMember:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PKAccountInvitationController

- (PKAccountInvitationController)initWithAccount:(id)a3 context:(int64_t)a4 familyMemberCollection:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)PKAccountInvitationController;
  v11 = [(PKAccountInvitationController *)&v33 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a3);
    v12->_context = a4;
    objc_storeStrong((id *)&v12->_familyMemberCollection, a5);
    v12->_feature = [v9 feature];
    uint64_t v13 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v12->_accountService;
    v12->_accountService = (PKAccountService *)v13;

    v15 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    paymentService = v12->_paymentService;
    v12->_paymentService = v15;

    [(PKPaymentService *)v12->_paymentService setDelegate:v12];
    v17 = (PKDeviceSharingCapabilitiesManager *)objc_alloc_init(MEMORY[0x1E4F84648]);
    deviceCapabiltiesManager = v12->_deviceCapabiltiesManager;
    v12->_deviceCapabiltiesManager = v17;

    v12->_lockObservers._os_unfair_lock_opaque = 0;
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.passkitui.PKAccountInvitationController.reply", 0);
    replyQueue = v12->_replyQueue;
    v12->_replyQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v21;

    v23 = [(PKAccount *)v12->_account applyServiceURL];
    if (v23)
    {
      v24 = [MEMORY[0x1E4F84D50] sharedService];
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v24];
      v26 = [[PKApplyControllerConfiguration alloc] initWithSetupDelegate:0 context:a4 provisioningController:v25];
      [(PKApplyControllerConfiguration *)v26 setFeature:v12->_feature];
      [(PKApplyControllerConfiguration *)v26 setAccount:v9];
      [(PKApplyControllerConfiguration *)v26 setApplicationType:2];
      v27 = [[PKApplyController alloc] initWithApplyConfiguration:v26];
      applyController = v12->_applyController;
      v12->_applyController = v27;

      [(PKApplyController *)v12->_applyController setApplyServiceURL:v23];
      v29 = v12->_applyController;
      v30 = [MEMORY[0x1E4F841A8] analyticsAccountTypeForAccount:v9];
      [(PKApplyController *)v29 setAnalyticsExistingAccountType:v30];

      if (v12->_familyMemberCollection) {
        [(PKAccountInvitationController *)v12 _fetchFamilyMemberDeviceCapabilties];
      }
    }
    else
    {
      v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Cannot create invitation controller without apply service URL", v32, 2u);
      }
    }
  }
  return v12;
}

+ (BOOL)canInviteAccountUserWithAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountUserInvitationAllowed]
    && [v3 accessLevel] == 1
    && [v3 state] == 1;

  return v4;
}

+ (void)presentCreateAccountUserInvitationWithViewController:(id)a3 account:(id)a4 accountUserCollection:(id)a5 familyMemberCollection:(id)a6 context:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (void (**)(void))a8;
  [v15 stateReason];
  if (PKAccountStateReasonIsInMerge())
  {
    dispatch_queue_t v19 = PKLocalizedMadisonString(&cfstr_AccountMergeIn.isa);
    v20 = PKLocalizedMadisonString(&cfstr_AccountMergeIn_0.isa);
    PKDisplayableErrorCustom();
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    id v22 = PKAlertForDisplayableErrorWithHandlers(v21, 0, 0, 0);
    [v14 presentViewController:v22 animated:1 completion:0];
    if (v18) {
      v18[2](v18);
    }
  }
  else
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F84518]);
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__32;
    v55 = __Block_byref_object_dispose__32;
    id v56 = v15;
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__32;
    v49 = __Block_byref_object_dispose__32;
    id v50 = v17;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__32;
    v43 = __Block_byref_object_dispose__32;
    id v44 = v16;
    objc_initWeak(&location, a1);
    if (!v52[5])
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke;
      v36[3] = &unk_1E59D4518;
      objc_copyWeak(&v37, &location);
      v36[4] = &v51;
      [v21 addOperation:v36];
      objc_destroyWeak(&v37);
    }
    if (!v46[5])
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_4;
      v34[3] = &unk_1E59D4518;
      objc_copyWeak(&v35, &location);
      v34[4] = &v45;
      [v21 addOperation:v34];
      objc_destroyWeak(&v35);
    }
    if (!v40[5])
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_7;
      v32[3] = &unk_1E59D73A8;
      objc_copyWeak(&v33, &location);
      v32[4] = &v51;
      v32[5] = &v39;
      [v21 addOperation:v32];
      objc_destroyWeak(&v33);
    }
    v23 = [MEMORY[0x1E4F1CA98] null];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_10;
    v25[3] = &unk_1E59D73F8;
    objc_copyWeak(v31, &location);
    v27 = v18;
    v28 = &v39;
    v31[1] = (id)a7;
    v29 = &v51;
    v30 = &v45;
    id v26 = v14;
    id v24 = (id)[v21 evaluateWithInput:v23 completion:v25];

    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v51, 8);
  }
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = [MEMORY[0x1E4F84270] sharedInstance];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_2;
    v10[3] = &unk_1E59CC7B0;
    uint64_t v13 = *(void *)(a1 + 32);
    id v12 = v7;
    id v11 = v6;
    [v9 defaultAccountForFeature:2 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_3;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_5;
    v10[3] = &unk_1E59CC850;
    uint64_t v13 = *(void *)(a1 + 32);
    id v12 = v7;
    id v11 = v6;
    [v9 familyMembersWithCompletion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_6;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_6(void *a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:a1[4]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(a1[6] + 16);

  return v5();
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = [MEMORY[0x1E4F84270] sharedInstance];
    long long v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) accountIdentifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_8;
    v11[3] = &unk_1E59CC828;
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = v7;
    id v12 = v6;
    [v9 accountUsersForAccountWithIdentifier:v10 completion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_9;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_9(void *a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:a1[4]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(a1[6] + 16);

  return v5();
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_10(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_11;
  block[3] = &unk_1E59D73D0;
  objc_copyWeak(v8, (id *)(a1 + 72));
  id v5 = *(id *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 64);
  v8[1] = *(id *)(a1 + 80);
  uint64_t v7 = v2;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v8);
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) activeAccountUsersExcludingCurrentAccountUser];
    unint64_t v3 = [v2 count];

    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) accountUserInvitationAllowedFeatureDescriptor];
    unint64_t v5 = [v4 maximumAccountUsers];

    if (v3 >= v5)
    {
      long long v6 = [[PKAccountUserLimitReachedViewController alloc] initWithAccount:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) context:*(void *)(a1 + 80)];
      uint64_t v7 = [[PKNavigationController alloc] initWithRootViewController:v6];
      [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      long long v6 = [[PKAccountInvitationController alloc] initWithAccount:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) context:*(void *)(a1 + 80) familyMemberCollection:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      uint64_t v7 = [[PKAccountInvitationOnboardingViewController alloc] initWithController:v6];
      id v8 = [[PKNavigationController alloc] initWithRootViewController:v7];
      [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)setFamilyMember:(id)a3
{
  unint64_t v5 = (PKFamilyMember *)a3;
  if (self->_familyMember != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_familyMember, a3);
    [(PKApplyController *)self->_applyController setFamilyMember:self->_familyMember];
    unint64_t v5 = v6;
  }
}

- (void)setAccessLevel:(unint64_t)a3
{
  if (self->_accessLevel != a3)
  {
    self->_accessLevel = a3;
    -[PKApplyController setAccessLevel:](self->_applyController, "setAccessLevel:");
  }
}

- (void)didUpdateFamilyMembers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v6 = [(PKFamilyMemberCollection *)self->_familyMemberCollection familyMembers];
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Family members did update from existing members %@ to new members %@", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v7 = [(PKFamilyMemberCollection *)self->_familyMemberCollection familyMembers];
    char v8 = PKEqualObjects();

    if ((v8 & 1) == 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56__PKAccountInvitationController_didUpdateFamilyMembers___block_invoke;
      v9[3] = &unk_1E59CA870;
      v9[4] = self;
      id v10 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v9);
    }
  }
}

void __56__PKAccountInvitationController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) altDSID];
  if (v2)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          char v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_msgSend(v8, "altDSID", (void)v16);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          id v10 = v2;
          id v11 = v10;
          if (v9 == v10)
          {

LABEL_16:
            objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v8);
            goto LABEL_17;
          }
          if (v9)
          {
            int v12 = [v9 isEqualToString:v10];

            if (v12) {
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 40)];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 88);
  *(void *)(v14 + 88) = v13;

  [*(id *)(a1 + 32) _fetchFamilyMemberDeviceCapabilties];
  [*(id *)(a1 + 32) _informObserversOfFamilyMemberChange];
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void))a3;
  id v9 = v4;
  if (!self->_familyMember)
  {
    uint64_t v7 = PKAccountInvitationChooseMemberViewController;
LABEL_7:
    char v8 = (void *)[[v7 alloc] initWithController:self];
    v9[2](v9, v8, 0);

    goto LABEL_9;
  }
  if (!self->_accessLevel)
  {
    uint64_t v7 = PKAccountInvitationAccessLevelViewController;
    goto LABEL_7;
  }
  id v5 = v4;
  applyController = self->_applyController;
  if (applyController) {
    [(PKApplyController *)applyController nextViewControllerWithCompletion:v9];
  }
  else {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
LABEL_9:
}

- (BOOL)isCurrentFamilyMemberAnOrganizer
{
  uint64_t v2 = [(PKFamilyMemberCollection *)self->_familyMemberCollection currentUser];
  char v3 = [v2 isOrganizer];

  return v3;
}

- (int64_t)familyCircleCount
{
  uint64_t v2 = [(PKFamilyMemberCollection *)self->_familyMemberCollection familyMembers];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)didAddAccountPendingFamilyMembers:(id)a3
{
}

- (void)familyMembersForceReload:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F84518]);
    char v8 = v7;
    if (self->_familyMemberCollection) {
      BOOL v9 = !v4;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke;
      v37[3] = &unk_1E59D7420;
      v37[4] = self;
      BOOL v38 = v4;
      [v7 addOperation:v37];
    }
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__32;
    v35[4] = __Block_byref_object_dispose__32;
    id v36 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_4;
    v33[3] = &unk_1E59D7448;
    BOOL v34 = v4;
    v33[4] = self;
    v33[5] = v35;
    [v8 addOperation:v33];
    v31[0] = 0;
    v31[1] = v31;
    id v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__32;
    v31[4] = __Block_byref_object_dispose__32;
    id v32 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_7;
    v30[3] = &unk_1E59CDD98;
    v30[4] = self;
    v30[5] = v31;
    [v8 addOperation:v30];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__32;
    v28[4] = __Block_byref_object_dispose__32;
    id v29 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_10;
    v27[3] = &unk_1E59CDD98;
    v27[4] = self;
    v27[5] = v28;
    [v8 addOperation:v27];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__32;
    void v25[4] = __Block_byref_object_dispose__32;
    id v26 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_13;
    v24[3] = &unk_1E59D74E0;
    v24[4] = self;
    v24[5] = v25;
    v24[6] = v31;
    v24[7] = v28;
    [v8 addOperation:v24];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__32;
    v22[4] = __Block_byref_object_dispose__32;
    id v23 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_15;
    v21[3] = &unk_1E59D7578;
    v21[4] = self;
    v21[5] = v25;
    v21[6] = v22;
    [v8 addOperation:v21];
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__32;
    v19[4] = __Block_byref_object_dispose__32;
    id v20 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_19;
    v18[3] = &unk_1E59D0740;
    v18[4] = v35;
    v18[5] = v19;
    [v8 addOperation:v18];
    id v10 = [MEMORY[0x1E4F1CA98] null];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_20;
    v12[3] = &unk_1E59D75A0;
    id v13 = v6;
    uint64_t v14 = v25;
    uint64_t v15 = v35;
    long long v16 = v22;
    long long v17 = v19;
    id v11 = (id)[v8 evaluateWithInput:v10 completion:v12];

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v22, 8);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v35, 8);
  }
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  BOOL v9 = *(void **)(v8 + 8);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_2;
  v13[3] = &unk_1E59CEB88;
  id v14 = v6;
  id v15 = v7;
  v13[4] = v8;
  id v11 = v6;
  id v12 = v7;
  [v9 familyMembersIgnoringCache:v10 completion:v13];
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_3;
  v5[3] = &unk_1E59CE9B0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:a1[5]];
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  id v5 = *(uint64_t (**)(void))(a1[7] + 16);

  return v5();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_5;
  v13[3] = &unk_1E59CC850;
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v10;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 pendingFamilyMembersIgnoringCache:v9 completion:v13];
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_6;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 16);
  long long v10 = [*(id *)(v8 + 48) accountIdentifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_8;
  v14[3] = &unk_1E59D7470;
  uint64_t v11 = *(void *)(a1 + 40);
  id v16 = v7;
  uint64_t v17 = v11;
  id v15 = v6;
  id v12 = v6;
  id v13 = v7;
  [v9 updateAccountUsersForAccountWithIdentifier:v10 completion:v14];
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_9;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  long long v10 = [*(id *)(v8 + 48) accountIdentifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_11;
  v14[3] = &unk_1E59D7498;
  uint64_t v11 = *(void *)(a1 + 40);
  id v16 = v7;
  uint64_t v17 = v11;
  id v15 = v6;
  id v12 = v6;
  id v13 = v7;
  [v9 updateFeatureApplicationsForAccountIdentifier:v10 completion:v14];
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_12;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_13(void *a1, uint64_t a2, void *a3, void *a4)
{
  long long v6 = (void *)a1[4];
  id v7 = (void *)v6[11];
  id v8 = a4;
  id v9 = a3;
  long long v10 = [v7 familyMembers];
  uint64_t v11 = [v6 _filteredFamilyMembersFromFamilyMembers:v10 accountUsers:*(void *)(*(void *)(a1[6] + 8) + 40) invitations:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "pk_arrayByApplyingBlock:", &__block_literal_global_127);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1[4] + 80) fetchDeviceCapabilitesForAppleIDs:v14 associatedFamilyMembers:*(void *)(*(void *)(a1[5] + 8) + 40)];
  v8[2](v8, v9, 0);
}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_14(uint64_t a1, void *a2)
{
  return [a2 appleID];
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_15(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "pk_arrayByApplyingBlock:", &__block_literal_global_81);
  id v9 = *(void **)(*(void *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_17;
  v12[3] = &unk_1E59D7550;
  long long v15 = *(_OWORD *)(a1 + 40);
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v9 photosForFamilyMembersWithDSIDs:v8 completion:v12];
}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_16(uint64_t a1, void *a2)
{
  return [a2 dsid];
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_18;
  block[3] = &unk_1E59D7528;
  uint64_t v4 = *(void *)(a1 + 56);
  id v9 = v3;
  uint64_t v12 = v4;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v11 = v7;
  id v10 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "dsid", (void)v16);
        id v10 = [v8 altDSID];
        long long v11 = [*(id *)(a1 + 32) objectForKey:v9];
        if (v11)
        {
          uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v11];
          [v2 setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  uint64_t v13 = [v2 copy];
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_19(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v23 = a4;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v22 = a1;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "inviteEmail", v22);
        if (v12)
        {
          Class FAProfilePictureStoreClass = getFAProfilePictureStoreClass();
          uint64_t v14 = [v11 contact];
          long long v15 = [v11 firstName];
          long long v16 = [v11 lastName];
          long long v17 = [(objc_class *)FAProfilePictureStoreClass profilePictureForContact:v14 serverImageData:0 firstName:v15 lastName:v16 diameter:80.0];

          if (v17)
          {
            long long v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v17];
            [v25 setObject:v18 forKeyedSubscript:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v19 = [v25 copy];
  uint64_t v20 = *(void *)(*(void *)(v22 + 40) + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  v23[2](v23, v24, 0);
}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_20(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[8] + 8) + 40));
}

- (void)accessLevelOptionsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    paymentService = self->_paymentService;
    id v6 = [(PKAccount *)self->_account accountIdentifier];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke;
    v7[3] = &unk_1E59CAD40;
    v7[4] = self;
    id v8 = v4;
    [(PKPaymentService *)paymentService featureApplicationsForAccountIdentifier:v6 completion:v7];
  }
}

void __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_87);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CE110;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 invitationDetails];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 originatorAltDSID];
    uint64_t v5 = PKAltDSIDIsCurrentUser();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke_3(uint64_t a1)
{
  id v17 = [*(id *)(*(void *)(a1 + 32) + 48) accountUserInvitationAllowedFeatureDescriptor];
  unint64_t v2 = [v17 minimumParticipantAge];
  unint64_t v3 = [v17 minimumOwnerAge];
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 96) age];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_msgSend(*(id *)(a1 + 40), "pk_firstObjectPassingTest:", &__block_literal_global_91);

  if (([*(id *)(*(void *)(a1 + 32) + 48) isCoOwner] & 1) == 0 && !v6 && v4 >= v3)
  {
    id v7 = [[PKAccountInvitationAccessLevelOption alloc] initWithAccessLevel:1];
    id v8 = PKLocalizedMadisonString(&cfstr_SharingTypeCoo.isa);
    [(PKAccountInvitationAccessLevelOption *)v7 setTitle:v8];

    uint64_t v9 = PKLocalizedMadisonString(&cfstr_SharingTypeCoo_0.isa);
    [(PKAccountInvitationAccessLevelOption *)v7 setSubtitle:v9];

    id v10 = PKUIImageNamed(@"MadisonJointOwner");
    [(PKAccountInvitationAccessLevelOption *)v7 setImage:v10];

    [v5 addObject:v7];
  }
  if (v4 >= v2)
  {
    long long v11 = [[PKAccountInvitationAccessLevelOption alloc] initWithAccessLevel:2];
    uint64_t v12 = PKLocalizedMadisonString(&cfstr_SharingTypePar.isa);
    [(PKAccountInvitationAccessLevelOption *)v11 setTitle:v12];

    uint64_t v13 = PKLocalizedMadisonString(&cfstr_SharingTypePar_0.isa);
    [(PKAccountInvitationAccessLevelOption *)v11 setSubtitle:v13];

    uint64_t v14 = PKUIImageNamed(@"MadisonParticipant");
    [(PKAccountInvitationAccessLevelOption *)v11 setImage:v14];

    [v5 addObject:v11];
  }
  uint64_t v15 = *(void *)(a1 + 48);
  long long v16 = (void *)[v5 copy];
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
}

uint64_t __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 invitationDetails];
  unint64_t v4 = v3;
  if (v3 && [v3 accountUserAccessLevel] == 1)
  {
    [v2 applicationState];
    uint64_t IsPendingInvitation = PKFeatureApplicationStateIsPendingInvitation();
  }
  else
  {
    uint64_t IsPendingInvitation = 0;
  }

  return IsPendingInvitation;
}

- (id)_filteredFamilyMembersFromFamilyMembers:(id)a3 accountUsers:(id)a4 invitations:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v16 accountState];
        id v17 = [v16 altDSID];
        if (v17 && (PKAccountStateIsTerminal() & 1) == 0) {
          [v10 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        id v24 = [v23 invitationDetails];
        id v25 = [v24 accountUserAltDSID];

        if (v25)
        {
          [v23 applicationState];
          if (PKFeatureApplicationStateIsPendingInvitation()) {
            [v10 addObject:v25];
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v20);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __98__PKAccountInvitationController__filteredFamilyMembersFromFamilyMembers_accountUsers_invitations___block_invoke;
  v29[3] = &unk_1E59D75E8;
  id v30 = v10;
  id v26 = v10;
  long long v27 = objc_msgSend(v7, "pk_objectsPassingTest:", v29);

  return v27;
}

uint64_t __98__PKAccountInvitationController__filteredFamilyMembersFromFamilyMembers_accountUsers_invitations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMe])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 altDSID];
    uint64_t v4 = [v5 containsObject:v6] ^ 1;
  }
  return v4;
}

- (void)_fetchFamilyMemberDeviceCapabilties
{
  id v3 = [(PKFamilyMemberCollection *)self->_familyMemberCollection familyMembers];
  id v5 = [(PKAccountInvitationController *)self _filteredFamilyMembersFromFamilyMembers:v3 accountUsers:0 invitations:0];

  uint64_t v4 = objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_114);
  [(PKDeviceSharingCapabilitiesManager *)self->_deviceCapabiltiesManager fetchDeviceCapabilitesForAppleIDs:v4 associatedFamilyMembers:v5];
}

uint64_t __68__PKAccountInvitationController__fetchFamilyMemberDeviceCapabilties__block_invoke(uint64_t a1, void *a2)
{
  return [a2 appleID];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    id v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __61__PKAccountInvitationController__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E59CAD18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __61__PKAccountInvitationController__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_informObserversOfFamilyMemberChange
{
}

void __69__PKAccountInvitationController__informObserversOfFamilyMemberChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didUpdateInvitationControllerFamilyCircle];
  }
}

- (PKAccount)account
{
  return self->_account;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (int64_t)context
{
  return self->_context;
}

- (PKApplyController)applyController
{
  return self->_applyController;
}

- (PKDeviceSharingCapabilitiesManager)deviceCapabiltiesManager
{
  return self->_deviceCapabiltiesManager;
}

- (PKFamilyMemberCollection)familyMemberCollection
{
  return self->_familyMemberCollection;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_deviceCapabiltiesManager, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_accountService, 0);

  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end