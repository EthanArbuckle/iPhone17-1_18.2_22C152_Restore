@interface MAPreferencesCopyValue
@end

@implementation MAPreferencesCopyValue

uint64_t ___MAPreferencesCopyValue_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CFPreferencesCopyAppValue(*(CFStringRef *)(a1 + 32), @"com.apple.MobileAsset");
  return MEMORY[0x1F41817F8]();
}

@end