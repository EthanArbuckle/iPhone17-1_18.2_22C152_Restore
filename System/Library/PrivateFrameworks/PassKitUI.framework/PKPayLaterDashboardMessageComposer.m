@interface PKPayLaterDashboardMessageComposer
+ (void)resetPayLaterDashboardCache;
- (PKAccount)payLaterAccount;
- (PKPayLaterDashboardMessageComposer)initWithContext:(unint64_t)a3 allFinancingPlans:(id)a4 payLaterPass:(id)a5 payLaterAccount:(id)a6 financingPlan:(id)a7 paymentIntentController:(id)a8 delegate:(id)a9;
- (PKPayLaterFinancingPlan)financingPlan;
- (id)_accountClosed;
- (id)_accountLocked;
- (id)_accountRestrictedNoPastDuePlans;
- (id)_accountRestrictedWithPastDuePlans;
- (id)_accountUnusualActivityDetected;
- (id)_autoPayAvailableForBNPL;
- (id)_autoPayAvailableMessageForSharedCachePrefix:(id)a3 identifierKeyPrefix:(id)a4 productType:(unint64_t)a5 messageString:(id)a6;
- (id)_financingPlanActiveMilitary;
- (id)_financingPlanAdjustments;
- (id)_financingPlanApprovedDisputes;
- (id)_financingPlanCanceled;
- (id)_financingPlanChargedOff;
- (id)_financingPlanDisasterRecovery;
- (id)_financingPlanEvidenceRequestedDisputes;
- (id)_financingPlanHardshipBenefitorPlan;
- (id)_financingPlanInProgressDisputes;
- (id)_financingPlanOutstandingCredit;
- (id)_financingPlanPaymentReversalMessage;
- (id)_financingPlanProActiveCancellation;
- (id)_financingPlanRAPDeferral;
- (id)_financingPlanRefundIssued;
- (id)_financingPlanRefundRevoked;
- (id)_financingPlanRejectedDisputes;
- (id)_financingPlanSplitDisputes;
- (id)_financingPlanUnresolvedDisputeState;
- (id)_financingPlanWithdrawnDisputes;
- (id)_payLaterFinancingDeclinedPayments;
- (id)_payLaterFinancingPlanPastDue;
- (id)_payLaterWelcomeMessageForSharedCacheKey:(id)a3 identifierKey:(id)a4 hasValidPlanCount:(BOOL)a5 messageString:(id)a6;
- (id)_payLaterWelcomeMessageWithNoPlans;
- (id)_payLaterWelcomeMessageWithPlans;
- (id)_pencilImage;
- (id)_reverseImage;
- (id)_systemImageWithName:(id)a3 tintColor:(id)a4;
- (id)_uturnImage;
- (id)_warningImage;
- (id)dashboardMessages;
- (void)_displayDisputeEvidenceRequiredViewControllerForFinancingPlan:(id)a3 dispute:(id)a4;
- (void)_displayDisputeExplanationViewControllerForFinancingPlan:(id)a3 contentType:(unint64_t)a4 messageIdentifier:(id)a5;
- (void)_presentBusinessChatForApplePayLaterAccountWithTopicType:(unint64_t)a3;
- (void)_presentBusinessChatForFinancingPlan:(id)a3 topicType:(unint64_t)a4;
- (void)_presentBusinessChatWithContext:(id)a3;
- (void)_showSpinnerForDashboardMessageIdentifier:(id)a3 showSpinner:(BOOL)a4;
- (void)_updateSharedCacheForKey:(id)a3 value:(BOOL)a4 reloadMessages:(BOOL)a5;
- (void)preflightDashboardMessagesWithCompletion:(id)a3;
- (void)setFinancingPlan:(id)a3;
- (void)setPayLaterAccount:(id)a3;
@end

@implementation PKPayLaterDashboardMessageComposer

- (PKPayLaterDashboardMessageComposer)initWithContext:(unint64_t)a3 allFinancingPlans:(id)a4 payLaterPass:(id)a5 payLaterAccount:(id)a6 financingPlan:(id)a7 paymentIntentController:(id)a8 delegate:(id)a9
{
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v33.receiver = self;
  v33.super_class = (Class)PKPayLaterDashboardMessageComposer;
  v19 = [(PKPayLaterDashboardMessageComposer *)&v33 init];
  v20 = v19;
  if (v19)
  {
    v19->_context = a3;
    objc_storeWeak((id *)&v19->_delegate, v18);
    objc_storeStrong((id *)&v20->_payLaterPass, a5);
    objc_storeStrong((id *)&v20->_payLaterAccount, a6);
    objc_storeStrong((id *)&v20->_financingPlan, a7);
    objc_storeStrong((id *)&v20->_allFinancingPlans, a4);
    objc_storeStrong((id *)&v20->_paymentIntentController, a8);
    uint64_t v21 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v20->_accountService;
    v20->_accountService = (PKAccountService *)v21;

    v20->_isAllContext = v20->_context == 2;
    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    dashboardMessagesThatNeedSpinners = v20->_dashboardMessagesThatNeedSpinners;
    v20->_dashboardMessagesThatNeedSpinners = v23;

    v25 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    shortDateFormatter = v20->_shortDateFormatter;
    v20->_shortDateFormatter = v25;

    v27 = v20->_shortDateFormatter;
    v28 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v27 setCalendar:v28];

    [(NSDateFormatter *)v20->_shortDateFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
  }

  return v20;
}

- (id)dashboardMessages
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  payLaterPass = self->_payLaterPass;
  if (payLaterPass
    && [(PKPaymentPass *)payLaterPass associatedAccountFeatureIdentifier] == 3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(PKPayLaterDashboardMessageComposer *)self _accountLocked];
    [v4 safelyAddObject:v5];

    if ([(PKAccount *)self->_payLaterAccount state] != 3)
    {
      v6 = [(PKPayLaterDashboardMessageComposer *)self _payLaterWelcomeMessageWithNoPlans];
      [v4 safelyAddObject:v6];

      v7 = [(PKPayLaterDashboardMessageComposer *)self _payLaterWelcomeMessageWithPlans];
      [v4 safelyAddObject:v7];

      v8 = [(PKPayLaterDashboardMessageComposer *)self _autoPayAvailableForBNPL];
      [v4 safelyAddObject:v8];

      v9 = [(PKPayLaterDashboardMessageComposer *)self _payLaterFinancingPlanPastDue];
      [v4 addObjectsFromArray:v9];

      v10 = [(PKPayLaterDashboardMessageComposer *)self _payLaterFinancingDeclinedPayments];
      [v4 addObjectsFromArray:v10];

      v11 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanPaymentReversalMessage];
      [v4 addObjectsFromArray:v11];

      v12 = [(PKPayLaterDashboardMessageComposer *)self _accountRestrictedNoPastDuePlans];
      [v4 safelyAddObject:v12];

      v13 = [(PKPayLaterDashboardMessageComposer *)self _accountRestrictedWithPastDuePlans];
      [v4 safelyAddObject:v13];

      v14 = [(PKPayLaterDashboardMessageComposer *)self _accountUnusualActivityDetected];
      [v4 safelyAddObject:v14];

      v15 = [(PKPayLaterDashboardMessageComposer *)self _accountClosed];
      [v4 safelyAddObject:v15];

      id v16 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanDisasterRecovery];
      [v4 safelyAddObject:v16];

      id v17 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanActiveMilitary];
      [v4 safelyAddObject:v17];

      id v18 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanHardshipBenefitorPlan];
      [v4 safelyAddObject:v18];

      v19 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanRAPDeferral];
      [v4 safelyAddObject:v19];

      v20 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanInProgressDisputes];
      [v4 addObjectsFromArray:v20];

      uint64_t v21 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanEvidenceRequestedDisputes];
      [v4 addObjectsFromArray:v21];

      v22 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanApprovedDisputes];
      [v4 addObjectsFromArray:v22];

      v23 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanSplitDisputes];
      [v4 addObjectsFromArray:v23];

      v24 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanRejectedDisputes];
      [v4 addObjectsFromArray:v24];

      v25 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanWithdrawnDisputes];
      [v4 addObjectsFromArray:v25];

      v26 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanUnresolvedDisputeState];
      [v4 safelyAddObject:v26];

      v27 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanRefundIssued];
      [v4 addObjectsFromArray:v27];

      v28 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanRefundRevoked];
      [v4 addObjectsFromArray:v28];

      v29 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanAdjustments];
      [v4 addObjectsFromArray:v29];

      id v30 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanOutstandingCredit];
      [v4 addObjectsFromArray:v30];

      id v31 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanCanceled];
      [v4 addObjectsFromArray:v31];

      id v32 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanChargedOff];
      [v4 addObjectsFromArray:v32];

      objc_super v33 = [(PKPayLaterDashboardMessageComposer *)self _financingPlanProActiveCancellation];
      [v4 safelyAddObject:v33];
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v34 = v4;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v47 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v40 = objc_msgSend(v39, "message", (void)v46);
          dashboardMessagesThatNeedSpinners = self->_dashboardMessagesThatNeedSpinners;
          v42 = [v40 identifier];
          uint64_t v43 = [(NSMutableSet *)dashboardMessagesThatNeedSpinners containsObject:v42];

          [v40 setShowSpinner:v43];
          if (self->_isAllContext) {
            [v39 setPriority:400];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v36);
    }

    [v34 sortUsingSelector:sel_compare_];
    v44 = objc_msgSend(v34, "pk_createOrderedSetByApplyingBlock:", &__block_literal_global_147);
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

uint64_t __55__PKPayLaterDashboardMessageComposer_dashboardMessages__block_invoke(uint64_t a1, void *a2)
{
  return [a2 message];
}

- (void)preflightDashboardMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_isAllContext)
  {
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = [MEMORY[0x1E4F850F8] sharedInstance];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__PKPayLaterDashboardMessageComposer_preflightDashboardMessagesWithCompletion___block_invoke;
    v7[3] = &unk_1E59D6ED0;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    [v6 authorizationStatusWithCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __79__PKPayLaterDashboardMessageComposer_preflightDashboardMessagesWithCompletion___block_invoke(uint64_t a1, void *a2, char a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PKPayLaterDashboardMessageComposer_preflightDashboardMessagesWithCompletion___block_invoke_2;
  v6[3] = &unk_1E59D86F8;
  objc_copyWeak(v8, (id *)(a1 + 40));
  char v9 = a3;
  v8[1] = a2;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(v8);
}

void __79__PKPayLaterDashboardMessageComposer_preflightDashboardMessagesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56)) {
      *((void *)WeakRetained + 10) = *(void *)(a1 + 48);
    }
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }
  }
}

- (id)_payLaterWelcomeMessageWithNoPlans
{
  BOOL v3 = [(NSArray *)self->_allFinancingPlans count] == 0;
  uint64_t v4 = PKLocalizedCocoonString(&cfstr_DashboardWelco.isa);
  v5 = [(PKPayLaterDashboardMessageComposer *)self _payLaterWelcomeMessageForSharedCacheKey:@"PKSharedCachePayLaterDashboardWelcomeMessageWithNoPlans-FOP" identifierKey:@"PayLaterWelcomeMessageNoPlans-FOP" hasValidPlanCount:v3 messageString:v4];

  return v5;
}

- (id)_payLaterWelcomeMessageWithPlans
{
  BOOL v3 = [(NSArray *)self->_allFinancingPlans count] != 0;
  uint64_t v4 = PKLocalizedCocoonString(&cfstr_DashboardWelco_0.isa);
  v5 = [(PKPayLaterDashboardMessageComposer *)self _payLaterWelcomeMessageForSharedCacheKey:@"PKSharedCachePayLaterDashboardWelcomeMessageWithWithPlans-FOP" identifierKey:@"PayLaterWelcomeMessageWithPlans-FOP" hasValidPlanCount:v3 messageString:v4];

  return v5;
}

- (id)_payLaterWelcomeMessageForSharedCacheKey:(id)a3 identifierKey:(id)a4 hasValidPlanCount:(BOOL)a5 messageString:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  unint64_t context = self->_context;
  if ((context == 2 || !context && v7) && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    v14 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v14 setIdentifier:v11];
    v15 = PKLocalizedCocoonString(&cfstr_DashboardWelco_1.isa);
    [(PKDashboardPassMessage *)v14 setTitle:v15];

    [(PKDashboardPassMessage *)v14 setMessage:v12];
    id v16 = PKLocalizedCocoonString(&cfstr_DashboardLearn.isa);
    [(PKDashboardPassMessage *)v14 setButtonTitle:v16];

    [(PKDashboardPassMessage *)v14 setShowDisclosure:1];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __125__PKPayLaterDashboardMessageComposer__payLaterWelcomeMessageForSharedCacheKey_identifierKey_hasValidPlanCount_messageString___block_invoke;
    v24[3] = &unk_1E59CB010;
    objc_copyWeak(&v26, &location);
    id v17 = v10;
    id v25 = v17;
    [(PKDashboardPassMessage *)v14 setActionOnButtonPress:v24];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __125__PKPayLaterDashboardMessageComposer__payLaterWelcomeMessageForSharedCacheKey_identifierKey_hasValidPlanCount_messageString___block_invoke_2;
    v21[3] = &unk_1E59CB010;
    objc_copyWeak(&v23, &location);
    id v22 = v17;
    [(PKDashboardPassMessage *)v14 setActionOnDismiss:v21];
    id v18 = PKDashboardMessagePassIcon(self->_payLaterPass);
    [(PKDashboardPassMessage *)v14 setImage:v18];

    v19 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v14 priority:600 date:0];
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v26);
  }
  else
  {
    v19 = 0;
  }
  objc_destroyWeak(&location);

  return v19;
}

void __125__PKPayLaterDashboardMessageComposer__payLaterWelcomeMessageForSharedCacheKey_identifierKey_hasValidPlanCount_messageString___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    BOOL v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://apple.co/paylater"];
    [v2 openURL:v3 configuration:0 completionHandler:0];

    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
  }
}

void __125__PKPayLaterDashboardMessageComposer__payLaterWelcomeMessageForSharedCacheKey_identifierKey_hasValidPlanCount_messageString___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_autoPayAvailableForBNPL
{
  id v3 = PKLocalizedCocoonString(&cfstr_DashboardTurnO.isa);
  uint64_t v4 = [(PKPayLaterDashboardMessageComposer *)self _autoPayAvailableMessageForSharedCachePrefix:@"PKSharedCachePayLaterDashboardAutoPayAvailableForBNPLPrefix-Loan-%@" identifierKeyPrefix:@"PayLaterAutoPayAvailableForBNPL-Loan-%@" productType:1 messageString:v3];

  return v4;
}

- (id)_autoPayAvailableMessageForSharedCachePrefix:(id)a3 identifierKeyPrefix:(id)a4 productType:(unint64_t)a5 messageString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  v14 = [NSString stringWithFormat:@"%@%@", v11, v13];
  v15 = [NSString stringWithFormat:@"%@%@", v10, v13];
  unint64_t context = self->_context;
  if (context != 2)
  {
    if (context != 1) {
      goto LABEL_11;
    }
    financingPlan = self->_financingPlan;
    if (!financingPlan || [(PKPayLaterFinancingPlan *)financingPlan productType] != a5) {
      goto LABEL_11;
    }
    id v18 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
    if ([v18 autoPayment])
    {

      goto LABEL_11;
    }
    uint64_t v19 = [(PKPayLaterFinancingPlan *)self->_financingPlan state];

    if (v19 != 1) {
      goto LABEL_11;
    }
  }
  if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
  {
    objc_initWeak(location, self);
    v20 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v20 setIdentifier:v14];
    uint64_t v21 = PKLocalizedCocoonString(&cfstr_DashboardTurnO_0.isa);
    [(PKDashboardPassMessage *)v20 setTitle:v21];

    [(PKDashboardPassMessage *)v20 setMessage:v12];
    id v22 = PKLocalizedCocoonString(&cfstr_DashboardTurnO_1.isa);
    [(PKDashboardPassMessage *)v20 setButtonTitle:v22];

    [(PKDashboardPassMessage *)v20 setShowDisclosure:1];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke;
    v29[3] = &unk_1E59CB378;
    objc_copyWeak(&v30, location);
    v29[4] = v14;
    v29[5] = v15;
    [(PKDashboardPassMessage *)v20 setActionOnButtonPress:v29];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke_3;
    v27[3] = &unk_1E59CB010;
    objc_copyWeak(&v28, location);
    v27[4] = v15;
    [(PKDashboardPassMessage *)v20 setActionOnDismiss:v27];
    id v23 = [MEMORY[0x1E4FB1618] labelColor];
    v24 = [(PKPayLaterDashboardMessageComposer *)self _systemImageWithName:@"arrow.triangle.2.circlepath" tintColor:v23];
    [(PKDashboardPassMessage *)v20 setImage:v24];

    id v25 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v20 priority:400 date:0];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);

    objc_destroyWeak(location);
    goto LABEL_12;
  }
LABEL_11:
  id v25 = 0;
LABEL_12:

  return v25;
}

void __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showSpinnerForDashboardMessageIdentifier:*(void *)(a1 + 32) showSpinner:1];
    v5 = [[PKPayLaterChangeFundingSourceViewController alloc] initWithFinancingPlan:v4[13] payLaterPass:v4[3] paymentIntentController:v4[5]];
    v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke_2;
    v8[3] = &unk_1E59CE810;
    objc_copyWeak(&v11, v2);
    BOOL v7 = v6;
    char v9 = v7;
    int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    [(PKPayLaterChangeFundingSourceViewController *)v5 preflightWithCompletion:v8];

    objc_destroyWeak(&v11);
  }
}

void __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v11 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = objc_loadWeakRetained(WeakRetained + 1);
      [v7 dashboardMessageComposer:v6 requestPresentViewController:*(void *)(a1 + 32)];

      [v6 _updateSharedCacheForKey:*(void *)(a1 + 40) value:1 reloadMessages:1];
    }
    else if (v11)
    {
      id v8 = PKAccountDisplayableError();
      id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);

      if (v9)
      {
        id v10 = objc_loadWeakRetained(v6 + 1);
        [v10 dashboardMessageComposer:v6 requestPresentViewController:v9];
      }
    }
    [v6 _showSpinnerForDashboardMessageIdentifier:*(void *)(a1 + 48) showSpinner:0];
  }
}

void __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_payLaterFinancingPlanPastDue
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke;
  aBlock[3] = &unk_1E59D8720;
  id v37 = v3;
  id v53 = v37;
  uint64_t v4 = _Block_copy(aBlock);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_3;
  v50[3] = &unk_1E59CACF0;
  id v35 = v4;
  id v51 = v35;
  uint64_t v36 = (void (**)(id, void))_Block_copy(v50);
  unint64_t context = self->_context;
  switch(context)
  {
    case 0uLL:
      uint64_t v8 = 48;
      id v9 = v36;
LABEL_10:
      v9[2](v9, *(Class *)((char *)&self->super.isa + v8));
      break;
    case 1uLL:
      uint64_t v8 = 104;
      id v9 = (void (**)(id, void))v35;
      goto LABEL_10;
    case 2uLL:
      financingPlan = self->_financingPlan;
      id v7 = financingPlan;
      if (!financingPlan)
      {
        id v7 = [(NSArray *)self->_allFinancingPlans firstObject];
      }
      [v37 safelyAddObject:v7];
      if (!financingPlan) {

      }
      break;
  }
  if ([v37 count])
  {
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v37;
    uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v10)
    {
      uint64_t v40 = *(void *)v47;
      do
      {
        uint64_t v41 = v10;
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v47 != v40) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v13 = [v12 merchant];
          v14 = [v13 displayName];

          v15 = [v12 scheduleSummary];
          id v16 = [v15 installments];
          id v17 = objc_msgSend(v16, "pk_firstObjectPassingTest:", &__block_literal_global_242);

          shortDateFormatter = self->_shortDateFormatter;
          uint64_t v19 = [v17 dueDate];
          v20 = [(NSDateFormatter *)shortDateFormatter stringFromDate:v19];

          if (v17)
          {
            id v21 = [NSString alloc];
            id v22 = [v12 planIdentifier];
            id v23 = (void *)[v21 initWithFormat:@"%@-%@", @"PayLaterPastDue-FOP-Loan", v22];

            v24 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v24 setIdentifier:v23];
            id v25 = PKLocalizedCocoonString(&cfstr_DashboardPastD.isa);
            [(PKDashboardPassMessage *)v24 setTitle:v25];

            id v26 = PKLocalizedCocoonString(&cfstr_DashboardPastD_0.isa, &stru_1EF1B5770.isa, v14, v20);
            [(PKDashboardPassMessage *)v24 setMessage:v26];

            v27 = PKLocalizedCocoonString(&cfstr_DashboardMakeP.isa);
            [(PKDashboardPassMessage *)v24 setButtonTitle:v27];

            [(PKDashboardPassMessage *)v24 setShowDisclosure:1];
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_5;
            v42[3] = &unk_1E59CB378;
            objc_copyWeak(&v45, &location);
            id v28 = v23;
            id v43 = v28;
            v44 = v12;
            [(PKDashboardPassMessage *)v24 setActionOnButtonPress:v42];
            v29 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
            [(PKDashboardPassMessage *)v24 setImage:v29];

            id v30 = [PKPayLaterDashboardMessage alloc];
            id v31 = [v12 lastUpdated];
            id v32 = [(PKPayLaterDashboardMessage *)v30 initWithMessage:v24 priority:800 date:v31];
            [v39 addObject:v32];

            objc_destroyWeak(&v45);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v10);
    }

    objc_super v33 = (void *)[v39 copy];
  }
  else
  {
    objc_super v33 = 0;
  }

  objc_destroyWeak(&location);

  return v33;
}

void __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 scheduleSummary];
  uint64_t v4 = [v3 installments];
  int v5 = objc_msgSend(v4, "pk_containsObjectPassingTest:", &__block_literal_global_238);

  if (v5) {
    [*(id *)(a1 + 32) safelyAddObject:v6];
  }
}

BOOL __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 status] == 4;
}

void __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

BOOL __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 status] == 4;
}

void __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_5(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showSpinnerForDashboardMessageIdentifier:*(void *)(a1 + 32) showSpinner:1];
    uint64_t v5 = [[PKPayLaterMakePaymentViewController alloc] initWithFinancingPlan:*(void *)(a1 + 40) paymentIntentController:v4[5]];
    uint64_t v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_6;
    v8[3] = &unk_1E59CC710;
    objc_copyWeak(&v11, v2);
    uint64_t v7 = v6;
    long long v9 = v7;
    id v10 = *(id *)(a1 + 32);
    [(PKPayLaterMakePaymentViewController *)v5 preflightWithCompletion:v8];

    objc_destroyWeak(&v11);
  }
}

void __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_6(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = objc_loadWeakRetained(WeakRetained + 1);
      [v7 dashboardMessageComposer:v6 requestPresentViewController:*(void *)(a1 + 32)];
    }
    else
    {
      if (!v10)
      {
LABEL_8:
        [v6 _showSpinnerForDashboardMessageIdentifier:*(void *)(a1 + 40) showSpinner:0];
        goto LABEL_9;
      }
      long long v8 = PKAccountDisplayableError();
      id v7 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);

      if (v7)
      {
        id v9 = objc_loadWeakRetained(v6 + 1);
        [v9 dashboardMessageComposer:v6 requestPresentViewController:v7];
      }
    }

    goto LABEL_8;
  }
LABEL_9:
}

- (id)_payLaterFinancingDeclinedPayments
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke;
  aBlock[3] = &unk_1E59D8768;
  void aBlock[4] = self;
  id v31 = v2;
  id v54 = v31;
  id v34 = (void (**)(void *, void))_Block_copy(aBlock);
  unint64_t context = self->_context;
  switch(context)
  {
    case 0uLL:
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v5 = self->_allFinancingPlans;
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v50 != v7) {
              objc_enumerationMutation(v5);
            }
            v34[2](v34, *(void *)(*((void *)&v49 + 1) + 8 * i));
          }
          uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v6);
      }
LABEL_16:

      break;
    case 1uLL:
      ((void (**)(void *, PKPayLaterFinancingPlan *))v34)[2](v34, self->_financingPlan);
      break;
    case 2uLL:
      financingPlan = self->_financingPlan;
      uint64_t v5 = (NSArray *)financingPlan;
      if (!financingPlan)
      {
        uint64_t v5 = [(NSArray *)self->_allFinancingPlans firstObject];
      }
      [v31 safelyAddObject:v5];
      if (!financingPlan) {
        goto LABEL_16;
      }
      break;
  }
  if ([v31 count])
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v31;
    uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    if (v9)
    {
      uint64_t v37 = *(void *)v46;
      do
      {
        uint64_t v38 = v9;
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          id v12 = [v11 merchant];
          uint64_t v40 = [v12 displayName];

          uint64_t v13 = [v11 scheduleSummary];
          v14 = [v13 payments];
          v15 = objc_msgSend(v14, "pk_lastObjectPassingTest:", &__block_literal_global_261);

          id v16 = [v15 amount];
          id v17 = [v16 formattedStringValue];

          if (v15)
          {
            id v18 = [v15 postedDate];
            if (v18)
            {
              id v39 = PKMediumDateString();
            }
            else
            {
              id v39 = 0;
            }
            uint64_t v19 = [v15 paymentIdentifier];
            v20 = [NSString stringWithFormat:@"PayLaterDeclinedPayment-Loan-%@", v19];
            id v21 = [NSString stringWithFormat:@"PKSharedCachePayLaterDashboardDeclinedPayment-Loan-%@", v19];
            if ((PKSharedCacheGetBoolForKey() & 1) == 0)
            {
              if (v39) {
                PKLocalizedCocoonString(&cfstr_DashboardDecli.isa, &stru_1EF1B9A70.isa, v17, v39, v40);
              }
              else {
              uint64_t v36 = PKLocalizedCocoonString(&cfstr_DashboardDecli_0.isa, &stru_1EF1B5770.isa, v17, v40);
              }
              id v22 = objc_alloc_init(PKDashboardPassMessage);
              [(PKDashboardPassMessage *)v22 setIdentifier:v20];
              id v23 = PKLocalizedCocoonString(&cfstr_DashboardDecli_1.isa);
              [(PKDashboardPassMessage *)v22 setTitle:v23];

              [(PKDashboardPassMessage *)v22 setMessage:v36];
              v24 = PKLocalizedCocoonString(&cfstr_DashboardMakeP.isa);
              [(PKDashboardPassMessage *)v22 setButtonTitle:v24];

              [(PKDashboardPassMessage *)v22 setShowDisclosure:1];
              v43[0] = MEMORY[0x1E4F143A8];
              v43[1] = 3221225472;
              v43[2] = __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_4;
              v43[3] = &unk_1E59CE888;
              objc_copyWeak(&v44, &location);
              v43[4] = v20;
              v43[5] = v11;
              v43[6] = v21;
              [(PKDashboardPassMessage *)v22 setActionOnButtonPress:v43];
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_6;
              v41[3] = &unk_1E59CB010;
              objc_copyWeak(&v42, &location);
              v41[4] = v21;
              [(PKDashboardPassMessage *)v22 setActionOnDismiss:v41];
              id v25 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
              [(PKDashboardPassMessage *)v22 setImage:v25];

              id v26 = [PKPayLaterDashboardMessage alloc];
              v27 = [v15 postedDate];
              id v28 = [(PKPayLaterDashboardMessage *)v26 initWithMessage:v22 priority:600 date:v27];
              [v32 addObject:v28];

              objc_destroyWeak(&v42);
              objc_destroyWeak(&v44);
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
      }
      while (v9);
    }

    v29 = (void *)[v32 copy];
  }
  else
  {
    v29 = 0;
  }

  objc_destroyWeak(&location);

  return v29;
}

void __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 56)) {
    goto LABEL_13;
  }
  uint64_t v4 = [v3 scheduleSummary];
  uint64_t v5 = [v4 nextDueInstallment];

  uint64_t v6 = [v5 dueDate];
  [v12 state];
  char IsPending = PKPayLaterFinancingPlanStateIsPending();
  int v8 = objc_msgSend(MEMORY[0x1E4F84998], "canMakePaymentsWithAccountState:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "state"));

  id v3 = v12;
  if ((IsPending & 1) == 0 && v5 && v6 && v8)
  {
LABEL_13:
    uint64_t v9 = [v3 scheduleSummary];
    id v10 = [v9 payments];
    int v11 = objc_msgSend(v10, "pk_containsObjectPassingTest:", &__block_literal_global_259);

    id v3 = v12;
    if (v11)
    {
      [*(id *)(a1 + 40) safelyAddObject:v12];
      id v3 = v12;
    }
  }
}

BOOL __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 5;
}

BOOL __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 type] == 5;
}

void __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_4(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showSpinnerForDashboardMessageIdentifier:*(void *)(a1 + 32) showSpinner:1];
    uint64_t v5 = [[PKPayLaterMakePaymentViewController alloc] initWithFinancingPlan:*(void *)(a1 + 40) paymentIntentController:v4[5]];
    uint64_t v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_5;
    v9[3] = &unk_1E59CE810;
    objc_copyWeak(&v13, v2);
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = v7;
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)(a1 + 32);
    [(PKPayLaterMakePaymentViewController *)v5 preflightWithCompletion:v9];

    objc_destroyWeak(&v13);
  }
}

void __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v11 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = objc_loadWeakRetained(WeakRetained + 1);
      [v7 dashboardMessageComposer:v6 requestPresentViewController:*(void *)(a1 + 32)];

      [v6 _updateSharedCacheForKey:*(void *)(a1 + 40) value:1 reloadMessages:1];
    }
    else if (v11)
    {
      uint64_t v8 = PKAccountDisplayableError();
      id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);

      if (v9)
      {
        id v10 = objc_loadWeakRetained(v6 + 1);
        [v10 dashboardMessageComposer:v6 requestPresentViewController:v9];
      }
    }
    [v6 _showSpinnerForDashboardMessageIdentifier:*(void *)(a1 + 48) showSpinner:0];
  }
}

void __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanPaymentReversalMessage
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke;
  aBlock[3] = &unk_1E59D8720;
  id v27 = v3;
  id v44 = v27;
  uint64_t v4 = _Block_copy(aBlock);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_2;
  v41[3] = &unk_1E59CACF0;
  id v25 = v4;
  id v42 = v25;
  id v26 = (void (**)(void *, NSArray *))_Block_copy(v41);
  unint64_t context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      (*((void (**)(id, PKPayLaterFinancingPlan *))v25 + 2))(v25, self->_financingPlan);
    }
    else if (context == 2)
    {
      if (self->_financingPlan)
      {
        objc_msgSend(v27, "safelyAddObject:");
      }
      else
      {
        uint64_t v6 = [(NSArray *)self->_allFinancingPlans firstObject];
        [v27 safelyAddObject:v6];
      }
    }
  }
  else
  {
    v26[2](v26, self->_allFinancingPlans);
  }
  if ([v27 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    long long v37 = 0u;
    id obj = v27;
    uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v31)
    {
      uint64_t v30 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v9 = NSString;
          id v10 = [v8 planIdentifier];
          id v11 = [v9 stringWithFormat:@"PKSharedCachePayLaterDashboardPaymentReversalPrefix-FOP-Loan-%@", v10];

          uint64_t v12 = NSString;
          id v13 = [v8 planIdentifier];
          v14 = [v12 stringWithFormat:@"PayLaterPaymentReversalPrefix-FOP-Loan-%@", v13];

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            v15 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v15 setIdentifier:v14];
            id v16 = PKLocalizedCocoonString(&cfstr_DashboardPayme.isa);
            [(PKDashboardPassMessage *)v15 setTitle:v16];

            id v17 = [v8 merchant];
            id v18 = [v17 displayName];
            uint64_t v19 = PKLocalizedCocoonString(&cfstr_DashboardPayme_0.isa, &stru_1EF1B4C70.isa, v18);
            [(PKDashboardPassMessage *)v15 setMessage:v19];

            if ((self->_context | 2) == 2)
            {
              v20 = PKLocalizedCocoonString(&cfstr_DashboardViewP.isa);
              [(PKDashboardPassMessage *)v15 setButtonTitle:v20];

              [(PKDashboardPassMessage *)v15 setShowDisclosure:1];
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v34[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_3;
              v34[3] = &unk_1E59CE888;
              objc_copyWeak(&v35, &location);
              v34[4] = self;
              v34[5] = v8;
              v34[6] = v11;
              [(PKDashboardPassMessage *)v15 setActionOnButtonPress:v34];
              objc_destroyWeak(&v35);
            }
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_4;
            v32[3] = &unk_1E59CB010;
            objc_copyWeak(&v33, &location);
            v32[4] = v11;
            [(PKDashboardPassMessage *)v15 setActionOnDismiss:v32];
            id v21 = [(PKPayLaterDashboardMessageComposer *)self _reverseImage];
            [(PKDashboardPassMessage *)v15 setImage:v21];

            id v22 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v15 priority:400 date:0];
            [v29 addObject:v22];

            objc_destroyWeak(&v33);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v31);
    }

    id v23 = (void *)[v29 copy];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

void __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 scheduleSummary];
  uint64_t v4 = [v3 scheduleSummaryReason];

  if (v4 == 9) {
    [*(id *)(a1 + 32) safelyAddObject:v5];
  }
}

void __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    [v3 dashboardMessageComposer:*(void *)(a1 + 32) requestPresentFinancingPlanDetails:*(void *)(a1 + 40)];

    [v4 _updateSharedCacheForKey:*(void *)(a1 + 48) value:1 reloadMessages:1];
    id WeakRetained = v4;
  }
}

void __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_accountRestrictedNoPastDuePlans
{
  char v3 = [(NSArray *)self->_allFinancingPlans pk_containsObjectPassingTest:&__block_literal_global_288];
  unint64_t context = self->_context;
  if (context == 2
    || !context
    && (char v5 = v3, (payLaterAccount = self->_payLaterAccount) != 0)
    && ([(PKAccount *)payLaterAccount state] != 2 ? (char v7 = 1) : (char v7 = v5), (v7 & 1) == 0))
  {
    objc_initWeak(&location, self);
    long long v9 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v9 setIdentifier:@"PayLaterAccountRestrictedNoPastDuePlans-FOP"];
    long long v10 = PKLocalizedCocoonString(&cfstr_DashboardAccou_1.isa);
    [(PKDashboardPassMessage *)v9 setTitle:v10];

    long long v11 = PKLocalizedCocoonString(&cfstr_DashboardAccou_2.isa);
    [(PKDashboardPassMessage *)v9 setMessage:v11];

    uint64_t v12 = PKLocalizedCocoonString(&cfstr_DashboardChatW.isa);
    [(PKDashboardPassMessage *)v9 setButtonTitle:v12];

    [(PKDashboardPassMessage *)v9 setShowDisclosure:1];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __70__PKPayLaterDashboardMessageComposer__accountRestrictedNoPastDuePlans__block_invoke_2;
    id v18 = &unk_1E59CA7F8;
    objc_copyWeak(&v19, &location);
    [(PKDashboardPassMessage *)v9 setActionOnButtonPress:&v15];
    uint64_t v13 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
    [(PKDashboardPassMessage *)v9 setImage:v13];

    long long v8 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v9 priority:1000 date:0];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

BOOL __70__PKPayLaterDashboardMessageComposer__accountRestrictedNoPastDuePlans__block_invoke(uint64_t a1, void *a2)
{
  return [a2 state] == 4;
}

void __70__PKPayLaterDashboardMessageComposer__accountRestrictedNoPastDuePlans__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentBusinessChatForApplePayLaterAccountWithTopicType:12];
    id WeakRetained = v2;
  }
}

- (id)_accountRestrictedWithPastDuePlans
{
  int v3 = [(NSArray *)self->_allFinancingPlans pk_containsObjectPassingTest:&__block_literal_global_299];
  unint64_t context = self->_context;
  if (context == 2
    || !context
    && (int v5 = v3, (payLaterAccount = self->_payLaterAccount) != 0)
    && ([(PKAccount *)payLaterAccount state] == 2 ? (int v7 = v5) : (int v7 = 0), v7 == 1))
  {
    objc_initWeak(&location, self);
    long long v8 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v8 setIdentifier:@"PayLaterAccountRestrictedWithPastDuePlans-FOP"];
    long long v9 = PKLocalizedCocoonString(&cfstr_DashboardAccou_1.isa);
    [(PKDashboardPassMessage *)v8 setTitle:v9];

    long long v10 = PKLocalizedCocoonString(&cfstr_DashboardAccou_3.isa);
    [(PKDashboardPassMessage *)v8 setMessage:v10];

    long long v11 = PKLocalizedCocoonString(&cfstr_DashboardChatW.isa);
    [(PKDashboardPassMessage *)v8 setButtonTitle:v11];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __72__PKPayLaterDashboardMessageComposer__accountRestrictedWithPastDuePlans__block_invoke_2;
    id v18 = &unk_1E59CA7F8;
    objc_copyWeak(&v19, &location);
    [(PKDashboardPassMessage *)v8 setActionOnButtonPress:&v15];
    uint64_t v12 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
    [(PKDashboardPassMessage *)v8 setImage:v12];

    uint64_t v13 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v8 priority:1000 date:0];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

BOOL __72__PKPayLaterDashboardMessageComposer__accountRestrictedWithPastDuePlans__block_invoke(uint64_t a1, void *a2)
{
  return [a2 state] == 4;
}

void __72__PKPayLaterDashboardMessageComposer__accountRestrictedWithPastDuePlans__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentBusinessChatForApplePayLaterAccountWithTopicType:12];
    id WeakRetained = v2;
  }
}

- (id)_accountUnusualActivityDetected
{
  unint64_t context = self->_context;
  if (context == 2
    || !context
    && (payLaterAccount = self->_payLaterAccount) != 0
    && [(PKAccount *)payLaterAccount stateReason] == 5)
  {
    objc_initWeak(&location, self);
    int v5 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v5 setIdentifier:@"PayLaterAccountAccountFraudSuspected-FOP"];
    uint64_t v6 = PKLocalizedCocoonString(&cfstr_DashboardAccou_4.isa);
    [(PKDashboardPassMessage *)v5 setTitle:v6];

    int v7 = PKLocalizedCocoonString(&cfstr_DashboardAccou_5.isa);
    [(PKDashboardPassMessage *)v5 setMessage:v7];

    long long v8 = PKLocalizedCocoonString(&cfstr_DashboardChatW.isa);
    [(PKDashboardPassMessage *)v5 setButtonTitle:v8];

    [(PKDashboardPassMessage *)v5 setShowDisclosure:1];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __69__PKPayLaterDashboardMessageComposer__accountUnusualActivityDetected__block_invoke;
    uint64_t v15 = &unk_1E59CA7F8;
    objc_copyWeak(&v16, &location);
    [(PKDashboardPassMessage *)v5 setActionOnButtonPress:&v12];
    long long v9 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
    [(PKDashboardPassMessage *)v5 setImage:v9];

    long long v10 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v5 priority:800 date:0];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

void __69__PKPayLaterDashboardMessageComposer__accountUnusualActivityDetected__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentBusinessChatForApplePayLaterAccountWithTopicType:13];
    [v2[4] updateWalletBadgeCountWithCompletion:0];
    id WeakRetained = v2;
  }
}

- (id)_accountLocked
{
  unint64_t context = self->_context;
  if (context == 2
    || !context
    && (payLaterAccount = self->_payLaterAccount) != 0
    && [(PKAccount *)payLaterAccount state] == 3)
  {
    objc_initWeak(&location, self);
    int v5 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v5 setIdentifier:@"PayLaterAccountAccountLocked-FOP"];
    uint64_t v6 = PKLocalizedCocoonString(&cfstr_DashboardAccou_6.isa);
    [(PKDashboardPassMessage *)v5 setTitle:v6];

    if ([(PKAccount *)self->_payLaterAccount stateReason] == 15)
    {
      int v7 = PKLocalizedCocoonString(&cfstr_DashboardAccou_7.isa);
      [(PKDashboardPassMessage *)v5 setMessage:v7];
      uint64_t v8 = 15;
    }
    else
    {
      int v7 = PKLocalizedCocoonString(&cfstr_DashboardAccou_8.isa);
      [(PKDashboardPassMessage *)v5 setMessage:v7];
      uint64_t v8 = 14;
    }

    long long v10 = PKLocalizedCocoonString(&cfstr_DashboardChatW.isa);
    [(PKDashboardPassMessage *)v5 setButtonTitle:v10];

    [(PKDashboardPassMessage *)v5 setShowDisclosure:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__PKPayLaterDashboardMessageComposer__accountLocked__block_invoke;
    v13[3] = &unk_1E59CF720;
    objc_copyWeak(v14, &location);
    v14[1] = (id)v8;
    [(PKDashboardPassMessage *)v5 setActionOnButtonPress:v13];
    long long v11 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
    [(PKDashboardPassMessage *)v5 setImage:v11];

    long long v9 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v5 priority:1000 date:0];
    objc_destroyWeak(v14);

    objc_destroyWeak(&location);
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

void __52__PKPayLaterDashboardMessageComposer__accountLocked__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentBusinessChatForApplePayLaterAccountWithTopicType:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (id)_accountClosed
{
  unint64_t context = self->_context;
  if (context == 2
    || !context
    && (payLaterAccount = self->_payLaterAccount) != 0
    && [(PKAccount *)payLaterAccount state] == 4)
  {
    int v5 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v5 setIdentifier:@"PayLaterAccountAccountClosed-FOP"];
    uint64_t v6 = PKLocalizedCocoonString(&cfstr_DashboardAccou_9.isa);
    [(PKDashboardPassMessage *)v5 setTitle:v6];

    int v7 = PKLocalizedCocoonString(&cfstr_DashboardAccou_10.isa);
    [(PKDashboardPassMessage *)v5 setMessage:v7];

    uint64_t v8 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
    [(PKDashboardPassMessage *)v5 setImage:v8];

    long long v9 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v5 priority:1000 date:0];
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (id)_financingPlanDisasterRecovery
{
  id v3 = NSString;
  uint64_t v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  int v5 = [v3 stringWithFormat:@"PKSharedCachePayLaterDashboardPlanDisasterRecoveryPrefix-Loan-%@", v4];

  uint64_t v6 = NSString;
  int v7 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  uint64_t v8 = [v6 stringWithFormat:@"PayLaterPlanDisasterRecovery-Loan-%@", v7];

  unint64_t context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && ([(PKPayLaterFinancingPlan *)financingPlan scheduleSummary],
         long long v11 = objc_claimAutoreleasedReturnValue(),
         uint64_t v12 = [v11 scheduleSummaryReason],
         v11,
         v12 == 1))
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    uint64_t v13 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v13 setIdentifier:v8];
    v14 = PKLocalizedCocoonString(&cfstr_DashboardLoanD.isa);
    [(PKDashboardPassMessage *)v13 setTitle:v14];

    uint64_t v15 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_0.isa);
    [(PKDashboardPassMessage *)v13 setMessage:v15];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanDisasterRecovery__block_invoke;
    v19[3] = &unk_1E59CB010;
    objc_copyWeak(&v20, &location);
    v19[4] = v5;
    [(PKDashboardPassMessage *)v13 setActionOnDismiss:v19];
    id v16 = [(PKPayLaterDashboardMessageComposer *)self _pencilImage];
    [(PKDashboardPassMessage *)v13 setImage:v16];

    id v17 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v13 priority:400 date:0];
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanDisasterRecovery__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanActiveMilitary
{
  id v3 = NSString;
  uint64_t v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  int v5 = [v3 stringWithFormat:@"PKSharedCachePayLaterDashboardPlanActiveMilitaryPrefix-Loan-%@", v4];

  uint64_t v6 = NSString;
  int v7 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  uint64_t v8 = [v6 stringWithFormat:@"PayLaterPlanActiveMilitary-Loan-%@", v7];

  unint64_t context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && ([(PKPayLaterFinancingPlan *)financingPlan scheduleSummary],
         long long v11 = objc_claimAutoreleasedReturnValue(),
         uint64_t v12 = [v11 scheduleSummaryReason],
         v11,
         v12 == 2))
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    uint64_t v13 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v13 setIdentifier:v8];
    v14 = PKLocalizedCocoonString(&cfstr_DashboardLoanA.isa);
    [(PKDashboardPassMessage *)v13 setTitle:v14];

    uint64_t v15 = PKLocalizedCocoonString(&cfstr_DashboardLoanA_0.isa);
    [(PKDashboardPassMessage *)v13 setMessage:v15];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__PKPayLaterDashboardMessageComposer__financingPlanActiveMilitary__block_invoke;
    v19[3] = &unk_1E59CB010;
    objc_copyWeak(&v20, &location);
    v19[4] = v5;
    [(PKDashboardPassMessage *)v13 setActionOnDismiss:v19];
    id v16 = [(PKPayLaterDashboardMessageComposer *)self _pencilImage];
    [(PKDashboardPassMessage *)v13 setImage:v16];

    id v17 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v13 priority:400 date:0];
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __66__PKPayLaterDashboardMessageComposer__financingPlanActiveMilitary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanHardshipBenefitorPlan
{
  id v3 = NSString;
  uint64_t v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  int v5 = [v3 stringWithFormat:@"PKSharedCachePayLaterDashboardPlanHardshipBenefitorPlanPrefix-Loan-%@", v4];

  uint64_t v6 = NSString;
  int v7 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  uint64_t v8 = [v6 stringWithFormat:@"PayLaterPlanHardshipBenefitorPlan-Loan-%@", v7];

  unint64_t context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && ([(PKPayLaterFinancingPlan *)financingPlan scheduleSummary],
         long long v11 = objc_claimAutoreleasedReturnValue(),
         uint64_t v12 = [v11 scheduleSummaryReason],
         v11,
         v12 == 3))
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    uint64_t v13 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v13 setIdentifier:v8];
    v14 = PKLocalizedCocoonString(&cfstr_DashboardLoanH.isa);
    [(PKDashboardPassMessage *)v13 setTitle:v14];

    uint64_t v15 = PKLocalizedCocoonString(&cfstr_DashboardLoanH_0.isa);
    [(PKDashboardPassMessage *)v13 setMessage:v15];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__PKPayLaterDashboardMessageComposer__financingPlanHardshipBenefitorPlan__block_invoke;
    v19[3] = &unk_1E59CB010;
    objc_copyWeak(&v20, &location);
    v19[4] = v5;
    [(PKDashboardPassMessage *)v13 setActionOnDismiss:v19];
    id v16 = [(PKPayLaterDashboardMessageComposer *)self _pencilImage];
    [(PKDashboardPassMessage *)v13 setImage:v16];

    id v17 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v13 priority:400 date:0];
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __73__PKPayLaterDashboardMessageComposer__financingPlanHardshipBenefitorPlan__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanRAPDeferral
{
  id v3 = NSString;
  uint64_t v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  int v5 = [v3 stringWithFormat:@"PKSharedCachePayLaterDashboardPlanRAPDeferralPrefix-Loan-%@", v4];

  uint64_t v6 = NSString;
  int v7 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  uint64_t v8 = [v6 stringWithFormat:@"PayLaterPlanRAPDeferral-Loan-%@", v7];

  unint64_t context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && ([(PKPayLaterFinancingPlan *)financingPlan scheduleSummary],
         long long v11 = objc_claimAutoreleasedReturnValue(),
         uint64_t v12 = [v11 scheduleSummaryReason],
         v11,
         v12 == 7))
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    uint64_t v13 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v13 setIdentifier:v8];
    v14 = PKLocalizedCocoonString(&cfstr_DashboardLoanR.isa);
    [(PKDashboardPassMessage *)v13 setTitle:v14];

    uint64_t v15 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
    id v16 = [v15 displayName];
    id v17 = PKLocalizedCocoonString(&cfstr_DashboardLoanR_0.isa, &stru_1EF1B4C70.isa, v16);
    [(PKDashboardPassMessage *)v13 setMessage:v17];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63__PKPayLaterDashboardMessageComposer__financingPlanRAPDeferral__block_invoke;
    v21[3] = &unk_1E59CB010;
    objc_copyWeak(&v22, &location);
    void v21[4] = v5;
    [(PKDashboardPassMessage *)v13 setActionOnDismiss:v21];
    id v18 = [(PKPayLaterDashboardMessageComposer *)self _pencilImage];
    [(PKDashboardPassMessage *)v13 setImage:v18];

    id v19 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v13 priority:400 date:0];
    objc_destroyWeak(&v22);

    objc_destroyWeak(&location);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __63__PKPayLaterDashboardMessageComposer__financingPlanRAPDeferral__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanInProgressDisputes
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke;
  aBlock[3] = &unk_1E59D8768;
  id v6 = v4;
  id v46 = v6;
  id v7 = v5;
  id v47 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  long long v9 = v8;
  unint64_t context = self->_context;
  if (context == 1)
  {
    (*((void (**)(void *, PKPayLaterFinancingPlan *))v8 + 2))(v8, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      uint64_t v12 = financingPlan;
    }
    else
    {
      uint64_t v12 = [(NSArray *)self->_allFinancingPlans firstObject];
    }
    uint64_t v13 = v12;
    v14 = [(PKPayLaterFinancingPlan *)v12 disputes];
    uint64_t v15 = [v14 firstObject];

    [v6 safelyAddObject:v15];
    id v16 = [v15 identifier];
    [v7 setObject:v13 forKey:v16];
  }
  if ([v6 count])
  {
    id v33 = v9;
    id v34 = v7;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_2;
    v41[3] = &unk_1E59D87D0;
    id v42 = v7;
    id v43 = self;
    id v17 = self;
    id v35 = v3;
    id v32 = v3;
    id v44 = v32;
    id v18 = (void (**)(void *, void *, uint64_t, void *, void *))_Block_copy(v41);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v6;
    uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (!v19) {
      goto LABEL_22;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    while (1)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v31 = [v23 identifier];
        v24 = PKStringWithValidatedFormat();

        id v25 = NSString;
        id v26 = objc_msgSend(v23, "identifier", v31);
        id v27 = [v25 stringWithFormat:@"PayLaterPlanDisputeInProgress-Loan-%@", v26];

        if (PKSharedCacheGetBoolForKey())
        {
          if (v17->_isAllContext) {
            goto LABEL_18;
          }
        }
        else
        {
          if (v17->_isAllContext)
          {
LABEL_18:
            id v28 = [NSString stringWithFormat:@"%@-%@", v27, @"bnpl"];
            v18[2](v18, v23, 1, v24, v28);

            goto LABEL_20;
          }
          v18[2](v18, v23, [(PKPayLaterFinancingPlan *)v17->_financingPlan productType], v24, v27);
        }
LABEL_20:
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
      if (!v20)
      {
LABEL_22:

        id v29 = (void *)[v32 copy];
        id v3 = v35;
        long long v9 = v33;
        id v7 = v34;
        goto LABEL_24;
      }
    }
  }
  id v29 = 0;
LABEL_24:

  return v29;
}

void __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(v3, "disputes", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 state] == 1)
        {
          [*(id *)(a1 + 32) safelyAddObject:v9];
          long long v10 = *(void **)(a1 + 40);
          long long v11 = [v9 identifier];
          [v10 setObject:v3 forKey:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v37 = a4;
  id v10 = a5;
  long long v11 = *(void **)(a1 + 32);
  long long v12 = [v9 identifier];
  long long v13 = [v11 objectForKey:v12];

  long long v14 = (void *)MEMORY[0x1E4F1CAD0];
  long long v15 = [v9 appliedPayments];
  id v16 = objc_msgSend(v15, "pk_arrayByApplyingBlock:", &__block_literal_global_352);
  uint64_t v17 = [v14 setWithArray:v16];

  id v18 = [*(id *)(*(void *)(a1 + 40) + 104) scheduleSummary];
  uint64_t v19 = [v18 payments];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_4;
  v46[3] = &unk_1E59CBA40;
  id v20 = v17;
  id v47 = v20;
  uint64_t v21 = objc_msgSend(v19, "pk_firstObjectPassingTest:", v46);

  id v22 = [v21 amount];
  id v23 = [v22 formattedStringValue];

  uint64_t v36 = v20;
  if (a3 == 1)
  {
    if (v21 && [v23 length])
    {
      uint64_t v24 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_1.isa, &stru_1EF1B4C70.isa, v23);
    }
    else
    {
      uint64_t v24 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_2.isa);
    }
    id v25 = (void *)v24;
  }
  else
  {
    id v25 = 0;
  }
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v26 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v26 setIdentifier:v10];
  id v27 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_3.isa);
  [(PKDashboardPassMessage *)v26 setTitle:v27];

  [(PKDashboardPassMessage *)v26 setMessage:v25];
  id v28 = PKLocalizedCocoonString(&cfstr_DashboardLearn.isa);
  [(PKDashboardPassMessage *)v26 setButtonTitle:v28];

  [(PKDashboardPassMessage *)v26 setShowDisclosure:1];
  id v35 = v25;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_5;
  v41[3] = &unk_1E59CB378;
  objc_copyWeak(&v44, &location);
  id v29 = v13;
  id v42 = v29;
  id v30 = v10;
  id v43 = v30;
  [(PKDashboardPassMessage *)v26 setActionOnButtonPress:v41];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_6;
  v38[3] = &unk_1E59CB010;
  objc_copyWeak(&v40, &location);
  id v31 = v37;
  id v39 = v31;
  [(PKDashboardPassMessage *)v26 setActionOnDismiss:v38];
  id v32 = [*(id *)(a1 + 40) _flagImage];
  [(PKDashboardPassMessage *)v26 setImage:v32];

  id v33 = *(void **)(a1 + 48);
  id v34 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v26 priority:600 date:0];
  [v33 addObject:v34];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&location);
}

uint64_t __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 paymentIdentifier];
}

uint64_t __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 2)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 paymentIdentifier];
    uint64_t v6 = [v4 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _displayDisputeExplanationViewControllerForFinancingPlan:*(void *)(a1 + 32) contentType:11 messageIdentifier:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanEvidenceRequestedDisputes
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke;
  aBlock[3] = &unk_1E59D8720;
  id v30 = v3;
  id v45 = v30;
  id v29 = (void (**)(void *, PKPayLaterFinancingPlan *))_Block_copy(aBlock);
  unint64_t context = self->_context;
  if (context == 1)
  {
    v29[2](v29, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      uint64_t v6 = financingPlan;
    }
    else
    {
      uint64_t v6 = [(NSArray *)self->_allFinancingPlans firstObject];
    }
    uint64_t v7 = v6;
    uint64_t v8 = [(PKPayLaterFinancingPlan *)v6 disputes];
    id v9 = [v8 firstObject];

    [v30 safelyAddObject:v9];
  }
  if ([v30 count])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v30;
    uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v41 != v33) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v28 = [v11 identifier];
          long long v12 = PKStringWithValidatedFormat();

          long long v13 = NSString;
          long long v14 = objc_msgSend(v11, "identifier", v28);
          long long v15 = [v13 stringWithFormat:@"PayLaterPlanDisputeEvidenceRequired-Loan-%@", v14];

          id v16 = [v11 deadlineDate];
          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            uint64_t v17 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v17 setIdentifier:v15];
            id v18 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_4.isa);
            [(PKDashboardPassMessage *)v17 setTitle:v18];

            uint64_t v19 = [(NSDateFormatter *)self->_shortDateFormatter stringFromDate:v16];
            id v20 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_5.isa, &stru_1EF1B4C70.isa, v19);
            [(PKDashboardPassMessage *)v17 setMessage:v20];

            uint64_t v21 = PKLocalizedCocoonString(&cfstr_DashboardLearn.isa);
            [(PKDashboardPassMessage *)v17 setButtonTitle:v21];

            [(PKDashboardPassMessage *)v17 setShowDisclosure:1];
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke_2;
            v37[3] = &unk_1E59CB010;
            objc_copyWeak(&v38, &location);
            v37[4] = v11;
            [(PKDashboardPassMessage *)v17 setActionOnButtonPress:v37];
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke_3;
            v35[3] = &unk_1E59CB010;
            objc_copyWeak(&v36, &location);
            v35[4] = v12;
            [(PKDashboardPassMessage *)v17 setActionOnDismiss:v35];
            id v22 = [(PKPayLaterDashboardMessageComposer *)self _flagImage];
            [(PKDashboardPassMessage *)v17 setImage:v22];

            id v23 = [PKPayLaterDashboardMessage alloc];
            uint64_t v24 = [v11 lastUpdated];
            id v25 = [(PKPayLaterDashboardMessage *)v23 initWithMessage:v17 priority:600 date:v24];
            [v32 addObject:v25];

            objc_destroyWeak(&v36);
            objc_destroyWeak(&v38);

            objc_destroyWeak(&location);
          }
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v34);
    }

    id v26 = (void *)[v32 copy];
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

void __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a2, "disputes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 state] == 2) {
          [*(id *)(a1 + 32) safelyAddObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _displayDisputeEvidenceRequiredViewControllerForFinancingPlan:WeakRetained[13] dispute:*(void *)(a1 + 32)];
    [v3[4] updateWalletBadgeCountWithCompletion:0];
    id WeakRetained = v3;
  }
}

void __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    [v3[4] updateWalletBadgeCountWithCompletion:0];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanApprovedDisputes
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke;
  aBlock[3] = &unk_1E59D8768;
  id v35 = v3;
  id v59 = v35;
  id v41 = v2;
  id v60 = v41;
  uint64_t v4 = _Block_copy(aBlock);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_4;
  v56[3] = &unk_1E59CACF0;
  id v33 = v4;
  id v57 = v33;
  uint64_t v34 = (void (**)(void *, NSArray *))_Block_copy(v56);
  unint64_t context = self->_context;
  if (!context)
  {
    v34[2](v34, self->_allFinancingPlans);
LABEL_12:
    long long v40 = @"PKSharedCachePayLaterDashboardPlanDisputeApproved-FOP-%@";
    long long v9 = @"PayLaterPlanDisputeApproved-FOP-%@";
    goto LABEL_13;
  }
  if (context != 1)
  {
    if (context == 2)
    {
      financingPlan = self->_financingPlan;
      if (financingPlan)
      {
        uint64_t v7 = financingPlan;
      }
      else
      {
        uint64_t v7 = [(NSArray *)self->_allFinancingPlans firstObject];
      }
      long long v10 = v7;
      long long v11 = [(PKPayLaterFinancingPlan *)v7 disputes];
      long long v12 = [v11 firstObject];

      [v35 safelyAddObject:v12];
      long long v13 = [v12 identifier];
      [v41 setObject:v10 forKey:v13];
    }
    goto LABEL_12;
  }
  if (self->_financingPlan)
  {
    v62[0] = self->_financingPlan;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
    v34[2](v34, v8);
  }
  long long v40 = @"PKSharedCachePayLaterDashboardPlanDisputeApproved-Loan-%@";
  long long v9 = @"PayLaterPlanDisputeApproved-Loan-%@";
LABEL_13:
  id v39 = v9;
  if ([v35 count])
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v53 = 0u;
    long long v52 = 0u;
    id obj = v35;
    uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (!v42) {
      goto LABEL_33;
    }
    uint64_t v38 = *(void *)v53;
    while (1)
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v16 = [v15 identifier];
        uint64_t v17 = [NSString stringWithFormat:@"%@%@", v40, v16];
        id v18 = [NSString stringWithFormat:@"%@%@", v39, v16];
        uint64_t v19 = [v41 objectForKey:v16];
        if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
        {
          id v20 = self;
          unint64_t v21 = self->_context;
          switch(v21)
          {
            case 2uLL:
              goto LABEL_24;
            case 1uLL:
              long long v43 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_6.isa);
              uint64_t v24 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_7.isa);
              id v25 = 0;
LABEL_26:
              id v20 = self;
              break;
            case 0uLL:
LABEL_24:
              long long v43 = PKLocalizedCocoonString(&cfstr_DashboardDispu.isa);
              id v22 = [v19 merchant];
              id v23 = [v22 displayName];
              uint64_t v24 = PKLocalizedCocoonString(&cfstr_DashboardDispu_0.isa, &stru_1EF1B4C70.isa, v23);

              id v25 = PKLocalizedCocoonString(&cfstr_DashboardViewP.isa);
              goto LABEL_26;
            default:
              uint64_t v24 = 0;
              long long v43 = 0;
              id v25 = 0;
              break;
          }
          objc_initWeak(&location, v20);
          id v26 = objc_alloc_init(PKDashboardPassMessage);
          [(PKDashboardPassMessage *)v26 setIdentifier:v18];
          [(PKDashboardPassMessage *)v26 setTitle:v43];
          [(PKDashboardPassMessage *)v26 setMessage:v24];
          [(PKDashboardPassMessage *)v26 setButtonTitle:v25];
          [(PKDashboardPassMessage *)v26 setShowDisclosure:v25 != 0];
          if (v25)
          {
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_5;
            v47[3] = &unk_1E59CE888;
            objc_copyWeak(&v50, &location);
            v47[4] = self;
            id v48 = v19;
            uint64_t v49 = v17;
            [(PKDashboardPassMessage *)v26 setActionOnButtonPress:v47];

            objc_destroyWeak(&v50);
          }
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_6;
          v45[3] = &unk_1E59CB010;
          objc_copyWeak(&v46, &location);
          v45[4] = v17;
          [(PKDashboardPassMessage *)v26 setActionOnDismiss:v45];
          id v27 = [(PKPayLaterDashboardMessageComposer *)self _flagImage];
          [(PKDashboardPassMessage *)v26 setImage:v27];

          id v28 = [PKPayLaterDashboardMessage alloc];
          id v29 = [v15 lastUpdated];
          id v30 = [(PKPayLaterDashboardMessage *)v28 initWithMessage:v26 priority:600 date:v29];
          [v37 addObject:v30];

          objc_destroyWeak(&v46);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (!v42)
      {
LABEL_33:

        id v31 = (void *)[v37 copy];
        goto LABEL_35;
      }
    }
  }
  id v31 = 0;
LABEL_35:

  return v31;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 disputes];
  uint64_t v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_374);

  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_377];

  uint64_t v6 = [v5 lastObject];
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v6 identifier];
    [v7 setObject:v9 forKey:v8];
  }
}

BOOL __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 state] == 3;
}

uint64_t __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 lastUpdated];
  uint64_t v6 = [v4 lastUpdated];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    [v3 dashboardMessageComposer:*(void *)(a1 + 32) requestPresentFinancingPlanDetails:*(void *)(a1 + 40)];

    [v4 _updateSharedCacheForKey:*(void *)(a1 + 48) value:1 reloadMessages:1];
    id WeakRetained = v4;
  }
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanSplitDisputes
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke;
  aBlock[3] = &unk_1E59D8720;
  id v5 = v4;
  id v41 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = v6;
  unint64_t context = self->_context;
  if (context == 1)
  {
    (*((void (**)(void *, PKPayLaterFinancingPlan *))v6 + 2))(v6, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      long long v10 = financingPlan;
    }
    else
    {
      long long v10 = [(NSArray *)self->_allFinancingPlans firstObject];
    }
    long long v11 = v10;
    long long v12 = [(PKPayLaterFinancingPlan *)v10 disputes];
    uint64_t v13 = [v12 firstObject];

    [v5 safelyAddObject:v13];
  }
  if ([v5 count])
  {
    id v30 = v7;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_2;
    v38[3] = &unk_1E59D8838;
    uint64_t v14 = self;
    void v38[4] = self;
    id v32 = v3;
    id v29 = v3;
    id v39 = v29;
    long long v15 = (void (**)(void *, void *, uint64_t, void *, void *))_Block_copy(v38);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v31 = v5;
    id obj = v5;
    uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (!v16) {
      goto LABEL_22;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v28 = [v20 identifier];
        unint64_t v21 = PKStringWithValidatedFormat();

        id v22 = NSString;
        id v23 = objc_msgSend(v20, "identifier", v28);
        uint64_t v24 = [v22 stringWithFormat:@"PayLaterPlanDisputeSplit-Loan-%@", v23];

        if (PKSharedCacheGetBoolForKey())
        {
          if (v14->_isAllContext) {
            goto LABEL_18;
          }
        }
        else
        {
          if (v14->_isAllContext)
          {
LABEL_18:
            id v25 = [NSString stringWithFormat:@"%@-%@", v24, @"bnpl"];
            v15[2](v15, v20, 1, v21, v25);

            goto LABEL_20;
          }
          v15[2](v15, v20, [(PKPayLaterFinancingPlan *)v14->_financingPlan productType], v21, v24);
        }
LABEL_20:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (!v17)
      {
LABEL_22:

        id v26 = (void *)[v29 copy];
        id v5 = v31;
        id v3 = v32;
        uint64_t v7 = v30;
        goto LABEL_24;
      }
    }
  }
  id v26 = 0;
LABEL_24:

  return v26;
}

void __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a2, "disputes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 state] == 5) {
          [*(id *)(a1 + 32) safelyAddObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  long long v12 = v11;
  if (a3)
  {
    id v45 = v10;
    id v13 = v11;
    if (a3 == 1) {
      uint64_t v14 = @"DASHBOARD_LOAN_DISPUTE_SPLIT_BNPL_MESSAGE";
    }
    else {
      uint64_t v14 = 0;
    }
    long long v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = [v9 appliedPayments];
    uint64_t v17 = objc_msgSend(v16, "pk_arrayByApplyingBlock:", &__block_literal_global_395);
    uint64_t v18 = [v15 setWithArray:v17];

    uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 104) scheduleSummary];
    id v20 = [v19 payments];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_4;
    v53[3] = &unk_1E59CBA40;
    id v21 = v18;
    id v54 = v21;
    id v46 = objc_msgSend(v20, "pk_firstObjectPassingTest:", v53);

    id v22 = [*(id *)(*(void *)(a1 + 32) + 104) scheduleSummary];
    id v23 = [v22 payments];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_5;
    v51[3] = &unk_1E59CBA40;
    id v44 = v21;
    id v52 = v44;
    uint64_t v24 = objc_msgSend(v23, "pk_firstObjectPassingTest:", v51);

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v25 = objc_alloc_init(PKDashboardPassMessage);
    long long v12 = v13;
    [(PKDashboardPassMessage *)v25 setIdentifier:v13];
    id v26 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_9.isa);
    [(PKDashboardPassMessage *)v25 setTitle:v26];

    if (v46 && v24)
    {
      uint64_t v42 = v13;
      p_isa = &v14->isa;
      id v27 = [v24 amount];
      id v28 = [v27 amount];
      id v29 = objc_msgSend(v28, "pk_absoluteValue");
      id v30 = [v24 amount];
      id v31 = [v30 currency];
      id v32 = PKCurrencyAmountMake();

      id v33 = [v46 amount];
      long long v34 = [v33 formattedStringValue];
      long long v35 = [v32 formattedStringValue];
      long long v36 = PKLocalizedCocoonString(p_isa, &stru_1EF1B5770.isa, v34, v35);
      [(PKDashboardPassMessage *)v25 setMessage:v36];

      long long v12 = v42;
    }
    else
    {
      id v32 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_10.isa);
      [(PKDashboardPassMessage *)v25 setMessage:v32];
    }

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_6;
    v47[3] = &unk_1E59CB010;
    objc_copyWeak(&v49, &location);
    id v10 = v45;
    id v48 = v45;
    [(PKDashboardPassMessage *)v25 setActionOnDismiss:v47];
    long long v37 = [*(id *)(a1 + 32) _flagImage];
    [(PKDashboardPassMessage *)v25 setImage:v37];

    uint64_t v38 = *(void **)(a1 + 40);
    id v39 = [PKPayLaterDashboardMessage alloc];
    long long v40 = [v9 lastUpdated];
    id v41 = [(PKPayLaterDashboardMessage *)v39 initWithMessage:v25 priority:600 date:v40];
    [v38 addObject:v41];

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
}

uint64_t __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 paymentIdentifier];
}

uint64_t __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 paymentIdentifier];
    uint64_t v6 = [v4 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 4)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 paymentIdentifier];
    uint64_t v6 = [v4 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    [v3[4] updateWalletBadgeCountWithCompletion:0];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanRejectedDisputes
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__36;
  uint64_t v38 = __Block_byref_object_dispose__36;
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke;
  aBlock[3] = &unk_1E59D8720;
  id v24 = v2;
  id v33 = v24;
  id v23 = (void (**)(void *, PKPayLaterFinancingPlan *))_Block_copy(aBlock);
  id v3 = self;
  unint64_t context = self->_context;
  if (context == 1)
  {
    v23[2](v23, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      uint64_t v6 = financingPlan;
    }
    else
    {
      uint64_t v6 = [(NSArray *)self->_allFinancingPlans firstObject];
    }
    uint64_t v7 = v6;
    long long v8 = [(PKPayLaterFinancingPlan *)v6 disputes];
    id v9 = [v8 firstObject];

    [v24 safelyAddObject:v9];
    id v3 = self;
  }
  if ([v24 count])
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_2;
    v31[3] = &unk_1E59D8860;
    v31[4] = v3;
    v31[5] = &v34;
    id v10 = (void (**)(void *, void *, uint64_t, void *, void *))_Block_copy(v31);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v24;
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v40 count:16];
    if (!v11) {
      goto LABEL_22;
    }
    uint64_t v12 = *(void *)v28;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v22 = [v14 identifier];
        long long v15 = PKStringWithValidatedFormat();

        uint64_t v16 = NSString;
        uint64_t v17 = objc_msgSend(v14, "identifier", v22);
        uint64_t v18 = [v16 stringWithFormat:@"PayLaterPlanDisputeRejected-Loan-%@", v17];

        if (PKSharedCacheGetBoolForKey())
        {
          if (self->_isAllContext) {
            goto LABEL_18;
          }
        }
        else
        {
          if (self->_isAllContext)
          {
LABEL_18:
            uint64_t v19 = [NSString stringWithFormat:@"%@-%@", v18, @"bnpl"];
            v10[2](v10, v14, 1, v15, v19);

            goto LABEL_20;
          }
          v10[2](v10, v14, [(PKPayLaterFinancingPlan *)self->_financingPlan productType], v15, v18);
        }
LABEL_20:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v40 count:16];
      if (!v11)
      {
LABEL_22:

        id v20 = (void *)[(id)v35[5] copy];
        goto LABEL_24;
      }
    }
  }
  id v20 = 0;
LABEL_24:

  _Block_object_dispose(&v34, 8);

  return v20;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a2, "disputes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 state] == 4) {
          [*(id *)(a1 + 32) safelyAddObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a3)
  {
    if (a3 == 1) {
      long long v12 = @"DASHBOARD_LOAN_DISPUTE_REJECTED_BNPL_MESSAGE";
    }
    else {
      long long v12 = 0;
    }
    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = [v9 appliedPayments];
    long long v15 = objc_msgSend(v14, "pk_arrayByApplyingBlock:", &__block_literal_global_406_0);
    uint64_t v16 = [v13 setWithArray:v15];

    uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 104) scheduleSummary];
    uint64_t v18 = [v17 payments];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_4;
    v35[3] = &unk_1E59CBA40;
    id v19 = v16;
    id v36 = v19;
    id v20 = objc_msgSend(v18, "pk_firstObjectPassingTest:", v35);

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v21 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v21 setIdentifier:v11];
    id v22 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_12.isa);
    [(PKDashboardPassMessage *)v21 setTitle:v22];

    id v23 = [v20 amount];
    id v24 = [v23 formattedStringValue];
    id v25 = PKLocalizedCocoonString(&v12->isa, &stru_1EF1B4C70.isa, v24);
    [(PKDashboardPassMessage *)v21 setMessage:v25];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_5;
    v31[3] = &unk_1E59CB010;
    objc_copyWeak(&v33, &location);
    id v32 = v10;
    [(PKDashboardPassMessage *)v21 setActionOnDismiss:v31];
    id v26 = [*(id *)(a1 + 32) _flagImage];
    [(PKDashboardPassMessage *)v21 setImage:v26];

    long long v27 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    long long v28 = [PKPayLaterDashboardMessage alloc];
    long long v29 = [v9 lastUpdated];
    long long v30 = [(PKPayLaterDashboardMessage *)v28 initWithMessage:v21 priority:600 date:v29];
    [v27 addObject:v30];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
}

uint64_t __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 paymentIdentifier];
}

uint64_t __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 paymentIdentifier];
    uint64_t v6 = [v4 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    [v3[4] updateWalletBadgeCountWithCompletion:0];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanWithdrawnDisputes
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanWithdrawnDisputes__block_invoke;
  aBlock[3] = &unk_1E59D8720;
  id v29 = v3;
  id v41 = v29;
  long long v28 = (void (**)(void *, PKPayLaterFinancingPlan *))_Block_copy(aBlock);
  unint64_t context = self->_context;
  if (context == 1)
  {
    v28[2](v28, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      uint64_t v6 = financingPlan;
    }
    else
    {
      uint64_t v6 = [(NSArray *)self->_allFinancingPlans firstObject];
    }
    uint64_t v7 = v6;
    long long v8 = [(PKPayLaterFinancingPlan *)v6 disputes];
    id v9 = [v8 firstObject];

    [v29 safelyAddObject:v9];
  }
  if ([v29 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v29;
    uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v10)
    {
      uint64_t v32 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v13 = NSString;
          uint64_t v14 = [v12 identifier];
          long long v15 = [v13 stringWithFormat:@"PKSharedCachePayLaterDashboardPlanDisputeWithdrawn-Loan-%@", v14];

          uint64_t v16 = NSString;
          uint64_t v17 = [v12 identifier];
          uint64_t v18 = [v16 stringWithFormat:@"PayLaterPlanDisputeWithdrawn-Loan-%@", v17];

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            id v19 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v19 setIdentifier:v18];
            id v20 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_13.isa);
            [(PKDashboardPassMessage *)v19 setTitle:v20];

            id v21 = PKLocalizedCocoonString(&cfstr_DashboardLoanD_14.isa);
            [(PKDashboardPassMessage *)v19 setMessage:v21];

            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanWithdrawnDisputes__block_invoke_2;
            v33[3] = &unk_1E59CB010;
            objc_copyWeak(&v34, &location);
            v33[4] = v15;
            [(PKDashboardPassMessage *)v19 setActionOnDismiss:v33];
            id v22 = [(PKPayLaterDashboardMessageComposer *)self _flagImage];
            [(PKDashboardPassMessage *)v19 setImage:v22];

            id v23 = [PKPayLaterDashboardMessage alloc];
            id v24 = [v12 lastUpdated];
            id v25 = [(PKPayLaterDashboardMessage *)v23 initWithMessage:v19 priority:600 date:v24];
            [v31 addObject:v25];

            objc_destroyWeak(&v34);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v10);
    }

    id v26 = (void *)[v31 copy];
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

void __69__PKPayLaterDashboardMessageComposer__financingPlanWithdrawnDisputes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a2, "disputes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 state] == 6) {
          [*(id *)(a1 + 32) safelyAddObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __69__PKPayLaterDashboardMessageComposer__financingPlanWithdrawnDisputes__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanUnresolvedDisputeState
{
  id v3 = NSString;
  uint64_t v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  uint64_t v5 = [v3 stringWithFormat:@"PKSharedCachePayLaterDashboardPlanUnresolvedDisputeStatePrefix-Loan-%@", v4];

  uint64_t v6 = NSString;
  uint64_t v7 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  long long v8 = [v6 stringWithFormat:@"PayLaterPlanUnresolvedDisputeStatePrefix-Loan-%@", v7];

  unint64_t context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && [(PKPayLaterFinancingPlan *)financingPlan stateReason] == 6)
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    long long v11 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v11 setIdentifier:v8];
    long long v12 = PKLocalizedCocoonString(&cfstr_DashboardLoanU.isa);
    [(PKDashboardPassMessage *)v11 setTitle:v12];

    id v13 = PKLocalizedCocoonString(&cfstr_DashboardLoanU_0.isa);
    [(PKDashboardPassMessage *)v11 setMessage:v13];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanUnresolvedDisputeState__block_invoke;
    v17[3] = &unk_1E59CB010;
    objc_copyWeak(&v18, &location);
    v17[4] = v5;
    [(PKDashboardPassMessage *)v11 setActionOnDismiss:v17];
    uint64_t v14 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
    [(PKDashboardPassMessage *)v11 setImage:v14];

    long long v15 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v11 priority:600 date:0];
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

void __74__PKPayLaterDashboardMessageComposer__financingPlanUnresolvedDisputeState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanRefundIssued
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = v3;
  unint64_t context = self->_context;
  switch(context)
  {
    case 0uLL:
      [v3 addObjectsFromArray:self->_allFinancingPlans];
      break;
    case 1uLL:
      financingPlan = self->_financingPlan;
      goto LABEL_8;
    case 2uLL:
      financingPlan = self->_financingPlan;
      if (!financingPlan)
      {
        uint64_t v7 = [(NSArray *)self->_allFinancingPlans firstObject];
        [v4 safelyAddObject:v7];

        break;
      }
LABEL_8:
      [v3 safelyAddObject:financingPlan];
      break;
  }
  val = self;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v4;
  uint64_t v45 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (!v45) {
    goto LABEL_46;
  }
  uint64_t v44 = *(void *)v64;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v64 != v44)
      {
        uint64_t v9 = v8;
        objc_enumerationMutation(obj);
        uint64_t v8 = v9;
      }
      uint64_t v46 = v8;
      id v49 = *(void **)(*((void *)&v63 + 1) + 8 * v8);
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v11 = val->_context;
      if (v11 < 2)
      {
        long long v12 = [v49 refundPaymentsNotAssociatedWithDispute];
        [v10 addObjectsFromArray:v12];
LABEL_18:

        goto LABEL_19;
      }
      if (v11 == 2)
      {
        long long v12 = [v49 scheduleSummary];
        id v13 = [v12 payments];
        uint64_t v14 = [v13 firstObject];
        [v10 addObject:v14];

        goto LABEL_18;
      }
LABEL_19:
      long long v15 = [v49 merchant];
      uint64_t v47 = [v15 displayName];

      long long v61 = 0u;
      long long v62 = 0u;
      long long v60 = 0u;
      long long v59 = 0u;
      id v48 = v10;
      uint64_t v52 = [v48 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (!v52) {
        goto LABEL_44;
      }
      uint64_t v51 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v60 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v17 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v18 = NSString;
          id v19 = [v17 paymentIdentifier];
          id v20 = [v18 stringWithFormat:@"PKSharedCachePayLaterDashboardRefundPaymentPrefix-FOP-Loan-%@", v19];

          id v21 = NSString;
          id v22 = [v17 paymentIdentifier];
          id v23 = [v21 stringWithFormat:@"PayLaterRefundPaymentPrefix-FOP-Loan-%@", v22];

          if (!PKSharedCacheGetBoolForKey() || val->_isAllContext)
          {
            objc_initWeak(&location, val);
            id v24 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v24 setIdentifier:v23];
            unint64_t v25 = [v17 subtype];
            if (v25 >= 5)
            {
              id v26 = 0;
            }
            else
            {
              id v26 = PKLocalizedCocoonString(&off_1E59D88A0[v25]->isa);
            }
            [(PKDashboardPassMessage *)v24 setTitle:v26];
            long long v27 = [v17 amount];
            long long v28 = [v27 absoluteValue];
            id v29 = [v28 formattedStringValue];

            shortDateFormatter = val->_shortDateFormatter;
            id v31 = [v17 postedDate];
            uint64_t v32 = [(NSDateFormatter *)shortDateFormatter stringFromDate:v31];

            unint64_t v33 = val->_context;
            if (v33)
            {
              if (v33 == 1)
              {
                long long v35 = +[PKPayLaterFinancingPlanPaymentScheduleComposer detailTextForPayment:v17 financingPlan:v49];
              }
              else
              {
                if (v33 == 2) {
                  goto LABEL_32;
                }
                long long v35 = 0;
              }
            }
            else
            {
LABEL_32:
              unint64_t v34 = [v17 subtype];
              if (v34 > 4)
              {
                long long v35 = 0;
              }
              else
              {
                long long v35 = PKLocalizedCocoonString(&off_1E59D88C8[v34]->isa, &cfstr_123.isa, v47, v29, v32);
              }
              long long v36 = PKLocalizedCocoonString(&cfstr_DashboardViewP.isa);
              [(PKDashboardPassMessage *)v24 setButtonTitle:v36];

              [(PKDashboardPassMessage *)v24 setShowDisclosure:1];
              v56[0] = MEMORY[0x1E4F143A8];
              v56[1] = 3221225472;
              v56[2] = __64__PKPayLaterDashboardMessageComposer__financingPlanRefundIssued__block_invoke;
              v56[3] = &unk_1E59CE888;
              objc_copyWeak(&v57, &location);
              void v56[4] = val;
              v56[5] = v49;
              v56[6] = v20;
              [(PKDashboardPassMessage *)v24 setActionOnButtonPress:v56];
              objc_destroyWeak(&v57);
            }
            [(PKDashboardPassMessage *)v24 setMessage:v35];
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __64__PKPayLaterDashboardMessageComposer__financingPlanRefundIssued__block_invoke_2;
            v54[3] = &unk_1E59CB010;
            objc_copyWeak(&v55, &location);
            v54[4] = v20;
            [(PKDashboardPassMessage *)v24 setActionOnDismiss:v54];
            if ([v17 subtype] == 1) {
              [(PKPayLaterDashboardMessageComposer *)val _pencilImage];
            }
            else {
            long long v37 = [(PKPayLaterDashboardMessageComposer *)val _uturnImage];
            }
            [(PKDashboardPassMessage *)v24 setImage:v37];

            long long v38 = [PKPayLaterDashboardMessage alloc];
            long long v39 = [v17 postedDate];
            long long v40 = [(PKPayLaterDashboardMessage *)v38 initWithMessage:v24 priority:600 date:v39];
            [v50 addObject:v40];

            objc_destroyWeak(&v55);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v52 = [v48 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v52);
LABEL_44:

      uint64_t v8 = v46 + 1;
    }
    while (v46 + 1 != v45);
    uint64_t v45 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  }
  while (v45);
LABEL_46:

  id v41 = (void *)[v50 copy];

  return v41;
}

void __64__PKPayLaterDashboardMessageComposer__financingPlanRefundIssued__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    [v3 dashboardMessageComposer:*(void *)(a1 + 32) requestPresentFinancingPlanDetails:*(void *)(a1 + 40)];

    [v4 _updateSharedCacheForKey:*(void *)(a1 + 48) value:1 reloadMessages:1];
    id WeakRetained = v4;
  }
}

void __64__PKPayLaterDashboardMessageComposer__financingPlanRefundIssued__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanRefundRevoked
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = v3;
  unint64_t context = self->_context;
  switch(context)
  {
    case 0uLL:
      [v3 addObjectsFromArray:self->_allFinancingPlans];
      break;
    case 1uLL:
      financingPlan = self->_financingPlan;
      goto LABEL_8;
    case 2uLL:
      financingPlan = self->_financingPlan;
      if (!financingPlan)
      {
        uint64_t v7 = [(NSArray *)self->_allFinancingPlans firstObject];
        [v4 safelyAddObject:v7];

        break;
      }
LABEL_8:
      [v3 safelyAddObject:financingPlan];
      break;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  long long v48 = 0u;
  id obj = v4;
  uint64_t v35 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (!v35) {
    goto LABEL_34;
  }
  uint64_t v34 = *(void *)v49;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v49 != v34)
      {
        uint64_t v9 = v8;
        objc_enumerationMutation(obj);
        uint64_t v8 = v9;
      }
      uint64_t v36 = v8;
      long long v37 = *(void **)(*((void *)&v48 + 1) + 8 * v8);
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v11 = self->_context;
      if (v11 >= 2)
      {
        if (v11 != 2) {
          goto LABEL_19;
        }
        long long v12 = [v37 scheduleSummary];
        id v13 = [v12 payments];
        uint64_t v14 = [v13 firstObject];
        [v10 addObject:v14];
      }
      else
      {
        long long v12 = [v37 scheduleSummary];
        id v13 = [v12 payments];
        uint64_t v14 = objc_msgSend(v13, "pk_objectsPassingTest:", &__block_literal_global_440);
        [v10 addObjectsFromArray:v14];
      }

LABEL_19:
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v38 = v10;
      uint64_t v15 = [v38 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v15)
      {
        uint64_t v40 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v45 != v40) {
              objc_enumerationMutation(v38);
            }
            uint64_t v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            id v18 = NSString;
            id v19 = [v17 paymentIdentifier];
            id v20 = [v18 stringWithFormat:@"PKSharedCachePayLaterDashboardRefundRevokedPaymentPrefix-FOP-Loan-%@", v19];

            id v21 = NSString;
            id v22 = [v17 paymentIdentifier];
            id v23 = [v21 stringWithFormat:@"PayLaterRefundRevokedPaymentPrefix-FOP-Loan-%@", v22];

            if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
            {
              objc_initWeak(&location, self);
              id v24 = objc_alloc_init(PKDashboardPassMessage);
              [(PKDashboardPassMessage *)v24 setIdentifier:v23];
              unint64_t v25 = PKLocalizedCocoonString(&cfstr_DashboardRefun_2.isa);
              [(PKDashboardPassMessage *)v24 setTitle:v25];

              if (self->_context >= 3)
              {
                id v26 = 0;
              }
              else
              {
                id v26 = +[PKPayLaterFinancingPlanPaymentScheduleComposer detailTextForPayment:v17 financingPlan:v37];
              }
              [(PKDashboardPassMessage *)v24 setMessage:v26];
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanRefundRevoked__block_invoke_2;
              v41[3] = &unk_1E59CB010;
              objc_copyWeak(&v42, &location);
              void v41[4] = v20;
              [(PKDashboardPassMessage *)v24 setActionOnDismiss:v41];
              long long v27 = [(PKPayLaterDashboardMessageComposer *)self _reverseImage];
              [(PKDashboardPassMessage *)v24 setImage:v27];

              long long v28 = [PKPayLaterDashboardMessage alloc];
              id v29 = [v17 postedDate];
              long long v30 = [(PKPayLaterDashboardMessage *)v28 initWithMessage:v24 priority:600 date:v29];
              [v39 addObject:v30];

              objc_destroyWeak(&v42);
              objc_destroyWeak(&location);
            }
          }
          uint64_t v15 = [v38 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v15);
      }

      uint64_t v8 = v36 + 1;
    }
    while (v36 + 1 != v35);
    uint64_t v35 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  }
  while (v35);
LABEL_34:

  id v31 = (void *)[v39 copy];

  return v31;
}

BOOL __65__PKPayLaterDashboardMessageComposer__financingPlanRefundRevoked__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 6;
}

void __65__PKPayLaterDashboardMessageComposer__financingPlanRefundRevoked__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanAdjustments
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = v3;
  unint64_t context = self->_context;
  switch(context)
  {
    case 0uLL:
      [v3 addObjectsFromArray:self->_allFinancingPlans];
      break;
    case 1uLL:
      financingPlan = self->_financingPlan;
      goto LABEL_8;
    case 2uLL:
      financingPlan = self->_financingPlan;
      if (!financingPlan)
      {
        uint64_t v7 = [(NSArray *)self->_allFinancingPlans firstObject];
        [v4 safelyAddObject:v7];

        break;
      }
LABEL_8:
      [v3 safelyAddObject:financingPlan];
      break;
  }
  val = self;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v4;
  uint64_t v48 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (!v48) {
    goto LABEL_54;
  }
  uint64_t v47 = *(void *)v67;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v67 != v47)
      {
        uint64_t v9 = v8;
        objc_enumerationMutation(obj);
        uint64_t v8 = v9;
      }
      uint64_t v49 = v8;
      long long v51 = *(void **)(*((void *)&v66 + 1) + 8 * v8);
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v11 = val->_context;
      if (v11 < 2)
      {
        long long v12 = [v51 scheduleSummary];
        id v13 = [v12 paymentsOfType:7];
        [v10 addObjectsFromArray:v13];
LABEL_18:

        goto LABEL_19;
      }
      if (v11 == 2)
      {
        long long v12 = [v51 scheduleSummary];
        id v13 = [v12 payments];
        uint64_t v14 = [v13 firstObject];
        [v10 addObject:v14];

        goto LABEL_18;
      }
LABEL_19:
      uint64_t v15 = [v51 merchant];
      long long v50 = [v15 displayName];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v63 = 0u;
      long long v62 = 0u;
      id v52 = v10;
      uint64_t v55 = [v52 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (!v55) {
        goto LABEL_52;
      }
      uint64_t v54 = *(void *)v63;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v63 != v54) {
            objc_enumerationMutation(v52);
          }
          uint64_t v17 = *(void **)(*((void *)&v62 + 1) + 8 * v16);
          id v18 = NSString;
          id v19 = [v17 paymentIdentifier];
          id v20 = [v18 stringWithFormat:@"PKSharedCachePayLaterDashboardAdjustmentPaymentPrefix-FOP-Loan-%@", v19];

          id v21 = NSString;
          id v22 = [v17 paymentIdentifier];
          id v23 = [v21 stringWithFormat:@"PayLaterAdjustmentPaymentPrefix-FOP-Loan-%@", v22];

          if (!PKSharedCacheGetBoolForKey() || val->_isAllContext)
          {
            objc_initWeak(&location, val);
            id v24 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v24 setIdentifier:v23];
            unint64_t v25 = [v17 subtype];
            if (v25 < 2)
            {
              id v26 = @"DASHBOARD_LOAN_REDUCED_TITLE";
              if (val->_isAllContext)
              {
LABEL_31:
                long long v27 = PKLocalizedCocoonString(&v26->isa);
                goto LABEL_32;
              }
              goto LABEL_47;
            }
            id v26 = @"DASHBOARD_LOAN_REDUCED_TITLE";
            if (v25 - 2 < 2) {
              goto LABEL_31;
            }
            if (v25 == 4)
            {
              id v26 = @"DASHBOARD_LOAN_INCREASED_TITLE";
              goto LABEL_31;
            }
            long long v27 = 0;
LABEL_32:
            [(PKDashboardPassMessage *)v24 setTitle:v27];
            long long v28 = [v17 amount];
            id v29 = [v28 absoluteValue];
            long long v30 = [v29 formattedStringValue];

            shortDateFormatter = val->_shortDateFormatter;
            uint64_t v32 = [v17 postedDate];
            unint64_t v33 = [(NSDateFormatter *)shortDateFormatter stringFromDate:v32];

            unint64_t v34 = val->_context;
            if (v34)
            {
              if (v34 == 1)
              {
                long long v37 = +[PKPayLaterFinancingPlanPaymentScheduleComposer detailTextForPayment:v17 financingPlan:v51];
              }
              else
              {
                if (v34 == 2) {
                  goto LABEL_35;
                }
                long long v37 = 0;
              }
LABEL_45:
              [(PKDashboardPassMessage *)v24 setMessage:v37];
              v57[0] = MEMORY[0x1E4F143A8];
              v57[1] = 3221225472;
              v57[2] = __63__PKPayLaterDashboardMessageComposer__financingPlanAdjustments__block_invoke_2;
              v57[3] = &unk_1E59CB010;
              objc_copyWeak(&v58, &location);
              v57[4] = v20;
              [(PKDashboardPassMessage *)v24 setActionOnDismiss:v57];
              id v39 = [(PKPayLaterDashboardMessageComposer *)val _pencilImage];
              [(PKDashboardPassMessage *)v24 setImage:v39];

              uint64_t v40 = [PKPayLaterDashboardMessage alloc];
              id v41 = [v17 postedDate];
              id v42 = [(PKPayLaterDashboardMessage *)v40 initWithMessage:v24 priority:600 date:v41];
              [v53 addObject:v42];

              objc_destroyWeak(&v58);
LABEL_46:

LABEL_47:
              objc_destroyWeak(&location);
              goto LABEL_48;
            }
LABEL_35:
            unint64_t v35 = [v17 subtype];
            if (v35 < 2)
            {
              uint64_t v36 = @"DASHBOARD_LOAN_REDUCED_MESSAGE_FOP";
              if (!val->_isAllContext) {
                goto LABEL_46;
              }
LABEL_43:
              long long v37 = PKLocalizedCocoonString(&v36->isa, &cfstr_123.isa, v50, v30, v33);
            }
            else
            {
              uint64_t v36 = @"DASHBOARD_LOAN_REDUCED_MESSAGE_FOP";
              if (v35 - 2 < 2) {
                goto LABEL_43;
              }
              if (v35 == 4)
              {
                uint64_t v36 = @"DASHBOARD_LOAN_INCREASED_MESSAGE_FOP";
                goto LABEL_43;
              }
              long long v37 = 0;
            }
            id v38 = PKLocalizedCocoonString(&cfstr_DashboardViewP.isa);
            [(PKDashboardPassMessage *)v24 setButtonTitle:v38];

            [(PKDashboardPassMessage *)v24 setShowDisclosure:1];
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __63__PKPayLaterDashboardMessageComposer__financingPlanAdjustments__block_invoke;
            v59[3] = &unk_1E59CE888;
            objc_copyWeak(&v60, &location);
            v59[4] = val;
            v59[5] = v51;
            v59[6] = v20;
            [(PKDashboardPassMessage *)v24 setActionOnButtonPress:v59];
            objc_destroyWeak(&v60);
            goto LABEL_45;
          }
LABEL_48:

          ++v16;
        }
        while (v55 != v16);
        uint64_t v43 = [v52 countByEnumeratingWithState:&v62 objects:v70 count:16];
        uint64_t v55 = v43;
      }
      while (v43);
LABEL_52:

      uint64_t v8 = v49 + 1;
    }
    while (v49 + 1 != v48);
    uint64_t v48 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
  }
  while (v48);
LABEL_54:

  long long v44 = (void *)[v53 copy];

  return v44;
}

void __63__PKPayLaterDashboardMessageComposer__financingPlanAdjustments__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    [v3 dashboardMessageComposer:*(void *)(a1 + 32) requestPresentFinancingPlanDetails:*(void *)(a1 + 40)];

    [v4 _updateSharedCacheForKey:*(void *)(a1 + 48) value:1 reloadMessages:1];
    id WeakRetained = v4;
  }
}

void __63__PKPayLaterDashboardMessageComposer__financingPlanAdjustments__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanOutstandingCredit
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke;
  aBlock[3] = &unk_1E59D8720;
  id v26 = v3;
  id v42 = v26;
  uint64_t v4 = _Block_copy(aBlock);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_2;
  v39[3] = &unk_1E59CACF0;
  id v24 = v4;
  id v40 = v24;
  unint64_t v25 = (void (**)(void *, NSArray *))_Block_copy(v39);
  unint64_t context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      (*((void (**)(id, PKPayLaterFinancingPlan *))v24 + 2))(v24, self->_financingPlan);
    }
    else if (context == 2)
    {
      if (self->_financingPlan)
      {
        objc_msgSend(v26, "safelyAddObject:");
      }
      else
      {
        uint64_t v6 = [(NSArray *)self->_allFinancingPlans firstObject];
        [v26 safelyAddObject:v6];
      }
    }
  }
  else
  {
    v25[2](v25, self->_allFinancingPlans);
  }
  if ([v26 count])
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v26;
    uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v7)
    {
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v10 = NSString;
          unint64_t v11 = [v9 planIdentifier];
          long long v12 = [v10 stringWithFormat:@"PKSharedCachePayLaterDashboardPlanOutstandingCreditPrefix-FOP-Loan-%@", v11];

          id v13 = NSString;
          uint64_t v14 = [v9 planIdentifier];
          uint64_t v15 = [v13 stringWithFormat:@"PayLaterPlanOutstandingCreditPrefix-FOP-Loan-%@", v14];

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            uint64_t v16 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v16 setIdentifier:v15];
            uint64_t v17 = PKLocalizedCocoonString(&cfstr_DashboardLoanO.isa);
            [(PKDashboardPassMessage *)v16 setTitle:v17];

            id v18 = PKLocalizedCocoonString(&cfstr_DashboardLoanO_0.isa);
            [(PKDashboardPassMessage *)v16 setMessage:v18];

            id v19 = PKLocalizedCocoonString(&cfstr_DashboardChatW.isa);
            [(PKDashboardPassMessage *)v16 setButtonTitle:v19];

            [(PKDashboardPassMessage *)v16 setShowDisclosure:1];
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_3;
            v32[3] = &unk_1E59CB010;
            objc_copyWeak(&v33, &location);
            v32[4] = v12;
            [(PKDashboardPassMessage *)v16 setActionOnButtonPress:v32];
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_4;
            v30[3] = &unk_1E59CB010;
            objc_copyWeak(&v31, &location);
            v30[4] = v12;
            [(PKDashboardPassMessage *)v16 setActionOnDismiss:v30];
            id v20 = [(PKPayLaterDashboardMessageComposer *)self _reverseImage];
            [(PKDashboardPassMessage *)v16 setImage:v20];

            id v21 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v16 priority:400 date:0];
            [v28 addObject:v21];

            objc_destroyWeak(&v31);
            objc_destroyWeak(&v33);

            objc_destroyWeak(&location);
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v7);
    }

    id v22 = (void *)[v28 copy];
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

void __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 stateReason] == 4) {
    [*(id *)(a1 + 32) safelyAddObject:v3];
  }
}

void __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentBusinessChatForApplePayLaterAccountWithTopicType:16];
    [v3 _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

void __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanCanceled
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke;
  aBlock[3] = &unk_1E59D8720;
  id v25 = v2;
  id v43 = v25;
  id v3 = _Block_copy(aBlock);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_2;
  v40[3] = &unk_1E59CACF0;
  id v23 = v3;
  id v41 = v23;
  id v24 = (void (**)(void *, NSArray *))_Block_copy(v40);
  unint64_t context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      (*((void (**)(id, PKPayLaterFinancingPlan *))v23 + 2))(v23, self->_financingPlan);
    }
    else if (context == 2)
    {
      if (self->_financingPlan)
      {
        objc_msgSend(v25, "safelyAddObject:");
      }
      else
      {
        uint64_t v5 = [(NSArray *)self->_allFinancingPlans firstObject];
        [v25 safelyAddObject:v5];
      }
    }
  }
  else
  {
    v24[2](v24, self->_allFinancingPlans);
  }
  if ([v25 count])
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v25;
    uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v22 = [v7 planIdentifier];
          long long v8 = PKStringWithValidatedFormat();

          long long v9 = NSString;
          long long v10 = objc_msgSend(v7, "planIdentifier", v22);
          long long v11 = [v9 stringWithFormat:@"PayLaterPlanCanceledPrefix-FOP-Loan-%@", v10];

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            long long v12 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v12 setIdentifier:v11];
            uint64_t v13 = PKLocalizedCocoonString(&cfstr_DashboardLoanC.isa);
            [(PKDashboardPassMessage *)v12 setTitle:v13];

            uint64_t v14 = [v7 merchant];
            uint64_t v15 = [v14 displayName];
            uint64_t v16 = PKLocalizedCocoonString(&cfstr_DashboardLoanC_0.isa, &stru_1EF1B4C70.isa, v15);
            [(PKDashboardPassMessage *)v12 setMessage:v16];

            uint64_t v17 = PKLocalizedCocoonString(&cfstr_DashboardChatW.isa);
            [(PKDashboardPassMessage *)v12 setButtonTitle:v17];

            [(PKDashboardPassMessage *)v12 setShowDisclosure:1];
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_3;
            v33[3] = &unk_1E59CB378;
            objc_copyWeak(&v34, &location);
            v33[4] = v7;
            void v33[5] = v8;
            [(PKDashboardPassMessage *)v12 setActionOnButtonPress:v33];
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_4;
            v31[3] = &unk_1E59CB010;
            objc_copyWeak(&v32, &location);
            void v31[4] = v8;
            [(PKDashboardPassMessage *)v12 setActionOnDismiss:v31];
            id v18 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
            [(PKDashboardPassMessage *)v12 setImage:v18];

            id v19 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v12 priority:400 date:0];
            [v27 addObject:v19];

            objc_destroyWeak(&v32);
            objc_destroyWeak(&v34);

            objc_destroyWeak(&location);
          }
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v29);
    }

    id v20 = (void *)[v27 copy];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

void __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 5) {
    [*(id *)(a1 + 32) safelyAddObject:v3];
  }
}

void __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentBusinessChatForFinancingPlan:*(void *)(a1 + 32) topicType:2];
    [v3 _updateSharedCacheForKey:*(void *)(a1 + 40) value:1 reloadMessages:1];
    [v3[4] updateWalletBadgeCountWithCompletion:0];
    id WeakRetained = v3;
  }
}

void __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    [v3[4] updateWalletBadgeCountWithCompletion:0];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanChargedOff
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke;
  aBlock[3] = &unk_1E59D8720;
  id v26 = v2;
  id v44 = v26;
  id v3 = _Block_copy(aBlock);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_2;
  v41[3] = &unk_1E59CACF0;
  id v24 = v3;
  id v42 = v24;
  id v25 = (void (**)(void *, NSArray *))_Block_copy(v41);
  unint64_t context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      (*((void (**)(id, PKPayLaterFinancingPlan *))v24 + 2))(v24, self->_financingPlan);
    }
    else if (context == 2)
    {
      if (self->_financingPlan)
      {
        objc_msgSend(v26, "safelyAddObject:");
      }
      else
      {
        uint64_t v5 = [(NSArray *)self->_allFinancingPlans firstObject];
        [v26 safelyAddObject:v5];
      }
    }
  }
  else
  {
    v25[2](v25, self->_allFinancingPlans);
  }
  if ([v26 count])
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v26;
    uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          long long v8 = NSString;
          long long v9 = [v7 planIdentifier];
          long long v10 = [v8 stringWithFormat:@"PKSharedCachePayLaterDashboardPlanChargedOffPrefix-FOP-Loan-%@", v9];

          long long v11 = NSString;
          long long v12 = [v7 planIdentifier];
          uint64_t v13 = [v11 stringWithFormat:@"PayLaterPlanChargedOffPrefix-FOP-Loan-%@", v12];

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            uint64_t v14 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v14 setIdentifier:v13];
            uint64_t v15 = PKLocalizedCocoonString(&cfstr_DashboardLoanC_1.isa);
            [(PKDashboardPassMessage *)v14 setTitle:v15];

            uint64_t v16 = [v7 merchant];
            uint64_t v17 = [v16 displayName];
            id v18 = PKLocalizedCocoonString(&cfstr_DashboardLoanC_2.isa, &stru_1EF1B4C70.isa, v17);
            [(PKDashboardPassMessage *)v14 setMessage:v18];

            id v19 = PKLocalizedCocoonString(&cfstr_DashboardChatW.isa);
            [(PKDashboardPassMessage *)v14 setButtonTitle:v19];

            [(PKDashboardPassMessage *)v14 setShowDisclosure:1];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_3;
            v34[3] = &unk_1E59CB378;
            objc_copyWeak(&v35, &location);
            v34[4] = v7;
            v34[5] = v10;
            [(PKDashboardPassMessage *)v14 setActionOnButtonPress:v34];
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_4;
            v32[3] = &unk_1E59CB010;
            objc_copyWeak(&v33, &location);
            v32[4] = v10;
            [(PKDashboardPassMessage *)v14 setActionOnDismiss:v32];
            id v20 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
            [(PKDashboardPassMessage *)v14 setImage:v20];

            id v21 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v14 priority:400 date:0];
            [v28 addObject:v21];

            objc_destroyWeak(&v33);
            objc_destroyWeak(&v35);

            objc_destroyWeak(&location);
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v30);
    }

    id v22 = (void *)[v28 copy];
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

void __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 stateReason] == 5) {
    [*(id *)(a1 + 32) safelyAddObject:v3];
  }
}

void __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentBusinessChatForFinancingPlan:*(void *)(a1 + 32) topicType:3];
    [v3 _updateSharedCacheForKey:*(void *)(a1 + 40) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

void __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (id)_financingPlanProActiveCancellation
{
  id v3 = NSString;
  uint64_t v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  uint64_t v5 = [v3 stringWithFormat:@"PKSharedCachePayLaterDashboardProActiveCancellationPrefix-Loan-%@", v4];

  uint64_t v6 = NSString;
  uint64_t v7 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  long long v8 = [v6 stringWithFormat:@"PayLaterProActiveCancellationPrefix-Loan-%@", v7];

  long long v9 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  long long v10 = [v9 transactionDate];

  unint64_t context = self->_context;
  if (context == 2)
  {
LABEL_7:
    if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
    {
      objc_initWeak(&location, self);
      uint64_t v17 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v17 setIdentifier:v8];
      id v18 = PKLocalizedCocoonString(&cfstr_DashboardLoanP.isa);
      [(PKDashboardPassMessage *)v17 setTitle:v18];

      id v19 = PKLocalizedCocoonString(&cfstr_DashboardLoanP_0.isa);
      [(PKDashboardPassMessage *)v17 setMessage:v19];

      id v20 = PKLocalizedCocoonString(&cfstr_DashboardChatW.isa);
      [(PKDashboardPassMessage *)v17 setButtonTitle:v20];

      [(PKDashboardPassMessage *)v17 setShowDisclosure:1];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __73__PKPayLaterDashboardMessageComposer__financingPlanProActiveCancellation__block_invoke;
      v25[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v26, &location);
      [(PKDashboardPassMessage *)v17 setActionOnButtonPress:v25];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __73__PKPayLaterDashboardMessageComposer__financingPlanProActiveCancellation__block_invoke_2;
      v23[3] = &unk_1E59CB010;
      objc_copyWeak(&v24, &location);
      v23[4] = v5;
      [(PKDashboardPassMessage *)v17 setActionOnDismiss:v23];
      id v21 = [(PKPayLaterDashboardMessageComposer *)self _warningImage];
      [(PKDashboardPassMessage *)v17 setImage:v21];

      uint64_t v13 = [[PKPayLaterDashboardMessage alloc] initWithMessage:v17 priority:600 date:0];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);

      objc_destroyWeak(&location);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (context != 1)
  {
LABEL_10:
    uint64_t v13 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = [(PKPayLaterFinancingPlan *)self->_financingPlan state];
  uint64_t v13 = 0;
  if (self->_financingPlan && v12 == 2 && v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:v10];
    double v16 = v15;

    if (v16 > 259200.0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v13;
}

void __73__PKPayLaterDashboardMessageComposer__financingPlanProActiveCancellation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentBusinessChatForFinancingPlan:WeakRetained[13] topicType:1];
    id WeakRetained = v2;
  }
}

void __73__PKPayLaterDashboardMessageComposer__financingPlanProActiveCancellation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSharedCacheForKey:*(void *)(a1 + 32) value:1 reloadMessages:1];
    id WeakRetained = v3;
  }
}

- (void)_updateSharedCacheForKey:(id)a3 value:(BOOL)a4 reloadMessages:(BOOL)a5
{
  if (!self->_isAllContext)
  {
    BOOL v5 = a5;
    PKSharedCacheSetBoolForKey();
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained reloadMessages];
    }
  }
}

- (id)_systemImageWithName:(id)a3 tintColor:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x1E4FB1818];
  id v6 = a4;
  uint64_t v7 = [v5 systemImageNamed:a3];
  long long v8 = [v7 imageWithTintColor:v6];

  long long v9 = [v8 imageWithRenderingMode:1];

  return v9;
}

- (id)_warningImage
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4FB1830];
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  v9[0] = v3;
  uint64_t v4 = PKPayLaterWarningColor();
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v2 configurationWithPaletteColors:v5];

  uint64_t v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill" withConfiguration:v6];

  return v7;
}

- (id)_pencilImage
{
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v4 = [(PKPayLaterDashboardMessageComposer *)self _systemImageWithName:@"pencil" tintColor:v3];

  return v4;
}

- (id)_reverseImage
{
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v4 = [(PKPayLaterDashboardMessageComposer *)self _systemImageWithName:@"arrow.turn.up.right" tintColor:v3];

  return v4;
}

- (id)_uturnImage
{
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v4 = [(PKPayLaterDashboardMessageComposer *)self _systemImageWithName:@"arrow.uturn.right" tintColor:v3];

  return v4;
}

+ (void)resetPayLaterDashboardCache
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = PKSharedCacheGetKeysWithKeyPrefix();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        PKSharedCacheSetBoolForKey();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F84270], "sharedInstance", v8);
  [v7 updateWalletBadgeCountWithCompletion:0];
}

- (void)_displayDisputeExplanationViewControllerForFinancingPlan:(id)a3 contentType:(unint64_t)a4 messageIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F84340]);
  long long v11 = [(PKAccount *)self->_payLaterAccount accountIdentifier];
  [v10 setAccountIdentifier:v11];

  uint64_t v12 = [(PKAccount *)self->_payLaterAccount accountBaseURL];
  [v10 setBaseURL:v12];

  [v10 setType:a4];
  [(PKPayLaterDashboardMessageComposer *)self _showSpinnerForDashboardMessageIdentifier:v9 showSpinner:1];
  objc_initWeak(&location, self);
  uint64_t v13 = [MEMORY[0x1E4F84D50] sharedService];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __125__PKPayLaterDashboardMessageComposer__displayDisputeExplanationViewControllerForFinancingPlan_contentType_messageIdentifier___block_invoke;
  v16[3] = &unk_1E59D3BB0;
  objc_copyWeak(&v19, &location);
  id v14 = v8;
  id v17 = v14;
  id v15 = v9;
  id v18 = v15;
  [v13 accountPayLaterContentWithRequest:v10 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __125__PKPayLaterDashboardMessageComposer__displayDisputeExplanationViewControllerForFinancingPlan_contentType_messageIdentifier___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __125__PKPayLaterDashboardMessageComposer__displayDisputeExplanationViewControllerForFinancingPlan_contentType_messageIdentifier___block_invoke_2;
  v5[3] = &unk_1E59CE888;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __125__PKPayLaterDashboardMessageComposer__displayDisputeExplanationViewControllerForFinancingPlan_contentType_messageIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) dynamicContent];
    id v4 = [v3 dynamicContentPageForPageType:14];
    if (v4)
    {
      uint64_t v5 = [[PKPayLaterDisputeExplanationViewController alloc] initWithFinancingPlan:*(void *)(a1 + 40) dispute:0 payLaterAccount:*((void *)WeakRetained + 12) payLaterPass:*((void *)WeakRetained + 3) layout:0 dynamicContentPage:v4];
      id v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
      id v7 = objc_loadWeakRetained((id *)WeakRetained + 1);
      [v7 dashboardMessageComposer:WeakRetained requestPresentViewController:v6];
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "There is no dynamic content page for PKPayLaterDynamicContentPageTypeDashboardDispute, opening business chat instead", v10, 2u);
      }

      id v9 = PKAccountDisplayableError();
      uint64_t v5 = (PKPayLaterDisputeExplanationViewController *)PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);

      if (!v5) {
        goto LABEL_9;
      }
      id v6 = (PKNavigationController *)objc_loadWeakRetained((id *)WeakRetained + 1);
      [(PKNavigationController *)v6 dashboardMessageComposer:WeakRetained requestPresentViewController:v5];
    }

LABEL_9:
    [WeakRetained _showSpinnerForDashboardMessageIdentifier:*(void *)(a1 + 48) showSpinner:0];
  }
}

- (void)_displayDisputeEvidenceRequiredViewControllerForFinancingPlan:(id)a3 dispute:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [[PKPayLaterDisputeExplanationViewController alloc] initWithFinancingPlan:v7 dispute:v6 payLaterAccount:self->_payLaterAccount payLaterPass:self->_payLaterPass layout:1 dynamicContentPage:0];

  id v8 = [[PKNavigationController alloc] initWithRootViewController:v10];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dashboardMessageComposer:self requestPresentViewController:v8];
}

- (void)_showSpinnerForDashboardMessageIdentifier:(id)a3 showSpinner:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  int v6 = -[NSMutableSet containsObject:](self->_dashboardMessagesThatNeedSpinners, "containsObject:");
  if (v4 && (v6 & 1) == 0)
  {
    [(NSMutableSet *)self->_dashboardMessagesThatNeedSpinners addObject:v8];
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadMessages];

    goto LABEL_8;
  }
  if (!v4 && ((v6 ^ 1) & 1) == 0)
  {
    [(NSMutableSet *)self->_dashboardMessagesThatNeedSpinners removeObject:v8];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_presentBusinessChatForApplePayLaterAccountWithTopicType:(unint64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:1 topicType:a3];
  BOOL v4 = [[PKBusinessChatPayLaterContext alloc] initWithPayLaterAccount:self->_payLaterAccount paymentPass:self->_payLaterPass topic:v5 financingPlan:0 installment:0 payment:0 dispute:0];
  [(PKPayLaterDashboardMessageComposer *)self _presentBusinessChatWithContext:v4];
}

- (void)_presentBusinessChatForFinancingPlan:(id)a3 topicType:(unint64_t)a4
{
  int v6 = (objc_class *)MEMORY[0x1E4F84960];
  id v7 = a3;
  id v9 = (id)[[v6 alloc] initWithContext:2 topicType:a4];
  id v8 = [[PKBusinessChatPayLaterContext alloc] initWithPayLaterAccount:self->_payLaterAccount paymentPass:self->_payLaterPass topic:v9 financingPlan:v7 installment:0 payment:0 dispute:0];

  [(PKPayLaterDashboardMessageComposer *)self _presentBusinessChatWithContext:v8];
}

- (void)_presentBusinessChatWithContext:(id)a3
{
  id v4 = a3;
  if (!self->_businessChatController)
  {
    id v5 = objc_alloc_init(PKBusinessChatController);
    businessChatController = self->_businessChatController;
    self->_businessChatController = v5;
  }
  objc_initWeak(&location, self);
  id v7 = self->_businessChatController;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __70__PKPayLaterDashboardMessageComposer__presentBusinessChatWithContext___block_invoke;
  v8[3] = &unk_1E59CE0E8;
  objc_copyWeak(&v9, &location);
  void v8[4] = self;
  [(PKBusinessChatController *)v7 openBusinessChatWithContext:v4 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__PKPayLaterDashboardMessageComposer__presentBusinessChatWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPayLaterDashboardMessageComposer__presentBusinessChatWithContext___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __70__PKPayLaterDashboardMessageComposer__presentBusinessChatWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    int v6 = WeakRetained;
    id v3 = PKAccountDisplayableError();
    id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4)
    {
      id v5 = objc_loadWeakRetained(v6 + 1);
      [v5 dashboardMessageComposer:*(void *)(a1 + 40) requestPresentViewController:v4];
    }
    id WeakRetained = v6;
  }
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void)setPayLaterAccount:(id)a3
{
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_dashboardMessagesThatNeedSpinners, 0);
  objc_storeStrong((id *)&self->_shortDateFormatter, 0);
  objc_storeStrong((id *)&self->_allFinancingPlans, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end