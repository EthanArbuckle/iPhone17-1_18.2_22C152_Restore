@interface PLManagedObject
+ (NSExpressionDescription)objectIDDescription;
+ (id)attributeValidationRules;
+ (id)entityInManagedObjectContext:(id)a3;
+ (id)entityName;
+ (id)insertInManagedObjectContext:(id)a3;
- (BOOL)isRegisteredWithUserInterfaceContext;
- (BOOL)isSyncableChange;
- (BOOL)isValidForJournalPersistence;
- (BOOL)supportsCloudUpload;
- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3;
- (NSString)shortObjectIDURI;
- (PLPhotoLibrary)photoLibrary;
- (PLPhotoLibraryPathManager)pathManager;
- (float)pl_floatValueForKey:(id)a3;
- (id)duplicateSortPropertyNames;
- (id)duplicateSortPropertyNamesSkip;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (id)payloadIDsByPayloadClassIDToDeleteOnInsert;
- (id)payloadsForChangedKeys:(id)a3;
- (id)pl_committedValueForKey:(id)a3;
- (int)pl_int32ValueForKey:(id)a3;
- (int64_t)pl_int64ValueForKey:(id)a3;
- (signed)pl_int16ValueForKey:(id)a3;
- (void)didSave;
- (void)pl_safeSetValue:(id)a3 forKey:(id)a4 valueDidChangeHandler:(id)a5;
- (void)prepareForDeletion;
- (void)willSave;
@end

@implementation PLManagedObject

+ (NSExpressionDescription)objectIDDescription
{
  if (objectIDDescription_onceToken != -1) {
    dispatch_once(&objectIDDescription_onceToken, &__block_literal_global_39961);
  }
  v2 = (void *)objectIDDescription_sObjectIDDescription;
  return (NSExpressionDescription *)v2;
}

uint64_t __38__PLManagedObject_objectIDDescription__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  v1 = (void *)objectIDDescription_sObjectIDDescription;
  objectIDDescription_sObjectIDDescription = (uint64_t)v0;

  [(id)objectIDDescription_sObjectIDDescription setName:@"objectID"];
  v2 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [(id)objectIDDescription_sObjectIDDescription setExpression:v2];

  v3 = (void *)objectIDDescription_sObjectIDDescription;
  return [v3 setExpressionResultType:2000];
}

- (int64_t)pl_int64ValueForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(PLManagedObject *)self valueForKey:v4];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  int64_t v8 = [v7 longLongValue];
  return v8;
}

- (int)pl_int32ValueForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(PLManagedObject *)self valueForKey:v4];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  int v8 = [v7 intValue];
  return v8;
}

- (signed)pl_int16ValueForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(PLManagedObject *)self valueForKey:v4];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  signed __int16 v8 = [v7 shortValue];
  return v8;
}

- (float)pl_floatValueForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(PLManagedObject *)self valueForKey:v4];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  [v7 floatValue];
  float v9 = v8;

  return v9;
}

- (id)pl_committedValueForKey:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLManagedObject.m", 151, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v7 = [(PLManagedObject *)self committedValuesForKeys:v6];

  float v8 = [v7 objectForKeyedSubscript:v5];
  float v9 = PLNullToNil();

  return v9;
}

- (void)pl_safeSetValue:(id)a3 forKey:(id)a4 valueDidChangeHandler:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!v9)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLManagedObject.m", 133, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  [(PLManagedObject *)self willAccessValueForKey:v9];
  v11 = [(PLManagedObject *)self primitiveValueForKey:v9];
  [(PLManagedObject *)self didAccessValueForKey:v9];
  if ((PLObjectIsEqual() & 1) == 0)
  {
    [(PLManagedObject *)self willChangeValueForKey:v9];
    [(PLManagedObject *)self setPrimitiveValue:v13 forKey:v9];
    [(PLManagedObject *)self didChangeValueForKey:v9];
    if (v10) {
      v10[2](v10, v11);
    }
  }
}

- (void)didSave
{
  self->_willSaveCallCount = 0;
  v2.receiver = self;
  v2.super_class = (Class)PLManagedObject;
  [(PLManagedObject *)&v2 didSave];
}

- (void)willSave
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = ++self->_willSaveCallCount;
  if (v3 == 999)
  {
    if ([(PLManagedObject *)self hasChanges])
    {
      id v4 = [(PLManagedObject *)self changedValues];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        v6 = PLBackendGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v7 = [(PLManagedObject *)self objectID];
          float v8 = [v7 entity];
          id v9 = [v8 name];
          v10 = [(PLManagedObject *)self changedValues];
          v11 = [v10 allKeys];
          v12 = [v11 componentsJoinedByString:@","];
          *(_DWORD *)buf = 138543618;
          v17 = v9;
          __int16 v18 = 2114;
          v19 = v12;
          _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "will exceed willSave limit on: %{public}@, changedKeys: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  id v13 = [(PLManagedObject *)self managedObjectContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v15.receiver = self;
  v15.super_class = (Class)PLManagedObject;
  [(PLManagedObject *)&v15 willSave];
  if (isKindOfClass)
  {
    [v13 recordManagedObjectWillSave:self];
    if ([(PLManagedObject *)self isSyncableChange]) {
      [v13 recordSyncChangeMarker];
    }
  }
}

- (void)prepareForDeletion
{
  v3.receiver = self;
  v3.super_class = (Class)PLManagedObject;
  [(PLManagedObject *)&v3 prepareForDeletion];
  if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19F38C0C0]())
  {
    if (+[PLGraphEdge managedObjectConformsToProtocolPLGraphEdgeReferenceRecipient:self])
    {
      +[PLGraphEdge registerDeletedObjectForDanglingReferenceCleanup:self];
    }
  }
}

- (BOOL)isSyncableChange
{
  return 0;
}

- (BOOL)supportsCloudUpload
{
  return 0;
}

- (NSString)shortObjectIDURI
{
  objc_super v2 = [(PLManagedObject *)self objectID];
  objc_super v3 = objc_msgSend(v2, "pl_shortURI");

  return (NSString *)v3;
}

- (BOOL)isRegisteredWithUserInterfaceContext
{
  objc_super v2 = [(PLManagedObject *)self managedObjectContext];
  char v3 = [v2 isUserInterfaceContext];

  return v3;
}

- (PLPhotoLibrary)photoLibrary
{
  objc_super v2 = [(PLManagedObject *)self managedObjectContext];
  char v3 = [v2 photoLibrary];

  return (PLPhotoLibrary *)v3;
}

- (PLPhotoLibraryPathManager)pathManager
{
  id v4 = [(PLManagedObject *)self photoLibrary];
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = [v4 pathManager];
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    float v8 = [(PLManagedObject *)self managedObjectContext];
    v6 = [v8 pathManager];

    if (v6) {
      goto LABEL_3;
    }
  }
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"PLManagedObject.m", 64, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

LABEL_3:
  return (PLPhotoLibraryPathManager *)v6;
}

+ (id)attributeValidationRules
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entityInManagedObjectContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 entityName];
  v6 = PLSafeEntityForNameInManagedObjectContext((uint64_t)v5, (uint64_t)v4, 0);

  return v6;
}

+ (id)insertInManagedObjectContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 entityName];
  v6 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v5, (uint64_t)v4, 0);

  return v6;
}

+ (id)entityName
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return 0;
}

- (id)payloadsForChangedKeys:(id)a3
{
  return 0;
}

- (id)payloadIDsByPayloadClassIDToDeleteOnInsert
{
  return 0;
}

- (id)payloadIDForTombstone:(id)a3
{
  return 0;
}

- (id)payloadForChangedKeys:(id)a3
{
  return 0;
}

- (id)payloadID
{
  return 0;
}

- (BOOL)isValidForJournalPersistence
{
  return 1;
}

- (id)duplicateSortPropertyNamesSkip
{
  id v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)duplicateSortPropertyNames
{
  id v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end