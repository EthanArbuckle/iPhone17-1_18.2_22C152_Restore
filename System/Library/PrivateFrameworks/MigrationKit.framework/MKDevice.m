@interface MKDevice
- (MKDevice)init;
- (NSString)deviceFamily;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)systemName;
- (NSString)systemVersion;
- (int64_t)iconSize;
- (int64_t)type;
- (void)setDeviceFamily:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setIconSize:(int64_t)a3;
- (void)setSystemName:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MKDevice

- (MKDevice)init
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)MKDevice;
  v2 = [(MKDevice *)&v42 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];
    if (v4)
    {
      if (v4 != 1) {
        goto LABEL_13;
      }
      v5 = [MEMORY[0x263F82B60] mainScreen];
      [v5 bounds];
      double v7 = v6;

      v8 = [MEMORY[0x263F82B60] mainScreen];
      [v8 bounds];
      double v10 = v9;

      if (v7 >= v10) {
        double v11 = v7;
      }
      else {
        double v11 = v10;
      }
      BOOL v12 = v11 < 1366.0;
      uint64_t v13 = 167;
      uint64_t v14 = 152;
    }
    else
    {
      v15 = [MEMORY[0x263F82B60] mainScreen];
      [v15 scale];
      double v17 = v16;

      BOOL v12 = v17 < 3.0;
      uint64_t v13 = 180;
      uint64_t v14 = 120;
    }
    if (v12) {
      uint64_t v18 = v14;
    }
    else {
      uint64_t v18 = v13;
    }
    [(MKDevice *)v2 setIconSize:v18];
LABEL_13:
    v19 = [v3 systemName];
    [(MKDevice *)v2 setSystemName:v19];

    v20 = [v3 systemVersion];
    [(MKDevice *)v2 setSystemVersion:v20];

    v21 = [v3 name];
    [(MKDevice *)v2 setDeviceName:v21];

    v22 = +[Model model];
    [(MKDevice *)v2 setDeviceModel:v22];

    v23 = [v3 model];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v24 = [&unk_26DF7B088 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v39;
      v27 = @"Unknown";
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(&unk_26DF7B088);
          }
          v29 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v23 rangeOfString:v29] != 0x7FFFFFFFFFFFFFFFLL)
          {
            v27 = v29;
            goto LABEL_24;
          }
        }
        uint64_t v25 = [&unk_26DF7B088 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    else
    {
      v27 = @"Unknown";
    }
LABEL_24:
    [(MKDevice *)v2 setDeviceFamily:v27];
    v30 = [&unk_26DF7B088 objectAtIndexedSubscript:0];
    char v31 = [(__CFString *)v27 isEqualToString:v30];

    if (v31)
    {
      uint64_t v32 = 1;
    }
    else
    {
      v33 = [&unk_26DF7B088 objectAtIndexedSubscript:1];
      char v34 = [(__CFString *)v27 isEqualToString:v33];

      if (v34)
      {
        uint64_t v32 = 2;
      }
      else
      {
        v35 = [&unk_26DF7B088 objectAtIndexedSubscript:2];
        int v36 = [(__CFString *)v27 isEqualToString:v35];

        if (!v36)
        {
LABEL_31:

          return v2;
        }
        uint64_t v32 = 3;
      }
    }
    [(MKDevice *)v2 setType:v32];
    goto LABEL_31;
  }
  return v2;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)deviceFamily
{
  return self->_deviceFamily;
}

- (void)setDeviceFamily:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceFamily, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
}

@end