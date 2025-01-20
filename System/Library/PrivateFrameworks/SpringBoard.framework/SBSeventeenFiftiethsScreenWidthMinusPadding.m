@interface SBSeventeenFiftiethsScreenWidthMinusPadding
@end

@implementation SBSeventeenFiftiethsScreenWidthMinusPadding

void ___SBSeventeenFiftiethsScreenWidthMinusPadding_block_invoke()
{
  id v2 = [MEMORY[0x1E4F42D90] mainScreen];
  v0 = [v2 fixedCoordinateSpace];
  [v0 bounds];
  double Width = CGRectGetWidth(v4);
  _SBSeventeenFiftiethsScreenWidthMinusPadding___size = floor(-2.0- (_SBPIPContentViewPaddingWhileStashed(0)- Width * 0.340000004));
}

@end