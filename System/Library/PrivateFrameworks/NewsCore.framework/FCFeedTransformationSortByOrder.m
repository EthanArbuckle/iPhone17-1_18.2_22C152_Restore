@interface FCFeedTransformationSortByOrder
- (id)transformFeedItems:(id)a3;
@end

@implementation FCFeedTransformationSortByOrder

- (id)transformFeedItems:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_23];
}

uint64_t __54__FCFeedTransformationSortByOrder_transformFeedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  unint64_t v5 = [a3 order];
  unint64_t v6 = [v4 order];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

@end