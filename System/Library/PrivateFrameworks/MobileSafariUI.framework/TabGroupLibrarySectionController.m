@interface TabGroupLibrarySectionController
- (TabGroupLibrarySectionController)initWithConfiguration:(id)a3 forNamedGroups:(BOOL)a4;
- (id)_allItemControllers;
- (id)itemControllerToHandleDropItemsFromSession:(id)a3 withProposedDestinationItemController:(id)a4 atIndex:(int64_t)a5;
- (id)itemControllers;
@end

@implementation TabGroupLibrarySectionController

- (TabGroupLibrarySectionController)initWithConfiguration:(id)a3 forNamedGroups:(BOOL)a4
{
  v5 = [(LibrarySectionController *)self initWithConfiguration:a3];
  v6 = v5;
  if (v5)
  {
    v5->_showNamedGroups = a4;
    v7 = v5;
  }

  return v6;
}

- (id)itemControllers
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(LibrarySectionController *)self configuration];
  v4 = [v3 tabGroupProvider];
  v5 = [v4 tabGroups];

  if ([v5 count])
  {
    v6 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v19 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int showNamedGroups = self->_showNamedGroups;
          if (showNamedGroups == [v12 isNamed])
          {
            v14 = [TabGroupLibraryItemController alloc];
            v15 = [(LibrarySectionController *)self configuration];
            v16 = [(TabGroupLibraryItemController *)v14 initWithConfiguration:v15 sectionController:self tabGroup:v12 tab:0];

            [v6 addObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    v17 = [v6 array];

    v5 = v19;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (id)itemControllerToHandleDropItemsFromSession:(id)a3 withProposedDestinationItemController:(id)a4 atIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 items];
  unint64_t v11 = [v10 count];

  if (!a5 || v11 >= 2)
  {
    id v15 = v9;
    goto LABEL_19;
  }
  v12 = [v8 items];
  v13 = [v12 firstObject];

  v14 = objc_msgSend(v13, "safari_localWBTab");
  id v15 = v9;
  if (v14)
  {
    v16 = [(TabGroupLibrarySectionController *)self _allItemControllers];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __125__TabGroupLibrarySectionController_itemControllerToHandleDropItemsFromSession_withProposedDestinationItemController_atIndex___block_invoke;
    v25[3] = &unk_1E6D7ADD0;
    id v26 = v14;
    int64_t v17 = [v16 indexOfObjectPassingTest:v25];
    BOOL v19 = v17 == 0x7FFFFFFFFFFFFFFFLL || v17 > a5;
    long long v20 = [v16 objectAtIndexedSubscript:a5 - 1];
    long long v21 = [v15 tab];

    if (!v19 || v21)
    {
      if (!v19)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      long long v22 = [v20 tab];

      if (!v22) {
        goto LABEL_17;
      }
    }
    id v23 = v20;

    id v15 = v23;
    goto LABEL_17;
  }
LABEL_18:

LABEL_19:
  return v15;
}

uint64_t __125__TabGroupLibrarySectionController_itemControllerToHandleDropItemsFromSession_withProposedDestinationItemController_atIndex___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 tab];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

- (id)_allItemControllers
{
  v2 = [(LibrarySectionController *)self filteredItemControllers];
  uint64_t v3 = objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_21);
  v4 = objc_msgSend(v3, "safari_flattenedArray");

  return v4;
}

id __55__TabGroupLibrarySectionController__allItemControllers__block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 isExpanded])
  {
    v8[0] = v2;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    v4 = [v2 subitems];

    v5 = objc_msgSend(v3, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v4);

    id v2 = v3;
  }
  else
  {
    id v7 = v2;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  }

  return v5;
}

@end