@interface MIBUDeviceInfoResponse
- (BOOL)_deserialize:(id)a3;
- (BOOL)productionMode;
- (BOOL)securityMode;
- (BOOL)sikaFuseExists;
- (BOOL)uidMode;
- (MIBUDeviceInfoResponse)init;
- (NSData)apNonce;
- (NSData)sepNonce;
- (NSNumber)boardID;
- (NSNumber)chipID;
- (NSNumber)ecid;
- (NSNumber)securityDomain;
- (NSNumber)sikaFuse;
- (NSString)serialNumber;
- (id)serialize;
- (void)serialize;
- (void)setApNonce:(id)a3;
- (void)setBoardID:(id)a3;
- (void)setChipID:(id)a3;
- (void)setEcid:(id)a3;
- (void)setProductionMode:(BOOL)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setSecurityMode:(BOOL)a3;
- (void)setSepNonce:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSikaFuse:(id)a3;
- (void)setSikaFuseExists:(BOOL)a3;
- (void)setUidMode:(BOOL)a3;
@end

@implementation MIBUDeviceInfoResponse

- (MIBUDeviceInfoResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUDeviceInfoResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUDeviceInfoResponse *)v2 setSerialNumber:0];
    [(MIBUDeviceInfoResponse *)v3 setEcid:0];
    [(MIBUDeviceInfoResponse *)v3 setBoardID:0];
    [(MIBUDeviceInfoResponse *)v3 setChipID:0];
    [(MIBUDeviceInfoResponse *)v3 setApNonce:0];
    [(MIBUDeviceInfoResponse *)v3 setSepNonce:0];
    [(MIBUDeviceInfoResponse *)v3 setSecurityDomain:0];
    [(MIBUDeviceInfoResponse *)v3 setProductionMode:0];
    [(MIBUDeviceInfoResponse *)v3 setSecurityMode:0];
    [(MIBUDeviceInfoResponse *)v3 setUidMode:0];
    [(MIBUDeviceInfoResponse *)v3 setSikaFuse:0];
    [(MIBUDeviceInfoResponse *)v3 setSikaFuseExists:1];
  }
  return v3;
}

- (id)serialize
{
  v35[12] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if (![(MIBUNFCResponse *)self rejected])
  {
    uint64_t v4 = [(MIBUDeviceInfoResponse *)self serialNumber];
    v35[0] = v4;
    uint64_t v5 = [(MIBUDeviceInfoResponse *)self ecid];
    v35[1] = v5;
    uint64_t v6 = [(MIBUDeviceInfoResponse *)self boardID];
    v35[2] = v6;
    uint64_t v7 = [(MIBUDeviceInfoResponse *)self chipID];
    v35[3] = v7;
    uint64_t v8 = [(MIBUDeviceInfoResponse *)self securityDomain];
    v35[4] = v8;
    uint64_t v9 = [(MIBUDeviceInfoResponse *)self apNonce];
    if (v9)
    {
      uint64_t v10 = [(MIBUDeviceInfoResponse *)self apNonce];
    }
    else
    {
      uint64_t v10 = objc_opt_new();
    }
    v11 = (void *)v10;
    v35[5] = v10;
    [(MIBUDeviceInfoResponse *)self sepNonce];
    v33 = (void *)v5;
    v34 = (void *)v4;
    v31 = (void *)v7;
    v32 = (void *)v6;
    v29 = (void *)v9;
    uint64_t v26 = v30 = (void *)v8;
    v28 = v11;
    if (v26)
    {
      uint64_t v12 = [(MIBUDeviceInfoResponse *)self sepNonce];
    }
    else
    {
      uint64_t v12 = objc_opt_new();
    }
    v13 = (void *)v12;
    v35[6] = v12;
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[MIBUDeviceInfoResponse productionMode](self, "productionMode", v26));
    v35[7] = v14;
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[MIBUDeviceInfoResponse securityMode](self, "securityMode"));
    v35[8] = v15;
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[MIBUDeviceInfoResponse uidMode](self, "uidMode"));
    v35[9] = v16;
    v17 = [(MIBUDeviceInfoResponse *)self sikaFuse];
    v35[10] = v17;
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[MIBUDeviceInfoResponse sikaFuseExists](self, "sikaFuseExists"));
    v35[11] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:12];
    char v20 = [v3 serialize:&unk_26E53EB20 withValue:v19];

    if (v20)
    {
      v21 = [(MIBUNFCResponse *)self error];
      char v22 = [v3 serializeResponseError:v21];

      if (v22)
      {
        v23 = [v3 serializedData];
        goto LABEL_11;
      }
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_31);
      }
      v25 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        [(MIBUDeviceInfoResponse *)v25 serialize];
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_4);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        -[MIBUDeviceInfoResponse serialize]();
      }
    }
  }
  v23 = 0;
LABEL_11:

  return v23;
}

void __35__MIBUDeviceInfoResponse_serialize__block_invoke()
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

void __35__MIBUDeviceInfoResponse_serialize__block_invoke_29()
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
  v44 = v5;
  if (!v6)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_34);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:]();
    }
    goto LABEL_38;
  }
  id v49 = 0;
  BOOL v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v49];
  id v8 = v49;
  uint64_t v9 = v8;
  if (!v7)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUStatusResponse _deserialize:].cold.7();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_45;
  }
  if (v8)
  {
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_22;
  }
  uint64_t v10 = [v6 objectForKey:&unk_26E53E6B8];
  if (!v10)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_40);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:]();
    }
LABEL_38:
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
LABEL_44:
    uint64_t v9 = 0;
LABEL_45:
    BOOL v31 = 0;
    goto LABEL_23;
  }
  v11 = (void *)v10;
  uint64_t v12 = [v6 objectForKey:&unk_26E53E6D0];
  if (!v12)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_43);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:]();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    v29 = 0;
    goto LABEL_44;
  }
  v13 = (void *)v12;
  uint64_t v14 = [v6 objectForKey:&unk_26E53E6E8];
  if (!v14)
  {
    v39 = v13;
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_46);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:].cold.4();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    goto LABEL_56;
  }
  v15 = (void *)v14;
  uint64_t v16 = [v6 objectForKey:&unk_26E53E700];
  if (!v16)
  {
    v39 = v13;
    v28 = v15;
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_49);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:].cold.5();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
LABEL_56:
    uint64_t v9 = 0;
    BOOL v31 = 0;
    v29 = v39;
    goto LABEL_23;
  }
  v17 = (void *)v16;
  uint64_t v18 = [v6 objectForKey:&unk_26E53E718];
  if (!v18)
  {
    v37 = v17;
    v40 = v13;
    v28 = v15;
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_52_0);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:].cold.6();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    goto LABEL_67;
  }
  v19 = (void *)v18;
  uint64_t v20 = [v6 objectForKey:&unk_26E53E730];
  if (!v20)
  {
    v32 = v19;
    v37 = v17;
    v40 = v13;
    v28 = v15;
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_55_0);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:].cold.7();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
LABEL_67:
    uint64_t v9 = 0;
    BOOL v31 = 0;
    id v27 = v37;
    v29 = v40;
    goto LABEL_23;
  }
  v21 = (void *)v20;
  uint64_t v22 = [v6 objectForKey:&unk_26E53E748];
  uint64_t v23 = [v6 objectForKey:&unk_26E53E760];
  v42 = (void *)v22;
  if (!v23)
  {
    v36 = v21;
    v32 = v19;
    v38 = v17;
    v41 = v13;
    v28 = v15;
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_61);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:].cold.8();
    }
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    uint64_t v9 = 0;
    BOOL v31 = 0;
    v29 = v41;
    goto LABEL_83;
  }
  v46 = (void *)v23;
  uint64_t v24 = [v6 objectForKey:&unk_26E53E778];
  if (!v24)
  {
    v36 = v21;
    v38 = v17;
    v35 = v15;
    v32 = v19;
    v29 = v13;
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_64_0);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:].cold.9();
    }
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    uint64_t v9 = 0;
    BOOL v31 = 0;
    v28 = v35;
    goto LABEL_83;
  }
  v47 = (void *)v24;
  uint64_t v25 = [v6 objectForKey:&unk_26E53E790];
  if (!v25)
  {
    v36 = v21;
    v38 = v17;
    v32 = v19;
    v28 = v15;
    v29 = v13;
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_67_0);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeviceInfoResponse _deserialize:]0();
    }
    v43 = 0;
    v48 = 0;
    v45 = 0;
    uint64_t v9 = 0;
    BOOL v31 = 0;
LABEL_83:
    v21 = v36;
    id v27 = v38;
    goto LABEL_23;
  }
  v45 = (void *)v25;
  uint64_t v26 = [v6 objectForKey:&unk_26E53E7C0];
  v43 = v26;
  if (!v26)
  {
    v48 = 0;
    goto LABEL_21;
  }
  v48 = [v6 objectForKey:&unk_26E53E7A8];
  if (v48)
  {
LABEL_21:
    [(MIBUDeviceInfoResponse *)self setSerialNumber:v11];
    [(MIBUDeviceInfoResponse *)self setEcid:v13];
    [(MIBUDeviceInfoResponse *)self setBoardID:v15];
    [(MIBUDeviceInfoResponse *)self setChipID:v17];
    [(MIBUDeviceInfoResponse *)self setSecurityDomain:v19];
    [(MIBUDeviceInfoResponse *)self setApNonce:v21];
    [(MIBUDeviceInfoResponse *)self setSepNonce:v22];
    -[MIBUDeviceInfoResponse setProductionMode:](self, "setProductionMode:", [v46 BOOLValue]);
    -[MIBUDeviceInfoResponse setSecurityMode:](self, "setSecurityMode:", [v47 BOOLValue]);
    -[MIBUDeviceInfoResponse setUidMode:](self, "setUidMode:", [v45 BOOLValue]);
    [(MIBUDeviceInfoResponse *)self setSikaFuse:v48];
    -[MIBUDeviceInfoResponse setSikaFuseExists:](self, "setSikaFuseExists:", [v26 BOOLValue]);
    id v27 = v17;
    v29 = v13;
    v32 = v19;
    v28 = v15;
    v30 = v11;
    uint64_t v9 = 0;
LABEL_22:
    BOOL v31 = 1;
    goto LABEL_23;
  }
  v34 = v19;
  id v27 = v17;
  v28 = v15;
  v29 = v13;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_70_0);
  }
  v30 = v11;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    -[MIBUDeviceInfoResponse _deserialize:]1();
  }
  v48 = 0;
  uint64_t v9 = 0;
  BOOL v31 = 0;
  v32 = v34;
LABEL_23:
  [(MIBUNFCResponse *)self setError:v9];

  return v31;
}

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_35()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_38()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_41()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_44()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_47()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_50()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_53()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_59()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_62()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_65()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_68()
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

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
}

- (NSNumber)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(id)a3
{
}

- (NSNumber)chipID
{
  return self->_chipID;
}

- (void)setChipID:(id)a3
{
}

- (NSNumber)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
  self->_securityDomain = (NSNumber *)a3;
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (void)setApNonce:(id)a3
{
}

- (NSData)sepNonce
{
  return self->_sepNonce;
}

- (void)setSepNonce:(id)a3
{
}

- (BOOL)productionMode
{
  return self->_productionMode;
}

- (void)setProductionMode:(BOOL)a3
{
  self->_productionMode = a3;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(BOOL)a3
{
  self->_securityMode = a3;
}

- (BOOL)uidMode
{
  return self->_uidMode;
}

- (void)setUidMode:(BOOL)a3
{
  self->_uidMode = a3;
}

- (NSNumber)sikaFuse
{
  return self->_sikaFuse;
}

- (void)setSikaFuse:(id)a3
{
}

- (BOOL)sikaFuseExists
{
  return self->_sikaFuseExists;
}

- (void)setSikaFuseExists:(BOOL)a3
{
  self->_sikaFuseExists = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sikaFuse, 0);
  objc_storeStrong((id *)&self->_sepNonce, 0);
  objc_storeStrong((id *)&self->_apNonce, 0);
  objc_storeStrong((id *)&self->_chipID, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_ecid, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

- (void)serialize
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to serialize serial number & nonce", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize payload for DeviceInfo command", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize serial number", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize ecid", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize board ID", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize chip ID", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize security domain", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize ap nonce", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize production mode", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize security mode", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.10()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize UID mode", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.11()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize sikaFuse", v2, v3, v4, v5, v6);
}

@end