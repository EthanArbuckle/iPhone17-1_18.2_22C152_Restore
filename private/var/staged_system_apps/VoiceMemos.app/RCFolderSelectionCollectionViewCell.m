@interface RCFolderSelectionCollectionViewCell
- (BOOL)_needsDisclosureAccessory;
- (void)restyle;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation RCFolderSelectionCollectionViewCell

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RCFolderSelectionCollectionViewCell;
  [(RCFoldersCollectionViewCell *)&v23 updateConfigurationUsingState:v4];
  if ([v4 isSwiped]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [(RCFoldersCollectionViewCell *)self setDisplayMode:v5];
  v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  v7 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
  v8 = [(RCFolderSelectionCollectionViewCell *)self contentConfiguration];
  v9 = [v6 folderSelectionCollectionViewCellColor];
  if (v9)
  {
    if (([v4 isSelected] & 1) != 0
      || ([v4 isHighlighted] & 1) != 0)
    {
      v10 = [v6 sidebarCollectionViewCellDropTargetBackgroundColor];
      [v7 setBackgroundColor:v10];

      v11 = [v6 recordingCollectionViewSelectedCellTextColor];
      v12 = [v8 textProperties];
      [v12 setColor:v11];

      v13 = [v8 imageProperties];
      [v13 setTintColor:v11];

      if ([(RCFoldersCollectionViewCell *)self _shouldUseAccessibilityTextLayout])
      {
        v14 = [v8 textProperties];
        [v14 setColor:v11];
LABEL_11:
      }
    }
    else
    {
      [v7 setBackgroundColor:v9];
      v11 = [(RCFolderSelectionCollectionViewCell *)self defaultContentConfiguration];
      v15 = [v11 textProperties];
      v16 = [v15 color];
      v17 = [v8 textProperties];
      [v17 setColor:v16];

      v18 = [v11 imageProperties];
      v19 = [v18 tintColor];
      v20 = [v8 imageProperties];
      [v20 setTintColor:v19];

      if ([(RCFoldersCollectionViewCell *)self _shouldUseAccessibilityTextLayout])
      {
        v14 = [v11 textProperties];
        v21 = [v14 color];
        v22 = [v8 textProperties];
        [v22 setColor:v21];

        goto LABEL_11;
      }
    }
  }
  [(RCFolderSelectionCollectionViewCell *)self setBackgroundConfiguration:v7];
  [(RCFolderSelectionCollectionViewCell *)self setContentConfiguration:v8];
}

- (BOOL)_needsDisclosureAccessory
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v3 = [v2 folderSelectionCollectionViewNeedsDisclosureAccessory];

  return v3;
}

- (void)restyle
{
}

@end