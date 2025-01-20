@interface SFClipLinkBanner
+ (void)getClipLinkBannerForClipLink:(id)a3 openActionHandler:(id)a4 completionHandler:(id)a5;
- (SFAppSuggestionBannerDelegate)delegate;
- (SFClipLink)clipLink;
- (id)_initWithClipLink:(id)a3 openActionHandler:(id)a4;
- (id)overlayProvider;
- (void)setDelegate:(id)a3;
@end

@implementation SFClipLinkBanner

+ (void)getClipLinkBannerForClipLink:(id)a3 openActionHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__SFClipLinkBanner_getClipLinkBannerForClipLink_openActionHandler_completionHandler___block_invoke;
  v13[3] = &unk_1E54EBF48;
  id v14 = v7;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = v7;
  [v12 getClipAttributesWithCompletionHandler:v13];
}

void __85__SFClipLinkBanner_getClipLinkBannerForClipLink_openActionHandler_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clipName];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    id v5 = [[SFClipLinkBanner alloc] _initWithClipLink:*(void *)(a1 + 32) openActionHandler:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (id)_initWithClipLink:(id)a3 openActionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SFClipLinkBanner;
  id v9 = [(SFLinkBanner *)&v19 init];
  p_isa = (id *)&v9->super.super.super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clipLink, a3);
    [p_isa setOpenActionHandler:v8];
    id v11 = [v7 clipName];
    id v12 = [p_isa titleLabel];
    [v12 setText:v11];

    v13 = [v7 icon];
    id v14 = [p_isa icon];
    [v14 setImage:v13];

    id v15 = [p_isa[76] actionCaption];
    [p_isa setMessageLabelText:v15];

    id v16 = [v7 actionTitle];
    [p_isa setOpenButtonTitle:v16];

    v17 = p_isa;
  }

  return p_isa;
}

- (id)overlayProvider
{
  if ([(SFClipLink *)self->_clipLink siteRequestsShowCard]
    || +[SFOverlayProvider alwaysShowOverlayForDebug])
  {
    overlayProvider = self->_overlayProvider;
    if (!overlayProvider)
    {
      v4 = [SFOverlayProvider alloc];
      id v5 = [(SFClipLink *)self->_clipLink url];
      v6 = [(SFClipLink *)self->_clipLink bundleIdentifier];
      id v7 = [(SFOverlayProvider *)v4 initWithURL:v5 bundleIdentifier:v6];
      id v8 = self->_overlayProvider;
      self->_overlayProvider = v7;

      overlayProvider = self->_overlayProvider;
    }
    id v9 = overlayProvider;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (SFAppSuggestionBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SFAppSuggestionBannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFClipLink)clipLink
{
  return self->_clipLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipLink, 0);
  objc_destroyWeak((id *)&self->delegate);

  objc_storeStrong((id *)&self->_overlayProvider, 0);
}

@end