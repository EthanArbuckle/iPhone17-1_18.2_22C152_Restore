@interface PKPhysicsFieldVortex
+ (id)field;
- (PKPhysicsFieldVortex)init;
@end

@implementation PKPhysicsFieldVortex

- (PKPhysicsFieldVortex)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicsFieldVortex;
  [(PKPhysicsField *)&v3 init];
  _ZNSt3__115allocate_sharedB8ne180100I14PKCFieldVortexNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_();
}

+ (id)field
{
  v2 = objc_alloc_init(PKPhysicsFieldVortex);

  return v2;
}

@end