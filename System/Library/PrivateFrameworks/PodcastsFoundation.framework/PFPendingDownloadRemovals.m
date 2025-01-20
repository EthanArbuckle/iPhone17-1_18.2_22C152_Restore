@interface PFPendingDownloadRemovals
- (PFPendingDownloadRemovals)init;
- (id)initFromUserDefaults:(id)a3;
- (void)appendEpisodeUUIDsForDeletion:(id)a3;
- (void)writeToUserDefaults:(id)a3;
@end

@implementation PFPendingDownloadRemovals

- (id)initFromUserDefaults:(id)a3
{
  return PendingDownloadRemovals.init(from:)(a3);
}

- (void)appendEpisodeUUIDsForDeletion:(id)a3
{
  uint64_t v4 = sub_1ACE76578();
  v5 = self;
  sub_1ACC122A8(v4);
  v6 = *(os_unfair_lock_s **)((char *)&v5->super.isa + OBJC_IVAR___PFPendingDownloadRemovals_episodesPendingDeletion);
  uint64_t v7 = (uint64_t)&v6[4];
  v8 = v6 + 6;
  os_unfair_lock_lock(v6 + 6);
  sub_1ACC149D4(v7);
  os_unfair_lock_unlock(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)writeToUserDefaults:(id)a3
{
  uint64_t v5 = sub_1ACE761B8();
  unint64_t v7 = v6;
  id v8 = a3;
  v9 = self;
  sub_1ACC1342C((uint64_t)v9, v5, v7);

  swift_bridgeObjectRelease();
}

- (PFPendingDownloadRemovals)init
{
  result = (PFPendingDownloadRemovals *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end