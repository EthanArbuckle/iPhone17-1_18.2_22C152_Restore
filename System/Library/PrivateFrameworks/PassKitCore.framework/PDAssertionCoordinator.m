@interface PDAssertionCoordinator
+ (id)suppressionApplicationRegistry;
- (BOOL)hasAssertionsOfType:(unint64_t)a3;
- (BOOL)isForegroundApplication;
- (NSString)bundleIdentifier;
- (NSString)description;
- (PDAssertionCoordinator)initWithConnection:(id)a3;
- (PDAssertionCoordinatorDelegate)delegate;
- (id)assertionsOfType:(unint64_t)a3;
- (void)_acquireAssertion:(id)a3 handler:(id)a4;
- (void)_acquireContactlessInterfaceSuppressionAssertion:(id)a3 handler:(id)a4;
- (void)_addRequestForAssertion:(id)a3 handler:(id)a4;
- (void)_cancelPendingAssertionRequest:(id)a3;
- (void)_processPendingAssertionRequests;
- (void)_showAlertForContactlessInterfaceSuppression;
- (void)acquireAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 reason:(id)a5 handler:(id)a6;
- (void)assertionOfType:(unint64_t)a3 withIdentifier:(id)a4 isValid:(id)a5;
- (void)assertionOfType:(unint64_t)a3 withIdentifier:(id)a4 shouldInvalidateWhenBackgrounded:(BOOL)a5;
- (void)assertionRequestDidTimeout:(id)a3;
- (void)cancelPendingAssertionRequests;
- (void)hasValidAssertionOfType:(unint64_t)a3 completion:(id)a4;
- (void)invalidateAllAssertions;
- (void)invalidateAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 handler:(id)a5;
- (void)invalidateAssertionsForBackgroundApplicationState;
- (void)processPendingAssertionRequests;
- (void)setBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsForegroundApplication:(BOOL)a3;
@end

@implementation PDAssertionCoordinator

+ (id)suppressionApplicationRegistry
{
  if (qword_1E92D9BB8 != -1) {
    dispatch_once(&qword_1E92D9BB8, &__block_literal_global_193);
  }
  v2 = (void *)_MergedGlobals_7;
  return v2;
}

void __56__PDAssertionCoordinator_suppressionApplicationRegistry__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = PKHomeDirectoryPath();
  v2 = [v1 stringByAppendingPathComponent:@"SuppressionApplicationRegistry.archive"];
  id v5 = [v0 fileURLWithPath:v2];

  v3 = [[PKApplicationRegistry alloc] initWithArchiveFileURL:v5];
  v4 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v3;
}

- (PDAssertionCoordinator)initWithConnection:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PDAssertionCoordinator;
  id v5 = [(PDXPCService *)&v16 initWithConnection:v4];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assertionsByType = v5->_assertionsByType;
    v5->_assertionsByType = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingAssertionRequests = v5->_pendingAssertionRequests;
    v5->_pendingAssertionRequests = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.passd.assertioncoordinator", v10);
    coordinatorSerialQueue = v5->_coordinatorSerialQueue;
    v5->_coordinatorSerialQueue = (OS_dispatch_queue *)v11;

    v13 = [[PKEntitlementWhitelist alloc] initWithConnection:v4];
    whitelist = v5->_whitelist;
    v5->_whitelist = v13;

    v5->_suppressionPermissionState = -1;
    v5->_isForegroundApplication = 1;
  }
  return v5;
}

- (void)acquireAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 reason:(id)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    coordinatorSerialQueue = self->_coordinatorSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__PDAssertionCoordinator_acquireAssertionOfType_withIdentifier_reason_handler___block_invoke;
    block[3] = &unk_1E56E43A8;
    unint64_t v19 = a3;
    id v15 = v10;
    id v16 = v11;
    v17 = self;
    id v18 = v12;
    dispatch_async(coordinatorSerialQueue, block);
  }
}

void __79__PDAssertionCoordinator_acquireAssertionOfType_withIdentifier_reason_handler___block_invoke(uint64_t a1)
{
  v2 = [[PDAssertion alloc] initWithType:*(void *)(a1 + 64) identifier:*(void *)(a1 + 32) reason:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _addRequestForAssertion:v2 handler:*(void *)(a1 + 56)];
  [*(id *)(a1 + 48) _processPendingAssertionRequests];
}

- (void)invalidateAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PDAssertionCoordinator_invalidateAssertionOfType_withIdentifier_handler___block_invoke;
  v13[3] = &unk_1E56D8A40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(coordinatorSerialQueue, v13);
}

void __75__PDAssertionCoordinator_invalidateAssertionOfType_withIdentifier_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  id v9 = [v2 objectForKeyedSubscript:v3];

  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier == %@", *(void *)(a1 + 40)];
  id v5 = [v9 filteredArrayUsingPredicate:v4];
  v6 = [v5 firstObject];

  if (v6)
  {
    [v9 removeObject:v6];
    v7 = [*(id *)(a1 + 32) delegate];
    [v7 assertionCoordinator:*(void *)(a1 + 32) didInvalidateAssertion:v6];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (void)assertionOfType:(unint64_t)a3 withIdentifier:(id)a4 shouldInvalidateWhenBackgrounded:(BOOL)a5
{
  id v8 = a4;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PDAssertionCoordinator_assertionOfType_withIdentifier_shouldInvalidateWhenBackgrounded___block_invoke;
  v11[3] = &unk_1E56F25E0;
  id v12 = v8;
  unint64_t v13 = a3;
  v11[4] = self;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(coordinatorSerialQueue, v11);
}

void __90__PDAssertionCoordinator_assertionOfType_withIdentifier_shouldInvalidateWhenBackgrounded___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__PDAssertionCoordinator_assertionOfType_withIdentifier_shouldInvalidateWhenBackgrounded___block_invoke_2;
  v5[3] = &unk_1E56F25B8;
  id v6 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 56);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __90__PDAssertionCoordinator_assertionOfType_withIdentifier_shouldInvalidateWhenBackgrounded___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  char v7 = *(void **)(a1 + 32);
  id v12 = v6;
  id v8 = [v6 identifier];
  id v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {

    if (v7 != v9) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  char v11 = [v7 isEqual:v8];

  if (v11)
  {
LABEL_9:
    [v12 setInvalidateWhenBackgrounded:*(unsigned __int8 *)(a1 + 40)];
    *a4 = 1;
  }
LABEL_10:
}

- (void)assertionOfType:(unint64_t)a3 withIdentifier:(id)a4 isValid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PDAssertionCoordinator_assertionOfType_withIdentifier_isValid___block_invoke;
  v13[3] = &unk_1E56D8A40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(coordinatorSerialQueue, v13);
}

void __65__PDAssertionCoordinator_assertionOfType_withIdentifier_isValid___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 48);
  v3 = [NSNumber numberWithUnsignedInteger:a1[7]];
  id v8 = [v2 objectForKeyedSubscript:v3];

  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier == %@", a1[5]];
  id v5 = [v8 filteredArrayUsingPredicate:v4];
  id v6 = [v5 firstObject];

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v6 != 0);
  }
}

- (void)hasValidAssertionOfType:(unint64_t)a3 completion:(id)a4
{
  id v8 = (void (**)(id, uint64_t))a4;
  id v6 = [(PDAssertionCoordinator *)self delegate];
  uint64_t v7 = [v6 assertionCoordinator:self assertionExistsOfType:a3];

  v8[2](v8, v7);
}

- (void)_showAlertForContactlessInterfaceSuppression
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = PDLocalizedAppNameForBundleIDOrPID(self->_bundleIdentifier, [(PDXPCService *)self remoteProcessIdentifier]);
  v3 = PKLocalizedPaymentString(&cfstr_ContactlessInt.isa, &stru_1EE0F6808.isa, v2);
  uint64_t v4 = *MEMORY[0x1E4F1D990];
  v9[0] = v3;
  uint64_t v5 = *MEMORY[0x1E4F1D9E0];
  v8[0] = v4;
  v8[1] = v5;
  id v6 = PKLocalizedPaymentString(&cfstr_ContactlessInt_0.isa, 0);
  v9[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  +[PKUserNotificationAgent presentNotificationWithParameters:v7 responseHandler:0];
}

- (void)_acquireContactlessInterfaceSuppressionAssertion:(id)a3 handler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  int64_t suppressionPermissionState = self->_suppressionPermissionState;
  if (suppressionPermissionState == 1)
  {
    [(PDAssertionCoordinator *)self _acquireAssertion:v6 handler:v7];
  }
  else if (suppressionPermissionState)
  {
    if (suppressionPermissionState == -1)
    {
      BOOL v10 = +[PDAssertionCoordinator suppressionApplicationRegistry];
      if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
        || [(PKEntitlementWhitelist *)self->_whitelist paymentPresentation]
        || [(PKEntitlementWhitelist *)self->_whitelist passPresentationSuppression])
      {
        if ([v10 applicationIsRegisteredWithBundleIdentifier:self->_bundleIdentifier])
        {
LABEL_10:
          self->_int64_t suppressionPermissionState = 1;
          [(PDAssertionCoordinator *)self _acquireAssertion:v6 handler:v8];
LABEL_17:

          goto LABEL_18;
        }
        if ([v10 registerApplicationWithBundleIdentifier:self->_bundleIdentifier])
        {
          [(PDAssertionCoordinator *)self _showAlertForContactlessInterfaceSuppression];
          goto LABEL_10;
        }
      }
      else
      {
        id v11 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          bundleIdentifier = self->_bundleIdentifier;
          int v13 = 138412546;
          id v14 = bundleIdentifier;
          __int16 v15 = 1024;
          int v16 = [(PDXPCService *)self remoteProcessIdentifier];
          _os_log_error_impl(&dword_190E10000, v11, OS_LOG_TYPE_ERROR, "Application (%@:%d) is missing entitlement for contactless interface suppression.", (uint8_t *)&v13, 0x12u);
        }
      }
      self->_int64_t suppressionPermissionState = 0;
      v8[2](v8, 0);
      goto LABEL_17;
    }
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_18:
}

- (void)_acquireAssertion:(id)a3 handler:(id)a4
{
  id v22 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  id v7 = [(PDAssertionCoordinator *)self delegate];
  int v8 = [v7 assertionCoordinator:self canAcquireAssertion:v22];

  if (v8)
  {
    uint64_t v9 = [v22 type];
    assertionsByType = self->_assertionsByType;
    id v11 = [NSNumber numberWithUnsignedInteger:v9];
    id v12 = [(NSMutableDictionary *)assertionsByType objectForKeyedSubscript:v11];

    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v13 = self->_assertionsByType;
      id v14 = [NSNumber numberWithUnsignedInteger:v9];
      [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
    }
    __int16 v15 = (void *)MEMORY[0x1E4F28F60];
    int v16 = [v22 identifier];
    uint64_t v17 = [v15 predicateWithFormat:@"identifier == %@", v16];

    id v18 = [v12 filteredArrayUsingPredicate:v17];
    unint64_t v19 = [v18 firstObject];

    BOOL v20 = v19 == 0;
    if (!v19)
    {
      [v12 addObject:v22];
      v21 = [(PDAssertionCoordinator *)self delegate];
      [v21 assertionCoordinator:self didAcquireAssertion:v22];
    }
  }
  else
  {
    BOOL v20 = 0;
  }
  v6[2](v6, v20);
}

- (void)_addRequestForAssertion:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [[PDAssertionRequest alloc] initWithAssertion:v7 delegate:self resultHandler:v6];

  [(NSMutableArray *)self->_pendingAssertionRequests addObject:v8];
}

- (void)_cancelPendingAssertionRequest:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  pendingAssertionRequests = self->_pendingAssertionRequests;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __57__PDAssertionCoordinator__cancelPendingAssertionRequest___block_invoke;
  BOOL v10 = &unk_1E56F2608;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [(NSMutableArray *)pendingAssertionRequests enumerateObjectsUsingBlock:&v7];
  if (v14[3] != 0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableArray removeObjectAtIndex:](self->_pendingAssertionRequests, "removeObjectAtIndex:", v7, v8, v9, v10);
  }

  _Block_object_dispose(&v13, 8);
}

void __57__PDAssertionCoordinator__cancelPendingAssertionRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void **)(a1 + 32) == a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    uint64_t v5 = [a2 resultHandler];
    if (v5)
    {
      id v6 = v5;
      v5[2](v5, 0);
      uint64_t v5 = (void (**)(void, void))v6;
    }
    *a4 = 1;
  }
}

- (void)_processPendingAssertionRequests
{
  v3 = (void *)[(NSMutableArray *)self->_pendingAssertionRequests copy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PDAssertionCoordinator__processPendingAssertionRequests__block_invoke;
  v4[3] = &unk_1E56F2630;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __58__PDAssertionCoordinator__processPendingAssertionRequests__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [v9 assertion];
  uint64_t v4 = [v3 type];
  uint64_t v5 = [v9 resultHandler];
  int v6 = [*(id *)(*(void *)(a1 + 32) + 64) passPresentationSuppressionFromBackground];
  uint64_t v7 = *(unsigned char **)(a1 + 32);
  if (v7[88]) {
    goto LABEL_8;
  }
  if (v4) {
    BOOL v8 = v4 == 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    int v6 = 1;
  }
  if (v6 == 1)
  {
LABEL_8:
    if (v4 == 5) {
      [v7 _acquireContactlessInterfaceSuppressionAssertion:v3 handler:v5];
    }
    else {
      [v7 _acquireAssertion:v3 handler:v5];
    }
    [*(id *)(*(void *)(a1 + 32) + 80) removeObject:v9];
  }
}

- (void)assertionRequestDidTimeout:(id)a3
{
  id v4 = a3;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PDAssertionCoordinator_assertionRequestDidTimeout___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(coordinatorSerialQueue, v7);
}

uint64_t __53__PDAssertionCoordinator_assertionRequestDidTimeout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelPendingAssertionRequest:*(void *)(a1 + 40)];
}

- (void)invalidateAllAssertions
{
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_sync(coordinatorSerialQueue, block);
}

void __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FDC630]();
  v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke_2;
  v6[3] = &unk_1E56F2680;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
}

void __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke_3;
  v5[3] = &unk_1E56F2658;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a3 enumerateObjectsUsingBlock:v5];
}

void __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 assertionCoordinator:*(void *)(a1 + 32) didInvalidateAssertion:v4];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 identifier];

  [v6 addObject:v7];
}

- (void)invalidateAssertionsForBackgroundApplicationState
{
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(coordinatorSerialQueue, block);
}

void __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke_2;
  v5[3] = &unk_1E56F2680;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke_3;
  v13[3] = &unk_1E56F26A8;
  id v9 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  [v6 enumerateObjectsUsingBlock:v13];

  uint64_t v11 = [v10 count];
  id v12 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v11) {
    [v12 setObject:v10 forKey:v7];
  }
  else {
    [v12 removeObjectForKey:v7];
  }
}

void __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 invalidateWhenBackgrounded])
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 assertionCoordinator:*(void *)(a1 + 32) didInvalidateAssertion:v6];

    id v4 = *(void **)(a1 + 40);
    id v5 = [v6 identifier];
    [v4 addObject:v5];
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

- (id)assertionsOfType:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__72;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  uint64_t v11 = __Block_byref_object_dispose__72;
  id v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PDAssertionCoordinator_assertionsOfType___block_invoke;
  block[3] = &unk_1E56F26D0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(coordinatorSerialQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __43__PDAssertionCoordinator_assertionsOfType___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 48);
  id v7 = [NSNumber numberWithUnsignedInteger:a1[6]];
  id v3 = [v2 objectForKeyedSubscript:v7];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)hasAssertionsOfType:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PDAssertionCoordinator_hasAssertionsOfType___block_invoke;
  block[3] = &unk_1E56F26D0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(coordinatorSerialQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __46__PDAssertionCoordinator_hasAssertionsOfType___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 48);
  id v4 = [NSNumber numberWithUnsignedInteger:a1[6]];
  id v3 = [v2 objectForKeyedSubscript:v4];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v3 count] != 0;
}

- (void)processPendingAssertionRequests
{
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PDAssertionCoordinator_processPendingAssertionRequests__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(coordinatorSerialQueue, block);
}

uint64_t __57__PDAssertionCoordinator_processPendingAssertionRequests__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPendingAssertionRequests];
}

- (void)cancelPendingAssertionRequests
{
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PDAssertionCoordinator_cancelPendingAssertionRequests__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(coordinatorSerialQueue, block);
}

void __56__PDAssertionCoordinator_cancelPendingAssertionRequests__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 80) copy];
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_74_0];
}

void __56__PDAssertionCoordinator_cancelPendingAssertionRequests__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 resultHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, 0);
    id v2 = (void (**)(void, void))v3;
  }
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"bundle: %@, ", self->_bundleIdentifier];
  [v3 appendFormat:@"pid: %d, ", -[PDXPCService remoteProcessIdentifier](self, "remoteProcessIdentifier")];
  if (self->_isForegroundApplication) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  [v3 appendFormat:@"isForegroundApplication: %@>", v4];
  uint64_t v5 = (void *)[v3 copy];

  return (NSString *)v5;
}

- (PDAssertionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDAssertionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)isForegroundApplication
{
  return self->_isForegroundApplication;
}

- (void)setIsForegroundApplication:(BOOL)a3
{
  self->_isForegroundApplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingAssertionRequests, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_coordinatorSerialQueue, 0);
  objc_storeStrong((id *)&self->_assertionsByType, 0);
}

@end