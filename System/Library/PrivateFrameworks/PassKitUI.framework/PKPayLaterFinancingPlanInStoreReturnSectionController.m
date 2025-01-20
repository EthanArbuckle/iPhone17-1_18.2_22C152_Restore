@interface PKPayLaterFinancingPlanInStoreReturnSectionController
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterFinancingPlanInStoreReturnSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 delegate:(id)a5;
- (id)_iconTitleDetailRowForSectionIdentifier:(id)a3 title:(id)a4 detail:(id)a5;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureLearnMoreSection:(id)a3;
- (void)_configurePANSection:(id)a3;
- (void)_configureStoreCreditSection:(id)a3;
- (void)_configureTappingPaymentMethodSection:(id)a3;
- (void)setFinancingPlan:(id)a3;
@end

@implementation PKPayLaterFinancingPlanInStoreReturnSectionController

- (PKPayLaterFinancingPlanInStoreReturnSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 delegate:(id)a5
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPayLaterFinancingPlanInStoreReturnSectionController;
  v10 = [(PKPayLaterSectionController *)&v30 initWithPayLaterAccount:a4 dynamicContentPage:0 viewControllerDelegate:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_financingPlan, a3);
    v31[0] = @"kTappingPaymentMethodSection";
    v31[1] = @"kPANSection";
    v32[0] = @"wave.3.right.circle.fill";
    v32[1] = @"creditcard.and.123";
    v31[2] = @"kStoreCreditSection";
    v32[2] = @"giftcard";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
    v13 = (void *)MEMORY[0x1E4FB1830];
    v14 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2980], (void *)*MEMORY[0x1E4FB27D0], 2, 0);
    v15 = [v13 configurationWithFont:v14];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __104__PKPayLaterFinancingPlanInStoreReturnSectionController_initWithFinancingPlan_payLaterAccount_delegate___block_invoke;
    v26 = &unk_1E59CA9B0;
    id v27 = v15;
    id v28 = v16;
    v17 = v11;
    v29 = v17;
    id v18 = v16;
    id v19 = v15;
    [v12 enumerateKeysAndObjectsUsingBlock:&v23];
    uint64_t v20 = objc_msgSend(v18, "copy", v23, v24, v25, v26);
    sectionIcons = v17->_sectionIcons;
    v17->_sectionIcons = (NSDictionary *)v20;
  }
  return v11;
}

void __104__PKPayLaterFinancingPlanInStoreReturnSectionController_initWithFinancingPlan_payLaterAccount_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (void *)MEMORY[0x1E4FB1818];
  id v6 = a2;
  v7 = [v5 systemImageNamed:a3];
  v8 = [v7 imageWithConfiguration:*(void *)(a1 + 32)];

  id v9 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  id v11 = [v8 imageWithTintColor:v9 renderingMode:1];

  [*(id *)(a1 + 40) safelySetObject:v11 forKey:v6];
  [v11 size];
  *(double *)(*(void *)(a1 + 48) + 104) = fmax(v10, *(double *)(*(void *)(a1 + 48) + 104));
}

- (id)identifiers
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"kLearnMoreSection";
  v4[1] = @"kTappingPaymentMethodSection";
  v4[2] = @"kPANSection";
  v4[3] = @"kStoreCreditSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterFinancingPlanInStoreReturnSectionController;
  v7 = [(PKPayLaterSectionController *)&v24 layoutWithLayoutEnvironment:a3 sectionIdentifier:v6];
  [v7 contentInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = (__CFString *)v6;
  v17 = v16;
  double v18 = 16.0;
  if (v16 != @"kLearnMoreSection")
  {
    if (v16)
    {
      char v19 = [@"kLearnMoreSection" isEqualToString:v16];

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = v17;
        if (v20 == @"kTappingPaymentMethodSection"
          || (v21 = v20,
              int v22 = [@"kTappingPaymentMethodSection" isEqualToString:v20],
              v21,
              double v18 = v9,
              v22))
        {
          double v18 = 32.0;
        }
      }
    }
    else
    {
      double v18 = v9;
    }
  }
  objc_msgSend(v7, "setContentInsets:", v18, v11, v13, v15);

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = (__CFString *)v5;
  double v8 = v7;
  if (v7 == @"kLearnMoreSection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [@"kLearnMoreSection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterFinancingPlanInStoreReturnSectionController *)self _configureLearnMoreSection:v6];
  }
  else
  {
    double v11 = v8;
    if (v11 == @"kTappingPaymentMethodSection"
      || (double v12 = v11,
          int v13 = [@"kTappingPaymentMethodSection" isEqualToString:v11],
          v12,
          v13))
    {
      [(PKPayLaterFinancingPlanInStoreReturnSectionController *)self _configureTappingPaymentMethodSection:v6];
    }
    else
    {
      double v14 = v12;
      if (v14 == @"kPANSection"
        || (v15 = v14, int v16 = [@"kPANSection" isEqualToString:v14], v15, v16))
      {
        [(PKPayLaterFinancingPlanInStoreReturnSectionController *)self _configurePANSection:v6];
      }
      else
      {
        v17 = v15;
        if (v17 == @"kStoreCreditSection"
          || (double v18 = v17,
              int v19 = [@"kStoreCreditSection" isEqualToString:v17],
              v18,
              v19))
        {
          [(PKPayLaterFinancingPlanInStoreReturnSectionController *)self _configureStoreCreditSection:v6];
        }
      }
    }
  }
LABEL_5:

  return v6;
}

- (void)_configureLearnMoreSection:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v13 = objc_alloc_init(v3);
  id v5 = [PKPayLaterTitleDetailRow alloc];
  id v6 = PKLocalizedCocoonString(&cfstr_InStoreReturnC.isa);
  v7 = [(PKPayLaterTitleDetailRow *)v5 initWithTitle:v6 detail:0 selectionHandler:0];

  double v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(PKPayLaterTitleDetailRow *)v7 setTitleColor:v8];

  [v13 safelyAddObject:v7];
  int v9 = [PKPayLaterButtonRow alloc];
  double v10 = PKLocalizedCocoonString(&cfstr_InStoreReturnC_0.isa);
  double v11 = [(PKPayLaterButtonRow *)v9 initWithTitle:v10 selectionHandler:&__block_literal_global];

  [v13 safelyAddObject:v11];
  double v12 = (void *)[v13 copy];
  [v4 appendItems:v12];
}

void __84__PKPayLaterFinancingPlanInStoreReturnSectionController__configureLearnMoreSection___block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht212964?cid=mc-ols-applepay-article_ht212964-wallet_ui-12072021"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)_configureTappingPaymentMethodSection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v10 = objc_alloc_init(v4);
  id v6 = PKLocalizedCocoonString(&cfstr_InStoreReturnT.isa);
  v7 = PKLocalizedCocoonString(&cfstr_InStoreReturnT_0.isa);
  double v8 = [(PKPayLaterFinancingPlanInStoreReturnSectionController *)self _iconTitleDetailRowForSectionIdentifier:@"kTappingPaymentMethodSection" title:v6 detail:v7];
  [v10 safelyAddObject:v8];

  int v9 = (void *)[v10 copy];
  [v5 appendItems:v9];
}

- (void)_configurePANSection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v17 = objc_alloc_init(v4);
  id v6 = PKLocalizedCocoonString(&cfstr_InStoreReturnP.isa);
  v7 = PKLocalizedCocoonString(&cfstr_InStoreReturnP_0.isa);
  double v8 = [(PKPayLaterFinancingPlanInStoreReturnSectionController *)self _iconTitleDetailRowForSectionIdentifier:@"kPANSection" title:v6 detail:v7];
  [v17 safelyAddObject:v8];

  int v9 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  id v10 = [v9 panSuffix];

  if (v10)
  {
    double v11 = PKMaskedPaymentPAN();
  }
  else
  {
    double v11 = 0;
  }
  double v12 = [PKPayLaterTitleDetailRow alloc];
  id v13 = PKLocalizedCocoonString(&cfstr_InStoreReturnC_1.isa);
  double v14 = [(PKPayLaterTitleDetailRow *)v12 initWithTitle:v13 detail:v11 selectionHandler:0];

  double v15 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKPayLaterTitleDetailRow *)v14 setDetailColor:v15];

  [v17 safelyAddObject:v14];
  int v16 = (void *)[v17 copy];
  [v5 appendItems:v16];
}

- (void)_configureStoreCreditSection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v10 = objc_alloc_init(v4);
  id v6 = PKLocalizedCocoonString(&cfstr_InStoreReturnR.isa);
  v7 = PKLocalizedCocoonString(&cfstr_InStoreReturnR_0.isa);
  double v8 = [(PKPayLaterFinancingPlanInStoreReturnSectionController *)self _iconTitleDetailRowForSectionIdentifier:@"kStoreCreditSection" title:v6 detail:v7];
  [v10 safelyAddObject:v8];

  int v9 = (void *)[v10 copy];
  [v5 appendItems:v9];
}

- (id)_iconTitleDetailRowForSectionIdentifier:(id)a3 title:(id)a4 detail:(id)a5
{
  sectionIcons = self->_sectionIcons;
  id v9 = a5;
  id v10 = a4;
  double v11 = [(NSDictionary *)sectionIcons objectForKey:a3];
  double v12 = [[PKPayLaterTileDetailIconRow alloc] initWithTitle:v10 detail:v9 iconImage:v11];

  id v13 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 2, 0);
  [(PKPayLaterTileDetailIconRow *)v12 setTitleFont:v13];

  double maxIconWidth = self->_maxIconWidth;
  [v11 size];
  [(PKPayLaterTileDetailIconRow *)v12 setAdditionalIconPadding:fmax(maxIconWidth - v15, 0.0)];

  return v12;
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
  objc_storeStrong((id *)&self->_sectionIcons, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end