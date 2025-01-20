@interface NSDictionary
+ (NSDictionary)dictionaryWithContentsOfPlistData:(id)a3;
@end

@implementation NSDictionary

+ (NSDictionary)dictionaryWithContentsOfPlistData:(id)a3
{
  CFPropertyListRef v3 = CFPropertyListCreateWithData(kCFAllocatorDefault, (CFDataRef)a3, 0, 0, 0);
  if (!v3) {
    return 0;
  }
  v4 = v3;
  objc_opt_class();
  v5 = (NSDictionary *)(id)TSUDynamicCast();
  if (!v5) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/NSDictionary_THAdditions.m") lineNumber:23 description:@"invalid nil value for '%s'", "plistDict"];
  }
  CFRelease(v4);
  return v5;
}

@end