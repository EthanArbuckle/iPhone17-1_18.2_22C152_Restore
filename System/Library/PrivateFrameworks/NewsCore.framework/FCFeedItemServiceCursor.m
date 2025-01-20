@interface FCFeedItemServiceCursor
- (FCFeedItemServiceCursor)init;
- (FCFeedItemServiceCursor)initWithLastRefreshed:(id)a3 feedItems:(id)a4;
- (NSArray)feedItems;
- (NTPBDate)lastRefreshed;
@end

@implementation FCFeedItemServiceCursor

- (FCFeedItemServiceCursor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedItemServiceCursor init]";
    __int16 v9 = 2080;
    v10 = "FCFeedItemServiceCursor.m";
    __int16 v11 = 1024;
    int v12 = 19;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFeedItemServiceCursor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCFeedItemServiceCursor)initWithLastRefreshed:(id)a3 feedItems:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "lastRefreshed");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCFeedItemServiceCursor initWithLastRefreshed:feedItems:]";
    __int16 v19 = 2080;
    v20 = "FCFeedItemServiceCursor.m";
    __int16 v21 = 1024;
    int v22 = 25;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedItems");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCFeedItemServiceCursor initWithLastRefreshed:feedItems:]";
    __int16 v19 = 2080;
    v20 = "FCFeedItemServiceCursor.m";
    __int16 v21 = 1024;
    int v22 = 26;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)FCFeedItemServiceCursor;
  v8 = [(FCFeedItemServiceCursor *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    lastRefreshed = v8->_lastRefreshed;
    v8->_lastRefreshed = (NTPBDate *)v9;

    uint64_t v11 = [v7 copy];
    feedItems = v8->_feedItems;
    v8->_feedItems = (NSArray *)v11;
  }
  return v8;
}

- (NTPBDate)lastRefreshed
{
  return self->_lastRefreshed;
}

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong((id *)&self->_lastRefreshed, 0);
}

@end