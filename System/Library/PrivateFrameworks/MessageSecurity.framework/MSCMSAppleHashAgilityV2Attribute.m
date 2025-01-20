@interface MSCMSAppleHashAgilityV2Attribute
- (MSCMSAppleHashAgilityV2Attribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSAppleHashAgilityV2Attribute)initWithHashAgilityValues:(id)a3;
- (MSOID)attributeType;
- (NSDictionary)hashAgilityValues;
- (id)encodeAttributeWithError:(id *)a3;
@end

@implementation MSCMSAppleHashAgilityV2Attribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113635.100.9.2" error:0];
}

- (MSCMSAppleHashAgilityV2Attribute)initWithAttribute:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MSCMSAppleHashAgilityV2Attribute;
  v7 = [(MSCMSAppleHashAgilityV2Attribute *)&v33 init];
  v8 = [v6 attributeValues];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263EFF9A0];
    v11 = [v6 attributeValues];
    v12 = objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v13 = [v6 attributeValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      v26 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v27 = 0u;
          long long v28 = 0u;
          int v19 = nsheim_decode_AppleAgileHash(v18);
          if (v19)
          {
            v7 = v26;
            if (a4)
            {
              *a4 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:v19 underlyingError:*a4 description:@"unable to decode Apple Hash Agility V2 Agile Hash"];
            }
            goto LABEL_20;
          }
          v20 = [MEMORY[0x263EFF8F8] dataWithBytes:*((void *)&v28 + 1) length:(void)v28];
          v21 = +[MSOID OIDWithAsn1OID:&v27 error:a4];
          v22 = [v21 OIDString];

          if (v22) {
            BOOL v23 = v20 == 0;
          }
          else {
            BOOL v23 = 1;
          }
          if (v23)
          {
            free_AppleAgileHash();

            v7 = v26;
LABEL_20:

            v24 = 0;
            goto LABEL_21;
          }
          [v12 setObject:v20 forKeyedSubscript:v22];
          free_AppleAgileHash();
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
        v7 = v26;
        if (v15) {
          continue;
        }
        break;
      }
    }

    v7 = [(MSCMSAppleHashAgilityV2Attribute *)v7 initWithHashAgilityValues:v12];
    v24 = v7;
LABEL_21:
  }
  else if (a4)
  {
    +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:*a4 description:@"Apple Hash Agility V2 Attribute must have one value"];
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (MSCMSAppleHashAgilityV2Attribute)initWithHashAgilityValues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSCMSAppleHashAgilityV2Attribute;
  id v6 = [(MSCMSAppleHashAgilityV2Attribute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hashAgilityValues, a3);
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263EFF980];
  id v6 = [(MSCMSAppleHashAgilityV2Attribute *)self hashAgilityValues];
  v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v35 = self;
  v8 = [(MSCMSAppleHashAgilityV2Attribute *)self hashAgilityValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id obj = v8;
    uint64_t v34 = *(void *)v40;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v40 != v34) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * v11);
      v13 = [(MSCMSAppleHashAgilityV2Attribute *)v35 hashAgilityValues];
      uint64_t v14 = [v13 objectForKeyedSubscript:v12];

      uint64_t v15 = +[MSOID OIDWithString:v12 error:a3];
      if (!v15) {
        goto LABEL_18;
      }
      uint64_t v16 = v15;
      v17 = v7;
      long long v37 = 0u;
      long long v38 = 0u;
      *(void *)&long long v37 = [v15 Asn1OID];
      *((void *)&v37 + 1) = v18;
      id v19 = v14;
      *((void *)&v38 + 1) = [v19 bytes];
      *(void *)&long long v38 = [v19 length];
      uint64_t v36 = 0;
      uint64_t v20 = length_AppleAgileHash((uint64_t)&v37);
      v21 = [MEMORY[0x263EFF990] dataWithLength:v20];
      if (!v21) {
        break;
      }
      id v22 = v21;
      int v23 = encode_AppleAgileHash([v22 mutableBytes] + v20 - 1, v20, (uint64_t)&v37, (uint64_t)&v36);
      if (v23)
      {
        int v28 = v23;

        uint64_t v27 = v28;
        goto LABEL_15;
      }
      if (v20 != v36) {
        asn1_abort();
      }
      v7 = v17;
      [v17 addObject:v22];

      if (v10 == ++v11)
      {
        v8 = obj;
        uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v27 = 12;
LABEL_15:
    v7 = v17;
    if (a3)
    {
      long long v29 = a3;
      long long v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = *MEMORY[0x263F08320];
      v44 = @"Failed encoding type AppleAgileHash";
      long long v31 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      *long long v29 = [v30 errorWithDomain:@"com.apple.HeimASN1" code:v27 userInfo:v31];
    }
LABEL_18:

    v26 = 0;
    v25 = obj;
    goto LABEL_19;
  }
LABEL_12:

  v24 = [MSCMSAttribute alloc];
  v25 = +[MSOID OIDWithString:@"1.2.840.113635.100.9.2" error:a3];
  v26 = [(MSCMSAttribute *)v24 initWithAttributeType:v25 values:v7];
LABEL_19:

  return v26;
}

- (NSDictionary)hashAgilityValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end