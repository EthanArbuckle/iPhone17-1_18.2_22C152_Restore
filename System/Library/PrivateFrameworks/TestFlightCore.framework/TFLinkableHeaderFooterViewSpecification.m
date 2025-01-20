@interface TFLinkableHeaderFooterViewSpecification
+ (double)bottomPaddingForShowingHeader:(BOOL)a3;
+ (double)topPaddingFromFirstBaselineForShowingHeader:(BOOL)a3;
+ (id)createTextViewFontForTraitCollection:(id)a3;
+ (id)textViewFontColor;
@end

@implementation TFLinkableHeaderFooterViewSpecification

+ (double)topPaddingFromFirstBaselineForShowingHeader:(BOOL)a3
{
  if (a3)
  {
    v3.n128_u64[0] = 0x4046800000000000;
    v4.n128_u64[0] = 0x404E800000000000;
  }
  else
  {
    v3.n128_u64[0] = 20.0;
    v4.n128_u64[0] = 27.0;
  }
  PPMScaledFloatValue(a1, a2, v3, v4);
  return result;
}

+ (double)bottomPaddingForShowingHeader:(BOOL)a3
{
  if (a3)
  {
    v3.n128_u64[0] = 10.0;
    v4.n128_u64[0] = 14.0;
  }
  else
  {
    v3.n128_u64[0] = 20.0;
    v4.n128_u64[0] = 27.0;
  }
  PPMScaledFloatValue(a1, a2, v3, v4);
  return result;
}

+ (id)createTextViewFontForTraitCollection:(id)a3
{
  __n128 v3 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280] compatibleWithTraitCollection:a3];
  __n128 v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];
  v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)textViewFontColor
{
  return (id)[MEMORY[0x263F1C550] secondaryLabelColor];
}

@end