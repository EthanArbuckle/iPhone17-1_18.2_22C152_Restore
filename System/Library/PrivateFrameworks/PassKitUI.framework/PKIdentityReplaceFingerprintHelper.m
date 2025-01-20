@interface PKIdentityReplaceFingerprintHelper
- (BOOL)hasCachedEligibility;
- (BOOL)isEligibile;
- (PKIdentityReplaceFingerprintHelper)initWithPass:(id)a3 isRemote:(BOOL)a4;
- (void)isEligibleWithCompletion:(id)a3;
- (void)viewControllerWithCompletion:(id)a3;
@end

@implementation PKIdentityReplaceFingerprintHelper

- (PKIdentityReplaceFingerprintHelper)initWithPass:(id)a3 isRemote:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKIdentityReplaceFingerprintHelper;
  v8 = [(PKIdentityReplaceFingerprintHelper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pass, a3);
    v9->_isRemote = a4;
    v9->_loading = 0;
  }

  return v9;
}

- (BOOL)hasCachedEligibility
{
  return self->_loading == 2;
}

- (BOOL)isEligibile
{
  return self->_canReplace;
}

- (void)isEligibleWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKSecureElementPass *)self->_pass isIdentityPass]
    && ([MEMORY[0x1E4F88108] currentStateForPolicy:0] & 4) != 0
    && !self->_loading)
  {
    self->_loading = 1;
    v5 = [(PKSecureElementPass *)self->_pass devicePrimaryContactlessPaymentApplication];
    v6 = [v5 subcredentials];
    id v7 = [v6 anyObject];
    v8 = [v7 identifier];

    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F84518]);
      [v9 addOperation:&__block_literal_global_195];
      if (!self->_isRemote)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_12;
        v14[3] = &unk_1E59CFB08;
        id v15 = v8;
        [v9 addOperation:v14];
      }
      [v9 addOperation:&__block_literal_global_18];
      v10 = [MEMORY[0x1E4F1CA98] null];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_23;
      v12[3] = &unk_1E59DC720;
      v12[4] = self;
      id v13 = v4;
      id v11 = (id)[v9 evaluateWithInput:v10 completion:v12];
    }
    else
    {
      self->_loading = 2;
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
  else
  {
    self->_loading = 2;
    (*((void (**)(id, BOOL))v4 + 2))(v4, self->_canReplace);
  }
}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = a4;
  [(objc_class *)_MergedGlobals_667() availableDevices];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
      if ([v12 type] == 1) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v20 = 0;
    v14 = [(objc_class *)off_1EB5459D8() deviceWithDescriptor:v12 error:&v20];
    id v15 = v20;
    if (v15)
    {
      id v16 = v15;
      v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v16;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Could not get device with error %@", buf, 0xCu);
      }
    }
    else
    {
      id v19 = 0;
      v17 = [v14 identitiesWithError:&v19];
      id v16 = v19;
      if (!v16)
      {
        unint64_t v13 = [v17 count];
        goto LABEL_18;
      }
      v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v16;
        _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Could not get identities with error %@", buf, 0xCu);
      }
    }
    unint64_t v13 = 0;
LABEL_18:

    goto LABEL_19;
  }
LABEL_9:
  unint64_t v13 = 0;
LABEL_19:

  v6[2](v6, v5, v13 < 2);
}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_12(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F5C0F8]);
  v20[0] = *MEMORY[0x1E4F872A8];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v10 = (void *)[v8 initWithPartitions:v9];

  uint64_t v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2;
  v15[3] = &unk_1E59DC6D0;
  id v16 = v10;
  id v18 = v6;
  id v19 = v7;
  id v17 = v11;
  id v12 = v6;
  id v13 = v7;
  id v14 = v10;
  [v14 propertiesOfCredential:v17 completion:v15];
}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Could not fetch properties of credential %@ with error %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = [v5 options];
  if ([v9 presentmentAuthPolicy] == 2) {
    [v5 hasUsablePresentmentAuthPolicy];
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_16(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F5C0E8]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2_20;
  v11[3] = &unk_1E59DC6F8;
  id v13 = v5;
  id v14 = v6;
  id v12 = v7;
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  [v10 globalAuthACLWithCompletion:v11];
}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Could not fetch global ACL with error %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v5) {
    [v5 aclType];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  char v5 = [a4 isCanceled];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2_24;
  block[3] = &unk_1E59CF278;
  id v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  char v9 = v5 ^ 1;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2_24(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = 2;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = *(unsigned char *)(a1 + 48);
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)viewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F5C248]);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PKIdentityReplaceFingerprintHelper_viewControllerWithCompletion___block_invoke;
  v7[3] = &unk_1E59DC748;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 beginBiometricReplacement:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__PKIdentityReplaceFingerprintHelper_viewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKIdentityReplaceFingerprintHelper_viewControllerWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __67__PKIdentityReplaceFingerprintHelper_viewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = PKLogFacilityTypeGetObject();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        __int16 v9 = 0;
        id v6 = "Presenting biometric replacement flow";
        id v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else if (v5)
    {
      __int16 v8 = 0;
      id v6 = "Biometric replacement flow manager did not provide a view controller";
      id v7 = (uint8_t *)&v8;
      goto LABEL_7;
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
}

- (void).cxx_destruct
{
}

@end