@interface PDScheduledActivityClient
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSMutableDictionary)activityRegistrations;
- (OS_dispatch_queue)activityQueue;
- (PDScheduledActivityClient)clientInstance;
- (PDScheduledActivityClient)initWithClientInstance:(id)a3 activityQueue:(id)a4;
- (PDScheduledActivityClient)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityQueue:(id)a3;
- (void)setActivityRegistrations:(id)a3;
- (void)setClientInstance:(id)a3;
@end

@implementation PDScheduledActivityClient

- (PDScheduledActivityClient)initWithClientInstance:(id)a3 activityQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PDScheduledActivityClient;
  v8 = [(PDScheduledActivityClient *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_clientInstance, v6);
    objc_storeStrong((id *)&v9->_activityQueue, a4);
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    activityRegistrations = v9->_activityRegistrations;
    v9->_activityRegistrations = (NSMutableDictionary *)v10;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDScheduledActivityClient)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDScheduledActivityClient;
  v5 = [(PDScheduledActivityClient *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"activityRegistrations"];
    activityRegistrations = v5->_activityRegistrations;
    v5->_activityRegistrations = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isValid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInstance);
  if (WeakRetained) {
    BOOL v4 = self->_activityQueue != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (PDScheduledActivityClient)clientInstance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientInstance);
  return (PDScheduledActivityClient *)WeakRetained;
}

- (void)setClientInstance:(id)a3
{
}

- (OS_dispatch_queue)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
}

- (NSMutableDictionary)activityRegistrations
{
  return self->_activityRegistrations;
}

- (void)setActivityRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityRegistrations, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_destroyWeak((id *)&self->_clientInstance);
}

@end