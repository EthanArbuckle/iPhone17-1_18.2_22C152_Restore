@interface SKPaymentQueueClient
- (BOOL)allowsBootstrapCellularData;
- (BOOL)hidesConfirmationDialogs;
- (BOOL)ignoresInAppPurchaseRestriction;
- (BOOL)requiresAuthenticationForPayment;
- (NSNumber)storeExternalVersion;
- (NSNumber)storeItemIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)receiptDirectoryPath;
- (NSString)vendorIdentifier;
- (SKPaymentQueueClient)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)environmentType;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setEnvironmentType:(int64_t)a3;
- (void)setHidesConfirmationDialogs:(BOOL)a3;
- (void)setIgnoresInAppPurchaseRestriction:(BOOL)a3;
- (void)setReceiptDirectoryPath:(id)a3;
- (void)setRequiresAuthenticationForPayment:(BOOL)a3;
- (void)setStoreExternalVersion:(id)a3;
- (void)setStoreItemIdentifier:(id)a3;
- (void)setVendorIdentifier:(id)a3;
@end

@implementation SKPaymentQueueClient

- (SKPaymentQueueClient)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v20.receiver = self;
    v20.super_class = (Class)SKPaymentQueueClient;
    v6 = [(SKPaymentQueueClient *)&v20 init];
    if (v6)
    {
      v6->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(v5, "5");
      objc_opt_class();
      CFDictionaryRef v8 = sub_10010B0C0(v5, "0");
      bundleIdentifier = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v8;

      objc_opt_class();
      CFDictionaryRef v10 = sub_10010B0C0(v5, "1");
      bundleVersion = v6->_bundleVersion;
      v6->_bundleVersion = (NSString *)v10;

      v6->_environmentType = xpc_dictionary_get_int64(v5, "A");
      v6->_hidesConfirmationDialogs = xpc_dictionary_get_BOOL(v5, "6");
      v6->_ignoresInAppPurchaseRestriction = xpc_dictionary_get_BOOL(v5, "7");
      objc_opt_class();
      CFDictionaryRef v12 = sub_10010B0C0(v5, "8");
      receiptDirectoryPath = v6->_receiptDirectoryPath;
      v6->_receiptDirectoryPath = (NSString *)v12;

      v6->_requiresAuthenticationForPayment = xpc_dictionary_get_BOOL(v5, "9");
      objc_opt_class();
      CFDictionaryRef v14 = sub_10010B0C0(v5, "2");
      storeItemIdentifier = v6->_storeItemIdentifier;
      v6->_storeItemIdentifier = (NSNumber *)v14;

      objc_opt_class();
      CFDictionaryRef v16 = sub_10010B0C0(v5, "3");
      storeExternalVersion = v6->_storeExternalVersion;
      v6->_storeExternalVersion = (NSNumber *)v16;

      objc_opt_class();
      CFDictionaryRef v18 = sub_10010B0C0(v5, "4");
      vendorIdentifier = v6->_vendorIdentifier;
      v6->_vendorIdentifier = (NSString *)v18;
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "5", self->_allowsBootstrapCellularData);
  sub_10010B10C(v3, "0", (__CFString *)self->_bundleIdentifier);
  sub_10010B10C(v3, "1", (__CFString *)self->_bundleVersion);
  xpc_dictionary_set_int64(v3, "A", self->_environmentType);
  xpc_dictionary_set_BOOL(v3, "6", self->_hidesConfirmationDialogs);
  xpc_dictionary_set_BOOL(v3, "7", self->_ignoresInAppPurchaseRestriction);
  sub_10010B10C(v3, "8", (__CFString *)self->_receiptDirectoryPath);
  xpc_dictionary_set_BOOL(v3, "9", self->_requiresAuthenticationForPayment);
  sub_10010B10C(v3, "2", (__CFString *)self->_storeItemIdentifier);
  sub_10010B10C(v3, "3", (__CFString *)self->_storeExternalVersion);
  sub_10010B10C(v3, "4", (__CFString *)self->_vendorIdentifier);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setAllowsBootstrapCellularData:self->_allowsBootstrapCellularData];
  [v4 setBundleIdentifier:self->_bundleIdentifier];
  [v4 setBundleVersion:self->_bundleVersion];
  [v4 setEnvironmentType:self->_environmentType];
  [v4 setHidesConfirmationDialogs:self->_hidesConfirmationDialogs];
  [v4 setIgnoresInAppPurchaseRestriction:self->_ignoresInAppPurchaseRestriction];
  [v4 setReceiptDirectoryPath:self->_receiptDirectoryPath];
  [v4 setRequiresAuthenticationForPayment:self->_requiresAuthenticationForPayment];
  [v4 setStoreExternalVersion:self->_storeExternalVersion];
  [v4 setStoreItemIdentifier:self->_storeItemIdentifier];
  [v4 setVendorIdentifier:self->_vendorIdentifier];
  return v4;
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

- (int64_t)environmentType
{
  return self->_environmentType;
}

- (void)setEnvironmentType:(int64_t)a3
{
  self->_environmentType = a3;
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

- (NSNumber)storeExternalVersion
{
  return self->_storeExternalVersion;
}

- (void)setStoreExternalVersion:(id)a3
{
}

- (NSNumber)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(id)a3
{
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_storeExternalVersion, 0);
  objc_storeStrong((id *)&self->_receiptDirectoryPath, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end