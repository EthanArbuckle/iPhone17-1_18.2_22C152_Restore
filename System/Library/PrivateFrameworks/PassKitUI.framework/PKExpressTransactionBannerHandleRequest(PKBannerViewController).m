@interface PKExpressTransactionBannerHandleRequest(PKBannerViewController)
- (PKExpressTransactionBannerViewController)createBannerViewController;
@end

@implementation PKExpressTransactionBannerHandleRequest(PKBannerViewController)

- (PKExpressTransactionBannerViewController)createBannerViewController
{
  id v1 = [a1 passUniqueIdentifier];
  self;
  if (v1)
  {
    v2 = [MEMORY[0x1E4F84898] sharedInstance];
    v3 = [v2 passWithUniqueID:v1];

    if (v3)
    {
      id v4 = v3;
      self;
      v5 = [PKExpressTransactionBannerViewController alloc];
      id v6 = v4;
      if (v5)
      {
        v38.receiver = v5;
        v38.super_class = (Class)PKExpressTransactionBannerViewController;
        v7 = (PKExpressTransactionBannerViewController *)objc_msgSendSuper2(&v38, sel_initWithNibName_bundle_, 0, 0);
        v5 = v7;
        if (v7)
        {
          objc_storeStrong((id *)&v7->_pass, v3);
          uint64_t v8 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v5];
          paymentService = v5->_paymentService;
          v5->_paymentService = (PKPaymentService *)v8;

          v5->_state = 0;
          v5->_activeLayoutMode = 0;
          v10 = 0;
          if ([(PKPass *)v5->_pass passType] == PKPassTypeSecureElement)
          {
            v11 = v5->_pass;
            v10 = v11;
            if (v11)
            {
              if ([(PKPass *)v11 isStoredValuePass])
              {
                uint64_t v12 = [objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v10];
                transitBalanceModel = v5->_transitBalanceModel;
                v5->_transitBalanceModel = (PKTransitBalanceModel *)v12;

                v22 = [(PKPass *)v5->_pass uniqueID];
                v14 = [(PKPass *)v10 devicePrimaryPaymentApplication];
                v15 = dispatch_group_create();
                objc_initWeak(&location, v5);
                v35[0] = 0;
                v35[1] = v35;
                v35[2] = 0x3032000000;
                v35[3] = __Block_byref_object_copy__64;
                v35[4] = __Block_byref_object_dispose__64;
                id v36 = 0;
                v33[0] = 0;
                v33[1] = v33;
                v33[2] = 0x3032000000;
                v33[3] = __Block_byref_object_copy__64;
                v33[4] = __Block_byref_object_dispose__64;
                id v34 = 0;
                dispatch_group_enter(v15);
                v16 = v5->_paymentService;
                v28[0] = MEMORY[0x1E4F143A8];
                v28[1] = 3221225472;
                v28[2] = __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke;
                v28[3] = &unk_1E59D17F0;
                v32 = v35;
                id v17 = v14;
                id v29 = v17;
                v10 = v10;
                v30 = v10;
                v18 = v15;
                v31 = v18;
                [(PKPaymentService *)v16 transitStateWithPassUniqueIdentifier:v22 paymentApplication:v17 completion:v28];
                dispatch_group_enter(v18);
                v19 = v5->_paymentService;
                v25[0] = MEMORY[0x1E4F143A8];
                v25[1] = 3221225472;
                v25[2] = __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke_2;
                v25[3] = &unk_1E59D1818;
                v27 = v33;
                v20 = v18;
                v26 = v20;
                [(PKPaymentService *)v19 balancesForPaymentPassWithUniqueIdentifier:v22 completion:v25];
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke_3;
                block[3] = &unk_1E59D4748;
                objc_copyWeak(&v24, &location);
                block[4] = v35;
                block[5] = v33;
                dispatch_group_notify(v20, MEMORY[0x1E4F14428], block);
                objc_destroyWeak(&v24);

                _Block_object_dispose(v33, 8);
                _Block_object_dispose(v35, 8);

                objc_destroyWeak(&location);
              }
            }
          }
        }
      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end