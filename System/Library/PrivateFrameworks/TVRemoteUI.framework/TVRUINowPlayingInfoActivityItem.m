@interface TVRUINowPlayingInfoActivityItem
- (BOOL)shareShow;
- (NSItemProvider)imageItemProvider;
- (NSURLSession)urlSession;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVRCUTSMediaInfoRequest)mediaInfoRequest;
- (TVRUINowPlayingInfoActivityItem)initWithNowPlayingInfo:(id)a3 shareShow:(BOOL)a4;
- (id)_shareURL;
- (id)_subtitle;
- (id)_title;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (void)setImageItemProvider:(id)a3;
- (void)setMediaInfoRequest:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setShareShow:(BOOL)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation TVRUINowPlayingInfoActivityItem

- (TVRUINowPlayingInfoActivityItem)initWithNowPlayingInfo:(id)a3 shareShow:(BOOL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TVRUINowPlayingInfoActivityItem;
  v8 = [(TVRUINowPlayingInfoActivityItem *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nowPlayingInfo, a3);
    v9->_shareShow = a4;
    v10 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v10 setHTTPMaximumConnectionsPerHost:1];
    uint64_t v11 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v10];
    urlSession = v9->_urlSession;
    v9->_urlSession = (NSURLSession *)v11;
  }
  return v9;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F103D8]);
  v6 = [(TVRUINowPlayingInfoActivityItem *)self _shareURL];
  [v5 setURL:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F103B0]);
  v8 = [(TVRUINowPlayingInfoActivityItem *)self _title];
  [v7 setTitle:v8];

  v9 = [(TVRUINowPlayingInfoActivityItem *)self _subtitle];
  [v7 setSubtitle:v9];

  if ([(TVRUINowPlayingInfoActivityItem *)self shareShow])
  {
    objc_initWeak(&location, self);
    v10 = (NSItemProvider *)objc_alloc_init(MEMORY[0x263F088E0]);
    imageItemProvider = self->_imageItemProvider;
    self->_imageItemProvider = v10;

    v12 = self->_imageItemProvider;
    uint64_t v13 = objc_opt_class();
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke;
    v36[3] = &unk_264800610;
    objc_super v14 = &v37;
    objc_copyWeak(&v37, &location);
    [(NSItemProvider *)v12 registerObjectOfClass:v13 visibility:0 loadHandler:v36];
    id v15 = objc_alloc(MEMORY[0x263F103C0]);
    v16 = [(TVRUINowPlayingInfoActivityItem *)self imageItemProvider];
    v17 = (void *)[v15 initWithItemProvider:v16 properties:0 placeholderImage:0];

    [v7 setArtwork:v17];
  }
  else
  {
    v18 = [(TVRUINowPlayingInfoActivityItem *)self nowPlayingInfo];
    uint64_t v19 = [v18 imageData];
    if (v19)
    {
      v20 = (void *)v19;
      v21 = [(TVRUINowPlayingInfoActivityItem *)self nowPlayingInfo];
      v22 = [v21 imageDataIsPlaceholder];
      char v23 = [v22 BOOLValue];

      if ((v23 & 1) == 0)
      {
        id v24 = objc_alloc(MEMORY[0x263F103C0]);
        v25 = [(TVRUINowPlayingInfoActivityItem *)self nowPlayingInfo];
        v26 = [v25 imageData];
        v27 = (void *)[v24 initWithData:v26 MIMEType:@"image/png"];

        [v7 setArtwork:v27];
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_initWeak(&location, self);
    v28 = (NSItemProvider *)objc_alloc_init(MEMORY[0x263F088E0]);
    v29 = self->_imageItemProvider;
    self->_imageItemProvider = v28;

    v30 = self->_imageItemProvider;
    uint64_t v31 = objc_opt_class();
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_4;
    v34[3] = &unk_264800610;
    objc_super v14 = &v35;
    objc_copyWeak(&v35, &location);
    [(NSItemProvider *)v30 registerObjectOfClass:v31 visibility:0 loadHandler:v34];
    v32 = (void *)[objc_alloc(MEMORY[0x263F103C0]) initWithItemProvider:self->_imageItemProvider properties:0 placeholderImage:0];
    [v7 setArtwork:v32];
  }
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
LABEL_9:
  [v5 setSpecialization:v7];

  return v5;
}

uint64_t __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_alloc_init(MEMORY[0x263F7CA00]);
  [WeakRetained setMediaInfoRequest:v5];

  v6 = [WeakRetained mediaInfoRequest];
  id v7 = [WeakRetained nowPlayingInfo];
  v8 = [v7 metadata];
  v9 = [v8 showID];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_2;
  v12[3] = &unk_2648005E8;
  v12[4] = WeakRetained;
  id v13 = v3;
  id v10 = v3;
  [v6 requestForCanonicalID:v9 completion:v12];

  return 0;
}

void __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 imageURLTemplate];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F7C9C0];
    v6 = [v3 imageURLTemplate];
    id v7 = [v5 imageTemplateWithString:v6];

    v8 = objc_msgSend(v7, "urlForSize:", 384.0, 216.0);
    v9 = [*(id *)(a1 + 32) urlSession];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_3;
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

void __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

uint64_t __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained nowPlayingInfo];
  id v6 = [v5 metadata];
  id v7 = [v6 imageURLTemplate];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x263F7C9C0];
    v9 = [WeakRetained nowPlayingInfo];
    id v10 = [v9 metadata];
    uint64_t v11 = [v10 imageURLTemplate];
    id v12 = [v8 imageTemplateWithString:v11];

    id v13 = objc_msgSend(v12, "urlForSize:", 384.0, 216.0);
    objc_super v14 = [WeakRetained urlSession];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_5;
    v17[3] = &unk_2648005C0;
    id v18 = v3;
    id v15 = [v14 dataTaskWithURL:v13 completionHandler:v17];

    [v15 resume];
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }

  return 0;
}

void __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

- (id)_shareURL
{
  BOOL v3 = [(TVRUINowPlayingInfoActivityItem *)self shareShow];
  id v4 = [(TVRUINowPlayingInfoActivityItem *)self nowPlayingInfo];
  id v5 = [v4 metadata];
  id v6 = v5;
  if (v3) {
    [v5 showProductPageURL];
  }
  else {
  id v7 = [v5 productPageURL];
  }

  return v7;
}

- (id)_title
{
  v2 = [(TVRUINowPlayingInfoActivityItem *)self nowPlayingInfo];
  BOOL v3 = [v2 metadata];
  id v4 = [v3 title];

  return v4;
}

- (id)_subtitle
{
  BOOL v3 = [(TVRUINowPlayingInfoActivityItem *)self nowPlayingInfo];
  id v4 = [v3 metadata];
  if ([v4 kind] == 2)
  {
    BOOL v5 = [(TVRUINowPlayingInfoActivityItem *)self shareShow];

    if (v5)
    {
      id v6 = 0;
      goto LABEL_7;
    }
    v16 = NSString;
    BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"TVRUIEpisodeShareSubtitle" value:&stru_26DB4CAE0 table:@"Localizable"];
    v17 = [(TVRUINowPlayingInfoActivityItem *)self nowPlayingInfo];
    id v15 = [v17 metadata];
    id v7 = [v15 title];
    id v8 = [(TVRUINowPlayingInfoActivityItem *)self nowPlayingInfo];
    v9 = [v8 metadata];
    id v10 = [v9 seasonNumber];
    uint64_t v11 = [(TVRUINowPlayingInfoActivityItem *)self nowPlayingInfo];
    id v12 = [v11 metadata];
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

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaInfoRequest, 0);
  objc_storeStrong((id *)&self->_imageItemProvider, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

@end