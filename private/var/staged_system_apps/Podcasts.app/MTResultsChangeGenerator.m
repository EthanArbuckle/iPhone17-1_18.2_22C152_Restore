@interface MTResultsChangeGenerator
- (MTResultsChangeGenerator)initWithDelegate:(id)a3;
- (MTResultsChangeGeneratorDelegate)delegate;
- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5;
- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5 autoremove:(BOOL)a6;
- (id)box:(id)a3;
- (id)closestIndexPathToRow:(unint64_t)a3 forIndexPaths:(id)a4;
- (id)objectsToIndexPathDictionary:(id)a3 inSection:(unint64_t)a4;
- (id)unbox:(id)a3;
- (void)generateChangesForExistingObjects:(id)a3 newObjects:(id)a4 inSection:(unint64_t)a5;
- (void)removeIndexPath:(id)a3 forObject:(id)a4 fromMap:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation MTResultsChangeGenerator

- (MTResultsChangeGenerator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTResultsChangeGenerator;
  v5 = [(MTResultsChangeGenerator *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MTResultsChangeGenerator *)v5 setDelegate:v4];
  }

  return v6;
}

- (void)generateChangesForExistingObjects:(id)a3 newObjects:(id)a4 inSection:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v45 = [(MTResultsChangeGenerator *)self objectsToIndexPathDictionary:v8 inSection:a5];
    v41 = [(MTResultsChangeGenerator *)self objectsToIndexPathDictionary:v10 inSection:a5];
    id v11 = [v41 mutableCopy];
    v42 = v10;
    if ([v8 count])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = [v8 objectAtIndex:v12];
        v14 = +[NSIndexPath indexPathForRow:v12 inSection:a5];
        v15 = [(MTResultsChangeGenerator *)self bestIndexPathForObject:v13 atIndex:v12 fromMap:v11 autoremove:0];
        if (v15)
        {
          [(MTResultsChangeGenerator *)self removeIndexPath:v15 forObject:v13 fromMap:v11];
        }
        else
        {
          v16 = [(MTResultsChangeGenerator *)self delegate];
          [v16 generator:self didChangeObject:v13 atIndexPath:v14 forChangeType:2 newIndexPath:0];
        }
        ++v12;
      }
      while (v12 < (unint64_t)[v8 count]);
    }
    id v43 = v8;
    unint64_t v44 = a5;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = [v11 allKeys];
    id v17 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    v48 = v11;
    if (v17)
    {
      id v18 = v17;
      uint64_t v47 = *(void *)v54;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v54 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          v21 = [(MTResultsChangeGenerator *)self unbox:v20];
          v22 = [v11 objectForKey:v20];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v23 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v50;
            do
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v50 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
                v28 = [(MTResultsChangeGenerator *)self delegate];
                [v28 generator:self didChangeObject:v21 atIndexPath:0 forChangeType:1 newIndexPath:v27];
              }
              id v24 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }
            while (v24);
          }

          id v11 = v48;
        }
        id v18 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v18);
    }

    v10 = v42;
    id v8 = v43;
    unint64_t v29 = v44;
    v30 = &NSFileSize_ptr;
    if ([v42 count])
    {
      unint64_t v31 = 0;
      do
      {
        v32 = [v42 objectAtIndex:v31];
        v33 = [(NSFileAttributeKey *)(id)v30[264] indexPathForRow:v31 inSection:v29];
        v34 = [(MTResultsChangeGenerator *)self bestIndexPathForObject:v32 atIndex:v31 fromMap:v45];
        v35 = v34;
        if (v34)
        {
          unsigned int v36 = [v34 isEqual:v33];
          v37 = [(MTResultsChangeGenerator *)self delegate];
          v38 = v37;
          BOOL v39 = v36 == 0;
          unint64_t v29 = v44;
          if (v39) {
            uint64_t v40 = 3;
          }
          else {
            uint64_t v40 = 4;
          }
          [v37 generator:self didChangeObject:v32 atIndexPath:v35 forChangeType:v40 newIndexPath:v33];

          v30 = &NSFileSize_ptr;
        }

        ++v31;
      }
      while (v31 < (unint64_t)[v42 count]);
    }
  }
}

- (id)objectsToIndexPathDictionary:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
  if ([v6 count])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = [v6 objectAtIndex:v8];
      v10 = [(MTResultsChangeGenerator *)self box:v9];
      id v11 = [v7 objectForKey:v10];
      if (!v11)
      {
        id v11 = objc_alloc_init((Class)NSMutableSet);
        [v7 setObject:v11 forKey:v10];
      }
      unint64_t v12 = +[NSIndexPath indexPathForRow:v8 inSection:a4];
      [v11 addObject:v12];

      ++v8;
    }
    while (v8 < (unint64_t)[v6 count]);
  }

  return v7;
}

- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5
{
  return [(MTResultsChangeGenerator *)self bestIndexPathForObject:a3 atIndex:a4 fromMap:a5 autoremove:1];
}

- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5 autoremove:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = [(MTResultsChangeGenerator *)self box:a3];
  unint64_t v12 = [v10 objectForKey:v11];
  v13 = v12;
  if (v12 && [v12 count])
  {
    if ([v13 count] == (id)1)
    {
      v14 = [v13 anyObject];
      if (v6) {
        [v10 removeObjectForKey:v11];
      }
    }
    else
    {
      uint64_t v16 = [(MTResultsChangeGenerator *)self closestIndexPathToRow:a4 forIndexPaths:v13];
      v14 = (void *)v16;
      if (v6 && v16) {
        [v13 removeObject:v16];
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)removeIndexPath:(id)a3 forObject:(id)a4 fromMap:(id)a5
{
  if (a3 && a4 && a5)
  {
    id v8 = a5;
    id v9 = a3;
    id v11 = [(MTResultsChangeGenerator *)self box:a4];
    id v10 = [v8 objectForKey:v11];

    [v10 removeObject:v9];
  }
}

- (id)closestIndexPathToRow:(unint64_t)a3 forIndexPaths:(id)a4
{
  id v5 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    unint64_t v10 = -1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = (char *)[v12 row];
        if ((uint64_t)&v13[-a3] >= 0) {
          v14 = &v13[-a3];
        }
        else {
          v14 = (char *)(a3 - (void)v13);
        }
        if (!v8 || (unint64_t)v14 < v10)
        {
          id v15 = v12;

          unint64_t v10 = (unint64_t)v14;
          id v8 = v15;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)box:(id)a3
{
  id v3 = a3;
  id v4 = [[MTResultsChangeWrapper alloc] initWithObject:v3];

  return v4;
}

- (id)unbox:(id)a3
{
  return [a3 object];
}

- (MTResultsChangeGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTResultsChangeGeneratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end