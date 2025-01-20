@interface NTKBezierPathPointModel
- (CGPoint)_computePointOnPathForHorizontalPercentage:(double)a3;
- (CGPoint)pointOnPathForHorizontalPercentage:(double)a3;
- (CGPoint)pointOnPathForHorizontalPercentage:(double)a3 withEndPadding:(double)a4;
- (NTKBezierPathPointModel)initWithPath:(id)a3;
- (UIBezierPath)path;
- (double)_computeDistanceBetweenPointA:(CGPoint)a3 andPointB:(CGPoint)a4;
- (double)_estimatePercentageForEndPadding:(double)a3;
- (id)_buildHorizontalPercentageCache;
@end

@implementation NTKBezierPathPointModel

- (NTKBezierPathPointModel)initWithPath:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKBezierPathPointModel;
  v6 = [(NTKBezierPathPointModel *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    pathElements = v7->_pathElements;
    v7->_pathElements = (NSArray *)v8;

    CGPathApply((CGPathRef)[v5 CGPath], v7->_pathElements, (CGPathApplierFunction)NTKBuildPathElement);
    uint64_t v10 = [(NTKBezierPathPointModel *)v7 _buildHorizontalPercentageCache];
    horizontalPercentageCache = v7->_horizontalPercentageCache;
    v7->_horizontalPercentageCache = (NSDictionary *)v10;

    v12 = v7;
  }

  return v7;
}

- (CGPoint)pointOnPathForHorizontalPercentage:(double)a3
{
  [(NTKBezierPathPointModel *)self pointOnPathForHorizontalPercentage:a3 withEndPadding:0.0];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)pointOnPathForHorizontalPercentage:(double)a3 withEndPadding:(double)a4
{
  [(NTKBezierPathPointModel *)self _estimatePercentageForEndPadding:a4];
  double v7 = 1.0 - v6;
  if (v6 < a3) {
    double v6 = a3;
  }
  if (v7 <= v6) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  double v9 = floor(v8 * 100.0);
  horizontalPercentageCache = self->_horizontalPercentageCache;
  v11 = [NSNumber numberWithDouble:v9];
  v12 = [(NSDictionary *)horizontalPercentageCache objectForKeyedSubscript:v11];

  v13 = self->_horizontalPercentageCache;
  objc_super v14 = [NSNumber numberWithDouble:v9 + 1.0];
  v15 = [(NSDictionary *)v13 objectForKeyedSubscript:v14];

  if (v12) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    [(NTKBezierPathPointModel *)self _computePointOnPathForHorizontalPercentage:v8];
  }
  else
  {
    [v12 floatValue];
    [v15 floatValue];
    v17 = [(NTKBezierPathPointModel *)self path];
    [v17 bounds];
    CGRectGetWidth(v26);

    v18 = [(NTKBezierPathPointModel *)self path];
    [v18 bounds];
    CGRectGetWidth(v27);

    CLKInterpolateBetweenPoints();
  }
  double v21 = v19;
  double v22 = v20;

  double v23 = v21;
  double v24 = v22;
  result.y = v24;
  result.x = v23;
  return result;
}

- (id)_buildHorizontalPercentageCache
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  for (unint64_t i = 0; i != 101; ++i)
  {
    [(NTKBezierPathPointModel *)self _computePointOnPathForHorizontalPercentage:(double)i * 0.01];
    double v6 = [NSNumber numberWithDouble:v5];
    double v7 = [NSNumber numberWithUnsignedInteger:i];
    [v3 setObject:v6 forKeyedSubscript:v7];
  }

  return v3;
}

- (CGPoint)_computePointOnPathForHorizontalPercentage:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  double v5 = fmin(fmax(a3, 0.0), 1.0);
  double v6 = [(NTKBezierPathPointModel *)self path];
  [v6 bounds];
  double v7 = v5 * CGRectGetWidth(v27);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v8 = self->_pathElements;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", (void)v20))
        {
          [v13 startPoint];
          if (v14 <= v7)
          {
            [v13 endPoint];
            if (v15 >= v7)
            {
              [v13 pointOnPathForX:v7];
              double v7 = v16;
              double v4 = v17;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  double v18 = v7;
  double v19 = v4;
  result.y = v19;
  result.x = v18;
  return result;
}

- (double)_estimatePercentageForEndPadding:(double)a3
{
  double v5 = [(NSDictionary *)self->_horizontalPercentageCache objectForKeyedSubscript:&unk_1F16E14D0];
  [v5 floatValue];
  double v7 = v6;
  double v8 = [(NTKBezierPathPointModel *)self path];
  [v8 bounds];
  double Width = CGRectGetWidth(v22);

  unint64_t v9 = 0;
  double v10 = 0.0;
  double v20 = 0.01;
  while (1)
  {
    horizontalPercentageCache = self->_horizontalPercentageCache;
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v9, *(void *)&v20);
    v13 = [(NSDictionary *)horizontalPercentageCache objectForKeyedSubscript:v12];

    [v13 floatValue];
    -[NTKBezierPathPointModel _computeDistanceBetweenPointA:andPointB:](self, "_computeDistanceBetweenPointA:andPointB:", Width * (double)v9 * v20, v14, 0.0, v7);
    double v16 = v15;
    if (v10 <= a3 && v15 >= a3) {
      break;
    }

    ++v9;
    double v10 = v16;
    if (v9 == 100)
    {
      double v17 = 0.0;
      goto LABEL_7;
    }
  }
  CLKInterpolateBetweenPoints();
  double v17 = v18 / Width;

LABEL_7:
  return v17;
}

- (double)_computeDistanceBetweenPointA:(CGPoint)a3 andPointB:(CGPoint)a4
{
  float v4 = a3.x - a4.x;
  float v5 = a3.y - a4.y;
  return hypotf(v4, v5);
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalPercentageCache, 0);
  objc_storeStrong((id *)&self->_pathElements, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end