@interface MTEpisodeLookupRequest
- (NSString)episodeGuid;
- (NSString)episodeTitle;
- (NSString)podcastFeedUrl;
- (NSString)podcastTitle;
- (NSString)streamUrl;
- (NSString)uuid;
- (int64_t)persistentID;
- (int64_t)storeTrackId;
- (void)setEpisodeGuid:(id)a3;
- (void)setEpisodeTitle:(id)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setPodcastFeedUrl:(id)a3;
- (void)setPodcastTitle:(id)a3;
- (void)setStoreTrackId:(int64_t)a3;
- (void)setStreamUrl:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation MTEpisodeLookupRequest

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)storeTrackId
{
  return self->_storeTrackId;
}

- (void)setStoreTrackId:(int64_t)a3
{
  self->_storeTrackId = a3;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (NSString)episodeGuid
{
  return self->_episodeGuid;
}

- (void)setEpisodeGuid:(id)a3
{
}

- (NSString)podcastFeedUrl
{
  return self->_podcastFeedUrl;
}

- (void)setPodcastFeedUrl:(id)a3
{
}

- (NSString)episodeTitle
{
  return self->_episodeTitle;
}

- (void)setEpisodeTitle:(id)a3
{
}

- (NSString)podcastTitle
{
  return self->_podcastTitle;
}

- (void)setPodcastTitle:(id)a3
{
}

- (NSString)streamUrl
{
  return self->_streamUrl;
}

- (void)setStreamUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamUrl, 0);
  objc_storeStrong((id *)&self->_podcastTitle, 0);
  objc_storeStrong((id *)&self->_episodeTitle, 0);
  objc_storeStrong((id *)&self->_podcastFeedUrl, 0);
  objc_storeStrong((id *)&self->_episodeGuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end