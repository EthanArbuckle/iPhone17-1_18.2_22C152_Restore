@interface TSKAddedToDocumentContext_SubstorageForChangeTrackingCopy
- (BOOL)changeTrackingSubstorage;
- (id)description;
@end

@implementation TSKAddedToDocumentContext_SubstorageForChangeTrackingCopy

- (id)description
{
  return @"Substorage for change-tracking copy";
}

- (BOOL)changeTrackingSubstorage
{
  return 1;
}

@end