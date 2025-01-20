@interface PDBarcodeCertificateManager
- (PDBarcodeCertificateManager)init;
- (id)_keychainItemIdentifierForCertificateType:(int64_t)a3 withDeviceAccountIdentifier:(id)a4;
- (id)_keychainItemIdentifierForKeyDataWithCertificateType:(int64_t)a3 deviceAccountIdentifier:(id)a4;
- (id)_keychainItemWithIdentifier:(id)a3;
- (id)_readValueForIdentifier:(id)a3;
- (id)_storeCertificates:(id)a3 withCertificateType:(int64_t)a4 forDeviceAccountIdentifier:(id)a5;
- (id)createKeyAndSEAttestationForCertificateType:(int64_t)a3 withDeviceAccountIdentifier:(id)a4 session:(id)a5 outError:(id *)a6;
- (id)fetchCertificatesForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4;
- (id)fetchKeyDataForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4;
- (id)publicKeyHashForCertificateType:(int64_t)a3 deviceAccountIdentifier:(id)a4;
- (id)validateAndStoreCertificateChain:(id)a3 withCertificateType:(int64_t)a4 forPass:(id)a5;
- (void)_deleteItemForIdentifier:(id)a3;
- (void)_removeKeysForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4 session:(id)a5;
- (void)_storeValue:(id)a3 forIdentifier:(id)a4;
- (void)removeCertificateForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4;
- (void)removeKeysAndCertificatesForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4 session:(id)a5;
@end

@implementation PDBarcodeCertificateManager

- (PDBarcodeCertificateManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDBarcodeCertificateManager;
  result = [(PDBarcodeCertificateManager *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)createKeyAndSEAttestationForCertificateType:(int64_t)a3 withDeviceAccountIdentifier:(id)a4 session:(id)a5 outError:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  CFErrorRef error = 0;
  SecAccessControlRef v12 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0x40000000uLL, &error);
  CFErrorRef v13 = error;
  if (error) {
    goto LABEL_7;
  }
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = v14;
  if (a3 == 1)
  {
    Policy = (void *)SecAccessConstraintCreatePolicy();
    [v15 setObject:Policy forKeyedSubscript:@"od"];
    [v15 setObject:Policy forKeyedSubscript:@"ock"];
  }
  else if (!a3)
  {
    [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"osgn"];
  }
  SecAccessControlSetConstraints();

  CFErrorRef v13 = error;
  if (error)
  {
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  if (v11)
  {
    v21 = +[PKSecureElement primarySecureElementIdentifier];
    v17 = SESKeyCreateWithSession();
    CFErrorRef v13 = (CFErrorRef)0;

    if (!v13)
    {
      uint64_t v25 = +[PKSecureElement primarySecureElementIdentifier];
      v28[0] = kSEKeyCertOIDAccessControls;
      v28[1] = kSEKeyCertOIDAppletVersion;
      v22 = +[NSArray arrayWithObjects:v28 count:2];
      v18 = SESKeyCreatePTAttestationWithSession();
      CFErrorRef v13 = (CFErrorRef)0;

      v23 = (void *)v25;
      goto LABEL_23;
    }
LABEL_8:
    v18 = 0;
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v17 = SESKeyCreate();
  v24 = (__CFError *)0;
  if (v24)
  {
    CFErrorRef v13 = v24;
    goto LABEL_8;
  }
  v27[0] = kSEKeyCertOIDAccessControls;
  v27[1] = kSEKeyCertOIDAppletVersion;
  v23 = +[NSArray arrayWithObjects:v27 count:2];
  v18 = SESKeyCreatePTAttestation();
  CFErrorRef v13 = (CFErrorRef)0;
LABEL_23:

  if (v12) {
LABEL_9:
  }
    CFRelease(v12);
LABEL_10:
  if (a6) {
    *a6 = v13;
  }
  if (!v13)
  {
    v19 = [(PDBarcodeCertificateManager *)self _keychainItemIdentifierForKeyDataWithCertificateType:a3 deviceAccountIdentifier:v10];
    [(PDBarcodeCertificateManager *)self _storeValue:v17 forIdentifier:v19];
  }
  return v18;
}

- (id)validateAndStoreCertificateChain:(id)a3 withCertificateType:(int64_t)a4 forPass:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (![v8 count])
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a4 > 3) {
        SecAccessControlRef v12 = 0;
      }
      else {
        SecAccessControlRef v12 = off_100747EB8[a4];
      }
      *(_DWORD *)buf = 138412290;
      v42 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_validateAndStoreCertificateChain: Certificates for type %@ is empty.", buf, 0xCu);
    }

    id v26 = objc_alloc((Class)NSString);
    if ((unint64_t)a4 > 3) {
      v27 = 0;
    }
    else {
      v27 = off_100747EB8[a4];
    }
    id v18 = [v26 initWithFormat:@"_validateAndStoreCertificateChain: Certificates for type %@ is empty.", v27];
    NSErrorUserInfoKey v39 = NSDebugDescriptionErrorKey;
    id v40 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v20 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:v19];
    goto LABEL_23;
  }
  if ((PKBarcodeCreateAndValidateTrustWithCerts(v8, 0, a4) & 1) == 0)
  {
    id v10 = (unint64_t)a4 > 3 ? 0 : off_100747EB8[a4];
    CFErrorRef v13 = [v9 uniqueID];
    id v14 = +[NSString stringWithFormat:@"Failed to validate certificate of type: %@, for pass: %@", v10, v13];

    NSErrorUserInfoKey v47 = NSDebugDescriptionErrorKey;
    v48 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v15];

    if (v16) {
      goto LABEL_40;
    }
  }
  if ((unint64_t)a4 > 1) {
    goto LABEL_38;
  }
  v17 = [v9 deviceAccountIdentifier];
  id v18 = [(PDBarcodeCertificateManager *)self fetchKeyDataForDeviceAccountIdentifier:v17 withCertificateType:a4];

  if (!v18)
  {
    v28 = @"deviceDecryption";
    if (a4 != 1) {
      v28 = 0;
    }
    if (!a4) {
      v28 = @"deviceSignature";
    }
    v29 = v28;
    v30 = [v9 uniqueID];
    v31 = +[NSString stringWithFormat:@"No local key pair for certificate type: %@, pass: %@", v29, v30];

    NSErrorUserInfoKey v45 = NSDebugDescriptionErrorKey;
    v46 = v31;
    v32 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:v32];

    if (v16)
    {
      v19 = 0;
      goto LABEL_24;
    }
  }
  v19 = SESKeyPublicKey();
  id v20 = 0;
  if (v20)
  {
LABEL_23:
    v16 = v20;
LABEL_24:

LABEL_39:
    goto LABEL_40;
  }
  v21 = SecCertificateCreateWithData(kCFAllocatorDefault, (CFDataRef)[v8 firstObject]);
  if (v21)
  {
    v22 = v21;
    v23 = SecCertificateCopyKey(v21);
    if (v23)
    {
      v24 = v23;
      CFDataRef v25 = SecKeyCopyExternalRepresentation(v23, 0);
      CFRelease(v24);
      LODWORD(v24) = [v19 isEqualToData:v25];

      CFRelease(v22);
      if (v24)
      {

LABEL_38:
        id v18 = [v9 deviceAccountIdentifier];
        v16 = [(PDBarcodeCertificateManager *)self _storeCertificates:v8 withCertificateType:a4 forDeviceAccountIdentifier:v18];
        goto LABEL_39;
      }
    }
    else
    {
      CFRelease(v22);
    }
  }
  CFStringRef v33 = @"deviceDecryption";
  if (a4 != 1) {
    CFStringRef v33 = 0;
  }
  if (a4) {
    CFStringRef v34 = v33;
  }
  else {
    CFStringRef v34 = @"deviceSignature";
  }
  v35 = [v9 uniqueID];
  v36 = +[NSString stringWithFormat:@"Received certificate's public key does not match local public key for certificate type: %@, pass: %@", v34, v35];

  NSErrorUserInfoKey v43 = NSDebugDescriptionErrorKey;
  v44 = v36;
  v37 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v37];

  if (!v16) {
    goto LABEL_38;
  }
LABEL_40:

  return v16;
}

- (id)fetchCertificatesForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4
{
  if (a3)
  {
    v6 = [(PDBarcodeCertificateManager *)self _keychainItemIdentifierForCertificateType:a4 withDeviceAccountIdentifier:a3];
    v7 = [(PDBarcodeCertificateManager *)self _readValueForIdentifier:v6];
    if (v7)
    {
      id v8 = objc_alloc((Class)NSSet);
      uint64_t v9 = objc_opt_class();
      id v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
      id v16 = 0;
      id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v10 fromData:v7 error:&v16];
      id v12 = v16;

      if (!v11 || v12)
      {
        CFErrorRef v13 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)a4 > 3) {
            id v14 = 0;
          }
          else {
            id v14 = off_100747EB8[a4];
          }
          *(_DWORD *)buf = 138412546;
          id v18 = v14;
          __int16 v19 = 2112;
          id v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to unarchive certificate type: %@, with error %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (id)fetchKeyDataForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4
{
  v5 = [(PDBarcodeCertificateManager *)self _keychainItemIdentifierForKeyDataWithCertificateType:a4 deviceAccountIdentifier:a3];
  v6 = [(PDBarcodeCertificateManager *)self _readValueForIdentifier:v5];

  return v6;
}

- (void)removeKeysAndCertificatesForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4 session:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(PDBarcodeCertificateManager *)self removeCertificateForDeviceAccountIdentifier:v9 withCertificateType:a4];
  [(PDBarcodeCertificateManager *)self _removeKeysForDeviceAccountIdentifier:v9 withCertificateType:a4 session:v8];
}

- (void)removeCertificateForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4
{
  id v5 = [(PDBarcodeCertificateManager *)self _keychainItemIdentifierForCertificateType:a4 withDeviceAccountIdentifier:a3];
  [(PDBarcodeCertificateManager *)self _deleteItemForIdentifier:v5];
}

- (id)publicKeyHashForCertificateType:(int64_t)a3 deviceAccountIdentifier:(id)a4
{
  v4 = [(PDBarcodeCertificateManager *)self fetchCertificatesForDeviceAccountIdentifier:a4 withCertificateType:a3];
  CFDataRef v5 = [v4 firstObject];

  SecCertificateRef v6 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (v6)
  {
    SecCertificateRef v7 = v6;
    id v8 = (void *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_removeKeysForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4 session:(id)a5
{
  id v12 = a5;
  id v8 = [(PDBarcodeCertificateManager *)self _keychainItemIdentifierForKeyDataWithCertificateType:a4 deviceAccountIdentifier:a3];
  id v9 = [(PDBarcodeCertificateManager *)self _readValueForIdentifier:v8];
  if (v9)
  {
    if (v12)
    {
      id v10 = +[PKSecureElement primarySecureElementIdentifier];
      SESKeyDeleteWithSession();
    }
    else
    {
      SESKeyDelete();
    }
  }
  id v11 = [(PDBarcodeCertificateManager *)self _readValueForIdentifier:v8];
}

- (id)_storeCertificates:(id)a3 withCertificateType:(int64_t)a4 forDeviceAccountIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 count];
  id v11 = 0;
  if (v9 && v10)
  {
    id v12 = [(PDBarcodeCertificateManager *)self _keychainItemIdentifierForCertificateType:a4 withDeviceAccountIdentifier:v9];
    id v18 = 0;
    CFErrorRef v13 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v18];
    id v14 = v18;
    id v11 = v14;
    if (!v13 || v14)
    {
      v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if ((unint64_t)a4 > 3) {
          id v16 = 0;
        }
        else {
          id v16 = off_100747EB8[a4];
        }
        *(_DWORD *)buf = 138412546;
        id v20 = v16;
        __int16 v21 = 2112;
        v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to archive certificate type: %@, with error: %@", buf, 0x16u);
      }
    }
    else
    {
      [(PDBarcodeCertificateManager *)self _storeValue:v13 forIdentifier:v12];
    }
  }
  return v11;
}

- (void)_storeValue:(id)a3 forIdentifier:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = [(PDBarcodeCertificateManager *)self _keychainItemWithIdentifier:v7];

  [v9 setObject:v8 forKey:kSecValueData];
  os_unfair_lock_unlock(p_lock);
}

- (id)_readValueForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  SecCertificateRef v6 = [(PDBarcodeCertificateManager *)self _keychainItemWithIdentifier:v5];

  id v7 = [v6 objectForKey:kSecValueData];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_deleteItemForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PDBarcodeCertificateManager *)self _keychainItemWithIdentifier:v5];

  [v6 resetKeychainItem];
  os_unfair_lock_unlock(p_lock);
}

- (id)_keychainItemWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)PKKeychainItemWrapper);
  id v5 = [v4 initWithIdentifier:v3 accessGroup:PKPassdBundleIdentifier serviceName:@"com.apple.passd.auxiliarycapability" type:0 invisible:1 accessibility:1];

  [v5 setLabel:@"com.apple.passd.auxiliarycapability"];
  return v5;
}

- (id)_keychainItemIdentifierForCertificateType:(int64_t)a3 withDeviceAccountIdentifier:(id)a4
{
  if ((unint64_t)a3 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = off_100747EB8[a3];
  }
  return +[NSString stringWithFormat:@"%@.%@", a4, v4];
}

- (id)_keychainItemIdentifierForKeyDataWithCertificateType:(int64_t)a3 deviceAccountIdentifier:(id)a4
{
  if ((unint64_t)a3 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = off_100747EB8[a3];
  }
  return +[NSString stringWithFormat:@"%@.%@.keydata", a4, v4];
}

@end