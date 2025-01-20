@interface MACollectionInterface
+ (id)copyIngestURL;
- (BOOL)collectionLibraryLoaded;
- (BOOL)processSUInfo:(id)a3 withError:(id *)a4;
- (DataArk)dark;
- (MACollectionInterface)initWithContext:(id)a3;
- (__SecKey)signingKey;
- (id)collectPCRT:(id *)a3;
- (id)collectSIK:(id *)a3;
- (id)collectSigningAttestation:(id *)a3;
- (id)copyIngestData:(id *)a3;
- (id)copyIngestHeaders:(id)a3 withError:(id *)a4;
- (id)signatureForData:(id)a3 error:(id *)a4;
- (id)signingKeyPublicKeyWithError:(id *)a3;
- (void)dealloc;
- (void)setCollectionLibraryLoaded:(BOOL)a3;
@end

@implementation MACollectionInterface

- (MACollectionInterface)initWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MACollectionInterface;
  v4 = [(MACollectionInterface *)&v7 init];
  v5 = v4;
  if (!v4)
  {
LABEL_5:
    a3 = v5;
    goto LABEL_6;
  }
  if (a3)
  {
    v4->_dark = (DataArk *)a3;
    if (libInFieldCollectionLibraryCore()) {
      v5->_collectionLibraryLoaded = 1;
    }
    goto LABEL_5;
  }
LABEL_6:

  return (MACollectionInterface *)a3;
}

- (void)dealloc
{
  signingKey = self->_signingKey;
  if (signingKey) {
    CFRelease(signingKey);
  }
  self->_signingKey = 0;
  v4.receiver = self;
  v4.super_class = (Class)MACollectionInterface;
  [(MACollectionInterface *)&v4 dealloc];
}

+ (id)copyIngestURL
{
  v2 = @"https://tbsc.apple.com/ingest/register";
  if (is_internal_build())
  {
    id v3 = objc_alloc((Class)NSUserDefaults);
    id v4 = [v3 persistentDomainForName:@"com.apple.mobileactivationd"];

    id v5 = [v4 objectForKeyedSubscript:@"InFieldCollectionOverrideURL"];
    id v6 = isNSString(v5);

    if (v6)
    {
      objc_super v7 = (__CFString *)[v4 objectForKeyedSubscript:@"InFieldCollectionOverrideURL"];

      v2 = v7;
    }
  }
  else
  {
    id v4 = 0;
  }
  v8 = +[NSURL URLWithString:v2];

  return v8;
}

- (__SecKey)signingKey
{
  id v3 = (id)kSecAttrKeyTypeECSECPrimeRandom;
  CFErrorRef error = 0;
  if (self->_signingKey)
  {
    id v4 = 0;
    id v5 = 0;
  }
  else
  {
    id v6 = +[GestaltHlpr getSharedInstance];
    id v4 = [v6 copyAnswer:@"HasPKA"];

    id v5 = (NSDictionary *)isNSNumber(v4);
    if (v5)
    {
      if ([v4 BOOLValue])
      {
        objc_super v7 = (__CFString *)kSecAttrKeyTypeECSECPrimeRandomPKA;

        id v3 = v7;
      }
      SecAccessControlRef v8 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
      if (v8)
      {
        SecAccessControlRef v9 = v8;
        v14[0] = kSecAttrIsPermanent;
        v14[1] = kSecAttrTokenID;
        v15[0] = &__kCFBooleanFalse;
        v15[1] = kSecAttrTokenIDAppleKeyStore;
        v14[2] = kSecAttrKeyType;
        v14[3] = kSecAttrAccessControl;
        v15[2] = v3;
        v15[3] = v8;
        id v5 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
        v10 = SecKeyCreateRandomKey((CFDictionaryRef)v5, &error);
        self->_signingKey = v10;
        if (!v10) {
          maLog((uint64_t)"-[MACollectionInterface signingKey]", 0, @"Failed to create ref key: %@", error);
        }
        CFRelease(v9);
      }
      else
      {
        maLog((uint64_t)"-[MACollectionInterface signingKey]", 0, @"Failed to create access control: %@", error);
        id v5 = 0;
      }
    }
    else
    {
      maLog((uint64_t)"-[MACollectionInterface signingKey]", 0, @"Failed to retrieve PKA state.");
    }
    if (error) {
      CFRelease(error);
    }
  }
  signingKey = self->_signingKey;

  return signingKey;
}

- (id)collectSigningAttestation:(id *)a3
{
  if ([(MACollectionInterface *)self signingKey])
  {
    id v10 = 0;
    id v5 = security_create_system_key_attestation((uint64_t)[(MACollectionInterface *)self signingKey], 0, 0, &v10);
    id v6 = (NSError *)v10;
    if (v5)
    {
      id v7 = v5;
      goto LABEL_8;
    }
    SecAccessControlRef v8 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSigningAttestation:]", 160, @"com.apple.MobileActivation.ErrorDomain", -11, v6, @"Failed to attest RK to SIK.");

    id v6 = v8;
    if (!a3) {
      goto LABEL_7;
    }
LABEL_5:
    id v6 = v6;
    id v7 = 0;
    *a3 = v6;
    goto LABEL_8;
  }
  id v6 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSigningAttestation:]", 154, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input");
  if (a3) {
    goto LABEL_5;
  }
LABEL_7:
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)collectSIK:(id *)a3
{
  uint64_t v23 = 0;
  v24 = 0;
  uint64_t v21 = 0;
  v22 = 0;
  id v4 = +[GestaltHlpr getSharedInstance];
  id v5 = [v4 copyAnswer:@"HasPKA"];

  id v6 = isNSNumber(v5);
  if (!v6)
  {
    SecAccessControlRef v9 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSIK:]", 190, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve PKA state.");
    id v8 = 0;
    id v13 = 0;
    goto LABEL_16;
  }
  if ([v5 BOOLValue])
  {
    id v7 = 0;
    id v8 = 0;
    SecAccessControlRef v9 = 0;
  }
  else
  {
    id v20 = 0;
    id v8 = copyPersonalizedFirmwareData(2, (NSError **)&v20);
    SecAccessControlRef v9 = (NSError *)v20;
    if (!v8)
    {
      v11 = @"Failed to load boot manifest.";
      uint64_t v12 = 197;
      v15 = v9;
      goto LABEL_14;
    }
    id v8 = v8;
    uint64_t v14 = aks_sik_optional_params(0, 0, (uint64_t)[v8 bytes], (uint64_t)[v8 length], &v24, &v23);
    if (v14)
    {
      uint64_t v19 = v14;
      v11 = @"Failed to decode SIK data: 0x%08x";
      uint64_t v12 = 203;
      goto LABEL_10;
    }
    id v7 = v24;
  }
  uint64_t v10 = aks_sik_collection((uint64_t)v7);
  if (v10)
  {
    uint64_t v19 = v10;
    v11 = @"Failed to perform SIK collection: 0x%08x";
    uint64_t v12 = 210;
LABEL_10:
    v15 = 0;
LABEL_14:
    v17 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSIK:]", v12, @"com.apple.MobileActivation.ErrorDomain", -1, v15, v11, v19);

    id v13 = 0;
    goto LABEL_15;
  }
  id v16 = objc_alloc((Class)NSData);
  id v13 = [v16 initWithBytesNoCopy:v22 length:v21];
  if (v13)
  {
    v22 = 0;
    goto LABEL_16;
  }
  v17 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSIK:]", 216, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to convert data.");

LABEL_15:
  SecAccessControlRef v9 = v17;
LABEL_16:
  if (v24) {
    free(v24);
  }
  v24 = 0;
  if (v22) {
    free(v22);
  }
  v22 = 0;
  if (a3 && !v13) {
    *a3 = v9;
  }

  return v13;
}

- (id)collectPCRT:(id *)a3
{
  uint64_t v19 = 0;
  unsigned int v18 = 0;
  if ([(MACollectionInterface *)self collectionLibraryLoaded])
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    id v4 = (uint64_t (*)(uint64_t *, unsigned int *))getvsPHbdGfSymbolLoc_ptr;
    v28 = getvsPHbdGfSymbolLoc_ptr;
    if (!getvsPHbdGfSymbolLoc_ptr)
    {
      id v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3254779904;
      v22 = __getvsPHbdGfSymbolLoc_block_invoke;
      uint64_t v23 = &__block_descriptor_40_e8_32r_e5_v8__0l;
      v24 = &v25;
      id v5 = (void *)libInFieldCollectionLibrary();
      v26[3] = (uint64_t)dlsym(v5, "vsPHbdGf");
      getvsPHbdGfSymbolLoc_ptr = *(_UNKNOWN **)(v24[1] + 24);
      id v4 = (uint64_t (*)(uint64_t *, unsigned int *))v26[3];
    }
    _Block_object_dispose(&v25, 8);
    if (!v4) {
      -[MACollectionInterface collectPCRT:]();
    }
    int v6 = v4(&v19, &v18);
    if (v6)
    {
      MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface collectPCRT:]", 249, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to collect PCRT: %ld", v6);
    }
    else
    {
      id v11 = objc_alloc((Class)NSData);
      id v12 = [v11 initWithBytes:v19 length:v18];
      if (v12)
      {
        uint64_t v10 = v12;
        SecAccessControlRef v9 = 0;
        goto LABEL_13;
      }
      MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface collectPCRT:]", 255, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to convert data.");
    }
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface collectPCRT:]", 243, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Collection library not loaded.");
  }
  id v8 = MobileActivationError;
  SecAccessControlRef v9 = v8;
  if (a3)
  {
    SecAccessControlRef v9 = v8;
    uint64_t v10 = 0;
    *a3 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_13:
  uint64_t v13 = v19;
  if (v19)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v14 = (void (*)(uint64_t))getZshgJnRaSlwnSymbolLoc_ptr;
    v28 = getZshgJnRaSlwnSymbolLoc_ptr;
    if (!getZshgJnRaSlwnSymbolLoc_ptr)
    {
      id v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3254779904;
      v22 = __getZshgJnRaSlwnSymbolLoc_block_invoke;
      uint64_t v23 = &__block_descriptor_40_e8_32r_e5_v8__0l;
      v24 = &v25;
      v15 = (void *)libInFieldCollectionLibrary();
      id v16 = dlsym(v15, "ZshgJnRaSlwn");
      *(void *)(v24[1] + 24) = v16;
      getZshgJnRaSlwnSymbolLoc_ptr = *(_UNKNOWN **)(v24[1] + 24);
      uint64_t v14 = (void (*)(uint64_t))v26[3];
    }
    _Block_object_dispose(&v25, 8);
    if (!v14) {
      -[MACollectionInterface collectPCRT:]();
    }
    v14(v13);
  }

  return v10;
}

- (id)signingKeyPublicKeyWithError:(id *)a3
{
  CFErrorRef error = 0;
  id v4 = SecKeyCopyPublicKey([(MACollectionInterface *)self signingKey]);
  id v5 = v4;
  if (v4)
  {
    CFDataRef v6 = SecKeyCopyExternalRepresentation(v4, &error);
    if (v6)
    {
      CFDataRef v7 = v6;
      id v8 = 0;
      goto LABEL_9;
    }
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface signingKeyPublicKeyWithError:]", 288, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to RK public key as data.");
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface signingKeyPublicKeyWithError:]", 282, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy RK public key.");
  }
  uint64_t v10 = MobileActivationError;
  id v8 = v10;
  if (a3)
  {
    id v8 = v10;
    CFDataRef v7 = 0;
    *a3 = v8;
  }
  else
  {
    CFDataRef v7 = 0;
  }
LABEL_9:
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (v5) {
    CFRelease(v5);
  }

  return v7;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  CFErrorRef error = 0;
  CFDataRef v6 = (const __CFData *)a3;
  CFDataRef v7 = SecKeyCreateSignature([(MACollectionInterface *)self signingKey], kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v6, &error);

  if (v7)
  {
    CFDataRef v8 = v7;
    SecAccessControlRef v9 = 0;
  }
  else
  {
    SecAccessControlRef v9 = createMobileActivationError((uint64_t)"-[MACollectionInterface signatureForData:error:]", 317, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to sign activation data with ref key.");
  }
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (a4 && !v7) {
    *a4 = v9;
  }

  return v7;
}

- (id)copyIngestHeaders:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if ([(MACollectionInterface *)self collectionLibraryLoaded])
  {
    id v21 = 0;
    id v7 = [(MACollectionInterface *)self signatureForData:v6 error:&v21];
    id v8 = v21;
    SecAccessControlRef v9 = v8;
    if (v7)
    {
      id v20 = v8;
      id v10 = [(MACollectionInterface *)self signingKeyPublicKeyWithError:&v20];
      id v11 = (NSError *)v20;

      if (v10)
      {
        id v12 = [v7 base64EncodedStringWithOptions:0];
        id v13 = [v10 base64EncodedStringWithOptions:0];
        uint64_t v14 = v13;
        if (v12 && v13)
        {
          v22[0] = @"X-Apple-Signature";
          v22[1] = @"X-Apple-Sig-Key";
          v23[0] = v12;
          v23[1] = v13;
          v22[2] = @"Content-Type";
          v22[3] = @"User-Agent";
          v23[2] = @"application/octet-stream";
          v23[3] = @"iOS Device Activator (MobileActivation-1015.60.1)";
          v22[4] = @"X-Apple-AL-ID";
          v15 = +[NSUUID UUID];
          id v16 = [(NSUUID *)v15 UUIDString];
          v23[4] = v16;
          v17 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];

          if (!a4) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
        unsigned int v18 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]", 368, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to encode data as string.");
      }
      else
      {
        unsigned int v18 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]", 358, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy signing key public key: %@", v11);

        id v12 = 0;
        uint64_t v14 = 0;
      }
      v17 = 0;
      id v11 = v18;
      if (!a4) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
    id v11 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]", 352, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create signature for data: %@", v8);

    id v12 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    id v11 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]", 344, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Collection library not loaded.");
    id v12 = 0;
    uint64_t v14 = 0;
    id v7 = 0;
  }
  id v10 = 0;
  v17 = 0;
  if (!a4) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v17) {
    *a4 = v11;
  }
LABEL_17:

  return v17;
}

- (id)copyIngestData:(id *)a3
{
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__1;
  v74[4] = __Block_byref_object_dispose__1;
  id v75 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__1;
  v72 = __Block_byref_object_dispose__1;
  id v73 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__1;
  v66[4] = __Block_byref_object_dispose__1;
  id v67 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__1;
  v64 = __Block_byref_object_dispose__1;
  id v65 = 0;
  if (copyIngestData__onceToken != -1) {
    dispatch_once(&copyIngestData__onceToken, &__block_literal_global_1);
  }
  if (!copyIngestData__queue)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 419, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create queue.");
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v49 = 0;
    id v47 = 0;
LABEL_26:
    id v48 = 0;
LABEL_27:
    id v46 = 0;
    goto LABEL_28;
  }
  if (!is_product_cellular())
  {
    id v47 = 0;
    id v48 = 0;
    goto LABEL_13;
  }
  id v4 = +[GestaltHlpr getSharedInstance];
  id v47 = [v4 copyAnswer:@"InternationalMobileEquipmentIdentity"];

  id v5 = isNSString(v47);
  LODWORD(v4) = v5 == 0;

  if (v4)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 428, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve IMEI.");
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v49 = 0;
    goto LABEL_26;
  }
  id v6 = +[GestaltHlpr getSharedInstance];
  id v48 = [v6 copyAnswer:@"xRyzf9zFE/ycr/wJPweZvQ"];

  if (v48)
  {
    id v7 = isNSString(v48);
    BOOL v8 = v7 == 0;

    if (v8)
    {
      id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 434, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid IMEI2.");
      id v13 = 0;
      id v14 = 0;
      id v15 = 0;
      id v49 = 0;
      goto LABEL_27;
    }
  }
  id v9 = +[GestaltHlpr getSharedInstance];
  id v46 = [v9 copyAnswer:@"MobileEquipmentIdentifier"];

  if (!v46)
  {
LABEL_13:
    id v46 = 0;
    goto LABEL_14;
  }
  id v10 = isNSString(v46);
  BOOL v11 = v10 == 0;

  if (v11)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 442, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid MEID.");
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v49 = 0;
LABEL_28:
    id v19 = 0;
LABEL_29:
    id v22 = 0;
LABEL_30:
    id v27 = 0;
LABEL_31:
    id v30 = 0;
LABEL_32:
    v33 = 0;
    v34 = 0;
LABEL_33:
    v35 = (void *)v61[5];
    v61[5] = (uint64_t)v12;

LABEL_34:
    v36 = 0;
    if (a3) {
      *a3 = (id) v61[5];
    }
    goto LABEL_36;
  }
LABEL_14:
  id v16 = +[GestaltHlpr getSharedInstance];
  id v49 = [v16 copyAnswer:@"SerialNumber"];

  id v17 = isNSString(v49);
  LODWORD(v16) = v17 == 0;

  if (v16)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 449, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve serial number.");
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    goto LABEL_28;
  }
  id v18 = +[GestaltHlpr getSharedInstance];
  id v19 = [v18 copyAnswer:@"ProductType"];

  id v20 = isNSString(v19);
  LODWORD(v18) = v20 == 0;

  if (v18)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 455, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve product type.");
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    goto LABEL_29;
  }
  id v21 = +[GestaltHlpr getSharedInstance];
  id v22 = [v21 copyAnswer:@"ProductVersion"];

  id v23 = isNSString(v22);
  LODWORD(v21) = v23 == 0;

  if (v21)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 461, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve product version.");
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    goto LABEL_30;
  }
  id v24 = +[GestaltHlpr getSharedInstance];
  id v15 = [v24 copyAnswer:@"UniqueDeviceID"];

  id v25 = isNSString(v15);
  LODWORD(v24) = v25 == 0;

  if (v24)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 467, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve UDID.");
    id v13 = 0;
    id v14 = 0;
    goto LABEL_30;
  }
  id v26 = +[GestaltHlpr getSharedInstance];
  id v27 = [v26 copyAnswer:@"BuildVersion"];

  id v28 = isNSString(v27);
  LODWORD(v26) = v28 == 0;

  if (v26)
  {
    v38 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 473, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve OS build.");
LABEL_43:
    id v12 = v38;
    id v13 = 0;
LABEL_44:
    id v14 = 0;
    goto LABEL_31;
  }
  v29 = (id *)(v61 + 5);
  id obj = (id)v61[5];
  id v13 = [(MACollectionInterface *)self collectSIK:&obj];
  objc_storeStrong(v29, obj);
  if (!v13)
  {
    v38 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 481, @"com.apple.MobileActivation.ErrorDomain", -1, (void *)v61[5], @"Failed to collect SIK.");
    goto LABEL_43;
  }
  id v30 = [v13 base64EncodedStringWithOptions:0];
  if (!v30)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 487, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to encode data as string.");
    goto LABEL_44;
  }
  if (![(MACollectionInterface *)self collectionLibraryLoaded])
  {
    v39 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 492, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to load collection library (verify this is a UI build).");
LABEL_47:
    id v12 = v39;
    id v14 = 0;
    goto LABEL_32;
  }
  v31 = copyIngestData__queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __40__MACollectionInterface_copyIngestData___block_invoke_2;
  block[3] = &__block_descriptor_80_e8_32s40s48r56r64r72r_e5_v8__0l;
  v55 = &v68;
  block[4] = self;
  v56 = v66;
  id v27 = v27;
  id v54 = v27;
  v57 = v74;
  v58 = &v60;
  dispatch_sync(v31, block);

  v32 = (id *)(v61 + 5);
  if (v61[5])
  {
    id v14 = 0;
    v33 = 0;
    v34 = 0;
    goto LABEL_34;
  }
  id v52 = 0;
  id v14 = [(MACollectionInterface *)self collectSigningAttestation:&v52];
  objc_storeStrong(v32, v52);
  if (!v14)
  {
    v39 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 528, @"com.apple.MobileActivation.ErrorDomain", -1, (void *)v61[5], @"Failed to collect signing key attestation.");
    goto LABEL_47;
  }
  id v40 = [v14 base64EncodedStringWithOptions:0];
  v33 = v40;
  if (!v40)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 534, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to encode data as string.");
    goto LABEL_32;
  }
  if ((unint64_t)[v40 length] > 0xFA0)
  {
    v41 = [(MACollectionInterface *)self dark];
    [v33 length];
    writeSplunkLog(v41, 14, -1, (uint64_t)"-[MACollectionInterface copyIngestData:]", 539, 0, @"%@ is too long: %ld > 4000", v42, @"scrt-part2");
  }
  v76[0] = @"scrt-part1";
  v76[1] = @"scrt-part2";
  v77[0] = v30;
  v77[1] = v33;
  v76[2] = @"serial-number";
  v76[3] = @"productType";
  v77[2] = v49;
  v77[3] = v19;
  v76[4] = @"os-version";
  v76[5] = @"udid";
  v77[4] = v22;
  v77[5] = v15;
  v76[6] = @"os-build";
  v77[6] = v27;
  v43 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:7];
  v34 = +[NSMutableDictionary dictionaryWithDictionary:v43];

  if (v47) {
    [(NSMutableDictionary *)v34 setObject:v47 forKeyedSubscript:@"imei"];
  }
  if (v48) {
    [(NSMutableDictionary *)v34 setObject:v48 forKeyedSubscript:@"ime2"];
  }
  if (v46) {
    [(NSMutableDictionary *)v34 setObject:v46 forKeyedSubscript:@"meid"];
  }
  uint64_t v44 = v69[5];
  if (v44) {
    [(NSMutableDictionary *)v34 setObject:v44 forKeyedSubscript:@"pcrt"];
  }
  location = (id *)(v61 + 5);
  id v51 = (id)v61[5];
  v36 = +[NSJSONSerialization dataWithJSONObject:v34 options:0 error:&v51];
  objc_storeStrong(location, v51);
  if (!v36)
  {
    id v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 572, @"com.apple.MobileActivation.ErrorDomain", -1, (void *)v61[5], @"Failed to convert dictionary to JSON data.");
    goto LABEL_33;
  }
LABEL_36:
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(v74, 8);
  return v36;
}

void __40__MACollectionInterface_copyIngestData___block_invoke(id a1)
{
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.mobileactivationd.collection", v1);
  id v3 = (void *)copyIngestData__queue;
  copyIngestData__queue = (uint64_t)v2;
}

void __40__MACollectionInterface_copyIngestData___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dark];
  id v3 = data_ark_copy(v2, 0, @"PCRTCollectionString");
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) dark];
  id v7 = data_ark_copy(v6, 0, @"PCRTCollectionStringBuild");
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = isNSString(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  if (!v10)
  {
LABEL_6:
    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v16 + 40);
    id v17 = [v15 collectPCRT:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    id v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v20)
    {
      id v21 = [v20 base64EncodedStringWithOptions:0];
      uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        id v24 = [*(id *)(a1 + 32) dark];
        data_ark_set(v24, 0, @"PCRTCollectionString", *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 1);

        id v25 = [*(id *)(a1 + 32) dark];
        data_ark_set(v25, 0, @"PCRTCollectionStringBuild", *(void **)(a1 + 40), 1);
LABEL_12:

        return;
      }
      MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]_block_invoke_2", 510, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to encode data as string.");
    }
    else
    {
      MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]_block_invoke_2", 504, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), @"Failed to collect PCRT.");
    }
    id v27 = MobileActivationError;
    uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
    id v25 = *(id *)(v28 + 40);
    *(void *)(v28 + 40) = v27;
    goto LABEL_12;
  }
  BOOL v11 = v10;
  id v12 = isNSString(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if (!v12)
  {

    goto LABEL_6;
  }
  id v13 = v12;
  unsigned __int8 v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];

  if ((v14 & 1) == 0) {
    goto LABEL_6;
  }
}

- (BOOL)processSUInfo:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if ([(MACollectionInterface *)self collectionLibraryLoaded])
  {
    id v7 = v6;
    uint64_t v8 = NAAB((uint64_t)[v7 bytes], (int)[v7 length]);
    if (!v8)
    {
      id v10 = 0;
      BOOL v11 = 1;
      goto LABEL_9;
    }
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface processSUInfo:withError:]", 600, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to process SUInfo: %d", v8);
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface processSUInfo:withError:]", 592, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Collection library not loaded.");
  }
  id v10 = MobileActivationError;
  if (a4)
  {
    id v10 = v10;
    BOOL v11 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_9:

  return v11;
}

- (BOOL)collectionLibraryLoaded
{
  return self->_collectionLibraryLoaded;
}

- (void)setCollectionLibraryLoaded:(BOOL)a3
{
  self->_collectionLibraryLoaded = a3;
}

- (DataArk)dark
{
  return self->_dark;
}

- (void)collectPCRT:.cold.1()
{
  v0 = +[NSAssertionHandler currentHandler];
  v1 = +[NSString stringWithUTF8String:"OSStatus gCollectInFieldManifest(UInt8 **, UInt32 *)"];
  [(NSAssertionHandler *)v0 handleFailureInFunction:v1, @"MACollectionInterface.m", 43, @"%s", dlerror() file lineNumber description];

  __break(1u);
}

- (void)collectPCRT:.cold.2()
{
  v0 = +[NSAssertionHandler currentHandler];
  v1 = +[NSString stringWithUTF8String:"void gFreeInFieldManifest(UInt8 *)"];
  [(NSAssertionHandler *)v0 handleFailureInFunction:v1, @"MACollectionInterface.m", 44, @"%s", dlerror() file lineNumber description];

  __break(1u);
}

@end