@interface MigratorConfig
- (BOOL)isDataSeparated;
- (BOOL)shouldPrepareForBackgroundRestore;
- (BOOL)shouldRegisterSafeHarbors;
- (BOOL)shouldResetTetheredSyncAnchors;
- (MBServiceAccount)account;
- (NSString)description;
- (NSString)placeholderRestoreDirectory;
- (NSString)safeHarborDirectory;
- (NSURL)demotedAppsPlist;
- (NSURL)migratorCacheURL;
- (_TtC7backupd14MigratorConfig)init;
- (_TtC7backupd14MigratorConfig)initWithDataSeparatedAccount:(id)a3;
- (_TtC7backupd14MigratorConfig)initWithPersonaID:(id)a3 didRestoreFromBackup:(BOOL)a4 didRestoreFromCloudBackup:(BOOL)a5 error:(id *)a6;
@end

@implementation MigratorConfig

- (NSString)safeHarborDirectory
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)placeholderRestoreDirectory
{
  NSString v2 = (char *)self + OBJC_IVAR____TtC7backupd14MigratorConfig_state;
  if (self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state + 8] == 1)
  {
    v4 = *(void **)v2;
    v3 = (void *)*((void *)v2 + 1);
    v5 = self;
    sub_100040624(v4, v3, 1);
    id v6 = [v4 persona];
    id v7 = [v6 placeholderRestoreDirectory];

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    sub_100040654(v4, v3, 1);
  }
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (NSURL)migratorCacheURL
{
  uint64_t v3 = sub_100006FC8(&qword_10047D068);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MigratorConfig_state);
  id v7 = *(void **)&self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state];
  char v8 = self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state + 8];
  v9 = self;
  sub_10003F8A4(v6, v7, v8, (uint64_t)v5);

  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) != 1)
  {
    URL._bridgeToObjectiveC()(v12);
    v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
  }
  return (NSURL *)v13;
}

- (NSURL)demotedAppsPlist
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = self;
  sub_100040174();

  URL._bridgeToObjectiveC()(v8);
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v10;
}

- (MBServiceAccount)account
{
  if (self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state + 8] == 1) {
    id v2 = *(id *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MigratorConfig_state);
  }
  else {
    id v2 = 0;
  }
  return (MBServiceAccount *)v2;
}

- (BOOL)shouldPrepareForBackgroundRestore
{
  return self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state + 8] == 0;
}

- (BOOL)shouldResetTetheredSyncAnchors
{
  return self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state + 8] != 1;
}

- (BOOL)isDataSeparated
{
  if (self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state + 8] != 1) {
    return 0;
  }
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MigratorConfig_state);
  uint64_t v3 = self;
  id v4 = [v2 persona];
  unsigned __int8 v5 = [v4 isDataSeparatedPersona];

  return v5;
}

- (BOOL)shouldRegisterSafeHarbors
{
  return self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state + 8] != 1;
}

- (NSString)description
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MigratorConfig_state);
  uint64_t v3 = *(void **)&self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state];
  char v4 = self->state[OBJC_IVAR____TtC7backupd14MigratorConfig_state + 8];
  unsigned __int8 v5 = self;
  sub_10003FC28(v2, v3, v4);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC7backupd14MigratorConfig)initWithPersonaID:(id)a3 didRestoreFromBackup:(BOOL)a4 didRestoreFromCloudBackup:(BOOL)a5 error:(id *)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = self;
  uint64_t v14 = sub_100040C98((uint64_t)a3, v12, a4, a5);
  v15 = (char *)v13 + OBJC_IVAR____TtC7backupd14MigratorConfig_state;
  *(void *)v15 = v14;
  *((void *)v15 + 1) = v16;
  v15[16] = v17;

  v19.receiver = v13;
  v19.super_class = ObjectType;
  return [(MigratorConfig *)&v19 init];
}

- (_TtC7backupd14MigratorConfig)initWithDataSeparatedAccount:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  NSString v6 = (char *)self + OBJC_IVAR____TtC7backupd14MigratorConfig_state;
  *(void *)NSString v6 = a3;
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v7 = a3;
  return [(MigratorConfig *)&v9 init];
}

- (_TtC7backupd14MigratorConfig)init
{
  result = (_TtC7backupd14MigratorConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end