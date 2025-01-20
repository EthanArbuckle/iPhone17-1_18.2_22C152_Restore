@interface UIExtendedCorrectionCheckingResult
- (BOOL)isPostEditingResult;
- (UIExtendedCorrectionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 sentenceRange:(_NSRange)a5 detail:(id)a6;
- (_NSRange)sentenceRange;
- (id)detail;
@end

@implementation UIExtendedCorrectionCheckingResult

- (UIExtendedCorrectionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 sentenceRange:(_NSRange)a5 detail:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)UIExtendedCorrectionCheckingResult;
  v13 = -[NSSubstitutionCheckingResult initWithRange:replacementString:](&v18, sel_initWithRange_replacementString_, v10, v9, a4);
  v14 = v13;
  if (v13)
  {
    v13->_sentenceRange.NSUInteger location = location;
    v13->_sentenceRange.NSUInteger length = length;
    uint64_t v15 = [v12 copy];
    detail = v14->_detail;
    v14->_detail = (NSDictionary *)v15;
  }
  return v14;
}

- (_NSRange)sentenceRange
{
  p_sentenceRange = &self->_sentenceRange;
  NSUInteger location = self->_sentenceRange.location;
  NSUInteger length = p_sentenceRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)detail
{
  return self->_detail;
}

- (BOOL)isPostEditingResult
{
  return self->_detail != 0;
}

- (void).cxx_destruct
{
}

@end