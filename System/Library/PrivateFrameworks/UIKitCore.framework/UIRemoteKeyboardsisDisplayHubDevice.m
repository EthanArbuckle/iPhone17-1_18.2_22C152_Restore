@interface UIRemoteKeyboardsisDisplayHubDevice
@end

@implementation UIRemoteKeyboardsisDisplayHubDevice

void ___UIRemoteKeyboardsisDisplayHubDevice_block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  if (v0)
  {
    v1 = (const void *)v0;
    if ([&unk_1ED3F08E0 containsObject:v0]) {
      byte_1EB25C66C = 1;
    }
    CFRelease(v1);
  }
}

@end