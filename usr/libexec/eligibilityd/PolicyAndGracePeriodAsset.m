@interface PolicyAndGracePeriodAsset
- (BOOL)isEqual:(id)a3;
- (NSArray)policies;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)gracePeriodInSeconds;
- (unint64_t)hash;
- (void)setGracePeriodInSeconds:(unint64_t)a3;
- (void)setPolicies:(id)a3;
@end

@implementation PolicyAndGracePeriodAsset

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

- (void)setPolicies:(id)a3
{
}

- (NSArray)policies
{
  return self->policies;
}

- (NSString)description
{
  v3 = [(PolicyAndGracePeriodAsset *)self policies];
  unint64_t v4 = [(PolicyAndGracePeriodAsset *)self gracePeriodInSeconds];
  v8.receiver = self;
  v8.super_class = (Class)PolicyAndGracePeriodAsset;
  v5 = [(EligibilityAsset *)&v8 description];
  v6 = +[NSString stringWithFormat:@"[Policies and Grace Period Asset policies:%@ gracePeriod:%lu %@]", v3, v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PolicyAndGracePeriodAsset *)a3;
  v13.receiver = self;
  v13.super_class = (Class)PolicyAndGracePeriodAsset;
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
      v6 = [(PolicyAndGracePeriodAsset *)self policies];
      v7 = [(PolicyAndGracePeriodAsset *)v5 policies];
      char v8 = sub_100019BF8(v6, v7);

      if (v8)
      {
        id v9 = [(PolicyAndGracePeriodAsset *)self gracePeriodInSeconds];
        if (v9 == (id)[(PolicyAndGracePeriodAsset *)v5 gracePeriodInSeconds])
        {
          BOOL v10 = 1;
LABEL_15:

          goto LABEL_16;
        }
        v11 = sub_10000D0EC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[PolicyAndGracePeriodAsset isEqual:]";
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
          v15 = "-[PolicyAndGracePeriodAsset isEqual:]";
          __int16 v16 = 2080;
          v17 = "policies";
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
  v3 = [(PolicyAndGracePeriodAsset *)self policies];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(PolicyAndGracePeriodAsset *)self gracePeriodInSeconds] ^ v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = [(PolicyAndGracePeriodAsset *)self policies];
  id v7 = [v6 copyWithZone:a3];
  [v5 setPolicies:v7];

  [v5 setGracePeriodInSeconds:-[PolicyAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds")];
  return v5;
}

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PolicyAndGracePeriodAsset;
  return [(EligibilityAsset *)&v5 initForMobileAssetRootKey:a3 withDictionary:a4];
}

@end