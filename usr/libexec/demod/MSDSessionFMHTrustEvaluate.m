@interface MSDSessionFMHTrustEvaluate
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
@end

@implementation MSDSessionFMHTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  CFDataRef v5 = CFDataCreate(kCFAllocatorDefault, byte_100188FC0, dword_100189348);
  if (!v5)
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000D994C(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    return 0;
  }
  CFDataRef v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    v23 = sub_100068600();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000D99C4(v23, v24, v25, v26, v27, v28, v29, v30);
    }

    CFRelease(v6);
    return 0;
  }
  SecCertificateRef v8 = v7;
  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, 0);
  CFArrayRef v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  OSStatus v10 = SecTrustSetAnchorCertificates(a3, v9);
  if (v10)
  {
    OSStatus v31 = v10;
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[MSDSessionFMHTrustEvaluate trustServer:isRedirect:]";
      __int16 v36 = 2048;
      uint64_t v37 = v31;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Cannot set demounit anchor certificates: %ld", buf, 0x16u);
    }
    goto LABEL_25;
  }
  SecTrustResultType result = kSecTrustResultInvalid;
  OSStatus v11 = SecTrustEvaluate(a3, &result);
  if (v11)
  {
    int v32 = v11;
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000D47EC(v32, v12);
    }
LABEL_25:
    BOOL v13 = 0;
    goto LABEL_10;
  }
  if (result != kSecTrustResultUnspecified && result != kSecTrustResultProceed)
  {
    BOOL v13 = 0;
    goto LABEL_12;
  }
  v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Demounit server certificate is valid.", buf, 2u);
  }
  BOOL v13 = 1;
LABEL_10:

LABEL_12:
  CFRelease(v6);
  CFRelease(v8);

  return v13;
}

@end