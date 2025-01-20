@interface UITableView
- (void)safari_adjustContentOffsetToTopHidingTableHeaderView;
- (void)safari_dismissContextMenu;
- (void)safari_moveSelectionByRowOffset:(void *)a1;
- (void)safari_moveSelectionBySectionOffset:(void *)a1;
@end

@implementation UITableView

- (void)safari_moveSelectionByRowOffset:(void *)a1
{
  if (a1)
  {
    uint64_t v2 = a2;
    if (a2)
    {
      if ([a1 numberOfSections])
      {
        v11 = [a1 indexPathForSelectedRow];
        uint64_t v4 = [v11 section];
        if (v11) {
          uint64_t v5 = [v11 row];
        }
        else {
          uint64_t v5 = -1;
        }
        uint64_t v6 = [a1 numberOfRowsInSection:v4];
        while (2)
        {
          v7 = v11;
          while (1)
          {
            uint64_t v8 = v2 + v5;
            if (v2 + v5 >= 0) {
              break;
            }
            if (v4 <= 0)
            {
              [a1 deselectRowAtIndexPath:v11 animated:0];
              goto LABEL_20;
            }
            uint64_t v9 = [a1 numberOfRowsInSection:--v4];
            v7 = v11;
            uint64_t v5 = v9;
            uint64_t v6 = v9;
            uint64_t v2 = v8;
          }
          if (v8 >= v6)
          {
            if (v4 + 1 != [a1 numberOfSections])
            {
              v2 += v5 - v6;
              uint64_t v6 = [a1 numberOfRowsInSection:v4 + 1];
              uint64_t v5 = 0;
              ++v4;
              continue;
            }
            uint64_t v8 = v6 - 1;
            v7 = v11;
          }
          break;
        }
        if ((v4 & 0x8000000000000000) == 0)
        {
          v10 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:v4];
          [a1 selectRowAtIndexPath:v10 animated:0 scrollPosition:0];
          [a1 scrollToRowAtIndexPath:v10 atScrollPosition:0 animated:0];

LABEL_20:
          v7 = v11;
        }
      }
    }
  }
}

- (void)safari_moveSelectionBySectionOffset:(void *)a1
{
  if (a1 && a2)
  {
    uint64_t v4 = [a1 indexPathForSelectedRow];
    id v8 = v4;
    if (v4)
    {
      uint64_t v5 = [v4 section];
      uint64_t v4 = v8;
    }
    else
    {
      uint64_t v5 = -1;
    }
    uint64_t v6 = [v4 row];
    if (a2 <= 0 && v6) {
      goto LABEL_12;
    }
    v5 += a2;
    if (v5 >= [a1 numberOfSections] - 1) {
      uint64_t v5 = [a1 numberOfSections] - 1;
    }
    if (v5 < 0)
    {
      [a1 deselectRowAtIndexPath:v8 animated:0];
    }
    else
    {
LABEL_12:
      v7 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v5];
      [a1 selectRowAtIndexPath:v7 animated:0 scrollPosition:0];
      [a1 scrollToRowAtIndexPath:v7 atScrollPosition:0 animated:0];
    }
  }
}

- (void)safari_adjustContentOffsetToTopHidingTableHeaderView
{
  if (a1)
  {
    [a1 adjustedContentInset];
    double v3 = v2;
    id v6 = [a1 tableHeaderView];
    [v6 bounds];
    CGFloat v4 = CGRectGetHeight(v8) - v3;
    [a1 contentInset];
    objc_msgSend(a1, "setContentOffset:", 0.0, v4 + v5);
  }
}

- (void)safari_dismissContextMenu
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    v1 = objc_msgSend(a1, "interactions", 0);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v8;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v1);
          }
          id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v6 dismissMenu];
          }
          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v3);
    }
  }
}

@end