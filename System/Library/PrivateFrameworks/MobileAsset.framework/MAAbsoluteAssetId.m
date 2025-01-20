@interface MAAbsoluteAssetId
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOnlyAssetTypeAndId;
- (BOOL)isEqual:(id)a3;
- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4;
- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4 attributes:(id)a5;
- (MAAbsoluteAssetId)initWithCoder:(id)a3;
- (MAAbsoluteAssetId)initWithPlist:(id)a3;
- (NSString)assetId;
- (NSString)assetType;
- (id)allAttributesHash;
- (id)assetIdHash;
- (id)contentHash;
- (id)description;
- (id)diffFrom:(id)a3;
- (id)diffFromAsset:(id)a3;
- (id)diffFromAssetId:(id)a3 assetType:(id)a4 attributes:(id)a5;
- (id)encodeAsPlist;
- (id)nonIdHash;
- (id)pallasDynamicAssetIdHash;
- (id)policyHash;
- (id)summary;
- (id)urlHash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetId:(id)a3;
- (void)setAssetType:(id)a3;
@end

@implementation MAAbsoluteAssetId

- (id)allAttributesHash
{
  return self->_allAttributesHash;
}

- (id)nonIdHash
{
  return self->_nonAssetIdHash;
}

- (id)contentHash
{
  return self->_downloadContentHash;
}

- (id)urlHash
{
  return self->_downloadUrlHash;
}

- (id)policyHash
{
  return self->_downloadPolicyHash;
}

- (id)assetIdHash
{
  return self->_assetIdHash;
}

- (id)pallasDynamicAssetIdHash
{
  return self->_pallasAssetIdHash;
}

- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4
{
  return [(MAAbsoluteAssetId *)self initWithAssetId:a3 forAssetType:a4 attributes:0];
}

- (MAAbsoluteAssetId)initWithAssetId:(id)a3 forAssetType:(id)a4 attributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)MAAbsoluteAssetId;
  v12 = [(MAAbsoluteAssetId *)&v33 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetType, a4);
    objc_storeStrong((id *)&v13->_assetId, a3);
    uint64_t v14 = getHashFromAttributesInSet(v10, v11, 0);
    allAttributesHash = v13->_allAttributesHash;
    v13->_allAttributesHash = (NSString *)v14;

    uint64_t v16 = getHashFromAssetIdAttributes(v10, v11);
    assetIdHash = v13->_assetIdHash;
    v13->_assetIdHash = (NSString *)v16;

    uint64_t v18 = getHashFromNonAssetIdAttributes(v10, v11);
    nonAssetIdHash = v13->_nonAssetIdHash;
    v13->_nonAssetIdHash = (NSString *)v18;

    v20 = attributesInDownloadContent();
    uint64_t v21 = getHashFromAttributesInSet(v10, v11, v20);
    downloadContentHash = v13->_downloadContentHash;
    v13->_downloadContentHash = (NSString *)v21;

    v23 = attributesInDownloadUrl();
    uint64_t v24 = getHashFromAttributesInSet(v10, v11, v23);
    downloadUrlHash = v13->_downloadUrlHash;
    v13->_downloadUrlHash = (NSString *)v24;

    v26 = attributesInDownloadPolicy();
    uint64_t v27 = getHashFromAttributesInSet(v10, v11, v26);
    downloadPolicyHash = v13->_downloadPolicyHash;
    v13->_downloadPolicyHash = (NSString *)v27;

    v29 = attributesInPallasDynamicAssetId();
    uint64_t v30 = getHashFromAttributesInSet(v10, v11, v29);
    pallasAssetIdHash = v13->_pallasAssetIdHash;
    v13->_pallasAssetIdHash = (NSString *)v30;
  }
  return v13;
}

- (MAAbsoluteAssetId)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MAAbsoluteAssetId;
  v5 = [(MAAbsoluteAssetId *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetId"];
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributesHash"];
    allAttributesHash = v5->_allAttributesHash;
    v5->_allAttributesHash = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetIdHash"];
    assetIdHash = v5->_assetIdHash;
    v5->_assetIdHash = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonIdHash"];
    nonAssetIdHash = v5->_nonAssetIdHash;
    v5->_nonAssetIdHash = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentHash"];
    downloadContentHash = v5->_downloadContentHash;
    v5->_downloadContentHash = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlHash"];
    downloadUrlHash = v5->_downloadUrlHash;
    v5->_downloadUrlHash = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"policyHash"];
    downloadPolicyHash = v5->_downloadPolicyHash;
    v5->_downloadPolicyHash = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pallasDynamicAssetIdHash"];
    pallasAssetIdHash = v5->_pallasAssetIdHash;
    v5->_pallasAssetIdHash = (NSString *)v22;
  }
  return v5;
}

- (MAAbsoluteAssetId)initWithPlist:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MAAbsoluteAssetId;
  v5 = [(MAAbsoluteAssetId *)&v25 init];
  if (v5)
  {
    uint64_t v6 = getPlistString(v4, @"assetId");
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v6;

    uint64_t v8 = getPlistString(v4, @"assetType");
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    uint64_t v10 = getPlistString(v4, @"attributesHash");
    allAttributesHash = v5->_allAttributesHash;
    v5->_allAttributesHash = (NSString *)v10;

    uint64_t v12 = getPlistString(v4, @"assetIdHash");
    assetIdHash = v5->_assetIdHash;
    v5->_assetIdHash = (NSString *)v12;

    uint64_t v14 = getPlistString(v4, @"nonIdHash");
    nonAssetIdHash = v5->_nonAssetIdHash;
    v5->_nonAssetIdHash = (NSString *)v14;

    uint64_t v16 = getPlistString(v4, @"contentHash");
    downloadContentHash = v5->_downloadContentHash;
    v5->_downloadContentHash = (NSString *)v16;

    uint64_t v18 = getPlistString(v4, @"urlHash");
    downloadUrlHash = v5->_downloadUrlHash;
    v5->_downloadUrlHash = (NSString *)v18;

    uint64_t v20 = getPlistString(v4, @"policyHash");
    downloadPolicyHash = v5->_downloadPolicyHash;
    v5->_downloadPolicyHash = (NSString *)v20;

    uint64_t v22 = getPlistString(v4, @"pallasDynamicAssetIdHash");
    pallasAssetIdHash = v5->_pallasAssetIdHash;
    v5->_pallasAssetIdHash = (NSString *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(MAAbsoluteAssetId *)self assetId];
  [v6 encodeObject:v4 forKey:@"assetId"];

  v5 = [(MAAbsoluteAssetId *)self assetType];
  [v6 encodeObject:v5 forKey:@"assetType"];

  [v6 encodeObject:self->_allAttributesHash forKey:@"attributesHash"];
  [v6 encodeObject:self->_assetIdHash forKey:@"assetIdHash"];
  [v6 encodeObject:self->_nonAssetIdHash forKey:@"nonIdHash"];
  [v6 encodeObject:self->_downloadContentHash forKey:@"contentHash"];
  [v6 encodeObject:self->_downloadUrlHash forKey:@"urlHash"];
  [v6 encodeObject:self->_downloadPolicyHash forKey:@"policyHash"];
  [v6 encodeObject:self->_pallasAssetIdHash forKey:@"pallasDynamicAssetIdHash"];
}

- (id)encodeAsPlist
{
  v3 = objc_opt_new();
  id v4 = [(MAAbsoluteAssetId *)self assetId];
  [v3 setValue:v4 forKey:@"assetId"];

  v5 = [(MAAbsoluteAssetId *)self assetType];
  [v3 setValue:v5 forKey:@"assetType"];

  [v3 setValue:self->_allAttributesHash forKey:@"attributesHash"];
  [v3 setValue:self->_assetIdHash forKey:@"assetIdHash"];
  [v3 setValue:self->_nonAssetIdHash forKey:@"nonIdHash"];
  [v3 setValue:self->_downloadContentHash forKey:@"contentHash"];
  [v3 setValue:self->_downloadUrlHash forKey:@"urlHash"];
  [v3 setValue:self->_downloadPolicyHash forKey:@"policyHash"];
  [v3 setValue:self->_pallasAssetIdHash forKey:@"pallasDynamicAssetIdHash"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)diffFrom:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    assetType = self->_assetType;
    id v6 = [v4 assetType];
    unsigned int v33 = [(NSString *)assetType isEqual:v6] ^ 1;

    assetId = self->_assetId;
    uint64_t v8 = [v4 assetId];
    unsigned int v32 = [(NSString *)assetId isEqual:v8] ^ 1;

    allAttributesHash = self->_allAttributesHash;
    uint64_t v10 = [v4 allAttributesHash];
    uint64_t v11 = [(NSString *)allAttributesHash isEqual:v10] ^ 1;

    assetIdHash = self->_assetIdHash;
    v13 = [v4 assetIdHash];
    uint64_t v14 = [(NSString *)assetIdHash isEqual:v13] ^ 1;

    nonAssetIdHash = self->_nonAssetIdHash;
    uint64_t v16 = [v4 nonIdHash];
    uint64_t v17 = [(NSString *)nonAssetIdHash isEqual:v16] ^ 1;

    downloadContentHash = self->_downloadContentHash;
    v19 = [v4 contentHash];
    char v20 = [(NSString *)downloadContentHash isEqual:v19] ^ 1;

    downloadUrlHash = self->_downloadUrlHash;
    uint64_t v22 = [v4 urlHash];
    LOBYTE(assetType) = [(NSString *)downloadUrlHash isEqual:v22] ^ 1;

    downloadPolicyHash = self->_downloadPolicyHash;
    uint64_t v24 = [v4 policyHash];
    LOBYTE(assetId) = [(NSString *)downloadPolicyHash isEqual:v24] ^ 1;

    pallasAssetIdHash = self->_pallasAssetIdHash;
    v26 = [v4 pallasDynamicAssetIdHash];
    uint64_t v27 = [(NSString *)pallasAssetIdHash isEqual:v26] ^ 1;

    BYTE2(v31) = (_BYTE)assetId;
    BYTE1(v31) = (_BYTE)assetType;
    LOBYTE(v31) = v20;
    id v28 = -[MAAssetDiff initDifferentAssetType:assetId:attributes:assetIdAttributes:dynamicAssetId:nonIdAttributes:content:url:policy:]([MAAssetDiff alloc], "initDifferentAssetType:assetId:attributes:assetIdAttributes:dynamicAssetId:nonIdAttributes:content:url:policy:", v33, v32, v11, v14, v27, v17, v31);
  }
  else
  {
    id v28 = +[MAAssetDiff allowEverythingDifferent];
  }
  v29 = v28;

  return v29;
}

- (id)diffFromAsset:(id)a3
{
  id v4 = [a3 absoluteAssetId];
  v5 = [(MAAbsoluteAssetId *)self diffFrom:v4];

  return v5;
}

- (id)diffFromAssetId:(id)a3 assetType:(id)a4 attributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[MAAbsoluteAssetId alloc] initWithAssetId:v10 forAssetType:v9 attributes:v8];

  uint64_t v12 = [(MAAbsoluteAssetId *)self diffFrom:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MAAbsoluteAssetId *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MAAbsoluteAssetId *)v5 assetId];
      v7 = [(MAAbsoluteAssetId *)self assetId];
      if ([v6 isEqualToString:v7])
      {
        id v8 = [(MAAbsoluteAssetId *)v5 assetType];
        id v9 = [(MAAbsoluteAssetId *)self assetType];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (BOOL)hasOnlyAssetTypeAndId
{
  return !self->_allAttributesHash
      && !self->_assetIdHash
      && !self->_nonAssetIdHash
      && !self->_downloadContentHash
      && !self->_downloadUrlHash
      && !self->_downloadPolicyHash
      && self->_pallasAssetIdHash == 0;
}

- (id)summary
{
  BOOL v3 = [(MAAbsoluteAssetId *)self hasOnlyAssetTypeAndId];
  id v4 = NSString;
  v5 = [(MAAbsoluteAssetId *)self assetType];
  uint64_t v6 = [(MAAbsoluteAssetId *)self assetId];
  v7 = (void *)v6;
  if (v3) {
    id v8 = @"%@:%@";
  }
  else {
    id v8 = @"%@:%@(+)";
  }
  id v9 = objc_msgSend(v4, "stringWithFormat:", v8, v5, v6);

  return v9;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(MAAbsoluteAssetId *)self assetId];
  v5 = [(MAAbsoluteAssetId *)self assetType];
  objc_msgSend(v3, "stringWithFormat:", @"(%@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@ %@=%@)", @"assetId", v4, @"assetType", v5, @"attributesHash", self->_allAttributesHash, @"assetIdHash", self->_assetIdHash, @"nonIdHash", self->_nonAssetIdHash, @"pallasDynamicAssetIdHash", self->_pallasAssetIdHash, @"contentHash", self->_downloadContentHash, @"urlHash", self->_downloadUrlHash,
    @"policyHash",
  uint64_t v6 = self->_downloadPolicyHash);

  return v6;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (void)setAssetId:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_pallasAssetIdHash, 0);
  objc_storeStrong((id *)&self->_downloadPolicyHash, 0);
  objc_storeStrong((id *)&self->_downloadUrlHash, 0);
  objc_storeStrong((id *)&self->_downloadContentHash, 0);
  objc_storeStrong((id *)&self->_nonAssetIdHash, 0);
  objc_storeStrong((id *)&self->_assetIdHash, 0);
  objc_storeStrong((id *)&self->_allAttributesHash, 0);
}

@end