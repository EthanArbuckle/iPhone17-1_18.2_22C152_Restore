@interface GQHLine
+ (int)handleFloatingLine:(id)a3 state:(id)a4;
+ (int)handleInlineLine:(id)a3 state:(id)a4;
+ (int)handleLine:(id)a3 isFloating:(BOOL)a4 state:(id)a5;
@end

@implementation GQHLine

+ (int)handleFloatingLine:(id)a3 state:(id)a4
{
  return [a1 handleLine:a3 isFloating:1 state:a4];
}

+ (int)handleInlineLine:(id)a3 state:(id)a4
{
  return [a1 handleLine:a3 isFloating:0 state:a4];
}

+ (int)handleLine:(id)a3 isFloating:(BOOL)a4 state:(id)a5
{
  BOOL v6 = a4;
  id v8 = [a3 geometry];
  [v8 naturalSize];
  double v11 = v9;
  float64x2_t v12 = 0uLL;
  float64x2_t v13 = 0uLL;
  float64x2_t v14 = 0uLL;
  float64x2_t v15 = 0uLL;
  if (v8)
  {
    double v31 = v10;
    double v33 = v9;
    [v8 transform];
    float64x2_t v12 = 0uLL;
    double v10 = v31;
    double v11 = v33;
    float64x2_t v14 = 0u;
    float64x2_t v15 = 0u;
    float64x2_t v13 = 0u;
  }
  float64x2_t v16 = vaddq_f64(v13, vmlaq_f64(vmulq_f64(v15, v12), v12, v14));
  float64x2_t v32 = vaddq_f64(v13, vmlaq_n_f64(vmulq_n_f64(v15, v10), v14, v11));
  int8x16_t v34 = vbslq_s8((int8x16_t)vcgtq_f64(v32, v16), (int8x16_t)v16, (int8x16_t)v32);
  double v17 = sub_5051C(v16.f64[0], v16.f64[1], *(double *)v34.i64);
  double v19 = v18;
  double v20 = sub_5051C(v32.f64[0], v32.f64[1], *(double *)v34.i64);
  double v22 = v20;
  double v23 = v21;
  if (v17 >= v20) {
    double v24 = v17;
  }
  else {
    double v24 = v20;
  }
  if (v19 >= v21) {
    double v25 = v19;
  }
  else {
    double v25 = v21;
  }
  v26 = objc_alloc_init(GQDAffineGeometry);
  -[GQDAffineGeometry setNaturalSize:](v26, "setNaturalSize:", v24, v25);
  -[GQDAffineGeometry setSize:](v26, "setSize:", v24, v25);
  [(GQDAffineGeometry *)v26 setPosition:*(_OWORD *)&v34];
  xmlStrPrintf(byte_A42B8, 100, "M %f %f L %f %f", v17, v19, v22, v23);
  v27 = [[GQDBezierPath alloc] initWithPathString:byte_A42B8];
  v28 = [[GQDShape alloc] initWithGraphic:a3 path:v27 geometry:v26];

  int v29 = +[GQHShape handleShape:v28 isFloating:v6 state:a5];
  return v29;
}

@end