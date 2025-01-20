@interface RCSavedRecordingsController
- (BOOL)performFetch:(id *)a3;
- (NSArray)cloudRecordings;
- (NSArray)fetchedRecordings;
- (NSFetchedResultsControllerDelegate)defaultDelegate;
- (NSPredicate)fetchPredicate;
- (RCFolder)folder;
- (RCSavedRecordingsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fetchedObjects;
- (void)invalidate;
- (void)setDefaultDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFolder:(id)a3;
- (void)setSubPredicate:(id)a3 performingFetch:(BOOL)a4;
@end

@implementation RCSavedRecordingsController

- (void)setDelegate:(id)a3
{
  id WeakRetained = a3;
  if (!WeakRetained) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultDelegate);
  }
  v5.receiver = self;
  v5.super_class = (Class)RCSavedRecordingsController;
  [(RCSavedRecordingsController *)&v5 setDelegate:WeakRetained];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_super v5 = [(NSFetchRequest *)self->_fetchRequest entity];
  [v4 setEntity:v5];

  v6 = [(NSFetchRequest *)self->_fetchRequest predicate];
  [v4 setPredicate:v6];

  v7 = [(NSFetchRequest *)self->_fetchRequest propertiesToFetch];
  [v4 setPropertiesToFetch:v7];

  v8 = [(NSFetchRequest *)self->_fetchRequest sortDescriptors];
  [v4 setSortDescriptors:v8];

  [v4 setFetchBatchSize:[self->_fetchRequest fetchBatchSize]];
  v9 = [RCSavedRecordingsController alloc];
  v10 = [(RCSavedRecordingsController *)self managedObjectContext];
  v11 = [(RCSavedRecordingsController *)v9 initWithFetchRequest:v4 managedObjectContext:v10];

  return v11;
}

- (NSArray)fetchedRecordings
{
  return [(RCSavedRecordingsController *)self cloudRecordings];
}

- (NSArray)cloudRecordings
{
  if (!self->_hasPerformedFetch)
  {
    id v8 = 0;
    unsigned __int8 v3 = [(RCSavedRecordingsController *)self performFetch:&v8];
    id v4 = v8;
    if ((v3 & 1) == 0)
    {
      objc_super v5 = OSLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10016F318();
      }
    }
  }
  v6 = [(RCSavedRecordingsController *)self _fetchedObjects];

  return (NSArray *)v6;
}

- (void)setDefaultDelegate:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_defaultDelegate, v4);
  objc_super v5 = [(RCSavedRecordingsController *)self delegate];

  if (!v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)RCSavedRecordingsController;
    [(RCSavedRecordingsController *)&v6 setDelegate:v4];
  }
}

- (RCSavedRecordingsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RCSavedRecordingsController;
  id v8 = [(RCSavedRecordingsController *)&v13 initWithFetchRequest:v7 managedObjectContext:a4 sectionNameKeyPath:0 cacheName:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fetchRequest, a3);
    uint64_t v10 = [(NSFetchRequest *)v9->_fetchRequest predicate];
    fetchPredicate = v9->_fetchPredicate;
    v9->_fetchPredicate = (NSPredicate *)v10;
  }
  return v9;
}

- (void)setFolder:(id)a3
{
}

- (BOOL)performFetch:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RCSavedRecordingsController;
  BOOL result = [(RCSavedRecordingsController *)&v5 performFetch:a3];
  self->_hasPerformedFetch = result;
  return result;
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)RCSavedRecordingsController;
  [(RCSavedRecordingsController *)&v2 setDelegate:0];
}

- (void)setSubPredicate:(id)a3 performingFetch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v37 = [(RCSavedRecordingsController *)self delegate];
  char v7 = objc_opt_respondsToSelector();
  char v8 = v7;
  v9 = 0;
  if (v4 && (v7 & 1) != 0)
  {
    uint64_t v10 = [(RCSavedRecordingsController *)self fetchedObjects];
    v9 = +[NSOrderedSet orderedSetWithArray:v10];
  }
  if (v6)
  {
    v49[0] = self->_fetchPredicate;
    v49[1] = v6;
    v11 = +[NSArray arrayWithObjects:v49 count:2];
    v12 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];
    [(NSFetchRequest *)self->_fetchRequest setPredicate:v12];

    if (!v4) {
      goto LABEL_40;
    }
  }
  else
  {
    [(NSFetchRequest *)self->_fetchRequest setPredicate:self->_fetchPredicate];
    if (!v4) {
      goto LABEL_40;
    }
  }
  id v46 = 0;
  unsigned __int8 v13 = [(RCSavedRecordingsController *)self performFetch:&v46];
  id v14 = v46;
  if ((v13 & 1) == 0)
  {
    v15 = OSLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10016F2A4();
    }
  }
  if (v8)
  {
    v16 = [(RCSavedRecordingsController *)self fetchedObjects];
    v17 = +[NSOrderedSet orderedSetWithArray:v16];

    if (([v9 isEqual:v17] & 1) == 0)
    {
      if (objc_opt_respondsToSelector()) {
        [v37 controllerWillChangeContent:self];
      }
      id v35 = v14;
      id v36 = v6;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v34 = v17;
      id v18 = v17;
      id v19 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v43;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            if ((objc_msgSend(v9, "containsObject:", v23, v34, v35, v36) & 1) == 0)
            {
              id v24 = [v18 indexOfObject:v23];
              if (v24 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v25 = +[NSIndexPath indexPathForRow:v24 inSection:0];
                [v37 controller:self didChangeObject:v23 atIndexPath:0 forChangeType:1 newIndexPath:v25];
              }
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v20);
      }

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v26 = v9;
      id v27 = [v26 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v39;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v39 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v38 + 1) + 8 * (void)j);
            if ((objc_msgSend(v18, "containsObject:", v31, v34, v35, v36) & 1) == 0)
            {
              id v32 = [v26 indexOfObject:v31];
              if (v32 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v33 = +[NSIndexPath indexPathForRow:v32 inSection:0];
                [v37 controller:self didChangeObject:v31 atIndexPath:v33 forChangeType:2 newIndexPath:0];
              }
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v28);
      }

      id v14 = v35;
      id v6 = v36;
      v17 = v34;
      if (objc_opt_respondsToSelector()) {
        [v37 controllerDidChangeContent:self];
      }
    }
  }
LABEL_40:
}

- (id)fetchedObjects
{
  if (!self->_hasPerformedFetch)
  {
    id v9 = 0;
    unsigned __int8 v3 = [(RCSavedRecordingsController *)self performFetch:&v9];
    id v4 = v9;
    if ((v3 & 1) == 0)
    {
      objc_super v5 = OSLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10016F38C();
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)RCSavedRecordingsController;
  id v6 = [(RCSavedRecordingsController *)&v8 fetchedObjects];

  return v6;
}

- (NSPredicate)fetchPredicate
{
  return self->_fetchPredicate;
}

- (RCFolder)folder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folder);

  return (RCFolder *)WeakRetained;
}

- (NSFetchedResultsControllerDelegate)defaultDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultDelegate);

  return (NSFetchedResultsControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_folder);
  objc_destroyWeak((id *)&self->_defaultDelegate);
  objc_storeStrong((id *)&self->_fetchPredicate, 0);

  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

@end