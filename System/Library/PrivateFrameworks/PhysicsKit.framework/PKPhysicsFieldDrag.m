@interface PKPhysicsFieldDrag
+ (id)field;
- (PKPhysicsFieldDrag)init;
@end

@implementation PKPhysicsFieldDrag

- (PKPhysicsFieldDrag)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicsFieldDrag;
  [(PKPhysicsField *)&v3 init];
  _ZNSt3__115allocate_sharedB8ne180100I12PKCFieldDragNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_();
}

+ (id)field
{
  v2 = objc_alloc_init(PKPhysicsFieldDrag);

  return v2;
}

@end