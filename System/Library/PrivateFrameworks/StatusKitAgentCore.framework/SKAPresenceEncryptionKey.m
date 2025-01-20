@interface SKAPresenceEncryptionKey
+ (id)logger;
- (BOOL)_initializeNewKeyMaterial;
- (NSData)keyData;
- (NSData)keyMaterial;
- (SKAPresenceEncryptionKey)initWithKeyMaterial:(id)a3;
- (SKAPresenceEncryptionKey)initWithNewKeyMaterial;
- (id)_randomBytesWithLength:(unint64_t)a3 error:(id *)a4;
- (id)decryptPayload:(id)a3;
- (id)encryptPayload:(id)a3;
- (void)setKeyData:(id)a3;
@end

@implementation SKAPresenceEncryptionKey

- (SKAPresenceEncryptionKey)initWithNewKeyMaterial
{
  v6.receiver = self;
  v6.super_class = (Class)SKAPresenceEncryptionKey;
  v2 = [(SKAPresenceEncryptionKey *)&v6 init];
  v3 = v2;
  if (v2 && ![(SKAPresenceEncryptionKey *)v2 _initializeNewKeyMaterial]) {
    v4 = 0;
  }
  else {
    v4 = v3;
  }

  return v4;
}

- (SKAPresenceEncryptionKey)initWithKeyMaterial:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKAPresenceEncryptionKey;
  objc_super v6 = [(SKAPresenceEncryptionKey *)&v17 init];
  if (!v6) {
    goto LABEL_5;
  }
  if ([v5 length] && objc_msgSend(v5, "length") == 32)
  {
    objc_storeStrong((id *)&v6->_keyData, a3);
LABEL_5:
    v7 = v6;
    goto LABEL_9;
  }
  v8 = +[SKAPresenceEncryptionKey logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SKAPresenceEncryptionKey initWithKeyMaterial:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  v7 = 0;
LABEL_9:

  return v7;
}

- (id)encryptPayload:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    objc_super v6 = +[SKAPresenceEncryptionKey logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceEncryptionKey encryptPayload:](v6, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_9;
  }
  uint64_t v38 = 0;
  id v5 = [(SKAPresenceEncryptionKey *)self _randomBytesWithLength:12 error:&v38];
  objc_super v6 = v5;
  if (v38)
  {
LABEL_9:
    id v26 = 0;
    goto LABEL_12;
  }
  [v5 length];
  v7 = v6;
  v8 = [(SKAPresenceEncryptionKey *)self keyData];
  [v8 length];

  uint64_t v9 = [(SKAPresenceEncryptionKey *)self keyData];
  uint64_t v10 = [v4 length];
  id v11 = v4;
  uint64_t v12 = [MEMORY[0x263EFF990] dataWithLength:v10];
  uint64_t v13 = [MEMORY[0x263EFF990] dataWithLength:16];
  id v37 = v9;
  [v37 bytes];
  objc_super v6 = v7;
  [v6 bytes];
  id v36 = v11;
  [v36 bytes];
  id v14 = v12;
  uint64_t v15 = [v14 mutableBytes];
  id v16 = v13;
  uint64_t v35 = [v16 mutableBytes];
  uint64_t v17 = CCCryptorGCMOneshotEncrypt();
  if (v17)
  {
    uint64_t v18 = v17;
    v19 = +[SKAPresenceEncryptionKey logger];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceEncryptionKey encryptPayload:](v18, v19, v20, v21, v22, v23, v24, v25);
    }

    id v26 = 0;
  }
  else
  {
    id v26 = objc_alloc_init(MEMORY[0x263EFF990]);
    objc_msgSend(v26, "appendData:", v6, v10, v15, v35, 16);
    [v26 appendData:v14];
    [v26 appendData:v16];
  }

LABEL_12:
  return v26;
}

- (id)decryptPayload:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] > 0x1C)
  {
    id v14 = objc_msgSend(v4, "subdataWithRange:", 0, 12);
    uint64_t v15 = [v4 length];
    uint64_t v16 = v15 - 16;
    uint64_t v17 = objc_msgSend(v4, "subdataWithRange:", 12, v15 - 28);
    uint64_t v18 = objc_msgSend(v4, "subdataWithRange:", v16, 16);
    [v14 length];
    v19 = [(SKAPresenceEncryptionKey *)self keyData];
    [v19 length];

    uint64_t v20 = [(SKAPresenceEncryptionKey *)self keyData];
    uint64_t v21 = [v17 length];
    id v22 = v17;
    uint64_t v39 = [v18 length];
    uint64_t v23 = [MEMORY[0x263EFF990] dataWithLength:v21];
    id v40 = v20;
    [v40 bytes];
    id v5 = v14;
    [v5 bytes];
    id v24 = v22;
    [v24 bytes];
    id v25 = v23;
    uint64_t v26 = [v25 mutableBytes];
    id v27 = v18;
    uint64_t v38 = [v27 bytes];
    uint64_t v28 = CCCryptorGCMOneshotDecrypt();
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = +[SKAPresenceEncryptionKey logger];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceEncryptionKey decryptPayload:](v29, v30, v31, v32, v33, v34, v35, v36);
      }

      id v13 = 0;
    }
    else
    {
      id v13 = v25;
    }
  }
  else
  {
    id v5 = +[SKAPresenceEncryptionKey logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceEncryptionKey decryptPayload:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
    id v13 = 0;
  }

  return v13;
}

- (NSData)keyMaterial
{
  v3 = [(SKAPresenceEncryptionKey *)self keyData];
  if (![v3 length])
  {
    uint64_t v6 = 0;
    goto LABEL_5;
  }
  id v4 = [(SKAPresenceEncryptionKey *)self keyData];
  uint64_t v5 = [v4 length];

  if (v5 == 32)
  {
    v3 = [(SKAPresenceEncryptionKey *)self keyData];
    uint64_t v6 = (void *)[v3 copy];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_7:
  return (NSData *)v6;
}

- (BOOL)_initializeNewKeyMaterial
{
  id v10 = 0;
  v3 = [(SKAPresenceEncryptionKey *)self _randomBytesWithLength:32 error:&v10];
  id v4 = v10;
  uint64_t v5 = (void *)MEMORY[0x263EFF8F8];
  id v6 = v3;
  uint64_t v7 = (NSData *)objc_msgSend(v5, "_newZeroingDataWithBytes:length:", objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  keyData = self->_keyData;
  self->_keyData = v7;

  return v4 == 0;
}

- (id)_randomBytesWithLength:(unint64_t)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:");
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t Bytes = CCRandomGenerateBytes((void *)[v6 mutableBytes], a3);
  if (Bytes)
  {
    uint64_t v8 = Bytes;
    uint64_t v9 = +[SKAPresenceEncryptionKey logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceEncryptionKey _randomBytesWithLength:error:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:0 code:-1000 userInfo:0];
    uint64_t v17 = v16;
    if (a4) {
      *a4 = v16;
    }

    id v18 = 0;
  }
  else
  {
    id v18 = v6;
  }

  return v18;
}

+ (id)logger
{
  if (logger_onceToken_15 != -1) {
    dispatch_once(&logger_onceToken_15, &__block_literal_global_15);
  }
  v2 = (void *)logger__logger_15;
  return v2;
}

uint64_t __34__SKAPresenceEncryptionKey_logger__block_invoke()
{
  logger__logger_15 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAPresenceEncryptionKey");
  return MEMORY[0x270F9A758]();
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithKeyMaterial:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encryptPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encryptPayload:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decryptPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decryptPayload:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_randomBytesWithLength:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end