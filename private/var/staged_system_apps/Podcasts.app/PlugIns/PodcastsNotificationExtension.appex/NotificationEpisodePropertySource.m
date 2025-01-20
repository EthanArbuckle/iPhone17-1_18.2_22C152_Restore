@interface NotificationEpisodePropertySource
- (BOOL)isSourceOfTruth;
- (BOOL)requiresForegroundLaunch;
- (MTNotificationEpisode)episode;
- (NotificationEpisodePropertySource)initWithNotification:(id)a3 episode:(id)a4;
- (UNNotification)notification;
- (id)localizedDateString;
- (id)localizedDurationAndPodcastTitleString;
- (id)localizedDurationString;
- (id)openEpisodeDetailInAppURL;
- (id)openPodcastDetailInAppURL;
- (id)podcastTitle;
- (id)podcastUuid;
- (id)preloadedImageWithSize:(CGSize)a3;
- (id)summary;
- (id)title;
- (id)uuid;
- (void)initiatePlaybackWithCompletion:(id)a3;
@end

@implementation NotificationEpisodePropertySource

- (NotificationEpisodePropertySource)initWithNotification:(id)a3 episode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NotificationEpisodePropertySource;
  v9 = [(NotificationEpisodePropertySource *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notification, a3);
    objc_storeStrong((id *)&v10->_episode, a4);
    v11 = [(MTNotificationEpisode *)v10->_episode sortPropertyValues];
    [(BaseEpisodePropertySource *)v10 setSortPropertyValues:v11];
  }
  return v10;
}

- (BOOL)isSourceOfTruth
{
  return 0;
}

- (id)uuid
{
  return [(MTNotificationEpisode *)self->_episode uuid];
}

- (id)title
{
  return [(MTNotificationEpisode *)self->_episode bestTitle];
}

- (id)podcastUuid
{
  return [(MTNotificationEpisode *)self->_episode podcastUuid];
}

- (id)podcastTitle
{
  return [(MTNotificationEpisode *)self->_episode podcastTitle];
}

- (id)summary
{
  return [(MTNotificationEpisode *)self->_episode bestSummary];
}

- (BOOL)requiresForegroundLaunch
{
  return [(MTNotificationEpisode *)self->_episode isVideo];
}

- (id)localizedDateString
{
  v3 = [(MTNotificationEpisode *)self->_episode pubDate];
  v4 = [(BaseEpisodePropertySource *)self _localizedDateStringForDate:v3];

  return v4;
}

- (id)localizedDurationString
{
  [(MTNotificationEpisode *)self->_episode duration];

  return -[BaseEpisodePropertySource _localizedStringForDuration:](self, "_localizedStringForDuration:");
}

- (id)localizedDurationAndPodcastTitleString
{
  [(MTNotificationEpisode *)self->_episode duration];
  double v4 = v3;
  v5 = [(MTNotificationEpisode *)self->_episode podcastTitle];
  v6 = [(BaseEpisodePropertySource *)self _localizedStringForDuration:v5 podcastTitle:v4];

  return v6;
}

- (id)preloadedImageWithSize:(CGSize)a3
{
  double v4 = [(UNNotification *)self->_notification request];
  v5 = [v4 content];
  v6 = [(MTNotificationEpisode *)self->_episode podcastUuid];
  id v7 = [v5 mt_attachedImageForCacheKey:v6];

  return v7;
}

- (id)openPodcastDetailInAppURL
{
  double v3 = [(MTNotificationEpisode *)self->_episode podcastUuid];
  double v4 = [(BaseEpisodePropertySource *)self _openPodcastDetailInAppURLForPodcastUuid:v3 podcastStoreCollectionId:[(MTNotificationEpisode *)self->_episode podcastStoreCollectionId]];

  return v4;
}

- (id)openEpisodeDetailInAppURL
{
  double v3 = [(MTNotificationEpisode *)self->_episode uuid];
  double v4 = [(BaseEpisodePropertySource *)self _openEpisodeDetailInAppURLForEpisodeUuid:v3 episodeStoreTrackId:[(MTNotificationEpisode *)self->_episode storeTrackId] podcastStoreCollectionId:[(MTNotificationEpisode *)self->_episode podcastStoreCollectionId]];

  return v4;
}

- (void)initiatePlaybackWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MTNotificationEpisode *)self->_episode uuid];
  int64_t v6 = [(MTNotificationEpisode *)self->_episode storeTrackId];
  id v7 = [(MTNotificationEpisode *)self->_episode podcastUuid];
  int64_t v8 = [(MTNotificationEpisode *)self->_episode podcastStoreCollectionId];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000ED5C;
  v10[3] = &unk_10002CDE0;
  id v11 = v4;
  id v9 = v4;
  [(BaseEpisodePropertySource *)self _initiatePlaybackWithDefaultBehaviorForEpisodeUUid:v5 episodeStoreTrackId:v6 podcastUuid:v7 podcastStoreCollectionId:v8 completion:v10];
}

- (UNNotification)notification
{
  return self->_notification;
}

- (MTNotificationEpisode)episode
{
  return self->_episode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episode, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end