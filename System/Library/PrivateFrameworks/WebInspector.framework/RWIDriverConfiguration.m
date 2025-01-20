@interface RWIDriverConfiguration
+ (BOOL)isValidPayload:(id)a3;
+ (id)decodeFromPayload:(id)a3;
- (NSString)driverHost;
- (NSString)driverIdentifier;
- (NSString)driverName;
- (NSString)driverVersion;
- (RWIDriverConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)driverPort;
- (void)encodeToPayload:(id)a3;
- (void)setDriverHost:(id)a3;
- (void)setDriverIdentifier:(id)a3;
- (void)setDriverName:(id)a3;
- (void)setDriverPort:(int64_t)a3;
- (void)setDriverVersion:(id)a3;
@end

@implementation RWIDriverConfiguration

- (RWIDriverConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)RWIDriverConfiguration;
  v2 = [(RWIDriverConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_driverPort = 0;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RWIDriverConfiguration *)self driverIdentifier];
  [v4 setDriverIdentifier:v5];

  objc_super v6 = [(RWIDriverConfiguration *)self driverName];
  [v4 setDriverName:v6];

  v7 = [(RWIDriverConfiguration *)self driverVersion];
  [v4 setDriverVersion:v7];

  v8 = [(RWIDriverConfiguration *)self driverHost];
  [v4 setDriverHost:v8];

  objc_msgSend(v4, "setDriverPort:", -[RWIDriverConfiguration driverPort](self, "driverPort"));
  return v4;
}

+ (BOOL)isValidPayload:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"WIRDriverIdentifierKey"];
  v5 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }

  v4 = [v3 objectForKeyedSubscript:@"WIRDriverNameKey"];
  v5 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }

  v4 = [v3 objectForKeyedSubscript:@"WIRDriverVersionKey"];
  v5 = objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
  }

  v4 = [v3 objectForKeyedSubscript:@"WIRDriverHostKey"];
  v5 = objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
  }

  v4 = [v3 objectForKeyedSubscript:@"WIRDriverPortKey"];
  v5 = objc_opt_class();
  if (!v4 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
LABEL_10:
    v7 = objc_opt_class();
    logUnexpectedType(v7, v5);
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)decodeFromPayload:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"WIRDriverIdentifierKey"];
  v5 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = objc_opt_class();
    logUnexpectedType(v14, v5);
    v12 = 0;
    goto LABEL_21;
  }

  v5 = [v3 objectForKeyedSubscript:@"WIRDriverNameKey"];
  objc_opt_class();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_isKindOfClass())
  {

    id v6 = [v3 objectForKeyedSubscript:@"WIRDriverVersionKey"];
    v7 = objc_opt_class();
    if (!v6 || (objc_opt_isKindOfClass() & 1) != 0)
    {

      id v8 = [v3 objectForKeyedSubscript:@"WIRDriverHostKey"];
      v9 = objc_opt_class();
      if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = objc_opt_class();
        logUnexpectedType(v17, v9);

        v12 = 0;
        id v10 = v8;
      }
      else
      {

        id v10 = [v3 objectForKeyedSubscript:@"WIRDriverPortKey"];
        v11 = objc_opt_class();
        if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          v18 = objc_opt_class();
          logUnexpectedType(v18, v11);

          v12 = 0;
        }
        else
        {

          v12 = objc_opt_new();
          [v12 setDriverIdentifier:v4];
          [v12 setDriverName:v5];
          [v12 setDriverVersion:v6];
          [v12 setDriverHost:v8];
          if (v10) {
            uint64_t v13 = [v10 integerValue];
          }
          else {
            uint64_t v13 = 0;
          }
          [v12 setDriverPort:v13];
        }
      }

      goto LABEL_20;
    }
    v16 = objc_opt_class();
    logUnexpectedType(v16, v7);
  }
  else
  {
    v15 = objc_opt_class();
    logUnexpectedType(v15, v6);
  }
  v12 = 0;
LABEL_20:

LABEL_21:
  return v12;
}

- (void)encodeToPayload:(id)a3
{
  id v11 = a3;
  v4 = [(RWIDriverConfiguration *)self driverIdentifier];
  [v11 setObject:v4 forKeyedSubscript:@"WIRDriverIdentifierKey"];

  v5 = [(RWIDriverConfiguration *)self driverName];
  [v11 setObject:v5 forKeyedSubscript:@"WIRDriverNameKey"];

  id v6 = [(RWIDriverConfiguration *)self driverVersion];

  if (v6)
  {
    v7 = [(RWIDriverConfiguration *)self driverVersion];
    [v11 setObject:v7 forKeyedSubscript:@"WIRDriverVersionKey"];
  }
  id v8 = [(RWIDriverConfiguration *)self driverHost];

  if (v8)
  {
    v9 = [(RWIDriverConfiguration *)self driverHost];
    [v11 setObject:v9 forKeyedSubscript:@"WIRDriverHostKey"];
  }
  if ([(RWIDriverConfiguration *)self driverPort])
  {
    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[RWIDriverConfiguration driverPort](self, "driverPort"));
    [v11 setObject:v10 forKeyedSubscript:@"WIRDriverPortKey"];
  }
}

- (NSString)driverIdentifier
{
  return self->_driverIdentifier;
}

- (void)setDriverIdentifier:(id)a3
{
}

- (NSString)driverName
{
  return self->_driverName;
}

- (void)setDriverName:(id)a3
{
}

- (NSString)driverVersion
{
  return self->_driverVersion;
}

- (void)setDriverVersion:(id)a3
{
}

- (NSString)driverHost
{
  return self->_driverHost;
}

- (void)setDriverHost:(id)a3
{
}

- (int64_t)driverPort
{
  return self->_driverPort;
}

- (void)setDriverPort:(int64_t)a3
{
  self->_driverPort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverHost, 0);
  objc_storeStrong((id *)&self->_driverVersion, 0);
  objc_storeStrong((id *)&self->_driverName, 0);
  objc_storeStrong((id *)&self->_driverIdentifier, 0);
}

@end