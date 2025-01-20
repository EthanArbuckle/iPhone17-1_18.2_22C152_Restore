@interface RCFoldersSelectionCollectionViewHeaderCell
- (BOOL)_shouldUseAccompaniedSidebarStyle;
@end

@implementation RCFoldersSelectionCollectionViewHeaderCell

- (BOOL)_shouldUseAccompaniedSidebarStyle
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v3 = [v2 folderSelectionCollectionViewHeaderCellUsesAccompaniedSidebarStyle];

  return v3;
}

@end