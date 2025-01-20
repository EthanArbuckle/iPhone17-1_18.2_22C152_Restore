@interface TUIMutableTriggerStateUpdate
- (TUIMutableTriggerStateUpdate)init;
- (id)orderedKeys;
- (id)triggerNameToTriggerMapping;
- (id)triggerToStateMapping;
- (void)addUpdateForTrigger:(id)a3 state:(unint64_t)a4;
@end

@implementation TUIMutableTriggerStateUpdate

- (TUIMutableTriggerStateUpdate)init
{
  v10.receiver = self;
  v10.super_class = (Class)TUIMutableTriggerStateUpdate;
  v2 = [(TUIMutableTriggerStateUpdate *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    triggerNameToTriggerMapping = v2->_triggerNameToTriggerMapping;
    v2->_triggerNameToTriggerMapping = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    triggerToStateMapping = v2->_triggerToStateMapping;
    v2->_triggerToStateMapping = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    orderedKeys = v2->_orderedKeys;
    v2->_orderedKeys = v7;
  }
  return v2;
}

- (void)addUpdateForTrigger:(id)a3 state:(unint64_t)a4
{
  orderedKeys = self->_orderedKeys;
  id v7 = a3;
  v8 = [v7 name];
  [(NSMutableArray *)orderedKeys addObject:v8];

  triggerToStateMapping = self->_triggerToStateMapping;
  objc_super v10 = +[NSNumber numberWithUnsignedInteger:a4];
  v11 = [v7 name];
  [(NSMutableDictionary *)triggerToStateMapping setValue:v10 forKey:v11];

  triggerNameToTriggerMapping = self->_triggerNameToTriggerMapping;
  id v13 = [v7 name];
  [(NSMutableDictionary *)triggerNameToTriggerMapping setValue:v7 forKey:v13];
}

- (id)orderedKeys
{
  return self->_orderedKeys;
}

- (id)triggerToStateMapping
{
  return self->_triggerToStateMapping;
}

- (id)triggerNameToTriggerMapping
{
  return self->_triggerNameToTriggerMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_triggerToStateMapping, 0);

  objc_storeStrong((id *)&self->_triggerNameToTriggerMapping, 0);
}

@end