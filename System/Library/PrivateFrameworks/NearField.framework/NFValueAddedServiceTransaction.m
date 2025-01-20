@interface NFValueAddedServiceTransaction
+ (BOOL)supportsSecureCoding;
- (NFValueAddedServiceTransaction)initWithCoder:(id)a3;
- (NFValueAddedServiceTransaction)initWithDictionary:(id)a3;
- (NSData)merchantId;
- (NSData)passData;
- (NSData)token;
- (NSError)error;
- (NSNumber)didSucceed;
- (NSNumber)filter;
- (NSNumber)filterType;
- (NSNumber)terminalAppVersion;
- (NSNumber)terminalMode;
- (NSString)signupUrl;
- (id)asDictionary;
- (id)description;
- (unsigned)result;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFValueAddedServiceTransaction

- (NFValueAddedServiceTransaction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NFValueAddedServiceTransaction;
  v5 = [(NFValueAddedServiceTransaction *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"MerchantId"];
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"SignupUrl"];
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"TerminalAppVersion"];
    terminalAppVersion = v5->_terminalAppVersion;
    v5->_terminalAppVersion = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"TerminalMode"];
    terminalMode = v5->_terminalMode;
    v5->_terminalMode = (NSNumber *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"PassData"];
    passData = v5->_passData;
    v5->_passData = (NSData *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"Token"];
    token = v5->_token;
    v5->_token = (NSData *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"Filter"];
    filter = v5->_filter;
    v5->_filter = (NSNumber *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"FilterType"];
    filterType = v5->_filterType;
    v5->_filterType = (NSNumber *)v20;

    v22 = [v4 objectForKeyedSubscript:@"Error"];
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&v5->_error, v22);
        BOOL v23 = [(NSError *)v5->_error code] == 0;
        uint64_t v24 = [NSNumber numberWithBool:v23];
        didSucceed = v5->_didSucceed;
        v5->_didSucceed = (NSNumber *)v24;
      }
    }
    v26 = [v4 objectForKeyedSubscript:@"Result"];

    if (v26)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_result = [v26 unsignedIntValue];
      }
    }
  }
  return v5;
}

- (NFValueAddedServiceTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NFValueAddedServiceTransaction;
  v5 = [(NFValueAddedServiceTransaction *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MerchantId"];
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SignupUrl"];
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TerminalAppVersion"];
    terminalAppVersion = v5->_terminalAppVersion;
    v5->_terminalAppVersion = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TerminalMode"];
    terminalMode = v5->_terminalMode;
    v5->_terminalMode = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PassData"];
    passData = v5->_passData;
    v5->_passData = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Token"];
    token = v5->_token;
    v5->_token = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Error"];
    error = v5->_error;
    v5->_error = (NSError *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DidSucceed"];
    didSucceed = v5->_didSucceed;
    v5->_didSucceed = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Filter"];
    filter = v5->_filter;
    v5->_filter = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FilterType"];
    filterType = v5->_filterType;
    v5->_filterType = (NSNumber *)v24;

    v5->_result = [v4 decodeInt32ForKey:@"Result"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  merchantId = self->_merchantId;
  id v5 = a3;
  [v5 encodeObject:merchantId forKey:@"MerchantId"];
  [v5 encodeObject:self->_signupUrl forKey:@"SignupUrl"];
  [v5 encodeObject:self->_terminalAppVersion forKey:@"TerminalAppVersion"];
  [v5 encodeObject:self->_terminalMode forKey:@"TerminalMode"];
  [v5 encodeObject:self->_passData forKey:@"PassData"];
  [v5 encodeObject:self->_token forKey:@"Token"];
  [v5 encodeObject:self->_error forKey:@"Error"];
  [v5 encodeObject:self->_didSucceed forKey:@"DidSucceed"];
  [v5 encodeObject:self->_filter forKey:@"Filter"];
  [v5 encodeObject:self->_filterType forKey:@"FilterType"];
  [v5 encodeInt32:self->_result forKey:@"Result"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  unsigned int v3 = [(NSNumber *)self->_terminalMode intValue] - 1;
  if (v3 > 7) {
    id v4 = @"Unknown";
  }
  else {
    id v4 = off_1E595CE98[v3];
  }
  uint64_t v12 = v4;
  uint64_t v5 = (int)self->_result;
  if (v5 > 4) {
    uint64_t v6 = @"Unknown Error";
  }
  else {
    uint64_t v6 = off_1E595CED8[v5];
  }
  v11 = v6;
  id v7 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)NFValueAddedServiceTransaction;
  uint64_t v8 = [(NFValueAddedServiceTransaction *)&v13 description];
  v9 = (void *)[v7 initWithFormat:@"%@ { merchantID=\"%@\" signupURL=%@ terminalAppVersion=%@ terminalModeDescription=%@ terminalMode=%@ filter=%@ filterType=%@ didSucceed=%@ passData=%@ token=%@ errorCode=0x%04x error=%@ result=0x%04x resultDescription=%@ }", v8, self->_merchantId, self->_signupUrl, self->_terminalAppVersion, v12, self->_terminalMode, self->_filter, self->_filterType, self->_didSucceed, self->_passData, self->_token, -[NSError code](self->_error, "code"), self->_error, self->_result, v11];

  return v9;
}

- (id)asDictionary
{
  unsigned int v3 = [(NSNumber *)self->_terminalMode intValue] - 1;
  if (v3 > 7) {
    id v4 = @"Unknown";
  }
  else {
    id v4 = off_1E595CE98[v3];
  }
  uint64_t v5 = (int)self->_result;
  if (v5 > 4) {
    uint64_t v6 = @"Unknown Error";
  }
  else {
    uint64_t v6 = off_1E595CED8[v5];
  }
  id v7 = objc_opt_new();
  uint64_t v8 = v7;
  merchantId = self->_merchantId;
  if (merchantId) {
    [v7 setObject:merchantId forKeyedSubscript:@"merchantID"];
  }
  signupUrl = self->_signupUrl;
  if (signupUrl) {
    [v8 setObject:signupUrl forKeyedSubscript:@"signupURL"];
  }
  terminalAppVersion = self->_terminalAppVersion;
  if (terminalAppVersion) {
    [v8 setObject:terminalAppVersion forKeyedSubscript:@"terminalAppVersion"];
  }
  [v8 setObject:v4 forKeyedSubscript:@"terminalModeDescription"];
  terminalMode = self->_terminalMode;
  if (terminalMode) {
    [v8 setObject:terminalMode forKeyedSubscript:@"terminalMode"];
  }
  filter = self->_filter;
  if (filter) {
    [v8 setObject:filter forKeyedSubscript:@"filter"];
  }
  filterType = self->_filterType;
  if (filterType) {
    [v8 setObject:filterType forKeyedSubscript:@"filterType"];
  }
  didSucceed = self->_didSucceed;
  if (didSucceed) {
    [v8 setObject:didSucceed forKeyedSubscript:@"didSucceed"];
  }
  passData = self->_passData;
  if (passData) {
    [v8 setObject:passData forKeyedSubscript:@"passData"];
  }
  token = self->_token;
  if (token) {
    [v8 setObject:token forKeyedSubscript:@"token"];
  }
  if (self->_error)
  {
    uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%04x", -[NSError code](self->_error, "code"));
    [v8 setObject:v18 forKeyedSubscript:@"errorCode"];

    v19 = [(NSError *)self->_error description];
    [v8 setObject:v19 forKeyedSubscript:@"error"];
  }
  [v8 setObject:v6 forKeyedSubscript:@"resultDescription"];
  uint64_t v20 = [NSNumber numberWithUnsignedInt:self->_result];
  [v8 setObject:v20 forKeyedSubscript:@"result"];

  return v8;
}

- (NSData)merchantId
{
  return self->_merchantId;
}

- (NSString)signupUrl
{
  return self->_signupUrl;
}

- (NSNumber)terminalAppVersion
{
  return self->_terminalAppVersion;
}

- (NSNumber)terminalMode
{
  return self->_terminalMode;
}

- (NSNumber)didSucceed
{
  return self->_didSucceed;
}

- (NSData)passData
{
  return self->_passData;
}

- (NSData)token
{
  return self->_token;
}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)filter
{
  return self->_filter;
}

- (NSNumber)filterType
{
  return self->_filterType;
}

- (unsigned)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_didSucceed, 0);
  objc_storeStrong((id *)&self->_terminalMode, 0);
  objc_storeStrong((id *)&self->_terminalAppVersion, 0);
  objc_storeStrong((id *)&self->_signupUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
}

@end