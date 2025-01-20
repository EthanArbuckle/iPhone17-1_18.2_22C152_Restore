@interface SWCGetServerConnection
@end

@implementation SWCGetServerConnection

void ___SWCGetServerConnection_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (qword_1EB67B168 != -1) {
    dispatch_once(&qword_1EB67B168, &__block_literal_global_101);
  }
  v0 = qword_1EB67B160;
  if (os_log_type_enabled((os_log_t)qword_1EB67B160, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138543362;
    v2 = @"com.apple.SharedWebCredentials";
    _os_log_impl(&dword_1ABCD7000, v0, OS_LOG_TYPE_DEFAULT, "disconnect event interruption received for service %{public}@", (uint8_t *)&v1, 0xCu);
  }
}

void ___SWCGetServerConnection_block_invoke_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (qword_1EB67B168 != -1) {
    dispatch_once(&qword_1EB67B168, &__block_literal_global_101);
  }
  v0 = qword_1EB67B160;
  if (os_log_type_enabled((os_log_t)qword_1EB67B160, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 138543362;
    uint64_t v3 = @"com.apple.SharedWebCredentials";
    _os_log_impl(&dword_1ABCD7000, v0, OS_LOG_TYPE_DEFAULT, "disconnect event invalidation received for service %{public}@", (uint8_t *)&v2, 0xCu);
  }
  os_unfair_lock_lock(&gLock);
  int v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = 0;

  os_unfair_lock_unlock(&gLock);
}

@end