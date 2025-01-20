@interface PKSafariCardNotificationManager
- (PKSafariCardNotificationManager)init;
- (void)_eligibleToCheckWithCompletion:(id)a3;
- (void)userDidPerformAction:(int64_t)a3 withCard:(id)a4;
@end

@implementation PKSafariCardNotificationManager

- (PKSafariCardNotificationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKSafariCardNotificationManager;
  v2 = [(PKSafariCardNotificationManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v3;
  }
  return v2;
}

- (void)userDidPerformAction:(int64_t)a3 withCard:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v15 = v9;
    __int16 v16 = 2048;
    int64_t v17 = a3;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@ called with action %ld", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PKSafariCardNotificationManager_userDidPerformAction_withCard___block_invoke;
  v11[3] = &unk_1E56E8D48;
  id v12 = v7;
  v13 = self;
  id v10 = v7;
  [(PKSafariCardNotificationManager *)self _eligibleToCheckWithCompletion:v11];
}

void __65__PKSafariCardNotificationManager_userDidPerformAction_withCard___block_invoke(uint64_t a1, int a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = [[PKPaymentSafariCredential alloc] initWithSafariDictionary:*(void *)(a1 + 32)];
    v4 = v3;
    if (v3)
    {
      BOOL v5 = [(PKPaymentSafariCredential *)v3 canCheckEligibility];
      objc_super v6 = PKLogFacilityTypeGetObject(6uLL);
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Safari Import: Sending credential to be suggested based on checks.", v10, 2u);
        }

        v8 = *(void **)(*(void *)(a1 + 40) + 8);
        v11[0] = v4;
        objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
        [v8 suggestPaymentSafariCredentialImport:v6 withCompletion:&__block_literal_global_113];
        goto LABEL_12;
      }
      if (v7)
      {
        *(_WORD *)id v10 = 0;
        v9 = "Safari Import: Not sending credential as it's missing a required field for eligibility checking.";
        goto LABEL_11;
      }
    }
    else
    {
      objc_super v6 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        v9 = "Safari Import: Error converting Safari dictionary into credential.";
LABEL_11:
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
LABEL_12:
  }
}

void __65__PKSafariCardNotificationManager_userDidPerformAction_withCard___block_invoke_12(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Safari Import: Success passing Safari credential for import suggestion.", (uint8_t *)&v8, 2u);
    }
  }
  else if (v6)
  {
    BOOL v7 = [v4 localizedDescription];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Safari Import: Error passing Safari credential for import suggestion: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_eligibleToCheckWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t))a3;
  int v4 = _os_feature_enabled_impl();
  if (v3)
  {
    if (v4)
    {
      unint64_t v5 = PKCurrentPassbookState();
      BOOL v6 = PKLogFacilityTypeGetObject(6uLL);
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5 < 2)
      {
        if (v7)
        {
          v9[0] = 0;
          _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Safari Import Eligibility: All checks have passed.", (uint8_t *)v9, 2u);
        }

        v3[2](v3, 1);
        goto LABEL_15;
      }
      if (v7)
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Safari Import Eligibility: Wallet has been deleted.", v10, 2u);
      }
    }
    v3[2](v3, 0);
    goto LABEL_15;
  }
  if (v4)
  {
    int v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Safari Import Eligibility: No completion block provided to eligibility check.", buf, 2u);
    }
  }
LABEL_15:
}

- (void).cxx_destruct
{
}

@end