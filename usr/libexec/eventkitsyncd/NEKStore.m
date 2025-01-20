@interface NEKStore
+ (id)storeForEventWithEnvironment:(id)a3;
+ (id)storeForReminderWithEnvironment:(id)a3;
- (NEKChangeObserver)changeObserver;
- (NEKStore)init;
- (NEKStore)initWithEnvironment:(id)a3;
- (id)environment;
- (id)freshEventStoreFor:(id)a3;
- (void)setChangeObserver:(id)a3;
@end

@implementation NEKStore

- (NEKStore)init
{
  return 0;
}

- (NEKStore)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NEKStore;
  v5 = [(NEKStore *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_environment, v4);
  }

  return v6;
}

+ (id)storeForEventWithEnvironment:(id)a3
{
  id v3 = a3;
  id v4 = [[NEKEventStore alloc] initWithEnvironment:v3];

  return v4;
}

+ (id)storeForReminderWithEnvironment:(id)a3
{
  id v3 = a3;
  id v4 = [[NEKReminderStore alloc] initWithEnvironment:v3];

  return v4;
}

- (id)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return WeakRetained;
}

- (id)freshEventStoreFor:(id)a3
{
  return 0;
}

- (NEKChangeObserver)changeObserver
{
  return self->_changeObserver;
}

- (void)setChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeObserver, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end