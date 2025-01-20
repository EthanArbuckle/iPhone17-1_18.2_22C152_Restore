@interface PKAppleCardUtilities
- (PKAppleCardUtilities)init;
- (id)_activeAccountUserWithAltDSID:(id)a3;
- (id)_contactKeysToFetch;
- (id)_pendingSentInvitationWithAltDSID:(id)a3;
- (void)_fetchDataIfNecessaryWithCompletion:(id)a3;
- (void)accountChanged:(id)a3;
- (void)accountRemoved:(id)a3;
- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)appleCardAccessLevelForAltDSID:(id)a3 completion:(id)a4;
- (void)appleCardAccountStateWithCompletion:(id)a3;
- (void)appleCardIsSharedWithWithAltDSID:(id)a3 completion:(id)a4;
- (void)appleCardTransactionLimitForAltDSID:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)featureApplicationAdded:(id)a3;
- (void)featureApplicationChanged:(id)a3;
- (void)featureApplicationRemoved:(id)a3;
- (void)hasAppleCardWithCompletion:(id)a3;
- (void)hasSentPendingAppleCardInvitationToUserWithAltDSID:(id)a3 completion:(id)a4;
- (void)presentAppleCardSharingDetailsForAltDSID:(id)a3 viewController:(id)a4 completion:(id)a5;
- (void)presentAppleCardSharingDetailsForAltDSID:(id)a3 viewController:(id)a4 hideUserDetailHeader:(BOOL)a5 completion:(id)a6;
- (void)presentAppleCardUserInvitationFlowWithViewController:(id)a3 completion:(id)a4;
@end

@implementation PKAppleCardUtilities

- (PKAppleCardUtilities)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKAppleCardUtilities;
  v2 = [(PKAppleCardUtilities *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v2];
    paymentService = v3->_paymentService;
    v3->_paymentService = (PKPaymentService *)v4;

    uint64_t v6 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v3->_accountService;
    v3->_accountService = (PKAccountService *)v6;

    [(PKAccountService *)v3->_accountService registerObserver:v3];
  }
  return v3;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKAppleCardUtilities;
  [(PKAppleCardUtilities *)&v3 dealloc];
}

- (void)hasAppleCardWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Checking if the current user has apple card", buf, 2u);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PKAppleCardUtilities_hasAppleCardWithCompletion___block_invoke;
    v6[3] = &unk_1E59CAD18;
    v6[4] = self;
    id v7 = v4;
    [(PKAppleCardUtilities *)self _fetchDataIfNecessaryWithCompletion:v6];
  }
}

void __51__PKAppleCardUtilities_hasAppleCardWithCompletion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 32);
  id v4 = *(id *)(v2 + 56);
  v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  id v6 = v3;
  os_unfair_lock_unlock(v5);
  if (!v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      v10 = "User doesnt have an apple card account";
      v11 = (uint8_t *)&v14;
LABEL_10:
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
LABEL_11:

    objc_super v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  id v7 = PKLogFacilityTypeGetObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      v10 = "User doesnt have apple card pass provisioned";
      v11 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v8)
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Current user has apple card", v12, 2u);
  }

  objc_super v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_12:
  v9();
}

- (void)appleCardAccountStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Checking the current user's apple card account state", buf, 2u);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PKAppleCardUtilities_appleCardAccountStateWithCompletion___block_invoke;
    v6[3] = &unk_1E59CAD18;
    v6[4] = self;
    id v7 = v4;
    [(PKAppleCardUtilities *)self _fetchDataIfNecessaryWithCompletion:v6];
  }
}

void __60__PKAppleCardUtilities_appleCardAccountStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (v2)
  {
    unint64_t v3 = [v2 state] - 1;
    if (v3 > 3) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = qword_1A0443378[v3];
    }
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [NSNumber numberWithInteger:v4];
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Current user's apple card account is in state: %@", (uint8_t *)&v9, 0xCu);
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "User doesnt have an apple card account", (uint8_t *)&v9, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

- (void)appleCardAccessLevelForAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    BOOL v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Checking apple card access level of user %@", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__PKAppleCardUtilities_appleCardAccessLevelForAltDSID_completion___block_invoke;
    v9[3] = &unk_1E59CE110;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(PKAppleCardUtilities *)self _fetchDataIfNecessaryWithCompletion:v9];
  }
}

void __66__PKAppleCardUtilities_appleCardAccessLevelForAltDSID_completion___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  id v2 = *(id *)(a1[4] + 32);
  id v3 = *(id *)(a1[4] + 48);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  uint64_t v4 = [v3 accountUserWithAltDSID:a1[5]];
  if (!v4) {
    goto LABEL_5;
  }
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[5];
    int v20 = 138412546;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Apple Card account user for altDSID %@ is %@", (uint8_t *)&v20, 0x16u);
  }

  uint64_t v7 = [v4 accessLevel];
  if (!v7)
  {
LABEL_5:
    BOOL v8 = PKCurrentUserAltDSID();
    int v9 = (void *)a1[5];
    id v10 = v8;
    id v11 = v9;
    if (v10 == v11)
    {
    }
    else
    {
      v12 = v11;
      if (!v10 || !v11)
      {

        uint64_t v7 = 0;
LABEL_14:

        goto LABEL_15;
      }
      int v13 = [v10 isEqualToString:v11];

      if (!v13)
      {
        uint64_t v7 = 0;
        goto LABEL_15;
      }
    }
    uint64_t v7 = [v2 accessLevel];
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = a1[5];
      int v20 = 138412290;
      uint64_t v21 = v14;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "altDSID %@ is the current Apple Card user", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = a1[5];
    v17 = PKAccountAccessLevelToString();
    int v20 = 138412546;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Apple Card access level for %@ is %@", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v18 = 1;
  if (v7 == 2) {
    uint64_t v18 = 2;
  }
  if (v7) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  (*(void (**)(void, uint64_t))(a1[6] + 16))(a1[6], v19);
}

- (void)appleCardIsSharedWithWithAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    BOOL v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Checking apple card is being shared with altDSID %@.", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PKAppleCardUtilities_appleCardIsSharedWithWithAltDSID_completion___block_invoke;
    v9[3] = &unk_1E59CE110;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(PKAppleCardUtilities *)self _fetchDataIfNecessaryWithCompletion:v9];
  }
}

void __68__PKAppleCardUtilities_appleCardIsSharedWithWithAltDSID_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  id v4 = *(id *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (!v2)
  {
    v12 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v13 = *(void *)(a1 + 40);
    int v18 = 138412290;
    uint64_t v19 = v13;
    uint64_t v14 = "Cannot check if apple card is being shared with %@ since there is no account.";
LABEL_13:
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 0xCu);
    goto LABEL_14;
  }
  if (!v4)
  {
    v12 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v15 = *(void *)(a1 + 40);
    int v18 = 138412290;
    uint64_t v19 = v15;
    uint64_t v14 = "Cannot check if apple card is being shared with %@ since there is no pass.";
    goto LABEL_13;
  }
  v5 = [v3 accountUsers];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) _activeAccountUserWithAltDSID:*(void *)(a1 + 40)];
    BOOL v8 = PKLogFacilityTypeGetObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 40);
        int v18 = 138412290;
        uint64_t v19 = v10;
        id v11 = "Apple card is being shared with altDSID %@.";
LABEL_17:
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, 0xCu);
      }
    }
    else if (v9)
    {
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 138412290;
      uint64_t v19 = v17;
      id v11 = "Apple card is not being shared with altDSID %@.";
      goto LABEL_17;
    }

    (*(void (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7 != 0);
    goto LABEL_19;
  }
  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    int v18 = 138412290;
    uint64_t v19 = v16;
    uint64_t v14 = "Cannot check if apple card is being shared with %@ since there are no account users.";
    goto LABEL_13;
  }
LABEL_14:

  (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
LABEL_19:
}

- (void)hasSentPendingAppleCardInvitationToUserWithAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (v6 && v7)
  {
    BOOL v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Checking if pending sent invitation exists with altDSID %@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__PKAppleCardUtilities_hasSentPendingAppleCardInvitationToUserWithAltDSID_completion___block_invoke;
    v10[3] = &unk_1E59CE110;
    v10[4] = self;
    id v11 = v6;
    id v12 = v8;
    [(PKAppleCardUtilities *)self _fetchDataIfNecessaryWithCompletion:v10];
  }
}

void __86__PKAppleCardUtilities_hasSentPendingAppleCardInvitationToUserWithAltDSID_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
  id v4 = *(id *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (!v2)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    int v16 = 138412290;
    uint64_t v17 = v11;
    id v12 = "Cannot check for pending apple card invitations with %@ since there is no account.";
LABEL_13:
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0xCu);
    goto LABEL_14;
  }
  if (!v4)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v13 = *(void *)(a1 + 40);
    int v16 = 138412290;
    uint64_t v17 = v13;
    id v12 = "Cannot check for pending apple card invitations with %@ since there is no pass.";
    goto LABEL_13;
  }
  if ([v3 count])
  {
    v5 = [*(id *)(a1 + 32) _pendingSentInvitationWithAltDSID:*(void *)(a1 + 40)];
    id v6 = PKLogFacilityTypeGetObject();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 40);
        int v16 = 138412290;
        uint64_t v17 = v8;
        BOOL v9 = "Apple card has a sent pending invitation with altDSID %@.";
LABEL_17:
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 0xCu);
      }
    }
    else if (v7)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      int v16 = 138412290;
      uint64_t v17 = v15;
      BOOL v9 = "Apple card has no sent pending invitation with altDSID %@.";
      goto LABEL_17;
    }

    (*(void (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5 != 0);
    goto LABEL_19;
  }
  uint64_t v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    int v16 = 138412290;
    uint64_t v17 = v14;
    id v12 = "Cannot check for pending apple card invitations with %@ since there are no sent invitations.";
    goto LABEL_13;
  }
LABEL_14:

  (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
LABEL_19:
}

- (void)appleCardTransactionLimitForAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if (v6)
    {
      BOOL v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Checking transaction limit for apple card user with altDSID %@", buf, 0xCu);
      }

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __71__PKAppleCardUtilities_appleCardTransactionLimitForAltDSID_completion___block_invoke;
      v10[3] = &unk_1E59CE110;
      v10[4] = self;
      id v11 = v6;
      id v12 = v8;
      [(PKAppleCardUtilities *)self _fetchDataIfNecessaryWithCompletion:v10];
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __71__PKAppleCardUtilities_appleCardTransactionLimitForAltDSID_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _activeAccountUserWithAltDSID:*(void *)(a1 + 40)];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  id v4 = *(id *)(*(void *)(a1 + 32) + 48);
  id v5 = *(id *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (!v3)
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    uint64_t v15 = *(void *)(a1 + 40);
    int v21 = 138412290;
    uint64_t v22 = v15;
    int v16 = "Cannot get transaction limit for %@ since there is no account.";
LABEL_22:
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, 0xCu);
    goto LABEL_23;
  }
  if (!v5)
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    uint64_t v17 = *(void *)(a1 + 40);
    int v21 = 138412290;
    uint64_t v22 = v17;
    int v16 = "Cannot get transaction limit for %@ since there is no pass.";
    goto LABEL_22;
  }
  id v6 = [v4 accountUsers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    uint64_t v18 = *(void *)(a1 + 40);
    int v21 = 138412290;
    uint64_t v22 = v18;
    int v16 = "Cannot get transaction limit for %@ since there is no account users.";
    goto LABEL_22;
  }
  if (!v2)
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      int v21 = 138412290;
      uint64_t v22 = v20;
      int v16 = "Cannot get transaction limit for %@ since there is no account account with that altDSID.";
      goto LABEL_22;
    }
LABEL_23:

    (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
    goto LABEL_24;
  }
  uint64_t v8 = [v2 preferences];
  BOOL v9 = [v3 creditDetails];
  uint64_t v10 = [v9 currencyCode];

  id v11 = [v8 transactionSpendLimitAmount];
  if ([v8 transactionSpendLimitEnabled] && v11 && v10)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v21 = 138412546;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Apple Card transaction limit for %@ is %@.", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      int v21 = 138412290;
      uint64_t v22 = v19;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Apple Card transaction limit is not enabled for %@.", (uint8_t *)&v21, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_24:
}

- (void)presentAppleCardUserInvitationFlowWithViewController:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Presenting apple card add user flow with presenting view controller %@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__PKAppleCardUtilities_presentAppleCardUserInvitationFlowWithViewController_completion___block_invoke;
    v10[3] = &unk_1E59CA938;
    v10[4] = self;
    id v12 = v8;
    id v11 = v6;
    [(PKAppleCardUtilities *)self _fetchDataIfNecessaryWithCompletion:v10];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __88__PKAppleCardUtilities_presentAppleCardUserInvitationFlowWithViewController_completion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  id v4 = *(id *)(*(void *)(a1 + 32) + 56);
  id v5 = *(id *)(*(void *)(a1 + 32) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (!v2)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Cannot present apple card user invite flow since there is no account.";
    goto LABEL_8;
  }
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__PKAppleCardUtilities_presentAppleCardUserInvitationFlowWithViewController_completion___block_invoke_28;
    v10[3] = &unk_1E59CAA98;
    uint64_t v6 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    +[PKAccountInvitationController presentCreateAccountUserInvitationWithViewController:v6 account:v2 accountUserCollection:v3 familyMemberCollection:v5 context:3 completion:v10];

    goto LABEL_11;
  }
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v8 = "Cannot present apple card user invite flow since there is no pass.";
LABEL_8:
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
  }
LABEL_9:

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
LABEL_11:
}

uint64_t __88__PKAppleCardUtilities_presentAppleCardUserInvitationFlowWithViewController_completion___block_invoke_28(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)presentAppleCardSharingDetailsForAltDSID:(id)a3 viewController:(id)a4 completion:(id)a5
{
}

- (void)presentAppleCardSharingDetailsForAltDSID:(id)a3 viewController:(id)a4 hideUserDetailHeader:(BOOL)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v10 && v11)
  {
    uint64_t v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Presenting apple card shared user info for altDSID %@ and viewController %@", buf, 0x16u);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __112__PKAppleCardUtilities_presentAppleCardSharingDetailsForAltDSID_viewController_hideUserDetailHeader_completion___block_invoke;
    v14[3] = &unk_1E59CEAE8;
    v14[4] = self;
    id v15 = v10;
    id v17 = v12;
    BOOL v18 = a5;
    id v16 = v11;
    [(PKAppleCardUtilities *)self _fetchDataIfNecessaryWithCompletion:v14];
  }
  else if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

void __112__PKAppleCardUtilities_presentAppleCardSharingDetailsForAltDSID_viewController_hideUserDetailHeader_completion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _activeAccountUserWithAltDSID:*(void *)(a1 + 40)];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  id v4 = *(id *)(*(void *)(a1 + 32) + 56);
  id v5 = *(id *)(*(void *)(a1 + 32) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (!v3)
  {
    id v17 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v18 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v18;
    uint64_t v19 = "Cannot present apple card sharing details for user %@ since there is no account.";
    goto LABEL_13;
  }
  if (!v4)
  {
    id v17 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v20;
    uint64_t v19 = "Cannot present apple card sharing details for user %@ since there is no pass.";
    goto LABEL_13;
  }
  if (v2)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v7 = objc_alloc(MEMORY[0x1E4F845E8]);
    uint64_t v8 = [*(id *)(a1 + 32) _contactKeysToFetch];
    uint64_t v9 = (void *)[v7 initWithContactStore:v6 keysToFetch:v8];

    id v10 = [PKContactAvatarManager alloc];
    id v11 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    id v12 = [(PKContactAvatarManager *)v10 initWithContactResolver:v9 paymentDataProvider:v11];

    uint64_t v13 = [PKAccountUserDetailViewController alloc];
    LOBYTE(v23) = *(unsigned char *)(a1 + 64);
    id v14 = [(PKAccountUserDetailViewController *)v13 initWithPaymentPass:v4 style:1 account:v3 accountUser:v2 familyMemberCollection:v5 avatarManager:v12 contactResolver:v9 hideUserDetailHeader:v23];
    id v15 = [*(id *)(a1 + 48) navigationController];
    [v15 pushViewController:v14 animated:1];

    uint64_t v16 = *(void *)(a1 + 56);
    if (v16) {
      (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, 1);
    }

    goto LABEL_16;
  }
  id v17 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v21;
    uint64_t v19 = "Cannot present apple card sharing details for user %@ since there is no account user.";
LABEL_13:
    _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
  }
LABEL_14:

  uint64_t v22 = *(void *)(a1 + 56);
  if (v22) {
    (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0);
  }
LABEL_16:
}

- (void)didUpdateFamilyMembers:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (PKFamilyMemberCollection *)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:v5];

  familyMemberCollection = self->_familyMemberCollection;
  self->_familyMemberCollection = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)featureApplicationAdded:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sentInvitations = self->_sentInvitations;
  self->_sentInvitations = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)featureApplicationChanged:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sentInvitations = self->_sentInvitations;
  self->_sentInvitations = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)featureApplicationRemoved:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sentInvitations = self->_sentInvitations;
  self->_sentInvitations = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)accountChanged:(id)a3
{
  id v12 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(PKAccount *)self->_account accountIdentifier];
  id v5 = [v12 accountIdentifier];
  account = v4;
  id v7 = v5;
  if (account == v7)
  {

    goto LABEL_10;
  }
  uint64_t v8 = v7;
  if (account) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {

LABEL_11:
    goto LABEL_12;
  }
  char v10 = [(PKAccount *)account isEqualToString:v7];

  if (v10)
  {
LABEL_10:
    id v11 = (PKAccount *)v12;
    account = self->_account;
    self->_account = v11;
    goto LABEL_11;
  }
LABEL_12:
  os_unfair_lock_unlock(&self->_lock);
}

- (void)accountRemoved:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKAccount *)self->_account accountIdentifier];
  id v7 = [v5 accountIdentifier];

  account = v6;
  BOOL v9 = v7;
  if (account == v9)
  {

    goto LABEL_7;
  }
  char v10 = v9;
  if (!account || !v9)
  {

    goto LABEL_9;
  }
  char v11 = [(PKAccount *)account isEqualToString:v9];

  if (v11)
  {
LABEL_7:
    account = self->_account;
    self->_account = 0;
LABEL_9:
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  userCollection = [(PKAccount *)self->_account accountIdentifier];
  uint64_t v8 = (PKAccountUserCollection *)v6;
  BOOL v9 = v8;
  if (userCollection == v8)
  {

    goto LABEL_7;
  }
  if (!v8 || !userCollection)
  {

    goto LABEL_9;
  }
  int v10 = [(PKAccountUserCollection *)userCollection isEqualToString:v8];

  if (v10)
  {
LABEL_7:
    char v11 = (PKAccountUserCollection *)[objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:v12];
    userCollection = self->_userCollection;
    self->_userCollection = v11;
LABEL_9:
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)_activeAccountUserWithAltDSID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKAccountUserCollection *)self->_userCollection accountUserWithAltDSID:v5];

  os_unfair_lock_unlock(p_lock);
  if (v6 && ([v6 accountState], (PKAccountStateIsTerminal() & 1) == 0)) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_pendingSentInvitationWithAltDSID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sentInvitations = self->_sentInvitations;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PKAppleCardUtilities__pendingSentInvitationWithAltDSID___block_invoke;
  v11[3] = &unk_1E59CEB10;
  id v12 = v4;
  id v7 = v4;
  uint64_t v8 = [(NSArray *)sentInvitations pk_firstObjectPassingTest:v11];
  os_unfair_lock_unlock(p_lock);
  if (v8 && ([v8 applicationState], (PKFeatureApplicationStateIsTerminal() & 1) == 0)) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

uint64_t __58__PKAppleCardUtilities__pendingSentInvitationWithAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 invitationDetails];
  id v4 = [v3 accountUserAltDSID];
  id v5 = v2;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v9 = 1;
  }
  else
  {
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [v5 isEqualToString:v6];
    }
  }

  return v9;
}

- (void)_fetchDataIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  objc_initWeak(location, self);
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_account;
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke;
    v24[3] = &unk_1E59CEB60;
    objc_copyWeak(&v25, location);
    v24[4] = self;
    [v5 addOperation:v24];
    objc_destroyWeak(&v25);
  }
  os_unfair_lock_lock(&self->_lock);
  id v7 = self->_familyMemberCollection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v7)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_40;
    v22[3] = &unk_1E59CEB60;
    objc_copyWeak(&v23, location);
    v22[4] = self;
    [v5 addOperation:v22];
    objc_destroyWeak(&v23);
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL v8 = self->_userCollection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v8)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_43;
    v20[3] = &unk_1E59CEB60;
    objc_copyWeak(&v21, location);
    v20[4] = self;
    [v5 addOperation:v20];
    objc_destroyWeak(&v21);
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = self->_sentInvitations;
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_46;
    v18[3] = &unk_1E59CEB60;
    objc_copyWeak(&v19, location);
    v18[4] = self;
    [v5 addOperation:v18];
    objc_destroyWeak(&v19);
  }
  os_unfair_lock_lock(&self->_lock);
  int v10 = self->_pass;
  os_unfair_lock_unlock(&self->_lock);
  if (!v10)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_49;
    v16[3] = &unk_1E59CEB60;
    objc_copyWeak(&v17, location);
    v16[4] = self;
    [v5 addOperation:v16];
    objc_destroyWeak(&v17);
  }
  char v11 = [MEMORY[0x1E4F1CA98] null];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_54;
  v14[3] = &unk_1E59CEC00;
  id v12 = v4;
  id v15 = v12;
  id v13 = (id)[v5 evaluateWithInput:v11 completion:v14];

  objc_destroyWeak(location);
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(void **)(v9 + 16);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2;
    v11[3] = &unk_1E59CEB38;
    void v11[4] = v9;
    id v13 = v7;
    id v12 = v6;
    [v10 defaultAccountForFeature:2 completion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities acount: %@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_40(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(void **)(v9 + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_41;
    v11[3] = &unk_1E59CEB88;
    void v11[4] = v9;
    id v13 = v7;
    id v12 = v6;
    [v10 familyMembersWithCompletion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_41(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities family members: %@", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_43(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    id v9 = [*(id *)(*(void *)(a1 + 32) + 32) accountIdentifier];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = *(void **)(v10 + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_44;
    v12[3] = &unk_1E59CEBB0;
    v12[4] = v10;
    id v14 = v7;
    id v13 = v6;
    [v11 accountUsersForAccountWithIdentifier:v9 completion:v12];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_44(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v4;

  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities users: %@", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_46(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    id v9 = [*(id *)(*(void *)(a1 + 32) + 32) accountIdentifier];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = *(void **)(v10 + 24);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_47;
    v12[3] = &unk_1E59CEB88;
    v12[4] = v10;
    id v14 = v7;
    id v13 = v6;
    [v11 featureApplicationsForAccountIdentifier:v9 completion:v12];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

uint64_t __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_47(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v5 = objc_msgSend(v4, "pk_objectsPassingTest:", &__block_literal_global_45);

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v6);

  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 64);
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities sentInvitations: %@", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

BOOL __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 applicationType] == 2 && objc_msgSend(v2, "feature") == 2;

  return v3;
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_49(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    id v9 = [*(id *)(*(void *)(a1 + 32) + 32) accountIdentifier];
    int v10 = [*(id *)(*(void *)(a1 + 32) + 32) associatedPassUniqueID];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v11 = [MEMORY[0x1E4F84898] sharedInstance];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_51;
    v13[3] = &unk_1E59CEBD8;
    v13[4] = *(void *)(a1 + 32);
    id v14 = v10;
    id v16 = v7;
    id v15 = v6;
    id v12 = v10;
    [v11 paymentPassWithAssociatedAccountIdentifier:v9 completion:v13];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_51(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  objc_storeStrong((id *)(a1[4] + 56), a2);
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F84898] sharedInstance];
    id v6 = [v5 passWithUniqueID:a1[5]];
    uint64_t v7 = [v6 paymentPass];
    uint64_t v8 = a1[4];
    id v9 = *(void **)(v8 + 56);
    *(void *)(v8 + 56) = v7;
  }
  int v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1[4] + 56);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities pass: %@", (uint8_t *)&v12, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  (*(void (**)(void))(a1[7] + 16))();
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_54(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_55;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_55(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_contactKeysToFetch
{
  v11[6] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v11[0] = v2;
  Class v3 = _MergedGlobals_661();
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v11[1] = v5;
  id v6 = [(Class)off_1EB545940() descriptorForRequiredKeys];
  v11[2] = v6;
  uint64_t v7 = [(Class)off_1EB545948() descriptorForRequiredKeys];
  uint64_t v8 = *MEMORY[0x1E4F1ADC8];
  v11[3] = v7;
  void v11[4] = v8;
  void v11[5] = *MEMORY[0x1E4F1AEE0];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentInvitations, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_userCollection, 0);
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);

  objc_storeStrong((id *)&self->_accountService, 0);
}

@end