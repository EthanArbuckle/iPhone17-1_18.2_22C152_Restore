@interface UIDevice
@end

@implementation UIDevice

void __40__UIDevice_TSUAdditions__platformString__block_invoke()
{
  size_t size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  v0 = malloc_type_malloc(size, 0xAA6AC045uLL);
  sysctlbyname("hw.machine", v0, &size, 0, 0);
  uint64_t v1 = [[NSString alloc] initWithUTF8String:v0];
  free(v0);
  platformString_s_platformString = v1;
  if (!v1)
  {
    uint64_t v2 = [NSString stringWithUTF8String:"+[UIDevice(TSUAdditions) platformString]_block_invoke"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/UIDevice_TSUAdditions.m"], 36, 0, "invalid nil value for '%{public}s'", "s_platformString");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
}

@end