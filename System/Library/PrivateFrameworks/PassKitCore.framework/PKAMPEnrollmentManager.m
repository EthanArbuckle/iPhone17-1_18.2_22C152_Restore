@interface PKAMPEnrollmentManager
+ (id)sharedManager;
- (BOOL)shouldOfferAMPEnrollmentForPaymentPass:(id)a3;
- (PKAMPEnrollmentManager)init;
- (id)_bag;
- (id)performCanEnrollPaymentPass:(id)a3;
- (id)performEnrollPaymentPass:(id)a3 isDefault:(BOOL)a4;
- (void)_accessObserversWithHandler:(id)a3;
- (void)canEnrollPaymentPass:(id)a3 completion:(id)a4;
- (void)enrollPaymentPass:(id)a3 isDefault:(BOOL)a4 completion:(id)a5;
- (void)enrollmentStatusForPaymentPass:(id)a3 completion:(id)a4 progress:(id)a5;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PKAMPEnrollmentManager

+ (id)sharedManager
{
  if (_MergedGlobals_226 != -1) {
    dispatch_once(&_MergedGlobals_226, &__block_literal_global_91);
  }
  v2 = (void *)qword_1EB402E08;
  return v2;
}

void __39__PKAMPEnrollmentManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(PKAMPEnrollmentManager);
  v1 = (void *)qword_1EB402E08;
  qword_1EB402E08 = (uint64_t)v0;
}

- (PKAMPEnrollmentManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)PKAMPEnrollmentManager;
  v2 = [(PKAMPEnrollmentManager *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(PKInAppPaymentService);
    service = v2->_service;
    v2->_service = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    promiseMap = v2->_promiseMap;
    v2->_promiseMap = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.PassKit.PKAMPEnrollmentManager.internal", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.PassKit.PKAMPEnrollmentManager.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v11;

    v2->_lockObservers._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)enrollmentStatusForPaymentPass:(id)a3 completion:(id)a4 progress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke;
  v15[3] = &unk_1E56E5A18;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3 = [*(id *)(a1 + 40) uniqueID];
  v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_4;
    v11[3] = &unk_1E56D8B08;
    dispatch_queue_t v7 = &v12;
    id v12 = *(id *)(a1 + 48);
    [v9 canEnrollPaymentPass:v10 completion:v11];
    goto LABEL_5;
  }
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_2;
    block[3] = &unk_1E56D8360;
    dispatch_queue_t v7 = &v16;
    id v16 = v5;
    dispatch_async(v6, block);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_3;
    v13[3] = &unk_1E56DB780;
    id v14 = *(id *)(a1 + 56);
    objc_msgSend(v4, "pk_addQueue:finishBlock:", v8, v13);

LABEL_5:
  }
}

uint64_t __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = [v9 BOOLValue];
    if (v5)
    {
      uint64_t v8 = _EnrollmentErrorWithUnderlyingError(v5);
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, v7, 0);
    }
  }
}

void __77__PKAMPEnrollmentManager_enrollmentStatusForPaymentPass_completion_progress___block_invoke_4(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v8 = v5;
    if (v5)
    {
      uint64_t v7 = _EnrollmentErrorWithUnderlyingError(v5);
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, a2, 0);
    }
    id v5 = v8;
  }
}

- (void)canEnrollPaymentPass:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PKAMPEnrollmentManager *)self performCanEnrollPaymentPass:a3];
  if (v7)
  {
    callbackQueue = self->_callbackQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__PKAMPEnrollmentManager_canEnrollPaymentPass_completion___block_invoke;
    v13[3] = &unk_1E56DB780;
    id v9 = &v14;
    id v14 = v6;
    objc_msgSend(v7, "pk_addQueue:finishBlock:", callbackQueue, v13);
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    uint64_t v10 = self->_callbackQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PKAMPEnrollmentManager_canEnrollPaymentPass_completion___block_invoke_2;
    v11[3] = &unk_1E56D8360;
    id v9 = &v12;
    id v12 = v6;
    dispatch_async(v10, v11);
    goto LABEL_5;
  }
LABEL_6:
}

void __58__PKAMPEnrollmentManager_canEnrollPaymentPass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = [v9 BOOLValue];
    if (v5)
    {
      id v8 = _EnrollmentErrorWithUnderlyingError(v5);
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, v7, 0);
    }
  }
}

void __58__PKAMPEnrollmentManager_canEnrollPaymentPass_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)performCanEnrollPaymentPass:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4DC10];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(PKAMPEnrollmentManager *)self _bag];
  id v8 = [v5 issuerCountryCode];
  id v9 = (void *)[v6 initWithBag:v7 countryCode:v8];

  uint64_t v10 = [v5 passTypeIdentifier];
  uint64_t v11 = [v5 serialNumber];

  id v12 = [v9 performCanWriteBillingInfoQueryWithPassTypeIdentifier:v10 serialNumber:v11];

  if (v12)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__PKAMPEnrollmentManager_performCanEnrollPaymentPass___block_invoke;
    v14[3] = &unk_1E56E5A40;
    id v15 = v9;
    [v12 addFinishBlock:v14];
  }
  return v12;
}

- (void)enrollPaymentPass:(id)a3 isDefault:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke;
  v13[3] = &unk_1E56D8BD0;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) performEnrollPaymentPass:*(void *)(a1 + 40) isDefault:*(unsigned __int8 *)(a1 + 56)];
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_2;
    v15[3] = &unk_1E56E5A90;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v17 = v4;
    v15[4] = v5;
    id v16 = v6;
    objc_msgSend(v2, "pk_addQueue:finishBlock:", v3, v15);

    uint64_t v7 = v17;
  }
  else
  {
    id v8 = *(void **)(a1 + 48);
    if (v8)
    {
      id v9 = *(NSObject **)(*(void *)(a1 + 32) + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_4;
      block[3] = &unk_1E56D8360;
      id v14 = v8;
      dispatch_async(v9, block);
    }
    uint64_t v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_5;
    v11[3] = &unk_1E56E5AB8;
    void v11[4] = v10;
    id v12 = *(id *)(a1 + 40);
    [v10 _accessObserversWithHandler:v11];
    uint64_t v7 = v12;
  }
}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 BOOLValue];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8)
  {
    uint64_t v9 = [v5 BOOLValue];
    if (v6)
    {
      uint64_t v10 = _EnrollmentErrorWithUnderlyingError(v6);
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v9, v10);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, v9, 0);
    }
  }
  id v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_3;
  v12[3] = &unk_1E56E5A68;
  v12[4] = v11;
  id v13 = *(id *)(a1 + 40);
  char v14 = v7;
  [v11 _accessObserversWithHandler:v12];
}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 ampEnrollmentManager:*(void *)(a1 + 32) didEnrollPaymentPass:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 48)];
  }
}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __65__PKAMPEnrollmentManager_enrollPaymentPass_isDefault_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 ampEnrollmentManager:*(void *)(a1 + 32) didEnrollPaymentPass:*(void *)(a1 + 40) success:0];
  }
}

- (BOOL)shouldOfferAMPEnrollmentForPaymentPass:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)([v4 cardType] - 2) > 2)
  {
    uint64_t v8 = [v4 devicePrimaryInAppPaymentApplication];
    unint64_t v9 = [v8 paymentNetworkIdentifier];

    if (v9 - 103 <= 0x23 && ((1 << (v9 - 103)) & 0xF5F087CF1) != 0
      || v9 <= 0x1A && ((1 << v9) & 0x7400000) != 0
      || v9 == 301)
    {
      id v5 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v4 serialNumber];
        int v15 = 138412290;
        id v16 = v6;
        char v7 = "Not presenting AMP offer for pass: %@ as it is not a supported credential type";
        goto LABEL_8;
      }
    }
    else
    {
      unint64_t v11 = [v4 effectiveContactlessPaymentApplicationState];
      if (v11 > 0xF) {
        goto LABEL_11;
      }
      unint64_t v12 = v11;
      if (((1 << v11) & 0x7F9) == 0)
      {
        if (((1 << v11) & 0x8006) == 0) {
          goto LABEL_11;
        }
        id v5 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          char v14 = [v4 serialNumber];
          int v15 = 138412546;
          id v16 = v14;
          __int16 v17 = 2048;
          unint64_t v18 = v12;
          _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Presenting AMP offer for pass: %@ state is %lu and has been Personalized or Personalizing", (uint8_t *)&v15, 0x16u);
        }
        char v3 = 1;
        goto LABEL_10;
      }
      id v5 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v4 serialNumber];
        int v15 = 138412546;
        id v16 = v13;
        __int16 v17 = 2048;
        unint64_t v18 = v12;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Not presenting AMP offer for pass: %@ state is %lu and needs to be Personalized or Personalizing", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 serialNumber];
      int v15 = 138412290;
      id v16 = v6;
      char v7 = "Not presenting AMP offer for pass: %@ as it is not a valid card type";
LABEL_8:
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v15, 0xCu);
    }
  }
  char v3 = 0;
LABEL_10:

LABEL_11:
  return v3 & 1;
}

- (id)performEnrollPaymentPass:(id)a3 isDefault:(BOOL)a4
{
  id v6 = a3;
  promiseMap = self->_promiseMap;
  uint64_t v8 = [v6 uniqueID];
  id v9 = [(NSMutableDictionary *)promiseMap objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F4DDD0]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke;
    v24[3] = &unk_1E56E5AE0;
    v24[4] = self;
    id v11 = v6;
    id v25 = v11;
    [v10 addFinishBlock:v24];
    unint64_t v12 = self->_promiseMap;
    id v13 = [v11 uniqueID];
    [(NSMutableDictionary *)v12 setObject:v10 forKeyedSubscript:v13];

    char v14 = [(PKAMPEnrollmentManager *)self _bag];
    int v15 = (void *)MEMORY[0x1E4F4DC18];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_3;
    v18[3] = &unk_1E56E5B30;
    id v9 = v10;
    id v19 = v9;
    v20 = self;
    BOOL v23 = a4;
    id v21 = v11;
    id v22 = v14;
    id v16 = v14;
    [v15 paymentSessionWithBag:v16 completion:v18];
  }
  return v9;
}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_2;
  v3[3] = &unk_1E56D8A90;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = [*(id *)(a1 + 40) uniqueID];
  [v1 setObject:0 forKeyedSubscript:v2];
}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = [*(id *)(a1 + 32) completionHandlerAdapter];
  if (v6)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Failed to obtain merchant session: %@", buf, 0xCu);
    }

    ((void (**)(void, void, id))v7)[2](v7, 0, v6);
  }
  else
  {
    id v9 = *(void **)(*(void *)(a1 + 40) + 8);
    id v10 = [*(id *)(a1 + 48) uniqueID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_33;
    v11[3] = &unk_1E56E5B08;
    id v13 = v7;
    char v14 = *(unsigned char *)(a1 + 64);
    id v12 = *(id *)(a1 + 56);
    [v9 enrollPaymentPassWithUniqueIdentifier:v10 merchantSession:v5 completion:v11];
  }
}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_33(uint64_t a1, char a2, uint64_t a3)
{
  if (a2)
  {
    id v4 = (void *)MEMORY[0x1E4F4DC20];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_2_35;
    v9[3] = &unk_1E56D8B08;
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v4 verifyPayment:a3 isDefault:v5 bag:v6 completion:v9];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v8);
  }
}

void __61__PKAMPEnrollmentManager_performEnrollPaymentPass_isDefault___block_invoke_2_35(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v4 = NSNumber;
    id v5 = a3;
    id v7 = [v4 numberWithBool:1];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    uint64_t v6 = *(void (**)(uint64_t, void))(v3 + 16);
    id v7 = a3;
    v6(v3, 0);
  }
}

- (id)_bag
{
  return (id)[MEMORY[0x1E4F4DBD8] bagForProfile:@"Wallet" profileVersion:@"1"];
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
    callbackQueue = self->_callbackQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PKAMPEnrollmentManager__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(callbackQueue, v8);
  }
}

void __54__PKAMPEnrollmentManager__accessObserversWithHandler___block_invoke(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_promiseMap, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end