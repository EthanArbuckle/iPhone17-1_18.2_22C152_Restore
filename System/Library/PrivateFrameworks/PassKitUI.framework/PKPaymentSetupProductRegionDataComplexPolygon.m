@interface PKPaymentSetupProductRegionDataComplexPolygon
- (BOOL)containsPoint:(CGPoint)a3 inExclusionaryRegion:(BOOL *)a4;
- (PKPaymentSetupProductRegionDataComplexPolygon)initWithInclusionaryZones:(id)a3 exclusionaryZones:(id)a4;
- (double)closestDistanceToPoint:(CGPoint)a3;
- (void)dealloc;
@end

@implementation PKPaymentSetupProductRegionDataComplexPolygon

- (PKPaymentSetupProductRegionDataComplexPolygon)initWithInclusionaryZones:(id)a3 exclusionaryZones:(id)a4
{
  id v6 = a4;
  v7 = CreateSanitizedZonesList(a3);
  v8 = CreateSanitizedZonesList(v6);
  if ((v7 && [v7 count] || v8 && objc_msgSend(v8, "count"))
    && (size_t v9 = [v7 count], v10 = objc_msgSend(v8, "count"), v9 | v10))
  {
    size_t v12 = v10;
    v26.receiver = self;
    v26.super_class = (Class)PKPaymentSetupProductRegionDataComplexPolygon;
    v13 = [(PKPaymentSetupProductRegionDataComplexPolygon *)&v26 init];
    v14 = v13;
    if (v13)
    {
      v13->_inclusionaryPolygonCount = v9;
      if (v9)
      {
        v13->_inclusionaryPolygons = ($10FCDB702A2524659316F5DC9651755D *)malloc_type_calloc(v9, 0x10uLL, 0x1020040EDED9539uLL);
        if (v14->_inclusionaryPolygonCount)
        {
          uint64_t v15 = 0;
          unint64_t v16 = 0;
          do
          {
            v17 = [v7 objectAtIndexedSubscript:v16];
            v18 = (char **)&v14->_inclusionaryPolygons[v15];
            *v18 = CreatePolygonForPoints(v17);
            v18[1] = v19;

            ++v16;
            ++v15;
          }
          while (v16 < v14->_inclusionaryPolygonCount);
        }
      }
      if (v14->_exclusionaryPolygonCount)
      {
        v14->_exclusionaryPolygonCount = v12;
        v14->_exclusionaryPolygons = ($10FCDB702A2524659316F5DC9651755D *)malloc_type_calloc(v12, 0x10uLL, 0x1020040EDED9539uLL);
        if (v14->_exclusionaryPolygonCount)
        {
          uint64_t v20 = 0;
          unint64_t v21 = 0;
          do
          {
            v22 = [v8 objectAtIndexedSubscript:v21];
            v23 = (char **)&v14->_exclusionaryPolygons[v20];
            *v23 = CreatePolygonForPoints(v22);
            v23[1] = v24;

            ++v21;
            ++v20;
          }
          while (v21 < v14->_exclusionaryPolygonCount);
        }
      }
    }
    self = v14;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  inclusionaryPolygons = self->_inclusionaryPolygons;
  if (inclusionaryPolygons)
  {
    if (self->_inclusionaryPolygonCount)
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        free(self->_inclusionaryPolygons[v4].var0);
        ++v5;
        ++v4;
      }
      while (v5 < self->_inclusionaryPolygonCount);
      inclusionaryPolygons = self->_inclusionaryPolygons;
    }
    free(inclusionaryPolygons);
  }
  exclusionaryPolygons = self->_exclusionaryPolygons;
  if (exclusionaryPolygons)
  {
    if (self->_exclusionaryPolygonCount)
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      do
      {
        free(self->_exclusionaryPolygons[v7].var0);
        ++v8;
        ++v7;
      }
      while (v8 < self->_exclusionaryPolygonCount);
      exclusionaryPolygons = self->_exclusionaryPolygons;
    }
    free(exclusionaryPolygons);
  }
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupProductRegionDataComplexPolygon;
  [(PKPaymentSetupProductRegionDataComplexPolygon *)&v9 dealloc];
}

- (BOOL)containsPoint:(CGPoint)a3 inExclusionaryRegion:(BOOL *)a4
{
  double v6 = (a3.x + 180.0) * 10000.0 / 360.0;
  long double v7 = tan(a3.y * 3.14159265 / 180.0 * 0.5 + 0.785398163);
  double v8 = log(v7) * 10000.0 / -6.28318531 + 2500.0;
  unint64_t exclusionaryPolygonCount = self->_exclusionaryPolygonCount;
  if (exclusionaryPolygonCount)
  {
    p_var1 = &self->_exclusionaryPolygons->var1;
    while (!PolygonContainsNormalizedPoint(*(p_var1 - 1), *p_var1, v6, v8))
    {
      p_var1 += 2;
      if (!--exclusionaryPolygonCount) {
        goto LABEL_5;
      }
    }
    BOOL result = 0;
    *a4 = 1;
  }
  else
  {
LABEL_5:
    unint64_t inclusionaryPolygonCount = self->_inclusionaryPolygonCount;
    if (inclusionaryPolygonCount)
    {
      inclusionaryPolygons = self->_inclusionaryPolygons;
      if (PolygonContainsNormalizedPoint((uint64_t)inclusionaryPolygons->var0, inclusionaryPolygons->var1, v6, v8))
      {
        return 1;
      }
      else
      {
        v14 = &inclusionaryPolygons[1].var1;
        uint64_t v15 = 1;
        do
        {
          unint64_t v16 = v15;
          if (inclusionaryPolygonCount == v15) {
            break;
          }
          int v17 = PolygonContainsNormalizedPoint(*(v14 - 1), *v14, v6, v8);
          uint64_t v15 = v16 + 1;
          v14 += 2;
        }
        while (!v17);
        return v16 < inclusionaryPolygonCount;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (double)closestDistanceToPoint:(CGPoint)a3
{
  double y = a3.y;
  unint64_t inclusionaryPolygonCount = self->_inclusionaryPolygonCount;
  if (!inclusionaryPolygonCount) {
    return 1.79769313e308;
  }
  double x = a3.x;
  uint64_t v5 = 0;
  inclusionaryPolygons = self->_inclusionaryPolygons;
  double result = 1.79769313e308;
  do
  {
    double v8 = &inclusionaryPolygons[v5];
    unint64_t var1 = v8->var1;
    if (var1)
    {
      uint64_t v10 = (double *)((char *)v8->var0 + 40);
      do
      {
        double v35 = result;
        double v11 = *(v10 - 5);
        double v12 = *(v10 - 4);
        double v13 = *(v10 - 1);
        double v14 = *v10;
        double v30 = *v10;
        double v31 = v13;
        double v34 = HaversineDistanceBetweenPoints(y, x, v11, v12);
        double v32 = HaversineDistanceBetweenPoints(v11, v12, y, x);
        double v28 = BearingBetweenPoints(v11, v12, y, x) * 3.14159265 / 180.0;
        double v15 = BearingBetweenPoints(v11, v12, v13, v14);
        double v16 = x;
        double v17 = v15 * 3.14159265 / 180.0;
        __double2 v18 = __sincos_stret(v32 / 6371.0);
        long double v19 = sin(v28 - v17);
        double v33 = asin(v18.__sinval * v19) * 6371.0;
        double v20 = cos(v33 / 6371.0);
        long double v29 = acos(v18.__cosval / v20) * 6371.0;
        double x = v16;
        long double v21 = HaversineDistanceBetweenPoints(v31, v30, y, v16);
        long double v22 = cos(v21 / 6371.0);
        long double v23 = acos(v22 / v20) * 6371.0;
        long double v24 = HaversineDistanceBetweenPoints(v11, v12, v31, v30);
        double v25 = fmin(v34, fabs(v33));
        if (v29 + v23 <= v24) {
          double v26 = v25;
        }
        else {
          double v26 = v34;
        }
        double result = fmin(v26, v35);
        v10 += 8;
        --var1;
      }
      while (var1);
    }
    ++v5;
  }
  while (v5 != inclusionaryPolygonCount);
  return result;
}

@end