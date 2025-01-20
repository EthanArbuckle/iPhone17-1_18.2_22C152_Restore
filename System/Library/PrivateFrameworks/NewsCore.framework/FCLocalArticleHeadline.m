@interface FCLocalArticleHeadline
- (BOOL)hasThumbnail;
- (BOOL)isDeleted;
- (BOOL)isDraft;
- (BOOL)isFeatureCandidate;
- (BOOL)isLocalDraft;
- (BOOL)isPremium;
- (BOOL)isSponsored;
- (BOOL)useTransparentNavigationBar;
- (BOOL)webEmbedsEnabled;
- (CGSize)thumbnailSize;
- (FCChannelProviding)channel;
- (FCLocalArticleHeadline)initWithDictionary:(id)a3 path:(id)a4 channel:(id)a5;
- (NSDictionary)dictionary;
- (NSString)path;
- (double)videoDuration;
- (id)accessoryText;
- (id)allowedStorefrontIDs;
- (id)articleID;
- (id)blockedStorefrontIDs;
- (id)contentURL;
- (id)contentWithContext:(id)a3;
- (id)iAdCategories;
- (id)iAdKeywords;
- (id)iAdSectionIDs;
- (id)identifier;
- (id)lastModifiedDate;
- (id)primaryAudience;
- (id)publishDate;
- (id)shortExcerpt;
- (id)sourceName;
- (id)surfacedByBinID;
- (id)thumbnail;
- (id)thumbnailAssetHandle;
- (id)title;
- (id)topicIDs;
- (id)videoURL;
- (unint64_t)contentType;
@end

@implementation FCLocalArticleHeadline

- (id)contentWithContext:(id)a3
{
  return 0;
}

- (FCLocalArticleHeadline)initWithDictionary:(id)a3 path:(id)a4 channel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCLocalArticleHeadline;
  v11 = [(FCHeadline *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    dictionary = v11->_dictionary;
    v11->_dictionary = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    path = v11->_path;
    v11->_path = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    channel = v11->_channel;
    v11->_channel = (FCChannelProviding *)v16;

    v11->_webEmbedsEnabled = 1;
  }

  return v11;
}

- (id)identifier
{
  v2 = [(FCLocalArticleHeadline *)self path];
  v3 = [v2 lastPathComponent];

  return v3;
}

- (id)articleID
{
  v2 = [(FCLocalArticleHeadline *)self path];
  v3 = [v2 lastPathComponent];

  return v3;
}

- (unint64_t)contentType
{
  return 2;
}

- (id)primaryAudience
{
  return 0;
}

- (id)title
{
  v2 = [(FCLocalArticleHeadline *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"title"];

  return v3;
}

- (id)publishDate
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

- (id)sourceName
{
  return @"Draft";
}

- (BOOL)hasThumbnail
{
  v2 = [(FCLocalArticleHeadline *)self thumbnailAssetHandle];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)thumbnail
{
  thumbnail = self->_thumbnail;
  if (!thumbnail)
  {
    v4 = [(FCLocalArticleHeadline *)self thumbnailAssetHandle];
    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v4, 1.79769313e308, 1.79769313e308);
    v5 = (FCHeadlineThumbnail *)objc_claimAutoreleasedReturnValue();
    v6 = self->_thumbnail;
    self->_thumbnail = v5;

    thumbnail = self->_thumbnail;
  }
  return thumbnail;
}

- (id)thumbnailAssetHandle
{
  BOOL v3 = [(FCLocalArticleHeadline *)self dictionary];
  v4 = [v3 valueForKeyPath:@"metadata.thumbnailImageIdentifier"];

  if (v4)
  {
    objc_opt_class();
    v5 = [(FCLocalArticleHeadline *)self dictionary];
    v6 = [v5 objectForKeyedSubscript:@"resources"];
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v9 = v7;

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__6;
    v24 = __Block_byref_object_dispose__6;
    id v25 = 0;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __46__FCLocalArticleHeadline_thumbnailAssetHandle__block_invoke;
    v17 = &unk_1E5B4D140;
    id v18 = v4;
    objc_super v19 = &v20;
    [v9 enumerateKeysAndObjectsUsingBlock:&v14];
    if (v21[5])
    {
      id v10 = [(FCLocalArticleHeadline *)self localDraftPath];
      v11 = [v10 stringByAppendingPathComponent:v21[5]];

      uint64_t v12 = [[FCRawFileDataProvider alloc] initWithFilePath:v11];
      id v8 = -[FCAssetHandle initWithDataProvider:]([FCAssetHandle alloc], v12);
    }
    else
    {
      id v8 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __46__FCLocalArticleHeadline_thumbnailAssetHandle__block_invoke(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  id v15 = a3;
  objc_opt_class();
  v6 = [v15 objectForKeyedSubscript:@"imageIdentifier"];
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8 && [v8 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_opt_class();
    id v9 = [v15 objectForKeyedSubscript:@"URL"];
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v11 lastPathComponent];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (CGSize)thumbnailSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)shortExcerpt
{
  double v2 = [(FCLocalArticleHeadline *)self dictionary];
  double v3 = [v2 objectForKeyedSubscript:@"subtitle"];

  return v3;
}

- (id)accessoryText
{
  return @"Accessory Text";
}

- (id)contentURL
{
  return 0;
}

- (id)lastModifiedDate
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

- (id)topicIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)videoURL
{
  return 0;
}

- (double)videoDuration
{
  return 0.0;
}

- (BOOL)isFeatureCandidate
{
  return 0;
}

- (BOOL)isSponsored
{
  return 0;
}

- (id)iAdCategories
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)iAdKeywords
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)iAdSectionIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)blockedStorefrontIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)allowedStorefrontIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isDeleted
{
  return 0;
}

- (BOOL)isDraft
{
  return 1;
}

- (BOOL)isLocalDraft
{
  return 1;
}

- (id)surfacedByBinID
{
  return 0;
}

- (BOOL)isPremium
{
  return 0;
}

- (BOOL)useTransparentNavigationBar
{
  return 0;
}

- (BOOL)webEmbedsEnabled
{
  return self->_webEmbedsEnabled;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSString)path
{
  return self->_path;
}

- (FCChannelProviding)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
}

@end