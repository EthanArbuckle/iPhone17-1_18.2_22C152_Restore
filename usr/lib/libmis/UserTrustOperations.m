@interface UserTrustOperations
- (_TtC3mis19UserTrustOperations)init;
- (id)getAuxiliarySignatureWithTeamId:(id)a3 error:(id *)a4;
- (id)getUserTrustedUUIDsAndReturnError:(id *)a3;
- (id)profileEntryExistsWithUuidString:(id)a3 error:(id *)a4;
@end

@implementation UserTrustOperations

- (id)getAuxiliarySignatureWithTeamId:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_20DC248A8();
  uint64_t v7 = v6;
  v8 = self;
  uint64_t v11 = sub_20DC027E0(v5, v7);
  uint64_t v13 = v12;
  uint64_t v14 = v9;
  unint64_t v15 = v10;
  if (v12)
  {
    sub_20DC02788(v9, v10);
    v16 = (void *)sub_20DC24798();
    sub_20DC02730(v14, v15);
  }
  else
  {
    v16 = 0;
  }
  id v17 = [objc_allocWithZone((Class)MISUserTrustSignature) initWithSignature:v16];

  if (v17)
  {
    sub_20DC03558(v11, v13, v14, v15);
    swift_bridgeObjectRelease();

    return v17;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)getUserTrustedUUIDsAndReturnError:(id *)a3
{
  v3 = self;
  sub_20DC02E2C();

  v4 = (void *)sub_20DC24908();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)profileEntryExistsWithUuidString:(id)a3 error:(id *)a4
{
  sub_20DC248A8();
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_20DC0D244();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC3mis19UserTrustOperations)init
{
  uint64_t v3 = OBJC_IVAR____TtC3mis19UserTrustOperations_utdb;
  type metadata accessor for UserTrustDB();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_20DC0211C(1);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for UserTrustOperations();
  return [(UserTrustOperations *)&v6 init];
}

- (void).cxx_destruct
{
}

@end