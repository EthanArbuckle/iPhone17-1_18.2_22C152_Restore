@interface REConditionEvaluator
- (BOOL)acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5;
- (BOOL)compareFeatureMap:(id)a3 toFeatureMap:(id)a4;
- (BOOL)needsPredictionSet;
- (RECondition)condition;
- (REConditionEvaluator)initWithCondition:(id)a3;
- (unint64_t)mode;
@end

@implementation REConditionEvaluator

- (REConditionEvaluator)initWithCondition:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REConditionEvaluator;
  v6 = [(REConditionEvaluator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_condition, a3);
    v7->_mode = [(RECondition *)v7->_condition _validForRanking];
  }

  return v7;
}

- (BOOL)acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  id v8 = a3;
  id v15 = a4;
  if (self->_mode) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Cannot call -acceptsFeatureMap: when not configured for filtering", v9, v10, v11, v12, v13, v14, v18);
  }
  BOOL v16 = [(RECondition *)self->_condition _acceptsFeatureMap:v8 predictionSet:v15 explanation:a5];

  return v16;
}

- (BOOL)compareFeatureMap:(id)a3 toFeatureMap:(id)a4
{
  id v6 = a3;
  id v13 = a4;
  if (self->_mode != 1) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Cannot call -acceptsFeatureMap: when not configured for ranking", v7, v8, v9, v10, v11, v12, v16);
  }
  BOOL v14 = [(RECondition *)self->_condition _acceptsLeftFeatureMap:v6 rightFeatureMap:v13];

  return v14;
}

- (BOOL)needsPredictionSet
{
  return [(RECondition *)self->_condition _needsProbability];
}

- (unint64_t)mode
{
  return self->_mode;
}

- (RECondition)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
}

@end