@interface NGMPublicDeviceIdentity
+ (BOOL)shouldMarkForStateReset:(id)a3;
+ (NGMPublicDeviceIdentity)identityWithIdentityData:(id)a3 prekeyData:(id)a4 error:(id *)a5;
- (BOOL)isIdenticalIdentityTo:(id)a3;
- (BOOL)isTetraCompatibleWithFullKey:(id)a3;
- (BOOL)isValidSignature:(id)a3 forMessage:(id)a4 forType:(int64_t)a5 error:(id *)a6;
- (BOOL)isValidSigningDestination;
- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 ourSigningIdentity:(id)a5 theirURI:(id)a6 theirPushToken:(id)a7;
- (BOOL)validateTetraBindingsAuthenticatedData:(id)a3 GUID:(id)a4 sendingURI:(id)a5 sendingPushToken:(id)a6 receivingURI:(id)a7 receivingPushToken:(id)a8;
- (BOOL)verifySignature:(id)a3 formatter:(id)a4;
- (NGMECDHPublicPreKey)echnidaRegistration;
- (NGMPublicDeviceIdentity)initWithEchnidaRegistration:(id)a3 tetraRegistration:(id)a4 signingKey:(id)a5;
- (SigningPublicKey)signingKey;
- (_TtC17MessageProtection17TetraRegistration)tetraRegistration;
- (id)description;
- (id)identityData;
- (id)prekeyData;
- (id)sealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 encryptedAttributes:(id)a13 signedByFullIdentity:(id)a14 errors:(id *)a15;
- (id)sealMessage:(id)a3 forceSizeOptimizations:(BOOL)a4 resetState:(BOOL)a5 encryptedAttributes:(id)a6 signedByFullIdentity:(id)a7 errors:(id *)a8;
- (id)sealMessage:(id)a3 guid:(id)a4 sendingURI:(id)a5 sendingPushToken:(id)a6 receivingURI:(id)a7 receivingPushToken:(id)a8 forceSizeOptimizations:(BOOL)a9 resetState:(BOOL)a10 encryptedAttributes:(id)a11 signedByFullIdentity:(id)a12 errors:(id *)a13;
- (id)sealMessage:(id)a3 signedByFullIdentity:(id)a4 error:(id *)a5;
- (id)sealMessage:(id)a3 withEncryptedAttributes:(id)a4 signedByFullIdentity:(id)a5 error:(id *)a6;
- (void)identityData;
- (void)prekeyData;
- (void)setEchnidaRegistration:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)setTetraRegistration:(id)a3;
@end

@implementation NGMPublicDeviceIdentity

- (NGMPublicDeviceIdentity)initWithEchnidaRegistration:(id)a3 tetraRegistration:(id)a4 signingKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NGMPublicDeviceIdentity;
  v12 = [(NGMPublicDeviceIdentity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_signingKey, a5);
    objc_storeStrong((id *)&v13->_echnidaRegistration, a3);
    objc_storeStrong((id *)&v13->_tetraRegistration, a4);
  }

  return v13;
}

+ (NGMPublicDeviceIdentity)identityWithIdentityData:(id)a3 prekeyData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[NGMPBPublicDeviceIdentity alloc] initWithData:v9];

  if (v10
    && ([(NGMPBPublicDeviceIdentity *)v10 signingKey],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    v12 = [SigningPublicKey alloc];
    v13 = [(NGMPBPublicDeviceIdentity *)v10 signingKey];
    v14 = [(PublicKey *)v12 initWithData:v13 error:a5];

    if (v14)
    {
      objc_super v15 = [[NGMPBPublicDevicePrekey alloc] initWithData:v8];
      v16 = v15;
      if (v15
        && ([(NGMPBPublicDevicePrekey *)v15 prekey],
            v17 = objc_claimAutoreleasedReturnValue(),
            v17,
            v17))
      {
        id v18 = [[NGMECDHPublicPreKey alloc] initRemotePrekeyWithPublicPrekeyPB:v16 signedBy:v14 error:a5];
        v19 = v18;
        if (v18
          && ([v18 dhKey], v20 = objc_claimAutoreleasedReturnValue(), v20, v20))
        {
          if (+[TetraVersions isWireCompatibleWith:[(NGMPBPublicDeviceIdentity *)v10 tetraVersion]])
          {
            v30 = [_TtC17MessageProtection17TetraRegistration alloc];
            v21 = [(NGMPBPublicDevicePrekey *)v16 tetraPreKey];
            v32 = [v19 dhKey];
            v31 = [v32 key];
            v22 = [v31 dataRepresentation];
            unsigned int v29 = [(NGMPBPublicDeviceIdentity *)v10 tetraVersion];
            [(NGMPBPublicDevicePrekey *)v16 timestamp];
            double v24 = v23;
            v25 = [(SigningPublicKey *)v14 tetraWrapped];
            v26 = [(TetraRegistration *)v30 initWithTetraRegistrationData:v21 ecdhPublicKey:v22 version:v29 timestamp:v25 signedBy:1 isEncrypting:a5 error:v24];
          }
          else
          {
            NSLog(&cfstr_TetraVersionMi.isa, [(NGMPBPublicDeviceIdentity *)v10 tetraVersion], +[TetraVersions currentTetraVersion]);
            v26 = 0;
          }
          v27 = (void *)[objc_alloc((Class)a1) initWithEchnidaRegistration:v19 tetraRegistration:v26 signingKey:v14];
        }
        else
        {
          v27 = 0;
        }
      }
      else
      {
        MPLogAndAssignError(100, a5, @"Failed to deserialize the device public prekey.");
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    MPLogAndAssignError(302, a5, @"The deserialization of the public fixed device identity failed.");
    v27 = 0;
  }

  return (NGMPublicDeviceIdentity *)v27;
}

- (id)identityData
{
  v3 = objc_alloc_init(NGMPBPublicDeviceIdentity);
  v4 = [(NGMPublicDeviceIdentity *)self signingKey];
  v5 = [v4 dataRepresentation];
  [(NGMPBPublicDeviceIdentity *)v3 setSigningKey:v5];

  v6 = [(NGMPublicDeviceIdentity *)self tetraRegistration];

  if (v6)
  {
    v7 = [(NGMPublicDeviceIdentity *)self tetraRegistration];
    -[NGMPBPublicDeviceIdentity setTetraVersion:](v3, "setTetraVersion:", [v7 tetraVersion]);
  }
  id v8 = [(NGMPBPublicDeviceIdentity *)v3 signingKey];

  if (v8)
  {
    id v9 = [(NGMPBPublicDeviceIdentity *)v3 data];
  }
  else
  {
    id v10 = MessageProtectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NGMPublicDeviceIdentity identityData]();
    }

    id v9 = 0;
  }

  return v9;
}

- (BOOL)isIdenticalIdentityTo:(id)a3
{
  id v4 = a3;
  v5 = [[NGMPBPublicDeviceIdentity alloc] initWithData:v4];

  if (!v5
    || ([(NGMPBPublicDeviceIdentity *)v5 signingKey],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    v16 = MessageProtectionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[NGMPublicDeviceIdentity isIdenticalIdentityTo:]();
    }
    goto LABEL_13;
  }
  v7 = [(NGMPublicDeviceIdentity *)self signingKey];
  id v8 = [v7 dataRepresentation];
  id v9 = [(NGMPBPublicDeviceIdentity *)v5 signingKey];
  char v10 = [v8 isEqualToData:v9];

  if ((v10 & 1) == 0)
  {
    v16 = MessageProtectionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[NGMPublicDeviceIdentity isIdenticalIdentityTo:]();
    }
LABEL_13:
    BOOL v17 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = [(NGMPublicDeviceIdentity *)self tetraRegistration];
  if (!v11
    || (v12 = (void *)v11,
        [(NGMPublicDeviceIdentity *)self tetraRegistration],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 tetraVersion],
        unsigned int v15 = [(NGMPBPublicDeviceIdentity *)v5 tetraVersion],
        v13,
        v12,
        v14 >= v15))
  {
    BOOL v17 = 1;
    goto LABEL_15;
  }
  v16 = MessageProtectionLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[NGMPublicDeviceIdentity isIdenticalIdentityTo:]();
  }
  BOOL v17 = 1;
LABEL_14:

LABEL_15:
  return v17;
}

- (id)prekeyData
{
  v3 = objc_alloc_init(NGMPBPublicDevicePrekey);
  uint64_t v4 = [(NGMPublicDeviceIdentity *)self echnidaRegistration];
  [(id)v4 timestamp];
  -[NGMPBPublicDevicePrekey setTimestamp:](v3, "setTimestamp:");

  v5 = [(NGMPublicDeviceIdentity *)self echnidaRegistration];
  [v5 timestamp];
  LOBYTE(v4) = +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 1);

  if (v4)
  {
    v6 = [(NGMPublicDeviceIdentity *)self echnidaRegistration];
    v7 = [v6 dhKey];
    id v8 = [v7 dataRepresentation];
    [(NGMPBPublicDevicePrekey *)v3 setPrekey:v8];

    id v9 = [(NGMPBPublicDevicePrekey *)v3 prekey];

    if (!v9)
    {
      v19 = 0;
      goto LABEL_17;
    }
    char v10 = [(NGMPublicDeviceIdentity *)self echnidaRegistration];
    uint64_t v11 = [v10 signature];
    [(NGMPBPublicDevicePrekey *)v3 setPrekeySignature:v11];

    v12 = [(NGMPublicDeviceIdentity *)self tetraRegistration];

    if (v12)
    {
      v13 = [(NGMPublicDeviceIdentity *)self tetraRegistration];
      unsigned int v14 = [v13 registrationData];
      [(NGMPBPublicDevicePrekey *)v3 setTetraPreKey:v14];
    }
    unsigned int v15 = [(NGMPBPublicDevicePrekey *)v3 data];
    v16 = [(NGMPublicDeviceIdentity *)self identityData];
    id v22 = 0;
    BOOL v17 = +[NGMPublicDeviceIdentity identityWithIdentityData:v16 prekeyData:v15 error:&v22];
    id v18 = v22;

    if (v18 || !v17)
    {
      v20 = MessageProtectionLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[NGMPublicDeviceIdentity prekeyData](v18);
      }

      v19 = 0;
    }
    else
    {
      v19 = v15;
    }
  }
  else
  {
    unsigned int v15 = MessageProtectionLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NGMPublicDeviceIdentity prekeyData]();
    }
    v19 = 0;
  }

LABEL_17:
  return v19;
}

- (BOOL)verifySignature:(id)a3 formatter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NGMPublicDeviceIdentity *)self signingKey];
  char v9 = [v8 verifySignature:v7 formatter:v6];

  return v9;
}

- (BOOL)isValidSigningDestination
{
  v2 = [(NGMPublicDeviceIdentity *)self echnidaRegistration];
  [v2 timestamp];
  BOOL v3 = +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 1);

  return v3;
}

- (BOOL)isTetraCompatibleWithFullKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  tetraRegistration = self->_tetraRegistration;
  if (!tetraRegistration) {
    goto LABEL_5;
  }
  if (!+[TetraVersions isWireCompatibleWith:[(TetraRegistration *)tetraRegistration tetraVersion]])goto LABEL_5; {
  id v6 = [v4 devicePrekeys];
  }
  id v7 = [v6 lastObject];
  id v8 = [v7 tetraRegistration];
  BOOL v9 = +[TetraVersions isWireCompatibleWith:](_TtC17MessageProtection13TetraVersions, "isWireCompatibleWith:", [v8 tetraVersion]);

  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
LABEL_5:
    uint64_t v11 = MessageProtectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unsigned int v12 = [(TetraRegistration *)self->_tetraRegistration tetraVersion];
      v13 = [v4 devicePrekeys];
      unsigned int v14 = [v13 lastObject];
      unsigned int v15 = [v14 tetraRegistration];
      v17[0] = 67109632;
      v17[1] = v12;
      __int16 v18 = 1024;
      int v19 = [v15 tetraVersion];
      __int16 v20 = 1024;
      unsigned int v21 = +[TetraVersions currentTetraVersion];
      _os_log_impl(&dword_2163F2000, v11, OS_LOG_TYPE_INFO, "Their remote registered Tetra version (%u), our registered Tetra version (%d) and our software version (%u) are different.", (uint8_t *)v17, 0x14u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (id)sealMessage:(id)a3 signedByFullIdentity:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = MessageProtectionLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[NGMPublicDeviceIdentity sealMessage:signedByFullIdentity:error:]();
  }

  uint64_t v11 = [(NGMPublicDeviceIdentity *)self sealMessage:v9 withEncryptedAttributes:0 signedByFullIdentity:v8 error:a5];

  return v11;
}

- (id)sealMessage:(id)a3 withEncryptedAttributes:(id)a4 signedByFullIdentity:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![(NGMPublicDeviceIdentity *)self isValidSigningDestination])
  {
    double v23 = NSString;
    v13 = [(NGMPublicDeviceIdentity *)self echnidaRegistration];
    [v13 timestamp];
    v25 = objc_msgSend(v23, "stringWithFormat:", @"Failed to encrypt to prekey that is no longer valid: %f.", v24);
    MPLogAndAssignError(150, a6, v25);

LABEL_10:
    unsigned int v21 = 0;
    goto LABEL_19;
  }
  v13 = +[FullKey generateNewKeyWithAccess:0 forceNoSEP:1 error:a6];
  if (!v13)
  {
    MPLogAndAssignError(4, a6, @"Failed to generate an ephemeral P-256 key for message sealing.");
    goto LABEL_10;
  }
  unsigned int v14 = [(NGMPublicDeviceIdentity *)self echnidaRegistration];
  unsigned int v15 = [v14 dhKey];
  v16 = [v13 keyAgreementWithPublicKey:v15 error:a6];

  if (v16)
  {
    BOOL v17 = [@"LastPawn-MessageKeys" dataUsingEncoding:4];
    __int16 v18 = +[HKDF deriveKeyWith:v16 salt:v17 outputSize:48];

    if (!v18)
    {
      unsigned int v21 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v46 = objc_msgSend(v18, "subdataWithRange:", 0, 32);
    v45 = objc_msgSend(v18, "subdataWithRange:", 32, 16);
    uint64_t v19 = +[NGMMessageFormatter formatOutgoingInnerMessageWithPayload:v10 attributes:v11 destinationIdentity:self sendingIdentity:v12 error:a6];
    if (v19)
    {
      __int16 v20 = (void *)v19;
      if (*a6)
      {
        unsigned int v21 = 0;
        uint64_t v22 = (void *)v19;
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v22 = +[NGMPadding padMessage:v19 error:a6];

      if (!*a6)
      {
        v27 = +[MP_AES_CTR encrypt:v22 key:v46 IV:v45];
        if (v27)
        {
          v43 = [NGMMessageSignatureFormatter alloc];
          v37 = [(NGMPublicDeviceIdentity *)self echnidaRegistration];
          v36 = [v37 dhKey];
          v41 = [v36 dataRepresentation];
          v35 = [v13 publicKey];
          v39 = [v35 dataRepresentation];
          v34 = [(NGMPublicDeviceIdentity *)self signingKey];
          uint64_t v28 = [v34 dataRepresentation];
          unsigned int v29 = v27;
          v30 = (void *)v28;
          v38 = v29;
          v44 = -[NGMMessageSignatureFormatter initWithDHOutput:prekeyPub:ephemeralPub:recipientPub:ciphertext:](v43, "initWithDHOutput:prekeyPub:ephemeralPub:recipientPub:ciphertext:", v16, v41, v39, v28);

          v31 = [v12 signDataWithFormatter:v44 error:a6];
          if (v31)
          {
            v42 = v31;
            v40 = +[NGMKeyValidator keyValidatorWithReceiversIdentity:self sendersIdentity:v12];
            v32 = [v13 key];
            v33 = [v32 publicKey];
            unsigned int v21 = +[NGMMessageFormatter formatOutgoingMessageWithEncryptedPayload:v38 ephemeral:v33 signature:v42 keyValidator:v40];

            v31 = v42;
          }
          else
          {
            unsigned int v21 = 0;
          }

          v27 = v38;
        }
        else
        {
          MPLogAndAssignError(400, a6, @"The encryption of an outgoing message failed.");
          unsigned int v21 = 0;
        }

        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    unsigned int v21 = 0;
    goto LABEL_16;
  }
  unsigned int v21 = 0;
LABEL_18:

LABEL_19:
  return v21;
}

- (id)sealMessage:(id)a3 forceSizeOptimizations:(BOOL)a4 resetState:(BOOL)a5 encryptedAttributes:(id)a6 signedByFullIdentity:(id)a7 errors:(id *)a8
{
  id v11 = a7;
  id v12 = a3;
  v13 = MessageProtectionLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[NGMPublicDeviceIdentity sealMessage:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:]();
  }

  id v17 = 0;
  unsigned int v14 = [(NGMPublicDeviceIdentity *)self sealMessage:v12 withEncryptedAttributes:0 signedByFullIdentity:v11 error:&v17];

  id v15 = v17;
  if (!v15)
  {
    NoError();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  [*a8 setObject:v15 forKey:&unk_26C70CD28];

  return v14;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(NGMPublicDeviceIdentity *)self signingKey];
  v5 = [v4 description];
  id v6 = [(NGMPublicDeviceIdentity *)self echnidaRegistration];
  id v7 = [v6 description];
  id v8 = [v3 stringWithFormat:@"NGMPublicDeviceIdentity with device signing key: %@ \n prekey: %@", v5, v7];

  return v8;
}

- (BOOL)validateTetraBindingsAuthenticatedData:(id)a3 GUID:(id)a4 sendingURI:(id)a5 sendingPushToken:(id)a6 receivingURI:(id)a7 receivingPushToken:(id)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v13 = a3;
  unsigned int v14 = (__CFString *)a4;
  id v15 = (__CFString *)a5;
  id v16 = a6;
  id v17 = (__CFString *)a7;
  id v18 = a8;
  uint64_t v19 = MessageProtectionLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v20 = [v13 base64EncodedStringWithOptions:0];
    unsigned int v21 = [v16 base64EncodedStringWithOptions:0];
    uint64_t v22 = [v18 base64EncodedStringWithOptions:0];
    *(_DWORD *)buf = 138413570;
    v39 = v20;
    __int16 v40 = 2112;
    v41 = v14;
    __int16 v42 = 2112;
    v43 = v15;
    __int16 v44 = 2112;
    v45 = v21;
    __int16 v46 = 2112;
    v47 = v17;
    __int16 v48 = 2112;
    v49 = v22;
    _os_log_impl(&dword_2163F2000, v19, OS_LOG_TYPE_INFO, "Tetra binding arguments: {authenticatedData = %@, guid = %@, sendingURI = %@, sendingPushToken = %@, receivingURI = %@, receivingPushToken = %@}", buf, 0x3Eu);
  }
  if (v13)
  {
    BOOL v37 = [v13 length] != 0;
    if (v14) {
      goto LABEL_5;
    }
  }
  else
  {
    BOOL v37 = 0;
    if (v14)
    {
LABEL_5:
      int v23 = [(__CFString *)v14 isEqualToString:&stru_26C705600] ^ 1;
      if (v15) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  int v23 = 0;
  if (v15)
  {
LABEL_6:
    int v24 = [(__CFString *)v15 isEqualToString:&stru_26C705600];
    if (v16) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_12:
  int v24 = 1;
  if (v16)
  {
LABEL_7:
    BOOL v25 = [v16 length] != 0;
    if (v17) {
      goto LABEL_8;
    }
LABEL_14:
    int v26 = 0;
    if (!v18) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
LABEL_13:
  BOOL v25 = 0;
  if (!v17) {
    goto LABEL_14;
  }
LABEL_8:
  int v26 = [(__CFString *)v17 isEqualToString:&stru_26C705600] ^ 1;
  if (!v18) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v27 = [v18 length];
  if ((v37 & v23 & ~v24 & v25 & v26) != 1 || !v27)
  {
LABEL_18:
    unsigned int v29 = MessageProtectionLog();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
LABEL_19:

      BOOL v28 = 0;
      goto LABEL_20;
    }
    if (v37)
    {
      v31 = @"Valid";
      if ((v23 & 1) == 0) {
        goto LABEL_23;
      }
    }
    else
    {
      v31 = [v13 description];
      if ((v23 & 1) == 0)
      {
LABEL_23:
        v36 = [(__CFString *)v14 description];
        if (v15) {
          goto LABEL_24;
        }
        goto LABEL_30;
      }
    }
    v36 = @"Valid";
    if (v15)
    {
LABEL_24:
      v35 = @"Valid";
      if (v16) {
        goto LABEL_25;
      }
      goto LABEL_31;
    }
LABEL_30:
    v35 = [0 description];
    if (v16)
    {
LABEL_25:
      v34 = @"Valid";
      if (v17) {
        goto LABEL_26;
      }
      goto LABEL_32;
    }
LABEL_31:
    v34 = [0 description];
    if (v17)
    {
LABEL_26:
      v33 = @"Valid";
      if (v18)
      {
LABEL_27:
        v32 = @"Valid";
        goto LABEL_34;
      }
LABEL_33:
      v32 = [0 description];
LABEL_34:
      *(_DWORD *)buf = 138413570;
      v39 = v31;
      __int16 v40 = 2112;
      v41 = v36;
      __int16 v42 = 2112;
      v43 = v35;
      __int16 v44 = 2112;
      v45 = v34;
      __int16 v46 = 2112;
      v47 = v33;
      __int16 v48 = 2112;
      v49 = v32;
      _os_log_fault_impl(&dword_2163F2000, v29, OS_LOG_TYPE_FAULT, "Invalid Tetra binding argument: {authenticatedData = %@, guid = %@, sendingURI = %@, sendingPushToken = %@, receivingURI = %@, receivingPushToken = %@}", buf, 0x3Eu);
      if (v18)
      {
        if (v17) {
          goto LABEL_36;
        }
      }
      else
      {

        if (v17)
        {
LABEL_36:
          if (v16) {
            goto LABEL_37;
          }
          goto LABEL_44;
        }
      }

      if (v16)
      {
LABEL_37:
        if (v15) {
          goto LABEL_38;
        }
        goto LABEL_45;
      }
LABEL_44:

      if (v15)
      {
LABEL_38:
        if (v23) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
LABEL_45:

      if (v23)
      {
LABEL_40:
        if (!v37) {

        }
        goto LABEL_19;
      }
LABEL_39:

      goto LABEL_40;
    }
LABEL_32:
    v33 = [0 description];
    if (v18) {
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  BOOL v28 = 1;
LABEL_20:

  return v28;
}

+ (BOOL)shouldMarkForStateReset:(id)a3
{
  return +[TetraErrorHelpers shouldMarkForStateResetWithString:a3];
}

- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 ourSigningIdentity:(id)a5 theirURI:(id)a6 theirPushToken:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(NGMPublicDeviceIdentity *)self tetraRegistration];
  if (v17)
  {
    id v18 = (void *)v17;
    id v34 = v13;
    id v35 = v15;
    uint64_t v19 = [(NGMPublicDeviceIdentity *)self tetraRegistration];
    uint64_t v20 = [v19 signingPublicKey];
    if (v20)
    {
      unsigned int v21 = (void *)v20;
      [(NGMPublicDeviceIdentity *)self tetraRegistration];
      id v22 = v16;
      id v23 = v14;
      v25 = id v24 = v12;
      int v26 = [v25 signingPublicKey];
      uint64_t v27 = [v26 compactRepresentation];

      id v12 = v24;
      id v14 = v23;
      id v16 = v22;

      id v13 = v34;
      id v15 = v35;
      if (v27)
      {
        BOOL v28 = [(NGMPublicDeviceIdentity *)self tetraRegistration];
        unsigned int v29 = [v14 deviceSigningKey];
        v30 = [v29 tetraWrapped];
        BOOL v31 = +[TetraAPI markForStateResetWithOurURI:v12 ourPushToken:v34 theirURI:v35 theirPushToken:v16 theirRegistration:v28 signedByOur:v30];

        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  v32 = MessageProtectionLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    -[NGMPublicDeviceIdentity markForStateResetWithOurURI:ourPushToken:ourSigningIdentity:theirURI:theirPushToken:]();
  }

  BOOL v31 = 0;
LABEL_9:

  return v31;
}

- (id)sealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 encryptedAttributes:(id)a13 signedByFullIdentity:(id)a14 errors:(id *)a15
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v20 = a4;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v49 = a13;
  id v26 = a14;
  int v27 = MPSecondaryEncryptionDisabled();
  int v28 = MPSecondaryRegistrationDisabled();
  v52 = v22;
  v53 = v20;
  v51 = v23;
  id v29 = v23;
  v30 = v21;
  BOOL v31 = [(NGMPublicDeviceIdentity *)self validateTetraBindingsAuthenticatedData:v20 GUID:v21 sendingURI:v22 sendingPushToken:v29 receivingURI:v24 receivingPushToken:v25];
  v32 = MessageProtectionLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v57 = v21;
    __int16 v58 = 1024;
    int v59 = v27;
    __int16 v60 = 1024;
    int v61 = v28;
    _os_log_impl(&dword_2163F2000, v32, OS_LOG_TYPE_INFO, "Sealing message with GUID: %@. secondaryDisabled=%d, secondaryRegistrationDisabled=%d", buf, 0x18u);
  }

  BOOL v33 = [(NGMPublicDeviceIdentity *)self isTetraCompatibleWithFullKey:v26];
  if (a5 == 1) {
    char v34 = 1;
  }
  else {
    char v34 = v27;
  }
  if (v33 && (v34 & 1) == 0 && v31)
  {
    id v35 = [(NGMPublicDeviceIdentity *)self tetraRegistration];
    v36 = [v26 deviceSigningKey];
    BOOL v37 = [v36 tetraWrapped];
    id v55 = 0;
    LOBYTE(v47) = a12;
    v38 = +[TetraAPI sealWithMessage:v50 authenticatedData:v53 guid:v21 sendingURI:v52 sendingPushToken:v51 receivingURI:v24 receivingPushToken:v25 receiverRegistration:v35 encryptedAttributes:v49 resetState:v47 signedBy:v37 error:&v55];
    id v39 = v55;

    if (!v39)
    {
      NoError();
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      [*a15 setObject:v44 forKey:&unk_26C70CD40];
      __int16 v46 = objc_alloc_init(NGMPBOuterMessage);
      [(NGMPBOuterMessage *)v46 setTetraMessage:v38];
      v43 = [(NGMPBOuterMessage *)v46 data];

      __int16 v42 = v49;
      v41 = v50;
      goto LABEL_16;
    }
    [*a15 setObject:v39 forKey:&unk_26C70CD40];
    __int16 v40 = MessageProtectionLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[NGMPublicDeviceIdentity sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:](v39);
    }
  }
  id v54 = 0;
  __int16 v42 = v49;
  v41 = v50;
  v43 = [(NGMPublicDeviceIdentity *)self sealMessage:v50 withEncryptedAttributes:v49 signedByFullIdentity:v26 error:&v54];
  id v44 = v54;
  if (!v44)
  {
    NoError();
    id v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  [*a15 setObject:v44 forKey:&unk_26C70CD28];
LABEL_16:

  return v43;
}

- (id)sealMessage:(id)a3 guid:(id)a4 sendingURI:(id)a5 sendingPushToken:(id)a6 receivingURI:(id)a7 receivingPushToken:(id)a8 forceSizeOptimizations:(BOOL)a9 resetState:(BOOL)a10 encryptedAttributes:(id)a11 signedByFullIdentity:(id)a12 errors:(id *)a13
{
  uint64_t v19 = (void *)MEMORY[0x263EFF8F8];
  id v20 = a12;
  id v21 = a11;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  int v28 = [v19 data];
  LOWORD(v31) = __PAIR16__(a10, a9);
  id v29 = -[NGMPublicDeviceIdentity sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:](self, "sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:", v27, v28, 0, v26, v25, v24, v23, v22, v31, v21, v20, a13);

  return v29;
}

- (SigningPublicKey)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
}

- (NGMECDHPublicPreKey)echnidaRegistration
{
  return self->_echnidaRegistration;
}

- (void)setEchnidaRegistration:(id)a3
{
}

- (_TtC17MessageProtection17TetraRegistration)tetraRegistration
{
  return self->_tetraRegistration;
}

- (void)setTetraRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tetraRegistration, 0);
  objc_storeStrong((id *)&self->_echnidaRegistration, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
}

- (BOOL)isValidSignature:(id)a3 forMessage:(id)a4 forType:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if ((unint64_t)a5 > 2)
  {
    char v13 = 0;
  }
  else
  {
    id v11 = (void *)[objc_alloc(*off_26427F678[a5]) initWithApplicationData:v10];
    id v12 = [(NGMPublicDeviceIdentity *)self signingKey];
    char v13 = [v12 verifySignature:v9 formatter:v11];
  }
  return v13;
}

- (void)identityData
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2163F2000, v0, v1, "Failed to obtain the dataRepresentation of the signing key.", v2, v3, v4, v5, v6);
}

- (void)isIdenticalIdentityTo:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2163F2000, v0, v1, "Identity is not identical since the pinned data couldn't be decoded.", v2, v3, v4, v5, v6);
}

- (void)isIdenticalIdentityTo:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2163F2000, v0, v1, "Tetra version has been lowered.", v2, v3, v4, v5, v6);
}

- (void)isIdenticalIdentityTo:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2163F2000, v0, v1, "Identity is not identical since the identity public key doesn't match.", v2, v3, v4, v5, v6);
}

- (void)prekeyData
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2163F2000, v0, v1, "Cannot retrieve prekey information because the timestamp of the signature is too old to be registered.", v2, v3, v4, v5, v6);
}

- (void)sealMessage:signedByFullIdentity:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2163F2000, v0, v1, "Calling the deprecated seal method: sealMessage:forceSizeOptimizations:resetState:shouldReset:encryptedAttributes:signedByFullIdentity:error. Encrypted attributes will be nil.", v2, v3, v4, v5, v6);
}

- (void)sealMessage:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2163F2000, v0, v1, "Calling seal method sealMessage:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors.", v2, v3, v4, v5, v6);
}

- (void)markForStateResetWithOurURI:ourPushToken:ourSigningIdentity:theirURI:theirPushToken:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2163F2000, v0, v1, "Failed to reset the Tetra session because the device doesn't appear to have a valid Tetra registration.", v2, v3, v4, v5, v6);
}

- (void)sealMessage:(void *)a1 authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:.cold.1(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Tetra encryption failed, allowing fallback on Echnida. {tetraError=%@}", v4, v5, v6, v7, 2u);
}

@end