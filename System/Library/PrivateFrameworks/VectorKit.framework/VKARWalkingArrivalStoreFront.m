@interface VKARWalkingArrivalStoreFront
- (BOOL)isEqual:(id)a3;
- (Coordinate3D<geo::Degrees,)bottomCenterCoordinate;
- (Matrix<double,)normal;
- (Mercator3<double>)bottomCenterPoint;
- (OrientedBox<double,)face;
- (Unit<geo::MeterUnitDescription,)appliedUndulation;
- (Unit<geo::MeterUnitDescription,)faceHeightInMeters;
- (Unit<geo::MeterUnitDescription,)faceWidthInMeters;
- (VKARWalkingArrivalStoreFront)initWithGEOOrientedBox:(id)a3 undulationProvider:(id)a4;
- (VKARWalkingArrivalStoreFront)initWithOrientedRect:(const void *)a3;
- (VKARWalkingArrivalStoreFront)initWithOrientedRect:(const void *)a3 undulationProvider:(id)a4;
- (VKARWalkingArrivalStoreFront)initWithYaw:(float)a3 pitch:(float)a4 roll:(float)a5 x:(double)a6 y:(double)a7 z:(double)a8 w:(float)a9 h:(float)a10 undulationProvider:(id)a11;
- (id).cxx_construct;
- (id)description;
@end

@implementation VKARWalkingArrivalStoreFront

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 56) = xmmword_1A28FC920;
  *(_OWORD *)((char *)self + 72) = xmmword_1A28FC720;
  *((void *)self + 11) = 0xFFEFFFFFFFFFFFFFLL;
  return self;
}

- (Unit<geo::MeterUnitDescription,)appliedUndulation
{
  v3._value = self->_undulation._value;
  void *v2 = *(Unit<geo::MeterUnitDescription, double> *)&v3._value;
  return v3;
}

- (OrientedBox<double,)face
{
  *(_OWORD *)retstr->_transform._translation._e = *(_OWORD *)&self->_transform._translation._e[1];
  *(_OWORD *)retstr->_transform._rotation._imaginary._e = *(_OWORD *)&self->_transform._rotation._imaginary._e[1];
  retstr->_transform._rotation._scalar = self->_bounds._minimum._e[0];
  Matrix<double, 2, 1> v3 = *(Matrix<double, 2, 1> *)((char *)&self->_bounds._maximum + 8);
  retstr->_bounds._minimum = *(Matrix<double, 2, 1> *)((char *)&self->_bounds._minimum + 8);
  retstr->_transform._translation._e[2] = self->_transform._rotation._imaginary._e[0];
  retstr->_transform._rotation._imaginary._e[2] = self->_transform._rotation._scalar;
  retstr->_bounds._maximum = v3;
  return self;
}

- (id)description
{
  [(VKARWalkingArrivalStoreFront *)self bottomCenterCoordinate];
  Matrix<double, 2, 1> v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p position:(%f,%f,%f) undulation:%f>", v5, self, v8, v9, *(void *)&self->_undulation._value];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKARWalkingArrivalStoreFront;
  if ([(VKARWalkingArrivalStoreFront *)&v18 isEqual:v4]
    && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    id v8 = v4;
    [(VKARWalkingArrivalStoreFront *)self bottomCenterPoint];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [v8 bottomCenterPoint];
    BOOL v6 = vabdd_f64(v10, v17) < 0.00000001 && vabdd_f64(v12, v15) < 0.00000001 && vabdd_f64(v14, v16) < 0.00000001;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (Matrix<double,)normal
{
  double v2 = self->_face._transform._rotation._imaginary._e[0];
  double v3 = self->_face._transform._rotation._imaginary._e[1];
  double v4 = self->_face._transform._rotation._imaginary._e[2];
  double scalar = self->_face._transform._rotation._scalar;
  double v6 = v2 + v2;
  double v7 = -((v4 + v4) * scalar - (v2 + v2) * v3);
  double v8 = 1.0 - ((v2 + v2) * v2 + (v4 + v4) * v4);
  double v9 = (v4 + v4) * v3 + scalar * v6;
  result._e[2] = v9;
  result._e[1] = v8;
  result._e[0] = v7;
  return result;
}

- (Coordinate3D<geo::Degrees,)bottomCenterCoordinate
{
  double v3 = v2;
  [(VKARWalkingArrivalStoreFront *)self bottomCenterPoint];
  double v5 = v4 * 40075017.0;
  long double v7 = v6 * 6.28318531;
  long double v9 = exp(v8 * 6.28318531 + -3.14159265);
  long double v15 = atan(v9);
  long double v10 = fmod(v7, 6.28318531);
  long double v11 = fmod(v10 + 6.28318531, 6.28318531);
  v12.f64[0] = v15;
  v12.f64[1] = v11;
  double v13 = 114.591559;
  float64x2_t v14 = vmlaq_f64((float64x2_t)xmmword_1A28FCC00, (float64x2_t)xmmword_1A28FCBF0, v12);
  *double v3 = v14;
  v3[1].f64[0] = v5;
  result.altitude = *(Unit<geo::MeterUnitDescription, double> *)&v12.f64[0];
  result.longitude = *(Unit<geo::DegreeUnitDescription, double> *)&v14.f64[0];
  result.latitude = *(Unit<geo::DegreeUnitDescription, double> *)&v13;
  return result;
}

- (Mercator3<double>)bottomCenterPoint
{
  double v2 = self->_face._transform._translation._e[0];
  double v3 = self->_face._transform._translation._e[1];
  double v4 = self->_face._transform._translation._e[2]
     + (self->_face._bounds._minimum._e[1] - self->_face._bounds._maximum._e[1]) * 0.5;
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (Unit<geo::MeterUnitDescription,)faceHeightInMeters
{
  v3._value = self->_dimensionsInMeters._e[1];
  double *v2 = v3._value;
  return v3;
}

- (Unit<geo::MeterUnitDescription,)faceWidthInMeters
{
  v3._value = self->_dimensionsInMeters._e[0];
  double *v2 = v3._value;
  return v3;
}

- (VKARWalkingArrivalStoreFront)initWithOrientedRect:(const void *)a3 undulationProvider:(id)a4
{
  double v6 = (void (**)(void, double, double))a4;
  v73.receiver = self;
  v73.super_class = (Class)VKARWalkingArrivalStoreFront;
  long double v7 = [(VKARWalkingArrivalStoreFront *)&v73 init];
  if (v7)
  {
    long double v8 = *(double *)a3;
    long double v9 = *((double *)a3 + 1);
    long double v10 = *((double *)a3 + 2);
    double v11 = sqrt(v8 * v8 + v9 * v9);
    double v12 = atan2(v10, v11 * 0.996647189);
    __double2 v13 = __sincos_stret(v12);
    double v14 = atan2(v10 + v13.__sinval * v13.__sinval * 42841.3115 * v13.__sinval, v11 + v13.__cosval * v13.__cosval * -42697.6727 * v13.__cosval);
    if (v6)
    {
      long double v15 = atan2(v9, v8);
      v6[2](v6, v14 * 57.2957795, v15 * 57.2957795);
    }
    else
    {
      double v16 = 0.0;
    }
    double v71 = v16;
    v7->_undulation._value = v16;
    long double v17 = cos(v14 + v14) * -559.82 + 111132.92;
    long double v18 = v17 + cos(v14 * 4.0) * 1.175;
    double v70 = v18 + cos(v14 * 6.0) * -0.0023;
    double v19 = v14 * 0.5;
    long double v20 = tan(v14 * 0.5 + 0.78103484);
    double v21 = log(v20);
    long double v22 = tan(v19 + 0.789761487);
    double v69 = fabs((log(v22) - v21) * 0.159154943);
    long long v79 = *(_OWORD *)a3;
    double v80 = *((double *)a3 + 2);
    long long v23 = v79;
    long double v24 = v80;
    gdc::CameraFrame<geo::Degrees,double>::createLocalEcefFrame((uint64_t)v74, (uint64_t)&v79);
    double v26 = *((double *)a3 + 3);
    double v27 = *((double *)a3 + 4);
    double v28 = *((double *)a3 + 5);
    double v29 = *((double *)a3 + 6);
    double v30 = v26 * v78 + v27 * v77 - (v28 * v76 + v29 * v75);
    double v31 = v27 * v78 + v28 * v75 - (v26 * v77 + v29 * v76);
    double v32 = v26 * v76 + v28 * v78 - (v27 * v75 + v29 * v77);
    double v33 = v26 * v75 + v27 * v76 + v28 * v77 + v29 * v78;
    *(double *)v34.i64 = -(v30 * v33 - v32 * v31) * -2.0;
    if (fabs(*(double *)v34.i64) >= 1.0)
    {
      v25.i64[0] = 0x3FF921FB54442D18;
      v36.f64[0] = NAN;
      v36.f64[1] = NAN;
      *(void *)&double v35 = vbslq_s8((int8x16_t)vnegq_f64(v36), v25, v34).u64[0];
    }
    else
    {
      double v35 = asin(*(long double *)v34.i64);
    }
    double v67 = v35;
    double v66 = atan2(v33 * v32 + v30 * v31 + v33 * v32 + v30 * v31, 1.0 - (v30 * v30 + v32 * v32) * 2.0);
    double v37 = sqrt(*(double *)&v23 * *(double *)&v23 + *((double *)&v23 + 1) * *((double *)&v23 + 1));
    double v38 = atan2(v24, v37 * 0.996647189);
    __double2 v39 = __sincos_stret(v38);
    double v40 = atan2(v24 + v39.__sinval * v39.__sinval * 42841.3115 * v39.__sinval, v37 + v39.__cosval * v39.__cosval * -42697.6727 * v39.__cosval);
    __double2 v41 = __sincos_stret(v40);
    long double v42 = tan(v40 * 0.5 + 0.785398163);
    long double v72 = log(v42) * 0.159154943 + 0.5;
    long double v68 = atan2(*((long double *)&v23 + 1), *(long double *)&v23) * 0.159154943 + 0.5;
    long double v43 = atan2(v33 * v31 + v30 * v32 + v33 * v31 + v30 * v32, 1.0 - (v30 * v30 + v31 * v31) * 2.0);
    __double2 v44 = __sincos_stret(v43 * 0.5);
    __double2 v45 = __sincos_stret(v66 * -0.5);
    __double2 v46 = __sincos_stret(v67 * -0.5);
    double v47 = v44.__cosval * v45.__cosval * v46.__cosval + v44.__sinval * v45.__sinval * v46.__sinval;
    double v48 = -(v44.__sinval * v45.__sinval * v46.__cosval - v44.__cosval * v45.__cosval * v46.__sinval);
    double v49 = v44.__cosval * v45.__sinval * v46.__cosval + v44.__sinval * v45.__cosval * v46.__sinval;
    double v50 = -(v44.__cosval * v45.__sinval * v46.__sinval - v44.__sinval * v45.__cosval * v46.__cosval);
    double v51 = v48 * -0.0000000309086185;
    double v52 = v49 * -0.0000000309086185;
    double v53 = v50 * -0.0000000309086185;
    double v54 = v47 * -0.0000000309086185;
    double v55 = v47 * 0.707106769;
    double v56 = v48 * 0.707106769;
    double v57 = v51 + v50 * 0.707106769;
    double v58 = v54 + v49 * -0.707106769;
    double v59 = v49 * -0.0000000309086185 - v53 + v55 + v56;
    double v60 = v52 + v53 - v56 + v55;
    float64x2_t v61 = vsubq_f64(*(float64x2_t *)((char *)a3 + 72), *(float64x2_t *)((char *)a3 + 56));
    *(float *)&double v53 = v69 * v61.f64[0] / v70;
    *(float *)&double v55 = vmuld_lane_f64(0.0000000249532021, v61, 1);
    v7->_dimensionsInMeters = (Matrix<float, 2, 1>)vcvt_f32_f64(v61);
    double v62 = *(float *)&v53 * 0.5;
    double v63 = *(float *)&v55 * 0.5;
    v7->_face._transform._rotation._imaginary._e[1] = v59;
    v7->_face._transform._rotation._imaginary._e[2] = v60;
    v7->_face._transform._translation._e[0] = v68;
    v7->_face._transform._translation._e[1] = v72;
    v7->_face._transform._translation._e[2] = (v37 / v41.__cosval
                                             - v71
                                             + -6378137.0 / sqrt(v41.__sinval * v41.__sinval * -0.00669437999 + 1.0))
                                            * 0.0000000249532021;
    v7->_face._transform._rotation._imaginary._e[0] = v58 + v57;
    v7->_face._transform._rotation._double scalar = v58 - v57;
    v7->_face._bounds._minimum._e[0] = -v62;
    v7->_face._bounds._minimum._e[1] = -v63;
    v7->_face._bounds._maximum._e[0] = v62;
    v7->_face._bounds._maximum._e[1] = v63;
    v64 = v7;
  }

  return v7;
}

- (VKARWalkingArrivalStoreFront)initWithYaw:(float)a3 pitch:(float)a4 roll:(float)a5 x:(double)a6 y:(double)a7 z:(double)a8 w:(float)a9 h:(float)a10 undulationProvider:(id)a11
{
  id v17 = a11;
  __float2 v18 = __sincosf_stret(a3 * 0.5);
  __float2 v19 = __sincosf_stret(a4 * 0.5);
  __float2 v20 = __sincosf_stret(a5 * 0.5);
  float v21 = (float)((float)(v19.__cosval * v18.__cosval) * v20.__cosval)
      + (float)((float)(v19.__sinval * v18.__sinval) * v20.__sinval);
  float v22 = -(float)((float)((float)(v19.__sinval * v18.__sinval) * v20.__cosval)
               - (float)((float)(v19.__cosval * v18.__cosval) * v20.__sinval));
  float v23 = -(float)((float)((float)(v19.__sinval * v18.__cosval) * v20.__sinval)
               - (float)((float)(v19.__cosval * v18.__sinval) * v20.__cosval));
  float v24 = v21 * -0.5;
  float v25 = v21 * 0.5;
  float v26 = v22 * 0.5;
  float v27 = (float)((float)((float)(v19.__sinval * v18.__cosval) * v20.__cosval)
              + (float)((float)(v19.__cosval * v18.__sinval) * v20.__sinval))
      * 0.5;
  float v28 = v23 * 0.5;
  float v29 = v23 * -0.5;
  float v30 = v22 * -0.5;
  v31.f32[0] = (float)((float)((float)(v22 * 0.5) + v24) + v27) - v29;
  float32_t v32 = (float)(v24 - v26) + (float)(v27 + v29);
  v33.f32[0] = (float)(v30 + v25) + (float)(v27 + v28);
  v31.f32[1] = v32;
  v33.f32[1] = (float)(v25 + v27) - (float)(v30 + v28);
  *(double *)__double2 v39 = a6;
  *(double *)&v39[1] = a7;
  *(double *)&v39[2] = a8;
  float64x2_t v40 = vcvtq_f64_f32(v31);
  float64x2_t v41 = vcvtq_f64_f32(v33);
  double v42 = -(a9 * 0.5);
  double v43 = -(a10 * 0.5);
  double v44 = a9 * 0.5;
  double v45 = a10 * 0.5;
  int8x16_t v34 = [(VKARWalkingArrivalStoreFront *)self initWithOrientedRect:v39 undulationProvider:v17];

  return v34;
}

- (VKARWalkingArrivalStoreFront)initWithGEOOrientedBox:(id)a3 undulationProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasPosition]
    && [v6 hasWidth]
    && ([v6 hasHeight] & 1) != 0)
  {
    long double v8 = [v6 position];
    if ([v8 hasX]
      && [v8 hasY]
      && [v8 hasZ]
      && [v8 hasYaw]
      && [v8 hasPitch]
      && ([v8 hasRoll] & 1) != 0)
    {
      [v8 yaw];
      double v10 = v9;
      [v8 pitch];
      double v12 = v11;
      [v8 roll];
      double v14 = v13;
      [v8 x];
      double v16 = v15;
      [v8 y];
      double v18 = v17;
      [v8 z];
      double v20 = v19;
      [v6 width];
      double v22 = v21;
      [v6 height];
      float v23 = v10;
      *(float *)&double v24 = v12;
      *(float *)&double v25 = v14;
      *(float *)&double v26 = v22;
      *(float *)&double v28 = v27;
      *(float *)&double v27 = v23;
      self = [(VKARWalkingArrivalStoreFront *)self initWithYaw:v7 pitch:v27 roll:v24 x:v25 y:v16 z:v18 w:v20 h:v26 undulationProvider:v28];
      float v29 = self;
    }
    else
    {
      float v29 = 0;
    }
  }
  else
  {
    float v29 = 0;
  }

  return v29;
}

- (VKARWalkingArrivalStoreFront)initWithOrientedRect:(const void *)a3
{
  return [(VKARWalkingArrivalStoreFront *)self initWithOrientedRect:a3 undulationProvider:0];
}

@end