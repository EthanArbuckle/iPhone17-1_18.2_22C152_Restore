@interface RCCloudKitService
- (CKContainer)ckContainer;
- (RCCloudKitService)init;
- (id)_metaDataDeviceQueryOperation;
- (void)_fetchDeviceRecordsWithCursor:(id)a3 results:(id)a4 completion:(id)a5;
- (void)fetchDeviceRecords:(id)a3;
@end

@implementation RCCloudKitService

- (RCCloudKitService)init
{
  v7.receiver = self;
  v7.super_class = (Class)RCCloudKitService;
  v2 = [(RCCloudKitService *)&v7 init];
  if (v2)
  {
    v3 = RCSavedRecordingsCloudKitContainerIdentifier();
    uint64_t v4 = +[CKContainer containerWithIdentifier:v3];
    ckContainer = v2->_ckContainer;
    v2->_ckContainer = (CKContainer *)v4;
  }
  return v2;
}

- (void)fetchDeviceRecords:(id)a3
{
}

- (id)_metaDataDeviceQueryOperation
{
  v2 = +[NSPredicate predicateWithValue:1];
  id v3 = [objc_alloc((Class)CKQuery) initWithRecordType:@"metadata_device_type" predicate:v2];
  id v4 = [objc_alloc((Class)CKQueryOperation) initWithQuery:v3];
  id v5 = [objc_alloc((Class)CKRecordZone) initWithZoneName:@"metadata_zone"];
  v6 = [v5 zoneID];
  [v4 setZoneID:v6];

  v9[0] = @"DeviceOSType";
  v9[1] = @"DeviceOSVersionNumber";
  objc_super v7 = +[NSArray arrayWithObjects:v9 count:2];
  [v4 setDesiredKeys:v7];

  return v4;
}

- (void)_fetchDeviceRecordsWithCursor:(id)a3 results:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [objc_alloc((Class)CKQueryOperation) initWithCursor:v8];
  }
  else
  {
    id v11 = [(RCCloudKitService *)self _metaDataDeviceQueryOperation];
  }
  v12 = v11;
  if (!v9) {
    id v9 = (id)objc_opt_new();
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000224C0;
  v25[3] = &unk_100039AA8;
  id v13 = v9;
  id v26 = v13;
  [v12 setRecordMatchedBlock:v25];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_1000224D0;
  v21 = &unk_100039AD0;
  v22 = self;
  id v23 = v13;
  id v24 = v10;
  id v14 = v10;
  id v15 = v13;
  [v12 setQueryCompletionBlock:&v18];
  v16 = [(RCCloudKitService *)self ckContainer];
  v17 = [v16 privateCloudDatabase];
  [v17 addOperation:v12];
}

- (CKContainer)ckContainer
{
  return self->_ckContainer;
}

- (void).cxx_destruct
{
}

@end