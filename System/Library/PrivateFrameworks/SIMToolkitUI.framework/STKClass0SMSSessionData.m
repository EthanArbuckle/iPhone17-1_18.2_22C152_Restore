@interface STKClass0SMSSessionData
- (BOOL)showsFromAddress;
- (NSString)address;
- (NSString)body;
- (STKClass0SMSSessionData)initWithBody:(id)a3 address:(id)a4 showsFromAddress:(BOOL)a5;
- (STKClass0SMSSessionData)initWithXPCDictionary:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation STKClass0SMSSessionData

- (STKClass0SMSSessionData)initWithBody:(id)a3 address:(id)a4 showsFromAddress:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STKClass0SMSSessionData;
  v10 = [(STKClass0SMSSessionData *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    body = v10->_body;
    v10->_body = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    address = v10->_address;
    v10->_address = (NSString *)v13;

    v10->_showsFromAddress = a5;
  }

  return v10;
}

- (STKClass0SMSSessionData)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = BSDeserializeStringFromXPCDictionaryWithKey();
  BOOL v7 = xpc_dictionary_get_BOOL(v4, "_showsFrom");

  id v8 = [(STKClass0SMSSessionData *)self initWithBody:v5 address:v6 showsFromAddress:v7];
  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "_showsFrom", self->_showsFromAddress);
}

- (NSString)body
{
  return self->_body;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)showsFromAddress
{
  return self->_showsFromAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_body, 0);
}

@end