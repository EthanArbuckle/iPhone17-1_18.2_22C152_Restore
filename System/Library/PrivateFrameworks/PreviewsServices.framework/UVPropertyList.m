@interface UVPropertyList
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (NSDictionary)dictionary;
- (UVPropertyList)initWithData:(id)a3;
- (UVPropertyList)initWithDictionary:(id)a3;
- (UVPropertyList)initWithXpcDictionary:(id)a3;
- (id)_initWithAnyCoder:(id)a3;
- (void)_encodeWithAnyCoder:(id)a3;
- (void)data;
- (void)dictionary;
- (void)encodeToXpcDictionary:(id)a3;
@end

@implementation UVPropertyList

- (UVPropertyList)initWithDictionary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UVPropertyList;
  v6 = [(UVPropertyList *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    data = v7->_data;
    v7->_data = 0;
  }
  return v7;
}

- (UVPropertyList)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UVPropertyList;
  v6 = [(UVPropertyList *)&v10 init];
  v7 = v6;
  if (v6)
  {
    dictionary = v6->_dictionary;
    v6->_dictionary = 0;

    objc_storeStrong((id *)&v7->_data, a3);
  }

  return v7;
}

- (NSDictionary)dictionary
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  dictionary = self->_dictionary;
  if (dictionary)
  {
    v3 = dictionary;
  }
  else
  {
    data = self->_data;
    id v25 = 0;
    id v5 = [MEMORY[0x263F08AC0] propertyListWithData:data options:0 format:0 error:&v25];
    id v6 = v25;
    if (v5)
    {
      objc_opt_class();
      objc_opt_class();
      v3 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v7 = [(NSDictionary *)v3 allKeys];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v27;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              if (objc_opt_isKindOfClass())
              {
                v13 = [(NSDictionary *)v3 objectForKey:v12];
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass) {
                  continue;
                }
              }

              goto LABEL_20;
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
      }
      else
      {

LABEL_20:
        v22 = UVLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[UVPropertyList dictionary](v22);
        }

        uint64_t v23 = [NSDictionary dictionary];

        v3 = (NSDictionary *)v23;
      }
    }
    else
    {
      v15 = UVLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(UVPropertyList *)(uint64_t)v6 dictionary];
      }

      v3 = [NSDictionary dictionary];
    }
  }
  return v3;
}

- (NSData)data
{
  data = self->_data;
  if (data)
  {
    v3 = data;
  }
  else
  {
    dictionary = self->_dictionary;
    id v14 = 0;
    v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:dictionary format:200 options:0 error:&v14];
    id v5 = v14;
    if (!v3)
    {
      id v6 = UVLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(UVPropertyList *)(uint64_t)v5 data];
      }

      v3 = [MEMORY[0x263EFF8F8] data];
    }
  }
  return v3;
}

- (void)_encodeWithAnyCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UVPropertyList *)self data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (id)_initWithAnyCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];

  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"UVPropertyList missing serialization"];
  }
  id v6 = [(UVPropertyList *)self initWithData:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeToXpcDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [[UVRawXPCCoder alloc] initWithXpcDictionary:v4];

  [(UVPropertyList *)self _encodeWithAnyCoder:v5];
}

- (UVPropertyList)initWithXpcDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [[UVRawXPCDecoder alloc] initWithXpcDictionary:v4];
  id v6 = [(UVPropertyList *)self _initWithAnyCoder:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (void)dictionary
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24013D000, log, OS_LOG_TYPE_ERROR, "UVPropertyList data did not deserialize to a [String: Any] dictionary", v1, 2u);
}

- (void)data
{
}

- (void)initWithXpcDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end