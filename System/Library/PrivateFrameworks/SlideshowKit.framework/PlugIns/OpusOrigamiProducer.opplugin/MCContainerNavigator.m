@interface MCContainerNavigator
- (MCContainerNavigator)init;
- (MCContainerNavigator)initWithImprint:(id)a3 andMontage:(id)a4;
- (MCPlugHaven)startPlug;
- (NSSet)plugs;
- (NSString)startPlugID;
- (id)imprint;
- (id)plugForID:(id)a3;
- (id)setPlugForContainer:(id)a3 forID:(id)a4;
- (unint64_t)countOfPlugs;
- (void)changeIDOfPlug:(id)a3 toID:(id)a4;
- (void)demolish;
- (void)removeAllPlugs;
- (void)removePlug:(id)a3;
- (void)removePlugForID:(id)a3;
- (void)setStartPlugID:(id)a3;
@end

@implementation MCContainerNavigator

- (MCContainerNavigator)init
{
  v4.receiver = self;
  v4.super_class = (Class)MCContainerNavigator;
  v2 = [(MCContainer *)&v4 init];
  if (v2) {
    v2->mPlugs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (MCContainerNavigator)initWithImprint:(id)a3 andMontage:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)MCContainerNavigator;
  v6 = -[MCContainer initWithImprint:andMontage:](&v20, "initWithImprint:andMontage:");
  if (v6)
  {
    id v15 = a3;
    id v7 = [a3 objectForKey:@"plugs"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[MCObject objectWithImprint:*(void *)(*((void *)&v16 + 1) + 8 * (void)v11) andMontage:a4];
          [(NSMutableDictionary *)v6->mPlugs setObject:v12 forKey:[(MCObject *)v12 idInSupercontainer]];
          [(MCObject *)v12 setSupercontainer:v6];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }
    v13 = (NSString *)[v15 objectForKey:@"startPlugID"];
    v6->mStartPlugID = v13;
    v6->mStartPlug = (MCPlugHaven *)[(NSMutableDictionary *)v6->mPlugs objectForKey:v13];
  }
  return v6;
}

- (void)demolish
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mStartPlugID = 0;
  self->mStartPlug = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMutableDictionary *)self->mPlugs objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) demolish];
      }
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->mPlugs = 0;
  objc_sync_exit(mPlugs);
  v8.receiver = self;
  v8.super_class = (Class)MCContainerNavigator;
  [(MCContainer *)&v8 demolish];
}

- (id)imprint
{
  v17.receiver = self;
  v17.super_class = (Class)MCContainerNavigator;
  id v3 = [(MCContainer *)&v17 imprint];
  id v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(MCContainerNavigator *)self plugs];
  id v7 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "imprint"));
      }
      id v8 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }
  [v3 setObject:v5 forKey:@"plugs"];
  mStartPlugID = self->mStartPlugID;
  if (mStartPlugID) {
    [v3 setObject:mStartPlugID forKey:@"startPlugID"];
  }
  return v3;
}

- (NSSet)plugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  if ([(NSMutableDictionary *)self->mPlugs count]) {
    id v4 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", -[NSMutableDictionary allValues](self->mPlugs, "allValues"));
  }
  else {
    id v4 = (NSSet *)sEmptySet;
  }
  objc_sync_exit(mPlugs);
  return v4;
}

- (unint64_t)countOfPlugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  id v4 = [(NSMutableDictionary *)self->mPlugs count];
  objc_sync_exit(mPlugs);
  return (unint64_t)v4;
}

- (id)plugForID:(id)a3
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  id v6 = [(NSMutableDictionary *)self->mPlugs objectForKey:a3];
  objc_sync_exit(mPlugs);
  return v6;
}

- (id)setPlugForContainer:(id)a3 forID:(id)a4
{
  [(MCContainerNavigator *)self removePlugForID:a4];
  id v7 = [(MCObject *)[MCPlugHaven alloc] initFromScratchWithMontage:self->super.super.mMontage];
  [v7 setSupercontainer:self];
  [v7 setContainer:a3];
  [v7 setIDInSupercontainer:a4];
  id v8 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v7, 0);
  [(MCContainerNavigator *)self willChangeValueForKey:@"plugs" withSetMutation:1 usingObjects:v8];
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  [(NSMutableDictionary *)self->mPlugs setObject:v7 forKey:a4];
  if (!self->mStartPlugID)
  {
    long long v10 = (NSString *)a4;
    self->mStartPlugID = v10;
    self->mStartPlug = (MCPlugHaven *)[(NSMutableDictionary *)self->mPlugs objectForKey:v10];
  }
  objc_sync_exit(mPlugs);
  [(MCContainerNavigator *)self didChangeValueForKey:@"plugs" withSetMutation:1 usingObjects:v8];

  return v7;
}

- (void)changeIDOfPlug:(id)a3 toID:(id)a4
{
  id v7 = [a3 idInSupercontainer];
  if (([a4 isEqualToString:v7] & 1) == 0)
  {
    mPlugs = self->mPlugs;
    objc_sync_enter(mPlugs);
    id v9 = v7;
    [(NSMutableDictionary *)self->mPlugs setObject:a3 forKey:a4];
    [(NSMutableDictionary *)self->mPlugs removeObjectForKey:v7];

    [a3 setIDInSupercontainer:a4];
    objc_sync_exit(mPlugs);
  }
}

- (void)removePlug:(id)a3
{
  id v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", a3, 0);
  -[MCContainerNavigator willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", @"plugs", 2);
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  if (objc_msgSend(objc_msgSend(a3, "idInSupercontainer"), "isEqualToString:", self->mStartPlugID))
  {

    self->mStartPlugID = 0;
    self->mStartPlug = 0;
  }
  -[NSMutableDictionary removeObjectForKey:](self->mPlugs, "removeObjectForKey:", [a3 idInSupercontainer]);
  objc_sync_exit(mPlugs);
  [(MCContainerNavigator *)self didChangeValueForKey:@"plugs" withSetMutation:2 usingObjects:v6];
  [a3 setContainer:0];
  [a3 setSupercontainer:0];
}

- (void)removePlugForID:(id)a3
{
  id v4 = [(MCContainerNavigator *)self plugForID:a3];
  if (v4)
  {
    [(MCContainerNavigator *)self removePlug:v4];
  }
}

- (void)removeAllPlugs
{
  id v3 = [(MCContainerNavigator *)self plugs];
  [(MCContainerNavigator *)self willChangeValueForKey:@"plugs" withSetMutation:2 usingObjects:v3];
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mStartPlugID = 0;
  self->mStartPlug = 0;
  [(NSMutableDictionary *)self->mPlugs removeAllObjects];
  objc_sync_exit(mPlugs);
  [(MCContainerNavigator *)self didChangeValueForKey:@"plugs" withSetMutation:2 usingObjects:v3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setContainer:0];
        [v8 setSupercontainer:0];
      }
      id v5 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setStartPlugID:(id)a3
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  mStartPlugID = self->mStartPlugID;
  if (a3)
  {
    if (mStartPlugID) {

    }
    id v7 = (NSString *)a3;
    self->mStartPlugID = v7;
    id v8 = (MCPlugHaven *)[(NSMutableDictionary *)self->mPlugs objectForKey:v7];
  }
  else if (mStartPlugID)
  {

    id v8 = 0;
    self->mStartPlugID = 0;
  }
  else
  {
    id v8 = 0;
  }
  self->mStartPlug = v8;
  objc_sync_exit(mPlugs);
}

- (NSString)startPlugID
{
  return self->mStartPlugID;
}

- (MCPlugHaven)startPlug
{
  return self->mStartPlug;
}

@end