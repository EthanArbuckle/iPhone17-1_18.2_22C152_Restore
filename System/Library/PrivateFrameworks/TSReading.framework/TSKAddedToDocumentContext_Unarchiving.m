@interface TSKAddedToDocumentContext_Unarchiving
- (BOOL)autoUpdateSmartFields;
- (BOOL)wasUnarchived;
- (id)description;
@end

@implementation TSKAddedToDocumentContext_Unarchiving

- (id)description
{
  return @"Unarchived";
}

- (BOOL)wasUnarchived
{
  return 1;
}

- (BOOL)autoUpdateSmartFields
{
  return 0;
}

@end