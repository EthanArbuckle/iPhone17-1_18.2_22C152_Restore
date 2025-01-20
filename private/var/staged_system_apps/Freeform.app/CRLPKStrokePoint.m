@interface CRLPKStrokePoint
+ (CRLPKCompressedStrokePoint)compressStrokePoint:(SEL)a3 withTimestamp:(_CRLPKStrokePoint *)a4;
+ (_CRLPKStrokePoint)decompressStrokePoint:(SEL)a3 withTimestamp:(CRLPKCompressedStrokePoint *)a4;
- (BOOL)_hasEstimatedAzimuthAndAltitude;
- (BOOL)_hasEstimatedForce;
- (BOOL)_hasEstimatedLocation;
- (BOOL)_hasEstimatedVelocity;
- (CGPoint)location;
- (CRLPKStrokePoint)init;
- (CRLPKStrokePoint)initWithStroke:(id)a3 strokePoint:(void *)a4 inflight:(BOOL)a5;
- (double)_aspectRatio;
- (double)_edgeWidth;
- (double)_length;
- (double)_opacity;
- (double)_radius;
- (double)altitude;
- (double)azimuth;
- (double)force;
- (double)timestamp;
- (double)velocity;
- (id)_stringFromPoint:(CGPoint)a3;
- (id)description;
- (int64_t)_estimationUpdateIndex;
- (void)_setAspectRatio:(double)a3;
- (void)_setEdgeWidth:(double)a3;
- (void)_setEstimationUpdateIndex:(int64_t)a3;
- (void)_setHasEstimatedAzimuthAndAltitude:(BOOL)a3;
- (void)_setHasEstimatedForce:(BOOL)a3;
- (void)_setHasEstimatedLocation:(BOOL)a3;
- (void)_setHasEstimatedVelocity:(BOOL)a3;
- (void)_setLength:(double)a3;
- (void)_setOpacity:(double)a3;
- (void)_setRadius:(double)a3;
- (void)_strokePoint;
- (void)dealloc;
- (void)setAltitude:(double)a3;
- (void)setAzimuth:(double)a3;
- (void)setForce:(double)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CRLPKStrokePoint

+ (CRLPKCompressedStrokePoint)compressStrokePoint:(SEL)a3 withTimestamp:(_CRLPKStrokePoint *)a4
{
  float v7 = a4->timestamp - a5;
  retstr->var0 = v7;
  retstr->var1 = (_CRLPKPoint)vcvt_f32_f64((float64x2_t)a4->location);
  retstr->var2 = (int)sub_100407E48(a4->radius * 10.0, 0.0, 65535.0);
  retstr->var3 = (int)sub_100407E48(a4->aspectRatio * 1000.0, 0.0, 65535.0);
  retstr->var4 = (int)sub_100407E48(a4->edgeWidth * 10.0, 0.0, 65535.0);
  retstr->var5 = (int)sub_100407E48(a4->force * 1000.0, 0.0, 65535.0);
  sub_10007B558((uint64_t)retstr, a4->azimuth);
  retstr->var7 = (int)sub_100407E48(a4->altitude * 162.338042, 0.0, 255.0);
  retstr->var8 = (int)sub_100407E48(a4->opacity * 255.0, 0.0, 255.0);
  return result;
}

+ (_CRLPKStrokePoint)decompressStrokePoint:(SEL)a3 withTimestamp:(CRLPKCompressedStrokePoint *)a4
{
  retstr->timestamp = a4->var0 + a5;
  float64x2_t v6 = vcvtq_f64_f32((float32x2_t)a4->var1);
  retstr->location = (CGPoint)v6;
  LOWORD(v6.f64[0]) = a4->var2;
  unint64_t v7 = 10.0;
  v6.f64[0] = (double)*(unint64_t *)&v6.f64[0] / 10.0;
  LOWORD(v5) = a4->var3;
  retstr->radius = v6.f64[0];
  retstr->aspectRatio = (double)v5 / 1000.0;
  LOWORD(v6.f64[0]) = a4->var4;
  v6.f64[0] = (double)*(unint64_t *)&v6.f64[0] / 10.0;
  LOWORD(v7) = a4->var5;
  retstr->edgeWidth = v6.f64[0];
  retstr->force = (double)v7 / 1000.0;
  LOWORD(v6.f64[0]) = a4->var6;
  unint64_t v8 = 0x40C45F1C0E995AB9;
  v6.f64[0] = (double)*(unint64_t *)&v6.f64[0] / 10430.2192;
  LOBYTE(v8) = a4->var7;
  retstr->azimuth = v6.f64[0];
  retstr->altitude = (double)v8 / 162.338042;
  LOBYTE(v6.f64[0]) = a4->var8;
  retstr->opacity = (double)*(unint64_t *)&v6.f64[0] / 255.0;
  return result;
}

- (CRLPKStrokePoint)init
{
  v4.receiver = self;
  v4.super_class = (Class)CRLPKStrokePoint;
  v2 = [(CRLPKStrokePoint *)&v4 init];
  v2->_inflight = 1;
  v2->_pointOwned = 1;
  v2->_point = malloc_type_calloc(1uLL, 0x50uLL, 0x1000040BF3E2410uLL);
  return v2;
}

- (CRLPKStrokePoint)initWithStroke:(id)a3 strokePoint:(void *)a4 inflight:(BOOL)a5
{
  unint64_t v8 = (CRLPKStroke *)a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLPKStrokePoint;
  v9 = [(CRLPKStrokePoint *)&v12 init];
  v9->_inflight = a5;
  stroke = v9->_stroke;
  v9->_stroke = v8;

  v9->_pointOwned = 0;
  v9->_point = a4;
  return v9;
}

- (void)_strokePoint
{
  return self->_point;
}

- (void)setTimestamp:(double)a3
{
  point = self->_point;
  [(CRLPKStroke *)self->_stroke timestamp];
  *(float *)&double v5 = a3 - v5;
  _DWORD *point = LODWORD(v5);
}

- (double)timestamp
{
  point = (float *)self->_point;
  [(CRLPKStroke *)self->_stroke timestamp];
  return v3 + *point;
}

- (void)setLocation:(CGPoint)a3
{
  point = (float *)self->_point;
  float x = a3.x;
  float y = a3.y;
  point[1] = x;
  point[2] = y;
}

- (CGPoint)location
{
  point = (float *)self->_point;
  double v3 = point[1];
  double v4 = point[2];
  result.float y = v4;
  result.float x = v3;
  return result;
}

- (void)_setHasEstimatedLocation:(BOOL)a3
{
  if (self->_inflight) {
    *((unsigned char *)self->_point + 56) = a3;
  }
}

- (BOOL)_hasEstimatedLocation
{
  return self->_inflight && *((unsigned char *)self->_point + 56) != 0;
}

- (void)setForce:(double)a3
{
  point = self->_point;
  point[9] = (int)sub_100407E48(a3 * 1000.0, 0.0, 65535.0);
}

- (double)force
{
  LOWORD(v2) = *((_WORD *)self->_point + 9);
  return (double)v2 / 1000.0;
}

- (void)_setHasEstimatedForce:(BOOL)a3
{
  if (self->_inflight) {
    *((unsigned char *)self->_point + 57) = a3;
  }
}

- (BOOL)_hasEstimatedForce
{
  return self->_inflight && *((unsigned char *)self->_point + 57) != 0;
}

- (void)setAzimuth:(double)a3
{
}

- (double)azimuth
{
  LOWORD(v2) = *((_WORD *)self->_point + 10);
  return (double)v2 / 10430.2192;
}

- (void)setAltitude:(double)a3
{
  point = self->_point;
  point[22] = (int)sub_100407E48(a3 * 162.338042, 0.0, 255.0);
}

- (double)altitude
{
  LOBYTE(v2) = *((unsigned char *)self->_point + 22);
  return (double)v2 / 162.338042;
}

- (void)_setHasEstimatedAzimuthAndAltitude:(BOOL)a3
{
  if (self->_inflight) {
    *((unsigned char *)self->_point + 58) = a3;
  }
}

- (BOOL)_hasEstimatedAzimuthAndAltitude
{
  return self->_inflight && *((unsigned char *)self->_point + 58) != 0;
}

- (double)velocity
{
  return 0.0;
}

- (void)_setHasEstimatedVelocity:(BOOL)a3
{
  if (self->_inflight) {
    *((unsigned char *)self->_point + 59) = a3;
  }
}

- (BOOL)_hasEstimatedVelocity
{
  return self->_inflight && *((unsigned char *)self->_point + 59) != 0;
}

- (void)_setEstimationUpdateIndex:(int64_t)a3
{
  if (self->_inflight) {
    *((void *)self->_point + 8) = a3;
  }
}

- (int64_t)_estimationUpdateIndex
{
  if (self->_inflight) {
    return *((void *)self->_point + 8);
  }
  else {
    return -1;
  }
}

- (void)_setLength:(double)a3
{
  if (self->_inflight) {
    *((double *)self->_point + 9) = a3;
  }
}

- (double)_length
{
  if (self->_inflight) {
    return *((double *)self->_point + 9);
  }
  else {
    return 0.0;
  }
}

- (void)_setRadius:(double)a3
{
  if (!self->_inflight)
  {
    point = self->_point;
    point[6] = (int)sub_100407E48(a3 * 10.0, 0.0, 65535.0);
  }
}

- (double)_radius
{
  double result = 0.0;
  if (!self->_inflight)
  {
    LOWORD(result) = *((_WORD *)self->_point + 6);
    return (double)*(unint64_t *)&result / 10.0;
  }
  return result;
}

- (void)_setOpacity:(double)a3
{
  if (!self->_inflight)
  {
    point = self->_point;
    point[23] = (int)sub_100407E48(a3 * 255.0, 0.0, 255.0);
  }
}

- (double)_opacity
{
  double result = 0.0;
  if (!self->_inflight)
  {
    LOBYTE(result) = *((unsigned char *)self->_point + 23);
    return (double)*(unint64_t *)&result / 255.0;
  }
  return result;
}

- (void)_setEdgeWidth:(double)a3
{
  if (!self->_inflight)
  {
    point = self->_point;
    point[8] = (int)sub_100407E48(a3 * 10.0, 0.0, 65535.0);
  }
}

- (double)_edgeWidth
{
  double result = 0.0;
  if (!self->_inflight)
  {
    LOWORD(result) = *((_WORD *)self->_point + 8);
    return (double)*(unint64_t *)&result / 10.0;
  }
  return result;
}

- (void)_setAspectRatio:(double)a3
{
  if (!self->_inflight)
  {
    point = self->_point;
    point[7] = (int)sub_100407E48(a3 * 1000.0, 0.0, 65535.0);
  }
}

- (double)_aspectRatio
{
  double result = 0.0;
  if (!self->_inflight)
  {
    LOWORD(result) = *((_WORD *)self->_point + 7);
    return (double)*(unint64_t *)&result / 1000.0;
  }
  return result;
}

- (id)description
{
  BOOL inflight = self->_inflight;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  if (self->_inflight) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  if (inflight)
  {
    CFStringRef v41 = v6;
    [(CRLPKStrokePoint *)self location];
    unint64_t v7 = -[CRLPKStrokePoint _stringFromPoint:](self, "_stringFromPoint:");
    CFStringRef v8 = @"(estimated)";
    if ([(CRLPKStrokePoint *)self _hasEstimatedLocation]) {
      CFStringRef v9 = @"(estimated)";
    }
    else {
      CFStringRef v9 = &stru_101538650;
    }
    [(CRLPKStrokePoint *)self force];
    uint64_t v11 = v10;
    if ([(CRLPKStrokePoint *)self _hasEstimatedForce]) {
      CFStringRef v12 = @"(estimated)";
    }
    else {
      CFStringRef v12 = &stru_101538650;
    }
    [(CRLPKStrokePoint *)self azimuth];
    uint64_t v14 = v13;
    if ([(CRLPKStrokePoint *)self _hasEstimatedAzimuthAndAltitude]) {
      CFStringRef v15 = @"(estimated)";
    }
    else {
      CFStringRef v15 = &stru_101538650;
    }
    [(CRLPKStrokePoint *)self altitude];
    uint64_t v17 = v16;
    if ([(CRLPKStrokePoint *)self _hasEstimatedAzimuthAndAltitude]) {
      CFStringRef v18 = @"(estimated)";
    }
    else {
      CFStringRef v18 = &stru_101538650;
    }
    [(CRLPKStrokePoint *)self velocity];
    uint64_t v20 = v19;
    if (![(CRLPKStrokePoint *)self _hasEstimatedVelocity]) {
      CFStringRef v8 = &stru_101538650;
    }
    int64_t v21 = [(CRLPKStrokePoint *)self _estimationUpdateIndex];
    [(CRLPKStrokePoint *)self _length];
    uint64_t v23 = +[NSString stringWithFormat:@"%@: %p\n\tinflight: %@\n\tlocation: %@ %@\n\tforce: %f %@\n\tazimuth: %f %@\n\taltitude: %f %@\n\tvelocity: %f %@\n\testimationUpdateIndex: %d\n\tlength: %f\n", v5, self, v41, v7, v9, v11, v12, v14, v15, v17, v18, v20, v8, v21, v22];
  }
  else
  {
    [(CRLPKStrokePoint *)self location];
    unint64_t v7 = -[CRLPKStrokePoint _stringFromPoint:](self, "_stringFromPoint:");
    [(CRLPKStrokePoint *)self force];
    uint64_t v25 = v24;
    [(CRLPKStrokePoint *)self azimuth];
    uint64_t v27 = v26;
    [(CRLPKStrokePoint *)self altitude];
    uint64_t v29 = v28;
    [(CRLPKStrokePoint *)self velocity];
    uint64_t v31 = v30;
    [(CRLPKStrokePoint *)self _radius];
    uint64_t v33 = v32;
    [(CRLPKStrokePoint *)self _opacity];
    uint64_t v35 = v34;
    [(CRLPKStrokePoint *)self _edgeWidth];
    uint64_t v37 = v36;
    [(CRLPKStrokePoint *)self _aspectRatio];
    uint64_t v23 = +[NSString stringWithFormat:@"%@: %p\n\tinflight: %@\n\tlocation: %@\n\tforce: %f\n\tazimuth: %f\n\taltitude: %f\n\tvelocity: %f\n\tradius: %f\n\topacity: %f\n\tedgeWidth: %f\n\taspectRatio: %f\n", v5, self, v6, v7, v25, v27, v29, v31, v33, v35, v37, v38];
  }
  v39 = (void *)v23;

  return v39;
}

- (id)_stringFromPoint:(CGPoint)a3
{
  [(CRLPKStrokePoint *)self location];

  return NSStringFromCGPoint(*(CGPoint *)&v3);
}

- (void)dealloc
{
  if (self->_pointOwned)
  {
    free(self->_point);
    self->_point = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLPKStrokePoint;
  [(CRLPKStrokePoint *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end