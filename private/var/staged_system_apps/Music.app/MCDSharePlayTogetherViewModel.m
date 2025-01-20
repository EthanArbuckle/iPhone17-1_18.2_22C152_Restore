@interface MCDSharePlayTogetherViewModel
+ (NSString)notificationName;
- (BOOL)isActive;
- (_TtC5Music29MCDSharePlayTogetherViewModel)init;
- (int64_t)connectedParticipantsCount;
- (int64_t)pendingParticipantsCount;
@end

@implementation MCDSharePlayTogetherViewModel

+ (NSString)notificationName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (int64_t)connectedParticipantsCount
{
  NSString v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music29MCDSharePlayTogetherViewModel_session);
  v3 = *(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x1B0);
  v4 = self;
  v5 = v2;
  int64_t v6 = v3();

  return v6;
}

- (int64_t)pendingParticipantsCount
{
  NSString v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music29MCDSharePlayTogetherViewModel_session);
  v3 = *(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x1E0);
  v4 = self;
  v5 = v2;
  int64_t v6 = v3();

  return v6;
}

- (BOOL)isActive
{
  NSString v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music29MCDSharePlayTogetherViewModel_session);
  v3 = *(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x268);
  v4 = self;
  v5 = v2;
  LOBYTE(v3) = v3();

  return v3 & 1;
}

- (_TtC5Music29MCDSharePlayTogetherViewModel)init
{
  result = (_TtC5Music29MCDSharePlayTogetherViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end