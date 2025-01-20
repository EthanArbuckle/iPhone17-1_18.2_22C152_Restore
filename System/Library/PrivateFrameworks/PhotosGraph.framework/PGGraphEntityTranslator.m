@interface PGGraphEntityTranslator
+ (BOOL)includesRelationshipChanges;
+ (Class)entityClass;
+ (NSString)entityClassName;
+ (NSString)managedEntityName;
+ (id)uuidFromLocalIdentifier:(id)a3;
+ (id)uuidsFromLocalIdentifiers:(id)a3;
- (PGGraphEntityTranslator)initWithPhotoLibrary:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5;
- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphEntityTranslator

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  return 0;
}

- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  return 0;
}

- (PGGraphEntityTranslator)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphEntityTranslator;
  v6 = [(PGGraphEntityTranslator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
  }

  return v7;
}

+ (id)uuidsFromLocalIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)[a1 entityClass];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(v6, "uuidFromLocalIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v5;
}

+ (id)uuidFromLocalIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_msgSend(a1, "entityClass"), "uuidFromLocalIdentifier:", v4);

  return v5;
}

+ (BOOL)includesRelationshipChanges
{
  return 0;
}

+ (NSString)managedEntityName
{
  v2 = (void *)[a1 entityClass];
  return (NSString *)[v2 managedEntityName];
}

+ (NSString)entityClassName
{
  v2 = (objc_class *)[a1 entityClass];
  return NSStringFromClass(v2);
}

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

@end