@interface FMDAccessorySerialNumbers
+ (BOOL)supportsSecureCoding;
- (FMDAccessorySerialNumbers)initWithAccessoryInfo:(id)a3;
- (FMDAccessorySerialNumbers)initWithCoder:(id)a3;
- (FMDAccessorySerialNumbers)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryValue;
- (NSString)leftBudSerialNumber;
- (NSString)rightBudSerialNumber;
- (NSString)systemSerialNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setLeftBudSerialNumber:(id)a3;
- (void)setRightBudSerialNumber:(id)a3;
- (void)setSystemSerialNumber:(id)a3;
@end

@implementation FMDAccessorySerialNumbers

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDAccessorySerialNumbers)initWithAccessoryInfo:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDAccessorySerialNumbers;
  v5 = [(FMDAccessorySerialNumbers *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"AACPVersionInfo"];
    if ((unint64_t)[v6 count] < 0xB)
    {
      v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1002423B0(v6, v10);
      }
    }
    else
    {
      v7 = [v6 objectAtIndexedSubscript:3];
      [(FMDAccessorySerialNumbers *)v5 setSystemSerialNumber:v7];

      v8 = [v6 objectAtIndexedSubscript:8];
      [(FMDAccessorySerialNumbers *)v5 setLeftBudSerialNumber:v8];

      v9 = [v6 objectAtIndexedSubscript:9];
      [(FMDAccessorySerialNumbers *)v5 setRightBudSerialNumber:v9];

      v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDAccessorySerialNumbers info: %@", buf, 0xCu);
      }
    }
  }
  return v5;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  id v4 = [(FMDAccessorySerialNumbers *)self systemSerialNumber];
  [v3 fm_safeSetObject:v4 forKey:@"systemSerialNumber"];

  v5 = [(FMDAccessorySerialNumbers *)self leftBudSerialNumber];
  [v3 fm_safeSetObject:v5 forKey:@"leftSerialNumber"];

  v6 = [(FMDAccessorySerialNumbers *)self rightBudSerialNumber];
  [v3 fm_safeSetObject:v6 forKey:@"rightSerialNumber"];

  return (NSDictionary *)v3;
}

- (FMDAccessorySerialNumbers)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAccessorySerialNumbers;
  v5 = [(FMDAccessorySerialNumbers *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"systemSerialNumber"];
    [(FMDAccessorySerialNumbers *)v5 setSystemSerialNumber:v6];

    v7 = [v4 objectForKeyedSubscript:@"leftSerialNumber"];
    [(FMDAccessorySerialNumbers *)v5 setLeftBudSerialNumber:v7];

    v8 = [v4 objectForKeyedSubscript:@"rightSerialNumber"];
    [(FMDAccessorySerialNumbers *)v5 setRightBudSerialNumber:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDAccessorySerialNumbers *)self systemSerialNumber];
  [v4 encodeObject:v5 forKey:@"systemSerialNumber"];

  v6 = [(FMDAccessorySerialNumbers *)self leftBudSerialNumber];
  [v4 encodeObject:v6 forKey:@"leftBudSerialNumber"];

  id v7 = [(FMDAccessorySerialNumbers *)self rightBudSerialNumber];
  [v4 encodeObject:v7 forKey:@"rightBudSerialNumber"];
}

- (FMDAccessorySerialNumbers)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAccessorySerialNumbers;
  v5 = [(FMDAccessorySerialNumbers *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemSerialNumber"];
    [(FMDAccessorySerialNumbers *)v5 setSystemSerialNumber:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leftBudSerialNumber"];
    [(FMDAccessorySerialNumbers *)v5 setLeftBudSerialNumber:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rightBudSerialNumber"];
    [(FMDAccessorySerialNumbers *)v5 setRightBudSerialNumber:v8];
  }
  return v5;
}

- (NSString)systemSerialNumber
{
  return self->_systemSerialNumber;
}

- (void)setSystemSerialNumber:(id)a3
{
}

- (NSString)leftBudSerialNumber
{
  return self->_leftBudSerialNumber;
}

- (void)setLeftBudSerialNumber:(id)a3
{
}

- (NSString)rightBudSerialNumber
{
  return self->_rightBudSerialNumber;
}

- (void)setRightBudSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBudSerialNumber, 0);
  objc_storeStrong((id *)&self->_leftBudSerialNumber, 0);

  objc_storeStrong((id *)&self->_systemSerialNumber, 0);
}

@end