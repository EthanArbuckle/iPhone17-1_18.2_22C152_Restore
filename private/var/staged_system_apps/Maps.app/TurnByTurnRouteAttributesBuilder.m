@interface TurnByTurnRouteAttributesBuilder
- (BOOL)useMetricSystem;
- (TurnByTurnRouteAttributesBuilder)initWithUseMetricSystem:(BOOL)a3;
- (void)fillRouteAttributes:(id)a3;
@end

@implementation TurnByTurnRouteAttributesBuilder

- (TurnByTurnRouteAttributesBuilder)initWithUseMetricSystem:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TurnByTurnRouteAttributesBuilder;
  result = [(TurnByTurnRouteAttributesBuilder *)&v5 init];
  if (result) {
    result->_useMetricSystem = a3;
  }
  return result;
}

- (void)fillRouteAttributes:(id)a3
{
  id v4 = a3;
  [v4 setIncludeContingencyRoutes:1];
  [v4 setIncludePhonetics:1];
  [v4 setUseMetricThreshold:[self useMetricSystem]];
}

- (BOOL)useMetricSystem
{
  return self->_useMetricSystem;
}

@end