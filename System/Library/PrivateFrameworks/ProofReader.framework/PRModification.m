@interface PRModification
- (_NSRange)additionalSyllableRange;
- (_NSRange)range;
- (_NSRange)syllableRange;
- (double)modificationScore;
- (id)replacementString;
- (unint64_t)modificationType;
@end

@implementation PRModification

- (_NSRange)range
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)replacementString
{
  return 0;
}

- (unint64_t)modificationType
{
  return 1;
}

- (_NSRange)syllableRange
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)additionalSyllableRange
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (double)modificationScore
{
  return 0.0;
}

@end