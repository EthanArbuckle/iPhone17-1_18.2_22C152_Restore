@interface PKPaymentShippingAddressViewPresenter
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKPaymentShippingAddressViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  v12 = NSString;
  v13 = [v10 shippingType];
  v14 = [v12 stringWithFormat:@"IN_APP_PAYMENT_%@", v13];
  v15 = PKLocalizedPaymentString(v14);

  v16 = objc_msgSend(v15, "pk_uppercaseAttributedString");
  [v11 setLabel:v16];

  [v11 setShowsSeparator:v7];
  v17 = [v10 formattedAddressString];
  id v29 = 0;
  LODWORD(v14) = [v10 isValidWithError:&v29];
  id v18 = v29;
  if (v14)
  {
    id v19 = (id)[v11 addValue:v17];
  }
  else
  {
    v20 = [v10 errors];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      v22 = [v11 addValue:v17 type:1];
      [v22 setNumberOfLines:1];
      [v22 setLineBreakMode:4];
      v23 = [MEMORY[0x1E4FB1618] labelColor];
      [v22 setTextColor:v23];

      v24 = [v18 localizedDescription];
      v25 = objc_msgSend(v24, "pk_uppercaseAttributedString");
      v26 = [v11 addValue:v25 type:1];

      [v26 setNumberOfLines:1];
      [v26 setLineBreakMode:4];
    }
    else
    {
      v22 = [v18 localizedDescription];
      v27 = objc_msgSend(v22, "pk_uppercaseAttributedString");
      id v28 = (id)[v11 addValue:v27 type:1];
    }
  }
}

@end