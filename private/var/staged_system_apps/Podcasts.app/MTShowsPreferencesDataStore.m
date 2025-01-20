@interface MTShowsPreferencesDataStore
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (id)_stringForSortType:(int64_t)a3;
- (id)sortDescriptors;
- (int64_t)_sortTypeForString:(id)a3;
- (int64_t)sortOrder;
- (void)setSortOrder:(int64_t)a3;
@end

@implementation MTShowsPreferencesDataStore

- (int64_t)_sortTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"added"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"addedAscending"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"manual"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"title"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"titleAscending"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"updated"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"updatedAscending"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"recentlyUnfollowed"])
  {
    int64_t v4 = 7;
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)sortOrder
{
  id v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  int64_t v4 = [v3 stringForKey:kMTShowsSortOrderKey];

  int64_t v5 = [(MTShowsPreferencesDataStore *)self _sortTypeForString:v4];
  return v5;
}

- (id)sortDescriptors
{
  int64_t v2 = [(MTShowsPreferencesDataStore *)self sortOrder];

  return +[MTPodcast sortDescriptorsForSortType:v2];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016E744;
  block[3] = &unk_10054D910;
  block[4] = a1;
  if (qword_10060A9A8[0] != -1) {
    dispatch_once(qword_10060A9A8, block);
  }
  int64_t v2 = (void *)qword_10060A9A0;

  return v2;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSortOrder:(int64_t)a3
{
  id v5 = [(MTShowsPreferencesDataStore *)self _stringForSortType:a3];
  id v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  [v3 setObject:v5 forKey:kMTShowsSortOrderKey];

  int64_t v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  [v4 synchronize];
}

- (id)_stringForSortType:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return @"title";
  }
  else {
    return off_100553840[a3];
  }
}

@end