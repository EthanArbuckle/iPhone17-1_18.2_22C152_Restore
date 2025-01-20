@interface _PXSettingsIndexEntry
+ (id)_cellForRowAtIndexPath:(id)a3 inTableView:(id)a4;
+ (id)_titleForRowAtIndexPath:(id)a3 inTableView:(id)a4;
- (BOOL)matchesSearchString:(id)a3;
- (NSIndexPath)indexPath;
- (NSString)rowTitle;
- (NSString)sectionTitle;
- (NSString)subtitle;
- (_PXSettingsIndexEntry)initWithRowAtIndexPath:(id)a3 inTableView:(id)a4;
- (_PXSettingsIndexEntry)parentEntry;
- (void)_revealInSettingsController:(id)a3 drillIn:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)_revealInTopOfSettingsController:(id)a3 drillIn:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)revealInSettingsController:(id)a3 withCompletionHandler:(id)a4;
- (void)setParentEntry:(id)a3;
@end

@implementation _PXSettingsIndexEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowTitle, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_parentEntry);
}

- (NSString)rowTitle
{
  return self->_rowTitle;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setParentEntry:(id)a3
{
}

- (_PXSettingsIndexEntry)parentEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntry);
  return (_PXSettingsIndexEntry *)WeakRetained;
}

- (void)_revealInTopOfSettingsController:(id)a3 drillIn:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, void))a5;
  v10 = [v8 topViewController];
  v11 = [v10 tableView];
  v12 = [(_PXSettingsIndexEntry *)self indexPath];
  uint64_t v13 = [v12 section];
  if (v13 > [v10 numberOfSectionsInTableView:v11]) {
    goto LABEL_7;
  }
  uint64_t v14 = [v12 row];
  if (v14 > objc_msgSend(v10, "tableView:numberOfRowsInSection:", v11, objc_msgSend(v12, "section"))) {
    goto LABEL_7;
  }
  [v11 scrollToRowAtIndexPath:v12 atScrollPosition:2 animated:0];
  v15 = [(id)objc_opt_class() _titleForRowAtIndexPath:v12 inTableView:v11];
  v16 = [(_PXSettingsIndexEntry *)self rowTitle];
  int v17 = [v15 isEqualToString:v16];

  if (!v17)
  {
    v20 = [(_PXSettingsIndexEntry *)self rowTitle];
    NSLog(&cfstr_SettingsSearch.isa, v12, v15, v20);

LABEL_7:
    v9[2](v9, 0);
    goto LABEL_8;
  }
  v18 = [(id)objc_opt_class() _cellForRowAtIndexPath:v12 inTableView:v11];
  if (v6)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke;
    v26[3] = &unk_1E5DD0F30;
    v19 = &v27;
    id v27 = v11;
    id v28 = v12;
    id v29 = v10;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_2;
    v24[3] = &unk_1E5DD3128;
    v25 = v9;
    objc_msgSend(v8, "px_performWithoutAnimations:completionHandler:", v26, v24);
  }
  else
  {
    v9[2](v9, 1);
    dispatch_time_t v21 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5DD36F8;
    v19 = &v23;
    id v23 = v18;
    dispatch_after(v21, MEMORY[0x1E4F14428], block);
  }

LABEL_8:
}

- (void)_revealInSettingsController:(id)a3 drillIn:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [(_PXSettingsIndexEntry *)self parentEntry];
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83___PXSettingsIndexEntry__revealInSettingsController_drillIn_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E5DB48F0;
    v12[4] = self;
    id v13 = v8;
    BOOL v15 = v6;
    id v14 = v9;
    [v10 _revealInSettingsController:v13 drillIn:1 withCompletionHandler:v12];
  }
  else
  {
    id v11 = (id)[v8 popToRootViewControllerAnimated:0];
    [(_PXSettingsIndexEntry *)self _revealInTopOfSettingsController:v8 drillIn:v6 withCompletionHandler:v9];
  }
}

- (void)revealInSettingsController:(id)a3 withCompletionHandler:(id)a4
{
}

- (BOOL)matchesSearchString:(id)a3
{
  id v4 = a3;
  v5 = [(_PXSettingsIndexEntry *)self rowTitle];
  char v6 = [v5 localizedStandardContainsString:v4];

  return v6;
}

- (NSString)subtitle
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(_PXSettingsIndexEntry *)self parentEntry];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      char v6 = [v5 sectionTitle];
      v7 = [v5 rowTitle];
      if ([v6 length])
      {
        id v8 = [NSString stringWithFormat:@"(%@) %@", v6, v7];
      }
      else
      {
        id v8 = v7;
      }
      id v9 = v8;
      [v3 insertObject:v8 atIndex:0];
      uint64_t v10 = [v5 parentEntry];

      v5 = (void *)v10;
    }
    while (v10);
  }
  id v11 = [(_PXSettingsIndexEntry *)self sectionTitle];
  if ([v11 length])
  {
    v12 = [NSString stringWithFormat:@"(%@)", v11];
    [v3 addObject:v12];
  }
  id v13 = [v3 componentsJoinedByString:@" → "];

  return (NSString *)v13;
}

- (_PXSettingsIndexEntry)initWithRowAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_PXSettingsIndexEntry;
  id v9 = [(_PXSettingsIndexEntry *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_indexPath, a3);
    id v11 = [v8 dataSource];
    uint64_t v12 = objc_msgSend(v11, "tableView:titleForHeaderInSection:", v8, objc_msgSend(v7, "section"));
    sectionTitle = v10->_sectionTitle;
    v10->_sectionTitle = (NSString *)v12;

    uint64_t v14 = [(id)objc_opt_class() _titleForRowAtIndexPath:v7 inTableView:v8];
    rowTitle = v10->_rowTitle;
    v10->_rowTitle = (NSString *)v14;
  }
  return v10;
}

+ (id)_titleForRowAtIndexPath:(id)a3 inTableView:(id)a4
{
  uint64_t v4 = [a1 _cellForRowAtIndexPath:a3 inTableView:a4];
  v5 = [v4 textLabel];
  char v6 = [v5 text];

  return v6;
}

+ (id)_cellForRowAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 scrollToRowAtIndexPath:v5 atScrollPosition:0 animated:0];
  id v7 = [v6 cellForRowAtIndexPath:v5];
  if (!v7)
  {
    id v8 = [v6 dataSource];
    id v7 = [v8 tableView:v6 cellForRowAtIndexPath:v5];
  }
  return v7;
}

@end