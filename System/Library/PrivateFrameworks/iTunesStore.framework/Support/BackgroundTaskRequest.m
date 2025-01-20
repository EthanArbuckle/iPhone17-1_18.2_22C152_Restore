@interface BackgroundTaskRequest
+ (id)networkAvailableRequest;
+ (id)pluggedInRequest;
+ (id)wifiAvailableRequest;
- (BackgroundTaskRequest)init;
- (BackgroundTaskRequest)initWithBackgroundTaskAgentJob:(id)a3;
- (NSString)requestIdentifier;
- (id)copyBackgroundTaskAgentJob;
- (id)valueForBackgroundTaskAgentKey:(const char *)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setValue:(id)a3 forBackgroundTaskAgentKey:(const char *)a4;
@end

@implementation BackgroundTaskRequest

- (BackgroundTaskRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)BackgroundTaskRequest;
  v2 = [(BackgroundTaskRequest *)&v6 init];
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    job = v2->_job;
    v2->_job = v3;
  }
  return v2;
}

- (BackgroundTaskRequest)initWithBackgroundTaskAgentJob:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BackgroundTaskRequest;
  v5 = [(BackgroundTaskRequest *)&v9 init];
  if (v5)
  {
    objc_super v6 = (OS_xpc_object *)xpc_copy(v4);
    job = v5->_job;
    v5->_job = v6;
  }
  return v5;
}

+ (id)networkAvailableRequest
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  id v4 = [objc_alloc((Class)a1) initWithBackgroundTaskAgentJob:v3];
  [v4 setRequestIdentifier:@"com.apple.itunesstored.BackgroundTaskRequest.networkAvailableRequest"];

  return v4;
}

+ (id)pluggedInRequest
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 0);
  id v4 = [objc_alloc((Class)a1) initWithBackgroundTaskAgentJob:v3];
  [v4 setRequestIdentifier:@"com.apple.itunesstored.BackgroundTaskRequest.pluggedInRequest"];

  return v4;
}

+ (id)wifiAvailableRequest
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  id v4 = [objc_alloc((Class)a1) initWithBackgroundTaskAgentJob:v3];
  [v4 setRequestIdentifier:@"com.apple.itunesstored.BackgroundTaskRequest.wifiAvailableRequest"];

  return v4;
}

- (id)copyBackgroundTaskAgentJob
{
  return xpc_copy(self->_job);
}

- (void)setValue:(id)a3 forBackgroundTaskAgentKey:(const char *)a4
{
}

- (id)valueForBackgroundTaskAgentKey:(const char *)a3
{
  return xpc_dictionary_get_value(self->_job, a3);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_job, 0);
}

@end