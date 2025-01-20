@interface _TVCarouselCollectionView
- (BOOL)_canScrollX;
@end

@implementation _TVCarouselCollectionView

- (BOOL)_canScrollX
{
  v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 2) {
    return 0;
  }
  return [(_TVCarouselCollectionView *)self isUserInteractionEnabled];
}

@end