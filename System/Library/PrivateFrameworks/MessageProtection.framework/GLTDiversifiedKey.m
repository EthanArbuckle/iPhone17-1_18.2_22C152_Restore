@interface GLTDiversifiedKey
- (NSData)trackingPreventionSalt;
- (_TtC17MessageProtection17GLTDiversifiedKey)init;
- (__SecKey)diversifiedKey;
@end

@implementation GLTDiversifiedKey

- (__SecKey)diversifiedKey
{
  return (__SecKey *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC17MessageProtection17GLTDiversifiedKey_diversifiedKey));
}

- (NSData)trackingPreventionSalt
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC17MessageProtection17GLTDiversifiedKey_trackingPreventionSalt));
}

- (_TtC17MessageProtection17GLTDiversifiedKey)init
{
  result = (_TtC17MessageProtection17GLTDiversifiedKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17MessageProtection17GLTDiversifiedKey_trackingPreventionSalt);
}

@end