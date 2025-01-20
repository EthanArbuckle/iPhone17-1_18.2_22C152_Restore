@interface SPRInstallData
+ (BOOL)supportsSecureCoding;
- (NSArray)kernelsInstalled;
- (NSString)countryCode;
- (SPRInstallData)initWithCoder:(id)a3;
- (SPRInstallData)initWithKernelsInstalled:(id)a3;
- (SPRInstallData)initWithKernelsInstalled:(id)a3 countryCode:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPRInstallData

- (SPRInstallData)initWithKernelsInstalled:(id)a3 countryCode:(id)a4
{
  v6 = (NSArray *)a3;
  v7 = (NSString *)a4;
  kernelsInstalled = self->_kernelsInstalled;
  self->_kernelsInstalled = v6;
  v9 = v6;

  countryCode = self->_countryCode;
  self->_countryCode = v7;

  return self;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"{kernelsInstalled=%@, countryCode=%@}", v2, v3, v4, self->_kernelsInstalled, self->_countryCode);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRInstallData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v6, v5, @"kernelsInstalled", v7, v8);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  kernelsInstalled = self->_kernelsInstalled;
  self->_kernelsInstalled = v9;

  uint64_t v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"countryCode", v13, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();

  countryCode = self->_countryCode;
  self->_countryCode = v15;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  kernelsInstalled = self->_kernelsInstalled;
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)kernelsInstalled, @"kernelsInstalled", v6, v7);
  objc_msgSend_encodeObject_forKey_(v11, v8, (uint64_t)self->_countryCode, @"countryCode", v9, v10);
}

- (SPRInstallData)initWithKernelsInstalled:(id)a3
{
  return self;
}

- (NSArray)kernelsInstalled
{
  return self->_kernelsInstalled;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_kernelsInstalled, 0);
}

@end