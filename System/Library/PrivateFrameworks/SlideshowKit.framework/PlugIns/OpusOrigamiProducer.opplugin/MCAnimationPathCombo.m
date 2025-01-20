@interface MCAnimationPathCombo
- (MCAnimationPathCombo)initWithImprint:(id)a3;
- (NSSet)animationPaths;
- (NSString)combineOperation;
- (id)animationPathForKey:(id)a3;
- (id)imprint;
- (id)imprintsForAnimationPaths;
- (unint64_t)countOfAnimationPaths;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addAnimationPath:(id)a3;
- (void)demolish;
- (void)demolishAnimationPaths;
- (void)initAnimationPathsWithImprints:(id)a3;
- (void)removeAllAnimationPaths;
- (void)removeAnimationPathForKey:(id)a3;
- (void)setCombineOperation:(id)a3;
@end

@implementation MCAnimationPathCombo

- (MCAnimationPathCombo)initWithImprint:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCAnimationPathCombo;
  v4 = -[MCAnimationPath initWithImprint:](&v7, "initWithImprint:");
  if (v4)
  {
    id v5 = [a3 objectForKey:@"animationPaths"];
    if (v5) {
      [(MCAnimationPathCombo *)v4 initAnimationPathsWithImprints:v5];
    }
    v4->mCombineOperation = (NSString *)[a3 objectForKey:@"combineOperation"];
  }
  return v4;
}

- (void)demolish
{
  [(MCAnimationPathCombo *)self demolishAnimationPaths];

  self->mAnimationPaths = 0;
  self->mCombineOperation = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCAnimationPathCombo;
  [(MCAnimationPath *)&v3 demolish];
}

- (id)imprint
{
  v6.receiver = self;
  v6.super_class = (Class)MCAnimationPathCombo;
  id v3 = [(MCAnimationPath *)&v6 imprint];
  if ([(NSMutableSet *)self->mAnimationPaths count]) {
    objc_msgSend(v3, "setObject:forKey:", -[MCAnimationPathCombo imprintsForAnimationPaths](self, "imprintsForAnimationPaths"), @"animationPaths");
  }
  mCombineOperation = self->mCombineOperation;
  if (mCombineOperation) {
    [v3 setObject:mCombineOperation forKey:@"combineOperation"];
  }
  return v3;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MCAnimationPathCombo;
  -[MCAnimationPath _copySelfToSnapshot:](&v15, "_copySelfToSnapshot:");
  if (self->mAnimationPaths)
  {
    id v5 = [(MCAnimationPathCombo *)self animationPaths];
    if ([(NSSet *)v5 count])
    {
      *((void *)a3 + 3) = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSSet count](v5, "count"));
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          v9 = 0;
          do
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*((id *)a3 + 3), "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "snapshot"));
            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }
        while (v7);
      }
    }
  }
  mCombineOperation = self->mCombineOperation;
  if (mCombineOperation) {
    *((void *)a3 + 4) = [(NSString *)mCombineOperation copy];
  }
}

- (NSString)combineOperation
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCombineOperation:(id)a3
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
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(a3);
            }
            id v9 = +[MCObjectLight objectWithImprint:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)];
            [(NSMutableSet *)self->mAnimationPaths addObject:v9];
            if (![(MCAnimationPath *)self isSnapshot])
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
            uint64_t v8 = (char *)v8 + 1;
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
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![(MCAnimationPath *)self isSnapshot])
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
  v4 = [(MCAnimationPathCombo *)self animationPaths];
  id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "imprint"));
        uint64_t v8 = (char *)v8 + 1;
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
  unsigned __int8 v4 = [(MCAnimationPath *)self isSnapshot];
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
  unsigned int v3 = [(MCAnimationPath *)self isSnapshot];
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
  if ([(MCAnimationPath *)self isSnapshot])
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
  -[MCAnimationPathCombo removeAnimationPathForKey:](self, "removeAnimationPathForKey:", [a3 key]);
  if (!self->mAnimationPaths)
  {
    objc_sync_enter(self);
    self->mAnimationPaths = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    objc_sync_exit(self);
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", a3, 0);
  -[MCAnimationPathCombo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", @"animationPaths", 1);
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
  [(MCAnimationPathCombo *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v7];
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
            [(MCAnimationPathCombo *)self willChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v13];
            [(NSMutableSet *)self->mAnimationPaths removeObject:v10];
            objc_sync_exit(mAnimationPaths);
            [(MCAnimationPathCombo *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v13];

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
    [(MCAnimationPathCombo *)self willChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v3];
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
        [(MCAnimationPathCombo *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v3];

        return;
      }
    }
  }
}

@end