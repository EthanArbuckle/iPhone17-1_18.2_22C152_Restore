@interface PFMessagesStackLayoutFrameSolver
- (NSArray)normalizedHorizontalOffsets;
- (PFMessagesStackLayoutFrameSolver)init;
- (double)normalizedSizeTransform;
- (double)normalizedVerticalInsets;
- (double)normalizedVerticalOffset;
- (double)rotationAngle;
- (int64_t)stackedItemsCount;
- (void)getGeometries:(id *)a3 count:(unint64_t)a4;
- (void)setNormalizedHorizontalOffsets:(id)a3;
- (void)setNormalizedSizeTransform:(double)a3;
- (void)setNormalizedVerticalInsets:(double)a3;
- (void)setNormalizedVerticalOffset:(double)a3;
- (void)setRotationAngle:(double)a3;
- (void)setStackedItemsCount:(int64_t)a3;
@end

@implementation PFMessagesStackLayoutFrameSolver

- (void).cxx_destruct
{
}

- (void)setNormalizedHorizontalOffsets:(id)a3
{
}

- (NSArray)normalizedHorizontalOffsets
{
  return self->_normalizedHorizontalOffsets;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setNormalizedSizeTransform:(double)a3
{
  self->_normalizedSizeTransform = a3;
}

- (double)normalizedSizeTransform
{
  return self->_normalizedSizeTransform;
}

- (void)setNormalizedVerticalOffset:(double)a3
{
  self->_normalizedVerticalOffset = a3;
}

- (double)normalizedVerticalOffset
{
  return self->_normalizedVerticalOffset;
}

- (void)setNormalizedVerticalInsets:(double)a3
{
  self->_normalizedVerticalInsets = a3;
}

- (double)normalizedVerticalInsets
{
  return self->_normalizedVerticalInsets;
}

- (void)setStackedItemsCount:(int64_t)a3
{
  self->_stackedItemsCount = a3;
}

- (int64_t)stackedItemsCount
{
  return self->_stackedItemsCount;
}

- (void)getGeometries:(id *)a3 count:(unint64_t)a4
{
  uint64_t v6 = [(PFMessagesStackLayoutFrameSolver *)self stackedItemsCount];
  uint64_t v7 = 2 * v6;
  [(PFMessagesStackLayoutFrameSolver *)self normalizedVerticalInsets];
  CGFloat v9 = v8;
  double v10 = 0.0;
  v63.origin.CGFloat x = 0.0;
  v63.origin.CGFloat y = 0.0;
  v63.size.CGFloat width = 1.0;
  v63.size.CGFloat height = 1.0;
  CGRect v64 = CGRectInset(v63, v9, v9);
  CGFloat x = v64.origin.x;
  CGFloat y = v64.origin.y;
  CGFloat width = v64.size.width;
  CGFloat height = v64.size.height;
  double MidX = CGRectGetMidX(v64);
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  CGFloat v59 = height;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v65);
  [(PFMessagesStackLayoutFrameSolver *)self normalizedVerticalOffset];
  double v57 = v17;
  [(PFMessagesStackLayoutFrameSolver *)self normalizedSizeTransform];
  __CGFloat x = v18;
  [(PFMessagesStackLayoutFrameSolver *)self rotationAngle];
  double v55 = v19;
  id v20 = [(PFMessagesStackLayoutFrameSolver *)self normalizedHorizontalOffsets];
  id v61 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  if (v6)
  {
    unint64_t v21 = 0;
    double v22 = 0.0;
    do
    {
      if (v21 < [v20 count])
      {
        v23 = [v20 objectAtIndexedSubscript:v21];
        [v23 doubleValue];
        double v10 = v24;
      }
      double v22 = v22 + v10;
      v25 = [NSNumber numberWithDouble:v22];
      [v61 setObject:v25 atIndexedSubscript:v21];

      ++v21;
    }
    while (v6 != v21);
  }

  [v61 count];
  if (v7 != -2)
  {
    uint64_t v26 = -v6;
    double v27 = (float)((float)v6 * 5.0);
    uint64_t v28 = v7 + 1;
    p_var6 = &a3[1].var6;
    __asm { FMOV            V0.2D, #1.0 }
    long long v58 = _Q0;
    do
    {
      if (v26 >= 0) {
        uint64_t v35 = v26;
      }
      else {
        uint64_t v35 = -v26;
      }
      double v36 = 0.0;
      if (v26 <= 0) {
        double v37 = 0.0;
      }
      else {
        double v37 = v27;
      }
      double v38 = (double)v35;
      double v39 = MidX;
      double v40 = MidY;
      long long v41 = v58;
      if (v26)
      {
        long double v60 = pow(__x, (double)v35);
        v42 = [v61 objectAtIndexedSubscript:v35 - 1];
        [v42 doubleValue];
        double v44 = v43;

        double v45 = -v44;
        if (v26 > 0) {
          double v45 = v44;
        }
        double v39 = MidX + v45;
        double v40 = MidY + v57 * v38;
        double v36 = v55 * (double)v26;
        long long v41 = *(unint64_t *)&v60;
      }
      float v46 = v37 + (float)((float)v35 * 5.0);
      *(p_var6 - 8) = v39;
      *(p_var6 - 7) = v40;
      *(p_var6 - 6) = width;
      *(p_var6 - 5) = v59;
      *(p_var6 - 4) = v46;
      *(p_var6 - 3) = v36;
      *(p_var6 - 2) = 1.0;
      *(p_var6 - 1) = fmin(v38 * 0.1, 1.0);
      *(_OWORD *)p_var6 = v41;
      p_var6 += 10;
      ++v26;
      --v28;
    }
    while (v28);
  }
  long long v47 = *(_OWORD *)&a3[1].var6;
  long long v48 = *(_OWORD *)&a3[1].var2;
  *(_OWORD *)&a3->var4 = *(_OWORD *)&a3[1].var4;
  *(_OWORD *)&a3->var6 = v47;
  CGPoint var0 = a3[1].var0;
  a3->CGSize var1 = a3[1].var1;
  *(_OWORD *)&a3->var2 = v48;
  a3->CGPoint var0 = var0;
  *(double *)&long long v48 = a3->var6 * 0.9;
  a3->var4 = 0.0;
  a3->var2 = a3->var2 + 5.0;
  a3->var5 = a3[1].var5;
  *(void *)&a3->var6 = v48;
  v50 = &a3[v7 + 2];
  v51 = &a3[v7 | 1];
  long long v52 = *(_OWORD *)&v51->var6;
  long long v53 = *(_OWORD *)&v51->var2;
  *(_OWORD *)&v50->var4 = *(_OWORD *)&v51->var4;
  *(_OWORD *)&v50->var6 = v52;
  CGSize var1 = v51->var1;
  v50->CGPoint var0 = v51->var0;
  v50->CGSize var1 = var1;
  *(_OWORD *)&v50->var2 = v53;
  v50->var6 = v50->var6 * 0.9;
  v50->var4 = 0.0;
  v50->var2 = v50->var2 + 5.0;
}

- (PFMessagesStackLayoutFrameSolver)init
{
  v7.receiver = self;
  v7.super_class = (Class)PFMessagesStackLayoutFrameSolver;
  v2 = [(PFMessagesStackLayoutFrameSolver *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_stackedItemsCount = 4;
    *(_OWORD *)&v2->_normalizedVerticalInsets = xmmword_1A42D3660;
    *(_OWORD *)&v2->_normalizedSizeTransform = xmmword_1A42D3670;
    uint64_t v4 = [&unk_1EF7CADF0 copy];
    normalizedHorizontalOffsets = v3->_normalizedHorizontalOffsets;
    v3->_normalizedHorizontalOffsets = (NSArray *)v4;
  }
  return v3;
}

@end