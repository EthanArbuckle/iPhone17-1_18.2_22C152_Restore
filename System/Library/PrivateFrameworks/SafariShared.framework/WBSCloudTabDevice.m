@interface WBSCloudTabDevice
+ (BOOL)hasDuplicateDeviceNameInDictionary:(id)a3;
+ (BOOL)isCloudTabDeviceDictionary:(id)a3;
+ (BOOL)isEphemeralDeviceInDictionary:(id)a3;
+ (id)deviceNameInDictionary:(id)a3;
+ (id)lastModifiedDateInDictionary:(id)a3;
+ (unint64_t)tabCountInDictionary:(id)a3;
- (BOOL)hasDuplicateName;
- (BOOL)isCloseRequestSupported;
- (BOOL)isCloudKitBookmarkSyncingSupported;
- (BOOL)isEphemeralDevice;
- (BOOL)isEqual:(id)a3;
- (NSArray)tabs;
- (NSDate)lastModified;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (NSString)deviceTypeIdentifier;
- (NSString)disambiguatedName;
- (NSString)name;
- (NSString)uuid;
- (WBSCloudTabDevice)initWithDeviceName:(id)a3 lastModified:(id)a4 hasDuplicateName:(BOOL)a5 tabs:(id)a6 uuid:(id)a7;
- (WBSCloudTabDevice)initWithDeviceName:(id)a3 lastModified:(id)a4 hasDuplicateName:(BOOL)a5 tabs:(id)a6 uuid:(id)a7 isEphemeralDevice:(BOOL)a8;
- (WBSCloudTabDevice)initWithDictionary:(id)a3 uuid:(id)a4;
- (WBSCloudTabDevice)initWithParameters:(id)a3 uuid:(id)a4;
- (id)deviceByRemovingTab:(id)a3;
- (id)deviceByRemovingTabs:(id)a3;
- (id)deviceBySettingDisambiguatedName:(id)a3;
- (unint64_t)hash;
@end

@implementation WBSCloudTabDevice

- (WBSCloudTabDevice)initWithDictionary:(id)a3 uuid:(id)a4
{
  id v6 = a4;
  v7 = +[WBSCloudTabDeviceParameters parametersWithDictionary:a3];
  v8 = [(WBSCloudTabDevice *)self initWithParameters:v7 uuid:v6];

  return v8;
}

- (WBSCloudTabDevice)initWithParameters:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSCloudTabDevice;
  v8 = [(WBSCloudTabDevice *)&v21 init];
  if (v8)
  {
    v8->_closeRequestSupported = [v6 closeRequestSupported];
    v8->_cloudKitBookmarkSyncingSupported = [v6 closeRequestSupported];
    uint64_t v9 = [v6 deviceTypeIdentifier];
    deviceTypeIdentifier = v8->_deviceTypeIdentifier;
    v8->_deviceTypeIdentifier = (NSString *)v9;

    v8->_ephemeralDevice = [v6 isEphemeralDevice];
    v8->_hasDuplicateName = [v6 hasDuplicateName];
    uint64_t v11 = [v6 lastModified];
    lastModified = v8->_lastModified;
    v8->_lastModified = (NSDate *)v11;

    uint64_t v13 = [v6 deviceName];
    name = v8->_name;
    v8->_name = (NSString *)v13;

    uint64_t v15 = [v6 tabs];
    tabs = v8->_tabs;
    v8->_tabs = (NSArray *)v15;

    uint64_t v17 = [v7 copy];
    uuid = v8->_uuid;
    v8->_uuid = (NSString *)v17;

    v19 = v8;
  }

  return v8;
}

- (WBSCloudTabDevice)initWithDeviceName:(id)a3 lastModified:(id)a4 hasDuplicateName:(BOOL)a5 tabs:(id)a6 uuid:(id)a7
{
  return [(WBSCloudTabDevice *)self initWithDeviceName:a3 lastModified:a4 hasDuplicateName:a5 tabs:a6 uuid:a7 isEphemeralDevice:0];
}

- (WBSCloudTabDevice)initWithDeviceName:(id)a3 lastModified:(id)a4 hasDuplicateName:(BOOL)a5 tabs:(id)a6 uuid:(id)a7 isEphemeralDevice:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  v18 = objc_alloc_init(WBSCloudTabDeviceParameters);
  [(WBSCloudTabDeviceParameters *)v18 setDeviceName:v17];

  [(WBSCloudTabDeviceParameters *)v18 setLastModified:v16];
  [(WBSCloudTabDeviceParameters *)v18 setHasDuplicateName:v10];
  [(WBSCloudTabDeviceParameters *)v18 setTabs:v15];

  [(WBSCloudTabDeviceParameters *)v18 setEphemeralDevice:v8];
  v19 = [(WBSCloudTabDevice *)self initWithParameters:v18 uuid:v14];

  return v19;
}

- (NSString)disambiguatedName
{
  disambiguatedName = self->_disambiguatedName;
  if (!disambiguatedName) {
    disambiguatedName = self->_name;
  }
  return disambiguatedName;
}

- (id)deviceByRemovingTab:(id)a3
{
  id v4 = a3;
  tabs = self->_tabs;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__WBSCloudTabDevice_deviceByRemovingTab___block_invoke;
  v12[3] = &unk_1E5C8E160;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = [(NSArray *)tabs indexOfObjectPassingTest:v12];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = (WBSCloudTabDevice *)[(WBSCloudTabDevice *)self copy];
  }
  else
  {
    uint64_t v9 = v7;
    BOOL v10 = (void *)[(NSArray *)self->_tabs mutableCopy];
    [v10 removeObjectAtIndex:v9];
    BOOL v8 = [[WBSCloudTabDevice alloc] initWithDeviceName:self->_name lastModified:self->_lastModified hasDuplicateName:self->_hasDuplicateName tabs:v10 uuid:self->_uuid isEphemeralDevice:self->_ephemeralDevice];
  }
  return v8;
}

uint64_t __41__WBSCloudTabDevice_deviceByRemovingTab___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasSameUUIDAndURLAsTab:a2];
}

- (id)deviceByRemovingTabs:(id)a3
{
  id v4 = a3;
  tabs = self->_tabs;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__WBSCloudTabDevice_deviceByRemovingTabs___block_invoke;
  v11[3] = &unk_1E5C8E160;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(NSArray *)tabs indexesOfObjectsPassingTest:v11];
  if ([v7 count])
  {
    BOOL v8 = (void *)[(NSArray *)self->_tabs mutableCopy];
    [v8 removeObjectsAtIndexes:v7];
    uint64_t v9 = [[WBSCloudTabDevice alloc] initWithDeviceName:self->_name lastModified:self->_lastModified hasDuplicateName:self->_hasDuplicateName tabs:v8 uuid:self->_uuid isEphemeralDevice:self->_ephemeralDevice];
  }
  else
  {
    uint64_t v9 = (WBSCloudTabDevice *)[(WBSCloudTabDevice *)self copy];
  }

  return v9;
}

uint64_t __42__WBSCloudTabDevice_deviceByRemovingTabs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hasSameUUIDAndURLAsTab:", v3, (void)v9))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)deviceBySettingDisambiguatedName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[WBSCloudTabDevice alloc] initWithDeviceName:self->_name lastModified:self->_lastModified hasDuplicateName:self->_hasDuplicateName tabs:self->_tabs uuid:self->_uuid isEphemeralDevice:self->_ephemeralDevice];
  uint64_t v6 = [v4 copy];

  disambiguatedName = v5->_disambiguatedName;
  v5->_disambiguatedName = (NSString *)v6;

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uuid hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSCloudTabDevice *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (uuid = self->_uuid,
          [(WBSCloudTabDevice *)v4 uuid],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          LODWORD(uuid) = [(NSString *)uuid isEqualToString:v6],
          v6,
          uuid))
    {
      uint64_t v7 = [(WBSCloudTabDevice *)self dictionaryRepresentation];
      BOOL v8 = [(WBSCloudTabDevice *)v4 dictionaryRepresentation];
      char v9 = [v7 isEqualToDictionary:v8];
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  name = self->_name;
  uuid = self->_uuid;
  BOOL closeRequestSupported = self->_closeRequestSupported;
  lastModified = self->_lastModified;
  long long v10 = [(NSArray *)self->_tabs componentsJoinedByString:@",\r    "];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; name = \"%@\"; uuid = %@; BOOL closeRequestSupported = %d; lastModified = %@; tabs = (\r    %@\r)>",
    v5,
    self,
    name,
    uuid,
    closeRequestSupported,
    lastModified,
  long long v11 = v10);

  return (NSString *)v11;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = +[WBSCloudTabDeviceParameters parametersWithDevice:self];
  id v3 = [v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

+ (BOOL)isCloudTabDeviceDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_msgSend(v3, "safari_stringForKey:", @"DictionaryType");
    if ([v4 length]) {
      char v5 = [v4 isEqualToString:@"Device"];
    }
    else {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (unint64_t)tabCountInDictionary:(id)a3
{
  id v3 = objc_msgSend(a3, "safari_arrayForKey:", @"Tabs");
  unint64_t v4 = [v3 count];

  return v4;
}

+ (id)deviceNameInDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "safari_stringForKey:", @"DeviceName");
}

+ (id)lastModifiedDateInDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "safari_dateForKey:", @"LastModified");
}

+ (BOOL)hasDuplicateDeviceNameInDictionary:(id)a3
{
  return objc_msgSend(a3, "safari_BOOLForKey:", @"HasDuplicateDeviceName");
}

+ (BOOL)isEphemeralDeviceInDictionary:(id)a3
{
  return objc_msgSend(a3, "safari_BOOLForKey:", @"IsEphemeralDevice");
}

- (BOOL)isCloseRequestSupported
{
  return self->_closeRequestSupported;
}

- (NSString)deviceTypeIdentifier
{
  return self->_deviceTypeIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSArray)tabs
{
  return self->_tabs;
}

- (BOOL)hasDuplicateName
{
  return self->_hasDuplicateName;
}

- (BOOL)isEphemeralDevice
{
  return self->_ephemeralDevice;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (BOOL)isCloudKitBookmarkSyncingSupported
{
  return self->_cloudKitBookmarkSyncingSupported;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_tabs, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_disambiguatedName, 0);
  objc_storeStrong((id *)&self->_deviceTypeIdentifier, 0);
}

@end