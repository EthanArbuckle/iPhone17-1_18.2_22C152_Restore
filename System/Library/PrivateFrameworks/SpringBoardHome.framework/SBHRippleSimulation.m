@interface SBHRippleSimulation
- (BOOL)isSettled;
- (CATransform3D)transformForGridCoordinate:(SEL)a3;
- (CGPoint)convertGridToRippleCoordinate:(CGPoint)a3;
- (SBHRippleSimulation)initWithRows:(unint64_t)a3 columns:(unint64_t)a4 resolution:(unint64_t)a5 style:(unint64_t)a6;
- (double)zPositionForGridCoordinate:(CGPoint)a3;
- (void)clear;
- (void)createRippleAtGridCoordinate:(CGPoint)a3 strength:(double)a4;
- (void)dealloc;
- (void)setSettled:(BOOL)a3;
- (void)step:(double)a3;
@end

@implementation SBHRippleSimulation

- (SBHRippleSimulation)initWithRows:(unint64_t)a3 columns:(unint64_t)a4 resolution:(unint64_t)a5 style:(unint64_t)a6
{
  v20.receiver = self;
  v20.super_class = (Class)SBHRippleSimulation;
  v10 = [(SBHRippleSimulation *)&v20 init];
  v11 = (SBHRippleSimulation *)v10;
  if (v10)
  {
    v10[80] = 1;
    *((void *)v10 + 3) = a5;
    *((void *)v10 + 4) = a6;
    int32x2_t v12 = vdup_n_s32(a6 == 1);
    v13.i64[0] = v12.u32[0];
    v13.i64[1] = v12.u32[1];
    *(int8x16_t *)(v10 + 40) = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v13, 0x3FuLL)), (int8x16_t)xmmword_1D81E5760, (int8x16_t)xmmword_1D81E5750);
    objc_msgSend(v10, "convertGridToRippleCoordinate:", (double)a4, (double)a3);
    double rippleTouchRadius = v11->_rippleTouchRadius;
    unint64_t v16 = (unint64_t)(rippleTouchRadius + ceil(v14) + 1.0);
    double v18 = rippleTouchRadius + ceil(v17) + 1.0;
    v11->_rippleWidth = v16;
    v11->_rippleHeight = (unint64_t)v18;
    v11->_positionBuffer = (double *)malloc_type_calloc(v16 * (unint64_t)v18, 8uLL, 0x100004000313F17uLL);
    v11->_velocityBuffer = (double *)malloc_type_calloc(v11->_rippleHeight * v11->_rippleWidth, 8uLL, 0x100004000313F17uLL);
  }
  return v11;
}

- (void)dealloc
{
  free(self->_positionBuffer);
  free(self->_velocityBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SBHRippleSimulation;
  [(SBHRippleSimulation *)&v3 dealloc];
}

- (void)clear
{
  unint64_t rippleWidth = self->_rippleWidth;
  if (rippleWidth)
  {
    uint64_t v3 = 0;
    unint64_t rippleHeight = self->_rippleHeight;
    do
    {
      if (rippleHeight)
      {
        positionBuffer = self->_positionBuffer;
        velocityBuffer = self->_velocityBuffer;
        int v7 = v3;
        unint64_t v8 = rippleHeight;
        do
        {
          int v9 = v7 & ~(v7 >> 31);
          if ((int)rippleHeight * (int)rippleWidth - 1 < v9) {
            int v9 = rippleHeight * rippleWidth - 1;
          }
          velocityBuffer[v9] = 0.0;
          positionBuffer[v9] = 0.0;
          v7 += rippleWidth;
          --v8;
        }
        while (v8);
      }
      ++v3;
    }
    while (v3 != rippleWidth);
  }
}

- (CGPoint)convertGridToRippleCoordinate:(CGPoint)a3
{
  double rippleResolution = (double)(uint64_t)self->_rippleResolution;
  CGFloat v4 = (a3.x + -1.0) * rippleResolution;
  CGFloat v5 = (a3.y + -1.0) * rippleResolution;
  double v6 = ceil(self->_rippleTouchRadius);
  double v7 = v4 + v6 + 0.5;
  double v8 = v5 + v6 + 0.5;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)createRippleAtGridCoordinate:(CGPoint)a3 strength:(double)a4
{
  self->_double rippleTouchHeight = *(double *)&SBHRippleDefaultTouchHeight * a4;
  -[SBHRippleSimulation convertGridToRippleCoordinate:](self, "convertGridToRippleCoordinate:", a3.x, a3.y);
  double v6 = v5;
  double v8 = v7;
  self->_settled = 0;
  [(SBHRippleSimulation *)self clear];
  double rippleTouchRadius = self->_rippleTouchRadius;
  uint64_t v10 = (uint64_t)(v6 - rippleTouchRadius + 1.0);
  int64_t v11 = vcvtpd_s64_f64(v6 + rippleTouchRadius + 1.0);
  if (v10 < v11)
  {
    double rippleTouchHeight = self->_rippleTouchHeight;
    uint64_t v13 = vcvtpd_s64_f64(v8 + rippleTouchRadius + 1.0);
    do
    {
      if ((uint64_t)(v8 - rippleTouchRadius + 1.0) < v13)
      {
        uint64_t v14 = (uint64_t)(v8 - rippleTouchRadius + 1.0);
        do
        {
          double v15 = ((double)v10 - v6) * ((double)v10 - v6) + ((double)v14 - v8) * ((double)v14 - v8);
          double v16 = self->_rippleTouchRadius;
          if (v15 < v16 * v16)
          {
            double v17 = sqrt(v15);
            double v18 = fmin(fmax(1.0 - v17 / v16, 0.0), 1.0);
            double v19 = rippleTouchHeight * (v18 * v18 * (v18 * -2.0 + 3.0));
            double v20 = v17 / (v16 + 1.0) * (v17 / (v16 + 1.0));
            if (v20 <= 1.0) {
              double v21 = 1.0 - v20;
            }
            else {
              double v21 = 0.0;
            }
            double v22 = v19 * v21;
            int rippleWidth = self->_rippleWidth;
            int v24 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
            int v25 = (v10 + rippleWidth * v14) & ~(((int)v10 + rippleWidth * (int)v14) >> 31);
            if (v24 < v25) {
              int v25 = v24;
            }
            self->_positionBuffer[v25] = v22;
          }
          ++v14;
        }
        while (v13 != v14);
      }
      ++v10;
    }
    while (v10 != v11);
  }
}

- (void)step:(double)a3
{
  unint64_t rippleHeight = self->_rippleHeight;
  int64_t v5 = self->_rippleWidth - 1;
  double v6 = a3 * 60.0 * self->_rippleTimeStep;
  UIAnimationDragCoefficient();
  double v8 = v6 / v7;
  float v9 = v8;
  float v10 = powf(0.72, v9);
  if (v5 < 2)
  {
    char v35 = 1;
LABEL_29:
    if (v35) {
      self->_settled = 1;
    }
    return;
  }
  uint64_t v11 = rippleHeight - 1;
  double v12 = v10;
  unint64_t v13 = rippleHeight - 2;
  char v14 = 1;
  uint64_t v15 = 1;
  do
  {
    if (v11 <= 1)
    {
      uint64_t v21 = v15 + 1;
    }
    else
    {
      int v16 = 0;
      int rippleWidth = self->_rippleWidth;
      int v18 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
      positionBuffer = self->_positionBuffer;
      velocityBuffer = self->_velocityBuffer;
      uint64_t v21 = v15 + 1;
      unint64_t v22 = v13;
      do
      {
        int v23 = (v15 + rippleWidth + v16) & ~(((int)v15 + rippleWidth + v16) >> 31);
        if (v18 < v23) {
          int v23 = v18;
        }
        int v24 = (v15 + rippleWidth - 1 + v16) & ~(((int)v15 + rippleWidth - 1 + v16) >> 31);
        if (v18 < v24) {
          int v24 = v18;
        }
        int v25 = (v15 + 1 + rippleWidth + v16) & ~(((int)v15 + 1 + rippleWidth + v16) >> 31);
        if (v18 < v25) {
          int v25 = v18;
        }
        double v26 = velocityBuffer[v24];
        int v27 = (v15 + 2 * rippleWidth + v16) & ~(((int)v15 + 2 * rippleWidth + v16) >> 31);
        double v28 = v26 + velocityBuffer[v25];
        if (v18 < v27) {
          int v27 = v18;
        }
        double v29 = velocityBuffer[v27];
        int v30 = (v15 + v16) & ~(((int)v15 + v16) >> 31);
        double v31 = v28 + v29;
        if (v18 < v30) {
          int v30 = v18;
        }
        double v32 = (positionBuffer[v23] + v8 * -(velocityBuffer[v23] - (v31 + velocityBuffer[v30]) * 0.25)) * v12;
        positionBuffer[v23] = v32;
        v14 &= fabs(v32) <= 0.05;
        v16 += rippleWidth;
        --v22;
      }
      while (v22);
    }
    uint64_t v15 = v21;
  }
  while (v21 != v5);
  int v33 = 1;
  uint64_t v34 = 1;
  char v35 = 1;
  do
  {
    if (v11 >= 2)
    {
      int v36 = self->_rippleWidth;
      int v37 = LODWORD(self->_rippleHeight) * v36 - 1;
      v38 = self->_positionBuffer;
      v39 = self->_velocityBuffer;
      int v40 = v33 + v36;
      unint64_t v41 = v13;
      do
      {
        int v42 = v40 & ~(v40 >> 31);
        if (v37 < v42) {
          int v42 = v37;
        }
        double v43 = v39[v42] + v8 * v38[v42];
        v39[v42] = v43;
        v35 &= fabs(v43) <= dbl_1D81E5770[self->_rippleStyle == 1];
        v40 += v36;
        --v41;
      }
      while (v41);
    }
    ++v34;
    ++v33;
  }
  while (v34 != v5);
  if (v14) {
    goto LABEL_29;
  }
}

- (double)zPositionForGridCoordinate:(CGPoint)a3
{
  -[SBHRippleSimulation convertGridToRippleCoordinate:](self, "convertGridToRippleCoordinate:", a3.x, a3.y);
  unint64_t rippleWidth = self->_rippleWidth;
  int v7 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  double v8 = (double)(rippleWidth * (int)v5);
  positionBuffer = self->_positionBuffer;
  int v10 = (int)(v4 + v8) & ~((int)(v4 + v8) >> 31);
  if (v7 < v10) {
    int v10 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v11 = positionBuffer[v10];
  double v12 = v4 + 1.0;
  int v13 = (int)(v4 + 1.0 + v8) & ~((int)(v4 + 1.0 + v8) >> 31);
  if (v7 < v13) {
    int v13 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v14 = positionBuffer[v13];
  double v15 = (double)(rippleWidth * (int)(v5 + 1.0));
  int v16 = (int)(v4 + v15) & ~((int)(v4 + v15) >> 31);
  if (v7 < v16) {
    int v16 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v17 = positionBuffer[v16];
  int v18 = (int)(v12 + v15) & ~((int)(v12 + v15) >> 31);
  if (v7 < v18) {
    int v18 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v19 = positionBuffer[v18];
  double v20 = v4 + -1.0;
  int v21 = (int)(v4 + -1.0 + v8) & ~((int)(v4 + -1.0 + v8) >> 31);
  if (v7 < v21) {
    int v21 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v22 = positionBuffer[v21];
  int v23 = (int)(v20 + v15) & ~((int)(v20 + v15) >> 31);
  if (v7 < v23) {
    int v23 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v24 = positionBuffer[v23];
  double v25 = v4 + 2.0;
  int v26 = (int)(v4 + 2.0 + v8) & ~((int)(v4 + 2.0 + v8) >> 31);
  if (v7 < v26) {
    int v26 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v27 = positionBuffer[v26];
  int v28 = (int)(v25 + v15) & ~((int)(v25 + v15) >> 31);
  if (v7 < v28) {
    int v28 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v29 = positionBuffer[v28];
  double v30 = (double)(rippleWidth * (int)(v5 + -1.0));
  int v31 = (int)(v4 + v30) & ~((int)(v4 + v30) >> 31);
  if (v7 < v31) {
    int v31 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v32 = positionBuffer[v31];
  int v33 = (int)(v12 + v30) & ~((int)(v12 + v30) >> 31);
  if (v7 < v33) {
    int v33 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v34 = (double)(rippleWidth * (int)(v5 + 2.0));
  int v35 = (int)(v4 + v34) & ~((int)(v4 + v34) >> 31);
  if (v7 < v35) {
    int v35 = v7;
  }
  double v36 = positionBuffer[v35];
  int v37 = (int)(v12 + v34) & ~((int)(v12 + v34) >> 31);
  if (v7 < v37) {
    int v37 = v7;
  }
  double v38 = positionBuffer[v37];
  int v39 = (int)(v20 + v30) & ~((int)(v20 + v30) >> 31);
  if (v7 < v39) {
    int v39 = v7;
  }
  double v40 = positionBuffer[v39];
  int v41 = (int)(v25 + v30) & ~((int)(v25 + v30) >> 31);
  if (v7 < v41) {
    int v41 = v7;
  }
  double v42 = positionBuffer[v41];
  int v43 = (int)(v20 + v34) & ~((int)(v20 + v34) >> 31);
  if (v7 < v43) {
    int v43 = v7;
  }
  if (v7 >= ((int)(v25 + v34) & ~((int)(v25 + v34) >> 31))) {
    int v7 = (int)(v25 + v34) & ~((int)(v25 + v34) >> 31);
  }
  return *(double *)&SBHRippleHeight
       * (((v22 + v24 + v27 + v29 + v32 + positionBuffer[v33] + v36 + v38) * 3.0
         + (v11 + v14 + v17 + v19) * 9.0
         + v40
         + v42
         + positionBuffer[v43]
         + positionBuffer[v7])
        * 0.015625);
}

- (CATransform3D)transformForGridCoordinate:(SEL)a3
{
  -[SBHRippleSimulation convertGridToRippleCoordinate:](self, "convertGridToRippleCoordinate:", a4.x, a4.y);
  positionBuffer = self->_positionBuffer;
  unint64_t rippleWidth = self->_rippleWidth;
  int v10 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  double v11 = (double)(rippleWidth * (int)v7);
  double v12 = v6 + 1.0;
  int v13 = (int)(v6 + 1.0 + v11) & ~((int)(v6 + 1.0 + v11) >> 31);
  if (v10 < v13) {
    int v13 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v14 = positionBuffer[v13];
  int v15 = (int)(v6 + v11) & ~((int)(v6 + v11) >> 31);
  if (v10 < v15) {
    int v15 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v16 = positionBuffer[v15];
  double v17 = (double)(rippleWidth * (int)(v7 + 1.0));
  int v18 = (int)(v12 + v17) & ~((int)(v12 + v17) >> 31);
  if (v10 < v18) {
    int v18 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v19 = positionBuffer[v18];
  int v20 = (int)(v6 + v17) & ~((int)(v6 + v17) >> 31);
  if (v10 < v20) {
    int v20 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v21 = positionBuffer[v20];
  int v22 = (int)(v6 + 2.0 + v11) & ~((int)(v6 + 2.0 + v11) >> 31);
  if (v10 < v22) {
    int v22 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v23 = positionBuffer[v22];
  int v24 = (int)(v6 + 2.0 + v17) & ~((int)(v6 + 2.0 + v17) >> 31);
  if (v10 < v24) {
    int v24 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v25 = positionBuffer[v24];
  int v26 = (int)(v6 + -1.0 + v11) & ~((int)(v6 + -1.0 + v11) >> 31);
  if (v10 < v26) {
    int v26 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v27 = positionBuffer[v26];
  int v28 = (int)(v6 + -1.0 + v17) & ~((int)(v6 + -1.0 + v17) >> 31);
  if (v10 < v28) {
    int v28 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v29 = positionBuffer[v28];
  double v30 = (double)(rippleWidth * (int)(v7 + 2.0));
  int v31 = (int)(v6 + v30) & ~((int)(v6 + v30) >> 31);
  if (v10 < v31) {
    int v31 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v32 = positionBuffer[v31];
  int v33 = (int)(v12 + v30) & ~((int)(v12 + v30) >> 31);
  if (v10 < v33) {
    int v33 = LODWORD(self->_rippleHeight) * rippleWidth - 1;
  }
  double v34 = (double)(rippleWidth * (int)(v7 + -1.0));
  int v35 = (int)(v6 + v34) & ~((int)(v6 + v34) >> 31);
  if (v10 < v35) {
    int v35 = v10;
  }
  if (v10 >= ((int)(v12 + v34) & ~((int)(v12 + v34) >> 31))) {
    int v10 = (int)(v12 + v34) & ~((int)(v12 + v34) >> 31);
  }
  double v36 = ((positionBuffer[v33] - v19) * 0.5
       + (v32 - v21) * 0.5
       + ((v19 - v14) * 0.5 + (v21 - v16) * 0.5) * 2.0
       + (v14 - positionBuffer[v10]) * 0.5
       + (v16 - positionBuffer[v35]) * 0.5)
      * 0.25;
  float v37 = ((v25 - v19) * 0.5
       + (v23 - v14) * 0.5
       + ((v19 - v21) * 0.5 + (v14 - v16) * 0.5) * 2.0
       + (v21 - v29) * 0.5
       + (v16 - v27) * 0.5)
      * 0.25;
  CGFloat v38 = (float)-atanf(v37);
  float v39 = v36;
  CGFloat v40 = atanf(v39);
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  CATransform3DMakeRotation(retstr, v38, 0.0, 1.0, 0.0);
  long long v41 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v50.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v50.m33 = v41;
  long long v42 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v50.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v50.m43 = v42;
  long long v43 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v50.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v50.m13 = v43;
  long long v44 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v50.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v50.m23 = v44;
  CGPoint result = CATransform3DRotate(&v51, &v50, v40, 1.0, 0.0, 0.0);
  long long v46 = *(_OWORD *)&v51.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v51.m31;
  *(_OWORD *)&retstr->m33 = v46;
  long long v47 = *(_OWORD *)&v51.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v51.m41;
  *(_OWORD *)&retstr->m43 = v47;
  long long v48 = *(_OWORD *)&v51.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v51.m11;
  *(_OWORD *)&retstr->m13 = v48;
  long long v49 = *(_OWORD *)&v51.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v51.m21;
  *(_OWORD *)&retstr->m23 = v49;
  return result;
}

- (BOOL)isSettled
{
  return self->_settled;
}

- (void)setSettled:(BOOL)a3
{
  self->_settled = a3;
}

@end