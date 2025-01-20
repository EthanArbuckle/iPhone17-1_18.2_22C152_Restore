@interface FCIssueBookmark
+ (id)ANFBookmarkWithArticleID:(id)a3;
+ (id)PDFBookmarkWithPageID:(id)a3;
- (FCIssueBookmark)init;
- (FCIssueBookmark)initWithIssueType:(int64_t)a3 articleID:(id)a4 pageID:(id)a5;
- (NSString)articleID;
- (NSString)pageID;
- (int64_t)issueType;
@end

@implementation FCIssueBookmark

- (FCIssueBookmark)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssueBookmark init]";
    __int16 v9 = 2080;
    v10 = "FCIssueBookmark.m";
    __int16 v11 = 1024;
    int v12 = 23;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCIssueBookmark init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCIssueBookmark)initWithIssueType:(int64_t)a3 articleID:(id)a4 pageID:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!a3 && !v8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    __int16 v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueType != FCIssueTypeANF || articleID != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCIssueBookmark initWithIssueType:articleID:pageID:]";
    __int16 v23 = 2080;
    v24 = "FCIssueBookmark.m";
    __int16 v25 = 1024;
    int v26 = 30;
    __int16 v27 = 2114;
    v28 = v11;
    int v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  if (a3 == 1 && !v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueType != FCIssueTypePDF || pageID != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCIssueBookmark initWithIssueType:articleID:pageID:]";
    __int16 v23 = 2080;
    v24 = "FCIssueBookmark.m";
    __int16 v25 = 1024;
    int v26 = 31;
    __int16 v27 = 2114;
    v28 = v11;
    int v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_error_impl(&dword_1A460D000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_8:
  v20.receiver = self;
  v20.super_class = (Class)FCIssueBookmark;
  __int16 v13 = [(FCIssueBookmark *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_issueType = a3;
    uint64_t v15 = [v8 copy];
    articleID = v14->_articleID;
    v14->_articleID = (NSString *)v15;

    uint64_t v17 = [v10 copy];
    pageID = v14->_pageID;
    v14->_pageID = (NSString *)v17;
  }
  return v14;
}

+ (id)PDFBookmarkWithPageID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "pageID != nil");
    *(_DWORD *)buf = 136315906;
    id v8 = "+[FCIssueBookmark PDFBookmarkWithPageID:]";
    __int16 v9 = 2080;
    v10 = "FCIssueBookmark.m";
    __int16 v11 = 1024;
    int v12 = 45;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v4 = [[FCIssueBookmark alloc] initWithIssueType:1 articleID:0 pageID:v3];

  return v4;
}

+ (id)ANFBookmarkWithArticleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
    *(_DWORD *)buf = 136315906;
    id v8 = "+[FCIssueBookmark ANFBookmarkWithArticleID:]";
    __int16 v9 = 2080;
    v10 = "FCIssueBookmark.m";
    __int16 v11 = 1024;
    int v12 = 54;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v4 = [[FCIssueBookmark alloc] initWithIssueType:0 articleID:v3 pageID:0];

  return v4;
}

- (int64_t)issueType
{
  return self->_issueType;
}

- (NSString)pageID
{
  return self->_pageID;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_pageID, 0);
}

@end