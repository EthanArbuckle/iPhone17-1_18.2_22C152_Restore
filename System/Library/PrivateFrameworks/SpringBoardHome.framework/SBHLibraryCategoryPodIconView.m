@interface SBHLibraryCategoryPodIconView
- (BOOL)isUserInteractionEnabled;
- (id)representedFolderIconLocation;
@end

@implementation SBHLibraryCategoryPodIconView

- (id)representedFolderIconLocation
{
  return @"SBIconLocationAppLibraryCategoryPodAdditionalItems";
}

- (BOOL)isUserInteractionEnabled
{
  return 1;
}

@end