@interface Kyber1024ObjC
+ (id)KeyGen;
- (_TtC17MessageProtection13Kyber1024ObjC)init;
@end

@implementation Kyber1024ObjC

+ (id)KeyGen
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Kyber1024ObjCPrivateKey(0)), sel_init);
  return v2;
}

- (_TtC17MessageProtection13Kyber1024ObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Kyber1024ObjC();
  return [(Kyber1024ObjC *)&v3 init];
}

@end