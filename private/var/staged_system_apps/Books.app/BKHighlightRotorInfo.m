@interface BKHighlightRotorInfo
- (AEAnnotationAccessibility)annotation;
- (id)type;
- (void)setAnnotation:(id)a3;
@end

@implementation BKHighlightRotorInfo

- (id)type
{
  return @"Highlight";
}

- (AEAnnotationAccessibility)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end