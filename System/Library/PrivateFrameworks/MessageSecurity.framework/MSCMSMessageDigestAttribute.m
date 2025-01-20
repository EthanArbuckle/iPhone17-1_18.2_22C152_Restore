@interface MSCMSMessageDigestAttribute
+ (id)messageDigestAttributeWithDigest:(id)a3;
- (MSCMSMessageDigestAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSMessageDigestAttribute)initWithDigest:(id)a3;
- (MSOID)attributeType;
- (NSData)messageDigest;
- (id)encodeAttributeWithError:(id *)a3;
- (void)setMessageDigest:(id)a3;
@end

@implementation MSCMSMessageDigestAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113549.1.9.4" error:0];
}

- (MSCMSMessageDigestAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 attributeType];
  char v8 = [v7 isEqualToString:@"1.2.840.113549.1.9.4"];

  if ((v8 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_12;
    }
    v14 = MSErrorCMSDomain[0];
    id v16 = *a4;
    v17 = @"Not a MessageDigest attribute according to AttributeType";
LABEL_10:
    uint64_t v15 = -26275;
    goto LABEL_11;
  }
  v9 = [v6 attributeValues];
  uint64_t v10 = [v9 count];

  if (v10 != 1)
  {
    if (!a4) {
      goto LABEL_12;
    }
    v14 = MSErrorCMSDomain[0];
    id v16 = *a4;
    v17 = @"MessageDigest attribute contains more than one value";
    goto LABEL_10;
  }
  v11 = [v6 attributeValues];
  v12 = [v11 objectAtIndex:0];
  int v13 = nsheim_decode_MessageDigest(v12);

  if (v13)
  {
    if (a4)
    {
      v14 = MSErrorASN1Domain[0];
      uint64_t v15 = v13;
      id v16 = *a4;
      v17 = @"unable to decode MessageDigest";
LABEL_11:
      +[MSError MSErrorWithDomain:v14 code:v15 underlyingError:v16 description:v17];
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_12:
    v18 = 0;
    goto LABEL_17;
  }
  v19 = [MEMORY[0x263EFF8F8] dataWithBytes:0 length:0];
  if (v19)
  {
    free_MessageDigest();
    self = [(MSCMSMessageDigestAttribute *)self initWithDigest:v19];
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

LABEL_17:
  return v18;
}

- (id)encodeAttributeWithError:(id *)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  v22[0] = [(NSData *)self->_messageDigest length];
  v22[1] = [(NSData *)self->_messageDigest bytes];
  uint64_t v21 = 0;
  uint64_t v5 = length_MessageDigest((uint64_t)v22);
  id v6 = [MEMORY[0x263EFF990] dataWithLength:v5];
  if (!v6)
  {
    uint64_t v10 = 12;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v7 = v6;
  int v8 = encode_MessageDigest([v7 mutableBytes] + v5 - 1, v5, (uint64_t)v22, (uint64_t)&v21);
  if (v8)
  {
    int v9 = v8;

    uint64_t v10 = v9;
    if (!a3)
    {
LABEL_5:
      id v7 = 0;
      goto LABEL_9;
    }
LABEL_4:
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08320];
    v24[0] = @"Failed encoding type MessageDigest";
    v12 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, &v23, 1, v21);
    *a3 = [v11 errorWithDomain:@"com.apple.HeimASN1" code:v10 userInfo:v12];

    goto LABEL_5;
  }
  if (v5 != v21)
  {
    v18 = (MSCMSMessageDigestAttribute *)asn1_abort();
    return [(MSCMSMessageDigestAttribute *)v18 initWithDigest:v20];
  }
LABEL_9:
  if (objc_msgSend(v7, "length", v21))
  {
    int v13 = [MSCMSAttribute alloc];
    v14 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.4" error:a3];
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
    id v16 = [(MSCMSAttribute *)v13 initWithAttributeType:v14 values:v15];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (MSCMSMessageDigestAttribute)initWithDigest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length] == 16
    || [v4 length] == 20
    || [v4 length] == 28
    || [v4 length] == 32
    || [v4 length] == 48
    || [v4 length] == 64)
  {
    v11.receiver = self;
    v11.super_class = (Class)MSCMSMessageDigestAttribute;
    uint64_t v5 = [(MSCMSMessageDigestAttribute *)&v11 init];
    id v6 = v5;
    if (v5) {
      [(MSCMSMessageDigestAttribute *)v5 setMessageDigest:v4];
    }
    self = v6;
    id v7 = self;
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_178);
    }
    int v9 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v9;
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = [v4 length];
      _os_log_impl(&dword_20D8A1000, v10, OS_LOG_TYPE_ERROR, "Digest length %lu is not a supported length", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __46__MSCMSMessageDigestAttribute_initWithDigest___block_invoke()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)messageDigestAttributeWithDigest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithDigest:v4];

  return v5;
}

- (NSData)messageDigest
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessageDigest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end