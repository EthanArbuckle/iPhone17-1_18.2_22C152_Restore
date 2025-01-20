@interface MOSuggestionAsset
+ (BOOL)supportsSecureCoding;
- (Class)contentClassType;
- (MOSuggestionAsset)initWithCoder:(id)a3;
- (NSDictionary)metadata;
- (NSString)assetType;
- (NSString)identifier;
- (id)content;
- (id)debugDescription;
- (id)init:(id)a3 type:(id)a4 contentClassType:(Class)a5;
- (void)addIdentifier:(id)a3;
- (void)addMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation MOSuggestionAsset

- (id)init:(id)a3 type:(id)a4 contentClassType:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MOSuggestionAsset;
  v11 = [(MOSuggestionAsset *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_content, a3);
    objc_storeStrong((id *)&v12->_assetType, a4);
    objc_storeStrong((id *)&v12->_contentClassType, a5);
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)&stru_1F2921B98;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id content = self->_content;
  id v5 = a3;
  [v5 encodeObject:content forKey:@"coderKeyMOSuggestionAssetContent"];
  [v5 encodeObject:self->_assetType forKey:@"coderKeyMOSuggestionAssetType"];
  [v5 encodeObject:self->_metadata forKey:@"coderKeyMOSuggestionAssetMetadata"];
  [v5 encodeObject:self->_identifier forKey:@"coderKeyMOSuggestionAssetIdentifier"];
}

- (MOSuggestionAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MOSuggestionAsset;
  id v5 = [(MOSuggestionAsset *)&v45 init];
  if (v5)
  {
    v42 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v40 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v44 = v4;
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v42, "setWithObjects:", v40, v38, v36, v35, v34, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"coderKeyMOSuggestionAssetContent"];
    id content = v5->_content;
    v5->_id content = (id)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coderKeyMOSuggestionAssetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v17;

    v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v41 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v43, "setWithObjects:", v41, v39, v37, v19, v20, v21, v22, v23, v24, v25, v26, v27, objc_opt_class(), 0);
    uint64_t v29 = [v44 decodeObjectOfClasses:v28 forKey:@"coderKeyMOSuggestionAssetMetadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v29;

    id v4 = v44;
    uint64_t v31 = [v44 decodeObjectOfClass:objc_opt_class() forKey:@"coderKeyMOSuggestionAssetIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v31;
  }
  return v5;
}

- (id)debugDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(NSDictionary *)self->_metadata allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v3 appendFormat:@"%@: %p \n", v8, 0];
        }
        else
        {
          uint64_t v10 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:v8];
          [v3 appendFormat:@"%@: %p \n", v8, v10];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [NSString stringWithFormat:@"%@ content: %p, contentType: %@, identifier: %@, metadata: \n%@", self, self->_content, self->_assetType, self->_identifier, v3];

  return v11;
}

- (void)addMetadata:(id)a3
{
  id v4 = (id)[a3 copy];
  [(MOSuggestionAsset *)self setMetadata:v4];
}

- (void)addIdentifier:(id)a3
{
  id v4 = (id)[a3 copy];
  [(MOSuggestionAsset *)self setIdentifier:v4];
}

- (id)content
{
  return self->_content;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (Class)contentClassType
{
  return self->_contentClassType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentClassType, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_content, 0);
}

@end