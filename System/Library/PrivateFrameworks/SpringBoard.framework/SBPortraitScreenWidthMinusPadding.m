@interface SBPortraitScreenWidthMinusPadding
@end

@implementation SBPortraitScreenWidthMinusPadding

void ___SBPortraitScreenWidthMinusPadding_block_invoke()
{
  id v2 = [MEMORY[0x1E4F42D90] mainScreen];
  v0 = [v2 fixedCoordinateSpace];
  [v0 bounds];
  double Width = CGRectGetWidth(v4);
  _SBPortraitScreenWidthMinusPadding___size = floor(Width + _SBPIPContentViewPaddingWhileStashed(0) * -2.0 + -2.0);
}

@end