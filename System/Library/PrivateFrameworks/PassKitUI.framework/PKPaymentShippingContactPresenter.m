@interface PKPaymentShippingContactPresenter
+ (id)_valueForItem:(id)a3;
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKPaymentShippingContactPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  [v10 setShowsSeparator:v7];
  v12 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_4.isa);
  v13 = objc_msgSend(v12, "pk_uppercaseAttributedString");
  [v10 setLabel:v13];

  id v20 = 0;
  LODWORD(v13) = [v11 isValidWithError:&v20];
  id v14 = v20;
  v15 = v14;
  if (v13)
  {
    v16 = [a1 _valueForItem:v11];
    id v17 = (id)[v10 addValue:v16];
  }
  else
  {
    v16 = [v14 localizedDescription];
    v18 = objc_msgSend(v16, "pk_uppercaseAttributedString");
    id v19 = (id)[v10 addValue:v18 type:1];
  }
}

+ (id)_valueForItem:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:32];
  v5 = [v3 name];

  if (v5)
  {
    v6 = [v3 name];
    [v4 appendString:v6];

    BOOL v7 = [v3 phone];
    if (v7)
    {

LABEL_5:
      [v4 appendString:@"\n"];
      goto LABEL_6;
    }
    v8 = [v3 email];

    if (v8) {
      goto LABEL_5;
    }
  }
LABEL_6:
  v9 = [v3 email];

  if (v9)
  {
    id v10 = [v3 email];
    [v4 appendString:v10];

    id v11 = [v3 phone];

    if (v11) {
      [v4 appendString:@"\n"];
    }
  }
  v12 = [v3 phone];

  if (v12)
  {
    v13 = [v3 phone];
    [v4 appendString:v13];
  }
  id v14 = objc_msgSend(v4, "pk_uppercaseAttributedString");

  return v14;
}

@end