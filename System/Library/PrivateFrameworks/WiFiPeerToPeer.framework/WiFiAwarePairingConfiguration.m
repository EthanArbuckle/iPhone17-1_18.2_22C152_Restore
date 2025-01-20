@interface WiFiAwarePairingConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)pairingCachingEnabled;
- (NSArray)supportedPairSetupMethods;
- (WiFiAwarePairingConfiguration)initWithCoder:(id)a3;
- (WiFiAwarePairingConfiguration)initWithSupportedPairSetupMethods:(id)a3 pairingCachingEnabled:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WiFiAwarePairingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwarePairingConfiguration)initWithSupportedPairSetupMethods:(id)a3 pairingCachingEnabled:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WiFiAwarePairingConfiguration;
  v7 = [(WiFiAwarePairingConfiguration *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    supportedPairSetupMethods = v7->_supportedPairSetupMethods;
    v7->_supportedPairSetupMethods = (NSArray *)v8;

    v7->_pairingCachingEnabled = a4;
  }

  return v7;
}

- (WiFiAwarePairingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"WiFiAwarePairingConfiguration.pairingMethods"];
  if (v5)
  {
    self = -[WiFiAwarePairingConfiguration initWithSupportedPairSetupMethods:pairingCachingEnabled:](self, "initWithSupportedPairSetupMethods:pairingCachingEnabled:", v5, [v4 decodeBoolForKey:@"WiFiAwarePairingConfiguration.pairingCaching"]);
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(WiFiAwarePairingConfiguration *)self supportedPairSetupMethods];
  [v5 encodeObject:v4 forKey:@"WiFiAwarePairingConfiguration.pairingMethods"];

  objc_msgSend(v5, "encodeBool:forKey:", -[WiFiAwarePairingConfiguration pairingCachingEnabled](self, "pairingCachingEnabled"), @"WiFiAwarePairingConfiguration.pairingCaching");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwarePairingConfiguration *)a3;
  if (self == v4)
  {
    id v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v10 = 0;
      id v5 = 0;
      goto LABEL_11;
    }
    id v5 = v4;
    id v6 = [(WiFiAwarePairingConfiguration *)self supportedPairSetupMethods];
    v7 = [(WiFiAwarePairingConfiguration *)v5 supportedPairSetupMethods];
    if (![v6 isEqualToArray:v7])
    {

LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    int v8 = [(WiFiAwarePairingConfiguration *)self pairingCachingEnabled];
    int v9 = [(WiFiAwarePairingConfiguration *)v5 pairingCachingEnabled];

    if (v8 != v9) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WiFiAwarePairingConfiguration alloc];
  id v5 = [(WiFiAwarePairingConfiguration *)self supportedPairSetupMethods];
  id v6 = [(WiFiAwarePairingConfiguration *)v4 initWithSupportedPairSetupMethods:v5 pairingCachingEnabled:[(WiFiAwarePairingConfiguration *)self pairingCachingEnabled]];

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WiFiAwarePairingConfiguration *)self supportedPairSetupMethods];
  id v5 = WiFiAwarePairingMethodsString(v4);
  BOOL v6 = [(WiFiAwarePairingConfiguration *)self pairingCachingEnabled];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  int v8 = [v3 stringWithFormat:@"<WiFiAwarePairing supportedMethods=%@, caching=%s>", v5, v7];

  return v8;
}

- (NSArray)supportedPairSetupMethods
{
  return self->_supportedPairSetupMethods;
}

- (BOOL)pairingCachingEnabled
{
  return self->_pairingCachingEnabled;
}

- (void).cxx_destruct
{
}

@end