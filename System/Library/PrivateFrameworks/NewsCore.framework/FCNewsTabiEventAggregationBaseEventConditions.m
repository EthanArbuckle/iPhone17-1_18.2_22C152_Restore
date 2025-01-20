@interface FCNewsTabiEventAggregationBaseEventConditions
- (FCNewsTabiEventAggregationBaseEventConditions)init;
- (FCNewsTabiEventAggregationBaseEventConditions)initWithDictionary:(id)a3;
- (FCNewsTabiEventAggregationBaseEventConditions)initWithProbability:(double)a3;
- (double)probability;
- (id)description;
@end

@implementation FCNewsTabiEventAggregationBaseEventConditions

- (FCNewsTabiEventAggregationBaseEventConditions)initWithProbability:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCNewsTabiEventAggregationBaseEventConditions;
  result = [(FCNewsTabiEventAggregationBaseEventConditions *)&v5 init];
  if (result) {
    result->_probability = a3;
  }
  return result;
}

- (FCNewsTabiEventAggregationBaseEventConditions)initWithDictionary:(id)a3
{
  double v4 = FCAppConfigurationDoubleValue(a3, @"probability", 0.0);
  return [(FCNewsTabiEventAggregationBaseEventConditions *)self initWithProbability:v4];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  [(FCNewsTabiEventAggregationBaseEventConditions *)self probability];
  objc_msgSend(v3, "appendFormat:", @"\n\tprobability: %f;", v4);
  [v3 appendString:@"\n>"];
  return v3;
}

- (double)probability
{
  return self->_probability;
}

- (FCNewsTabiEventAggregationBaseEventConditions)init
{
  return [(FCNewsTabiEventAggregationBaseEventConditions *)self initWithDictionary:0];
}

@end