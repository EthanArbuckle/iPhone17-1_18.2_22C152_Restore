@interface PKDynamicTableViewController
- (BOOL)hasSectionForSectionIdentifier:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)sectionControllers;
- (PKDynamicTableViewController)init;
- (PKDynamicTableViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_computeSectionControllerMap:(id)a3;
- (id)_sectionControllerForSectionIdentifier:(id)a3;
- (id)cellForRowAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)indexOfSectionIdentifier:(id)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowAnimationForDeletingSection:(unint64_t)a3;
- (int64_t)rowAnimationForInsertingSection:(unint64_t)a3;
- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadData:(BOOL)a3;
- (void)_sortMappedSectionIdentifiers:(id)a3;
- (void)recomputeMappedSectionsAndReloadSections:(id)a3 sectionIdentifiers:(id)a4;
- (void)reloadRow:(int64_t)a3 inSectionWithSectionIdentifier:(id)a4;
- (void)reloadRows:(id)a3 inSectionWithSectionIdentifier:(id)a4;
- (void)reloadSectionIdentifier:(id)a3;
- (void)reloadSectionIdentifiers:(id)a3;
- (void)setSectionControllers:(id)a3;
- (void)setSectionControllers:(id)a3 sectionIdentifiers:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKDynamicTableViewController

- (PKDynamicTableViewController)init
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior");

  return [(PKDynamicTableViewController *)self initWithStyle:v3];
}

- (PKDynamicTableViewController)initWithStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDynamicTableViewController;
  return [(PKDynamicTableViewController *)&v4 initWithStyle:a3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKDynamicTableViewController;
  [(PKDynamicTableViewController *)&v4 viewDidLoad];
  uint64_t v3 = [(PKDynamicTableViewController *)self tableView];
  objc_msgSend(v3, "pkui_setupForReadableContentGuide");
}

- (void)setSectionControllers:(id)a3
{
}

- (void)setSectionControllers:(id)a3 sectionIdentifiers:(id)a4
{
  objc_storeStrong((id *)&self->_sectionControllers, a3);
  id v6 = a4;
  id v7 = [(PKDynamicTableViewController *)self _computeSectionControllerMap:v6];

  [(PKDynamicTableViewController *)self _sortMappedSectionIdentifiers:v7];
  [(PKDynamicTableViewController *)self _reloadData:0];
}

- (void)_reloadData:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKDynamicTableViewController *)self isViewLoaded])
  {
    id v6 = [(PKDynamicTableViewController *)self tableView];
    [v6 setEditing:0 animated:v3];
    v5 = [(PKDynamicTableViewController *)self tableView];
    [v5 reloadData];
  }
}

- (void)reloadSectionIdentifier:(id)a3
{
  id v8 = a3;
  if ([(PKDynamicTableViewController *)self isViewLoaded])
  {
    int64_t v4 = [(PKDynamicTableViewController *)self indexOfSectionIdentifier:v8];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v5 = v4;
      id v6 = [(PKDynamicTableViewController *)self tableView];
      id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v5];
      objc_msgSend(v6, "reloadSections:withRowAnimation:", v7, -[PKDynamicTableViewController rowAnimationForReloadingSection:](self, "rowAnimationForReloadingSection:", v5));
    }
  }
}

- (void)reloadSectionIdentifiers:(id)a3
{
  id v4 = a3;
  if (-[PKDynamicTableViewController isViewLoaded](self, "isViewLoaded") && [v4 count])
  {
    int64_t v5 = [(PKDynamicTableViewController *)self tableView];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__PKDynamicTableViewController_reloadSectionIdentifiers___block_invoke;
    v7[3] = &unk_1E59CA8E8;
    id v8 = v4;
    v9 = self;
    id v10 = v5;
    id v6 = v5;
    [v6 performBatchUpdates:v7 completion:0];
  }
}

void __57__PKDynamicTableViewController_reloadSectionIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "indexOfSectionIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * v6), (void)v11);
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v8 = v7;
          v9 = *(void **)(a1 + 48);
          id v10 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
          objc_msgSend(v9, "reloadSections:withRowAnimation:", v10, objc_msgSend(*(id *)(a1 + 40), "rowAnimationForReloadingSection:", v8));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)reloadRow:(int64_t)a3 inSectionWithSectionIdentifier:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = NSNumber;
  id v7 = a4;
  uint64_t v8 = [v6 numberWithInteger:a3];
  v10[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(PKDynamicTableViewController *)self reloadRows:v9 inSectionWithSectionIdentifier:v7];
}

- (id)cellForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKDynamicTableViewController *)self tableView];
  uint64_t v6 = [v5 cellForRowAtIndexPath:v4];

  return v6;
}

- (void)reloadRows:(id)a3 inSectionWithSectionIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PKDynamicTableViewController *)self isViewLoaded])
  {
    int64_t v8 = [(PKDynamicTableViewController *)self indexOfSectionIdentifier:v7];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v9 = v8;
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v18 = v6;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v15), "integerValue"), v9);
            [v10 addObject:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }

      v17 = [(PKDynamicTableViewController *)self tableView];
      objc_msgSend(v17, "reloadRowsAtIndexPaths:withRowAnimation:", v10, -[PKDynamicTableViewController rowAnimationForReloadingSection:](self, "rowAnimationForReloadingSection:", v9));

      id v6 = v18;
    }
  }
}

- (id)_computeSectionControllerMap:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sectionControllerMap = self->_sectionControllerMap;
  self->_sectionControllerMap = v4;

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = self->_sectionControllers;
  uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        int64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        int64_t v9 = objc_msgSend(v8, "sectionIdentifiers", v19);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * j);
              [(NSMutableDictionary *)self->_sectionControllerMap setObject:v8 forKey:v14];
              [v6 addObject:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v11);
        }
      }
      uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }

  uint64_t v15 = v19;
  uint64_t v16 = v19;
  if (!v19) {
    uint64_t v16 = (void *)[v6 copy];
  }
  objc_storeStrong((id *)&self->_orderOfSectionIdentifiers, v16);
  if (!v19) {

  }
  v17 = objc_msgSend(v6, "copy", v19);

  return v17;
}

- (void)_sortMappedSectionIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  sectionItems = self->_sectionItems;
  self->_sectionItems = v5;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_orderOfSectionIdentifiers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v12, (void)v13)) {
          [(NSMutableArray *)self->_sectionItems addObject:v12];
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)recomputeMappedSectionsAndReloadSections:(id)a3 sectionIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKDynamicTableViewController *)self isViewLoaded] && self->_sectionItems)
  {
    uint64_t v8 = [(PKDynamicTableViewController *)self tableView];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __92__PKDynamicTableViewController_recomputeMappedSectionsAndReloadSections_sectionIdentifiers___block_invoke;
    v10[3] = &unk_1E59CB8B0;
    v10[4] = self;
    id v11 = v7;
    id v12 = v6;
    id v13 = v8;
    id v9 = v8;
    [v9 performBatchUpdates:v10 completion:0];
  }
}

void __92__PKDynamicTableViewController_recomputeMappedSectionsAndReloadSections_sectionIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 1032) copy];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 _computeSectionControllerMap:*(void *)(a1 + 40)];
  [v3 _sortMappedSectionIdentifiers:v4];

  uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 1032) copy];
  uint64_t v33 = (void *)[*(id *)(a1 + 48) mutableCopy];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = v2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        if (([v5 containsObject:v11] & 1) == 0)
        {
          uint64_t v12 = [v6 indexOfObject:v11];
          id v13 = *(void **)(a1 + 56);
          long long v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v12];
          objc_msgSend(v13, "deleteSections:withRowAnimation:", v14, objc_msgSend(*(id *)(a1 + 32), "rowAnimationForDeletingSection:", v12));
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v8);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        if (([v6 containsObject:v20] & 1) == 0)
        {
          uint64_t v21 = [v15 indexOfObject:v20];
          uint64_t v22 = *(void **)(a1 + 56);
          long long v23 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v21];
          objc_msgSend(v22, "insertSections:withRowAnimation:", v23, objc_msgSend(*(id *)(a1 + 32), "rowAnimationForDeletingSection:", v21));

          [v33 removeObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = v33;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v34 + 1) + 8 * k);
        if ([v6 containsObject:v29]
          && [v15 containsObject:v29])
        {
          uint64_t v30 = [v6 indexOfObject:v29];
          v31 = *(void **)(a1 + 56);
          v32 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v30];
          objc_msgSend(v31, "reloadSections:withRowAnimation:", v32, objc_msgSend(*(id *)(a1 + 32), "rowAnimationForInsertingSection:", v30));
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v26);
  }
}

- (BOOL)hasSectionForSectionIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sectionControllerMap objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_sectionItems indexOfObject:a3];
  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v6 = v4;
    uint64_t v7 = [(PKDynamicTableViewController *)self tableView];
    BOOL v8 = v6 < [v7 numberOfSections];

    if (v8) {
      return v6;
    }
  }
  return v5;
}

- (int64_t)numberOfSections
{
  return [(NSMutableArray *)self->_sectionItems count];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_sectionItems count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  sectionItems = self->_sectionItems;
  id v7 = a3;
  BOOL v8 = [(NSMutableArray *)sectionItems objectAtIndexedSubscript:a4];
  uint64_t v9 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v8];
  int64_t v10 = [v9 tableView:v7 numberOfRowsInSectionIdentifier:v8];

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  sectionItems = self->_sectionItems;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = -[NSMutableArray objectAtIndexedSubscript:](sectionItems, "objectAtIndexedSubscript:", [v7 section]);
  int64_t v10 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v9];
  uint64_t v11 = [v10 tableView:v8 cellForRowAtIndexPath:v7 sectionIdentifier:v9];

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v5 = [(NSMutableArray *)self->_sectionItems objectAtIndexedSubscript:a4];
  int64_t v6 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v5];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 titleForHeaderInSectionIdentifier:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v5 = [(NSMutableArray *)self->_sectionItems objectAtIndexedSubscript:a4];
  int64_t v6 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v5];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 titleForFooterInSectionIdentifier:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NSMutableArray *)self->_sectionItems objectAtIndexedSubscript:a4];
  id v8 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v7];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 tableView:v6 viewForHeaderInSectionIdentifier:v7];
    if (!v9)
    {
      int64_t v10 = [(PKDynamicTableViewController *)self tableView:v6 titleForHeaderInSection:a4];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"default"];
        if (!v9) {
          uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"default"];
        }
      }
    }
    [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NSMutableArray *)self->_sectionItems objectAtIndexedSubscript:a4];
  id v8 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v7];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 tableView:v6 viewForFooterInSectionIdentifier:v7];
    if (!v9)
    {
      int64_t v10 = [(PKDynamicTableViewController *)self tableView:v6 titleForFooterInSection:a4];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"default"];
        if (!v9) {
          uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"default"];
        }
      }
    }
    [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", [v7 section]);
  uint64_t v9 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v8];
  if (objc_opt_respondsToSelector())
  {
    [v9 tableView:v6 heightForRowAtIndexPath:v7 sectionIdentifier:v8];
    double v11 = v10;
  }
  else
  {
    double v11 = *MEMORY[0x1E4FB2F28];
  }

  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NSMutableArray *)self->_sectionItems objectAtIndexedSubscript:a4];
  id v8 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v7];
  if (objc_opt_respondsToSelector())
  {
    [v8 tableView:v6 heightForHeaderInSectionIdentifier:v7];
    double v10 = v9;
  }
  else
  {
    double v10 = *MEMORY[0x1E4FB2F28];
  }

  return v10;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NSMutableArray *)self->_sectionItems objectAtIndexedSubscript:a4];
  id v8 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v7];
  if (objc_opt_respondsToSelector())
  {
    [v8 tableView:v6 heightForFooterInSectionIdentifier:v7];
    double v10 = v9;
  }
  else
  {
    double v10 = *MEMORY[0x1E4FB2F28];
  }

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", [v5 section]);
  id v7 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v6];
  if (objc_opt_respondsToSelector())
  {
    [v7 estimatedHeightForRowAtIndexPath:v5 sectionIdentifier:v6];
    double v9 = v8;
  }
  else
  {
    double v9 = *MEMORY[0x1E4FB2F28];
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", [v6 section]);
  double v8 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v7];
  if (objc_opt_respondsToSelector()) {
    [v8 tableView:v9 didSelectRowAtIndexPath:v6 sectionIdentifier:v7];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", [v7 section]);
  id v9 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v8];
  if (objc_opt_respondsToSelector()) {
    char v10 = [v9 tableView:v6 canEditRowAtIndexPath:v7 sectionIdentifier:v8];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", [v5 section]);
  id v7 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v6];
  if (objc_opt_respondsToSelector()) {
    int64_t v8 = [v7 editingStyleForRowAtIndexPath:v5 sectionIdentifier:v6];
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", [v5 section]);
  id v7 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v6];
  if (objc_opt_respondsToSelector()) {
    char v8 = [v7 shouldHighlightRowAtIndexPath:v5 sectionIdentifier:v6];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v5 = [(NSMutableArray *)self->_sectionItems objectAtIndexedSubscript:a4];
  id v6 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v5];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 shouldDrawTopSeparatorForSectionIdentifier:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  id v5 = [(NSMutableArray *)self->_sectionItems objectAtIndexedSubscript:a4];
  id v6 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v5];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 shouldDrawBottomSeparatorForSectionIdentifier:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", [v7 section]);
  id v9 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v8];
  if (objc_opt_respondsToSelector())
  {
    char v10 = [v9 tableView:v6 leadingSwipeActionsConfigurationForRowAtIndexPath:v7 sectionIdentifier:v8];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", [v7 section]);
  id v9 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v8];
  if (objc_opt_respondsToSelector())
  {
    char v10 = [v9 tableView:v6 trailingSwipeActionsConfigurationForRowAtIndexPath:v7 sectionIdentifier:v8];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  double v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", [v10 section]);
  uint64_t v12 = [(PKDynamicTableViewController *)self _sectionControllerForSectionIdentifier:v11];
  if (objc_opt_respondsToSelector())
  {
    id v13 = objc_msgSend(v12, "tableView:contextMenuConfigurationForRowAtIndexPath:point:sectionIdentifier:", v9, v10, v11, x, y);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (int64_t)rowAnimationForInsertingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForDeletingSection:(unint64_t)a3
{
  return 0;
}

- (id)_sectionControllerForSectionIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sectionControllerMap objectForKeyedSubscript:a3];
}

- (NSArray)sectionControllers
{
  return self->_sectionControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_orderOfSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionItems, 0);

  objc_storeStrong((id *)&self->_sectionControllerMap, 0);
}

@end