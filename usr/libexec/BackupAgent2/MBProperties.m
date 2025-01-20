@interface MBProperties
+ (id)properties;
+ (id)propertiesWithFile:(id)a3 error:(id *)a4;
- (BOOL)_BOOLForKey:(id)a3;
- (BOOL)encrypted;
- (BOOL)hasCorruptSQLiteDBs;
- (BOOL)hasEncryptedManifestDB;
- (BOOL)hasManifestDB;
- (BOOL)isProtected;
- (BOOL)wasPasscodeSet;
- (BOOL)writeToFile:(id)a3 error:(id *)a4;
- (MBProperties)init;
- (MBProperties)initWithData:(id)a3 error:(id *)a4;
- (MBProperties)initWithFile:(id)a3 error:(id *)a4;
- (MBProperties)initWithVersion:(double)a3 minVersion:(double)a4 maxVersion:(double)a5;
- (NSData)buddyStashData;
- (NSData)keybagData;
- (NSData)manifestEncryptionKey;
- (NSDate)date;
- (NSDictionary)appleIDs;
- (NSDictionary)containers;
- (NSDictionary)lockdownKeys;
- (NSNumber)accountClass;
- (NSNumber)accountType;
- (NSString)activeAppleID;
- (NSString)buildVersion;
- (NSString)deviceID;
- (NSString)deviceName;
- (NSString)productType;
- (NSString)requiredProductVersion;
- (NSString)serialNumber;
- (double)maxSupportedVersion;
- (double)minSupportedVersion;
- (double)systemDomainsVersion;
- (double)version;
- (id)_dataForKey:(id)a3;
- (id)_dictionaryForKey:(id)a3;
- (id)_stringForLockdownKey:(id)a3;
- (id)containerWithIdentifier:(id)a3;
- (id)dataWithError:(id *)a3;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)propertyList;
- (void)_setBool:(BOOL)a3 forKey:(id)a4;
- (void)_setData:(id)a3 forKey:(id)a4;
- (void)_setDictionary:(id)a3 forKey:(id)a4;
- (void)addAppleID:(id)a3 DSID:(id)a4 altDSID:(id)a5 dataClass:(id)a6;
- (void)addAppleIDsFromSet:(id)a3 dataClass:(id)a4;
- (void)addAssetDescriptionForAppleID:(id)a3 assetDescription:(id)a4;
- (void)addContainer:(id)a3;
- (void)addContainersFromArray:(id)a3;
- (void)removeAllContainers;
- (void)removeObjectForKey:(id)a3;
- (void)setAccountClass:(id)a3;
- (void)setAccountType:(id)a3;
- (void)setActiveAppleID:(id)a3;
- (void)setBuddyStashData:(id)a3;
- (void)setDate:(id)a3;
- (void)setEncrypted:(BOOL)a3;
- (void)setKeybagData:(id)a3;
- (void)setLockdownKeys:(id)a3;
- (void)setManifestEncryptionKey:(id)a3;
- (void)setMaxSupportedVersion:(double)a3;
- (void)setMinSupportedVersion:(double)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPasscodeSet:(BOOL)a3;
- (void)setProtected:(BOOL)a3;
- (void)setRequiredProductVersion:(id)a3;
- (void)setSystemDomainsVersion:(double)a3;
- (void)setVersion:(double)a3;
@end

@implementation MBProperties

+ (id)properties
{
  v2 = objc_alloc_init(MBProperties);

  return v2;
}

+ (id)propertiesWithFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[MBProperties alloc] initWithFile:v5 error:a4];

  return v6;
}

- (MBProperties)init
{
  return [(MBProperties *)self initWithVersion:10.0 minVersion:7.4 maxVersion:11.0];
}

- (MBProperties)initWithVersion:(double)a3 minVersion:(double)a4 maxVersion:(double)a5
{
  v14.receiver = self;
  v14.super_class = (Class)MBProperties;
  v8 = [(MBProperties *)&v14 init];
  if (v8)
  {
    id v9 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
    id plist = v8->_plist;
    v8->_id plist = v9;

    [(MBProperties *)v8 setVersion:a3];
    [(MBProperties *)v8 setMinSupportedVersion:a4];
    [(MBProperties *)v8 setMaxSupportedVersion:a5];
    id v11 = [objc_alloc((Class)MBSystemDomainsVersions) initWithDefaultSystemDomainsPlist];
    [v11 version];
    -[MBProperties setSystemDomainsVersion:](v8, "setSystemDomainsVersion:");
    v8->_protected = 1;
    v12 = +[NSDate date];
    [(MBProperties *)v8 setDate:v12];
  }
  return v8;
}

- (MBProperties)initWithData:(id)a3 error:(id *)a4
{
  id v24 = 0;
  v6 = +[NSPropertyListSerialization propertyListFromData:a3 mutabilityOption:1 format:0 errorDescription:&v24];
  if (!v6)
  {
    if (a4)
    {
      +[MBError errorWithCode:11, @"Error deserializing properties: %@", v24 format];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  v7 = [(MBProperties *)self init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong(&v7->_plist, v6);
    v8->_protected = 1;
    [(MBProperties *)v8 minSupportedVersion];
    double v10 = v9;
    [(MBProperties *)v8 version];
    if (v10 > v11
      || ([(MBProperties *)v8 version],
          double v13 = v12,
          [(MBProperties *)v8 maxSupportedVersion],
          v13 >= v14))
    {
      if (a4)
      {
        [(MBProperties *)v8 version];
        *a4 = +[MBError errorWithCode:203, @"Unsupported properties version: %0.1f", v22 format];
      }
      self = v8;
    }
    else
    {
      self = (MBProperties *)[objc_alloc((Class)MBSystemDomainsVersions) initWithDefaultSystemDomainsPlist];
      [(MBProperties *)self minSupportedVersion];
      double v16 = v15;
      [(MBProperties *)v8 systemDomainsVersion];
      if (v16 <= v17)
      {
        [(MBProperties *)v8 systemDomainsVersion];
        double v19 = v18;
        [(MBProperties *)self maxSupportedVersion];
        if (v19 < v20) {
          goto LABEL_16;
        }
      }
      if (a4)
      {
        [(MBProperties *)v8 systemDomainsVersion];
        *a4 = +[MBError errorWithCode:203, @"Unsupported system domains version: %0.1f", v21 format];
      }
    }
    goto LABEL_15;
  }
LABEL_17:

  return v8;
}

- (MBProperties)initWithFile:(id)a3 error:(id *)a4
{
  v6 = +[NSData dataWithContentsOfFile:a3 options:0 error:a4];
  if (v6)
  {
    v7 = [(MBProperties *)self initWithData:v6 error:a4];
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (id)objectForKey:(id)a3
{
  return [self->_plist objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (BOOL)_BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self->_plist objectForKeyedSubscript:v4];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11, @"%@ value not an NSNumber", v4 format]);
    }
  }
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[NSNumber numberWithBool:v4];
  [self->_plist setObject:v7 forKeyedSubscript:v6];
}

- (id)_dataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self->_plist objectForKeyedSubscript:v4];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11, @"%@ value not an NSData", v4 format]);
    }
  }

  return v5;
}

- (void)_setData:(id)a3 forKey:(id)a4
{
}

- (id)_dictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self->_plist objectForKeyedSubscript:v4];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11, @"%@ value not an NSDictionary", v4 format]);
    }
  }

  return v5;
}

- (void)_setDictionary:(id)a3 forKey:(id)a4
{
}

- (NSString)requiredProductVersion
{
  v2 = [self->_plist objectForKeyedSubscript:@"RequiredProductVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setRequiredProductVersion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_100098EF4();
    }
    [self->_plist setObject:v4 forKeyedSubscript:@"RequiredProductVersion"];
  }
  else
  {
    [self->_plist removeObjectForKey:@"RequiredProductVersion"];
  }
}

- (NSNumber)accountClass
{
  v2 = [self->_plist objectForKeyedSubscript:@"AccountClass"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setAccountClass:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_100098F20();
    }
    [self->_plist setObject:v4 forKeyedSubscript:@"AccountClass"];
  }
  else
  {
    [self->_plist removeObjectForKey:@"AccountClass"];
  }
}

- (NSNumber)accountType
{
  v2 = [self->_plist objectForKeyedSubscript:@"AccountType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setAccountType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_100098F4C();
    }
    [self->_plist setObject:v4 forKeyedSubscript:@"AccountType"];
  }
  else
  {
    [self->_plist removeObjectForKey:@"AccountType"];
  }
}

- (double)version
{
  v2 = [self->_plist objectForKeyedSubscript:@"Version"];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11 format:@"Version value not an NSNumber or NSString"]);
      }
    }
    [v2 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (void)setVersion:(double)a3
{
  id v4 = +[NSString stringWithFormat:@"%0.1f", *(void *)&a3];
  [self->_plist setObject:v4 forKeyedSubscript:@"Version"];
}

- (double)systemDomainsVersion
{
  v2 = [self->_plist objectForKeyedSubscript:@"SystemDomainsVersion"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11 format:@"SystemDomainsVersion not an NSString"]);
  }
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setSystemDomainsVersion:(double)a3
{
  id v4 = +[NSString stringWithFormat:@"%0.1f", *(void *)&a3];
  [self->_plist setObject:v4 forKeyedSubscript:@"SystemDomainsVersion"];
}

- (NSDate)date
{
  v2 = [self->_plist objectForKeyedSubscript:@"Date"];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11 format:@"Date value not an NSDate"]);
    }
  }

  return (NSDate *)v2;
}

- (void)setDate:(id)a3
{
}

- (BOOL)encrypted
{
  return [(MBProperties *)self _BOOLForKey:@"IsEncrypted"];
}

- (void)setEncrypted:(BOOL)a3
{
}

- (NSData)keybagData
{
  return (NSData *)[(MBProperties *)self _dataForKey:@"BackupKeyBag"];
}

- (void)setKeybagData:(id)a3
{
}

- (NSData)buddyStashData
{
  return (NSData *)[(MBProperties *)self _dataForKey:@"BudyStashData"];
}

- (void)setBuddyStashData:(id)a3
{
}

- (BOOL)wasPasscodeSet
{
  return [(MBProperties *)self _BOOLForKey:@"WasPasscodeSet"];
}

- (void)setPasscodeSet:(BOOL)a3
{
}

- (NSData)manifestEncryptionKey
{
  v2 = [self->_plist objectForKeyedSubscript:@"ManifestKey"];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11 format:@"Manifest key is not an NSData"]);
    }
  }

  return (NSData *)v2;
}

- (void)setManifestEncryptionKey:(id)a3
{
}

- (NSDictionary)lockdownKeys
{
  return (NSDictionary *)[(MBProperties *)self _dictionaryForKey:@"Lockdown"];
}

- (void)setLockdownKeys:(id)a3
{
}

- (id)_stringForLockdownKey:(id)a3
{
  id v4 = a3;
  id v5 = [(MBProperties *)self lockdownKeys];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11, @"%@ lockdown value not an NSString", v6 format]);
    }
  }

  return v6;
}

- (NSString)deviceID
{
  return (NSString *)[(MBProperties *)self _stringForLockdownKey:kLockdownUniqueDeviceIDKey];
}

- (NSString)deviceName
{
  return (NSString *)[(MBProperties *)self _stringForLockdownKey:kLockdownDeviceNameKey];
}

- (NSString)serialNumber
{
  return (NSString *)[(MBProperties *)self _stringForLockdownKey:kLockdownSerialNumberKey];
}

- (NSString)productType
{
  return (NSString *)[(MBProperties *)self _stringForLockdownKey:kLockdownProductTypeKey];
}

- (NSString)buildVersion
{
  return (NSString *)[(MBProperties *)self _stringForLockdownKey:kLockdownBuildVersionKey];
}

- (BOOL)hasCorruptSQLiteDBs
{
  BOOL v3 = [(MBProperties *)self encrypted];
  if (v3)
  {
    id v4 = [(MBProperties *)self buildVersion];
    if ([v4 hasPrefix:@"9A"])
    {
      id v5 = [(MBProperties *)self buildVersion];
      id v6 = [v5 length];

      if ((unint64_t)v6 >= 3)
      {
        id v7 = [(MBProperties *)self buildVersion];
        v8 = [v7 substringFromIndex:2];
        unsigned int v9 = [v8 intValue];

        LOBYTE(v3) = v9 - 124 < 0x52;
        return v3;
      }
    }
    else
    {
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasManifestDB
{
  [(MBProperties *)self version];
  return v2 >= 10.0;
}

- (BOOL)hasEncryptedManifestDB
{
  if (![(MBProperties *)self encrypted]) {
    return 0;
  }
  BOOL v3 = [(MBProperties *)self manifestEncryptionKey];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSDictionary)appleIDs
{
  BOOL v4 = [self->_plist objectForKeyedSubscript:@"AppleIDs"];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = +[NSAssertionHandler currentHandler];
      [v6 handleFailureInMethod:a2, self, @"MBProperties.m", 355, @"%@ value not an NSDictionary", @"AppleIDs" object file lineNumber description];
    }
  }

  return (NSDictionary *)v4;
}

- (void)addAppleIDsFromSet:(id)a3 dataClass:(id)a4
{
  id v6 = a3;
  id v29 = a4;
  id v7 = [(MBProperties *)self appleIDs];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [self->_plist setObject:v7 forKeyedSubscript:@"AppleIDs"];
  }
  v25 = self;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  unsigned int v9 = v29;
  if (v8)
  {
    id v10 = v8;
    double v11 = &AnalyticsSendEventLazy_ptr;
    double v12 = &AnalyticsSendEventLazy_ptr;
    uint64_t v30 = *(void *)v32;
    v27 = v7;
    do
    {
      double v13 = 0;
      do
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v24 = +[NSAssertionHandler currentHandler];
          [v24 handleFailureInMethod:a2, v25, @"MBProperties.m", 372, @"Account item %@ not a string", v14 object file lineNumber description];
        }
        double v15 = [v7 objectForKeyedSubscript:v14];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (id v16 = v15) == 0)
        {
          id v16 = +[NSMutableDictionary dictionary];
        }
        if (v9)
        {
          uint64_t v17 = [v16 objectForKeyedSubscript:@"dataClasses"];
          if (v17)
          {
            double v18 = (void *)v17;
            +[NSMutableSet setWithArray:v17];
            id v19 = v10;
            double v20 = v12;
            v22 = uint64_t v21 = v11;
            [v22 addObject:v9];
            v23 = [v22 allObjects];

            double v11 = v21;
            double v12 = v20;
            id v10 = v19;
            id v7 = v27;
          }
          else
          {
            v35 = v9;
            v23 = +[NSArray arrayWithObjects:&v35 count:1];
          }
          [v16 setObject:v23 forKeyedSubscript:@"dataClasses"];

          unsigned int v9 = v29;
        }
        [v7 setObject:v16 forKeyedSubscript:v14];

        double v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }
}

- (void)addAppleID:(id)a3 DSID:(id)a4 altDSID:(id)a5 dataClass:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  uint64_t v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    unint64_t v36 = (unint64_t)v10;
    __int16 v37 = 2112;
    unint64_t v38 = v11;
    __int16 v39 = 2112;
    unint64_t v40 = v12;
    __int16 v41 = 2112;
    id v42 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Adding appleID:%@, DSID:%@, altDSID:%@, dataClass:%@", buf, 0x2Au);
    unint64_t v32 = v12;
    id v33 = v13;
    id v28 = v10;
    unint64_t v30 = v11;
    _MBLog();
  }

  if (!v10)
  {
    double v15 = MBGetDefaultLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412802;
    unint64_t v36 = v11;
    __int16 v37 = 2112;
    unint64_t v38 = v12;
    __int16 v39 = 2112;
    unint64_t v40 = (unint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "nil appleID, DSID:%@, altDSID:%@, dataClass:%@", buf, 0x20u);
LABEL_31:
    _MBLog();
    goto LABEL_35;
  }
  if (!(v11 | v12))
  {
    double v15 = MBGetDefaultLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412546;
    unint64_t v36 = (unint64_t)v10;
    __int16 v37 = 2112;
    unint64_t v38 = (unint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "appleID:%@, nil DSID&altDSID, dataClass:%@", buf, 0x16u);
    goto LABEL_31;
  }
  double v15 = [(MBProperties *)self appleIDs];
  if (!v15)
  {
    double v15 = +[NSMutableDictionary dictionary];
    [self->_plist setObject:v15 forKeyedSubscript:@"AppleIDs"];
  }
  id v16 = -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v10, v28, v30, v32, v33);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v17 = v16) == 0)
  {
    id v17 = +[NSMutableDictionary dictionary];
  }
  if (v11)
  {
    double v18 = [v17 objectForKeyedSubscript:@"dsid"];
    id v19 = v18;
    if (v18 && ([v18 isEqualToString:v11] & 1) == 0)
    {
      double v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v36 = (unint64_t)v19;
        __int16 v37 = 2112;
        unint64_t v38 = v11;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "DSID mismatch: existingDSID:%@ != DSID:%@", buf, 0x16u);
        id v29 = v19;
        unint64_t v31 = v11;
        _MBLog();
      }
    }
    [v17 setObject:v11 forKeyedSubscript:@"dsid" :v29];
  }
  if (v12)
  {
    uint64_t v21 = [v17 objectForKeyedSubscript:@"altDsid"];
    uint64_t v22 = v21;
    if (v21 && ([v21 isEqualToString:v12] & 1) == 0)
    {
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v36 = (unint64_t)v22;
        __int16 v37 = 2112;
        unint64_t v38 = v12;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "altDSID mismatch: existingAltDSID:%@ != altDSID:%@", buf, 0x16u);
        id v29 = v22;
        unint64_t v31 = v12;
        _MBLog();
      }
    }
    [v17 setObject:v12 forKeyedSubscript:@"altDsid" :v29];
  }
  if (v13)
  {
    uint64_t v24 = [v17 objectForKeyedSubscript:@"dataClasses"];
    if (v24)
    {
      v25 = (void *)v24;
      v26 = +[NSMutableSet setWithArray:v24];
      [v26 addObject:v13];
      v27 = [v26 allObjects];
    }
    else
    {
      id v34 = v13;
      v27 = +[NSArray arrayWithObjects:&v34 count:1];
    }
    [v17 setObject:v27 forKeyedSubscript:@"dataClasses"];
  }
  [v15 setObject:v17 forKeyedSubscript:v10];

LABEL_35:
}

- (void)addAssetDescriptionForAppleID:(id)a3 assetDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    unsigned int v9 = [(MBProperties *)self appleIDs];
    id v10 = [v9 objectForKeyedSubscript:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (id v11 = v10) == 0)
    {
      id v11 = +[NSMutableDictionary dictionary];
    }
    unint64_t v12 = [v11 objectForKeyedSubscript:@"assets"];

    if (v12)
    {
      id v13 = [v11 objectForKeyedSubscript:@"assets"];
      uint64_t v14 = +[NSMutableSet setWithArray:v13];

      [v14 addObject:v8];
      double v15 = [v14 allObjects];
    }
    else
    {
      id v16 = v8;
      double v15 = +[NSArray arrayWithObjects:&v16 count:1];
    }
    [v11 setObject:v15 forKeyedSubscript:@"assets"];
    [v9 setObject:v11 forKeyedSubscript:v6];
  }
}

- (NSString)activeAppleID
{
  return (NSString *)[self->_plist objectForKeyedSubscript:@"ActiveAppleID"];
}

- (void)setActiveAppleID:(id)a3
{
  id plist = self->_plist;
  if (a3) {
    [plist setObject:a3 forKeyedSubscript:@"ActiveAppleID"];
  }
  else {
    [plist removeObjectForKey:@"ActiveAppleID"];
  }
}

- (NSDictionary)containers
{
  BOOL v4 = [self->_plist objectForKeyedSubscript:@"Applications"];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = +[NSAssertionHandler currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"MBProperties.m" lineNumber:496 description:@"Containers value not an NSDictionary"];
    }
  }

  return (NSDictionary *)v4;
}

- (id)containerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MBProperties *)self containers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = +[MBContainer containerWithPropertyList:v6 volumeMountPoint:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)addContainer:(id)a3
{
  id v12 = a3;
  if (([v12 isSystemContainer] & 1) == 0
    && ([v12 isSystemSharedContainer] & 1) == 0)
  {
    id v5 = [(MBProperties *)self containers];
    if (!v5)
    {
      id v5 = +[NSMutableDictionary dictionaryWithCapacity:32];
      [self->_plist setObject:v5 forKeyedSubscript:@"Applications"];
    }
    id v6 = [v12 identifier];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      id v10 = +[NSAssertionHandler currentHandler];
      id v11 = [v12 identifier];
      [v10 handleFailureInMethod:a2, self, @"MBProperties.m", 514, @"Duplicate container ID: %@", v11 object file lineNumber description];
    }
    id v8 = [v12 propertyListForBackupProperties];
    unsigned int v9 = [v12 identifier];
    [v5 setObject:v8 forKeyedSubscript:v9];
  }
}

- (void)addContainersFromArray:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MBProperties *)self addContainer:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeAllContainers
{
  id v3 = +[NSMutableDictionary dictionaryWithCapacity:32];
  [self->_plist setObject:v3 forKeyedSubscript:@"Applications"];
}

- (id)dataWithError:(id *)a3
{
  return +[NSPropertyListSerialization dataWithPropertyList:self->_plist format:200 options:0 error:a3];
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v12 = 0;
  uint64_t v7 = +[NSPropertyListSerialization dataFromPropertyList:self->_plist format:200 errorDescription:&v12];
  id v8 = v7;
  if (v7)
  {
    if (self->_protected) {
      uint64_t v9 = 536870913;
    }
    else {
      uint64_t v9 = 1;
    }
    unsigned __int8 v10 = [v7 writeToFile:v6 options:v9 error:a4];
  }
  else if (a4)
  {
    +[MBError errorWithCode:100, @"Error serializing properties: %@", v12 format];
    unsigned __int8 v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  [(MBProperties *)self version];
  uint64_t v5 = v4;
  [(MBProperties *)self systemDomainsVersion];
  uint64_t v7 = v6;
  id v8 = [(MBProperties *)self requiredProductVersion];
  uint64_t v9 = [(MBProperties *)self date];
  unsigned int v10 = [(MBProperties *)self encrypted];
  unsigned int v11 = [(MBProperties *)self wasPasscodeSet];
  id v12 = [(MBProperties *)self lockdownKeys];
  id v13 = MBStringWithDictionary();
  uint64_t v14 = +[NSString stringWithFormat:@"<%@: version=%0.1f, systemDomainsVersion=%0.1f, requiredProductVersion=%@, date=\"%@\", encrypted=%d, passcodeSet=%d, lockdownKeys=%@>", v3, v5, v7, v8, v9, v10, v11, v13];

  return v14;
}

- (id)propertyList
{
  return self->_plist;
}

- (BOOL)isProtected
{
  return self->_protected;
}

- (void)setProtected:(BOOL)a3
{
  self->_protected = a3;
}

- (double)minSupportedVersion
{
  return self->_minSupportedVersion;
}

- (void)setMinSupportedVersion:(double)a3
{
  self->_minSupportedVersion = a3;
}

- (double)maxSupportedVersion
{
  return self->_maxSupportedVersion;
}

- (void)setMaxSupportedVersion:(double)a3
{
  self->_maxSupportedVersion = a3;
}

- (void).cxx_destruct
{
}

@end