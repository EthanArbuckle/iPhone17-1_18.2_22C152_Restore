@interface ISSoftwareApplication
- (BOOL)didCheckLaunchProhibited;
- (BOOL)hasMIDBasedSINF;
- (BOOL)isBeta;
- (BOOL)isLaunchProhibited;
- (BOOL)isPlaceholder;
- (BOOL)isProfileValidated;
- (BOOL)missingRequiredSINF;
- (ISSoftwareApplication)initWithLaunchServicesApplication:(id)a3;
- (ISSoftwareApplication)initWithLaunchServicesApplication:(id)a3 containerPath:(id)a4;
- (ISSoftwareApplication)initWithXPCEncoding:(id)a3;
- (NSArray)versionOrdering;
- (NSDate)receiptExpirationDate;
- (NSNumber)accountDSID;
- (NSNumber)familyAccountIdentifier;
- (NSNumber)itemIdentifier;
- (NSNumber)storeFrontIdentifier;
- (NSNumber)versionIdentifier;
- (NSString)accountIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundleShortVersionString;
- (NSString)bundleVersion;
- (NSString)containerPath;
- (NSString)description;
- (NSString)deviceIdentifierForVendor;
- (NSString)itemName;
- (NSString)softwareType;
- (NSString)vendorName;
- (SSItemContentRating)contentRating;
- (id)ITunesMetadataDictionary;
- (id)copyXPCEncoding;
- (unint64_t)removableStatus;
- (unint64_t)vppStateFlags;
- (void)_loadMetadataFromContainer:(id)a3;
- (void)dealloc;
- (void)resetVPPStateFlags;
- (void)setAccountDSID:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBeta:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleShortVersionString:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setContainerPath:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setDeviceIdentifierForVendor:(id)a3;
- (void)setDidCheckLaunchProhibited:(BOOL)a3;
- (void)setFamilyAccountIdentifier:(id)a3;
- (void)setHasMIDBasedSINF:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemName:(id)a3;
- (void)setLaunchProhibited:(BOOL)a3;
- (void)setMissingRequiredSINF:(BOOL)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setProfileValidated:(BOOL)a3;
- (void)setSoftwareType:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setVendorName:(id)a3;
- (void)setVersionIdentifier:(id)a3;
- (void)setVersionOrdering:(id)a3;
@end

@implementation ISSoftwareApplication

- (ISSoftwareApplication)initWithLaunchServicesApplication:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "bundleContainerURL"), "path");

  return [(ISSoftwareApplication *)self initWithLaunchServicesApplication:a3 containerPath:v5];
}

- (ISSoftwareApplication)initWithLaunchServicesApplication:(id)a3 containerPath:(id)a4
{
  __ISRecordSPIClassUsage(self);
  v9.receiver = self;
  v9.super_class = (Class)ISSoftwareApplication;
  v7 = [(ISSoftwareApplication *)&v9 init];
  if (v7)
  {
    [a3 applicationDSID];
    [(ISSoftwareApplication *)v7 setAccountDSID:SSAccountGetUniqueIdentifierFromValue()];
    -[ISSoftwareApplication setBeta:](v7, "setBeta:", [a3 isBetaApp]);
    -[ISSoftwareApplication setBundleIdentifier:](v7, "setBundleIdentifier:", [a3 bundleIdentifier]);
    -[ISSoftwareApplication setBundleShortVersionString:](v7, "setBundleShortVersionString:", [a3 shortVersionString]);
    -[ISSoftwareApplication setBundleVersion:](v7, "setBundleVersion:", [a3 bundleVersion]);
    [(ISSoftwareApplication *)v7 setContainerPath:a4];
    -[ISSoftwareApplication setPlaceholder:](v7, "setPlaceholder:", [a3 isPlaceholder]);
    -[ISSoftwareApplication setProfileValidated:](v7, "setProfileValidated:", [a3 profileValidated]);
    [(ISSoftwareApplication *)v7 _loadMetadataFromContainer:a4];
    -[ISSoftwareApplication setHasMIDBasedSINF:](v7, "setHasMIDBasedSINF:", [a3 hasMIDBasedSINF]);
    -[ISSoftwareApplication setMissingRequiredSINF:](v7, "setMissingRequiredSINF:", [a3 missingRequiredSINF]);
    v7->_removableStatus = 0;
    if (objc_msgSend((id)objc_msgSend(a3, "applicationType"), "isEqualToString:", @"System")
      && [a3 isDeletable])
    {
      v7->_removableStatus |= 2uLL;
    }
    if ([a3 isRemovedSystemApp]) {
      v7->_removableStatus |= 4uLL;
    }
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISSoftwareApplication;
  [(ISSoftwareApplication *)&v3 dealloc];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)ISSoftwareApplication;
  return (NSString *)[NSString stringWithFormat:@"%@: (%@, %@:%@)", -[ISSoftwareApplication description](&v3, sel_description), -[ISSoftwareApplication bundleIdentifier](self, "bundleIdentifier"), -[ISSoftwareApplication itemIdentifier](self, "itemIdentifier"), -[ISSoftwareApplication versionIdentifier](self, "versionIdentifier")];
}

- (NSString)deviceIdentifierForVendor
{
  if (!self->_deviceIdentifierForVendor)
  {
    if ([(NSString *)self->_bundleIdentifier length])
    {
      objc_super v3 = (void *)[MEMORY[0x263F01868] applicationProxyForIdentifier:self->_bundleIdentifier];
      if (v3) {
        self->_deviceIdentifierForVendor = (NSString *)(id)objc_msgSend((id)objc_msgSend(v3, "deviceIdentifierForVendor"), "UUIDString");
      }
    }
  }
  v4 = self->_deviceIdentifierForVendor;

  return v4;
}

- (BOOL)isLaunchProhibited
{
  if (![(ISSoftwareApplication *)self didCheckLaunchProhibited]
    && [(NSString *)self->_bundleIdentifier length])
  {
    objc_super v3 = (void *)[MEMORY[0x263F01868] applicationProxyForIdentifier:self->_bundleIdentifier];
    if (v3) {
      self->_launchProhibited = [v3 isLaunchProhibited];
    }
    [(ISSoftwareApplication *)self setDidCheckLaunchProhibited:1];
  }
  return self->_launchProhibited;
}

- (void)resetVPPStateFlags
{
  self->_vppStateFlags = 0;
}

- (NSString)vendorName
{
  if (!self->_vendorName)
  {
    if ([(NSString *)self->_bundleIdentifier length])
    {
      objc_super v3 = (void *)[MEMORY[0x263F01868] applicationProxyForIdentifier:self->_bundleIdentifier];
      if (v3) {
        self->_vendorName = (NSString *)(id)[v3 vendorName];
      }
    }
  }
  v4 = self->_vendorName;

  return v4;
}

- (unint64_t)vppStateFlags
{
  unint64_t result = self->_vppStateFlags;
  if (!result)
  {
    v4 = (void *)MEMORY[0x2166C7A20](0, a2);
    if (self->_bundleIdentifier) {
      uint64_t v5 = objc_msgSend(MEMORY[0x263F01868], "applicationProxyForIdentifier:");
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "dataContainerURL"), "path"), "stringByAppendingPathComponent:", @"StoreKit");
    if ([v5 profileValidated]) {
      v7 = @"sandboxReceipt";
    }
    else {
      v7 = @"receipt";
    }
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];
    id v9 = objc_alloc_init(MEMORY[0x263F08850]);
    if ([v9 fileExistsAtPath:v8])
    {
      v10 = (void *)[objc_alloc(MEMORY[0x263F7B2E0]) initWithContentsOfFile:v8];
      unint64_t vppStateFlags = self->_vppStateFlags;
      if (v10)
      {
        v12 = v10;
        self->_unint64_t vppStateFlags = vppStateFlags | 1;
        self->_receiptExpirationDate = (NSDate *)(id)[v10 expirationDate];
        if ([v12 isVPPLicensed])
        {
          self->_vppStateFlags |= 2uLL;
          if ([v12 isRevoked])
          {
            uint64_t v13 = 8;
LABEL_18:
            self->_vppStateFlags |= v13;
            goto LABEL_19;
          }
          v15 = (void *)[v12 expirationDate];
          if (objc_msgSend(v15, "compare:", objc_msgSend(MEMORY[0x263EFF910], "date")) == -1)
          {
            uint64_t v13 = 4;
            goto LABEL_18;
          }
        }
LABEL_19:

        goto LABEL_20;
      }
      unint64_t v14 = vppStateFlags | 0xFFFFFFFF80000000;
    }
    else
    {
      unint64_t v14 = self->_vppStateFlags | 0x40000000;
    }
    self->_unint64_t vppStateFlags = v14;
LABEL_20:

    return self->_vppStateFlags;
  }
  return result;
}

- (id)ITunesMetadataDictionary
{
  v2 = [(NSString *)[(ISSoftwareApplication *)self containerPath] stringByAppendingPathComponent:@"iTunesMetadata.plist"];
  objc_super v3 = NSDictionary;

  return (id)[v3 dictionaryWithContentsOfFile:v2];
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "15", self->_hasMIDBasedSINF);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "16", self->_missingRequiredSINF);
  xpc_dictionary_set_BOOL(v3, "9", self->_profileValidated);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  return v3;
}

- (ISSoftwareApplication)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x2166C7F80](a3, a2) == MEMORY[0x263EF8708])
  {
    v9.receiver = self;
    v9.super_class = (Class)ISSoftwareApplication;
    uint64_t v5 = [(ISSoftwareApplication *)&v9 init];
    if (v5)
    {
      objc_opt_class();
      v5->_accountDSID = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_accountIdentifier = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_bundleIdentifier = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_bundleShortVersionString = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_bundleVersion = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_containerPath = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_familyAccountIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      v5->_hasMIDBasedSINF = xpc_dictionary_get_BOOL(a3, "15");
      objc_opt_class();
      v5->_itemIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_itemName = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      v5->_missingRequiredSINF = xpc_dictionary_get_BOOL(a3, "16");
      v5->_profileValidated = xpc_dictionary_get_BOOL(a3, "9");
      objc_opt_class();
      v5->_softwareType = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_storeFrontIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_versionIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_versionOrdering = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass();
      xpc_object_t value = xpc_dictionary_get_value(a3, "6");
      if (value)
      {
        xpc_object_t v8 = value;
        if (MEMORY[0x2166C7F80]()) {
          v5->_contentRating = (SSItemContentRating *)[objc_alloc(MEMORY[0x263F7B1B8]) initWithXPCEncoding:v8];
        }
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)_loadMetadataFromContainer:(id)a3
{
  uint64_t v4 = [a3 stringByAppendingPathComponent:@"iTunesMetadata.plist"];
  uint64_t v5 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v4];
  if (v5)
  {
    v20 = v5;
    uint64_t v6 = [v5 objectForKey:@"appleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISSoftwareApplication *)self setAccountIdentifier:v6];
    }
    uint64_t v7 = [v20 objectForKey:@"itemId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISSoftwareApplication *)self setItemIdentifier:v7];
    }
    uint64_t v8 = [v20 objectForKey:@"itemName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISSoftwareApplication *)self setItemName:v8];
    }
    uint64_t v9 = [v20 objectForKey:*MEMORY[0x263F7B5B0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[objc_alloc(MEMORY[0x263F7B1B8]) initWithDictionary:v9];
      [(ISSoftwareApplication *)self setContentRating:v10];
    }
    uint64_t v11 = [v20 objectForKey:*MEMORY[0x263F7B5B8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISSoftwareApplication *)self setSoftwareType:v11];
    }
    uint64_t v12 = [v20 objectForKey:@"s"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISSoftwareApplication *)self setStoreFrontIdentifier:v12];
    }
    uint64_t v13 = [v20 objectForKey:@"softwareVersionExternalIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISSoftwareApplication *)self setVersionIdentifier:v13];
    }
    uint64_t v14 = [v20 objectForKey:@"softwareVersionExternalIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ISSoftwareApplication *)self setVersionOrdering:v14];
    }
    v15 = (void *)[v20 objectForKey:*MEMORY[0x263F7B5A8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 objectForKey:*MEMORY[0x263F7B5A0]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v16 objectForKey:*MEMORY[0x263F7BD80]];
        if (![(ISSoftwareApplication *)self accountIdentifier])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(ISSoftwareApplication *)self setAccountIdentifier:v17];
          }
        }
        uint64_t v18 = [v16 objectForKey:*MEMORY[0x263F7BD78]];
        if (![(ISSoftwareApplication *)self accountDSID])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(ISSoftwareApplication *)self setAccountDSID:v18];
          }
        }
        uint64_t v19 = [v16 objectForKey:@"FamilyID"];
        if (![(ISSoftwareApplication *)self familyAccountIdentifier])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(ISSoftwareApplication *)self setFamilyAccountIdentifier:v19];
          }
        }
      }
    }
  }

  MEMORY[0x270F9A758]();
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAccountDSID:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleShortVersionString
{
  return self->_bundleShortVersionString;
}

- (void)setBundleShortVersionString:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
}

- (SSItemContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
}

- (void)setDeviceIdentifierForVendor:(id)a3
{
}

- (NSNumber)familyAccountIdentifier
{
  return self->_familyAccountIdentifier;
}

- (void)setFamilyAccountIdentifier:(id)a3
{
}

- (BOOL)hasMIDBasedSINF
{
  return self->_hasMIDBasedSINF;
}

- (void)setHasMIDBasedSINF:(BOOL)a3
{
  self->_hasMIDBasedSINF = a3;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
}

- (BOOL)missingRequiredSINF
{
  return self->_missingRequiredSINF;
}

- (void)setMissingRequiredSINF:(BOOL)a3
{
  self->_missingRequiredSINF = a3;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)isProfileValidated
{
  return self->_profileValidated;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (NSString)softwareType
{
  return self->_softwareType;
}

- (void)setSoftwareType:(id)a3
{
}

- (NSNumber)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (void)setVendorName:(id)a3
{
}

- (NSNumber)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
}

- (NSArray)versionOrdering
{
  return self->_versionOrdering;
}

- (void)setVersionOrdering:(id)a3
{
}

- (NSDate)receiptExpirationDate
{
  return self->_receiptExpirationDate;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (BOOL)didCheckLaunchProhibited
{
  return self->_didCheckLaunchProhibited;
}

- (void)setDidCheckLaunchProhibited:(BOOL)a3
{
  self->_didCheckLaunchProhibited = a3;
}

- (unint64_t)removableStatus
{
  return self->_removableStatus;
}

@end