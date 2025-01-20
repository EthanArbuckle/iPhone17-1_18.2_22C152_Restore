@interface CRLPdfTaggerLineFragmentContext
- (CRLPdfTaggerLineFragmentContext)initWithStateOfTagger:(id)a3 lineFragmentCharRange:(_NSRange)a4;
- (_NSRange)lineFragmentCharRange;
@end

@implementation CRLPdfTaggerLineFragmentContext

- (CRLPdfTaggerLineFragmentContext)initWithStateOfTagger:(id)a3 lineFragmentCharRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)CRLPdfTaggerLineFragmentContext;
  result = [(CRLPdfTaggerContext *)&v7 initWithStateOfTagger:a3];
  if (result)
  {
    result->_lineFragmentCharRange.NSUInteger location = location;
    result->_lineFragmentCharRange.NSUInteger length = length;
  }
  return result;
}

- (_NSRange)lineFragmentCharRange
{
  p_lineFragmentCharRange = &self->_lineFragmentCharRange;
  NSUInteger location = self->_lineFragmentCharRange.location;
  NSUInteger length = p_lineFragmentCharRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end