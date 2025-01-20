@interface FCNewsTabiEventAggregationDurationEventConditions
- (FCNewsTabiEventAggregationDurationEventConditions)init;
- (FCNewsTabiEventAggregationDurationEventConditions)initWithDictionary:(id)a3;
- (double)duration;
- (id)description;
@end

@implementation FCNewsTabiEventAggregationDurationEventConditions

- (FCNewsTabiEventAggregationDurationEventConditions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCNewsTabiEventAggregationDurationEventConditions;
  v5 = [(FCNewsTabiEventAggregationBaseEventConditions *)&v7 initWithDictionary:v4];
  if (v5) {
    v5->_duration = FCAppConfigurationDoubleValue(v4, @"duration", 0.0);
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  [(FCNewsTabiEventAggregationBaseEventConditions *)self probability];
  objc_msgSend(v3, "appendFormat:", @"\n\tprobability: %f;", v4);
  [(FCNewsTabiEventAggregationDurationEventConditions *)self duration];
  objc_msgSend(v3, "appendFormat:", @"\n\tduration: %f;", v5);
  [v3 appendString:@"\n>"];
  return v3;
}

- (double)duration
{
  return self->_duration;
}

- (FCNewsTabiEventAggregationDurationEventConditions)init
{
  return [(FCNewsTabiEventAggregationDurationEventConditions *)self initWithDictionary:0];
}

@end