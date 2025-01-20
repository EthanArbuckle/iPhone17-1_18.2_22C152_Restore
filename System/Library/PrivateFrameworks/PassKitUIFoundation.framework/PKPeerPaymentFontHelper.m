@interface PKPeerPaymentFontHelper
+ (id)chiseledCashFontDescriptor;
@end

@implementation PKPeerPaymentFontHelper

+ (id)chiseledCashFontDescriptor
{
  if (chiseledCashFontDescriptor_onceToken != -1) {
    dispatch_once(&chiseledCashFontDescriptor_onceToken, &__block_literal_global);
  }
  v2 = (void *)chiseledCashFontDescriptor_descriptorWithPalette;

  return v2;
}

void __53__PKPeerPaymentFontHelper_chiseledCashFontDescriptor__block_invoke()
{
  v9[1] = *MEMORY[0x263EF8340];
  v0 = PKPassKitUIFoundationBundle();
  CFURLRef v1 = [v0 URLForResource:@"SFCash-Chiseled" withExtension:@"otf"];

  if (v1)
  {
    CFArrayRef FontDescriptorsFromURL = CTFontManagerCreateFontDescriptorsFromURL(v1);
    if (FontDescriptorsFromURL)
    {
      CFArrayRef v3 = FontDescriptorsFromURL;
      if (CFArrayGetCount(FontDescriptorsFromURL) >= 1)
      {
        ValueAtIndex = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(v3, 0);
        uint64_t v8 = *MEMORY[0x263F03B08];
        v9[0] = &unk_26D086818;
        CFDictionaryRef v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
        uint64_t v6 = CTFontDescriptorCreateCopyWithAttributes(ValueAtIndex, v5);
        v7 = (void *)chiseledCashFontDescriptor_descriptorWithPalette;
        chiseledCashFontDescriptor_descriptorWithPalette = v6;
      }
      CFRelease(v3);
    }
  }
}

@end