@interface ExternalBootDriveInput
+ (BOOL)queryHasExternalBootDrive;
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExternalBootDrive;
- (BOOL)isEqual:(id)a3;
- (ExternalBootDriveInput)init;
- (ExternalBootDriveInput)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasExternalBootDrive:(BOOL)a3;
@end

@implementation ExternalBootDriveInput

- (void)setHasExternalBootDrive:(BOOL)a3
{
  self->_hasExternalBootDrive = a3;
}

- (BOOL)hasExternalBootDrive
{
  return self->_hasExternalBootDrive;
}

- (id)description
{
  if ([(ExternalBootDriveInput *)self hasExternalBootDrive]) {
    CFStringRef v3 = @"Y";
  }
  else {
    CFStringRef v3 = @"N";
  }
  v7.receiver = self;
  v7.super_class = (Class)ExternalBootDriveInput;
  v4 = [(EligibilityInput *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[ExternalBootDriveInput hasExternalBootDrive:%@ %@]", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ExternalBootDriveInput *)a3;
  v11.receiver = self;
  v11.super_class = (Class)ExternalBootDriveInput;
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
    unsigned int v6 = [(ExternalBootDriveInput *)self hasExternalBootDrive];
    unsigned int v7 = v6 ^ [(ExternalBootDriveInput *)v5 hasExternalBootDrive];
    if (v7 == 1)
    {
      v8 = sub_10000D0EC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[ExternalBootDriveInput isEqual:]";
        __int16 v14 = 2080;
        v15 = "hasExternalBootDrive";
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
  v5.super_class = (Class)ExternalBootDriveInput;
  unint64_t v3 = [(EligibilityInput *)&v5 hash];
  return v3 ^ [(ExternalBootDriveInput *)self hasExternalBootDrive];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExternalBootDriveInput;
  id v4 = [(EligibilityInput *)&v6 copyWithZone:a3];
  [v4 setHasExternalBootDrive:-[ExternalBootDriveInput hasExternalBootDrive](self, "hasExternalBootDrive")];
  return v4;
}

- (ExternalBootDriveInput)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ExternalBootDriveInput;
  unint64_t v3 = [(EligibilityInput *)&v5 initWithInputType:11 status:0 process:@"eligibilityd"];
  if (v3) {
    v3->_hasExternalBootDrive = +[ExternalBootDriveInput queryHasExternalBootDrive];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ExternalBootDriveInput;
  [(EligibilityInput *)&v3 encodeWithCoder:a3];
}

- (ExternalBootDriveInput)init
{
  v4.receiver = self;
  v4.super_class = (Class)ExternalBootDriveInput;
  v2 = [(EligibilityInput *)&v4 initWithInputType:11 status:0 process:@"eligibilityd"];
  if (v2) {
    v2->_hasExternalBootDrive = +[ExternalBootDriveInput queryHasExternalBootDrive];
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)queryHasExternalBootDrive
{
  return 0;
}

@end