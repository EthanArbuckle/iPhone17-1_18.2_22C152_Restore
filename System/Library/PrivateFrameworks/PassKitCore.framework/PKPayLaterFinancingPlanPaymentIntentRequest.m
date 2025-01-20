@interface PKPayLaterFinancingPlanPaymentIntentRequest
- (NSMutableArray)completions;
- (NSString)planIdentifier;
- (PKPayLaterFinancingPlanPaymentIntentRequest)initWithPlanIdentifier:(id)a3 intent:(unint64_t)a4 completion:(id)a5;
- (id)identifier;
- (unint64_t)intent;
- (void)callCompletionsWithResponse:(id)a3 error:(id)a4;
- (void)coalesceWithRequest:(id)a3;
- (void)setCompletions:(id)a3;
@end

@implementation PKPayLaterFinancingPlanPaymentIntentRequest

- (PKPayLaterFinancingPlanPaymentIntentRequest)initWithPlanIdentifier:(id)a3 intent:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterFinancingPlanPaymentIntentRequest;
  v11 = [(PKPayLaterFinancingPlanPaymentIntentRequest *)&v17 init];
  if (v11)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completions = v11->_completions;
    v11->_completions = v12;

    objc_storeStrong((id *)&v11->_planIdentifier, a3);
    v11->_intent = a4;
    v14 = v11->_completions;
    v15 = _Block_copy(v10);
    [(NSMutableArray *)v14 safelyAddObject:v15];
  }
  return v11;
}

- (void)coalesceWithRequest:(id)a3
{
  completions = self->_completions;
  id v4 = [a3 completions];
  [(NSMutableArray *)completions addObjectsFromArray:v4];
}

- (void)callCompletionsWithResponse:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_completions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)identifier
{
  v2 = NSString;
  planIdentifier = self->_planIdentifier;
  id v4 = PKFinancingPlanPaymentIntentTypeToString(self->_intent);
  v5 = [v2 stringWithFormat:@"%@-%@", planIdentifier, v4];

  return v5;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
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
  objc_storeStrong((id *)&self->_planIdentifier, 0);
}

@end