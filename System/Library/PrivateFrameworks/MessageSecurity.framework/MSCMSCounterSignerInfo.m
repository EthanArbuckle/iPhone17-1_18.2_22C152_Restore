@interface MSCMSCounterSignerInfo
- (BOOL)createRequiredAttributes:(id *)a3;
- (BOOL)verifyContentTypeAttribute:(id *)a3;
- (MSCMSSignerInfo)containingSignerInfo;
- (id)calculateSignerInfoDigest:(id *)a3;
- (id)certificates;
- (void)setContainingSignerInfo:(id)a3;
@end

@implementation MSCMSCounterSignerInfo

- (id)certificates
{
  v3 = [(MSCMSCounterSignerInfo *)self containingSignerInfo];

  if (v3)
  {
    v4 = [(MSCMSCounterSignerInfo *)self containingSignerInfo];
    v5 = [v4 certificates];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setContainingSignerInfo:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignerInfo);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containingSignerInfo, 0);
    objc_storeWeak((id *)&self->_containingSignerInfo, obj);
    [(MSCMSSignerInfo *)self setContentChanged:1];
  }
}

- (id)calculateSignerInfoDigest:(id *)a3
{
  if (a3 && *a3) {
    v5 = (void *)[*a3 copy];
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = [(MSCMSCounterSignerInfo *)self containingSignerInfo];
  if (!v6) {
    goto LABEL_18;
  }
  v7 = (void *)v6;
  v8 = [(MSCMSCounterSignerInfo *)self containingSignerInfo];
  v9 = [v8 signature];

  if (!v9)
  {
LABEL_18:
    v27 = MSErrorCMSDomain[0];
    v28 = @"counter signer has no reference to a signer with a signature";
LABEL_19:
    id v20 = +[MSError MSErrorWithDomain:v27 code:-50 underlyingError:v5 description:v28];

    id v19 = 0;
    goto LABEL_20;
  }
  v10 = [(MSCMSSignerInfo *)self digestAlgorithm];

  if (!v10)
  {
    v11 = [(MSCMSSignerInfo *)self signatureAlgorithm];

    if (!v11)
    {
      v27 = MSErrorCMSDomain[0];
      v28 = @"signer has no signature algorithm";
      goto LABEL_19;
    }
    v12 = [(MSCMSSignerInfo *)self signatureAlgorithm];
    id v34 = v5;
    v13 = +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:v12 error:&v34];
    id v14 = v34;

    [(MSCMSSignerInfo *)self setDigestAlgorithm:v13];
    v5 = v14;
  }
  v15 = [(MSCMSSignerInfo *)self digestAlgorithm];

  if (!v15)
  {
    v27 = MSErrorCMSDomain[0];
    v28 = @"No digest algorithm specified";
    goto LABEL_19;
  }
  v16 = [(MSCMSCounterSignerInfo *)self containingSignerInfo];
  v17 = [(MSCMSSignerInfo *)self digestAlgorithm];
  v18 = [v17 algorithm];
  id v33 = v5;
  id v19 = [v16 calculateSignatureDigestWithAlgorithm:v18 error:&v33];
  id v20 = v33;

  if (!v19) {
    goto LABEL_20;
  }
  v21 = [(MSCMSSignerInfo *)self protectedAttributes];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    id v32 = v20;
    BOOL v23 = [(MSCMSCounterSignerInfo *)self verifyContentTypeAttribute:&v32];
    id v24 = v32;

    if (!v23)
    {
      v26 = 0;
LABEL_16:
      id v20 = v24;
      if (!a3) {
        goto LABEL_25;
      }
      goto LABEL_23;
    }
    id v31 = v24;
    BOOL v25 = [(MSCMSSignerInfo *)self verifyMessageDigestAttribute:v19 error:&v31];
    id v20 = v31;

    if (v25)
    {
      id v30 = v20;
      v26 = [(MSCMSSignerInfo *)self calculateSignedAttributesDigest:&v30];
      id v24 = v30;

      goto LABEL_16;
    }
LABEL_20:
    v26 = 0;
    if (!a3) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  id v19 = v19;
  v26 = v19;
  if (!a3) {
    goto LABEL_25;
  }
LABEL_23:
  if (v20) {
    *a3 = v20;
  }
LABEL_25:

  return v26;
}

- (BOOL)verifyContentTypeAttribute:(id *)a3
{
  if (a3 && *a3) {
    v5 = (void *)[*a3 copy];
  }
  else {
    v5 = 0;
  }
  id v12 = v5;
  uint64_t v6 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.3" error:&v12];
  id v7 = v12;

  v8 = [(MSCMSSignerInfo *)self getAttributesWithType:v6];

  if (v8 && [v8 count])
  {
    uint64_t v11 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v7 description:@"Content-type attribute must not be present in Countersignature"];

    BOOL v9 = 0;
    id v7 = (id)v11;
    if (!a3) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v9 = 1;
    if (!a3) {
      goto LABEL_10;
    }
  }
  if (v7) {
    *a3 = v7;
  }
LABEL_10:

  return v9;
}

- (BOOL)createRequiredAttributes:(id *)a3
{
  uint64_t v5 = [(MSCMSSignerInfo *)self protectedAttributes];
  if (!v5
    || (uint64_t v6 = (void *)v5,
        [(MSCMSSignerInfo *)self protectedAttributes],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        !v8))
  {
    id v13 = 0;
    BOOL v22 = 1;
    goto LABEL_12;
  }
  BOOL v9 = [(MSCMSCounterSignerInfo *)self containingSignerInfo];
  v10 = [(MSCMSSignerInfo *)self digestAlgorithm];
  uint64_t v11 = [v10 algorithm];
  id v26 = 0;
  id v12 = [v9 calculateSignatureDigestWithAlgorithm:v11 error:&v26];
  id v13 = v26;

  if (![(MSCMSCounterSignerInfo *)self verifyContentTypeAttribute:0]
    || ![(MSCMSSignerInfo *)self verifyMessageDigestAttribute:v12 error:0])
  {
    id v14 = [(MSCMSSignerInfo *)self protectedAttributes];
    id v25 = v13;
    v15 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.3" error:&v25];
    id v16 = v25;

    [v14 removeAttributes:v15];
    v17 = [(MSCMSSignerInfo *)self protectedAttributes];
    id v24 = v16;
    v18 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.4" error:&v24];
    id v13 = v24;

    [v17 removeAttributes:v18];
    uint64_t v19 = +[MSCMSMessageDigestAttribute messageDigestAttributeWithDigest:v12];
    if (!v19)
    {
      BOOL v22 = 0;
      goto LABEL_8;
    }
    id v20 = (void *)v19;
    v21 = [(MSCMSSignerInfo *)self protectedAttributes];
    [v21 addObject:v20];
  }
  BOOL v22 = 1;
LABEL_8:

  if (a3 && v13)
  {
    id v13 = v13;
    *a3 = v13;
  }
LABEL_12:

  return v22;
}

- (MSCMSSignerInfo)containingSignerInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignerInfo);

  return (MSCMSSignerInfo *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end