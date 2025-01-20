@interface LegacyDownload
- (BOOL)isPausable;
- (BOOL)isPaused;
- (NSNumber)storeCollectionIdentifier;
- (NSNumber)storeItemId;
- (NSString)episodeGuid;
- (NSString)episodeUuid;
- (NSString)podcastUuid;
- (double)downloadProgress;
- (double)downloadRemainingTime;
- (double)percentComplete;
- (id)downloadDescription;
- (int64_t)downloadBytes;
- (int64_t)downloadPhase;
- (int64_t)phase;
- (void)setDownloadBytes:(int64_t)a3;
- (void)setDownloadPhase:(int64_t)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setDownloadRemainingTime:(double)a3;
- (void)setEpisodeGuid:(id)a3;
- (void)setEpisodeUuid:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPodcastUuid:(id)a3;
- (void)setStoreCollectionIdentifier:(id)a3;
- (void)setStoreItemId:(id)a3;
@end

@implementation LegacyDownload

- (NSString)episodeGuid
{
  if (*(void *)&self->episodeGuid[8])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setEpisodeGuid:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *(void *)self->episodeGuid = v4;
  *(void *)&self->episodeGuid[8] = v5;
  swift_retain();
  swift_release();

  swift_bridgeObjectRelease();
}

- (NSNumber)storeCollectionIdentifier
{
  return (NSNumber *)*(id *)self->storeCollectionIdentifier;
}

- (void)setStoreCollectionIdentifier:(id)a3
{
  id v4 = *(id *)self->storeCollectionIdentifier;
  *(void *)self->storeCollectionIdentifier = a3;
  id v3 = a3;
}

- (NSNumber)storeItemId
{
  return (NSNumber *)*(id *)self->storeItemId;
}

- (void)setStoreItemId:(id)a3
{
  id v4 = *(id *)self->storeItemId;
  *(void *)self->storeItemId = a3;
  id v3 = a3;
}

- (NSString)podcastUuid
{
  if (*(void *)&self->podcastUuid[8])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setPodcastUuid:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *(void *)self->podcastUuid = v4;
  *(void *)&self->podcastUuid[8] = v5;
  swift_retain();
  swift_release();

  swift_bridgeObjectRelease();
}

- (NSString)episodeUuid
{
  if (*(void *)&self->episodeUuid[8])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setEpisodeUuid:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *(void *)self->episodeUuid = v4;
  *(void *)&self->episodeUuid[8] = v5;
  swift_retain();
  swift_release();

  swift_bridgeObjectRelease();
}

- (int64_t)downloadBytes
{
  return *(void *)self->downloadBytes;
}

- (void)setDownloadBytes:(int64_t)a3
{
  *(void *)self->downloadBytes = a3;
}

- (int64_t)downloadPhase
{
  return *(void *)self->downloadPhase;
}

- (void)setDownloadPhase:(int64_t)a3
{
  *(void *)self->downloadPhase = a3;
}

- (double)downloadProgress
{
  return *(double *)self->downloadProgress;
}

- (void)setDownloadProgress:(double)a3
{
  *(double *)self->downloadProgress = a3;
}

- (double)downloadRemainingTime
{
  return *(double *)self->downloadRemainingTime;
}

- (void)setDownloadRemainingTime:(double)a3
{
  *(double *)self->downloadRemainingTime = a3;
}

- (BOOL)isPaused
{
  return self->isPaused[0];
}

- (void)setPaused:(BOOL)a3
{
  self->isPaused[0] = a3;
}

- (BOOL)isPausable
{
  return 1;
}

- (id)downloadDescription
{
  if (*(void *)&self->description[15])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return v2;
}

- (double)percentComplete
{
  return *(double *)self->downloadProgress;
}

- (int64_t)phase
{
  return sub_1001DDCE0();
}

@end