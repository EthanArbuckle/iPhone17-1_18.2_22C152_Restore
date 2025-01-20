@interface UIPrintOptionListViewController
- (NSArray)itemList;
- (UIPrintOptionListDelegate)listDelegate;
- (UIPrintOptionListViewController)initWithListDelegate:(id)a3;
- (id)onDoneBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setItemList:(id)a3;
- (void)setListDelegate:(id)a3;
- (void)setOnDoneBlock:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation UIPrintOptionListViewController

- (UIPrintOptionListViewController)initWithListDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPrintOptionListViewController;
  v5 = [(UIPrintOptionListViewController *)&v11 initWithStyle:2];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_listDelegate, v4);
    uint64_t v7 = [v4 itemList];
    itemList = v6->_itemList;
    v6->_itemList = (NSArray *)v7;

    v9 = [(UIPrintOptionListViewController *)v6 tableView];
    [v9 setEstimatedSectionHeaderHeight:8.0];
  }
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(UIPrintOptionListViewController *)self itemList];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(UIPrintOptionListViewController *)self itemList];
  v6 = [v5 objectAtIndex:a4];

  int64_t v7 = [v6 count];
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"PrintOptionListViewCell"];
  if (!v7) {
    int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PrintOptionListViewCell"];
  }
  v8 = [(UIPrintOptionListViewController *)self itemList];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));

  objc_super v11 = [MEMORY[0x1E4FB1948] cellConfiguration];
  v12 = [v10 objectForKey:@"Title"];
  [v11 setText:v12];

  v13 = [v10 objectForKey:@"Image"];
  [v11 setImage:v13];

  v14 = [v10 objectForKey:@"SubTitle"];
  [v11 setSecondaryText:v14];

  v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v16 = [v11 secondaryTextProperties];
  [(id)v16 setColor:v15];

  [v7 setContentConfiguration:v11];
  v17 = [(UIPrintOptionListViewController *)self listDelegate];
  LOBYTE(v16) = objc_opt_respondsToSelector();

  v18 = [(UIPrintOptionListViewController *)self listDelegate];
  v19 = v18;
  if (v16)
  {
    v20 = [v18 selectedItems];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v26 = objc_msgSend(v6, "section", (void)v31);
          if (v26 == [v25 section])
          {
            uint64_t v27 = [v6 row];
            if (v27 == [v25 row])
            {
              LODWORD(v22) = 1;
              goto LABEL_19;
            }
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  else
  {
    id v21 = [v18 selectedItem];

    if (v21 && (uint64_t v28 = [v6 section], v28 == objc_msgSend(v21, "section")))
    {
      uint64_t v22 = [v6 row];
      LODWORD(v22) = v22 == [v21 row];
    }
    else
    {
      LODWORD(v22) = 0;
    }
  }

  if (v22) {
    uint64_t v29 = 3;
  }
  else {
    uint64_t v29 = 0;
  }
  objc_msgSend(v7, "setAccessoryType:", v29, (void)v31);
  [v7 setSelectionStyle:3];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int64_t v7 = [(UIPrintOptionListViewController *)self navigationController];
  v8 = [v7 topViewController];

  if (v8 == self)
  {
    v9 = [(UIPrintOptionListViewController *)self listDelegate];
    uint64_t v10 = [v9 listItemSelected:v6];

    if (v10)
    {
      [v13 reloadData];
    }
    else
    {
      objc_super v11 = [(UIPrintOptionListViewController *)self navigationController];
      id v12 = (id)[v11 popViewControllerAnimated:1];
    }
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = [(UIPrintOptionListViewController *)self listDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(UIPrintOptionListViewController *)self listDelegate];
    v9 = [v8 titleForHeaderInSection:a4];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = [(UIPrintOptionListViewController *)self listDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(UIPrintOptionListViewController *)self listDelegate];
    v9 = [v8 titleForFooterInSection:a4];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIPrintOptionListViewController;
  [(UIPrintOptionListViewController *)&v5 viewDidDisappear:a3];
  int64_t v4 = [(UIPrintOptionListViewController *)self onDoneBlock];
  v4[2]();
}

- (UIPrintOptionListDelegate)listDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  return (UIPrintOptionListDelegate *)WeakRetained;
}

- (void)setListDelegate:(id)a3
{
}

- (NSArray)itemList
{
  return self->_itemList;
}

- (void)setItemList:(id)a3
{
}

- (id)onDoneBlock
{
  return objc_getProperty(self, a2, 1040, 1);
}

- (void)setOnDoneBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onDoneBlock, 0);
  objc_storeStrong((id *)&self->_itemList, 0);
  objc_destroyWeak((id *)&self->_listDelegate);
}

@end