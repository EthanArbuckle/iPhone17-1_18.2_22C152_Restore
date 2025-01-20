@interface NCSComplication
- (BOOL)cannotBeDisabled;
- (BOOL)isActive;
- (BOOL)isInstalled;
- (NCSComplication)initWithDictionary:(id)a3;
- (NSString)appBundleIdentifier;
- (NSString)complicationBundleIdentifier;
- (NSString)complicationIdentifier;
- (NSString)name;
- (NSString)sockPuppetIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)installState;
- (void)setActive:(BOOL)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setCannotBeDisabled:(BOOL)a3;
- (void)setComplicationBundleIdentifier:(id)a3;
- (void)setInstallState:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setSockPuppetIdentifier:(id)a3;
@end

@implementation NCSComplication

- (NCSComplication)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NCSComplication;
  v5 = [(NCSComplication *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appBundleID"];
    uint64_t v7 = [v6 copy];
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v7;

    v9 = [v4 objectForKeyedSubscript:@"complicationBundleID"];
    uint64_t v10 = [v9 copy];
    complicationBundleIdentifier = v5->_complicationBundleIdentifier;
    v5->_complicationBundleIdentifier = (NSString *)v10;

    v12 = [v4 objectForKeyedSubscript:@"sockPuppetIdentifier"];
    uint64_t v13 = [v12 copy];
    sockPuppetIdentifier = v5->_sockPuppetIdentifier;
    v5->_sockPuppetIdentifier = (NSString *)v13;

    v15 = [v4 objectForKeyedSubscript:@"active"];
    v5->_active = [v15 BOOLValue];

    v16 = [v4 objectForKeyedSubscript:@"installState"];

    if (v16)
    {
      v17 = [v4 objectForKeyedSubscript:@"installState"];
      v5->_installState = [v17 integerValue];
    }
    else
    {
      v5->_installState = 2;
    }
  }

  return v5;
}

- (NSString)complicationIdentifier
{
  sockPuppetIdentifier = self->_sockPuppetIdentifier;
  if (sockPuppetIdentifier)
  {
    v3 = [NSString stringWithFormat:@"%@%@", self->_complicationBundleIdentifier, sockPuppetIdentifier];
  }
  else
  {
    v3 = self->_complicationBundleIdentifier;
  }
  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"name: %@, appBundleIdentifier: %@, complicationBundleIdentifier: %@, sockPuppetIdentifier: %@, isActive: %d, installState: %lu", self->_name, self->_appBundleIdentifier, self->_complicationBundleIdentifier, self->_sockPuppetIdentifier, self->_active, self->_installState];
}

- (BOOL)isInstalled
{
  return self->_installState == 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NCSComplication *)self name];
  [v4 setName:v5];

  v6 = [(NCSComplication *)self appBundleIdentifier];
  [v4 setAppBundleIdentifier:v6];

  uint64_t v7 = [(NCSComplication *)self complicationBundleIdentifier];
  [v4 setComplicationBundleIdentifier:v7];

  objc_msgSend(v4, "setCannotBeDisabled:", -[NCSComplication cannotBeDisabled](self, "cannotBeDisabled"));
  objc_msgSend(v4, "setActive:", -[NCSComplication isActive](self, "isActive"));
  v8 = [(NCSComplication *)self sockPuppetIdentifier];
  [v4 setSockPuppetIdentifier:v8];

  objc_msgSend(v4, "setInstallState:", -[NCSComplication installState](self, "installState"));
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)complicationBundleIdentifier
{
  return self->_complicationBundleIdentifier;
}

- (void)setComplicationBundleIdentifier:(id)a3
{
}

- (NSString)sockPuppetIdentifier
{
  return self->_sockPuppetIdentifier;
}

- (void)setSockPuppetIdentifier:(id)a3
{
}

- (BOOL)cannotBeDisabled
{
  return self->_cannotBeDisabled;
}

- (void)setCannotBeDisabled:(BOOL)a3
{
  self->_cannotBeDisabled = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (unint64_t)installState
{
  return self->_installState;
}

- (void)setInstallState:(unint64_t)a3
{
  self->_installState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sockPuppetIdentifier, 0);
  objc_storeStrong((id *)&self->_complicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end