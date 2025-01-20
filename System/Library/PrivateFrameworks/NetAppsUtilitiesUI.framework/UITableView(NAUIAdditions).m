@interface UITableView(NAUIAdditions)
- (void)naui_applyGroupedItemDiff:()NAUIAdditions;
@end

@implementation UITableView(NAUIAdditions)

- (void)naui_applyGroupedItemDiff:()NAUIAdditions
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 groupOperations];
  if ([v5 count])
  {
  }
  else
  {
    v6 = [v4 itemOperations];
    uint64_t v7 = [v6 count];

    if (!v7) {
      goto LABEL_31;
    }
  }
  [a1 beginUpdates];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v8 = [v4 groupOperations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        switch([v13 type])
        {
          case 0:
            v14 = (void *)MEMORY[0x263F088D0];
            v15 = [v13 fromIndex];
            v16 = objc_msgSend(v14, "indexSetWithIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
            [a1 reloadSections:v16 withRowAnimation:100];
            goto LABEL_14;
          case 1:
            v18 = (void *)MEMORY[0x263F088D0];
            v15 = [v13 toIndex];
            v16 = objc_msgSend(v18, "indexSetWithIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
            [a1 insertSections:v16 withRowAnimation:100];
            goto LABEL_14;
          case 2:
            v17 = (void *)MEMORY[0x263F088D0];
            v15 = [v13 fromIndex];
            v16 = objc_msgSend(v17, "indexSetWithIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
            [a1 deleteSections:v16 withRowAnimation:100];
            goto LABEL_14;
          case 3:
            v15 = [v13 fromIndex];
            uint64_t v19 = [v15 unsignedIntegerValue];
            v16 = [v13 toIndex];
            objc_msgSend(a1, "moveSection:toSection:", v19, objc_msgSend(v16, "unsignedIntegerValue"));
LABEL_14:

            break;
          default:
            continue;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v10);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v20 = objc_msgSend(v4, "itemOperations", 0);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        switch([v25 type])
        {
          case 0:
            v26 = [v25 toIndexPath];
            v36 = v26;
            v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
            [a1 reloadRowsAtIndexPaths:v27 withRowAnimation:100];
            goto LABEL_27;
          case 1:
            v26 = [v25 toIndexPath];
            v38 = v26;
            v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
            [a1 insertRowsAtIndexPaths:v27 withRowAnimation:100];
            goto LABEL_27;
          case 2:
            v26 = [v25 fromIndexPath];
            v37 = v26;
            v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
            [a1 deleteRowsAtIndexPaths:v27 withRowAnimation:100];
            goto LABEL_27;
          case 3:
            v26 = [v25 fromIndexPath];
            v27 = [v25 toIndexPath];
            [a1 moveRowAtIndexPath:v26 toIndexPath:v27];
LABEL_27:

            break;
          default:
            continue;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v39 count:16];
    }
    while (v22);
  }

  [a1 endUpdates];
LABEL_31:
}

@end