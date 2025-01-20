@interface TBPersistenceManager
+ (BOOL)isStoreCompatibleAtURL:(id)a3 withModel:(id)a4;
- (NSManagedObjectContext)persistenceContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentStoreCoordinator)persistenceCoordinator;
- (TBPersistenceManager)initWithManagedObjectModel:(id)a3 storeDescriptor:(id)a4;
- (TBPersistenceRemoteStoreServer)remoteStoreServer;
- (void)addPersistentStorage:(id)a3 completionHandler:(id)a4;
- (void)setManagedObjectModel:(id)a3;
- (void)setPersistenceContext:(id)a3;
- (void)setPersistenceCoordinator:(id)a3;
- (void)setRemoteStoreServer:(id)a3;
@end

@implementation TBPersistenceManager

- (NSPersistentStoreCoordinator)persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (TBPersistenceManager)initWithManagedObjectModel:(id)a3 storeDescriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)TBPersistenceManager;
  v9 = [(TBPersistenceManager *)&v36 init];
  objc_storeStrong((id *)&v9->_managedObjectModel, a3);
  if (!v9->_managedObjectModel)
  {
    NSLog(&cfstr_SNsmanagedobje.isa, "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]");
    goto LABEL_12;
  }
  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v9->_managedObjectModel];
  persistenceCoordinator = v9->_persistenceCoordinator;
  v9->_persistenceCoordinator = (NSPersistentStoreCoordinator *)v10;

  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  v13 = [v8 storeURL];
  v14 = [v13 path];
  if ([v12 fileExistsAtPath:v14])
  {
    uint64_t v15 = objc_opt_class();
    v16 = [v8 storeURL];
    LOBYTE(v15) = [(id)v15 isStoreCompatibleAtURL:v16 withModel:v9->_managedObjectModel];

    if (v15) {
      goto LABEL_9;
    }
    v17 = [v8 storeURL];
    NSLog(&cfstr_SRemovingIncom.isa, "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]", v17);

    v18 = v9->_persistenceCoordinator;
    v19 = [v8 storeURL];
    v20 = [v8 storeDescription];
    v21 = [v20 type];
    v22 = [v8 storeOptions];
    uint64_t v35 = 0;
    [(NSPersistentStoreCoordinator *)v18 destroyPersistentStoreAtURL:v19 withType:v21 options:v22 error:&v35];
    uint64_t v23 = v35;

    if (!v23) {
      goto LABEL_9;
    }
    v12 = [v8 storeURL];
    NSLog(&cfstr_SFailedToStore.isa, "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]", v12);
  }
  else
  {
  }
LABEL_9:
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  v25 = [MEMORY[0x1E4F1C130] mergeByPropertyObjectTrumpMergePolicy];
  [v24 setMergePolicy:v25];

  [v24 setPersistentStoreCoordinator:v9->_persistenceCoordinator];
  v26 = [MEMORY[0x1E4F28F80] processInfo];
  v27 = [v26 processName];
  [v24 setTransactionAuthor:v27];

  objc_storeStrong((id *)&v9->_persistenceContext, v24);
  if (![v8 type])
  {
    v28 = [TBPersistenceRemoteStoreServer alloc];
    v29 = [v8 storeURL];
    v30 = [v8 modelURL];
    v31 = [v8 storeOptions];
    uint64_t v32 = [(TBPersistenceRemoteStoreServer *)v28 initWithStoreURL:v29 modelURL:v30 options:v31];
    remoteStoreServer = v9->_remoteStoreServer;
    v9->_remoteStoreServer = (TBPersistenceRemoteStoreServer *)v32;

    [(TBPersistenceRemoteStoreServer *)v9->_remoteStoreServer startListening];
    NSLog(&cfstr_SInitializedRe.isa, "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]", v9->_remoteStoreServer);
  }

LABEL_12:
  return v9;
}

- (void)addPersistentStorage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  persistenceCoordinator = self->_persistenceCoordinator;
  id v8 = [a3 storeDescription];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__TBPersistenceManager_addPersistentStorage_completionHandler___block_invoke;
  v10[3] = &unk_1E69BE020;
  id v11 = v6;
  id v9 = v6;
  [(NSPersistentStoreCoordinator *)persistenceCoordinator addPersistentStoreWithDescription:v8 completionHandler:v10];
}

+ (BOOL)isStoreCompatibleAtURL:(id)a3 withModel:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F1BF70];
  id v12 = 0;
  id v7 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v6 URL:a3 options:0 error:&v12];
  id v8 = v12;
  id v9 = v8;
  if (v8)
  {
    NSLog(&cfstr_SErrorRetrievi.isa, "+[TBPersistenceManager isStoreCompatibleAtURL:withModel:]", v8);
LABEL_7:
    char v10 = 0;
    goto LABEL_4;
  }
  if (!v7)
  {
    NSLog(&cfstr_SFailedToGetMe.isa, "+[TBPersistenceManager isStoreCompatibleAtURL:withModel:]");
    goto LABEL_7;
  }
  char v10 = [v5 isConfiguration:0 compatibleWithStoreMetadata:v7];
LABEL_4:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteStoreServer, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistenceCoordinator, 0);

  objc_storeStrong((id *)&self->_persistenceContext, 0);
}

void __63__TBPersistenceManager_addPersistentStorage_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = a3;
    NSLog(&cfstr_ErrorAddingPer.isa, v5, a2);
    uint64_t v6 = *MEMORY[0x1E4F28A50];
    v11[0] = *MEMORY[0x1E4F28568];
    v11[1] = v6;
    v12[0] = @"Failed to add persistent store.";
    v12[1] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    id v8 = [[TBError alloc] initWithType:104 userInfo:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    char v10 = *(void (**)(uint64_t, void))(v9 + 16);
    id v7 = 0;
    v10(v9, 0);
  }
}

- (NSManagedObjectContext)persistenceContext
{
  return self->_persistenceContext;
}

- (void)setPersistenceContext:(id)a3
{
}

- (void)setPersistenceCoordinator:(id)a3
{
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (void)setManagedObjectModel:(id)a3
{
}

- (TBPersistenceRemoteStoreServer)remoteStoreServer
{
  return self->_remoteStoreServer;
}

- (void)setRemoteStoreServer:(id)a3
{
}

@end