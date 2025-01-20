@interface ICASDeviceData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDeviceData)initWithDeviceModel:(id)a3 devicePlatform:(id)a4 osInstallVariant:(id)a5 osVersion:(id)a6 osBundleVersion:(id)a7;
- (ICASOsInstallVariant)osInstallVariant;
- (NSString)deviceModel;
- (NSString)devicePlatform;
- (NSString)osBundleVersion;
- (NSString)osVersion;
- (id)toDict;
@end

@implementation ICASDeviceData

- (ICASDeviceData)initWithDeviceModel:(id)a3 devicePlatform:(id)a4 osInstallVariant:(id)a5 osVersion:(id)a6 osBundleVersion:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASDeviceData;
  v17 = [(ICASDeviceData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deviceModel, a3);
    objc_storeStrong((id *)&v18->_devicePlatform, a4);
    objc_storeStrong((id *)&v18->_osInstallVariant, a5);
    objc_storeStrong((id *)&v18->_osVersion, a6);
    objc_storeStrong((id *)&v18->_osBundleVersion, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)@"DeviceData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v21[0] = @"deviceModel";
  uint64_t v19 = [(ICASDeviceData *)self deviceModel];
  if (v19)
  {
    uint64_t v3 = [(ICASDeviceData *)self deviceModel];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = @"devicePlatform";
  v5 = [(ICASDeviceData *)self devicePlatform];
  if (v5)
  {
    uint64_t v6 = [(ICASDeviceData *)self devicePlatform];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = @"osInstallVariant";
  v8 = [(ICASDeviceData *)self osInstallVariant];
  if (v8)
  {
    uint64_t v9 = [(ICASDeviceData *)self osInstallVariant];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = @"osVersion";
  v11 = [(ICASDeviceData *)self osVersion];
  if (v11)
  {
    uint64_t v12 = [(ICASDeviceData *)self osVersion];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  id v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = @"osBundleVersion";
  id v14 = [(ICASDeviceData *)self osBundleVersion];
  if (v14)
  {
    uint64_t v15 = [(ICASDeviceData *)self osBundleVersion];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  id v16 = (void *)v15;
  v22[4] = v15;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];

  return v17;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)devicePlatform
{
  return self->_devicePlatform;
}

- (ICASOsInstallVariant)osInstallVariant
{
  return self->_osInstallVariant;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)osBundleVersion
{
  return self->_osBundleVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osBundleVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_osInstallVariant, 0);
  objc_storeStrong((id *)&self->_devicePlatform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end