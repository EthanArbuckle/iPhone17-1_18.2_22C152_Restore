@interface NSString(TITypingSession)
- (uint64_t)endsInPunctuation;
- (uint64_t)endsInWhitespace;
@end

@implementation NSString(TITypingSession)

- (uint64_t)endsInWhitespace
{
  uint64_t result = [a1 length];
  if (result)
  {
    uint64_t v3 = [a1 characterAtIndex:result - 1];
    v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v5 = [v4 characterIsMember:v3];

    return v5;
  }
  return result;
}

- (uint64_t)endsInPunctuation
{
  uint64_t result = [a1 length];
  if (result)
  {
    uint64_t v3 = [a1 characterAtIndex:result - 1];
    v4 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    uint64_t v5 = [v4 characterIsMember:v3];

    return v5;
  }
  return result;
}

@end