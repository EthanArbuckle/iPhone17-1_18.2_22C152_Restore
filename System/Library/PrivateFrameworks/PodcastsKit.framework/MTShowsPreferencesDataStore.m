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

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__MTShowsPreferencesDataStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

void __45__MTShowsPreferencesDataStore_sharedInstance__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___MTShowsPreferencesDataStore;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sortDescriptors
{
  v2 = (void *)MEMORY[0x263F5EA08];
  int64_t v3 = [(MTShowsPreferencesDataStore *)self sortOrder];
  return (id)[v2 sortDescriptorsForSortType:v3];
}

- (int64_t)sortOrder
{
  int64_t v3 = [MEMORY[0x263EFFA40] _applePodcastsFoundationSharedUserDefaults];
  v4 = [v3 stringForKey:*MEMORY[0x263F5EBD8]];

  int64_t v5 = [(MTShowsPreferencesDataStore *)self _sortTypeForString:v4];
  return v5;
}

- (void)setSortOrder:(int64_t)a3
{
  id v5 = [(MTShowsPreferencesDataStore *)self _stringForSortType:a3];
  int64_t v3 = [MEMORY[0x263EFFA40] _applePodcastsFoundationSharedUserDefaults];
  [v3 setObject:v5 forKey:*MEMORY[0x263F5EBD8]];

  v4 = [MEMORY[0x263EFFA40] _applePodcastsFoundationSharedUserDefaults];
  [v4 synchronize];
}

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

- (id)_stringForSortType:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return @"title";
  }
  else {
    return off_265055CD0[a3];
  }
}

@end