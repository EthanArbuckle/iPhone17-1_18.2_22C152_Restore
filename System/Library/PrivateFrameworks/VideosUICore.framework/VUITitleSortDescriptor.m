@interface VUITitleSortDescriptor
+ (id)ascendingTitleSortComparatorWithKey:(id)a3;
+ (id)descendingTitleSortComparatorWithKey:(id)a3;
- (int64_t)compareObject:(id)a3 toObject:(id)a4;
@end

@implementation VUITitleSortDescriptor

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(VUITitleSortDescriptor *)self ascending];
  v9 = objc_opt_class();
  v10 = [(VUITitleSortDescriptor *)self key];
  if (v8) {
    [v9 ascendingTitleSortComparatorWithKey:v10];
  }
  else {
  v11 = [v9 descendingTitleSortComparatorWithKey:v10];
  }

  int64_t v12 = ((uint64_t (**)(void, id, id))v11)[2](v11, v7, v6);
  return v12;
}

+ (id)ascendingTitleSortComparatorWithKey:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__VUITitleSortDescriptor_ascendingTitleSortComparatorWithKey___block_invoke;
  v8[3] = &unk_1E6DDD088;
  id v9 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x1E4E604D0](v8);
  id v6 = (void *)MEMORY[0x1E4E604D0]();

  return v6;
}

uint64_t __62__VUITitleSortDescriptor_ascendingTitleSortComparatorWithKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 valueForKey:v5];
  int v8 = [v6 valueForKey:*(void *)(a1 + 32)];

  id v9 = +[VUISortUtilities ascendingTitleSortComparator];
  uint64_t v10 = ((uint64_t (**)(void, void *, void *))v9)[2](v9, v7, v8);

  return v10;
}

+ (id)descendingTitleSortComparatorWithKey:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__VUITitleSortDescriptor_descendingTitleSortComparatorWithKey___block_invoke;
  v8[3] = &unk_1E6DDD088;
  id v9 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1E4E604D0](v8);
  id v6 = (void *)MEMORY[0x1E4E604D0]();

  return v6;
}

uint64_t __63__VUITitleSortDescriptor_descendingTitleSortComparatorWithKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 valueForKey:v5];
  int v8 = [v6 valueForKey:*(void *)(a1 + 32)];

  id v9 = +[VUISortUtilities descendingTitleSortComparator];
  uint64_t v10 = ((uint64_t (**)(void, void *, void *))v9)[2](v9, v7, v8);

  return v10;
}

@end