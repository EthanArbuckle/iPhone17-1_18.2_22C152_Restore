@interface PKPayLaterReviewPlanSectionController
- (PKPayLaterReviewPlanSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4 financingOption:(id)a5 delegate:(id)a6;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
- (void)didTapHyperLink:(id)a3;
@end

@implementation PKPayLaterReviewPlanSectionController

- (PKPayLaterReviewPlanSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4 financingOption:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  v15 = [v11 financingController];
  v16 = [v15 payLaterAccount];

  v19.receiver = self;
  v19.super_class = (Class)PKPayLaterReviewPlanSectionController;
  v17 = [(PKPayLaterSectionController *)&v19 initWithPayLaterAccount:v16 dynamicContentPage:v14 viewControllerDelegate:0];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_setupController, a3);
    objc_storeStrong((id *)&v17->_financingOption, a5);
    objc_storeWeak((id *)&v17->_delegate, v13);
  }

  return v17;
}

- (void)didTapHyperLink:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained didTapHyperLink:v4];
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterReviewPlanSectionController;
  id v5 = a3;
  [(PKPayLaterSectionController *)&v6 configureCellForRegistration:v5 item:a4];
  PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v5);
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PKPayLaterSectionController *)self dynamicContentPage];
  id v5 = [v4 sections];

  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [NSString stringWithFormat:@"%@%ld", @"section-", v6];
      [v3 addObject:v7];

      ++v6;
    }
    while (v6 < [v5 count]);
  }
  v8 = (void *)[v3 copy];

  return v8;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if ([v5 hasPrefix:@"section-"])
  {
    v7 = [v5 stringByReplacingOccurrencesOfString:@"section-" withString:&stru_1EF1B5B50];
    unint64_t v8 = [v7 integerValue];

    v9 = [(PKPayLaterSectionController *)self dynamicContentPage];
    v10 = [v9 sections];

    if (v8 < [v10 count])
    {
      id v11 = [v10 objectAtIndexedSubscript:v8];
      [(PKPayLaterReviewPlanSectionController *)self _configureDynamicSection:v11 snapshot:v6];
    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v23 = v5;
  id obj = [v5 rows];
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v25 = *(void *)v28;
    unint64_t v8 = (void *)*MEMORY[0x1E4FB28C8];
    v9 = (void *)*MEMORY[0x1E4FB2790];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = [v11 contentTitle];
        id v13 = [v11 contentSubtitle];
        id v14 = [v11 contentDetailTrailing];
        v15 = [[PKPayLaterTitleDetailValueRow alloc] initWithTitle:v12 detail:v13 value:v14 accessory:0 selectionHandler:0];
        v16 = [MEMORY[0x1E4FB1618] labelColor];
        [(PKPayLaterTitleDetailValueRow *)v15 setTitleColor:v16];

        v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(PKPayLaterTitleDetailValueRow *)v15 setDetailColor:v17];

        v18 = [MEMORY[0x1E4FB1618] labelColor];
        [(PKPayLaterTitleDetailValueRow *)v15 setValueColor:v18];

        if (v13)
        {
          objc_super v19 = PKFontForDefaultDesign(v8, v9, 2, 0);
          [(PKPayLaterTitleDetailValueRow *)v15 setTitleFont:v19];
        }
        v20 = PKFontForDefaultDesign(v8, v9, 2, 0);
        [(PKPayLaterTitleDetailValueRow *)v15 setValueFont:v20];

        [v26 safelyAddObject:v15];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  v21 = (void *)[v26 copy];
  [v22 appendItems:v21];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_financingOption, 0);
}

@end