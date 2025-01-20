@interface SBExternalDisplayBiomeDonor
- (NSMutableDictionary)biomeDonationTimers;
- (SBExternalDisplayBiomeDonor)init;
- (SBSExternalDisplayService)externalDisplayService;
- (void)_donateToBiomeIfNecessaryForDisplayInfo:(id)a3 connect:(BOOL)a4;
- (void)dealloc;
- (void)externalDisplayDidConnect:(id)a3;
- (void)externalDisplayWillDisconnect:(id)a3;
- (void)setBiomeDonationTimers:(id)a3;
@end

@implementation SBExternalDisplayBiomeDonor

- (SBExternalDisplayBiomeDonor)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBExternalDisplayBiomeDonor;
  v2 = [(SBExternalDisplayBiomeDonor *)&v6 init];
  if (v2)
  {
    v3 = (SBSExternalDisplayService *)objc_alloc_init(MEMORY[0x1E4FA6A80]);
    externalDisplayService = v2->_externalDisplayService;
    v2->_externalDisplayService = v3;

    [(SBSExternalDisplayService *)v2->_externalDisplayService addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(SBSExternalDisplayService *)self->_externalDisplayService removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBExternalDisplayBiomeDonor;
  [(SBExternalDisplayBiomeDonor *)&v3 dealloc];
}

- (void)externalDisplayDidConnect:(id)a3
{
}

- (void)externalDisplayWillDisconnect:(id)a3
{
}

- (void)_donateToBiomeIfNecessaryForDisplayInfo:(id)a3 connect:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 identifier];
  if (v7)
  {
    biomeDonationTimers = self->_biomeDonationTimers;
    if (!biomeDonationTimers)
    {
      v9 = [MEMORY[0x1E4F1CA60] dictionary];
      v10 = self->_biomeDonationTimers;
      self->_biomeDonationTimers = v9;

      biomeDonationTimers = self->_biomeDonationTimers;
    }
    v11 = [(NSMutableDictionary *)biomeDonationTimers objectForKey:v7];
    if (!v11)
    {
      v12 = [_SBDisplayConnectionDonationTimer alloc];
      v13 = [v6 identifier];
      v14 = [v6 deviceName];
      v15 = [v6 displayName];
      uint64_t v16 = [v6 isMirrored];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __79__SBExternalDisplayBiomeDonor__donateToBiomeIfNecessaryForDisplayInfo_connect___block_invoke;
      v21 = &unk_1E6B09E98;
      v22 = self;
      id v17 = v7;
      id v23 = v17;
      v11 = [(_SBDisplayConnectionDonationTimer *)v12 initWithUniqueId:v13 deviceName:v14 productName:v15 connect:v4 mirroring:v16 handler:&v18];

      -[NSMutableDictionary setObject:forKey:](self->_biomeDonationTimers, "setObject:forKey:", v11, v17, v18, v19, v20, v21, v22);
    }
    [(_SBDisplayConnectionDonationTimer *)v11 resetTimerOnConnect:v4];
  }
}

void __79__SBExternalDisplayBiomeDonor__donateToBiomeIfNecessaryForDisplayInfo_connect___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, char a5, char a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  v14 = dispatch_get_global_queue(-32768, 0);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __79__SBExternalDisplayBiomeDonor__donateToBiomeIfNecessaryForDisplayInfo_connect___block_invoke_2;
  v21 = &unk_1E6B09E70;
  char v25 = a5;
  id v22 = v12;
  id v23 = v11;
  id v24 = v13;
  char v26 = a6;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  dispatch_async(v14, &v18);

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeObjectForKey:", *(void *)(a1 + 40), v18, v19, v20, v21);
}

void __79__SBExternalDisplayBiomeDonor__donateToBiomeIfNecessaryForDisplayInfo_connect___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F50148]);
  objc_super v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
  v8 = (void *)[v2 initWithStarting:v3 deviceName:v4 uniqueId:v5 productName:v6 mirroringMode:v7];

  v9 = BiomeLibrary();
  v10 = [v9 SpringBoard];
  id v11 = [v10 ExternalDisplay];
  id v12 = [v11 DisplayConnected];

  id v13 = [v12 source];
  [v13 sendEvent:v8];
  v14 = SBLogBiome();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = NSStringFromBOOL();
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = NSStringFromBOOL();
    int v20 = 138413314;
    v21 = v15;
    __int16 v22 = 2114;
    uint64_t v23 = v16;
    __int16 v24 = 2114;
    uint64_t v25 = v17;
    __int16 v26 = 2114;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    v29 = v19;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Donate display connected: %@ uuid: %{public}@ deviceName: %{public}@ productname: %{public}@ mirroring: %@", (uint8_t *)&v20, 0x34u);
  }
}

- (SBSExternalDisplayService)externalDisplayService
{
  return self->_externalDisplayService;
}

- (NSMutableDictionary)biomeDonationTimers
{
  return self->_biomeDonationTimers;
}

- (void)setBiomeDonationTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeDonationTimers, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
}

@end