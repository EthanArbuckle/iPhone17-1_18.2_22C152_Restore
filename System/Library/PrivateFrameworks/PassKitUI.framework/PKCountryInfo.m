@interface PKCountryInfo
- (NSString)countryCode;
- (NSString)localizedCountryName;
- (void)setCountryCode:(id)a3;
- (void)setLocalizedCountryName:(id)a3;
@end

@implementation PKCountryInfo

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)localizedCountryName
{
  return self->_localizedCountryName;
}

- (void)setLocalizedCountryName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCountryName, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end