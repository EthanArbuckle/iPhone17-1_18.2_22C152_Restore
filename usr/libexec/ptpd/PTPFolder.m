@interface PTPFolder
- (BOOL)fileExists:(id)a3;
- (NSMutableDictionary)fileNames;
- (NSMutableDictionary)folders;
- (NSMutableIndexSet)fileIndices;
- (NSString)mediaItemType;
- (NSString)path;
- (PTPFolder)initWithName:(id)a3 captureTimeSpec:(timespec *)a4 parent:(id)a5 storage:(id)a6;
- (PTPFolder)initWithObjectHandle:(unsigned int)a3;
- (PTPObjectInfoDataset)objectInfoDataset;
- (id)folderMatchingName:(id)a3;
- (id)objectHandlesForObjectFormatCode:(unsigned __int16)a3 inAssociation:(unsigned int)a4;
- (id)objectMatchingAssetHandle:(id)a3;
- (id)parent;
- (id)storage;
- (int64_t)size;
- (timespec)captureTimeSpec;
- (unint64_t)appendObjectData:(id)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(unsigned int)a6;
- (unint64_t)serialNumber;
- (unsigned)objectHandle;
- (unsigned)storageID;
- (unsigned)unsignedIntegerValue;
- (void)addFile:(id)a3;
- (void)addFolder:(id)a3;
- (void)deleteFile:(id)a3;
- (void)deleteFolder:(id)a3;
- (void)setCaptureTimeSpec:(timespec)a3;
- (void)setFileIndices:(id)a3;
- (void)setFileNames:(id)a3;
- (void)setFolders:(id)a3;
- (void)setObjectHandle:(unsigned int)a3;
- (void)setObjectInfoDataset:(id)a3;
- (void)setParent:(id)a3;
- (void)setPath:(id)a3;
- (void)setSerialNumber:(unint64_t)a3;
- (void)setSize:(int64_t)a3;
- (void)setStorage:(id)a3;
@end

@implementation PTPFolder

- (unsigned)unsignedIntegerValue
{
  return self->_objectHandle;
}

- (NSString)mediaItemType
{
  return (NSString *)@"folder";
}

- (PTPFolder)initWithName:(id)a3 captureTimeSpec:(timespec *)a4 parent:(id)a5 storage:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [(PTPFolder *)self initWithObjectHandle:sub_1000026B4()];
  v14 = v13;
  if (v13)
  {
    [(PTPFolder *)v13 setParent:v11];
    [(PTPFolder *)v14 setStorage:v12];
    if (a4)
    {
      v23 = +[NSDate dateWithTimeIntervalSince1970:(double)a4->tv_sec];
      v22 = +[NSCalendar currentCalendar];
      v15 = [v22 components:252 fromDate:v23];
      id v24 = v12;
      id v16 = v10;
      snprintf(__str, 0x14uLL, "%04d%02d%02dT%02d%02d%02d.0", [v15 year], [v15 month], [v15 day], [v15 hour], [v15 minute], [v15 second]);
      objectInfoDataset = v14->_objectInfoDataset;
      v18 = +[NSString stringWithFormat:@"%s", __str];
      [(PTPObjectInfoDataset *)objectInfoDataset setCaptureDate:v18];

      id v10 = v16;
      id v12 = v24;
      v19 = v14->_objectInfoDataset;
      v20 = +[NSString stringWithFormat:@"%s", __str];
      [(PTPObjectInfoDataset *)v19 setModificationDate:v20];

      v14->_captureTimeSpec = *a4;
    }
    [(PTPObjectInfoDataset *)v14->_objectInfoDataset setStorageID:[(PTPFolder *)v14 storageID]];
    [(PTPObjectInfoDataset *)v14->_objectInfoDataset setObjectFormat:12289];
    [(PTPObjectInfoDataset *)v14->_objectInfoDataset setProtectionStatus:0];
    -[PTPObjectInfoDataset setParentObject:](v14->_objectInfoDataset, "setParentObject:", [v11 objectHandle]);
    [(PTPObjectInfoDataset *)v14->_objectInfoDataset setAssociationType:1];
    [(PTPObjectInfoDataset *)v14->_objectInfoDataset setFilename:v10];
    [(PTPObjectInfoDataset *)v14->_objectInfoDataset setObjectHandle:[(PTPFolder *)v14 objectHandle]];
    ++dword_10005E454;
  }

  return v14;
}

- (PTPFolder)initWithObjectHandle:(unsigned int)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PTPFolder;
  v4 = [(PTPFolder *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_serialNumber = 0;
    v4->_size = 0;
    v6 = objc_alloc_init(PTPObjectInfoDataset);
    objectInfoDataset = v5->_objectInfoDataset;
    v5->_objectInfoDataset = v6;

    v5->_objectHandle = a3;
    v8 = +[NSMutableIndexSet indexSet];
    [(PTPFolder *)v5 setFileIndices:v8];

    v9 = +[NSMutableDictionary dictionary];
    [(PTPFolder *)v5 setFileNames:v9];

    id v10 = +[NSMutableDictionary dictionary];
    [(PTPFolder *)v5 setFolders:v10];

    v5->_folderLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (unsigned)storageID
{
  id WeakRetained = objc_loadWeakRetained(&self->_storage);
  unsigned int v3 = [WeakRetained storageID];

  return v3;
}

- (PTPObjectInfoDataset)objectInfoDataset
{
  return self->_objectInfoDataset;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (id)objectMatchingAssetHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableIndexSet *)self->_fileIndices lastIndex];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_7;
  }
  id v6 = v5;
  while (1)
  {
    v8 = [(PTPFolder *)self storage];
    v9 = [v8 cameraFileWithObjectID:v6];

    id v6 = [(NSMutableIndexSet *)self->_fileIndices indexLessThanIndex:v6];
    id v10 = [v9 plAssetHandle];
    unsigned __int8 v11 = [v10 isEqual:v4];

    if (v11) {
      break;
    }

    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
  }
  if (!v9)
  {
LABEL_7:
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    objc_super v12 = [(NSMutableDictionary *)self->_folders allValues];
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
LABEL_9:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v21 + 1) + 8 * v16) unsignedIntValue];
        v18 = [(PTPFolder *)self storage];
        v19 = [v18 cameraFolderWithObjectID:v17];

        v9 = [v19 objectMatchingAssetHandle:v4];

        if (v9) {
          break;
        }
        if (v14 == (id)++v16)
        {
          id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v14) {
            goto LABEL_9;
          }
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      v9 = 0;
    }
  }

  return v9;
}

- (id)objectHandlesForObjectFormatCode:(unsigned __int16)a3 inAssociation:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v5 = a3;
  __ICOSLogCreate();
  v84 = self;
  uint64_t v85 = v4;
  unsigned int v83 = v5;
  v7 = +[NSString stringWithFormat:@"[Object Handle: 0x%x] objectHandlesForObjectFormatCode: 0x%x, Association Handle: 0x%x\n", [(PTPFolder *)self objectHandle], v5, v4];
  if (__ICLogTypeEnabled(4))
  {
    v8 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v92 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = v84;
    __ICOSLogCreate();
    id v10 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      unsigned __int8 v11 = [[&stru_100048E60 substringWithRange:0, 18];
      id v10 = [v11 stringByAppendingString:@".."];
    }
    objc_super v12 = [(__CFString *)v9 objectInfoDataset];
    id v13 = [v12 filename];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"* >>[%s] ", [v13 UTF8String]);
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v10;
      uint64_t v17 = v15;
      id v18 = [(__CFString *)v16 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v92 = v18;
      __int16 v93 = 2114;
      v94 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    __ICOSLogCreate();
    v9 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      v19 = [&stru_100048E60 substringWithRange:0, 18];
      v9 = [v19 stringByAppendingString:@".."];
    }
    id v10 = +[NSString stringWithFormat:@"* >>[0x%x] \n", [(PTPFolder *)v84 objectHandle]];
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v9;
      long long v21 = v20;
      id v22 = [(__CFString *)v9 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v92 = v22;
      __int16 v93 = 2114;
      v94 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }

  id v82 = +[NSMutableArray arrayWithCapacity:0];
  char v23 = sub_10000267C();
  unsigned int v24 = v83;
  if ((v4 + 1) < 2 || v84->_objectHandle == v4)
  {
    id v25 = [(NSMutableIndexSet *)v84->_fileIndices lastIndex];
    if (v25 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v26 = v25;
      while (1)
      {
        v27 = [(PTPFolder *)v84 storage];
        v28 = [v27 cameraFileWithObjectID:v26];

        id v26 = [(NSMutableIndexSet *)v84->_fileIndices indexLessThanIndex:v26];
        v29 = [v28 objectInfoDataset];
        char v30 = (unint64_t)[v29 objectCompressedSize64] >> 32 ? v23 : 1;

        if ((v30 & 1) == 0) {
          break;
        }
        if (!v24) {
          goto LABEL_38;
        }
        __ICOSLogCreate();
        v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x] Object Format Code Is Non-Zero\n", [v28 objectHandle]);
        if (__ICLogTypeEnabled(4))
        {
          v32 = _gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v92 = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }

        v33 = [v28 objectInfoDataset];
        unsigned int v34 = [v33 objectFormat];
        unsigned int v35 = v34;
        if (v24 == 0xFFFF)
        {
          int v38 = ~v34 & 0x3800;

          if (v38)
          {
LABEL_38:
            id v39 = v26;
            __ICOSLogCreate();
            v40 = &stru_100048E60;
            if ((unint64_t)[&stru_100048E60 length] >= 0x15)
            {
              v41 = [&stru_100048E60 substringWithRange:0, 18];
              v40 = [v41 stringByAppendingString:@".."];
            }
            id v42 = [v28 objectHandle];
            v43 = [v28 objectInfoDataset];
            id v44 = [v43 filename];
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"  +[0x%x]%s] ", v42, [v44 UTF8String]);
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v46 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v47 = v40;
              v48 = v46;
              id v49 = [(__CFString *)v47 UTF8String];
              *(_DWORD *)buf = 136446466;
              id v92 = v49;
              __int16 v93 = 2114;
              v94 = v45;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
            v36 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v28 objectHandle]);
            [v82 addObject:v36];
            unsigned int v24 = v83;
            id v26 = v39;
            goto LABEL_43;
          }
          __ICOSLogCreate();
          v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x] Object Has Been Excluded\n", [v28 objectHandle]);
          if (__ICLogTypeEnabled(4))
          {
            v37 = _gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_33;
            }
          }
        }
        else
        {

          if (v35 == v24) {
            goto LABEL_38;
          }
          __ICOSLogCreate();
          v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x] Object Format Code Does Not Match\n", [v28 objectHandle]);
          if (__ICLogTypeEnabled(4))
          {
            v37 = _gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_33;
            }
          }
        }
LABEL_43:

        if (v26 == (id)0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_44;
        }
      }
      __ICOSLogCreate();
      v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x] Large File Support Disabled, Large File Cannot Be Added Index\n", [v28 objectHandle]);
      if (!__ICLogTypeEnabled(4)) {
        goto LABEL_43;
      }
      v37 = _gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
LABEL_33:
      *(_DWORD *)buf = 138543362;
      id v92 = v36;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      goto LABEL_43;
    }
  }
LABEL_44:
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v50 = v84;
  obj = [(NSMutableDictionary *)v84->_folders allValues];
  id v51 = [obj countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (!v51) {
    goto LABEL_65;
  }
  id v52 = v51;
  uint64_t v53 = *(void *)v87;
  do
  {
    for (i = 0; i != v52; i = (char *)i + 1)
    {
      if (*(void *)v87 != v53) {
        objc_enumerationMutation(obj);
      }
      v55 = *(void **)(*((void *)&v86 + 1) + 8 * i);
      v56 = [(PTPFolder *)v50 storage];
      v57 = [v56 cameraFolderWithObjectID:[v55 unsignedIntValue]];

      if (v24) {
        goto LABEL_57;
      }
      if ((v85 + 1) < 2 || v50->_objectHandle == v85)
      {
        __ICOSLogCreate();
        v58 = &stru_100048E60;
        if ((unint64_t)[&stru_100048E60 length] >= 0x15)
        {
          v59 = [&stru_100048E60 substringWithRange:0, 18];
          v58 = [v59 stringByAppendingString:@".."];
        }
        uint64_t v60 = [v57 objectHandle];
        v61 = [v57 objectInfoDataset];
        id v62 = [v61 filename];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"  +[0x%lx]%s] \n", v60, [v62 UTF8String]);
        v63 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v64 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v65 = v58;
          v66 = v64;
          id v67 = [(__CFString *)v65 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v92 = v67;
          __int16 v93 = 2114;
          v94 = v63;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        v68 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v57 objectHandle]);
        [v82 addObject:v68];

        unsigned int v24 = v83;
        v50 = v84;
LABEL_57:
        if (v85 == -1) {
          goto LABEL_63;
        }
      }
      __ICOSLogCreate();
      v69 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        v70 = [&stru_100048E60 substringWithRange:0, 18];
        v69 = [v70 stringByAppendingString:@".."];
      }
      uint64_t v71 = [v57 objectHandle];
      v72 = [v57 objectInfoDataset];
      id v73 = [v72 filename];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" ->[0x%lx]%s] \n", v71, [v73 UTF8String]);
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v75 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v76 = v69;
        v77 = v75;
        id v78 = [(__CFString *)v76 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v92 = v78;
        __int16 v93 = 2114;
        v94 = v74;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      unsigned int v24 = v83;
      v79 = [v57 objectHandlesForObjectFormatCode:v83 inAssociation:v85];
      [v82 addObjectsFromArray:v79];

      v50 = v84;
LABEL_63:
    }
    id v52 = [obj countByEnumeratingWithState:&v86 objects:v90 count:16];
  }
  while (v52);
LABEL_65:

  return v82;
}

- (void)addFile:(id)a3
{
  id v4 = a3;
  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 objectHandle]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v5 = [v4 objectInfoDataset];
  id v6 = [v5 filename];
  v7 = [v4 objectInfoDataset];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%d", v6, [v7 sequenceNumber]);

  p_folderLock = &self->_folderLock;
  os_unfair_lock_lock(&self->_folderLock);
  [(NSMutableDictionary *)self->_fileNames setObject:v11 forKeyedSubscript:v8];
  fileIndices = self->_fileIndices;
  LODWORD(v6) = [v4 objectHandle];

  [(NSMutableIndexSet *)fileIndices addIndex:v6];
  os_unfair_lock_unlock(p_folderLock);
}

- (void)addFolder:(id)a3
{
  id v4 = a3;
  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 objectHandle]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  p_folderLock = &self->_folderLock;
  os_unfair_lock_lock(&self->_folderLock);
  folders = self->_folders;
  v7 = [v4 objectInfoDataset];

  v8 = [v7 filename];
  [(NSMutableDictionary *)folders setObject:v9 forKeyedSubscript:v8];

  os_unfair_lock_unlock(p_folderLock);
}

- (void)deleteFile:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 objectInfoDataset];
  id v6 = [v5 filename];
  v7 = [v4 objectInfoDataset];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%d", v6, [v7 sequenceNumber]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  p_folderLock = &self->_folderLock;
  os_unfair_lock_lock(&self->_folderLock);
  [(NSMutableDictionary *)self->_fileNames removeObjectForKey:v10];
  -[NSMutableIndexSet removeIndex:](self->_fileIndices, "removeIndex:", [v4 objectHandle]);
  id v9 = [(PTPFolder *)self storage];
  LODWORD(v5) = [v4 objectHandle];

  [v9 removeCameraFileFromIndex:v5];
  os_unfair_lock_unlock(p_folderLock);
}

- (void)deleteFolder:(id)a3
{
  p_folderLock = &self->_folderLock;
  id v5 = a3;
  os_unfair_lock_lock(p_folderLock);
  folders = self->_folders;
  v7 = [v5 objectInfoDataset];
  v8 = [v7 filename];
  [(NSMutableDictionary *)folders removeObjectForKey:v8];

  id v9 = [(PTPFolder *)self storage];
  LODWORD(folders) = [v5 objectHandle];

  [v9 removeCameraFolderFromIndex:folders];

  os_unfair_lock_unlock(p_folderLock);
}

- (BOOL)fileExists:(id)a3
{
  p_folderLock = &self->_folderLock;
  id v5 = a3;
  os_unfair_lock_lock(p_folderLock);
  id v6 = [(NSMutableDictionary *)self->_fileNames objectForKeyedSubscript:v5];

  LODWORD(v5) = [v6 unsignedIntValue];
  os_unfair_lock_unlock(p_folderLock);
  return v5 != 0;
}

- (id)folderMatchingName:(id)a3
{
  p_folderLock = &self->_folderLock;
  id v5 = a3;
  os_unfair_lock_lock(p_folderLock);
  id v6 = [(NSMutableDictionary *)self->_folders objectForKeyedSubscript:v5];

  unsigned int v7 = [v6 unsignedIntValue];
  os_unfair_lock_unlock(p_folderLock);
  if (v7)
  {
    v8 = [(PTPFolder *)self storage];
    id v9 = [v8 cameraFolderWithObjectID:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)appendObjectData:(id)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(unsigned int)a6
{
  unsigned int v7 = a4;
  id v76 = a3;
  objc_opt_class();
  unsigned int v74 = a5;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = self;
    __ICOSLogCreate();
    id v9 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      uint64_t v15 = [&stru_100048E60 substringWithRange:0, 18];
      id v9 = [v15 stringByAppendingString:@".."];
    }
    uint64_t v16 = [(PTPFolder *)v14 objectInfoDataset];
    id v17 = [v16 filename];
    id v18 = [v17 UTF8String];
    id v19 = [(NSMutableDictionary *)v14->_folders count];
    fileIndices = v14->_fileIndices;

    id v11 = +[NSString stringWithFormat:@"  [Folder: %8s] folders:[%5lu] files:[%5lu] \n", v18, v19, [(NSMutableIndexSet *)fileIndices count]];

    long long v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v9;
      id v22 = v21;
      *(_DWORD *)buf = 136446466;
      id v86 = [(__CFString *)v9 UTF8String];
      __int16 v87 = 2114;
      long long v88 = v11;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    a5 = v74;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __ICOSLogCreate();
    id v9 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      id v10 = [&stru_100048E60 substringWithRange:0, 18];
      id v9 = [v10 stringByAppendingString:@".."];
    }
    id v11 = +[NSString stringWithFormat:@"[Storage: 0x%x] \n", [(PTPFolder *)self objectHandle]];
    objc_super v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v9;
      id v13 = v12;
      *(_DWORD *)buf = 136446466;
      id v86 = [(__CFString *)v9 UTF8String];
      __int16 v87 = 2114;
      long long v88 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
LABEL_12:
  }
  unint64_t v83 = 0;
  if (a6 == 3 && ![v76 length])
  {
    __ICOSLogCreate();
    char v23 = +[NSString stringWithFormat:@"Append Initial PTP11 Array, Object Count [%d]\n", v83];
    if (__ICLogTypeEnabled(4))
    {
      unsigned int v24 = _gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v86 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }

    [v76 appendBytes:&v83 length:8];
    a5 = v74;
  }
  uint64_t v25 = sub_10000267C();
  unsigned int v73 = a5 + 1;
  unsigned int v77 = v7;
  id v78 = self;
  if (a5 + 1 < 2 || self->_objectHandle == a5)
  {
    os_unfair_lock_lock(&self->_folderLock);
    id v26 = [(NSMutableIndexSet *)self->_fileIndices lastIndex];
    if (v26 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_22:
      os_unfair_lock_unlock(&self->_folderLock);
      unsigned int v7 = v77;
      goto LABEL_23;
    }
    id v50 = v26;
    while (1)
    {
      id v52 = [(PTPFolder *)self storage];
      uint64_t v53 = [v52 cameraFileWithObjectID:v50];

      id v50 = [(NSMutableIndexSet *)self->_fileIndices indexLessThanIndex:v50];
      v54 = [v53 objectInfoDataset];
      char v55 = (unint64_t)[v54 objectCompressedSize64] >> 32 ? v25 : 1;

      if ((v55 & 1) == 0) {
        break;
      }
      if (!v77) {
        goto LABEL_64;
      }
      __ICOSLogCreate();
      v56 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x] Object Format Code Is Non-Zero\n", [v53 objectHandle]);
      if (__ICLogTypeEnabled(4))
      {
        v57 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v86 = v56;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      v58 = [v53 objectInfoDataset];
      unsigned int v59 = [v58 objectFormat];
      unsigned int v60 = v59;
      if (v77 == 0xFFFF)
      {
        int v63 = ~v59 & 0x3800;

        if (v63)
        {
LABEL_64:
          id v64 = v50;
          uint64_t v65 = v25;
          __ICOSLogCreate();
          id v66 = [v53 objectHandle];
          id v67 = [v53 objectInfoDataset];
          id v68 = [v67 filename];
          v69 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" +[0x%x]%s] ", v66, [v68 UTF8String]);

          if (__ICLogTypeEnabled(4))
          {
            v70 = _gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v86 = v69;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }
          }

          uint64_t v71 = [v53 objectInfoDataset];
          v61 = [v71 content:a6];

          [v76 appendData:v61];
          ++v83;
          a5 = v74;
          uint64_t v25 = v65;
          id v50 = v64;
          goto LABEL_68;
        }
        __ICOSLogCreate();
        v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x] Object Has Been Excluded\n", [v53 objectHandle]);
        if (!__ICLogTypeEnabled(4))
        {
LABEL_70:
          a5 = v74;
          goto LABEL_68;
        }
        id v62 = _gICOSLog;
        a5 = v74;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_59;
        }
      }
      else
      {

        if (v60 == v77) {
          goto LABEL_64;
        }
        __ICOSLogCreate();
        v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x] Object Format Code Does Not Match\n", [v53 objectHandle]);
        if (!__ICLogTypeEnabled(4)) {
          goto LABEL_70;
        }
        id v62 = _gICOSLog;
        a5 = v74;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_59;
        }
      }
LABEL_68:

      if (v50 == (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_22;
      }
    }
    __ICOSLogCreate();
    v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x] Large File Support Disabled, Large File Cannot Be Added Index\n", [v53 objectHandle]);
    if (!__ICLogTypeEnabled(4)) {
      goto LABEL_68;
    }
    id v62 = _gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_68;
    }
LABEL_59:
    *(_DWORD *)buf = 138543362;
    id v86 = v61;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    goto LABEL_68;
  }
LABEL_23:
  os_unfair_lock_t lock = &self->_folderLock;
  os_unfair_lock_lock(&self->_folderLock);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v27 = [(NSMutableDictionary *)self->_folders allValues];
  id v28 = [v27 countByEnumeratingWithState:&v79 objects:v84 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v80;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v80 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        v33 = [(PTPFolder *)self storage];
        unsigned int v34 = [v33 cameraFolderWithObjectID:[v32 unsignedIntValue]];

        if (v7) {
          goto LABEL_35;
        }
        if (v73 < 2 || self->_objectHandle == a5)
        {
          __ICOSLogCreate();
          id v35 = [v34 objectHandle];
          v36 = [v34 objectInfoDataset];
          id v37 = [v36 filename];
          int v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" +[0x%x]%s] \n", v35, [v37 UTF8String]);

          if (__ICLogTypeEnabled(4))
          {
            id v39 = _gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v86 = v38;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }
          }

          v40 = [v34 objectInfoDataset];
          v41 = [v40 content:a6];

          [v76 appendData:v41];
          ++v83;

          unsigned int v7 = v77;
          self = v78;
LABEL_35:
          if (a5 == -1) {
            goto LABEL_40;
          }
        }
        __ICOSLogCreate();
        id v42 = [v34 objectHandle];
        v43 = [v34 objectInfoDataset];
        id v44 = [v43 filename];
        v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"->[0x%x]%s] \n", v42, [v44 UTF8String]);

        if (__ICLogTypeEnabled(4))
        {
          v46 = _gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v86 = v45;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }

        unsigned int v7 = v77;
        a5 = v74;
        id v47 = [v34 appendObjectData:v76 forObjectFormatCode:v77 inAssociation:v74 withContentType:a6];
        v83 += (unint64_t)v47;
        self = v78;
LABEL_40:
      }
      id v29 = [v27 countByEnumeratingWithState:&v79 objects:v84 count:16];
    }
    while (v29);
  }

  os_unfair_lock_unlock(lock);
  unint64_t v48 = v83;

  return v48;
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained(&self->_parent);

  return WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (id)storage
{
  id WeakRetained = objc_loadWeakRetained(&self->_storage);

  return WeakRetained;
}

- (void)setStorage:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(unint64_t)a3
{
  self->_serialNumber = a3;
}

- (timespec)captureTimeSpec
{
  uint64_t tv_nsec = self->_captureTimeSpec.tv_nsec;
  __darwin_time_t tv_sec = self->_captureTimeSpec.tv_sec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setCaptureTimeSpec:(timespec)a3
{
  self->_captureTimeSpec = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (NSMutableDictionary)fileNames
{
  return self->_fileNames;
}

- (void)setFileNames:(id)a3
{
}

- (NSMutableIndexSet)fileIndices
{
  return self->_fileIndices;
}

- (void)setFileIndices:(id)a3
{
}

- (NSMutableDictionary)folders
{
  return self->_folders;
}

- (void)setFolders:(id)a3
{
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (void)setObjectInfoDataset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectInfoDataset, 0);
  objc_storeStrong((id *)&self->_folders, 0);
  objc_storeStrong((id *)&self->_fileIndices, 0);
  objc_storeStrong((id *)&self->_fileNames, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak(&self->_storage);

  objc_destroyWeak(&self->_parent);
}

@end