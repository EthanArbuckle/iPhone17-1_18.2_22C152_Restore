@interface CRLPdfTaggerPrimaryTextRunContext
- (CRLPdfTaggerPrimaryTextRunContext)initWithStateOfTagger:(id)a3 charRange:(_NSRange)a4;
- (_NSRange)charRange;
@end

@implementation CRLPdfTaggerPrimaryTextRunContext

- (CRLPdfTaggerPrimaryTextRunContext)initWithStateOfTagger:(id)a3 charRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)CRLPdfTaggerPrimaryTextRunContext;
  result = [(CRLPdfTaggerContext *)&v7 initWithStateOfTagger:a3];
  if (result)
  {
    result->_charRange.NSUInteger location = location;
    result->_charRange.NSUInteger length = length;
  }
  return result;
}

- (_NSRange)charRange
{
  p_charRange = &self->_charRange;
  NSUInteger location = self->_charRange.location;
  NSUInteger length = p_charRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end