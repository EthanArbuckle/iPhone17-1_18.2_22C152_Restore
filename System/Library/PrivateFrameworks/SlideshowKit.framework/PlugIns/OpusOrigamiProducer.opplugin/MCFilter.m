@interface MCFilter
- (MCFilter)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSDictionary)attributes;
- (NSSet)animationPaths;
- (NSString)filterID;
- (id)animationPathForKey:(id)a3;
- (id)attributeForKey:(id)a3;
- (id)imprint;
- (id)imprintsForAnimationPaths;
- (unint64_t)countOfAnimationPaths;
- (unint64_t)index;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addAnimationPath:(id)a3;
- (void)demolish;
- (void)demolishAnimationPaths;
- (void)initAnimationPathsWithImprints:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllAnimationPaths;
- (void)removeAnimationPathForKey:(id)a3;
- (void)setAttribute:(id)a3 forKey:(id)a4;
- (void)setAttributes:(id)a3;
- (void)setFilterID:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation MCFilter

- (MCFilter)initWithImprint:(id)a3 andMontage:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MCFilter;
  v5 = [(MCObject *)&v8 initWithImprint:a3 andMontage:a4];
  if (v5)
  {
    v5->mFilterID = (NSString *)[a3 objectForKey:@"filterID"];
    v5->mAttributes = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(a3, "objectForKey:", @"attributes"));
    id v6 = [a3 objectForKey:@"animationPaths"];
    if (v6) {
      [(MCFilter *)v5 initAnimationPathsWithImprints:v6];
    }
  }
  return v5;
}

- (void)demolish
{
  self->mFilterID = 0;
  self->mAttributes = 0;
  [(MCFilter *)self demolishAnimationPaths];
  v3.receiver = self;
  v3.super_class = (Class)MCFilter;
  [(MCObject *)&v3 demolish];
}

- (id)imprint
{
  v8.receiver = self;
  v8.super_class = (Class)MCFilter;
  id v3 = [(MCObject *)&v8 imprint];
  v4 = v3;
  mFilterID = self->mFilterID;
  if (mFilterID) {
    [v3 setObject:mFilterID forKey:@"filterID"];
  }
  mAttributes = self->mAttributes;
  if (mAttributes) {
    [v4 setObject:mAttributes forKey:@"attributes"];
  }
  if ([(NSMutableSet *)self->mAnimationPaths count]) {
    objc_msgSend(v4, "setObject:forKey:", -[MCFilter imprintsForAnimationPaths](self, "imprintsForAnimationPaths"), @"animationPaths");
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  [(MCFilter *)self willChangeValueForKey:@"animationPaths", a4, a5, a6];
  [(MCFilter *)self didChangeValueForKey:@"animationPaths"];
}

- (id)attributeForKey:(id)a3
{
  if ([(MCObject *)self isSnapshot])
  {
    mAttributes = self->mAttributes;
    return [(NSMutableDictionary *)mAttributes objectForKey:a3];
  }
  else
  {
    objc_sync_enter(self);
    id v7 = [(NSMutableDictionary *)self->mAttributes objectForKey:a3];
    objc_sync_exit(self);
    return v7;
  }
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  [(MCFilter *)self willChangeValueForKey:@"attributes"];
  objc_sync_enter(self);
  mAttributes = self->mAttributes;
  if (a3)
  {
    if (mAttributes) {
      [(NSMutableDictionary *)mAttributes setObject:a3 forKey:a4];
    }
    else {
      self->mAttributes = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", a3, a4, 0);
    }
  }
  else if (mAttributes)
  {
    [(NSMutableDictionary *)mAttributes removeObjectForKey:a4];
  }
  objc_sync_exit(self);
  [(MCFilter *)self didChangeValueForKey:@"attributes"];
}

- (NSDictionary)attributes
{
  if ([(MCObject *)self isSnapshot]) {
    return &self->mAttributes->super;
  }
  objc_sync_enter(self);
  id v3 = +[NSDictionary dictionaryWithDictionary:self->mAttributes];
  objc_sync_exit(self);
  return v3;
}

- (void)setAttributes:(id)a3
{
  objc_sync_enter(self);

  self->mAttributes = 0;
  if (a3) {
    self->mAttributes = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:a3];
  }
  objc_sync_exit(self);
}

- (void)_copySelfToSnapshot:(id)a3
{
  objc_sync_enter(self);
  mFilterID = self->mFilterID;
  if (mFilterID) {
    *((void *)a3 + 6) = [(NSString *)mFilterID copy];
  }
  mAttributes = self->mAttributes;
  if (mAttributes) {
    *((void *)a3 + 3) = [(NSMutableDictionary *)mAttributes copy];
  }
  *((void *)a3 + 5) = self->mIndex;
  if (self->mAnimationPaths)
  {
    id v7 = [(MCFilter *)self animationPaths];
    if ([(NSSet *)v7 count])
    {
      *((void *)a3 + 4) = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSSet count](v7, "count"));
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = [(NSSet *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*((id *)a3 + 4), "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "snapshot"));
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [(NSSet *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
  objc_sync_exit(self);
}

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (NSString)filterID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFilterID:(id)a3
{
}

- (void)initAnimationPathsWithImprints:(id)a3
{
  if (a3)
  {
    if ([a3 count])
    {
      self->mAnimationPaths = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          id v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(a3);
            }
            id v9 = +[MCObjectLight objectWithImprint:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)];
            [(NSMutableSet *)self->mAnimationPaths addObject:v9];
            if (![(MCObject *)self isSnapshot])
            {
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              CFStringRef v11 = @"keyframes";
              if ((isKindOfClass & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_13;
                }
                [v9 addObserver:self forKeyPath:@"combineOperation" options:0 context:0];
                CFStringRef v11 = @"animationPaths";
              }
              [v9 addObserver:self forKeyPath:v11 options:0 context:0];
            }
LABEL_13:
            id v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)demolishAnimationPaths
{
  mAnimationPaths = self->mAnimationPaths;
  if (mAnimationPaths)
  {
    obj = mAnimationPaths;
    objc_sync_enter(mAnimationPaths);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v4 = self->mAnimationPaths;
    id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (!v5) {
      goto LABEL_14;
    }
    uint64_t v6 = *(void *)v14;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![(MCObject *)self isSnapshot])
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          CFStringRef v10 = @"keyframes";
          if ((isKindOfClass & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_12;
            }
            [v8 removeObserver:self forKeyPath:@"combineOperation"];
            CFStringRef v10 = @"animationPaths";
          }
          [v8 removeObserver:self forKeyPath:v10];
        }
LABEL_12:
        [v8 demolish];
      }
      id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (!v5)
      {
LABEL_14:
        objc_sync_enter(self);
        CFStringRef v11 = self->mAnimationPaths;
        self->mAnimationPaths = 0;
        objc_sync_exit(self);
        objc_sync_exit(obj);
        return;
      }
    }
  }
}

- (id)imprintsForAnimationPaths
{
  id v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(MCFilter *)self animationPaths];
  id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "imprint"));
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSSet)animationPaths
{
  id v3 = (NSSet *)sEmptySet;
  unsigned __int8 v4 = [(MCObject *)self isSnapshot];
  mAnimationPaths = self->mAnimationPaths;
  if ((v4 & 1) == 0)
  {
    if (mAnimationPaths)
    {
      objc_sync_enter(self->mAnimationPaths);
      if ([(NSMutableSet *)self->mAnimationPaths count]) {
        id v3 = (NSSet *)[objc_alloc((Class)NSSet) initWithSet:self->mAnimationPaths];
      }
      objc_sync_exit(mAnimationPaths);
    }
    return v3;
  }
  return &mAnimationPaths->super;
}

- (unint64_t)countOfAnimationPaths
{
  unsigned int v3 = [(MCObject *)self isSnapshot];
  mAnimationPaths = self->mAnimationPaths;
  if (v3)
  {
    id v5 = self->mAnimationPaths;
    return (unint64_t)[(NSMutableSet *)v5 count];
  }
  else
  {
    if (!mAnimationPaths) {
      return 0;
    }
    objc_sync_enter(self->mAnimationPaths);
    id v7 = [(NSMutableSet *)self->mAnimationPaths count];
    objc_sync_exit(mAnimationPaths);
    return (unint64_t)v7;
  }
}

- (id)animationPathForKey:(id)a3
{
  if ([(MCObject *)self isSnapshot])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    mAnimationPaths = self->mAnimationPaths;
    id v6 = [(NSMutableSet *)mAnimationPaths countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(mAnimationPaths);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        if (objc_msgSend(objc_msgSend(v9, "key"), "isEqualToString:", a3)) {
          return v9;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [(NSMutableSet *)mAnimationPaths countByEnumeratingWithState:&v21 objects:v26 count:16];
          id v9 = 0;
          if (v6) {
            goto LABEL_4;
          }
          return v9;
        }
      }
    }
    return 0;
  }
  long long v10 = self->mAnimationPaths;
  if (!v10) {
    return 0;
  }
  objc_sync_enter(self->mAnimationPaths);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = self->mAnimationPaths;
  id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v9, "key"), "isEqualToString:", a3))
        {
          if (v9) {
            id v15 = v9;
          }
          goto LABEL_24;
        }
      }
      id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_24:
  objc_sync_exit(v10);
  return v9;
}

- (void)addAnimationPath:(id)a3
{
  -[MCFilter removeAnimationPathForKey:](self, "removeAnimationPathForKey:", [a3 key]);
  if (!self->mAnimationPaths)
  {
    objc_sync_enter(self);
    self->mAnimationPaths = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    objc_sync_exit(self);
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", a3, 0);
  -[MCFilter willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", @"animationPaths", 1);
  mAnimationPaths = self->mAnimationPaths;
  objc_sync_enter(mAnimationPaths);
  [(NSMutableSet *)self->mAnimationPaths addObject:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v6 = @"keyframes";
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    [a3 addObserver:self forKeyPath:@"combineOperation" options:0 context:0];
    CFStringRef v6 = @"animationPaths";
  }
  [a3 addObserver:self forKeyPath:v6 options:0 context:0];
LABEL_8:
  objc_sync_exit(mAnimationPaths);
  [(MCFilter *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v7];
}

- (void)removeAnimationPathForKey:(id)a3
{
  mAnimationPaths = self->mAnimationPaths;
  if (!mAnimationPaths) {
    return;
  }
  objc_sync_enter(self->mAnimationPaths);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CFStringRef v6 = self->mAnimationPaths;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = *(void *)v15;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v6);
      }
      long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if (objc_msgSend(objc_msgSend(v10, "key"), "isEqualToString:", a3))
      {
        if (!v10) {
          goto LABEL_14;
        }
        id v11 = v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFStringRef v12 = @"keyframes";
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_18:
            id v13 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v10, 0);
            [(MCFilter *)self willChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v13];
            [(NSMutableSet *)self->mAnimationPaths removeObject:v10];
            objc_sync_exit(mAnimationPaths);
            [(MCFilter *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v13];

            return;
          }
          [v10 removeObserver:self forKeyPath:@"combineOperation"];
          CFStringRef v12 = @"animationPaths";
        }
        [v10 removeObserver:self forKeyPath:v12];
        goto LABEL_18;
      }
    }
    id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_14:
  objc_sync_exit(mAnimationPaths);
}

- (void)removeAllAnimationPaths
{
  if ([(NSMutableSet *)self->mAnimationPaths count])
  {
    obj = self->mAnimationPaths;
    objc_sync_enter(obj);
    id v3 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", -[NSMutableSet allObjects](self->mAnimationPaths, "allObjects"));
    [(MCFilter *)self willChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    mAnimationPaths = self->mAnimationPaths;
    id v5 = [(NSMutableSet *)mAnimationPaths countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v5) {
      goto LABEL_13;
    }
    uint64_t v6 = *(void *)v13;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(mAnimationPaths);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        CFStringRef v10 = @"keyframes";
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v8 removeObserver:self forKeyPath:@"combineOperation"];
          CFStringRef v10 = @"animationPaths";
        }
        [v8 removeObserver:self forKeyPath:v10];
      }
      id v5 = [(NSMutableSet *)mAnimationPaths countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!v5)
      {
LABEL_13:
        [(NSMutableSet *)self->mAnimationPaths removeAllObjects];
        objc_sync_exit(obj);
        [(MCFilter *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v3];

        return;
      }
    }
  }
}

@end