@interface MSCMSSMIMECapabilitiesAttribute
- (MSCMSSMIMECapabilitiesAttribute)init;
- (MSCMSSMIMECapabilitiesAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSSMIMECapabilitiesAttribute)initWithCapabilities:(id)a3;
- (MSOID)attributeType;
- (NSSet)capabilities;
- (id)copyAttributeData:(id *)a3;
- (id)encodeAttributeWithError:(id *)a3;
@end

@implementation MSCMSSMIMECapabilitiesAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113549.1.9.15" error:0];
}

- (MSCMSSMIMECapabilitiesAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MSCMSSMIMECapabilitiesAttribute;
  v7 = [(MSCMSSMIMECapabilitiesAttribute *)&v24 init];
  v8 = [v6 attributeType];
  char v9 = [v8 isEqualToString:@"1.2.840.113549.1.9.15"];

  if ((v9 & 1) == 0)
  {
    if (a4)
    {
      v15 = MSErrorCMSDomain[0];
      id v17 = *a4;
      v18 = @"Not an SMIMECapabilities attribute according to AttributeType";
      uint64_t v16 = -26275;
      goto LABEL_10;
    }
LABEL_11:
    v19 = 0;
    goto LABEL_13;
  }
  v10 = [v6 attributeValues];
  uint64_t v11 = [v10 count];

  if (v11 != 1)
  {
    if (a4)
    {
      v15 = MSErrorCMSDomain[0];
      id v17 = *a4;
      v18 = @"SMIME Capabilities Attribute should only have one value";
      uint64_t v16 = -50;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  v12 = [v6 attributeValues];
  v13 = [v12 objectAtIndex:0];
  v14 = (void *)nsheim_decode_SMIMECapabilities(v13);

  if (!v14)
  {
    v20 = [MEMORY[0x263EFF9C0] set];
    objc_storeStrong((id *)&v7->_capabilities, v20);
    free_SMIMECapabilities();
    v19 = v7;

    goto LABEL_13;
  }
  if (!a4) {
    goto LABEL_11;
  }
  asn1ErrorToNSError(v14, a4);
  v15 = MSErrorASN1Domain[0];
  uint64_t v16 = (int)v14;
  id v17 = *a4;
  v18 = @"unable to decode SMIME Capabilities Attribute";
LABEL_10:
  +[MSError MSErrorWithDomain:v15 code:v16 underlyingError:v17 description:v18];
  v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v19;
}

- (MSCMSSMIMECapabilitiesAttribute)init
{
  v12.receiver = self;
  v12.super_class = (Class)MSCMSSMIMECapabilitiesAttribute;
  v2 = [(MSCMSSMIMECapabilitiesAttribute *)&v12 init];
  v3 = [MEMORY[0x263EFF9C0] set];
  for (uint64_t i = 0; i != 56; i += 8)
  {
    v5 = [MSOID alloc];
    uint64_t v6 = *(uint64_t *)((char *)&off_26411CB48 + i);
    id v11 = 0;
    v7 = [(MSOID *)v5 initWithAsn1OID:v6 error:&v11];
    id v8 = v11;
    [(NSSet *)v3 addObject:v7];
  }
  capabilities = v2->_capabilities;
  v2->_capabilities = v3;

  return v2;
}

- (MSCMSSMIMECapabilitiesAttribute)initWithCapabilities:(id)a3
{
  v4 = (NSSet *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MSCMSSMIMECapabilitiesAttribute;
  v5 = [(MSCMSSMIMECapabilitiesAttribute *)&v8 init];
  capabilities = v5->_capabilities;
  v5->_capabilities = v4;

  return v5;
}

- (id)copyAttributeData:(id *)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  capabilities = self->_capabilities;
  if (!capabilities) {
    return 0;
  }
  long long v20 = [(NSSet *)capabilities count];
  uint64_t v6 = malloc_type_malloc(24 * v20, 0x10300406712BA52uLL);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v7 = self->_capabilities;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __53__MSCMSSMIMECapabilitiesAttribute_copyAttributeData___block_invoke;
  v18[3] = &unk_26411CB88;
  v18[4] = v19;
  v18[5] = v6;
  [(NSSet *)v7 enumerateObjectsUsingBlock:v18];
  *((void *)&v20 + 1) = v6;
  uint64_t v17 = 0;
  uint64_t v8 = length_SMIMECapabilities((uint64_t)&v20);
  char v9 = [MEMORY[0x263EFF990] dataWithLength:v8];
  if (!v9)
  {
    uint64_t v12 = 12;
    if (!a3)
    {
LABEL_9:
      id v10 = 0;
LABEL_11:
      free(v6);
      *((void *)&v20 + 1) = 0;
      id v13 = v10;
      _Block_object_dispose(v19, 8);

      return v13;
    }
LABEL_8:
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    v22[0] = @"Failed encoding type SMIMECapabilities";
    v15 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, v17);
    *a3 = [v14 errorWithDomain:@"com.apple.HeimASN1" code:v12 userInfo:v15];

    goto LABEL_9;
  }
  id v10 = v9;
  int v11 = encode_SMIMECapabilities([v10 mutableBytes] + v8 - 1, v8, (uint64_t)&v20, (uint64_t)&v17);
  if (v11)
  {

    uint64_t v12 = v11;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v8 == v17) {
    goto LABEL_11;
  }
  id result = (id)asn1_abort();
  __break(1u);
  return result;
}

uint64_t __53__MSCMSSMIMECapabilitiesAttribute_copyAttributeData___block_invoke(uint64_t a1, void *a2)
{
  v3 = (uint64_t *)(*(void *)(a1 + 40) + 24 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t result = [a2 Asn1OID];
  uint64_t *v3 = result;
  v3[1] = v5;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)encodeAttributeWithError:(id *)a3
{
  id v4 = -[MSCMSSMIMECapabilitiesAttribute copyAttributeData:](self, "copyAttributeData:");
  if (v4)
  {
    uint64_t v5 = [MSCMSAttribute alloc];
    uint64_t v6 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.15" error:a3];
    v7 = [MEMORY[0x263EFF8C0] arrayWithObject:v4];
    uint64_t v8 = [(MSCMSAttribute *)v5 initWithAttributeType:v6 values:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (NSSet)capabilities
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end