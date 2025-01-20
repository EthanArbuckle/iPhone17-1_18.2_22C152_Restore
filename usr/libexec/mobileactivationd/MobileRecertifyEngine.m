@interface MobileRecertifyEngine
- (DataArk)dark;
- (MobileRecertifyEngine)initWithQueue:(id)a3 dark:(id)a4;
- (OS_dispatch_queue)queue;
- (id)createRecertInfoWithDataArk:(id)a3 alcoholBlob:(NACContextOpaque_ *)a4 options:(id)a5 error:(id *)a6;
- (void)recertifyDevice:(id)a3;
- (void)setDark:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MobileRecertifyEngine

- (MobileRecertifyEngine)initWithQueue:(id)a3 dark:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MobileRecertifyEngine;
  v9 = [(MobileRecertifyEngine *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    if (!v7 || !v8)
    {
      maLog((uint64_t)"-[MobileRecertifyEngine initWithQueue:dark:]", 0, @"Invalid input");
      v11 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong(p_isa + 1, a4);
  }
  v11 = p_isa;
LABEL_7:

  return v11;
}

- (id)createRecertInfoWithDataArk:(id)a3 alcoholBlob:(NACContextOpaque_ *)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  long long v73 = 0uLL;
  int v74 = 0;
  memset(v72, 0, 35);
  memset(v71, 0, sizeof(v71));
  unsigned int v65 = 256;
  bzero(v70, 0x1000uLL);
  unsigned int v64 = 4096;
  SecKeyRef privateKeyRef = 0;
  SecIdentityRef identityRef = 0;
  uint64_t v61 = 0;
  unsigned int v60 = 0;
  id v51 = v9;
  id v52 = v8;
  if (v8 && a4)
  {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    if (v10)
    {
      id v11 = +[GestaltHlpr getSharedInstance];
      id v59 = 0;
      [v11 updateRecertInfo:v10 errors:&v59];
      id v12 = v59;
      id v49 = v12;
      id v50 = v11;
      if ([v12 count])
      {
        objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 119, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve gestalt values: %@", v12);
        v53 = 0;
        id v46 = 0;
        v47 = 0;
        v14 = 0;
        id v48 = 0;
LABEL_22:
        id v15 = 0;
        v16 = 0;
        v17 = 0;
        goto LABEL_23;
      }
      id v18 = copy_device_certificate(0);
      if (v18) {
        [v10 setObject:v18 forKeyedSubscript:@"DeviceCertificate"];
      }
      id v58 = 0;
      v19 = create_cert_request(v8, &v58);
      id v20 = v58;
      v21 = v19;
      v22 = v20;
      id v48 = v18;
      if (v21)
      {
        v53 = v21;
        [v10 setObject:v21 forKeyedSubscript:@"DeviceCertRequest"];
        v23 = +[NSUUID UUID];
        if (v23)
        {
          v47 = v23;
          id v24 = [v9 objectForKeyedSubscript:@"ReCertRandomness"];
          id v25 = isNSString(v24);

          id v46 = v24;
          if (!v25)
          {
            objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 148, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid nonce.");

            v14 = 0;
            id v15 = 0;
            v16 = 0;
            v17 = 0;
            id v27 = 0;
            goto LABEL_24;
          }
          [v10 setObject:v24 forKeyedSubscript:@"ActivationRandomness"];
          CFStringRef v68 = @"UseSystemKeychainSharediPadOnly";
          v69 = &__kCFBooleanTrue;
          v45 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
          if (load_identity((CFTypeRef *)&identityRef, @"lockdown-identities", @"com.apple.lockdown.identity.activation", v45, 0, 0))
          {
            uint64_t v26 = SecIdentityCopyPrivateKey(identityRef, &privateKeyRef);
            if (v26 || !privateKeyRef)
            {
              objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 165, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy private key: %d", v26);

              v14 = 0;
              id v15 = 0;
              v16 = 0;
              v17 = 0;
              id v27 = 0;
LABEL_53:
              id v25 = 0;
              v29 = 0;
              goto LABEL_54;
            }
            id v57 = v22;
            id v27 = lockcrypto_sign(privateKeyRef, v53, (NSError **)&v57);
            id v28 = v57;

            if (!v27)
            {
              objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 171, @"com.apple.MobileActivation.ErrorDomain", -1, v28, @"Failed to sign data.");

              v14 = 0;
              goto LABEL_52;
            }
            [v10 setObject:v27 forKeyedSubscript:@"IdentitySignature"];
          }
          else
          {
            id v27 = 0;
            id v28 = v22;
          }
          id v56 = 0;
          v29 = +[NSPropertyListSerialization dataWithPropertyList:v10 format:100 options:0 error:&v56];
          id v33 = v56;

          if (v29)
          {
            v14 = v29;
            t1BoNctgaUu66((uint64_t)a4, (uint64_t)[(NSData *)v14 bytes], [(NSData *)v14 length], (uint64_t)&v61);
            if (v34)
            {
              objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 192, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to sign data: %d", v34);

LABEL_52:
              id v15 = 0;
              v16 = 0;
              v17 = 0;
              goto LABEL_53;
            }
            id v35 = objc_alloc((Class)NSData);
            v36 = (NSData *)[v35 initWithBytes:v61 length:v60];
            v29 = v36;
            if (v36)
            {
              v30 = [(NSData *)v36 base64EncodedStringWithOptions:0];
              if (!v30)
              {
                objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 205, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to encode data as base64.");

                id v15 = 0;
                v16 = 0;
                v17 = 0;
                id v25 = 0;
                goto LABEL_25;
              }
              id v37 = objc_alloc_init((Class)NSMutableDictionary);
              id v25 = v37;
              if (!v37)
              {
                objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 211, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create dictionary.");

                id v15 = 0;
                v16 = 0;
                v17 = 0;
                goto LABEL_25;
              }
              [v37 setObject:v30 forKeyedSubscript:@"ValidationData"];
              v38 = +[NSDictionary dictionaryWithDictionary:v10];
              [v25 setObject:v38 forKeyedSubscript:@"payload"];

              id v55 = 0;
              v16 = +[NSPropertyListSerialization dataWithPropertyList:v25 format:100 options:0 error:&v55];
              objc_super v13 = (NSError *)v55;

              if (!v16)
              {
                v44 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 220, @"com.apple.MobileActivation.ErrorDomain", -1, v13, @"Failed to convert dictionary to xml data.");

                v14 = 0;
                id v15 = 0;
LABEL_63:
                v17 = 0;
                objc_super v13 = v44;
                goto LABEL_25;
              }
              v14 = v16;
              [(NSData *)v14 bytes];
              [(NSData *)v14 length];
              if (CCDigest())
              {
                MobileActivationError = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 229, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to digest data.");
              }
              else
              {
                *(void *)&v72[0] = 0xE2B050609302130;
                DWORD2(v72[0]) = 85590531;
                WORD6(v72[0]) = 1024;
                BYTE14(v72[0]) = 20;
                *(_OWORD *)((char *)v72 + 15) = v73;
                *(_DWORD *)((char *)&v72[1] + 15) = v74;
                wyjYwk((uint64_t)v72, 35, (uint64_t)v71, (uint64_t)&v65, (uint64_t)v70, (uint64_t)&v64);
                if (!v40)
                {
                  id v41 = objc_alloc((Class)NSData);
                  id v15 = [v41 initWithBytes:v71 length:v65];
                  if (v15)
                  {
                    id v42 = objc_alloc((Class)NSData);
                    v43 = (NSData *)[v42 initWithBytes:v70 length:v64];
                    v16 = v43;
                    if (v43)
                    {
                      v66[0] = @"CertificateInfoXML";
                      v66[1] = @"FairPlaySignature";
                      v67[0] = v14;
                      v67[1] = v15;
                      v66[2] = @"FairPlayCertChain";
                      v67[2] = v43;
                      v17 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
                      goto LABEL_25;
                    }
                    v44 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 275, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to serialize cert chain.");

                    goto LABEL_63;
                  }
                  v44 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 269, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to serialize signature data.");

                  goto LABEL_62;
                }
                MobileActivationError = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 263, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to compute fairplay activation signature: %ld", v40);
              }
              v44 = MobileActivationError;

              id v15 = 0;
LABEL_62:
              v16 = 0;
              goto LABEL_63;
            }
            objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 199, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to convert signed data.");
          }
          else
          {
            objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 182, @"com.apple.MobileActivation.ErrorDomain", -1, v33, @"Could not convert dictionary to xml data.");

            v14 = 0;
          }
          id v15 = 0;
          v16 = 0;
          v17 = 0;
          id v25 = 0;
LABEL_54:
          v30 = 0;
          goto LABEL_25;
        }
        objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 142, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Could not create UUID.");
      }
      else
      {
        objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 132, @"com.apple.MobileActivation.ErrorDomain", -1, v20, @"Failed to create certificate request.");

        v53 = 0;
      }
      id v46 = 0;
      v47 = 0;
      v14 = 0;
      goto LABEL_22;
    }
    objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 110, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Could not create dictionary.");
  }
  else
  {
    objc_super v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 104, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).");
    id v10 = 0;
  }
  v53 = 0;
  id v46 = 0;
  v47 = 0;
  v14 = 0;
  id v48 = 0;
  id v49 = 0;
  id v15 = 0;
  v16 = 0;
  v17 = 0;
  id v50 = 0;
LABEL_23:
  id v27 = 0;
  id v25 = 0;
LABEL_24:
  v29 = 0;
  v30 = 0;
  v45 = 0;
LABEL_25:
  if (a6 && !v17) {
    *a6 = v13;
  }
  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }
  SecKeyRef privateKeyRef = 0;
  if (identityRef) {
    CFRelease(identityRef);
  }
  SecIdentityRef identityRef = 0;
  if (v61) {
    Be81a395Bf0(v61);
  }
  v31 = v17;

  return v31;
}

- (void)recertifyDevice:(id)a3
{
  id v4 = a3;
  uint64_t v128 = 0;
  uint64_t v129 = 0;
  unsigned int v127 = 0;
  v126 = 0;
  v5 = [(MobileRecertifyEngine *)self queue];
  dispatch_assert_queue_not_V2((dispatch_queue_t)v5);

  id v6 = [objc_alloc((Class)NSURL) initWithString:@"https://albert.apple.com/deviceservices/certifySB"];
  id v7 = [objc_alloc((Class)NSURL) initWithString:@"https://static.ips.apple.com/absinthe-cert/certificate.cer"];
  id v8 = [objc_alloc((Class)NSURL) initWithString:@"https://albert.apple.com/deviceservices/session"];
  id v104 = v7;
  id v105 = v6;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  id v107 = v8;
  if (v9 || v8 == 0)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 350, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate URL.");
    id v12 = 0;
    v101 = 0;
    v102 = 0;
    v108 = 0;
    id v99 = 0;
    id v100 = 0;
    id v97 = 0;
    id v98 = 0;
    id v96 = 0;
    id v106 = 0;
    id v103 = 0;
LABEL_24:
    id v32 = 0;
    id v33 = 0;
    id v34 = 0;
    id v35 = 0;
    v31 = 0;
    v36 = 0;
    id v109 = 0;
LABEL_25:
    v29 = 0;
    goto LABEL_37;
  }
  if (is_internal_build())
  {
    id v14 = objc_alloc((Class)NSUserDefaults);
    id v15 = [v14 persistentDomainForName:@"com.apple.mobileactivationd"];

    id v16 = [v15 objectForKeyedSubscript:@"UseReverseProxy"];
    id v17 = isNSNumber(v16);
    id v103 = v15;
    if (v17)
    {
      id v18 = v17;
      id v19 = [v15 objectForKeyedSubscript:@"UseReverseProxy"];
      unsigned int v20 = [v19 BOOLValue];

      if (v20)
      {
        id v21 = copyReverseProxyDictionary(0, 0, 0);
        if (v21)
        {
          v22 = v21;
          id v23 = 0;
          goto LABEL_19;
        }
      }
    }
    else
    {
    }
  }
  else
  {
    id v103 = 0;
  }
  v125[1] = 0;
  BOOL v24 = networkReachable();
  id v23 = 0;
  if (!v24)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 365, @"com.apple.MobileActivation.ErrorDomain", -17, v23, @"Network is unavailable.");

    id v12 = 0;
    v101 = 0;
    v102 = 0;
    v108 = 0;
    id v99 = 0;
    id v100 = 0;
    id v97 = 0;
    id v98 = 0;
    id v96 = 0;
    id v106 = 0;
    goto LABEL_24;
  }
  v22 = 0;
LABEL_19:
  id v25 = objc_alloc((Class)NSMutableURLRequest);
  LODWORD(v26) = NETWORK_TIMEOUT_SECONDS;
  double v27 = (double)v26;
  id v28 = (NSData *)[v25 initWithURL:v7 cachePolicy:1 timeoutInterval:(double)v26];
  v29 = v28;
  id v106 = v22;
  if (!v28)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 373, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate request.");

    id v12 = 0;
    v101 = 0;
    v102 = 0;
    v108 = 0;
    id v109 = 0;
LABEL_34:
    id v99 = 0;
    id v100 = 0;
    id v97 = 0;
    id v98 = 0;
    id v96 = 0;
    id v32 = 0;
    id v33 = 0;
LABEL_35:
    id v34 = 0;
    id v35 = 0;
    v31 = 0;
    goto LABEL_36;
  }
  [(NSData *)v28 setValue:@"Absinthe/2.0 iOS Device Activator (MobileActivation-1015.60.1 built on Nov 10 2024 at 02:44:36)" forHTTPHeaderField:@"User-Agent"];
  id v124 = v23;
  v125[0] = 0;
  id v12 = (NSString *)talkToServerWithError(v29, 0, 0, v22, v125, &v126, &v124);
  id v109 = v125[0];
  id v30 = v124;

  v31 = v126;
  if (v126 != (NSDictionary *)200)
  {
    if (!v126)
    {
      id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 382, @"com.apple.MobileActivation.ErrorDomain", -6, v30, @"Network communication error.");

      v101 = 0;
      v102 = 0;
      v108 = 0;
      id v99 = 0;
      id v100 = 0;
      id v97 = 0;
      id v98 = 0;
      id v96 = 0;
      id v32 = 0;
      id v33 = 0;
      id v34 = 0;
      id v35 = 0;
LABEL_36:
      v36 = 0;
      goto LABEL_37;
    }
    v39 = +[NSHTTPURLResponse localizedStringForStatusCode:v126];
    int v40 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 387, @"com.apple.MobileActivation.ServerErrorDomain", (uint64_t)v31, v30, @"Server error: %ld (%@)", v31, v39);

    uint64_t v41 = (uint64_t)v126;
    id v42 = +[NSHTTPURLResponse localizedStringForStatusCode:v126];
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 387, @"com.apple.MobileActivation.ErrorDomain", -6, v40, @"Server error: %ld (%@)", v41, v42);

    goto LABEL_33;
  }
  if (!v12)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 392, @"com.apple.MobileActivation.ErrorDomain", -6, v30, @"Failed to get a response from the server.");
    goto LABEL_32;
  }
  id v12 = v12;
  KxmB0CKvgWt((uint64_t)[(NSString *)v12 bytes], (int)[(NSString *)v12 length]);
  if (v37)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 398, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to initialize NAC: %d", v37);
LABEL_32:
    id v11 = MobileActivationError;
LABEL_33:

    v101 = 0;
    v102 = 0;
    v108 = 0;
    goto LABEL_34;
  }
  v137[0] = @"id";
  v137[1] = @"request";
  v138[0] = &off_10027EF78;
  id v43 = objc_alloc((Class)NSData);
  id v44 = [v43 initWithBytesNoCopy:v128 length:v127 freeWhenDone:0];
  id v45 = [v44 base64EncodedStringWithOptions:0];
  v138[1] = v45;
  id v46 = +[NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:2];

  CFStringRef v135 = @"absinthe-operations";
  v132 = v46;
  CFStringRef v133 = @"create-session-info";
  v102 = v46;
  v47 = +[NSArray arrayWithObjects:&v132 count:1];
  v134 = v47;
  id v48 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
  v136 = v48;
  id v49 = +[NSDictionary dictionaryWithObjects:&v136 forKeys:&v135 count:1];

  id v123 = v30;
  id v33 = +[NSJSONSerialization dataWithJSONObject:v49 options:0 error:&v123];
  id v50 = v123;

  v108 = v33;
  v101 = v49;
  if (!v33)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 411, @"com.apple.MobileActivation.ErrorDomain", -1, v50, @"Failed to serialize data.");

    v108 = 0;
    id v99 = 0;
    id v100 = 0;
    id v97 = 0;
    id v98 = 0;
    id v96 = 0;
    id v32 = 0;
    goto LABEL_35;
  }
  id v33 = (NSData *)[objc_alloc((Class)NSMutableURLRequest) initWithURL:v107 cachePolicy:1 timeoutInterval:v27];

  if (!v33)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 420, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate request.");

    id v99 = 0;
    id v100 = 0;
    id v97 = 0;
    id v98 = 0;
    id v96 = 0;
    id v32 = 0;
    id v34 = 0;
    id v35 = 0;
    v31 = 0;
    v36 = 0;
    goto LABEL_25;
  }
  [(NSData *)v33 setHTTPBody:v108];
  [(NSData *)v33 setValue:@"Absinthe/2.0 iOS Device Activator (MobileActivation-1015.60.1 built on Nov 10 2024 at 02:44:36)" forHTTPHeaderField:@"User-Agent"];
  [(NSData *)v33 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [(NSData *)v33 setHTTPMethod:@"POST"];
  id v121 = v50;
  id v122 = v109;
  v36 = (NSString *)talkToServerWithError(v33, 0, 0, v106, &v122, &v126, &v121);
  id v93 = v122;

  id v51 = v121;
  uint64_t v52 = (uint64_t)v126;
  if (v126 != (NSDictionary *)200)
  {
    v91 = v33;
    v92 = v36;
    if (v126)
    {
      unsigned int v65 = +[NSHTTPURLResponse localizedStringForStatusCode:v126];
      v66 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 438, @"com.apple.MobileActivation.ServerErrorDomain", v52, v51, @"Server error: %ld (%@)", v52, v65);

      uint64_t v67 = (uint64_t)v126;
      CFStringRef v68 = +[NSHTTPURLResponse localizedStringForStatusCode:v126];
      id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 438, @"com.apple.MobileActivation.ErrorDomain", -6, v66, @"Server error: %ld (%@)", v67, v68);
    }
    else
    {
      id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 433, @"com.apple.MobileActivation.ErrorDomain", -6, v51, @"Network communication error.");
    }

    id v99 = 0;
    id v100 = 0;
    id v97 = 0;
    id v98 = 0;
    goto LABEL_61;
  }
  if (!v36)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 443, @"com.apple.MobileActivation.ErrorDomain", -6, v51, @"Failed to get response from server.");

    id v12 = 0;
    id v99 = 0;
    id v100 = 0;
    id v97 = 0;
    id v98 = 0;
    id v96 = 0;
    id v32 = 0;
    v29 = v33;
    id v33 = 0;
    id v34 = 0;
    id v35 = 0;
    v31 = 0;
LABEL_72:
    id v109 = v93;
    goto LABEL_37;
  }
  id v120 = v51;
  id v53 = +[NSJSONSerialization JSONObjectWithData:v36 options:1 error:&v120];
  id v54 = v120;

  if (!v53)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 449, @"com.apple.MobileActivation.ErrorDomain", -1, v54, @"Failed to serialize json data.");

    id v99 = 0;
    id v100 = 0;
LABEL_68:
    id v97 = 0;
    id v98 = 0;
    id v96 = 0;
    id v32 = 0;
    v29 = v33;
    id v33 = 0;
    id v34 = 0;
    id v35 = 0;
    v31 = 0;
    id v12 = v36;
    v36 = 0;
    goto LABEL_72;
  }
  id v55 = [v53 objectForKeyedSubscript:@"absinthe-results"];
  id v56 = [v55 objectForKeyedSubscript:@"create-session-info"];

  id v57 = isNSArray(v56);
  id v99 = v56;
  id v100 = v53;
  if (!v57)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 486, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Missing one drink: %@", v53);

    goto LABEL_68;
  }
  v92 = v36;
  id v58 = [v56 objectAtIndexedSubscript:0];
  id v59 = isNSDictionary(v58);

  id v98 = v58;
  if (!v59)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 492, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Missing two drinks: %@", v53);

    id v97 = 0;
LABEL_71:
    id v96 = 0;
    id v32 = 0;
    v29 = v33;
    id v33 = 0;
    id v34 = 0;
    id v35 = 0;
    v31 = 0;
    v36 = 0;
    id v12 = v92;
    goto LABEL_72;
  }
  id v60 = [v58 objectForKeyedSubscript:@"session-info"];
  id v61 = isNSString(v60);

  id v97 = v60;
  if (!v61)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 498, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Missing three drinks: %@", v53);

    goto LABEL_71;
  }
  v91 = v33;
  id v62 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v60 options:1];
  if (!v62)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 504, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Missing four drinks: %@", v53);

LABEL_61:
    id v96 = 0;
    goto LABEL_62;
  }
  uint64_t v63 = v129;
  id v96 = v62;
  nDYmeMqvWb(v63, (uint64_t)[v96 bytes], (int)[v96 length]);
  if (v64)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 510, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"NACKeyEstablishment failed: %d", v64);

LABEL_62:
    id v32 = 0;
    id v33 = 0;
    id v34 = 0;
    id v35 = 0;
    v31 = 0;
    v36 = 0;
LABEL_63:
    id v12 = v92;
    id v109 = v93;
LABEL_64:
    v29 = v91;
    goto LABEL_37;
  }
  v69 = +[NSUUID UUID];
  v36 = [(NSUUID *)v69 UUIDString];

  if (!v36)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 516, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create nonce.");

    id v32 = 0;
    id v33 = 0;
    id v34 = 0;
    id v35 = 0;
    v31 = 0;
    goto LABEL_63;
  }
  CFStringRef v130 = @"ReCertRandomness";
  v131 = v36;
  v31 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
  v70 = [(MobileRecertifyEngine *)self dark];
  id v119 = v54;
  id v32 = [(MobileRecertifyEngine *)self createRecertInfoWithDataArk:v70 alcoholBlob:v129 options:v31 error:&v119];
  id v71 = v119;

  if (!v32)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 524, @"com.apple.MobileActivation.ErrorDomain", -1, v71, @"Failed to create recert info.");

    id v33 = 0;
LABEL_87:
    id v34 = 0;
    id v35 = 0;
    goto LABEL_63;
  }
  id v117 = v71;
  id v118 = 0;
  char v72 = createActivationRequest(v32, &v118, 1, (NSError **)&v117);
  id v33 = (NSData *)v118;
  id v73 = v117;

  if ((v72 & 1) == 0)
  {
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 531, @"com.apple.MobileActivation.ErrorDomain", -1, v73, @"Failed to create recert request.");

    goto LABEL_87;
  }
  [(NSData *)v33 setURL:v105];
  [(NSData *)v33 setTimeoutInterval:v27];
  if (is_internal_build())
  {
    int v74 = formatURLRequest(v33);
    id v75 = copy_log_directory_path();
    id v76 = [v75 stringByAppendingPathComponent:@"recert_request.txt"];
    [(NSMutableString *)v74 writeToFile:v76 atomically:0 encoding:4 error:0];
  }
  id v115 = v73;
  id v116 = v93;
  id v34 = talkToServerWithError(v33, 0, 0, v106, &v116, &v126, &v115);
  id v109 = v116;

  id v94 = v115;
  if (is_internal_build())
  {
    v77 = formatURLResponse(v34, (uint64_t)v126, v109);
    id v78 = copy_log_directory_path();
    id v79 = [v78 stringByAppendingPathComponent:@"recert_response.txt"];
    [(NSMutableString *)v77 writeToFile:v79 atomically:0 encoding:4 error:0];
  }
  uint64_t v80 = (uint64_t)v126;
  if (v126 != (NSDictionary *)200)
  {
    if (v126)
    {
      v86 = +[NSHTTPURLResponse localizedStringForStatusCode:v126];
      v87 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 554, @"com.apple.MobileActivation.ServerErrorDomain", v80, v94, @"Server error: %ld (%@)", v80, v86);

      uint64_t v88 = (uint64_t)v126;
      v89 = +[NSHTTPURLResponse localizedStringForStatusCode:v126];
      id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 554, @"com.apple.MobileActivation.ErrorDomain", -6, v87, @"Server error: %ld (%@)", v88, v89);

      v90 = v94;
LABEL_94:

      id v35 = 0;
      goto LABEL_95;
    }
    v81 = @"Network communication error.";
    uint64_t v82 = 549;
LABEL_93:
    id v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", v82, @"com.apple.MobileActivation.ErrorDomain", -6, v94, v81);
    v90 = v94;
    goto LABEL_94;
  }
  if (!v34)
  {
    v81 = @"Failed to get response from server.";
    uint64_t v82 = 559;
    goto LABEL_93;
  }
  id v114 = v94;
  v83 = getRecertInfoFromData(v34, &v114);
  id v11 = (NSError *)v114;

  if (v83)
  {
    v84 = [(MobileRecertifyEngine *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3254779904;
    block[2] = __41__MobileRecertifyEngine_recertifyDevice___block_invoke;
    block[3] = &__block_descriptor_64_e8_32s40s48s56bs_e5_v8__0l;
    block[4] = self;
    id v35 = v83;
    id v111 = v35;
    v31 = v31;
    id v112 = v31;
    id v113 = v4;
    id v85 = v4;
    dispatch_async((dispatch_queue_t)v84, block);

    id v4 = 0;
LABEL_95:
    id v12 = v92;
    goto LABEL_64;
  }
  v95 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 568, @"com.apple.MobileActivation.ErrorDomain", -1, v11, @"Failed to retrieve recert info from data.");

  id v35 = 0;
  v29 = v91;
  id v12 = v92;
  id v11 = v95;
LABEL_37:
  if (v129) {
    IW1PcFszqNK(v129);
  }
  if (v128) {
    Be81a395Bf0(v128);
  }
  if (v4) {
    (*((void (**)(id, NSError *))v4 + 2))(v4, v11);
  }
}

void __41__MobileRecertifyEngine_recertifyDevice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dark];
  v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v7 = 0;
  handle_recert(v2, v3, v4, (NSError **)&v7);
  id v5 = v7;

  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

- (DataArk)dark
{
  return self->_dark;
}

- (void)setDark:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_dark, 0);
}

@end