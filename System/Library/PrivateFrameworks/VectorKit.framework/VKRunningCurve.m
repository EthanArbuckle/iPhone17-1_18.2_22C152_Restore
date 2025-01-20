@interface VKRunningCurve
- ($9C1B066A8D3A7DCAD1653419A6271DE1)stateAtTime:(SEL)a3;
- (BOOL)courseValid;
- (BOOL)hasStateAtTime:(double)a3;
- (VKRunningCurve)init;
- (id).cxx_construct;
- (void)appendPosition:()Matrix<double coordinate:()3 atTime:(1>)a3;
- (void)reset;
- (void)setCourseValid:(BOOL)a3;
@end

@implementation VKRunningCurve

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((void *)self + 5) = 0xBF80000000000000;
  *((unsigned char *)self + 96) = 0;
  *((void *)self + 16) = 0xBF80000000000000;
  *((unsigned char *)self + 184) = 0;
  *((void *)self + 27) = 0xBF80000000000000;
  return self;
}

- (void).cxx_destruct
{
  if (self->_pu.position._hasValue) {
    self->_pu.position._hasValue = 0;
  }
  if (self->_p1.position._hasValue) {
    self->_p1.position._hasValue = 0;
  }
  if (self->_p0.position._hasValue) {
    self->_p0.position._hasValue = 0;
  }
}

- (VKRunningCurve)init
{
  v6.receiver = self;
  v6.super_class = (Class)VKRunningCurve;
  v2 = [(VKRunningCurve *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(VKRunningCurve *)v2 reset];
    v4 = v3;
  }

  return v3;
}

- (void)reset
{
  self->_t0 = -1.0;
  self->_t1 = -1.0;
  self->_tu = -1.0;
  self->_mbValid = 0;
}

- ($9C1B066A8D3A7DCAD1653419A6271DE1)stateAtTime:(SEL)a3
{
  *(_OWORD *)self[3].var3._e = 0u;
  *(_OWORD *)&self[3].var3._e[2] = 0u;
  double var2 = self[1].var2;
  if (var2 >= 0.0)
  {
    self[4].var0._value.double type = a4;
    double v6 = self[2].var3._e[2];
    if (v6 >= 0.0)
    {
      double v9 = (a4 - var2) / (v6 - var2);
      if (v9 >= 1.0)
      {
        int v7 = LOBYTE(self[1].var3._e[0]);
        BOOL var4 = self[2].var4;
        if (LOBYTE(self[1].var3._e[0]))
        {
          self[3].var0 = *(optional<gm::Matrix<double, 3, 1>> *)&self[1].var3._e[1];
          self[3].var1 = *(PolylineCoordinate *)&self[1].var4;
          if (!var4) {
            self[2].BOOL var4 = 1;
          }
        }
        else if (self[2].var4)
        {
          self[2].BOOL var4 = 0;
        }
        p_double var2 = (_OWORD *)&self[3].var2;
        long long v37 = *(_OWORD *)&self[2].var1.index;
        *(optional<gm::Matrix<double, 3, 1>> *)&self[3].double var2 = self[2].var0;
        *(_OWORD *)&self[3].var3._e[1] = v37;
        *(double *)&self[3].BOOL var4 = self[2].var3._e[0];
        char index = LOBYTE(self[2].var3._e[1]);
LABEL_28:
        self[4].var0._hasValue = index;
        retstr->var0._hasValue = 0;
        if (!v7)
        {
LABEL_30:
          long long v38 = p_var2[1];
          *(_OWORD *)retstr->var3._e = *p_var2;
          *(_OWORD *)&retstr->var3._e[2] = v38;
          *(_OWORD *)(&retstr->var4 + 1) = *(_OWORD *)((char *)p_var2 + 25);
          return self;
        }
LABEL_29:
        *(optional<gm::Matrix<double, 3, 1>> *)retstr->var0._value.data = self[3].var0;
        *(PolylineCoordinate *)&retstr->double var2 = self[3].var1;
        retstr->var0._hasValue = 1;
        goto LABEL_30;
      }
      if (v9 > 0.0)
      {
        if (LOBYTE(self[5].var3._e[2]))
        {
          double v10 = v9 * v9 * v9;
          double v11 = *(double *)&self[4].var1;
          double v12 = self[4].var2;
          double v13 = *(double *)&self[5].var1;
          double v14 = self[4].var3._e[0];
          double v15 = self[4].var3._e[1];
          double v17 = *(double *)&self[5].var0._hasValue;
          double type = self[5].var0._value.type;
          double v18 = self[5].var2 + v11 * v10 + v15 * (v9 * v9) + v17 * v9;
          double v19 = self[5].var3._e[1] + v14 * v10;
          double v21 = self[4].var3._e[2];
          double v20 = *(double *)&self[4].var4;
          double v22 = self[5].var3._e[0] + v12 * v10 + v21 * (v9 * v9) + type * v9;
          double v23 = v19 + v20 * (v9 * v9) + v13 * v9;
          BOOL v24 = self[2].var4;
          if (!self[2].var4)
          {
            BOOL v24 = 1;
            self[2].BOOL var4 = 1;
          }
          *(double *)&self[3].var0._hasValue = v18;
          self[3].var0._value.double type = v22;
          *(double *)&self[3].var1 = v23;
          double v25 = v9 * v9 * 3.0;
          double v26 = v9 + v9;
          double v27 = v17 + v11 * v25 + v15 * v26;
          double v28 = type + v12 * v25 + v21 * v26;
          double v29 = v13 + v14 * v25 + v20 * v26;
          self[3].var3._e[1] = v27;
          self[3].var3._e[2] = v28;
          double v30 = self[1].var3._e[2];
          double v31 = *(double *)&self[1].var4;
          double v32 = self[1].var3._e[1];
          BOOL v33 = !v24;
        }
        else
        {
          double v32 = self[1].var3._e[1];
          double v30 = self[1].var3._e[2];
          double v18 = *(double *)&self->var1 + (v32 - *(double *)&self->var1) * v9;
          double v22 = self->var2 + (v30 - self->var2) * v9;
          double v31 = *(double *)&self[1].var4;
          double v23 = self->var3._e[0] + (v31 - self->var3._e[0]) * v9;
          if (!self[2].var4) {
            self[2].BOOL var4 = 1;
          }
          BOOL v33 = 0;
          *(double *)&self[3].var0._hasValue = v18;
          self[3].var0._value.double type = v22;
          *(double *)&self[3].var1 = v23;
          *(_OWORD *)&self[3].var3._e[1] = *(_OWORD *)&self[2].var1.index;
          double v29 = self[2].var3._e[0];
        }
        self[3].double var2 = *(double *)&self[2].var0._hasValue;
        p_double var2 = (_OWORD *)&self[3].var2;
        *(double *)&self[3].BOOL var4 = v29;
        self[4].var0._hasValue = LOBYTE(self[2].var3._e[1]);
        self[3].var3._e[0] = sqrt((v32 - v18) * (v32 - v18)+ (v31 - v23) * 0.0000000249532021 * ((v31 - v23) * 0.0000000249532021)+ (v30 - v22) * (v30 - v22));
        retstr->var0._hasValue = 0;
        if (v33) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      int v7 = self->var0._value.data[0];
      BOOL v8 = self[2].var4;
      if (self->var0._value.data[0])
      {
        if (self[2].var4) {
          goto LABEL_8;
        }
        goto LABEL_20;
      }
    }
    else
    {
      int v7 = self->var0._value.data[0];
      BOOL v8 = self[2].var4;
      if (self->var0._value.data[0])
      {
        if (self[2].var4)
        {
LABEL_8:
          self[3].var0 = *(optional<gm::Matrix<double, 3, 1>> *)&self->var1.index;
          self[3].var1 = *(PolylineCoordinate *)&self->var3._e[0];
LABEL_23:
          p_double var2 = (_OWORD *)&self[3].var2;
          *(_OWORD *)&self[3].double var2 = *(_OWORD *)&self->var3._e[1];
          *(_OWORD *)&self[3].var3._e[1] = *(_OWORD *)&self->var4;
          *(double *)&self[3].BOOL var4 = self[1].var0._value.type;
          char index = self[1].var1.index;
          goto LABEL_28;
        }
LABEL_20:
        self[3].var0 = *(optional<gm::Matrix<double, 3, 1>> *)&self->var1.index;
        self[3].var1 = *(PolylineCoordinate *)&self->var3._e[0];
        self[2].BOOL var4 = 1;
        goto LABEL_23;
      }
    }
    if (v8) {
      self[2].BOOL var4 = 0;
    }
    goto LABEL_23;
  }
  retstr->var0._hasValue = 0;
  if (self[2].var4)
  {
    *(optional<gm::Matrix<double, 3, 1>> *)retstr->var0._value.data = self[3].var0;
    *(PolylineCoordinate *)&retstr->double var2 = self[3].var1;
    retstr->var0._hasValue = 1;
  }
  long long v5 = *(_OWORD *)&self[3].var3._e[1];
  *(_OWORD *)retstr->var3._e = *(_OWORD *)&self[3].var2;
  *(_OWORD *)&retstr->var3._e[2] = v5;
  *(_OWORD *)(&retstr->var4 + 1) = *(_OWORD *)((char *)&self[3].var3._e[2] + 1);
  return self;
}

- (void)setCourseValid:(BOOL)a3
{
  self->_courseValid = a3;
}

- (void)appendPosition:()Matrix<double coordinate:()3 atTime:(1>)a3
{
  double v5 = a3._e[2];
  if (self->_t0 >= 0.0)
  {
    int v7 = (float64x2_t *)self->_mb.mb[1];
    if (self->_t1 >= 0.0)
    {
      double tu = self->_tu;
      if (tu >= 0.0)
      {
        BOOL hasValue = self->_p0.position._hasValue;
        if (self->_pu.position._hasValue)
        {
          *(_OWORD *)self->_p0.position._value.data = *(_OWORD *)self->_pu.position._value.data;
          self->_p0.double distance = self->_pu.distance;
          if (!hasValue) {
            self->_p0.position._BOOL hasValue = 1;
          }
        }
        else if (self->_p0.position._hasValue)
        {
          self->_p0.position._BOOL hasValue = 0;
        }
        *(_OWORD *)self->_p0.tangent._e = *(_OWORD *)self->_pu.tangent._e;
        *(_OWORD *)&self->_p0.tangent._e[2] = *(_OWORD *)&self->_pu.tangent._e[2];
        *(void *)self->_anon_48 = *(void *)self->_anon_f8;
        self->_anon_48[8] = self->_anon_f8[8];
        self->_t0 = tu;
      }
      self->_t1 = a5;
      if (!self->_p1.position._hasValue) {
        self->_p1.position._BOOL hasValue = 1;
      }
      self->_p1.position._value.double type = a3._e[0];
      self->_p1.coordinate = *(PolylineCoordinate *)&a3._e[1];
      self->_p1.double distance = v5;
      *(PolylineCoordinate *)&self->_p1.tangent._e[0] = a4;
      double v42 = *(double *)&self->_p0.coordinate;
      double v43 = v5 - self->_p0.distance;
      double v44 = sqrt((a3._e[0] - self->_p0.position._value.type) * (a3._e[0] - self->_p0.position._value.type)+ (a3._e[1] - v42) * (a3._e[1] - v42)+ v43 * v43);
      long double v45 = exp(v42 * 6.28318531 + -3.14159265);
      long double v46 = atan(v45) * 114.591559 + -90.0;
      long double v47 = cos(v46 * 0.034906585) * -559.82 + 111132.92;
      long double v48 = v47 + cos(v46 * 0.0698131701) * 1.175;
      long double v49 = v48 + cos(v46 * 0.104719755) * -0.0023;
      long double v50 = v46 * 0.00872664626;
      long double v51 = tan(v46 * 0.00872664626 + 0.78103484);
      double v52 = log(v51);
      long double v53 = tan(v50 + 0.789761487);
      long double v54 = v49 * v44 / fabs((log(v53) - v52) * 0.159154943);
      self->_anon_a0[8] = v54 > 1.0;
      if (v54 > 1.0)
      {
        float64x2_t v55 = *(float64x2_t *)self->_p1.position._value.data;
        float64x2_t v56 = *(float64x2_t *)self->_p0.position._value.data;
        float64x2_t v57 = vsubq_f64(v55, v56);
        float64x2_t v58 = vmulq_f64(v57, (float64x2_t)vdupq_n_s64(0x3F50624DD2F1A9FCuLL));
        double v59 = v43 * 0.001;
        *(float64x2_t *)&self->_p1.tangent._e[2] = v58;
        *(double *)self->_anon_a0 = v43 * 0.001;
        self->_mbValid = 0;
        if (!self->_anon_48[8]) {
          return;
        }
        _Q3 = *(float64x2_t *)&self->_p1.coordinate.index;
        _Q2 = *(float64x2_t *)&self->_p0.coordinate.index;
        float64x2_t v62 = vsubq_f64(_Q3, _Q2);
        _Q7 = vmulq_f64(v62, v62);
        double v64 = sqrt(vaddq_f64(vmlaq_f64(_Q7, v57, v57), (float64x2_t)vdupq_laneq_s64((int64x2_t)_Q7, 1)).f64[0]);
        _Q7.f64[0] = self->_p0.tangent._e[2];
        double v65 = *(double *)&self->_p0.tangentValid;
        double v66 = *(double *)self->_anon_48;
        double v67 = sqrt(_Q7.f64[0] * _Q7.f64[0] + v65 * v65 + v66 * v66);
        double v68 = v64 * 0.5;
        _D21 = 3.0;
        double v70 = fmin(v67 * 0.333333333, v68) * 3.0 / v67;
        _Q7.f64[0] = v70 * _Q7.f64[0];
        double v71 = v70 * v65;
        double v72 = v70 * v66;
        self->_p0.tangent._e[2] = _Q7.f64[0];
        *(double *)&self->_p0.tangentValid = v71;
        *(double *)self->_anon_48 = v72;
        _Q7.f64[0] = sqrt(vaddvq_f64(vmulq_f64(v58, v58)) + v59 * v59);
        double v73 = fmin(_Q7.f64[0] * 0.333333333, v68) * 3.0 / _Q7.f64[0];
        double v74 = v73 * v59;
        float64x2_t v75 = vmulq_n_f64(v58, v73);
        *(float64x2_t *)&self->_p1.tangent._e[2] = v75;
        *(double *)self->_anon_a0 = v74;
        _Q7.f64[0] = -2.0;
        __asm { FMLA            D6, D7, V2.D[1] }
        float64x2_t v77 = *(float64x2_t *)&self->_p0.tangent._e[2];
        __asm
        {
          FMOV            V16.2D, #-3.0
          FMOV            V18.2D, #3.0
        }
        float64x2_t v80 = vmlaq_f64(vmulq_f64(v56, _Q16), _Q18, v55);
        __asm
        {
          FMOV            V18.2D, #-2.0
          FMLA            D19, D21, V3.D[1]
        }
        *(float64x2_t *)&self->_mb.mb[0][0] = vaddq_f64(vsubq_f64(v77, vmlaq_f64(vaddq_f64(v55, v55), _Q18, v56)), v75);
        self->_mb.mb[0][2] = v72 - _D6 + v74;
        *int v7 = vsubq_f64(vsubq_f64(v80, vaddq_f64(v77, v77)), v75);
        self->_mb.mb[1][2] = _D19 - (v72 + v72) - v74;
        *(float64x2_t *)&self->_mb.mb[2][0] = v77;
        self->_mb.mb[2][2] = v72;
        *(float64x2_t *)&self->_mb.mb[3][0] = v56;
        self->_mb.mb[3][2] = _Q2.f64[1];
        goto LABEL_23;
      }
      uint64_t v83 = *(void *)self->_anon_48;
      self->_anon_a0[8] = self->_anon_48[8];
      *(_OWORD *)&self->_p1.tangent._e[2] = *(_OWORD *)&self->_p0.tangent._e[2];
      *(void *)self->_anon_a0 = v83;
    }
    else
    {
      self->_t1 = a5;
      if (!self->_p1.position._hasValue) {
        self->_p1.position._BOOL hasValue = 1;
      }
      self->_p1.position._value.double type = a3._e[0];
      self->_p1.coordinate = *(PolylineCoordinate *)&a3._e[1];
      self->_p1.double distance = a3._e[2];
      *(PolylineCoordinate *)&self->_p1.tangent._e[0] = a4;
      double v8 = *(double *)&self->_p0.coordinate;
      double v9 = a3._e[0] - self->_p0.position._value.type;
      double v10 = a3._e[1] - v8;
      double distance = self->_p0.distance;
      double v11 = a3._e[2] - distance;
      double v12 = sqrt(v9 * v9 + v10 * v10 + v11 * v11);
      long double v13 = exp(v8 * 6.28318531 + -3.14159265);
      long double v14 = atan(v13) * 114.591559 + -90.0;
      long double v15 = cos(v14 * 0.034906585) * -559.82 + 111132.92;
      long double v16 = v15 + cos(v14 * 0.0698131701) * 1.175;
      long double v17 = v16 + cos(v14 * 0.104719755) * -0.0023;
      long double v18 = v14 * 0.00872664626;
      long double v19 = tan(v14 * 0.00872664626 + 0.78103484);
      double v20 = log(v19);
      long double v21 = tan(v18 + 0.789761487);
      long double v22 = v17 * v12 / fabs((log(v21) - v20) * 0.159154943);
      self->_anon_a0[8] = v22 > 1.0;
      self->_anon_48[8] = v22 > 1.0;
      if (v22 > 1.0)
      {
        double v23 = sqrt(v9 * 0.001 * (v9 * 0.001) + v10 * 0.001 * (v10 * 0.001) + v11 * 0.001 * (v11 * 0.001));
        double v24 = fmin(v23 * 0.333333333, v12 * 0.5);
        double v25 = v24 * 3.0 * (1.0 / v23 * (v9 * 0.001));
        double v26 = v24 * 3.0 * (1.0 / v23 * (v10 * 0.001));
        double v27 = v24 * 3.0 * (1.0 / v23 * (v11 * 0.001));
        self->_p0.tangent._e[2] = v25;
        *(double *)&self->_p0.tangentValid = v26;
        *(double *)self->_anon_48 = v27;
        self->_p1.tangent._e[2] = v25;
        *(double *)&self->_p1.tangentValid = v26;
        *(double *)self->_anon_a0 = v27;
        float64x2_t v28 = *(float64x2_t *)self->_p0.position._value.data;
        float64x2_t v29 = *(float64x2_t *)self->_p1.position._value.data;
        float64x2_t v30 = *(float64x2_t *)&self->_p0.tangent._e[2];
        float64x2_t v31 = *(float64x2_t *)&self->_p1.tangent._e[2];
        __asm
        {
          FMOV            V7.2D, #-3.0
          FMOV            V16.2D, #3.0
        }
        float64x2_t v38 = vmlaq_f64(vmulq_f64(v28, _Q7), _Q16, v29);
        __asm { FMOV            V16.2D, #-2.0 }
        *(float64x2_t *)&self->_mb.mb[0][0] = vaddq_f64(vsubq_f64(v30, vmlaq_f64(vaddq_f64(v29, v29), _Q16, v28)), v31);
        self->_mb.mb[0][2] = v27 - (v5 + v5 + distance * -2.0) + v27;
        *int v7 = vsubq_f64(vsubq_f64(v38, vaddq_f64(v30, v30)), v31);
        self->_mb.mb[1][2] = distance * -3.0 + v5 * 3.0 - (v27 + v27) - v27;
        *(float64x2_t *)&self->_mb.mb[2][0] = v30;
        self->_mb.mb[2][2] = v27;
        *(float64x2_t *)&self->_mb.mb[3][0] = v28;
        self->_mb.mb[3][2] = distance;
LABEL_23:
        self->_mbValid = 1;
        return;
      }
    }
    self->_mbValid = 0;
    return;
  }
  self->_t0 = a5;
  if (!self->_p0.position._hasValue) {
    self->_p0.position._BOOL hasValue = 1;
  }
  self->_p0.position._value.double type = a3._e[0];
  self->_p0.coordinate = *(PolylineCoordinate *)&a3._e[1];
  self->_p0.double distance = a3._e[2];
  *(PolylineCoordinate *)&self->_p0.tangent._e[0] = a4;
  self->_anon_48[8] = 0;
}

- (BOOL)courseValid
{
  return self->_courseValid;
}

- (BOOL)hasStateAtTime:(double)a3
{
  double t0 = self->_t0;
  if (t0 < 0.0) {
    return 0;
  }
  double t1 = self->_t1;
  return t1 >= 0.0 && (self->_tu - t0) / (t1 - t0) <= 1.0;
}

@end