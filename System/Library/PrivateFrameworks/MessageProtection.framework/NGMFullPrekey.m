@interface NGMFullPrekey
+ (id)fullPrekeyForTestingSignedBy:(id)a3;
+ (id)newCompactPrivateKey;
- (BOOL)delete;
- (BOOL)isSEPKey;
- (DHKey)dhKey;
- (NGMECDHPublicPreKey)publicPrekey;
- (NGMFullPrekey)initWithPBPrekey:(id)a3 verifySignedBy:(id)a4 error:(id *)a5;
- (NGMFullPrekey)initWithPrekeySignedBy:(id)a3 error:(id *)a4;
- (_TtC17MessageProtection17TetraRegistration)tetraRegistration;
- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)tetraPrivateKey;
- (id)description;
- (id)keychainData;
- (id)pbDevicePrekey;
- (void)delete;
- (void)pbDevicePrekey;
@end

@implementation NGMFullPrekey

+ (id)fullPrekeyForTestingSignedBy:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 signingKey];
  id v10 = 0;
  v7 = (void *)[v5 initWithPrekeySignedBy:v6 error:&v10];
  id v8 = v10;

  if (v8) {
    +[NGMFullPrekey fullPrekeyForTestingSignedBy:]();
  }

  return v7;
}

- (BOOL)isSEPKey
{
  v2 = [(NGMFullPrekey *)self dhKey];
  BOOL v3 = [v2 keyStore] == 2;

  return v3;
}

+ (id)newCompactPrivateKey
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keychainData
{
  v2 = [(NGMFullPrekey *)self dhKey];
  BOOL v3 = [v2 key];
  id v4 = [v3 keychainData];

  return v4;
}

- (NGMFullPrekey)initWithPrekeySignedBy:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[SecKeyP256Private defaultProtectionClassForPlatform];
  id v8 = +[FullKey generateNewKeyWithAccess:v7 error:a4];

  v9 = [v8 publicKey];
  if (v9)
  {
    id v10 = [[NGMPrekeySignatureFormatter alloc] initToSignKey:v9];
    if (!v10)
    {
      MPLogAndAssignError(151, a4, @"Time is misconfigured on device.");
      v21 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v11 = [v6 signDataWithFormatter:v10 error:a4];
    if (v11)
    {
      v12 = [v6 publicKey];
      char v13 = [v12 verifySignature:v11 formatter:v10];

      if (v13)
      {
        v37.receiver = self;
        v37.super_class = (Class)NGMFullPrekey;
        v14 = [(NGMFullPrekey *)&v37 init];
        v15 = v14;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_dhKey, v8);
          v16 = [NGMECDHPublicPreKey alloc];
          [v10 timestamp];
          uint64_t v17 = -[NGMECDHPublicPreKey initWithPublicKey:signature:timestamp:](v16, "initWithPublicKey:signature:timestamp:", v9, v11);
          publicPrekey = v15->_publicPrekey;
          v15->_publicPrekey = (NGMECDHPublicPreKey *)v17;

          if (MPSecondaryRegistrationDisabled())
          {
            tetraRegistration = v15->_tetraRegistration;
            v15->_tetraRegistration = 0;

            tetraPrivateKey = v15->_tetraPrivateKey;
            v15->_tetraPrivateKey = 0;
          }
          else
          {
            uint64_t v23 = +[Kyber1024ObjC KeyGen];
            v24 = v15->_tetraPrivateKey;
            v15->_tetraPrivateKey = (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)v23;

            v33 = [_TtC17MessageProtection17TetraRegistration alloc];
            tetraPrivateKey = [(Kyber1024ObjCPrivateKey *)v15->_tetraPrivateKey publicKey];
            v36 = [(NGMFullPrekey *)v15 dhKey];
            v35 = [v36 publicKey];
            v34 = [v35 key];
            v25 = [v34 dataRepresentation];
            [v10 timestamp];
            double v27 = v26;
            uint64_t v28 = +[TetraVersions currentTetraVersion];
            v29 = [v6 tetraWrapped];
            uint64_t v30 = [(TetraRegistration *)v33 initWithKyberPublicKey:tetraPrivateKey ecdhPublicKey:v25 timestamp:v28 version:v29 signedBy:v27];
            v31 = v15->_tetraRegistration;
            v15->_tetraRegistration = (_TtC17MessageProtection17TetraRegistration *)v30;
          }
        }
        self = v15;
        v21 = self;
        goto LABEL_18;
      }
      MPLogAndAssignError(201, a4, @"Failure to verify the signature for the freshly generated prekey.");
    }
    else
    {
      v22 = MessageProtectionLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[NGMFullPrekey initWithPrekeySignedBy:error:](a4, v22);
      }
    }
    v21 = 0;
LABEL_18:

    goto LABEL_19;
  }
  MPLogAndAssignError(7, a4, @"Failure to get the public prekey of a new ephemeral.");
  v21 = 0;
LABEL_20:

  return v21;
}

- (NGMFullPrekey)initWithPBPrekey:(id)a3 verifySignedBy:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v57.receiver = self;
  v57.super_class = (Class)NGMFullPrekey;
  id v10 = [(NGMFullPrekey *)&v57 init];
  if (!v10) {
    goto LABEL_11;
  }
  v11 = [DHKey alloc];
  v12 = [v8 dhKey];
  uint64_t v13 = [(FullKey *)v11 initWithProtobufferData:v12 error:a5];
  dhKey = v10->_dhKey;
  v10->_dhKey = (DHKey *)v13;

  v15 = [NGMECDHPublicPreKey alloc];
  v16 = [(DHKey *)v10->_dhKey publicKey];
  uint64_t v17 = [v8 prekeySignature];
  [v8 timestamp];
  uint64_t v18 = -[NGMECDHPublicPreKey initWithPublicKey:signature:timestamp:](v15, "initWithPublicKey:signature:timestamp:", v16, v17);
  publicPrekey = v10->_publicPrekey;
  v10->_publicPrekey = (NGMECDHPublicPreKey *)v18;

  if (!a5 || !*a5)
  {
    if ([v8 hasTetraPrivateKey])
    {
      uint64_t v28 = [_TtC17MessageProtection23Kyber1024ObjCPrivateKey alloc];
      v29 = [v8 tetraPrivateKey];
      id v56 = 0;
      uint64_t v30 = [(Kyber1024ObjCPrivateKey *)v28 initWithProtoBufData:v29 error:&v56];
      id v31 = v56;
      tetraPrivateKey = v10->_tetraPrivateKey;
      v10->_tetraPrivateKey = (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)v30;

      if (v31)
      {
        v33 = NSString;
        v34 = [v31 description];
        v35 = [v33 stringWithFormat:@"Failed to deserialize a prekey containing a Kyber key because of error: %@", v34];
        MPLogAndAssignError(200, a5, v35);
LABEL_10:

        goto LABEL_11;
      }
      v36 = [_TtC17MessageProtection17TetraRegistration alloc];
      uint64_t v37 = [v8 tetraRegistrationData];
      v54 = [(FullKey *)v10->_dhKey key];
      v38 = [v54 publicKey];
      v39 = [v38 dataRepresentation];
      uint64_t v40 = [v8 tetraVersion];
      [v8 timestamp];
      double v42 = v41;
      v43 = [v9 tetraWrapped];
      id v55 = 0;
      v44 = v36;
      v45 = (void *)v37;
      uint64_t v46 = [(TetraRegistration *)v44 initWithTetraRegistrationData:v37 ecdhPublicKey:v39 version:v40 timestamp:v43 signedBy:0 isEncrypting:&v55 error:v42];
      id v31 = v55;
      tetraRegistration = v10->_tetraRegistration;
      v10->_tetraRegistration = (_TtC17MessageProtection17TetraRegistration *)v46;

      if (v31)
      {
        v48 = NSString;
        v34 = [(Kyber1024ObjCPrivateKey *)v10->_tetraPrivateKey publicKey];
        v35 = [v8 prekeySignature];
        [v8 timestamp];
        uint64_t v50 = v49;
        v51 = [v31 description];
        v52 = [v48 stringWithFormat:@"Failed to deserialize a prekey containing a Kyber key: %@ \n signature: %@ \n timestamp: %f \n because of error: %@", v34, v35, v50, v51];
        MPLogAndAssignError(200, a5, v52);

        goto LABEL_10;
      }
    }
LABEL_11:
    double v27 = v10;
    goto LABEL_12;
  }
  v20 = NSString;
  v21 = [(DHKey *)v10->_dhKey publicKey];
  v22 = [v8 prekeySignature];
  [v8 timestamp];
  uint64_t v24 = v23;
  v25 = [*a5 description];
  double v26 = [v20 stringWithFormat:@"Failed to deserialize a prekey containing an ECDH private key: %@ \n signature: %@ \n timestamp: %f \n because of error: %@", v21, v22, v24, v25];
  MPLogAndAssignError(200, a5, v26);

  double v27 = 0;
LABEL_12:

  return v27;
}

- (id)pbDevicePrekey
{
  BOOL v3 = objc_alloc_init(NGMPBDevicePreKey);
  id v4 = [(NGMFullPrekey *)self publicPrekey];
  [v4 timestamp];
  -[NGMPBDevicePreKey setTimestamp:](v3, "setTimestamp:");

  id v5 = [(NGMFullPrekey *)self dhKey];
  id v6 = [v5 protobuffer];
  [(NGMPBDevicePreKey *)v3 setDhKey:v6];

  v7 = [(NGMFullPrekey *)self publicPrekey];
  id v8 = [v7 signature];
  [(NGMPBDevicePreKey *)v3 setPrekeySignature:v8];

  id v9 = [(NGMFullPrekey *)self tetraPrivateKey];

  id v10 = MessageProtectionLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11) {
      -[NGMFullPrekey pbDevicePrekey](v10);
    }

    v12 = [(NGMFullPrekey *)self tetraPrivateKey];
    uint64_t v13 = [v12 protobufData];
    [(NGMPBDevicePreKey *)v3 setTetraPrivateKey:v13];

    v14 = [(NGMFullPrekey *)self tetraRegistration];
    v15 = [v14 registrationData];
    [(NGMPBDevicePreKey *)v3 setTetraRegistrationData:v15];

    id v10 = [(NGMFullPrekey *)self tetraRegistration];
    [(NGMPBDevicePreKey *)v3 setTetraVersion:[v10 tetraVersion]];
  }
  else if (v11)
  {
    -[NGMFullPrekey pbDevicePrekey](v10);
  }

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(NGMFullPrekey *)self dhKey];
  id v5 = [v4 description];
  id v6 = [(NGMFullPrekey *)self publicPrekey];
  v7 = [v6 description];
  id v8 = [v3 stringWithFormat:@"NGMFullPrekey with DHKey: %@\n Public Prekey: %@.", v5, v7];

  return v8;
}

- (BOOL)delete
{
  BOOL v3 = +[NGMReplayManager sharedManager];
  char v4 = [v3 deleteReceivingCountersForKey:self];

  if ((v4 & 1) == 0)
  {
    id v5 = MessageProtectionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(NGMFullPrekey *)self delete];
    }
  }
  return v4;
}

- (_TtC17MessageProtection17TetraRegistration)tetraRegistration
{
  return self->_tetraRegistration;
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)tetraPrivateKey
{
  return self->_tetraPrivateKey;
}

- (DHKey)dhKey
{
  return self->_dhKey;
}

- (NGMECDHPublicPreKey)publicPrekey
{
  return self->_publicPrekey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicPrekey, 0);
  objc_storeStrong((id *)&self->_dhKey, 0);
  objc_storeStrong((id *)&self->_tetraPrivateKey, 0);
  objc_storeStrong((id *)&self->_tetraRegistration, 0);
}

+ (void)fullPrekeyForTestingSignedBy:.cold.1()
{
  __assert_rtn("+[NGMFullPrekey fullPrekeyForTestingSignedBy:]", "NGMFullPrekey.m", 63, "error == nil");
}

- (void)initWithPrekeySignedBy:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [*a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_2163F2000, a2, OS_LOG_TYPE_ERROR, "Failed to sign a new prekey with error: %@", (uint8_t *)&v4, 0xCu);
}

- (void)pbDevicePrekey
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2163F2000, log, OS_LOG_TYPE_DEBUG, "Serializing prekey with Tetra key.", v1, 2u);
}

- (void)delete
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 dhKey];
  int v4 = [v3 description];
  id v5 = [0 description];
  int v6 = 138412546;
  v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_2163F2000, a2, OS_LOG_TYPE_ERROR, "Failed to delete prekey ephemeral key (%@) with error: %@", (uint8_t *)&v6, 0x16u);
}

@end