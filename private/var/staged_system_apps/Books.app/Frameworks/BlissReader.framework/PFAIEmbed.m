@interface PFAIEmbed
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
- (void)propagateFirstChildResultFromState:(id)a3;
@end

@implementation PFAIEmbed

- (void)propagateFirstChildResultFromState:(id)a3
{
  id v4 = [a3 childResultCount];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [a3 childResultAtIndex:v6];
      if (v7) {
        break;
      }
      if (v5 == (id)++v6) {
        return;
      }
    }
    [a3 setResult:v7];
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = [a3 currentStackEntry];
  -[PFAIEmbed propagateFirstChildResultFromState:](self, "propagateFirstChildResultFromState:", [v4 paginatedState]);
  id v5 = [v4 flowState];

  [(PFAIEmbed *)self propagateFirstChildResultFromState:v5];
}

@end