@interface NRDevice
- (id)_bridgeConciseDebugDescription;
@end

@implementation NRDevice

- (id)_bridgeConciseDebugDescription
{
  v16 = [(NRDevice *)self valueForProperty:NRDevicePropertyName];
  v15 = [(NRDevice *)self valueForProperty:NRDevicePropertyAdvertisedName];
  v17 = [(NRDevice *)self valueForProperty:NRDevicePropertyIsActive];
  v14 = [(NRDevice *)self valueForProperty:NRDevicePropertyIsPaired];
  v12 = [(NRDevice *)self valueForProperty:NRDevicePropertyIsSetup];
  v3 = [(NRDevice *)self valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  v4 = [(NRDevice *)self valueForProperty:NRDevicePropertyProductType];
  v5 = [(NRDevice *)self valueForProperty:NRDevicePropertyDeviceBrand];
  v13 = BPSShortLocalizedVariantSizeForProductType();
  v6 = [(NRDevice *)self valueForProperty:NRDevicePropertySystemBuildVersion];
  v7 = [(NRDevice *)self valueForProperty:NRDevicePropertyDmin];
  v8 = [v7 objectForKeyedSubscript:&off_10025C040];

  v9 = [(NRDevice *)self valueForProperty:NRDevicePropertyDeviceHousingColor];
  v10 = +[NSString stringWithFormat:@"[NRDevice %p] Name: %@, AdvertisingID %@, Build: %@ Size: %@, DminTopEnclosure: %@ DeviceHousingColor: %@, Brand: %@, Paired %@, Setup %@, Active %@, ProductType: %@, PairingStorePath: %@", self, v16, v15, v6, v13, v8, v9, v5, v14, v12, v17, v4, v3];

  return v10;
}

@end