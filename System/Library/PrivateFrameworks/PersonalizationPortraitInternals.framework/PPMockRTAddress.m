@interface PPMockRTAddress
- (NSArray)areasOfInterest;
- (NSString)administrativeArea;
- (NSString)administrativeAreaCode;
- (NSString)country;
- (NSString)countryCode;
- (NSString)inlandWater;
- (NSString)locality;
- (NSString)ocean;
- (NSString)postalCode;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (void)setAdministrativeArea:(id)a3;
- (void)setAdministrativeAreaCode:(id)a3;
- (void)setAreasOfInterest:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setInlandWater:(id)a3;
- (void)setLocality:(id)a3;
- (void)setOcean:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setSubLocality:(id)a3;
- (void)setSubThoroughfare:(id)a3;
- (void)setThoroughfare:(id)a3;
@end

@implementation PPMockRTAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
}

- (void)setAreasOfInterest:(id)a3
{
}

- (NSArray)areasOfInterest
{
  return self->_areasOfInterest;
}

- (void)setOcean:(id)a3
{
}

- (NSString)ocean
{
  return self->_ocean;
}

- (void)setInlandWater:(id)a3
{
}

- (NSString)inlandWater
{
  return self->_inlandWater;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountry:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setPostalCode:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setAdministrativeAreaCode:(id)a3
{
}

- (NSString)administrativeAreaCode
{
  return self->_administrativeAreaCode;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setLocality:(id)a3
{
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setSubLocality:(id)a3
{
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setThoroughfare:(id)a3
{
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setSubThoroughfare:(id)a3
{
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

@end