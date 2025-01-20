@interface MCContainerSerializer
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (MCContainerSerializer)init;
- (MCContainerSerializer)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSArray)orderedPlugs;
- (NSDictionary)initialTransitionAttributes;
- (NSSet)plugs;
- (NSString)initialTransitionID;
- (double)duration;
- (double)initialTransitionDuration;
- (double)timeInForPlug:(id)a3;
- (id)addPlugForContainer:(id)a3;
- (id)addPlugsForContainers:(id)a3;
- (id)imprint;
- (id)insertPlugForContainer:(id)a3 atIndex:(unint64_t)a4;
- (id)insertPlugsForContainers:(id)a3 atIndex:(unint64_t)a4;
- (id)plugAtIndex:(unint64_t)a3;
- (unint64_t)countOfPlugs;
- (void)demolish;
- (void)movePlugsAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllPlugs;
- (void)removePlugsAtIndices:(id)a3;
- (void)setInitialTransitionAttributes:(id)a3;
- (void)setInitialTransitionDuration:(double)a3;
- (void)setInitialTransitionID:(id)a3;
@end

@implementation MCContainerSerializer

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"orderedPlugs"]) {
    return +[NSSet setWithObjects:@"plugs", 0];
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MCContainerSerializer;
  return objc_msgSendSuper2(&v6, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCContainerSerializer)init
{
  v4.receiver = self;
  v4.super_class = (Class)MCContainerSerializer;
  v2 = [(MCContainer *)&v4 init];
  if (v2)
  {
    v2->mPlugs = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v2->mCachedDuration = -1.0;
  }
  return v2;
}

- (MCContainerSerializer)initWithImprint:(id)a3 andMontage:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)MCContainerSerializer;
  objc_super v6 = -[MCContainer initWithImprint:andMontage:](&v19, "initWithImprint:andMontage:");
  if (v6)
  {
    id v7 = [a3 objectForKey:@"plugs"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[MCObject objectWithImprint:*(void *)(*((void *)&v15 + 1) + 8 * i) andMontage:a4];
          [(NSMutableSet *)v6->mPlugs addObject:v12];
          [(MCObject *)v12 setSupercontainer:v6];
          if (![(MCObject *)v6 isSnapshot])
          {
            [(MCObject *)v12 addObserver:v6 forKeyPath:@"fullDuration" options:0 context:0];
            [(MCObject *)v12 addObserver:v6 forKeyPath:@"transitionDuration" options:0 context:0];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }
    v6->_initialTransitionID = (NSString *)[a3 objectForKey:@"initialTransitionID"];
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"initialTransitionDuration"), "doubleValue");
    v6->_initialTransitionDuration = v13;
    v6->_initialTransitionAttributes = (NSDictionary *)[a3 objectForKey:@"initialTransitionAttributes"];
  }
  return v6;
}

- (void)demolish
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v4 = self->mPlugs;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (![(MCObject *)self isSnapshot])
        {
          [v8 removeObserver:self forKeyPath:@"fullDuration"];
          [v8 removeObserver:self forKeyPath:@"transitionDuration"];
        }
        [v8 demolish];
      }
      id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  self->mPlugs = 0;
  self->mCachedOrderedPlugs = 0;
  objc_sync_exit(mPlugs);
  v9.receiver = self;
  v9.super_class = (Class)MCContainerSerializer;
  [(MCContainer *)&v9 demolish];
}

- (id)imprint
{
  v18.receiver = self;
  v18.super_class = (Class)MCContainerSerializer;
  id v3 = [(MCContainer *)&v18 imprint];
  id v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(MCContainerSerializer *)self plugs];
  id v7 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "imprint"));
      }
      id v8 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }
  [v3 setObject:v5 forKey:@"plugs"];
  initialTransitionID = self->_initialTransitionID;
  if (initialTransitionID) {
    [v3 setObject:initialTransitionID forKey:@"initialTransitionID"];
  }
  if (self->_initialTransitionDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"initialTransitionDuration");
  }
  initialTransitionAttributes = self->_initialTransitionAttributes;
  if (initialTransitionAttributes) {
    [v3 setObject:initialTransitionAttributes forKey:@"initialTransitionAttributes"];
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((objc_msgSend(a3, "isEqualToString:", @"fullDuration", a4, a5, a6) & 1) != 0
    || [a3 isEqualToString:@"transitionDuration"])
  {
    [(MCContainerSerializer *)self willChangeValueForKey:@"duration"];
    objc_sync_enter(self);
    self->mCachedDuration = -1.0;
    objc_sync_exit(self);
    [(MCContainerSerializer *)self didChangeValueForKey:@"duration"];
  }
}

- (double)duration
{
  double mCachedDuration = self->mCachedDuration;
  if (mCachedDuration < 0.0)
  {
    objc_sync_enter(self);
    mPlugs = self->mPlugs;
    objc_sync_enter(mPlugs);
    id v5 = (char *)[(NSMutableSet *)self->mPlugs count];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = self->mPlugs;
    id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v5 - 1;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [v11 fullDuration];
          double v13 = v12;
          long long v14 = (char *)[v11 index];
          double v15 = 0.0;
          if (v14 < v8) {
            objc_msgSend(v11, "transitionDuration", 0.0);
          }
          double mCachedDuration = self->mCachedDuration + v13 - v15;
          self->double mCachedDuration = mCachedDuration;
        }
        id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    else
    {
      double mCachedDuration = 0.0;
    }
    objc_sync_exit(mPlugs);
    objc_sync_exit(self);
  }
  return mCachedDuration;
}

- (NSSet)plugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  if ([(NSMutableSet *)self->mPlugs count]) {
    objc_super v4 = (NSSet *)[objc_alloc((Class)NSSet) initWithSet:self->mPlugs];
  }
  else {
    objc_super v4 = (NSSet *)sEmptySet;
  }
  objc_sync_exit(mPlugs);
  return v4;
}

- (unint64_t)countOfPlugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  id v4 = [(NSMutableSet *)self->mPlugs count];
  objc_sync_exit(mPlugs);
  return (unint64_t)v4;
}

- (id)plugAtIndex:(unint64_t)a3
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  mCachedOrderedPlugs = self->mCachedOrderedPlugs;
  if (mCachedOrderedPlugs)
  {
    id v7 = [(NSArray *)mCachedOrderedPlugs objectAtIndex:a3];
LABEL_13:
    double v13 = v7;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = self->mPlugs;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          double v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v12 index] == (id)a3)
          {
            id v7 = v12;
            goto LABEL_13;
          }
        }
        id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        double v13 = 0;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      double v13 = 0;
    }
  }
  objc_sync_exit(mPlugs);
  return v13;
}

- (id)addPlugForContainer:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  id v5 = [(MCContainerSerializer *)self insertPlugsForContainers:v4 atIndex:[(MCContainerSerializer *)self countOfPlugs]];

  return [v5 objectAtIndex:0];
}

- (id)addPlugsForContainers:(id)a3
{
  unint64_t v5 = [(MCContainerSerializer *)self countOfPlugs];
  return [(MCContainerSerializer *)self insertPlugsForContainers:a3 atIndex:v5];
}

- (id)insertPlugForContainer:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  id v7 = [(MCContainerSerializer *)self insertPlugsForContainers:v6 atIndex:a4];

  return [v7 objectAtIndex:0];
}

- (id)insertPlugsForContainers:(id)a3 atIndex:(unint64_t)a4
{
  id v22 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    int v7 = 0;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v11 = [(MCObject *)[MCPlugSerial alloc] initFromScratchWithMontage:self->super.super.mMontage];
        [v11 setSupercontainer:self];
        [v11 setContainer:v10];
        [v11 setIndex:a4 + (v7 + i)];
        [v22 addObject:v11];
        [v11 addObserver:self forKeyPath:@"fullDuration" options:0 context:0];
        [v11 addObserver:self forKeyPath:@"transitionDuration" options:0 context:0];
      }
      id v6 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
      v7 += (int)i;
    }
    while (v6);
  }
  if ([v22 count])
  {
    id v12 = [objc_alloc((Class)NSSet) initWithArray:v22];
    [(MCContainerSerializer *)self willChangeValueForKey:@"plugs" withSetMutation:1 usingObjects:v12];
    mPlugs = self->mPlugs;
    objc_sync_enter(mPlugs);

    self->mCachedOrderedPlugs = 0;
    double v13 = (char *)[a3 count];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v14 = self->mPlugs;
    id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v18 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
          if ((unint64_t)[v18 index] >= a4) {
            objc_msgSend(v18, "setIndex:", &v13[(void)objc_msgSend(v18, "index")]);
          }
        }
        id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v15);
    }
    [(NSMutableSet *)self->mPlugs addObjectsFromArray:v22];
    objc_sync_exit(mPlugs);
    [(MCContainerSerializer *)self didChangeValueForKey:@"plugs" withSetMutation:1 usingObjects:v12];
  }
  return v22;
}

- (void)removePlugsAtIndices:(id)a3
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  obj = self->mPlugs;
  objc_sync_enter(obj);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mPlugs = self->mPlugs;
  id v7 = [(NSMutableSet *)mPlugs countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(mPlugs);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v10, "index")))
        {
          [v5 addObject:v10];
          [v10 removeObserver:self forKeyPath:@"fullDuration"];
          [v10 removeObserver:self forKeyPath:@"transitionDuration"];
        }
        else
        {
          objc_msgSend(v10, "setIndex:", (unsigned char *)objc_msgSend(v10, "index")- (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v10, "index")));
        }
      }
      id v7 = [(NSMutableSet *)mPlugs countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  [(MCContainerSerializer *)self willChangeValueForKey:@"plugs" withSetMutation:2 usingObjects:v5];

  self->mCachedOrderedPlugs = 0;
  [(NSMutableSet *)self->mPlugs minusSet:v5];
  objc_sync_exit(obj);
  [(MCContainerSerializer *)self didChangeValueForKey:@"plugs" withSetMutation:2 usingObjects:v5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v5);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
        [v14 setContainer:0];
        [v14 setSupercontainer:0];
      }
      id v11 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
}

- (void)movePlugsAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  [(MCContainerSerializer *)self willChangeValueForKey:@"orderedPlugs"];
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mCachedOrderedPlugs = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->mPlugs;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v12, "index")))
        {
          objc_msgSend(v12, "setIndex:", (char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index")) + a4);
        }
        else
        {
          double v13 = [v12 index];
          unint64_t v14 = v13 - (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index"));
          if (v14 >= a4) {
            v14 += (unint64_t)[a3 count];
          }
          [v12 setIndex:v14];
        }
      }
      id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  objc_sync_exit(mPlugs);
  [(MCContainerSerializer *)self didChangeValueForKey:@"orderedPlugs"];
}

- (void)removeAllPlugs
{
  id v3 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [(MCContainerSerializer *)self countOfPlugs]);
  [(MCContainerSerializer *)self removePlugsAtIndices:v3];
}

- (NSArray)orderedPlugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  mCachedOrderedPlugs = self->mCachedOrderedPlugs;
  if (!mCachedOrderedPlugs)
  {
    id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"index" ascending:1];
    id v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v5, 0);
    self->mCachedOrderedPlugs = (NSArray *)objc_msgSend(-[NSMutableSet allObjects](self->mPlugs, "allObjects"), "sortedArrayUsingDescriptors:", v6);

    mCachedOrderedPlugs = self->mCachedOrderedPlugs;
  }
  id v7 = mCachedOrderedPlugs;
  objc_sync_exit(mPlugs);
  return v7;
}

- (double)timeInForPlug:(id)a3
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  if (!self->mCachedOrderedPlugs)
  {
    id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"index" ascending:1];
    id v7 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v6, 0);
    self->mCachedOrderedPlugs = (NSArray *)objc_msgSend(-[NSMutableSet allObjects](self->mPlugs, "allObjects"), "sortedArrayUsingDescriptors:", v7);
  }
  id v8 = [a3 index];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mCachedOrderedPlugs = self->mCachedOrderedPlugs;
  id v10 = [(NSArray *)mCachedOrderedPlugs countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    double v12 = 0.0;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(mCachedOrderedPlugs);
      }
      unint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
      if ([v14 index] >= v8) {
        break;
      }
      [v14 fullDuration];
      double v16 = v15;
      [v14 transitionDuration];
      double v12 = v12 + v16 - v17;
      if (v10 == (id)++v13)
      {
        id v10 = [(NSArray *)mCachedOrderedPlugs countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    double v12 = 0.0;
  }
  objc_sync_exit(mPlugs);
  return v12;
}

- (NSString)initialTransitionID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInitialTransitionID:(id)a3
{
}

- (double)initialTransitionDuration
{
  return self->_initialTransitionDuration;
}

- (void)setInitialTransitionDuration:(double)a3
{
  self->_initialTransitionDuration = a3;
}

- (NSDictionary)initialTransitionAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInitialTransitionAttributes:(id)a3
{
}

@end