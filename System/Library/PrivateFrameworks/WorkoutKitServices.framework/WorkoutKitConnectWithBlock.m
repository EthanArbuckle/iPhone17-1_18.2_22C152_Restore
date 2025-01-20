@interface WorkoutKitConnectWithBlock
@end

@implementation WorkoutKitConnectWithBlock

void ___WorkoutKitConnectWithBlock_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void ___WorkoutKitConnectWithBlock_block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [NSString alloc];
  v4 = v3;
  if (v2)
  {
    v5 = [v2 _xpcConnection];
    v6 = (void *)[v4 initWithFormat:@"Connection to %@ invalidated, reason: %s", @"com.apple.WorkoutKitXPCService", xpc_connection_copy_invalidation_reason()];
  }
  else
  {
    v6 = (void *)[v3 initWithFormat:@"Connection to %@ invalidated, reason: %s", @"com.apple.WorkoutKitXPCService", "null XPC connection"];
  }
  v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F07F70];
  uint64_t v11 = *MEMORY[0x263F07F80];
  v12[0] = v6;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v10 = [v7 errorWithDomain:v8 code:-100 userInfo:v9];

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v10);
}

@end