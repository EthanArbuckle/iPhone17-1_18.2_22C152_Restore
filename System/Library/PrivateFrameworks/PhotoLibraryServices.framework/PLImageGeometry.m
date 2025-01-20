@interface PLImageGeometry
+ (id)geometryWithInputSize:(CGSize)a3 initialOrientation:(int64_t)a4;
+ (id)geometryWithOutputSize:(CGSize)a3 appliedOrientation:(int64_t)a4;
- (BOOL)isMirrored;
- (BOOL)isSizeInverted;
- (CGAffineTransform)_transformFromOrientation:(SEL)a3 toOrientation:(int64_t)a4;
- (CGAffineTransform)appliedTransform;
- (CGAffineTransform)transformFromOrientation:(SEL)a3;
- (CGAffineTransform)transformToOrientation:(SEL)a3;
- (CGRect)_basisRect:(int64_t)a3;
- (CGRect)denormalizeRect:(CGRect)a3 basis:(int64_t)a4;
- (CGRect)inputRect;
- (CGRect)inputRectForOutputRect:(CGRect)a3;
- (CGRect)normalizeRect:(CGRect)a3 basis:(int64_t)a4;
- (CGRect)outputRect;
- (CGRect)outputRectForInputRect:(CGRect)a3;
- (PLImageGeometry)init;
- (PLImageGeometry)initWithInputSize:(CGSize)a3 inputOrientation:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)appliedOrientation;
- (int64_t)inputOrientation;
- (int64_t)userOrientation;
- (void)applyOrientation:(int64_t)a3;
- (void)flipHorizontally;
- (void)flipVertically;
- (void)rotateClockwise;
- (void)rotateCounterClockwise;
- (void)setAppliedOrientation:(int64_t)a3;
- (void)setUserOrientation:(int64_t)a3;
@end

@implementation PLImageGeometry

- (void)setUserOrientation:(int64_t)a3
{
  self->_userOrientation = a3;
}

- (int64_t)userOrientation
{
  return self->_userOrientation;
}

- (int64_t)inputOrientation
{
  return self->_inputOrientation;
}

- (CGRect)inputRect
{
  double x = self->_inputRect.origin.x;
  double y = self->_inputRect.origin.y;
  double width = self->_inputRect.size.width;
  double height = self->_inputRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)PLImageGeometry;
  v3 = [(PLImageGeometry *)&v11 description];
  v4 = (void *)[v3 mutableCopy];

  CGFloat width = self->_inputRect.size.width;
  CGFloat height = self->_inputRect.size.height;
  v7 = PLOrientationName(self->_inputOrientation);
  v8 = PLOrientationName(self->_userOrientation);
  v9 = PLOrientationName([(PLImageGeometry *)self appliedOrientation]);
  [v4 appendFormat:@" Input size: {%f, %f}, Orientation :: original | user | applied  =  %@ | %@ | %@", *(void *)&width, *(void *)&height, v7, v8, v9];

  return v4;
}

- (CGAffineTransform)_transformFromOrientation:(SEL)a3 toOrientation:(int64_t)a4
{
  uint64_t v7 = PLOrientationBetweenOrientations(a4, a5);
  uint64_t v8 = 6;
  if (v7 != 8) {
    uint64_t v8 = v7;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  if (v7 == 6) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = v8;
  }
  *(_OWORD *)&retstr->a = 0uLL;
  [(PLImageGeometry *)self inputRect];
  return (CGAffineTransform *)PLOrientationMakeTransformWithSize(v9, (uint64_t)retstr, v10, v11);
}

- (CGAffineTransform)transformFromOrientation:(SEL)a3
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  int64_t v6 = [(PLImageGeometry *)self appliedOrientation];
  return [(PLImageGeometry *)self _transformFromOrientation:a4 toOrientation:v6];
}

- (CGAffineTransform)transformToOrientation:(SEL)a3
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  int64_t v6 = [(PLImageGeometry *)self appliedOrientation];
  return [(PLImageGeometry *)self _transformFromOrientation:v6 toOrientation:a4];
}

- (CGRect)_basisRect:(int64_t)a3
{
  if (a3 == 1)
  {
    [(PLImageGeometry *)self outputRect];
  }
  else if (!a3)
  {
    [(PLImageGeometry *)self inputRect];
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)normalizeRect:(CGRect)a3 basis:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PLImageGeometry *)self _basisRect:a4];
  double v10 = (x - v8) / v9;
  double v13 = (y - v11) / v12;
  double v14 = width / v9;
  double v15 = height / v12;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v10;
  return result;
}

- (CGRect)denormalizeRect:(CGRect)a3 basis:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PLImageGeometry *)self _basisRect:a4];
  double v10 = v8 + x * v9;
  double v13 = v11 + y * v12;
  double v14 = width * v9;
  double v15 = height * v12;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v10;
  return result;
}

- (CGRect)outputRectForInputRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int64_t v8 = [(PLImageGeometry *)self appliedOrientation];
  uint64_t v9 = 6;
  if (v8 != 8) {
    uint64_t v9 = v8;
  }
  if (v8 == 6) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = v9;
  }
  [(PLImageGeometry *)self inputRect];
  double v13 = PLOrientationTransformImageRect(v10, v11, v12, x, y, width, height);
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)inputRectForOutputRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [(PLImageGeometry *)self appliedOrientation];
  [(PLImageGeometry *)self outputRect];
  double v11 = PLOrientationTransformImageRect(v8, v9, v10, x, y, width, height);
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)applyOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLImageGeometry.m", 172, @"Invalid parameter not satisfying: %@", @"PLOrientationIsValid(orientation)" object file lineNumber description];
  }
  self->_userOrientation = PLOrientationConcat(self->_userOrientation, a3);
}

- (void)rotateCounterClockwise
{
}

- (void)rotateClockwise
{
}

- (void)flipHorizontally
{
}

- (void)flipVertically
{
}

- (BOOL)isMirrored
{
  unint64_t v2 = [(PLImageGeometry *)self appliedOrientation];
  return (v2 < 8) & (0xB4u >> v2);
}

- (BOOL)isSizeInverted
{
  return (unint64_t)([(PLImageGeometry *)self appliedOrientation] - 5) < 4;
}

- (CGAffineTransform)appliedTransform
{
  int64_t v5 = [(PLImageGeometry *)self appliedOrientation];
  uint64_t v6 = 6;
  if (v5 != 8) {
    uint64_t v6 = v5;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  if (v5 == 6) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = v6;
  }
  *(_OWORD *)&retstr->a = 0uLL;
  [(PLImageGeometry *)self inputRect];
  return (CGAffineTransform *)PLOrientationMakeTransformWithSize(v7, (uint64_t)retstr, v8, v9);
}

- (CGRect)outputRect
{
  uint64_t v3 = [(PLImageGeometry *)self appliedOrientation];
  [(PLImageGeometry *)self inputRect];
  double v5 = v4;
  double v7 = v6;
  [(PLImageGeometry *)self inputRect];
  double v12 = PLOrientationTransformImageRect(v3, v5, v7, v8, v9, v10, v11);
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)setAppliedOrientation:(int64_t)a3
{
  uint64_t v4 = PLOrientationBetweenOrientations([(PLImageGeometry *)self inputOrientation], a3);
  [(PLImageGeometry *)self setUserOrientation:v4];
}

- (int64_t)appliedOrientation
{
  uint64_t v3 = [(PLImageGeometry *)self inputOrientation];
  uint64_t v4 = [(PLImageGeometry *)self userOrientation];
  return PLOrientationConcat(v3, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 2) = self->_userOrientation;
  *((void *)result + 1) = self->_inputOrientation;
  CGPoint origin = self->_inputRect.origin;
  *(CGSize *)((char *)result + 40) = self->_inputRect.size;
  *(CGPoint *)((char *)result + 24) = origin;
  return result;
}

- (PLImageGeometry)initWithInputSize:(CGSize)a3 inputOrientation:(int64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if ((unint64_t)(a4 - 1) >= 8)
  {
    CGFloat v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLImageGeometry.m", 88, @"Invalid parameter not satisfying: %@", @"PLOrientationIsValid(orientation)" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PLImageGeometry;
  id result = [(PLImageGeometry *)&v11 init];
  if (result)
  {
    result->_inputRect.origin.CGFloat x = 0.0;
    result->_inputRect.origin.CGFloat y = 0.0;
    result->_inputRect.size.CGFloat width = width;
    result->_inputRect.size.CGFloat height = height;
    result->_inputOrientation = a4;
    result->_userOrientation = 1;
  }
  return result;
}

- (PLImageGeometry)init
{
  return -[PLImageGeometry initWithInputSize:inputOrientation:](self, "initWithInputSize:inputOrientation:", 1, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

+ (id)geometryWithOutputSize:(CGSize)a3 appliedOrientation:(int64_t)a4
{
  if ((unint64_t)(a4 - 5) >= 4) {
    double width = a3.width;
  }
  else {
    double width = a3.height;
  }
  if ((unint64_t)(a4 - 5) < 4) {
    a3.CGFloat height = a3.width;
  }
  return (id)[a1 geometryWithInputSize:width initialOrientation:a3.height];
}

+ (id)geometryWithInputSize:(CGSize)a3 initialOrientation:(int64_t)a4
{
  double v5 = objc_msgSend(objc_alloc((Class)a1), "initWithInputSize:inputOrientation:", 1, a3.width, a3.height);
  [v5 applyOrientation:a4];
  return v5;
}

@end