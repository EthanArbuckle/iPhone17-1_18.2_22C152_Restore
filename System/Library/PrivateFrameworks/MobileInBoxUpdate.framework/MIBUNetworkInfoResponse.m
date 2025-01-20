@interface MIBUNetworkInfoResponse
- (BOOL)_deserialize:(id)a3;
- (MIBUNetworkInfo)networkInfo;
- (MIBUNetworkInfoResponse)init;
- (id)serialize;
- (void)serialize;
- (void)setNetworkInfo:(id)a3;
@end

@implementation MIBUNetworkInfoResponse

- (MIBUNetworkInfoResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUNetworkInfoResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MIBUNetworkInfoResponse *)v2 setNetworkInfo:0];
  }
  return v3;
}

- (id)serialize
{
  v76[13] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = [(MIBUNetworkInfoResponse *)self networkInfo];

  if (v4)
  {
    if (![(MIBUNFCResponse *)self rejected])
    {
      objc_super v5 = [(MIBUNetworkInfoResponse *)self networkInfo];
      [v5 networkName];
      v73 = v74 = v5;
      if (v73)
      {
        v72 = [(MIBUNetworkInfoResponse *)self networkInfo];
        uint64_t v6 = [v72 networkName];
      }
      else
      {
        uint64_t v6 = objc_opt_new();
        v72 = (void *)v6;
      }
      v48 = (void *)v6;
      v76[0] = v6;
      v7 = NSNumber;
      v8 = [(MIBUNetworkInfoResponse *)self networkInfo];
      uint64_t v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "RSSI"));
      v76[1] = v9;
      v10 = NSNumber;
      v11 = [(MIBUNetworkInfoResponse *)self networkInfo];
      uint64_t v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "noise"));
      v76[2] = v12;
      v13 = NSNumber;
      v14 = [(MIBUNetworkInfoResponse *)self networkInfo];
      uint64_t v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "channel"));
      v76[3] = v15;
      v16 = NSNumber;
      v65 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v64 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v65, "channelWidth"));
      v76[4] = v64;
      v17 = NSNumber;
      v63 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v62 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v63, "channelBand"));
      v76[5] = v62;
      v18 = NSNumber;
      v61 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v60 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v61, "PHYMode"));
      v76[6] = v60;
      v19 = NSNumber;
      v59 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v58 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v59, "numberOfSpatialStreams"));
      v76[7] = v58;
      v20 = NSNumber;
      v21 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v56 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "MCSIndex"));
      v76[8] = v56;
      v55 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v75 = [v55 MACAddress];
      if (v75)
      {
        v54 = [(MIBUNetworkInfoResponse *)self networkInfo];
        uint64_t v22 = [v54 MACAddress];
      }
      else
      {
        uint64_t v22 = objc_opt_new();
        v54 = (void *)v22;
      }
      v47 = (void *)v22;
      v76[9] = v22;
      v53 = [(MIBUNetworkInfoResponse *)self networkInfo];
      uint64_t v23 = [v53 iPV4Address];
      v66 = (void *)v15;
      v67 = v14;
      if (v23)
      {
        v51 = [(MIBUNetworkInfoResponse *)self networkInfo];
        uint64_t v24 = [v51 iPV4Address];
      }
      else
      {
        uint64_t v24 = objc_opt_new();
        v51 = (void *)v24;
      }
      v52 = (void *)v23;
      v46 = (void *)v24;
      v76[10] = v24;
      v49 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v25 = [v49 iPV6Address];
      v70 = (void *)v9;
      v71 = v8;
      v68 = (void *)v12;
      v69 = v11;
      v26 = v3;
      if (v25)
      {
        v27 = [(MIBUNetworkInfoResponse *)self networkInfo];
        uint64_t v28 = [v27 iPV6Address];
      }
      else
      {
        uint64_t v28 = objc_opt_new();
        v27 = (void *)v28;
      }
      v29 = (void *)v28;
      v76[11] = v28;
      v30 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v31 = [v30 BSSID];
      v57 = v21;
      if (v31)
      {
        v8 = [(MIBUNetworkInfoResponse *)self networkInfo];
        v32 = [v8 BSSID];
      }
      else
      {
        v32 = objc_opt_new();
      }
      v76[12] = v32;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:13];
      char v50 = [v26 serialize:&unk_26E53EB50 withValue:v33];

      if (v31)
      {

        v32 = v8;
      }

      if (v25) {
      v3 = v26;
      }
      if (v52) {

      }
      if (v75) {
      if (v73)
      }

      if (v50)
      {
        v34 = [(MIBUNFCResponse *)self error];
        char v35 = [v26 serializeResponseError:v34];

        if (v35)
        {
          v4 = [v26 serializedData];
          goto LABEL_31;
        }
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_33_0);
        }
        v45 = (void *)MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          [(MIBUDeviceInfoResponse *)v45 serialize];
        }
      }
      else
      {
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_6);
        }
        v37 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          [(MIBUNetworkInfoResponse *)v37 serialize];
        }
      }
    }
    v4 = 0;
  }
LABEL_31:

  return v4;
}

void __36__MIBUNetworkInfoResponse_serialize__block_invoke()
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

void __36__MIBUNetworkInfoResponse_serialize__block_invoke_31()
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
      dispatch_once(&MIBUOnceToken, &__block_literal_global_36);
    }
    uint64_t v42 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNetworkInfoResponse _deserialize:](v42, v43, v44, v45, v46, v47, v48, v49);
    }
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v66 = 0;
    v67 = 0;
    v63 = 0;
    v64 = 0;
    v34 = 0;
    v33 = 0;
    v37 = 0;
    uint64_t v39 = 0;
    v31 = 0;
    id v65 = 0;
    goto LABEL_15;
  }
  id v72 = 0;
  BOOL v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v72];
  id v65 = v72;
  if (!v7)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_39_0);
    }
    char v50 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNetworkInfoResponse _deserialize:](v50, v51, v52, v53, v54, v55, v56, v57);
    }
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v66 = 0;
    v67 = 0;
    v63 = 0;
    v64 = 0;
    v34 = 0;
    v33 = 0;
    v37 = 0;
    uint64_t v39 = 0;
    v31 = 0;
LABEL_15:
    BOOL v40 = 0;
    goto LABEL_4;
  }
  uint64_t v58 = [v6 objectForKey:&unk_26E53E7F0];
  v63 = [v6 objectForKey:&unk_26E53E808];
  v71 = [v6 objectForKey:&unk_26E53E820];
  v70 = [v6 objectForKey:&unk_26E53E838];
  v69 = [v6 objectForKey:&unk_26E53E850];
  uint64_t v8 = [v6 objectForKey:&unk_26E53E868];
  uint64_t v9 = [v6 objectForKey:&unk_26E53E880];
  v10 = [v6 objectForKey:&unk_26E53E898];
  v11 = [v6 objectForKey:&unk_26E53E8B0];
  uint64_t v60 = [v6 objectForKey:&unk_26E53E8C8];
  uint64_t v59 = [v6 objectForKey:&unk_26E53E8E0];
  uint64_t v61 = [v6 objectForKey:&unk_26E53E8F8];
  uint64_t v62 = [v6 objectForKey:&unk_26E53E910];
  uint64_t v12 = objc_alloc_init(MIBUNetworkInfo);
  [(MIBUNetworkInfoResponse *)self setNetworkInfo:v12];

  v13 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v13 setNetworkName:v58];

  uint64_t v14 = [v63 longValue];
  [(MIBUNetworkInfoResponse *)self networkInfo];
  v16 = uint64_t v15 = v5;
  [v16 setRSSI:v14];

  uint64_t v17 = [v71 longValue];
  v18 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v18 setNoise:v17];

  uint64_t v19 = [v70 longValue];
  v20 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v20 setChannel:v19];

  uint64_t v21 = (int)[v69 intValue];
  uint64_t v22 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v22 setChannelWidth:v21];

  v67 = v8;
  uint64_t v23 = (int)[v8 intValue];
  uint64_t v24 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v24 setChannelBand:v23];

  v66 = v9;
  uint64_t v25 = (int)[v9 intValue];
  v26 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v26 setPHYMode:v25];

  v68 = v10;
  uint64_t v27 = [v10 unsignedLongValue];
  uint64_t v28 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v28 setNumberOfSpatialStreams:v27];

  v64 = v11;
  uint64_t v29 = [v11 unsignedLongValue];
  v30 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v30 setMCSIndex:v29];

  uint64_t v5 = v15;
  v31 = (void *)v58;
  v32 = [(MIBUNetworkInfoResponse *)self networkInfo];
  v33 = (void *)v59;
  v34 = (void *)v60;
  objc_msgSend(v32, "setMACAddress:");

  char v35 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v35 setIPV4Address:v59];

  v36 = [(MIBUNetworkInfoResponse *)self networkInfo];
  v37 = (void *)v61;
  objc_msgSend(v36, "setIPV6Address:");

  uint64_t v38 = [(MIBUNetworkInfoResponse *)self networkInfo];
  uint64_t v39 = (void *)v62;
  objc_msgSend(v38, "setBSSID:");

  BOOL v40 = 1;
LABEL_4:
  [(MIBUNFCResponse *)self setError:v65];

  return v40;
}

void __40__MIBUNetworkInfoResponse__deserialize___block_invoke()
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

void __40__MIBUNetworkInfoResponse__deserialize___block_invoke_37()
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

- (MIBUNetworkInfo)networkInfo
{
  return self->_networkInfo;
}

- (void)setNetworkInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)serialize
{
}

- (void)_deserialize:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_deserialize:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end