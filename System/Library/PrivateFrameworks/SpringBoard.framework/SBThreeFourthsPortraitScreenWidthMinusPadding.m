@interface SBThreeFourthsPortraitScreenWidthMinusPadding
@end

@implementation SBThreeFourthsPortraitScreenWidthMinusPadding

void ___SBThreeFourthsPortraitScreenWidthMinusPadding_block_invoke()
{
  id v2 = [MEMORY[0x1E4F42D90] mainScreen];
  v0 = [v2 fixedCoordinateSpace];
  [v0 bounds];
  double Width = CGRectGetWidth(v4);
  _SBThreeFourthsPortraitScreenWidthMinusPadding___size = floor(_SBPIPContentViewPaddingWhileStashed(0) * -2.0+ Width * 0.75+ -2.0);
}

@end