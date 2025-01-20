@interface NSBundle(ISAdditions)
+ (uint64_t)pathForITunesStoreResource:()ISAdditions ofType:;
@end

@implementation NSBundle(ISAdditions)

+ (uint64_t)pathForITunesStoreResource:()ISAdditions ofType:
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "pathForResource:ofType:", a3, a4);
  if (!result)
  {
    v7 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    return [v7 pathForResource:a3 ofType:a4];
  }
  return result;
}

@end