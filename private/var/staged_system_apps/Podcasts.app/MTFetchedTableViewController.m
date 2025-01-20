@interface MTFetchedTableViewController
- (BOOL)changeIsUserDriven;
- (BOOL)hasSectionNameKeyPathChanged;
- (BOOL)inSwipeToDeleteMode;
- (MTFetchedTableViewController)initWithEntityName:(id)a3;
- (MTFetchedTableViewController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (NSArray)sortDescriptors;
- (NSFetchedResultsController)frc;
- (NSPredicate)fetchPredicate;
- (NSString)fetchEntityName;
- (NSString)sectionName;
- (NSString)sectionNameKeyPath;
- (id)fetchRequestInManagedObjectContext:(id)a3;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowAnimation;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateTableAnimated:(BOOL)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)initializeFrc;
- (void)refetchWithPredicate:(id)a3;
- (void)refetchWithPredicate:(id)a3 sortDescriptors:(id)a4 animated:(BOOL)a5;
- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4;
- (void)reloadVisibleCellsWithAnimation:(int64_t)a3;
- (void)setChangeIsUserDriven:(BOOL)a3;
- (void)setFetchEntityName:(id)a3;
- (void)setFetchPredicate:(id)a3;
- (void)setFrc:(id)a3;
- (void)setInSwipeToDeleteMode:(BOOL)a3;
- (void)setRefreshControl:(id)a3;
- (void)setRowAnimation:(int64_t)a3;
- (void)setSectionName:(id)a3;
- (void)setSectionNameKeyPath:(id)a3;
- (void)setSortDescriptors:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTFetchedTableViewController

- (MTFetchedTableViewController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(MTFetchedTableViewController *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fetchPredicate, a4);
    objc_storeStrong((id *)&v13->_sortDescriptors, a5);
    objc_storeStrong((id *)&v13->_fetchEntityName, a3);
    v13->_rowAnimation = 0;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [(MTFetchedTableViewController *)v13 setRestorationIdentifier:v15];

    v16 = v13;
  }

  return v13;
}

- (MTFetchedTableViewController)initWithEntityName:(id)a3
{
  return [(MTFetchedTableViewController *)self initWithEntityName:a3 predicate:0 sortDescriptors:0];
}

- (void)dealloc
{
  [(UIBarButtonItem *)self->_editButtonItem_localIvar setTarget:0];
  v3.receiver = self;
  v3.super_class = (Class)MTFetchedTableViewController;
  [(MTFetchedTableViewController *)&v3 dealloc];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)MTFetchedTableViewController;
  [(MTFetchedTableViewController *)&v2 didReceiveMemoryWarning];
}

- (void)initializeFrc
{
  if (!self->_frc)
  {
    objc_super v3 = +[MTDB sharedInstance];
    v4 = [v3 mainQueueContext];

    v5 = [(MTFetchedTableViewController *)self fetchRequestInManagedObjectContext:v4];
    id v6 = [objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v5 managedObjectContext:v4 sectionNameKeyPath:self->_sectionNameKeyPath cacheName:0];
    [v6 setDelegate:self];
    id v10 = 0;
    unsigned int v7 = [v6 performFetch:&v10];
    id v8 = v10;
    id v9 = v8;
    if (v7) {
      [(MTFetchedTableViewController *)self setFrc:v6];
    }
    else {
      [v8 logAndThrow:1];
    }
  }
}

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (void)setChangeIsUserDriven:(BOOL)a3
{
  int64_t userDrivenCounter = self->_userDrivenCounter;
  if (a3) {
    int64_t v4 = userDrivenCounter + 1;
  }
  else {
    int64_t v4 = userDrivenCounter - 1;
  }
  self->_int64_t userDrivenCounter = v4;
}

- (BOOL)changeIsUserDriven
{
  return self->_userDrivenCounter > 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTFetchedTableViewController *)self initializeFrc];
  v5.receiver = self;
  v5.super_class = (Class)MTFetchedTableViewController;
  [(MTFetchedTableViewController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTFetchedTableViewController;
  [(MTFetchedTableViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidLoad
{
  objc_super v3 = [(MTFetchedTableViewController *)self tableView];
  [v3 setRestorationIdentifier:@"FetchedResultsTableView"];

  v6.receiver = self;
  v6.super_class = (Class)MTFetchedTableViewController;
  [(MTFetchedTableViewController *)&v6 viewDidLoad];
  int64_t v4 = [(MTFetchedTableViewController *)self editButtonItem];
  editButtonItem_localIvar = self->_editButtonItem_localIvar;
  self->_editButtonItem_localIvar = v4;
}

- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(MTFetchedTableViewController *)self frc];
  unsigned int v7 = [v8 fetchRequest];
  [v7 setSortDescriptors:v6];

  [(MTFetchedTableViewController *)self setSortDescriptors:v6];
  [(MTFetchedTableViewController *)self _updateTableAnimated:v4];
}

- (void)refetchWithPredicate:(id)a3
{
  id v4 = a3;
  id v6 = [(MTFetchedTableViewController *)self frc];
  objc_super v5 = [v6 fetchRequest];
  [v5 setPredicate:v4];

  [(MTFetchedTableViewController *)self setFetchPredicate:v4];
  [(MTFetchedTableViewController *)self _updateTableAnimated:1];
}

- (void)refetchWithPredicate:(id)a3 sortDescriptors:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v12 = [(MTFetchedTableViewController *)self frc];
  id v10 = [v12 fetchRequest];
  [v10 setPredicate:v9];

  [(MTFetchedTableViewController *)self setFetchPredicate:v9];
  id v11 = [v12 fetchRequest];
  [v11 setSortDescriptors:v8];

  [(MTFetchedTableViewController *)self setSortDescriptors:v8];
  [(MTFetchedTableViewController *)self _updateTableAnimated:v5];
}

- (id)reuseIdentifierForRow:(id)a3
{
  objc_super v3 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v3);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = a5;
    id v10 = [(MTFetchedTableViewController *)self frc];
    id v8 = [v10 managedObjectContext];
    id v9 = [v10 objectAtIndexPath:v7];

    if (v9)
    {
      [v8 deleteObject:v9];
      [v8 saveInCurrentBlock];
    }
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_inSwipeToDeleteMode = 1;
  [(MTFetchedTableViewController *)self setEditing:1 animated:1];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  self->_inSwipeToDeleteMode = 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = [(MTFetchedTableViewController *)self frc];
  id v4 = [v3 sections];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(MTFetchedTableViewController *)self frc];
  id v6 = [v5 sections];
  id v7 = [v6 objectAtIndex:a4];

  id v8 = [v7 numberOfObjects];
  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTFetchedTableViewController *)self reuseIdentifierForRow:v6];
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8];

  if (!v9) {
    id v9 = [(MTFetchedTableViewController *)self newCellInstanceWithReuseIdentifier:v8];
  }
  id v10 = [(MTFetchedTableViewController *)self frc];
  id v11 = [v10 objectAtIndexPath:v6];

  [(MTFetchedTableViewController *)self configureCell:v9 withObject:v11 atIndexPath:v6];

  return v9;
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:v3];

  return v4;
}

- (void)controllerWillChangeContent:(id)a3
{
  if (![(MTFetchedTableViewController *)self changeIsUserDriven])
  {
    id v4 = [(MTFetchedTableViewController *)self tableView];
    [v4 beginUpdates];
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  if (![(MTFetchedTableViewController *)self changeIsUserDriven])
  {
    id v4 = [(MTFetchedTableViewController *)self tableView];
    [v4 endUpdates];
  }
}

- (void)setRefreshControl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTFetchedTableViewController *)self refreshControl];
  id v6 = v4;
  if ((id)v5 == v4) {
    goto LABEL_4;
  }
  id v7 = (void *)v5;
  id v8 = [(MTFetchedTableViewController *)self refreshControl];
  unsigned int v9 = [v8 isRefreshing];

  if (v9)
  {
    id v6 = [(MTFetchedTableViewController *)self refreshControl];
    [v6 endRefreshing];
LABEL_4:
  }
  v10.receiver = self;
  v10.super_class = (Class)MTFetchedTableViewController;
  [(MTFetchedTableViewController *)&v10 setRefreshControl:v4];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v16 = a4;
  id v11 = a5;
  id v12 = a7;
  v13 = [(MTFetchedTableViewController *)self tableView];
  if (![(MTFetchedTableViewController *)self changeIsUserDriven])
  {
    switch(a6)
    {
      case 1uLL:
        goto LABEL_5;
      case 2uLL:
        v14 = +[NSArray arrayWithObject:v11];
        [v13 deleteRowsAtIndexPaths:v14 withRowAnimation:5];
        goto LABEL_8;
      case 3uLL:
        v15 = +[NSArray arrayWithObject:v11];
        [v13 deleteRowsAtIndexPaths:v15 withRowAnimation:5];

LABEL_5:
        v14 = +[NSArray arrayWithObject:v12];
        [v13 insertRowsAtIndexPaths:v14 withRowAnimation:5];
        goto LABEL_8;
      case 4uLL:
        v14 = [v13 cellForRowAtIndexPath:v11];
        if (v14) {
          [(MTFetchedTableViewController *)self configureCell:v14 withObject:v16 atIndexPath:v11];
        }
LABEL_8:

        break;
      default:
        break;
    }
  }
}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6
{
  id v10 = [(MTFetchedTableViewController *)self tableView];
  if (![(MTFetchedTableViewController *)self changeIsUserDriven])
  {
    if (a6 == 2)
    {
      unsigned int v9 = +[NSIndexSet indexSetWithIndex:a5];
      [v10 deleteSections:v9 withRowAnimation:5];
    }
    else
    {
      if (a6 != 1) {
        goto LABEL_7;
      }
      unsigned int v9 = +[NSIndexSet indexSetWithIndex:a5];
      [v10 insertSections:v9 withRowAnimation:5];
    }
  }
LABEL_7:
}

- (id)fetchRequestInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSFetchRequest);
  id v6 = [(MTFetchedTableViewController *)self sortDescriptors];
  if (v6)
  {
    [v5 setSortDescriptors:v6];
  }
  else
  {
    id v7 = +[NSArray array];
    [v5 setSortDescriptors:v7];
  }
  id v8 = [(MTFetchedTableViewController *)self fetchEntityName];
  unsigned int v9 = +[NSEntityDescription entityForName:v8 inManagedObjectContext:v4];

  [v5 setEntity:v9];
  id v10 = [(MTFetchedTableViewController *)self fetchPredicate];

  if (v10)
  {
    id v11 = [(MTFetchedTableViewController *)self fetchPredicate];
    [v5 setPredicate:v11];
  }

  return v5;
}

- (BOOL)hasSectionNameKeyPathChanged
{
  id v3 = [(NSFetchedResultsController *)self->_frc sectionNameKeyPath];
  id v4 = [(MTFetchedTableViewController *)self sectionNameKeyPath];

  if (v3 == v4) {
    return 0;
  }
  id v5 = [(NSFetchedResultsController *)self->_frc sectionNameKeyPath];
  id v6 = [(MTFetchedTableViewController *)self sectionNameKeyPath];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  return v7 ^ 1;
}

- (void)_updateTableAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MTFetchedTableViewController *)self hasSectionNameKeyPathChanged];
  if (v5)
  {
    [(NSFetchedResultsController *)self->_frc setDelegate:0];
    frc = self->_frc;
    self->_frc = 0;

    [(MTFetchedTableViewController *)self initializeFrc];
  }
  if (v3 && (id)[(MTFetchedTableViewController *)self rowAnimation] != (id)5)
  {
    if (v5)
    {
      id v11 = [(MTFetchedTableViewController *)self tableView];
      [v11 beginUpdates];

      id v12 = [(MTFetchedTableViewController *)self tableView];
      id v13 = [v12 numberOfSections];

      id v14 = [objc_alloc((Class)NSIndexSet) initWithIndexesInRange:0, v13];
      v15 = [(MTFetchedTableViewController *)self tableView];
      [v15 deleteSections:v14 withRowAnimation:0];

      id v16 = [(MTFetchedTableViewController *)self frc];
      v17 = [v16 sections];
      id v18 = [v17 count];

      v19 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v18);

      v20 = [(MTFetchedTableViewController *)self tableView];
      [v20 insertSections:v19 withRowAnimation:0];

      v21 = [(MTFetchedTableViewController *)self tableView];
      [v21 endUpdates];

      id v9 = 0;
      goto LABEL_31;
    }
    v22 = [(NSFetchedResultsController *)self->_frc fetchedObjects];
    id v23 = [v22 copy];

    v24 = +[NSSet setWithArray:v23];
    id v25 = [v24 mutableCopy];
    v26 = self->_frc;
    id v57 = 0;
    unsigned int v27 = [(NSFetchedResultsController *)v26 performFetch:&v57];
    id v9 = v57;
    if (v27)
    {
      char v50 = v27;
      v48 = [(NSFetchedResultsController *)self->_frc fetchedObjects];
      v51 = +[NSSet setWithArray:](NSSet, "setWithArray:");
      [v25 minusSet:];
      v28 = objc_opt_new();
      v52 = objc_opt_new();
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v49 = v25;
      id v29 = v25;
      id v30 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v54;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v54 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v23 indexOfObject:*(void *)(*((void *)&v53 + 1) + 8 * i)], 0);
            [v28 addObject:v34];
          }
          id v31 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v31);
      }

      v35 = (char *)[v51 count];
      if (v35)
      {
        v36 = v35;
        for (j = 0; j != v36; ++j)
        {
          v38 = [v48 objectAtIndex:j];
          unsigned __int8 v39 = [v23 containsObject:v38];

          if ((v39 & 1) == 0)
          {
            v40 = +[NSIndexPath indexPathForRow:j inSection:0];
            [v52 addObject:v40];
          }
        }
      }
      v41 = [(MTFetchedTableViewController *)self tableView];
      [v41 beginUpdates];

      if ([v52 count]
        || [v28 count]
        || ([v48 isEqualToArray:v23] & 1) != 0)
      {
        v42 = [(MTFetchedTableViewController *)self tableView];
        [v42 insertRowsAtIndexPaths:v52 withRowAnimation:[self rowAnimation]];

        id v43 = [(MTFetchedTableViewController *)self tableView];
        [v43 deleteRowsAtIndexPaths:v28 withRowAnimation:[self rowAnimation]];
      }
      else
      {
        v45 = [(MTFetchedTableViewController *)self tableView];
        id v46 = [v45 numberOfSections];

        id v43 = [objc_alloc((Class)NSIndexSet) initWithIndexesInRange:0, v46];
        v47 = [(MTFetchedTableViewController *)self tableView];
        [v47 reloadSections:v43 withRowAnimation:0];
      }
      id v25 = v49;

      v44 = [(MTFetchedTableViewController *)self tableView];
      [v44 endUpdates];

      LOBYTE(v27) = v50;
    }

    if ((v27 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    [(MTFetchedTableViewController *)self setChangeIsUserDriven:1];
    unsigned __int8 v7 = self->_frc;
    id v58 = 0;
    unsigned int v8 = [(NSFetchedResultsController *)v7 performFetch:&v58];
    id v9 = v58;
    if (v8)
    {
      id v10 = [(MTFetchedTableViewController *)self tableView];
      [v10 reloadData];
    }
    [(MTFetchedTableViewController *)self setChangeIsUserDriven:0];
    if ((v8 & 1) == 0)
    {
LABEL_8:
      if (v9) {
        [v9 logAndThrow:1];
      }
    }
  }
LABEL_31:
}

- (void)reloadVisibleCellsWithAnimation:(int64_t)a3
{
  id v7 = [(MTFetchedTableViewController *)self tableView];
  unsigned int v5 = [(MTFetchedTableViewController *)self tableView];
  id v6 = [v5 indexPathsForVisibleRows];
  [v7 reloadRowsAtIndexPaths:v6 withRowAnimation:a3];
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTFetchedTableViewController;
  [(MTFetchedTableViewController *)&v3 encodeRestorableStateWithCoder:a3];
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTFetchedTableViewController;
  [(MTFetchedTableViewController *)&v4 decodeRestorableStateWithCoder:a3];
  [(MTFetchedTableViewController *)self initializeFrc];
}

- (NSString)fetchEntityName
{
  return self->_fetchEntityName;
}

- (void)setFetchEntityName:(id)a3
{
}

- (NSPredicate)fetchPredicate
{
  return self->_fetchPredicate;
}

- (void)setFetchPredicate:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (void)setSectionName:(id)a3
{
}

- (int64_t)rowAnimation
{
  return self->_rowAnimation;
}

- (void)setRowAnimation:(int64_t)a3
{
  self->_rowAnimation = a3;
}

- (void)setFrc:(id)a3
{
}

- (BOOL)inSwipeToDeleteMode
{
  return self->_inSwipeToDeleteMode;
}

- (void)setInSwipeToDeleteMode:(BOOL)a3
{
  self->_inSwipeToDeleteMode = a3;
}

- (NSString)sectionNameKeyPath
{
  return self->_sectionNameKeyPath;
}

- (void)setSectionNameKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionNameKeyPath, 0);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_sectionName, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_fetchPredicate, 0);
  objc_storeStrong((id *)&self->_fetchEntityName, 0);

  objc_storeStrong((id *)&self->_editButtonItem_localIvar, 0);
}

@end