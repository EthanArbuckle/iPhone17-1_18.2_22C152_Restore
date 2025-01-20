@interface UserTrustAgentOperations
- (BOOL)createUserTrustedProfileEntryWithUuid:(id)a3 teamId:(id)a4 signature:(id)a5 error:(id *)a6;
- (BOOL)deleteTrustedProfileWithUuid:(id)a3 error:(id *)a4;
- (_TtC17online_auth_agent24UserTrustAgentOperations)init;
@end

@implementation UserTrustAgentOperations

- (BOOL)createUserTrustedProfileEntryWithUuid:(id)a3 teamId:(id)a4 signature:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_10003FD30();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003FD20();
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    v21 = self;
    uint64_t v18 = 0;
    unint64_t v20 = 0xF000000000000000;
    goto LABEL_6;
  }
  uint64_t v13 = sub_10003FEA0();
  a4 = v14;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  id v15 = a5;
  uint64_t v23 = v10;
  id v16 = v15;
  v17 = self;
  uint64_t v18 = sub_10003FC30();
  unint64_t v20 = v19;

  uint64_t v10 = v23;
LABEL_6:
  UserTrustAgentOperations.createUserTrustedProfileEntry(uuid:teamId:signature:)((uint64_t)v12, v13, (uint64_t)a4, v18, v20);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  sub_100013318(v18, v20);
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)deleteTrustedProfileWithUuid:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_10003FD30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003FD20();
  uint64_t v9 = self;
  sub_10002A728((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (_TtC17online_auth_agent24UserTrustAgentOperations)init
{
  uint64_t v3 = OBJC_IVAR____TtC17online_auth_agent24UserTrustAgentOperations_utdb;
  type metadata accessor for UserTrustDB();
  v4 = self;
  char v5 = sub_100018080();
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_10002B250(v5 & 1);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for UserTrustAgentOperations();
  return [(UserTrustAgentOperations *)&v7 init];
}

- (void).cxx_destruct
{
}

@end