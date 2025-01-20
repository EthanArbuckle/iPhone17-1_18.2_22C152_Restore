@interface UIApplicationUsesAlternateFont
@end

@implementation UIApplicationUsesAlternateFont

void ___UIApplicationUsesAlternateFont_block_invoke()
{
  if (os_variant_has_internal_diagnostics())
  {
    CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"UIUseAlternateFont", (CFStringRef)*MEMORY[0x1E4F1D3B8]);
    v1 = (void *)v0;
    if (v0)
    {
      v4 = (void *)v0;
      char v2 = objc_opt_respondsToSelector();
      v1 = v4;
      if (v2)
      {
        char v3 = [v4 BOOLValue];
        v1 = v4;
        byte_1EB25B50E = v3;
      }
    }
  }
}

@end