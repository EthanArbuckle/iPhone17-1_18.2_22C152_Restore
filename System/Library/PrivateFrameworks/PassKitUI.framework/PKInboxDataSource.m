@interface PKInboxDataSource
- (BOOL)hasInboxMessages;
- (BOOL)inboxVisible;
- (PKInboxDataSource)initWithDelegate:(id)a3;
- (id)activeInboxMessages;
- (id)expiredInboxMessages;
- (id)inboxMessageWithIdentifier:(id)a3;
- (unint64_t)badgeCount;
- (void)_accountUserInvitationsCompletion:(id)a3;
- (void)_updateInboxMessages;
- (void)updateInboxWithCompletion:(id)a3;
@end

@implementation PKInboxDataSource

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "altDSID", (void)v15);
        if (v11) {
          [v4 setObject:v10 forKeyedSubscript:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [v4 copy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)inboxVisible
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_inboxVisible;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)badgeCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t badgeCount = self->_badgeCount;
  os_unfair_lock_unlock(p_lock);
  return badgeCount;
}

void __41__PKInboxDataSource__updateInboxMessages__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__PKInboxDataSource__updateInboxMessages__block_invoke_2;
  v12[3] = &unk_1E59DEA68;
  uint64_t v8 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v16 = v6;
  id v17 = v7;
  id v15 = v9;
  id v10 = v6;
  id v11 = v7;
  [v8 _accountUserInvitationsCompletion:v12];
}

- (PKInboxDataSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKInboxDataSource;
  id v5 = [(PKInboxDataSource *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v6];
    paymentService = v6->_paymentService;
    v6->_paymentService = (PKPaymentService *)v7;

    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    inboxUpdateCompletionBlocks = v6->_inboxUpdateCompletionBlocks;
    v6->_inboxUpdateCompletionBlocks = v9;

    v6->_lock._os_unfair_lock_opaque = 0;
    [(PKInboxDataSource *)v6 _updateInboxMessages];
  }

  return v6;
}

- (void)_updateInboxMessages
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL updatingInbox = self->_updatingInbox;
  os_unfair_lock_unlock(p_lock);
  if (!updatingInbox)
  {
    os_unfair_lock_lock(p_lock);
    self->_BOOL updatingInbox = 1;
    os_unfair_lock_unlock(p_lock);
    id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __41__PKInboxDataSource__updateInboxMessages__block_invoke;
    v21[3] = &unk_1E59CF430;
    v21[4] = self;
    id v9 = v7;
    id v22 = v9;
    id v10 = v8;
    id v23 = v10;
    id v11 = v6;
    id v24 = v11;
    [v5 addOperation:v21];
    objc_super v12 = [MEMORY[0x1E4F1CA98] null];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__PKInboxDataSource__updateInboxMessages__block_invoke_3;
    v17[3] = &unk_1E59DC280;
    v17[4] = self;
    id v18 = v11;
    id v19 = v10;
    id v20 = v9;
    id v13 = v9;
    id v14 = v10;
    id v15 = v11;
    id v16 = (id)[v5 evaluateWithInput:v12 completion:v17];
  }
}

- (void)_accountUserInvitationsCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__59;
  v17[4] = __Block_byref_object_dispose__59;
  id v18 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke;
  v16[3] = &unk_1E59CDD98;
  v16[4] = self;
  v16[5] = v17;
  [v5 addOperation:v16];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__59;
  v14[4] = __Block_byref_object_dispose__59;
  id v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_4;
  v13[3] = &unk_1E59CDD98;
  v13[4] = self;
  v13[5] = v14;
  [v5 addOperation:v13];
  id v6 = [MEMORY[0x1E4F1CA98] null];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_6;
  v9[3] = &unk_1E59DEAB8;
  id v11 = v17;
  objc_super v12 = v14;
  id v7 = v4;
  id v10 = v7;
  id v8 = (id)[v5 evaluateWithInput:v6 completion:v9];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v17, 8);
}

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_223);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_5;
  v12[3] = &unk_1E59CC850;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v8 familyMembersWithCompletion:v12];
}

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_2;
  v12[3] = &unk_1E59D7498;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v8 featureApplicationsForAccountUserInvitationWithCompletion:v12];
}

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_6(void *a1)
{
  v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_7;
  v4[3] = &unk_1E59DEA90;
  v4[4] = a1[6];
  id v3 = objc_msgSend(v2, "pk_arrayByApplyingBlock:", v4);
  (*(void (**)(void))(a1[4] + 16))();
}

void __41__PKInboxDataSource__updateInboxMessages__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        char v9 = [v8 isHidden];
        id v10 = (id *)(a1 + 32);
        if ((v9 & 1) == 0)
        {
          if ([v8 isExpired]) {
            id v10 = (id *)(a1 + 40);
          }
          else {
            id v10 = (id *)(a1 + 48);
          }
        }
        [*v10 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __41__PKInboxDataSource__updateInboxMessages__block_invoke_3(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
  if (PKEqualObjects() && PKEqualObjects()) {
    int v2 = PKEqualObjects() ^ 1;
  }
  else {
    int v2 = 1;
  }
  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  uint64_t v6 = [*(id *)(a1 + 56) copy];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;

  uint64_t v9 = [*(id *)(a1 + 48) copy];
  uint64_t v10 = *(void *)(a1 + 32);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  BOOL v12 = [*(id *)(*(void *)(a1 + 32) + 24) count]
     || [*(id *)(*(void *)(a1 + 32) + 32) count]
     || [*(id *)(*(void *)(a1 + 32) + 40) count] != 0;
  if ([*(id *)(*(void *)(a1 + 32) + 24) count]) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = [*(id *)(*(void *)(a1 + 32) + 40) count] != 0;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v14);
        }
        v17 += [*(id *)(*((void *)&v32 + 1) + 8 * i) shouldBadge];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v16);
  }
  else
  {
    uint64_t v17 = 0;
  }

  *(void *)(*(void *)(a1 + 32) + 72) = v17;
  *(unsigned char *)(*(void *)(a1 + 32) + 65) = v13;
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = v12;
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  id v20 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v22 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained inboxDataSourceDidUpdateInboxMessages:*(void *)(a1 + 32)];
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v23 = v20;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v23);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v28 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v28 + 1) + 8 * j));
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v25);
  }
}

- (id)activeInboxMessages
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_activeInboxMessages copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)expiredInboxMessages
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_expiredInboxMessages copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)inboxMessageWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    activeInboxMessages = self->_activeInboxMessages;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke;
    v17[3] = &unk_1E59DEA40;
    id v7 = v4;
    id v18 = v7;
    id v8 = [(NSMutableArray *)activeInboxMessages pk_firstObjectPassingTest:v17];
    if (!v8)
    {
      hiddenInboxMessages = self->_hiddenInboxMessages;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke_2;
      v15[3] = &unk_1E59DEA40;
      id v10 = v7;
      id v16 = v10;
      id v8 = [(NSMutableArray *)hiddenInboxMessages pk_firstObjectPassingTest:v15];

      if (!v8)
      {
        expiredInboxMessages = self->_expiredInboxMessages;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke_3;
        v13[3] = &unk_1E59DEA40;
        id v14 = v10;
        id v8 = [(NSMutableArray *)expiredInboxMessages pk_firstObjectPassingTest:v13];
      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

uint64_t __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

uint64_t __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)updateInboxWithCompletion:(id)a3
{
  id aBlock = a3;
  os_unfair_lock_lock(&self->_lock);
  if (aBlock)
  {
    inboxUpdateCompletionBlocks = self->_inboxUpdateCompletionBlocks;
    id v5 = _Block_copy(aBlock);
    [(NSMutableArray *)inboxUpdateCompletionBlocks addObject:v5];
  }
  os_unfair_lock_unlock(&self->_lock);
  [(PKInboxDataSource *)self _updateInboxMessages];
}

- (BOOL)hasInboxMessages
{
  int v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasInboxMessages;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

uint64_t __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 applicationState];
  uint64_t v4 = [v2 applicationStateReason];

  int IsTerminal = PKFeatureApplicationStateIsTerminal();
  BOOL v7 = v3 == 14 && v4 == 14;
  if (v3 == 12) {
    BOOL v7 = 1;
  }
  return !IsTerminal || v7;
}

id __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 invitationDetails];
  id v5 = [v4 originatorAltDSID];

  if (v5)
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v5];
  }
  else
  {
    id v6 = 0;
  }
  BOOL v7 = +[PKInboxMessage accountUserInvitationInboxMessageWithAccountUserInvitation:v3 familyMember:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxUpdateCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_expiredInboxMessages, 0);
  objc_storeStrong((id *)&self->_hiddenInboxMessages, 0);
  objc_storeStrong((id *)&self->_activeInboxMessages, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end