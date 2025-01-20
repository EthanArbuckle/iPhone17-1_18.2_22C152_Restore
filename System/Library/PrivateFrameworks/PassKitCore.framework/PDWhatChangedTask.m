@interface PDWhatChangedTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithPassTypeIdentifier:(id)a3 subtasks:(id)a4;
- (BOOL)_matchesTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)gotUpdates;
- (NSSet)subtasks;
- (NSString)description;
- (NSString)passTypeIdentifier;
- (PDWhatChangedTask)initWithCoder:(id)a3;
- (id)_initWithPassTypeIdentifier:(id)a3 subtasks:(id)a4;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (void)_addTask:(id)a3;
- (void)_commonInit;
- (void)_updateForTaskDeactivation:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)performCancel;
- (void)performStart:(BOOL)a3;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)taskFailed:(id)a3;
- (void)taskFailedForAuthentication:(id)a3;
- (void)taskSucceeded:(id)a3;
@end

@implementation PDWhatChangedTask

+ (id)taskWithPassTypeIdentifier:(id)a3 subtasks:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) _initWithPassTypeIdentifier:v7 subtasks:v6];

  return v8;
}

- (id)_initWithPassTypeIdentifier:(id)a3 subtasks:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PDWhatChangedTask;
  v9 = [(PDNetworkTask *)&v21 init];
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    [(PDWhatChangedTask *)v9 _commonInit];
    objc_storeStrong(p_isa + 12, a3);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(p_isa, "_addTask:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v15), (void)v17);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }
  }
  return p_isa;
}

- (NSSet)subtasks
{
  v3 = +[NSSet setWithArray:self->_pendingTasks];
  v4 = [v3 setByAddingObjectsFromArray:self->_completedTasks];

  return (NSSet *)v4;
}

- (void)performStart:(BOOL)a3
{
  BOOL v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_pendingTasks;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        -[NSMutableArray addObject:](self->_activeTasks, "addObject:", v10, (void)v11);
        [v10 start:v3];
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)performCancel
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_pendingTasks;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "cancel", (void)v7);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  uint64_t v4 = objc_opt_class();
  return [(objc_class *)a3 isSubclassOfClass:v4];
}

- (int64_t)actionForInactiveTask:(id)a3
{
  return [(PDWhatChangedTask *)self _matchesTask:a3];
}

- (int64_t)actionForActiveTask:(id)a3
{
  if ([(PDWhatChangedTask *)self _matchesTask:a3]) {
    return 5;
  }
  else {
    return 0;
  }
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"'What changed?' task (%@)", self->_passTypeIdentifier];
}

- (BOOL)_matchesTask:(id)a3
{
  passTypeIdentifier = self->_passTypeIdentifier;
  uint64_t v4 = [a3 passTypeIdentifier];
  LOBYTE(passTypeIdentifier) = [(NSString *)passTypeIdentifier isEqualToString:v4];

  return (char)passTypeIdentifier;
}

- (void)task:(id)a3 gotResult:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  long long v7 = v6;
  if (!self->_gotUpdates)
  {
    long long v8 = [v6 serialNumbers];
    id v9 = [v8 count];

    if (v9)
    {
      self->_gotUpdates = 1;
      [(PDNetworkTask *)self reportStateChange];
    }
  }
  [(PDNetworkTask *)self deliverResult:v7 forSubtask:v10];
}

- (void)taskSucceeded:(id)a3
{
  completedTasks = self->_completedTasks;
  id v5 = a3;
  [(NSMutableArray *)completedTasks addObject:v5];
  [(NSMutableArray *)self->_activeTasks removeObject:v5];
  [(NSMutableArray *)self->_pendingTasks removeObject:v5];

  [(PDWhatChangedTask *)self _updateForTaskDeactivation:1];
}

- (void)taskFailed:(id)a3
{
  [(NSMutableArray *)self->_activeTasks removeObject:a3];
  [(PDWhatChangedTask *)self _updateForTaskDeactivation:0];
}

- (void)taskFailedForAuthentication:(id)a3
{
  [(NSMutableArray *)self->_activeTasks removeObject:a3];
  [(PDWhatChangedTask *)self _updateForTaskDeactivation:0];
}

- (void)task:(id)a3 encounteredError:(id)a4
{
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDWhatChangedTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PDWhatChangedTask;
  id v5 = [(PDNetworkTask *)&v30 initWithCoder:v4];
  id v6 = v5;
  if (v5)
  {
    [(PDWhatChangedTask *)v5 _commonInit];
    uint64_t v7 = objc_opt_class();
    long long v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"pendingTasks"];
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          [(PDWhatChangedTask *)v6 _addTask:*(void *)(*((void *)&v26 + 1) + 8 * (void)v13)];
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v11);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v14 = [v4 decodeObjectOfClasses:v8 forKey:@"completedTasks"];
    id v15 = [v14 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        long long v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          [(NSMutableArray *)v6->_completedTasks addObject:*(void *)(*((void *)&v22 + 1) + 8 * (void)v18)];
          long long v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v16);
    }

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v6->_passTypeIdentifier;
    v6->_passTypeIdentifier = (NSString *)v19;

    v6->_gotUpdates = [v4 decodeBoolForKey:@"gotUpdates"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDWhatChangedTask;
  id v4 = a3;
  [(PDNetworkTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_pendingTasks, @"pendingTasks", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_completedTasks forKey:@"completedTasks"];
  [v4 encodeObject:self->_passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v4 encodeBool:self->_gotUpdates forKey:@"gotUpdates"];
}

- (void)_commonInit
{
  id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  pendingTasks = self->_pendingTasks;
  self->_pendingTasks = v3;

  objc_super v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  completedTasks = self->_completedTasks;
  self->_completedTasks = v5;

  uint64_t v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  activeTasks = self->_activeTasks;
  self->_activeTasks = v7;
  _objc_release_x1(v7, activeTasks);
}

- (void)_addTask:(id)a3
{
  id v4 = a3;
  [v4 setManager:self];
  [(NSMutableArray *)self->_pendingTasks addObject:v4];
}

- (void)_updateForTaskDeactivation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableArray *)self->_activeTasks count])
  {
    if (v3)
    {
      [(PDNetworkTask *)self reportStateChange];
    }
  }
  else if ([(NSMutableArray *)self->_pendingTasks count])
  {
    [(PDNetworkTask *)self fail];
  }
  else
  {
    [(PDNetworkTask *)self succeed];
  }
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (BOOL)gotUpdates
{
  return self->_gotUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_completedTasks, 0);
  objc_storeStrong((id *)&self->_pendingTasks, 0);
}

@end