@interface PDWebService
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)deviceIdentifier;
- (NSString)passTypeIdentifier;
- (NSString)pushToken;
- (NSString)teamIdentifier;
- (NSURL)serviceURL;
- (PDWebService)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)generateNewDeviceIdentifier;
- (void)setDeviceIdentifier:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setServiceURL:(id)a3;
- (void)setTeamIdentifier:(id)a3;
@end

@implementation PDWebService

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    passTypeIdentifier = self->_passTypeIdentifier;
    uint64_t v6 = [v4 passTypeIdentifier];
    if ((unint64_t)passTypeIdentifier | v6
      && ![(NSString *)passTypeIdentifier isEqual:v6])
    {
      unsigned __int8 v15 = 0;
    }
    else
    {
      teamIdentifier = self->_teamIdentifier;
      uint64_t v8 = [v4 passTypeIdentifier];
      if ((unint64_t)teamIdentifier | v8 && ![(NSString *)teamIdentifier isEqual:v8])
      {
        unsigned __int8 v15 = 0;
      }
      else
      {
        serviceURL = self->_serviceURL;
        uint64_t v10 = [v4 serviceURL];
        if ((unint64_t)serviceURL | v10 && ![(NSURL *)serviceURL isEqual:v10])
        {
          unsigned __int8 v15 = 0;
        }
        else
        {
          pushToken = self->_pushToken;
          uint64_t v12 = [v4 pushToken];
          if ((unint64_t)pushToken | v12 && ![(NSString *)pushToken isEqual:v12])
          {
            unsigned __int8 v15 = 0;
          }
          else
          {
            deviceIdentifier = self->_deviceIdentifier;
            uint64_t v14 = [v4 deviceIdentifier];
            if ((unint64_t)deviceIdentifier | v14) {
              unsigned __int8 v15 = [(NSString *)deviceIdentifier isEqual:v14];
            }
            else {
              unsigned __int8 v15 = 1;
            }
          }
        }
      }
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (id)description
{
  v3 = [(PDWebService *)self passTypeIdentifier];
  id v4 = [(PDWebService *)self serviceURL];
  v5 = [(PDWebService *)self pushToken];
  uint64_t v6 = [(PDWebService *)self deviceIdentifier];
  v7 = +[NSString stringWithFormat:@"<PassTypeID: %@> <URL: %@> <Push token: %@> <Device identifier: %@>", v3, v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDWebService)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PDWebService;
  v5 = [(PDWebService *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceURL"];
    serviceURL = v5->_serviceURL;
    v5->_serviceURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  passTypeIdentifier = self->_passTypeIdentifier;
  id v5 = a3;
  [v5 encodeObject:passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v5 encodeObject:self->_teamIdentifier forKey:@"teamIdentifier"];
  [v5 encodeObject:self->_serviceURL forKey:@"serviceURL"];
  [v5 encodeObject:self->_pushToken forKey:@"pushToken"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
}

- (void)generateNewDeviceIdentifier
{
  PDGenerateRandomDeviceIdentifier();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PDWebService *)self setDeviceIdentifier:v3];
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (void)setServiceURL:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end