@interface MPModelLibraryKeepLocalChangeRequest(NanoMusicSync)
+ (uint64_t)nms_defaultKeepLocalConstraints;
@end

@implementation MPModelLibraryKeepLocalChangeRequest(NanoMusicSync)

+ (uint64_t)nms_defaultKeepLocalConstraints
{
  return 22;
}

@end