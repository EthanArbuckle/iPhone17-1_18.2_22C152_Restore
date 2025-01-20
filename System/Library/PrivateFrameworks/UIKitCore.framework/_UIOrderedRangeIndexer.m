@interface _UIOrderedRangeIndexer
- (_UIOrderedRangeIndexer)init;
- (id).cxx_construct;
- (id)description;
- (uint64_t)rangeContainingLocation:(uint64_t)result;
@end

@implementation _UIOrderedRangeIndexer

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_orderedRangeIndexerImpl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (_UIOrderedRangeIndexer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIOrderedRangeIndexer;
  v2 = [(_UIOrderedRangeIndexer *)&v6 init];
  if (v2)
  {
    v3 = (char *)operator new(0x40uLL);
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    *(void *)v3 = &unk_1ED0BEA90;
    *(_OWORD *)(v3 + 40) = 0u;
    *((void *)v3 + 7) = 0;
    *(_OWORD *)(v3 + 24) = 0u;
    cntrl = (std::__shared_weak_count *)v2->_orderedRangeIndexerImpl.__cntrl_;
    v2->_orderedRangeIndexerImpl.__ptr_ = (_UIOrderedRangeIndexerImpl *)(v3 + 24);
    v2->_orderedRangeIndexerImpl.__cntrl_ = (__shared_weak_count *)v3;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
    }
  }
  return v2;
}

- (uint64_t)rangeContainingLocation:(uint64_t)result
{
  if (result)
  {
    v2 = *(_UIOrderedRangeIndexerImpl **)(result + 8);
    memset(v3, 0, sizeof(v3));
    _UIOrderedRangeIndexerImpl::binarySearchForLocation(v2, a2, (uint64_t)v3);
    return v3[0];
  }
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"<%@ %p:", v5, self];

  ptr = self->_orderedRangeIndexerImpl.__ptr_;
  v8 = *(NSRange **)ptr;
  v9 = (NSRange *)*((void *)ptr + 1);
  if (*(NSRange **)ptr != v9)
  {
    do
    {
      v10 = NSStringFromRange(*v8);
      [v6 appendFormat:@" %@", v10];

      ++v8;
    }
    while (v8 != v9);
  }
  [v6 appendFormat:@">"];
  return v6;
}

@end