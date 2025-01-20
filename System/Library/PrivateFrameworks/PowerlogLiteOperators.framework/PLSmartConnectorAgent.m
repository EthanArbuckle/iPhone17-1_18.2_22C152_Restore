@interface PLSmartConnectorAgent
+ (id)entryEventForwardDefinitionEAStatus;
+ (id)entryEventForwardDefinitionStatus;
+ (id)entryEventForwardDefinitions;
+ (void)load;
- (NSData)curVersion;
- (NSData)preVersion;
- (NSNumber)curStatus;
- (NSNumber)preStatus;
- (NSString)curModel;
- (NSString)curName;
- (NSString)preModel;
- (NSString)preName;
- (PLIOKitOperatorComposition)iokitOrion;
- (PLSmartConnectorAgent)init;
- (PLTimer)timer;
- (void)externalAccessoryConnected:(id)a3;
- (void)externalAccessoryDisconnected:(id)a3;
- (void)initOperatorDependancies;
- (void)log;
- (void)logEventForwardEAAccessory:(id)a3;
- (void)logEventForwardStatus:(id)a3 withName:(id)a4 withModel:(id)a5 andVersionInfo:(id)a6;
- (void)reArmCallback;
- (void)setCurModel:(id)a3;
- (void)setCurName:(id)a3;
- (void)setCurStatus:(id)a3;
- (void)setCurVersion:(id)a3;
- (void)setPreModel:(id)a3;
- (void)setPreName:(id)a3;
- (void)setPreStatus:(id)a3;
- (void)setPreVersion:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation PLSmartConnectorAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSmartConnectorAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventForwardDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Status";
  objc_super v2 = +[PLSmartConnectorAgent entryEventForwardDefinitionStatus];
  v6[1] = @"EAStatus";
  v7[0] = v2;
  v3 = +[PLSmartConnectorAgent entryEventForwardDefinitionEAStatus];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventForwardDefinitionStatus
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0A80;
  v14[1] = MEMORY[0x1E4F1CC28];
  v13[2] = *MEMORY[0x1E4F92CC0];
  v14[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"ConnectState";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v11[1] = @"AccessoryID";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionEAStatus
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F29F0A90;
    v14[1] = MEMORY[0x1E4F1CC28];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"ConnectState";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
    v11[1] = @"AccessoryID";
    v12[0] = v5;
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

- (PLSmartConnectorAgent)init
{
  if ([MEMORY[0x1E4F92A38] hasCapability:2])
  {
    v15.receiver = self;
    v15.super_class = (Class)PLSmartConnectorAgent;
    v3 = [(PLAgent *)&v15 init];
    v4 = v3;
    if (v3)
    {
      [(PLSmartConnectorAgent *)v3 setTimer:0];
      v5 = [NSNumber numberWithInt:0xFFFFFFFFLL];
      [(PLSmartConnectorAgent *)v4 setPreStatus:v5];

      v6 = [NSNumber numberWithInt:0xFFFFFFFFLL];
      [(PLSmartConnectorAgent *)v4 setCurStatus:v6];

      id v7 = objc_alloc(MEMORY[0x1E4F92A00]);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __29__PLSmartConnectorAgent_init__block_invoke;
      void v13[3] = &unk_1E692CC48;
      v8 = v4;
      v14 = v8;
      uint64_t v9 = [v7 initWithOperator:v8 forService:@"AppleOrionManager" withBlock:v13];
      iokitOrion = v8->_iokitOrion;
      v8->_iokitOrion = (PLIOKitOperatorComposition *)v9;
    }
    self = v4;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __29__PLSmartConnectorAgent_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) timer];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) timer];
    [v5 invalidate];

    [*(id *)(a1 + 32) setTimer:0];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v6 = objc_alloc(MEMORY[0x1E4F92A80]);
  id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.8];
  v8 = [*(id *)(a1 + 32) workQueue];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __29__PLSmartConnectorAgent_init__block_invoke_2;
  v25 = &unk_1E692AC18;
  objc_copyWeak(&v26, &location);
  uint64_t v9 = [v6 initWithFireDate:v7 withInterval:0 withTolerance:0 repeats:v8 withUserInfo:&v22 withQueue:0.0 withBlock:0.0];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v9;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "arm", v22, v23, v24, v25);
  v12 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:a2];
  v13 = [v12 objectForKeyedSubscript:@"IOAccessoryDetect"];
  [*(id *)(a1 + 32) setCurStatus:v13];

  v14 = [v12 objectForKeyedSubscript:@"IOAccessoryAccessoryName"];
  [*(id *)(a1 + 32) setCurName:v14];

  objc_super v15 = [v12 objectForKeyedSubscript:@"IOAccessoryAccessoryModelNumber"];
  [*(id *)(a1 + 32) setCurModel:v15];

  v16 = [v12 objectForKeyedSubscript:@"IOAccessoryAccessoryVersionInfo"];
  [*(id *)(a1 + 32) setCurVersion:v16];

  v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [*(id *)(a1 + 32) curStatus];
    v19 = [*(id *)(a1 + 32) curModel];
    v20 = [*(id *)(a1 + 32) curVersion];
    v21 = [*(id *)(a1 + 32) curName];
    *(_DWORD *)buf = 138413058;
    v29 = v18;
    __int16 v30 = 2112;
    v31 = v19;
    __int16 v32 = 2112;
    v33 = v20;
    __int16 v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEFAULT, "Update from accessory state: %@, model: %@, version: %@, name: %@", buf, 0x2Au);
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __29__PLSmartConnectorAgent_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reArmCallback];
}

- (void)initOperatorDependancies
{
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel_externalAccessoryConnected_ name:*MEMORY[0x1E4F258C0] object:0];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_externalAccessoryDisconnected_ name:*MEMORY[0x1E4F258C8] object:0];
  }
}

- (void)reArmCallback
{
  id v6 = [(PLSmartConnectorAgent *)self curStatus];
  v3 = [(PLSmartConnectorAgent *)self curName];
  id v4 = [(PLSmartConnectorAgent *)self curModel];
  v5 = [(PLSmartConnectorAgent *)self curVersion];
  [(PLSmartConnectorAgent *)self logEventForwardStatus:v6 withName:v3 withModel:v4 andVersionInfo:v5];
}

- (void)externalAccessoryConnected:(id)a3
{
  id v4 = a3;
  v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PLSmartConnectorAgent_externalAccessoryConnected___block_invoke;
  void v7[3] = &unk_1E692B128;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__PLSmartConnectorAgent_externalAccessoryConnected___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) userInfo];
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "[SC]: received connection notification, %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = *(void **)(a1 + 40);
  v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F258D0]];
  [v4 logEventForwardEAAccessory:v6];
}

- (void)externalAccessoryDisconnected:(id)a3
{
  id v4 = a3;
  v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PLSmartConnectorAgent_externalAccessoryDisconnected___block_invoke;
  void v7[3] = &unk_1E692B128;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__PLSmartConnectorAgent_externalAccessoryDisconnected___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) userInfo];
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "[SC]: received disconnection notification, %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = *(void **)(a1 + 40);
  v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F258D0]];
  [v4 logEventForwardEAAccessory:v6];
}

- (void)log
{
  v3 = (void *)MEMORY[0x1E4F92A00];
  id v4 = [(PLSmartConnectorAgent *)self iokitOrion];
  objc_msgSend(v3, "snapshotFromIOEntry:", objc_msgSend(v4, "service"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [v9 objectForKeyedSubscript:@"IOAccessoryDetect"];
  id v6 = [v9 objectForKeyedSubscript:@"IOAccessoryAccessoryName"];
  int v7 = [v9 objectForKeyedSubscript:@"IOAccessoryAccessoryModelNumber"];
  id v8 = [v9 objectForKeyedSubscript:@"IOAccessoryAccessoryVersionInfo"];
  [(PLSmartConnectorAgent *)self logEventForwardStatus:v5 withName:v6 withModel:v7 andVersionInfo:v8];
}

- (void)logEventForwardStatus:(id)a3 withName:(id)a4 withModel:(id)a5 andVersionInfo:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v21)
  {
    v13 = [(PLSmartConnectorAgent *)self preStatus];
    char v14 = [v13 isEqualToNumber:v21];

    if ((v14 & 1) == 0)
    {
      if (v10)
      {
        if (v11) {
          goto LABEL_5;
        }
      }
      else
      {
        id v10 = [(PLSmartConnectorAgent *)self preName];
        if (v11)
        {
LABEL_5:
          if (v12) {
            goto LABEL_6;
          }
LABEL_12:
          id v12 = [(PLSmartConnectorAgent *)self preVersion];
LABEL_6:
          objc_super v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Status"];
          v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15];
          [v16 setObject:v21 forKeyedSubscript:@"ConnectState"];
          if ([v11 isEqualToString:@"A2261"])
          {
            uint64_t v17 = 2;
          }
          else if ([v11 isEqualToString:@"A1998"])
          {
            uint64_t v17 = 3;
          }
          else if ([v11 isEqualToString:@"A2480"])
          {
            uint64_t v17 = 7;
          }
          else if ([v11 isEqualToString:@"YU0040"])
          {
            uint64_t v17 = 4;
          }
          else
          {
            if (![v11 isEqualToString:@"YU0043"]) {
              goto LABEL_24;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_24;
            }
            id v18 = v12;
            if (![v18 bytes] || !objc_msgSend(v18, "length")) {
              goto LABEL_24;
            }
            int v19 = *(unsigned __int8 *)[v18 bytes];
            if (v19 == 23)
            {
              uint64_t v17 = 5;
              goto LABEL_27;
            }
            if (v19 != 25)
            {
LABEL_24:
              if ([v10 isEqualToString:@"Apple iPad Pro Smart Keyboard"]) {
                uint64_t v17 = 0;
              }
              else {
                uint64_t v17 = [v10 isEqualToString:@"Magic Keyboard"] ^ 1;
              }
              goto LABEL_27;
            }
            uint64_t v17 = 6;
          }
LABEL_27:
          v20 = [NSNumber numberWithShort:v17];
          [v16 setObject:v20 forKeyedSubscript:@"AccessoryID"];

          [(PLOperator *)self logEntry:v16];
          [(PLSmartConnectorAgent *)self setPreStatus:v21];
          [(PLSmartConnectorAgent *)self setPreName:v10];
          [(PLSmartConnectorAgent *)self setPreModel:v11];
          [(PLSmartConnectorAgent *)self setPreVersion:v12];

          goto LABEL_28;
        }
      }
      id v11 = [(PLSmartConnectorAgent *)self preModel];
      if (v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
LABEL_28:
}

- (void)logEventForwardEAAccessory:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_super v15 = PLLogCommon();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    LOWORD(v25) = 0;
    v16 = "[SC]: EAAccessory is nil";
    uint64_t v17 = v15;
    uint32_t v18 = 2;
LABEL_12:
    _os_log_error_impl(&dword_1D2690000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v25, v18);
    goto LABEL_20;
  }
  uint64_t v5 = [v4 modelNumber];
  if (!v5
    || (id v6 = (void *)v5,
        [v4 firmwareRevision],
        int v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    objc_super v15 = PLLogCommon();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v25 = 138412290;
    id v26 = v4;
    v16 = "[SC]: EAAccessory missing info, %@";
    uint64_t v17 = v15;
    uint32_t v18 = 12;
    goto LABEL_12;
  }
  id v8 = [v4 modelNumber];
  char v9 = [v8 isEqualToString:@"Y-U0040"];

  if ((v9 & 1) == 0)
  {
    int v19 = [v4 modelNumber];
    int v20 = [v19 isEqualToString:@"Y-U0043"];

    if (v20)
    {
      id v21 = [v4 firmwareRevision];
      char v22 = [v21 hasPrefix:@"23."];

      if (v22)
      {
        uint64_t v10 = 5;
        goto LABEL_7;
      }
      uint64_t v23 = [v4 firmwareRevision];
      char v24 = [v23 hasPrefix:@"25."];

      if (v24)
      {
        uint64_t v10 = 6;
        goto LABEL_7;
      }
    }
    objc_super v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEFAULT, "[SC]: Skip matching the accessory", (uint8_t *)&v25, 2u);
    }
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v10 = 4;
LABEL_7:
  id v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"EAStatus"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isConnected"));
  [v12 setObject:v13 forKeyedSubscript:@"ConnectState"];

  char v14 = [NSNumber numberWithShort:v10];
  [v12 setObject:v14 forKeyedSubscript:@"AccessoryID"];

  [(PLOperator *)self logEntry:v12];
LABEL_21:
}

- (PLIOKitOperatorComposition)iokitOrion
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (PLTimer)timer
{
  return (PLTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimer:(id)a3
{
}

- (NSNumber)preStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreStatus:(id)a3
{
}

- (NSNumber)curStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurStatus:(id)a3
{
}

- (NSString)preName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPreName:(id)a3
{
}

- (NSString)curName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurName:(id)a3
{
}

- (NSString)preModel
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPreModel:(id)a3
{
}

- (NSString)curModel
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurModel:(id)a3
{
}

- (NSData)preVersion
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPreVersion:(id)a3
{
}

- (NSData)curVersion
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curVersion, 0);
  objc_storeStrong((id *)&self->_preVersion, 0);
  objc_storeStrong((id *)&self->_curModel, 0);
  objc_storeStrong((id *)&self->_preModel, 0);
  objc_storeStrong((id *)&self->_curName, 0);
  objc_storeStrong((id *)&self->_preName, 0);
  objc_storeStrong((id *)&self->_curStatus, 0);
  objc_storeStrong((id *)&self->_preStatus, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_iokitOrion, 0);
}

@end