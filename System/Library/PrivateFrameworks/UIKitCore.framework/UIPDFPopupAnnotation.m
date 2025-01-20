@interface UIPDFPopupAnnotation
- (BOOL)recognizeGestures;
- (CGRect)adjustedBounds;
- (CGRect)bounds;
- (Class)viewClass;
- (UIPDFAnnotation)parent;
- (UIPDFPopupAnnotation)init;
- (UIPDFPopupAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3;
- (int)annotationType;
- (void)setAdjustedBounds:(CGRect)a3;
- (void)setParent:(id)a3;
@end

@implementation UIPDFPopupAnnotation

- (UIPDFPopupAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIPDFPopupAnnotation;
  result = [(UIPDFAnnotation *)&v5 initWithAnnotationDictionary:a3];
  if (result)
  {
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_adjustedBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_adjustedBounds.size = v4;
  }
  return result;
}

- (UIPDFPopupAnnotation)init
{
  v4.receiver = self;
  v4.super_class = (Class)UIPDFPopupAnnotation;
  result = [(UIPDFAnnotation *)&v4 init];
  if (result)
  {
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_adjustedBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_adjustedBounds.size = v3;
  }
  return result;
}

- (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (CGRect)bounds
{
  p_adjustedBounds = &self->_adjustedBounds;
  if (CGRectIsNull(self->_adjustedBounds))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPDFPopupAnnotation;
    [(UIPDFAnnotation *)&v8 bounds];
  }
  else
  {
    double x = p_adjustedBounds->origin.x;
    double y = p_adjustedBounds->origin.y;
    double width = p_adjustedBounds->size.width;
    double height = p_adjustedBounds->size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int)annotationType
{
  return 9;
}

- (BOOL)recognizeGestures
{
  return 1;
}

- (UIPDFAnnotation)parent
{
  return self->parent;
}

- (void)setParent:(id)a3
{
  self->parent = (UIPDFAnnotation *)a3;
}

- (CGRect)adjustedBounds
{
  double x = self->_adjustedBounds.origin.x;
  double y = self->_adjustedBounds.origin.y;
  double width = self->_adjustedBounds.size.width;
  double height = self->_adjustedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAdjustedBounds:(CGRect)a3
{
  self->_adjustedBounds = a3;
}

@end