@interface ACFKeychainManagerCertificateStoragePolicy
- (BOOL)removeCertificateWithLabel:(id)a3 realm:(id)a4;
- (BOOL)storeCertificate:(__SecCertificate *)a3 realm:(id)a4;
- (__SecCertificate)certificateWithLabel:(id)a3 realm:(id)a4;
- (id)keychainManager;
@end

@implementation ACFKeychainManagerCertificateStoragePolicy

- (id)keychainManager
{
  id v2 = +[ACFComponents components];

  return (id)[v2 keychainManager];
}

- (BOOL)removeCertificateWithLabel:(id)a3 realm:(id)a4
{
  id v6 = +[ACFKeychainItemInfo keychainItemInfo];
  [v6 setClassCode:*MEMORY[0x263F171C0]];
  [v6 setLabel:a3];
  id v7 = [(ACFKeychainManagerCertificateStoragePolicy *)self keychainManager];

  return [v7 removeItemWithInfo:v6];
}

- (BOOL)storeCertificate:(__SecCertificate *)a3 realm:(id)a4
{
  id v6 = +[ACFKeychainItemInfo keychainItemInfo];
  [v6 setClassCode:*MEMORY[0x263F171C0]];
  [v6 setValueRef:a3];
  if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    uint64_t v7 = [v6 attributes];
    ACFLogNS(7, (uint64_t)"-[ACFKeychainManagerCertificateStoragePolicy storeCertificate:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManagerCertificateStoragePolicy.m", 35, 0, @"Storing public key certificate with info = %@", v8, v9, v7);
  }
  return [[-[ACFKeychainManagerCertificateStoragePolicy keychainManager](self, "keychainManager") storeItemWithInfo:v6 share:1 result:0] == 0;
}

- (__SecCertificate)certificateWithLabel:(id)a3 realm:(id)a4
{
  id v6 = +[ACFKeychainItemInfo keychainItemInfo];
  [v6 setClassCode:*MEMORY[0x263F171C0]];
  [v6 setLabel:a3];
  result = (__SecCertificate *)[v6 label].length;
  if (result)
  {
    [v6 setReturnRef:1];
    uint64_t v8 = [[-[ACFKeychainManagerCertificateStoragePolicy keychainManager](self) searchItemWithInfo:v6];
    return (__SecCertificate *)[v8 valueRef];
  }
  return result;
}

@end