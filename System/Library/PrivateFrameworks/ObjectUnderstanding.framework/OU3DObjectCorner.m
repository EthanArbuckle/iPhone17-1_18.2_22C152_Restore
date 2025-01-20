@interface OU3DObjectCorner
- (BOOL)isCompleted;
- (NSArray)coordinate;
- (NSArray)inView;
- (NSArray)timestamp;
- (OU3DObjectCorner)init;
- (void)addCornerStatus:(id)a3 inView:(id)a4 timestamp:;
- (void)setCoordinate:(id)a3;
- (void)setInView:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)updateIsCompleted;
@end

@implementation OU3DObjectCorner

- (OU3DObjectCorner)init
{
  v8.receiver = self;
  v8.super_class = (Class)OU3DObjectCorner;
  v2 = [(OU3DObjectCorner *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    coordinate = v2->_coordinate;
    v2->_coordinate = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    inView = v2->_inView;
    v2->_inView = (NSMutableArray *)v5;
  }
  *(_OWORD *)&v2->kCornerTimerThreshold = xmmword_237CB48B0;
  v2->isCompleted = 0;
  return v2;
}

- (void)updateIsCompleted
{
  if (self->isCompleted) {
    return;
  }
  unint64_t v3 = [(NSMutableArray *)self->_coordinate count];
  if (v3 <= 1)
  {
    self->isCompleted = 0;
    return;
  }
  unint64_t v4 = v3;
  id v25 = [(NSMutableArray *)self->_timer objectAtIndexedSubscript:v3 - 1];
  [v25 doubleValue];
  double v6 = v5;
  v7 = [(NSMutableArray *)self->_timer objectAtIndexedSubscript:0];
  [v7 doubleValue];
  double v9 = v6 - v8;
  double kCornerTimerThreshold = self->kCornerTimerThreshold;

  if (v9 > kCornerTimerThreshold)
  {
    self->isCompleted = 1;
    return;
  }
  id v26 = (id)objc_opt_new();
  uint64_t v11 = 0;
  uint64_t v12 = MEMORY[0x263EFFA88];
  do
  {
    v13 = [(NSMutableArray *)self->_inView objectAtIndexedSubscript:v11];
    int v14 = [v13 isEqual:v12];

    if (v14)
    {
      v15 = [(NSMutableArray *)self->_coordinate objectAtIndexedSubscript:v11];
      [v26 addObject:v15];
    }
    ++v11;
  }
  while (v4 != v11);
  unint64_t v16 = [v26 count];
  unint64_t v17 = v16 - 1;
  if (v16 > 1)
  {
    v28.i32[2] = 0;
    v28.i64[0] = 0;
    v27.i32[2] = 0;
    v27.i64[0] = 0;
    v18 = [v26 objectAtIndexedSubscript:v17];
    BOOL v19 = float3FromNSArray(v18, &v28);

    if (v19
      && ([v26 objectAtIndexedSubscript:v17],
          v20 = objc_claimAutoreleasedReturnValue(),
          BOOL v21 = float3FromNSArray(v20, &v27),
          v20,
          v21))
    {
      float32x4_t v22 = vsubq_f32(v28, v27);
      float32x4_t v23 = vmulq_f32(v22, v22);
      if (self->kCornerLocationThreshold <= sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).f32[0]))goto LABEL_19; {
      BOOL v24 = 1;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
    self->isCompleted = v24;
    goto LABEL_19;
  }
  self->isCompleted = 0;
LABEL_19:
}

- (void)addCornerStatus:(id)a3 inView:(id)a4 timestamp:
{
  long long v14 = v4;
  v15[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  double v9 = [NSNumber numberWithFloat:*(double *)&v14];
  v15[0] = v9;
  HIDWORD(v10) = DWORD1(v14);
  LODWORD(v10) = DWORD1(v14);
  uint64_t v11 = [NSNumber numberWithFloat:v10];
  v15[1] = v11;
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v14), DWORD2(v14))));
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  [(NSMutableArray *)self->_coordinate addObject:v13];
  [(NSMutableArray *)self->_inView addObject:v7];
  [(NSMutableArray *)self->_timer addObject:v8];
  [(OU3DObjectCorner *)self updateIsCompleted];
}

- (BOOL)isCompleted
{
  return self->isCompleted;
}

- (NSArray)coordinate
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCoordinate:(id)a3
{
}

- (NSArray)inView
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInView:(id)a3
{
}

- (NSArray)timestamp
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_inView, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end