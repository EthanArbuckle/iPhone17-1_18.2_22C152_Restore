@interface LaunchWarningOperations
- (BOOL)setUserOverride:(BOOL)a3 forID:(unint64_t)a4 error:(id *)a5;
- (BOOL)syncLaunchWarningsAndReturnError:(id *)a3;
- (_TtC17online_auth_agent23LaunchWarningOperations)init;
- (id)lookupLaunchWarningData:(id)a3 cdhashType:(unsigned int)a4 error:(id *)a5;
@end

@implementation LaunchWarningOperations

- (_TtC17online_auth_agent23LaunchWarningOperations)init
{
  return (_TtC17online_auth_agent23LaunchWarningOperations *)sub_100027AA0();
}

- (BOOL)setUserOverride:(BOOL)a3 forID:(unint64_t)a4 error:(id *)a5
{
  v7 = self;
  sub_100027F0C(a3, a4);

  return 1;
}

- (id)lookupLaunchWarningData:(id)a3 cdhashType:(unsigned int)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = self;
  uint64_t v9 = sub_10003FC30();
  unint64_t v11 = v10;

  uint64_t v12 = sub_1000283A8(v9, v11, a4);
  unint64_t v14 = v13;

  sub_100012D88(v9, v11);
  v15.super.isa = sub_10003FC10().super.isa;
  sub_100012D88(v12, v14);

  return v15.super.isa;
}

- (BOOL)syncLaunchWarningsAndReturnError:(id *)a3
{
  v3 = self;
  sub_100028C9C();

  return 1;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100015838((uint64_t)self + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_syncQueue);
}

@end