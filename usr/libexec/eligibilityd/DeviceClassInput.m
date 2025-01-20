@interface DeviceClassInput
+ (BOOL)supportsSecureCoding;
+ (id)_mgDeviceClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)isiPad;
- (BOOL)isiPhone;
- (DeviceClassInput)init;
- (DeviceClassInput)initWithCoder:(id)a3;
- (NSString)deviceClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceClass:(id)a3;
@end

@implementation DeviceClassInput

- (void).cxx_destruct
{
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (id)description
{
  v3 = [(DeviceClassInput *)self deviceClass];
  v7.receiver = self;
  v7.super_class = (Class)DeviceClassInput;
  v4 = [(EligibilityInput *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[DeviceClassInput deviceClass:\"%@\" %@]", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DeviceClassInput *)a3;
  v11.receiver = self;
  v11.super_class = (Class)DeviceClassInput;
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
    v6 = [(DeviceClassInput *)self deviceClass];
    objc_super v7 = [(DeviceClassInput *)v5 deviceClass];
    char v8 = sub_100019BF8(v6, v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_10000D0EC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[DeviceClassInput isEqual:]";
        __int16 v14 = 2080;
        v15 = "deviceClass";
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
  v7.super_class = (Class)DeviceClassInput;
  unint64_t v3 = [(EligibilityInput *)&v7 hash];
  v4 = [(DeviceClassInput *)self deviceClass];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DeviceClassInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = [(DeviceClassInput *)self deviceClass];
  id v7 = [v6 copyWithZone:a3];
  [v5 setDeviceClass:v7];

  return v5;
}

- (DeviceClassInput)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DeviceClassInput;
  unint64_t v3 = [(EligibilityInput *)&v7 initWithInputType:3 status:0 process:@"eligibilityd"];
  if (v3)
  {
    uint64_t v4 = +[DeviceClassInput _mgDeviceClass];
    deviceClass = v3->_deviceClass;
    v3->_deviceClass = (NSString *)v4;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DeviceClassInput;
  [(EligibilityInput *)&v3 encodeWithCoder:a3];
}

- (BOOL)isiPhone
{
  v2 = [(DeviceClassInput *)self deviceClass];
  unsigned __int8 v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

- (BOOL)isiPad
{
  v2 = [(DeviceClassInput *)self deviceClass];
  unsigned __int8 v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (DeviceClassInput)init
{
  v6.receiver = self;
  v6.super_class = (Class)DeviceClassInput;
  v2 = [(EligibilityInput *)&v6 initWithInputType:3 status:0 process:@"eligibilityd"];
  if (v2)
  {
    uint64_t v3 = +[DeviceClassInput _mgDeviceClass];
    deviceClass = v2->_deviceClass;
    v2->_deviceClass = (NSString *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_mgDeviceClass
{
  v2 = (void *)MGGetStringAnswer();

  return v2;
}

@end