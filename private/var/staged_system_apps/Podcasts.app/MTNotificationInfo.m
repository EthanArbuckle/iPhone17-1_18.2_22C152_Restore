@interface MTNotificationInfo
- (MTNotificationInfo)init;
- (NSArray)podcasts;
- (id)addPodcastWithTitle:(id)a3 uuid:(id)a4;
- (id)descriptionForNotificationLogging;
- (id)podcastForUuid:(id)a3;
- (void)addPodcast:(id)a3;
@end

@implementation MTNotificationInfo

- (MTNotificationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTNotificationInfo;
  v2 = [(MTNotificationInfo *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    podcasts = v2->_podcasts;
    v2->_podcasts = v3;
  }
  return v2;
}

- (id)addPodcastWithTitle:(id)a3 uuid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[MTNotificationPodcast alloc] initWithUuid:v6 title:v7];

  [(MTNotificationInfo *)self addPodcast:v8];

  return v8;
}

- (void)addPodcast:(id)a3
{
  podcasts = self->_podcasts;
  id v4 = a3;
  id v5 = [v4 uuid];
  [(NSMutableDictionary *)podcasts setObject:v4 forKey:v5];
}

- (id)podcastForUuid:(id)a3
{
  return [(NSMutableDictionary *)self->_podcasts objectForKey:a3];
}

- (NSArray)podcasts
{
  return (NSArray *)[(NSMutableDictionary *)self->_podcasts allValues];
}

- (id)descriptionForNotificationLogging
{
  v3 = [(MTNotificationInfo *)self podcasts];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = +[NSMutableString string];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(MTNotificationInfo *)self podcasts];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) descriptionForNotificationLogging];
          [(__CFString *)v5 appendString:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = @"(no content)";
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end