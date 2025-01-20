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

- selfname
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t vars8;

  v3 = [(NSOperation *)self name];

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  if (v3) {
    v5 = {;
  }
    v6 = [(NSOperation *)self name];
    v7 = +[NSString stringWithFormat:@"%@(%@)", v5, v6];
  }
  else {
    v7 = {;
  }
  }

  return v7;
}

- (void)linearDependencies:(id)a3
{
  id v4 = a3;
  objc_sync_enter(v4);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(NSOperation **)(*((void *)&v9 + 1) + 8 * (void)v8) != self) {
          [(NSOperation *)self addDependency:(void)v9];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [v5 addObject:self];
  objc_sync_exit(v5);
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
        long long v9 = *(NSOperation **)(*((void *)&v10 + 1) + 8 * (void)v8);
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

- (id)pendingDependenciesString:(id)a3
{
  id v4 = a3;
  id v5 = [(NSOperation *)self dependencies];
  id v6 = [v5 copy];

  uint64_t v7 = [v6 indexesOfObjectsPassingTest:&stru_1002CA0F0];
  v8 = [v6 objectsAtIndexes:v7];

  if ([v8 count])
  {
    long long v9 = [v8 componentsJoinedByString:@", "];
    long long v10 = +[NSString stringWithFormat:@"%@%@", v4, v9];
  }
  else
  {
    long long v10 = &stru_1002CE4C0;
  }

  return v10;
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
  id v5 = v3;
  id v6 = [(NSOperation *)self selfname];
  uint64_t v7 = [(NSOperation *)self pendingDependenciesString:@" dep:"];
  v8 = +[NSString stringWithFormat:@"<%@: %@%@>", v6, v5, v7];

  return v8;
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
  id v5 = v3;
  id v6 = [(NSOperation *)self selfname];
  uint64_t v7 = [(NSOperation *)self pendingDependenciesString:@" dep:"];
  v8 = +[NSString stringWithFormat:@"<%@ (%p): %@%@>", v6, self, v5, v7];

  return v8;
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

- (void)addNullableDependency:(id)a3
{
  if (a3) {
    -[NSOperation addDependency:](self, "addDependency:");
  }
}

- (void)removeDependenciesUponCompletion
{
  id location = 0;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10020CB80;
  v3[3] = &unk_1002B72D8;
  objc_copyWeak(&v4, &location);
  [(NSOperation *)self setCompletionBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

@end