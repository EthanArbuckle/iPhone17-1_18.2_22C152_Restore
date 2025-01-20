@interface TransparencyCertificateHelper
+ (BOOL)addTrustedCertificate:(id)a3 trustedKeys:(id)a4 error:(id *)a5;
+ (BOOL)verifyCertificates:(id)a3 intermediates:(id)a4 policy:(__SecPolicy *)a5 error:(id *)a6;
+ (BOOL)verifyLeaf:(id)a3 intermediates:(id)a4 policy:(__SecPolicy *)a5 error:(id *)a6;
+ (__SecCertificate)certificateFromData:(id)a3 error:(id *)a4;
+ (id)copyTrustedKeysFromDataArray:(id)a3 error:(id *)a4;
+ (id)createCACertificatesArray:(id)a3 error:(id *)a4;
@end

@implementation TransparencyCertificateHelper

+ (__SecCertificate)certificateFromData:(id)a3 error:(id *)a4
{
  CFDataRef v5 = (const __CFData *)a3;
  v6 = SecCertificateCreateWithData(0, v5);
  if (!v6)
  {
    v6 = (__SecCertificate *)SecCertificateCreateWithPEM();
    if (!v6)
    {
      if (a4)
      {
        *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-7 description:@"Unable to decode certificate"];
      }
      if (qword_10032F388 != -1) {
        dispatch_once(&qword_10032F388, &stru_1002C9CB8);
      }
      v7 = qword_10032F390;
      if (os_log_type_enabled((os_log_t)qword_10032F390, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to decode certificate", v9, 2u);
      }
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)addTrustedCertificate:(id)a3 trustedKeys:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = +[TransparencyCertificateHelper certificateFromData:a3 error:a5];
  if (!v8)
  {
    if (qword_10032F388 != -1) {
      dispatch_once(&qword_10032F388, &stru_1002C9CD8);
    }
    v15 = qword_10032F390;
    if (os_log_type_enabled((os_log_t)qword_10032F390, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to decode trusted certificate", buf, 2u);
    }
    goto LABEL_24;
  }
  v9 = v8;
  SecKeyRef v10 = SecCertificateCopyKey(v8);
  if (!v10)
  {
    if (a5)
    {
      *a5 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-8 description:@"Unable to decode certificate public key"];
    }
    if (qword_10032F388 != -1) {
      dispatch_once(&qword_10032F388, &stru_1002C9CF8);
    }
    v16 = qword_10032F390;
    if (os_log_type_enabled((os_log_t)qword_10032F390, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to decode certificate public key", v21, 2u);
    }
    v17 = v9;
    goto LABEL_23;
  }
  SecKeyRef v11 = v10;
  uint64_t v12 = SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
  if (!v12)
  {
    if (a5)
    {
      *a5 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-30 description:@"Unable to copy certificate key SPKI hash"];
    }
    if (qword_10032F388 != -1) {
      dispatch_once(&qword_10032F388, &stru_1002C9D18);
    }
    v18 = qword_10032F390;
    if (os_log_type_enabled((os_log_t)qword_10032F390, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to copy certificate key SPKI hash", (uint8_t *)v20, 2u);
    }
    CFRelease(v9);
    v17 = v11;
LABEL_23:
    CFRelease(v17);
LABEL_24:
    BOOL v14 = 0;
    goto LABEL_25;
  }
  v13 = (void *)v12;
  [v7 setObject:v11 forKey:v12];
  CFRelease(v9);
  CFRelease(v11);

  BOOL v14 = 1;
LABEL_25:

  return v14;
}

+ (id)copyTrustedKeysFromDataArray:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      SecKeyRef v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!+[TransparencyCertificateHelper addTrustedCertificate:trustedKeys:error:](TransparencyCertificateHelper, "addTrustedCertificate:trustedKeys:error:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v11), v6, a4, (void)v14))
        {

          id v12 = 0;
          goto LABEL_11;
        }
        SecKeyRef v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v12 = v6;
LABEL_11:

  return v12;
}

+ (id)createCACertificatesArray:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = +[TransparencyCertificateHelper certificateFromData:*(void *)(*((void *)&v17 + 1) + 8 * i) error:a4];
        if (!v12)
        {
          if (qword_10032F388 != -1) {
            dispatch_once(&qword_10032F388, &stru_1002C9D38);
          }
          long long v14 = qword_10032F390;
          if (os_log_type_enabled((os_log_t)qword_10032F390, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v16 = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to decode intermediate certificate", v16, 2u);
          }

          v6 = 0;
          goto LABEL_15;
        }
        v13 = v12;
        [v6 addObject:v12];
        CFRelease(v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v6;
}

+ (BOOL)verifyLeaf:(id)a3 intermediates:(id)a4 policy:(__SecPolicy *)a5 error:(id *)a6
{
  id v9 = a4;
  uint64_t v10 = +[TransparencyCertificateHelper certificateFromData:a3 error:a6];
  if (v10)
  {
    SecKeyRef v11 = v10;
    id v12 = +[NSMutableArray arrayWithObject:v10];
    CFRelease(v11);
    [v12 addObjectsFromArray:v9];
    trust[0] = 0;
    OSStatus v13 = SecTrustCreateWithCertificates(v12, a5, trust);
    if (v13)
    {
      if (a6)
      {
        *a6 = +[TransparencyError errorWithDomain:kTransparencyErrorAlloc code:v13 description:@"SecTrustCreate failed"];
      }
      if (qword_10032F388 != -1) {
        dispatch_once(&qword_10032F388, &stru_1002C9D78);
      }
      long long v14 = qword_10032F390;
      if (os_log_type_enabled((os_log_t)qword_10032F390, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "SecTrustCreate failed", (uint8_t *)v20, 2u);
      }
      BOOL v15 = 0;
    }
    else
    {
      v20[0] = 0;
      BOOL v15 = SecTrustEvaluateWithError(trust[0], (CFErrorRef *)v20);
      id v17 = v20[0];
      if (a6 && v20[0])
      {
        *a6 = v20[0];
        v20[0] = 0;
      }
      else if (v20[0])
      {
        v20[0] = 0;
        CFRelease(v17);
      }
      SecTrustRef v18 = trust[0];
      if (trust[0])
      {
        trust[0] = 0;
        CFRelease(v18);
      }
    }
  }
  else
  {
    if (qword_10032F388 != -1) {
      dispatch_once(&qword_10032F388, &stru_1002C9D58);
    }
    long long v16 = qword_10032F390;
    if (os_log_type_enabled((os_log_t)qword_10032F390, OS_LOG_TYPE_ERROR))
    {
      LOWORD(trust[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to decode leaf certificate", (uint8_t *)trust, 2u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)verifyCertificates:(id)a3 intermediates:(id)a4 policy:(__SecPolicy *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v33 = 0;
  OSStatus v13 = [a1 createCACertificatesArray:v11 error:&v33];
  id v14 = v33;
  if (v13)
  {
    v24 = v12;
    id v25 = v11;
    v26 = a6;
    id v27 = v10;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v30;
      unsigned __int8 v19 = 1;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          if (v19)
          {
            uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            id v28 = v14;
            unsigned __int8 v19 = [a1 verifyLeaf:v21 intermediates:v13 policy:a5 error:&v28];
            id v22 = v28;

            id v14 = v22;
          }
          else
          {
            unsigned __int8 v19 = 0;
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v17);
    }
    else
    {
      unsigned __int8 v19 = 1;
    }

    a6 = v26;
    id v10 = v27;
    id v12 = v24;
    id v11 = v25;
  }
  else
  {
    unsigned __int8 v19 = 0;
  }

  if (a6 && v14) {
    *a6 = v14;
  }

  return v19;
}

@end