@interface TUIElementTriggerBehaviorMap
- (BOOL)isEqual:(id)a3;
- (NSArray)allTriggers;
- (NSDictionary)triggerBehaviorMap;
- (NSDictionary)triggerRefIdMap;
- (TUIElementTriggerBehaviorMap)initWithMap:(id)a3;
- (TUIElementTriggerBehaviorMap)initWithMap:(id)a3 refIdMap:(id)a4;
- (id)behaviorDataForTrigger:(id)a3;
- (id)refIdForTrigger:(id)a3;
- (void)setTriggerBehaviorMap:(id)a3;
- (void)setTriggerRefIdMap:(id)a3;
@end

@implementation TUIElementTriggerBehaviorMap

- (NSArray)allTriggers
{
  return [(NSDictionary *)self->_triggerBehaviorMap allKeys];
}

- (TUIElementTriggerBehaviorMap)initWithMap:(id)a3
{
  return [(TUIElementTriggerBehaviorMap *)self initWithMap:a3 refIdMap:0];
}

- (TUIElementTriggerBehaviorMap)initWithMap:(id)a3 refIdMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIElementTriggerBehaviorMap;
  v9 = [(TUIElementTriggerBehaviorMap *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_triggerBehaviorMap, a3);
    objc_storeStrong((id *)&v10->_triggerRefIdMap, a4);
  }

  return v10;
}

- (id)behaviorDataForTrigger:(id)a3
{
  return [(NSDictionary *)self->_triggerBehaviorMap objectForKeyedSubscript:a3];
}

- (id)refIdForTrigger:(id)a3
{
  return [(NSDictionary *)self->_triggerRefIdMap objectForKeyedSubscript:a3];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TUIElementTriggerBehaviorMap *)a3;
  if (self == v4)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      v6 = v4;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    if (v7)
    {
      id v8 = [(TUIElementTriggerBehaviorMap *)self triggerBehaviorMap];
      v9 = [(TUIElementTriggerBehaviorMap *)v7 triggerBehaviorMap];

      if (v8 == v9)
      {
        unsigned __int8 v12 = 1;
      }
      else
      {
        v10 = [(TUIElementTriggerBehaviorMap *)self triggerBehaviorMap];
        v11 = [(TUIElementTriggerBehaviorMap *)v7 triggerBehaviorMap];
        unsigned __int8 v12 = [v10 isEqualToDictionary:v11];
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  return v12;
}

- (NSDictionary)triggerBehaviorMap
{
  return self->_triggerBehaviorMap;
}

- (void)setTriggerBehaviorMap:(id)a3
{
}

- (NSDictionary)triggerRefIdMap
{
  return self->_triggerRefIdMap;
}

- (void)setTriggerRefIdMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerRefIdMap, 0);

  objc_storeStrong((id *)&self->_triggerBehaviorMap, 0);
}

@end