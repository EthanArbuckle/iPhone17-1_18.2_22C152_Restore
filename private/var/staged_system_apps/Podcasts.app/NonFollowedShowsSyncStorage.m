@interface NonFollowedShowsSyncStorage
+ (void)resetNonFollowedShowsSync;
- (_TtC8Podcasts27NonFollowedShowsSyncStorage)init;
@end

@implementation NonFollowedShowsSyncStorage

- (_TtC8Podcasts27NonFollowedShowsSyncStorage)init
{
  return (_TtC8Podcasts27NonFollowedShowsSyncStorage *)sub_1001B8788();
}

- (void).cxx_destruct
{
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts27NonFollowedShowsSyncStorage_fetchNonFollowedShows);
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts27NonFollowedShowsSyncStorage_podcastsStateCoordinator);
}

+ (void)resetNonFollowedShowsSync
{
  type metadata accessor for SyncKeysRepository();
  v2 = (void *)static SyncKeysRepository.shared.getter();
  SyncKeysRepository.nonFollowedShowsLastSyncTimestamp.setter();

  v3 = (void *)static SyncKeysRepository.shared.getter();
  SyncKeysRepository.nonFollowedShowsSyncVersion.setter();

  id v4 = (id)static SyncKeysRepository.shared.getter();
  SyncKeysRepository.isNonFollowedShowsSyncDirty.setter();
}

@end