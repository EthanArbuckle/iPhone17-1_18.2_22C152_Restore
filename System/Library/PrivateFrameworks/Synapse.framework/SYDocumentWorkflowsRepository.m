@interface SYDocumentWorkflowsRepository
- (BOOL)saveUserActivity:(id)a3 forRelatedUniqueIdentifier:(id)a4 sourceBundleIdentifier:(id)a5 error:(id *)a6;
- (SYDocumentWorkflowsRepository)init;
- (id)fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4;
@end

@implementation SYDocumentWorkflowsRepository

- (SYDocumentWorkflowsRepository)init
{
  v6.receiver = self;
  v6.super_class = (Class)SYDocumentWorkflowsRepository;
  v2 = [(SYDocumentWorkflowsRepository *)&v6 init];
  if (v2)
  {
    +[SYDocumentWorkflowsCoreDataStore removePersistentStoreWithError:0];
    v3 = objc_alloc_init(SYDocumentWorkflowsDisabledDataStore);
    persistentStore = v2->_persistentStore;
    v2->_persistentStore = (SYDocumentWorkflowsDataStore *)v3;
  }
  return v2;
}

- (id)fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4
{
  return (id)[(SYDocumentWorkflowsDataStore *)self->_persistentStore fetchUserActivityWithRelatedUniqueIdentifier:a3 error:a4];
}

- (BOOL)saveUserActivity:(id)a3 forRelatedUniqueIdentifier:(id)a4 sourceBundleIdentifier:(id)a5 error:(id *)a6
{
  return [(SYDocumentWorkflowsDataStore *)self->_persistentStore saveUserActivity:a3 forRelatedUniqueIdentifier:a4 sourceBundleIdentifier:a5 error:a6];
}

- (void).cxx_destruct
{
}

@end