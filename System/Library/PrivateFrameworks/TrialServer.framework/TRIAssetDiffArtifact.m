@interface TRIAssetDiffArtifact
+ (BOOL)_signature:(id)a3 onFileURL:(id)a4 fromCloudKitRecordId:(id)a5 isValidUsingPublicCertificate:(id)a6;
+ (id)allReferencedCKRecordKeys;
+ (id)artifactFromCKRecord:(id)a3;
+ (id)artifactWithSourceAssetId:(id)a3 destAssetId:(id)a4 diffSignature:(id)a5 diff:(id)a6 diffSize:(int64_t)a7 publicCertificate:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToArtifact:(id)a3;
- (NSData)publicCertificate;
- (NSString)diffSignature;
- (NSURL)diff;
- (TRIAssetDiffArtifact)initWithSourceAssetId:(id)a3 destAssetId:(id)a4 diffSignature:(id)a5 diff:(id)a6 diffSize:(int64_t)a7 publicCertificate:(id)a8;
- (TRIAssetId)destAssetId;
- (TRIAssetId)sourceAssetId;
- (id)copyWithReplacementDestAssetId:(id)a3;
- (id)copyWithReplacementDiff:(id)a3;
- (id)copyWithReplacementDiffSignature:(id)a3;
- (id)copyWithReplacementDiffSize:(int64_t)a3;
- (id)copyWithReplacementPublicCertificate:(id)a3;
- (id)copyWithReplacementSourceAssetId:(id)a3;
- (id)description;
- (int64_t)diffSize;
- (unint64_t)hash;
@end

@implementation TRIAssetDiffArtifact

- (TRIAssetDiffArtifact)initWithSourceAssetId:(id)a3 destAssetId:(id)a4 diffSignature:(id)a5 diff:(id)a6 diffSize:(int64_t)a7 publicCertificate:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v28 = a8;
  id v17 = a8;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2729, @"Invalid parameter not satisfying: %@", @"sourceAssetId != nil" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2730, @"Invalid parameter not satisfying: %@", @"destAssetId != nil" object file lineNumber description];

  if (v15)
  {
LABEL_4:
    if (v16) {
      goto LABEL_5;
    }
LABEL_12:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2732, @"Invalid parameter not satisfying: %@", @"diff != nil" object file lineNumber description];

    if (v17) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2731, @"Invalid parameter not satisfying: %@", @"diffSignature != nil" object file lineNumber description];

  if (!v16) {
    goto LABEL_12;
  }
LABEL_5:
  if (v17) {
    goto LABEL_6;
  }
LABEL_13:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2733, @"Invalid parameter not satisfying: %@", @"publicCertificate != nil" object file lineNumber description];

LABEL_6:
  v30.receiver = self;
  v30.super_class = (Class)TRIAssetDiffArtifact;
  v18 = [(TRIAssetDiffArtifact *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourceAssetId, a3);
    objc_storeStrong((id *)&v19->_destAssetId, a4);
    objc_storeStrong((id *)&v19->_diffSignature, a5);
    objc_storeStrong((id *)&v19->_diff, a6);
    v19->_diffSize = a7;
    objc_storeStrong((id *)&v19->_publicCertificate, v28);
  }

  return v19;
}

+ (id)artifactWithSourceAssetId:(id)a3 destAssetId:(id)a4 diffSignature:(id)a5 diff:(id)a6 diffSize:(int64_t)a7 publicCertificate:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithSourceAssetId:v18 destAssetId:v17 diffSignature:v16 diff:v15 diffSize:a7 publicCertificate:v14];

  return v19;
}

- (id)copyWithReplacementSourceAssetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSourceAssetId:v4 destAssetId:self->_destAssetId diffSignature:self->_diffSignature diff:self->_diff diffSize:self->_diffSize publicCertificate:self->_publicCertificate];

  return v5;
}

- (id)copyWithReplacementDestAssetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSourceAssetId:self->_sourceAssetId destAssetId:v4 diffSignature:self->_diffSignature diff:self->_diff diffSize:self->_diffSize publicCertificate:self->_publicCertificate];

  return v5;
}

- (id)copyWithReplacementDiffSignature:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSourceAssetId:self->_sourceAssetId destAssetId:self->_destAssetId diffSignature:v4 diff:self->_diff diffSize:self->_diffSize publicCertificate:self->_publicCertificate];

  return v5;
}

- (id)copyWithReplacementDiff:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSourceAssetId:self->_sourceAssetId destAssetId:self->_destAssetId diffSignature:self->_diffSignature diff:v4 diffSize:self->_diffSize publicCertificate:self->_publicCertificate];

  return v5;
}

- (id)copyWithReplacementDiffSize:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  sourceAssetId = self->_sourceAssetId;
  destAssetId = self->_destAssetId;
  diffSignature = self->_diffSignature;
  diff = self->_diff;
  publicCertificate = self->_publicCertificate;
  return (id)[v5 initWithSourceAssetId:sourceAssetId destAssetId:destAssetId diffSignature:diffSignature diff:diff diffSize:a3 publicCertificate:publicCertificate];
}

- (id)copyWithReplacementPublicCertificate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSourceAssetId:self->_sourceAssetId destAssetId:self->_destAssetId diffSignature:self->_diffSignature diff:self->_diff diffSize:self->_diffSize publicCertificate:v4];

  return v5;
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_18;
  }
  int v6 = self->_sourceAssetId != 0;
  v7 = [v4 sourceAssetId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_18;
  }
  sourceAssetId = self->_sourceAssetId;
  if (sourceAssetId)
  {
    v10 = [v5 sourceAssetId];
    int v11 = [(TRIAssetId *)sourceAssetId isEqual:v10];

    if (!v11) {
      goto LABEL_18;
    }
  }
  int v12 = self->_destAssetId != 0;
  id v13 = [v5 destAssetId];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_18;
  }
  destAssetId = self->_destAssetId;
  if (destAssetId)
  {
    id v16 = [v5 destAssetId];
    int v17 = [(TRIAssetId *)destAssetId isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  int v18 = self->_diffSignature != 0;
  v19 = [v5 diffSignature];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_18;
  }
  diffSignature = self->_diffSignature;
  if (diffSignature)
  {
    v22 = [v5 diffSignature];
    int v23 = [(NSString *)diffSignature isEqual:v22];

    if (!v23) {
      goto LABEL_18;
    }
  }
  int v24 = self->_diff != 0;
  v25 = [v5 diff];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_18;
  }
  diff = self->_diff;
  if (diff)
  {
    id v28 = [v5 diff];
    int v29 = [(NSURL *)diff isEqual:v28];

    if (!v29) {
      goto LABEL_18;
    }
  }
  int64_t diffSize = self->_diffSize;
  if (diffSize != [v5 diffSize]
    || (int v31 = self->_publicCertificate != 0,
        [v5 publicCertificate],
        v32 = objc_claimAutoreleasedReturnValue(),
        int v33 = v32 == 0,
        v32,
        v31 == v33))
  {
LABEL_18:
    char v36 = 0;
  }
  else
  {
    publicCertificate = self->_publicCertificate;
    if (publicCertificate)
    {
      v35 = [v5 publicCertificate];
      char v36 = [(NSData *)publicCertificate isEqual:v35];
    }
    else
    {
      char v36 = 1;
    }
  }

  return v36;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIAssetDiffArtifact *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIAssetDiffArtifact *)self isEqualToArtifact:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIAssetId *)self->_sourceAssetId hash];
  uint64_t v4 = [(TRIAssetId *)self->_destAssetId hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_diffSignature hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSURL *)self->_diff hash] - v5 + 32 * v5;
  publicCertificate = self->_publicCertificate;
  int64_t v8 = self->_diffSize - v6 + 32 * v6;
  return [(NSData *)publicCertificate hash] - v8 + 32 * v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v9 = *(_OWORD *)&self->_sourceAssetId;
  diffSignature = self->_diffSignature;
  diff = self->_diff;
  uint64_t v6 = [NSNumber numberWithLongLong:self->_diffSize];
  v7 = (void *)[v3 initWithFormat:@"<TRIAssetDiffArtifact | sourceAssetId:%@ destAssetId:%@ diffSignature:%@ diff:%@ diffSize:%@ publicCertificate:%@>", v9, diffSignature, diff, v6, self->_publicCertificate];

  return v7;
}

- (TRIAssetId)sourceAssetId
{
  return self->_sourceAssetId;
}

- (TRIAssetId)destAssetId
{
  return self->_destAssetId;
}

- (NSString)diffSignature
{
  return self->_diffSignature;
}

- (NSURL)diff
{
  return self->_diff;
}

- (int64_t)diffSize
{
  return self->_diffSize;
}

- (NSData)publicCertificate
{
  return self->_publicCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicCertificate, 0);
  objc_storeStrong((id *)&self->_diff, 0);
  objc_storeStrong((id *)&self->_diffSignature, 0);
  objc_storeStrong((id *)&self->_destAssetId, 0);
  objc_storeStrong((id *)&self->_sourceAssetId, 0);
}

+ (id)allReferencedCKRecordKeys
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB02D8];
  v7[0] = *MEMORY[0x1E4FB02E0];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB02C0];
  v7[2] = *MEMORY[0x1E4FB02C8];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4FB02E8];
  v7[4] = *MEMORY[0x1E4FB02D0];
  v7[5] = v4;
  NSUInteger v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];
  return v5;
}

+ (id)artifactFromCKRecord:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __55__TRIAssetDiffArtifact_CloudKit__artifactFromCKRecord___block_invoke;
  v32[3] = &unk_1E6BB7D18;
  id v5 = v4;
  id v33 = v5;
  uint64_t v6 = (void (**)(void, void))MEMORY[0x1E016EA80](v32);
  v7 = [v5 values];
  int64_t v8 = v7;
  if (!v7)
  {
    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v25 = [v5 recordID];
      *(_DWORD *)buf = 138412290;
      v35 = v25;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Could not create AssetDiff artifact from CloudKit record %@.", buf, 0xCu);
    }
    goto LABEL_17;
  }
  uint64_t v9 = *MEMORY[0x1E4FB02E0];
  v10 = [v7 triStringValueForField:*MEMORY[0x1E4FB02E0] isNestedValue:0];
  if (!v10)
  {
    v6[2](v6, v9);
LABEL_17:
    int v20 = 0;
    goto LABEL_35;
  }
  uint64_t v11 = *MEMORY[0x1E4FB02D8];
  int v12 = [v8 triStringValueForField:*MEMORY[0x1E4FB02D8] isNestedValue:0];
  if (v12)
  {
    uint64_t v13 = *MEMORY[0x1E4FB02C8];
    int v14 = [v8 triStringValueForField:*MEMORY[0x1E4FB02C8] isNestedValue:0];
    if (!v14)
    {
      v6[2](v6, v13);
      int v20 = 0;
LABEL_33:

      goto LABEL_34;
    }
    id v15 = (void *)*MEMORY[0x1E4FB02C0];
    id v16 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB02C0]];
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      ((void (**)(void, void *))v6)[2](v6, v15);
      int v20 = 0;
LABEL_32:

      goto LABEL_33;
    }
    uint64_t v17 = *MEMORY[0x1E4FB02D0];
    int v31 = [v8 triNumberValueForField:*MEMORY[0x1E4FB02D0] isNestedValue:0];
    if (!v31)
    {
      v6[2](v6, v17);
      int v20 = 0;
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v18 = *MEMORY[0x1E4FB02E8];
    objc_super v30 = [v8 triDataForField:*MEMORY[0x1E4FB02E8]];
    if (!v30)
    {
      v6[2](v6, v18);
      int v20 = 0;
LABEL_30:

      goto LABEL_31;
    }
    int v29 = TRIValidateAssetId();
    v19 = TRIValidateAssetId();
    int v20 = 0;
    if (!v29 || !v19)
    {
LABEL_29:

      goto LABEL_30;
    }
    id v28 = v19;
    uint64_t v21 = [v16 fileURL];
    if (v21)
    {
      v22 = [v5 recordID];
      int v23 = [a1 _signature:v14 onFileURL:v21 fromCloudKitRecordId:v22 isValidUsingPublicCertificate:v30];

      if (v23)
      {
        int v24 = (void *)v21;
        int v20 = -[TRIAssetDiffArtifact initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:]([TRIAssetDiffArtifact alloc], "initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:", v29, v28, v14, v21, [v31 longLongValue], v30);
LABEL_28:

        v19 = v28;
        goto LABEL_29;
      }
      int v24 = (void *)v21;
    }
    else
    {
      int v24 = 0;
      int v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v15;
        _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "CKAsset for %@ has no fileURL.", buf, 0xCu);
      }
    }
    int v20 = 0;
    goto LABEL_28;
  }
  v6[2](v6, v11);
  int v20 = 0;
LABEL_34:

LABEL_35:
  return v20;
}

void __55__TRIAssetDiffArtifact_CloudKit__artifactFromCKRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) recordID];
    int v6 = 138412546;
    v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "AssetDiff in CloudKit record %@ has missing or corrupt %{public}@.", (uint8_t *)&v6, 0x16u);
  }
}

+ (BOOL)_signature:(id)a3 onFileURL:(id)a4 fromCloudKitRecordId:(id)a5 isValidUsingPublicCertificate:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  int v14 = +[TRISignatureKey keyFromData:a6];
  if (!v14)
  {
LABEL_9:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  id v15 = [v12 path];
  if (!v15)
  {
    int v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"TRIAssetDiffArtifact+CloudKit.m", 125, @"Expression was unexpectedly nil/false: %@", @"URL.path" object file lineNumber description];
  }
  char v16 = [v14 validateBase64Signature:v11 forFile:v15];

  if ((v16 & 1) == 0)
  {
    uint64_t v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v13;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Unable to validate signature on assetDiff from CKRecordID %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  BOOL v17 = 1;
LABEL_10:

  return v17;
}

@end