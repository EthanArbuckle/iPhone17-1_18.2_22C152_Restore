@interface SRAsset
+ (id)assetWithLocaleIdentifier:(id)a3 contentType:(id)a4 deliveryType:(int64_t)a5 path:(id)a6;
+ (id)assetWithLocaleIdentifier:(id)a3 contentType:(id)a4 deliveryType:(int64_t)a5 resourceRoot:(id)a6 pathNames:(id)a7;
+ (id)deliveryTypeString:(int64_t)a3;
+ (int64_t)deliveryTypeFromString:(id)a3;
- (NSArray)contentNames;
- (NSArray)contentPaths;
- (NSString)contentType;
- (NSString)localeIdentifier;
- (SRAsset)initWithLocaleIdentifier:(id)a3 contentType:(id)a4 deliveryType:(int64_t)a5 paths:(id)a6;
- (id)description;
- (id)pathWithName:(id)a3;
- (int64_t)deliveryType;
@end

@implementation SRAsset

+ (id)deliveryTypeString:(int64_t)a3
{
  if ((unint64_t)a3 < 6) {
    return off_2655232B0[a3];
  }
  v5 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SRAsset deliveryTypeString:](a3, v5);
  }

  return @"Unknown";
}

- (id)pathWithName:(id)a3
{
  return [(NSDictionary *)self->_paths objectForKeyedSubscript:a3];
}

- (NSArray)contentNames
{
  return [(NSDictionary *)self->_paths allKeys];
}

+ (id)assetWithLocaleIdentifier:(id)a3 contentType:(id)a4 deliveryType:(int64_t)a5 resourceRoot:(id)a6 pathNames:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v25 = a4;
  id v10 = a6;
  id v11 = a7;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v19 = [NSString stringWithFormat:@"%@/%@", v10, v18];
        [v12 setObject:v19 forKeyedSubscript:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  if ([v12 count])
  {
    v21 = v25;
    v20 = v26;
    v22 = [[SRAsset alloc] initWithLocaleIdentifier:v26 contentType:v25 deliveryType:a5 paths:v12];
  }
  else
  {
    v22 = 0;
    v21 = v25;
    v20 = v26;
  }

  return v22;
}

+ (id)assetWithLocaleIdentifier:(id)a3 contentType:(id)a4 deliveryType:(int64_t)a5 path:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (objc_class *)MEMORY[0x263EFF9A0];
  id v12 = a6;
  id v13 = objc_alloc_init(v11);
  uint64_t v14 = [NSURL URLWithString:v12];

  uint64_t v15 = [v14 lastPathComponent];
  if (v15)
  {
    uint64_t v16 = [v14 path];
    [v13 setObject:v16 forKeyedSubscript:v15];
  }
  if ([v13 count]) {
    v17 = [[SRAsset alloc] initWithLocaleIdentifier:v9 contentType:v10 deliveryType:a5 paths:v13];
  }
  else {
    v17 = 0;
  }

  return v17;
}

+ (int64_t)deliveryTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Required"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Optional"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Optional2024"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Delta"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Optional2024Test"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"DeltaTest"])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

- (SRAsset)initWithLocaleIdentifier:(id)a3 contentType:(id)a4 deliveryType:(int64_t)a5 paths:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SRAsset;
  id v13 = [(SRAsset *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    localeIdentifier = v13->_localeIdentifier;
    v13->_localeIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    contentType = v13->_contentType;
    v13->_contentType = (NSString *)v16;

    v13->_deliveryType = a5;
    uint64_t v18 = [v12 copy];
    paths = v13->_paths;
    v13->_paths = (NSDictionary *)v18;
  }
  return v13;
}

- (id)description
{
  id v3 = NSString;
  int64_t v4 = +[SRAsset deliveryTypeString:self->_deliveryType];
  localeIdentifier = self->_localeIdentifier;
  contentType = self->_contentType;
  v7 = [(NSDictionary *)self->_paths allKeys];
  v8 = [v7 componentsJoinedByString:@","];
  id v9 = [v3 stringWithFormat:@"%@:%@:%@\n\t <%@>", v4, localeIdentifier, contentType, v8];

  return v9;
}

- (NSArray)contentPaths
{
  return [(NSDictionary *)self->_paths allValues];
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (int64_t)deliveryType
{
  return self->_deliveryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

+ (void)deliveryTypeString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25E378000, a2, OS_LOG_TYPE_ERROR, "Invalid asset delivery type %ld", (uint8_t *)&v2, 0xCu);
}

@end