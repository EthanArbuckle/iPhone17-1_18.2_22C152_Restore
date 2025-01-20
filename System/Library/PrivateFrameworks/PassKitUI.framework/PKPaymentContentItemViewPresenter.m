@interface PKPaymentContentItemViewPresenter
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKPaymentContentItemViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  BOOL v7 = a5;
  id v17 = a3;
  v9 = [a4 contentItem];
  if (v9)
  {
    [v17 setShowsDisclosure:0];
    [v17 setSelectionStyle:0];
    [v17 setShowsSeparator:v7];
    v10 = [v9 title];
    v11 = [v10 string];
    v12 = objc_msgSend(v11, "pk_uppercaseAttributedString");
    [v17 setLabel:v12];

    v13 = [v9 label];
    id v14 = (id)[v17 addValue:v13];

    objc_msgSend(v17, "setCentered:", objc_msgSend(v9, "isCentered"));
    id v15 = v9;
    if ([v15 image])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:", objc_msgSend(v15, "image"));
      [v17 setLabelImage:v16];
    }
  }
}

@end