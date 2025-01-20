@interface PTPCameraStorage
- (BOOL)catalogingDone;
- (BOOL)locked;
- (ICOrderedMediaSet)indexedMediaSet;
- (NSArray)objectInfoArray;
- (PTPCameraStorage)initWithStorageID:(unsigned int)a3 initiator:(id)a4;
- (id)cameraFileWithObjectID:(unint64_t)a3;
- (id)cameraFolderWithObjectID:(unint64_t)a3;
- (id)cameraItemWithObjectID:(unint64_t)a3;
- (id)indexedFiles;
- (id)indexedFolders;
- (id)prime;
- (unint64_t)enumerateContent:(id)a3 withOrder:(int64_t)a4;
- (unint64_t)ptpObjectCount;
- (void)addCameraFileToIndex:(id)a3;
- (void)addCameraFolderToIndex:(id)a3;
- (void)dealloc;
- (void)refreshInfo;
- (void)removeCameraFileFromIndex:(unint64_t)a3;
- (void)removeCameraFolderFromIndex:(unint64_t)a3;
- (void)setCatalogingDone:(BOOL)a3;
- (void)setIndexedMediaSet:(id)a3;
- (void)setObjectInfoArray:(id)a3;
@end

@implementation PTPCameraStorage

- (PTPCameraStorage)initWithStorageID:(unsigned int)a3 initiator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PTPCameraStorage;
  v4 = [(PTPCameraFolder *)&v9 initWithStorageID:*(void *)&a3 objHandle:0xFFFFFFFFLL parent:0 initiator:a4];
  v5 = v4;
  if (v4)
  {
    [(PTPCameraItem *)v4 setType:4];
    v6 = [[ICOrderedMediaSet alloc] initWithTypes:&off_100059A20];
    indexedMediaSet = v5->_indexedMediaSet;
    v5->_indexedMediaSet = v6;
  }
  return v5;
}

- (void)dealloc
{
  __ICOSLogCreate();
  v3 = @"PTPStorage";
  if ((unint64_t)[@"PTPStorage" length] >= 0x15)
  {
    v4 = [@"PTPStorage" substringWithRange:0, 18];
    v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = +[NSString stringWithFormat:@"%p | %16s - 0x%08X", self, "dealloc storeID", [(PTPCameraItem *)self storageID]];
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3;
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v11 = [(__CFString *)v7 UTF8String];
    __int16 v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [(PTPCameraStorage *)self setObjectInfoArray:0];
  v9.receiver = self;
  v9.super_class = (Class)PTPCameraStorage;
  [(PTPCameraFolder *)&v9 dealloc];
}

- (BOOL)locked
{
  v2 = [(PTPCameraItem *)self info];
  BOOL v3 = [v2 accessCapability] == 1;

  return v3;
}

- (void)refreshInfo
{
  BOOL v3 = [(PTPCameraItem *)self path];

  if (!v3)
  {
    id v5 = [(PTPCameraItem *)self initiator];
    v4 = [v5 storageInfo:-[PTPCameraItem storageID](self, "storageID")];
    [(PTPCameraItem *)self setInfo:v4];
  }
}

- (id)prime
{
  BOOL v3 = [(PTPCameraItem *)self path];

  if (v3)
  {
    v4 = 0;
    goto LABEL_34;
  }
  id v5 = [(PTPCameraItem *)self initiator];
  v6 = [v5 deviceInfo];
  if ([v5 deviceVendorID] != 1452)
  {
    v13 = [v6 operationsSupported];
    v14 = +[NSNumber numberWithUnsignedShort:4131];
    if ([v13 containsObject:v14])
    {
      unsigned int v15 = [v6 standardVersion];

      if (v15 >= 0x6E)
      {
        __ICOSLogCreate();
        v16 = @"[prime]";
        if ((unint64_t)[@"[prime]" length] >= 0x15)
        {
          v17 = @"[prime]".substringWithRange(0, 18);
          v16 = [v17 stringByAppendingString:@".."];
        }
        v18 = +[NSString stringWithFormat:@"Device supports PTP1.1/MTP1.0 enumeration"];
        v19 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v16;
          v21 = v19;
          int v41 = 136446466;
          id v42 = [(__CFString *)v20 UTF8String];
          __int16 v43 = 2114;
          v44 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v41, 0x16u);
        }
        uint64_t v22 = [v5 fileSystemManifestForStorage:-[PTPCameraItem storageID](self, "storageID") objectFormatCode:0 association:0];
        goto LABEL_33;
      }
    }
    else
    {
    }
    __ICOSLogCreate();
    v24 = @"[prime]";
    if ((unint64_t)[@"[prime]" length] >= 0x15)
    {
      v25 = [@"[prime]" substringWithRange:0, 18];
      v24 = [v25 stringByAppendingString:@".."];
    }
    v26 = +[NSString stringWithFormat:@"Device supports PTP1.0 enumeration"];
    v27 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v24;
      v29 = v27;
      int v41 = 136446466;
      id v42 = [(__CFString *)v28 UTF8String];
      __int16 v43 = 2114;
      v44 = v26;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v41, 0x16u);
    }
    uint64_t v22 = [v5 objectHandlesInStorage:-[PTPCameraItem storageID](self, "storageID") objectFormatCode:0 association:0];
    goto LABEL_33;
  }
  if ([v6 standardVersion] < 0x6E) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = [v6 operationsSupported];
  objc_super v9 = +[NSNumber numberWithUnsignedShort:36879];
  unsigned int v10 = [v8 containsObject:v9];

  __ICOSLogCreate();
  id v11 = [@"[prime]" length];
  if (v10)
  {
    if ((unint64_t)v11 >= 0x15)
    {
      __int16 v12 = [[@"[prime]" substringWithRange:0, 18];
      v30 = [v12 stringByAppendingString:@".."];
    }
    else
    {
      v30 = @"[prime]";
    }
    v31 = +[NSString stringWithFormat:@"Device supports apple group enumeration, opting in for more responsive experience"];
    v32 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v30;
      v34 = v32;
      int v41 = 136446466;
      id v42 = [(__CFString *)v33 UTF8String];
      __int16 v43 = 2114;
      v44 = v31;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v41, 0x16u);
    }
    uint64_t v22 = [v5 objectInfoDatasetForNextObjectGroupInStorage:-[PTPCameraItem storageID](self, "storageID")];
  }
  else
  {
    if ((unint64_t)v11 >= 0x15)
    {
      v23 = [@"[prime]" substringWithRange:0, 18];
      v35 = [v23 stringByAppendingString:@".."];
    }
    else
    {
      v35 = @"[prime]";
    }
    v36 = +[NSString stringWithFormat:@"Device supports apple full enumeration, large libraries may experience delays"];
    v37 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v35;
      v39 = v37;
      int v41 = 136446466;
      id v42 = [(__CFString *)v38 UTF8String];
      __int16 v43 = 2114;
      v44 = v36;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v41, 0x16u);
    }
    uint64_t v22 = [v5 objectInfoDatasetForObjectsInStorage:-[PTPCameraItem storageID](self, "storageID") objectFormatCode:0 association:0 contentType:v7];
  }
LABEL_33:
  v4 = (void *)v22;

LABEL_34:

  return v4;
}

- (unint64_t)enumerateContent:(id)a3 withOrder:(int64_t)a4
{
  id v5 = a3;
  v6 = [(PTPCameraItem *)self initiator];
  uint64_t v7 = [v6 transport];
  unsigned int v8 = [v7 connected];

  if (v8)
  {
    unsigned int v33 = [v6 deviceVendorID];
    objc_super v9 = +[NSMutableArray array];
    unsigned int v10 = +[NSMutableArray array];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100017DDC;
    v46[3] = &unk_10004CB18;
    id v11 = v6;
    id v47 = v11;
    BOOL v51 = v33 == 1452;
    id v12 = v10;
    id v48 = v12;
    int64_t v50 = a4;
    id v13 = v9;
    id v49 = v13;
    [v5 enumerateObjectsUsingBlock:v46];
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = sub_100017FAC;
    v44[4] = sub_100017FBC;
    id v45 = +[NSMutableArray array];
    __ICOSLogCreate();
    if ((unint64_t)[@"Folders" length] < 0x15)
    {
      unsigned int v15 = @"Folders";
    }
    else
    {
      v14 = [@"Folders" substringWithRange:0, 18];
      unsigned int v15 = [v14 stringByAppendingString:@".."];
    }
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%lu]", [v12 count]);
    v18 = (id)_gICOSLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(__CFString *)v15 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v53 = v19;
      __int16 v54 = 2114;
      v55 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100017FC4;
    v39[3] = &unk_10004CB40;
    id v20 = v11;
    id v40 = v20;
    int v41 = self;
    id v42 = v44;
    BOOL v43 = v33 == 1452;
    [v12 enumerateObjectsUsingBlock:v39];
    __ICOSLogCreate();
    if ((unint64_t)[@"Files" length] < 0x15)
    {
      uint64_t v22 = @"Files";
    }
    else
    {
      v21 = [@"Files" substringWithRange:0, 18];
      uint64_t v22 = [v21 stringByAppendingString:@".."];
    }
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%lu]", [v13 count]);
    v24 = (id)_gICOSLog;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(__CFString *)v22 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v53 = v25;
      __int16 v54 = 2114;
      v55 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000182E4;
    v35[3] = &unk_10004CB68;
    id v36 = v20;
    v37 = self;
    BOOL v38 = v33 == 1452;
    [v13 enumerateObjectsUsingBlock:v35];
    if (v33 == 1452)
    {
      v26 = [(PTPCameraItem *)self initiator];
      v27 = [v26 delegate];

      v28 = [(PTPCameraItem *)self initiator];
      v29 = [v27 allConnections];
      [v28 sendContentsNotificationWithOrder:a4 toConnections:v29];
    }
    id v30 = [v13 count];
    id v31 = [v12 count];

    _Block_object_dispose(v44, 8);
    unint64_t v16 = (unint64_t)v30 + (void)v31;
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

- (unint64_t)ptpObjectCount
{
  v2 = [(PTPCameraStorage *)self indexedMediaSet];
  id v3 = [v2 mediaItemCount];

  return (unint64_t)v3;
}

- (void)addCameraFileToIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(PTPCameraStorage *)self indexedMediaSet];
  [v5 addMediaItemToIndex:v4];
}

- (void)addCameraFolderToIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(PTPCameraStorage *)self indexedMediaSet];
  [v5 addMediaItemToIndex:v4];
}

- (id)cameraFileWithObjectID:(unint64_t)a3
{
  id v4 = [(PTPCameraStorage *)self indexedMediaSet];
  id v5 = [v4 mediaItemWithHandle:a3 inTypes:&off_100059A38];

  return v5;
}

- (id)cameraFolderWithObjectID:(unint64_t)a3
{
  id v4 = [(PTPCameraStorage *)self indexedMediaSet];
  id v5 = [v4 mediaItemWithHandle:a3 inTypes:&off_100059A50];

  return v5;
}

- (id)cameraItemWithObjectID:(unint64_t)a3
{
  id v4 = [(PTPCameraStorage *)self indexedMediaSet];
  id v5 = [v4 mediaItemWithHandle:a3 inTypes:0];

  return v5;
}

- (void)removeCameraFileFromIndex:(unint64_t)a3
{
  id v4 = [(PTPCameraStorage *)self indexedMediaSet];
  [v4 removeMediaItemWithHandleFromIndex:a3];
}

- (void)removeCameraFolderFromIndex:(unint64_t)a3
{
  id v4 = [(PTPCameraStorage *)self indexedMediaSet];
  [v4 removeMediaItemWithHandleFromIndex:a3];
}

- (id)indexedFiles
{
  v2 = [(PTPCameraStorage *)self indexedMediaSet];
  id v3 = [v2 arrayForType:@"file"];

  return v3;
}

- (id)indexedFolders
{
  v2 = [(PTPCameraStorage *)self indexedMediaSet];
  id v3 = [v2 arrayForType:@"folder"];

  return v3;
}

- (ICOrderedMediaSet)indexedMediaSet
{
  return self->_indexedMediaSet;
}

- (void)setIndexedMediaSet:(id)a3
{
}

- (NSArray)objectInfoArray
{
  return self->_objectInfoArray;
}

- (void)setObjectInfoArray:(id)a3
{
}

- (BOOL)catalogingDone
{
  return self->_catalogingDone;
}

- (void)setCatalogingDone:(BOOL)a3
{
  self->_catalogingDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectInfoArray, 0);

  objc_storeStrong((id *)&self->_indexedMediaSet, 0);
}

@end