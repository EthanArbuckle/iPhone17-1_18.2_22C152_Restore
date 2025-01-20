@interface TSKRemovedFromDocumentContext_Moving
- (BOOL)wasMoved;
- (id)description;
- (id)undoContext;
@end

@implementation TSKRemovedFromDocumentContext_Moving

- (id)description
{
  return @"Moving";
}

- (BOOL)wasMoved
{
  return 1;
}

- (id)undoContext
{
  return +[TSKAddedToDocumentContext movingContext];
}

@end