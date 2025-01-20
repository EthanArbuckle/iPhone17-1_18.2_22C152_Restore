@interface UserTrustDB
- (BOOL)setupSchema;
- (_TtC3mis11UserTrustDB)init;
- (_TtC3mis11UserTrustDB)initWithDatabaseURL:(id)a3;
- (_TtC3mis11UserTrustDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4;
- (void)setupPermissions;
@end

@implementation UserTrustDB

- (_TtC3mis11UserTrustDB)initWithDatabaseURL:(id)a3
{
  uint64_t v4 = sub_20DC24758();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DC24728();
  v8 = (void *)sub_20DC24708();
  v9 = (objc_class *)type metadata accessor for UserTrustDB();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = [(SQLDB *)&v12 initWithDatabaseURL:v8];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

- (_TtC3mis11UserTrustDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_20DC24758();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DC24728();
  v10 = (void *)sub_20DC24708();
  v11 = (objc_class *)type metadata accessor for UserTrustDB();
  v14.receiver = self;
  v14.super_class = v11;
  objc_super v12 = [(SQLDB *)&v14 initWithDatabaseURL:v10 asReadOnly:v4];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)setupPermissions
{
  v2 = self;
  sub_20DC02414();
}

- (_TtC3mis11UserTrustDB)init
{
  result = (_TtC3mis11UserTrustDB *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)setupSchema
{
  v2 = self;
  unsigned __int8 v3 = sub_20DC092D0();

  return v3 & 1;
}

@end