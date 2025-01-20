@interface PKPaymentCardViewPresenter
+ (id)_billingValueInCell:(id)a3 forItem:(id)a4 type:(unint64_t)a5;
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKPaymentCardViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = v12;
  id v16 = a6;
  [v15 setShowsSeparator:v9];
  uint64_t v17 = [v16 requestType];

  [v15 setShowsDisclosure:v17 != 3];
  v18 = [v13 pass];
  int v19 = [v13 requiresBillingAddress];
  if (v19) {
    v20 = @"IN_APP_PAYMENT_PAYMENT_CARD_AND_BILLING";
  }
  else {
    v20 = @"IN_APP_PAYMENT_PAYMENT_CARD";
  }
  v21 = PKLocalizedPaymentString(&v20->isa);
  [v15 setAccessibilityLabel:v21];

  v22 = PKSanitizedPrimaryAccountRepresentationForPass();
  v77 = v22;
  if ([v22 length])
  {
    v23 = [NSString stringWithFormat:@"(%@)", v22];
  }
  else
  {
    v23 = @" ";
  }
  v24 = [v18 localizedDescription];
  v25 = [v18 peerPaymentBalance];

  char v26 = v19 ^ 1;
  if (!v25) {
    char v26 = 1;
  }
  id v72 = a1;
  if ((v26 & 1) == 0)
  {
    v27 = [v18 localizedDescription];
    v28 = [v18 peerPaymentBalance];
    [v28 minimalFormattedStringValue];
    v30 = v29 = v23;
    uint64_t v31 = PKLocalizedPaymentString(&cfstr_InAppPaymentCa.isa, &stru_1EF1B5770.isa, v27, v30);
    v32 = v24;
    v24 = (void *)v31;

    v23 = v29;
  }
  if ([v13 shouldShowCardArt])
  {
    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    double v34 = v33;
    v35 = +[PKPassSnapshotter sharedInstance];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __106__PKPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke;
    v79[3] = &unk_1E59DAA10;
    id v80 = v14;
    objc_msgSend(v35, "snapshotWithPass:size:completion:", v18, v79, 41.0, v34);

    if (!v19)
    {
LABEL_13:
      v36 = objc_msgSend(v24, "pk_uppercaseAttributedString");
      v37 = [v15 addValue:v36 type:0];

      [v37 setNumberOfLines:1];
      v75 = v37;
      [v37 setLineBreakMode:4];
      goto LABEL_19;
    }
  }
  else
  {
    v38 = PKLocalizedPaymentString(&cfstr_InAppPaymentTo.isa);
    v39 = objc_msgSend(v38, "pk_uppercaseAttributedString");
    [v15 setLabel:v39];

    if (!v19) {
      goto LABEL_13;
    }
  }
  if ([(__CFString *)v23 length])
  {
    id v40 = [NSString stringWithFormat:@"%@ %@", v24, v23];
  }
  else
  {
    id v40 = v24;
  }
  v41 = v40;
  v42 = objc_msgSend(v40, "pk_uppercaseAttributedString");
  v43 = [v15 addValue:v42 type:0];

  [v43 setNumberOfLines:1];
  v75 = v43;
  [v43 setLineBreakMode:5];

LABEL_19:
  id v78 = 0;
  int v44 = [v13 isValidWithError:&v78];
  id v45 = v78;
  v76 = v45;
  if (v44)
  {
    if ([v13 status] == 2 || objc_msgSend(v13, "status") == 3)
    {
      v46 = @"IN_APP_PAYMENT_ERROR_PIN_INCORRECT";
    }
    else
    {
      if ([v13 status] != 5)
      {
LABEL_26:
        if (v19)
        {
          v50 = [v72 _billingValueInCell:v15 forItem:v13 type:0];
        }
        else
        {
          v51 = [v18 peerPaymentBalance];

          if (v51)
          {
            v52 = [v18 peerPaymentBalance];
            v73 = [v52 minimalFormattedStringValue];
            v53 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInA.isa, &stru_1EF1B4C70.isa, v73);
            objc_msgSend(v53, "pk_uppercaseAttributedString");
            v54 = v18;
            v55 = v24;
            v56 = v23;
            v58 = id v57 = v14;
            v50 = [v15 addValue:v58 type:0];

            id v14 = v57;
            v23 = v56;
            v24 = v55;
            v18 = v54;
          }
          else
          {
            v52 = [(__CFString *)v23 pk_uppercaseAttributedString];
            v50 = [v15 addValue:v52 type:0];
          }

          [v50 setNumberOfLines:1];
          [v50 setLineBreakMode:4];
        }
        goto LABEL_34;
      }
      v46 = @"IN_APP_PAYMENT_ERROR_INSUFFICIENT_BALANCE";
    }
    v47 = PKLocalizedPaymentString(&v46->isa);
  }
  else
  {
    v47 = [v45 localizedDescription];
  }
  v48 = v47;
  v49 = objc_msgSend(v47, "pk_uppercaseAttributedString");
  v50 = [v15 addValue:v49 type:1];

  if (!v50) {
    goto LABEL_26;
  }
LABEL_34:
  [v50 setLineBreakMode:4];
  [v50 setNumberOfLines:1];
  v59 = [v13 peerPaymentBalance];
  if ([v13 showPeerPaymentBalance] && v59)
  {
    v60 = objc_msgSend(@" ", "pk_uppercaseAttributedString");
    id v61 = (id)[v15 addValue:v60 type:0];

    v62 = [v59 amount];
    v63 = [v59 currency];
    PKFormattedCurrencyStringFromNumber();
    v74 = v18;
    v64 = v24;
    v65 = v23;
    v67 = id v66 = v14;

    v68 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInA_0.isa, &stru_1EF1B4C70.isa, v67);

    v69 = objc_msgSend(v68, "pk_uppercaseAttributedString");
    v70 = [v15 addValue:v69 type:2];

    LODWORD(v71) = 1036831949;
    [v70 _setHyphenationFactor:v71];
    [v70 setLineBreakMode:0];
    [v70 setNumberOfLines:0];

    id v14 = v66;
    v23 = v65;
    v24 = v64;
    v18 = v74;
  }
}

void __106__PKPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__PKPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke_2;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __106__PKPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setLabelImage:*(void *)(a1 + 32)];
}

+ (id)_billingValueInCell:(id)a3 forItem:(id)a4 type:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [a4 billingAddress];
  BOOL v9 = [v8 pkSingleLineFormattedContactAddress];

  v10 = objc_msgSend(v9, "pk_uppercaseAttributedString");
  v11 = [v7 addValue:v10 type:a5];

  return v11;
}

@end