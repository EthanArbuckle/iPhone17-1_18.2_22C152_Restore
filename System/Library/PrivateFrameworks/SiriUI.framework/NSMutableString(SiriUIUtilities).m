@interface NSMutableString(SiriUIUtilities)
- (uint64_t)siriUIAppendStringWithCommaSeparation:()SiriUIUtilities;
@end

@implementation NSMutableString(SiriUIUtilities)

- (uint64_t)siriUIAppendStringWithCommaSeparation:()SiriUIUtilities
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v4 = (id)[v4 length];
    id v5 = v7;
    if (v4)
    {
      if ([a1 length]) {
        [a1 appendString:@", "];
      }
      id v4 = (id)[a1 appendString:v7];
      id v5 = v7;
    }
  }
  return MEMORY[0x270F9A758](v4, v5);
}

@end