@interface PLLibrarySyncContext
- (BOOL)personUUIDIsDeleted:(id)a3;
- (BOOL)serverSupportsGraphHome;
- (BOOL)serverSupportsVision;
- (PLCloudRecordOrganizer)recordOrganizer;
- (PLLibrarySyncContext)initWithPhotoLibrary:(id)a3;
- (PLPhotoLibrary)photoLibrary;
- (id)assetAdjustmentStateForCloudIdentifier:(id)a3;
- (id)makeFace;
- (id)personForUUID:(id)a3;
- (void)deleteFaces:(id)a3;
- (void)setAssetAdjustmentState:(id)a3 forCloudIdentifier:(id)a4;
@end

@implementation PLLibrarySyncContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordOrganizer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetAdjustmentStatesByCloudIdentifier, 0);
}

- (PLCloudRecordOrganizer)recordOrganizer
{
  return (PLCloudRecordOrganizer *)objc_getProperty(self, a2, 24, 1);
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssetAdjustmentState:(id)a3 forCloudIdentifier:(id)a4
{
  assetAdjustmentStatesByCloudIdentifier = self->_assetAdjustmentStatesByCloudIdentifier;
  if (a3) {
    [(NSMutableDictionary *)assetAdjustmentStatesByCloudIdentifier setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)assetAdjustmentStatesByCloudIdentifier removeObjectForKey:a4];
  }
}

- (id)assetAdjustmentStateForCloudIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_assetAdjustmentStatesByCloudIdentifier objectForKey:a3];
}

- (BOOL)personUUIDIsDeleted:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = (objc_class *)MEMORY[0x1E4F59968];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(PLLibrarySyncContext *)self photoLibrary];
  v8 = [v7 mainScopeIdentifier];
  v9 = (void *)[v6 initWithScopeIdentifier:v8 identifier:v5];

  v10 = [(PLCloudRecordOrganizer *)self->_recordOrganizer deletePersonRecords];
  LOBYTE(v5) = +[PLCloudRecordOrganizer records:v10 containsScopedIdentifier:v9];

  return (char)v5;
}

- (id)personForUUID:(id)a3
{
  photoLibrary = self->_photoLibrary;
  id v4 = a3;
  id v5 = [(PLPhotoLibrary *)photoLibrary managedObjectContext];
  id v6 = +[PLPerson personWithUUID:v4 inManagedObjectContext:v5];

  return v6;
}

- (void)deleteFaces:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLPhotoLibrary *)self->_photoLibrary managedObjectContext];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v5, "deleteObject:", v11, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)makeFace
{
  v2 = [(PLPhotoLibrary *)self->_photoLibrary managedObjectContext];
  v3 = +[PLManagedObject insertInManagedObjectContext:v2];

  return v3;
}

- (BOOL)serverSupportsGraphHome
{
  return [MEMORY[0x1E4F598F0] serverSupportsGraphPeopleHome];
}

- (BOOL)serverSupportsVision
{
  return [MEMORY[0x1E4F59840] serverSupportsVision];
}

- (PLLibrarySyncContext)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLLibrarySyncContext;
  id v6 = [(PLLibrarySyncContext *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = [[PLCloudRecordOrganizer alloc] initWithPhotoLibrary:v5];
    recordOrganizer = v7->_recordOrganizer;
    v7->_recordOrganizer = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assetAdjustmentStatesByCloudIdentifier = v7->_assetAdjustmentStatesByCloudIdentifier;
    v7->_assetAdjustmentStatesByCloudIdentifier = v10;

    long long v12 = v7;
  }

  return v7;
}

@end