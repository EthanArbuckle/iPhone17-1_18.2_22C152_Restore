@interface PXDuplicatesSectionHeaderLayoutProvider
- (id)actionTextForActionType:(int64_t)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5;
- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (int64_t)actionTypeForHeaderLayout:(id)a3;
- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5;
@end

@implementation PXDuplicatesSectionHeaderLayoutProvider

- (int64_t)actionTypeForHeaderLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isInSelectMode])
  {
    v7.receiver = self;
    v7.super_class = (Class)PXDuplicatesSectionHeaderLayoutProvider;
    int64_t v5 = [(PXActionableSectionHeaderLayoutProvider *)&v7 actionTypeForHeaderLayout:v4];
  }
  else
  {
    int64_t v5 = 3;
  }

  return v5;
}

- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5
{
  if (a4 == 3)
  {
    id v7 = a5;
    id v8 = a3;
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.deduplicationFromAlbumSection" withPayload:MEMORY[0x1E4F1CC08]];
    [(PXActionableSectionHeaderLayoutProvider *)self setSelectedState:1 forItemsInSectionHeaderLayout:v8];
    v9 = [(PXActionableSectionHeaderLayoutProvider *)self viewModel];
    v10 = [v9 assetActionManager];
    id v14 = [v10 actionPerformerForActionType:@"PXAssetActionTypeMergeDuplicates"];

    [v14 setSender:v7];
    [v14 performActionWithCompletionHandler:0];
    [(PXActionableSectionHeaderLayoutProvider *)self setSelectedState:0 forItemsInSectionHeaderLayout:v8];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PXDuplicatesSectionHeaderLayoutProvider;
    id v12 = a5;
    id v13 = a3;
    [(PXActionableSectionHeaderLayoutProvider *)&v15 sectionHeader:v13 didPressButtonForActionType:a4 sender:v12];
  }
}

- (id)actionTextForActionType:(int64_t)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5
{
  if (a3 == 3)
  {
    int64_t v5 = PXLocalizedStringFromTable(@"MERGE_DUPLICATES_SECTION_ACTION", @"PhotosUICore");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXDuplicatesSectionHeaderLayoutProvider;
    long long v6 = *(_OWORD *)&a5->item;
    v8[0] = *(_OWORD *)&a5->dataSourceIdentifier;
    v8[1] = v6;
    int64_t v5 = [(PXActionableSectionHeaderLayoutProvider *)&v9 actionTextForActionType:a3 dataSource:a4 sectionIndexPath:v8];
  }
  return v5;
}

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  long long v5 = *(_OWORD *)&a4->item;
  long long v11 = *(_OWORD *)&a4->dataSourceIdentifier;
  long long v12 = v5;
  id v6 = a3;
  id v7 = [v6 assetCollectionAtSectionIndexPath:&v11];
  uint64_t v8 = objc_msgSend(v6, "numberOfItemsInSection:", a4->section, v11, v12);

  objc_super v9 = PXDeduplicationLocalizedGroupTitle(v7, v8);

  return v9;
}

@end