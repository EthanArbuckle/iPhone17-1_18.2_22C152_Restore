@interface PFAIMath
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFAIMath

- (BOOL)mapStartElementWithState:(id)a3
{
  if ([a3 setFlowAsCurrent])
  {
    v7.receiver = self;
    v7.super_class = (Class)PFAIMath;
    [(PFXMath *)&v7 mapStartElementWithState:a3];
  }
  if ([a3 setPaginatedAsCurrent])
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAIMath;
    [(PFXMath *)&v6 mapStartElementWithState:a3];
  }
  return 0;
}

@end