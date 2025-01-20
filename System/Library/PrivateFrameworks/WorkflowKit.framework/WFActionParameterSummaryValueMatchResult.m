@interface WFActionParameterSummaryValueMatchResult
+ (id)noMatchWithValue:(id)a3;
- (WFActionParameterSummaryValue)value;
- (WFActionParameterSummaryValueMatchResult)initWithValue:(id)a3 matchType:(unint64_t)a4 numberOfMatchingParameters:(unint64_t)a5;
- (unint64_t)matchType;
- (unint64_t)numberOfMatchingParameters;
@end

@implementation WFActionParameterSummaryValueMatchResult

- (void).cxx_destruct
{
}

- (unint64_t)numberOfMatchingParameters
{
  return self->_numberOfMatchingParameters;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (WFActionParameterSummaryValue)value
{
  return self->_value;
}

- (WFActionParameterSummaryValueMatchResult)initWithValue:(id)a3 matchType:(unint64_t)a4 numberOfMatchingParameters:(unint64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFActionParameterSummaryValueMatchResult;
  v10 = [(WFActionParameterSummaryValueMatchResult *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_value, a3);
    v11->_matchType = a4;
    v11->_numberOfMatchingParameters = a5;
    v12 = v11;
  }

  return v11;
}

+ (id)noMatchWithValue:(id)a3
{
  id v3 = a3;
  v4 = [[WFActionParameterSummaryValueMatchResult alloc] initWithValue:v3 matchType:0 numberOfMatchingParameters:0];

  return v4;
}

@end