@interface VKLabelSelectionQuery
- (BOOL)result;
- (VKLabelMarker)labelMarker;
- (VKLabelSelectionQuery)initWithLabelMarker:(shared_ptr<md:(unsigned int)a4 :StandardLabelMarker>)a3 selectionFilterStamp:;
- (id).cxx_construct;
- (shared_ptr<md::StandardLabelMarker>)standardLabelMarker;
- (unsigned)filterStamp;
- (void)setResult:(BOOL)a3;
@end

@implementation VKLabelSelectionQuery

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_labelMarker.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (unsigned)filterStamp
{
  return self->_filterStamp;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (BOOL)result
{
  return self->_result;
}

- (shared_ptr<md::StandardLabelMarker>)standardLabelMarker
{
  cntrl = self->_labelMarker.__cntrl_;
  *v2 = self->_labelMarker.__ptr_;
  v2[1] = (StandardLabelMarker *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (StandardLabelMarker *)self;
  return result;
}

- (VKLabelMarker)labelMarker
{
  cntrl = self->_labelMarker.__cntrl_;
  ptr = self->_labelMarker.__ptr_;
  v7 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  v3 = +[VKLabelMarker markerWithLabelMarker:&ptr];
  v4 = (std::__shared_weak_count *)v7;
  if (v7 && !atomic_fetch_add((atomic_ullong *volatile)v7 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  return (VKLabelMarker *)v3;
}

- (VKLabelSelectionQuery)initWithLabelMarker:(shared_ptr<md:(unsigned int)a4 :StandardLabelMarker>)a3 selectionFilterStamp:
{
  unsigned int cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v12.receiver = self;
  v12.super_class = (Class)VKLabelSelectionQuery;
  v6 = [(VKLabelSelectionQuery *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v9 = *(StandardLabelMarker **)ptr;
    uint64_t v8 = *((void *)ptr + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    v10 = (std::__shared_weak_count *)v6->_labelMarker.__cntrl_;
    v6->_labelMarker.__ptr_ = v9;
    v6->_labelMarker.__cntrl_ = (__shared_weak_count *)v8;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    v7->_filterStamp = cntrl;
  }
  return v7;
}

@end