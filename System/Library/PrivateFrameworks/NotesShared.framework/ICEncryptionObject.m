@interface ICEncryptionObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)validate;
- (ICEncryptionMetadata)metadata;
- (ICEncryptionObject)initWithCoder:(id)a3;
- (ICEncryptionObject)initWithMetadata:(id)a3 wrappedEncryptionKey:(id)a4 encryptedData:(id)a5;
- (ICEncryptionObject)initWithSerializedData:(id)a3;
- (NSData)encryptedData;
- (NSData)wrappedEncryptionKey;
- (id)description;
- (id)serialized;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)serialized;
- (void)validate;
@end

@implementation ICEncryptionObject

- (ICEncryptionObject)initWithMetadata:(id)a3 wrappedEncryptionKey:(id)a4 encryptedData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ICEncryptionObject;
  v12 = [(ICEncryptionObject *)&v20 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v12->_metadata, a3);
  uint64_t v14 = [v10 copy];
  wrappedEncryptionKey = v13->_wrappedEncryptionKey;
  v13->_wrappedEncryptionKey = (NSData *)v14;

  uint64_t v16 = [v11 copy];
  encryptedData = v13->_encryptedData;
  v13->_encryptedData = (NSData *)v16;

  if (![(ICEncryptionObject *)v13 validate]) {
    v18 = 0;
  }
  else {
LABEL_3:
  }
    v18 = v13;

  return v18;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICEncryptionObject *)self metadata];
  v7 = [(ICEncryptionObject *)self wrappedEncryptionKey];
  v8 = objc_msgSend(v7, "ic_sha256");
  id v9 = [(ICEncryptionObject *)self encryptedData];
  id v10 = objc_msgSend(v9, "ic_sha256");
  id v11 = [v3 stringWithFormat:@"<%@: %p, metadata: %@, wrappedEncryptionKey.sha256: %@, encryptedData.sha256: %@>", v5, self, v6, v8, v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  v6 = [v5 metadata];
  v7 = [(ICEncryptionObject *)self metadata];
  if ([v6 isEqual:v7])
  {
    v8 = [v5 wrappedEncryptionKey];
    id v9 = [(ICEncryptionObject *)self wrappedEncryptionKey];
    if ([v8 isEqual:v9])
    {
      id v10 = [v5 encryptedData];
      id v11 = [(ICEncryptionObject *)self encryptedData];
      char v12 = [v10 isEqual:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICEncryptionObject *)self metadata];
    uint64_t v5 = [v4 hash];
    v6 = [(ICEncryptionObject *)self wrappedEncryptionKey];
    char v7 = [v6 hash];
    v8 = [(ICEncryptionObject *)self encryptedData];
    [v8 hash];
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v7);

    return self->_hash;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICEncryptionObject *)self metadata];
  v6 = [v5 serializedData];
  [v4 encodeObject:v6 forKey:@"unauthenticatedMetadata"];

  char v7 = [(ICEncryptionObject *)self metadata];
  v8 = [v7 authenticatedData];
  [v4 encodeObject:v8 forKey:@"metadata"];

  uint64_t v9 = [(ICEncryptionObject *)self wrappedEncryptionKey];
  [v4 encodeObject:v9 forKey:@"wrappedEncryptionKey"];

  id v10 = [(ICEncryptionObject *)self encryptedData];
  [v4 encodeObject:v10 forKey:@"encryptedData"];
}

- (ICEncryptionObject)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unauthenticatedMetadata"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
  char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedEncryptionKey"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedData"];

  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v8 == 0)
  {
    p_super = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      -[ICEncryptionObject initWithCoder:](p_super, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_18;
  }
  v19 = [[ICEncryptionMetadata alloc] initWithSerializedData:v5 authenticatedData:v6];
  p_super = &v19->super;
  if (!v19)
  {
    v23 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ICEncryptionObject initWithCoder:](v23, v24, v25, v26, v27, v28, v29, v30);
    }

LABEL_18:
    v22 = 0;
    goto LABEL_19;
  }
  v32.receiver = self;
  v32.super_class = (Class)ICEncryptionObject;
  objc_super v20 = [(ICEncryptionObject *)&v32 init];
  p_isa = (id *)&v20->super.isa;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_metadata, p_super);
    objc_storeStrong(p_isa + 3, v7);
    objc_storeStrong(p_isa + 4, v8);
  }
  self = p_isa;
  v22 = self;
LABEL_19:

  return v22;
}

- (ICEncryptionObject)initWithSerializedData:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ICEncryptionObject_initWithSerializedData___block_invoke;
  block[3] = &unk_1E64A4240;
  uint64_t v5 = self;
  uint64_t v13 = v5;
  if (initWithSerializedData__onceToken != -1) {
    dispatch_once(&initWithSerializedData__onceToken, block);
  }
  id v11 = 0;
  v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
  id v7 = v11;
  if (v7 || ([v6 validate] & 1) == 0)
  {
    if ([v7 code] != 4864)
    {
      BOOL v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ICEncryptionObject initWithSerializedData:]((uint64_t)v7, v9);
      }
    }
    v8 = 0;
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

uint64_t __45__ICEncryptionObject_initWithSerializedData___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v1 = objc_opt_class();
  return [v0 setClass:v1 forClassName:@"ICCryptoEncryptionObject"];
}

- (id)serialized
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__ICEncryptionObject_serialized__block_invoke;
  block[3] = &unk_1E64A4240;
  void block[4] = self;
  if (serialized_onceToken != -1) {
    dispatch_once(&serialized_onceToken, block);
  }
  id v8 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v8];
  id v4 = v8;
  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ICEncryptionObject *)(uint64_t)v4 serialized];
    }

    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

uint64_t __32__ICEncryptionObject_serialized__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v1 = objc_opt_class();
  return [v0 setClassName:@"ICCryptoEncryptionObject" forClass:v1];
}

- (BOOL)validate
{
  uint64_t v3 = [(ICEncryptionObject *)self metadata];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(ICEncryptionObject *)self wrappedEncryptionKey];
    if ([v5 length])
    {
      id v6 = [(ICEncryptionObject *)self encryptedData];
      uint64_t v7 = [v6 length];

      if (v7) {
        return 1;
      }
    }
    else
    {
    }
  }
  BOOL v9 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    [(ICEncryptionObject *)v9 validate];
  }

  return 0;
}

- (ICEncryptionMetadata)metadata
{
  return self->_metadata;
}

- (NSData)wrappedEncryptionKey
{
  return self->_wrappedEncryptionKey;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_wrappedEncryptionKey, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithSerializedData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Cannot deserialize encryption object {error: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)serialized
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Cannot serialize encryption object {error: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)validate
{
}

@end