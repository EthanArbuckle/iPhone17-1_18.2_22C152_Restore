@interface UIHIDPathShouldPopulatePointerForce
@end

@implementation UIHIDPathShouldPopulatePointerForce

void ___UIHIDPathShouldPopulatePointerForce_block_invoke()
{
  _UIHIDPathShouldPopulatePointerForce_shouldPopulate = dyld_program_sdk_at_least();
  if ((_UIHIDPathShouldPopulatePointerForce_shouldPopulate & 1) == 0)
  {
    v0 = _UIMainBundleIdentifier();
    if (v0)
    {
      v3 = v0;
      char v1 = [&unk_1ED3F0E50 containsObject:v0];
      v0 = v3;
      char v2 = v1 ^ 1;
    }
    else
    {
      char v2 = 0;
    }
    _UIHIDPathShouldPopulatePointerForce_shouldPopulate = v2;
  }
}

@end