@interface TSDWrapPolygon
- (BOOL)intersectsSelf;
- (CGPoint)intersectionPointBetween:(CGPoint)a3 and:(CGPoint)a4;
- (CGRect)bounds;
- (TSDWrapPolygon)initWithPath:(id)a3;
- (id)bezierPath;
- (id)copyWithZone:(_NSZone *)a3;
- (int)p_countSegments;
- (void)dealloc;
- (void)p_computeIntersectionState;
- (void)p_freePolygon;
- (void)p_setPolygon:(id *)a3;
- (void)polygon;
- (void)setIntersectsSelf:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
@end

@implementation TSDWrapPolygon

- (TSDWrapPolygon)initWithPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDWrapPolygon;
  v4 = [(TSDWrapPolygon *)&v7 init];
  v5 = v4;
  if (v4) {
    [(TSDWrapPolygon *)v4 setPath:a3];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(TSDWrapPolygon);
  [(TSDWrapPolygon *)v4 p_setPolygon:copyPolygon((int *)self->mPolygon)];
  if (self->mComputedSelfIntersection) {
    [(TSDWrapPolygon *)v4 setIntersectsSelf:self->mIntersectsSelf];
  }
  return v4;
}

- (void)dealloc
{
  [(TSDWrapPolygon *)self p_freePolygon];
  v3.receiver = self;
  v3.super_class = (Class)TSDWrapPolygon;
  [(TSDWrapPolygon *)&v3 dealloc];
}

- (void)setPath:(id)a3
{
  id v3 = a3;
  if (([a3 isFlat] & 1) == 0) {
    id v3 = (id)[v3 bezierPathByFlatteningPath];
  }
  if ([v3 isClockwise]) {
    id v3 = (id)[v3 bezierPathByReversingPath];
  }
  self->mComputedSelfIntersection = 0;
  self->mComputedBounds = 0;
  [(TSDWrapPolygon *)self p_freePolygon];
  self->mPolygon = polygonFromBezier(v3);
}

- (void)setIntersectsSelf:(BOOL)a3
{
  self->mIntersectsSelf = a3;
  self->mComputedSelfIntersection = 1;
}

- (BOOL)intersectsSelf
{
  if (!self->mComputedSelfIntersection)
  {
    [(TSDWrapPolygon *)self p_computeIntersectionState];
    self->mComputedSelfIntersection = 1;
  }
  return self->mIntersectsSelf;
}

- (void)polygon
{
  return self->mPolygon;
}

- (CGRect)bounds
{
  if (!self->mComputedBounds)
  {
    mPolygon = (int *)self->mPolygon;
    CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    self->mBounds.origin = (CGPoint)*MEMORY[0x263F001A8];
    self->mBounds.size = v4;
    if (mPolygon)
    {
      if (*mPolygon >= 1)
      {
        uint64_t v5 = 0;
        uint64_t v6 = 0;
        double x = self->mBounds.origin.x;
        double y = self->mBounds.origin.y;
        double width = self->mBounds.size.width;
        double height = self->mBounds.size.height;
        do
        {
          double v11 = boundsForVertexList(*((void *)mPolygon + 2) + v5);
          double x = TSDUnionRect(x, y, width, height, v11, v12, v13, v14);
          double y = v15;
          double width = v16;
          double height = v17;
          self->mBounds.origin.double x = x;
          self->mBounds.origin.double y = v15;
          self->mBounds.size.double width = v16;
          self->mBounds.size.double height = v17;
          ++v6;
          v5 += 16;
        }
        while (v6 < *mPolygon);
      }
      self->mComputedBounds = 1;
    }
  }
  double v18 = self->mBounds.size.width;
  double v19 = self->mBounds.size.height;
  double v20 = self->mBounds.origin.x;
  double v21 = self->mBounds.origin.y;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)bezierPath
{
  id result = self->mPolygon;
  if (result) {
    return bezierFromPolygon((int *)result);
  }
  return result;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  mPolygon = (unsigned int *)self->mPolygon;
  if (mPolygon)
  {
    uint64_t v4 = *mPolygon;
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *((void *)mPolygon + 2);
      do
      {
        uint64_t v7 = *(unsigned int *)(v6 + 16 * v5);
        if ((int)v7 >= 1)
        {
          v8 = *(double **)(v6 + 16 * v5 + 8);
          do
          {
            *(float64x2_t *)v8 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v8[1]), *(float64x2_t *)&a3->a, *v8));
            v8 += 2;
            --v7;
          }
          while (v7);
        }
        ++v5;
      }
      while (v5 != v4);
    }
    self->mComputedBounds = 0;
  }
}

- (CGPoint)intersectionPointBetween:(CGPoint)a3 and:(CGPoint)a4
{
  mPolygon = (unsigned int *)self->mPolygon;
  double v5 = 0.0;
  if (mPolygon)
  {
    uint64_t v6 = *mPolygon;
    if ((int)v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = *((void *)mPolygon + 2);
      double v9 = a4.x - a3.x;
      do
      {
        uint64_t v10 = *(unsigned int *)(v8 + 16 * v7);
        if ((int)v10 >= 2)
        {
          uint64_t v11 = *(void *)(v8 + 16 * v7 + 8);
          double v12 = (double *)(v11 + 16 * (v10 - 1));
          double v13 = *v12;
          double v14 = v12[1];
          CGFloat v15 = (double *)(v11 + 8);
          do
          {
            double v16 = v13;
            double v17 = v14;
            double v13 = *(v15 - 1);
            double v14 = *v15;
            double v18 = v16 - v13;
            double v19 = v17 - *v15;
            double v20 = v19 * v9 - v18 * (a4.y - a3.y);
            if (v20 != 0.0)
            {
              double v21 = (v18 * (a3.y - v14) - v19 * (a3.x - v13)) / v20;
              double v22 = ((a3.x - v13) * -(a4.y - a3.y) + v9 * (a3.y - v14)) / v20;
              BOOL v25 = v22 > 1.0 || v22 < 0.0 || v21 > 1.0 || v21 < 0.0;
              double v26 = fmax(v5, v21);
              if (!v25) {
                double v5 = v26;
              }
            }
            v15 += 2;
            --v10;
          }
          while (v10);
        }
        ++v7;
      }
      while (v7 != v6);
    }
  }
  double v27 = a3.x + (a4.x - a3.x) * v5;
  double v28 = a3.y + (a4.y - a3.y) * v5;
  result.double y = v28;
  result.double x = v27;
  return result;
}

- (void)p_freePolygon
{
  mPolygon = self->mPolygon;
  if (mPolygon)
  {
    TSDgpc_free_polygon((uint64_t)mPolygon);
    free(self->mPolygon);
    self->mPolygon = 0;
  }
}

- (void)p_setPolygon:(id *)a3
{
  self->mPolygon = a3;
}

- (int)p_countSegments
{
  mPolygon = (unsigned int *)self->mPolygon;
  if (!mPolygon) {
    return 0;
  }
  uint64_t v3 = *mPolygon;
  if ((int)v3 < 1) {
    return 0;
  }
  int result = 0;
  double v5 = (int *)*((void *)mPolygon + 2);
  do
  {
    int v7 = *v5;
    v5 += 4;
    int v6 = v7;
    BOOL v8 = v7 == 2;
    if (v7 <= 2) {
      int v6 = 0;
    }
    if (v8) {
      int v6 = 1;
    }
    result += v6;
    --v3;
  }
  while (v3);
  return result;
}

- (void)p_computeIntersectionState
{
  mPolygon = (int *)self->mPolygon;
  int v4 = [(TSDWrapPolygon *)self p_countSegments];
  self->mIntersectsSelf = 0;
  if (v4 >= 1)
  {
    int v5 = 0;
    double v6 = 0.0;
    int v7 = *mPolygon;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    while (1)
    {
      if (v7 >= 1)
      {
        int v15 = 0;
        int v16 = 0;
        double v17 = (void *)(*((void *)mPolygon + 2) + 8);
        uint64_t v18 = *mPolygon;
        while (1)
        {
          int v19 = *((_DWORD *)v17 - 2);
          if (v19 > 2) {
            int v15 = *((_DWORD *)v17 - 2);
          }
          if (v19 == 2) {
            int v15 = 1;
          }
          if (v15 + v16 >= v5) {
            break;
          }
          v17 += 2;
          v16 += v15;
          if (!--v18) {
            goto LABEL_13;
          }
        }
        uint64_t v20 = *v17;
        double v21 = (double *)(v20 + 16 * ((v5 - v16) % v19));
        double v13 = *v21;
        double v14 = v21[1];
        double v22 = (double *)(v20 + 16 * ((v5 - v16 + 1) % v19));
        double v11 = *v22;
        double v12 = v22[1];
      }
LABEL_13:
      if (++v5 < v4) {
        break;
      }
LABEL_36:
      if (v5 == v4) {
        return;
      }
    }
    double v23 = v11 - v13;
    int v24 = v5;
    while (1)
    {
      if (v7 >= 1)
      {
        int v25 = 0;
        int v26 = 0;
        double v27 = (void *)(*((void *)mPolygon + 2) + 8);
        uint64_t v28 = *mPolygon;
        while (1)
        {
          int v29 = *((_DWORD *)v27 - 2);
          if (v29 > 2) {
            int v25 = *((_DWORD *)v27 - 2);
          }
          if (v29 == 2) {
            int v25 = 1;
          }
          if (v25 + v26 >= v24) {
            break;
          }
          v27 += 2;
          v26 += v25;
          if (!--v28) {
            goto LABEL_25;
          }
        }
        uint64_t v30 = *v27;
        v31 = (double *)(v30 + 16 * ((v24 - v26) % v29));
        double v9 = *v31;
        double v10 = v31[1];
        v32 = (double *)(v30 + 16 * ((v24 - v26 + 1) % v29));
        double v6 = *v32;
        double v8 = v32[1];
      }
LABEL_25:
      double v33 = (v6 - v9) * -(v12 - v14) + v23 * (v8 - v10);
      if (v33 != 0.0)
      {
        double v34 = ((v14 - v10) * (v6 - v9) - (v13 - v9) * (v8 - v10)) / v33;
        if (v34 > 0.0 && v34 < 1.0)
        {
          double v36 = ((v14 - v10) * v23 - (v13 - v9) * (v12 - v14)) / v33;
          if (v36 > 0.0 && v36 < 1.0) {
            break;
          }
        }
      }
      if (++v24 == v4) {
        goto LABEL_36;
      }
    }
    self->mIntersectsSelf = 1;
  }
}

@end