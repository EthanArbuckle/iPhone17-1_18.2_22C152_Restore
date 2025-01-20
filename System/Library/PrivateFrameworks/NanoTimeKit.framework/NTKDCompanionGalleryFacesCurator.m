@interface NTKDCompanionGalleryFacesCurator
+ (NSDictionary)complications;
+ (id)sharedInstance;
- (NTKDCompanionGalleryFacesCurator)init;
- (id)_collectionIdentifier;
- (id)_getVersionAppropriateFacesForStore:(id)a3;
- (id)_legacyDefaultFacesForStore:(id)a3;
- (void)_addFacesToStore:(id)a3;
- (void)_removeAllFacesFromStore:(id)a3;
- (void)curateCollectionStore:(id)a3 completion:(id)a4;
@end

@implementation NTKDCompanionGalleryFacesCurator

+ (id)sharedInstance
{
  if (qword_1000722B0 != -1) {
    dispatch_once(&qword_1000722B0, &stru_100060A40);
  }
  id v2 = (id)qword_1000722A8;
  objc_sync_enter(v2);
  v3 = (void *)qword_1000722A8;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v6 = objc_alloc_init((Class)objc_opt_class());
    v7 = (void *)qword_1000722A8;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 setObject:v6 forKeyedSubscript:v9];
  }
  objc_sync_exit(v2);

  return v6;
}

- (NTKDCompanionGalleryFacesCurator)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKDCompanionGalleryFacesCurator;
  id v2 = [(NTKDCompanionGalleryFacesCurator *)&v6 init];
  if (v2)
  {
    v3 = +[NTKDCollectionCoordinator sharedInstance];
    v4 = [(NTKDCompanionGalleryFacesCurator *)v2 _collectionIdentifier];
    [v3 registerCurator:v2 forCollectionIdentifier:v4];
  }
  return v2;
}

+ (NSDictionary)complications
{
  return 0;
}

- (void)curateCollectionStore:(id)a3 completion:(id)a4
{
  id v7 = a3;
  objc_super v6 = (void (**)(void))a4;
  if (![v7 isInitialSetupComplete]
    || ([v7 isEmpty] & 1) != 0
    || [v7 isBuildVersionOutdated])
  {
    [(NTKDCompanionGalleryFacesCurator *)self _removeAllFacesFromStore:v7];
    [(NTKDCompanionGalleryFacesCurator *)self _addFacesToStore:v7];
    [v7 persistCurrentBuildVersion];
    [v7 markInitialSetupComplete];
  }
  v6[2](v6);
}

- (id)_legacyDefaultFacesForStore:(id)a3
{
  return 0;
}

- (void)_removeAllFacesFromStore:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(v3, "orderedUUIDs", 0);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeFaceForUUID:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_addFacesToStore:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKDCompanionGalleryFacesCurator *)self _getVersionAppropriateFacesForStore:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v9);
        long long v11 = +[NSUUID UUID];
        [v4 addFace:v10 forUUID:v11];

        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)_getVersionAppropriateFacesForStore:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceUUID];
  id v6 = +[CLKDevice deviceForNRDeviceUUID:v5];

  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  unsigned int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    uint64_t v9 = [(NTKDCompanionGalleryFacesCurator *)self _hunterDefaultFacesForStore:v4];
  }
  else
  {
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
    unsigned int v11 = [v6 supportsCapability:v10];

    if (v11)
    {
      uint64_t v9 = [(NTKDCompanionGalleryFacesCurator *)self _graceFDefaultFacesForStore:v4];
    }
    else
    {
      id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
      unsigned int v13 = [v6 supportsCapability:v12];

      if (v13)
      {
        uint64_t v9 = [(NTKDCompanionGalleryFacesCurator *)self _graceEDefaultFacesForStore:v4];
      }
      else if ([v6 nrDeviceVersion] <= 0x5FFFF)
      {
        if ([v6 nrDeviceVersion] <= 0x50200)
        {
          if ([v6 nrDeviceVersion] <= 0x501FF)
          {
            if ([v6 nrDeviceVersion] <= 0x500FF)
            {
              if ([v6 nrDeviceVersion] <= 0x4FFFF) {
                [(NTKDCompanionGalleryFacesCurator *)self _legacyDefaultFacesForStore:v4];
              }
              else {
              uint64_t v9 = [(NTKDCompanionGalleryFacesCurator *)self _gloryDefaultFacesForStore:v4];
              }
            }
            else
            {
              uint64_t v9 = [(NTKDCompanionGalleryFacesCurator *)self _gloryBDefaultFacesForStore:v4];
            }
          }
          else
          {
            uint64_t v9 = [(NTKDCompanionGalleryFacesCurator *)self _gloryEDefaultFacesForStore:v4];
          }
        }
        else
        {
          uint64_t v9 = [(NTKDCompanionGalleryFacesCurator *)self _gloryFDefaultFacesForStore:v4];
        }
      }
      else
      {
        uint64_t v9 = [(NTKDCompanionGalleryFacesCurator *)self _graceDefaultFacesForStore:v4];
      }
    }
  }
  long long v14 = (void *)v9;

  return v14;
}

- (id)_collectionIdentifier
{
  return 0;
}

@end