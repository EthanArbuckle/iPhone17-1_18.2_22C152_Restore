@interface OnlineAuthAgentURLSessionDelegate
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation OnlineAuthAgentURLSessionDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!sub_1000072A8()
    || (id v10 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mis"], v11 = objc_msgSend(v10, "BOOLForKey:", @"disableServerPinning"), v10, !v11))
  {
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x2020000000;
    uint64_t v78 = 0;
    uint64_t v71 = 0;
    v72 = (SecTrustRef *)&v71;
    uint64_t v73 = 0x2020000000;
    uint64_t v74 = 0;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10000A664;
    v70[3] = &unk_100051BD8;
    v70[4] = &v71;
    v70[5] = &v75;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10000A6C4;
    v67[3] = &unk_100051C00;
    v12 = objc_retainBlock(v70);
    id v68 = v12;
    id v13 = v9;
    id v69 = v13;
    v14 = objc_retainBlock(v67);
    v15 = [v8 protectionSpace];
    v16 = (__SecTrust *)[v15 serverTrust];

    if (!v16)
    {
      v29 = sub_100009D24();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10003DFF0(v29, v30, v31, v32, v33, v34, v35, v36);
      }

      ((void (*)(void *))v14[2])(v14);
      goto LABEL_30;
    }
    CFIndex CertificateCount = SecTrustGetCertificateCount(v16);
    id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:CertificateCount];
    if (CertificateCount)
    {
      for (CFIndex i = 0; i != CertificateCount; ++i)
        [v18 addObject:SecTrustGetCertificateAtIndex(v16, i)];
    }
    ApplePPQService = (const void *)SecPolicyCreateApplePPQService();
    v76[3] = (uint64_t)ApplePPQService;
    if (ApplePPQService)
    {
      uint64_t v21 = SecTrustCreateWithCertificates(v18, ApplePPQService, v72 + 3);
      if (v21)
      {
        v22 = sub_100009D24();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10003E174(v21, v22, v23, v24, v25, v26, v27, v28);
        }
      }
      else
      {
        v44 = v72[3];
        if (v44)
        {
          SecTrustResultType result = kSecTrustResultDeny;
          uint64_t v45 = SecTrustEvaluate(v44, &result);
          if (v45)
          {
            v46 = sub_100009D24();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              sub_10003E108(v45, v46, v47, v48, v49, v50, v51, v52);
            }
          }
          else
          {
            if (result == kSecTrustResultProceed || result == kSecTrustResultUnspecified)
            {
              ((void (*)(void *))v12[2])(v12);
              (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 1, 0);
              goto LABEL_29;
            }
            v46 = sub_100009D24();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              sub_10003E098((uint64_t)&result, v46, v60, v61, v62, v63, v64, v65);
            }
          }

          ((void (*)(void *))v14[2])(v14);
LABEL_29:

LABEL_30:
          _Block_object_dispose(&v71, 8);
          _Block_object_dispose(&v75, 8);
          goto LABEL_31;
        }
        v22 = sub_100009D24();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10003E060(v22, v53, v54, v55, v56, v57, v58, v59);
        }
      }
    }
    else
    {
      v22 = sub_100009D24();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10003E028(v22, v37, v38, v39, v40, v41, v42, v43);
      }
    }

    ((void (*)(void *))v14[2])(v14);
    goto LABEL_29;
  }
  (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
LABEL_31:
}

@end