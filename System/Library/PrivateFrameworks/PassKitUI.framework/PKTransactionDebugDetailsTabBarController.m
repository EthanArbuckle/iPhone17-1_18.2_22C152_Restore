@interface PKTransactionDebugDetailsTabBarController
- (PKTransactionDebugDetailsTabBarController)initWithTransaction:(id)a3 transactionSourceCollection:(id)a4;
- (void)_handleShareButton:(id)a3;
@end

@implementation PKTransactionDebugDetailsTabBarController

- (PKTransactionDebugDetailsTabBarController)initWithTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PKTransactionDebugDetailsTabBarController;
  v9 = [(PKTransactionDebugDetailsTabBarController *)&v35 init];
  v10 = v9;
  if (v9)
  {
    p_transaction = &v9->_transaction;
    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v10->_transactionSourceCollection, a4);
    v12 = [[PKTransactionDebugDetailsViewController alloc] initWithTransaction:*p_transaction];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v14 = objc_alloc_init(MEMORY[0x1E4FB1CF8]);
    [v14 setTitle:@"Wallet"];
    v15 = PKUIImageNamed(@"passes-inactive");
    [v14 setImage:v15];

    v16 = PKUIImageNamed(@"passes-active");
    [v14 setSelectedImage:v16];

    [(PKTransactionDebugDetailsViewController *)v12 setTabBarItem:v14];
    [v13 addObject:v12];
    v17 = [[PKTransactionCloudKitDebugDetailsViewController alloc] initWithTransaction:*p_transaction];
    cloudKitViewController = v10->_cloudKitViewController;
    v10->_cloudKitViewController = v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4FB1CF8]);
    [v19 setTitle:@"CloudKit"];
    v20 = PKUIImageNamed(@"CloudTabBarItem");
    [v19 setImage:v20];

    [(PKTransactionCloudKitDebugDetailsViewController *)v10->_cloudKitViewController setTabBarItem:v19];
    [v13 addObject:v10->_cloudKitViewController];
    v21 = [[PKTransactionSpotlightDebugDetailsViewController alloc] initWithTransaction:*p_transaction];
    spotlightViewController = v10->_spotlightViewController;
    v10->_spotlightViewController = v21;

    id v23 = objc_alloc_init(MEMORY[0x1E4FB1CF8]);
    [v23 setTitle:@"Spotlight"];
    v24 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
    [v23 setImage:v24];

    [(PKTransactionSpotlightDebugDetailsViewController *)v10->_spotlightViewController setTabBarItem:v23];
    [v13 addObject:v10->_spotlightViewController];
    v25 = [v7 associatedReceiptUniqueID];

    if (v25)
    {
      v26 = [[PKTransactionReceiptDebugViewController alloc] initWithPaymentTransaction:v7];
      id v27 = objc_alloc(MEMORY[0x1E4FB1CF8]);
      v28 = [MEMORY[0x1E4FB1818] systemImageNamed:@"list.bullet"];
      uint64_t v29 = [v27 initWithTitle:@"Receipt" image:v28 selectedImage:0];

      [(PKTransactionReceiptDebugViewController *)v26 setTabBarItem:v29];
      [v13 addObject:v26];

      id v23 = (id)v29;
    }
    v30 = (void *)[v13 copy];
    [(PKTransactionDebugDetailsTabBarController *)v10 setViewControllers:v30];

    uint64_t v31 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:v10 action:sel__handleShareButton_];
    shareButton = v10->_shareButton;
    v10->_shareButton = (UIBarButtonItem *)v31;

    v33 = [(PKTransactionDebugDetailsTabBarController *)v10 navigationItem];
    [v33 setRightBarButtonItem:v10->_shareButton];
  }
  return v10;
}

- (void)_handleShareButton:(id)a3
{
  [(UIBarButtonItem *)self->_shareButton setEnabled:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [(PKPaymentTransaction *)self->_transaction identifier];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v33 = [NSString stringWithFormat:@"transaction_%@.txt", v6];
  id v8 = [v5 temporaryDirectory];
  v9 = [v8 URLByAppendingPathComponent:v33];

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke;
  v48[3] = &unk_1E59CF430;
  v48[4] = self;
  id v10 = v5;
  id v49 = v10;
  id v11 = v9;
  id v50 = v11;
  id v12 = v7;
  id v51 = v12;
  [v4 addOperation:v48];
  uint64_t v31 = (void *)v6;
  v32 = [NSString stringWithFormat:@"cloudRecordObject_%@.txt", v6];
  id v13 = [v10 temporaryDirectory];
  id v14 = [v13 URLByAppendingPathComponent:v32];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_2;
  v44[3] = &unk_1E59CF430;
  v44[4] = self;
  id v15 = v10;
  id v45 = v15;
  id v16 = v14;
  id v46 = v16;
  id v17 = v12;
  id v47 = v17;
  [v4 addOperation:v44];
  v18 = [NSString stringWithFormat:@"spotlight_%@.txt", v6];
  id v19 = [v15 temporaryDirectory];
  v20 = [v19 URLByAppendingPathComponent:v18];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_4;
  v40[3] = &unk_1E59CF430;
  v40[4] = self;
  id v21 = v15;
  id v41 = v21;
  id v22 = v20;
  id v42 = v22;
  id v23 = v17;
  id v43 = v23;
  [v4 addOperation:v40];
  v24 = [MEMORY[0x1E4F1CA98] null];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_6;
  v34[3] = &unk_1E59CF4D0;
  v34[4] = self;
  id v35 = v23;
  id v36 = v21;
  id v37 = v11;
  id v38 = v16;
  id v39 = v22;
  id v25 = v22;
  id v26 = v16;
  id v27 = v11;
  id v28 = v21;
  id v29 = v23;
  id v30 = (id)[v4 evaluateWithInput:v24 completion:v34];
}

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v12 = a3;
  uint64_t v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28D90];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 1224) dictionaryRepresentation];
  v9 = [v7 dataWithJSONObject:v8 options:0 error:0];

  id v10 = *(void **)(a1 + 40);
  id v11 = [*(id *)(a1 + 48) path];
  LODWORD(v10) = [v10 createFileAtPath:v11 contents:v9 attributes:0];

  if (v10) {
    [*(id *)(a1 + 56) addObject:*(void *)(a1 + 48)];
  }
  v6[2](v6, v12, 0);
}

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 1240);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_3;
  v12[3] = &unk_1E59CF458;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v16 = v6;
  id v17 = v7;
  id v15 = v9;
  id v10 = v6;
  id v11 = v7;
  [v8 cloudRecordObjectDescriptionWithCompletion:v12];
}

uint64_t __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 path];
  id v7 = [v5 dataUsingEncoding:4];

  LODWORD(v3) = [v3 createFileAtPath:v6 contents:v7 attributes:0];
  if (v3) {
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 40)];
  }
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v8();
}

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 1248);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_5;
  v12[3] = &unk_1E59CF458;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v16 = v6;
  id v17 = v7;
  id v15 = v9;
  id v10 = v6;
  id v11 = v7;
  [v8 spotlightObjectDescriptionWithCompletion:v12];
}

uint64_t __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 path];
  id v7 = [v5 dataUsingEncoding:4];

  LODWORD(v3) = [v3 createFileAtPath:v6 contents:v7 attributes:0];
  if (v3) {
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 40)];
  }
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v8();
}

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_6(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_7;
  v3[3] = &unk_1E59CF4A8;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_7(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [PKReprocessMerchantActivity alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 1224);
  id v5 = [*(id *)(v3 + 1232) paymentPass];
  id v6 = [(PKReprocessMerchantActivity *)v2 initWithTransaction:v4 paymentPass:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  uint64_t v8 = *(void *)(a1 + 40);
  v19[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v10 = (void *)[v7 initWithActivityItems:v8 applicationActivities:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_8;
  v14[3] = &unk_1E59CF480;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  [v10 setCompletionWithItemsHandler:v14];
  id v11 = [v10 popoverPresentationController];
  [v11 setBarButtonItem:*(void *)(*(void *)(a1 + 32) + 1216)];

  id v12 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_9;
  v13[3] = &unk_1E59CA7D0;
  v13[4] = v12;
  [v12 presentViewController:v10 animated:1 completion:v13];
}

uint64_t __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
  [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 48) error:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 removeItemAtURL:v3 error:0];
}

uint64_t __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_9(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1216) setEnabled:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_cloudKitViewController, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_shareButton, 0);
}

@end