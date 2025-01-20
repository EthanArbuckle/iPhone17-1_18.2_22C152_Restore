@interface NSSArticleInternal
+ (BOOL)coreSpotlightIdentifierRepresentsArticleIdentifier:(id)a3;
+ (id)imageWithURL:(id)a3;
+ (void)_articleFromCoreSpotlightIdentifier:(id)a3 domain:(id)a4 completion:(id)a5;
+ (void)articleFromCoreSpotlightIdentifier:(id)a3 completion:(id)a4;
+ (void)articleFromNotification:(id)a3 completion:(id)a4;
+ (void)articleFromNotificationUserInfo:(id)a3 thumbnailFileURL:(id)a4 publisherLogoFileURL:(id)a5 publisherLogoMaskFileURL:(id)a6 completion:(id)a7;
- (NSDate)publishDate;
- (NSSArticleInternal)init;
- (NSSArticleInternal)initWithCoder:(id)a3;
- (NSSArticleInternal)initWithThumbnailImage:(id)a3 title:(id)a4 shortExcerpt:(id)a5 publishDate:(id)a6 publisherName:(id)a7 publisherLogoImage:(id)a8 publisherLogoMaskImage:(id)a9;
- (NSString)publisherName;
- (NSString)shortExcerpt;
- (NSString)title;
- (UIImage)publisherLogoImage;
- (UIImage)publisherLogoMaskImage;
- (UIImage)thumbnailImage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSArticleInternal

+ (void)articleFromNotification:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v32 = a4;
  v6 = [v5 request];
  v7 = [v6 content];
  v8 = [v7 userInfo];

  v30 = v8;
  v29 = [v8 objectForKeyedSubscript:@"news"];
  v33 = v5;
  v9 = [v5 request];
  v10 = [v9 content];
  v11 = [v10 attachments];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    v34 = 0;
    v35 = 0;
    v15 = 0;
    uint64_t v16 = *(void *)v37;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v19 = [v18 identifier];
        int v20 = [v19 isEqualToString:@"thumbnail-attachment"];

        if (v20)
        {
          uint64_t v21 = [v18 URL];
          v22 = v15;
          v15 = (void *)v21;
        }
        else
        {
          v23 = [v18 identifier];
          int v24 = [v23 isEqualToString:@"publisherLogo-attachment"];

          if (v24)
          {
            uint64_t v25 = [v18 URL];
            v22 = v35;
            v35 = (void *)v25;
          }
          else
          {
            v26 = [v18 identifier];
            int v27 = [v26 isEqualToString:@"publisherLogoMask-attachment"];

            if (!v27) {
              continue;
            }
            uint64_t v28 = [v18 URL];
            v22 = v34;
            v34 = (void *)v28;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v14) {
        goto LABEL_17;
      }
    }
  }
  v34 = 0;
  v35 = 0;
  v15 = 0;
LABEL_17:

  [a1 articleFromNotificationUserInfo:v29 thumbnailFileURL:v15 publisherLogoFileURL:v35 publisherLogoMaskFileURL:v34 completion:v32];
}

+ (void)articleFromNotificationUserInfo:(id)a3 thumbnailFileURL:(id)a4 publisherLogoFileURL:(id)a5 publisherLogoMaskFileURL:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void *))a7;
  v17 = [v12 objectForKeyedSubscript:@"ti"];
  v18 = [v12 objectForKeyedSubscript:@"ex"];
  v19 = [v12 objectForKeyedSubscript:@"pd"];
  [v19 doubleValue];
  double v21 = v20;

  if (v21 <= 0.0)
  {
    v31 = 0;
  }
  else
  {
    v31 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21];
  }
  v35 = [v12 objectForKeyedSubscript:@"pn"];
  v22 = [v12 objectForKeyedSubscript:@"td"];
  v33 = v13;
  if (v22)
  {
    uint64_t v23 = [MEMORY[0x1E4F42A80] imageWithData:v22];
  }
  else
  {
    if (!v13)
    {
      v34 = 0;
      if (v14) {
        goto LABEL_9;
      }
      goto LABEL_11;
    }
    uint64_t v23 = [(id)objc_opt_class() imageWithURL:v13];
  }
  v34 = (void *)v23;
  if (v14)
  {
LABEL_9:
    int v24 = [(id)objc_opt_class() imageWithURL:v14];
    goto LABEL_12;
  }
LABEL_11:
  int v24 = 0;
LABEL_12:
  id v32 = v15;
  if (v15)
  {
    [(id)objc_opt_class() imageWithURL:v15];
    uint64_t v25 = v18;
    v26 = v17;
    int v27 = v16;
    v29 = id v28 = v14;
    id v15 = [v29 imageWithRenderingMode:2];

    id v14 = v28;
    uint64_t v16 = v27;
    v17 = v26;
    v18 = v25;
  }
  v30 = (void *)[objc_alloc((Class)a1) initWithThumbnailImage:v34 title:v17 shortExcerpt:v18 publishDate:v31 publisherName:v35 publisherLogoImage:v24 publisherLogoMaskImage:v15];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v16) {
      v16[2](v16, v30);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __128__NSSArticleInternal_articleFromNotificationUserInfo_thumbnailFileURL_publisherLogoFileURL_publisherLogoMaskFileURL_completion___block_invoke;
    block[3] = &unk_1E6D3F770;
    long long v38 = v16;
    id v37 = v30;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __128__NSSArticleInternal_articleFromNotificationUserInfo_thumbnailFileURL_publisherLogoFileURL_publisherLogoMaskFileURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

+ (id)imageWithURL:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 startAccessingSecurityScopedResource])
  {
    id v5 = (void *)MEMORY[0x1E4F1C9B8];
    v6 = [v4 path];
    v7 = [v5 dataWithContentsOfFile:v6];

    v8 = [MEMORY[0x1E4F42A80] imageWithData:v7];
    [v4 stopAccessingSecurityScopedResource];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)coreSpotlightIdentifierRepresentsArticleIdentifier:(id)a3
{
  return [a3 hasPrefix:@"A"];
}

+ (void)_articleFromCoreSpotlightIdentifier:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8 && v9)
  {
    id v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_2;
    block[3] = &unk_1E6D3F838;
    id v13 = &v15;
    id v15 = v9;
    id v16 = v8;
    id v18 = a1;
    id v17 = v11;
    dispatch_async(v12, block);

LABEL_6:
    goto LABEL_7;
  }
  if (v10)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke;
    v19[3] = &unk_1E6D3F798;
    id v13 = &v20;
    id v20 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v19);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_2(uint64_t a1)
{
  v2 = [NSString stringWithFormat:@"%@ == \"%@\", @"domainIdentifier"", *(void *)(a1 + 32)];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  double v21 = __Block_byref_object_dispose_;
  id v22 = (id)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v2 attributes:&unk_1F3B543F8];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  id v16 = 0;
  id v3 = (void *)v18[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_31;
  v11[3] = &unk_1E6D3F7C0;
  id v13 = v15;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v12 = v4;
  uint64_t v14 = v5;
  [v3 setFoundItemsHandler:v11];
  v6 = (void *)v18[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_2_35;
  v7[3] = &unk_1E6D3F810;
  id v8 = *(id *)(a1 + 48);
  id v9 = v15;
  id v10 = &v17;
  [v6 setCompletionHandler:v7];
  [(id)v18[5] start];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
}

void __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && [v3 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v38 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = [v10 uniqueIdentifier];
            int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

            if (v12)
            {
              id v13 = [v10 attributeSet];
              uint64_t v14 = [v13 title];

              id v15 = [v10 attributeSet];
              uint64_t v16 = [v15 contentDescription];

              uint64_t v17 = [v10 attributeSet];
              v34 = [v17 contentCreationDate];

              id v18 = [v10 attributeSet];
              uint64_t v19 = [v18 namedLocation];

              id v20 = [v10 attributeSet];
              double v21 = [v20 thumbnailURL];

              objc_opt_class();
              v35 = (void *)v16;
              long long v36 = (void *)v14;
              if (objc_opt_isKindOfClass())
              {
                uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:v21];

                double v21 = (void *)v22;
              }
              uint64_t v23 = (void *)MEMORY[0x1E4F42A80];
              int v24 = [v10 attributeSet];
              uint64_t v25 = [v24 thumbnailData];
              v26 = [v23 imageWithData:v25];
              int v27 = v26;
              if (v26)
              {
                id v28 = v26;
              }
              else
              {
                v29 = (void *)MEMORY[0x1E4F42A80];
                v30 = [v21 path];
                id v28 = [v29 imageWithContentsOfFile:v30];
              }
              uint64_t v31 = [objc_alloc(*(Class *)(a1 + 48)) initWithThumbnailImage:v28 title:v36 shortExcerpt:v35 publishDate:v34 publisherName:v19 publisherLogoImage:0 publisherLogoMaskImage:0];
              uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
              v33 = *(void **)(v32 + 40);
              *(void *)(v32 + 40) = v31;

              goto LABEL_19;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
}

void __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_2_35(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_3;
    v7[3] = &unk_1E6D3F7E8;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v8 = v3;
    uint64_t v9 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

uint64_t __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

+ (void)articleFromCoreSpotlightIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__NSSArticleInternal_articleFromCoreSpotlightIdentifier_completion___block_invoke;
  v10[3] = &unk_1E6D3F860;
  id v12 = v7;
  id v13 = a1;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [a1 _articleFromCoreSpotlightIdentifier:v9 domain:@"com.apple.news.article.history" completion:v10];
}

uint64_t __68__NSSArticleInternal_articleFromCoreSpotlightIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
  else
  {
    [*(id *)(a1 + 48) _articleFromCoreSpotlightIdentifier:*(void *)(a1 + 32) domain:@"NSSSpotlightArticleDomainIdentifier" completion:*(void *)(a1 + 40)];
  }
  return MEMORY[0x1F41817F8]();
}

- (NSSArticleInternal)init
{
  return [(NSSArticleInternal *)self initWithThumbnailImage:0 title:0 shortExcerpt:0 publishDate:0 publisherName:0 publisherLogoImage:0 publisherLogoMaskImage:0];
}

- (NSSArticleInternal)initWithThumbnailImage:(id)a3 title:(id)a4 shortExcerpt:(id)a5 publishDate:(id)a6 publisherName:(id)a7 publisherLogoImage:(id)a8 publisherLogoMaskImage:(id)a9
{
  id v33 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v34.receiver = self;
  v34.super_class = (Class)NSSArticleInternal;
  uint64_t v22 = [(NSSArticleInternal *)&v34 init];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_thumbnailImage, a3);
    uint64_t v24 = [v16 copy];
    title = v23->_title;
    v23->_title = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    shortExcerpt = v23->_shortExcerpt;
    v23->_shortExcerpt = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    publishDate = v23->_publishDate;
    v23->_publishDate = (NSDate *)v28;

    uint64_t v30 = [v19 copy];
    publisherName = v23->_publisherName;
    v23->_publisherName = (NSString *)v30;

    objc_storeStrong((id *)&v23->_publisherLogoImage, a8);
    objc_storeStrong((id *)&v23->_publisherLogoMaskImage, a9);
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [(NSSArticleInternal *)self thumbnailImage];

  if (v4)
  {
    uint64_t v5 = [(NSSArticleInternal *)self thumbnailImage];
    [v18 encodeObject:v5 forKey:@"thumbnailImage"];
  }
  id v6 = [(NSSArticleInternal *)self title];

  if (v6)
  {
    id v7 = [(NSSArticleInternal *)self title];
    [v18 encodeObject:v7 forKey:@"title"];
  }
  id v8 = [(NSSArticleInternal *)self shortExcerpt];

  if (v8)
  {
    id v9 = [(NSSArticleInternal *)self shortExcerpt];
    [v18 encodeObject:v9 forKey:@"shortExcerpt"];
  }
  id v10 = [(NSSArticleInternal *)self publishDate];

  if (v10)
  {
    id v11 = [(NSSArticleInternal *)self publishDate];
    [v18 encodeObject:v11 forKey:@"publishDate"];
  }
  id v12 = [(NSSArticleInternal *)self publisherName];

  if (v12)
  {
    id v13 = [(NSSArticleInternal *)self publisherName];
    [v18 encodeObject:v13 forKey:@"publisherName"];
  }
  uint64_t v14 = [(NSSArticleInternal *)self publisherLogoImage];

  if (v14)
  {
    id v15 = [(NSSArticleInternal *)self publisherLogoImage];
    [v18 encodeObject:v15 forKey:@"publisherLogoImage"];
  }
  id v16 = [(NSSArticleInternal *)self publisherLogoMaskImage];

  if (v16)
  {
    id v17 = [(NSSArticleInternal *)self publisherLogoMaskImage];
    [v18 encodeObject:v17 forKey:@"publisherLogoMaskImage"];
  }
}

- (NSSArticleInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectForKey:@"thumbnailImage"];
  id v6 = [v4 decodeObjectForKey:@"title"];
  id v7 = [v4 decodeObjectForKey:@"shortExcerpt"];
  id v8 = [v4 decodeObjectForKey:@"publishDate"];
  id v9 = [v4 decodeObjectForKey:@"publisherName"];
  id v10 = [v4 decodeObjectForKey:@"publisherLogoImage"];
  id v11 = [v4 decodeObjectForKey:@"publisherLogoMaskImage"];

  id v12 = [(NSSArticleInternal *)self initWithThumbnailImage:v5 title:v6 shortExcerpt:v7 publishDate:v8 publisherName:v9 publisherLogoImage:v10 publisherLogoMaskImage:v11];
  return v12;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (UIImage)publisherLogoImage
{
  return self->_publisherLogoImage;
}

- (UIImage)publisherLogoMaskImage
{
  return self->_publisherLogoMaskImage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSString)publisherName
{
  return self->_publisherName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_publisherLogoMaskImage, 0);
  objc_storeStrong((id *)&self->_publisherLogoImage, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

@end