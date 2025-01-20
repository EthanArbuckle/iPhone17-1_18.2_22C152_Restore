@interface HKDF
+ (id)deriveKeyWith:(id)a3 salt:(id)a4 outputSize:(int64_t)a5;
- (_TtC17MessageProtection4HKDF)init;
@end

@implementation HKDF

+ (id)deriveKeyWith:(id)a3 salt:(id)a4 outputSize:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)specialized static HKDF.deriveKeyWith(_:salt:outputSize:)((uint64_t)v6, (uint64_t)v7);

  return v8;
}

- (_TtC17MessageProtection4HKDF)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HKDF();
  return [(HKDF *)&v3 init];
}

@end