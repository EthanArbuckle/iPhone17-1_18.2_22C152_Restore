@interface PKDynamicAssetIndex
- (NSDate)dateCreated;
- (PKDynamicAssetIndex)initWithContentsOfURL:(id)a3;
- (id)description;
- (id)mappedAssetIdentifier:(id)a3;
- (id)mappedStringIdentifier:(id)a3;
@end

@implementation PKDynamicAssetIndex

- (PKDynamicAssetIndex)initWithContentsOfURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDynamicAssetIndex;
  v5 = [(PKDynamicAssetIndex *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v4];
    index = v5->_index;
    v5->_index = (NSDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v8;
  }
  return v5;
}

- (id)mappedAssetIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSDictionary *)self->_index objectForKeyedSubscript:@"AssetIdentifiers"];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v4;
      __int16 v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Assets: mapped asset identifier %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v8 = v6;
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Assets: couldn't map asset identifier %{public}@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v8 = v4;
  }

  id v9 = v8;
  return v9;
}

- (id)mappedStringIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSDictionary *)self->_index objectForKeyedSubscript:@"StringIdentifiers"];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v4;
      __int16 v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Assets: mapped string identifier %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v8 = v6;
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Assets: couldn't map string identifier %{public}@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v8 = v4;
  }

  id v9 = v8;
  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p;\n", objc_opt_class(), self];
  id v4 = [(NSDictionary *)self->_index objectForKeyedSubscript:@"AssetIdentifiers"];
  [v3 appendFormat:@"Asset identifiers:\n%@;\n", v4];

  v5 = [(NSDictionary *)self->_index objectForKeyedSubscript:@"StringIdentifiers"];
  [v3 appendFormat:@"String identifiers:\n%@;\n", v5];

  [v3 appendFormat:@">"];
  return v3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end