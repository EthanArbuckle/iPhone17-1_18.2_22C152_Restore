@interface CRCHNetworkCursor
- (id).cxx_construct;
- (unint64_t)edgeIndexAtPosition:(unint64_t)a3;
- (unint64_t)edgeIndexCount;
- (void)addEdgeIndex:(unint64_t)a3;
@end

@implementation CRCHNetworkCursor

- (void)addEdgeIndex:(unint64_t)a3
{
  p_end_cap = &self->_edgeIndexes.__end_cap_;
  value = self->_edgeIndexes.__end_cap_.__value_;
  end = self->_edgeIndexes.__end_;
  if (end >= value)
  {
    begin = self->_edgeIndexes.__begin_;
    uint64_t v10 = end - begin;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = (char *)value - (char *)begin;
    unint64_t v12 = ((char *)value - (char *)begin) >> 2;
    if (v12 <= v10 + 1) {
      unint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)p_end_cap, v13);
      begin = self->_edgeIndexes.__begin_;
      end = self->_edgeIndexes.__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = (unint64_t *)&v14[8 * v10];
    v16 = (unint64_t *)&v14[8 * v13];
    unint64_t *v15 = a3;
    v8 = v15 + 1;
    while (end != begin)
    {
      unint64_t v17 = *--end;
      *--v15 = v17;
    }
    self->_edgeIndexes.__begin_ = v15;
    self->_edgeIndexes.__end_ = v8;
    self->_edgeIndexes.__end_cap_.__value_ = v16;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    unint64_t *end = a3;
    v8 = end + 1;
  }
  self->_edgeIndexes.__end_ = v8;
}

- (unint64_t)edgeIndexCount
{
  return self->_edgeIndexes.__end_ - self->_edgeIndexes.__begin_;
}

- (unint64_t)edgeIndexAtPosition:(unint64_t)a3
{
  return self->_edgeIndexes.__begin_[a3];
}

- (void).cxx_destruct
{
  begin = self->_edgeIndexes.__begin_;
  if (begin)
  {
    self->_edgeIndexes.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end