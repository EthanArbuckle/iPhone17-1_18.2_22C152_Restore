@interface NSDecimalNumber(SiriCoreSQLiteValue)
- (uint64_t)siriCoreSQLiteValue_textRepresentation;
- (uint64_t)siriCoreSQLiteValue_type;
@end

@implementation NSDecimalNumber(SiriCoreSQLiteValue)

- (uint64_t)siriCoreSQLiteValue_textRepresentation
{
  id v1 = [a1 stringValue];
  uint64_t v2 = [v1 UTF8String];

  return v2;
}

- (uint64_t)siriCoreSQLiteValue_type
{
  return 5;
}

@end