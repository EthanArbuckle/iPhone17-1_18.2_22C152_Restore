@interface ICSearchTextCheckingResult
- (ICSearchTextCheckingResult)initWithRange:(_NSRange)a3;
- (ICSearchTextCheckingResult)initWithRange:(_NSRange)a3 csEvaluatorMatchString:(id)a4;
- (NSString)csEvaluatorMatchString;
- (_NSRange)ic_range;
- (void)setCsEvaluatorMatchString:(id)a3;
- (void)setIc_range:(_NSRange)a3;
@end

@implementation ICSearchTextCheckingResult

- (ICSearchTextCheckingResult)initWithRange:(_NSRange)a3
{
  return -[ICSearchTextCheckingResult initWithRange:csEvaluatorMatchString:](self, "initWithRange:csEvaluatorMatchString:", a3.location, a3.length, 0);
}

- (ICSearchTextCheckingResult)initWithRange:(_NSRange)a3 csEvaluatorMatchString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSearchTextCheckingResult;
  v9 = [(ICSearchTextCheckingResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_ic_range.NSUInteger location = location;
    v9->_ic_range.NSUInteger length = length;
    objc_storeStrong((id *)&v9->_csEvaluatorMatchString, a4);
  }

  return v10;
}

- (NSString)csEvaluatorMatchString
{
  return self->_csEvaluatorMatchString;
}

- (void)setCsEvaluatorMatchString:(id)a3
{
}

- (_NSRange)ic_range
{
  p_ic_range = &self->_ic_range;
  NSUInteger location = self->_ic_range.location;
  NSUInteger length = p_ic_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setIc_range:(_NSRange)a3
{
  self->_ic_range = a3;
}

- (void).cxx_destruct
{
}

@end