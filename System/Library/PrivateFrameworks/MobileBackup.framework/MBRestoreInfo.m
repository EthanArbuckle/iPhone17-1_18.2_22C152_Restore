@interface MBRestoreInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)wasCloudRestore;
- (MBRestoreInfo)initWithCoder:(id)a3;
- (MBRestoreInfo)initWithDictionaryRepresentation:(id)a3;
- (NSDate)date;
- (NSString)backupBuildVersion;
- (NSString)deviceBuildVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBackupBuildVersion:(id)a3;
- (void)setDate:(id)a3;
- (void)setDeviceBuildVersion:(id)a3;
- (void)setWasCloudRestore:(BOOL)a3;
@end

@implementation MBRestoreInfo

- (MBRestoreInfo)initWithDictionaryRepresentation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBRestoreInfo;
  v4 = [(MBRestoreInfo *)&v6 init];
  if (v4)
  {
    v4->_date = (NSDate *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RestoreDate"), "copy");
    v4->_wasCloudRestore = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"WasCloudRestore"), "BOOLValue");
    v4->_backupBuildVersion = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"BackupBuildVersion"), "copy");
    v4->_deviceBuildVersion = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"DeviceBuildVersion"), "copy");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBRestoreInfo)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBRestoreInfo;
  v4 = [(MBRestoreInfo *)&v6 init];
  if (v4)
  {
    v4->_date = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    v4->_wasCloudRestore = [a3 decodeBoolForKey:@"wasCloudRestore"];
    v4->_backupBuildVersion = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"backupBuildVersion"];
    v4->_deviceBuildVersion = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"deviceBuildVersion"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_date forKey:@"date"];
  [a3 encodeBool:self->_wasCloudRestore forKey:@"wasCloudRestore"];
  [a3 encodeObject:self->_backupBuildVersion forKey:@"backupBuildVersion"];
  deviceBuildVersion = self->_deviceBuildVersion;
  [a3 encodeObject:deviceBuildVersion forKey:@"deviceBuildVersion"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MBRestoreInfo);
  [(MBRestoreInfo *)v4 setDate:self->_date];
  [(MBRestoreInfo *)v4 setWasCloudRestore:self->_wasCloudRestore];
  [(MBRestoreInfo *)v4 setDeviceBuildVersion:self->_deviceBuildVersion];
  [(MBRestoreInfo *)v4 setBackupBuildVersion:self->_backupBuildVersion];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBRestoreInfo;
  [(MBRestoreInfo *)&v3 dealloc];
}

- (void)setDate:(id)a3
{
  self->_date = (NSDate *)[a3 copy];
}

- (void)setWasCloudRestore:(BOOL)a3
{
  self->_wasCloudRestore = a3;
}

- (void)setDeviceBuildVersion:(id)a3
{
  self->_deviceBuildVersion = (NSString *)[a3 copy];
}

- (void)setBackupBuildVersion:(id)a3
{
  self->_backupBuildVersion = (NSString *)[a3 copy];
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", self->_date, @"RestoreDate", objc_msgSend(NSNumber, "numberWithBool:", self->_wasCloudRestore), @"WasCloudRestore", self->_backupBuildVersion, @"BackupBuildVersion", self->_deviceBuildVersion, @"DeviceBuildVersion", 0);
}

- (id)description
{
  id v2 = [(MBRestoreInfo *)self dictionaryRepresentation];
  return (id)[v2 description];
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)wasCloudRestore
{
  return self->_wasCloudRestore;
}

- (NSString)deviceBuildVersion
{
  return self->_deviceBuildVersion;
}

- (NSString)backupBuildVersion
{
  return self->_backupBuildVersion;
}

@end