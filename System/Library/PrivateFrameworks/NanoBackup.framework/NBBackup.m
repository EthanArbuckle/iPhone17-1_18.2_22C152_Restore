@interface NBBackup
+ (BOOL)supportsSecureCoding;
- (BOOL)hasResolvedActiveWatchFaceFilePath;
- (BOOL)isDiagnosticsOptInEnabled;
- (BOOL)isLocationOptInEnabled;
- (NBBackup)initWithCoder:(id)a3;
- (NSData)watchFaceData;
- (NSDate)lastModificationDate;
- (NSNumber)backingColor;
- (NSNumber)bcmWindowMaterial;
- (NSNumber)bottomEnclosureMaterial;
- (NSNumber)coverGlassColor;
- (NSNumber)fcmMaterial;
- (NSNumber)housingColor;
- (NSNumber)sizeInBytes;
- (NSNumber)topEnclosureMaterial;
- (NSString)deviceCSN;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)marketingVersion;
- (NSString)name;
- (NSString)productName;
- (NSString)productType;
- (NSString)systemBuildVersion;
- (NSString)systemVersion;
- (NSString)watchFace;
- (NSString)watchFaceColor;
- (NSURL)activeWatchFaceFileURL;
- (NSUUID)uuid;
- (id)description;
- (unint64_t)backupType;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveWatchFaceFileURL:(id)a3;
- (void)setBackingColor:(id)a3;
- (void)setBackupType:(unint64_t)a3;
- (void)setBcmWindowMaterial:(id)a3;
- (void)setBottomEnclosureMaterial:(id)a3;
- (void)setCoverGlassColor:(id)a3;
- (void)setDeviceCSN:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceEnclosureColor:(id)a3;
- (void)setDiagnosticsOptInEnabled:(BOOL)a3;
- (void)setFcmMaterial:(id)a3;
- (void)setHasResolvedActiveWatchFaceFilePath:(BOOL)a3;
- (void)setHousingColor:(id)a3;
- (void)setLastModificationDate:(id)a3;
- (void)setLocationOptInEnabled:(BOOL)a3;
- (void)setMarketingVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSizeInBytes:(id)a3;
- (void)setSystemBuildVersion:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setTopEnclosureMaterial:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWatchFace:(id)a3;
- (void)setWatchFaceColor:(id)a3;
- (void)setWatchFaceData:(id)a3;
@end

@implementation NBBackup

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NSUUID *)self->_uuid UUIDString];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; uuid = (%@); name = (%@); productType: (%@); productName: (%@); systemVersion: (%@); systemBuildVersion: (%@); marketingVersion: (%@); lastModificationDate = (%@); sizeInBytes = (%@); deviceColor = (%@); enclosureColor = (%@); bottomEnclosureMaterial = (%@); topEnclosureMaterial = (%@); fcmMaterial = (%@); bcmWindowMaterial = (%@); coverGlassColor = (%@); housingColor = (%@); backingColor = (%@); locationOptIn = (%d); diagnosticsOptIn = (%d); deviceCSN: (%@); backupType = (%ld);watchFaceData = (%lu bytes)>",
    v5,
    self,
    v6,
    self->_name,
    self->_productType,
    self->_productName,
    self->_systemVersion,
    self->_systemBuildVersion,
    self->_marketingVersion,
    self->_lastModificationDate,
    self->_sizeInBytes,
    self->_deviceColor,
    self->_deviceEnclosureColor,
    self->_bottomEnclosureMaterial,
    self->_topEnclosureMaterial,
    self->_fcmMaterial,
    self->_bcmWindowMaterial,
    self->_coverGlassColor,
    self->_housingColor,
    self->_backingColor,
    self->_locationOptInEnabled,
    self->_diagnosticsOptInEnabled,
    self->_deviceCSN,
    self->_backupType,
  v7 = [(NSData *)self->_watchFaceData length]);

  return v7;
}

- (NSURL)activeWatchFaceFileURL
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_hasResolvedActiveWatchFaceFilePath)
  {
    v2->_hasResolvedActiveWatchFaceFilePath = 1;
    v3 = [(NSUUID *)v2->_uuid UUIDString];
    v4 = [@"/var/mobile/Library/NanoBackup" stringByAppendingPathComponent:v3];

    v5 = [MEMORY[0x263F08850] defaultManager];
    id v25 = 0;
    v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v25];
    id v7 = v25;

    if (v7)
    {
      v8 = nb_framework_log;
      if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v4;
        __int16 v29 = 2112;
        id v30 = v7;
        _os_log_impl(&dword_2211BB000, v8, OS_LOG_TYPE_DEFAULT, "Failed to list file within directory (%@) with error: (%@)", buf, 0x16u);
      }
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            objc_msgSend(v13, "rangeOfString:options:", @"ActiveWatchFace", 8, (void)v21);
            if (v14)
            {
              v15 = NSURL;
              v16 = [v4 stringByAppendingPathComponent:v13];
              uint64_t v17 = [v15 fileURLWithPath:v16 isDirectory:1];
              activeWatchFaceFileURL = v2->_activeWatchFaceFileURL;
              v2->_activeWatchFaceFileURL = (NSURL *)v17;

              goto LABEL_15;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
LABEL_15:
  }
  objc_sync_exit(v2);

  v19 = v2->_activeWatchFaceFileURL;

  return v19;
}

- (void)setActiveWatchFaceFileURL:(id)a3
{
  self->_hasResolvedActiveWatchFaceFilePath = 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeInteger:self->_backupType forKey:@"backupType"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_productType forKey:@"productType"];
  [v5 encodeObject:self->_productName forKey:@"productName"];
  [v5 encodeObject:self->_systemVersion forKey:@"systemVersion"];
  [v5 encodeObject:self->_systemBuildVersion forKey:@"systemBuildVersion"];
  [v5 encodeObject:self->_marketingVersion forKey:@"marketingVersion"];
  [v5 encodeObject:self->_lastModificationDate forKey:@"lastModification"];
  [v5 encodeObject:self->_sizeInBytes forKey:@"size"];
  [v5 encodeObject:self->_deviceColor forKey:@"color"];
  [v5 encodeObject:self->_deviceEnclosureColor forKey:@"enclosureColor"];
  [v5 encodeObject:self->_bottomEnclosureMaterial forKey:@"bottomEnclosure"];
  [v5 encodeObject:self->_topEnclosureMaterial forKey:@"topEnclosure"];
  [v5 encodeObject:self->_fcmMaterial forKey:@"FCMType"];
  [v5 encodeObject:self->_bcmWindowMaterial forKey:@"BCMWindow"];
  [v5 encodeObject:self->_coverGlassColor forKey:@"coverGlassColor"];
  [v5 encodeObject:self->_housingColor forKey:@"housingColor"];
  [v5 encodeObject:self->_backingColor forKey:@"backingColor"];
  [v5 encodeBool:self->_locationOptInEnabled forKey:@"location"];
  [v5 encodeBool:self->_diagnosticsOptInEnabled forKey:@"diagnostics"];
  [v5 encodeObject:self->_watchFaceData forKey:@"watchFaceData"];
  [v5 encodeObject:self->_deviceCSN forKey:@"deviceCSN"];
}

- (NBBackup)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)NBBackup;
  id v5 = [(NBBackup *)&v48 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_backupType = [v4 decodeIntegerForKey:@"backupType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productName"];
    productName = v5->_productName;
    v5->_productName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemVersion"];
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemBuildVersion"];
    systemBuildVersion = v5->_systemBuildVersion;
    v5->_systemBuildVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"marketingVersion"];
    marketingVersion = v5->_marketingVersion;
    v5->_marketingVersion = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModification"];
    lastModificationDate = v5->_lastModificationDate;
    v5->_lastModificationDate = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    sizeInBytes = v5->_sizeInBytes;
    v5->_sizeInBytes = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    deviceColor = v5->_deviceColor;
    v5->_deviceColor = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enclosureColor"];
    deviceEnclosureColor = v5->_deviceEnclosureColor;
    v5->_deviceEnclosureColor = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bottomEnclosure"];
    bottomEnclosureMaterial = v5->_bottomEnclosureMaterial;
    v5->_bottomEnclosureMaterial = (NSNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topEnclosure"];
    topEnclosureMaterial = v5->_topEnclosureMaterial;
    v5->_topEnclosureMaterial = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FCMType"];
    fcmMaterial = v5->_fcmMaterial;
    v5->_fcmMaterial = (NSNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCMWindow"];
    bcmWindowMaterial = v5->_bcmWindowMaterial;
    v5->_bcmWindowMaterial = (NSNumber *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coverGlassColor"];
    coverGlassColor = v5->_coverGlassColor;
    v5->_coverGlassColor = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"housingColor"];
    housingColor = v5->_housingColor;
    v5->_housingColor = (NSNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backingColor"];
    backingColor = v5->_backingColor;
    v5->_backingColor = (NSNumber *)v40;

    v5->_locationOptInEnabled = [v4 decodeBoolForKey:@"location"];
    v5->_diagnosticsOptInEnabled = [v4 decodeBoolForKey:@"diagnostics"];
    v42 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"watchFaceData"];
    watchFaceData = v5->_watchFaceData;
    v5->_watchFaceData = (NSData *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceCSN"];
    deviceCSN = v5->_deviceCSN;
    v5->_deviceCSN = (NSString *)v45;
  }
  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)backupType
{
  return self->_backupType;
}

- (void)setBackupType:(unint64_t)a3
{
  self->_backupType = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
}

- (NSString)marketingVersion
{
  return self->_marketingVersion;
}

- (void)setMarketingVersion:(id)a3
{
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
}

- (NSNumber)bottomEnclosureMaterial
{
  return self->_bottomEnclosureMaterial;
}

- (void)setBottomEnclosureMaterial:(id)a3
{
}

- (NSNumber)topEnclosureMaterial
{
  return self->_topEnclosureMaterial;
}

- (void)setTopEnclosureMaterial:(id)a3
{
}

- (NSNumber)fcmMaterial
{
  return self->_fcmMaterial;
}

- (void)setFcmMaterial:(id)a3
{
}

- (NSNumber)bcmWindowMaterial
{
  return self->_bcmWindowMaterial;
}

- (void)setBcmWindowMaterial:(id)a3
{
}

- (NSNumber)coverGlassColor
{
  return self->_coverGlassColor;
}

- (void)setCoverGlassColor:(id)a3
{
}

- (NSNumber)housingColor
{
  return self->_housingColor;
}

- (void)setHousingColor:(id)a3
{
}

- (NSNumber)backingColor
{
  return self->_backingColor;
}

- (void)setBackingColor:(id)a3
{
}

- (NSString)watchFace
{
  return self->_watchFace;
}

- (void)setWatchFace:(id)a3
{
}

- (NSString)watchFaceColor
{
  return self->_watchFaceColor;
}

- (void)setWatchFaceColor:(id)a3
{
}

- (BOOL)isLocationOptInEnabled
{
  return self->_locationOptInEnabled;
}

- (void)setLocationOptInEnabled:(BOOL)a3
{
  self->_locationOptInEnabled = a3;
}

- (BOOL)isDiagnosticsOptInEnabled
{
  return self->_diagnosticsOptInEnabled;
}

- (void)setDiagnosticsOptInEnabled:(BOOL)a3
{
  self->_diagnosticsOptInEnabled = a3;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void)setLastModificationDate:(id)a3
{
}

- (NSNumber)sizeInBytes
{
  return self->_sizeInBytes;
}

- (void)setSizeInBytes:(id)a3
{
}

- (NSString)deviceCSN
{
  return self->_deviceCSN;
}

- (void)setDeviceCSN:(id)a3
{
}

- (NSData)watchFaceData
{
  return self->_watchFaceData;
}

- (void)setWatchFaceData:(id)a3
{
}

- (BOOL)hasResolvedActiveWatchFaceFilePath
{
  return self->_hasResolvedActiveWatchFaceFilePath;
}

- (void)setHasResolvedActiveWatchFaceFilePath:(BOOL)a3
{
  self->_hasResolvedActiveWatchFaceFilePath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchFaceData, 0);
  objc_storeStrong((id *)&self->_deviceCSN, 0);
  objc_storeStrong((id *)&self->_sizeInBytes, 0);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_watchFaceColor, 0);
  objc_storeStrong((id *)&self->_watchFace, 0);
  objc_storeStrong((id *)&self->_backingColor, 0);
  objc_storeStrong((id *)&self->_housingColor, 0);
  objc_storeStrong((id *)&self->_coverGlassColor, 0);
  objc_storeStrong((id *)&self->_bcmWindowMaterial, 0);
  objc_storeStrong((id *)&self->_fcmMaterial, 0);
  objc_storeStrong((id *)&self->_topEnclosureMaterial, 0);
  objc_storeStrong((id *)&self->_bottomEnclosureMaterial, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_marketingVersion, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_activeWatchFaceFileURL, 0);
}

@end