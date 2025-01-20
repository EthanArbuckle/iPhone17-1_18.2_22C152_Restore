@interface RMSecurityUtilities
+ (BOOL)checkValidAfterWithCertificate:(__SecCertificate *)a3 interval:(double)a4;
+ (__SecKey)_deserializePrivateKey:(id)a3 privateKeyIsExportable:(BOOL)a4;
+ (id)_serializeIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 privateKeyIsExportable:(BOOL)a5 error:(id *)a6;
+ (id)_serializePrivateKey:(__SecKey *)a3 privateKeyIsExportable:(BOOL)a4;
+ (id)deserializeCertificateChain:(id)a3;
+ (id)serializeBAAIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 error:(id *)a5;
+ (id)serializeCertificateChain:(id)a3;
+ (id)serializeIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 error:(id *)a5;
+ (void)_deserializeIdentity:(id)a3 privateKeyIsExportable:(BOOL)a4 completionHandler:(id)a5;
+ (void)deserializeBAAIdentity:(id)a3 completionHandler:(id)a4;
+ (void)deserializeIdentity:(id)a3 completionHandler:(id)a4;
+ (void)generateSelfSignedCertificateAndPrivateKeyWithID:(id)a3 completionHandler:(id)a4;
@end

@implementation RMSecurityUtilities

+ (id)serializeIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 error:(id *)a5
{
  return [a1 _serializeIdentityWithPrivateKey:a3 certificateChain:a4 privateKeyIsExportable:1 error:a5];
}

+ (id)serializeBAAIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 error:(id *)a5
{
  return [a1 _serializeIdentityWithPrivateKey:a3 certificateChain:a4 privateKeyIsExportable:0 error:a5];
}

+ (id)_serializeIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 privateKeyIsExportable:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  uint64_t v11 = [a1 _serializePrivateKey:a3 privateKeyIsExportable:v7];
  v12 = (void *)v11;
  if (v11)
  {
    v17[0] = @"PrivateKey";
    v17[1] = @"Certificates";
    v18[0] = v11;
    v13 = [a1 serializeCertificateChain:v10];
    v18[1] = v13;
    a6 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else if (a6)
  {
    v14 = +[RMErrorUtilities createInternalError];
    v15 = v14;
    if (v14) {
      *a6 = v14;
    }

    a6 = 0;
  }

  return a6;
}

+ (void)deserializeIdentity:(id)a3 completionHandler:(id)a4
{
}

+ (void)deserializeBAAIdentity:(id)a3 completionHandler:(id)a4
{
}

+ (void)_deserializeIdentity:(id)a3 privateKeyIsExportable:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 objectForKeyedSubscript:@"PrivateKey"];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v15 = +[RMLog securityUtilities];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v13 = +[RMErrorUtilities createInternalError];
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v13);
      goto LABEL_11;
    }
LABEL_9:
    sub_100061198();
    goto LABEL_10;
  }
  id v11 = [a1 _deserializePrivateKey:v10 privateKeyIsExportable:v6];
  if (!v11)
  {
    v15 = +[RMLog securityUtilities];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v12 = v11;
  v13 = [v8 objectForKeyedSubscript:@"Certificates"];
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = [a1 deserializeCertificateChain:v13];
    if (v14)
    {
      (*((void (**)(id, const void *, void *, void))v9 + 2))(v9, v12, v14, 0);
    }
    else
    {
      CFRelease(v12);
      v17 = +[RMLog securityUtilities];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100061268();
      }

      v18 = +[RMErrorUtilities createInternalError];
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v18);
    }
  }
  else
  {
    CFRelease(v12);
    v16 = +[RMLog securityUtilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100061200();
    }

    v14 = +[RMErrorUtilities createInternalError];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v14);
  }

LABEL_11:
}

+ (id)_serializePrivateKey:(__SecKey *)a3 privateKeyIsExportable:(BOOL)a4
{
  if (a4)
  {
    CFErrorRef error = 0;
    CFDataRef v4 = SecKeyCopyExternalRepresentation(a3, &error);
    CFDictionaryRef v5 = v4;
    if (v4)
    {
      BOOL v6 = [(__CFData *)v4 base64EncodedStringWithOptions:0];
    }
    else
    {
      CFErrorRef v8 = error;
      id v9 = +[RMLog securityUtilities];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000612D0();
      }

      BOOL v6 = 0;
    }
  }
  else
  {
    CFDictionaryRef v5 = SecKeyCopyAttributes(a3);
    BOOL v7 = [(__CFDictionary *)v5 objectForKeyedSubscript:kSecAttrTokenOID];
    BOOL v6 = [v7 base64EncodedStringWithOptions:0];
  }

  return v6;
}

+ (__SecKey)_deserializePrivateKey:(id)a3 privateKeyIsExportable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  CFDataRef v6 = (const __CFData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:v5 options:0];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v4)
      {
        v17[0] = kSecAttrKeyType;
        v17[1] = kSecAttrKeyClass;
        v18[0] = kSecAttrKeyTypeECSECPrimeRandom;
        v18[1] = kSecAttrKeyClassPrivate;
        CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
        CFErrorRef v14 = 0;
        CFErrorRef v8 = SecKeyCreateWithData(v6, v7, &v14);
        if (!v8)
        {
          CFErrorRef v9 = v14;
          id v10 = +[RMLog securityUtilities];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_12;
          }
          goto LABEL_13;
        }
      }
      else
      {
        CFErrorRef v14 = 0;
        SecAccessControlRef v12 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &v14);
        v15[0] = kSecAttrIsPermanent;
        v15[1] = kSecAttrTokenID;
        v16[0] = &__kCFBooleanFalse;
        v16[1] = kSecAttrTokenIDAppleKeyStore;
        v15[2] = kSecAttrTokenOID;
        v15[3] = kSecAttrAccessControl;
        v16[2] = v6;
        v16[3] = v12;
        CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
        CFErrorRef v8 = SecKeyCreateWithData((CFDataRef)+[NSData data], v7, &v14);
        CFRelease(v12);
        if (!v8)
        {
          CFErrorRef v9 = v14;
          id v10 = +[RMLog securityUtilities];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
LABEL_12:
          }
            sub_1000613A0();
LABEL_13:
        }
      }

      goto LABEL_15;
    }
  }
  id v11 = +[RMLog securityUtilities];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100061338();
  }

  CFErrorRef v8 = 0;
LABEL_15:

  return v8;
}

+ (id)deserializeCertificateChain:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
      id v11 = objc_alloc((Class)NSData);
      id v12 = objc_msgSend(v11, "initWithBase64EncodedString:options:", v10, 0, (void)v19);
      v13 = v12;
      if (!v12) {
        break;
      }
      id v14 = v12;
      [v14 bytes];
      [v14 length];
      uint64_t v15 = SecCertificateCreateWithBytes();
      if (!v15)
      {
        v17 = +[RMLog securityUtilities];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100061268();
        }
LABEL_15:

        id v16 = 0;
        goto LABEL_16;
      }
      [v4 addObject:v15];

      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    v17 = +[RMLog securityUtilities];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100061408();
    }
    goto LABEL_15;
  }
LABEL_10:

  id v16 = [v4 copy];
LABEL_16:

  return v16;
}

+ (id)serializeCertificateChain:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        CFDataRef v10 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v14 + 1) + 8 * i));
        id v11 = -[__CFData base64EncodedStringWithOptions:](v10, "base64EncodedStringWithOptions:", 0, (void)v14);
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];

  return v12;
}

+ (void)generateSelfSignedCertificateAndPrivateKeyWithID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v42[0] = kSecAttrKeyType;
  v42[1] = kSecAttrKeySizeInBits;
  v43[0] = kSecAttrKeyTypeECSECPrimeRandom;
  v43[1] = &off_1000CAC98;
  CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  CFErrorRef error = 0;
  uint64_t v8 = SecKeyCreateRandomKey(v7, &error);
  if (!v8)
  {
    v24 = error;
    v25 = +[RMLog securityUtilities];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100061470();
    }
    goto LABEL_9;
  }
  uint64_t v9 = v8;
  SecKeyRef v10 = SecKeyCopyPublicKey(v8);
  if (!v10)
  {
    CFRelease(v9);
    v24 = +[RMErrorUtilities createInternalError];
    v25 = +[RMLog securityUtilities];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000614D8();
    }
LABEL_9:

    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v24);
    goto LABEL_14;
  }
  SecKeyRef v11 = v10;
  id v27 = v6;
  CFDictionaryRef v29 = v7;
  id v30 = v5;
  uint64_t v12 = +[NSString stringWithFormat:@"SelfSigned-%@", v5];
  v39[0] = kSecOidCountryName;
  v39[1] = @"US";
  v13 = +[NSArray arrayWithObjects:v39 count:2];
  v40 = v13;
  long long v14 = +[NSArray arrayWithObjects:&v40 count:1];
  v41[0] = v14;
  v37[0] = kSecOidOrganization;
  v37[1] = @"Apple Inc.";
  long long v15 = +[NSArray arrayWithObjects:v37 count:2];
  v38 = v15;
  long long v16 = +[NSArray arrayWithObjects:&v38 count:1];
  v41[1] = v16;
  v35[0] = kSecOidCommonName;
  v35[1] = v12;
  v28 = (void *)v12;
  long long v17 = +[NSArray arrayWithObjects:v35 count:2];
  v36 = v17;
  v18 = +[NSArray arrayWithObjects:&v36 count:1];
  v41[2] = v18;
  long long v19 = +[NSArray arrayWithObjects:v41 count:3];

  uint64_t v33 = kSecCertificateKeyUsage;
  long long v20 = +[NSNumber numberWithInt:2147483653];
  v34 = v20;
  long long v21 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];

  SelfSignedCertificate = (void *)SecGenerateSelfSignedCertificate();
  CFRelease(v11);
  if (SelfSignedCertificate)
  {
    v32 = SelfSignedCertificate;
    v23 = +[NSArray arrayWithObjects:&v32 count:1];
    id v6 = v27;
    (*((void (**)(id, __SecKey *, void *, void))v27 + 2))(v27, v9, v23, 0);
  }
  else
  {
    CFRelease(v9);
    v26 = +[RMLog securityUtilities];
    id v6 = v27;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100061540(v26);
    }

    SelfSignedCertificate = +[RMErrorUtilities createInternalError];
    (*((void (**)(id, void, void, void *))v27 + 2))(v27, 0, 0, SelfSignedCertificate);
  }
  CFDictionaryRef v7 = v29;
  id v5 = v30;
  v24 = v28;

LABEL_14:
}

+ (BOOL)checkValidAfterWithCertificate:(__SecCertificate *)a3 interval:(double)a4
{
  SecCertificateNotValidAfter();
  double v6 = v5;
  CFDictionaryRef v7 = +[NSDate date];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  return v6 - v9 >= a4;
}

@end