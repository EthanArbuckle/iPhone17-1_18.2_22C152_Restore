@interface MSAlgorithmIdentifier
+ (MSAlgorithmIdentifier)algorithmIdentifierWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4;
+ (MSAlgorithmIdentifier)algorithmIdentifierWithOID:(id)a3;
+ (id)digestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4;
- (AlgorithmIdentifier)asn1AlgId;
- (AlgorithmIdentifier)encode;
- (BOOL)isEqual:(id)a3;
- (MSAlgorithmIdentifier)initWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4;
- (MSAlgorithmIdentifier)initWithOID:(id)a3;
- (MSAlgorithmIdentifier)initWithOID:(id)a3 parameters:(id)a4;
- (MSOID)algorithm;
- (NSData)parameters;
- (id)decode:(id)a3 error:(id *)a4;
- (id)initDigestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4;
- (id)signatureAlgorithmWithDigestAlgorithm:(id)a3 error:(id *)a4;
- (unint64_t)blockSize:(id *)a3;
- (unint64_t)hash;
- (unint64_t)keySize:(id *)a3;
- (unsigned)ccAlgorithm:(id *)a3;
- (unsigned)ccMode:(id *)a3;
- (void)dealloc;
@end

@implementation MSAlgorithmIdentifier

+ (MSAlgorithmIdentifier)algorithmIdentifierWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithAsn1AlgId:a3 error:a4];

  return (MSAlgorithmIdentifier *)v4;
}

- (MSAlgorithmIdentifier)initWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4
{
  v17.receiver = self;
  v17.super_class = (Class)MSAlgorithmIdentifier;
  v6 = [(MSAlgorithmIdentifier *)&v17 init];
  if (!v6)
  {
LABEL_14:
    v9 = v6;
    goto LABEL_16;
  }
  v7 = (AlgorithmIdentifier *)malloc_type_malloc(0x18uLL, 0x10300406712BA52uLL);
  v6->_asn1AlgId = v7;
  if (!v7)
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:-108 underlyingError:*a4 description:@"unable to allocate Algorithm Identifier"];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  int v8 = copy_AlgorithmIdentifier();
  if (!v8)
  {
    uint64_t v10 = +[MSOID OIDWithAsn1OID:v6->_asn1AlgId error:a4];
    algorithm = v6->_algorithm;
    v6->_algorithm = (MSOID *)v10;

    if (v6->_algorithm)
    {
      var1 = v6->_asn1AlgId->var1;
      if (var1)
      {
        if (var1->var0)
        {
          v13 = var1->var1;
          if (v13)
          {
            uint64_t v14 = [MEMORY[0x263EFF8F8] dataWithBytes:v13 length:a3->var1->var0];
            parameters = v6->_parameters;
            v6->_parameters = (NSData *)v14;
          }
        }
      }
      goto LABEL_14;
    }
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    *a4 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:v8 underlyingError:*a4 description:@"unable to copy Algorithm Identifier"];
  }
  free(v6->_asn1AlgId);
  v9 = 0;
  v6->_asn1AlgId = 0;
LABEL_16:

  return v9;
}

- (void)dealloc
{
  if (self->_asn1AlgId)
  {
    free_AlgorithmIdentifier();
    free(self->_asn1AlgId);
    self->_asn1AlgId = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)MSAlgorithmIdentifier;
  [(MSAlgorithmIdentifier *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_algorithm, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 algorithm];
    if (![v6 isEqual:self->_algorithm])
    {
      char v11 = 0;
      goto LABEL_16;
    }
    parameters = self->_parameters;
    if (parameters)
    {
LABEL_4:
      uint64_t v8 = [v5 parameters];
      if (v8)
      {
        v9 = (void *)v8;
        uint64_t v10 = [v5 parameters];
        char v11 = [v10 isEqualToData:self->_parameters];

        if (!parameters) {
          goto LABEL_15;
        }
      }
      else
      {
        char v11 = 0;
        if (!parameters) {
          goto LABEL_15;
        }
      }
LABEL_16:

      goto LABEL_17;
    }
    objc_super v3 = [v5 parameters];
    if (v3)
    {
      if (self->_parameters) {
        goto LABEL_4;
      }
      char v11 = 0;
    }
    else
    {
      char v11 = 1;
    }
LABEL_15:

    goto LABEL_16;
  }
  char v11 = 0;
LABEL_17:

  return v11;
}

- (unint64_t)hash
{
  parameters = self->_parameters;
  v4 = [(MSAlgorithmIdentifier *)self algorithm];
  unint64_t v5 = [v4 hash];
  if (parameters)
  {
    v6 = [(MSAlgorithmIdentifier *)self parameters];
    v5 += [v6 hash];
  }
  return v5;
}

- (MSOID)algorithm
{
  return (MSOID *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)parameters
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (AlgorithmIdentifier)encode
{
  objc_super v3 = (AlgorithmIdentifier *)malloc_type_malloc(0x18uLL, 0x10300406712BA52uLL);
  if (v3)
  {
    v4 = [(MSAlgorithmIdentifier *)self algorithm];
    uint64_t v14 = [v4 Asn1OID];
    uint64_t v15 = v5;

    der_copy_oid();
    v6 = [(MSAlgorithmIdentifier *)self parameters];

    if (v6)
    {
      v3->var1 = (heim_base_data *)malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
      v7 = [(MSAlgorithmIdentifier *)self parameters];
      uint64_t v8 = [v7 length];

      if (v8)
      {
        v9 = [(MSAlgorithmIdentifier *)self parameters];
        uint64_t v12 = [v9 length];

        id v10 = [(MSAlgorithmIdentifier *)self parameters];
        v13 = (void *)[v10 bytes];
      }
      else
      {
        uint64_t v12 = 2;
        v13 = &asn1NULL;
      }
      MEMORY[0x21055FEC0](&v12, v3->var1);
    }
    else
    {
      v3->var1 = 0;
    }
  }
  return v3;
}

+ (MSAlgorithmIdentifier)algorithmIdentifierWithOID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithOID:v4];

  return (MSAlgorithmIdentifier *)v5;
}

+ (id)digestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initDigestAlgorithmWithSignatureAlgorithm:v6 error:a4];

  return v7;
}

- (MSAlgorithmIdentifier)initWithOID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF8F8] data];
  if (algorithmOIDToParameters_onceToken != -1) {
    dispatch_once(&algorithmOIDToParameters_onceToken, &__block_literal_global_80);
  }
  id v6 = [v4 OIDString];
  v7 = [(id)algorithmOIDToParameters_sAlgorithmOIDStringIsAbsentParameters objectForKeyedSubscript:v6];
  char v8 = [v7 BOOLValue];

  if (v8) {
    id v9 = 0;
  }
  else {
    id v9 = v5;
  }

  id v10 = [(MSAlgorithmIdentifier *)self initWithOID:v4 parameters:v9];
  return v10;
}

- (MSAlgorithmIdentifier)initWithOID:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSAlgorithmIdentifier;
  id v9 = [(MSAlgorithmIdentifier *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_algorithm, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
    v10->_asn1AlgId = [(MSAlgorithmIdentifier *)v10 encode];
  }

  return v10;
}

- (id)decode:(id)a3 error:(id *)a4
{
  memset(v8, 0, sizeof(v8));
  if (nsheim_decode_AlgorithmIdentifier(a3))
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:-26275 underlyingError:*a4 description:@"unable to decode Algorithm Identifier"];
      id v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = [(MSAlgorithmIdentifier *)self initWithAsn1AlgId:v8 error:a4];
    free_AlgorithmIdentifier();
  }

  return v6;
}

- (id)initDigestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = [a3 algorithm];
  id v7 = +[MSOID digestOIDWithSignatureAlgorithm:v6 error:a4];

  if (v7)
  {
    self = [(MSAlgorithmIdentifier *)self initWithOID:v7];
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)signatureAlgorithmWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MSAlgorithmIdentifier *)self algorithm];
  int v8 = [v7 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (v8)
  {
    id v9 = [v6 algorithm];
    id v10 = +[MSOID RSASignatureOIDWithDigestAlgorithm:v9 error:a4];
LABEL_5:
    a4 = v10;
LABEL_6:

    goto LABEL_7;
  }
  char v11 = [(MSAlgorithmIdentifier *)self algorithm];
  int v12 = [v11 isEqualToString:@"1.2.840.10045.2.1"];

  if (v12)
  {
    id v9 = [v6 algorithm];
    id v10 = +[MSOID ECSignatureOIDWithDigestAlgorithm:v9 error:a4];
    goto LABEL_5;
  }
  if (a4)
  {
    uint64_t v14 = MSErrorCryptoDomain[0];
    id v15 = *a4;
    id v9 = [(MSAlgorithmIdentifier *)self algorithm];
    v16 = [v9 OIDString];
    *a4 = +[MSError MSErrorWithDomain:v14, -50, v15, @"Algorithm Identifier %@ does not indicate a public key algorithm", v16 code underlyingError description];

    a4 = 0;
    goto LABEL_6;
  }
LABEL_7:

  return a4;
}

- (unsigned)ccAlgorithm:(id *)a3
{
  if (a3 && *a3) {
    uint64_t v5 = (void *)[*a3 copy];
  }
  else {
    uint64_t v5 = 0;
  }
  if (ccAlgorithm__onceToken != -1) {
    dispatch_once(&ccAlgorithm__onceToken, &__block_literal_global_2);
  }
  id v6 = [(MSAlgorithmIdentifier *)self algorithm];
  id v7 = [v6 OIDString];

  int v8 = (void *)ccAlgorithm__knownEncryptionAlgs;
  id v9 = [(MSAlgorithmIdentifier *)self algorithm];
  id v10 = [v9 OIDString];
  char v11 = [v8 objectForKeyedSubscript:v10];

  if (v11)
  {
    unsigned int v12 = [v11 unsignedIntValue];
    if (!a3) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v13 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -26275, v5, @"unknown ccAlg -- unexpected encryption algorithm: %@", v7 code underlyingError description];

    unsigned int v12 = 0;
    uint64_t v5 = (void *)v13;
    if (!a3) {
      goto LABEL_13;
    }
  }
  if (v5) {
    *a3 = v5;
  }
LABEL_13:

  return v12;
}

void __37__MSAlgorithmIdentifier_ccAlgorithm___block_invoke()
{
  v22[19] = *MEMORY[0x263EF8340];
  v21[0] = @"1.3.14.3.2.6";
  v20 = [NSNumber numberWithUnsignedInt:1];
  v22[0] = v20;
  v21[1] = @"1.3.14.3.2.7";
  v19 = [NSNumber numberWithUnsignedInt:1];
  v22[1] = v19;
  v21[2] = @"1.2.840.113549.3.7";
  v18 = [NSNumber numberWithUnsignedInt:2];
  v22[2] = v18;
  v21[3] = @"1.2.840.113549.3.2";
  objc_super v17 = [NSNumber numberWithUnsignedInt:5];
  v22[3] = v17;
  v21[4] = @"2.16.840.1.101.3.4.1.1";
  v16 = [NSNumber numberWithUnsignedInt:0];
  v22[4] = v16;
  v21[5] = @"2.16.840.1.101.3.4.1.2";
  id v15 = [NSNumber numberWithUnsignedInt:0];
  v22[5] = v15;
  v21[6] = @"2.16.840.1.101.3.4.1.21";
  uint64_t v14 = [NSNumber numberWithUnsignedInt:0];
  v22[6] = v14;
  v21[7] = @"2.16.840.1.101.3.4.1.22";
  uint64_t v13 = [NSNumber numberWithUnsignedInt:0];
  v22[7] = v13;
  v21[8] = @"2.16.840.1.101.3.4.1.41";
  unsigned int v12 = [NSNumber numberWithUnsignedInt:0];
  v22[8] = v12;
  v21[9] = @"2.16.840.1.101.3.4.1.42";
  v0 = [NSNumber numberWithUnsignedInt:0];
  v22[9] = v0;
  v21[10] = @"2.16.840.1.101.3.4.1.7";
  v1 = [NSNumber numberWithUnsignedInt:0];
  v22[10] = v1;
  v21[11] = @"2.16.840.1.101.3.4.1.6";
  v2 = [NSNumber numberWithUnsignedInt:0];
  v22[11] = v2;
  v21[12] = @"2.16.840.1.101.3.4.1.47";
  objc_super v3 = [NSNumber numberWithUnsignedInt:0];
  v22[12] = v3;
  v21[13] = @"2.16.840.1.101.3.4.1.46";
  id v4 = [NSNumber numberWithUnsignedInt:0];
  v22[13] = v4;
  v21[14] = @"2.16.840.1.101.3.4.1.27";
  uint64_t v5 = [NSNumber numberWithUnsignedInt:0];
  v22[14] = v5;
  v21[15] = @"2.16.840.1.101.3.4.1.26";
  id v6 = [NSNumber numberWithUnsignedInt:0];
  v22[15] = v6;
  v21[16] = @"2.16.840.1.101.3.4.1.5";
  id v7 = [NSNumber numberWithUnsignedInt:1];
  v22[16] = v7;
  v21[17] = @"2.16.840.1.101.3.4.1.25";
  int v8 = [NSNumber numberWithUnsignedInt:1];
  v22[17] = v8;
  v21[18] = @"2.16.840.1.101.3.4.1.45";
  id v9 = [NSNumber numberWithUnsignedInt:1];
  v22[18] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:19];
  char v11 = (void *)ccAlgorithm__knownEncryptionAlgs;
  ccAlgorithm__knownEncryptionAlgs = v10;
}

- (unsigned)ccMode:(id *)a3
{
  if (a3 && *a3) {
    uint64_t v5 = (void *)[*a3 copy];
  }
  else {
    uint64_t v5 = 0;
  }
  if (ccMode__onceToken != -1) {
    dispatch_once(&ccMode__onceToken, &__block_literal_global_20);
  }
  id v6 = [(MSAlgorithmIdentifier *)self algorithm];
  id v7 = [v6 OIDString];

  int v8 = [(id)ccMode__knownEncryptionAlgs objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    unsigned int v10 = [v8 unsignedIntValue];
    if (!a3) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v11 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -26275, v5, @"unknown ccMode -- unexpected encryption algorithm: %@", v7 code underlyingError description];

    unsigned int v10 = 0;
    uint64_t v5 = (void *)v11;
    if (!a3) {
      goto LABEL_13;
    }
  }
  if (v5) {
    *a3 = v5;
  }
LABEL_13:

  return v10;
}

void __32__MSAlgorithmIdentifier_ccMode___block_invoke()
{
  v19[16] = *MEMORY[0x263EF8340];
  v18[0] = @"1.3.14.3.2.6";
  objc_super v17 = [NSNumber numberWithUnsignedInt:1];
  v19[0] = v17;
  v18[1] = @"1.3.14.3.2.7";
  v16 = [NSNumber numberWithUnsignedInt:2];
  v19[1] = v16;
  v18[2] = @"1.2.840.113549.3.7";
  id v15 = [NSNumber numberWithUnsignedInt:2];
  v19[2] = v15;
  v18[3] = @"1.2.840.113549.3.2";
  uint64_t v14 = [NSNumber numberWithUnsignedInt:2];
  v19[3] = v14;
  v18[4] = @"2.16.840.1.101.3.4.1.1";
  uint64_t v13 = [NSNumber numberWithUnsignedInt:1];
  v19[4] = v13;
  v18[5] = @"2.16.840.1.101.3.4.1.2";
  unsigned int v12 = [NSNumber numberWithUnsignedInt:2];
  v19[5] = v12;
  v18[6] = @"2.16.840.1.101.3.4.1.21";
  v0 = [NSNumber numberWithUnsignedInt:1];
  v19[6] = v0;
  v18[7] = @"2.16.840.1.101.3.4.1.22";
  v1 = [NSNumber numberWithUnsignedInt:2];
  v19[7] = v1;
  v18[8] = @"2.16.840.1.101.3.4.1.41";
  v2 = [NSNumber numberWithUnsignedInt:1];
  v19[8] = v2;
  v18[9] = @"2.16.840.1.101.3.4.1.42";
  objc_super v3 = [NSNumber numberWithUnsignedInt:2];
  v19[9] = v3;
  v18[10] = @"2.16.840.1.101.3.4.1.7";
  id v4 = [NSNumber numberWithUnsignedInt:12];
  v19[10] = v4;
  v18[11] = @"2.16.840.1.101.3.4.1.6";
  uint64_t v5 = [NSNumber numberWithUnsignedInt:11];
  v19[11] = v5;
  v18[12] = @"2.16.840.1.101.3.4.1.47";
  id v6 = [NSNumber numberWithUnsignedInt:12];
  v19[12] = v6;
  v18[13] = @"2.16.840.1.101.3.4.1.46";
  id v7 = [NSNumber numberWithUnsignedInt:11];
  v19[13] = v7;
  v18[14] = @"2.16.840.1.101.3.4.1.27";
  int v8 = [NSNumber numberWithUnsignedInt:12];
  v19[14] = v8;
  v18[15] = @"2.16.840.1.101.3.4.1.26";
  id v9 = [NSNumber numberWithUnsignedInt:11];
  v19[15] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:16];
  uint64_t v11 = (void *)ccMode__knownEncryptionAlgs;
  ccMode__knownEncryptionAlgs = v10;
}

- (unint64_t)blockSize:(id *)a3
{
  if (a3 && *a3) {
    uint64_t v5 = (void *)[*a3 copy];
  }
  else {
    uint64_t v5 = 0;
  }
  if (blockSize__onceToken != -1) {
    dispatch_once(&blockSize__onceToken, &__block_literal_global_25);
  }
  id v6 = [(MSAlgorithmIdentifier *)self algorithm];
  id v7 = [v6 OIDString];

  int v8 = [(id)blockSize__knownEncryptionAlgs objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 unsignedIntValue];
    if (!a3) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v11 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -26275, v5, @"unknown blockSize -- unexpected encryption algorithm: %@", v7 code underlyingError description];

    unint64_t v10 = 0;
    uint64_t v5 = (void *)v11;
    if (!a3) {
      goto LABEL_13;
    }
  }
  if (v5) {
    *a3 = v5;
  }
LABEL_13:

  return v10;
}

void __35__MSAlgorithmIdentifier_blockSize___block_invoke()
{
  v22[19] = *MEMORY[0x263EF8340];
  v21[0] = @"1.3.14.3.2.6";
  v20 = [NSNumber numberWithUnsignedInt:8];
  v22[0] = v20;
  v21[1] = @"1.3.14.3.2.7";
  v19 = [NSNumber numberWithUnsignedInt:8];
  v22[1] = v19;
  v21[2] = @"1.2.840.113549.3.7";
  v18 = [NSNumber numberWithUnsignedInt:8];
  v22[2] = v18;
  v21[3] = @"1.2.840.113549.3.2";
  objc_super v17 = [NSNumber numberWithUnsignedInt:8];
  v22[3] = v17;
  v21[4] = @"2.16.840.1.101.3.4.1.1";
  v16 = [NSNumber numberWithUnsignedInt:16];
  v22[4] = v16;
  v21[5] = @"2.16.840.1.101.3.4.1.2";
  id v15 = [NSNumber numberWithUnsignedInt:16];
  v22[5] = v15;
  v21[6] = @"2.16.840.1.101.3.4.1.21";
  uint64_t v14 = [NSNumber numberWithUnsignedInt:16];
  v22[6] = v14;
  v21[7] = @"2.16.840.1.101.3.4.1.22";
  uint64_t v13 = [NSNumber numberWithUnsignedInt:16];
  v22[7] = v13;
  v21[8] = @"2.16.840.1.101.3.4.1.41";
  unsigned int v12 = [NSNumber numberWithUnsignedInt:16];
  v22[8] = v12;
  v21[9] = @"2.16.840.1.101.3.4.1.42";
  v0 = [NSNumber numberWithUnsignedInt:16];
  v22[9] = v0;
  v21[10] = @"2.16.840.1.101.3.4.1.7";
  v1 = [NSNumber numberWithUnsignedInt:16];
  v22[10] = v1;
  v21[11] = @"2.16.840.1.101.3.4.1.6";
  v2 = [NSNumber numberWithUnsignedInt:16];
  v22[11] = v2;
  v21[12] = @"2.16.840.1.101.3.4.1.47";
  objc_super v3 = [NSNumber numberWithUnsignedInt:16];
  v22[12] = v3;
  v21[13] = @"2.16.840.1.101.3.4.1.46";
  id v4 = [NSNumber numberWithUnsignedInt:16];
  v22[13] = v4;
  v21[14] = @"2.16.840.1.101.3.4.1.27";
  uint64_t v5 = [NSNumber numberWithUnsignedInt:16];
  v22[14] = v5;
  v21[15] = @"2.16.840.1.101.3.4.1.26";
  id v6 = [NSNumber numberWithUnsignedInt:16];
  v22[15] = v6;
  v21[16] = @"2.16.840.1.101.3.4.1.5";
  id v7 = [NSNumber numberWithUnsignedInt:16];
  v22[16] = v7;
  v21[17] = @"2.16.840.1.101.3.4.1.25";
  int v8 = [NSNumber numberWithUnsignedInt:16];
  v22[17] = v8;
  v21[18] = @"2.16.840.1.101.3.4.1.45";
  id v9 = [NSNumber numberWithUnsignedInt:16];
  v22[18] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:19];
  uint64_t v11 = (void *)blockSize__knownEncryptionAlgs;
  blockSize__knownEncryptionAlgs = v10;
}

- (unint64_t)keySize:(id *)a3
{
  if (a3 && *a3) {
    uint64_t v5 = (void *)[*a3 copy];
  }
  else {
    uint64_t v5 = 0;
  }
  if (keySize__onceToken != -1) {
    dispatch_once(&keySize__onceToken, &__block_literal_global_30);
  }
  id v6 = [(MSAlgorithmIdentifier *)self algorithm];
  id v7 = [v6 OIDString];

  int v8 = [(id)keySize__knownEncryptionAlgs objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 unsignedIntValue];
    if (!a3) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v11 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -26275, v5, @"unknown keySize -- unexpected encryption algorithm: %@", v7 code underlyingError description];

    unint64_t v10 = 0;
    uint64_t v5 = (void *)v11;
    if (!a3) {
      goto LABEL_13;
    }
  }
  if (v5) {
    *a3 = v5;
  }
LABEL_13:

  return v10;
}

void __33__MSAlgorithmIdentifier_keySize___block_invoke()
{
  v22[19] = *MEMORY[0x263EF8340];
  v21[0] = @"1.3.14.3.2.6";
  v20 = [NSNumber numberWithUnsignedInt:8];
  v22[0] = v20;
  v21[1] = @"1.3.14.3.2.7";
  v19 = [NSNumber numberWithUnsignedInt:8];
  v22[1] = v19;
  v21[2] = @"1.2.840.113549.3.7";
  v18 = [NSNumber numberWithUnsignedInt:24];
  v22[2] = v18;
  v21[3] = @"1.2.840.113549.3.2";
  objc_super v17 = [NSNumber numberWithUnsignedInt:128];
  v22[3] = v17;
  v21[4] = @"2.16.840.1.101.3.4.1.1";
  v16 = [NSNumber numberWithUnsignedInt:16];
  v22[4] = v16;
  v21[5] = @"2.16.840.1.101.3.4.1.2";
  id v15 = [NSNumber numberWithUnsignedInt:16];
  v22[5] = v15;
  v21[6] = @"2.16.840.1.101.3.4.1.21";
  uint64_t v14 = [NSNumber numberWithUnsignedInt:24];
  v22[6] = v14;
  v21[7] = @"2.16.840.1.101.3.4.1.22";
  uint64_t v13 = [NSNumber numberWithUnsignedInt:24];
  v22[7] = v13;
  v21[8] = @"2.16.840.1.101.3.4.1.41";
  unsigned int v12 = [NSNumber numberWithUnsignedInt:32];
  v22[8] = v12;
  v21[9] = @"2.16.840.1.101.3.4.1.42";
  v0 = [NSNumber numberWithUnsignedInt:32];
  v22[9] = v0;
  v21[10] = @"2.16.840.1.101.3.4.1.7";
  v1 = [NSNumber numberWithUnsignedInt:16];
  v22[10] = v1;
  v21[11] = @"2.16.840.1.101.3.4.1.6";
  v2 = [NSNumber numberWithUnsignedInt:16];
  v22[11] = v2;
  v21[12] = @"2.16.840.1.101.3.4.1.47";
  objc_super v3 = [NSNumber numberWithUnsignedInt:32];
  v22[12] = v3;
  v21[13] = @"2.16.840.1.101.3.4.1.46";
  id v4 = [NSNumber numberWithUnsignedInt:32];
  v22[13] = v4;
  v21[14] = @"2.16.840.1.101.3.4.1.27";
  uint64_t v5 = [NSNumber numberWithUnsignedInt:24];
  v22[14] = v5;
  v21[15] = @"2.16.840.1.101.3.4.1.26";
  id v6 = [NSNumber numberWithUnsignedInt:24];
  v22[15] = v6;
  v21[16] = @"2.16.840.1.101.3.4.1.5";
  id v7 = [NSNumber numberWithUnsignedInt:16];
  v22[16] = v7;
  v21[17] = @"2.16.840.1.101.3.4.1.25";
  int v8 = [NSNumber numberWithUnsignedInt:24];
  v22[17] = v8;
  v21[18] = @"2.16.840.1.101.3.4.1.45";
  id v9 = [NSNumber numberWithUnsignedInt:32];
  v22[18] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:19];
  uint64_t v11 = (void *)keySize__knownEncryptionAlgs;
  keySize__knownEncryptionAlgs = v10;
}

- (AlgorithmIdentifier)asn1AlgId
{
  return self->_asn1AlgId;
}

@end