@interface CRImageSpaceQuad
+ (BOOL)supportsSecureCoding;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)entirelyContainsQuad:(id)a3;
- (BOOL)hasIntersectingEdges;
- (BOOL)intersectsImageMargin:(double)a3 imageSize:(CGSize)a4;
- (BOOL)intersectsQuad:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)overlapsQuad:(id)a3;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)midPoint;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)boundingBox;
- (CGSize)size;
- (CRImageSpaceQuad)applyHomographyTransform:(float32x4_t)a3 downscaleRate:(float32x4_t)a4;
- (CRImageSpaceQuad)initWithBoundingBox:(CGRect)a3;
- (CRImageSpaceQuad)initWithCRCodableDataRepresentation:(id)a3;
- (CRImageSpaceQuad)initWithCoder:(id)a3;
- (CRImageSpaceQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6;
- (NSString)description;
- (double)area;
- (double)aspectRatio;
- (double)baselineAngle;
- (double)boundingBoxIOUWithQuad:(id)a3;
- (double)orthogonalityScore;
- (double)shortestDistanceFromCornersOfQuad:(id)a3;
- (double)shortestDistanceFromPoint:(CGPoint)a3;
- (double)squaredDistanceFromCorrespondingCornersOfQuad:(id)a3;
- (double)squaredDistanceMaxRatioFromCorrespondingCornersOfQuad:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cornerAngles;
- (id)crCodableDataRepresentation;
- (id)normalizedQuadForImageSize:(CGSize)a3;
- (id)rotated180;
- (id)rotatedAroundPoint:(CGPoint)a3 angle:(float)a4;
- (id)scaledBy:(CGPoint)a3 offset:(CGPoint)a4;
- (id)unionWithQuad:(id)a3 baselineAngle:(float)a4;
- (uint64_t)linesIntersectLine1P1:(double)a3 line1P2:(double)a4 line2P1:(double)a5 line2P2:(double)a6;
- (void)encodeWithCoder:(id)a3;
- (void)homographyFromSelfToQuad:(void *)a3;
@end

@implementation CRImageSpaceQuad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRImageSpaceQuad)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRQuadData"];
  int64_t v6 = [v4 decodeIntegerForKey:@"CRQuadUncompressedDataSize"];

  v7 = uncompressDataOfSize(v5, v6);
  v8 = [(CRImageSpaceQuad *)self initWithCRCodableDataRepresentation:v7];

  return v8;
}

- (CRImageSpaceQuad)applyHomographyTransform:(float32x4_t)a3 downscaleRate:(float32x4_t)a4
{
  *(double *)&uint64_t v5 = a5;
  float64x2_t v6 = (float64x2_t)vdupq_lane_s64(v5, 0);
  float64x2_t v7 = vdivq_f64(*(float64x2_t *)(a1 + 8), v6);
  float v8 = v7.f64[0];
  float v9 = v7.f64[1];
  int32x4_t v10 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(vmulq_n_f32(a2, v8), a3, v9));
  if (*(float *)&v10.i32[2] != 0.0) {
    float64x2_t v7 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_laneq_s32(v10, 2)));
  }
  float64x2_t v11 = vdivq_f64(*(float64x2_t *)(a1 + 24), v6);
  float v12 = v11.f64[0];
  float v13 = v11.f64[1];
  int32x4_t v14 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(vmulq_n_f32(a2, v12), a3, v13));
  if (*(float *)&v14.i32[2] != 0.0) {
    float64x2_t v11 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v14.i8, (float32x2_t)vdup_laneq_s32(v14, 2)));
  }
  float64x2_t v15 = vdivq_f64(*(float64x2_t *)(a1 + 56), v6);
  float v16 = v15.f64[0];
  float v17 = v15.f64[1];
  int32x4_t v18 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(vmulq_n_f32(a2, v16), a3, v17));
  if (*(float *)&v18.i32[2] != 0.0) {
    float64x2_t v15 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_laneq_s32(v18, 2)));
  }
  float64x2_t v19 = vdivq_f64(*(float64x2_t *)(a1 + 40), v6);
  float v20 = v19.f64[0];
  float v21 = v19.f64[1];
  int32x4_t v22 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(vmulq_n_f32(a2, v20), a3, v21));
  if (*(float *)&v22.i32[2] != 0.0) {
    float64x2_t v19 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v22.i8, (float32x2_t)vdup_laneq_s32(v22, 2)));
  }
  v23 = [[CRImageSpaceQuad alloc] initWithTopLeft:vmulq_n_f64(v7, *(double *)&v5) topRight:vmulq_n_f64(v11, *(double *)&v5) bottomRight:vmulq_n_f64(v19, *(double *)&v5) bottomLeft:vmulq_n_f64(v15, *(double *)&v5)];
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(CRImageSpaceQuad *)self crCodableDataRepresentation];
  uint64_t v5 = compressData(v6);
  [v4 encodeObject:v5 forKey:@"CRQuadData"];
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v6, "length"), @"CRQuadUncompressedDataSize");
}

- (CRImageSpaceQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)CRImageSpaceQuad;
  result = [(CRImageSpaceQuad *)&v15 init];
  if (result)
  {
    result->_topLeft.CGFloat x = v13;
    result->_topLeft.CGFloat y = v12;
    result->_topRight.CGFloat x = v11;
    result->_topRight.CGFloat y = v10;
    result->_bottomRight.CGFloat x = v9;
    result->_bottomRight.CGFloat y = v8;
    result->_bottomLeft.CGFloat x = x;
    result->_bottomLeft.CGFloat y = y;
  }
  return result;
}

- (CRImageSpaceQuad)initWithBoundingBox:(CGRect)a3
{
  return -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](self, "initWithTopLeft:topRight:bottomRight:bottomLeft:", a3.origin.x, a3.origin.y, a3.origin.x + a3.size.width, a3.origin.y, a3.origin.x + a3.size.width, a3.origin.y + a3.size.height, a3.origin.x, a3.origin.y + a3.size.height);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"{(%.2f %.2f), (%.2f %.2f), (%.2f %.2f), (%.2f %.2f)}", *(void *)&self->_topLeft.x, *(void *)&self->_topLeft.y, *(void *)&self->_topRight.x, *(void *)&self->_topRight.y, *(void *)&self->_bottomRight.x, *(void *)&self->_bottomRight.y, *(void *)&self->_bottomLeft.x, *(void *)&self->_bottomLeft.y];
}

- (CGRect)boundingBox
{
  uint64_t v2 = 0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CGPoint topRight = self->_topRight;
  v14[0] = self->_topLeft;
  v14[1] = topRight;
  CGPoint bottomLeft = self->_bottomLeft;
  v14[2] = self->_bottomRight;
  v14[3] = bottomLeft;
  double v5 = *((double *)v14 + 1);
  unsigned long long v9 = v14[0];
  *(void *)&double v8 = v9 >> 64;
  *(void *)&double v6 = v9;
  double v7 = *(double *)v14;
  do
  {
    double v10 = *(double *)&v14[v2 + 1];
    double v11 = *((double *)&v14[v2 + 1] + 1);
    if (v6 >= v10) {
      double v6 = *(double *)&v14[v2 + 1];
    }
    if (v7 < v10) {
      double v7 = *(double *)&v14[v2 + 1];
    }
    if (v5 >= v11) {
      double v5 = *((double *)&v14[v2 + 1] + 1);
    }
    if (v8 < v11) {
      double v8 = *((double *)&v14[v2 + 1] + 1);
    }
    ++v2;
  }
  while (v2 != 3);
  double v12 = v7 - v6;
  double v13 = v8 - v5;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v6;
  return result;
}

- (CGSize)size
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  double v4 = self->_bottomLeft.x;
  double v5 = self->_bottomLeft.y;
  double v6 = self->_topRight.x;
  double v7 = self->_topRight.y;
  double v8 = self->_bottomRight.x;
  double v9 = self->_bottomRight.y;
  float v10 = (x + v4 - v6 - v8) * 0.5;
  float v11 = (y + v5 - v7 - v9) * 0.5;
  float v12 = (v4 + v8 - x - v6) * 0.5;
  float v13 = (v5 + v9 - y - v7) * 0.5;
  BOOL v14 = v11 == 0.0 && v10 == 0.0;
  double v15 = sqrtf((float)(v11 * v11) + (float)(v10 * v10));
  if (v14) {
    double v15 = 0.0;
  }
  BOOL v16 = v13 == 0.0 && v12 == 0.0;
  double v17 = sqrtf((float)(v13 * v13) + (float)(v12 * v12));
  if (v16) {
    double v17 = 0.0;
  }
  result.height = v17;
  result.width = v15;
  return result;
}

- (double)area
{
  return fabs((self->_topRight.x - self->_topLeft.x) * (self->_bottomLeft.y - self->_topLeft.y)- (self->_topRight.y - self->_topLeft.y) * (self->_bottomLeft.x - self->_topLeft.x))* 0.5+ fabs((self->_topRight.x - self->_bottomRight.x) * (self->_bottomLeft.y - self->_bottomRight.y)- (self->_topRight.y - self->_bottomRight.y) * (self->_bottomLeft.x - self->_bottomRight.x))* 0.5;
}

- (double)aspectRatio
{
  [(CRImageSpaceQuad *)self size];
  double v4 = v3 / v2;
  BOOL v5 = v2 == 0.0;
  double result = 0.0;
  if (!v5) {
    return v4;
  }
  return result;
}

- (double)baselineAngle
{
  return -atan2(self->_bottomRight.y - self->_bottomLeft.y, self->_bottomRight.x - self->_bottomLeft.x);
}

- (CGPoint)midPoint
{
  [(CRImageSpaceQuad *)self boundingBox];
  double v4 = v3 + v2 * 0.5;
  double v7 = v6 + v5 * 0.5;
  result.double y = v7;
  result.double x = v4;
  return result;
}

- (id)rotated180
{
  double v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTopLeft:topRight:bottomRight:bottomLeft:", self->_bottomRight.x, self->_bottomRight.y, self->_bottomLeft.x, self->_bottomLeft.y, self->_topLeft.x, self->_topLeft.y, self->_topRight.x, self->_topRight.y);
  return v2;
}

- (id)normalizedQuadForImageSize:(CGSize)a3
{
  double v3 = -[CRNormalizedQuad initWithDenormalizedQuad:size:]([CRNormalizedQuad alloc], "initWithDenormalizedQuad:size:", self, a3.width, a3.height);
  return v3;
}

- (id)rotatedAroundPoint:(CGPoint)a3 angle:(float)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = self->_topLeft.x;
  double v8 = self->_topLeft.y;
  __double2 v9 = __sincos_stret(a4);
  float v10 = (v7 - x) * v9.__cosval - (v8 - y) * v9.__sinval;
  float v11 = v9.__cosval * (v8 - y) + (v7 - x) * v9.__sinval;
  double v12 = x + v10;
  double v13 = y + v11;
  CGFloat v14 = self->_topRight.x - x;
  CGFloat v15 = self->_topRight.y - y;
  float v16 = v14 * v9.__cosval - v15 * v9.__sinval;
  *(float *)&CGFloat v14 = v9.__cosval * v15 + v14 * v9.__sinval;
  double v17 = x + v16;
  double v18 = y + *(float *)&v14;
  CGFloat v19 = self->_bottomRight.x - x;
  CGFloat v20 = self->_bottomRight.y - y;
  float v21 = v19 * v9.__cosval - v20 * v9.__sinval;
  *(float *)&CGFloat v19 = v9.__cosval * v20 + v19 * v9.__sinval;
  double v22 = x + v21;
  double v23 = y + *(float *)&v19;
  CGFloat v24 = self->_bottomLeft.x - x;
  CGFloat v25 = self->_bottomLeft.y - y;
  float v26 = v24 * v9.__cosval - v25 * v9.__sinval;
  float v27 = v9.__cosval * v25 + v24 * v9.__sinval;
  v28 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v12, v13, v17, v18, v22, v23, x + v26, y + v27);
  return v28;
}

- (id)scaledBy:(CGPoint)a3 offset:(CGPoint)a4
{
  double v4 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", a4.x + self->_topLeft.x * a3.x, a4.y + self->_topLeft.y * a3.y, a4.x + self->_topRight.x * a3.x, a4.y + self->_topRight.y * a3.y, a4.x + self->_bottomRight.x * a3.x, a4.y + self->_bottomRight.y * a3.y, a4.x + self->_bottomLeft.x * a3.x, a4.y + self->_bottomLeft.y * a3.y);
  return v4;
}

- (id)unionWithQuad:(id)a3 baselineAngle:(float)a4
{
  id v6 = a3;
  [(CRImageSpaceQuad *)self boundingBox];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 boundingBox];
  v63.origin.double x = v15;
  v63.origin.double y = v16;
  v63.size.width = v17;
  v63.size.height = v18;
  v61.origin.double x = v8;
  v61.origin.double y = v10;
  v61.size.width = v12;
  v61.size.height = v14;
  CGRect v62 = CGRectUnion(v61, v63);
  v62.size.width = v62.size.width * 0.5;
  double v20 = v62.origin.y + v62.size.height * 0.5;
  double v19 = v62.origin.x + v62.size.width;
  float v59 = a4;
  *(float *)&v62.size.width = a4;
  float v21 = -[CRImageSpaceQuad rotatedAroundPoint:angle:](self, "rotatedAroundPoint:angle:", v19, v20, v62.size.width);
  *(float *)&double v22 = a4;
  double v23 = objc_msgSend(v6, "rotatedAroundPoint:angle:", v19, v20, v22);

  [v23 bottomLeft];
  double v25 = v24;
  [v21 bottomLeft];
  double v27 = v26;
  [v21 topLeft];
  double v29 = v28;
  [v23 topLeft];
  if (v29 < v30) {
    double v30 = v29;
  }
  if (v27 < v30) {
    double v30 = v27;
  }
  if (v25 >= v30) {
    double v25 = v30;
  }
  [v23 topLeft];
  double v32 = v31;
  [v21 topLeft];
  double v34 = v33;
  [v21 topRight];
  double v36 = v35;
  [v23 topRight];
  if (v36 >= v37) {
    double v38 = v37;
  }
  else {
    double v38 = v36;
  }
  if (v34 < v38) {
    double v38 = v34;
  }
  if (v32 >= v38) {
    double v32 = v38;
  }
  [v23 bottomRight];
  double v40 = v39;
  [v21 bottomRight];
  double v42 = v41;
  [v21 topRight];
  double v44 = v43;
  [v23 topRight];
  if (v44 >= v45) {
    double v45 = v44;
  }
  if (v42 >= v45) {
    double v45 = v42;
  }
  if (v40 < v45) {
    double v40 = v45;
  }
  [v23 bottomLeft];
  double v47 = v46;
  [v21 bottomLeft];
  double v49 = v48;
  [v21 bottomRight];
  double v51 = v50;
  [v23 bottomRight];
  if (v51 >= v52) {
    double v53 = v51;
  }
  else {
    double v53 = v52;
  }
  if (v49 >= v53) {
    double v53 = v49;
  }
  if (v47 >= v53) {
    double v54 = v47;
  }
  else {
    double v54 = v53;
  }
  v55 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v25, v32, v40, v32, v40, v54, v25, v54);
  *(float *)&double v56 = -v59;
  v57 = -[CRImageSpaceQuad rotatedAroundPoint:angle:](v55, "rotatedAroundPoint:angle:", v19, v20, v56);

  return v57;
}

- (double)boundingBoxIOUWithQuad:(id)a3
{
  id v4 = a3;
  [(CRImageSpaceQuad *)self boundingBox];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 boundingBox];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v24.origin.double x = v6;
  v24.origin.double y = v8;
  v24.size.double width = v10;
  v24.size.double height = v12;
  v27.origin.double x = v14;
  v27.origin.double y = v16;
  v27.size.double width = v18;
  v27.size.double height = v20;
  CGRect v25 = CGRectUnion(v24, v27);
  double height = v25.size.height;
  double width = v25.size.width;
  v25.origin.double x = v6;
  v25.origin.double y = v8;
  v25.size.double width = v10;
  v25.size.double height = v12;
  v28.origin.double x = v14;
  v28.origin.double y = v16;
  v28.size.double width = v18;
  v28.size.double height = v20;
  CGRect v26 = CGRectIntersection(v25, v28);
  return v26.size.width * v26.size.height / (width * height + 1.0e-23);
}

- (BOOL)overlapsQuad:(id)a3
{
  v39[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = self;
  [(CRImageSpaceQuad *)v5 topLeft];
  v39[0] = v6;
  v39[1] = v7;
  [(CRImageSpaceQuad *)v5 topRight];
  v39[2] = v8;
  v39[3] = v9;
  [(CRImageSpaceQuad *)v5 bottomRight];
  v39[4] = v10;
  v39[5] = v11;
  [(CRImageSpaceQuad *)v5 bottomLeft];
  v39[6] = v12;
  v39[7] = v13;
  [v4 topLeft];
  objc_msgSend(v4, "topRight", v14, v15);
  v38[1] = v16;
  v38[2] = v17;
  [v4 bottomRight];
  v38[3] = v18;
  v38[4] = v19;
  [v4 bottomLeft];
  uint64_t v20 = 0;
  v38[5] = v21;
  v38[6] = v22;
  do
  {
    if (-[CRImageSpaceQuad containsPoint:](v5, "containsPoint:", *(double *)&v38[v20 - 1], *(double *)&v38[v20])
      || (objc_msgSend(v4, "containsPoint:", *(double *)&v39[v20], *(double *)&v39[v20 + 1]) & 1) != 0)
    {
      char v35 = 1;
      goto LABEL_13;
    }
    v20 += 2;
  }
  while (v20 != 8);
  unint64_t v23 = 0;
  BOOL v24 = 1;
  do
  {
    unint64_t v25 = v23;
    CGRect v26 = (double *)&v39[2 * v23];
    double v27 = *v26;
    double v28 = v26[1];
    double v29 = (double *)&v39[2 * (++v23 & 3)];
    double v30 = *v29;
    double v31 = v29[1];
    uint64_t v32 = 1;
    double v33 = (double *)v38;
    while (v32 != 5)
    {
      int v34 = -[CRImageSpaceQuad linesIntersectLine1P1:line1P2:line2P1:line2P2:]((uint64_t)v5, v27, v28, v30, v31, *(v33 - 1), *v33, *(double *)&v38[2 * (v32 & 3) - 1], *(double *)&v38[2 * (v32 & 3)]);
      v33 += 2;
      ++v32;
      if (v34)
      {
        char v35 = v24;
        goto LABEL_13;
      }
    }
    char v35 = 0;
    BOOL v24 = v25 < 3;
  }
  while (v23 != 4);
LABEL_13:

  return v35 & 1;
}

- (uint64_t)linesIntersectLine1P1:(double)a3 line1P2:(double)a4 line2P1:(double)a5 line2P2:(double)a6
{
  if (result)
  {
    double v9 = (a9 - a7) * (a2 - a8) - (a8 - a6) * (a3 - a9);
    double v10 = (a9 - a7) * (a4 - a8) - (a8 - a6) * (a5 - a9);
    int v11 = (v9 > 0.0) ^ (v10 <= 0.0);
    if (v10 == 0.0) {
      int v11 = 0;
    }
    double v12 = (a5 - a3) * (a6 - a4) - (a4 - a2) * (a7 - a5);
    double v13 = (a5 - a3) * (a8 - a4) - (a4 - a2) * (a9 - a5);
    if (v9 == 0.0) {
      int v11 = v10 == 0.0;
    }
    char v14 = (v12 > 0.0) ^ (v13 <= 0.0);
    if (v13 == 0.0) {
      char v14 = 0;
    }
    if (v12 == 0.0) {
      char v14 = v13 == 0.0;
    }
    if ((v14 & 1) == 0 && !v11) {
      return 1;
    }
    if (v12 == 0.0)
    {
      double v15 = a2 >= a4 ? a2 : a4;
      double v16 = a2 >= a4 ? a4 : a2;
      if (a6 <= v15 && a6 >= v16)
      {
        double v17 = a3 >= a5 ? a3 : a5;
        double v18 = a3 >= a5 ? a5 : a3;
        if (a7 <= v17 && a7 >= v18) {
          return 1;
        }
      }
    }
    if (v13 == 0.0)
    {
      double v19 = a2 >= a4 ? a2 : a4;
      double v20 = a2 >= a4 ? a4 : a2;
      if (a8 <= v19 && a8 >= v20)
      {
        double v21 = a3 >= a5 ? a3 : a5;
        double v22 = a3 >= a5 ? a5 : a3;
        if (a9 <= v21 && a9 >= v22) {
          return 1;
        }
      }
    }
    if (v9 == 0.0)
    {
      double v23 = a6 >= a8 ? a6 : a8;
      double v24 = a6 >= a8 ? a8 : a6;
      if (a2 <= v23 && a2 >= v24)
      {
        double v25 = a7 >= a9 ? a7 : a9;
        double v26 = a7 >= a9 ? a9 : a7;
        if (a3 <= v25 && a3 >= v26) {
          return 1;
        }
      }
    }
    if (v10 == 0.0
      && (a6 >= a8 ? (double v27 = a6) : (double v27 = a8),
          a6 >= a8 ? (double v28 = a8) : (double v28 = a6),
          a4 <= v27
       && a4 >= v28
       && (a7 >= a9 ? (double v29 = a7) : (double v29 = a9), a7 >= a9 ? (v30 = a9) : (v30 = a7), a5 <= v29 && a5 >= v30)))
    {
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (double)shortestDistanceFromCornersOfQuad:(id)a3
{
  v17[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 topLeft];
  v17[0] = v5;
  v17[1] = v6;
  [v4 topRight];
  v17[2] = v7;
  v17[3] = v8;
  [v4 bottomRight];
  v17[4] = v9;
  v17[5] = v10;
  [v4 bottomLeft];
  uint64_t v11 = 0;
  v17[6] = v12;
  v17[7] = v13;
  double v14 = 1.79769313e308;
  do
  {
    -[CRImageSpaceQuad shortestDistanceFromPoint:](self, "shortestDistanceFromPoint:", *(double *)&v17[v11], *(double *)&v17[v11 + 1]);
    if (v14 >= v15) {
      double v14 = v15;
    }
    v11 += 2;
  }
  while (v11 != 8);

  return v14;
}

- (double)squaredDistanceFromCorrespondingCornersOfQuad:(id)a3
{
  v24[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 topLeft];
  v24[0] = v5;
  v24[1] = v6;
  [v4 topRight];
  v24[2] = v7;
  v24[3] = v8;
  [v4 bottomRight];
  v24[4] = v9;
  v24[5] = v10;
  [v4 bottomLeft];
  unint64_t v11 = 0;
  v24[6] = v12;
  v24[7] = v13;
  CGPoint topRight = self->_topRight;
  v23[0] = self->_topLeft;
  v23[1] = topRight;
  CGPoint bottomLeft = self->_bottomLeft;
  v23[2] = self->_bottomRight;
  v23[3] = bottomLeft;
  double v16 = 0.0;
  do
  {
    float64x2_t v17 = vsubq_f64(*(float64x2_t *)&v24[v11 / 8], (float64x2_t)v23[v11 / 0x10]);
    float64x2_t v18 = vsubq_f64(*(float64x2_t *)&v24[v11 / 8 + 2], (float64x2_t)v23[v11 / 0x10 + 1]);
    int64x2_t v19 = (int64x2_t)vmulq_f64(v18, v18);
    int64x2_t v20 = (int64x2_t)vmulq_f64(v17, v17);
    float64x2_t v21 = vaddq_f64((float64x2_t)vzip1q_s64(v20, v19), (float64x2_t)vzip2q_s64(v20, v19));
    double v16 = v16 + v21.f64[0] + v21.f64[1];
    v11 += 32;
  }
  while (v11 != 64);

  return v16;
}

- (double)squaredDistanceMaxRatioFromCorrespondingCornersOfQuad:(id)a3
{
  v22[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 topLeft];
  v22[0] = v5;
  v22[1] = v6;
  [v4 topRight];
  v22[2] = v7;
  v22[3] = v8;
  [v4 bottomRight];
  v22[4] = v9;
  v22[5] = v10;
  [v4 bottomLeft];
  unint64_t v11 = 0;
  v22[6] = v12;
  v22[7] = v13;
  CGPoint topRight = self->_topRight;
  v21[0] = self->_topLeft;
  v21[1] = topRight;
  CGPoint bottomLeft = self->_bottomLeft;
  v21[2] = self->_bottomRight;
  v21[3] = bottomLeft;
  double v16 = 1.79769313e308;
  double v17 = 2.22507386e-308;
  do
  {
    float64x2_t v18 = vsubq_f64(*(float64x2_t *)&v22[v11 / 8], (float64x2_t)v21[v11 / 0x10]);
    double v19 = vaddvq_f64(vmulq_f64(v18, v18));
    if (v19 > v17) {
      double v17 = v19;
    }
    if (v19 < v16) {
      double v16 = v19;
    }
    v11 += 16;
  }
  while (v11 != 64);

  return v17 / v16;
}

- (double)shortestDistanceFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[CRImageSpaceQuad containsPoint:](self, "containsPoint:", a3.x, a3.y, *(void *)&self->_topLeft.x, *(void *)&self->_topLeft.y, *(void *)&self->_topRight.x, *(void *)&self->_topRight.y, *(void *)&self->_bottomRight.x, *(void *)&self->_bottomRight.y, *(void *)&self->_bottomLeft.x, *(void *)&self->_bottomLeft.y);
  double result = 0.0;
  if (!v5)
  {
    uint64_t v7 = (double *)&v26 + 1;
    double result = 1.79769313e308;
    for (uint64_t i = 1; i != 5; ++i)
    {
      double v9 = *(v7 - 1);
      uint64_t v10 = (double *)(&v26 + (i & 3));
      double v11 = v10[1];
      double v12 = *v10 - v9;
      double v13 = y - *v7;
      double v14 = v11 - *v7;
      double v15 = v13 * v14 + (x - v9) * v12;
      double v16 = v13 * v13 + (x - v9) * (x - v9);
      double v17 = v14 * v14 + v12 * v12;
      *(float *)&double v16 = v16;
      double v18 = (y - v11) * (y - v11) + (x - *v10) * (x - *v10);
      double v19 = v15 / v17;
      *(float *)&double v18 = v18;
      float v20 = sqrtf(*(float *)&v16);
      float v21 = sqrtf(*(float *)&v18);
      if (*(float *)&v16 >= *(float *)&v18) {
        float v22 = v21;
      }
      else {
        float v22 = v20;
      }
      float v23 = ((*v7 - y) * v12 - (v9 - x) * v14) / v17;
      double v24 = sqrt(v17) * fabsf(v23);
      if (v19 < 0.0 || v19 > 1.0) {
        double v24 = v22;
      }
      if (result >= v24) {
        double result = v24;
      }
      v7 += 2;
    }
  }
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRImageSpaceQuad *)self midPoint];
  double v8 = v7;
  double v10 = v9;
  if (self)
  {
    float v11 = atan2(self->_topRight.y - self->_topLeft.y, self->_topRight.x - self->_topLeft.x);
    float v12 = atan2(self->_bottomRight.y - self->_bottomLeft.y, self->_bottomRight.x - self->_bottomLeft.x);
    float v13 = (float)((float)-v12 - v11) * 0.5;
  }
  else
  {
    float v13 = 0.0;
  }
  *(float *)&double v6 = v13;
  double v14 = -[CRImageSpaceQuad rotatedAroundPoint:angle:](self, "rotatedAroundPoint:angle:", v8, v10, v6);
  __double2 v15 = __sincos_stret(v13);
  float v16 = (x - v8) * v15.__cosval - (y - v10) * v15.__sinval;
  float v17 = (y - v10) * v15.__cosval + (x - v8) * v15.__sinval;
  double v18 = v8 + v16;
  double v19 = v10 + v17;
  [v14 boundingBox];
  v22.double x = v18;
  v22.double y = v19;
  if (CGRectContainsPoint(v23, v22))
  {
    BOOL v20 = 1;
  }
  else
  {
    [v14 boundingBox];
    v25.size.double width = 1.0;
    v25.size.double height = 1.0;
    v25.origin.double x = v18 + -0.5;
    v25.origin.double y = v19 + -0.5;
    BOOL v20 = CGRectIntersectsRect(v24, v25);
  }

  return v20;
}

- (id)cornerAngles
{
  v53[4] = *MEMORY[0x1E4F143B8];
  double v3 = NSNumber;
  [(CRImageSpaceQuad *)self bottomLeft];
  double v5 = v4;
  double v7 = v6;
  [(CRImageSpaceQuad *)self topLeft];
  double v9 = v8;
  double v11 = v10;
  [(CRImageSpaceQuad *)self topRight];
  double v14 = objc_msgSend(v3, "numberWithDouble:", angleBetweenPoints(v5, v7, v9, v11, v12, v13));
  v53[0] = v14;
  __double2 v15 = NSNumber;
  [(CRImageSpaceQuad *)self topLeft];
  double v17 = v16;
  double v19 = v18;
  [(CRImageSpaceQuad *)self topRight];
  double v21 = v20;
  double v23 = v22;
  [(CRImageSpaceQuad *)self bottomRight];
  long long v26 = objc_msgSend(v15, "numberWithDouble:", angleBetweenPoints(v17, v19, v21, v23, v24, v25));
  v53[1] = v26;
  uint64_t v27 = NSNumber;
  [(CRImageSpaceQuad *)self topRight];
  double v29 = v28;
  double v31 = v30;
  [(CRImageSpaceQuad *)self bottomRight];
  double v33 = v32;
  double v35 = v34;
  [(CRImageSpaceQuad *)self bottomLeft];
  double v38 = objc_msgSend(v27, "numberWithDouble:", angleBetweenPoints(v29, v31, v33, v35, v36, v37));
  v53[2] = v38;
  double v39 = NSNumber;
  [(CRImageSpaceQuad *)self bottomRight];
  double v41 = v40;
  double v43 = v42;
  [(CRImageSpaceQuad *)self bottomLeft];
  double v45 = v44;
  double v47 = v46;
  [(CRImageSpaceQuad *)self topLeft];
  double v50 = objc_msgSend(v39, "numberWithDouble:", angleBetweenPoints(v41, v43, v45, v47, v48, v49));
  v53[3] = v50;
  double v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];

  return v51;
}

- (double)orthogonalityScore
{
  double v2 = [(CRImageSpaceQuad *)self cornerAngles];
  double v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  double v4 = [v3 objectAtIndexedSubscript:0];
  [v4 doubleValue];
  double v6 = v5;
  double v7 = [v3 objectAtIndexedSubscript:3];
  [v7 doubleValue];
  double v9 = v6 / v8;

  return v9;
}

- (BOOL)hasIntersectingEdges
{
  double x = self->_bottomLeft.x;
  double y = self->_bottomLeft.y;
  double v5 = self->_bottomRight.x;
  double v6 = self->_bottomRight.y;
  double v7 = self->_topLeft.x;
  double v8 = self->_topLeft.y;
  double v9 = self->_topRight.x;
  double v10 = self->_topRight.y;
  if (-[CRImageSpaceQuad linesIntersectLine1P1:line1P2:line2P1:line2P2:]((uint64_t)self, x, y, v5, v6, v7, v8, v9, v10)) {
    return 1;
  }
  return -[CRImageSpaceQuad linesIntersectLine1P1:line1P2:line2P1:line2P2:]((uint64_t)self, x, y, v7, v8, v5, v6, v9, v10);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (CRImageSpaceQuad *)a3;
  if (v4 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(CRImageSpaceQuad *)v5 topLeft];
      double v8 = vabdd_f64(self->_topLeft.y, v7);
      BOOL v9 = vabdd_f64(self->_topLeft.x, v6) > 0.5 || v8 > 0.5;
      if (v9
        || (([(CRImageSpaceQuad *)v5 topRight],
             double v12 = vabdd_f64(self->_topRight.y, v11),
             vabdd_f64(self->_topRight.x, v10) <= 0.5)
          ? (BOOL v13 = v12 > 0.5)
          : (BOOL v13 = 1),
            v13
         || (([(CRImageSpaceQuad *)v5 bottomRight],
              double v16 = vabdd_f64(self->_bottomRight.y, v15),
              vabdd_f64(self->_bottomRight.x, v14) <= 0.5)
           ? (BOOL v17 = v16 > 0.5)
           : (BOOL v17 = 1),
             v17)))
      {
        BOOL v18 = 0;
      }
      else
      {
        [(CRImageSpaceQuad *)v5 bottomLeft];
        BOOL v22 = vabdd_f64(self->_bottomLeft.x, v21) <= 0.5;
        BOOL v18 = vabdd_f64(self->_bottomLeft.y, v20) <= 0.5 && v22;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[CRImageSpaceQuad allocWithZone:a3];
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  double v7 = self->_topRight.x;
  double v8 = self->_topRight.y;
  double v9 = self->_bottomRight.x;
  double v10 = self->_bottomRight.y;
  double v11 = self->_bottomLeft.x;
  double v12 = self->_bottomLeft.y;
  return -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v4, "initWithTopLeft:topRight:bottomRight:bottomLeft:", x, y, v7, v8, v9, v10, v11, v12);
}

- (id)crCodableDataRepresentation
{
  double v3 = objc_opt_new();
  +[CRCodingUtilities appendInteger:1 toData:v3];
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3, self->_topLeft.x, self->_topLeft.y);
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3, self->_topRight.x, self->_topRight.y);
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3, self->_bottomRight.x, self->_bottomRight.y);
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3, self->_bottomLeft.x, self->_bottomLeft.y);
  return v3;
}

- (CRImageSpaceQuad)initWithCRCodableDataRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  if (+[CRCodingUtilities integerFromEncodingData:v4 offset:&v21] == 1)
  {
    +[CRCodingUtilities pointFromEncodingData:v4 offset:&v21];
    double v6 = v5;
    double v8 = v7;
    +[CRCodingUtilities pointFromEncodingData:v4 offset:&v21];
    double v10 = v9;
    double v12 = v11;
    +[CRCodingUtilities pointFromEncodingData:v4 offset:&v21];
    double v14 = v13;
    double v16 = v15;
    +[CRCodingUtilities pointFromEncodingData:v4 offset:&v21];
    self = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](self, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v6, v8, v10, v12, v14, v16, v17, v18);
    double v19 = self;
  }
  else
  {
    double v19 = 0;
  }

  return v19;
}

- (BOOL)intersectsImageMargin:(double)a3 imageSize:(CGSize)a4
{
  double v4 = a4.width - a3;
  double v5 = a4.height - a3;
  double y = self->_topLeft.y;
  float64x2_t v7 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0);
  BOOL v8 = 1;
  if (!(vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vcgeq_f64(v7, (float64x2_t)self->_topRight), (int32x4_t)vcgeq_f64(v7, (float64x2_t)self->_bottomLeft))), 0xFuLL))) & 1 | (self->_topLeft.x >= v4) | (y >= v5|| self->_topRight.x >= v4|| self->_topRight.y >= v5|| self->_bottomLeft.x >= v4|| self->_topLeft.x <= a3|| self->_bottomLeft.y >= v5))&& y > a3)
  {
    double x = self->_bottomRight.x;
    double v9 = self->_bottomRight.y;
    BOOL v8 = x <= a3;
    if (x >= v4) {
      BOOL v8 = 1;
    }
    if (v9 <= a3) {
      BOOL v8 = 1;
    }
    if (v9 >= v5) {
      return 1;
    }
  }
  return v8;
}

- (BOOL)entirelyContainsQuad:(id)a3
{
  id v4 = a3;
  [(CRImageSpaceQuad *)self area];
  double v6 = v5;
  [v4 area];
  BOOL v8 = 0;
  if (v6 > v7)
  {
    [v4 topLeft];
    if (-[CRImageSpaceQuad containsPoint:](self, "containsPoint:"))
    {
      [v4 topRight];
      if (-[CRImageSpaceQuad containsPoint:](self, "containsPoint:"))
      {
        [v4 bottomRight];
        if (-[CRImageSpaceQuad containsPoint:](self, "containsPoint:"))
        {
          [v4 bottomLeft];
          if (-[CRImageSpaceQuad containsPoint:](self, "containsPoint:")) {
            BOOL v8 = 1;
          }
        }
      }
    }
  }

  return v8;
}

- (BOOL)intersectsQuad:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGPoint topRight = self->_topRight;
  v22[0] = self->_topLeft;
  v22[1] = topRight;
  CGPoint bottomLeft = self->_bottomLeft;
  v22[2] = self->_bottomRight;
  v22[3] = bottomLeft;
  [v4 topLeft];
  objc_msgSend(v4, "topRight", v7, v8);
  v21[2] = v9;
  v21[3] = v10;
  [v4 bottomRight];
  _OWORD v21[4] = v11;
  v21[5] = v12;
  [v4 bottomLeft];
  uint64_t v13 = 0;
  v21[6] = v14;
  v21[7] = v15;
  while (2)
  {
    uint64_t v16 = 0;
    uint64_t v17 = v13 + 1;
    do
    {
      uint64_t v18 = v13 + 1;
      if (v13 != v16)
      {
        uint64_t v18 = v16 + 1;
        if (doesLineSegmentIntersectLineSegment(*(double *)&v22[v13], *((double *)&v22[v13] + 1), *(double *)&v22[(v13 + 1) & 3], *((double *)&v22[(v13 + 1) & 3] + 1), *(double *)&v21[2 * v16], *(double *)&v21[2 * v16 + 1], *(double *)&v21[2 * ((v16 + 1) & 3)], *(double *)&v21[2 * ((v16 + 1) & 3) + 1]))goto LABEL_8; {
      }
        }
      uint64_t v16 = v18;
    }
    while (v18 != 4);
    ++v13;
    if (v17 != 4) {
      continue;
    }
    break;
  }
  if ([(CRImageSpaceQuad *)self entirelyContainsQuad:v4])
  {
LABEL_8:
    char v19 = 1;
    goto LABEL_9;
  }
  char v19 = [v4 entirelyContainsQuad:self];
LABEL_9:

  return v19;
}

- (void)homographyFromSelfToQuad:(void *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)(a1 + 24);
  v8[0] = *(_OWORD *)(a1 + 8);
  v8[1] = v3;
  long long v4 = *(_OWORD *)(a1 + 56);
  v8[2] = *(_OWORD *)(a1 + 40);
  v8[3] = v4;
  id v5 = a3;
  [v5 topLeft];
  objc_msgSend(v5, "topRight", v6, v7);
  [v5 bottomRight];
  [v5 bottomLeft];

  find_homography((uint64_t)v8);
}

- (CGPoint)topLeft
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)topRight
{
  double x = self->_topRight.x;
  double y = self->_topRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)bottomRight
{
  double x = self->_bottomRight.x;
  double y = self->_bottomRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)bottomLeft
{
  double x = self->_bottomLeft.x;
  double y = self->_bottomLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end