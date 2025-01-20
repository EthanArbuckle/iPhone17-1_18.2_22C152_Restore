@interface PKPeerPaymentCardViewPresenter
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKPeerPaymentCardViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v35 = a7;
  id v13 = a6;
  objc_msgSend(v11, "setShowsDisclosure:", objc_msgSend(v12, "shouldShowDisclosure"));
  [v11 setShowsSeparator:v9];
  [v11 setSelectionStyle:0];
  v14 = [v12 pass];
  v15 = [v12 quote];
  v16 = [v15 currentBalanceCurrency];
  v36 = v15;
  v17 = [v15 currentBalance];
  uint64_t v18 = [v13 requestType];

  if (((v18 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    v19 = [v14 peerPaymentBalance];
    uint64_t v20 = [v19 currency];

    uint64_t v21 = [v19 amount];

    v17 = (void *)v21;
    v16 = (void *)v20;
  }
  v34 = v17;
  v22 = [v14 localizedDescription];
  v23 = PKFormattedCurrencyStringFromNumber();
  v24 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInA.isa, &stru_1EF1B4C70.isa, v23);

  v25 = objc_msgSend(v22, "pk_uppercaseAttributedString");
  v26 = [v11 addValue:v25 type:0];

  [v26 setNumberOfLines:1];
  [v26 setLineBreakMode:4];
  v27 = objc_msgSend(v24, "pk_uppercaseAttributedString");
  v28 = [v11 addValue:v27 type:0];

  [v28 setNumberOfLines:1];
  [v28 setLineBreakMode:4];
  v29 = PKLocalizedPaymentString((NSString *)v22);
  [v11 setAccessibilityLabel:v29];

  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  double v31 = v30;
  v32 = +[PKPassSnapshotter sharedInstance];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __110__PKPeerPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke;
  v37[3] = &unk_1E59DAA10;
  id v38 = v35;
  id v33 = v35;
  objc_msgSend(v32, "snapshotWithPass:size:completion:", v14, v37, 41.0, v31);
}

void __110__PKPeerPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__PKPeerPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke_2;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __110__PKPeerPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setLabelImage:*(void *)(a1 + 32)];
}

@end