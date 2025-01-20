@interface TSKAddedToDocumentContext_Moving
- (BOOL)wasMoved;
- (id)description;
- (id)undoContext;
@end

@implementation TSKAddedToDocumentContext_Moving

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
  return +[TSKRemovedFromDocumentContext movingContext];
}

@end