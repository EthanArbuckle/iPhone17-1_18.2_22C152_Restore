@interface PDAppAttestService
- (PDAppAttestService)init;
- (__SecKey)_createNewKey;
- (id)_attestedCredentialDataWithPublicKey:(id)a3;
- (id)_authenticatorDataWithPublicKey:(id)a3;
- (id)_generateCborRepresentationOfCertificats:(id)a3 authenticationData:(id)a4;
- (id)_publicKeyFromKey:(__SecKey *)a3;
- (void)attestChallenge:(id)a3 completion:(id)a4;
@end

@implementation PDAppAttestService

- (PDAppAttestService)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAppAttestService;
  return [(PDAppAttestService *)&v3 init];
}

- (void)attestChallenge:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 length] < 0x21
    && (AppAttest_WebAuthentication_IsSupported() & 1) != 0
    && (v8 = [(PDAppAttestService *)self _createNewKey]) != 0)
  {
    v9 = v8;
    v10 = [(PDAppAttestService *)self _publicKeyFromKey:v8];
    if (v10)
    {
      v11 = [(PDAppAttestService *)self _authenticatorDataWithPublicKey:v10];
      id v13 = v7;
      id v12 = v11;
      AppAttest_WebAuthentication_AttestKey();
    }
    else
    {
      CFRelease(v9);
      PDBasicError();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v12);
    }
  }
  else
  {
    v10 = PDBasicError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (__SecKey)_createNewKey
{
  CFErrorRef error = 0;
  SecAccessControlRef v2 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0x40000000uLL, &error);
  if (v2)
  {
    SecAccessControlRef v3 = v2;
    v15[0] = kSecAttrKeyClass;
    v15[1] = kSecAttrAccessControl;
    v16[0] = kSecAttrKeyClassPrivate;
    v16[1] = v2;
    v15[2] = kSecAttrIsPermanent;
    v15[3] = kSecAttrLabel;
    v16[2] = kCFBooleanFalse;
    v16[3] = @"com.apple.wallet.default.contact";
    v4 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
    v13[0] = kSecAttrTokenID;
    v13[1] = kSecAttrKeyType;
    v14[0] = kSecAttrTokenIDSecureEnclave;
    v14[1] = kSecAttrKeyTypeECSECPrimeRandom;
    v13[2] = kSecAttrKeySizeInBits;
    v13[3] = kSecPrivateKeyAttrs;
    v14[2] = &off_10078B850;
    v14[3] = v4;
    CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
    SecKeyRef v6 = SecKeyCreateRandomKey(v5, &error);
    SecKeyRef v7 = v6;
    CFErrorRef v8 = error;
    if (error || !v6)
    {
      v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PDAppAttestService: Error failed to create ephemeral private key %@", buf, 0xCu);
      }
      if (v7)
      {
        CFRelease(v7);
        SecKeyRef v7 = 0;
      }
    }
    CFRelease(v3);
  }
  else
  {
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFErrorRef v10 = error;
      *(_DWORD *)buf = 138412290;
      CFErrorRef v18 = error;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PDAppAttestService: Error failed to create access control %@", buf, 0xCu);
    }
    SecKeyRef v7 = 0;
  }

  return v7;
}

- (id)_publicKeyFromKey:(__SecKey *)a3
{
  if (a3)
  {
    SecAccessControlRef v3 = SecKeyCopyPublicKey(a3);
    CFErrorRef error = 0;
    CFDataRef v4 = SecKeyCopyExternalRepresentation(v3, &error);
    CFErrorRef v5 = error;
    if (error)
    {
      SecKeyRef v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDAppAttestService: Error failed to get public key %@", buf, 0xCu);
      }
    }
    CFRelease(v3);
  }
  else
  {
    CFDataRef v4 = 0;
  }
  return v4;
}

- (id)_authenticatorDataWithPublicKey:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableData);
  SecKeyRef v6 = [@"com.apple.wallet" dataUsingEncoding:4];
  SecKeyRef v7 = [v6 SHA256Hash];

  [v5 appendData:v7];
  char v12 = 69;
  [v5 appendBytes:&v12 length:1];
  int v11 = 0;
  [v5 appendBytes:&v11 length:4];
  CFErrorRef v8 = [(PDAppAttestService *)self _attestedCredentialDataWithPublicKey:v4];

  [v5 appendData:v8];
  id v9 = [v5 copy];

  return v9;
}

- (id)_attestedCredentialDataWithPublicKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableData);
  id v5 = objc_msgSend(@"00000000000000000000000000000000", "pk_decodeHexadecimal");
  [v4 appendData:v5];

  SecKeyRef v6 = [v3 SHA256Hash];
  __int16 v13 = bswap32([v6 length]) >> 16;
  [v4 appendBytes:&v13 length:2];
  [v4 appendData:v6];
  SecKeyRef v7 = objc_msgSend(v3, "subdataWithRange:", 1, 32);
  CFErrorRef v8 = objc_msgSend(v3, "subdataWithRange:", 33, 32);

  id v9 = 0;
  if (v7 && v8)
  {
    id v10 = [objc_alloc((Class)COSEKey) initEC2WithAlgorithm:-7 curveIdentifier:1 x:v7 y:v8 d:0 keyOperations:0 keyIdentifier:0];
    int v11 = +[NSData dataWithCOSEKey:v10];
    [v4 appendData:v11];

    id v9 = [v4 copy];
  }

  return v9;
}

- (id)_generateCborRepresentationOfCertificats:(id)a3 authenticationData:(id)a4
{
  id v5 = a3;
  id v26 = a4;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = +[CBOR cborWithData:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v9);
  }

  v24 = +[CBOR cborWithArray:v6];
  v22 = +[CBOR cborWithUTF8String:@"x5c"];
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  v25 = +[CBOR cborWithUTF8String:@"fmt"];
  v23 = +[CBOR cborWithUTF8String:@"apple"];
  [v13 setObject:v23 forKeyedSubscript:v25];
  v14 = +[CBOR cborWithUTF8String:@"attStmt"];
  v31 = v22;
  v32 = v24;
  v15 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v16 = +[CBOR cborWithDictionary:v15];

  [v13 setObject:v16 forKeyedSubscript:v14];
  v17 = +[CBOR cborWithUTF8String:@"authData"];
  CFErrorRef v18 = +[CBOR cborWithData:v26];
  [v13 setObject:v18 forKeyedSubscript:v17];
  v19 = +[CBOR cborWithDictionary:v13];
  v20 = +[NSData dataWithCBOR:v19];

  return v20;
}

@end