@interface NSOperation
- (BOOL)isPending;
- (id)debugDescription;
- (id)description;
- (id)pendingDependenciesString:(id)a3;
- selfname;
- (void)addNullableDependency:(id)a3;
- (void)linearDependencies:(id)a3;
- (void)linearDependenciesWithSelfFirst:(id)a3;
- (void)removeDependenciesUponCompletion;
@end

@implementation NSOperation

- (void)removeDependenciesUponCompletion
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100150630;
  v3[3] = &unk_1003077A0;
  objc_copyWeak(&v4, &location);
  [(NSOperation *)self setCompletionBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)addNullableDependency:(id)a3
{
  if (a3) {
    -[NSOperation addDependency:](self, "addDependency:");
  }
}

- (BOOL)isPending
{
  if ([(NSOperation *)self isExecuting] || [(NSOperation *)self isFinished]) {
    return 0;
  }
  else {
    return ![(NSOperation *)self isCancelled];
  }
}

- (id)debugDescription
{
  if ([(NSOperation *)self isFinished])
  {
    v3 = @"finished";
  }
  else if ([(NSOperation *)self isCancelled])
  {
    v3 = @"cancelled";
  }
  else if ([(NSOperation *)self isExecuting])
  {
    v3 = @"executing";
  }
  else
  {
    unsigned int v4 = [(NSOperation *)self isReady];
    v3 = @"pending";
    if (v4) {
      v3 = @"ready";
    }
  }
  v5 = v3;
  v6 = [(NSOperation *)self selfname];
  v7 = [(NSOperation *)self pendingDependenciesString:@" dep:"];
  v8 = +[NSString stringWithFormat:@"<%@ (%p): %@%@>", v6, self, v5, v7];

  return v8;
}

- (id)description
{
  if ([(NSOperation *)self isFinished])
  {
    v3 = @"finished";
  }
  else if ([(NSOperation *)self isCancelled])
  {
    v3 = @"cancelled";
  }
  else if ([(NSOperation *)self isExecuting])
  {
    v3 = @"executing";
  }
  else
  {
    unsigned int v4 = [(NSOperation *)self isReady];
    v3 = @"pending";
    if (v4) {
      v3 = @"ready";
    }
  }
  v5 = v3;
  v6 = [(NSOperation *)self selfname];
  v7 = [(NSOperation *)self pendingDependenciesString:@" dep:"];
  v8 = +[NSString stringWithFormat:@"<%@: %@%@>", v6, v5, v7];

  return v8;
}

- (id)pendingDependenciesString:(id)a3
{
  id v4 = a3;
  v6 = [(NSOperation *)self dependencies];
  id v7 = [v6 copy];

  v8 = [v7 indexesOfObjectsPassingTest:&stru_100304EA0];
  v9 = [v7 objectsAtIndexes:v8];

  if ([v9 count])
  {
    off_10035CA78();
    if (*v10 < 0x15u)
    {
      v12 = v10;
      v24 = v5;
      ++*v10;
      v13 = +[NSMutableArray array];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v14 = v9;
      id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v26;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v21 = [v19 description];
            [v13 addObject:v21];
          }
          id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v16);
      }

      --*v12;
      v22 = [v13 componentsJoinedByString:@", "];
      v11 = +[NSString stringWithFormat:@"%@%@", v4, v22];

      v5 = v24;
    }
    else
    {
      v11 = +[NSString stringWithFormat:@"<recursion too deep>"];
    }
  }
  else
  {
    v11 = &stru_10030AA90;
  }

  return v11;
}

- (void)linearDependenciesWithSelfFirst:(id)a3
{
  id v4 = a3;
  objc_sync_enter(v4);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(NSOperation **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (v9 != self)
        {
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "isPending", (void)v10))
          {
            [(NSOperation *)v9 addDependency:self];
            if ([(NSOperation *)v9 isPending]) {
              goto LABEL_11;
            }
            [(NSOperation *)v9 removeDependency:self];
          }
          [(NSOperation *)self addDependency:v9];
        }
LABEL_11:
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [v5 addObject:self];
  objc_sync_exit(v5);
}

- (void)linearDependencies:(id)a3
{
  id v4 = a3;
  objc_sync_enter(v4);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(NSOperation **)(*((void *)&v10 + 1) + 8 * (void)v8) != self) {
          [(NSOperation *)self addDependency:(void)v10];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v6);
  }

  [v5 addObject:self];
  if ((unint64_t)[v5 count] >= 0x65)
  {
    v9 = sub_10000B070("SecError");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = 100;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ckks-operation: linear dependencies exceeds %d operations", buf, 8u);
    }
  }
  objc_sync_exit(v5);
}

- selfname
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t vars8;

  v3 = [(NSOperation *)self name];

  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  if (v3) {
    id v5 = {;
  }
    id v6 = [(NSOperation *)self name];
    uint64_t v7 = +[NSString stringWithFormat:@"%@(%@)", v5, v6];
  }
  else {
    uint64_t v7 = {;
  }
  }

  return v7;
}

@end