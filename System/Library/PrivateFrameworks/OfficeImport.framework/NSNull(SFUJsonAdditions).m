@interface NSNull(SFUJsonAdditions)
- (uint64_t)sfu_appendJsonStringToString:()SFUJsonAdditions;
@end

@implementation NSNull(SFUJsonAdditions)

- (uint64_t)sfu_appendJsonStringToString:()SFUJsonAdditions
{
  return [a3 appendString:@"null"];
}

@end