@interface DeviceLocaleInput
+ (BOOL)supportsSecureCoding;
+ (id)fallbackDeviceLocale;
- (BOOL)isEqual:(id)a3;
- (DeviceLocaleInput)initWithCoder:(id)a3;
- (DeviceLocaleInput)initWithDeviceLocale:(id)a3 status:(unint64_t)a4 process:(id)a5;
- (NSString)deviceLocale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceLocale:(id)a3;
@end

@implementation DeviceLocaleInput

- (void).cxx_destruct
{
}

- (void)setDeviceLocale:(id)a3
{
}

- (id)description
{
  v3 = [(DeviceLocaleInput *)self deviceLocale];
  v7.receiver = self;
  v7.super_class = (Class)DeviceLocaleInput;
  v4 = [(EligibilityInput *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[DeviceLocaleInput deviceLocale:\"%@\" %@]", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DeviceLocaleInput *)a3;
  v11.receiver = self;
  v11.super_class = (Class)DeviceLocaleInput;
  if (![(EligibilityInput *)&v11 isEqual:v4]) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = [(DeviceLocaleInput *)self deviceLocale];
    objc_super v7 = [(DeviceLocaleInput *)v5 deviceLocale];
    char v8 = sub_100019BF8(v6, v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_10000D0EC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[DeviceLocaleInput isEqual:]";
        __int16 v14 = 2080;
        v15 = "deviceLocale";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
  }
  else
  {
LABEL_9:
    char v8 = 0;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)DeviceLocaleInput;
  unint64_t v3 = [(EligibilityInput *)&v7 hash];
  v4 = [(DeviceLocaleInput *)self deviceLocale];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DeviceLocaleInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = [(DeviceLocaleInput *)self deviceLocale];
  id v7 = [v6 copyWithZone:a3];
  [v5 setDeviceLocale:v7];

  return v5;
}

- (DeviceLocaleInput)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceLocale"];
  if (!v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)DeviceLocaleInput;
    id v7 = [(EligibilityInput *)&v9 initWithInputType:4 status:0 process:@"eligibilityd"];
    v6 = +[DeviceLocaleInput fallbackDeviceLocale];
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v6 = (void *)v5;
  v10.receiver = self;
  v10.super_class = (Class)DeviceLocaleInput;
  id v7 = [(EligibilityInput *)&v10 initWithCoder:v4];
  if (v7) {
LABEL_3:
  }
    objc_storeStrong((id *)&v7->_deviceLocale, v6);
LABEL_4:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DeviceLocaleInput;
  id v4 = a3;
  [(EligibilityInput *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(DeviceLocaleInput *)self deviceLocale];
  [v4 encodeObject:v5 forKey:@"deviceLocale"];
}

- (DeviceLocaleInput)initWithDeviceLocale:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8 = a3;
  objc_super v9 = (__CFString *)a5;
  if (v8)
  {
    xpc_type_t type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_string)
    {
      objc_super v11 = type;
      v12 = sub_10000D0EC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[DeviceLocaleInput initWithDeviceLocale:status:process:]";
        __int16 v20 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Device locale input is wrong data type: %s", buf, 0x16u);
      }
      v13 = 0;
      goto LABEL_14;
    }
    v12 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    v12 = 0;
  }
  if (a4 == 1 && !v12)
  {
    v12 = +[DeviceLocaleInput fallbackDeviceLocale];

    a4 = 0;
    objc_super v9 = @"eligibilityd";
  }
  v17.receiver = self;
  v17.super_class = (Class)DeviceLocaleInput;
  __int16 v14 = [(EligibilityInput *)&v17 initWithInputType:4 status:a4 process:v9];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_deviceLocale, v12);
  }
  self = v15;
  v13 = self;
LABEL_14:

  return v13;
}

- (NSString)deviceLocale
{
  return self->_deviceLocale;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fallbackDeviceLocale
{
  v2 = +[GlobalConfiguration sharedInstance];
  unint64_t v3 = [v2 currentUsername];

  if (v3)
  {
    id v4 = (void *)CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, v3, kCFPreferencesAnyHost);
    if (v4)
    {
      id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v4];
      objc_super v6 = [v5 regionCode];
    }
    else
    {
      objc_super v6 = 0;
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

@end