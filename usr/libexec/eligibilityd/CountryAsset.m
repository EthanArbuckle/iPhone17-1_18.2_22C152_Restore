@interface CountryAsset
- (BOOL)isEqual:(id)a3;
- (NSSet)countryCodes;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)hash;
- (void)setCountryCodes:(id)a3;
@end

@implementation CountryAsset

- (void).cxx_destruct
{
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
  v3 = [(CountryAsset *)self countryCodes];
  v7.receiver = self;
  v7.super_class = (Class)CountryAsset;
  v4 = [(EligibilityAsset *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[Country Asset countryCodes:%@ %@]", v3, v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CountryAsset *)a3;
  v11.receiver = self;
  v11.super_class = (Class)CountryAsset;
  if (![(EligibilityAsset *)&v11 isEqual:v4]) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = [(CountryAsset *)self countryCodes];
    objc_super v7 = [(CountryAsset *)v5 countryCodes];
    char v8 = sub_100019BF8(v6, v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_10000D0EC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[CountryAsset isEqual:]";
        __int16 v14 = 2080;
        v15 = "countryCodes";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
  }
  else
  {
LABEL_9:
    char v8 = 0;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  v2 = [(CountryAsset *)self countryCodes];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = [(CountryAsset *)self countryCodes];
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  return v5;
}

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CountryAsset;
  return [(EligibilityAsset *)&v5 initForMobileAssetRootKey:a3 withDictionary:a4];
}

@end