@interface NFMWhereIsMyCompanionConnection
+ (id)sharedDeviceConnection;
- (NFMWhereIsMyCompanionConnection)init;
- (id)serverConnection;
- (uint64_t)playSoundAndLEDCompletion;
- (uint64_t)playSoundCompletion;
- (void)_cleanUpServerConnection:(id)a3;
- (void)applicationIdentifierWithReply:(id)a3;
- (void)dealloc;
- (void)playNearbySoundOnPhone;
- (void)playSoundAndLightsOnCompanionWithCompletion:(id)a3;
- (void)playSoundOnCompanionWithCompletion:(id)a3;
- (void)playedSound:(BOOL)a3;
- (void)playedSoundAndLED:(BOOL)a3;
- (void)setPlaySoundAndLEDCompletion:(void *)a1;
- (void)setPlaySoundCompletion:(void *)a1;
- (void)setServerConnection:(uint64_t)a1;
- (void)startRangingOnPhone;
- (void)stopRangingOnPhone;
@end

@implementation NFMWhereIsMyCompanionConnection

+ (id)sharedDeviceConnection
{
  notify_post("com.apple.nanofindlocallyd.shouldlaunch");
  if (sharedDeviceConnection_onceToken != -1) {
    dispatch_once(&sharedDeviceConnection_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedDeviceConnection___sharedDeviceConnection;
  return v2;
}

uint64_t __57__NFMWhereIsMyCompanionConnection_sharedDeviceConnection__block_invoke()
{
  sharedDeviceConnection___sharedDeviceConnection = objc_alloc_init(NFMWhereIsMyCompanionConnection);
  return MEMORY[0x270F9A758]();
}

- (NFMWhereIsMyCompanionConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFMWhereIsMyCompanionConnection;
  v2 = [(NFMWhereIsMyCompanionConnection *)&v6 init];
  v3 = v2;
  if (v2) {
    id v4 = -[NFMWhereIsMyCompanionConnection serverConnection]((id *)&v2->super.isa);
  }
  return v3;
}

- (id)serverConnection
{
  v1 = a1;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = a1[1];
    if (v2)
    {
      v1 = (id *)v2;
    }
    else
    {
      id v3 = objc_alloc(MEMORY[0x263F08D68]);
      uint64_t v4 = [v3 initWithMachServiceName:NFMFindLocalDeviceServerName options:4096];
      id v5 = v1[1];
      v1[1] = (id)v4;

      id v6 = v1[1];
      v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F3FC340];
      [v6 setRemoteObjectInterface:v7];

      id v8 = v1[1];
      v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F3F8F68];
      [v8 setExportedInterface:v9];

      [v1[1] setExportedObject:v1];
      [v1[1] resume];
      v10 = nfm_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = NFMFindLocalDeviceServerName;
        __int16 v23 = 2080;
        v24 = "-[NFMWhereIsMyCompanionConnection serverConnection]";
        _os_log_impl(&dword_24011F000, v10, OS_LOG_TYPE_DEFAULT, "########### XPC Connection created: %@ at %s", buf, 0x16u);
      }

      objc_initWeak((id *)buf, v1);
      objc_initWeak(&location, v1[1]);
      id v11 = v1[1];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __51__NFMWhereIsMyCompanionConnection_serverConnection__block_invoke;
      v17[3] = &unk_26509BD50;
      objc_copyWeak(&v18, (id *)buf);
      objc_copyWeak(&v19, &location);
      [v11 setInterruptionHandler:v17];
      id v12 = v1[1];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __51__NFMWhereIsMyCompanionConnection_serverConnection__block_invoke_60;
      v14[3] = &unk_26509BD50;
      objc_copyWeak(&v15, (id *)buf);
      objc_copyWeak(&v16, &location);
      [v12 setInvalidationHandler:v14];
      v1 = (id *)v1[1];
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
  }
  return v1;
}

- (void)dealloc
{
  [(NFMWhereIsMyCompanionConnection *)self _cleanUpServerConnection:self->_serverConnection];
  v3.receiver = self;
  v3.super_class = (Class)NFMWhereIsMyCompanionConnection;
  [(NFMWhereIsMyCompanionConnection *)&v3 dealloc];
}

void __51__NFMWhereIsMyCompanionConnection_serverConnection__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = v3;
  if (WeakRetained && v3) {
    [WeakRetained _cleanUpServerConnection:v3];
  }
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = NFMFindLocalDeviceServerName;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "########### XPC Connection interrupted: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __51__NFMWhereIsMyCompanionConnection_serverConnection__block_invoke_60(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = v3;
  if (WeakRetained && v3) {
    [WeakRetained _cleanUpServerConnection:v3];
  }
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = NFMFindLocalDeviceServerName;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "########### XPC Connection invalidated: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_cleanUpServerConnection:(id)a3
{
  [a3 invalidate];
  -[NFMWhereIsMyCompanionConnection setServerConnection:]((uint64_t)self, 0);
}

- (void)setServerConnection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)playSoundOnCompanionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "########### Triggered Play Sound", v10, 2u);
  }

  int v6 = (void *)[v4 copy];
  id playSoundCompletion = self->_playSoundCompletion;
  self->_id playSoundCompletion = v6;

  uint64_t v8 = -[NFMWhereIsMyCompanionConnection serverConnection]((id *)&self->super.isa);
  v9 = [v8 remoteObjectProxy];
  [v9 playSoundRemotely];
}

- (void)playSoundAndLightsOnCompanionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "########### Triggered Play Light and Sound", v10, 2u);
  }

  int v6 = (void *)[v4 copy];
  id playSoundAndLEDCompletion = self->_playSoundAndLEDCompletion;
  self->_id playSoundAndLEDCompletion = v6;

  uint64_t v8 = -[NFMWhereIsMyCompanionConnection serverConnection]((id *)&self->super.isa);
  v9 = [v8 remoteObjectProxy];
  [v9 playSoundAndFlashRemotely];
}

- (void)playedSound:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "########### Played Sound: %{BOOL}d", (uint8_t *)v8, 8u);
  }

  id playSoundCompletion = (void (**)(id, BOOL))self->_playSoundCompletion;
  if (playSoundCompletion)
  {
    playSoundCompletion[2](playSoundCompletion, v3);
    id v7 = self->_playSoundCompletion;
    self->_id playSoundCompletion = 0;
  }
}

- (void)playedSoundAndLED:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "########### Played Light and Sound: %{BOOL}d", (uint8_t *)v8, 8u);
  }

  id playSoundAndLEDCompletion = (void (**)(id, BOOL))self->_playSoundAndLEDCompletion;
  if (playSoundAndLEDCompletion)
  {
    playSoundAndLEDCompletion[2](playSoundAndLEDCompletion, v3);
    id v7 = self->_playSoundAndLEDCompletion;
    self->_id playSoundAndLEDCompletion = 0;
  }
}

- (void)startRangingOnPhone
{
  BOOL v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "########### Start Ranging on Phone", v6, 2u);
  }

  id v4 = -[NFMWhereIsMyCompanionConnection serverConnection]((id *)&self->super.isa);
  id v5 = [v4 remoteObjectProxy];
  [v5 startRangingOnPhone];
}

- (void)stopRangingOnPhone
{
  BOOL v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "########### Stop Ranging on Phone", v6, 2u);
  }

  id v4 = -[NFMWhereIsMyCompanionConnection serverConnection]((id *)&self->super.isa);
  id v5 = [v4 remoteObjectProxy];
  [v5 stopRangingOnPhone];
}

- (void)playNearbySoundOnPhone
{
  BOOL v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "########### Play Nearby sound on Phone", v6, 2u);
  }

  id v4 = -[NFMWhereIsMyCompanionConnection serverConnection]((id *)&self->super.isa);
  id v5 = [v4 remoteObjectProxy];
  [v5 playNearbySoundOnPhone];
}

- (void)applicationIdentifierWithReply:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  BOOL v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 bundleIdentifier];

  if (!v4)
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"nobundleID-%d", getpid());
  }
  v5[2](v5, v4);
}

- (uint64_t)playSoundCompletion
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setPlaySoundCompletion:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
  }
}

- (uint64_t)playSoundAndLEDCompletion
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setPlaySoundAndLEDCompletion:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 24);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playSoundAndLEDCompletion, 0);
  objc_storeStrong(&self->_playSoundCompletion, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end