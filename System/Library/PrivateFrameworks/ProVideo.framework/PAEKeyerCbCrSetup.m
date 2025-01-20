@interface PAEKeyerCbCrSetup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualTo:(id)a3;
- (PAEKeyerCbCrSetup)init;
- (PAEKeyerCbCrSetup)initWithCoder:(id)a3;
- (Vec2f)polarToCartesian:(Vec2f)a3;
- (id)interpolateBetween:(id)a3 withWeight:(float)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getKeyer2DSatSpline;
- (void)getKeyer2DSoftPie;
- (void)getKeyer2DTolPie;
- (void)interpPieWithWeight:(float)a3 currentDirectionCorrection:(float)a4 nextDirectionCorrection:(float)a5 interpolatedCenter:(Vec2f)a6 currentCenter:(Vec2f)a7 currentPolar:(const Vec2f *)a8 nextCenter:(Vec2f)a9 nextPolar:(const Vec2f *)a10 interpolationType:(int)a11 interpolatedPie:(void *)a12;
- (void)interpVec2f:(float)a3 left:(Vec2f)a4 right:(Vec2f)a5 interpolated:(Vec2f *)a6;
- (void)offsetPie:(Vec2f *)a3 offsetDegrees:(float)a4;
- (void)pieToPolarForPie:(void *)a3 polar:(Vec2f *)a4;
- (void)pieToPolarForPie:(void *)a3 softPie:(void *)a4 tolPolar:(Vec2f *)a5 softPolar:(Vec2f *)a6;
- (void)setSoftPieX:(id)a3 indice:(int)a4;
- (void)setSoftPieY:(id)a3 indice:(int)a4;
- (void)setTolPieX:(id)a3 indice:(int)a4;
- (void)setTolPieY:(id)a3 indice:(int)a4;
- (void)toPolar:(const Vec2f *)a3 polar:(Vec2f *)a4;
@end

@implementation PAEKeyerCbCrSetup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEKeyerCbCrSetup)init
{
  self->_initialized = 1;
  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerCbCrSetup;
  if ([(PAEKeyerCbCrSetup *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (PAEKeyerCbCrSetup)initWithCoder:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  self->_initialized = 1;
  v9.receiver = self;
  v9.super_class = (Class)PAEKeyerCbCrSetup;
  v4 = [(PAEKeyerCbCrSetup *)&v9 init];
  if (v4)
  {
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieX_CORNER_L"], 0);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieX_CORNER_M"], 1);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieX_CORNER_R"], 2);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieX_CORNER_LL"], 3);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieX_CORNER_RR"], 4);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieY_CORNER_L"], 0);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieY_CORNER_M"], 1);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieY_CORNER_R"], 2);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieY_CORNER_LL"], 3);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TolPieY_CORNER_RR"], 4);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieX_CORNER_L"], 0);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieX_CORNER_M"], 1);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieX_CORNER_R"], 2);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieX_CORNER_LL"], 3);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieX_CORNER_RR"], 4);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieY_CORNER_L"], 0);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieY_CORNER_M"], 1);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieY_CORNER_R"], 2);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieY_CORNER_LL"], 3);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"SoftPieY_CORNER_RR"], 4);
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v4->_splineVertex = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), @"SplineVertex");
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  keyer2DSatSpline = (void **)self->_keyer2DSatSpline;
  if (keyer2DSatSpline)
  {
    v4 = *keyer2DSatSpline;
    if (*keyer2DSatSpline)
    {
      keyer2DSatSpline[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1BA9BFBA0](keyer2DSatSpline, 0x1020C407A026B33);
  }
  keyer2DTolPie = self->_keyer2DTolPie;
  if (keyer2DTolPie) {
    (*(void (**)(void *, SEL))(*(void *)keyer2DTolPie + 8))(keyer2DTolPie, a2);
  }
  keyer2DSoftPie = self->_keyer2DSoftPie;
  if (keyer2DSoftPie) {
    (*(void (**)(void *, SEL))(*(void *)keyer2DSoftPie + 8))(keyer2DSoftPie, a2);
  }
  uint64_t v7 = 0x1FFFFFFFFFFFFFFBLL;
  do
  {

    ++v7;
  }
  while (v7 * 8);

  v8.receiver = self;
  v8.super_class = (Class)PAEKeyerCbCrSetup;
  [(PAEKeyerCbCrSetup *)&v8 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = 0;
  for (uint64_t i = 0; i != 5; ++i)
  {
    LODWORD(v3) = *(_DWORD *)(*((void *)self->_keyer2DTolPie + 6) + v6);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](self, "setTolPieX:indice:", [NSNumber numberWithFloat:v3], i);
    LODWORD(v8) = *(_DWORD *)(*((void *)self->_keyer2DTolPie + 6) + v6 + 4);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](self, "setTolPieY:indice:", [NSNumber numberWithFloat:v8], i);
    LODWORD(v9) = *(_DWORD *)(*((void *)self->_keyer2DSoftPie + 6) + v6);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](self, "setSoftPieX:indice:", [NSNumber numberWithFloat:v9], i);
    LODWORD(v10) = *(_DWORD *)(*((void *)self->_keyer2DSoftPie + 6) + v6 + 4);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](self, "setSoftPieY:indice:", [NSNumber numberWithFloat:v10], i);
    v6 += 8;
  }

  self->_splineVertex = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((int)((*((void *)self->_keyer2DSatSpline + 1) - *(void *)self->_keyer2DSatSpline) >> 5) >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    do
    {
      v13 = objc_alloc_init(PAEKeyerOMVertex);
      v14 = (_DWORD *)(*(void *)self->_keyer2DSatSpline + v11);
      LODWORD(v15) = *v14;
      -[PAEKeyerOMVertex setLx:](v13, "setLx:", [NSNumber numberWithFloat:v15]);
      LODWORD(v16) = v14[2];
      -[PAEKeyerOMVertex setMx:](v13, "setMx:", [NSNumber numberWithFloat:v16]);
      LODWORD(v17) = v14[4];
      -[PAEKeyerOMVertex setRx:](v13, "setRx:", [NSNumber numberWithFloat:v17]);
      LODWORD(v18) = v14[6];
      -[PAEKeyerOMVertex setBx:](v13, "setBx:", [NSNumber numberWithFloat:v18]);
      LODWORD(v19) = v14[1];
      -[PAEKeyerOMVertex setLy:](v13, "setLy:", [NSNumber numberWithFloat:v19]);
      LODWORD(v20) = v14[3];
      -[PAEKeyerOMVertex setMy:](v13, "setMy:", [NSNumber numberWithFloat:v20]);
      LODWORD(v21) = v14[5];
      -[PAEKeyerOMVertex setRy:](v13, "setRy:", [NSNumber numberWithFloat:v21]);
      LODWORD(v22) = v14[7];
      -[PAEKeyerOMVertex setBy:](v13, "setBy:", [NSNumber numberWithFloat:v22]);
      [(NSMutableArray *)self->_splineVertex addObject:v13];

      ++v12;
      v11 += 32;
    }
    while (v12 < (int)((*((void *)self->_keyer2DSatSpline + 1) - *(void *)self->_keyer2DSatSpline) >> 5));
  }
  [a3 encodeObject:self->_tolPieX[0] forKey:@"TolPieX_CORNER_L"];
  [a3 encodeObject:self->_tolPieX[1] forKey:@"TolPieX_CORNER_M"];
  [a3 encodeObject:self->_tolPieX[2] forKey:@"TolPieX_CORNER_R"];
  [a3 encodeObject:self->_tolPieX[3] forKey:@"TolPieX_CORNER_LL"];
  [a3 encodeObject:self->_tolPieX[4] forKey:@"TolPieX_CORNER_RR"];
  [a3 encodeObject:self->_tolPieY[0] forKey:@"TolPieY_CORNER_L"];
  [a3 encodeObject:self->_tolPieY[1] forKey:@"TolPieY_CORNER_M"];
  [a3 encodeObject:self->_tolPieY[2] forKey:@"TolPieY_CORNER_R"];
  [a3 encodeObject:self->_tolPieY[3] forKey:@"TolPieY_CORNER_LL"];
  [a3 encodeObject:self->_tolPieY[4] forKey:@"TolPieY_CORNER_RR"];
  [a3 encodeObject:self->_softPieX[0] forKey:@"SoftPieX_CORNER_L"];
  [a3 encodeObject:self->_softPieX[1] forKey:@"SoftPieX_CORNER_M"];
  [a3 encodeObject:self->_softPieX[2] forKey:@"SoftPieX_CORNER_R"];
  [a3 encodeObject:self->_softPieX[3] forKey:@"SoftPieX_CORNER_LL"];
  [a3 encodeObject:self->_softPieX[4] forKey:@"SoftPieX_CORNER_RR"];
  [a3 encodeObject:self->_softPieY[0] forKey:@"SoftPieY_CORNER_L"];
  [a3 encodeObject:self->_softPieY[1] forKey:@"SoftPieY_CORNER_M"];
  [a3 encodeObject:self->_softPieY[2] forKey:@"SoftPieY_CORNER_R"];
  [a3 encodeObject:self->_softPieY[3] forKey:@"SoftPieY_CORNER_LL"];
  [a3 encodeObject:self->_softPieY[4] forKey:@"SoftPieY_CORNER_RR"];
  splineVertex = self->_splineVertex;

  [a3 encodeObject:splineVertex forKey:@"SplineVertex"];
}

- (void)setTolPieX:(id)a3 indice:(int)a4
{
  id v7 = a3;
  double v8 = (id *)(&self->super.isa + a4);

  v8[1] = a3;
}

- (void)setSoftPieX:(id)a3 indice:(int)a4
{
  id v7 = a3;
  double v8 = (id *)(&self->super.isa + a4);

  v8[11] = a3;
}

- (void)setTolPieY:(id)a3 indice:(int)a4
{
  id v7 = a3;
  double v8 = (id *)(&self->super.isa + a4);

  v8[6] = a3;
}

- (void)setSoftPieY:(id)a3 indice:(int)a4
{
  id v7 = a3;
  double v8 = (id *)(&self->super.isa + a4);

  v8[16] = a3;
}

- (void)getKeyer2DSatSpline
{
  return self->_keyer2DSatSpline;
}

- (void)getKeyer2DTolPie
{
  return self->_keyer2DTolPie;
}

- (void)getKeyer2DSoftPie
{
  return self->_keyer2DSoftPie;
}

- (Vec2f)polarToCartesian:(Vec2f)a3
{
  v5 = v4;
  float v6 = *v3;
  __float2 v7 = __sincosf_stret(v3[1]);
  float v8 = v6 * v7.__cosval;
  float v9 = v6 * v7.__sinval;
  float *v5 = v6 * v7.__cosval;
  v5[1] = v6 * v7.__sinval;
  result.var0[1] = v8;
  result.var0[0] = v9;
  return result;
}

- (void)interpVec2f:(float)a3 left:(Vec2f)a4 right:(Vec2f)a5 interpolated:(Vec2f *)a6
{
  *__float2 v7 = vadd_f32((float32x2_t)*a6, vmul_n_f32(vsub_f32(*v6, (float32x2_t)*a6), a3));
}

- (void)toPolar:(const Vec2f *)a3 polar:(Vec2f *)a4
{
  a4->var0[0] = sqrtf((float)(a3->var0[0] * a3->var0[0]) + (float)(a3->var0[1] * a3->var0[1]));
  a4->var0[1] = atan2f(a3->var0[1], a3->var0[0]);
}

- (void)interpPieWithWeight:(float)a3 currentDirectionCorrection:(float)a4 nextDirectionCorrection:(float)a5 interpolatedCenter:(Vec2f)a6 currentCenter:(Vec2f)a7 currentPolar:(const Vec2f *)a8 nextCenter:(Vec2f)a9 nextPolar:(const Vec2f *)a10 interpolationType:(int)a11 interpolatedPie:(void *)a12
{
  int v14 = v13;
  uint64_t v15 = v12;
  uint64_t v17 = *(void *)&a11;
  uint64_t v24 = 0;
  BOOL v25 = a3 <= 0.5;
  BOOL v26 = a3 > 0.5;
  if (v13 != 1) {
    BOOL v26 = 0;
  }
  float v27 = a3 + a3;
  float v54 = (float)(a3 + -0.5) + (float)(a3 + -0.5);
  if (v13 != 2) {
    BOOL v25 = 0;
  }
  HIDWORD(v28) = 1075388923;
  double v53 = 6.28318531;
  unsigned int v29 = -3;
  char v55 = !v26 && !v25;
  do
  {
    if (v24 == 8)
    {
      int v30 = *(_DWORD *)(v15 + 8);
      float v31 = *(float *)(v15 + 12);
      if (v14 == 2)
      {
        int v32 = 0;
        float v33 = *(float *)(v15 + 12);
        *(float *)&double v28 = v54;
        if (a3 <= 0.5)
        {
          float v50 = a8->var0[1];
          v65[0] = 0;
          *(float *)&v65[1] = v50;
          if (self)
          {
            v35 = v65;
            goto LABEL_37;
          }
LABEL_48:
          double v28 = 0.0;
          goto LABEL_49;
        }
      }
      else
      {
        int v32 = *(_DWORD *)(v17 + 8);
        float v33 = *(float *)(v17 + 12);
        if (v14 == 1)
        {
          int v30 = 0;
          float v31 = *(float *)(v17 + 12);
          *(float *)&double v28 = v27;
          if (a3 > 0.5)
          {
            float v34 = a8->var0[1];
            v66[0] = 0;
            *(float *)&v66[1] = v34;
            if (self)
            {
              v35 = v66;
LABEL_37:
              -[PAEKeyerCbCrSetup polarToCartesian:](self, "polarToCartesian:", v35, *(void *)&v53);
              double v28 = *(double *)v67;
LABEL_49:
              *(double *)(*(void *)(*(void *)&a9 + 48) + 8) = v28;
              goto LABEL_50;
            }
            goto LABEL_48;
          }
        }
        else
        {
          *(float *)&double v28 = a3;
        }
      }
      double v51 = vabds_f32(v31, v33);
      BOOL v52 = v51 >= 3.14159265;
      if (v31 >= v33) {
        BOOL v52 = v51 < 3.14159265;
      }
      if (v52)
      {
        if (v31 < v33) {
          float v31 = v31 + v53;
        }
      }
      else if (v33 < v31)
      {
        float v33 = v33 + v53;
      }
      v64[0] = v32;
      *(float *)&v64[1] = v33;
      v63[0] = v30;
      *(float *)&v63[1] = v31;
      -[PAEKeyerCbCrSetup interpVec2f:left:right:interpolated:](self, "interpVec2f:left:right:interpolated:", v64, v63, v67, v28, *(void *)&v53);
      uint64_t v61 = v67[0];
      if (self)
      {
        [(PAEKeyerCbCrSetup *)self polarToCartesian:&v61];
        double v28 = v62;
        goto LABEL_49;
      }
      goto LABEL_48;
    }
    float v37 = *(float *)(v15 + v24);
    float v36 = *(float *)(v15 + v24 + 4);
    float v39 = *(float *)(v17 + v24);
    float v38 = *(float *)(v17 + v24 + 4);
    if (v14 == 1)
    {
      if (a3 <= 0.5 || v29 > 1) {
        goto LABEL_24;
      }
      float v38 = *(float *)(v17 + 16 * (v24 != 24) + 4);
      float v39 = 0.0;
      *(float *)&double v28 = v54;
    }
    else
    {
      if (v14 != 2 || (a3 <= 0.5 ? (BOOL v41 = v29 > 1) : (BOOL v41 = 1), v41))
      {
LABEL_24:
        *(float *)&double v28 = a3;
        goto LABEL_25;
      }
      float v36 = *(float *)(v15 + 16 * (v24 != 24) + 4);
      float v37 = 0.0;
      *(float *)&double v28 = v27;
    }
LABEL_25:
    float v42 = (float)(a10->var0[1] - v38) - a4;
    float v43 = *(float *)a12 - v37;
    float v44 = (float)(*((float *)a12 + 1) - v36) - a5;
    v60[0] = a10->var0[0] - v39;
    v60[1] = v42;
    *(float *)v59 = v43;
    *(float *)&v59[1] = v44;
    -[PAEKeyerCbCrSetup interpVec2f:left:right:interpolated:](self, "interpVec2f:left:right:interpolated:", v60, v59, v67, v28, *(void *)&v53);
    float v45 = a8->var0[0];
    float v46 = *(float *)v67;
    char v47 = v55;
    if (v29 > 1) {
      char v47 = 1;
    }
    if (v47)
    {
      float v48 = a8->var0[1] - *((float *)v67 + 1);
    }
    else
    {
      double v62 = *(double *)(*(void *)(*(void *)&a9 + 48) + 16 * (v24 != 24));
      [(PAEKeyerCbCrSetup *)self toPolar:&v62 polar:v57];
      float v48 = v58;
    }
    v56[0] = v45 - v46;
    v56[1] = v48;
    if (self)
    {
      [(PAEKeyerCbCrSetup *)self polarToCartesian:v56];
      LODWORD(v28) = LODWORD(v62);
    }
    else
    {
      double v62 = 0.0;
      double v28 = 0.0;
    }
    v49 = (_DWORD *)(*(void *)(*(void *)&a9 + 48) + v24);
    _DWORD *v49 = LODWORD(v28);
    v49[1] = HIDWORD(v62);
LABEL_50:
    ++v29;
    v24 += 8;
  }
  while (v24 != 40);
}

- (void)pieToPolarForPie:(void *)a3 polar:(Vec2f *)a4
{
  for (uint64_t i = 0; i != 5; ++i)
  {
    float v8 = (_DWORD *)(*((void *)a3 + 6) + i * 8);
    v12[0] = *v8;
    v12[1] = v8[1];
    [(PAEKeyerCbCrSetup *)self toPolar:v12 polar:&a4[i]];
  }
  float v9 = a4[2].var0[1];
  if (a4->var0[1] > v9)
  {
    float v10 = v9 + 6.28318531;
    a4[2].var0[1] = v10;
    float v11 = a4[4].var0[1] + 6.28318531;
    a4[4].var0[1] = v11;
  }
}

- (void)pieToPolarForPie:(void *)a3 softPie:(void *)a4 tolPolar:(Vec2f *)a5 softPolar:(Vec2f *)a6
{
  [(PAEKeyerCbCrSetup *)self pieToPolarForPie:a3 polar:a5];

  [(PAEKeyerCbCrSetup *)self pieToPolarForPie:a4 polar:a6];
}

- (void)offsetPie:(Vec2f *)a3 offsetDegrees:(float)a4
{
  for (uint64_t i = 1; i != 11; i += 2)
    a3->var0[i] = a3->var0[i] + a4;
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  double v38 = *(double *)&a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  float v6 = objc_alloc_init(PAEKeyerCbCrSetup);
  [(PAEKeyerCbCrSetup *)self pieToPolarForPie:self->_keyer2DTolPie softPie:self->_keyer2DSoftPie tolPolar:&v56 softPolar:v52];
  [(PAEKeyerCbCrSetup *)self pieToPolarForPie:*((void *)a3 + 23) softPie:*((void *)a3 + 24) tolPolar:v55 softPolar:v49];
  float v8 = v58;
  float v9 = v56;
  float v10 = v57 + (float)((float)(v59 - v57) * 0.5);
  float v12 = *(float *)&v55[4];
  float v11 = *(float *)&v55[5];
  float v14 = *(float *)v55;
  float v13 = *(float *)&v55[1];
  *(float *)&double v15 = v54;
  if (v53 < v10 && v54 < v10)
  {
    LODWORD(v7) = 1086918619;
    goto LABEL_11;
  }
  if (v53 > v10 && v54 > v10)
  {
    LODWORD(v7) = -1060565029;
LABEL_11:
    -[PAEKeyerCbCrSetup offsetPie:offsetDegrees:](self, "offsetPie:offsetDegrees:", v52, v7, v15);
  }
  float v18 = v13 + (float)((float)(v11 - v13) * 0.5);
  *(float *)&double v15 = v51;
  if (v50 < v18 && v51 < v18)
  {
    LODWORD(v7) = 1086918619;
    goto LABEL_22;
  }
  if (v50 > v18 && v51 > v18)
  {
    LODWORD(v7) = -1060565029;
LABEL_22:
    -[PAEKeyerCbCrSetup offsetPie:offsetDegrees:](self, "offsetPie:offsetDegrees:", v49, v7, v15);
  }
  float v21 = v9 + (float)((float)(v8 - v9) * 0.5);
  double v22 = vabds_f32(v18, v10);
  if (v18 >= v10) {
    BOOL v23 = v22 < 3.14159265;
  }
  else {
    BOOL v23 = v22 >= 3.14159265;
  }
  if (v23)
  {
    int v24 = 0;
    if (v18 < v10)
    {
      float v18 = v18 + 6.28318531;
      int v25 = 1086918619;
    }
    else
    {
      int v25 = 0;
    }
  }
  else
  {
    int v25 = 0;
    if (v10 >= v18)
    {
      int v24 = 0;
    }
    else
    {
      float v10 = v10 + 6.28318531;
      int v24 = 1086918619;
    }
  }
  *(float *)char v47 = v21;
  *(float *)&v47[1] = v10;
  v46[0] = v14 + (float)((float)(v12 - v14) * 0.5);
  v46[1] = v18;
  [(PAEKeyerCbCrSetup *)self interpVec2f:v47 left:v46 right:&v48 interpolated:v38];
  if (OMPie::isQuadActive((OMPie *)((char *)self->_keyer2DTolPie + 8))
    || !OMPie::isQuadActive((OMPie *)(*((void *)a3 + 23) + 8)))
  {
    if (OMPie::isQuadActive((OMPie *)(*((void *)a3 + 23) + 8)))
    {
      uint64_t v28 = 0;
    }
    else if (OMPie::isQuadActive((OMPie *)((char *)self->_keyer2DTolPie + 8)))
    {
      uint64_t v28 = 2;
    }
    else
    {
      uint64_t v28 = 0;
    }
  }
  else
  {
    uint64_t v28 = 1;
  }
  uint64_t v45 = v48;
  *(float *)float v44 = v21;
  *(float *)&v44[1] = v10;
  v43[0] = v14 + (float)((float)(v12 - v14) * 0.5);
  v43[1] = v18;
  LODWORD(v26) = v24;
  LODWORD(v27) = v25;
  [(PAEKeyerCbCrSetup *)self interpPieWithWeight:&v45 currentDirectionCorrection:v44 nextDirectionCorrection:&v56 interpolatedCenter:v43 currentCenter:v55 currentPolar:v28 nextCenter:v38 nextPolar:v26 interpolationType:v27 interpolatedPie:v6->_keyer2DTolPie];
  if (OMPie::isQuadActive((OMPie *)((char *)self->_keyer2DSoftPie + 8))
    || !OMPie::isQuadActive((OMPie *)(*((void *)a3 + 24) + 8)))
  {
    if (OMPie::isQuadActive((OMPie *)(*((void *)a3 + 24) + 8)))
    {
      uint64_t v31 = 0;
    }
    else if (OMPie::isQuadActive((OMPie *)((char *)self->_keyer2DSoftPie + 8)))
    {
      uint64_t v31 = 2;
    }
    else
    {
      uint64_t v31 = 0;
    }
  }
  else
  {
    uint64_t v31 = 1;
  }
  uint64_t v42 = v48;
  *(float *)BOOL v41 = v21;
  *(float *)&v41[1] = v10;
  v40[0] = v14 + (float)((float)(v12 - v14) * 0.5);
  v40[1] = v18;
  LODWORD(v29) = v24;
  LODWORD(v30) = v25;
  [(PAEKeyerCbCrSetup *)self interpPieWithWeight:&v42 currentDirectionCorrection:v41 nextDirectionCorrection:v52 interpolatedCenter:v40 currentCenter:v49 currentPolar:v31 nextCenter:v38 nextPolar:v29 interpolationType:v30 interpolatedPie:v6->_keyer2DSoftPie];
  keyer2DSatSpline = v6->_keyer2DSatSpline;
  keyer2DSatSpline[33] = 1;
  *((_DWORD *)keyer2DSatSpline + 6) = 0;
  *((void *)keyer2DSatSpline + 1) = *(void *)keyer2DSatSpline;
  uint64_t v33 = *(void *)self->_keyer2DSatSpline;
  if ((int)((unint64_t)(*((void *)self->_keyer2DSatSpline + 1) - v33) >> 5) >= 1)
  {
    uint64_t v34 = 0;
    uint64_t v35 = 24;
    do
    {
      float v36 = (OMSpline *)v6->_keyer2DSatSpline;
      Vec2f v39 = (Vec2f)vadd_f32(vmul_n_f32(*(float32x2_t *)(v33 + v35), 1.0 - *(float *)&v38), vmul_n_f32(*(float32x2_t *)(**((void **)a3 + 22) + v35), *(float *)&v38));
      OMSpline::addVertexAtEnd(v36, &v39);
      ++v34;
      uint64_t v33 = *(void *)self->_keyer2DSatSpline;
      v35 += 32;
    }
    while (v34 < (int)((unint64_t)(*((void *)self->_keyer2DSatSpline + 1) - v33) >> 5));
  }
  return v6;
}

- (BOOL)isEqualTo:(id)a3
{
  uint64_t v3 = *((void *)self->_keyer2DTolPie + 6);
  uint64_t v4 = *(void *)(*((void *)a3 + 23) + 48);
  for (uint64_t i = 4; i != 44; i += 8)
  {
    if (*(float *)(v3 + i - 4) == *(float *)(v4 + i - 4) && *(float *)(v3 + i) == *(float *)(v4 + i))
    {
      uint64_t v6 = *((void *)self->_keyer2DSoftPie + 6);
      uint64_t v7 = *(void *)(*((void *)a3 + 24) + 48);
      if (*(float *)(v6 + i - 4) == *(float *)(v7 + i - 4) && *(float *)(v6 + i) == *(float *)(v7 + i)) {
        continue;
      }
    }
    LOBYTE(v14) = 0;
    return v14;
  }
  keyer2DSatSpline = (uint64_t *)self->_keyer2DSatSpline;
  uint64_t v9 = *keyer2DSatSpline;
  unint64_t v10 = keyer2DSatSpline[1] - *keyer2DSatSpline;
  if ((int)(v10 >> 5) < 1)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    uint64_t v11 = (v10 >> 5) - 1;
    float v12 = (float *)(v9 + 28);
    float v13 = (float *)(**((void **)a3 + 22) + 28);
    do
    {
      BOOL v14 = *v12 == *v13 && *(v12 - 1) == *(v13 - 1);
      BOOL v16 = v11-- != 0;
      if (!v14) {
        break;
      }
      v12 += 8;
      v13 += 8;
    }
    while (v16);
  }
  return v14;
}

@end