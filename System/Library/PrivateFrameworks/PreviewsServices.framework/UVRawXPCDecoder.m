@interface UVRawXPCDecoder
- (OS_xpc_object)dictionary;
- (UVRawXPCDecoder)initWithXpcDictionary:(id)a3;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
@end

@implementation UVRawXPCDecoder

- (UVRawXPCDecoder)initWithXpcDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UVRawXPCDecoder;
  v6 = [(UVRawXPCDecoder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  size_t length = 0;
  data = (void *)xpc_dictionary_get_data(self->_dictionary, (const char *)objc_msgSend(@"data", "UTF8String", a3, a4), &length);
  if (data)
  {
    id v5 = data;
    id v6 = objc_alloc(MEMORY[0x263EFF8F8]);
    data = (void *)[v6 initWithBytes:v5 length:length];
  }
  return data;
}

- (OS_xpc_object)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end