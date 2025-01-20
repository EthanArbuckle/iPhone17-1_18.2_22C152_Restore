@interface NEKChangeObserver
+ (id)changeObserverForEventWithQueue:(id)a3 databaseController:(id)a4 environment:(id)a5;
+ (id)changeObserverForReminderWithQueue:(id)a3 databaseController:(id)a4 environment:(id)a5;
- (NEKChangeObserver)init;
- (NEKChangeObserver)initWithEnvironment:(id)a3;
- (NEKChangeObserverDelegate)delegate;
- (id)environment;
- (void)setDelegate:(id)a3;
@end

@implementation NEKChangeObserver

- (NEKChangeObserver)init
{
  return 0;
}

- (NEKChangeObserver)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEKChangeObserver;
  v5 = [(NEKChangeObserver *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    uint64_t v7 = sub_100006A20("changeObserver.keyqueue");
    keyQueue = v6->_keyQueue;
    v6->_keyQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

+ (id)changeObserverForEventWithQueue:(id)a3 databaseController:(id)a4 environment:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [[NEKEventChangeObserver alloc] initWithQueue:v9 environment:v7];

  [(NEKEventChangeObserver *)v10 setWeakEventDatabaseController:v8];

  return v10;
}

+ (id)changeObserverForReminderWithQueue:(id)a3 databaseController:(id)a4 environment:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [[NEKReminderChangeObserver alloc] initWithQueue:v9 environment:v7];

  [(NEKReminderChangeObserver *)v10 setWeakReminderDatabaseController:v8];

  return v10;
}

- (id)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return WeakRetained;
}

- (NEKChangeObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NEKChangeObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_keyQueue, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end