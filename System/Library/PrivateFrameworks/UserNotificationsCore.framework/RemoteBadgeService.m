@interface RemoteBadgeService
- (BOOL)setBadgeValue:(id)a3 forBundleIdentifier:(id)a4;
- (_TtC21UserNotificationsCore18RemoteBadgeService)init;
- (id)badgeNumberForBundleIdentifier:(id)a3;
@end

@implementation RemoteBadgeService

- (_TtC21UserNotificationsCore18RemoteBadgeService)init
{
  result = (_TtC21UserNotificationsCore18RemoteBadgeService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore18RemoteBadgeService_systemServiceClient));
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  sub_260A84BC0();
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(qword_26A8C7590);
  sub_260A850E0();

  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)setBadgeValue:(id)a3 forBundleIdentifier:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_260A85280();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    id v8 = a4;
    v9 = self;
  }
  sub_260A84BC0();

  char v10 = sub_260A61024((uint64_t)v12);
  swift_bridgeObjectRelease();
  sub_2608E5894((uint64_t)v12);
  return v10 & 1;
}

@end