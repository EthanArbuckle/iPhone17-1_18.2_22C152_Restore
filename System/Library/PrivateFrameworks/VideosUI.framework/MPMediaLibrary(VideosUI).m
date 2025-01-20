@interface MPMediaLibrary(VideosUI)
- (BOOL)vui_isDeviceMediaLibrary;
- (uint64_t)vui_isHomeShareMediaLibrary;
@end

@implementation MPMediaLibrary(VideosUI)

- (BOOL)vui_isDeviceMediaLibrary
{
  v2 = [MEMORY[0x1E4F31940] deviceMediaLibrary];
  BOOL v3 = v2 == a1;

  return v3;
}

- (uint64_t)vui_isHomeShareMediaLibrary
{
  return objc_msgSend(a1, "vui_isDeviceMediaLibrary") ^ 1;
}

@end