@interface OITSURectList
+ (id)rectListWithDifference:(CGRect)a3 withRect:(CGRect)a4;
- (CGRect)rectAtIndex:(unint64_t)a3;
- (OITSURectList)initWithRect:(CGRect)a3;
- (OITSURectList)initWithRectList:(id)a3;
- (id).cxx_construct;
- (unint64_t)count;
- (void)addRect:(CGRect)a3;
- (void)insertRect:(CGRect)a3 atIndex:(unint64_t)a4;
@end

@implementation OITSURectList

- (OITSURectList)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = [(OITSURectList *)self init];
  v8 = v7;
  if (v7)
  {
    std::vector<CGRect>::resize((uint64_t)&v7->mRectList, 1uLL);
    p_CGFloat x = &v8->mRectList.__begin_->origin.x;
    *p_CGFloat x = x;
    p_x[1] = y;
    p_x[2] = width;
    p_x[3] = height;
  }
  return v8;
}

- (OITSURectList)initWithRectList:(id)a3
{
  v4 = [(OITSURectList *)self init];
  v5 = v4;
  if (v4)
  {
    p_mRectList = &v4->mRectList;
    std::vector<CGRect>::resize((uint64_t)&v4->mRectList, [a3 count]);
    if ([a3 count])
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      do
      {
        [a3 rectAtIndex:v8];
        p_CGFloat x = (void *)&p_mRectList->__begin_[v7].origin.x;
        *p_CGFloat x = v10;
        p_x[1] = v11;
        p_x[2] = v12;
        p_x[3] = v13;
        ++v8;
        ++v7;
      }
      while (v8 < [a3 count]);
    }
  }
  return v5;
}

- (unint64_t)count
{
  return self->mRectList.__end_ - self->mRectList.__begin_;
}

- (void)addRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_end_cap = &self->mRectList.__end_cap_;
  value = self->mRectList.__end_cap_.__value_;
  end = self->mRectList.__end_;
  if (end >= value)
  {
    p_mRectList = &self->mRectList;
    begin = self->mRectList.__begin_;
    uint64_t v14 = end - begin;
    unint64_t v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) >> 59) {
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
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
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)p_end_cap, v17);
      begin = self->mRectList.__begin_;
      end = self->mRectList.__end_;
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
    uint64_t v11 = v19 + 1;
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
    self->mRectList.__begin_ = v19;
    self->mRectList.__end_ = v11;
    self->mRectList.__end_cap_.__value_ = v20;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    CGRect *end = a3;
    uint64_t v11 = end + 1;
  }
  self->mRectList.__end_ = v11;
}

- (void)insertRect:(CGRect)a3 atIndex:(unint64_t)a4
{
  CGRect v4 = a3;
  std::vector<CGRect>::insert((uint64_t)&self->mRectList, (char *)&self->mRectList.__begin_[a4], (char *)&v4);
}

- (CGRect)rectAtIndex:(unint64_t)a3
{
  begin = self->mRectList.__begin_;
  unint64_t v4 = self->mRectList.__end_ - begin;
  if (v4 <= a3) {
    objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:@"IndexOutOfBound", objc_msgSend(NSString, "stringWithFormat:", @"Getting object at %lu from an array with size %lu", a3, v4), 0 reason userInfo]);
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

+ (id)rectListWithDifference:(CGRect)a3 withRect:(CGRect)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGRect v27 = CGRectIntersection(a3, a4);
  CGFloat v8 = v27.origin.x;
  CGFloat v9 = v27.origin.y;
  CGFloat v10 = v27.size.width;
  CGFloat v11 = v27.size.height;
  uint64_t v12 = objc_alloc_init(OITSURectList);
  v28.origin.double x = v8;
  v28.origin.double y = v9;
  v28.size.double width = v10;
  v28.size.double height = v11;
  if (CGRectIsEmpty(v28)) {
    goto LABEL_22;
  }
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  double MinX = CGRectGetMinX(v29);
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  double MinY = CGRectGetMinY(v30);
  v31.origin.double x = x;
  v31.origin.double y = y;
  v31.size.double width = width;
  v31.size.double height = height;
  double MaxX = CGRectGetMaxX(v31);
  v32.origin.double x = x;
  v32.origin.double y = y;
  v32.size.double width = width;
  v32.size.double height = height;
  double MaxY = CGRectGetMaxY(v32);
  v33.origin.double x = v8;
  v33.origin.double y = v9;
  v33.size.double width = v10;
  v33.size.double height = v11;
  double v14 = CGRectGetMinX(v33);
  v34.origin.double x = v8;
  v34.origin.double y = v9;
  v34.size.double width = v10;
  v34.size.double height = v11;
  double v15 = CGRectGetMinY(v34);
  v35.origin.double x = v8;
  v35.origin.double y = v9;
  v35.size.double width = v10;
  v35.size.double height = v11;
  double v24 = CGRectGetMaxX(v35);
  v36.origin.double x = v8;
  v36.origin.double y = v9;
  v36.size.double width = v10;
  v36.size.double height = v11;
  double v16 = CGRectGetMaxY(v36);
  double y = v16;
  if (MinY != v15)
  {
    double v17 = MinX;
    if (MaxY == v16)
    {
      double v19 = MaxX;
      if (MinX < v14) {
        -[OITSURectList addRect:](v12, "addRect:", MinX, v15, v14 - MinX, MaxY - v15);
      }
      double v18 = v24;
      if (v24 >= MaxX) {
        goto LABEL_18;
      }
      double v20 = MaxY - v15;
    }
    else
    {
      double v19 = MaxX;
      if (MinX < v14) {
        -[OITSURectList addRect:](v12, "addRect:", MinX, v15, v14 - MinX, v16 - v15);
      }
      double v18 = v24;
      if (v24 >= MaxX) {
        goto LABEL_18;
      }
      double v20 = y - v15;
    }
    double v21 = v15;
    goto LABEL_17;
  }
  double v17 = MinX;
  if (MinX < v14) {
    -[OITSURectList addRect:](v12, "addRect:", MinX, MinY, v14 - MinX, v16 - MinY);
  }
  double v18 = v24;
  double v19 = MaxX;
  if (v24 < MaxX)
  {
    double v20 = y - MinY;
    double v21 = MinY;
LABEL_17:
    -[OITSURectList addRect:](v12, "addRect:", v18, v21, v19 - v18, v20, *(void *)&MinX);
  }
LABEL_18:
  if (MinY < v15) {
    -[OITSURectList addRect:](v12, "addRect:", v17, MinY, v19 - v17, v15 - MinY);
  }
  if (y < MaxY)
  {
    double width = v19 - v17;
    double height = MaxY - y;
    double x = v17;
LABEL_22:
    -[OITSURectList addRect:](v12, "addRect:", x, y, width, height, *(void *)&MinX);
  }
  return v12;
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