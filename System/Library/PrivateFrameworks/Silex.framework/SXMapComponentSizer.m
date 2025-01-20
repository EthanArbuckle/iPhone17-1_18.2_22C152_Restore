@interface SXMapComponentSizer
+ ($4137A935A6BBB85B3D0ECB651BA01BF7)regionForCoordinates:(SEL)a3;
+ ($4137A935A6BBB85B3D0ECB651BA01BF7)regionFromRegion:(SEL)a3 coordinates:(id *)a4;
+ ($D6E06D00CA255A0C0B2BA890DDD3F671)mapRectForRegion:(id *)a3;
+ (BOOL)isCenterSetOnRegion:(id *)a3;
+ (BOOL)isSpanSetOnRegion:(id *)a3;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
@end

@implementation SXMapComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  v4 = [(SXComponentSizer *)self layoutOptions];
  v5 = [v4 columnLayout];
  [v5 constrainedViewportSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = 0.5;
  if (v7 > v9) {
    double v10 = 0.75;
  }
  return v9 * v10;
}

+ ($4137A935A6BBB85B3D0ECB651BA01BF7)regionFromRegion:(SEL)a3 coordinates:(id *)a4
{
  double v9 = v8;
  double v10 = v7;
  double v11 = v6;
  double v12 = v5;
  v14 = a4;
  int v15 = objc_msgSend(a2, "isSpanSetOnRegion:", v12, v11, v10, v9);
  int v16 = objc_msgSend(a2, "isCenterSetOnRegion:", v12, v11, v10, v9);
  uint64_t v17 = [($4137A935A6BBB85B3D0ECB651BA01BF7 *)v14 count];
  if ((v15 | v16) == 1 && v17) {
    [a2 regionForCoordinates:v14];
  }

  return result;
}

+ (BOOL)isSpanSetOnRegion:(id *)a3
{
  return v4 == 0.0 && v3 == 0.0;
}

+ (BOOL)isCenterSetOnRegion:(id *)a3
{
  return v4 == 0.0 && v3 == 0.0;
}

+ ($4137A935A6BBB85B3D0ECB651BA01BF7)regionForCoordinates:(SEL)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a4;
  if ([v4 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      double v9 = 1.79769313e308;
      double v10 = -1.79769313e308;
      double v11 = -1.79769313e308;
      double v12 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "MKCoordinateValue", (void)v21);
          double v16 = fmin(v12, 1.79769313e308);
          if (v16 >= v15) {
            double v12 = v15;
          }
          else {
            double v12 = v16;
          }
          if (v11 >= -1.79769313e308) {
            double v17 = v11;
          }
          else {
            double v17 = -1.79769313e308;
          }
          if (v17 >= v15) {
            double v11 = v17;
          }
          else {
            double v11 = v15;
          }
          double v18 = fmin(v9, 1.79769313e308);
          if (v18 >= v14) {
            double v9 = v14;
          }
          else {
            double v9 = v18;
          }
          if (v10 >= -1.79769313e308) {
            double v19 = v10;
          }
          else {
            double v19 = -1.79769313e308;
          }
          if (v19 >= v14) {
            double v10 = v19;
          }
          else {
            double v10 = v14;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 1.79769313e308;
      double v10 = -1.79769313e308;
      double v11 = -1.79769313e308;
      double v12 = 1.79769313e308;
    }

    CLLocationCoordinate2DMake(v9 + (v10 - v9) * 0.5, v12 + (v11 - v12) * 0.5);
  }

  return result;
}

+ ($D6E06D00CA255A0C0B2BA890DDD3F671)mapRectForRegion:(id *)a3
{
  double v7 = v4;
  double v8 = v3;
  double v9 = v5 * 0.5;
  double v10 = v6 * 0.5;
  CLLocationCoordinate2D v19 = CLLocationCoordinate2DMake(v3 + v5 * 0.5, v4 - v6 * 0.5);
  MKMapPoint v11 = MKMapPointForCoordinate(v19);
  CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(v8 - v9, v7 + v10);
  MKMapPoint v12 = MKMapPointForCoordinate(v20);
  if (v11.x >= v12.x) {
    double x = v12.x;
  }
  else {
    double x = v11.x;
  }
  if (v11.y >= v12.y) {
    double y = v12.y;
  }
  else {
    double y = v11.y;
  }
  double v15 = -(v11.x - v12.x);
  if (v11.x - v12.x >= 0.0) {
    double v15 = v11.x - v12.x;
  }
  if (v11.y - v12.y >= 0.0) {
    double v16 = v11.y - v12.y;
  }
  else {
    double v16 = -(v11.y - v12.y);
  }
  double v17 = x;
  double v18 = y;
  result.var1.var1 = v16;
  result.var1.var0 = v15;
  result.var0.var1 = v18;
  result.var0.var0 = v17;
  return result;
}

@end