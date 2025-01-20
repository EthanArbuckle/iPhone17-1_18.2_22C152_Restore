@interface MTMusicSubscriptionInfoSyncUtil
- (MTMusicSubscriptionInfoSyncUtil)init;
- (MTMusicSubscriptionInfoSyncUtil)initWithBag:(id)a3 accountStore:(id)a4;
@end

@implementation MTMusicSubscriptionInfoSyncUtil

- (MTMusicSubscriptionInfoSyncUtil)initWithBag:(id)a3 accountStore:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = (MTMusicSubscriptionInfoSyncUtil *)sub_1ACCE74CC((uint64_t)a3, v7, (char *)self);
  swift_unknownObjectRelease();

  return v8;
}

- (MTMusicSubscriptionInfoSyncUtil)init
{
  result = (MTMusicSubscriptionInfoSyncUtil *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  v3 = (char *)self + OBJC_IVAR___MTMusicSubscriptionInfoSyncUtil_lastMusicSyncDate;
  uint64_t v4 = sub_1ACE750A8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end