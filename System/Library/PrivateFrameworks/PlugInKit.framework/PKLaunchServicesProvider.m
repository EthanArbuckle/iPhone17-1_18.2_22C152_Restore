@interface PKLaunchServicesProvider
- (BOOL)hasLSDatabaseAccess;
- (id)applicationProxyForBundleURL:(id)a3;
- (id)defaultApplicationWorkspace;
- (id)extensionPointForIdentifier:(id)a3 platform:(id)a4;
- (id)extensionPointRecordEnumeratorForExtensionPointIdentifier:(id)a3;
- (id)plugInKitProxyForURL:(id)a3;
- (id)plugInKitProxyForUUID:(id)a3;
- (id)plugInRecordEnumerator;
- (id)plugInRecordEnumeratorForExtensionPointRecord:(id)a3;
- (id)plugInRecordEnumeratorWithExtensionPointName:(id)a3 platform:(unsigned int)a4;
- (id)plugInRecordForIdentifier:(id)a3;
- (id)plugInRecordForUUID:(id)a3;
- (id)pluginKitProxyForIdentifier:(id)a3;
@end

@implementation PKLaunchServicesProvider

- (id)extensionPointRecordEnumeratorForExtensionPointIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1B3EBB4E0]();
  v5 = [MEMORY[0x1E4F22448] enumeratorForExtensionPointIdentifier:v3];

  return v5;
}

- (id)plugInRecordEnumeratorForExtensionPointRecord:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [MEMORY[0x1E4F223A0] enumeratorWithExtensionPointRecord:v3 options:0];
  }
  else
  {
    v5 = pklog_handle_for_category(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1B38D3498((uint64_t)v3, v5);
    }

    v4 = 0;
  }

  return v4;
}

- (id)defaultApplicationWorkspace
{
  v2 = +[PKApplicationWorkspaceProxy defaultWorkspace];
  return v2;
}

- (id)plugInRecordForUUID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F223A0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUID:v4 error:0];

  return v5;
}

- (BOOL)hasLSDatabaseAccess
{
  return MEMORY[0x1F4181798](MEMORY[0x1E4F22468], sel_hasDatabaseAccess);
}

- (id)applicationProxyForBundleURL:(id)a3
{
  id v3 = [MEMORY[0x1E4F223B8] applicationProxyForBundleURL:a3];
  return v3;
}

- (id)plugInKitProxyForURL:(id)a3
{
  id v3 = [MEMORY[0x1E4F22458] pluginKitProxyForURL:a3];
  return v3;
}

- (id)plugInKitProxyForUUID:(id)a3
{
  id v3 = [MEMORY[0x1E4F22458] pluginKitProxyForUUID:a3];
  return v3;
}

- (id)pluginKitProxyForIdentifier:(id)a3
{
  id v3 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:a3];
  return v3;
}

- (id)extensionPointForIdentifier:(id)a3 platform:(id)a4
{
  id v4 = [MEMORY[0x1E4F22440] extensionPointForIdentifier:a3 platform:a4];
  return v4;
}

- (id)plugInRecordForIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F223A0];
  id v4 = a3;
  LODWORD(v3) = [v3 instancesRespondToSelector:sel_initWithBundleIdentifier_requireValid_error_];
  id v5 = objc_alloc(MEMORY[0x1E4F223A0]);
  if (v3) {
    uint64_t v6 = [v5 initWithBundleIdentifier:v4 requireValid:1 error:0];
  }
  else {
    uint64_t v6 = [v5 initWithBundleIdentifier:v4 error:0];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)plugInRecordEnumerator
{
  v2 = [MEMORY[0x1E4F223A0] enumeratorWithOptions:0];
  return v2;
}

- (id)plugInRecordEnumeratorWithExtensionPointName:(id)a3 platform:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v11 = 0;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F22448]) initWithIdentifier:v5 platform:v4 error:&v11];
  id v7 = v11;
  if (v6)
  {
    v8 = [MEMORY[0x1E4F223A0] enumeratorWithExtensionPointRecord:v6 options:0];
  }
  else
  {
    v9 = pklog_handle_for_category(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1B38D3410((uint64_t)v5, (uint64_t)v7, v9);
    }

    v8 = 0;
  }

  return v8;
}

@end