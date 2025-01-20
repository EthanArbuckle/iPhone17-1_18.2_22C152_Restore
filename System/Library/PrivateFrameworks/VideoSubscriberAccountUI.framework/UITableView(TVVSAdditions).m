@interface UITableView(TVVSAdditions)
- (BOOL)vs_containsIndexPath:()TVVSAdditions;
- (BOOL)vs_hasRowAtIndexPath:()TVVSAdditions;
- (double)vs_scrollToTopContentOffset;
- (id)vs_indexPathForFirstFocusableRow;
- (id)vs_scrollCompletionOperations;
- (uint64_t)vs_canFocusRowAtIndexPath:()TVVSAdditions;
- (uint64_t)vs_scrollToTopAnimated:()TVVSAdditions;
- (void)vs_scrollToIndexPath:()TVVSAdditions atScrollPosition:animated:withCompletion:;
- (void)vs_scrollToTopAnimated:()TVVSAdditions completion:;
- (void)vs_scrollViewDidEndScrollingAnimation;
- (void)vs_setScrollCompletionOperations:()TVVSAdditions;
@end

@implementation UITableView(TVVSAdditions)

- (id)vs_indexPathForFirstFocusableRow
{
  if ([a1 numberOfSections] < 1)
  {
LABEL_10:
    v4 = 0;
  }
  else
  {
    uint64_t v2 = 0;
    while (1)
    {
      if ([a1 numberOfRowsInSection:v2] >= 1)
      {
        uint64_t v3 = 0;
        while (1)
        {
          v4 = [MEMORY[0x263F088C8] indexPathForRow:v3 inSection:v2];
          if (objc_msgSend(a1, "vs_canFocusRowAtIndexPath:", v4)) {
            break;
          }

          if (++v3 >= [a1 numberOfRowsInSection:v2]) {
            goto LABEL_9;
          }
        }
        if (v4) {
          break;
        }
      }
LABEL_9:
      if (++v2 >= [a1 numberOfSections]) {
        goto LABEL_10;
      }
    }
  }
  return v4;
}

- (BOOL)vs_containsIndexPath:()TVVSAdditions
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (v5 >= [a1 numberOfSections])
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v6 = [v4 row];
    BOOL v7 = v6 < objc_msgSend(a1, "numberOfRowsInSection:", objc_msgSend(v4, "section"));
  }

  return v7;
}

- (uint64_t)vs_canFocusRowAtIndexPath:()TVVSAdditions
{
  id v4 = a3;
  if (objc_msgSend(a1, "vs_hasRowAtIndexPath:", v4))
  {
    uint64_t v5 = [a1 delegate];
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = [v5 tableView:a1 canFocusRowAtIndexPath:v4];
    }
    else {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)vs_hasRowAtIndexPath:()TVVSAdditions
{
  id v4 = a3;
  uint64_t v5 = v4;
  BOOL v8 = 0;
  if (v4)
  {
    if (([v4 section] & 0x8000000000000000) == 0
      && ([v5 row] & 0x8000000000000000) == 0)
    {
      uint64_t v6 = [v5 section];
      if (v6 < [a1 numberOfSections])
      {
        uint64_t v7 = [v5 row];
        if (v7 < objc_msgSend(a1, "numberOfRowsInSection:", objc_msgSend(v5, "section"))) {
          BOOL v8 = 1;
        }
      }
    }
  }

  return v8;
}

- (double)vs_scrollToTopContentOffset
{
  [a1 contentOffset];
  double v3 = v2;
  [a1 adjustedContentInset];
  return v3;
}

- (uint64_t)vs_scrollToTopAnimated:()TVVSAdditions
{
  objc_msgSend(a1, "vs_scrollToTopContentOffset");
  return objc_msgSend(a1, "setContentOffset:animated:", a3);
}

- (void)vs_scrollViewDidEndScrollingAnimation
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v2 = objc_msgSend(a1, "vs_scrollCompletionOperations");
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = VSDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[UITableView(TVVSAdditions) vs_scrollViewDidEndScrollingAnimation]";
      _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = objc_msgSend(a1, "vs_scrollCompletionOperations");
    uint64_t v6 = [v5 firstObject];

    uint64_t v7 = objc_msgSend(a1, "vs_scrollCompletionOperations");
    [v7 removeObjectAtIndex:0];

    [v6 start];
  }
}

- (void)vs_scrollToTopAnimated:()TVVSAdditions completion:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = a4;
  uint64_t v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[UITableView(TVVSAdditions) vs_scrollToTopAnimated:completion:]";
    _os_log_impl(&dword_23F9AB000, v7, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  int v8 = objc_msgSend(a1, "vs_scrollCompletionOperations");

  if (!v8)
  {
    v9 = [MEMORY[0x263EFF980] array];
    objc_msgSend(a1, "vs_setScrollCompletionOperations:", v9);
  }
  objc_msgSend(a1, "vs_scrollToTopAnimated:", a3);
  if ([a1 isScrollAnimating])
  {
    uint64_t v10 = (void *)MEMORY[0x263F086D0];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__UITableView_TVVSAdditions__vs_scrollToTopAnimated_completion___block_invoke;
    v13[3] = &unk_265076E20;
    v14 = v6;
    v11 = [v10 blockOperationWithBlock:v13];
    v12 = objc_msgSend(a1, "vs_scrollCompletionOperations");
    [v12 addObject:v11];
  }
  else
  {
    v6[2](v6);
  }
}

- (void)vs_scrollToIndexPath:()TVVSAdditions atScrollPosition:animated:withCompletion:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = a6;
  v12 = VSDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[UITableView(TVVSAdditions) vs_scrollToIndexPath:atScrollPosition:animated:withCompletion:]";
    _os_log_impl(&dword_23F9AB000, v12, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v13 = objc_msgSend(a1, "vs_scrollCompletionOperations");

  if (!v13)
  {
    v14 = [MEMORY[0x263EFF980] array];
    objc_msgSend(a1, "vs_setScrollCompletionOperations:", v14);
  }
  [a1 scrollToRowAtIndexPath:v10 atScrollPosition:a4 animated:a5];
  if ([a1 isScrollAnimating])
  {
    v15 = (void *)MEMORY[0x263F086D0];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __92__UITableView_TVVSAdditions__vs_scrollToIndexPath_atScrollPosition_animated_withCompletion___block_invoke;
    v18[3] = &unk_265076E20;
    v19 = v11;
    v16 = [v15 blockOperationWithBlock:v18];
    uint64_t v17 = objc_msgSend(a1, "vs_scrollCompletionOperations");
    [v17 addObject:v16];
  }
  else
  {
    v11[2](v11);
  }
}

- (id)vs_scrollCompletionOperations
{
  return objc_getAssociatedObject(a1, "VSScrollCompletionOperationsKey");
}

- (void)vs_setScrollCompletionOperations:()TVVSAdditions
{
}

@end