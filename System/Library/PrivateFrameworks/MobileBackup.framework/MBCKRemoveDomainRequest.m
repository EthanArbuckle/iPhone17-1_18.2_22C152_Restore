@interface MBCKRemoveDomainRequest
+ (BOOL)_removeDomain:(id)a3 cache:(id)a4 tracker:(id)a5 account:(id)a6 error:(id *)a7;
+ (BOOL)removeDomain:(id)a3 cache:(id)a4 databaseManager:(id)a5 account:(id)a6 connection:(id)a7 error:(id *)a8;
+ (id)removeDomainRequestForDevice:(id)a3;
- (BOOL)addDomainHmacToRemove:(id)a3;
- (MBCKDevice)device;
- (MBCKRemoveDomainRequest)initWithDevice:(id)a3;
- (id)_getRecordIDString;
- (id)recordRepresentation;
- (id)recordType;
- (unint64_t)recordZone;
- (void)setDevice:(id)a3;
@end

@implementation MBCKRemoveDomainRequest

+ (id)removeDomainRequestForDevice:(id)a3
{
  id v3 = a3;
  v4 = [[MBCKRemoveDomainRequest alloc] initWithDevice:v3];

  return v4;
}

- (MBCKRemoveDomainRequest)initWithDevice:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MBCKRemoveDomainRequest;
  v5 = [(MBCKModel *)&v12 initWithRecord:0 cache:0];
  v6 = v5;
  if (v5)
  {
    [(MBCKRemoveDomainRequest *)v5 setDevice:v4];
    uint64_t v7 = MBRandomUUID();
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    domainHMACsToRemove = v6->_domainHMACsToRemove;
    v6->_domainHMACsToRemove = v9;
  }
  return v6;
}

- (BOOL)addDomainHmacToRemove:(id)a3
{
  return 1;
}

- (id)recordRepresentation
{
  v10.receiver = self;
  v10.super_class = (Class)MBCKRemoveDomainRequest;
  id v3 = [(MBCKModel *)&v10 recordRepresentation];
  id v4 = [v3 objectForKeyedSubscript:@"device"];

  if (!v4)
  {
    id v5 = objc_alloc((Class)CKReference);
    v6 = [(MBCKRemoveDomainRequest *)self device];
    uint64_t v7 = [v6 recordID];
    id v8 = [v5 initWithRecordID:v7 action:0];
    [v3 setObject:v8 forKeyedSubscript:@"device"];
  }
  [v3 setObject:self->_domainHMACsToRemove forKeyedSubscript:@"domainHMACsToRemove"];
  return v3;
}

- (id)_getRecordIDString
{
  return self->_uuid;
}

- (id)recordType
{
  return @"RemoveDomainRequest";
}

- (unint64_t)recordZone
{
  return 2;
}

+ (BOOL)_removeDomain:(id)a3 cache:(id)a4 tracker:(id)a5 account:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = +[MBCKAccount fetchAccountWithOperationTracker:v13 cache:v12 error:0];
  v16 = v15;
  if (!v15)
  {
    v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No account to call RemoveDomain on", (uint8_t *)&buf, 2u);
      _MBLog();
    }
    BOOL v21 = 1;
    goto LABEL_16;
  }
  if ([v15 fetchDevicesWithOperationTracker:v13 error:a7])
  {
    v17 = MBDeviceUUID();
    v18 = [v16 deviceForUUID:v17];
    if (v18)
    {
      v29 = +[MBCKRemoveDomainRequest removeDomainRequestForDevice:v18];
      unsigned int v19 = [v11 isEqualToString:@"AppDomain-com.apple.iBooks"];
      v20 = [v18 hmacKey];
      if (v19) {
        +[MBCKManifest domainHmac:@"BooksDomain" key:v20];
      }
      else {
      v24 = +[MBCKManifest domainHmac:v11 key:v20];
      }
      [v29 addDomainHmacToRemove:v24];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v34 = 0x3032000000;
      v35 = sub_100140C8C;
      v36 = sub_100140C9C;
      id v37 = 0;
      dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
      v26 = [v29 recordRepresentation];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100140CA4;
      v30[3] = &unk_100412780;
      p_long long buf = &buf;
      v27 = v25;
      v31 = v27;
      [v13 saveRecord:v26 delegate:0 completion:v30];

      BOOL v21 = *(void *)(*((void *)&buf + 1) + 40) != 0;
      _Block_object_dispose(&buf, 8);

      v23 = v29;
    }
    else
    {
      v22 = MBGetDefaultLog();
      v23 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No device %@ to call RemoveDomain on", (uint8_t *)&buf, 0xCu);
        _MBLog();
        BOOL v21 = 1;
        v23 = v22;
      }
      else
      {
        BOOL v21 = 1;
      }
    }

LABEL_16:
    goto LABEL_17;
  }
  BOOL v21 = 0;
LABEL_17:

  return v21;
}

+ (BOOL)removeDomain:(id)a3 cache:(id)a4 databaseManager:(id)a5 account:(id)a6 connection:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a5;
  v18 = +[MBCKOperationPolicy expensiveCellularPolicy];
  unsigned int v19 = +[MBCKOperationTracker operationTrackerWithAccount:v15 databaseManager:v17 policy:v18 error:a8];

  if (v19)
  {
    v20 = [v16 processName];
    BOOL v21 = [v18 operationGroupWithName:@"removeDomain" processName:v20];
    [v19 setCkOperationGroup:v21];

    v22 = +[MBAppManager appManager];
    v23 = [v15 persona];
    [v22 setEnabled:0 forDomainName:v13 persona:v23];

    unsigned __int8 v24 = [(id)objc_opt_class() _removeDomain:v13 cache:v14 tracker:v19 account:v15 error:a8];
  }
  else
  {
    unsigned __int8 v24 = 0;
  }

  return v24;
}

- (MBCKDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  return (MBCKDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_domainHMACsToRemove, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end