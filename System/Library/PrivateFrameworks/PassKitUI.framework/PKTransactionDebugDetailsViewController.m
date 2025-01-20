@interface PKTransactionDebugDetailsViewController
- (NSDictionary)mapsMerchantDetails;
- (NSDictionary)merchantDetails;
- (NSDictionary)transactionDetails;
- (PKTransactionDebugDetailsViewController)initWithTransaction:(id)a3;
- (id)_cellWithPrimaryText:(id)a3 infoText:(id)a4;
- (id)_mapsBrandInfoCellForIndex:(int64_t)a3;
- (id)_mapsCell;
- (id)_mapsMerchantInfoCellForIndex:(int64_t)a3;
- (id)_merchantInfoCellForIndex:(int64_t)a3;
- (id)_stringForCreditDebitIndicator:(int64_t)a3;
- (id)_stringForTechnologyType:(int64_t)a3;
- (id)_stringForTransactionSource:(unint64_t)a3;
- (id)_stringForTransactionStatus:(int64_t)a3;
- (id)_stringForTransactionType:(int64_t)a3;
- (id)_transactionInfoCellForIndex:(int64_t)a3;
- (id)mapsBrandDetails;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didSelectMap;
- (void)setMapsMerchantDetails:(id)a3;
- (void)setMerchantDetails:(id)a3;
- (void)setTransactionDetails:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKTransactionDebugDetailsViewController

- (PKTransactionDebugDetailsViewController)initWithTransaction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionDebugDetailsViewController;
  v6 = [(PKTransactionDebugDetailsViewController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    v7->_inBridge = PKBridgeUsesDarkAppearance();
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionDebugDetailsViewController;
  [(PKTransactionDebugDetailsViewController *)&v4 viewDidLoad];
  v3 = [(PKTransactionDebugDetailsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionTitleValueLabelCellReuseIdentifier"];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0:
      v7 = [(PKTransactionDebugDetailsViewController *)self transactionDetails];
      goto LABEL_7;
    case 1:
      v7 = [(PKTransactionDebugDetailsViewController *)self merchantDetails];
      goto LABEL_7;
    case 2:
      objc_super v9 = [(PKTransactionDebugDetailsViewController *)self mapsMerchantDetails];
      int64_t v8 = [v9 count] + 1;
      goto LABEL_8;
    case 3:
      v7 = [(PKTransactionDebugDetailsViewController *)self mapsBrandDetails];
LABEL_7:
      objc_super v9 = v7;
      int64_t v8 = [v7 count];
LABEL_8:

      break;
    default:
      int64_t v8 = 0;
      break;
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 3) {
    return 0;
  }
  else {
    return off_1E59E0A00[a4];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    if ([v5 section] == 1)
    {
      uint64_t v6 = -[PKTransactionDebugDetailsViewController _merchantInfoCellForIndex:](self, "_merchantInfoCellForIndex:", [v5 row]);
    }
    else
    {
      uint64_t v7 = [v5 section];
      uint64_t v8 = [v5 row];
      if (v7 == 2) {
        [(PKTransactionDebugDetailsViewController *)self _mapsMerchantInfoCellForIndex:v8];
      }
      else {
      uint64_t v6 = [(PKTransactionDebugDetailsViewController *)self _mapsBrandInfoCellForIndex:v8];
      }
    }
  }
  else
  {
    uint64_t v6 = -[PKTransactionDebugDetailsViewController _transactionInfoCellForIndex:](self, "_transactionInfoCellForIndex:", [v5 row]);
  }
  objc_super v9 = (void *)v6;

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  if ([v6 section] != 2
    || [v6 row]
    || ([(PKPaymentTransaction *)self->_transaction merchant],
        v23 = objc_claimAutoreleasedReturnValue(),
        [v23 mapsMerchant],
        v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        v23,
        !v24))
  {
    if ([v6 section] == 2)
    {
      uint64_t v7 = [v25 cellForRowAtIndexPath:v6];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v8 = [v7 keyLabel];
      objc_super v9 = [v8 text];

      v10 = v9;
      v11 = v10;
      if (v10 != @"stylingInfo")
      {
        if (!v10
          || (int v12 = [(__CFString *)v10 isEqualToString:@"stylingInfo"],
              v11,
              !v12))
        {
LABEL_18:

          goto LABEL_19;
        }
      }
      v13 = [(PKPaymentTransaction *)self->_transaction merchant];
      v14 = [v13 mapsMerchant];
    }
    else
    {
      if ([v6 section] != 3) {
        goto LABEL_20;
      }
      uint64_t v7 = [v25 cellForRowAtIndexPath:v6];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_19;
      }
      v15 = [v7 keyLabel];
      v16 = [v15 text];

      v17 = v16;
      v11 = v17;
      if (v17 != @"stylingInfo")
      {
        if (!v17) {
          goto LABEL_18;
        }
        int v18 = [(__CFString *)v17 isEqualToString:@"stylingInfo"];

        if (!v18) {
          goto LABEL_18;
        }
      }
      v13 = [(PKPaymentTransaction *)self->_transaction merchant];
      v14 = [v13 mapsBrand];
    }
    v19 = v14;
    v20 = [v14 stylingInfo];

    if (v20)
    {
      v21 = [[PKMapsMerchantStylingInfoViewController alloc] initWithStylingInfo:v20];
      v22 = [(PKTransactionDebugDetailsViewController *)self navigationController];
      [v22 pushViewController:v21 animated:1];
    }
    goto LABEL_18;
  }
  [(PKTransactionDebugDetailsViewController *)self _didSelectMap];
LABEL_20:
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v5 = objc_msgSend(a3, "cellForRowAtIndexPath:", a4, a5.x, a5.y);
  id v6 = v5;
  if (!v5 || [v5 accessoryType] == 1) {
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 keyLabel];
    uint64_t v8 = [v7 text];

    [v6 valueLabel];
  }
  else
  {
    objc_super v9 = [v6 textLabel];
    uint64_t v8 = [v9 text];

    [v6 detailTextLabel];
  v10 = };
  v11 = [v10 text];

  if (![v8 length])
  {

    uint64_t v8 = 0;
  }
  if ([v11 length])
  {
    BOOL v12 = v8 != 0;
    if (v8 && v11)
    {
      id v13 = [NSString stringWithFormat:@"%@ : %@", v8, v11];
      goto LABEL_17;
    }
  }
  else
  {

    v11 = 0;
    BOOL v12 = v8 != 0;
  }
  if (v12) {
    v14 = v8;
  }
  else {
    v14 = v11;
  }
  id v13 = v14;
LABEL_17:
  v15 = v13;

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E4FB1678];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __101__PKTransactionDebugDetailsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v20[3] = &unk_1E59D5228;
    id v21 = v15;
    id v17 = v15;
    int v18 = [v16 configurationWithIdentifier:0 previewProvider:0 actionProvider:v20];

    goto LABEL_20;
  }
LABEL_19:
  int v18 = 0;
LABEL_20:

  return v18;
}

id __101__PKTransactionDebugDetailsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB13F0];
  v3 = PKLocalizedString(&cfstr_MenuActionCopy.isa);
  objc_super v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__PKTransactionDebugDetailsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v10[3] = &unk_1E59D5200;
  id v11 = *(id *)(a1 + 32);
  id v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:v10];

  id v6 = (void *)MEMORY[0x1E4FB1970];
  v12[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v8 = [v6 menuWithTitle:&stru_1EF1B5B50 children:v7];

  return v8;
}

void __101__PKTransactionDebugDetailsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

- (id)_stringForTransactionStatus:(int64_t)a3
{
  v3 = PKPaymentTransactionStatusToString();
  objc_super v4 = [v3 capitalizedString];

  return v4;
}

- (id)_stringForTransactionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x15) {
    return @"Purchase";
  }
  else {
    return off_1E59E0A20[a3 - 1];
  }
}

- (id)_stringForTechnologyType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return &stru_1EF1B5B50;
  }
  else {
    return off_1E59E0AD0[a3];
  }
}

- (id)_stringForTransactionSource:(unint64_t)a3
{
  if (a3 > 8) {
    return &stru_1EF1B5B50;
  }
  else {
    return off_1E59E0AE8[a3];
  }
}

- (id)_stringForCreditDebitIndicator:(int64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 1) {
    v3 = @"Credit";
  }
  if (a3 == 2) {
    return @"Debit";
  }
  else {
    return v3;
  }
}

- (NSDictionary)transactionDetails
{
  v152[48] = *MEMORY[0x1E4F143B8];
  v151[0] = @"identifier";
  uint64_t v3 = [(PKPaymentTransaction *)self->_transaction identifier];
  v150 = (void *)v3;
  if (v3) {
    objc_super v4 = (__CFString *)v3;
  }
  else {
    objc_super v4 = @"nil";
  }
  v152[0] = v4;
  v151[1] = @"amount";
  v149 = [(PKPaymentTransaction *)self->_transaction amount];
  uint64_t v5 = [v149 stringValue];
  v148 = (void *)v5;
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = @"nil";
  }
  v152[1] = v6;
  v151[2] = @"currencyCode";
  uint64_t v7 = [(PKPaymentTransaction *)self->_transaction currencyCode];
  v147 = (void *)v7;
  if (v7) {
    uint64_t v8 = (__CFString *)v7;
  }
  else {
    uint64_t v8 = @"nil";
  }
  v152[2] = v8;
  v151[3] = @"transactionDate";
  v146 = [(PKPaymentTransaction *)self->_transaction transactionDate];
  uint64_t v9 = [v146 description];
  v145 = (void *)v9;
  if (v9) {
    v10 = (__CFString *)v9;
  }
  else {
    v10 = @"nil";
  }
  v152[3] = v10;
  v151[4] = @"accountType";
  [(PKPaymentTransaction *)self->_transaction accountType];
  uint64_t v11 = PKPaymentTransactionAccountTypeToString();
  v144 = (void *)v11;
  if (v11) {
    BOOL v12 = (__CFString *)v11;
  }
  else {
    BOOL v12 = @"nil";
  }
  v152[4] = v12;
  v151[5] = @"displayLocation";
  uint64_t v13 = [(PKPaymentTransaction *)self->_transaction displayLocation];
  v143 = (void *)v13;
  if (v13) {
    v14 = (__CFString *)v13;
  }
  else {
    v14 = @"nil";
  }
  v152[5] = v14;
  v151[6] = @"serviceIdentifier";
  uint64_t v15 = [(PKPaymentTransaction *)self->_transaction serviceIdentifier];
  v142 = (void *)v15;
  if (v15) {
    v16 = (__CFString *)v15;
  }
  else {
    v16 = @"nil";
  }
  v152[6] = v16;
  v151[7] = @"paymentHash";
  uint64_t v17 = [(PKPaymentTransaction *)self->_transaction paymentHash];
  v141 = (void *)v17;
  if (v17) {
    int v18 = (__CFString *)v17;
  }
  else {
    int v18 = @"nil";
  }
  v152[7] = v18;
  v151[8] = @"locality";
  uint64_t v19 = [(PKPaymentTransaction *)self->_transaction locality];
  v140 = (void *)v19;
  if (v19) {
    v20 = (__CFString *)v19;
  }
  else {
    v20 = @"nil";
  }
  v152[8] = v20;
  v151[9] = @"administrativeArea";
  uint64_t v21 = [(PKPaymentTransaction *)self->_transaction administrativeArea];
  v139 = (void *)v21;
  if (v21) {
    v22 = (__CFString *)v21;
  }
  else {
    v22 = @"nil";
  }
  v152[9] = v22;
  v151[10] = @"location";
  v138 = [(PKPaymentTransaction *)self->_transaction location];
  uint64_t v23 = [v138 description];
  v137 = (void *)v23;
  if (v23) {
    v24 = (__CFString *)v23;
  }
  else {
    v24 = @"nil";
  }
  v152[10] = v24;
  v151[11] = @"locationDate";
  v136 = [(PKPaymentTransaction *)self->_transaction locationDate];
  uint64_t v25 = [v136 description];
  v135 = (void *)v25;
  if (v25) {
    v26 = (__CFString *)v25;
  }
  else {
    v26 = @"nil";
  }
  v152[11] = v26;
  v151[12] = @"timeZone";
  v134 = [(PKPaymentTransaction *)self->_transaction timeZone];
  uint64_t v27 = [v134 name];
  v133 = (void *)v27;
  if (v27) {
    v28 = (__CFString *)v27;
  }
  else {
    v28 = @"nil";
  }
  v152[12] = v28;
  v151[13] = @"statusChangeDate";
  v132 = [(PKPaymentTransaction *)self->_transaction transactionStatusChangedDate];
  uint64_t v29 = [v132 description];
  v131 = (void *)v29;
  if (v29) {
    v30 = (__CFString *)v29;
  }
  else {
    v30 = @"nil";
  }
  v152[13] = v30;
  v151[14] = @"locationLat/Long";
  v31 = NSString;
  [(PKPaymentTransaction *)self->_transaction locationLatitude];
  uint64_t v33 = (uint64_t)v32;
  [(PKPaymentTransaction *)self->_transaction locationLongitude];
  v130 = [v31 stringWithFormat:@"%ld, %ld", v33, (uint64_t)v34];
  v152[14] = v130;
  v151[15] = @"horizontalAccuracy";
  v35 = NSString;
  v129 = [(PKPaymentTransaction *)self->_transaction location];
  [v129 horizontalAccuracy];
  v128 = objc_msgSend(v35, "stringWithFormat:", @"%1.f", v36);
  v152[15] = v128;
  v151[16] = @"verticalAccuracy";
  v37 = NSString;
  v127 = [(PKPaymentTransaction *)self->_transaction location];
  [v127 verticalAccuracy];
  v126 = objc_msgSend(v37, "stringWithFormat:", @"%1.f", v38);
  v152[16] = v126;
  v151[17] = @"transactionStatus";
  v125 = [(PKTransactionDebugDetailsViewController *)self _stringForTransactionStatus:[(PKPaymentTransaction *)self->_transaction transactionStatus]];
  v152[17] = v125;
  v151[18] = @"transactionType";
  v124 = [(PKTransactionDebugDetailsViewController *)self _stringForTransactionType:[(PKPaymentTransaction *)self->_transaction transactionType]];
  v152[18] = v124;
  v151[19] = @"transactionTechnologyType";
  v123 = [(PKTransactionDebugDetailsViewController *)self _stringForTechnologyType:[(PKPaymentTransaction *)self->_transaction technologyType]];
  v152[19] = v123;
  v151[20] = @"transactionSource";
  v122 = [(PKTransactionDebugDetailsViewController *)self _stringForTransactionSource:[(PKPaymentTransaction *)self->_transaction transactionSource]];
  v152[20] = v122;
  v151[21] = @"hasNotificationServiceSource";
  if ([(PKPaymentTransaction *)self->_transaction hasNotificationServiceData])v39 = @"YES"; {
  else
  }
    v39 = @"NO";
  v152[21] = v39;
  v151[22] = @"hasAssociatedPaymentApplication";
  if ([(PKPaymentTransaction *)self->_transaction hasAssociatedPaymentApplication])v40 = @"YES"; {
  else
  }
    v40 = @"NO";
  v152[22] = v40;
  v151[23] = @"cardType";
  v121 = [(PKTransactionDebugDetailsViewController *)self _stringForTransactionSource:[(PKPaymentTransaction *)self->_transaction cardType]];
  v152[23] = v121;
  v151[24] = @"accountIdentifier";
  uint64_t v41 = [(PKPaymentTransaction *)self->_transaction accountIdentifier];
  v120 = (void *)v41;
  if (v41) {
    v42 = (__CFString *)v41;
  }
  else {
    v42 = @"nil";
  }
  v152[24] = v42;
  v151[25] = @"rewardsTotal";
  v119 = [(PKPaymentTransaction *)self->_transaction rewardsTotalAmount];
  uint64_t v43 = [v119 stringValue];
  v118 = (void *)v43;
  if (v43) {
    v44 = (__CFString *)v43;
  }
  else {
    v44 = @"nil";
  }
  v152[25] = v44;
  v151[26] = @"rewardsCurrency";
  uint64_t v45 = [(PKPaymentTransaction *)self->_transaction rewardsTotalCurrencyCode];
  v117 = (void *)v45;
  if (v45) {
    v46 = (__CFString *)v45;
  }
  else {
    v46 = @"nil";
  }
  v152[26] = v46;
  v151[27] = @"rewardsEligibility";
  [(PKPaymentTransaction *)self->_transaction rewardsEligibilityReason];
  uint64_t v47 = PKPaymentTransactionRewardsEligibilityReasonToString();
  v116 = (void *)v47;
  if (v47) {
    v48 = (__CFString *)v47;
  }
  else {
    v48 = @"nil";
  }
  v152[27] = v48;
  v151[28] = @"lifecycleIdentifier";
  uint64_t v49 = [(PKPaymentTransaction *)self->_transaction lifecycleIdentifier];
  v115 = (void *)v49;
  if (v49) {
    v50 = (__CFString *)v49;
  }
  else {
    v50 = @"nil";
  }
  v152[28] = v50;
  v151[29] = @"authNetworkData";
  uint64_t v51 = [(PKPaymentTransaction *)self->_transaction authNetworkData];
  v114 = (void *)v51;
  if (v51) {
    v52 = (__CFString *)v51;
  }
  else {
    v52 = @"nil";
  }
  v152[29] = v52;
  v151[30] = @"clearingNetworkData";
  uint64_t v53 = [(PKPaymentTransaction *)self->_transaction clearingNetworkData];
  v113 = (void *)v53;
  if (v53) {
    v54 = (__CFString *)v53;
  }
  else {
    v54 = @"nil";
  }
  v152[30] = v54;
  v151[31] = @"cardIdentifier";
  uint64_t v55 = [(PKPaymentTransaction *)self->_transaction cardIdentifier];
  v112 = (void *)v55;
  if (v55) {
    v56 = (__CFString *)v55;
  }
  else {
    v56 = @"nil";
  }
  v152[31] = v56;
  v151[32] = @"referenceIdentifier";
  uint64_t v57 = [(PKPaymentTransaction *)self->_transaction referenceIdentifier];
  v111 = (void *)v57;
  if (v57) {
    v58 = (__CFString *)v57;
  }
  else {
    v58 = @"nil";
  }
  v152[32] = v58;
  v151[33] = @"originatedByDevice";
  if ([(PKPaymentTransaction *)self->_transaction originatedByDevice]) {
    v59 = @"YES";
  }
  else {
    v59 = @"NO";
  }
  v152[33] = v59;
  v151[34] = @"requiresMerchantReprocessing";
  if ([(PKPaymentTransaction *)self->_transaction requiresMerchantReprocessing])v60 = @"YES"; {
  else
  }
    v60 = @"NO";
  v152[34] = v60;
  v151[35] = @"lastMerchantReprocessingDate";
  v110 = [(PKPaymentTransaction *)self->_transaction lastMerchantReprocessingDate];
  uint64_t v61 = [v110 description];
  v109 = (void *)v61;
  if (v61) {
    v62 = (__CFString *)v61;
  }
  else {
    v62 = @"nil";
  }
  v152[35] = v62;
  v151[36] = @"releasedDataElements";
  v63 = NSNumber;
  v108 = [(PKPaymentTransaction *)self->_transaction releasedData];
  v107 = [v108 elements];
  v106 = objc_msgSend(v63, "numberWithUnsignedInteger:", objc_msgSend(v107, "count"));
  v105 = [v106 stringValue];
  v152[36] = v105;
  v151[37] = @"isBankConnectTransaction";
  if ([(PKPaymentTransaction *)self->_transaction isBankConnectTransaction]) {
    v64 = @"YES";
  }
  else {
    v64 = @"NO";
  }
  v152[37] = v64;
  v151[38] = @"bankConnectCreditDebitIndicator";
  v104 = [(PKTransactionDebugDetailsViewController *)self _stringForCreditDebitIndicator:[(PKPaymentTransaction *)self->_transaction bankConnectCreditDebitIndicator]];
  v152[38] = v104;
  v151[39] = @"bankConnectDigitalServicingURL";
  v103 = [(PKPaymentTransaction *)self->_transaction bankConnectDigitalServicingURL];
  uint64_t v65 = [v103 absoluteString];
  v102 = (void *)v65;
  if (v65) {
    v66 = (__CFString *)v65;
  }
  else {
    v66 = @"nil";
  }
  v152[39] = v66;
  v151[40] = @"bankConnectPayNowURL";
  v101 = [(PKPaymentTransaction *)self->_transaction bankConnectPayNowURL];
  uint64_t v67 = [v101 absoluteString];
  v100 = (void *)v67;
  if (v67) {
    v68 = (__CFString *)v67;
  }
  else {
    v68 = @"nil";
  }
  v152[40] = v68;
  v151[41] = @"bankConnectTransferFundsURL";
  v99 = [(PKPaymentTransaction *)self->_transaction bankConnectTransferFundsURL];
  uint64_t v69 = [v99 absoluteString];
  v98 = (void *)v69;
  if (v69) {
    v70 = (__CFString *)v69;
  }
  else {
    v70 = @"nil";
  }
  v152[41] = v70;
  v151[42] = @"bankConnectPostInstallmentURL";
  v97 = [(PKPaymentTransaction *)self->_transaction bankConnectPostInstallmentURL];
  uint64_t v71 = [v97 absoluteString];
  v96 = (void *)v71;
  if (v71) {
    v72 = (__CFString *)v71;
  }
  else {
    v72 = @"nil";
  }
  v152[42] = v72;
  v151[43] = @"bankConnectRedeemRewardsURL";
  v95 = [(PKPaymentTransaction *)self->_transaction bankConnectRedeemRewardsURL];
  uint64_t v73 = [v95 absoluteString];
  v74 = (void *)v73;
  if (v73) {
    v75 = (__CFString *)v73;
  }
  else {
    v75 = @"nil";
  }
  v152[43] = v75;
  v151[44] = @"transactionSourceIdentifier";
  uint64_t v76 = [(PKPaymentTransaction *)self->_transaction transactionSourceIdentifier];
  v77 = (void *)v76;
  if (v76) {
    v78 = (__CFString *)v76;
  }
  else {
    v78 = @"nil";
  }
  v152[44] = v78;
  v151[45] = @"rewards";
  v94 = [(PKPaymentTransaction *)self->_transaction rewards];
  uint64_t v79 = [v94 description];
  v80 = (void *)v79;
  if (v79) {
    v81 = (__CFString *)v79;
  }
  else {
    v81 = @"nil";
  }
  v152[45] = v81;
  v151[46] = @"paymentIdentifier";
  v82 = [(PKPaymentTransaction *)self->_transaction payments];
  v83 = [v82 firstObject];
  uint64_t v84 = [v83 identifier];
  v85 = (void *)v84;
  if (v84) {
    v86 = (__CFString *)v84;
  }
  else {
    v86 = @"nil";
  }
  v152[46] = v86;
  v151[47] = @"paymentReferenceIdentifier";
  v87 = [(PKPaymentTransaction *)self->_transaction payments];
  v88 = [v87 firstObject];
  uint64_t v89 = [v88 referenceIdentifier];
  v90 = (void *)v89;
  if (v89) {
    v91 = (__CFString *)v89;
  }
  else {
    v91 = @"nil";
  }
  v152[47] = v91;
  id v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v151 count:48];

  return (NSDictionary *)v93;
}

- (NSDictionary)merchantDetails
{
  v51[16] = *MEMORY[0x1E4F143B8];
  id v2 = [(PKPaymentTransaction *)self->_transaction merchant];
  v50[0] = @"industryCode";
  uint64_t v49 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v2, "industryCode"));
  v51[0] = v49;
  v50[1] = @"industryCategory";
  uint64_t v3 = [v2 industryCategory];
  v48 = (void *)v3;
  if (v3) {
    objc_super v4 = (__CFString *)v3;
  }
  else {
    objc_super v4 = @"nil";
  }
  v51[1] = v4;
  v50[2] = @"name";
  uint64_t v5 = [v2 name];
  uint64_t v47 = (void *)v5;
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = @"nil";
  }
  v51[2] = v6;
  v50[3] = @"rawName";
  uint64_t v7 = [v2 rawName];
  v46 = (void *)v7;
  if (v7) {
    uint64_t v8 = (__CFString *)v7;
  }
  else {
    uint64_t v8 = @"nil";
  }
  v51[3] = v8;
  v50[4] = @"rawCANL";
  uint64_t v9 = [v2 rawCANL];
  uint64_t v45 = (void *)v9;
  if (v9) {
    v10 = (__CFString *)v9;
  }
  else {
    v10 = @"nil";
  }
  v51[4] = v10;
  v50[5] = @"rawCity";
  uint64_t v11 = [v2 rawCity];
  v44 = (void *)v11;
  if (v11) {
    BOOL v12 = (__CFString *)v11;
  }
  else {
    BOOL v12 = @"nil";
  }
  v51[5] = v12;
  v50[6] = @"rawState";
  uint64_t v13 = [v2 rawState];
  uint64_t v43 = (void *)v13;
  if (v13) {
    v14 = (__CFString *)v13;
  }
  else {
    v14 = @"nil";
  }
  v51[6] = v14;
  v50[7] = @"rawCountry";
  uint64_t v15 = [v2 rawCountry];
  v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (__CFString *)v15;
  }
  else {
    uint64_t v17 = @"nil";
  }
  v51[7] = v17;
  v50[8] = @"city";
  uint64_t v18 = [v2 city];
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  else {
    v20 = @"nil";
  }
  v51[8] = v20;
  v50[9] = @"state";
  uint64_t v21 = [v2 state];
  v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = (__CFString *)v21;
  }
  else {
    uint64_t v23 = @"nil";
  }
  v51[9] = v23;
  v50[10] = @"zip";
  uint64_t v24 = [v2 zip];
  uint64_t v25 = (void *)v24;
  if (v24) {
    v26 = (__CFString *)v24;
  }
  else {
    v26 = @"nil";
  }
  v51[10] = v26;
  v50[11] = @"displayName";
  uint64_t v27 = [v2 displayName];
  v28 = (void *)v27;
  if (v27) {
    uint64_t v29 = (__CFString *)v27;
  }
  else {
    uint64_t v29 = @"nil";
  }
  v51[11] = v29;
  v50[12] = @"merchantIdentifier";
  uint64_t v30 = [v2 merchantIdentifier];
  v31 = (void *)v30;
  if (v30) {
    double v32 = (__CFString *)v30;
  }
  else {
    double v32 = @"nil";
  }
  v51[12] = v32;
  v50[13] = @"fallbackCategory";
  [v2 fallbackcategory];
  uint64_t v33 = PKMerchantCategoryToString();
  double v34 = (void *)v33;
  if (v33) {
    v35 = (__CFString *)v33;
  }
  else {
    v35 = @"nil";
  }
  v51[13] = v35;
  v50[14] = @"fallbackDetailedCategory";
  uint64_t v36 = [v2 fallbackDetailedCategory];
  v37 = (void *)v36;
  if (v36) {
    uint64_t v38 = (__CFString *)v36;
  }
  else {
    uint64_t v38 = @"nil";
  }
  v51[14] = v38;
  v50[15] = @"localMatch";
  int v39 = [v2 mapsDataIsFromLocalMatch];
  v40 = @"NO";
  if (v39) {
    v40 = @"YES";
  }
  v51[15] = v40;
  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:16];

  return (NSDictionary *)v41;
}

- (NSDictionary)mapsMerchantDetails
{
  v43[11] = *MEMORY[0x1E4F143B8];
  id v2 = [(PKPaymentTransaction *)self->_transaction merchant];
  uint64_t v3 = [v2 mapsMerchant];

  v42[0] = @"identifier";
  uint64_t v41 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "identifier"));
  v40 = [v41 stringValue];
  v43[0] = v40;
  v42[1] = @"resultProviderIdentifier";
  int v39 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "resultProviderIdentifier"));
  uint64_t v38 = [v39 stringValue];
  v43[1] = v38;
  v42[2] = @"name";
  uint64_t v4 = [v3 name];
  v37 = (void *)v4;
  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = @"nil";
  }
  v43[2] = v5;
  v42[3] = @"phoneNumber";
  uint64_t v6 = [v3 phoneNumber];
  uint64_t v36 = (void *)v6;
  if (v6) {
    uint64_t v7 = (__CFString *)v6;
  }
  else {
    uint64_t v7 = @"nil";
  }
  v43[3] = v7;
  v42[4] = @"url";
  v35 = [v3 url];
  uint64_t v8 = [v35 absoluteString];
  double v34 = (void *)v8;
  if (v8) {
    uint64_t v9 = (__CFString *)v8;
  }
  else {
    uint64_t v9 = @"nil";
  }
  v43[4] = v9;
  v42[5] = @"location";
  uint64_t v33 = [v3 location];
  uint64_t v10 = [v33 description];
  uint64_t v11 = (void *)v10;
  if (v10) {
    BOOL v12 = (__CFString *)v10;
  }
  else {
    BOOL v12 = @"nil";
  }
  v43[5] = v12;
  v42[6] = @"postalAddress";
  double v32 = [v3 postalAddress];
  uint64_t v13 = [v32 description];
  v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = @"nil";
  }
  v43[6] = v15;
  v42[7] = @"category";
  [v3 category];
  uint64_t v16 = PKMerchantCategoryToString();
  uint64_t v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = (__CFString *)v16;
  }
  else {
    uint64_t v18 = @"nil";
  }
  v43[7] = v18;
  v42[8] = @"detailedCategory";
  uint64_t v19 = [v3 detailedCategory];
  v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (__CFString *)v19;
  }
  else {
    uint64_t v21 = @"nil";
  }
  v43[8] = v21;
  v42[9] = @"heroImageURL";
  v22 = [v3 heroImageURL];
  uint64_t v23 = [v22 absoluteString];
  uint64_t v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  else {
    uint64_t v25 = @"nil";
  }
  v43[9] = v25;
  v42[10] = @"stylingInfo";
  v26 = [v3 stylingInfo];
  uint64_t v27 = [v26 description];
  v28 = (void *)v27;
  if (v27) {
    uint64_t v29 = (__CFString *)v27;
  }
  else {
    uint64_t v29 = @"nil";
  }
  v43[10] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:11];

  return (NSDictionary *)v30;
}

- (id)mapsBrandDetails
{
  v35[9] = *MEMORY[0x1E4F143B8];
  id v2 = [(PKPaymentTransaction *)self->_transaction merchant];
  uint64_t v3 = [v2 mapsBrand];

  v34[0] = @"identifier";
  uint64_t v33 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "identifier"));
  double v32 = [v33 stringValue];
  v35[0] = v32;
  v34[1] = @"resultProviderIdentifier";
  v31 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "resultProviderIdentifier"));
  uint64_t v30 = [v31 stringValue];
  v35[1] = v30;
  v34[2] = @"name";
  uint64_t v4 = [v3 name];
  uint64_t v29 = (void *)v4;
  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = @"nil";
  }
  v35[2] = v5;
  v34[3] = @"phoneNumber";
  uint64_t v6 = [v3 phoneNumber];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = @"nil";
  }
  v35[3] = v8;
  v34[4] = @"url";
  v28 = [v3 url];
  uint64_t v9 = [v28 absoluteString];
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = @"nil";
  }
  v35[4] = v11;
  v34[5] = @"logoURL";
  BOOL v12 = [v3 logoURL];
  uint64_t v13 = [v12 absoluteString];
  v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = @"nil";
  }
  v35[5] = v15;
  v34[6] = @"category";
  [v3 category];
  uint64_t v16 = PKMerchantCategoryToString();
  uint64_t v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = (__CFString *)v16;
  }
  else {
    uint64_t v18 = @"nil";
  }
  v35[6] = v18;
  v34[7] = @"detailedCategory";
  uint64_t v19 = [v3 detailedCategory];
  v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (__CFString *)v19;
  }
  else {
    uint64_t v21 = @"nil";
  }
  v35[7] = v21;
  v34[8] = @"stylingInfo";
  v22 = [v3 stylingInfo];
  uint64_t v23 = [v22 description];
  uint64_t v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  else {
    uint64_t v25 = @"nil";
  }
  v35[8] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:9];

  return v26;
}

- (id)_transactionInfoCellForIndex:(int64_t)a3
{
  uint64_t v5 = [(PKTransactionDebugDetailsViewController *)self transactionDetails];
  uint64_t v6 = [v5 allKeys];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  uint64_t v8 = [(PKTransactionDebugDetailsViewController *)self transactionDetails];
  uint64_t v9 = [v8 allValues];
  uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
  uint64_t v11 = [(PKTransactionDebugDetailsViewController *)self _cellWithPrimaryText:v7 infoText:v10];

  return v11;
}

- (id)_merchantInfoCellForIndex:(int64_t)a3
{
  uint64_t v5 = [(PKTransactionDebugDetailsViewController *)self merchantDetails];
  uint64_t v6 = [v5 allKeys];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  uint64_t v8 = [(PKTransactionDebugDetailsViewController *)self merchantDetails];
  uint64_t v9 = [v8 allValues];
  uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
  uint64_t v11 = [(PKTransactionDebugDetailsViewController *)self _cellWithPrimaryText:v7 infoText:v10];

  return v11;
}

- (id)_mapsMerchantInfoCellForIndex:(int64_t)a3
{
  if (a3)
  {
    int64_t v4 = a3;
    uint64_t v5 = [(PKTransactionDebugDetailsViewController *)self mapsMerchantDetails];
    uint64_t v6 = [v5 allKeys];
    uint64_t v7 = [v6 objectAtIndex:--v4];

    uint64_t v8 = [(PKTransactionDebugDetailsViewController *)self mapsMerchantDetails];
    uint64_t v9 = [v8 allValues];
    uint64_t v10 = [v9 objectAtIndex:v4];

    uint64_t v11 = [(PKTransactionDebugDetailsViewController *)self _cellWithPrimaryText:v7 infoText:v10];
  }
  else
  {
    uint64_t v11 = [(PKTransactionDebugDetailsViewController *)self _mapsCell];
  }

  return v11;
}

- (id)_mapsBrandInfoCellForIndex:(int64_t)a3
{
  uint64_t v5 = [(PKTransactionDebugDetailsViewController *)self mapsBrandDetails];
  uint64_t v6 = [v5 allKeys];
  uint64_t v7 = [v6 objectAtIndex:a3];

  uint64_t v8 = [(PKTransactionDebugDetailsViewController *)self mapsBrandDetails];
  uint64_t v9 = [v8 allValues];
  uint64_t v10 = [v9 objectAtIndex:a3];

  uint64_t v11 = [(PKTransactionDebugDetailsViewController *)self _cellWithPrimaryText:v7 infoText:v10];

  return v11;
}

- (id)_mapsCell
{
  mapsCell = self->_mapsCell;
  if (!mapsCell)
  {
    int64_t v4 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
    uint64_t v5 = self->_mapsCell;
    self->_mapsCell = v4;

    [(UITableViewCell *)self->_mapsCell setAccessoryType:1];
    uint64_t v6 = [(UITableViewCell *)self->_mapsCell textLabel];
    [v6 setText:@"View in Maps"];

    uint64_t v7 = [(UITableViewCell *)self->_mapsCell textLabel];
    uint64_t v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v7 setTextColor:v8];

    mapsCell = self->_mapsCell;
  }

  return mapsCell;
}

- (id)_cellWithPrimaryText:(id)a3 infoText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PKTransactionDebugDetailsViewController *)self tableView];
  uint64_t v9 = [v8 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTitleValueLabelCellReuseIdentifier"];

  [v9 setSelectionStyle:0];
  uint64_t v10 = [(PKTransactionDebugDetailsViewController *)self tableView];
  [v10 separatorInset];
  double v12 = v11;

  objc_msgSend(v9, "setLayoutMargins:", 0.0, v12, 0.0, v12);
  uint64_t v13 = [v9 keyLabel];
  [v13 setText:v7];

  v14 = [MEMORY[0x1E4FB1618] labelColor];
  [v13 setTextColor:v14];

  if (self->_inBridge)
  {
    uint64_t v15 = PKBridgeTextColor();
    [v13 setTextColor:v15];
  }
  uint64_t v16 = [v9 valueLabel];
  [v16 setText:v6];

  return v9;
}

- (void)_didSelectMap
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKPaymentTransaction *)self->_transaction merchant];
  int64_t v4 = [v3 mapsMerchant];

  id v5 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  v13[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v5 _setMuids:v7];

  if ([v4 resultProviderIdentifier]) {
    objc_msgSend(v5, "_setResultProviderID:", objc_msgSend(v4, "resultProviderIdentifier"));
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v8 startAnimating];
  [(UITableViewCell *)self->_mapsCell setAccessoryView:v8];
  [(UITableViewCell *)self->_mapsCell setUserInteractionEnabled:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PKTransactionDebugDetailsViewController__didSelectMap__block_invoke;
  v11[3] = &unk_1E59E09E0;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 startWithCompletionHandler:v11];
}

void __56__PKTransactionDebugDetailsViewController__didSelectMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(a1 + 32) + 1032) setAccessoryView:0];
  [*(id *)(*(void *)(a1 + 32) + 1032) setUserInteractionEnabled:1];
  if (!v6)
  {
    id v10 = [v5 mapItems];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      id v12 = [PKMerchantMapViewController alloc];
      uint64_t v13 = [v5 mapItems];
      v14 = [v13 firstObject];
      id v7 = [(PKMerchantMapViewController *)v12 initWithMapItem:v14 configOptions:1];

      uint64_t v9 = [*(id *)(a1 + 32) navigationController];
      [(__CFString *)v9 pushViewController:v7 animated:1];
LABEL_9:

      goto LABEL_10;
    }
  }
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 40) identifier];
    if (v6)
    {
      uint64_t v9 = [v6 localizedDescription];
    }
    else
    {
      uint64_t v9 = @"no map items.";
    }
    int v15 = 134218242;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKTransactionDebugDetailsViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v15, 0x16u);
    if (v6) {
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (void)setTransactionDetails:(id)a3
{
}

- (void)setMerchantDetails:(id)a3
{
}

- (void)setMapsMerchantDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsMerchantDetails, 0);
  objc_storeStrong((id *)&self->_merchantDetails, 0);
  objc_storeStrong((id *)&self->_transactionDetails, 0);
  objc_storeStrong((id *)&self->_mapsCell, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end