@interface UIViewController(SUSectionedViewControllerAdditions)
- (uint64_t)canDisplaySectionGroup:()SUSectionedViewControllerAdditions;
- (uint64_t)reloadForSectionsWithGroup:()SUSectionedViewControllerAdditions;
- (uint64_t)setDisplayedSectionGroup:()SUSectionedViewControllerAdditions;
@end

@implementation UIViewController(SUSectionedViewControllerAdditions)

- (uint64_t)canDisplaySectionGroup:()SUSectionedViewControllerAdditions
{
  return 0;
}

- (uint64_t)reloadForSectionsWithGroup:()SUSectionedViewControllerAdditions
{
  v4 = (void *)[a1 parentViewController];

  return [v4 reloadForSectionsWithGroup:a3];
}

- (uint64_t)setDisplayedSectionGroup:()SUSectionedViewControllerAdditions
{
  return 0;
}

@end