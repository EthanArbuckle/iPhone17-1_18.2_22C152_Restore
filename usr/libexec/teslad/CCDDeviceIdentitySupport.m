@interface CCDDeviceIdentitySupport
+ (id)_signPayloadData:(id)a3 withPrivateKey:(id)a4 outError:(id *)a5;
+ (id)requestWithPayload:(id)a3 URL:(id)a4 privateKey:(id)a5 clientCertificates:(id)a6 outError:(id *)a7;
+ (void)retrieveClientCertificateWithCompletion:(id)a3;
@end

@implementation CCDDeviceIdentitySupport

+ (void)retrieveClientCertificateWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Retrieve Client Certificate.\n", buf, 2u);
  }
  v24[0] = &__kCFBooleanTrue;
  uint64_t v5 = kMAOptionsBAAOIDSToInclude;
  v23[0] = @"AllowInvalidNetworkCertificates";
  v23[1] = kMAOptionsBAAOIDSToInclude;
  v22[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v22[1] = kMAOptionsBAAOIDIMG4Manifest;
  v22[2] = kMAOptionsBAAOIDDeviceIdentifiers;
  v22[3] = kMAOptionsBAAOIDHardwareProperties;
  v22[4] = kMAOptionsBAAOIDKeyUsageProperties;
  v22[5] = kMAOptionsBAAOIDDeviceOSInformation;
  v6 = +[NSArray arrayWithObjects:v22 count:6];
  v7 = +[NSMutableArray arrayWithArray:v6];
  v24[1] = v7;
  v24[2] = @"DEP-client-cert";
  v23[2] = kMAOptionsBAAKeychainLabel;
  v23[3] = kMAOptionsBAAKeychainAccessGroup;
  v24[3] = @"com.apple.cloudconfigd";
  v8 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  id v9 = [v8 mutableCopy];

  if (+[CCDDeviceUtilities isInternalBuild]
    && !+[CCDDeviceUtilities isRunningInRootLaunchdContext](CCDDeviceUtilities, "isRunningInRootLaunchdContext")&& !+[CCDDeviceUtilities isRunningInRecovery](CCDDeviceUtilities, "isRunningInRecovery")&& !+[CCDDeviceUtilities isRunningInDiagnosticsMode])
  {
    SecAccessControlRef v10 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, 0);
    v11 = [v9 objectForKeyedSubscript:v5];
    [v11 addObject:kMAOptionsBAAOIDAccessControls];

    [v9 setObject:v10 forKeyedSubscript:kMAOptionsBAAAccessControls];
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000052BC;
  v18[3] = &unk_10001C8D8;
  id v19 = v9;
  id v20 = v3;
  id v12 = v3;
  id v13 = v9;
  v14 = objc_retainBlock(v18);
  ((void (*)(void *, uint64_t, uint64_t, uint64_t))v14[2])(v14, v15, v16, v17);
}

+ (id)_signPayloadData:(id)a3 withPrivateKey:(id)a4 outError:(id *)a5
{
  CFDataRef v7 = (const __CFData *)a3;
  v8 = (__SecKey *)a4;
  uint64_t v9 = DEPLogObjects();
  SecAccessControlRef v10 = *(NSObject **)(v9 + 8);
  if (v7 && v8)
  {
    if (os_log_type_enabled(*(os_log_t *)(v9 + 8), OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Signing the payload with the private key...", buf, 2u);
    }
    CFErrorRef error = 0;
    CFDataRef v11 = SecKeyCreateSignature(v8, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v7, &error);
    if (!v11)
    {
      id v12 = error;
      id v13 = *(NSObject **)(DEPLogObjects() + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        id v15 = [(__CFError *)v12 description];
        id v16 = [v15 UTF8String];
        *(_DWORD *)buf = 136446210;
        id v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to create signature: %{public}s\n", buf, 0xCu);
      }
      if (a5)
      {
        *a5 = +[CCDError internalErrorWithCode:33010];
      }
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(v9 + 8), OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No private key, can't sign the payload", buf, 2u);
    }
    if (a5)
    {
      +[CCDError internalErrorWithCode:33011];
      CFDataRef v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFDataRef v11 = 0;
    }
  }

  return v11;
}

+ (id)requestWithPayload:(id)a3 URL:(id)a4 privateKey:(id)a5 clientCertificates:(id)a6 outError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = v15;
  if (v15 && [v15 count] == (id)2)
  {
    uint64_t v17 = [v12 dictionary];
    id v57 = 0;
    v18 = +[NSJSONSerialization dataWithJSONObject:v17 options:0 error:&v57];
    id v19 = v57;
    if (v18)
    {
      id v56 = 0;
      id v20 = [a1 _signPayloadData:v18 withPrivateKey:v14 outError:&v56];
      id v21 = v56;
      id v55 = v21;
      if (!v20 || v21)
      {
        v37 = *(NSObject **)(DEPLogObjects() + 8);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Error while signing the request payload", buf, 2u);
        }
        id v33 = 0;
        if (a7) {
          *a7 = v55;
        }
      }
      else
      {
        v46 = v17;
        id v47 = v13;
        v52 = v20;
        uint64_t v45 = [v20 base64EncodedDataWithOptions:0];
        id v54 = [objc_alloc((Class)NSString) initWithData:v45 encoding:4];
        v22 = [v16 objectAtIndexedSubscript:0];
        uint64_t v23 = +[CCDCertificateSupport base64Encodedx509CertificateStringFromCertificate:v22];

        v24 = [v16 objectAtIndexedSubscript:1];
        uint64_t v25 = +[CCDCertificateSupport base64Encodedx509CertificateStringFromCertificate:v24];

        id v26 = objc_alloc((Class)NSString);
        v51 = v18;
        v27 = [v18 base64EncodedDataWithOptions:0];
        id v28 = [v26 initWithData:v27 encoding:4];

        v29 = objc_opt_new();
        [v29 setObject:v28 forKeyedSubscript:@"payload"];
        [v29 setObject:v54 forKeyedSubscript:@"payload_signature"];
        v44 = (void *)v23;
        [v29 setObject:v23 forKeyedSubscript:@"sign_cert"];
        [v29 setObject:v25 forKeyedSubscript:@"intermediate_cert"];
        v48 = v29;
        v49 = +[NSDictionary dictionaryWithDictionary:v29];
        v30 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:");
        id v53 = v19;

        v50 = (void *)v25;
        if (v30)
        {
          v31 = *(NSObject **)(DEPLogObjects() + 8);
          BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
          id v13 = v47;
          if (v47)
          {
            uint64_t v17 = v46;
            if (v32)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Setting up the request.", buf, 2u);
            }
            id v33 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v47 cachePolicy:0 timeoutInterval:30.0];
            [v33 setHTTPMethod:@"POST"];
            [v33 setValue:@"3" forHTTPHeaderField:@"X-Profile-Protocol-Version"];
            v34 = +[CCDRequestSupport userAgentString];
            [v33 setValue:v34 forHTTPHeaderField:@"User-Agent"];

            v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v30 length]);
            [v33 setValue:v35 forHTTPHeaderField:@"Content-Length"];

            [v33 setHTTPBody:v30];
          }
          else
          {
            uint64_t v17 = v46;
            if (v32)
            {
              v41 = v31;
              v42 = [0 description];
              *(_DWORD *)buf = 138543362;
              v59 = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Couldn't build up the URL from string: %{public}@", buf, 0xCu);
            }
            if (a7)
            {
              +[CCDError internalErrorWithCode:33012];
              id v33 = 0;
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v33 = 0;
            }
          }
          v39 = (void *)v45;
        }
        else
        {
          v38 = *(NSObject **)(DEPLogObjects() + 8);
          id v13 = v47;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "No serial request data", buf, 2u);
          }
          v39 = (void *)v45;
          uint64_t v17 = v46;
          if (a7 && v53) {
            goto LABEL_31;
          }
          v40 = *(NSObject **)(DEPLogObjects() + 8);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Unknown error while serializing the request dictionary", buf, 2u);
          }
          if (a7)
          {
LABEL_31:
            +[CCDError internalErrorWithCode:33009];
            id v33 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v33 = 0;
          }
        }

        v18 = v51;
        id v20 = v52;
        id v19 = v53;
      }
    }
    else if (a7)
    {
      +[CCDError internalErrorWithCode:33009];
      id v33 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v33 = 0;
    }
  }
  else
  {
    v36 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "No certificate, can't do the request", buf, 2u);
    }
    if (a7)
    {
      +[CCDError internalErrorWithCode:33013];
      id v33 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v33 = 0;
    }
  }

  return v33;
}

@end