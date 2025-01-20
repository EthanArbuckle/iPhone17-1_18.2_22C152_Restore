@interface NTKAstronomyFaceViewLocalizedNow
@end

@implementation NTKAstronomyFaceViewLocalizedNow

void ___NTKAstronomyFaceViewLocalizedNow_block_invoke()
{
  uint64_t v0 = NTKClockFaceLocalizedString(@"ASTRONOMY_DATE_NOW", @"NOW");
  v1 = (void *)_NTKAstronomyFaceViewLocalizedNow_nowString;
  _NTKAstronomyFaceViewLocalizedNow_nowString = v0;
}

@end