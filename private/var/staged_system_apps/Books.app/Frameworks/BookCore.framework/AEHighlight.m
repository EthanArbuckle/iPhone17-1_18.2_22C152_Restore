@interface AEHighlight
- (AEAnnotationHighlightData)annotation;
- (BOOL)vertical;
- (NSArray)lines;
- (double)cornerRadius;
- (void)setAnnotation:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setIsVertical:(BOOL)a3;
- (void)setLines:(id)a3;
@end

@implementation AEHighlight

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
}

- (AEAnnotationHighlightData)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (void)setIsVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);

  objc_storeStrong((id *)&self->_lines, 0);
}

@end