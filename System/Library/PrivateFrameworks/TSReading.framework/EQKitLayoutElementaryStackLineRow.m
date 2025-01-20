@interface EQKitLayoutElementaryStackLineRow
- (BOOL)spansStack;
- (EQKitLayoutElementaryStackLineRow)initWithLength:(unint64_t)a3 thickness:(double)a4 position:(int64_t)a5 followingSpace:(double)a6;
- (double)followingSpace;
- (id)newBoxWithStackWidth:(double)a3 columnWidthIter:(__wrap_iter<double *>)a4 iterMax:(__wrap_iter<double *>)a5 previousRow:(id)a6 layoutManager:(const void *)a7;
- (int64_t)alignmentShift;
- (unint64_t)columnCount;
- (unint64_t)firstColumnIndex;
- (void)setFirstColumnIndex:(unint64_t)a3;
@end

@implementation EQKitLayoutElementaryStackLineRow

- (EQKitLayoutElementaryStackLineRow)initWithLength:(unint64_t)a3 thickness:(double)a4 position:(int64_t)a5 followingSpace:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)EQKitLayoutElementaryStackLineRow;
  result = [(EQKitLayoutElementaryStackLineRow *)&v11 init];
  if (result)
  {
    result->mLength = a3;
    result->mThickness = a4;
    result->mFollowingSpace = a6;
    if (a3) {
      result->mAlignmentShift -= a5 + a3;
    }
  }
  return result;
}

- (BOOL)spansStack
{
  return self->mLength == 0;
}

- (id)newBoxWithStackWidth:(double)a3 columnWidthIter:(__wrap_iter<double *>)a4 iterMax:(__wrap_iter<double *>)a5 previousRow:(id)a6 layoutManager:(const void *)a7
{
  unint64_t mLength = self->mLength;
  if (mLength)
  {
    uint64_t v11 = 8 * mLength;
    float v12 = 0.0;
    do
    {
      double v13 = *a4.var0;
      a4.var0 += 8;
      float v12 = v13 + v12;
      v11 -= 8;
    }
    while (v11);
    a3 = v12;
  }
  v14 = [EQKitRule alloc];
  double mThickness = self->mThickness;
  uint64_t v16 = *(void *)(EQKitLayoutManager::layoutContext((EQKitLayoutManager *)a7) + 96);

  return [(EQKitRule *)v14 initWithHeight:v16 depth:0.0 width:mThickness cgColor:a3];
}

- (int64_t)alignmentShift
{
  return self->mAlignmentShift;
}

- (unint64_t)firstColumnIndex
{
  return self->mFirstColumnIndex;
}

- (void)setFirstColumnIndex:(unint64_t)a3
{
  self->mFirstColumnIndex = a3;
}

- (unint64_t)columnCount
{
  return self->mLength;
}

- (double)followingSpace
{
  return self->mFollowingSpace;
}

@end