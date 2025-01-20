@interface TUITriggerStateUpdate
- (BOOL)hasUpdates;
- (NSArray)orderedKeys;
- (NSDictionary)triggerNameToTriggerMapping;
- (NSDictionary)triggerToStateMapping;
- (TUITriggerStateUpdate)initWithTriggerStateUpdate:(id)a3;
- (id)description;
- (id)namesForTriggersInUpdate;
- (unint64_t)observationModeForTriggerWithName:(id)a3;
- (unint64_t)stateForTriggerWithName:(id)a3;
- (void)setOrderedKeys:(id)a3;
- (void)setTriggerNameToTriggerMapping:(id)a3;
- (void)setTriggerToStateMapping:(id)a3;
@end

@implementation TUITriggerStateUpdate

- (TUITriggerStateUpdate)initWithTriggerStateUpdate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUITriggerStateUpdate;
  v5 = [(TUITriggerStateUpdate *)&v16 init];
  if (v5)
  {
    v6 = [v4 triggerNameToTriggerMapping];
    v7 = (NSDictionary *)[v6 copy];
    triggerNameToTriggerMapping = v5->_triggerNameToTriggerMapping;
    v5->_triggerNameToTriggerMapping = v7;

    v9 = [v4 triggerToStateMapping];
    v10 = (NSDictionary *)[v9 copy];
    triggerToStateMapping = v5->_triggerToStateMapping;
    v5->_triggerToStateMapping = v10;

    v12 = [v4 orderedKeys];
    v13 = (NSArray *)[v12 copy];
    orderedKeys = v5->_orderedKeys;
    v5->_orderedKeys = v13;
  }
  return v5;
}

- (unint64_t)stateForTriggerWithName:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSDictionary *)self->_triggerToStateMapping valueForKey:v4],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    id v7 = [v5 unsignedIntegerValue];
  }
  else
  {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (unint64_t)observationModeForTriggerWithName:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSDictionary *)self->_triggerNameToTriggerMapping valueForKey:v4],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    id v7 = [v5 observationMode];
  }
  else
  {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (id)namesForTriggersInUpdate
{
  return self->_orderedKeys;
}

- (BOOL)hasUpdates
{
  return [(NSArray *)self->_orderedKeys count] != 0;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<TUITriggerStateUpdate: %p> : \n Updates: %@", self, self->_triggerToStateMapping];
}

- (NSDictionary)triggerNameToTriggerMapping
{
  return self->_triggerNameToTriggerMapping;
}

- (void)setTriggerNameToTriggerMapping:(id)a3
{
}

- (NSDictionary)triggerToStateMapping
{
  return self->_triggerToStateMapping;
}

- (void)setTriggerToStateMapping:(id)a3
{
}

- (NSArray)orderedKeys
{
  return self->_orderedKeys;
}

- (void)setOrderedKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_triggerToStateMapping, 0);

  objc_storeStrong((id *)&self->_triggerNameToTriggerMapping, 0);
}

@end