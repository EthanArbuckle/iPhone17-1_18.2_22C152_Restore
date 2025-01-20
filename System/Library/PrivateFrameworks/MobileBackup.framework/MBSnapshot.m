@interface MBSnapshot
+ (id)snapshotFromMBCKSnapshot:(id)a3 withSnapshotID:(unint64_t)a4;
+ (id)snapshotFromMBSSnapshot:(id)a3;
@end

@implementation MBSnapshot

+ (id)snapshotFromMBCKSnapshot:(id)a3 withSnapshotID:(unint64_t)a4
{
  id v4 = a3;
  v30 = [v4 deviceUUID];
  v29 = [v4 snapshotID];
  v28 = [v4 deviceName];
  v27 = [v4 created];
  v5 = [v4 recordRepresentation];
  v26 = [v5 creationDate];

  v24 = [v4 modificationDate];
  v6 = [v4 productVersion];
  uint64_t v7 = [v4 requiredProductVersion];
  v8 = [v4 device];
  uint64_t v9 = [v8 deviceClass];

  v10 = +[MBCKManager sharedInstance];
  v11 = [v10 debugContext];
  unsigned __int8 v12 = [v11 isFlagSet:@"IgnoreCompatibility"];

  v22 = (void *)v9;
  v23 = (void *)v7;
  if (v12)
  {
    char v13 = 1;
  }
  else
  {
    v14 = MBProductVersion();
    char v13 = MBIsRestoreCompatible();
  }
  id v15 = objc_alloc((Class)MBSnapshot);
  v16 = [v4 commitID];
  id v17 = [v4 snapshotFormat];
  v18 = [v4 buildVersion];
  BYTE4(v21) = v13;
  LODWORD(v21) = 3;
  id v19 = objc_msgSend(v15, "initWithSnapshotID:backupUUID:snapshotUUID:commitID:format:deviceName:date:created:modified:state:isCompatible:systemVersion:buildVersion:quotaReserved:type:backupPolicy:accountType:", a4, v30, v29, v16, v17, v28, v27, v26, v24, v21, v6, v18, objc_msgSend(v4, "quotaUsed"), objc_msgSend(v4, "type"), objc_msgSend(v4, "backupPolicy"), objc_msgSend(v4, "accountType"));

  [v19 setRequiredProductVersion:v23];
  objc_msgSend(v19, "setEstimatedRestoreSize:", objc_msgSend(v4, "estimatedRestoreSize"));

  return v19;
}

+ (id)snapshotFromMBSSnapshot:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 snapshotID];
  v5 = [v3 attributes];
  uint64_t v6 = [v5 deviceName];

  if ([v3 committed])
  {
    uint64_t v7 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v3 committed]);
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([v3 committed])
  {
    uint64_t v8 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v3 committed]);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v3 hasLastModified])
  {
    uint64_t v9 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v3 lastModified]);
    if (v7)
    {
LABEL_9:
      int v10 = 3;
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_9;
    }
  }
  if ([v3 quotaReserved]) {
    int v10 = 2;
  }
  else {
    int v10 = 1;
  }
LABEL_14:
  v11 = [v3 attributes];
  unsigned int v12 = [v11 backupType];

  if (v12 >= 3) {
    __assert_rtn("+[MBSnapshot(MBServiceManagerExtensions) snapshotFromMBSSnapshot:]", "MBServiceManager.m", 157, "0");
  }
  v31 = (void *)v7;
  v32 = (void *)v8;
  v33 = (void *)v6;
  char v13 = +[MBDebugContext defaultDebugContext];
  unsigned __int8 v14 = [v13 isFlagSet:@"IgnoreCompatibility"];

  v30 = (void *)v9;
  int v29 = v10;
  if (v14)
  {
    BOOL v15 = 1;
  }
  else
  {
    v16 = MBProductVersion();
    id v17 = [v3 attributes];
    v18 = [v17 productVersion];
    BOOL v15 = MBCompareVersionStrings() >= 0;
  }
  uint64_t v19 = v12;
  uint64_t v20 = v4;
  id v21 = objc_alloc((Class)MBSnapshot);
  v22 = [v3 attributes];
  v23 = [v22 productVersion];
  v24 = [v3 attributes];
  v25 = [v24 buildVersion];
  BYTE4(v28) = v15;
  LODWORD(v28) = v29;
  id v26 = [v21 initWithSnapshotID:v20 backupUUID:0 snapshotUUID:0 commitID:0 format:0 deviceName:v33 date:v31 created:v32 modified:v30 state:v28 isCompatible:v23 systemVersion:v25 buildVersion:objc_msgSend(v3 quotaReserved:"quotaReserved") type:v19 backupPolicy:0 accountType:1];

  return v26;
}

@end