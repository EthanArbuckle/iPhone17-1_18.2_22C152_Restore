@interface SBHLibraryPodIndicatorIcon
- (BOOL)canBeAddedToMultiItemDrag;
- (BOOL)canReceiveGrabbedIcon;
- (BOOL)isLibraryPodIcon;
@end

@implementation SBHLibraryPodIndicatorIcon

- (BOOL)isLibraryPodIcon
{
  return 1;
}

- (BOOL)canReceiveGrabbedIcon
{
  return 1;
}

- (BOOL)canBeAddedToMultiItemDrag
{
  return 0;
}

@end