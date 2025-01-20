@interface MSCMSContentTypeAttribute
+ (id)contentTypeAttributeWithOID:(id)a3;
- (MSCMSContentTypeAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSContentTypeAttribute)initWithOID:(id)a3;
- (MSOID)attributeType;
- (MSOID)contentType;
- (id)encodeAttributeWithError:(id *)a3;
- (void)setContentType:(id)a3;
@end

@implementation MSCMSContentTypeAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113549.1.9.3" error:0];
}

- (MSCMSContentTypeAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 attributeType];
  char v8 = [v7 isEqualToString:@"1.2.840.113549.1.9.3"];

  if ((v8 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_12;
    }
    v14 = MSErrorCMSDomain[0];
    id v16 = *a4;
    v17 = @"Not a ContentType attribute according to AttributeType";
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
    v17 = @"ContentType attribute contains more than one value";
    goto LABEL_10;
  }
  v11 = objc_msgSend(v6, "attributeValues", 0, 0);
  v12 = [v11 objectAtIndex:0];
  int v13 = nsheim_decode_ContentType(v12);

  if (v13)
  {
    if (a4)
    {
      v14 = MSErrorASN1Domain[0];
      uint64_t v15 = v13;
      id v16 = *a4;
      v17 = @"unable to decode ContentType";
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
  v19 = +[MSOID OIDWithAsn1OID:&v21 error:a4];
  if (v19)
  {
    free_ContentType();
    self = [(MSCMSContentTypeAttribute *)self initWithOID:v19];
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
  v22[0] = [(MSOID *)self->_contentType Asn1OID];
  v22[1] = v4;
  uint64_t v21 = 0;
  uint64_t v5 = length_ContentType((uint64_t)v22);
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
  int v8 = encode_ContentType([v7 mutableBytes] + v5 - 1, v5, (uint64_t)v22, (uint64_t)&v21);
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
    v24[0] = @"Failed encoding type ContentType";
    v12 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, &v23, 1, v21);
    *a3 = [v11 errorWithDomain:@"com.apple.HeimASN1" code:v10 userInfo:v12];

    goto LABEL_5;
  }
  if (v5 != v21)
  {
    v18 = (MSCMSContentTypeAttribute *)asn1_abort();
    return [(MSCMSContentTypeAttribute *)v18 initWithOID:v20];
  }
LABEL_9:
  if (objc_msgSend(v7, "length", v21))
  {
    int v13 = [MSCMSAttribute alloc];
    v14 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.3" error:a3];
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
    id v16 = [(MSCMSAttribute *)v13 initWithAttributeType:v14 values:v15];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (MSCMSContentTypeAttribute)initWithOID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (initWithOID__onceToken != -1) {
    dispatch_once(&initWithOID__onceToken, &__block_literal_global_4);
  }
  uint64_t v5 = initWithOID__sKnownContentTypes;
  id v6 = [v4 OIDString];
  LOBYTE(v5) = [(id)v5 containsObject:v6];

  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)MSCMSContentTypeAttribute;
    id v7 = [(MSCMSContentTypeAttribute *)&v14 init];
    int v8 = v7;
    if (v7) {
      [(MSCMSContentTypeAttribute *)v7 setContentType:v4];
    }
    self = v8;
    int v9 = self;
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_146);
    }
    uint64_t v10 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      v12 = [v4 OIDString];
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_20D8A1000, v11, OS_LOG_TYPE_ERROR, "Found unknown content type: %@", buf, 0xCu);
    }
    int v9 = 0;
  }

  return v9;
}

void __41__MSCMSContentTypeAttribute_initWithOID___block_invoke()
{
  v4[9] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"1.2.840.113549.1.7.1";
  v4[1] = @"1.2.840.113549.1.7.2";
  v4[2] = @"1.2.840.113549.1.7.3";
  v4[3] = @"1.2.840.113549.1.7.5";
  v4[4] = @"1.2.840.113549.1.7.6";
  v4[5] = @"1.2.840.113549.1.9.16.1.2";
  v4[6] = @"1.2.840.113549.1.9.16.1.23";
  v4[7] = @"1.2.840.113549.1.9.16.1.9";
  v4[8] = @"1.2.840.113549.1.9.16.1.4";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:9];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithOID__sKnownContentTypes;
  initWithOID__sKnownContentTypes = v2;
}

uint64_t __41__MSCMSContentTypeAttribute_initWithOID___block_invoke_2()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)contentTypeAttributeWithOID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithOID:v4];

  return v5;
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end