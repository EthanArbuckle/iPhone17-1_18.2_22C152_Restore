@interface MSCMSSignerInfo
+ (id)decodeSignerInfo:(SignerInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (BOOL)contentChanged;
- (BOOL)createRequiredAttributes:(id *)a3;
- (BOOL)encodeSignerInfo:(SignerInfo *)a3 error:(id *)a4;
- (BOOL)sign:(id *)a3;
- (BOOL)signatureCalculated;
- (BOOL)useIssuerAndSerialNumber;
- (BOOL)verifyContentTypeAttribute:(id *)a3;
- (BOOL)verifyCountersignatures:(id *)a3;
- (BOOL)verifyCountersignaturesAndCountersignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6;
- (BOOL)verifyMessageDigestAttribute:(id)a3 error:(id *)a4;
- (BOOL)verifySignature:(id *)a3;
- (BOOL)verifySignatureAndSignerWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6;
- (BOOL)verifyTimestamps:(BOOL)a3 error:(id *)a4;
- (BOOL)verifyTimestamps:(id *)a3;
- (MSAlgorithmIdentifier)digestAlgorithm;
- (MSAlgorithmIdentifier)signatureAlgorithm;
- (MSCMSMutableAttributeArray)protectedAttributes;
- (MSCMSMutableAttributeArray)unprotectedAttributes;
- (MSCMSSignedData)containingSignedData;
- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 error:(id *)a4;
- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6;
- (MSCMSSignerInfo)initWithEmail:(id)a3 LAContext:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithEmail:(id)a3 recipientsAlgorithmCapabilities:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (MSCMSSignerInfo)initWithEmail:(id)a3 signatureAlgorithm:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 error:(id *)a4;
- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6;
- (NSArray)certificates;
- (NSData)LAContext;
- (NSData)identifierData;
- (NSData)signature;
- (NSData)signedAttrsData;
- (NSData)unsignedAttrsData;
- (NSNumber)version;
- (SignerInfo)encodedSignerInfo;
- (__SecCertificate)signerCertificate;
- (__SecKey)signerPrivKey;
- (__SecTrust)createTrustObjectWithPolicies:(id)a3 error:(id *)a4;
- (__SecTrust)createTrustObjectWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6;
- (id)calculateSignatureDigestWithAlgorithm:(id)a3 error:(id *)a4;
- (id)calculateSignedAttributesDigest:(id *)a3;
- (id)calculateSignerInfoDigest:(id *)a3;
- (id)getAttributesWithType:(id)a3;
- (id)getAttributesWithType:(id)a3 protectedAttributes:(BOOL)a4;
- (id)verifyTime:(id)a3;
- (void)addCounterSignerAttribute:(id)a3;
- (void)addMultipleSignaturesAttribute;
- (void)addProtectedAttribute:(id)a3;
- (void)addSMIMECapabilitiesAttribute:(id)a3;
- (void)addSMIMEEncryptionKeyPreferenceAttribute:(id)a3;
- (void)dealloc;
- (void)setContainingSignedData:(id)a3;
- (void)setContentChanged:(BOOL)a3;
- (void)setDigestAlgorithm:(id)a3;
- (void)setEncodedSignerInfo:(SignerInfo *)a3;
- (void)setIdentifierData:(id)a3;
- (void)setLAContext:(id)a3;
- (void)setProtectedAttributes:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignatureAlgorithm:(id)a3;
- (void)setSignedAttrsData:(id)a3;
- (void)setSignerCertificate:(__SecCertificate *)a3;
- (void)setSignerPrivKey:(__SecKey *)a3;
- (void)setUnprotectedAttributes:(id)a3;
- (void)setUnsignedAttrsData:(id)a3;
- (void)setUseIssuerAndSerialNumber:(BOOL)a3;
- (void)setVersion:(id)a3;
@end

@implementation MSCMSSignerInfo

- (BOOL)verifyCountersignaturesAndCountersignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(MSCMSSignerInfo *)self unprotectedAttributes];
  v14 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.6" error:0];
  v15 = [v13 getAttributesWithType:v14];

  if (v15)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    *(void *)buf = 0;
    v28 = buf;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__4;
    v31 = __Block_byref_object_dispose__4;
    if (a6)
    {
      id v16 = *a6;
      if (*a6) {
        id v16 = (id)[v16 copy];
      }
    }
    else
    {
      id v16 = 0;
    }
    id v32 = v16;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __108__MSCMSSignerInfo_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke_86;
    v21[3] = &unk_26411CE38;
    v21[4] = self;
    v25 = buf;
    id v22 = v10;
    id v23 = v11;
    id v24 = v12;
    v26 = &v33;
    [v15 enumerateObjectsUsingBlock:v21];
    if (a6)
    {
      v19 = (void *)*((void *)v28 + 5);
      if (v19) {
        *a6 = v19;
      }
    }
    BOOL v18 = *((unsigned char *)v34 + 24) == 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_85);
    }
    v17 = MS_DEFAULT_LOG_INTERNAL;
    BOOL v18 = 1;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8A1000, v17, OS_LOG_TYPE_INFO, "no countersignatures, returning successful verification", buf, 2u);
    }
  }

  return v18;
}

- (MSCMSMutableAttributeArray)unprotectedAttributes
{
  return (MSCMSMutableAttributeArray *)objc_getProperty(self, a2, 48, 1);
}

- (id)getAttributesWithType:(id)a3
{
  id v4 = a3;
  v5 = [(MSCMSSignerInfo *)self getAttributesWithType:v4 protectedAttributes:1];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF980] arrayWithArray:v5];
  }
  else
  {
    v6 = 0;
  }
  v7 = [(MSCMSSignerInfo *)self getAttributesWithType:v4 protectedAttributes:0];
  if (v7)
  {
    if (v6)
    {
      [v6 addObjectsFromArray:v7];
    }
    else
    {
      v6 = [MEMORY[0x263EFF980] arrayWithArray:v7];
    }
  }

  return v6;
}

- (id)getAttributesWithType:(id)a3 protectedAttributes:(BOOL)a4
{
  id v6 = a3;
  v7 = self->_protectedAttributes;
  if (!a4)
  {
    v8 = self->_unprotectedAttributes;

    v7 = v8;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__MSCMSSignerInfo_getAttributesWithType_protectedAttributes___block_invoke;
  v15[3] = &unk_26411CE88;
  id v9 = v6;
  id v16 = v9;
  id v10 = [(MSCMSMutableAttributeArray *)v7 indexesOfObjectsPassingTest:v15];
  if ([v10 count])
  {
    id v11 = (void *)MEMORY[0x263EFF980];
    id v12 = [(MSCMSMutableAttributeArray *)v7 objectsAtIndexes:v10];
    v13 = [v11 arrayWithArray:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setContainingSignedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestAlgorithm, 0);
  objc_destroyWeak((id *)&self->_containingSignedData);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifierData, 0);
  objc_storeStrong((id *)&self->_unsignedAttrsData, 0);
  objc_storeStrong((id *)&self->_signedAttrsData, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_unprotectedAttributes, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_protectedAttributes, 0);

  objc_storeStrong((id *)&self->_signatureAlgorithm, 0);
}

- (MSAlgorithmIdentifier)digestAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 120, 1);
}

+ (id)decodeSignerInfo:(SignerInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (a6 && *a6) {
    id v12 = (id)[*a6 copy];
  }
  else {
    id v12 = 0;
  }
  v13 = [NSNumber numberWithInt:a3->var0];
  v14 = +[MSCMSIdentifier decodeIdentifier:&a3->var1 error:a6];
  v15 = v14;
  v41 = v13;
  v42 = v11;
  if (v14)
  {
    int v16 = [v14 type];
    if (v16 == 1)
    {
      if ([v13 intValue] == 1)
      {
LABEL_9:
        id v47 = v12;
        CertificateForIdentifier = (void *)findCertificateForIdentifier((uint64_t)&a3->var1, v10, v11, &v47);
        id v18 = v47;

        if (CertificateForIdentifier)
        {
          id v39 = v10;
          id v19 = objc_alloc((Class)a1);
          [v19 setSignerCertificate:CertificateForIdentifier];
          id v46 = v18;
          v40 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:&a3->var2 error:&v46];
          id v20 = v46;

          var3 = a3->var3;
          unint64_t v22 = 0x26411C000uLL;
          if (var3)
          {
            id v45 = v20;
            id v23 = +[MSCMSMutableAttributeArray createAttributeArrayFromAttributeSetRaw:var3 error:&v45];
            id v12 = v45;

            if (v23)
            {
              id v24 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.15" error:0];
              v25 = [v23 getAttributesWithType:v24];

              if ((unint64_t)[v25 count] >= 2)
              {
              }
              else
              {
                v26 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.16.2.11" error:0];
                v27 = [v23 getAttributesWithType:v26];

                if ((unint64_t)[v27 count] <= 1)
                {

                  id v20 = v12;
                  unint64_t v22 = 0x26411C000;
                  goto LABEL_19;
                }
              }
            }
            else
            {
            }
            v30 = 0;
            CertificateForIdentifier = 0;
            v31 = 0;
            id v19 = 0;
            goto LABEL_27;
          }
          id v23 = 0;
LABEL_19:
          id v44 = v20;
          v30 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:&a3->var4 error:&v44];
          id v12 = v44;

          CertificateForIdentifier = NSDataFromOctetString(&a3->var5.var0);
          var6 = a3->var6;
          if (var6)
          {
            uint64_t v33 = *(void **)(v22 + 1056);
            id v43 = v12;
            v31 = [v33 createAttributeArrayFromAttributeSetRaw:var6 error:&v43];
            id v34 = v43;

            if (!v31)
            {

              id v19 = 0;
              id v12 = v34;
              goto LABEL_27;
            }
            id v12 = v34;
          }
          else
          {
            v31 = 0;
          }
          [v19 setVersion:v41];
          [v19 setDigestAlgorithm:v40];
          [v19 setProtectedAttributes:v23];
          [v19 setSignatureAlgorithm:v30];
          [v19 setUnprotectedAttributes:v31];
          [v19 setSignature:CertificateForIdentifier];
          [v19 setLAContext:v42];
          uint64_t v35 = malloc_type_malloc(0x68uLL, 0x10B00404EF9CE24uLL);
          if (v35)
          {
            char v36 = v35;
            v35[12] = 0;
            *((_OWORD *)v35 + 4) = 0u;
            *((_OWORD *)v35 + 5) = 0u;
            *((_OWORD *)v35 + 2) = 0u;
            *((_OWORD *)v35 + 3) = 0u;
            *(_OWORD *)uint64_t v35 = 0u;
            *((_OWORD *)v35 + 1) = 0u;
            copy_SignerInfo();
            if ([v19 encodedSignerInfo])
            {
              [v19 encodedSignerInfo];
              free_SignerInfo();
              free((void *)[v19 encodedSignerInfo]);
              [v19 setEncodedSignerInfo:0];
            }
            [v19 setEncodedSignerInfo:v36];
          }
LABEL_27:
          id v10 = v39;
          if (!a6) {
            goto LABEL_30;
          }
          goto LABEL_28;
        }
        id v12 = +[MSError MSErrorWithDomain:MSErrorKeychainDomain[0] code:-25300 underlyingError:v18 description:@"unable to find a certificate matching the signer"];

        v40 = 0;
        id v23 = 0;
        v30 = 0;
        goto LABEL_33;
      }
    }
    else if (v16 == 2 && [v13 intValue] == 3)
    {
      goto LABEL_9;
    }
    +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v12 description:@"decode failed for signerInfo due to RFC 5652 violation (version)"];
    uint64_t v29 = v28 = v10;

    v40 = 0;
    id v23 = 0;
    v30 = 0;
    CertificateForIdentifier = 0;
    v31 = 0;
    id v19 = 0;
    id v12 = (id)v29;
    id v10 = v28;
    if (!a6) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  v40 = 0;
  id v23 = 0;
  v30 = 0;
  CertificateForIdentifier = 0;
LABEL_33:
  v31 = 0;
  id v19 = 0;
  if (!a6) {
    goto LABEL_30;
  }
LABEL_28:
  if (v12) {
    *a6 = v12;
  }
LABEL_30:
  id v37 = v19;

  return v37;
}

- (void)setVersion:(id)a3
{
}

- (void)setUnprotectedAttributes:(id)a3
{
}

- (void)setSignerCertificate:(__SecCertificate *)a3
{
  self->_signerCertificate = a3;
}

- (void)setSignatureAlgorithm:(id)a3
{
}

- (void)setSignature:(id)a3
{
  self->_signatureCalculated = 0;
}

- (void)setProtectedAttributes:(id)a3
{
}

- (void)setLAContext:(id)a3
{
}

- (void)setEncodedSignerInfo:(SignerInfo *)a3
{
  self->_encodedSignerInfo = a3;
}

- (void)setDigestAlgorithm:(id)a3
{
}

- (SignerInfo)encodedSignerInfo
{
  return self->_encodedSignerInfo;
}

- (BOOL)verifySignatureAndSignerWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 && *a6) {
    v13 = (void *)[*a6 copy];
  }
  else {
    v13 = 0;
  }
  id v26 = v13;
  CFErrorRef error = 0;
  BOOL v14 = [(MSCMSSignerInfo *)self verifySignature:&v26];
  CFErrorRef v15 = (CFErrorRef)v26;

  if (!v14)
  {
    v17 = 0;
    goto LABEL_18;
  }
  int v16 = [(MSCMSSignerInfo *)self verifyTime:v11];
  v17 = [(MSCMSSignerInfo *)self createTrustObjectWithPolicies:v10 verifyTime:v16 anchorCertificates:v12 error:a6];

  if (!v17)
  {
LABEL_18:
    BOOL v20 = 0;
    goto LABEL_11;
  }
  if (SecTrustEvaluateWithError(v17, &error))
  {
    CFErrorRef v25 = v15;
    BOOL v18 = [(MSCMSSignerInfo *)self verifyCountersignaturesAndCountersignersWithPolicies:v10 verifyTime:v11 anchorCertificates:v12 error:&v25];
    CFErrorRef v19 = v25;

    if (!v18)
    {
      BOOL v20 = 0;
      CFErrorRef v15 = v19;
      goto LABEL_11;
    }
    CFErrorRef v24 = v19;
    BOOL v20 = [(MSCMSSignerInfo *)self verifyTimestamps:&v24];
    v21 = v24;
  }
  else
  {
    if (error)
    {
      CFIndex Code = CFErrorGetCode(error);
      CFErrorRef v19 = error;
    }
    else
    {
      CFErrorRef v19 = 0;
      CFIndex Code = -1;
    }
    v21 = +[MSError MSErrorWithDomain:*MEMORY[0x263F08410] code:Code underlyingError:v19 description:@"trust evaluation of signer failed"];

    BOOL v20 = 0;
  }

  CFErrorRef v15 = v21;
LABEL_11:
  if (a6 && v15) {
    *a6 = v15;
  }
  if (v17) {
    CFRelease(v17);
  }

  return v20;
}

- (BOOL)verifyTimestamps:(BOOL)a3 error:(id *)a4
{
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__4;
  v27[4] = __Block_byref_object_dispose__4;
  id v28 = 0;
  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  CFErrorRef v24 = __Block_byref_object_copy__4;
  CFErrorRef v25 = __Block_byref_object_dispose__4;
  if (a4)
  {
    id v7 = *a4;
    if (*a4) {
      id v7 = (id)[v7 copy];
    }
  }
  else
  {
    id v7 = 0;
  }
  id v26 = v7;
  v8 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.16.2.14" error:0];
  id v9 = [(MSCMSSignerInfo *)self getAttributesWithType:v8];

  if (v9) {
    goto LABEL_8;
  }
  if (a3)
  {
    uint64_t v10 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-67808 underlyingError:v22[5] description:@"unable to verify timestamp signature because there are no timestamps"];
    id v11 = (void *)v22[5];
    v22[5] = v10;

LABEL_8:
    *(void *)buf = 0;
    BOOL v18 = buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __42__MSCMSSignerInfo_verifyTimestamps_error___block_invoke_95;
    v16[3] = &unk_26411CE60;
    v16[4] = self;
    v16[5] = &v21;
    v16[6] = v27;
    v16[7] = buf;
    [v9 enumerateObjectsUsingBlock:v16];
    if (a4)
    {
      id v12 = (void *)v22[5];
      if (v12) {
        *a4 = v12;
      }
    }
    BOOL v13 = v18[24] == 0;
    _Block_object_dispose(buf, 8);
    goto LABEL_12;
  }
  if (MS_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_91);
  }
  CFErrorRef v15 = MS_DEFAULT_LOG_INTERNAL;
  BOOL v13 = 1;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8A1000, v15, OS_LOG_TYPE_INFO, "no timestamps, returning successful verification", buf, 2u);
  }
LABEL_12:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v27, 8);

  return v13;
}

- (BOOL)verifyTimestamps:(id *)a3
{
  return [(MSCMSSignerInfo *)self verifyTimestamps:0 error:a3];
}

- (id)verifyTime:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
    goto LABEL_14;
  }
  id v7 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.16.2.14" error:0];
  v8 = [(MSCMSSignerInfo *)self getAttributesWithType:v7];

  if (!v8) {
    goto LABEL_12;
  }
  id v9 = [v8 objectAtIndex:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [MSCMSTimestampAttribute alloc];
    id v12 = [v8 objectAtIndex:0];
    BOOL v13 = [(MSCMSTimestampAttribute *)v11 initWithAttribute:v12 error:0];

    if (!v13) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v14 = [v8 objectAtIndex:0];
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();

    BOOL v13 = 0;
    if ((v15 & 1) == 0) {
      goto LABEL_11;
    }
    BOOL v13 = [v8 objectAtIndex:0];
    if (!v13) {
      goto LABEL_11;
    }
  }
  int v16 = [(MSCMSTimestampAttribute *)v13 timestampTime];

  if (!v16)
  {
LABEL_11:

LABEL_12:
    id v6 = [MEMORY[0x263EFF910] date];
    goto LABEL_13;
  }
  id v6 = [(MSCMSTimestampAttribute *)v13 timestampTime];

LABEL_13:
LABEL_14:

  return v6;
}

- (BOOL)verifySignature:(id *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (a3 && *a3) {
    v5 = (void *)[*a3 copy];
  }
  else {
    v5 = 0;
  }
  id v37 = v5;
  CFTypeRef cf = 0;
  CFDataRef v6 = [(MSCMSSignerInfo *)self calculateSignerInfoDigest:&v37];
  id v7 = v37;

  if (!v6)
  {
    uint64_t v25 = +[MSError MSErrorWithDomain:MSErrorCryptoDomain[0] code:-26276 underlyingError:v7 description:@"unable to compute digest for signature"];
    v8 = 0;
    goto LABEL_27;
  }
  v8 = SecCertificateCopyKey([(MSCMSSignerInfo *)self signerCertificate]);
  if (!v8)
  {
    uint64_t v29 = MSErrorCryptoDomain[0];
    v30 = @"failed to get public key from certificate";
    uint64_t v31 = -26275;
LABEL_37:
    uint64_t v25 = +[MSError MSErrorWithDomain:v29 code:v31 underlyingError:v7 description:v30];
    goto LABEL_27;
  }
  id v9 = [(MSCMSSignerInfo *)self signature];

  if (!v9)
  {
    uint64_t v29 = MSErrorCMSDomain[0];
    v30 = @"signer is missing signature";
    uint64_t v31 = -50;
    goto LABEL_37;
  }
  uint64_t v10 = [(MSAlgorithmIdentifier *)self->_signatureAlgorithm algorithm];
  CFStringRef v11 = (const __CFString *)[v10 secKeyAlgorithm];

  if (!v11)
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_58);
    }
    id v12 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      signatureAlgorithm = self->_signatureAlgorithm;
      log = v12;
      uint64_t v35 = [(MSAlgorithmIdentifier *)signatureAlgorithm algorithm];
      id v32 = [v35 OIDString];
      uint64_t v33 = [(MSAlgorithmIdentifier *)self->_signatureAlgorithm algorithm];
      BOOL v14 = [v33 OIDString];
      char v15 = [(MSCMSSignerInfo *)self digestAlgorithm];
      int v16 = [v15 algorithm];
      v17 = [v16 OIDString];
      *(_DWORD *)buf = 138412802;
      CFTypeRef v40 = v32;
      __int16 v41 = 2112;
      v42 = v14;
      __int16 v43 = 2112;
      id v44 = v17;
      _os_log_impl(&dword_20D8A1000, log, OS_LOG_TYPE_INFO, "Bad signature algorithm %@. Trying to compose signature algorithm from %@ and digest %@", buf, 0x20u);
    }
    BOOL v18 = self->_signatureAlgorithm;
    digestAlgorithm = self->_digestAlgorithm;
    id v36 = v7;
    char v20 = [(MSAlgorithmIdentifier *)v18 signatureAlgorithmWithDigestAlgorithm:digestAlgorithm error:&v36];
    id v21 = v36;

    CFStringRef v11 = (const __CFString *)[v20 secKeyAlgorithm];
    if (v11)
    {
      id v7 = v21;
      goto LABEL_15;
    }
    id v26 = MSErrorCryptoDomain[0];
    id v7 = [(MSAlgorithmIdentifier *)self->_signatureAlgorithm algorithm];
    v27 = [v7 OIDString];
    uint64_t v25 = +[MSError MSErrorWithDomain:v26, -4, v21, @"%@ is not a supported signature algorithm", v27 code underlyingError description];

LABEL_27:
    BOOL v24 = 0;
    goto LABEL_28;
  }
LABEL_15:
  if (self->_LAContext && !SecKeySetParameter())
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_64_0);
    }
    unint64_t v22 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v40 = cf;
      _os_log_impl(&dword_20D8A1000, v22, OS_LOG_TYPE_ERROR, "failed to set credential reference on signer public key: %@", buf, 0xCu);
    }
    CFTypeRef v23 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v23);
    }
  }
  BOOL v24 = SecKeyVerifySignature(v8, v11, v6, (CFDataRef)[(MSCMSSignerInfo *)self signature], (CFErrorRef *)&cf) != 0;
  uint64_t v25 = (uint64_t)cf;
  if (!cf)
  {
    if (!a3) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
LABEL_28:

  id v7 = (id)v25;
  if (!a3) {
    goto LABEL_31;
  }
LABEL_29:
  if (v7) {
    *a3 = v7;
  }
LABEL_31:
  if (v8) {
    CFRelease(v8);
  }

  return v24;
}

- (NSData)signature
{
  return self->_signature;
}

- (__SecTrust)createTrustObjectWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  CFDateRef v11 = (const __CFDate *)a4;
  CFArrayRef v12 = (const __CFArray *)a5;
  BOOL v13 = (void *)MEMORY[0x263EFF980];
  BOOL v14 = [(MSCMSSignerInfo *)self certificates];
  char v15 = [v13 arrayWithArray:v14];

  SecTrustRef trust = 0;
  if (a6 && *a6) {
    int v16 = (void *)[*a6 copy];
  }
  else {
    int v16 = 0;
  }
  if ([(MSCMSSignerInfo *)self signerCertificate])
  {
    [v15 insertObject:self->_signerCertificate atIndex:0];
    OSStatus v17 = SecTrustCreateWithCertificates(v15, v10, &trust);
    if (v17)
    {
      uint64_t v25 = +[MSError MSErrorWithDomain:*MEMORY[0x263F08410] code:v17 underlyingError:v16 description:@"unable to create trust object due to security error"];

      SecTrustRef trust = 0;
      goto LABEL_20;
    }
    if (v11 && (OSStatus v18 = SecTrustSetVerifyDate(trust, v11)) != 0)
    {
      unint64_t v22 = (__CFString *)*MEMORY[0x263F08410];
      uint64_t v24 = v18;
      CFTypeRef v23 = @"failed to set verification time";
    }
    else
    {
      if (!v12 || (OSStatus v19 = SecTrustSetAnchorCertificates(trust, v12)) == 0)
      {
        if (!a6) {
          goto LABEL_14;
        }
        goto LABEL_12;
      }
      unint64_t v22 = (__CFString *)*MEMORY[0x263F08410];
      uint64_t v24 = v19;
      CFTypeRef v23 = @"failed to set anchor certificates";
    }
  }
  else
  {
    unint64_t v22 = MSErrorCMSDomain[0];
    CFTypeRef v23 = @"no certificates found in signerInfo for trust evaluation";
    uint64_t v24 = -50;
  }
  uint64_t v25 = +[MSError MSErrorWithDomain:v22 code:v24 underlyingError:v16 description:v23];

LABEL_20:
  int v16 = (void *)v25;
  if (!a6) {
    goto LABEL_14;
  }
LABEL_12:
  if (v16) {
    *a6 = v16;
  }
LABEL_14:
  char v20 = trust;

  return v20;
}

- (__SecCertificate)signerCertificate
{
  return self->_signerCertificate;
}

- (NSArray)certificates
{
  v3 = [(MSCMSSignerInfo *)self containingSignedData];

  if (v3)
  {
    id v4 = [(MSCMSSignerInfo *)self containingSignedData];
    v5 = [v4 certificates];
    CFDataRef v6 = [v5 allObjects];
  }
  else
  {
    CFDataRef v6 = 0;
  }

  return (NSArray *)v6;
}

- (MSCMSSignedData)containingSignedData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignedData);

  return (MSCMSSignedData *)WeakRetained;
}

- (id)calculateSignerInfoDigest:(id *)a3
{
  if (a3 && *a3) {
    v5 = (void *)[*a3 copy];
  }
  else {
    v5 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignedData);
  if (!WeakRetained
    || (id v7 = WeakRetained,
        id v8 = objc_loadWeakRetained((id *)&self->_containingSignedData),
        [v8 dataContent],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v7,
        !v9))
  {
    unint64_t v22 = MSErrorCMSDomain[0];
    CFTypeRef v23 = @"signer has no reference to a signedData with content";
LABEL_19:
    id v17 = +[MSError MSErrorWithDomain:v22 code:-50 underlyingError:v5 description:v23];

LABEL_20:
    id v16 = 0;
    goto LABEL_21;
  }
  if (self->_digestAlgorithm) {
    goto LABEL_11;
  }
  signatureAlgorithm = self->_signatureAlgorithm;
  if (!signatureAlgorithm)
  {
    unint64_t v22 = MSErrorCMSDomain[0];
    CFTypeRef v23 = @"signer has no signature algorithm";
    goto LABEL_19;
  }
  id v29 = v5;
  CFDateRef v11 = +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:signatureAlgorithm error:&v29];
  id v12 = v29;

  digestAlgorithm = self->_digestAlgorithm;
  self->_digestAlgorithm = v11;

  if (!self->_digestAlgorithm)
  {
    id v17 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v12 description:@"No digest algorithm specified"];

    goto LABEL_20;
  }
  v5 = v12;
LABEL_11:
  id v14 = objc_loadWeakRetained((id *)&self->_containingSignedData);
  char v15 = [(MSAlgorithmIdentifier *)self->_digestAlgorithm algorithm];
  id v28 = v5;
  id v16 = [v14 calculateContentDigestWithAlgorithm:v15 error:&v28];
  id v17 = v28;

  if (!v16) {
    goto LABEL_21;
  }
  if ([(MSCMSMutableAttributeArray *)self->_protectedAttributes count])
  {
    id v27 = v17;
    BOOL v18 = [(MSCMSSignerInfo *)self verifyContentTypeAttribute:&v27];
    id v19 = v27;

    if (!v18)
    {
      id v21 = 0;
LABEL_16:
      id v17 = v19;
      if (!a3) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    id v26 = v19;
    BOOL v20 = [(MSCMSSignerInfo *)self verifyMessageDigestAttribute:v16 error:&v26];
    id v17 = v26;

    if (v20)
    {
      id v25 = v17;
      id v21 = [(MSCMSSignerInfo *)self calculateSignedAttributesDigest:&v25];
      id v19 = v25;

      goto LABEL_16;
    }
LABEL_21:
    id v21 = 0;
    if (!a3) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  id v16 = v16;
  id v21 = v16;
  if (!a3) {
    goto LABEL_26;
  }
LABEL_24:
  if (v17) {
    *a3 = v17;
  }
LABEL_26:

  return v21;
}

- (void)dealloc
{
  signerCertificate = self->_signerCertificate;
  if (signerCertificate)
  {
    self->_signerCertificate = 0;
    CFRelease(signerCertificate);
  }
  signerPrivKey = self->_signerPrivKey;
  if (signerPrivKey)
  {
    self->_signerPrivKey = 0;
    CFRelease(signerPrivKey);
  }
  if (self->_encodedSignerInfo)
  {
    free_SignerInfo();
    free(self->_encodedSignerInfo);
    self->_encodedSignerInfo = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MSCMSSignerInfo;
  [(MSCMSSignerInfo *)&v5 dealloc];
}

uint64_t __108__MSCMSSignerInfo_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  return [(MSCMSSignerInfo *)self initWithCertificate:a3 signatureAlgorithm:0 error:a4];
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  return [(MSCMSSignerInfo *)self initWithIdentity:a3 signatureAlgorithm:0 error:a4];
}

- (MSCMSSignerInfo)initWithEmail:(id)a3 LAContext:(id)a4 error:(id *)a5
{
  return [(MSCMSSignerInfo *)self initWithEmail:a3 signatureAlgorithm:0 LAContext:a4 error:a5];
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MSCMSSignerInfo;
  id v8 = [(MSCMSSignerInfo *)&v32 init];
  if (!v8) {
    goto LABEL_24;
  }
  if (a3) {
    CFRetain(a3);
  }
  v8->_signerCertificate = a3;
  uint64_t v9 = +[MSCMSMutableAttributeArray array];
  protectedAttributes = v8->_protectedAttributes;
  v8->_protectedAttributes = (MSCMSMutableAttributeArray *)v9;

  uint64_t v11 = +[MSCMSMutableAttributeArray array];
  unprotectedAttributes = v8->_unprotectedAttributes;
  v8->_unprotectedAttributes = (MSCMSMutableAttributeArray *)v11;

  signature = v8->_signature;
  v8->_signature = 0;

  v8->_signatureCalculated = 0;
  v8->_signerPrivKey = 0;
  v8->_encodedSignerInfo = 0;
  if (!v7)
  {
    p_signatureAlgorithm = (void **)&v8->_signatureAlgorithm;
    goto LABEL_21;
  }
  uint64_t KeyTypeForCertificate = getKeyTypeForCertificate(a3);
  if (KeyTypeForCertificate == 3)
  {
    if (initWithCertificate_signatureAlgorithm_error__onceToken_4 != -1) {
      dispatch_once(&initWithCertificate_signatureAlgorithm_error__onceToken_4, &__block_literal_global_6_2);
    }
    char v15 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedECSigAlgs;
    goto LABEL_14;
  }
  if (KeyTypeForCertificate == 1)
  {
    if (initWithCertificate_signatureAlgorithm_error__onceToken != -1) {
      dispatch_once(&initWithCertificate_signatureAlgorithm_error__onceToken, &__block_literal_global_8);
    }
    char v15 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedRSASigAlgs;
LABEL_14:
    id v17 = [v7 OIDString];
    int v18 = [v15 containsObject:v17];

    if (v18)
    {
      uint64_t v19 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:v7];
      signatureAlgorithm = v8->_signatureAlgorithm;
      v8->_signatureAlgorithm = (MSAlgorithmIdentifier *)v19;
    }
  }
  p_signatureAlgorithm = (void **)&v8->_signatureAlgorithm;
  if (v8->_signatureAlgorithm) {
    goto LABEL_23;
  }
  if (MS_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_8_0);
  }
  id v21 = (void *)MS_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = v21;
    CFTypeRef v23 = [v7 OIDString];
    uint64_t v24 = getKeyTypeForCertificate(a3);
    *(_DWORD *)buf = 138412546;
    id v34 = v23;
    __int16 v35 = 2048;
    uint64_t v36 = v24;
    _os_log_impl(&dword_20D8A1000, v22, OS_LOG_TYPE_DEFAULT, "MSCMSSignerInfo init signature aglorithm %@ not permitted for certificate key type %ld", buf, 0x16u);
  }
LABEL_21:
  if (!*p_signatureAlgorithm)
  {
    id v25 = findBestMutuallySupportedSignatureAlgorithm(a3, 0);
    uint64_t v26 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:v25];
    id v27 = *p_signatureAlgorithm;
    *p_signatureAlgorithm = (void *)v26;
  }
LABEL_23:
  uint64_t v28 = +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:](MSAlgorithmIdentifier, "digestAlgorithmWithSignatureAlgorithm:error:");
  digestAlgorithm = v8->_digestAlgorithm;
  v8->_digestAlgorithm = (MSAlgorithmIdentifier *)v28;

  if (!v8->_digestAlgorithm)
  {
    v30 = 0;
    goto LABEL_26;
  }
LABEL_24:
  v30 = v8;
LABEL_26:

  return v30;
}

void __64__MSCMSSignerInfo_initWithCertificate_signatureAlgorithm_error___block_invoke()
{
  v4[6] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"1.2.840.113549.1.1.4";
  v4[1] = @"1.2.840.113549.1.1.5";
  v4[2] = @"1.2.840.113549.1.1.14";
  v4[3] = @"1.2.840.113549.1.1.11";
  v4[4] = @"1.2.840.113549.1.1.12";
  v4[5] = @"1.2.840.113549.1.1.13";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedRSASigAlgs;
  initWithCertificate_signatureAlgorithm_error__sAllowedRSASigAlgs = v2;
}

void __64__MSCMSSignerInfo_initWithCertificate_signatureAlgorithm_error___block_invoke_2()
{
  v4[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"1.2.840.10045.4.1";
  v4[1] = @"1.2.840.10045.4.3.1";
  v4[2] = @"1.2.840.10045.4.3.2";
  v4[3] = @"1.2.840.10045.4.3.3";
  v4[4] = @"1.2.840.10045.4.3.4";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedECSigAlgs;
  initWithCertificate_signatureAlgorithm_error__sAllowedECSigAlgs = v2;
}

uint64_t __64__MSCMSSignerInfo_initWithCertificate_signatureAlgorithm_error___block_invoke_3()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v7 = [(MSCMSSignerInfo *)self initWithCertificate:a3 signatureAlgorithm:a4 error:a6];
  id v8 = v7;
  if (v7) {
    [(MSCMSSignerInfo *)v7 setUseIssuerAndSerialNumber:v6];
  }

  return v8;
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v7 = [(MSCMSSignerInfo *)self initWithIdentity:a3 signatureAlgorithm:a4 error:a6];
  id v8 = v7;
  if (v7) {
    [(MSCMSSignerInfo *)v7 setUseIssuerAndSerialNumber:v6];
  }

  return v8;
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a5 && *a5) {
    uint64_t v9 = (void *)[*a5 copy];
  }
  else {
    uint64_t v9 = 0;
  }
  id v17 = v9;
  SecCertificateRef v10 = MSSecIdentityCopyCertificateWithError(a3, &v17);
  id v11 = v17;

  if (!v10)
  {
    SecKeyRef v13 = 0;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v16 = v11;
  self = [(MSCMSSignerInfo *)self initWithCertificate:v10 signatureAlgorithm:v8 error:&v16];
  id v12 = v16;

  if (!self)
  {
    SecKeyRef v13 = 0;
    id v11 = v12;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v15 = v12;
  SecKeyRef v13 = MSSecIdentityCopyKeyWithError(a3, &v15);
  id v11 = v15;

  if (v13) {
    CFRetain(v13);
  }
  self->_signerPrivKey = v13;
  if (a5)
  {
LABEL_12:
    if (v11) {
      *a5 = v11;
    }
  }
LABEL_14:
  if (v10) {
    CFRelease(v10);
  }
  if (v13) {
    CFRelease(v13);
  }

  return self;
}

- (MSCMSSignerInfo)initWithEmail:(id)a3 signatureAlgorithm:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 && *a6) {
    SecKeyRef v13 = (void *)[*a6 copy];
  }
  else {
    SecKeyRef v13 = 0;
  }
  uint64_t v19 = v13;
  IdentityByEmailAddress = (const void *)findIdentityByEmailAddress(v10, v12, &v19);
  id v15 = v19;

  if (IdentityByEmailAddress)
  {
    id v18 = v15;
    self = [(MSCMSSignerInfo *)self initWithIdentity:IdentityByEmailAddress signatureAlgorithm:v11 error:&v18];
    id v16 = v18;

    [(MSCMSSignerInfo *)self setLAContext:v12];
    if (!a6) {
      goto LABEL_11;
    }
  }
  else
  {
    id v16 = +[MSError MSErrorWithDomain:MSErrorKeychainDomain[0], -25300, v15, @"unable to find identity matching %@", v10 code underlyingError description];

    if (!a6) {
      goto LABEL_11;
    }
  }
  if (v16) {
    *a6 = v16;
  }
LABEL_11:
  if (IdentityByEmailAddress) {
    CFRelease(IdentityByEmailAddress);
  }

  return self;
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5
{
  id v8 = findBestMutuallySupportedSignatureAlgorithm(a3, a4);
  uint64_t v9 = [(MSCMSSignerInfo *)self initWithCertificate:a3 signatureAlgorithm:v8 error:a5];

  return v9;
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a5 && *a5) {
    uint64_t v9 = (void *)[*a5 copy];
  }
  else {
    uint64_t v9 = 0;
  }
  id v18 = v9;
  id v10 = MSSecIdentityCopyCertificateWithError(a3, &v18);
  id v11 = v18;

  if (!v10)
  {
    SecKeyRef v14 = 0;
    id v12 = 0;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v12 = findBestMutuallySupportedSignatureAlgorithm(v10, v8);
  id v17 = v11;
  self = [(MSCMSSignerInfo *)self initWithCertificate:v10 signatureAlgorithm:v12 error:&v17];
  id v13 = v17;

  if (!self)
  {
    SecKeyRef v14 = 0;
    id v11 = v13;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v16 = v13;
  SecKeyRef v14 = MSSecIdentityCopyKeyWithError(a3, &v16);
  id v11 = v16;

  if (v14) {
    CFRetain(v14);
  }
  self->_signerPrivKey = v14;
  if (a5)
  {
LABEL_12:
    if (v11) {
      *a5 = v11;
    }
  }
LABEL_14:
  if (v10) {
    CFRelease(v10);
  }
  if (v14) {
    CFRelease(v14);
  }

  return self;
}

- (MSCMSSignerInfo)initWithEmail:(id)a3 recipientsAlgorithmCapabilities:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 && *a6) {
    id v13 = (void *)[*a6 copy];
  }
  else {
    id v13 = 0;
  }
  IdentityByEmailAddress = (const void *)findIdentityByEmailAddress(v10, v12, a6);
  if (IdentityByEmailAddress)
  {
    id v17 = v13;
    self = [(MSCMSSignerInfo *)self initWithIdentity:IdentityByEmailAddress recipientsAlgorithmCapabilities:v11 error:&v17];
    id v15 = v17;

    [(MSCMSSignerInfo *)self setLAContext:v12];
    if (!a6) {
      goto LABEL_11;
    }
  }
  else
  {
    id v15 = +[MSError MSErrorWithDomain:MSErrorKeychainDomain[0], -25300, v13, @"unable to find identity matching %@", v10 code underlyingError description];

    if (!a6) {
      goto LABEL_11;
    }
  }
  if (v15) {
    *a6 = v15;
  }
LABEL_11:
  if (IdentityByEmailAddress) {
    CFRelease(IdentityByEmailAddress);
  }

  return self;
}

- (void)addCounterSignerAttribute:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    id v4 = [(MSCMSSignerInfo *)self unprotectedAttributes];
    [v4 addObject:v11];

    [v11 setContainingSignerInfo:self];
    objc_super v5 = [(MSCMSSignerInfo *)self containingSignedData];

    if (v5)
    {
      BOOL v6 = [(MSCMSSignerInfo *)self containingSignedData];
      objc_msgSend(v6, "addCounterSignerCertificates:mode:error:", self, objc_msgSend(v11, "chainMode"), 0);

      id v7 = [v11 additionalCertificates];

      if (v7)
      {
        id v8 = [(MSCMSSignerInfo *)self containingSignedData];
        uint64_t v9 = [v8 certificates];
        id v10 = [v11 additionalCertificates];
        [v9 addObjectsFromArray:v10];
      }
    }
  }
}

- (void)addMultipleSignaturesAttribute
{
  v3 = [(MSCMSSignerInfo *)self containingSignedData];

  if (v3)
  {
    id v4 = +[MSCMSMutableAttributeArray array];
    objc_super v5 = [(MSCMSSignerInfo *)self protectedAttributes];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__MSCMSSignerInfo_addMultipleSignaturesAttribute__block_invoke;
    v12[3] = &unk_26411CDE8;
    id v6 = v4;
    id v13 = v6;
    [v5 enumerateObjectsUsingBlock:v12];

    [(MSCMSSignerInfo *)self setProtectedAttributes:v6];
    id v7 = [(MSCMSSignerInfo *)self containingSignedData];
    id v8 = [v7 signers];

    if ([v8 count] != 1)
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = [MSCMSMultipleSignaturesAttribute alloc];
        [(MSCMSMultipleSignaturesAttribute *)v10 setSignedAttrsHashAlgorithm:self->_digestAlgorithm];
        id v11 = [(MSCMSSignerInfo *)self protectedAttributes];
        [v11 addObject:v10];

        ++v9;
      }
      while (v9 < [v8 count] - 1);
    }
  }
}

void __49__MSCMSSignerInfo_addMultipleSignaturesAttribute__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 attributeType];
  char v4 = [v3 isEqualToString:@"1.2.840.113549.1.9.2.51"];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)addSMIMECapabilitiesAttribute:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[MSCMSMutableAttributeArray array];
    id v6 = [(MSCMSSignerInfo *)self protectedAttributes];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__MSCMSSignerInfo_addSMIMECapabilitiesAttribute___block_invoke;
    v8[3] = &unk_26411CDE8;
    id v9 = v5;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v8];

    [v7 addObject:v4];
    [(MSCMSSignerInfo *)self setProtectedAttributes:v7];
  }
}

void __49__MSCMSSignerInfo_addSMIMECapabilitiesAttribute___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 attributeType];
  char v4 = [v3 isEqualToString:@"1.2.840.113549.1.9.15"];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)addSMIMEEncryptionKeyPreferenceAttribute:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[MSCMSMutableAttributeArray array];
    id v6 = [(MSCMSSignerInfo *)self protectedAttributes];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__MSCMSSignerInfo_addSMIMEEncryptionKeyPreferenceAttribute___block_invoke;
    v8[3] = &unk_26411CDE8;
    id v9 = v5;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v8];

    [v7 addObject:v4];
    [(MSCMSSignerInfo *)self setProtectedAttributes:v7];
  }
}

void __60__MSCMSSignerInfo_addSMIMEEncryptionKeyPreferenceAttribute___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 attributeType];
  char v4 = [v3 isEqualToString:@"1.2.840.113549.1.9.16.2.11"];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)addProtectedAttribute:(id)a3
{
  id v4 = a3;
  id v5 = [(MSCMSSignerInfo *)self protectedAttributes];
  [v5 addObject:v4];

  [(MSCMSSignerInfo *)self createRequiredAttributes:0];
}

- (id)calculateSignedAttributesDigest:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0;
  }
  if (!self->_digestAlgorithm)
  {
    signatureAlgorithm = self->_signatureAlgorithm;
    if (signatureAlgorithm)
    {
      id v14 = v5;
      id v7 = +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:signatureAlgorithm error:&v14];
      id v8 = v14;

      digestAlgorithm = self->_digestAlgorithm;
      self->_digestAlgorithm = v7;

      if (self->_digestAlgorithm)
      {
        id v5 = v8;
        goto LABEL_9;
      }
      id v11 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v8 description:@"No digest algorithm specified"];
    }
    else
    {
      id v11 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v5 description:@"signer has no signature algorithm"];
    }
    id v10 = 0;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_9:
  id v10 = -[MSCMSMutableAttributeArray calculateAttributesWithDigest:error:](self->_protectedAttributes, "calculateAttributesWithDigest:error:", v5);
  id v11 = v13;

  if (!a3) {
    goto LABEL_12;
  }
LABEL_10:
  if (v11) {
    *a3 = v11;
  }
LABEL_12:

  return v10;
}

- (BOOL)verifyContentTypeAttribute:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0;
  }
  id v27 = v5;
  id v6 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.3" error:&v27];
  id v7 = v27;

  id v8 = [(MSCMSSignerInfo *)self getAttributesWithType:v6];

  if (!v8 || [v8 count] != 1)
  {
    unint64_t v22 = MSErrorCMSDomain[0];
    CFTypeRef v23 = @"Missing or too many content-type attribute(s)";
    goto LABEL_16;
  }
  id v9 = [v8 objectAtIndex:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [MSCMSContentTypeAttribute alloc];
    id v12 = [v8 objectAtIndex:0];
    id v26 = v7;
    id v13 = [(MSCMSContentTypeAttribute *)v11 initWithAttribute:v12 error:&v26];
    id v14 = v26;

    id v7 = v14;
    if (!v13)
    {
LABEL_15:
      unint64_t v22 = MSErrorCMSDomain[0];
      CFTypeRef v23 = @"Could not decode content-type attribute";
LABEL_16:
      uint64_t v24 = +[MSError MSErrorWithDomain:v22 code:-26275 underlyingError:v7 description:v23];
      id v13 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    id v15 = [v8 objectAtIndex:0];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0) {
      goto LABEL_15;
    }
    id v13 = [v8 objectAtIndex:0];
    if (!v13) {
      goto LABEL_15;
    }
  }
  id v17 = [(MSCMSContentTypeAttribute *)v13 contentType];
  id v18 = [(MSCMSSignerInfo *)self containingSignedData];
  uint64_t v19 = [v18 contentType];
  char v20 = [v17 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    uint64_t v24 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-67808 underlyingError:v7 description:@"Signed content-type attribute does not match content-type in signedData"];
LABEL_17:

    BOOL v21 = 0;
    id v7 = (id)v24;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  BOOL v21 = 1;
  if (!a3) {
    goto LABEL_20;
  }
LABEL_18:
  if (v7) {
    *a3 = v7;
  }
LABEL_20:

  return v21;
}

- (BOOL)verifyMessageDigestAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4 && *a4) {
    id v7 = (void *)[*a4 copy];
  }
  else {
    id v7 = 0;
  }
  id v27 = v7;
  id v8 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.4" error:&v27];
  id v9 = v27;

  id v10 = [(MSCMSSignerInfo *)self getAttributesWithType:v8];

  if (!v10 || [v10 count] != 1)
  {
    unint64_t v22 = MSErrorCMSDomain[0];
    CFTypeRef v23 = @"Missing or too many message-digest attribute(s)";
    goto LABEL_16;
  }
  id v11 = [v10 objectAtIndex:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v13 = [MSCMSMessageDigestAttribute alloc];
    id v14 = [v10 objectAtIndex:0];
    id v26 = v9;
    id v15 = [(MSCMSMessageDigestAttribute *)v13 initWithAttribute:v14 error:&v26];
    id v16 = v26;

    id v9 = v16;
    if (!v15)
    {
LABEL_15:
      unint64_t v22 = MSErrorCMSDomain[0];
      CFTypeRef v23 = @"Could not decode message-digest attribute";
LABEL_16:
      uint64_t v24 = +[MSError MSErrorWithDomain:v22 code:-26275 underlyingError:v9 description:v23];
      id v15 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    id v17 = [v10 objectAtIndex:0];
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0) {
      goto LABEL_15;
    }
    id v15 = [v10 objectAtIndex:0];
    if (!v15) {
      goto LABEL_15;
    }
  }
  uint64_t v19 = [(MSCMSMessageDigestAttribute *)v15 messageDigest];
  char v20 = [v19 isEqual:v6];

  if ((v20 & 1) == 0)
  {
    uint64_t v24 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-67808 underlyingError:v9 description:@"Message-digest attribute failed to verify"];
LABEL_17:

    BOOL v21 = 0;
    id v9 = (id)v24;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  BOOL v21 = 1;
  if (!a4) {
    goto LABEL_20;
  }
LABEL_18:
  if (v9) {
    *a4 = v9;
  }
LABEL_20:

  return v21;
}

uint64_t __35__MSCMSSignerInfo_verifySignature___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __35__MSCMSSignerInfo_verifySignature___block_invoke_62()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (id)calculateSignatureDigestWithAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[v6 ccdigest];
  if (v7)
  {
    id v8 = [MEMORY[0x263EFF990] dataWithLength:*v7];
    id v9 = [(MSCMSSignerInfo *)self signature];
    [v9 length];
    id v10 = [(MSCMSSignerInfo *)self signature];
    [v10 bytes];
    id v11 = v8;
    [v11 mutableBytes];
    ccdigest();

LABEL_5:
    goto LABEL_6;
  }
  if (a4)
  {
    id v12 = MSErrorCryptoDomain[0];
    id v13 = *a4;
    id v9 = [v6 OIDString];
    +[MSError MSErrorWithDomain:v12, -4, v13, @"%@ is not a supported digest algorithm", v9 code underlyingError description];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)verifyCountersignatures:(id *)a3
{
  id v5 = [(MSCMSSignerInfo *)self unprotectedAttributes];
  id v6 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.6" error:0];
  id v7 = [v5 getAttributesWithType:v6];

  if (v7)
  {
    uint64_t v20 = 0;
    BOOL v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    *(void *)buf = 0;
    id v15 = buf;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__4;
    char v18 = __Block_byref_object_dispose__4;
    if (a3)
    {
      id v8 = *a3;
      if (*a3) {
        id v8 = (id)[v8 copy];
      }
    }
    else
    {
      id v8 = 0;
    }
    id v19 = v8;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__MSCMSSignerInfo_verifyCountersignatures___block_invoke_76;
    v13[3] = &unk_26411CE10;
    v13[4] = self;
    v13[5] = buf;
    v13[6] = &v20;
    [v7 enumerateObjectsUsingBlock:v13];
    if (a3)
    {
      id v11 = (void *)*((void *)v15 + 5);
      if (v11) {
        *a3 = v11;
      }
    }
    BOOL v10 = *((unsigned char *)v21 + 24) == 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_75);
    }
    id v9 = MS_DEFAULT_LOG_INTERNAL;
    BOOL v10 = 1;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8A1000, v9, OS_LOG_TYPE_INFO, "no countersignatures, returning successful verification", buf, 2u);
    }
  }

  return v10;
}

uint64_t __43__MSCMSSignerInfo_verifyCountersignatures___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __43__MSCMSSignerInfo_verifyCountersignatures___block_invoke_76(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [MSCMSCountersignatureAttribute alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112));
    BOOL v10 = [WeakRetained certificates];
    id v11 = [v10 allObjects];
    uint64_t v12 = a1[4];
    uint64_t v13 = *(void *)(v12 + 56);
    uint64_t v14 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v14 + 40);
    id v15 = [(MSCMSCountersignatureAttribute *)v8 initWithAttribute:v7 certificates:v11 LAContext:v13 containingSignerInfo:v12 error:&obj];
    objc_storeStrong((id *)(v14 + 40), obj);

    if (!v15)
    {
LABEL_8:
      uint64_t v19 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -108, *(void *)(*(void *)(a1[5] + 8) + 40), @"unable to create countersignature attribute for countersigner %lu", a3 code underlyingError description];
      id v15 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    id v15 = (MSCMSCountersignatureAttribute *)v7;
    if (!v15) {
      goto LABEL_8;
    }
  }
  uint64_t v16 = *(void *)(a1[4] + 40);
  uint64_t v17 = *(void *)(a1[5] + 8);
  id v22 = *(id *)(v17 + 40);
  BOOL v18 = [(MSCMSCountersignatureAttribute *)v15 verifyCountersignatures:v16 error:&v22];
  objc_storeStrong((id *)(v17 + 40), v22);
  if (!v18)
  {
    uint64_t v19 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -67808, *(void *)(*(void *)(a1[5] + 8) + 40), @"unable to verify countersignature(s) for countersigner %lu", a3 code underlyingError description];
LABEL_9:
    uint64_t v20 = *(void *)(a1[5] + 8);
    BOOL v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __108__MSCMSSignerInfo_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke_86(uint64_t *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [MSCMSCountersignatureAttribute alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112));
    BOOL v10 = [WeakRetained certificates];
    id v11 = [v10 allObjects];
    uint64_t v12 = a1[4];
    uint64_t v13 = *(void *)(v12 + 56);
    uint64_t v14 = *(void *)(a1[8] + 8);
    id obj = *(id *)(v14 + 40);
    id v15 = [(MSCMSCountersignatureAttribute *)v8 initWithAttribute:v7 certificates:v11 LAContext:v13 containingSignerInfo:v12 error:&obj];
    objc_storeStrong((id *)(v14 + 40), obj);

    if (!v15)
    {
LABEL_8:
      uint64_t v21 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -108, *(void *)(*(void *)(a1[8] + 8) + 40), @"unable to create countersignature attribute for countersigner %lu", a3 code underlyingError description];
      id v15 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    id v15 = (MSCMSCountersignatureAttribute *)v7;
    if (!v15) {
      goto LABEL_8;
    }
  }
  uint64_t v16 = a1[5];
  uint64_t v17 = [(id)a1[4] verifyTime:a1[6]];
  uint64_t v18 = *(void *)(a1[4] + 40);
  uint64_t v19 = a1[7];
  uint64_t v20 = *(void *)(a1[8] + 8);
  id v24 = *(id *)(v20 + 40);
  LOBYTE(v16) = [(MSCMSCountersignatureAttribute *)v15 verifyCountersignaturesAndCountersignersWithPolicies:v16 verifyTime:v17 anchorCertificates:v19 signature:v18 error:&v24];
  objc_storeStrong((id *)(v20 + 40), v24);

  if ((v16 & 1) == 0)
  {
    uint64_t v21 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -67808, *(void *)(*(void *)(a1[8] + 8) + 40), @"unable to verify countersigner %lu", a3 code underlyingError description];
LABEL_9:
    uint64_t v22 = *(void *)(a1[8] + 8);
    char v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
}

uint64_t __42__MSCMSSignerInfo_verifyTimestamps_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __42__MSCMSSignerInfo_verifyTimestamps_error___block_invoke_95(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [MSCMSTimestampAttribute alloc];
    uint64_t v9 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v9 + 40);
    BOOL v10 = [(MSCMSTimestampAttribute *)v8 initWithAttribute:v7 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    if (!v10)
    {
LABEL_8:
      uint64_t v18 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -108, *(void *)(*(void *)(a1[5] + 8) + 40), @"unable to create timestamp attribute for timestamp %lu", a3 code underlyingError description];
      BOOL v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    BOOL v10 = (MSCMSTimestampAttribute *)v7;
    if (!v10) {
      goto LABEL_8;
    }
  }
  id v11 = (id *)a1[4];
  uint64_t v12 = [v11[15] algorithm];
  uint64_t v13 = [v11 calculateSignatureDigestWithAlgorithm:v12 error:0];
  uint64_t v14 = *(void *)(a1[6] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v17 = *(void *)(a1[5] + 8);
  id v21 = *(id *)(v17 + 40);
  LOBYTE(v12) = [(MSCMSTimestampAttribute *)v10 verifyTimestamps:v16 error:&v21];
  objc_storeStrong((id *)(v17 + 40), v21);
  if ((v12 & 1) == 0)
  {
    uint64_t v18 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -67808, *(void *)(*(void *)(a1[5] + 8) + 40), @"unable to verify timestamp signature for timestamp %lu", a3 code underlyingError description];
LABEL_9:
    uint64_t v19 = *(void *)(a1[5] + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

uint64_t __61__MSCMSSignerInfo_getAttributesWithType_protectedAttributes___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 encodeAttributeWithError:0];
  id v4 = [v3 attributeType];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (__SecTrust)createTrustObjectWithPolicies:(id)a3 error:(id *)a4
{
  return [(MSCMSSignerInfo *)self createTrustObjectWithPolicies:a3 verifyTime:0 anchorCertificates:0 error:a4];
}

- (BOOL)sign:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a3 && *a3) {
    uint64_t v5 = (void *)[*a3 copy];
  }
  else {
    uint64_t v5 = 0;
  }
  CFTypeRef cf = 0;
  if (!self->_signature || ![(MSCMSSignerInfo *)self verifySignature:0])
  {
    if (!self->_signatureAlgorithm)
    {
      uint64_t v29 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v5 description:@"Could not sign data: no signature algorithm"];

      BOOL v6 = 0;
      uint64_t v5 = (void *)v29;
      if (a3)
      {
LABEL_31:
        if (v5) {
          *a3 = v5;
        }
      }
LABEL_33:
      self->_signatureCalculated = v6;
      goto LABEL_34;
    }
    id v35 = v5;
    id v7 = [(MSCMSSignerInfo *)self calculateSignerInfoDigest:&v35];
    id v8 = v35;

    if (!v7)
    {
      uint64_t v5 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v8 description:@"Could not sign data: no digest"];

LABEL_30:
      BOOL v6 = 0;
      if (a3) {
        goto LABEL_31;
      }
      goto LABEL_33;
    }
    if (!self->_signerPrivKey)
    {
      signerCertificate = self->_signerCertificate;
      if (!signerCertificate)
      {
        v30 = MSErrorCMSDomain[0];
        uint64_t v31 = @"Could not sign data: no key or certificate specified";
LABEL_41:
        uint64_t v32 = -50;
        goto LABEL_42;
      }
      LAContext = self->_LAContext;
      id v34 = v8;
      IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate(signerCertificate, LAContext, &v34);
      id v12 = v34;

      if (!IdentityByCertificate)
      {
        uint64_t v5 = +[MSError MSErrorWithDomain:MSErrorKeychainDomain[0] code:-25300 underlyingError:v12 description:@"Could not sign data: no identity in keychain for certificate"];

        goto LABEL_29;
      }
      id v33 = v12;
      uint64_t v13 = MSSecIdentityCopyKeyWithError(IdentityByCertificate, &v33);
      id v8 = v33;

      self->_signerPrivKey = v13;
      CFRelease(IdentityByCertificate);
      if (!self->_signerPrivKey)
      {
        v30 = MSErrorKeychainDomain[0];
        uint64_t v31 = @"Could not sign data: no private key";
        uint64_t v32 = -25300;
LABEL_42:
        uint64_t v5 = +[MSError MSErrorWithDomain:v30 code:v32 underlyingError:v8 description:v31];

        goto LABEL_29;
      }
    }
    uint64_t v14 = [(MSAlgorithmIdentifier *)self->_signatureAlgorithm algorithm];
    uint64_t v15 = [v14 secKeyAlgorithm];

    if (!v15)
    {
      id v25 = MSErrorCryptoDomain[0];
      id v26 = [(MSAlgorithmIdentifier *)self->_signatureAlgorithm algorithm];
      id v27 = [v26 OIDString];
      uint64_t v5 = +[MSError MSErrorWithDomain:v25, -4, v8, @"%@ is not a supported signature algorithm", v27 code underlyingError description];

LABEL_29:
      goto LABEL_30;
    }
    uint64_t v16 = [(MSAlgorithmIdentifier *)self->_signatureAlgorithm algorithm];
    int v17 = [v16 isEqualToString:@"1.2.840.113549.1.1.4"];

    if (!v17)
    {
      if (self->_LAContext && !SecKeySetParameter())
      {
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_135);
        }
        uint64_t v18 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFTypeRef v38 = cf;
          _os_log_impl(&dword_20D8A1000, v18, OS_LOG_TYPE_ERROR, "failed to set credential reference on signer private key: %@", buf, 0xCu);
        }
        CFTypeRef v19 = cf;
        if (cf)
        {
          CFTypeRef cf = 0;
          CFRelease(v19);
        }
      }
      signerPrivKey = self->_signerPrivKey;
      id v21 = [(MSAlgorithmIdentifier *)self->_signatureAlgorithm algorithm];
      Signature = (NSData *)SecKeyCreateSignature(signerPrivKey, (SecKeyAlgorithm)[v21 secKeyAlgorithm], (CFDataRef)v7, (CFErrorRef *)&cf);
      char v23 = self->_signature;
      self->_signature = Signature;

      CFTypeRef v24 = cf;
      if (cf)
      {

        id v8 = (id)v24;
      }
      BOOL v6 = self->_signature != 0;

      uint64_t v5 = v8;
      if (!a3) {
        goto LABEL_33;
      }
      goto LABEL_31;
    }
    v30 = MSErrorCryptoDomain[0];
    uint64_t v31 = @"MD5 is not supported for signing";
    goto LABEL_41;
  }
  BOOL v6 = 1;
LABEL_34:

  return v6;
}

uint64_t __24__MSCMSSignerInfo_sign___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (BOOL)createRequiredAttributes:(id *)a3
{
  protectedAttributes = self->_protectedAttributes;
  if (!protectedAttributes || ![(MSCMSMutableAttributeArray *)protectedAttributes count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignedData);
    if (!WeakRetained) {
      goto LABEL_5;
    }
    id v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)&self->_containingSignedData);
    uint64_t v9 = [v8 contentType];
    char v10 = [v9 isEqualToString:@"1.2.840.113549.1.7.1"];

    if (v10)
    {
LABEL_5:
      id v11 = 0;
      BOOL v12 = 1;
      goto LABEL_25;
    }
  }
  id v13 = objc_loadWeakRetained((id *)&self->_containingSignedData);
  if (v13
    && (uint64_t v14 = v13,
        id v15 = objc_loadWeakRetained((id *)&self->_containingSignedData),
        [v15 contentType],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v14,
        v16))
  {
    uint64_t v39 = a3;
    id v17 = objc_loadWeakRetained((id *)&self->_containingSignedData);
    uint64_t v18 = [(MSAlgorithmIdentifier *)self->_digestAlgorithm algorithm];
    id v45 = 0;
    uint64_t v19 = [v17 calculateContentDigestWithAlgorithm:v18 error:&v45];
    id v20 = v45;

    id v44 = v20;
    id v21 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.3" error:&v44];
    id v22 = v44;

    char v23 = [(MSCMSSignerInfo *)self getAttributesWithType:v21];

    id v43 = v22;
    CFTypeRef v24 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.4" error:&v43];
    id v11 = v43;

    id v25 = [(MSCMSSignerInfo *)self getAttributesWithType:v24];

    id v26 = (void *)v19;
    if (v23 && v25)
    {
      id v27 = objc_loadWeakRetained((id *)&self->_containingSignedData);
      if (([v27 contentChanged] & 1) != 0
        || [(MSCMSSignerInfo *)self contentChanged]
        || ![(MSCMSSignerInfo *)self verifyContentTypeAttribute:0])
      {
      }
      else
      {
        BOOL v28 = [(MSCMSSignerInfo *)self verifyMessageDigestAttribute:v19 error:0];

        if (v28)
        {
          a3 = v39;
          goto LABEL_22;
        }
      }
    }
    uint64_t v29 = self->_protectedAttributes;
    id v42 = v11;
    v30 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.3", &v42, v39 error];
    id v31 = v42;

    [(MSCMSMutableAttributeArray *)v29 removeAttributes:v30];
    uint64_t v32 = self->_protectedAttributes;
    id v41 = v31;
    id v33 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.4" error:&v41];
    id v11 = v41;

    [(MSCMSMutableAttributeArray *)v32 removeAttributes:v33];
    id v34 = objc_loadWeakRetained((id *)&self->_containingSignedData);
    id v35 = [v34 contentType];
    uint64_t v36 = +[MSCMSContentTypeAttribute contentTypeAttributeWithOID:v35];

    uint64_t v37 = +[MSCMSMessageDigestAttribute messageDigestAttributeWithDigest:v19];
    a3 = v40;
    if (v36)
    {
      [(MSCMSMutableAttributeArray *)self->_protectedAttributes addObject:v36];
      if (v37)
      {
        [(MSCMSMutableAttributeArray *)self->_protectedAttributes addObject:v37];

LABEL_22:
        BOOL v12 = 1;
        if (!a3) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
    }
  }
  else
  {
    id v11 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:0 description:@"Cannot encode signed attributes: no SignedData"];
  }
  BOOL v12 = 0;
  if (!a3) {
    goto LABEL_25;
  }
LABEL_23:
  if (v11)
  {
    id v11 = v11;
    *a3 = v11;
  }
LABEL_25:

  return v12;
}

- (BOOL)encodeSignerInfo:(SignerInfo *)a3 error:(id *)a4
{
  if (a4 && *a4) {
    id v7 = (id)[*a4 copy];
  }
  else {
    id v7 = 0;
  }
  if (!a3)
  {
    id v43 = MSErrorAllocationDomain[0];
    id v44 = @"Unable to encode SignerInfo: missing destination address";
LABEL_46:
    uint64_t v45 = +[MSError MSErrorWithDomain:v43 code:-50 underlyingError:v7 description:v44];

    LOBYTE(v36) = 0;
    uint64_t v9 = 0;
    BOOL v12 = 0;
    id v7 = (id)v45;
    goto LABEL_37;
  }
  a3->var6 = 0;
  *(_OWORD *)&a3->var4.var0.components = 0u;
  a3->var5 = 0u;
  *(_OWORD *)&a3->var2.var0.components = 0u;
  *(_OWORD *)&a3->var3 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var1.var1 = 0u;
  if (self->_encodedSignerInfo
    && !copy_SignerInfo()
    && [(MSCMSSignerInfo *)self verifySignature:0])
  {
    if (!self->_encodedSignerInfo->var6)
    {
      id v8 = [(MSCMSSignerInfo *)self unprotectedAttributes];
      uint64_t v9 = (MSCMSIdentifier *)[v8 count];

      if (!v9) {
        goto LABEL_14;
      }
    }
    char v10 = [(MSCMSSignerInfo *)self unprotectedAttributes];
    id v11 = [v10 encodeImplicitAttributesWithError:0];

    if (v11 && [v11 length] == self->_encodedSignerInfo->var6->var0)
    {

      uint64_t v9 = 0;
LABEL_14:
      BOOL v12 = 0;
      goto LABEL_41;
    }
  }
  free_SignerInfo();
  if (!self->_signerCertificate)
  {
    id v43 = MSErrorCMSDomain[0];
    id v44 = @"Unable to encode SignerInfo: missing signer certificate";
    goto LABEL_46;
  }
  BOOL v12 = SecCertificateGetSubjectKeyID();
  if (v12 && ![(MSCMSSignerInfo *)self useIssuerAndSerialNumber])
  {
    a3->var0 = 3;
    id v17 = [NSNumber numberWithInteger:3];
    version = self->_version;
    self->_version = v17;

    uint64_t v9 = [[MSCMSIdentifier alloc] initWithSkid:v12];
  }
  else
  {
    a3->var0 = 1;
    id v13 = [NSNumber numberWithInteger:1];
    uint64_t v14 = self->_version;
    self->_version = v13;

    CFDataRef v15 = SecCertificateCopySerialNumberData(self->_signerCertificate, 0);
    uint64_t v16 = (void *)SecCertificateCopyIssuerSequence();
    uint64_t v9 = [[MSCMSIdentifier alloc] initWithIssuerName:v16 serialNumber:v15];
  }
  id v55 = v7;
  uint64_t v19 = [(MSCMSIdentifier *)v9 encodeMessageSecurityObject:&v55];
  id v20 = v55;

  [(MSCMSSignerInfo *)self setIdentifierData:v19];
  id v21 = [(MSCMSSignerInfo *)self identifierData];
  v54[1] = (id)[v21 length];
  id v22 = [(MSCMSSignerInfo *)self identifierData];
  v54[2] = (id)[v22 bytes];

  copy_SignerIdentifier();
  signatureAlgorithm = self->_signatureAlgorithm;
  if (!signatureAlgorithm)
  {
    id v46 = MSErrorCMSDomain[0];
    id v47 = @"Signer has no signature algorithm";
LABEL_50:
    id v7 = +[MSError MSErrorWithDomain:v46 code:-50 underlyingError:v20 description:v47];

    goto LABEL_51;
  }
  [(MSAlgorithmIdentifier *)signatureAlgorithm asn1AlgId];
  copy_AlgorithmIdentifier();
  digestAlgorithm = self->_digestAlgorithm;
  if (digestAlgorithm) {
    goto LABEL_26;
  }
  id v25 = self->_signatureAlgorithm;
  if (!v25)
  {
    id v46 = MSErrorCMSDomain[0];
    id v47 = @"signer has no signature algorithm";
    goto LABEL_50;
  }
  v54[0] = v20;
  id v26 = +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:v25 error:v54];
  id v27 = v54[0];

  BOOL v28 = self->_digestAlgorithm;
  self->_digestAlgorithm = v26;

  digestAlgorithm = self->_digestAlgorithm;
  if (!digestAlgorithm)
  {
    id v7 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v27 description:@"No digest algorithm specified"];

    goto LABEL_51;
  }
  id v20 = v27;
LABEL_26:
  [(MSAlgorithmIdentifier *)digestAlgorithm asn1AlgId];
  copy_AlgorithmIdentifier();
  id v53 = v20;
  BOOL v29 = [(MSCMSSignerInfo *)self createRequiredAttributes:&v53];
  id v7 = v53;

  if (!v29)
  {
LABEL_51:
    LOBYTE(v36) = 0;
    goto LABEL_37;
  }
  protectedAttributes = self->_protectedAttributes;
  if (protectedAttributes && [(MSCMSMutableAttributeArray *)protectedAttributes count])
  {
    a3->var3 = (heim_base_data *)malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
    id v31 = self->_protectedAttributes;
    id v52 = v7;
    uint64_t v32 = [(MSCMSMutableAttributeArray *)v31 encodeImplicitAttributesWithError:&v52];
    id v33 = v52;

    [(MSCMSSignerInfo *)self setSignedAttrsData:v32];
    uint64_t v50 = [v32 length];
    id v34 = v32;
    uint64_t v51 = [v34 bytes];
    MEMORY[0x21055FED0](&v50, a3->var3);

    id v7 = v33;
  }
  id v35 = v7;
  id v49 = v7;
  LODWORD(v36) = [(MSCMSSignerInfo *)self sign:&v49];
  id v7 = v49;

  if (v36)
  {
    v48[1] = (id)[(NSData *)self->_signature length];
    v48[2] = (id)[(NSData *)self->_signature bytes];
    copy_SignatureValue();
    unprotectedAttributes = self->_unprotectedAttributes;
    if (unprotectedAttributes && [(MSCMSMutableAttributeArray *)unprotectedAttributes count])
    {
      a3->var6 = (heim_base_data *)malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
      CFTypeRef v38 = self->_unprotectedAttributes;
      v48[0] = v7;
      uint64_t v36 = [(MSCMSMutableAttributeArray *)v38 encodeImplicitAttributesWithError:v48];
      id v39 = v48[0];

      [(MSCMSSignerInfo *)self setUnsignedAttrsData:v36];
      uint64_t v50 = [(id)v36 length];
      id v40 = (id) v36;
      uint64_t v51 = [v40 bytes];
      MEMORY[0x21055FED0](&v50, a3->var6);

      LOBYTE(v36) = 1;
      id v7 = v39;
    }
    else
    {
      if (a3->var6) {
        a3->var6 = 0;
      }
      LOBYTE(v36) = 1;
    }
  }
LABEL_37:
  if (a4 && v7) {
    *a4 = v7;
  }
  if ((v36 & 1) == 0)
  {
    free_SignerInfo();
    BOOL v41 = 0;
    a3->var6 = 0;
    *(_OWORD *)&a3->var4.var0.components = 0u;
    a3->var5 = 0u;
    *(_OWORD *)&a3->var2.var0.components = 0u;
    *(_OWORD *)&a3->var3 = 0u;
    *(_OWORD *)&a3->var0 = 0u;
    *(_OWORD *)&a3->var1.var1 = 0u;
    goto LABEL_43;
  }
LABEL_41:
  BOOL v41 = 1;
LABEL_43:

  return v41;
}

- (MSAlgorithmIdentifier)signatureAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (MSCMSMutableAttributeArray)protectedAttributes
{
  return (MSCMSMutableAttributeArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)LAContext
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (__SecKey)signerPrivKey
{
  return self->_signerPrivKey;
}

- (void)setSignerPrivKey:(__SecKey *)a3
{
  self->_signerPrivKey = a3;
}

- (BOOL)useIssuerAndSerialNumber
{
  return self->_useIssuerAndSerialNumber;
}

- (void)setUseIssuerAndSerialNumber:(BOOL)a3
{
  self->_useIssuerAndSerialNumber = a3;
}

- (NSData)signedAttrsData
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSignedAttrsData:(id)a3
{
}

- (NSData)unsignedAttrsData
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUnsignedAttrsData:(id)a3
{
}

- (NSData)identifierData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIdentifierData:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)contentChanged
{
  return self->_contentChanged;
}

- (void)setContentChanged:(BOOL)a3
{
  self->_contentChanged = a3;
}

- (BOOL)signatureCalculated
{
  return self->_signatureCalculated;
}

@end