@interface PKPayLaterPaymentScheduleSectionController
- (PKPayLaterPaymentScheduleSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4 selectedFinancingOption:(id)a5 delegate:(id)a6;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)identifiers;
- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configurePaymentsSectionSnapshot:(id)a3;
- (void)_configureTotalAmountSection:(id)a3;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
- (void)didTapHyperLink:(id)a3;
@end

@implementation PKPayLaterPaymentScheduleSectionController

- (PKPayLaterPaymentScheduleSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4 selectedFinancingOption:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  v15 = [v11 financingController];
  v16 = [v15 payLaterAccount];

  v23.receiver = self;
  v23.super_class = (Class)PKPayLaterPaymentScheduleSectionController;
  v17 = [(PKPayLaterSectionController *)&v23 initWithPayLaterAccount:v16 dynamicContentPage:v14 viewControllerDelegate:0];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_setupController, a3);
    objc_storeStrong((id *)&v17->_selectedFinancingOption, a5);
    objc_storeWeak((id *)&v17->_delegate, v13);
    v18 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v17->_dateFormatter;
    v17->_dateFormatter = v18;

    v20 = v17->_dateFormatter;
    v21 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v20 setCalendar:v21];

    [(NSDateFormatter *)v17->_dateFormatter setDateStyle:3];
    [(NSDateFormatter *)v17->_dateFormatter setTimeStyle:0];
  }

  return v17;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterPaymentScheduleSectionController;
  v7 = [(PKPayLaterSectionController *)&v14 listLayoutConfigurationWithLayoutEnvironment:a3 sectionIdentifier:v6];
  v8 = (__CFString *)v6;
  v9 = v8;
  if (v8 == @"kPaymentsSection"
    || v8
    && (int v10 = [(__CFString *)v8 isEqualToString:@"kPaymentsSection"], v9, v10))
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1958]) initWithListAppearance:2];
    +[PKConnectedCollectionViewCell textInsetWithOuterRadius:12.0];
    objc_msgSend(v11, "setBottomSeparatorInsets:", 0.0, v12, 0.0, 0.0);
    [v7 setSeparatorConfiguration:v11];
  }

  return v7;
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
  v6.super_class = (Class)PKPayLaterPaymentScheduleSectionController;
  id v5 = a3;
  [(PKPayLaterSectionController *)&v6 configureCellForRegistration:v5 item:a4];
  PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v5);
}

- (id)identifiers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [(PKPayLaterSectionController *)self dynamicContentPage];
  v3 = [v2 sections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v7[0] = @"kPaymentsSection";
    v7[1] = @"kTotalAmountSection";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"kPaymentsSection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [(__CFString *)v7 isEqualToString:@"kPaymentsSection"];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterPaymentScheduleSectionController *)self _configurePaymentsSectionSnapshot:v6];
  }
  else
  {
    id v11 = v8;
    if (v11 == @"kTotalAmountSection"
      || (double v12 = v11,
          int v13 = [(__CFString *)v11 isEqualToString:@"kTotalAmountSection"],
          v12,
          v13))
    {
      [(PKPayLaterPaymentScheduleSectionController *)self _configureTotalAmountSection:v6];
    }
  }
LABEL_5:

  return v6;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 != @"kPaymentsSection")
  {
    if (!v4) {
      goto LABEL_6;
    }
    int v6 = [(__CFString *)v4 isEqualToString:@"kPaymentsSection"];

    if (!v6) {
      goto LABEL_6;
    }
  }
  v7 = [(PKPayLaterSectionController *)self dynamicContentPage];
  v8 = [v7 productSectionForType:4];

  int v9 = [v8 contentTitle];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v11 = [v9 uppercaseString];
    v17[0] = *MEMORY[0x1E4FB06F8];
    double v12 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
    v18[0] = v12;
    v17[1] = *MEMORY[0x1E4FB0700];
    int v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v18[1] = v13;
    objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v15 = (void *)[v10 initWithString:v11 attributes:v14];
  }
  else
  {
LABEL_6:
    v15 = 0;
  }

  return v15;
}

- (void)_configurePaymentsSectionSnapshot:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  id v6 = a3;
  v7 = [v4 preferredFontForTextStyle:v5];
  [v7 pointSize];
  objc_msgSend(v4, "systemFontOfSize:weight:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [(PKPayLaterFinancingOption *)self->_selectedFinancingOption installments];
  uint64_t v9 = [v8 count];
  id v10 = [(PKPayLaterSectionController *)self dynamicContentPage];
  id v11 = +[PKPayLaterProgressRow progressRowsWithInstallmentCount:v9 firstRowFont:v13 dynamicContentPage:v10];

  double v12 = (void *)[v11 copy];
  [v6 appendItems:v12];
}

- (void)_configureTotalAmountSection:(id)a3
{
  id v26 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [(PKPayLaterSectionController *)self dynamicContentPage];
  id v6 = [v5 sections];

  if ((unint64_t)[v6 count] >= 2)
  {
    v25 = v4;
    v7 = [v6 objectAtIndexedSubscript:1];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = [v7 rows];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        double v12 = [v7 rows];
        id v13 = [v12 objectAtIndexedSubscript:v11];

        objc_super v14 = [PKMultiKeyValueCellKeyValueSource alloc];
        v15 = [v13 contentTitle];
        v16 = [v13 contentDetailTrailing];
        v17 = [(PKMultiKeyValueCellKeyValueSource *)v14 initWithTitle:v15 subtitle:v16];

        v18 = [MEMORY[0x1E4FB1618] labelColor];
        [(PKMultiKeyValueCellKeyValueSource *)v17 setSubtitleTextColor:v18];

        -[PKMultiKeyValueCellKeyValueSource setBold:](v17, "setBold:", ++v11 == [v6 count]);
        [v8 addObject:v17];

        v19 = [v7 rows];
        unint64_t v20 = [v19 count];
      }
      while (v11 < v20);
    }
    v21 = [PKMultiKeyValueRow alloc];
    v22 = (void *)[v8 copy];
    id v23 = [(PKMultiKeyValueRow *)v21 initKeyValueSources:v22];

    id v4 = v25;
    [v25 addObject:v23];
    v24 = (void *)[v25 copy];
    [v26 appendItems:v24];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);

  objc_storeStrong((id *)&self->_setupController, 0);
}

@end