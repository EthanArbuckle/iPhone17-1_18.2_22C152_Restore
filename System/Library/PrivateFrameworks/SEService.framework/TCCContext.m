@interface TCCContext
+ (int64_t)checkTCCAccessWithoutLoadingTo:(int64_t)a3 for:(id)a4;
- (_TtC9SEService10TCCContext)init;
- (int64_t)checkTCCAccessTo:(int64_t)a3 for:(id)a4;
@end

@implementation TCCContext

+ (int64_t)checkTCCAccessWithoutLoadingTo:(int64_t)a3 for:(id)a4
{
  uint64_t v5 = sub_2147ACF58();
  _s9SEService10TCCContextC28checkTCCAccessWithoutLoading2to3forAC0D0OAC10TCCServiceO_SStFZ_0(a3, v5, v6);
  int64_t v8 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)checkTCCAccessTo:(int64_t)a3 for:(id)a4
{
  uint64_t v6 = sub_2147ACF58();
  uint64_t v8 = v7;
  v9 = self;
  int64_t v10 = TCCContext.checkTCCAccess(to:for:)(a3, v6, v8);

  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC9SEService10TCCContext)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService10TCCContext_hceService) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService10TCCContext_secService) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(TCCContext *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end