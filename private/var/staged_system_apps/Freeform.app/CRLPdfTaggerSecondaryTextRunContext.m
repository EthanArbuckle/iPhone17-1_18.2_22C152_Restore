@interface CRLPdfTaggerSecondaryTextRunContext
- (CRLPdfTaggerSecondaryTextRunContext)initWithStateOfTagger:(id)a3 charRange:(_NSRange)a4 baseTextRange:(_NSRange)a5;
- (_NSRange)baseTextRange;
- (_NSRange)charRange;
@end

@implementation CRLPdfTaggerSecondaryTextRunContext

- (CRLPdfTaggerSecondaryTextRunContext)initWithStateOfTagger:(id)a3 charRange:(_NSRange)a4 baseTextRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a4.location;
  v10.receiver = self;
  v10.super_class = (Class)CRLPdfTaggerSecondaryTextRunContext;
  result = [(CRLPdfTaggerContext *)&v10 initWithStateOfTagger:a3];
  if (result)
  {
    result->_charRange.NSUInteger location = v8;
    result->_charRange.NSUInteger length = v7;
    result->_baseTextRange.NSUInteger location = location;
    result->_baseTextRange.NSUInteger length = length;
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

- (_NSRange)baseTextRange
{
  p_baseTextRange = &self->_baseTextRange;
  NSUInteger location = self->_baseTextRange.location;
  NSUInteger length = p_baseTextRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end