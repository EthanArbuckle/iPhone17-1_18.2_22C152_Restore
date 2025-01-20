@interface FCFeedTransformationFeedThrottle
+ (id)transformationWithDailyLimit:(unint64_t)a3 timeInterval:(double)a4 condition:(id)a5;
- (id)condition;
- (id)transformFeedItems:(id)a3;
- (unint64_t)limit;
- (void)setCondition:(id)a3;
- (void)setLimit:(unint64_t)a3;
@end

@implementation FCFeedTransformationFeedThrottle

+ (id)transformationWithDailyLimit:(unint64_t)a3 timeInterval:(double)a4 condition:(id)a5
{
  id v7 = a5;
  v8 = objc_opt_new();
  objc_msgSend(v8, "setLimit:", (unint64_t)fmax(ceil(a4 / 86400.0 * (double)a3), 1.0));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__FCFeedTransformationFeedThrottle_transformationWithDailyLimit_timeInterval_condition___block_invoke;
  v11[3] = &unk_1E5B55620;
  id v12 = v7;
  id v9 = v7;
  [v8 setCondition:v11];

  return v8;
}

uint64_t __88__FCFeedTransformationFeedThrottle_transformationWithDailyLimit_timeInterval_condition___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FCFeedTransformationFeedThrottle_transformFeedItems___block_invoke;
  v7[3] = &unk_1E5B57E38;
  v7[4] = self;
  v7[5] = v8;
  v5 = objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v7);
  _Block_object_dispose(v8, 8);

  return v5;
}

BOOL __55__FCFeedTransformationFeedThrottle_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 condition];
  int v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  if (v6)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v8 = *(void *)(v7 + 24) + 1;
    *(void *)(v7 + 24) = v8;
    BOOL v9 = v8 <= [*(id *)(a1 + 32) limit];
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
}

@end