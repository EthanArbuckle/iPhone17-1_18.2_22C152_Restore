@interface PKPhysicsFieldElectric
+ (id)field;
- (PKPhysicsFieldElectric)init;
@end

@implementation PKPhysicsFieldElectric

- (PKPhysicsFieldElectric)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicsFieldElectric;
  [(PKPhysicsField *)&v3 init];
  _ZNSt3__115allocate_sharedB8ne180100I16PKCFieldElectricNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_();
}

+ (id)field
{
  v2 = objc_alloc_init(PKPhysicsFieldElectric);

  return v2;
}

@end