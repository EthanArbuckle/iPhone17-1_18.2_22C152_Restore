@interface FCReadingHistoryFeedDescriptor
- (FCReadingHistoryFeedDescriptor)initWithPrivateDataController:(id)a3 identifier:(id)a4 feedType:(int64_t)a5;
- (FCReadingHistoryFeedDescriptor)initWithReadingHistory:(id)a3;
- (id)backingHeadlineIDs;
- (id)name;
@end

@implementation FCReadingHistoryFeedDescriptor

- (id)backingHeadlineIDs
{
  v2 = [(FCReadingHistoryFeedDescriptor *)self readingHistory];
  v3 = [v2 sortedVisitedArticleIDs];

  return v3;
}

- (FCReadingHistoryFeedDescriptor)initWithReadingHistory:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FCReadingHistoryFeedDescriptor;
  return [(FCPrivateZoneFeedDescriptor *)&v4 initWithPrivateDataController:a3 identifier:@"FCReading-History" feedType:3];
}

- (FCReadingHistoryFeedDescriptor)initWithPrivateDataController:(id)a3 identifier:(id)a4 feedType:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCReadingHistoryFeedDescriptor initWithPrivateDataController:identifier:feedType:]";
    __int16 v15 = 2080;
    v16 = "FCPrivateZoneFeedDescriptor.m";
    __int16 v17 = 1024;
    int v18 = 98;
    __int16 v19 = 2114;
    v20 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  v11 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCReadingHistoryFeedDescriptor initWithPrivateDataController:identifier:feedType:]"];
  id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (id)name
{
  return @"History";
}

@end