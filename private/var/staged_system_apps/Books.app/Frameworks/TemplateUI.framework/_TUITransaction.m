@interface _TUITransaction
- (BOOL)isCommitted;
- (BOOL)isCommittedAndIfNotNotifyWithBlock:(id)a3;
- (NSArray)allCategories;
- (NSArray)callstack;
- (NSDate)creationDate;
- (NSHashTable)dependees;
- (NSMutableArray)commitBlocks;
- (NSMutableSet)categories;
- (NSString)description;
- (NSString)name;
- (OS_dispatch_group)completionGroup;
- (OS_dispatch_group)notifyAppliedGroup;
- (OS_dispatch_group)subTransactionCompletionGroup;
- (TUITransactionOptions)options;
- (_TUITransaction)initWithName:(id)a3 options:(id)a4;
- (id)_isDependentOn:(id)a3;
- (id)predecessors;
- (id)redactedDescription;
- (int64_t)compareIdentifier:(id)a3;
- (unint64_t)flags;
- (unint64_t)identifier;
- (void)_addDependentOn:(id)a3;
- (void)addCategory:(id)a3;
- (void)addCompletion:(id)a3 queue:(id)a4;
- (void)addCompletionDeferral;
- (void)addNotifyWhenAppliedDeferral;
- (void)addSubTransaction:(id)a3 completionQueue:(id)a4;
- (void)addSubTransactionCompletion:(id)a3 queue:(id)a4;
- (void)addSubTransactionCompletionDeferral;
- (void)commit;
- (void)dependentOn:(id)a3;
- (void)notifyWhenAppliedWithBlock:(id)a3;
- (void)removeCompletionDeferral;
- (void)removeNotifyWhenAppliedDeferral;
- (void)removeSubTransactionCompletionDeferral;
- (void)setFlags:(unint64_t)a3;
@end

@implementation _TUITransaction

- (NSString)description
{
  return (NSString *)[(_TUITransaction *)self redactedDescription];
}

- (id)redactedDescription
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = (void *)v4;
  options = self->_options;
  unint64_t identifier = self->_identifier;
  unint64_t flags = self->_flags;
  if (self->_name)
  {
    v9 = +[NSString stringWithFormat:@" name=%@", self->_name];
    v10 = +[NSString stringWithFormat:@"<%@ %p id=%lu flags=%lu options=%@ %@>", v5, self, identifier, flags, options, v9];
  }
  else
  {
    v10 = +[NSString stringWithFormat:@"<%@ %p id=%lu flags=%lu options=%@ %@>", v4, self, identifier, flags, self->_options, &stru_257BF0];
  }

  return v10;
}

- (int64_t)compareIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t identifier = self->_identifier;
  if (identifier >= (unint64_t)[v4 identifier])
  {
    unint64_t v7 = self->_identifier;
    int64_t v6 = v7 > (unint64_t)[v4 identifier];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (_TUITransaction)initWithName:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_TUITransaction;
  v8 = [(_TUITransaction *)&v25 init];
  v9 = v8;
  if (v8)
  {
    v8->_stateLock._os_unfair_lock_opaque = 0;
    v8->_unint64_t identifier = atomic_fetch_add(&qword_2DF178, 1uLL);
    v10 = (NSString *)[v6 copy];
    name = v9->_name;
    v9->_name = v10;

    v12 = (TUITransactionOptions *)[v7 copy];
    options = v9->_options;
    v9->_options = v12;

    dispatch_group_t v14 = dispatch_group_create();
    completionGroup = v9->_completionGroup;
    v9->_completionGroup = (OS_dispatch_group *)v14;

    dispatch_group_t v16 = dispatch_group_create();
    subTransactionCompletionGroup = v9->_subTransactionCompletionGroup;
    v9->_subTransactionCompletionGroup = (OS_dispatch_group *)v16;

    dispatch_group_t v18 = dispatch_group_create();
    notifyAppliedGroup = v9->_notifyAppliedGroup;
    v9->_notifyAppliedGroup = (OS_dispatch_group *)v18;

    uint64_t v20 = +[NSDate date];
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v20;

    if (qword_2DF188 != -1) {
      dispatch_once(&qword_2DF188, &stru_251A50);
    }
    if (byte_2DF180)
    {
      uint64_t v22 = +[NSThread callStackSymbols];
      callstack = v9->_callstack;
      v9->_callstack = (NSArray *)v22;
    }
    *(unsigned char *)&v9->_state = 0;
    dispatch_group_enter((dispatch_group_t)v9->_notifyAppliedGroup);
  }

  return v9;
}

- (void)addCompletion:(id)a3 queue:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = v10;
  v8 = v6;
  if (v10)
  {
    if (!v6)
    {
      v8 = &_dispatch_main_q;
      id v9 = &_dispatch_main_q;
      id v7 = v10;
    }
    TUIDispatchGroupNotifyViaRunloopIfMain(self->_completionGroup, v8, v7);
  }
}

- (void)addCompletionDeferral
{
}

- (void)removeCompletionDeferral
{
}

- (id)_isDependentOn:(id)a3
{
  id v4 = a3;
  id v6 = objc_opt_new();
  id v7 = [_TUITransactionPathComponent alloc];
  id v8 = +[NSSet setWithObject:self];
  id v9 = [v8 objectEnumerator];
  id v10 = [(_TUITransactionPathComponent *)v7 initWithTransaction:0 enumerator:v9];
  [v6 addObject:v10];

  while (1)
  {
    while (1)
    {

      if (![v6 count])
      {
        id v17 = 0;
        goto LABEL_20;
      }
      v11 = [v6 lastObject];
      v12 = [v11 enumerator];
      id v8 = [v12 nextObject];

      if (v8) {
        break;
      }
      [v6 removeLastObject];
    }
    if (v8 == v4) {
      break;
    }
    v13 = [v8 predecessors];
    if ([v13 count])
    {
      dispatch_group_t v14 = [_TUITransactionPathComponent alloc];
      v15 = [v13 objectEnumerator];
      dispatch_group_t v16 = [(_TUITransactionPathComponent *)v14 initWithTransaction:v8 enumerator:v15];
      [v6 addObject:v16];
    }
  }
  id v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  [v18 addObject:v4];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v19 = [v6 reverseObjectEnumerator];
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_super v25 = [v24 transaction];

        if (v25)
        {
          v26 = [v24 transaction];
          [v18 addObject:v26];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v21);
  }

  [v18 addObject:v4];
  id v17 = [v18 copy];

LABEL_20:

  return v17;
}

- (void)_addDependentOn:(id)a3
{
  id v4 = (_TUITransaction *)a3;
  v5 = v4;
  if (v4 != self)
  {
    id v6 = [(_TUITransaction *)v4 _isDependentOn:self];
    id v7 = TUITransactionLog();
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_190A48((uint64_t)self, (uint64_t)v5, v8);
      }

      [v6 enumerateObjectsUsingBlock:&stru_251968];
      v12 = +[NSString stringWithFormat:@"%@ <--> %@", self, v5];
      id v13 = +[NSException exceptionWithName:@"TemplateUI.CyclicTransactionDependency" reason:v12 userInfo:0];

      objc_exception_throw(v13);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&def_141F14, v8, OS_LOG_TYPE_INFO, "adding dependency: %{public}@ <-- %{public}@", buf, 0x16u);
    }

    os_unfair_lock_lock(&self->_stateLock);
    dependees = self->_dependees;
    if (!dependees)
    {
      id v10 = +[NSHashTable hashTableWithOptions:517];
      v11 = self->_dependees;
      self->_dependees = v10;

      dependees = self->_dependees;
    }
    [(NSHashTable *)dependees addObject:v5];
    os_unfair_lock_unlock(&self->_stateLock);
  }
}

- (void)dependentOn:(id)a3
{
  if (a3) {
    -[_TUITransaction _addDependentOn:](self, "_addDependentOn:");
  }
}

- (id)predecessors
{
  return [(NSHashTable *)self->_dependees setRepresentation];
}

- (void)addSubTransactionCompletionDeferral
{
}

- (void)removeSubTransactionCompletionDeferral
{
}

- (void)addSubTransaction:(id)a3 completionQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (self->_flags) {
      [v6 setFlags:[v6 flags] | 1];
    }
    [v6 setFlags:[v6 flags] | 2];
    dispatch_group_enter((dispatch_group_t)self->_subTransactionCompletionGroup);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_14F70;
    v9[3] = &unk_251990;
    v9[4] = self;
    [v6 addSubTransactionCompletion:v9 queue:v7];
    dispatch_group_enter((dispatch_group_t)self->_notifyAppliedGroup);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_14F7C;
    v8[3] = &unk_251990;
    v8[4] = self;
    [v6 notifyWhenAppliedWithBlock:v8];
  }
}

- (void)addSubTransactionCompletion:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && a4)
  {
    subTransactionCompletionGroup = self->_subTransactionCompletionGroup;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_15038;
    v9[3] = &unk_2519B8;
    id v10 = v6;
    TUIDispatchGroupNotifyViaRunloopIfMain(subTransactionCompletionGroup, a4, v9);
  }
}

- (void)addCategory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_lock_lock_with_options();
    categories = self->_categories;
    if (!categories)
    {
      id v6 = (NSMutableSet *)objc_opt_new();
      id v7 = self->_categories;
      self->_categories = v6;

      categories = self->_categories;
    }
    [(NSMutableSet *)categories addObject:v8];
    os_unfair_lock_unlock(&self->_stateLock);
    id v4 = v8;
  }
}

- (NSArray)allCategories
{
  return (NSArray *)[(NSMutableSet *)self->_categories allObjects];
}

- (void)addNotifyWhenAppliedDeferral
{
}

- (void)removeNotifyWhenAppliedDeferral
{
}

- (void)notifyWhenAppliedWithBlock:(id)a3
{
}

- (void)commit
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  char state = (char)self->_state;
  *(unsigned char *)&self->_char state = state | 1;
  v5 = self->_commitBlocks;
  commitBlocks = self->_commitBlocks;
  self->_commitBlocks = 0;

  os_unfair_lock_unlock(p_stateLock);
  if ((state & 1) == 0)
  {
    subTransactionCompletionGroup = self->_subTransactionCompletionGroup;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_15294;
    v17[3] = &unk_251990;
    v17[4] = self;
    TUIDispatchGroupNotifyViaRunloopIfMain(subTransactionCompletionGroup, &_dispatch_main_q, v17);
    if (v5)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = v5;
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12));
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
        }
        while (v10);
      }
    }
  }
}

- (BOOL)isCommitted
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(unsigned char *)&v2->_state & 1;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isCommittedAndIfNotNotifyWithBlock:(id)a3
{
  id v4 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  char state = (char)self->_state;
  if ((state & 1) == 0)
  {
    commitBlocks = self->_commitBlocks;
    if (!commitBlocks)
    {
      id v8 = (NSMutableArray *)objc_opt_new();
      id v9 = self->_commitBlocks;
      self->_commitBlocks = v8;

      commitBlocks = self->_commitBlocks;
    }
    id v10 = [v4 copy];
    id v11 = objc_retainBlock(v10);
    [(NSMutableArray *)commitBlocks addObject:v11];
  }
  os_unfair_lock_unlock(p_stateLock);

  return state & 1;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (TUITransactionOptions)options
{
  return self->_options;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_unint64_t flags = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSHashTable)dependees
{
  return self->_dependees;
}

- (OS_dispatch_group)completionGroup
{
  return self->_completionGroup;
}

- (OS_dispatch_group)subTransactionCompletionGroup
{
  return self->_subTransactionCompletionGroup;
}

- (OS_dispatch_group)notifyAppliedGroup
{
  return self->_notifyAppliedGroup;
}

- (NSMutableArray)commitBlocks
{
  return self->_commitBlocks;
}

- (NSMutableSet)categories
{
  return self->_categories;
}

- (NSArray)callstack
{
  return self->_callstack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callstack, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_commitBlocks, 0);
  objc_storeStrong((id *)&self->_notifyAppliedGroup, 0);
  objc_storeStrong((id *)&self->_subTransactionCompletionGroup, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_dependees, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end