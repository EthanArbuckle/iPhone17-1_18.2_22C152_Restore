@interface PUKeyStore
- (BOOL)hasKeyWithLabel:(id)a3 isPublic:(BOOL)a4;
- (BOOL)storePasscodeBlob:(id)a3 withLabel:(id)a4;
- (id)_attributesForPasscodeBlobWithLabel:(id)a3;
- (id)getEncryptionKeyWithLabel:(id)a3;
- (id)getPasscodeBlobWithLabel:(id)a3;
- (id)newKeyWithLabel:(id)a3 allowAccessWhenLocked:(BOOL)a4;
- (void)deleteKeyWithLabel:(id)a3;
- (void)deletePasscodeBlobWithLabel:(id)a3;
- (void)storeEncryptionKey:(id)a3 withLabel:(id)a4 allowAccessWhenLocked:(BOOL)a5;
@end

@implementation PUKeyStore

- (id)newKeyWithLabel:(id)a3 allowAccessWhenLocked:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)storeEncryptionKey:(id)a3 withLabel:(id)a4 allowAccessWhenLocked:(BOOL)a5
{
}

- (BOOL)hasKeyWithLabel:(id)a3 isPublic:(BOOL)a4
{
  CFTypeRef v4 = sub_10000ACB0(a3, a4);
  CFTypeRef v5 = v4;
  if (v4) {
    CFRelease(v4);
  }
  return v5 != 0;
}

- (void)deleteKeyWithLabel:(id)a3
{
}

- (id)_attributesForPasscodeBlobWithLabel:(id)a3
{
  id v3 = a3;
  CFTypeRef v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:kSecClassGenericPassword forKeyedSubscript:kSecClass];
  [v4 setObject:v3 forKeyedSubscript:kSecAttrLabel];

  [v4 setObject:@"PairedUnlock" forKeyedSubscript:kSecAttrService];
  [v4 setObject:@"com.apple.paired-unlock" forKeyedSubscript:kSecAttrAccessGroup];
  return v4;
}

- (BOOL)storePasscodeBlob:(id)a3 withLabel:(id)a4
{
  id v6 = a3;
  CFDictionaryRef v7 = [(PUKeyStore *)self _attributesForPasscodeBlobWithLabel:a4];
  SecItemDelete(v7);
  [(__CFDictionary *)v7 setObject:v6 forKeyedSubscript:kSecValueData];

  [(__CFDictionary *)v7 setObject:kSecAttrAccessibleWhenUnlockedThisDeviceOnly forKeyedSubscript:kSecAttrAccessible];
  LOBYTE(self) = SecItemAdd(v7, 0) == 0;

  return (char)self;
}

- (id)getPasscodeBlobWithLabel:(id)a3
{
  id v3 = a3;
  id v6 = 0;
  v7[0] = kSecClass;
  v7[1] = kSecAttrLabel;
  v7[2] = kSecReturnData;
  v7[3] = kSecAttrService;
  v8[0] = kSecClassGenericPassword;
  v8[1] = v3;
  v8[2] = &__kCFBooleanTrue;
  v8[3] = @"PairedUnlock";
  v7[4] = kSecAttrAccessGroup;
  v8[4] = @"com.apple.paired-unlock";
  CFTypeRef v4 = 0;
  if (!SecItemCopyMatching((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5], (CFTypeRef *)&v6))CFTypeRef v4 = v6; {

  }
  return v4;
}

- (void)deletePasscodeBlobWithLabel:(id)a3
{
  CFDictionaryRef v3 = [(PUKeyStore *)self _attributesForPasscodeBlobWithLabel:a3];
  SecItemDelete(v3);
}

- (id)getEncryptionKeyWithLabel:(id)a3
{
  return (id)sub_10000ACB8(a3, 1);
}

@end