@interface TSKAddedToDocumentContext_UndoDelete
- (BOOL)wasUndoDelete;
- (id)description;
@end

@implementation TSKAddedToDocumentContext_UndoDelete

- (id)description
{
  return @"Undo delete";
}

- (BOOL)wasUndoDelete
{
  return 1;
}

@end