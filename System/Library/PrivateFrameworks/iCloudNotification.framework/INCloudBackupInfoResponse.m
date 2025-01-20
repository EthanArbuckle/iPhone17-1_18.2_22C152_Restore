@interface INCloudBackupInfoResponse
- (ICQBackupInfo)backupInfo;
- (INCloudBackupInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (id)_parseBackUpDevice:(id)a3;
- (id)_parseBackUpDeviceGroups:(id)a3;
- (void)_parseResponseDict;
@end

@implementation INCloudBackupInfoResponse

- (INCloudBackupInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)INCloudBackupInfoResponse;
  v4 = [(INCloudBackupInfoResponse *)&v9 initWithHTTPResponse:a3 data:a4 bodyIsPlist:0];
  v5 = v4;
  if (v4)
  {
    v6 = (id *)&v4->AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse];
    if ([*v6 statusCode] == (id)200)
    {
      [(INCloudBackupInfoResponse *)v5 _parseResponseDict];
    }
    else
    {
      v7 = _INLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10002849C(v6, v7);
      }
    }
  }
  return v5;
}

- (void)_parseResponseDict
{
  if (!self->_backupInfo)
  {
    v3 = (ICQBackupInfo *)objc_alloc_init((Class)ICQBackupInfo);
    backupInfo = self->_backupInfo;
    self->_backupInfo = v3;
  }
  uint64_t v5 = OBJC_IVAR___AAResponse__responseDictionary;
  id v8 = [*(id *)&self->AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary] objectForKeyedSubscript:@"numBackedUpDevices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICQBackupInfo *)self->_backupInfo setNoOfBackupDevices:v8];
  }
  v6 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"deviceGroups"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(INCloudBackupInfoResponse *)self _parseBackUpDeviceGroups:v6];
    [(ICQBackupInfo *)self->_backupInfo setDeviceGroups:v7];
  }
}

- (id)_parseBackUpDeviceGroups:(id)a3
{
  id v4 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_10000BE18;
  v11 = &unk_100040FE0;
  v12 = self;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v5 = v13;
  [v4 enumerateObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (id)_parseBackUpDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)ICQBackupDevice);
  uint64_t v5 = [v3 objectForKeyedSubscript:@"deviceName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDeviceName:v5];
  }
  uint64_t v6 = [v3 objectForKeyedSubscript:@"deviceSubTitle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDeviceSubtitle:v6];
  }
  uint64_t v7 = [v3 objectForKeyedSubscript:@"deviceUDID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDeviceUDID:v7];
  }
  uint64_t v8 = [v3 objectForKeyedSubscript:@"storageUsedInBytes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setStorageUsed:v8];
  }
  uint64_t v9 = [v3 objectForKeyedSubscript:@"storageUsedLabel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setStorageUsedLabel:v9];
  }
  v29 = (void *)v7;
  v30 = (void *)v6;
  v31 = (void *)v5;
  uint64_t v10 = [v3 objectForKeyedSubscript:@"backupSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setBackupSize:v10];
  }
  v26 = (void *)v10;
  uint64_t v11 = [v3 objectForKeyedSubscript:@"deviceImageURLs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [objc_alloc((Class)ICQImageURL) initFromDictionary:v11];
    [v4 setImageURL:v12];
  }
  uint64_t v13 = [v3 objectForKeyedSubscript:@"deviceLargeImageURLs"];
  objc_opt_class();
  v32 = (void *)v13;
  if (objc_opt_isKindOfClass())
  {
    id v14 = [objc_alloc((Class)ICQImageURL) initFromDictionary:v13];
    [v4 setLargeImageURL:v14];
  }
  v15 = [v3 objectForKeyedSubscript:@"detailViewController"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDetailViewController:v15];
  }
  v28 = (void *)v8;
  v16 = [v3 objectForKeyedSubscript:@"backupTimestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setBackupTimestamp:v16];
  }
  v17 = [v3 objectForKeyedSubscript:@"deleteURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = [objc_alloc((Class)NSURL) initWithString:v17];
    [v4 setDeleteURL:v18];
  }
  v19 = [v3 objectForKeyedSubscript:@"deleteButtonLabel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDeleteButtonLabel:v19];
  }
  v27 = (void *)v9;
  v20 = [v3 objectForKeyedSubscript:@"backupFailedByInBytes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setBackupFailedByinBytes:v20];
  }
  v25 = (void *)v11;
  v21 = [v3 objectForKeyedSubscript:@"bytesRequiredForBackup"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setBytesRequiredForBackup:v21];
  }
  v22 = [v3 objectForKeyedSubscript:@"isActive"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v4, "setIsActive:", objc_msgSend(v22, "BOOLValue"));
  }
  v23 = [v3 objectForKeyedSubscript:@"isLocalBackup"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v4, "setIsLocalBackup:", objc_msgSend(v23, "BOOLValue"));
  }

  return v4;
}

- (ICQBackupInfo)backupInfo
{
  return self->_backupInfo;
}

- (void).cxx_destruct
{
}

@end