@interface ChinaCellularInput
+ (BOOL)_isGreenTeaDeviceCapable;
+ (BOOL)supportsSecureCoding;
- (BOOL)chinaCellularDevice;
- (BOOL)isEqual:(id)a3;
- (ChinaCellularInput)init;
- (ChinaCellularInput)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChinaCellularDevice:(BOOL)a3;
@end

@implementation ChinaCellularInput

- (void)setChinaCellularDevice:(BOOL)a3
{
  self->_chinaCellularDevice = a3;
}

- (BOOL)chinaCellularDevice
{
  return self->_chinaCellularDevice;
}

- (id)description
{
  if ([(ChinaCellularInput *)self chinaCellularDevice]) {
    CFStringRef v3 = @"Y";
  }
  else {
    CFStringRef v3 = @"N";
  }
  v7.receiver = self;
  v7.super_class = (Class)ChinaCellularInput;
  v4 = [(EligibilityInput *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[ChinaCellularInput chinaCellularDevice:%@ %@]", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ChinaCellularInput *)a3;
  v11.receiver = self;
  v11.super_class = (Class)ChinaCellularInput;
  if (![(EligibilityInput *)&v11 isEqual:v4]) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v9 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    unsigned int v6 = [(ChinaCellularInput *)self chinaCellularDevice];
    unsigned int v7 = v6 ^ [(ChinaCellularInput *)v5 chinaCellularDevice];
    if (v7 == 1)
    {
      v8 = sub_10000D0EC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[ChinaCellularInput isEqual:]";
        __int16 v14 = 2080;
        v15 = "chinaCellularDevice";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
    char v9 = v7 ^ 1;
  }
  else
  {
LABEL_9:
    char v9 = 0;
  }
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)ChinaCellularInput;
  unint64_t v3 = [(EligibilityInput *)&v5 hash];
  return v3 ^ [(ChinaCellularInput *)self chinaCellularDevice];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ChinaCellularInput;
  id v4 = [(EligibilityInput *)&v6 copyWithZone:a3];
  [v4 setChinaCellularDevice:-[ChinaCellularInput chinaCellularDevice](self, "chinaCellularDevice")];
  return v4;
}

- (ChinaCellularInput)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ChinaCellularInput;
  unint64_t v3 = [(EligibilityInput *)&v5 initWithInputType:5 status:0 process:@"eligibilityd"];
  if (v3) {
    v3->_chinaCellularDevice = +[ChinaCellularInput _isGreenTeaDeviceCapable];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ChinaCellularInput;
  [(EligibilityInput *)&v3 encodeWithCoder:a3];
}

- (ChinaCellularInput)init
{
  v4.receiver = self;
  v4.super_class = (Class)ChinaCellularInput;
  v2 = [(EligibilityInput *)&v4 initWithInputType:5 status:0 process:@"eligibilityd"];
  if (v2) {
    v2->_chinaCellularDevice = +[ChinaCellularInput _isGreenTeaDeviceCapable];
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_isGreenTeaDeviceCapable
{
  return MGGetBoolAnswer();
}

@end