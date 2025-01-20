@interface PKPayLaterFinancingPlansFetcherRequest
- (BOOL)coalesceRequest:(id)a3;
- (NSDate)startDate;
- (NSMutableArray)completions;
- (PKPayLaterFinancingPlansFetcherRequest)initWithStartDate:(id)a3 completion:(id)a4;
- (void)callCompletionsWithResult:(id)a3;
- (void)setCompletions:(id)a3;
@end

@implementation PKPayLaterFinancingPlansFetcherRequest

- (PKPayLaterFinancingPlansFetcherRequest)initWithStartDate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingPlansFetcherRequest;
  v9 = [(PKPayLaterFinancingPlansFetcherRequest *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completions = v10->_completions;
    v10->_completions = v11;

    v13 = v10->_completions;
    v14 = _Block_copy(v8);
    [(NSMutableArray *)v13 safelyAddObject:v14];
  }
  return v10;
}

- (BOOL)coalesceRequest:(id)a3
{
  id v4 = a3;
  startDate = self->_startDate;
  v6 = [v4 startDate];
  BOOL v7 = [(NSDate *)startDate isEqualToDate:v6];

  if (v7)
  {
    completions = self->_completions;
    v9 = [v4 completions];
    [(NSMutableArray *)completions addObjectsFromArray:v9];
  }
  return v7;
}

- (void)callCompletionsWithResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_completions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end