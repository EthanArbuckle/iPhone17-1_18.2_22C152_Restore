@interface SCDAElectionParticipantIdVendor
+ (NSUUID)nullId;
+ (NSUUID)staleId;
+ (id)computeId:(id)a3 withPayload:(id)a4;
+ (void)initialize;
- (SCDAElectionParticipantIdVendor)init;
- (id)computeIds:(id)a3;
- (void)_clearCBAdvertiser;
- (void)_fetchBTLEAddress;
- (void)_init;
- (void)_reinit;
- (void)dealloc;
- (void)fetchBTLEAddressIfRequired;
@end

@implementation SCDAElectionParticipantIdVendor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRotatedAddressChange, 0);
  objc_storeStrong((id *)&self->_rotatedBLEAddress, 0);
  objc_storeStrong((id *)&self->_lastAddressChange, 0);
  objc_storeStrong((id *)&self->_bleAddress, 0);
  objc_storeStrong((id *)&self->_cbAdvertiser, 0);
}

- (void)dealloc
{
  self->_deallocInProgress = 1;
  bleAddress = self->_bleAddress;
  self->_bleAddress = 0;

  rotatedBLEAddress = self->_rotatedBLEAddress;
  self->_rotatedBLEAddress = 0;

  [(SCDAElectionParticipantIdVendor *)self _clearCBAdvertiser];
  v5.receiver = self;
  v5.super_class = (Class)SCDAElectionParticipantIdVendor;
  [(SCDAElectionParticipantIdVendor *)&v5 dealloc];
}

- (void)_clearCBAdvertiser
{
  cbAdvertiser = self->_cbAdvertiser;
  if (cbAdvertiser)
  {
    self->_cbAdvertiser = 0;
    v3 = cbAdvertiser;

    [(CBAdvertiser *)v3 setInvalidationHandler:0];
    [(CBAdvertiser *)v3 setInterruptionHandler:0];
    [(CBAdvertiser *)v3 setAdvertisingAddressChangedHandler:0];
    [(CBAdvertiser *)v3 invalidate];
  }
}

- (id)computeIds:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SCDAElectionParticipantIdVendor *)self fetchBTLEAddressIfRequired];
  objc_super v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_bleAddress;
  v7 = v5->_lastAddressChange;
  v8 = v5->_rotatedBLEAddress;
  v9 = v5->_lastRotatedAddressChange;
  objc_sync_exit(v5);

  if (!v4 || !v6)
  {
    v13 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 136315650;
      v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
      __int16 v24 = 1024;
      *(_DWORD *)v25 = v6 == 0;
      *(_WORD *)&v25[4] = 1024;
      *(_DWORD *)&v25[6] = v4 == 0;
      _os_log_debug_impl(&dword_25C707000, v13, OS_LOG_TYPE_DEBUG, "%s #scda Returning null sentinel id. addressNil?%d payloadNil?%d", (uint8_t *)&v22, 0x18u);
    }
    v12 = (void *)_nullId;
    goto LABEL_10;
  }
  [(NSDate *)v7 timeIntervalSinceNow];
  if (v10 < -1202.0)
  {
    v11 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 136315394;
      v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
      __int16 v24 = 2112;
      *(void *)v25 = v7;
      _os_log_debug_impl(&dword_25C707000, v11, OS_LOG_TYPE_DEBUG, "%s #scda Returning stale sentinel id. lastChange: %@", (uint8_t *)&v22, 0x16u);
    }
    v12 = (void *)_staleId;
LABEL_10:
    id v14 = v12;
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  id v14 = +[SCDAElectionParticipantIdVendor computeId:v6 withPayload:v4];
  v18 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 136315906;
    v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
    __int16 v24 = 2112;
    *(void *)v25 = v14;
    *(_WORD *)&v25[8] = 2112;
    v26 = v6;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_debug_impl(&dword_25C707000, v18, OS_LOG_TYPE_DEBUG, "%s #scda Primary electionParticipantId: %@ from address %@ and payload %@", (uint8_t *)&v22, 0x2Au);
    if (!v8) {
      goto LABEL_11;
    }
  }
  else if (!v8)
  {
    goto LABEL_11;
  }
  [(NSDate *)v9 timeIntervalSinceNow];
  if (v19 < -1202.0)
  {
    v20 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 136315394;
      v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
      __int16 v24 = 2112;
      *(void *)v25 = v9;
      _os_log_debug_impl(&dword_25C707000, v20, OS_LOG_TYPE_DEBUG, "%s #scda Ignoring stale rotated address. lastChange: %@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_11;
  }
  v15 = +[SCDAElectionParticipantIdVendor computeId:v8 withPayload:v4];
  v21 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 136315650;
    v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
    __int16 v24 = 2112;
    *(void *)v25 = v15;
    *(_WORD *)&v25[8] = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_25C707000, v21, OS_LOG_TYPE_DEBUG, "%s #scda Rotated electionParticipantId: %@ from address %@", (uint8_t *)&v22, 0x20u);
  }
LABEL_12:
  id v16 = [[SCDAElectionParticipantIds alloc] init:v14 rotatedElectionParticipantId:v15];

  return v16;
}

- (void)_fetchBTLEAddress
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  cbAdvertiser = self->_cbAdvertiser;
  if (cbAdvertiser)
  {
    id v4 = [(CBAdvertiser *)cbAdvertiser advertisingAddressDataNonConnectable];
    objc_super v5 = (NSData *)[v4 copy];

    v6 = [MEMORY[0x263EFF910] now];
    if (!v5)
    {
      uint64_t v13 = SCDALogContextCore;
      if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        return;
      }
      int v28 = 136315138;
      uint64_t v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
      id v14 = "%s #scda BTLE address is not available";
      v15 = v13;
      uint32_t v16 = 12;
LABEL_18:
      _os_log_debug_impl(&dword_25C707000, v15, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v28, v16);
      goto LABEL_15;
    }
    p_bleAddress = &self->_bleAddress;
    bleAddress = self->_bleAddress;
    if (bleAddress)
    {
      if ([(NSData *)bleAddress isEqualToData:v5])
      {
        uint64_t v9 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          int v28 = 136315138;
          uint64_t v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
          double v10 = "%s #scda Ignoring duplicate BTLE address change";
          v11 = v9;
          uint32_t v12 = 12;
LABEL_20:
          _os_log_debug_impl(&dword_25C707000, v11, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v28, v12);
        }
      }
      else
      {
        double v19 = self;
        objc_sync_enter(v19);
        p_rotatedBLEAddress = &v19->_rotatedBLEAddress;
        objc_storeStrong((id *)&v19->_rotatedBLEAddress, self->_bleAddress);
        objc_storeStrong((id *)&v19->_lastRotatedAddressChange, v19->_lastAddressChange);
        objc_storeStrong((id *)&self->_bleAddress, v5);
        objc_storeStrong((id *)&v19->_lastAddressChange, v6);
        objc_sync_exit(v19);

        uint64_t v21 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          v26 = *p_rotatedBLEAddress;
          __int16 v27 = *p_bleAddress;
          int v28 = 136315650;
          uint64_t v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
          __int16 v30 = 2112;
          v31 = v26;
          __int16 v32 = 2112;
          v33 = v27;
          double v10 = "%s #scda BTLE address changed from %@ to %@";
          v11 = v21;
          uint32_t v12 = 32;
          goto LABEL_20;
        }
      }
    }
    else
    {
      v17 = self;
      objc_sync_enter(v17);
      objc_storeStrong((id *)&self->_bleAddress, v5);
      objc_storeStrong((id *)&v17->_lastAddressChange, v6);
      objc_sync_exit(v17);

      uint64_t v18 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        int v28 = 136315394;
        uint64_t v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
        __int16 v30 = 2112;
        v31 = v5;
        double v10 = "%s #scda BTLE address initialized to %@ due to address change";
        v11 = v18;
        uint32_t v12 = 22;
        goto LABEL_20;
      }
    }
    int v22 = self;
    objc_sync_enter(v22);
    objc_storeStrong((id *)&self->_bleAddress, v5);
    if (self->_bleAddress) {
      objc_storeStrong((id *)&v22->_lastAddressChange, v6);
    }
    objc_sync_exit(v22);

    uint64_t v23 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    __int16 v24 = *p_bleAddress;
    lastAddressChange = v22->_lastAddressChange;
    int v28 = 136315650;
    uint64_t v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
    __int16 v30 = 2112;
    v31 = v24;
    __int16 v32 = 2112;
    v33 = lastAddressChange;
    id v14 = "%s #scda BTLE address initialized to %@ lastChange:%@";
    v15 = v23;
    uint32_t v16 = 32;
    goto LABEL_18;
  }
}

- (void)fetchBTLEAddressIfRequired
{
  if (self->_reinitialize) {
    [(SCDAElectionParticipantIdVendor *)self _reinit];
  }
  if (!self->_bleAddress)
  {
    [(SCDAElectionParticipantIdVendor *)self _fetchBTLEAddress];
  }
}

- (void)_reinit
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!self->_deallocInProgress)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315138;
      v7 = "-[SCDAElectionParticipantIdVendor _reinit]";
      _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s #scda ElectionParticipantIdVendor reinit", (uint8_t *)&v6, 0xCu);
    }
    bleAddress = self->_bleAddress;
    self->_bleAddress = 0;

    rotatedBLEAddress = self->_rotatedBLEAddress;
    self->_rotatedBLEAddress = 0;

    [(SCDAElectionParticipantIdVendor *)self _clearCBAdvertiser];
    [(SCDAElectionParticipantIdVendor *)self _init];
  }
}

- (void)_init
{
  self->_reinitialize = 0;
  v3 = (CBAdvertiser *)objc_alloc_init(MEMORY[0x263EFEEF8]);
  cbAdvertiser = self->_cbAdvertiser;
  self->_cbAdvertiser = v3;

  objc_super v5 = self->_cbAdvertiser;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__SCDAElectionParticipantIdVendor__init__block_invoke;
  v15[3] = &unk_2654B81C8;
  v15[4] = self;
  [(CBAdvertiser *)v5 setInterruptionHandler:v15];
  int v6 = self->_cbAdvertiser;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__SCDAElectionParticipantIdVendor__init__block_invoke_24;
  v14[3] = &unk_2654B81C8;
  v14[4] = self;
  [(CBAdvertiser *)v6 setInvalidationHandler:v14];
  objc_initWeak(&location, self);
  v7 = self->_cbAdvertiser;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__SCDAElectionParticipantIdVendor__init__block_invoke_25;
  v11[3] = &unk_2654B7B00;
  objc_copyWeak(&v12, &location);
  [(CBAdvertiser *)v7 setAdvertisingAddressChangedHandler:v11];
  uint64_t v8 = self->_cbAdvertiser;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__SCDAElectionParticipantIdVendor__init__block_invoke_2;
  v9[3] = &unk_2654B7B28;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  [(CBAdvertiser *)v8 activateWithCompletion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __40__SCDAElectionParticipantIdVendor__init__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[SCDAElectionParticipantIdVendor _init]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s #scda CBAdvertiser interrupted. Will flag for reinitialization", (uint8_t *)&v3, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
}

void __40__SCDAElectionParticipantIdVendor__init__block_invoke_24(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[SCDAElectionParticipantIdVendor _init]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s #scda CBAdvertiser invalidated. Will flag for reinitialization", (uint8_t *)&v3, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
}

void __40__SCDAElectionParticipantIdVendor__init__block_invoke_25(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchBTLEAddress];
}

void __40__SCDAElectionParticipantIdVendor__init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    id v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[SCDAElectionParticipantIdVendor _init]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_25C707000, v4, OS_LOG_TYPE_ERROR, "%s #scda CBAdvertiser activation failed with %@; BTLE address may not be available",
        (uint8_t *)&v6,
        0x16u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _fetchBTLEAddress];
  }
}

- (SCDAElectionParticipantIdVendor)init
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)SCDAElectionParticipantIdVendor;
  v2 = [(SCDAElectionParticipantIdVendor *)&v5 init];
  if (v2)
  {
    id v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[SCDAElectionParticipantIdVendor init]";
      _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s #scda ElectionParticipantIdVendor init", buf, 0xCu);
    }
    v2->_deallocInProgress = 0;
    [(SCDAElectionParticipantIdVendor *)v2 _init];
  }
  return v2;
}

+ (id)computeId:(id)a3 withPayload:(id)a4
{
  data[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [v5 length];
  if (v7 >= 8) {
    CC_LONG v8 = 8;
  }
  else {
    CC_LONG v8 = v7;
  }
  data[0] = 0;
  data[1] = 0;
  id v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"73fa281b-4376-5284-8d9f-dc7ec5ad068f"];
  [v9 getUUIDBytes:data];

  memset(&v17, 0, sizeof(v17));
  CC_SHA1_Init(&v17);
  CC_SHA1_Update(&v17, data, 0x10u);
  id v10 = v6;
  v11 = (const void *)[v10 bytes];
  CC_LONG v12 = [v10 length];

  CC_SHA1_Update(&v17, v11, v12);
  id v13 = v5;
  id v14 = (const void *)[v13 bytes];

  CC_SHA1_Update(&v17, v14, v8);
  CC_SHA1_Final(md, &v17);
  char v19 = v19 & 0xF | 0x50;
  char v20 = v20 & 0x3F | 0x80;
  v15 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:md];
  return v15;
}

+ (NSUUID)staleId
{
  return (NSUUID *)(id)_staleId;
}

+ (NSUUID)nullId
{
  return (NSUUID *)(id)_nullId;
}

+ (void)initialize
{
  uint64_t v2 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  id v3 = (void *)_nullId;
  _nullId = v2;

  _staleId = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF"];
  MEMORY[0x270F9A758]();
}

@end