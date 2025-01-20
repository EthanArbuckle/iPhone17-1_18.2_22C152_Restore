@interface BKDisplayAnnotationLocation
+ (id)centerAtPoint:(CGPoint)a3;
+ (id)controlledBySupernode;
+ (id)relativeToBottomLeftOfSuper:(CGPoint)a3;
+ (id)relativeToBottomMiddleOfSuper:(CGPoint)a3;
+ (id)relativeToTopLeftOfSuper:(CGPoint)a3;
- (BOOL)definedInReferenceSpace;
- (BOOL)inhibitRotation;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAutoposition;
- (CGPoint)point;
- (CGPoint)superBias;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDefinedInReferenceSpace:(BOOL)a3;
- (void)setInhibitRotation:(BOOL)a3;
- (void)setPoint:(CGPoint)a3;
- (void)setShouldAutoposition:(BOOL)a3;
- (void)setSuperBias:(CGPoint)a3;
@end

@implementation BKDisplayAnnotationLocation

- (void)setDefinedInReferenceSpace:(BOOL)a3
{
  self->_definedInReferenceSpace = a3;
}

- (BOOL)definedInReferenceSpace
{
  return self->_definedInReferenceSpace;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSuperBias:(CGPoint)a3
{
  self->_superBias = a3;
}

- (CGPoint)superBias
{
  double x = self->_superBias.x;
  double y = self->_superBias.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setShouldAutoposition:(BOOL)a3
{
  self->_shouldAutoposition = a3;
}

- (BOOL)shouldAutoposition
{
  return self->_shouldAutoposition;
}

- (void)setInhibitRotation:(BOOL)a3
{
  self->_inhibitRotation = a3;
}

- (BOOL)inhibitRotation
{
  return self->_inhibitRotation;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  int shouldAutoposition = self->_shouldAutoposition;
  if (shouldAutoposition != [v4 shouldAutoposition]) {
    goto LABEL_11;
  }
  int inhibitRotation = self->_inhibitRotation;
  if (inhibitRotation != [v4 inhibitRotation]) {
    goto LABEL_11;
  }
  [v4 superBias];
  BOOL v8 = 0;
  if (self->_superBias.x == v9 && self->_superBias.y == v7)
  {
    int definedInReferenceSpace = self->_definedInReferenceSpace;
    if (definedInReferenceSpace == [v4 definedInReferenceSpace])
    {
      [v4 point];
      BOOL v8 = self->_point.y == v12 && self->_point.x == v11;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v8 = 0;
  }
LABEL_12:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(BKDisplayAnnotationLocation);
  *((unsigned char *)result + 8) = self->_inhibitRotation;
  *((unsigned char *)result + 9) = self->_shouldAutoposition;
  *((_OWORD *)result + 1) = self->_superBias;
  *((_OWORD *)result + 2) = self->_point;
  *((unsigned char *)result + 10) = self->_definedInReferenceSpace;
  return result;
}

+ (id)relativeToBottomMiddleOfSuper:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_alloc_init(BKDisplayAnnotationLocation);
  [(BKDisplayAnnotationLocation *)v5 setShouldAutoposition:1];
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.5, 1.0);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));

  return v5;
}

+ (id)relativeToBottomLeftOfSuper:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_alloc_init(BKDisplayAnnotationLocation);
  [(BKDisplayAnnotationLocation *)v5 setShouldAutoposition:1];
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.0, 1.0);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));

  return v5;
}

+ (id)relativeToTopLeftOfSuper:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_alloc_init(BKDisplayAnnotationLocation);
  [(BKDisplayAnnotationLocation *)v5 setShouldAutoposition:1];
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.0, 0.0);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));

  return v5;
}

+ (id)centerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_alloc_init(BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.5, 0.5);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));

  return v5;
}

+ (id)controlledBySupernode
{
  if (qword_100123168 != -1) {
    dispatch_once(&qword_100123168, &stru_1000F8D10);
  }
  v2 = (void *)qword_100123160;

  return v2;
}

@end