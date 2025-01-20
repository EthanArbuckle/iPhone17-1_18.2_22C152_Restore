@interface CRLMutableRectList
- (id)copyWithZone:(_NSZone *)a3;
- (void)addRect:(CGRect)a3;
- (void)addRectList:(id)a3;
- (void)applyTransform:(CGAffineTransform *)a3;
- (void)insertRect:(CGRect)a3 atIndex:(unint64_t)a4;
- (void)makeEmpty;
- (void)replaceRect:(CGRect)a3 atIndex:(unint64_t)a4;
- (void)setList:(id)a3;
@end

@implementation CRLMutableRectList

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CRLRectList alloc];

  return [(CRLRectList *)v4 initWithRectList:self];
}

- (void)addRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_end_cap = &self->super.mRectList.__end_cap_;
  value = self->super.mRectList.__end_cap_.__value_;
  end = self->super.mRectList.__end_;
  if (end >= value)
  {
    p_mRectList = &self->super.mRectList;
    begin = self->super.mRectList.__begin_;
    uint64_t v14 = end - begin;
    unint64_t v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) >> 59) {
      sub_100004E40();
    }
    uint64_t v16 = (char *)value - (char *)begin;
    if (v16 >> 4 > v15) {
      unint64_t v15 = v16 >> 4;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v17 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17)
    {
      v18 = (char *)sub_100148898((uint64_t)p_end_cap, v17);
      begin = self->super.mRectList.__begin_;
      end = self->super.mRectList.__end_;
    }
    else
    {
      v18 = 0;
    }
    v19 = (CGRect *)&v18[32 * v14];
    v19->origin.CGFloat x = x;
    v19->origin.CGFloat y = y;
    v20 = (CGRect *)&v18[32 * v17];
    v19->size.CGFloat width = width;
    v19->size.CGFloat height = height;
    v11 = v19 + 1;
    if (end != begin)
    {
      do
      {
        CGSize size = end[-1].size;
        v19[-1].origin = end[-1].origin;
        v19[-1].CGSize size = size;
        --v19;
        --end;
      }
      while (end != begin);
      begin = p_mRectList->__begin_;
    }
    self->super.mRectList.__begin_ = v19;
    self->super.mRectList.__end_ = v11;
    self->super.mRectList.__end_cap_.__value_ = v20;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    CGRect *end = a3;
    v11 = end + 1;
  }
  self->super.mRectList.__end_ = v11;
}

- (void)addRectList:(id)a3
{
}

- (void)insertRect:(CGRect)a3 atIndex:(unint64_t)a4
{
  CGRect v4 = a3;
  sub_100148420((uint64_t)&self->super.mRectList, (char *)&self->super.mRectList.__begin_[a4], (char *)&v4);
}

- (void)replaceRect:(CGRect)a3 atIndex:(unint64_t)a4
{
  self->super.mRectList.__begin_[a4] = a3;
}

- (void)makeEmpty
{
  self->super.mRectList.__end_ = self->super.mRectList.__begin_;
}

- (void)setList:(id)a3
{
  CGRect v4 = (CRLMutableRectList *)a3;
  if (self != v4) {
    sub_100148BB8((char *)&self->super.mRectList, (char *)v4->super.mRectList.__begin_, (uint64_t)v4->super.mRectList.__end_, v4->super.mRectList.__end_ - v4->super.mRectList.__begin_);
  }
}

- (void)applyTransform:(CGAffineTransform *)a3
{
  begin = self->super.mRectList.__begin_;
  uint64_t v4 = (char *)self->super.mRectList.__end_ - (char *)begin;
  if (v4)
  {
    unint64_t v6 = v4 >> 5;
    if (v6 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v6;
    }
    p_CGSize size = &begin->size;
    do
    {
      CGRect v11 = *(CGRect *)&p_size[-1].width;
      long long v9 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v10.c = v9;
      *(_OWORD *)&v10.tCGFloat x = *(_OWORD *)&a3->tx;
      *(CGRect *)&p_size[-1].CGFloat width = CGRectApplyAffineTransform(v11, &v10);
      p_size += 2;
      --v7;
    }
    while (v7);
  }
}

@end