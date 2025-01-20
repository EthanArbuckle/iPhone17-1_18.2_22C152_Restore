@interface LocalizedUnregisterErrorKey
- (LocalizedUnregisterErrorKey)initWithUnregisterError:(int64_t)a3 context:(unint64_t)a4 deviceClass:(int64_t)a5;
- (NSString)okButtonKey;
- (NSString)textKey;
- (NSString)titleKey;
- (id)deviceTypeStringForDeviceClass:(int64_t)a3;
- (id)errorContextStringForDisableContext:(unint64_t)a3;
- (id)errorTypeString;
- (id)keyForType:(id)a3;
- (int64_t)deviceClass;
- (int64_t)responseErrorType;
- (unint64_t)context;
- (void)setContext:(unint64_t)a3;
- (void)setDeviceClass:(int64_t)a3;
- (void)setResponseErrorType:(int64_t)a3;
@end

@implementation LocalizedUnregisterErrorKey

- (LocalizedUnregisterErrorKey)initWithUnregisterError:(int64_t)a3 context:(unint64_t)a4 deviceClass:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)LocalizedUnregisterErrorKey;
  v8 = [(LocalizedUnregisterErrorKey *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(LocalizedUnregisterErrorKey *)v8 setResponseErrorType:a3];
    [(LocalizedUnregisterErrorKey *)v9 setContext:a4];
    [(LocalizedUnregisterErrorKey *)v9 setDeviceClass:a5];
  }
  return v9;
}

- (NSString)okButtonKey
{
  v3 = [(LocalizedUnregisterErrorKey *)self errorContextStringForDisableContext:[(LocalizedUnregisterErrorKey *)self context]];
  v4 = [(LocalizedUnregisterErrorKey *)self errorTypeString];
  v5 = +[NSString stringWithFormat:@"%@_%@_%@", v3, v4, @"OK_BUTTON"];

  return (NSString *)v5;
}

- (NSString)titleKey
{
  return (NSString *)[(LocalizedUnregisterErrorKey *)self keyForType:@"TITLE"];
}

- (NSString)textKey
{
  return (NSString *)[(LocalizedUnregisterErrorKey *)self keyForType:@"TEXT"];
}

- (id)keyForType:(id)a3
{
  id v4 = a3;
  v5 = [(LocalizedUnregisterErrorKey *)self deviceTypeStringForDeviceClass:[(LocalizedUnregisterErrorKey *)self deviceClass]];
  v6 = [(LocalizedUnregisterErrorKey *)self errorContextStringForDisableContext:[(LocalizedUnregisterErrorKey *)self context]];
  uint64_t v7 = [(LocalizedUnregisterErrorKey *)self errorTypeString];
  v8 = (void *)v7;
  if (v5) {
    +[NSString stringWithFormat:@"%@_%@_%@_%@", v6, v7, v5, v4];
  }
  else {
  v9 = +[NSString stringWithFormat:@"%@_%@_%@", v6, v7, v4, v11];
  }

  return v9;
}

- (id)errorTypeString
{
  if (([(LocalizedUnregisterErrorKey *)self responseErrorType] & 0x200) != 0) {
    v2 = @"NETWORK_ERROR";
  }
  else {
    v2 = @"GENERIC_ERROR";
  }

  return v2;
}

- (id)errorContextStringForDisableContext:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return 0;
  }
  else {
    return *(&off_1002D9F38 + a3 - 1);
  }
}

- (id)deviceTypeStringForDeviceClass:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return 0;
  }
  else {
    return *(&off_1002D9F70 + a3);
  }
}

- (int64_t)responseErrorType
{
  return self->_responseErrorType;
}

- (void)setResponseErrorType:(int64_t)a3
{
  self->_responseErrorType = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int64_t)a3
{
  self->_deviceClass = a3;
}

@end