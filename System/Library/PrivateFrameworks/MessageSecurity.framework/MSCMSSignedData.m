@interface MSCMSSignedData
+ (BOOL)isImplementedInObjectiveC;
+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)addCertificatesForSigner:(id)a3 mode:(unint64_t)a4 error:(id *)a5;
- (BOOL)addSigner:(id)a3 withChainMode:(unint64_t)a4 error:(id *)a5;
- (BOOL)checkSignedPerRFC5652:(id *)a3;
- (BOOL)contentChanged;
- (BOOL)detached;
- (BOOL)verifySignatures:(id *)a3;
- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6;
- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 error:(id *)a5;
- (MSCMSMessage)embeddedContent;
- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 additionalCertificates:(id)a6 error:(id *)a7;
- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 error:(id *)a6;
- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 signerChainMode:(unint64_t)a6 error:(id *)a7;
- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 additionalCertificates:(id)a5 error:(id *)a6;
- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 error:(id *)a5;
- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 signerChainMode:(unint64_t)a5 error:(id *)a6;
- (MSDecodeOptions)options;
- (MSOID)contentType;
- (MSOID)type;
- (NSArray)signers;
- (NSData)dataContent;
- (NSMutableSet)certificates;
- (NSNumber)version;
- (NSSet)digestAlgorithms;
- (__SecCertificate)getSignerCertificate:(unint64_t)a3 error:(id *)a4;
- (id)calculateContentDigestWithAlgorithm:(id)a3 error:(id *)a4;
- (id)encodeMessageSecurityObject:(id *)a3;
- (id)initCertsOnlyWithCertificates:(id)a3 error:(id *)a4;
- (void)addCounterSignerCertificates:(id)a3 mode:(unint64_t)a4 error:(id *)a5;
- (void)addDigestAlgorithmFromSigner:(id)a3;
- (void)addSigner:(id)a3;
- (void)addSigner:(id)a3 withCertificates:(id)a4;
- (void)removeSignerCertificatesWithIndexes:(id)a3;
- (void)removeSignersWithCertificate:(__SecCertificate *)a3 error:(id *)a4;
- (void)removeSignersWithEmailAddress:(id)a3 error:(id *)a4;
- (void)removeSignersWithIdentity:(__SecIdentity *)a3 error:(id *)a4;
- (void)removeSignersWithIndexes:(id)a3 error:(id *)a4;
- (void)setCertificates:(id)a3;
- (void)setContentChanged:(BOOL)a3;
- (void)setContentType:(id)a3;
- (void)setDataContent:(id)a3;
- (void)setDetached:(BOOL)a3;
- (void)setDigestAlgorithms:(id)a3;
- (void)setEmbeddedContent:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSigners:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MSCMSSignedData

- (NSArray)signers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 error:(id *)a5
{
  return [(MSCMSSignedData *)self verifySignaturesAndSignersWithPolicies:a3 verifyTime:a4 anchorCertificates:0 error:a5];
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v62 = a4;
  v57 = a5;
  if (a5 && *a5) {
    v8 = (void *)[*a5 copy];
  }
  else {
    v8 = 0;
  }
  v9 = [MSCMSSignedData alloc];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v59 = v7;
  int v10 = nsheim_decode_CMSSignedData(v7);
  if (v10)
  {
    v11 = MSErrorASN1Domain[0];
    if (v7) {
      uint64_t v12 = [v7 length];
    }
    else {
      uint64_t v12 = -1;
    }
    id v19 = +[MSError MSErrorWithDomain:v11, v10, v8, @"unable to decode signedData (%ld bytes)", v12 code underlyingError description];

    dumpNSData("CMSSignedData", v7);
    v20 = 0;
    v60 = 0;
    v61 = 0;
    goto LABEL_16;
  }
  v13 = [NSNumber numberWithInt:v71];
  [(MSCMSSignedData *)v9 setVersion:v13];

  v60 = [MEMORY[0x263EFF9C0] setWithCapacity:DWORD2(v71)];
  if (DWORD2(v71))
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      memset(buf, 0, sizeof(buf));
      uint64_t v77 = 0;
      uint64_t v16 = *(void *)(v72 + v14 + 16);
      *(_OWORD *)buf = *(_OWORD *)(v72 + v14);
      uint64_t v77 = v16;
      id v70 = v8;
      v17 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:buf error:&v70];
      id v18 = v70;

      if (v17) {
        [v60 addObject:v17];
      }

      ++v15;
      v14 += 24;
      v8 = v18;
    }
    while (v15 < DWORD2(v71));
  }
  else
  {
    id v18 = v8;
  }
  [(MSCMSSignedData *)v9 setDigestAlgorithms:v60];
  id v69 = v18;
  v58 = +[MSOID OIDWithAsn1OID:(char *)&v72 + 8 error:&v69];
  id v23 = v69;

  if (!v58)
  {
    id v19 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v23 description:@"unable to get contentType from signedData"];

    v20 = 0;
    v61 = 0;
LABEL_16:
    v56 = 0;
    v58 = 0;
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  -[MSCMSSignedData setContentType:](v9, "setContentType:");
  uint64_t v24 = *((void *)&v73 + 1);
  if (*((void *)&v73 + 1))
  {
    v25 = NSDataFromAny(*((void **)&v73 + 1));
    [(MSCMSSignedData *)v9 setDataContent:v25];
  }
  [(MSCMSSignedData *)v9 setDetached:v24 == 0];
  if ([v58 isEqualToString:@"1.2.840.113549.1.7.1"])
  {
    v56 = 0;
  }
  else
  {
    v26 = [(MSCMSSignedData *)v9 dataContent];
    id v68 = v23;
    v56 = decodeEmbeddedCMSContent(v58, v26, v62, (uint64_t)&v68);
    id v27 = v68;

    if (v56) {
      -[MSCMSSignedData setEmbeddedContent:](v9, "setEmbeddedContent:");
    }
    else {
      v56 = 0;
    }
    id v23 = v27;
  }
  [(MSCMSSignedData *)v9 setContentChanged:0];
  if ((void)v74)
  {
    v20 = [MEMORY[0x263EFF9C0] setWithCapacity:*(unsigned int *)v74];
    uint64_t v28 = v74;
    if (*(_DWORD *)v74)
    {
      uint64_t v29 = 0;
      unint64_t v30 = 0;
      while (*(_DWORD *)(*(void *)(v28 + 8) + v29) == 1)
      {
        v31 = (void *)SecCertificateCreateWithBytes();
        if (!v31)
        {
          if (MS_DEFAULT_LOG_BLOCK != -1) {
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_116);
          }
          uint64_t v35 = MS_DEFAULT_LOG_INTERNAL;
          if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_49;
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v30;
          v33 = v35;
          v34 = "unable to parse certificate at %u";
          goto LABEL_48;
        }
        [v20 addObject:v31];

LABEL_49:
        ++v30;
        uint64_t v28 = v74;
        v29 += 24;
        if (v30 >= *(unsigned int *)v74) {
          goto LABEL_56;
        }
      }
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_113);
      }
      uint64_t v32 = MS_DEFAULT_LOG_INTERNAL;
      if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v30;
      v33 = v32;
      v34 = "skipping non-certificate CertificateChoice at %u";
LABEL_48:
      _os_log_impl(&dword_20D8A1000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 8u);
      goto LABEL_49;
    }
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_119);
    }
    v36 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8A1000, v36, OS_LOG_TYPE_INFO, "No certificates in SignedData", buf, 2u);
    }
    v20 = [MEMORY[0x263EFF9C0] set];
  }
LABEL_56:
  v37 = [v62 additionalCertificates];

  if (v37)
  {
    v38 = [v62 additionalCertificates];
    [v20 addObjectsFromArray:v38];
  }
  [(MSCMSSignedData *)v9 setCertificates:v20];
  v61 = [MEMORY[0x263EFF980] arrayWithCapacity:v75];
  if (v75)
  {
    uint64_t v39 = 0;
    unint64_t v40 = 0;
    do
    {
      uint64_t v41 = *((void *)&v75 + 1);
      v42 = [v20 allObjects];
      v43 = [v62 LAContext];
      id v67 = v23;
      v44 = +[MSCMSSignerInfo decodeSignerInfo:v41 + v39 certificates:v42 LAContext:v43 error:&v67];
      id v45 = v67;

      if (v44)
      {
        [v44 setContainingSignedData:v9];
        [v61 addObject:v44];
        [(MSCMSSignedData *)v9 addDigestAlgorithmFromSigner:v44];
        id v23 = v45;
      }
      else
      {
        id v23 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -26275, 2, v45, @"failed to create signerInfo object for signer %u", v40 code errorLevel underlyingError description];
      }
      ++v40;
      v39 += 104;
    }
    while (v40 < v75);
  }
  [(MSCMSSignedData *)v9 setSigners:v61];
  id v66 = v23;
  BOOL v46 = [(MSCMSSignedData *)v9 checkSignedPerRFC5652:&v66];
  id v47 = v66;

  if (!v46)
  {
    id v19 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v47 description:@"decode failed for signedData due to RFC 5652 violation"];

    goto LABEL_17;
  }
  [(MSCMSSignedData *)v9 setOptions:v62];
  if ([v62 verifySigners])
  {
    v48 = [v62 signerPolicies];
    v49 = [v62 verifyTime];
    v50 = [v62 anchorCertificates];
    id v65 = v47;
    BOOL v51 = [(MSCMSSignedData *)v9 verifySignaturesAndSignersWithPolicies:v48 verifyTime:v49 anchorCertificates:v50 error:&v65];
    id v19 = v65;

    if (!v51)
    {
      uint64_t v52 = +[MSError MSErrorWithDomain:MSErrorTrustDomain code:-67808 underlyingError:v19 description:@"decode failed due to signer verification failure"];

      v9 = 0;
      id v19 = (id)v52;
    }
  }
  else if (([v62 verifySignatures] & 1) != 0 || objc_msgSend(v62, "verifyTimestamps"))
  {
    id v64 = v47;
    BOOL v53 = [(MSCMSSignedData *)v9 verifySignatures:&v64];
    id v19 = v64;

    if (!v53)
    {
      uint64_t v54 = +[MSError MSErrorWithDomain:MSErrorCryptoDomain[0] code:-67808 underlyingError:v19 description:@"decode failed due to signature verification failure"];

      v9 = 0;
      id v19 = (id)v54;
    }
    if ([v62 verifyTimestamps])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      uint64_t v77 = 0x3032000000;
      v78 = __Block_byref_object_copy__0;
      v79 = __Block_byref_object_dispose__0;
      id v80 = 0;
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_133;
      v63[3] = &unk_26411C930;
      v63[4] = buf;
      [v61 enumerateObjectsUsingBlock:v63];
      if (*(void *)(*(void *)&buf[8] + 40) || ![v61 count])
      {
        uint64_t v55 = +[MSError MSErrorWithDomain:MSErrorCryptoDomain[0] code:-67808 underlyingError:v19 description:@"decode failed due to timestamp verification failure"];

        v9 = 0;
        id v19 = (id)v55;
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v19 = v47;
  }
LABEL_18:
  if (v57 && v19) {
    id *v57 = v19;
  }
  free_CMSSignedData();
  v21 = v9;

  return v21;
}

- (void)setDigestAlgorithms:(id)a3
{
}

- (void)setVersion:(id)a3
{
}

- (void)setSigners:(id)a3
{
}

- (void)setOptions:(id)a3
{
}

- (void)setDetached:(BOOL)a3
{
  self->_detached = a3;
}

- (void)setDataContent:(id)a3
{
  v5 = (NSData *)a3;
  dataContent = self->_dataContent;
  if (dataContent != v5)
  {
    self->_dataContent = 0;
    id v7 = v5;

    objc_storeStrong((id *)&self->_dataContent, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }
}

- (void)setContentType:(id)a3
{
  v5 = (MSOID *)a3;
  contentType = self->_contentType;
  if (contentType != v5)
  {
    self->_contentType = 0;
    id v7 = v5;

    objc_storeStrong((id *)&self->_contentType, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }
}

- (void)setContentChanged:(BOOL)a3
{
  self->_contentChanged = a3;
}

- (void)setCertificates:(id)a3
{
}

- (BOOL)checkSignedPerRFC5652:(id *)a3
{
  if (a3 && *a3) {
    v5 = (void *)[*a3 copy];
  }
  else {
    v5 = 0;
  }
  if (![(NSArray *)self->_signers count]
    && (![(MSOID *)self->_contentType isEqualToString:@"1.2.840.113549.1.7.1"]
     || (dataContent = self->_dataContent) != 0 && [(NSData *)dataContent length]))
  {
    uint64_t v9 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-26275 underlyingError:v5 description:@"signedData contains content but has no signers"];

    BOOL v7 = 0;
    v5 = (void *)v9;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (![(MSOID *)self->_contentType isEqualToString:@"1.2.840.113549.1.7.1"]) {
    [(NSArray *)self->_signers enumerateObjectsUsingBlock:&__block_literal_global_50];
  }
  BOOL v7 = 1;
  if (a3)
  {
LABEL_12:
    if (v5) {
      *a3 = v5;
    }
  }
LABEL_14:

  return v7;
}

- (void)addDigestAlgorithmFromSigner:(id)a3
{
  id v7 = [a3 digestAlgorithm];
  if (v7)
  {
    v4 = (void *)MEMORY[0x263EFF9C0];
    v5 = [(MSCMSSignedData *)self digestAlgorithms];
    v6 = [v4 setWithSet:v5];

    [v6 addObject:v7];
    [(MSCMSSignedData *)self setDigestAlgorithms:v6];
  }
}

- (NSSet)digestAlgorithms
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

void __94__MSCMSSignedData_verifySignaturesAndSignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  if (([v16 verifySignatureAndSignerWithPolicies:a1[4] verifyTime:a1[5] anchorCertificates:a1[6] error:a1[9]] & 1) == 0)
  {
    uint64_t v7 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -67808, *(void *)(*(void *)(a1[7] + 8) + 40), @"signer verification failed for signer %lu", a3 code underlyingError description];
    uint64_t v8 = *(void *)(a1[7] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    if (([v16 verifyCountersignaturesAndCountersignersWithPolicies:a1[4] verifyTime:a1[5] anchorCertificates:a1[6] error:a1[9]] & 1) == 0)
    {
      uint64_t v10 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -67808, *(void *)(*(void *)(a1[7] + 8) + 40), @"countersigner verification failed for signer %lu", a3 code underlyingError description];
      uint64_t v11 = *(void *)(a1[7] + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *a4 = 1;
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
    }
    if (!*(unsigned char *)(*(void *)(a1[8] + 8) + 24) && ([v16 verifyTimestamps:a1[9]] & 1) == 0)
    {
      uint64_t v13 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -67808, *(void *)(*(void *)(a1[7] + 8) + 40), @"countersignature verification failed for signer %lu", a3 code underlyingError description];
      uint64_t v14 = *(void *)(a1[7] + 8);
      unint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a4 = 1;
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
    }
  }
}

- (NSData)dataContent
{
  return self->_dataContent;
}

- (NSMutableSet)certificates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (id)calculateContentDigestWithAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)[v6 ccdigest];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF990] dataWithLength:*v7];
    [(NSData *)self->_dataContent length];
    [(NSData *)self->_dataContent bytes];
    a4 = v8;
    [a4 mutableBytes];
    ccdigest();
  }
  else if (a4)
  {
    uint64_t v9 = MSErrorCryptoDomain[0];
    id v10 = *a4;
    uint64_t v11 = [v6 OIDString];
    *a4 = +[MSError MSErrorWithDomain:v9, -4, v10, @"%@ is not a supported digest algorithm", v11 code underlyingError description];

    a4 = 0;
  }

  return a4;
}

- (BOOL)detached
{
  return self->_detached;
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_digestAlgorithms, 0);
  objc_storeStrong((id *)&self->_signers, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_embeddedContent, 0);

  objc_storeStrong((id *)&self->_dataContent, 0);
}

- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  uint64_t v32 = __Block_byref_object_dispose__0;
  if (a6)
  {
    id v13 = *a6;
    if (*a6) {
      id v13 = (id)[v13 copy];
    }
  }
  else
  {
    id v13 = 0;
  }
  id v33 = v13;
  signers = self->_signers;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __94__MSCMSSignedData_verifySignaturesAndSignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke;
  v21[3] = &unk_26411CA20;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  v25 = &v28;
  v26 = &v34;
  id v27 = a6;
  [(NSArray *)signers enumerateObjectsUsingBlock:v21];
  if (a6)
  {
    id v18 = (void *)v29[5];
    if (v18) {
      *a6 = v18;
    }
  }
  BOOL v19 = *((unsigned char *)v35 + 24) == 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

- (void)setEmbeddedContent:(id)a3
{
  v5 = (MSCMSMessage *)a3;
  embeddedContent = self->_embeddedContent;
  if (embeddedContent != v5)
  {
    self->_embeddedContent = 0;
    uint64_t v7 = v5;

    objc_storeStrong((id *)&self->_embeddedContent, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }
}

- (void)addCounterSignerCertificates:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v8 = [a3 unprotectedAttributes];
  uint64_t v9 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.6" error:0];
  id v10 = [v8 getAttributesWithType:v9];

  if (v10)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v27 = v10;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (!v11) {
      goto LABEL_25;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    unint64_t v14 = 0x26411C000uLL;
    uint64_t v28 = *(void *)v36;
    while (1)
    {
      uint64_t v15 = 0;
      uint64_t v29 = v12;
      do
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = (id)[objc_alloc(*(Class *)(v14 + 1016)) initWithAttribute:v16 certificates:0 LAContext:0 containingSignerInfo:0 error:0];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_23;
          }
          id v17 = v16;
        }
        id v18 = v17;
        if (v17)
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          BOOL v19 = [v17 signers];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v32 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                unint64_t v25 = objc_msgSend(v18, "chainMode", v27);
                if (v25 <= a4) {
                  unint64_t v26 = a4;
                }
                else {
                  unint64_t v26 = v25;
                }
                [(MSCMSSignedData *)self addCertificatesForSigner:v24 mode:v26 error:a5];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v21);
          }

          uint64_t v13 = v28;
          uint64_t v12 = v29;
          unint64_t v14 = 0x26411C000;
        }
LABEL_23:
        ++v15;
      }
      while (v15 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (!v12)
      {
LABEL_25:

        id v10 = v27;
        break;
      }
    }
  }
}

- (BOOL)addCertificatesForSigner:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (a5 && *a5) {
    uint64_t v9 = (void *)[*a5 copy];
  }
  else {
    uint64_t v9 = 0;
  }
  if (a4 - 2 < 2)
  {
    if (v8 && [v8 signerCertificate])
    {
      id v27 = v9;
      id v10 = MSSecTrustCreateWithError([v8 signerCertificate], 0, 0, 0, &v27);
      id v12 = v27;

      if (v10)
      {
        CFErrorRef err = 0;
        if (!SecTrustEvaluateWithError(v10, &err))
        {
          if (err) {
            CFStringRef v13 = CFErrorCopyDescription(err);
          }
          else {
            CFStringRef v13 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "Error Unavailable", 0x8000100u);
          }
          CFStringRef v14 = v13;
          if (MS_DEFAULT_LOG_BLOCK != -1) {
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_3);
          }
          uint64_t v15 = MS_DEFAULT_LOG_INTERNAL;
          if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v29 = v14;
            _os_log_impl(&dword_20D8A1000, v15, OS_LOG_TYPE_DEFAULT, "MSCMSChainMode with chain specified, but no trusted chain found (%@), continuing with untrusted chain", buf, 0xCu);
          }
          CFErrorRef v16 = err;
          if (err)
          {
            CFErrorRef err = 0;
            CFRelease(v16);
          }
        }
        CFArrayRef v17 = SecTrustCopyCertificateChain(v10);
        id v18 = (void *)[(__CFArray *)v17 mutableCopy];

        unint64_t v19 = [v18 count];
        unint64_t v20 = v19 - 1;
        if (v19 <= 1)
        {
          if (MS_DEFAULT_LOG_BLOCK != -1) {
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_16);
          }
          uint64_t v21 = MS_DEFAULT_LOG_INTERNAL;
          if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D8A1000, v21, OS_LOG_TYPE_DEFAULT, "MSCMSChainMode with chain specified, but could not build chain beyond leaf, continuing with single certificate", buf, 2u);
          }
        }
        if (a4 == 2)
        {
          [v18 objectAtIndexedSubscript:v20];

          buf[0] = 0;
          if (!SecCertificateIsSelfSigned())
          {
            if (buf[0]) {
              [v18 removeLastObject];
            }
          }
        }
        [(NSMutableSet *)self->_certificates addObjectsFromArray:v18];

        BOOL v11 = 1;
      }
      else
      {
        uint64_t v25 = +[MSError MSErrorWithDomain:MSErrorTrustDomain code:-25245 underlyingError:v12 description:@"unable to build chain according to mode; could not evaluate trust"];

        BOOL v11 = 0;
        id v12 = (id)v25;
      }
      goto LABEL_37;
    }
    id v23 = MSErrorCMSDomain[0];
    uint64_t v24 = @"unable to build chain according to mode; missing signer info or signer certificate missing from signer info";
  }
  else
  {
    if (!a4)
    {
      BOOL v11 = 1;
      goto LABEL_43;
    }
    if (a4 != 1)
    {
      id v10 = 0;
      BOOL v11 = 0;
      goto LABEL_19;
    }
    if (v8 && [v8 signerCertificate])
    {
      -[NSMutableSet addObject:](self->_certificates, "addObject:", [v8 signerCertificate]);
      id v10 = 0;
      BOOL v11 = 1;
LABEL_19:
      id v12 = v9;
      goto LABEL_37;
    }
    id v23 = MSErrorCMSDomain[0];
    uint64_t v24 = @"unable to add signer cert to certificates; missing signer info or signer certificate missing from signer info";
  }
  id v12 = +[MSError MSErrorWithDomain:v23 code:-50 underlyingError:v9 description:v24];

  id v10 = 0;
  BOOL v11 = 0;
LABEL_37:
  if (a5 && v12) {
    *a5 = v12;
  }
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v9 = v12;
LABEL_43:

  return v11;
}

uint64_t __55__MSCMSSignedData_addCertificatesForSigner_mode_error___block_invoke()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __55__MSCMSSignedData_addCertificatesForSigner_mode_error___block_invoke_14()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MSCMSSignedData;
  CFStringRef v13 = [(MSCMSSignedData *)&v30 init];
  if (v13)
  {
    CFStringRef v14 = [v12 signatureAlgorithm];
    uint64_t v15 = [v14 algorithm];
    CFErrorRef v16 = +[MSOID digestOIDWithSignatureAlgorithm:v15 error:a6];

    if (!v16) {
      goto LABEL_6;
    }
    CFArrayRef v17 = (void *)MEMORY[0x263EFFA08];
    id v18 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:v16];
    uint64_t v19 = [v17 setWithObject:v18];
    digestAlgorithms = v13->_digestAlgorithms;
    v13->_digestAlgorithms = (NSSet *)v19;

    objc_storeStrong((id *)&v13->_dataContent, a3);
    v13->_contentChanged = 1;
    embeddedContent = v13->_embeddedContent;
    v13->_embeddedContent = 0;

    v13->_detached = a4;
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObject:v12];
    signers = v13->_signers;
    v13->_signers = (NSArray *)v22;

    [v12 setContainingSignedData:v13];
    uint64_t v24 = +[MSOID OIDWithString:@"1.2.840.113549.1.7.1" error:a6];
    contentType = v13->_contentType;
    v13->_contentType = (MSOID *)v24;

    if (![v12 signerCertificate])
    {
LABEL_6:

      uint64_t v28 = 0;
      goto LABEL_7;
    }
    uint64_t v26 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObject:", objc_msgSend(v12, "signerCertificate"));
    certificates = v13->_certificates;
    v13->_certificates = (NSMutableSet *)v26;

    [(MSCMSSignedData *)v13 addCounterSignerCertificates:v12 mode:1 error:0];
  }
  uint64_t v28 = v13;
LABEL_7:

  return v28;
}

- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 additionalCertificates:(id)a6 error:(id *)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  CFStringRef v13 = [(MSCMSSignedData *)self initWithDataContent:a3 isDetached:v9 signer:a5 error:a7];
  CFStringRef v14 = v13;
  if (v12 && v13) {
    [(NSMutableSet *)v13->_certificates addObjectsFromArray:v12];
  }

  return v14;
}

- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 signerChainMode:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a4;
  id v12 = a5;
  CFStringRef v13 = [(MSCMSSignedData *)self initWithDataContent:a3 isDetached:v9 signer:v12 error:a7];
  CFStringRef v14 = v13;
  if (!v13) {
    goto LABEL_7;
  }
  if (!a6)
  {
    [(NSMutableSet *)v13->_certificates removeAllObjects];
    goto LABEL_6;
  }
  if ([(MSCMSSignedData *)v13 addCertificatesForSigner:v12 mode:a6 error:a7])
  {
LABEL_6:
    [(MSCMSSignedData *)v14 addCounterSignerCertificates:v12 mode:a6 error:0];
LABEL_7:
    uint64_t v15 = v14;
    goto LABEL_8;
  }
  uint64_t v15 = 0;
LABEL_8:

  return v15;
}

- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MSCMSSignedData;
  id v11 = [(MSCMSSignedData *)&v27 init];
  if (!v11) {
    goto LABEL_4;
  }
  id v12 = [v10 signatureAlgorithm];
  CFStringRef v13 = [v12 algorithm];
  CFStringRef v14 = +[MSOID digestOIDWithSignatureAlgorithm:v13 error:a5];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x263EFFA08];
    CFErrorRef v16 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:v14];
    uint64_t v17 = [v15 setWithObject:v16];
    digestAlgorithms = v11->_digestAlgorithms;
    v11->_digestAlgorithms = (NSSet *)v17;

    dataContent = v11->_dataContent;
    v11->_dataContent = 0;

    objc_storeStrong((id *)&v11->_embeddedContent, a3);
    v11->_detached = 0;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObject:v10];
    signers = v11->_signers;
    v11->_signers = (NSArray *)v20;

    [v10 setContainingSignedData:v11];
    uint64_t v22 = [v9 type];
    contentType = v11->_contentType;
    v11->_contentType = (MSOID *)v22;

    uint64_t v24 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObject:", objc_msgSend(v10, "signerCertificate"));
    certificates = v11->_certificates;
    v11->_certificates = (NSMutableSet *)v24;

    [(MSCMSSignedData *)v11 addCounterSignerCertificates:v10 mode:1 error:0];
LABEL_4:
    CFStringRef v14 = v11;
  }

  return v14;
}

- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 additionalCertificates:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = [(MSCMSSignedData *)self initWithEmbeddedContent:a3 signer:a4 error:a6];
  id v12 = v11;
  if (v10 && v11) {
    [(NSMutableSet *)v11->_certificates addObjectsFromArray:v10];
  }

  return v12;
}

- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 signerChainMode:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [(MSCMSSignedData *)self initWithEmbeddedContent:a3 signer:v10 error:a6];
  id v12 = v11;
  if (!v11) {
    goto LABEL_7;
  }
  if (!a5)
  {
    [(NSMutableSet *)v11->_certificates removeAllObjects];
    goto LABEL_6;
  }
  if ([(MSCMSSignedData *)v11 addCertificatesForSigner:v10 mode:a5 error:a6])
  {
LABEL_6:
    [(MSCMSSignedData *)v12 addCounterSignerCertificates:v10 mode:a5 error:0];
LABEL_7:
    CFStringRef v13 = v12;
    goto LABEL_8;
  }
  CFStringRef v13 = 0;
LABEL_8:

  return v13;
}

- (id)initCertsOnlyWithCertificates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MSCMSSignedData;
  uint64_t v7 = [(MSCMSSignedData *)&v20 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFFA08] set];
    digestAlgorithms = v7->_digestAlgorithms;
    v7->_digestAlgorithms = (NSSet *)v8;

    dataContent = v7->_dataContent;
    v7->_dataContent = 0;

    embeddedContent = v7->_embeddedContent;
    v7->_embeddedContent = 0;

    v7->_detached = 1;
    uint64_t v12 = [MEMORY[0x263EFF8C0] array];
    signers = v7->_signers;
    v7->_signers = (NSArray *)v12;

    uint64_t v14 = +[MSOID OIDWithString:@"1.2.840.113549.1.7.1" error:a4];
    contentType = v7->_contentType;
    v7->_contentType = (MSOID *)v14;

    if (!v7->_contentType)
    {
      id v18 = 0;
      goto LABEL_6;
    }
    uint64_t v16 = [MEMORY[0x263EFF9C0] setWithArray:v6];
    certificates = v7->_certificates;
    v7->_certificates = (NSMutableSet *)v16;
  }
  id v18 = v7;
LABEL_6:

  return v18;
}

- (void)addSigner:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x263EFF980];
    signers = self->_signers;
    id v8 = a3;
    id v6 = [v4 arrayWithArray:signers];
    [(NSArray *)v6 addObject:v8];
    [(MSCMSSignedData *)self addDigestAlgorithmFromSigner:v8];
    -[NSMutableSet addObject:](self->_certificates, "addObject:", [v8 signerCertificate]);
    uint64_t v7 = self->_signers;
    self->_signers = v6;

    [v8 setContainingSignedData:self];
    [(MSCMSSignedData *)self addCounterSignerCertificates:v8 mode:1 error:0];
  }
}

- (void)addSigner:(id)a3 withCertificates:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    [(MSCMSSignedData *)self addSigner:v7];
    if (v6) {
      [(NSMutableSet *)self->_certificates addObjectsFromArray:v6];
    }
    [(MSCMSSignedData *)self addCounterSignerCertificates:v7 mode:1 error:0];
  }
}

- (BOOL)addSigner:(id)a3 withChainMode:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = [MEMORY[0x263EFF980] arrayWithArray:self->_signers];
    [v9 addObject:v8];
    [(MSCMSSignedData *)self addDigestAlgorithmFromSigner:v8];
    BOOL v10 = [(MSCMSSignedData *)self addCertificatesForSigner:v8 mode:a4 error:a5];
    if (v10)
    {
      [(MSCMSSignedData *)self addCounterSignerCertificates:v8 mode:a4 error:0];
      objc_storeStrong((id *)&self->_signers, v9);
      [v8 setContainingSignedData:self];
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)removeSignerCertificatesWithIndexes:(id)a3
{
  signers = self->_signers;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__MSCMSSignedData_removeSignerCertificatesWithIndexes___block_invoke;
  v4[3] = &unk_26411C908;
  v4[4] = self;
  [(NSArray *)signers enumerateObjectsAtIndexes:a3 options:0 usingBlock:v4];
}

uint64_t __55__MSCMSSignedData_removeSignerCertificatesWithIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setContainingSignedData:0];
  v4 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v5 = [v3 signerCertificate];

  return [v4 removeObject:v5];
}

- (void)removeSignersWithIndexes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [MEMORY[0x263EFF980] arrayWithArray:self->_signers];
    [v7 removeObjectsAtIndexes:v6];
    [(MSCMSSignedData *)self removeSignerCertificatesWithIndexes:v6];
    objc_storeStrong((id *)&self->_signers, v7);
    uint64_t v12 = 0;
    CFStringRef v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__0;
    uint64_t v16 = __Block_byref_object_dispose__0;
    id v17 = [MEMORY[0x263EFF9C0] set];
    signers = self->_signers;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__MSCMSSignedData_removeSignersWithIndexes_error___block_invoke;
    v11[3] = &unk_26411C930;
    v11[4] = &v12;
    [(NSArray *)signers enumerateObjectsUsingBlock:v11];
    objc_storeStrong((id *)&self->_digestAlgorithms, (id)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (a4 && *a4) {
      id v9 = (void *)[*a4 copy];
    }
    else {
      id v9 = 0;
    }
    BOOL v10 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v9 description:@"no signer with input certificate hash"];

    if (a4 && v10) {
      *a4 = v10;
    }
  }
}

uint64_t __50__MSCMSSignedData_removeSignersWithIndexes_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 digestAlgorithm];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

- (void)removeSignersWithCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  CFStringRef v13 = __Block_byref_object_dispose__0;
  id v14 = [MEMORY[0x263F089C8] indexSet];
  signers = self->_signers;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__MSCMSSignedData_removeSignersWithCertificate_error___block_invoke;
  v8[3] = &unk_26411C958;
  v8[4] = &v9;
  v8[5] = a3;
  [(NSArray *)signers enumerateObjectsUsingBlock:v8];
  [(MSCMSSignedData *)self removeSignersWithIndexes:v10[5] error:a4];
  _Block_object_dispose(&v9, 8);
}

uint64_t __54__MSCMSSignedData_removeSignersWithCertificate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)[a2 signerCertificate]);
  if (result)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return [v6 addIndex:a3];
  }
  return result;
}

- (void)removeSignersWithEmailAddress:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = [MEMORY[0x263F089C8] indexSet];
  signers = self->_signers;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke;
  uint64_t v12 = &unk_26411C9A8;
  id v8 = v6;
  id v13 = v8;
  id v14 = &v15;
  [(NSArray *)signers enumerateObjectsUsingBlock:&v9];
  -[MSCMSSignedData removeSignersWithIndexes:error:](self, "removeSignersWithIndexes:error:", v16[5], a4, v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
}

void __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 signerCertificate];
  uint64_t v5 = (void *)SecCertificateCopyRFC822Names();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke_2;
  v8[3] = &unk_26411C980;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  uint64_t v10 = v7;
  uint64_t v11 = a3;
  [v5 enumerateObjectsUsingBlock:v8];
}

uint64_t __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) caseInsensitiveCompare:a2];
  if (!result)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

- (void)removeSignersWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  if (a4 && *a4) {
    uint64_t v7 = (void *)[*a4 copy];
  }
  else {
    uint64_t v7 = 0;
  }
  id v12 = v7;
  SecCertificateRef v8 = MSSecIdentityCopyCertificateWithError(a3, &v12);
  id v9 = v12;

  if (v8)
  {
    id v11 = v9;
    [(MSCMSSignedData *)self removeSignersWithCertificate:v8 error:&v11];
    id v10 = v11;

    id v9 = v10;
  }
  if (a4 && v9) {
    *a4 = v9;
  }
  if (v8) {
    CFRelease(v8);
  }
}

- (__SecCertificate)getSignerCertificate:(unint64_t)a3 error:(id *)a4
{
  if ([(NSArray *)self->_signers count] - 1 >= a3)
  {
    SecCertificateRef v8 = [(NSArray *)self->_signers objectAtIndex:a3];
    id v9 = (__SecCertificate *)[v8 signerCertificate];

    return v9;
  }
  else
  {
    if (a4)
    {
      *a4 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -50, *a4, @"signer index, %lu, out of range of signer count, %lu", a3, [(NSArray *)self->_signers count] code underlyingError description];
    }
    return 0;
  }
}

- (BOOL)verifySignatures:(id *)a3
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  if (a3)
  {
    id v5 = *a3;
    if (*a3) {
      id v5 = (id)[v5 copy];
    }
  }
  else
  {
    id v5 = 0;
  }
  id v18 = v5;
  signers = self->_signers;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__MSCMSSignedData_verifySignatures___block_invoke;
  v12[3] = &unk_26411C908;
  v12[4] = self;
  [(NSArray *)signers enumerateObjectsUsingBlock:v12];
  uint64_t v7 = self->_signers;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __36__MSCMSSignedData_verifySignatures___block_invoke_3;
  v11[3] = &unk_26411C9F8;
  v11[4] = &v13;
  void v11[5] = &v19;
  v11[6] = a3;
  [(NSArray *)v7 enumerateObjectsUsingBlock:v11];
  if (a3)
  {
    SecCertificateRef v8 = (void *)v14[5];
    if (v8) {
      *a3 = v8;
    }
  }
  BOOL v9 = *((unsigned char *)v20 + 24) == 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __36__MSCMSSignedData_verifySignatures___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 protectedAttributes];
  id v5 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.2.51" error:0];
  id v6 = [v4 getAttributesWithType:v5];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v15 = [v6 count];
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__MSCMSSignedData_verifySignatures___block_invoke_2;
  v10[3] = &unk_26411C9D0;
  id v8 = v3;
  id v11 = v8;
  uint64_t v13 = v14;
  id v9 = v6;
  id v12 = v9;
  [v7 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(v14, 8);
}

void __36__MSCMSSignedData_verifySignatures___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if ((id)a1[4] != v3)
  {
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void *)(v4 + 24);
    if (v5)
    {
      id v9 = v3;
      id v6 = (void *)a1[5];
      *(void *)(v4 + 24) = v5 - 1;
      uint64_t v7 = objc_msgSend(v6, "objectAtIndex:");
      id v8 = [v9 calculateSignedAttributesDigest:0];
      [v7 setSignedAttrsHash:v8];

      id v3 = v9;
    }
  }
}

void __36__MSCMSSignedData_verifySignatures___block_invoke_3(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  if (([v16 verifySignature:a1[6]] & 1) == 0)
  {
    uint64_t v7 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -67808, *(void *)(*(void *)(a1[4] + 8) + 40), @"signature verification failed for signer %lu", a3 code underlyingError description];
    uint64_t v8 = *(void *)(a1[4] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if (([v16 verifyCountersignatures:a1[6]] & 1) == 0)
    {
      uint64_t v10 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -67808, *(void *)(*(void *)(a1[4] + 8) + 40), @"countersignature verification failed for signer %lu", a3 code underlyingError description];
      uint64_t v11 = *(void *)(a1[4] + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *a4 = 1;
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24) && ([v16 verifyTimestamps:a1[6]] & 1) == 0)
    {
      uint64_t v13 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -67808, *(void *)(*(void *)(a1[4] + 8) + 40), @"timestamp verification failed for signer %lu", a3 code underlyingError description];
      uint64_t v14 = *(void *)(a1[4] + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a4 = 1;
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
  }
}

void __41__MSCMSSignedData_checkSignedPerRFC5652___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a2 protectedAttributes];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_52);
    }
    id v6 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = a3;
      _os_log_impl(&dword_20D8A1000, v6, OS_LOG_TYPE_DEFAULT, "signedData contains embedded content but signer %lu does not have signed attributes.", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __41__MSCMSSignedData_checkSignedPerRFC5652___block_invoke_2()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  v93[1] = *MEMORY[0x263EF8340];
  uint64_t v86 = 0;
  v87 = (id *)&v86;
  uint64_t v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__0;
  v90 = __Block_byref_object_dispose__0;
  id v65 = a3;
  if (a3)
  {
    id v4 = *a3;
    if (*a3) {
      id v4 = (id)[v4 copy];
    }
  }
  else
  {
    id v4 = 0;
  }
  id v91 = v4;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v81 = 0u;
  NSUInteger v79 = 0;
  uint64_t v80 = 0;
  uint64_t v77 = 0;
  v78 = 0;
  uint64_t v73 = 0;
  long long v74 = &v73;
  uint64_t v75 = 0x2020000000;
  char v76 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v72[3] = 0;
  digestAlgorithms = self->_digestAlgorithms;
  if (!digestAlgorithms)
  {
    uint64_t v49 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v87[5] description:@"Unable to encode signedData: missing digest algorithms"];
    id v50 = v87[5];
    v87[5] = (id)v49;

    goto LABEL_72;
  }
  if ([(NSSet *)digestAlgorithms count])
  {
    unsigned int v6 = [(NSSet *)self->_digestAlgorithms count];
    int v7 = malloc_type_malloc(24 * [(NSSet *)self->_digestAlgorithms count], 0x10300406712BA52uLL);
    if (v7)
    {
      uint64_t v8 = self->_digestAlgorithms;
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke;
      v71[3] = &unk_26411CA68;
      v71[4] = v72;
      v71[5] = v7;
      [(NSSet *)v8 enumerateObjectsUsingBlock:v71];
      goto LABEL_13;
    }
    uint64_t v53 = +[MSError MSErrorWithDomain:MSErrorAllocationDomain[0] code:-67672 underlyingError:v87[5] description:@"Unable to encode signedData: unable to allocate digest algorithm array"];
    id v54 = v87[5];
    v87[5] = (id)v53;

LABEL_72:
    id v32 = 0;
    int v7 = 0;
LABEL_80:
    char v22 = 0;
    goto LABEL_81;
  }
  if ([(NSArray *)self->_signers count] || self->_dataContent || self->_embeddedContent)
  {
    uint64_t v45 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0], -50, v87[5], @"Unable to encode signedData: missing digest algorithm and not certs-only message", v65 code underlyingError description];
    id v46 = v87[5];
    v87[5] = (id)v45;

    goto LABEL_72;
  }
  unsigned int v6 = 0;
  int v7 = 0;
LABEL_13:
  contentType = self->_contentType;
  if (!contentType)
  {
    uint64_t v51 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v87[5] description:@"Unable to encode signedData: missing content type"];
    id v52 = v87[5];
    v87[5] = (id)v51;

    goto LABEL_79;
  }
  if (!self->_detached && !self->_dataContent && !self->_embeddedContent)
  {
    uint64_t v61 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v87[5] description:@"Unable to encode signedData: content is not detached and no content specified"];
    id v62 = v87[5];
    v87[5] = (id)v61;

    goto LABEL_79;
  }
  uint64_t v10 = [(MSOID *)contentType Asn1OID];
  uint64_t v12 = v11;
  if (!self->_detached)
  {
    if ([(MSOID *)self->_contentType isEqualToString:@"1.2.840.113549.1.7.1"])
    {
      dataContent = self->_dataContent;
      if (!dataContent)
      {
        uint64_t v15 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v87[5] description:@"Unable to encode signedData: id-data content type and no data content"];
        id v16 = v87[5];
        v87[5] = (id)v15;

LABEL_79:
        id v32 = 0;
        goto LABEL_80;
      }
    }
    else if (self->_contentType)
    {
      embeddedContent = self->_embeddedContent;
      if (!embeddedContent)
      {
        uint64_t v63 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v87[5] description:@"Unable to encode signedData: embedded content type specified and no embedded content"];
        id v64 = v87[5];
        v87[5] = (id)v63;

        goto LABEL_79;
      }
      id v18 = v87;
      id obj = v87[5];
      uint64_t v19 = [(MSCMSMessage *)embeddedContent encodeMessageSecurityObject:&obj];
      objc_storeStrong(v18 + 5, obj);
      id v20 = self->_dataContent;
      self->_dataContent = v19;

      self->_contentChanged = 1;
      dataContent = self->_dataContent;
      if (!dataContent) {
        goto LABEL_79;
      }
    }
    else
    {
      dataContent = self->_dataContent;
    }
    uint64_t v80 = [(NSData *)dataContent bytes];
    NSUInteger v79 = [(NSData *)self->_dataContent length];
    uint64_t v13 = &v79;
    goto LABEL_28;
  }
  uint64_t v13 = 0;
LABEL_28:
  certificates = self->_certificates;
  if (certificates)
  {
    certificates = (NSMutableSet *)[(NSMutableSet *)certificates count];
    if (certificates)
    {
      char v22 = malloc_type_malloc(24 * [(NSMutableSet *)self->_certificates count], 0x10800404ACF7207uLL);
      if (v22)
      {
        id v23 = [(NSMutableSet *)self->_certificates allObjects];
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_2;
        v69[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
        v69[4] = v22;
        [v23 enumerateObjectsUsingBlock:v69];

        LODWORD(certificates) = [(NSMutableSet *)self->_certificates count];
        goto LABEL_33;
      }
      uint64_t v59 = +[MSError MSErrorWithDomain:MSErrorAllocationDomain[0] code:-67672 underlyingError:v87[5] description:@"Unable to encode signedData: unable to allocate certificates array"];
      id v60 = v87[5];
      v87[5] = (id)v59;

      goto LABEL_79;
    }
  }
  char v22 = 0;
LABEL_33:
  LODWORD(v77) = certificates;
  v78 = v22;
  if (![(NSArray *)self->_signers count])
  {
    if (![(NSSet *)self->_digestAlgorithms count] && !self->_embeddedContent && !self->_dataContent)
    {
      unsigned int v27 = 0;
      uint64_t v24 = 0;
      goto LABEL_41;
    }
    uint64_t v47 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v87[5] description:@"Unable to encode signedData: no signers and not certs-only message"];
    id v48 = v87[5];
    v87[5] = (id)v47;

    goto LABEL_74;
  }
  uint64_t v24 = (char *)malloc_type_malloc(104 * [(NSArray *)self->_signers count], 0x10B00404EF9CE24uLL);
  if (!v24)
  {
    uint64_t v55 = +[MSError MSErrorWithDomain:MSErrorAllocationDomain[0] code:-67672 underlyingError:v87[5] description:@"Unable to encode signedData: unable to allocate signerInfos array"];
    id v56 = v87[5];
    v87[5] = (id)v55;

LABEL_74:
    id v32 = 0;
LABEL_81:
    uint64_t v24 = 0;
    goto LABEL_52;
  }
  signers = self->_signers;
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_3;
  v68[3] = &unk_26411C908;
  v68[4] = self;
  [(NSArray *)signers enumerateObjectsUsingBlock:v68];
  uint64_t v26 = self->_signers;
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_5;
  v67[3] = &unk_26411C9F8;
  v67[4] = &v86;
  v67[5] = &v73;
  v67[6] = v24;
  [(NSArray *)v26 enumerateObjectsUsingBlock:v67];
  if (!*((unsigned char *)v74 + 24))
  {
    unsigned int v27 = [(NSArray *)self->_signers count];
LABEL_41:
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v81 = 0u;
    if ([(NSArray *)self->_signers indexOfObjectPassingTest:&__block_literal_global_93] == 0x7FFFFFFFFFFFFFFFLL
      && [(MSOID *)self->_contentType isEqualToString:@"1.2.840.113549.1.7.1"])
    {
      LODWORD(v81) = 1;
      uint64_t v28 = [NSNumber numberWithInteger:1];
    }
    else
    {
      LODWORD(v81) = 3;
      uint64_t v28 = [NSNumber numberWithInteger:3];
    }
    version = self->_version;
    self->_version = v28;

    *((void *)&v81 + 1) = v6;
    *(void *)&long long v82 = v7;
    *((void *)&v82 + 1) = v10;
    *(void *)&long long v83 = v12;
    *((void *)&v83 + 1) = v13;
    *(void *)&long long v84 = &v77;
    *(void *)&long long v85 = v27;
    *((void *)&v85 + 1) = v24;
    uint64_t v66 = 0;
    uint64_t v30 = length_CMSSignedData((uint64_t)&v81);
    long long v31 = [MEMORY[0x263EFF990] dataWithLength:v30];
    if (v31)
    {
      id v32 = v31;
      int v33 = encode_CMSSignedData([v32 mutableBytes] + v30 - 1, v30, (uint64_t)&v81, (uint64_t)&v66);
      if (!v33)
      {
        if (v30 != v66)
        {
          id result = (id)asn1_abort();
          __break(1u);
          return result;
        }
        goto LABEL_51;
      }

      uint64_t v34 = v33;
    }
    else
    {
      uint64_t v34 = 12;
    }
    long long v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v92 = *MEMORY[0x263F08320];
    v93[0] = @"Failed encoding type CMSSignedData";
    long long v36 = [NSDictionary dictionaryWithObjects:v93 forKeys:&v92 count:1];
    uint64_t v37 = [v35 errorWithDomain:@"com.apple.HeimASN1" code:v34 userInfo:v36];
    id v38 = v87[5];
    v87[5] = (id)v37;

    id v32 = 0;
LABEL_51:
    self->_contentChanged = 0;
    goto LABEL_52;
  }
  uint64_t v57 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v87[5] description:@"Unable to encode signedData: failed to encode a SignerInfo"];
  id v58 = v87[5];
  v87[5] = (id)v57;

  id v32 = 0;
LABEL_52:
  if (v65)
  {
    id v39 = v87[5];
    if (v39) {
      *id v65 = v39;
    }
  }
  if (v7) {
    free(v7);
  }
  if (v22) {
    free(v22);
  }
  if (v24)
  {
    unint64_t v40 = 0;
    for (uint64_t i = v24; ; i += 104)
    {
      v42 = [(MSCMSSignedData *)self signers];
      BOOL v43 = v40 < [v42 count];

      if (!v43) {
        break;
      }
      free_SignerInfo();
      ++v40;
    }
    free(v24);
  }
  _Block_object_dispose(v72, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v86, 8);

  return v32;
}

__n128 __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (__n128 *)(*(void *)(a1 + 40) + 24 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  id v4 = (__n128 *)[a2 asn1AlgId];
  __n128 result = *v4;
  v3[1].n128_u64[0] = v4[1].n128_u64[0];
  *id v3 = result;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = 3 * a3;
  *(_DWORD *)(*(void *)(a1 + 32) + 24 * a3) = 1;
  id v5 = a2;
  *(void *)(*(void *)(a1 + 32) + 8 * v4 + 16) = SecCertificateGetBytePtr();
  uint64_t Length = SecCertificateGetLength();

  *(void *)(*(void *)(a1 + 32) + 8 * v4 + 8) = Length;
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 protectedAttributes];
  id v5 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.2.51" error:0];
  unsigned int v6 = [v4 getAttributesWithType:v5];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v15 = [v6 count];
  int v7 = *(void **)(*(void *)(a1 + 32) + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_4;
  v10[3] = &unk_26411C9D0;
  id v8 = v3;
  id v11 = v8;
  uint64_t v13 = v14;
  id v9 = v6;
  id v12 = v9;
  [v7 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(v14, 8);
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  if ((id)a1[4] != v3)
  {
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void *)(v4 + 24);
    if (v5)
    {
      id v9 = v3;
      unsigned int v6 = (void *)a1[5];
      *(void *)(v4 + 24) = v5 - 1;
      int v7 = objc_msgSend(v6, "objectAtIndex:");
      id v8 = [v9 calculateSignedAttributesDigest:0];
      [v7 setSignedAttrsHash:v8];

      id v3 = v9;
    }
  }
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_5(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = a1[6] + 104 * a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [a2 encodeSignerInfo:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
}

BOOL __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 version];
  BOOL v3 = [v2 integerValue] > 1;

  return v3;
}

uint64_t __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_114()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_117()
{
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.MessageSecurity", "default");

  return MEMORY[0x270F9A758]();
}

void __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_133(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [a2 verifyTimestamps:1 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if ((v6 & 1) == 0) {
    *a4 = 1;
  }
}

- (MSOID)type
{
  return +[MSOID OIDWithString:@"1.2.840.113549.1.7.2" error:0];
}

+ (BOOL)isImplementedInObjectiveC
{
  return 1;
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (MSDecodeOptions)options
{
  return (MSDecodeOptions *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)contentChanged
{
  return self->_contentChanged;
}

@end