@interface WBWebsiteDataRecord
+ (id)websiteDataRecordFromXPCDictionary:(id)a3;
+ (id)websiteDataRecordWithDomain:(id)a3 profileIdentifiers:(id)a4;
- (NSMutableSet)profileIdentifiers;
- (NSString)domain;
- (OS_xpc_object)XPCDictionaryRepresentation;
- (id)_initWithDomain:(id)a3 profileIdentifiers:(id)a4;
- (id)_initWithDomain:(id)a3 usage:(unint64_t)a4 profileIdentifiers:(id)a5;
- (unint64_t)usage;
- (void)setUsage:(unint64_t)a3;
@end

@implementation WBWebsiteDataRecord

+ (id)websiteDataRecordWithDomain:(id)a3 profileIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithDomain:v7 profileIdentifiers:v6];

  return v8;
}

+ (id)websiteDataRecordFromXPCDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "WebsiteDataRecordDomain"));
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "WebsiteDataRecordUsage");
  id v6 = xpc_dictionary_get_value(v3, kWebsiteProfileIdentifiersKey);
  id v7 = v6;
  if (v6)
  {
    size_t count = xpc_array_get_count(v6);
    v9 = [MEMORY[0x263EFF9C0] set];
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        v11 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_array_get_string(v7, i));
        [v9 addObject:v11];
      }
    }
  }
  else
  {
    v9 = 0;
  }
  id v12 = [[WBWebsiteDataRecord alloc] _initWithDomain:v4 usage:uint64 profileIdentifiers:v9];

  return v12;
}

- (OS_xpc_object)XPCDictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "WebsiteDataRecordDomain", [(NSString *)self->_domain UTF8String]);
  xpc_dictionary_set_uint64(v3, "WebsiteDataRecordUsage", self->_usage);
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_profileIdentifiers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v13 + 1) + 8 * i);
        xpc_object_t v11 = xpc_string_create((const char *)objc_msgSend(v10, "UTF8String", (void)v13));
        xpc_array_append_value(v4, v11);
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  xpc_dictionary_set_value(v3, kWebsiteProfileIdentifiersKey, v4);
  return (OS_xpc_object *)v3;
}

- (id)_initWithDomain:(id)a3 profileIdentifiers:(id)a4
{
  return [(WBWebsiteDataRecord *)self _initWithDomain:a3 usage:0 profileIdentifiers:a4];
}

- (id)_initWithDomain:(id)a3 usage:(unint64_t)a4 profileIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBWebsiteDataRecord;
  id v10 = [(WBWebsiteDataRecord *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    domain = v10->_domain;
    v10->_domain = (NSString *)v11;

    v10->_usage = a4;
    uint64_t v13 = [v9 mutableCopy];
    profileIdentifiers = v10->_profileIdentifiers;
    v10->_profileIdentifiers = (NSMutableSet *)v13;

    long long v15 = v10;
  }

  return v10;
}

- (NSString)domain
{
  return self->_domain;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(unint64_t)a3
{
  self->_usage = a3;
}

- (NSMutableSet)profileIdentifiers
{
  return self->_profileIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifiers, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end