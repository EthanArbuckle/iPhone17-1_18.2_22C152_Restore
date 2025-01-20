@interface NFVASRequest
+ (BOOL)validateDictionary:(id)a3;
- (NFVASRequest)initWithDictionary:(id)a3;
- (NSData)filter;
- (NSNumber)terminalCap;
- (NSNumber)terminalProtocol;
- (NSString)merchantId;
- (NSURL)signupUrl;
- (id)asDictionary;
- (id)description;
- (void)setFilter:(id)a3;
- (void)setMerchantId:(id)a3;
- (void)setSignupUrl:(id)a3;
- (void)setTerminalCap:(id)a3;
- (void)setTerminalProtocol:(id)a3;
@end

@implementation NFVASRequest

+ (BOOL)validateDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = 0;
      v4 = v3;
      goto LABEL_17;
    }
  }
  v4 = [v3 objectForKeyedSubscript:@"TerminalCap"];

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
  }
  v5 = [v3 objectForKeyedSubscript:@"TerminalProtocol"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
  }
  v4 = [v3 objectForKeyedSubscript:@"MerchantId"];

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
  }
  v5 = [v3 objectForKeyedSubscript:@"SignupUrl"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_16:
      BOOL v6 = 0;
      v4 = v5;
      goto LABEL_17;
    }
  }
  v4 = [v3 objectForKeyedSubscript:@"Filter"];

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:
      BOOL v6 = 0;
      goto LABEL_17;
    }
  }
  BOOL v6 = 1;
LABEL_17:

  return v6;
}

- (NFVASRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NFVASRequest;
  v5 = [(NFVASRequest *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"TerminalCap"];
    terminalCap = v5->_terminalCap;
    v5->_terminalCap = (NSNumber *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"TerminalProtocol"];
    terminalProtocol = v5->_terminalProtocol;
    v5->_terminalProtocol = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"MerchantId"];
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"SignupUrl"];
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSURL *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"Filter"];
    filter = v5->_filter;
    v5->_filter = (NSData *)v14;
  }
  return v5;
}

- (id)asDictionary
{
  id v3 = objc_opt_new();
  id v4 = v3;
  terminalCap = self->_terminalCap;
  if (terminalCap) {
    [v3 setObject:terminalCap forKeyedSubscript:@"TerminalCap"];
  }
  terminalProtocol = self->_terminalProtocol;
  if (terminalProtocol) {
    [v4 setObject:terminalProtocol forKeyedSubscript:@"TerminalProtocol"];
  }
  merchantId = self->_merchantId;
  if (merchantId) {
    [v4 setObject:merchantId forKeyedSubscript:@"MerchantId"];
  }
  signupUrl = self->_signupUrl;
  if (signupUrl) {
    [v4 setObject:signupUrl forKeyedSubscript:@"SignupUrl"];
  }
  filter = self->_filter;
  if (filter) {
    [v4 setObject:filter forKeyedSubscript:@"Filter"];
  }

  return v4;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v7.receiver = self;
  v7.super_class = (Class)NFVASRequest;
  id v4 = [(NFVASRequest *)&v7 description];
  id v5 = [v3 initWithFormat:@"%@ protocol=0x%04x capability=0x%04x merchantId=%@ url=%@ filter=%@", v4, -[NSNumber unsignedIntValue](self->_terminalProtocol, "unsignedIntValue"), -[NSNumber unsignedIntValue](self->_terminalCap, "unsignedIntValue"), self->_merchantId, self->_signupUrl, self->_filter];

  return v5;
}

- (NSNumber)terminalCap
{
  return self->_terminalCap;
}

- (void)setTerminalCap:(id)a3
{
}

- (NSNumber)terminalProtocol
{
  return self->_terminalProtocol;
}

- (void)setTerminalProtocol:(id)a3
{
}

- (NSString)merchantId
{
  return self->_merchantId;
}

- (void)setMerchantId:(id)a3
{
}

- (NSURL)signupUrl
{
  return self->_signupUrl;
}

- (void)setSignupUrl:(id)a3
{
}

- (NSData)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_signupUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_terminalProtocol, 0);

  objc_storeStrong((id *)&self->_terminalCap, 0);
}

@end