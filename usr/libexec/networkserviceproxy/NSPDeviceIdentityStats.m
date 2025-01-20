@interface NSPDeviceIdentityStats
- (BOOL)success;
- (NSString)errorDomain;
- (id)analyticsDict;
- (id)eventName;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation NSPDeviceIdentityStats

- (id)eventName
{
  return @"com.apple.nsp.deviceIdentityStats";
}

- (id)analyticsDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSNumber numberWithBool:[(NSPDeviceIdentityStats *)self success]];
  [v3 setObject:v4 forKeyedSubscript:@"Success"];

  v5 = [(NSPDeviceIdentityStats *)self errorDomain];
  [v3 setObject:v5 forKeyedSubscript:@"ErrorDomain"];

  v6 = +[NSNumber numberWithInteger:[(NSPDeviceIdentityStats *)self errorCode]];
  [v3 setObject:v6 forKeyedSubscript:@"ErrorCode"];

  return v3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (void).cxx_destruct
{
}

@end