@interface MTEpisodeSyncStorage
- (NSString)podcastsDomainVersion;
- (id)feedUrlFromModernKey:(id)a3;
- (id)importContext;
- (id)modernKeyFromFeedUrl:(id)a3;
- (id)versionForKey:(id)a3;
- (void)resetVersionForAllFeedUrls;
- (void)resetVersionForFeedUrl:(id)a3;
- (void)setPodcastsDomainVersion:(id)a3;
- (void)setVersion:(id)a3 forKey:(id)a4;
@end

@implementation MTEpisodeSyncStorage

- (id)importContext
{
  v2 = +[MTDB sharedInstance];
  v3 = [v2 importContext];

  return v3;
}

- (NSString)podcastsDomainVersion
{
  v2 = +[SyncKeysRepository shared];
  v3 = [v2 podcastsDomainVersion];

  return (NSString *)v3;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3 = a3;
  id v4 = +[SyncKeysRepository shared];
  [v4 setPodcastsDomainVersion:v3];
}

- (id)versionForKey:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  v5 = [v3 standardUserDefaults];
  v6 = [v5 stringForKey:v4];

  return v6;
}

- (void)setVersion:(id)a3 forKey:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 standardUserDefaults];
  [v8 setObject:v7 forKey:v6];
}

- (void)resetVersionForFeedUrl:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v5 = [(MTEpisodeSyncStorage *)self modernKeyFromFeedUrl:v6];
    [v4 setObject:0 forKey:v5];
  }
}

- (void)resetVersionForAllFeedUrls
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(v2, "dictionaryRepresentation", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 hasPrefix:@"playState:"]) {
          [v2 setObject:0 forKey:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)modernKeyFromFeedUrl:(id)a3
{
  return (id)[@"playState:" stringByAppendingString:a3];
}

- (id)feedUrlFromModernKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 stringByReplacingCharactersInRange:0, objc_msgSend(@"playState:", "length"), &stru_1F03A51F0 withString];

  return v4;
}

@end