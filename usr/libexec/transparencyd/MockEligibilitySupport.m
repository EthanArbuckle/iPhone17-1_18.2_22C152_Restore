@interface MockEligibilitySupport
- (NSURL)databaseDir;
- (_TtC13transparencyd22MockEligibilitySupport)init;
- (id)eligibilityContainerPathAndReturnError:(id *)a3;
- (void)checkiCloudAnalyticsWithCompletionHandler:(id)a3;
- (void)setDatabaseDir:(id)a3;
@end

@implementation MockEligibilitySupport

- (NSURL)databaseDir
{
  uint64_t v3 = sub_100080E08(&qword_10031F4B0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC13transparencyd22MockEligibilitySupport_databaseDir;
  swift_beginAccess();
  sub_10008813C((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v10;
}

- (void)setDatabaseDir:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F4B0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC13transparencyd22MockEligibilitySupport_databaseDir;
  swift_beginAccess();
  v11 = self;
  sub_1000DC92C((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (_TtC13transparencyd22MockEligibilitySupport)init
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC13transparencyd22MockEligibilitySupport_databaseDir;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd22MockEligibilitySupport_iCloudAnalyticsFlag) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MockEligibilitySupport();
  return [(MockEligibilitySupport *)&v6 init];
}

- (void)checkiCloudAnalyticsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100321920;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100321928;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_100321930, (uint64_t)v12);
  swift_release();
}

- (id)eligibilityContainerPathAndReturnError:(id *)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  int64_t v9 = sub_1000DC83C(8);
  unint64_t v11 = v10;
  Swift::String v12 = Data.base64EncodedString(options:)(0);
  sub_100080CB0(v9, v11);
  (*(void (**)(uint64_t, void *))((swift_isaMask & (uint64_t)v8->super.isa) + 0x98))(v12._countAndFlagsBits, v12._object);

  swift_bridgeObjectRelease();
  URL._bridgeToObjectiveC()(v13);
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v15;
}

- (void).cxx_destruct
{
}

@end