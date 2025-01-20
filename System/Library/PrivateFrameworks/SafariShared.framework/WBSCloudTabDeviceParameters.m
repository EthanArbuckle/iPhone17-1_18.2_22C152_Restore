@interface WBSCloudTabDeviceParameters
+ (id)parametersWithDevice:(id)a3;
+ (id)parametersWithDictionary:(id)a3;
- (BOOL)closeRequestSupported;
- (BOOL)cloudKitBookmarkSyncingSupported;
- (BOOL)hasDuplicateName;
- (BOOL)isEphemeralDevice;
- (NSArray)tabs;
- (NSDate)lastModified;
- (NSDictionary)dictionaryRepresentation;
- (NSString)deviceName;
- (NSString)deviceTypeIdentifier;
- (WBSCloudTabDeviceParameters)init;
- (void)setCloseRequestSupported:(BOOL)a3;
- (void)setCloudKitBookmarkSyncingSupported:(BOOL)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceTypeIdentifier:(id)a3;
- (void)setEphemeralDevice:(BOOL)a3;
- (void)setHasDuplicateName:(BOOL)a3;
- (void)setLastModified:(id)a3;
- (void)setTabs:(id)a3;
@end

@implementation WBSCloudTabDeviceParameters

- (WBSCloudTabDeviceParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSCloudTabDeviceParameters;
  v2 = [(WBSCloudTabDeviceParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_closeRequestSupported = 257;
    v4 = v2;
  }

  return v3;
}

+ (id)parametersWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setCloseRequestSupported:", objc_msgSend(v4, "isCloseRequestSupported"));
  objc_msgSend(v5, "setCloudKitBookmarkSyncingSupported:", objc_msgSend(v4, "isCloudKitBookmarkSyncingSupported"));
  objc_super v6 = [v4 name];
  [v5 setDeviceName:v6];

  v7 = [v4 deviceTypeIdentifier];
  [v5 setDeviceTypeIdentifier:v7];

  objc_msgSend(v5, "setHasDuplicateName:", objc_msgSend(v4, "hasDuplicateName"));
  objc_msgSend(v5, "setEphemeralDevice:", objc_msgSend(v4, "isEphemeralDevice"));
  v8 = [v4 lastModified];
  [v5 setLastModified:v8];

  v9 = [v4 tabs];

  [v5 setTabs:v9];
  return v5;
}

+ (id)parametersWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  objc_super v6 = objc_msgSend(v4, "safari_stringForKey:", @"DeviceName");
  v7 = (void *)[v6 copy];
  [v5 setDeviceName:v7];

  objc_msgSend(v5, "setHasDuplicateName:", objc_msgSend(v4, "safari_BOOLForKey:", @"HasDuplicateDeviceName"));
  objc_msgSend(v5, "setEphemeralDevice:", objc_msgSend(v4, "safari_BOOLForKey:", @"IsEphemeralDevice"));
  v8 = objc_msgSend(v4, "safari_dateForKey:", @"LastModified");
  [v5 setLastModified:v8];

  v9 = objc_msgSend(v4, "safari_dictionaryForKey:", @"Capabilities");
  objc_msgSend(v5, "setCloseRequestSupported:", objc_msgSend(v9, "safari_BOOLForKey:", @"CloseTabRequest"));
  v21 = v9;
  objc_msgSend(v5, "setCloudKitBookmarkSyncingSupported:", objc_msgSend(v9, "safari_BOOLForKey:", @"CloudKitBookmarkSyncing"));
  v10 = objc_msgSend(v4, "safari_stringForKey:", @"DeviceTypeIdentifier");
  [v5 setDeviceTypeIdentifier:v10];

  v11 = objc_msgSend(v4, "safari_arrayForKey:", @"Tabs");
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [[WBSCloudTab alloc] initWithDictionary:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        v19 = [(WBSCloudTab *)v18 url];

        if (v19) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  [v5 setTabs:v12];
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"CloseTabRequest"];
  [v3 setObject:v4 forKeyedSubscript:@"CloudKitBookmarkSyncing"];
  v11[0] = @"DictionaryType";
  v11[1] = @"DeviceName";
  deviceName = self->_deviceName;
  v12[0] = @"Device";
  v12[1] = deviceName;
  v11[2] = @"LastModified";
  v11[3] = @"Capabilities";
  v12[2] = self->_lastModified;
  v12[3] = v3;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v7 = (void *)[v6 mutableCopy];

  if (self->_hasDuplicateName) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HasDuplicateDeviceName"];
  }
  if (self->_ephemeralDevice) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsEphemeralDevice"];
  }
  deviceTypeIdentifier = self->_deviceTypeIdentifier;
  if (deviceTypeIdentifier) {
    [v7 setObject:deviceTypeIdentifier forKeyedSubscript:@"DeviceTypeIdentifier"];
  }
  if ([(NSArray *)self->_tabs count])
  {
    v9 = [(NSArray *)self->_tabs safari_mapAndFilterObjectsUsingBlock:&__block_literal_global_20];
    if ([v9 count]) {
      [v7 setObject:v9 forKeyedSubscript:@"Tabs"];
    }
  }
  return (NSDictionary *)v7;
}

uint64_t __55__WBSCloudTabDeviceParameters_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (void)setLastModified:(id)a3
{
  objc_msgSend(a3, "safari_startOfDay");
  uint64_t v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastModified = self->_lastModified;
  self->_lastModified = v4;
}

- (BOOL)closeRequestSupported
{
  return self->_closeRequestSupported;
}

- (void)setCloseRequestSupported:(BOOL)a3
{
  self->_closeRequestSupported = a3;
}

- (BOOL)cloudKitBookmarkSyncingSupported
{
  return self->_cloudKitBookmarkSyncingSupported;
}

- (void)setCloudKitBookmarkSyncingSupported:(BOOL)a3
{
  self->_cloudKitBookmarkSyncingSupported = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceTypeIdentifier
{
  return self->_deviceTypeIdentifier;
}

- (void)setDeviceTypeIdentifier:(id)a3
{
}

- (BOOL)hasDuplicateName
{
  return self->_hasDuplicateName;
}

- (void)setHasDuplicateName:(BOOL)a3
{
  self->_hasDuplicateName = a3;
}

- (BOOL)isEphemeralDevice
{
  return self->_ephemeralDevice;
}

- (void)setEphemeralDevice:(BOOL)a3
{
  self->_ephemeralDevice = a3;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (NSArray)tabs
{
  return self->_tabs;
}

- (void)setTabs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabs, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_deviceTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end