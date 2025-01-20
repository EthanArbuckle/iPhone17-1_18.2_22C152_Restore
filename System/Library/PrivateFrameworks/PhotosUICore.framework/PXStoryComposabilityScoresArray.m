@interface PXStoryComposabilityScoresArray
- ($94F468A8D4C62B317260615823C2B210)composabilityScoresAtIndex:(unint64_t)a3;
- (NSString)debugDescription;
- (PXStoryComposabilityScoresArray)init;
- (PXStoryComposabilityScoresArray)initWithCapacity:(unint64_t)a3;
- (PXStoryComposabilityScoresArray)initWithComposabilityResults:(id)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
@end

@implementation PXStoryComposabilityScoresArray

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_scores.__begin_;
  if (begin)
  {
    self->_scores.__end_ = begin;
    operator delete(begin);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[PXStoryComposabilityScoresMutableArray allocWithZone:a3];
  v5 = v4;
  if (v4 != (PXStoryComposabilityScoresMutableArray *)self) {
    std::vector<PXStoryAutoEditComposabilityScores>::__assign_with_size[abi:ne180100]<PXStoryAutoEditComposabilityScores*,PXStoryAutoEditComposabilityScores*>(&v4->super._scores.__begin_, (char *)self->_scores.__begin_, (char *)self->_scores.__end_, (self->_scores.__end_ - self->_scores.__begin_) >> 3);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PXStoryComposabilityScoresArray allocWithZone:a3];
  v5 = v4;
  if (v4 != self) {
    std::vector<PXStoryAutoEditComposabilityScores>::__assign_with_size[abi:ne180100]<PXStoryAutoEditComposabilityScores*,PXStoryAutoEditComposabilityScores*>(&v4->_scores.__begin_, (char *)self->_scores.__begin_, (char *)self->_scores.__end_, (self->_scores.__end_ - self->_scores.__begin_) >> 3);
  }
  return v5;
}

- ($94F468A8D4C62B317260615823C2B210)composabilityScoresAtIndex:(unint64_t)a3
{
  v3 = (float *)((char *)self->_scores.__begin_ + 8 * a3);
  float v4 = *v3;
  float v5 = v3[1];
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (unint64_t)count
{
  return (self->_scores.__end_ - self->_scores.__begin_) >> 3;
}

- (NSString)debugDescription
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[PXStoryComposabilityScoresArray count](self, "count"));
  for (unint64_t i = 0; i < [(PXStoryComposabilityScoresArray *)self count]; ++i)
  {
    [(PXStoryComposabilityScoresArray *)self composabilityScoresAtIndex:i];
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"(d:%0.2f|t:%0.2f)", v5, v6);
    [v3 addObject:v7];
  }
  v8 = NSString;
  uint64_t v9 = objc_opt_class();
  unint64_t v10 = [(PXStoryComposabilityScoresArray *)self count];
  v11 = [v3 componentsJoinedByString:@" "];
  v12 = [v8 stringWithFormat:@"<%@:%p %lu scores: %@>", v9, self, v10, v11];

  return (NSString *)v12;
}

- (PXStoryComposabilityScoresArray)initWithComposabilityResults:(id)a3
{
  id v4 = a3;
  float v5 = -[PXStoryComposabilityScoresArray initWithCapacity:](self, "initWithCapacity:", [v4 count]);
  if (v5)
  {
    for (unint64_t i = 0; i < [v4 count]; ++i)
    {
      [v4 composabilityScoresAtIndex:i];
      int v9 = v7;
      int v10 = v8;
      end = (char *)v5->_scores.__end_;
      value = v5->_scores.__end_cap_.__value_;
      if (end >= (char *)value)
      {
        begin = v5->_scores.__begin_;
        uint64_t v15 = (end - (char *)begin) >> 3;
        unint64_t v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 61) {
          std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v17 = value - begin;
        if (v17 >> 2 > v16) {
          unint64_t v16 = v17 >> 2;
        }
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v16;
        }
        if (v18)
        {
          unint64_t v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PXStoryAutoEditComposabilityScores>>(v18);
          begin = v5->_scores.__begin_;
          end = (char *)v5->_scores.__end_;
        }
        else
        {
          uint64_t v19 = 0;
        }
        v20 = (_DWORD *)(v18 + 8 * v15);
        _DWORD *v20 = v9;
        v20[1] = v10;
        v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v20;
        if (end != (char *)begin)
        {
          do
          {
            uint64_t v22 = *((void *)end - 1);
            end -= 8;
            *((void *)v21 - 1) = v22;
            v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v21 - 8);
          }
          while (end != (char *)begin);
          begin = v5->_scores.__begin_;
        }
        v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 2);
        v5->_scores.__begin_ = v21;
        v5->_scores.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 2);
        v5->_scores.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v18 + 8 * v19);
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        *(_DWORD *)end = v7;
        *((_DWORD *)end + 1) = v8;
        v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(end + 8);
      }
      v5->_scores.__end_ = v13;
    }
  }

  return v5;
}

- (PXStoryComposabilityScoresArray)initWithCapacity:(unint64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PXStoryComposabilityScoresArray;
  id v4 = [(PXStoryComposabilityScoresArray *)&v17 init];
  float v5 = v4;
  if (v4)
  {
    begin = v4->_scores.__begin_;
    if (a3 > (v4->_scores.__end_cap_.__value_ - begin) >> 3)
    {
      if (a3 >> 61) {
        std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
      }
      end = v4->_scores.__end_;
      int v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PXStoryAutoEditComposabilityScores>>(a3);
      int v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v8[(end - begin) & 0xFFFFFFFFFFFFFFF8];
      v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v8[8 * v10];
      v13 = v5->_scores.__begin_;
      v12 = v5->_scores.__end_;
      v14 = v9;
      if (v12 != v13)
      {
        do
        {
          uint64_t v15 = *((void *)v12 - 1);
          v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v12 - 8);
          *((void *)v14 - 1) = v15;
          v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v14 - 8);
        }
        while (v12 != v13);
        v12 = v5->_scores.__begin_;
      }
      v5->_scores.__begin_ = v14;
      v5->_scores.__end_ = v9;
      v5->_scores.__end_cap_.__value_ = v11;
      if (v12) {
        operator delete(v12);
      }
    }
  }
  return v5;
}

- (PXStoryComposabilityScoresArray)init
{
  return [(PXStoryComposabilityScoresArray *)self initWithCapacity:0];
}

@end