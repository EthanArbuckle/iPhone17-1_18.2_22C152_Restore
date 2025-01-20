@interface WRM_recommendationSimulator
- (WRM_recommendationSimulator)init;
- (void)dealloc;
- (void)handleMessage:(id)a3;
- (void)sendMessageForProcess:(unint64_t)a3 withArgs:(id)a4 forProcess:(int)a5;
- (void)triggerSetMeadowModeTimer:(id)a3;
- (void)triggerTerminiousRecommendation:(id)a3;
@end

@implementation WRM_recommendationSimulator

- (WRM_recommendationSimulator)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_recommendationSimulator;
  return [(WCM_Controller *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_recommendationSimulator;
  [(WCM_Controller *)&v2 dealloc];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:26, @"WRM_recommendationSimulator: received message: %@", a3 message];
  switch(uint64)
  {
    case 4uLL:
      [(WRM_recommendationSimulator *)self triggerGetMeadowModeTimer:a3];
      break;
    case 3uLL:
      [(WRM_recommendationSimulator *)self triggerSetMeadowModeTimer:a3];
      break;
    case 2uLL:
      [(WRM_recommendationSimulator *)self triggerTerminiousRecommendation:a3];
      break;
  }
}

- (void)triggerSetMeadowModeTimer:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (xpc_dictionary_get_value(value, "kSetMeadowModeTimer")) {
    +[WCM_Logging logLevel:26, @"WRM_recommendationSimulator: SetMeadowModeTimer %llu seconds", xpc_dictionary_get_uint64(value, "kSetMeadowModeTimer") message];
  }
}

- (void)triggerTerminiousRecommendation:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (xpc_dictionary_get_value(value, "kBTRecommendationEnabled")) {
    BOOL v5 = xpc_dictionary_get_uint64(value, "kBTRecommendationEnabled") != 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (xpc_dictionary_get_value(value, "kWIFIRecommendationEnabled")) {
    BOOL v6 = xpc_dictionary_get_uint64(value, "kWIFIRecommendationEnabled") != 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (xpc_dictionary_get_value(value, "kdirectWIFIRecommendationEnabled")) {
    BOOL v7 = xpc_dictionary_get_uint64(value, "kWIFIRecommendationEnabled") != 0;
  }
  else {
    BOOL v7 = 0;
  }
  xpc_object_t v8 = xpc_array_create(0, 0);
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "kWRMProximityLinkRecommendationType", 1uLL);
  xpc_dictionary_set_BOOL(v9, "kWRMProximityLinkisRecommended", v5);
  xpc_array_append_value(v8, v9);
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "kWRMProximityLinkRecommendationType", 0);
  xpc_dictionary_set_BOOL(v10, "kWRMProximityLinkisRecommended", v6);
  xpc_array_append_value(v8, v10);
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "kWRMProximityLinkRecommendationType", 2uLL);
  xpc_dictionary_set_BOOL(v11, "kWRMProximityLinkisRecommended", v7);
  xpc_array_append_value(v8, v11);
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v12, "kWRMApplicationTypeList", v8);
  [(WRM_recommendationSimulator *)self sendMessageForProcess:1305 withArgs:v12 forProcess:19];
  +[WCM_Logging logLevel:26 message:@"WRM_recommendationSimulator: Sending terminious recommendation"];
  size_t count = xpc_array_get_count(v8);
  if (count << 32)
  {
    size_t v14 = 0;
    if ((unint64_t)(int)count <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = (int)count;
    }
    do
    {
      xpc_object_t v16 = xpc_array_get_value(v8, v14);
      xpc_release(v16);
      ++v14;
    }
    while (v15 != v14);
  }
  xpc_release(v12);

  xpc_release(v8);
}

- (void)sendMessageForProcess:(unint64_t)a3 withArgs:(id)a4 forProcess:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  *(_OWORD *)keys = *(_OWORD *)off_10020DB50;
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  id v8 = [[+[WCM_Server singleton](WCM_Server, "singleton") getSessionSync:v5];
  if (v8)
  {
    +[WCM_Logging logLevel:26, @"WRM_recommendationSimulator: found session-> Sending message: %@", v7 message];
    [v8 sendMessage:v7];
  }
  else
  {
    +[WCM_Logging logLevel:26, @"WRM_recommendationSimulator: Sending message: %@", v7 message];
    +[WCM_Logging logLevel:26, @"no session for process id: %d", v5 message];
  }
  xpc_release(values[0]);
  xpc_release(v7);
}

@end