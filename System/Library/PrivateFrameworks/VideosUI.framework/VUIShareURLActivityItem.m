@interface VUIShareURLActivityItem
- (NSURL)previewURL;
- (NSURL)shareURL;
- (VUIShareURLActivityItem)initWithURL:(id)a3 title:(id)a4 subtitle:(id)a5 imageURL:(id)a6;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setPreviewURL:(id)a3;
@end

@implementation VUIShareURLActivityItem

- (VUIShareURLActivityItem)initWithURL:(id)a3 title:(id)a4 subtitle:(id)a5 imageURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VUIShareURLActivityItem;
  v15 = [(VUIShareURLActivityItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_shareURL, a3);
    objc_storeStrong((id *)&v16->_title, a4);
    objc_storeStrong((id *)&v16->_subtitle, a5);
    objc_storeStrong((id *)&v16->_imageURL, a6);
  }

  return v16;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return self->_shareURL;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return self->_shareURL;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  [v5 setURL:self->_shareURL];
  [v5 setRemoteVideoURL:self->_previewURL];
  id v6 = objc_alloc_init(MEMORY[0x1E4F30A00]);
  [v6 setTitle:self->_title];
  [v6 setSubtitle:self->_subtitle];
  imageURL = self->_imageURL;
  if (imageURL)
  {
    v8 = [(NSURL *)imageURL absoluteString];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      objc_initWeak(&location, self);
      v10 = (NSItemProvider *)objc_alloc_init(MEMORY[0x1E4F28D78]);
      itemProvider = self->_itemProvider;
      self->_itemProvider = v10;

      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3032000000;
      v18[3] = __Block_byref_object_copy__12;
      v18[4] = __Block_byref_object_dispose__12;
      id v19 = 0;
      id v12 = self->_itemProvider;
      uint64_t v13 = objc_opt_class();
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__VUIShareURLActivityItem_activityViewControllerLinkPresentationMetadata___block_invoke;
      v16[3] = &unk_1E6DF8A08;
      objc_copyWeak(&v17, &location);
      v16[4] = v18;
      [(NSItemProvider *)v12 registerObjectOfClass:v13 visibility:0 loadHandler:v16];
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithItemProvider:self->_itemProvider properties:0 placeholderImage:0];
      [v6 setArtwork:v14];

      objc_destroyWeak(&v17);
      _Block_object_dispose(v18, 8);

      objc_destroyWeak(&location);
    }
  }
  [v5 setSpecialization:v6];

  return v5;
}

uint64_t __74__VUIShareURLActivityItem_activityViewControllerLinkPresentationMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained[4])
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA9CA0]);
    uint64_t v6 = WeakRetained[4];
    v7 = [MEMORY[0x1E4FA9CC8] sharedInstance];
    uint64_t v8 = [v5 initWithObject:v6 imageLoader:v7 groupType:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAllowsSubstitutionForOriginal:1];
    id v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__VUIShareURLActivityItem_activityViewControllerLinkPresentationMetadata___block_invoke_2;
    v13[3] = &unk_1E6DF89E0;
    id v14 = v3;
    [v11 setCompletionHandler:v13];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) load];
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }

  return 0;
}

void __74__VUIShareURLActivityItem_activityViewControllerLinkPresentationMetadata___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 uiImage];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end