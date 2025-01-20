@interface SSVPlayActivityEnqueuerProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isSBEnabled;
- (NSNumber)isPrivateListeningEnabled;
- (NSString)buildVersion;
- (NSString)deviceGUID;
- (NSString)deviceName;
- (NSString)storeFrontID;
- (NSTimeZone)timeZone;
- (SSVPlayActivityEnqueuerProperties)initWithCoder:(id)a3;
- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)systemReleaseType;
- (unint64_t)storeAccountID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSVPlayActivityEnqueuerProperties

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  if ([(NSString *)self->_buildVersion length]) {
    [v6 appendFormat:@" buildVersion: %@", self->_buildVersion];
  }
  if ([(NSString *)self->_deviceGUID length]) {
    [v6 appendFormat:@" deviceGUID: %@", self->_deviceGUID];
  }
  if ([(NSString *)self->_deviceName length]) {
    [v6 appendFormat:@" deviceName: %@", self->_deviceName];
  }
  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled)
  {
    if ([(NSNumber *)privateListeningEnabled BOOLValue]) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    [v6 appendFormat:@" privateListeningEnabled: %@", v8];
  }
  if (self->_systemReleaseType) {
    objc_msgSend(v6, "appendFormat:", @" systemReleaseType: %li", self->_systemReleaseType);
  }
  if (self->_SBEnabled) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v6 appendFormat:@" SBEnabled: %@", v9];
  if (self->_storeAccountID) {
    objc_msgSend(v6, "appendFormat:", @" storeAccountID: %llu", self->_storeAccountID);
  }
  if ([(NSString *)self->_storeFrontID length]) {
    [v6 appendFormat:@" storeFrontID: %@", self->_storeFrontID];
  }
  if (self->_timeZone) {
    [v6 appendFormat:@" timeZone:%@", self->_timeZone];
  }
  [v6 appendString:@">"];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  buildVersion = self->_buildVersion;
  id v5 = a3;
  [v5 encodeObject:buildVersion forKey:@"buildVersion"];
  [v5 encodeObject:self->_deviceGUID forKey:@"deviceGUID"];
  [v5 encodeObject:self->_deviceName forKey:@"deviceName"];
  [v5 encodeObject:self->_privateListeningEnabled forKey:@"privateListeningEnabled"];
  [v5 encodeBool:self->_SBEnabled forKey:@"SBEnabled"];
  [v5 encodeInt64:self->_storeAccountID forKey:@"storeAccountID"];
  [v5 encodeObject:self->_storeFrontID forKey:@"storeFrontID"];
  [v5 encodeInteger:self->_systemReleaseType forKey:@"internalBuild"];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
}

- (SSVPlayActivityEnqueuerProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SSVPlayActivityEnqueuerProperties;
  id v5 = [(SSVPlayActivityEnqueuerProperties *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildVersion"];
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceGUID"];
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateListeningEnabled"];
    privateListeningEnabled = v5->_privateListeningEnabled;
    v5->_privateListeningEnabled = (NSNumber *)v12;

    v5->_systemReleaseType = [v4 decodeIntegerForKey:@"internalBuild"];
    v5->_SBEnabled = [v4 decodeBoolForKey:@"SBEnabled"];
    v5->_storeAccountID = [v4 decodeInt64ForKey:@"storeAccountID"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeFrontID"];
    storeFrontID = v5->_storeFrontID;
    v5->_storeFrontID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v16;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  return [(SSVPlayActivityEnqueuerProperties *)self _copyWithClass:v5 zone:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  uint64_t v6 = [[(objc_class *)a3 allocWithZone:a4] init];
  if (v6)
  {
    uint64_t v7 = [(NSString *)self->_buildVersion copyWithZone:a4];
    uint64_t v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    uint64_t v9 = [(NSString *)self->_deviceGUID copyWithZone:a4];
    uint64_t v10 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v9;

    uint64_t v11 = [(NSString *)self->_deviceName copyWithZone:a4];
    uint64_t v12 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v11;

    uint64_t v13 = [(NSNumber *)self->_privateListeningEnabled copyWithZone:a4];
    uint64_t v14 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v13;

    *((unsigned char *)v6 + 40) = self->_SBEnabled;
    *((void *)v6 + 6) = self->_storeAccountID;
    uint64_t v15 = [(NSString *)self->_storeFrontID copyWithZone:a4];
    uint64_t v16 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = v15;

    *((void *)v6 + 8) = self->_systemReleaseType;
    uint64_t v17 = [(NSTimeZone *)self->_timeZone copyWithZone:a4];
    v18 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v17;
  }
  return v6;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)systemReleaseType
{
  return self->_systemReleaseType;
}

- (BOOL)isSBEnabled
{
  return self->_SBEnabled;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end