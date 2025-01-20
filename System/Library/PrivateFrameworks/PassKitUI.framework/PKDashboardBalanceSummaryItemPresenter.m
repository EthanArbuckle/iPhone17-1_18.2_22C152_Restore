@interface PKDashboardBalanceSummaryItemPresenter
- (BOOL)_statementIsFromMonthPriorToSummaryForItem:(id)a3;
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardBalanceSummaryItemPresenter)init;
- (id)_readableFileTypeForFormat:(id)a3 feature:(unint64_t)a4;
- (id)_statementCellTitleForItem:(id)a3;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)provideDataForItem:(id)a3;
- (id)statementIcon;
- (int64_t)cellStyle;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 forSizing:(BOOL)a7;
- (void)_configureCellForReuse:(id)a3;
- (void)_configureDailyCashCell:(id)a3 forItem:(id)a4;
- (void)_configureExportStatementDataCell:(id)a3 forItem:(id)a4;
- (void)_configureInstallmentBalanceCell:(id)a3 forItem:(id)a4;
- (void)_configureInterestCell:(id)a3 forItem:(id)a4;
- (void)_configureMergeBalanceCell:(id)a3 forItem:(id)a4;
- (void)_configureMergeNoticeCell:(id)a3 forItem:(id)a4;
- (void)_configureMonthlySpendLimitCell:(id)a3 forItem:(id)a4;
- (void)_configurePaymentsAndCreditsCell:(id)a3 forItem:(id)a4;
- (void)_configurePriorStatementBalanceCell:(id)a3 forItem:(id)a4;
- (void)_configureRewardsSummaryCell:(id)a3 forItem:(id)a4;
- (void)_configureSpendingCell:(id)a3 forItem:(id)a4;
- (void)_configureStatementBalanceCell:(id)a3 forItem:(id)a4;
- (void)_configureStatementCell:(id)a3 forItem:(id)a4;
- (void)_configureStatementDownloadCell:(id)a3 forItem:(id)a4;
- (void)_configureTotalBalanceCell:(id)a3 forItem:(id)a4;
- (void)_configureTransactionLimitCell:(id)a3 forItem:(id)a4;
- (void)_downloadAndPresentStatementForItem:(id)a3 inCollectionView:(id)a4;
- (void)_downloadExportedStatementDataForItem:(id)a3 withFileFormat:(id)a4 inCollectionView:(id)a5;
- (void)_selectFileFormatForExportedStatementDataForItem:(id)a3 inCollectionView:(id)a4;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)setCellStyle:(int64_t)a3;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKDashboardBalanceSummaryItemPresenter

- (PKDashboardBalanceSummaryItemPresenter)init
{
  v25.receiver = self;
  v25.super_class = (Class)PKDashboardBalanceSummaryItemPresenter;
  v2 = [(PKDashboardBalanceSummaryItemPresenter *)&v25 init];
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterMonthYear = v2->_formatterMonthYear;
    v2->_formatterMonthYear = v3;

    [(NSDateFormatter *)v2->_formatterMonthYear setLocalizedDateFormatFromTemplate:@"MMMM yyyy"];
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterMonthAndDay = v2->_formatterMonthAndDay;
    v2->_formatterMonthAndDay = v5;

    [(NSDateFormatter *)v2->_formatterMonthAndDay setLocalizedDateFormatFromTemplate:@"MMM d"];
    v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterMonthDayYear = v2->_formatterMonthDayYear;
    v2->_formatterMonthDayYear = v7;

    [(NSDateFormatter *)v2->_formatterMonthDayYear setLocalizedDateFormatFromTemplate:@"MMM d yyyy"];
    v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterMonth = v2->_formatterMonth;
    v2->_formatterMonth = v9;

    [(NSDateFormatter *)v2->_formatterMonth setLocalizedDateFormatFromTemplate:@"MMMM"];
    v11 = [PKPaymentTransactionCollectionViewCell alloc];
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v16 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    sampleTransactionCell = v2->_sampleTransactionCell;
    v2->_sampleTransactionCell = (PKPaymentTransactionCollectionViewCell *)v16;

    v18 = -[PKDashboardButtonCollectionViewCell initWithFrame:]([PKDashboardButtonCollectionViewCell alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleButtonCell = v2->_sampleButtonCell;
    v2->_sampleButtonCell = v18;

    v20 = -[PKDashboardCurrencyAmountCell initWithFrame:]([PKDashboardCurrencyAmountCell alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleCurrencyCell = v2->_sampleCurrencyCell;
    v2->_sampleCurrencyCell = v20;

    v22 = -[PKDashboardTitleMessageCell initWithFrame:]([PKDashboardTitleMessageCell alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleTitleMessageCell = v2->_sampleTitleMessageCell;
    v2->_sampleTitleMessageCell = v22;
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PKDashboardBalanceSummaryItemPresenterIdentifier";
  v5[0] = objc_opt_class();
  v4[1] = @"PKDashboardStatementSummaryItemPresenterIdentifier";
  v5[1] = objc_opt_class();
  v4[2] = @"PKDashboardStatementDownloadSummaryItemPresenterIdentifier";
  v5[2] = objc_opt_class();
  v4[3] = @"PKDashboardExportStatementDataSummaryItemPresenterIdentifier";
  v5[3] = objc_opt_class();
  v4[4] = @"PKDashboardTitleMessageSummaryItemPresenterIdentifier";
  v5[4] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [v10 type];
  if (v11 > 0x14) {
    double v12 = 0;
  }
  else {
    double v12 = off_1E59CD128[v11];
  }
  double v13 = [v9 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v8];
  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCell:v13 forItem:v10 inCollectionView:v9 forIndexPath:v8 forSizing:0];

  return v13;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v41 = a3;
  id v10 = a4;
  id v11 = a6;
  double v12 = [v41 transactionGroup];

  if (v12)
  {
    id v13 = v41;
    double v14 = [PKTransactionHistoryViewController alloc];
    double v15 = [v13 transactionGroup];
    uint64_t v16 = [v13 transactionSourceCollection];
    v17 = [v13 familyCollection];
    v18 = [v13 account];
    v19 = [v13 accountUserCollection];
    v20 = [v13 physicalCards];

    v21 = [(PKTransactionHistoryViewController *)v14 initWithTransactionGroup:v15 transactionSourceCollection:v16 familyCollection:v17 account:v18 accountUserCollection:v19 physicalCards:v20 fetcher:0 transactionHistory:0 detailViewStyle:0];
    [v11 pushViewController:v21 animated:1];
  }
  else if ([v41 type] == 2 || !objc_msgSend(v41, "type"))
  {
    id v40 = v10;
    id v22 = v41;
    v38 = [PKCreditBalanceDetailsViewController alloc];
    int64_t cellStyle = self->_cellStyle;
    uint64_t v23 = [v22 transactionSourceCollection];
    [v22 familyCollection];
    v24 = v37 = v11;
    objc_super v25 = [v22 webService];
    v26 = [v22 account];
    v27 = [v22 accountUserCollection];
    v28 = [v22 physicalCards];
    v29 = [v22 statement];
    v30 = [v22 statements];
    v31 = v38;
    v39 = self;
    v32 = (void *)v23;
    v33 = [(PKCreditBalanceDetailsViewController *)v31 initWithStyle:cellStyle transactionSourceCollection:v23 familyCollection:v24 webService:v25 account:v26 accountUserCollection:v27 physicalCards:v28 statement:v29 previousStatements:v30];

    id v11 = v37;
    [v37 pushViewController:v33 animated:1];
    if (v39->_cellStyle == 1)
    {
      v34 = [(PKCreditBalanceDetailsViewController *)v33 navigationItem];
      v35 = [(PKDashboardBalanceSummaryItemPresenter *)v39 _statementCellTitleForItem:v22];
      [v34 setTitle:v35];
    }
    id v10 = v40;
  }
  else if ([v41 type] == 6)
  {
    [(PKDashboardBalanceSummaryItemPresenter *)self _downloadAndPresentStatementForItem:v41 inCollectionView:v10];
  }
  else if ([v41 type] == 7)
  {
    [(PKDashboardBalanceSummaryItemPresenter *)self _selectFileFormatForExportedStatementDataForItem:v41 inCollectionView:v10];
  }
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v9 bounds];
  double v12 = v11;
  unint64_t v13 = [v10 type];
  if (v13 > 0x14) {
    id v14 = 0;
  }
  else {
    id v14 = *(id *)((char *)&self->super.isa + qword_1A0443040[v13]);
  }
  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCell:v14 forItem:v10 inCollectionView:v9 forIndexPath:v8 forSizing:1];

  [(id)objc_opt_class() defaultHorizontalInset];
  double v16 = v15;
  [(id)objc_opt_class() defaultHorizontalInset];
  objc_msgSend(v9, "pkui_readableContentBoundsWithMargins:", 0.0, v16, 0.0, v17);
  double v19 = v18;

  [v14 setHorizontalInset:v19];
  objc_msgSend(v14, "sizeThatFits:", v12, 3.40282347e38);
  double v21 = v20;
  double v23 = v22;

  double v24 = v21;
  double v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v6 = a3;
  if ([v6 type] == 6)
  {
    uint64_t v7 = 32;
  }
  else
  {
    if ([v6 type] != 7)
    {
      char v8 = 1;
      goto LABEL_7;
    }
    uint64_t v7 = 40;
  }
  char v8 = [*(id *)((char *)&self->super.isa + v7) enabled];
LABEL_7:

  return v8;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 forSizing:(BOOL)a7
{
  id v21 = a3;
  id v11 = a4;
  id v12 = a5;
  switch([v11 type])
  {
    case 0:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureStatementBalanceCell:v21 forItem:v11];
      break;
    case 1:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configurePriorStatementBalanceCell:v21 forItem:v11];
      break;
    case 2:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureStatementCell:v21 forItem:v11];
      break;
    case 3:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureSpendingCell:v21 forItem:v11];
      break;
    case 4:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureInterestCell:v21 forItem:v11];
      break;
    case 5:
    case 8:
    case 9:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configurePaymentsAndCreditsCell:v21 forItem:v11];
      break;
    case 6:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureStatementDownloadCell:v21 forItem:v11];
      p_downloadPDFCell = &self->_downloadPDFCell;
      goto LABEL_12;
    case 7:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureExportStatementDataCell:v21 forItem:v11];
      p_downloadPDFCell = &self->_exportStatementDataCell;
LABEL_12:
      objc_storeStrong((id *)p_downloadPDFCell, a3);
      break;
    case 10:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureDailyCashCell:v21 forItem:v11];
      break;
    case 11:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureInstallmentBalanceCell:v21 forItem:v11];
      break;
    case 12:
    case 13:
    case 14:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureTotalBalanceCell:v21 forItem:v11];
      break;
    case 15:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureTransactionLimitCell:v21 forItem:v11];
      break;
    case 16:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureMonthlySpendLimitCell:v21 forItem:v11];
      break;
    case 17:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureMergeNoticeCell:v21 forItem:v11];
      break;
    case 18:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureMergeBalanceCell:v21 forItem:v11];
      break;
    case 19:
    case 20:
      [(PKDashboardBalanceSummaryItemPresenter *)self _configureRewardsSummaryCell:v21 forItem:v11];
      break;
    default:
      break;
  }
  [(id)objc_opt_class() defaultHorizontalInset];
  double v15 = v14;
  [(id)objc_opt_class() defaultHorizontalInset];
  objc_msgSend(v12, "pkui_readableContentBoundsWithMargins:", 0.0, v15, 0.0, v16);
  double v18 = v17;

  [v21 setHorizontalInset:v18];
  unint64_t v19 = [v11 type];
  if (v19 > 0x14) {
    double v20 = (void *)MEMORY[0x1E4F85B28];
  }
  else {
    double v20 = (void *)qword_1E59CD1D0[v19];
  }
  [v21 setAccessibilityIdentifier:*v20];
}

- (void)_configureStatementCell:(id)a3 forItem:(id)a4
{
  id v34 = a4;
  id v6 = a3;
  uint64_t v7 = [v34 statement];
  char v8 = [v6 transactionView];

  id v9 = [v7 totalBalance];
  if (v9
    || ([v7 statementBalance], (id v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = [v7 currencyCode];

    if (v10)
    {
      id v11 = [v7 currencyCode];
      id v10 = PKCurrencyAmountCreate(v9, v11);
    }
  }
  else
  {
    id v10 = 0;
  }
  id v12 = [(PKDashboardBalanceSummaryItemPresenter *)self _statementCellTitleForItem:v34];
  [v8 setPrimaryString:v12];
  formatterMonthAndDay = self->_formatterMonthAndDay;
  double v14 = [v7 openingDate];
  double v15 = [(NSDateFormatter *)formatterMonthAndDay stringFromDate:v14];

  formatterMonthDayYear = self->_formatterMonthDayYear;
  double v17 = [v7 closingDate];
  double v18 = [(NSDateFormatter *)formatterMonthDayYear stringFromDate:v17];

  unint64_t v19 = PKLocalizedFeatureString();
  double v20 = objc_msgSend(v19, "pk_uppercaseFirstStringForPreferredLocale", v15, v18);

  [v8 setSecondaryString:v20];
  if (v10)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
    [v10 formattedStringValue];
    v33 = v8;
    double v22 = v20;
    double v23 = v7;
    double v24 = v18;
    double v25 = self;
    v26 = v15;
    v27 = v9;
    v28 = v10;
    v30 = v29 = v12;
    v31 = (void *)[v21 initWithString:v30 attributes:0];

    id v12 = v29;
    id v10 = v28;
    id v9 = v27;
    double v15 = v26;
    self = v25;
    double v18 = v24;
    uint64_t v7 = v23;
    double v20 = v22;
    char v8 = v33;
    [v33 setTransactionValueAttributedText:v31];
  }
  else
  {
    [v8 setTransactionValueAttributedText:0];
  }
  [v8 setTertiaryString:0];
  v32 = [(PKDashboardBalanceSummaryItemPresenter *)self statementIcon];
  [v8 setPrimaryImage:v32];

  [v8 setShowsDisclosureView:1];
}

- (void)_configurePriorStatementBalanceCell:(id)a3 forItem:(id)a4
{
  id v36 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 statement];
  char v8 = [v6 summary];
  id v9 = [v6 mergeSummaryAccountDetails];
  if (v9)
  {
    id v10 = [v6 account];
    id v11 = [v10 creditDetails];
    id v12 = [v11 currencyCode];

    unint64_t v13 = [v9 statementBalance];

    double v14 = 0;
    if (v13 && v12)
    {
      double v15 = [v9 statementBalance];
      double v14 = PKCurrencyAmountMake();
    }
    [v36 setDetailString:0];
    [v36 setAmount:v14];
  }
  else
  {
    if (v8
      && ![(PKDashboardBalanceSummaryItemPresenter *)self _statementIsFromMonthPriorToSummaryForItem:v6])
    {
      unint64_t v19 = PKLocalizedFeatureString();
      [v36 setDetailString:v19];

LABEL_15:
      double v20 = [v8 balanceSummary];
      id v21 = [v20 openingDate];
      double v22 = [v20 closingDate];

      goto LABEL_18;
    }
    double v14 = [v7 statementBalance];
    if (v14)
    {
      double v16 = [v7 currencyCode];

      if (v16)
      {
        double v17 = [v7 statementBalance];
        double v18 = [v7 currencyCode];
        double v14 = PKCurrencyAmountCreate(v17, v18);
      }
      else
      {
        double v14 = 0;
      }
    }
    [v36 setDetailString:0];
    [v36 setAmount:v14];
  }

  if (v8) {
    goto LABEL_15;
  }
  if (!v7) {
    goto LABEL_19;
  }
  id v21 = [v7 openingDate];
  double v22 = [v7 closingDate];
LABEL_18:

LABEL_19:
  if (v9)
  {
    double v23 = [v9 ownerAltDSID];
    double v24 = [v6 accountUserCollection];
    double v25 = [v24 accountUserWithAltDSID:v23];

    if ([v25 isCurrentUser])
    {
      v26 = PKLocalizedFeatureString();
    }
    else
    {
      v27 = [v6 familyCollection];
      v28 = [v27 familyMemberForAltDSID:v23];

      v29 = (void *)MEMORY[0x1E4F845E8];
      v30 = [v25 nameComponents];
      [v29 contactForFamilyMember:v28 nameComponents:v30 imageData:0];
      v35 = v8;
      v31 = v7;
      v33 = v32 = self;

      id v34 = [v33 givenName];
      v26 = PKLocalizedFeatureString();

      self = v32;
      uint64_t v7 = v31;
      char v8 = v35;
    }
  }
  else
  {
    v26 = PKLocalizedFeatureString();
  }
  objc_msgSend(v36, "setTitleString:", v26, v34);
  [v36 setShowsPositivePrefix:0];
  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v36];
}

- (void)_configureStatementBalanceCell:(id)a3 forItem:(id)a4
{
  id v53 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 statement];
  char v8 = [v6 summary];
  id v9 = [v6 mergeSummaryAccountDetails];
  if (v9)
  {
    id v10 = [v6 account];
    id v11 = [v10 creditDetails];
    id v12 = [v11 currencyCode];

    unint64_t v13 = [v9 statementBalance];

    double v14 = 0;
    if (v13 && v12)
    {
      double v15 = [v9 statementBalance];
      double v14 = PKCurrencyAmountMake();
    }
    [v53 setDetailString:0];
    [v53 setAmount:v14];
  }
  else if (v8 {
         && ![(PKDashboardBalanceSummaryItemPresenter *)self _statementIsFromMonthPriorToSummaryForItem:v6])
  }
  {
    double v14 = PKLocalizedFeatureString();
    [v53 setDetailString:v14];
  }
  else
  {
    double v14 = [v7 statementBalance];
    if (v14)
    {
      double v16 = [v7 currencyCode];

      if (v16)
      {
        double v17 = [v7 statementBalance];
        double v18 = [v7 currencyCode];
        double v14 = PKCurrencyAmountCreate(v17, v18);
      }
      else
      {
        double v14 = 0;
      }
    }
    [v53 setDetailString:0];
    [v53 setAmount:v14];
  }

  unint64_t v19 = [v6 mergeDate];
  double v20 = [v6 account];
  id v21 = [v20 creditDetails];
  uint64_t v52 = [v21 productTimeZone];

  if (v8)
  {
    double v22 = [v8 balanceSummary];
    double v23 = [v22 openingDate];
    double v24 = [v22 closingDate];

LABEL_16:
    int v25 = 1;
    if (!v23) {
      goto LABEL_33;
    }
    goto LABEL_20;
  }
  if (!v7)
  {
    double v23 = 0;
    double v24 = 0;
    if (!v19) {
      goto LABEL_33;
    }
    v37 = (void *)v52;
    if (!v52)
    {
LABEL_34:
      id v36 = PKLocalizedFeatureString();
      goto LABEL_35;
    }
    double v23 = PKStartOfMonthWithTimeZone();
    double v24 = PKEndOfMonthWithTimeZone();
    goto LABEL_16;
  }
  double v23 = [v7 openingDate];
  double v24 = [v7 closingDate];
  int v25 = 0;
  if (!v23)
  {
LABEL_33:
    v37 = (void *)v52;
    goto LABEL_34;
  }
LABEL_20:
  if (!v24) {
    goto LABEL_33;
  }
  v49 = v19;
  v51 = self;
  [v24 timeIntervalSinceDate:v23];
  uint64_t v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v23 sinceDate:v26 * 0.5];
  id v28 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  id v29 = v28;
  if (v25) {
    [v28 setMonth:-1];
  }
  v30 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v47 = v29;
  v48 = (void *)v27;
  v46 = [v30 dateByAddingComponents:v29 toDate:v27 options:0];
  v31 = objc_msgSend(v30, "components:fromDate:", 8);
  [v31 month];

  v50 = v9;
  if (v9)
  {
    v45 = v8;
    v32 = [v9 ownerAltDSID];
    v33 = [v6 accountUserCollection];
    id v34 = [v33 accountUserWithAltDSID:v32];

    if ([v34 isCurrentUser])
    {
      v35 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
      id v36 = PKLocalizedFeatureString();
    }
    else
    {
      v38 = [v6 familyCollection];
      v35 = [v38 familyMemberForAltDSID:v32];

      v39 = (void *)MEMORY[0x1E4F845E8];
      [v34 nameComponents];
      id v40 = v44 = v7;
      v43 = [v39 contactForFamilyMember:v35 nameComponents:v40 imageData:0];

      id v41 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
      v42 = [v43 givenName];
      id v36 = PKLocalizedFeatureString();

      uint64_t v7 = v44;
    }
    v37 = (void *)v52;

    char v8 = v45;
  }
  else
  {
    v32 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
    id v36 = PKLocalizedFeatureString();
    v37 = (void *)v52;
  }

  id v9 = v50;
  self = v51;
  unint64_t v19 = v49;
LABEL_35:
  objc_msgSend(v53, "setTitleString:", v36, v42);
  [v53 setShowsPositivePrefix:0];
  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v53];
}

- (void)_configureSpendingCell:(id)a3 forItem:(id)a4
{
  id v22 = a4;
  id v6 = a3;
  uint64_t v7 = [v22 summary];
  char v8 = [v22 statement];
  id v9 = v8;
  if (v7)
  {
    id v10 = [v7 balanceSummary];
    id v11 = [v10 purchases];

    id v12 = [v7 balanceSummary];
    unint64_t v13 = [v12 pendingPurchases];

    double v14 = 0;
    if (v11 && v13)
    {
      [(NSDecimalNumber *)v11 decimalNumberByAdding:v13];
      id v21 = self;
      double v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      double v16 = [v22 account];
      double v17 = [v16 creditDetails];
      double v18 = [v17 currencyCode];
      double v14 = PKCurrencyAmountCreate(v15, v18);

      self = v21;
    }
    goto LABEL_7;
  }
  unint64_t v19 = [v8 purchases];

  if (v19)
  {
    id v11 = [v9 purchases];
    unint64_t v13 = [v9 currencyCode];
    double v14 = PKCurrencyAmountCreate(v11, v13);
LABEL_7:

    goto LABEL_8;
  }
  double v14 = 0;
LABEL_8:
  [v6 setAmount:v14];
  [v6 setDetailString:0];
  [v6 setShowsPositivePrefix:0];
  double v20 = PKLocalizedFeatureString();
  [v6 setTitleString:v20];

  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v6];
}

- (void)_configureInterestCell:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v22 = [v6 summary];
  char v8 = [v6 statement];
  id v9 = [v22 balanceSummary];
  id v10 = [v6 account];

  id v11 = [v10 creditDetails];
  id v12 = [v11 currencyCode];

  if (v22
    && ([v9 interestCharged], unint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, v13)
    && v12)
  {
    double v14 = [v9 interestCharged];
  }
  else
  {
    uint64_t v15 = [v8 interestCharged];
    if (v15)
    {
      double v16 = (void *)v15;
      double v17 = [v8 currencyCode];

      if (v17)
      {
        double v18 = [v8 interestCharged];
        unint64_t v19 = [v8 currencyCode];
        double v20 = PKCurrencyAmountCreate(v18, v19);

        goto LABEL_10;
      }
    }
    double v14 = [MEMORY[0x1E4F28C28] zero];
  }
  double v18 = v14;
  double v20 = PKCurrencyAmountCreate(v14, v12);
LABEL_10:

  [v7 setAmount:v20];
  [v7 setDetailString:0];
  [v7 setShowsPositivePrefix:0];
  id v21 = PKLocalizedFeatureString();
  [v7 setTitleString:v21];

  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v7];
}

- (void)_configurePaymentsAndCreditsCell:(id)a3 forItem:(id)a4
{
  id v19 = a4;
  id v6 = a3;
  id v7 = [v19 summary];
  char v8 = [v19 statement];
  id v9 = v8;
  if (v7)
  {
    id v10 = [v19 account];
    id v11 = [v10 creditDetails];
    id v12 = [v11 currencyCode];

    uint64_t v13 = [v19 type];
    switch(v13)
    {
      case 5:
        double v14 = [v7 balanceSummary];
        uint64_t v15 = [v14 paymentsAndCredits];
        goto LABEL_14;
      case 8:
        double v14 = [v7 balanceSummary];
        uint64_t v15 = [v14 credits];
        goto LABEL_14;
      case 9:
        double v14 = [v7 balanceSummary];
        uint64_t v15 = [v14 payments];
LABEL_14:

        goto LABEL_15;
    }
LABEL_11:
    uint64_t v15 = 0;
    double v17 = 0;
    double v18 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (v8)
  {
    id v12 = [v8 currencyCode];
    uint64_t v16 = [v19 type];
    switch(v16)
    {
      case 5:
        uint64_t v15 = [v9 paymentsAndCredits];
        goto LABEL_15;
      case 8:
        uint64_t v15 = [v9 credits];
        goto LABEL_15;
      case 9:
        uint64_t v15 = [v9 payments];
LABEL_15:
        double v17 = PKLocalizedFeatureString();
        double v18 = 0;
        if (v15 && v12)
        {
          double v18 = PKCurrencyAmountCreate(v15, (NSString *)v12);
        }
        goto LABEL_18;
    }
    goto LABEL_11;
  }
  double v17 = 0;
  double v18 = 0;
LABEL_19:
  [v6 setAmount:v18];
  [v6 setDetailString:0];
  [v6 setShowsPositivePrefix:1];
  [v6 setTitleString:v17];
  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v6];
}

- (void)_configureInstallmentBalanceCell:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v17 = [v6 summary];
  char v8 = [v17 installmentBalance];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C28] zero];
  }
  id v11 = v10;

  id v12 = [v6 account];

  uint64_t v13 = [v12 creditDetails];
  double v14 = [v13 currencyCode];
  uint64_t v15 = PKCurrencyAmountCreate(v11, v14);

  [v7 setAmount:v15];
  [v7 setDetailString:0];
  [v7 setShowsPositivePrefix:0];
  uint64_t v16 = PKLocalizedBeekmanString(&cfstr_InstallmentBal.isa);
  [v7 setTitleString:v16];

  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v7];
}

- (void)_configureTransactionLimitCell:(id)a3 forItem:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [v6 accountUserCollection];
  char v8 = [v7 currentAccountUser];
  id v9 = [v8 preferences];
  id v10 = [v9 transactionSpendLimitAmount];

  id v11 = [v6 account];

  id v12 = [v11 creditDetails];
  uint64_t v13 = [v12 currencyCode];

  if (v10)
  {
    if (v13)
    {
      double v14 = [MEMORY[0x1E4F28C28] notANumber];
      char v15 = [v10 isEqualToNumber:v14];

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = PKCurrencyAmountMake();
        [v18 setAmount:v16];

        [v18 setDetailString:0];
        [v18 setShowsPositivePrefix:0];
        id v17 = PKLocalizedMadisonString(&cfstr_TransactionLim.isa);
        [v18 setTitleString:v17];

        [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v18];
      }
    }
  }
}

- (void)_configureMonthlySpendLimitCell:(id)a3 forItem:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [v6 accountUserCollection];
  char v8 = [v7 currentAccountUser];
  id v9 = [v8 preferences];
  id v10 = [v9 monthlySpendLimitAmount];

  id v11 = [v6 account];

  id v12 = [v11 creditDetails];
  uint64_t v13 = [v12 currencyCode];

  if (v10)
  {
    if (v13)
    {
      double v14 = [MEMORY[0x1E4F28C28] notANumber];
      char v15 = [v10 isEqualToNumber:v14];

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = PKCurrencyAmountMake();
        [v18 setAmount:v16];

        [v18 setDetailString:0];
        [v18 setShowsPositivePrefix:0];
        id v17 = PKLocalizedMadisonString(&cfstr_MonthlySpendLi.isa);
        [v18 setTitleString:v17];

        [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v18];
      }
    }
  }
}

- (void)_configureMergeBalanceCell:(id)a3 forItem:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  id v7 = [v6 account];
  [v7 feature];
  char v8 = [v6 mergeSummaryAccountDetails];
  uint64_t v9 = [v6 mergeDate];
  id v10 = (void *)v9;
  if (v8)
  {
    id v11 = [v8 currentBalance];
    id v12 = [v7 creditDetails];
    uint64_t v13 = [v12 currencyCode];

    double v14 = [v8 ownerAltDSID];
    char v15 = [v6 accountUserCollection];
    uint64_t v16 = [v15 accountUserWithAltDSID:v14];

    if (v11 && v13)
    {
      id v17 = PKCurrencyAmountMake();
      [v27 setAmount:v17];

      [v27 setDetailString:0];
      [v27 setShowsPositivePrefix:0];
    }
    double v26 = (void *)v13;
    if ([v16 isCurrentUser])
    {
      id v18 = PKLocalizedFeatureString();
    }
    else
    {
      double v20 = [v6 familyCollection];
      int v25 = [v20 familyMemberForAltDSID:v14];

      id v21 = (void *)MEMORY[0x1E4F845E8];
      id v22 = [v16 nameComponents];
      double v23 = [v21 contactForFamilyMember:v25 nameComponents:v22 imageData:0];

      double v24 = [v23 givenName];
      id v18 = PKLocalizedFeatureString();
    }
    objc_msgSend(v27, "setTitleString:", v18, v24);
  }
  else
  {
    if (!v9) {
      goto LABEL_12;
    }
    id v19 = PKLocalizedFeatureString();
    [v27 setTitleString:v19];

    [v27 setAmount:0];
    id v11 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v10 dateStyle:2 timeStyle:0];
    [v27 setDetailString:v11];
  }

LABEL_12:
  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v27];
}

- (void)_configureMergeNoticeCell:(id)a3 forItem:(id)a4
{
  id v4 = a3;
  v5 = [v4 titleLabel];
  id v6 = PKLocalizedMadisonString(&cfstr_AccountMerging.isa);
  [v5 setText:v6];

  id v8 = [v4 messageLabel];

  id v7 = PKLocalizedMadisonString(&cfstr_AccountMerging_0.isa);
  [v8 setText:v7];
}

- (void)_configureTotalBalanceCell:(id)a3 forItem:(id)a4
{
  id v24 = a4;
  id v6 = a3;
  id v7 = [v24 account];
  [v7 feature];

  id v8 = [v24 account];
  uint64_t v9 = [v8 creditDetails];

  id v10 = [v9 accountSummary];
  if (!v10)
  {
    uint64_t v16 = 0;
    id v17 = 0;
    BOOL v18 = 0;
    goto LABEL_17;
  }
  id v11 = [v24 account];
  id v12 = [v11 creditDetails];
  uint64_t v13 = [v12 currencyCode];

  uint64_t v14 = [v24 type];
  switch(v14)
  {
    case 12:
      char v15 = [v10 creditLimit];
      goto LABEL_8;
    case 13:
      id v19 = [v9 totalBalance];
      double v20 = [v19 amount];
      id v21 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v22 = [v20 compare:v21];

      BOOL v18 = v22 == -1;
      if (v22 == -1)
      {
        uint64_t v23 = [v19 negativeValue];

        id v19 = (void *)v23;
      }
      char v15 = [v19 amount];
      id v17 = PKLocalizedFeatureString();

      goto LABEL_12;
    case 14:
      char v15 = [v10 availableCredit];
LABEL_8:
      id v17 = PKLocalizedFeatureString();
      BOOL v18 = 0;
LABEL_12:
      uint64_t v16 = 0;
      if (v15 && v13)
      {
        uint64_t v16 = PKCurrencyAmountCreate(v15, v13);
      }
      goto LABEL_16;
  }
  uint64_t v16 = 0;
  id v17 = 0;
  BOOL v18 = 0;
  char v15 = 0;
LABEL_16:

LABEL_17:
  [v6 setAmount:v16];
  [v6 setDetailString:0];
  [v6 setShowsPositivePrefix:v18];
  [v6 setTitleString:v17];
  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v6];
}

- (void)_configureDailyCashCell:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v24 = [v6 summary];
  id v8 = [v6 statement];
  uint64_t v9 = [v24 balanceSummary];
  id v10 = [v6 account];

  id v11 = [v10 creditDetails];
  id v12 = [v11 currencyCode];

  if (v24
    && ([v9 rewardsEarned], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, v13)
    && v12)
  {
    uint64_t v14 = [v9 rewardsEarned];
  }
  else
  {
    uint64_t v15 = [v8 rewardsEarned];
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      id v17 = [v8 currencyCode];

      if (v17)
      {
        BOOL v18 = [v8 rewardsEarned];
        id v19 = [v8 currencyCode];
        double v20 = PKCurrencyAmountCreate(v18, v19);

        goto LABEL_10;
      }
    }
    uint64_t v14 = [MEMORY[0x1E4F28C28] zero];
  }
  BOOL v18 = v14;
  double v20 = PKCurrencyAmountCreate(v14, v12);
LABEL_10:

  id v21 = [v20 amount];
  uint64_t v22 = objc_msgSend(v21, "pk_isNegativeNumber") ^ 1;

  [v7 setAmount:v20];
  [v7 setDetailString:0];
  [v7 setShowsPositivePrefix:v22];
  uint64_t v23 = PKLocalizedFeatureString();
  [v7 setTitleString:v23];

  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v7];
}

- (void)_configureRewardsSummaryCell:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [v6 rewardsCurrencyAmount];
  uint64_t v8 = [v6 type];

  if (v8 == 19 || v8 == 20)
  {
    uint64_t v9 = PKLocalizedFeatureString();
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v7 setAmount:v10];
  [v7 setDetailString:0];
  [v7 setShowsPositivePrefix:0];
  [v7 setTitleString:v9];
  [(PKDashboardBalanceSummaryItemPresenter *)self _configureCellForReuse:v7];
}

- (void)_configureExportStatementDataCell:(id)a3 forItem:(id)a4
{
  id v4 = a3;
  PKLocalizedFeatureString();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setTitle:v5];
}

- (void)_selectFileFormatForExportedStatementDataForItem:(id)a3 inCollectionView:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (PKStoreDemoModeEnabled())
  {
    uint64_t v8 = PKUIStoreDemoGatewayViewController();
    uint64_t v9 = objc_msgSend(v7, "pkui_viewControllerFromResponderChain");
    [v9 presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v10 = [v6 account];
    uint64_t v11 = [v10 feature];
    id v12 = [v10 exportTransactionDataFeatureDescriptor];
    uint64_t v13 = [v12 supportedFileFormatsForTransactionData];

    unint64_t v14 = [v13 count];
    if (v14 < 2)
    {
      if (v14 == 1)
      {
        v30 = [v13 firstObject];
        [(PKDashboardBalanceSummaryItemPresenter *)self _downloadExportedStatementDataForItem:v6 withFileFormat:v30 inCollectionView:v7];
      }
    }
    else
    {
      v32 = v10;
      id v34 = v7;
      uint64_t v15 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v16 = PKLocalizedFeatureString();
      v33 = [v15 alertControllerWithTitle:v16 message:0 preferredStyle:0];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v31 = v13;
      id v17 = v13;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v40 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            uint64_t v23 = [(PKDashboardBalanceSummaryItemPresenter *)self _readableFileTypeForFormat:v22 feature:v11];
            if (v23)
            {
              id v24 = (void *)MEMORY[0x1E4FB1410];
              v35[0] = MEMORY[0x1E4F143A8];
              v35[1] = 3221225472;
              v35[2] = __108__PKDashboardBalanceSummaryItemPresenter__selectFileFormatForExportedStatementDataForItem_inCollectionView___block_invoke;
              v35[3] = &unk_1E59CCA50;
              v35[4] = self;
              id v36 = v6;
              uint64_t v37 = v22;
              id v38 = v34;
              int v25 = [v24 actionWithTitle:v23 style:0 handler:v35];
              [v33 addAction:v25];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v19);
      }

      double v26 = (void *)MEMORY[0x1E4FB1410];
      id v27 = PKLocalizedFeatureString();
      id v28 = [v26 actionWithTitle:v27 style:1 handler:0];
      [v33 addAction:v28];

      id v7 = v34;
      id v29 = objc_msgSend(v34, "pkui_viewControllerFromResponderChain");
      [v29 presentViewController:v33 animated:1 completion:0];

      uint64_t v13 = v31;
      id v10 = v32;
    }
  }
}

uint64_t __108__PKDashboardBalanceSummaryItemPresenter__selectFileFormatForExportedStatementDataForItem_inCollectionView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadExportedStatementDataForItem:*(void *)(a1 + 40) withFileFormat:*(void *)(a1 + 48) inCollectionView:*(void *)(a1 + 56)];
}

- (id)_readableFileTypeForFormat:(id)a3 feature:(unint64_t)a4
{
  id v4 = [a3 uppercaseString];
  id v5 = v4;
  if (v4 == @"CSV") {
    goto LABEL_4;
  }
  if (v4)
  {
    char v6 = [(__CFString *)v4 isEqualToString:@"CSV"];

    if (v6) {
      goto LABEL_4;
    }
    uint64_t v9 = v5;
    if (v9 == @"OFX") {
      goto LABEL_4;
    }
    id v10 = v9;
    char v11 = [(__CFString *)v9 isEqualToString:@"OFX"];

    if (v11) {
      goto LABEL_4;
    }
    id v12 = v10;
    if (v12 == @"QFX") {
      goto LABEL_4;
    }
    uint64_t v13 = v12;
    char v14 = [(__CFString *)v12 isEqualToString:@"QFX"];

    if (v14) {
      goto LABEL_4;
    }
    uint64_t v15 = v13;
    if (v15 == @"QIF") {
      goto LABEL_4;
    }
    uint64_t v16 = v15;
    char v17 = [(__CFString *)v15 isEqualToString:@"QIF"];

    if (v17) {
      goto LABEL_4;
    }
    uint64_t v18 = v16;
    if (v18 == @"QBO") {
      goto LABEL_4;
    }
    uint64_t v19 = v18;
    char v20 = [(__CFString *)v18 isEqualToString:@"QBO"];

    if (v20) {
      goto LABEL_4;
    }
    id v21 = v19;
    if (v21 == @"XLS") {
      goto LABEL_4;
    }
    uint64_t v22 = v21;
    char v23 = [(__CFString *)v21 isEqualToString:@"XLS"];

    if (v23) {
      goto LABEL_4;
    }
    id v24 = v22;
    if (v24 == @"XLSX"
      || (int v25 = v24,
          char v26 = [(__CFString *)v24 isEqualToString:@"XLSX"],
          v25,
          (v26 & 1) != 0)
      || (id v27 = v25, v27 == @"PDF")
      || (id v7 = v27, v28 = [(__CFString *)v27 isEqualToString:@"PDF"], v7, v28))
    {
LABEL_4:
      id v7 = PKLocalizedFeatureString();
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_downloadExportedStatementDataForItem:(id)a3 withFileFormat:(id)a4 inCollectionView:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v9 = a5;
  id v10 = [v8 account];
  uint64_t v11 = [v10 feature];
  id v29 = v8;
  v33 = [v8 statement];
  id v12 = [v33 accountIdentifier];
  uint64_t v13 = v12;
  v32 = v10;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 accountIdentifier];
  }
  v31 = v14;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke;
  aBlock[3] = &unk_1E59CD040;
  uint64_t v43 = v11;
  id v15 = v9;
  id v42 = v15;
  uint64_t v16 = _Block_copy(aBlock);
  exportedStatementDataItem = self->_exportedStatementDataItem;
  self->_exportedStatementDataItem = 0;

  exportedStatementData = self->_exportedStatementData;
  self->_exportedStatementData = 0;

  pdfData = self->_pdfData;
  self->_pdfData = 0;

  pdfItem = self->_pdfItem;
  self->_pdfItem = 0;

  [(PKDashboardButtonCollectionViewCell *)self->_exportStatementDataCell setShowActivity:1];
  [(PKDashboardButtonCollectionViewCell *)self->_exportStatementDataCell setEnabled:0];
  objc_initWeak(&location, self);
  id v21 = [MEMORY[0x1E4F84270] sharedInstance];
  uint64_t v22 = [v33 openingDate];
  char v23 = [v33 closingDate];
  id v24 = [v32 creditDetails];
  int v25 = [v24 productTimeZone];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_2;
  v34[3] = &unk_1E59CD0B8;
  objc_copyWeak(&v39, &location);
  id v26 = v16;
  id v38 = v26;
  id v27 = v30;
  id v35 = v27;
  id v28 = v15;
  id v36 = v28;
  uint64_t v37 = self;
  [v21 exportTransactionDataForAccountIdentifier:v31 withFileFormat:v27 beginDate:v22 endDate:v23 productTimeZone:v25 completion:v34];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

void __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = +[PKAccountFlowController displayableErrorForError:a2 featureIdentifier:*(void *)(a1 + 40) genericErrorTitle:0 genericErrorMessage:0];
  id v3 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
  id v5 = [v4 navigationController];
  [v5 presentViewController:v3 animated:1 completion:0];
}

void __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_3;
  block[3] = &unk_1E59CD090;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  id v12 = v5;
  id v13 = v6;
  id v17 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v18);
}

void __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_3(uint64_t a1)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[5] setShowActivity:0];
    [v3[5] setEnabled:1];
    id v4 = *(void **)(a1 + 32);
    if (v4 && !*(void *)(a1 + 40))
    {
      id v5 = [v4 transactionData];
      uint64_t v6 = [*(id *)(a1 + 32) transactionDataFilename];
      id v7 = (void *)v6;
      if (!v5) {
        goto LABEL_11;
      }
      if (!v6) {
        goto LABEL_11;
      }
      uint64_t v8 = [*(id *)(a1 + 32) transactionDataHash];
      id v9 = [v5 SHA256Hash];
      id v10 = [v9 hexEncoding];
      int v11 = [v8 isEqualToString:v10];

      if (!v11)
      {
LABEL_11:
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_29:

        goto LABEL_30;
      }
      objc_storeStrong(v3 + 13, v5);
      id v12 = [*(id *)(a1 + 48) lowercaseString];
      id v13 = v12;
      if (v12 == @"csv")
      {
        int v14 = 1;
      }
      else if (v12)
      {
        int v14 = [(__CFString *)v12 isEqualToString:@"csv"];
      }
      else
      {
        int v14 = 0;
      }

      id v15 = [*(id *)(a1 + 48) lowercaseString];
      if (v15 == @"pdf")
      {
      }
      else
      {
        uint64_t v16 = v15;
        if (v15) {
          int v17 = [(__CFString *)v15 isEqualToString:@"pdf"];
        }
        else {
          int v17 = 0;
        }

        if ((v14 | v17) != 1)
        {
          uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v26 = [v19 temporaryDirectory];
          id v27 = [v26 URLByAppendingPathComponent:v7];

          id v28 = [v27 path];
          int v29 = [v19 createFileAtPath:v28 contents:v3[13] attributes:0];

          if (v29)
          {
            id v30 = objc_alloc(MEMORY[0x1E4F9F2E8]);
            v43[0] = v27;
            v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
            v32 = (void *)[v30 initWithActivityItems:v31 applicationActivities:0];

            uint64_t v33 = *MEMORY[0x1E4F9F3B8];
            v42[0] = *MEMORY[0x1E4F9F390];
            v42[1] = v33;
            uint64_t v34 = *MEMORY[0x1E4F9F3B0];
            v42[2] = *MEMORY[0x1E4F9F398];
            v42[3] = v34;
            v42[4] = *MEMORY[0x1E4F9F3A0];
            id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:5];
            [v32 setExcludedActivityTypes:v35];

            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_4;
            v39[3] = &unk_1E59CD068;
            id v40 = v19;
            id v41 = v27;
            [v32 setCompletionWithItemsHandler:v39];
            if (objc_msgSend(v32, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
            {
              id v36 = [v32 popoverPresentationController];
              [v36 setSourceView:*(void *)(*(void *)(a1 + 64) + 40)];
            }
            uint64_t v37 = objc_msgSend(*(id *)(a1 + 56), "pkui_viewControllerFromResponderChain");
            id v38 = [v37 navigationController];
            [v38 presentViewController:v32 animated:1 completion:0];
          }
          goto LABEL_28;
        }
      }
      id v18 = (id *)MEMORY[0x1E4F44360];
      if (!v14) {
        id v18 = (id *)MEMORY[0x1E4F44450];
      }
      uint64_t v19 = [*v18 identifier];
      uint64_t v20 = [objc_alloc(_MergedGlobals_659()) initWithDataProvider:v3 contentType:v19 previewTitle:v7];
      id v21 = v3[15];
      v3[15] = (id)v20;

      id v22 = objc_alloc_init(off_1EB545920());
      id v23 = v3[16];
      v3[16] = v22;

      [v3[16] setDelegate:v3];
      [v3[16] setDataSource:v3];
      id v24 = objc_msgSend(*(id *)(a1 + 56), "pkui_viewControllerFromResponderChain");
      int v25 = [v24 navigationController];
      [v25 presentViewController:v3[16] animated:1 completion:0];

LABEL_28:
      goto LABEL_29;
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
LABEL_30:
}

void __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_4(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  id v12 = (__CFString *)v9;
  int v14 = v12;
  if (v12 != @"com.apple.UIKit.activity.AirDrop")
  {
    if (!v12
      || (int v13 = [(__CFString *)v12 isEqualToString:@"com.apple.UIKit.activity.AirDrop"],
          v14,
          !v13)
      && a3)
    {
      [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
    }
  }
}

- (void)_configureStatementDownloadCell:(id)a3 forItem:(id)a4
{
  id v4 = a3;
  PKLocalizedFeatureString();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setTitle:v5];
}

- (void)_downloadAndPresentStatementForItem:(id)a3 inCollectionView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PKStoreDemoModeEnabled())
  {
    uint64_t v8 = PKUIStoreDemoGatewayViewController();
    id v9 = objc_msgSend(v7, "pkui_viewControllerFromResponderChain");
    [v9 presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v10 = [v6 account];
    uint64_t v11 = [v10 feature];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke;
    aBlock[3] = &unk_1E59CD040;
    uint64_t v32 = v11;
    id v12 = v7;
    id v31 = v12;
    int v13 = _Block_copy(aBlock);
    id v26 = [v6 webService];
    int v14 = [v6 account];
    id v15 = [v6 statement];
    uint64_t v16 = [v15 accountIdentifier];
    int v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [v14 accountIdentifier];
    }
    uint64_t v19 = v18;

    id v20 = objc_alloc_init(MEMORY[0x1E4F84318]);
    [v20 setAccountIdentifier:v19];
    id v21 = [v15 identifier];
    [v20 setDocumentIdentifier:v21];

    id v22 = [v14 accountBaseURL];
    [v20 setBaseURL:v22];

    [v20 setAction:1];
    if (self->_pdfData && self->_previewController && self->_pdfItem)
    {
      id v23 = objc_msgSend(v12, "pkui_viewControllerFromResponderChain");
      id v24 = [v23 navigationController];
      [v24 presentViewController:self->_previewController animated:1 completion:0];

      int v25 = v26;
    }
    else
    {
      [(PKDashboardButtonCollectionViewCell *)self->_downloadPDFCell setShowActivity:1];
      [(PKDashboardButtonCollectionViewCell *)self->_downloadPDFCell setEnabled:0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke_2;
      v27[3] = &unk_1E59CD108;
      v27[4] = self;
      id v29 = v13;
      id v28 = v12;
      int v25 = v26;
      [v26 accountDocumentActionWithRequest:v20 completion:v27];
    }
  }
}

void __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = PKLocalizedFeatureString();
    id v5 = PKLocalizedFeatureString();
    PKDisplayableErrorCustom();
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    id v3 = v15;
  }
  id v6 = (void *)MEMORY[0x1E4FB1418];
  id v16 = v3;
  id v7 = PKTitleForDisplayableError();
  uint64_t v8 = MEMORY[0x1A6221F20](v16);
  id v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  id v10 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v11 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  id v12 = [v10 actionWithTitle:v11 style:1 handler:0];
  [v9 addAction:v12];

  int v13 = objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
  int v14 = [v13 navigationController];
  [v14 presentViewController:v9 animated:1 completion:0];
}

void __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke_3;
  block[3] = &unk_1E59CD0E0;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v13 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setShowActivity:0];
  [*(id *)(*(void *)(a1 + 32) + 32) setEnabled:1];
  v2 = *(void **)(a1 + 40);
  if (v2) {
    BOOL v3 = *(void *)(a1 + 48) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    id obj = [v2 documentPDFData];
    id v5 = [*(id *)(a1 + 40) documentDataFilename];
    if (obj) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6) {
      goto LABEL_14;
    }
    id v7 = [*(id *)(a1 + 40) documentDataHash];
    id v8 = [obj SHA256Hash];
    id v9 = [v8 hexEncoding];
    int v10 = [v7 isEqualToString:v9];

    if (!v10)
    {
LABEL_14:
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), obj);
      id v11 = [(id)*MEMORY[0x1E4F44450] identifier];
      uint64_t v12 = [objc_alloc(_MergedGlobals_659()) initWithDataProvider:*(void *)(a1 + 32) contentType:v11 previewTitle:v5];
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = *(void **)(v13 + 112);
      *(void *)(v13 + 112) = v12;

      id v15 = objc_alloc_init(off_1EB545920());
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = *(void **)(v16 + 128);
      *(void *)(v16 + 128) = v15;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setDelegate:");
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setDataSource:");
      id v18 = objc_msgSend(*(id *)(a1 + 56), "pkui_viewControllerFromResponderChain");
      uint64_t v19 = [v18 navigationController];
      [v19 presentViewController:*(void *)(*(void *)(a1 + 32) + 128) animated:1 completion:0];
    }
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v4();
  }
}

- (id)statementIcon
{
  statementIcon = self->_statementIcon;
  if (!statementIcon)
  {
    id v4 = PKPassKitUIBundle();
    id v5 = [v4 URLForResource:@"Category_Statement" withExtension:@"pdf"];
    double v6 = PKUIScreenScale();
    PKUIImageFromPDF(v5, 45.0, 45.0, v6);
    id v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_statementIcon;
    self->_statementIcon = v7;

    statementIcon = self->_statementIcon;
  }

  return statementIcon;
}

- (id)_statementCellTitleForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 statement];
  double v6 = [v5 openingDate];
  id v7 = [v5 closingDate];
  id v8 = PKDatesMidpoint();

  id v9 = [v4 account];

  int v10 = [v9 creditDetails];
  id v11 = [v10 productTimeZone];

  [(NSDateFormatter *)self->_formatterMonthYear setTimeZone:v11];
  [(NSDateFormatter *)self->_formatterMonthAndDay setTimeZone:v11];
  [(NSDateFormatter *)self->_formatterMonthDayYear setTimeZone:v11];
  uint64_t v12 = [(NSDateFormatter *)self->_formatterMonthYear stringFromDate:v8];
  uint64_t v13 = objc_msgSend(v12, "pk_uppercaseFirstStringForPreferredLocale");

  return v13;
}

- (BOOL)_statementIsFromMonthPriorToSummaryForItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 statement];
  id v5 = [v3 summary];
  double v6 = [v5 balanceSummary];

  id v7 = [v6 openingDate];
  id v8 = [v6 closingDate];
  id v9 = PKDatesMidpoint();

  int v10 = [v4 openingDate];
  id v11 = [v4 closingDate];
  uint64_t v12 = PKDatesMidpoint();

  id v13 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v13 setMonth:-1];
  id v14 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v15 = (void *)[v14 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v16 = [v3 account];

  int v17 = [v16 creditDetails];
  id v18 = [v17 productTimeZone];
  [v15 setTimeZone:v18];

  uint64_t v19 = [v15 dateByAddingComponents:v13 toDate:v9 options:0];
  uint64_t v20 = [v15 component:8 fromDate:v19];
  LOBYTE(v20) = [v15 component:8 fromDate:v12] == v20;

  return v20;
}

- (void)_configureCellForReuse:(id)a3
{
  id v3 = a3;
  [v3 setWantsDefaultHighlightBehavior:0];
  [v3 setWantsCustomAppearance:1];
  id v4 = [(id)objc_opt_class() defaultBackgroundColor];
  [v3 setBackgroundColor:v4];
}

- (id)provideDataForItem:(id)a3
{
  pdfData = self->_pdfData;
  if (!pdfData) {
    pdfData = self->_exportedStatementData;
  }
  return pdfData;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return self->_pdfItem || self->_exportedStatementDataItem != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  pdfItem = self->_pdfItem;
  if (!pdfItem) {
    pdfItem = self->_exportedStatementDataItem;
  }
  return pdfItem;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a4;
      id v8 = [a3 preferredContentSizeCategory];
      id v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        id v11 = [PKPaymentTransactionCollectionViewCell alloc];
        double v12 = *MEMORY[0x1E4F1DB28];
        double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        uint64_t v16 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
        sampleTransactionCell = self->_sampleTransactionCell;
        self->_sampleTransactionCell = v16;

        id v18 = -[PKDashboardButtonCollectionViewCell initWithFrame:]([PKDashboardButtonCollectionViewCell alloc], "initWithFrame:", v12, v13, v14, v15);
        sampleButtonCell = self->_sampleButtonCell;
        self->_sampleButtonCell = v18;

        uint64_t v20 = -[PKDashboardCurrencyAmountCell initWithFrame:]([PKDashboardCurrencyAmountCell alloc], "initWithFrame:", v12, v13, v14, v15);
        sampleCurrencyCell = self->_sampleCurrencyCell;
        self->_sampleCurrencyCell = v20;

        id v22 = -[PKDashboardTitleMessageCell initWithFrame:]([PKDashboardTitleMessageCell alloc], "initWithFrame:", v12, v13, v14, v15);
        sampleTitleMessageCell = self->_sampleTitleMessageCell;
        self->_sampleTitleMessageCell = v22;
      }
    }
  }
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_int64_t cellStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_exportedStatementDataItem, 0);
  objc_storeStrong((id *)&self->_pdfItem, 0);
  objc_storeStrong((id *)&self->_exportedStatementData, 0);
  objc_storeStrong((id *)&self->_pdfData, 0);
  objc_storeStrong((id *)&self->_statementIcon, 0);
  objc_storeStrong((id *)&self->_formatterMonth, 0);
  objc_storeStrong((id *)&self->_formatterMonthDayYear, 0);
  objc_storeStrong((id *)&self->_formatterMonthAndDay, 0);
  objc_storeStrong((id *)&self->_formatterMonthYear, 0);
  objc_storeStrong((id *)&self->_sampleTitleMessageCell, 0);
  objc_storeStrong((id *)&self->_exportStatementDataCell, 0);
  objc_storeStrong((id *)&self->_downloadPDFCell, 0);
  objc_storeStrong((id *)&self->_sampleCurrencyCell, 0);
  objc_storeStrong((id *)&self->_sampleButtonCell, 0);

  objc_storeStrong((id *)&self->_sampleTransactionCell, 0);
}

@end