@interface THAnnotationAnchor
+ (id)annotationAnchorWithContentNode:(id)a3 annotation:(id)a4 noteRange:(_NSRange)a5;
- (THAnnotation)annotation;
- (THAnnotationAnchor)initWithContentNode:(id)a3 annotation:(id)a4 noteRange:(_NSRange)a5;
- (_NSRange)noteRange;
- (unint64_t)absolutePageIndex;
- (void)dealloc;
- (void)setAnnotation:(id)a3;
- (void)setNoteRange:(_NSRange)a3;
@end

@implementation THAnnotationAnchor

- (THAnnotationAnchor)initWithContentNode:(id)a3 annotation:(id)a4 noteRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v10.receiver = self;
  v10.super_class = (Class)THAnnotationAnchor;
  v8 = [(THModelBoundAnchor *)&v10 initWithContentNode:a3];
  if (v8)
  {
    v8->_annotation = (THAnnotation *)a4;
    v8->_noteRange.NSUInteger location = location;
    v8->_noteRange.NSUInteger length = length;
  }
  return v8;
}

+ (id)annotationAnchorWithContentNode:(id)a3 annotation:(id)a4 noteRange:(_NSRange)a5
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithContentNode:a3 annotation:a4 noteRange:a5.location, a5.length];

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THAnnotationAnchor;
  [(THModelBoundAnchor *)&v3 dealloc];
}

- (unint64_t)absolutePageIndex
{
  v2 = [(THAnnotationAnchor *)self annotation];

  return (unint64_t)[(THAnnotation *)v2 annotationAbsolutePhysicalPageIndex];
}

- (THAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (_NSRange)noteRange
{
  p_noteRange = &self->_noteRange;
  NSUInteger location = self->_noteRange.location;
  NSUInteger length = p_noteRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setNoteRange:(_NSRange)a3
{
  self->_noteRange = a3;
}

@end