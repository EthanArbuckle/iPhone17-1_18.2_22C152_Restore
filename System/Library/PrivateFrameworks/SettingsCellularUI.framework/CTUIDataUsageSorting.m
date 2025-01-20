@interface CTUIDataUsageSorting
+ (id)alphabeticalComparator;
+ (id)usageComparator;
+ (id)userSelectedComparator;
@end

@implementation CTUIDataUsageSorting

+ (id)alphabeticalComparator
{
  return &__block_literal_global_14;
}

uint64_t __46__CTUIDataUsageSorting_alphabeticalComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

+ (id)usageComparator
{
  return &__block_literal_global_3;
}

uint64_t __39__CTUIDataUsageSorting_usageComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v5, "dataUsage"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v4, "dataUsage"));
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    v9 = [v4 name];
    v10 = [v5 name];
    uint64_t v8 = [v9 localizedStandardCompare:v10];
  }
  return v8;
}

+ (id)userSelectedComparator
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"CellularDataUsageAlphabeticalSortKey"];

  if (v3) {
    +[CTUIDataUsageSorting alphabeticalComparator];
  }
  else {
  id v4 = +[CTUIDataUsageSorting usageComparator];
  }
  return v4;
}

@end