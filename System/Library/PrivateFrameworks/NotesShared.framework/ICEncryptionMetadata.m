@interface ICEncryptionMetadata
+ (id)makeForV1CipherWithObjectIdentifier:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 hint:(id)a6;
+ (id)makeForV1NeoCipherWithObjectIdentifier:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 hint:(id)a6;
+ (id)makeForV1NeoSidecarCipherWithObjectIdentifier:(id)a3;
+ (id)makeForV2CipherWithObjectIdentifier:(id)a3 accountKeyIdentifier:(id)a4;
+ (id)makeFromMetadata:(id)a3 forObjectIdentifier:(id)a4;
- (BOOL)deserializeWithData:(id)a3 authenticatedData:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)serialize;
- (BOOL)validate;
- (ICEncryptionMetadata)initWithCipherVersion:(int64_t)a3 objectIdentifier:(id)a4 passphraseSalt:(id)a5 passphraseIterationCount:(unint64_t)a6 passphraseHint:(id)a7 accountKeyIdentifier:(id)a8;
- (ICEncryptionMetadata)initWithSerializedData:(id)a3 authenticatedData:(id)a4;
- (NSData)authenticatedData;
- (NSData)passphraseSalt;
- (NSData)serializedData;
- (NSString)accountKeyIdentifier;
- (NSString)objectIdentifier;
- (NSString)passphraseHint;
- (id)description;
- (int64_t)cipherVersion;
- (unint64_t)hash;
- (unint64_t)passphraseIterationCount;
- (void)serialize;
- (void)validate;
@end

@implementation ICEncryptionMetadata

+ (id)makeForV1CipherWithObjectIdentifier:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 hint:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [[ICEncryptionMetadata alloc] initWithCipherVersion:0 objectIdentifier:v11 passphraseSalt:v10 passphraseIterationCount:a5 passphraseHint:v9 accountKeyIdentifier:0];

  return v12;
}

+ (id)makeForV1NeoCipherWithObjectIdentifier:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 hint:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [[ICEncryptionMetadata alloc] initWithCipherVersion:2 objectIdentifier:v11 passphraseSalt:v10 passphraseIterationCount:a5 passphraseHint:v9 accountKeyIdentifier:0];

  return v12;
}

+ (id)makeForV1NeoSidecarCipherWithObjectIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[ICEncryptionMetadata alloc] initWithCipherVersion:3 objectIdentifier:v3 passphraseSalt:0 passphraseIterationCount:0 passphraseHint:0 accountKeyIdentifier:0];

  return v4;
}

+ (id)makeForV2CipherWithObjectIdentifier:(id)a3 accountKeyIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[ICEncryptionMetadata alloc] initWithCipherVersion:1 objectIdentifier:v6 passphraseSalt:0 passphraseIterationCount:0 passphraseHint:0 accountKeyIdentifier:v5];

  return v7;
}

+ (id)makeFromMetadata:(id)a3 forObjectIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [ICEncryptionMetadata alloc];
  uint64_t v8 = [v6 cipherVersion];
  id v9 = [v6 passphraseSalt];
  uint64_t v10 = [v6 passphraseIterationCount];
  id v11 = [v6 passphraseHint];
  v12 = [v6 accountKeyIdentifier];

  v13 = [(ICEncryptionMetadata *)v7 initWithCipherVersion:v8 objectIdentifier:v5 passphraseSalt:v9 passphraseIterationCount:v10 passphraseHint:v11 accountKeyIdentifier:v12];
  return v13;
}

- (ICEncryptionMetadata)initWithCipherVersion:(int64_t)a3 objectIdentifier:(id)a4 passphraseSalt:(id)a5 passphraseIterationCount:(unint64_t)a6 passphraseHint:(id)a7 accountKeyIdentifier:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)ICEncryptionMetadata;
  v18 = [(ICEncryptionMetadata *)&v30 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_4;
  }
  v18->_cipherVersion = a3;
  uint64_t v20 = [v14 copy];
  objectIdentifier = v19->_objectIdentifier;
  v19->_objectIdentifier = (NSString *)v20;

  uint64_t v22 = [v15 copy];
  passphraseSalt = v19->_passphraseSalt;
  v19->_passphraseSalt = (NSData *)v22;

  v19->_passphraseIterationCount = a6;
  uint64_t v24 = [v16 copy];
  passphraseHint = v19->_passphraseHint;
  v19->_passphraseHint = (NSString *)v24;

  uint64_t v26 = [v17 copy];
  accountKeyIdentifier = v19->_accountKeyIdentifier;
  v19->_accountKeyIdentifier = (NSString *)v26;

  if (![(ICEncryptionMetadata *)v19 validate]) {
    goto LABEL_5;
  }
  if ([(ICEncryptionMetadata *)v19 serialize]) {
LABEL_4:
  }
    v28 = v19;
  else {
LABEL_5:
  }
    v28 = 0;

  return v28;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = ICCipherNameForCipherVersion([(ICEncryptionMetadata *)self cipherVersion]);
  v7 = [(ICEncryptionMetadata *)self objectIdentifier];
  uint64_t v8 = [(ICEncryptionMetadata *)self passphraseSalt];
  id v9 = objc_msgSend(v8, "ic_sha256");
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICEncryptionMetadata passphraseIterationCount](self, "passphraseIterationCount"));
  id v11 = [(ICEncryptionMetadata *)self passphraseHint];
  v12 = [(ICEncryptionMetadata *)self accountKeyIdentifier];
  v13 = [v3 stringWithFormat:@"<%@: %p, cipherVersion: %@, objectIdentifier: %@, passphraseSalt.sha256: %@, passphraseIterationCount: %@, passphraseHint: %@, accountKeyIdentifier: %@>", v5, self, v6, v7, v9, v10, v11, v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    id v5 = ICDynamicCast();

    uint64_t v6 = [v5 cipherVersion];
    if (v6 != [(ICEncryptionMetadata *)self cipherVersion])
    {
      LOBYTE(v22) = 0;
LABEL_56:

      return v22;
    }
    v7 = [v5 objectIdentifier];
    uint64_t v8 = [(ICEncryptionMetadata *)self objectIdentifier];
    id v9 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v7) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v7;
    }
    uint64_t v11 = v10;
    if (v9 == v8) {
      v12 = 0;
    }
    else {
      v12 = v8;
    }
    unint64_t v13 = v12;
    if (v11 | v13)
    {
      id v14 = (void *)v13;
      if (v11) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15) {
        goto LABEL_48;
      }
      int v16 = [(id)v11 isEqual:v13];

      if (!v16)
      {
        LOBYTE(v22) = 0;
LABEL_55:

        goto LABEL_56;
      }
    }
    uint64_t v11 = [v5 passphraseSalt];
    id v14 = [(ICEncryptionMetadata *)self passphraseSalt];
    if (v9 == (void *)v11) {
      id v17 = 0;
    }
    else {
      id v17 = (void *)v11;
    }
    uint64_t v18 = v17;
    if (v9 == v14) {
      v19 = 0;
    }
    else {
      v19 = v14;
    }
    unint64_t v20 = v19;
    if (v18 | v20)
    {
      v21 = (void *)v20;
      LOBYTE(v22) = 0;
      if (!v18 || !v20) {
        goto LABEL_53;
      }
      LODWORD(v22) = [(id)v18 isEqual:v20];

      if (!v22)
      {
LABEL_54:

        goto LABEL_55;
      }
    }
    uint64_t v23 = [v5 passphraseIterationCount];
    if (v23 == [(ICEncryptionMetadata *)self passphraseIterationCount])
    {
      uint64_t v18 = [v5 passphraseHint];
      v21 = [(ICEncryptionMetadata *)self passphraseHint];
      if (v9 == (void *)v18) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = (void *)v18;
      }
      unint64_t v22 = v24;
      if (v9 == v21) {
        v25 = 0;
      }
      else {
        v25 = v21;
      }
      unint64_t v26 = v25;
      if (v22 | v26)
      {
        v27 = (void *)v26;
        v28 = (void *)v22;
        LOBYTE(v22) = 0;
        v41 = v28;
        if (!v28 || !v26)
        {
LABEL_52:

LABEL_53:
          goto LABEL_54;
        }
        v29 = (void *)v26;
        LODWORD(v39) = [v28 isEqual:v26];

        if (!v39)
        {
          LOBYTE(v22) = 0;
          goto LABEL_53;
        }
      }
      uint64_t v30 = objc_msgSend(v5, "accountKeyIdentifier", v39);
      uint64_t v31 = [(ICEncryptionMetadata *)self accountKeyIdentifier];
      v41 = (void *)v30;
      if (v9 == (void *)v30) {
        v32 = 0;
      }
      else {
        v32 = (void *)v30;
      }
      unint64_t v22 = v32;
      v40 = (void *)v31;
      if (v9 == (void *)v31) {
        v33 = 0;
      }
      else {
        v33 = (void *)v31;
      }
      unint64_t v34 = v33;
      v35 = (void *)v34;
      if (v22 | v34)
      {
        v36 = (void *)v22;
        LOBYTE(v22) = 0;
        v37 = v36;
        if (v36 && v34) {
          LOBYTE(v22) = [v36 isEqual:v34];
        }
      }
      else
      {
        v37 = (void *)v22;
        LOBYTE(v22) = 1;
      }

      v27 = v40;
      goto LABEL_52;
    }
LABEL_48:
    LOBYTE(v22) = 0;
    goto LABEL_54;
  }
  LOBYTE(v22) = 1;
  return v22;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    int64_t v4 = [(ICEncryptionMetadata *)self cipherVersion];
    id v5 = [(ICEncryptionMetadata *)self objectIdentifier];
    uint64_t v6 = [v5 hash];
    if (!v6)
    {
      v7 = [MEMORY[0x1E4F1CA98] null];
      uint64_t v6 = [v7 hash];
    }
    uint64_t v8 = [(ICEncryptionMetadata *)self passphraseSalt];
    if (![v8 hash])
    {
      id v9 = [MEMORY[0x1E4F1CA98] null];
      [v9 hash];
    }
    uint64_t v10 = v4 + 1;
    [(ICEncryptionMetadata *)self passphraseIterationCount];
    uint64_t v11 = [(ICEncryptionMetadata *)self passphraseHint];
    if (![v11 hash])
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v12 hash];
    }
    unint64_t v13 = [(ICEncryptionMetadata *)self accountKeyIdentifier];
    if (![v13 hash])
    {
      [MEMORY[0x1E4F1CA98] null];
      char v24 = v6;
      uint64_t v6 = (uint64_t)v8;
      uint64_t v21 = v10;
      v23 = unint64_t v22 = v5;
      [v23 hash];

      id v5 = v22;
      uint64_t v10 = v21;
      uint64_t v8 = (void *)v6;
      LOBYTE(v6) = v24;
    }
    self->_hash = ICHashWithHashKeys(v10, v14, v15, v16, v17, v18, v19, v20, v6);

    return self->_hash;
  }
  return result;
}

- (ICEncryptionMetadata)initWithSerializedData:(id)a3 authenticatedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICEncryptionMetadata;
  uint64_t v8 = [(ICEncryptionMetadata *)&v12 init];
  id v9 = v8;
  if (!v8
    || [(ICEncryptionMetadata *)v8 deserializeWithData:v6 authenticatedData:v7]&& [(ICEncryptionMetadata *)v9 validate])
  {
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)serialize
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", self->_passphraseSalt, @"passphraseSalt");
  if (self->_passphraseIterationCount)
  {
    int64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
    objc_msgSend(v3, "ic_setNonNilObject:forKey:", v4, @"passphraseIterationCount");
  }
  else
  {
    objc_msgSend(v3, "ic_setNonNilObject:forKey:", 0, @"passphraseIterationCount");
  }
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", self->_passphraseHint, @"passphraseHint");
  id v5 = (void *)MEMORY[0x1E4F28F98];
  id v6 = (void *)[v3 copy];
  id v22 = 0;
  id v7 = [v5 dataWithPropertyList:v6 format:200 options:0 error:&v22];
  id v8 = v22;
  serializedData = self->_serializedData;
  self->_serializedData = v7;

  if (self->_serializedData)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_cipherVersion];
    [v10 ic_setNonNilObject:v11 forKey:@"cipherVersion"];

    [v10 ic_setNonNilObject:self->_objectIdentifier forKey:@"objectIdentifier"];
    [v10 ic_setNonNilObject:self->_accountKeyIdentifier forKey:@"accountKeyIdentifier"];
    objc_super v12 = (void *)MEMORY[0x1E4F28F98];
    id v13 = [v10 copy];
    id v21 = 0;
    uint64_t v14 = [v12 dataWithPropertyList:v13 format:200 options:0 error:&v21];
    id v15 = v21;

    authenticatedData = self->_authenticatedData;
    self->_authenticatedData = v14;

    uint64_t v17 = self->_authenticatedData;
    BOOL v18 = v17 != 0;
    if (!v17)
    {
      uint64_t v19 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ICEncryptionMetadata serialize]();
      }

      BOOL v18 = 0;
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICEncryptionMetadata serialize]();
    }
    BOOL v18 = 0;
    id v15 = v8;
  }

  return v18;
}

- (BOOL)deserializeWithData:(id)a3 authenticatedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = 0;
  }
  else
  {
    id v35 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:MEMORY[0x1E4F1CC08] format:200 options:0 error:&v35];
    id v8 = v35;

    if (!v9)
    {
      objc_super v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ICEncryptionMetadata deserializeWithData:authenticatedData:]();
      }
      id v6 = 0;
      goto LABEL_17;
    }
    id v6 = (id)v9;
  }
  if (![v7 length])
  {
    objc_super v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICEncryptionMetadata deserializeWithData:authenticatedData:]();
    }
LABEL_17:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  id v34 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v34];
  id v11 = v34;

  objc_super v12 = ICCheckedDynamicCast();

  if (v12)
  {
    objc_opt_class();
    id v33 = 0;
    id v13 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v33];
    id v8 = v33;

    uint64_t v14 = ICCheckedDynamicCast();

    BOOL v15 = v14 != 0;
    if (v14)
    {
      objc_storeStrong((id *)&self->_serializedData, v6);
      objc_opt_class();
      uint64_t v16 = [v12 objectForKeyedSubscript:@"passphraseSalt"];
      ICDynamicCast();
      uint64_t v17 = (NSData *)objc_claimAutoreleasedReturnValue();
      passphraseSalt = self->_passphraseSalt;
      self->_passphraseSalt = v17;

      objc_opt_class();
      uint64_t v19 = [v12 objectForKeyedSubscript:@"passphraseIterationCount"];
      uint64_t v20 = ICDynamicCast();
      self->_passphraseIterationCount = [v20 unsignedIntegerValue];

      objc_opt_class();
      id v21 = [v12 objectForKeyedSubscript:@"passphraseHint"];
      ICDynamicCast();
      id v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      passphraseHint = self->_passphraseHint;
      self->_passphraseHint = v22;

      objc_storeStrong((id *)&self->_authenticatedData, a4);
      objc_opt_class();
      char v24 = [v14 objectForKeyedSubscript:@"cipherVersion"];
      v25 = ICCheckedDynamicCast();
      self->_cipherVersion = [v25 unsignedIntegerValue];

      objc_opt_class();
      unint64_t v26 = [v14 objectForKeyedSubscript:@"objectIdentifier"];
      ICDynamicCast();
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      objectIdentifier = self->_objectIdentifier;
      self->_objectIdentifier = v27;

      objc_opt_class();
      v29 = [v14 objectForKeyedSubscript:@"accountKeyIdentifier"];
      ICDynamicCast();
      uint64_t v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      accountKeyIdentifier = self->_accountKeyIdentifier;
      self->_accountKeyIdentifier = v30;
    }
    else
    {
      v29 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ICEncryptionMetadata deserializeWithData:authenticatedData:].cold.4();
      }
    }
  }
  else
  {
    uint64_t v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICEncryptionMetadata deserializeWithData:authenticatedData:]();
    }
    BOOL v15 = 0;
    id v8 = v11;
  }

LABEL_22:
  return v15;
}

- (BOOL)validate
{
  switch([(ICEncryptionMetadata *)self cipherVersion])
  {
    case 0:
      id v3 = [(ICEncryptionMetadata *)self passphraseSalt];
      uint64_t v4 = [v3 length];

      if (v4) {
        return 1;
      }
      id v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ICEncryptionMetadata validate]();
      }
      goto LABEL_24;
    case 1:
      id v7 = [(ICEncryptionMetadata *)self accountKeyIdentifier];
      uint64_t v8 = [v7 length];

      if (v8) {
        return 1;
      }
      id v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ICEncryptionMetadata validate].cold.7();
      }
      goto LABEL_24;
    case 2:
      uint64_t v9 = [(ICEncryptionMetadata *)self objectIdentifier];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        id v11 = [(ICEncryptionMetadata *)self passphraseSalt];
        uint64_t v12 = [v11 length];

        if (v12)
        {
          if ([(ICEncryptionMetadata *)self passphraseIterationCount]) {
            return 1;
          }
          id v5 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
            -[ICEncryptionMetadata validate].cold.5();
          }
        }
        else
        {
          id v5 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
            -[ICEncryptionMetadata validate].cold.4();
          }
        }
      }
      else
      {
        id v5 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          -[ICEncryptionMetadata validate]();
        }
      }
LABEL_24:
      BOOL v6 = 0;
LABEL_25:

      return v6;
    case 3:
      id v13 = [(ICEncryptionMetadata *)self objectIdentifier];
      uint64_t v14 = [v13 length];

      if (v14) {
        return 1;
      }
      id v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ICEncryptionMetadata validate].cold.6();
      }
      goto LABEL_24;
    default:
      id v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ICEncryptionMetadata validate]();
      }
      BOOL v6 = 1;
      goto LABEL_25;
  }
}

- (int64_t)cipherVersion
{
  return self->_cipherVersion;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSData)passphraseSalt
{
  return self->_passphraseSalt;
}

- (unint64_t)passphraseIterationCount
{
  return self->_passphraseIterationCount;
}

- (NSString)passphraseHint
{
  return self->_passphraseHint;
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (NSData)serializedData
{
  return self->_serializedData;
}

- (NSData)authenticatedData
{
  return self->_authenticatedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedData, 0);
  objc_storeStrong((id *)&self->_serializedData, 0);
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_passphraseHint, 0);
  objc_storeStrong((id *)&self->_passphraseSalt, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

- (void)serialize
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Cannot encode authenticated encryption metadata — failing {error: %@}", v2, v3, v4, v5, v6);
}

- (void)deserializeWithData:authenticatedData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Cannot encode empty encryption metadata — failing {error: %@}", v2, v3, v4, v5, v6);
}

- (void)deserializeWithData:authenticatedData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Cannot decode empty authenticated encryption metadata — failing", v2, v3, v4, v5, v6);
}

- (void)deserializeWithData:authenticatedData:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Cannot decode encryption metadata — failing {error: %@}", v2, v3, v4, v5, v6);
}

- (void)deserializeWithData:authenticatedData:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Cannot decode authenticated encryption metadata — failing {error: %@}", v2, v3, v4, v5, v6);
}

- (void)validate
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Cipher v2 doesn't have account key identifier — failing encryption metadata validation", v2, v3, v4, v5, v6);
}

@end