@interface MSCMSAppleHashAgilityAttribute
- (MSCMSAppleHashAgilityAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSAppleHashAgilityAttribute)initWithHashAgilityValue:(id)a3;
- (MSOID)attributeType;
- (NSData)hashAgilityValue;
- (id)encodeAttributeWithError:(id *)a3;
@end

@implementation MSCMSAppleHashAgilityAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113635.100.9.1" error:0];
}

- (MSCMSAppleHashAgilityAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MSCMSAppleHashAgilityAttribute;
  v7 = [(MSCMSAppleHashAgilityAttribute *)&v20 init];
  v8 = [v6 attributeValues];
  uint64_t v9 = [v8 count];

  if (v9 != 1)
  {
    if (a4)
    {
      v13 = MSErrorCMSDomain[0];
      id v15 = *a4;
      v16 = @"Apple Hash Agility Attribute should only have one value";
      uint64_t v14 = -50;
      goto LABEL_7;
    }
LABEL_8:
    v17 = 0;
    goto LABEL_13;
  }
  v10 = [v6 attributeValues];
  v11 = [v10 objectAtIndex:0];
  int v12 = nsheim_decode_AppleHashAgilityValue(v11);

  if (v12)
  {
    if (a4)
    {
      v13 = MSErrorASN1Domain[0];
      uint64_t v14 = v12;
      id v15 = *a4;
      v16 = @"unable to decode Apple Hash Agility Attribute";
LABEL_7:
      +[MSError MSErrorWithDomain:v13 code:v14 underlyingError:v15 description:v16];
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  v18 = [MEMORY[0x263EFF8F8] dataWithBytes:0 length:0];
  if (v18)
  {
    free_AppleHashAgilityValue();
    v7 = [(MSCMSAppleHashAgilityAttribute *)v7 initWithHashAgilityValue:v18];
    v17 = v7;
  }
  else
  {
    v17 = 0;
  }

LABEL_13:
  return v17;
}

- (MSCMSAppleHashAgilityAttribute)initWithHashAgilityValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSCMSAppleHashAgilityAttribute;
  id v6 = [(MSCMSAppleHashAgilityAttribute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hashAgilityValue, a3);
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  v21[0] = [(NSData *)self->_hashAgilityValue length];
  v21[1] = [(NSData *)self->_hashAgilityValue bytes];
  uint64_t v20 = 0;
  uint64_t v5 = length_AppleHashAgilityValue((uint64_t)v21);
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
  int v8 = encode_AppleHashAgilityValue([v7 mutableBytes] + v5 - 1, v5, (uint64_t)v21, (uint64_t)&v20);
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
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"Failed encoding type AppleHashAgilityValue";
    int v12 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, &v22, 1, v20);
    *a3 = [v11 errorWithDomain:@"com.apple.HeimASN1" code:v10 userInfo:v12];

    goto LABEL_5;
  }
  if (v5 != v20)
  {
    v18 = (MSCMSAppleHashAgilityAttribute *)asn1_abort();
    return [(MSCMSAppleHashAgilityAttribute *)v18 hashAgilityValue];
  }
LABEL_9:
  if (objc_msgSend(v7, "length", v20))
  {
    v13 = [MSCMSAttribute alloc];
    uint64_t v14 = +[MSOID OIDWithString:@"1.2.840.113635.100.9.1" error:a3];
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
    v16 = [(MSCMSAttribute *)v13 initWithAttributeType:v14 values:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSData)hashAgilityValue
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end