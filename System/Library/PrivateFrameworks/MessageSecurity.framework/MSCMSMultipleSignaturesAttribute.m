@interface MSCMSMultipleSignaturesAttribute
- (MSAlgorithmIdentifier)bodyHashAlgorithm;
- (MSAlgorithmIdentifier)signatureAlgorithm;
- (MSAlgorithmIdentifier)signedAttrsHashAlgorithm;
- (MSCMSMultipleSignaturesAttribute)init;
- (MSCMSMultipleSignaturesAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSSignerInfo)containingSignerInfo;
- (MSOID)attributeType;
- (NSData)signedAttrsHash;
- (id)encodeAttributeWithError:(id *)a3;
- (void)setBodyHashAlgorithm:(id)a3;
- (void)setContainingSignerInfo:(id)a3;
- (void)setSignatureAlgorithm:(id)a3;
- (void)setSignedAttrsHash:(id)a3;
- (void)setSignedAttrsHashAlgorithm:(id)a3;
@end

@implementation MSCMSMultipleSignaturesAttribute

- (void)setBodyHashAlgorithm:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_bodyHashAlgorithm, a3);
    id v5 = v6;
  }
}

- (void)setSignatureAlgorithm:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_signatureAlgorithm, a3);
    id v5 = v6;
  }
}

- (void)setSignedAttrsHashAlgorithm:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_signedAttrsHashAlgorithm, a3);
    id v5 = v6;
  }
}

- (MSCMSMultipleSignaturesAttribute)init
{
  v13.receiver = self;
  v13.super_class = (Class)MSCMSMultipleSignaturesAttribute;
  v2 = [(MSCMSMultipleSignaturesAttribute *)&v13 init];
  v3 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.2.1" error:0];
  uint64_t v4 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:v3];
  bodyHashAlgorithm = v2->_bodyHashAlgorithm;
  v2->_bodyHashAlgorithm = (MSAlgorithmIdentifier *)v4;

  id v6 = +[MSOID OIDWithString:@"1.2.840.10045.4.3.2" error:0];
  uint64_t v7 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:v6];
  signatureAlgorithm = v2->_signatureAlgorithm;
  v2->_signatureAlgorithm = (MSAlgorithmIdentifier *)v7;

  v9 = +[MSOID OIDWithString:@"2.16.840.1.101.3.4.2.1" error:0];
  uint64_t v10 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:v9];
  signedAttrsHashAlgorithm = v2->_signedAttrsHashAlgorithm;
  v2->_signedAttrsHashAlgorithm = (MSAlgorithmIdentifier *)v10;

  objc_storeWeak((id *)&v2->_signedAttrsHash, 0);
  return v2;
}

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113549.1.9.2.51" error:0];
}

- (id)encodeAttributeWithError:(id *)a3
{
  v42[1] = *MEMORY[0x263EF8340];
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  id v5 = [(MSAlgorithmIdentifier *)self->_bodyHashAlgorithm asn1AlgId];
  var1 = v5->var1;
  heim_oid var0 = v5->var0;
  v34 = var1;
  uint64_t v7 = [(MSAlgorithmIdentifier *)self->_signatureAlgorithm asn1AlgId];
  v8 = v7->var1;
  heim_oid v35 = v7->var0;
  v36 = v8;
  v9 = [(MSAlgorithmIdentifier *)self->_signedAttrsHashAlgorithm asn1AlgId];
  uint64_t v10 = v9->var1;
  heim_oid v37 = v9->var0;
  v38 = v10;
  p_signedAttrsHash = &self->_signedAttrsHash;
  id WeakRetained = objc_loadWeakRetained((id *)p_signedAttrsHash);

  if (WeakRetained)
  {
    id v13 = objc_loadWeakRetained((id *)p_signedAttrsHash);
    uint64_t v39 = [v13 length];

    id v14 = objc_loadWeakRetained((id *)p_signedAttrsHash);
    uint64_t v40 = [v14 bytes];
  }
  uint64_t v32 = 0;
  uint64_t v15 = length_MultipleSignatures((uint64_t)&var0);
  v16 = [MEMORY[0x263EFF990] dataWithLength:v15];
  if (!v16)
  {
    uint64_t v20 = 12;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v17 = v16;
  int v18 = encode_MultipleSignatures([v17 mutableBytes] + v15 - 1, v15, (uint64_t)&var0, (uint64_t)&v32);
  if (v18)
  {
    int v19 = v18;

    uint64_t v20 = v19;
    if (!a3)
    {
LABEL_7:
      id v17 = 0;
      goto LABEL_11;
    }
LABEL_6:
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F08320];
    v42[0] = @"Failed encoding type MultipleSignatures";
    v22 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    *a3 = [v21 errorWithDomain:@"com.apple.HeimASN1" code:v20 userInfo:v22];

    goto LABEL_7;
  }
  if (v15 != v32)
  {
    v28 = (MSCMSMultipleSignaturesAttribute *)asn1_abort();
    return [(MSCMSMultipleSignaturesAttribute *)v28 initWithAttribute:v30 error:v31];
  }
LABEL_11:
  v23 = [MSCMSAttribute alloc];
  v24 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.2.51" error:a3];
  v25 = [MEMORY[0x263EFF8C0] arrayWithObject:v17];
  v26 = [(MSCMSAttribute *)v23 initWithAttributeType:v24 values:v25];

  return v26;
}

- (MSCMSMultipleSignaturesAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MSCMSMultipleSignaturesAttribute;
  uint64_t v7 = [(MSCMSMultipleSignaturesAttribute *)&v35 init];
  v8 = [v6 attributeType];
  char v9 = [v8 isEqualToString:@"1.2.840.113549.1.9.2.51"];

  if ((v9 & 1) == 0)
  {
    if (a4)
    {
      uint64_t v15 = MSErrorCMSDomain[0];
      id v17 = *a4;
      int v18 = @"Not a Multiple Signatures attribute according to AttributeType";
      uint64_t v16 = -26275;
      goto LABEL_10;
    }
LABEL_11:
    int v19 = 0;
    goto LABEL_20;
  }
  uint64_t v10 = [v6 attributeValues];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    if (a4)
    {
      uint64_t v15 = MSErrorCMSDomain[0];
      id v17 = *a4;
      int v18 = @"Missing value for Multiple Signatures attribute";
      uint64_t v16 = -50;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v34 = 0;
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  v12 = [v6 attributeValues];
  id v13 = [v12 objectAtIndex:0];
  id v14 = (void *)nsheim_decode_MultipleSignatures(v13);

  if (!v14)
  {
    id v31 = 0;
    uint64_t v20 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:v32 error:&v31];
    id v21 = v31;
    bodyHashAlgorithm = v7->_bodyHashAlgorithm;
    v7->_bodyHashAlgorithm = (MSAlgorithmIdentifier *)v20;

    if (v7->_bodyHashAlgorithm)
    {
      id v30 = v21;
      uint64_t v23 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:(char *)&v32[1] + 8 error:&v30];
      id v24 = v30;

      signatureAlgorithm = v7->_signatureAlgorithm;
      v7->_signatureAlgorithm = (MSAlgorithmIdentifier *)v23;

      if (!v7->_signatureAlgorithm)
      {
        id v21 = v24;
        if (a4)
        {
LABEL_17:
          if (v21) {
            *a4 = v21;
          }
        }
LABEL_19:
        free_MultipleSignatures();
        int v19 = v7;

        goto LABEL_20;
      }
      id v29 = v24;
      uint64_t v26 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:v33 error:&v29];
      id v21 = v29;

      signedAttrsHashAlgorithm = v7->_signedAttrsHashAlgorithm;
      v7->_signedAttrsHashAlgorithm = (MSAlgorithmIdentifier *)v26;

      if (v7->_signedAttrsHashAlgorithm) {
        objc_storeWeak((id *)&v7->_signedAttrsHash, 0);
      }
    }
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if (!a4) {
    goto LABEL_11;
  }
  asn1ErrorToNSError(v14, a4);
  uint64_t v15 = MSErrorASN1Domain[0];
  uint64_t v16 = (int)v14;
  id v17 = *a4;
  int v18 = @"unable to decode Multiple Signatures attribute";
LABEL_10:
  +[MSError MSErrorWithDomain:v15 code:v16 underlyingError:v17 description:v18];
  int v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v19;
}

- (MSCMSSignerInfo)containingSignerInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignerInfo);

  return (MSCMSSignerInfo *)WeakRetained;
}

- (void)setContainingSignerInfo:(id)a3
{
}

- (MSAlgorithmIdentifier)bodyHashAlgorithm
{
  return self->_bodyHashAlgorithm;
}

- (MSAlgorithmIdentifier)signatureAlgorithm
{
  return self->_signatureAlgorithm;
}

- (MSAlgorithmIdentifier)signedAttrsHashAlgorithm
{
  return self->_signedAttrsHashAlgorithm;
}

- (NSData)signedAttrsHash
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_signedAttrsHash);

  return (NSData *)WeakRetained;
}

- (void)setSignedAttrsHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_signedAttrsHash);
  objc_storeStrong((id *)&self->_signedAttrsHashAlgorithm, 0);
  objc_storeStrong((id *)&self->_signatureAlgorithm, 0);
  objc_storeStrong((id *)&self->_bodyHashAlgorithm, 0);

  objc_destroyWeak((id *)&self->_containingSignerInfo);
}

@end