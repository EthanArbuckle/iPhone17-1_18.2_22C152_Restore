@interface PKSharedPassSharesController
- (BOOL)canAllowResharing;
- (BOOL)hasRevokableShares;
- (BOOL)isCrossPlatformSharingEnabled;
- (BOOL)isOwnerSharing;
- (BOOL)isSharingChannelBlockedForChannel:(id)a3 isRecipientKnownContact:(BOOL)a4;
- (BOOL)sharingEnabled;
- (BOOL)sharingFeatureEnabled;
- (NSArray)myEntitlements;
- (NSArray)nonLocalShares;
- (NSArray)rootShares;
- (NSArray)shareableEntitlements;
- (NSArray)shares;
- (PKPassShare)mostRecentlyCreatedShare;
- (PKSecureElementPass)pass;
- (PKSharedPassSharesController)initWithPass:(id)a3 contactResolver:(id)a4 webService:(id)a5 paymentServiceProvider:(id)a6 queue:(id)a7;
- (PKSharedPassSharesController)initWithPass:(id)a3 webService:(id)a4 paymentServiceProvider:(id)a5 queue:(id)a6;
- (id)_baseNewShareForPassIsTransfer:(BOOL)a3;
- (id)_contactResolver;
- (id)_feature;
- (id)_sharingActivationConfigurationForChannel:(id)a3 channelRisk:(int64_t)a4;
- (id)allowedSharingChannels;
- (id)baseNewShareForPass;
- (id)baseShareForPassTransferWithIsForCompanion:(BOOL)a3;
- (id)blockedSharingChannels;
- (id)childSharesOfShare:(id)a3;
- (id)contactForShare:(id)a3;
- (id)entitlementsForShare:(id)a3;
- (id)possiblePredefinedEntitlements;
- (id)senderShareForShare:(id)a3;
- (id)shareForShareIdentifier:(id)a3;
- (id)shareInitiationActivationConfigurationForChannelBundleIdentifier:(id)a3 isRecipientKnownContact:(BOOL)a4;
- (int64_t)_randomCodeOfLength:(int64_t)a3;
- (int64_t)_totalPendingCredentialShares;
- (int64_t)_totalPendingShares;
- (unint64_t)_numberOfSharesPartnerDoesNotKnowAbout;
- (unint64_t)maxEntitlementSelectionCount;
- (void)_immobilizerTokenCountWithCompletion:(id)a3;
- (void)addDefaultShareActivationOptionsToShare:(id)a3 availableOptions:(id *)a4 allowUserEdit:(BOOL *)a5 channelBundleIdentifier:(id)a6 isRecipientKnownContact:(BOOL)a7;
- (void)addDelegate:(id)a3;
- (void)canSendInvitationWithCompletion:(id)a3;
- (void)canSendInvitationWithIsTransfer:(BOOL)a3 completion:(id)a4;
- (void)canTransferWithCompletion:(id)a3;
- (void)createShareWithPartialShare:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)didUpdateShares;
- (void)fetchContactForShare:(id)a3 withCompletion:(id)a4;
- (void)prewarmCreateShare;
- (void)removeDelegate:(id)a3;
- (void)revokeAllSharesWithCompletion:(id)a3;
- (void)revokeShare:(id)a3 shouldCascade:(BOOL)a4 withCompletion:(id)a5;
- (void)setIsOwnerSharing:(BOOL)a3;
- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3;
- (void)updateEntitlementsWithCompletion:(id)a3;
- (void)updateShare:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)updateSharesWithCompletion:(id)a3;
@end

@implementation PKSharedPassSharesController

- (PKSharedPassSharesController)initWithPass:(id)a3 webService:(id)a4 paymentServiceProvider:(id)a5 queue:(id)a6
{
  return [(PKSharedPassSharesController *)self initWithPass:a3 contactResolver:0 webService:a4 paymentServiceProvider:a5 queue:a6];
}

- (PKSharedPassSharesController)initWithPass:(id)a3 contactResolver:(id)a4 webService:(id)a5 paymentServiceProvider:(id)a6 queue:(id)a7
{
  id v29 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(PKSharedPassSharesController *)self init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pass, a3);
    objc_storeStrong((id *)&v18->_contactResolver, a4);
    objc_storeStrong((id *)&v18->_webService, a5);
    objc_storeStrong((id *)&v18->_paymentServiceProvider, a6);
    [(PKPaymentDataProvider *)v18->_paymentServiceProvider addDelegate:v18];
    objc_storeStrong((id *)&v18->_queue, a7);
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    delegates = v18->_delegates;
    v18->_delegates = (NSHashTable *)v19;

    v18->_delegateLock._os_unfair_lock_opaque = 0;
    v21 = [(PKPaymentWebService *)v18->_webService targetDevice];
    v22 = [v21 paymentWebService:v18->_webService supportedRegionFeatureOfType:2];

    v23 = [(PKPaymentWebService *)v18->_webService targetDevice];
    v24 = [v23 deviceVersion];
    v25 = [v23 deviceClass];
    v26 = [v22 friendSharingOSVersionRequirement];
    v18->_friendSharingFeatureSupported = [v26 versionMeetsRequirements:v24 deviceClass:v25];

    v27 = [v22 ownerSharingOSVersionRequirement];
    v18->_ownerSharingFeatureSupported = [v27 versionMeetsRequirements:v24 deviceClass:v25];

    [(PKSharedPassSharesController *)v18 updateSharesWithCompletion:0];
  }

  return v18;
}

- (void)dealloc
{
  [(PKPaymentDataProvider *)self->_paymentServiceProvider removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)PKSharedPassSharesController;
  [(PKSharedPassSharesController *)&v3 dealloc];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    [(NSHashTable *)self->_delegates addObject:v4];
    os_unfair_lock_unlock(&self->_delegateLock);
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    [(NSHashTable *)self->_delegates removeObject:v4];
    os_unfair_lock_unlock(&self->_delegateLock);
  }
}

- (void)didUpdateShares
{
  if (!self->_isPerformingBatchOpperation)
  {
    p_delegateLock = &self->_delegateLock;
    os_unfair_lock_lock(&self->_delegateLock);
    id v4 = [(NSHashTable *)self->_delegates allObjects];
    os_unfair_lock_unlock(p_delegateLock);
    if ([v4 count])
    {
      queue = self->_queue;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __47__PKSharedPassSharesController_didUpdateShares__block_invoke;
      v6[3] = &unk_1E56D8A90;
      id v7 = v4;
      v8 = self;
      dispatch_async(queue, v6);
    }
  }
}

void __47__PKSharedPassSharesController_didUpdateShares__block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "sharedPassSharesControllerDidUpdateShares:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)contactForShare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKSharedPassSharesController *)self _contactResolver];
  uint64_t v6 = [v4 recipientHandle];

  long long v7 = [v5 contactForHandle:v6];

  return v7;
}

- (void)fetchContactForShare:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v8 = [(PKSharedPassSharesController *)self _contactResolver];

    queue = self->_queue;
    if (v8)
    {
      long long v10 = queue;
      v11 = [(PKSharedPassSharesController *)self _contactResolver];
      uint64_t v12 = [v6 recipientHandle];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke_2;
      v14[3] = &unk_1E56F3DA0;
      id v15 = v10;
      id v16 = v7;
      id v13 = v10;
      [v11 contactForHandle:v12 withCompletion:v14];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke;
      block[3] = &unk_1E56D8360;
      v18 = v7;
      dispatch_async(queue, block);
      id v13 = v18;
    }
  }
}

uint64_t __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke_3;
  v7[3] = &unk_1E56D83D8;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_contactResolver
{
  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v5 = +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys];
    id v6 = [[PKContactResolver alloc] initWithContactStore:v4 keysToFetch:v5];
    id v7 = self->_contactResolver;
    self->_contactResolver = v6;

    contactResolver = self->_contactResolver;
  }
  return contactResolver;
}

- (id)senderShareForShare:(id)a3
{
  id v4 = a3;
  shares = self->_shares;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PKSharedPassSharesController_senderShareForShare___block_invoke;
  v9[3] = &unk_1E56F3DC8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)shares pk_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __52__PKSharedPassSharesController_senderShareForShare___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [*(id *)(a1 + 32) senderShareIdentifier];
  id v5 = (void *)v4;
  if (v3 && v4) {
    uint64_t v6 = [v3 isEqual:v4];
  }
  else {
    uint64_t v6 = v3 == (void *)v4;
  }

  return v6;
}

- (void)updateSharesWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8A18;
  aBlock[4] = self;
  id v5 = v4;
  id v15 = v5;
  uint64_t v6 = (void (**)(void))_Block_copy(aBlock);
  id v7 = [(NSArray *)self->_shares pk_arrayBySafelyApplyingBlock:&__block_literal_global_205];
  id v8 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(PKObject *)self->_pass uniqueID];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_4;
    v10[3] = &unk_1E56E0000;
    id v11 = v7;
    uint64_t v12 = self;
    id v13 = v6;
    [v8 displayableSharesForPassIdentifier:v9 completion:v10];
  }
  else
  {
    v6[2](v6);
  }
}

void __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_2;
  v4[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 didUpdateShares];
}

uint64_t __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_5;
  v12[3] = &unk_1E56F3DC8;
  id v13 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "pk_firstObjectPassingTest:", v12);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v4) {
    id v7 = v4;
  }
  id v8 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v5;

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v3;
  id v11 = v3;

  [*(id *)(a1 + 40) updateEntitlementsWithCompletion:*(void *)(a1 + 48)];
}

uint64_t __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)updateEntitlementsWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8A18;
  aBlock[4] = self;
  id v5 = v4;
  id v12 = v5;
  uint64_t v6 = (void (**)(void))_Block_copy(aBlock);
  id v7 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(PKObject *)self->_pass uniqueID];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_3;
    v9[3] = &unk_1E56D8810;
    void v9[4] = self;
    id v10 = v6;
    [v7 displayableEntitlementsForPassIdentifier:v8 completion:v9];
  }
  else
  {
    v6[2](v6);
  }
}

void __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_2;
  block[3] = &unk_1E56D8360;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_79_0);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v4;

  uint64_t v7 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_81_1);

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 88);
  *(void *)(v8 + 88) = v7;

  id v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v10();
}

BOOL __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 entitlement];
  id v3 = [v2 shareability];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

uint64_t __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 entitlement];
  uint64_t v3 = [v2 active];

  return v3;
}

- (id)entitlementsForShare:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [v4 sharedEntitlements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) entitlementIdentifier];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = self->_shareableEntitlements;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        uint64_t v19 = objc_msgSend(v18, "entitlementIdentifier", (void)v24);
        int v20 = [v5 containsObject:v19];

        if (v20)
        {
          v21 = [v18 entitlement];
          [v12 addObject:v21];
        }
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }

  v22 = (void *)[v12 copy];
  return v22;
}

- (id)childSharesOfShare:(id)a3
{
  id v4 = a3;
  id v5 = [(NSArray *)self->_shares pk_groupDictionaryByApplyingBlock:&__block_literal_global_86];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [v4 identifier];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  uint64_t v9 = (void *)[v8 mutableCopy];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  while ([v9 count])
  {
    id v11 = [v9 lastObject];
    [v9 removeLastObject];
    id v12 = [v11 identifier];
    if (([v10 containsObject:v12] & 1) == 0)
    {
      [v10 addObject:v12];
      id v13 = [v5 objectForKeyedSubscript:v12];
      if (v13) {
        [v9 addObjectsFromArray:v13];
      }
      [v6 addObject:v11];
    }
  }
  uint64_t v14 = (void *)[v6 copy];

  return v14;
}

__CFString *__51__PKSharedPassSharesController_childSharesOfShare___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 senderShareIdentifier];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"none";
  }
  id v4 = v2;

  return v4;
}

- (NSArray)rootShares
{
  uint64_t v3 = [(NSArray *)self->_shares pk_indexDictionaryByApplyingBlock:&__block_literal_global_91_1];
  shares = self->_shares;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PKSharedPassSharesController_rootShares__block_invoke_2;
  v8[3] = &unk_1E56F3E50;
  id v9 = v3;
  id v5 = v3;
  id v6 = [(NSArray *)shares pk_objectsPassingTest:v8];

  return (NSArray *)v6;
}

uint64_t __42__PKSharedPassSharesController_rootShares__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

BOOL __42__PKSharedPassSharesController_rootShares__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLocalShare] && !PKShowLocalPassShares())
  {
    BOOL v6 = 0;
  }
  else
  {
    id v4 = [v3 senderShareIdentifier];
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      BOOL v6 = v5 == 0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  return v6;
}

- (NSArray)nonLocalShares
{
  return (NSArray *)[(NSArray *)self->_shares pk_objectsPassingTest:&__block_literal_global_94];
}

uint64_t __46__PKSharedPassSharesController_nonLocalShares__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocalShare] ^ 1;
}

- (id)shareForShareIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    shares = self->_shares;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__PKSharedPassSharesController_shareForShareIdentifier___block_invoke;
    v9[3] = &unk_1E56F3DC8;
    id v10 = v4;
    uint64_t v7 = [(NSArray *)shares pk_firstObjectPassingTest:v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __56__PKSharedPassSharesController_shareForShareIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
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

- (BOOL)sharingEnabled
{
  NSUInteger v3 = [(NSArray *)self->_shareableEntitlements count];
  BOOL result = [(PKSharedPassSharesController *)self sharingFeatureEnabled];
  if (!v3) {
    return 0;
  }
  return result;
}

- (BOOL)sharingFeatureEnabled
{
  uint64_t v2 = 40;
  if (self->_isOwnerSharing) {
    uint64_t v2 = 41;
  }
  int v3 = *((unsigned __int8 *)&self->super.isa + v2);
  BOOL result = [(PKSecureElementPass *)self->_pass supportsFeatureForCurrentDevice:1];
  if (!v3) {
    return 0;
  }
  return result;
}

- (void)canSendInvitationWithCompletion:(id)a3
{
}

- (void)canTransferWithCompletion:(id)a3
{
}

- (void)canSendInvitationWithIsTransfer:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = self->_queue;
  if (v6)
  {
    uint64_t v8 = [(PKObject *)self->_pass uniqueID];
    id v9 = PKLogFacilityTypeGetObject(0x21uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Can Share: Checking if pass can send invitation: %@", buf, 0xCu);
    }

    id v10 = [(PKSecureElementPass *)self->_pass devicePrimaryPaymentApplication];
    if ([(PKSecureElementPass *)self->_pass contactlessActivationState]
      || [v10 state] == 15)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Can Share: Unable to share because pass is not in an active state", buf, 2u);
      }

      PKLocalizationKeyForPassType(@"UNABLE_TO_SHARE_GENERIC_DESCRIPTION", self->_pass);
      id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v12 = PKLocalizedShareableCredentialString(v11, 0);

      id v13 = PKLocalizedShareableCredentialString(&cfstr_UnableToShareG_0.isa, 0);
      uint64_t v14 = PKDisplayableErrorCustomWithType(-1, v13, v12, 0, 0);
      v6[2](v6, v14);

      goto LABEL_9;
    }
    if (v4)
    {
      unint64_t v15 = [(NSArray *)self->_myEntitlements pk_countObjectsPassingTest:&__block_literal_global_102];
      if (v15 != [(NSArray *)self->_myEntitlements count])
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v16 = "Can Share: Unable to transfer because all entitlements not transferable";
LABEL_23:
          _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
          goto LABEL_24;
        }
        goto LABEL_24;
      }
    }
    else
    {
      NSUInteger v17 = [(NSArray *)self->_shareableEntitlements count];
      shareableEntitlements = self->_shareableEntitlements;
      if (!shareableEntitlements || !v17)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v16 = "Can Share: Unable to share because pass has no shareable entitlements";
          goto LABEL_23;
        }
LABEL_24:

        int v20 = [MEMORY[0x1E4F28C58] pkSharingError:7];
        long long v24 = _PKSharingDisplayableError(v20, 0, 0);
        v6[2](v6, v24);
LABEL_31:

        goto LABEL_32;
      }
      if ([(NSArray *)shareableEntitlements pk_countObjectsPassingTest:&__block_literal_global_106_0] != v17)
      {
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
LABEL_30:

          int v20 = PKLocalizedCredentialString(&cfstr_UnableToShareT_0.isa, 0);
          long long v24 = PKLocalizedCredentialString(&cfstr_UnableToShareE.isa, 0);
          long long v26 = PKDisplayableErrorCustomWithType(-1, v20, v24, 0, 0);
          v6[2](v6, v26);

          goto LABEL_31;
        }
        *(_WORD *)buf = 0;
        long long v25 = "Can Share: Unable to share because pass has entitlements with no remaining shares";
LABEL_29:
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
        goto LABEL_30;
      }
    }
    if ([(PKSharedPassSharesController *)self sharingFeatureEnabled])
    {
      if (![(PKSecureElementPass *)self->_pass isCarKeyPass])
      {
        v6[2](v6, 0);
        goto LABEL_9;
      }
      uint64_t v19 = [v10 subcredentials];
      int v20 = [v19 anyObject];

      v21 = [(PKPaymentWebService *)self->_webService targetDevice];
      webService = self->_webService;
      v23 = [v20 identifier];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_113;
      v27[3] = &unk_1E56F3F10;
      long long v28 = v7;
      long long v29 = self;
      long long v30 = v6;
      BOOL v31 = v4;
      [v21 paymentWebService:webService credentialWithIdentifier:v23 completion:v27];

LABEL_32:
LABEL_9:

      goto LABEL_10;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    long long v25 = "Can Share: sharing disabled";
    goto LABEL_29;
  }
LABEL_10:
}

uint64_t __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 entitlement];
  uint64_t v3 = [v2 intraAccountSharingEnabled];

  return v3;
}

uint64_t __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 entitlement];
  uint64_t v3 = [v2 hasRemainingShares];

  return v3;
}

void __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_2;
  block[3] = &unk_1E56F3EE8;
  id v9 = v3;
  id v11 = *(id *)(a1 + 48);
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v7.i64[0];
  int8x16_t v10 = vextq_s8(v7, v7, 8uLL);
  char v12 = *(unsigned char *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) sharingConfiguration];
  id v3 = v2;
  if (!v2)
  {
LABEL_17:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_18;
  }
  uint64_t v4 = [v2 numberOfShareableCredentials];
  uint64_t v5 = [*(id *)(a1 + 40) _numberOfSharesPartnerDoesNotKnowAbout];
  unint64_t v6 = [*(id *)(a1 + 40) _totalPendingShares];
  uint64_t v7 = [*(id *)(a1 + 40) _totalPendingCredentialShares];
  uint64_t v8 = PKLogFacilityTypeGetObject(0x21uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v24 = v4;
    __int16 v25 = 2048;
    uint64_t v26 = v5;
    __int16 v27 = 2048;
    unint64_t v28 = v6;
    __int16 v29 = 2048;
    uint64_t v30 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: shareableCredentials: %ld;  outstandingShares: %ld;  pendingShares: %ld;  pendingCredentialShares: %ld;",
      buf,
      0x2Au);
  }

  if (v4 <= v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v13;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: Unable to share credential, no shareable credentials remaining. \n %@", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = PKLocalizedCredentialString(&cfstr_UnableToShareT_0.isa, 0);
    char v12 = @"UNABLE_TO_SHARE_EXCEEDED_LIMIT_BODY";
    goto LABEL_12;
  }
  if (v6 < 8)
  {
    if (!PKBypassImmoTokenCountCheck())
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_117;
      v17[3] = &unk_1E56F3EC0;
      uint64_t v16 = *(void **)(a1 + 40);
      id v18 = *(id *)(a1 + 48);
      char v22 = *(unsigned char *)(a1 + 64);
      id v19 = *(id *)(a1 + 32);
      uint64_t v21 = v7;
      id v20 = *(id *)(a1 + 56);
      [v16 _immobilizerTokenCountWithCompletion:v17];

      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: Skipping immo token count check", buf, 2u);
    }

    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v9;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: Unable to share credential, reached pending share max. \n %@", buf, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = PKLocalizedCredentialString(&cfstr_UnableToShareT_0.isa, 0);
  char v12 = @"UNABLE_TO_SHARE_EXCEEDED_INVITATION_LIMIT_BODY";
LABEL_12:
  uint64_t v14 = PKLocalizedCredentialString(&v12->isa, 0);
  unint64_t v15 = PKDisplayableErrorCustomWithType(-1, v11, v14, 0, 0);
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v15);

LABEL_18:
}

void __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_117(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_2_118;
  v8[3] = &unk_1E56F3E98;
  char v14 = *(unsigned char *)(a1 + 64);
  uint64_t v11 = a2;
  uint64_t v5 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v12 = a3;
  uint64_t v13 = v6;
  id v10 = v7;
  dispatch_async(v5, v8);
}

void __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_2_118(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72)) {
    unint64_t v2 = 1;
  }
  else {
    unint64_t v2 = 2;
  }
  if (v2 > *(void *)(a1 + 48) && PKAppletSubcredentialSupportsSharingInAChain(*(void **)(a1 + 32)))
  {
    id v3 = PKLocalizedCredentialString(&cfstr_UnableToShareT_0.isa, 0);
    goto LABEL_10;
  }
  if (*(void *)(a1 + 56) < v2)
  {
    unint64_t v4 = *(void *)(a1 + 64);
    id v3 = PKLocalizedCredentialString(&cfstr_UnableToShareT_0.isa, 0);
    if (v4 > (v2 ^ 7))
    {
      uint64_t v5 = @"UNABLE_TO_SHARE_EXCEEDED_INVITATION_LIMIT_BODY";
LABEL_11:
      uint64_t v6 = PKLocalizedCredentialString(&v5->isa, 0);
      uint64_t v7 = PKDisplayableErrorCustomWithType(-1, v3, v6, 0, 0);

      goto LABEL_13;
    }
LABEL_10:
    uint64_t v5 = @"UNABLE_TO_SHARE_NO_TOKENS_BODY";
    goto LABEL_11;
  }
  uint64_t v7 = 0;
LABEL_13:
  uint64_t v8 = PKLogFacilityTypeGetObject(0x21uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"No";
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    if (!v7) {
      id v9 = @"Yes";
    }
    int v12 = 138413314;
    uint64_t v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    unint64_t v17 = v2;
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    __int16 v20 = 2048;
    unint64_t v21 = v2;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: %@, remainingShares: %lu (required: %lu) remainingDepth: %lu (required: %lu)", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)_numberOfSharesPartnerDoesNotKnowAbout
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v2 = self->_shares;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "groupIdentifier", (void)v10);
        if (!v8) {
          ++v5;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (int64_t)_totalPendingShares
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v2 = self->_shares;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "credentialShares", (void)v11);
        unsigned int v9 = objc_msgSend(v8, "pk_containsObjectPassingTest:", &__block_literal_global_126_0);

        v5 += v9;
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

BOOL __51__PKSharedPassSharesController__totalPendingShares__block_invoke(uint64_t a1, void *a2)
{
  return ([a2 status] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (int64_t)_totalPendingCredentialShares
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v2 = self->_shares;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        unsigned int v9 = objc_msgSend(v8, "credentialShares", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              if (([*(id *)(*((void *)&v15 + 1) + 8 * j) status] & 0xFFFFFFFFFFFFFFFELL) == 2) {
                ++v5;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v11);
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)_immobilizerTokenCountWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = [(PKSecureElementPass *)self->_pass devicePrimaryPaymentApplication];
    uint64_t v6 = [v5 subcredentials];
    uint64_t v7 = [v6 anyObject];

    if (v7)
    {
      uint64_t v8 = objc_alloc_init(PKDAManager);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __69__PKSharedPassSharesController__immobilizerTokenCountWithCompletion___block_invoke;
      v9[3] = &unk_1E56F3F58;
      id v10 = v4;
      [(PKDAManager *)v8 immobilizerTokensCountForCredential:v7 completion:v9];
    }
    else
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

uint64_t __69__PKSharedPassSharesController__immobilizerTokenCountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasRevokableShares
{
  return [(NSArray *)self->_shares pk_containsObjectPassingTest:&__block_literal_global_129_0];
}

uint64_t __50__PKSharedPassSharesController_hasRevokableShares__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRevokable];
}

- (void)revokeShare:(id)a3 shouldCascade:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PKPaymentWebService *)self->_webService targetDevice];
  objc_initWeak(&location, self);
  uint64_t v11 = [(PKObject *)self->_pass uniqueID];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PKSharedPassSharesController_revokeShare_shouldCascade_withCompletion___block_invoke;
  v13[3] = &unk_1E56EA978;
  objc_copyWeak(&v15, &location);
  id v12 = v9;
  id v14 = v12;
  [v10 revokeShareForPassIdentifier:v11 share:v8 shouldCascade:v6 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __73__PKSharedPassSharesController_revokeShare_shouldCascade_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained updateSharesWithCompletion:0];
    if (*(void *)(a1 + 32))
    {
      uint64_t v7 = v6[4];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __73__PKSharedPassSharesController_revokeShare_shouldCascade_withCompletion___block_invoke_2;
      v8[3] = &unk_1E56D8A18;
      id v9 = v4;
      id v10 = *(id *)(a1 + 32);
      dispatch_async(v7, v8);
    }
  }
}

void __73__PKSharedPassSharesController_revokeShare_shouldCascade_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    unint64_t v2 = PKLocalizedShareableCredentialString(&cfstr_RevokeShareErr.isa, 0);
    uint64_t v3 = PKLocalizedShareableCredentialString(&cfstr_RevokeShareErr_0.isa, 0);
    PKDisplayableErrorCustomWithType(-1, v2, v3, 0, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (void)revokeAllSharesWithCompletion:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  val = self;
  long long v16 = [(PKObject *)self->_pass uniqueID];
  id v4 = PKLogFacilityTypeGetObject(0x1BuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Revoking all shares for pass %@", (uint8_t *)&buf, 0xCu);
  }

  long long v17 = [(PKPaymentWebService *)self->_webService targetDevice];
  id v5 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__79;
  v42 = __Block_byref_object_dispose__79;
  id v43 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke;
  v37[3] = &unk_1E56E9040;
  v37[4] = self;
  [(PKAsyncUnaryOperationComposer *)v5 addOperation:v37];
  if (objc_opt_respondsToSelector())
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_3;
    v32[3] = &unk_1E56DF888;
    id v33 = v17;
    id v34 = v16;
    v35 = self;
    p_long long buf = &buf;
    [(PKAsyncUnaryOperationComposer *)v5 addOperation:v32];

    BOOL v6 = v33;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    BOOL v6 = [(PKSharedPassSharesController *)self rootShares];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_5;
          v23[3] = &unk_1E56DF888;
          id v24 = v17;
          id v25 = v16;
          uint64_t v26 = v10;
          __int16 v27 = &buf;
          [(PKAsyncUnaryOperationComposer *)v5 addOperation:v23];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v7);
    }
  }

  objc_initWeak(&location, val);
  uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_7;
  v18[3] = &unk_1E56F3FF0;
  v18[4] = val;
  objc_copyWeak(&v21, &location);
  long long v20 = &buf;
  id v12 = v14;
  id v19 = v12;
  id v13 = [(PKAsyncUnaryOperationComposer *)v5 evaluateWithInput:v11 completion:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_2;
  block[3] = &unk_1E56DEAA8;
  id v13 = v6;
  id v14 = v7;
  void block[4] = v8;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v9, block);
}

uint64_t __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_2(void *a1)
{
  *(unsigned char *)(a1[4] + 42) = 1;
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[5], 0);
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 48) rootShares];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_4;
  v14[3] = &unk_1E56F3FA0;
  uint64_t v11 = *(void *)(a1 + 56);
  id v16 = v7;
  uint64_t v17 = v11;
  id v15 = v6;
  id v12 = v6;
  id v13 = v7;
  [v8 revokeSharesForPassIdentifier:v9 shares:v10 shouldCascade:1 completion:v14];
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = a3;
  }
  objc_storeStrong(v6, v9);
  id v10 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_5(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_6;
  v14[3] = &unk_1E56F3FA0;
  uint64_t v11 = a1[6];
  uint64_t v10 = a1[7];
  id v16 = v7;
  uint64_t v17 = v10;
  id v15 = v6;
  id v12 = v6;
  id v13 = v7;
  [v8 revokeShareForPassIdentifier:v9 share:v11 shouldCascade:1 completion:v14];
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = a3;
  }
  objc_storeStrong(v6, v9);
  id v10 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_7(uint64_t a1)
{
  unint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_8;
  block[3] = &unk_1E56F3FC8;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(v2, block);

  objc_destroyWeak(&v7);
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 42) = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_9;
    v6[3] = &unk_1E56DC448;
    long long v5 = *(_OWORD *)(a1 + 32);
    id v4 = (id)v5;
    long long v7 = v5;
    [v3 updateSharesWithCompletion:v6];
  }
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_9(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    unint64_t v2 = PKLocalizedShareableCredentialString(&cfstr_RevokeShareErr.isa, 0);
    id v3 = PKLocalizedShareableCredentialString(&cfstr_RevokeShareErr_0.isa, 0);
    PKDisplayableErrorCustomWithType(-1, v2, v3, 0, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

- (void)createShareWithPartialShare:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PKPaymentWebService *)self->_webService targetDevice];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__PKSharedPassSharesController_createShareWithPartialShare_authorization_completion___block_invoke;
  v13[3] = &unk_1E56F4040;
  objc_copyWeak(&v15, &location);
  id v12 = v10;
  void v13[4] = self;
  id v14 = v12;
  [v11 createShareForPartialShareInvitation:v8 authorization:v9 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __85__PKSharedPassSharesController_createShareWithPartialShare_authorization_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (v6)
  {
    [WeakRetained updateSharesWithCompletion:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__PKSharedPassSharesController_createShareWithPartialShare_authorization_completion___block_invoke_2;
    v11[3] = &unk_1E56F4018;
    objc_copyWeak(&v15, (id *)(a1 + 48));
    id v14 = *(id *)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    [v8 updateSharesWithCompletion:v11];

    objc_destroyWeak(&v15);
  }
}

void __85__PKSharedPassSharesController_createShareWithPartialShare_authorization_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v5 = WeakRetained;
    id v4 = [*(id *)(a1 + 32) url];
    (*(void (**)(uint64_t, void *, void, void))(v3 + 16))(v3, v4, *(void *)(*(void *)(a1 + 40) + 96), 0);

    id WeakRetained = v5;
  }
}

- (void)updateShare:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PKPaymentWebService *)self->_webService targetDevice];
  objc_initWeak(&location, self);
  id v12 = [(PKObject *)self->_pass uniqueID];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PKSharedPassSharesController_updateShare_authorization_completion___block_invoke;
  v14[3] = &unk_1E56F4068;
  id v13 = v10;
  id v15 = v13;
  objc_copyWeak(&v16, &location);
  [v11 updateShareForPassIdentifier:v12 share:v8 authorization:v9 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __69__PKSharedPassSharesController_updateShare_authorization_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateSharesWithCompletion:0];
}

- (unint64_t)maxEntitlementSelectionCount
{
  if ([(PKSecureElementPass *)self->_pass isCarKeyPass]) {
    return 1;
  }
  else {
    return -1;
  }
}

- (BOOL)canAllowResharing
{
  return [(NSArray *)self->_shareableEntitlements pk_containsObjectPassingTest:&__block_literal_global_146];
}

uint64_t __49__PKSharedPassSharesController_canAllowResharing__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 entitlement];
  uint64_t v3 = [v2 shareability];

  uint64_t v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", &__block_literal_global_149_0);
  return v4;
}

BOOL __49__PKSharedPassSharesController_canAllowResharing__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 unsignedIntegerValue] != 0;
}

- (BOOL)isCrossPlatformSharingEnabled
{
  if (![(PKSecureElementPass *)self->_pass isCarKeyPass]) {
    return 1;
  }
  uint64_t v3 = [(PKSharedPassSharesController *)self _feature];
  uint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 enabled];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)baseNewShareForPass
{
  return [(PKSharedPassSharesController *)self _baseNewShareForPassIsTransfer:0];
}

- (id)_baseNewShareForPassIsTransfer:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = objc_alloc_init(PKPassShare);
  id v6 = objc_alloc_init(MEMORY[0x1E4F29128]);
  long long v7 = [v6 UUIDString];
  [(PKPassShare *)v5 setIdentifier:v7];

  [(PKPassShare *)v5 setStatus:3];
  if ([(PKSecureElementPass *)self->_pass isCarKeyPass]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(PKPassShare *)v5 setManageability:v8];
  id v9 = [PKPassEntitlementsComposer alloc];
  id v10 = v9;
  if (v3)
  {
    uint64_t v11 = [(PKPassEntitlementsComposer *)v9 initWithMyEntitlements:self->_myEntitlements];
  }
  else
  {
    shareableEntitlements = self->_shareableEntitlements;
    id v13 = [(PKSharedPassSharesController *)self possiblePredefinedEntitlements];
    uint64_t v11 = [(PKPassEntitlementsComposer *)v10 initWithSharedEntitlements:MEMORY[0x1E4F1CBF0] availableEntitlements:shareableEntitlements predefinedSharedEntitlements:v13 editable:1];

    id v14 = [(PKPassEntitlementsComposer *)v11 predefinedEntitlementEntries];
    if ([v14 count])
    {
      id v15 = [v14 objectAtIndexedSubscript:0];
      id v16 = [(PKPassEntitlementsComposer *)v11 viewForPredefined:v15];

      [v16 setEnabled:1];
    }
    else
    {
      id v16 = [(PKPassEntitlementsComposer *)v11 entitlementEntries];
      unint64_t v17 = (unint64_t)fmin((double)(unint64_t)[v16 count], (double)-[PKSharedPassSharesController maxEntitlementSelectionCount](self, "maxEntitlementSelectionCount"));
      if (v17)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          id v19 = [v16 objectAtIndexedSubscript:i];
          long long v20 = [(PKPassEntitlementsComposer *)v11 viewFor:v19];

          [v20 setEnabled:1];
        }
      }
    }
  }
  id v21 = [(PKPassEntitlementsComposer *)v11 composeSharedEntitlements];
  [(PKPassShare *)v5 setSharedEntitlements:v21];

  return v5;
}

- (id)baseShareForPassTransferWithIsForCompanion:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PKSharedPassSharesController *)self _baseNewShareForPassIsTransfer:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F29128]);
  long long v7 = [v6 UUIDString];

  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"Transfer-%@", v7];
  [v5 setRecipientNickname:v8];

  if ([(PKSecureElementPass *)self->_pass isCarKeyPass])
  {
    id v9 = objc_alloc_init(PKPassCredentialShare);
    [(PKPassCredentialShare *)v9 setStatus:2];
    if (v3) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = 5;
    }
    [(PKPassCredentialShare *)v9 setTargetDevice:v10];
    [v5 addCredentialShare:v9];
  }
  return v5;
}

- (id)possiblePredefinedEntitlements
{
  v37[1] = *MEMORY[0x1E4F143B8];
  pass = self->_pass;
  if (pass && ![(PKSecureElementPass *)pass isCarKeyPass])
  {
    long long v30 = 0;
  }
  else
  {
    BOOL v3 = [[PKPassSharedEntitlement alloc] initWithCarKeyEntitlementValue:0 role:@"089f"];
    uint64_t v4 = [PKPredefinedSharedEntitlementSelection alloc];
    char v5 = PKLocalizedCredentialString(&cfstr_PredefinedShar.isa, 0);
    id v6 = PKLocalizedCredentialString(&cfstr_PredefinedShar_0.isa, 0);
    long long v7 = PKLocalizedCredentialString(&cfstr_PredefinedExis.isa, 0);
    v37[0] = v3;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    v32 = [(PKPredefinedSharedEntitlementSelection *)v4 initWithTitle:v5 preshareDescription:v6 postshareDescription:v7 sharedEntitlements:v8];

    id v9 = [[PKPassSharedEntitlement alloc] initWithCarKeyEntitlementValue:0 role:@"080A"];
    uint64_t v10 = [PKPredefinedSharedEntitlementSelection alloc];
    uint64_t v11 = PKLocalizedCredentialString(&cfstr_PredefinedShar_1.isa, 0);
    id v12 = PKLocalizedCredentialString(&cfstr_PredefinedShar_2.isa, 0);
    id v13 = PKLocalizedCredentialString(&cfstr_PredefinedExis_0.isa, 0);
    v36 = v9;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    id v15 = [(PKPredefinedSharedEntitlementSelection *)v10 initWithTitle:v11 preshareDescription:v12 postshareDescription:v13 sharedEntitlements:v14];

    id v16 = [[PKPassSharedEntitlement alloc] initWithCarKeyEntitlementValue:0 role:@"0009"];
    unint64_t v17 = [PKPredefinedSharedEntitlementSelection alloc];
    long long v18 = PKLocalizedCredentialString(&cfstr_PredefinedShar_3.isa, 0);
    id v19 = PKLocalizedCredentialString(&cfstr_PredefinedShar_4.isa, 0);
    long long v20 = PKLocalizedCredentialString(&cfstr_PredefinedExis_1.isa, 0);
    v35 = v16;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    long long v22 = [(PKPredefinedSharedEntitlementSelection *)v17 initWithTitle:v18 preshareDescription:v19 postshareDescription:v20 sharedEntitlements:v21];

    v23 = [[PKPassSharedEntitlement alloc] initWithCarKeyEntitlementValue:5 role:@"0000"];
    id v24 = [PKPredefinedSharedEntitlementSelection alloc];
    id v25 = PKLocalizedCredentialString(&cfstr_PredefinedShar_5.isa, 0);
    uint64_t v26 = PKLocalizedCredentialString(&cfstr_PredefinedShar_6.isa, 0);
    __int16 v27 = PKLocalizedCredentialString(&cfstr_PredefinedExis_2.isa, 0);
    id v34 = v23;
    long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    long long v29 = [(PKPredefinedSharedEntitlementSelection *)v24 initWithTitle:v25 preshareDescription:v26 postshareDescription:v27 sharedEntitlements:v28];

    v33[0] = v32;
    v33[1] = v15;
    v33[2] = v22;
    v33[3] = v29;
    long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  }
  return v30;
}

- (void)addDefaultShareActivationOptionsToShare:(id)a3 availableOptions:(id *)a4 allowUserEdit:(BOOL *)a5 channelBundleIdentifier:(id)a6 isRecipientKnownContact:(BOOL)a7
{
  BOOL v7 = a7;
  id v15 = a3;
  id v12 = [(PKSharedPassSharesController *)self shareInitiationActivationConfigurationForChannelBundleIdentifier:a6 isRecipientKnownContact:v7];
  id v13 = v12;
  if (a5) {
    *a5 = [v12 allowUserEdit];
  }
  if (a4)
  {
    *a4 = [v13 availableOptions];
  }
  id v14 = [v13 defaultOptions];
  if (v14) {
    [v15 setActivationOptions:v14];
  }
}

- (id)shareInitiationActivationConfigurationForChannelBundleIdentifier:(id)a3 isRecipientKnownContact:(BOOL)a4
{
  BOOL v4 = a4;
  v62[2] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  BOOL v7 = v6;
  if (v6 == @"com.apple.UIKit.activity.Message") {
    goto LABEL_79;
  }
  if (!v6) {
    goto LABEL_16;
  }
  int v8 = [(__CFString *)v6 isEqualToString:@"com.apple.UIKit.activity.Message"];

  if (v8)
  {
LABEL_79:
    if (PKSharingUseIMessageExtension()) {
      goto LABEL_12;
    }
  }
  id v9 = v7;
  if (v9 == @"com.apple.UIKit.activity.AirDrop")
  {
LABEL_12:
    if (v4) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 2;
    }
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  if (v9)
  {
    int v11 = [(__CFString *)v9 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

    if (v4) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 2;
    }
    if (!v11) {
      goto LABEL_17;
    }
LABEL_15:
    int v11 = 1;
    goto LABEL_18;
  }
LABEL_16:

  int v11 = 0;
LABEL_17:
  uint64_t v12 = 1;
LABEL_18:
  id v13 = [(PKSharedPassSharesController *)self _sharingActivationConfigurationForChannel:v7 channelRisk:v12];
  id v14 = v13;
  if (v13) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v11;
  }
  if (v11 && v13) {
    BOOL v15 = [v13 trustLevel] == 1;
  }
  uint64_t v16 = [v14 defaultState];
  BOOL v51 = v4;
  if (v14 && v16) {
    int v17 = v16 == 1;
  }
  else {
    int v17 = !v15 || !v4;
  }
  if (![(PKSecureElementPass *)self->_pass isCarKeyPass])
  {
    long long v22 = 0;
    goto LABEL_57;
  }
  long long v18 = [(PKSecureElementPass *)self->_pass devicePrimaryPaymentApplication];
  id v19 = [v18 subcredentials];
  long long v20 = [v19 anyObject];
  id v21 = [v20 sharingConfiguration];
  long long v22 = [v21 activationOptions];

  int v23 = PKSharingCarKeyActivationOptionForceVEP();
  int v24 = PKSharingCarKeyActivationOptionForcePhysicalKey();
  char v25 = PKSharingCarKeyActivationOptionForcePinCode();
  char v26 = v25;
  __int16 v27 = 0;
  if ((v23 | v24) == 1 && (v25 & 1) == 0)
  {
    if (v24)
    {
      long long v28 = PKLogFacilityTypeGetObject(0x21uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Warning: Forcing physical key due to debug toggle", buf, 2u);
      }

      long long v29 = [[PKPassShareActivationOption alloc] initWithCarKeyIdentifier:@"ownerKeyActivation"];
      v62[0] = v29;
      long long v30 = [[PKPassShareActivationOption alloc] initWithCarKeyIdentifier:@"keyFobActivation"];
      v62[1] = v30;
      __int16 v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];

      if (!v23) {
        goto LABEL_44;
      }
    }
    else
    {
      __int16 v27 = 0;
      if (!v23) {
        goto LABEL_44;
      }
    }
    long long v31 = PKLogFacilityTypeGetObject(0x21uLL);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Warning: Forcing VEP due to debug toggle", buf, 2u);
    }

    v32 = +[PKPassShareActivationOption vehicleEnteredPin];
    [v32 setValue:@"112233"];
    if (v27)
    {
      uint64_t v33 = [v27 arrayByAddingObject:v32];

      __int16 v27 = (void *)v33;
    }
    else
    {
      v61 = v32;
      __int16 v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
    }
  }
LABEL_44:
  if (v27) {
    BOOL v34 = 1;
  }
  else {
    BOOL v34 = v22 == 0;
  }
  char v35 = v34 || v15;
  char v36 = v35 | v26;
  if (v34) {
    v37 = v27;
  }
  else {
    v37 = 0;
  }
  if ((v36 & 1) == 0)
  {
    v38 = PKPassShareActivationOptionExternallyManagedTypes();
    v37 = [v22 optionsOfTypes:v38];
  }
  if (v37)
  {
    uint64_t v39 = 0;
    int v17 = 1;
    goto LABEL_65;
  }
LABEL_57:
  uint64_t v40 = [v22 optionOfType:1];
  if (v40)
  {
    if (!v14) {
      goto LABEL_62;
    }
  }
  else
  {
    uint64_t v40 = [[PKPassShareActivationOption alloc] initWithDefaultIdentifierForType:1];
    if (!v14) {
      goto LABEL_62;
    }
  }
  if ([v14 codeLength] >= 6)
  {
    uint64_t v41 = [v14 codeLength];
    goto LABEL_64;
  }
LABEL_62:
  uint64_t v41 = 6;
LABEL_64:
  v42 = [NSNumber numberWithInteger:PKRandomNumberOfLength(v41)];
  id v43 = [v42 stringValue];
  [(PKPassShareActivationOption *)v40 setValue:v43];

  v60 = v40;
  uint64_t v39 = 1;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];

LABEL_65:
  uint64_t v44 = [[PKPassShareActivationOptions alloc] initWithOptions:v37];
  if (v14) {
    BOOL v45 = [v14 trustLevel] == 3;
  }
  else {
    BOOL v45 = 0;
  }
  v46 = objc_alloc_init(PKPassShareInitiationActivationConfiguration);
  v47 = v46;
  if (v17) {
    [(PKPassShareInitiationActivationConfiguration *)v46 setDefaultOptions:v44];
  }
  [(PKPassShareInitiationActivationConfiguration *)v47 setAvailableOptions:v44];
  [(PKPassShareInitiationActivationConfiguration *)v47 setAllowUserEdit:v39];
  [(PKPassShareInitiationActivationConfiguration *)v47 setIsBlocked:v45];
  v48 = PKLogFacilityTypeGetObject(0x21uLL);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = @"No";
    *(_DWORD *)long long buf = 138413058;
    v53 = v7;
    __int16 v54 = 2112;
    if (v51) {
      v49 = @"Yes";
    }
    v55 = v49;
    __int16 v56 = 2112;
    v57 = v47;
    __int16 v58 = 2112;
    v59 = v14;
    _os_log_impl(&dword_190E10000, v48, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Determined activation options for channel: '%@' known recipient: '%@'. \n\nConfiguration: %@ \n\nFeature: %@", buf, 0x2Au);
  }

  return v47;
}

- (void)prewarmCreateShare
{
  id v4 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(PKObject *)self->_pass uniqueID];
    [v4 prewarmCreateShareForPassIdentifier:v3 completion:0];
  }
}

- (int64_t)_randomCodeOfLength:(int64_t)a3
{
  unsigned int v4 = __exp10((double)(a3 - 1));
  double v5 = __exp10((double)a3);
  return arc4random_uniform((v5 + -1.0) - v4 + 1) + v4;
}

- (id)blockedSharingChannels
{
  unint64_t v2 = [(PKSharedPassSharesController *)self _sharingActivationConfigurationForChannel:0 channelRisk:0];
  BOOL v3 = [v2 blockedSharingChannels];

  return v3;
}

- (id)allowedSharingChannels
{
  unint64_t v2 = [(PKSharedPassSharesController *)self _sharingActivationConfigurationForChannel:0 channelRisk:0];
  BOOL v3 = [v2 allowedSharingChannels];

  return v3;
}

- (BOOL)isSharingChannelBlockedForChannel:(id)a3 isRecipientKnownContact:(BOOL)a4
{
  unsigned int v4 = [(PKSharedPassSharesController *)self shareInitiationActivationConfigurationForChannelBundleIdentifier:a3 isRecipientKnownContact:a4];
  char v5 = [v4 isBlocked];

  return v5;
}

- (id)_feature
{
  BOOL v3 = [(PKPaymentWebService *)self->_webService context];
  unsigned int v4 = [(PKPass *)self->_pass passTypeIdentifier];
  char v5 = [v3 regionForIdentifier:v4];

  id v6 = [v5 regionCode];
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(PKPaymentWebService *)self->_webService targetDevice];
    id v8 = [v9 deviceRegion];
  }
  uint64_t v10 = [v3 configuration];
  int v11 = [v10 featureWithType:5 inRegion:v8];

  return v11;
}

- (id)_sharingActivationConfigurationForChannel:(id)a3 channelRisk:(int64_t)a4
{
  id v6 = a3;
  id v21 = [(PKSharedPassSharesController *)self _feature];
  BOOL v7 = [v21 activationCodeConfigurations];
  int64_t v8 = [(PKSecureElementPass *)self->_pass accessType];
  id v9 = PKDeviceClass();
  uint64_t v10 = +[PKOSVersionRequirement fromDeviceVersion];
  int v11 = [(PKSecureElementPass *)self->_pass devicePrimaryPaymentApplication];
  uint64_t v12 = [v11 subcredentials];
  id v13 = [v12 anyObject];
  id v14 = [v13 manufacturerIdentifier];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__PKSharedPassSharesController__sharingActivationConfigurationForChannel_channelRisk___block_invoke;
  v22[3] = &unk_1E56F40D0;
  int64_t v27 = a4;
  int64_t v28 = v8;
  id v23 = v6;
  id v24 = v10;
  id v25 = v9;
  id v26 = v14;
  id v15 = v14;
  id v16 = v9;
  id v17 = v10;
  id v18 = v6;
  id v19 = objc_msgSend(v7, "pk_firstObjectPassingTest:", v22);

  return v19;
}

uint64_t __86__PKSharedPassSharesController__sharingActivationConfigurationForChannel_channelRisk___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 channelBundleIdentifier];
  if (v4)
  {
    char v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id v6 = v5;
      if (v6 == v4)
      {
      }
      else
      {
        BOOL v7 = v6;
        uint64_t v8 = [v6 caseInsensitiveCompare:v4];

        if (v8) {
          goto LABEL_18;
        }
      }
    }
  }
  uint64_t v9 = [v3 channelRiskLevel];
  if (!v9 || *(void *)(a1 + 64) == v9)
  {
    uint64_t v10 = [v3 accessPassType];
    if (!v10 || *(void *)(a1 + 72) == v10)
    {
      int v11 = [v3 versionRange];
      uint64_t v12 = v11;
      if (v11
        && ![v11 versionMeetsRequirements:*(void *)(a1 + 40) deviceClass:*(void *)(a1 + 48)])
      {
        uint64_t v18 = 0;
LABEL_25:

        goto LABEL_26;
      }
      id v13 = [v3 manufacturerIdentifier];
      if (v13)
      {
        id v14 = *(id *)(a1 + 56);
        id v15 = v13;
        id v16 = v15;
        if (v14 == v15)
        {
        }
        else
        {
          if (!v14)
          {

LABEL_23:
            uint64_t v18 = 0;
            goto LABEL_24;
          }
          int v17 = [v14 isEqualToString:v15];

          if (!v17) {
            goto LABEL_23;
          }
        }
      }
      uint64_t v18 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
LABEL_18:
  uint64_t v18 = 0;
LABEL_26:

  return v18;
}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(PKObject *)self->_pass uniqueID];
  id v6 = v5;
  if (v4 && v5)
  {
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (v6 == v4)
  {
LABEL_6:
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__PKSharedPassSharesController_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke;
    v8[3] = &unk_1E56E4508;
    void v8[4] = self;
    objc_copyWeak(&v9, &location);
    [(PKSharedPassSharesController *)self updateSharesWithCompletion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
LABEL_7:
}

void __83__PKSharedPassSharesController_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKSharedPassSharesController_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke_2;
  block[3] = &unk_1E56DD818;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __83__PKSharedPassSharesController_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didUpdateShares];
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (BOOL)isOwnerSharing
{
  return self->_isOwnerSharing;
}

- (void)setIsOwnerSharing:(BOOL)a3
{
  self->_isOwnerSharing = a3;
}

- (NSArray)shares
{
  return self->_shares;
}

- (NSArray)shareableEntitlements
{
  return self->_shareableEntitlements;
}

- (NSArray)myEntitlements
{
  return self->_myEntitlements;
}

- (PKPassShare)mostRecentlyCreatedShare
{
  return self->_mostRecentlyCreatedShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentlyCreatedShare, 0);
  objc_storeStrong((id *)&self->_myEntitlements, 0);
  objc_storeStrong((id *)&self->_shareableEntitlements, 0);
  objc_storeStrong((id *)&self->_shares, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_paymentServiceProvider, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end