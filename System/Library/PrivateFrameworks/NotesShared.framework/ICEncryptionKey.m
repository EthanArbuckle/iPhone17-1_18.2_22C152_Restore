@interface ICEncryptionKey
- (BOOL)deserializeWithData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)serialize;
- (BOOL)validate;
- (ICEncryptionKey)initWithKeyData:(id)a3 metadata:(id)a4;
- (ICEncryptionKey)initWithSerializedData:(id)a3;
- (ICEncryptionMetadata)metadata;
- (NSData)keyData;
- (NSData)serializedData;
- (id)description;
- (unint64_t)hash;
- (void)serialize;
- (void)validate;
@end

@implementation ICEncryptionKey

- (ICEncryptionKey)initWithKeyData:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICEncryptionKey;
  v8 = [(ICEncryptionKey *)&v13 init];
  if (!v8
    || (uint64_t v9 = [v6 copy],
        keyData = v8->_keyData,
        v8->_keyData = (NSData *)v9,
        keyData,
        objc_storeStrong((id *)&v8->_metadata, a4),
        [(ICEncryptionKey *)v8 validate])
    && [(ICEncryptionKey *)v8 serialize])
  {
    v11 = v8;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ICEncryptionKey *)self keyData];
  id v7 = objc_msgSend(v6, "ic_sha256");
  v8 = [(ICEncryptionKey *)self metadata];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, keyData.sha256: %@, metadata: %@>", v5, self, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  id v6 = [v5 keyData];
  id v7 = [(ICEncryptionKey *)self keyData];
  if ([v6 isEqual:v7])
  {
    v8 = [v5 metadata];
    uint64_t v9 = [(ICEncryptionKey *)self metadata];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICEncryptionKey *)self keyData];
    uint64_t v5 = [v4 hash];
    id v6 = [(ICEncryptionKey *)self metadata];
    char v7 = [v6 hash];
    self->_hash = ICHashWithHashKeys(v5, v8, v9, v10, v11, v12, v13, v14, v7);

    return self->_hash;
  }
  return result;
}

- (ICEncryptionKey)initWithSerializedData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICEncryptionKey;
  uint64_t v5 = [(ICEncryptionKey *)&v9 init];
  id v6 = v5;
  if (!v5
    || [(ICEncryptionKey *)v5 deserializeWithData:v4]
    && [(ICEncryptionKey *)v6 validate])
  {
    char v7 = v6;
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)serialize
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", self->_keyData, @"key");
  id v4 = [(ICEncryptionMetadata *)self->_metadata serializedData];
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", v4, @"metadata");

  uint64_t v5 = [(ICEncryptionMetadata *)self->_metadata authenticatedData];
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", v5, @"authenticatedData");

  id v6 = (void *)MEMORY[0x1E4F28F98];
  char v7 = (void *)[v3 copy];
  id v14 = 0;
  uint64_t v8 = [v6 dataWithPropertyList:v7 format:200 options:0 error:&v14];
  id v9 = v14;
  serializedData = self->_serializedData;
  self->_serializedData = v8;

  uint64_t v11 = self->_serializedData;
  if (!v11)
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(ICEncryptionKey *)(uint64_t)v9 serialize];
    }
  }
  return v11 != 0;
}

- (BOOL)deserializeWithData:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    objc_opt_class();
    id v30 = 0;
    id v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v30];
    char v7 = v30;
    uint64_t v8 = ICCheckedDynamicCast();

    BOOL v9 = v8 != 0;
    if (v8)
    {
      objc_storeStrong((id *)&self->_serializedData, a3);
      objc_opt_class();
      uint64_t v10 = [v8 objectForKeyedSubscript:@"key"];
      ICCheckedDynamicCast();
      uint64_t v11 = (NSData *)objc_claimAutoreleasedReturnValue();
      keyData = self->_keyData;
      self->_keyData = v11;

      objc_opt_class();
      uint64_t v13 = [v8 objectForKeyedSubscript:@"metadata"];
      id v14 = ICCheckedDynamicCast();

      objc_opt_class();
      v15 = [v8 objectForKeyedSubscript:@"authenticatedData"];
      uint64_t v16 = ICCheckedDynamicCast();
      v17 = (void *)v16;
      if (v16) {
        v18 = (void *)v16;
      }
      else {
        v18 = v14;
      }
      id v19 = v18;

      if (v14)
      {
        v20 = [[ICEncryptionMetadata alloc] initWithSerializedData:v14 authenticatedData:v19];
        metadata = self->_metadata;
        self->_metadata = v20;
      }
    }
    else
    {
      id v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ICEncryptionKey deserializeWithData:]((uint64_t)v7, v14);
      }
    }
  }
  else
  {
    char v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICEncryptionKey deserializeWithData:](v7, v22, v23, v24, v25, v26, v27, v28);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)validate
{
  v3 = [(ICEncryptionKey *)self keyData];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = [(ICEncryptionKey *)self metadata];

    if (v5) {
      return 1;
    }
    char v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(ICEncryptionKey *)v7 validate];
    }
  }
  else
  {
    char v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(ICEncryptionKey *)v7 validate];
    }
  }

  return 0;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (ICEncryptionMetadata)metadata
{
  return self->_metadata;
}

- (NSData)serializedData
{
  return self->_serializedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
}

- (void)serialize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Cannot encode encryption main key — failing {error: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)deserializeWithData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deserializeWithData:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Cannot decode encryption main key — failing {error: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)validate
{
}

@end