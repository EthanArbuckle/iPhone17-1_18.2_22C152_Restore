@interface PDSetupAssistantCompleteMonitor
+ (BOOL)hasCompletedSetupAssistant;
+ (id)lastSetupAssistantExitDate;
- (PDSetupAssistantCompleteMonitor)init;
- (PDSetupAssistantCompleteMonitor)initWithNotificationStreamManager:(id)a3;
- (id)createCurrentNotificationRegistrationState;
- (void)_checkIfCompleteWithAdditionalCompletion:(id)a3;
- (void)_handleSetupCompleteStatusChangeEvent;
- (void)dealloc;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)waitForSetupAssistantCompletion:(id)a3;
@end

@implementation PDSetupAssistantCompleteMonitor

- (PDSetupAssistantCompleteMonitor)init
{
  return 0;
}

- (PDSetupAssistantCompleteMonitor)initWithNotificationStreamManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDSetupAssistantCompleteMonitor;
  v6 = [(PDSetupAssistantCompleteMonitor *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationStreamManager, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completions = v7->_completions;
    v7->_completions = v8;

    unsigned __int8 v10 = +[PDSetupAssistantCompleteMonitor hasCompletedSetupAssistant];
    v7->_currentHasCompletedSetupAssistantState = v10;
    if ((v10 & 1) == 0) {
      [(PDNotificationStreamManager *)v7->_notificationStreamManager registerConsumer:v7];
    }
  }

  return v7;
}

- (void)dealloc
{
  [(PDNotificationStreamManager *)self->_notificationStreamManager unregisterConsumer:self];
  v3.receiver = self;
  v3.super_class = (Class)PDSetupAssistantCompleteMonitor;
  [(PDSetupAssistantCompleteMonitor *)&v3 dealloc];
}

- (void)waitForSetupAssistantCompletion:(id)a3
{
}

- (void)_checkIfCompleteWithAdditionalCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v4)
  {
    completions = self->_completions;
    id v6 = objc_retainBlock(v4);
    [(NSMutableArray *)completions addObject:v6];
  }
  if (self->_currentHasCompletedSetupAssistantState)
  {
    id v7 = [(NSMutableArray *)self->_completions copy];
    [(NSMutableArray *)self->_completions removeAllObjects];
  }
  else
  {
    id v7 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * i));
      }
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_handleSetupCompleteStatusChangeEvent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_currentHasCompletedSetupAssistantState = +[PDSetupAssistantCompleteMonitor hasCompletedSetupAssistant];
  os_unfair_lock_unlock(p_lock);
  [(PDSetupAssistantCompleteMonitor *)self _checkIfCompleteWithAdditionalCompletion:0];
}

+ (BOOL)hasCompletedSetupAssistant
{
  return off_1008066C0() ^ 1;
}

+ (id)lastSetupAssistantExitDate
{
  v2 = [(objc_class *)off_1008066C8() current];
  objc_super v3 = [v2 date];
  id v4 = v3;
  if (v3) {
    CFPropertyListRef v5 = v3;
  }
  else {
    CFPropertyListRef v5 = CFPreferencesCopyValue(@"SetupLastExit", @"com.apple.purplebuddy", @"mobile", kCFPreferencesAnyHost);
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(PDNotificationStreamRegistrationState);
  objc_super v3 = off_1008066D0();
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v3, 0);
    [(PDNotificationStreamRegistrationState *)v2 setNotificationNames:v4 forStream:0];
  }
  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
}

@end