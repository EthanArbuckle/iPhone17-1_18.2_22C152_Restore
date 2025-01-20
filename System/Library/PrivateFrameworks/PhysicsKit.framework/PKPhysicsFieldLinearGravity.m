@interface PKPhysicsFieldLinearGravity
+ (id)field;
- (PKPhysicsFieldLinearGravity)init;
- (double)direction;
- (void)setDirection:(PKPhysicsFieldLinearGravity *)self;
@end

@implementation PKPhysicsFieldLinearGravity

- (PKPhysicsFieldLinearGravity)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicsFieldLinearGravity;
  [(PKPhysicsField *)&v3 init];
  _ZNSt3__115allocate_sharedB8ne180100I21PKCFieldLinearGravityNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_();
}

+ (id)field
{
  v2 = objc_alloc_init(PKPhysicsFieldLinearGravity);

  return v2;
}

- (double)direction
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1) {
    long long v2 = *(_OWORD *)(v1 + 256);
  }
  else {
    *(void *)&long long v2 = 0;
  }
  return *(double *)&v2;
}

- (void)setDirection:(PKPhysicsFieldLinearGravity *)self
{
  __n128 v4 = v2;
  ptr = self->super._field.__ptr_;
  if (ptr) {
    PKCFieldLinearGravity::setGravity((__n128 *)ptr, &v4);
  }
}

@end