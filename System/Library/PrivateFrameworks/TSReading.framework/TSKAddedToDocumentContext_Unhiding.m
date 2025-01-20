@interface TSKAddedToDocumentContext_Unhiding
- (BOOL)wasUnhidden;
- (id)description;
- (id)undoContext;
@end

@implementation TSKAddedToDocumentContext_Unhiding

- (id)description
{
  return @"Unhiding";
}

- (BOOL)wasUnhidden
{
  return 1;
}

- (id)undoContext
{
  return +[TSKRemovedFromDocumentContext hidingContext];
}

@end