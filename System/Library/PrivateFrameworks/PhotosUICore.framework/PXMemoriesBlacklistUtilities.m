@interface PXMemoriesBlacklistUtilities
+ (id)accessoryUIViewSpecForBlacklistedFeature:(id)a3;
+ (id)personWithLocalIdentifier:(id)a3;
@end

@implementation PXMemoriesBlacklistUtilities

+ (id)accessoryUIViewSpecForBlacklistedFeature:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 1)
  {
    v5 = [v4 personLocalIdentifier];
    v6 = [a1 personWithLocalIdentifier:v5];

    v7 = +[PXMemoriesBlacklistPersonAccessoryViewSpec specWithPerson:v6];
  }
  else if ([v4 type] == 4096)
  {
    v8 = [v4 location];
    v7 = +[PXMemoriesBlacklistPlaceLocationAccessoryViewSpec specWithLocation:v8 regionRadius:-1.0];
  }
  else if ([v4 type] == 0x20000)
  {
    v7 = +[PXMemoriesBlacklistPlaceAreaAccesoryViewSpec spec];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)personWithLocalIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F391D0], "uuidFromLocalIdentifier:");
    id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v5 = [v4 librarySpecificFetchOptions];

    [v5 setFetchLimit:1];
    v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUUID = %@", v3];
    [v5 setInternalPredicate:v6];
    [v5 setMinimumUnverifiedFaceCount:1];
    v11[0] = *MEMORY[0x1E4F397E0];
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v5 setFetchPropertySets:v7];

    v8 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v5];
    v9 = [v8 firstObject];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end