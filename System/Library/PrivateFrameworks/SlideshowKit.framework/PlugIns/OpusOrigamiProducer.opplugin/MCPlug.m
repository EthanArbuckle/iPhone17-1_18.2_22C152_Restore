@interface MCPlug
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)preactivatesWithParent;
- (BOOL)startsPaused;
- (MCContainer)container;
- (MCPlug)init;
- (MCPlug)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSDictionary)actions;
- (NSSet)animationPaths;
- (double)fullDuration;
- (double)loopDuration;
- (double)numberOfLoops;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (id)actionForKey:(id)a3;
- (id)animationPathForKey:(id)a3;
- (id)imprint;
- (id)imprintsForActions;
- (id)imprintsForAnimationPaths;
- (unint64_t)countOfActions;
- (unint64_t)countOfAnimationPaths;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addAnimationPath:(id)a3;
- (void)demolish;
- (void)demolishActions;
- (void)demolishAnimationPaths;
- (void)initActionsWithImprints:(id)a3;
- (void)initAnimationPathsWithImprints:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeActionForKey:(id)a3;
- (void)removeAllActions;
- (void)removeAllAnimationPaths;
- (void)removeAnimationPathForKey:(id)a3;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setContainer:(id)a3;
- (void)setLoopDuration:(double)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPreactivatesWithParent:(BOOL)a3;
- (void)setStartsPaused:(BOOL)a3;
@end

@implementation MCPlug

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"fullDuration"]) {
    return +[NSSet setWithObjects:@"phaseInDuration", @"loopDuration", @"phaseOutDuration", 0];
  }
  if ([a3 isEqualToString:@"orderedFilters"]) {
    return +[NSSet setWithObjects:@"filters", 0, v6, v7];
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MCPlug;
  return objc_msgSendSuper2(&v8, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCPlug)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCPlug;
  result = [(MCPlug *)&v3 init];
  if (result) {
    result->mNumberOfLoops = 1.0;
  }
  return result;
}

- (MCPlug)initWithImprint:(id)a3 andMontage:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)MCPlug;
  v5 = [(MCObject *)&v21 initWithImprint:a3 andMontage:a4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (MCContainer *)-[MCMontage containerForObjectID:](v5->super.mMontage, "containerForObjectID:", [a3 objectForKey:@"containerID"]);
    v6->mContainer = v7;
    [(MCContainer *)v7 referenceByPlug:v6];
    id v8 = [a3 objectForKey:@"animationPaths"];
    if (v8) {
      [(MCPlug *)v6 initAnimationPathsWithImprints:v8];
    }
    id v9 = [a3 objectForKey:@"actions"];
    if (v9) {
      [(MCPlug *)v6 initActionsWithImprints:v9];
    }
    id v10 = [a3 objectForKey:@"phaseInDuration"];
    double v11 = 0.0;
    double v12 = 0.0;
    if (v10) {
      objc_msgSend(v10, "doubleValue", 0.0);
    }
    v6->mPhaseInDuration = v12;
    id v13 = [a3 objectForKey:@"loopDuration"];
    if (v13)
    {
      [v13 doubleValue];
      double v11 = v14;
    }
    v6->mLoopDuration = v11;
    id v15 = [a3 objectForKey:@"phaseOutDuration"];
    if (v15) {
      [v15 doubleValue];
    }
    else {
      double v16 = 0.0;
    }
    v6->mPhaseOutDuration = v16;
    id v17 = [a3 objectForKey:@"numberOfLoops"];
    if (v17) {
      [v17 doubleValue];
    }
    else {
      double v18 = 1.0;
    }
    v6->mNumberOfLoops = v18;
    id v19 = [a3 objectForKey:@"flags"];
    if (v19) {
      LODWORD(v19) = [v19 unsignedIntegerValue];
    }
    v6->mFlags = v19;
  }
  return v6;
}

- (void)demolish
{
  [(MCPlug *)self setContainer:0];
  [(MCPlug *)self demolishAnimationPaths];
  [(MCPlug *)self demolishActions];
  v3.receiver = self;
  v3.super_class = (Class)MCPlug;
  [(MCObject *)&v3 demolish];
}

- (id)imprint
{
  v6.receiver = self;
  v6.super_class = (Class)MCPlug;
  id v3 = [(MCObject *)&v6 imprint];
  mContainer = self->mContainer;
  if (mContainer) {
    objc_msgSend(v3, "setObject:forKey:", -[MCObject objectID](mContainer, "objectID"), @"containerID");
  }
  if ([(NSMutableSet *)self->mAnimationPaths count]) {
    objc_msgSend(v3, "setObject:forKey:", -[MCPlug imprintsForAnimationPaths](self, "imprintsForAnimationPaths"), @"animationPaths");
  }
  if ([(NSMutableDictionary *)self->mActions count]) {
    objc_msgSend(v3, "setObject:forKey:", -[MCPlug imprintsForActions](self, "imprintsForActions"), @"actions");
  }
  if (self->mPhaseInDuration != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"phaseInDuration");
  }
  if (self->mLoopDuration != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"loopDuration");
  }
  if (self->mPhaseOutDuration != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"phaseOutDuration");
  }
  if (self->mNumberOfLoops != 1.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"numberOfLoops");
  }
  if (self->mFlags) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->mFlags), @"flags");
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"keyframes", a4, a5, a6)) {
    CFStringRef v7 = @"animationPaths";
  }
  else {
    CFStringRef v7 = @"filters";
  }
  [(MCPlug *)self willChangeValueForKey:v7];
  [(MCPlug *)self didChangeValueForKey:v7];
}

- (MCContainer)container
{
  if ([(MCObject *)self isSnapshot]) {
    return self->mContainer;
  }
  objc_sync_enter(self);
  id v3 = self->mContainer;
  objc_sync_exit(self);
  return v3;
}

- (void)setContainer:(id)a3
{
  if (self->mContainer != a3)
  {
    objc_sync_enter(self);
    mContainer = self->mContainer;
    if (a3)
    {
      objc_super v6 = (MCContainer *)a3;
      self->mContainer = v6;
      [(MCContainer *)v6 referenceByPlug:self];
    }
    else
    {
      self->mContainer = 0;
    }
    [(MCContainer *)mContainer unreferenceByPlug:self];
    CFStringRef v7 = mContainer;
    objc_sync_exit(self);
  }
}

- (void)setPhaseInDuration:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->mPhaseInDuration = a3;
}

- (void)setLoopDuration:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->mLoopDuration = a3;
}

- (void)setPhaseOutDuration:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->mPhaseOutDuration = a3;
}

- (double)fullDuration
{
  return self->mPhaseInDuration + self->mLoopDuration * self->mNumberOfLoops + self->mPhaseOutDuration;
}

- (void)setNumberOfLoops:(double)a3
{
  if (a3 <= 0.0) {
    a3 = 1.0;
  }
  self->mNumberOfLoops = a3;
}

- (BOOL)startsPaused
{
  return self->mFlags & 1;
}

- (void)setStartsPaused:(BOOL)a3
{
  self->mFlags = self->mFlags & 0xFFFFFFFE | a3;
}

- (BOOL)preactivatesWithParent
{
  return (LOBYTE(self->mFlags) >> 3) & 1;
}

- (void)setPreactivatesWithParent:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->mFlags = self->mFlags & 0xFFFFFFF7 | v3;
}

- (void)_copySelfToSnapshot:(id)a3
{
  if (self->mAnimationPaths)
  {
    v5 = [(MCPlug *)self animationPaths];
    if ([(NSSet *)v5 count])
    {
      *((void *)a3 + 4) = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSSet count](v5, "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v20;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*((id *)a3 + 4), "addObject:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v9), "snapshot"));
            id v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v7);
      }
    }
  }
  if (self->mActions)
  {
    id v10 = [(MCPlug *)self actions];
    if ([(NSDictionary *)v10 count])
    {
      *((void *)a3 + 5) = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSDictionary count](v10, "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v11 = [(NSDictionary *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          double v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*((id *)a3 + 5), "setObject:forKey:", objc_msgSend(-[NSDictionary objectForKey:](v10, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14)), "snapshot"), *(void *)(*((void *)&v15 + 1) + 8 * (void)v14));
            double v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [(NSDictionary *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
  *((void *)a3 + 7) = *(void *)&self->mPhaseInDuration;
  *((void *)a3 + 8) = *(void *)&self->mLoopDuration;
  *((void *)a3 + 9) = *(void *)&self->mPhaseOutDuration;
  *((void *)a3 + 10) = *(void *)&self->mNumberOfLoops;
  *((_DWORD *)a3 + 6) = self->mFlags;
}

- (double)phaseInDuration
{
  return self->mPhaseInDuration;
}

- (double)loopDuration
{
  return self->mLoopDuration;
}

- (double)phaseOutDuration
{
  return self->mPhaseOutDuration;
}

- (double)numberOfLoops
{
  return self->mNumberOfLoops;
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
  v4 = [(MCPlug *)self animationPaths];
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
  -[MCPlug removeAnimationPathForKey:](self, "removeAnimationPathForKey:", [a3 key]);
  if (!self->mAnimationPaths)
  {
    objc_sync_enter(self);
    self->mAnimationPaths = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    objc_sync_exit(self);
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", a3, 0);
  -[MCPlug willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", @"animationPaths", 1);
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
  [(MCPlug *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v7];
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
            [(MCPlug *)self willChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v13];
            [(NSMutableSet *)self->mAnimationPaths removeObject:v10];
            objc_sync_exit(mAnimationPaths);
            [(MCPlug *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v13];

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
    [(MCPlug *)self willChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v3];
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
        [(MCPlug *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v3];

        return;
      }
    }
  }
}

- (void)initActionsWithImprints:(id)a3
{
  if (a3)
  {
    if ([a3 count])
    {
      self->mActions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(a3);
            }
            -[NSMutableDictionary setObject:forKey:](self->mActions, "setObject:forKey:", +[MCObjectLight objectWithImprint:](MCObjectLight, "objectWithImprint:", [a3 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)]), *(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
            uint64_t v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)demolishActions
{
  mActions = self->mActions;
  if (mActions)
  {
    objc_sync_enter(self->mActions);
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unsigned __int8 v4 = self->mActions;
    id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->mActions, "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * i)), "demolish");
        }
        id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
    objc_sync_enter(self);

    self->mActions = 0;
    objc_sync_exit(self);
    objc_sync_exit(mActions);
  }
}

- (id)imprintsForActions
{
  id v3 = +[NSMutableDictionary dictionary];
  unsigned __int8 v4 = [(MCPlug *)self actions];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "setObject:forKey:", objc_msgSend(-[NSDictionary objectForKey:](v4, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8)), "imprint"), *(void *)(*((void *)&v10 + 1) + 8 * (void)v8));
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSDictionary)actions
{
  id v3 = (NSDictionary *)sEmptyDictionary;
  unsigned __int8 v4 = [(MCObject *)self isSnapshot];
  mActions = self->mActions;
  if ((v4 & 1) == 0)
  {
    if (mActions)
    {
      objc_sync_enter(self->mActions);
      if ([(NSMutableDictionary *)self->mActions count]) {
        id v3 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:self->mActions];
      }
      objc_sync_exit(mActions);
    }
    return v3;
  }
  return &mActions->super;
}

- (unint64_t)countOfActions
{
  unsigned int v3 = [(MCObject *)self isSnapshot];
  mActions = self->mActions;
  if (v3)
  {
    id v5 = self->mActions;
    return (unint64_t)[(NSMutableDictionary *)v5 count];
  }
  else
  {
    if (!mActions) {
      return 0;
    }
    objc_sync_enter(self->mActions);
    id v7 = [(NSMutableDictionary *)self->mActions count];
    objc_sync_exit(mActions);
    return (unint64_t)v7;
  }
}

- (id)actionForKey:(id)a3
{
  unsigned int v5 = [(MCObject *)self isSnapshot];
  mActions = self->mActions;
  if (v5)
  {
    id v7 = self->mActions;
    return [(NSMutableDictionary *)v7 objectForKey:a3];
  }
  else
  {
    if (!mActions) {
      return 0;
    }
    objc_sync_enter(self->mActions);
    id v9 = [(NSMutableDictionary *)self->mActions objectForKey:a3];
    objc_sync_exit(mActions);
    return v9;
  }
}

- (void)setAction:(id)a3 forKey:(id)a4
{
  [(MCPlug *)self willChangeValueForKey:@"actions"];
  mActions = self->mActions;
  if (!mActions)
  {
    objc_sync_enter(self);
    self->mActions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objc_sync_exit(self);
    mActions = self->mActions;
  }
  objc_sync_enter(mActions);
  [(NSMutableDictionary *)self->mActions setObject:a3 forKey:a4];
  objc_sync_exit(mActions);
  [(MCPlug *)self didChangeValueForKey:@"actions"];
}

- (void)removeActionForKey:(id)a3
{
  if (self->mActions)
  {
    [(MCPlug *)self willChangeValueForKey:@"actions"];
    mActions = self->mActions;
    objc_sync_enter(mActions);
    [(NSMutableDictionary *)self->mActions removeObjectForKey:a3];
    objc_sync_exit(mActions);
    [(MCPlug *)self didChangeValueForKey:@"actions"];
  }
}

- (void)removeAllActions
{
  if (self->mActions)
  {
    [(MCPlug *)self willChangeValueForKey:@"actions"];
    mActions = self->mActions;
    objc_sync_enter(mActions);
    [(NSMutableDictionary *)self->mActions removeAllObjects];
    objc_sync_exit(mActions);
    [(MCPlug *)self didChangeValueForKey:@"actions"];
  }
}

@end