@interface PKPaymentCouponCodeViewPresenter
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKPaymentCouponCodeViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  id v8 = a3;
  id v9 = a4;
  id v22 = v8;
  v10 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_1.isa);
  v11 = objc_msgSend(v10, "pk_uppercaseAttributedString");
  [v22 setLabel:v11];

  [v22 setShowsDisclosure:1];
  [v22 setShowsSeparator:1];
  id v12 = v9;
  v13 = [v12 couponCode];
  if ([v13 length])
  {
    v14 = objc_msgSend(v13, "pk_uppercaseAttributedString");
  }
  else
  {
    v15 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_2.isa);
    v14 = objc_msgSend(v15, "pk_uppercaseAttributedString");
  }
  v16 = [v22 addValue:v14];
  [v16 setLineBreakMode:4];
  [v16 setNumberOfLines:1];
  v17 = [v12 errors];
  v18 = [v17 firstObject];

  if (v18)
  {
    v19 = [v18 localizedDescription];
    v20 = objc_msgSend(v19, "pk_uppercaseAttributedString");
    v21 = [v22 addValue:v20 type:2];

    [v21 setLineBreakMode:4];
    [v21 setNumberOfLines:1];
  }
}

@end