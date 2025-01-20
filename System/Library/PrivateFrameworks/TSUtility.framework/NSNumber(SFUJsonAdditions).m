@interface NSNumber(SFUJsonAdditions)
- (uint64_t)appendJsonStringToString:()SFUJsonAdditions;
@end

@implementation NSNumber(SFUJsonAdditions)

- (uint64_t)appendJsonStringToString:()SFUJsonAdditions
{
  if (*(unsigned char *)[a1 objCType] == 99)
  {
    if ([a1 BOOLValue]) {
      v5 = @"true";
    }
    else {
      v5 = @"false";
    }
  }
  else
  {
    v5 = (__CFString *)[a1 stringValue];
  }
  return [a3 appendString:v5];
}

@end