@interface MBBackup
+ (id)backupByMergingMBSBackup:(id)a3 device:(id)a4 snapshots:(id)a5 filterSnapshots:(BOOL)a6;
+ (id)backupFromMBSBackup:(id)a3 filterSnapshots:(BOOL)a4;
@end

@implementation MBBackup

+ (id)backupByMergingMBSBackup:(id)a3 device:(id)a4 snapshots:(id)a5 filterSnapshots:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10) {
    __assert_rtn("+[MBBackup(MBServiceManagerExtensions) backupByMergingMBSBackup:device:snapshots:filterSnapshots:]", "MBCKManager.m", 154, "device");
  }
  v12 = v11;
  if (!v11) {
    __assert_rtn("+[MBBackup(MBServiceManagerExtensions) backupByMergingMBSBackup:device:snapshots:filterSnapshots:]", "MBCKManager.m", 155, "snapshots");
  }
  uint64_t v13 = [v10 deviceUUID];
  if (!v13) {
    __assert_rtn("+[MBBackup(MBServiceManagerExtensions) backupByMergingMBSBackup:device:snapshots:filterSnapshots:]", "MBCKManager.m", 157, "deviceUUID");
  }
  v14 = (void *)v13;
  v15 = [v9 snapshots];
  id v16 = [v15 mutableCopy];

  [v16 sortUsingComparator:&stru_100411FB8];
  if (!v16) {
    id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
  }
  v45 = v10;
  v46 = v9;
  if ([v16 count])
  {
    v17 = [v16 lastObject];
    v18 = (char *)[v17 snapshotID];
  }
  else
  {
    v18 = 0;
  }
  v44 = v12;
  +[MBCKSnapshot sortedSnapshots:v12];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v19 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v49;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v49 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v24 = [v23 device];
        v25 = [v24 deviceUUID];
        if (([v14 isEqualToString:v25] & 1) == 0) {
          __assert_rtn("+[MBBackup(MBServiceManagerExtensions) backupByMergingMBSBackup:device:snapshots:filterSnapshots:]", "MBCKManager.m", 169, "[deviceUUID isEqualToString:ckSnapshot.device.deviceUUID]");
        }

        v26 = +[MBSnapshot snapshotFromMBCKSnapshot:v23 withSnapshotID:(char *)i + (void)v18 + 1];
        v27 = v26;
        if (!v6 || [v26 isCompatible]) {
          [v16 addObject:v27];
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      v18 = (char *)i + (void)v18;
    }
    while (v20);
  }

  id v28 = v14;
  v29 = MBDeviceUUID();
  unsigned int v30 = [v28 isEqualToString:v29];

  uint64_t v31 = (uint64_t)v28;
  if (v30)
  {
    uint64_t v31 = MBDeviceUDID_Legacy();
  }
  v43 = objc_msgSend(v28, "mb_backupIDByAddingCKPrefix");
  id v42 = objc_alloc((Class)MBBackup);
  v32 = [v45 deviceClass];
  [v45 productType];
  v34 = v33 = (void *)v31;
  v35 = [v45 hardwareModel];
  v36 = [v45 marketingName];
  unsigned __int8 v37 = [v45 canRestoreSystemFiles];
  unsigned __int8 v38 = [v45 backupEnabled];
  BYTE3(v41) = [v45 hasBackupEnabledState];
  BYTE2(v41) = v38;
  LOWORD(v41) = v37;
  id v39 = objc_msgSend(v42, "initWithBackupUDID:backupUUID:deviceClass:productType:hardwareModel:marketingName:snapshots:restoreSystemFiles:isMBSBackup:isBackupEnabled:hasBackupEnabledState:", v33, v43, v32, v34, v35, v36, v16, v41);

  return v39;
}

+ (id)backupFromMBSBackup:(id)a3 filterSnapshots:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 snapshotsCount]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v7 = [v5 snapshots];
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ((!v4 || [*(id *)(*((void *)&v31 + 1) + 8 * i) committed])
          && [v12 hasAttributes])
        {
          uint64_t v13 = +[MBSnapshot snapshotFromMBSSnapshot:v12];
          v14 = v13;
          if (!v4 || [v13 isCompatible]) {
            [v6 addObject:v14];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v9);
  }

  [v6 sortUsingComparator:&stru_100414F80];
  id v26 = objc_alloc((Class)MBBackup);
  unsigned int v30 = [v5 backupUDID];
  v15 = MBStringWithData();
  v29 = [v5 backupUDID];
  id v16 = MBStringWithData();
  id v28 = [v5 attributes];
  v17 = [v28 deviceClass];
  v25 = [v5 attributes];
  v18 = [v25 productType];
  id v19 = [v5 attributes];
  id v20 = [v19 hardwareModel];
  uint64_t v21 = [v5 attributes];
  v22 = [v21 marketingName];
  BYTE3(v24) = 0;
  *(_WORD *)((char *)&v24 + 1) = 1;
  LOBYTE(v24) = [v5 canRestoreSystemFiles];
  id v27 = objc_msgSend(v26, "initWithBackupUDID:backupUUID:deviceClass:productType:hardwareModel:marketingName:snapshots:restoreSystemFiles:isMBSBackup:isBackupEnabled:hasBackupEnabledState:", v15, v16, v17, v18, v20, v22, v6, v24);

  return v27;
}

@end