@interface MSCMSMutableAttributeArray
+ (id)createAttributeArrayFromAttributeSetRaw:(heim_base_data *)a3 error:(id *)a4;
- (MSCMSMutableAttributeArray)initWithCapacity:(unint64_t)a3;
- (NSData)encodedAttributeSet;
- (NSMutableArray)attributes;
- (NSMutableArray)genericAttributes;
- (id)calculateAttributesWithDigest:(id)a3 error:(id *)a4;
- (id)encodeAttributesWithError:(id *)a3;
- (id)encodeImplicitAttributesWithError:(id *)a3;
- (id)getAttributesWithType:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAttributes:(id)a3;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)reset;
- (void)setAttributes:(id)a3;
- (void)setEncodedAttributeSet:(id)a3;
- (void)setGenericAttributes:(id)a3;
@end

@implementation MSCMSMutableAttributeArray

+ (id)createAttributeArrayFromAttributeSetRaw:(heim_base_data *)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  v5 = [[MSCMSMutableAttributeArray alloc] initWithCapacity:0];
  id v6 = [MEMORY[0x263EFF990] data];
  uint64_t v28 = 0;
  v29 = 0;
  unint64_t var0 = a3->var0;
  if (a3->var0)
  {
    v8 = 0;
    var1 = (char *)a3->var1;
    while (1)
    {
      memset(v27, 0, sizeof(v27));
      uint64_t v26 = 0;
      int v10 = decode_Attribute();
      if (v10) {
        break;
      }
      id v25 = v8;
      v11 = +[MSCMSAttribute decodeAttribute:v27 error:&v25];
      id v12 = v25;

      if (v11) {
        [(MSCMSMutableAttributeArray *)v5 addObject:v11];
      }
      var0 -= v26;
      var1 += v26;
      free_Attribute();

      v8 = v12;
      if (!var0) {
        goto LABEL_9;
      }
    }
    id v12 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:v10 underlyingError:v8 description:@"unable to decode CMSAttributes"];

    goto LABEL_13;
  }
  id v12 = 0;
LABEL_9:
  v29 = a3;
  LODWORD(v28) = 1;
  *(void *)&v27[0] = 0;
  uint64_t v13 = length_CMSOrderedAttributes((uint64_t)&v28);
  v14 = [MEMORY[0x263EFF990] dataWithLength:v13];

  if (!v14)
  {
    uint64_t v17 = 12;
    goto LABEL_15;
  }
  id v6 = v14;
  int v15 = encode_CMSOrderedAttributes([v6 mutableBytes] + v13 - 1, v13, (uint64_t)&v28, (uint64_t)v27);
  if (v15)
  {
    int v16 = v15;

    uint64_t v17 = v16;
LABEL_15:
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = @"Failed encoding type CMSOrderedAttributes";
    v19 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v20 = [v18 errorWithDomain:@"com.apple.HeimASN1" code:v17 userInfo:v19];

    id v6 = 0;
    id v12 = (id)v20;
    goto LABEL_17;
  }
  if (v13 != *(void *)&v27[0])
  {
    v22 = (MSCMSMutableAttributeArray *)asn1_abort();
    [(MSCMSMutableAttributeArray *)v22 reset];
    return result;
  }
LABEL_17:
  if ([v6 length] < a3->var0)
  {
LABEL_13:

    v5 = 0;
    goto LABEL_19;
  }
  [(MSCMSMutableAttributeArray *)v5 setEncodedAttributeSet:v6];
LABEL_19:
  if (a4 && v12) {
    *a4 = v12;
  }

  return v5;
}

- (void)reset
{
  encodedAttributeSet = self->_encodedAttributeSet;
  self->_encodedAttributeSet = 0;

  self->_encodedAttributeSet = [(MSCMSMutableAttributeArray *)self encodeAttributesWithError:0];

  MEMORY[0x270F9A758]();
}

- (MSCMSMutableAttributeArray)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MSCMSMutableAttributeArray;
  v4 = [(MSCMSMutableAttributeArray *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    attributes = v4->_attributes;
    v4->_attributes = (NSMutableArray *)v5;
  }
  return v4;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_attributes count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attributes objectAtIndex:a3];
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    [(NSMutableArray *)self->_attributes insertObject:a3 atIndex:a4];
    [(MSCMSMutableAttributeArray *)self reset];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  [(NSMutableArray *)self->_attributes removeObjectAtIndex:a3];

  [(MSCMSMutableAttributeArray *)self reset];
}

- (void)addObject:(id)a3
{
  if (a3)
  {
    -[NSMutableArray addObject:](self->_attributes, "addObject:");
    [(MSCMSMutableAttributeArray *)self reset];
  }
}

- (void)removeLastObject
{
  [(NSMutableArray *)self->_attributes removeLastObject];

  [(MSCMSMutableAttributeArray *)self reset];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (a4)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_attributes, "replaceObjectAtIndex:withObject:", a3);
    [(MSCMSMutableAttributeArray *)self reset];
  }
}

- (void)removeAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  int v16 = __Block_byref_object_dispose__1;
  id v17 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  objc_super v8 = __47__MSCMSMutableAttributeArray_removeAttributes___block_invoke;
  v9 = &unk_26411CAB0;
  id v5 = v4;
  id v10 = v5;
  v11 = &v12;
  [(MSCMSMutableAttributeArray *)self enumerateObjectsUsingBlock:&v6];
  -[MSCMSMutableAttributeArray removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", v13[5], v6, v7, v8, v9);

  _Block_object_dispose(&v12, 8);
}

void __47__MSCMSMutableAttributeArray_removeAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 encodeAttributeWithError:0];
  id v5 = [v7 attributeType];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addIndex:a3];
  }
}

- (id)encodeAttributesWithError:(id *)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  encodedAttributeSet = self->_encodedAttributeSet;
  if (!encodedAttributeSet)
  {
    if (![(MSCMSMutableAttributeArray *)self count])
    {
      id v4 = 0;
      goto LABEL_28;
    }
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__1;
    v37 = __Block_byref_object_dispose__1;
    if (a3)
    {
      id v7 = *a3;
      if (*a3) {
        id v7 = (id)[v7 copy];
      }
    }
    else
    {
      id v7 = 0;
    }
    id v38 = v7;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    id v8 = [MEMORY[0x263EFF990] data];
    v9 = malloc_type_malloc(32 * [(MSCMSMutableAttributeArray *)self count], 0x10300406495394CuLL);
    if (!v9)
    {
      if (a3)
      {
        int v16 = +[MSError MSErrorWithDomain:MSErrorAllocationDomain[0] code:-67672 underlyingError:v34[5] description:@"Unable to allocate attribute array"];
        id v17 = (void *)v34[5];
        v34[5] = (uint64_t)v16;

        id v18 = v16;
        id v4 = 0;
        *a3 = v18;
      }
      else
      {
        id v4 = 0;
      }
LABEL_27:

      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v33, 8);

      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[MSCMSMutableAttributeArray count](self, "count"));
    id v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    genericAttributes = self->_genericAttributes;
    self->_genericAttributes = v10;

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __56__MSCMSMutableAttributeArray_encodeAttributesWithError___block_invoke;
    v28[3] = &unk_26411CAD8;
    v28[4] = self;
    v28[5] = &v33;
    v28[6] = &v29;
    v28[7] = v9;
    [(MSCMSMutableAttributeArray *)self enumerateObjectsUsingBlock:v28];
    if (*((unsigned char *)v30 + 24))
    {
LABEL_20:
      free(v9);
      if (a3)
      {
        SEL v23 = (void *)v34[5];
        if (v23) {
          *a3 = v23;
        }
      }
      if ([v8 length]) {
        v24 = v8;
      }
      else {
        v24 = 0;
      }
      id v4 = v24;
      goto LABEL_27;
    }
    v27[0] = [(MSCMSMutableAttributeArray *)self count];
    v27[1] = v9;
    uint64_t v26 = 0;
    uint64_t v12 = length_CMSAttributes((uint64_t)v27);
    uint64_t v13 = [MEMORY[0x263EFF990] dataWithLength:v12];

    if (v13)
    {
      id v8 = v13;
      int v14 = encode_CMSAttributes([v8 mutableBytes] + v12 - 1, v12, (uint64_t)v27, (uint64_t)&v26);
      if (!v14)
      {
        if (v12 != v26)
        {
          id result = (id)asn1_abort();
          __break(1u);
          return result;
        }
        goto LABEL_19;
      }

      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v15 = 12;
    }
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    v40[0] = @"Failed encoding type CMSAttributes";
    uint64_t v20 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, &v39, 1, v26);
    uint64_t v21 = [v19 errorWithDomain:@"com.apple.HeimASN1" code:v15 userInfo:v20];
    v22 = (void *)v34[5];
    v34[5] = v21;

    id v8 = 0;
LABEL_19:
    objc_msgSend(v8, "length", v26);
    goto LABEL_20;
  }
  id v4 = encodedAttributeSet;
LABEL_28:

  return v4;
}

void __56__MSCMSMutableAttributeArray_encodeAttributesWithError___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [a2 encodeAttributeWithError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    [*(id *)(a1[4] + 16) addObject:v8];
    v9 = (_OWORD *)(a1[7] + 32 * a3);
    id v10 = (_OWORD *)[v8 generateAttributeStruct];
    long long v11 = v10[1];
    _OWORD *v9 = *v10;
    v9[1] = v11;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)encodeImplicitAttributesWithError:(id *)a3
{
  id v4 = -[MSCMSMutableAttributeArray encodeAttributesWithError:](self, "encodeAttributesWithError:");
  id v5 = v4;
  if (!v4)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_8;
  }
  int v6 = nsheim_decode_CMSOrderedAttributes(v4);
  if (v6)
  {
    uint64_t v7 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0], v6, 0, @"unable to decode CMSAttributes", 0 code underlyingError description];
    id v8 = v7;
    if (a3) {
      *a3 = v7;
    }

    goto LABEL_6;
  }
  v9 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", MEMORY[8], MEMORY[0], 0);
  free_CMSOrderedAttributes();
LABEL_8:

  return v9;
}

- (id)calculateAttributesWithDigest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4 && *a4) {
    uint64_t v7 = (void *)[*a4 copy];
  }
  else {
    uint64_t v7 = 0;
  }
  if (self->_encodedAttributeSet)
  {
    id v8 = [v6 algorithm];
    v9 = (void *)[v8 ccdigest];

    if (v9)
    {
      id v10 = [MEMORY[0x263EFF990] dataWithLength:*v9];
      [(NSData *)self->_encodedAttributeSet length];
      [(NSData *)self->_encodedAttributeSet bytes];
      id v11 = v10;
      [v11 mutableBytes];
      ccdigest();
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    uint64_t v12 = MSErrorCryptoDomain[0];
    uint64_t v13 = [v6 algorithm];
    int v14 = [v13 OIDString];
    uint64_t v15 = +[MSError MSErrorWithDomain:v12, -4, v7, @"%@ is not a supported digest algorithm", v14 code underlyingError description];
  }
  else
  {
    uint64_t v15 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26276 underlyingError:v7 description:@"unable to encode signed attributes"];
  }
  id v11 = 0;
  uint64_t v7 = (void *)v15;
  if (!a4) {
    goto LABEL_13;
  }
LABEL_11:
  if (v7) {
    *a4 = v7;
  }
LABEL_13:

  return v11;
}

- (id)getAttributesWithType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = +[MSCMSMutableAttributeArray array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__MSCMSMutableAttributeArray_getAttributesWithType___block_invoke;
  v8[3] = &unk_26411CAB0;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(MSCMSMutableAttributeArray *)self enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __52__MSCMSMutableAttributeArray_getAttributesWithType___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 attributeType];
  int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

- (NSMutableArray)attributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAttributes:(id)a3
{
}

- (NSMutableArray)genericAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGenericAttributes:(id)a3
{
}

- (NSData)encodedAttributeSet
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEncodedAttributeSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedAttributeSet, 0);
  objc_storeStrong((id *)&self->_genericAttributes, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end