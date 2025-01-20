@interface NSObject(SFUJsonAdditions)
- (uint64_t)appendJsonStringToString:()SFUJsonAdditions;
@end

@implementation NSObject(SFUJsonAdditions)

- (uint64_t)appendJsonStringToString:()SFUJsonAdditions
{
  id v0 = +[TSUAssertionHandler currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"-[NSObject(SFUJsonAdditions) appendJsonStringToString:]"];
  return [v0 handleFailureInFunction:v1, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUJson.m"), 472, @"%@ doesn't support JSON encoding", objc_opt_class() file lineNumber description];
}

@end