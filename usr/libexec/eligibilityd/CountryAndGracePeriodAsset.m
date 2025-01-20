@interface CountryAndGracePeriodAsset
- (BOOL)isEqual:(id)a3;
- (NSSet)countryCodes;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)gracePeriodInSeconds;
- (unint64_t)hash;
- (void)setCountryCodes:(id)a3;
- (void)setGracePeriodInSeconds:(unint64_t)a3;
@end

@implementation CountryAndGracePeriodAsset

- (void).cxx_destruct
{
}

- (void)setGracePeriodInSeconds:(unint64_t)a3
{
  self->gracePeriodInSeconds = a3;
}

- (unint64_t)gracePeriodInSeconds
{
  return self->gracePeriodInSeconds;
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
  v3 = [(CountryAndGracePeriodAsset *)self countryCodes];
  unint64_t v4 = [(CountryAndGracePeriodAsset *)self gracePeriodInSeconds];
  v8.receiver = self;
  v8.super_class = (Class)CountryAndGracePeriodAsset;
  v5 = [(EligibilityAsset *)&v8 description];
  v6 = +[NSString stringWithFormat:@"[Country and Grace Period Asset countryCodes:%@ gracePeriod:%lu %@]", v3, v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CountryAndGracePeriodAsset *)a3;
  v13.receiver = self;
  v13.super_class = (Class)CountryAndGracePeriodAsset;
  if ([(EligibilityAsset *)&v13 isEqual:v4])
  {
    if (v4 == self)
    {
      BOOL v10 = 1;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(CountryAndGracePeriodAsset *)self countryCodes];
      v7 = [(CountryAndGracePeriodAsset *)v5 countryCodes];
      char v8 = sub_100019BF8(v6, v7);

      if (v8)
      {
        id v9 = [(CountryAndGracePeriodAsset *)self gracePeriodInSeconds];
        if (v9 == (id)[(CountryAndGracePeriodAsset *)v5 gracePeriodInSeconds])
        {
          BOOL v10 = 1;
LABEL_15:

          goto LABEL_16;
        }
        v11 = sub_10000D0EC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[CountryAndGracePeriodAsset isEqual:]";
          __int16 v16 = 2080;
          v17 = "gracePeriodInSeconds";
          goto LABEL_13;
        }
      }
      else
      {
        v11 = sub_10000D0EC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[CountryAndGracePeriodAsset isEqual:]";
          __int16 v16 = 2080;
          v17 = "countryCodes";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
        }
      }

      BOOL v10 = 0;
      goto LABEL_15;
    }
  }
  BOOL v10 = 0;
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(CountryAndGracePeriodAsset *)self countryCodes];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(CountryAndGracePeriodAsset *)self gracePeriodInSeconds] ^ v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = [(CountryAndGracePeriodAsset *)self countryCodes];
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  [v5 setGracePeriodInSeconds:-[CountryAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds")];
  return v5;
}

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CountryAndGracePeriodAsset;
  return [(EligibilityAsset *)&v5 initForMobileAssetRootKey:a3 withDictionary:a4];
}

@end