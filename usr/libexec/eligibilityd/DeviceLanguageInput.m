@interface DeviceLanguageInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DeviceLanguageInput)init;
- (DeviceLanguageInput)initWithCoder:(id)a3;
- (NSArray)deviceLanguages;
- (NSString)primaryLanguage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DeviceLanguageInput

- (id)description
{
  v3 = [(DeviceLanguageInput *)self primaryLanguage];
  v4 = [(DeviceLanguageInput *)self deviceLanguages];
  v8.receiver = self;
  v8.super_class = (Class)DeviceLanguageInput;
  v5 = [(EligibilityInput *)&v8 description];
  v6 = +[NSString stringWithFormat:@"[DeviceLanguageInput deviceLanguages:(%@)\"%@\" %@]", v3, v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DeviceLanguageInput *)a3;
  v7.receiver = self;
  v7.super_class = (Class)DeviceLanguageInput;
  if ([(EligibilityInput *)&v7 isEqual:v4])
  {
    if (v4 == self)
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)DeviceLanguageInput;
  return [(EligibilityInput *)&v3 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DeviceLanguageInput;
  return [(EligibilityInput *)&v4 copyWithZone:a3];
}

- (DeviceLanguageInput)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DeviceLanguageInput;
  return [(EligibilityInput *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DeviceLanguageInput;
  [(EligibilityInput *)&v3 encodeWithCoder:a3];
}

- (DeviceLanguageInput)init
{
  v3.receiver = self;
  v3.super_class = (Class)DeviceLanguageInput;
  return [(EligibilityInput *)&v3 initWithInputType:7 status:0 process:@"eligibilityd"];
}

- (NSString)primaryLanguage
{
  objc_super v3 = +[NSLocale systemLanguages];
  objc_super v4 = [(DeviceLanguageInput *)self deviceLanguages];
  v5 = +[NSBundle preferredLocalizationsFromArray:v3 forPreferences:v4];
  v6 = [v5 firstObject];

  return (NSString *)v6;
}

- (NSArray)deviceLanguages
{
  v2 = +[GlobalConfiguration sharedInstance];
  objc_super v3 = [v2 currentUsername];

  if (v3) {
    objc_super v4 = (void *)CFPreferencesCopyValue(@"AppleLanguages", kCFPreferencesAnyApplication, v3, kCFPreferencesAnyHost);
  }
  else {
    objc_super v4 = 0;
  }

  return (NSArray *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end