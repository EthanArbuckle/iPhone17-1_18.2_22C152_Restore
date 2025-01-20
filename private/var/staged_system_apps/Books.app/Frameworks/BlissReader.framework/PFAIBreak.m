@interface PFAIBreak
- (BOOL)canAddColumnBreak;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)dealloc;
@end

@implementation PFAIBreak

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIBreak;
  [(PFAIBreak *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  self->mContentState = (PFAIContentState *)a3;
  if ([a3 setFlowAsCurrent])
  {
    v7.receiver = self;
    v7.super_class = (Class)PFAIBreak;
    [(PFXBreak *)&v7 mapStartElementWithState:a3];
  }
  if ([a3 setPaginatedAsCurrent])
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAIBreak;
    [(PFXBreak *)&v6 mapStartElementWithState:a3];
  }
  return 0;
}

- (BOOL)canAddColumnBreak
{
  return [(PFAIContentState *)self->mContentState paginatedIsCurrent];
}

@end