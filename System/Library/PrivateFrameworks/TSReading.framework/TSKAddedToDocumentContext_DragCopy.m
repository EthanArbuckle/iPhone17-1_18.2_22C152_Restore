@interface TSKAddedToDocumentContext_DragCopy
- (BOOL)wasDragOperation;
- (id)description;
@end

@implementation TSKAddedToDocumentContext_DragCopy

- (id)description
{
  return @"Pasted/Drag-Copy";
}

- (BOOL)wasDragOperation
{
  return 1;
}

@end