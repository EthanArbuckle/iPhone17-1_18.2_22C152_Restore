@interface UIScreenSupportsDynamicMainScreen
@end

@implementation UIScreenSupportsDynamicMainScreen

uint64_t ___UIScreenSupportsDynamicMainScreen_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    char v1 = 1;
  }
  else
  {
    uint64_t result = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_DynamicMainScreen, @"DynamicMainScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    char v1 = (byte_1EB257594 != 0) & ~(_BYTE)result;
  }
  byte_1EB25C544 = v1;
  return result;
}

@end