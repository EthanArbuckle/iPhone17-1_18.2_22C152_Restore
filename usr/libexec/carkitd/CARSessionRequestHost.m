@interface CARSessionRequestHost
- (id)initWithDisplayName:(id)a3 authenticationCertificateSerial:(id)a4 pairedVehicleIdentifier:(id)a5 wiFiUUID:(id)a6 bleStartSessionMessage:(id)a7;
@end

@implementation CARSessionRequestHost

- (id)initWithDisplayName:(id)a3 authenticationCertificateSerial:(id)a4 pairedVehicleIdentifier:(id)a5 wiFiUUID:(id)a6 bleStartSessionMessage:(id)a7
{
  id v11 = a7;
  id v25 = a6;
  id v12 = a5;
  id v24 = a4;
  id v13 = a3;
  v23 = [v11 wiredIPs];
  v14 = [v11 wirelessIPs];
  v26 = [v11 port];
  id v15 = [v26 integerValue];
  v16 = [v11 deviceID];
  v17 = [v11 publicKey];
  v18 = [v11 sourceVersion];

  LOBYTE(v22) = 0;
  LOBYTE(v21) = 1;
  v19 = [(CARSessionRequestHost *)self initWithDisplayName:v13 wiredIPv6Addresses:v23 wirelessIPv6Addresses:v14 port:v15 carplayWiFiUUID:v25 deviceIdentifier:v16 publicKey:v17 sourceVersion:v18 supportsMutualAuthentication:v21 authenticationCertificateSerial:v24 pairedVehicleIdentifier:v12 wiredCarPlaySimulator:v22];

  return v19;
}

@end