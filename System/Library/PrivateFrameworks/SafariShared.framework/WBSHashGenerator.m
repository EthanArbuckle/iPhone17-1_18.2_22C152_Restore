@interface WBSHashGenerator
+ (BOOL)supportsSecureCoding;
- (NSData)key;
- (NSData)keyID;
- (WBSHashGenerator)init;
- (WBSHashGenerator)initWithCoder:(id)a3;
- (WBSHashGenerator)initWithKey:(id)a3 keyID:(id)a4;
- (id)_createEncryptionKeyData;
- (id)_createEncryptionKeyIDDataUsingKey:(id)a3;
- (id)description;
- (id)generateHashStringWithComponents:(id)a3;
- (id)generateHashWithComponents:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHashGenerator

- (WBSHashGenerator)init
{
  v3 = [(WBSHashGenerator *)self _createEncryptionKeyData];
  v4 = [(WBSHashGenerator *)self _createEncryptionKeyIDDataUsingKey:v3];
  v5 = [(WBSHashGenerator *)self initWithKey:v3 keyID:v4];

  return v5;
}

- (WBSHashGenerator)initWithKey:(id)a3 keyID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHashGenerator;
  v8 = [(WBSHashGenerator *)&v15 init];
  if (v8
    && [v6 length]
    && [v7 length]
    && (unint64_t)[v7 length] >= 4)
  {
    uint64_t v11 = [v6 copy];
    key = v8->_key;
    v8->_key = (NSData *)v11;

    uint64_t v13 = [v7 copy];
    keyID = v8->_keyID;
    v8->_keyID = (NSData *)v13;

    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)generateHashStringWithComponents:(id)a3
{
  v3 = [(WBSHashGenerator *)self generateHashWithComponents:a3];
  if (v3)
  {
    v4 = objc_msgSend(NSString, "safari_stringAsHexWithData:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)generateHashWithComponents:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_58))
  {
    memset(&ctx, 0, sizeof(ctx));
    p_key = (void **)&self->_key;
    CCHmacInit(&ctx, 2u, [(NSData *)self->_key bytes], [(NSData *)self->_key length]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      char v10 = 1;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v12, "length", (void)v28))
          {
            if (v10)
            {
              id v13 = v12;
            }
            else
            {
              id v13 = [@"/" stringByAppendingString:v12];
            }
            id v14 = v13;
            objc_super v15 = (const char *)[v14 UTF8String];
            size_t v16 = strlen(v15);
            CCHmacUpdate(&ctx, v15, v16);
          }
          char v10 = 0;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v40 count:16];
        char v10 = 0;
      }
      while (v8);
    }

    CCHmacFinal(&ctx, macOut);
    v17 = [MEMORY[0x1E4F1CA58] dataWithBytes:macOut length:32];
    keyID = self->_keyID;
    p_keyID = &self->_keyID;
    objc_msgSend(v17, "appendBytes:length:", -[NSData length](*p_keyID, "length") + -[NSData bytes](keyID, "bytes") - 4, 4);
    if (![v17 length])
    {
      v20 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        [(WBSHashGenerator *)p_key generateHashWithComponents:(id *)p_keyID];
      }
      v21 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = v21;
        v23 = [v6 componentsJoinedByString:@", "];
        v24 = objc_msgSend(*p_key, "safari_descriptionWithoutSpaces");
        v25 = [(NSData *)*p_keyID safari_descriptionWithoutSpaces];
        *(_DWORD *)buf = 138478339;
        v34 = v23;
        __int16 v35 = 2114;
        v36 = v24;
        __int16 v37 = 2114;
        v38 = v25;
        _os_log_debug_impl(&dword_1A6B5F000, v22, OS_LOG_TYPE_DEBUG, "Could not generate IdentityHash for components %{private}@, with key %{public}@, keyID %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    v26 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[WBSHashGenerator generateHashWithComponents:](v26);
    }
    v17 = 0;
  }

  return v17;
}

BOOL __47__WBSHashGenerator_generateHashWithComponents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

- (id)_createEncryptionKeyData
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = 0;
  v2 = [MEMORY[0x1E4F29128] UUID];
  [v2 getUUIDBytes:v5];

  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:16];
  return v3;
}

- (id)_createEncryptionKeyIDDataUsingKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (const char *)[@"Safari" UTF8String];
  id v5 = v3;
  id v6 = (const void *)[v5 bytes];
  size_t v7 = [v5 length];

  size_t v8 = strlen(v4);
  CCHmac(2u, v6, v7, v4, v8, macOut);
  uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:macOut length:32];
  return v9;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; key: %@, keyID: %@>",
               objc_opt_class(),
               self,
               self->_key,
               self->_keyID);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHashGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Key"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KeyID"];

  size_t v7 = [(WBSHashGenerator *)self initWithKey:v5 keyID:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"Key"];
  [v5 encodeObject:self->_keyID forKey:@"KeyID"];
}

- (NSData)key
{
  return self->_key;
}

- (NSData)keyID
{
  return self->_keyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)generateHashWithComponents:(id *)a3 .cold.1(void **a1, void *a2, id *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = *a1;
  id v5 = a2;
  id v6 = objc_msgSend(v4, "safari_descriptionWithoutSpaces");
  size_t v7 = objc_msgSend(*a3, "safari_descriptionWithoutSpaces");
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Could not generate IdentityHash with key %{public}@, keyID %{public}@", (uint8_t *)&v8, 0x16u);
}

- (void)generateHashWithComponents:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Could not generate IdentityHash with empty components", v1, 2u);
}

@end