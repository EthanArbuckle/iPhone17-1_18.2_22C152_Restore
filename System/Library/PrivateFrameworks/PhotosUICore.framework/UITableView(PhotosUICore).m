@interface UITableView(PhotosUICore)
- (void)px_performUpdatesForChangeDetails:()PhotosUICore dataSourceUpdate:;
@end

@implementation UITableView(PhotosUICore)

- (void)px_performUpdatesForChangeDetails:()PhotosUICore dataSourceUpdate:
{
  id v6 = a3;
  v7 = a4;
  if ([v6 hasIncrementalChanges])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__UITableView_PhotosUICore__px_performUpdatesForChangeDetails_dataSourceUpdate___block_invoke;
    v8[3] = &unk_1E5DD0E78;
    v11 = v7;
    id v9 = v6;
    v10 = a1;
    [a1 performBatchUpdates:v8 completion:0];
  }
  else
  {
    v7[2](v7);
    [a1 reloadData];
  }
}

@end