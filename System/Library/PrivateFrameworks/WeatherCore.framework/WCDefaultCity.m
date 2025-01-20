@interface WCDefaultCity
+ (id)cityFromAlCity:(id)a3;
- (NSString)countryName;
- (NSString)countryOverride;
- (NSString)localeCode;
- (NSString)name;
- (NSString)timeZone;
- (NSString)unlocalizedCountryName;
- (NSString)unlocalizedCountryOverride;
- (NSString)unlocalizedName;
- (float)latitude;
- (float)longitude;
- (id)description;
- (void)setCountryName:(id)a3;
- (void)setCountryOverride:(id)a3;
- (void)setLatitude:(float)a3;
- (void)setLocaleCode:(id)a3;
- (void)setLongitude:(float)a3;
- (void)setName:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setUnlocalizedCountryName:(id)a3;
- (void)setUnlocalizedCountryOverride:(id)a3;
- (void)setUnlocalizedName:(id)a3;
@end

@implementation WCDefaultCity

+ (id)cityFromAlCity:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(WCDefaultCity);
  v5 = [v3 localeCode];
  [(WCDefaultCity *)v4 setLocaleCode:v5];

  v6 = [v3 timeZone];
  [(WCDefaultCity *)v4 setTimeZone:v6];

  [v3 longitude];
  -[WCDefaultCity setLongitude:](v4, "setLongitude:");
  [v3 latitude];
  -[WCDefaultCity setLatitude:](v4, "setLatitude:");
  v7 = [v3 name];
  [(WCDefaultCity *)v4 setName:v7];

  v8 = [v3 unlocalizedName];
  [(WCDefaultCity *)v4 setUnlocalizedName:v8];

  v9 = [v3 countryName];
  [(WCDefaultCity *)v4 setCountryName:v9];

  v10 = [v3 unlocalizedCountryName];
  [(WCDefaultCity *)v4 setUnlocalizedCountryName:v10];

  v11 = [v3 countryOverride];
  [(WCDefaultCity *)v4 setCountryOverride:v11];

  v12 = [v3 unlocalizedCountryOverride];

  [(WCDefaultCity *)v4 setUnlocalizedCountryOverride:v12];
  return v4;
}

- (void)setUnlocalizedName:(id)a3
{
}

- (void)setUnlocalizedCountryOverride:(id)a3
{
}

- (void)setUnlocalizedCountryName:(id)a3
{
}

- (void)setTimeZone:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setLongitude:(float)a3
{
  self->_longitude = a3;
}

- (void)setLocaleCode:(id)a3
{
}

- (void)setLatitude:(float)a3
{
  self->_latitude = a3;
}

- (void)setCountryOverride:(id)a3
{
}

- (void)setCountryName:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)WCDefaultCity;
  v4 = [(WCDefaultCity *)&v10 description];
  v5 = [(WCDefaultCity *)self name];
  v6 = [(WCDefaultCity *)self countryName];
  v7 = [(WCDefaultCity *)self countryOverride];
  v8 = [v3 stringWithFormat:@"%@ %@, %@ [%@] || %@, %@ || %f %f", v4, v5, v6, v7, self->_timeZone, self->_localeCode, self->_latitude, self->_longitude];

  return v8;
}

- (NSString)localeCode
{
  return self->_localeCode;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (float)longitude
{
  return self->_longitude;
}

- (float)latitude
{
  return self->_latitude;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)unlocalizedName
{
  return self->_unlocalizedName;
}

- (NSString)countryName
{
  return self->_countryName;
}

- (NSString)unlocalizedCountryName
{
  return self->_unlocalizedCountryName;
}

- (NSString)countryOverride
{
  return self->_countryOverride;
}

- (NSString)unlocalizedCountryOverride
{
  return self->_unlocalizedCountryOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlocalizedCountryOverride, 0);
  objc_storeStrong((id *)&self->_countryOverride, 0);
  objc_storeStrong((id *)&self->_unlocalizedCountryName, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localeCode, 0);
}

@end