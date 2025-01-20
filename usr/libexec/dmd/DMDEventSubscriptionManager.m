@interface DMDEventSubscriptionManager
- (BOOL)setEventSubscriptionRegistrations:(id)a3 error:(id *)a4;
- (DMDEventSubscriptionManager)init;
- (NSMutableDictionary)eventSubscriptionsByIdentifier;
- (id)eventStatusesByPayloadIdentifierSinceStartDate:(id)a3 organizationIdentifier:(id)a4;
- (id)eventsHandler;
- (void)setEventSubscriptionsByIdentifier:(id)a3;
- (void)setEventsHandler:(id)a3;
@end

@implementation DMDEventSubscriptionManager

- (DMDEventSubscriptionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMDEventSubscriptionManager;
  v2 = [(DMDEventSubscriptionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    eventSubscriptionsByIdentifier = v2->_eventSubscriptionsByIdentifier;
    v2->_eventSubscriptionsByIdentifier = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (BOOL)setEventSubscriptionRegistrations:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_super v6 = [(DMDEventSubscriptionManager *)self eventSubscriptionsByIdentifier];
  v7 = [v6 allKeys];
  id v24 = [v7 mutableCopy];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v11 = [v10 payloadMetadata];
        v12 = [v11 organization];
        v13 = [v12 identifier];

        v14 = [v11 identifier];
        v15 = [v10 identifier];
        v16 = [(DMDEventSubscriptionManager *)self eventSubscriptionsByIdentifier];
        v17 = [v16 objectForKeyedSubscript:v15];

        if (v17)
        {
          [(DMDEventSubscriptionRegistrationController *)v17 updateWithSubscriptionRegistration:v10];
        }
        else
        {
          objc_initWeak(&location, self);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1000487C8;
          v25[3] = &unk_1000CB028;
          objc_copyWeak(&v28, &location);
          id v26 = v14;
          id v27 = v13;
          v18 = objc_retainBlock(v25);
          v17 = [[DMDEventSubscriptionRegistrationController alloc] initWithSubscriptionRegistration:v10 streamEventsHandler:v18];
          v19 = [(DMDEventSubscriptionManager *)self eventSubscriptionsByIdentifier];
          [v19 setObject:v17 forKeyedSubscript:v15];

          objc_destroyWeak(&v28);
          objc_destroyWeak(&location);
        }
        [v24 removeObject:v15];
      }
      id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }

  v20 = [(DMDEventSubscriptionManager *)self eventSubscriptionsByIdentifier];
  [v20 removeObjectsForKeys:v24];

  return 1;
}

- (id)eventStatusesByPayloadIdentifierSinceStartDate:(id)a3 organizationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DMDEventSubscriptionManager *)self eventSubscriptionsByIdentifier];
  id v9 = [v8 copy];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100048984;
  v16[3] = &unk_1000CB050;
  id v17 = v7;
  id v10 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v9 count]];
  id v18 = v10;
  id v19 = v6;
  id v11 = v6;
  id v12 = v7;
  [v9 enumerateKeysAndObjectsUsingBlock:v16];
  v13 = v19;
  id v14 = v10;

  return v14;
}

- (id)eventsHandler
{
  return self->_eventsHandler;
}

- (void)setEventsHandler:(id)a3
{
}

- (NSMutableDictionary)eventSubscriptionsByIdentifier
{
  return self->_eventSubscriptionsByIdentifier;
}

- (void)setEventSubscriptionsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubscriptionsByIdentifier, 0);

  objc_storeStrong(&self->_eventsHandler, 0);
}

@end