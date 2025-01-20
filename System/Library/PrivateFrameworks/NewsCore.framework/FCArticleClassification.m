@interface FCArticleClassification
- (BOOL)isEqual:(id)a3;
- (FCArticleClassification)initWithArticleID:(id)a3;
- (NSString)articleID;
- (unint64_t)hash;
- (void)setArticleID:(id)a3;
@end

@implementation FCArticleClassification

- (FCArticleClassification)initWithArticleID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCArticleClassification initWithArticleID:]";
    __int16 v14 = 2080;
    v15 = "FCArticleClassification.m";
    __int16 v16 = 1024;
    int v17 = 22;
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v11.receiver = self;
  v11.super_class = (Class)FCArticleClassification;
  v5 = [(FCArticleClassification *)&v11 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [v4 copy];
      articleID = (FCArticleClassification *)v6->_articleID;
      v6->_articleID = (NSString *)v7;
    }
    else
    {
      articleID = v5;
      v6 = 0;
    }
  }
  return v6;
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
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [(FCArticleClassification *)self articleID];
    v8 = [v6 articleID];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(FCArticleClassification *)self articleID];
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

- (void).cxx_destruct
{
}

@end