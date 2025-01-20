@interface CRLRectList
+ (id)rectListWithRect:(CGRect)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)rectAtIndex:(unint64_t)a3;
- (CRLRectList)initWithRect:(CGRect)a3;
- (CRLRectList)initWithRectList:(id)a3;
- (id).cxx_construct;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)hash;
@end

@implementation CRLRectList

- (CRLRectList)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = [(CRLRectList *)self init];
  v8 = v7;
  if (v7)
  {
    sub_100147DAC((uint64_t)&v7->mRectList, 1uLL);
    p_CGFloat x = &v8->mRectList.__begin_->origin.x;
    *p_CGFloat x = x;
    p_x[1] = y;
    p_x[2] = width;
    p_x[3] = height;
  }
  return v8;
}

- (CRLRectList)initWithRectList:(id)a3
{
  id v4 = a3;
  v5 = [(CRLRectList *)self init];
  if (v5)
  {
    sub_100147DAC((uint64_t)&v5->mRectList, (unint64_t)[v4 count]);
    uint64_t v6 = 0;
    for (unint64_t i = 0; i < (unint64_t)[v4 count]; ++i)
    {
      [v4 rectAtIndex:i];
      p_CGFloat x = (void *)&v5->mRectList.__begin_[v6].origin.x;
      *p_CGFloat x = v9;
      p_x[1] = v10;
      p_x[2] = v11;
      p_x[3] = v12;
      ++v6;
    }
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CRLMutableRectList alloc];

  return [(CRLRectList *)v4 initWithRectList:self];
}

- (unint64_t)count
{
  return self->mRectList.__end_ - self->mRectList.__begin_;
}

- (CGRect)rectAtIndex:(unint64_t)a3
{
  begin = self->mRectList.__begin_;
  unint64_t v4 = self->mRectList.__end_ - begin;
  if (v4 <= a3)
  {
    uint64_t v10 = +[NSString stringWithFormat:@"Getting object at %lu from an array with size %lu", a3, v4];
    id v11 = +[NSException exceptionWithName:@"IndexOutOfBound" reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  p_CGFloat x = &begin[a3].origin.x;
  double v6 = *p_x;
  double v7 = p_x[1];
  double v8 = p_x[2];
  double v9 = p_x[3];
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = sub_1002469D0(v5, v4);
  double v7 = [(CRLRectList *)self count];
  if (v6 && (double v8 = v7, [v6 count] == v7))
  {
    if (v8)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8 - 1;
      do
      {
        BOOL v11 = CGRectEqualToRect(self->mRectList.__begin_[v9], *(CGRect *)(v6[1] + v9 * 32));
        BOOL v12 = v11;
        BOOL v14 = v10-- != 0 && v11;
        ++v9;
      }
      while (v14);
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2 = 0xCBF29CE484222325;
  begin = self->mRectList.__begin_;
  end = self->mRectList.__end_;
  while (begin != end)
  {
    CGPoint origin = begin->origin;
    CGSize size = begin->size;
    ++begin;
    v8[0] = origin;
    v8[1] = size;
    uint64_t v2 = sub_1000C8080((char *)v8, 32, v2);
  }
  return v2;
}

+ (id)rectListWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = objc_opt_new();
  double v8 = v7;
  uint64_t v9 = (char *)v7[2];
  uint64_t v10 = (uint64_t)(v7 + 3);
  unint64_t v11 = v7[3];
  if ((unint64_t)v9 >= v11)
  {
    v13 = (void **)(v7 + 1);
    BOOL v14 = (char *)v7[1];
    uint64_t v15 = (v9 - v14) >> 5;
    unint64_t v16 = v15 + 1;
    if ((unint64_t)(v15 + 1) >> 59) {
      sub_100004E40();
    }
    uint64_t v17 = v11 - (void)v14;
    if (v17 >> 4 > v16) {
      unint64_t v16 = v17 >> 4;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v18 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v16;
    }
    if (v18)
    {
      v19 = (char *)sub_100148898(v10, v18);
      BOOL v14 = (char *)v8[1];
      uint64_t v9 = (char *)v8[2];
    }
    else
    {
      v19 = 0;
    }
    v20 = (CGFloat *)&v19[32 * v15];
    CGFloat *v20 = x;
    v20[1] = y;
    v21 = &v19[32 * v18];
    v20[2] = width;
    v20[3] = height;
    BOOL v12 = v20 + 4;
    if (v9 != v14)
    {
      do
      {
        long long v22 = *((_OWORD *)v9 - 1);
        *((_OWORD *)v20 - 2) = *((_OWORD *)v9 - 2);
        *((_OWORD *)v20 - 1) = v22;
        v20 -= 4;
        v9 -= 32;
      }
      while (v9 != v14);
      BOOL v14 = (char *)*v13;
    }
    v8[1] = v20;
    _OWORD v8[2] = v12;
    v8[3] = v21;
    if (v14) {
      operator delete(v14);
    }
  }
  else
  {
    *(CGFloat *)uint64_t v9 = x;
    *((CGFloat *)v9 + 1) = y;
    BOOL v12 = v9 + 32;
    *((CGFloat *)v9 + 2) = width;
    *((CGFloat *)v9 + 3) = height;
  }
  _OWORD v8[2] = v12;

  return v8;
}

- (void).cxx_destruct
{
  begin = self->mRectList.__begin_;
  if (begin)
  {
    self->mRectList.__end_ = begin;
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