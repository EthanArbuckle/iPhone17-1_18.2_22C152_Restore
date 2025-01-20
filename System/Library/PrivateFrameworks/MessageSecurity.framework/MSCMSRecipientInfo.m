@interface MSCMSRecipientInfo
+ (id)decodeKeyAgreeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
+ (id)decodeKeyTransRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
+ (id)decodeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (BOOL)encodeKeyAgreeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5;
- (BOOL)encodeKeyTransRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5;
- (BOOL)encodeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5;
- (MSAlgorithmIdentifier)keyEncryptionAlgorithm;
- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3;
- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 algorithmCapabilities:(id)a4;
- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 keyEncryptionAlgorithm:(id)a4 keyWrapAlgorithm:(id)a5;
- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 legacyKeyWrapAlgorithm:(BOOL)a4;
- (MSCMSRecipientInfo)initWithEmail:(id)a3;
- (MSCMSRecipientInfo)initWithEmail:(id)a3 algorithmCapabilities:(id)a4;
- (MSCMSRecipientInfo)initWithEmail:(id)a3 keyEncryptionAlgorithm:(id)a4;
- (NSArray)algorithmCapabilities;
- (NSArray)encryptedKeys;
- (NSArray)recipientCertificates;
- (NSData)originatorPubKey;
- (NSData)userKeyingMaterial;
- (NSNumber)version;
- (__CFData)createSecCMSSharedInfo:(id)a3;
- (__CFData)createSharedInfo:(id)a3;
- (__CFData)keyEncryptionKey:(id)a3 forEncryption:(BOOL)a4 secCMSCompatibility:(BOOL)a5;
- (__SecCertificate)originator;
- (__SecCertificate)recipientCertificate;
- (__SecIdentity)originatorIdentity;
- (id)decryptWrappedKey:(id)a3 kek:(id)a4 iv:(heim_base_data *)a5;
- (id)encryptBulkKey:(id)a3;
- (id)key;
- (id)key:(BOOL)a3;
- (void)dealloc;
- (void)freeKeyTransRecipientInfo:(const RecipientInfo *)a3;
- (void)freeRecipientInfo:(const RecipientInfo *)a3;
- (void)setAlgorithmCapabilities:(id)a3;
- (void)setEncryptedKeys:(id)a3;
- (void)setKeyEncryptionAlgorithm:(id)a3;
- (void)setOriginator:(__SecCertificate *)a3;
- (void)setOriginatorIdentity:(__SecIdentity *)a3;
- (void)setOriginatorPubKey:(id)a3;
- (void)setRecipientCertificate:(__SecCertificate *)a3;
- (void)setRecipientCertificates:(id)a3;
- (void)setUserKeyingMaterial:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MSCMSRecipientInfo

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 keyEncryptionAlgorithm:(id)a4 keyWrapAlgorithm:(id)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v60.receiver = self;
  v60.super_class = (Class)MSCMSRecipientInfo;
  v10 = [(MSCMSRecipientInfo *)&v60 init];
  v11 = v10;
  v12 = 0;
  if (!a3 || !v10) {
    goto LABEL_54;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v13 addObject:a3];
  objc_storeStrong((id *)&v11->_recipientCertificates, v13);
  uint64_t KeyTypeForCertificate = getKeyTypeForCertificate(a3);
  if (KeyTypeForCertificate != 3)
  {
    if (KeyTypeForCertificate != 1)
    {
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_29);
      }
      v21 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[MSCMSRecipientInfo initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:]";
        _os_log_impl(&dword_20D8A1000, v21, OS_LOG_TYPE_ERROR, "MSCMSRecipientInfo %s: Unsupported certificate key type", buf, 0xCu);
      }
      v12 = 0;
      goto LABEL_53;
    }
    if (initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken != -1) {
      dispatch_once(&initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken, &__block_literal_global_0);
    }
    if (v8)
    {
      v15 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs;
      v16 = [v8 OIDString];
      LODWORD(v15) = [v15 containsObject:v16];

      if (v15)
      {
        uint64_t v17 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:v8];
        keyEncryptionAlgorithm = (MSOID *)v11->_keyEncryptionAlgorithm;
        v11->_keyEncryptionAlgorithm = (MSAlgorithmIdentifier *)v17;
LABEL_52:

        v12 = v11;
LABEL_53:

LABEL_54:
        return v12;
      }
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6_0);
      }
      v22 = (void *)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        v24 = [v8 OIDString];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 1;
        _os_log_impl(&dword_20D8A1000, v23, OS_LOG_TYPE_DEFAULT, "MSCMSRecipientInfo init encryption algorithm %@ not permitted for certificate key type %ld", buf, 0x16u);
      }
    }
    v25 = [(id)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs allObjects];
    keyEncryptionAlgorithm = [v25 objectAtIndex:0];

    v26 = [[MSOID alloc] initWithString:keyEncryptionAlgorithm error:0];
    uint64_t v27 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:v26];
    v28 = v11->_keyEncryptionAlgorithm;
    v11->_keyEncryptionAlgorithm = (MSAlgorithmIdentifier *)v27;

LABEL_51:
    goto LABEL_52;
  }
  if (initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken_9 != -1) {
    dispatch_once(&initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken_9, &__block_literal_global_12);
  }
  if (v8)
  {
    v19 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs;
    v20 = [v8 OIDString];
    LODWORD(v19) = [v19 containsObject:v20];

    if (v19)
    {
      keyEncryptionAlgorithm = (MSOID *)v8;
      if (!v9) {
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_15_0);
    }
    v29 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      v31 = [v8 OIDString];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 3;
      _os_log_impl(&dword_20D8A1000, v30, OS_LOG_TYPE_DEFAULT, "MSCMSRecipientInfo init encryption algorithm %@ not permitted for certificate key type %ld", buf, 0x16u);
    }
  }
  v32 = [(id)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs allObjects];
  v33 = [v32 objectAtIndex:0];

  keyEncryptionAlgorithm = [[MSOID alloc] initWithString:v33 error:0];
  if (!v9)
  {
LABEL_31:
    id v9 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.45" error:0];
  }
LABEL_32:
  if (([v9 isEqualToString:@"2.16.840.1.101.3.4.1.42"] & 1) == 0
    && ([v9 isEqualToString:@"2.16.840.1.101.3.4.1.22"] & 1) == 0
    && ([v9 isEqualToString:@"2.16.840.1.101.3.4.1.2"] & 1) == 0
    && ([v9 isEqualToString:@"1.2.840.113549.3.7"] & 1) == 0
    && ![v9 isEqualToString:@"1.2.840.113549.3.2"])
  {
    v26 = 0;
    goto LABEL_44;
  }
  v34 = [[MSAlgorithmIdentifier alloc] initWithOID:v9];
  size_t v35 = [(MSAlgorithmIdentifier *)v34 blockSize:0];

  v36 = malloc_type_malloc(v35, 0x16BC6297uLL);
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], v35, v36);
  *(void *)buf = v35;
  *(void *)&buf[8] = v36;
  uint64_t v59 = 0;
  uint64_t v37 = length_DataContent((uint64_t)buf);
  v38 = [MEMORY[0x263EFF990] dataWithLength:v37];
  if (v38)
  {
    v26 = v38;
    int v39 = encode_DataContent([(MSOID *)v26 mutableBytes] + v37 - 1, v37, (uint64_t)buf, (uint64_t)&v59);
    if (!v39)
    {
      if (v37 != v59) {
        goto LABEL_56;
      }
      goto LABEL_43;
    }
    int v40 = v39;

    uint64_t v41 = v40;
  }
  else
  {
    uint64_t v41 = 12;
  }
  v42 = (void *)MEMORY[0x263F087E8];
  uint64_t v63 = *MEMORY[0x263F08320];
  v64 = @"Failed encoding type DataContent";
  v43 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v44 = [v42 errorWithDomain:@"com.apple.HeimASN1" code:v41 userInfo:v43];

  v26 = 0;
LABEL_43:
  free(v36);
LABEL_44:
  v45 = [[MSAlgorithmIdentifier alloc] initWithOID:v9 parameters:v26];
  *(void *)buf = 0;
  uint64_t v46 = length_AlgorithmIdentifier((uint64_t)[(MSAlgorithmIdentifier *)v45 asn1AlgId]);
  v47 = [MEMORY[0x263EFF990] dataWithLength:v46];
  if (!v47)
  {
    uint64_t v51 = 12;
    goto LABEL_48;
  }
  id v48 = v47;
  int v49 = encode_AlgorithmIdentifier([v48 mutableBytes] + v46 - 1, v46, (uint64_t)-[MSAlgorithmIdentifier asn1AlgId](v45, "asn1AlgId"), (uint64_t)buf);
  if (v49)
  {
    int v50 = v49;

    uint64_t v51 = v50;
LABEL_48:
    v52 = (void *)MEMORY[0x263F087E8];
    uint64_t v61 = *MEMORY[0x263F08320];
    v62 = @"Failed encoding type AlgorithmIdentifier";
    v53 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v54 = [v52 errorWithDomain:@"com.apple.HeimASN1" code:v51 userInfo:v53];

    id v48 = 0;
LABEL_50:
    v55 = [[MSAlgorithmIdentifier alloc] initWithOID:keyEncryptionAlgorithm parameters:v48];
    v56 = v11->_keyEncryptionAlgorithm;
    v11->_keyEncryptionAlgorithm = v55;

    goto LABEL_51;
  }
  if (v46 == *(void *)buf) {
    goto LABEL_50;
  }
LABEL_56:
  uint64_t v58 = asn1_abort();
  return (MSCMSRecipientInfo *)findBestMutuallySupportedSignatureAlgorithm(v58);
}

- (void)setOriginator:(__SecCertificate *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  self->_originator = a3;
}

- (void)setOriginatorIdentity:(__SecIdentity *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  self->_originatorIdentity = a3;
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3
{
  return [(MSCMSRecipientInfo *)self initWithCertificate:a3 keyEncryptionAlgorithm:0 keyWrapAlgorithm:0];
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 legacyKeyWrapAlgorithm:(BOOL)a4
{
  if (a4)
  {
    v6 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.1.42" error:0];
  }
  else
  {
    v6 = 0;
  }
  v7 = [(MSCMSRecipientInfo *)self initWithCertificate:a3 keyEncryptionAlgorithm:0 keyWrapAlgorithm:v6];

  return v7;
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 algorithmCapabilities:(id)a4
{
  id v6 = a4;
  v7 = findBestMutuallySupportedKeyEncryptionAlgorithm(v6);
  id v8 = [(MSCMSRecipientInfo *)self initWithCertificate:a3 keyEncryptionAlgorithm:0 keyWrapAlgorithm:v7];
  id v9 = v8;
  if (v8) {
    [(MSCMSRecipientInfo *)v8 setAlgorithmCapabilities:v6];
  }

  return v9;
}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"1.2.840.113549.1.1.1";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs;
  initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs = v2;
}

uint64_t __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_2()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_10()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"1.3.133.16.840.63.0.2";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs;
  initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs = v2;
}

uint64_t __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_2_13()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_27()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

- (MSCMSRecipientInfo)initWithEmail:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MSCMSRecipientInfo;
  v5 = [(MSCMSRecipientInfo *)&v7 init];
  if (v5) {
    v5 = [(MSCMSRecipientInfo *)v5 initWithCertificate:findCertificateByEmailAddress(v4, 0, 0)];
  }

  return v5;
}

- (MSCMSRecipientInfo)initWithEmail:(id)a3 algorithmCapabilities:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = findBestMutuallySupportedKeyEncryptionAlgorithm(v6);
  id v9 = [(MSCMSRecipientInfo *)self initWithEmail:v7 keyEncryptionAlgorithm:v8];

  v10 = v9;
  v11 = v10;
  if (v10) {
    [(MSCMSRecipientInfo *)v10 setAlgorithmCapabilities:v6];
  }

  return v11;
}

- (MSCMSRecipientInfo)initWithEmail:(id)a3 keyEncryptionAlgorithm:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MSCMSRecipientInfo;

  return 0;
}

- (BOOL)encodeKeyTransRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5
{
  id v8 = a3;
  if (a5 && *a5) {
    id v9 = (id)[*a5 copy];
  }
  else {
    id v9 = 0;
  }
  v10 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm algorithm];
  int v11 = [v10 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (!v11)
  {
    v15 = 0;
    id v19 = 0;
    v18 = 0;
    BOOL v12 = 0;
    goto LABEL_14;
  }
  BOOL v12 = a4 != 0;
  if (!a4)
  {
    uint64_t v30 = +[MSError MSErrorWithDomain:MSErrorAllocationDomain[0] code:-50 underlyingError:v9 description:@"Unable to encode RecipientInfo: missing destination address"];

    v15 = 0;
    id v19 = 0;
    v18 = 0;
    id v9 = (id)v30;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  *(_OWORD *)&a4->var1.var1.var3.var0.components = 0u;
  a4->var1.var1.var4 = 0u;
  a4->var1.var1.var1.var1.var2.unint64_t var1 = 0u;
  *(_OWORD *)&a4->var1.var1.var2 = 0u;
  *(_OWORD *)&a4->var1.var1.var1.var0 = 0u;
  *(_OWORD *)&a4->var1.var1.var1.var1.var2.var0.var0.components = 0u;
  *(_OWORD *)&a4->var0 = 0u;
  a4->var0 = 1;
  id v13 = [(NSArray *)self->_recipientCertificates objectAtIndex:0];
  v14 = [MSCMSIdentifier alloc];
  v15 = SecCertificateGetSubjectKeyID();
  if (v15)
  {
    a4->var1.var0.var0 = 2;
    v16 = [NSNumber numberWithInteger:2];
    version = self->_version;
    self->_version = v16;

    v18 = [[MSCMSIdentifier alloc] initWithSkid:v15];
  }
  else
  {
    a4->var1.var0.var0 = 0;
    v20 = [NSNumber numberWithInteger:0];
    v21 = self->_version;
    self->_version = v20;

    id v31 = v8;
    CFDataRef v22 = SecCertificateCopySerialNumberData(v13, 0);
    v23 = (void *)SecCertificateCopyIssuerSequence();
    v18 = [[MSCMSIdentifier alloc] initWithIssuerName:v23 serialNumber:v22];

    v14 = (MSCMSIdentifier *)v22;
    id v8 = v31;
  }

  id v32 = v9;
  v24 = [(MSCMSIdentifier *)v18 encodeMessageSecurityObject:&v32];
  id v25 = v32;

  v26 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm asn1AlgId];
  unint64_t var1 = (unint64_t)v26->var1;
  *(heim_oid *)&a4->var1.var1.var1.var1.var2.var0.var0.components = v26->var0;
  a4->var1.var1.var1.var1.var2.var1.var0 = var1;
  id v28 = v8;
  a4->var1.var0.var3.unint64_t var1 = (void *)[v28 bytes];
  a4->var1.var0.var3.var0 = [v28 length];
  id v19 = v24;
  a4->var1.var1.var1.var1.var0.var0.var0 = [v19 bytes];
  a4->var1.var0.var1.var0 = [v19 length];
  id v9 = v25;
  if (a5)
  {
LABEL_12:
    if (v9)
    {
      id v9 = v9;
      *a5 = v9;
    }
  }
LABEL_14:

  return v12;
}

- (BOOL)encodeKeyAgreeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5
{
  id v8 = a3;
  if (a5 && *a5) {
    id v9 = (id)[*a5 copy];
  }
  else {
    id v9 = 0;
  }
  v10 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm algorithm];
  int v11 = [v10 isEqualToString:@"1.3.133.16.840.63.0.2"];

  if (!v11)
  {
    uint64_t v17 = 0;
    CFDataRef v18 = 0;
    id v19 = 0;
    id v20 = 0;
    a4 = 0;
    CFDataRef v16 = 0;
    BOOL v21 = 0;
    goto LABEL_20;
  }
  BOOL v31 = a4 != 0;
  id v32 = v8;
  if (a4)
  {
    *(_OWORD *)&a4->var1.var1.var3.var0.components = 0u;
    a4->var1.var1.var4 = 0u;
    a4->var1.var1.var1.var1.var2.unint64_t var1 = 0u;
    *(_OWORD *)&a4->var1.var1.var2 = 0u;
    *(_OWORD *)&a4->var1.var1.var1.var0 = 0u;
    *(_OWORD *)&a4->var1.var1.var1.var1.var2.var0.var0.components = 0u;
    *(_OWORD *)&a4->var0 = 0u;
    a4->var0 = 2;
    a4->var1.var0.var0 = 3;
    originator = self->_originator;
    originatorIdentity = self->_originatorIdentity;
    if (originatorIdentity)
    {
      if (originator)
      {
        self->_originator = 0;
        CFRelease(originator);
        originatorIdentity = self->_originatorIdentity;
      }
      id v34 = v9;
      originator = MSSecIdentityCopyCertificateWithError(originatorIdentity, &v34);
      id v14 = v34;

      self->_originator = originator;
      id v9 = v14;
    }
    if (originator)
    {
      a4->var1.var1.var1.var0 = 1;
      v15 = (void *)SecCertificateCopyIssuerSequence();
      a4->var1.var1.var1.var1.var0.var0.var0 = [v15 length];
      uint64_t v30 = v15;
      a4->var1.var0.var2.var0.length = [(RecipientInfo *)v30 bytes];
      CFDataRef v16 = SecCertificateCopySerialNumberData(self->_originator, 0);
      a4->var1.var1.var1.var1.var2.var1.var0 = [(__CFData *)v16 bytes];
      a4->var1.var1.var1.var1.var0.var1.var0 = [(__CFData *)v16 length];
      a4->var1.var1.var1.var1.var0.var1.var2 = 0;
    }
    else
    {
      uint64_t v30 = 0;
      CFDataRef v16 = 0;
    }
    a4->var1.var0.var3.unint64_t var1 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
    *(void *)a4->var1.var0.var3.unint64_t var1 = [(NSData *)self->_userKeyingMaterial length];
    *((void *)a4->var1.var0.var3.var1 + 1) = [(NSData *)self->_userKeyingMaterial bytes];
    CFDataRef v22 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm asn1AlgId];
    unint64_t var1 = v22->var1;
    a4->var1.var1.var3.var0 = v22->var0;
    a4->var1.var1.var3.unint64_t var1 = var1;
    a4->var1.var1.var4.var0 = 1;
    v24 = (RecipientEncryptedKey *)malloc_type_malloc(0x20uLL, 0x10800403AF1B36BuLL);
    CFDataRef v18 = SecCertificateCopySerialNumberData((SecCertificateRef)[(NSArray *)self->_recipientCertificates objectAtIndex:0], 0);
    id v19 = (void *)SecCertificateCopyIssuerSequence();
    uint64_t v17 = [[MSCMSIdentifier alloc] initWithIssuerName:v19 serialNumber:v18];
    id v33 = v9;
    id v25 = [(MSCMSIdentifier *)v17 encodeMessageSecurityObject:&v33];
    id v26 = v33;

    id v20 = v25;
    *((void *)v24 + 1) = [v20 bytes];
    *(void *)v24 = [v20 length];
    id v27 = v32;
    *((void *)v24 + 3) = [v27 bytes];
    *((void *)v24 + 2) = [v27 length];
    a4->var1.var1.var4.unint64_t var1 = v24;
    id v9 = v26;
    a4 = v30;
    if (a5) {
      goto LABEL_16;
    }
LABEL_19:
    id v8 = v32;
    BOOL v21 = v31;
    goto LABEL_20;
  }
  uint64_t v28 = +[MSError MSErrorWithDomain:MSErrorAllocationDomain[0] code:-50 underlyingError:v9 description:@"Unable to encode RecipientInfo: missing destination address"];

  uint64_t v17 = 0;
  CFDataRef v18 = 0;
  id v19 = 0;
  id v20 = 0;
  CFDataRef v16 = 0;
  id v9 = (id)v28;
  if (!a5) {
    goto LABEL_19;
  }
LABEL_16:
  id v8 = v32;
  BOOL v21 = v31;
  if (v9)
  {
    id v9 = v9;
    *a5 = v9;
  }
LABEL_20:

  return v21;
}

- (void)freeKeyTransRecipientInfo:(const RecipientInfo *)a3
{
  free(a3->var1.var0.var3.var1);
  unint64_t var1 = a3->var1.var1.var4.var1;

  free(var1);
}

- (BOOL)encodeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm algorithm];
  int v10 = [v9 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (v10)
  {
    BOOL v11 = [(MSCMSRecipientInfo *)self encodeKeyTransRecipientInfo:v8 recipientInfo:a4 error:a5];
  }
  else
  {
    BOOL v12 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm algorithm];
    int v13 = [v12 isEqualToString:@"1.3.133.16.840.63.0.2"];

    if (!v13)
    {
      BOOL v14 = 0;
      goto LABEL_7;
    }
    BOOL v11 = [(MSCMSRecipientInfo *)self encodeKeyAgreeRecipientInfo:v8 recipientInfo:a4 error:a5];
  }
  BOOL v14 = v11;
LABEL_7:

  return v14;
}

- (void)freeRecipientInfo:(const RecipientInfo *)a3
{
  objc_super v5 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm algorithm];
  int v6 = [v5 isEqualToString:@"1.3.133.16.840.63.0.2"];

  if (v6)
  {
    [(MSCMSRecipientInfo *)self freeKeyTransRecipientInfo:a3];
  }
}

- (id)encryptBulkKey:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  uint64_t v52 = 0;
  iv = 0;
  CCCryptorRef cryptorRef = 0;
  objc_super v5 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm algorithm];
  int v6 = [v5 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (v6)
  {
    recipientCertificates = self->_recipientCertificates;
    if (recipientCertificates)
    {
      if ([(NSArray *)recipientCertificates count])
      {
        id v8 = SecCertificateCopyKey((SecCertificateRef)[(NSArray *)self->_recipientCertificates objectAtIndex:0]);
        if (v8)
        {
          CFDataRef EncryptedData = SecKeyCreateEncryptedData(v8, (SecKeyAlgorithm)*MEMORY[0x263F17350], v4, 0);
          int v10 = 0;
          goto LABEL_22;
        }
      }
    }
    goto LABEL_20;
  }
  BOOL v11 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm algorithm];
  int v12 = [v11 isEqualToString:@"1.3.133.16.840.63.0.2"];

  if (!v12
    || (int v13 = [MSAlgorithmIdentifier alloc],
        [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm parameters],
        BOOL v14 = objc_claimAutoreleasedReturnValue(),
        [(MSAlgorithmIdentifier *)v13 decode:v14 error:0],
        v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v15))
  {
LABEL_20:
    int v10 = 0;
    goto LABEL_21;
  }
  id v16 = [v15 parameters];

  if (v16)
  {
    uint64_t v17 = [v15 parameters];
    id v16 = v17;
    if (!v17
      || ![v17 length]
      || (size_t dataOutMoved = 0,
          id v16 = v16,
          [v16 bytes],
          [v16 length],
          der_get_octet_string_ber(),
          [v16 length]))
    {
      int v10 = 0;
LABEL_38:
      id v18 = 0;
LABEL_39:
      CFDataRef EncryptedData = 0;
      goto LABEL_36;
    }
    int v10 = 0;
    id v18 = 0;
    if (v52 != [v15 blockSize:0])
    {
LABEL_19:

LABEL_21:
      CFDataRef EncryptedData = 0;
      goto LABEL_22;
    }
  }
  int v10 = [(MSCMSRecipientInfo *)self keyEncryptionKey:v15 forEncryption:1 secCMSCompatibility:0];
  if (!v10) {
    goto LABEL_38;
  }
  id v19 = [v15 algorithm];
  if ([v19 isEqualToString:@"2.16.840.1.101.3.4.1.5"])
  {
LABEL_17:

    goto LABEL_18;
  }
  id v20 = [v15 algorithm];
  if ([v20 isEqualToString:@"2.16.840.1.101.3.4.1.25"])
  {

    goto LABEL_17;
  }
  id v33 = [v15 algorithm];
  char v34 = [v33 isEqualToString:@"2.16.840.1.101.3.4.1.45"];

  if (v34)
  {
LABEL_18:
    BOOL v21 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", CCSymmetricWrappedSize(objc_msgSend(v15, "ccAlgorithm:", 0), -[__CFData length](v4, "length")));
    size_t dataOutMoved = [v21 length];
    CCWrappingAlgorithm algorithm = [v15 ccAlgorithm:0];
    v47 = (const uint8_t *)*MEMORY[0x263EF80B0];
    size_t v46 = *MEMORY[0x263EF80B8];
    CFDataRef v22 = v15;
    BytePtr = CFDataGetBytePtr(v10);
    id v24 = v16;
    CFIndex Length = CFDataGetLength(v10);
    CFDataRef v26 = v4;
    id v27 = (const uint8_t *)[(__CFData *)v26 bytes];
    size_t v28 = [(__CFData *)v26 length];
    id v18 = v21;
    v29 = (uint8_t *)[v18 mutableBytes];
    uint64_t v30 = BytePtr;
    v15 = v22;
    size_t v31 = Length;
    id v16 = v24;
    LODWORD(v28) = CCSymmetricKeyWrap(algorithm, v47, v46, v30, v31, v27, v28, v29, &dataOutMoved);
    [v18 setLength:dataOutMoved];
    if (v28) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
  CCAlgorithm v35 = [v15 ccAlgorithm:0];
  v36 = CFDataGetBytePtr(v10);
  size_t v37 = CFDataGetLength(v10);
  if (CCCryptorCreate(0, v35, 1u, v36, v37, iv, &cryptorRef)) {
    goto LABEL_38;
  }
  id v38 = v16;
  CFDataRef v39 = v4;
  OutputCFIndex Length = CCCryptorGetOutputLength(cryptorRef, [(__CFData *)v39 length], 1);
  id v18 = [MEMORY[0x263EFF990] dataWithLength:OutputLength];
  if (!v18
    || (size_t dataOutMoved = 0,
        uint64_t v41 = cryptorRef,
        CFDataRef v39 = v39,
        v42 = (const void *)[(__CFData *)v39 bytes],
        size_t v43 = [(__CFData *)v39 length],
        id v18 = v18,
        CCCryptorUpdate(v41, v42, v43, (void *)[v18 mutableBytes], OutputLength, &dataOutMoved)))
  {

    CFDataRef EncryptedData = 0;
    id v16 = v38;
    goto LABEL_36;
  }
  size_t v49 = 0;
  v44 = cryptorRef;
  id v18 = v18;
  uint64_t v45 = [v18 mutableBytes];
  id v16 = v38;
  if (CCCryptorFinal(v44, (void *)(v45 + dataOutMoved), OutputLength - dataOutMoved, &v49))
  {

    goto LABEL_39;
  }
  [v18 setLength:v49 + dataOutMoved];

LABEL_35:
  id v18 = v18;
  CFDataRef EncryptedData = (CFDataRef)v18;
LABEL_36:

LABEL_22:
  der_free_octet_string();
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  if (v10) {
    CFRelease(v10);
  }

  return EncryptedData;
}

+ (id)decodeKeyTransRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (a6 && *a6) {
    id v11 = (id)[*a6 copy];
  }
  else {
    id v11 = 0;
  }
  if (a3->var0 != 1)
  {
    id v24 = 0;
    goto LABEL_29;
  }
  id v31 = v11;
  int v12 = +[MSCMSIdentifier decodeIdentifier:&a3->var1.var1.var1 error:&v31];
  id v13 = v31;

  id v26 = v10;
  id v27 = v9;
  if (v12)
  {
    BOOL v14 = [NSNumber numberWithInt:a3->var1.var0.var0];
    int v15 = [v12 type];
    if (v15 == 1)
    {
      if (![v14 intValue])
      {
LABEL_10:
        id v30 = v13;
        CertificateForIdentifier = (__SecCertificate *)findCertificateForIdentifier((uint64_t)&a3->var1.var0.var1, v9, v10, &v30);
        id v17 = v30;

        if (CertificateForIdentifier)
        {
          if ([v12 type] == 1
            && SecCertificateVersion() == 3
            && getKeyTypeForCertificate(CertificateForIdentifier) == 1
            && (SecCertificateGetKeyUsage() & 4) == 0)
          {
            if (MS_DEFAULT_LOG_BLOCK != -1) {
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_43);
            }
            id v18 = MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20D8A1000, v18, OS_LOG_TYPE_DEFAULT, "recipientInfo violates RFC 5652 (key usage)", buf, 2u);
            }
          }
          id v28 = v17;
          id v19 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:&a3->var1.var1.var1.var1.var2.var0.var0.components error:&v28];
          id v11 = v28;

          id v20 = NSDataFromOctetString(&a3->var1.var0.var3.var0);
          BOOL v21 = [MSCMSRecipientInfo alloc];
          CFDataRef v22 = v21;
          if (v21)
          {
            [(MSCMSRecipientInfo *)v21 setVersion:v14];
            id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v23 addObject:CertificateForIdentifier];

            [(MSCMSRecipientInfo *)v22 setRecipientCertificates:v23];
            [(MSCMSRecipientInfo *)v22 setKeyEncryptionAlgorithm:v19];
            CertificateForIdentifier = (__SecCertificate *)objc_alloc_init(MEMORY[0x263EFF980]);
            [(__SecCertificate *)CertificateForIdentifier addObject:v20];
            [(MSCMSRecipientInfo *)v22 setEncryptedKeys:CertificateForIdentifier];
          }
          else
          {
            id v23 = 0;
            CertificateForIdentifier = 0;
          }
          goto LABEL_25;
        }
        id v11 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v17 description:@"unable to find a certificate matching the recipient"];

        id v23 = 0;
        id v19 = 0;
        id v20 = 0;
        goto LABEL_24;
      }
    }
    else if (v15 == 2 && [v14 intValue] == 2)
    {
      goto LABEL_10;
    }
    id v11 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v13 description:@"decode failed for recipientInfo due to RFC 5652 violation (version)"];

    id v23 = 0;
    id v19 = 0;
    id v20 = 0;
    CertificateForIdentifier = 0;
LABEL_24:
    CFDataRef v22 = 0;
    goto LABEL_25;
  }
  BOOL v14 = 0;
  id v23 = 0;
  id v19 = 0;
  id v20 = 0;
  CertificateForIdentifier = 0;
  CFDataRef v22 = 0;
  id v11 = v13;
LABEL_25:
  if (a6 && v11) {
    *a6 = v11;
  }
  id v24 = v22;

  id v10 = v26;
  id v9 = v27;
LABEL_29:

  return v24;
}

uint64_t __79__MSCMSRecipientInfo_decodeKeyTransRecipientInfo_certificates_LAContext_error___block_invoke()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)decodeKeyAgreeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v53 = a4;
  id v9 = a5;
  if (a6 && *a6) {
    id v10 = (id)[*a6 copy];
  }
  else {
    id v10 = 0;
  }
  if (a3->var0 != 2)
  {
    id v18 = 0;
    goto LABEL_40;
  }
  long long v11 = *(_OWORD *)&a3->var1.var0.var0;
  long long v12 = *(_OWORD *)&a3->var1.var1.var1.var1.var2.var1.var1;
  long long v13 = *(_OWORD *)&a3->var1.var1.var3.var1;
  heim_oid var0 = a3->var1.var1.var3.var0;
  long long v64 = v13;
  unint64_t var1 = a3->var1.var1.var4.var1;
  heim_base_data v14 = a3->var1.var1.var1.var1.var0.var0;
  long long v59 = v11;
  heim_base_data v60 = v14;
  long long v61 = *(_OWORD *)&a3->var1.var1.var1.var1.var2.var0.var1;
  long long v62 = v12;
  if (v11 != 3)
  {
    uint64_t v41 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v10 description:@"decode failed for recipientInfo due to RFC 5652 violation (version)"];

    id v38 = 0;
    id v33 = 0;
    id v30 = 0;
    v29 = 0;
    uint64_t v52 = 0;
    BOOL v21 = 0;
    int v15 = 0;
    id v10 = (id)v41;
    id v26 = 0;
    if (!a6) {
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  int v15 = [NSNumber numberWithInt:3];
  if (DWORD2(v59) != 3)
  {
    if (DWORD2(v59) == 2)
    {
      id v57 = v10;
      id v16 = &v57;
      uint64_t CertificateBySubjectKeyID = findCertificateBySubjectKeyID(&v60, v53, v9, &v57);
      goto LABEL_13;
    }
    if (DWORD2(v59) == 1)
    {
      id v58 = v10;
      id v16 = &v58;
      uint64_t CertificateBySubjectKeyID = findCertificateByIssuerAndSerialNumber(&v60, v53, v9, &v58);
LABEL_13:
      id v19 = (const void *)CertificateBySubjectKeyID;
      id v20 = *v16;

      BOOL v21 = 0;
      goto LABEL_18;
    }
    BOOL v21 = 0;
    id v20 = v10;
LABEL_35:
    id v10 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v20 description:@"decode failed for recipientInfo (originator)"];

    id v38 = 0;
    id v33 = 0;
    id v30 = 0;
    v29 = 0;
    uint64_t v52 = 0;
    id v26 = 0;
    goto LABEL_36;
  }
  uint64_t v22 = NSDataFromBitString((void *)&v61 + 1);
  id v56 = v10;
  id v23 = +[MSOID OIDWithAsn1OID:&v60 error:&v56];
  id v20 = v56;

  if (!v22 || !v23)
  {

    goto LABEL_51;
  }
  id v24 = [v23 OIDString];
  char v25 = [v24 isEqualToString:@"1.2.840.10045.2.1"];

  if ((v25 & 1) == 0)
  {
LABEL_51:
    BOOL v21 = (void *)v22;
    goto LABEL_35;
  }
  id v19 = 0;
  BOOL v21 = (void *)v22;
LABEL_18:
  id v26 = NSDataFromOctetString(*((void **)&v62 + 1));
  id v55 = v20;
  uint64_t v27 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:&var0 error:&v55];
  id v10 = v55;

  CFTypeRef cf = v19;
  uint64_t v52 = (void *)v27;
  if (!v27)
  {
    +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v10 description:@"decode failed for recipientInfo (keyEncryptionAlgorithm)"];
    uint64_t v43 = v42 = v26;

    v29 = 0;
    id v30 = 0;
    id v33 = 0;
    id v10 = (id)v43;
    id v26 = v42;
LABEL_47:
    id v38 = 0;
    goto LABEL_31;
  }
  id v28 = [MSCMSRecipientInfo alloc];
  v29 = v28;
  if (!v28)
  {
    id v30 = 0;
    id v33 = 0;
    goto LABEL_47;
  }
  id v48 = v15;
  size_t v49 = a6;
  [(MSCMSRecipientInfo *)v28 setVersion:v15];
  [(MSCMSRecipientInfo *)v29 setOriginator:v19];
  v47 = v21;
  [(MSCMSRecipientInfo *)v29 setOriginatorPubKey:v21];
  int v50 = v26;
  [(MSCMSRecipientInfo *)v29 setUserKeyingMaterial:v26];
  size_t v46 = v29;
  [(MSCMSRecipientInfo *)v29 setKeyEncryptionAlgorithm:v27];
  v29 = (MSCMSRecipientInfo *)objc_alloc_init(MEMORY[0x263EFF980]);
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (DWORD2(v64))
  {
    uint64_t v31 = 0;
    unint64_t v32 = 0;
    id v33 = 0;
    char v34 = v10;
    do
    {
      CCAlgorithm v35 = (char *)var1 + v31;
      id v54 = v34;
      CertificateForIdentifier = (void *)findCertificateForIdentifier((uint64_t)var1 + v31, v53, v9, &v54);
      id v10 = v54;

      if (CertificateForIdentifier)
      {
        [(MSCMSRecipientInfo *)v29 addObject:CertificateForIdentifier];

        uint64_t v37 = NSDataFromOctetString((void *)v35 + 2);

        [v30 addObject:v37];
        id v33 = (void *)v37;
      }
      ++v32;
      v31 += 32;
      char v34 = v10;
    }
    while (v32 < DWORD2(v64));
  }
  else
  {
    id v33 = 0;
  }
  if ([(MSCMSRecipientInfo *)v29 count])
  {
    id v38 = v46;
    [(MSCMSRecipientInfo *)v46 setRecipientCertificates:v29];
    uint64_t v39 = [(MSCMSRecipientInfo *)v29 count];
    int v15 = v48;
    a6 = v49;
    BOOL v21 = v47;
    if (v39 == [v30 count])
    {
      [(MSCMSRecipientInfo *)v46 setEncryptedKeys:v30];
    }
    else
    {
      uint64_t v45 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v10 description:@"decode failed for recipientInfo (rid vs encryptedKey count)"];

      id v10 = (id)v45;
    }
  }
  else
  {
    uint64_t v44 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v10 description:@"decode failed for recipientInfo (rid)"];

    id v10 = (id)v44;
    int v15 = v48;
    a6 = v49;
    id v38 = v46;
    BOOL v21 = v47;
  }
  id v26 = v50;
LABEL_31:
  if (cf)
  {
    CFRelease(cf);
    if (!a6) {
      goto LABEL_39;
    }
LABEL_37:
    if (v10) {
      *a6 = v10;
    }
    goto LABEL_39;
  }
LABEL_36:
  if (a6) {
    goto LABEL_37;
  }
LABEL_39:
  id v18 = v38;

LABEL_40:

  return v18;
}

+ (id)decodeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (a3->var0 == 2)
  {
    uint64_t v11 = +[MSCMSRecipientInfo decodeKeyAgreeRecipientInfo:a3 certificates:v9 LAContext:v10 error:a6];
    goto LABEL_5;
  }
  if (a3->var0 == 1)
  {
    uint64_t v11 = +[MSCMSRecipientInfo decodeKeyTransRecipientInfo:a3 certificates:v9 LAContext:v10 error:a6];
LABEL_5:
    long long v12 = (void *)v11;
    goto LABEL_7;
  }
  long long v12 = 0;
LABEL_7:

  return v12;
}

- (__SecCertificate)recipientCertificate
{
  result = [(NSArray *)self->_recipientCertificates count];
  if (result)
  {
    recipientCertificates = self->_recipientCertificates;
    return (__SecCertificate *)[(NSArray *)recipientCertificates objectAtIndex:0];
  }
  return result;
}

- (__CFData)createSecCMSSharedInfo:(id)a3
{
  uint32ToNetworkByteOrder(8 * [a3 keySize:0], (uint64_t)v13, 4);
  v14[1] = 4;
  v14[2] = v13;
  v12[0] = [(NSData *)self->_userKeyingMaterial length];
  v12[1] = [(NSData *)self->_userKeyingMaterial bytes];
  v14[0] = v12;
  uint64_t v4 = length_SecCMS_ECC_CMS_SharedInfo((uint64_t)v14);
  objc_super v5 = [MEMORY[0x263EFF990] dataWithLength:v4];
  int v6 = v5;
  if (!v5
    || (uint64_t v11 = 0,
        id v7 = v5,
        encode_SecCMS_ECC_CMS_SharedInfo([v7 bytes] + v4 - 1, v4, (uint64_t)v14, (uint64_t)&v11)))
  {
    id v9 = 0;
  }
  else
  {
    id v8 = v7;
    id v9 = CFDataCreate(0, (const UInt8 *)[v8 bytes], objc_msgSend(v8, "length"));
  }

  return v9;
}

- (__CFData)createSharedInfo:(id)a3
{
  BOOL v21 = 0;
  NSUInteger v17 = 0;
  id v18 = 0;
  id v4 = a3;
  uint64_t v5 = [v4 asn1AlgId];
  uint64_t v6 = *(void *)(v5 + 16);
  long long v19 = *(_OWORD *)v5;
  uint64_t v20 = v6;
  int v7 = [v4 keySize:0];

  uint32ToNetworkByteOrder((8 * v7), (uint64_t)v16, 4);
  uint64_t v22 = 4;
  id v23 = v16;
  if ([(NSData *)self->_userKeyingMaterial length])
  {
    NSUInteger v17 = [(NSData *)self->_userKeyingMaterial length];
    id v18 = [(NSData *)self->_userKeyingMaterial bytes];
    BOOL v21 = &v17;
  }
  uint64_t v8 = length_ECC_CMS_SharedInfo((uint64_t)&v19);
  id v9 = [MEMORY[0x263EFF990] dataWithLength:v8];
  id v10 = v9;
  if (!v9
    || (uint64_t v15 = 0,
        id v11 = v9,
        encode_ECC_CMS_SharedInfo(objc_msgSend(v11, "bytes", 0) + v8 - 1, v8, (uint64_t)&v19, (uint64_t)&v15)))
  {
    long long v13 = 0;
  }
  else
  {
    id v12 = v11;
    long long v13 = CFDataCreate(0, (const UInt8 *)[v12 bytes], objc_msgSend(v12, "length"));
  }

  return v13;
}

- (__CFData)keyEncryptionKey:(id)a3 forEncryption:(BOOL)a4 secCMSCompatibility:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  keys[3] = *(void **)MEMORY[0x263EF8340];
  id v8 = a3;
  SecKeyRef privateKeyRef = 0;
  if (!v6)
  {
    recipientCertificates = self->_recipientCertificates;
    if (!recipientCertificates || ![(NSArray *)recipientCertificates count]) {
      goto LABEL_58;
    }
    IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate((__SecCertificate *)[(NSArray *)self->_recipientCertificates objectAtIndex:0], 0, 0);
    originatorPubKey = self->_originatorPubKey;
    if (!originatorPubKey)
    {
LABEL_55:
      CFNumberRef v16 = 0;
      goto LABEL_56;
    }
    uint64_t v13 = [(NSData *)originatorPubKey length];
    CFIndex v14 = v13;
    uint64_t valuePtr = 8 * v13;
    if (v13 > 382)
    {
      if ((unint64_t)(v13 - 520) >= 2 && (unint64_t)(v13 - 383) > 1) {
        goto LABEL_16;
      }
    }
    else if (((unint64_t)(v13 - 223) > 0x21 || ((1 << (v13 + 33)) & 0x300000003) == 0) {
           && (unint64_t)(v13 - 191) >= 2)
    }
    {
LABEL_16:
      CFNumberRef v15 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
      CFNumberRef v16 = v15;
      if (v15)
      {
        NSUInteger v17 = (void *)*MEMORY[0x263F16F68];
        keys[0] = *(void **)MEMORY[0x263F16FA8];
        keys[1] = v17;
        keys[2] = *(void **)MEMORY[0x263F16F98];
        id v18 = (void *)*MEMORY[0x263F16F80];
        values[0] = *(void **)MEMORY[0x263F16FB8];
        values[1] = v18;
        values[2] = v15;
        CFDictionaryRef v19 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (v19)
        {
          CFDictionaryRef v20 = v19;
          CFDataRef v21 = CFDataCreate(0, (const UInt8 *)[(NSData *)self->_originatorPubKey bytes], v14);
          uint64_t v22 = SecKeyCreateWithData(v21, v20, 0);
          goto LABEL_24;
        }
      }
LABEL_56:
      id v24 = 0;
      uint64_t v22 = 0;
      CFDictionaryRef v20 = 0;
      CFDataRef v21 = 0;
      id v26 = 0;
      CFNumberRef v28 = 0;
      CFDictionaryRef v30 = 0;
      if (!IdentityByCertificate) {
        goto LABEL_40;
      }
      goto LABEL_36;
    }
    uint64_t valuePtr = v13;
    CFIndex v14 = (unint64_t)(v13 + 7) >> 3;
    goto LABEL_16;
  }
  originator = self->_originator;
  IdentityByCertificate = self->_originatorIdentity;
  if (!originator)
  {
    if (IdentityByCertificate) {
      goto LABEL_20;
    }
LABEL_58:
    id v24 = 0;
    goto LABEL_52;
  }
  if (IdentityByCertificate)
  {
LABEL_20:
    CFRetain(self->_originatorIdentity);
    goto LABEL_21;
  }
  IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate(originator, 0, 0);
LABEL_21:
  id v23 = self->_recipientCertificates;
  if (!v23 || ![(NSArray *)v23 count]) {
    goto LABEL_55;
  }
  uint64_t v22 = SecCertificateCopyKey((SecCertificateRef)[(NSArray *)self->_recipientCertificates objectAtIndex:0]);
  CFDataRef v21 = 0;
  CFDictionaryRef v20 = 0;
  CFNumberRef v16 = 0;
LABEL_24:
  if (!IdentityByCertificate)
  {
    CFDictionaryRef v30 = 0;
    CFNumberRef v28 = 0;
    id v26 = 0;
    id v24 = 0;
    if (!v22) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  id v24 = 0;
  if (SecIdentityCopyPrivateKey(IdentityByCertificate, &privateKeyRef) || !privateKeyRef || !v22)
  {
    id v26 = 0;
    CFNumberRef v28 = 0;
    CFDictionaryRef v30 = 0;
    goto LABEL_36;
  }
  if (v5) {
    char v25 = [(MSCMSRecipientInfo *)self createSecCMSSharedInfo:v8];
  }
  else {
    char v25 = [(MSCMSRecipientInfo *)self createSharedInfo:v8];
  }
  id v26 = v25;
  if (!v25 || (uint64_t v33 = [v8 keySize:0], (unint64_t)(v33 - 0x7FFFFFFF) < 0xFFFFFFFF80000002))
  {
    id v24 = 0;
    CFNumberRef v28 = 0;
LABEL_62:
    CFDictionaryRef v30 = 0;
    goto LABEL_36;
  }
  CFNumberRef v27 = CFNumberCreate(0, kCFNumberSInt32Type, &v33);
  CFNumberRef v28 = v27;
  if (!v27)
  {
    id v24 = 0;
    goto LABEL_62;
  }
  v29 = (void *)*MEMORY[0x263F173E0];
  v37[0] = *(void **)MEMORY[0x263F173D8];
  v37[1] = v29;
  v36[0] = v27;
  v36[1] = v26;
  CFDictionaryRef v30 = CFDictionaryCreate(0, (const void **)v37, (const void **)v36, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v30) {
    id v24 = SecKeyCopyKeyExchangeResult(privateKeyRef, (SecKeyAlgorithm)*MEMORY[0x263F17288], v22, v30, 0);
  }
  else {
    id v24 = 0;
  }
LABEL_36:
  CFRelease(IdentityByCertificate);
  SecKeyRef v31 = privateKeyRef;
  if (privateKeyRef)
  {
    SecKeyRef privateKeyRef = 0;
    CFRelease(v31);
  }
  if (!v22) {
    goto LABEL_40;
  }
LABEL_39:
  CFRelease(v22);
LABEL_40:
  if (v16) {
    CFRelease(v16);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v28) {
    CFRelease(v28);
  }
  if (v30) {
    CFRelease(v30);
  }
LABEL_52:

  return v24;
}

- (id)decryptWrappedKey:(id)a3 kek:(id)a4 iv:(heim_base_data *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSArray *)self->_encryptedKeys objectAtIndex:0];
  CCCryptorRef cryptorRef = 0;
  id v11 = [v8 algorithm];
  if ([v11 isEqualToString:@"2.16.840.1.101.3.4.1.5"]) {
    goto LABEL_4;
  }
  id v12 = [v8 algorithm];
  if ([v12 isEqualToString:@"2.16.840.1.101.3.4.1.25"])
  {

LABEL_4:
LABEL_5:
    size_t dataOutMoved = CCSymmetricUnwrappedSize([v8 ccAlgorithm:0], objc_msgSend(v10, "length"));
    uint64_t v13 = [MEMORY[0x263EFF990] dataWithLength:dataOutMoved];
    id v41 = v8;
    CCWrappingAlgorithm v14 = [v8 ccAlgorithm:0];
    CFNumberRef v15 = (const uint8_t *)*MEMORY[0x263EF80B0];
    size_t v16 = *MEMORY[0x263EF80B8];
    id v17 = v9;
    id v18 = v9;
    CFDictionaryRef v19 = (const uint8_t *)[v18 bytes];
    size_t v20 = [v18 length];
    CFDataRef v21 = v10;
    id v22 = v10;
    id v23 = (const uint8_t *)[v22 bytes];
    size_t v24 = [v22 length];
    id v25 = v13;
    if (!CCSymmetricKeyUnwrap(v14, v15, v16, v19, v20, v23, v24, (uint8_t *)[v25 mutableBytes], &dataOutMoved))
    {
      [v25 setLength:dataOutMoved];
      id v9 = v17;
      id v10 = v21;
      id v8 = v41;
LABEL_7:
      id v26 = [MEMORY[0x263EFF8F8] dataWithData:v25];
      goto LABEL_8;
    }
    id v26 = 0;
    id v9 = v17;
    id v10 = v21;
    id v8 = v41;
    goto LABEL_8;
  }
  CFNumberRef v28 = [v8 algorithm];
  char v29 = [v28 isEqualToString:@"2.16.840.1.101.3.4.1.45"];

  if (v29) {
    goto LABEL_5;
  }
  id v43 = 0;
  CCAlgorithm v30 = [v8 ccAlgorithm:&v43];
  id v31 = v43;
  if (v31
    || (id v32 = v9,
        CCCryptorCreate(1u, v30, 1u, (const void *)[v32 bytes], objc_msgSend(v32, "length"), a5->var1, &cryptorRef)))
  {

    id v25 = 0;
  }
  else
  {
    OutputCFIndex Length = CCCryptorGetOutputLength(cryptorRef, [v10 length], 1);
    char v34 = [MEMORY[0x263EFF990] dataWithLength:OutputLength];
    size_t dataOutMoved = 0;
    CCAlgorithm v35 = cryptorRef;
    id v36 = v10;
    uint64_t v37 = (const void *)[v36 bytes];
    size_t v38 = [v36 length];
    id v25 = v34;
    if (!CCCryptorUpdate(v35, v37, v38, (void *)[v25 mutableBytes], OutputLength, &dataOutMoved))
    {
      size_t v42 = 0;
      uint64_t v39 = cryptorRef;
      id v25 = v25;
      uint64_t v40 = [v25 mutableBytes];
      if (!CCCryptorFinal(v39, (void *)(v40 + dataOutMoved), OutputLength - dataOutMoved, &v42))
      {
        [v25 setLength:v42 + dataOutMoved];
        goto LABEL_7;
      }
    }
  }
  id v26 = 0;
LABEL_8:
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }

  return v26;
}

- (id)key
{
  return [(MSCMSRecipientInfo *)self key:0];
}

- (id)key:(BOOL)a3
{
  v26[1] = 0;
  SecKeyRef privateKeyRef = 0;
  v26[0] = 0;
  recipientCertificates = self->_recipientCertificates;
  if (!recipientCertificates
    || (BOOL v5 = a3, ![(NSArray *)recipientCertificates count])
    || (IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate((__SecCertificate *)[(NSArray *)self->_recipientCertificates objectAtIndex:0], 0, 0)) == 0)
  {
    der_free_octet_string();
    DecryptedData = 0;
    goto LABEL_28;
  }
  int v7 = IdentityByCertificate;
  if (SecIdentityCopyPrivateKey(IdentityByCertificate, &privateKeyRef)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = privateKeyRef == 0;
  }
  if (v8) {
    goto LABEL_23;
  }
  id v9 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm algorithm];
  int v10 = [v9 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (!v10)
  {
    uint64_t v13 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm algorithm];
    int v14 = [v13 isEqualToString:@"1.3.133.16.840.63.0.2"];

    if (v14)
    {
      CFNumberRef v15 = [MSAlgorithmIdentifier alloc];
      size_t v16 = [(MSAlgorithmIdentifier *)self->_keyEncryptionAlgorithm parameters];
      id v17 = [(MSAlgorithmIdentifier *)v15 decode:v16 error:0];

      if (v17)
      {
        id v18 = [v17 parameters];
        if (!v18) {
          goto LABEL_19;
        }
        CFDictionaryRef v19 = [v17 parameters];
        size_t v20 = [MEMORY[0x263EFF8F8] dataWithBytes:&key__asn1NULL length:2];
        char v21 = [v19 isEqual:v20];

        if (v21)
        {
          id v18 = 0;
          goto LABEL_19;
        }
        id v22 = [v17 parameters];
        id v18 = v22;
        if (!v22
          || ![v22 length]
          || (uint64_t v25 = 0,
              id v18 = v18,
              [v18 bytes],
              [v18 length],
              der_get_octet_string_ber(),
              [v18 length]))
        {
          id v12 = 0;
          goto LABEL_33;
        }
        if (v26[0] == [v17 blockSize:0])
        {
LABEL_19:
          id v12 = -[MSCMSRecipientInfo keyEncryptionKey:forEncryption:secCMSCompatibility:](self, "keyEncryptionKey:forEncryption:secCMSCompatibility:", v17, 0, v5, v25);
          if (v12)
          {
            DecryptedData = [(MSCMSRecipientInfo *)self decryptWrappedKey:v17 kek:v12 iv:v26];
LABEL_21:

            goto LABEL_24;
          }
LABEL_33:
          DecryptedData = 0;
          goto LABEL_21;
        }
      }
    }
LABEL_23:
    id v12 = 0;
    DecryptedData = 0;
    goto LABEL_24;
  }
  DecryptedData = SecKeyCreateDecryptedData(privateKeyRef, (SecKeyAlgorithm)*MEMORY[0x263F17350], (CFDataRef)[(NSArray *)self->_encryptedKeys objectAtIndex:0], 0);
  id v12 = 0;
LABEL_24:
  CFRelease(v7);
  SecKeyRef v23 = privateKeyRef;
  if (privateKeyRef)
  {
    SecKeyRef privateKeyRef = 0;
    CFRelease(v23);
  }
  der_free_octet_string();
  if (v12) {
    CFRelease(v12);
  }
LABEL_28:

  return DecryptedData;
}

- (void)dealloc
{
  originator = self->_originator;
  if (originator)
  {
    self->_originator = 0;
    CFRelease(originator);
  }
  originatorIdentity = self->_originatorIdentity;
  if (originatorIdentity)
  {
    self->_originatorIdentity = 0;
    CFRelease(originatorIdentity);
  }
  v5.receiver = self;
  v5.super_class = (Class)MSCMSRecipientInfo;
  [(MSCMSRecipientInfo *)&v5 dealloc];
}

- (NSArray)algorithmCapabilities
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAlgorithmCapabilities:(id)a3
{
}

- (MSAlgorithmIdentifier)keyEncryptionAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeyEncryptionAlgorithm:(id)a3
{
}

- (void)setRecipientCertificate:(__SecCertificate *)a3
{
  self->_recipientCertificate = a3;
}

- (NSArray)recipientCertificates
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecipientCertificates:(id)a3
{
}

- (__SecCertificate)originator
{
  return self->_originator;
}

- (__SecIdentity)originatorIdentity
{
  return self->_originatorIdentity;
}

- (NSData)originatorPubKey
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOriginatorPubKey:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVersion:(id)a3
{
}

- (NSArray)encryptedKeys
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEncryptedKeys:(id)a3
{
}

- (NSData)userKeyingMaterial
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUserKeyingMaterial:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userKeyingMaterial, 0);
  objc_storeStrong((id *)&self->_encryptedKeys, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_originatorPubKey, 0);
  objc_storeStrong((id *)&self->_recipientCertificates, 0);
  objc_storeStrong((id *)&self->_keyEncryptionAlgorithm, 0);

  objc_storeStrong((id *)&self->_algorithmCapabilities, 0);
}

@end