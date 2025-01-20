@interface UserTrustDB
- (BOOL)setupSchema;
- (_TtC17online_auth_agent11UserTrustDB)init;
- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3;
- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4;
- (void)setupPermissions;
@end

@implementation UserTrustDB

- (BOOL)setupSchema
{
  v2 = self;
  unsigned __int8 v3 = sub_100012878();

  return v3 & 1;
}

- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3
{
  uint64_t v4 = sub_10003FBA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003FB40();
  sub_10003FB20(v8);
  v10 = v9;
  v11 = (objc_class *)type metadata accessor for UserTrustDB();
  v14.receiver = self;
  v14.super_class = v11;
  v12 = [(SQLDB *)&v14 initWithDatabaseURL:v10];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_10003FBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003FB40();
  sub_10003FB20(v10);
  v12 = v11;
  v13 = (objc_class *)type metadata accessor for UserTrustDB();
  v16.receiver = self;
  v16.super_class = v13;
  objc_super v14 = [(SQLDB *)&v16 initWithDatabaseURL:v12 asReadOnly:v4];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14;
}

- (void)setupPermissions
{
  v2 = self;
  sub_10002B548();
}

- (_TtC17online_auth_agent11UserTrustDB)init
{
  result = (_TtC17online_auth_agent11UserTrustDB *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end