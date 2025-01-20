@interface DeviceRegionCodeInput
+ (BOOL)supportsSecureCoding;
+ (id)_mgDeviceRegionCode;
- (BOOL)isChinaSKU;
- (BOOL)isEqual:(id)a3;
- (DeviceRegionCodeInput)init;
- (DeviceRegionCodeInput)initWithCoder:(id)a3;
- (NSString)deviceRegionCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceRegionCode:(id)a3;
@end

@implementation DeviceRegionCodeInput

- (void).cxx_destruct
{
}

- (void)setDeviceRegionCode:(id)a3
{
}

- (NSString)deviceRegionCode
{
  return self->_deviceRegionCode;
}

- (id)description
{
  v3 = [(DeviceRegionCodeInput *)self deviceRegionCode];
  v7.receiver = self;
  v7.super_class = (Class)DeviceRegionCodeInput;
  v4 = [(EligibilityInput *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[DeviceRegionCodeInput deviceRegionCode:\"%@\" %@]", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DeviceRegionCodeInput *)a3;
  v11.receiver = self;
  v11.super_class = (Class)DeviceRegionCodeInput;
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
    v6 = [(DeviceRegionCodeInput *)self deviceRegionCode];
    objc_super v7 = [(DeviceRegionCodeInput *)v5 deviceRegionCode];
    char v8 = sub_100019BF8(v6, v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_10000D0EC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[DeviceRegionCodeInput isEqual:]";
        __int16 v14 = 2080;
        v15 = "deviceRegionCode";
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
  v7.super_class = (Class)DeviceRegionCodeInput;
  unint64_t v3 = [(EligibilityInput *)&v7 hash];
  v4 = [(DeviceRegionCodeInput *)self deviceRegionCode];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DeviceRegionCodeInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = [(DeviceRegionCodeInput *)self deviceRegionCode];
  id v7 = [v6 copyWithZone:a3];
  [v5 setDeviceRegionCode:v7];

  return v5;
}

- (DeviceRegionCodeInput)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DeviceRegionCodeInput;
  unint64_t v3 = [(EligibilityInput *)&v7 initWithInputType:6 status:0 process:@"eligibilityd"];
  if (v3)
  {
    uint64_t v4 = +[DeviceRegionCodeInput _mgDeviceRegionCode];
    deviceRegionCode = v3->_deviceRegionCode;
    v3->_deviceRegionCode = (NSString *)v4;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DeviceRegionCodeInput;
  [(EligibilityInput *)&v3 encodeWithCoder:a3];
}

- (BOOL)isChinaSKU
{
  v2 = [(DeviceRegionCodeInput *)self deviceRegionCode];
  unsigned __int8 v3 = [v2 isEqualToString:@"CH"];

  return v3;
}

- (DeviceRegionCodeInput)init
{
  v6.receiver = self;
  v6.super_class = (Class)DeviceRegionCodeInput;
  v2 = [(EligibilityInput *)&v6 initWithInputType:6 status:0 process:@"eligibilityd"];
  if (v2)
  {
    uint64_t v3 = +[DeviceRegionCodeInput _mgDeviceRegionCode];
    deviceRegionCode = v2->_deviceRegionCode;
    v2->_deviceRegionCode = (NSString *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_mgDeviceRegionCode
{
  v2 = (void *)MGGetStringAnswer();

  return v2;
}

@end