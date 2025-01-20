@interface NEArticleLinkPresentationSource
+ (double)deviceScreenScaleFromPotentialBackgroundThread;
- (FCHeadlineProviding)headline;
- (LPLinkMetadata)linkMetadata;
- (NEArticleLinkPresentationSource)initWithHeadline:(id)a3 articleURL:(id)a4 selectedText:(id)a5;
- (NSString)selectedText;
- (NSURL)url;
- (id)thumbnailImageProviderFromHeadline:(id)a3;
- (id)titleFromHeadline:(id)a3;
@end

@implementation NEArticleLinkPresentationSource

- (NEArticleLinkPresentationSource)initWithHeadline:(id)a3 articleURL:(id)a4 selectedText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NEArticleLinkPresentationSource;
  v12 = [(NEArticleLinkPresentationSource *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_headline, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    uint64_t v14 = [v11 copy];
    selectedText = v13->_selectedText;
    v13->_selectedText = (NSString *)v14;
  }
  return v13;
}

- (LPLinkMetadata)linkMetadata
{
  v3 = [(NEArticleLinkPresentationSource *)self headline];
  v4 = [(NEArticleLinkPresentationSource *)self thumbnailImageProviderFromHeadline:v3];

  v5 = [NELinkMetadataSource alloc];
  v6 = [(NEArticleLinkPresentationSource *)self headline];
  v7 = [(NEArticleLinkPresentationSource *)self titleFromHeadline:v6];
  v8 = [(NEArticleLinkPresentationSource *)self url];
  id v9 = [(NEArticleLinkPresentationSource *)self selectedText];
  id v10 = [(NELinkMetadataSource *)v5 initWithTitle:v7 url:v8 imageProvider:v4 iconProvider:v4 selectedText:v9];

  id v11 = [(NELinkMetadataSource *)v10 linkMetadata];

  return (LPLinkMetadata *)v11;
}

- (id)titleFromHeadline:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 title];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [v3 sourceName];

    if (v6)
    {
      v7 = NSString;
      v8 = [v3 title];
      id v9 = [v3 sourceName];
      id v10 = [v7 stringWithFormat:@"%@ - %@", v8, v9];

      goto LABEL_9;
    }
  }
  id v11 = [v3 title];

  if (v11)
  {
    uint64_t v12 = [v3 title];
LABEL_8:
    id v10 = (__CFString *)v12;
    goto LABEL_9;
  }
  v13 = [v3 sourceName];

  if (v13)
  {
    uint64_t v12 = [v3 sourceName];
    goto LABEL_8;
  }
  id v10 = &stru_1F1C3AF18;
LABEL_9:

  return v10;
}

- (id)thumbnailImageProviderFromHeadline:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v5 = [(id)*MEMORY[0x1E4F44460] identifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke;
  v8[3] = &unk_1E6415880;
  id v9 = v3;
  id v6 = v3;
  [v4 registerItemForTypeIdentifier:v5 loadHandler:v8];

  return v4;
}

void __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  +[NEArticleLinkPresentationSource deviceScreenScaleFromPotentialBackgroundThread];
  v5 = v2;
  id v3 = v2;
  id v4 = (id)FCFetchThumbnailForHeadlineWithMinimumSize();
}

void __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke_3;
  v7[3] = &unk_1E6415830;
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1818];
  id v3 = [*(id *)(a1 + 32) filePath];
  id v4 = [v2 imageWithContentsOfFile:v3];
  UIImagePNGRepresentation(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (double)deviceScreenScaleFromPotentialBackgroundThread
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v2 scale];
    double v4 = v3;

    return v4;
  }
  else
  {
    if (deviceScreenScaleFromPotentialBackgroundThread_onceToken[0] != -1) {
      dispatch_once(deviceScreenScaleFromPotentialBackgroundThread_onceToken, &__block_literal_global);
    }
    return *(double *)&deviceScreenScaleFromPotentialBackgroundThread_screenScale;
  }
}

void __81__NEArticleLinkPresentationSource_deviceScreenScaleFromPotentialBackgroundThread__block_invoke()
{
  id v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v1 scale];
  deviceScreenScaleFromPotentialBackgroundThread_screenScale = v0;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end