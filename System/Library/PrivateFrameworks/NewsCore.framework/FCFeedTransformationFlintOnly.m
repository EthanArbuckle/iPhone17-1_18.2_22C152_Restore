@interface FCFeedTransformationFlintOnly
- (id)transformFeedItems:(id)a3;
@end

@implementation FCFeedTransformationFlintOnly

- (id)transformFeedItems:(id)a3
{
  return (id)objc_msgSend(a3, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_16);
}

BOOL __52__FCFeedTransformationFlintOnly_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentType] == 2;
}

@end