@interface MIBUStatusResponse
- (BOOL)_deserialize:(id)a3;
- (BOOL)_serializeBatteryDetailsWithSerializer:(id)a3;
- (BOOL)_serializeDict:(id)a3 fromKeyToTagMapping:(id)a4 withSerializer:(id)a5;
- (BOOL)_serializeOperationDetailsWithSerializer:(id)a3;
- (BOOL)_serializeThermalDetailsWithSerializer:(id)a3;
- (MIBUDeviceStatus)status;
- (MIBUStatusResponse)init;
- (NSString)buildVersion;
- (NSString)osVersion;
- (NSString)serialNumber;
- (id)_deserializeBatteryDetailsFromDict:(id)a3;
- (id)_deserializeFromTagDict:(id)a3 withKeyToTagMapping:(id)a4;
- (id)_deserializeOperationDetailsFromDict:(id)a3;
- (id)_deserializeThermalDetailsFromDict:(id)a3;
- (id)_reverseDict:(id)a3;
- (id)serialize;
- (void)serialize;
- (void)setBuildVersion:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation MIBUStatusResponse

- (MIBUStatusResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUStatusResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUStatusResponse *)v2 setSerialNumber:0];
    [(MIBUStatusResponse *)v3 setOsVersion:0];
    [(MIBUStatusResponse *)v3 setBuildVersion:0];
    [(MIBUStatusResponse *)v3 setStatus:0];
  }
  return v3;
}

- (id)serialize
{
  v26[6] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = [(MIBUStatusResponse *)self status];

  if (v4 && ![(MIBUNFCResponse *)self rejected])
  {
    objc_super v5 = NSNumber;
    v25 = [(MIBUStatusResponse *)self status];
    v24 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v25, "state"));
    v26[0] = v24;
    v23 = [(MIBUStatusResponse *)self serialNumber];
    v26[1] = v23;
    v6 = [(MIBUStatusResponse *)self osVersion];
    v26[2] = v6;
    v7 = [(MIBUStatusResponse *)self buildVersion];
    v26[3] = v7;
    v8 = NSNumber;
    v9 = [(MIBUStatusResponse *)self status];
    v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "operation"));
    v26[4] = v10;
    v11 = [(MIBUStatusResponse *)self status];
    v12 = [v11 batteryLevel];
    v26[5] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:6];
    LOBYTE(v5) = [v3 serialize:&unk_26E53EB08 withValue:v13];

    if (v5)
    {
      v14 = [(MIBUNFCResponse *)self error];
      char v15 = [v3 serializeResponseError:v14];

      if (v15)
      {
        v16 = [(MIBUStatusResponse *)self status];
        v17 = [v16 operationError];
        char v18 = [v3 serializeOperationError:v17];

        if (v18)
        {
          if ([(MIBUStatusResponse *)self _serializeOperationDetailsWithSerializer:v3]&& [(MIBUStatusResponse *)self _serializeThermalDetailsWithSerializer:v3]&& [(MIBUStatusResponse *)self _serializeBatteryDetailsWithSerializer:v3])
          {
            v19 = [v3 serializedData];
            goto LABEL_10;
          }
        }
        else
        {
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_21);
          }
          v22 = (void *)MIBUConnObj;
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            [(MIBUStatusResponse *)v22 serialize];
          }
        }
      }
      else
      {
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_18);
        }
        v21 = (void *)MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          [(MIBUStatusResponse *)v21 serialize];
        }
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_2);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        -[MIBUStatusResponse serialize]();
      }
    }
  }
  v19 = 0;
LABEL_10:

  return v19;
}

void __31__MIBUStatusResponse_serialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __31__MIBUStatusResponse_serialize__block_invoke_16()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __31__MIBUStatusResponse_serialize__block_invoke_19()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (BOOL)_deserialize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[MIBUDeserializer alloc] initWithData:v4];

  uint64_t v6 = [(MIBUDeserializer *)v5 deserialize];
  if (!v6)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_24);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUStatusResponse _deserialize:]();
    }
    v27 = 0;
    v12 = 0;
    char v15 = 0;
    v14 = 0;
    v38 = 0;
    id v39 = 0;
    goto LABEL_24;
  }
  id v41 = 0;
  BOOL v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v41];
  id v39 = v41;
  if (!v7)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_27);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUStatusResponse _deserialize:].cold.7();
    }
    goto LABEL_23;
  }
  uint64_t v8 = [v6 objectForKey:&unk_26E53DEA8];
  if (!v8)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_30);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUStatusResponse _deserialize:]();
    }
LABEL_23:
    v27 = 0;
    v12 = 0;
    char v15 = 0;
    v14 = 0;
    v38 = 0;
LABEL_24:
    v11 = 0;
    uint64_t v9 = 0;
LABEL_30:
    BOOL v34 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v6 objectForKey:&unk_26E53DF08];
  if (!v10)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_33);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUStatusResponse _deserialize:]();
    }
    v27 = 0;
    v12 = 0;
    char v15 = 0;
    v14 = 0;
    v38 = 0;
    v11 = 0;
    goto LABEL_30;
  }
  v11 = (void *)v10;
  v12 = [v6 objectForKey:&unk_26E53DEC0];
  uint64_t v13 = [v6 objectForKey:&unk_26E53DED8];
  if (v13)
  {
    v14 = (void *)v13;
    char v15 = [v6 objectForKey:&unk_26E53DEF0];
    uint64_t v16 = [v6 objectForKey:&unk_26E53DF20];
    if (v16)
    {
      v37 = (void *)v16;
      id v40 = 0;
      BOOL v17 = [(MIBUDeserializer *)v5 deserializeOperationError:&v40];
      id v18 = v40;
      v38 = v18;
      if (v17)
      {
        id v19 = v18;
        v20 = objc_alloc_init(MIBUDeviceStatus);
        [(MIBUStatusResponse *)self setStatus:v20];

        [(MIBUStatusResponse *)self setSerialNumber:v12];
        [(MIBUStatusResponse *)self setOsVersion:v14];
        [(MIBUStatusResponse *)self setBuildVersion:v15];
        uint64_t v21 = (int)[v9 shortValue];
        [(MIBUStatusResponse *)self status];
        v22 = v36 = v12;
        [v22 setState:v21];

        uint64_t v23 = (int)[v11 shortValue];
        v24 = [(MIBUStatusResponse *)self status];
        [v24 setOperation:v23];

        v25 = [(MIBUStatusResponse *)self status];
        [v25 setOperationError:v19];

        v26 = [(MIBUStatusResponse *)self status];
        v27 = v37;
        [v26 setBatteryLevel:v37];

        v28 = [(MIBUStatusResponse *)self _deserializeThermalDetailsFromDict:v6];
        v29 = [(MIBUStatusResponse *)self status];
        [v29 setThermalDetails:v28];

        v30 = [(MIBUStatusResponse *)self _deserializeBatteryDetailsFromDict:v6];
        v31 = [(MIBUStatusResponse *)self status];
        [v31 setBatteryDetails:v30];

        v32 = [(MIBUStatusResponse *)self _deserializeOperationDetailsFromDict:v6];
        v33 = [(MIBUStatusResponse *)self status];
        [v33 setOperationDetails:v32];

        v12 = v36;
        BOOL v34 = 1;
      }
      else
      {
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_48);
        }
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          -[MIBUStatusResponse _deserialize:].cold.6();
        }
        BOOL v34 = 0;
        v27 = v37;
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_45);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        -[MIBUStatusResponse _deserialize:].cold.5();
      }
      v27 = 0;
      v38 = 0;
      BOOL v34 = 0;
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_39);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUStatusResponse _deserialize:].cold.4();
    }
    v27 = 0;
    char v15 = 0;
    v38 = 0;
    BOOL v34 = 0;
    v14 = 0;
  }
LABEL_9:
  [(MIBUNFCResponse *)self setError:v39];

  return v34;
}

void __35__MIBUStatusResponse__deserialize___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_25()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_28()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_31()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_37()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_43()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_46()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (id)_reverseDict:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v13);
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_serializeDict:(id)a3 fromKeyToTagMapping:(id)a4 withSerializer:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v23 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v15 = [v9 objectForKey:v14];
        uint64_t v16 = [v8 objectForKey:v14];
        BOOL v17 = (void *)v16;
        if (v16)
        {
          uint64_t v29 = v16;
          uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
          v28 = v15;
          id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
          char v20 = [v23 serialize:v18 withValue:v19];

          if ((v20 & 1) == 0)
          {

            BOOL v21 = 0;
            goto LABEL_11;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v21 = 1;
LABEL_11:

  return v21;
}

- (id)_deserializeFromTagDict:(id)a3 withKeyToTagMapping:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [(MIBUStatusResponse *)self _reverseDict:v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = [v6 objectForKey:v14];
        if (v15)
        {
          uint64_t v16 = [v9 objectForKey:v14];
          [v8 setObject:v15 forKey:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (BOOL)_serializeOperationDetailsWithSerializer:(id)a3
{
  v10[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MIBUStatusResponse *)self status];
  id v6 = [v5 operationDetails];
  v9[0] = @"Progress";
  v9[1] = @"TimeRemaining";
  v10[0] = &unk_26E53DF38;
  v10[1] = &unk_26E53DF50;
  v9[2] = @"TargetOSVersion";
  v9[3] = @"TargetBuildVersion";
  v10[2] = &unk_26E53DF68;
  v10[3] = &unk_26E53DF80;
  v9[4] = @"SoftwareUpdatePhase";
  v9[5] = @"TargetSUBundleSize";
  v10[4] = &unk_26E53DF98;
  v10[5] = &unk_26E53DFB0;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  LOBYTE(self) = [(MIBUStatusResponse *)self _serializeDict:v6 fromKeyToTagMapping:v7 withSerializer:v4];

  return (char)self;
}

- (id)_deserializeOperationDetailsFromDict:(id)a3
{
  v10[6] = *MEMORY[0x263EF8340];
  v9[0] = @"Progress";
  v9[1] = @"TimeRemaining";
  v10[0] = &unk_26E53DF38;
  v10[1] = &unk_26E53DF50;
  v9[2] = @"TargetOSVersion";
  v9[3] = @"TargetBuildVersion";
  v10[2] = &unk_26E53DF68;
  v10[3] = &unk_26E53DF80;
  v9[4] = @"SoftwareUpdatePhase";
  v9[5] = @"TargetSUBundleSize";
  v10[4] = &unk_26E53DF98;
  v10[5] = &unk_26E53DFB0;
  id v4 = NSDictionary;
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:6];
  id v7 = [(MIBUStatusResponse *)self _deserializeFromTagDict:v5 withKeyToTagMapping:v6];

  return v7;
}

- (BOOL)_serializeThermalDetailsWithSerializer:(id)a3
{
  v10[9] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MIBUStatusResponse *)self status];
  id v6 = [v5 thermalDetails];
  v9[0] = @"TSRM/TVRM";
  v9[1] = @"TSRR/TVRR";
  v10[0] = &unk_26E53DFC8;
  v10[1] = &unk_26E53DFE0;
  v9[2] = @"TVRQ";
  v9[3] = @"TSBE/TVBE";
  v10[2] = &unk_26E53DFF8;
  v10[3] = &unk_26E53E010;
  v9[4] = @"TSBQ/TVBQ";
  v9[5] = @"TSBR/TVBR";
  v10[4] = &unk_26E53E028;
  v10[5] = &unk_26E53E040;
  void v9[6] = @"TSLR/TVRH";
  v9[7] = @"TG0V";
  v10[6] = &unk_26E53E058;
  void v10[7] = &unk_26E53E070;
  v9[8] = @"ThermalPressure";
  v10[8] = &unk_26E53E088;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:9];
  LOBYTE(self) = [(MIBUStatusResponse *)self _serializeDict:v6 fromKeyToTagMapping:v7 withSerializer:v4];

  return (char)self;
}

- (id)_deserializeThermalDetailsFromDict:(id)a3
{
  v27[9] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  v26[0] = @"TSRM/TVRM";
  v26[1] = @"TSRR/TVRR";
  v27[0] = &unk_26E53DFC8;
  v27[1] = &unk_26E53DFE0;
  v26[2] = @"TVRQ";
  v26[3] = @"TSBE/TVBE";
  v27[2] = &unk_26E53DFF8;
  v27[3] = &unk_26E53E010;
  v26[4] = @"TSBQ/TVBQ";
  v26[5] = @"TSBR/TVBR";
  v27[4] = &unk_26E53E028;
  v27[5] = &unk_26E53E040;
  v26[6] = @"TSLR/TVRH";
  void v26[7] = @"TG0V";
  v27[6] = &unk_26E53E058;
  v27[7] = &unk_26E53E070;
  v26[8] = @"ThermalPressure";
  v27[8] = &unk_26E53E088;
  id v6 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:9];
  id v7 = [(MIBUStatusResponse *)self _deserializeFromTagDict:v4 withKeyToTagMapping:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = [v8 objectForKey:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v20 = 0;
          id v15 = v14;
          if ([v13 isEqualToString:@"TG0V"])
          {
            uint64_t v19 = 0;
            [v15 getBytes:&v19 length:8];
            double v16 = (double)v19 * 0.0000152587891;
            *(float *)&double v16 = v16;
            int v20 = LODWORD(v16);
          }
          else
          {
            [v15 getBytes:&v20 length:4];
            LODWORD(v16) = v20;
          }
          BOOL v17 = [NSNumber numberWithFloat:v16];
          [v5 setObject:v17 forKey:v13];
        }
        else
        {
          [v5 setObject:v14 forKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)_serializeBatteryDetailsWithSerializer:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MIBUStatusResponse *)self status];
  id v6 = [v5 batteryDetails];
  v9[0] = @"WARP";
  v9[1] = @"WAVR";
  v10[0] = &unk_26E53E0A0;
  v10[1] = &unk_26E53E0B8;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  LOBYTE(self) = [(MIBUStatusResponse *)self _serializeDict:v6 fromKeyToTagMapping:v7 withSerializer:v4];

  return (char)self;
}

- (id)_deserializeBatteryDetailsFromDict:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  v24[0] = @"WARP";
  v24[1] = @"WAVR";
  v25[0] = &unk_26E53E0A0;
  v25[1] = &unk_26E53E0B8;
  id v6 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  BOOL v17 = v4;
  id v7 = [(MIBUStatusResponse *)self _deserializeFromTagDict:v4 withKeyToTagMapping:v6];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [v8 objectForKey:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v18 = 0;
          [v14 getBytes:&v18 length:2];
          id v15 = [NSNumber numberWithShort:v18];
          [v5 setObject:v15 forKey:v13];
        }
        else
        {
          [v5 setObject:v14 forKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v5;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (MIBUDeviceStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

- (void)serialize
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to serialize device status, serial number, and nonce", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize payload for StatusUpdate command", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize state", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize operation", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize os version", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize battery level", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize operation error", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize response error", v2, v3, v4, v5, v6);
}

@end