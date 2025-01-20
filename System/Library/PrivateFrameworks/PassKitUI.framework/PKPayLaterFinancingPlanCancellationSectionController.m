@interface PKPayLaterFinancingPlanCancellationSectionController
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterFinancingPlanCancellationSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 dynamicContentPage:(id)a5 viewControllerDelegate:(id)a6;
- (id)_firstSectionIdentifier;
- (id)_identifierForRowItem:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureDynamicSection:(id)a3 sectionIndex:(int64_t)a4 snapshot:(id)a5;
- (void)setFinancingPlan:(id)a3;
@end

@implementation PKPayLaterFinancingPlanCancellationSectionController

- (PKPayLaterFinancingPlanCancellationSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 dynamicContentPage:(id)a5 viewControllerDelegate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterFinancingPlanCancellationSectionController;
  v13 = [(PKPayLaterSectionController *)&v20 initWithPayLaterAccount:a4 dynamicContentPage:a5 viewControllerDelegate:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    objc_storeStrong((id *)&v14->_financingPlan, a3);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    rowsByIdentifier = v14->_rowsByIdentifier;
    v14->_rowsByIdentifier = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pageItemByIdentifier = v14->_pageItemByIdentifier;
    v14->_pageItemByIdentifier = v17;
  }
  return v14;
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PKPayLaterSectionController *)self dynamicContentPage];
  v5 = [v4 sections];

  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [NSString stringWithFormat:@"%@%ld", @"kLoanCancellationSectionPrefix-", v6];
      [v3 addObject:v7];

      ++v6;
    }
    while (v6 < [v5 count]);
  }
  v8 = (void *)[v3 copy];

  return v8;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterFinancingPlanCancellationSectionController;
  v7 = [(PKPayLaterSectionController *)&v21 layoutWithLayoutEnvironment:a3 sectionIdentifier:v6];
  [v7 contentInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = [(PKPayLaterFinancingPlanCancellationSectionController *)self _firstSectionIdentifier];
  id v17 = v6;
  v18 = v17;
  if (v16 == v17)
  {

    goto LABEL_7;
  }
  if (!v17 || !v16)
  {

    goto LABEL_9;
  }
  int v19 = [v16 isEqualToString:v17];

  if (v19) {
LABEL_7:
  }
    double v9 = 16.0;
LABEL_9:
  objc_msgSend(v7, "setContentInsets:", v9, v11, v13, v15);

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if ([v5 hasPrefix:@"kLoanCancellationSectionPrefix-"])
  {
    v7 = [v5 stringByReplacingOccurrencesOfString:@"kLoanCancellationSectionPrefix-" withString:&stru_1EF1B5B50];
    unint64_t v8 = [v7 integerValue];

    double v9 = [(PKPayLaterSectionController *)self dynamicContentPage];
    double v10 = [v9 sections];

    if (v8 < [v10 count])
    {
      double v11 = [v10 objectAtIndexedSubscript:v8];
      [(PKPayLaterFinancingPlanCancellationSectionController *)self _configureDynamicSection:v11 sectionIndex:v8 snapshot:v6];
    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 sectionIndex:(int64_t)a4 snapshot:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a5;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v7 = [v28 rows];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v8)
  {
    uint64_t v32 = *(void *)v40;
    v31 = (void *)*MEMORY[0x1E4FB28C8];
    v30 = (void *)*MEMORY[0x1E4FB27D0];
    id obj = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        double v11 = objc_msgSend(v10, "contentTitle", v27);
        double v12 = [(PKPayLaterFinancingPlanCancellationSectionController *)self _identifierForRowItem:v10];
        double v13 = [PKPayLaterSubtitleRow alloc];
        double v14 = [v10 contentSubtitle];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __103__PKPayLaterFinancingPlanCancellationSectionController__configureDynamicSection_sectionIndex_snapshot___block_invoke;
        v34[3] = &unk_1E59CE888;
        objc_copyWeak(&v38, &location);
        id v15 = v11;
        id v35 = v15;
        id v16 = v12;
        id v36 = v16;
        v37 = v10;
        id v17 = [(PKPayLaterSubtitleRow *)v13 initWithTitle:v15 subtitle:v14 selectionHandler:v34];

        v18 = PKFontForDefaultDesign(v31, v30, 0, 0);
        [(PKPayLaterSubtitleRow *)v17 setTitleFont:v18];

        int v19 = [MEMORY[0x1E4FB1618] labelColor];
        [(PKPayLaterSubtitleRow *)v17 setTitleTextColor:v19];

        objc_super v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(PKPayLaterSubtitleRow *)v17 setSubtitleTextColor:v20];

        [(PKPayLaterSubtitleRow *)v17 setHideDisclosure:1];
        selectedIdentifier = self->_selectedIdentifier;
        v22 = (NSString *)v16;
        v23 = selectedIdentifier;
        v24 = v23;
        if (v22 == v23)
        {
          uint64_t v25 = 1;
        }
        else
        {
          uint64_t v25 = 0;
          if (v22 && v23) {
            uint64_t v25 = [(NSString *)v22 isEqualToString:v23];
          }
        }

        [(PKPayLaterSubtitleRow *)v17 setSelected:v25];
        [v33 safelyAddObject:v17];
        [(NSMutableDictionary *)self->_rowsByIdentifier safelySetObject:v17 forKey:v22];
        [(NSMutableDictionary *)self->_pageItemByIdentifier safelySetObject:v10 forKey:v22];

        objc_destroyWeak(&v38);
      }
      v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v8);
  }

  v26 = (void *)[v33 copy];
  [v27 appendItems:v26];

  objc_destroyWeak(&location);
}

void __103__PKPayLaterFinancingPlanCancellationSectionController__configureDynamicSection_sectionIndex_snapshot___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v18 = 138412546;
      uint64_t v19 = v4;
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Did tap loan cancellation reason %@ with identifier %@", (uint8_t *)&v18, 0x16u);
    }

    id v6 = WeakRetained[14];
    v7 = *(void **)(a1 + 40);
    id v8 = v6;
    id v9 = v7;
    double v10 = v8;
    double v11 = v8;
    if (v8 == v9) {
      goto LABEL_21;
    }
    double v12 = v9;
    if (v8) {
      BOOL v13 = v9 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {

      if (!v8)
      {
        double v11 = 0;
LABEL_14:
        [v11 setSelected:0];
        if (*(void *)(a1 + 40))
        {
          double v10 = objc_msgSend(WeakRetained[12], "objectForKeyedSubscript:");
        }
        else
        {
          double v10 = 0;
        }
        [v10 setSelected:1];
        objc_storeStrong(WeakRetained + 14, *(id *)(a1 + 40));
        id v15 = objc_loadWeakRetained(WeakRetained + 15);
        [v15 didSelectCancellationRow:*(void *)(a1 + 48)];

        if (v11)
        {
          [WeakRetained[12] safelySetObject:v11 forKey:v8];
          id v16 = [WeakRetained dynamicCollectionDelegate];
          [v16 reloadItem:v11 animated:1];
        }
        if (v10)
        {
          [WeakRetained[12] safelySetObject:v10 forKey:*(void *)(a1 + 40)];
          id v17 = [WeakRetained dynamicCollectionDelegate];
          [v17 reloadItem:v10 animated:1];
        }
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      char v14 = [v8 isEqualToString:v9];

      if (v14) {
        goto LABEL_22;
      }
    }
    double v11 = [WeakRetained[12] objectForKeyedSubscript:v8];
    goto LABEL_14;
  }
LABEL_23:
}

- (id)_firstSectionIdentifier
{
  return (id)[NSString stringWithFormat:@"%@%ld", @"kLoanCancellationSectionPrefix-", 0];
}

- (id)_identifierForRowItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 identifier];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 contentTitle];
  }
  v7 = v6;

  return v7;
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIdentifier, 0);
  objc_storeStrong((id *)&self->_pageItemByIdentifier, 0);

  objc_storeStrong((id *)&self->_rowsByIdentifier, 0);
}

@end