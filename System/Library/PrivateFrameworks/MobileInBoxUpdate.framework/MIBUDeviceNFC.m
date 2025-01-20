@interface MIBUDeviceNFC
- (BOOL)endSession;
- (BOOL)productionMode;
- (BOOL)securityMode;
- (BOOL)shutdown:(id *)a3;
- (BOOL)sikaFuseExists;
- (BOOL)startDiag:(id *)a3;
- (BOOL)startSession;
- (BOOL)uidMode;
- (MIBUDeviceNFC)init;
- (MIBUDeviceStatus)status;
- (MIBUNFCReaderSession)mibureaderSession;
- (MIBUNetworkInfo)networkInfo;
- (NFReaderSession)readerSession;
- (NFSession)nfSession;
- (id)apNonce;
- (id)boardID;
- (id)buildVersion;
- (id)chipID;
- (id)ecid;
- (id)osVersion;
- (id)protocolVersion;
- (id)securityDomain;
- (id)sepNonce;
- (id)serialNumber;
- (id)sikaFuse;
- (void)getDeviceInfo:(id *)a3;
- (void)setApNonce:(id)a3;
- (void)setBoardID:(id)a3;
- (void)setChipID:(id)a3;
- (void)setEcid:(id)a3;
- (void)setMibureaderSession:(id)a3;
- (void)setNetworkInfo:(id)a3;
- (void)setNfSession:(id)a3;
- (void)setProductionMode:(BOOL)a3;
- (void)setReaderSession:(id)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setSecurityMode:(BOOL)a3;
- (void)setSepNonce:(id)a3;
- (void)setSikaFuse:(id)a3;
- (void)setSikaFuseExists:(BOOL)a3;
- (void)setStatus:(id)a3;
- (void)setUidMode:(BOOL)a3;
@end

@implementation MIBUDeviceNFC

- (MIBUDeviceNFC)init
{
  v13.receiver = self;
  v13.super_class = (Class)MIBUDeviceNFC;
  v2 = [(MIBUDeviceNFC *)&v13 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUDeviceNFC *)v2 setNfSession:0];
    [(MIBUDeviceNFC *)v3 setReaderSession:0];
    status = v3->_status;
    v3->_status = 0;

    ecid = v3->_ecid;
    v3->_ecid = 0;

    boardID = v3->_boardID;
    v3->_boardID = 0;

    chipID = v3->_chipID;
    v3->_chipID = 0;

    v3->_securityDomain = 0;
    apNonce = v3->_apNonce;
    v3->_apNonce = 0;

    v3->_productionMode = 0;
    v3->_securityMode = 0;
    v3->_uidMode = 0;
    networkInfo = v3->_networkInfo;
    v3->_networkInfo = 0;

    sikaFuse = v3->_sikaFuse;
    v3->_sikaFuse = 0;

    v3->_sikaFuseExists = 1;
    protocolVersion = v3->_protocolVersion;
    v3->_protocolVersion = (NSNumber *)&unk_26E53EAD8;
  }
  return v3;
}

- (BOOL)startSession
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(MIBUNFCReaderSession);
  [(MIBUDeviceNFC *)self setMibureaderSession:v3];

  v4 = [(MIBUDeviceNFC *)self mibureaderSession];

  if (!v4)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_16);
    }
    v8 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v9 = NSString;
      v10 = v8;
      v11 = [v9 stringWithFormat:@"Failed to init MIBUreaderSession object"];
      *(_DWORD *)buf = 138543618;
      v18 = self;
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_2309BC000, v10, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
    }
    return 1;
  }
  v5 = [(MIBUDeviceNFC *)self mibureaderSession];
  id v16 = 0;
  [v5 start:&v16];
  id v6 = v16;

  if (!v6) {
    return 1;
  }
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_20_0);
  }
  v12 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v13 = NSString;
    v14 = v12;
    v15 = [v13 stringWithFormat:@"Failed to start MIBUreaderSession session"];
    *(_DWORD *)buf = 138543618;
    v18 = self;
    __int16 v19 = 2114;
    v20 = v15;
    _os_log_impl(&dword_2309BC000, v14, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
  }
  return 0;
}

void __29__MIBUDeviceNFC_startSession__block_invoke()
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

void __29__MIBUDeviceNFC_startSession__block_invoke_18()
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

- (void)getDeviceInfo:(id *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v4 = [[MIBUNFCCommand alloc] initWithCommandCode:1 andPayload:0];
  uint64_t v5 = [(MIBUDeviceNFC *)self mibureaderSession];
  id v28 = 0;
  uint64_t v6 = [v5 sendCommand:v4 withError:&v28];
  id v7 = v28;

  if (v7)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_26);
    }
    uint64_t v8 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = NSString;
      v10 = v8;
      v11 = [v9 stringWithFormat:@"Failed at command step: %@", v7];
      *(_DWORD *)buf = 138543618;
      v30 = self;
      __int16 v31 = 2114;
      v32 = v11;
      _os_log_impl(&dword_2309BC000, v10, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v12 = v6;
    objc_super v13 = [v12 serialNumber];
    serialNumber = self->_serialNumber;
    self->_serialNumber = v13;

    v15 = [v12 ecid];
    ecid = self->_ecid;
    self->_ecid = v15;

    v17 = [v12 boardID];
    boardID = self->_boardID;
    self->_boardID = v17;

    __int16 v19 = [v12 chipID];
    chipID = self->_chipID;
    self->_chipID = v19;

    self->_securityDomain = (NSNumber *)(id)[v12 securityDomain];
    uint64_t v21 = [v12 apNonce];
    apNonce = self->_apNonce;
    self->_apNonce = v21;

    self->_productionMode = [v12 productionMode];
    self->_securityMode = [v12 securityMode];
    self->_uidMode = [v12 uidMode];
    v23 = [v12 sepNonce];
    sepNonce = self->_sepNonce;
    self->_sepNonce = v23;

    v25 = [v12 sikaFuse];
    sikaFuse = self->_sikaFuse;
    self->_sikaFuse = v25;

    char v27 = [v12 sikaFuseExists];
    self->_sikaFuseExists = v27;
  }
}

void __31__MIBUDeviceNFC_getDeviceInfo___block_invoke()
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

- (BOOL)startDiag:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  time_t v24 = 0;
  uint64_t v4 = objc_opt_new();
  id v23 = 0;
  uint64_t v5 = +[MIBUPersonalizationManager requestTatsuTicketForDevice:self error:&v23];
  id v6 = v23;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_33_2);
  }
  uint64_t v7 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSString;
    uint64_t v9 = v7;
    v10 = [v8 stringWithFormat:@"tatsu ticket: %@", v5];
    *(_DWORD *)buf = 138543618;
    v26 = self;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_impl(&dword_2309BC000, v9, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
  }
  time(&v24);
  [v4 setObject:v5 forKey:@"TatsuTicket"];
  v11 = [NSNumber numberWithLong:v24];
  [v4 setObject:v11 forKey:@"TimeStamp"];

  id v12 = [[MIBUNFCCommand alloc] initWithCommandCode:11 andPayload:v4];
  objc_super v13 = [(MIBUDeviceNFC *)self mibureaderSession];
  id v22 = v6;
  v14 = [v13 sendCommand:v12 withError:&v22];
  id v15 = v22;

  if (v15)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_40_1);
    }
    id v16 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      [(MIBUDeviceNFC *)(uint64_t)self startDiag:(uint64_t)v15];
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_43_1);
    }
    v17 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSString;
      __int16 v19 = v17;
      v20 = [v18 stringWithFormat:@"Tatsu ticket check successful"];
      *(_DWORD *)buf = 138543618;
      v26 = self;
      __int16 v27 = 2114;
      id v28 = v20;
      _os_log_impl(&dword_2309BC000, v19, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v15 == 0;
}

void __27__MIBUDeviceNFC_startDiag___block_invoke()
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

void __27__MIBUDeviceNFC_startDiag___block_invoke_38()
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

void __27__MIBUDeviceNFC_startDiag___block_invoke_41()
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

- (BOOL)shutdown:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_opt_new();
  [v4 setObject:&unk_26E53EC28 forKey:@"HeartbeatPeriod"];
  [v4 setObject:&unk_26E53EAF0 forKey:@"HeartbeatTimeout"];
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_51_1);
  }
  uint64_t v5 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSString;
    uint64_t v7 = v5;
    uint64_t v8 = [v6 stringWithFormat:@"Begin heartbeat with period: 0.5; timeout: 0..."];
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_2309BC000, v7, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
  }
  uint64_t v9 = [[MIBUNFCCommand alloc] initWithCommandCode:7 andPayload:v4];
  v10 = [(MIBUDeviceNFC *)self mibureaderSession];
  id v19 = 0;
  v11 = [v10 sendCommand:v9 withError:&v19];
  id v12 = v19;

  if (v12)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_57_1);
    }
    objc_super v13 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      [(MIBUDeviceNFC *)(uint64_t)self startDiag:(uint64_t)v12];
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_60_1);
    }
    v14 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NSString;
      id v16 = v14;
      v17 = [v15 stringWithFormat:@"heartbeat successful"];
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = v17;
      _os_log_impl(&dword_2309BC000, v16, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v12 == 0;
}

void __26__MIBUDeviceNFC_shutdown___block_invoke()
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

void __26__MIBUDeviceNFC_shutdown___block_invoke_55()
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

void __26__MIBUDeviceNFC_shutdown___block_invoke_58()
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

- (BOOL)endSession
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_65_0);
  }
  uint64_t v3 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = NSString;
    uint64_t v5 = v3;
    uint64_t v6 = [v4 stringWithFormat:@"mibureader object disconnectTag"];
    int v14 = 138543618;
    id v15 = self;
    __int16 v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_2309BC000, v5, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v7 = [(MIBUDeviceNFC *)self mibureaderSession];
  [v7 disconnectTag:0];

  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_71);
  }
  uint64_t v8 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSString;
    v10 = v8;
    v11 = [v9 stringWithFormat:@"mibureader object end"];
    int v14 = 138543618;
    id v15 = self;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_2309BC000, v10, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  id v12 = [(MIBUDeviceNFC *)self mibureaderSession];
  [v12 end];

  return 1;
}

void __27__MIBUDeviceNFC_endSession__block_invoke()
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

void __27__MIBUDeviceNFC_endSession__block_invoke_69()
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

- (id)serialNumber
{
  return self->_serialNumber;
}

- (id)osVersion
{
  return self->_osVersion;
}

- (id)buildVersion
{
  return self->_buildVersion;
}

- (MIBUDeviceStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (id)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
}

- (id)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(id)a3
{
}

- (id)chipID
{
  return self->_chipID;
}

- (void)setChipID:(id)a3
{
}

- (id)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
  self->_securityDomain = (NSNumber *)a3;
}

- (id)apNonce
{
  return self->_apNonce;
}

- (void)setApNonce:(id)a3
{
}

- (id)sepNonce
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

- (MIBUNetworkInfo)networkInfo
{
  return self->_networkInfo;
}

- (void)setNetworkInfo:(id)a3
{
}

- (id)sikaFuse
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

- (id)protocolVersion
{
  return self->_protocolVersion;
}

- (NFSession)nfSession
{
  return self->_nfSession;
}

- (void)setNfSession:(id)a3
{
}

- (NFReaderSession)readerSession
{
  return self->_readerSession;
}

- (void)setReaderSession:(id)a3
{
}

- (MIBUNFCReaderSession)mibureaderSession
{
  return self->_mibureaderSession;
}

- (void)setMibureaderSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mibureaderSession, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_storeStrong((id *)&self->_nfSession, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_sikaFuse, 0);
  objc_storeStrong((id *)&self->_networkInfo, 0);
  objc_storeStrong((id *)&self->_sepNonce, 0);
  objc_storeStrong((id *)&self->_apNonce, 0);
  objc_storeStrong((id *)&self->_chipID, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

- (void)startDiag:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = NSString;
  id v5 = a2;
  uint64_t v13 = a3;
  uint64_t v6 = [v4 stringWithFormat:@"Failed at command step: %@"];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_2(&dword_2309BC000, v7, v8, "Device Error %{public}@: %{public}@", v9, v10, v11, v12, v13, v14, v15);
}

@end