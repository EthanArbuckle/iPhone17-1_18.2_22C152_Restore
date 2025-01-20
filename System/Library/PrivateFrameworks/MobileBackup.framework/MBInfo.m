@interface MBInfo
+ (id)info;
+ (id)infoWithDrive:(id)a3 path:(id)a4 error:(id *)a5;
- (BOOL)writeToDrive:(id)a3 path:(id)a4 error:(id *)a5;
- (MBInfo)init;
- (MBInfo)initWithDrive:(id)a3 path:(id)a4 error:(id *)a5;
- (MBInfo)initWithPropertyList:(id)a3;
- (NSDate)lastBackupDate;
- (NSString)deviceName;
- (NSString)displayName;
- (NSString)productVersion;
- (NSString)targetIdentifier;
- (void)dealloc;
- (void)setDeviceName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setLastBackupDate:(id)a3;
- (void)setTargetIdentifier:(id)a3;
@end

@implementation MBInfo

+ (id)info
{
  v2 = objc_alloc_init(MBInfo);
  return v2;
}

+ (id)infoWithDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  v5 = [[MBInfo alloc] initWithDrive:a3 path:a4 error:a5];
  return v5;
}

- (MBInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBInfo;
  v2 = [(MBInfo *)&v4 init];
  if (v2) {
    v2->_plist = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
  }
  return v2;
}

- (MBInfo)initWithPropertyList:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBInfo;
  objc_super v4 = [(MBInfo *)&v6 init];
  if (v4) {
    v4->_plist = (NSMutableDictionary *)[a3 mutableCopy];
  }
  return v4;
}

- (MBInfo)initWithDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  id v6 = [a3 propertyListAtPath:a4 options:0 error:a5];
  if (v6)
  {
    v7 = v6;
    v10.receiver = self;
    v10.super_class = (Class)MBInfo;
    v8 = [(MBInfo *)&v10 init];
    if (v8) {
      v8->_plist = (NSMutableDictionary *)[v7 mutableCopy];
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBInfo;
  [(MBInfo *)&v3 dealloc];
}

- (NSString)displayName
{
  result = (NSString *)[(NSMutableDictionary *)self->_plist objectForKeyedSubscript:@"Display Name"];
  if (!result)
  {
    result = [(MBInfo *)self deviceName];
    if (!result)
    {
      return (NSString *)MBDeviceClass();
    }
  }
  return result;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)[(NSMutableDictionary *)self->_plist objectForKeyedSubscript:@"Device Name"];
}

- (void)setDeviceName:(id)a3
{
}

- (NSDate)lastBackupDate
{
  result = (NSDate *)[(NSMutableDictionary *)self->_plist objectForKeyedSubscript:@"Last Backup Date"];
  if (!result)
  {
    return +[NSDate date];
  }
  return result;
}

- (void)setLastBackupDate:(id)a3
{
}

- (NSString)targetIdentifier
{
  return (NSString *)[(NSMutableDictionary *)self->_plist objectForKeyedSubscript:@"Target Identifier"];
}

- (void)setTargetIdentifier:(id)a3
{
}

- (NSString)productVersion
{
  return (NSString *)[(NSMutableDictionary *)self->_plist objectForKeyedSubscript:@"Product Version"];
}

- (BOOL)writeToDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  return [a3 uploadPropertyList:self->_plist toPath:a4 options:0 error:a5];
}

@end