@interface MCActionGroup
+ (id)actionGroup;
- (MCActionGroup)init;
- (MCActionGroup)initWithImprint:(id)a3;
- (NSArray)actions;
- (id)actionAtIndex:(unint64_t)a3;
- (id)description;
- (id)imprint;
- (unint64_t)countOfActions;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addAction:(id)a3;
- (void)addActions:(id)a3;
- (void)demolish;
- (void)insertAction:(id)a3 atIndex:(unint64_t)a4;
- (void)insertActions:(id)a3 atIndex:(unint64_t)a4;
- (void)moveActionsAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)removeActionsAtIndices:(id)a3;
- (void)removeAllActions;
@end

@implementation MCActionGroup

+ (id)actionGroup
{
  v2 = objc_alloc_init(MCActionGroup);
  return v2;
}

- (MCActionGroup)init
{
  v4.receiver = self;
  v4.super_class = (Class)MCActionGroup;
  v2 = [(MCActionGroup *)&v4 init];
  if (v2) {
    v2->_actions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (MCActionGroup)initWithImprint:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MCActionGroup;
  objc_super v4 = -[MCAction initWithImprint:](&v16, "initWithImprint:");
  if (v4)
  {
    id v5 = [a3 objectForKey:@"actions"];
    if (v5)
    {
      v6 = v5;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          v10 = 0;
          do
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            [(NSMutableArray *)v4->_actions addObject:+[MCObjectLight objectWithImprint:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10)]];
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        }
        while (v8);
      }
    }
  }
  return v4;
}

- (void)demolish
{
  actions = self->_actions;
  objc_sync_enter(actions);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v4 = self->_actions;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->_actions = 0;
  objc_sync_exit(actions);
  v8.receiver = self;
  v8.super_class = (Class)MCActionGroup;
  [(MCAction *)&v8 demolish];
}

- (id)imprint
{
  v15.receiver = self;
  v15.super_class = (Class)MCActionGroup;
  id v3 = [(MCAction *)&v15 imprint];
  objc_super v4 = [(MCActionGroup *)self actions];
  if ([(NSArray *)v4 count])
  {
    id v5 = +[NSMutableArray array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        long long v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "imprint"));
          long long v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
    [v3 setObject:v5 forKey:@"actions"];
  }
  return v3;
}

- (NSArray)actions
{
  unsigned __int8 v3 = [(MCAction *)self isSnapshot];
  actions = self->_actions;
  if ((v3 & 1) == 0)
  {
    objc_sync_enter(self->_actions);
    id v5 = +[NSArray arrayWithArray:self->_actions];
    objc_sync_exit(actions);
    return v5;
  }
  return &actions->super;
}

- (unint64_t)countOfActions
{
  unsigned int v3 = [(MCAction *)self isSnapshot];
  actions = self->_actions;
  if (v3)
  {
    id v5 = self->_actions;
    return (unint64_t)[(NSMutableArray *)v5 count];
  }
  else
  {
    objc_sync_enter(self->_actions);
    id v7 = [(NSMutableArray *)self->_actions count];
    objc_sync_exit(actions);
    return (unint64_t)v7;
  }
}

- (id)actionAtIndex:(unint64_t)a3
{
  unsigned int v5 = [(MCAction *)self isSnapshot];
  actions = self->_actions;
  if (v5)
  {
    id v7 = self->_actions;
    return [(NSMutableArray *)v7 objectAtIndex:a3];
  }
  else
  {
    objc_sync_enter(self->_actions);
    id v9 = [(NSMutableArray *)self->_actions objectAtIndex:a3];
    objc_sync_exit(actions);
    return v9;
  }
}

- (void)addAction:(id)a3
{
  objc_super v4 = +[NSArray arrayWithObject:a3];
  unint64_t v5 = [(MCActionGroup *)self countOfActions];
  [(MCActionGroup *)self insertActions:v4 atIndex:v5];
}

- (void)addActions:(id)a3
{
  unint64_t v5 = [(MCActionGroup *)self countOfActions];
  [(MCActionGroup *)self insertActions:a3 atIndex:v5];
}

- (void)insertAction:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = +[NSArray arrayWithObject:a3];
  [(MCActionGroup *)self insertActions:v6 atIndex:a4];
}

- (void)insertActions:(id)a3 atIndex:(unint64_t)a4
{
  actions = self->_actions;
  objc_sync_enter(actions);
  -[NSMutableArray insertObjects:atIndexes:](self->_actions, "insertObjects:atIndexes:", a3, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]));
  objc_sync_exit(actions);
}

- (void)removeActionsAtIndices:(id)a3
{
  actions = self->_actions;
  objc_sync_enter(actions);
  [(NSMutableArray *)self->_actions removeObjectsAtIndexes:a3];
  objc_sync_exit(actions);
}

- (void)removeAllActions
{
  actions = self->_actions;
  objc_sync_enter(actions);
  [(NSMutableArray *)self->_actions removeAllObjects];
  objc_sync_exit(actions);
}

- (void)moveActionsAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  actions = self->_actions;
  objc_sync_enter(actions);
  id v8 = [(NSMutableArray *)self->_actions objectsAtIndexes:a3];
  [(NSMutableArray *)self->_actions removeObjectsAtIndexes:a3];
  -[NSMutableArray insertObjects:atIndexes:](self->_actions, "insertObjects:atIndexes:", v8, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]));
  objc_sync_exit(actions);
}

- (void)_copySelfToSnapshot:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MCActionGroup;
  -[MCAction _copySelfToSnapshot:](&v14, "_copySelfToSnapshot:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = [(MCActionGroup *)self actions];
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*((id *)a3 + 3), "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "snapshot"));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)MCActionGroup;
  id v3 = objc_msgSend(-[MCAction description](&v14, "description"), "stringByAppendingString:", @": {\n");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  actions = self->_actions;
  id v5 = [(NSMutableArray *)actions countByEnumeratingWithState:&v10 objects:v15 count:16];
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
          objc_enumerationMutation(actions);
        }
        id v3 = [v3 stringByAppendingFormat:@"\t\t%@\n", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)actions countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
  return [v3 stringByAppendingString:@"\t}"];
}

@end