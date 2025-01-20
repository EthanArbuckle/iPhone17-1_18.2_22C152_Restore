@interface TVRUIUpNextActivityItem
- (BOOL)shareShow;
- (NSItemProvider)imageItemProvider;
- (NSURLSession)urlSession;
- (TVRCUTSMediaInfoRequest)mediaInfoRequest;
- (TVRCUpNextInfo)upNextInfo;
- (TVRUIUpNextActivityItem)initWithUpNextInfo:(id)a3 upNextProvider:(id)a4 shareShow:(BOOL)a5;
- (TVRUIUpNextProviding)upNextProvider;
- (id)_shareURL;
- (id)_subtitle;
- (id)_title;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (void)setImageItemProvider:(id)a3;
- (void)setMediaInfoRequest:(id)a3;
- (void)setShareShow:(BOOL)a3;
- (void)setUpNextInfo:(id)a3;
- (void)setUpNextProvider:(id)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation TVRUIUpNextActivityItem

- (TVRUIUpNextActivityItem)initWithUpNextInfo:(id)a3 upNextProvider:(id)a4 shareShow:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TVRUIUpNextActivityItem;
  v11 = [(TVRUIUpNextActivityItem *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_upNextInfo, a3);
    objc_storeStrong((id *)&v12->_upNextProvider, a4);
    v12->_shareShow = a5;
    v13 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v13 setHTTPMaximumConnectionsPerHost:1];
    uint64_t v14 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v13];
    urlSession = v12->_urlSession;
    v12->_urlSession = (NSURLSession *)v14;
  }
  return v12;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F103D8]);
  v6 = [(TVRUIUpNextActivityItem *)self _shareURL];
  [v5 setURL:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F103B0]);
  v8 = [(TVRUIUpNextActivityItem *)self _title];
  [v7 setTitle:v8];

  id v9 = [(TVRUIUpNextActivityItem *)self _subtitle];
  [v7 setSubtitle:v9];

  if ([(TVRUIUpNextActivityItem *)self shareShow]
    && ([(TVRUIUpNextActivityItem *)self upNextInfo],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 mediaInfo],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 kind],
        v11,
        v10,
        v12 == 1))
  {
    objc_initWeak(&location, self);
    v13 = (NSItemProvider *)objc_alloc_init(MEMORY[0x263F088E0]);
    imageItemProvider = self->_imageItemProvider;
    self->_imageItemProvider = v13;

    v15 = self->_imageItemProvider;
    uint64_t v16 = objc_opt_class();
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke;
    v29[3] = &unk_264800610;
    objc_super v17 = &v30;
    objc_copyWeak(&v30, &location);
    [(NSItemProvider *)v15 registerObjectOfClass:v16 visibility:0 loadHandler:v29];
    id v18 = objc_alloc(MEMORY[0x263F103C0]);
    v19 = [(TVRUIUpNextActivityItem *)self imageItemProvider];
    v20 = (void *)[v18 initWithItemProvider:v19 properties:0 placeholderImage:0];

    [v7 setArtwork:v20];
  }
  else
  {
    objc_initWeak(&location, self);
    v21 = (NSItemProvider *)objc_alloc_init(MEMORY[0x263F088E0]);
    v22 = self->_imageItemProvider;
    self->_imageItemProvider = v21;

    v23 = self->_imageItemProvider;
    uint64_t v24 = objc_opt_class();
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_4;
    v27[3] = &unk_264800610;
    objc_super v17 = &v28;
    objc_copyWeak(&v28, &location);
    [(NSItemProvider *)v23 registerObjectOfClass:v24 visibility:0 loadHandler:v27];
    v25 = (void *)[objc_alloc(MEMORY[0x263F103C0]) initWithItemProvider:self->_imageItemProvider properties:0 placeholderImage:0];
    [v7 setArtwork:v25];
  }
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  [v5 setSpecialization:v7];

  return v5;
}

uint64_t __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_alloc_init(MEMORY[0x263F7CA00]);
  [WeakRetained setMediaInfoRequest:v5];

  v6 = [WeakRetained mediaInfoRequest];
  id v7 = [WeakRetained upNextInfo];
  v8 = [v7 mediaInfo];
  id v9 = [v8 showIdentifier];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_2;
  v12[3] = &unk_2648005E8;
  v12[4] = WeakRetained;
  id v13 = v3;
  id v10 = v3;
  [v6 requestForCanonicalID:v9 completion:v12];

  return 0;
}

void __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 imageURLTemplate];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F7C9C0];
    v6 = [v3 imageURLTemplate];
    id v7 = [v5 imageTemplateWithString:v6];

    v8 = objc_msgSend(v7, "urlForSize:", 384.0, 216.0);
    id v9 = [*(id *)(a1 + 32) urlSession];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_3;
    v11[3] = &unk_2648005C0;
    id v12 = *(id *)(a1 + 40);
    id v10 = [v9 dataTaskWithURL:v8 completionHandler:v11];

    [v10 resume];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  if ([v8 length])
  {
    id v7 = [MEMORY[0x263F827E8] imageWithData:v8];
  }
  else
  {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained upNextProvider];
  id v6 = [WeakRetained upNextInfo];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_5;
  v9[3] = &unk_2647FFF98;
  id v10 = v3;
  id v7 = v3;
  [v5 fetchImageForUpNextInfo:v6 completion:v9];

  return 0;
}

uint64_t __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_shareURL
{
  BOOL v3 = [(TVRUIUpNextActivityItem *)self shareShow];
  id v4 = [(TVRUIUpNextActivityItem *)self upNextInfo];
  id v5 = v4;
  if (v3) {
    [v4 shareShowURL];
  }
  else {
  id v6 = [v4 shareURL];
  }

  return v6;
}

- (id)_title
{
  v2 = [(TVRUIUpNextActivityItem *)self upNextInfo];
  BOOL v3 = [v2 mediaInfo];
  id v4 = [v3 title];

  return v4;
}

- (id)_subtitle
{
  BOOL v3 = [(TVRUIUpNextActivityItem *)self upNextInfo];
  id v4 = [v3 mediaInfo];
  if ([v4 kind] == 1)
  {
    BOOL v5 = [(TVRUIUpNextActivityItem *)self shareShow];

    if (v5)
    {
      id v6 = 0;
      goto LABEL_7;
    }
    uint64_t v16 = NSString;
    BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"TVRUIEpisodeShareSubtitle" value:&stru_26DB4CAE0 table:@"Localizable"];
    objc_super v17 = [(TVRUIUpNextActivityItem *)self upNextInfo];
    v15 = [v17 mediaInfo];
    id v7 = [v15 title];
    id v8 = [(TVRUIUpNextActivityItem *)self upNextInfo];
    id v9 = [v8 mediaInfo];
    id v10 = [v9 seasonNumber];
    v11 = [(TVRUIUpNextActivityItem *)self upNextInfo];
    id v12 = [v11 mediaInfo];
    id v13 = [v12 episodeNumber];
    id v6 = objc_msgSend(v16, "localizedStringWithFormat:", v4, v7, v10, v13);
  }
  else
  {
    id v6 = 0;
  }

LABEL_7:
  return v6;
}

- (TVRCUpNextInfo)upNextInfo
{
  return self->_upNextInfo;
}

- (void)setUpNextInfo:(id)a3
{
}

- (BOOL)shareShow
{
  return self->_shareShow;
}

- (void)setShareShow:(BOOL)a3
{
  self->_shareShow = a3;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (NSItemProvider)imageItemProvider
{
  return self->_imageItemProvider;
}

- (void)setImageItemProvider:(id)a3
{
}

- (TVRCUTSMediaInfoRequest)mediaInfoRequest
{
  return self->_mediaInfoRequest;
}

- (void)setMediaInfoRequest:(id)a3
{
}

- (TVRUIUpNextProviding)upNextProvider
{
  return self->_upNextProvider;
}

- (void)setUpNextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upNextProvider, 0);
  objc_storeStrong((id *)&self->_mediaInfoRequest, 0);
  objc_storeStrong((id *)&self->_imageItemProvider, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_upNextInfo, 0);
}

@end