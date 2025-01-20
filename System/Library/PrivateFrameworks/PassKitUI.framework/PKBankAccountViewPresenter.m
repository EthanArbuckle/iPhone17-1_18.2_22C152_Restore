@interface PKBankAccountViewPresenter
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKBankAccountViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  BOOL v8 = a5;
  id v10 = a3;
  id v11 = a4;
  id v46 = a6;
  BOOL v12 = 1;
  [v10 setShowsDisclosure:1];
  [v10 setShowsSeparator:v8];
  [v10 setLabelImage:0];
  id v13 = v11;
  v14 = [v13 bankAccountInformation];
  v15 = [v14 bankName];
  v16 = [v14 maskedAccountNumber];
  v17 = objc_msgSend(v15, "pk_uppercaseAttributedString");
  v18 = [v10 addValue:v17 type:0];

  [v18 setNumberOfLines:1];
  [v18 setLineBreakMode:4];
  v45 = v16;
  v19 = objc_msgSend(v16, "pk_uppercaseAttributedString");
  v20 = [v10 addValue:v19 type:0];

  [v20 setNumberOfLines:1];
  [v20 setLineBreakMode:4];
  v21 = [v13 peerPaymentBalance];
  if (v21)
  {
    v22 = [MEMORY[0x1E4F28C28] zero];
    v23 = [v21 amount];
    BOOL v12 = [v22 compare:v23] != -1;
  }
  if ([v46 deviceSupportsPeerPaymentAccountPayment]
    && (([v46 accountPaymentUsePeerPaymentBalance] | v12) & 1) == 0)
  {
    v24 = objc_msgSend(@" ", "pk_uppercaseAttributedString");
    id v25 = (id)[v10 addValue:v24 type:0];

    v26 = [v21 amount];
    v27 = [v21 currency];
    v28 = PKFormattedCurrencyStringFromNumber();

    v29 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInA_0.isa, &stru_1EF1B4C70.isa, v28);

    v30 = objc_msgSend(v29, "pk_uppercaseAttributedString");
    v31 = [v10 addValue:v30 type:2];

    LODWORD(v32) = 1036831949;
    [v31 _setHyphenationFactor:v32];
    [v31 setLineBreakMode:0];
    [v31 setNumberOfLines:0];
  }
  id v47 = 0;
  char v33 = [v13 isValidWithError:&v47];
  id v34 = v47;
  v35 = v34;
  if ((v33 & 1) == 0)
  {
    v36 = [v34 localizedDescription];
    v37 = objc_msgSend(v36, "pk_uppercaseAttributedString");
    id v38 = (id)[v10 addValue:v37 type:1];
  }
  [v10 setAccessibilityLabel:v15];
  v39 = PKPassKitUIBundle();
  v40 = [v39 URLForResource:@"Bank" withExtension:@"pdf"];

  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  CGFloat v42 = v41;
  double v43 = PKUIScreenScale();
  v44 = PKUIImageFromPDF(v40, 41.0, v42, v43);
  [v10 setLabelImage:v44];
}

@end