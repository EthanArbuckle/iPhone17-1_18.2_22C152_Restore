@interface VKQuad
+ (BOOL)supportsSecureCoding;
+ (CATransform3D)transformToConvertLayer:(SEL)a3 intoQuad:(id)a4 frame:(id)a5;
+ (CGPoint)vertexCentroidFromQuads:(id)a3;
+ (id)quadFromCGRect:(CGRect)a3;
+ (id)quadFromUnionOfQuads:(id)a3 baselineAngle:(double)a4;
- (BOOL)containsIntersectingLines;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)intersectsQuad:(id)a3;
- (BOOL)isCompletelyInsideRect:(CGRect)a3;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)rotationTransformAndBoundingBox:(SEL)a3;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGPoint)vertexCentroid;
- (CGRect)boundingBox;
- (CGRect)minimumBoundingRectWithoutRotation;
- (NSArray)allPoints;
- (NSString)summaryDescription;
- (UIBezierPath)path;
- (VKQuad)initWithBottomLeft:(CGPoint)a3 bottomRight:(CGPoint)a4 topLeft:(CGPoint)a5 topRight:(CGPoint)a6;
- (VKQuad)initWithCRNormalizedQuad:(id)a3;
- (VKQuad)initWithCoder:(id)a3;
- (VKQuad)initWithDictionary:(id)a3;
- (VKQuad)initWithPoints:(id)a3;
- (VKQuad)initWithRect:(CGRect)a3;
- (VKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6;
- (VKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6;
- (VKQuad)quadByAdjustingOrientation;
- (VKQuadSideLength)sideLength;
- (double)area;
- (double)averagedAngleFromBottomAndTopEdges;
- (double)boundingBoxArea;
- (double)distanceFromLine:(CGPoint *)a3 toPoint:(CGPoint)a4;
- (double)maxHeight;
- (double)mininumDistanceToPoint:(CGPoint)a3;
- (double)pointInsideValueForStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 testPoint:(CGPoint)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookObject;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intersectionOfLineFrom:(CGPoint)a3 to:(CGPoint)a4 withLineFrom:(CGPoint)a5 to:(CGPoint)a6;
- (id)normalizedQuadByConvertingFromView:(id)a3 toView:(id)a4 toViewSize:(CGSize)a5;
- (id)normalizedQuadFromView:(id)a3;
- (id)quadByConvertingFromNormalizedRectToView:(id)a3 contentsRect:(CGRect)a4;
- (id)quadByConvertingFromView:(id)a3 toView:(id)a4 isNormalized:(BOOL)a5;
- (id)quadByFlippingPointsWithSourceFrame:(CGRect)a3;
- (id)quadFromAddingPoint:(CGPoint)a3;
- (id)quadFromRotatingAroundCentroidWithAngle:(double)a3;
- (id)quadFromRotatingAroundOriginWithAngle:(double)a3;
- (id)quadFromSubtractingPoint:(CGPoint)a3;
- (id)quadFromUnionWithQuad:(id)a3;
- (id)quadMultipliedBySize:(CGSize)a3;
- (id)subquadFromRect:(CGRect)a3;
- (unint64_t)layoutDirection;
- (void)calcluateBoundingBox;
- (void)encodeWithCoder:(id)a3;
- (void)setLayoutDirection:(unint64_t)a3;
@end

@implementation VKQuad

+ (CATransform3D)transformToConvertLayer:(SEL)a3 intoQuad:(id)a4 frame:(id)a5
{
  v45[8] = *(double *)MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  [v9 topLeft];
  v45[0] = v11;
  v45[1] = v12;
  [v9 topRight];
  v45[2] = v13;
  v45[3] = v14;
  [v9 bottomRight];
  v45[4] = v15;
  v45[5] = v16;
  [v9 bottomLeft];
  double v18 = v17;
  double v20 = v19;

  v45[6] = v18;
  v45[7] = v20;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  [v10 bounds];
  double v22 = v21;
  double v24 = v23;
  [v10 anchorPoint];
  objc_msgSend(v10, "frame", computeCornerMatrix(v45, (uint64_t)retstr, v22, v24, v25, v26));
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [v10 anchorPoint];
  double v32 = v31;
  double v34 = v33;
  [v10 bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  double v41 = VKMPointFromNormalizedRect(v32, v34, v36, v38, v40);
  a6->origin.x = VKMMultiplyPointScalar(v41, v42, -1.0);
  a6->origin.y = v43;
  a6->size.width = v28;
  a6->size.height = v30;
  return result;
}

- (VKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  result = [(VKQuad *)self init];
  if (result)
  {
    result->_bottomLeft.CGFloat x = v9;
    result->_bottomLeft.CGFloat y = v8;
    result->_bottomRight.CGFloat x = x;
    result->_bottomRight.CGFloat y = y;
    result->_topLeft.CGFloat x = v13;
    result->_topLeft.CGFloat y = v12;
    result->_topRight.CGFloat x = v11;
    result->_topRight.CGFloat y = v10;
  }
  return result;
}

- (VKQuad)initWithBottomLeft:(CGPoint)a3 bottomRight:(CGPoint)a4 topLeft:(CGPoint)a5 topRight:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  result = [(VKQuad *)self init];
  if (result)
  {
    result->_bottomLeft.CGFloat x = v13;
    result->_bottomLeft.CGFloat y = v12;
    result->_bottomRight.CGFloat x = v11;
    result->_bottomRight.CGFloat y = v10;
    result->_topLeft.CGFloat x = v9;
    result->_topLeft.CGFloat y = v8;
    result->_topRight.CGFloat x = x;
    result->_topRight.CGFloat y = y;
  }
  return result;
}

- (VKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  result = [(VKQuad *)self init];
  if (result)
  {
    result->_bottomLeft.CGFloat x = x;
    result->_bottomLeft.CGFloat y = y;
    result->_bottomRight.CGFloat x = v9;
    result->_bottomRight.CGFloat y = v8;
    result->_topLeft.CGFloat x = v13;
    result->_topLeft.CGFloat y = v12;
    result->_topRight.CGFloat x = v11;
    result->_topRight.CGFloat y = v10;
  }
  return result;
}

- (VKQuad)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v8 = CGRectGetMaxY(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v9 = CGRectGetMinX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v11 = CGRectGetMaxX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v12 = CGRectGetMinY(v24);
  return -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", MinX, MaxY, MaxX, v8, v9, MinY, v11, v12);
}

- (VKQuad)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"BL_X"];
  [v5 doubleValue];
  double v7 = v6;
  double v8 = [v4 objectForKeyedSubscript:@"BL_Y"];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = [v4 objectForKeyedSubscript:@"BR_X"];
  [v11 doubleValue];
  double v13 = v12;
  double v14 = [v4 objectForKeyedSubscript:@"BR_Y"];
  [v14 doubleValue];
  double v16 = v15;

  double v17 = [v4 objectForKeyedSubscript:@"TL_X"];
  [v17 doubleValue];
  double v19 = v18;
  CGRect v20 = [v4 objectForKeyedSubscript:@"TL_Y"];
  [v20 doubleValue];
  double v22 = v21;

  CGRect v23 = [v4 objectForKeyedSubscript:@"TR_X"];
  [v23 doubleValue];
  double v25 = v24;
  double v26 = [v4 objectForKeyedSubscript:@"TR_Y"];

  [v26 doubleValue];
  double v28 = v27;

  return -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v7, v10, v13, v16, v19, v22, v25, v28);
}

- (VKQuad)initWithPoints:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 4)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    objc_msgSend(v5, "vk_pointValue");
    double v7 = v6;
    double v9 = v8;

    double v10 = [v4 objectAtIndexedSubscript:1];
    objc_msgSend(v10, "vk_pointValue");
    double v12 = v11;
    double v14 = v13;

    double v15 = [v4 objectAtIndexedSubscript:2];
    objc_msgSend(v15, "vk_pointValue");
    double v17 = v16;
    double v19 = v18;

    CGRect v20 = [v4 objectAtIndexedSubscript:3];
    objc_msgSend(v20, "vk_pointValue");
    double v22 = v21;
    double v24 = v23;

    self = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v17, v19, v22, v24, v7, v9, v12, v14);
    double v25 = self;
  }
  else
  {
    double v25 = 0;
  }

  return v25;
}

+ (id)quadFromCGRect:(CGRect)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VKQuad)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"BL_X"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"BL_Y"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"BR_X"];
  double v10 = v9;
  [v4 decodeDoubleForKey:@"BR_Y"];
  double v12 = v11;
  [v4 decodeDoubleForKey:@"TL_X"];
  double v14 = v13;
  [v4 decodeDoubleForKey:@"TL_Y"];
  double v16 = v15;
  [v4 decodeDoubleForKey:@"TR_X"];
  double v18 = v17;
  [v4 decodeDoubleForKey:@"TR_Y"];
  CGRect v20 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v6, v8, v10, v12, v14, v16, v18, v19);
  uint64_t v21 = [v4 decodeIntegerForKey:@"LD"];

  [(VKQuad *)v20 setLayoutDirection:v21];
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [(VKQuad *)self bottomLeft];
  objc_msgSend(v8, "encodeDouble:forKey:", @"BL_X");
  [(VKQuad *)self bottomLeft];
  [v8 encodeDouble:@"BL_Y" forKey:v4];
  [(VKQuad *)self bottomRight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"BR_X");
  [(VKQuad *)self bottomRight];
  [v8 encodeDouble:@"BR_Y" forKey:v5];
  [(VKQuad *)self topLeft];
  objc_msgSend(v8, "encodeDouble:forKey:", @"TL_X");
  [(VKQuad *)self topLeft];
  [v8 encodeDouble:@"TL_Y" forKey:v6];
  [(VKQuad *)self topRight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"TR_X");
  [(VKQuad *)self topRight];
  [v8 encodeDouble:@"TR_Y" forKey:v7];
  objc_msgSend(v8, "encodeInteger:forKey:", -[VKQuad layoutDirection](self, "layoutDirection"), @"LD");
}

- (id)dictionaryRepresentation
{
  v15[9] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithDouble:", self->_bottomLeft.x, @"BL_X");
  v15[0] = v3;
  v14[1] = @"BL_Y";
  double v4 = [NSNumber numberWithDouble:self->_bottomLeft.y];
  v15[1] = v4;
  v14[2] = @"BR_X";
  double v5 = [NSNumber numberWithDouble:self->_bottomRight.x];
  v15[2] = v5;
  v14[3] = @"BR_Y";
  double v6 = [NSNumber numberWithDouble:self->_bottomRight.y];
  v15[3] = v6;
  v14[4] = @"TL_X";
  double v7 = [NSNumber numberWithDouble:self->_topLeft.x];
  v15[4] = v7;
  v14[5] = @"TL_Y";
  id v8 = [NSNumber numberWithDouble:self->_topLeft.y];
  v15[5] = v8;
  v14[6] = @"TR_X";
  double v9 = [NSNumber numberWithDouble:self->_topRight.x];
  v15[6] = v9;
  v14[7] = @"TR_Y";
  double v10 = [NSNumber numberWithDouble:self->_topRight.y];
  v15[7] = v10;
  v14[8] = @"LD";
  double v11 = [NSNumber numberWithUnsignedInteger:self->_layoutDirection];
  v15[8] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:9];

  return v12;
}

- (CGRect)boundingBox
{
  if (CGRectEqualToRect(*MEMORY[0x1E4F1DB28], self->_boundingBox)) {
    [(VKQuad *)self calcluateBoundingBox];
  }
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

- (void)calcluateBoundingBox
{
  double v3 = VKMRectWithPoints(self->_bottomLeft.x, self->_bottomLeft.y, self->_topLeft.x);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  v14.origin.double x = VKMRectWithPoints(self->_bottomRight.x, self->_bottomRight.y, self->_topRight.x);
  v14.origin.double y = v10;
  v14.size.double width = v11;
  v14.size.double height = v12;
  v13.origin.double x = v3;
  v13.origin.double y = v5;
  v13.size.double width = v7;
  v13.size.double height = v9;
  self->_boundingBodouble x = CGRectUnion(v13, v14);
}

- (double)area
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  double v25 = self->_topRight.x;
  double v23 = x;
  double v24 = self->_topRight.y;
  double v4 = self->_bottomRight.x;
  double v5 = self->_bottomRight.y;
  double v21 = self->_bottomLeft.y;
  double v22 = self->_bottomLeft.x;
  [(VKQuad *)self sideLength];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = VKMAngleBetweenPoints(x, y, v22, v21, v4, v5);
  long double v15 = v14 + VKMAngleBetweenPoints(v4, v5, v25, v24, v23, y);
  double v16 = (v9 + v11 + v13 + v7) * 0.5;
  double v17 = (v16 - v11) * ((v16 - v13) * (v16 - v7));
  double v18 = v16 - v9;
  long double v19 = cos(v15 * 0.5);
  return sqrt(v9 * (v11 * -(v13 * v7)) * (v19 * v19) + v17 * v18);
}

- (double)boundingBoxArea
{
  [(VKQuad *)self boundingBox];
  return v2 * v3;
}

- (NSString)summaryDescription
{
  double v3 = NSString;
  [(VKQuad *)self topLeft];
  uint64_t v5 = v4;
  [(VKQuad *)self topLeft];
  uint64_t v7 = v6;
  [(VKQuad *)self topRight];
  uint64_t v9 = v8;
  [(VKQuad *)self topRight];
  uint64_t v11 = v10;
  [(VKQuad *)self bottomLeft];
  uint64_t v13 = v12;
  [(VKQuad *)self bottomLeft];
  uint64_t v15 = v14;
  [(VKQuad *)self bottomRight];
  uint64_t v17 = v16;
  [(VKQuad *)self bottomRight];
  return (NSString *)[v3 stringWithFormat:@"TL:%.2f %.2f TR:%.2f %.2f BL:%.2f %.2f BR:%.2f %.2f", v5, v7, v9, v11, v13, v15, v17, v18];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"topLeft    : %.2f %.2f \ntopRight   : %.2f %.2f \nbottomLeft : %.2f %.2f \nbottomRight: %.2f %.2f", *(void *)&self->_topLeft.x, *(void *)&self->_topLeft.y, *(void *)&self->_topRight.x, *(void *)&self->_topRight.y, *(void *)&self->_bottomLeft.x, *(void *)&self->_bottomLeft.y, *(void *)&self->_bottomRight.x, *(void *)&self->_bottomRight.y];
}

- (id)debugQuickLookObject
{
  [(VKQuad *)self boundingBox];
  double v3 = -[VKQuad quadByFlippingPointsWithSourceFrame:](self, "quadByFlippingPointsWithSourceFrame:");
  uint64_t v4 = [v3 path];

  [v4 bounds];
  if (v5 < 20.0)
  {
    CGAffineTransformMakeScale(&v7, 20.0, 20.0);
    objc_msgSend(v4, "vk_applyTransform:", &v7);
  }
  return v4;
}

- (NSArray)allPoints
{
  v13[4] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F29238];
  [(VKQuad *)self topLeft];
  uint64_t v4 = objc_msgSend(v3, "vk_valueWithPoint:");
  v13[0] = v4;
  double v5 = (void *)MEMORY[0x1E4F29238];
  [(VKQuad *)self topRight];
  uint64_t v6 = objc_msgSend(v5, "vk_valueWithPoint:");
  v13[1] = v6;
  CGAffineTransform v7 = (void *)MEMORY[0x1E4F29238];
  [(VKQuad *)self bottomLeft];
  uint64_t v8 = objc_msgSend(v7, "vk_valueWithPoint:");
  v13[2] = v8;
  uint64_t v9 = (void *)MEMORY[0x1E4F29238];
  [(VKQuad *)self bottomRight];
  uint64_t v10 = objc_msgSend(v9, "vk_valueWithPoint:");
  v13[3] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];

  return (NSArray *)v11;
}

- (BOOL)containsIntersectingLines
{
  [(VKQuad *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(VKQuad *)self topRight];
  double v8 = v7;
  double v10 = v9;
  [(VKQuad *)self bottomLeft];
  double v12 = v11;
  double v14 = v13;
  [(VKQuad *)self bottomRight];
  uint64_t v17 = -[VKQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v4, v6, v8, v10, v12, v14, v15, v16);
  if (v17)
  {
    BOOL v18 = 1;
  }
  else
  {
    [(VKQuad *)self topRight];
    double v20 = v19;
    double v22 = v21;
    [(VKQuad *)self bottomRight];
    double v24 = v23;
    double v26 = v25;
    [(VKQuad *)self topLeft];
    double v28 = v27;
    double v30 = v29;
    [(VKQuad *)self bottomLeft];
    double v33 = -[VKQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v20, v22, v24, v26, v28, v30, v31, v32);
    BOOL v18 = v33 != 0;
  }
  return v18;
}

- (VKQuadSideLength)sideLength
{
  [(VKQuad *)self bottomLeft];
  double v4 = v3;
  double v6 = v5;
  [(VKQuad *)self topLeft];
  double v9 = VKMDistance(v4, v6, v7, v8);
  [(VKQuad *)self bottomRight];
  double v11 = v10;
  double v13 = v12;
  [(VKQuad *)self topRight];
  double v16 = VKMDistance(v11, v13, v14, v15);
  [(VKQuad *)self topLeft];
  double v18 = v17;
  double v20 = v19;
  [(VKQuad *)self topRight];
  double v23 = VKMDistance(v18, v20, v21, v22);
  [(VKQuad *)self bottomLeft];
  double v25 = v24;
  double v27 = v26;
  [(VKQuad *)self bottomRight];
  double v30 = VKMDistance(v25, v27, v28, v29);
  double v31 = v9;
  double v32 = v16;
  double v33 = v23;
  result.bottom = v30;
  result.top = v33;
  result.right = v32;
  result.left = v31;
  return result;
}

- (double)maxHeight
{
  [(VKQuad *)self sideLength];
  if (result < v3) {
    return v3;
  }
  return result;
}

- (id)intersectionOfLineFrom:(CGPoint)a3 to:(CGPoint)a4 withLineFrom:(CGPoint)a5 to:(CGPoint)a6
{
  double v8 = a4.x - a3.x;
  double v9 = a6.y - a5.y;
  double v10 = a4.y - a3.y;
  double v11 = a6.x - a5.x;
  double v12 = v8 * (a6.y - a5.y) - v10 * (a6.x - a5.x);
  double v13 = 0;
  if (v12 != 0.0
    && ((double v15 = a5.x - a3.x, v16 = a5.y - a3.y, v17 = ((a5.x - a3.x) * v9 - v16 * v11) / v12, v17 >= 0.0)
      ? (BOOL v18 = v17 <= 1.0)
      : (BOOL v18 = 0),
        v18 && ((double v19 = (v15 * v10 - v16 * v8) / v12, v19 >= 0.0) ? (v20 = v19 <= 1.0) : (v20 = 0), v20)))
  {
    double v13 = objc_msgSend(MEMORY[0x1E4F29238], "vk_valueWithPoint:", a3.x + v17 * v8, a3.y + v17 * v10, v6);
  }
  else if (((v7 ^ (2 * v7)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  return v13;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v6 = 0;
  if (VKMPointIsFinite(a3.x, a3.y))
  {
    uint64_t v7 = 0;
    CGPoint topLeft = self->_topLeft;
    CGPoint bottomRight = self->_bottomRight;
    CGPoint bottomLeft = self->_bottomLeft;
    CGPoint v22 = topLeft;
    CGPoint topRight = self->_topRight;
    CGPoint v20 = bottomRight;
    CGPoint v18 = topLeft;
    CGFloat v11 = topLeft.y;
    double v10 = topLeft.x;
    p_double y = &topRight.y;
    for (unint64_t i = 1; i != 5; ++i)
    {
      double v14 = v10;
      double v15 = v11;
      double v10 = *(p_y - 1);
      CGFloat v11 = *p_y;
      -[VKQuad pointInsideValueForStartPoint:endPoint:testPoint:](self, "pointInsideValueForStartPoint:endPoint:testPoint:", v14, v15, v10, *p_y, x, y, v18, topRight, v20, bottomLeft, v22);
      if (v16 != 0.0)
      {
        if (v16 > 0.0)
        {
          if (v7 < 0) {
            return v6;
          }
          ++v7;
        }
        if (v16 < 0.0)
        {
          if (v7 > 0) {
            return v6;
          }
          --v7;
        }
      }
      BOOL v6 = i > 3;
      p_y += 2;
    }
  }
  return v6;
}

- (BOOL)intersectsQuad:(id)a3
{
  v51[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = self;
  id v6 = v4;
  [(VKQuad *)v5 boundingBox];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 boundingBox];
  v53.origin.double x = v15;
  v53.origin.double y = v16;
  v53.size.double width = v17;
  v53.size.double height = v18;
  v52.origin.double x = v8;
  v52.origin.double y = v10;
  v52.size.double width = v12;
  v52.size.double height = v14;
  if (CGRectIntersectsRect(v52, v53))
  {
    [(VKQuad *)v5 topLeft];
    v51[0] = v19;
    v51[1] = v20;
    [(VKQuad *)v5 topRight];
    v51[2] = v21;
    v51[3] = v22;
    [(VKQuad *)v5 bottomRight];
    v51[4] = v23;
    v51[5] = v24;
    [(VKQuad *)v5 bottomLeft];
    v51[6] = v25;
    v51[7] = v26;
    [v6 topLeft];
    v50[0] = v27;
    v50[1] = v28;
    [v6 topRight];
    v50[2] = v29;
    v50[3] = v30;
    [v6 bottomRight];
    v50[4] = v31;
    v50[5] = v32;
    [v6 bottomLeft];
    uint64_t v33 = 0;
    v50[6] = v34;
    v50[7] = v35;
    CGFloat v43 = v5;
    do
    {
      if (-[VKQuad containsPoint:](v5, "containsPoint:", *(double *)&v50[v33], *(double *)&v50[v33 + 1], v43)
        || (objc_msgSend(v6, "containsPoint:", *(double *)&v51[v33], *(double *)&v51[v33 + 1]) & 1) != 0)
      {
        char v44 = 1;
        goto LABEL_15;
      }
      v33 += 2;
    }
    while (v33 != 8);
    uint64_t v36 = 0;
    char v44 = 0;
    do
    {
      double v37 = &v51[2 * v36++];
      double v38 = (long long *)v50;
      uint64_t v39 = 1;
      while (v39 != 5)
      {
        long long v40 = *v38++;
        v48[0] = v40;
        v48[1] = *(_OWORD *)&v50[2 * (v39 & 3)];
        v49[0] = *v37;
        v49[1] = *(_OWORD *)&v51[2 * (v36 & 3)];
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        v45[0] = 0.0;
        v45[1] = 0.0;
        ++v39;
        if (VKMIntersectionOfLines((double *)v49, (double *)v48, (double *)&v47, (double *)&v46, v45, 0, 0))
        {
          char v44 = 1;
          break;
        }
      }
    }
    while (v36 != 4);
LABEL_15:
    BOOL v41 = v44 & 1;
    double v5 = v43;
  }
  else
  {
    BOOL v41 = 0;
  }

  return v41;
}

- (BOOL)isCompletelyInsideRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(VKQuad *)self topLeft];
  v24.CGFloat x = v8;
  v24.CGFloat y = v9;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  if (!CGRectContainsPoint(v27, v24)) {
    return 0;
  }
  [(VKQuad *)self topRight];
  v25.CGFloat x = v10;
  v25.CGFloat y = v11;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  if (!CGRectContainsPoint(v28, v25)) {
    return 0;
  }
  [(VKQuad *)self bottomLeft];
  v26.CGFloat x = v12;
  v26.CGFloat y = v13;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  if (!CGRectContainsPoint(v29, v26)) {
    return 0;
  }
  [(VKQuad *)self bottomRight];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  CGFloat v18 = x;
  CGFloat v19 = y;
  CGFloat v20 = width;
  CGFloat v21 = height;
  return CGRectContainsPoint(*(CGRect *)&v18, *(CGPoint *)&v15);
}

- (double)pointInsideValueForStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 testPoint:(CGPoint)a5
{
  return (a5.y - a3.y) * (a4.x - a3.x) - (a5.x - a3.x) * (a4.y - a3.y);
}

- (VKQuad)quadByAdjustingOrientation
{
  v73[4] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F29238];
  [(VKQuad *)self topLeft];
  id v4 = objc_msgSend(v3, "vk_valueWithPoint:");
  v73[0] = v4;
  double v5 = (void *)MEMORY[0x1E4F29238];
  [(VKQuad *)self topRight];
  id v6 = objc_msgSend(v5, "vk_valueWithPoint:");
  v73[1] = v6;
  double v7 = (void *)MEMORY[0x1E4F29238];
  [(VKQuad *)self bottomLeft];
  CGFloat v8 = objc_msgSend(v7, "vk_valueWithPoint:");
  v73[2] = v8;
  CGFloat v9 = (void *)MEMORY[0x1E4F29238];
  [(VKQuad *)self bottomRight];
  CGFloat v10 = objc_msgSend(v9, "vk_valueWithPoint:");
  v73[3] = v10;
  CGFloat v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];

  CGFloat v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_33];
  CGFloat v13 = [v12 objectAtIndexedSubscript:0];
  [v13 pointValue];
  double v15 = v14;
  double v72 = v14;

  uint64_t v16 = [v12 objectAtIndexedSubscript:1];
  [v16 pointValue];
  double v18 = v17;

  uint64_t v19 = 2;
  CGFloat v20 = [v12 objectAtIndexedSubscript:2];
  [v20 pointValue];
  double v22 = v21;

  uint64_t v23 = [v12 objectAtIndexedSubscript:3];
  [v23 pointValue];
  double v25 = v24;

  if (v25 >= v22) {
    uint64_t v26 = 2;
  }
  else {
    uint64_t v26 = 3;
  }
  if (v25 >= v22) {
    uint64_t v19 = 3;
  }
  CGRect v27 = objc_msgSend(v12, "objectAtIndexedSubscript:", v15 >= v18, *(void *)&v18);
  [v27 pointValue];
  double v71 = v28;
  double v30 = v29;

  uint64_t v31 = [v12 objectAtIndexedSubscript:v26];
  [v31 pointValue];
  double v33 = v32;
  double v35 = v34;

  uint64_t v36 = [v12 objectAtIndexedSubscript:v15 < v18];
  [v36 pointValue];
  double v38 = v37;
  double v40 = v39;

  BOOL v41 = [v12 objectAtIndexedSubscript:v19];
  [v41 pointValue];
  double v43 = v42;
  double v45 = v44;

  uint64_t v46 = -[VKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:]([VKQuad alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v71, v30, v33, v35, v38, v40, v43, v45);
  uint64_t v47 = v46;
  if (v22 < v72 && v22 < v70 && [(VKQuad *)v46 containsIntersectingLines])
  {
    v48 = [v12 objectAtIndexedSubscript:2];
    [v48 pointValue];
    double v50 = v49;
    double v52 = v51;

    CGRect v53 = [v12 objectAtIndexedSubscript:3];
    [v53 pointValue];
    double v55 = v54;
    double v57 = v56;

    v58 = [v12 objectAtIndexedSubscript:0];
    [v58 pointValue];
    double v60 = v59;
    double v62 = v61;

    v63 = [v12 objectAtIndexedSubscript:1];
    [v63 pointValue];
    double v65 = v64;
    double v67 = v66;

    v68 = -[VKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:]([VKQuad alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v50, v52, v55, v57, v60, v62, v65, v67);
    uint64_t v47 = v68;
  }

  return v47;
}

uint64_t __36__VKQuad_quadByAdjustingOrientation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 pointValue];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 pointValue];
  double v9 = v8;

  CGFloat v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)quadByFlippingPointsWithSourceFrame:(CGRect)a3
{
  [(VKQuad *)self topLeft];
  VKMFlipPoint();
  double v18 = v5;
  double v19 = v4;
  [(VKQuad *)self topRight];
  VKMFlipPoint();
  double v7 = v6;
  double v9 = v8;
  [(VKQuad *)self bottomRight];
  VKMFlipPoint();
  double v11 = v10;
  double v13 = v12;
  [(VKQuad *)self bottomLeft];
  VKMFlipPoint();
  uint64_t v16 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v15, v11, v13, v19, v18, v7, v9);
  return v16;
}

- (double)averagedAngleFromBottomAndTopEdges
{
  [(VKQuad *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(VKQuad *)self topRight];
  double v9 = VKMSlopeOfLine(v4, v6, v7, v8);
  double v10 = atan(v9);
  [(VKQuad *)self bottomLeft];
  double v12 = v11;
  double v14 = v13;
  [(VKQuad *)self bottomRight];
  double v17 = VKMSlopeOfLine(v12, v14, v15, v16);
  return (v10 + atan(v17)) * 0.5;
}

- (CGRect)minimumBoundingRectWithoutRotation
{
  [(VKQuad *)self sideLength];
  double v4 = v3;
  double v6 = v5;
  [(VKQuad *)self vertexCentroid];
  if (v6 >= v4) {
    double v9 = v6;
  }
  else {
    double v9 = v4;
  }
  double v10 = VKMRectWithCenterAndSize(v7, v8, v9);
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (VKQuad *)a3;
  double v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else if (v4 {
         && (([(VKQuad *)self topLeft], v7 = v6, double v9 = v8, [(VKQuad *)v5 topLeft], v7 == v11)
  }
           ? (BOOL v12 = v9 == v10)
           : (BOOL v12 = 0),
             v12))
  {
    [(VKQuad *)self topRight];
    double v16 = v15;
    double v18 = v17;
    [(VKQuad *)v5 topRight];
    BOOL v13 = 0;
    if (v16 == v20 && v18 == v19)
    {
      [(VKQuad *)self bottomRight];
      double v22 = v21;
      double v24 = v23;
      [(VKQuad *)v5 bottomRight];
      BOOL v13 = 0;
      if (v22 == v26 && v24 == v25)
      {
        [(VKQuad *)self bottomLeft];
        double v28 = v27;
        double v30 = v29;
        [(VKQuad *)v5 bottomLeft];
        BOOL v13 = 0;
        if (v28 == v32 && v30 == v31)
        {
          unint64_t v33 = [(VKQuad *)self layoutDirection];
          BOOL v13 = v33 == [(VKQuad *)v5 layoutDirection];
        }
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  [(VKQuad *)self topLeft];
  double v5 = v4;
  double v7 = v6;
  [(VKQuad *)self topRight];
  double v9 = v8;
  double v11 = v10;
  [(VKQuad *)self bottomRight];
  double v13 = v12;
  double v15 = v14;
  [(VKQuad *)self bottomLeft];
  double v18 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v16, v17, v13, v15, v5, v7, v9, v11);
  [(VKQuad *)v18 setLayoutDirection:[(VKQuad *)self layoutDirection]];
  return v18;
}

- (UIBezierPath)path
{
  path = self->_path;
  if (!path)
  {
    double v4 = (UIBezierPath *)objc_alloc_init(MEMORY[0x1E4F427D0]);
    double v5 = self->_path;
    self->_path = v4;

    double v6 = self->_path;
    [(VKQuad *)self topLeft];
    -[UIBezierPath moveToPoint:](v6, "moveToPoint:");
    double v7 = self->_path;
    [(VKQuad *)self topRight];
    -[UIBezierPath vk_addLineToPoint:](v7, "vk_addLineToPoint:");
    double v8 = self->_path;
    [(VKQuad *)self bottomRight];
    -[UIBezierPath vk_addLineToPoint:](v8, "vk_addLineToPoint:");
    double v9 = self->_path;
    [(VKQuad *)self bottomLeft];
    -[UIBezierPath vk_addLineToPoint:](v9, "vk_addLineToPoint:");
    double v10 = self->_path;
    [(VKQuad *)self topLeft];
    -[UIBezierPath vk_addLineToPoint:](v10, "vk_addLineToPoint:");
    [(UIBezierPath *)self->_path closePath];
    path = self->_path;
  }
  return path;
}

- (id)quadByConvertingFromView:(id)a3 toView:(id)a4 isNormalized:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [v8 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = self;
  int v17 = objc_msgSend(v8, "vk_isFlipped");
  if (v17 != objc_msgSend(v9, "vk_isFlipped"))
  {
    double v18 = (void *)[(VKQuad *)v16 copy];

    if (v5)
    {
      double v19 = 0.0;
      double v20 = 0.0;
      double v21 = 1.0;
      double v22 = 1.0;
    }
    else
    {
      [v8 bounds];
    }
    objc_msgSend(v18, "quadByFlippingPointsWithSourceFrame:", v19, v20, v21, v22);
    double v16 = (VKQuad *)objc_claimAutoreleasedReturnValue();
  }
  [(VKQuad *)v16 topLeft];
  if (v5)
  {
    objc_msgSend(v8, "convertPoint:toView:", 0, VKMPointFromNormalizedRect(v23, v24, v11, v13, v15));
    double v71 = v26;
    double v72 = v25;
    [(VKQuad *)v16 topRight];
    objc_msgSend(v8, "convertPoint:toView:", 0, VKMPointFromNormalizedRect(v27, v28, v11, v13, v15));
    double v30 = v29;
    double v32 = v31;
    [(VKQuad *)v16 bottomRight];
    objc_msgSend(v8, "convertPoint:toView:", 0, VKMPointFromNormalizedRect(v33, v34, v11, v13, v15));
    double v36 = v35;
    double v38 = v37;
    [(VKQuad *)v16 bottomLeft];
    double v39 = v15;
    double v41 = v71;
    double v40 = v72;
    double v44 = VKMPointFromNormalizedRect(v42, v43, v11, v13, v39);
  }
  else
  {
    objc_msgSend(v8, "convertPoint:toView:", 0);
    double v40 = v45;
    double v41 = v46;
    [(VKQuad *)v16 topRight];
    objc_msgSend(v8, "convertPoint:toView:", 0);
    double v30 = v47;
    double v32 = v48;
    [(VKQuad *)v16 bottomRight];
    objc_msgSend(v8, "convertPoint:toView:", 0);
    double v36 = v49;
    double v38 = v50;
    [(VKQuad *)v16 bottomLeft];
  }
  [v8 convertPoint:0 toView:v44];
  double v52 = v51;
  double v54 = v53;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v40, v41);
  double v56 = v55;
  double v58 = v57;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v30, v32);
  double v60 = v59;
  double v62 = v61;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v36, v38);
  double v64 = v63;
  double v66 = v65;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v52, v54);
  v69 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v67, v68, v64, v66, v56, v58, v60, v62);

  return v69;
}

- (id)quadByConvertingFromNormalizedRectToView:(id)a3 contentsRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [a3 bounds];
  VKMRectFromNormalizedSubrect(v9, v10, v11, v12, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(VKQuad *)self topLeft];
  double v21 = VKMPointFromNormalizedRect(v19, v20, v14, v16, v18);
  double v39 = v22;
  double v40 = v21;
  [(VKQuad *)self topRight];
  double v25 = VKMPointFromNormalizedRect(v23, v24, v14, v16, v18);
  double v27 = v26;
  [(VKQuad *)self bottomRight];
  double v30 = VKMPointFromNormalizedRect(v28, v29, v14, v16, v18);
  double v32 = v31;
  [(VKQuad *)self bottomLeft];
  double v35 = VKMPointFromNormalizedRect(v33, v34, v14, v16, v18);
  double v37 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v35, v36, v30, v32, v40, v39, v25, v27);
  return v37;
}

- (id)normalizedQuadByConvertingFromView:(id)a3 toView:(id)a4 toViewSize:(CGSize)a5
{
  double width = a5.width;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  id v10 = a4;
  id v11 = a3;
  [(VKQuad *)self topLeft];
  objc_msgSend(v11, "convertPoint:toView:", v10);
  double v13 = v12;
  double v15 = v14;
  [(VKQuad *)self topRight];
  objc_msgSend(v11, "convertPoint:toView:", v10);
  double v17 = v16;
  double v19 = v18;
  [(VKQuad *)self bottomRight];
  objc_msgSend(v11, "convertPoint:toView:", v10);
  double v40 = v21;
  double v41 = v20;
  [(VKQuad *)self bottomLeft];
  objc_msgSend(v11, "convertPoint:toView:", v10);
  double v36 = v23;
  double v37 = v22;

  double v24 = VKMNormalizedPointInRect(v13, v15, v8, v9, width);
  double v38 = v25;
  double v39 = v24;
  double v26 = VKMNormalizedPointInRect(v17, v19, v8, v9, width);
  double v28 = v27;
  double v29 = VKMNormalizedPointInRect(v41, v40, v8, v9, width);
  double v31 = v30;
  double v32 = VKMNormalizedPointInRect(v37, v36, v8, v9, width);
  double v34 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v32, v33, v29, v31, v39, v38, v26, v28);
  return v34;
}

- (id)normalizedQuadFromView:(id)a3
{
  [a3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [(VKQuad *)self topLeft];
  double v12 = VKMNormalizedPointInRect(v10, v11, v5, v7, v9);
  double v30 = v13;
  double v31 = v12;
  [(VKQuad *)self topRight];
  double v16 = VKMNormalizedPointInRect(v14, v15, v5, v7, v9);
  double v18 = v17;
  [(VKQuad *)self bottomRight];
  double v21 = VKMNormalizedPointInRect(v19, v20, v5, v7, v9);
  double v23 = v22;
  [(VKQuad *)self bottomLeft];
  double v26 = VKMNormalizedPointInRect(v24, v25, v5, v7, v9);
  double v28 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v26, v27, v21, v23, v31, v30, v16, v18);
  return v28;
}

- (id)subquadFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (VKMSizeIsEmptyOrHasNanOrInf(a3.size.width, a3.size.height))
  {
    double v8 = objc_alloc_init(VKQuad);
  }
  else
  {
    double v9 = (void *)[(VKQuad *)self copy];
    double v10 = objc_msgSend(v9, "quadFromSubtractingPoint:", x, y);

    objc_msgSend(v10, "quadMultipliedBySize:", 1.0 / width, 1.0 / height);
    double v8 = (VKQuad *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)quadFromAddingPoint:(CGPoint)a3
{
  double x = a3.x;
  [(VKQuad *)self topLeft];
  double v7 = VKMAddPoints(v5, v6, x);
  double v9 = v8;
  [(VKQuad *)self topRight];
  double v12 = VKMAddPoints(v10, v11, x);
  double v14 = v13;
  [(VKQuad *)self bottomRight];
  double v17 = VKMAddPoints(v15, v16, x);
  double v19 = v18;
  [(VKQuad *)self bottomLeft];
  double v22 = VKMAddPoints(v20, v21, x);
  double v24 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v22, v23, v17, v19, v7, v9, v12, v14);
  return v24;
}

- (id)quadFromSubtractingPoint:(CGPoint)a3
{
  double x = a3.x;
  [(VKQuad *)self topLeft];
  double v7 = VKMSubtractPoints(v5, v6, x);
  double v9 = v8;
  [(VKQuad *)self topRight];
  double v12 = VKMSubtractPoints(v10, v11, x);
  double v14 = v13;
  [(VKQuad *)self bottomRight];
  double v17 = VKMSubtractPoints(v15, v16, x);
  double v19 = v18;
  [(VKQuad *)self bottomLeft];
  double v22 = VKMSubtractPoints(v20, v21, x);
  double v24 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v22, v23, v17, v19, v7, v9, v12, v14);
  return v24;
}

- (id)quadMultipliedBySize:(CGSize)a3
{
  double width = a3.width;
  [(VKQuad *)self topLeft];
  double v7 = VKMMultiplyPointBySize(v5, v6, width);
  double v9 = v8;
  [(VKQuad *)self topRight];
  double v12 = VKMMultiplyPointBySize(v10, v11, width);
  double v14 = v13;
  [(VKQuad *)self bottomRight];
  double v17 = VKMMultiplyPointBySize(v15, v16, width);
  double v19 = v18;
  [(VKQuad *)self bottomLeft];
  double v22 = VKMMultiplyPointBySize(v20, v21, width);
  double v24 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v22, v23, v17, v19, v7, v9, v12, v14);
  return v24;
}

- (CGPoint)vertexCentroid
{
  [(VKQuad *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(VKQuad *)self topRight];
  double v8 = v7;
  double v10 = v9;
  [(VKQuad *)self bottomLeft];
  double v12 = v11;
  double v14 = v13;
  [(VKQuad *)self bottomRight];
  double v16 = VKMVertexCentroidOfQuad(v4, v6, v8, v10, v12, v14, v15);
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (id)quadFromUnionWithQuad:(id)a3
{
  id v4 = a3;
  double v5 = [(VKQuad *)self quadByAdjustingOrientation];
  double v6 = [v4 quadByAdjustingOrientation];

  [v6 topLeft];
  double v8 = v7;
  [v5 topLeft];
  if (v8 >= v9) {
    double v8 = v9;
  }
  [v6 topLeft];
  double v11 = v10;
  [v5 topLeft];
  if (v11 >= v12) {
    double v11 = v12;
  }
  [v6 topRight];
  double v14 = v13;
  [v5 topRight];
  if (v14 < v15) {
    double v14 = v15;
  }
  [v6 topRight];
  double v17 = v16;
  [v5 topRight];
  if (v17 >= v18) {
    double v17 = v18;
  }
  [v6 bottomRight];
  double v20 = v19;
  [v5 bottomRight];
  if (v20 < v21) {
    double v20 = v21;
  }
  [v6 bottomRight];
  double v23 = v22;
  [v5 bottomRight];
  if (v23 < v24) {
    double v23 = v24;
  }
  [v6 bottomLeft];
  double v26 = v25;
  [v5 bottomLeft];
  if (v26 >= v27) {
    double v26 = v27;
  }
  [v6 bottomLeft];
  double v29 = v28;
  [v5 bottomLeft];
  if (v29 < v30) {
    double v29 = v30;
  }
  double v31 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v26, v29, v20, v23, v8, v11, v14, v17);

  return v31;
}

+ (id)quadFromUnionOfQuads:(id)a3 baselineAngle:(double)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) quadFromRotatingAroundOriginWithAngle:-a4];
        double v12 = v11;
        if (v8)
        {
          uint64_t v13 = [v8 quadFromUnionWithQuad:v11];

          id v8 = (id)v13;
        }
        else
        {
          id v8 = v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
  double v14 = [v8 quadFromRotatingAroundOriginWithAngle:a4];

  return v14;
}

+ (CGPoint)vertexCentroidFromQuads:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    [v4 vertexCentroid];
    double v6 = v5;
    double v8 = v7;

    if ((unint64_t)[v3 count] >= 2)
    {
      if ((unint64_t)[v3 count] >= 2)
      {
        unint64_t v9 = 1;
        do
        {
          double v10 = [v3 objectAtIndexedSubscript:v9];
          [v10 vertexCentroid];
          double v6 = VKMAddPoints(v6, v8, v11);
          double v8 = v12;

          ++v9;
        }
        while ([v3 count] > v9);
      }
      double v6 = VKMMultiplyPointScalar(v6, v8, 1.0 / (double)(unint64_t)[v3 count]);
      double v8 = v13;
    }
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v14 = v6;
  double v15 = v8;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (id)quadFromRotatingAroundCentroidWithAngle:(double)a3
{
  [(VKQuad *)self vertexCentroid];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v19, -v5, -v7);
  CGAffineTransformMakeRotation(&t2, a3);
  CGAffineTransform t1 = v19;
  CGAffineTransformConcat(&v18, &t1, &t2);
  CGAffineTransform v19 = v18;
  CGAffineTransformMakeTranslation(&v15, v6, v8);
  CGAffineTransform t1 = v19;
  CGAffineTransformConcat(&v18, &t1, &v15);
  CGAffineTransform v19 = v18;
  unint64_t v9 = [(VKQuad *)self allPoints];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__VKQuad_quadFromRotatingAroundCentroidWithAngle___block_invoke;
  v13[3] = &__block_descriptor_80_e23__32__0__NSValue_8q16q24l;
  CGAffineTransform v14 = v19;
  double v10 = objc_msgSend(v9, "vk_map:", v13);

  double v11 = [[VKQuad alloc] initWithPoints:v10];
  return v11;
}

uint64_t __50__VKQuad_quadFromRotatingAroundCentroidWithAngle___block_invoke(float64x2_t *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F29238];
  [a2 pointValue];
  float64x2_t v6 = vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(a1[3], v4), a1[2], v5));
  return objc_msgSend(v3, "vk_valueWithPoint:", *(_OWORD *)&v6);
}

- (id)quadFromRotatingAroundOriginWithAngle:(double)a3
{
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeRotation(&v10, a3);
  double v4 = [(VKQuad *)self allPoints];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__VKQuad_quadFromRotatingAroundOriginWithAngle___block_invoke;
  v8[3] = &__block_descriptor_80_e23__32__0__NSValue_8q16q24l;
  CGAffineTransform v9 = v10;
  double v5 = objc_msgSend(v4, "vk_map:", v8);

  float64x2_t v6 = [[VKQuad alloc] initWithPoints:v5];
  return v6;
}

uint64_t __48__VKQuad_quadFromRotatingAroundOriginWithAngle___block_invoke(float64x2_t *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F29238];
  [a2 pointValue];
  float64x2_t v6 = vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(a1[3], v4), a1[2], v5));
  return objc_msgSend(v3, "vk_valueWithPoint:", *(_OWORD *)&v6);
}

- (CGAffineTransform)rotationTransformAndBoundingBox:(SEL)a3
{
  [(VKQuad *)self topLeft];
  double v8 = v7;
  double v10 = v9;
  [(VKQuad *)self bottomLeft];
  double v12 = VKMAveragePoints(v8, v10, v11);
  double v14 = v13;
  [(VKQuad *)self topRight];
  double v16 = v15;
  double v18 = v17;
  [(VKQuad *)self bottomRight];
  double v20 = VKMAveragePoints(v16, v18, v19);
  if (v12 == v20)
  {
    VKMSubtractPoints(v20, v21, v12);
    double v22 = dbl_1DB33EC90[v23 > 0.0];
  }
  else
  {
    double v22 = VKMAngleOfLine(v12, v14, v20, v21);
  }
  double v24 = [(VKQuad *)self quadFromRotatingAroundCentroidWithAngle:-v22];
  [v24 boundingBox];
  a4->origin.double x = v25;
  a4->origin.double y = v26;
  a4->size.double width = v27;
  a4->size.double height = v28;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return CGAffineTransformMakeRotation(retstr, v22);
}

- (double)mininumDistanceToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v6 = -[VKQuad containsPoint:](self, "containsPoint:");
  double result = 0.0;
  if (!v6)
  {
    [(VKQuad *)self topLeft];
    uint64_t v28 = v8;
    uint64_t v29 = v9;
    [(VKQuad *)self topRight];
    uint64_t v30 = v10;
    uint64_t v31 = v11;
    -[VKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    double v13 = fmin(v12, INFINITY);
    [(VKQuad *)self topRight];
    uint64_t v28 = v14;
    uint64_t v29 = v15;
    [(VKQuad *)self bottomRight];
    uint64_t v30 = v16;
    uint64_t v31 = v17;
    -[VKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    if (v18 < v13) {
      double v13 = v18;
    }
    [(VKQuad *)self bottomRight];
    uint64_t v28 = v19;
    uint64_t v29 = v20;
    [(VKQuad *)self bottomLeft];
    uint64_t v30 = v21;
    uint64_t v31 = v22;
    -[VKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    if (v23 < v13) {
      double v13 = v23;
    }
    [(VKQuad *)self bottomLeft];
    uint64_t v28 = v24;
    uint64_t v29 = v25;
    [(VKQuad *)self topLeft];
    uint64_t v30 = v26;
    uint64_t v31 = v27;
    -[VKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    if (result >= v13) {
      return v13;
    }
  }
  return result;
}

- (double)distanceFromLine:(CGPoint *)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = VKMNearestPointOnLineSegmentToPoint(&a3->x, a4.x, a4.y);
  return VKMDistance(v6, v7, x, y);
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

- (CGPoint)bottomLeft
{
  double x = self->_bottomLeft.x;
  double y = self->_bottomLeft.y;
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

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (void).cxx_destruct
{
}

- (VKQuad)initWithCRNormalizedQuad:(id)a3
{
  id v4 = a3;
  [v4 bottomLeft];
  double v6 = v5;
  double v8 = v7;
  [v4 bottomRight];
  double v10 = v9;
  double v12 = v11;
  [v4 topLeft];
  double v14 = v13;
  double v16 = v15;
  [v4 topRight];
  double v18 = v17;
  double v20 = v19;

  return -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v6, v8, v10, v12, v14, v16, v18, v20);
}

@end