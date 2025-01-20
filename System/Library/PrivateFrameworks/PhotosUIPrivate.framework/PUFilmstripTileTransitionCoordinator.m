@interface PUFilmstripTileTransitionCoordinator
- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4;
- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4;
- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5;
@end

@implementation PUFilmstripTileTransitionCoordinator

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  v6 = objc_msgSend(a4, "tileKind", a3);
  int v7 = [v6 isEqualToString:@"PUTileKindItemContentFilmStripIndicator"];

  v8 = 0;
  if (a5 == 3 && v7)
  {
    v8 = objc_alloc_init(PUTileAnimationOptions);
    [(PUTileAnimationOptions *)v8 setDuration:0.5];
  }
  return v8;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  id v4 = a4;
  v5 = [v4 tileKind];
  int v6 = [v5 isEqualToString:@"PUTileKindItemContentFilmStripIndicator"];

  int v7 = v4;
  if (v6)
  {
    v8 = [v4 layoutInfoWithAlpha:0.0];
    int v7 = [v8 layoutInfoWithZPosition:10.0];
  }
  return v7;
}

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  return a4;
}

@end