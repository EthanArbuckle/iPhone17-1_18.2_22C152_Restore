@interface WBSPasswordBreachCryptographicOperations
+ (BOOL)isValidScryptHashWorkFactor:(unint64_t)a3 blockSizeR:(unint64_t)a4 parallelismFactorP:(unint64_t)a5;
- (WBSPasswordBreachCryptographicOperations)initWithConfiguration:(id)a3;
- (_CCECCryptor)_hashToCurve:(id)a3;
- (id)_blindPasswordHash:(id)a3;
- (id)_bucketIdentifierWithBitCount:(unint64_t)a3 ofData:(id)a4;
- (id)_encodePasswordForLowFrequencyBucket:(id)a3 withHashSmoothingBits:(unsigned __int8)a4;
- (id)_exportHashToCurve:(id)a3;
- (id)_exportKeyFromCryptor:(_CCECCryptor *)a3;
- (id)encodePasswordForHighFrequencyBucket:(id)a3;
- (id)encodePasswordForLowFrequencyBucket:(id)a3;
- (id)generateFakeEncodedPasswordForHighFrequencyBucket;
- (id)generateFakeEncodedPasswordForLowFrequencyBucket;
- (id)unblindHash:(id)a3;
- (void)dealloc;
- (void)generateFakeEncodedPasswordForHighFrequencyBucket;
@end

@implementation WBSPasswordBreachCryptographicOperations

- (WBSPasswordBreachCryptographicOperations)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordBreachCryptographicOperations;
  v6 = [(WBSPasswordBreachCryptographicOperations *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_blindingKeys = (cc_blinding_keys_ctx *)CCECCryptorGenerateBlindingKeys();
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  if (self->_blindingKeys) {
    CCECCryptorBlindingKeysRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordBreachCryptographicOperations;
  [(WBSPasswordBreachCryptographicOperations *)&v3 dealloc];
}

- (id)encodePasswordForHighFrequencyBucket:(id)a3
{
  v4 = [a3 dataUsingEncoding:4];
  id v5 = [(WBSPasswordBreachConfiguration *)self->_configuration highFrequencyBucketHashSalt];
  v6 = [v5 dataUsingEncoding:4];

  v7 = objc_msgSend(v4, "safari_scryptHashWithSalt:N:r:p:keyLength:", v6, -[WBSPasswordBreachConfiguration highFrequencyBucketHashWorkFactor](self->_configuration, "highFrequencyBucketHashWorkFactor"), -[WBSPasswordBreachConfiguration highFrequencyBucketScryptBlockSizeR](self->_configuration, "highFrequencyBucketScryptBlockSizeR"), -[WBSPasswordBreachConfiguration highFrequencyBucketScryptParallelismFactorP](self->_configuration, "highFrequencyBucketScryptParallelismFactorP"), 32);

  return v7;
}

- (id)_bucketIdentifierWithBitCount:(unint64_t)a3 ofData:(id)a4
{
  unsigned int v9 = 0;
  [a4 getBytes:&v9 length:4];
  uint64_t v5 = bswap32(v9) >> -(char)a3;
  unsigned int v9 = v5;
  unint64_t v6 = a3 >> 2;
  if ((a3 & 3) != 0) {
    unint64_t v6 = (v6 + 1);
  }
  else {
    unint64_t v6 = v6;
  }
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%0*x", v6, v5);
  return v7;
}

- (id)_encodePasswordForLowFrequencyBucket:(id)a3 withHashSmoothingBits:(unsigned __int8)a4
{
  unsigned __int8 v13 = a4;
  uint64_t v5 = [a3 dataUsingEncoding:4];
  unint64_t v6 = (void *)[v5 mutableCopy];

  [v6 appendBytes:&v13 length:1];
  v7 = [(WBSPasswordBreachConfiguration *)self->_configuration lowFrequencyBucketHashSalt];
  v8 = [v7 dataUsingEncoding:4];

  unsigned int v9 = objc_msgSend(v6, "safari_scryptHashWithSalt:N:r:p:keyLength:", v8, -[WBSPasswordBreachConfiguration lowFrequencyBucketHashWorkFactor](self->_configuration, "lowFrequencyBucketHashWorkFactor"), -[WBSPasswordBreachConfiguration lowFrequencyBucketScryptBlockSizeR](self->_configuration, "lowFrequencyBucketScryptBlockSizeR"), -[WBSPasswordBreachConfiguration lowFrequencyBucketScryptParallelismFactorP](self->_configuration, "lowFrequencyBucketScryptParallelismFactorP"), 32);
  objc_super v10 = [(WBSPasswordBreachCryptographicOperations *)self _bucketIdentifierWithBitCount:[(WBSPasswordBreachConfiguration *)self->_configuration lowFrequencyBucketIdentifierBitCount] ofData:v9];
  v11 = [[WBSPair alloc] initWithFirst:v10 second:v9];

  return v11;
}

- (id)encodePasswordForLowFrequencyBucket:(id)a3
{
  v4 = [(WBSPasswordBreachCryptographicOperations *)self _encodePasswordForLowFrequencyBucket:a3 withHashSmoothingBits:0];
  uint64_t v5 = [WBSPair alloc];
  unint64_t v6 = [v4 first];
  v7 = [v4 second];
  v8 = [(WBSPasswordBreachCryptographicOperations *)self _blindPasswordHash:v7];
  unsigned int v9 = [(WBSPair *)v5 initWithFirst:v6 second:v8];

  return v9;
}

- (id)_exportKeyFromCryptor:(_CCECCryptor *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = CCECCryptorExportKey();
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[WBSPasswordBreachCryptographicOperations _exportKeyFromCryptor:](v4, v5);
    }
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:256];
  }
  return v6;
}

- (id)_exportHashToCurve:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v5 = objc_alloc_init(WBSScopeExitHandler);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__WBSPasswordBreachCryptographicOperations__exportHashToCurve___block_invoke;
  v9[3] = &unk_1E6159628;
  v9[4] = &v10;
  [(WBSScopeExitHandler *)v5 setHandler:v9];
  unint64_t v6 = [(WBSPasswordBreachCryptographicOperations *)self _hashToCurve:v4];
  v11[3] = (uint64_t)v6;
  if (v6)
  {
    v7 = [(WBSPasswordBreachCryptographicOperations *)self _exportKeyFromCryptor:v6];
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __63__WBSPasswordBreachCryptographicOperations__exportHashToCurve___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result) {
    JUMPOUT(0x1BA9BC110);
  }
  return result;
}

- (_CCECCryptor)_hashToCurve:(id)a3
{
  id v3 = a3;
  id v4 = [@"P256-SHA256-SSWU-RO-PBAv1" dataUsingEncoding:4];
  [v4 length];
  id v5 = v4;
  [v5 bytes];
  [v3 length];
  id v6 = v3;
  [v6 bytes];

  v7 = (_CCECCryptor *)CCECCryptorH2C();
  if (!v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[WBSPasswordBreachCryptographicOperations _hashToCurve:](v8);
    }
  }

  return v7;
}

- (id)_blindPasswordHash:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = objc_alloc_init(WBSScopeExitHandler);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__WBSPasswordBreachCryptographicOperations__blindPasswordHash___block_invoke;
  v11[3] = &unk_1E615C008;
  v11[4] = &v16;
  v11[5] = &v12;
  [(WBSScopeExitHandler *)v5 setHandler:v11];
  id v6 = [(WBSPasswordBreachCryptographicOperations *)self _hashToCurve:v4];
  v17[3] = (uint64_t)v6;
  if (v6)
  {
    uint64_t v7 = CCECCryptorBlind();
    v13[3] = v7;
    if (v7)
    {
      v8 = [(WBSPasswordBreachCryptographicOperations *)self _exportKeyFromCryptor:v7];
      goto LABEL_7;
    }
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[WBSPasswordBreachCryptographicOperations _blindPasswordHash:](v9);
    }
  }
  v8 = 0;
LABEL_7:

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

uint64_t __63__WBSPasswordBreachCryptographicOperations__blindPasswordHash___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    MEMORY[0x1BA9BC110]();
  }
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (result)
  {
    JUMPOUT(0x1BA9BC110);
  }
  return result;
}

- (id)unblindHash:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v5 = objc_alloc_init(WBSScopeExitHandler);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__WBSPasswordBreachCryptographicOperations_unblindHash___block_invoke;
  v13[3] = &unk_1E615C008;
  v13[4] = v18;
  v13[5] = &v14;
  [(WBSScopeExitHandler *)v5 setHandler:v13];
  id v6 = v4;
  [v6 bytes];
  [v6 length];
  int v7 = CCECCryptorImportKey();
  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachCryptographicOperations unblindHash:](v7, v8);
    }
LABEL_4:
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = CCECCryptorUnblind();
  v15[3] = v10;
  if (!v10)
  {
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachCryptographicOperations unblindHash:](v12);
    }
    goto LABEL_4;
  }
  uint64_t v9 = [(WBSPasswordBreachCryptographicOperations *)self _exportKeyFromCryptor:v10];
LABEL_7:

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);

  return v9;
}

uint64_t __56__WBSPasswordBreachCryptographicOperations_unblindHash___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    MEMORY[0x1BA9BC110]();
  }
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (result)
  {
    JUMPOUT(0x1BA9BC110);
  }
  return result;
}

+ (BOOL)isValidScryptHashWorkFactor:(unint64_t)a3 blockSizeR:(unint64_t)a4 parallelismFactorP:(unint64_t)a5
{
  return ccscrypt_storage_size() > 0;
}

- (id)generateFakeEncodedPasswordForHighFrequencyBucket
{
  v9[1] = *MEMORY[0x1E4F143B8];
  size_t v2 = [(WBSPasswordBreachConfiguration *)self->_configuration fakePasswordLengthBytes];
  id v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v4 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], v2, v3);
  if (v4)
  {
    int v5 = v4;
    id v6 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(WBSPasswordBreachCryptographicOperations *)v5 generateFakeEncodedPasswordForHighFrequencyBucket];
    }
    int v7 = 0;
  }
  else
  {
    int v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:v2];
  }
  return v7;
}

- (id)generateFakeEncodedPasswordForLowFrequencyBucket
{
  id v3 = [(WBSPasswordBreachCryptographicOperations *)self generateFakeEncodedPasswordForHighFrequencyBucket];
  if (v3)
  {
    int v4 = [(WBSPasswordBreachCryptographicOperations *)self _bucketIdentifierWithBitCount:[(WBSPasswordBreachConfiguration *)self->_configuration lowFrequencyBucketIdentifierBitCount] ofData:v3];
    int v5 = [(WBSPasswordBreachCryptographicOperations *)self _blindPasswordHash:v3];
    if (v5) {
      id v6 = [[WBSPair alloc] initWithFirst:v4 second:v5];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)_exportKeyFromCryptor:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1B728F000, a2, OS_LOG_TYPE_FAULT, "Failed to export key. CCECCryptorExportKey returned status %{public}d", (uint8_t *)v2, 8u);
}

- (void)_hashToCurve:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B728F000, log, OS_LOG_TYPE_FAULT, "Failed to map password to curve.", v1, 2u);
}

- (void)_blindPasswordHash:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B728F000, log, OS_LOG_TYPE_FAULT, "Failed to blind hash.", v1, 2u);
}

- (void)unblindHash:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to unblind server blinded hash.", v1, 2u);
}

- (void)unblindHash:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Failed to import server blinded key. CCECCryptorImportKey returned status %{public}d", (uint8_t *)v2, 8u);
}

- (void)generateFakeEncodedPasswordForHighFrequencyBucket
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Failed to generate random bytes for fake password: %d.", (uint8_t *)v2, 8u);
}

@end