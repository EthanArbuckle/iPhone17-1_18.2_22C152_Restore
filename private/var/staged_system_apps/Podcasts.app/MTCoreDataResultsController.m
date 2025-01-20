@interface MTCoreDataResultsController
- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyKeys:(id)a6;
- (MTCoreDataResultsController)initWithFetchRequest:(id)a3;
- (MTCoreDataResultsController)initWithFetchRequest:(id)a3 propertyKeys:(id)a4;
- (MTFetchedResultsControllerProtocol)frc;
- (NSArray)propertyKeys;
- (NSArray)sortDescriptors;
- (NSFetchRequest)fetchRequest;
- (NSPredicate)predicate;
- (id)allObjects;
- (id)indexPathForObject:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (void)_initializeFrc;
- (void)_setFrc:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)reloadData;
- (void)setFetchRequest:(id)a3;
- (void)setFrc:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setPropertyKeys:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation MTCoreDataResultsController

- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return [(MTCoreDataResultsController *)self initWithEntityName:a3 predicate:a4 sortDescriptors:a5 propertyKeys:0];
}

- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyKeys:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:v10];
  if ((id)kMTPodcastEntityName == v10)
  {
    v15 = +[MTPodcast predicateForSyncablePodcastsForSyncType:0];
  }
  else
  {
    if ((id)kMTEpisodeEntityName != v10) {
      goto LABEL_6;
    }
    v15 = +[MTEpisode predicateForRSSEpisodes];
  }
  v16 = v15;
  uint64_t v17 = [v15 AND:v11];

  id v11 = (id)v17;
LABEL_6:
  [v14 setPredicate:v11];
  if (v13) {
    v18 = v13;
  }
  else {
    v18 = &__NSArray0__struct;
  }
  [v14 setSortDescriptors:v18];

  v19 = [(MTCoreDataResultsController *)self initWithFetchRequest:v14 propertyKeys:v12];
  return v19;
}

- (MTCoreDataResultsController)initWithFetchRequest:(id)a3
{
  return [(MTCoreDataResultsController *)self initWithFetchRequest:a3 propertyKeys:0];
}

- (MTCoreDataResultsController)initWithFetchRequest:(id)a3 propertyKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTCoreDataResultsController;
  v8 = [(MTCoreDataResultsController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MTCoreDataResultsController *)v8 setFetchRequest:v6];
    [(MTCoreDataResultsController *)v9 setPropertyKeys:v7];
    [(MTCoreDataResultsController *)v9 _initializeFrc];
  }

  return v9;
}

- (void)dealloc
{
  [(MTCoreDataResultsController *)self _setFrc:0];
  v3.receiver = self;
  v3.super_class = (Class)MTCoreDataResultsController;
  [(MTCoreDataResultsController *)&v3 dealloc];
}

- (void)setPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(MTCoreDataResultsController *)self fetchRequest];
  [v5 setPredicate:v4];
}

- (NSPredicate)predicate
{
  v2 = [(MTCoreDataResultsController *)self fetchRequest];
  objc_super v3 = [v2 predicate];

  return (NSPredicate *)v3;
}

- (void)setSortDescriptors:(id)a3
{
  id v4 = &__NSArray0__struct;
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  id v6 = [(MTCoreDataResultsController *)self fetchRequest];
  [v6 setSortDescriptors:v5];
}

- (NSArray)sortDescriptors
{
  v2 = [(MTCoreDataResultsController *)self fetchRequest];
  objc_super v3 = [v2 sortDescriptors];

  return (NSArray *)v3;
}

- (void)reloadData
{
  [(MTCoreDataResultsController *)self setFrc:0];

  [(MTCoreDataResultsController *)self _initializeFrc];
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(MTCoreDataResultsController *)self frc];
    id v6 = [v5 fetchedObjects];
    id v7 = [v6 count];

    if ([v4 section] || objc_msgSend(v4, "row") >= v7)
    {
      v8 = +[IMLogger sharedLogger];
      [v8 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/FRC/MTCoreDataResultsController.m", 111, @"Unable to retrieve object for index path %@ with total number of objects %ld", v4, v7 lineNumber format];
      v9 = 0;
    }
    else
    {
      v8 = [(MTCoreDataResultsController *)self frc];
      v9 = [v8 objectAtIndexPath:v4];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)indexPathForObject:(id)a3
{
  id v4 = a3;
  id v5 = [(MTCoreDataResultsController *)self frc];
  id v6 = [v5 indexPathForObject:v4];

  return v6;
}

- (id)allObjects
{
  v2 = [(MTCoreDataResultsController *)self frc];
  objc_super v3 = [v2 fetchedObjects];

  return v3;
}

- (void)_initializeFrc
{
  if (!self->_frc)
  {
    objc_super v3 = +[MTDB sharedInstance];
    id v4 = [v3 mainQueueContext];

    id v5 = [(MTCoreDataResultsController *)self propertyKeys];
    id v6 = [v5 count];

    if (v6)
    {
      id v7 = objc_alloc((Class)MTFetchedResultsController);
      v8 = [(MTCoreDataResultsController *)self fetchRequest];
      id v9 = [v7 initWithFetchRequest:v8 managedObjectContext:v4 sectionNameKeyPath:0 cacheName:0];

      id v10 = [(MTCoreDataResultsController *)self propertyKeys];
      [v9 setPropertyKeys:v10];
    }
    else
    {
      id v11 = objc_alloc((Class)NSFetchedResultsController);
      id v10 = [(MTCoreDataResultsController *)self fetchRequest];
      id v9 = [v11 initWithFetchRequest:v10 managedObjectContext:v4 sectionNameKeyPath:0 cacheName:0];
    }

    [v9 setDelegate:self];
    id v15 = 0;
    unsigned int v12 = [v9 performFetch:&v15];
    id v13 = v15;
    id v14 = v13;
    if (v12) {
      [(MTCoreDataResultsController *)self setFrc:v9];
    }
    else {
      [v13 logAndThrow:1];
    }
  }
}

- (void)_setFrc:(id)a3
{
  id v5 = (MTFetchedResultsControllerProtocol *)a3;
  frc = self->_frc;
  id v7 = v5;
  if (frc != v5)
  {
    [(MTFetchedResultsControllerProtocol *)frc setDelegate:0];
    [(MTFetchedResultsControllerProtocol *)v7 setDelegate:self];
    objc_storeStrong((id *)&self->_frc, a3);
  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(MTResultsController *)self delegate];
  [v14 controller:self didChangeObject:v13 atIndexPath:v12 forChangeType:a6 newIndexPath:v11];
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = [(MTResultsController *)self delegate];
  [v4 controllerWillChangeContent:self];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = [(MTResultsController *)self delegate];
  [v4 controllerDidChangeContent:self];
}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (void)setPropertyKeys:(id)a3
{
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (MTFetchedResultsControllerProtocol)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);

  objc_storeStrong((id *)&self->_propertyKeys, 0);
}

@end