@interface _SVXAddViewsExpressionParserProvider
- (id)getWithParsingService:(id)a3 preferences:(id)a4;
@end

@implementation _SVXAddViewsExpressionParserProvider

- (id)getWithParsingService:(id)a3 preferences:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_SVXAddViewsExpressionParser alloc] initWithParsingService:v6 preferences:v5];

  return v7;
}

@end