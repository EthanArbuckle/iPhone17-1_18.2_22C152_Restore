@interface AASApplicationManager
+ (_TtC8Freeform21AASApplicationManager)shared;
- (BOOL)isSaltRegenerated;
- (BOOL)isSelectedUser;
- (_TtC8Freeform21AASApplicationManager)init;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)applicationWillTerminate;
- (void)setIsSaltRegenerated:(BOOL)a3;
- (void)userIdentifierDidReset:(id)a3;
@end

@implementation AASApplicationManager

+ (_TtC8Freeform21AASApplicationManager)shared
{
  if (qword_10166EDC8 != -1) {
    swift_once();
  }
  v2 = (void *)static AASApplicationManager.shared;

  return (_TtC8Freeform21AASApplicationManager *)v2;
}

- (BOOL)isSaltRegenerated
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC8Freeform21AASApplicationManager_isSaltRegenerated;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSaltRegenerated:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC8Freeform21AASApplicationManager_isSaltRegenerated;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isSelectedUser
{
  return (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21AASApplicationManager_userSamplingManager))[16];
}

- (_TtC8Freeform21AASApplicationManager)init
{
  return (_TtC8Freeform21AASApplicationManager *)sub_10063C3C8();
}

- (void)applicationWillTerminate
{
  v2 = self;
  sub_10063CE4C();
}

- (void)applicationWillEnterForeground
{
  uint64_t v3 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform21AASApplicationManager_isSaltRegenerated;
  swift_beginAccess();
  unsigned char *v7 = 0;
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v10 = self;
  sub_1005912D0((uint64_t)v6, (uint64_t)&unk_101677C00, (uint64_t)v9);

  swift_release();
}

- (void)applicationDidEnterBackground
{
  v2 = self;
  sub_10063E11C();
}

- (void)userIdentifierDidReset:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_10063E204();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void).cxx_destruct
{
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform21AASApplicationManager_userInfo, &qword_101677B60);
  swift_release();
  swift_release();

  swift_release();
  sub_10063F550(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform21AASApplicationManager_sessionPropertiesController));
  swift_release();

  swift_unknownObjectRelease();
}

@end