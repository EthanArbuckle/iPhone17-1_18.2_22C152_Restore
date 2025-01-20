@interface PKPayLaterFinancingPlanListSectionController
- (NSArray)primaryFinancingPlans;
- (NSArray)secondaryFinancingPlans;
- (NSDirectionalEdgeInsets)firstSectionHeaderEdgeInsets;
- (PKPayLaterBusinessChatTopic)businessChatTopic;
- (PKPayLaterFinancingPlanListSectionController)initWithPayLaterAccount:(id)a3 context:(unint64_t)a4 primaryFinancingPlans:(id)a5 secondaryFinancingPlans:(id)a6 tertiaryFinancingPlansCount:(int64_t)a7 payLaterPass:(id)a8 businessChatTopic:(id)a9 paymentIntentController:(id)a10 dynamicContentPage:(id)a11 delegate:(id)a12;
- (PKPaymentPass)payLaterPass;
- (id)_createFinancingPlanRowForPlan:(id)a3 rowIndex:(int64_t)a4;
- (id)_createIconTextRowForPlan:(id)a3;
- (id)_rowForPlanIdentifier:(id)a3;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (int64_t)tertiaryFinancingPlansCount;
- (unint64_t)context;
- (void)_configurePrimaryFinancingPlansSection:(id)a3;
- (void)_configureSecondaryFinancingPlansSection:(id)a3;
- (void)_configureTertiaryFinancingPlansCountSection:(id)a3;
- (void)_showTopicExplanationForRow:(id)a3 topic:(id)a4 financingPlan:(id)a5 continueBlock:(id)a6;
- (void)_updateCachedValues;
- (void)_updateIconForFinancingPlan:(id)a3 row:(id)a4;
- (void)setBusinessChatTopic:(id)a3;
- (void)setPayLaterPass:(id)a3;
- (void)setPrimaryFinancingPlans:(id)a3;
- (void)setSecondaryFinancingPlans:(id)a3;
- (void)setTertiaryFinancingPlansCount:(int64_t)a3;
@end

@implementation PKPayLaterFinancingPlanListSectionController

- (PKPayLaterFinancingPlanListSectionController)initWithPayLaterAccount:(id)a3 context:(unint64_t)a4 primaryFinancingPlans:(id)a5 secondaryFinancingPlans:(id)a6 tertiaryFinancingPlansCount:(int64_t)a7 payLaterPass:(id)a8 businessChatTopic:(id)a9 paymentIntentController:(id)a10 dynamicContentPage:(id)a11 delegate:(id)a12
{
  id v37 = a5;
  id v36 = a6;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v18 = a12;
  v38.receiver = self;
  v38.super_class = (Class)PKPayLaterFinancingPlanListSectionController;
  v19 = [(PKPayLaterSectionController *)&v38 initWithPayLaterAccount:a3 dynamicContentPage:a11 viewControllerDelegate:v18];
  v20 = v19;
  if (v19)
  {
    v19->_context = a4;
    objc_storeStrong((id *)&v19->_primaryFinancingPlans, a5);
    objc_storeStrong((id *)&v20->_secondaryFinancingPlans, a6);
    v20->_tertiaryFinancingPlansCount = a7;
    objc_storeStrong((id *)&v20->_payLaterPass, a8);
    objc_storeStrong((id *)&v20->_businessChatTopic, a9);
    objc_storeStrong((id *)&v20->_paymentIntentController, a10);
    objc_storeWeak((id *)&v20->_delegate, v18);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    primaryFinancingPlanRows = v20->_primaryFinancingPlanRows;
    v20->_primaryFinancingPlanRows = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    secondaryFinancingPlanRows = v20->_secondaryFinancingPlanRows;
    v20->_secondaryFinancingPlanRows = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    icons = v20->_icons;
    v20->_icons = v25;

    v27 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v20->_numberFormatter;
    v20->_numberFormatter = v27;

    [(NSNumberFormatter *)v20->_numberFormatter setNumberStyle:1];
    v29 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
    iconGenerator = v20->_iconGenerator;
    v20->_iconGenerator = v29;

    [(PKPayLaterFinancingPlanListSectionController *)v20 _updateCachedValues];
  }

  return v20;
}

- (void)setPrimaryFinancingPlans:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFinancingPlans, a3);

  [(PKPayLaterFinancingPlanListSectionController *)self _updateCachedValues];
}

- (void)setSecondaryFinancingPlans:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryFinancingPlans, a3);

  [(PKPayLaterFinancingPlanListSectionController *)self _updateCachedValues];
}

- (void)setTertiaryFinancingPlansCount:(int64_t)a3
{
  self->_tertiaryFinancingPlansCount = a3;
  [(PKPayLaterFinancingPlanListSectionController *)self _updateCachedValues];
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)self->_primaryFinancingPlans count]) {
    [v3 addObject:@"kPrimaryFinancingPlansSection"];
  }
  if ([(NSArray *)self->_secondaryFinancingPlans count]) {
    [v3 addObject:@"kSecondaryFinancingPlansSection"];
  }
  if (self->_tertiaryFinancingPlansCount >= 1) {
    [v3 addObject:@"kTertiaryFinancingPlansCountSection"];
  }
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"kPrimaryFinancingPlansSection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [@"kPrimaryFinancingPlansSection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterFinancingPlanListSectionController *)self _configurePrimaryFinancingPlansSection:v6];
  }
  else
  {
    v11 = v8;
    if (v11 == @"kSecondaryFinancingPlansSection"
      || (v12 = v11,
          int v13 = [@"kSecondaryFinancingPlansSection" isEqualToString:v11],
          v12,
          v13))
    {
      [(PKPayLaterFinancingPlanListSectionController *)self _configureSecondaryFinancingPlansSection:v6];
    }
    else
    {
      v14 = v12;
      if (v14 == @"kTertiaryFinancingPlansCountSection"
        || (v15 = v14,
            int v16 = [@"kTertiaryFinancingPlansCountSection" isEqualToString:v14],
            v15,
            v16))
      {
        [(PKPayLaterFinancingPlanListSectionController *)self _configureTertiaryFinancingPlansCountSection:v6];
      }
    }
  }
LABEL_5:

  return v6;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSArray *)self->_primaryFinancingPlans count]
    || ![(NSArray *)self->_secondaryFinancingPlans count])
  {
    goto LABEL_12;
  }
  id v5 = (__CFString *)v4;
  if (v5 == @"kPrimaryFinancingPlansSection") {
    goto LABEL_6;
  }
  id v6 = v5;
  if (!v5) {
    goto LABEL_12;
  }
  char v7 = [@"kPrimaryFinancingPlansSection" isEqualToString:v5];

  if (v7)
  {
LABEL_6:
    v8 = @"DISPUTE_ACTIVE_HEADER_TITLE";
  }
  else
  {
    v17 = v6;
    if (v17 != @"kSecondaryFinancingPlansSection")
    {
      id v18 = v17;
      int v19 = [@"kSecondaryFinancingPlansSection" isEqualToString:v17];

      if (!v19) {
        goto LABEL_12;
      }
    }
    v8 = @"DISPUTE_COMPLETED_HEADER_TITLE";
  }
  uint64_t v9 = PKLocalizedCocoonString(&v8->isa);
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    v12 = [v10 uppercaseString];
    v21[0] = *MEMORY[0x1E4FB06F8];
    int v13 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
    v22[0] = v13;
    v21[1] = *MEMORY[0x1E4FB0700];
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v22[1] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    int v16 = (void *)[v11 initWithString:v12 attributes:v15];

    goto LABEL_13;
  }
LABEL_12:
  int v16 = 0;
LABEL_13:

  return v16;
}

- (NSDirectionalEdgeInsets)firstSectionHeaderEdgeInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 8.0;
  double v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)_configurePrimaryFinancingPlansSection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_sortedPriaryFinancingPlanIdentifiers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[NSMutableDictionary objectForKey:](self->_primaryFinancingPlanRows, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        [v5 safelyAddObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  [v4 appendItems:v12];
}

- (void)_configureSecondaryFinancingPlansSection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_context == 3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_sortedSecondaryFinancingPlanIdentifiers;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = -[NSMutableDictionary objectForKey:](self->_secondaryFinancingPlanRows, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
          [v5 safelyAddObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  v12 = objc_msgSend(v5, "copy", (void)v13);
  [v4 appendItems:v12];
}

- (void)_configureTertiaryFinancingPlansCountSection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_context == 2)
  {
    numberFormatter = self->_numberFormatter;
    uint64_t v7 = [NSNumber numberWithInteger:self->_tertiaryFinancingPlansCount];
    uint64_t v8 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v7];

    uint64_t v9 = [PKPayLaterTitleDetailValueRow alloc];
    uint64_t v10 = PKLocalizedCocoonString(&cfstr_CompletedLoans.isa);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke;
    v17 = &unk_1E59CA7F8;
    objc_copyWeak(&v18, &location);
    id v11 = [(PKPayLaterTitleDetailValueRow *)v9 initWithTitle:v10 detail:0 value:v8 accessory:1 selectionHandler:&v14];

    v12 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    -[PKPayLaterTitleDetailValueRow setTitleFont:](v11, "setTitleFont:", v12, v14, v15, v16, v17);

    [v5 safelyAddObject:v11];
    objc_destroyWeak(&v18);
  }
  long long v13 = (void *)[v5 copy];
  [v4 appendItems:v13];

  objc_destroyWeak(&location);
}

void __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F84280]);
    id v4 = [WeakRetained payLaterAccount];
    id v5 = [v4 accountIdentifier];
    id v6 = (void *)[v3 initWithAccountIdentifier:v5 queryItems:8];

    uint64_t v7 = [MEMORY[0x1E4F84270] sharedInstance];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke_2;
    v9[3] = &unk_1E59CD6D0;
    objc_copyWeak(&v11, v1);
    id v8 = v6;
    id v10 = v8;
    [v7 financingPlansWithQuery:v8 completion:v9];

    objc_destroyWeak(&v11);
  }
}

void __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke_3;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = [WeakRetained payLaterAccount];
    uint64_t v4 = *((void *)v8 + 12);
    id v5 = [*(id *)(a1 + 32) completedFinancingPlans];
    id v6 = +[PKPayLaterFinancingPlanListViewController completedFinancingPlansListViewControllerWithPayLaterAccount:v3 paymentIntentController:v4 completedFinancingPlans:v5 completedFinancingPlansQuery:*(void *)(a1 + 40)];

    id v7 = objc_loadWeakRetained((id *)v8 + 19);
    [v7 pushViewController:v6 animated:1];

    id WeakRetained = v8;
  }
}

- (void)_showTopicExplanationForRow:(id)a3 topic:(id)a4 financingPlan:(id)a5 continueBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v10 setAccessory:2];
  uint64_t v14 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v14 reloadItem:v10 animated:1];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F84348]) initWithTopic:v11];
  long long v16 = [(PKPayLaterSectionController *)self payLaterAccount];
  v17 = [v16 accountIdentifier];
  [v15 setAccountIdentifier:v17];

  id v18 = [(PKPayLaterSectionController *)self payLaterAccount];
  int v19 = [v18 accountBaseURL];
  [v15 setBaseURL:v19];

  [v15 setFinancingPlan:v12];
  objc_initWeak(&location, self);
  v20 = [MEMORY[0x1E4F84D50] sharedService];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __110__PKPayLaterFinancingPlanListSectionController__showTopicExplanationForRow_topic_financingPlan_continueBlock___block_invoke;
  v25[3] = &unk_1E59D0DF0;
  objc_copyWeak(&v30, &location);
  id v21 = v11;
  id v26 = v21;
  id v22 = v12;
  id v27 = v22;
  id v23 = v10;
  id v28 = v23;
  id v24 = v13;
  id v29 = v24;
  [v20 accountPayLaterContentWithRequest:v15 completion:v25];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __110__PKPayLaterFinancingPlanListSectionController__showTopicExplanationForRow_topic_financingPlan_continueBlock___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __110__PKPayLaterFinancingPlanListSectionController__showTopicExplanationForRow_topic_financingPlan_continueBlock___block_invoke_2;
  v5[3] = &unk_1E59D0DC8;
  objc_copyWeak(&v11, a1 + 8);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v11);
}

void __110__PKPayLaterFinancingPlanListSectionController__showTopicExplanationForRow_topic_financingPlan_continueBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) reportIssueTopics];
    id v4 = [v3 firstObject];

    [*(id *)(a1 + 40) updateWithBusinessChatTopic:v4];
    id v5 = [*(id *)(a1 + 32) dynamicContent];
    id v6 = [v5 dynamicContentPageForPageType:12];
    if (v6)
    {
      id v7 = [PKPayLaterBusinessChatTopicExplanationViewController alloc];
      id v8 = [WeakRetained payLaterAccount];
      id v9 = [(PKPayLaterBusinessChatTopicExplanationViewController *)v7 initWithPayLaterAccount:v8 payLaterPass:WeakRetained[25] financingPlan:*(void *)(a1 + 48) installment:0 payment:0 topic:*(void *)(a1 + 40) dynamicContent:v5];

      id v10 = objc_loadWeakRetained(WeakRetained + 19);
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

      id v9 = (PKPayLaterBusinessChatTopicExplanationViewController *)objc_loadWeakRetained(WeakRetained + 19);
      [(PKPayLaterBusinessChatTopicExplanationViewController *)v9 openBusinessChatForTopic:*(void *)(a1 + 40) financingPlan:*(void *)(a1 + 48)];
    }

    [*(id *)(a1 + 56) setAccessory:1];
    id v12 = [WeakRetained dynamicCollectionDelegate];
    [v12 reloadItem:*(void *)(a1 + 56) animated:1];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (id)_rowForPlanIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_primaryFinancingPlanRows objectForKey:v4];
  if (!v5)
  {
    id v5 = [(NSMutableDictionary *)self->_secondaryFinancingPlanRows objectForKey:v4];
  }

  return v5;
}

- (id)_createIconTextRowForPlan:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PKPayLaterFinancingPlanListSectionController__createIconTextRowForPlan___block_invoke;
  v8[3] = &unk_1E59D0E18;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = +[PKPayLaterIconTextRow rowConfiguredForDisputeLayoutWithFinancingPlan:v5 payment:0 selectionHandler:v8];
  [(PKPayLaterFinancingPlanListSectionController *)self _updateIconForFinancingPlan:v5 row:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __74__PKPayLaterFinancingPlanListSectionController__createIconTextRowForPlan___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) planIdentifier];
    id v5 = [WeakRetained _rowForPlanIdentifier:v4];

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [WeakRetained _showTopicExplanationForRow:v5 topic:WeakRetained[24] financingPlan:*(void *)(a1 + 32) continueBlock:v6];
      }
    }
  }
}

- (id)_createFinancingPlanRowForPlan:(id)a3 rowIndex:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [PKPayLaterFinancingPlanRow alloc];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __88__PKPayLaterFinancingPlanListSectionController__createFinancingPlanRowForPlan_rowIndex___block_invoke;
  uint64_t v14 = &unk_1E59D0E68;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v15 = v8;
  long long v16 = self;
  id v9 = [(PKPayLaterFinancingPlanRow *)v7 initWithFinancingPlan:v8 rowIndex:a4 selectionHandler:&v11];
  -[PKPayLaterFinancingPlanListSectionController _updateIconForFinancingPlan:row:](self, "_updateIconForFinancingPlan:row:", v8, v9, v11, v12, v13, v14);
  [(PKPayLaterFinancingPlanRow *)v9 setContext:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v9;
}

void __88__PKPayLaterFinancingPlanListSectionController__createFinancingPlanRowForPlan_rowIndex___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)WeakRetained[17];
    id v7 = [a1[4] planIdentifier];
    id v8 = [v6 objectForKey:v7];

    id v9 = [PKPayLaterFinancingPlanViewController alloc];
    id v10 = a1[4];
    uint64_t v11 = [a1[5] payLaterAccount];
    uint64_t v12 = [(PKPayLaterFinancingPlanViewController *)v9 initWithFinancingPlan:v10 payLaterAccount:v11 paymentIntentController:v5[12] merchantIcon:v8 iconGenerator:0];

    objc_initWeak(&location, a1[5]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__PKPayLaterFinancingPlanListSectionController__createFinancingPlanRowForPlan_rowIndex___block_invoke_2;
    v14[3] = &unk_1E59D0E40;
    objc_copyWeak(&v17, &location);
    id v13 = v12;
    id v15 = v13;
    id v16 = v3;
    [(PKPayLaterFinancingPlanViewController *)v13 preflightWithCompletion:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __88__PKPayLaterFinancingPlanListSectionController__createFinancingPlanRowForPlan_rowIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 19);
    [v3 pushViewController:*(void *)(a1 + 32) animated:1];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v4;
  }
}

- (void)_updateIconForFinancingPlan:(id)a3 row:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  iconGenerator = self->_iconGenerator;
  id v9 = [v6 merchant];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __80__PKPayLaterFinancingPlanListSectionController__updateIconForFinancingPlan_row___block_invoke;
  id v17 = &unk_1E59D0EB8;
  objc_copyWeak(&v20, &location);
  id v18 = self;
  id v10 = v6;
  id v19 = v10;
  uint64_t v11 = -[PKPaymentTransactionIconGenerator iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v9, 0, 0, &v14, 45.0, 45.0);

  if (v11)
  {
    icons = self->_icons;
    id v13 = objc_msgSend(v10, "planIdentifier", v14, v15, v16, v17, v18);
    [(NSMutableDictionary *)icons setObject:v11 forKey:v13];
  }
  objc_msgSend(v7, "setIcon:", v11, v14, v15, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __80__PKPayLaterFinancingPlanListSectionController__updateIconForFinancingPlan_row___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PKPayLaterFinancingPlanListSectionController__updateIconForFinancingPlan_row___block_invoke_2;
  v6[3] = &unk_1E59D0E90;
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v5 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v10);
}

void __80__PKPayLaterFinancingPlanListSectionController__updateIconForFinancingPlan_row___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      uint64_t v11 = WeakRetained;
      id v3 = *(void **)(a1 + 40);
      id v4 = [*(id *)(a1 + 48) planIdentifier];
      id v5 = [v3 _rowForPlanIdentifier:v4];

      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        id v7 = (void *)v11[17];
        uint64_t v8 = [*(id *)(a1 + 48) planIdentifier];
        [v7 setObject:v6 forKey:v8];

        uint64_t v9 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v9 = 0;
      }
      [v5 setIcon:v9];
      id v10 = [v11 dynamicCollectionDelegate];
      [v10 reloadItem:v5 animated:1];

      id WeakRetained = v11;
    }
  }
}

- (void)_updateCachedValues
{
  id v3 = [(NSArray *)self->_primaryFinancingPlans pk_arrayByApplyingBlock:&__block_literal_global_62];
  sortedPriaryFinancingPlanIdentifiers = self->_sortedPriaryFinancingPlanIdentifiers;
  self->_sortedPriaryFinancingPlanIdentifiers = v3;

  if ([(NSArray *)self->_primaryFinancingPlans count])
  {
    unint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [(NSArray *)self->_primaryFinancingPlans objectAtIndexedSubscript:v5];
      NSUInteger v7 = [(NSArray *)self->_primaryFinancingPlans count];
      unint64_t context = self->_context;
      if (context < 3) {
        break;
      }
      if (context == 3)
      {
        uint64_t v9 = [(PKPayLaterFinancingPlanListSectionController *)self _createIconTextRowForPlan:v6];
        goto LABEL_8;
      }
      id v10 = 0;
LABEL_9:
      unint64_t v11 = v5 + 1;
      if (v5 + 1 == v7) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 1;
      }
      if (v5) {
        uint64_t v13 = 2 * (v5 + 1 == v7);
      }
      else {
        uint64_t v13 = v12;
      }
      [v10 setMaskType:v13];
      primaryFinancingPlanRows = self->_primaryFinancingPlanRows;
      uint64_t v15 = [v6 planIdentifier];
      [(NSMutableDictionary *)primaryFinancingPlanRows setObject:v10 forKey:v15];

      unint64_t v5 = v11;
      if (v11 >= [(NSArray *)self->_primaryFinancingPlans count]) {
        goto LABEL_16;
      }
    }
    uint64_t v9 = [(PKPayLaterFinancingPlanListSectionController *)self _createFinancingPlanRowForPlan:v6 rowIndex:v5];
LABEL_8:
    id v10 = (void *)v9;
    goto LABEL_9;
  }
LABEL_16:
  id v16 = [(NSArray *)self->_secondaryFinancingPlans pk_arrayByApplyingBlock:&__block_literal_global_54];
  sortedSecondaryFinancingPlanIdentifiers = self->_sortedSecondaryFinancingPlanIdentifiers;
  self->_sortedSecondaryFinancingPlanIdentifiers = v16;

  id v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  secondaryFinancingPlanRows = self->_secondaryFinancingPlanRows;
  self->_secondaryFinancingPlanRows = v18;

  if ([(NSArray *)self->_secondaryFinancingPlans count])
  {
    unint64_t v20 = 0;
    do
    {
      id v21 = [(NSArray *)self->_secondaryFinancingPlans objectAtIndexedSubscript:v20];
      NSUInteger v22 = [(NSArray *)self->_secondaryFinancingPlans count];
      unint64_t v23 = v20 + 1;
      id v24 = [(PKPayLaterFinancingPlanListSectionController *)self _createIconTextRowForPlan:v21];
      v25 = v24;
      if (v20 + 1 == v22) {
        uint64_t v26 = 3;
      }
      else {
        uint64_t v26 = 1;
      }
      if (v20) {
        uint64_t v27 = 2 * (v20 + 1 == v22);
      }
      else {
        uint64_t v27 = v26;
      }
      [v24 setMaskType:v27];
      id v28 = self->_secondaryFinancingPlanRows;
      id v29 = [v21 planIdentifier];
      [(NSMutableDictionary *)v28 setObject:v25 forKey:v29];

      unint64_t v20 = v23;
    }
    while (v23 < [(NSArray *)self->_secondaryFinancingPlans count]);
  }
}

uint64_t __67__PKPayLaterFinancingPlanListSectionController__updateCachedValues__block_invoke(uint64_t a1, void *a2)
{
  return [a2 planIdentifier];
}

uint64_t __67__PKPayLaterFinancingPlanListSectionController__updateCachedValues__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 planIdentifier];
}

- (unint64_t)context
{
  return self->_context;
}

- (NSArray)primaryFinancingPlans
{
  return self->_primaryFinancingPlans;
}

- (NSArray)secondaryFinancingPlans
{
  return self->_secondaryFinancingPlans;
}

- (PKPayLaterBusinessChatTopic)businessChatTopic
{
  return self->_businessChatTopic;
}

- (void)setBusinessChatTopic:(id)a3
{
}

- (PKPaymentPass)payLaterPass
{
  return self->_payLaterPass;
}

- (void)setPayLaterPass:(id)a3
{
}

- (int64_t)tertiaryFinancingPlansCount
{
  return self->_tertiaryFinancingPlansCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_businessChatTopic, 0);
  objc_storeStrong((id *)&self->_secondaryFinancingPlans, 0);
  objc_storeStrong((id *)&self->_primaryFinancingPlans, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_secondaryFinancingPlanRows, 0);
  objc_storeStrong((id *)&self->_primaryFinancingPlanRows, 0);
  objc_storeStrong((id *)&self->_sortedSecondaryFinancingPlanIdentifiers, 0);
  objc_storeStrong((id *)&self->_sortedPriaryFinancingPlanIdentifiers, 0);

  objc_storeStrong((id *)&self->_paymentIntentController, 0);
}

@end