@interface UIStatusBarSecondarySignalStrengthItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)extraLeftPadding;
@end

@implementation UIStatusBarSecondarySignalStrengthItemView

- (double)extraLeftPadding
{
  return -5.0;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5 = [a3 rawData];
  uint64_t v6 = *(unsigned int *)(v5 + 436);
  int v7 = *(_DWORD *)(v5 + 444);
  if (v7 >= 4) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = (*(unsigned __int8 *)(v5 + 2529) >> 1) & 1;
  BOOL v10 = *(_DWORD *)(v5 + 2076) == 6;
  return [(UIStatusBarSignalStrengthItemView *)self _updateWithRaw:v6 bars:v8 enableRSSI:v9 showFailure:v10 useSmallBars:1];
}

@end