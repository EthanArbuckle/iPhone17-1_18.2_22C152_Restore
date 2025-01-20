@interface MPActionGroup
+ (id)actionGroup;
- (MPActionGroup)init;
- (id)actions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)numberOfActions;
- (void)addAction:(id)a3;
- (void)addActions:(id)a3;
- (void)configureAction:(id)a3 atIndex:(int64_t)a4;
- (void)configureTarget;
- (void)copyActions:(id)a3;
- (void)dealloc;
- (void)insertAction:(id)a3 atIndex:(int64_t)a4;
- (void)insertActions:(id)a3 atIndex:(int64_t)a4;
- (void)removeActionsAtIndices:(id)a3;
- (void)removeAllActions;
- (void)setAction:(id)a3;
@end

@implementation MPActionGroup

+ (id)actionGroup
{
  v2 = objc_alloc_init(MPActionGroup);
  return v2;
}

- (MPActionGroup)init
{
  v4.receiver = self;
  v4.super_class = (Class)MPActionGroup;
  v2 = [(MPAction *)&v4 init];
  if (v2) {
    v2->_actions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MPActionGroup;
  [(MPAction *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPActionGroup;
  id v4 = [(MPAction *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "copyActions:", -[MPActionGroup actions](self, "actions"));
  return v4;
}

- (unint64_t)numberOfActions
{
  return (unint64_t)[(NSMutableArray *)self->_actions count];
}

- (id)actions
{
  return self->_actions;
}

- (void)addAction:(id)a3
{
  id v4 = +[NSMutableArray arrayWithObject:a3];
  id v5 = [(NSMutableArray *)self->_actions count];
  [(MPActionGroup *)self insertActions:v4 atIndex:v5];
}

- (void)insertAction:(id)a3 atIndex:(int64_t)a4
{
  objc_super v6 = +[NSMutableArray arrayWithObject:a3];
  [(MPActionGroup *)self insertActions:v6 atIndex:a4];
}

- (void)addActions:(id)a3
{
  id v5 = [(NSMutableArray *)self->_actions count];
  [(MPActionGroup *)self insertActions:a3 atIndex:v5];
}

- (void)insertActions:(id)a3 atIndex:(int64_t)a4
{
  int64_t v4 = a4;
  -[NSMutableArray insertObjects:atIndexes:](self->_actions, "insertObjects:atIndexes:", a3, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v11 setParent:self];
        [(MPActionGroup *)self configureAction:v11 atIndex:(char *)i + v4];
      }
      id v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      v4 += (int64_t)i;
    }
    while (v8);
  }
}

- (void)removeActionsAtIndices:(id)a3
{
  id v5 = -[NSMutableArray objectsAtIndexes:](self->_actions, "objectsAtIndexes:");
  [(NSMutableArray *)self->_actions removeObjectsAtIndexes:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setParent:0];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeAllActions
{
  objc_super v3 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [(NSMutableArray *)self->_actions count]);
  [(MPActionGroup *)self removeActionsAtIndices:v3];
}

- (void)copyActions:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          objc_enumerationMutation(a3);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) copy];
        [(MPActionGroup *)self addAction:v9];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)configureAction:(id)a3 atIndex:(int64_t)a4
{
  if (!self->super._action) {
    return;
  }
  id v7 = [a3 targetObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = +[MCAnimationTrigger animationTriggerForTargetPlugObjectID:withAnimationKey:](MCAnimationTrigger, "animationTriggerForTargetPlugObjectID:withAnimationKey:", [v7 objectID], objc_msgSend(a3, "animationKey"));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = +[MCActionTrigger actionTriggerForTargetPlugObjectID:withActionKey:](MCActionTrigger, "actionTriggerForTargetPlugObjectID:withActionKey:", [v7 objectID], objc_msgSend(a3, "actionKey"));
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = +[MCStateOperationExpression stateOperationForTargetPlugObjectID:withStateKey:andExpression:](MCStateOperationExpression, "stateOperationForTargetPlugObjectID:withStateKey:andExpression:", [v7 objectID], objc_msgSend(a3, "stateKey"), objc_msgSend(a3, "operation"));
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = +[MCConditionalAction conditionalActionWithPredicate:](MCConditionalAction, "conditionalActionWithPredicate:", [v7 objectID]);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v8 = +[MCActionGroup actionGroup];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v8 = +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:](MCGenericAction, "genericActionForTargetPlugObjectID:withAttributes:", [v7 objectID], objc_msgSend(a3, "attributes"));
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v9 = 0;
                goto LABEL_18;
              }
              uint64_t v8 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:](MCTransitionTrigger, "transitionForTargetPlugObjectID:withTransitionID:", [v7 objectID], objc_msgSend(a3, "transitionID"));
            }
          }
        }
      }
    }
  }
  id v9 = v8;
LABEL_18:
  [(MCAction *)self->super._action insertAction:v9 atIndex:a4];
  [a3 setAction:v9];
}

- (void)configureTarget
{
  v12.receiver = self;
  v12.super_class = (Class)MPActionGroup;
  [(MPAction *)&v12 configureTarget];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  actions = self->_actions;
  id v4 = [(NSMutableArray *)actions countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(actions);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) configureTarget];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)actions countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setAction:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MPActionGroup;
  [(MPAction *)&v14 setAction:a3];
  if ([(MPAction *)self parentDocument])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    actions = self->_actions;
    id v5 = [(NSMutableArray *)actions countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(actions);
          }
          [(MPActionGroup *)self configureAction:*(void *)(*((void *)&v10 + 1) + 8 * i) atIndex:(char *)i + v7];
        }
        id v6 = [(NSMutableArray *)actions countByEnumeratingWithState:&v10 objects:v15 count:16];
        v7 += (uint64_t)i;
      }
      while (v6);
    }
  }
}

@end