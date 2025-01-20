@interface SearchUIKeyValueDataCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (id)convertSFKeyValueData:(id)a3;
- (id)setupContentView;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIKeyValueDataCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v2 = objc_opt_new();
  return v2;
}

- (id)convertSFKeyValueData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E4FAE0E8];
        v12 = objc_msgSend(v10, "key", (void)v16);
        v13 = [v10 value];
        v14 = [v11 tupleWithKey:v12 value:v13];

        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 cardSection];
  v16.receiver = self;
  v16.super_class = (Class)SearchUIKeyValueDataCardSectionView;
  [(SearchUICardSectionView *)&v16 updateWithRowModel:v4];

  uint64_t v6 = [v5 data];
  uint64_t v7 = [(SearchUIKeyValueDataCardSectionView *)self convertSFKeyValueData:v6];

  uint64_t v8 = [(SearchUICardSectionView *)self contentView];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SearchUIKeyValueDataCardSectionView_updateWithRowModel___block_invoke;
  v12[3] = &unk_1E6E72938;
  id v13 = v5;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v5;
  [v9 performBatchUpdates:v12];
}

void __58__SearchUIKeyValueDataCardSectionView_updateWithRowModel___block_invoke(id *a1)
{
  v2 = [a1[4] accessoryImage];
  if (v2)
  {
  }
  else if ((unint64_t)[a1[5] count] >= 5)
  {
    unint64_t v3 = vcvtad_u64_f64((double)(unint64_t)[a1[5] count] * 0.5);
    id v4 = objc_msgSend(a1[5], "subarrayWithRange:", 0, v3);
    [a1[6] setLeadingTuples:v4];

    id v5 = objc_msgSend(a1[5], "subarrayWithRange:", v3, objc_msgSend(a1[5], "count") - v3);
    [a1[6] setTrailingTuples:v5];

    goto LABEL_6;
  }
  [a1[6] setLeadingTuples:a1[5]];
LABEL_6:
  id v7 = [a1[4] accessoryImage];
  uint64_t v6 = +[SearchUITLKImageConverter imageForSFImage:v7];
  [a1[6] setImage:v6];
}

@end