@interface FCFeedTransformationClamp
+ (id)transformationWithDateRange:(id)a3;
+ (id)transformationWithFeedRange:(id)a3;
- (FCFeedRange)feedRange;
- (id)transformFeedItems:(id)a3;
- (void)setFeedRange:(id)a3;
@end

@implementation FCFeedTransformationClamp

+ (id)transformationWithDateRange:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = +[FCFeedRange feedRangeFromDateRange:v3];

  [v4 setFeedRange:v5];
  return v4;
}

+ (id)transformationWithFeedRange:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setFeedRange:v3];

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__FCFeedTransformationClamp_transformFeedItems___block_invoke;
  v5[3] = &unk_1E5B4C958;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "fc_arrayOfObjectsPassingTest:", v5);
  return v3;
}

uint64_t __48__FCFeedTransformationClamp_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 order])
  {
    v4 = [*(id *)(a1 + 32) feedRange];
    uint64_t v5 = objc_msgSend(v4, "containsOrder:", objc_msgSend(v3, "order"));
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (FCFeedRange)feedRange
{
  return self->_feedRange;
}

- (void)setFeedRange:(id)a3
{
}

- (void).cxx_destruct
{
}

@end