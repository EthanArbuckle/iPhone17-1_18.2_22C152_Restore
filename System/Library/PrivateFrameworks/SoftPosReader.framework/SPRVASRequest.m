@interface SPRVASRequest
+ (BOOL)supportsSecureCoding;
- (NSData)vasFilter;
- (NSNumber)vasTerminalProtocol;
- (NSString)merchantId;
- (NSURL)vasUrl;
- (SPRVASRequest)init;
- (SPRVASRequest)initWithCoder:(id)a3;
- (SPRVASRequest)initWithVasTerminalProtocol:(id)a3 merchantId:(id)a4 vasUrl:(id)a5 vasFilter:(id)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMerchantId:(id)a3;
- (void)setVasFilter:(id)a3;
- (void)setVasTerminalProtocol:(id)a3;
- (void)setVasUrl:(id)a3;
@end

@implementation SPRVASRequest

- (SPRVASRequest)init
{
  return (SPRVASRequest *)MEMORY[0x270F9A6D0](self, sel_initWithVasTerminalProtocol_merchantId_vasUrl_vasFilter_, 0x26D323670, &stru_26D31DBA0, 0, 0);
}

- (SPRVASRequest)initWithVasTerminalProtocol:(id)a3 merchantId:(id)a4 vasUrl:(id)a5 vasFilter:(id)a6
{
  v10 = (NSNumber *)a3;
  v11 = (NSString *)a4;
  v12 = (NSURL *)a5;
  v13 = (NSData *)a6;
  vasTerminalProtocol = self->_vasTerminalProtocol;
  self->_vasTerminalProtocol = v10;
  v15 = v10;

  merchantId = self->_merchantId;
  self->_merchantId = v11;
  v17 = v11;

  vasUrl = self->_vasUrl;
  self->_vasUrl = v12;
  v19 = v12;

  vasFilter = self->_vasFilter;
  self->_vasFilter = v13;

  return self;
}

- (id)description
{
  v6 = NSString;
  long long v15 = *(_OWORD *)&self->_vasTerminalProtocol;
  vasUrl = self->_vasUrl;
  v8 = objc_msgSend_asHexString(self->_vasFilter, a2, v2, v3, v4, v5);
  v13 = objc_msgSend_stringWithFormat_(v6, v9, @"{vasTerminalProtocol=%@, merchantId=%@, vasUrl=%@, vasFilter=%@}", v10, v11, v12, v15, vasUrl, v8);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRVASRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"vasTerminalProtocol", v7, v8);
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  vasTerminalProtocol = self->_vasTerminalProtocol;
  self->_vasTerminalProtocol = v9;

  uint64_t v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"merchantId", v13, v14);
  long long v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  merchantId = self->_merchantId;
  self->_merchantId = v15;

  uint64_t v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"vasUrl", v19, v20);
  v21 = (NSURL *)objc_claimAutoreleasedReturnValue();
  vasUrl = self->_vasUrl;
  self->_vasUrl = v21;

  uint64_t v23 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"vasFilter", v25, v26);
  v27 = (NSData *)objc_claimAutoreleasedReturnValue();

  vasFilter = self->_vasFilter;
  self->_vasFilter = v27;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  vasTerminalProtocol = self->_vasTerminalProtocol;
  id v17 = a3;
  objc_msgSend_encodeObject_forKey_(v17, v5, (uint64_t)vasTerminalProtocol, @"vasTerminalProtocol", v6, v7);
  objc_msgSend_encodeObject_forKey_(v17, v8, (uint64_t)self->_merchantId, @"merchantId", v9, v10);
  objc_msgSend_encodeObject_forKey_(v17, v11, (uint64_t)self->_vasUrl, @"vasUrl", v12, v13);
  objc_msgSend_encodeObject_forKey_(v17, v14, (uint64_t)self->_vasFilter, @"vasFilter", v15, v16);
}

- (NSNumber)vasTerminalProtocol
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVasTerminalProtocol:(id)a3
{
}

- (NSString)merchantId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMerchantId:(id)a3
{
}

- (NSURL)vasUrl
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVasUrl:(id)a3
{
}

- (NSData)vasFilter
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVasFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vasFilter, 0);
  objc_storeStrong((id *)&self->_vasUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_vasTerminalProtocol, 0);
}

@end