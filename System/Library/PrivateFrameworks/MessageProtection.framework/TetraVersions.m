@interface TetraVersions
+ (BOOL)isWireCompatibleWith:(unsigned int)a3;
+ (unsigned)currentTetraVersion;
- (_TtC17MessageProtection13TetraVersions)init;
@end

@implementation TetraVersions

+ (BOOL)isWireCompatibleWith:(unsigned int)a3
{
  return a3 - 13 < 0x13;
}

+ (unsigned)currentTetraVersion
{
  return 13;
}

- (_TtC17MessageProtection13TetraVersions)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TetraVersions();
  return [(TetraVersions *)&v3 init];
}

@end