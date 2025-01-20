@interface PKPayLaterBusinessChatTopicsSectionController
- (PKPayLaterBusinessChatTopicsSectionController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topics:(id)a8 businessChatContext:(unint64_t)a9 delegate:(id)a10;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureFinancingPlanSection:(id)a3;
- (void)_configureTopicsSection:(id)a3;
- (void)_financingPlansForTopic:(id)a3 completion:(id)a4;
- (void)_handleTopicRowTapped:(id)a3 topic:(id)a4;
- (void)_showListOfFinancingPlansForRow:(id)a3 topic:(id)a4;
- (void)_showTopicExplanationForRow:(id)a3 topic:(id)a4;
- (void)_updateIconForFinancingPlan:(id)a3;
@end

@implementation PKPayLaterBusinessChatTopicsSectionController

- (PKPayLaterBusinessChatTopicsSectionController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topics:(id)a8 businessChatContext:(unint64_t)a9 delegate:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v45 = a5;
  id v44 = a6;
  id v43 = a7;
  id v42 = a8;
  id v18 = a10;
  v50.receiver = self;
  v50.super_class = (Class)PKPayLaterBusinessChatTopicsSectionController;
  v19 = [(PKPayLaterSectionController *)&v50 initWithPayLaterAccount:v16 dynamicContentPage:0 viewControllerDelegate:v18];
  v20 = v19;
  if (v19)
  {
    id v41 = v18;
    objc_storeWeak((id *)&v19->_delegate, v18);
    p_financingPlan = &v20->_financingPlan;
    objc_storeStrong((id *)&v20->_financingPlan, a5);
    objc_storeStrong((id *)&v20->_payLaterPass, a4);
    objc_storeStrong((id *)&v20->_installment, a6);
    p_payment = &v20->_payment;
    objc_storeStrong((id *)&v20->_payment, a7);
    p_topics = (id *)&v20->_topics;
    objc_storeStrong((id *)&v20->_topics, a8);
    v20->_businessChatContext = a9;
    v22 = (PKAccountService *)objc_alloc_init(MEMORY[0x1E4F84270]);
    accountService = v20->_accountService;
    v20->_accountService = v22;

    v24 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
    iconGenerator = v20->_iconGenerator;
    v20->_iconGenerator = v24;

    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(NSArray *)v20->_topics count])
    {
      v27 = 0;
      do
      {
        v28 = objc_msgSend(*p_topics, "objectAtIndexedSubscript:", v27, p_payment);
        objc_initWeak(&location, v20);
        v29 = [PKPayLaterTitleDetailRow alloc];
        v30 = [v28 displayText];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __156__PKPayLaterBusinessChatTopicsSectionController_initWithPayLaterAccount_payLaterPass_financingPlan_installment_payment_topics_businessChatContext_delegate___block_invoke;
        v46[3] = &unk_1E59CFBA8;
        objc_copyWeak(v48, &location);
        v48[1] = v27;
        id v31 = v28;
        id v47 = v31;
        v32 = [(PKPayLaterTitleDetailRow *)v29 initWithTitle:v30 detail:0 selectionHandler:v46];

        [v26 addObject:v32];
        objc_destroyWeak(v48);
        objc_destroyWeak(&location);

        ++v27;
      }
      while ((unint64_t)v27 < [*p_topics count]);
    }
    uint64_t v33 = objc_msgSend(v26, "copy", p_payment);
    topicsRows = v20->_topicsRows;
    v20->_topicsRows = (NSArray *)v33;

    if (*p_financingPlan)
    {
      uint64_t v35 = +[PKPayLaterIconTextRow rowConfiguredForDisputeLayoutWithFinancingPlan:*p_financingPlan payment:*v39 selectionHandler:0];
      iconTextRow = v20->_iconTextRow;
      v20->_iconTextRow = (PKPayLaterIconTextRow *)v35;

      [(PKPayLaterBusinessChatTopicsSectionController *)v20 _updateIconForFinancingPlan:*p_financingPlan];
    }

    id v18 = v41;
  }

  return v20;
}

void __156__PKPayLaterBusinessChatTopicsSectionController_initWithPayLaterAccount_payLaterPass_financingPlan_installment_payment_topics_businessChatContext_delegate___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = [WeakRetained[18] objectAtIndex:*(void *)(a1 + 48)];
    [v4 _handleTopicRowTapped:v3 topic:*(void *)(a1 + 32)];

    WeakRetained = v4;
  }
}

- (void)_updateIconForFinancingPlan:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  iconGenerator = self->_iconGenerator;
  v6 = [v4 merchant];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PKPayLaterBusinessChatTopicsSectionController__updateIconForFinancingPlan___block_invoke;
  v8[3] = &unk_1E59CB888;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  v7 = -[PKPaymentTransactionIconGenerator iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v6, 0, 0, v8, 45.0, 45.0);

  [(PKPayLaterIconTextRow *)self->_iconTextRow setIcon:v7];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __77__PKPayLaterBusinessChatTopicsSectionController__updateIconForFinancingPlan___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKPayLaterBusinessChatTopicsSectionController__updateIconForFinancingPlan___block_invoke_2;
  block[3] = &unk_1E59D1400;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __77__PKPayLaterBusinessChatTopicsSectionController__updateIconForFinancingPlan___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      [WeakRetained[20] setIcon:*(void *)(a1 + 32)];
      id v3 = [v4 dynamicCollectionDelegate];
      [v3 reloadItem:*(void *)(*(void *)(a1 + 40) + 160) animated:1];

      WeakRetained = v4;
    }
  }
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = v3;
  if (self->_financingPlan) {
    [v3 addObject:@"kFinancingPlanSection"];
  }
  if ([(NSArray *)self->_topics count]) {
    [v4 addObject:@"kTopicsSection"];
  }
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  uint64_t v7 = (__CFString *)v5;
  id v8 = v7;
  if (v7 == @"kFinancingPlanSection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [@"kFinancingPlanSection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterBusinessChatTopicsSectionController *)self _configureFinancingPlanSection:v6];
  }
  else
  {
    v11 = v8;
    if (v11 == @"kTopicsSection"
      || (v12 = v11, int v13 = [@"kTopicsSection" isEqualToString:v11], v12, v13))
    {
      [(PKPayLaterBusinessChatTopicsSectionController *)self _configureTopicsSection:v6];
    }
  }
LABEL_5:

  return v6;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  id v5 = v4;
  if ((v4 == @"kTopicsSection"
     || v4 && (int v6 = [@"kTopicsSection" isEqualToString:v4], v5, v6))
    && (unint64_t v7 = self->_businessChatContext - 1, v7 <= 2)
    && (PKLocalizedCocoonString(&off_1E59D3BD0[v7]->isa), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v9 = (void *)v8;
    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    v11 = [v9 uppercaseString];
    v17[0] = *MEMORY[0x1E4FB06F8];
    v12 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
    v18[0] = v12;
    v17[1] = *MEMORY[0x1E4FB0700];
    int v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v18[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v15 = (void *)[v10 initWithString:v11 attributes:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterBusinessChatTopicsSectionController;
  unint64_t v7 = [(PKPayLaterSectionController *)&v20 layoutWithLayoutEnvironment:a3 sectionIdentifier:v6];
  [v7 contentInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = (__CFString *)v6;
  id v17 = v16;
  if (v16 == @"kFinancingPlanSection"
    || v16 && (int v18 = [@"kFinancingPlanSection" isEqualToString:v16], v17, v18))
  {
    double v9 = 16.0;
  }
  objc_msgSend(v7, "setContentInsets:", v9, v11, v13, v15);

  return v7;
}

- (void)_configureFinancingPlanSection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  [v7 safelyAddObject:self->_iconTextRow];
  id v6 = (void *)[v7 copy];
  [v5 appendItems:v6];
}

- (void)_configureTopicsSection:(id)a3
{
}

- (void)_financingPlansForTopic:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PKPayLaterSectionController *)self payLaterAccount];
  double v9 = [v8 accountIdentifier];

  double v10 = [v7 relevantFinancingPlanStates];

  uint64_t v11 = [v10 count];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc(MEMORY[0x1E4F1CA80]);
  double v14 = [MEMORY[0x1E4F84998] activeFinancingPlanStates];
  double v15 = (void *)[v13 initWithArray:v14];

  if (v11) {
    [v15 intersectSet:v10];
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v17 = [MEMORY[0x1E4F84998] completedFinancingPlanStates];
  int v18 = (void *)[v16 initWithArray:v17];

  if (v11) {
    [v18 intersectSet:v10];
  }
  if ([v15 count])
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F84280]) initWithAccountIdentifier:v9 queryItems:32];
    objc_super v20 = [v15 allObjects];
    [v19 setRelevantFinancingPlanStates:v20];

    [v12 addObject:v19];
  }
  else
  {
    v19 = 0;
  }
  if ([v18 count])
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F84280]) initWithAccountIdentifier:v9 queryItems:32];
    v22 = [v18 allObjects];
    [v21 setRelevantFinancingPlanStates:v22];

    [v12 addObject:v21];
  }
  else
  {
    v21 = 0;
  }
  accountService = self->_accountService;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __84__PKPayLaterBusinessChatTopicsSectionController__financingPlansForTopic_completion___block_invoke;
  v27[3] = &unk_1E59D3B60;
  id v28 = v19;
  id v29 = v21;
  id v30 = v6;
  id v24 = v6;
  id v25 = v21;
  id v26 = v19;
  [(PKAccountService *)accountService financingPlansWithQueries:v12 completion:v27];
}

void __84__PKPayLaterBusinessChatTopicsSectionController__financingPlansForTopic_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__PKPayLaterBusinessChatTopicsSectionController__financingPlansForTopic_completion___block_invoke_2;
  v5[3] = &unk_1E59CB728;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = v3;
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __84__PKPayLaterBusinessChatTopicsSectionController__financingPlansForTopic_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queryIdentifier];
  uint64_t v3 = [*(id *)(a1 + 40) queryIdentifier];
  id v4 = (void *)v3;
  if (v2)
  {
    id v5 = [*(id *)(a1 + 48) objectForKeyedSubscript:v2];
    id v8 = [v5 relevantFinancingPlans];

    if (v4)
    {
LABEL_3:
      id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      id v7 = [v6 relevantFinancingPlans];

      goto LABEL_6;
    }
  }
  else
  {
    id v8 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
  id v7 = 0;
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_handleTopicRowTapped:(id)a3 topic:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_financingPlan || ![v6 requiresFinancingPlan]) {
    [(PKPayLaterBusinessChatTopicsSectionController *)self _showTopicExplanationForRow:v8 topic:v7];
  }
  else {
    [(PKPayLaterBusinessChatTopicsSectionController *)self _showListOfFinancingPlansForRow:v8 topic:v7];
  }
}

- (void)_showListOfFinancingPlansForRow:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setShowSpinner:1];
  id v8 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v8 reloadItem:v6 animated:1];

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__PKPayLaterBusinessChatTopicsSectionController__showListOfFinancingPlansForRow_topic___block_invoke;
  v11[3] = &unk_1E59D3B88;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [(PKPayLaterBusinessChatTopicsSectionController *)self _financingPlansForTopic:v9 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __87__PKPayLaterBusinessChatTopicsSectionController__showListOfFinancingPlansForRow_topic___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v18 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = [WeakRetained payLaterAccount];
    double v15 = +[PKPayLaterFinancingPlanListViewController disputeFinancingPlansListViewControllerWithPayLaterAccount:v14 payLaterPass:*((void *)v13 + 13) businessChatTopic:*(void *)(a1 + 32) financingPlans:v18 completedFinancingPlans:v9 financingPlansUpdateQuery:v10 completedFinancingPlansQuery:v11];

    id v16 = objc_loadWeakRetained((id *)v13 + 12);
    [v16 pushViewController:v15 animated:1];

    [*(id *)(a1 + 40) setShowSpinner:0];
    id v17 = [v13 dynamicCollectionDelegate];
    [v17 reloadItem:*(void *)(a1 + 40) animated:1];
  }
}

- (void)_showTopicExplanationForRow:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setShowSpinner:1];
  id v8 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v8 reloadItem:v6 animated:1];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F84348]) initWithTopic:v7];
  id v10 = [(PKPayLaterSectionController *)self payLaterAccount];
  id v11 = [v10 accountIdentifier];
  [v9 setAccountIdentifier:v11];

  id v12 = [(PKPayLaterSectionController *)self payLaterAccount];
  id v13 = [v12 accountBaseURL];
  [v9 setBaseURL:v13];

  [v9 setFinancingPlan:self->_financingPlan];
  [v9 setPayment:self->_payment];
  [v9 setInstallment:self->_installment];
  objc_initWeak(&location, self);
  id v14 = [MEMORY[0x1E4F84D50] sharedService];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __83__PKPayLaterBusinessChatTopicsSectionController__showTopicExplanationForRow_topic___block_invoke;
  v17[3] = &unk_1E59D3BB0;
  objc_copyWeak(&v20, &location);
  id v15 = v7;
  id v18 = v15;
  id v16 = v6;
  id v19 = v16;
  [v14 accountPayLaterContentWithRequest:v9 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __83__PKPayLaterBusinessChatTopicsSectionController__showTopicExplanationForRow_topic___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__PKPayLaterBusinessChatTopicsSectionController__showTopicExplanationForRow_topic___block_invoke_2;
  v5[3] = &unk_1E59CE888;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __83__PKPayLaterBusinessChatTopicsSectionController__showTopicExplanationForRow_topic___block_invoke_2(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v3 = [a1[4] reportIssueTopics];
    id v4 = [v3 firstObject];

    [a1[5] updateWithBusinessChatTopic:v4];
    id v5 = [a1[4] dynamicContent];
    id v6 = [v5 dynamicContentPageForPageType:12];
    if (v6)
    {
      id v7 = [PKPayLaterBusinessChatTopicExplanationViewController alloc];
      id v8 = [WeakRetained payLaterAccount];
      id v9 = [(PKPayLaterBusinessChatTopicExplanationViewController *)v7 initWithPayLaterAccount:v8 payLaterPass:WeakRetained[13] financingPlan:WeakRetained[14] installment:WeakRetained[15] payment:WeakRetained[16] topic:a1[5] dynamicContent:v5];

      id v10 = objc_loadWeakRetained(WeakRetained + 12);
      [v10 pushViewController:v9 animated:1];
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "There is no dynamic content page for PKPayLaterDynamicContentPageTypeDisputeTopicExplanation, opening business chat instead", buf, 2u);
      }

      id v9 = (PKPayLaterBusinessChatTopicExplanationViewController *)objc_loadWeakRetained(WeakRetained + 12);
      [(PKPayLaterBusinessChatTopicExplanationViewController *)v9 openBusinessChatForTopic:a1[5]];
    }

    [a1[6] setShowSpinner:0];
    id v12 = [WeakRetained dynamicCollectionDelegate];
    [v12 reloadItem:a1[6] animated:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_iconTextRow, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_topicsRows, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end