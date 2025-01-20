@interface STKUSSDSessionData
- (BOOL)allowsResponse;
- (NSString)text;
- (STKUSSDSessionData)initWithText:(id)a3 allowsResponse:(BOOL)a4;
- (STKUSSDSessionData)initWithXPCDictionary:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation STKUSSDSessionData

- (STKUSSDSessionData)initWithText:(id)a3 allowsResponse:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STKUSSDSessionData;
  v7 = [(STKUSSDSessionData *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    text = v7->_text;
    v7->_text = (NSString *)v8;

    v7->_allowsResponse = a4;
  }

  return v7;
}

- (STKUSSDSessionData)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = BSDeserializeStringFromXPCDictionaryWithKey();
  BOOL v6 = xpc_dictionary_get_BOOL(v4, "_allowsResponse");

  v7 = [(STKUSSDSessionData *)self initWithText:v5 allowsResponse:v6];
  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "_allowsResponse", self->_allowsResponse);
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)allowsResponse
{
  return self->_allowsResponse;
}

- (void).cxx_destruct
{
}

@end