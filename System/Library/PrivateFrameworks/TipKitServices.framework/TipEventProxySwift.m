@interface TipEventProxySwift
+ (void)donateWithEventIdentifier:(NSString *)a3 for:(NSString *)a4 completionHandler:(id)a5;
- (_TtC14TipKitServices18TipEventProxySwift)init;
@end

@implementation TipEventProxySwift

+ (void)donateWithEventIdentifier:(NSString *)a3 for:(NSString *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;
  sub_25F734AE8((uint64_t)&unk_26A7BB3B0, (uint64_t)v9);
}

- (_TtC14TipKitServices18TipEventProxySwift)init
{
  return (_TtC14TipKitServices18TipEventProxySwift *)TipEventProxySwift.init()();
}

@end