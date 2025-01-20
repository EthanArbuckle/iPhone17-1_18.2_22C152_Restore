@interface MTNotificationPodcast
- (MTNotificationPodcast)initWithUuid:(id)a3 title:(id)a4;
- (NSArray)episodes;
- (NSString)title;
- (NSString)uuid;
- (id)descriptionForNotificationLogging;
- (void)addEpisode:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation MTNotificationPodcast

- (MTNotificationPodcast)initWithUuid:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTNotificationPodcast;
  v9 = [(MTNotificationPodcast *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_title, a4);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    episodes = v10->_episodes;
    v10->_episodes = v11;
  }
  return v10;
}

- (void)addEpisode:(id)a3
{
}

- (NSArray)episodes
{
  return (NSArray *)self->_episodes;
}

- (id)descriptionForNotificationLogging
{
  v3 = [(MTNotificationPodcast *)self episodes];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(MTNotificationPodcast *)self episodes];
    v6 = [v5 mt_compactMap:&stru_10054DEE0];

    id v7 = [v6 componentsJoinedByString:@", "];
    id v8 = [(MTNotificationPodcast *)self uuid];
    +[NSString stringWithFormat:@"podcastUuid = %@, episodeUuids = %@", v8, v7];
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = @"(no content)";
  }

  return v9;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_episodes, 0);
}

@end