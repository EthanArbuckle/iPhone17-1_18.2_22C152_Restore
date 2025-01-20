@interface PKCreditBalanceAndPaymentPresenter
- (BOOL)_useAccessibilityLayoutForCollectionView:(id)a3;
- (BOOL)cellIsIndependentForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (BOOL)cellIsStackableForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKCreditBalanceAndPaymentPresenter)initWithViewController:(id)a3;
- (id)_accountServiceResoultionControllerWithItem:(id)a3;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureAccountUserSpendingCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)_configureActivityCell:(id)a3 forItem:(id)a4 sizing:(BOOL)a5 inCollectionView:(id)a6 forIndexPath:(id)a7;
- (void)_configureBalanceCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)_configurePaymentDueCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)paymentButtonTappedForItem:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKCreditBalanceAndPaymentPresenter

- (PKCreditBalanceAndPaymentPresenter)initWithViewController:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKCreditBalanceAndPaymentPresenter;
  v5 = [(PKCreditBalanceAndPaymentPresenter *)&v17 init];
  if (v5)
  {
    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    paymentDateFormatter = v5->_paymentDateFormatter;
    v5->_paymentDateFormatter = v6;

    [(NSDateFormatter *)v5->_paymentDateFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    monthDayFormatter = v5->_monthDayFormatter;
    v5->_monthDayFormatter = v8;

    v10 = v5->_monthDayFormatter;
    v11 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v10 setLocale:v11];

    [(NSDateFormatter *)v5->_monthDayFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    monthFormatter = v5->_monthFormatter;
    v5->_monthFormatter = v12;

    v14 = v5->_monthFormatter;
    v15 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v14 setLocale:v15];

    [(NSDateFormatter *)v5->_monthFormatter setLocalizedDateFormatFromTemplate:@"MMMM"];
    objc_storeWeak((id *)&v5->_viewController, v4);
    v5->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
  }

  return v5;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"balancePresenter";
  v5[0] = objc_opt_class();
  v4[1] = @"paymentDuePresenter";
  v5[1] = objc_opt_class();
  v4[2] = @"activityPresenter";
  v5[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  switch([v8 type])
  {
    case 0:
      v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"balancePresenter" forIndexPath:v10];
      [(PKCreditBalanceAndPaymentPresenter *)self _configureBalanceCell:v11 forItem:v8 inCollectionView:v9 forIndexPath:v10];
      break;
    case 1:
      v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"balancePresenter" forIndexPath:v10];
      [(PKCreditBalanceAndPaymentPresenter *)self _configureAccountUserSpendingCell:v11 forItem:v8 inCollectionView:v9 forIndexPath:v10];
      break;
    case 2:
    case 3:
      v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"activityPresenter" forIndexPath:v10];
      [(PKCreditBalanceAndPaymentPresenter *)self _configureActivityCell:v11 forItem:v8 sizing:0 inCollectionView:v9 forIndexPath:v10];
      break;
    case 4:
      v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"paymentDuePresenter" forIndexPath:v10];
      [(PKCreditBalanceAndPaymentPresenter *)self _configurePaymentDueCell:v11 forItem:v8 inCollectionView:v9 forIndexPath:v10];
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  switch([v10 type])
  {
    case 0:
      [(PKCreditBalanceAndPaymentPresenter *)self _configureBalanceCell:v13 forItem:v10 inCollectionView:v11 forIndexPath:v12];
      break;
    case 1:
      [(PKCreditBalanceAndPaymentPresenter *)self _configureAccountUserSpendingCell:v13 forItem:v10 inCollectionView:v11 forIndexPath:v12];
      break;
    case 2:
    case 3:
      [(PKCreditBalanceAndPaymentPresenter *)self _configureActivityCell:v13 forItem:v10 sizing:0 inCollectionView:v11 forIndexPath:v12];
      break;
    case 4:
      [(PKCreditBalanceAndPaymentPresenter *)self _configurePaymentDueCell:v13 forItem:v10 inCollectionView:v11 forIndexPath:v12];
      break;
    default:
      break;
  }
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_sampleBalanceCell)
  {
    id v11 = [PKCreditBalanceCell alloc];
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v16 = -[PKCreditBalanceCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    sampleBalanceCell = self->_sampleBalanceCell;
    self->_sampleBalanceCell = v16;

    v18 = -[PKCreditActivityCell initWithFrame:]([PKCreditActivityCell alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleActivityCell = self->_sampleActivityCell;
    self->_sampleActivityCell = v18;

    v20 = -[PKCreditPaymentDueCell initWithFrame:]([PKCreditPaymentDueCell alloc], "initWithFrame:", v12, v13, v14, v15);
    samplePaymentDueCell = self->_samplePaymentDueCell;
    self->_samplePaymentDueCell = v20;
  }
  v22 = (NSString *)*MEMORY[0x1E4FB27B0];
  v23 = [v9 traitCollection];
  v24 = [v23 preferredContentSizeCategory];
  NSComparisonResult v25 = UIContentSizeCategoryCompareToCategory(v22, v24);

  [v9 frame];
  double v27 = v26;
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  v28.n128_f64[0] = v27 + v28.n128_f64[0] * -2.0;
  v29.n128_f64[0] = (v28.n128_f64[0] + -8.0) * 0.5;
  if (v25 == NSOrderedDescending) {
    v28.n128_f64[0] = (v28.n128_f64[0] + -8.0) * 0.5;
  }
  PKFloatFloorToPixel(v28, v29);
  uint64_t v31 = v30;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke;
  aBlock[3] = &unk_1E59CE8D8;
  BOOL v93 = v25 == NSOrderedDescending;
  aBlock[4] = self;
  id v32 = v8;
  id v88 = v32;
  id v33 = v9;
  id v89 = v33;
  id v34 = v10;
  id v90 = v34;
  uint64_t v91 = v31;
  uint64_t v92 = 0x47EFFFFFE0000000;
  v35 = _Block_copy(aBlock);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_2;
  v80[3] = &unk_1E59CE8D8;
  BOOL v86 = v25 == NSOrderedDescending;
  v80[4] = self;
  id v36 = v32;
  id v81 = v36;
  id v37 = v33;
  id v82 = v37;
  id v38 = v34;
  id v83 = v38;
  uint64_t v84 = v31;
  uint64_t v85 = 0x47EFFFFFE0000000;
  v39 = _Block_copy(v80);
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_3;
  v71[3] = &unk_1E59CE900;
  BOOL v79 = v25 == NSOrderedDescending;
  v40 = v35;
  id v75 = v40;
  v41 = v39;
  uint64_t v77 = v31;
  uint64_t v78 = 0x47EFFFFFE0000000;
  id v76 = v41;
  v71[4] = self;
  id v42 = v36;
  id v72 = v42;
  id v43 = v37;
  id v73 = v43;
  id v44 = v38;
  id v74 = v44;
  v45 = (double (**)(void))_Block_copy(v71);
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_4;
  v64[3] = &unk_1E59CE8D8;
  BOOL v70 = v25 == NSOrderedDescending;
  v64[4] = self;
  id v46 = v42;
  id v65 = v46;
  id v66 = v43;
  id v67 = v44;
  uint64_t v68 = v31;
  uint64_t v69 = 0x47EFFFFFE0000000;
  id v47 = v44;
  id v48 = v43;
  v49 = _Block_copy(v64);
  v50 = _Block_copy(v41);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_5;
  v61[3] = &unk_1E59CE928;
  id v51 = v49;
  id v62 = v51;
  id v52 = v50;
  id v63 = v52;
  v53 = (double (**)(id))_Block_copy(v61);
  switch([v46 type])
  {
    case 0:
      double v54 = v40[2](v40);
      goto LABEL_17;
    case 1:
      if (v25 == NSOrderedDescending) {
        v58 = v53;
      }
      else {
        v58 = (double (**)(id))v51;
      }
      goto LABEL_14;
    case 2:
      if (v25 == NSOrderedDescending) {
        v58 = v53;
      }
      else {
        v58 = (double (**)(id))v52;
      }
LABEL_14:
      double v54 = v58[2](v58);
      goto LABEL_17;
    case 3:
      double v54 = v41[2](v41);
      goto LABEL_17;
    case 4:
      double v54 = v45[2](v45);
LABEL_17:
      double v56 = v54;
      double v57 = v55;
      break;
    default:
      double v56 = *MEMORY[0x1E4F1DB30];
      double v57 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
  }

  double v59 = v56;
  double v60 = v57;
  result.height = v60;
  result.width = v59;
  return result;
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  [*(id *)(a1 + 32) _configureBalanceCell:*(void *)(*(void *)(a1 + 32) + 8) forItem:*(void *)(a1 + 40) inCollectionView:*(void *)(a1 + 48) forIndexPath:*(void *)(a1 + 56)];
  double v3 = *(double *)(a1 + 72);
  if (v2) {
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sizeThatFits:", *(double *)(a1 + 64), v3);
  }
  v5 = *(void **)(*(void *)(a1 + 32) + 8);
  double v6 = *(double *)(a1 + 64);

  return objc_msgSend(v5, "sizeThatFits:", v6, v3);
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  [*(id *)(a1 + 32) _configureActivityCell:*(void *)(*(void *)(a1 + 32) + 16) forItem:*(void *)(a1 + 40) sizing:1 inCollectionView:*(void *)(a1 + 48) forIndexPath:*(void *)(a1 + 56)];
  double v3 = *(double *)(a1 + 72);
  if (v2) {
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sizeThatFits:", *(double *)(a1 + 64), v3);
  }
  v5 = *(void **)(*(void *)(a1 + 32) + 16);
  double v6 = *(double *)(a1 + 64);

  return objc_msgSend(v5, "sizeThatFits:", v6, v3);
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _configurePaymentDueCell:*(void *)(*(void *)(a1 + 32) + 24) forItem:*(void *)(a1 + 40) inCollectionView:*(void *)(a1 + 48) forIndexPath:*(void *)(a1 + 56)];
    double v3 = *(void **)(*(void *)(a1 + 32) + 24);
    double v4 = *(double *)(a1 + 80);
    double v5 = *(double *)(a1 + 88);
    return objc_msgSend(v3, "sizeThatFits:", v4, v5);
  }
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  [*(id *)(a1 + 32) _configureAccountUserSpendingCell:*(void *)(*(void *)(a1 + 32) + 8) forItem:*(void *)(a1 + 40) inCollectionView:*(void *)(a1 + 48) forIndexPath:*(void *)(a1 + 56)];
  double v3 = *(double *)(a1 + 72);
  if (v2) {
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sizeThatFits:", *(double *)(a1 + 64), v3);
  }
  double v5 = *(void **)(*(void *)(a1 + 32) + 8);
  double v6 = *(double *)(a1 + 64);

  return objc_msgSend(v5, "sizeThatFits:", v6, v3);
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  switch([v9 type])
  {
    case 0:
    case 1:
      id v11 = [PKCreditBalanceDetailsViewController alloc];
      double v12 = [v9 transactionSourceCollection];
      double v13 = [v9 familyCollection];
      double v14 = [MEMORY[0x1E4F84D50] sharedService];
      double v15 = [v9 account];
      v16 = [v9 accountUserCollection];
      objc_super v17 = [v9 physicalCards];
      v18 = [(PKCreditBalanceDetailsViewController *)v11 initWithStyle:0 transactionSourceCollection:v12 familyCollection:v13 webService:v14 account:v15 accountUserCollection:v16 physicalCards:v17 statement:0 previousStatements:0];

      v19 = objc_msgSend(v10, "pkui_viewControllerFromResponderChain");
      v20 = [v19 navigationController];
      [v20 pushViewController:v18 animated:1];

      v21 = (id *)MEMORY[0x1E4F860D8];
      goto LABEL_6;
    case 2:
    case 3:
      id v46 = [PKSpendingSummaryViewController alloc];
      v50 = [v9 transactionSourceCollection];
      v41 = [v9 familyCollection];
      id v48 = [v9 avatarManager];
      v45 = [v9 account];
      id v44 = [v9 accountUserCollection];
      id v43 = [v9 physicalCards];
      v40 = [v9 summaryFetcher];
      v39 = [v9 weeks];
      id v38 = [v9 months];
      v22 = [v9 years];
      v49 = self;
      uint64_t v23 = PKBroadwaySummaryType();
      v24 = [v9 mostRecentTransactions];
      NSComparisonResult v25 = [v9 pendingPayments];
      [v9 upcomingScheduledPayments];
      double v26 = v42 = v10;
      id v47 = [(PKSpendingSummaryViewController *)v46 initWithTransactionSourceCollection:v50 familyCollection:v41 avatarManager:v48 account:v45 accountUserCollection:v44 physicalCards:v43 fetcher:v40 weeks:v39 months:v38 years:v22 type:v23 unit:0x7FFFFFFFFFFFFFFFLL currentMonthTransactions:v24 pendingPayments:v25 upcomingScheduledPayments:v26 dispayType:0];

      id v10 = v42;
      v18 = (PKCreditBalanceDetailsViewController *)v47;

      id WeakRetained = objc_loadWeakRetained((id *)&v49->_viewController);
      [(PKSpendingSummaryViewController *)v47 setDelegate:WeakRetained];

      __n128 v28 = objc_msgSend(v42, "pkui_viewControllerFromResponderChain");
      __n128 v29 = [v28 navigationController];
      [v29 pushViewController:v47 animated:1];

      v21 = (id *)MEMORY[0x1E4F86CC8];
      goto LABEL_6;
    case 4:
      v18 = [(PKCreditBalanceAndPaymentPresenter *)self _accountServiceResoultionControllerWithItem:v9];
      [(PKCreditBalanceDetailsViewController *)v18 presentFlowForAccountResolution:1 configuration:0 completion:0];
      v21 = (id *)MEMORY[0x1E4F867F0];
LABEL_6:
      id v30 = *v21;

      break;
    default:
      id v30 = 0;
      break;
  }
  uint64_t v31 = *MEMORY[0x1E4F86750];
  uint64_t v32 = *MEMORY[0x1E4F86308];
  v51[0] = *MEMORY[0x1E4F86730];
  v51[1] = v32;
  uint64_t v33 = *MEMORY[0x1E4F86380];
  v52[0] = v31;
  v52[1] = v33;
  v51[2] = *MEMORY[0x1E4F86120];
  v52[2] = v30;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];
  v35 = (void *)MEMORY[0x1E4F843E0];
  id v36 = [v9 transactionSourceCollection];
  id v37 = [v36 paymentPass];
  [v35 reportDashboardEventIfNecessary:v34 forPass:v37];
}

- (BOOL)cellIsStackableForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  uint64_t v8 = [a3 type];
  if (v8 != 3 && v8) {
    LOBYTE(v9) = 0;
  }
  else {
    BOOL v9 = ![(PKCreditBalanceAndPaymentPresenter *)self _useAccessibilityLayoutForCollectionView:v7];
  }

  return v9;
}

- (BOOL)cellIsIndependentForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  BOOL v8 = (unint64_t)[a3 type] <= 4
    && [(PKCreditBalanceAndPaymentPresenter *)self _useAccessibilityLayoutForCollectionView:v7];

  return v8;
}

- (void)_configurePaymentDueCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v191 = a5;
  id v193 = a6;
  id v11 = [v10 account];
  [v11 feature];
  double v12 = [v11 creditDetails];
  double v13 = [v12 accountSummary];
  uint64_t v14 = [v13 paymentDueDate];
  v203 = v12;
  v197 = [v12 createdDate];
  v199 = v13;
  v198 = [v13 currentStatement];
  uint64_t v15 = [v10 upcomingScheduledPayments];
  v207 = [v10 pendingPayments];
  v208 = (void *)v15;
  v201 = +[PKCreditAccountController relevantScheduledPaymentFromScheduledPayments:v15 account:v11];
  id v16 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v17 = *MEMORY[0x1E4F1C318];
  v18 = (void *)[v16 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v17];
  v210 = v11;
  v20 = [v11 creditDetails];
  v21 = [v20 productTimeZone];

  v200 = v19;
  v195 = v21;
  [v19 setTimeZone:v21];
  uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
  v202 = (void *)v14;
  v196 = v18;
  v194 = (void *)v22;
  if (v14)
  {
    uint64_t v23 = v22;
    uint64_t v24 = PKDateRangeNumberOfIntervalsForUnit();
    NSComparisonResult v25 = [v18 components:96 fromDate:v23 toDate:v14 options:0];
    uint64_t v26 = [v25 hour];
    uint64_t v14 = [v25 minute];
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v24 = 0;
  }
  v204 = PKLocalizedFeatureString();
  v212 = [MEMORY[0x1E4FB1618] labelColor];
  v213 = +[PKDashboardViewController backgroundColor];
  v209 = [MEMORY[0x1E4FB1618] labelColor];
  double v27 = [v10 mostRecentTransactions];
  unint64_t v28 = +[PKCreditAccountController paymentEducationStateForAccount:v210 mostRecentTransactions:v27 pendingPayments:v207 upcomingScheduledPayments:v208];

  id v192 = v10;
  switch(v28)
  {
    case 0uLL:
      v205 = PKLocalizedFeatureString();
      __n128 v29 = PKLocalizedFeatureString();
      v219 = 0;
      uint64_t v30 = 0;
      LODWORD(v31) = 0;
      int v32 = 1;
      goto LABEL_52;
    case 1uLL:
      v205 = PKLocalizedFeatureString();
      monthDayFormatter = self->_monthDayFormatter;
      id v37 = PKEndOfNextMonth();
      v183 = [(NSDateFormatter *)monthDayFormatter stringFromDate:v37];
      uint64_t v38 = PKLocalizedFeatureString();

      uint64_t v39 = PKLocalizedFeatureString();

      __n128 v29 = (void *)v38;
      uint64_t v30 = PKLocalizedFeatureString();
      v219 = 0;
      LODWORD(v31) = 0;
      int v32 = 0;
      v204 = (void *)v39;
      goto LABEL_52;
    case 2uLL:
      v205 = PKLocalizedFeatureString();
      __n128 v29 = PKLocalizedFeatureString();
      v219 = 0;
      goto LABEL_51;
    case 3uLL:
      id v40 = v9;
      v41 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v202 dateStyle:0 timeStyle:1];
      int IsSingular = PKHourOfDateIsSingular();
      id v43 = @"ACCOUNT_DASHBOARD_PAYMENT_DUE_BY_TIME";
      if (IsSingular) {
        id v43 = @"ACCOUNT_DASHBOARD_PAYMENT_DUE_BY_TIME_SINGULAR";
      }
      id v44 = v43;
      int v33 = v24 > 7;
      if (v24 >= 8)
      {
        v205 = PKLocalizedFeatureString();
        v219 = [(NSDateFormatter *)self->_monthDayFormatter stringFromDate:v202];
        uint64_t v45 = PKLocalizedFeatureString();

        uint64_t v34 = PKLocalizedFeatureString();
        __n128 v29 = 0;
        v204 = (void *)v45;
LABEL_99:
        unint64_t v35 = 0x1E4FB1000;
        goto LABEL_100;
      }
      if (v24 == 7)
      {
        v205 = PKLocalizedFeatureString();
        PKLocalizedString(&cfstr_DashboardWeeks.isa, &cfstr_Ld.isa, 1);
        v219 = LABEL_98:;
        uint64_t v34 = 0;
        __n128 v29 = 0;
        goto LABEL_99;
      }
      if (v24 >= 2)
      {
        v205 = PKLocalizedFeatureString();
        PKLocalizedString(&cfstr_DashboardDays.isa, &cfstr_Ld.isa, v24);
        goto LABEL_98;
      }
      if (v24 == 1 && v26 >= 13 || !v24 && v26 >= 13)
      {
        v205 = PKLocalizedFeatureString();
        v219 = PKLocalizedFeatureString();
        v183 = v41;
        __n128 v29 = PKLocalizedFeatureString();
        uint64_t v34 = 0;
        goto LABEL_99;
      }
      if ((unint64_t)(v26 - 1) <= 0xB)
      {
        v205 = PKLocalizedFeatureString();
        PKLocalizedString(&cfstr_DashboardHours.isa, &cfstr_Ld.isa, v26);
        goto LABEL_98;
      }
      v205 = PKLocalizedFeatureString();
      unint64_t v35 = 0x1E4FB1000;
      if (v26 || v14 < 2)
      {
        uint64_t v182 = PKLocalizedFeatureString();
      }
      else
      {
        uint64_t v182 = PKLocalizedString(&cfstr_DashboardMinut.isa, &cfstr_Ld.isa, v14);
      }
      v219 = (void *)v182;
      uint64_t v34 = 0;
      __n128 v29 = 0;
LABEL_100:

      LODWORD(v31) = 0;
      id v9 = v40;
      goto LABEL_141;
    case 4uLL:
      if (v202)
      {
        id v46 = -[NSDateFormatter stringFromDate:](self->_monthDayFormatter, "stringFromDate:");
      }
      else
      {
        id v46 = 0;
      }
      unint64_t v35 = 0x1E4FB1000;
      if (![v210 showBillPaymentInterestSummary] || objc_msgSend(v208, "count")) {
        goto LABEL_67;
      }
      id v190 = v9;
      v135 = [v199 remainingMinimumPayment];
      long long v230 = 0u;
      long long v231 = 0u;
      long long v232 = 0u;
      long long v233 = 0u;
      id v136 = v207;
      uint64_t v137 = [v136 countByEnumeratingWithState:&v230 objects:v240 count:16];
      if (v137)
      {
        uint64_t v138 = v137;
        uint64_t v139 = *(void *)v231;
        do
        {
          uint64_t v140 = 0;
          v141 = v135;
          do
          {
            if (*(void *)v231 != v139) {
              objc_enumerationMutation(v136);
            }
            v142 = [*(id *)(*((void *)&v230 + 1) + 8 * v140) currencyAmount];
            v143 = [v142 amount];
            v135 = [v141 decimalNumberBySubtracting:v143];

            ++v140;
            v141 = v135;
          }
          while (v138 != v140);
          uint64_t v138 = [v136 countByEnumeratingWithState:&v230 objects:v240 count:16];
        }
        while (v138);
      }

      v144 = [v203 currencyCode];
      v145 = PKCurrencyAmountMake();
      v146 = [v145 formattedStringValue];

      v183 = v146;
      v184 = v46;
      uint64_t v147 = PKLocalizedFeatureString();

      id v9 = v190;
      unint64_t v35 = 0x1E4FB1000;
      uint64_t v95 = v147;
      if (!v147)
      {
LABEL_67:
        v183 = v46;
        uint64_t v95 = PKLocalizedFeatureString();
      }
      v205 = PKLocalizedFeatureString();

      int v33 = 0;
      LODWORD(v31) = 0;
      uint64_t v34 = 0;
      v219 = 0;
      __n128 v29 = (void *)v95;
      goto LABEL_141;
    case 5uLL:
      if ([v210 showBillPaymentInterestSummary])
      {
        id v47 = [v199 unpostedInterest];
        if (v47
          && ([MEMORY[0x1E4F28C28] zero],
              id v48 = objc_claimAutoreleasedReturnValue(),
              uint64_t v49 = [v47 compare:v48],
              v48,
              v49 == 1))
        {
          uint64_t v50 = PKLocalizedFeatureString();
          id v51 = v204;
        }
        else
        {
          id v187 = v9;
          v96 = [v199 remainingStatementBalance];
          long long v226 = 0u;
          long long v227 = 0u;
          long long v228 = 0u;
          long long v229 = 0u;
          id v97 = v207;
          uint64_t v98 = [v97 countByEnumeratingWithState:&v226 objects:v239 count:16];
          if (v98)
          {
            uint64_t v99 = v98;
            uint64_t v100 = *(void *)v227;
            do
            {
              uint64_t v101 = 0;
              v102 = v96;
              do
              {
                if (*(void *)v227 != v100) {
                  objc_enumerationMutation(v97);
                }
                v103 = [*(id *)(*((void *)&v226 + 1) + 8 * v101) currencyAmount];
                v104 = [v103 amount];
                v96 = [v102 decimalNumberBySubtracting:v104];

                ++v101;
                v102 = v96;
              }
              while (v99 != v101);
              uint64_t v99 = [v97 countByEnumeratingWithState:&v226 objects:v239 count:16];
            }
            while (v99);
          }

          v105 = [v203 currencyCode];
          v106 = PKCurrencyAmountMake();
          v107 = [v106 formattedStringValue];

          if (v202)
          {
            v108 = [(NSDateFormatter *)self->_monthDayFormatter stringFromDate:v202];
          }
          else
          {
            v108 = 0;
          }
          id v9 = v187;
          id v51 = v204;
          v183 = v107;
          v184 = v108;
          uint64_t v50 = PKLocalizedFeatureString();
        }
        v94 = PKLocalizedFeatureString();

        uint64_t v148 = v50;
        if (v50)
        {
LABEL_132:
          v205 = v94;
          uint64_t v150 = PKLocalizedFeatureString();

          uint64_t v30 = PKLocalizedFeatureString();
          v219 = 0;
          LODWORD(v31) = 0;
          int v32 = 0;
          v204 = (void *)v150;
          unint64_t v35 = 0x1E4FB1000;
          __n128 v29 = (void *)v148;
          goto LABEL_144;
        }
      }
      else
      {
        v94 = 0;
        id v51 = v204;
      }
      uint64_t v149 = PKLocalizedFeatureString();

      uint64_t v148 = PKLocalizedFeatureString();
      v94 = (void *)v149;
      goto LABEL_132;
    case 6uLL:
      v205 = PKLocalizedFeatureString();
      v219 = PKLocalizedFeatureString();
      unint64_t v35 = 0x1E4FB1000uLL;
      uint64_t v52 = [MEMORY[0x1E4FB1618] systemRedColor];

      int v33 = 0;
      LODWORD(v31) = 0;
      uint64_t v34 = 0;
      __n128 v29 = 0;
      v209 = (void *)v52;
      goto LABEL_141;
    case 7uLL:
      uint64_t v53 = PKLocalizedFeatureString();
      double v54 = [v10 mostRecentTransactions];
      double v55 = [v54 firstObject];
      double v56 = [v55 referenceIdentifier];
      double v57 = [v55 amount];
      v58 = objc_msgSend(v57, "pk_absoluteValue");

      v214 = v55;
      v205 = (void *)v53;
      if (!v56) {
        goto LABEL_50;
      }
      v220 = v58;
      id v186 = v9;
      double v59 = [v55 serviceIdentifier];
      long long v234 = 0u;
      long long v235 = 0u;
      long long v236 = 0u;
      long long v237 = 0u;
      v185 = v54;
      id v60 = v54;
      uint64_t v61 = [v60 countByEnumeratingWithState:&v234 objects:v241 count:16];
      if (!v61) {
        goto LABEL_49;
      }
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v235;
      id v216 = v60;
      do
      {
        for (uint64_t i = 0; i != v62; ++i)
        {
          if (*(void *)v235 != v63) {
            objc_enumerationMutation(v60);
          }
          id v65 = *(void **)(*((void *)&v234 + 1) + 8 * i);
          if ([v65 transactionType] == 10)
          {
            id v66 = [v65 referenceIdentifier];
            id v67 = v56;
            id v68 = v67;
            if (v66 == v67)
            {

              goto LABEL_32;
            }
            if (v66)
            {
              int v69 = [v66 isEqualToString:v67];

              if (!v69) {
                goto LABEL_46;
              }
LABEL_32:
              id v68 = [v65 serviceIdentifier];
              id v70 = v59;
              v71 = v70;
              if (v68 == v70)
              {
              }
              else
              {
                id v72 = v59;
                id v73 = v56;
                id v74 = v72;
                if (v72 && v68)
                {
                  char v75 = [v68 isEqualToString:v70];

                  if (v75)
                  {
                    double v56 = v73;
                    double v59 = v74;
                    id v60 = v216;
                    goto LABEL_45;
                  }
                }
                else
                {
                }
                if ([v214 transactionStatus] == 1)
                {

                  double v56 = v73;
                }
                else
                {
                  uint64_t v76 = [v214 transactionStatus];

                  double v56 = v73;
                  if (v76)
                  {
                    double v59 = v74;
                    id v60 = v216;
                    continue;
                  }
                }
                id v66 = [v65 amount];
                objc_msgSend(v66, "pk_absoluteValue");
                id v68 = (id)objc_claimAutoreleasedReturnValue();
                v71 = v220;
                v220 = [v220 decimalNumberByAdding:v68];
                double v59 = v74;
                id v60 = v216;
              }
            }
LABEL_45:

LABEL_46:
            continue;
          }
        }
        uint64_t v62 = [v60 countByEnumeratingWithState:&v234 objects:v241 count:16];
      }
      while (v62);
LABEL_49:

      double v54 = v185;
      id v9 = v186;
      v58 = v220;
LABEL_50:
      uint64_t v77 = [v203 currencyCode];
      v219 = PKFormattedCurrencyStringFromNumber();

      __n128 v29 = 0;
LABEL_51:
      uint64_t v30 = 0;
      int v32 = 0;
      LODWORD(v31) = 1;
LABEL_52:
      unint64_t v35 = 0x1E4FB1000uLL;
LABEL_144:
      int v154 = v32;
      uint64_t v155 = objc_msgSend(*(id *)(v35 + 1560), "tertiarySystemFillColor", v183, v184);

      uint64_t v156 = [*(id *)(v35 + 1560) labelColor];

      int v32 = v31;
      v212 = (void *)v155;
      v213 = (void *)v156;
LABEL_145:
      if (self->_isCompactUI) {
        v157 = (void **)MEMORY[0x1E4FB2990];
      }
      else {
        v157 = (void **)MEMORY[0x1E4FB2988];
      }
      v158 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], *v157, 0, 2, 0, *MEMORY[0x1E4FB09B8]);
      [v9 setDateLabelFont:v158];

      v159 = (void *)*MEMORY[0x1E4FB28F0];
      v160 = (void *)*MEMORY[0x1E4FB2950];
      if (self->_isCompactUI) {
        v161 = (void *)*MEMORY[0x1E4FB28F0];
      }
      else {
        v161 = (void *)*MEMORY[0x1E4FB2950];
      }
      v162 = PKFontForDefaultDesign(v161, 0, 0x8000, 0);
      [v9 setPaymentDueLabelFont:v162];

      [v9 setPaymentDueLabelTextColor:v209];
      if (self->_isCompactUI) {
        v163 = v159;
      }
      else {
        v163 = v160;
      }
      v164 = PKFontForDefaultDesign(v163, 0, 0x8000, 0);
      [v9 setDetailLabelFont:v164];

      v165 = [*(id *)(v35 + 1560) secondaryLabelColor];
      [v9 setDetailLabelTextColor:v165];

      [v9 setDateLabelText:v219];
      [v9 setDetailLabelText:v29];
      [v9 setPaymentDueLabelText:v205];
      if ((v32 & 1) != 0 || v154)
      {
        v170 = PKPassKitUIBundle();
        v171 = v170;
        if (v32)
        {
          v172 = [v170 URLForResource:@"Bill_Payment_Checkmark" withExtension:@"pdf"];

          double v173 = PKUIScreenScale();
          CGFloat v174 = 30.0;
          CGFloat v175 = 30.0;
        }
        else
        {
          v172 = [v170 URLForResource:@"Info" withExtension:@"pdf"];

          double v173 = PKUIScreenScale();
          CGFloat v174 = 16.0;
          CGFloat v175 = 29.0;
        }
        v176 = PKUIImageFromPDF(v172, v174, v175, v173);
        v169 = v191;
        v168 = v192;

        v177 = [v176 imageWithRenderingMode:2];

        [v9 setPayButtonImage:v177];
        v166 = v204;
        v167 = (void *)v30;
      }
      else
      {
        v166 = v204;
        [v9 setButtonTitle:v204];
        v167 = (void *)v30;
        [v9 setFallbackButtonTitle:v30];
        v169 = v191;
        v168 = v192;
      }
      v178 = objc_msgSend(v9, "payButton", v183);
      [v178 setUserInteractionEnabled:0];
      objc_msgSend(v9, "setUseAccessibilityLayout:", -[PKCreditBalanceAndPaymentPresenter _useAccessibilityLayoutForCollectionView:](self, "_useAccessibilityLayoutForCollectionView:", v169));
      [v9 setPayButtonTitleColor:v213];
      [v9 setPayButtonTintColor:v212];
      if (self->_isCompactUI) {
        uint64_t v179 = 0x8000;
      }
      else {
        uint64_t v179 = 2;
      }
      v180 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27B0], v179, 0);
      [v9 setPayButtonFont:v180];

      [v9 setWantsCustomAppearance:1];
      [v9 setWantsDefaultHighlightBehavior:1];
      [v9 setMaskType:3];
      v181 = +[PKDashboardCollectionViewCell defaultBackgroundColor];
      [v9 setBackgroundColor:v181];

      [v9 setItem:v168];
      [v9 setDelegate:self];

      return;
    case 8uLL:
      uint64_t v78 = PKLocalizedFeatureString();
      BOOL v79 = [v198 openingDate];
      uint64_t v80 = [v198 closingDate];
      id v81 = (void *)v80;
      v205 = (void *)v78;
      if (v79 && v80 && [v198 monthNumber] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v109 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
        uint64_t v82 = PKLocalizedFeatureString();
      }
      else
      {
        uint64_t v82 = PKLocalizedFeatureString();
      }
      uint64_t v110 = PKLocalizedFeatureString();

      uint64_t v217 = PKLocalizedFeatureString();
      long long v222 = 0u;
      long long v223 = 0u;
      long long v224 = 0u;
      long long v225 = 0u;
      id v111 = v208;
      uint64_t v31 = [v111 countByEnumeratingWithState:&v222 objects:v238 count:16];
      if (v31)
      {
        id v188 = v9;
        uint64_t v112 = *(void *)v223;
        __n128 v29 = (void *)v82;
        while (1)
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v223 != v112) {
              objc_enumerationMutation(v111);
            }
            v114 = [*(id *)(*((void *)&v222 + 1) + 8 * j) scheduleDetails];
            uint64_t v115 = [v114 preset];

            if (v115 == 3)
            {
              LODWORD(v31) = 1;
LABEL_89:
              id v9 = v188;
              goto LABEL_91;
            }
          }
          uint64_t v31 = [v111 countByEnumeratingWithState:&v222 objects:v238 count:16];
          if (!v31) {
            goto LABEL_89;
          }
        }
      }
      __n128 v29 = (void *)v82;
LABEL_91:

      int v33 = v31 ^ 1;
      v219 = 0;
      v204 = (void *)v110;
      unint64_t v35 = 0x1E4FB1000;
      uint64_t v34 = v217;
      goto LABEL_141;
    case 9uLL:
      id v83 = [v201 scheduleDetails];
      uint64_t v84 = [v83 scheduledDate];

      uint64_t v31 = [v200 components:28 fromDate:v84];
      v221 = [v200 dateFromComponents:v31];

      uint64_t v85 = [v18 components:28 fromDate:v194];
      BOOL v86 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      uint64_t v87 = [v86 secondsFromGMT];

      id v88 = [v200 timeZone];
      uint64_t v89 = [v88 secondsFromGMT];

      id v90 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      int v91 = [v21 isEqualToTimeZone:v90];

      uint64_t v92 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/New_York"];
      int v93 = [v195 isEqualToTimeZone:v92];

      if ((v91 & 1) == 0 && v93) {
        int v91 = v89 >= v87 && v89 - v87 < 21601;
      }
      id v189 = v9;
      v215 = (void *)v85;
      v218 = (void *)v31;
      v116 = [v200 components:28 fromDateComponents:v85 toDateComponents:v31 options:0];
      uint64_t v117 = [v116 year];
      uint64_t v118 = [v116 month];
      uint64_t v119 = [v116 day];
      v120 = [v201 scheduleDetails];
      uint64_t v121 = [v120 preset];

      v122 = [v201 currencyAmount];
      v123 = [v122 amount];

      uint64_t v206 = v121;
      LODWORD(v31) = v121 == 3;
      if (v121 == 3)
      {
        v124 = [v199 remainingStatementBalance];

        v125 = [MEMORY[0x1E4F28C28] zero];
        int v126 = PKEqualObjects();

        if (v126)
        {

          v123 = 0;
        }
        else
        {
          v123 = v124;
        }
      }
      v127 = [v203 currencyCode];
      v128 = PKFormattedCurrencyStringFromNumber();

      if (v117) {
        int v129 = 0;
      }
      else {
        int v129 = v91;
      }
      if (v118) {
        int v129 = 0;
      }
      if (v129 != 1 || v119)
      {
        if (v119 != 1) {
          int v129 = 0;
        }
        unint64_t v35 = 0x1E4FB1000;
        if (v129 != 1)
        {
          id v131 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          v132 = [v210 creditDetails];
          v133 = [v132 productTimeZone];
          [v131 setTimeZone:v133];

          [v131 setLocalizedDateFormatFromTemplate:@"MMM d"];
          v134 = [v131 stringFromDate:v221];
          if (v128)
          {
            v183 = v128;
            v184 = v134;
          }
          else
          {
            v183 = v134;
          }
          uint64_t v151 = PKLocalizedFeatureString();
          uint64_t v152 = v206;

LABEL_140:
          v205 = PKLocalizedFeatureString();
          int v33 = v152 != 3;
          uint64_t v153 = PKLocalizedFeatureString();

          uint64_t v34 = PKLocalizedFeatureString();

          v219 = 0;
          v204 = (void *)v153;
          id v9 = v189;
          __n128 v29 = (void *)v151;
LABEL_141:
          int v32 = 0;
          uint64_t v30 = v34;
          if ((v31 & 1) != 0 || v33) {
            goto LABEL_144;
          }
          int v154 = 0;
          goto LABEL_145;
        }
        if (v128) {
          goto LABEL_115;
        }
      }
      else
      {
        unint64_t v35 = 0x1E4FB1000;
        if (v128)
        {
LABEL_115:
          v183 = v128;
          uint64_t v130 = PKLocalizedFeatureString();
LABEL_137:
          uint64_t v151 = v130;
          uint64_t v152 = v206;
          goto LABEL_140;
        }
      }
      uint64_t v130 = PKLocalizedFeatureString();
      goto LABEL_137;
    default:
      int v33 = 0;
      LODWORD(v31) = 0;
      uint64_t v34 = 0;
      v219 = 0;
      __n128 v29 = 0;
      v205 = 0;
      unint64_t v35 = 0x1E4FB1000;
      goto LABEL_141;
  }
}

- (void)_configureAccountUserSpendingCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v57 = a3;
  id v8 = a4;
  id v52 = a5;
  double v55 = [v8 account];
  id v9 = [v8 familyCollection];
  id v10 = [v9 currentUserAltDSID];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    PKCurrentUserAltDSID();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v13 = v12;

  uint64_t v14 = [v8 accountUserCollection];
  uint64_t v15 = [v14 accountUserWithAltDSID:v13];

  id v16 = [v55 creditDetails];
  uint64_t v17 = [v16 accountSummary];
  v18 = [v17 accountUserActivityForAccountUserAltDSID:v13];
  uint64_t v53 = v16;
  uint64_t v19 = [v16 currencyCode];
  v20 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v21 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v22 = [v20 components:8 fromDate:v21];
  [v22 month];

  uint64_t v23 = v18;
  PKGregorianMonthSpecificLocalizedStringKeyForKey();
  uint64_t v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSComparisonResult v25 = PKLocalizedMadisonString(v24);
  [v57 setBalanceText:v25];

  uint64_t v49 = (NSString *)*MEMORY[0x1E4FB2950];
  uint64_t v50 = (NSString *)*MEMORY[0x1E4FB28F0];
  if (self->_isCompactUI) {
    uint64_t v26 = (void *)*MEMORY[0x1E4FB28F0];
  }
  else {
    uint64_t v26 = (void *)*MEMORY[0x1E4FB2950];
  }
  double v27 = PKFontForDefaultDesign(v26, 0, 0x8000, 0);
  [v57 setBalanceFont:v27];

  unint64_t v28 = [v18 totalSpending];
  __n128 v29 = 0;
  if (v28)
  {
    uint64_t v30 = (void *)v19;
    if (v19)
    {
      uint64_t v31 = PKCurrencyAmountMake();
      __n128 v29 = [v31 formattedStringValue];
    }
  }
  else
  {
    uint64_t v30 = (void *)v19;
  }
  if (self->_isCompactUI) {
    int v32 = (void **)MEMORY[0x1E4FB2990];
  }
  else {
    int v32 = (void **)MEMORY[0x1E4FB2988];
  }
  int v33 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], *v32, 0, 2, 0, *MEMORY[0x1E4FB09B8]);
  [v57 setAmountFont:v33];

  double v54 = v15;
  uint64_t v34 = [v15 preferences];
  id v51 = v17;
  if ([v34 monthlySpendLimitEnabled])
  {
    id v48 = v13;
    uint64_t v35 = [v34 monthlySpendLimitAmount];
    id v36 = (void *)v35;
    id v37 = 0;
    if (!v28 || !v35 || !v30) {
      goto LABEL_24;
    }
    id v47 = v29;
    uint64_t v38 = v23;
    uint64_t v39 = [v23 remainingMonthlySpendWithLimit:v35];
    id v40 = PKCurrencyAmountMake();
    [v55 feature];
    id v46 = [v40 formattedStringValue];
    id v37 = PKLocalizedFeatureString();

LABEL_23:
    uint64_t v23 = v38;
    __n128 v29 = v47;
LABEL_24:

    double v13 = v48;
    goto LABEL_26;
  }
  if ([v34 showAvailableCredit])
  {
    id v48 = v13;
    id v36 = [v17 availableCredit];
    id v37 = 0;
    if (!v36 || !v30) {
      goto LABEL_24;
    }
    id v47 = v29;
    uint64_t v38 = v23;
    uint64_t v39 = PKCurrencyAmountMake();
    [v55 feature];
    id v40 = [v39 formattedStringValue];
    id v46 = v40;
    id v37 = PKLocalizedFeatureString();
    goto LABEL_23;
  }
  id v37 = 0;
LABEL_26:
  objc_msgSend(v57, "setAmountText:", v29, v46);
  [v57 setCreditAvailableText:v37];
  if (self->_isCompactUI) {
    v41 = v50;
  }
  else {
    v41 = v49;
  }
  id v42 = PKFontForDefaultDesign(v41, 0);
  [v57 setCreditAvailableFont:v42];

  id v43 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v57 setCreditAvailableTextColor:v43];

  BOOL v44 = [(PKCreditBalanceAndPaymentPresenter *)self _useAccessibilityLayoutForCollectionView:v52];
  [v57 setUseAccessibilityLayout:v44];
  [v57 setWantsCustomAppearance:1];
  [v57 setWantsDefaultHighlightBehavior:1];
  [v57 setMaskType:3];
  uint64_t v45 = +[PKDashboardCollectionViewCell defaultBackgroundColor];
  [v57 setBackgroundColor:v45];

  [v57 setItem:v8];
}

- (void)_configureBalanceCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v47 = a3;
  id v45 = a5;
  id v43 = a4;
  id v9 = [v43 account];
  id v10 = [v9 creditDetails];
  id v11 = [v10 currencyCode];

  [v9 stateReason];
  int v12 = PKAccountStateReasonIsInMerge();
  char v13 = v12;
  if (v12)
  {
    uint64_t v14 = PKLocalizedMadisonString(&cfstr_AccountMerging_1.isa);
    uint64_t v15 = 2;
  }
  else
  {
    [v9 feature];
    uint64_t v14 = PKLocalizedFeatureString();
    uint64_t v15 = 1;
  }
  id v46 = (void *)v14;
  [v47 setBalanceText:v14];
  [v47 setBalanceLabelNumberOfLines:v15];
  id v16 = (NSString *)*MEMORY[0x1E4FB28F0];
  uint64_t v17 = (NSString *)*MEMORY[0x1E4FB2950];
  if (self->_isCompactUI) {
    v18 = (void *)*MEMORY[0x1E4FB28F0];
  }
  else {
    v18 = (void *)*MEMORY[0x1E4FB2950];
  }
  uint64_t v19 = PKFontForDefaultDesign(v18, 0, 0x8000, 0);
  [v47 setBalanceFont:v19];

  v20 = [v9 creditDetails];
  v21 = [v20 accountSummary];

  uint64_t v22 = 0;
  if ((v13 & 1) == 0)
  {
    uint64_t v23 = v11;
    uint64_t v24 = [v9 creditDetails];
    NSComparisonResult v25 = [v24 cardBalance];

    uint64_t v26 = [v25 amount];
    double v27 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v28 = [v26 compare:v27];

    if (v28 == -1)
    {
      __n128 v29 = [v25 negativeValue];

      uint64_t v30 = [v29 formattedStringValue];
      uint64_t v22 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v30);

      NSComparisonResult v25 = v29;
    }
    else
    {
      uint64_t v22 = [v25 formattedStringValue];
    }
    if (self->_isCompactUI) {
      uint64_t v31 = (void **)MEMORY[0x1E4FB2990];
    }
    else {
      uint64_t v31 = (void **)MEMORY[0x1E4FB2988];
    }
    int v32 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], *v31, 0, 2, 0, *MEMORY[0x1E4FB09B8]);
    [v47 setAmountFont:v32];

    id v11 = v23;
  }
  [v47 setAmountText:v22];
  int v33 = [v21 availableCredit];
  uint64_t v34 = v33;
  BOOL v44 = v11;
  if (v33)
  {
    uint64_t v35 = PKCurrencyAmountCreate(v33, v11);
    [v9 feature];
    id v42 = [v35 formattedStringValue];
    id v36 = PKLocalizedFeatureString();
  }
  else
  {
    id v36 = 0;
  }
  objc_msgSend(v47, "setCreditAvailableText:", v36, v42);
  if (self->_isCompactUI) {
    id v37 = v16;
  }
  else {
    id v37 = v17;
  }
  uint64_t v38 = PKFontForDefaultDesign(v37, 0);
  [v47 setCreditAvailableFont:v38];

  uint64_t v39 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v47 setCreditAvailableTextColor:v39];

  BOOL v40 = [(PKCreditBalanceAndPaymentPresenter *)self _useAccessibilityLayoutForCollectionView:v45];
  [v47 setUseAccessibilityLayout:v40];
  [v47 setWantsCustomAppearance:1];
  [v47 setWantsDefaultHighlightBehavior:1];
  [v47 setMaskType:3];
  v41 = +[PKDashboardCollectionViewCell defaultBackgroundColor];
  [v47 setBackgroundColor:v41];

  [v47 setItem:v43];
}

- (void)_configureActivityCell:(id)a3 forItem:(id)a4 sizing:(BOOL)a5 inCollectionView:(id)a6 forIndexPath:(id)a7
{
  id v33 = a3;
  id v11 = a4;
  id v12 = a6;
  char v13 = [v11 account];
  if ((unint64_t)PKBroadwaySummaryType() <= 2)
  {
    [v13 feature];
    uint64_t v14 = PKLocalizedFeatureString();
    [v33 setTitle:v14];
  }
  if (!a5)
  {
    uint64_t v15 = [v33 chartView];
    id v16 = [v11 summary];
    [v15 configureWithSummary:v16 presentationStyle:3];
  }
  uint64_t v17 = (void *)*MEMORY[0x1E4FB28F0];
  v18 = (void *)*MEMORY[0x1E4FB2950];
  if (self->_isCompactUI) {
    uint64_t v19 = (void *)*MEMORY[0x1E4FB28F0];
  }
  else {
    uint64_t v19 = (void *)*MEMORY[0x1E4FB2950];
  }
  v20 = PKFontForDefaultDesign(v19, 0, 0x8000, 0);
  [v33 setTitleFont:v20];

  v21 = [v11 summary];
  uint64_t v22 = [v21 rewards];
  uint64_t v23 = [v22 totalAmount];

  uint64_t v24 = [v23 formattedStringValue];
  NSComparisonResult v25 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v24);

  uint64_t v26 = PKLocalizedFeatureString();
  double v27 = [NSString stringWithFormat:@"%@ %@", v25, v26];
  [v33 setRewardsSummary:v27];

  if (self->_isCompactUI) {
    uint64_t v28 = v17;
  }
  else {
    uint64_t v28 = v18;
  }
  __n128 v29 = PKFontForDefaultDesign(v28, 0, 0x8000, 0);
  [v33 setRewardsSummaryFont:v29];

  uint64_t v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v33 setRewardsSummaryTextColor:v30];

  BOOL v31 = [(PKCreditBalanceAndPaymentPresenter *)self _useAccessibilityLayoutForCollectionView:v12];
  [v33 setUseAccessibilityLayout:v31];
  [v33 setWantsCustomAppearance:1];
  [v33 setWantsDefaultHighlightBehavior:1];
  [v33 setMaskType:3];
  int v32 = +[PKDashboardCollectionViewCell defaultBackgroundColor];
  [v33 setBackgroundColor:v32];

  [v33 setItem:v11];
}

- (BOOL)_useAccessibilityLayoutForCollectionView:(id)a3
{
  double v3 = [a3 traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  BOOL v5 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]) != NSOrderedAscending;

  return v5;
}

- (id)_accountServiceResoultionControllerWithItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 account];
  double v6 = [v4 transactionSourceCollection];
  id v7 = [(PKAccountServiceAccountResolutionController *)self->_resolutionController account];
  id v8 = [(PKAccountServiceAccountResolutionController *)self->_resolutionController transactionSourceCollection];
  if (self->_resolutionController)
  {
    id v9 = [v5 accountIdentifier];
    id v10 = [v7 accountIdentifier];
    if (PKEqualObjects())
    {
      char v11 = PKEqualObjects();

      if (v11) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v12 = [PKAccountServiceAccountResolutionController alloc];
  char v13 = [v4 account];
  uint64_t v14 = [v4 accountUserCollection];
  uint64_t v15 = [(PKAccountServiceAccountResolutionController *)v12 initWithAccount:v13 accountUserCollection:v14 transactionSourceCollection:v6];
  resolutionController = self->_resolutionController;
  self->_resolutionController = v15;

  [(PKAccountServiceAccountResolutionController *)self->_resolutionController setDelegate:self];
LABEL_7:
  uint64_t v17 = self->_resolutionController;

  return v17;
}

- (void)paymentButtonTappedForItem:(id)a3
{
  id v3 = [(PKCreditBalanceAndPaymentPresenter *)self _accountServiceResoultionControllerWithItem:a3];
  [v3 presentFlowForAccountResolution:1 configuration:0 completion:0];
}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = objc_msgSend(WeakRetained, "pkui_frontMostViewController");
    [v8 presentViewController:v9 animated:1 completion:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayFormatter, 0);
  objc_storeStrong((id *)&self->_paymentDateFormatter, 0);
  objc_storeStrong((id *)&self->_resolutionController, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_samplePaymentDueCell, 0);
  objc_storeStrong((id *)&self->_sampleActivityCell, 0);

  objc_storeStrong((id *)&self->_sampleBalanceCell, 0);
}

@end