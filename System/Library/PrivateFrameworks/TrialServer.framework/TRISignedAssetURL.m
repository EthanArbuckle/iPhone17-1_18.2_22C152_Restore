@interface TRISignedAssetURL
+ (id)allReferencedCKRecordKeys;
+ (id)assetURLFromCKRecord:(id)a3 assetId:(id *)a4;
+ (id)assetURLWithUrl:(id)a3 signature:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssetURL:(id)a3;
- (NSString)signature;
- (NSURL)url;
- (TRISignedAssetURL)initWithUrl:(id)a3 signature:(id)a4;
- (id)copyWithReplacementSignature:(id)a3;
- (id)copyWithReplacementUrl:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRISignedAssetURL

- (TRISignedAssetURL)initWithUrl:(id)a3 signature:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 970, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 971, @"Invalid parameter not satisfying: %@", @"signature != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRISignedAssetURL;
  v11 = [(TRISignedAssetURL *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    objc_storeStrong((id *)&v12->_signature, a4);
  }

  return v12;
}

+ (id)assetURLWithUrl:(id)a3 signature:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithUrl:v7 signature:v6];

  return v8;
}

- (id)copyWithReplacementUrl:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUrl:v4 signature:self->_signature];

  return v5;
}

- (id)copyWithReplacementSignature:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUrl:self->_url signature:v4];

  return v5;
}

- (BOOL)isEqualToAssetURL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_url != 0;
  id v7 = [v4 url];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  url = self->_url;
  if (url)
  {
    v10 = [v5 url];
    int v11 = [(NSURL *)url isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_signature != 0;
  v13 = [v5 signature];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    signature = self->_signature;
    if (signature)
    {
      objc_super v16 = [v5 signature];
      char v17 = [(NSString *)signature isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRISignedAssetURL *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRISignedAssetURL *)self isEqualToAssetURL:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_url hash];
  return [(NSString *)self->_signature hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRISignedAssetURL | url:%@ signature:%@>", self->_url, self->_signature];
  return v2;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (id)allReferencedCKRecordKeys
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB02F0];
  v6[0] = *MEMORY[0x1E4FB02F8];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB0308];
  v6[2] = *MEMORY[0x1E4FB0300];
  v6[3] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  return v4;
}

+ (id)assetURLFromCKRecord:(id)a3 assetId:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = [v7 values];
  id v9 = v8;
  if (v8)
  {
    v10 = [v8 triStringValueForField:*MEMORY[0x1E4FB02F8] isNestedValue:0];
    int v11 = v10;
    if (!v10 || ![v10 length])
    {
      int v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = [v7 recordID];
        *(_DWORD *)buf = 138412290;
        v38 = v20;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Asset in CloudKit record %@ has missing or corrupt assetId.", buf, 0xCu);
      }
      v19 = 0;
      goto LABEL_41;
    }
    int v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB02F0]];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v24 = [v7 recordID];
        *(_DWORD *)buf = 138543618;
        v38 = v11;
        __int16 v39 = 2112;
        v40 = v24;
        _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has missing or corrupt asset.", buf, 0x16u);
      }
      v19 = 0;
      goto LABEL_40;
    }
    v13 = [v12 fileURL];
    if (!v13)
    {
      int v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [v7 recordID];
        v30 = v29 = v14;
        *(_DWORD *)buf = 138543618;
        v38 = v11;
        __int16 v39 = 2112;
        v40 = v30;
        _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has missing fileURL.", buf, 0x16u);

        int v14 = v29;
      }
      v19 = 0;
      goto LABEL_39;
    }
    int v14 = [v9 triStringValueForField:*MEMORY[0x1E4FB0300] isNestedValue:0];
    if (v14)
    {
      uint64_t v15 = [v9 triDataForField:*MEMORY[0x1E4FB0308]];
      if (v15)
      {
        objc_super v16 = v15;
        v36 = +[TRISignatureKey keyFromData:v15];
        if (v36)
        {
          v35 = v14;
          char v17 = [v13 path];
          if (!v17)
          {
            v34 = [MEMORY[0x1E4F28B00] currentHandler];
            [v34 handleFailureInMethod:a2, a1, @"TRISignedAssetURL+CloudKit.m", 90, @"Expression was unexpectedly nil/false: %@", @"assetURL.path" object file lineNumber description];
          }
          char v18 = [v36 validateBase64Signature:v35 forFile:v17];

          if (v18)
          {

            objc_storeStrong(a4, v11);
            int v14 = v35;
            v19 = [[TRISignedAssetURL alloc] initWithUrl:v13 signature:v35];
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
            goto LABEL_42;
          }
          v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v33 = [v7 recordID];
            *(_DWORD *)buf = 138543618;
            v38 = v11;
            __int16 v39 = 2112;
            v40 = v33;
            _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Asset %{public}@ from CloudKit record %@ has an invalid signature.", buf, 0x16u);
          }
          int v14 = v35;
        }
        else
        {
          v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            [v7 recordID];
            v27 = v26 = v14;
            *(_DWORD *)buf = 138543618;
            v38 = v11;
            __int16 v39 = 2112;
            v40 = v27;
            _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has public certificate which cannot be loaded.", buf, 0x16u);

            int v14 = v26;
          }
        }
      }
      else
      {
        v23 = TRILogCategory_Server();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          [v7 recordID];
          v32 = v31 = v14;
          *(_DWORD *)buf = 138543618;
          v38 = v11;
          __int16 v39 = 2112;
          v40 = v32;
          _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has missing or corrupt public certificate.", buf, 0x16u);

          int v14 = v31;
        }

        objc_super v16 = 0;
      }
    }
    else
    {
      objc_super v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v22 = [v7 recordID];
        *(_DWORD *)buf = 138543618;
        v38 = v11;
        __int16 v39 = 2112;
        v40 = v22;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has missing or corrupt asset signature.", buf, 0x16u);

        int v14 = 0;
      }
    }
    v19 = 0;
    goto LABEL_38;
  }
  int v11 = TRILogCategory_Server();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v21 = [v7 recordID];
    *(_DWORD *)buf = 138412290;
    v38 = v21;
    _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Could not create Asset artifact from CloudKit record %@.", buf, 0xCu);
  }
  v19 = 0;
LABEL_42:

  return v19;
}

@end