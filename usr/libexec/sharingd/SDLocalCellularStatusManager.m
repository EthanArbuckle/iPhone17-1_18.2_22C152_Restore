@interface SDLocalCellularStatusManager
- (BOOL)getCellularSlicingStateForDevice:(id)a3;
- (_TtC16DaemoniOSLibrary28SDLocalCellularStatusManager)init;
- (id)statusUpdated;
- (void)publishCellularSlicingEnabledAs:(BOOL)a3;
- (void)setStatusUpdated:(id)a3;
- (void)subscribeForCellularSlicingAvailability;
@end

@implementation SDLocalCellularStatusManager

- (id)statusUpdated
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16DaemoniOSLibrary28SDLocalCellularStatusManager_statusUpdated))
  {
    uint64_t v2 = *(void *)&self->cellularSlicingObservations[OBJC_IVAR____TtC16DaemoniOSLibrary28SDLocalCellularStatusManager_statusUpdated];
    v5[4] = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary28SDLocalCellularStatusManager_statusUpdated);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1005E47A0;
    v5[3] = &unk_1008E1620;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setStatusUpdated:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1005E7BBC;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)())((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary28SDLocalCellularStatusManager_statusUpdated);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16DaemoniOSLibrary28SDLocalCellularStatusManager_statusUpdated);
  *v7 = v6;
  v7[1] = (void (*)())v4;

  sub_1002CA430(v8);
}

- (void)publishCellularSlicingEnabledAs:(BOOL)a3
{
  uint64_t v5 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SFPlatform();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = self;
  static SFPlatform.iOS.getter();
  char v13 = static SFPlatform.isPlatform(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v13)
  {
    uint64_t v14 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 1, 1, v14);
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = 0;
    *(void *)(v15 + 24) = 0;
    *(void *)(v15 + 32) = v12;
    *(unsigned char *)(v15 + 40) = a3;
    v16 = v12;
    sub_10028CFA8((uint64_t)v7, (uint64_t)&unk_10097AFC8, v15);

    swift_release();
  }
  else
  {
  }
}

- (void)subscribeForCellularSlicingAvailability
{
  uint64_t v3 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SFPlatform();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = self;
  static SFPlatform.visionOS.getter();
  char v11 = static SFPlatform.isPlatform(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v11)
  {
    uint64_t v12 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 1, 1, v12);
    char v13 = (void *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = v10;
    uint64_t v14 = v10;
    sub_10028CFA8((uint64_t)v5, (uint64_t)&unk_10097AF98, (uint64_t)v13);

    swift_release();
  }
  else
  {
  }
}

- (BOOL)getCellularSlicingStateForDevice:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  char v8 = sub_1005E7214(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (_TtC16DaemoniOSLibrary28SDLocalCellularStatusManager)init
{
  return (_TtC16DaemoniOSLibrary28SDLocalCellularStatusManager *)sub_1005E7448();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary28SDLocalCellularStatusManager_tetheringLSKKey;
  uint64_t v4 = sub_10000A844(&qword_10097B010);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16DaemoniOSLibrary28SDLocalCellularStatusManager_statusUpdated);

  sub_1002CA430(v5);
}

@end