@interface SEEndPoint
+ (BOOL)supportsSecureCoding;
+ (id)decodeWithData:(id)a3 error:(id *)a4;
+ (id)endPointWithType:(int64_t)a3 appletIdentifier:(id)a4 identifier:(id)a5 certificateData:(id)a6 error:(id *)a7;
+ (id)parsePTAExtension:(__CFString *)a3 certificate:(__SecCertificate *)a4 specification:(id *)a5 output:(PTAEndPointExtensionContent *)a6;
+ (id)revokedEndpointWithPublicKeyIdentifier:(id)a3 appletIdentifier:(id)a4 revocationAttestation:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)authorizedKeys;
- (NSArray)certificates;
- (NSArray)sharingRecords;
- (NSArray)supportedRKEFunctions;
- (NSData)anonymizedDsid;
- (NSData)appletIdentifier;
- (NSData)bleAddress;
- (NSData)bleDCKIdentifier;
- (NSData)bleIntroKey;
- (NSData)bleOOBKey;
- (NSData)bleOOBMasterKey;
- (NSData)deviceConfiguration;
- (NSData)hupData;
- (NSData)keyIdentifier;
- (NSData)longTermSharedSecret;
- (NSData)mailboxMapping;
- (NSData)mailboxSizesPlusAdditionalData;
- (NSData)ownerEphemeralKey;
- (NSData)privacyPublicKey;
- (NSData)privacyPublicKeyIdentifier;
- (NSData)publicKey;
- (NSData)publicKeyIdentifier;
- (NSData)readerConfigID;
- (NSData)readerIdentifier;
- (NSData)readerLongTermPublicKeyCertificate;
- (NSData)readerPublicKey;
- (NSData)revocationAttestation;
- (NSData)sharingAttestationData;
- (NSData)sharingEncryptedData;
- (NSData)slotIdentifier;
- (NSData)trackingReceipt;
- (NSData)trackingRequest;
- (NSData)upgradeEndpointJSONData;
- (NSData)vehicleSupportedVersionsData;
- (NSDictionary)additionalAttestationsDict;
- (NSNumber)blePairingRequest;
- (NSNumber)confidentialMailBoxSize;
- (NSNumber)counter;
- (NSNumber)hupDone;
- (NSNumber)privateMailBoxSize;
- (NSNumber)sharingTokenAvailabilityBitmap;
- (NSString)bleUUID;
- (NSString)environment;
- (NSString)friendlyName;
- (NSString)homeUUIDString;
- (NSString)identifier;
- (NSString)invitationIdentifier;
- (NSString)issuerIdentifier;
- (NSString)ownerIDSIdentifier;
- (NSString)privacyKeyIdentifier;
- (NSString)readerInfo;
- (NSString)sharingSessionUUID;
- (NSString)subjectIdentifier;
- (NSString)terminatedByTaskID;
- (SEEndPoint)initWithCoder:(id)a3;
- (SEEndPointConfiguration)configuration;
- (SEEndPointPrivacyEncryptResponse)carOEMProprietaryData;
- (id)configurePrivateData:(id)a3 confidentialData:(id)a4 contactlessPersistentVisibility:(id)a5 wiredPersistentVisibility:(id)a6 nfcExpressOnlyInLPM:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deleteEndPointLongTermPrivacyKey;
- (id)description;
- (id)dumpState;
- (id)encodeWithError:(id *)a3;
- (id)generateEndPointPrivacyLongTermPrivacyKey;
- (id)validateAuthorizedEndpointConfig:(id)a3;
- (int64_t)endPointType;
- (unint64_t)getEndpointUser;
- (unint64_t)hash;
- (void)configurePrivateDataOffset:(unsigned __int16)a3 privateDataLength:(unsigned __int16)a4 confidentialDataOffset:(unsigned __int16)a5 confidentialDataLength:(unsigned __int16)a6 contactlessVisibility:(BOOL)a7 wiredVisibility:(BOOL)a8;
- (void)encodeWithCoder:(id)a3;
- (void)prependCertificateChain:(id)a3;
- (void)setAdditionalAttestationsDict:(id)a3;
- (void)setAnonymizedDsid:(id)a3;
- (void)setBleAddress:(id)a3;
- (void)setBleDCKIdentifier:(id)a3;
- (void)setBleIntroKey:(id)a3;
- (void)setBleOOBKey:(id)a3;
- (void)setBleOOBMasterKey:(id)a3;
- (void)setBlePairingRequest:(id)a3;
- (void)setBleUUID:(id)a3;
- (void)setCarOEMProprietaryData:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDeviceConfiguration:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setFriendlyName:(id)a3;
- (void)setHomeUUIDString:(id)a3;
- (void)setHupData:(id)a3;
- (void)setHupDone:(id)a3;
- (void)setInvitationIdentifier:(id)a3;
- (void)setLongTermSharedSecret:(id)a3;
- (void)setMailboxMapping:(id)a3;
- (void)setMailboxSizesPlusAdditionalData:(id)a3;
- (void)setOwnerEphemeralKey:(id)a3;
- (void)setOwnerIDSIdentifier:(id)a3;
- (void)setReaderConfigID:(id)a3;
- (void)setReaderInfo:(id)a3;
- (void)setReaderLongTermPublicKeyCertificate:(id)a3;
- (void)setRevocationAttestation:(id)a3;
- (void)setSharingAttestationData:(id)a3;
- (void)setSharingEncryptedData:(id)a3;
- (void)setSharingRecords:(id)a3;
- (void)setSharingSessionUUID:(id)a3;
- (void)setSharingTokenAvailabilityBitmap:(id)a3;
- (void)setSlotIdentifier:(id)a3;
- (void)setSupportedRKEFunctions:(id)a3;
- (void)setTerminatedByTaskID:(id)a3;
- (void)setTrackingReceipt:(id)a3;
- (void)setTrackingRequest:(id)a3;
- (void)setUpgradeEndpointJSONData:(id)a3;
- (void)setVehicleSupportedVersionsData:(id)a3;
@end

@implementation SEEndPoint

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = [(SEEndPoint *)self encodeWithError:0];
  v4 = +[SEEndPoint decodeWithData:v3 error:0];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(SEEndPoint *)self publicKeyIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SEEndPoint *)self publicKeyIdentifier];
    v6 = [v4 publicKeyIdentifier];
    char v7 = [v5 isEqualToData:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)endPointWithType:(int64_t)a3 appletIdentifier:(id)a4 identifier:(id)a5 certificateData:(id)a6 error:(id *)a7
{
  id v13 = a4;
  v14 = (__CFString *)a5;
  CFDataRef v15 = (const __CFData *)a6;
  if (v15)
  {
    v16 = SecCertificateCreateWithData(0, v15);
    v17 = v16;
    if (!v16)
    {
      if (a7)
      {
        v26 = SESDefaultLogObject();
        v65 = [(__CFData *)v15 base64];
        SESCreateAndLogError();
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v23 = 0;
      goto LABEL_61;
    }
    CFStringRef commonName = 0;
    SecCertificateCopyCommonName(v16, &commonName);
    v18 = (__CFString *)commonName;
    v19 = (void *)SecCertificateCopyIssuerSummary();
    if ((unint64_t)(a3 - 1) >= 5)
    {
      if (a7)
      {
        v27 = SESDefaultLogObject();
        SESCreateAndLogError();
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v23 = 0;
      goto LABEL_60;
    }
    v20 = off_2642196D0[a3 - 1];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v85 = 0u;
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__1;
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4) {
      v21 = &PTALyonEndPointExtensionSpec;
    }
    else {
      v21 = &PTAEndPointExtensionSpec;
    }
    v83 = __Block_byref_object_dispose__1;
    id v84 = [a1 parsePTAExtension:v20 certificate:v17 specification:v21 output:&v85];
    if (v80[5])
    {
      if (!a7)
      {
        id v23 = 0;
LABEL_59:
        _Block_object_dispose(&v79, 8);

LABEL_60:
LABEL_61:

        goto LABEL_62;
      }
      uint64_t v22 = SESDefaultLogObject();
      SESCreateAndLogError();
      id v23 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (void *)v22;
LABEL_58:

      goto LABEL_59;
    }
    SecKeyRef v28 = SecCertificateCopyKey(v17);
    v24 = v28;
    if (!v28)
    {
      if (a7)
      {
        v45 = SESDefaultLogObject();
        SESCreateAndLogError();
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v23 = 0;
      goto LABEL_58;
    }
    uint64_t v78 = 0;
    SecKeyRef v70 = v28;
    SecKeyCopyPublicBytes();
    uint64_t v29 = objc_opt_new();
    *(void *)(v29 + 8) = a3;
    objc_storeStrong((id *)(v29 + 16), a4);
    uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObject:v15];
    v31 = *(void **)(v29 + 136);
    *(void *)(v29 + 136) = v30;

    if (v14) {
      v32 = v14;
    }
    else {
      v32 = v18;
    }
    objc_storeStrong((id *)(v29 + 24), v32);
    objc_storeStrong((id *)(v29 + 32), v18);
    objc_storeStrong((id *)(v29 + 40), 0);
    uint64_t v33 = objc_msgSend(0, "ses_sha1");
    v34 = *(void **)(v29 + 48);
    *(void *)(v29 + 48) = v33;

    objc_storeStrong((id *)(v29 + 440), v19);
    uint64_t v35 = [MEMORY[0x263EFF8F8] dataWithDERItem:&v86];
    v36 = *(void **)(v29 + 80);
    *(void *)(v29 + 80) = v35;

    uint64_t v37 = getPublicKeyBytes();
    v38 = *(void **)(v29 + 88);
    *(void *)(v29 + 88) = v37;

    if (*(void *)(v29 + 88))
    {
      uint64_t v39 = +[SEEndPointConfiguration configurationWithOpt1:*(unsigned __int8 *)v87 opt2:*(unsigned __int8 *)v88];
      v40 = *(void **)(v29 + 72);
      *(void *)(v29 + 72) = v39;

      if (*(void *)(v29 + 72))
      {
        uint64_t v41 = [MEMORY[0x263EFF8F8] dataWithDERItem:&v91];
        v42 = *(void **)(v29 + 456);
        *(void *)(v29 + 456) = v41;

        unsigned int v77 = 0;
        if (*((void *)&v94 + 1))
        {
          if (*((void *)&v94 + 1) == 1 || *(unsigned char *)v94 != 2 || *(unsigned __int8 *)(v94 + 1) >= 5u)
          {
            if (a7)
            {
              uint64_t v69 = SESDefaultLogObject();
              v43 = [MEMORY[0x263EFF8F8] dataWithDERItem:&v94];
              v66 = [v43 asHexString];
              SESCreateAndLogError();
              *a7 = (id)objc_claimAutoreleasedReturnValue();

              id v44 = (id)v69;
LABEL_55:
            }
LABEL_56:
            id v23 = 0;
LABEL_57:

            v24 = v70;
            goto LABEL_58;
          }
          *(void *)&long long v94 = v94 + 2;
          *((void *)&v94 + 1) -= 2;
          if (DERParseInteger())
          {
            if (!a7) {
              goto LABEL_56;
            }
            uint64_t v68 = SESDefaultLogObject();
            v67 = [MEMORY[0x263EFF8F8] dataWithDERItem:&v94];
            SESCreateAndLogError();
            *a7 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_54;
          }
          uint64_t v48 = v77;
        }
        else
        {
          uint64_t v48 = 0;
        }
        uint64_t v49 = [NSNumber numberWithUnsignedInt:v48];
        v50 = *(void **)(v29 + 120);
        *(void *)(v29 + 120) = v49;

        if (*((void *)&v93 + 1))
        {
          if (*((void *)&v93 + 1) == 1 || *(unsigned char *)v93 != 2 || *(unsigned __int8 *)(v93 + 1) >= 5u)
          {
            if (!a7) {
              goto LABEL_56;
            }
            goto LABEL_53;
          }
          *(void *)&long long v93 = v93 + 2;
          *((void *)&v93 + 1) -= 2;
          if (DERParseInteger())
          {
            if (!a7) {
              goto LABEL_56;
            }
LABEL_82:
            v61 = SESDefaultLogObject();
            v62 = [MEMORY[0x263EFF8F8] dataWithDERItem:&v94];
            SESCreateAndLogError();
            *a7 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_56;
          }
          uint64_t v51 = v77;
        }
        else
        {
          uint64_t v51 = 0;
          unsigned int v77 = 0;
        }
        uint64_t v52 = [NSNumber numberWithUnsignedInt:v51];
        v53 = *(void **)(v29 + 112);
        *(void *)(v29 + 112) = v52;

        if (*((void *)&v95 + 1))
        {
          if (*((void *)&v95 + 1) == 1 || *(unsigned char *)v95 != 2 || *(unsigned __int8 *)(v95 + 1) >= 5u)
          {
            if (!a7) {
              goto LABEL_56;
            }
LABEL_53:
            uint64_t v68 = SESDefaultLogObject();
            v54 = [MEMORY[0x263EFF8F8] dataWithDERItem:&v94];
            v55 = [v54 asHexString];
            SESCreateAndLogError();
            *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_54:
            id v44 = (id)v68;
            goto LABEL_55;
          }
          *(void *)&long long v95 = v95 + 2;
          *((void *)&v95 + 1) -= 2;
          if (DERParseInteger())
          {
            if (!a7) {
              goto LABEL_56;
            }
            goto LABEL_82;
          }
          uint64_t v57 = v77;
        }
        else
        {
          uint64_t v57 = 0;
          unsigned int v77 = 0;
        }
        uint64_t v58 = [NSNumber numberWithUnsignedInt:v57];
        v59 = *(void **)(v29 + 128);
        *(void *)(v29 + 128) = v58;

        if (*((void *)&v92 + 1))
        {
          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x3032000000;
          v74 = __Block_byref_object_copy__1;
          v75 = __Block_byref_object_dispose__1;
          id v76 = [MEMORY[0x263EFF980] array];
          if (DERDecodeSequenceWithBlock() || v80[5])
          {
            if (a7)
            {
              v60 = SESDefaultLogObject();
              SESCreateAndLogError();
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }
            _Block_object_dispose(&v71, 8);
            id v44 = v76;
            goto LABEL_55;
          }
          objc_storeStrong((id *)(v29 + 104), (id)v72[5]);
          _Block_object_dispose(&v71, 8);
        }
        uint64_t v63 = [(id)v29 generateEndPointPrivacyLongTermPrivacyKey];
        v64 = (void *)v80[5];
        v80[5] = v63;

        if (!v80[5])
        {
          id v23 = (id)v29;
          goto LABEL_57;
        }
        if (!a7) {
          goto LABEL_56;
        }
        v46 = SESDefaultLogObject();
        [(id)v80[5] code];
        v47 = SESCreateAndLogError();
LABEL_39:
        *a7 = v47;

        goto LABEL_56;
      }
      if (!a7) {
        goto LABEL_56;
      }
    }
    else if (!a7)
    {
      goto LABEL_56;
    }
    v46 = SESDefaultLogObject();
    v47 = SESCreateAndLogError();
    goto LABEL_39;
  }
  if (a7)
  {
    v25 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v23 = 0;
LABEL_62:

  return v23;
}

uint64_t __81__SEEndPoint_endPointWithType_appletIdentifier_identifier_certificateData_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = a2 + 8;
  v6 = getPublicKeyBytes();
  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
    uint64_t v7 = 0;
  }
  else
  {
    v8 = SESDefaultLogObject();
    id v13 = [MEMORY[0x263EFF8F8] dataWithDERItem:v5];
    uint64_t v9 = SESCreateAndLogError();
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a3 = 1;
    uint64_t v7 = 6;
  }

  return v7;
}

+ (id)parsePTAExtension:(__CFString *)a3 certificate:(__SecCertificate *)a4 specification:(id *)a5 output:(PTAEndPointExtensionContent *)a6
{
  if (a3 && a4 && a5 && a6)
  {
    v6 = (void *)SecCertificateCopyExtensionValue();
    if (v6 && !DERParseSequenceSpec())
    {
      uint64_t v7 = 0;
    }
    else
    {
      v8 = SESDefaultLogObject();
      uint64_t v7 = SESCreateAndLogError();
    }
  }
  else
  {
    v6 = SESDefaultLogObject();
    uint64_t v7 = SESCreateAndLogError();
  }

  return v7;
}

+ (id)revokedEndpointWithPublicKeyIdentifier:(id)a3 appletIdentifier:(id)a4 revocationAttestation:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v10 && v12)
  {
    uint64_t v14 = objc_opt_new();
    objc_storeStrong((id *)(v14 + 16), a4);
    objc_storeStrong((id *)(v14 + 48), a3);
    objc_storeStrong((id *)(v14 + 384), a5);
    CFDataRef v15 = [@"A000000809434343444B417631" hexStringAsData];
    char v16 = [v15 isEqualToData:v11];

    if (v16)
    {
      uint64_t v17 = 1;
    }
    else
    {
      v19 = [@"A00000085801010100000001" hexStringAsData];
      char v20 = [v19 isEqualToData:v11];

      if (v20)
      {
        uint64_t v17 = 3;
      }
      else
      {
        v21 = [@"A00000085802010100000001" hexStringAsData];
        char v22 = [v21 isEqualToData:v11];

        if (v22)
        {
          uint64_t v17 = 2;
        }
        else
        {
          id v23 = [@"A000000909ACCE5501" hexStringAsData];
          char v24 = [v23 isEqualToData:v11];

          if ((v24 & 1) == 0)
          {
            if (a6)
            {
              v26 = SESDefaultLogObject();
              SESCreateAndLogError();
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v18 = 0;
            goto LABEL_15;
          }
          uint64_t v17 = 5;
        }
      }
    }
    *(void *)(v14 + 8) = v17;
    id v18 = (id)v14;
  }
  else
  {
    if (!a6)
    {
      id v18 = 0;
      goto LABEL_16;
    }
    uint64_t v14 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

LABEL_16:
  return v18;
}

- (id)validateAuthorizedEndpointConfig:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = [(SEEndPoint *)self configuration];
  char v6 = [v5 authorizeEndPointWithAuthorizeAllowed];

  if (v6)
  {
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  SecCertificateRef v8 = SecCertificateCreateWithData(0, v4);
  if (v8 && (SecCertificateRef v9 = v8, v10 = (void *)SecCertificateCopyExtensionValue(), CFRelease(v9), v10))
  {
    [v10 DERItem];
    DERParseSequenceSpec();
    id v12 = SESDefaultLogObject();
    uint64_t v7 = SESCreateAndLogError();
  }
  else
  {
LABEL_8:
    id v10 = SESDefaultLogObject();
    uint64_t v7 = SESCreateAndLogError();
  }

LABEL_10:
  return v7;
}

- (void)prependCertificateChain:(id)a3
{
  id v4 = a3;
  id v7 = [(SEEndPoint *)self certificates];
  uint64_t v5 = [v4 arrayByAddingObjectsFromArray:v7];

  certificates = self->_certificates;
  self->_certificates = v5;
}

- (void)configurePrivateDataOffset:(unsigned __int16)a3 privateDataLength:(unsigned __int16)a4 confidentialDataOffset:(unsigned __int16)a5 confidentialDataLength:(unsigned __int16)a6 contactlessVisibility:(BOOL)a7 wiredVisibility:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v10 = a6;
  uint64_t v11 = a5;
  uint64_t v12 = a4;
  uint64_t v13 = a3;
  CFDataRef v15 = [(SEEndPoint *)self configuration];
  [v15 setOffsetPrivateMailBox:v13];

  char v16 = [(SEEndPoint *)self configuration];
  [v16 setLengthPrivateMailBox:v12];

  uint64_t v17 = [(SEEndPoint *)self configuration];
  [v17 setOffsetConfidentialMailBox:v11];

  id v18 = [(SEEndPoint *)self configuration];
  [v18 setLengthConfidentialMailBox:v10];

  v19 = [(SEEndPoint *)self configuration];
  [v19 setEnabledOnContactless:v9];

  id v20 = [(SEEndPoint *)self configuration];
  [v20 setEnabledOnWire:v8];
}

- (id)configurePrivateData:(id)a3 confidentialData:(id)a4 contactlessPersistentVisibility:(id)a5 wiredPersistentVisibility:(id)a6 nfcExpressOnlyInLPM:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    if ([v12 length] != 3) {
      goto LABEL_12;
    }
    id v43 = v14;
    uint64_t v17 = (unsigned __int16 *)[v12 bytes];
    unsigned int v18 = *v17;
    uint64_t v19 = __rev16(v18);
    unsigned int v20 = bswap32(v18);
    uint64_t v21 = *((unsigned __int8 *)v17 + 2);
    char v22 = [(SEEndPoint *)self privateMailBoxSize];
    unsigned int v23 = [v22 unsignedIntValue];

    if (v23 < v21 + HIWORD(v20))
    {
      char v24 = SESDefaultLogObject();
      v25 = [(SEEndPoint *)self privateMailBoxSize];
      [v25 unsignedIntValue];
      v26 = SESCreateAndLogError();

LABEL_11:
      id v14 = v43;
LABEL_20:

      goto LABEL_21;
    }
    v27 = [(SEEndPoint *)self configuration];
    [v27 setOffsetPrivateMailBox:v19];

    SecKeyRef v28 = [(SEEndPoint *)self configuration];
    [v28 setLengthPrivateMailBox:v21];

    id v14 = v43;
  }
  if (!v13) {
    goto LABEL_14;
  }
  if ([v13 length] != 3)
  {
LABEL_12:
    char v24 = SESDefaultLogObject();
    [v12 length];
    v26 = SESCreateAndLogError();
    goto LABEL_20;
  }
  id v43 = v14;
  uint64_t v29 = (unsigned __int16 *)[v13 bytes];
  unsigned int v30 = *v29;
  uint64_t v31 = __rev16(v30);
  unsigned int v32 = bswap32(v30);
  uint64_t v33 = *((unsigned __int8 *)v29 + 2);
  v34 = [(SEEndPoint *)self confidentialMailBoxSize];
  unint64_t v35 = [v34 unsignedIntegerValue];

  if (v35 < v33 + HIWORD(v32))
  {
    char v24 = SESDefaultLogObject();
    v36 = [(SEEndPoint *)self privateMailBoxSize];
    [v36 unsignedIntValue];
    v26 = SESCreateAndLogError();

    goto LABEL_11;
  }
  uint64_t v37 = [(SEEndPoint *)self configuration];
  [v37 setOffsetConfidentialMailBox:v31];

  v38 = [(SEEndPoint *)self configuration];
  [v38 setLengthConfidentialMailBox:v33];

  id v14 = v43;
LABEL_14:
  if (v14)
  {
    uint64_t v39 = [(SEEndPoint *)self configuration];
    objc_msgSend(v39, "setEnabledOnContactless:", objc_msgSend(v14, "BOOLValue"));
  }
  if (v15)
  {
    v40 = [(SEEndPoint *)self configuration];
    objc_msgSend(v40, "setEnabledOnWire:", objc_msgSend(v15, "BOOLValue"));
  }
  if (v16)
  {
    uint64_t v41 = [v16 BOOLValue];
    char v24 = [(SEEndPoint *)self configuration];
    [v24 setNfcExpressOnlyInLPM:v41];
    v26 = 0;
    goto LABEL_20;
  }
  v26 = 0;
LABEL_21:

  return v26;
}

- (id)generateEndPointPrivacyLongTermPrivacyKey
{
  uint64_t v2 = (uint64_t)self;
  v28[3] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SEEndPoint *)self privacyKeyIdentifier];
  uint64_t v4 = [v3 length];

  if (v4) {
    goto LABEL_2;
  }
  uint64_t v5 = NSString;
  char v6 = [(id)v2 identifier];
  id v7 = [v5 stringWithFormat:@"%@::LTPrivacyKey", v6];

  SecAccessControlRef v8 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFTypeRef)*MEMORY[0x263F16E98], 0, 0);
  SecAccessControlSetConstraints();
  uint64_t v9 = *MEMORY[0x263F16FB8];
  uint64_t v10 = *MEMORY[0x263F16F98];
  v27[0] = *MEMORY[0x263F16FA8];
  v27[1] = v10;
  v28[0] = v9;
  v28[1] = &unk_26C56DD28;
  v27[2] = *MEMORY[0x263F174B8];
  uint64_t v11 = *MEMORY[0x263F16F50];
  v25[0] = *MEMORY[0x263F17580];
  v25[1] = v11;
  v26[0] = MEMORY[0x263EFFA88];
  v26[1] = MEMORY[0x263EFFA88];
  uint64_t v12 = *MEMORY[0x263F16E70];
  v25[2] = *MEMORY[0x263F16EE8];
  v25[3] = v12;
  v26[2] = v7;
  v26[3] = v8;
  id v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  v28[2] = v13;
  CFDictionaryRef v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  CFErrorRef error = 0;
  SecKeyRef v15 = SecKeyCreateRandomKey(v14, &error);
  SecKeyRef v16 = v15;
  uint64_t v17 = error;
  if (error || !v15)
  {
    uint64_t v19 = SESDefaultLogObject();
    uint64_t v2 = SESCreateAndLogError();
    int v21 = 1;
  }
  else
  {
    objc_storeStrong((id *)(v2 + 448), v7);
    uint64_t v17 = getSecKeyPublicBytes();
    id v18 = 0;
    uint64_t v19 = v18;
    if (v17 || !v18)
    {
      char v22 = SESDefaultLogObject();
      uint64_t v2 = SESCreateAndLogError();
      int v21 = 1;
    }
    else
    {
      objc_storeStrong((id *)(v2 + 56), 0);
      uint64_t v20 = objc_msgSend(v19, "ses_sha1");
      int v21 = 0;
      char v22 = *(void **)(v2 + 64);
      *(void *)(v2 + 64) = v20;
    }
  }
  if (!v21) {
LABEL_2:
  }
    uint64_t v2 = 0;
  return (id)v2;
}

- (id)deleteEndPointLongTermPrivacyKey
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SEEndPoint *)self privacyKeyIdentifier];
  uint64_t v4 = (void *)[v3 length];

  if (v4)
  {
    uint64_t v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      char v6 = [(SEEndPoint *)self privacyKeyIdentifier];
      *(_DWORD *)buf = 138412290;
      SecKeyRef v16 = v6;
      _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "Deleting long term privacy key %@", buf, 0xCu);
    }
    uint64_t v7 = *MEMORY[0x263F171B8];
    v14[0] = *MEMORY[0x263F171E0];
    uint64_t v8 = *MEMORY[0x263F16EE8];
    v13[0] = v7;
    v13[1] = v8;
    uint64_t v9 = [(SEEndPoint *)self privacyKeyIdentifier];
    v13[2] = *MEMORY[0x263F17580];
    v14[1] = v9;
    v14[2] = MEMORY[0x263EFFA88];
    CFDictionaryRef v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

    if (SecItemDelete(v10))
    {
      privacyKeyIdentifier = SESDefaultLogObject();
      uint64_t v4 = SESCreateAndLogError();
    }
    else
    {
      uint64_t v4 = 0;
      privacyKeyIdentifier = self->_privacyKeyIdentifier;
      self->_privacyKeyIdentifier = 0;
    }
  }
  return v4;
}

- (unint64_t)getEndpointUser
{
  if ([(SEEndPoint *)self endPointType] != 1) {
    return 2;
  }
  unint64_t v3 = [(SEEndPoint *)self identifier];
  uint64_t v4 = [v3 componentsSeparatedByString:@"."];

  if ((unint64_t)[v4 count] >= 2)
  {
    char v6 = [v4 objectAtIndexedSubscript:1];
    char v7 = [v6 isEqualToString:@"OWNR"];

    if (v7)
    {
      unint64_t v5 = 0;
    }
    else
    {
      uint64_t v8 = [v4 objectAtIndexedSubscript:1];
      int v9 = [v8 isEqualToString:@"FRND"];

      if (v9) {
        unint64_t v5 = 1;
      }
      else {
        unint64_t v5 = 2;
      }
    }
  }
  else
  {
    unint64_t v5 = 2;
  }

  return v5;
}

- (id)description
{
  uint64_t v186 = *MEMORY[0x263EF8340];
  uint64_t v178 = 0;
  v179 = &v178;
  uint64_t v180 = 0x3032000000;
  v181 = __Block_byref_object_copy__1;
  v182 = __Block_byref_object_dispose__1;
  id v183 = [MEMORY[0x263F089D8] string];
  unint64_t v3 = (void *)v179[5];
  uint64_t v4 = [(SEEndPoint *)self identifier];
  [v3 appendFormat:@"Identifier : %@ : {\n", v4];

  unint64_t v5 = (void *)v179[5];
  char v6 = [(SEEndPoint *)self appletIdentifier];
  char v7 = [v6 asHexString];
  [v5 appendFormat:@"\tAppletIdentifier : %@\n", v7];

  [(id)v179[5] appendFormat:@"\tsharingRecords : {\n"];
  sharingRecords = self->_sharingRecords;
  v177[0] = MEMORY[0x263EF8330];
  v177[1] = 3221225472;
  v177[2] = __25__SEEndPoint_description__block_invoke;
  v177[3] = &unk_264219688;
  v177[4] = &v178;
  [(NSArray *)sharingRecords enumerateObjectsUsingBlock:v177];
  [(id)v179[5] appendFormat:@"\t}\n"];
  int v9 = (void *)v179[5];
  CFDictionaryRef v10 = [(SEEndPoint *)self revocationAttestation];
  uint64_t v11 = @"REVOKED";
  if (!v10) {
    uint64_t v11 = @"ACTIVE";
  }
  [v9 appendFormat:@"\tstate : %@\n", v11];

  uint64_t v12 = (void *)v179[5];
  id v13 = [(SEEndPoint *)self issuerIdentifier];
  [v12 appendFormat:@"\tissuerIdentifier : %@\n", v13];

  CFDictionaryRef v14 = (void *)v179[5];
  SecKeyRef v15 = [(SEEndPoint *)self subjectIdentifier];
  [v14 appendFormat:@"\tsubjectIdentifier : %@\n", v15];

  SecKeyRef v16 = (void *)v179[5];
  uint64_t v17 = [(SEEndPoint *)self publicKey];
  id v18 = [v17 asHexString];
  [v16 appendFormat:@"\tpublicKey : %@\n", v18];

  uint64_t v19 = (void *)v179[5];
  uint64_t v20 = [(SEEndPoint *)self publicKeyIdentifier];
  int v21 = [v20 asHexString];
  [v19 appendFormat:@"\tpublicKeyIdentifier : %@\n", v21];

  char v22 = (void *)v179[5];
  unsigned int v23 = [(SEEndPoint *)self privacyPublicKey];
  char v24 = [v23 asHexString];
  [v22 appendFormat:@"\tprivacyPublicKey : %@\n", v24];

  v25 = (void *)v179[5];
  v26 = [(SEEndPoint *)self privacyPublicKeyIdentifier];
  v27 = [v26 asHexString];
  [v25 appendFormat:@"\tprivacyPublicKeyIdentifier : %@\n", v27];

  SecKeyRef v28 = (void *)v179[5];
  uint64_t v29 = [(SEEndPoint *)self configuration];
  [v28 appendFormat:@"\tconfiguration : %@,\n", v29];

  unsigned int v30 = (void *)v179[5];
  uint64_t v31 = [(SEEndPoint *)self readerIdentifier];
  unsigned int v32 = [v31 asHexString];
  [v30 appendFormat:@"\treaderIdentifier : %@,\n", v32];

  uint64_t v33 = (void *)v179[5];
  v34 = [(SEEndPoint *)self readerPublicKey];
  unint64_t v35 = [v34 asHexString];
  [v33 appendFormat:@"\treaderPublicKey : %@,\n", v35];

  v36 = (void *)v179[5];
  uint64_t v37 = [(SEEndPoint *)self keyIdentifier];
  v38 = [v37 asHexString];
  [v36 appendFormat:@"\tkeyIdentifier : %@,\n", v38];

  uint64_t v39 = (void *)v179[5];
  v40 = [(SEEndPoint *)self confidentialMailBoxSize];
  [v39 appendFormat:@"\tconfidentialMailBoxSize : %@,\n", v40];

  uint64_t v41 = (void *)v179[5];
  v42 = [(SEEndPoint *)self privateMailBoxSize];
  [v41 appendFormat:@"\tprivateMailBoxSize : %@,\n", v42];

  id v43 = (void *)v179[5];
  id v44 = [(SEEndPoint *)self counter];
  [v43 appendFormat:@"\tcounter : %@,\n", v44];

  v45 = (void *)v179[5];
  v46 = [(SEEndPoint *)self authorizedKeys];
  objc_msgSend(v45, "appendFormat:", @"\tauthorizedKeys (%lu) : {\n", objc_msgSend(v46, "count"));

  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  v47 = [(SEEndPoint *)self authorizedKeys];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v173 objects:v185 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v174;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v174 != v49) {
          objc_enumerationMutation(v47);
        }
        uint64_t v51 = (void *)v179[5];
        uint64_t v52 = [*(id *)(*((void *)&v173 + 1) + 8 * i) asHexString];
        [v51 appendFormat:@"\t\t%@,\n", v52];
      }
      uint64_t v48 = [v47 countByEnumeratingWithState:&v173 objects:v185 count:16];
    }
    while (v48);
  }

  [(id)v179[5] appendFormat:@"\t}\n"];
  v53 = (void *)v179[5];
  v54 = [(SEEndPoint *)self friendlyName];
  [v53 appendFormat:@"\tfriendlyName : %@,\n", v54];

  v55 = (void *)v179[5];
  v56 = [(SEEndPoint *)self readerInfo];
  [v55 appendFormat:@"\treaderInfo : %@,\n", v56];

  uint64_t v57 = (void *)v179[5];
  uint64_t v58 = [(SEEndPoint *)self invitationIdentifier];
  [v57 appendFormat:@"\tinvitationIdentifier : %@,\n", v58];

  v59 = (void *)v179[5];
  v60 = [(SEEndPoint *)self sharingSessionUUID];
  [v59 appendFormat:@"\tsharingSessionUUID : %@,\n", v60];

  v61 = (void *)v179[5];
  v62 = [(SEEndPoint *)self ownerIDSIdentifier];
  [v61 appendFormat:@"\townerIDSIdentifier : %@,\n", v62];

  uint64_t v63 = (void *)v179[5];
  v64 = [(SEEndPoint *)self mailboxMapping];
  v65 = [v64 asHexString];
  [v63 appendFormat:@"\tmailboxMapping : %@,\n", v65];

  v66 = (void *)v179[5];
  v67 = [(SEEndPoint *)self trackingRequest];
  uint64_t v68 = [v67 asHexString];
  [v66 appendFormat:@"\ttrackingRequest : %@,\n", v68];

  uint64_t v69 = (void *)v179[5];
  SecKeyRef v70 = [(SEEndPoint *)self trackingReceipt];
  uint64_t v71 = [v70 asHexString];
  [v69 appendFormat:@"\ttrackingReceipt : %@,\n", v71];

  v72 = (void *)v179[5];
  uint64_t v73 = [(SEEndPoint *)self deviceConfiguration];
  v74 = [v73 asHexString];
  [v72 appendFormat:@"\tdeviceConfiguration : %@,\n", v74];

  v75 = (void *)v179[5];
  id v76 = [(SEEndPoint *)self sharingAttestationData];
  unsigned int v77 = [v76 asHexString];
  [v75 appendFormat:@"\tsharingAttestationData : %@\n", v77];

  uint64_t v78 = (void *)v179[5];
  uint64_t v79 = [(SEEndPoint *)self ownerEphemeralKey];
  v80 = [v79 asHexString];
  [v78 appendFormat:@"\townerEphemeralKey : %@\n", v80];

  uint64_t v81 = (void *)v179[5];
  v82 = [(SEEndPoint *)self additionalAttestationsDict];
  objc_msgSend(v81, "appendFormat:", @"\tadditionalAttestationsDict : %lu\n", objc_msgSend(v82, "count"));

  v83 = (void *)v179[5];
  id v84 = [(SEEndPoint *)self sharingEncryptedData];
  long long v85 = [v84 asHexString];
  [v83 appendFormat:@"\tsharingEncryptedData : %@\n", v85];

  long long v86 = (void *)v179[5];
  long long v87 = [(SEEndPoint *)self revocationAttestation];
  long long v88 = [v87 asHexString];
  [v86 appendFormat:@"\trevocationAttestation : %@\n", v88];

  long long v89 = (void *)v179[5];
  long long v90 = [(SEEndPoint *)self terminatedByTaskID];
  [v89 appendFormat:@"\tterminatedByTaskID : %@\n", v90];

  [(id)v179[5] appendFormat:@"\tcarOEMProprietaryData : {\n"];
  long long v91 = [(SEEndPoint *)self carOEMProprietaryData];

  if (v91)
  {
    long long v92 = (void *)v179[5];
    long long v93 = [(SEEndPoint *)self carOEMProprietaryData];
    long long v94 = [v93 version];
    [v92 appendFormat:@"\t\tversion : %@,\n", v94];

    long long v95 = (void *)v179[5];
    long long v96 = [(SEEndPoint *)self carOEMProprietaryData];
    long long v97 = [v96 cipherText];
    long long v98 = [v97 asHexString];
    [v95 appendFormat:@"\t\tcipherText : %@,\n", v98];

    long long v99 = (void *)v179[5];
    v100 = [(SEEndPoint *)self carOEMProprietaryData];
    v101 = [v100 ephemeralPublicKeydata];
    v102 = [v101 asHexString];
    [v99 appendFormat:@"\t\tephemeralPublicKeydata : %@,\n", v102];

    v103 = (void *)v179[5];
    v104 = [(SEEndPoint *)self carOEMProprietaryData];
    v105 = [v104 receiverPublicKeyHash];
    v106 = [v105 asHexString];
    [v103 appendFormat:@"\t\treceiverPublicKeyHash : %@,\n", v106];
  }
  [(id)v179[5] appendFormat:@"\t},\n"];
  v107 = (void *)v179[5];
  v108 = [(SEEndPoint *)self environment];
  [v107 appendFormat:@"\tenvironment : %@,\n", v108];

  v109 = (void *)v179[5];
  v110 = [(SEEndPoint *)self sharingTokenAvailabilityBitmap];
  [v109 appendFormat:@"\tsharingTokenAvailabilityBitmap : %@,\n", v110];

  v111 = (void *)v179[5];
  v112 = [(SEEndPoint *)self homeUUIDString];
  [v111 appendFormat:@"\thomeUUID : %@,\n", v112];

  v113 = (void *)v179[5];
  v114 = [(SEEndPoint *)self certificates];
  objc_msgSend(v113, "appendFormat:", @"\tcertificates (%lu) : {\n", objc_msgSend(v114, "count"));

  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  v115 = [(SEEndPoint *)self certificates];
  uint64_t v116 = [v115 countByEnumeratingWithState:&v169 objects:v184 count:16];
  if (v116)
  {
    uint64_t v117 = *(void *)v170;
    do
    {
      for (uint64_t j = 0; j != v116; ++j)
      {
        if (*(void *)v170 != v117) {
          objc_enumerationMutation(v115);
        }
        v119 = (void *)v179[5];
        v120 = [*(id *)(*((void *)&v169 + 1) + 8 * j) asHexString];
        [v119 appendFormat:@"\t\t%@,\n", v120];
      }
      uint64_t v116 = [v115 countByEnumeratingWithState:&v169 objects:v184 count:16];
    }
    while (v116);
  }

  [(id)v179[5] appendFormat:@"\t}\n}\n"];
  v121 = (void *)v179[5];
  v122 = [(SEEndPoint *)self readerLongTermPublicKeyCertificate];
  v123 = [v122 asHexString];
  [v121 appendFormat:@"\treaderLongTermPublicKeyCertificate : %@,\n", v123];

  v124 = (void *)v179[5];
  v125 = [(SEEndPoint *)self bleUUID];
  [v124 appendFormat:@"\tbleUUID : %@\n", v125];

  v126 = (void *)v179[5];
  v127 = [(SEEndPoint *)self bleIntroKey];
  v128 = [v127 asHexString];
  [v126 appendFormat:@"\tbleIntroKey : %@\n", v128];

  v129 = (void *)v179[5];
  v130 = [(SEEndPoint *)self bleOOBKey];
  v131 = [v130 asHexString];
  [v129 appendFormat:@"\tbleOOBKey : %@\n", v131];

  v132 = (void *)v179[5];
  v133 = [(SEEndPoint *)self bleOOBMasterKey];
  v134 = [v133 asHexString];
  [v132 appendFormat:@"\tbleOOBMasterKey : %@\n", v134];

  v135 = (void *)v179[5];
  v136 = [(SEEndPoint *)self bleDCKIdentifier];
  v137 = [v136 asHexString];
  [v135 appendFormat:@"\tbleDCKIdentifier : %@\n", v137];

  v138 = (void *)v179[5];
  v139 = [(SEEndPoint *)self bleAddress];
  v140 = [v139 asHexString];
  [v138 appendFormat:@"\tbleAddress : %@\n", v140];

  v141 = (void *)v179[5];
  v142 = [(SEEndPoint *)self blePairingRequest];
  [v141 appendFormat:@"\tblePairingRequest : %@\n", v142];

  v143 = (void *)v179[5];
  v144 = [(SEEndPoint *)self supportedRKEFunctions];
  [v143 appendFormat:@"\tsupportedRKEFunctions : %@\n", v144];

  v145 = (void *)v179[5];
  v146 = [(SEEndPoint *)self longTermSharedSecret];
  objc_msgSend(v145, "appendFormat:", @"\tlongTermSharedSecret length : %lu\n", objc_msgSend(v146, "length"));

  v147 = (void *)v179[5];
  v148 = [(SEEndPoint *)self readerConfigID];
  v149 = [v148 asHexString];
  [v147 appendFormat:@"\treaderConfigID : %@,\n", v149];

  v150 = (void *)v179[5];
  v151 = [(SEEndPoint *)self hupData];
  v152 = [v151 asHexString];
  [v150 appendFormat:@"\thupData : %@,\n", v152];

  v153 = (void *)v179[5];
  v154 = [(SEEndPoint *)self hupDone];
  objc_msgSend(v153, "appendFormat:", @"\thupDone : %d,\n", objc_msgSend(v154, "BOOLValue"));

  v155 = (void *)v179[5];
  v156 = [(SEEndPoint *)self vehicleSupportedVersionsData];
  v157 = [v156 asHexString];
  [v155 appendFormat:@"\tvehicleSupportedVersionsData : %@,\n", v157];

  v158 = (void *)v179[5];
  v159 = [(SEEndPoint *)self mailboxSizesPlusAdditionalData];
  v160 = [v159 asHexString];
  [v158 appendFormat:@"\tmailboxSizesPlusAdditionalData : %@,\n", v160];

  v161 = (void *)v179[5];
  v162 = [(SEEndPoint *)self slotIdentifier];
  objc_msgSend(v161, "appendFormat:", @"\tslotIdentifier length : %ld,\n", objc_msgSend(v162, "length"));

  v163 = (void *)v179[5];
  v164 = [(SEEndPoint *)self upgradeEndpointJSONData];
  objc_msgSend(v163, "appendFormat:", @"\tupgradeEndpointJSONData length : %ld,\n", objc_msgSend(v164, "length"));

  v165 = (void *)v179[5];
  v166 = [(SEEndPoint *)self anonymizedDsid];
  objc_msgSend(v165, "appendFormat:", @"\tanonymizedDsid length : %ld,\n", objc_msgSend(v166, "length"));

  id v167 = (id)v179[5];
  _Block_object_dispose(&v178, 8);

  return v167;
}

void __25__SEEndPoint_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = [a2 asHexString];
  [v4 appendFormat:@"\t%lu : %@,\n", a3, v5];
}

- (id)dumpState
{
  unint64_t v3 = objc_opt_new();
  uint64_t v4 = [(SEEndPoint *)self identifier];

  if (v4)
  {
    id v5 = [(SEEndPoint *)self identifier];
    [v3 setObject:v5 forKeyedSubscript:@"identifier"];
  }
  char v6 = [(SEEndPoint *)self appletIdentifier];

  if (v6)
  {
    char v7 = [(SEEndPoint *)self appletIdentifier];
    uint64_t v8 = [v7 asHexString];
    [v3 setObject:v8 forKeyedSubscript:@"appletIdentifier"];
  }
  int v9 = [(SEEndPoint *)self subjectIdentifier];

  if (v9)
  {
    CFDictionaryRef v10 = [(SEEndPoint *)self subjectIdentifier];
    [v3 setObject:v10 forKeyedSubscript:@"subjectIdentifier"];
  }
  uint64_t v11 = [(SEEndPoint *)self issuerIdentifier];

  if (v11)
  {
    uint64_t v12 = [(SEEndPoint *)self issuerIdentifier];
    [v3 setObject:v12 forKeyedSubscript:@"issuerIdentifier"];
  }
  id v13 = [(SEEndPoint *)self publicKey];

  if (v13)
  {
    CFDictionaryRef v14 = [(SEEndPoint *)self publicKey];
    SecKeyRef v15 = [v14 asHexString];
    [v3 setObject:v15 forKeyedSubscript:@"publicKey"];
  }
  SecKeyRef v16 = [(SEEndPoint *)self publicKeyIdentifier];

  if (v16)
  {
    uint64_t v17 = [(SEEndPoint *)self publicKeyIdentifier];
    id v18 = [v17 asHexString];
    [v3 setObject:v18 forKeyedSubscript:@"publicKeyIdentifier"];
  }
  uint64_t v19 = [(SEEndPoint *)self readerIdentifier];

  if (v19)
  {
    uint64_t v20 = [(SEEndPoint *)self readerIdentifier];
    int v21 = [v20 asHexString];
    [v3 setObject:v21 forKeyedSubscript:@"readerIdentifier"];
  }
  char v22 = [(SEEndPoint *)self readerPublicKey];

  if (v22)
  {
    unsigned int v23 = [(SEEndPoint *)self readerPublicKey];
    char v24 = [v23 asHexString];
    [v3 setObject:v24 forKeyedSubscript:@"readerPublicKey"];
  }
  v25 = [(SEEndPoint *)self readerInfo];

  if (v25)
  {
    v26 = [(SEEndPoint *)self readerInfo];
    [v3 setObject:v26 forKeyedSubscript:@"readerInfo"];
  }
  v27 = objc_opt_new();
  SecKeyRef v28 = [(SEEndPoint *)self authorizedKeys];
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __23__SEEndPoint_dumpState__block_invoke;
  v85[3] = &unk_2642196B0;
  id v29 = v27;
  id v86 = v29;
  [v28 enumerateObjectsUsingBlock:v85];

  [v3 setObject:v29 forKeyedSubscript:@"authorizedKeys"];
  unsigned int v30 = [(SEEndPoint *)self friendlyName];

  if (v30)
  {
    uint64_t v31 = [(SEEndPoint *)self friendlyName];
    [v3 setObject:v31 forKeyedSubscript:@"friendlyName"];
  }
  unsigned int v32 = [(SEEndPoint *)self invitationIdentifier];

  if (v32)
  {
    uint64_t v33 = [(SEEndPoint *)self invitationIdentifier];
    [v3 setObject:v33 forKeyedSubscript:@"invitationIdentifier"];
  }
  v34 = [(SEEndPoint *)self sharingSessionUUID];

  if (v34)
  {
    unint64_t v35 = [(SEEndPoint *)self sharingSessionUUID];
    [v3 setObject:v35 forKeyedSubscript:@"sharingSessionUUID"];
  }
  v36 = [(SEEndPoint *)self ownerIDSIdentifier];

  if (v36)
  {
    uint64_t v37 = [(SEEndPoint *)self ownerIDSIdentifier];
    [v3 setObject:v37 forKeyedSubscript:@"ownerIDSIdentifier"];
  }
  v38 = [(SEEndPoint *)self trackingRequest];

  if (v38)
  {
    uint64_t v39 = [(SEEndPoint *)self trackingRequest];
    v40 = [v39 asHexString];
    [v3 setObject:v40 forKeyedSubscript:@"trackingRequest"];
  }
  uint64_t v41 = [(SEEndPoint *)self trackingReceipt];

  if (v41)
  {
    v42 = [(SEEndPoint *)self trackingReceipt];
    id v43 = [v42 asHexString];
    [v3 setObject:v43 forKeyedSubscript:@"trackingReceipt"];
  }
  id v44 = [(SEEndPoint *)self privacyPublicKey];

  if (v44)
  {
    v45 = [(SEEndPoint *)self privacyPublicKey];
    v46 = [v45 asHexString];
    [v3 setObject:v46 forKeyedSubscript:@"privacyPublicKey"];
  }
  v47 = [(SEEndPoint *)self privacyKeyIdentifier];

  if (v47)
  {
    uint64_t v48 = [(SEEndPoint *)self privacyKeyIdentifier];
    [v3 setObject:v48 forKeyedSubscript:@"privacyKeyIdentifier"];
  }
  uint64_t v49 = [(SEEndPoint *)self sharingTokenAvailabilityBitmap];

  if (v49)
  {
    v50 = [(SEEndPoint *)self sharingTokenAvailabilityBitmap];
    [v3 setObject:v50 forKeyedSubscript:@"sharingTokenAvailabilityBitmap"];
  }
  uint64_t v51 = [(SEEndPoint *)self bleUUID];

  if (v51)
  {
    uint64_t v52 = [(SEEndPoint *)self bleUUID];
    [v3 setObject:v52 forKeyedSubscript:@"bleUUID"];
  }
  v53 = [(SEEndPoint *)self readerConfigID];

  if (v53)
  {
    v54 = [(SEEndPoint *)self readerConfigID];
    v55 = [v54 asHexString];
    [v3 setObject:v55 forKeyedSubscript:@"readerConfigID"];
  }
  v56 = [(SEEndPoint *)self hupData];

  if (v56)
  {
    uint64_t v57 = [(SEEndPoint *)self hupData];
    uint64_t v58 = [v57 asHexString];
    [v3 setObject:v58 forKeyedSubscript:@"hupData"];
  }
  v59 = [(SEEndPoint *)self hupDone];

  if (v59)
  {
    v60 = [(SEEndPoint *)self hupDone];
    [v3 setObject:v60 forKeyedSubscript:@"hupDone"];
  }
  v61 = [(SEEndPoint *)self vehicleSupportedVersionsData];

  if (v61)
  {
    v62 = [(SEEndPoint *)self vehicleSupportedVersionsData];
    uint64_t v63 = [v62 asHexString];
    [v3 setObject:v63 forKeyedSubscript:@"vehicleSupportedVersionsData"];
  }
  v64 = [(SEEndPoint *)self mailboxSizesPlusAdditionalData];

  if (v64)
  {
    v65 = [(SEEndPoint *)self mailboxSizesPlusAdditionalData];
    v66 = [v65 asHexString];
    [v3 setObject:v66 forKeyedSubscript:@"mailboxSizesPlusAdditionalData"];
  }
  v67 = [(SEEndPoint *)self sharingRecords];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __23__SEEndPoint_dumpState__block_invoke_2;
  v83[3] = &unk_2642196B0;
  id v68 = v3;
  id v84 = v68;
  [v67 enumerateObjectsUsingBlock:v83];

  uint64_t v69 = NSString;
  SecKeyRef v70 = [(SEEndPoint *)self configuration];
  unsigned int v71 = [v70 opt1];
  v72 = [(SEEndPoint *)self configuration];
  unsigned int v73 = [v72 opt2];
  v74 = [(SEEndPoint *)self configuration];
  v75 = objc_msgSend(v69, "stringWithFormat:", @"Opt1 0x%X Opt2 0x%X OptA 0x%X", v71, v73, objc_msgSend(v74, "optA"));
  [v68 setObject:v75 forKeyedSubscript:@"configuration"];

  id v76 = [(SEEndPoint *)self revocationAttestation];
  if (v76) {
    unsigned int v77 = @"REVOKED";
  }
  else {
    unsigned int v77 = @"ACTIVE";
  }
  [v68 setObject:v77 forKeyedSubscript:@"lifecycle"];

  uint64_t v78 = [(SEEndPoint *)self terminatedByTaskID];

  if (v78)
  {
    uint64_t v79 = [(SEEndPoint *)self terminatedByTaskID];
    [v68 setObject:v79 forKeyedSubscript:@"terminatedByTaskID"];
  }
  v80 = v84;
  id v81 = v68;

  return v81;
}

void __23__SEEndPoint_dumpState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 asHexString];
  [v2 addObject:v3];
}

void __23__SEEndPoint_dumpState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 asHexString];
  id v5 = *(void **)(a1 + 32);
  char v6 = objc_msgSend(NSString, "stringWithFormat:", @"sharingrecord-%u", a3);
  [v5 setObject:v7 forKeyedSubscript:v6];
}

- (id)encodeWithError:(id *)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x263F08928];
  id v6 = a3;
  id v7 = [v5 unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPoint endPointType](self, "endPointType"), @"endPointType");
  id v5 = [(SEEndPoint *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(SEEndPoint *)self sharingRecords];
  [v4 encodeObject:v6 forKey:@"sharingRecords"];

  id v7 = [(SEEndPoint *)self issuerIdentifier];
  [v4 encodeObject:v7 forKey:@"issuerIdentifier"];

  uint64_t v8 = [(SEEndPoint *)self subjectIdentifier];
  [v4 encodeObject:v8 forKey:@"subjectIdentifier"];

  int v9 = [(SEEndPoint *)self publicKey];
  [v4 encodeObject:v9 forKey:@"publicKey"];

  CFDictionaryRef v10 = [(SEEndPoint *)self publicKeyIdentifier];
  [v4 encodeObject:v10 forKey:@"publicKeyIdentifier"];

  uint64_t v11 = [(SEEndPoint *)self privacyPublicKey];
  [v4 encodeObject:v11 forKey:@"privacyPublicKey"];

  uint64_t v12 = [(SEEndPoint *)self privacyPublicKeyIdentifier];
  [v4 encodeObject:v12 forKey:@"privacyPublicKeyIdentifier"];

  id v13 = [(SEEndPoint *)self configuration];
  [v4 encodeObject:v13 forKey:@"configuration"];

  CFDictionaryRef v14 = [(SEEndPoint *)self readerIdentifier];
  [v4 encodeObject:v14 forKey:@"readerIdentifier"];

  SecKeyRef v15 = [(SEEndPoint *)self readerPublicKey];
  [v4 encodeObject:v15 forKey:@"readerPublicKey"];

  SecKeyRef v16 = [(SEEndPoint *)self keyIdentifier];
  [v4 encodeObject:v16 forKey:@"keyIdentifier"];

  uint64_t v17 = [(SEEndPoint *)self invitationIdentifier];
  [v4 encodeObject:v17 forKey:@"invitationIdentifier"];

  id v18 = [(SEEndPoint *)self certificates];
  [v4 encodeObject:v18 forKey:@"certificates"];

  uint64_t v19 = [(SEEndPoint *)self revocationAttestation];
  [v4 encodeObject:v19 forKey:@"revocationAttestation"];

  uint64_t v20 = [(SEEndPoint *)self authorizedKeys];
  [v4 encodeObject:v20 forKey:@"authorizedKeys"];

  int v21 = [(SEEndPoint *)self confidentialMailBoxSize];
  [v4 encodeObject:v21 forKey:@"confidentialMailBoxSize"];

  char v22 = [(SEEndPoint *)self privateMailBoxSize];
  [v4 encodeObject:v22 forKey:@"privateMailBoxSize"];

  unsigned int v23 = [(SEEndPoint *)self counter];
  [v4 encodeObject:v23 forKey:@"counter"];

  char v24 = [(SEEndPoint *)self privacyKeyIdentifier];
  [v4 encodeObject:v24 forKey:@"privacyKeyIdentifier"];

  v25 = [(SEEndPoint *)self friendlyName];
  [v4 encodeObject:v25 forKey:@"friendlyName"];

  v26 = [(SEEndPoint *)self readerInfo];
  [v4 encodeObject:v26 forKey:@"readerInfo"];

  v27 = [(SEEndPoint *)self mailboxMapping];
  [v4 encodeObject:v27 forKey:@"mailboxMapping"];

  SecKeyRef v28 = [(SEEndPoint *)self trackingRequest];
  [v4 encodeObject:v28 forKey:@"trackingRequest"];

  id v29 = [(SEEndPoint *)self trackingReceipt];
  [v4 encodeObject:v29 forKey:@"trackingReceipt"];

  unsigned int v30 = [(SEEndPoint *)self deviceConfiguration];
  [v4 encodeObject:v30 forKey:@"deviceConfiguration"];

  uint64_t v31 = [(SEEndPoint *)self sharingAttestationData];
  [v4 encodeObject:v31 forKey:@"sharingAttestationData"];

  unsigned int v32 = [(SEEndPoint *)self ownerEphemeralKey];
  [v4 encodeObject:v32 forKey:@"ownerEphemeralKey"];

  uint64_t v33 = [(SEEndPoint *)self sharingEncryptedData];
  [v4 encodeObject:v33 forKey:@"sharingEncryptedData"];

  v34 = [(SEEndPoint *)self additionalAttestationsDict];
  [v4 encodeObject:v34 forKey:@"additionalAttestationsDict"];

  unint64_t v35 = [(SEEndPoint *)self environment];
  [v4 encodeObject:v35 forKey:@"environment"];

  v36 = [(SEEndPoint *)self sharingTokenAvailabilityBitmap];
  [v4 encodeObject:v36 forKey:@"sharingTokenAvailabilityBitmap"];

  uint64_t v37 = [(SEEndPoint *)self bleUUID];
  [v4 encodeObject:v37 forKey:@"bleUUID"];

  v38 = [(SEEndPoint *)self readerLongTermPublicKeyCertificate];
  [v4 encodeObject:v38 forKey:@"readerLongTermPublicKeyCertificate"];

  uint64_t v39 = [(SEEndPoint *)self carOEMProprietaryData];
  [v4 encodeObject:v39 forKey:@"carOEMProprietaryData"];

  v40 = [(SEEndPoint *)self bleIntroKey];
  [v4 encodeObject:v40 forKey:@"bleIntroKey"];

  uint64_t v41 = [(SEEndPoint *)self bleOOBKey];
  [v4 encodeObject:v41 forKey:@"bleOOBKey"];

  v42 = [(SEEndPoint *)self bleOOBMasterKey];
  [v4 encodeObject:v42 forKey:@"bleOOBMasterKey"];

  id v43 = [(SEEndPoint *)self bleDCKIdentifier];
  [v4 encodeObject:v43 forKey:@"bleDCKIdentifier"];

  id v44 = [(SEEndPoint *)self bleAddress];
  [v4 encodeObject:v44 forKey:@"bleAddress"];

  v45 = [(SEEndPoint *)self blePairingRequest];
  [v4 encodeObject:v45 forKey:@"blePairingRequest"];

  v46 = [(SEEndPoint *)self supportedRKEFunctions];
  [v4 encodeObject:v46 forKey:@"supportedRKEFunctions"];

  v47 = [(SEEndPoint *)self appletIdentifier];
  [v4 encodeObject:v47 forKey:@"appletIdentifier"];

  uint64_t v48 = [(SEEndPoint *)self terminatedByTaskID];
  [v4 encodeObject:v48 forKey:@"terminatedByTaskID"];

  uint64_t v49 = [(SEEndPoint *)self longTermSharedSecret];
  [v4 encodeObject:v49 forKey:@"longTermSharedSecret"];

  v50 = [(SEEndPoint *)self ownerIDSIdentifier];
  [v4 encodeObject:v50 forKey:@"ownerIDSIdentifier"];

  uint64_t v51 = [(SEEndPoint *)self sharingSessionUUID];
  [v4 encodeObject:v51 forKey:@"sharingSessionUUID"];

  uint64_t v52 = [(SEEndPoint *)self readerConfigID];
  [v4 encodeObject:v52 forKey:@"readerConfigID"];

  v53 = [(SEEndPoint *)self hupData];
  [v4 encodeObject:v53 forKey:@"hupData"];

  v54 = [(SEEndPoint *)self hupDone];
  [v4 encodeObject:v54 forKey:@"hupDone"];

  v55 = [(SEEndPoint *)self vehicleSupportedVersionsData];
  [v4 encodeObject:v55 forKey:@"vehicleSupportedVersionsData"];

  v56 = [(SEEndPoint *)self mailboxSizesPlusAdditionalData];
  [v4 encodeObject:v56 forKey:@"mailboxSizesPlusAdditionalData"];

  uint64_t v57 = [(SEEndPoint *)self slotIdentifier];
  [v4 encodeObject:v57 forKey:@"slotIdentifier"];

  uint64_t v58 = [(SEEndPoint *)self homeUUIDString];
  [v4 encodeObject:v58 forKey:@"homeUUIDString"];

  v59 = [(SEEndPoint *)self upgradeEndpointJSONData];
  [v4 encodeObject:v59 forKey:@"upgradeEndpointJSONData"];

  id v60 = [(SEEndPoint *)self anonymizedDsid];
  [v4 encodeObject:v60 forKey:@"anonymizedDsid"];
}

- (SEEndPoint)initWithCoder:(id)a3
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  int v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v132.receiver = self;
  v132.super_class = (Class)SEEndPoint;
  id v13 = [(SEEndPoint *)&v132 init];
  if (v13)
  {
    v13->_endPointType = (int)[v4 decodeIntForKey:@"endPointType"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v8 forKey:@"sharingRecords"];
    sharingRecords = v13->_sharingRecords;
    v13->_sharingRecords = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerIdentifier"];
    issuerIdentifier = v13->_issuerIdentifier;
    v13->_issuerIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subjectIdentifier"];
    subjectIdentifier = v13->_subjectIdentifier;
    v13->_subjectIdentifier = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    publicKey = v13->_publicKey;
    v13->_publicKey = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyIdentifier"];
    publicKeyIdentifier = v13->_publicKeyIdentifier;
    v13->_publicKeyIdentifier = (NSData *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyPublicKey"];
    privacyPublicKey = v13->_privacyPublicKey;
    v13->_privacyPublicKey = (NSData *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyPublicKeyIdentifier"];
    privacyPublicKeyIdentifier = v13->_privacyPublicKeyIdentifier;
    v13->_privacyPublicKeyIdentifier = (NSData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    configuration = v13->_configuration;
    v13->_configuration = (SEEndPointConfiguration *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v13->_readerIdentifier;
    v13->_readerIdentifier = (NSData *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerPublicKey"];
    readerPublicKey = v13->_readerPublicKey;
    v13->_readerPublicKey = (NSData *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyIdentifier"];
    keyIdentifier = v13->_keyIdentifier;
    v13->_keyIdentifier = (NSData *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationIdentifier"];
    invitationIdentifier = v13->_invitationIdentifier;
    v13->_invitationIdentifier = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyKeyIdentifier"];
    privacyKeyIdentifier = v13->_privacyKeyIdentifier;
    v13->_privacyKeyIdentifier = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClasses:v8 forKey:@"certificates"];
    certificates = v13->_certificates;
    v13->_certificates = (NSArray *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"revocationAttestation"];
    revocationAttestation = v13->_revocationAttestation;
    v13->_revocationAttestation = (NSData *)v44;

    uint64_t v46 = [v4 decodeObjectOfClasses:v8 forKey:@"authorizedKeys"];
    authorizedKeys = v13->_authorizedKeys;
    v13->_authorizedKeys = (NSArray *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidentialMailBoxSize"];
    confidentialMailBoxSize = v13->_confidentialMailBoxSize;
    v13->_confidentialMailBoxSize = (NSNumber *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateMailBoxSize"];
    privateMailBoxSize = v13->_privateMailBoxSize;
    v13->_privateMailBoxSize = (NSNumber *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"counter"];
    counter = v13->_counter;
    v13->_counter = (NSNumber *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"friendlyName"];
    friendlyName = v13->_friendlyName;
    v13->_friendlyName = (NSString *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerInfo"];
    readerInfo = v13->_readerInfo;
    v13->_readerInfo = (NSString *)v56;

    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mailboxMapping"];
    mailboxMapping = v13->_mailboxMapping;
    v13->_mailboxMapping = (NSData *)v58;

    uint64_t v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingRequest"];
    trackingRequest = v13->_trackingRequest;
    v13->_trackingRequest = (NSData *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingReceipt"];
    trackingReceipt = v13->_trackingReceipt;
    v13->_trackingReceipt = (NSData *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceConfiguration"];
    deviceConfiguration = v13->_deviceConfiguration;
    v13->_deviceConfiguration = (NSData *)v64;

    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingAttestationData"];
    sharingAttestationData = v13->_sharingAttestationData;
    v13->_sharingAttestationData = (NSData *)v66;

    uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerEphemeralKey"];
    ownerEphemeralKey = v13->_ownerEphemeralKey;
    v13->_ownerEphemeralKey = (NSData *)v68;

    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingEncryptedData"];
    sharingEncryptedData = v13->_sharingEncryptedData;
    v13->_sharingEncryptedData = (NSData *)v70;

    uint64_t v72 = [v4 decodeObjectOfClasses:v12 forKey:@"additionalAttestationsDict"];
    additionalAttestationsDict = v13->_additionalAttestationsDict;
    v13->_additionalAttestationsDict = (NSDictionary *)v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
    environment = v13->_environment;
    v13->_environment = (NSString *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingTokenAvailabilityBitmap"];
    sharingTokenAvailabilityBitmap = v13->_sharingTokenAvailabilityBitmap;
    v13->_sharingTokenAvailabilityBitmap = (NSNumber *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bleUUID"];
    bleUUID = v13->_bleUUID;
    v13->_bleUUID = (NSString *)v78;

    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerLongTermPublicKeyCertificate"];
    readerLongTermPublicKeyCertificate = v13->_readerLongTermPublicKeyCertificate;
    v13->_readerLongTermPublicKeyCertificate = (NSData *)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carOEMProprietaryData"];
    carOEMProprietaryData = v13->_carOEMProprietaryData;
    v13->_carOEMProprietaryData = (SEEndPointPrivacyEncryptResponse *)v82;

    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bleIntroKey"];
    bleIntroKey = v13->_bleIntroKey;
    v13->_bleIntroKey = (NSData *)v84;

    uint64_t v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bleOOBKey"];
    bleOOBKey = v13->_bleOOBKey;
    v13->_bleOOBKey = (NSData *)v86;

    uint64_t v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bleOOBMasterKey"];
    bleOOBMasterKey = v13->_bleOOBMasterKey;
    v13->_bleOOBMasterKey = (NSData *)v88;

    uint64_t v90 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bleDCKIdentifier"];
    bleDCKIdentifier = v13->_bleDCKIdentifier;
    v13->_bleDCKIdentifier = (NSData *)v90;

    uint64_t v92 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bleAddress"];
    bleAddress = v13->_bleAddress;
    v13->_bleAddress = (NSData *)v92;

    uint64_t v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blePairingRequest"];
    blePairingRequest = v13->_blePairingRequest;
    v13->_blePairingRequest = (NSNumber *)v94;

    uint64_t v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"longTermSharedSecret"];
    longTermSharedSecret = v13->_longTermSharedSecret;
    v13->_longTermSharedSecret = (NSData *)v96;

    uint64_t v98 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerIDSIdentifier"];
    ownerIDSIdentifier = v13->_ownerIDSIdentifier;
    v13->_ownerIDSIdentifier = (NSString *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingSessionUUID"];
    sharingSessionUUID = v13->_sharingSessionUUID;
    v13->_sharingSessionUUID = (NSString *)v100;

    uint64_t v102 = [v4 decodeObjectOfClasses:v8 forKey:@"supportedRKEFunctions"];
    supportedRKEFunctions = v13->_supportedRKEFunctions;
    v13->_supportedRKEFunctions = (NSArray *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletIdentifier"];
    appletIdentifier = v13->_appletIdentifier;
    v13->_appletIdentifier = (NSData *)v104;

    uint64_t v106 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"terminatedByTaskID"];
    terminatedByTaskID = v13->_terminatedByTaskID;
    v13->_terminatedByTaskID = (NSString *)v106;

    uint64_t v108 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerConfigID"];
    readerConfigID = v13->_readerConfigID;
    v13->_readerConfigID = (NSData *)v108;

    uint64_t v110 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hupData"];
    hupData = v13->_hupData;
    v13->_hupData = (NSData *)v110;

    uint64_t v112 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hupDone"];
    hupDone = v13->_hupDone;
    v13->_hupDone = (NSNumber *)v112;

    uint64_t v114 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleSupportedVersionsData"];
    vehicleSupportedVersionsData = v13->_vehicleSupportedVersionsData;
    v13->_vehicleSupportedVersionsData = (NSData *)v114;

    uint64_t v116 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mailboxSizesPlusAdditionalData"];
    mailboxSizesPlusAdditionalData = v13->_mailboxSizesPlusAdditionalData;
    v13->_mailboxSizesPlusAdditionalData = (NSData *)v116;

    uint64_t v118 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slotIdentifier"];
    slotIdentifier = v13->_slotIdentifier;
    v13->_slotIdentifier = (NSData *)v118;

    uint64_t v120 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeUUIDString"];
    homeUUIDString = v13->_homeUUIDString;
    v13->_homeUUIDString = (NSString *)v120;

    uint64_t v122 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"upgradeEndpointJSONData"];
    upgradeEndpointJSONData = v13->_upgradeEndpointJSONData;
    v13->_upgradeEndpointJSONData = (NSData *)v122;

    uint64_t v124 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anonymizedDsid"];
    anonymizedDsid = v13->_anonymizedDsid;
    v13->_anonymizedDsid = (NSData *)v124;

    if (!v13->_endPointType)
    {
      v126 = SESDefaultLogObject();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        v127 = [(NSData *)v13->_publicKeyIdentifier asHexString];
        *(_DWORD *)buf = 138412290;
        v134 = v127;
        _os_log_impl(&dword_2146ED000, v126, OS_LOG_TYPE_INFO, "Loading from pre15.X, inferring SEEndPointTypeAlisha with PKI %@", buf, 0xCu);
      }
      v13->_endPointType = 1;
    }
    if (!v13->_appletIdentifier)
    {
      v128 = SESDefaultLogObject();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2146ED000, v128, OS_LOG_TYPE_INFO, "Loading from pre15.X, inferring appletIdentifier as CCC AID", buf, 2u);
      }

      uint64_t v129 = [@"A000000809434343444B417631" hexStringAsData];
      v130 = v13->_appletIdentifier;
      v13->_appletIdentifier = (NSData *)v129;
    }
  }

  return v13;
}

- (int64_t)endPointType
{
  return self->_endPointType;
}

- (NSData)appletIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)subjectIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)publicKey
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)publicKeyIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)privacyPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)privacyPublicKeyIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (SEEndPointConfiguration)configuration
{
  return (SEEndPointConfiguration *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSData)readerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)readerPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (NSData)readerLongTermPublicKeyCertificate
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setReaderLongTermPublicKeyCertificate:(id)a3
{
}

- (NSArray)authorizedKeys
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)confidentialMailBoxSize
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (NSNumber)privateMailBoxSize
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (NSNumber)counter
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCertificates:(id)a3
{
}

- (NSString)friendlyName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFriendlyName:(id)a3
{
}

- (NSString)readerInfo
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setReaderInfo:(id)a3
{
}

- (NSString)invitationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInvitationIdentifier:(id)a3
{
}

- (NSData)mailboxMapping
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (void)setMailboxMapping:(id)a3
{
}

- (NSData)trackingRequest
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTrackingRequest:(id)a3
{
}

- (NSData)trackingReceipt
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTrackingReceipt:(id)a3
{
}

- (NSData)deviceConfiguration
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDeviceConfiguration:(id)a3
{
}

- (NSString)environment
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setEnvironment:(id)a3
{
}

- (NSNumber)sharingTokenAvailabilityBitmap
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSharingTokenAvailabilityBitmap:(id)a3
{
}

- (NSString)bleUUID
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBleUUID:(id)a3
{
}

- (NSData)bleIntroKey
{
  return (NSData *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBleIntroKey:(id)a3
{
}

- (NSData)bleOOBKey
{
  return (NSData *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBleOOBKey:(id)a3
{
}

- (NSData)bleOOBMasterKey
{
  return (NSData *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBleOOBMasterKey:(id)a3
{
}

- (NSData)bleDCKIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setBleDCKIdentifier:(id)a3
{
}

- (NSData)bleAddress
{
  return (NSData *)objc_getProperty(self, a2, 256, 1);
}

- (void)setBleAddress:(id)a3
{
}

- (NSNumber)blePairingRequest
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setBlePairingRequest:(id)a3
{
}

- (NSArray)supportedRKEFunctions
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSupportedRKEFunctions:(id)a3
{
}

- (NSData)longTermSharedSecret
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (void)setLongTermSharedSecret:(id)a3
{
}

- (NSString)ownerIDSIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setOwnerIDSIdentifier:(id)a3
{
}

- (NSString)sharingSessionUUID
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSharingSessionUUID:(id)a3
{
}

- (NSData)readerConfigID
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

- (void)setReaderConfigID:(id)a3
{
}

- (NSData)hupData
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (void)setHupData:(id)a3
{
}

- (NSNumber)hupDone
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setHupDone:(id)a3
{
}

- (NSData)vehicleSupportedVersionsData
{
  return (NSData *)objc_getProperty(self, a2, 328, 1);
}

- (void)setVehicleSupportedVersionsData:(id)a3
{
}

- (NSData)mailboxSizesPlusAdditionalData
{
  return (NSData *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMailboxSizesPlusAdditionalData:(id)a3
{
}

- (NSData)slotIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 344, 1);
}

- (void)setSlotIdentifier:(id)a3
{
}

- (NSString)homeUUIDString
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setHomeUUIDString:(id)a3
{
}

- (NSData)upgradeEndpointJSONData
{
  return (NSData *)objc_getProperty(self, a2, 360, 1);
}

- (void)setUpgradeEndpointJSONData:(id)a3
{
}

- (NSData)anonymizedDsid
{
  return (NSData *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAnonymizedDsid:(id)a3
{
}

- (NSArray)sharingRecords
{
  return (NSArray *)objc_getProperty(self, a2, 376, 1);
}

- (void)setSharingRecords:(id)a3
{
}

- (NSData)revocationAttestation
{
  return self->_revocationAttestation;
}

- (void)setRevocationAttestation:(id)a3
{
}

- (SEEndPointPrivacyEncryptResponse)carOEMProprietaryData
{
  return self->_carOEMProprietaryData;
}

- (void)setCarOEMProprietaryData:(id)a3
{
}

- (NSData)sharingAttestationData
{
  return (NSData *)objc_getProperty(self, a2, 400, 1);
}

- (void)setSharingAttestationData:(id)a3
{
}

- (NSData)ownerEphemeralKey
{
  return (NSData *)objc_getProperty(self, a2, 408, 1);
}

- (void)setOwnerEphemeralKey:(id)a3
{
}

- (NSData)sharingEncryptedData
{
  return (NSData *)objc_getProperty(self, a2, 416, 1);
}

- (void)setSharingEncryptedData:(id)a3
{
}

- (NSDictionary)additionalAttestationsDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setAdditionalAttestationsDict:(id)a3
{
}

- (NSString)terminatedByTaskID
{
  return self->_terminatedByTaskID;
}

- (void)setTerminatedByTaskID:(id)a3
{
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (NSString)privacyKeyIdentifier
{
  return self->_privacyKeyIdentifier;
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_privacyKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_terminatedByTaskID, 0);
  objc_storeStrong((id *)&self->_additionalAttestationsDict, 0);
  objc_storeStrong((id *)&self->_sharingEncryptedData, 0);
  objc_storeStrong((id *)&self->_ownerEphemeralKey, 0);
  objc_storeStrong((id *)&self->_sharingAttestationData, 0);
  objc_storeStrong((id *)&self->_carOEMProprietaryData, 0);
  objc_storeStrong((id *)&self->_revocationAttestation, 0);
  objc_storeStrong((id *)&self->_sharingRecords, 0);
  objc_storeStrong((id *)&self->_anonymizedDsid, 0);
  objc_storeStrong((id *)&self->_upgradeEndpointJSONData, 0);
  objc_storeStrong((id *)&self->_homeUUIDString, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_mailboxSizesPlusAdditionalData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedVersionsData, 0);
  objc_storeStrong((id *)&self->_hupDone, 0);
  objc_storeStrong((id *)&self->_hupData, 0);
  objc_storeStrong((id *)&self->_readerConfigID, 0);
  objc_storeStrong((id *)&self->_sharingSessionUUID, 0);
  objc_storeStrong((id *)&self->_ownerIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_longTermSharedSecret, 0);
  objc_storeStrong((id *)&self->_supportedRKEFunctions, 0);
  objc_storeStrong((id *)&self->_blePairingRequest, 0);
  objc_storeStrong((id *)&self->_bleAddress, 0);
  objc_storeStrong((id *)&self->_bleDCKIdentifier, 0);
  objc_storeStrong((id *)&self->_bleOOBMasterKey, 0);
  objc_storeStrong((id *)&self->_bleOOBKey, 0);
  objc_storeStrong((id *)&self->_bleIntroKey, 0);
  objc_storeStrong((id *)&self->_bleUUID, 0);
  objc_storeStrong((id *)&self->_sharingTokenAvailabilityBitmap, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_deviceConfiguration, 0);
  objc_storeStrong((id *)&self->_trackingReceipt, 0);
  objc_storeStrong((id *)&self->_trackingRequest, 0);
  objc_storeStrong((id *)&self->_mailboxMapping, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_readerInfo, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_counter, 0);
  objc_storeStrong((id *)&self->_privateMailBoxSize, 0);
  objc_storeStrong((id *)&self->_confidentialMailBoxSize, 0);
  objc_storeStrong((id *)&self->_authorizedKeys, 0);
  objc_storeStrong((id *)&self->_readerLongTermPublicKeyCertificate, 0);
  objc_storeStrong((id *)&self->_readerPublicKey, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_privacyPublicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_privacyPublicKey, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end