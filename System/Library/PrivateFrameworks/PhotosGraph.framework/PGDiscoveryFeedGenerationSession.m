@interface PGDiscoveryFeedGenerationSession
- (PGDiscoveryFeedGenerationSession)initWithOptions:(id)a3 workingContext:(id)a4;
- (PGDiscoveryFeedGenerationSession)initWithOptions:(id)a3 workingContext:(id)a4 state:(id)a5;
- (id)additionalItemsWithTargetCount:(unint64_t)a3;
- (id)currentState;
- (void)_restoreState:(id)a3;
@end

@implementation PGDiscoveryFeedGenerationSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (id)additionalItemsWithTargetCount:(unint64_t)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v5 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];

  [v6 setFetchLimit:a3];
  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v29[0] = v7;
  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v29[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v6 setSortDescriptors:v9];

  if ([(NSMutableSet *)self->_usedLocalIdentifiers count])
  {
    v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT localIdentifier IN %@", self->_usedLocalIdentifiers];
    [v6 setPredicate:v10];
  }
  v23 = v6;
  v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v19 = [[PGDiscoveryFeedItem alloc] initWithObject:v18];
        [v12 addObject:v19];
        usedLocalIdentifiers = self->_usedLocalIdentifiers;
        v21 = [v18 localIdentifier];
        [(NSMutableSet *)usedLocalIdentifiers addObject:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  return v12;
}

- (id)currentState
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"usedLocalIdentifiers";
  v2 = [(NSMutableSet *)self->_usedLocalIdentifiers allObjects];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)_restoreState:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"usedLocalIdentifiers"];
  if (v4)
  {
    v5 = v4;
    [(NSMutableSet *)self->_usedLocalIdentifiers addObjectsFromArray:v4];
    v4 = v5;
  }
}

- (PGDiscoveryFeedGenerationSession)initWithOptions:(id)a3 workingContext:(id)a4 state:(id)a5
{
  id v8 = a5;
  v9 = [(PGDiscoveryFeedGenerationSession *)self initWithOptions:a3 workingContext:a4];
  v10 = v9;
  if (v9) {
    [(PGDiscoveryFeedGenerationSession *)v9 _restoreState:v8];
  }

  return v10;
}

- (PGDiscoveryFeedGenerationSession)initWithOptions:(id)a3 workingContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGDiscoveryFeedGenerationSession;
  id v8 = [(PGDiscoveryFeedGenerationSession *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    options = v8->_options;
    v8->_options = (PGDiscoveryFeedGenerationOptions *)v9;

    objc_storeStrong((id *)&v8->_workingContext, a4);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    usedLocalIdentifiers = v8->_usedLocalIdentifiers;
    v8->_usedLocalIdentifiers = v11;
  }
  return v8;
}

@end