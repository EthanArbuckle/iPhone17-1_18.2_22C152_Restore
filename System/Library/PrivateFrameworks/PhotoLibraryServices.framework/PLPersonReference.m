@interface PLPersonReference
+ (id)entityName;
+ (id)insertIntoPhotoLibrary:(id)a3 personUUID:(id)a4 personData:(id)a5;
@end

@implementation PLPersonReference

+ (id)entityName
{
  return @"PersonReference";
}

+ (id)insertIntoPhotoLibrary:(id)a3 personUUID:(id)a4 personData:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLPersonReference.m", 28, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  v12 = [v9 managedObjectContext];
  v13 = [a1 entityName];
  v14 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v13, (uint64_t)v12, 0);

  [v14 setPersonUUID:v10];
  [v14 setPersonData:v11];
  v15 = [v9 managedObjectContext];
  v16 = +[PLPerson personWithUUID:v10 inManagedObjectContext:v15];

  if (v16)
  {
    [v14 setPerson:v16];
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    v17 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unable to find a person with UUID %@", buf, 0xCu);
    }
  }
  return v14;
}

@end