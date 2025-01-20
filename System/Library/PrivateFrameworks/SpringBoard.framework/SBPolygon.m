@interface SBPolygon
+ (CGPoint)_pointAtIndex:(unint64_t)a3 ofPointArray:(id)a4;
+ (id)_sortPoints:(id)a3;
- (BOOL)_isLeftHanded;
- (BOOL)isEqual:(id)a3;
- (CGPoint)_centroid;
- (CGPoint)_pointAtIndex:(unint64_t)a3;
- (CGPoint)_weightedCentroid;
- (NSMutableArray)_points;
- (NSMutableArray)_weights;
- (SBPolygon)initWithPoints:(CGPoint *)a3 pointCount:(unint64_t)a4;
- (SBPolygon)initWithPoints:(id)a3;
- (double)_baseOrientation;
- (double)_meanFingertipRowAngle;
- (double)_meanRadius;
- (double)_perimeter;
- (double)_weightAtIndex:(unint64_t)a3;
- (double)distanceOfFarthestPointFromCentroid;
- (id)description;
- (unint64_t)_thumbIndex;
- (unint64_t)pointCount;
- (void)_applyTransform:(CGAffineTransform *)a3;
- (void)_flipHorizontally;
- (void)_rotate:(double)a3;
- (void)_scale:(double)a3;
- (void)_setCentroid:(CGPoint)a3;
- (void)_setPoints:(id)a3;
- (void)_setWeightedCentroid:(CGPoint)a3;
- (void)_setWeights:(id)a3;
- (void)_translate:(CGPoint)a3;
- (void)_updateCentroid;
- (void)_updateProperties;
- (void)_updateWeightedCentroid;
- (void)_updateWeights;
- (void)enumeratePointsUsingBlock:(id)a3;
@end

@implementation SBPolygon

- (SBPolygon)initWithPoints:(CGPoint *)a3 pointCount:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (a4 >= 6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBPolygon.m", 20, @"The max number of points allowed is %d", 5);
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  if (v4)
  {
    p_y = &a3->y;
    do
    {
      v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *(p_y - 1), *p_y);
      [v7 addObject:v9];

      p_y += 2;
      --v4;
    }
    while (v4);
  }
  v10 = [(SBPolygon *)self initWithPoints:v7];

  return v10;
}

- (SBPolygon)initWithPoints:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBPolygon;
  v5 = [(SBPolygon *)&v8 init];
  if (v5)
  {
    v6 = +[SBPolygon _sortPoints:v4];
    [(SBPolygon *)v5 _setPoints:v6];
    [(SBPolygon *)v5 _updateProperties];
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(SBPolygon *)self pointCount])
  {
    unint64_t v4 = 0;
    do
    {
      [(SBPolygon *)self _pointAtIndex:v4];
      v7 = [NSString stringWithFormat:@"(%f, %f)", v5, v6];
      [v3 addObject:v7];

      ++v4;
    }
    while ([(SBPolygon *)self pointCount] > v4);
  }
  objc_super v8 = NSString;
  uint64_t v9 = objc_opt_class();
  [(SBPolygon *)self _isLeftHanded];
  v10 = NSStringFromBOOL();
  v11 = [v8 stringWithFormat:@"<%@:%p points=%@ leftHanded=%@ thumbIndex: %lu>", v9, self, v3, v10, -[SBPolygon _thumbIndex](self, "_thumbIndex")];

  return v11;
}

- (unint64_t)pointCount
{
  v2 = [(SBPolygon *)self points];
  unint64_t v3 = [v2 count];

  return v3;
}

- (double)distanceOfFarthestPointFromCentroid
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  [(SBPolygon *)self _centroid];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SBPolygon_distanceOfFarthestPointFromCentroid__block_invoke;
  v7[3] = &unk_1E6B02240;
  v7[5] = v3;
  v7[6] = v4;
  v7[4] = &v8;
  [(SBPolygon *)self enumeratePointsUsingBlock:v7];
  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __48__SBPolygon_distanceOfFarthestPointFromCentroid__block_invoke(uint64_t a1)
{
  uint64_t result = UIDistanceBetweenPoints();
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3 > *(double *)(v4 + 24)) {
    *(double *)(v4 + 24) = v3;
  }
  return result;
}

- (void)enumeratePointsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, unsigned char *))a3;
  char v6 = 0;
  if ([(SBPolygon *)self pointCount])
  {
    unint64_t v5 = 1;
    do
    {
      if (v4)
      {
        [(SBPolygon *)self _pointAtIndex:v5 - 1];
        v4[2](v4, v5 - 1, &v6);
      }
      if (v5 >= [(SBPolygon *)self pointCount]) {
        break;
      }
      ++v5;
    }
    while (!v6);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SBPolygon *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      char v6 = [(SBPolygon *)self points];
      v7 = [(SBPolygon *)v5 points];

      char v8 = [v6 isEqualToArray:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (double)_perimeter
{
  double v3 = 0.0;
  if ([(SBPolygon *)self pointCount] >= 2 && [(SBPolygon *)self pointCount] != 1)
  {
    unint64_t v4 = 0;
    do
    {
      [(SBPolygon *)self _pointAtIndex:v4++];
      [(SBPolygon *)self _pointAtIndex:v4];
      UIDistanceBetweenPoints();
      double v3 = v3 + v5;
    }
    while (v4 < [(SBPolygon *)self pointCount] - 1);
  }
  return v3;
}

- (CGPoint)_pointAtIndex:(unint64_t)a3
{
  +[SBPolygon _pointAtIndex:a3 ofPointArray:self->_mutablePoints];
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)_weightAtIndex:(unint64_t)a3
{
  double v3 = [(NSMutableArray *)self->_weights objectAtIndex:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)_updateProperties
{
  [(SBPolygon *)self _updateCentroid];
  [(SBPolygon *)self _updateWeights];
  [(SBPolygon *)self _updateWeightedCentroid];
}

- (void)_updateCentroid
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v5 = 0;
  char v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__SBPolygon__updateCentroid__block_invoke;
  v4[3] = &unk_1E6B02268;
  v4[4] = &v9;
  v4[5] = &v5;
  [(SBPolygon *)self enumeratePointsUsingBlock:v4];
  unint64_t v3 = [(SBPolygon *)self pointCount];
  -[SBPolygon _setCentroid:](self, "_setCentroid:", v10[3] / (double)v3, v6[3] / (double)v3);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

double __28__SBPolygon__updateCentroid__block_invoke(uint64_t a1, double a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = a3 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (void)_updateWeights
{
  unint64_t v3 = [(SBPolygon *)self pointCount];
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
  id v6 = v4;
  if (v3)
  {
    unint64_t v5 = v3;
    do
    {
      [v4 addObject:&unk_1F334A298];
      double v4 = v6;
      --v5;
    }
    while (v5);
    if (v3 == 5)
    {
      objc_msgSend(v6, "setObject:atIndexedSubscript:", &unk_1F3348BC8, -[SBPolygon _thumbIndex](self, "_thumbIndex"));
      double v4 = v6;
    }
  }
  [(SBPolygon *)self _setWeights:v4];
}

- (void)_updateWeightedCentroid
{
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v4 = 0;
  unint64_t v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__SBPolygon__updateWeightedCentroid__block_invoke;
  v3[3] = &unk_1E6B02290;
  v3[4] = self;
  v3[5] = &v12;
  v3[6] = &v8;
  v3[7] = &v4;
  [(SBPolygon *)self enumeratePointsUsingBlock:v3];
  -[SBPolygon _setWeightedCentroid:](self, "_setWeightedCentroid:", v13[3] / v5[3], v9[3] / v5[3]);
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

double __36__SBPolygon__updateWeightedCentroid__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  [*(id *)(a1 + 32) _weightAtIndex:a2];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + v8 * a3;
  [*(id *)(a1 + 32) _weightAtIndex:a2];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v9 * a4;
  [*(id *)(a1 + 32) _weightAtIndex:a2];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  double result = v11 + *(double *)(v10 + 24);
  *(double *)(v10 + 24) = result;
  return result;
}

- (BOOL)_isLeftHanded
{
  if ([(SBPolygon *)self pointCount] != 5) {
    return 0;
  }
  [(SBPolygon *)self _pointAtIndex:0];
  double v4 = v3;
  double v6 = v5;
  [(SBPolygon *)self _pointAtIndex:1];
  *(float *)&double v7 = v7 - v4;
  *(float *)&double v8 = v8 - v6;
  float v9 = (float)(*(float *)&v7 * *(float *)&v7) + (float)(*(float *)&v8 * *(float *)&v8);
  [(SBPolygon *)self _pointAtIndex:3];
  double v11 = v10;
  double v13 = v12;
  [(SBPolygon *)self _pointAtIndex:4];
  *(float *)&double v14 = v14 - v11;
  *(float *)&double v15 = v15 - v13;
  return v9 < (float)((float)(*(float *)&v14 * *(float *)&v14) + (float)(*(float *)&v15 * *(float *)&v15));
}

- (unint64_t)_thumbIndex
{
  if ([(SBPolygon *)self _isLeftHanded]) {
    return [(SBPolygon *)self pointCount] - 1;
  }
  else {
    return 0;
  }
}

- (void)_applyTransform:(CGAffineTransform *)a3
{
  [(SBPolygon *)self _centroid];
  double v6 = v5;
  double v8 = v7;
  if ([(SBPolygon *)self pointCount])
  {
    unint64_t v9 = 0;
    do
    {
      [(SBPolygon *)self _pointAtIndex:v9];
      double v11 = v10 - v6;
      double v13 = v12 - v8;
      double v14 = v6 + a3->tx + v13 * a3->c + a3->a * v11;
      double v15 = v8 + a3->ty + v13 * a3->d + a3->b * v11;
      v16 = [(SBPolygon *)self _points];
      v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v14, v15);
      [v16 setObject:v17 atIndexedSubscript:v9];

      ++v9;
    }
    while ([(SBPolygon *)self pointCount] > v9);
  }
}

- (void)_flipHorizontally
{
  CGAffineTransformMakeScale(&v13, -1.0, 1.0);
  [(SBPolygon *)self _applyTransform:&v13];
  unint64_t v3 = [(SBPolygon *)self pointCount];
  unint64_t v4 = v3 - 1;
  if (v3 != 1)
  {
    unint64_t v5 = 1;
    do
    {
      double v6 = [(SBPolygon *)self _points];
      double v7 = [v6 objectAtIndex:v5 - 1];

      double v8 = [(SBPolygon *)self _points];
      unint64_t v9 = [(SBPolygon *)self _points];
      double v10 = [v9 objectAtIndex:v4];
      [v8 setObject:v10 atIndexedSubscript:v5 - 1];

      double v11 = [(SBPolygon *)self _points];
      [v11 setObject:v7 atIndexedSubscript:v4];
    }
    while (v5++ < --v4);
  }
  [(SBPolygon *)self _updateProperties];
}

- (void)_scale:(double)a3
{
  CGAffineTransformMakeScale(&v4, a3, a3);
  [(SBPolygon *)self _applyTransform:&v4];
  [(SBPolygon *)self _updateCentroid];
  [(SBPolygon *)self _updateWeightedCentroid];
}

- (void)_rotate:(double)a3
{
  CGAffineTransformMakeRotation(&v4, a3);
  [(SBPolygon *)self _applyTransform:&v4];
  [(SBPolygon *)self _updateCentroid];
  [(SBPolygon *)self _updateWeightedCentroid];
}

- (void)_translate:(CGPoint)a3
{
  CGAffineTransformMakeTranslation(&v4, a3.x, a3.y);
  [(SBPolygon *)self _applyTransform:&v4];
  [(SBPolygon *)self _updateCentroid];
  [(SBPolygon *)self _updateWeightedCentroid];
}

- (double)_baseOrientation
{
  if ([(SBPolygon *)self pointCount] < 2) {
    return 0.0;
  }
  [(SBPolygon *)self _pointAtIndex:0];
  double v5 = v4;
  double v7 = v6;
  [(SBPolygon *)self _pointAtIndex:[(SBPolygon *)self pointCount] - 1];
  return atan2(v9 - v7, v8 - v5);
}

- (double)_meanFingertipRowAngle
{
  unint64_t v3 = [(SBPolygon *)self pointCount];
  switch(v3)
  {
    case 5uLL:
      if (![(SBPolygon *)self _isLeftHanded])
      {
        [(SBPolygon *)self _pointAtIndex:1];
        double v6 = v19;
        double v8 = v20;
        [(SBPolygon *)self _pointAtIndex:2];
        double v10 = v21;
        double v12 = v22;
        [(SBPolygon *)self _pointAtIndex:3];
        double v14 = v23;
        double v16 = v24;
        v17 = self;
        uint64_t v18 = 4;
        goto LABEL_11;
      }
      break;
    case 4uLL:
      break;
    case 3uLL:
      [(SBPolygon *)self _baseOrientation];
      return result;
    default:
      return 0.0;
  }
  [(SBPolygon *)self _pointAtIndex:0];
  double v6 = v5;
  double v8 = v7;
  [(SBPolygon *)self _pointAtIndex:1];
  double v10 = v9;
  double v12 = v11;
  [(SBPolygon *)self _pointAtIndex:2];
  double v14 = v13;
  double v16 = v15;
  v17 = self;
  uint64_t v18 = 3;
LABEL_11:
  [(SBPolygon *)v17 _pointAtIndex:v18];
  return mean_tetragon_orientation(v6, v8, v10, v12, v14, v16, v25, v26);
}

- (double)_meanRadius
{
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__SBPolygon__meanRadius__block_invoke;
  v6[3] = &unk_1E6B022B8;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  [(SBPolygon *)self enumeratePointsUsingBlock:v6];
  double v2 = v12[3];
  double v3 = 0.0;
  if (v2 != 0.0)
  {
    double v4 = v8[3];
    if (v4 != 0.0) {
      double v3 = v2 / v4;
    }
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v3;
}

double __24__SBPolygon__meanRadius__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _weightAtIndex:a2];
  double v5 = v4;
  [*(id *)(a1 + 32) _centroid];
  UIDistanceBetweenPoints();
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + v5 * v6;
  [*(id *)(a1 + 32) _weightAtIndex:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = v8 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

+ (CGPoint)_pointAtIndex:(unint64_t)a3 ofPointArray:(id)a4
{
  double v4 = [a4 objectAtIndex:a3];
  [v4 CGPointValue];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

+ (id)_sortPoints:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    double v10 = 0.0;
    uint64_t v11 = 1;
    do
    {
      [a1 _pointAtIndex:v7 ofPointArray:v4];
      unint64_t v14 = v7 + 1;
      if (v6 > v7 + 1)
      {
        double v15 = v12;
        double v16 = v13;
        for (unint64_t i = v11; v6 > i; ++i)
        {
          [a1 _pointAtIndex:i ofPointArray:v4];
          double v19 = v18;
          double v21 = v20;
          UIDistanceBetweenPoints();
          float v23 = v22;
          double v24 = v23;
          BOOL v25 = v10 < v23;
          if (v10 < v23) {
            unint64_t v26 = i;
          }
          else {
            unint64_t v26 = v9;
          }
          if (v10 < v23) {
            unint64_t v27 = v7;
          }
          else {
            unint64_t v27 = v8;
          }
          if (v10 < v23) {
            double v28 = v23;
          }
          else {
            double v28 = v10;
          }
          if (v25 && v6 >= 3)
          {
            uint64_t v30 = 0;
            double v31 = v19 - v15;
            double v32 = -(v21 - v16);
            double v33 = 1.17549435e-38;
            double v34 = 3.40282347e38;
            do
            {
              [a1 _pointAtIndex:v30 ofPointArray:v4];
              double v37 = -((v36 - v15) * v32 + v31 * (v35 - v16)) / v24;
              if (v37 > v33) {
                double v33 = v37;
              }
              if (v37 < v34) {
                double v34 = v37;
              }
              ++v30;
            }
            while (v6 != v30);
            if (fabs(v33) <= fabs(v34))
            {
              if (v33 < 20.0)
              {
                unint64_t v9 = v7;
                unint64_t v8 = i;
                goto LABEL_30;
              }
            }
            else if (v34 > -20.0)
            {
              unint64_t v9 = i;
              unint64_t v8 = v7;
LABEL_30:
              double v10 = v24;
            }
          }
          else
          {
            unint64_t v9 = v26;
            unint64_t v8 = v27;
            double v10 = v28;
          }
        }
      }
      ++v11;
      ++v7;
    }
    while (v14 != v6);
    if (v10 > 0.0)
    {
      [a1 _pointAtIndex:v8 ofPointArray:v4];
      double v39 = v38;
      double v41 = v40;
      [a1 _pointAtIndex:v9 ofPointArray:v4];
      double v43 = v42;
      double v45 = v44;
      id v46 = [MEMORY[0x1E4F1CA48] array];
      v47 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v48 = 0;
      double v49 = v43 - v39;
      double v50 = v45 - v41;
      while (1)
      {
        if (v8 != v48 && v9 != v48)
        {
          [a1 _pointAtIndex:v48 ofPointArray:v4];
          double v52 = v51;
          double v54 = v53;
          double v55 = v50 * (v53 - v41) + v49 * (v51 - v39);
          if ([v47 count])
          {
            if ([v47 count])
            {
              unint64_t v56 = 0;
              do
              {
                v57 = [v47 objectAtIndex:v56];
                [v57 doubleValue];
                double v59 = v58;

                if (v55 <= v59)
                {
                  v60 = [NSNumber numberWithDouble:v55];
                  [v47 insertObject:v60 atIndex:v56];

                  v61 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v52, v54);
                  [v46 insertObject:v61 atIndex:v56];
                }
                ++v56;
              }
              while ([v47 count] > v56 && v55 > v59);
              if (v55 <= v59) {
                goto LABEL_48;
              }
            }
            v62 = [NSNumber numberWithDouble:v55];
            [v47 addObject:v62];

            v63 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v52, v54);
            v64 = v46;
          }
          else
          {
            v65 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v52, v54);
            [v46 addObject:v65];

            v63 = [NSNumber numberWithDouble:v55];
            v64 = v47;
          }
          [v64 addObject:v63];
        }
LABEL_48:
        if (++v48 == v6)
        {
          v66 = (void *)MEMORY[0x1E4F29238];
          [a1 _pointAtIndex:v8 ofPointArray:v4];
          v67 = objc_msgSend(v66, "valueWithCGPoint:");
          [v46 insertObject:v67 atIndex:0];

          v68 = (void *)MEMORY[0x1E4F29238];
          [a1 _pointAtIndex:v9 ofPointArray:v4];
          v69 = objc_msgSend(v68, "valueWithCGPoint:");
          [v46 insertObject:v69 atIndex:v6 - 1];

          goto LABEL_51;
        }
      }
    }
  }
  id v46 = v4;
LABEL_51:

  return v46;
}

- (NSMutableArray)_points
{
  return self->_mutablePoints;
}

- (void)_setPoints:(id)a3
{
}

- (CGPoint)_centroid
{
  double x = self->_centroid.x;
  double y = self->_centroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setCentroid:(CGPoint)a3
{
  self->_centroid = a3;
}

- (NSMutableArray)_weights
{
  return self->_weights;
}

- (void)_setWeights:(id)a3
{
}

- (CGPoint)_weightedCentroid
{
  double x = self->_weightedCentroid.x;
  double y = self->_weightedCentroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setWeightedCentroid:(CGPoint)a3
{
  self->_weightedCentroid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_mutablePoints, 0);
}

@end