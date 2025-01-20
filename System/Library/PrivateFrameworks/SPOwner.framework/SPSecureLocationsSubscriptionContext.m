@interface SPSecureLocationsSubscriptionContext
+ (BOOL)supportsSecureCoding;
- (NSDictionary)pushIdentifiers;
- (NSString)clientApp;
- (SPSecureLocationsSubscriptionContext)init;
- (SPSecureLocationsSubscriptionContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)fetchMode;
- (int64_t)subscriptionMode;
- (void)encodeWithCoder:(id)a3;
- (void)setClientApp:(id)a3;
- (void)setFetchMode:(int64_t)a3;
- (void)setPushIdentifiers:(id)a3;
- (void)setSubscriptionMode:(int64_t)a3;
@end

@implementation SPSecureLocationsSubscriptionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSecureLocationsSubscriptionContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPSecureLocationsSubscriptionContext;
  v2 = [(SPSecureLocationsSubscriptionContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    clientApp = v2->_clientApp;
    v2->_subscriptionMode = 0;
    v2->_clientApp = (NSString *)@"searchpartyd";

    v3->_fetchMode = 1;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SPSecureLocationsSubscriptionContext);
  v5 = [(SPSecureLocationsSubscriptionContext *)self clientApp];
  [(SPSecureLocationsSubscriptionContext *)v4 setClientApp:v5];

  [(SPSecureLocationsSubscriptionContext *)v4 setSubscriptionMode:[(SPSecureLocationsSubscriptionContext *)self subscriptionMode]];
  [(SPSecureLocationsSubscriptionContext *)v4 setFetchMode:[(SPSecureLocationsSubscriptionContext *)self fetchMode]];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  clientApp = self->_clientApp;
  id v5 = a3;
  [v5 encodeObject:clientApp forKey:@"clientApp"];
  [v5 encodeInteger:self->_subscriptionMode forKey:@"subscriptionMode"];
  [v5 encodeInteger:self->_fetchMode forKey:@"fetchMode"];
  [v5 encodeObject:self->_pushIdentifiers forKey:@"pushIdentifiers"];
}

- (SPSecureLocationsSubscriptionContext)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientApp"];
  clientApp = self->_clientApp;
  self->_clientApp = v5;

  self->_subscriptionMode = [v4 decodeIntegerForKey:@"subscriptionMode"];
  self->_fetchMode = [v4 decodeIntegerForKey:@"fetchMode"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:3];
  v9 = objc_msgSend(v7, "setWithArray:", v8, v13, v14);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"pushIdentifiers"];

  pushIdentifiers = self->_pushIdentifiers;
  self->_pushIdentifiers = v10;

  return self;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SPSecureLocationsSubscriptionContext *)self clientApp];
  id v5 = [v3 stringWithFormat:@"<clientApp %@, subMode %ld, fetchMode %ld>", v4, -[SPSecureLocationsSubscriptionContext subscriptionMode](self, "subscriptionMode"), -[SPSecureLocationsSubscriptionContext fetchMode](self, "fetchMode")];

  return v5;
}

- (int64_t)subscriptionMode
{
  return self->_subscriptionMode;
}

- (void)setSubscriptionMode:(int64_t)a3
{
  self->_subscriptionMode = a3;
}

- (NSString)clientApp
{
  return self->_clientApp;
}

- (void)setClientApp:(id)a3
{
}

- (int64_t)fetchMode
{
  return self->_fetchMode;
}

- (void)setFetchMode:(int64_t)a3
{
  self->_fetchMode = a3;
}

- (NSDictionary)pushIdentifiers
{
  return self->_pushIdentifiers;
}

- (void)setPushIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushIdentifiers, 0);

  objc_storeStrong((id *)&self->_clientApp, 0);
}

@end