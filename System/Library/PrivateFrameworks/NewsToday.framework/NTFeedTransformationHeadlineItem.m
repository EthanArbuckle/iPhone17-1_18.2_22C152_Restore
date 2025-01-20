@interface NTFeedTransformationHeadlineItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)needsFeedItemHeadlinesFetch;
- (FCHeadlineProviding)headline;
- (NSDate)cacheCutoffTimeRelativeDate;
- (NSDate)cacheExpirationDate;
- (NSString)clusterID;
- (NSString)identifier;
- (NSString)surfacedByChannelID;
- (NSURL)actionURL;
- (NTFeedTransformationHeadlineItem)init;
- (NTFeedTransformationHeadlineItem)initWithHeadline:(id)a3 cacheExpirationDate:(id)a4 actionURL:(id)a5;
- (NTPBFeedItem)feedItemForHeadlineFetch;
- (id)protoitemWithFetchedFeedItemHeadline:(id)a3 configuration:(id)a4;
- (unint64_t)hash;
- (unint64_t)todayItemType;
- (void)markAsLocal;
- (void)setHeadline:(id)a3;
- (void)setLocal:(BOOL)a3;
@end

@implementation NTFeedTransformationHeadlineItem

- (NTFeedTransformationHeadlineItem)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTFeedTransformationHeadlineItem init]";
    __int16 v9 = 2080;
    v10 = "NTFeedTransformationHeadlineItem.m";
    __int16 v11 = 1024;
    int v12 = 29;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTFeedTransformationHeadlineItem init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTFeedTransformationHeadlineItem)initWithHeadline:(id)a3 cacheExpirationDate:(id)a4 actionURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTFeedTransformationHeadlineItem initWithHeadline:cacheExpirationDate:actionURL:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTFeedTransformationHeadlineItem initWithHeadline:cacheExpirationDate:actionURL:]();
  }
LABEL_6:
  v19.receiver = self;
  v19.super_class = (Class)NTFeedTransformationHeadlineItem;
  __int16 v11 = [(NTFeedTransformationHeadlineItem *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    headline = v11->_headline;
    v11->_headline = (FCHeadlineProviding *)v12;

    uint64_t v14 = [v9 copy];
    cacheExpirationDate = v11->_cacheExpirationDate;
    v11->_cacheExpirationDate = (NSDate *)v14;

    uint64_t v16 = [v10 copy];
    actionURL = v11->_actionURL;
    v11->_actionURL = (NSURL *)v16;
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
    id v6 = [(NTFeedTransformationHeadlineItem *)self headline];
    v7 = [v5 headline];
    if ([v6 isEqual:v7])
    {
      id v8 = [(NTFeedTransformationHeadlineItem *)self cacheExpirationDate];
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
  v3 = [(NTFeedTransformationHeadlineItem *)self headline];
  uint64_t v4 = [v3 hash];
  v5 = [(NTFeedTransformationHeadlineItem *)self cacheExpirationDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)identifier
{
  v2 = [(NTFeedTransformationHeadlineItem *)self headline];
  v3 = [v2 articleID];

  return (NSString *)v3;
}

- (unint64_t)todayItemType
{
  return 0;
}

- (NSString)clusterID
{
  v2 = [(NTFeedTransformationHeadlineItem *)self headline];
  v3 = [v2 clusterID];

  return (NSString *)v3;
}

- (NSDate)cacheCutoffTimeRelativeDate
{
  v2 = [(NTFeedTransformationHeadlineItem *)self headline];
  v3 = [v2 publishDate];

  return (NSDate *)v3;
}

- (BOOL)needsFeedItemHeadlinesFetch
{
  return 0;
}

- (NTPBFeedItem)feedItemForHeadlineFetch
{
  return 0;
}

- (id)protoitemWithFetchedFeedItemHeadline:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(NTFeedTransformationHeadlineItem *)self headline];
  if ([(NTFeedTransformationHeadlineItem *)self isLocal])
  {
    objc_opt_class();
    v7 = FCDynamicCast();
    [v7 assignStoryType:5 withConfiguration:v5];
  }
  id v8 = [NTTodayHeadlineProtoitem alloc];
  id v9 = [(NTFeedTransformationHeadlineItem *)self identifier];
  char v10 = [(NTFeedTransformationHeadlineItem *)self actionURL];
  __int16 v11 = [(NTTodayHeadlineProtoitem *)v8 initWithIdentifier:v9 headline:v6 actionURL:v10];

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

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
}

- (NSURL)actionURL
{
  return self->_actionURL;
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
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelID, 0);

  objc_storeStrong((id *)&self->_cacheExpirationDate, 0);
}

- (void)initWithHeadline:cacheExpirationDate:actionURL:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "cacheExpirationDate");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTFeedTransformationHeadlineItem initWithHeadline:cacheExpirationDate:actionURL:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTFeedTransformationHeadlineItem.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)initWithHeadline:cacheExpirationDate:actionURL:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "headline");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTFeedTransformationHeadlineItem initWithHeadline:cacheExpirationDate:actionURL:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTFeedTransformationHeadlineItem.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end