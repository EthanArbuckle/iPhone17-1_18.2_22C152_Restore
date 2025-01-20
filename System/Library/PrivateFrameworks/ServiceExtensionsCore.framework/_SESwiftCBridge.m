@interface _SESwiftCBridge
+ (BOOL)checkEntitlement:(id)a3 forAuditToken:(id *)a4;
+ (BOOL)checkEntitlementForCurrentProcess:(id)a3;
- (_SESwiftCBridge)init;
@end

@implementation _SESwiftCBridge

+ (BOOL)checkEntitlement:(id)a3 forAuditToken:(id *)a4
{
  uint64_t v4 = sub_25C22A678();
  char v6 = sub_25C22A410(v4, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

+ (BOOL)checkEntitlementForCurrentProcess:(id)a3
{
  uint64_t v3 = sub_25C22A678();
  char v5 = sub_25C22A53C(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_SESwiftCBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftCBridge();
  return [(_SESwiftCBridge *)&v3 init];
}

@end