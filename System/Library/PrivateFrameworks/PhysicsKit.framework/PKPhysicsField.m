@interface PKPhysicsField
- (BOOL)isEnabled;
- (BOOL)isOverride;
- (NSObject)representedObject;
- (PKPhysicsField)init;
- (__n128)position;
- (__n128)scale;
- (double)direction;
- (float)falloff;
- (float)minimumRadius;
- (float)rotation;
- (float)strength;
- (id).cxx_construct;
- (id)region;
- (shared_ptr<PKCField>)_field;
- (unsigned)categoryBitMask;
- (void)dealloc;
- (void)setCategoryBitMask:(unsigned int)a3;
- (void)setDirection:(PKPhysicsField *)self;
- (void)setEnabled:(BOOL)a3;
- (void)setFalloff:(float)a3;
- (void)setMinimumRadius:(float)a3;
- (void)setOverride:(BOOL)a3;
- (void)setRegion:(id)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setStrength:(float)a3;
- (void)set_field:(shared_ptr<PKCField>)a3;
@end

@implementation PKPhysicsField

- (PKPhysicsField)init
{
  ++fieldCount;
  v10.receiver = self;
  v10.super_class = (Class)PKPhysicsField;
  v2 = [(PKPhysicsField *)&v10 init];
  v3 = v2;
  if (v2)
  {
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)v2->_scale = _Q0;
    [(PKPhysicsField *)v2 setMinimumRadius:5.87747298e-39];
  }
  return v3;
}

- (void)dealloc
{
  --fieldCount;
  cntrl = self->_field.__cntrl_;
  self->_field.__ptr_ = 0;
  self->_field.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPhysicsField;
  [(PKPhysicsField *)&v4 dealloc];
}

- (shared_ptr<PKCField>)_field
{
  cntrl = self->_field.__cntrl_;
  PKPhysicsField *v2 = self->_field.__ptr_;
  v2[1] = (PKCField *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKCField *)self;
  return result;
}

- (void)set_field:(shared_ptr<PKCField>)a3
{
  ptr = *(PKCField **)a3.__ptr_;
  uint64_t v5 = *((void *)a3.__ptr_ + 1);
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_field.__cntrl_;
  self->_field.__ptr_ = ptr;
  self->_field.__cntrl_ = (__shared_weak_count *)v5;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    ptr = self->_field.__ptr_;
  }
  if (ptr)
  {
    region = self->_region;
    setRegionOnField((uint64_t)ptr, region);
  }
}

- (id)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_region, a3);
  ptr = self->_field.__ptr_;
  if (ptr) {
    setRegionOnField((uint64_t)ptr, self->_region);
  }
}

- (void)setRepresentedObject:(id)a3
{
  id v5 = a3;
  ptr = self->_field.__ptr_;
  if (ptr) {
    setRepresentedObjectOnField((uint64_t)ptr, v5);
  }
}

- (NSObject)representedObject
{
  ptr = self->_field.__ptr_;
  if (ptr)
  {
    ptr = fieldRepresentedObject((uint64_t)ptr);
  }

  return ptr;
}

- (float)strength
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    return *((float *)ptr + 49);
  }
  else {
    return 1.0;
  }
}

- (void)setStrength:(float)a3
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    *((float *)ptr + 49) = a3;
  }
}

- (void)setDirection:(PKPhysicsField *)self
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    *((_OWORD *)ptr + 14) = v2;
  }
}

- (double)direction
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1) {
    long long v2 = *(_OWORD *)(v1 + 224);
  }
  else {
    *(void *)&long long v2 = 0;
  }
  return *(double *)&v2;
}

- (float)falloff
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    return *((float *)ptr + 51);
  }
  else {
    return 1.0;
  }
}

- (void)setFalloff:(float)a3
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    *((float *)ptr + 51) = a3;
  }
}

- (BOOL)isEnabled
{
  ptr = self->_field.__ptr_;
  return ptr && *((unsigned char *)ptr + 244) != 0;
}

- (void)setEnabled:(BOOL)a3
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    *((unsigned char *)ptr + 244) = a3;
  }
}

- (unsigned)categoryBitMask
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    return *((_DWORD *)ptr + 60);
  }
  else {
    return 0;
  }
}

- (void)setCategoryBitMask:(unsigned int)a3
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    *((_DWORD *)ptr + 60) = a3;
  }
}

- (BOOL)isOverride
{
  ptr = self->_field.__ptr_;
  return ptr && *((unsigned char *)ptr + 200) != 0;
}

- (void)setOverride:(BOOL)a3
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    *((unsigned char *)ptr + 200) = a3;
  }
}

- (__n128)position
{
  return a1[2];
}

- (float)rotation
{
  return self->_rotation;
}

- (__n128)scale
{
  return a1[4];
}

- (float)minimumRadius
{
  ptr = self->_field.__ptr_;
  if (!ptr) {
    return 0.00000011921;
  }
  float v3 = *((float *)ptr + 52);
  return v3 / PKGet_INV_PTM_RATIO();
}

- (void)setMinimumRadius:(float)a3
{
  ptr = self->_field.__ptr_;
  if (ptr) {
    *((float *)ptr + 52) = PKGet_INV_PTM_RATIO() * a3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  cntrl = self->_field.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end