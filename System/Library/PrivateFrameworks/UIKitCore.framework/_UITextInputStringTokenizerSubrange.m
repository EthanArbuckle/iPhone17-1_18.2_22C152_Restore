@interface _UITextInputStringTokenizerSubrange
+ (id)subrangeWithSubstring:(id)a3 basePosition:(id)a4;
- (NSString)substring;
- (UITextPosition)basePosition;
- (_NSRange)relevantRange;
- (id)description;
- (int64_t)indexOfBase;
- (void)setIndexOfBase:(int64_t)a3;
- (void)setRelevantRange:(_NSRange)a3;
@end

@implementation _UITextInputStringTokenizerSubrange

+ (id)subrangeWithSubstring:(id)a3 basePosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = (void *)v8[1];
  v8[1] = v6;
  id v10 = v6;

  v11 = (void *)v8[2];
  v8[2] = v7;

  *((_OWORD *)v8 + 2) = xmmword_186B93450;
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; basePosition = %@>",
               objc_opt_class(),
               self,
               self->_basePosition);
}

- (NSString)substring
{
  return self->_substring;
}

- (UITextPosition)basePosition
{
  return self->_basePosition;
}

- (int64_t)indexOfBase
{
  return self->_indexOfBase;
}

- (void)setIndexOfBase:(int64_t)a3
{
  self->_indexOfBase = a3;
}

- (_NSRange)relevantRange
{
  NSUInteger length = self->_relevantRange.length;
  NSUInteger location = self->_relevantRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRelevantRange:(_NSRange)a3
{
  self->_relevantRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePosition, 0);
  objc_storeStrong((id *)&self->_substring, 0);
}

@end