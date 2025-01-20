@interface ISBiometricStore
+ (BOOL)isActionSupported:(int64_t)a3 withBiometricAuthenticationContext:(id)a4;
+ (BOOL)shouldUseApplePayClassic;
+ (BOOL)shouldUseAutoEnrollment;
+ (BOOL)shouldUseExtendedEnrollment;
+ (BOOL)shouldUseUpsellEnrollment;
+ (BOOL)shouldUseX509;
+ (BOOL)tokenUpdateShouldStartWithLogKey:(id)a3;
+ (id)applePayClassicNetworks;
+ (id)countryCode;
+ (id)diskBasedPaymentSheet;
+ (id)keychainLabelForAccountID:(id)a3 purpose:(int64_t)a4;
+ (id)keychainLabelForCertWithAccountID:(id)a3 purpose:(int64_t)a4;
+ (id)keychainLabelForKeyWithAccountID:(id)a3 purpose:(int64_t)a4;
+ (id)sharedInstance;
+ (int64_t)tokenUpdateState;
+ (void)tokenUpdateDidFinishWithLogKey:(id)a3;
- (BOOL)canPerformBiometricOptIn;
- (BOOL)canPerformExtendedBiometricActionsForAccountIdentifier:(id)a3;
- (BOOL)deleteKeychainTokensForAccountIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isBiometricStateEnabled;
- (BOOL)isIdentityMapValidForAccountIdentifier:(id)a3;
- (ISBiometricStore)init;
- (NSNumber)lastRegisteredAccountIdentifier;
- (id)createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)fetchContextFromCacheWithToken:(id)a3 evict:(BOOL)a4;
- (id)publicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)signData:(id)a3 context:(id)a4 error:(id *)a5;
- (id)x509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 error:(id *)a6;
- (int64_t)biometricAvailabilityForAccountIdentifier:(id)a3;
- (int64_t)biometricState;
- (unint64_t)identityMapCount;
- (unint64_t)keyCountForAccountIdentifier:(id)a3;
- (void)addContextToCache:(id)a3 withToken:(id)a4;
- (void)clearLastRegisteredAccountIdentifier;
- (void)registerAccountIdentifier:(id)a3;
- (void)saveIdentityMapForAccountIdentifier:(id)a3;
- (void)setBiometricState:(int64_t)a3;
@end

@implementation ISBiometricStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __34__ISBiometricStore_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(ISBiometricStore);

  return MEMORY[0x270F9A758]();
}

- (ISBiometricStore)init
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)ISBiometricStore;
  v2 = [(ISBiometricStore *)&v16 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v3)
    {
      v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    v6 = [v3 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      v5 &= 2u;
    }
    if (v5)
    {
      v7 = objc_opt_class();
      int v17 = 138543618;
      v18 = v7;
      __int16 v19 = 2050;
      v20 = v2;
      id v8 = v7;
      LODWORD(v15) = 22;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_13:

        v10 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
        contextCache = v2->_contextCache;
        v2->_contextCache = v10;

        [(NSCache *)v2->_contextCache setCountLimit:5];
        v12 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
        lock = v2->_lock;
        v2->_lock = v12;

        return v2;
      }
      v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v17, v15);
      free(v9);
      SSFileLog();
    }

    goto LABEL_13;
  }
  return v2;
}

- (void)addContextToCache:(id)a3 withToken:(id)a4
{
  lock = self->_lock;
  id v7 = a4;
  id v8 = a3;
  [(NSLock *)lock lock];
  [(NSCache *)self->_contextCache setObject:v8 forKey:v7];

  v9 = self->_lock;

  [(NSLock *)v9 unlock];
}

+ (id)applePayClassicNetworks
{
  v30[1] = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(ISLoadURLBagOperation);
  int v4 = +[ISOperationQueue mainQueue];
  v30[0] = v3;
  int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  [v4 addOperations:v5 waitUntilFinished:1];

  if (![(ISOperation *)v3 success])
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      v11 |= 2u;
    }
    v9 = [v7 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v26 = 138543362;
      id v27 = (id)objc_opt_class();
      id v12 = v27;
      LODWORD(v22) = 12;
      uint64_t v21 = &v26;
      id v10 = (id)_os_log_send_and_compose_impl();

      if (!v10) {
        goto LABEL_16;
      }
      v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v26, v22);
      free(v10);
      uint64_t v21 = (int *)v9;
      SSFileLog();
    }
    id v10 = 0;
    goto LABEL_14;
  }
  v6 = [(ISLoadURLBagOperation *)v3 URLBag];
  id v7 = [v6 valueForKey:@"apple-pay-classic-networks"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __43__ISBiometricStore_applePayClassicNetworks__block_invoke;
    v23[3] = &unk_264260950;
    id v24 = v8;
    id v25 = a1;
    v9 = v8;
    [v7 enumerateObjectsUsingBlock:v23];
    id v10 = [v9 copy];

LABEL_14:
    goto LABEL_16;
  }
  id v10 = 0;
LABEL_16:

  v13 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v13)
  {
    v13 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v14 = objc_msgSend(v13, "shouldLog", v21);
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  objc_super v16 = [v13 OSLogObject];
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
    v15 &= 2u;
  }
  if (v15)
  {
    int v17 = objc_opt_class();
    int v26 = 138543618;
    id v27 = v17;
    __int16 v28 = 2114;
    id v29 = v10;
    id v18 = v17;
    LODWORD(v22) = 22;
    __int16 v19 = (void *)_os_log_send_and_compose_impl();

    if (!v19) {
      goto LABEL_27;
    }
    objc_super v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v26, v22);
    free(v19);
    SSFileLog();
  }

LABEL_27:

  return v10;
}

void __43__ISBiometricStore_applePayClassicNetworks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 lowercaseString];
  if (([v4 isEqualToString:@"visa"] & 1) == 0)
  {
    char v5 = [v3 isEqualToString:@"Visa"];

    if (v5) {
      goto LABEL_4;
    }
    id v7 = [v3 lowercaseString];
    if ([v7 isEqualToString:@"discover"])
    {

LABEL_8:
      v6 = "PKPaymentNetworkDiscover";
      goto LABEL_17;
    }
    char v8 = [v3 isEqualToString:@"Discover"];

    if (v8) {
      goto LABEL_8;
    }
    v9 = [v3 lowercaseString];
    if ([v9 isEqualToString:@"mastercard"])
    {

LABEL_12:
      v6 = "PKPaymentNetworkMasterCard";
      goto LABEL_17;
    }
    char v10 = [v3 isEqualToString:@"MasterCard"];

    if (v10) {
      goto LABEL_12;
    }
    int v11 = [v3 lowercaseString];
    if ([v11 isEqualToString:@"american express"])
    {

LABEL_16:
      v6 = "PKPaymentNetworkAmex";
      goto LABEL_17;
    }
    char v12 = [v3 isEqualToString:@"AmEx"];

    if (v12) {
      goto LABEL_16;
    }
    int v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v14)
    {
      int v14 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    int v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      *(_DWORD *)uint64_t v21 = 138543618;
      *(void *)&v21[4] = objc_opt_class();
      *(_WORD *)&v21[12] = 2114;
      *(void *)&v21[14] = v3;
      id v18 = *(id *)&v21[4];
      LODWORD(v20) = 22;
      __int16 v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_30:

        [*(id *)(a1 + 32) addObject:v3];
        goto LABEL_18;
      }
      int v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, v21, v20, *(_OWORD *)v21, *(void *)&v21[16], v22);
      free(v19);
      SSFileLog();
    }

    goto LABEL_30;
  }

LABEL_4:
  v6 = "PKPaymentNetworkVisa";
LABEL_17:
  v13 = ISWeakLinkedStringConstantForString(v6, (const void *)0x26);
  [*(id *)(a1 + 32) addObject:v13];

LABEL_18:
}

- (int64_t)biometricState
{
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"AMSDeviceBiometricsState", @"com.apple.AppleMediaServices", 0);
  if (AppIntegerValue == 2) {
    return 1;
  }
  else {
    return 2 * (AppIntegerValue == 1);
  }
}

- (int64_t)biometricAvailabilityForAccountIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    int64_t v15 = 4;
    goto LABEL_22;
  }
  char v5 = [MEMORY[0x263F53C50] sharedConnection];
  int v6 = [v5 isPasscodeSet];

  if (!v6 || ![(ISBiometricStore *)self identityMapCount])
  {
    int64_t v15 = 3;
    goto LABEL_22;
  }
  if (![(ISBiometricStore *)self isIdentityMapValidForAccountIdentifier:v4])
  {
    int64_t v15 = 2;
    goto LABEL_22;
  }
  id v7 = [(ISBiometricStore *)self lastRegisteredAccountIdentifier];
  char v8 = [v7 isEqualToNumber:v4];

  if ((v8 & 1) == 0)
  {
    v9 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v9)
    {
      v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    char v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      LODWORD(v18) = 138543362;
      *(void *)((char *)&v18 + 4) = objc_opt_class();
      id v13 = *(id *)((char *)&v18 + 4);
      LODWORD(v17) = 12;
      int v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_17:

        goto LABEL_18;
      }
      char v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v18, v17, v18);
      free(v14);
      SSFileLog();
    }

    goto LABEL_17;
  }
LABEL_18:
  int64_t v15 = 0;
LABEL_22:

  return v15;
}

- (BOOL)canPerformBiometricOptIn
{
  unint64_t v2 = [(ISBiometricStore *)self identityMapCount];
  if (v2)
  {
    id v3 = [MEMORY[0x263F53C50] sharedConnection];
    char v4 = [v3 isPasscodeSet];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)canPerformExtendedBiometricActionsForAccountIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t v4 = [(ISBiometricStore *)self biometricAvailabilityForAccountIdentifier:a3];
  int64_t v5 = [(ISBiometricStore *)self biometricState];
  int64_t v6 = v5;
  if (!v4 || v5 != 2) {
    return !v4 && v6 == 2;
  }
  id v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  int v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_13;
  }
  int v11 = objc_opt_class();
  char v12 = NSNumber;
  id v13 = v11;
  [v12 numberWithInteger:v4];
  int v18 = 138543618;
  uint64_t v19 = v11;
  __int16 v20 = 2114;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 22;
  int v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v18, v17);
    free(v14);
    SSFileLog();
LABEL_13:
  }
  return !v4 && v6 == 2;
}

- (void)clearLastRegisteredAccountIdentifier
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v2 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v2)
  {
    unint64_t v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  int64_t v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v9) = 138543362;
  *(void *)((char *)&v9 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v9 + 4);
  LODWORD(v8) = 12;
  id v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int64_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
    free(v7);
    SSFileLog();
LABEL_11:
  }
  CFPreferencesSetAppValue(@"BiometricAccountID", 0, (CFStringRef)*MEMORY[0x263F7BDC8]);
}

+ (id)countryCode
{
  v15[1] = *MEMORY[0x263EF8340];
  unint64_t v2 = objc_alloc_init(ISLoadURLBagOperation);
  int v3 = +[ISOperationQueue mainQueue];
  v15[0] = v2;
  int v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v3 addOperations:v4 waitUntilFinished:1];

  if ([(ISOperation *)v2 success])
  {
    int64_t v5 = [(ISLoadURLBagOperation *)v2 URLBag];
    id v6 = [v5 valueForKey:@"countryCode"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v6;
      id v7 = v6;
      goto LABEL_16;
    }
  }
  else
  {
    id v6 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = [v6 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      LODWORD(v14) = 138543362;
      *(void *)((char *)&v14 + 4) = objc_opt_class();
      id v11 = *(id *)((char *)&v14 + 4);
      LODWORD(v13) = 12;
      id v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7) {
        goto LABEL_16;
      }
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v14, v13, v14);
      free(v7);
      SSFileLog();
    }
  }
  id v7 = 0;
LABEL_16:

  return v7;
}

+ (id)diskBasedPaymentSheet
{
  v28[2] = *MEMORY[0x263EF8340];
  if (!SSDebugShouldUseFileBasedPaymentSheetProxy())
  {
    id v7 = 0;
    goto LABEL_44;
  }
  unint64_t v2 = CPSharedResourcesDirectory();
  if ([v2 length])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08850]);
    v28[0] = v2;
    v28[1] = @"paymentSheet.plist";
    int v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    int64_t v5 = [NSString pathWithComponents:v4];
    if ([v5 length] && objc_msgSend(v3, "fileExistsAtPath:", v5))
    {
      id v6 = [NSDictionary dictionaryWithContentsOfFile:v5];
      if (v6)
      {
        id v7 = (void *)[objc_alloc(MEMORY[0x263F7B2A8]) initWithServerResponse:v6];
LABEL_42:

        goto LABEL_43;
      }
      uint64_t v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v10)
      {
        uint64_t v10 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v17 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      uint64_t v19 = [v10 OSLogObject];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        v18 &= 2u;
      }
      if (!v18) {
        goto LABEL_40;
      }
      int v24 = 138543618;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2114;
      id v27 = v5;
      id v23 = v25;
      LODWORD(v22) = 22;
      __int16 v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v24, v22);
        free(v20);
        SSFileLog();
LABEL_40:
      }
    }
    else
    {
      id v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v6)
      {
        id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v8 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      uint64_t v10 = [v6 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        v9 &= 2u;
      }
      if (v9)
      {
        int v24 = 138543618;
        id v25 = (id)objc_opt_class();
        __int16 v26 = 2114;
        id v27 = v5;
        id v11 = v25;
        LODWORD(v22) = 22;
        id v7 = (void *)_os_log_send_and_compose_impl();

        if (!v7) {
          goto LABEL_42;
        }
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v24, v22);
        free(v7);
        SSFileLog();
      }
    }

    id v7 = 0;
    goto LABEL_42;
  }
  id v3 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v12 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  long long v14 = [v3 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_28;
  }
  int v24 = 138543362;
  id v25 = (id)objc_opt_class();
  id v15 = v25;
  LODWORD(v22) = 12;
  int v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    long long v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v24, v22);
    free(v16);
    SSFileLog();
LABEL_28:
  }
  id v7 = 0;
LABEL_43:

LABEL_44:

  return v7;
}

- (id)fetchContextFromCacheWithToken:(id)a3 evict:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  id v7 = [(NSCache *)self->_contextCache objectForKey:v6];
  if (v4) {
    [(NSCache *)self->_contextCache removeObjectForKey:v6];
  }
  [(NSLock *)self->_lock unlock];

  return v7;
}

- (unint64_t)identityMapCount
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__0;
  v27[4] = __Block_byref_object_dispose__0;
  id v28 = 0;
  if (!SSIsDaemon())
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    BOOL v4 = objc_opt_new();
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __36__ISBiometricStore_identityMapCount__block_invoke;
    uint64_t v22 = &unk_264260978;
    id v25 = v27;
    id v23 = self;
    __int16 v26 = &v29;
    id v3 = v6;
    int v24 = v3;
    [v4 getIdentityMapCountWithCompletionBlock:&v19];
    dispatch_time_t v7 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v3, v7))
    {
LABEL_15:

      goto LABEL_16;
    }
    int v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    int v10 = [v8 shouldLogToDisk];
    id v11 = [v8 OSLogObject];
    int v12 = v11;
    if (v10) {
      v9 |= 2u;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v13 = objc_opt_class();
      int v33 = 138543362;
      v34 = v13;
      id v14 = v13;
      LODWORD(v18) = 12;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_14:

        goto LABEL_15;
      }
      int v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v33, v18, v19, v20, v21, v22, v23);
      free(v15);
      SSFileLog();
    }

    goto LABEL_14;
  }
  NSClassFromString(&cfstr_Daemonbiometri.isa);
  id v3 = objc_opt_new();
  BOOL v4 = [v3 identityMap];
  uint64_t v5 = [v4 count];
  v30[3] = v5;
LABEL_16:

  unint64_t v16 = v30[3];
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(&v29, 8);
  return v16;
}

void __36__ISBiometricStore_identityMapCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
    goto LABEL_15;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  dispatch_time_t v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v7)
  {
    dispatch_time_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  int v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_12;
  }
  id v11 = objc_opt_class();
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  *(_DWORD *)unint64_t v16 = 138543618;
  *(void *)&v16[4] = v11;
  *(_WORD *)&v16[12] = 2114;
  *(void *)&v16[14] = v12;
  id v13 = v11;
  LODWORD(v15) = 22;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, v16, v15, *(_OWORD *)v16, *(void *)&v16[16], v17);
    free(v14);
    SSFileLog();
LABEL_12:
  }
LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)isBiometricStateEnabled
{
  return CFPreferencesGetAppIntegerValue(@"BiometricStateEnabled", (CFStringRef)*MEMORY[0x263F7BDC8], 0) == 2;
}

+ (BOOL)isActionSupported:(int64_t)a3 withBiometricAuthenticationContext:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (SSIsDaemon())
  {
    dispatch_time_t v7 = [NSClassFromString(&cfstr_Daemonbiometri_0.isa) sharedInstance];
    id v38 = 0;
    int v8 = (const void *)[v7 copyAccessControlListForPrivateKeyWithBiometricAuthenticationContext:v6 error:&v38];
    int v9 = v38;

    if (v8)
    {
      char v10 = [MEMORY[0x263F27B60] isActionSupported:a3 withAccessControl:v8];
      CFRelease(v8);
      goto LABEL_32;
    }
    uint64_t v22 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v22)
    {
      uint64_t v22 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    id v25 = [v22 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      v24 &= 2u;
    }
    if (v24)
    {
      __int16 v26 = objc_opt_class();
      *(_DWORD *)v41 = 138543618;
      *(void *)&v41[4] = v26;
      *(_WORD *)&v41[12] = 2114;
      *(void *)&v41[14] = v9;
      id v27 = v26;
      LODWORD(v30) = 22;
      id v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_29:

        char v10 = 0;
        goto LABEL_32;
      }
      id v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, v41, v30);
      free(v28);
      SSFileLog();
    }

    goto LABEL_29;
  }
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  *(void *)v41 = 0;
  *(void *)&v41[8] = v41;
  *(void *)&v41[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  id v44 = 0;
  id v12 = objc_alloc_init(MEMORY[0x263F7B138]);
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  int v33 = __73__ISBiometricStore_isActionSupported_withBiometricAuthenticationContext___block_invoke;
  v34 = &unk_2642609A0;
  v36 = v41;
  id v37 = a1;
  int v9 = v11;
  uint64_t v35 = v9;
  [v12 getConstraintsDictionaryForPurpose:a3 > 99 completion:&v31];
  dispatch_time_t v13 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v9, v13))
  {
    id v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v14)
    {
      id v14 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = [v14 shouldLog];
    int v16 = [v14 shouldLogToDisk];
    uint64_t v17 = [v14 OSLogObject];
    uint64_t v18 = v17;
    if (v16) {
      v15 |= 2u;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      uint64_t v19 = objc_opt_class();
      int v39 = 138543362;
      v40 = v19;
      id v20 = v19;
      LODWORD(v30) = 12;
      id v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v39, v30, v31, v32, v33, v34);
      free(v21);
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:
  if (*(void *)(*(void *)&v41[8] + 40)) {
    char v10 = objc_msgSend(MEMORY[0x263F27B60], "isActionSupported:withConstraints:", a3);
  }
  else {
    char v10 = 0;
  }

  _Block_object_dispose(v41, 8);
LABEL_32:

  return v10;
}

void __73__ISBiometricStore_isActionSupported_withBiometricAuthenticationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (!v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    goto LABEL_15;
  }
  int v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v8)
  {
    int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  dispatch_semaphore_t v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_12;
  }
  *(_DWORD *)int v15 = 138543618;
  *(void *)&v15[4] = objc_opt_class();
  *(_WORD *)&v15[12] = 2114;
  *(void *)&v15[14] = v7;
  id v12 = *(id *)&v15[4];
  LODWORD(v14) = 22;
  dispatch_time_t v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    dispatch_semaphore_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16], v16);
    free(v13);
    SSFileLog();
LABEL_12:
  }
LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isIdentityMapValidForAccountIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  id v27 = 0;
  if (!SSIsDaemon())
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    int v8 = objc_opt_new();
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__ISBiometricStore_isIdentityMapValidForAccountIdentifier___block_invoke;
    v21[3] = &unk_2642609C8;
    int v24 = v26;
    v21[4] = self;
    id v22 = v4;
    id v25 = &v28;
    uint64_t v5 = v7;
    int v23 = v5;
    [v8 isIdentityMapValidForAccountIdentifier:v22 completionBlock:v21];
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    if (!dispatch_semaphore_wait(v5, v9))
    {
LABEL_15:

      goto LABEL_16;
    }
    int v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v10)
    {
      int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v10 shouldLog];
    int v12 = [v10 shouldLogToDisk];
    dispatch_time_t v13 = [v10 OSLogObject];
    uint64_t v14 = v13;
    if (v12) {
      v11 |= 2u;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v15 = objc_opt_class();
      int v32 = 138543362;
      int v33 = v15;
      id v16 = v15;
      LODWORD(v20) = 12;
      uint64_t v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v32, v20);
      free(v17);
      SSFileLog();
    }

    goto LABEL_14;
  }
  NSClassFromString(&cfstr_Daemonbiometri.isa);
  uint64_t v5 = objc_opt_new();
  char v6 = [v5 isIdentityMapValidForAccountIdentifier:v4];
  *((unsigned char *)v29 + 24) = v6;
LABEL_16:

  BOOL v18 = *((unsigned char *)v29 + 24) != 0;
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(&v28, 8);
  return v18;
}

void __59__ISBiometricStore_isIdentityMapValidForAccountIdentifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    dispatch_semaphore_t v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v7)
    {
      dispatch_semaphore_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v11 = objc_opt_class();
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)uint64_t v17 = 138543874;
      *(void *)&v17[4] = v11;
      *(_WORD *)&v17[12] = 2112;
      *(void *)&v17[14] = v12;
      *(_WORD *)&v17[22] = 2114;
      uint64_t v18 = v13;
      id v14 = v11;
      LODWORD(v16) = 32;
      int v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        goto LABEL_14;
      }
      int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v17, v16, *(_OWORD *)v17, *(void *)&v17[16], v18);
      free(v15);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (unint64_t)keyCountForAccountIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  if (!SSIsDaemon())
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = objc_alloc_init(MEMORY[0x263F7B1E0]);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__ISBiometricStore_keyCountForAccountIdentifier___block_invoke;
    v21[3] = &unk_2642609F0;
    v21[4] = self;
    int v23 = &v24;
    uint64_t v5 = v7;
    id v22 = v5;
    [v8 keyCountForAccountIdentifier:v4 completionBlock:v21];
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v5, v9))
    {
LABEL_15:

      goto LABEL_16;
    }
    int v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v10)
    {
      int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v10 shouldLog];
    int v12 = [v10 shouldLogToDisk];
    uint64_t v13 = [v10 OSLogObject];
    id v14 = v13;
    if (v12) {
      v11 |= 2u;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v15 = objc_opt_class();
      int v28 = 138543362;
      uint64_t v29 = v15;
      id v16 = v15;
      LODWORD(v20) = 12;
      uint64_t v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v28, v20);
      free(v17);
      SSFileLog();
    }

    goto LABEL_14;
  }
  NSClassFromString(&cfstr_Daemonbiometri.isa);
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [v5 keyCountForAccountIdentifier:v4];
  v25[3] = v6;
LABEL_16:

  unint64_t v18 = v25[3];
  _Block_object_dispose(&v24, 8);

  return v18;
}

void __49__ISBiometricStore_keyCountForAccountIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    dispatch_time_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      *(_DWORD *)uint64_t v13 = 138543618;
      *(void *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2114;
      *(void *)&v13[14] = v5;
      id v10 = *(id *)&v13[4];
      LODWORD(v12) = 22;
      int v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      dispatch_time_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v13, v12, *(_OWORD *)v13, *(void *)&v13[16], v14);
      free(v11);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NSNumber)lastRegisteredAccountIdentifier
{
  unint64_t v2 = (void *)CFPreferencesCopyAppValue(@"BiometricAccountID", (CFStringRef)*MEMORY[0x263F7BDC8]);

  return (NSNumber *)v2;
}

- (void)registerAccountIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  *(_DWORD *)uint64_t v12 = 138543618;
  *(void *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2114;
  *(void *)&v12[14] = v3;
  id v8 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  dispatch_time_t v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16], v13);
    free(v9);
    SSFileLog();
LABEL_11:
  }
  CFStringRef v10 = (const __CFString *)*MEMORY[0x263F7BDC8];
  CFPreferencesSetAppValue(@"BiometricAccountID", v3, (CFStringRef)*MEMORY[0x263F7BDC8]);
  CFPreferencesAppSynchronize(v10);
}

- (void)saveIdentityMapForAccountIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!SSIsDaemon())
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    int v7 = objc_opt_new();
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __56__ISBiometricStore_saveIdentityMapForAccountIdentifier___block_invoke;
    v19[3] = &unk_264260A18;
    v19[4] = self;
    id v8 = v6;
    uint64_t v20 = v8;
    [v7 saveIdentityMapForAccountIdentifier:v4 completionBlock:v19];

    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    if (!dispatch_semaphore_wait(v8, v9))
    {
LABEL_18:

      return;
    }
    CFStringRef v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v10)
    {
      CFStringRef v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      uint64_t v14 = objc_opt_class();
      int v21 = 138543362;
      id v22 = v14;
      id v15 = v14;
      LODWORD(v17) = 12;
      id v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v21, v17);
      free(v16);
      SSFileLog();
    }

    goto LABEL_17;
  }
  NSClassFromString(&cfstr_Daemonbiometri.isa);
  id v18 = (id)objc_opt_new();
  int v5 = [v18 identityMap];
  [v18 saveIdentityMap:v5 forAccountIdentifier:v4];
}

void __56__ISBiometricStore_saveIdentityMapForAccountIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    dispatch_semaphore_t v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v6)
    {
      dispatch_semaphore_t v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    dispatch_time_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      *(_DWORD *)uint64_t v23 = 138543618;
      *(void *)&void v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v5;
      id v10 = *(id *)&v23[4];
      LODWORD(v22) = 22;
      int v21 = v23;
      int v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      dispatch_time_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16], v24);
      free(v11);
      int v21 = v9;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  int v12 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v21);
  if (!v12)
  {
    int v12 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  id v15 = [v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_24;
  }
  id v16 = objc_opt_class();
  uint64_t v17 = NSNumber;
  id v18 = v16;
  uint64_t v19 = [v17 numberWithBool:a2];
  *(_DWORD *)uint64_t v23 = 138543618;
  *(void *)&void v23[4] = v16;
  *(_WORD *)&v23[12] = 2114;
  *(void *)&v23[14] = v19;
  LODWORD(v22) = 22;
  uint64_t v20 = (void *)_os_log_send_and_compose_impl();

  if (v20)
  {
    id v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, v23, v22);
    free(v20);
    SSFileLog();
LABEL_24:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)setBiometricState:(int64_t)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ([(ISBiometricStore *)self biometricState] != a3)
  {
    id v5 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263F7BDC8];
    CFPreferencesSetAppValue(@"BiometricState", v5, (CFStringRef)*MEMORY[0x263F7BDC8]);
    if ((unint64_t)(a3 - 1) <= 1) {
      CFPreferencesSetAppValue(@"BiometricStateEnabled", v5, v6);
    }
    CFPreferencesAppSynchronize(v6);
    if (!a3)
    {
      int v7 = (void *)MEMORY[0x263F27BF8];
      uint64_t v8 = 0;
      goto LABEL_9;
    }
    if (a3 != 1)
    {
      if (a3 != 2)
      {
LABEL_29:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F7BD70], 0, 0, 1u);

        return;
      }
      int v7 = (void *)MEMORY[0x263F27BF8];
      uint64_t v8 = 1;
LABEL_9:
      [v7 setBiometricState:v8];
      goto LABEL_29;
    }
    [MEMORY[0x263F27BF8] setBiometricState:2];
    dispatch_time_t v9 = [(ISBiometricStore *)self lastRegisteredAccountIdentifier];
    if (!v9)
    {
      id v11 = 0;
      goto LABEL_25;
    }
    id v35 = 0;
    BOOL v10 = [(ISBiometricStore *)self deleteKeychainTokensForAccountIdentifier:v9 error:&v35];
    id v11 = v35;
    if (v10)
    {
LABEL_25:
      uint64_t v19 = objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore", v32);
      uint64_t v20 = [v19 activeAccount];
      int v21 = [v20 uniqueIdentifier];

      if (!v21 || ([v21 isEqualToNumber:v9] & 1) != 0)
      {
        id v22 = v11;
LABEL_28:

        goto LABEL_29;
      }
      id v34 = v11;
      BOOL v24 = [(ISBiometricStore *)self deleteKeychainTokensForAccountIdentifier:v21 error:&v34];
      id v22 = v34;

      if (v24) {
        goto LABEL_28;
      }
      id v25 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v25)
      {
        id v25 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v26 = [v25 shouldLog];
      if ([v25 shouldLogToDisk]) {
        int v27 = v26 | 2;
      }
      else {
        int v27 = v26;
      }
      int v28 = [v25 OSLogObject];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        v27 &= 2u;
      }
      if (v27)
      {
        uint64_t v29 = objc_opt_class();
        int v36 = 138543874;
        id v37 = v29;
        __int16 v38 = 2112;
        int v39 = v9;
        __int16 v40 = 2114;
        id v41 = v22;
        id v30 = v29;
        LODWORD(v33) = 32;
        char v31 = (void *)_os_log_send_and_compose_impl();

        if (!v31)
        {
LABEL_43:

          goto LABEL_28;
        }
        int v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v36, v33);
        free(v31);
        SSFileLog();
      }

      goto LABEL_43;
    }
    int v12 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v12)
    {
      int v12 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    id v15 = [v12 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      v14 &= 2u;
    }
    if (v14)
    {
      id v16 = objc_opt_class();
      int v36 = 138543874;
      id v37 = v16;
      __int16 v38 = 2112;
      int v39 = v9;
      __int16 v40 = 2114;
      id v41 = v11;
      id v17 = v16;
      LODWORD(v33) = 32;
      int v32 = &v36;
      id v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_23:

        goto LABEL_25;
      }
      id v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v36, v33);
      free(v18);
      int v32 = (int *)v15;
      SSFileLog();
    }

    goto LABEL_23;
  }
}

+ (void)tokenUpdateDidFinishWithLogKey:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!SSIsDaemon())
  {
    objc_initWeak(&location, a1);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = objc_alloc_init(MEMORY[0x263F7B138]);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    int v21 = __51__ISBiometricStore_tokenUpdateDidFinishWithLogKey___block_invoke;
    id v22 = &unk_264260A40;
    objc_copyWeak(&v25, &location);
    id v7 = v4;
    id v23 = v7;
    uint64_t v8 = v5;
    BOOL v24 = v8;
    [v6 tokenUpdateDidFinishWithLogKey:v7 completion:&v19];
    dispatch_time_t v9 = dispatch_time(0, 2500000000);
    if (!dispatch_semaphore_wait(v8, v9))
    {
LABEL_15:

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      goto LABEL_16;
    }
    BOOL v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v10)
    {
      BOOL v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v10 shouldLog];
    int v12 = [v10 shouldLogToDisk];
    int v13 = [v10 OSLogObject];
    int v14 = v13;
    if (v12) {
      v11 |= 2u;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      id v15 = objc_opt_class();
      int v27 = 138543618;
      int v28 = v15;
      __int16 v29 = 2114;
      id v30 = v7;
      id v16 = v15;
      LODWORD(v18) = 22;
      id v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_14:

        goto LABEL_15;
      }
      int v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v27, v18, v19, v20, v21, v22, v23);
      free(v17);
      SSFileLog();
    }

    goto LABEL_14;
  }
  [NSClassFromString(&cfstr_Daemonbiometri.isa) tokenUpdateDidFinishWithLogKey:v4];
LABEL_16:
}

void __51__ISBiometricStore_tokenUpdateDidFinishWithLogKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    dispatch_semaphore_t v5 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v5)
    {
      dispatch_semaphore_t v5 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      v7 &= 2u;
    }
    if (v7)
    {
      dispatch_time_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)int v14 = 138543874;
      *(void *)&v14[4] = v9;
      *(_WORD *)&v14[12] = 2114;
      *(void *)&v14[14] = v10;
      *(_WORD *)&v14[22] = 2114;
      id v15 = v3;
      id v11 = v9;
      LODWORD(v13) = 32;
      int v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14, *(void *)&v14[16], v15);
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)tokenUpdateShouldStartWithLogKey:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  if (!SSIsDaemon())
  {
    objc_initWeak(&location, a1);
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = objc_alloc_init(MEMORY[0x263F7B138]);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __53__ISBiometricStore_tokenUpdateShouldStartWithLogKey___block_invoke;
    v21[3] = &unk_264260A68;
    objc_copyWeak(&v25, &location);
    id v8 = v4;
    id v22 = v8;
    BOOL v24 = &v27;
    dispatch_time_t v9 = v6;
    id v23 = v9;
    [v7 tokenUpdateShouldStartWithLogKey:v8 completion:v21];
    dispatch_time_t v10 = dispatch_time(0, 2500000000);
    if (!dispatch_semaphore_wait(v9, v10))
    {
LABEL_15:

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      char v5 = *((unsigned char *)v28 + 24) != 0;
      goto LABEL_16;
    }
    id v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v11)
    {
      id v11 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v12 = [v11 shouldLog];
    int v13 = [v11 shouldLogToDisk];
    int v14 = [v11 OSLogObject];
    id v15 = v14;
    if (v13) {
      v12 |= 2u;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      uint64_t v16 = objc_opt_class();
      int v31 = 138543618;
      int v32 = v16;
      __int16 v33 = 2114;
      id v34 = v8;
      id v17 = v16;
      LODWORD(v20) = 22;
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v31, v20);
      free(v18);
      SSFileLog();
    }

    goto LABEL_14;
  }
  char v5 = [NSClassFromString(&cfstr_Daemonbiometri.isa) tokenUpdateShouldStartWithLogKey:v4];
  *((unsigned char *)v28 + 24) = v5;
LABEL_16:
  _Block_object_dispose(&v27, 8);

  return v5;
}

void __53__ISBiometricStore_tokenUpdateShouldStartWithLogKey___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
    goto LABEL_15;
  }
  id v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  dispatch_time_t v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_12;
  }
  id v11 = objc_opt_class();
  uint64_t v12 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v16 = 138543874;
  *(void *)&v16[4] = v11;
  *(_WORD *)&v16[12] = 2114;
  *(void *)&v16[14] = v12;
  *(_WORD *)&v16[22] = 2114;
  id v17 = v5;
  id v13 = v11;
  LODWORD(v15) = 32;
  int v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    dispatch_time_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, v16, v15, *(_OWORD *)v16, *(void *)&v16[16], v17);
    free(v14);
    SSFileLog();
LABEL_12:
  }
LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (int64_t)tokenUpdateState
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  if (!SSIsDaemon())
  {
    objc_initWeak(&location, a1);
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v5 = objc_alloc_init(MEMORY[0x263F7B138]);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    int v21 = __36__ISBiometricStore_tokenUpdateState__block_invoke;
    id v22 = &unk_264260A90;
    objc_copyWeak(&v25, &location);
    BOOL v24 = &v27;
    dispatch_semaphore_t v6 = v4;
    id v23 = v6;
    [v5 tokenUpdateStateWithCompletionBlock:&v19];
    dispatch_time_t v7 = dispatch_time(0, 2500000000);
    if (!dispatch_semaphore_wait(v6, v7))
    {
LABEL_17:

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      goto LABEL_19;
    }
    int v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    int v10 = [v8 shouldLogToDisk];
    id v11 = [v8 OSLogObject];
    uint64_t v12 = v11;
    if (v10) {
      v9 |= 2u;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v13 = objc_opt_class();
      int v31 = 138543362;
      int v32 = v13;
      id v14 = v13;
      LODWORD(v18) = 12;
      uint64_t v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v31, v18, v19, v20, v21, v22);
      free(v15);
      SSFileLog();
    }

    goto LABEL_16;
  }
  uint64_t v3 = [NSClassFromString(&cfstr_Daemonbiometri.isa) tokenUpdateState];
  if (v3)
  {
    if (v3 == 1) {
      void v28[3] = 1;
    }
  }
  else
  {
    void v28[3] = 0;
  }
LABEL_19:
  int64_t v16 = v28[3];
  _Block_object_dispose(&v27, 8);
  return v16;
}

void __36__ISBiometricStore_tokenUpdateState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    dispatch_time_t v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v7)
    {
      dispatch_time_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      *(_DWORD *)id v14 = 138543618;
      *(void *)&v14[4] = objc_opt_class();
      *(_WORD *)&v14[12] = 2114;
      *(void *)&v14[14] = v5;
      id v11 = *(id *)&v14[4];
      LODWORD(v13) = 22;
      uint64_t v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14, *(void *)&v14[16], v15);
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
  if (a2 == 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (!a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)keychainLabelForAccountID:(id)a3 purpose:(int64_t)a4
{
  return +[ISBiometricStore keychainLabelForKeyWithAccountID:a3 purpose:a4];
}

+ (id)keychainLabelForKeyWithAccountID:(id)a3 purpose:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_semaphore_t v6 = +[ISClient currentClient];
  dispatch_time_t v7 = [v6 identifier];

  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    int v8 = @"%@:%@-ext";
  }
  else
  {
    int v8 = @"%@:%@";
  }
  int v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v7, v5);
  if (v9) {
    goto LABEL_18;
  }
LABEL_6:
  int v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v10)
  {
    int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  uint64_t v13 = [v10 OSLogObject];
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_16;
  }
  [NSNumber numberWithInteger:a4];
  int v17 = 138412546;
  id v18 = v5;
  __int16 v19 = 2114;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 22;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v17, v16);
    free(v14);
    SSFileLog();
LABEL_16:
  }
  int v9 = 0;
LABEL_18:

  return v9;
}

+ (id)keychainLabelForCertWithAccountID:(id)a3 purpose:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_semaphore_t v6 = +[ISBiometricStore keychainLabelForKeyWithAccountID:v5 purpose:a4];
  dispatch_time_t v7 = [NSString stringWithFormat:@"%@-cert", v6];
  if (!v7)
  {
    int v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    int v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      [NSNumber numberWithInteger:a4];
      int v15 = 138412546;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 22;
      int v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      int v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v15, v14);
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (id)createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  uint64_t v38 = 0;
  int v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__0;
  uint64_t v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  if (SSIsDaemon())
  {
    int v9 = [NSClassFromString(&cfstr_Daemonbiometri_0.isa) sharedInstance];
    int v10 = (id *)(v39 + 5);
    id obj = (id)v39[5];
    uint64_t v11 = [v9 createAttestationDataForAccountIdentifier_:v8 purpose:a4 error:&obj];
    objc_storeStrong(v10, obj);
    int v12 = (void *)v45[5];
    v45[5] = v11;
    goto LABEL_16;
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  int v12 = objc_opt_new();
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __76__ISBiometricStore_createAttestationDataForAccountIdentifier_purpose_error___block_invoke;
  int v31 = &unk_264260AB8;
  uint64_t v35 = &v38;
  int v32 = self;
  id v33 = v8;
  int v36 = &v44;
  int v9 = v13;
  id v34 = v9;
  [v12 createAttestationDataForAccountIdentifier:v33 purpose:a4 completionBlock:&v28];
  dispatch_time_t v14 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v9, v14))
  {
    int v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v15)
    {
      int v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v15 shouldLog];
    int v17 = [v15 shouldLogToDisk];
    id v18 = [v15 OSLogObject];
    uint64_t v19 = v18;
    if (v17) {
      v16 |= 2u;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      id v20 = objc_opt_class();
      int v50 = 138543362;
      v51 = v20;
      id v21 = v20;
      LODWORD(v27) = 12;
      id v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_14:

        uint64_t v23 = SSError();
        BOOL v24 = (void *)v39[5];
        v39[5] = v23;

        goto LABEL_15;
      }
      uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v50, v27, v28, v29, v30, v31, v32, v33);
      free(v22);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a5) {
    *a5 = (id) v39[5];
  }
  id v25 = (id)v45[5];
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);

  return v25;
}

void __76__ISBiometricStore_createAttestationDataForAccountIdentifier_purpose_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    id v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (!v10) {
      goto LABEL_13;
    }
    int v12 = objc_opt_class();
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)id v22 = 138543874;
    *(void *)&v22[4] = v12;
    *(_WORD *)&v22[12] = 2112;
    *(void *)&v22[14] = v13;
    *(_WORD *)&v22[22] = 2114;
    uint64_t v23 = v14;
    id v15 = v12;
    LODWORD(v21) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_17;
    }
    id v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v17 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v18 &= 2u;
    }
    if (!v18) {
      goto LABEL_13;
    }
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)id v22 = 138543618;
    *(void *)&v22[4] = v19;
    *(_WORD *)&v22[12] = 2112;
    *(void *)&v22[14] = v20;
    id v15 = v19;
    LODWORD(v21) = 22;
  }
  int v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16]);
    free(v16);
    SSFileLog();
LABEL_13:
  }
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  uint64_t v38 = 0;
  int v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__0;
  uint64_t v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  if (SSIsDaemon())
  {
    int v9 = [NSClassFromString(&cfstr_Daemonbiometri_0.isa) sharedInstance];
    int v10 = (id *)(v39 + 5);
    id obj = (id)v39[5];
    uint64_t v11 = [v9 createX509CertChainDataForAccountIdentifier_:v8 purpose:a4 error:&obj];
    objc_storeStrong(v10, obj);
    id v12 = (id)v45[5];
    v45[5] = v11;
    goto LABEL_16;
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v12 = objc_alloc_init(MEMORY[0x263F7B1E0]);
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __78__ISBiometricStore_createX509CertChainDataForAccountIdentifier_purpose_error___block_invoke;
  int v31 = &unk_264260AE0;
  uint64_t v35 = &v38;
  int v32 = self;
  id v33 = v8;
  int v36 = &v44;
  int v9 = v13;
  id v34 = v9;
  [v12 createX509CertChainDataForAccountIdentifier:v33 purpose:a4 completionBlock:&v28];
  dispatch_time_t v14 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v14))
  {
    id v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v15)
    {
      id v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v15 shouldLog];
    int v17 = [v15 shouldLogToDisk];
    int v18 = [v15 OSLogObject];
    uint64_t v19 = v18;
    if (v17) {
      v16 |= 2u;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      uint64_t v20 = objc_opt_class();
      int v50 = 138543362;
      v51 = v20;
      id v21 = v20;
      LODWORD(v27) = 12;
      id v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_14:

        uint64_t v23 = SSError();
        uint64_t v24 = (void *)v39[5];
        v39[5] = v23;

        goto LABEL_15;
      }
      uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v50, v27, v28, v29, v30, v31, v32, v33);
      free(v22);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a5) {
    *a5 = (id) v39[5];
  }
  id v25 = (id)v45[5];
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);

  return v25;
}

void __78__ISBiometricStore_createX509CertChainDataForAccountIdentifier_purpose_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    id v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (!v10) {
      goto LABEL_13;
    }
    id v12 = objc_opt_class();
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)id v21 = 138543874;
    *(void *)&void v21[4] = v12;
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2114;
    id v22 = v7;
    id v14 = v12;
    LODWORD(v20) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_17;
    }
    id v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (!v17) {
      goto LABEL_13;
    }
    int v18 = objc_opt_class();
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)id v21 = 138543618;
    *(void *)&void v21[4] = v18;
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v19;
    id v14 = v18;
    LODWORD(v20) = 22;
  }
  id v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v21, v20, *(_OWORD *)v21, *(void *)&v21[16]);
    free(v15);
    SSFileLog();
LABEL_13:
  }
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)deleteKeychainTokensForAccountIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  int v39 = __Block_byref_object_copy__0;
  uint64_t v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  if (SSIsDaemon())
  {
    id v7 = [NSClassFromString(&cfstr_Daemonbiometri_0.isa) sharedInstance];
    id v8 = (id *)(v37 + 5);
    id obj = (id)v37[5];
    char v9 = [v7 deleteKeychainTokensForAccountIdentifier_:v6 error:&obj];
    objc_storeStrong(v8, obj);
    *((unsigned char *)v43 + 24) = v9;
    goto LABEL_16;
  }
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v11 = objc_opt_new();
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __67__ISBiometricStore_deleteKeychainTokensForAccountIdentifier_error___block_invoke;
  uint64_t v29 = &unk_2642609C8;
  id v33 = &v36;
  uint64_t v30 = self;
  id v31 = v6;
  id v34 = &v42;
  id v7 = v10;
  int v32 = v7;
  [v11 deleteKeychainTokensForAccountIdentifier:v31 completionBlock:&v26];
  dispatch_time_t v12 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v7, v12))
  {
    uint64_t v13 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v13)
    {
      uint64_t v13 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v14 = [v13 shouldLog];
    int v15 = [v13 shouldLogToDisk];
    int v16 = [v13 OSLogObject];
    int v17 = v16;
    if (v15) {
      v14 |= 2u;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      v14 &= 2u;
    }
    if (v14)
    {
      int v18 = objc_opt_class();
      int v46 = 138543362;
      v47 = v18;
      id v19 = v18;
      LODWORD(v25) = 12;
      uint64_t v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_14:

        uint64_t v21 = SSError();
        id v22 = (void *)v37[5];
        v37[5] = v21;

        goto LABEL_15;
      }
      int v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v46, v25, v26, v27, v28, v29, v30, v31);
      free(v20);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a4) {
    *a4 = (id) v37[5];
  }
  BOOL v23 = *((unsigned char *)v43 + 24) != 0;
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v23;
}

void __67__ISBiometricStore_deleteKeychainTokensForAccountIdentifier_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    id v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    dispatch_semaphore_t v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (!v9) {
      goto LABEL_23;
    }
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)uint64_t v21 = 138543874;
    *(void *)&void v21[4] = v11;
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v12;
    *(_WORD *)&v21[22] = 2114;
    uint64_t v22 = v13;
    id v14 = v11;
    LODWORD(v20) = 32;
LABEL_21:
    id v19 = (void *)_os_log_send_and_compose_impl();

    if (!v19)
    {
LABEL_24:

      goto LABEL_25;
    }
    dispatch_semaphore_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, v21, v20, *(_OWORD *)v21, *(void *)&v21[16]);
    free(v19);
    SSFileLog();
LABEL_23:

    goto LABEL_24;
  }
  if ((a2 & 1) == 0)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    dispatch_semaphore_t v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (!v16) {
      goto LABEL_23;
    }
    int v17 = objc_opt_class();
    uint64_t v18 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v21 = 138543618;
    *(void *)&void v21[4] = v17;
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v18;
    id v14 = v17;
    LODWORD(v20) = 22;
    goto LABEL_21;
  }
LABEL_25:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)publicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v44 = 0;
  char v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  uint64_t v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  uint64_t v38 = 0;
  int v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__0;
  uint64_t v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  if (SSIsDaemon())
  {
    int v9 = [NSClassFromString(&cfstr_Daemonbiometri_0.isa) sharedInstance];
    dispatch_semaphore_t v10 = (id *)(v39 + 5);
    id obj = (id)v39[5];
    uint64_t v11 = [v9 publicKeyDataForAccountIdentifier_:v8 purpose:a4 error:&obj];
    objc_storeStrong(v10, obj);
    uint64_t v12 = (void *)v45[5];
    v45[5] = v11;
    goto LABEL_16;
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v12 = objc_opt_new();
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __68__ISBiometricStore_publicKeyDataForAccountIdentifier_purpose_error___block_invoke;
  id v31 = &unk_264260AB8;
  uint64_t v35 = &v38;
  int v32 = self;
  id v33 = v8;
  uint64_t v36 = &v44;
  int v9 = v13;
  id v34 = v9;
  [v12 getPublicKeyDataForAccountIdentifier:v33 purpose:a4 completionBlock:&v28];
  dispatch_time_t v14 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v9, v14))
  {
    int v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v15)
    {
      int v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v15 shouldLog];
    int v17 = [v15 shouldLogToDisk];
    uint64_t v18 = [v15 OSLogObject];
    id v19 = v18;
    if (v17) {
      v16 |= 2u;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      uint64_t v20 = objc_opt_class();
      int v50 = 138543362;
      v51 = v20;
      id v21 = v20;
      LODWORD(v27) = 12;
      uint64_t v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_14:

        uint64_t v23 = SSError();
        uint64_t v24 = (void *)v39[5];
        v39[5] = v23;

        goto LABEL_15;
      }
      id v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v50, v27, v28, v29, v30, v31, v32, v33);
      free(v22);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a5) {
    *a5 = (id) v39[5];
  }
  id v25 = (id)v45[5];
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);

  return v25;
}

void __68__ISBiometricStore_publicKeyDataForAccountIdentifier_purpose_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    id v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (!v10) {
      goto LABEL_13;
    }
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)uint64_t v22 = 138543874;
    *(void *)&v22[4] = v12;
    *(_WORD *)&v22[12] = 2112;
    *(void *)&v22[14] = v13;
    *(_WORD *)&v22[22] = 2114;
    uint64_t v23 = v14;
    id v15 = v12;
    LODWORD(v21) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_17;
    }
    id v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v17 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v18 &= 2u;
    }
    if (!v18) {
      goto LABEL_13;
    }
    id v19 = objc_opt_class();
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v22 = 138543618;
    *(void *)&v22[4] = v19;
    *(_WORD *)&v22[12] = 2112;
    *(void *)&v22[14] = v20;
    id v15 = v19;
    LODWORD(v21) = 22;
  }
  int v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16]);
    free(v16);
    SSFileLog();
LABEL_13:
  }
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

+ (BOOL)shouldUseApplePayClassic
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (![MEMORY[0x263F7B148] deviceIsInternalBuild]) {
    goto LABEL_29;
  }
  uint64_t v2 = [MEMORY[0x263F27BE0] applePayClassic];
  if (!v2)
  {
    int v10 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v10)
    {
      int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v33 = 138543362;
      id v34 = (id)objc_opt_class();
      id v14 = v34;
      LODWORD(v31) = 12;
      uint64_t v30 = &v33;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v33, v31);
      free(v15);
      uint64_t v30 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_28;
  }
  if (v2 == 2)
  {
    uint64_t v3 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v3)
    {
      uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v26 = [(ISLoadURLBagOperation *)v3 shouldLog];
    if ([(ISLoadURLBagOperation *)v3 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    uint64_t v28 = [(ISLoadURLBagOperation *)v3 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      v27 &= 2u;
    }
    if (v27)
    {
      int v33 = 138543362;
      id v34 = (id)objc_opt_class();
      id v29 = v34;
      LODWORD(v31) = 12;
      int v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9) {
        goto LABEL_45;
      }
      uint64_t v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v33, v31);
      free(v9);
      SSFileLog();
    }

    LOBYTE(v9) = 0;
    goto LABEL_45;
  }
  if (v2 != 1)
  {
LABEL_29:
    uint64_t v3 = objc_alloc_init(ISLoadURLBagOperation);
    int v16 = +[ISOperationQueue mainQueue];
    int v32 = v3;
    int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    [v16 addOperations:v17 waitUntilFinished:1];

    if ([(ISOperation *)v3 success])
    {
      int v18 = [(ISLoadURLBagOperation *)v3 URLBag];
      id v19 = [v18 valueForKey:@"use-apple-pay-classic"];

      if (objc_opt_respondsToSelector())
      {
        LOBYTE(v9) = [v19 BOOLValue];
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      id v19 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
      if (!v19)
      {
        id v19 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v20 = objc_msgSend(v19, "shouldLog", v30);
      if ([v19 shouldLogToDisk]) {
        int v21 = v20 | 2;
      }
      else {
        int v21 = v20;
      }
      uint64_t v22 = [v19 OSLogObject];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        v21 &= 2u;
      }
      if (v21)
      {
        uint64_t v23 = objc_opt_class();
        int v33 = 138543362;
        id v34 = v23;
        id v24 = v23;
        LODWORD(v31) = 12;
        int v9 = (void *)_os_log_send_and_compose_impl();

        if (!v9) {
          goto LABEL_44;
        }
        uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v33, v31);
        free(v9);
        SSFileLog();
      }
    }
    LOBYTE(v9) = 0;
    goto LABEL_44;
  }
  uint64_t v3 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v4 = [(ISLoadURLBagOperation *)v3 shouldLog];
  if ([(ISLoadURLBagOperation *)v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [(ISLoadURLBagOperation *)v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_15;
  }
  int v33 = 138543362;
  id v34 = (id)objc_opt_class();
  id v7 = v34;
  LODWORD(v31) = 12;
  id v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v33, v31);
    free(v8);
    SSFileLog();
LABEL_15:
  }
  LOBYTE(v9) = 1;
LABEL_45:

  return (char)v9;
}

+ (BOOL)shouldUseAutoEnrollment
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (![MEMORY[0x263F7B148] deviceIsInternalBuild]) {
    goto LABEL_29;
  }
  uint64_t v2 = [MEMORY[0x263F27BE0] cardEnrollmentAutomatic];
  if (!v2)
  {
    int v10 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v10)
    {
      int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v33 = 138543362;
      id v34 = (id)objc_opt_class();
      id v14 = v34;
      LODWORD(v31) = 12;
      uint64_t v30 = &v33;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v33, v31);
      free(v15);
      uint64_t v30 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_28;
  }
  if (v2 == 2)
  {
    uint64_t v3 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v3)
    {
      uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v27 = [(ISLoadURLBagOperation *)v3 shouldLog];
    if ([(ISLoadURLBagOperation *)v3 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    int v18 = [(ISLoadURLBagOperation *)v3 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v28 &= 2u;
    }
    if (v28)
    {
      int v33 = 138543362;
      id v34 = (id)objc_opt_class();
      id v29 = v34;
      LODWORD(v31) = 12;
      int v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9) {
        goto LABEL_46;
      }
      int v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v33, v31);
      free(v9);
      SSFileLog();
    }
    goto LABEL_45;
  }
  if (v2 != 1)
  {
LABEL_29:
    uint64_t v3 = objc_alloc_init(ISLoadURLBagOperation);
    int v16 = +[ISOperationQueue mainQueue];
    int v32 = v3;
    int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    [v16 addOperations:v17 waitUntilFinished:1];

    if ([(ISOperation *)v3 success])
    {
      int v18 = [(ISLoadURLBagOperation *)v3 URLBag];
      id v19 = [v18 valueForKey:@"auto-enrollment-percentage"];
      if (objc_opt_respondsToSelector()) {
        [v19 doubleValue];
      }
      int v20 = [v18 valueForKey:@"auto-enrollment-session-duration", v30];

      if (objc_opt_respondsToSelector()) {
        [v20 integerValue];
      }
    }
    else
    {
      int v18 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
      if (!v18)
      {
        int v18 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v21 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      int v20 = [v18 OSLogObject];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        v22 &= 2u;
      }
      if (v22)
      {
        uint64_t v23 = objc_opt_class();
        int v33 = 138543362;
        id v34 = v23;
        id v24 = v23;
        LODWORD(v31) = 12;
        id v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25)
        {
LABEL_45:

          LOBYTE(v9) = 0;
          goto LABEL_46;
        }
        int v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v33, v31);
        free(v25);
        SSFileLog();
      }
    }

    goto LABEL_45;
  }
  uint64_t v3 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v4 = [(ISLoadURLBagOperation *)v3 shouldLog];
  if ([(ISLoadURLBagOperation *)v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [(ISLoadURLBagOperation *)v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_15;
  }
  int v33 = 138543362;
  id v34 = (id)objc_opt_class();
  id v7 = v34;
  LODWORD(v31) = 12;
  id v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v33, v31);
    free(v8);
    SSFileLog();
LABEL_15:
  }
  LOBYTE(v9) = 1;
LABEL_46:

  return (char)v9;
}

+ (BOOL)shouldUseExtendedEnrollment
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (![MEMORY[0x263F7B148] deviceIsInternalBuild]) {
    goto LABEL_29;
  }
  uint64_t v2 = [MEMORY[0x263F27BE0] cardEnrollmentManual];
  if (!v2)
  {
    int v10 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v10)
    {
      int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v33 = 138543362;
      id v34 = (id)objc_opt_class();
      id v14 = v34;
      LODWORD(v31) = 12;
      uint64_t v30 = &v33;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v33, v31);
      free(v15);
      uint64_t v30 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_28;
  }
  if (v2 == 2)
  {
    uint64_t v3 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v3)
    {
      uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v26 = [(ISLoadURLBagOperation *)v3 shouldLog];
    if ([(ISLoadURLBagOperation *)v3 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    int v28 = [(ISLoadURLBagOperation *)v3 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      v27 &= 2u;
    }
    if (v27)
    {
      int v33 = 138543362;
      id v34 = (id)objc_opt_class();
      id v29 = v34;
      LODWORD(v31) = 12;
      int v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9) {
        goto LABEL_45;
      }
      int v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v33, v31);
      free(v9);
      SSFileLog();
    }

    LOBYTE(v9) = 0;
    goto LABEL_45;
  }
  if (v2 != 1)
  {
LABEL_29:
    uint64_t v3 = objc_alloc_init(ISLoadURLBagOperation);
    int v16 = +[ISOperationQueue mainQueue];
    int v32 = v3;
    int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    [v16 addOperations:v17 waitUntilFinished:1];

    if ([(ISOperation *)v3 success])
    {
      int v18 = [(ISLoadURLBagOperation *)v3 URLBag];
      id v19 = [v18 valueForKey:@"use-extended-enrollment"];

      if (objc_opt_respondsToSelector())
      {
        LOBYTE(v9) = [v19 BOOLValue];
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      id v19 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
      if (!v19)
      {
        id v19 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v20 = objc_msgSend(v19, "shouldLog", v30);
      if ([v19 shouldLogToDisk]) {
        int v21 = v20 | 2;
      }
      else {
        int v21 = v20;
      }
      int v22 = [v19 OSLogObject];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        v21 &= 2u;
      }
      if (v21)
      {
        uint64_t v23 = objc_opt_class();
        int v33 = 138543362;
        id v34 = v23;
        id v24 = v23;
        LODWORD(v31) = 12;
        int v9 = (void *)_os_log_send_and_compose_impl();

        if (!v9) {
          goto LABEL_44;
        }
        int v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v33, v31);
        free(v9);
        SSFileLog();
      }
    }
    LOBYTE(v9) = 0;
    goto LABEL_44;
  }
  uint64_t v3 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v4 = [(ISLoadURLBagOperation *)v3 shouldLog];
  if ([(ISLoadURLBagOperation *)v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [(ISLoadURLBagOperation *)v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_15;
  }
  int v33 = 138543362;
  id v34 = (id)objc_opt_class();
  id v7 = v34;
  LODWORD(v31) = 12;
  id v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v33, v31);
    free(v8);
    SSFileLog();
LABEL_15:
  }
  LOBYTE(v9) = 1;
LABEL_45:

  return (char)v9;
}

+ (BOOL)shouldUseUpsellEnrollment
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (![MEMORY[0x263F7B148] deviceIsInternalBuild]) {
    goto LABEL_29;
  }
  uint64_t v2 = [MEMORY[0x263F27BE0] cardEnrollmentUpsell];
  if (!v2)
  {
    int v10 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v10)
    {
      int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v33 = 138543362;
      id v34 = (id)objc_opt_class();
      id v14 = v34;
      LODWORD(v31) = 12;
      uint64_t v30 = &v33;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v33, v31);
      free(v15);
      uint64_t v30 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_28;
  }
  if (v2 == 2)
  {
    uint64_t v3 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
    if (!v3)
    {
      uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v26 = [(ISLoadURLBagOperation *)v3 shouldLog];
    if ([(ISLoadURLBagOperation *)v3 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    int v28 = [(ISLoadURLBagOperation *)v3 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      v27 &= 2u;
    }
    if (v27)
    {
      int v33 = 138543362;
      id v34 = (id)objc_opt_class();
      id v29 = v34;
      LODWORD(v31) = 12;
      int v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9) {
        goto LABEL_45;
      }
      int v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v33, v31);
      free(v9);
      SSFileLog();
    }

    LOBYTE(v9) = 0;
    goto LABEL_45;
  }
  if (v2 != 1)
  {
LABEL_29:
    uint64_t v3 = objc_alloc_init(ISLoadURLBagOperation);
    int v16 = +[ISOperationQueue mainQueue];
    int v32 = v3;
    int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    [v16 addOperations:v17 waitUntilFinished:1];

    if ([(ISOperation *)v3 success])
    {
      int v18 = [(ISLoadURLBagOperation *)v3 URLBag];
      id v19 = [v18 valueForKey:@"use-enrollment-upsell"];

      if (objc_opt_respondsToSelector())
      {
        LOBYTE(v9) = [v19 BOOLValue];
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      id v19 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
      if (!v19)
      {
        id v19 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v20 = objc_msgSend(v19, "shouldLog", v30);
      if ([v19 shouldLogToDisk]) {
        int v21 = v20 | 2;
      }
      else {
        int v21 = v20;
      }
      int v22 = [v19 OSLogObject];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        v21 &= 2u;
      }
      if (v21)
      {
        uint64_t v23 = objc_opt_class();
        int v33 = 138543362;
        id v34 = v23;
        id v24 = v23;
        LODWORD(v31) = 12;
        int v9 = (void *)_os_log_send_and_compose_impl();

        if (!v9) {
          goto LABEL_44;
        }
        int v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v33, v31);
        free(v9);
        SSFileLog();
      }
    }
    LOBYTE(v9) = 0;
    goto LABEL_44;
  }
  uint64_t v3 = [MEMORY[0x263F7B1F8] sharedDaemonConfig];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v4 = [(ISLoadURLBagOperation *)v3 shouldLog];
  if ([(ISLoadURLBagOperation *)v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [(ISLoadURLBagOperation *)v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_15;
  }
  int v33 = 138543362;
  id v34 = (id)objc_opt_class();
  id v7 = v34;
  LODWORD(v31) = 12;
  id v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v33, v31);
    free(v8);
    SSFileLog();
LABEL_15:
  }
  LOBYTE(v9) = 1;
LABEL_45:

  return (char)v9;
}

+ (BOOL)shouldUseX509
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = MGGetBoolAnswer();
  uint64_t v3 = [MEMORY[0x263F27BF8] hardwarePlatform];
  int v4 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v4)
  {
    int v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  id v8 = objc_opt_class();
  int v9 = NSNumber;
  id v10 = v8;
  int v11 = [v9 numberWithBool:v2];
  int v24 = 138543874;
  id v25 = v8;
  __int16 v26 = 2114;
  int v27 = v3;
  __int16 v28 = 2114;
  id v29 = v11;
  LODWORD(v23) = 32;
  int v22 = &v24;
  int v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v24, v23);
    free(v12);
    int v22 = (int *)v7;
    SSFileLog();
LABEL_11:
  }
  if (v2 && ([v3 isEqualToString:@"t8015"] & 1) == 0)
  {
    id v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v14)
    {
      id v14 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = objc_msgSend(v14, "shouldLog", v22);
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    int v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      int v18 = objc_opt_class();
      int v24 = 138543362;
      id v25 = v18;
      id v19 = v18;
      LODWORD(v23) = 12;
      int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_26:

        BOOL v13 = 1;
        goto LABEL_27;
      }
      int v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v24, v23);
      free(v20);
      SSFileLog();
    }

    goto LABEL_26;
  }
  BOOL v13 = 0;
LABEL_27:

  return v13;
}

- (id)signData:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__0;
  id v49 = __Block_byref_object_dispose__0;
  id v50 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__0;
  id v43 = __Block_byref_object_dispose__0;
  id v44 = 0;
  if (SSIsDaemon())
  {
    id v10 = [NSClassFromString(&cfstr_Daemonbiometri_0.isa) sharedInstance];
    int v11 = (id *)(v40 + 5);
    id obj = (id)v40[5];
    uint64_t v12 = [v10 signData_:v8 context:v9 error:&obj];
    objc_storeStrong(v11, obj);
    id v13 = (id)v46[5];
    v46[5] = v12;
    goto LABEL_16;
  }
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  id v13 = objc_alloc_init(MEMORY[0x263F7B1E0]);
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __43__ISBiometricStore_signData_context_error___block_invoke;
  int v32 = &unk_264260AB8;
  uint64_t v36 = &v39;
  int v33 = self;
  id v34 = v9;
  id v37 = &v45;
  id v10 = v14;
  uint64_t v35 = v10;
  [v13 signData:v8 context:v34 completionBlock:&v29];
  dispatch_time_t v15 = dispatch_time(0, 180000000000);
  if (dispatch_semaphore_wait(v10, v15))
  {
    int v16 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v16)
    {
      int v16 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v17 = [v16 shouldLog];
    int v18 = [v16 shouldLogToDisk];
    id v19 = [v16 OSLogObject];
    int v20 = v19;
    if (v18) {
      v17 |= 2u;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v21 = objc_opt_class();
      int v51 = 138543362;
      uint64_t v52 = v21;
      id v22 = v21;
      LODWORD(v28) = 12;
      uint64_t v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_14:

        uint64_t v24 = SSError();
        id v25 = (void *)v40[5];
        v40[5] = v24;

        goto LABEL_15;
      }
      int v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v51, v28, v29, v30, v31, v32, v33, v34);
      free(v23);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a5) {
    *a5 = (id) v40[5];
  }
  id v26 = (id)v46[5];
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);

  return v26;
}

void __43__ISBiometricStore_signData_context_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    int v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (!v10) {
      goto LABEL_11;
    }
    uint64_t v12 = objc_opt_class();
    id v13 = *(void **)(a1 + 40);
    id v14 = v12;
    dispatch_time_t v15 = [v13 accountIdentifier];
    *(_DWORD *)id v22 = 138412802;
    *(void *)&v22[4] = v12;
    *(_WORD *)&v22[12] = 2112;
    *(void *)&v22[14] = v15;
    *(_WORD *)&v22[22] = 2114;
    id v23 = v7;
    LODWORD(v21) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_15;
    }
    id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v17 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    int v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v18 &= 2u;
    }
    if (!v18) {
      goto LABEL_11;
    }
    id v19 = objc_opt_class();
    int v20 = *(void **)(a1 + 40);
    id v14 = v19;
    dispatch_time_t v15 = [v20 accountIdentifier];
    *(_DWORD *)id v22 = 138543618;
    *(void *)&v22[4] = v19;
    *(_WORD *)&v22[12] = 2112;
    *(void *)&v22[14] = v15;
    LODWORD(v21) = 22;
  }
  int v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    int v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16]);
    free(v16);
    SSFileLog();
LABEL_11:
  }
LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)x509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = __Block_byref_object_copy__0;
  id v50 = __Block_byref_object_dispose__0;
  id v51 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__0;
  id v44 = __Block_byref_object_dispose__0;
  id v45 = 0;
  if (SSIsDaemon())
  {
    int v11 = [NSClassFromString(&cfstr_Daemonbiometri_0.isa) sharedInstance];
    uint64_t v12 = (id *)(v41 + 5);
    id obj = (id)v41[5];
    uint64_t v13 = [v11 x509CertChainDataForAccountIdentifier_:v10 purpose:a4 regenerateCerts:v7 error:&obj];
    objc_storeStrong(v12, obj);
    id v14 = (id)v47[5];
    v47[5] = v13;
    goto LABEL_16;
  }
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  id v14 = objc_alloc_init(MEMORY[0x263F7B1E0]);
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  int v32 = __88__ISBiometricStore_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_error___block_invoke;
  int v33 = &unk_264260AE0;
  id v37 = &v40;
  id v34 = self;
  id v35 = v10;
  uint64_t v38 = &v46;
  int v11 = v15;
  uint64_t v36 = v11;
  [v14 x509CertChainDataForAccountIdentifier:v35 purpose:a4 regenerateCerts:v7 completionBlock:&v30];
  dispatch_time_t v16 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v11, v16))
  {
    int v17 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v17)
    {
      int v17 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v18 = [v17 shouldLog];
    int v19 = [v17 shouldLogToDisk];
    int v20 = [v17 OSLogObject];
    uint64_t v21 = v20;
    if (v19) {
      v18 |= 2u;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      v18 &= 2u;
    }
    if (v18)
    {
      id v22 = objc_opt_class();
      int v52 = 138543362;
      uint64_t v53 = v22;
      id v23 = v22;
      LODWORD(v29) = 12;
      uint64_t v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_14:

        uint64_t v25 = SSError();
        id v26 = (void *)v41[5];
        v41[5] = v25;

        goto LABEL_15;
      }
      uint64_t v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v52, v29, v30, v31, v32, v33, v34, v35);
      free(v24);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a6) {
    *a6 = (id) v41[5];
  }
  id v27 = (id)v47[5];
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);

  return v27;
}

void __88__ISBiometricStore_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    id v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    int v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (!v10) {
      goto LABEL_13;
    }
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v21 = 138543874;
    *(void *)&void v21[4] = v12;
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2114;
    id v22 = v7;
    id v14 = v12;
    LODWORD(v20) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_17;
    }
    id v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    int v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (!v17) {
      goto LABEL_13;
    }
    int v18 = objc_opt_class();
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v21 = 138543618;
    *(void *)&void v21[4] = v18;
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v19;
    id v14 = v18;
    LODWORD(v20) = 22;
  }
  dispatch_semaphore_t v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    int v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v21, v20, *(_OWORD *)v21, *(void *)&v21[16]);
    free(v15);
    SSFileLog();
LABEL_13:
  }
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_contextCache, 0);
}

@end