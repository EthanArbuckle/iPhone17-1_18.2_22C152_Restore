@interface MSCMSAttribute
+ (id)decodeAttribute:(Attribute *)a3 error:(id *)a4;
- (Attribute)encodedAttribute;
- (Attribute)generateAttributeStruct;
- (MSCMSAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSAttribute)initWithAttributeStruct:(Attribute *)a3 error:(id *)a4;
- (MSCMSAttribute)initWithAttributeType:(id)a3 values:(id)a4;
- (MSCMSAttribute)initWithDER:(id)a3;
- (MSOID)attributeType;
- (NSArray)attributeValues;
- (NSData)attributeDERData;
- (void)dealloc;
- (void)setAttributeDERData:(id)a3;
- (void)setEncodedAttribute:(Attribute *)a3;
@end

@implementation MSCMSAttribute

- (MSCMSAttribute)initWithAttributeStruct:(Attribute *)a3 error:(id *)a4
{
  v18.receiver = self;
  v18.super_class = (Class)MSCMSAttribute;
  v6 = [(MSCMSAttribute *)&v18 init];
  if (!v6)
  {
LABEL_13:
    v9 = v6;
    goto LABEL_17;
  }
  v7 = (Attribute *)malloc_type_malloc(0x20uLL, 0x10300406495394CuLL);
  v6->_encodedAttribute = v7;
  if (v7)
  {
    int v8 = copy_Attribute();
    if (v8)
    {
      if (a4)
      {
        *a4 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:v8 underlyingError:*a4 description:@"unable to copy Attribute"];
      }
      goto LABEL_16;
    }
    uint64_t v10 = +[MSOID OIDWithAsn1OID:a3 error:a4];
    attributeType = v6->_attributeType;
    v6->_attributeType = (MSOID *)v10;

    if (!v6->_attributeType)
    {
      free_Attribute();
LABEL_16:
      free(v6->_encodedAttribute);
      v9 = 0;
      v6->_encodedAttribute = 0;
      goto LABEL_17;
    }
    v12 = [MEMORY[0x263EFF980] arrayWithCapacity:a3->var1.var0];
    if (a3->var1.var0)
    {
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      do
      {
        v15 = [MEMORY[0x263EFF8F8] dataWithBytes:a3->var1.var1[v13].var1 length:a3->var1.var1[v13].var0];
        [(NSArray *)v12 addObject:v15];

        ++v14;
        ++v13;
      }
      while (v14 < a3->var1.var0);
    }
    attributeValues = v6->_attributeValues;
    v6->_attributeValues = v12;

    goto LABEL_13;
  }
  if (a4)
  {
    +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:-108 underlyingError:*a4 description:@"unable to allocate Attribute"];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_17:

  return v9;
}

- (MSCMSAttribute)initWithDER:(id)a3
{
  id v4 = a3;
  v5 = (MSCMSAttribute *)malloc_type_malloc(0x20uLL, 0x10300406495394CuLL);
  if (v5)
  {
    id v6 = v4;
    [v6 bytes];
    [v6 length];
    if (decode_Attribute())
    {
      free(v5);
      v5 = 0;
    }
    else
    {
      v7 = [(MSCMSAttribute *)self initWithAttributeStruct:v5 error:0];
      int v8 = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_attributeDERData, v6);
        free_Attribute();
        free(v5);
      }
      self = v8;
      v5 = self;
    }
  }

  return v5;
}

- (MSCMSAttribute)initWithAttributeType:(id)a3 values:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSCMSAttribute;
  v9 = [(MSCMSAttribute *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributeType, a3);
    objc_storeStrong((id *)&v10->_attributeValues, a4);
  }

  return v10;
}

- (MSCMSAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  v5 = (MSCMSAttribute *)a3;

  return v5;
}

+ (id)decodeAttribute:(Attribute *)a3 error:(id *)a4
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithAttributeStruct:a3 error:a4];

  return v4;
}

- (Attribute)generateAttributeStruct
{
  if (self->_encodedAttribute)
  {
    free_Attribute();
    free(self->_encodedAttribute);
  }
  self->_encodedAttribute = (Attribute *)malloc_type_malloc(0x20uLL, 0x10300406495394CuLL);
  v6[5] = [(MSOID *)self->_attributeType Asn1OID];
  v6[6] = v3;
  der_copy_oid();
  self->_encodedAttribute->var1.var0 = [(NSArray *)self->_attributeValues count];
  self->_encodedAttribute->var1.var1 = (heim_base_data *)malloc_type_malloc(16 * [(NSArray *)self->_attributeValues count], 0x108004057E67DB5uLL);
  attributeValues = self->_attributeValues;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__MSCMSAttribute_generateAttributeStruct__block_invoke;
  v6[3] = &unk_26411CB00;
  v6[4] = self;
  [(NSArray *)attributeValues enumerateObjectsUsingBlock:v6];
  return self->_encodedAttribute;
}

uint64_t __41__MSCMSAttribute_generateAttributeStruct__block_invoke(uint64_t a1, id a2, uint64_t a3)
{
  id v5 = a2;
  v8[1] = [v5 bytes];
  unsigned int v6 = [v5 length];

  v8[0] = v6;
  return MEMORY[0x21055FEC0](v8, *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 24) + 16 * a3);
}

- (void)dealloc
{
  encodedAttribute = self->_encodedAttribute;
  if (encodedAttribute)
  {
    free_Attribute();
    encodedAttribute = self->_encodedAttribute;
  }
  free(encodedAttribute);
  self->_encodedAttribute = 0;
  v4.receiver = self;
  v4.super_class = (Class)MSCMSAttribute;
  [(MSCMSAttribute *)&v4 dealloc];
}

- (MSOID)attributeType
{
  return (MSOID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeValues
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)attributeDERData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttributeDERData:(id)a3
{
}

- (Attribute)encodedAttribute
{
  return self->_encodedAttribute;
}

- (void)setEncodedAttribute:(Attribute *)a3
{
  self->_encodedAttribute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeDERData, 0);
  objc_storeStrong((id *)&self->_attributeValues, 0);

  objc_storeStrong((id *)&self->_attributeType, 0);
}

@end