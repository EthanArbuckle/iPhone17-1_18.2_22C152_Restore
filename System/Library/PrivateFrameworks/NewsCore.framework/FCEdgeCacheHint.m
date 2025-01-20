@interface FCEdgeCacheHint
+ (id)edgeCacheHintForAudioContent;
+ (id)edgeCacheHintForCurrentIssueArticles;
+ (id)edgeCacheHintForCurrentIssues;
+ (id)edgeCacheHintForEditorial;
+ (id)edgeCacheHintForEvergreenArticles;
+ (id)edgeCacheHintForFeaturedArticles;
+ (id)edgeCacheHintForForYouConfig;
+ (id)edgeCacheHintForLocalNews;
+ (id)edgeCacheHintForMagazineContent;
+ (id)edgeCacheHintForNotificationPool;
+ (id)edgeCacheHintForPurchaseLookup;
+ (id)edgeCacheHintForSportsArticles;
+ (id)edgeCacheHintForSpotlight;
+ (id)edgeCacheHintForToday;
+ (id)edgeCacheHintForTopStories;
+ (id)edgeCacheHintForTrending;
- (FCEdgeCacheHint)initWithGroupName:(id)a3 cacheControlKey:(id)a4;
- (NSString)cacheControlKey;
- (NSString)groupName;
@end

@implementation FCEdgeCacheHint

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)cacheControlKey
{
  return self->_cacheControlKey;
}

+ (id)edgeCacheHintForPurchaseLookup
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"purchaselookup"];
  return v2;
}

- (FCEdgeCacheHint)initWithGroupName:(id)a3 cacheControlKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCEdgeCacheHint;
  v8 = [(FCEdgeCacheHint *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    groupName = v8->_groupName;
    v8->_groupName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    cacheControlKey = v8->_cacheControlKey;
    v8->_cacheControlKey = (NSString *)v11;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheControlKey, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

+ (id)edgeCacheHintForTopStories
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"topstories"];
  return v2;
}

+ (id)edgeCacheHintForForYouConfig
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"foryouconfig"];
  return v2;
}

+ (id)edgeCacheHintForTrending
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"trending"];
  return v2;
}

+ (id)edgeCacheHintForEditorial
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"editorial"];
  return v2;
}

+ (id)edgeCacheHintForToday
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"today"];
  return v2;
}

+ (id)edgeCacheHintForFeaturedArticles
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"featuredarticles"];
  return v2;
}

+ (id)edgeCacheHintForCurrentIssues
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"currentissues"];
  return v2;
}

+ (id)edgeCacheHintForCurrentIssueArticles
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"currentissuearticles"];
  return v2;
}

+ (id)edgeCacheHintForSpotlight
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"spotlight"];
  return v2;
}

+ (id)edgeCacheHintForMagazineContent
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"magazinecontent"];
  return v2;
}

+ (id)edgeCacheHintForAudioContent
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"audiocontent"];
  return v2;
}

+ (id)edgeCacheHintForLocalNews
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"localnews"];
  return v2;
}

+ (id)edgeCacheHintForEvergreenArticles
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"evergreenarticles"];
  return v2;
}

+ (id)edgeCacheHintForSportsArticles
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"sportsarticles"];
  return v2;
}

+ (id)edgeCacheHintForNotificationPool
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupName:@"news" cacheControlKey:@"notificationpool"];
  return v2;
}

@end