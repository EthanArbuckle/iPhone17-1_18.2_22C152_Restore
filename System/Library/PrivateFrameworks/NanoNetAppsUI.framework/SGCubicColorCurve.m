@interface SGCubicColorCurve
- (SGCubicColorCurve)initWithColorCurveElements:(id)a3;
- (SGCubicColorCurve)initWithCubicColorCurveElements:(id)a3;
- (id)colorForFraction:(float)a3;
- (uint64_t)rgbfColorForFraction:(uint64_t)result;
- (void)dealloc;
@end

@implementation SGCubicColorCurve

- (SGCubicColorCurve)initWithCubicColorCurveElements:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SGCubicColorCurve;
  v5 = [(SGCubicColorCurve *)&v19 init];
  if (v5)
  {
    v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_2];
    uint64_t v7 = [v4 count];
    v5->_count = v7;
    v5->_fractions = (float *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    *(void *)v5->_colors = malloc_type_malloc(16 * v5->_count, 0x1000040451B5BE8uLL);
    v8 = [[SGCubicSpline alloc] initWithNumberOfControlPoints:LODWORD(v5->_count) isClosed:0];
    spline = v5->_spline;
    v5->_spline = v8;

    uint64_t v10 = [(SGCubicSpline *)v5->_spline controlPointsBuffer];
    if (v5->_count)
    {
      v11 = (void *)v10;
      unint64_t v12 = 0;
      do
      {
        v13 = [v6 objectAtIndexedSubscript:v12];
        [v13 fraction];
        *(float *)&double v14 = v14;
        *(void *)(*v11 + 8 * v12) = __PAIR64__(LODWORD(v14), (float)(int)v12);
        [v13 fraction];
        *(float *)&double v15 = v15;
        v5->_fractions[v12] = *(float *)&v15;
        [v13 color];
        *(_OWORD *)(*(void *)v5->_colors + 16 * v12) = v16;

        ++v12;
      }
      while (v5->_count > v12);
    }
    [(SGCubicSpline *)v5->_spline process];
    v17 = v5;
  }
  return v5;
}

uint64_t __53__SGCubicColorCurve_initWithCubicColorCurveElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 fraction];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 fraction];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (SGCubicColorCurve)initWithColorCurveElements:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SGCubicColorCurve;
  id v5 = [(SGCubicColorCurve *)&v20 init];
  if (v5)
  {
    v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_19];
    uint64_t v7 = [v4 count];
    v5->_count = v7;
    v5->_fractions = (float *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    *(void *)v5->_colors = malloc_type_malloc(16 * v5->_count, 0x1000040451B5BE8uLL);
    double v8 = [[SGCubicSpline alloc] initWithNumberOfControlPoints:LODWORD(v5->_count) isClosed:0];
    spline = v5->_spline;
    v5->_spline = v8;

    uint64_t v10 = [(SGCubicSpline *)v5->_spline controlPointsBuffer];
    if (v5->_count)
    {
      uint64_t v11 = (void *)v10;
      unint64_t v12 = 0;
      do
      {
        v13 = [v6 objectAtIndexedSubscript:v12];
        [v13 fraction];
        *(void *)(*v11 + 8 * v12) = __PAIR64__(v14, (float)(int)v12);
        [v13 fraction];
        v5->_fractions[v12] = v15;
        long long v16 = [v13 color];
        CLKUIConvertToRGBfFromUIColor_fast();
        *(_OWORD *)(*(void *)v5->_colors + 16 * v12) = v17;

        ++v12;
      }
      while (v5->_count > v12);
    }
    [(SGCubicSpline *)v5->_spline process];
    v18 = v5;
  }
  return v5;
}

uint64_t __48__SGCubicColorCurve_initWithColorCurveElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 fraction];
  v6 = objc_msgSend(v4, "numberWithFloat:");
  uint64_t v7 = NSNumber;
  [v5 fraction];
  int v9 = v8;

  LODWORD(v10) = v9;
  uint64_t v11 = [v7 numberWithFloat:v10];
  uint64_t v12 = [v6 compare:v11];

  return v12;
}

- (void)dealloc
{
  free(self->_fractions);
  free(*(void **)self->_colors);
  v3.receiver = self;
  v3.super_class = (Class)SGCubicColorCurve;
  [(SGCubicColorCurve *)&v3 dealloc];
}

- (id)colorForFraction:(float)a3
{
  uint64_t v3 = [(SGCubicColorCurve *)self rgbfColorForFraction:a3];
  return (id)MEMORY[0x270F16908](v3);
}

- (uint64_t)rgbfColorForFraction:(uint64_t)result
{
  if (*(void *)(result + 40) != 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *(void *)(result + 32);
    while (1)
    {
      float v4 = *(float *)(v3 + 4 * v2);
      if (v4 <= a2)
      {
        float v5 = *(float *)(v3 + 4 * v2 + 4);
        if (v5 > a2) {
          break;
        }
      }
      if (*(void *)(result + 40) - 1 == ++v2) {
        return result;
      }
    }
    double v6 = (a2 - v4) / (float)(v5 - v4) + (double)(int)v2;
    *(float *)&double v6 = v6;
    return [*(id *)(result + 16) interpolateAt:v6];
  }
  return result;
}

- (void).cxx_destruct
{
}

@end