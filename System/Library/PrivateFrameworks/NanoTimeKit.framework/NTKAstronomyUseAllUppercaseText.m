@interface NTKAstronomyUseAllUppercaseText
@end

@implementation NTKAstronomyUseAllUppercaseText

void ___NTKAstronomyUseAllUppercaseText_block_invoke()
{
  v0 = NTKClockFaceLocalizedString(@"ASTRONOMY_USE_ALL_UPPERCASE_TEXT", @"1");
  if (v0)
  {
    v2 = v0;
    int v1 = [@"1" isEqualToString:v0];
    v0 = v2;
    if (v1) {
      _NTKAstronomyUseAllUppercaseText_useAllUppercaseText = 1;
    }
  }
}

@end