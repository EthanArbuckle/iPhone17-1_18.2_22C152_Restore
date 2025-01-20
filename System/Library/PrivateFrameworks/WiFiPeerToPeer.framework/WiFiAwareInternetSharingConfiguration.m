@interface WiFiAwareInternetSharingConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)automaticallyProvideInternetToResponders;
+ (id)automaticallyRequestInternetFromInitiators;
+ (id)provideInternetToInitiatorsFromInterface:(id)a3;
+ (id)requestInterentFromResponder;
- (BOOL)automatic;
- (BOOL)interfaceNameEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)provider;
- (BOOL)useBridging;
- (NSString)interfaceName;
- (WiFiAwareInternetSharingConfiguration)initWithCoder:(id)a3;
- (WiFiAwareInternetSharingConfiguration)initWithInterfaceName:(id)a3 isProvider:(BOOL)a4 isAutomatic:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomatic:(BOOL)a3;
- (void)setInterfaceName:(id)a3;
- (void)setProvider:(BOOL)a3;
- (void)setUseBridging:(BOOL)a3;
@end

@implementation WiFiAwareInternetSharingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareInternetSharingConfiguration)initWithInterfaceName:(id)a3 isProvider:(BOOL)a4 isAutomatic:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WiFiAwareInternetSharingConfiguration;
  v9 = [(WiFiAwareInternetSharingConfiguration *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    interfaceName = v9->_interfaceName;
    v9->_interfaceName = (NSString *)v10;

    v9->_provider = a4;
    v9->_automatic = a5;
    v9->_useBridging = 0;
  }

  return v9;
}

- (WiFiAwareInternetSharingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareInternetSharingConfiguration.interfaceName"];
  uint64_t v6 = [v4 decodeBoolForKey:@"WiFiAwareInternetSharingConfiguration.provider"];
  uint64_t v7 = [v4 decodeBoolForKey:@"WiFiAwareInternetSharingConfiguration.automatic"];
  char v8 = [v4 decodeBoolForKey:@"WiFiAwareInternetSharingConfiguration.useBridging"];

  v9 = [(WiFiAwareInternetSharingConfiguration *)self initWithInterfaceName:v5 isProvider:v6 isAutomatic:v7];
  v9->_useBridging = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(WiFiAwareInternetSharingConfiguration *)self interfaceName];
  [v5 encodeObject:v4 forKey:@"WiFiAwareInternetSharingConfiguration.interfaceName"];

  objc_msgSend(v5, "encodeBool:forKey:", -[WiFiAwareInternetSharingConfiguration provider](self, "provider"), @"WiFiAwareInternetSharingConfiguration.provider");
  objc_msgSend(v5, "encodeBool:forKey:", -[WiFiAwareInternetSharingConfiguration automatic](self, "automatic"), @"WiFiAwareInternetSharingConfiguration.automatic");
  objc_msgSend(v5, "encodeBool:forKey:", -[WiFiAwareInternetSharingConfiguration useBridging](self, "useBridging"), @"WiFiAwareInternetSharingConfiguration.useBridging");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WiFiAwareInternetSharingConfiguration alloc];
  id v5 = [(WiFiAwareInternetSharingConfiguration *)self interfaceName];
  uint64_t v6 = [(WiFiAwareInternetSharingConfiguration *)v4 initWithInterfaceName:v5 isProvider:[(WiFiAwareInternetSharingConfiguration *)self provider] isAutomatic:[(WiFiAwareInternetSharingConfiguration *)self automatic]];

  [(WiFiAwareInternetSharingConfiguration *)v6 setUseBridging:[(WiFiAwareInternetSharingConfiguration *)self useBridging]];
  return v6;
}

+ (id)provideInternetToInitiatorsFromInterface:(id)a3
{
  id v3 = a3;
  id v4 = [[WiFiAwareInternetSharingConfiguration alloc] initWithInterfaceName:v3 isProvider:1 isAutomatic:0];

  return v4;
}

+ (id)automaticallyProvideInternetToResponders
{
  v2 = [[WiFiAwareInternetSharingConfiguration alloc] initWithInterfaceName:0 isProvider:1 isAutomatic:1];
  return v2;
}

+ (id)requestInterentFromResponder
{
  v2 = [[WiFiAwareInternetSharingConfiguration alloc] initWithInterfaceName:0 isProvider:0 isAutomatic:0];
  return v2;
}

+ (id)automaticallyRequestInternetFromInitiators
{
  v2 = [[WiFiAwareInternetSharingConfiguration alloc] initWithInterfaceName:0 isProvider:0 isAutomatic:1];
  return v2;
}

- (BOOL)interfaceNameEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(WiFiAwareInternetSharingConfiguration *)self interfaceName];
  uint64_t v6 = [v4 interfaceName];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v7 = [(WiFiAwareInternetSharingConfiguration *)self interfaceName];
    char v8 = [v4 interfaceName];
    char v9 = [v7 isEqualToString:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwareInternetSharingConfiguration *)a3;
  if (self == v4)
  {
    id v5 = 0;
LABEL_9:
    BOOL v9 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v9 = 0;
    id v5 = 0;
    goto LABEL_11;
  }
  id v5 = v4;
  if ([(WiFiAwareInternetSharingConfiguration *)self interfaceNameEqual:v5])
  {
    BOOL v6 = [(WiFiAwareInternetSharingConfiguration *)self provider];
    if (v6 == [(WiFiAwareInternetSharingConfiguration *)v5 provider])
    {
      BOOL v7 = [(WiFiAwareInternetSharingConfiguration *)self automatic];
      if (v7 == [(WiFiAwareInternetSharingConfiguration *)v5 automatic])
      {
        BOOL v8 = [(WiFiAwareInternetSharingConfiguration *)self useBridging];
        if (v8 == [(WiFiAwareInternetSharingConfiguration *)v5 useBridging]) {
          goto LABEL_9;
        }
      }
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)description
{
  id v3 = [(WiFiAwareInternetSharingConfiguration *)self interfaceName];

  id v4 = "";
  if (v3)
  {
    id v5 = NSString;
    BOOL v6 = [(WiFiAwareInternetSharingConfiguration *)self interfaceName];
    BOOL v7 = [(WiFiAwareInternetSharingConfiguration *)self useBridging];
    BOOL v8 = " (bridged)";
    if (!v7) {
      BOOL v8 = "";
    }
    [v5 stringWithFormat:@" on interface=%@%s", v6, v8];
    BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = &stru_1F1806D08;
  }
  uint64_t v10 = NSString;
  if ([(WiFiAwareInternetSharingConfiguration *)self automatic]) {
    id v4 = "automatic ";
  }
  BOOL v11 = [(WiFiAwareInternetSharingConfiguration *)self provider];
  v12 = "requester";
  if (v11) {
    v12 = "provider";
  }
  objc_super v13 = [v10 stringWithFormat:@"<%s%s%@>", v4, v12, v9];

  return v13;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (BOOL)provider
{
  return self->_provider;
}

- (void)setProvider:(BOOL)a3
{
  self->_provider = a3;
}

- (BOOL)automatic
{
  return self->_automatic;
}

- (void)setAutomatic:(BOOL)a3
{
  self->_automatic = a3;
}

- (BOOL)useBridging
{
  return self->_useBridging;
}

- (void)setUseBridging:(BOOL)a3
{
  self->_useBridging = a3;
}

- (void).cxx_destruct
{
}

@end