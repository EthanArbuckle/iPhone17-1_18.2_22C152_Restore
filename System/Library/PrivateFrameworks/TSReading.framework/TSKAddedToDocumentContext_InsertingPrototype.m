@interface TSKAddedToDocumentContext_InsertingPrototype
- (BOOL)autoUpdateSmartFields;
- (BOOL)syncChanges;
- (BOOL)uniqueBookmarks;
- (BOOL)wasPasted;
- (id)description;
@end

@implementation TSKAddedToDocumentContext_InsertingPrototype

- (id)description
{
  return @"Prototype";
}

- (BOOL)wasPasted
{
  return 0;
}

- (BOOL)autoUpdateSmartFields
{
  return 1;
}

- (BOOL)uniqueBookmarks
{
  return 1;
}

- (BOOL)syncChanges
{
  return 1;
}

@end