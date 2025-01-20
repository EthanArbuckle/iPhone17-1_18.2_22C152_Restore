@interface MTFetchedResultsController
- (BOOL)_hasManagedObjectChanged:(id)a3;
- (BOOL)performFetch:(id *)a3;
- (MTFetchedResultsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4 sectionNameKeyPath:(id)a5 cacheName:(id)a6;
- (NSArray)fetchedObjects;
- (NSArray)propertyKeys;
- (NSArray)sections;
- (NSFetchRequest)fetchRequest;
- (NSFetchedResultsControllerDelegate)delegate;
- (NSManagedObjectContext)managedObjectContext;
- (id)_dictionaryForObject:(id)a3;
- (id)_dictionaryFromCacheForObjectID:(id)a3;
- (id)indexPathForObject:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (void)_removeObjectFromCacheWithId:(id)a3;
- (void)_updateCacheWithManagedObject:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPropertyKeys:(id)a3;
@end

@implementation MTFetchedResultsController

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = [(MTFetchedResultsController *)self propertyKeys];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    switch(a6)
    {
      case 1uLL:
      case 3uLL:
        goto LABEL_8;
      case 2uLL:
        v18 = [v13 objectID];
        [(MTFetchedResultsController *)self _removeObjectFromCacheWithId:v18];

        goto LABEL_9;
      case 4uLL:
        if (![(MTFetchedResultsController *)self _hasManagedObjectChanged:v13])
        {
          v21 = _MTLogCategoryDatabase();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl(&dword_1AC9D5000, v21, OS_LOG_TYPE_DEBUG, "Managed object was updated, but none of the properties we care about changed", v25, 2u);
          }
          goto LABEL_6;
        }
LABEL_8:
        [(MTFetchedResultsController *)self _updateCacheWithManagedObject:v13];
LABEL_9:
        v22 = objc_opt_new();
        v23 = v22;
        if (v13) {
          [v22 setObject:v13 forKeyedSubscript:@"object"];
        }
        if (v14) {
          [v23 setObject:v14 forKeyedSubscript:@"indexPath"];
        }
        v24 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a6];
        [v23 setObject:v24 forKeyedSubscript:@"type"];

        if (v15) {
          [v23 setObject:v15 forKeyedSubscript:@"newIndexPath"];
        }
        [(NSMutableArray *)self->_changes addObject:v23];

        break;
      default:
        goto LABEL_9;
    }
  }
  else
  {
    v19 = [(MTFetchedResultsController *)self delegate];
    uint64_t v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      v21 = [(MTFetchedResultsController *)self delegate];
      [v21 controller:v12 didChangeObject:v13 atIndexPath:v14 forChangeType:a6 newIndexPath:v15];
LABEL_6:
    }
  }
}

- (BOOL)_hasManagedObjectChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectID];
  v6 = [(MTFetchedResultsController *)self _dictionaryFromCacheForObjectID:v5];

  v7 = [(MTFetchedResultsController *)self _dictionaryForObject:v4];

  LOBYTE(v4) = [v6 isEqualToDictionary:v7] ^ 1;
  return (char)v4;
}

- (BOOL)performFetch:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_propertyCache removeAllObjects];
  BOOL v5 = [(NSFetchedResultsController *)self->_frc performFetch:a3];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [(NSFetchedResultsController *)self->_frc fetchedObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [(MTFetchedResultsController *)self _updateCacheWithManagedObject:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (void)_updateCacheWithManagedObject:(id)a3
{
  id v7 = a3;
  id v4 = -[MTFetchedResultsController _dictionaryForObject:](self, "_dictionaryForObject:");
  if (v4)
  {
    propertyCache = self->_propertyCache;
    v6 = [v7 objectID];
    [(NSMutableDictionary *)propertyCache setObject:v4 forKeyedSubscript:v6];
  }
}

- (id)_dictionaryForObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(MTFetchedResultsController *)self propertyKeys];

  if (!v5)
  {
    v6 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(MTFetchedResultsController *)self fetchRequest];
      uint64_t v8 = [v7 entityName];
      uint64_t v9 = [(MTFetchedResultsController *)self fetchRequest];
      uint64_t v10 = [v9 predicate];
      int v14 = 138543618;
      long long v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1AC9D5000, v6, OS_LOG_TYPE_ERROR, "MTFetchedResultsController with null property keys detected - entity %{public}@ - predicate %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  v11 = [(MTFetchedResultsController *)self propertyKeys];
  long long v12 = [v4 dictionaryWithValuesForKeys:v11];

  return v12;
}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (id)_dictionaryFromCacheForObjectID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_propertyCache objectForKeyedSubscript:a3];
}

- (NSManagedObjectContext)managedObjectContext
{
  return [(NSFetchedResultsController *)self->_frc managedObjectContext];
}

- (NSArray)fetchedObjects
{
  return [(NSFetchedResultsController *)self->_frc fetchedObjects];
}

- (MTFetchedResultsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4 sectionNameKeyPath:(id)a5 cacheName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MTFetchedResultsController;
  int v14 = [(MTFetchedResultsController *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    propertyCache = v14->_propertyCache;
    v14->_propertyCache = (NSMutableDictionary *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1C0F0]) initWithFetchRequest:v10 managedObjectContext:v11 sectionNameKeyPath:v12 cacheName:v13];
    frc = v14->_frc;
    v14->_frc = (NSFetchedResultsController *)v17;

    [(NSFetchedResultsController *)v14->_frc setDelegate:v14];
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    changes = v14->_changes;
    v14->_changes = (NSMutableArray *)v19;
  }
  return v14;
}

- (void)setDelegate:(id)a3
{
}

- (void)setPropertyKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (NSArray *)a3;
  p_propertyKeys = &self->_propertyKeys;
  propertyKeys = self->_propertyKeys;
  if (propertyKeys != v5 && ![(NSArray *)propertyKeys isEqualToArray:v5])
  {
    if ([(NSArray *)v5 containsObject:@"episodes"])
    {
      uint64_t v8 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [(MTFetchedResultsController *)self fetchRequest];
        id v10 = [v9 entityName];
        id v11 = [(MTFetchedResultsController *)self fetchRequest];
        id v12 = [v11 predicate];
        int v13 = 138543618;
        int v14 = v10;
        __int16 v15 = 2114;
        __int16 v16 = v12;
        _os_log_impl(&dword_1AC9D5000, v8, OS_LOG_TYPE_ERROR, "MTFetchedResultsController with episodes within property keys detected - entity %{public}@ - predicate %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    objc_storeStrong((id *)p_propertyKeys, a3);
  }
}

- (NSFetchRequest)fetchRequest
{
  return [(NSFetchedResultsController *)self->_frc fetchRequest];
}

- (void)controllerWillChangeContent:(id)a3
{
  id v9 = a3;
  id v4 = [(MTFetchedResultsController *)self propertyKeys];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    v6 = [(MTFetchedResultsController *)self delegate];
    uint64_t v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(MTFetchedResultsController *)self delegate];
      [v8 controllerWillChangeContent:v9];
    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v4 = [(MTFetchedResultsController *)self propertyKeys];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    if ([(NSMutableArray *)self->_changes count])
    {
      v6 = [(MTFetchedResultsController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v6 controllerWillChangeContent:v22];
      }
      if (objc_opt_respondsToSelector())
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v20 = self;
        obj = self->_changes;
        uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(obj);
              }
              id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              id v12 = [v11 objectForKeyedSubscript:@"object"];
              int v13 = [v11 objectForKeyedSubscript:@"indexPath"];
              int v14 = [v11 objectForKeyedSubscript:@"type"];
              uint64_t v15 = [v14 unsignedIntegerValue];
              __int16 v16 = [v11 objectForKeyedSubscript:@"newIndexPath"];
              [v6 controller:v22 didChangeObject:v12 atIndexPath:v13 forChangeType:v15 newIndexPath:v16];
            }
            uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v8);
        }

        self = v20;
      }
      [(NSMutableArray *)self->_changes removeAllObjects];
      if (objc_opt_respondsToSelector()) {
        [v6 controllerDidChangeContent:v22];
      }
    }
  }
  else
  {
    uint64_t v17 = [(MTFetchedResultsController *)self delegate];
    uint64_t v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v19 = [(MTFetchedResultsController *)self delegate];
      [v19 controllerDidChangeContent:v22];
    }
  }
}

- (NSArray)sections
{
  return [(NSFetchedResultsController *)self->_frc sections];
}

- (id)objectAtIndexPath:(id)a3
{
  return [(NSFetchedResultsController *)self->_frc objectAtIndexPath:a3];
}

- (id)indexPathForObject:(id)a3
{
  return [(NSFetchedResultsController *)self->_frc indexPathForObject:a3];
}

- (void)_removeObjectFromCacheWithId:(id)a3
{
}

- (NSFetchedResultsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NSFetchedResultsControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_propertyCache, 0);
  objc_storeStrong((id *)&self->_frc, 0);
}

@end