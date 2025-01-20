@interface GQDWrapPoint
- (GQDWrapPoint)initWithX:(float)a3 y:(float)a4 flowType:(int)a5 drawable:(id)a6;
- (int)zIndex;
- (int64_t)comparePoint:(id)a3;
@end

@implementation GQDWrapPoint

- (GQDWrapPoint)initWithX:(float)a3 y:(float)a4 flowType:(int)a5 drawable:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)GQDWrapPoint;
  v10 = [(GQDWrapPoint *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->mPoint.x = a3;
    v10->mPoint.y = a4;
    v10->mDistance = 0.0;
    v10->mFlowType = a5;
    v10->mDrawable = (GQDDrawable *)a6;
    unsigned int v12 = [a6 hasPagesOrder];
    unsigned int v13 = 0;
    if (v12) {
      unsigned int v13 = [a6 pagesOrder];
    }
    v11->mZIndex = v13;
  }
  return v11;
}

- (int64_t)comparePoint:(id)a3
{
  double v3 = *((double *)a3 + 2);
  double y = self->mPoint.y;
  if (v3 > y) {
    return -1;
  }
  if (v3 < y) {
    return 1;
  }
  double v5 = *((double *)a3 + 1);
  double x = self->mPoint.x;
  if (v5 > x) {
    return -1;
  }
  if (v5 < x) {
    return 1;
  }
  int v8 = *((_DWORD *)a3 + 10);
  int mFlowType = self->mFlowType;
  BOOL v12 = __OFSUB__(v8, mFlowType);
  BOOL v10 = v8 == mFlowType;
  BOOL v11 = v8 - mFlowType < 0;
  int64_t v13 = v8 < mFlowType;
  if (v11 ^ v12 | v10) {
    return v13;
  }
  else {
    return -1;
  }
}

- (int)zIndex
{
  return self->mZIndex;
}

@end