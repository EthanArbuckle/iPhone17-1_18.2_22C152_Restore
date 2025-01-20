@interface SSRedeemCodesResponse
- (NSArray)codeResponses;
- (NSArray)failedCodes;
- (NSArray)redeemedCodes;
- (SSRedeemCodesResponse)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (id)dictionaryForCode:(id)a3;
- (id)errorForCode:(id)a3;
- (id)responseDictionaryForCode:(id)a3;
- (void)dealloc;
- (void)setCodeResponses:(id)a3;
- (void)setFailedCodes:(id)a3;
- (void)setRedeemedCodes:(id)a3;
@end

@implementation SSRedeemCodesResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSRedeemCodesResponse;
  [(SSRedeemCodesResponse *)&v3 dealloc];
}

- (NSArray)codeResponses
{
  return [(NSDictionary *)self->_codeResponses allKeys];
}

- (id)dictionaryForCode:(id)a3
{
  id v3 = [(NSDictionary *)self->_redeemedCodes objectForKey:a3];
  return v3;
}

- (id)errorForCode:(id)a3
{
  id v3 = [(NSDictionary *)self->_errors objectForKey:a3];
  return v3;
}

- (NSArray)failedCodes
{
  return [(NSDictionary *)self->_errors allKeys];
}

- (NSArray)redeemedCodes
{
  return [(NSDictionary *)self->_redeemedCodes allKeys];
}

- (id)responseDictionaryForCode:(id)a3
{
  id v3 = [(NSDictionary *)self->_codeResponses objectForKey:a3];
  return v3;
}

- (void)setCodeResponses:(id)a3
{
  codeResponses = self->_codeResponses;
  if (codeResponses != a3)
  {

    self->_codeResponses = (NSDictionary *)[a3 copy];
  }
}

- (void)setFailedCodes:(id)a3
{
  errors = self->_errors;
  if (errors != a3)
  {

    self->_errors = (NSDictionary *)[a3 copy];
  }
}

- (void)setRedeemedCodes:(id)a3
{
  redeemedCodes = self->_redeemedCodes;
  if (redeemedCodes != a3)
  {

    self->_redeemedCodes = (NSDictionary *)[a3 copy];
  }
}

- (SSRedeemCodesResponse)initWithXPCEncoding:(id)a3
{
  if (a3 && (uint64_t v5 = MEMORY[0x1A62689E0](a3, a2), v6 = MEMORY[0x1E4F14590], v5 == MEMORY[0x1E4F14590]))
  {
    v13.receiver = self;
    v13.super_class = (Class)SSRedeemCodesResponse;
    v7 = [(SSRedeemCodesResponse *)&v13 init];
    if (v7)
    {
      objc_opt_class();
      v7->_codeResponses = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      objc_opt_class();
      v7->_redeemedCodes = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      xpc_object_t value = xpc_dictionary_get_value(a3, "1");
      if (value)
      {
        v11 = value;
        if (MEMORY[0x1A62689E0]() == v6)
        {
          applier[0] = MEMORY[0x1E4F143A8];
          applier[1] = 3221225472;
          applier[2] = __45__SSRedeemCodesResponse_initWithXPCEncoding___block_invoke;
          applier[3] = &unk_1E5BAC948;
          applier[4] = v9;
          xpc_dictionary_apply(v11, applier);
        }
      }
      if ([v9 count]) {
        v7->_errors = (NSDictionary *)[v9 copy];
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

uint64_t __45__SSRedeemCodesResponse_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithXPCEncoding:a3];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    v7 = (void *)[[NSString alloc] initWithUTF8String:a2];
    [*(id *)(a1 + 32) setObject:v6 forKey:v7];
  }
  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_codeResponses);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_errors);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_redeemedCodes);
  return v3;
}

@end