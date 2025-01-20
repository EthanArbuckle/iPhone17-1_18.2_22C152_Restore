@interface AXSAccessibilityPreferenceDomain
@end

@implementation AXSAccessibilityPreferenceDomain

CFStringRef ___AXSAccessibilityPreferenceDomain_block_invoke()
{
  uint64_t v0 = kAXSAccessibilityPreferenceDomain;
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v2 = AXCPSharedResourcesDirectory();
  CFStringRef result = CFStringCreateWithFormat(v1, 0, @"%@/Library/Preferences/%@", v2, v0);
  _AXSAccessibilityPreferenceDomain_Domain = (uint64_t)result;
  return result;
}

@end