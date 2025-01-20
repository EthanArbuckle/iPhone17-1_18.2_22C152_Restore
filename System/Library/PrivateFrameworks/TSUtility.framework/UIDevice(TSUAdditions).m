@interface UIDevice(TSUAdditions)
+ (uint64_t)platformString;
@end

@implementation UIDevice(TSUAdditions)

+ (uint64_t)platformString
{
  uint64_t result = platformString_s_platformString;
  if (!platformString_s_platformString)
  {
    objc_sync_enter(obj);
    if (!platformString_s_platformString)
    {
      size_t size = 0;
      sysctlbyname("hw.machine", 0, &size, 0, 0);
      v3 = malloc_type_malloc(size, 0xFAF4E20AuLL);
      sysctlbyname("hw.machine", v3, &size, 0, 0);
      uint64_t v4 = [[NSString alloc] initWithUTF8String:v3];
      free(v3);
      __dmb(0xBu);
      platformString_s_platformString = v4;
      if (!v4)
      {
        id v5 = +[TSUAssertionHandler currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[UIDevice(TSUAdditions) platformString]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/UIDevice_TSUAdditions.m"), 34, @"Couldn't initialize lazy variable %s", "s_platformString");
      }
    }
    objc_sync_exit(obj);
    return platformString_s_platformString;
  }
  return result;
}

@end