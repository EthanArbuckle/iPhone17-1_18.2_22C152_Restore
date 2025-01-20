@interface CountryAndRegionAsset
- (BOOL)isEqual:(id)a3;
- (NSSet)countryCodes;
- (NSSet)regionSKUs;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)hash;
- (void)setCountryCodes:(id)a3;
- (void)setRegionSKUs:(id)a3;
@end

@implementation CountryAndRegionAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->regionSKUs, 0);

  objc_storeStrong((id *)&self->countryCodes, 0);
}

- (void)setRegionSKUs:(id)a3
{
}

- (NSSet)regionSKUs
{
  return self->regionSKUs;
}

- (void)setCountryCodes:(id)a3
{
}

- (NSSet)countryCodes
{
  return self->countryCodes;
}

- (NSString)description
{
  v3 = [(CountryAndRegionAsset *)self countryCodes];
  v4 = [(CountryAndRegionAsset *)self regionSKUs];
  v8.receiver = self;
  v8.super_class = (Class)CountryAndRegionAsset;
  v5 = [(EligibilityAsset *)&v8 description];
  v6 = +[NSString stringWithFormat:@"[Country and Region Asset countryCodes:%@ regionSKUs:%@  %@]", v3, v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CountryAndRegionAsset *)a3;
  v15.receiver = self;
  v15.super_class = (Class)CountryAndRegionAsset;
  if ([(EligibilityAsset *)&v15 isEqual:v4])
  {
    if (v4 == self)
    {
      BOOL v12 = 1;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(CountryAndRegionAsset *)self countryCodes];
      v7 = [(CountryAndRegionAsset *)v5 countryCodes];
      char v8 = sub_100019BF8(v6, v7);

      if (v8)
      {
        v9 = [(CountryAndRegionAsset *)self regionSKUs];
        v10 = [(CountryAndRegionAsset *)v5 regionSKUs];
        char v11 = sub_100019BF8(v9, v10);

        if (v11)
        {
          BOOL v12 = 1;
LABEL_15:

          goto LABEL_16;
        }
        v13 = sub_10000D0EC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v17 = "-[CountryAndRegionAsset isEqual:]";
          __int16 v18 = 2080;
          v19 = "regionSKUs";
          goto LABEL_13;
        }
      }
      else
      {
        v13 = sub_10000D0EC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v17 = "-[CountryAndRegionAsset isEqual:]";
          __int16 v18 = 2080;
          v19 = "countryCodes";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
        }
      }

      BOOL v12 = 0;
      goto LABEL_15;
    }
  }
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(CountryAndRegionAsset *)self countryCodes];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(CountryAndRegionAsset *)self regionSKUs];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = [(CountryAndRegionAsset *)self countryCodes];
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  char v8 = [(CountryAndRegionAsset *)self regionSKUs];
  id v9 = [v8 copyWithZone:a3];
  [v5 setRegionSKUs:v9];

  return v5;
}

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CountryAndRegionAsset;
  return [(EligibilityAsset *)&v5 initForMobileAssetRootKey:a3 withDictionary:a4];
}

@end