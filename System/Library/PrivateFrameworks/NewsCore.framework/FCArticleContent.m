@interface FCArticleContent
- (BOOL)isEqual:(id)a3;
- (FCANFContent)anfContent;
- (FCArticleContent)initWithArticleID:(id)a3 anfContent:(id)a4;
- (FCArticleContent)initWithArticleID:(id)a3 contentType:(unint64_t)a4;
- (FCArticleContent)initWithArticleID:(id)a3 webContent:(id)a4;
- (FCArticleContent)initWithContext:(id)a3 articleRecord:(id)a4;
- (FCWebContent)webContent;
- (NSString)articleID;
- (unint64_t)contentType;
- (unint64_t)hash;
- (void)setAnfContent:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setWebContent:(id)a3;
@end

@implementation FCArticleContent

- (FCANFContent)anfContent
{
  return self->_anfContent;
}

- (FCArticleContent)initWithContext:(id)a3 articleRecord:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 base];
  v9 = [v8 identifier];

  int v10 = [v7 contentType];
  if (v10 == 2)
  {
    v19 = [v6 assetManager];
    v20 = [v7 generateFlintDocumentAssetHandleWithAssetManager:v19];

    v21 = [FCANFContent alloc];
    v22 = [v7 flintFontResourceIDs];
    v23 = [(FCANFContent *)v21 initWithIdentifier:v9 mainDocumentAssetHandle:v20 fontResourceIDs:v22];

    v18 = [(FCArticleContent *)self initWithArticleID:v9 anfContent:v23];
  }
  else if (v10 == 1)
  {
    v11 = [v6 assetManager];
    v12 = [v7 generateWebExcerptAssetHandleWithAssetManager:v11];

    v13 = [FCWebContent alloc];
    v14 = (void *)MEMORY[0x1E4F1CB10];
    v15 = [v7 contentURL];
    v16 = [v14 URLWithString:v15];
    v17 = [(FCWebContent *)v13 initWithArticleID:v9 sourceURL:v16 excerptAssetHandle:v12];
    v18 = [(FCArticleContent *)self initWithArticleID:v9 webContent:v17];
  }
  else
  {
    v24 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138543362;
      v27 = v9;
      _os_log_error_impl(&dword_1A460D000, v24, OS_LOG_TYPE_ERROR, "Failed to create content for article ID: %{public}@", (uint8_t *)&v26, 0xCu);
    }

    v18 = 0;
  }

  return v18;
}

- (FCArticleContent)initWithArticleID:(id)a3 anfContent:(id)a4
{
  id v7 = a4;
  v8 = [(FCArticleContent *)self initWithArticleID:a3 contentType:2];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_anfContent, a4);
  }

  return v9;
}

- (FCArticleContent)initWithArticleID:(id)a3 contentType:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCArticleContent initWithArticleID:contentType:]";
    __int16 v16 = 2080;
    v17 = "FCArticleContent.m";
    __int16 v18 = 1024;
    int v19 = 71;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v13.receiver = self;
  v13.super_class = (Class)FCArticleContent;
  id v7 = [(FCArticleContent *)&v13 init];
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      uint64_t v9 = [v6 copy];
      articleID = v8->_articleID;
      v8->_articleID = (NSString *)v9;

      v8->_contentType = a4;
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anfContent, 0);
  objc_storeStrong((id *)&self->_webContent, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

- (FCArticleContent)initWithArticleID:(id)a3 webContent:(id)a4
{
  id v7 = a4;
  v8 = [(FCArticleContent *)self initWithArticleID:a3 contentType:1];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_webContent, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;

    id v7 = [(FCArticleContent *)self articleID];
    v8 = [v6 articleID];
    LOBYTE(v4) = [v7 isEqual:v8];
  }
  else
  {
    id v7 = 0;
    id v6 = 0;
  }

  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(FCArticleContent *)self articleID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (FCWebContent)webContent
{
  return self->_webContent;
}

- (void)setWebContent:(id)a3
{
}

- (void)setAnfContent:(id)a3
{
}

@end