@interface SearchUIDefaultPunchoutAppIconImage
- (BOOL)isEqual:(id)a3;
- (FPItemID)fpItemID;
- (NSURL)url;
- (SearchUIDefaultPunchoutAppIconImage)initWithFileProviderId:(id)a3 coreSpotlightId:(id)a4 variant:(unint64_t)a5;
- (SearchUIDefaultPunchoutAppIconImage)initWithSFImage:(id)a3 variant:(unint64_t)a4;
- (SearchUIDefaultPunchoutAppIconImage)initWithURL:(id)a3 variant:(unint64_t)a4;
- (SearchUIImage)wrappedImage;
- (id)defaultApplicationFetchQueue;
- (unint64_t)hash;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)loadRelatedAppIconImageForFileURL:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5 completionHandler:(id)a6;
- (void)setFpItemID:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWrappedImage:(id)a3;
@end

@implementation SearchUIDefaultPunchoutAppIconImage

- (SearchUIDefaultPunchoutAppIconImage)initWithSFImage:(id)a3 variant:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 punchout];
  v8 = [v7 urls];
  v9 = [v8 firstObject];

  if (!v9)
  {
    v11 = [v6 fileProviderIdentifier];
    if ([v11 length])
    {
      v12 = [v6 coreSpotlightIdentifier];
      uint64_t v13 = [v12 length];

      if (v13)
      {
        v14 = [v6 fileProviderIdentifier];
        v15 = [v6 coreSpotlightIdentifier];
        self = [(SearchUIDefaultPunchoutAppIconImage *)self initWithFileProviderId:v14 coreSpotlightId:v15 variant:a4];

        v10 = self;
        goto LABEL_8;
      }
    }
    else
    {
    }
    v10 = 0;
    goto LABEL_8;
  }
  self = [(SearchUIDefaultPunchoutAppIconImage *)self initWithURL:v9 variant:a4];
  v10 = self;
LABEL_8:

  return v10;
}

- (SearchUIDefaultPunchoutAppIconImage)initWithURL:(id)a3 variant:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIDefaultPunchoutAppIconImage;
  v7 = [(SearchUIAppIconImage *)&v10 initWithBundleIdentifier:0 variant:a4 contentType:0];
  v8 = v7;
  if (v7) {
    [(SearchUIDefaultPunchoutAppIconImage *)v7 setUrl:v6];
  }

  return v8;
}

- (SearchUIDefaultPunchoutAppIconImage)initWithFileProviderId:(id)a3 coreSpotlightId:(id)a4 variant:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SearchUIDefaultPunchoutAppIconImage;
  objc_super v10 = [(SearchUIAppIconImage *)&v14 initWithBundleIdentifier:0 variant:a5 contentType:0];
  if (!v10
    || (+[SearchUIUtilities fileProviderItemIDForCoreSpotlightIdentifier:v9 fileProviderIdentifier:v8], v11 = objc_claimAutoreleasedReturnValue(), [(SearchUIDefaultPunchoutAppIconImage *)v10 setFpItemID:v11], v11, [(SearchUIDefaultPunchoutAppIconImage *)v10 fpItemID], v12 = (SearchUIDefaultPunchoutAppIconImage *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v12 = v10;
  }

  return v12;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(SearchUIDefaultPunchoutAppIconImage *)self url];

  if (v9)
  {
    objc_super v10 = [(SearchUIDefaultPunchoutAppIconImage *)self url];
    [(SearchUIDefaultPunchoutAppIconImage *)self loadRelatedAppIconImageForFileURL:v10 scale:v5 isDarkStyle:v8 completionHandler:a3];
  }
  else
  {
    v11 = [(SearchUIDefaultPunchoutAppIconImage *)self fpItemID];

    if (v11)
    {
      objc_initWeak(&location, self);
      v12 = [MEMORY[0x1E4F25D38] defaultManager];
      uint64_t v13 = [(SearchUIDefaultPunchoutAppIconImage *)self fpItemID];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __88__SearchUIDefaultPunchoutAppIconImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
      v14[3] = &unk_1E6E738A8;
      objc_copyWeak(v16, &location);
      v16[1] = *(id *)&a3;
      BOOL v17 = v5;
      id v15 = v8;
      [v12 fetchURLForItemID:v13 completionHandler:v14];

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void, uint64_t))v8 + 2))(v8, 0, 1);
    }
  }
}

void __88__SearchUIDefaultPunchoutAppIconImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained loadRelatedAppIconImageForFileURL:v4 scale:*(unsigned __int8 *)(a1 + 56) isDarkStyle:*(void *)(a1 + 32) completionHandler:*(double *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)defaultApplicationFetchQueue
{
  if (defaultApplicationFetchQueue_onceToken != -1) {
    dispatch_once(&defaultApplicationFetchQueue_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)defaultApplicationFetchQueue_queue;
  return v2;
}

void __67__SearchUIDefaultPunchoutAppIconImage_defaultApplicationFetchQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.searchui.DefaultPunchoutApplication", attr);
  v2 = (void *)defaultApplicationFetchQueue_queue;
  defaultApplicationFetchQueue_queue = (uint64_t)v1;
}

- (void)loadRelatedAppIconImageForFileURL:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  v12 = [(SearchUIDefaultPunchoutAppIconImage *)self wrappedImage];

  if (v12)
  {
    uint64_t v13 = [(SearchUIDefaultPunchoutAppIconImage *)self wrappedImage];
    [v13 loadImageWithScale:v7 isDarkStyle:v11 completionHandler:a4];
  }
  else
  {
    objc_initWeak(&location, self);
    objc_super v14 = [(SearchUIDefaultPunchoutAppIconImage *)self defaultApplicationFetchQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __109__SearchUIDefaultPunchoutAppIconImage_loadRelatedAppIconImageForFileURL_scale_isDarkStyle_completionHandler___block_invoke;
    v15[3] = &unk_1E6E73790;
    objc_copyWeak(v18, &location);
    id v16 = v10;
    v18[1] = *(id *)&a4;
    BOOL v19 = v7;
    id v17 = v11;
    dispatch_async(v14, v15);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

void __109__SearchUIDefaultPunchoutAppIconImage_loadRelatedAppIconImageForFileURL_scale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (IDSBAASignerErrorDomain_block_invoke_onceToken_0 != -1) {
    dispatch_once(&IDSBAASignerErrorDomain_block_invoke_onceToken_0, &__block_literal_global_9);
  }
  v2 = [MEMORY[0x1E4F9F2F8] interactionControllerWithURL:*(void *)(a1 + 32)];
  v3 = [v2 _defaultApplication];
  if ([v3 supportsOpenInPlace])
  {
    id v4 = [v3 bundleIdentifier];

    if (v4)
    {
      id v4 = [v3 bundleIdentifier];
      if (v4)
      {
        if (([(id)IDSBAASignerErrorDomain_block_invoke_disabledBundleIDs containsObject:v4] & 1) == 0)
        {
          uint64_t v5 = [WeakRetained variant];
          id v6 = [WeakRetained contentType];
          BOOL v7 = +[SearchUIAppIconImage appIconForBundleIdentifier:v4 variant:v5 contentType:v6];

          [WeakRetained setWrappedImage:v7];
          [v7 loadImageWithScale:*(unsigned __int8 *)(a1 + 64) isDarkStyle:*(void *)(a1 + 40) completionHandler:*(double *)(a1 + 56)];

          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_10:
}

void __109__SearchUIDefaultPunchoutAppIconImage_loadRelatedAppIconImageForFileURL_scale_isDarkStyle_completionHandler___block_invoke_2()
{
  v0 = objc_opt_new();
  id v2 = +[SearchUIUtilities bundleIdentifierForApp:6];
  if (v2) {
    [v0 addObject:v2];
  }
  dispatch_queue_t v1 = (void *)IDSBAASignerErrorDomain_block_invoke_disabledBundleIDs;
  IDSBAASignerErrorDomain_block_invoke_disabledBundleIDs = (uint64_t)v0;
}

- (BOOL)isEqual:(id)a3
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SearchUIDefaultPunchoutAppIconImage;
  if (![(SearchUIAppIconImage *)&v19 isEqual:v8]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v12 = 0;
    goto LABEL_26;
  }
  id v9 = v8;
  id v10 = [(SearchUIDefaultPunchoutAppIconImage *)self url];
  if (v10
    && ([(SearchUIDefaultPunchoutAppIconImage *)self url],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v9 url],
        id v4 = objc_claimAutoreleasedReturnValue(),
        ([v3 isEqual:v4] & 1) != 0))
  {
    int v11 = 0;
  }
  else
  {
    uint64_t v13 = [(SearchUIDefaultPunchoutAppIconImage *)self url];
    if (v13)
    {
      BOOL v12 = 0;
LABEL_22:

      goto LABEL_23;
    }
    objc_super v14 = [v9 url];
    if (v14)
    {

      BOOL v12 = 0;
      goto LABEL_23;
    }
    int v11 = 1;
  }
  id v15 = [(SearchUIDefaultPunchoutAppIconImage *)self fpItemID];
  if (v15)
  {
    uint64_t v5 = [(SearchUIDefaultPunchoutAppIconImage *)self fpItemID];
    id v6 = [v9 fpItemID];
    if ([v5 isEqual:v6])
    {
      BOOL v12 = 1;
      goto LABEL_17;
    }
  }
  id v16 = [(SearchUIDefaultPunchoutAppIconImage *)self fpItemID];
  if (v16)
  {

    BOOL v12 = 0;
    if (v15) {
      goto LABEL_17;
    }
  }
  else
  {
    id v17 = [v9 fpItemID];
    BOOL v12 = v17 == 0;

    if (v15)
    {
LABEL_17:

      if ((v11 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }
  if (v11)
  {
LABEL_21:
    uint64_t v13 = 0;
    goto LABEL_22;
  }
LABEL_23:
  if (v10)
  {
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(SearchUIDefaultPunchoutAppIconImage *)self url];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(SearchUIDefaultPunchoutAppIconImage *)self fpItemID];
  uint64_t v6 = [v5 hash] ^ v4;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIDefaultPunchoutAppIconImage;
  unint64_t v7 = v6 ^ [(SearchUIAppIconImage *)&v9 hash];

  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (FPItemID)fpItemID
{
  return self->_fpItemID;
}

- (void)setFpItemID:(id)a3
{
}

- (SearchUIImage)wrappedImage
{
  return self->_wrappedImage;
}

- (void)setWrappedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedImage, 0);
  objc_storeStrong((id *)&self->_fpItemID, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end