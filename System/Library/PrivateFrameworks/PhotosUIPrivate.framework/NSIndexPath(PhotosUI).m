@interface NSIndexPath(PhotosUI)
+ (id)pu_indexPathForItem:()PhotosUI inSubSection:section:;
+ (id)pu_indexPathsForItems:()PhotosUI inSection:;
+ (id)pu_rootIndexPath;
- (BOOL)pu_isValid;
- (__CFString)pu_shortDescription;
- (id)pu_alteredIndexPathAfterDeletingItemAtIndexPath:()PhotosUI;
- (id)pu_alteredIndexPathAfterDeletingItemsAtIndexPaths:()PhotosUI;
- (id)pu_alteredIndexPathAfterInsertingItemAtIndexPath:()PhotosUI;
- (id)pu_alteredIndexPathAfterInsertingItemsAtIndexPaths:()PhotosUI;
- (id)pu_alteredIndexPathAfterMovingItemAtIndexPath:()PhotosUI toIndexPath:;
- (id)pu_indexPathAfterDeletingItemAtIndexPath:()PhotosUI;
- (id)pu_indexPathAfterInsertingItemAtIndexPath:()PhotosUI;
- (id)pu_indexPathAfterMovingItemFromIndexPath:()PhotosUI toIndexPath:;
- (id)pu_indexPathAfterReloadingItemAtIndexPath:()PhotosUI;
- (id)pu_indexPathByAppendingIndexPath:()PhotosUI;
- (id)pu_indexPathByChangingIndexAtPosition:()PhotosUI toIndex:;
- (uint64_t)pu_isParentOfIndexPath:()PhotosUI;
@end

@implementation NSIndexPath(PhotosUI)

- (__CFString)pu_shortDescription
{
  uint64_t v2 = [a1 length];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v2];
    for (uint64_t i = 0; i != v3; ++i)
    {
      v6 = NSString;
      v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "indexAtPosition:", i));
      v8 = [v6 stringWithFormat:@"%@", v7];
      [v4 addObject:v8];
    }
    v9 = [v4 componentsJoinedByString:@"-"];
  }
  else
  {
    v9 = @"∅";
  }
  return v9;
}

- (id)pu_indexPathAfterReloadingItemAtIndexPath:()PhotosUI
{
  id v4 = a3;
  id v5 = a1;
  if (objc_msgSend(v4, "pu_isParentOfIndexPath:", v5))
  {
    if ([v4 length]) {
      uint64_t v6 = [v4 length] - 1;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = objc_msgSend(v5, "pu_indexPathByChangingIndexAtPosition:toIndex:", v6, 0x7FFFFFFFFFFFFFFFLL);

    id v5 = (id)v7;
  }

  return v5;
}

- (id)pu_indexPathAfterMovingItemFromIndexPath:()PhotosUI toIndexPath:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  if ([v6 isEqual:v7])
  {
    id v9 = v8;
    goto LABEL_11;
  }
  if ([v8 isEqual:v6])
  {
    id v9 = v7;
LABEL_10:

    goto LABEL_11;
  }
  if (!objc_msgSend(v6, "pu_isParentOfIndexPath:", v8))
  {
    v12 = objc_msgSend(v8, "pu_indexPathAfterDeletingItemAtIndexPath:", v6);

    objc_msgSend(v12, "pu_indexPathAfterInsertingItemAtIndexPath:", v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v12;
    goto LABEL_10;
  }
  id v10 = v7;

  unint64_t v11 = [v6 length];
  if (v11 >= [v8 length])
  {
    id v9 = v10;
  }
  else
  {
    do
    {
      objc_msgSend(v10, "indexPathByAddingIndex:", objc_msgSend(v8, "indexAtPosition:", v11));
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      ++v11;
      id v10 = v9;
    }
    while (v11 < [v8 length]);
  }
LABEL_11:

  return v9;
}

- (id)pu_indexPathAfterDeletingItemAtIndexPath:()PhotosUI
{
  id v4 = a3;
  id v5 = a1;
  if (![v4 length])
  {
    v14 = v5;
    uint64_t v15 = 0;
    goto LABEL_11;
  }
  unint64_t v6 = [v5 length];
  if (v6 < [v4 length]) {
    goto LABEL_13;
  }
  uint64_t v7 = [v4 length];
  uint64_t v8 = v7 - 1;
  if (v7 == 1)
  {
LABEL_7:
    uint64_t v11 = [v5 indexAtPosition:v8];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_13;
    }
    unint64_t v12 = v11;
    unint64_t v13 = [v4 indexAtPosition:v8];
    if (v12 != v13)
    {
      if (v12 <= v13) {
        goto LABEL_13;
      }
      uint64_t v16 = v12 - 1;
      v14 = v5;
      uint64_t v15 = v8;
LABEL_12:
      uint64_t v17 = objc_msgSend(v14, "pu_indexPathByChangingIndexAtPosition:toIndex:", v15, v16);

      id v5 = (id)v17;
      goto LABEL_13;
    }
    v14 = v5;
    uint64_t v15 = v8;
LABEL_11:
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  uint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = [v5 indexAtPosition:v9];
    if (v10 != [v4 indexAtPosition:v9]) {
      break;
    }
    if (v8 == ++v9) {
      goto LABEL_7;
    }
  }
LABEL_13:

  return v5;
}

- (id)pu_indexPathAfterInsertingItemAtIndexPath:()PhotosUI
{
  id v5 = a3;
  id v6 = a1;
  if (![v5 length])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:v6 file:@"NSIndexPath+PhotosUI.m" lineNumber:148 description:@"can't insert zero-length index path"];
    goto LABEL_11;
  }
  unint64_t v7 = [v6 length];
  if (v7 < [v5 length]) {
    goto LABEL_12;
  }
  uint64_t v8 = [v5 length];
  uint64_t v9 = v8 - 1;
  if (v8 == 1)
  {
LABEL_7:
    unint64_t v12 = [v6 indexAtPosition:v9];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
    unint64_t v13 = v12;
    if (v12 < [v5 indexAtPosition:v9]) {
      goto LABEL_12;
    }
    objc_msgSend(v6, "pu_indexPathByChangingIndexAtPosition:toIndex:", v9, v13 + 1);
    v14 = v6;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v10 = 0;
  while (1)
  {
    uint64_t v11 = [v6 indexAtPosition:v10];
    if (v11 != [v5 indexAtPosition:v10]) {
      break;
    }
    if (v9 == ++v10) {
      goto LABEL_7;
    }
  }
LABEL_12:

  return v6;
}

- (id)pu_alteredIndexPathAfterMovingItemAtIndexPath:()PhotosUI toIndexPath:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  if (v6 && ([v6 isEqual:v7] & 1) == 0)
  {
    if ([v8 isEqual:v6])
    {
      id v9 = v7;
    }
    else
    {
      uint64_t v10 = objc_msgSend(v8, "pu_alteredIndexPathAfterDeletingItemAtIndexPath:", v6);

      objc_msgSend(v10, "pu_alteredIndexPathAfterInsertingItemAtIndexPath:", v7);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = v10;
    }

    id v8 = v9;
  }

  return v8;
}

- (id)pu_alteredIndexPathAfterDeletingItemsAtIndexPaths:()PhotosUI
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(a3, "reverseObjectEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v4;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v10, "pu_alteredIndexPathAfterDeletingItemAtIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * v9));
        id v4 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        uint64_t v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)pu_alteredIndexPathAfterDeletingItemAtIndexPath:()PhotosUI
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = [v4 section];
  if (v6 == [v5 section])
  {
    uint64_t v7 = [v4 item];
    if (v7 == [v5 item])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v9 = [v5 section];
      uint64_t v10 = v8;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v12 = [v4 item];
      if (v12 >= [v5 item]) {
        goto LABEL_7;
      }
      long long v13 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v14 = [v5 item] - 1;
      uint64_t v9 = [v5 section];
      uint64_t v10 = v13;
      uint64_t v11 = v14;
    }
    uint64_t v15 = [v10 indexPathForItem:v11 inSection:v9];

    id v5 = (id)v15;
  }
LABEL_7:

  return v5;
}

- (id)pu_alteredIndexPathAfterInsertingItemsAtIndexPaths:()PhotosUI
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v5;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v10, "pu_alteredIndexPathAfterInsertingItemAtIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * v9));
        id v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        uint64_t v10 = v5;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)pu_alteredIndexPathAfterInsertingItemAtIndexPath:()PhotosUI
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = [v4 section];
  if (v6 == [v5 section])
  {
    uint64_t v7 = [v4 item];
    if (v7 <= [v5 item])
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v5, "item") + 1, objc_msgSend(v5, "section"));

      id v5 = (id)v8;
    }
  }

  return v5;
}

- (uint64_t)pu_isParentOfIndexPath:()PhotosUI
{
  id v4 = a3;
  unint64_t v5 = [a1 length];
  if (v5 <= [v4 length])
  {
    if ([a1 length])
    {
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = [a1 indexAtPosition:v7];
        BOOL v9 = v8 == [v4 indexAtPosition:v7];
        uint64_t v6 = v9;
        if (!v9) {
          break;
        }
        if (++v7 >= (unint64_t)[a1 length]) {
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)pu_isValid
{
  if (![a1 length]) {
    return 1;
  }
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = [a1 indexAtPosition:v2];
    BOOL v4 = v3 == 0x7FFFFFFFFFFFFFFFLL;
    BOOL result = v3 != 0x7FFFFFFFFFFFFFFFLL;
    if (v4) {
      break;
    }
    if (++v2 >= (unint64_t)[a1 length]) {
      return 1;
    }
  }
  return result;
}

- (id)pu_indexPathByAppendingIndexPath:()PhotosUI
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 length];
  uint64_t v6 = [v4 length] + v5;
  uint64_t v7 = (char *)v13 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
      *(void *)&v7[8 * i] = [a1 indexAtPosition:i];
  }
  if ([v4 length])
  {
    unint64_t v9 = 0;
    uint64_t v10 = &v7[8 * v5];
    do
    {
      *(void *)&v10[8 * v9] = [v4 indexAtPosition:v9];
      ++v9;
    }
    while (v9 < [v4 length]);
  }
  uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v7 length:v6];

  return v11;
}

- (id)pu_indexPathByChangingIndexAtPosition:()PhotosUI toIndex:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a1 length];
  uint64_t v8 = (char *)v13 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = a4;
      if (a3 != v9) {
        uint64_t v10 = [a1 indexAtPosition:v9];
      }
      *(void *)&v8[8 * v9++] = v10;
    }
    while (v7 != v9);
  }
  uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v8 length:v7];
  return v11;
}

+ (id)pu_rootIndexPath
{
  v1 = (void *)[[a1 alloc] initWithIndexes:0 length:0];
  return v1;
}

+ (id)pu_indexPathForItem:()PhotosUI inSubSection:section:
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = a5;
  v7[1] = a4;
  v7[2] = a3;
  uint64_t v5 = [(id)objc_opt_class() indexPathWithIndexes:v7 length:3];
  return v5;
}

+ (id)pu_indexPathsForItems:()PhotosUI inSection:
{
  if (a3)
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v6 = a3;
    uint64_t v7 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__NSIndexPath_PhotosUI__pu_indexPathsForItems_inSection___block_invoke;
    v10[3] = &unk_1E5F2A5F0;
    uint64_t v12 = a4;
    id v8 = v7;
    id v11 = v8;
    [v6 enumerateIndexesUsingBlock:v10];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

@end