@interface TUIStateAndActionBuilder
- (id)finalizeAnimationGroups;
- (id)finalizeStateMapWithContext:(id)a3;
- (id)finalizeTriggers;
- (void)addAnimationGroup:(id)a3 withName:(id)a4;
- (void)addModel:(id)a3 forState:(id)a4;
- (void)addTrigger:(id)a3 withBehavior:(id)a4;
@end

@implementation TUIStateAndActionBuilder

- (void)addTrigger:(id)a3 withBehavior:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  actionsMap = self->_actionsMap;
  if (!actionsMap)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_actionsMap;
    self->_actionsMap = v8;

    actionsMap = self->_actionsMap;
  }
  [(NSMutableDictionary *)actionsMap setObject:v6 forKeyedSubscript:v10];
}

- (id)finalizeTriggers
{
  v2 = [[TUIElementTriggerBehaviorMap alloc] initWithMap:self->_actionsMap];

  return v2;
}

- (void)addModel:(id)a3 forState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_states)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    states = self->_states;
    self->_states = v8;
  }
  id v10 = objc_alloc_init(TUIStateModel);
  [(TUIStateModel *)v10 setState:v7];
  id v12 = v6;
  v11 = +[NSArray arrayWithObjects:&v12 count:1];
  [(TUISingleModelContainer *)v10 updateModelChildren:v11];

  [(NSMutableDictionary *)self->_states setObject:v10 forKey:v7];
}

- (id)finalizeStateMapWithContext:(id)a3
{
  return self->_states;
}

- (void)addAnimationGroup:(id)a3 withName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  animations = self->_animations;
  if (!animations)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_animations;
    self->_animations = v8;

    animations = self->_animations;
  }
  [(NSMutableDictionary *)animations setObject:v10 forKeyedSubscript:v6];
}

- (id)finalizeAnimationGroups
{
  if ([(NSMutableDictionary *)self->_animations count])
  {
    v3 = objc_alloc_init(TUIAnimationGroupCollection);
    [(TUIAnimationGroupCollection *)v3 setGroups:self->_animations];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_states, 0);

  objc_storeStrong((id *)&self->_actionsMap, 0);
}

@end