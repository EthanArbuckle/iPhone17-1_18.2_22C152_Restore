@interface PKPhysicsFieldRadialGravity
+ (id)field;
- (PKPhysicsFieldRadialGravity)init;
@end

@implementation PKPhysicsFieldRadialGravity

- (PKPhysicsFieldRadialGravity)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicsFieldRadialGravity;
  [(PKPhysicsField *)&v3 init];
  _ZNSt3__115allocate_sharedB8ne180100I21PKCFieldRadialGravityNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_();
}

+ (id)field
{
  v2 = objc_alloc_init(PKPhysicsFieldRadialGravity);

  return v2;
}

@end