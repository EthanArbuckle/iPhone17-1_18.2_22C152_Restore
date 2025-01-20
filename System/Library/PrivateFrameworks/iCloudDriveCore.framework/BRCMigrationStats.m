@interface BRCMigrationStats
+ (BOOL)supportsSecureCoding;
- (BRCMigrationStats)initWithCoder:(id)a3;
- (NSUUID)uuid;
- (double)cloningDuration;
- (double)duration;
- (double)importDuration;
- (int64_t)unexpectedCreations;
- (unint64_t)bouncedDocumentsFolders;
- (unint64_t)bouncedItems;
- (unint64_t)clonedAppLibraries;
- (unint64_t)clonedFiles;
- (unint64_t)clonedFolders;
- (unint64_t)clonedSideFaults;
- (unint64_t)cloningFailures;
- (unint64_t)datalessItems;
- (unint64_t)documentsFoldersWithoutItemID;
- (unint64_t)expectedMigrations;
- (unint64_t)ignoredContentProtectedItems;
- (unint64_t)itemsChangedDuringCloning;
- (unint64_t)itemsNotFoundInDB;
- (unint64_t)materialisedInCloudDocs;
- (unint64_t)materializedInFPFS;
- (unint64_t)migratedSideFaults;
- (unint64_t)nonMigratedItems;
- (unint64_t)packagesWithoutBundleBit;
- (unint64_t)reconciledItems;
- (unint64_t)reconciliationFailures;
- (unint64_t)sideFaultsCount;
- (unint64_t)symlinkedDocumentsFolders;
- (unint64_t)totalItemCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBouncedDocumentsFolders:(unint64_t)a3;
- (void)setBouncedItems:(unint64_t)a3;
- (void)setClonedAppLibraries:(unint64_t)a3;
- (void)setClonedFiles:(unint64_t)a3;
- (void)setClonedFolders:(unint64_t)a3;
- (void)setClonedSideFaults:(unint64_t)a3;
- (void)setCloningDuration:(double)a3;
- (void)setCloningFailures:(unint64_t)a3;
- (void)setDatalessItems:(unint64_t)a3;
- (void)setDocumentsFoldersWithoutItemID:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setExpectedMigrations:(unint64_t)a3;
- (void)setIgnoredContentProtectedItems:(unint64_t)a3;
- (void)setImportDuration:(double)a3;
- (void)setItemsChangedDuringCloning:(unint64_t)a3;
- (void)setItemsNotFoundInDB:(unint64_t)a3;
- (void)setMaterialisedInCloudDocs:(unint64_t)a3;
- (void)setMaterializedInFPFS:(unint64_t)a3;
- (void)setMigratedSideFaults:(unint64_t)a3;
- (void)setNonMigratedItems:(unint64_t)a3;
- (void)setPackagesWithoutBundleBit:(unint64_t)a3;
- (void)setReconciledItems:(unint64_t)a3;
- (void)setReconciliationFailures:(unint64_t)a3;
- (void)setSideFaultsCount:(unint64_t)a3;
- (void)setSymlinkedDocumentsFolders:(unint64_t)a3;
- (void)setTotalItemCount:(unint64_t)a3;
- (void)setUnexpectedCreations:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation BRCMigrationStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sideFaultsCount = self->sideFaultsCount;
  id v5 = a3;
  [v5 encodeInt64:sideFaultsCount forKey:@"sideFaultsCount"];
  [v5 encodeInt64:self->clonedFolders forKey:@"clonedFolders"];
  [v5 encodeInt64:self->clonedFiles forKey:@"clonedFiles"];
  [v5 encodeInt64:self->clonedSideFaults forKey:@"clonedSideFaults"];
  [v5 encodeInt64:self->clonedAppLibraries forKey:@"clonedAppLibraries"];
  [v5 encodeInt64:self->cloningFailures forKey:@"cloningFailures"];
  [v5 encodeInt64:self->reconciledItems forKey:@"reconciledItems"];
  [v5 encodeInt64:self->reconciliationFailures forKey:@"reconciliationFailures"];
  [v5 encodeInt64:self->migratedSideFaults forKey:@"migratedSideFaults"];
  [v5 encodeInt64:self->nonMigratedItems forKey:@"nonMigratedItems"];
  [v5 encodeInt64:self->expectedMigrations forKey:@"expectedMigrations"];
  [v5 encodeInt64:self->materialisedInCloudDocs forKey:@"materialisedInCloudDocs"];
  [v5 encodeInt64:self->materializedInFPFS forKey:@"materializedInFPFS"];
  [v5 encodeInt64:self->itemsNotFoundInDB forKey:@"itemsNotFoundInDB"];
  [v5 encodeInt64:self->itemsChangedDuringCloning forKey:@"itemsChangedDuringCloning"];
  [v5 encodeInt64:self->ignoredContentProtectedItems forKey:@"ignoredContentProtectedItems"];
  [v5 encodeInt64:self->packagesWithoutBundleBit forKey:@"packagesWithoutBundleBit"];
  [v5 encodeInt64:self->bouncedDocumentsFolders forKey:@"bouncedDocumentsFolders"];
  [v5 encodeInt64:self->symlinkedDocumentsFolders forKey:@"symlinkedDocumentsFolders"];
  [v5 encodeInt64:self->documentsFoldersWithoutItemID forKey:@"documentsFoldersWithoutItemID"];
  [v5 encodeInt64:self->datalessItems forKey:@"datalessItems"];
  [v5 encodeInt64:self->unexpectedCreations forKey:@"unexpectedCreations"];
  [v5 encodeInt64:self->bouncedItems forKey:@"bouncedItems"];
  [v5 encodeInt64:self->totalItemCount forKey:@"totalItemCount"];
  [v5 encodeDouble:@"duration" forKey:self->duration];
  [v5 encodeDouble:@"cloningDuration" forKey:self->cloningDuration];
  [v5 encodeDouble:@"importDuration" forKey:self->importDuration];
  [v5 encodeObject:self->uuid forKey:@"uuid"];
}

- (BRCMigrationStats)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCMigrationStats;
  id v5 = [(BRCMigrationStats *)&v12 init];
  if (v5)
  {
    v5->unint64_t sideFaultsCount = [v4 decodeInt64ForKey:@"sideFaultsCount"];
    v5->clonedFolders = [v4 decodeInt64ForKey:@"clonedFolders"];
    v5->clonedFiles = [v4 decodeInt64ForKey:@"clonedFiles"];
    v5->clonedSideFaults = [v4 decodeInt64ForKey:@"clonedSideFaults"];
    v5->clonedAppLibraries = [v4 decodeInt64ForKey:@"clonedAppLibraries"];
    v5->cloningFailures = [v4 decodeInt64ForKey:@"cloningFailures"];
    v5->reconciledItems = [v4 decodeInt64ForKey:@"reconciledItems"];
    v5->reconciliationFailures = [v4 decodeInt64ForKey:@"reconciliationFailures"];
    v5->migratedSideFaults = [v4 decodeInt64ForKey:@"migratedSideFaults"];
    v5->nonMigratedItems = [v4 decodeInt64ForKey:@"nonMigratedItems"];
    v5->expectedMigrations = [v4 decodeInt64ForKey:@"expectedMigrations"];
    v5->materialisedInCloudDocs = [v4 decodeInt64ForKey:@"materialisedInCloudDocs"];
    v5->materializedInFPFS = [v4 decodeInt64ForKey:@"materializedInFPFS"];
    v5->itemsNotFoundInDB = [v4 decodeInt64ForKey:@"itemsNotFoundInDB"];
    v5->itemsChangedDuringCloning = [v4 decodeInt64ForKey:@"itemsChangedDuringCloning"];
    v5->ignoredContentProtectedItems = [v4 decodeInt64ForKey:@"ignoredContentProtectedItems"];
    v5->packagesWithoutBundleBit = [v4 decodeInt64ForKey:@"packagesWithoutBundleBit"];
    v5->bouncedDocumentsFolders = [v4 decodeInt64ForKey:@"bouncedDocumentsFolders"];
    v5->symlinkedDocumentsFolders = [v4 decodeInt64ForKey:@"symlinkedDocumentsFolders"];
    v5->documentsFoldersWithoutItemID = [v4 decodeInt64ForKey:@"documentsFoldersWithoutItemID"];
    v5->datalessItems = [v4 decodeInt64ForKey:@"datalessItems"];
    v5->unexpectedCreations = [v4 decodeInt64ForKey:@"unexpectedCreations"];
    v5->bouncedItems = [v4 decodeInt64ForKey:@"bouncedItems"];
    v5->totalItemCount = [v4 decodeInt64ForKey:@"totalItemCount"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->duration = v6;
    [v4 decodeDoubleForKey:@"cloningDuration"];
    v5->cloningDuration = v7;
    [v4 decodeDoubleForKey:@"importDuration"];
    v5->importDuration = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->uuid;
    v5->uuid = (NSUUID *)v9;
  }
  return v5;
}

- (unint64_t)sideFaultsCount
{
  return self->sideFaultsCount;
}

- (void)setSideFaultsCount:(unint64_t)a3
{
  self->unint64_t sideFaultsCount = a3;
}

- (unint64_t)clonedFolders
{
  return self->clonedFolders;
}

- (void)setClonedFolders:(unint64_t)a3
{
  self->clonedFolders = a3;
}

- (unint64_t)clonedFiles
{
  return self->clonedFiles;
}

- (void)setClonedFiles:(unint64_t)a3
{
  self->clonedFiles = a3;
}

- (unint64_t)clonedSideFaults
{
  return self->clonedSideFaults;
}

- (void)setClonedSideFaults:(unint64_t)a3
{
  self->clonedSideFaults = a3;
}

- (unint64_t)clonedAppLibraries
{
  return self->clonedAppLibraries;
}

- (void)setClonedAppLibraries:(unint64_t)a3
{
  self->clonedAppLibraries = a3;
}

- (unint64_t)cloningFailures
{
  return self->cloningFailures;
}

- (void)setCloningFailures:(unint64_t)a3
{
  self->cloningFailures = a3;
}

- (unint64_t)reconciledItems
{
  return self->reconciledItems;
}

- (void)setReconciledItems:(unint64_t)a3
{
  self->reconciledItems = a3;
}

- (unint64_t)reconciliationFailures
{
  return self->reconciliationFailures;
}

- (void)setReconciliationFailures:(unint64_t)a3
{
  self->reconciliationFailures = a3;
}

- (unint64_t)migratedSideFaults
{
  return self->migratedSideFaults;
}

- (void)setMigratedSideFaults:(unint64_t)a3
{
  self->migratedSideFaults = a3;
}

- (unint64_t)nonMigratedItems
{
  return self->nonMigratedItems;
}

- (void)setNonMigratedItems:(unint64_t)a3
{
  self->nonMigratedItems = a3;
}

- (unint64_t)expectedMigrations
{
  return self->expectedMigrations;
}

- (void)setExpectedMigrations:(unint64_t)a3
{
  self->expectedMigrations = a3;
}

- (unint64_t)materialisedInCloudDocs
{
  return self->materialisedInCloudDocs;
}

- (void)setMaterialisedInCloudDocs:(unint64_t)a3
{
  self->materialisedInCloudDocs = a3;
}

- (unint64_t)materializedInFPFS
{
  return self->materializedInFPFS;
}

- (void)setMaterializedInFPFS:(unint64_t)a3
{
  self->materializedInFPFS = a3;
}

- (unint64_t)itemsNotFoundInDB
{
  return self->itemsNotFoundInDB;
}

- (void)setItemsNotFoundInDB:(unint64_t)a3
{
  self->itemsNotFoundInDB = a3;
}

- (unint64_t)itemsChangedDuringCloning
{
  return self->itemsChangedDuringCloning;
}

- (void)setItemsChangedDuringCloning:(unint64_t)a3
{
  self->itemsChangedDuringCloning = a3;
}

- (unint64_t)ignoredContentProtectedItems
{
  return self->ignoredContentProtectedItems;
}

- (void)setIgnoredContentProtectedItems:(unint64_t)a3
{
  self->ignoredContentProtectedItems = a3;
}

- (unint64_t)packagesWithoutBundleBit
{
  return self->packagesWithoutBundleBit;
}

- (void)setPackagesWithoutBundleBit:(unint64_t)a3
{
  self->packagesWithoutBundleBit = a3;
}

- (unint64_t)bouncedDocumentsFolders
{
  return self->bouncedDocumentsFolders;
}

- (void)setBouncedDocumentsFolders:(unint64_t)a3
{
  self->bouncedDocumentsFolders = a3;
}

- (unint64_t)symlinkedDocumentsFolders
{
  return self->symlinkedDocumentsFolders;
}

- (void)setSymlinkedDocumentsFolders:(unint64_t)a3
{
  self->symlinkedDocumentsFolders = a3;
}

- (unint64_t)documentsFoldersWithoutItemID
{
  return self->documentsFoldersWithoutItemID;
}

- (void)setDocumentsFoldersWithoutItemID:(unint64_t)a3
{
  self->documentsFoldersWithoutItemID = a3;
}

- (unint64_t)datalessItems
{
  return self->datalessItems;
}

- (void)setDatalessItems:(unint64_t)a3
{
  self->datalessItems = a3;
}

- (int64_t)unexpectedCreations
{
  return self->unexpectedCreations;
}

- (void)setUnexpectedCreations:(int64_t)a3
{
  self->unexpectedCreations = a3;
}

- (unint64_t)bouncedItems
{
  return self->bouncedItems;
}

- (void)setBouncedItems:(unint64_t)a3
{
  self->bouncedItems = a3;
}

- (unint64_t)totalItemCount
{
  return self->totalItemCount;
}

- (void)setTotalItemCount:(unint64_t)a3
{
  self->totalItemCount = a3;
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (double)cloningDuration
{
  return self->cloningDuration;
}

- (void)setCloningDuration:(double)a3
{
  self->cloningDuration = a3;
}

- (double)importDuration
{
  return self->importDuration;
}

- (void)setImportDuration:(double)a3
{
  self->importDuration = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 224, 1);
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end