@interface MTCompositeResultsController
+ (id)controllerWithControllers:(id)a3;
- (BOOL)hasObjects;
- (MTCompositeResultsController)initWithControllers:(id)a3;
- (NSArray)controllers;
- (id)allObjects;
- (id)controllerAtIndex:(unint64_t)a3;
- (id)delegate;
- (id)indexPathForObject:(id)a3;
- (id)indexPathsForObject:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (unint64_t)indexOfController:(id)a3;
- (unint64_t)numberOfObjectsInSection:(unint64_t)a3;
- (void)_setControllers:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)reloadData;
- (void)setDelegate:(id)a3;
@end

@implementation MTCompositeResultsController

+ (id)controllerWithControllers:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithControllers:v3];

  return v4;
}

- (MTCompositeResultsController)initWithControllers:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTCompositeResultsController;
  v5 = [(MTCompositeResultsController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MTCompositeResultsController *)v5 _setControllers:v4];
  }

  return v6;
}

- (void)_setControllers:(id)a3
{
  v5 = (NSArray *)a3;
  controllers = self->_controllers;
  if (controllers != v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = controllers;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * (void)v11) setDelegate:0];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = v5;
    id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) setDelegate:self];
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    objc_storeStrong((id *)&self->_controllers, a3);
  }
}

- (void)reloadData
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(MTCompositeResultsController *)self controllers];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) reloadData];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)indexPathForObject:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_100056E80;
  v16 = sub_100057218;
  id v17 = 0;
  uint64_t v5 = [(MTCompositeResultsController *)self controllers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007AA58;
  v9[3] = &unk_10054E730;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = -[MTCompositeResultsController controllerAtIndex:](self, "controllerAtIndex:", [v4 section]);
    if (v6)
    {
      id v7 = [v6 objectAtIndex:[v5 row]];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  id v3 = [(MTCompositeResultsController *)self controllerAtIndex:a3];
  id v4 = [v3 numberOfObjects];

  return (unint64_t)v4;
}

- (id)indexPathsForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  id v6 = [(MTCompositeResultsController *)self controllers];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10007ACC8;
  uint64_t v14 = &unk_10054E758;
  id v7 = v4;
  id v15 = v7;
  id v8 = v5;
  id v16 = v8;
  [v6 enumerateObjectsUsingBlock:&v11];

  if (objc_msgSend(v8, "count", v11, v12, v13, v14))
  {
    long long v9 = +[NSArray arrayWithArray:v8];
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (id)controllerAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(MTCompositeResultsController *)self controllers];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    id v8 = 0;
  }
  else
  {
    id v7 = [(MTCompositeResultsController *)self controllers];
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (unint64_t)indexOfController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTCompositeResultsController *)self controllers];
  id v6 = [v5 indexOfObject:v4];

  return (unint64_t)v6;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = [(MTCompositeResultsController *)self delegate];
  [v5 controllerWillChangeContent:v4];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = [(MTCompositeResultsController *)self delegate];
  [v5 controllerDidChangeContent:v4];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v21 = a5;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  unint64_t v15 = [(MTCompositeResultsController *)self indexOfController:v14];
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = +[IMLogger sharedLogger];
    [v16 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/FRC/MTCompositeResultsController.m", 142, @"Observed change for object %@ in section %@ but can't find the section index", v13, v14 lineNumber format];
  }
  else
  {
    unint64_t v17 = v15;
    id v18 = v21;
    if (v21)
    {
      uint64_t v19 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v21 row], v17);

      id v18 = (id)v19;
    }
    id v21 = v18;
    if (v12)
    {
      uint64_t v20 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v12 row], v17);

      id v12 = (id)v20;
    }
    id v16 = [(MTCompositeResultsController *)self delegate];
    [v16 controller:v14 didChangeObject:v13 atIndexPath:v21 forChangeType:a6 newIndexPath:v12];
  }
}

- (id)allObjects
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(MTCompositeResultsController *)self controllers];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) allObjects];
        if (v9) {
          [v3 addObjectsFromArray:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (BOOL)hasObjects
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(MTCompositeResultsController *)self controllers];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasObjects])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)controllers
{
  return self->_controllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllers, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end