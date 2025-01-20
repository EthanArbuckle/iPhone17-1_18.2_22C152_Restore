@interface PKPaymentTransactionCellController
- (PKContactResolver)contactResolver;
- (PKPaymentTransactionCellController)initWithContactResolver:(id)a3;
- (PKPaymentTransactionCellController)initWithContactResolver:(id)a3 context:(unint64_t)a4;
- (void)_updateAvatarOnTransactionCell:(id)a3 withTransaction:(id)a4 contact:(id)a5;
- (void)_updatePrimaryLabelOnTransactionCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5 transaction:(id)a6;
- (void)configureCell:(id)a3 forTransaction:(id)a4 transactionSource:(id)a5 familyMember:(id)a6 account:(id)a7 detailStyle:(int64_t)a8 deviceName:(id)a9 avatarViewDelegate:(id)a10;
@end

@implementation PKPaymentTransactionCellController

- (PKPaymentTransactionCellController)initWithContactResolver:(id)a3
{
  return [(PKPaymentTransactionCellController *)self initWithContactResolver:a3 context:0];
}

- (PKPaymentTransactionCellController)initWithContactResolver:(id)a3 context:(unint64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionCellController;
  v8 = [(PKPaymentTransactionCellController *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactResolver, a3);
    v10 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
    iconGenerator = v9->_iconGenerator;
    v9->_iconGenerator = v10;

    v9->_context = a4;
    v12 = (UIImage *)objc_alloc_init(MEMORY[0x1E4FB1818]);
    emptyImage = v9->_emptyImage;
    v9->_emptyImage = v12;

    v14 = objc_alloc_init(PKPeerPaymentCounterpartImageResolver);
    counterpartImageResolver = v9->_counterpartImageResolver;
    v9->_counterpartImageResolver = v14;
  }
  return v9;
}

- (void)configureCell:(id)a3 forTransaction:(id)a4 transactionSource:(id)a5 familyMember:(id)a6 account:(id)a7 detailStyle:(int64_t)a8 deviceName:(id)a9 avatarViewDelegate:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = v18;
  id v22 = a9;
  id v82 = a10;
  v85 = [v17 identifier];
  objc_msgSend(v16, "setIdentifier:");
  uint64_t v23 = [v17 transactionType];
  v83 = [v17 peerPaymentCounterpartHandle];
  v84 = v21;
  v80 = v20;
  v81 = v19;
  v79 = v22;
  v24 = [MEMORY[0x1E4F84D18] presentationInformationForTransaction:v17 transactionSource:v21 secondaryTransactionSource:0 familyMember:v19 account:v20 deviceName:v22 context:self->_context];
  if (a8 == 2) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v86 = [MEMORY[0x1E4FB1618] labelColor];
  }
  if ([v24 shouldGrayValue])
  {
    uint64_t v25 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else
  {
    uint64_t v25 = 0;
  }
  v26 = [v24 valueString];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v28 = v27;
  v78 = (void *)v25;
  if (v25) {
    v29 = (void *)v25;
  }
  else {
    v29 = v86;
  }
  [v27 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
  v30 = [MEMORY[0x1E4FB1618] clearColor];
  [v28 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4FB06C0]];

  if ([v24 shouldStrikeValue]) {
    [v28 setObject:&unk_1EF2B8EB0 forKeyedSubscript:*MEMORY[0x1E4FB0768]];
  }
  v77 = v26;
  if ([v26 length])
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28B18]);
    v32 = (void *)[v28 copy];
    uint64_t v33 = [v31 initWithString:v26 attributes:v32];

    v34 = (void *)v33;
  }
  else
  {
    v34 = 0;
  }
  v35 = [v16 transactionView];
  v36 = [v24 primaryString];
  [v35 setPrimaryString:v36];

  v37 = [v24 secondaryString];
  [v35 setSecondaryString:v37];

  v38 = [v24 tertiaryString];
  [v35 setTertiaryString:v38];

  [v35 setTransactionValueAttributedText:v34];
  v39 = [v24 badgeString];
  [v35 setBadgeString:v39];

  [v35 setShowsDisclosureView:0];
  v40 = [v24 secondaryBadgeSymbol];
  [v35 setSecondaryBadgeSymbol:v40];

  [v35 setPrimaryColor:v86];
  if ([v24 destructiveSecondaryString]) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  v41 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [v35 setSecondaryColor:v41];

  if (self->_context) {
    int v42 = [v17 isBankConnectTransaction];
  }
  else {
    int v42 = 1;
  }
  if (v23 != 3 || !v42 || [v17 peerPaymentType] == 6)
  {
    if (!v42) {
      goto LABEL_60;
    }
    [v35 setShowsAvatarView:0];
    uint64_t v43 = [v84 type];
    if ((unint64_t)(v43 - 1) < 3) {
      goto LABEL_54;
    }
    if (v43) {
      goto LABEL_52;
    }
    v75 = [v84 paymentPass];
    v44 = [MEMORY[0x1E4F84D50] sharedService];
    v45 = [v44 context];
    v46 = [v45 configuration];

    v47 = [v75 issuerCountryCode];
    char v74 = [v46 paymentTransactionIconsEnabledForRegion:v47];

    uint64_t v48 = [v75 cardType];
    v49 = [v75 associatedAccountServiceAccountIdentifier];
    if (v49
      || (v48 == 1 ? (char v68 = v74) : (char v68 = 0),
          ([v75 hasAssociatedPeerPaymentAccount] & 1) != 0
       || (v68 & 1) != 0
       || ([v75 isStoredValuePass] & 1) != 0))
    {
    }
    else
    {
      char v69 = [v75 isIdentityPass];

      if ((v69 & 1) == 0)
      {
LABEL_52:
        if (([v17 isBankConnectTransaction] & 1) == 0 && objc_msgSend(v17, "peerPaymentType") != 6) {
          goto LABEL_60;
        }
      }
    }
LABEL_54:
    objc_initWeak(location, self);
    iconGenerator = self->_iconGenerator;
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_6;
    v87[3] = &unk_1E59D2BC0;
    objc_copyWeak(&v91, location);
    id v88 = v16;
    id v89 = v85;
    id v71 = v35;
    id v90 = v71;
    v53 = -[PKPaymentTransactionIconGenerator iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:", v17, 0, 0, v87, 45.0, 45.0);
    if (v53) {
      [v71 setPrimaryImage:v53 animated:0];
    }
    else {
      [v71 setPrimaryImage:self->_emptyImage animated:0];
    }

    v67 = &v91;
    goto LABEL_58;
  }
  v76 = v34;
  [v35 setShowsAvatarView:1];
  [v35 setPrimaryImage:0];
  v50 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v51 = [v50 _supportsForceTouch];

  if (v51)
  {
    v52 = [v35 avatarView];
    [v52 setUserInteractionEnabled:1];
    [v52 setDelegate:v82];
    [v52 setForcePressView:v52];
  }
  v53 = [v17 peerPaymentCounterpartImageRecordIdentifier];
  uint64_t v54 = [v17 peerPaymentPaymentMode];
  if (v53) {
    BOOL v55 = v54 == 2;
  }
  else {
    BOOL v55 = 0;
  }
  if (v54 == 2)
  {
    v56 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28D8]];
    v57 = (void *)MEMORY[0x1E4FB1830];
    [v56 scaledValueForValue:9.0];
    v58 = objc_msgSend(v57, "configurationWithPointSize:weight:", 2);
    [v35 setSecondaryBadgeSymbolConfiguration:v58];
  }
  if (!v55)
  {
    int v64 = [(PKContactResolver *)self->_contactResolver hasCachedResultForHandle:v83];
    contactResolver = self->_contactResolver;
    if (v64)
    {
      v66 = [(PKContactResolver *)self->_contactResolver contactForHandle:v83];
      [(PKPaymentTransactionCellController *)self _updateAvatarOnTransactionCell:v16 withTransaction:v17 contact:v66];
      [(PKPaymentTransactionCellController *)self _updatePrimaryLabelOnTransactionCell:v16 withPeerPaymentCounterpartHandle:v83 contact:v66 transaction:v17];
    }
    else
    {
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_4;
      v92[3] = &unk_1E59D2B98;
      id v93 = v16;
      id v94 = v85;
      v95 = self;
      id v96 = v17;
      id v97 = v83;
      [(PKContactResolver *)contactResolver contactForHandle:v97 withCompletion:v92];
    }
    v34 = v76;
    goto LABEL_59;
  }
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke;
  aBlock[3] = &unk_1E59D2B48;
  objc_copyWeak(&v106, location);
  id v59 = v16;
  id v103 = v59;
  id v104 = v17;
  id v105 = v83;
  v60 = (void (**)(void *, void *))_Block_copy(aBlock);
  BOOL v61 = [(PKPeerPaymentCounterpartImageResolver *)self->_counterpartImageResolver hasCachedImageDataForIdentifier:v53];
  v34 = v76;
  counterpartImageResolver = self->_counterpartImageResolver;
  if (v61)
  {
    v63 = [(PKPeerPaymentCounterpartImageResolver *)counterpartImageResolver counterpartImageDataForIdentifier:v53];
    v60[2](v60, v63);
  }
  else
  {
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_2;
    v98[3] = &unk_1E59D2B70;
    id v99 = v59;
    id v100 = v85;
    v101 = v60;
    [(PKPeerPaymentCounterpartImageResolver *)counterpartImageResolver counterpartImageDataForIdentifier:v53 completion:v98];

    v63 = v99;
  }

  v67 = &v106;
LABEL_58:
  objc_destroyWeak(v67);
  objc_destroyWeak(location);
LABEL_59:

LABEL_60:
  uint64_t v72 = [v24 shouldShowDisclosure];
  if (v72) {
    uint64_t v73 = 3;
  }
  else {
    uint64_t v73 = 0;
  }
  [v35 setShowsDisclosureView:v72];
  [v16 setSelectionStyle:v73];
  PKAccessibilityIDCellSet(v16, (void *)*MEMORY[0x1E4F85AD0]);
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke(void *a1, void *a2)
{
  v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  [v5 setImageData:v4];

  [WeakRetained _updateAvatarOnTransactionCell:a1[4] withTransaction:a1[5] contact:v5];
  [WeakRetained _updatePrimaryLabelOnTransactionCell:a1[4] withPeerPaymentCounterpartHandle:a1[6] contact:v5 transaction:a1[5]];
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_3;
  v5[3] = &unk_1E59CB728;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = v3;
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identifier];
  id v3 = *(void **)(a1 + 40);
  id v9 = v2;
  id v4 = v3;
  if (v9 == v4)
  {

    goto LABEL_10;
  }
  if (v9) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
  }
  else
  {
    int v6 = [v9 isEqualToString:v4];

    if (v6)
    {
LABEL_10:
      uint64_t v7 = *(void *)(a1 + 48);

      if (v7)
      {
        id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
        v8();
      }
      return;
    }
  }
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_5;
  v8[3] = &unk_1E59CF4A8;
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  int v6 = *(void **)(a1 + 56);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v13 = v3;
  id v14 = *(id *)(a1 + 64);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identifier];
  id v3 = *(void **)(a1 + 40);
  id v12 = v2;
  id v4 = v3;
  if (v12 == v4)
  {

LABEL_12:
    [*(id *)(a1 + 48) _updateAvatarOnTransactionCell:*(void *)(a1 + 32) withTransaction:*(void *)(a1 + 56) contact:*(void *)(a1 + 64)];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    [v10 _updatePrimaryLabelOnTransactionCell:v7 withPeerPaymentCounterpartHandle:v8 contact:v9 transaction:v11];
    return;
  }
  if (v12) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    int v6 = [v12 isEqualToString:v4];

    if (!v6) {
      return;
    }
    goto LABEL_12;
  }
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_6(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_7;
  block[3] = &unk_1E59CB838;
  objc_copyWeak(&v10, a1 + 7);
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) identifier];
    id v4 = *(void **)(a1 + 40);
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_11;
    }
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {

LABEL_12:
      id WeakRetained = v10;
      goto LABEL_13;
    }
    int v9 = [v5 isEqualToString:v6];

    id WeakRetained = v10;
    if (v9)
    {
LABEL_11:
      [*(id *)(a1 + 48) setPrimaryImage:*(void *)(a1 + 56) animated:1];
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)_updateAvatarOnTransactionCell:(id)a3 withTransaction:(id)a4 contact:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  int v9 = [a4 peerPaymentCounterpartHandle];
  id v10 = [v8 transactionView];

  uint64_t v11 = [v10 avatarView];

  if (v7)
  {
    v15[0] = v7;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    if (!v12) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v9)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v13 setContactType:0];
    id v14 = v13;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];

    if (v12)
    {
LABEL_6:
      [v11 setContacts:v12];
    }
  }
LABEL_7:
}

- (void)_updatePrimaryLabelOnTransactionCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5 transaction:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  uint64_t v12 = [a6 peerPaymentPaymentMode];
  id v13 = v11;
  if (v12 != 2)
  {
    id v13 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:v11 contact:v10];
  }
  id v14 = [v15 transactionView];
  [v14 setPrimaryString:v13];
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_counterpartImageResolver, 0);
  objc_storeStrong((id *)&self->_emptyImage, 0);

  objc_storeStrong((id *)&self->_iconGenerator, 0);
}

@end