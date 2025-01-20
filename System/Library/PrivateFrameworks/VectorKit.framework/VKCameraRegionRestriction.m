@interface VKCameraRegionRestriction
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)clampedCoordinate:(id)a3;
- (BOOL)containsCoordinate:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (GEOMapRegion)mapRegion;
- (Matrix<double,)clampedPosition:()Matrix<double;
- (Matrix<double,)clampedPositionForOrigin:()Matrix<double delta:()2;
- (VKCameraRegionRestriction)initWithCoder:(id)a3;
- (VKCameraRegionRestriction)initWithMapRegion:(id)a3;
- (void)clampedPosition:(double)a3 usingSingleRestriction:(double)a4 westOfDatelineRestriction:(double)a5 eastOfDatelineRestriction:(double)a6 wrapRange:(double)a7;
- (void)encodeWithCoder:(id)a3;
- (void)radianSingleRect:(void *)a3 westOfDatelineRect:(void *)a4 eastOfDatelineRect:(void *)a5;
@end

@implementation VKCameraRegionRestriction

- (Matrix<double,)clampedPosition:()Matrix<double
{
  double v3 = a3._e[1];
  double v4 = a3._e[0];
  if (![(VKCameraRegionRestriction *)self isEmpty])
  {
    for (; v4 < 0.0; double v4 = v4 + 1.0)
      ;
    for (; v4 > 1.0; double v4 = v4 + -1.0)
      ;
    -[VKCameraRegionRestriction clampedPosition:usingSingleRestriction:westOfDatelineRestriction:eastOfDatelineRestriction:wrapRange:](self, "clampedPosition:usingSingleRestriction:westOfDatelineRestriction:eastOfDatelineRestriction:wrapRange:", v4, v3, self->_singleRestrictionMercator._minimum._e[0], self->_singleRestrictionMercator._minimum._e[1], self->_singleRestrictionMercator._maximum._e[0], self->_singleRestrictionMercator._maximum._e[1], *(void *)&self->_westOfDatelineMercator._minimum._e[0], *(void *)&self->_westOfDatelineMercator._minimum._e[1], *(void *)&self->_westOfDatelineMercator._maximum._e[0], *(void *)&self->_westOfDatelineMercator._maximum._e[1], *(void *)&self->_eastOfDatelineMercator._minimum._e[0], *(void *)&self->_eastOfDatelineMercator._minimum._e[1], *(void *)&self->_eastOfDatelineMercator._maximum._e[0], *(void *)&self->_eastOfDatelineMercator._maximum._e[1], 0, 0x3FF0000000000000);
    double v4 = v6;
    double v3 = v7;
  }
  double v8 = v4;
  double v9 = v3;
  result._e[1] = v9;
  result._e[0] = v8;
  return result;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (VKCameraRegionRestriction)initWithMapRegion:(id)a3
{
  id v5 = a3;
  v83.receiver = self;
  v83.super_class = (Class)VKCameraRegionRestriction;
  double v6 = [(VKCameraRegionRestriction *)&v83 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapRegion, a3);
    if (v5)
    {
      [v5 westLng];
      double v9 = v8;
      [v5 eastLng];
      if (v9 > v10)
      {
        int64x2_t v11 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        v7->_singleRestrictionMercator._minimum = (Matrix<double, 2, 1>)v11;
        int64x2_t v12 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
        v7->_singleRestrictionMercator._maximum = (Matrix<double, 2, 1>)v12;
        v7->_singleRestrictionCoord._minimum = (Matrix<double, 2, 1>)v11;
        v7->_singleRestrictionCoord._maximum = (Matrix<double, 2, 1>)v12;
        [v5 southLat];
        double v14 = v13;
        [v5 westLng];
        double v16 = v15;
        [v5 northLat];
        double v18 = v17;
        long double v19 = tan(v14 * 0.00872664626 + 0.785398163);
        long double v20 = log(v19) * 0.159154943 + 0.5;
        long double v21 = tan(v18 * 0.00872664626 + 0.785398163);
        long double v22 = log(v21);
        v7->_westOfDatelineMercator._minimum._e[0] = v16 * 0.00277777778 + 0.5;
        v7->_westOfDatelineMercator._minimum._e[1] = v20;
        v7->_westOfDatelineMercator._maximum._e[0] = 1.0;
        v7->_westOfDatelineMercator._maximum._e[1] = v22 * 0.159154943 + 0.5;
        [v5 southLat];
        long double v24 = tan(v23 * 0.00872664626 + 0.785398163);
        double v25 = log(v24);
        [v5 northLat];
        double v27 = v26;
        [v5 eastLng];
        float64_t v81 = v28;
        long double v29 = tan(v27 * 0.00872664626 + 0.785398163);
        long double v30 = log(v29);
        v7->_eastOfDatelineMercator._minimum._e[0] = 0.0;
        v31.f64[0] = v81;
        v31.f64[1] = v30;
        v7->_eastOfDatelineMercator._minimum._e[1] = v25 * 0.159154943 + 0.5;
        __asm { FMOV            V1.2D, #0.5 }
        v7->_eastOfDatelineMercator._maximum = (Matrix<double, 2, 1>)vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v31);
        [v5 westLng];
        double v38 = v37;
        [v5 southLat];
        double v40 = v39;
        [v5 northLat];
        v7->_westOfDatelineCoord._minimum._e[0] = v38;
        v7->_westOfDatelineCoord._minimum._e[1] = v40;
        v7->_westOfDatelineCoord._maximum._e[0] = 180.0;
        v7->_westOfDatelineCoord._maximum._e[1] = v41;
        [v5 southLat];
        uint64_t v43 = v42;
        [v5 eastLng];
        unint64_t v45 = v44;
        [v5 northLat];
        unint64_t v47 = 0xC066800000000000;
LABEL_8:
        *(void *)&v7->_eastOfDatelineCoord._minimum._e[0] = v47;
        *(void *)&v7->_eastOfDatelineCoord._minimum._e[1] = v43;
        *(void *)&v7->_eastOfDatelineCoord._maximum._e[0] = v45;
        *(void *)&v7->_eastOfDatelineCoord._maximum._e[1] = v46;
        goto LABEL_9;
      }
      [v5 southLat];
      double v65 = v64;
      [v5 westLng];
      double v67 = v66;
      long double v68 = tan(v65 * 0.00872664626 + 0.785398163);
      double v69 = log(v68);
      [v5 northLat];
      double v71 = v70;
      [v5 eastLng];
      float64_t v82 = v72;
      long double v73 = tan(v71 * 0.00872664626 + 0.785398163);
      long double v74 = log(v73);
      v75.f64[0] = v82;
      v75.f64[1] = v74;
      v7->_singleRestrictionMercator._minimum._e[0] = v67 * 0.00277777778 + 0.5;
      v7->_singleRestrictionMercator._minimum._e[1] = v69 * 0.159154943 + 0.5;
      __asm { FMOV            V1.2D, #0.5 }
      v7->_singleRestrictionMercator._maximum = (Matrix<double, 2, 1>)vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v75);
      [v5 westLng];
      uint64_t v60 = v77;
      [v5 southLat];
      uint64_t v62 = v78;
      [v5 eastLng];
      unint64_t v57 = v79;
      [v5 northLat];
      uint64_t v48 = 96;
      uint64_t v49 = 88;
      uint64_t v50 = 80;
      uint64_t v51 = 72;
      uint64_t v52 = 64;
      uint64_t v53 = 56;
      uint64_t v54 = 48;
      uint64_t v55 = 40;
      uint64_t v56 = 128;
      uint64_t v58 = 120;
      uint64_t v59 = 112;
      uint64_t v61 = 104;
    }
    else
    {
      v7->_empty = 1;
      v7->_singleRestrictionMercator._minimum = (Matrix<double, 2, 1>)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      uint64_t v48 = 128;
      uint64_t v49 = 120;
      uint64_t v50 = 112;
      uint64_t v51 = 104;
      uint64_t v52 = 96;
      uint64_t v53 = 88;
      uint64_t v54 = 80;
      uint64_t v55 = 72;
      v7->_singleRestrictionMercator._maximum = (Matrix<double, 2, 1>)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
      uint64_t v56 = 64;
      unint64_t v57 = 0xFFEFFFFFFFFFFFFFLL;
      uint64_t v58 = 56;
      uint64_t v59 = 48;
      uint64_t v60 = 0x7FEFFFFFFFFFFFFFLL;
      uint64_t v61 = 40;
      uint64_t v62 = 0x7FEFFFFFFFFFFFFFLL;
      unint64_t v63 = 0xFFEFFFFFFFFFFFFFLL;
    }
    *(Class *)((char *)&v7->super.isa + v61) = (Class)v60;
    *(Class *)((char *)&v7->super.isa + v59) = (Class)v62;
    *(Class *)((char *)&v7->super.isa + v58) = (Class)v57;
    *(Class *)((char *)&v7->super.isa + v56) = (Class)v63;
    *(Class *)((char *)&v7->super.isa + v55) = (Class)0x7FEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v54) = (Class)0x7FEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v53) = (Class)0xFFEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v52) = (Class)0xFFEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v51) = (Class)0x7FEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v50) = (Class)0x7FEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v49) = (Class)0xFFEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v48) = (Class)0xFFEFFFFFFFFFFFFFLL;
    v7->_westOfDatelineCoord._minimum = (Matrix<double, 2, 1>)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v7->_westOfDatelineCoord._maximum = (Matrix<double, 2, 1>)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    unint64_t v45 = 0xFFEFFFFFFFFFFFFFLL;
    unint64_t v47 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v43 = 0x7FEFFFFFFFFFFFFFLL;
    unint64_t v46 = 0xFFEFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (void).cxx_destruct
{
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (VKCameraRegionRestriction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VKCameraRegionRestrictionMapRegion"];
  if (v5) {
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F64700]) initWithData:v5];
  }
  else {
    double v6 = 0;
  }
  double v7 = [(VKCameraRegionRestriction *)self initWithMapRegion:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  mapRegion = self->_mapRegion;
  if (mapRegion)
  {
    id v5 = [(GEOMapRegion *)mapRegion data];
    [v6 encodeObject:v5 forKey:@"VKCameraRegionRestrictionMapRegion"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    mapRegion = self->_mapRegion;
    double v7 = mapRegion;
    if (!mapRegion)
    {
      double v3 = [v5 mapRegion];
      if (!v3)
      {
        char v9 = 1;
LABEL_9:

        goto LABEL_10;
      }
      double v7 = self->_mapRegion;
    }
    double v8 = [v5 mapRegion];
    char v9 = [(GEOMapRegion *)v7 isEqual:v8];

    if (!mapRegion) {
      goto LABEL_9;
    }
  }
  else
  {
    char v9 = 0;
  }
LABEL_10:

  return v9;
}

- (void)radianSingleRect:(void *)a3 westOfDatelineRect:(void *)a4 eastOfDatelineRect:(void *)a5
{
  if (a3)
  {
    float64x2_t v5 = (float64x2_t)vdupq_n_s64(0x3F91DF46A2529D39uLL);
    float64x2_t v6 = vmulq_f64((float64x2_t)self->_singleRestrictionCoord._minimum, v5);
    float64x2_t v7 = vmulq_f64((float64x2_t)self->_singleRestrictionCoord._maximum, v5);
    *(float64x2_t *)a3 = v6;
    *((float64x2_t *)a3 + 1) = v7;
  }
  if (a4)
  {
    float64x2_t v8 = (float64x2_t)vdupq_n_s64(0x3F91DF46A2529D39uLL);
    float64x2_t v9 = vmulq_f64((float64x2_t)self->_westOfDatelineCoord._minimum, v8);
    float64x2_t v10 = vmulq_f64((float64x2_t)self->_westOfDatelineCoord._maximum, v8);
    *(float64x2_t *)a4 = v9;
    *((float64x2_t *)a4 + 1) = v10;
  }
  if (a5)
  {
    float64x2_t v11 = (float64x2_t)vdupq_n_s64(0x3F91DF46A2529D39uLL);
    float64x2_t v12 = vmulq_f64((float64x2_t)self->_eastOfDatelineCoord._minimum, v11);
    float64x2_t v13 = vmulq_f64((float64x2_t)self->_eastOfDatelineCoord._maximum, v11);
    *(float64x2_t *)a5 = v12;
    *((float64x2_t *)a5 + 1) = v13;
  }
}

- (Matrix<double,)clampedPositionForOrigin:()Matrix<double delta:()2
{
  double v4 = a4._e[0];
  double v5 = a3._e[1];
  double v6 = a3._e[0];
  double v8 = a4._e[0] + a3._e[0];
  double v9 = a4._e[1] + a3._e[1];
  if ([(VKCameraRegionRestriction *)self isEmpty]) {
    goto LABEL_2;
  }
  double v11 = self->_singleRestrictionMercator._minimum._e[0];
  double v12 = self->_singleRestrictionMercator._minimum._e[1];
  double v14 = self->_singleRestrictionMercator._maximum._e[0];
  double v13 = self->_singleRestrictionMercator._maximum._e[1];
  if (v14 >= v11 && v13 >= v12 && v6 >= v11 && v6 <= v14 && v5 >= v12 && v5 <= v13)
  {
    maximum._e[0] = fmin(fmax(v8, v11), v14);
    double v9 = fmin(fmax(v9, v12), v13);
    goto LABEL_40;
  }
  double v20 = self->_westOfDatelineMercator._minimum._e[0];
  double v21 = self->_westOfDatelineMercator._minimum._e[1];
  double v22 = self->_westOfDatelineMercator._maximum._e[0];
  double v23 = self->_westOfDatelineMercator._maximum._e[1];
  Matrix<double, 2, 1> minimum = self->_eastOfDatelineMercator._minimum;
  v25.f64[0] = v23;
  v25.f64[1] = v22;
  Matrix<double, 2, 1> maximum = self->_eastOfDatelineMercator._maximum;
  v26.f64[0] = v21;
  v26.f64[1] = v20;
  if (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vcgtq_f64(v26, v25), (int32x4_t)vcgtq_f64((float64x2_t)minimum, (float64x2_t)maximum))), 0xFuLL))))
  {
LABEL_20:
    -[VKCameraRegionRestriction clampedPosition:](self, "clampedPosition:", v8, v9);
    double v9 = v27;
    goto LABEL_40;
  }
  double v9 = fmin(fmax(v9, v21), v23);
  if (v6 >= v20 && v6 <= v22 && v5 >= v21 && v5 <= v23)
  {
    if (v4 < 0.0 && v8 < v20) {
      goto LABEL_43;
    }
    if (v4 <= 0.0 || v22 >= v8)
    {
LABEL_2:
      maximum._e[0] = v8;
      goto LABEL_40;
    }
    if (v8 + -1.0 < maximum._e[0]) {
      maximum._e[0] = v8 + -1.0;
    }
  }
  else
  {
    if (v6 < minimum._e[0] || v6 > maximum._e[0] || v5 < minimum._e[1] || v5 > maximum._e[1]) {
      goto LABEL_20;
    }
    if (v4 < 0.0 && v8 < minimum._e[0])
    {
      maximum._e[0] = v8 + 1.0;
      if (v20 < v8 + 1.0) {
        goto LABEL_40;
      }
LABEL_43:
      maximum._e[0] = self->_westOfDatelineMercator._minimum._e[0];
      goto LABEL_40;
    }
    if (maximum._e[0] >= v8 || v4 <= 0.0) {
      maximum._e[0] = v8;
    }
  }
LABEL_40:
  double v31 = v9;
  result._e[0] = maximum._e[0];
  result._e[1] = v31;
  return result;
}

- (void)clampedPosition:(double)a3 usingSingleRestriction:(double)a4 westOfDatelineRestriction:(double)a5 eastOfDatelineRestriction:(double)a6 wrapRange:(double)a7
{
  if (a5 >= a3 && a6 >= a4 && (a1 < a3 || (a1 >= a5 || a2 < a4 || a2 >= a6) && a1 > a5))
  {
    double v25 = a17 + (a18 + a17) * -0.5;
    double v26 = v25 + a1;
    long double v27 = a18 - a17;
    long double v28 = fmod(a3 - (v25 + a1), a18 - a17);
    fabs(fmod(v28 + v27, v27) + v25);
    long double v29 = fmod(a5 - v26, a18 - a17);
    fmod(v29 + v27, v27);
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)clampedCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (![(VKCameraRegionRestriction *)self isEmpty])
  {
    -[VKCameraRegionRestriction clampedPosition:usingSingleRestriction:westOfDatelineRestriction:eastOfDatelineRestriction:wrapRange:](self, "clampedPosition:usingSingleRestriction:westOfDatelineRestriction:eastOfDatelineRestriction:wrapRange:", var1, var0, self->_singleRestrictionCoord._minimum._e[0], self->_singleRestrictionCoord._minimum._e[1], self->_singleRestrictionCoord._maximum._e[0], self->_singleRestrictionCoord._maximum._e[1], *(void *)&self->_westOfDatelineCoord._minimum._e[0], *(void *)&self->_westOfDatelineCoord._minimum._e[1], *(void *)&self->_westOfDatelineCoord._maximum._e[0], *(void *)&self->_westOfDatelineCoord._maximum._e[1], *(void *)&self->_eastOfDatelineCoord._minimum._e[0], *(void *)&self->_eastOfDatelineCoord._minimum._e[1], *(void *)&self->_eastOfDatelineCoord._maximum._e[0], *(void *)&self->_eastOfDatelineCoord._maximum._e[1], 0xC066800000000000, 0x4066800000000000);
    double var1 = v6;
    double var0 = v7;
  }
  double v8 = var0;
  double v9 = var1;
  result.double var1 = v9;
  result.double var0 = v8;
  return result;
}

- (BOOL)containsCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ([(VKCameraRegionRestriction *)self isEmpty]) {
    return 1;
  }
  double v7 = self->_singleRestrictionCoord._maximum._e[0];
  double v8 = self->_singleRestrictionCoord._minimum._e[0];
  if (v7 >= v8
    && (double v9 = self->_singleRestrictionCoord._maximum._e[1], v10 = self->_singleRestrictionCoord._minimum._e[1], v9 >= v10))
  {
    BOOL v11 = var1 >= v8;
    if (var1 >= v7) {
      BOOL v11 = 0;
    }
    if (var0 < v10) {
      BOOL v11 = 0;
    }
    BOOL v12 = var0 < v9;
  }
  else
  {
    if (var1 >= self->_westOfDatelineCoord._minimum._e[0]
      && var1 < self->_westOfDatelineCoord._maximum._e[0]
      && var0 >= self->_westOfDatelineCoord._minimum._e[1]
      && var0 < self->_westOfDatelineCoord._maximum._e[1])
    {
      return 1;
    }
    if (var1 < self->_eastOfDatelineCoord._minimum._e[0]
      || var1 >= self->_eastOfDatelineCoord._maximum._e[0]
      || var0 < self->_eastOfDatelineCoord._minimum._e[1])
    {
      return 0;
    }
    BOOL v12 = var0 < self->_eastOfDatelineCoord._maximum._e[1];
    BOOL v11 = 1;
  }
  return v12 && v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end