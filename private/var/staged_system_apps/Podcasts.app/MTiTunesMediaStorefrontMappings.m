@interface MTiTunesMediaStorefrontMappings
+ (BOOL)isValidStorefrontCountryCode:(id)a3;
+ (id)defaultStorefrontCountryCode;
+ (id)storefrontIdentifierFromCountryCode:(id)a3;
@end

@implementation MTiTunesMediaStorefrontMappings

+ (id)storefrontIdentifierFromCountryCode:(id)a3
{
  id v3 = a3;
  v4 = sub_10009B468();
  v5 = [v3 uppercaseString];

  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

+ (BOOL)isValidStorefrontCountryCode:(id)a3
{
  id v3 = a3;
  v4 = sub_10009B468();
  v5 = [v3 uppercaseString];

  v6 = [v4 objectForKeyedSubscript:v5];
  LOBYTE(v3) = v6 != 0;

  return (char)v3;
}

+ (id)defaultStorefrontCountryCode
{
  return @"US";
}

@end