@interface CCDValidationInfo
- (BOOL)isRequired;
- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4;
- (BOOL)validateSelfWithDictionary:(id)a3 resultsDictionary:(id)a4;
- (CCDValidationInfo)initWithName:(id)a3 validationInfo:(id)a4;
- (NSDictionary)validationInfo;
- (NSString)name;
- (void)setIsRequired:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setValidationInfo:(id)a3;
@end

@implementation CCDValidationInfo

- (CCDValidationInfo)initWithName:(id)a3 validationInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CCDValidationInfo;
  v9 = [(CCDValidationInfo *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v11 = [v8 objectForKeyedSubscript:@"isRequired"];
    v10->_isRequired = [v11 BOOLValue];

    objc_storeStrong((id *)&v10->_validationInfo, a4);
  }

  return v10;
}

- (BOOL)validateSelfWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CCDValidationInfo *)self name];
  v9 = [v6 objectForKeyedSubscript:v8];

  if (v9) {
    LOBYTE(self) = [(CCDValidationInfo *)self validateSelfUsingValidationInfoWithDictionary:v6 resultsDictionary:v7];
  }
  else {
    LODWORD(self) = ![(CCDValidationInfo *)self isRequired];
  }

  return (char)self;
}

- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CCDValidationInfo validateSelfUsingValidationInfoWithDictionary:resultsDictionary:]", "CCDValidationInfo.m", 50, "0");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void)setIsRequired:(BOOL)a3
{
  self->_isRequired = a3;
}

- (NSDictionary)validationInfo
{
  return self->_validationInfo;
}

- (void)setValidationInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationInfo, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end