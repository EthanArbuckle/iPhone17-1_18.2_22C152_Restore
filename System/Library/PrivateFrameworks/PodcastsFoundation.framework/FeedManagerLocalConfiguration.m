@interface FeedManagerLocalConfiguration
+ (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)platformSpecificConfiguration;
- (BOOL)keepsFeedFileInTempDirAfterDownload;
- (BOOL)supportsBatchInsertion;
- (BOOL)useBackgroundFetchForFeedDownloads;
- (BOOL)usesCleanEpisodeTitles;
- (BOOL)workQueueConcurrent;
- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)init;
- (double)timeoutIntervalForResource;
- (int64_t)concurrentBootstrapUpdateLimit;
- (int64_t)concurrentDeltaUpdateLimit;
- (int64_t)concurrentRSSUpdateLimit;
@end

@implementation FeedManagerLocalConfiguration

- (double)timeoutIntervalForResource
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_timeoutIntervalForResource);
}

- (int64_t)concurrentDeltaUpdateLimit
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_concurrentDeltaUpdateLimit);
}

- (int64_t)concurrentBootstrapUpdateLimit
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_concurrentBootstrapUpdateLimit);
}

- (int64_t)concurrentRSSUpdateLimit
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_concurrentRSSUpdateLimit);
}

- (BOOL)useBackgroundFetchForFeedDownloads
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_useBackgroundFetchForFeedDownloads);
}

- (BOOL)keepsFeedFileInTempDirAfterDownload
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_keepsFeedFileInTempDirAfterDownload);
}

- (BOOL)usesCleanEpisodeTitles
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration_usesCleanEpisodeTitles);
}

+ (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)platformSpecificConfiguration
{
  if (objc_msgSend(self, sel_isRunningOnHomepod))
  {
    if (qword_1E99EFE70 != -1) {
      swift_once();
    }
    v2 = &qword_1E99F16E0;
  }
  else
  {
    if (qword_1EB76CBB8 != -1) {
      swift_once();
    }
    v2 = &qword_1EB76CBB0;
  }
  v3 = (void *)*v2;
  return (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration *)v3;
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)init
{
  result = (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)supportsBatchInsertion
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration__supportsBatchInsertion);
}

- (BOOL)workQueueConcurrent
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation29FeedManagerLocalConfiguration__workQueueConcurrent);
}

@end