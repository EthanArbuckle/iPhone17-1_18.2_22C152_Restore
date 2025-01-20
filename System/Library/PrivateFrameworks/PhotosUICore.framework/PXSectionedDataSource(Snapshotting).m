@interface PXSectionedDataSource(Snapshotting)
- (void)objectIdentifierForSpriteTag:()Snapshotting;
@end

@implementation PXSectionedDataSource(Snapshotting)

- (void)objectIdentifierForSpriteTag:()Snapshotting
{
  long long v1 = 0u;
  long long v2 = 0u;
  [a1 identifier];
  PXGSectionedSpriteTagGetIndexPath();
}

@end