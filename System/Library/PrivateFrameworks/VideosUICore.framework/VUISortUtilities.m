@interface VUISortUtilities
+ (id)ascendingDateSortComparatorWithBlock:(id)a3;
+ (id)ascendingTitleSortComparator;
+ (id)descendingDateSortComparatorWithBlock:(id)a3;
+ (id)descendingTitleSortComparator;
+ (id)titleSortComparatorWithAscending:(BOOL)a3;
+ (int64_t)comparisonResultForObject1:(id)a3 object2:(id)a4 withComparators:(id)a5;
@end

@implementation VUISortUtilities

+ (id)ascendingDateSortComparatorWithBlock:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__VUISortUtilities_ascendingDateSortComparatorWithBlock___block_invoke;
  v8[3] = &unk_1E6DDCFF0;
  id v9 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x1E4E604D0](v8);
  v6 = (void *)MEMORY[0x1E4E604D0]();

  return v6;
}

uint64_t __57__VUISortUtilities_ascendingDateSortComparatorWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  v8 = v6(v5, a2);
  id v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  if (v8)
  {
    if (v9) {
      uint64_t v10 = [v8 compare:v9];
    }
    else {
      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

+ (id)descendingDateSortComparatorWithBlock:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__VUISortUtilities_descendingDateSortComparatorWithBlock___block_invoke;
  v12[3] = &unk_1E6DDD018;
  id v13 = v4;
  id v14 = a1;
  id v5 = v4;
  v6 = (void *)MEMORY[0x1E4E604D0](v12);
  uint64_t v10 = (void *)MEMORY[0x1E4E604D0](v6, v7, v8, v9);

  return v10;
}

uint64_t __58__VUISortUtilities_descendingDateSortComparatorWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v5 ascendingDateSortComparatorWithBlock:v6];
  uint64_t v10 = ((uint64_t (**)(void, id, id))v9)[2](v9, v8, v7);

  v11 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  v12 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  uint64_t v13 = 1;
  if (v10 == 1) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = v10;
  }
  if (v10 != -1) {
    uint64_t v13 = v14;
  }
  if (v11) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15) {
    uint64_t v16 = v10;
  }
  else {
    uint64_t v16 = v13;
  }

  return v16;
}

+ (id)titleSortComparatorWithAscending:(BOOL)a3
{
  if (a3) {
    [a1 ascendingTitleSortComparator];
  }
  else {
  id v3 = [a1 descendingTitleSortComparator];
  }
  return v3;
}

+ (id)ascendingTitleSortComparator
{
  v2 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__VUISortUtilities_ascendingTitleSortComparator__block_invoke;
  v7[3] = &unk_1E6DDD040;
  id v8 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x1E4E604D0](v7);
  id v5 = (void *)MEMORY[0x1E4E604D0]();

  return v5;
}

uint64_t __48__VUISortUtilities_ascendingTitleSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    if ([v6 length])
    {
      int v7 = objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", 0));
      int v8 = objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0));
      if (v7 && v8)
      {
        uint64_t v9 = [v5 compare:v6 options:65];
      }
      else if (v7)
      {
        uint64_t v9 = -1;
      }
      else
      {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

+ (id)descendingTitleSortComparator
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__VUISortUtilities_descendingTitleSortComparator__block_invoke;
  v5[3] = &__block_descriptor_40_e31_q24__0__NSString_8__NSString_16l;
  v5[4] = a1;
  v2 = (void *)MEMORY[0x1E4E604D0](v5, a2);
  id v3 = (void *)MEMORY[0x1E4E604D0]();

  return v3;
}

uint64_t __49__VUISortUtilities_descendingTitleSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  int v7 = [v4 ascendingTitleSortComparator];
  uint64_t v8 = ((uint64_t (**)(void, id, id))v7)[2](v7, v6, v5);

  if (v8 == 1) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v8;
  }
  if (v8 == -1) {
    return 1;
  }
  else {
    return v9;
  }
}

+ (int64_t)comparisonResultForObject1:(id)a3 object2:(id)a4 withComparators:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 count];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = [v10 firstObject];
    uint64_t v14 = objc_msgSend(v10, "subarrayWithRange:", 1, v12 - 1);
    int64_t v15 = ((uint64_t (**)(void, id, id))v13)[2](v13, v8, v9);
    if (!v15)
    {
      if ([v14 count]) {
        int64_t v15 = [a1 comparisonResultForObject1:v8 object2:v9 withComparators:v14];
      }
      else {
        int64_t v15 = 0;
      }
    }
  }
  else
  {
    int64_t v15 = 0;
  }

  return v15;
}

@end