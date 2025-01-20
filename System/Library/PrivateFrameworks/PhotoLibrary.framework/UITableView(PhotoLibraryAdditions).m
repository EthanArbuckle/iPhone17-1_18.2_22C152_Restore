@interface UITableView(PhotoLibraryAdditions)
- (uint64_t)pl_indexPathForLastRow;
- (uint64_t)pl_lastRowIsVisible;
- (uint64_t)pl_resetContentOffsetFromContentInsets;
- (uint64_t)pl_scrollToBottom:()PhotoLibraryAdditions;
- (uint64_t)pl_scrollToTop:()PhotoLibraryAdditions;
- (uint64_t)pl_scrollToVisibleRowAtIndexPath:()PhotoLibraryAdditions animated:;
@end

@implementation UITableView(PhotoLibraryAdditions)

- (uint64_t)pl_resetContentOffsetFromContentInsets
{
  [a1 contentInset];
  double v3 = v2;
  double v5 = v4;
  [a1 contentOffset];
  double v8 = v7 - v5;
  if (v8 < -v5) {
    double v8 = -v5;
  }
  double v9 = v6 - v3;
  if (v9 < -v3) {
    double v9 = -v3;
  }

  return objc_msgSend(a1, "setContentOffset:", v8, v9);
}

- (uint64_t)pl_indexPathForLastRow
{
  uint64_t v2 = [a1 numberOfSections];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2 - 1;
  uint64_t v4 = [a1 numberOfRowsInSection:v2 - 1];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4 - 1;
  double v6 = (void *)MEMORY[0x1E4F28D58];

  return [v6 indexPathForRow:v5 inSection:v3];
}

- (uint64_t)pl_lastRowIsVisible
{
  uint64_t v2 = objc_msgSend(a1, "pl_indexPathForLastRow");
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "indexPathsForVisibleRows"), "lastObject");
  if (!v4) {
    return 0;
  }

  return [v3 isEqual:v4];
}

- (uint64_t)pl_scrollToBottom:()PhotoLibraryAdditions
{
  uint64_t v5 = (void *)[a1 tableFooterView];
  if (v5)
  {
    [v5 frame];
    return objc_msgSend(a1, "scrollRectToVisible:animated:", a3);
  }
  else
  {
    uint64_t result = objc_msgSend(a1, "pl_indexPathForLastRow");
    if (result)
    {
      return [a1 scrollToRowAtIndexPath:result atScrollPosition:3 animated:a3];
    }
  }
  return result;
}

- (uint64_t)pl_scrollToTop:()PhotoLibraryAdditions
{
  return objc_msgSend(a1, "scrollRectToVisible:animated:", 0.0, 0.0, 1.0, 1.0);
}

- (uint64_t)pl_scrollToVisibleRowAtIndexPath:()PhotoLibraryAdditions animated:
{
  uint64_t v8 = [a3 section];
  unint64_t v9 = [a3 row];
  if (v9 >= [a1 numberOfRowsInSection:v8]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UITableViewAdditions.m", 28, @"indexPath is out of range %@", a3);
  }
  [a1 rectForRowAtIndexPath:a3];
  double v37 = v11;
  double v38 = v10;
  double v35 = v13;
  double v36 = v12;
  [a1 contentInset];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [a1 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  if (objc_msgSend(a3, "isEqual:", objc_msgSend(a1, "pl_indexPathForLastRow")))
  {
    return objc_msgSend(a1, "pl_scrollToBottom:", a4);
  }
  else
  {
    double v31 = v17 + v23;
    double v32 = v15 + v25;
    double v33 = v27 - (v17 + v21);
    double v34 = v29 - (v15 + v19);
    v40.origin.x = v31;
    v40.origin.y = v32;
    v40.size.width = v33;
    v40.size.height = v34;
    v42.origin.x = v38;
    v42.origin.y = v37;
    v42.size.width = v36;
    v42.size.height = v35;
    uint64_t result = CGRectContainsRect(v40, v42);
    if ((result & 1) == 0)
    {
      v41.origin.x = v31;
      v41.origin.y = v32;
      v41.size.width = v33;
      v41.size.height = v34;
      v43.origin.x = v38;
      v43.origin.y = v37;
      v43.size.width = v36;
      v43.size.height = v35;
      if (CGRectIntersectsRect(v41, v43))
      {
        return objc_msgSend(a1, "scrollRectToVisible:animated:", a4, v38, v37, v36, v35);
      }
      else
      {
        [a1 scrollToRowAtIndexPath:a3 atScrollPosition:2 animated:a4];
        return objc_msgSend(a1, "pl_resetContentOffsetFromContentInsets");
      }
    }
  }
  return result;
}

@end