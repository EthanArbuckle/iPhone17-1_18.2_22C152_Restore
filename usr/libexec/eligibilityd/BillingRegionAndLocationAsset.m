@interface BillingRegionAndLocationAsset
- (BOOL)isEqual:(id)a3;
- (NSSet)billingCountryCodes;
- (NSSet)countryCodes;
- (NSSet)regionSKUs;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)hash;
- (void)setBillingCountryCodes:(id)a3;
- (void)setCountryCodes:(id)a3;
- (void)setRegionSKUs:(id)a3;
@end

@implementation BillingRegionAndLocationAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->countryCodes, 0);
  objc_storeStrong((id *)&self->regionSKUs, 0);

  objc_storeStrong((id *)&self->billingCountryCodes, 0);
}

- (void)setCountryCodes:(id)a3
{
}

- (NSSet)countryCodes
{
  return self->countryCodes;
}

- (void)setRegionSKUs:(id)a3
{
}

- (NSSet)regionSKUs
{
  return self->regionSKUs;
}

- (void)setBillingCountryCodes:(id)a3
{
}

- (NSSet)billingCountryCodes
{
  return self->billingCountryCodes;
}

- (NSString)description
{
  v3 = [(BillingRegionAndLocationAsset *)self billingCountryCodes];
  v4 = [(BillingRegionAndLocationAsset *)self regionSKUs];
  v5 = [(BillingRegionAndLocationAsset *)self countryCodes];
  v9.receiver = self;
  v9.super_class = (Class)BillingRegionAndLocationAsset;
  v6 = [(EligibilityAsset *)&v9 description];
  v7 = +[NSString stringWithFormat:@"[Billing, Region, and Locatoin Asset billingCountryCodes:%@ regionSKUs:%@ countryCodes:%@ %@]", v3, v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BillingRegionAndLocationAsset *)a3;
  v18.receiver = self;
  v18.super_class = (Class)BillingRegionAndLocationAsset;
  if ([(EligibilityAsset *)&v18 isEqual:v4])
  {
    if (v4 == self)
    {
      BOOL v15 = 1;
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(BillingRegionAndLocationAsset *)self billingCountryCodes];
      v7 = [(BillingRegionAndLocationAsset *)v5 billingCountryCodes];
      char v8 = sub_100019BF8(v6, v7);

      if (v8)
      {
        objc_super v9 = [(BillingRegionAndLocationAsset *)self regionSKUs];
        v10 = [(BillingRegionAndLocationAsset *)v5 regionSKUs];
        char v11 = sub_100019BF8(v9, v10);

        if (v11)
        {
          v12 = [(BillingRegionAndLocationAsset *)self countryCodes];
          v13 = [(BillingRegionAndLocationAsset *)v5 countryCodes];
          char v14 = sub_100019BF8(v12, v13);

          if (v14)
          {
            BOOL v15 = 1;
LABEL_18:

            goto LABEL_19;
          }
          v16 = sub_10000D0EC();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "-[BillingRegionAndLocationAsset isEqual:]";
            __int16 v21 = 2080;
            v22 = "countryCodes";
            goto LABEL_16;
          }
LABEL_17:

          BOOL v15 = 0;
          goto LABEL_18;
        }
        v16 = sub_10000D0EC();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 136315394;
        v20 = "-[BillingRegionAndLocationAsset isEqual:]";
        __int16 v21 = 2080;
        v22 = "regionSKUs";
      }
      else
      {
        v16 = sub_10000D0EC();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 136315394;
        v20 = "-[BillingRegionAndLocationAsset isEqual:]";
        __int16 v21 = 2080;
        v22 = "billingCountryCodes";
      }
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      goto LABEL_17;
    }
  }
  BOOL v15 = 0;
LABEL_19:

  return v15;
}

- (unint64_t)hash
{
  v3 = [(BillingRegionAndLocationAsset *)self billingCountryCodes];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(BillingRegionAndLocationAsset *)self regionSKUs];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = [(BillingRegionAndLocationAsset *)self countryCodes];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = [(BillingRegionAndLocationAsset *)self billingCountryCodes];
  id v7 = [v6 copyWithZone:a3];
  [v5 setBillingCountryCodes:v7];

  unint64_t v8 = [(BillingRegionAndLocationAsset *)self regionSKUs];
  id v9 = [v8 copyWithZone:a3];
  [v5 setRegionSKUs:v9];

  v10 = [(BillingRegionAndLocationAsset *)self countryCodes];
  id v11 = [v10 copyWithZone:a3];
  [v5 setCountryCodes:v11];

  return v5;
}

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BillingRegionAndLocationAsset;
  return [(EligibilityAsset *)&v5 initForMobileAssetRootKey:a3 withDictionary:a4];
}

@end