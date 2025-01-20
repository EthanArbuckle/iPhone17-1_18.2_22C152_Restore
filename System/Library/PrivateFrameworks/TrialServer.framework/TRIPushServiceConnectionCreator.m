@interface TRIPushServiceConnectionCreator
- (id)connectionWithDelegate:(id)a3 environment:(unsigned __int8)a4;
@end

@implementation TRIPushServiceConnectionCreator

- (id)connectionWithDelegate:(id)a3 environment:(unsigned __int8)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"com.apple.triald.aps.sandbox-environment"];

  v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Sandbox mode enabled for APS: %d", (uint8_t *)v11, 8u);
  }

  if (v6) {
    v8 = objc_alloc_init(TRISandboxedPushServiceConnection);
  }
  else {
    v8 = [[TRIPushServiceConnection alloc] initWithDelegate:v4];
  }
  v9 = v8;

  return v9;
}

@end