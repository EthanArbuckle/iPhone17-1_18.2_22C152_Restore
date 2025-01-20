@interface PKPassUpgradePrecursorPassIssuerAppAction
+ (BOOL)supportsSecureCoding;
- (NSString)appIdentifier;
- (NSString)appUrl;
- (PKPassUpgradePrecursorPassIssuerAppAction)initWithCoder:(id)a3;
- (PKPassUpgradePrecursorPassIssuerAppAction)initWithDictionary:(id)a3;
- (id)asDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassUpgradePrecursorPassIssuerAppAction

- (PKPassUpgradePrecursorPassIssuerAppAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassUpgradePrecursorPassIssuerAppAction;
  v5 = [(PKPassUpgradePrecursorPassAction *)&v11 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"app_url"];
    appUrl = v5->_appUrl;
    v5->_appUrl = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"app_identifier"];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v8;

    if (!v5->_appUrl && !v5->_appIdentifier)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)asDictionary
{
  v11.receiver = self;
  v11.super_class = (Class)PKPassUpgradePrecursorPassIssuerAppAction;
  v3 = [(PKPassUpgradePrecursorPassAction *)&v11 asDictionary];
  id v4 = (void *)[v3 mutableCopy];

  appUrl = self->_appUrl;
  if (appUrl)
  {
    uint64_t v6 = (void *)[(NSString *)appUrl copy];
    [v4 setObject:v6 forKeyedSubscript:@"app_url"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier)
  {
    uint64_t v8 = (void *)[(NSString *)appIdentifier copy];
    [v4 setObject:v8 forKeyedSubscript:@"app_identifier"];
  }
  v9 = (void *)[v4 copy];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassUpgradePrecursorPassIssuerAppAction;
  id v4 = a3;
  [(PKPassUpgradePrecursorPassAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_appUrl, @"app_url", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_appIdentifier forKey:@"app_identifier"];
}

- (PKPassUpgradePrecursorPassIssuerAppAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassUpgradePrecursorPassIssuerAppAction;
  objc_super v5 = [(PKPassUpgradePrecursorPassAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"app_url"];
    appUrl = v5->_appUrl;
    v5->_appUrl = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"app_identifier"];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v8;
  }
  return v5;
}

- (NSString)appUrl
{
  return self->_appUrl;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_appUrl, 0);
}

@end