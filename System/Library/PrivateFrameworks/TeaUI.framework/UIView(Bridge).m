@interface UIView(Bridge)
- (BOOL)ts_safeAreaWidthExceedsReadableWidth;
- (void)ts_setPlusDCompositingFilter;
- (void)ts_setPlusLCompositingFilter;
@end

@implementation UIView(Bridge)

- (BOOL)ts_safeAreaWidthExceedsReadableWidth
{
  v2 = [a1 traitCollection];
  if ([v2 horizontalSizeClass] == 1)
  {

LABEL_4:
    [a1 safeAreaInsets];
    BOOL v6 = v5 <= 0.0;
    return !v6;
  }
  v3 = [a1 traitCollection];
  uint64_t v4 = [v3 verticalSizeClass];

  if (v4 == 1) {
    goto LABEL_4;
  }
  [MEMORY[0x1E4FB08E0] _readableWidth];
  double v8 = ceil(v7 * 0.125) * -8.0;
  v9 = [a1 safeAreaLayoutGuide];
  [v9 layoutFrame];
  double v11 = v10;
  [a1 safeAreaInsets];
  double v13 = v11 - v12;
  [a1 safeAreaInsets];
  double v15 = v13 - v14;

  BOOL v6 = v15 + v8 <= 88.0;
  return !v6;
}

- (void)ts_setPlusDCompositingFilter
{
  uint64_t v1 = *MEMORY[0x1E4F3A2E0];
  id v2 = [a1 layer];
  [v2 setCompositingFilter:v1];
}

- (void)ts_setPlusLCompositingFilter
{
  uint64_t v1 = *MEMORY[0x1E4F3A2E8];
  id v2 = [a1 layer];
  [v2 setCompositingFilter:v1];
}

@end