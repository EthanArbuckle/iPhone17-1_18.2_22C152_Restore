@interface BKPDFAnnotationCounterResult
- (unint64_t)numberOfMarkupAnnotations;
- (unint64_t)numberOfMarkupAnnotationsWithPopups;
- (void)setNumberOfMarkupAnnotations:(unint64_t)a3;
- (void)setNumberOfMarkupAnnotationsWithPopups:(unint64_t)a3;
@end

@implementation BKPDFAnnotationCounterResult

- (unint64_t)numberOfMarkupAnnotations
{
  return self->_numberOfMarkupAnnotations;
}

- (void)setNumberOfMarkupAnnotations:(unint64_t)a3
{
  self->_numberOfMarkupAnnotations = a3;
}

- (unint64_t)numberOfMarkupAnnotationsWithPopups
{
  return self->_numberOfMarkupAnnotationsWithPopups;
}

- (void)setNumberOfMarkupAnnotationsWithPopups:(unint64_t)a3
{
  self->_numberOfMarkupAnnotationsWithPopups = a3;
}

@end