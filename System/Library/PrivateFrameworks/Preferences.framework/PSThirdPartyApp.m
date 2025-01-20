@interface PSThirdPartyApp
- (LSApplicationProxy)proxy;
- (LSApplicationRecord)record;
- (PSThirdPartyApp)initWithApplicationProxy:(id)a3;
- (PSThirdPartyApp)initWithApplicationRecord:(id)a3;
- (id)description;
- (id)localizedName;
- (void)load;
@end

@implementation PSThirdPartyApp

- (PSThirdPartyApp)initWithApplicationProxy:(id)a3
{
  v4 = [a3 correspondingApplicationRecord];
  v5 = [(PSThirdPartyApp *)self initWithApplicationRecord:v4];

  return v5;
}

- (PSThirdPartyApp)initWithApplicationRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSThirdPartyApp;
  v6 = [(PSThirdPartyApp *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_record, a3);
  }

  return v7;
}

- (LSApplicationProxy)proxy
{
  v3 = [(LSApplicationRecord *)self->_record bundleIdentifier];
  NSLog(&cfstr_OverrideWithRe.isa, v3);

  record = self->_record;
  return (LSApplicationProxy *)[(LSApplicationRecord *)record compatibilityObject];
}

- (id)localizedName
{
  localizedName = self->_localizedName;
  if (!localizedName)
  {
    v4 = [(LSApplicationRecord *)self->_record localizedName];
    if (![v4 length])
    {
      uint64_t v5 = [(LSApplicationRecord *)self->_record localizedName];

      v4 = (void *)v5;
    }
    v6 = self->_localizedName;
    self->_localizedName = (NSString *)v4;

    localizedName = self->_localizedName;
  }
  return localizedName;
}

- (void)load
{
  id v2 = [(PSThirdPartyApp *)self localizedName];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  localizedName = (__CFString *)self->_localizedName;
  if (!localizedName) {
    localizedName = @"(not loaded)";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p name: '%@'>", v4, self, localizedName];
}

- (LSApplicationRecord)record
{
  return self->_record;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end