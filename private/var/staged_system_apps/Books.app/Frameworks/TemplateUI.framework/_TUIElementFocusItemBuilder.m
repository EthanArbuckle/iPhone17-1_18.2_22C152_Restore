@interface _TUIElementFocusItemBuilder
- (id)finalizeLinkEntities;
- (id)finalizeTriggers;
- (void)addLinkEntity:(id)a3;
- (void)addTrigger:(id)a3 withBehavior:(id)a4;
- (void)addTrigger:(id)a3 withRefId:(id)a4;
@end

@implementation _TUIElementFocusItemBuilder

- (void)addTrigger:(id)a3 withBehavior:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    actions = self->_actions;
    if (!actions)
    {
      v8 = (NSMutableDictionary *)objc_opt_new();
      v9 = self->_actions;
      self->_actions = v8;

      actions = self->_actions;
    }
    [(NSMutableDictionary *)actions setObject:v6 forKeyedSubscript:v10];
    [(NSMutableDictionary *)self->_actionsWithRefId setObject:0 forKeyedSubscript:v10];
  }
}

- (void)addTrigger:(id)a3 withRefId:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    actionsWithRefId = self->_actionsWithRefId;
    if (!actionsWithRefId)
    {
      v8 = (NSMutableDictionary *)objc_opt_new();
      v9 = self->_actionsWithRefId;
      self->_actionsWithRefId = v8;

      actionsWithRefId = self->_actionsWithRefId;
    }
    [(NSMutableDictionary *)actionsWithRefId setObject:v6 forKeyedSubscript:v10];
    [(NSMutableDictionary *)self->_actions setObject:0 forKeyedSubscript:v10];
  }
}

- (id)finalizeTriggers
{
  v2 = [[TUIElementTriggerBehaviorMap alloc] initWithMap:self->_actions refIdMap:self->_actionsWithRefId];

  return v2;
}

- (void)addLinkEntity:(id)a3
{
  id v4 = a3;
  linkEntities = self->_linkEntities;
  id v8 = v4;
  if (!linkEntities)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_linkEntities;
    self->_linkEntities = v6;

    id v4 = v8;
    linkEntities = self->_linkEntities;
  }
  [(NSMutableArray *)linkEntities addObject:v4];
}

- (id)finalizeLinkEntities
{
  id v2 = [(NSMutableArray *)self->_linkEntities copy];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_actionsWithRefId, 0);

  objc_storeStrong((id *)&self->_actions, 0);
}

@end