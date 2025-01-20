@interface PKPaymentSetupDevicePickerViewController
- (PKPaymentSetupDevicePickerViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6 webService:(id)a7 nanoWebService:(id)a8;
- (PKPaymentSetupDevicePickerViewControllerFlowDelegate)flowDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)didSelectWebService:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupDevicePickerViewController

- (PKPaymentSetupDevicePickerViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6 webService:(id)a7 nanoWebService:(id)a8
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v24 = a5;
  id v23 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSetupDevicePickerViewController;
  v18 = [(PKDynamicCollectionViewController *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_provisioningController, a3);
    v19->_setupContext = a4;
    objc_storeStrong((id *)&v19->_setupDelegate, a5);
    objc_storeStrong((id *)&v19->_product, a6);
    objc_storeStrong((id *)&v19->_webService, a7);
    objc_storeStrong((id *)&v19->_nanoWebService, a8);
    v26[0] = v16;
    v26[1] = v17;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    webServices = v19->_webServices;
    v19->_webServices = (NSArray *)v20;
  }
  return v19;
}

- (void)viewDidLoad
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupDevicePickerViewController;
  [(PKDynamicCollectionViewController *)&v9 viewDidLoad];
  v3 = PKLocalizedPaymentString(&cfstr_IssuerAddCardW.isa);
  product = self->_product;
  if (product)
  {
    v5 = [(PKPaymentSetupProduct *)product displayName];
    v6 = PKLocalizedPaymentString(&cfstr_IssuerAddPicke.isa, &stru_1EF1B4C70.isa, v5);
  }
  else
  {
    v6 = PKLocalizedPaymentString(&cfstr_IssuerAddPicke_0.isa);
  }
  v7 = [[PKPaymentSetupDevicePickerListSectionController alloc] initWithWebServices:self->_webServices title:v3 subtitle:v6 image:self->_cardImage];
  [(PKPaymentSetupDevicePickerListSectionController *)v7 setDelegate:self];
  v10[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(PKDynamicCollectionViewController *)self setSections:v8 animated:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupDevicePickerViewController;
  [(PKDynamicCollectionViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  product = self->_product;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PKPaymentSetupDevicePickerViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E59CC4C0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(PKPaymentSetupProduct *)product digitalCardCachedImage:v8];
}

void __68__PKPaymentSetupDevicePickerViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1128), a3);
  }
  if (*(void *)(*(void *)(a1 + 32) + 1120))
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:*(void *)(*(void *)(a1 + 32) + 1120)];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 1064);
    *(void *)(v7 + 1064) = v6;

    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1088) copy];
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 1096);
    *(void *)(v10 + 1096) = v9;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = [*(id *)(*(void *)(a1 + 32) + 1096) provisioningMethodTypes];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*(void *)(a1 + 32) + 1096) setProvisioningMethodMetadata:0 forType:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    uint64_t v17 = *(void *)(a1 + 32);
    v18 = *(void **)(v17 + 1064);
    uint64_t v19 = *(void *)(v17 + 1096);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__PKPaymentSetupDevicePickerViewController_preflightWithCompletion___block_invoke_2;
    v21[3] = &unk_1E59CAA98;
    id v22 = *(id *)(a1 + 40);
    [v18 requestProvisioningMethodMetadataForProduct:v19 completionHandler:v21];
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20) {
      (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, 1);
    }
  }
}

uint64_t __68__PKPaymentSetupDevicePickerViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)didSelectWebService:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 6;
  if (self->_nanoWebService == a3)
  {
    uint64_t v5 = 15;
    uint64_t v6 = 16;
  }
  else
  {
    uint64_t v6 = 9;
  }
  id v7 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___PKPaymentSetupDevicePickerListSectionController__items[v5]));
  id v8 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___PKPaymentSetupDevicePickerListSectionController__items[v6]));
  reporter = self->_reporter;
  uint64_t v10 = *MEMORY[0x1E4F86308];
  v18[0] = *MEMORY[0x1E4F86398];
  uint64_t v11 = *MEMORY[0x1E4F86298];
  v17[0] = v10;
  v17[1] = v11;
  v12 = [a3 targetDevice];
  id v13 = [v12 deviceClass];
  if ([v13 isEqualToString:@"iPhone"])
  {
    uint64_t v14 = @"phone";
  }
  else if ([v13 isEqualToString:@"iPad"])
  {
    uint64_t v14 = @"pad";
  }
  else if ([v13 isEqualToString:@"Watch"])
  {
    uint64_t v14 = @"watch";
  }
  else if ([v13 isEqualToString:@"Mac"])
  {
    uint64_t v14 = @"mac";
  }
  else if ([v13 isEqualToString:@"RealityDevice"])
  {
    uint64_t v14 = @"vision";
  }
  else
  {
    uint64_t v14 = @"unknown";
  }

  v18[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportEvent:v15];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained devicePickerViewController:self didSelectProvisioningController:v7 product:v8];
}

- (PKPaymentSetupDevicePickerViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupDevicePickerViewControllerFlowDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_nanoWebService, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_webServices, 0);
  objc_storeStrong((id *)&self->_nanoProduct, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_setupDelegate, 0);
  objc_storeStrong((id *)&self->_bridgeProvisioningController, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end