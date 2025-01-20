@interface CRLGelatoInterstitialUIController
- (_TtC8Freeform33CRLGelatoInterstitialUIController)init;
- (void)currentUserGainedEditPermissions;
- (void)currentUserLostEditPermissions;
- (void)dealloc;
- (void)newParticipantJoinedSessionWithNotification:(id)a3;
- (void)realTimeSessionDidStartOrEndWithNotification:(id)a3;
- (void)realTimeSessionParticipantsChangedWithNotification:(id)a3;
- (void)shareStateUpdatedWithShare:(id)a3;
@end

@implementation CRLGelatoInterstitialUIController

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  char v4 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLGelatoInterstitialUIController_isTornDown);
  v5 = self;
  if ((v4 & 1) == 0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/Gelato/CRLGelatoInterstitialUIController.swift", 116, 2, 83, (uint64_t)"Deallocated without calling tearDown()!", 39, 2u, (uint64_t)_swiftEmptyArrayStorage);
    LOBYTE(v8) = 2;
    v6 = "Deallocated without calling tearDown()!";
    uint64_t v7 = 39;
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/Gelato/CRLGelatoInterstitialUIController.swift", 116, 2, 83);
  }
  v9.receiver = v5;
  v9.super_class = ObjectType;
  [(CRLGelatoInterstitialUIController *)&v9 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLGelatoInterstitialUIController_boardLibrary));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform33CRLGelatoInterstitialUIController__isBoardShared;
  uint64_t v4 = sub_1005057FC(&qword_10169FCE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLGelatoInterstitialUIController_collabUIItem);
}

- (void)newParticipantJoinedSessionWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100DEC0A8();
}

- (void)realTimeSessionParticipantsChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100DEC24C();
}

- (void)realTimeSessionDidStartOrEndWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100DEC3F0();
}

- (_TtC8Freeform33CRLGelatoInterstitialUIController)init
{
  result = (_TtC8Freeform33CRLGelatoInterstitialUIController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)shareStateUpdatedWithShare:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100DEB108(a3);
}

- (void)currentUserLostEditPermissions
{
}

- (void)currentUserGainedEditPermissions
{
}

@end