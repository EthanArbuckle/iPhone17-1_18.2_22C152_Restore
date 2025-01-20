@interface VKMetricsDescriptor
- (VKMetricsDescriptor)init;
- (id).cxx_construct;
- (int64_t)carDisplayType;
- (int64_t)labelScaleFactor;
- (int64_t)shieldSize;
- (shared_ptr<gss::StylesheetManager<gss::PropertyID>>)styleManager;
- (void)setCarDisplayType:(int64_t)a3;
- (void)setLabelScaleFactor:(int64_t)a3;
- (void)setShieldSize:(int64_t)a3;
- (void)setStyleManager:(shared_ptr<gss::StylesheetManager<gss::PropertyID>>)a3;
@end

@implementation VKMetricsDescriptor

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_styleManager.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)setStyleManager:(shared_ptr<gss::StylesheetManager<gss::PropertyID>>)a3
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_styleManager.__cntrl_;
  self->_styleManager.__ptr_ = v4;
  self->_styleManager.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<gss::StylesheetManager<gss::PropertyID>>)styleManager
{
  cntrl = self->_styleManager.__cntrl_;
  *v2 = self->_styleManager.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setLabelScaleFactor:(int64_t)a3
{
  self->_labelScaleFactor = a3;
}

- (int64_t)labelScaleFactor
{
  return self->_labelScaleFactor;
}

- (void)setShieldSize:(int64_t)a3
{
  self->_shieldSize = a3;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (void)setCarDisplayType:(int64_t)a3
{
  self->_carDisplayType = a3;
}

- (int64_t)carDisplayType
{
  return self->_carDisplayType;
}

- (VKMetricsDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VKMetricsDescriptor;
  shared_ptr<gss::StylesheetManager<gss::PropertyID>> result = [(VKMetricsDescriptor *)&v3 init];
  if (result) {
    result->_shieldSize = 4;
  }
  return result;
}

@end