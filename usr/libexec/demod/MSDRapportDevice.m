@interface MSDRapportDevice
- (BOOL)authenticated;
- (BOOL)droppedByRapport;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRPCompanionLinkDevice:(id)a3;
- (BOOL)pairingMode;
- (MSDRapportDevice)initWithIncomingOptions:(id)a3;
- (MSDRapportDevice)initWithRPCompanionLinkDevice:(id)a3;
- (NSString)deviceName;
- (NSString)identifier;
- (RPCompanionLinkDevice)rpDevice;
- (id)description;
- (unint64_t)hash;
- (void)setAuthenticated:(BOOL)a3;
- (void)setDeviceName:(id)a3;
- (void)setDroppedByRapport:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPairingMode:(BOOL)a3;
- (void)setRpDevice:(id)a3;
@end

@implementation MSDRapportDevice

- (MSDRapportDevice)initWithRPCompanionLinkDevice:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDRapportDevice;
  v5 = [(MSDRapportDevice *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(MSDRapportDevice *)v5 setRpDevice:v4];
    -[MSDRapportDevice setPairingMode:](v6, "setPairingMode:", ((unint64_t)[v4 statusFlags] >> 31) & 1);
    -[MSDRapportDevice setAuthenticated:](v6, "setAuthenticated:", ((unint64_t)[v4 statusFlags] >> 15) & 1);
    v7 = [v4 name];
    [(MSDRapportDevice *)v6 setDeviceName:v7];

    v8 = [v4 idsDeviceIdentifier];

    if (v8) {
      [v4 idsDeviceIdentifier];
    }
    else {
    v9 = [v4 publicIdentifier];
    }
    [(MSDRapportDevice *)v6 setIdentifier:v9];

    [(MSDRapportDevice *)v6 setDroppedByRapport:0];
  }

  return v6;
}

- (MSDRapportDevice)initWithIncomingOptions:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSDRapportDevice;
  v5 = [(MSDRapportDevice *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)RPCompanionLinkDevice);
    uint64_t v7 = RPOptionSenderIDSDeviceID;
    v8 = [v4 objectForKeyedSubscript:RPOptionSenderIDSDeviceID];
    [v6 setIdentifier:v8];

    unint64_t Int64 = CFDictionaryGetInt64();
    [(MSDRapportDevice *)v5 setRpDevice:v6];
    [(MSDRapportDevice *)v5 setPairingMode:(Int64 >> 31) & 1];
    [(MSDRapportDevice *)v5 setAuthenticated:(Int64 >> 15) & 1];
    v10 = [v4 objectForKeyedSubscript:@"senderDeviceName"];
    [(MSDRapportDevice *)v5 setDeviceName:v10];

    objc_super v11 = [v4 objectForKeyedSubscript:v7];
    [(MSDRapportDevice *)v5 setIdentifier:v11];
  }
  return v5;
}

- (BOOL)isEqualToRPCompanionLinkDevice:(id)a3
{
  id v4 = a3;
  v5 = [v4 idsDeviceIdentifier];

  id v6 = [(MSDRapportDevice *)self identifier];
  if (v5) {
    [v4 idsDeviceIdentifier];
  }
  else {
  uint64_t v7 = [v4 publicIdentifier];
  }

  unsigned __int8 v8 = [v6 isEqualToString:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    id v6 = [(MSDRapportDevice *)self identifier];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MSDRapportDevice *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(MSDRapportDevice *)self identifier];
  id v6 = [(MSDRapportDevice *)self deviceName];
  unsigned __int8 v7 = +[NSString stringWithFormat:@"<%@[%p]: Identifier=%@ DeviceName=%@ PairingMode=%d Authenticated=%d>", v4, self, v5, v6, [(MSDRapportDevice *)self pairingMode], [(MSDRapportDevice *)self authenticated]];

  return v7;
}

- (RPCompanionLinkDevice)rpDevice
{
  return self->_rpDevice;
}

- (void)setRpDevice:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (BOOL)pairingMode
{
  return self->_pairingMode;
}

- (void)setPairingMode:(BOOL)a3
{
  self->_pairingMode = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)droppedByRapport
{
  return self->_droppedByRapport;
}

- (void)setDroppedByRapport:(BOOL)a3
{
  self->_droppedByRapport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_rpDevice, 0);
}

@end