@interface PKPaymentShippingMethodViewPresenter
+ (id)_valueForItem:(id)a3;
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKPaymentShippingMethodViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  BOOL v7 = a5;
  id v16 = a3;
  id v10 = a4;
  v11 = [v10 shippingMethod];

  if (v11)
  {
    [v16 setShowsSeparator:v7];
    v12 = PKLocalizedPaymentString(&cfstr_InAppPaymentMe.isa);
    v13 = objc_msgSend(v12, "pk_uppercaseAttributedString");
    [v16 setLabel:v13];

    v14 = [a1 _valueForItem:v10];
    id v15 = (id)[v16 addValue:v14];
  }
}

+ (id)_valueForItem:(id)a3
{
  v3 = [a3 shippingMethod];
  v4 = (void *)MEMORY[0x1E4F28E78];
  v5 = [v3 label];
  v6 = [v4 stringWithString:v5];

  BOOL v7 = [v3 dateComponentsRange];

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F84628]);
    v9 = [v3 dateComponentsRange];
    id v10 = [v8 stringFromDateComponentsRange:v9];
    [v6 appendFormat:@"\n%@", v10];
  }
  else
  {
    v11 = [v3 detail];

    if (!v11) {
      goto LABEL_6;
    }
    id v8 = [v3 detail];
    [v6 appendFormat:@"\n%@", v8];
  }

LABEL_6:
  v12 = objc_msgSend(v6, "pk_uppercaseAttributedString");

  return v12;
}

@end