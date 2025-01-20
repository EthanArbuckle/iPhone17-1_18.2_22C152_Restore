@interface SMCNotify
+ (BOOL)tokenIsValid:(int)a3;
+ (int)invalidToken;
+ (int)registerNotification:(const char *)a3 queue:(id)a4 callback:(id)a5;
+ (void)cancelToken:(int)a3;
+ (void)postNotificationName:(const char *)a3;
@end

@implementation SMCNotify

+ (BOOL)tokenIsValid:(int)a3
{
  return notify_is_valid_token(a3);
}

+ (int)registerNotification:(const char *)a3 queue:(id)a4 callback:(id)a5
{
  id v7 = a5;
  int out_token = -1;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__SMCNotify_registerNotification_queue_callback___block_invoke;
  v13[3] = &unk_1E6A5B9F0;
  id v14 = v7;
  id v8 = v7;
  uint32_t v9 = notify_register_dispatch(a3, &out_token, (dispatch_queue_t)a4, v13);
  if (out_token != -1 && v9 == 0) {
    int v11 = out_token;
  }
  else {
    int v11 = -1;
  }

  return v11;
}

+ (void)cancelToken:(int)a3
{
}

+ (int)invalidToken
{
  return -1;
}

uint64_t __49__SMCNotify_registerNotification_queue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)postNotificationName:(const char *)a3
{
}

@end