@interface NSIndexPath(SBIconIndex)
+ (id)indexPathWithFolderIconIndex:()SBIconIndex folderListIndex:iconIndex:listIndex:;
+ (id)indexPathWithIconIndex:()SBIconIndex listIndex:;
+ (id)sb_indexPathWithFolderIconIndex:()SBIconIndex folderListIndex:listIndex:;
- (id)sb_firstIconPathComponent;
- (id)sb_iconPathDescription;
- (id)sb_iconRelativePathComponents;
- (id)sb_indexPathByAddingIndexPath:()SBIconIndex;
- (id)sb_indexPathByAddingPathComponentWithListIndex:()SBIconIndex iconIndex:;
- (id)sb_indexPathByRemovingFirstIconPathComponent;
- (id)sb_indexPathByRemovingLastIconIndex;
- (id)sb_indexPathByRemovingLastIconPathComponent;
- (id)sb_indexPathByReplacingLastIconIndex:()SBIconIndex;
- (id)sb_lastIconPathComponent;
- (uint64_t)sbIconIndex;
- (uint64_t)sbListIndex;
- (uint64_t)sb_isOnSameListAsIndexPath:()SBIconIndex;
- (uint64_t)sb_lastIconIndex;
- (uint64_t)sb_lastListIndex;
- (unint64_t)sb_iconPathCount;
@end

@implementation NSIndexPath(SBIconIndex)

- (uint64_t)sbListIndex
{
  if (![a1 length]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [a1 indexAtPosition:0];
}

- (uint64_t)sbIconIndex
{
  if ((unint64_t)[a1 length] < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [a1 indexAtPosition:1];
}

+ (id)indexPathWithIconIndex:()SBIconIndex listIndex:
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = a4;
  v6[1] = a3;
  v4 = [a1 indexPathWithIndexes:v6 length:2];
  return v4;
}

+ (id)indexPathWithFolderIconIndex:()SBIconIndex folderListIndex:iconIndex:listIndex:
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = a4;
  v8[1] = a3;
  v8[2] = a6;
  v8[3] = a5;
  v6 = [a1 indexPathWithIndexes:v8 length:4];
  return v6;
}

+ (id)sb_indexPathWithFolderIconIndex:()SBIconIndex folderListIndex:listIndex:
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = a4;
  v7[1] = a3;
  v7[2] = a5;
  v5 = [a1 indexPathWithIndexes:v7 length:3];
  return v5;
}

- (unint64_t)sb_iconPathCount
{
  return (unint64_t)[a1 length] >> 1;
}

- (uint64_t)sb_lastListIndex
{
  uint64_t v2 = [a1 length];
  return [a1 indexAtPosition:v2 + (v2 | 0xFFFFFFFFFFFFFFFELL)];
}

- (uint64_t)sb_lastIconIndex
{
  uint64_t v2 = [a1 length];
  if (v2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [a1 indexAtPosition:v2 - 1];
}

- (id)sb_iconRelativePathComponents
{
  size_t v2 = [a1 length];
  v3 = malloc_type_calloc(v2, 8uLL, 0x100004000313F17uLL);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(a1, "getIndexes:range:", v3, 0, v2);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v2)
    {
      size_t v6 = 0;
      v7 = v4;
      do
      {
        if (v2 - 1 == v6) {
          [MEMORY[0x1E4F28D58] indexPathWithIndex:*v7];
        }
        else {
        v8 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v7 length:2];
        }
        [v5 addObject:v8];

        v6 += 2;
        v7 += 2;
      }
      while (v6 < v2);
    }
    free(v4);
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (id)sb_firstIconPathComponent
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [a1 length];
  if (v2 == 2)
  {
    id v3 = a1;
  }
  else if (v2 >= 2)
  {
    objc_msgSend(a1, "getIndexes:range:", v5, 0, 2);
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F28D58]) initWithIndexes:v5 length:2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)sb_indexPathByRemovingFirstIconPathComponent
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  size_t v2 = [a1 length];
  size_t v3 = v2 - 2;
  if (v2 > 2)
  {
    if (v2 >= 0x10)
    {
      uint64_t v6 = (char *)malloc_type_calloc(v2, 8uLL, 0x100004000313F17uLL);
      id v5 = v6;
    }
    else
    {
      id v5 = 0;
      uint64_t v6 = &v8;
    }
    objc_msgSend(a1, "getIndexes:range:", v6, 2, v3);
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F28D58]) initWithIndexes:v6 length:v3];
    free(v5);
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28D58]);
  }
  return v4;
}

- (id)sb_indexPathByRemovingLastIconPathComponent
{
  v1 = [a1 indexPathByRemovingLastIndex];
  size_t v2 = [v1 indexPathByRemovingLastIndex];

  return v2;
}

- (id)sb_indexPathByRemovingLastIconIndex
{
  if ([a1 length])
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [a1 indexPathByRemovingLastIndex];
  }
  return v2;
}

- (id)sb_lastIconPathComponent
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [a1 length];
  if (v2 == 2)
  {
    id v3 = a1;
  }
  else if (v2 >= 2)
  {
    objc_msgSend(a1, "getIndexes:range:", v5, v2 - 2, 2);
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F28D58]) initWithIndexes:v5 length:2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)sb_indexPathByAddingIndexPath:()SBIconIndex
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  uint64_t v6 = [v4 length];
  uint64_t v7 = v5 + v6;
  if (__CFADD__(v5, v6) || (uint64_t v8 = v6, (v9 = (char *)malloc_type_calloc(v5 + v6, 8uLL, 0x100004000313F17uLL)) == 0))
  {
    v11 = 0;
  }
  else
  {
    v10 = v9;
    objc_msgSend(a1, "getIndexes:range:", v9, 0, v5);
    objc_msgSend(v4, "getIndexes:range:", &v10[8 * v5], 0, v8);
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28D58]) initWithIndexes:v10 length:v7];
    free(v10);
  }

  return v11;
}

- (id)sb_indexPathByAddingPathComponentWithListIndex:()SBIconIndex iconIndex:
{
  uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:a4 listIndex:a3];
  uint64_t v6 = objc_msgSend(a1, "sb_indexPathByAddingIndexPath:", v5);

  return v6;
}

- (uint64_t)sb_isOnSameListAsIndexPath:()SBIconIndex
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "sb_indexPathByRemovingLastIconIndex");
  uint64_t v6 = objc_msgSend(v4, "sb_indexPathByRemovingLastIconIndex");

  uint64_t v7 = [v5 isEqual:v6];
  return v7;
}

- (id)sb_indexPathByReplacingLastIconIndex:()SBIconIndex
{
  id v4 = objc_msgSend(a1, "sb_indexPathByRemovingLastIconIndex");
  uint64_t v5 = [v4 indexPathByAddingIndex:a3];

  return v5;
}

- (id)sb_iconPathDescription
{
  unint64_t v2 = [MEMORY[0x1E4F28E78] string];
  size_t v3 = [a1 length];
  id v4 = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(a1, "getIndexes:range:", v4, 0, v3);
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (i) {
          uint64_t v7 = @" - %lu";
        }
        else {
          uint64_t v7 = @" / %lu";
        }
        if (i) {
          uint64_t v8 = v7;
        }
        else {
          uint64_t v8 = @"%lu";
        }
        objc_msgSend(v2, "appendFormat:", v8, v5[i]);
      }
    }
    free(v5);
  }
  return v2;
}

@end