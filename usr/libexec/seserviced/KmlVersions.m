@interface KmlVersions
- (KmlTlv)appletSupportedVersionsTlvForPairing;
- (KmlTlv)kmlSupportedVersionsTlvForPairing;
- (KmlTlv)kmlSupportedVersionsTlvForShareInitiator;
- (NSData)vehicleSupportedAppletVersionsTlvAsData;
- (NSData)vehicleSupportedBluetoothtVersionsTlvAsData;
- (NSData)vehicleSupportedFrameworkVersionsTlvAsData;
- (NSString)vehicleSupportedFrameworkVersionsForCA;
- (id)description;
- (unsigned)agreedAppletVehicleVersion;
- (unsigned)agreedKmlBluetoothVersion;
- (unsigned)agreedKmlSharingVersion;
- (unsigned)agreedKmlVehicleServerVersion;
- (unsigned)agreedKmlVehicleVersion;
- (unsigned)keyRoleToShare;
- (unsigned)ourPreferredKmlVersion;
- (unsigned)ourPreferredVehicleServerVersion;
@end

@implementation KmlVersions

- (id)description
{
  v3 = +[NSMutableString string];
  v4 = +[NSString stringWithFormat:@"VehicleSupportedFrameworkVersions   : %@\n", self->_vehicleSupportedFrameworkVersionsTlvAsData];
  [v3 appendString:v4];

  v5 = +[NSString stringWithFormat:@"VehicleSupportedAppletVersions      : %@\n", self->_vehicleSupportedAppletVersionsTlvAsData];
  [v3 appendString:v5];

  v6 = +[NSString stringWithFormat:@"VehicleSupportedBTVersions          : %@\n", self->_vehicleSupportedBluetoothVersionsTlvAsData];
  [v3 appendString:v6];

  v7 = +[NSString stringWithFormat:@"PreferredFrameworkVersion           : 0x%02X\n", self->_ourPreferredKmlVersion];
  [v3 appendString:v7];

  v8 = +[NSString stringWithFormat:@"AgreedFrameworkVersion              : 0x%02X\n", self->_agreedKmlVehicleVersion];
  [v3 appendString:v8];

  v9 = +[NSString stringWithFormat:@"AgreedAppletVersion                 : 0x%02X\n", self->_agreedAppletVehicleVersion];
  [v3 appendString:v9];

  v10 = +[NSString stringWithFormat:@"AgreedSharingFrameworkVersion       : 0x%02X\n", self->_agreedKmlSharingVersion];
  [v3 appendString:v10];

  v11 = +[NSString stringWithFormat:@"AgreedVehicleServerVersion          : 0x%02X\n", self->_agreedKmlVehicleServerVersion];
  [v3 appendString:v11];

  v12 = +[NSString stringWithFormat:@"AgreedBluetoothVersion              : 0x%02X\n", self->_agreedKmlBluetoothVersion];
  [v3 appendString:v12];

  return v3;
}

- (KmlTlv)kmlSupportedVersionsTlvForPairing
{
  return self->_kmlSupportedVersionsTlvForPairing;
}

- (KmlTlv)kmlSupportedVersionsTlvForShareInitiator
{
  return self->_kmlSupportedVersionsTlvForShareInitiator;
}

- (KmlTlv)appletSupportedVersionsTlvForPairing
{
  return self->_appletSupportedVersionsTlvForPairing;
}

- (NSData)vehicleSupportedFrameworkVersionsTlvAsData
{
  return self->_vehicleSupportedFrameworkVersionsTlvAsData;
}

- (NSString)vehicleSupportedFrameworkVersionsForCA
{
  return self->_vehicleSupportedFrameworkVersionsForCA;
}

- (NSData)vehicleSupportedAppletVersionsTlvAsData
{
  return self->_vehicleSupportedAppletVersionsTlvAsData;
}

- (NSData)vehicleSupportedBluetoothtVersionsTlvAsData
{
  return self->_vehicleSupportedBluetoothtVersionsTlvAsData;
}

- (unsigned)ourPreferredKmlVersion
{
  return self->_ourPreferredKmlVersion;
}

- (unsigned)agreedKmlVehicleVersion
{
  return self->_agreedKmlVehicleVersion;
}

- (unsigned)agreedKmlSharingVersion
{
  return self->_agreedKmlSharingVersion;
}

- (unsigned)agreedAppletVehicleVersion
{
  return self->_agreedAppletVehicleVersion;
}

- (unsigned)ourPreferredVehicleServerVersion
{
  return self->_ourPreferredVehicleServerVersion;
}

- (unsigned)agreedKmlVehicleServerVersion
{
  return self->_agreedKmlVehicleServerVersion;
}

- (unsigned)agreedKmlBluetoothVersion
{
  return self->_agreedKmlBluetoothVersion;
}

- (unsigned)keyRoleToShare
{
  return self->_keyRoleToShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleSupportedBluetoothVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleServerVersionsUpgradeReadyList, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVehicleServerVersionsList, 0);
  objc_storeStrong((id *)&self->_appletSupportedVersionsList, 0);
  objc_storeStrong((id *)&self->_kmlUpgradeReadyVersionsList, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsList, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedBluetoothtVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedAppletVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsForCA, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_appletSupportedVersionsTlvForPairing, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsTlvForShareInitiator, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsTlvForPairing, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end