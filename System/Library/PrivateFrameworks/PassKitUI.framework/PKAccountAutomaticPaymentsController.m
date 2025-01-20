@interface PKAccountAutomaticPaymentsController
- (BOOL)canPerformScheduleAutomaticPaymentsWithPreset:(int64_t)a3 frequency:(int64_t)a4 amount:(id)a5 paymentDate:(id)a6;
- (BOOL)needsPreflight;
- (BOOL)willSkipFirstPayment;
- (NSArray)automaticPayments;
- (NSArray)fundingSources;
- (NSDate)paymentDate;
- (PKAccount)account;
- (PKAccountAutomaticPaymentsController)initWithAccountService:(id)a3 paymentWebService:(id)a4 account:(id)a5 context:(int64_t)a6;
- (PKAccountAutomaticPaymentsControllerDelegate)delegate;
- (PKCurrencyAmount)amount;
- (id)_paymentRequest;
- (id)_paymentSummaryItems;
- (id)_schedulePaymentRequestWithBankAccount:(id)a3;
- (id)alertControllerForScheduledDate:(id)a3;
- (id)firstAutomaticPaymentDateForSelectedDate:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (int64_t)minimumPaymentDayForPreset:(int64_t)a3;
- (int64_t)paymentFrequency;
- (int64_t)paymentPreset;
- (int64_t)paymentSetupContext;
- (int64_t)scheduledDay;
- (unint64_t)featureIdentifier;
- (void)_addNewBankAccountIfNecessary:(id)a3;
- (void)_performApplePayTrustSignatureRequestWithSignature:(id)a3 completion:(id)a4;
- (void)_performPaymentRequest:(id)a3;
- (void)_resetPaymentConfiguration;
- (void)nextViewControllerFromViewController:(id)a3 withCompletion:(id)a4;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)performScheduleAutomaticPayments:(id)a3;
- (void)performScheduleAutomaticPaymentsFromViewController:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)presentNextViewControllerFromViewController:(id)a3;
- (void)setAmount:(id)a3;
- (void)setAutomaticPayments:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFundingSources:(id)a3;
- (void)setNeedsPreflight:(BOOL)a3;
- (void)setPaymentDate:(id)a3;
- (void)setPaymentFrequency:(int64_t)a3;
- (void)setPaymentPreset:(int64_t)a3;
- (void)setScheduledDay:(int64_t)a3;
@end

@implementation PKAccountAutomaticPaymentsController

- (PKAccountAutomaticPaymentsController)initWithAccountService:(id)a3 paymentWebService:(id)a4 account:(id)a5 context:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKAccountAutomaticPaymentsController;
  v14 = [(PKAccountAutomaticPaymentsController *)&v25 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accountService, a3);
    objc_storeStrong((id *)&v15->_paymentWebService, a4);
    objc_storeStrong((id *)&v15->_account, a5);
    v16 = [v13 creditDetails];
    uint64_t v17 = [v16 productTimeZone];
    productTimeZone = v15->_productTimeZone;
    v15->_productTimeZone = (NSTimeZone *)v17;

    id v19 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v20 = [v19 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    productCalendar = v15->_productCalendar;
    v15->_productCalendar = (NSCalendar *)v20;

    [(NSCalendar *)v15->_productCalendar setTimeZone:v15->_productTimeZone];
    v15->_featureIdentifier = [v13 feature];
    v15->_paymentSetupContext = a6;
    v15->_needsPreflight = 1;
    v22 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    monthDayFormatter = v15->_monthDayFormatter;
    v15->_monthDayFormatter = v22;

    [(NSDateFormatter *)v15->_monthDayFormatter setLocalizedDateFormatFromTemplate:@"MMMM d"];
    [(NSDateFormatter *)v15->_monthDayFormatter setTimeZone:v15->_productTimeZone];
    [(PKAccountAutomaticPaymentsController *)v15 _resetPaymentConfiguration];
  }

  return v15;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_needsPreflight)
  {
    objc_initWeak(&location, self);
    v6 = [MEMORY[0x1E4F84270] sharedInstance];
    v7 = [(PKAccount *)self->_account accountIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__PKAccountAutomaticPaymentsController_preflightWithCompletion___block_invoke;
    v8[3] = &unk_1E59CB060;
    objc_copyWeak(&v10, &location);
    id v9 = v5;
    [v6 updatePaymentFundingSourcesForAccountIdentifier:v7 force:1 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __64__PKAccountAutomaticPaymentsController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PKAccountAutomaticPaymentsController_preflightWithCompletion___block_invoke_2;
  v9[3] = &unk_1E59D11A8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __64__PKAccountAutomaticPaymentsController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = WeakRetained;
    if (!v4)
    {
      objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 40));
      v3 = v6;
      *((unsigned char *)v6 + 177) = 0;
    }
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, BOOL, void))(v5 + 16))(v5, v4 == 0, *(void *)(a1 + 32));
      v3 = v6;
    }
  }
}

- (void)_resetPaymentConfiguration
{
  amount = self->_amount;
  self->_amount = 0;

  self->_paymentFrequency = 0;
  self->_paymentPreset = 0;
  paymentDate = self->_paymentDate;
  self->_paymentDate = 0;
}

- (id)_schedulePaymentRequestWithBankAccount:(id)a3
{
  schedulePaymentRequest = self->_schedulePaymentRequest;
  if (!schedulePaymentRequest)
  {
    account = self->_account;
    id v6 = a3;
    id v7 = [(PKAccount *)account schedulePaymentFeatureDescriptor];
    id v8 = [v7 paymentTermsIdentifier];

    id v9 = [(PKAccount *)self->_account creditDetails];
    id v10 = [v9 currencyCode];

    amount = self->_amount;
    if (amount)
    {
      id v12 = amount;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28C28] notANumber];
      PKCurrencyAmountCreate(v13, v10);
      id v12 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
    }
    v29 = v10;
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F84218]) initWithType:1];
    v15 = [v6 identifier];

    [v14 setIdentifier:v15];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F84250]) initWithCurrencyAmount:v12 fundingSource:v14];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F84258]) initWithScheduledPayment:v16];
    id v18 = objc_alloc_init(MEMORY[0x1E4F84220]);
    int64_t paymentFrequency = self->_paymentFrequency;
    int64_t paymentPreset = self->_paymentPreset;
    if (paymentFrequency == 7)
    {
      paymentDate = self->_paymentDate;
      self->_paymentDate = 0;
    }
    [v18 setFrequency:paymentFrequency];
    [v18 setPreset:paymentPreset];
    v22 = [(PKAccount *)self->_account creditDetails];
    v23 = [v22 productTimeZone];
    [v18 setScheduleTimeZone:v23];

    [v18 setScheduledDate:self->_paymentDate];
    [v18 setPaymentTermsIdentifier:v8];
    if (paymentFrequency == 6 && self->_scheduledDay)
    {
      objc_msgSend(v18, "setScheduledDay:");
      [v18 setScheduledDate:0];
    }
    id v24 = objc_alloc_init(MEMORY[0x1E4F84358]);
    [v24 setScheduledPayments:v17];
    [v24 setScheduleDetails:v18];
    objc_super v25 = [(PKAccount *)self->_account accountIdentifier];
    [v24 setAccountIdentifier:v25];

    v26 = [(PKAccount *)self->_account accountBaseURL];
    [v24 setBaseURL:v26];

    v27 = self->_schedulePaymentRequest;
    self->_schedulePaymentRequest = (PKAccountWebServiceSchedulePaymentRequest *)v24;

    schedulePaymentRequest = self->_schedulePaymentRequest;
  }

  return schedulePaymentRequest;
}

- (id)_paymentRequest
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F84288]) initWithAccount:self->_account peerPaymentAccount:0 peerPaymentPass:0 transferType:1 fundingSources:self->_fundingSources currencyAmount:self->_amount paymentDate:self->_paymentDate objectSettings:0];
  [v3 setConfirmationStyle:0];
  uint64_t v4 = [(PKAccountAutomaticPaymentsController *)self _paymentSummaryItems];
  [v3 setPaymentSummaryItems:v4];

  [v3 setPaymentFrequency:self->_paymentFrequency];

  return v3;
}

- (id)_paymentSummaryItems
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (self->_paymentPreset > 3uLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = PKLocalizedFeatureString();
  }
  uint64_t v4 = [(PKCurrencyAmount *)self->_amount amount];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C28] zero];
  }
  id v7 = v6;

  id v8 = [MEMORY[0x1E4F84CE0] summaryItemWithLabel:v3 amount:v7];
  v11[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

- (void)_addNewBankAccountIfNecessary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = self->_fundingSources;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "identifier", (void)v25);
        id v11 = [v4 identifier];
        fundingSources = v10;
        id v13 = v11;
        if (fundingSources == v13)
        {

          v21 = fundingSources;
          goto LABEL_18;
        }
        v14 = v13;
        if (fundingSources) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
        }
        else
        {
          char v16 = [(NSArray *)fundingSources isEqualToString:v13];

          if (v16) {
            goto LABEL_19;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F84210]);
  uint64_t v17 = [(PKAccount *)self->_account accountIdentifier];
  [(NSArray *)v5 setAccountIdentifier:v17];

  id v18 = [v4 bankName];
  [(NSArray *)v5 setName:v18];

  -[NSArray setStatus:](v5, "setStatus:", [v4 status]);
  id v19 = [v4 routingNumber];
  [(NSArray *)v5 setRoutingNumber:v19];

  uint64_t v20 = [v4 accountNumber];
  [(NSArray *)v5 setAccountNumber:v20];

  v21 = (NSArray *)[objc_alloc(MEMORY[0x1E4F84218]) initWithType:1];
  v22 = [v4 identifier];
  [(NSArray *)v21 setIdentifier:v22];

  v23 = [v4 accountSuffix];
  [(NSArray *)v21 setAccountSuffix:v23];

  [(NSArray *)v21 setFundingDetails:v5];
  id v24 = (NSArray *)[(NSArray *)self->_fundingSources mutableCopy];
  [(NSArray *)v24 addObject:v21];
  fundingSources = self->_fundingSources;
  self->_fundingSources = v24;
LABEL_18:

LABEL_19:
}

- (id)firstAutomaticPaymentDateForSelectedDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4 || self->_paymentPreset == 1)
  {
    id v10 = v4;
    goto LABEL_19;
  }
  uint64_t v6 = [(PKAccount *)self->_account creditDetails];
  uint64_t v7 = [v6 accountSummary];

  int64_t paymentPreset = self->_paymentPreset;
  if (paymentPreset == 3)
  {
    uint64_t v9 = [v7 remainingStatementBalance];
  }
  else
  {
    if (paymentPreset != 2) {
      goto LABEL_10;
    }
    uint64_t v9 = [v7 remainingMinimumPayment];
  }
  id v11 = (void *)v9;
  if (v9)
  {
    id v12 = [MEMORY[0x1E4F28C28] zero];
    BOOL v13 = [v12 compare:v11] != -1;

    goto LABEL_11;
  }
LABEL_10:
  BOOL v13 = 0;
LABEL_11:
  v14 = [v7 balanceSummary];
  BOOL v15 = [v14 closingDate];

  if (v15 && ([v5 compare:v15] != 1 ? (BOOL v16 = v13) : (BOOL v16 = 0), v16))
  {
    id v17 = [(NSCalendar *)self->_productCalendar dateByAddingUnit:8 value:1 toDate:v5 options:0];
  }
  else
  {
    id v17 = v5;
  }
  id v10 = v17;

LABEL_19:

  return v10;
}

- (id)alertControllerForScheduledDate:(id)a3
{
  id v4 = a3;
  if (v4 && ([(PKAccount *)self->_account isClosedAndChargedOff] & 1) == 0)
  {
    uint64_t v6 = [(PKAccount *)self->_account creditDetails];
    uint64_t v7 = [v6 accountSummary];

    uint64_t v8 = [v7 paymentDueDate];
    uint64_t v9 = v8;
    if (v8 && [v8 compare:v4] == -1)
    {
      if (self->_paymentPreset == 2) {
        [v7 remainingMinimumPayment];
      }
      else {
      id v10 = [v7 remainingStatementBalance];
      }
      if (v10
        && ([MEMORY[0x1E4F28C28] zero],
            id v11 = objc_claimAutoreleasedReturnValue(),
            uint64_t v12 = [v11 compare:v10],
            v11,
            v12 == -1))
      {
        BOOL v16 = [(NSDateFormatter *)self->_monthDayFormatter stringFromDate:v4];
        BOOL v13 = PKLocalizedFeatureString();

        id v17 = -[NSDateFormatter stringFromDate:](self->_monthDayFormatter, "stringFromDate:", v9, v16);
        v14 = PKLocalizedFeatureString();

        uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1, v17);
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (int64_t)minimumPaymentDayForPreset:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 11;
  }
  else {
    return 1;
  }
}

- (BOOL)canPerformScheduleAutomaticPaymentsWithPreset:(int64_t)a3 frequency:(int64_t)a4 amount:(id)a5 paymentDate:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  BOOL v13 = (unint64_t)(a4 - 4) > 1 || a3 != 1;
  char v14 = (unint64_t)(a4 - 6) >= 2 && v13;
  BOOL v15 = v10 == 0;
  if (a3 != 1)
  {
    if (a4 != 7)
    {
      if (v11) {
        BOOL v18 = [(NSCalendar *)self->_productCalendar component:16 fromDate:v11] > 10;
      }
      else {
        BOOL v18 = 0;
      }
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (v10)
  {
    BOOL v16 = [MEMORY[0x1E4F28C28] zero];
    id v17 = [v10 amount];
    BOOL v15 = [v16 compare:v17] == -1;
  }
  else
  {
    BOOL v15 = 0;
  }
  if (a4 == 7)
  {
LABEL_15:
    BOOL v18 = v12 == 0;
    goto LABEL_18;
  }
  BOOL v18 = v12 != 0;
LABEL_18:
  if (a3) {
    char v19 = v14;
  }
  else {
    char v19 = 1;
  }
  BOOL v20 = v15 && v18;
  BOOL v21 = (v19 & 1) == 0 && v20;

  return v21;
}

- (void)performScheduleAutomaticPayments:(id)a3
{
  id aBlock = a3;
  id v4 = [(PKAccountAutomaticPaymentsController *)self _paymentRequest];
  if (v4)
  {
    uint64_t v5 = _Block_copy(aBlock);
    id performScheduleAutomaticPaymentsCompletion = self->_performScheduleAutomaticPaymentsCompletion;
    self->_id performScheduleAutomaticPaymentsCompletion = v5;

    [(PKAccountAutomaticPaymentsController *)self _performPaymentRequest:v4];
  }
  else if (aBlock)
  {
    (*((void (**)(id, void, void))aBlock + 2))(aBlock, 0, 0);
  }
}

- (void)performScheduleAutomaticPaymentsFromViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __91__PKAccountAutomaticPaymentsController_performScheduleAutomaticPaymentsFromViewController___block_invoke;
  uint64_t v9 = &unk_1E59DCA00;
  objc_copyWeak(&v10, &from);
  objc_copyWeak(&v11, &location);
  uint64_t v5 = _Block_copy(&v6);
  -[PKAccountAutomaticPaymentsController performScheduleAutomaticPayments:](self, "performScheduleAutomaticPayments:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __91__PKAccountAutomaticPaymentsController_performScheduleAutomaticPaymentsFromViewController___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = v6;
  if (WeakRetained && v6)
  {
    if (a2)
    {
      [WeakRetained presentNextViewControllerFromViewController:v6];
    }
    else if (v10)
    {
      uint64_t v8 = +[PKAccountFlowController displayableErrorForError:v10 featureIdentifier:WeakRetained[23] genericErrorTitle:0 genericErrorMessage:0];
      id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
      [v7 presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (void)presentNextViewControllerFromViewController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__PKAccountAutomaticPaymentsController_presentNextViewControllerFromViewController___block_invoke;
  v6[3] = &unk_1E59CCCE8;
  id v7 = v4;
  id v5 = v4;
  [(PKAccountAutomaticPaymentsController *)self nextViewControllerFromViewController:v5 withCompletion:v6];
}

void __84__PKAccountAutomaticPaymentsController_presentNextViewControllerFromViewController___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v4 = [v2 navigationController];
    objc_msgSend(v4, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, 0);
  }
}

- (void)nextViewControllerFromViewController:(id)a3 withCompletion:(id)a4
{
  char v19 = (PKAccountAutomaticPaymentsDateViewController *)a3;
  id v6 = (void (**)(id, id))a4;
  if (v6)
  {
    int v7 = [(PKAccount *)self->_account isClosedAndChargedOff];
    if (!v19)
    {
      if ([(NSArray *)self->_automaticPayments count])
      {
        p_viewPaymentController = (void **)&self->_viewPaymentController;
LABEL_24:
        heroViewController = *p_viewPaymentController;
        goto LABEL_25;
      }
      p_viewPaymentController = (void **)&self->_heroViewController;
      heroViewController = self->_heroViewController;
      if (!heroViewController)
      {
        BOOL v18 = [[PKAccountAutomaticPaymentsHeroViewController alloc] initWithController:self];
        presetViewController = self->_heroViewController;
        self->_heroViewController = v18;
        goto LABEL_23;
      }
      goto LABEL_25;
    }
    if ((PKAccountAutomaticPaymentsDateViewController *)self->_heroViewController == v19)
    {
      id v10 = self;
      if (!v7)
      {
        p_viewPaymentController = (void **)&self->_presetViewController;
        heroViewController = self->_presetViewController;
        if (!heroViewController)
        {
          uint64_t v12 = [[PKAccountAutomaticPaymentsPresetViewController alloc] initWithController:self];
          presetViewController = self->_presetViewController;
          self->_presetViewController = v12;
LABEL_23:

          goto LABEL_24;
        }
LABEL_25:
        id v8 = heroViewController;
        goto LABEL_26;
      }
    }
    else
    {
      if ((PKAccountAutomaticPaymentsDateViewController *)self->_presetViewController != v19)
      {
        if (self->_dateViewController != v19
          && (PKAccountAutomaticPaymentsDateViewController *)self->_configurationViewController != v19
          && (PKAccountAutomaticPaymentsDateViewController *)self->_minimumPaymentDisclosureViewController != v19)
        {
          id v8 = 0;
LABEL_26:
          v6[2](v6, v8);

          goto LABEL_27;
        }
        p_viewPaymentController = (void **)&self->_setupCompleteViewController;
        heroViewController = self->_setupCompleteViewController;
        if (!heroViewController)
        {
          char v14 = [[PKAccountAutomaticPaymentsSetupCompleteViewController alloc] initWithController:self];
          presetViewController = self->_setupCompleteViewController;
          self->_setupCompleteViewController = v14;
          goto LABEL_23;
        }
        goto LABEL_25;
      }
      id v10 = self;
      if ((self->_paymentPreset & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        p_viewPaymentController = (void **)&self->_dateViewController;
        heroViewController = self->_dateViewController;
        if (!heroViewController)
        {
          BOOL v15 = [[PKAccountAutomaticPaymentsDateViewController alloc] initWithController:self];
          presetViewController = self->_dateViewController;
          self->_dateViewController = v15;
          goto LABEL_23;
        }
        goto LABEL_25;
      }
    }
    configurationViewController = v10->_configurationViewController;
    p_viewPaymentController = (void **)&v10->_configurationViewController;
    heroViewController = configurationViewController;
    if (!configurationViewController)
    {
      id v17 = [[PKAccountAutomaticPaymentsConfigurationViewController alloc] initWithController:self];
      presetViewController = self->_configurationViewController;
      self->_configurationViewController = v17;
      goto LABEL_23;
    }
    goto LABEL_25;
  }
LABEL_27:
}

- (void)_performPaymentRequest:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F84A10];
  id v5 = a3;
  id v6 = (PKPaymentAuthorizationCoordinator *)[[v4 alloc] initWithPaymentRequest:v5];

  paymentAuthorizationCoordinator = self->_paymentAuthorizationCoordinator;
  self->_paymentAuthorizationCoordinator = v6;

  [(PKPaymentAuthorizationCoordinator *)self->_paymentAuthorizationCoordinator setDelegate:self];
  [(PKPaymentAuthorizationCoordinator *)self->_paymentAuthorizationCoordinator _setPrivateDelegate:self];
  id v8 = self->_paymentAuthorizationCoordinator;

  [(PKPaymentAuthorizationCoordinator *)v8 presentWithCompletion:&__block_literal_global_198];
}

void __63__PKAccountAutomaticPaymentsController__performPaymentRequest___block_invoke(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "_paymentAuthorizationCoordinator presentWithCompletion: completed with success:%d", (uint8_t *)v4, 8u);
  }
}

- (void)_performApplePayTrustSignatureRequestWithSignature:(id)a3 completion:(id)a4
{
  id v6 = a4;
  int v7 = (objc_class *)MEMORY[0x1E4F842E8];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithApplePayTrustProtocol:self->_schedulePaymentRequest];
  [v9 setSignature:v8];

  paymentWebService = self->_paymentWebService;
  account = self->_account;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke;
  v13[3] = &unk_1E59DCA28;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [(PKPaymentWebService *)paymentWebService applePayTrustSignatureRequestWithRequest:v9 account:account completion:v13];
}

void __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2;
  v10[3] = &unk_1E59CB728;
  int v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    LOBYTE(v2) = *(void *)(a1 + 48) == 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 176) = v2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 48));
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F84A30]) initWithStatus:*(unsigned char *)(*(void *)(a1 + 32) + 176) == 0 errors:0];
  id v4 = *(void **)(a1 + 40);
  if (v4 && !*(void *)(a1 + 48))
  {
    id v5 = [v4 payments];
    id v6 = [v5 firstObject];

    uint64_t v7 = [v6 paymentDate];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 96);
    *(void *)(v8 + 96) = v7;

    id v10 = [v6 scheduleDetails];
    uint64_t v11 = [v10 scheduledDay];

    if ((unint64_t)(v11 - 1) <= 0x1E) {
      *(void *)(*(void *)(a1 + 32) + 208) = v11;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = [v6 willSkipFirstPaymentForAccount:*(void *)(*(void *)(a1 + 32) + 24)];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 8);
    uint64_t v14 = *(void *)(v12 + 24);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3;
    v17[3] = &unk_1E59D4D58;
    v17[4] = v12;
    id v18 = v6;
    id v15 = v6;
    [v13 updateScheduledPaymentsWithAccount:v14 completion:v17];
  }
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v3);
  }
}

void __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_4;
    v5[3] = &unk_1E59CA870;
    id v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  [WeakRetained accountAutomaticPaymentsController:*(void *)(a1 + 32) didSchedulePayment:*(void *)(a1 + 40)];
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_paymentAuthorizationCoordinator == v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[PKAccountAutomaticPaymentsController paymentAuthorizationCoordinatorDidFinish:]";
      __int16 v12 = 2048;
      id v13 = self;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    paymentAuthorizationCoordinator = self->_paymentAuthorizationCoordinator;
    self->_paymentAuthorizationCoordinator = 0;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v7[3] = &unk_1E59CA870;
    uint64_t v8 = v4;
    id v9 = self;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  v3[3] = &unk_1E59CA7D0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissWithCompletion:v3];
}

void __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 176)) {
    BOOL v3 = *(void *)(v2 + 80) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  uint64_t v4 = v3;
  (*(void (**)(void, uint64_t))(*(void *)(v2 + 160) + 16))(*(void *)(v2 + 160), v4);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 80);
  *(void *)(v7 + 80) = 0;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke;
  aBlock[3] = &unk_1E59DCA78;
  id v9 = v7;
  id v17 = v9;
  id v18 = self;
  id v10 = v8;
  id v19 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  __int16 v12 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    paymentWebService = self->_paymentWebService;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_3;
    v14[3] = &unk_1E59D58D0;
    id v15 = v11;
    [v12 paymentWebService:paymentWebService deviceMetadataWithFields:123 completion:v14];
  }
  else
  {
    (*((void (**)(void *, void))v11 + 2))(v11, 0);
  }
}

void __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 bankAccountInformation];
  [*(id *)(a1 + 40) _addNewBankAccountIfNecessary:v5];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = 0;

  id v8 = (id)[*(id *)(a1 + 40) _schedulePaymentRequestWithBankAccount:v5];
  [*(id *)(*(void *)(a1 + 40) + 56) setDeviceMetadata:v4];

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(v9 + 16);
  uint64_t v11 = *(void *)(v9 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_2;
  v12[3] = &unk_1E59DCA50;
  v12[4] = v9;
  id v13 = *(id *)(a1 + 48);
  [v10 schedulePaymentWithRequest:v11 completion:v12];
}

void __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = 0;
  if (a2 && !a3)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 56);
    id v5 = a2;
    uint64_t v6 = [v5 referenceIdentifier];
    id v7 = [v4 manifestHashWithReferenceIdentifier:v6];

    id v8 = objc_alloc(MEMORY[0x1E4F84410]);
    uint64_t v9 = *MEMORY[0x1E4F87088];
    id v10 = [v5 nonce];

    id v14 = (id)[v8 initWithKeyIdentifier:v9 manifestHash:v7 nonce:v10];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F84C00]);
  __int16 v12 = [*(id *)(a1 + 32) _paymentSummaryItems];
  id v13 = (void *)[v11 initWithPaymentSummaryItems:v12];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_4;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = [WeakRetained presentationSceneIdentifierForAccountAutomaticPaymentsController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)paymentSetupContext
{
  return self->_paymentSetupContext;
}

- (PKAccount)account
{
  return self->_account;
}

- (BOOL)willSkipFirstPayment
{
  return self->_willSkipFirstPayment;
}

- (BOOL)needsPreflight
{
  return self->_needsPreflight;
}

- (void)setNeedsPreflight:(BOOL)a3
{
  self->_needsPreflight = a3;
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void)setPaymentDate:(id)a3
{
}

- (int64_t)paymentFrequency
{
  return self->_paymentFrequency;
}

- (void)setPaymentFrequency:(int64_t)a3
{
  self->_int64_t paymentFrequency = a3;
}

- (int64_t)scheduledDay
{
  return self->_scheduledDay;
}

- (void)setScheduledDay:(int64_t)a3
{
  self->_scheduledDay = a3;
}

- (int64_t)paymentPreset
{
  return self->_paymentPreset;
}

- (void)setPaymentPreset:(int64_t)a3
{
  self->_int64_t paymentPreset = a3;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(id)a3
{
}

- (NSArray)automaticPayments
{
  return self->_automaticPayments;
}

- (void)setAutomaticPayments:(id)a3
{
}

- (PKAccountAutomaticPaymentsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAccountAutomaticPaymentsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_automaticPayments, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_paymentAuthorizationCoordinator, 0);
  objc_storeStrong(&self->_performScheduleAutomaticPaymentsCompletion, 0);
  objc_storeStrong((id *)&self->_minimumPaymentDisclosureViewController, 0);
  objc_storeStrong((id *)&self->_setupCompleteViewController, 0);
  objc_storeStrong((id *)&self->_configurationViewController, 0);
  objc_storeStrong((id *)&self->_dateViewController, 0);
  objc_storeStrong((id *)&self->_presetViewController, 0);
  objc_storeStrong((id *)&self->_heroViewController, 0);
  objc_storeStrong((id *)&self->_viewPaymentController, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_monthDayFormatter, 0);
  objc_storeStrong((id *)&self->_performScheduleAutomaticPaymentsError, 0);
  objc_storeStrong((id *)&self->_applePayTrustSignatureRequest, 0);
  objc_storeStrong((id *)&self->_fundingSources, 0);
  objc_storeStrong((id *)&self->_schedulePaymentRequest, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);

  objc_storeStrong((id *)&self->_accountService, 0);
}

@end