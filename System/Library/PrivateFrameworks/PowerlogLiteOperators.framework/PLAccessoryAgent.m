@interface PLAccessoryAgent
+ (id)defaults;
+ (id)entryEventPointDefinitions;
+ (id)entryEventPointDefinitionsReceivedPush;
+ (void)load;
- (ACCConnectionInfo)accConnectionInfo;
- (NSMutableDictionary)connectedEndpoints;
- (PLAccessoryAgent)init;
- (void)accessoryConnectionAttached:(id)a3 type:(int)a4;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)initOperatorDependancies;
- (void)setAccConnectionInfo:(id)a3;
- (void)setConnectedEndpoints:(id)a3;
@end

@implementation PLAccessoryAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccessoryAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"Accessory";
  objc_super v2 = [a1 entryEventPointDefinitionsReceivedPush];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionsReceivedPush
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F0830;
  v16[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"Connected";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v14[0] = v5;
  v13[1] = @"EndpointType";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  v13[2] = @"AccessoryType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

- (PLAccessoryAgent)init
{
  if ([MEMORY[0x1E4F92A38] hasCapability:7])
  {
    v5.receiver = self;
    v5.super_class = (Class)PLAccessoryAgent;
    self = [(PLAgent *)&v5 init];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLAccessoryAgent *)self setConnectedEndpoints:v3];

  v4 = [MEMORY[0x1E4F5B178] sharedInstance];
  [(PLAccessoryAgent *)self setAccConnectionInfo:v4];

  id v5 = [(PLAccessoryAgent *)self accConnectionInfo];
  [v5 registerDelegate:self];
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4
{
  v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "Accessory connected", v5, 2u);
  }

  [MEMORY[0x1E4F92A88] postNotificationName:@"PLCAAccessoryAttachedNotification" object:0 userInfo:0];
}

- (void)accessoryConnectionDetached:(id)a3
{
  v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEFAULT, "Accessory disconnected", v4, 2u);
  }

  [MEMORY[0x1E4F92A88] postNotificationName:@"PLCAAccessoryDetachedNotification" object:0 userInfo:0];
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEFAULT, "Accessory attached: %@, %@, %@", (uint8_t *)&v24, 0x20u);
  }

  if ((v9 - 14) >= 0xFFFFFFFE)
  {
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v16 = [NSNumber numberWithUnsignedInt:v9];
    [v15 setObject:v16 forKeyedSubscript:@"EndpointType"];

    uint64_t v17 = *MEMORY[0x1E4F5B1A0];
    v18 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F5B1A0]];
    [v15 setObject:v18 forKeyedSubscript:@"AccessoryType"];

    v19 = [(PLAccessoryAgent *)self connectedEndpoints];
    [v19 setObject:v15 forKeyedSubscript:v11];

    v20 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Accessory"];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v20];
    [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Connected"];
    v22 = [NSNumber numberWithUnsignedInt:v9];
    [v21 setObject:v22 forKeyedSubscript:@"EndpointType"];

    v23 = [v12 objectForKeyedSubscript:v17];
    [v21 setObject:v23 forKeyedSubscript:@"AccessoryType"];

    [(PLOperator *)self logEntry:v21];
  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEFAULT, "Accessory detached: %@, %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v9 = [(PLAccessoryAgent *)self connectedEndpoints];
  v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    id v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Accessory"];
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
    [v12 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"Connected"];
    id v13 = [v10 objectForKeyedSubscript:@"EndpointType"];
    [v12 setObject:v13 forKeyedSubscript:@"EndpointType"];

    v14 = [v10 objectForKeyedSubscript:@"AccessoryType"];
    [v12 setObject:v14 forKeyedSubscript:@"AccessoryType"];

    [(PLOperator *)self logEntry:v12];
    v15 = [(PLAccessoryAgent *)self connectedEndpoints];
    [v15 setObject:0 forKeyedSubscript:v6];
  }
  else
  {
    id v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "Accessory property does not exist: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (ACCConnectionInfo)accConnectionInfo
{
  return (ACCConnectionInfo *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccConnectionInfo:(id)a3
{
}

- (NSMutableDictionary)connectedEndpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnectedEndpoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedEndpoints, 0);
  objc_storeStrong((id *)&self->_accConnectionInfo, 0);
}

@end