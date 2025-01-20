@interface TetraErrorHelpers
+ (BOOL)shouldMarkForStateResetWithString:(id)a3;
- (_TtC17MessageProtection17TetraErrorHelpers)init;
@end

@implementation TetraErrorHelpers

+ (BOOL)shouldMarkForStateResetWithString:(id)a3
{
  id v3 = a3;
  char v4 = specialized static TetraErrorHelpers.shouldMarkForStateReset(string:)(v3);

  return v4 & 1;
}

- (_TtC17MessageProtection17TetraErrorHelpers)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TetraErrorHelpers();
  return [(TetraErrorHelpers *)&v3 init];
}

@end