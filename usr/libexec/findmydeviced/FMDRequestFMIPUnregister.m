@interface FMDRequestFMIPUnregister
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (BOOL)showAuthFailedMessage;
- (FMDAccount)account;
- (FMDFMIPUnregisterDeviceInfo)device;
- (FMDRequestFMIPUnregister)initWithAccount:(id)a3 device:(id)a4 otherDevices:(id)a5;
- (NSArray)otherDevices;
- (id)authToken;
- (id)requestBody;
- (id)urlTemplateType;
- (void)_dumpInfoForDevice:(id)a3 into:(id)a4 host:(BOOL)a5;
- (void)setAccount:(id)a3;
- (void)setDevice:(id)a3;
- (void)setOtherDevices:(id)a3;
@end

@implementation FMDRequestFMIPUnregister

- (FMDRequestFMIPUnregister)initWithAccount:(id)a3 device:(id)a4 otherDevices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestFMIPUnregister;
  v11 = [(FMDRequest *)&v14 initWithAccount:v8];
  v12 = v11;
  if (v11)
  {
    [(FMDRequestFMIPUnregister *)v11 setAccount:v8];
    [(FMDRequestFMIPUnregister *)v12 setDevice:v9];
    [(FMDRequestFMIPUnregister *)v12 setOtherDevices:v10];
  }

  return v12;
}

- (id)urlTemplateType
{
  return @"unregisterV2";
}

- (id)requestBody
{
  v29.receiver = self;
  v29.super_class = (Class)FMDRequestFMIPUnregister;
  v3 = [(FMDRequest *)&v29 requestBody];
  v4 = objc_alloc_init(FMDActingRequestDecorator);
  v5 = [(FMDActingRequestDecorator *)v4 standardDeviceContext];

  [v3 fm_safelyMapKey:@"deviceContext" toObject:v5];
  v6 = +[FMDSystemConfig sharedInstance];
  v7 = [v6 deviceUDID];

  if (v7)
  {
    id v8 = [(FMDRequestFMIPUnregister *)self device];
    id v9 = [v8 udid];
    uint64_t v10 = (uint64_t)[v9 isEqualToString:v7];
  }
  else
  {
    uint64_t v10 = 1;
  }
  v11 = [(FMDRequestFMIPUnregister *)self device];
  [(FMDRequestFMIPUnregister *)self _dumpInfoForDevice:v11 into:v3 host:v10];

  v12 = [(FMDRequestFMIPUnregister *)self otherDevices];
  id v13 = [v12 count];

  if (v13)
  {
    v23 = v7;
    v24 = v5;
    objc_super v14 = +[NSMutableArray array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v15 = [(FMDRequestFMIPUnregister *)self otherDevices];
    id v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v21 = +[NSMutableDictionary dictionary];
          [(FMDRequestFMIPUnregister *)self _dumpInfoForDevice:v20 into:v21 host:0];
          [v14 addObject:v21];
        }
        id v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"otherDevices"];
    v7 = v23;
    v5 = v24;
  }
  if ((v10 & 1) == 0) {
    [v3 fm_safeSetObject:v7 forKey:@"hostDeviceUdid"];
  }

  return v3;
}

- (id)authToken
{
  v2 = [(FMDRequestFMIPUnregister *)self account];
  v3 = [v2 oneTimeRemoveAuthToken];

  return v3;
}

- (BOOL)showAuthFailedMessage
{
  return 0;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (BOOL)canReplace:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_dumpInfoForDevice:(id)a3 into:(id)a4 host:(BOOL)a5
{
  id v23 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  id v9 = [v23 udid];
  [v8 fm_safelyMapKey:@"udid" toObject:v9];

  uint64_t v10 = [v23 productType];
  [v8 fm_safelyMapKey:@"productType" toObject:v10];

  v11 = [v23 buildVersion];
  [v8 fm_safelyMapKey:@"buildVersion" toObject:v11];

  v12 = [v23 productVersion];
  [v8 fm_safelyMapKey:@"productVersion" toObject:v12];

  id v13 = [v23 unregisterToken];
  [v8 fm_safelyMapKey:@"unregisterToken" toObject:v13];

  objc_super v14 = [v23 pairingId];
  [v8 fm_safelyMapKey:@"pairingId" toObject:v14];

  if (!a5)
  {
    v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v23 paired]);
    [v8 fm_safelyMapKey:@"paired" toObject:v15];

    id v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v23 migrationConfirmed]);
    [v8 fm_safelyMapKey:@"migrationConfirmed" toObject:v16];
  }
  id v17 = [v23 disableContext];
  if (v17)
  {
    uint64_t v18 = +[NSNumber numberWithUnsignedInteger:v17];
    [v8 setObject:v18 forKeyedSubscript:@"fmipDisableReason"];
  }
  [v7 setObject:v8 forKeyedSubscript:@"deviceInfo"];
  v19 = [v23 imei];
  [v7 fm_safelyMapKey:@"imei" toObject:v19];

  uint64_t v20 = [v23 imei2];
  [v7 fm_safelyMapKey:@"imei2" toObject:v20];

  v21 = [v23 meid];
  [v7 fm_safelyMapKey:@"meid" toObject:v21];

  v22 = [v23 serialNumber];
  [v7 fm_safelyMapKey:@"serialNumber" toObject:v22];
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (FMDFMIPUnregisterDeviceInfo)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSArray)otherDevices
{
  return self->_otherDevices;
}

- (void)setOtherDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherDevices, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end