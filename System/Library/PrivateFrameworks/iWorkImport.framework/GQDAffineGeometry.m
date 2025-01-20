@interface GQDAffineGeometry
+ (CGRect)boundsOfTransformedRect:(CGRect)a3 transform:(id)a4;
+ (const)stateForReading;
+ (void)transformRect:(CGRect)a3 transform:(id)a4 upperLeft:(CGPoint *)a5 lowerLeft:(CGPoint *)a6 lowerRight:(CGPoint *)a7 upperRight:(CGPoint *)a8;
- (BOOL)aspectRatioLocked;
- (BOOL)horizontalFlip;
- (BOOL)sizesLocked;
- (BOOL)verticalFlip;
- (CGAffineTransform)transform;
- (CGAffineTransform)transformHasVFlip:(SEL)a3 vFlip:(BOOL)a4 hasHFlip:(BOOL)a5 hFlip:(BOOL)a6;
- (CGPoint)nonrotatedPosition;
- (CGPoint)position;
- (CGRect)naturalBounds;
- (CGSize)naturalSize;
- (CGSize)size;
- (CGSize)sizeOfBoundingBox;
- (float)angle;
- (float)shearXAngle;
- (float)shearYAngle;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (void)setAngle:(float)a3;
- (void)setAspectRatioLocked:(BOOL)a3;
- (void)setHorizontalFlip:(BOOL)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setShearXAngle:(float)a3;
- (void)setShearYAngle:(float)a3;
- (void)setSize:(CGSize)a3;
- (void)setSizesLocked:(BOOL)a3;
- (void)setVerticalFlip:(BOOL)a3;
@end

@implementation GQDAffineGeometry

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A35E8, (xmlChar *)"angle");
  *(float *)&double v5 = v5;
  self->mAngle = *(float *)&v5;
  sub_433CC(a3, qword_A35E8, (xmlChar *)"shearXAngle");
  *(float *)&double v6 = v6;
  self->mShearXAngle = *(float *)&v6;
  sub_433CC(a3, qword_A35E8, (xmlChar *)"shearYAngle");
  *(float *)&double v7 = v7;
  self->mShearYAngle = *(float *)&v7;
  self->mSizesLocked = sub_42DCC(a3, qword_A35E8, (xmlChar *)"sizesLocked", 0);
  self->mAspectRatioLocked = sub_42DCC(a3, qword_A35E8, (xmlChar *)"aspectRatioLocked", 0);
  self->mHorizontalFlip = sub_42DCC(a3, qword_A35E8, (xmlChar *)"horizontalFlip", 0);
  self->mVerticalFlip = sub_42DCC(a3, qword_A35E8, (xmlChar *)"verticalFlip", 0);
  return 1;
}

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9D810;
}

- (CGSize)naturalSize
{
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  self->mNaturalSize = a3;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (BOOL)sizesLocked
{
  return self->mSizesLocked;
}

- (void)setSizesLocked:(BOOL)a3
{
  self->mSizesLocked = a3;
}

- (BOOL)aspectRatioLocked
{
  return self->mAspectRatioLocked;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  self->mAspectRatioLocked = a3;
}

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (float)angle
{
  return self->mAngle;
}

- (void)setAngle:(float)a3
{
  self->mAngle = a3;
}

- (BOOL)horizontalFlip
{
  return self->mHorizontalFlip;
}

- (void)setHorizontalFlip:(BOOL)a3
{
  self->mHorizontalFlip = a3;
}

- (BOOL)verticalFlip
{
  return self->mVerticalFlip;
}

- (void)setVerticalFlip:(BOOL)a3
{
  self->mVerticalFlip = a3;
}

- (float)shearXAngle
{
  return self->mShearXAngle;
}

- (void)setShearXAngle:(float)a3
{
  self->mShearXAngle = a3;
}

- (float)shearYAngle
{
  return self->mShearYAngle;
}

- (void)setShearYAngle:(float)a3
{
  self->mShearYAngle = a3;
}

- (CGSize)sizeOfBoundingBox
{
  [(GQDAffineGeometry *)self angle];
  double v4 = fmod(v3, 180.0);
  if (v4 < 0.0) {
    double v4 = v4 + 180.0;
  }
  if (v4 > 90.0) {
    double v4 = 180.0 - v4;
  }
  __double2 v5 = __sincos_stret(v4 * 3.14159265 / 180.0);
  float cosval = v5.__cosval;
  float sinval = v5.__sinval;
  [(GQDAffineGeometry *)self size];
  double v10 = v8 * sinval + v9 * cosval;
  double v11 = v8 * cosval + v9 * sinval;
  double v12 = v10;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (CGPoint)nonrotatedPosition
{
  [(GQDAffineGeometry *)self size];
  double v4 = v3;
  double v6 = v5;
  [(GQDAffineGeometry *)self sizeOfBoundingBox];
  double v8 = v7;
  double v10 = v9;
  [(GQDAffineGeometry *)self position];
  double v12 = v11 + (v8 - v4) * 0.5;
  double v14 = v13 + (v10 - v6) * 0.5;
  result.double y = v14;
  result.double x = v12;
  return result;
}

- (CGRect)naturalBounds
{
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

+ (void)transformRect:(CGRect)a3 transform:(id)a4 upperLeft:(CGPoint *)a5 lowerLeft:(CGPoint *)a6 lowerRight:(CGPoint *)a7 upperRight:(CGPoint *)a8
{
  float x = a3.origin.x;
  float y = a3.origin.y;
  float v15 = a3.origin.x + a3.size.width;
  float v16 = a3.origin.y + a3.size.height;
  a5->float x = x;
  a5->float y = y;
  CGFloat v17 = v16;
  a6->float x = x;
  a6->float y = v17;
  CGFloat v18 = v15;
  a7->float x = v18;
  a7->float y = v17;
  a8->float x = v18;
  a8->float y = y;
  objc_msgSend(a4, "transformPoint:", a5->x, a5->y);
  a5->float x = v19;
  a5->float y = v20;
  objc_msgSend(a4, "transformPoint:", a6->x, a6->y);
  a6->float x = v21;
  a6->float y = v22;
  objc_msgSend(a4, "transformPoint:", a7->x, a7->y);
  a7->float x = v23;
  a7->float y = v24;
  objc_msgSend(a4, "transformPoint:", a8->x, a8->y);
  a8->float x = v25;
  a8->float y = v26;
}

+ (CGRect)boundsOfTransformedRect:(CGRect)a3 transform:(id)a4
{
  objc_msgSend(a1, "transformRect:transform:upperLeft:lowerLeft:lowerRight:upperRight:", a4, &v23, &v21, &v19, &v17, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v19;
  double v5 = v20;
  if (v19 >= v17) {
    double v6 = v17;
  }
  else {
    double v6 = v19;
  }
  if (v19 < v17) {
    double v4 = v17;
  }
  if (v21 < v6) {
    double v6 = v21;
  }
  if (v23 < v6) {
    double v6 = v23;
  }
  if (v21 >= v4) {
    double v4 = v21;
  }
  float v7 = v6;
  if (v23 >= v4) {
    double v4 = v23;
  }
  float v8 = v4;
  if (v20 >= v18) {
    double v9 = v18;
  }
  else {
    double v9 = v20;
  }
  if (v20 < v18) {
    double v5 = v18;
  }
  if (v22 < v9) {
    double v9 = v22;
  }
  if (v24 < v9) {
    double v9 = v24;
  }
  float v10 = v9;
  if (v22 >= v5) {
    double v11 = v22;
  }
  else {
    double v11 = v5;
  }
  if (v24 >= v11) {
    double v11 = v24;
  }
  float v12 = v11;
  double v13 = v7;
  double v14 = v10;
  double v15 = (float)(v8 - v7);
  double v16 = (float)(v12 - v10);
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.float y = v14;
  result.origin.float x = v13;
  return result;
}

- (CGAffineTransform)transform
{
  if (self) {
    return (CGAffineTransform *)[(CGAffineTransform *)self transformHasVFlip:0 vFlip:0 hasHFlip:0 hFlip:0];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tfloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGAffineTransform)transformHasVFlip:(SEL)a3 vFlip:(BOOL)a4 hasHFlip:(BOOL)a5 hFlip:(BOOL)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  int mHorizontalFlip = self->mHorizontalFlip;
  int v12 = a6 && a7;
  int mVerticalFlip = self->mVerticalFlip;
  id v14 = objc_alloc_init((Class)NSAffineTransform);
  [v14 rotateByDegrees:(float)-self->mAngle];
  id v15 = objc_alloc_init((Class)NSAffineTransform);
  double v16 = v15;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  if (v15) {
    [v15 transformStruct];
  }
  int v17 = v8 && v7;
  *((double *)&v31 + 1) = -tan(self->mShearXAngle * 3.14159265 / 180.0);
  *(double *)&long long v32 = -tan(self->mShearYAngle * 3.14159265 / 180.0);
  v30[1] = v32;
  v30[2] = v33;
  v30[0] = v31;
  [v16 setTransformStruct:v30];
  [v14 prependTransform:v16];

  if (mHorizontalFlip != v12) {
    [v14 scaleXBy:-1.0 yBy:1.0];
  }
  if (mVerticalFlip != v17) {
    [v14 scaleXBy:1.0 yBy:-1.0];
  }
  if (!self->mSizesLocked)
  {
    double width = self->mNaturalSize.width;
    double v19 = 1.0;
    double v20 = 1.0;
    if (width != 0.0)
    {
      float v21 = self->mSize.width / width;
      double v20 = v21;
    }
    double height = self->mNaturalSize.height;
    if (height != 0.0)
    {
      float v23 = self->mSize.height / height;
      double v19 = v23;
    }
    [v14 scaleXBy:v20 yBy:v19];
  }
  [(GQDAffineGeometry *)self naturalBounds];
  +[GQDAffineGeometry boundsOfTransformedRect:transform:](GQDAffineGeometry, "boundsOfTransformedRect:transform:", v14);
  double v25 = v24;
  double v27 = v26;
  id v28 = objc_alloc_init((Class)NSAffineTransform);
  [v28 translateXBy:self->mPosition.x - v25 yBy:self->mPosition.y - v27];
  [v14 appendTransform:v28];

  if (v14) {
    [v14 transformStruct];
  }

  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tfloat x = 0u;
  return result;
}

@end