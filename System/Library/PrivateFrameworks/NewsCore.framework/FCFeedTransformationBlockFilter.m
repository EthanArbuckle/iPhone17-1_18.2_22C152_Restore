@interface FCFeedTransformationBlockFilter
+ (id)blockFilterWithPredicate:(id)a3;
- (id)predicate;
- (id)transformFeedItems:(id)a3;
- (void)setPredicate:(id)a3;
@end

@implementation FCFeedTransformationBlockFilter

+ (id)blockFilterWithPredicate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPredicate:v3];

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__FCFeedTransformationBlockFilter_transformFeedItems___block_invoke;
  v8[3] = &unk_1E5B57630;
  v8[4] = self;
  id v4 = a3;
  v5 = [v3 predicateWithBlock:v8];
  v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

uint64_t __54__FCFeedTransformationBlockFilter_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 predicate];
  uint64_t v5 = ((uint64_t (**)(void, id))v4)[2](v4, v3);

  return v5;
}

- (id)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end