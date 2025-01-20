@interface NSWritingToolsProofreadingSuggestion
- (NSAttributedString)replacementString;
- (NSUUID)uuid;
- (NSWritingToolsProofreadingSuggestion)initWithUUID:(id)a3 originalRange:(_NSRange)a4 replacementString:(id)a5 state:(int64_t)a6;
- (_NSRange)originalRange;
- (int64_t)lengthDelta;
- (int64_t)state;
- (void)dealloc;
- (void)setState:(int64_t)a3;
@end

@implementation NSWritingToolsProofreadingSuggestion

- (NSWritingToolsProofreadingSuggestion)initWithUUID:(id)a3 originalRange:(_NSRange)a4 replacementString:(id)a5 state:(int64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v13.receiver = self;
  v13.super_class = (Class)NSWritingToolsProofreadingSuggestion;
  v11 = [(NSWritingToolsProofreadingSuggestion *)&v13 init];
  if (v11)
  {
    v11->_uuid = (NSUUID *)a3;
    v11->_originalRange.NSUInteger location = location;
    v11->_originalRange.NSUInteger length = length;
    v11->_replacementString = (NSAttributedString *)[a5 copy];
    v11->_lengthDelta = [a5 length] - length;
    v11->_state = a6;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSWritingToolsProofreadingSuggestion;
  [(NSWritingToolsProofreadingSuggestion *)&v3 dealloc];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (_NSRange)originalRange
{
  NSUInteger length = self->_originalRange.length;
  NSUInteger location = self->_originalRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSAttributedString)replacementString
{
  return self->_replacementString;
}

- (int64_t)lengthDelta
{
  return self->_lengthDelta;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end