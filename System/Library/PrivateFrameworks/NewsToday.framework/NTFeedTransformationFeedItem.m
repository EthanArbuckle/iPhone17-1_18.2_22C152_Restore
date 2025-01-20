@interface NTFeedTransformationFeedItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)needsFeedItemHeadlinesFetch;
- (NSDate)cacheCutoffTimeRelativeDate;
- (NSDate)cacheExpirationDate;
- (NSString)clusterID;
- (NSString)identifier;
- (NSString)surfacedByChannelID;
- (NTFeedTransformationFeedItem)init;
- (NTFeedTransformationFeedItem)initWithFeedItem:(id)a3 cacheExpirationDate:(id)a4 surfacedByChannelID:(id)a5;
- (NTPBFeedItem)feedItem;
- (id)protoitemWithFetchedFeedItemHeadline:(id)a3 configuration:(id)a4;
- (unint64_t)hash;
- (unint64_t)todayItemType;
- (void)markAsLocal;
- (void)setLocal:(BOOL)a3;
@end

@implementation NTFeedTransformationFeedItem

- (NTFeedTransformationFeedItem)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTFeedTransformationFeedItem init]";
    __int16 v9 = 2080;
    v10 = "NTFeedTransformationFeedItem.m";
    __int16 v11 = 1024;
    int v12 = 27;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTFeedTransformationFeedItem init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTFeedTransformationFeedItem)initWithFeedItem:(id)a3 cacheExpirationDate:(id)a4 surfacedByChannelID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTFeedTransformationFeedItem initWithFeedItem:cacheExpirationDate:surfacedByChannelID:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)NTFeedTransformationFeedItem;
  __int16 v11 = [(NTFeedTransformationFeedItem *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    feedItem = v11->_feedItem;
    v11->_feedItem = (NTPBFeedItem *)v12;

    uint64_t v14 = [v9 copy];
    cacheExpirationDate = v11->_cacheExpirationDate;
    v11->_cacheExpirationDate = (NSDate *)v14;

    uint64_t v16 = [v10 copy];
    surfacedByChannelID = v11->_surfacedByChannelID;
    v11->_surfacedByChannelID = (NSString *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5)
  {
    id v6 = [(NTFeedTransformationFeedItem *)self feedItem];
    v7 = [v5 feedItem];
    if ([v6 isEqual:v7])
    {
      id v8 = [(NTFeedTransformationFeedItem *)self cacheExpirationDate];
      id v9 = [v5 cacheExpirationDate];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(NTFeedTransformationFeedItem *)self feedItem];
  uint64_t v4 = [v3 hash];
  v5 = [(NTFeedTransformationFeedItem *)self cacheExpirationDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)identifier
{
  v2 = [(NTFeedTransformationFeedItem *)self feedItem];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (unint64_t)todayItemType
{
  return 0;
}

- (NSString)clusterID
{
  v2 = [(NTFeedTransformationFeedItem *)self feedItem];
  v3 = [v2 clusterID];

  return (NSString *)v3;
}

- (NSDate)cacheCutoffTimeRelativeDate
{
  v2 = [(NTFeedTransformationFeedItem *)self feedItem];
  v3 = [v2 publishDate];

  return (NSDate *)v3;
}

- (BOOL)needsFeedItemHeadlinesFetch
{
  return 1;
}

- (id)protoitemWithFetchedFeedItemHeadline:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NTFeedTransformationFeedItem *)self isLocal])
  {
    objc_opt_class();
    id v8 = FCDynamicCast();
    [v8 assignStoryType:5 withConfiguration:v7];
  }
  id v9 = [NTTodayHeadlineProtoitem alloc];
  char v10 = [(NTFeedTransformationFeedItem *)self identifier];
  __int16 v11 = [(NTTodayHeadlineProtoitem *)v9 initWithIdentifier:v10 headline:v6 actionURL:0];

  return v11;
}

- (void)markAsLocal
{
}

- (NSDate)cacheExpirationDate
{
  return self->_cacheExpirationDate;
}

- (NSString)surfacedByChannelID
{
  return self->_surfacedByChannelID;
}

- (NTPBFeedItem)feedItem
{
  return self->_feedItem;
}

- (BOOL)isLocal
{
  return self->_local;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItem, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelID, 0);

  objc_storeStrong((id *)&self->_cacheExpirationDate, 0);
}

- (void)initWithFeedItem:cacheExpirationDate:surfacedByChannelID:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedItem");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTFeedTransformationFeedItem initWithFeedItem:cacheExpirationDate:surfacedByChannelID:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTFeedTransformationFeedItem.m";
  __int16 v5 = 1024;
  int v6 = 34;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end