@interface FCFeedItemsWithIDLookupResult
- (FCFeedItemsWithIDLookupResult)init;
- (FCFeedItemsWithIDLookupResult)initWithSectionIDByFeedID:(id)a3 feedItems:(id)a4;
- (NSArray)feedItems;
- (NSDictionary)sectionIDsByFeedID;
- (void)setFeedItems:(id)a3;
- (void)setSectionIDsByFeedID:(id)a3;
@end

@implementation FCFeedItemsWithIDLookupResult

- (FCFeedItemsWithIDLookupResult)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedItemsWithIDLookupResult init]";
    __int16 v9 = 2080;
    v10 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 88;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFeedItemsWithIDLookupResult init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCFeedItemsWithIDLookupResult)initWithSectionIDByFeedID:(id)a3 feedItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCFeedItemsWithIDLookupResult;
  v8 = [(FCFeedItemsWithIDLookupResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sectionIDsByFeedID = v8->_sectionIDsByFeedID;
    v8->_sectionIDsByFeedID = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    feedItems = v8->_feedItems;
    v8->_feedItems = (NSArray *)v11;
  }
  return v8;
}

- (NSDictionary)sectionIDsByFeedID
{
  return self->_sectionIDsByFeedID;
}

- (void)setSectionIDsByFeedID:(id)a3
{
}

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong((id *)&self->_sectionIDsByFeedID, 0);
}

@end