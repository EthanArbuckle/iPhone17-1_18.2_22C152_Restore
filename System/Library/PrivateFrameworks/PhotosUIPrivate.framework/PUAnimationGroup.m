@interface PUAnimationGroup
+ (id)animationGroupWithAnimations:(id)a3;
+ (void)popAnimationGroup:(id)a3;
+ (void)pushAnimationGroup:(id)a3;
- (BOOL)isPaused;
- (BOOL)isReadyToComplete;
- (NSMutableArray)subAnimationGroups;
- (PUAnimationGroup)superAnimationGroup;
- (double)elapsedTime;
- (id)completionHandler;
- (id)description;
- (void)addSubAnimationGroup:(id)a3;
- (void)complete;
- (void)completeIfNeeded;
- (void)dealloc;
- (void)finishImmediately;
- (void)setCompletionHandler:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setPaused:(BOOL)a3;
- (void)setSuperAnimationGroup:(id)a3;
@end

@implementation PUAnimationGroup

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_subAnimationGroups, 0);
  objc_destroyWeak((id *)&self->_superAnimationGroup);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSMutableArray)subAnimationGroups
{
  return self->_subAnimationGroups;
}

- (PUAnimationGroup)superAnimationGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superAnimationGroup);
  return (PUAnimationGroup *)WeakRetained;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v26.receiver = self;
  v26.super_class = (Class)PUAnimationGroup;
  v4 = [(PUAnimationGroup *)&v26 description];
  v5 = [v3 stringWithFormat:@"%@ {\n", v4];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = [(PUAnimationGroup *)self subAnimationGroups];
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) description];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v11 = [v10 componentsSeparatedByString:@"\n"];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              [v5 appendFormat:@"  %@\n", *(void *)(*((void *)&v18 + 1) + 8 * j)];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  [v5 appendString:@"}"];
  return v5;
}

- (void)finishImmediately
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(PUAnimationGroup *)self subAnimationGroups];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) finishImmediately];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)complete
{
  uint64_t v3 = [(PUAnimationGroup *)self completionHandler];
  if (v3)
  {
    [(PUAnimationGroup *)self setCompletionHandler:0];
    v3[2]();
  }
}

- (void)setCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__PUAnimationGroup_setCompletionHandler___block_invoke;
    v9[3] = &unk_1E5F2EA60;
    v9[4] = self;
    id v10 = v4;
    uint64_t v6 = (void *)[v9 copy];
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v6;

    id v8 = v10;
  }
  else
  {
    id v8 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

uint64_t __41__PUAnimationGroup_setCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)completeIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUAnimationGroup *)self superAnimationGroup];
  id v4 = v3;
  if (v3)
  {
    [v3 completeIfNeeded];
  }
  else if ([(PUAnimationGroup *)self isReadyToComplete])
  {
    [(PUAnimationGroup *)self complete];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(PUAnimationGroup *)self subAnimationGroups];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) complete];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)isReadyToComplete
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUAnimationGroup *)self isPaused];
  if (v3) {
    return 0;
  }
  BOOL v5 = v3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(PUAnimationGroup *)self subAnimationGroups];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v4 = !v5;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) isReadyToComplete])
        {
          char v4 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v4 = 1;
  }
LABEL_14:

  return v4;
}

- (void)setSuperAnimationGroup:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superAnimationGroup);

  BOOL v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_superAnimationGroup, obj);

    BOOL v5 = obj;
    if (!obj)
    {
      [(PUAnimationGroup *)self completeIfNeeded];
      BOOL v5 = 0;
    }
  }
}

- (void)addSubAnimationGroup:(id)a3
{
  id v10 = a3;
  if ([(PUAnimationGroup *)self isPaused])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUAnimationGroup.m", 102, @"Invalid parameter not satisfying: %@", @"![self isPaused]" object file lineNumber description];
  }
  BOOL v5 = [(PUAnimationGroup *)self subAnimationGroups];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    subAnimationGroups = self->_subAnimationGroups;
    self->_subAnimationGroups = v6;
  }
  uint64_t v8 = [(PUAnimationGroup *)self subAnimationGroups];
  [v8 addObject:v10];

  [v10 setSuperAnimationGroup:self];
}

- (void)setPaused:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_paused != a3)
  {
    BOOL v3 = a3;
    self->_paused = a3;
    if (a3) {
      [(PUAnimationGroup *)self pauseAnimations];
    }
    else {
      [(PUAnimationGroup *)self resumeAnimations];
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v5 = [(PUAnimationGroup *)self subAnimationGroups];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setPaused:v3];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setElapsedTime:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v4 = [(PUAnimationGroup *)self subAnimationGroups];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setElapsedTime:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)elapsedTime
{
  v2 = [(PUAnimationGroup *)self subAnimationGroups];
  BOOL v3 = [v2 firstObject];

  if (v3)
  {
    [v3 elapsedTime];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)dealloc
{
  BOOL v3 = (void *)[(NSMutableArray *)self->_subAnimationGroups copy];
  if ([v3 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__PUAnimationGroup_dealloc__block_invoke;
    block[3] = &unk_1E5F2ED10;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v4.receiver = self;
  v4.super_class = (Class)PUAnimationGroup;
  [(PUAnimationGroup *)&v4 dealloc];
}

void __27__PUAnimationGroup_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_msgSend(v6, "setSuperAnimationGroup:", 0, (void)v7);
        [v6 completeIfNeeded];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

+ (void)popAnimationGroup:(id)a3
{
  id v9 = a3;
  if ((id)__currentAnimationGroup != v9)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PUAnimationGroup.m", 46, @"Invalid parameter not satisfying: %@", @"__currentAnimationGroup == animationGroup" object file lineNumber description];
  }
  uint64_t v5 = [v9 superAnimationGroup];
  id v6 = (void *)__currentAnimationGroup;
  __currentAnimationGroup = v5;

  long long v7 = v9;
  if ((id)__rootAnimationGroup == v9)
  {
    __rootAnimationGroup = 0;

    long long v7 = v9;
  }
}

+ (void)pushAnimationGroup:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PUAnimationGroup.m", 35, @"Invalid parameter not satisfying: %@", @"animationGroup != nil" object file lineNumber description];
  }
  if (__rootAnimationGroup)
  {
    long long v7 = (void *)__currentAnimationGroup;
    if (!__currentAnimationGroup)
    {
      long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, a1, @"PUAnimationGroup.m", 39, @"Invalid parameter not satisfying: %@", @"__currentAnimationGroup != nil" object file lineNumber description];

      long long v7 = (void *)__currentAnimationGroup;
    }
    [v7 addSubAnimationGroup:v6];
  }
  else
  {
    objc_storeStrong((id *)&__rootAnimationGroup, a3);
  }
  long long v8 = (void *)__currentAnimationGroup;
  __currentAnimationGroup = (uint64_t)v6;
}

+ (id)animationGroupWithAnimations:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  if (!v5)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PUAnimationGroup.m", 20, @"Invalid parameter not satisfying: %@", @"animations != NULL" object file lineNumber description];
  }
  id v6 = objc_alloc_init(PUAnimationGroup);
  +[PUAnimationGroup pushAnimationGroup:v6];
  v5[2](v5);
  +[PUAnimationGroup popAnimationGroup:v6];

  return v6;
}

@end