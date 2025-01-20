@interface PPMockRTLocationOfInterest
+ (id)mockLocationOfInterestWithSubThoroughfare:(id)a3 thoroughfare:(id)a4 subLocality:(id)a5 locality:(id)a6 administrativeArea:(id)a7 administrativeAreaCode:(id)a8 postalCode:(id)a9 country:(id)a10 countryCode:(id)a11 longitude:(double)a12 latitude:(double)a13 visits:(id)a14;
- (NSArray)visits;
- (PPMockRTMapItem)mapItem;
- (int64_t)type;
- (void)setMapItem:(id)a3;
- (void)setVisits:(id)a3;
@end

@implementation PPMockRTLocationOfInterest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

- (void)setVisits:(id)a3
{
}

- (NSArray)visits
{
  return self->_visits;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setMapItem:(id)a3
{
}

- (PPMockRTMapItem)mapItem
{
  return self->_mapItem;
}

+ (id)mockLocationOfInterestWithSubThoroughfare:(id)a3 thoroughfare:(id)a4 subLocality:(id)a5 locality:(id)a6 administrativeArea:(id)a7 administrativeAreaCode:(id)a8 postalCode:(id)a9 country:(id)a10 countryCode:(id)a11 longitude:(double)a12 latitude:(double)a13 visits:(id)a14
{
  id v36 = a14;
  id v35 = a11;
  id v22 = a10;
  id v23 = a9;
  id v24 = a8;
  id v25 = a7;
  id v26 = a6;
  id v27 = a5;
  id v28 = a4;
  id v29 = a3;
  v30 = objc_opt_new();
  [v30 setSubThoroughfare:v29];

  [v30 setThoroughfare:v28];
  [v30 setSubLocality:v27];

  [v30 setLocality:v26];
  [v30 setAdministrativeArea:v25];

  [v30 setAdministrativeAreaCode:v24];
  [v30 setPostalCode:v23];

  [v30 setCountry:v22];
  [v30 setCountryCode:v35];

  v31 = objc_opt_new();
  [v31 setLatitude:a13];
  [v31 setLongitude:a12];
  v32 = objc_opt_new();
  [v32 setAddress:v30];
  [v32 setLocation:v31];
  v33 = objc_opt_new();
  [v33 setMapItem:v32];
  [v33 setVisits:v36];

  return v33;
}

@end