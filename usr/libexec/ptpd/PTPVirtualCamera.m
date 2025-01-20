@interface PTPVirtualCamera
- (BOOL)hostIsLegacyOS;
- (BOOL)hostIsMacOS;
- (BOOL)hostIsWindows;
- (BOOL)hostSupportsGroups;
- (BOOL)removeStorageWithID:(unsigned int)a3;
- (BOOL)visibleStorage:(id)a3;
- (BOOL)willOverrideCapabilities;
- (NSMutableArray)hostMediaSupportedFormats;
- (NSMutableArray)objectDescriptionDataset;
- (NSMutableDictionary)storages;
- (NSString)name;
- (NSString)path;
- (NSString)productType;
- (NSString)userAssignedName;
- (OS_dispatch_queue)storageEnumerationQ;
- (OS_dispatch_queue)storageTimerQ;
- (OS_dispatch_source)storageTimer;
- (PFMediaCapabilities)mediaCapabilities;
- (PTPDeviceInfoDataset)deviceInfoDataset;
- (PTPSecurityModel)ptpSecurityModel;
- (PTPStorage)photoStorage;
- (PTPStorage)placeholderStorage;
- (PTPVirtualCamera)initWithName:(id)a3 andPath:(id)a4;
- (id)allStorageIDs;
- (id)allStorages;
- (id)dataSourceForObjectHandle:(unsigned int)a3 responseCode:(unsigned __int16 *)a4 size:(unsigned int *)a5;
- (id)delegate;
- (id)devicePropDescDatasetForProperty:(unsigned __int16)a3;
- (id)devicePropValueForProperty:(unsigned __int16)a3;
- (id)embeddedMetadataForObjectHandle:(unsigned int)a3 responseCode:(unsigned __int16 *)a4;
- (id)objectForObjectHandle:(id)a3;
- (id)objectHandlesInStorage:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 responseCode:(unsigned __int16 *)a6;
- (id)objectInfoDatasetForObjectHandle:(unsigned int)a3;
- (id)objectInfoForNextObjectGroupInStorage:(unsigned int)a3 responseCode:(unsigned __int16 *)a4;
- (id)objectInfoForObjectsInStorage:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(int)a6 responseCode:(unsigned __int16 *)a7;
- (id)objectInfosForObjectsInGroup:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(int)a6 responseCode:(unsigned __int16 *)a7;
- (id)objectPropDescForObjectPropertyCode:(unsigned __int16)a3 responseCode:(unsigned __int16 *)a4;
- (id)objectPropListForHandle:(unsigned int)a3 withObjectFormatCode:(unsigned int)a4 andPropertyCode:(unsigned int)a5 andPropertyGroup:(unsigned int)a6 andDepth:(unsigned int)a7 responseCode:(unsigned __int16 *)a8;
- (id)objectPropValueForHandle:(unsigned int)a3 withObjectPropertyCode:(unsigned __int16)a4 responseCode:(unsigned __int16 *)a5;
- (id)objectPropertiesSupportedForObjectFormatCode:(unsigned __int16)a3 responseCode:(unsigned __int16 *)a4;
- (id)overrideCapabilities;
- (id)pathObjectInfoForObjectsInStorage:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(int)a6 responseCode:(unsigned __int16 *)a7;
- (id)photoStorageAvailable;
- (id)storageInfoDatasetForStorageID:(unsigned int)a3;
- (id)storageWithID:(unsigned int)a3;
- (id)thumbnailForObjectHandle:(unsigned int)a3 maxPixelSize:(unsigned int)a4 responseCode:(unsigned __int16 *)a5;
- (int64_t)transferBehaviorUserPreference;
- (unsigned)currentInternalSessionID;
- (unsigned)numAllObjects;
- (unsigned)numDownloadableObjects;
- (unsigned)orientationForObjectHandle:(unsigned int)a3;
- (void)addStorage:(id)a3;
- (void)addedPhotoKeys:(id)a3 deletedPhotoKeys:(id)a4 changedPhotoKeys:(id)a5 changePendingPhotoKeys:(id)a6;
- (void)assignHostMediaCapabilities:(id)a3;
- (void)assignHostSupportedFormats:(id)a3;
- (void)cleanupStorageAfterTimeout:(double)a3 cleanup:(id)a4;
- (void)closeSession;
- (void)dealloc;
- (void)deleteObjectWithObjectHandle:(unsigned int)a3 responseCode:(unsigned __int16 *)a4;
- (void)generatePTPEventsForAddedObjectGroupInStorage:(unsigned int)a3;
- (void)generatePTPEventsForAddedObjectHandles:(id)a3;
- (void)generatePTPEventsForDeletedObjectHandles:(id)a3;
- (void)handleInternalSettingsChanged;
- (void)initializeMTPProperties;
- (void)installSecurity;
- (void)libraryDidBecomeAvailable;
- (void)libraryDidBecomeUnavailable;
- (void)openSession;
- (void)preparePhotoStorage;
- (void)processAddedFiles:(id)a3;
- (void)processDeletedFiles:(id)a3;
- (void)provokeSecurityCheck;
- (void)removePlaceholderStorage;
- (void)removeSecurity;
- (void)removeStorages;
- (void)resetPhotoStorage;
- (void)sendEventAddStorageWithID:(unsigned int)a3;
- (void)sendEventDeviceUnlocked;
- (void)sendEventRemoveStorageWithID:(unsigned int)a3;
- (void)setCurrentInternalSessionID:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceInfoDataset:(id)a3;
- (void)setHostMediaSupportedFormats:(id)a3;
- (void)setHostSupportsGroups:(BOOL)a3;
- (void)setMediaCapabilities:(id)a3;
- (void)setName:(id)a3;
- (void)setObjectDescriptionDataset:(id)a3;
- (void)setPath:(id)a3;
- (void)setPhotoStorage:(id)a3;
- (void)setPlaceholderStorage:(id)a3;
- (void)setProductType:(id)a3;
- (void)setPtpSecurityModel:(id)a3;
- (void)setStorageEnumerationQ:(id)a3;
- (void)setStorageTimer:(id)a3;
- (void)setStorageTimerQ:(id)a3;
- (void)setStorages:(id)a3;
- (void)setUserAssignedName:(id)a3;
- (void)setupStorageAfterTimeout:(id)a3;
- (void)startObservers;
- (void)stopObservers;
- (void)updateDeviceInformation;
- (void)updateUserAssignedName;
- (void)vendPhotoStorage;
@end

@implementation PTPVirtualCamera

- (PTPVirtualCamera)initWithName:(id)a3 andPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v61.receiver = self;
  v61.super_class = (Class)PTPVirtualCamera;
  v9 = [(PTPVirtualCamera *)&v61 init];
  v10 = v9;
  if (v9)
  {
    dword_10005E44C = 0;
    dword_10005E450 = 0;
    dword_10005E454 = 0;
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_path, a4);
    v11 = objc_alloc_init(PTPDeviceInfoDataset);
    deviceInfoDataset = v10->_deviceInfoDataset;
    v10->_deviceInfoDataset = v11;

    v13 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
    storages = v10->_storages;
    v10->_storages = v13;

    byte_10005E440 = 0;
    photoStorage = v10->_photoStorage;
    v10->_photoStorage = 0;

    ptpSecurityModel = v10->_ptpSecurityModel;
    v10->_ptpSecurityModel = 0;

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    hostMediaSupportedFormats = v10->_hostMediaSupportedFormats;
    v10->_hostMediaSupportedFormats = v17;

    dispatch_queue_t v19 = dispatch_queue_create("PTP Enumeration Queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    storageEnumerationQ = v10->_storageEnumerationQ;
    v10->_storageEnumerationQ = (OS_dispatch_queue *)v19;

    id v21 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/System/Library/ApplePTP/PTPDeviceInfoDataset.plist"];
    v22 = v21;
    if (v21)
    {
      v23 = v10->_deviceInfoDataset;
      v24 = [v21 objectForKey:@"StandardVersion"];
      -[PTPDeviceInfoDataset setStandardVersion:](v23, "setStandardVersion:", [v24 unsignedShortValue]);

      v25 = v10->_deviceInfoDataset;
      v26 = [v22 objectForKey:@"VendorExtensionID"];
      -[PTPDeviceInfoDataset setVendorExtensionID:](v25, "setVendorExtensionID:", [v26 unsignedIntValue]);

      v27 = v10->_deviceInfoDataset;
      v28 = [v22 objectForKey:@"VendorExtensionVersion"];
      -[PTPDeviceInfoDataset setVendorExtensionVersion:](v27, "setVendorExtensionVersion:", [v28 unsignedShortValue]);

      v29 = v10->_deviceInfoDataset;
      v30 = [v22 objectForKey:@"VendorExtensionDesc"];
      [(PTPDeviceInfoDataset *)v29 setVendorExtensionDescription:v30];

      v31 = v10->_deviceInfoDataset;
      v32 = [v22 objectForKey:@"FunctionalMode"];
      -[PTPDeviceInfoDataset setFunctionalMode:](v31, "setFunctionalMode:", [v32 unsignedShortValue]);

      v33 = v10->_deviceInfoDataset;
      v34 = [v22 objectForKey:@"OperationsSupported"];
      [(PTPDeviceInfoDataset *)v33 setOperationsSupported:v34];

      v35 = v10->_deviceInfoDataset;
      v36 = [v22 objectForKey:@"EventsSupported"];
      [(PTPDeviceInfoDataset *)v35 setEventsSupported:v36];

      v37 = v10->_deviceInfoDataset;
      v38 = [v22 objectForKey:@"DevicePropertiesSupported"];
      [(PTPDeviceInfoDataset *)v37 setDevicePropertiesSupported:v38];

      v39 = v10->_deviceInfoDataset;
      v40 = [v22 objectForKey:@"CaptureFormats"];
      [(PTPDeviceInfoDataset *)v39 setCaptureFormats:v40];

      v41 = v10->_deviceInfoDataset;
      v42 = [v22 objectForKey:@"ImageFormats"];
      [(PTPDeviceInfoDataset *)v41 setImageFormats:v42];

      v43 = v10->_deviceInfoDataset;
      v44 = [v22 objectForKey:@"Manufacturer"];
      [(PTPDeviceInfoDataset *)v43 setManufacturer:v44];

      v45 = v10->_deviceInfoDataset;
      v46 = [v22 objectForKey:@"Model"];
      [(PTPDeviceInfoDataset *)v45 setModel:v46];

      v47 = v10->_deviceInfoDataset;
      v48 = [v22 objectForKey:@"DeviceVersion"];
      [(PTPDeviceInfoDataset *)v47 setDeviceVersion:v48];

      v49 = v10->_deviceInfoDataset;
      v50 = [v22 objectForKey:@"SerialNumber"];
      [(PTPDeviceInfoDataset *)v49 setSerialNumber:v50];
    }
    [(PTPVirtualCamera *)v10 updateUserAssignedName];
    [(PTPVirtualCamera *)v10 updateDeviceInformation];
    v10->_notificationCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v51 = sub_10000B5F8();
    BOOL v52 = [v51 cplStorageState] != 0;
    id v53 = [v51 cplStorageState];
    v54 = (void *)MGCopyAnswer();
    v55 = +[NSString stringWithFormat:@"ICPE^%d&CPLS^%lu", v52, v53];
    if (v54)
    {
      uint64_t v56 = +[NSString stringWithFormat:@"%@&ASN^%@", v55, v54];

      v55 = (void *)v56;
    }
    [(PTPDeviceInfoDataset *)v10->_deviceInfoDataset setVendorExtensionDescription:v55];
    [(PTPVirtualCamera *)v10 initializeMTPProperties];
    qword_10005E460 = [(PTPVirtualCamera *)v10 transferBehaviorUserPreference];
    v57 = [PTPStorage alloc];
    v58 = [(PTPStorage *)v57 initWithParent:v10 andOptionalID:dword_10005E280 forSessionID:0];
    placeholderStorage = v10->_placeholderStorage;
    v10->_placeholderStorage = v58;

    [v51 setDelegate:v10];
    [(PTPVirtualCamera *)v10 startObservers];
  }
  return v10;
}

- (void)updateUserAssignedName
{
  v3 = (NSString *)MGCopyAnswer();
  if (v3)
  {
    userAssignedName = self->_userAssignedName;
    self->_userAssignedName = v3;

    SEL v5 = NSSelectorFromString(@"reportUserAssignedNameChange");
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained performSelector:v5];
  }
}

- (void)updateDeviceInformation
{
  uint64_t v3 = MGCopyAnswer();
  if (v3)
  {
    v4 = (void *)v3;
    SEL v5 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"Apple %@", v3];
    name = self->_name;
    self->_name = v5;

    [(PTPDeviceInfoDataset *)self->_deviceInfoDataset setModel:self->_name];
  }
  uint64_t v7 = MGCopyAnswer();
  if (v7)
  {
    id v8 = (const void *)v7;
    deviceInfoDataset = self->_deviceInfoDataset;
    v10 = +[NSString stringWithFormat:@"%@", v7];
    [(PTPDeviceInfoDataset *)deviceInfoDataset setSerialNumber:v10];

    CFRelease(v8);
  }
  uint64_t v11 = MGCopyAnswer();
  if (v11)
  {
    v12 = (const void *)v11;
    v13 = self->_deviceInfoDataset;
    v14 = +[NSString stringWithFormat:@"%@", v11];
    [(PTPDeviceInfoDataset *)v13 setDeviceVersion:v14];

    CFRelease(v12);
  }
  v15 = (NSString *)MGCopyAnswer();
  if (v15)
  {
    self->_productType = v15;
    _objc_release_x1();
  }
}

- (void)dealloc
{
  [(PTPVirtualCamera *)self assignHostMediaCapabilities:0];
  uint64_t v3 = sub_10000B5F8();
  v4 = [v3 delegate];

  __ICOSLogCreate();
  id v5 = [@"am.delegate" length];
  if (v4 == self)
  {
    if ((unint64_t)v5 < 0x15)
    {
      v9 = @"am.delegate";
    }
    else
    {
      id v8 = [[@"am.delegate" substringWithRange:0, 18];
      v9 = [v8 stringByAppendingString:@".."];
    }
    v14 = +[NSString stringWithFormat:@"Setting am.delegate to nil"];
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v9;
      v17 = v15;
      *(_DWORD *)buf = 136446466;
      id v20 = [(__CFString *)v16 UTF8String];
      __int16 v21 = 2114;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [v3 setDelegate:0];
  }
  else
  {
    if ((unint64_t)v5 < 0x15)
    {
      uint64_t v7 = @"am.delegate";
    }
    else
    {
      v6 = [@"am.delegate" substringWithRange:0, 18];
      uint64_t v7 = [v6 stringByAppendingString:@".."];
    }
    v10 = +[NSString stringWithFormat:@"am.delegate is not owned by this object, not setting to nil"];
    uint64_t v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v7;
      v13 = v11;
      *(_DWORD *)buf = 136446466;
      id v20 = [(__CFString *)v12 UTF8String];
      __int16 v21 = 2114;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  objc_storeWeak(&self->_delegate, 0);
  [(PTPStorage *)self->_photoStorage setParent:0];
  [(PTPStorage *)self->_placeholderStorage setParent:0];
  [(PTPVirtualCamera *)self removeStorages];
  [(PTPVirtualCamera *)self removeSecurity];
  [(PTPVirtualCamera *)self stopObservers];
  [(PTPVirtualCamera *)self setupStorageAfterTimeout:&stru_100048800];

  v18.receiver = self;
  v18.super_class = (Class)PTPVirtualCamera;
  [(PTPVirtualCamera *)&v18 dealloc];
}

- (NSString)userAssignedName
{
  __ICOSLogCreate();
  uint64_t v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v4 = [&stru_100048E60 substringWithRange:0, 18];
    uint64_t v3 = [v4 stringByAppendingString:@".."];
  }
  id v5 = +[NSString stringWithFormat:@"User Assigned: %@", self->_userAssignedName];
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v3;
    id v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v20 = [(__CFString *)v7 UTF8String];
    __int16 v21 = 2114;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  __ICOSLogCreate();
  v9 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v10 = [&stru_100048E60 substringWithRange:0, 18];
    v9 = [v10 stringByAppendingString:@".."];
  }
  uint64_t v11 = +[NSString stringWithFormat:@"System Defalt: %@", self->_name];
  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v9;
    v14 = v12;
    id v15 = [(__CFString *)v13 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v20 = v15;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  userAssignedName = self->_userAssignedName;
  if (!userAssignedName) {
    userAssignedName = self->_name;
  }
  v17 = userAssignedName;

  return v17;
}

- (int64_t)transferBehaviorUserPreference
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.camera"];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [v2 valueForKey:@"CAMUserPreferenceMediaTransferBehavior"];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
      id v5 = [v4 integerValue];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  __ICOSLogCreate();
  v6 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    uint64_t v7 = [&stru_100048E60 substringWithRange:0, 18];
    v6 = [v7 stringByAppendingString:@".."];
  }
  id v8 = "Auto";
  if (v5 == (id)1) {
    id v8 = "Original";
  }
  v9 = +[NSString stringWithFormat:@"Transfer Mode: %s", v8];
  v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v6;
    v12 = v10;
    *(_DWORD *)buf = 136446466;
    id v15 = [(__CFString *)v11 UTF8String];
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  return (int64_t)v5;
}

- (void)initializeMTPProperties
{
  uint64_t v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  objectDescriptionDataset = self->_objectDescriptionDataset;
  self->_objectDescriptionDataset = v3;

  id v5 = self->_objectDescriptionDataset;
  v6 = +[MTPObjectProperty objectPropertyWithPropertyCode:56321 andDataType:6];
  [(NSMutableArray *)v5 addObject:v6];

  uint64_t v7 = self->_objectDescriptionDataset;
  id v8 = +[MTPObjectProperty objectPropertyWithPropertyCode:56322 andDataType:4];
  [(NSMutableArray *)v7 addObject:v8];

  v9 = self->_objectDescriptionDataset;
  v10 = +[MTPObjectProperty objectPropertyWithPropertyCode:56324 andDataType:8];
  [(NSMutableArray *)v9 addObject:v10];

  uint64_t v11 = self->_objectDescriptionDataset;
  v12 = +[MTPObjectProperty objectPropertyWithPropertyCode:56327 andDataType:0xFFFFLL];
  [(NSMutableArray *)v11 addObject:v12];

  id v18 = +[MTPObjectProperty objectPropertyWithPropertyCode:56328 andDataType:0xFFFFLL];
  [v18 setFormFlag:3];
  [(NSMutableArray *)self->_objectDescriptionDataset addObject:v18];
  v13 = +[MTPObjectProperty objectPropertyWithPropertyCode:56329 andDataType:0xFFFFLL];
  [v13 setFormFlag:3];
  [(NSMutableArray *)self->_objectDescriptionDataset addObject:v13];
  v14 = self->_objectDescriptionDataset;
  id v15 = +[MTPObjectProperty objectPropertyWithPropertyCode:56331 andDataType:6];
  [(NSMutableArray *)v14 addObject:v15];

  __int16 v16 = self->_objectDescriptionDataset;
  v17 = +[MTPObjectProperty objectPropertyWithPropertyCode:56385 andDataType:10];
  [(NSMutableArray *)v16 addObject:v17];
}

- (void)vendPhotoStorage
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C714;
  block[3] = &unk_100048750;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)removePlaceholderStorage
{
  if ([(PTPVirtualCamera *)self visibleStorage:self->_placeholderStorage])
  {
    [(PTPVirtualCamera *)self sendEventRemoveStorageWithID:[(PTPStorage *)self->_placeholderStorage storageID]];
    uint64_t v3 = [(PTPStorage *)self->_placeholderStorage storageID];
    [(PTPVirtualCamera *)self removeStorageWithID:v3];
  }
}

- (void)preparePhotoStorage
{
  __ICOSLogCreate();
  uint64_t v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v4 = [&stru_100048E60 substringWithRange:0, 18];
    uint64_t v3 = [v4 stringByAppendingString:@".."];
  }
  id v5 = +[NSString stringWithFormat:@"Prepare Photo Storage"];
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v3;
    id v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v25 = [(__CFString *)v7 UTF8String];
    __int16 v26 = 2114;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  v9 = [(PTPVirtualCamera *)self photoStorage];

  if (!v9)
  {
    if ([(PTPVirtualCamera *)self hostSupportsGroups])
    {
      v10 = [[PTPStorage alloc] initWithParent:self andOptionalID:0 forSessionID:[(PTPVirtualCamera *)self currentInternalSessionID]];
      [(PTPVirtualCamera *)self setPhotoStorage:v10];
      __ICOSLogCreate();
      uint64_t v11 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        v12 = [&stru_100048E60 substringWithRange:0, 18];
        uint64_t v11 = [v12 stringByAppendingString:@".."];
      }
      v13 = +[NSString stringWithFormat:@"Group Storage Available: 0x%x \n", [(PTPStorage *)v10 storageID]];
      v14 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v11;
        __int16 v16 = v14;
        id v17 = [(__CFString *)v15 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v25 = v17;
        __int16 v26 = 2114;
        v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      notify_post("com.apple.ptpd.photoStorageChanged");
      storageEnumerationQ = self->_storageEnumerationQ;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000CCDC;
      block[3] = &unk_100048750;
      v23 = v10;
      dispatch_queue_t v19 = v10;
      dispatch_async((dispatch_queue_t)storageEnumerationQ, block);
    }
    else
    {
      id v20 = self->_storageEnumerationQ;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000CCE4;
      v21[3] = &unk_100048750;
      v21[4] = self;
      dispatch_async((dispatch_queue_t)v20, v21);
    }
  }
}

- (void)resetPhotoStorage
{
  __ICOSLogCreate();
  uint64_t v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v4 = [&stru_100048E60 substringWithRange:0, 18];
    uint64_t v3 = [v4 stringByAppendingString:@".."];
  }
  id v5 = +[NSString stringWithFormat:@"Reset Photo Storage"];
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v3;
    id v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v12 = [(__CFString *)v7 UTF8String];
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  storageEnumerationQ = self->_storageEnumerationQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D310;
  block[3] = &unk_100048750;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)storageEnumerationQ, block);
}

- (void)handleInternalSettingsChanged
{
  [(PTPVirtualCamera *)self setCurrentInternalSessionID:sub_1000026C8()];
  [(PTPStorage *)self->_placeholderStorage setSessionID:[(PTPVirtualCamera *)self currentInternalSessionID]];
  [(PTPSecurityModel *)self->_ptpSecurityModel setSessionID:[(PTPVirtualCamera *)self currentInternalSessionID]];

  [(PTPVirtualCamera *)self resetPhotoStorage];
}

- (id)photoStorageAvailable
{
  id v2 = [(PTPVirtualCamera *)self photoStorage];

  return +[NSNumber numberWithBool:v2 != 0];
}

- (BOOL)visibleStorage:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 storageID];
  storages = self->_storages;
  v6 = +[NSNumber numberWithUnsignedInt:v4];
  uint64_t v7 = [(NSMutableDictionary *)storages objectForKey:v6];
  BOOL v8 = v7 != 0;

  return v8;
}

- (void)addStorage:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_storages count] == (id)1)
  {
    __ICOSLogCreate();
    id v5 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      v6 = [&stru_100048E60 substringWithRange:0, 18];
      id v5 = [v6 stringByAppendingString:@".."];
    }
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Storage 0x%x is being added", [v4 storageID]);
    BOOL v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v5;
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      id v35 = [(__CFString *)v9 UTF8String];
      __int16 v36 = 2114;
      v37 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    __ICOSLogCreate();
    uint64_t v11 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      id v12 = [&stru_100048E60 substringWithRange:0, 18];
      uint64_t v11 = [v12 stringByAppendingString:@".."];
    }
    __int16 v13 = +[NSString stringWithFormat:@"Two storages cannot co-exist - should quit"];
    v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v11;
      __int16 v16 = v14;
      id v17 = [(__CFString *)v15 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v35 = v17;
      __int16 v36 = 2114;
      v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if (v4)
  {
    __ICOSLogCreate();
    id v18 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      dispatch_queue_t v19 = [&stru_100048E60 substringWithRange:0, 18];
      id v18 = [v19 stringByAppendingString:@".."];
    }
    id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Storage 0x%x is being added\n", [v4 storageID]);
    __int16 v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v18;
      v23 = v21;
      id v24 = [(__CFString *)v22 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v35 = v24;
      __int16 v36 = 2114;
      v37 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    storages = self->_storages;
    __int16 v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 storageID]);
    [(NSMutableDictionary *)storages setObject:v4 forKey:v26];

    __ICOSLogCreate();
    v27 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      v28 = [&stru_100048E60 substringWithRange:0, 18];
      v27 = [v28 stringByAppendingString:@".."];
    }
    v29 = +[NSString stringWithFormat:@"Storage count is now: %lu\n", [(NSMutableDictionary *)self->_storages count]];
    v30 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v27;
      v32 = v30;
      id v33 = [(__CFString *)v31 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v35 = v33;
      __int16 v36 = 2114;
      v37 = v29;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

- (void)sendEventAddStorageWithID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  __ICOSLogCreate();
  id v5 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v6 = [&stru_100048E60 substringWithRange:0, 18];
    id v5 = [v6 stringByAppendingString:@".."];
  }
  uint64_t v7 = +[NSString stringWithFormat:@"Add Storage: 0x%x\n", v3];
  BOOL v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v5;
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    id v15 = [(__CFString *)v9 UTF8String];
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v11 = +[NSNumber numberWithInt:v3];
  SEL v12 = NSSelectorFromString(@"reportStorageAdded:");
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained performSelector:v12 withObject:v11];
}

- (BOOL)removeStorageWithID:(unsigned int)a3
{
  id v4 = [(PTPVirtualCamera *)self storageWithID:*(void *)&a3];
  if (v4)
  {
    __ICOSLogCreate();
    id v5 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      v6 = [&stru_100048E60 substringWithRange:0, 18];
      id v5 = [v6 stringByAppendingString:@".."];
    }
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Storage 0x%x is being removed", [v4 storageID]);
    BOOL v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v5;
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      id v22 = [(__CFString *)v9 UTF8String];
      __int16 v23 = 2114;
      id v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    storages = self->_storages;
    SEL v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 storageID]);
    [(NSMutableDictionary *)storages removeObjectForKey:v12];

    __ICOSLogCreate();
    __int16 v13 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      v14 = [&stru_100048E60 substringWithRange:0, 18];
      __int16 v13 = [v14 stringByAppendingString:@".."];
    }
    id v15 = +[NSString stringWithFormat:@"Storage count is now: %lu", [(NSMutableDictionary *)self->_storages count]];
    __int16 v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v13;
      id v18 = v16;
      id v19 = [(__CFString *)v17 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v22 = v19;
      __int16 v23 = 2114;
      id v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }

  return v4 != 0;
}

- (void)sendEventRemoveStorageWithID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = -[PTPVirtualCamera storageWithID:](self, "storageWithID:");

  if (v5)
  {
    __ICOSLogCreate();
    v6 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      uint64_t v7 = [&stru_100048E60 substringWithRange:0, 18];
      v6 = [v7 stringByAppendingString:@".."];
    }
    BOOL v8 = +[NSString stringWithFormat:@"Remove Storage: 0x%x\n", v3];
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v6;
      uint64_t v11 = v9;
      *(_DWORD *)buf = 136446466;
      id v16 = [(__CFString *)v10 UTF8String];
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    SEL v12 = +[NSNumber numberWithInt:v3];
    SEL v13 = NSSelectorFromString(@"reportStorageDeleted:");
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained performSelector:v13 withObject:v12];
  }
}

- (void)removeStorages
{
  storages = self->_storages;
  if (storages)
  {
    v27 = self;
    [(NSMutableDictionary *)storages allValues];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v32;
      uint64_t v7 = &stru_100048E60;
      BOOL v8 = &CFDataDeleteBytes_ptr;
      CFStringRef v9 = @" Removing Storage: 0x%x";
      v10 = (os_log_t *)&_gICOSLog;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v32 != v6) {
            objc_enumerationMutation(obj);
          }
          SEL v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          __ICOSLogCreate();
          id v30 = v7;
          if ((unint64_t)[(__CFString *)v7 length] >= 0x15)
          {
            SEL v13 = -[__CFString substringWithRange:](v7, "substringWithRange:", 0, 18);
            id v30 = [v13 stringByAppendingString:@".."];
          }
          v14 = [v8[185] stringWithFormat:v9, [v12 storageID]];
          os_log_t v15 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            v29 = v12;
            id v16 = v10;
            __int16 v17 = v7;
            id v18 = v5;
            uint64_t v19 = v6;
            CFStringRef v20 = v9;
            __int16 v21 = v8;
            id v22 = v30;
            __int16 v23 = v15;
            id v24 = v22;
            BOOL v8 = v21;
            CFStringRef v9 = v20;
            uint64_t v6 = v19;
            id v5 = v18;
            uint64_t v7 = v17;
            v10 = v16;
            SEL v12 = v29;
            id v25 = [v24 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v36 = v25;
            __int16 v37 = 2114;
            v38 = v14;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          [v12 setParent:0];
        }
        id v5 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v5);
    }
    [(NSMutableDictionary *)v27->_storages removeAllObjects];
    __int16 v26 = v27->_storages;
    v27->_storages = 0;
  }
}

- (void)sendEventDeviceUnlocked
{
  SEL v3 = NSSelectorFromString(@"sendEventDeviceUnlocked");
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained performSelector:v3];
}

- (id)overrideCapabilities
{
  if (sub_100002670())
  {
    __ICOSLogCreate();
    id v2 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      SEL v3 = [&stru_100048E60 substringWithRange:0, 18];
      id v2 = [v3 stringByAppendingString:@".."];
    }
    id v4 = +[NSString stringWithFormat:@"Internal Setting - Capabilities Override"];
    id v5 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v2;
      uint64_t v7 = v5;
      int v52 = 136446466;
      id v53 = [(__CFString *)v6 UTF8String];
      __int16 v54 = 2114;
      v55 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);
    }
    BOOL v8 = +[NSMutableDictionary dictionary];
    if (sub_100002670())
    {
      [v8 setObject:&off_100050710 forKeyedSubscript:@"HEIC"];
      __ICOSLogCreate();
      CFStringRef v9 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        v10 = [&stru_100048E60 substringWithRange:0, 18];
        CFStringRef v9 = [v10 stringByAppendingString:@".."];
      }
      uint64_t v11 = +[NSString stringWithFormat:@"   ++ Received HEIC"];
      SEL v12 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        SEL v13 = v9;
        v14 = v12;
        id v15 = [(__CFString *)v13 UTF8String];
        int v52 = 136446466;
        id v53 = v15;
        __int16 v54 = 2114;
        v55 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);
      }
      __ICOSLogCreate();
      id v16 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        __int16 v17 = [&stru_100048E60 substringWithRange:0, 18];
        id v16 = [v17 stringByAppendingString:@".."];
      }
      id v18 = +[NSString stringWithFormat:@"   -> Adding ptp.heic"];
      uint64_t v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v20 = v16;
        __int16 v21 = v19;
        id v22 = [(__CFString *)v20 UTF8String];
        int v52 = 136446466;
        id v53 = v22;
        __int16 v54 = 2114;
        v55 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);
      }
    }
    if (sub_100002670())
    {
      [v8 setObject:&off_100050710 forKeyedSubscript:@"HEICS"];
      __ICOSLogCreate();
      __int16 v23 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        id v24 = [&stru_100048E60 substringWithRange:0, 18];
        __int16 v23 = [v24 stringByAppendingString:@".."];
      }
      id v25 = +[NSString stringWithFormat:@"   ++ Received HEICS"];
      __int16 v26 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v23;
        v28 = v26;
        id v29 = [(__CFString *)v27 UTF8String];
        int v52 = 136446466;
        id v53 = v29;
        __int16 v54 = 2114;
        v55 = v25;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);
      }
      __ICOSLogCreate();
      id v30 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        long long v31 = [&stru_100048E60 substringWithRange:0, 18];
        id v30 = [v31 stringByAppendingString:@".."];
      }
      long long v32 = +[NSString stringWithFormat:@"   -> Adding ptp.heics"];
      long long v33 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        long long v34 = v30;
        id v35 = v33;
        id v36 = [(__CFString *)v34 UTF8String];
        int v52 = 136446466;
        id v53 = v36;
        __int16 v54 = 2114;
        v55 = v32;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);
      }
    }
    if (sub_100002670())
    {
      [v8 setObject:&off_100050710 forKeyedSubscript:@"HEVC"];
      __ICOSLogCreate();
      __int16 v37 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        v38 = [&stru_100048E60 substringWithRange:0, 18];
        __int16 v37 = [v38 stringByAppendingString:@".."];
      }
      v39 = +[NSString stringWithFormat:@"   ++ Received HEVC"];
      v40 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v37;
        v42 = v40;
        id v43 = [(__CFString *)v41 UTF8String];
        int v52 = 136446466;
        id v53 = v43;
        __int16 v54 = 2114;
        v55 = v39;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);
      }
      __ICOSLogCreate();
      v44 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        v45 = [&stru_100048E60 substringWithRange:0, 18];
        v44 = [v45 stringByAppendingString:@".."];
      }
      v46 = +[NSString stringWithFormat:@"   -> Adding ptp.hevc"];
      v47 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v48 = v44;
        v49 = v47;
        id v50 = [(__CFString *)v48 UTF8String];
        int v52 = 136446466;
        id v53 = v50;
        __int16 v54 = 2114;
        v55 = v46;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)willOverrideCapabilities
{
  SEL v3 = [(PTPVirtualCamera *)self overrideCapabilities];
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = objc_opt_new();
  id v5 = sub_10000B5F8();
  uint64_t v6 = +[NSMutableDictionary dictionary];
  uint64_t v7 = +[NSMutableArray array];
  BOOL v8 = [v3 objectForKeyedSubscript:@"HEIC"];
  if (v8)
  {

LABEL_5:
    uint64_t v13 = _UTTypeHEIFStandard;
    v10 = +[NSArray arrayWithObjects:&v13 count:1];
    [v6 setObject:v10 forKeyedSubscript:PFMediaCapabilitiesOutOfBandHintsExtraSupportedContentTypesKey];

    [v7 addObjectsFromArray:&off_100053740];
    goto LABEL_6;
  }
  CFStringRef v9 = [v3 objectForKeyedSubscript:@"HEICS"];

  if (v9) {
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v11 = [v3 objectForKeyedSubscript:@"HEVC"];

  if (v11)
  {
    [v6 setObject:&off_100053758 forKeyedSubscript:PFMediaCapabilitiesOutOfBandHintsExtraSupportedVideoCodecsKey];
    [v7 addObjectsFromArray:&off_100053770];
  }
  [v4 setOutOfBandHints:v6];
  [v5 setPeerMediaCapabilities:v4];
  [(NSMutableArray *)self->_hostMediaSupportedFormats addObjectsFromArray:v7];

LABEL_9:
  return v3 != 0;
}

- (void)assignHostMediaCapabilities:(id)a3
{
  id v4 = a3;
  if (![(PTPVirtualCamera *)self willOverrideCapabilities])
  {
    if (v4)
    {
      id v5 = [objc_alloc((Class)PFMediaCapabilities) initWithOpaqueRepresentation:v4];
      if (v5)
      {
        uint64_t v6 = sub_10000B5F8();
        [v6 setPeerMediaCapabilities:v5];

        CFStringRef v7 = @"Set";
      }
      else
      {
        CFStringRef v7 = @"Failed";
      }
    }
    else
    {
      sub_10000B5F8();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [v5 setPeerMediaCapabilities:0];
      CFStringRef v7 = @"Cleared";
    }

    __ICOSLogCreate();
    BOOL v8 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      CFStringRef v9 = [&stru_100048E60 substringWithRange:0, 18];
      BOOL v8 = [v9 stringByAppendingString:@".."];
    }
    v10 = +[NSString stringWithFormat:@"PFMediaCapabilities: %@", v7];
    uint64_t v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      SEL v12 = v8;
      uint64_t v13 = v11;
      *(_DWORD *)buf = 136446466;
      id v15 = [(__CFString *)v12 UTF8String];
      __int16 v16 = 2114;
      __int16 v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

- (void)assignHostSupportedFormats:(id)a3
{
  id v4 = a3;
  if (![(PTPVirtualCamera *)self willOverrideCapabilities])
  {
    __ICOSLogCreate();
    id v5 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      uint64_t v6 = [&stru_100048E60 substringWithRange:0, 18];
      id v5 = [v6 stringByAppendingString:@".."];
    }
    CFStringRef v7 = +[NSString stringWithFormat:@"Assigning Host Supported Formats"];
    BOOL v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = v5;
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      id v50 = [(__CFString *)v9 UTF8String];
      __int16 v51 = 2114;
      int v52 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    id v11 = v4;
    v47 = (unsigned __int16 *)[v11 bytes];
    id v12 = v11;
    uint64_t v13 = sub_10001F44C(&v47, (unint64_t)[v12 length] + (void)objc_msgSend(v12, "bytes"));
    if (v13)
    {
      v14 = objc_opt_new();
      v46 = sub_10000B5F8();
      id v15 = +[NSMutableArray array];
      __int16 v16 = +[NSMutableDictionary dictionary];
      if (([v13 containsObject:&off_100050740] & 1) != 0
        || [v13 containsObject:&off_100050758])
      {
        uint64_t v48 = _UTTypeHEIFStandard;
        __int16 v17 = +[NSArray arrayWithObjects:&v48 count:1];
        [v16 setObject:v17 forKeyedSubscript:PFMediaCapabilitiesOutOfBandHintsExtraSupportedContentTypesKey];

        __ICOSLogCreate();
        id v18 = &stru_100048E60;
        if ((unint64_t)[&stru_100048E60 length] >= 0x15)
        {
          uint64_t v19 = [&stru_100048E60 substringWithRange:0, 18];
          id v18 = [v19 stringByAppendingString:@".."];
        }
        CFStringRef v20 = +[NSString stringWithFormat:@"   ++ Received HEIC (0xB401,0xB402)"];
        __int16 v21 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = v18;
          __int16 v23 = v21;
          id v24 = [(__CFString *)v22 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v50 = v24;
          __int16 v51 = 2114;
          int v52 = v20;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        __ICOSLogCreate();
        id v25 = &stru_100048E60;
        if ((unint64_t)[&stru_100048E60 length] >= 0x15)
        {
          __int16 v26 = [&stru_100048E60 substringWithRange:0, 18];
          id v25 = [v26 stringByAppendingString:@".."];
        }
        v27 = +[NSString stringWithFormat:@"   -> Adding _UTTypeHEIFStandard"];
        v28 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = v25;
          id v30 = v28;
          id v31 = [(__CFString *)v29 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v50 = v31;
          __int16 v51 = 2114;
          int v52 = v27;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        [v15 addObjectsFromArray:&off_100053788];
      }
      if ([v13 containsObject:&off_100050770])
      {
        [v16 setObject:&off_1000537A0 forKeyedSubscript:PFMediaCapabilitiesOutOfBandHintsExtraSupportedVideoCodecsKey];
        __ICOSLogCreate();
        long long v32 = &stru_100048E60;
        if ((unint64_t)[&stru_100048E60 length] >= 0x15)
        {
          long long v33 = [&stru_100048E60 substringWithRange:0, 18];
          long long v32 = [v33 stringByAppendingString:@".."];
        }
        long long v34 = +[NSString stringWithFormat:@"   ++ Received HEVC (0xB421)"];
        id v35 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = v32;
          __int16 v37 = v35;
          id v38 = [(__CFString *)v36 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v50 = v38;
          __int16 v51 = 2114;
          int v52 = v34;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        __ICOSLogCreate();
        v39 = &stru_100048E60;
        if ((unint64_t)[&stru_100048E60 length] >= 0x15)
        {
          v40 = [&stru_100048E60 substringWithRange:0, 18];
          v39 = [v40 stringByAppendingString:@".."];
        }
        v41 = +[NSString stringWithFormat:@"   -> Adding kCMVideoCodecType_HEVC"];
        v42 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v43 = v39;
          v44 = v42;
          id v45 = [(__CFString *)v43 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v50 = v45;
          __int16 v51 = 2114;
          int v52 = v41;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        [v15 addObjectsFromArray:&off_1000537B8];
      }
      [v14 setOutOfBandHints:v16];
      [v46 setPeerMediaCapabilities:v14];
      [(NSMutableArray *)self->_hostMediaSupportedFormats addObjectsFromArray:v15];
    }
  }
}

- (void)installSecurity
{
  if (self->_ptpSecurityModel) {
    [(PTPVirtualCamera *)self removeSecurity];
  }
  SEL v3 = objc_alloc_init(PTPSecurityModel);
  ptpSecurityModel = self->_ptpSecurityModel;
  self->_ptpSecurityModel = v3;

  [(PTPSecurityModel *)self->_ptpSecurityModel setDelegate:self];
  id v5 = self->_ptpSecurityModel;

  [(PTPSecurityModel *)v5 start];
}

- (void)removeSecurity
{
  if (self->_ptpSecurityModel)
  {
    __ICOSLogCreate();
    SEL v3 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      id v4 = [&stru_100048E60 substringWithRange:0, 18];
      SEL v3 = [v4 stringByAppendingString:@".."];
    }
    id v5 = +[NSString stringWithFormat:@"Removing Security"];
    uint64_t v6 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = v3;
      BOOL v8 = v6;
      int v10 = 136446466;
      id v11 = [(__CFString *)v7 UTF8String];
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);
    }
    [(PTPSecurityModel *)self->_ptpSecurityModel stop];
    [(PTPSecurityModel *)self->_ptpSecurityModel setDelegate:0];
    ptpSecurityModel = self->_ptpSecurityModel;
    self->_ptpSecurityModel = 0;
  }
}

- (void)openSession
{
  [(PTPVirtualCamera *)self installSecurity];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F750;
  v3[3] = &unk_100048750;
  v3[4] = self;
  [(PTPVirtualCamera *)self setupStorageAfterTimeout:v3];
}

- (void)setupStorageAfterTimeout:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(PTPVirtualCamera *)self storageTimer];

  if (v5)
  {
    __ICOSLogCreate();
    uint64_t v6 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      CFStringRef v7 = [&stru_100048E60 substringWithRange:0, 18];
      uint64_t v6 = [v7 stringByAppendingString:@".."];
    }
    BOOL v8 = +[NSString stringWithFormat:@"==|Session Continuation|== Storages Untouched"];
    CFStringRef v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v6;
      id v11 = v9;
      int v13 = 136446466;
      id v14 = [(__CFString *)v10 UTF8String];
      __int16 v15 = 2114;
      __int16 v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v13, 0x16u);
    }
    __int16 v12 = [(PTPVirtualCamera *)self storageTimer];
    dispatch_source_cancel(v12);
  }
  else
  {
    v4[2](v4);
  }
}

- (void)closeSession
{
  [(PTPVirtualCamera *)self removeSecurity];
  unsigned int v3 = [(PTPVirtualCamera *)self hostIsWindows];
  double v4 = 3.0;
  if (v3) {
    double v4 = 0.0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FE7C;
  v13[3] = &unk_100048750;
  v13[4] = self;
  [(PTPVirtualCamera *)self cleanupStorageAfterTimeout:v13 cleanup:v4];
  id v5 = sub_10000B5F8();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    __ICOSLogCreate();
    uint64_t v6 = @"challenge";
    if ((unint64_t)[@"challenge" length] >= 0x15)
    {
      CFStringRef v7 = [@"challenge" substringWithRange:0, 18];
      uint64_t v6 = [v7 stringByAppendingString:@".."];
    }
    BOOL v8 = +[NSString stringWithFormat:@"🔐 Host closed all sessions -- requesting auth challenge dismissal"];
    CFStringRef v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v6;
      id v11 = v9;
      id v12 = [(__CFString *)v10 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v15 = v12;
      __int16 v16 = 2114;
      __int16 v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [v5 performSelector:"ptpCloseSession"];
  }
}

- (void)cleanupStorageAfterTimeout:(double)a3 cleanup:(id)a4
{
  id v6 = a4;
  __ICOSLogCreate();
  CFStringRef v7 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    BOOL v8 = [&stru_100048E60 substringWithRange:0, 18];
    CFStringRef v7 = [v8 stringByAppendingString:@".."];
  }
  CFStringRef v9 = +[NSString stringWithFormat:@"Cleanup Storages (CloseSession)"];
  int v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v7;
    id v12 = v10;
    *(_DWORD *)buf = 136446466;
    id v26 = [(__CFString *)v11 UTF8String];
    __int16 v27 = 2114;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  int v13 = [(PTPVirtualCamera *)self storageTimer];

  if (!v13)
  {
    id v14 = dispatch_get_global_queue(0, 0);
    [(PTPVirtualCamera *)self setStorageTimerQ:v14];

    id v15 = [(PTPVirtualCamera *)self storageTimerQ];
    dispatch_source_t v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v15);
    [(PTPVirtualCamera *)self setStorageTimer:v16];

    __int16 v17 = [(PTPVirtualCamera *)self storageTimer];
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    uint64_t v19 = [(PTPVirtualCamera *)self storageTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100010238;
    handler[3] = &unk_100048828;
    handler[4] = self;
    id v24 = v6;
    dispatch_source_set_event_handler(v19, handler);

    CFStringRef v20 = [(PTPVirtualCamera *)self storageTimer];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000103B4;
    v22[3] = &unk_100048750;
    v22[4] = self;
    dispatch_source_set_cancel_handler(v20, v22);

    __int16 v21 = [(PTPVirtualCamera *)self storageTimer];
    dispatch_resume(v21);
  }
}

- (void)startObservers
{
  __ICOSLogCreate();
  unsigned int v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    double v4 = [&stru_100048E60 substringWithRange:0, 18];
    unsigned int v3 = [v4 stringByAppendingString:@".."];
  }
  id v5 = +[NSString stringWithFormat:@"Install Device Status Observers"];
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = v3;
    BOOL v8 = v6;
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = [(__CFString *)v7 UTF8String];
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if (!self->_notificationObserversInstalled)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v23 = sub_10001088C;
    id v24 = sub_10001089C;
    CFStringRef v9 = self;
    id v25 = v9;
    int v10 = (const char *)[kLockdownNotificationDeviceNameChanged cStringUsingEncoding:4];
    id v11 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000108A4;
    handler[3] = &unk_100048850;
    handler[4] = buf;
    notify_register_dispatch(v10, &v9->_nameChangeToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    self->_notificationObserversInstalled = 1;
    __ICOSLogCreate();
    if ((unint64_t)[&stru_100048E60 length] < 0x15)
    {
      int v13 = &stru_100048E60;
    }
    else
    {
      id v12 = [&stru_100048E60 substringWithRange:0, 18];
      int v13 = [v12 stringByAppendingString:@".."];
    }
    id v14 = +[NSString stringWithFormat:@"Observers Installed"];
    id v15 = (id)_gICOSLog;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(__CFString *)v13 UTF8String];
      *(_DWORD *)dispatch_time_t v18 = 136446466;
      id v19 = v16;
      __int16 v20 = 2114;
      __int16 v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v18, 0x16u);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)provokeSecurityCheck
{
  __ICOSLogCreate();
  unsigned int v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    double v4 = [&stru_100048E60 substringWithRange:0, 18];
    unsigned int v3 = [v4 stringByAppendingString:@".."];
  }
  id v5 = +[NSString stringWithFormat:@"Provoke Security Probe"];
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = v3;
    BOOL v8 = v6;
    int v9 = 136446466;
    id v10 = [(__CFString *)v7 UTF8String];
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(PTPSecurityModel *)self->_ptpSecurityModel handleProtectionStatusChanged:5];
}

- (void)stopObservers
{
  __ICOSLogCreate();
  unsigned int v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    double v4 = [&stru_100048E60 substringWithRange:0, 18];
    unsigned int v3 = [v4 stringByAppendingString:@".."];
  }
  id v5 = +[NSString stringWithFormat:@"Releasing Security Model"];
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = v3;
    BOOL v8 = v6;
    int v16 = 136446466;
    id v17 = [(__CFString *)v7 UTF8String];
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (self->_notificationObserversInstalled)
  {
    __ICOSLogCreate();
    int v9 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      id v10 = [&stru_100048E60 substringWithRange:0, 18];
      int v9 = [v10 stringByAppendingString:@".."];
    }
    __int16 v11 = +[NSString stringWithFormat:@"Removing Device Status Observers"];
    id v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = v9;
      id v14 = v12;
      id v15 = [(__CFString *)v13 UTF8String];
      int v16 = 136446466;
      id v17 = v15;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v16, 0x16u);
    }
    notify_cancel(self->_nameChangeToken);
    self->_notificationObserversInstalled = 0;
  }
}

- (id)storageWithID:(unsigned int)a3
{
  [(NSMutableDictionary *)self->_storages allValues];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "objectHandle", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)objectForObjectHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_storages allValues];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = 0;
    while (1)
    {
      BOOL v8 = [v5 objectAtIndex:v7];
      uint64_t v9 = [v8 cameraFolderWithObjectID:[v4 unsignedIntValue]];
      if (v9) {
        break;
      }
      uint64_t v9 = [v8 cameraFileWithObjectID:[v4 unsignedIntValue]];
      if (v9) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_6;
      }
    }
    id v10 = (void *)v9;
  }
  else
  {
LABEL_6:
    id v10 = 0;
  }

  return v10;
}

- (id)allStorages
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_storages allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_storages objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allStorageIDs
{
  return [(NSMutableDictionary *)self->_storages allKeys];
}

- (id)objectHandlesInStorage:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 responseCode:(unsigned __int16 *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  uint64_t v9 = *(void *)&a3;
  long long v11 = +[NSMutableArray arrayWithCapacity:0];
  *a6 = 8193;
  if (v9 == -1)
  {
    long long v14 = [(PTPVirtualCamera *)self allStorages];
    uint64_t v16 = [v14 count];
    if (v16)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        __int16 v18 = [v14 objectAtIndex:i];
        id v19 = [v18 objectHandlesForObjectFormatCode:v8 inAssociation:v7];
        [v11 addObjectsFromArray:v19];
      }
    }
  }
  else
  {
    storages = self->_storages;
    long long v13 = +[NSNumber numberWithUnsignedInt:v9];
    long long v14 = [(NSMutableDictionary *)storages objectForKey:v13];

    if (v14)
    {
      long long v15 = [v14 objectHandlesForObjectFormatCode:v8 inAssociation:v7];
      [v11 addObjectsFromArray:v15];
    }
    else
    {
      *a6 = 8200;
    }
  }

  return v11;
}

- (id)objectInfoForObjectsInStorage:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(int)a6 responseCode:(unsigned __int16 *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = a4;
  uint64_t v11 = *(void *)&a3;
  long long v13 = +[NSMutableData data];
  *a7 = 8193;
  if (v11 == -1)
  {
    *a7 = 8200;
  }
  else
  {
    storages = self->_storages;
    long long v15 = +[NSNumber numberWithUnsignedInt:v11];
    uint64_t v16 = [(NSMutableDictionary *)storages objectForKey:v15];

    if (v16) {
      [v16 appendObjectData:v13 forObjectFormatCode:v10 inAssociation:v9 withContentType:v8];
    }
    else {
      *a7 = 8200;
    }
  }
  if (![v13 length])
  {
    int v18 = 0;
    [v13 appendBytes:&v18 length:4];
  }

  return v13;
}

- (id)pathObjectInfoForObjectsInStorage:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(int)a6 responseCode:(unsigned __int16 *)a7
{
  uint64_t v10 = a4;
  uint64_t v11 = *(void *)&a3;
  long long v13 = NSTemporaryDirectory();
  long long v14 = +[NSString stringWithFormat:@"%@%@", v13, @"ptpObjects"];

  id v15 = v14;
  uint64_t v16 = open((const char *)[v15 fileSystemRepresentation], 514, 33152);
  if (v16 == -1)
  {

    id v29 = 0;
  }
  else
  {
    uint64_t v17 = v16;
    unsigned int v38 = a5;
    unsigned int v39 = a6;
    __ICOSLogCreate();
    int v18 = @"objectInfos";
    if ((unint64_t)[@"objectInfos" length] >= 0x15)
    {
      id v19 = [@"objectInfos" substringWithRange:0, 18];
      int v18 = [v19 stringByAppendingString:@".."];
    }
    __int16 v20 = +[NSString stringWithFormat:@"Created temporary file at: %@ -- fd: %d", v15, v17];
    __int16 v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v18;
      __int16 v23 = v21;
      buf.st_dev = 136446466;
      *(void *)&buf.st_mode = [(__CFString *)v22 UTF8String];
      WORD2(buf.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
    }
    id v24 = [[PTPWrappedBytes alloc] initWithFileDescriptor:v17 capacity:209715200];
    *a7 = 8193;
    if (v11 == -1)
    {
      *a7 = 8200;
      v28 = &CFDataDeleteBytes_ptr;
    }
    else
    {
      storages = self->_storages;
      id v26 = +[NSNumber numberWithUnsignedInt:v11];
      __int16 v27 = [(NSMutableDictionary *)storages objectForKey:v26];

      v28 = &CFDataDeleteBytes_ptr;
      if (v27) {
        [v27 appendObjectData:v24 forObjectFormatCode:v10 inAssociation:v38 withContentType:v39];
      }
      else {
        *a7 = 8200;
      }
    }
    if (![(PTPWrappedBytes *)v24 length])
    {
      buf.st_dev = 0;
      [(PTPWrappedBytes *)v24 appendBytes:&buf length:4];
    }
    memset(&buf, 0, sizeof(buf));
    id v29 = v15;
    lstat((const char *)[v29 fileSystemRepresentation], &buf);
    off_t st_size = buf.st_size;
    __ICOSLogCreate();
    id v31 = @"objectInfos";
    if ((unint64_t)[@"objectInfos" length] >= 0x15)
    {
      long long v32 = [@"objectInfos" substringWithRange:0, 18];
      id v31 = [v32 stringByAppendingString:@".."];
    }
    long long v33 = [[v28[185] stringWithFormat:@"Output size: %llu", st_size];
    long long v34 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = v31;
      id v36 = v34;
      *(_DWORD *)v40 = 136446466;
      id v41 = [(__CFString *)v35 UTF8String];
      __int16 v42 = 2114;
      id v43 = v33;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v40, 0x16u);
    }
    close(v17);
  }

  return v29;
}

- (id)objectInfoForNextObjectGroupInStorage:(unsigned int)a3 responseCode:(unsigned __int16 *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = +[NSMutableData data];
  uint64_t v72 = 0;
  [v7 appendBytes:&v72 length:8];
  *a4 = 8193;
  __ICOSLogCreate();
  uint64_t v8 = &CFDataDeleteBytes_ptr;
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v9 = @"0x900f";
    if ((unint64_t)[@"0x900f" length] >= 0x15)
    {
      uint64_t v10 = [@"0x900f" substringWithRange:0, 18];
      uint64_t v9 = [v10 stringByAppendingString:@".."];
    }
    uint64_t v11 = +[NSString stringWithFormat:@"objectInfoForObjectsInStorage"];
    long long v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = v9;
      long long v14 = v12;
      id v15 = v13;
      uint64_t v8 = &CFDataDeleteBytes_ptr;
      id v16 = [(__CFString *)v15 UTF8String];
      *(_DWORD *)stat buf = 136446466;
      id v75 = v16;
      __int16 v76 = 2114;
      v77 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  __ICOSLogCreate();
  if (v5 == -1)
  {
    int v52 = @"0x900f";
    if ((unint64_t)[@"0x900f" length] >= 0x15)
    {
      id v53 = [@"0x900f" substringWithRange:0, 18];
      int v52 = [v53 stringByAppendingString:@".."];
    }
    __int16 v54 = +[NSString stringWithFormat:@"couldn't find storage"];
    v55 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100030A04(v52, v55);
    }

    *a4 = 8200;
  }
  else
  {
    if (__ICLogTypeEnabled(4))
    {
      uint64_t v17 = @"0x900f";
      if ((unint64_t)[@"0x900f" length] >= 0x15)
      {
        int v18 = [@"0x900f" substringWithRange:0, 18];
        uint64_t v17 = [v18 stringByAppendingString:@".."];
      }
      id v19 = +[NSString stringWithFormat:@"storageID: %x", v5];
      __int16 v20 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = v17;
        id v22 = v20;
        __int16 v23 = v21;
        uint64_t v8 = &CFDataDeleteBytes_ptr;
        id v24 = [(__CFString *)v23 UTF8String];
        *(_DWORD *)stat buf = 136446466;
        id v75 = v24;
        __int16 v76 = 2114;
        v77 = v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      id v25 = @"0x900f";
      if ((unint64_t)[@"0x900f" length] >= 0x15)
      {
        id v26 = [@"0x900f" substringWithRange:0, 18];
        id v25 = [v26 stringByAppendingString:@".."];
      }
      __int16 v27 = +[NSString stringWithFormat:@"storages: %@", self->_storages];
      v28 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = v25;
        id v30 = v28;
        id v31 = v29;
        uint64_t v8 = &CFDataDeleteBytes_ptr;
        id v32 = [(__CFString *)v31 UTF8String];
        *(_DWORD *)stat buf = 136446466;
        id v75 = v32;
        __int16 v76 = 2114;
        v77 = v27;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    storages = self->_storages;
    long long v34 = +[NSNumber numberWithUnsignedInt:v5];
    id v35 = [(NSMutableDictionary *)storages objectForKey:v34];

    __ICOSLogCreate();
    if (v35)
    {
      if (__ICLogTypeEnabled(4))
      {
        id v36 = @"0x900f";
        if ((unint64_t)[@"0x900f" length] >= 0x15)
        {
          __int16 v37 = [@"0x900f" substringWithRange:0, 18];
          id v36 = [v37 stringByAppendingString:@".."];
        }
        unsigned int v38 = +[NSString stringWithFormat:@"found storage"];
        unsigned int v39 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v36;
          id v41 = v39;
          id v42 = [(__CFString *)v40 UTF8String];
          *(_DWORD *)stat buf = 136446466;
          id v75 = v42;
          __int16 v76 = 2114;
          v77 = v38;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
      }
      [v35 dequeueGroup];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      id v44 = [v43 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v45; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v69 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            id v50 = -[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self, "objectInfoDatasetForObjectHandle:", [v48 integerValue]);
            __int16 v51 = [v50 content:2];
            [v7 appendData:v51];
            ++v72;
          }
          id v45 = [v43 countByEnumeratingWithState:&v68 objects:v73 count:16];
        }
        while (v45);
      }

      uint64_t v8 = &CFDataDeleteBytes_ptr;
    }
    else
    {
      uint64_t v56 = @"0x900f";
      if ((unint64_t)[@"0x900f" length] >= 0x15)
      {
        v57 = [@"0x900f" substringWithRange:0, 18];
        uint64_t v56 = [v57 stringByAppendingString:@".."];
      }
      v58 = +[NSString stringWithFormat:@"invalid storage"];
      v59 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
        sub_100030A04(v56, v59);
      }

      *a4 = 8200;
    }
  }
  __ICOSLogCreate();
  v60 = @"0x900f";
  if ((unint64_t)[@"0x900f" length] >= 0x15)
  {
    objc_super v61 = [@"0x900f" substringWithRange:0, 18];
    v60 = [v61 stringByAppendingString:@".."];
  }
  v62 = [v8[185] stringWithFormat:@"Sending %llu objects", v72];
  v63 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v64 = v60;
    v65 = v63;
    id v66 = [(__CFString *)v64 UTF8String];
    *(_DWORD *)stat buf = 136446466;
    id v75 = v66;
    __int16 v76 = 2114;
    v77 = v62;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [v7 replaceBytesInRange:0 withBytes:&v72];

  return v7;
}

- (id)objectInfosForObjectsInGroup:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(int)a6 responseCode:(unsigned __int16 *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = a4;
  uint64_t v11 = *(void *)&a3;
  long long v13 = +[NSMutableData data];
  *a7 = 8193;
  if (v11 == -1)
  {
    *a7 = 8200;
  }
  else
  {
    storages = self->_storages;
    id v15 = +[NSNumber numberWithUnsignedInt:v11];
    id v16 = [(NSMutableDictionary *)storages objectForKey:v15];

    if (v16) {
      [v16 appendObjectData:v13 forObjectFormatCode:v10 inAssociation:v9 withContentType:v8];
    }
    else {
      *a7 = 8200;
    }
  }
  if (![v13 length])
  {
    int v18 = 0;
    [v13 appendBytes:&v18 length:4];
  }

  return v13;
}

- (unsigned)numDownloadableObjects
{
  int v2 = sub_10000267C();
  int v3 = dword_10005E450;
  if (v2) {
    int v3 = 0;
  }
  return dword_10005E44C - v3;
}

- (unsigned)numAllObjects
{
  return dword_10005E454 + dword_10005E44C;
}

- (PTPDeviceInfoDataset)deviceInfoDataset
{
  return self->_deviceInfoDataset;
}

- (BOOL)hostIsWindows
{
  SEL v3 = NSSelectorFromString(@"usingMTP");
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(p_delegate);
  if (!WeakRetained) {
    return 0;
  }
  id v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    return 0;
  }
  id v9 = objc_loadWeakRetained(p_delegate);
  uint64_t v10 = [v9 performSelector:v3];

  if (!v10) {
    return 0;
  }
  unsigned __int8 v11 = [v10 BOOLValue];

  return v11;
}

- (BOOL)hostIsMacOS
{
  SEL v3 = NSSelectorFromString(@"usingMacOS");
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(p_delegate);
  if (!WeakRetained) {
    return 0;
  }
  id v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    return 0;
  }
  id v9 = objc_loadWeakRetained(p_delegate);
  uint64_t v10 = [v9 performSelector:v3];

  if (!v10) {
    return 0;
  }
  unsigned __int8 v11 = [v10 BOOLValue];

  return v11;
}

- (BOOL)hostIsLegacyOS
{
  SEL v3 = NSSelectorFromString(@"usingLegacyOS");
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(p_delegate);
  if (!WeakRetained) {
    return 0;
  }
  id v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    return 0;
  }
  id v9 = objc_loadWeakRetained(p_delegate);
  uint64_t v10 = [v9 performSelector:v3];

  if (!v10) {
    return 0;
  }
  unsigned __int8 v11 = [v10 BOOLValue];

  return v11;
}

- (id)devicePropDescDatasetForProperty:(unsigned __int16)a3
{
  if (a3 == 54018)
  {
    SEL v3 = objc_alloc_init(PTPDevicePropDescDataset);
    [(PTPDevicePropDescDataset *)v3 setDevicePropertyCode:54018];
    [(PTPDevicePropDescDataset *)v3 setDataTypeCode:10];
    [(PTPDevicePropDescDataset *)v3 setReadWriteAttribute:0];
    char v8 = [(PTPDeviceInfoDataset *)self->_deviceInfoDataset serialNumber];
    if ((unint64_t)[v8 length] < 4)
    {
      unsigned __int8 v11 = 0;
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = [v8 substringFromIndex:[v8 length] - 4];
      unsigned __int8 v11 = v10;
      if (v10)
      {
        uint64_t v10 = [v10 dataUsingEncoding:1 allowLossyConversion:1];
      }
    }
    id v12 = v10;
    long long v13 = (unsigned int *)[v12 bytes];
    if (v13) {
      uint64_t v14 = *v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = +[NSNumber numberWithUnsignedLongLong:v14];
    [(PTPDevicePropDescDataset *)v3 setFactoryDefaultValue:v15];

    id v16 = +[NSNumber numberWithUnsignedLongLong:v14];
    [(PTPDevicePropDescDataset *)v3 setCurrentValue:v16];

    [(PTPDevicePropDescDataset *)v3 setFormFlag:0];
  }
  else
  {
    if (a3 != 20481)
    {
      SEL v3 = 0;
      goto LABEL_14;
    }
    SEL v3 = objc_alloc_init(PTPDevicePropDescDataset);
    [(PTPDevicePropDescDataset *)v3 setDevicePropertyCode:20481];
    [(PTPDevicePropDescDataset *)v3 setDataTypeCode:2];
    [(PTPDevicePropDescDataset *)v3 setReadWriteAttribute:0];
    id v4 = +[NSNumber numberWithUnsignedChar:50];
    [(PTPDevicePropDescDataset *)v3 setFactoryDefaultValue:v4];

    uint64_t v5 = +[NSNumber numberWithUnsignedChar:50];
    [(PTPDevicePropDescDataset *)v3 setCurrentValue:v5];

    [(PTPDevicePropDescDataset *)v3 setFormFlag:1];
    id v6 = +[NSNumber numberWithUnsignedChar:0];
    [(PTPDevicePropDescDataset *)v3 setMinimumValue:v6];

    id v7 = +[NSNumber numberWithUnsignedChar:100];
    [(PTPDevicePropDescDataset *)v3 setMaximumValue:v7];

    char v8 = +[NSNumber numberWithUnsignedChar:10];
    [(PTPDevicePropDescDataset *)v3 setStepSize:v8];
  }

LABEL_14:

  return v3;
}

- (id)devicePropValueForProperty:(unsigned __int16)a3
{
  if (a3 == 54018)
  {
    id v4 = [(PTPDeviceInfoDataset *)self->_deviceInfoDataset serialNumber];
    if ((unint64_t)[v4 length] >= 4
      && (objc_msgSend(v4, "substringFromIndex:", (char *)objc_msgSend(v4, "length") - 4),
          (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v6 = v5;
      id v3 = [v5 dataUsingEncoding:1 allowLossyConversion:1];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = +[NSMutableData dataWithLength:1];
    *(unsigned char *)[v3 mutableBytes] = 50;
  }

  return v3;
}

- (BOOL)hostSupportsGroups
{
  return self->_hostSupportsGroups;
}

- (void)setHostSupportsGroups:(BOOL)a3
{
  self->_hostSupportsGroups = a3;
  id v4 = [(PTPVirtualCamera *)self photoStorage];

  if (v4)
  {
    id v5 = [(PTPVirtualCamera *)self photoStorage];
    [v5 setAssetGroupIndex:0];
  }
}

- (id)storageInfoDatasetForStorageID:(unsigned int)a3
{
  storages = self->_storages;
  id v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v5 = [(NSMutableDictionary *)storages objectForKey:v4];

  id v6 = [v5 storageInfoDataset];

  return v6;
}

- (id)objectInfoDatasetForObjectHandle:(unsigned int)a3
{
  id v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v5 = [(PTPVirtualCamera *)self objectForObjectHandle:v4];

  id v6 = [v5 objectInfoDataset];

  return v6;
}

- (unsigned)orientationForObjectHandle:(unsigned int)a3
{
  id v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v5 = [(PTPVirtualCamera *)self objectForObjectHandle:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v6 = [v5 desiredOrientation];
  }
  else {
    unsigned int v6 = 0;
  }

  return v6;
}

- (id)dataSourceForObjectHandle:(unsigned int)a3 responseCode:(unsigned __int16 *)a4 size:(unsigned int *)a5
{
  char v8 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v9 = [(PTPVirtualCamera *)self objectForObjectHandle:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    unsigned __int8 v11 = [v10 dataSource];
    id v12 = [v10 objectInfoDataset];

    *a5 = [v12 objectCompressedSize];
    unsigned __int16 v13 = 8193;
  }
  else
  {
    unsigned __int8 v11 = 0;
    unsigned __int16 v13 = 8201;
  }
  *a4 = v13;

  return v11;
}

- (id)embeddedMetadataForObjectHandle:(unsigned int)a3 responseCode:(unsigned __int16 *)a4
{
  unsigned int v6 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v7 = [(PTPVirtualCamera *)self objectForObjectHandle:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    id v10 = [v8 metadata];
    id v11 = [v10 mutableCopy];

    id v12 = [v11 objectForKeyedSubscript:@"{Raw}"];
    unsigned __int16 v13 = [v12 objectForKeyedSubscript:@"filters"];

    if (v13)
    {
      uint64_t v14 = [v11 objectForKeyedSubscript:@"{Raw}"];
      [v14 setObject:0 forKeyedSubscript:@"filters"];
    }
    id v15 = [v11 copy];
    [v9 encodeObject:v15 forKey:@"metadata"];

    id v16 = [v9 encodedData];

    *a4 = 8193;
  }
  else
  {
    id v16 = 0;
    *a4 = 8201;
  }

  return v16;
}

- (id)thumbnailForObjectHandle:(unsigned int)a3 maxPixelSize:(unsigned int)a4 responseCode:(unsigned __int16 *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v9 = [(PTPVirtualCamera *)self objectForObjectHandle:v8];

  *a5 = 8193;
  unint64_t v17 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 hasThumbnail])
    {
      id v11 = [v10 thumbnailForMaxPixelSize:v6 compressedSize:&v17];
      id v12 = [v11 length];
      if ((unint64_t)v12 > v17)
      {
        id v13 = v11;
        id v14 = [v13 bytes];
        id v11 = +[NSData dataWithBytes:v14 length:v17];
      }
      if ([v11 length])
      {
        unsigned __int16 v15 = 8193;
      }
      else
      {

        id v11 = 0;
        unsigned __int16 v15 = 8199;
      }
    }
    else
    {
      id v11 = 0;
      unsigned __int16 v15 = 8208;
    }
    *a5 = v15;
  }
  else
  {
    id v11 = 0;
    *a5 = 8201;
  }

  return v11;
}

- (void)deleteObjectWithObjectHandle:(unsigned int)a3 responseCode:(unsigned __int16 *)a4
{
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v7 = [(PTPVirtualCamera *)self objectForObjectHandle:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [v8 plAssetHandle];
    id v10 = sub_10000B5F8();
    if (v10)
    {
      __ICOSLogCreate();
      id v11 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        id v12 = [&stru_100048E60 substringWithRange:0, 18];
        id v11 = [v12 stringByAppendingString:@".."];
      }
      id v13 = [v8 baseName];
      id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" ───> [DELETE: %20s ]", [v13 UTF8String]);

      unsigned __int16 v15 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v11;
        unint64_t v17 = v15;
        *(_DWORD *)stat buf = 136446466;
        id v22 = [(__CFString *)v16 UTF8String];
        __int16 v23 = 2114;
        id v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      if (([v10 ptpDeletePhotoForAssetHandle:v9] & 1) != 0
        || ([v8 objectInfoDataset],
            int v18 = objc_claimAutoreleasedReturnValue(),
            unsigned int v19 = [v18 sequenceNumber],
            v18,
            v19 == 2))
      {
        __int16 v20 = [v8 parent];
        if (v20)
        {
          *a4 = 8193;
          --dword_10005E44C;
          if ((uint64_t)[v8 size] >= (uint64_t)&_mh_execute_header) {
            --dword_10005E450;
          }
          [v20 deleteFile:v8];
        }
      }
      else
      {
        *a4 = 8207;
      }
    }
  }
  else
  {
    *a4 = 8201;
  }
}

- (void)generatePTPEventsForAddedObjectHandles:(id)a3
{
  id v10 = [a3 objectEnumerator];
  uint64_t v4 = [v10 nextObject];
  if (v4)
  {
    id v5 = (void *)v4;
    p_delegate = &self->_delegate;
    do
    {
      SEL v7 = NSSelectorFromString(@"reportObjectAdded:");
      id WeakRetained = objc_loadWeakRetained(p_delegate);
      [WeakRetained performSelector:v7 withObject:v5];

      uint64_t v9 = [v10 nextObject];

      id v5 = (void *)v9;
    }
    while (v9);
  }
}

- (void)generatePTPEventsForDeletedObjectHandles:(id)a3
{
  id v10 = [a3 objectEnumerator];
  uint64_t v4 = [v10 nextObject];
  if (v4)
  {
    id v5 = (void *)v4;
    p_delegate = &self->_delegate;
    do
    {
      SEL v7 = NSSelectorFromString(@"reportObjectDeleted:");
      id WeakRetained = objc_loadWeakRetained(p_delegate);
      [WeakRetained performSelector:v7 withObject:v5];

      uint64_t v9 = [v10 nextObject];

      id v5 = (void *)v9;
    }
    while (v9);
  }
}

- (void)generatePTPEventsForAddedObjectGroupInStorage:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  SEL v5 = NSSelectorFromString(@"reportGroupAddedInStorage:");
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:v3];
  [WeakRetained performSelector:v5 withObject:v6];
}

- (void)processAddedFiles:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = sub_10001088C;
  id v24 = sub_10001089C;
  id v25 = +[NSMutableArray array];
  uint64_t v14 = 0;
  unsigned __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = sub_10001088C;
  int v18 = sub_10001089C;
  id v19 = +[NSMutableArray array];
  SEL v5 = sub_10000B5F8();
  uint64_t v6 = v5;
  if (v5)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100013664;
    v13[3] = &unk_100048878;
    v13[4] = self;
    void v13[5] = &v20;
    v13[6] = &v14;
    [v5 ptpEnumerateAssetsWithLocalIdentifiers:v4 usingBlock:v13];
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"assetManager" length] < 0x15)
    {
      id v8 = @"assetManager";
    }
    else
    {
      SEL v7 = [@"assetManager" substringWithRange:0, 18];
      id v8 = [v7 stringByAppendingString:@".."];
    }
    uint64_t v9 = +[NSString stringWithFormat:@"!invalid"];
    id v10 = (id)_gICOSLog;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(__CFString *)v8 UTF8String];
      *(_DWORD *)stat buf = 136446466;
      id v27 = v11;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if (self->_hostSupportsGroups)
  {
    id v12 = [(PTPVirtualCamera *)self photoStorage];
    -[PTPVirtualCamera generatePTPEventsForAddedObjectGroupInStorage:](self, "generatePTPEventsForAddedObjectGroupInStorage:", [v12 storageID]);
  }
  else
  {
    if ([(id)v15[5] count]) {
      [(PTPVirtualCamera *)self generatePTPEventsForAddedObjectHandles:v15[5]];
    }
    if ([(id)v21[5] count]) {
      [(PTPVirtualCamera *)self generatePTPEventsForAddedObjectHandles:v21[5]];
    }
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
}

- (void)processDeletedFiles:(id)a3
{
  id v21 = a3;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  long long v34 = sub_10001088C;
  id v35 = sub_10001089C;
  id v36 = +[NSMutableArray array];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_10001088C;
  v29[4] = sub_10001089C;
  id v30 = +[NSMutableArray array];
  uint64_t v22 = sub_10000B5F8();
  if (v22)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100013C90;
    v28[3] = &unk_100048878;
    v28[4] = self;
    v28[5] = &v31;
    v28[6] = v29;
    [v22 ptpEnumerateAssetsWithLocalIdentifiers:v21 usingBlock:v28];
  }
  __ICOSLogCreate();
  if ((unint64_t)[&stru_100048E60 length] < 0x15)
  {
    id v4 = &stru_100048E60;
  }
  else
  {
    uint64_t v3 = [&stru_100048E60 substringWithRange:0, 18];
    id v4 = [v3 stringByAppendingString:@".."];
  }
  SEL v5 = +[NSString stringWithFormat:@"deletedFiles: %@\n", v32[5]];
  uint64_t v6 = (id)_gICOSLog;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(__CFString *)v4 UTF8String];
    *(_DWORD *)stat buf = 136446466;
    id v39 = v7;
    __int16 v40 = 2114;
    id v41 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)v32[5];
  id v9 = [obj countByEnumeratingWithState:&v24 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        __ICOSLogCreate();
        id v13 = &stru_100048E60;
        if ((unint64_t)[&stru_100048E60 length] >= 0x15)
        {
          uint64_t v14 = [&stru_100048E60 substringWithRange:0, 18];
          id v13 = [v14 stringByAppendingString:@".."];
        }
        unsigned __int16 v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"file index: %d\n", [v12 objectHandle]);
        uint64_t v16 = (id)_gICOSLog;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [(__CFString *)v13 UTF8String];
          *(_DWORD *)stat buf = 136446466;
          id v39 = v17;
          __int16 v40 = 2114;
          id v41 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }

        int v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 objectHandle]);
        id v19 = [v12 parent];
        [v8 addObject:v18];
        [v19 deleteFile:v12];
      }
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v37 count:16];
    }
    while (v9);
  }

  if ([v8 count]) {
    [(PTPVirtualCamera *)self generatePTPEventsForDeletedObjectHandles:v8];
  }

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);
}

- (void)addedPhotoKeys:(id)a3 deletedPhotoKeys:(id)a4 changedPhotoKeys:(id)a5 changePendingPhotoKeys:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __ICOSLogCreate();
  uint64_t v14 = @"addedPhotoKeys";
  if ((unint64_t)[@"addedPhotoKeys" length] >= 0x15)
  {
    unsigned __int16 v15 = [@"addedPhotoKeys" substringWithRange:0, 18];
    uint64_t v14 = [v15 stringByAppendingString:@".."];
  }
  uint64_t v16 = +[NSString stringWithFormat:@"Added:[%lu] Changed[%lu] Removed[%lu]", [v10 count], [v12 count], [v11 count]];
  id v17 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = v14;
    id v19 = v17;
    *(_DWORD *)stat buf = 136446466;
    id v31 = [(__CFString *)v18 UTF8String];
    __int16 v32 = 2114;
    uint64_t v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013FE0;
  block[3] = &unk_1000488A0;
  id v25 = v10;
  long long v26 = self;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)libraryDidBecomeAvailable
{
}

- (void)libraryDidBecomeUnavailable
{
}

- (id)objectPropertiesSupportedForObjectFormatCode:(unsigned __int16)a3 responseCode:(unsigned __int16 *)a4
{
  uint64_t v6 = +[NSMutableArray arrayWithCapacity:0];
  *a4 = 8193;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = self->_objectDescriptionDataset;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [NSNumber numberWithUnsignedShort:][v14 propertyCode];
        [v6 addObject:v12];
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)objectPropValueForHandle:(unsigned int)a3 withObjectPropertyCode:(unsigned __int16)a4 responseCode:(unsigned __int16 *)a5
{
  unsigned int v6 = a4;
  uint64_t v7 = *(void *)&a3;
  __ICOSLogCreate();
  id v9 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    uint64_t v10 = [&stru_100048E60 substringWithRange:0, 18];
    id v9 = [v10 stringByAppendingString:@".."];
  }
  id v11 = +[NSString stringWithFormat:@"---> objectPropValueForHandle For Handle 0x%lx with 0x%x\n", v7, v6];
  id v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v9;
    long long v14 = v12;
    *(_DWORD *)stat buf = 136446466;
    id v60 = [(__CFString *)v13 UTF8String];
    __int16 v61 = 2114;
    v62 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  long long v15 = +[NSMutableData dataWithLength:0];
  *a5 = 8193;
  long long v16 = +[NSNumber numberWithUnsignedInt:v7];
  long long v17 = [(PTPVirtualCamera *)self objectForObjectHandle:v16];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __ICOSLogCreate();
      id v41 = (NSMutableArray *)&stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        v47 = [&stru_100048E60 substringWithRange:0, 18];
        id v41 = [v47 stringByAppendingString:@".."];
      }
      uint64_t v48 = +[NSString stringWithFormat:@"Unknown Class\n"];
      v49 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v50 = v41;
        __int16 v51 = v49;
        id v52 = [(NSMutableArray *)v50 UTF8String];
        *(_DWORD *)stat buf = 136446466;
        id v60 = v52;
        __int16 v61 = 2114;
        v62 = v48;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      goto LABEL_36;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __ICOSLogCreate();
    int v18 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      id v19 = [[&stru_100048E60 substringWithRange:0, 18];
      int v18 = [v19 stringByAppendingString:@".."];
    }
    id v20 = +[NSString stringWithFormat:@"File Class\n"];
    id v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v18;
      id v23 = v21;
      id v24 = [(__CFString *)v22 UTF8String];
      *(_DWORD *)stat buf = 136446466;
      id v60 = v24;
      __int16 v61 = 2114;
      v62 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __ICOSLogCreate();
      id v25 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        long long v26 = [&stru_100048E60 substringWithRange:0, 18];
        id v25 = [v26 stringByAppendingString:@".."];
      }
      id v27 = +[NSString stringWithFormat:@"Folder Class\n"];
      id v28 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = v25;
        id v30 = v28;
        id v31 = [(__CFString *)v29 UTF8String];
        *(_DWORD *)stat buf = 136446466;
        id v60 = v31;
        __int16 v61 = 2114;
        v62 = v27;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      __ICOSLogCreate();
      __int16 v32 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        uint64_t v33 = [&stru_100048E60 substringWithRange:0, 18];
        __int16 v32 = [v33 stringByAppendingString:@".."];
      }
      long long v34 = [v17 objectInfoDataset];
      id v35 = [v34 filename];
      id v36 = +[NSString stringWithFormat:@"Inspecting: %@\n", v35];

      __int16 v37 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v38 = v32;
        id v39 = v37;
        id v40 = [(__CFString *)v38 UTF8String];
        *(_DWORD *)stat buf = 136446466;
        id v60 = v40;
        __int16 v61 = 2114;
        v62 = v36;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v41 = self->_objectDescriptionDataset;
      id v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v43; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v55 != v44) {
              objc_enumerationMutation(v41);
            }
            uint64_t v46 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            if ([v46 propertyCode] == v6) {
              [v46 objectValue:v15 withObject:v17 andHandle:v7];
            }
          }
          id v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v43);
      }
LABEL_36:
    }
  }

  return v15;
}

- (id)objectPropDescForObjectPropertyCode:(unsigned __int16)a3 responseCode:(unsigned __int16 *)a4
{
  int v4 = a3;
  unsigned int v6 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0, a4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_objectDescriptionDataset;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "propertyCode", (void)v14) == v4)
        {
          [v12 objectPropertyDescriptionDataset:v6];
          goto LABEL_11;
        }
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)objectPropListForHandle:(unsigned int)a3 withObjectFormatCode:(unsigned int)a4 andPropertyCode:(unsigned int)a5 andPropertyGroup:(unsigned int)a6 andDepth:(unsigned int)a7 responseCode:(unsigned __int16 *)a8
{
  uint64_t v9 = *(void *)&a3;
  __ICOSLogCreate();
  uint64_t v11 = __ICLogTypeEnabled(4);
  if (a5 != -1)
  {
    if (!v11) {
      goto LABEL_13;
    }
    id v12 = @"objPropList";
    if ((unint64_t)[@"objPropList" length] >= 0x15)
    {
      id v13 = [[@"objPropList" substringWithRange:0, 18];
      id v12 = [v13 stringByAppendingString:@".."];
    }
    long long v14 = +[NSString stringWithFormat:@"Building SPECIFIC - Object Handle: %d\n", v9];
    long long v15 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v11) {
    goto LABEL_13;
  }
  id v12 = @"objPropList";
  if ((unint64_t)[@"objPropList" length] >= 0x15)
  {
    long long v16 = [@"objPropList" substringWithRange:0, 18];
    id v12 = [v16 stringByAppendingString:@".."];
  }
  long long v14 = +[NSString stringWithFormat:@"Building GENERAL - Object Handle: %d\n", v9];
  long long v15 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
LABEL_11:
    id v12 = v12;
    long long v17 = v15;
    *(_DWORD *)stat buf = 136446466;
    id v42 = [(__CFString *)v12 UTF8String];
    __int16 v43 = 2114;
    uint64_t v44 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
LABEL_12:

LABEL_13:
  if ((v9 + 1) > 1)
  {
    id v25 = +[NSMutableData dataWithLength:0];
    long long v26 = +[NSNumber numberWithUnsignedInt:v9];
    int v18 = [(PTPVirtualCamera *)self objectForObjectHandle:v26];

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      *(_DWORD *)stat buf = 0;
      [v25 appendBytes:buf length:4];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v27 = self->_objectDescriptionDataset;
      id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v28)
      {
        id v29 = v28;
        int v30 = 0;
        uint64_t v31 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v29; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v37 != v31) {
              objc_enumerationMutation(v27);
            }
            uint64_t v33 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            unsigned int v34 = [v33 propertyCode];
            if (a5 == -1 || v34 == a5)
            {
              *(_DWORD *)stat buf = ++v30;
              [v25 replaceBytesInRange:0 withBytes:buf length:4];
              [v33 objectPropertyListElement:v25 withObject:v18 andHandle:v9];
            }
          }
          id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v29);
      }
    }
    else
    {
      *(_DWORD *)stat buf = 0;
      [v25 appendBytes:buf length:4];
    }
  }
  else
  {
    __ICOSLogCreate();
    int v18 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      id v19 = [&stru_100048E60 substringWithRange:0, 18];
      int v18 = [v19 stringByAppendingString:@".."];
    }
    id v20 = +[NSString stringWithFormat:@"Unimplemented - Object Handle: %d\n", v9];
    id v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v18;
      id v23 = v21;
      id v24 = [(__CFString *)v22 UTF8String];
      *(_DWORD *)stat buf = 136446466;
      id v42 = v24;
      __int16 v43 = 2114;
      uint64_t v44 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    id v25 = 0;
  }

  return v25;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (void)setUserAssignedName:(id)a3
{
}

- (PTPSecurityModel)ptpSecurityModel
{
  return self->_ptpSecurityModel;
}

- (void)setPtpSecurityModel:(id)a3
{
}

- (void)setDeviceInfoDataset:(id)a3
{
}

- (NSMutableArray)objectDescriptionDataset
{
  return self->_objectDescriptionDataset;
}

- (void)setObjectDescriptionDataset:(id)a3
{
}

- (unsigned)currentInternalSessionID
{
  return self->_currentInternalSessionID;
}

- (void)setCurrentInternalSessionID:(unsigned int)a3
{
  self->_currentInternalSessionID = a3;
}

- (NSMutableArray)hostMediaSupportedFormats
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHostMediaSupportedFormats:(id)a3
{
}

- (NSMutableDictionary)storages
{
  return self->_storages;
}

- (void)setStorages:(id)a3
{
}

- (PTPStorage)photoStorage
{
  return self->_photoStorage;
}

- (void)setPhotoStorage:(id)a3
{
}

- (PTPStorage)placeholderStorage
{
  return self->_placeholderStorage;
}

- (void)setPlaceholderStorage:(id)a3
{
}

- (PFMediaCapabilities)mediaCapabilities
{
  return self->_mediaCapabilities;
}

- (void)setMediaCapabilities:(id)a3
{
}

- (OS_dispatch_queue)storageEnumerationQ
{
  return self->_storageEnumerationQ;
}

- (void)setStorageEnumerationQ:(id)a3
{
}

- (OS_dispatch_queue)storageTimerQ
{
  return self->_storageTimerQ;
}

- (void)setStorageTimerQ:(id)a3
{
}

- (OS_dispatch_source)storageTimer
{
  return self->_storageTimer;
}

- (void)setStorageTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageTimer, 0);
  objc_storeStrong((id *)&self->_storageTimerQ, 0);
  objc_storeStrong((id *)&self->_storageEnumerationQ, 0);
  objc_storeStrong((id *)&self->_mediaCapabilities, 0);
  objc_storeStrong((id *)&self->_placeholderStorage, 0);
  objc_storeStrong((id *)&self->_photoStorage, 0);
  objc_storeStrong((id *)&self->_storages, 0);
  objc_storeStrong((id *)&self->_hostMediaSupportedFormats, 0);
  objc_storeStrong((id *)&self->_objectDescriptionDataset, 0);
  objc_storeStrong((id *)&self->_deviceInfoDataset, 0);
  objc_storeStrong((id *)&self->_ptpSecurityModel, 0);
  objc_storeStrong((id *)&self->_userAssignedName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak(&self->_delegate);
}

@end