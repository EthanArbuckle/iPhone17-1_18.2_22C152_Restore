@interface ADAMServiceListenerDelegate
- (ADAMServiceListenerDelegate)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ADAMServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = (void *)MEMORY[0x223C9DB40]();
  v6 = [v4 valueForEntitlement:@"com.apple.audio.adam.xpc"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  uint64_t v8 = 560295540;
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v9 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v9) {
      goto LABEL_12;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v4 description];
    *(_DWORD *)v22 = 136315650;
    *(void *)&v22[4] = "ADAMServiceListenerDelegate.mm";
    *(_WORD *)&v22[12] = 1024;
    *(_DWORD *)&v22[14] = 39;
    *(_WORD *)&v22[18] = 2112;
    *(void *)&v22[20] = v12;
    _os_log_impl(&dword_2227C1000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Entitlement missing when connecting to ADAM: %@", v22, 0x1Cu);
  }
LABEL_12:
  v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4EF9A8];
  [v4 setExportedInterface:v13];

  v14 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4F1AC0];
  [v4 setRemoteObjectInterface:v14];

  v15 = [[ADAMServerDelegate alloc] initWithConnection:v4 andErrorCode:v8];
  [v4 setExportedObject:v15];
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v16 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v16) {
      goto LABEL_23;
    }
  }
  else
  {
    id v16 = (id)MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  v18 = v16;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = [v4 processIdentifier];
    v20 = "Failed";
    *(_DWORD *)v22 = 136315906;
    *(void *)&v22[4] = "ADAMServiceListenerDelegate.mm";
    *(_WORD *)&v22[12] = 1024;
    *(_DWORD *)&v22[14] = 51;
    if (v7) {
      v20 = "Success";
    }
    *(_WORD *)&v22[18] = 1024;
    *(_DWORD *)&v22[20] = v19;
    *(_WORD *)&v22[24] = 2080;
    *(void *)&v22[26] = v20;
    _os_log_impl(&dword_2227C1000, v18, OS_LOG_TYPE_INFO, "%25s:%-5d New XPC Connection to ADAM from pid: %d [%s]", v22, 0x22u);
  }

LABEL_23:
  [v4 resume:*(_OWORD *)v22, *(void *)&v22[16]];

  return 1;
}

- (ADAMServiceListenerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADAMServiceListenerDelegate;
  return [(ADAMServiceListenerDelegate *)&v3 init];
}

@end