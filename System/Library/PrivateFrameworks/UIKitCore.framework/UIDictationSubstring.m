@interface UIDictationSubstring
- (NSString)string;
- (UIDictationSubstring)initWithString:(id)a3 range:(_NSRange)a4 enclosingRange:(_NSRange)a5;
- (_NSRange)enclosingRange;
- (_NSRange)range;
- (void)setEnclosingRange:(_NSRange)a3;
- (void)setRange:(_NSRange)a3;
- (void)setString:(id)a3;
@end

@implementation UIDictationSubstring

- (UIDictationSubstring)initWithString:(id)a3 range:(_NSRange)a4 enclosingRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a4.location;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIDictationSubstring;
  v12 = [(UIDictationSubstring *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_string, a3);
    v13->_range.NSUInteger location = v8;
    v13->_range.NSUInteger length = v7;
    v13->_enclosingRange.NSUInteger location = location;
    v13->_enclosingRange.NSUInteger length = length;
  }

  return v13;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)enclosingRange
{
  NSUInteger length = self->_enclosingRange.length;
  NSUInteger location = self->_enclosingRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setEnclosingRange:(_NSRange)a3
{
  self->_enclosingRange = a3;
}

- (void).cxx_destruct
{
}

@end