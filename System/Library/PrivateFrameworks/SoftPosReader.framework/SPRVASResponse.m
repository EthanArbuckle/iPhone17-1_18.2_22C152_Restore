@interface SPRVASResponse
+ (BOOL)supportsSecureCoding;
- (NSData)mobileToken;
- (NSData)vasData;
- (SPRVASResponse)initWithCoder:(id)a3;
- (SPRVASResponse)initWithStatus:(unsigned __int16)a3 vasData:(id)a4 mobileToken:(id)a5;
- (id)description;
- (unsigned)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPRVASResponse

- (SPRVASResponse)initWithStatus:(unsigned __int16)a3 vasData:(id)a4 mobileToken:(id)a5
{
  v8 = (NSData *)a4;
  v9 = (NSData *)a5;
  self->_status = a3;
  vasData = self->_vasData;
  self->_vasData = v8;
  v11 = v8;

  mobileToken = self->_mobileToken;
  self->_mobileToken = v9;

  return self;
}

- (id)description
{
  uint64_t status = self->_status;
  if (status == 36864)
  {
    v8 = NSString;
    v9 = objc_msgSend_asHexString(self->_vasData, a2, v2, v3, v4, v5);
    v14 = objc_msgSend_stringWithFormat_(v8, v10, @"{vasData=%@, mobileToken=%@}", v11, v12, v13, v9, self->_mobileToken);
  }
  else
  {
    v14 = objc_msgSend_stringWithFormat_(NSString, a2, @"{status=%04X}", v3, v4, v5, status);
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRVASResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_uint64_t status = objc_msgSend_decodeIntForKey_(v4, v5, @"status", v6, v7, v8);
  uint64_t v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"vasData", v11, v12);
  uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue();
  vasData = self->_vasData;
  self->_vasData = v13;

  uint64_t v15 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"mobileToken", v17, v18);
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();

  mobileToken = self->_mobileToken;
  self->_mobileToken = v19;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t status = self->_status;
  id v14 = a3;
  objc_msgSend_encodeInt_forKey_(v14, v5, status, @"status", v6, v7);
  objc_msgSend_encodeObject_forKey_(v14, v8, (uint64_t)self->_vasData, @"vasData", v9, v10);
  objc_msgSend_encodeObject_forKey_(v14, v11, (uint64_t)self->_mobileToken, @"mobileToken", v12, v13);
}

- (unsigned)status
{
  return self->_status;
}

- (NSData)vasData
{
  return self->_vasData;
}

- (NSData)mobileToken
{
  return self->_mobileToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileToken, 0);
  objc_storeStrong((id *)&self->_vasData, 0);
}

@end