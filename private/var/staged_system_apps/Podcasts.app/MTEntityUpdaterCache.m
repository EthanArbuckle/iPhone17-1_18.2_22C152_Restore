@interface MTEntityUpdaterCache
- (MTEntityUpdaterCache)initWithPredicate:(id)a3 entityName:(id)a4 ctx:(id)a5 properties:(id)a6 fetchProperties:(id)a7;
- (id)allowKeyForValue;
- (id)indexingBlock;
- (id)propertyDictionaryForSearchItem:(id)a3;
- (void)_addDictionary:(id)a3;
- (void)_buildMap;
- (void)addEntityToCache:(id)a3;
- (void)enumerateUnvisitedItemUuids:(id)a3;
- (void)setAllowKeyForValue:(id)a3;
- (void)setIndexingBlock:(id)a3;
@end

@implementation MTEntityUpdaterCache

- (MTEntityUpdaterCache)initWithPredicate:(id)a3 entityName:(id)a4 ctx:(id)a5 properties:(id)a6 fetchProperties:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)MTEntityUpdaterCache;
  v17 = [(MTEntityUpdaterCache *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_properties, a6);
    objc_storeStrong((id *)&v18->_propertiesToFetch, a7);
    objc_storeStrong((id *)&v18->_ctx, a5);
    objc_storeStrong((id *)&v18->_predicate, a3);
    objc_storeStrong((id *)&v18->_entityName, a4);
    v19 = v18;
  }

  return v18;
}

- (id)propertyDictionaryForSearchItem:(id)a3
{
  id v4 = a3;
  if (!self->_objectsByProperty) {
    [(MTEntityUpdaterCache *)self _buildMap];
  }
  uint64_t v5 = [(NSArray *)self->_properties count];
  if (v5 < 1)
  {
LABEL_12:
    id v13 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  while (1)
  {
    v8 = [(NSArray *)self->_properties objectAtIndexedSubscript:v7];
    v9 = [v4 objectForKeyedSubscript:v8];
    allowKeyForValue = (unsigned int (**)(id, void *, void *))self->_allowKeyForValue;
    if (allowKeyForValue && !allowKeyForValue[2](allowKeyForValue, v8, v9)) {
      goto LABEL_10;
    }
    if (v9) {
      break;
    }
LABEL_11:

    if (v6 == ++v7) {
      goto LABEL_12;
    }
  }
  v11 = [(NSMutableArray *)self->_objectsByProperty objectAtIndexedSubscript:v7];
  v12 = [v11 objectForKeyedSubscript:v9];
  if (!v12)
  {

LABEL_10:
    goto LABEL_11;
  }
  id v13 = v12;
  id v15 = [v12 objectForKeyedSubscript:@"uuid"];
  if (v15) {
    [(NSMutableSet *)self->_unvisited removeObject:v15];
  }

LABEL_13:

  return v13;
}

- (void)_buildMap
{
  v3 = +[NSMutableSet setWithArray:self->_properties];
  [v3 addObject:@"uuid"];
  if ([(NSArray *)self->_propertiesToFetch count])
  {
    id v4 = +[NSSet setWithArray:self->_propertiesToFetch];
    [v3 unionSet:v4];
  }
  entityName = self->_entityName;
  ctx = self->_ctx;
  predicate = self->_predicate;
  v8 = [v3 allObjects];
  v9 = [(NSManagedObjectContext *)ctx objectsInEntity:entityName predicate:predicate propertiesToFetch:v8 limit:0];

  v10 = [v9 valueForKey:@"uuid"];
  v11 = +[NSMutableSet setWithArray:v10];
  unvisited = self->_unvisited;
  self->_unvisited = v11;

  id v13 = (NSMutableArray *)objc_opt_new();
  objectsByProperty = self->_objectsByProperty;
  self->_objectsByProperty = v13;

  if ([(NSArray *)self->_properties count])
  {
    unint64_t v15 = 0;
    do
    {
      id v16 = self->_objectsByProperty;
      v17 = objc_opt_new();
      [(NSMutableArray *)v16 addObject:v17];

      ++v15;
    }
    while (v15 < [(NSArray *)self->_properties count]);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000D8860;
  v18[3] = &unk_100550AD0;
  v18[4] = self;
  [v9 enumerateObjectsUsingBlock:v18];
}

- (void)addEntityToCache:(id)a3
{
  id v9 = a3;
  id v4 = [v9 dictionaryRepresentation];
  uint64_t v5 = [(MTEntityUpdaterCache *)self indexingBlock];

  if (v5)
  {
    uint64_t v6 = [(MTEntityUpdaterCache *)self indexingBlock];
    uint64_t v7 = ((void (**)(void, id))v6)[2](v6, v9);
    uint64_t v8 = [v4 ams_dictionaryByAddingEntriesFromDictionary:v7];

    id v4 = (void *)v8;
  }
  [(MTEntityUpdaterCache *)self _addDictionary:v4];
}

- (void)_addDictionary:(id)a3
{
  id v8 = a3;
  if ([(NSArray *)self->_properties count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [(NSArray *)self->_properties objectAtIndexedSubscript:v4];
      uint64_t v6 = [v8 objectForKeyedSubscript:v5];
      if (v6)
      {
        uint64_t v7 = [(NSMutableArray *)self->_objectsByProperty objectAtIndexedSubscript:v4];
        [v7 setObject:v8 forKey:v6];
      }
      ++v4;
    }
    while (v4 < [(NSArray *)self->_properties count]);
  }
}

- (void)enumerateUnvisitedItemUuids:(id)a3
{
  unint64_t v4 = (void (**)(id, uint64_t, char *))a3;
  unvisited = self->_unvisited;
  if (!unvisited)
  {
    [(MTEntityUpdaterCache *)self _buildMap];
    unvisited = self->_unvisited;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = unvisited;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      char v12 = 0;
      v4[2](v4, v11, &v12);
      if (v12) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (id)allowKeyForValue
{
  return self->_allowKeyForValue;
}

- (void)setAllowKeyForValue:(id)a3
{
}

- (id)indexingBlock
{
  return self->_indexingBlock;
}

- (void)setIndexingBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_indexingBlock, 0);
  objc_storeStrong(&self->_allowKeyForValue, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_unvisited, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_propertiesToFetch, 0);
  objc_storeStrong((id *)&self->_objectsByProperty, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end