@interface TSTCoordinateArray
- (BOOL)isEqual:(id)a3;
- (TSTCoordinateArray)initWithCount:(unsigned int)a3 atOffset:(unsigned int)a4;
- (id)description;
- (void)dealloc;
- (void)hasRightToLeftOrderingWithWidth:(double)a3;
@end

@implementation TSTCoordinateArray

- (TSTCoordinateArray)initWithCount:(unsigned int)a3 atOffset:(unsigned int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSTCoordinateArray;
  v6 = [(TSTCoordinateArray *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->mOffset = a4;
    v6->mCount = a3;
    v6->mCoordinates = (double *)malloc_type_calloc(8uLL, a3 + 1, 0x4AEC3DE8uLL);
    v7->mAverage = 0.0;
    v7->mVisibleIndices = (NSMutableIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexesInRange:", v7->mOffset, a3);
    v7->mLayoutDirectionIsLeftToRight = 1;
    v7->mTableWidth = 0.0;
  }
  return v7;
}

- (void)hasRightToLeftOrderingWithWidth:(double)a3
{
  self->mLayoutDirectionIsLeftToRight = 0;
  self->mTableWidth = a3;
}

- (void)dealloc
{
  mCoordinates = self->mCoordinates;
  if (mCoordinates) {
    free(mCoordinates);
  }

  v4.receiver = self;
  v4.super_class = (Class)TSTCoordinateArray;
  [(TSTCoordinateArray *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (!v4 || *(void *)&self->mOffset != *(void *)(v4 + 8) || self->mAverage != *(double *)(v4 + 24)) {
    return 0;
  }
  uint64_t v5 = self->mCount - 1;
  do
  {
    BOOL v6 = (int)v5 + 1 < 1;
    if ((int)v5 + 1 < 1) {
      break;
    }
    double v7 = self->mCoordinates[v5];
    double v8 = *(double *)(*(void *)(v4 + 16) + 8 * v5--);
  }
  while (v7 == v8);
  return v6;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = (void *)[v3 stringWithFormat:@"<%@ %p offset=%u average=%f", NSStringFromClass(v4), self, self->mOffset, *(void *)&self->mAverage];
  BOOL v6 = v5;
  if (self->mCoordinates)
  {
    [v5 appendString:@" coordinates={"];
    if (self->mCount)
    {
      unint64_t v7 = 0;
      double v8 = @"}>";
      do
      {
        objc_msgSend(v6, "appendFormat:", @"\n  { offset=%u -> coordinate=%f }", v7 + self->mOffset, *(void *)&self->mCoordinates[v7]);
        ++v7;
      }
      while (v7 < self->mCount);
    }
    else
    {
      double v8 = @"}>";
    }
  }
  else
  {
    double v8 = @" coordinates={empty}>";
  }
  [v6 appendString:v8];
  return v6;
}

@end