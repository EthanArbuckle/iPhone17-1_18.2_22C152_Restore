@interface CCDCertificateSupport
+ (BOOL)verifySignature:(id)a3 payload:(id)a4 clientCertificate:(id)a5;
+ (id)base64Encodedx509CertificateStringFromCertificate:(id)a3;
+ (id)decodeCertificateFromBase64String:(id)a3;
@end

@implementation CCDCertificateSupport

+ (BOOL)verifySignature:(id)a3 payload:(id)a4 clientCertificate:(id)a5
{
  CFDataRef v7 = (const __CFData *)a3;
  CFDataRef v8 = (const __CFData *)a4;
  v9 = (__SecCertificate *)a5;
  v10 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Create signature", buf, 2u);
  }
  v11 = SecCertificateCopyKey(v9);

  v12 = *(NSObject **)(DEPLogObjects() + 8);
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Verify signature", buf, 2u);
    }
    CFErrorRef error = 0;
    int v13 = SecKeyVerifySignature(v11, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v8, v7, &error);
    BOOL v14 = v13 != 0;
    CFRelease(v11);
    v15 = *(NSObject **)(DEPLogObjects() + 8);
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Signature verified", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      CFErrorRef v16 = error;
      v17 = v15;
      id v18 = [(__CFError *)v16 description];
      id v19 = [v18 UTF8String];
      *(_DWORD *)buf = 136446210;
      id v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to verify signature: %{public}s\n", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to copy public key.\n", buf, 2u);
    }
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)base64Encodedx509CertificateStringFromCertificate:(id)a3
{
  if (a3)
  {
    CFDataRef v3 = SecCertificateCopyData((SecCertificateRef)a3);
    v4 = [(__CFData *)v3 base64EncodedDataWithOptions:0];
    id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)decodeCertificateFromBase64String:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:1];

  if (v4 && (SecCertificateRef v5 = SecCertificateCreateWithData(0, (CFDataRef)v4)) != 0)
  {
    CFRelease(v5);
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end