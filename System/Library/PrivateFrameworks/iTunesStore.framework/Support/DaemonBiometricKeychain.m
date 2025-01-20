@interface DaemonBiometricKeychain
+ (id)sharedInstance;
+ (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5;
+ (void)createAttestationDataWithMessage:(id)a3 connection:(id)a4;
+ (void)createX509CertChainDataWithMessage:(id)a3 connection:(id)a4;
+ (void)deleteKeychainTokensWithMessage:(id)a3 connection:(id)a4;
+ (void)getPublicKeyDataWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)signDataUsingContextWithMessage:(id)a3 connection:(id)a4;
+ (void)signDataWithMessage:(id)a3 connection:(id)a4;
+ (void)x509CertChainDataWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_deleteKeychainTokensForAccountIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_deleteKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (BOOL)_generateKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (BOOL)_isDeviceUnlocked;
- (BOOL)deleteKeychainTokensForAccountIdentifier_:(id)a3 error:(id *)a4;
- (DaemonBiometricKeychain)init;
- (__SecAccessControl)copyAccessControlListForKey:(__SecKey *)a3 error:(id *)a4;
- (__SecAccessControl)copyAccessControlListForPrivateKeyWithBiometricAuthenticationContext:(id)a3 error:(id *)a4;
- (id)_amsCertificateLabelForPurpose:(int64_t)a3;
- (id)_amsKeychainLabelForPurpose:(int64_t)a3;
- (id)_constraintsForExtendedActions;
- (id)_constraintsForPurchase;
- (id)_copyPublicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)_createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)_createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)_presentPaymentSheetForChallenge:(id)a3 authContext:(id)a4 biometricContext:(id)a5 touchIDContext:(id)a6 touchIDOptions:(id)a7 accessControlRef:(__SecAccessControl *)a8 passwordToken:(id *)a9 paymentTokenData:(id *)a10 fpanID:(id *)a11 error:(id *)a12;
- (id)_publicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateKeys:(BOOL)a5 error:(id *)a6;
- (id)_queryForPrivateKeyWithLabel:(id)a3 prompt:(id)a4;
- (id)_queryForPrivateKeyWithLabel:(id)a3 prompt:(id)a4 useTokenID:(BOOL)a5;
- (id)_regenerateKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)_signData:(id)a3 context:(id)a4 error:(id *)a5;
- (id)createAttestationDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)createX509CertChainDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)publicKeyDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)publicKeyDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 regenerateKeys:(BOOL)a5 error:(id *)a6;
- (id)signDataWithKeychain:(id)a3 accountIdentifier:(id)a4 purpose:(int64_t)a5 localAuthContext:(id)a6 localAuthOptions:(id)a7 error:(id *)a8;
- (id)signData_:(id)a3 context:(id)a4 error:(id *)a5;
- (id)x509CertChainDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 error:(id *)a6;
@end

@implementation DaemonBiometricKeychain

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D07BC;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401DA0 != -1) {
    dispatch_once(&qword_100401DA0, block);
  }
  v2 = (void *)qword_100401D98;

  return v2;
}

- (DaemonBiometricKeychain)init
{
  v8.receiver = self;
  v8.super_class = (Class)DaemonBiometricKeychain;
  v2 = [(DaemonBiometricKeychain *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.DaemonBiometricKeychain", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstored.DaemonBiometricKeychain.X509", 0);
    dispatchQueueX509 = v2->_dispatchQueueX509;
    v2->_dispatchQueueX509 = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (id)createAttestationDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_1000D0C10;
  v45 = sub_1000D0C20;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_1000D0C10;
  v39 = sub_1000D0C20;
  id v40 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  dispatchQueue = self->_dispatchQueue;
  block = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_1000D0C28;
  v28 = &unk_1003A5FF8;
  v32 = &v41;
  v29 = self;
  id v11 = v8;
  v33 = &v35;
  int64_t v34 = a4;
  id v30 = v11;
  v12 = v9;
  v31 = v12;
  dispatch_async(dispatchQueue, &block);
  dispatch_time_t v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v12, v13);
  if (!v42[5] && !v36[5])
  {
    v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    unsigned int v16 = [v14 shouldLogToDisk];
    v17 = [v14 OSLogObject];
    v18 = v17;
    if (v16) {
      v15 |= 2u;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      v19 = objc_opt_class();
      int v47 = 138543618;
      v48 = v19;
      __int16 v49 = 2112;
      id v50 = v11;
      id v20 = v19;
      LODWORD(v24) = 22;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_13:

        goto LABEL_14;
      }
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v47, v24, block, v26, v27, v28, v29, v30);
      free(v21);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (a5) {
    *a5 = (id) v36[5];
  }
  id v22 = (id)v42[5];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v22;
}

- (id)createX509CertChainDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_1000D0C10;
  id v46 = sub_1000D0C20;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_1000D0C10;
  id v40 = sub_1000D0C20;
  id v41 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  dispatchQueue = self->_dispatchQueue;
  block = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_1000D13E0;
  v29 = &unk_1003A5FF8;
  v33 = &v42;
  id v30 = self;
  id v11 = v8;
  int64_t v34 = &v36;
  int64_t v35 = a4;
  id v31 = v11;
  v12 = v9;
  v32 = v12;
  dispatch_async(dispatchQueue, &block);
  dispatch_time_t v13 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    unsigned int v16 = [v14 shouldLogToDisk];
    v17 = [v14 OSLogObject];
    v18 = v17;
    if (v16) {
      v15 |= 2u;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      id v19 = (id)objc_opt_class();
      id v20 = +[NSNumber numberWithInteger:a4];
      int v48 = 138543874;
      id v49 = v19;
      __int16 v50 = 2112;
      id v51 = v11;
      __int16 v52 = 2114;
      v53 = v20;
      LODWORD(v25) = 32;
      uint64_t v24 = &v48;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v48, v25, block, v27, v28, v29, v30, v31);
      free(v21);
      uint64_t v24 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_13:
  if (a5) {
    *a5 = (id) v37[5];
  }
  id v22 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v43[5], v24);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v22;
}

- (BOOL)deleteKeychainTokensForAccountIdentifier_:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_1000D0C10;
  v23 = sub_1000D0C20;
  id v24 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D15FC;
  block[3] = &unk_1003A6020;
  v17 = &v25;
  block[4] = self;
  id v9 = v6;
  id v15 = v9;
  v18 = &v19;
  v10 = v7;
  unsigned int v16 = v10;
  dispatch_async(dispatchQueue, block);
  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v10, v11);
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v12 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (id)publicKeyDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  return [(DaemonBiometricKeychain *)self publicKeyDataForAccountIdentifier_:a3 purpose:a4 regenerateKeys:1 error:a5];
}

- (id)publicKeyDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 regenerateKeys:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_1000D0C10;
  id v46 = sub_1000D0C20;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_1000D0C10;
  id v40 = sub_1000D0C20;
  id v41 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  char v12 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D1A64;
  block[3] = &unk_1003A6048;
  v32 = &v42;
  block[4] = self;
  id v13 = v10;
  v33 = &v36;
  int64_t v34 = a4;
  BOOL v35 = a5;
  id v30 = v13;
  v14 = v11;
  id v31 = v14;
  dispatch_async(v12, block);

  dispatch_time_t v15 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v14, v15);
  if (!v43[5] && !v37[5])
  {
    unsigned int v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      unsigned int v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    unsigned int v18 = [v16 shouldLogToDisk];
    uint64_t v19 = [v16 OSLogObject];
    id v20 = v19;
    if (v18) {
      v17 |= 2u;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v21 = objc_opt_class();
      int v48 = 138543618;
      id v49 = v21;
      __int16 v50 = 2112;
      id v51 = v13;
      id v22 = v21;
      LODWORD(v28) = 22;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_13:

        uint64_t v24 = SSError();
        uint64_t v25 = (void *)v37[5];
        v37[5] = v24;

        goto LABEL_14;
      }
      id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v48, v28);
      free(v23);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (a6) {
    *a6 = (id) v37[5];
  }
  id v26 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v26;
}

- (id)signData_:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = sub_1000D0C10;
  id v47 = sub_1000D0C20;
  id v48 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = sub_1000D0C10;
  id v41 = sub_1000D0C20;
  id v42 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v11 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  v29 = sub_1000D1EC8;
  id v30 = &unk_1003A6070;
  BOOL v35 = &v43;
  id v31 = self;
  id v12 = v8;
  id v32 = v12;
  id v13 = v9;
  id v33 = v13;
  uint64_t v36 = &v37;
  v14 = v10;
  int64_t v34 = v14;
  dispatch_async(v11, &block);

  dispatch_time_t v15 = dispatch_time(0, 180000000000);
  dispatch_semaphore_wait(v14, v15);
  if (!v44[5] && !v38[5])
  {
    unsigned int v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      unsigned int v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    unsigned int v18 = [v16 shouldLogToDisk];
    uint64_t v19 = [v16 OSLogObject];
    id v20 = v19;
    if (v18) {
      v17 |= 2u;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      id v21 = (id)objc_opt_class();
      id v22 = [v13 accountIdentifier];
      int v49 = 138543618;
      id v50 = v21;
      __int16 v51 = 2112;
      __int16 v52 = v22;
      LODWORD(v26) = 22;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v49, v26, block, v28, v29, v30, v31, v32, v33);
      free(v23);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (a5) {
    *a5 = (id) v38[5];
  }
  id v24 = (id)v44[5];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v24;
}

- (id)x509CertChainDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 error:(id *)a6
{
  BOOL v72 = a5;
  id v7 = a3;
  CFTypeRef v76 = 0;
  CFTypeRef result = 0;
  id v8 = +[ISBiometricStore keychainLabelForKeyWithAccountID:v7 purpose:a4];
  if (!v8)
  {
    uint64_t v39 = +[SSLogConfig sharedDaemonConfig];
    if (!v39)
    {
      uint64_t v39 = +[SSLogConfig sharedConfig];
    }
    unsigned int v40 = [v39 shouldLog];
    if ([v39 shouldLogToDisk]) {
      v40 |= 2u;
    }
    id v41 = [v39 OSLogObject];
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      v40 &= 2u;
    }
    if (v40)
    {
      id v42 = objc_opt_class();
      id v43 = v42;
      uint64_t v44 = +[NSNumber numberWithInteger:a4];
      int v78 = 138412802;
      v79 = v42;
      __int16 v80 = 2112;
      id v81 = v7;
      __int16 v82 = 2112;
      v83 = v44;
      LODWORD(v65) = 32;
      v63 = &v78;
      uint64_t v45 = (void *)_os_log_send_and_compose_impl();

      if (v45)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4, &v78, v65);
        id v46 = (int *)objc_claimAutoreleasedReturnValue();
        free(v45);
        v63 = v46;
        SSFileLog();
      }
    }
    else
    {
    }
    goto LABEL_40;
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_semaphore_t v10 = +[NSString stringWithFormat:@"%@-cert", v8];
  CFStringRef v11 = kSecAttrLabel;
  [v9 setObject:v10 forKeyedSubscript:kSecAttrLabel];

  CFStringRef v12 = kSecClassCertificate;
  CFStringRef v13 = kSecClass;
  [v9 setObject:kSecClassCertificate forKeyedSubscript:kSecClass];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue);
  uint64_t v14 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  if (v14)
  {
    uint64_t v15 = v14;
    unsigned int v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      unsigned int v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      v17 |= 2u;
    }
    unsigned int v18 = [v16 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      id v19 = v9;
      id v20 = objc_opt_class();
      v68 = v8;
      id v66 = v20;
      id v21 = +[NSNumber numberWithInteger:a4];
      id v22 = +[NSNumber numberWithInt:v15];
      int v78 = 138544130;
      v79 = v20;
      id v9 = v19;
      __int16 v80 = 2112;
      id v81 = v7;
      __int16 v82 = 2114;
      v83 = v21;
      __int16 v84 = 2114;
      v85 = v22;
      LODWORD(v65) = 42;
      v63 = &v78;
      v23 = (void *)_os_log_send_and_compose_impl();

      id v8 = v68;
      if (!v23)
      {
LABEL_13:

        CFStringRef v12 = kSecClassCertificate;
        CFStringRef v11 = kSecAttrLabel;
        CFStringRef v13 = kSecClass;
        goto LABEL_14;
      }
      unsigned int v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v78, v65);
      free(v23);
      v63 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  id v24 = objc_alloc_init((Class)NSMutableDictionary);
  [v24 setObject:ISBiometricsIntermediateCertKeychainLabel forKeyedSubscript:v11];
  [v24 setObject:v12 forKeyedSubscript:v13];
  [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnRef];
  uint64_t v25 = SecItemCopyMatching((CFDictionaryRef)v24, &v76);
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = +[SSLogConfig sharedDaemonConfig];
    if (!v27)
    {
      uint64_t v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = objc_msgSend(v27, "shouldLog", v63);
    if ([v27 shouldLogToDisk]) {
      v28 |= 2u;
    }
    v29 = [v27 OSLogObject];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      v28 &= 2u;
    }
    if (v28)
    {
      v69 = v8;
      id v71 = v7;
      id v30 = objc_opt_class();
      id v67 = v30;
      id v31 = +[NSNumber numberWithInteger:a4];
      id v32 = +[NSNumber numberWithInt:v26];
      int v78 = 138544130;
      v79 = v30;
      __int16 v80 = 2112;
      id v8 = v69;
      id v81 = v71;
      __int16 v82 = 2114;
      v83 = v31;
      __int16 v84 = 2114;
      v85 = v32;
      LODWORD(v65) = 42;
      v63 = &v78;
      id v33 = (void *)_os_log_send_and_compose_impl();

      id v7 = v71;
      if (!v33)
      {
LABEL_25:

        goto LABEL_26;
      }
      v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v78, v65);
      free(v33);
      v63 = (int *)v29;
      SSFileLog();
    }

    goto LABEL_25;
  }
LABEL_26:

  if (result && v76)
  {
    id v34 = objc_alloc_init((Class)NSMutableArray);
    CFDataRef v35 = SecCertificateCopyData((SecCertificateRef)result);
    [v34 addObject:v35];

    CFDataRef v36 = SecCertificateCopyData((SecCertificateRef)v76);
    [v34 addObject:v36];

    id v37 = [v34 copy];
    uint64_t v38 = 0;
    goto LABEL_65;
  }
LABEL_40:
  if (!v72)
  {
    uint64_t v38 = 0;
    id v37 = 0;
    goto LABEL_66;
  }
  id v47 = +[SSLogConfig sharedDaemonConfig];
  if (!v47)
  {
    id v47 = +[SSLogConfig sharedConfig];
  }
  unsigned int v48 = objc_msgSend(v47, "shouldLog", v63);
  if ([v47 shouldLogToDisk]) {
    v48 |= 2u;
  }
  int v49 = [v47 OSLogObject];
  if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
    v48 &= 2u;
  }
  if (!v48) {
    goto LABEL_50;
  }
  id v50 = objc_opt_class();
  id v51 = v50;
  __int16 v52 = +[NSNumber numberWithInteger:a4];
  int v78 = 138543874;
  v79 = v50;
  __int16 v80 = 2112;
  id v81 = v7;
  __int16 v82 = 2114;
  v83 = v52;
  LODWORD(v65) = 32;
  v64 = &v78;
  v53 = (void *)_os_log_send_and_compose_impl();

  if (v53)
  {
    int v49 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, &v78, v65);
    free(v53);
    v64 = (int *)v49;
    SSFileLog();
LABEL_50:
  }
  id v75 = 0;
  id v37 = [(DaemonBiometricKeychain *)self createX509CertChainDataForAccountIdentifier_:v7 purpose:a4 error:&v75];
  id v54 = v75;
  uint64_t v38 = v54;
  if (!v37 || v54)
  {
    id v34 = +[SSLogConfig sharedDaemonConfig];
    if (!v34)
    {
      id v34 = +[SSLogConfig sharedConfig];
    }
    unsigned int v55 = [v34 shouldLog];
    if ([v34 shouldLogToDisk]) {
      v55 |= 2u;
    }
    v56 = [v34 OSLogObject];
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      v55 &= 2u;
    }
    if (v55)
    {
      v70 = v8;
      v57 = objc_opt_class();
      id v58 = v57;
      v59 = +[NSNumber numberWithInteger:a4];
      int v78 = 138544130;
      v79 = v57;
      __int16 v80 = 2112;
      id v81 = v7;
      __int16 v82 = 2114;
      v83 = v59;
      __int16 v84 = 2114;
      v85 = v38;
      LODWORD(v65) = 42;
      v60 = (void *)_os_log_send_and_compose_impl();

      if (!v60)
      {
        id v8 = v70;
        goto LABEL_65;
      }
      v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v60, 4, &v78, v65);
      free(v60);
      SSFileLog();
      id v8 = v70;
    }

LABEL_65:
  }
LABEL_66:
  if (a6) {
    *a6 = v38;
  }
  id v61 = v37;

  return v61;
}

- (__SecAccessControl)copyAccessControlListForKey:(__SecKey *)a3 error:(id *)a4
{
  CFDictionaryRef v5 = SecKeyCopyAttributes(a3);
  if (!v5)
  {
    unsigned int v18 = +[SSLogConfig sharedDaemonConfig];
    if (!v18)
    {
      unsigned int v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    id v21 = [v18 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      v20 &= 2u;
    }
    if (v20)
    {
      LODWORD(v25) = 138543362;
      *(void *)((char *)&v25 + 4) = objc_opt_class();
      id v22 = *(id *)((char *)&v25 + 4);
      LODWORD(v24) = 12;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23) {
        goto LABEL_31;
      }
      id v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v25, v24, v25);
      free(v23);
      SSFileLog();
    }

LABEL_31:
    dispatch_semaphore_t v10 = 0;
    if (!a4) {
      return v10;
    }
    goto LABEL_18;
  }
  CFDictionaryRef v6 = v5;
  Value = CFDictionaryGetValue(v5, kSecAttrAccessControl);
  if (Value)
  {
    id v8 = Value;
    CFTypeID TypeID = SecAccessControlGetTypeID();
    if (TypeID == CFGetTypeID(v8))
    {
      dispatch_semaphore_t v10 = (__SecAccessControl *)CFRetain(v8);
      goto LABEL_17;
    }
  }
  CFStringRef v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    CFStringRef v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  uint64_t v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_15;
  }
  LODWORD(v25) = 138543362;
  *(void *)((char *)&v25 + 4) = objc_opt_class();
  id v15 = *(id *)((char *)&v25 + 4);
  LODWORD(v24) = 12;
  unsigned int v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v25, v24, v25);
    free(v16);
    SSFileLog();
LABEL_15:
  }
  dispatch_semaphore_t v10 = 0;
LABEL_17:
  CFRelease(v6);
  if (a4) {
LABEL_18:
  }
    *a4 = 0;
  return v10;
}

- (__SecAccessControl)copyAccessControlListForPrivateKeyWithBiometricAuthenticationContext:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  id v6 = a3;
  id v7 = [v6 accountIdentifier];
  unsigned int v8 = [v6 isExtendedAction];

  uint64_t v9 = v8;
  dispatch_semaphore_t v10 = +[ISBiometricStore keychainLabelForAccountID:v7 purpose:v8];
  v37[0] = kSecClass;
  v37[1] = kSecAttrKeyClass;
  v38[0] = kSecClassKey;
  v38[1] = kSecAttrKeyClassPrivate;
  v37[2] = kSecAttrLabel;
  v37[3] = kSecReturnRef;
  v38[2] = v10;
  v38[3] = &__kCFBooleanTrue;
  CFDictionaryRef v11 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
  uint64_t v12 = SecItemCopyMatching(v11, &result);
  if (v12 == -25300)
  {
    id v13 = [(__CFDictionary *)v11 mutableCopy];
    uint64_t v14 = [(DaemonBiometricKeychain *)self _amsKeychainLabelForPurpose:v9];
    [v13 setObject:v14 forKeyedSubscript:kSecAttrLabel];

    uint64_t v12 = SecItemCopyMatching((CFDictionaryRef)v13, &result);
  }
  if (v12)
  {
    id v15 = SSError();
    unsigned int v16 = +[NSNumber numberWithInt:v12];
    SSErrorBySettingUserInfoValue();
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    unsigned int v18 = +[SSLogConfig sharedDaemonConfig];
    if (!v18)
    {
      unsigned int v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    id v21 = [v18 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      v20 &= 2u;
    }
    if (!v20) {
      goto LABEL_15;
    }
    id v22 = objc_opt_class();
    int v33 = 138543618;
    id v34 = v22;
    __int16 v35 = 2114;
    id v36 = v17;
    id v23 = v22;
    LODWORD(v30) = 22;
LABEL_13:
    uint64_t v24 = (void *)_os_log_send_and_compose_impl();

    if (!v24)
    {
LABEL_16:

      long long v25 = 0;
      goto LABEL_19;
    }
    id v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v33, v30);
    free(v24);
    SSFileLog();
LABEL_15:

    goto LABEL_16;
  }
  if (!result)
  {
    SSError();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v18 = +[SSLogConfig sharedDaemonConfig];
    if (!v18)
    {
      unsigned int v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    id v21 = [v18 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      v28 &= 2u;
    }
    if (!v28) {
      goto LABEL_15;
    }
    v29 = objc_opt_class();
    int v33 = 138543362;
    id v34 = v29;
    id v23 = v29;
    LODWORD(v30) = 12;
    goto LABEL_13;
  }
  id v31 = 0;
  long long v25 = [(DaemonBiometricKeychain *)self copyAccessControlListForKey:result error:&v31];
  id v17 = v31;
LABEL_19:
  if (result) {
    CFRelease(result);
  }
  if (a4) {
    *a4 = v17;
  }

  return v25;
}

- (id)signDataWithKeychain:(id)a3 accountIdentifier:(id)a4 purpose:(int64_t)a5 localAuthContext:(id)a6 localAuthOptions:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  id v66 = sub_1000D0C10;
  id v67 = sub_1000D0C20;
  id v68 = 0;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = sub_1000D0C10;
  id v61 = sub_1000D0C20;
  id v62 = 0;
  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000D3570;
  v43[3] = &unk_1003A6098;
  int64_t v52 = a5;
  id v18 = v14;
  id v44 = v18;
  id v19 = v15;
  id v45 = v19;
  id v46 = self;
  int v49 = &v57;
  id v20 = v13;
  id v47 = v20;
  id v50 = &v53;
  id v51 = &v63;
  id v21 = v16;
  id v22 = v17;
  unsigned int v48 = v22;
  [v19 evaluatePolicy:1 options:v16 reply:v43];
  dispatch_time_t v23 = dispatch_time(0, 180000000000);
  dispatch_semaphore_wait(v22, v23);
  if (!v64[5] && !v58[5])
  {
    uint64_t v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24)
    {
      uint64_t v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v24 shouldLog];
    unsigned int v26 = [v24 shouldLogToDisk];
    unsigned int v40 = v24;
    id v41 = v21;
    unsigned int v27 = [v24 OSLogObject];
    int v28 = v27;
    if (v26) {
      int v29 = v25 | 2;
    }
    else {
      int v29 = v25;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      int v30 = v29;
    }
    else {
      int v30 = v29 & 2;
    }
    id v31 = v28;
    if (v30)
    {
      id v32 = v40;
      id v21 = v41;
      id v39 = (id)objc_opt_class();
      int v33 = +[NSNumber numberWithInteger:a5];
      int v69 = 138543874;
      id v70 = v39;
      __int16 v71 = 2112;
      id v72 = v18;
      __int16 v73 = 2114;
      v74 = v33;
      LODWORD(v38) = 32;
      id v34 = (void *)_os_log_send_and_compose_impl();

      if (!v34)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v69, v38);
      free(v34);
      SSFileLog();
    }
    else
    {
      id v32 = v40;
      id v21 = v41;
    }

    goto LABEL_16;
  }
LABEL_17:
  __int16 v35 = (const void *)v54[3];
  if (v35) {
    CFRelease(v35);
  }
  if (a8) {
    *a8 = (id) v58[5];
  }
  id v36 = (id)v64[5];

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);

  return v36;
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"createAttestationDataWithMessage:connection:" forMessage:179];
  [v4 addObserver:a1 selector:"createX509CertChainDataWithMessage:connection:" forMessage:204];
  [v4 addObserver:a1 selector:"deleteKeychainTokensWithMessage:connection:" forMessage:185];
  [v4 addObserver:a1 selector:"getPublicKeyDataWithMessage:connection:" forMessage:180];
  [v4 addObserver:a1 selector:"signDataWithMessage:connection:" forMessage:181];
  [v4 addObserver:a1 selector:"signDataUsingContextWithMessage:connection:" forMessage:192];
  [v4 addObserver:a1 selector:"x509CertChainDataWithMessage:connection:" forMessage:205];
}

+ (void)createAttestationDataWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D4FD4;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)createX509CertChainDataWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D51C4;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)deleteKeychainTokensWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D53B4;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getPublicKeyDataWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D5580;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)signDataWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D5790;
  v8[3] = &unk_1003A60E8;
  id v9 = a3;
  id v10 = a4;
  id v11 = a1;
  id v6 = v10;
  id v7 = v9;
  [a1 _handleMessage:v7 connection:v6 withReplyBlock:v8];
}

+ (void)signDataUsingContextWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D5CC8;
  v8[3] = &unk_1003A60E8;
  id v9 = a3;
  id v10 = a4;
  id v11 = a1;
  id v6 = v10;
  id v7 = v9;
  [a1 _handleMessage:v7 connection:v6 withReplyBlock:v8];
}

+ (void)x509CertChainDataWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D61B4;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

- (id)_amsCertificateLabelForPurpose:(int64_t)a3
{
  CFStringRef v3 = @"com.apple.AppleMediaServices.cert.X509.client.extended";
  if (a3 != 1) {
    CFStringRef v3 = 0;
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"com.apple.AppleMediaServices.cert.X509.client.primary";
  }
}

- (id)_amsKeychainLabelForPurpose:(int64_t)a3
{
  unsigned int v4 = +[ISBiometricStore shouldUseX509];
  if (a3 == 1)
  {
    CFDictionaryRef v5 = @"com.apple.AppleMediaServices.extendedKey";
    CFStringRef v6 = @"com.apple.AppleMediaServices.cert.X509.extended";
  }
  else
  {
    if (a3)
    {
      id v7 = 0;
      goto LABEL_9;
    }
    CFDictionaryRef v5 = @"com.apple.AppleMediaServices.primaryKey";
    CFStringRef v6 = @"com.apple.AppleMediaServices.cert.X509.primary";
  }
  if (v4) {
    CFDictionaryRef v5 = (__CFString *)v6;
  }
  id v7 = v5;
LABEL_9:

  return v7;
}

+ (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D64E0;
  v15[3] = &unk_1003A6110;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v19 = a1;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (BOOL)_isDeviceUnlocked
{
  v2 = (uint64_t (*)(void))ISWeakLinkedSymbolForString();
  int v3 = v2(0);
  int v4 = v3;
  if (v3) {
    BOOL v5 = v3 == 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return !v4 || v4 == 3;
  }
  CFStringRef v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    CFStringRef v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_15;
  }
  LODWORD(v15) = 138543362;
  *(void *)((char *)&v15 + 4) = objc_opt_class();
  id v10 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  id v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v14, v15);
    free(v11);
    SSFileLog();
LABEL_15:
  }
  return !v4 || v4 == 3;
}

- (id)_constraintsForExtendedActions
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v13 = @"pbioc";
  int v4 = objc_opt_new();
  uint64_t v14 = v4;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v3 setObject:v5 forKeyedSubscript:@"cbio"];

  [v3 setObject:&off_1003C91B0 forKeyedSubscript:@"pmuc"];
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v11 = @"pbioc";
  unsigned int v7 = objc_opt_new();
  id v12 = v7;
  int v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v6 setObject:v8 forKeyedSubscript:@"cbio"];

  [v6 setObject:&off_1003C91B0 forKeyedSubscript:@"pmuc"];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"oa"];
  [v2 setObject:v3 forKeyedSubscript:@"ock"];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"odel"];
  [v2 setObject:v6 forKeyedSubscript:@"osgn"];
  id v9 = +[NSDictionary dictionaryWithDictionary:v2];

  return v9;
}

- (id)_constraintsForPurchase
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setObject:&off_1003C91E0 forKeyedSubscript:@"pkofn"];
  [v2 setObject:&off_1003C91E0 forKeyedSubscript:@"pmuc"];
  v23[0] = @"pbioc";
  id v3 = objc_opt_new();
  v23[1] = @"pbiot";
  v24[0] = v3;
  v24[1] = &off_1003C91E0;
  int v4 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v2 setObject:v4 forKeyedSubscript:@"cbio"];

  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"cbtn"];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:&off_1003C91B0 forKeyedSubscript:@"pkofn"];
  [v5 setObject:&off_1003C91E0 forKeyedSubscript:@"pmuc"];
  v21[0] = @"pbioc";
  id v6 = objc_opt_new();
  v21[1] = @"pbiot";
  v22[0] = v6;
  v22[1] = &off_1003C91B0;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v5 setObject:v7 forKeyedSubscript:@"cbio"];

  [v5 setObject:v2 forKeyedSubscript:@"ckon"];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:&off_1003C91E0 forKeyedSubscript:@"pkofn"];
  [v8 setObject:&off_1003C91E0 forKeyedSubscript:@"pmuc"];
  v19[0] = @"pbioc";
  id v9 = objc_opt_new();
  v19[1] = @"pbiot";
  v20[0] = v9;
  v20[1] = &off_1003C91E0;
  id v10 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v8 setObject:v10 forKeyedSubscript:@"cbio"];

  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"cbtn"];
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setObject:&off_1003C91B0 forKeyedSubscript:@"pkofn"];
  [v11 setObject:&off_1003C91B0 forKeyedSubscript:@"pmoc"];
  [v11 setObject:&off_1003C91E0 forKeyedSubscript:@"pmuc"];
  v17[0] = @"pbioc";
  id v12 = objc_opt_new();
  v17[1] = @"pbiot";
  v18[0] = v12;
  v18[1] = &off_1003C91B0;
  CFStringRef v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v11 setObject:v13 forKeyedSubscript:@"cbio"];

  [v11 setObject:v8 forKeyedSubscript:@"ckon"];
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"oa"];
  [v14 setObject:v5 forKeyedSubscript:@"ock"];
  [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"odel"];
  [v14 setObject:v11 forKeyedSubscript:@"osgn"];
  long long v15 = +[NSDictionary dictionaryWithDictionary:v14];

  return v15;
}

- (id)_copyPublicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  CFTypeRef result = 0;
  CFTypeRef cf = 0;
  CFErrorRef error = 0;
  +[NSString stringWithFormat:@"%@", v7];
  v134 = v133 = v7;
  int64_t v135 = a4;
  id v8 = +[ISBiometricStore keychainLabelForCertWithAccountID:v7 purpose:a4];
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  [v9 setObject:v8 forKeyedSubscript:kSecAttrLabel];
  [v9 setObject:kSecClassCertificate forKeyedSubscript:kSecClass];
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnRef];
  uint64_t v10 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  id v11 = &syslog_ptr;
  if (v10 == -25300 || (v12 = v10, (CFStringRef v13 = (__SecCertificate *)result) == 0))
  {
    id v14 = [(DaemonBiometricKeychain *)self _amsCertificateLabelForPurpose:a4];

    [v9 setObject:v14 forKeyedSubscript:kSecAttrLabel];
    long long v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      long long v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      v16 |= 2u;
    }
    id v17 = [v15 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      id v18 = objc_opt_class();
      int v139 = 138543618;
      v140 = v18;
      __int16 v141 = 2114;
      v142 = v14;
      id v19 = v18;
      LODWORD(v124) = 22;
      v121 = &v139;
      id v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_14:

        uint64_t v12 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
        CFStringRef v13 = (__SecCertificate *)result;
        goto LABEL_15;
      }
      id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v139, v124);
      free(v20);
      v121 = (int *)v17;
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v14 = v8;
LABEL_15:
  v132 = v9;
  if (v12 == -25300 || !v13)
  {
    id v37 = +[SSLogConfig sharedDaemonConfig];
    if (!v37)
    {
      id v37 = +[SSLogConfig sharedConfig];
    }
    unsigned int v38 = [v37 shouldLog];
    if ([v37 shouldLogToDisk]) {
      v38 |= 2u;
    }
    id v39 = [v37 OSLogObject];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
      int v40 = v38;
    }
    else {
      int v40 = v38 & 2;
    }
    v129 = self;
    if (v40)
    {
      id v41 = objc_opt_class();
      id v42 = v41;
      id v43 = SSHashIfNeeded();
      id v44 = +[NSNumber numberWithInteger:v135];
      int v139 = 138543874;
      v140 = v41;
      id v11 = &syslog_ptr;
      __int16 v141 = 2112;
      v142 = v43;
      __int16 v143 = 2114;
      CFErrorRef v144 = v44;
      LODWORD(v124) = 32;
      v122 = &v139;
      id v45 = (void *)_os_log_send_and_compose_impl();

      self = v129;
      id v46 = &syslog_ptr;
      if (!v45) {
        goto LABEL_40;
      }
      id v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4, &v139, v124);
      free(v45);
      v122 = (int *)v39;
      SSFileLog();
    }
    else
    {
      id v46 = &syslog_ptr;
    }

LABEL_40:
    uint64_t v47 = [v46[239] keychainLabelForAccountID:v133 purpose:v135];

    CFDictionaryRef v23 = [(DaemonBiometricKeychain *)self _queryForPrivateKeyWithLabel:v47 prompt:0];
    unsigned int v48 = [v11[405] sharedDaemonConfig];
    if (!v48)
    {
      unsigned int v48 = [v11[405] sharedConfig];
    }
    v125 = (void *)v47;
    unsigned int v49 = objc_msgSend(v48, "shouldLog", v122);
    if ([v48 shouldLogToDisk]) {
      v49 |= 2u;
    }
    id v50 = [v48 OSLogObject];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      int v51 = v49;
    }
    else {
      int v51 = v49 & 2;
    }
    if (v51)
    {
      int64_t v52 = objc_opt_class();
      id v53 = v52;
      id v54 = SSHashIfNeeded();
      uint64_t v55 = +[NSNumber numberWithInteger:v135];
      int v139 = 138543874;
      v140 = v52;
      __int16 v141 = 2112;
      v142 = v54;
      __int16 v143 = 2114;
      CFErrorRef v144 = v55;
      LODWORD(v124) = 32;
      v123 = &v139;
      uint64_t v56 = (void *)_os_log_send_and_compose_impl();

      id v11 = &syslog_ptr;
      if (!v56) {
        goto LABEL_51;
      }
      id v50 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v56, 4, &v139, v124);
      free(v56);
      v123 = (int *)v50;
      SSFileLog();
    }

LABEL_51:
    uint64_t v57 = SecItemCopyMatching(v23, &cf);
    id v58 = [v11[405] sharedDaemonConfig];
    if (!v58)
    {
      id v58 = [v11[405] sharedConfig];
    }
    unsigned int v59 = objc_msgSend(v58, "shouldLog", v123);
    if ([v58 shouldLogToDisk]) {
      v59 |= 2u;
    }
    v60 = [v58 OSLogObject];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
      int v61 = v59;
    }
    else {
      int v61 = v59 & 2;
    }
    CFDictionaryRef v127 = v23;
    id v62 = v129;
    if (v61)
    {
      uint64_t v63 = objc_opt_class();
      id v64 = v63;
      uint64_t v65 = SSHashIfNeeded();
      id v66 = +[NSNumber numberWithInteger:v135];
      int v139 = 138543874;
      v140 = v63;
      __int16 v141 = 2112;
      v142 = v65;
      __int16 v143 = 2114;
      CFErrorRef v144 = v66;
      LODWORD(v124) = 32;
      v121 = &v139;
      id v67 = (void *)_os_log_send_and_compose_impl();

      CFDictionaryRef v23 = v127;
      id v62 = v129;

      if (!v67)
      {
LABEL_62:

        if (v57 != -25300 && cf)
        {
          if (v57) {
            goto LABEL_65;
          }
          goto LABEL_86;
        }
        __int16 v80 = -[DaemonBiometricKeychain _amsKeychainLabelForPurpose:](v62, "_amsKeychainLabelForPurpose:", v135, v121);
        id v81 = [(__CFDictionary *)v23 mutableCopy];
        [v81 setObject:v80 forKeyedSubscript:kSecAttrLabel];
        __int16 v82 = +[SSLogConfig sharedDaemonConfig];
        if (!v82)
        {
          __int16 v82 = +[SSLogConfig sharedConfig];
        }
        unsigned int v83 = [v82 shouldLog];
        if ([v82 shouldLogToDisk]) {
          v83 |= 2u;
        }
        __int16 v84 = [v82 OSLogObject];
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT)) {
          v83 &= 2u;
        }
        if (v83)
        {
          v85 = objc_opt_class();
          int v139 = 138543618;
          v140 = v85;
          __int16 v141 = 2114;
          v142 = v80;
          id v86 = v85;
          LODWORD(v124) = 22;
          v121 = &v139;
          v87 = (void *)_os_log_send_and_compose_impl();

          if (!v87) {
            goto LABEL_85;
          }
          __int16 v84 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v87, 4, &v139, v124);
          free(v87);
          v121 = (int *)v84;
          SSFileLog();
        }

LABEL_85:
        uint64_t v57 = SecItemCopyMatching((CFDictionaryRef)v81, &cf);

        if (v57)
        {
LABEL_65:
          id v68 = SSError();
          int v69 = +[NSNumber numberWithInt:v57];
          SSErrorBySettingUserInfoValue();
          id v36 = (__CFError *)objc_claimAutoreleasedReturnValue();

          unsigned int v25 = +[SSLogConfig sharedDaemonConfig];
          if (!v25)
          {
            unsigned int v25 = +[SSLogConfig sharedConfig];
          }
          unsigned int v70 = [v25 shouldLog];
          if ([v25 shouldLogToDisk]) {
            int v71 = v70 | 2;
          }
          else {
            int v71 = v70;
          }
          id v72 = [v25 OSLogObject];
          if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
            v71 &= 2u;
          }
          if (v71)
          {
            __int16 v73 = objc_opt_class();
            id v74 = v73;
            id v75 = SSHashIfNeeded();
            CFTypeRef v76 = +[NSNumber numberWithInteger:v135];
            v77 = +[NSNumber numberWithInt:v57];
            int v139 = 138544130;
            v140 = v73;
            __int16 v141 = 2112;
            v142 = v75;
            __int16 v143 = 2114;
            CFErrorRef v144 = v76;
            __int16 v145 = 2114;
            v146 = v77;
            LODWORD(v124) = 42;
            uint64_t v78 = _os_log_send_and_compose_impl();

            if (v78)
            {
              id v72 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v78, 4, &v139, v124);
              v79 = (void *)v78;
LABEL_146:
              free(v79);
              SSFileLog();
              __int16 v35 = a5;
              CFDictionaryRef v23 = v127;
LABEL_148:
              id v14 = v125;

              id v31 = 0;
              CFDataRef v32 = 0;
              CFDataRef v33 = 0;
              LOBYTE(v34) = 1;
              goto LABEL_166;
            }
            goto LABEL_149;
          }
LABEL_147:
          __int16 v35 = a5;
          goto LABEL_148;
        }
LABEL_86:
        if (cf)
        {
          SecKeyRef v88 = SecKeyCopyPublicKey((SecKeyRef)cf);
          if (v88)
          {
            id v31 = v88;

            goto LABEL_91;
          }
          SSError();
          id v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
          unsigned int v25 = +[SSLogConfig sharedDaemonConfig];
          if (!v25)
          {
            unsigned int v25 = +[SSLogConfig sharedConfig];
          }
          unsigned int v109 = [v25 shouldLog];
          if ([v25 shouldLogToDisk]) {
            int v110 = v109 | 2;
          }
          else {
            int v110 = v109;
          }
          id v72 = [v25 OSLogObject];
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
            int v111 = v110;
          }
          else {
            int v111 = v110 & 2;
          }
          if (!v111) {
            goto LABEL_147;
          }
        }
        else
        {
          SSError();
          id v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
          unsigned int v25 = +[SSLogConfig sharedDaemonConfig];
          if (!v25)
          {
            unsigned int v25 = +[SSLogConfig sharedConfig];
          }
          unsigned int v99 = [v25 shouldLog];
          if ([v25 shouldLogToDisk]) {
            int v100 = v99 | 2;
          }
          else {
            int v100 = v99;
          }
          id v72 = [v25 OSLogObject];
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
            int v101 = v100;
          }
          else {
            int v101 = v100 & 2;
          }
          if (!v101) {
            goto LABEL_147;
          }
        }
        v112 = objc_opt_class();
        id v113 = v112;
        v114 = SSHashIfNeeded();
        v115 = +[NSNumber numberWithInteger:v135];
        int v139 = 138543874;
        v140 = v112;
        __int16 v141 = 2112;
        v142 = v114;
        __int16 v143 = 2114;
        CFErrorRef v144 = v115;
        LODWORD(v124) = 32;
        uint64_t v116 = _os_log_send_and_compose_impl();

        if (v116)
        {
          id v72 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v116, 4, &v139, v124);
          v79 = (void *)v116;
          goto LABEL_146;
        }
LABEL_149:
        id v31 = 0;
        CFDataRef v32 = 0;
        CFDataRef v33 = 0;
        LOBYTE(v34) = 1;
        __int16 v35 = a5;
        CFDictionaryRef v23 = v127;
        goto LABEL_165;
      }
      v60 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v67, 4, &v139, v124);
      free(v67);
      v121 = (int *)v60;
      SSFileLog();
    }

    goto LABEL_62;
  }
  if (v12)
  {
    id v21 = SSError();
    id v22 = +[NSNumber numberWithInt:v12];
    uint64_t v128 = SSErrorBySettingUserInfoValue();

    CFDictionaryRef v23 = +[SSLogConfig sharedDaemonConfig];
    if (!v23)
    {
      CFDictionaryRef v23 = +[SSLogConfig sharedConfig];
    }
    unsigned int v24 = [(__CFDictionary *)v23 shouldLog];
    if ([(__CFDictionary *)v23 shouldLogToDisk]) {
      v24 |= 2u;
    }
    unsigned int v25 = [(__CFDictionary *)v23 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      v24 &= 2u;
    }
    if (v24)
    {
      CFDictionaryRef v126 = v23;
      unsigned int v26 = objc_opt_class();
      id v27 = v26;
      int v28 = SSHashIfNeeded();
      int v29 = +[NSNumber numberWithInteger:v135];
      int v30 = +[NSNumber numberWithInt:v12];
      int v139 = 138544130;
      v140 = v26;
      __int16 v141 = 2112;
      v142 = v28;
      __int16 v143 = 2114;
      CFErrorRef v144 = v29;
      __int16 v145 = 2114;
      v146 = v30;
      LODWORD(v124) = 42;
      id v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
        CFDataRef v32 = 0;
        CFDataRef v33 = 0;
        LOBYTE(v34) = 1;
        id v36 = (__CFError *)v128;
        __int16 v35 = a5;
        CFDictionaryRef v23 = v126;
        goto LABEL_167;
      }
      unsigned int v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v139, v124);
      free(v31);
      CFDictionaryRef v23 = v126;
      SSFileLog();
    }
    id v31 = 0;
    CFDataRef v32 = 0;
    CFDataRef v33 = 0;
    LOBYTE(v34) = 1;
    id v36 = (__CFError *)v128;
    __int16 v35 = a5;
    goto LABEL_166;
  }
  SecKeyRef v89 = SecCertificateCopyKey(v13);
  if (!v89)
  {
    CFDictionaryRef v23 = +[SSLogConfig sharedDaemonConfig];
    if (!v23)
    {
      CFDictionaryRef v23 = +[SSLogConfig sharedConfig];
    }
    unsigned int v102 = [(__CFDictionary *)v23 shouldLog];
    if ([(__CFDictionary *)v23 shouldLogToDisk]) {
      v102 |= 2u;
    }
    unsigned int v25 = [(__CFDictionary *)v23 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      int v103 = v102;
    }
    else {
      int v103 = v102 & 2;
    }
    if (v103)
    {
      CFDictionaryRef v95 = v23;
      v104 = objc_opt_class();
      id v105 = v104;
      v106 = SSHashIfNeeded();
      v107 = +[NSNumber numberWithInteger:v135];
      int v139 = 138543874;
      v140 = v104;
      __int16 v141 = 2112;
      v142 = v106;
      __int16 v143 = 2114;
      CFErrorRef v144 = v107;
      LODWORD(v124) = 32;
      v108 = (void *)_os_log_send_and_compose_impl();

      if (!v108)
      {
        id v31 = 0;
        CFDataRef v32 = 0;
        CFDataRef v33 = 0;
        LOBYTE(v34) = 1;
        goto LABEL_161;
      }
      unsigned int v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v108, 4, &v139, v124);
      free(v108);
      CFDictionaryRef v23 = v95;
      SSFileLog();
    }
    id v31 = 0;
    CFDataRef v32 = 0;
    id v36 = 0;
    CFDataRef v33 = 0;
    LOBYTE(v34) = 1;
    __int16 v35 = a5;
LABEL_166:

    goto LABEL_167;
  }
  id v31 = v89;
  v125 = v14;
LABEL_91:
  CFDataRef v90 = SecKeyCopyExternalRepresentation((SecKeyRef)v31, &error);
  CFDataRef v32 = v90;
  if (error)
  {
    id v36 = error;
    CFDictionaryRef v23 = +[SSLogConfig sharedDaemonConfig];
    if (!v23)
    {
      CFDictionaryRef v23 = +[SSLogConfig sharedConfig];
    }
    LODWORD(v34) = [(__CFDictionary *)v23 shouldLog];
    if ([(__CFDictionary *)v23 shouldLogToDisk]) {
      LODWORD(v34) = v34 | 2;
    }
    unsigned int v25 = [(__CFDictionary *)v23 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      LODWORD(v34) = v34 & 2;
    }
    if (v34)
    {
      v130 = v36;
      CFDictionaryRef v91 = v23;
      v92 = objc_opt_class();
      id v93 = v92;
      v94 = SSHashIfNeeded();
      int v139 = 138543874;
      v140 = v92;
      __int16 v141 = 2112;
      v142 = v94;
      __int16 v143 = 2114;
      CFErrorRef v144 = error;
      LODWORD(v124) = 32;
      uint64_t v34 = _os_log_send_and_compose_impl();

      if (v34)
      {
        unsigned int v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v139, v124);
        free((void *)v34);
        CFDictionaryRef v23 = v91;
        SSFileLog();
        LOBYTE(v34) = 0;
LABEL_101:
        CFDataRef v33 = 0;
        id v36 = v130;
        __int16 v35 = a5;
LABEL_165:
        id v14 = v125;
        goto LABEL_166;
      }
      goto LABEL_181;
    }
    goto LABEL_163;
  }
  if (v90)
  {
    CFDataRef v32 = v90;
    CFDictionaryRef v23 = +[SSLogConfig sharedDaemonConfig];
    if (!v23)
    {
      CFDictionaryRef v23 = +[SSLogConfig sharedConfig];
    }
    LODWORD(v34) = [(__CFDictionary *)v23 shouldLog];
    if ([(__CFDictionary *)v23 shouldLogToDisk]) {
      LODWORD(v34) = v34 | 2;
    }
    unsigned int v25 = [(__CFDictionary *)v23 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      LODWORD(v34) = v34 & 2;
    }
    if (!v34) {
      goto LABEL_113;
    }
    CFDictionaryRef v95 = v23;
    v96 = objc_opt_class();
    id v97 = v96;
    v98 = SSHashIfNeeded();
    int v139 = 138543618;
    v140 = v96;
    __int16 v141 = 2112;
    v142 = v98;
    LODWORD(v124) = 22;
    uint64_t v34 = _os_log_send_and_compose_impl();

    if (v34)
    {
      unsigned int v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v139, v124);
      free((void *)v34);
      CFDictionaryRef v23 = v95;
      SSFileLog();
      LOBYTE(v34) = 0;
LABEL_113:
      id v36 = 0;
      CFDataRef v33 = v32;
LABEL_164:
      __int16 v35 = a5;
      goto LABEL_165;
    }
    id v14 = v125;
    CFDataRef v33 = v32;
LABEL_161:
    __int16 v35 = a5;
    CFDictionaryRef v23 = v95;
    id v36 = 0;
    goto LABEL_167;
  }
  SSError();
  id v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v23 = +[SSLogConfig sharedDaemonConfig];
  if (!v23)
  {
    CFDictionaryRef v23 = +[SSLogConfig sharedConfig];
  }
  LODWORD(v34) = [(__CFDictionary *)v23 shouldLog];
  if ([(__CFDictionary *)v23 shouldLogToDisk]) {
    LODWORD(v34) = v34 | 2;
  }
  unsigned int v25 = [(__CFDictionary *)v23 OSLogObject];
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
    LODWORD(v34) = v34 & 2;
  }
  if (!v34)
  {
    CFDataRef v32 = 0;
LABEL_163:
    CFDataRef v33 = 0;
    goto LABEL_164;
  }
  v130 = v36;
  CFDictionaryRef v91 = v23;
  v117 = objc_opt_class();
  id v118 = v117;
  v119 = SSHashIfNeeded();
  int v139 = 138543618;
  v140 = v117;
  __int16 v141 = 2112;
  v142 = v119;
  LODWORD(v124) = 22;
  uint64_t v34 = _os_log_send_and_compose_impl();

  if (v34)
  {
    unsigned int v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v139, v124);
    free((void *)v34);
    CFDictionaryRef v23 = v91;
    SSFileLog();
    LOBYTE(v34) = 0;
    CFDataRef v32 = 0;
    goto LABEL_101;
  }
  CFDataRef v32 = 0;
LABEL_181:
  CFDataRef v33 = 0;
  id v14 = v125;
  CFDictionaryRef v23 = v91;
  id v36 = v130;
  __int16 v35 = a5;
LABEL_167:

  if (cf) {
    CFRelease(cf);
  }
  if ((v34 & 1) == 0) {
    CFRelease(v31);
  }
  if (result) {
    CFRelease(result);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (error) {
    CFRelease(error);
  }
  if (v35) {
    *__int16 v35 = v36;
  }

  return v33;
}

- (id)_createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  CFTypeRef result = 0;
  id v8 = a3;
  id v9 = +[NSString stringWithFormat:@"%@", v8];
  uint64_t v10 = +[ISBiometricStore keychainLabelForAccountID:v8 purpose:a4];

  CFDictionaryRef v11 = [(DaemonBiometricKeychain *)self _queryForPrivateKeyWithLabel:v10 prompt:0];
  uint64_t v12 = SecItemCopyMatching(v11, &result);
  if (v12)
  {
    uint64_t v13 = v12;
    CFDictionaryRef cf = v11;
    v79 = v10;
    unsigned int v83 = a5;
    id v14 = SSError();
    long long v15 = +[NSNumber numberWithInt:v13];
    SSErrorBySettingUserInfoValue();
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    id v20 = [v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      int v21 = v19;
    }
    else {
      int v21 = v19 & 2;
    }
    if (v21)
    {
      id v22 = objc_opt_class();
      id v23 = v22;
      unsigned int v24 = v9;
      unsigned int v25 = SSHashIfNeeded();
      unsigned int v26 = +[NSNumber numberWithInt:v13];
      int v86 = 138543874;
      v87 = v22;
      __int16 v88 = 2112;
      SecKeyRef v89 = v25;
      __int16 v90 = 2114;
      id v91 = v26;
      LODWORD(v72) = 32;
      id v27 = (void *)_os_log_send_and_compose_impl();

      a5 = v83;
      CFDictionaryRef v11 = cf;
      if (!v27)
      {
LABEL_28:

        id v42 = 0;
        id v9 = v24;
        uint64_t v10 = v79;
        goto LABEL_70;
      }
      id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v86, v72);
      free(v27);
      SSFileLog();
    }
    else
    {
      unsigned int v24 = v9;
      a5 = v83;
    }

    goto LABEL_28;
  }
  if (!result)
  {
    SSError();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v43 = +[SSLogConfig sharedDaemonConfig];
    if (!v43)
    {
      id v43 = +[SSLogConfig sharedConfig];
    }
    unsigned int v44 = [v43 shouldLog];
    if ([v43 shouldLogToDisk]) {
      v44 |= 2u;
    }
    id v45 = [v43 OSLogObject];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      int v46 = v44;
    }
    else {
      int v46 = v44 & 2;
    }
    if (v46)
    {
      uint64_t v47 = objc_opt_class();
      id cfb = v47;
      id v81 = v16;
      unsigned int v48 = v9;
      SSHashIfNeeded();
      v50 = CFDictionaryRef v49 = v11;
      int v86 = 138543618;
      v87 = v47;
      __int16 v88 = 2112;
      SecKeyRef v89 = v50;
      LODWORD(v72) = 22;
      int v51 = (void *)_os_log_send_and_compose_impl();

      CFDictionaryRef v11 = v49;
      id v9 = v48;
      id v16 = v81;

      if (!v51)
      {
LABEL_40:

        id v42 = 0;
        goto LABEL_70;
      }
      id v45 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v51, 4, &v86, v72);
      free(v51);
      SSFileLog();
    }

    goto LABEL_40;
  }
  int v28 = (const void *)SecKeyCopyAttestationKey();
  __int16 v84 = a5;
  if (!v28)
  {
    id v16 = 0;
    int64_t v52 = +[SSLogConfig sharedDaemonConfig];
    if (!v52)
    {
      int64_t v52 = +[SSLogConfig sharedConfig];
    }
    unsigned int v53 = [v52 shouldLog];
    if ([v52 shouldLogToDisk]) {
      v53 |= 2u;
    }
    id v54 = [v52 OSLogObject];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
      int v55 = v53;
    }
    else {
      int v55 = v53 & 2;
    }
    if (v55)
    {
      uint64_t v56 = objc_opt_class();
      id cfc = v56;
      SSHashIfNeeded();
      id v58 = v57 = v11;
      int v86 = 138543874;
      v87 = v56;
      __int16 v88 = 2112;
      SecKeyRef v89 = v58;
      __int16 v90 = 2114;
      id v91 = v16;
      LODWORD(v72) = 32;
      unsigned int v59 = (void *)_os_log_send_and_compose_impl();

      CFDictionaryRef v11 = v57;
      a5 = v84;
      if (!v59)
      {
LABEL_65:

        id v42 = 0;
        goto LABEL_70;
      }
      id v54 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v59, 4, &v86, v72);
      free(v59);
      SSFileLog();
    }
    else
    {
      a5 = v84;
    }

    goto LABEL_65;
  }
  Attestation = (void *)SecKeyCreateAttestation();
  int v30 = Attestation;
  if (Attestation)
  {
    __int16 v80 = v10;
    id v73 = Attestation;
    id v31 = +[SSLogConfig sharedDaemonConfig];
    if (!v31)
    {
      id v31 = +[SSLogConfig sharedConfig];
    }
    unsigned int v32 = [v31 shouldLog];
    if ([v31 shouldLogToDisk]) {
      v32 |= 2u;
    }
    CFDataRef v33 = [v31 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      int v34 = v32;
    }
    else {
      int v34 = v32 & 2;
    }
    if (v34)
    {
      __int16 v35 = objc_opt_class();
      CFTypeRef cfa = v30;
      id v36 = v28;
      id v37 = v35;
      SSHashIfNeeded();
      v39 = CFDictionaryRef v38 = v11;
      int v86 = 138543618;
      v87 = v35;
      __int16 v88 = 2112;
      SecKeyRef v89 = v39;
      LODWORD(v72) = 22;
      int v40 = (void *)_os_log_send_and_compose_impl();

      CFDictionaryRef v11 = v38;
      int v28 = v36;
      int v30 = cfa;

      id v41 = v73;
      if (!v40)
      {
LABEL_68:

        id v16 = 0;
        uint64_t v10 = v80;
        a5 = v84;
        CFRelease(v30);
        unsigned int v70 = v41;
        goto LABEL_69;
      }
      CFDataRef v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v40, 4, &v86, v72);
      free(v40);
      SSFileLog();
    }
    else
    {
      id v41 = v73;
    }

    goto LABEL_68;
  }
  id v16 = 0;
  v60 = +[SSLogConfig sharedDaemonConfig];
  if (!v60)
  {
    v60 = +[SSLogConfig sharedConfig];
  }
  unsigned int v61 = [v60 shouldLog];
  if ([v60 shouldLogToDisk]) {
    v61 |= 2u;
  }
  id v62 = [v60 OSLogObject];
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
    int v63 = v61;
  }
  else {
    int v63 = v61 & 2;
  }
  if (!v63) {
    goto LABEL_61;
  }
  id v64 = objc_opt_class();
  __int16 v82 = v28;
  id v65 = v16;
  id v66 = v9;
  id v74 = v64;
  SSHashIfNeeded();
  v68 = CFDictionaryRef v67 = v11;
  int v86 = 138543874;
  v87 = v64;
  __int16 v88 = 2112;
  SecKeyRef v89 = v68;
  __int16 v90 = 2114;
  id v91 = v65;
  LODWORD(v72) = 32;
  int v69 = (void *)_os_log_send_and_compose_impl();

  CFDictionaryRef v11 = v67;
  id v9 = v66;
  id v16 = v65;
  int v28 = v82;

  if (v69)
  {
    id v62 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v69, 4, &v86, v72);
    free(v69);
    SSFileLog();
LABEL_61:
  }
  unsigned int v70 = 0;
  a5 = v84;
LABEL_69:
  CFRelease(v28);
  id v42 = v70;
LABEL_70:
  if (result) {
    CFRelease(result);
  }
  if (a5) {
    *a5 = v16;
  }

  return v42;
}

- (id)_createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v6 = a3;
  uint64_t v204 = 0;
  v205 = &v204;
  uint64_t v206 = 0x3032000000;
  v207 = sub_1000D0C10;
  v208 = sub_1000D0C20;
  id v209 = 0;
  uint64_t v198 = 0;
  v199 = (id *)&v198;
  uint64_t v200 = 0x3032000000;
  v201 = sub_1000D0C10;
  v202 = sub_1000D0C20;
  id v203 = 0;
  uint64_t v194 = 0;
  v195 = &v194;
  uint64_t v196 = 0x2020000000;
  uint64_t v197 = 0;
  uint64_t v190 = 0;
  v191 = &v190;
  uint64_t v192 = 0x2020000000;
  uint64_t v193 = 0;
  uint64_t v186 = 0;
  v187 = &v186;
  uint64_t v188 = 0x2020000000;
  uint64_t v189 = 0;
  CFErrorRef error = 0;
  v172 = +[NSString stringWithFormat:@"%@", v6];
  id v7 = v199;
  id obj = v199[5];
  [(DaemonBiometricKeychain *)self _deleteKeychainTokensForAccountIdentifier:v6 purpose:a4 error:&obj];
  v174 = (void *)a4;
  objc_storeStrong(v7 + 5, obj);
  if (v199[5])
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    unsigned int v10 = [v8 shouldLogToDisk];
    CFDictionaryRef v11 = [v8 OSLogObject];
    uint64_t v12 = v11;
    if (v10) {
      v9 |= 2u;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v13 = (id)objc_opt_class();
      SSHashIfNeeded();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      long long v15 = +[NSNumber numberWithInteger:v174];
      id v16 = v199[5];
      int v210 = 138544130;
      id v211 = v13;
      __int16 v212 = 2112;
      id v213 = v14;
      __int16 v214 = 2114;
      v215 = v15;
      __int16 v216 = 2114;
      v217 = v16;
      LODWORD(v161) = 42;
      v156 = &v210;
      id v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v210, v161);
      free(v17);
      v156 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_13:
  SecAccessControlRef cf = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, 0x40000002uLL, &error);
  if (!cf)
  {
    objc_storeStrong(v199 + 5, error);
    unsigned int v18 = +[SSLogConfig sharedDaemonConfig];
    if (!v18)
    {
      unsigned int v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = objc_msgSend(v18, "shouldLog", v156);
    unsigned int v20 = [v18 shouldLogToDisk];
    id v21 = v6;
    id v22 = [v18 OSLogObject];
    id v23 = v22;
    if (v20) {
      v19 |= 2u;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      v19 &= 2u;
    }
    if (v19)
    {
      id v24 = (id)objc_opt_class();
      SSHashIfNeeded();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v26 = +[NSNumber numberWithInteger:v174];
      id v27 = v199[5];
      int v210 = 138544130;
      id v211 = v24;
      __int16 v212 = 2112;
      id v213 = v25;
      __int16 v214 = 2114;
      v215 = v26;
      __int16 v216 = 2114;
      v217 = v27;
      LODWORD(v161) = 42;
      v157 = &v210;
      int v28 = (void *)_os_log_send_and_compose_impl();

      id v6 = v21;
      if (!v28)
      {
LABEL_157:

        goto LABEL_191;
      }
      id v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v210, v161);
      free(v28);
      v157 = (int *)v23;
      SSFileLog();
    }

    goto LABEL_157;
  }
  if (v174 == (void *)1)
  {
    v163 = [(DaemonBiometricKeychain *)self _constraintsForExtendedActions];
  }
  else
  {
    if (v174) {
      goto LABEL_37;
    }
    v163 = [(DaemonBiometricKeychain *)self _constraintsForPurchase];
  }
  if (v163)
  {
    SecAccessControlSetConstraints();
    int v29 = +[SSLogConfig sharedDaemonConfig];
    if (!v29)
    {
      int v29 = +[SSLogConfig sharedConfig];
    }
    unsigned int v30 = objc_msgSend(v29, "shouldLog", v156);
    unsigned int v31 = [v29 shouldLogToDisk];
    unsigned int v32 = [v29 OSLogObject];
    CFDataRef v33 = v32;
    if (v31) {
      v30 |= 2u;
    }
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      v30 &= 2u;
    }
    if (v30)
    {
      id v34 = (id)objc_opt_class();
      SSHashIfNeeded();
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      id v36 = +[NSNumber numberWithInteger:v174];
      int v210 = 138543874;
      id v211 = v34;
      __int16 v212 = 2112;
      id v213 = v35;
      __int16 v214 = 2114;
      v215 = v36;
      LODWORD(v161) = 32;
      v158 = &v210;
      id v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37) {
        goto LABEL_48;
      }
      CFDataRef v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v210, v161);
      free(v37);
      v158 = (int *)v33;
      SSFileLog();
    }
    goto LABEL_47;
  }
LABEL_37:
  int v29 = +[SSLogConfig sharedDaemonConfig];
  if (!v29)
  {
    int v29 = +[SSLogConfig sharedConfig];
  }
  unsigned int v38 = [v29 shouldLog];
  unsigned int v39 = [v29 shouldLogToDisk];
  int v40 = [v29 OSLogObject];
  CFDataRef v33 = v40;
  if (v39) {
    v38 |= 2u;
  }
  if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
    v38 &= 2u;
  }
  if (!v38) {
    goto LABEL_46;
  }
  id v41 = (id)objc_opt_class();
  SSHashIfNeeded();
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  id v43 = +[NSNumber numberWithInteger:v174];
  int v210 = 138543874;
  id v211 = v41;
  __int16 v212 = 2112;
  id v213 = v42;
  __int16 v214 = 2114;
  v215 = v43;
  LODWORD(v161) = 32;
  v158 = &v210;
  unsigned int v44 = (void *)_os_log_send_and_compose_impl();

  if (v44)
  {
    CFDataRef v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v44, 4, &v210, v161);
    free(v44);
    v158 = (int *)v33;
    SSFileLog();
LABEL_46:
    v163 = 0;
LABEL_47:

    goto LABEL_48;
  }
  v163 = 0;
LABEL_48:

  v167 = ISWeakLinkedStringConstantForString();
  v168 = ISWeakLinkedStringConstantForString();
  v164 = ISWeakLinkedStringConstantForString();
  v166 = ISWeakLinkedStringConstantForString();
  v165 = ISWeakLinkedStringConstantForString();
  id v171 = objc_alloc_init((Class)NSMutableDictionary);
  if (v168) {
    [v171 setObject:&__kCFBooleanTrue forKeyedSubscript:v168];
  }
  if (v167) {
    [v171 setObject:cf forKeyedSubscript:v167];
  }
  if (v166)
  {
    id v45 = objc_alloc_init((Class)NSMutableArray);
    int v46 = v45;
    if (v165) {
      [v45 addObject:v165];
    }
    if (v164) {
      [v46 addObject:v164];
    }
    objc_msgSend(v171, "setObject:forKeyedSubscript:", v46, v166, v158);
  }
  objc_initWeak(&location, self);
  dispatch_semaphore_t v47 = dispatch_semaphore_create(0);
  unsigned int v48 = (void (*)(OS_dispatch_queue *, id, void *))ISWeakLinkedSymbolForString();
  dispatchQueueX509 = self->_dispatchQueueX509;
  v175[0] = _NSConcreteStackBlock;
  v175[1] = 3221225472;
  v175[2] = sub_1000DAFC8;
  v175[3] = &unk_1003A6160;
  objc_copyWeak(v182, &location);
  v177 = &v198;
  v178 = &v190;
  v179 = &v204;
  v180 = &v186;
  v182[1] = v174;
  v181 = &v194;
  id v50 = v47;
  v176 = v50;
  v48(dispatchQueueX509, v171, v175);
  dispatch_time_t v51 = dispatch_time(0, 30000000000);
  v162 = v50;
  if (dispatch_semaphore_wait(v50, v51))
  {
    int64_t v52 = +[SSLogConfig sharedDaemonConfig];
    if (!v52)
    {
      int64_t v52 = +[SSLogConfig sharedConfig];
    }
    unsigned int v53 = objc_msgSend(v52, "shouldLog", v158);
    unsigned int v54 = [v52 shouldLogToDisk];
    int v55 = [v52 OSLogObject];
    uint64_t v56 = v55;
    if (v54) {
      v53 |= 2u;
    }
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      v53 &= 2u;
    }
    if (v53)
    {
      id v57 = (id)objc_opt_class();
      SSHashIfNeeded();
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v59 = +[NSNumber numberWithInteger:v174];
      int v210 = 138543874;
      id v211 = v57;
      __int16 v212 = 2112;
      id v213 = v58;
      __int16 v214 = 2114;
      v215 = v59;
      LODWORD(v161) = 32;
      v158 = &v210;
      v60 = (void *)_os_log_send_and_compose_impl();

      if (!v60)
      {
LABEL_69:

        goto LABEL_70;
      }
      uint64_t v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v60, 4, &v210, v161);
      free(v60);
      v158 = (int *)v56;
      SSFileLog();
    }

    goto LABEL_69;
  }
LABEL_70:
  if (v191[3])
  {
    unsigned int v61 = +[ISBiometricStore keychainLabelForKeyWithAccountID:v6 purpose:v174];
    id v62 = objc_alloc_init((Class)NSMutableDictionary);
    [v62 setObject:kSecAttrKeyClassPrivate forKeyedSubscript:kSecAttrKeyClass];
    [v62 setObject:v61 forKeyedSubscript:kSecAttrLabel];
    [v62 setObject:kSecClassKey forKeyedSubscript:kSecClass];
    [v62 setObject:v191[3] forKeyedSubscript:kSecValueRef];
    uint64_t v63 = SecItemAdd((CFDictionaryRef)v62, 0);
    if (v63)
    {
      id v64 = +[SSLogConfig sharedDaemonConfig];
      if (!v64)
      {
        id v64 = +[SSLogConfig sharedConfig];
      }
      unsigned int v65 = objc_msgSend(v64, "shouldLog", v158);
      unsigned int v66 = [v64 shouldLogToDisk];
      CFDictionaryRef v67 = [v64 OSLogObject];
      id v68 = v67;
      if (v66) {
        v65 |= 2u;
      }
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        v65 &= 2u;
      }
      if (!v65) {
        goto LABEL_99;
      }
      id v69 = (id)objc_opt_class();
      SSHashIfNeeded();
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      int v71 = +[NSNumber numberWithInteger:v174];
      uint64_t v72 = +[NSNumber numberWithInt:v63];
      int v210 = 138544130;
      id v211 = v69;
      __int16 v212 = 2112;
      id v213 = v70;
      __int16 v214 = 2114;
      v215 = v71;
      __int16 v216 = 2114;
      v217 = v72;
      LODWORD(v161) = 42;
      v159 = &v210;
      id v73 = (void *)_os_log_send_and_compose_impl();

      if (v73)
      {
LABEL_98:
        id v68 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v73, 4, &v210, v161);
        free(v73);
        v159 = (int *)v68;
        SSFileLog();
LABEL_99:
      }
    }
    else
    {
      id v64 = +[SSLogConfig sharedDaemonConfig];
      if (!v64)
      {
        id v64 = +[SSLogConfig sharedConfig];
      }
      unsigned int v81 = objc_msgSend(v64, "shouldLog", v158);
      unsigned int v82 = [v64 shouldLogToDisk];
      unsigned int v83 = [v64 OSLogObject];
      id v68 = v83;
      if (v82) {
        v81 |= 2u;
      }
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT)) {
        v81 &= 2u;
      }
      if (!v81) {
        goto LABEL_99;
      }
      id v84 = (id)objc_opt_class();
      SSHashIfNeeded();
      id v85 = (id)objc_claimAutoreleasedReturnValue();
      int v86 = +[NSNumber numberWithInteger:v174];
      v87 = +[NSNumber numberWithInt:0];
      int v210 = 138544130;
      id v211 = v84;
      __int16 v212 = 2112;
      id v213 = v85;
      __int16 v214 = 2114;
      v215 = v86;
      __int16 v216 = 2114;
      v217 = v87;
      LODWORD(v161) = 42;
      v159 = &v210;
      id v73 = (void *)_os_log_send_and_compose_impl();

      if (v73) {
        goto LABEL_98;
      }
    }

    goto LABEL_101;
  }
  unsigned int v61 = +[SSLogConfig sharedDaemonConfig];
  if (!v61)
  {
    unsigned int v61 = +[SSLogConfig sharedConfig];
  }
  unsigned int v74 = objc_msgSend(v61, "shouldLog", v158);
  unsigned int v75 = [v61 shouldLogToDisk];
  CFTypeRef v76 = [v61 OSLogObject];
  id v62 = v76;
  if (v75) {
    v74 |= 2u;
  }
  if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
    v74 &= 2u;
  }
  if (v74)
  {
    id v77 = (id)objc_opt_class();
    SSHashIfNeeded();
    id v78 = (id)objc_claimAutoreleasedReturnValue();
    v79 = +[NSNumber numberWithInteger:v174];
    int v210 = 138543874;
    id v211 = v77;
    __int16 v212 = 2112;
    id v213 = v78;
    __int16 v214 = 2114;
    v215 = v79;
    LODWORD(v161) = 32;
    v159 = &v210;
    __int16 v80 = (void *)_os_log_send_and_compose_impl();

    if (!v80) {
      goto LABEL_102;
    }
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v80, 4, &v210, v161);
    id v62 = (id)objc_claimAutoreleasedReturnValue();
    free(v80);
    v159 = (int *)v62;
    SSFileLog();
  }
LABEL_101:

LABEL_102:
  if (v187[3])
  {
    __int16 v88 = +[ISBiometricStore keychainLabelForCertWithAccountID:v6 purpose:v174];
    id v89 = objc_alloc_init((Class)NSMutableDictionary);
    [v89 setObject:v88 forKeyedSubscript:kSecAttrLabel];
    [v89 setObject:kSecClassCertificate forKeyedSubscript:kSecClass];
    [v89 setObject:v187[3] forKeyedSubscript:kSecValueRef];
    uint64_t v90 = SecItemAdd((CFDictionaryRef)v89, 0);
    if (v90)
    {
      id v91 = +[SSLogConfig sharedDaemonConfig];
      if (!v91)
      {
        id v91 = +[SSLogConfig sharedConfig];
      }
      unsigned int v92 = objc_msgSend(v91, "shouldLog", v159);
      unsigned int v93 = [v91 shouldLogToDisk];
      v94 = [v91 OSLogObject];
      CFDictionaryRef v95 = v94;
      if (v93) {
        v92 |= 2u;
      }
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
        v92 &= 2u;
      }
      if (!v92) {
        goto LABEL_131;
      }
      id v96 = (id)objc_opt_class();
      SSHashIfNeeded();
      id v97 = (id)objc_claimAutoreleasedReturnValue();
      v98 = +[NSNumber numberWithInteger:v174];
      unsigned int v99 = +[NSNumber numberWithInt:v90];
      int v210 = 138544130;
      id v211 = v96;
      __int16 v212 = 2112;
      id v213 = v97;
      __int16 v214 = 2114;
      v215 = v98;
      __int16 v216 = 2114;
      v217 = v99;
      LODWORD(v161) = 42;
      v160 = &v210;
      int v100 = (void *)_os_log_send_and_compose_impl();

      if (v100)
      {
LABEL_130:
        CFDictionaryRef v95 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v100, 4, &v210, v161);
        free(v100);
        v160 = (int *)v95;
        SSFileLog();
LABEL_131:
      }
    }
    else
    {
      id v91 = +[SSLogConfig sharedDaemonConfig];
      if (!v91)
      {
        id v91 = +[SSLogConfig sharedConfig];
      }
      unsigned int v108 = objc_msgSend(v91, "shouldLog", v159);
      unsigned int v109 = [v91 shouldLogToDisk];
      int v110 = [v91 OSLogObject];
      CFDictionaryRef v95 = v110;
      if (v109) {
        v108 |= 2u;
      }
      if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT)) {
        v108 &= 2u;
      }
      if (!v108) {
        goto LABEL_131;
      }
      id v111 = (id)objc_opt_class();
      SSHashIfNeeded();
      id v112 = (id)objc_claimAutoreleasedReturnValue();
      id v113 = +[NSNumber numberWithInteger:v174];
      int v210 = 138543874;
      id v211 = v111;
      __int16 v212 = 2112;
      id v213 = v112;
      __int16 v214 = 2112;
      v215 = v113;
      LODWORD(v161) = 32;
      v160 = &v210;
      int v100 = (void *)_os_log_send_and_compose_impl();

      if (v100) {
        goto LABEL_130;
      }
    }

    goto LABEL_133;
  }
  __int16 v88 = +[SSLogConfig sharedDaemonConfig];
  if (!v88)
  {
    __int16 v88 = +[SSLogConfig sharedConfig];
  }
  unsigned int v101 = objc_msgSend(v88, "shouldLog", v159);
  unsigned int v102 = [v88 shouldLogToDisk];
  int v103 = [v88 OSLogObject];
  id v89 = v103;
  if (v102) {
    v101 |= 2u;
  }
  if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
    v101 &= 2u;
  }
  if (v101)
  {
    id v104 = (id)objc_opt_class();
    SSHashIfNeeded();
    id v105 = (id)objc_claimAutoreleasedReturnValue();
    v106 = +[NSNumber numberWithInteger:v174];
    int v210 = 138543874;
    id v211 = v104;
    __int16 v212 = 2112;
    id v213 = v105;
    __int16 v214 = 2112;
    v215 = v106;
    LODWORD(v161) = 32;
    v160 = &v210;
    v107 = (void *)_os_log_send_and_compose_impl();

    if (!v107) {
      goto LABEL_134;
    }
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v107, 4, &v210, v161);
    id v89 = (id)objc_claimAutoreleasedReturnValue();
    free(v107);
    v160 = (int *)v89;
    SSFileLog();
  }
LABEL_133:

LABEL_134:
  if (v195[3])
  {
    id v114 = objc_alloc_init((Class)NSMutableDictionary);
    [v114 setObject:ISBiometricsIntermediateCertKeychainLabel forKeyedSubscript:kSecAttrLabel];
    [v114 setObject:kSecClassCertificate forKeyedSubscript:kSecClass];
    [v114 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnRef];
    uint64_t v115 = SecItemCopyMatching((CFDictionaryRef)v114, 0);
    uint64_t v116 = v115;
    if (v115)
    {
      if (v115 == -25300)
      {
        [v114 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecReturnRef];
        [v114 setObject:v195[3] forKeyedSubscript:kSecValueRef];
        uint64_t v117 = SecItemAdd((CFDictionaryRef)v114, 0);
        if (v117)
        {
          id v118 = +[SSLogConfig sharedDaemonConfig];
          if (!v118)
          {
            id v118 = +[SSLogConfig sharedConfig];
          }
          unsigned int v119 = objc_msgSend(v118, "shouldLog", v160);
          unsigned int v120 = [v118 shouldLogToDisk];
          v121 = [v118 OSLogObject];
          v122 = v121;
          if (v120) {
            v119 |= 2u;
          }
          if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
            v119 &= 2u;
          }
          if (!v119) {
            goto LABEL_188;
          }
          SSHashIfNeeded();
          id v123 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v124 = +[NSNumber numberWithInteger:v174];
          v125 = +[NSNumber numberWithInt:v117];
          int v210 = 138412802;
          id v211 = v123;
          __int16 v212 = 2112;
          id v213 = v124;
          __int16 v214 = 2112;
          v215 = v125;
          LODWORD(v161) = 32;
          v157 = &v210;
          CFDictionaryRef v126 = (void *)_os_log_send_and_compose_impl();

          if (v126) {
            goto LABEL_176;
          }
        }
        else
        {
          id v118 = +[SSLogConfig sharedDaemonConfig];
          if (!v118)
          {
            id v118 = +[SSLogConfig sharedConfig];
          }
          unsigned int v144 = objc_msgSend(v118, "shouldLog", v160);
          unsigned int v145 = [v118 shouldLogToDisk];
          v146 = [v118 OSLogObject];
          v122 = v146;
          if (v145) {
            v144 |= 2u;
          }
          if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT)) {
            int v147 = v144;
          }
          else {
            int v147 = v144 & 2;
          }
          if (!v147) {
            goto LABEL_188;
          }
          SSHashIfNeeded();
          id v148 = (id)objc_claimAutoreleasedReturnValue();
          v149 = +[NSNumber numberWithInteger:v174];
          int v210 = 138412546;
          id v211 = v148;
          __int16 v212 = 2114;
          id v213 = v149;
          LODWORD(v161) = 22;
          v157 = &v210;
          v150 = (void *)_os_log_send_and_compose_impl();

          if (v150)
          {
            v122 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v150, 4, &v210, v161);
            free(v150);
            v157 = (int *)v122;
            SSFileLog();
            goto LABEL_188;
          }
        }
LABEL_189:

        goto LABEL_190;
      }
      id v118 = +[SSLogConfig sharedDaemonConfig];
      if (!v118)
      {
        id v118 = +[SSLogConfig sharedConfig];
      }
      unsigned int v138 = objc_msgSend(v118, "shouldLog", v160);
      unsigned int v139 = [v118 shouldLogToDisk];
      v140 = [v118 OSLogObject];
      v122 = v140;
      if (v139) {
        v138 |= 2u;
      }
      if (!os_log_type_enabled(v140, OS_LOG_TYPE_ERROR)) {
        v138 &= 2u;
      }
      if (!v138) {
        goto LABEL_188;
      }
      SSHashIfNeeded();
      id v141 = (id)objc_claimAutoreleasedReturnValue();
      v142 = +[NSNumber numberWithInteger:v174];
      __int16 v143 = +[NSNumber numberWithInt:v116];
      int v210 = 138412802;
      id v211 = v141;
      __int16 v212 = 2114;
      id v213 = v142;
      __int16 v214 = 2114;
      v215 = v143;
      LODWORD(v161) = 32;
      v157 = &v210;
      CFDictionaryRef v126 = (void *)_os_log_send_and_compose_impl();

      if (!v126) {
        goto LABEL_189;
      }
    }
    else
    {
      id v118 = +[SSLogConfig sharedDaemonConfig];
      if (!v118)
      {
        id v118 = +[SSLogConfig sharedConfig];
      }
      unsigned int v134 = objc_msgSend(v118, "shouldLog", v160);
      unsigned int v135 = [v118 shouldLogToDisk];
      v136 = [v118 OSLogObject];
      v122 = v136;
      if (v135) {
        v134 |= 2u;
      }
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT)) {
        int v137 = v134;
      }
      else {
        int v137 = v134 & 2;
      }
      if (!v137) {
        goto LABEL_188;
      }
      LOWORD(v210) = 0;
      LODWORD(v161) = 2;
      v157 = &v210;
      CFDictionaryRef v126 = (void *)_os_log_send_and_compose_impl();

      if (!v126) {
        goto LABEL_189;
      }
    }
LABEL_176:
    v122 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v126, 4, &v210, v161);
    free(v126);
    v157 = (int *)v122;
    SSFileLog();
LABEL_188:

    goto LABEL_189;
  }
  id v114 = +[SSLogConfig sharedDaemonConfig];
  if (!v114)
  {
    id v114 = +[SSLogConfig sharedConfig];
  }
  unsigned int v127 = objc_msgSend(v114, "shouldLog", v160);
  unsigned int v128 = [v114 shouldLogToDisk];
  v129 = [v114 OSLogObject];
  id v118 = v129;
  if (v128) {
    v127 |= 2u;
  }
  if (!os_log_type_enabled(v129, OS_LOG_TYPE_ERROR)) {
    v127 &= 2u;
  }
  if (!v127) {
    goto LABEL_189;
  }
  id v130 = (id)objc_opt_class();
  SSHashIfNeeded();
  id v131 = (id)objc_claimAutoreleasedReturnValue();
  v132 = +[NSNumber numberWithInteger:v174];
  int v210 = 138543874;
  id v211 = v130;
  __int16 v212 = 2112;
  id v213 = v131;
  __int16 v214 = 2114;
  v215 = v132;
  LODWORD(v161) = 32;
  v157 = &v210;
  v133 = (void *)_os_log_send_and_compose_impl();

  if (v133)
  {
    id v118 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v133, 4, &v210, v161);
    free(v133);
    v157 = (int *)v118;
    SSFileLog();
    goto LABEL_189;
  }
LABEL_190:

  objc_destroyWeak(v182);
  objc_destroyWeak(&location);

  CFRelease(cf);
LABEL_191:
  v151 = (const void *)v195[3];
  if (v151) {
    CFRelease(v151);
  }
  v152 = (const void *)v191[3];
  if (v152) {
    CFRelease(v152);
  }
  v153 = (const void *)v187[3];
  if (v153) {
    CFRelease(v153);
  }
  if (error) {
    CFRelease(error);
  }
  if (a5) {
    *a5 = v199[5];
  }
  v154 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v205[5], v157);

  _Block_object_dispose(&v186, 8);
  _Block_object_dispose(&v190, 8);
  _Block_object_dispose(&v194, 8);
  _Block_object_dispose(&v198, 8);

  _Block_object_dispose(&v204, 8);

  return v154;
}

- (BOOL)_deleteKeychainTokensForAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSString stringWithFormat:@"mt-tid-%@", v6];
  NSHTTPCookiePropertyKey v45 = NSHTTPCookieName;
  int v46 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  unsigned int v9 = +[ACAccountStore ams_sharedAccountStore];
  id v40 = 0;
  objc_msgSend(v9, "ams_removeCookiesMatchingProperties:error:", v8, &v40);
  id v10 = v40;

  if (v10)
  {
    CFDictionaryRef v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      CFDictionaryRef v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      v12 |= 2u;
    }
    id v13 = [v11 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      int v14 = v12;
    }
    else {
      int v14 = v12 & 2;
    }
    id v37 = self;
    if (v14)
    {
      long long v15 = objc_opt_class();
      int v41 = 138543618;
      id v42 = v15;
      __int16 v43 = 2114;
      uint64_t v44 = 0;
      id v16 = v10;
      id v17 = v8;
      unsigned int v18 = v7;
      unsigned int v19 = a4;
      id v20 = v15;
      LODWORD(v35) = 22;
      id v34 = &v41;
      id v21 = (void *)_os_log_send_and_compose_impl();

      a4 = v19;
      id v7 = v18;
      id v8 = v17;
      id v10 = v16;

      if (!v21)
      {
LABEL_13:

        self = v37;
        goto LABEL_14;
      }
      id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v41, v35);
      free(v21);
      id v34 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  id v39 = 0;
  -[DaemonBiometricKeychain _deleteKeychainTokensForAccountIdentifier:purpose:error:](self, "_deleteKeychainTokensForAccountIdentifier:purpose:error:", v6, 0, &v39, v34);
  id v22 = v39;
  id v38 = 0;
  [(DaemonBiometricKeychain *)self _deleteKeychainTokensForAccountIdentifier:v6 purpose:1 error:&v38];

  id v23 = v38;
  id v24 = v23;
  if (v22 && v23)
  {
    id v36 = a4;
    id v25 = SSError();
    unsigned int v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26)
    {
      unsigned int v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v26 shouldLog];
    if ([v26 shouldLogToDisk]) {
      v27 |= 2u;
    }
    int v28 = [v26 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      v27 &= 2u;
    }
    if (v27)
    {
      int v29 = objc_opt_class();
      int v41 = 138543362;
      id v42 = v29;
      id v30 = v29;
      LODWORD(v35) = 12;
      unsigned int v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31) {
        goto LABEL_26;
      }
      int v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v41, v35);
      free(v31);
      SSFileLog();
    }

LABEL_26:
    a4 = v36;
    if (!v36) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v22)
  {
    id v32 = v22;
  }
  else
  {
    if (!v23)
    {
      id v25 = 0;
      if (!a4) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
    id v32 = v23;
  }
  id v25 = v32;
  if (a4) {
LABEL_33:
  }
    *a4 = v25;
LABEL_34:

  return v25 == 0;
}

- (BOOL)_deleteKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v171 = +[NSString stringWithFormat:@"%@", v8];
  unsigned int v9 = &syslog_ptr;
  id v10 = +[ISBiometricStore keychainLabelForAccountID:v8 purpose:a4];
  CFDictionaryRef v11 = [(DaemonBiometricKeychain *)self _queryForPrivateKeyWithLabel:v10 prompt:0 useTokenID:0];
  uint64_t v12 = SecItemDelete(v11);
  id v169 = v8;
  int64_t v170 = a4;
  CFDictionaryRef v165 = v11;
  v166 = a5;
  if (!v12)
  {
    int v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      int v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    id v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19) {
      goto LABEL_20;
    }
LABEL_35:

    id v25 = 0;
    goto LABEL_39;
  }
  uint64_t v13 = v12;
  if (v12 != -25300)
  {
    unsigned int v26 = SSError();
    unsigned int v27 = +[NSNumber numberWithInt:v13];
    id v25 = SSErrorBySettingUserInfoValue();

    int v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      int v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    id v30 = [v14 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      int v31 = v29;
    }
    else {
      int v31 = v29 & 2;
    }
    if (v31)
    {
      v167 = v25;
      id v32 = objc_opt_class();
      id v33 = v32;
      id v34 = SSHashIfNeeded();
      uint64_t v35 = +[NSNumber numberWithInt:v13];
      int v174 = 138543874;
      v175 = v32;
      __int16 v176 = 2112;
      id v177 = v34;
      __int16 v178 = 2114;
      v179 = v35;
      LODWORD(v160) = 32;
      v155 = &v174;
      id v36 = (void *)_os_log_send_and_compose_impl();

      if (v36)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v174, v160);
        id v37 = (int *)objc_claimAutoreleasedReturnValue();
        free(v36);
        v155 = v37;
        SSFileLog();
      }
      id v25 = v167;
      id v8 = v169;
    }
    else
    {
    }
    a4 = v170;
    goto LABEL_38;
  }
  int v14 = +[SSLogConfig sharedDaemonConfig];
  if (!v14)
  {
    int v14 = +[SSLogConfig sharedConfig];
  }
  unsigned int v15 = [v14 shouldLog];
  if ([v14 shouldLogToDisk]) {
    int v16 = v15 | 2;
  }
  else {
    int v16 = v15;
  }
  id v17 = [v14 OSLogObject];
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    v16 &= 2u;
  }
  if (!v16) {
    goto LABEL_35;
  }
LABEL_20:
  id v20 = objc_opt_class();
  id v21 = v20;
  id v22 = SSHashIfNeeded();
  int v174 = 138543618;
  v175 = v20;
  __int16 v176 = 2112;
  id v177 = v22;
  LODWORD(v160) = 22;
  v155 = &v174;
  id v23 = (void *)_os_log_send_and_compose_impl();

  if (v23)
  {
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v174, v160);
    id v24 = (int *)objc_claimAutoreleasedReturnValue();
    free(v23);
    v155 = v24;
    SSFileLog();
  }
  id v25 = 0;
LABEL_38:
  unsigned int v9 = &syslog_ptr;
LABEL_39:

  id v38 = +[ISBiometricStore keychainLabelForKeyWithAccountID:v8 purpose:a4];

  id v39 = &syslog_ptr;
  id v40 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v41 = kSecAttrLabel;
  [v40 setObject:v38 forKeyedSubscript:kSecAttrLabel];
  CFStringRef v42 = kSecClass;
  [v40 setObject:kSecClassKey forKeyedSubscript:kSecClass];
  [v40 setObject:kSecAttrKeyClassPrivate forKeyedSubscript:kSecAttrKeyClass];
  id v162 = v40;
  uint64_t v43 = SecItemDelete((CFDictionaryRef)v40);
  if (!v43)
  {
    v168 = v25;
    NSHTTPCookiePropertyKey v45 = +[SSLogConfig sharedDaemonConfig];
    if (!v45)
    {
      NSHTTPCookiePropertyKey v45 = +[SSLogConfig sharedConfig];
    }
    unsigned int v54 = objc_msgSend(v45, "shouldLog", v155);
    if ([v45 shouldLogToDisk]) {
      v54 |= 2u;
    }
    dispatch_semaphore_t v47 = [v45 OSLogObject];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
      int v55 = v54;
    }
    else {
      int v55 = v54 & 2;
    }
    if (!v55) {
      goto LABEL_73;
    }
    uint64_t v56 = objc_opt_class();
    id v50 = v56;
    id v57 = SSHashIfNeeded();
    id v58 = +[NSNumber numberWithInteger:v170];
    int v174 = 138543874;
    v175 = v56;
    __int16 v176 = 2112;
    id v177 = v57;
    __int16 v178 = 2114;
    v179 = v58;
    LODWORD(v160) = 32;
    v156 = &v174;
    unsigned int v53 = (void *)_os_log_send_and_compose_impl();

    goto LABEL_59;
  }
  uint64_t v44 = v43;
  if (v43 == -25300)
  {
    v168 = v25;
    NSHTTPCookiePropertyKey v45 = +[SSLogConfig sharedDaemonConfig];
    if (!v45)
    {
      NSHTTPCookiePropertyKey v45 = +[SSLogConfig sharedConfig];
    }
    unsigned int v46 = objc_msgSend(v45, "shouldLog", v155);
    if ([v45 shouldLogToDisk]) {
      v46 |= 2u;
    }
    dispatch_semaphore_t v47 = [v45 OSLogObject];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      int v48 = v46;
    }
    else {
      int v48 = v46 & 2;
    }
    if (!v48) {
      goto LABEL_73;
    }
    CFDictionaryRef v49 = objc_opt_class();
    id v50 = v49;
    dispatch_time_t v51 = SSHashIfNeeded();
    int64_t v52 = +[NSNumber numberWithInteger:v170];
    int v174 = 138543874;
    v175 = v49;
    __int16 v176 = 2112;
    id v177 = v51;
    __int16 v178 = 2114;
    v179 = v52;
    LODWORD(v160) = 32;
    v156 = &v174;
    unsigned int v53 = (void *)_os_log_send_and_compose_impl();

LABEL_59:
    if (v53)
    {
      dispatch_semaphore_t v47 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, &v174, v160);
      free(v53);
      v156 = (int *)v47;
      SSFileLog();
LABEL_72:
      CFStringRef v42 = kSecClass;
      unsigned int v9 = &syslog_ptr;
LABEL_73:

      goto LABEL_76;
    }
    goto LABEL_75;
  }
  unsigned int v59 = SSError();

  v60 = +[NSNumber numberWithInt:v44];
  v168 = SSErrorBySettingUserInfoValue();

  NSHTTPCookiePropertyKey v45 = +[SSLogConfig sharedDaemonConfig];
  if (!v45)
  {
    NSHTTPCookiePropertyKey v45 = +[SSLogConfig sharedConfig];
  }
  unsigned int v61 = objc_msgSend(v45, "shouldLog", v155);
  if ([v45 shouldLogToDisk]) {
    v61 |= 2u;
  }
  dispatch_semaphore_t v47 = [v45 OSLogObject];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    int v62 = v61;
  }
  else {
    int v62 = v61 & 2;
  }
  if (!v62)
  {
    CFStringRef v41 = kSecAttrLabel;
    goto LABEL_72;
  }
  uint64_t v63 = objc_opt_class();
  id v64 = v63;
  unsigned int v65 = SSHashIfNeeded();
  unsigned int v66 = +[NSNumber numberWithInteger:v170];
  CFDictionaryRef v67 = +[NSNumber numberWithInt:v44];
  int v174 = 138544130;
  v175 = v63;
  __int16 v176 = 2112;
  id v177 = v65;
  __int16 v178 = 2112;
  v179 = v66;
  __int16 v180 = 2114;
  v181 = v67;
  LODWORD(v160) = 42;
  v156 = &v174;
  id v68 = (void *)_os_log_send_and_compose_impl();

  if (v68)
  {
    dispatch_semaphore_t v47 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v68, 4, &v174, v160);
    free(v68);
    v156 = (int *)v47;
    SSFileLog();
    CFStringRef v41 = kSecAttrLabel;
    id v39 = &syslog_ptr;
    goto LABEL_72;
  }
  CFStringRef v41 = kSecAttrLabel;
  id v39 = &syslog_ptr;
LABEL_75:
  CFStringRef v42 = kSecClass;
  unsigned int v9 = &syslog_ptr;
LABEL_76:

  unint64_t v69 = v170;
  uint64_t v70 = [v9[239] keychainLabelForCertWithAccountID:v169 purpose:v170];

  id v71 = objc_alloc_init((Class)v39[325]);
  v163 = (void *)v70;
  [v71 setObject:v70 forKeyedSubscript:v41];
  [v71 setObject:kSecClassCertificate forKeyedSubscript:v42];
  uint64_t v72 = SecItemDelete((CFDictionaryRef)v71);
  v164 = v71;
  if (!v72)
  {
    unsigned int v74 = +[SSLogConfig sharedDaemonConfig];
    if (!v74)
    {
      unsigned int v74 = +[SSLogConfig sharedConfig];
    }
    unsigned int v78 = objc_msgSend(v74, "shouldLog", v156);
    if ([v74 shouldLogToDisk]) {
      v78 |= 2u;
    }
    CFTypeRef v76 = [v74 OSLogObject];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
      int v79 = v78;
    }
    else {
      int v79 = v78 & 2;
    }
    if (v79) {
      goto LABEL_95;
    }
LABEL_109:
    id v96 = &syslog_ptr;
    goto LABEL_110;
  }
  uint64_t v73 = v72;
  if (v72 != -25300)
  {
    CFStringRef v161 = v41;
    int v86 = SSError();

    v87 = +[NSNumber numberWithInt:v73];
    v168 = SSErrorBySettingUserInfoValue();

    unsigned int v74 = +[SSLogConfig sharedDaemonConfig];
    if (!v74)
    {
      unsigned int v74 = +[SSLogConfig sharedConfig];
    }
    unsigned int v88 = objc_msgSend(v74, "shouldLog", v156);
    if ([v74 shouldLogToDisk]) {
      v88 |= 2u;
    }
    CFTypeRef v76 = [v74 OSLogObject];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
      int v89 = v88;
    }
    else {
      int v89 = v88 & 2;
    }
    if (v89)
    {
      uint64_t v90 = objc_opt_class();
      id v91 = v90;
      unsigned int v92 = SSHashIfNeeded();
      unsigned int v93 = +[NSNumber numberWithInteger:v170];
      v94 = +[NSNumber numberWithInt:v73];
      int v174 = 138544130;
      v175 = v90;
      __int16 v176 = 2112;
      id v177 = v92;
      __int16 v178 = 2112;
      v179 = v93;
      __int16 v180 = 2114;
      v181 = v94;
      LODWORD(v160) = 42;
      v157 = &v174;
      CFDictionaryRef v95 = (void *)_os_log_send_and_compose_impl();

      if (!v95)
      {
        unint64_t v69 = v170;
        CFStringRef v41 = v161;
        goto LABEL_113;
      }
      CFTypeRef v76 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v95, 4, &v174, v160);
      free(v95);
      v157 = (int *)v76;
      SSFileLog();
      unint64_t v69 = v170;
    }
    CFStringRef v41 = v161;
    goto LABEL_108;
  }
  unsigned int v74 = +[SSLogConfig sharedDaemonConfig];
  if (!v74)
  {
    unsigned int v74 = +[SSLogConfig sharedConfig];
  }
  unsigned int v75 = objc_msgSend(v74, "shouldLog", v156);
  if ([v74 shouldLogToDisk]) {
    v75 |= 2u;
  }
  CFTypeRef v76 = [v74 OSLogObject];
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
    int v77 = v75;
  }
  else {
    int v77 = v75 & 2;
  }
  if (!v77) {
    goto LABEL_109;
  }
LABEL_95:
  CFStringRef v80 = v41;
  unsigned int v81 = objc_opt_class();
  id v82 = v81;
  unsigned int v83 = SSHashIfNeeded();
  id v84 = +[NSNumber numberWithInteger:v170];
  int v174 = 138543874;
  v175 = v81;
  __int16 v176 = 2112;
  id v177 = v83;
  __int16 v178 = 2114;
  v179 = v84;
  LODWORD(v160) = 32;
  v157 = &v174;
  id v85 = (void *)_os_log_send_and_compose_impl();

  if (v85)
  {
    CFTypeRef v76 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v85, 4, &v174, v160);
    free(v85);
    v157 = (int *)v76;
    SSFileLog();
    CFStringRef v41 = v80;
LABEL_108:
    id v96 = &syslog_ptr;
    CFStringRef v42 = kSecClass;
LABEL_110:

    goto LABEL_114;
  }
  CFStringRef v41 = v80;
LABEL_113:
  id v96 = &syslog_ptr;
  CFStringRef v42 = kSecClass;
LABEL_114:

  id v97 = objc_alloc_init((Class)v96[325]);
  [v97 setObject:ISBiometricsIntermediateCertKeychainLabel forKeyedSubscript:v41];
  [v97 setObject:kSecClassCertificate forKeyedSubscript:v42];
  uint64_t v98 = SecItemDelete((CFDictionaryRef)v97);
  if (!v98)
  {
    unsigned int v101 = +[SSLogConfig sharedDaemonConfig];
    id v100 = v168;
    unsigned int v102 = v162;
    if (!v101)
    {
      unsigned int v101 = +[SSLogConfig sharedConfig];
    }
    unsigned int v105 = objc_msgSend(v101, "shouldLog", v157);
    if ([v101 shouldLogToDisk]) {
      v105 |= 2u;
    }
    id v104 = [v101 OSLogObject];
    if (!os_log_type_enabled(v104, OS_LOG_TYPE_INFO)) {
      v105 &= 2u;
    }
    if (v105) {
      goto LABEL_131;
    }
    goto LABEL_145;
  }
  uint64_t v99 = v98;
  id v100 = v168;
  if (v98 == -25300)
  {
    unsigned int v101 = +[SSLogConfig sharedDaemonConfig];
    unsigned int v102 = v162;
    if (!v101)
    {
      unsigned int v101 = +[SSLogConfig sharedConfig];
    }
    unsigned int v103 = objc_msgSend(v101, "shouldLog", v157);
    if ([v101 shouldLogToDisk]) {
      v103 |= 2u;
    }
    id v104 = [v101 OSLogObject];
    if (!os_log_type_enabled(v104, OS_LOG_TYPE_INFO)) {
      v103 &= 2u;
    }
    if (v103)
    {
LABEL_131:
      v106 = objc_opt_class();
      id v107 = v106;
      unsigned int v108 = SSHashIfNeeded();
      int v174 = 138543618;
      v175 = v106;
      __int16 v176 = 2112;
      id v177 = v108;
      LODWORD(v160) = 22;
      v158 = &v174;
      unsigned int v109 = (void *)_os_log_send_and_compose_impl();

      if (!v109) {
        goto LABEL_146;
      }
      id v104 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v109, 4, &v174, v160);
      free(v109);
      v158 = (int *)v104;
      SSFileLog();
    }
LABEL_145:

    goto LABEL_146;
  }
  int v110 = SSError();

  id v111 = +[NSNumber numberWithInt:v99];
  uint64_t v112 = SSErrorBySettingUserInfoValue();

  unsigned int v101 = +[SSLogConfig sharedDaemonConfig];
  if (!v101)
  {
    unsigned int v101 = +[SSLogConfig sharedConfig];
  }
  unsigned int v113 = objc_msgSend(v101, "shouldLog", v157);
  if ([v101 shouldLogToDisk]) {
    int v114 = v113 | 2;
  }
  else {
    int v114 = v113;
  }
  id v104 = [v101 OSLogObject];
  if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
    int v115 = v114;
  }
  else {
    int v115 = v114 & 2;
  }
  if (!v115)
  {
LABEL_144:
    id v100 = (id)v112;
    unsigned int v102 = v162;
    unint64_t v69 = v170;
    goto LABEL_145;
  }
  uint64_t v116 = objc_opt_class();
  id v117 = v116;
  id v118 = SSHashIfNeeded();
  unsigned int v119 = +[NSNumber numberWithInt:v99];
  int v174 = 138543874;
  v175 = v116;
  __int16 v176 = 2112;
  id v177 = v118;
  __int16 v178 = 2114;
  v179 = v119;
  LODWORD(v160) = 32;
  v158 = &v174;
  unsigned int v120 = (void *)_os_log_send_and_compose_impl();

  if (v120)
  {
    id v104 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v120, 4, &v174, v160);
    free(v120);
    v158 = (int *)v104;
    SSFileLog();
    goto LABEL_144;
  }
  id v100 = (id)v112;
  unsigned int v102 = v162;
  unint64_t v69 = v170;
LABEL_146:

  id v121 = objc_alloc_init((Class)AMSKeychainOptions);
  objc_msgSend(v121, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
  if (v69 <= 1) {
    [v121 setPurpose:v69];
  }
  id v122 = objc_msgSend(v121, "style", v158);
  if (!v122)
  {
    v133 = +[SSLogConfig sharedDaemonConfig];
    id v123 = v163;
    uint64_t v124 = v169;
    if (!v133)
    {
      v133 = +[SSLogConfig sharedConfig];
    }
    unsigned int v134 = [v133 shouldLog];
    if ([v133 shouldLogToDisk]) {
      int v135 = v134 | 2;
    }
    else {
      int v135 = v134;
    }
    v136 = [v133 OSLogObject];
    if (!os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT)) {
      v135 &= 2u;
    }
    if (v135)
    {
      int v137 = objc_opt_class();
      int v174 = 138543362;
      v175 = v137;
      id v138 = v137;
      LODWORD(v160) = 12;
      v159 = &v174;
      unsigned int v139 = (void *)_os_log_send_and_compose_impl();

      if (!v139)
      {
LABEL_173:

        id v172 = v100;
        +[AMSKeychain deleteCertificateChainWithOptions:v121 error:&v172];
        v132 = v172;
        goto LABEL_174;
      }
      v136 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v139, 4, &v174, v160);
      free(v139);
      v159 = (int *)v136;
      SSFileLog();
    }

    goto LABEL_173;
  }
  id v123 = v163;
  uint64_t v124 = v169;
  if (v122 == (id)1)
  {
    v125 = +[SSLogConfig sharedDaemonConfig];
    if (!v125)
    {
      v125 = +[SSLogConfig sharedConfig];
    }
    unsigned int v126 = [v125 shouldLog];
    if ([v125 shouldLogToDisk]) {
      int v127 = v126 | 2;
    }
    else {
      int v127 = v126;
    }
    unsigned int v128 = [v125 OSLogObject];
    if (!os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT)) {
      v127 &= 2u;
    }
    if (v127)
    {
      v129 = objc_opt_class();
      int v174 = 138543362;
      v175 = v129;
      id v130 = v129;
      LODWORD(v160) = 12;
      v159 = &v174;
      id v131 = (void *)_os_log_send_and_compose_impl();

      if (!v131)
      {
LABEL_161:

        id v173 = v100;
        +[AMSKeychain deleteKeyPairWithOptions:v121 error:&v173];
        v132 = v173;
LABEL_174:
        v140 = v100;
        id v100 = v132;
        goto LABEL_186;
      }
      unsigned int v128 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v131, 4, &v174, v160);
      free(v131);
      v159 = (int *)v128;
      SSFileLog();
    }

    goto LABEL_161;
  }
  v140 = +[SSLogConfig sharedDaemonConfig];
  if (!v140)
  {
    v140 = +[SSLogConfig sharedConfig];
  }
  unsigned int v141 = [v140 shouldLog];
  if ([v140 shouldLogToDisk]) {
    int v142 = v141 | 2;
  }
  else {
    int v142 = v141;
  }
  __int16 v143 = [v140 OSLogObject];
  if (!os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT)) {
    v142 &= 2u;
  }
  if (v142)
  {
    unsigned int v144 = objc_opt_class();
    int v174 = 138543362;
    v175 = v144;
    id v145 = v144;
    LODWORD(v160) = 12;
    v159 = &v174;
    v146 = (void *)_os_log_send_and_compose_impl();

    if (!v146) {
      goto LABEL_186;
    }
    __int16 v143 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v146, 4, &v174, v160);
    free(v146);
    v159 = (int *)v143;
    SSFileLog();
  }

LABEL_186:
  if (!v100) {
    goto LABEL_199;
  }
  int v147 = +[SSLogConfig sharedDaemonConfig];
  if (!v147)
  {
    int v147 = +[SSLogConfig sharedConfig];
  }
  unsigned int v148 = objc_msgSend(v147, "shouldLog", v159);
  if ([v147 shouldLogToDisk]) {
    int v149 = v148 | 2;
  }
  else {
    int v149 = v148;
  }
  v150 = [v147 OSLogObject];
  if (!os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
    v149 &= 2u;
  }
  if (!v149) {
    goto LABEL_197;
  }
  v151 = objc_opt_class();
  int v174 = 138543618;
  v175 = v151;
  __int16 v176 = 2114;
  id v177 = v100;
  id v152 = v151;
  LODWORD(v160) = 22;
  v153 = (void *)_os_log_send_and_compose_impl();

  if (v153)
  {
    v150 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v153, 4, &v174, v160);
    free(v153);
    SSFileLog();
LABEL_197:
  }
LABEL_199:
  if (v166) {
    id *v166 = v100;
  }

  return v100 == 0;
}

- (BOOL)_generateKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v88 = 0;
  [(DaemonBiometricKeychain *)self _deleteKeychainTokensForAccountIdentifier:v8 purpose:a4 error:&v88];
  CFErrorRef v9 = (CFErrorRef)v88;
  id v10 = +[NSString stringWithFormat:@"%@", v8];
  id v84 = a5;
  if (v9)
  {
    CFDictionaryRef v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      CFDictionaryRef v11 = +[SSLogConfig sharedConfig];
    }
    id v12 = v8;
    unsigned int v13 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    unsigned int v15 = [v11 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      v14 &= 2u;
    }
    if (v14)
    {
      int v16 = objc_opt_class();
      id v17 = v16;
      unsigned int v18 = v10;
      int v19 = SSHashIfNeeded();
      id v20 = [(__CFError *)v9 localizedDescription];
      int v89 = 138543874;
      uint64_t v90 = v16;
      __int16 v91 = 2112;
      unsigned int v92 = v19;
      __int16 v93 = 2114;
      CFErrorRef v94 = v20;
      LODWORD(v75) = 32;
      id v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_31:

        BOOL v33 = 0;
        id v10 = v18;
        id v8 = v12;
        a5 = v84;
        goto LABEL_93;
      }
      unsigned int v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v89, v75);
      free(v21);
      SSFileLog();
    }
    else
    {
      unsigned int v18 = v10;
    }

    goto LABEL_31;
  }
  SecKeyRef publicKey = 0;
  SecKeyRef privateKey = 0;
  CFErrorRef error = 0;
  SecAccessControlRef v22 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, 0x40000002uLL, &error);
  SecAccessControlRef v23 = v22;
  if (v22) {
    BOOL v24 = error == 0;
  }
  else {
    BOOL v24 = 0;
  }
  if (v24)
  {
    SecAccessControlRef v83 = v22;
    if (a4 == 1)
    {
      uint64_t v34 = [(DaemonBiometricKeychain *)self _constraintsForExtendedActions];
    }
    else
    {
      if (a4) {
        goto LABEL_48;
      }
      uint64_t v34 = [(DaemonBiometricKeychain *)self _constraintsForPurchase];
    }
    uint64_t v35 = (void *)v34;
    if (v34)
    {
      id v36 = a5;
      unsigned int v81 = v10;
      SecAccessControlSetConstraints();
      id v37 = +[SSLogConfig sharedDaemonConfig];
      if (!v37)
      {
        id v37 = +[SSLogConfig sharedConfig];
      }
      unsigned int v38 = [v37 shouldLog];
      if ([v37 shouldLogToDisk]) {
        int v39 = v38 | 2;
      }
      else {
        int v39 = v38;
      }
      id v40 = [v37 OSLogObject];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        int v41 = v39;
      }
      else {
        int v41 = v39 & 2;
      }
      if (!v41)
      {
        a5 = v36;
        goto LABEL_60;
      }
      CFStringRef v42 = objc_opt_class();
      id v79 = v42;
      uint64_t v43 = SSHashIfNeeded();
      uint64_t v44 = +[NSNumber numberWithInteger:a4];
      int v89 = 138543874;
      uint64_t v90 = v42;
      __int16 v91 = 2112;
      unsigned int v92 = v43;
      __int16 v93 = 2114;
      CFErrorRef v94 = v44;
      LODWORD(v75) = 32;
      unsigned int v74 = &v89;
      NSHTTPCookiePropertyKey v45 = (void *)_os_log_send_and_compose_impl();

      if (v45)
      {
        id v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4, &v89, v75);
        free(v45);
        unsigned int v74 = (int *)v40;
        SSFileLog();
        SecAccessControlRef v23 = v83;
        a5 = v84;
LABEL_60:

        goto LABEL_61;
      }
LABEL_58:
      SecAccessControlRef v23 = v83;
      a5 = v84;
LABEL_61:
      id v10 = v81;
LABEL_62:

      goto LABEL_63;
    }
LABEL_48:
    uint64_t v35 = +[SSLogConfig sharedDaemonConfig];
    if (!v35)
    {
      uint64_t v35 = +[SSLogConfig sharedConfig];
    }
    unsigned int v46 = [v35 shouldLog];
    if ([v35 shouldLogToDisk]) {
      v46 |= 2u;
    }
    id v37 = [v35 OSLogObject];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      int v47 = v46;
    }
    else {
      int v47 = v46 & 2;
    }
    if (!v47) {
      goto LABEL_62;
    }
    int v48 = objc_opt_class();
    id v49 = v48;
    unsigned int v81 = v10;
    id v50 = SSHashIfNeeded();
    dispatch_time_t v51 = +[NSNumber numberWithInteger:a4];
    int v89 = 138543874;
    uint64_t v90 = v48;
    __int16 v91 = 2112;
    unsigned int v92 = v50;
    __int16 v93 = 2114;
    CFErrorRef v94 = v51;
    LODWORD(v75) = 32;
    unsigned int v74 = &v89;
    int64_t v52 = (void *)_os_log_send_and_compose_impl();

    if (!v52)
    {
      SecAccessControlRef v23 = v83;
      a5 = v84;
      id v10 = v81;
LABEL_63:

      uint64_t v53 = +[ISBiometricStore keychainLabelForAccountID:v8 purpose:a4];
      id v54 = objc_alloc_init((Class)NSMutableDictionary);
      [v54 setObject:v23 forKey:kSecAttrAccessControl];
      [v54 setObject:&__kCFBooleanTrue forKey:kSecAttrIsPermanent];
      id v82 = (void *)v53;
      [v54 setObject:v53 forKey:kSecAttrLabel];
      id v55 = objc_alloc_init((Class)NSMutableDictionary);
      [v55 setObject:kSecAttrTokenIDSecureEnclave forKey:kSecAttrTokenID];
      [v55 setObject:kSecAttrKeyTypeECSECPrimeRandom forKey:kSecAttrKeyType];
      [v55 setObject:&off_1003C91F8 forKey:kSecAttrKeySizeInBits];
      CFStringRef v80 = v54;
      [v55 setObject:v54 forKey:kSecPrivateKeyAttrs];
      unsigned int v78 = v55;
      uint64_t v56 = SecKeyGeneratePair((CFDictionaryRef)v55, &publicKey, &privateKey);
      BOOL v33 = v56 == 0;
      if (v56)
      {
        uint64_t v57 = v56;
        id v58 = SSError();
        unsigned int v59 = +[NSNumber numberWithInt:v57];
        SSErrorBySettingUserInfoValue();
        CFErrorRef v9 = (CFErrorRef)objc_claimAutoreleasedReturnValue();

        v60 = +[SSLogConfig sharedDaemonConfig];
        if (!v60)
        {
          v60 = +[SSLogConfig sharedConfig];
        }
        unsigned int v61 = objc_msgSend(v60, "shouldLog", v74);
        if ([v60 shouldLogToDisk]) {
          v61 |= 2u;
        }
        int v62 = [v60 OSLogObject];
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
          v61 &= 2u;
        }
        if (v61)
        {
          id v77 = v8;
          uint64_t v63 = objc_opt_class();
          id v76 = v63;
          id v64 = v10;
          unsigned int v65 = SSHashIfNeeded();
          unsigned int v66 = +[NSNumber numberWithInt:v57];
          int v89 = 138543874;
          uint64_t v90 = v63;
          __int16 v91 = 2112;
          unsigned int v92 = v65;
          __int16 v93 = 2114;
          CFErrorRef v94 = v66;
          LODWORD(v75) = 32;
          CFDictionaryRef v67 = (void *)_os_log_send_and_compose_impl();

          if (!v67)
          {
            SecAccessControlRef v23 = v83;
            a5 = v84;
            id v10 = v64;
            id v8 = v77;
LABEL_86:

LABEL_87:
            CFRelease(v23);
            if (privateKey) {
              CFRelease(privateKey);
            }
            goto LABEL_89;
          }
          int v62 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v67, 4, &v89, v75);
          free(v67);
          SSFileLog();
          SecAccessControlRef v23 = v83;
          a5 = v84;
          id v10 = v64;
          id v8 = v77;
        }
        else
        {
          SecAccessControlRef v23 = v83;
          a5 = v84;
        }
      }
      else
      {
        v60 = +[SSLogConfig sharedDaemonConfig];
        if (!v60)
        {
          v60 = +[SSLogConfig sharedConfig];
        }
        unsigned int v68 = objc_msgSend(v60, "shouldLog", v74);
        if ([v60 shouldLogToDisk]) {
          v68 |= 2u;
        }
        int v62 = [v60 OSLogObject];
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
          v68 &= 2u;
        }
        if (v68)
        {
          unint64_t v69 = objc_opt_class();
          id v70 = v69;
          id v71 = SSHashIfNeeded();
          int v89 = 138543618;
          uint64_t v90 = v69;
          __int16 v91 = 2112;
          unsigned int v92 = v71;
          LODWORD(v75) = 22;
          uint64_t v72 = (void *)_os_log_send_and_compose_impl();

          if (!v72)
          {
            CFErrorRef v9 = 0;
            a5 = v84;
            goto LABEL_86;
          }
          int v62 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v72, 4, &v89, v75);
          free(v72);
          SSFileLog();
          CFErrorRef v9 = 0;
          a5 = v84;
        }
        else
        {
          CFErrorRef v9 = 0;
        }
      }

      goto LABEL_86;
    }
    id v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v52, 4, &v89, v75);
    free(v52);
    unsigned int v74 = (int *)v37;
    SSFileLog();
    goto LABEL_58;
  }
  CFErrorRef v9 = error;
  id v25 = +[SSLogConfig sharedDaemonConfig];
  if (!v25)
  {
    id v25 = +[SSLogConfig sharedConfig];
  }
  unsigned int v26 = [v25 shouldLog];
  if ([v25 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  unsigned int v28 = [v25 OSLogObject];
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
    v27 &= 2u;
  }
  if (v27)
  {
    int v29 = objc_opt_class();
    id v30 = v29;
    int v31 = SSHashIfNeeded();
    int v89 = 138543874;
    uint64_t v90 = v29;
    __int16 v91 = 2112;
    unsigned int v92 = v31;
    __int16 v93 = 2114;
    CFErrorRef v94 = error;
    LODWORD(v75) = 32;
    id v32 = (void *)_os_log_send_and_compose_impl();

    if (!v32) {
      goto LABEL_27;
    }
    unsigned int v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v89, v75);
    free(v32);
    SSFileLog();
  }

LABEL_27:
  BOOL v33 = 0;
  a5 = v84;
  if (v23) {
    goto LABEL_87;
  }
LABEL_89:
  if (publicKey) {
    CFRelease(publicKey);
  }
  if (error) {
    CFRelease(error);
  }
LABEL_93:
  if (a5) {
    *a5 = v9;
  }

  return v33;
}

- (id)_presentPaymentSheetForChallenge:(id)a3 authContext:(id)a4 biometricContext:(id)a5 touchIDContext:(id)a6 touchIDOptions:(id)a7 accessControlRef:(__SecAccessControl *)a8 passwordToken:(id *)a9 paymentTokenData:(id *)a10 fpanID:(id *)a11 error:(id *)a12
{
  id v46 = a3;
  id v17 = a4;
  id v18 = a5;
  id v45 = a6;
  id v44 = a7;
  uint64_t v78 = 0;
  id v79 = &v78;
  uint64_t v80 = 0x3032000000;
  unsigned int v81 = sub_1000D0C10;
  id v82 = sub_1000D0C20;
  id v83 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = &v72;
  uint64_t v74 = 0x3032000000;
  uint64_t v75 = sub_1000D0C10;
  id v76 = sub_1000D0C20;
  id v77 = 0;
  uint64_t v66 = 0;
  CFDictionaryRef v67 = &v66;
  uint64_t v68 = 0x3032000000;
  unint64_t v69 = sub_1000D0C10;
  id v70 = sub_1000D0C20;
  id v71 = 0;
  uint64_t v60 = 0;
  unsigned int v61 = &v60;
  uint64_t v62 = 0x3032000000;
  uint64_t v63 = sub_1000D0C10;
  id v64 = sub_1000D0C20;
  id v65 = 0;
  uint64_t v54 = 0;
  id v55 = &v54;
  uint64_t v56 = 0x3032000000;
  uint64_t v57 = sub_1000D0C10;
  id v58 = sub_1000D0C20;
  id v59 = 0;
  int v19 = +[NSString stringWithFormat:@"%@", objc_opt_class()];
  id v20 = [DisplayPaymentSheetOperation alloc];
  id v21 = [v18 paymentSheet];
  SecAccessControlRef v22 = [(DisplayPaymentSheetOperation *)v20 initWithPaymentSheet:v21];

  SecAccessControlRef v23 = [v18 accountIdentifier];
  [(DisplayPaymentSheetOperation *)v22 setAccountIdentifier:v23];

  [(DisplayPaymentSheetOperation *)v22 setAuthenticationContext:v17];
  BOOL v24 = [v17 username];
  [(DisplayPaymentSheetOperation *)v22 setAccountName:v24];

  [(DisplayPaymentSheetOperation *)v22 setChallenge:v46];
  -[DisplayPaymentSheetOperation setTouchIDDelayEnabled:](v22, "setTouchIDDelayEnabled:", [v18 touchIDDelayEnabled]);
  id v25 = [v18 dialogId];
  [(DisplayPaymentSheetOperation *)v22 setDialogId:v25];

  [(DisplayPaymentSheetOperation *)v22 setLocalAuthAccessControlRef:a8];
  [(DisplayPaymentSheetOperation *)v22 setLocalAuthContext:v45];
  [(DisplayPaymentSheetOperation *)v22 setLocalAuthOptions:v44];
  unsigned int v26 = [v18 userAgent];
  [(DisplayPaymentSheetOperation *)v22 setUserAgent:v26];

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000DE524;
  v47[3] = &unk_1003A6188;
  id v27 = v19;
  id v48 = v27;
  id v49 = &v72;
  id v50 = &v78;
  dispatch_time_t v51 = &v66;
  int64_t v52 = &v60;
  uint64_t v53 = &v54;
  [(DisplayPaymentSheetOperation *)v22 setCompletionHandlerForAutoEnrollment:v47];
  unsigned int v28 = [[DisplayPaymentSheetContainerOperation alloc] initWithDisplayPaymentSheetOperation:v22];
  int v29 = +[SSLogConfig sharedDaemonConfig];
  if (!v29)
  {
    int v29 = +[SSLogConfig sharedConfig];
  }
  unsigned int v30 = [v29 shouldLog];
  unsigned int v31 = [v29 shouldLogToDisk];
  id v32 = [v29 OSLogObject];
  BOOL v33 = v32;
  if (v31) {
    v30 |= 2u;
  }
  if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
    v30 &= 2u;
  }
  if (!v30) {
    goto LABEL_10;
  }
  uint64_t v34 = objc_opt_class();
  int v84 = 138543362;
  id v85 = v34;
  id v35 = v34;
  LODWORD(v43) = 12;
  id v36 = (void *)_os_log_send_and_compose_impl();

  if (v36)
  {
    BOOL v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v84, v43);
    free(v36);
    SSFileLog();
LABEL_10:
  }
  [(DisplayPaymentSheetContainerOperation *)v28 start];
  if (!v73[5])
  {
    id v37 = [(DisplayPaymentSheetContainerOperation *)v28 error];
    BOOL v38 = v37 == 0;

    if (!v38)
    {
      uint64_t v39 = [(DisplayPaymentSheetContainerOperation *)v28 error];
      id v40 = (void *)v73[5];
      v73[5] = v39;
    }
  }
  if (a9) {
    *a9 = (id) v67[5];
  }
  if (a10) {
    *a10 = (id) v61[5];
  }
  if (a11) {
    *a11 = (id) v55[5];
  }
  if (a12) {
    *a12 = (id) v73[5];
  }
  id v41 = (id)v79[5];

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);

  return v41;
}

- (id)_publicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateKeys:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v72 = 0;
  id v11 = [(DaemonBiometricKeychain *)self _copyPublicKeyDataForAccountIdentifier:v10 purpose:a4 error:&v72];
  id v12 = v72;
  unsigned int v13 = v12;
  if (v11 || !v7)
  {
LABEL_32:
    if (!a6) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  int v14 = [v12 domain];
  unsigned int v15 = [v14 isEqualToString:SSErrorDomain];

  if (!v15)
  {
    id v11 = 0;
    goto LABEL_32;
  }
  CFDictionaryRef v67 = +[NSString stringWithFormat:@"%@", v10];
  int v16 = [v13 userInfo];
  id v17 = [v16 objectForKey:SSErrorKeychainStatusCodeKey];
  id v18 = [v17 integerValue];

  if (v18 != (id)-25300 || ![(DaemonBiometricKeychain *)self _isDeviceUnlocked])
  {
    id v65 = a6;
    uint64_t v43 = +[SSLogConfig sharedDaemonConfig];
    if (!v43)
    {
      uint64_t v43 = +[SSLogConfig sharedConfig];
    }
    unsigned int v44 = [v43 shouldLog];
    if ([v43 shouldLogToDisk]) {
      int v45 = v44 | 2;
    }
    else {
      int v45 = v44;
    }
    id v46 = [v43 OSLogObject];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
      int v47 = v45;
    }
    else {
      int v47 = v45 & 2;
    }
    if (v47)
    {
      id v48 = objc_opt_class();
      id v49 = v48;
      id v50 = SSHashIfNeeded();
      int v73 = 138543618;
      uint64_t v74 = v48;
      __int16 v75 = 2112;
      id v76 = v50;
      LODWORD(v62) = 22;
      dispatch_time_t v51 = (void *)_os_log_send_and_compose_impl();

      a6 = v65;
      if (!v51)
      {
LABEL_49:

        uint64_t v68 = v13;
        id v11 = [(DaemonBiometricKeychain *)self _regenerateKeychainTokensForAccountIdentifier:v10 purpose:a4 error:&v68];
        int64_t v52 = v68;
LABEL_50:
        id v31 = v52;

        goto LABEL_51;
      }
      id v46 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v51, 4, &v73, v62);
      free(v51);
      SSFileLog();
    }

    goto LABEL_49;
  }
  unsigned int v19 = +[ISBiometricStore shouldUseX509];
  uint64_t v20 = +[SSLogConfig sharedDaemonConfig];
  id v21 = (void *)v20;
  if (!v19)
  {
    if (!v20)
    {
      id v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v53 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v54 = v53 | 2;
    }
    else {
      int v54 = v53;
    }
    id v55 = [v21 OSLogObject];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT)) {
      int v56 = v54;
    }
    else {
      int v56 = v54 & 2;
    }
    if (v56)
    {
      uint64_t v57 = objc_opt_class();
      id v66 = v57;
      SSHashIfNeeded();
      v59 = id v58 = a6;
      int v73 = 138543618;
      uint64_t v74 = v57;
      __int16 v75 = 2112;
      id v76 = v59;
      LODWORD(v62) = 22;
      uint64_t v60 = (void *)_os_log_send_and_compose_impl();

      a6 = v58;
      if (!v60)
      {
LABEL_65:

        unint64_t v69 = v13;
        id v11 = [(DaemonBiometricKeychain *)self _regenerateKeychainTokensForAccountIdentifier:v10 purpose:a4 error:&v69];
        int64_t v52 = v69;
        goto LABEL_50;
      }
      id v55 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v60, 4, &v73, v62);
      free(v60);
      SSFileLog();
    }

    goto LABEL_65;
  }
  id v64 = a6;
  if (!v20)
  {
    id v21 = +[SSLogConfig sharedConfig];
  }
  unsigned int v22 = [v21 shouldLog];
  if ([v21 shouldLogToDisk]) {
    int v23 = v22 | 2;
  }
  else {
    int v23 = v22;
  }
  BOOL v24 = [v21 OSLogObject];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
    int v25 = v23;
  }
  else {
    int v25 = v23 & 2;
  }
  if (v25)
  {
    unsigned int v26 = objc_opt_class();
    id v63 = v26;
    id v27 = SSHashIfNeeded();
    unsigned int v28 = +[NSNumber numberWithInteger:a4];
    int v73 = 138543874;
    uint64_t v74 = v26;
    __int16 v75 = 2112;
    id v76 = v27;
    __int16 v77 = 2114;
    uint64_t v78 = v28;
    LODWORD(v62) = 32;
    unsigned int v61 = &v73;
    int v29 = (void *)_os_log_send_and_compose_impl();

    if (!v29) {
      goto LABEL_19;
    }
    BOOL v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v73, v62);
    free(v29);
    unsigned int v61 = (int *)v24;
    SSFileLog();
  }

LABEL_19:
  id v71 = v13;
  id v30 = [(DaemonBiometricKeychain *)self createX509CertChainDataForAccountIdentifier_:v10 purpose:a4 error:&v71];
  id v31 = v71;

  if (!v31)
  {
    id v70 = 0;
    id v11 = [(DaemonBiometricKeychain *)self _copyPublicKeyDataForAccountIdentifier:v10 purpose:a4 error:&v70];
    id v31 = v70;
    a6 = v64;
    goto LABEL_51;
  }
  id v32 = +[SSLogConfig sharedDaemonConfig];
  if (!v32)
  {
    id v32 = +[SSLogConfig sharedConfig];
  }
  unsigned int v33 = objc_msgSend(v32, "shouldLog", v61);
  if ([v32 shouldLogToDisk]) {
    int v34 = v33 | 2;
  }
  else {
    int v34 = v33;
  }
  id v35 = [v32 OSLogObject];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    int v36 = v34;
  }
  else {
    int v36 = v34 & 2;
  }
  if (!v36)
  {
    a6 = v64;
    goto LABEL_68;
  }
  id v37 = objc_opt_class();
  id v38 = v37;
  uint64_t v39 = SSHashIfNeeded();
  id v40 = +[NSNumber numberWithInteger:a4];
  int v73 = 138544130;
  uint64_t v74 = v37;
  __int16 v75 = 2112;
  id v76 = v39;
  __int16 v77 = 2114;
  uint64_t v78 = v40;
  __int16 v79 = 2114;
  id v80 = v31;
  LODWORD(v62) = 42;
  id v41 = (void *)_os_log_send_and_compose_impl();

  a6 = v64;
  if (v41)
  {
    id v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v73, v62);
    free(v41);
    SSFileLog();
LABEL_68:
  }
  id v11 = 0;
LABEL_51:

  unsigned int v13 = v31;
  if (a6) {
LABEL_33:
  }
    *a6 = v13;
LABEL_34:

  return v11;
}

- (id)_queryForPrivateKeyWithLabel:(id)a3 prompt:(id)a4
{
  return [(DaemonBiometricKeychain *)self _queryForPrivateKeyWithLabel:a3 prompt:a4 useTokenID:1];
}

- (id)_queryForPrivateKeyWithLabel:(id)a3 prompt:(id)a4 useTokenID:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    int v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      LODWORD(v19) = 138543362;
      *(void *)((char *)&v19 + 4) = objc_opt_class();
      id v15 = *(id *)((char *)&v19 + 4);
      LODWORD(v18) = 12;
      int v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_18:

        id v10 = 0;
        goto LABEL_19;
      }
      int v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v19, v18, v19);
      free(v16);
      SSFileLog();
    }

    goto LABEL_18;
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  [v9 setObject:kSecClassKey forKey:kSecClass];
  [v9 setObject:kSecAttrKeyClassPrivate forKey:kSecAttrKeyClass];
  [v9 setObject:&__kCFBooleanTrue forKey:kSecReturnRef];
  [v9 setObject:v7 forKey:kSecAttrLabel];
  if (v8) {
    [v9 setObject:v8 forKey:kSecUseOperationPrompt];
  }
  if (v5) {
    [v9 setObject:kSecAttrTokenIDSecureEnclave forKey:kSecAttrTokenID];
  }
  id v10 = +[NSDictionary dictionaryWithDictionary:v9];

LABEL_19:

  return v10;
}

- (id)_regenerateKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = sub_1000D0C10;
  unsigned int v44 = sub_1000D0C20;
  id v45 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_1000D0C10;
  id v38 = sub_1000D0C20;
  id v39 = 0;
  id v9 = +[NSString stringWithFormat:@"%@", v8];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DFB78;
  block[3] = &unk_1003A61B0;
  id v31 = &v40;
  block[4] = self;
  id v12 = v8;
  id v32 = &v34;
  int64_t v33 = a4;
  id v28 = v12;
  id v13 = v9;
  id v29 = v13;
  int v14 = v10;
  id v30 = v14;
  dispatch_async(dispatchQueue, block);
  dispatch_time_t v15 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v14, v15);
  if (!v41[5] && !v35[5])
  {
    int v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      int v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    unsigned int v18 = [v16 shouldLogToDisk];
    long long v19 = [v16 OSLogObject];
    uint64_t v20 = v19;
    if (v18) {
      v17 |= 2u;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      id v21 = (id)objc_opt_class();
      unsigned int v22 = SSHashIfNeeded();
      int v46 = 138543618;
      id v47 = v21;
      __int16 v48 = 2112;
      id v49 = v22;
      LODWORD(v26) = 22;
      int v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v46, v26);
      free(v23);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (a5) {
    *a5 = (id) v35[5];
  }
  id v24 = (id)v41[5];

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v24;
}

- (id)_signData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v72 = a3;
  id v8 = a4;
  id v9 = [v8 consolidatedDialog];
  uint64_t v74 = [v9 reason];

  int v73 = [v8 accountIdentifier];
  id v71 = +[NSString stringWithFormat:@"%@", v73];
  id v85 = 0;
  __int16 v75 = v8;
  dispatch_semaphore_t v10 = [(DaemonBiometricKeychain *)self copyAccessControlListForPrivateKeyWithBiometricAuthenticationContext:v8 error:&v85];
  id v11 = v85;
  id v12 = v11;
  if (v10 && !v11)
  {
    id v70 = a5;
    unsigned int v13 = [v8 isExtendedAction];
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    [v14 setObject:&__kCFBooleanFalse forKey:&off_1003C9210];
    [v14 setObject:&__kCFBooleanTrue forKey:&off_1003C9228];
    [v14 setObject:&off_1003C9240 forKey:&off_1003C9258];
    dispatch_time_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
    int v16 = [v15 localizedStringForKey:@"BIO_USE_PASSWORD" value:&stru_1003B9B00 table:@"Mesa"];
    [v14 setObject:v16 forKey:&off_1003C9270];

    if (v74) {
      [v14 setObject:v74 forKey:&off_1003C9288];
    }
    id v17 = objc_alloc_init((Class)ISWeakLinkedClassForString());
    unsigned int v18 = +[SSAccountStore defaultStore];
    long long v19 = [v18 accountWithUniqueIdentifier:v73];
    uint64_t v20 = v19;
    id v68 = v14;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      id v37 = +[SSAccountStore defaultStore];
      [v37 activeAccount];
      unsigned int v38 = v13;
      uint64_t v40 = v39 = v17;

      id v21 = (id)v40;
      id v17 = v39;
      unsigned int v13 = v38;
    }

    id v41 = [v75 paymentSheet];
    uint64_t v42 = [v41 authKitAuthenticationContextForAccount:v21];

    unint64_t v69 = v21;
    if ([v75 isPayment])
    {
      uint64_t v43 = v10;
      unsigned int v44 = +[SSLogConfig sharedDaemonConfig];
      if (!v44)
      {
        unsigned int v44 = +[SSLogConfig sharedConfig];
      }
      unsigned int v45 = [v44 shouldLog];
      if ([v44 shouldLogToDisk]) {
        int v46 = v45 | 2;
      }
      else {
        int v46 = v45;
      }
      id v47 = [v44 OSLogObject];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
        int v48 = v46;
      }
      else {
        int v48 = v46 & 2;
      }
      if (v48)
      {
        id v49 = objc_opt_class();
        int v86 = 138412290;
        v87 = v49;
        id v50 = v49;
        LODWORD(v67) = 12;
        dispatch_time_t v51 = (void *)_os_log_send_and_compose_impl();

        if (!v51)
        {
LABEL_36:

          id v84 = 0;
          id v82 = 0;
          id v83 = 0;
          uint64_t v81 = 0;
          int64_t v52 = (id *)&v81;
          unsigned int v53 = v68;
          uint64_t v36 = [(DaemonBiometricKeychain *)self _presentPaymentSheetForChallenge:v72 authContext:v42 biometricContext:v75 touchIDContext:v17 touchIDOptions:v68 accessControlRef:v43 passwordToken:&v84 paymentTokenData:&v83 fpanID:&v82 error:&v81];
          id v35 = v84;
          id v34 = v83;
          int v54 = v82;
LABEL_53:
          id v33 = v54;
LABEL_55:
          id v12 = *v52;

          CFRelease(v43);
          if (v35) {
            [v75 setPasswordEquivalentToken:v35];
          }
          a5 = v70;
          if (v34) {
            [v75 setPaymentTokenData:v34];
          }
          if (v33) {
            [v75 setFpanID:v33];
          }
          goto LABEL_61;
        }
        id v47 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v51, 4, &v86, v67);
        free(v51);
        SSFileLog();
      }

      goto LABEL_36;
    }
    if (!SSDebugShouldUseFileBasedPaymentSheetProxy())
    {
      uint64_t v76 = 0;
      int64_t v52 = (id *)&v76;
      unsigned int v53 = v68;
      uint64_t v36 = [(DaemonBiometricKeychain *)self signDataWithKeychain:v72 accountIdentifier:v73 purpose:v13 localAuthContext:v17 localAuthOptions:v68 error:&v76];
      id v35 = 0;
      id v34 = 0;
      uint64_t v43 = v10;
      id v33 = 0;
      goto LABEL_55;
    }
    uint64_t v43 = v10;
    id v55 = +[SSLogConfig sharedDaemonConfig];
    if (!v55)
    {
      id v55 = +[SSLogConfig sharedConfig];
    }
    unsigned int v56 = [v55 shouldLog];
    if ([v55 shouldLogToDisk]) {
      int v57 = v56 | 2;
    }
    else {
      int v57 = v56;
    }
    id v58 = [v55 OSLogObject];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
      int v59 = v57;
    }
    else {
      int v59 = v57 & 2;
    }
    if (v59)
    {
      uint64_t v60 = objc_opt_class();
      int v86 = 138412290;
      v87 = v60;
      id v61 = v60;
      LODWORD(v67) = 12;
      uint64_t v62 = (void *)_os_log_send_and_compose_impl();

      if (!v62)
      {
LABEL_50:

        id v63 = [v75 paymentSheet];

        if (!v63)
        {
          id v64 = +[ISBiometricStore diskBasedPaymentSheet];
          [v75 setPaymentSheet:v64];
        }
        id v79 = 0;
        id v80 = 0;
        uint64_t v77 = 0;
        uint64_t v78 = 0;
        int64_t v52 = (id *)&v77;
        unsigned int v53 = v68;
        uint64_t v36 = [(DaemonBiometricKeychain *)self _presentPaymentSheetForChallenge:v72 authContext:v42 biometricContext:v75 touchIDContext:v17 touchIDOptions:v68 accessControlRef:v43 passwordToken:&v80 paymentTokenData:&v79 fpanID:&v78 error:&v77];
        id v35 = v80;
        id v34 = v79;
        int v54 = v78;
        goto LABEL_53;
      }
      id v58 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v62, 4, &v86, v67);
      free(v62);
      SSFileLog();
    }

    goto LABEL_50;
  }
  unsigned int v22 = v10;
  int v23 = +[SSLogConfig sharedDaemonConfig];
  if (!v23)
  {
    int v23 = +[SSLogConfig sharedConfig];
  }
  unsigned int v24 = [v23 shouldLog];
  if ([v23 shouldLogToDisk]) {
    int v25 = v24 | 2;
  }
  else {
    int v25 = v24;
  }
  uint64_t v26 = [v23 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
    int v27 = v25;
  }
  else {
    int v27 = v25 & 2;
  }
  if (!v27) {
    goto LABEL_18;
  }
  id v28 = objc_opt_class();
  id v29 = a5;
  id v30 = v28;
  id v31 = SSHashIfNeeded();
  int v86 = 138543874;
  v87 = v28;
  __int16 v88 = 2112;
  int v89 = v31;
  __int16 v90 = 2114;
  id v91 = v12;
  LODWORD(v67) = 32;
  id v32 = (void *)_os_log_send_and_compose_impl();

  a5 = v29;
  if (v32)
  {
    uint64_t v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v86, v67);
    free(v32);
    SSFileLog();
LABEL_18:
  }
  if (v22) {
    CFRelease(v22);
  }
  id v33 = 0;
  id v34 = 0;
  id v35 = 0;
  uint64_t v36 = 0;
LABEL_61:
  if (a5) {
    *a5 = v12;
  }
  id v65 = v36;

  return v65;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueueX509, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end