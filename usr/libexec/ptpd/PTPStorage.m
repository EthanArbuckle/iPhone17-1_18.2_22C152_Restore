@interface PTPStorage
- (BOOL)enumerated;
- (ICOrderedMediaSet)indexedMediaSet;
- (NSArray)supportedFormats;
- (NSMutableArray)assetGroups;
- (NSMutableDictionary)duplicateAssetIdentifiers;
- (PTPFolder)dcimFolder;
- (PTPStorage)initWithParent:(id)a3 andOptionalID:(unsigned int)a4 forSessionID:(unsigned int)a5;
- (PTPStorageInfoDataset)storageInfoDataset;
- (id)addAssets:(id)a3 createdObjects:(id)a4;
- (id)cameraFileWithObjectID:(unint64_t)a3;
- (id)cameraFolderWithObjectID:(unint64_t)a3;
- (id)deleteAssets:(id)a3;
- (id)dequeueGroup;
- (id)getDedupedAssetDirectory:(id)a3 increment:(BOOL)a4;
- (id)objectHandlesForObjectFormatCode:(unsigned __int16)a3 inAssociation:(unsigned int)a4;
- (id)parent;
- (id)virtualDirectoryName:(id)a3;
- (timespec)virtualDirectoryDate:(id)a3;
- (unint64_t)appendObjectData:(id)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(unsigned int)a6;
- (unsigned)addGroup:(id)a3;
- (unsigned)assetGroupIndex;
- (unsigned)objectHandle;
- (unsigned)sessionID;
- (unsigned)storageID;
- (void)addCameraFileToIndex:(id)a3;
- (void)addCameraFolderToIndex:(id)a3;
- (void)addContent;
- (void)customUpdateToStoreInfoDataset;
- (void)dealloc;
- (void)removeCameraFileFromIndex:(unint64_t)a3;
- (void)removeCameraFolderFromIndex:(unint64_t)a3;
- (void)setAssetGroupIndex:(unsigned int)a3;
- (void)setAssetGroups:(id)a3;
- (void)setDcimFolder:(id)a3;
- (void)setDuplicateAssetIdentifiers:(id)a3;
- (void)setEnumerated:(BOOL)a3;
- (void)setIndexedMediaSet:(id)a3;
- (void)setObjectHandle:(unsigned int)a3;
- (void)setParent:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setStorageID:(unsigned int)a3;
- (void)setStorageInfoDataset:(id)a3;
- (void)setSupportedFormats:(id)a3;
@end

@implementation PTPStorage

- (id)getDedupedAssetDirectory:(id)a3 increment:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    v17 = 0;
    goto LABEL_24;
  }
  duplicateAssetIdentifiers = self->_duplicateAssetIdentifiers;
  if (!duplicateAssetIdentifiers)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = self->_duplicateAssetIdentifiers;
    self->_duplicateAssetIdentifiers = v8;

    v10 = +[NSCalendar currentCalendar];
    v11 = +[NSDate date];
    v12 = [v10 components:28 fromDate:v11];

    if (v12)
    {
      self->_currentYear = [v12 year];
      self->_currentMonth = [v12 month];
    }

    duplicateAssetIdentifiers = self->_duplicateAssetIdentifiers;
  }
  v13 = [(NSMutableDictionary *)duplicateAssetIdentifiers objectForKeyedSubscript:v6];
  v14 = v13;
  if (v4)
  {
    if (!v13)
    {
      v14 = &off_100050788;
      [(NSMutableDictionary *)self->_duplicateAssetIdentifiers setObject:&off_100050788 forKeyedSubscript:v6];
LABEL_13:
      int v18 = [v14 intValue];
      if (v18 > 702) {
        signed int v19 = 1;
      }
      else {
        signed int v19 = v18;
      }
      if (v19 < 1)
      {
        v16 = &stru_100048E60;
      }
      else
      {
        v20 = &stru_100048E60;
        do
        {
          unsigned int v21 = v19 - 1;
          signed int v19 = (v19 - 1) / 0x1Au;
          v16 = +[NSString stringWithFormat:@"%@%c", v20, v21 % 0x1A + 97];

          v20 = v16;
        }
        while ((int)(v21 - v21 % 0x1A) > 25);
      }
      if ([(__CFString *)v16 length] == (id)1)
      {
        uint64_t v22 = +[NSString stringWithFormat:@"_%@", v16];

        v16 = (__CFString *)v22;
      }
      goto LABEL_23;
    }
    uint64_t v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 intValue] + 1);

    v14 = (_UNKNOWN **)v15;
  }
  [(NSMutableDictionary *)self->_duplicateAssetIdentifiers setObject:v14 forKeyedSubscript:v6];
  if (v14) {
    goto LABEL_13;
  }
  v16 = @"__";
LABEL_23:
  v17 = [v6 stringByReplacingCharactersInRange:6 withString:v16];

LABEL_24:

  return v17;
}

- (id)virtualDirectoryName:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  BOOL v4 = (const char *)[a3 UTF8String];
  if (!v4
    || (v5 = v4, strlen(v4) < 0xF)
    || (sscanf(v5, "%04d%02d%02dT%02d%02d%02d", (char *)&v12 + 4, &v12, (char *)&v11 + 4, &v11, (char *)&v10 + 4, &v10),
        uint64_t currentYear = HIDWORD(v12),
        !HIDWORD(v12))
    || (uint64_t currentMonth = v12, !v12))
  {
    uint64_t currentMonth = self->_currentMonth;
    uint64_t currentYear = self->_currentYear;
    LODWORD(v12) = self->_currentMonth;
    HIDWORD(v12) = currentYear;
  }
  v8 = +[NSString stringWithFormat:@"%04d%02d__", currentYear, currentMonth];

  return v8;
}

- (timespec)virtualDirectoryDate:(id)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  int v15 = 0;
  int v14 = 0;
  BOOL v4 = (const char *)[a3 UTF8String];
  if (!v4
    || (v5 = v4, strlen(v4) < 0xF)
    || (sscanf(v5, "%04d%02d%02dT%02d%02d%02d", (char *)&v17 + 4, &v17, (char *)&v16 + 4, &v16, &v15, &v14),
        !HIDWORD(v17))
    || !v17)
  {
    int currentYear = self->_currentYear;
    LODWORD(v17) = self->_currentMonth;
    HIDWORD(v17) = currentYear;
  }
  v7 = +[NSCalendar currentCalendar];
  id v8 = objc_alloc_init((Class)NSDateComponents);
  [v8 setYear:SHIDWORD(v17)];
  [v8 setMonth:(int)v17];
  v9 = [v7 dateFromComponents:v8];
  [v9 timeIntervalSince1970];
  uint64_t v11 = (uint64_t)v10;

  __darwin_time_t v12 = v11;
  uint64_t v13 = 0;
  result.tv_nsec = v13;
  result.tv_sec = v12;
  return result;
}

- (PTPStorage)initWithParent:(id)a3 andOptionalID:(unsigned int)a4 forSessionID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v9 = v6;
  if (!v6) {
    uint64_t v9 = sub_100002694();
  }
  v37.receiver = self;
  v37.super_class = (Class)PTPStorage;
  double v10 = [(PTPStorage *)&v37 init];
  uint64_t v11 = v10;
  if (v10)
  {
    memset(&v38, 0, 512);
    [(PTPStorage *)v10 setParent:v8];
    __darwin_time_t v12 = [v8 hostMediaSupportedFormats];
    [(PTPStorage *)v11 setSupportedFormats:v12];

    uint64_t v13 = [v8 path];
    id v14 = [v13 stringByAppendingPathComponent:@"DCIM"];
    statfs((const char *)[v14 fileSystemRepresentation], &v38);

    uint64_t v15 = v38.f_blocks * v38.f_bsize;
    uint64_t v16 = v38.f_bavail * v38.f_bsize;
    uint64_t v17 = [[ICOrderedMediaSet alloc] initWithTypes:&off_1000537D0];
    indexedMediaSet = v11->_indexedMediaSet;
    v11->_indexedMediaSet = v17;

    v11->_storageID = v9;
    signed int v19 = objc_alloc_init(PTPStorageInfoDataset);
    storageInfoDataset = v11->_storageInfoDataset;
    v11->_storageInfoDataset = v19;

    v11->_objectHandle = v9;
    unsigned int v21 = sub_10000B5F8();
    -[PTPStorageInfoDataset setAccessCapability:](v11->_storageInfoDataset, "setAccessCapability:", [v21 cplStorageState] != 0);
    [(PTPStorageInfoDataset *)v11->_storageInfoDataset setStorageType:3];
    [(PTPStorageInfoDataset *)v11->_storageInfoDataset setFilesystemType:3];
    [(PTPStorageInfoDataset *)v11->_storageInfoDataset setMaxCapacity:v15];
    [(PTPStorageInfoDataset *)v11->_storageInfoDataset setFreeSpaceInBytes:v16];
    [(PTPStorageInfoDataset *)v11->_storageInfoDataset setFreeSpaceInImages:v16 / 0x258];
    [(PTPStorageInfoDataset *)v11->_storageInfoDataset setStorageDescription:@"Internal Storage"];
    [(PTPStorageInfoDataset *)v11->_storageInfoDataset setVolumeLabel:@"Internal Storage"];
    v11->_sessionID = v5;
    uint64_t v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    assetGroups = v11->_assetGroups;
    v11->_assetGroups = v22;

    if (!v6)
    {
      v24 = +[NSDate date];
      v36[1] = 0;
      [v24 timeIntervalSince1970];
      v36[0] = (uint64_t)v25;
      v26 = [[PTPFolder alloc] initWithName:@"DCIM" captureTimeSpec:v36 parent:v11 storage:v11];
      dcimFolder = v11->_dcimFolder;
      v11->_dcimFolder = v26;

      [(PTPStorage *)v11 addCameraFolderToIndex:v11->_dcimFolder];
    }
    [(PTPStorage *)v11 setEnumerated:0];
    [(PTPStorage *)v11 customUpdateToStoreInfoDataset];
  }
  __ICOSLogCreate();
  v28 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v29 = [&stru_100048E60 substringWithRange:0, 18];
    v28 = [v29 stringByAppendingString:@".."];
  }
  v30 = +[NSString stringWithFormat:@"Created Storage - PTPStorageID: 0x%x SessionID:0x%x", v9, v5, v36[0]];
  v31 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v28;
    v33 = v31;
    id v34 = [(__CFString *)v32 UTF8String];
    v38.f_bsize = 136446466;
    *(void *)&v38.f_iosize = v34;
    WORD2(v38.f_blocks) = 2114;
    *(uint64_t *)((char *)&v38.f_blocks + 6) = (uint64_t)v30;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v38, 0x16u);
  }
  return v11;
}

- (void)customUpdateToStoreInfoDataset
{
  v3 = (void *)MGCopyAnswer();
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKey:kMGQDiskUsageAmountDataAvailable];
    unint64_t v6 = (unint64_t)[v5 longLongValue];

    __ICOSLogCreate();
    v7 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      id v8 = [[&stru_100048E60 substringWithRange:0, 18];
      v7 = [v8 stringByAppendingString:@".."];
    }
    uint64_t v9 = +[NSString stringWithFormat:@"Available Storage: %.2f GB", (double)v6 * 9.31322575e-10];
    double v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v7;
      __darwin_time_t v12 = v10;
      *(_DWORD *)buf = 136446466;
      id v23 = [(__CFString *)v11 UTF8String];
      __int16 v24 = 2114;
      double v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(PTPStorageInfoDataset *)self->_storageInfoDataset setFreeSpaceInBytes:v6];
    [(PTPStorageInfoDataset *)self->_storageInfoDataset setFreeSpaceInImages:v6 / 0x16E360];
    uint64_t v13 = [v4 objectForKey:kMGQDiskUsageTotalDiskCapacity];
    id v14 = [v13 longLongValue];

    __ICOSLogCreate();
    uint64_t v15 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      uint64_t v16 = [&stru_100048E60 substringWithRange:0, 18];
      uint64_t v15 = [v16 stringByAppendingString:@".."];
    }
    uint64_t v17 = +[NSString stringWithFormat:@"Storage  Capacity: %.2f GB", (double)(unint64_t)v14 * 9.31322575e-10];
    int v18 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      signed int v19 = v15;
      v20 = v18;
      id v21 = [(__CFString *)v19 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v23 = v21;
      __int16 v24 = 2114;
      double v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(PTPStorageInfoDataset *)self->_storageInfoDataset setMaxCapacity:v14];
  }
}

- (PTPFolder)dcimFolder
{
  return self->_dcimFolder;
}

- (void)addContent
{
  v3 = [(PTPStorage *)self dcimFolder];
  if (v3)
  {
    BOOL v4 = sub_10000B5F8();
    uint64_t v5 = [(PTPStorage *)self storageID];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    char v19 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    __ICOSLogCreate();
    if ((unint64_t)[&stru_100048E60 length] < 0x15)
    {
      v7 = &stru_100048E60;
    }
    else
    {
      unint64_t v6 = [&stru_100048E60 substringWithRange:0, 18];
      v7 = [v6 stringByAppendingString:@".."];
    }
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[PTPFolder addContent] PTPStorageID: 0x%x \n", v5);
    uint64_t v9 = (id)_gICOSLog;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(__CFString *)v7 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000488C0);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    dword_10005E46C = 0;
    *(float *)&dword_10005E46C = (float)mach_absolute_time();
    if (v4)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v21 = sub_1000176E4;
      uint64_t v22 = sub_1000176F4;
      id v23 = self;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000176FC;
      v13[3] = &unk_100048910;
      v13[4] = v23;
      v13[5] = buf;
      v13[6] = v18;
      v13[7] = v17;
      v13[8] = v16;
      v13[9] = v15;
      [v4 ptpEnumerateAllAssetsUsingBlock:v13];
      _Block_object_dispose(buf, 8);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017900;
    block[3] = &unk_100048938;
    block[6] = v17;
    block[7] = v16;
    block[8] = v15;
    block[9] = info;
    int v12 = v5;
    block[4] = self;
    block[5] = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
  }
}

- (id)addAssets:(id)a3 createdObjects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PTPStorage *)self dcimFolder];
  uint64_t v9 = +[NSMutableArray array];
  id v10 = +[NSMutableDictionary dictionary];
  uint64_t v37 = 0;
  statfs v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  if (v7)
  {
    uint64_t v11 = +[NSMutableArray array];
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (!v8) {
      goto LABEL_8;
    }
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_1000176E4;
  v27[4] = sub_1000176F4;
  id v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100018368;
  void v18[3] = &unk_100048960;
  v18[4] = self;
  uint64_t v22 = v27;
  id v19 = v8;
  BOOL v26 = v7 != 0;
  id v12 = v11;
  id v20 = v12;
  id v23 = &v29;
  __int16 v24 = &v37;
  id v13 = v9;
  id v21 = v13;
  double v25 = &v33;
  [v6 enumerateObjectsUsingBlock:v18];
  [(PTPStorage *)self addGroup:v13];
  if (v7)
  {
    [v7 setObject:v13 forKey:@"addedFiles"];
    [v7 setObject:v12 forKey:@"addedFolders"];
  }
  id v14 = +[NSNumber numberWithUnsignedLongLong:v38[3]];
  [v10 setObject:v14 forKey:@"prunedCount"];

  uint64_t v15 = +[NSNumber numberWithUnsignedLongLong:v34[3]];
  [v10 setObject:v15 forKey:@"assetCount"];

  uint64_t v16 = +[NSNumber numberWithUnsignedLongLong:v30[3]];
  [v10 setObject:v16 forKey:@"folderCount"];

  _Block_object_dispose(v27, 8);
LABEL_8:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v10;
}

- (id)deleteAssets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PTPStorage *)self dcimFolder];
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000189AC;
    v10[3] = &unk_100048988;
    id v11 = v5;
    id v12 = v7;
    [v4 enumerateObjectsUsingBlock:v10];
  }
  if (v7) {
    [v6 setObject:v7 forKey:@"removedFiles"];
  }
  if (v8) {
    [v6 setObject:v8 forKey:@"removedFolders"];
  }

  return v6;
}

- (void)dealloc
{
  objc_storeWeak(&self->_parent, 0);
  storageInfoDataset = self->_storageInfoDataset;
  self->_storageInfoDataset = 0;

  duplicateAssetIdentifiers = self->_duplicateAssetIdentifiers;
  self->_duplicateAssetIdentifiers = 0;

  supportedFormats = self->_supportedFormats;
  self->_supportedFormats = 0;

  assetGroups = self->_assetGroups;
  self->_assetGroups = 0;

  self->_assetGroupIndex = 0;
  v7.receiver = self;
  v7.super_class = (Class)PTPStorage;
  [(PTPStorage *)&v7 dealloc];
}

- (void)addCameraFileToIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(PTPStorage *)self indexedMediaSet];
  [v5 addMediaItemToIndex:v4];
}

- (void)addCameraFolderToIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(PTPStorage *)self indexedMediaSet];
  [v5 addMediaItemToIndex:v4];

  id v6 = [v4 objectHandle];
  objc_super v7 = +[NSNumber numberWithUnsignedInt:v6];
  uint64_t v9 = v7;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [(PTPStorage *)self addGroup:v8];
}

- (id)cameraFileWithObjectID:(unint64_t)a3
{
  id v4 = [(PTPStorage *)self indexedMediaSet];
  id v5 = [v4 mediaItemWithHandle:a3 inTypes:&off_1000537E8];

  return v5;
}

- (id)cameraFolderWithObjectID:(unint64_t)a3
{
  id v4 = [(PTPStorage *)self indexedMediaSet];
  id v5 = [v4 mediaItemWithHandle:a3 inTypes:&off_100053800];

  return v5;
}

- (void)removeCameraFileFromIndex:(unint64_t)a3
{
  id v4 = [(PTPStorage *)self indexedMediaSet];
  [v4 removeMediaItemWithHandleFromIndex:a3];
}

- (void)removeCameraFolderFromIndex:(unint64_t)a3
{
  id v4 = [(PTPStorage *)self indexedMediaSet];
  [v4 removeMediaItemWithHandleFromIndex:a3];
}

- (id)objectHandlesForObjectFormatCode:(unsigned __int16)a3 inAssociation:(unsigned int)a4
{
  return [(PTPFolder *)self->_dcimFolder objectHandlesForObjectFormatCode:a3 inAssociation:*(void *)&a4];
}

- (unint64_t)appendObjectData:(id)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  id v10 = a3;
  unint64_t v11 = 0;
  uint64_t v15 = 0;
  if (v8)
  {
LABEL_5:
    if (v7 == -1) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((v7 + 1) < 2 || [(PTPFolder *)self->_dcimFolder objectHandle] == v7)
  {
    id v12 = [(PTPFolder *)self->_dcimFolder objectInfoDataset];
    id v13 = [v12 content:v6];

    [v10 appendData:v13];
    unint64_t v11 = 1;
    uint64_t v15 = 1;

    goto LABEL_5;
  }
  unint64_t v11 = 0;
LABEL_6:
  v11 += [(PTPFolder *)self->_dcimFolder appendObjectData:v10 forObjectFormatCode:v8 inAssociation:v7 withContentType:v6];
  uint64_t v15 = v11;
LABEL_7:
  if (v6 == 3)
  {
    [v10 replaceBytesInRange:0 withBytes:&v15];
    unint64_t v11 = v15;
  }

  return v11;
}

- (unsigned)addGroup:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_assetGroups, "addObject:");
  }
  return [(NSMutableArray *)self->_assetGroups count];
}

- (id)dequeueGroup
{
  v3 = +[NSMutableArray array];
  id v4 = [(NSMutableArray *)self->_assetGroups count];
  unint64_t assetGroupIndex = self->_assetGroupIndex;
  if ((unint64_t)v4 > assetGroupIndex)
  {
    unint64_t v6 = (unint64_t)v4;
    do
    {
      uint64_t v7 = [(NSMutableArray *)self->_assetGroups objectAtIndex:assetGroupIndex];
      if (v7) {
        [v3 addObjectsFromArray:v7];
      }
      id v8 = [v3 count];

      unint64_t assetGroupIndex = self->_assetGroupIndex;
      if ((unint64_t)v8 >= 0x2711) {
        break;
      }
      unint64_t assetGroupIndex = (assetGroupIndex + 1);
      self->_unint64_t assetGroupIndex = assetGroupIndex;
    }
    while (v6 > assetGroupIndex);
  }
  if ((unint64_t)[(NSMutableArray *)self->_assetGroups count] > assetGroupIndex
    || ![(PTPStorage *)self enumerated])
  {
    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018FE8;
    block[3] = &unk_100048750;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }

  return v3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (NSMutableDictionary)duplicateAssetIdentifiers
{
  return self->_duplicateAssetIdentifiers;
}

- (void)setDuplicateAssetIdentifiers:(id)a3
{
}

- (PTPStorageInfoDataset)storageInfoDataset
{
  return self->_storageInfoDataset;
}

- (void)setStorageInfoDataset:(id)a3
{
}

- (void)setDcimFolder:(id)a3
{
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (ICOrderedMediaSet)indexedMediaSet
{
  return self->_indexedMediaSet;
}

- (void)setIndexedMediaSet:(id)a3
{
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained(&self->_parent);

  return WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)assetGroups
{
  return self->_assetGroups;
}

- (void)setAssetGroups:(id)a3
{
}

- (unsigned)assetGroupIndex
{
  return self->_assetGroupIndex;
}

- (void)setAssetGroupIndex:(unsigned int)a3
{
  self->_unint64_t assetGroupIndex = a3;
}

- (BOOL)enumerated
{
  return self->_enumerated;
}

- (void)setEnumerated:(BOOL)a3
{
  self->_enumerated = a3;
}

- (NSArray)supportedFormats
{
  return self->_supportedFormats;
}

- (void)setSupportedFormats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFormats, 0);
  objc_storeStrong((id *)&self->_assetGroups, 0);
  objc_destroyWeak(&self->_parent);
  objc_storeStrong((id *)&self->_indexedMediaSet, 0);
  objc_storeStrong((id *)&self->_dcimFolder, 0);
  objc_storeStrong((id *)&self->_storageInfoDataset, 0);

  objc_storeStrong((id *)&self->_duplicateAssetIdentifiers, 0);
}

@end