@interface PKReprocessMerchantActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (PKReprocessMerchantActivity)initWithTransaction:(id)a3 paymentPass:(id)a4;
- (id)activityImage;
- (id)activityTitle;
- (void)performActivity;
@end

@implementation PKReprocessMerchantActivity

- (PKReprocessMerchantActivity)initWithTransaction:(id)a3 paymentPass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKReprocessMerchantActivity;
  v9 = [(UIActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v10->_paymentPass, a4);
  }

  return v10;
}

- (id)activityTitle
{
  return @"Reprocess Merchant";
}

- (id)activityImage
{
  return (id)[MEMORY[0x1E4FB1818] systemImageNamed:@"map.fill"];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  v3 = [(PKPaymentPass *)self->_paymentPass devicePrimaryPaymentApplication];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F850A0]) initWithTransaction:self->_transaction paymentApplication:v3];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F847F0]) initWithSource:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PKReprocessMerchantActivity_performActivity__block_invoke;
  v7[3] = &unk_1E59D8FB8;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v5 startLookupWithCompletion:v7];
}

void __46__PKReprocessMerchantActivity_performActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 result] == 2)
  {
    v4 = [v3 merchant];
    if (v4)
    {

LABEL_5:
      id v6 = [*(id *)(*(void *)(a1 + 32) + 128) merchant];
      id v7 = [v3 brand];
      [v6 setMapsBrand:v7];

      id v8 = [v3 merchant];
      [v6 setMapsMerchant:v8];

      [v6 setMapsDataIsFromLocalMatch:0];
      id v9 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(v10 + 128);
      objc_super v12 = [*(id *)(v10 + 136) uniqueID];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__PKReprocessMerchantActivity_performActivity__block_invoke_2;
      v14[3] = &unk_1E59D09C8;
      uint64_t v13 = *(void *)(a1 + 40);
      v14[4] = *(void *)(a1 + 32);
      [v9 insertOrUpdatePaymentTransaction:v11 forPassUniqueIdentifier:v12 paymentApplication:v13 completion:v14];

      goto LABEL_6;
    }
    v5 = [v3 brand];

    if (v5) {
      goto LABEL_5;
    }
  }
LABEL_6:
}

void __46__PKReprocessMerchantActivity_performActivity__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PKReprocessMerchantActivity_performActivity__block_invoke_3;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__PKReprocessMerchantActivity_performActivity__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end