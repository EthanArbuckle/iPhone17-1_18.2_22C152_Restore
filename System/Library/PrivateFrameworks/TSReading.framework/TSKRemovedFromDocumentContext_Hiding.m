@interface TSKRemovedFromDocumentContext_Hiding
- (BOOL)wasHidden;
- (id)description;
- (id)undoContext;
@end

@implementation TSKRemovedFromDocumentContext_Hiding

- (id)description
{
  return @"Hidding";
}

- (BOOL)wasHidden
{
  return 1;
}

- (id)undoContext
{
  return +[TSKAddedToDocumentContext unhidingContext];
}

@end