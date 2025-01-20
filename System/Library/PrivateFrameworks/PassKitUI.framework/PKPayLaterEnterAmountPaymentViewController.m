@interface PKPayLaterEnterAmountPaymentViewController
- (PKPayLaterEnterAmountPaymentViewController)initWithPayLaterAccount:(id)a3 financingPlan:(id)a4 intentDetails:(id)a5 paymentIntentController:(id)a6;
- (id)headerSubtitle;
- (id)headerTitle;
- (id)keypadSuggestions;
- (void)nextButtonTapped;
@end

@implementation PKPayLaterEnterAmountPaymentViewController

- (PKPayLaterEnterAmountPaymentViewController)initWithPayLaterAccount:(id)a3 financingPlan:(id)a4 intentDetails:(id)a5 paymentIntentController:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PKPayLaterEnterAmountPaymentViewController;
  v14 = [(PKPayLaterEnterAmountViewController *)&v22 initWithPayLaterAccount:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_financingPlan, a4);
    objc_storeStrong((id *)&v15->_intentDetails, a5);
    objc_storeStrong((id *)&v15->_paymentIntentController, a6);
    v16 = [(PKPayLaterFinancingPlan *)v15->_financingPlan planSummary];
    v17 = [v16 currentBalance];
    v18 = [v17 amount];
    [(PKPayLaterEnterAmountViewController *)v15 setMaxAllowedAmount:v18];

    v19 = [v12 minimumAmount];
    v20 = [v19 amount];
    [(PKPayLaterEnterAmountViewController *)v15 setMinAllowedAmount:v20];
  }
  return v15;
}

- (id)headerTitle
{
  return (id)PKLocalizedCocoonString(&cfstr_PaymentAmount.isa);
}

- (id)headerSubtitle
{
  if ([(PKPayLaterFinancingPlan *)self->_financingPlan productType] == 1)
  {
    v2 = PKLocalizedCocoonString(&cfstr_PaymentAmountB.isa);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)keypadSuggestions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  v5 = [v4 installments];
  v6 = objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_189);

  v7 = [v6 firstObject];
  if ((unint64_t)[v6 count] < 2)
  {
    v8 = 0;
  }
  else
  {
    v8 = [v6 objectAtIndexedSubscript:1];
  }
  v9 = [v7 currentBalance];
  v10 = v9;
  if (v9)
  {
    id v11 = [v9 amount];
    int v12 = objc_msgSend(v11, "pk_isPositiveNumber");

    if (v12)
    {
      v33 = self;
      id v13 = (void *)MEMORY[0x1E4F84808];
      v14 = PKLocalizedCocoonString(&cfstr_NextPaymentKey.isa);
      v15 = [v10 amount];
      v16 = [v10 currency];
      v17 = [v13 suggestionWithTitle:v14 value:v15 currencyCode:v16];

      [v3 safelyAddObject:v17];
      v18 = [v8 currentBalance];
      v19 = v18;
      if (v18)
      {
        v20 = [v18 amount];
        int v21 = objc_msgSend(v20, "pk_isPositiveNumber");

        if (v21)
        {
          if ([(PKPayLaterFinancingPlan *)v33->_financingPlan productType] == 1)
          {
            objc_super v22 = PKLocalizedCocoonString(&cfstr_NextTwoPayment.isa);
          }
          else
          {
            objc_super v22 = 0;
          }
          v23 = [v10 currencyAmountByAddingCurrencyAmount:v19];
          v24 = v23;
          if (v23)
          {
            [v23 amount];
            v25 = v34 = v22;
            int v26 = objc_msgSend(v25, "pk_isPositiveNumber");

            objc_super v22 = v34;
            if (v26)
            {
              v31 = (void *)MEMORY[0x1E4F84808];
              v30 = [v24 amount];
              v27 = [v19 currency];
              v32 = [v31 suggestionWithTitle:v34 value:v30 currencyCode:v27];

              [v3 safelyAddObject:v32];
              objc_super v22 = v34;
            }
          }
        }
      }
    }
  }
  if ((uint64_t)fmin((double)(unint64_t)[v3 count], 2.0) < 1)
  {
    v28 = 0;
  }
  else
  {
    v28 = [v3 subarrayWithRange:0];
  }

  return v28;
}

uint64_t __63__PKPayLaterEnterAmountPaymentViewController_keypadSuggestions__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 status];
  return (v2 > 5) | (0x12u >> v2) & 1;
}

- (void)nextButtonTapped
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(PKPayLaterEnterAmountViewController *)self showNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  id v3 = [(PKPayLaterEnterAmountViewController *)self currencyAmount];
  v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  v5 = [(PKPayLaterEnterAmountPaymentViewController *)self view];
  v6 = [v5 window];
  v7 = [v6 windowScene];
  v8 = [v7 _sceneIdentifier];

  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v3 formattedStringValue];
    *(_DWORD *)buf = 138412290;
    objc_super v22 = v10;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Presenting one time payment with %@", buf, 0xCu);
  }
  paymentIntentController = self->_paymentIntentController;
  financingPlan = self->_financingPlan;
  intentDetails = self->_intentDetails;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__PKPayLaterEnterAmountPaymentViewController_nextButtonTapped__block_invoke;
  v16[3] = &unk_1E59DBF30;
  objc_copyWeak(v19, &location);
  id v14 = v3;
  id v17 = v14;
  id v15 = v4;
  id v18 = v15;
  v19[1] = (id)1;
  [(PKPayLaterPaymentIntentController *)paymentIntentController presentPaymentAuthorizationForFinancingPlan:financingPlan primaryPaymentSource:0 intentDetails:intentDetails intent:1 currencyAmount:v14 presentationSceneIdentifier:v8 completion:v16];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __62__PKPayLaterEnterAmountPaymentViewController_nextButtonTapped__block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained showNavigationBarSpinner:0];
    if ((a2 & 1) == 0)
    {
      if (v7 || (a3 & 1) == 0)
      {
        id v14 = PKAccountDisplayableError();
        id v15 = PKAlertForDisplayableErrorWithHandlers(v14, 0, 0, 0);

        [v9 presentViewController:v15 animated:1 completion:0];
        v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412290;
          id v18 = v7;
          _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Failed to present financing plan payment intent authorization %@", (uint8_t *)&v17, 0xCu);
        }
      }
      else
      {
        v10 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = *(void **)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 40);
          id v13 = PKFinancingPlanPaymentIntentTypeToString();
          int v17 = 138412802;
          id v18 = v11;
          __int16 v19 = 2112;
          uint64_t v20 = v12;
          __int16 v21 = 2112;
          objc_super v22 = v13;
          _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Completed presenting financing plan payment intent authorization for amount %@, planIdentifier %@, intent %@", (uint8_t *)&v17, 0x20u);
        }
        [v9 dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end