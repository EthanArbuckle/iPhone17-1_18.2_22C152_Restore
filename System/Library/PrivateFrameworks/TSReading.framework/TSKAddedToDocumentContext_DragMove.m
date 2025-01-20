@interface TSKAddedToDocumentContext_DragMove
- (BOOL)wasDragMoved;
- (id)description;
@end

@implementation TSKAddedToDocumentContext_DragMove

- (id)description
{
  return @"Pasted/Drag-Move";
}

- (BOOL)wasDragMoved
{
  return 1;
}

@end