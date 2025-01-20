@interface PKPhysicsFieldMagnetic
+ (id)field;
- (PKPhysicsFieldMagnetic)init;
@end

@implementation PKPhysicsFieldMagnetic

- (PKPhysicsFieldMagnetic)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicsFieldMagnetic;
  [(PKPhysicsField *)&v3 init];
  _ZNSt3__115allocate_sharedB8ne180100I16PKCFieldMagneticNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_();
}

+ (id)field
{
  v2 = objc_alloc_init(PKPhysicsFieldMagnetic);

  return v2;
}

@end