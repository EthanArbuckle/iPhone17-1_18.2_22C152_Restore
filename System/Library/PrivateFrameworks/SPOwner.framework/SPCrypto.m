@interface SPCrypto
+ (_CCECCryptor)diversifyKey:(id)a3 entropyData:(id)a4;
+ (_CCECCryptor)importKey:(id)a3 fromFormat:(unsigned int)a4;
+ (id)antiTrackingKeyFromSharedSecretKey:(id)a3;
+ (id)compactKey:(id)a3;
+ (id)deriveKeyWithKeyData:(id)a3 sharedData:(id)a4 keyLength:(unint64_t)a5;
+ (id)deriveWithPublicKey:(id)a3 sharedSecretKey:(id *)a4;
+ (id)exportKey:(_CCECCryptor *)a3 toFormat:(unsigned int)a4;
+ (id)ratchetSharedSecretKey:(id)a3 ratchetCount:(unint64_t)a4;
+ (void)generateTokensWithPublicKey:(id)a3 sharedSecretKey:(id)a4 initialRatchetsToSkip:(unint64_t)a5 ratchetStep:(id)a6;
@end

@implementation SPCrypto

+ (void)generateTokensWithPublicKey:(id)a3 sharedSecretKey:(id)a4 initialRatchetsToSkip:(unint64_t)a5 ratchetStep:(id)a6
{
  id v9 = a3;
  v10 = (void (**)(id, id, void *, unsigned char *))a6;
  char v15 = 0;
  id v11 = +[SPCrypto ratchetSharedSecretKey:a4 ratchetCount:a5];
  do
  {
    v12 = v11;
    id v14 = v11;
    v13 = +[SPCrypto deriveWithPublicKey:v9 sharedSecretKey:&v14];
    id v11 = v14;

    v10[2](v10, v11, v13, &v15);
  }
  while (!v15);
}

+ (id)compactKey:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 57
    && (v4 = +[SPCrypto importKey:v3 fromFormat:0]) != 0)
  {
    v5 = v4;
    v6 = +[SPCrypto exportKey:v4 toFormat:2];
    MEMORY[0x1B3EB4460](v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (_CCECCryptor)importKey:(id)a3 fromFormat:(unsigned int)a4
{
  id v4 = a3;
  [v4 bytes];
  [v4 length];

  uint64_t v5 = CCECCryptorImportKey();
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  v7 = LogCategory_Crypto();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[SPCrypto importKey:fromFormat:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return 0;
}

+ (id)exportKey:(_CCECCryptor *)a3 toFormat:(unsigned int)a4
{
  id v4 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:57];
  [v4 mutableBytes];
  uint64_t v5 = CCECCryptorExportKey();
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = LogCategory_Crypto();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SPCrypto exportKey:toFormat:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    id v14 = 0;
  }
  else
  {
    v7 = objc_msgSend(v4, "subdataWithRange:", 0, 57);
    id v14 = [v7 copy];
  }

  return v14;
}

+ (_CCECCryptor)diversifyKey:(id)a3 entropyData:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[SPCrypto importKey:a3 fromFormat:0];
  if (v6)
  {
    id v7 = (id) [v5 mutableCopy];
    [v7 mutableBytes];
    [v7 length];
    uint64_t v8 = CCECCryptorTwinDiversifyKey();
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = LogCategory_Crypto();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[SPCrypto diversifyKey:entropyData:](v9, v10, v11, v12, v13, v14, v15, v16);
      }

      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

+ (id)antiTrackingKeyFromSharedSecretKey:(id)a3
{
  id v3 = a3;
  id v4 = [@"diversify" dataUsingEncoding:4];
  id v5 = +[SPCrypto deriveKeyWithKeyData:v3 sharedData:v4 keyLength:72];

  return v5;
}

+ (id)deriveKeyWithKeyData:(id)a3 sharedData:(id)a4 keyLength:(unint64_t)a5
{
  id v7 = a3;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v9 = a4;
  uint64_t v10 = (void *)[[v8 alloc] initWithLength:a5];
  id v11 = v9;
  [v11 bytes];
  [v11 length];

  id v12 = 0;
  if (!CCKDFParametersCreateAnsiX963())
  {
    id v13 = v7;
    [v13 bytes];
    [v13 length];
    id v14 = v10;
    [v14 mutableBytes];
    [v14 length];
    if (CCDeriveKey()) {
      id v12 = 0;
    }
    else {
      id v12 = v14;
    }
  }

  return v12;
}

+ (id)ratchetSharedSecretKey:(id)a3 ratchetCount:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [@"update" dataUsingEncoding:4];
  id v7 = v5;
  if (a4)
  {
    id v7 = v5;
    do
    {
      uint64_t v8 = (void *)MEMORY[0x1B3EB48A0]();
      id v9 = +[SPCrypto deriveKeyWithKeyData:v7 sharedData:v6 keyLength:32];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v7;
        id v7 = v9;
      }
      else
      {
        id v11 = LogCategory_Crypto();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          +[SPCrypto ratchetSharedSecretKey:ratchetCount:](&v13, v14, v11);
        }
      }

      --a4;
    }
    while (a4);
  }

  return v7;
}

+ (id)deriveWithPublicKey:(id)a3 sharedSecretKey:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[SPCrypto ratchetSharedSecretKey:*a4 ratchetCount:1];
  id v7 = +[SPCrypto antiTrackingKeyFromSharedSecretKey:v6];
  if (v7
    && (uint64_t v8 = +[SPCrypto diversifyKey:v5 entropyData:v7]) != 0)
  {
    id v9 = v8;
    uint64_t v10 = +[SPCrypto exportKey:v8 toFormat:0];
    MEMORY[0x1B3EB4460](v9);
    *a4 = v6;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (void)importKey:(uint64_t)a3 fromFormat:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)exportKey:(uint64_t)a3 toFormat:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)diversifyKey:(uint64_t)a3 entropyData:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)ratchetSharedSecretKey:(os_log_t)log ratchetCount:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B2FD8000, log, OS_LOG_TYPE_ERROR, "deriveKeyWithKeyData returned nil!", buf, 2u);
}

@end