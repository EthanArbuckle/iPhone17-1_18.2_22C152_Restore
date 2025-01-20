@interface ODIList1
- (void)map;
@end

@implementation ODIList1

- (void)map
{
  v3 = [(ODIState *)self->super.mState diagram];
  v4 = [v3 documentPoint];
  id v10 = [v4 children];

  unsigned int v5 = [v10 count];
  unsigned int mMaxPointCount = self->super.mMaxPointCount;
  if (mMaxPointCount >= v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = mMaxPointCount;
  }
  [(ODIState *)self->super.mState setPointCount:v7];
  -[ODIState setLogicalBounds:maintainAspectRatio:](self->super.mState, "setLogicalBounds:maintainAspectRatio:", 0, 0.0, 0.0, 1.0, (float)((float)v7 + (float)((float)(v7 - 1) * 0.080292)));
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v9 = [v10 objectAtIndex:i];
      [(ODIState *)self->super.mState setPointIndex:i];
      -[ODILinear mapPoint:bounds:](self, "mapPoint:bounds:", v9, 0.0527383367, (double)i * 1.08029197, 0.693711968, 0.729927007);
    }
  }
}

@end