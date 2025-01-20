@interface PVFaceDetection
+ (id)faceDetection:(int64_t)a3 :(BOOL)a4 :(double)a5 :(BOOL)a6 :(double)a7 :(CGRect)a8 :(int64_t)a9 :(id *)a10 :(id)a11;
+ (id)faceDetectionWithAngle:(int64_t)a3 :(BOOL)a4 :(double)a5 :(BOOL)a6 :(double)a7 :(CGRect)a8 :(double)a9 :(id *)a10 :(id)a11;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (AVMetadataFaceObject)faceObject;
- (BOOL)hasRollAngle;
- (BOOL)hasYawAngle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFaceDetection:(id)a3;
- (CGRect)boundingBox;
- (double)detectionHorizonAngle;
- (double)rollAngleInDegrees;
- (double)yawAngleInDegrees;
- (id)debugDescription;
- (id)description;
- (int64_t)ID;
- (int64_t)detectionOrientation;
@end

@implementation PVFaceDetection

+ (id)faceDetection:(int64_t)a3 :(BOOL)a4 :(double)a5 :(BOOL)a6 :(double)a7 :(CGRect)a8 :(int64_t)a9 :(id *)a10 :(id)a11
{
  unsigned int v12 = a9;
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  v22 = (AVMetadataFaceObject *)a11;
  v23 = objc_alloc_init(PVFaceDetection);
  v25 = v23;
  v23->_ID = a3;
  v23->_hasRollAngle = a4;
  v23->_hasYawAngle = a6;
  v23->_rollAngleInDegrees = a5;
  v23->_yawAngleInDegrees = a7;
  v23->_boundingBox.origin.CGFloat x = x;
  v23->_boundingBox.origin.CGFloat y = y;
  v23->_boundingBox.size.CGFloat width = width;
  v23->_boundingBox.size.CGFloat height = height;
  uint64_t v26 = (int)v12;
  if (v12 >= 5) {
    uint64_t v26 = 0;
  }
  LODWORD(v24) = PVCardinalAnglesDegrees[qword_1B7E73EA8[v26]];
  v23->_detectionHorizonAngle = (double)v24;
  long long v27 = *(_OWORD *)&a10->var0;
  v23->_time.epoch = a10->var3;
  *(_OWORD *)&v23->_time.value = v27;
  faceObject = v23->_faceObject;
  v23->_faceObject = v22;

  return v25;
}

+ (id)faceDetectionWithAngle:(int64_t)a3 :(BOOL)a4 :(double)a5 :(BOOL)a6 :(double)a7 :(CGRect)a8 :(double)a9 :(id *)a10 :(id)a11
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  v22 = (AVMetadataFaceObject *)a11;
  v23 = objc_alloc_init(PVFaceDetection);
  v23->_ID = a3;
  v23->_hasRollAngle = a4;
  v23->_hasYawAngle = a6;
  v23->_rollAngleInDegrees = a5;
  v23->_yawAngleInDegrees = a7;
  v23->_boundingBox.origin.CGFloat x = x;
  v23->_boundingBox.origin.CGFloat y = y;
  v23->_boundingBox.size.CGFloat width = width;
  v23->_boundingBox.size.CGFloat height = height;
  v23->_detectionHorizonAngle = a9;
  long long v24 = *(_OWORD *)&a10->var0;
  v23->_time.epoch = a10->var3;
  *(_OWORD *)&v23->_time.value = v24;
  faceObject = v23->_faceObject;
  v23->_faceObject = v22;

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PVFaceDetection *)self isEqualToFaceDetection:v4];

  return v5;
}

- (BOOL)isEqualToFaceDetection:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PVFaceDetection *)self ID];
  if (v5 != [v4 ID]) {
    goto LABEL_12;
  }
  int v6 = [(PVFaceDetection *)self hasRollAngle];
  if (v6 != [v4 hasRollAngle]) {
    goto LABEL_12;
  }
  if ([(PVFaceDetection *)self hasRollAngle])
  {
    [(PVFaceDetection *)self rollAngleInDegrees];
    double v8 = v7;
    [v4 rollAngleInDegrees];
    if (v8 != v9) {
      goto LABEL_12;
    }
  }
  int v10 = [(PVFaceDetection *)self hasYawAngle];
  if (v10 != [v4 hasYawAngle]) {
    goto LABEL_12;
  }
  if ([(PVFaceDetection *)self hasYawAngle])
  {
    [(PVFaceDetection *)self yawAngleInDegrees];
    double v12 = v11;
    [v4 yawAngleInDegrees];
    if (v12 != v13) {
      goto LABEL_12;
    }
  }
  [(PVFaceDetection *)self boundingBox];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [v4 boundingBox];
  v34.origin.CGFloat x = v22;
  v34.origin.CGFloat y = v23;
  v34.size.CGFloat width = v24;
  v34.size.CGFloat height = v25;
  v33.origin.CGFloat x = v15;
  v33.origin.CGFloat y = v17;
  v33.size.CGFloat width = v19;
  v33.size.CGFloat height = v21;
  if (!CGRectEqualToRect(v33, v34)) {
    goto LABEL_12;
  }
  [(PVFaceDetection *)self detectionHorizonAngle];
  double v27 = v26;
  [v4 detectionHorizonAngle];
  if (v27 == v28)
  {
    [(PVFaceDetection *)self time];
    if (v4) {
      [v4 time];
    }
    else {
      memset(&v31, 0, sizeof(v31));
    }
    BOOL v29 = CMTimeCompare(&time1, &v31) == 0;
  }
  else
  {
LABEL_12:
    BOOL v29 = 0;
  }

  return v29;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> ID=%llu rollAngle=%.1f bbox={{%.2f,%.2f},{%.2f,%.2f}}", objc_opt_class(), self, self->_ID, *(void *)&self->_rollAngleInDegrees, *(void *)&self->_boundingBox.origin.x, *(void *)&self->_boundingBox.origin.y, *(void *)&self->_boundingBox.size.width, *(void *)&self->_boundingBox.size.height];
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t ID = self->_ID;
  double rollAngleInDegrees = self->_rollAngleInDegrees;
  CGFloat x = self->_boundingBox.origin.x;
  CGFloat y = self->_boundingBox.origin.y;
  CGFloat width = self->_boundingBox.size.width;
  CGFloat height = self->_boundingBox.size.height;
  double detectionHorizonAngle = self->_detectionHorizonAngle;
  CMTime time = (CMTime)self->_time;
  double v12 = [v3 stringWithFormat:@"<%@ %p> ID=%llu rollAngle=%.1f° bbox={{%.2f,%.2f},{%.2f,%.2f}} orientation=%.1f° time=%f", v4, self, ID, *(void *)&rollAngleInDegrees, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height, *(void *)&detectionHorizonAngle, CMTimeGetSeconds(&time)];

  return v12;
}

- (int64_t)ID
{
  return self->_ID;
}

- (BOOL)hasRollAngle
{
  return self->_hasRollAngle;
}

- (double)rollAngleInDegrees
{
  return self->_rollAngleInDegrees;
}

- (BOOL)hasYawAngle
{
  return self->_hasYawAngle;
}

- (double)yawAngleInDegrees
{
  return self->_yawAngleInDegrees;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)detectionOrientation
{
  return self->_detectionOrientation;
}

- (double)detectionHorizonAngle
{
  return self->_detectionHorizonAngle;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (AVMetadataFaceObject)faceObject
{
  return self->_faceObject;
}

- (void).cxx_destruct
{
}

@end