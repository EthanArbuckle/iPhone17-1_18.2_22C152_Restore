@interface ML3MigrationDirectives
- (BOOL)forceUpdateOriginals;
- (BOOL)needsAnalyze;
- (BOOL)needsToAutogenerateArtworkVariants;
- (BOOL)needsToMarkArtworkPurgeable;
- (BOOL)needsToRecreateIndexes;
- (BOOL)needsToRecreateTriggers;
- (BOOL)needsToReloadCollectionRepresentativeItems;
- (BOOL)needsToReloadContainerMediaTypes;
- (BOOL)needsToReloadStoreBookmarkMetadataIdentifiers;
- (BOOL)needsToRemoveLocationsForItemsMissingAssets;
- (BOOL)needsToUpdateSortMap;
- (ML3MigrationDirectives)initWithOriginalUserVersion:(int)a3;
- (int)currentUserVersion;
- (int)originalUserVersion;
- (void)setCurrentUserVersion:(int)a3;
- (void)setForceUpdateOriginals:(BOOL)a3;
- (void)setNeedsAnalyze:(BOOL)a3;
- (void)setNeedsToAutogenerateArtworkVariants:(BOOL)a3;
- (void)setNeedsToMarkArtworkPurgeable:(BOOL)a3;
- (void)setNeedsToRecreateIndexes:(BOOL)a3;
- (void)setNeedsToRecreateTriggers:(BOOL)a3;
- (void)setNeedsToReloadCollectionRepresentativeItems:(BOOL)a3;
- (void)setNeedsToReloadContainerMediaTypes:(BOOL)a3;
- (void)setNeedsToReloadStoreBookmarkMetadataIdentifiers:(BOOL)a3;
- (void)setNeedsToRemoveLocationsForItemsMissingAssets:(BOOL)a3;
- (void)setNeedsToUpdateSortMap:(BOOL)a3;
@end

@implementation ML3MigrationDirectives

- (void)setNeedsToMarkArtworkPurgeable:(BOOL)a3
{
  self->_needsToMarkArtworkPurgeable = a3;
}

- (BOOL)needsToMarkArtworkPurgeable
{
  return self->_needsToMarkArtworkPurgeable;
}

- (void)setForceUpdateOriginals:(BOOL)a3
{
  self->_forceUpdateOriginals = a3;
}

- (BOOL)forceUpdateOriginals
{
  return self->_forceUpdateOriginals;
}

- (void)setNeedsToUpdateSortMap:(BOOL)a3
{
  self->_needsToUpdateSortMap = a3;
}

- (BOOL)needsToUpdateSortMap
{
  return self->_needsToUpdateSortMap;
}

- (void)setNeedsToAutogenerateArtworkVariants:(BOOL)a3
{
  self->_needsToAutogenerateArtworkVariants = a3;
}

- (BOOL)needsToAutogenerateArtworkVariants
{
  return self->_needsToAutogenerateArtworkVariants;
}

- (void)setNeedsAnalyze:(BOOL)a3
{
  self->_needsAnalyze = a3;
}

- (BOOL)needsAnalyze
{
  return self->_needsAnalyze;
}

- (void)setNeedsToReloadCollectionRepresentativeItems:(BOOL)a3
{
  self->_needsToReloadCollectionRepresentativeItems = a3;
}

- (BOOL)needsToReloadCollectionRepresentativeItems
{
  return self->_needsToReloadCollectionRepresentativeItems;
}

- (void)setNeedsToReloadContainerMediaTypes:(BOOL)a3
{
  self->_needsToReloadContainerMediaTypes = a3;
}

- (BOOL)needsToReloadContainerMediaTypes
{
  return self->_needsToReloadContainerMediaTypes;
}

- (void)setNeedsToReloadStoreBookmarkMetadataIdentifiers:(BOOL)a3
{
  self->_needsToReloadStoreBookmarkMetadataIdentifiers = a3;
}

- (BOOL)needsToReloadStoreBookmarkMetadataIdentifiers
{
  return self->_needsToReloadStoreBookmarkMetadataIdentifiers;
}

- (void)setNeedsToRemoveLocationsForItemsMissingAssets:(BOOL)a3
{
  self->_needsToRemoveLocationsForItemsMissingAssets = a3;
}

- (BOOL)needsToRemoveLocationsForItemsMissingAssets
{
  return self->_needsToRemoveLocationsForItemsMissingAssets;
}

- (void)setNeedsToRecreateTriggers:(BOOL)a3
{
  self->_needsToRecreateTriggers = a3;
}

- (BOOL)needsToRecreateTriggers
{
  return self->_needsToRecreateTriggers;
}

- (void)setNeedsToRecreateIndexes:(BOOL)a3
{
  self->_needsToRecreateIndexes = a3;
}

- (BOOL)needsToRecreateIndexes
{
  return self->_needsToRecreateIndexes;
}

- (void)setCurrentUserVersion:(int)a3
{
  self->_currentUserVersion = a3;
}

- (int)currentUserVersion
{
  return self->_currentUserVersion;
}

- (int)originalUserVersion
{
  return self->_originalUserVersion;
}

- (ML3MigrationDirectives)initWithOriginalUserVersion:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ML3MigrationDirectives;
  result = [(ML3MigrationDirectives *)&v5 init];
  if (result)
  {
    result->_originalUserVersion = a3;
    result->_currentUserVersion = a3;
  }
  return result;
}

@end