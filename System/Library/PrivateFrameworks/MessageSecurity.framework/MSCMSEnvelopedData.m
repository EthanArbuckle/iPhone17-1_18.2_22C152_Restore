@interface MSCMSEnvelopedData
+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)encodeOriginatorInfoCertificates:(id)a3 error:(id *)a4;
- (BOOL)addRecipient:(id)a3 error:(id *)a4;
- (BOOL)checkDecryptionResult:(id)a3;
- (BOOL)contentChanged;
- (BOOL)encodeEncryptionParameters:(id *)a3;
- (BOOL)legacyASN1Encoding;
- (MSAlgorithmIdentifier)encryptionAlgorithm;
- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4;
- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5;
- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4;
- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5;
- (MSCMSMessage)embeddedContent;
- (MSOID)contentType;
- (MSOID)type;
- (NSArray)recipients;
- (NSData)dataContent;
- (NSData)encryptedContent;
- (NSData)encryptionKey;
- (NSMutableArray)originatorCertificates;
- (NSMutableArray)unprotectedAttributes;
- (NSNumber)version;
- (id)bulkEncryptDecrypt:(unsigned int)a3 algorithm:(unsigned int)a4 mode:(unsigned int)a5 key:(id)a6 iv:(id)a7 error:(id *)a8;
- (id)decryptContent:(id)a3 error:(id *)a4;
- (id)encodeMessageSecurityObject:(id *)a3;
- (id)encryptContent:(id *)a3;
- (id)encryptDecryptContent:(id)a3 ccOperation:(unsigned int)a4 error:(id *)a5;
- (id)findBestEncryptionAlgorithmForNewRecipient:(id)a3;
- (id)generateEncryptionKey:(id *)a3;
- (id)getRecipients;
- (void)addRecipient:(id)a3;
- (void)setContentChanged:(BOOL)a3;
- (void)setContentType:(id)a3;
- (void)setDataContent:(id)a3;
- (void)setEmbeddedContent:(id)a3;
- (void)setEncryptedContent:(id)a3;
- (void)setEncryptionAlgorithm:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setLegacyASN1Encoding:(BOOL)a3;
- (void)setOriginatorCertificates:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setUnprotectedAttributes:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MSCMSEnvelopedData

- (void)setDataContent:(id)a3
{
  v5 = (NSData *)a3;
  dataContent = self->_dataContent;
  if (dataContent != v5)
  {
    self->_dataContent = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_dataContent, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }
}

- (void)setEmbeddedContent:(id)a3
{
  v5 = (MSCMSMessage *)a3;
  embeddedContent = self->_embeddedContent;
  if (embeddedContent != v5)
  {
    self->_embeddedContent = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_embeddedContent, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }
}

- (void)setContentType:(id)a3
{
  v5 = (MSOID *)a3;
  contentType = self->_contentType;
  if (contentType != v5)
  {
    self->_contentType = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_contentType, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }
}

- (id)getRecipients
{
  return self->_recipients;
}

- (void)setVersion:(id)a3
{
}

- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MSCMSEnvelopedData *)self findBestEncryptionAlgorithmForNewRecipient:v6];
  v9 = [v8 algorithm];
  v10 = [(MSCMSEnvelopedData *)self initWithDataContent:v7 recipient:v6 encryptionAlgorithm:v9];

  return v10;
}

- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    [(MSCMSEnvelopedData *)self setDataContent:v8];
    v11 = [[MSOID alloc] initWithString:@"1.2.840.113549.1.7.1" error:0];
    [(MSCMSEnvelopedData *)self setContentType:v11];

    [(MSCMSEnvelopedData *)self addRecipient:v9];
    v12 = [(MSCMSEnvelopedData *)self recipients];

    if (v12)
    {
      v13 = [[MSAlgorithmIdentifier alloc] initWithOID:v10];
      [(MSCMSEnvelopedData *)self setEncryptionAlgorithm:v13];

      v12 = self;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSCMSEnvelopedData *)self findBestEncryptionAlgorithmForNewRecipient:v6];
  id v9 = [v8 algorithm];
  id v10 = [(MSCMSEnvelopedData *)self initWithEmbeddedContent:v7 recipient:v6 encryptionAlgorithm:v9];

  return v10;
}

- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    [(MSCMSEnvelopedData *)self setEmbeddedContent:v8];
    v11 = [v8 type];
    [(MSCMSEnvelopedData *)self setContentType:v11];

    [(MSCMSEnvelopedData *)self addRecipient:v9];
    v12 = [(MSCMSEnvelopedData *)self recipients];

    if (v12)
    {
      v13 = [[MSAlgorithmIdentifier alloc] initWithOID:v10];
      [(MSCMSEnvelopedData *)self setEncryptionAlgorithm:v13];

      v12 = self;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)findBestEncryptionAlgorithmForNewRecipient:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = v5;
  recipients = self->_recipients;
  if (recipients)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __65__MSCMSEnvelopedData_findBestEncryptionAlgorithmForNewRecipient___block_invoke;
    v19[3] = &unk_26411CDC0;
    id v20 = v5;
    [(NSArray *)recipients enumerateObjectsUsingBlock:v19];
  }
  if (v4)
  {
    id v8 = [v4 algorithmCapabilities];

    if (v8)
    {
      id v9 = [v4 algorithmCapabilities];
      id v10 = [v9 objectAtIndex:0];
      [v6 addObject:v10];
    }
  }
  v11 = findBestMutuallySupportedEncryptionAlgorithm(v6);
  if (v11)
  {
    if (!v4) {
      goto LABEL_10;
    }
    uint64_t v12 = [v4 algorithmCapabilities];
    if (!v12) {
      goto LABEL_10;
    }
    v13 = (void *)v12;
    v14 = [v4 algorithmCapabilities];
    v15 = [v14 objectAtIndex:0];
    int v16 = [v15 containsObject:v11];

    v17 = 0;
    if (v16) {
LABEL_10:
    }
      v17 = [[MSAlgorithmIdentifier alloc] initWithOID:v11];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __65__MSCMSEnvelopedData_findBestEncryptionAlgorithmForNewRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 algorithmCapabilities];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v7 algorithmCapabilities];
    id v6 = [v5 objectAtIndex:0];
    [v4 addObject:v6];
  }
}

- (BOOL)addRecipient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4 && *a4) {
    id v7 = (void *)[*a4 copy];
  }
  else {
    id v7 = 0;
  }
  id v8 = [(MSCMSEnvelopedData *)self recipients];

  if (v8)
  {
    id v9 = [(MSCMSEnvelopedData *)self recipients];
    uint64_t v10 = [v9 count];

    uint64_t v11 = v10 + 1;
  }
  else
  {
    uint64_t v11 = 1;
  }
  [(MSCMSEnvelopedData *)self addRecipient:v6];
  uint64_t v12 = [(MSCMSEnvelopedData *)self recipients];
  uint64_t v13 = [v12 count];

  if (a4 && v13 != v11)
  {
    *a4 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-1 underlyingError:v7 description:@"unable to add recipient"];
  }

  return v13 == v11;
}

- (void)addRecipient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    recipients = self->_recipients;
    if (recipients) {
      id v6 = (id)[(NSArray *)recipients mutableCopy];
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [(MSCMSEnvelopedData *)self findBestEncryptionAlgorithmForNewRecipient:v4];
      if (v8)
      {
        id v9 = (MSAlgorithmIdentifier *)v8;
        [v7 addObject:v4];
        objc_storeStrong((id *)&self->_recipients, v7);
        encryptionAlgorithm = self->_encryptionAlgorithm;
        self->_encryptionAlgorithm = v9;
        uint64_t v11 = v9;

        goto LABEL_8;
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  if (MS_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_7);
  }
  uint64_t v12 = MS_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_20D8A1000, v12, OS_LOG_TYPE_ERROR, "failed to add recipient. No shared encryption algorithm with the rest of the recipients", v13, 2u);
  }
LABEL_8:
}

uint64_t __35__MSCMSEnvelopedData_addRecipient___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  id v4 = [[MSCMSEnvelopedDataInternal alloc] initWithEnvelopedData:self];
  id v5 = [(MSCMSEnvelopedDataInternal *)v4 encodeMessageSecurityObject:a3];

  return v5;
}

- (id)generateEncryptionKey:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0;
  }
  encryptionAlgorithm = self->_encryptionAlgorithm;
  id v15 = 0;
  size_t v7 = [(MSAlgorithmIdentifier *)encryptionAlgorithm keySize:&v15];
  id v8 = v15;
  if (v8)
  {
    uint64_t v14 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v5 description:@"unable to encrypt/decrypt the content"];

    uint64_t v11 = 0;
    id v5 = (void *)v14;
  }
  else
  {
    id v9 = malloc_type_malloc(v7, 0xC64943BBuLL);
    if (v9)
    {
      uint64_t v10 = v9;
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], v7, v9))
      {
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v10 length:v7];
        objc_storeStrong((id *)&self->_encryptionKey, v11);
      }
      bzero(v10, v7);
      free(v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  if (a3 && v5) {
    *a3 = v5;
  }
  id v12 = v11;

  return v12;
}

- (BOOL)encodeEncryptionParameters:(id *)a3
{
  v42[1] = *MEMORY[0x263EF8340];
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0;
  }
  encryptionAlgorithm = self->_encryptionAlgorithm;
  id v38 = 0;
  size_t v7 = [(MSAlgorithmIdentifier *)encryptionAlgorithm blockSize:&v38];
  id v8 = v38;
  if (v8)
  {
    uint64_t v32 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v5 description:@"unable to encrypt/decrypt the content"];
    BOOL v31 = 0;
LABEL_26:

    id v5 = (void *)v32;
    if (!a3) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  id v9 = malloc_type_malloc(v7, 0xD7CD908DuLL);
  if (v9)
  {
    uint64_t v10 = v9;
    if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], v7, v9))
    {
      id v13 = 0;
      goto LABEL_34;
    }
    if ([(MSAlgorithmIdentifier *)self->_encryptionAlgorithm ccAlgorithm:0] == 5)
    {
      size_t v36 = v7;
      uint64_t v35 = 58;
      v37 = v10;
      uint64_t v34 = 0;
      uint64_t v11 = length_CMSRC2CBCParameter((uint64_t)&v35);
      id v12 = [MEMORY[0x263EFF990] dataWithLength:v11];
      if (!v12)
      {
LABEL_17:
        uint64_t v16 = 12;
        goto LABEL_18;
      }
      id v13 = v12;
      int v14 = encode_CMSRC2CBCParameter([v13 mutableBytes] + v11 - 1, v11, (uint64_t)&v35, (uint64_t)&v34);
      if (v14)
      {
        int v15 = v14;

        uint64_t v16 = v15;
LABEL_18:
        id v20 = (void *)MEMORY[0x263F087E8];
        uint64_t v41 = *MEMORY[0x263F08320];
        v42[0] = @"Failed encoding type CMSRC2CBCParameter";
        v21 = NSDictionary;
        v22 = (__CFString **)v42;
        v23 = &v41;
LABEL_21:
        v24 = objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1, v34);
        uint64_t v25 = [v20 errorWithDomain:@"com.apple.HeimASN1" code:v16 userInfo:v24];

        id v13 = 0;
        id v5 = (void *)v25;
        goto LABEL_22;
      }
LABEL_15:
      if (v11 == v34)
      {
LABEL_22:
        if (objc_msgSend(v13, "length", v34))
        {
          v26 = [MSAlgorithmIdentifier alloc];
          v27 = [(MSAlgorithmIdentifier *)self->_encryptionAlgorithm algorithm];
          v28 = [(MSAlgorithmIdentifier *)v26 initWithOID:v27 parameters:v13];

          if (v28)
          {
            v29 = self->_encryptionAlgorithm;
            self->_encryptionAlgorithm = v28;
            v30 = v28;

            BOOL v31 = 1;
LABEL_25:
            uint64_t v32 = (uint64_t)v5;
            free(v10);
            id v5 = v13;
            goto LABEL_26;
          }
        }
LABEL_34:
        BOOL v31 = 0;
        goto LABEL_25;
      }
      asn1_abort();
      goto LABEL_17;
    }
    uint64_t v35 = v7;
    size_t v36 = (size_t)v10;
    uint64_t v34 = 0;
    uint64_t v11 = length_CMSCBCParameter((uint64_t)&v35);
    v17 = [MEMORY[0x263EFF990] dataWithLength:v11];
    if (v17)
    {
      id v13 = v17;
      int v18 = encode_CMSCBCParameter([v13 mutableBytes] + v11 - 1, v11, (uint64_t)&v35, (uint64_t)&v34);
      if (!v18) {
        goto LABEL_15;
      }
      int v19 = v18;

      uint64_t v16 = v19;
    }
    else
    {
      uint64_t v16 = 12;
    }
    id v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    v40 = @"Failed encoding type CMSCBCParameter";
    v21 = NSDictionary;
    v22 = &v40;
    v23 = &v39;
    goto LABEL_21;
  }
  BOOL v31 = 0;
  if (!a3) {
    goto LABEL_29;
  }
LABEL_27:
  if (v5) {
    *a3 = v5;
  }
LABEL_29:

  return v31;
}

- (id)bulkEncryptDecrypt:(unsigned int)a3 algorithm:(unsigned int)a4 mode:(unsigned int)a5 key:(id)a6 iv:(id)a7 error:(id *)a8
{
  id v35 = a6;
  id v14 = a7;
  if (a8 && *a8) {
    int v15 = (void *)[*a8 copy];
  }
  else {
    int v15 = 0;
  }
  v39[0] = 0;
  v39[1] = 0;
  memset(v38, 0, sizeof(v38));
  size_t dataOutMoved = 0;
  CCCryptorRef cryptorRef = 0;
  unsigned int v16 = [(MSAlgorithmIdentifier *)self->_encryptionAlgorithm ccAlgorithm:0];
  v17 = [(MSAlgorithmIdentifier *)self->_encryptionAlgorithm parameters];
  int v18 = v17;
  if (v16 == 5)
  {
    int v19 = nsheim_decode_CMSRC2CBCParameter(v17);

    if (!v19)
    {
      id v20 = NSDataFromOctetString(v39);

      free_CMSRC2CBCParameter();
      goto LABEL_10;
    }
LABEL_34:
    uint64_t v34 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v15 description:@"unable to encrypt/decrypt the content"];

    id v27 = 0;
    v26 = 0;
    int v15 = (void *)v34;
    goto LABEL_24;
  }
  int v21 = nsheim_decode_CMSCBCParameter(v17);

  if (v21) {
    goto LABEL_34;
  }
  id v20 = NSDataFromOctetString(v38);

  free_CMSCBCParameter();
LABEL_10:
  id v14 = v20;
  if (v20) {
    v22 = (const void *)[v20 bytes];
  }
  else {
    v22 = 0;
  }
  id v23 = v35;
  if (CCCryptorCreateWithMode(a3, a5, a4, 1u, v22, (const void *)[v23 bytes], objc_msgSend(v23, "length"), 0, 0, 0, 0, &cryptorRef))
  {
    id v27 = 0;
    v26 = 0;
    goto LABEL_24;
  }
  if (a3 == 1)
  {
    encryptedContent = self->_encryptedContent;
  }
  else
  {
    if (![(MSOID *)self->_contentType isEqualToString:@"1.2.840.113549.1.7.1"])
    {
      uint64_t v25 = [(MSCMSMessage *)self->_embeddedContent encodeMessageSecurityObject:0];
      goto LABEL_20;
    }
    encryptedContent = self->_dataContent;
  }
  uint64_t v25 = encryptedContent;
LABEL_20:
  v26 = v25;
  if (v25)
  {
    id v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", CCCryptorGetOutputLength(cryptorRef, -[NSData length](v25, "length"), 1));
    v28 = (char *)[v27 mutableBytes];
    size_t v29 = [v27 length];
    v30 = cryptorRef;
    v26 = v26;
    if (!CCCryptorUpdate(v30, [(NSData *)v26 bytes], [(NSData *)v26 length], v28, v29, &dataOutMoved))
    {
      BOOL v31 = &v28[dataOutMoved];
      size_t v32 = v29 - dataOutMoved;
      if (!CCCryptorFinal(cryptorRef, v31, v29 - dataOutMoved, &dataOutMoved))
      {
        objc_msgSend(v27, "setLength:", dataOutMoved - v32 + objc_msgSend(v27, "length"));
        goto LABEL_24;
      }
    }
  }
  id v27 = 0;
LABEL_24:
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  if (a8 && v15) {
    *a8 = v15;
  }

  return v27;
}

- (BOOL)checkDecryptionResult:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    uint64_t v13 = *MEMORY[0x263F084C8];
    v14[0] = MEMORY[0x263EFFA80];
    BOOL v5 = 1;
    id v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    char v12 = 0;
    uint64_t v11 = 0;
    if ([NSString stringEncodingForData:v4 encodingOptions:v6 convertedString:&v11 usedLossyConversion:&v12])
    {
      BOOL v7 = v11 == 0;
    }
    else
    {
      BOOL v7 = 1;
    }
    if (v7 || v12 != 0)
    {
      id v9 = v4;
      [v9 bytes];
      [v9 length];
      BOOL v5 = 0;
      if (!der_get_tag())
      {
        [v9 length];
        BOOL v5 = 0;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)encryptDecryptContent:(id)a3 ccOperation:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (a5 && *a5) {
    id v9 = (void *)[*a5 copy];
  }
  else {
    id v9 = 0;
  }
  encryptionAlgorithm = self->_encryptionAlgorithm;
  id v36 = 0;
  uint64_t v11 = [(MSAlgorithmIdentifier *)encryptionAlgorithm ccAlgorithm:&v36];
  id v12 = v36;
  if (v12)
  {
    id v23 = v12;
    id v20 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v9 description:@"unable to encrypt/decrypt the content"];
    uint64_t v13 = 0;
    goto LABEL_28;
  }
  if (v6)
  {
    uint64_t v13 = [v8 key:0];
    if (v13) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
  id v35 = v9;
  uint64_t v13 = [(MSCMSEnvelopedData *)self generateEncryptionKey:&v35];
  id v24 = v35;

  id v9 = v24;
  if (!v13)
  {
LABEL_17:
    id v20 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v9 description:@"unable to access the content encryption key"];
    id v23 = 0;
LABEL_28:
    int v19 = 0;
LABEL_23:

    if (!a5) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
LABEL_8:
  v30 = a5;
  id v14 = v8;
  int v15 = self->_encryptionAlgorithm;
  id v34 = 0;
  uint64_t v16 = [(MSAlgorithmIdentifier *)v15 ccMode:&v34];
  id v17 = v34;
  if (v17)
  {
    id v23 = v17;
    id v20 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v9 description:@"unable to encrypt/decrypt the content"];
    int v19 = 0;
LABEL_22:
    id v8 = v14;
    a5 = v30;
    goto LABEL_23;
  }
  if (!v6)
  {
    id v33 = v9;
    [(MSCMSEnvelopedData *)self encodeEncryptionParameters:&v33];
    id v18 = v33;

    id v9 = v18;
  }
  id v32 = v9;
  int v19 = [(MSCMSEnvelopedData *)self bulkEncryptDecrypt:v6 algorithm:v11 mode:v16 key:v13 iv:0 error:&v32];
  id v20 = v32;

  if (v6 == 1)
  {
    id v9 = [v14 keyEncryptionAlgorithm];
    int v21 = [v9 algorithm];
    if ([v21 isEqualToString:@"1.3.133.16.840.63.0.2"])
    {
      BOOL v22 = [(MSCMSEnvelopedData *)self checkDecryptionResult:v19];

      if (v22) {
        goto LABEL_14;
      }
      id v9 = [v14 key:1];
      id v31 = v20;
      uint64_t v25 = [(MSCMSEnvelopedData *)self bulkEncryptDecrypt:1 algorithm:v11 mode:v16 key:v9 iv:0 error:&v31];
      id v26 = v31;

      if ([(MSCMSEnvelopedData *)self checkDecryptionResult:v25])
      {
        id v27 = v25;

        int v19 = v27;
      }

      id v23 = 0;
      id v20 = v26;
    }
    else
    {

      id v23 = 0;
    }
    goto LABEL_22;
  }
LABEL_14:
  id v23 = 0;
  id v8 = v14;
  a5 = v30;
  if (!v30) {
    goto LABEL_26;
  }
LABEL_24:
  if (v20) {
    *a5 = v20;
  }
LABEL_26:
  id v28 = v19;

  return v28;
}

- (id)encryptContent:(id *)a3
{
  return [(MSCMSEnvelopedData *)self encryptDecryptContent:0 ccOperation:0 error:a3];
}

- (id)decryptContent:(id)a3 error:(id *)a4
{
  return [(MSCMSEnvelopedData *)self encryptDecryptContent:a3 ccOperation:1 error:a4];
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a5 && *a5) {
    id v9 = (id)[*a5 copy];
  }
  else {
    id v9 = 0;
  }
  v95 = 0;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v90 = 0u;
  int v10 = nsheim_decode_EnvelopedData(v7);
  if (v10)
  {
    int v11 = v10;
    if (nsheim_decode_SecCMS_EnvelopedData(v7))
    {
      id v12 = MSErrorASN1Domain[0];
      if (v7) {
        uint64_t v13 = [v7 length];
      }
      else {
        uint64_t v13 = -1;
      }
      id v17 = +[MSError MSErrorWithDomain:v12, v11, v9, @"unable to decode envelopedData (%ld bytes)", v13 code underlyingError description];

      dumpNSData("EnvelopedData", v7);
      id v14 = 0;
      v76 = 0;
      goto LABEL_53;
    }
  }
  id v14 = [MSCMSEnvelopedData alloc];
  if (!v14)
  {
    v76 = 0;
    v74 = 0;
    v75 = 0;
    v40 = 0;
    id v28 = 0;
    v50 = 0;
    id v53 = 0;
    goto LABEL_68;
  }
  int v15 = [NSNumber numberWithInt:v90];
  [(MSCMSEnvelopedData *)v14 setVersion:v15];

  v72 = a5;
  v73 = v8;
  if (*((void *)&v90 + 1))
  {
    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v17 = v9;
    long long v83 = 0uLL;
    id v18 = NSDataFromAny(*((void **)&v90 + 1));
    int v19 = nsheim_decode_OriginatorInfo(v18);

    v76 = v16;
    if (v19)
    {
      id v20 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:v19 underlyingError:v17 description:@"unable to decode envelopedData.originatorInfo"];
    }
    else
    {
      id v20 = v17;
      if (v16)
      {
        id v20 = v17;
        if ((void)v83)
        {
          id v20 = v17;
          if (*(_DWORD *)v83)
          {
            uint64_t v21 = 0;
            unint64_t v22 = 0;
            do
            {
              if (*(_DWORD *)(*(void *)(v83 + 8) + v21) == 1)
              {
                uint64_t v23 = SecCertificateCreateWithBytes();
                if (v23)
                {
                  id v24 = (void *)v23;
                  [v16 addObject:v23];
                }
              }
              ++v22;
              v21 += 24;
            }
            while (v22 < *(unsigned int *)v83);
            id v20 = v17;
            a5 = v72;
          }
        }
      }
    }
    free_OriginatorInfo();

    if (v19)
    {

      id v14 = 0;
LABEL_53:
      v74 = 0;
      v75 = 0;
      v40 = 0;
      id v28 = 0;
      v50 = 0;
      id v53 = 0;
      id v9 = v17;
      goto LABEL_68;
    }
    id v25 = v16;
  }
  else
  {
    id v25 = 0;
  }
  id v71 = v7;
  v76 = v25;
  -[MSCMSEnvelopedData setOriginatorCertificates:](v14, "setOriginatorCertificates:");
  if (v91)
  {
    uint64_t v26 = 0;
    unint64_t v27 = 0;
    id v28 = 0;
    do
    {
      size_t v29 = v28;
      v30 = v9;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v83 = 0u;
      long long v32 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 16);
      long long v31 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 32);
      long long v83 = *(_OWORD *)(*((void *)&v91 + 1) + v26);
      long long v84 = v32;
      long long v85 = v31;
      long long v33 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 96);
      long long v35 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 48);
      long long v34 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 64);
      long long v88 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 80);
      long long v89 = v33;
      long long v86 = v35;
      long long v87 = v34;
      id v82 = v9;
      id v28 = +[MSCMSRecipientInfo decodeRecipientInfo:&v83 certificates:v76 LAContext:0 error:&v82];
      id v9 = v82;

      if (v28)
      {
        if (v76 && [v76 count])
        {
          *(void *)buf = 0;
          SecKeyRef v36 = SecCertificateCopyKey((SecCertificateRef)[v76 objectAtIndex:0]);
          SecKeyCopyPublicBytes();
          if (v36) {
            CFRelease(v36);
          }
          v37 = *(void **)buf;
          [v28 setOriginatorPubKey:*(void *)buf];
        }
        [(MSCMSEnvelopedData *)v14 addRecipient:v28];
      }
      else
      {
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_38);
        }
        id v38 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v27;
          __int16 v97 = 2112;
          id v98 = v9;
          _os_log_impl(&dword_20D8A1000, v38, OS_LOG_TYPE_ERROR, "failed to decode recipient %u: %@", buf, 0x12u);
        }
      }
      ++v27;
      v26 += 112;
    }
    while (v27 < v91);
  }
  else
  {
    id v28 = 0;
  }
  uint64_t v39 = [(MSCMSEnvelopedData *)v14 recipients];
  v40 = (void *)[v39 count];

  if (!v40)
  {
    uint64_t v69 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:0 underlyingError:v9 description:@"unable to decode envelopedData.recipientInfos"];

    id v14 = 0;
    v74 = 0;
    v75 = 0;
    v50 = 0;
    id v53 = 0;
    id v9 = (id)v69;
    id v7 = v71;
    a5 = v72;
    id v8 = v73;
    goto LABEL_68;
  }
  uint64_t v41 = NSDataFromOctetString(*((void **)&v94 + 1));
  [(MSCMSEnvelopedData *)v14 setEncryptedContent:v41];

  id v81 = v9;
  uint64_t v42 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:&v93 error:&v81];
  id v43 = v81;

  v70 = (void *)v42;
  [(MSCMSEnvelopedData *)v14 setEncryptionAlgorithm:v42];
  v44 = [(MSCMSEnvelopedData *)v14 recipients];
  uint64_t v45 = [v44 count];

  id v7 = v71;
  if (!v45)
  {
LABEL_45:

    id v14 = 0;
    v75 = 0;
    v50 = 0;
LABEL_46:
    v74 = 0;
    id v53 = 0;
    id v9 = v43;
    goto LABEL_47;
  }
  unint64_t v46 = 0;
  while (1)
  {
    v47 = v28;
    v48 = v43;
    v49 = [(MSCMSEnvelopedData *)v14 recipients];
    id v28 = [v49 objectAtIndex:v46];

    id v80 = v48;
    v50 = [(MSCMSEnvelopedData *)v14 decryptContent:v28 error:&v80];
    id v43 = v80;

    if (v50) {
      break;
    }
    ++v46;
    v51 = [(MSCMSEnvelopedData *)v14 recipients];
    unint64_t v52 = [v51 count];

    if (v46 >= v52) {
      goto LABEL_45;
    }
  }
  id v79 = v43;
  uint64_t v54 = +[MSOID OIDWithAsn1OID:&v92 error:&v79];
  id v9 = v79;

  if (!v54)
  {
    id v43 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v9 description:@"unable to get contentType from envelopedData.encryptedContentnInfo"];

    id v14 = 0;
    v75 = 0;
    goto LABEL_46;
  }
  v75 = (void *)v54;
  [(MSCMSEnvelopedData *)v14 setContentType:v54];
  v55 = [(MSCMSEnvelopedData *)v14 contentType];
  char v56 = [v55 isEqualToString:@"1.2.840.113549.1.7.1"];

  id v8 = v73;
  if (v56)
  {
    [(MSCMSEnvelopedData *)v14 setDataContent:v50];
    v74 = 0;
  }
  else
  {
    v57 = [(MSCMSEnvelopedData *)v14 contentType];
    id v78 = v9;
    uint64_t v58 = decodeEmbeddedCMSContent(v57, v50, v73, (uint64_t)&v78);
    id v59 = v78;

    v74 = (void *)v58;
    [(MSCMSEnvelopedData *)v14 setEmbeddedContent:v58];
    id v9 = v59;
  }
  a5 = v72;
  v40 = v70;
  if (!v95)
  {
    id v53 = 0;
    goto LABEL_67;
  }
  id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v53 && (v60 = v95, *v95))
  {
    uint64_t v61 = 0;
    unint64_t v62 = 0;
    do
    {
      long long v83 = 0u;
      long long v84 = 0u;
      v63 = (long long *)(*((void *)v60 + 1) + v61);
      long long v64 = v63[1];
      long long v83 = *v63;
      long long v84 = v64;
      id v77 = v9;
      v65 = +[MSCMSAttribute decodeAttribute:&v83 error:&v77];
      id v66 = v77;

      if (v65) {
        [v53 addObject:v65];
      }

      ++v62;
      v60 = v95;
      v61 += 32;
      id v9 = v66;
    }
    while (v62 < *v95);
  }
  else
  {
    id v66 = v9;
  }
  if ([v53 count])
  {
    id v9 = v66;
    id v7 = v71;
    a5 = v72;
    id v8 = v73;
    v40 = v70;
LABEL_67:
    [(MSCMSEnvelopedData *)v14 setUnprotectedAttributes:v53];
    goto LABEL_68;
  }
  id v9 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:0 underlyingError:v66 description:@"unable to decode envelopedData.unprotectedAttrs"];

  id v14 = 0;
  id v7 = v71;
LABEL_47:
  a5 = v72;
  id v8 = v73;
  v40 = v70;
LABEL_68:
  free_EnvelopedData();
  if (a5 && v9) {
    *a5 = v9;
  }
  v67 = v14;

  return v67;
}

uint64_t __64__MSCMSEnvelopedData_decodeMessageSecurityObject_options_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)encodeOriginatorInfoCertificates:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a4 && *a4) {
    uint64_t v6 = (void *)[*a4 copy];
  }
  else {
    uint64_t v6 = 0;
  }
  v40 = 0;
  uint64_t v41 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  if (v5)
  {
    long long v32 = v6;
    LODWORD(v38) = [v5 count];
    id v7 = (char *)malloc_type_malloc(24 * v38, 0x10800404ACF7207uLL);
    uint64_t v39 = v7;
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v31 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = 0;
      uint64_t v13 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v9);
          }
          CFDataRef v15 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v34 + 1) + 8 * i));
          if (v15)
          {
            [v8 addObject:v15];
            id v16 = &v7[24 * v12];
            *(_DWORD *)id v16 = 1;
            *((void *)v16 + 1) = [(__CFData *)v15 length];
            uint64_t v17 = [(__CFData *)v15 bytes];
            id v7 = (char *)v39;
            *((void *)v39 + 3 * v12++ + 2) = v17;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v11);
    }

    v40 = &v38;
    uint64_t v41 = 0;
    uint64_t v33 = 0;
    uint64_t v18 = length_OriginatorInfo((uint64_t)&v40);
    int v19 = [MEMORY[0x263EFF990] dataWithLength:v18];
    if (v19)
    {
      id v20 = v19;
      int v21 = encode_OriginatorInfo([v20 mutableBytes] + v18 - 1, v18, (uint64_t)&v40, (uint64_t)&v33);
      if (!v21)
      {
        BOOL v27 = v18 == v33;
        uint64_t v6 = v32;
        if (!v27)
        {
          id v28 = (MSCMSEnvelopedData *)asn1_abort();
          return [(MSCMSEnvelopedData *)v28 type];
        }
        goto LABEL_23;
      }
      int v22 = v21;

      uint64_t v23 = v22;
    }
    else
    {
      uint64_t v23 = 12;
    }
    id v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    id v43 = @"Failed encoding type OriginatorInfo";
    uint64_t v26 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v6 = [v25 errorWithDomain:@"com.apple.HeimASN1" code:v23 userInfo:v26];

    id v20 = 0;
LABEL_23:
    free(v39);
    if (a4 && v6) {
      *a4 = v6;
    }
    id v24 = v20;

    id v5 = v31;
    goto LABEL_27;
  }
  id v24 = 0;
LABEL_27:

  return v24;
}

- (MSOID)type
{
  return +[MSOID OIDWithString:@"1.2.840.113549.1.7.3" error:0];
}

- (NSData)dataContent
{
  return self->_dataContent;
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)objc_getProperty(self, a2, 32, 1);
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRecipients:(id)a3
{
}

- (MSAlgorithmIdentifier)encryptionAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEncryptionAlgorithm:(id)a3
{
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSMutableArray)unprotectedAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUnprotectedAttributes:(id)a3
{
}

- (NSMutableArray)originatorCertificates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOriginatorCertificates:(id)a3
{
}

- (BOOL)legacyASN1Encoding
{
  return self->_legacyASN1Encoding;
}

- (void)setLegacyASN1Encoding:(BOOL)a3
{
  self->_legacyASN1Encoding = a3;
}

- (NSData)encryptedContent
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEncryptedContent:(id)a3
{
}

- (BOOL)contentChanged
{
  return self->_contentChanged;
}

- (void)setContentChanged:(BOOL)a3
{
  self->_contentChanged = a3;
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_encryptedContent, 0);
  objc_storeStrong((id *)&self->_originatorCertificates, 0);
  objc_storeStrong((id *)&self->_unprotectedAttributes, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_encryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_embeddedContent, 0);
  objc_storeStrong((id *)&self->_dataContent, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end