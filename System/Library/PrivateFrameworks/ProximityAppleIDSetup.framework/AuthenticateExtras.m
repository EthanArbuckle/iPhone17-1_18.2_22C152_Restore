@interface AuthenticateExtras
- (_TtC21ProximityAppleIDSetupP33_6B22B88DD3ECBED0D0354FC242B14C8118AuthenticateExtras)init;
- (void)fetchExtrasWithCompletion:(id)a3;
@end

@implementation AuthenticateExtras

- (void)fetchExtrasWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC21ProximityAppleIDSetupP33_6B22B88DD3ECBED0D0354FC242B14C8118AuthenticateExtras_anisetteDataProvider);
  v6 = (void (*)(void *, uint64_t, void))v4[2];
  v7 = self;
  v6(v4, v5, 0);
  _Block_release(v4);
}

- (_TtC21ProximityAppleIDSetupP33_6B22B88DD3ECBED0D0354FC242B14C8118AuthenticateExtras)init
{
  result = (_TtC21ProximityAppleIDSetupP33_6B22B88DD3ECBED0D0354FC242B14C8118AuthenticateExtras *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end