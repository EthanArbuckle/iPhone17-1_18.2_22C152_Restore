@interface FCTodayMarkAsReadTransaction
+ (BOOL)supportsSecureCoding;
- (FCTodayMarkAsReadTransaction)init;
- (FCTodayMarkAsReadTransaction)initWithArticleID:(id)a3 articleVersion:(int64_t)a4 readDate:(id)a5;
- (FCTodayMarkAsReadTransaction)initWithCoder:(id)a3;
- (NSDate)readDate;
- (NSString)articleID;
- (int64_t)articleVersion;
- (void)encodeWithCoder:(id)a3;
- (void)performWithPrivateDataContext:(id)a3;
- (void)performWithTodayPrivateData:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setArticleVersion:(int64_t)a3;
- (void)setReadDate:(id)a3;
@end

@implementation FCTodayMarkAsReadTransaction

- (FCTodayMarkAsReadTransaction)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTodayMarkAsReadTransaction init]";
    __int16 v9 = 2080;
    v10 = "FCTodayMarkAsReadTransaction.m";
    __int16 v11 = 1024;
    int v12 = 27;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTodayMarkAsReadTransaction init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCTodayMarkAsReadTransaction)initWithArticleID:(id)a3 articleVersion:(int64_t)a4 readDate:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCTodayMarkAsReadTransaction initWithArticleID:articleVersion:readDate:]";
    __int16 v21 = 2080;
    v22 = "FCTodayMarkAsReadTransaction.m";
    __int16 v23 = 1024;
    int v24 = 34;
    __int16 v25 = 2114;
    v26 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "readDate");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCTodayMarkAsReadTransaction initWithArticleID:articleVersion:readDate:]";
    __int16 v21 = 2080;
    v22 = "FCTodayMarkAsReadTransaction.m";
    __int16 v23 = 1024;
    int v24 = 35;
    __int16 v25 = 2114;
    v26 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v18.receiver = self;
  v18.super_class = (Class)FCTodayMarkAsReadTransaction;
  v10 = [(FCTodayMarkAsReadTransaction *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    articleID = v10->_articleID;
    v10->_articleID = (NSString *)v11;

    v10->_articleVersion = a4;
    uint64_t v13 = [v9 copy];
    readDate = v10->_readDate;
    v10->_readDate = (NSDate *)v13;
  }
  return v10;
}

- (void)performWithPrivateDataContext:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  id v9 = [v5 readingHistory];

  id v6 = [(FCTodayMarkAsReadTransaction *)self articleID];
  int64_t v7 = [(FCTodayMarkAsReadTransaction *)self articleVersion];
  id v8 = [(FCTodayMarkAsReadTransaction *)self readDate];
  [v9 markArticleAsReadWithArticleID:v6 articleVersion:v7 readDate:v8];
}

- (void)performWithTodayPrivateData:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 recentlyReadHistoryItems];
  objc_opt_class();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    [v17 setRecentlyReadHistoryItems:v5];
  }
  id v6 = [(FCTodayMarkAsReadTransaction *)self articleID];
  int64_t v7 = [(FCTodayMarkAsReadTransaction *)self articleVersion];
  id v8 = [(FCTodayMarkAsReadTransaction *)self readDate];
  id v9 = [v5 objectForKeyedSubscript:v6];
  if (v9
    && (FCCheckedProtocolCast((uint64_t)&unk_1EF9333E0, v9), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v11 = v10;
    uint64_t v12 = [v10 maxVersionRead];
    if (v12 <= v7) {
      int64_t v13 = v7;
    }
    else {
      int64_t v13 = v12;
    }
    [v11 setMaxVersionRead:v13];
    v14 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v15 = [v11 lastVisitedAt];
    v16 = objc_msgSend(v14, "fc_laterDateAllowingNilWithDate:andDate:", v15, v8);
    [v11 setLastVisitedAt:v16];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
    [v11 setArticleID:v6];
    [v11 setMaxVersionRead:v7];
    [v11 setLastVisitedAt:v8];
    [v5 setObject:v11 forKeyedSubscript:v6];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FCTodayMarkAsReadTransaction *)self articleID];
  [v4 encodeObject:v5 forKey:@"a"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[FCTodayMarkAsReadTransaction articleVersion](self, "articleVersion"), @"b");
  id v6 = [(FCTodayMarkAsReadTransaction *)self readDate];
  [v4 encodeObject:v6 forKey:@"c"];
}

- (FCTodayMarkAsReadTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"a"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"b"];
  int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c"];

  id v8 = [(FCTodayMarkAsReadTransaction *)self initWithArticleID:v5 articleVersion:v6 readDate:v7];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (int64_t)articleVersion
{
  return self->_articleVersion;
}

- (void)setArticleVersion:(int64_t)a3
{
  self->_articleVersion = a3;
}

- (NSDate)readDate
{
  return self->_readDate;
}

- (void)setReadDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readDate, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end