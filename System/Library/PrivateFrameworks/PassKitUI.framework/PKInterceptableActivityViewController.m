@interface PKInterceptableActivityViewController
- (PKInterceptableActivityViewController)initWithItems:(id)a3 delegate:(id)a4;
- (PKInterceptableActivityViewController)initWithItems:(id)a3 peopleSuggestionBundleIds:(id)a4 delegate:(id)a5;
- (PKInterceptableActivityViewControllerDelegate)delegate;
- (id)selectedRecipientWithOutContactIdentifier:(id *)a3;
- (void)_performActivity:(id)a3;
- (void)activityViewController:(id)a3 willStartAirdropTransferToRecipient:(id)a4 contactIdentifier:(id)a5;
- (void)activityViewControllerDidFinishAirdropTransfer:(id)a3;
- (void)activityViewControllerWillStartAirdropTransfer:(id)a3;
- (void)handleInterceptedShareActivity;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PKInterceptableActivityViewController

- (PKInterceptableActivityViewController)initWithItems:(id)a3 delegate:(id)a4
{
  return [(PKInterceptableActivityViewController *)self initWithItems:a3 peopleSuggestionBundleIds:0 delegate:a4];
}

- (PKInterceptableActivityViewController)initWithItems:(id)a3 peopleSuggestionBundleIds:(id)a4 delegate:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(PKMessageExtensionActivityItem);
  v23[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v22.receiver = self;
  v22.super_class = (Class)PKInterceptableActivityViewController;
  v13 = [(PKInterceptableActivityViewController *)&v22 initWithActivityItems:v8 applicationActivities:v12 peopleSuggestionBundleIds:v9];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_initWeak(&location, v14);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __90__PKInterceptableActivityViewController_initWithItems_peopleSuggestionBundleIds_delegate___block_invoke;
    v19 = &unk_1E59E0268;
    objc_copyWeak(&v20, &location);
    [(PKInterceptableActivityViewController *)v14 setCompletionWithItemsHandler:&v16];
    -[PKInterceptableActivityViewController setExcludedActivityTypes:](v14, "setExcludedActivityTypes:", 0, v16, v17, v18, v19);
    [(PKInterceptableActivityViewController *)v14 setAirDropDelegate:v14];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __90__PKInterceptableActivityViewController_initWithItems_peopleSuggestionBundleIds_delegate___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 1344))
  {
    id v8 = (void *)*MEMORY[0x1E4F9F348];
    id v9 = v5;
    id v10 = v8;
    v11 = v10;
    if (v10 == v9)
    {
      int v12 = 0;
    }
    else
    {
      int v12 = 1;
      if (v9 && v10) {
        int v12 = [v9 isEqualToString:v10] ^ 1;
      }
    }

    uint64_t v13 = v12 & a3;
    v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = @"No";
      if (v13) {
        v15 = @"Yes";
      }
      int v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet did finish with completed: %@", (uint8_t *)&v17, 0xCu);
    }

    id v16 = objc_loadWeakRetained(v7 + 171);
    [v16 interceptableActivityViewController:v7 didFinishWithShare:v13];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKInterceptableActivityViewController;
  [(PKInterceptableActivityViewController *)&v7 viewDidDisappear:a3];
  if (self->_isSendingOverAirdrop)
  {
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet did finish from 'viewWillDisappear'", v6, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained interceptableActivityViewController:self didFinishWithShare:0];
  }
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PKInterceptableActivityViewController;
  [(PKInterceptableActivityViewController *)&v3 loadView];
  [(PKInterceptableActivityViewController *)self setSharingStyle:1];
}

- (void)setExcludedActivityTypes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E4F9F360], *MEMORY[0x1E4F9F350], *MEMORY[0x1E4F9F340], 0);
  objc_super v7 = v6;
  if (v4) {
    [v6 addObjectsFromArray:v4];
  }
  v8.receiver = self;
  v8.super_class = (Class)PKInterceptableActivityViewController;
  [(PKInterceptableActivityViewController *)&v8 setExcludedActivityTypes:v7];
}

- (id)selectedRecipientWithOutContactIdentifier:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  airdropRecipientName = self->_airdropRecipientName;
  if (*(_OWORD *)&self->_airdropRecipientName == 0)
  {
    id v10 = 0;
  }
  else
  {
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      int v12 = airdropRecipientName;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet: returning cached airdrop recipient %@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = self->_airdropRecipientName;
    *a3 = self->_airdropRecipientContactIdentifier;
    objc_super v7 = self->_airdropRecipientName;
    self->_airdropRecipientName = 0;

    airdropRecipientContactIdentifier = self->_airdropRecipientContactIdentifier;
    self->_airdropRecipientContactIdentifier = 0;
  }

  return v10;
}

- (void)handleInterceptedShareActivity
{
  airdropRecipientName = self->_airdropRecipientName;
  self->_airdropRecipientName = 0;

  defferedActivity = self->_defferedActivity;
  p_super = PKLogFacilityTypeGetObject();
  BOOL v6 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (defferedActivity)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, p_super, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet handling intercepted share activity.", buf, 2u);
    }

    objc_super v7 = self->_defferedActivity;
    v8.receiver = self;
    v8.super_class = (Class)PKInterceptableActivityViewController;
    [(PKInterceptableActivityViewController *)&v8 _performActivity:v7];
    p_super = &self->_defferedActivity->super;
    self->_defferedActivity = 0;
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, p_super, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet attempted to handle intercepted share activity, but no activity found.", buf, 2u);
  }
}

- (void)_performActivity:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  self->_isSendingOverAirdrop = 0;
  BOOL v6 = [v5 activityType];
  objc_super v7 = [(PKInterceptableActivityViewController *)self excludedActivityTypes];
  int v8 = [v7 containsObject:v6];

  id v9 = PKLogFacilityTypeGetObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      objc_super v22 = v6;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet blocking share over %@", buf, 0xCu);
    }

    int v11 = (void *)MEMORY[0x1E4FB1418];
    int v12 = PKLocalizedShareableCredentialString(&cfstr_ShareInitiatio_8.isa);
    uint64_t v13 = PKLocalizedShareableCredentialString(&cfstr_ShareInitiatio_9.isa);
    v14 = [v11 alertControllerWithTitle:v12 message:v13 preferredStyle:1];

    v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    int v17 = [v15 actionWithTitle:v16 style:0 handler:0];
    [v14 addAction:v17];

    [(PKInterceptableActivityViewController *)self presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      objc_super v22 = v6;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet intercepting share activity of type %@", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v19 = [WeakRetained interceptableActivityViewController:self shouldInterceptActivitySelectionOfType:v6];

    if (!v19)
    {
      v20.receiver = self;
      v20.super_class = (Class)PKInterceptableActivityViewController;
      [(PKInterceptableActivityViewController *)&v20 _performActivity:v5];
      goto LABEL_11;
    }
    objc_storeStrong((id *)&self->_defferedActivity, a3);
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 interceptableActivityViewController:self didInterceptActivitySelectionOfType:v6];
  }

LABEL_11:
}

- (void)activityViewControllerWillStartAirdropTransfer:(id)a3
{
  self->_isSendingOverAirdrop = 1;
  airdropRecipientName = self->_airdropRecipientName;
  self->_airdropRecipientName = 0;
}

- (void)activityViewControllerDidFinishAirdropTransfer:(id)a3
{
  self->_isSendingOverAirdrop = 0;
  airdropRecipientName = self->_airdropRecipientName;
  self->_airdropRecipientName = 0;

  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet did finish airdrop transfer", v7, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained interceptableActivityViewController:self didFinishWithShare:1];
}

- (void)activityViewController:(id)a3 willStartAirdropTransferToRecipient:(id)a4 contactIdentifier:(id)a5
{
  objc_super v7 = (NSString *)a4;
  int v8 = (NSString *)a5;
  airdropRecipientName = self->_airdropRecipientName;
  self->_airdropRecipientName = v7;
  int v11 = v7;

  airdropRecipientContactIdentifier = self->_airdropRecipientContactIdentifier;
  self->_airdropRecipientContactIdentifier = v8;
}

- (PKInterceptableActivityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKInterceptableActivityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_airdropRecipientContactIdentifier, 0);
  objc_storeStrong((id *)&self->_airdropRecipientName, 0);

  objc_storeStrong((id *)&self->_defferedActivity, 0);
}

@end