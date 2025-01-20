@interface PKDiscoveryService
+ (PKDiscoveryService)sharedInstance;
- (PKDiscoveryService)init;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4;
- (id)observers;
- (int64_t)welcomeCardCount;
- (void)addObserver:(id)a3;
- (void)beginReporingDiscoveryAnalytics;
- (void)completedCTAForItem:(id)a3;
- (void)completedDiscoveryItemCTAWithCompletion:(id)a3;
- (void)deleteRuleWithIdentifier:(id)a3 completion:(id)a4;
- (void)dialogRequestsChangedForPlacement:(id)a3;
- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutsUpdated:(id)a3;
- (void)discoveryArticleLayoutsWithCompletion:(id)a3;
- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5;
- (void)discoveryEngagementMessagesUpdated;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4;
- (void)discoveryItemsWithCompletion:(id)a3;
- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5;
- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5;
- (void)dismissedDiscoveryItems:(id)a3;
- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3;
- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8;
- (void)endReporingDiscoveryAnalytics;
- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7;
- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4;
- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4;
- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5;
- (void)insertRule:(id)a3 completion:(id)a4;
- (void)manifestAllowsMiniCardsWithCompletion:(id)a3;
- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3;
- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removedAllDiscoveryItems;
- (void)rulesWithCompletion:(id)a3;
- (void)tappedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5;
- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryManifestWithCompletion:(id)a3;
@end

@implementation PKDiscoveryService

void __36__PKDiscoveryService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB403670;
  qword_1EB403670 = (uint64_t)v1;
}

- (PKDiscoveryService)init
{
  if (!PKSecureElementIsAvailable())
  {
    v12 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_190E10000, v12, OS_LOG_TYPE_ERROR, "Discovery Service isn't supported on this device.", v14, 2u);
    }

    id v3 = 0;
    goto LABEL_7;
  }
  v15.receiver = self;
  v15.super_class = (Class)PKDiscoveryService;
  id v3 = [(PKDiscoveryService *)&v15 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.passkit.pkdiscoveryservice.reply", 0);
    v5 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v4;

    v6 = [PKXPCService alloc];
    v7 = PDDiscoveryServiceInterface();
    v8 = PKDiscoveryServiceInterface();
    uint64_t v9 = [(PKXPCService *)v6 initWithMachServiceName:@"com.apple.passd.discovery" remoteObjectInterface:v7 exportedObjectInterface:v8 exportedObject:v3];
    v10 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v9;

    *((_DWORD *)v3 + 8) = 0;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    self = (PKDiscoveryService *)*((void *)v3 + 3);
    *((void *)v3 + 3) = v11;
LABEL_7:
  }
  return (PKDiscoveryService *)v3;
}

+ (PKDiscoveryService)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PKDiscoveryService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_294 != -1) {
    dispatch_once(&_MergedGlobals_294, block);
  }
  v2 = (void *)qword_1EB403670;
  return (PKDiscoveryService *)v2;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)manifestAllowsMiniCardsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PKDiscoveryService_manifestAllowsMiniCardsWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    v8 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v12];
    uint64_t v9 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PKDiscoveryService_manifestAllowsMiniCardsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56F6F40;
    id v11 = v7;
    [v9 manifestAllowsMiniCardsWithCompletion:v10];
  }
}

uint64_t __60__PKDiscoveryService_manifestAllowsMiniCardsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginReporingDiscoveryAnalytics
{
  id v3 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  dispatch_queue_t v4 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v3];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PKDiscoveryService_beginReporingDiscoveryAnalytics__block_invoke;
  v5[3] = &unk_1E56DB8E8;
  v5[4] = self;
  [v4 beginReportingDiscoveryAnalyticsCompletion:v5];
}

- (void)dismissedDiscoveryItems:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    v8 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v12];
    uint64_t v9 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke_2;
    v10[3] = &unk_1E56D90B0;
    void v10[4] = self;
    id v11 = v7;
    [v9 dismissedDiscoveryItems:v10];
  }
}

- (void)discoveryArticleLayoutsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    v8 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v12];
    uint64_t v9 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D90B0;
    void v10[4] = self;
    id v11 = v7;
    [v9 discoveryArticleLayoutsWithCompletion:v10];
  }
}

- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    v8 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v12];
    uint64_t v9 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D9528;
    void v10[4] = self;
    id v11 = v7;
    [v9 processDiscoveryItemsAndMessagesWithCompletion:v10];
  }
}

- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKDiscoveryService_errorHandlerForMethod_completion___block_invoke;
  aBlock[3] = &unk_1E56DC960;
  id v12 = v6;
  SEL v13 = a3;
  aBlock[4] = self;
  id v7 = v6;
  v8 = _Block_copy(aBlock);
  uint64_t v9 = _Block_copy(v8);

  return v9;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

uint64_t __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void __53__PKDiscoveryService_beginReporingDiscoveryAnalytics__block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in beginReporingDiscoveryAnalytics: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

uint64_t __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

void __53__PKDiscoveryService_beginReporingDiscoveryAnalytics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PKDiscoveryService_beginReporingDiscoveryAnalytics__block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __55__PKDiscoveryService_errorHandlerForMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKDiscoveryService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PKDiscoveryService_errorHandlerForMethod_completion___block_invoke_31;
  v11[3] = &unk_1E56D8428;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v16 = __dispatch_async_ar_block_invoke_25;
  v17 = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v3;
  dispatch_async(v6, &buf);
}

uint64_t __55__PKDiscoveryService_errorHandlerForMethod_completion___block_invoke_31(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E56F6F18;
    v13[4] = self;
    id v14 = v9;
    [v12 discoveryArticleLayoutForItemWithIdentifier:v10 completion:v13];
  }
}

uint64_t __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateDiscoveryManifestWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    id v8 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D9528;
    void v10[4] = self;
    id v11 = v7;
    [v9 updateDiscoveryManifestWithCompletion:v10];
  }
}

uint64_t __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __60__PKDiscoveryService_manifestAllowsMiniCardsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke;
    v17[3] = &unk_1E56D8388;
    id v11 = v9;
    id v18 = v11;
    id v12 = a3;
    id v13 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v17];
    id v14 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v13];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke_2;
    v15[3] = &unk_1E56D9528;
    void v15[4] = self;
    id v16 = v11;
    [v14 updateDiscoveryItemWithIdentifier:v12 forAction:a4 completion:v15];
  }
}

uint64_t __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)discoveryItemsWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    id v8 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D90B0;
    void v10[4] = self;
    id v11 = v7;
    [v9 discoveryItemsWithCompletion:v10];
  }
}

uint64_t __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke;
    v18[3] = &unk_1E56D8388;
    id v11 = v9;
    id v19 = v11;
    id v12 = a4;
    id v13 = a3;
    id v14 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v18];
    uint64_t v15 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v14];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke_2;
    v16[3] = &unk_1E56D9528;
    v16[4] = self;
    id v17 = v11;
    [v15 insertDiscoveryItems:v13 discoveryArticleLayouts:v12 completion:v16];
  }
}

uint64_t __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  id v7 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v6];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PKDiscoveryService_displayedDiscoveryEngagementMessageWithIdentifier___block_invoke;
  v8[3] = &unk_1E56DB8E8;
  void v8[4] = self;
  [v7 displayedDiscoveryEngagementMessageWithIdentifier:v5 completion:v8];
}

void __72__PKDiscoveryService_displayedDiscoveryEngagementMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PKDiscoveryService_displayedDiscoveryEngagementMessageWithIdentifier___block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __72__PKDiscoveryService_displayedDiscoveryEngagementMessageWithIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in displayedDiscoveryEngagementMessageWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v15 = a3;
  id v16 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  id v17 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v16];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __142__PKDiscoveryService_displayedDiscoveryItemWithIdentifier_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke;
  v18[3] = &unk_1E56DB8E8;
  void v18[4] = self;
  [v17 displayedDiscoveryItemWithIdentifier:v15 isWelcomeCard:v12 afterSwipingToCard:v11 multipleStoryCardsAvailable:v10 callToAction:a7 cardSize:a8 completion:v18];
}

void __142__PKDiscoveryService_displayedDiscoveryItemWithIdentifier_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __142__PKDiscoveryService_displayedDiscoveryItemWithIdentifier_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __142__PKDiscoveryService_displayedDiscoveryItemWithIdentifier_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in displayedDiscoveryEngagementMessageWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  id v15 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v14];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __127__PKDiscoveryService_expandedDiscoveryItemWithIdentifier_callToAction_afterSwipingToCard_multipleStoryCardsAvailable_cardSize___block_invoke;
  v16[3] = &unk_1E56DB8E8;
  v16[4] = self;
  [v15 expandedDiscoveryItemWithIdentifier:v13 callToAction:a4 afterSwipingToCard:v9 multipleStoryCardsAvailable:v8 cardSize:a7 completion:v16];
}

void __127__PKDiscoveryService_expandedDiscoveryItemWithIdentifier_callToAction_afterSwipingToCard_multipleStoryCardsAvailable_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __127__PKDiscoveryService_expandedDiscoveryItemWithIdentifier_callToAction_afterSwipingToCard_multipleStoryCardsAvailable_cardSize___block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __127__PKDiscoveryService_expandedDiscoveryItemWithIdentifier_callToAction_afterSwipingToCard_multipleStoryCardsAvailable_cardSize___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in expandedDiscoveryItemWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5
{
  id v9 = a3;
  uint64_t v10 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  BOOL v11 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v10];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PKDiscoveryService_dismissedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke;
  v12[3] = &unk_1E56DB8E8;
  void v12[4] = self;
  [v11 dismissedDiscoveryItemWithIdentifier:v9 callToAction:a4 cardSize:a5 completion:v12];
}

void __81__PKDiscoveryService_dismissedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PKDiscoveryService_dismissedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __81__PKDiscoveryService_dismissedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in dismissedDiscoveryItemWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)removedAllDiscoveryItems
{
  int v3 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  uint64_t v4 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v3];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PKDiscoveryService_removedAllDiscoveryItems__block_invoke;
  v5[3] = &unk_1E56DB8E8;
  v5[4] = self;
  [v4 removedAllDiscoveryItemsWithCompletion:v5];
}

void __46__PKDiscoveryService_removedAllDiscoveryItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PKDiscoveryService_removedAllDiscoveryItems__block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __46__PKDiscoveryService_removedAllDiscoveryItems__block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in removedAllDiscoveryItems: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)tappedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5
{
  id v9 = a3;
  uint64_t v10 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  BOOL v11 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v10];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__PKDiscoveryService_tappedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke;
  v12[3] = &unk_1E56DB8E8;
  void v12[4] = self;
  [v11 tappedDiscoveryItemCTA:a4 itemIdentifier:v9 cardSize:a5 completion:v12];
}

void __78__PKDiscoveryService_tappedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PKDiscoveryService_tappedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __78__PKDiscoveryService_tappedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in tappedDiscoveryItemCTA: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)completedDiscoveryItemCTAWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  id v7 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PKDiscoveryService_completedDiscoveryItemCTAWithCompletion___block_invoke;
  v9[3] = &unk_1E56D9528;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 completedDiscoveryItemCTAWithCompletion:v9];
}

void __62__PKDiscoveryService_completedDiscoveryItemCTAWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__PKDiscoveryService_completedDiscoveryItemCTAWithCompletion___block_invoke_2;
  v8[3] = &unk_1E56DEAA8;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v13 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __62__PKDiscoveryService_completedDiscoveryItemCTAWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = v2;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Error in completedDiscoveryItemCTA: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4
{
  id v7 = a3;
  id v8 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  id v9 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PKDiscoveryService_discoveryItemWithIdentifier_launchedWithReferralSource___block_invoke;
  v10[3] = &unk_1E56DB8E8;
  void v10[4] = self;
  [v9 discoveryItemWithIdentifier:v7 launchedWithReferralSource:a4 completion:v10];
}

void __77__PKDiscoveryService_discoveryItemWithIdentifier_launchedWithReferralSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PKDiscoveryService_discoveryItemWithIdentifier_launchedWithReferralSource___block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __77__PKDiscoveryService_discoveryItemWithIdentifier_launchedWithReferralSource___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in displayedDiscoveryEngagementMessageWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  uint64_t v10 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  id v11 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v10];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_isScrollable___block_invoke;
  v12[3] = &unk_1E56DB8E8;
  void v12[4] = self;
  [v11 discoveryItemWithIdentifier:v9 callToAction:a4 isScrollable:v5 completion:v12];
}

void __76__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_isScrollable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_isScrollable___block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __76__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_isScrollable___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in discoveryItemWithIdentifier:callToAction:isScrollable %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  uint64_t v10 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  id v11 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v10];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_wasScrolledToTheBottom___block_invoke;
  v12[3] = &unk_1E56DB8E8;
  void v12[4] = self;
  [v11 discoveryItemWithIdentifier:v9 callToAction:a4 wasScrolledToTheBottom:v5 completion:v12];
}

void __86__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_wasScrolledToTheBottom___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_wasScrolledToTheBottom___block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __86__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_wasScrolledToTheBottom___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in discoveryItemWithIdentifier:callToAction:wasScrolledToTheBottom: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)endReporingDiscoveryAnalytics
{
  int v3 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:0];
  uint64_t v4 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v3];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PKDiscoveryService_endReporingDiscoveryAnalytics__block_invoke;
  v5[3] = &unk_1E56DB8E8;
  v5[4] = self;
  [v4 endReportingDiscoveryAnalyticsCompletion:v5];
}

void __51__PKDiscoveryService_endReporingDiscoveryAnalytics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PKDiscoveryService_endReporingDiscoveryAnalytics__block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __51__PKDiscoveryService_endReporingDiscoveryAnalytics__block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in beginReporingDiscoveryAnalytics: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (int64_t)welcomeCardCount
{
  uint64_t v2 = +[PKPassLibrary sharedInstance];
  if (PKSecureElementIsAvailable())
  {
    int v3 = +[PKPaymentWebService sharedService];
    if (+[PKPaymentRegistrationUtilities _isPaymentSetupSupportedForWebService:v3])
    {
      BOOL v4 = +[PKSecureElement isInFailForward];

      if (!v4)
      {
        uint64_t v5 = [v2 hasPassesOfType:1] ^ 1;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v5 = 0;
LABEL_7:
  char v6 = [v2 hasPassesOfType:0];
  BOOL v7 = 0;
  if ((v6 & 1) == 0) {
    BOOL v7 = !PKBarcodePassWelcomeCardDismissed();
  }
  int64_t v8 = v7 + v5;

  return v8;
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (id)observers
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  BOOL v4 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  id v5 = (void *)[v4 copy];

  return v5;
}

- (void)discoveryArticleLayoutsUpdated:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(PKDiscoveryService *)self observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 discoveryService:self receivedUpdatedDiscoveryArticleLayouts:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)completedCTAForItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(PKDiscoveryService *)self observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 discoveryService:self completedCTAForItem:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)dialogRequestsChangedForPlacement:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(PKDiscoveryService *)self observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 discoveryService:self dialogRequestsChangedForPlacement:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)discoveryEngagementMessagesUpdated
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v3 = [(PKDiscoveryService *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 discoveryServiceDidReceiveUpdatedDiscoveryEngagementMessages:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

uint64_t __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  uint64_t v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke;
    v17[3] = &unk_1E56D8388;
    id v11 = v9;
    id v18 = v11;
    id v12 = a3;
    long long v13 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v17];
    id v14 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v13];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke_2;
    v15[3] = &unk_1E56D90B0;
    void v15[4] = self;
    id v16 = v11;
    [v14 discoveryEngagementMessagesForPassUniqueIdentifier:v12 active:a4 completion:v15];
  }
}

uint64_t __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke_2;
    v13[3] = &unk_1E56D90B0;
    v13[4] = self;
    id v14 = v9;
    [v12 dialogRequestsForPlacement:v10 completion:v13];
  }
}

uint64_t __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 dismissDialogRequestWithIdentifier:v12 forPlacement:v11 completion:v16];
}

uint64_t __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke;
    v17[3] = &unk_1E56D8388;
    id v11 = v9;
    id v18 = v11;
    id v12 = a3;
    id v13 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v17];
    id v14 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v13];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke_2;
    v15[3] = &unk_1E56D9528;
    void v15[4] = self;
    id v16 = v11;
    [v14 updateDiscoveryEngagementMessageWithIdentifier:v12 forAction:a4 completion:v15];
  }
}

uint64_t __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    uint64_t v11 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke_2;
    v13[3] = &unk_1E56D9528;
    v13[4] = self;
    id v14 = v9;
    [v12 insertDiscoveryEngagementMessages:v10 completion:v13];
  }
}

uint64_t __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    uint64_t v11 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E56D9528;
    v13[4] = self;
    id v14 = v9;
    [v12 removeDiscoveryMessageWithIdentifier:v10 completion:v13];
  }
}

uint64_t __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)rulesWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__PKDiscoveryService_rulesWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    id v8 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__PKDiscoveryService_rulesWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56E9380;
    void v10[4] = self;
    id v11 = v7;
    [v9 rulesWithCompletion:v10];
  }
}

uint64_t __42__PKDiscoveryService_rulesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__PKDiscoveryService_rulesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__PKDiscoveryService_rulesWithCompletion___block_invoke_3;
  v12[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v8;
  id v13 = v5;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __42__PKDiscoveryService_rulesWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)insertRule:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__PKDiscoveryService_insertRule_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__PKDiscoveryService_insertRule_completion___block_invoke_2;
    v13[3] = &unk_1E56D9528;
    v13[4] = self;
    id v14 = v9;
    [v12 insertRule:v10 completion:v13];
  }
}

uint64_t __44__PKDiscoveryService_insertRule_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__PKDiscoveryService_insertRule_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PKDiscoveryService_insertRule_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __44__PKDiscoveryService_insertRule_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)deleteRuleWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    uint64_t v11 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E56D9528;
    v13[4] = self;
    id v14 = v9;
    [v12 deleteRuleWithIdentifier:v10 completion:v13];
  }
}

uint64_t __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    uint64_t v11 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke_2;
    v13[3] = &unk_1E56D8450;
    v13[4] = self;
    id v14 = v9;
    [v12 evaluateRulesWithIdentifiers:v10 completion:v13];
  }
}

uint64_t __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke_3;
  v12[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v8;
  id v13 = v5;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    id v8 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D9528;
    void v10[4] = self;
    id v11 = v7;
    [v9 removeDiscoveryUserNotificationsWithCompletion:v10];
  }
}

uint64_t __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke_3;
  v8[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v5;
  id v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke_2;
    v13[3] = &unk_1E56D9528;
    v13[4] = self;
    id v14 = v9;
    [v12 fireEngagementEventNamed:v10 completion:v13];
  }
}

uint64_t __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke_3;
  v8[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v5;
  id v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke;
    v18[3] = &unk_1E56D8388;
    id v11 = v9;
    id v19 = v11;
    id v12 = a4;
    id v13 = a3;
    id v14 = [(PKDiscoveryService *)self errorHandlerForMethod:a2 completion:v18];
    id v15 = [(PKDiscoveryService *)self _remoteObjectProxyWithErrorHandler:v14];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke_2;
    v16[3] = &unk_1E56D8450;
    v16[4] = self;
    id v17 = v11;
    [v15 fetchUserProperties:v13 withParameters:v12 completion:v16];
  }
}

uint64_t __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke_3;
  v12[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v8;
  id v13 = v5;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end