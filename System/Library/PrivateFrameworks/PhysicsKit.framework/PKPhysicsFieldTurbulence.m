@interface PKPhysicsFieldTurbulence
+ (id)field;
- (PKPhysicsFieldTurbulence)init;
@end

@implementation PKPhysicsFieldTurbulence

- (PKPhysicsFieldTurbulence)init
{
}

+ (id)field
{
  v2 = objc_alloc_init(PKPhysicsFieldTurbulence);

  return v2;
}

@end