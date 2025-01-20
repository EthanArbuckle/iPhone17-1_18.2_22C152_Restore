@interface MTCoreDataResultsWithExtrasController
- (BOOL)_hasResults;
- (MTResultsChangeGenerator)changeGenerator;
- (id)_extraObjects;
- (id)allObjects;
- (unint64_t)numberOfExtraObjects;
- (unint64_t)numberOfResults;
- (void)_initializeFrc;
- (void)controllerDidChangeContent:(id)a3;
- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)setChangeGenerator:(id)a3;
- (void)setNumberOfExtraObjects:(unint64_t)a3;
- (void)setNumberOfResults:(unint64_t)a3;
@end

@implementation MTCoreDataResultsWithExtrasController

- (void)_initializeFrc
{
  v5.receiver = self;
  v5.super_class = (Class)MTCoreDataResultsWithExtrasController;
  [(MTCoreDataResultsController *)&v5 _initializeFrc];
  v3 = [(MTCoreDataResultsController *)self frc];
  v4 = [v3 fetchedObjects];
  -[MTCoreDataResultsWithExtrasController setNumberOfResults:](self, "setNumberOfResults:", [v4 count]);
}

- (id)allObjects
{
  v7.receiver = self;
  v7.super_class = (Class)MTCoreDataResultsWithExtrasController;
  v3 = [(MTCoreDataResultsController *)&v7 allObjects];
  if ([v3 count])
  {
    v4 = [(MTCoreDataResultsWithExtrasController *)self _extraObjects];
    if ([v4 count])
    {
      uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

      v3 = (void *)v5;
    }
  }

  return v3;
}

- (id)_extraObjects
{
  v3 = objc_opt_new();
  unint64_t v4 = [(MTCoreDataResultsWithExtrasController *)self numberOfExtraObjects];
  if (v4)
  {
    unint64_t v5 = v4;
    do
    {
      v6 = +[NSUUID UUID];
      [v3 addObject:v6];

      --v5;
    }
    while (v5);
  }
  id v7 = [v3 copy];

  return v7;
}

- (BOOL)_hasResults
{
  return [(MTCoreDataResultsWithExtrasController *)self numberOfResults] != 0;
}

- (MTResultsChangeGenerator)changeGenerator
{
  changeGenerator = self->_changeGenerator;
  if (!changeGenerator)
  {
    unint64_t v4 = [[MTResultsChangeGenerator alloc] initWithDelegate:self];
    unint64_t v5 = self->_changeGenerator;
    self->_changeGenerator = v4;

    changeGenerator = self->_changeGenerator;
  }

  return changeGenerator;
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MTCoreDataResultsController *)self frc];
  v6 = [v5 fetchedObjects];

  id v7 = [v6 count];
  if ((v7 != 0) != [(MTCoreDataResultsWithExtrasController *)self _hasResults])
  {
    v8 = [(MTCoreDataResultsWithExtrasController *)self _extraObjects];
    v9 = [v6 arrayByAddingObjectsFromArray:v8];

    if (v7) {
      v10 = v6;
    }
    else {
      v10 = v9;
    }
    if (v7) {
      v11 = v9;
    }
    else {
      v11 = v6;
    }
    id v12 = v11;
    id v13 = v10;
    v14 = [(MTCoreDataResultsWithExtrasController *)self changeGenerator];
    [v14 generateChangesForExistingObjects:v13 newObjects:v12 inSection:0];
  }
  v15.receiver = self;
  v15.super_class = (Class)MTCoreDataResultsWithExtrasController;
  [(MTCoreDataResultsController *)&v15 controllerDidChangeContent:v4];
  [(MTCoreDataResultsWithExtrasController *)self setNumberOfResults:v7];
}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v15 = a4;
  id v11 = a5;
  id v12 = a7;
  if (v11 && a6 == 2 && [(MTCoreDataResultsWithExtrasController *)self _hasResults])
  {
    uint64_t v13 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v11 row]+ -[MTCoreDataResultsWithExtrasController numberOfResults](self, "numberOfResults"), objc_msgSend(v11, "section"));

    id v11 = (id)v13;
  }
  v14 = [(MTCoreDataResultsController *)self frc];
  [(MTCoreDataResultsController *)self controller:v14 didChangeObject:v15 atIndexPath:v11 forChangeType:a6 newIndexPath:v12];
}

- (unint64_t)numberOfExtraObjects
{
  return self->_numberOfExtraObjects;
}

- (void)setNumberOfExtraObjects:(unint64_t)a3
{
  self->_numberOfExtraObjects = a3;
}

- (void)setChangeGenerator:(id)a3
{
}

- (unint64_t)numberOfResults
{
  return self->_numberOfResults;
}

- (void)setNumberOfResults:(unint64_t)a3
{
  self->_numberOfResults = a3;
}

- (void).cxx_destruct
{
}

@end