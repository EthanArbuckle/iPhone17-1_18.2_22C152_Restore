@interface UVRawXPCCoder
- (OS_xpc_object)dictionary;
- (UVRawXPCCoder)initWithXpcDictionary:(id)a3;
- (void)encodeObject:(id)a3 forKey:(id)a4;
@end

@implementation UVRawXPCCoder

- (UVRawXPCCoder)initWithXpcDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UVRawXPCCoder;
  v6 = [(UVRawXPCCoder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  dictionary = self->_dictionary;
  id v5 = a3;
  v6 = (const char *)[@"data" UTF8String];
  id v7 = v5;
  v8 = (const void *)[v7 bytes];
  size_t v9 = [v7 length];

  xpc_dictionary_set_data(dictionary, v6, v8, v9);
}

- (OS_xpc_object)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end