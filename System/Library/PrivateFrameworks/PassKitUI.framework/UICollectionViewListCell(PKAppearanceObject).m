@interface UICollectionViewListCell(PKAppearanceObject)
- (uint64_t)pk_childrenForAppearance;
@end

@implementation UICollectionViewListCell(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E4F1CBF0];
}

@end