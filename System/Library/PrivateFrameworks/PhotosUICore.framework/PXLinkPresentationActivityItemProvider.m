@interface PXLinkPresentationActivityItemProvider
- (PXLinkPresentationActivityItemProvider)initWithConfiguration:(id)a3;
- (PXLinkPresentationConfiguration)configuration;
- (id)_linkMetadataForConfiguration:(id)a3;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
@end

@implementation PXLinkPresentationActivityItemProvider

- (void).cxx_destruct
{
}

- (PXLinkPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  v4 = [(PXLinkPresentationActivityItemProvider *)self configuration];
  v5 = [(PXLinkPresentationActivityItemProvider *)self _linkMetadataForConfiguration:v4];

  return v5;
}

- (id)_linkMetadataForConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F309E8]);
  objc_msgSend(v4, "setPhotoCount:", objc_msgSend(v3, "photoCount"));
  objc_msgSend(v4, "setVideoCount:", objc_msgSend(v3, "videoCount"));
  objc_msgSend(v4, "setOtherItemCount:", objc_msgSend(v3, "otherItemCount"));
  v5 = [v3 expirationDate];
  if (v5)
  {
    [v4 setExpirationDate:v5];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v4 setExpirationDate:v6];
  }
  v7 = [v3 earliestAssetDate];
  [v4 setEarliestAssetDate:v7];

  v8 = [v3 latestAssetDate];
  [v4 setLatestAssetDate:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  [v9 setSpecialization:v4];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  uint64_t v11 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PXLinkPresentationActivityItemProvider__linkMetadataForConfiguration___block_invoke;
  v17[3] = &unk_1E5DCD860;
  id v12 = v3;
  id v18 = v12;
  [v10 registerObjectOfClass:v11 visibility:0 loadHandler:v17];
  v13 = [v12 placeholderImage];
  if (v13) {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v13];
  }
  else {
    v14 = 0;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithItemProvider:v10 properties:0 placeholderImage:v14];
  [v9 setImage:v15];

  return v9;
}

void __72__PXLinkPresentationActivityItemProvider__linkMetadataForConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  PLPhysicalScreenScale();
  PXSizeScale();
}

void __72__PXLinkPresentationActivityItemProvider__linkMetadataForConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "PXLinkPresentationActivityItemProvider: Error fetching thumbnail image data: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (PXLinkPresentationActivityItemProvider)initWithConfiguration:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXLinkPresentationActivityItemProvider.m", 49, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXLinkPresentationActivityItemProvider;
  int v7 = [(PXLinkPresentationActivityItemProvider *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_configuration, a3);
  }

  return v8;
}

@end