@interface PKPaymentBillingAgreementViewPresenter
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKPaymentBillingAgreementViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = PKLocalizedPaymentString(&cfstr_InAppPaymentBi.isa);
  v11 = objc_msgSend(v10, "pk_uppercaseAttributedString");
  [v8 setLabel:v11];

  [v8 setShowsDisclosure:0];
  [v8 setShowsSeparator:1];
  [v8 setSelectionStyle:0];
  id v12 = v9;
  v13 = [v12 billingAgreement];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    v16 = [v12 billingAgreement];
    v17 = (void *)[v15 initWithString:v16];
    id v18 = (id)[v8 addValue:v17];
  }
  v19 = PKLocalizedPaymentString(&cfstr_InAppPaymentBi_0.isa);
  id v20 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v24 = *MEMORY[0x1E4F87988];
  v25[0] = MEMORY[0x1E4F1CC38];
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v22 = (void *)[v20 initWithString:v19 attributes:v21];
  id v23 = (id)[v8 addValue:v22];
}

@end