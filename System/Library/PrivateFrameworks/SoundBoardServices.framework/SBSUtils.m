@interface SBSUtils
+ (id)connectionWithExportedObject:(id)a3;
+ (id)createProxyConnectionForRapportTarget:(id)a3;
+ (id)createProxyConnectionForXPCWithExportedObject:(id)a3 connection:(id *)a4;
@end

@implementation SBSUtils

+ (id)createProxyConnectionForRapportTarget:(id)a3
{
  id v3 = a3;
  v4 = [[SBSRemoteDeviceSender alloc] initWithDevice:v3];

  return v4;
}

+ (id)connectionWithExportedObject:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.soundboardservices.server" options:4096];
  v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E564238];
  [v4 setRemoteObjectInterface:v5];

  if (v3)
  {
    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E566250];
    [v4 setExportedInterface:v6];

    [v4 setExportedObject:v3];
  }
  v7 = [v4 remoteObjectInterface];
  v8 = [v7 classesForSelector:sel_getAllSyncedAlarmsAndTimers_ argumentIndex:0 ofReply:1];
  v9 = (void *)[v8 mutableCopy];

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [v9 addObjectsFromArray:v10];
  v11 = [v4 remoteObjectInterface];
  [v11 setClasses:v9 forSelector:sel_getAllSyncedAlarmsAndTimers_ argumentIndex:0 ofReply:1];

  [v4 setInterruptionHandler:&__block_literal_global_541];
  [v4 setInvalidationHandler:&__block_literal_global_158];
  [v4 resume];

  return v4;
}

void __41__SBSUtils_connectionWithExportedObject___block_invoke_156()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = _SBSLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "+[SBSUtils connectionWithExportedObject:]_block_invoke";
    _os_log_impl(&dword_230B2C000, v0, OS_LOG_TYPE_DEFAULT, "%s - Connection to SoundBoard server was invalidated!\n", (uint8_t *)&v1, 0xCu);
  }
}

void __41__SBSUtils_connectionWithExportedObject___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = _SBSLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "+[SBSUtils connectionWithExportedObject:]_block_invoke";
    _os_log_impl(&dword_230B2C000, v0, OS_LOG_TYPE_DEFAULT, "%s - Connection to SoundBoard server was interrupted!\n", (uint8_t *)&v1, 0xCu);
  }
}

+ (id)createProxyConnectionForXPCWithExportedObject:(id)a3 connection:(id *)a4
{
  v5 = +[SBSUtils connectionWithExportedObject:a3];
  if (a4) {
    objc_storeStrong(a4, v5);
  }
  v6 = [v5 remoteObjectProxy];

  return v6;
}

@end