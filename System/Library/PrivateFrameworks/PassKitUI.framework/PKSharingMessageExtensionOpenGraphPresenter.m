@interface PKSharingMessageExtensionOpenGraphPresenter
+ (Class)messageClass;
+ (id)propertiesForMessage:(id)a3;
- (PKSharingMessageExtensionMessage)message;
- (PKSharingMessageExtensionOpenGraphPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4;
- (PKSharingMessageExtensionRenderer)renderer;
- (void)didTapMessage;
- (void)extensionWillAppear;
- (void)setMessage:(id)a3;
- (void)setRenderer:(id)a3;
- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5;
@end

@implementation PKSharingMessageExtensionOpenGraphPresenter

- (PKSharingMessageExtensionOpenGraphPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingMessageExtensionOpenGraphPresenter;
  v9 = [(PKSharingMessageExtensionOpenGraphPresenter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong((id *)&v10->_passLibrary, a4);
  }

  return v10;
}

+ (Class)messageClass
{
  return (Class)objc_opt_class();
}

- (PKSharingMessageExtensionMessage)message
{
  return (PKSharingMessageExtensionMessage *)self->_message;
}

- (void)setMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_message, a3);
  }
}

- (void)extensionWillAppear
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(PKSharingMessageExtensionOpenGraphMessage *)self->_message hasFetchedOpenGraphPreview])
  {
    BOOL v3 = [(PKSharingMessageExtensionOpenGraphMessage *)self->_message isFromMe];
    message = self->_message;
    if (v3)
    {
      id v5 = [(PKSharingMessageExtensionOpenGraphMessage *)self->_message urlRepresentation];
      v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v5 host];
        *(_DWORD *)buf = 138412290;
        v19 = v7;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: fetching open graph preview for: '%@'...", buf, 0xCu);
      }
      id v8 = objc_alloc_init(MEMORY[0x1E4F30AB8]);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __66__PKSharingMessageExtensionOpenGraphPresenter_extensionWillAppear__block_invoke;
      v16[3] = &unk_1E59D2ED8;
      v16[4] = self;
      id v17 = v8;
      id v9 = v8;
      [v9 startFetchingMetadataForURL:v5 completionHandler:v16];
    }
    else
    {
      v10 = PKLocalizedShareableCredentialString(&cfstr_SharePreviewSu.isa);
      [(PKSharingMessageExtensionOpenGraphMessage *)message setTitle:v10];

      v11 = self->_message;
      objc_super v12 = (void *)MEMORY[0x1E4FB1818];
      v13 = PKPassKitUIBundle();
      v14 = [v12 imageNamed:@"Generic-Shared-Key" inBundle:v13];
      [(PKSharingMessageExtensionOpenGraphMessage *)v11 setThumbnail:v14];

      [(PKSharingMessageExtensionOpenGraphMessage *)self->_message setHasFetchedOpenGraphPreview:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
      [WeakRetained messageDidUpdate];
    }
  }
}

void __66__PKSharingMessageExtensionOpenGraphPresenter_extensionWillAppear__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKSharingMessageExtensionOpenGraphPresenter_extensionWillAppear__block_invoke_2;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __66__PKSharingMessageExtensionOpenGraphPresenter_extensionWillAppear__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "iMessage Extension: received metadata %@", (uint8_t *)&v12, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 24) setHasFetchedOpenGraphPreview:1];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 40) + 24);
    v6 = [v4 title];
    [v5 setTitle:v6];

    id v7 = [*(id *)(a1 + 32) image];
    uint64_t v8 = [v7 data];

    if (v8)
    {
      id v9 = *(void **)(*(void *)(a1 + 40) + 24);
      v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v8];
      [v9 setThumbnail:v10];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  [WeakRetained messageDidUpdate];
}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v5 = a5;
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: validateForRecipients called for open graph presenter. This shouldn't happen", v7, 2u);
  }

  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void)didTapMessage
{
  if (![(PKSharingMessageExtensionOpenGraphMessage *)self->_message isFromMe])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
    uint64_t v3 = [(PKSharingMessageExtensionOpenGraphMessage *)self->_message urlRepresentation];
    [WeakRetained openAppURL:v3];
  }
}

+ (id)propertiesForMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  id v5 = [v3 title];
  if (v5)
  {
    [(PKSharingMessageExtensionViewProperties *)v4 setTitle:v5];
  }
  else
  {
    v6 = PKLocalizedString(&cfstr_Wallet_0.isa);
    [(PKSharingMessageExtensionViewProperties *)v4 setTitle:v6];
  }
  id v7 = [v3 subtitle];
  [(PKSharingMessageExtensionViewProperties *)v4 setSubtitle:v7];

  uint64_t v8 = [v3 thumbnail];
  [(PKSharingMessageExtensionViewProperties *)v4 setCardImage:v8];

  if (([v3 isFromMe] & 1) == 0)
  {
    id v9 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_0.isa);
    [(PKSharingMessageExtensionViewProperties *)v4 setButtonText:v9];
  }

  return v4;
}

- (PKSharingMessageExtensionRenderer)renderer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);

  return (PKSharingMessageExtensionRenderer *)WeakRetained;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderer);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);

  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end