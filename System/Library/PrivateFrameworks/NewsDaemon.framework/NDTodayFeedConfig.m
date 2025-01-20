@interface NDTodayFeedConfig
+ (BOOL)supportsSecureCoding;
- (NDTodayFeedConfig)initWithCoder:(id)a3;
- (NDTodayFeedConfig)initWithPublishDate:(id)a3 topStoriesArticleIDs:(id)a4 topStoriesPackageURLs:(id)a5;
- (NSArray)topStoriesArticleIDs;
- (NSArray)topStoriesPackageURLs;
- (NSDate)publishDate;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NDTodayFeedConfig

- (NDTodayFeedConfig)initWithPublishDate:(id)a3 topStoriesArticleIDs:(id)a4 topStoriesPackageURLs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NDTodayFeedConfig;
  v11 = [(NDTodayFeedConfig *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    publishDate = v11->_publishDate;
    v11->_publishDate = (NSDate *)v12;

    uint64_t v14 = [v9 copy];
    topStoriesArticleIDs = v11->_topStoriesArticleIDs;
    v11->_topStoriesArticleIDs = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    topStoriesPackageURLs = v11->_topStoriesPackageURLs;
    v11->_topStoriesPackageURLs = (NSArray *)v16;
  }
  return v11;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F7E390]) initWithObject:self];
  v4 = [(NDTodayFeedConfig *)self publishDate];
  [v3 addField:@"publishDate" object:v4];

  v5 = [(NDTodayFeedConfig *)self topStoriesArticleIDs];
  [v3 addField:@"topStoriesArticleIDs" object:v5];

  v6 = [(NDTodayFeedConfig *)self topStoriesPackageURLs];
  [v3 addField:@"topStoriesPackageURLs" object:v6];

  v7 = [v3 descriptionString];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NDTodayFeedConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publishDate"];
  v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"topStoriesArticleIDs"];
  v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"topStoriesPackageURLs"];

  id v8 = v5;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (v7) {
    id v10 = v7;
  }
  else {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v11 = [(NDTodayFeedConfig *)self initWithPublishDate:v8 topStoriesArticleIDs:v9 topStoriesPackageURLs:v10];
  if (!v5) {

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NDTodayFeedConfig *)self publishDate];
  [v4 encodeObject:v5 forKey:@"publishDate"];

  v6 = [(NDTodayFeedConfig *)self topStoriesArticleIDs];
  [v4 encodeObject:v6 forKey:@"topStoriesArticleIDs"];

  id v7 = [(NDTodayFeedConfig *)self topStoriesPackageURLs];
  [v4 encodeObject:v7 forKey:@"topStoriesPackageURLs"];
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSArray)topStoriesArticleIDs
{
  return self->_topStoriesArticleIDs;
}

- (NSArray)topStoriesPackageURLs
{
  return self->_topStoriesPackageURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topStoriesPackageURLs, 0);
  objc_storeStrong((id *)&self->_topStoriesArticleIDs, 0);

  objc_storeStrong((id *)&self->_publishDate, 0);
}

@end