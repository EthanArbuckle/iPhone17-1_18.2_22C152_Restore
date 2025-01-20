@interface TUIRenderUpdateArrayTracker
- (NSCountedSet)deletedIdentifiers;
- (NSMutableDictionary)deletedModels;
- (NSMutableDictionary)submodelTrackers;
- (TUIRenderUpdateArrayTracker)init;
- (id)addDeletedInterestInDeletedModels:(id)a3;
- (id)submodelTrackerForIdentifier:(id)a3;
- (void)decrementInterestInDeletedModels:(id)a3;
- (void)incrementInterestInDeletedModels:(id)a3;
- (void)setDeletedModels:(id)a3;
- (void)setSubmodelTracker:(id)a3 forIdentifier:(id)a4;
@end

@implementation TUIRenderUpdateArrayTracker

- (TUIRenderUpdateArrayTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUIRenderUpdateArrayTracker;
  v2 = [(TUIRenderUpdateArrayTracker *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deletedIdentifiers = v2->_deletedIdentifiers;
    v2->_deletedIdentifiers = (NSCountedSet *)v3;

    uint64_t v5 = objc_opt_new();
    deletedModels = v2->_deletedModels;
    v2->_deletedModels = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)addDeletedInterestInDeletedModels:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_TUIRenderUpdateDeletionInterest alloc] initWithModels:v4 tracker:self];

  return v5;
}

- (void)incrementInterestInDeletedModels:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = [v9 identifier];
        [(NSCountedSet *)self->_deletedIdentifiers addObject:v10];
        [(NSMutableDictionary *)self->_deletedModels setObject:v9 forKeyedSubscript:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)decrementInterestInDeletedModels:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) identifier];
        [(NSCountedSet *)self->_deletedIdentifiers removeObject:v9];
        if (![(NSCountedSet *)self->_deletedIdentifiers countForObject:v9]) {
          [(NSMutableDictionary *)self->_deletedModels removeObjectForKey:v9];
        }

        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)submodelTrackerForIdentifier:(id)a3
{
  return [(NSMutableDictionary *)self->_submodelTrackers objectForKeyedSubscript:a3];
}

- (void)setSubmodelTracker:(id)a3 forIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  submodelTrackers = self->_submodelTrackers;
  if (!submodelTrackers)
  {
    objc_super v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_submodelTrackers;
    self->_submodelTrackers = v8;

    submodelTrackers = self->_submodelTrackers;
  }
  [(NSMutableDictionary *)submodelTrackers setObject:v10 forKeyedSubscript:v6];
}

- (NSCountedSet)deletedIdentifiers
{
  return self->_deletedIdentifiers;
}

- (NSMutableDictionary)deletedModels
{
  return self->_deletedModels;
}

- (void)setDeletedModels:(id)a3
{
}

- (NSMutableDictionary)submodelTrackers
{
  return self->_submodelTrackers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodelTrackers, 0);
  objc_storeStrong((id *)&self->_deletedModels, 0);

  objc_storeStrong((id *)&self->_deletedIdentifiers, 0);
}

@end