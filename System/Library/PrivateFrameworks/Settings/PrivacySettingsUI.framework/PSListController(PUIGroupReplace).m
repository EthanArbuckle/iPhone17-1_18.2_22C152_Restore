@interface PSListController(PUIGroupReplace)
- (id)pui_replaceRows:()PUIGroupReplace withRows:header:insertPoint:;
@end

@implementation PSListController(PUIGroupReplace)

- (id)pui_replaceRows:()PUIGroupReplace withRows:header:insertPoint:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 count])
  {
    v14 = [a1 specifiers];
    v15 = [v12 firstObject];
    char v16 = [v14 containsObject:v15];

    if ((v16 & 1) == 0) {
      [a1 insertContiguousSpecifiers:v12 afterSpecifier:v13];
    }
    v17 = [v12 lastObject];

    v18 = [a1 table];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __81__PSListController_PUIGroupReplace__pui_replaceRows_withRows_header_insertPoint___block_invoke;
    v24 = &unk_1E6E9D298;
    v25 = a1;
    id v26 = v10;
    id v19 = v11;
    id v27 = v19;
    id v28 = v17;
    [v18 performBatchUpdates:&v21 completion:0];

    objc_msgSend(v19, "lastObject", v21, v22, v23, v24, v25);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [a1 removeContiguousSpecifiers:v10 animated:0];
    [a1 removeContiguousSpecifiers:v12 animated:0];
  }

  return v13;
}

@end