@interface NSIndexPath(PhotosUIFoundation)
+ (id)px_indexPathForItem:()PhotosUIFoundation inSection:;
+ (id)px_indexPathForItem:()PhotosUIFoundation inSection:withKind:;
+ (id)px_indexPathsForItems:()PhotosUIFoundation inSection:;
- (id)px_alteredIndexPathAfterDeletingItemAtIndexPath:()PhotosUIFoundation;
- (id)px_alteredIndexPathAfterDeletingItemsAtIndexPaths:()PhotosUIFoundation;
- (id)px_alteredIndexPathAfterInsertingItemAtIndexPath:()PhotosUIFoundation;
- (id)px_alteredIndexPathAfterInsertingItemsAtIndexPaths:()PhotosUIFoundation;
- (id)px_alteredIndexPathAfterMovingItemAtIndexPath:()PhotosUIFoundation toIndexPath:;
- (id)px_indexPathAfterDeletingItemAtIndexPath:()PhotosUIFoundation;
- (id)px_indexPathAfterInsertingItemAtIndexPath:()PhotosUIFoundation;
- (id)px_indexPathByChangingIndexAtPosition:()PhotosUIFoundation toIndex:;
- (uint64_t)px_item;
- (uint64_t)px_kind;
- (uint64_t)px_section;
@end

@implementation NSIndexPath(PhotosUIFoundation)

- (id)px_indexPathAfterDeletingItemAtIndexPath:()PhotosUIFoundation
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
      uint64_t v17 = objc_msgSend(v14, "px_indexPathByChangingIndexAtPosition:toIndex:", v15, v16);

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

- (id)px_indexPathAfterInsertingItemAtIndexPath:()PhotosUIFoundation
{
  id v5 = a3;
  id v6 = a1;
  if (![v5 length])
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:v6 file:@"NSIndexPath+PhotosUIFoundation.m" lineNumber:109 description:@"can't insert zero-length index path"];
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
    objc_msgSend(v6, "px_indexPathByChangingIndexAtPosition:toIndex:", v9, v13 + 1);
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

- (id)px_alteredIndexPathAfterMovingItemAtIndexPath:()PhotosUIFoundation toIndexPath:
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
      uint64_t v10 = objc_msgSend(v8, "px_alteredIndexPathAfterDeletingItemAtIndexPath:", v6);

      objc_msgSend(v10, "px_alteredIndexPathAfterInsertingItemAtIndexPath:", v7);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = v10;
    }

    id v8 = v9;
  }

  return v8;
}

- (id)px_alteredIndexPathAfterDeletingItemsAtIndexPaths:()PhotosUIFoundation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
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
        objc_msgSend(v10, "px_alteredIndexPathAfterDeletingItemAtIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * v9));
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

- (id)px_alteredIndexPathAfterDeletingItemAtIndexPath:()PhotosUIFoundation
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = objc_msgSend(v4, "px_section");
  if (v6 == objc_msgSend(v5, "px_section"))
  {
    uint64_t v7 = objc_msgSend(v4, "px_item");
    if (v7 == objc_msgSend(v5, "px_item"))
    {
      uint64_t v8 = (void *)MEMORY[0x263F088C8];
      uint64_t v9 = objc_msgSend(v5, "px_section");
      uint64_t v10 = v8;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v12 = objc_msgSend(v4, "px_item");
      if (v12 >= objc_msgSend(v5, "px_item")) {
        goto LABEL_7;
      }
      long long v13 = (void *)MEMORY[0x263F088C8];
      uint64_t v14 = objc_msgSend(v5, "px_item") - 1;
      uint64_t v9 = objc_msgSend(v5, "px_section");
      uint64_t v10 = v13;
      uint64_t v11 = v14;
    }
    uint64_t v15 = objc_msgSend(v10, "px_indexPathForItem:inSection:", v11, v9);

    id v5 = (id)v15;
  }
LABEL_7:

  return v5;
}

- (id)px_alteredIndexPathAfterInsertingItemsAtIndexPaths:()PhotosUIFoundation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
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
        objc_msgSend(v10, "px_alteredIndexPathAfterInsertingItemAtIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * v9));
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

- (id)px_alteredIndexPathAfterInsertingItemAtIndexPath:()PhotosUIFoundation
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = objc_msgSend(v4, "px_section");
  if (v6 == objc_msgSend(v5, "px_section"))
  {
    uint64_t v7 = objc_msgSend(v4, "px_item");
    if (v7 <= objc_msgSend(v5, "px_item"))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "px_indexPathForItem:inSection:", objc_msgSend(v5, "px_item") + 1, objc_msgSend(v5, "px_section"));

      id v5 = (id)v8;
    }
  }

  return v5;
}

- (id)px_indexPathByChangingIndexAtPosition:()PhotosUIFoundation toIndex:
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = [a1 length];
  uint64_t v8 = (char *)v11 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 getIndexes:v8];
  *(void *)&v8[8 * a3] = a4;
  uint64_t v9 = [MEMORY[0x263F088C8] indexPathWithIndexes:v8 length:v7];

  return v9;
}

- (uint64_t)px_kind
{
  if ((unint64_t)[a1 length] < 3) {
    return 0;
  }

  return [a1 indexAtPosition:2];
}

- (uint64_t)px_section
{
  return [a1 indexAtPosition:0];
}

- (uint64_t)px_item
{
  if ((unint64_t)[a1 length] < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [a1 indexAtPosition:1];
}

+ (id)px_indexPathForItem:()PhotosUIFoundation inSection:withKind:
{
  v7[3] = *MEMORY[0x263EF8340];
  v7[0] = a4;
  v7[1] = a3;
  v7[2] = a5;
  id v5 = [(id)objc_opt_class() indexPathWithIndexes:v7 length:3];

  return v5;
}

+ (id)px_indexPathForItem:()PhotosUIFoundation inSection:
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = a4;
  v6[1] = a3;
  id v4 = [(id)objc_opt_class() indexPathWithIndexes:v6 length:2];

  return v4;
}

+ (id)px_indexPathsForItems:()PhotosUIFoundation inSection:
{
  if (a3)
  {
    id v5 = (objc_class *)MEMORY[0x263EFF980];
    id v6 = a3;
    uint64_t v7 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__NSIndexPath_PhotosUIFoundation__px_indexPathsForItems_inSection___block_invoke;
    v10[3] = &unk_26545A570;
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