@interface FCWebContent
- (FCAssetHandle)excerptAssetHandle;
- (FCWebContent)init;
- (FCWebContent)initWithArticleID:(id)a3 sourceURL:(id)a4 excerptAssetHandle:(id)a5;
- (NSString)articleID;
- (NSURL)sourceURL;
- (void)setArticleID:(id)a3;
- (void)setExcerptAssetHandle:(id)a3;
- (void)setSourceURL:(id)a3;
@end

@implementation FCWebContent

- (FCWebContent)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCWebContent init]";
    __int16 v9 = 2080;
    v10 = "FCWebContent.m";
    __int16 v11 = 1024;
    int v12 = 27;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCWebContent init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCWebContent)initWithArticleID:(id)a3 sourceURL:(id)a4 excerptAssetHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCWebContent;
  __int16 v11 = [(FCWebContent *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    articleID = v11->_articleID;
    v11->_articleID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_sourceURL, a4);
    objc_storeStrong((id *)&v11->_excerptAssetHandle, a5);
  }

  return v11;
}

- (FCAssetHandle)excerptAssetHandle
{
  return self->_excerptAssetHandle;
}

- (void)setExcerptAssetHandle:(id)a3
{
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_excerptAssetHandle, 0);
}

@end