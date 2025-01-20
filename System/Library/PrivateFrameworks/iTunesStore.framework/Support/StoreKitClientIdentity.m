@interface StoreKitClientIdentity
+ (void)forceSandboxForBundleIdentifier:(id)a3 untilDate:(id)a4;
+ (void)initialize;
- (BOOL)allowsBootstrapCellularData;
- (BOOL)hidesConfirmationDialogs;
- (BOOL)ignoresInAppPurchaseRestriction;
- (BOOL)isSandboxed;
- (BOOL)requiresAuthenticationForPayment;
- (BOOL)usesIdentityAttributes;
- (NSNumber)accountIdentifier;
- (NSNumber)storeIdentifier;
- (NSNumber)storeVersion;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)receiptDirectoryPath;
- (NSString)vendorIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)setAccountIdentifier:(id)a3;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setHidesConfirmationDialogs:(BOOL)a3;
- (void)setIgnoresInAppPurchaseRestriction:(BOOL)a3;
- (void)setReceiptDirectoryPath:(id)a3;
- (void)setRequiresAuthenticationForPayment:(BOOL)a3;
- (void)setSandboxed:(BOOL)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setStoreVersion:(id)a3;
- (void)setUsesIdentityAttributes:(BOOL)a3;
- (void)setValuesWithPaymentQueueClient:(id)a3;
- (void)setValuesWithSoftwareApplicationProxy:(id)a3;
- (void)setVendorIdentifier:(id)a3;
@end

@implementation StoreKitClientIdentity

+ (void)initialize
{
  qword_100401FA0 = (uint64_t)dispatch_queue_create("com.apple.appstored.StoreKit.ForcedSandbox", 0);
  qword_100401FA8 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
}

+ (void)forceSandboxForBundleIdentifier:(id)a3 untilDate:(id)a4
{
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v13 = 138543874;
    uint64_t v14 = objc_opt_class();
    __int16 v15 = 2114;
    id v16 = a3;
    __int16 v17 = 2114;
    id v18 = a4;
    LODWORD(v11) = 32;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v13, v11);
      free(v10);
      SSFileLog();
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100183E80;
  block[3] = &unk_1003A3380;
  block[4] = a3;
  block[5] = a4;
  dispatch_sync((dispatch_queue_t)qword_100401FA0, block);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)StoreKitClientIdentity;
  [(StoreKitClientIdentity *)&v3 dealloc];
}

- (void)setValuesWithPaymentQueueClient:(id)a3
{
  -[StoreKitClientIdentity setBundleIdentifier:](self, "setBundleIdentifier:", [a3 bundleIdentifier]);
  -[StoreKitClientIdentity setBundleVersion:](self, "setBundleVersion:", [a3 bundleVersion]);
  -[StoreKitClientIdentity setReceiptDirectoryPath:](self, "setReceiptDirectoryPath:", [a3 receiptDirectoryPath]);
  -[StoreKitClientIdentity setVendorIdentifier:](self, "setVendorIdentifier:", [a3 vendorIdentifier]);
  id v5 = [a3 storeItemIdentifier];
  id v6 = [a3 storeExternalVersion];
  [(StoreKitClientIdentity *)self setStoreIdentifier:v5];
  [(StoreKitClientIdentity *)self setStoreVersion:v6];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  id v7 = [a3 environmentType];
  if (v7 != (id)1)
  {
    if (v7 == (id)2)
    {
      uint64_t v8 = 1;
      goto LABEL_12;
    }
LABEL_5:
    if (v5) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    uint64_t v8 = v9;
    goto LABEL_12;
  }
  uint64_t v8 = 0;
LABEL_12:
  [(StoreKitClientIdentity *)self setSandboxed:v8];
  -[StoreKitClientIdentity setAllowsBootstrapCellularData:](self, "setAllowsBootstrapCellularData:", [a3 allowsBootstrapCellularData]);
  -[StoreKitClientIdentity setHidesConfirmationDialogs:](self, "setHidesConfirmationDialogs:", [a3 hidesConfirmationDialogs]);
  -[StoreKitClientIdentity setIgnoresInAppPurchaseRestriction:](self, "setIgnoresInAppPurchaseRestriction:", [a3 ignoresInAppPurchaseRestriction]);
  -[StoreKitClientIdentity setRequiresAuthenticationForPayment:](self, "setRequiresAuthenticationForPayment:", [a3 requiresAuthenticationForPayment]);

  [(StoreKitClientIdentity *)self setUsesIdentityAttributes:1];
}

- (void)setValuesWithSoftwareApplicationProxy:(id)a3
{
  id v5 = [a3 bundleIdentifier];
  [a3 applicationDSID];
  [(StoreKitClientIdentity *)self setAccountIdentifier:SSAccountGetUniqueIdentifierFromValue()];
  [(StoreKitClientIdentity *)self setBundleIdentifier:v5];
  -[StoreKitClientIdentity setBundleVersion:](self, "setBundleVersion:", [a3 bundleVersion]);
  -[StoreKitClientIdentity setStoreIdentifier:](self, "setStoreIdentifier:", [a3 itemID]);
  -[StoreKitClientIdentity setStoreVersion:](self, "setStoreVersion:", [a3 externalVersionIdentifier]);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = objc_msgSend(objc_msgSend(a3, "deviceIdentifierForVendor"), "UUIDString");
    [(StoreKitClientIdentity *)self setVendorIdentifier:v6];
  }
}

- (BOOL)isSandboxed
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if ([(StoreKitClientIdentity *)self bundleIdentifier])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100184244;
    v5[3] = &unk_1003A64B0;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync((dispatch_queue_t)qword_100401FA0, v5);
  }
  if (*((unsigned char *)v7 + 24)) {
    BOOL sandboxed = 1;
  }
  else {
    BOOL sandboxed = self->_sandboxed;
  }
  _Block_object_dispose(&v6, 8);
  return sandboxed;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSNumber *)self->_accountIdentifier copyWithZone:a3];
  *((unsigned char *)v5 + 16) = self->_allowsBootstrapCellularData;
  v5[3] = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v5[4] = [(NSString *)self->_bundleVersion copyWithZone:a3];
  *((unsigned char *)v5 + 40) = self->_hidesConfirmationDialogs;
  *((unsigned char *)v5 + 41) = self->_ignoresInAppPurchaseRestriction;
  void v5[6] = [(NSString *)self->_receiptDirectoryPath copyWithZone:a3];
  *((unsigned char *)v5 + 56) = self->_requiresAuthenticationForPayment;
  *((unsigned char *)v5 + 80) = self->_sandboxed;
  v5[8] = [(NSNumber *)self->_storeIdentifier copyWithZone:a3];
  v5[9] = [(NSNumber *)self->_storeVersion copyWithZone:a3];
  *((unsigned char *)v5 + 81) = self->_usesIdentityAttributes;
  v5[11] = [(NSString *)self->_vendorIdentifier copyWithZone:a3];
  return v5;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)StoreKitClientIdentity;
  return +[NSString stringWithFormat:@"%@: [bid: %@, bv: %@, sid: %@, sv: %@, sbox: %d", [(StoreKitClientIdentity *)&v3 description], self->_bundleIdentifier, self->_bundleVersion, self->_storeIdentifier, self->_storeVersion, self->_sandboxed];
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  self->_allowsBootstrapCellularData = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (BOOL)hidesConfirmationDialogs
{
  return self->_hidesConfirmationDialogs;
}

- (void)setHidesConfirmationDialogs:(BOOL)a3
{
  self->_hidesConfirmationDialogs = a3;
}

- (BOOL)ignoresInAppPurchaseRestriction
{
  return self->_ignoresInAppPurchaseRestriction;
}

- (void)setIgnoresInAppPurchaseRestriction:(BOOL)a3
{
  self->_ignoresInAppPurchaseRestriction = a3;
}

- (NSString)receiptDirectoryPath
{
  return self->_receiptDirectoryPath;
}

- (void)setReceiptDirectoryPath:(id)a3
{
}

- (BOOL)requiresAuthenticationForPayment
{
  return self->_requiresAuthenticationForPayment;
}

- (void)setRequiresAuthenticationForPayment:(BOOL)a3
{
  self->_requiresAuthenticationForPayment = a3;
}

- (void)setSandboxed:(BOOL)a3
{
  self->_BOOL sandboxed = a3;
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSNumber)storeVersion
{
  return self->_storeVersion;
}

- (void)setStoreVersion:(id)a3
{
}

- (BOOL)usesIdentityAttributes
{
  return self->_usesIdentityAttributes;
}

- (void)setUsesIdentityAttributes:(BOOL)a3
{
  self->_usesIdentityAttributes = a3;
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

@end