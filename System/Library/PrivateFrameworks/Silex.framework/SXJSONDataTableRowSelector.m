@interface SXJSONDataTableRowSelector
- (unint64_t)weightForSelectorKey:(id)a3;
@end

@implementation SXJSONDataTableRowSelector

- (unint64_t)weightForSelectorKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"odd"] & 1) != 0
    || ([v4 isEqualToString:@"even"] & 1) != 0)
  {
    unint64_t v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SXJSONDataTableRowSelector;
    unint64_t v5 = [(SXJSONDataTableSelector *)&v7 weightForSelectorKey:v4];
  }

  return v5;
}

@end