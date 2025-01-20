@interface NPUtilities
+ (BOOL)compareAddressEndpoints:(id)a3 endpoint2:(id)a4 addressOnly:(BOOL)a5;
+ (BOOL)hasPacketDrop:(id)a3;
+ (BOOL)printDictionaryAsJson:(id)a3 debugName:(id)a4;
+ (BOOL)rollDiceWithSuccessRatio:(id)a3;
+ (__SecKey)copyKeyFromKeychainWithIdentifier:(id)a3;
+ (id)connectionInfoToDict:(id)a3 dictionary:(id)a4;
+ (id)copyBase64HeaderValueFromData:(id)a3;
+ (id)copyCurrentNetworkCharacteristicsForPath:(id)a3;
+ (id)copyDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4;
+ (id)copyDataHexString:(id)a3;
+ (id)copyItemIdentifiersFromKeychainWithAccountName:(id)a3;
+ (id)copyNetworkDescription:(id)a3;
+ (id)copyTrueClientIPAddressFromPreferences;
+ (id)createAddressStringFromBuffer:(unint64_t)a3 addressLen:(uint64_t)a4 family:;
+ (id)createMaskedIPv4Address:(id)a3 prefix:(unint64_t)a4;
+ (id)createMaskedIPv6Address:(id)a3 prefix:(unint64_t)a4;
+ (id)endpointFromString:(id)a3 defaultPortString:(id)a4;
+ (id)getHashForObject:(id)a3;
+ (id)getInterfaceName:(int64_t)a3;
+ (id)getInterfaceTypeString:(int64_t)a3;
+ (id)hexDumpBytes:(const void *)a3 length:(unint64_t)a4;
+ (id)machoUUIDFromPID:(int)a3;
+ (id)parseXHost:(id)a3;
+ (id)sharedEmphemeralSession;
+ (id)stringFromLinkQualityValue:(int)a3;
+ (id)stripWhitespace:(id)a3;
+ (id)timestampIdentifierToName:(unint64_t)a3;
+ (int)pidFromAuditToken:(id *)a3;
+ (int64_t)certificateDateIsValid:(__SecCertificate *)a3;
+ (int64_t)interfaceTypeOfInterface:(id)a3;
+ (int64_t)interfaceTypeOfNWInterface:(id)a3;
+ (int64_t)protocolTypeFromPath:(id)a3 endpoint:(id)a4;
+ (unint64_t)parseXRTT:(id)a3;
+ (unint64_t)totalDataInKeychainWithIdentifier:(id)a3;
+ (void)fillOutConnectionInfo:(id)a3 withPath:(id)a4 interface:(id)a5 remoteEndpoint:(id)a6 parameters:(id)a7 outputHandler:(nw_protocol *)a8;
+ (void)parseXTimeout:(id)a3 hardTTLInSeconds:(double *)a4;
+ (void)postNotification:(id)a3 value:(unint64_t)a4;
+ (void)removeDataFromKeychainWithIdentifier:(id)a3;
+ (void)removeDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4;
+ (void)removeKeyFromKeychainWithIdentifier:(id)a3;
+ (void)saveDataToKeychain:(id)a3 withIdentifier:(id)a4 accountName:(id)a5;
+ (void)saveKeyToKeychain:(__SecKey *)a3 withIdentifier:(id)a4;
@end

@implementation NPUtilities

+ (id)sharedEmphemeralSession
{
  if (qword_1EB53BD48 != -1) {
    dispatch_once(&qword_1EB53BD48, &__block_literal_global_2);
  }
  v2 = (void *)_MergedGlobals_32;
  return v2;
}

void __38__NPUtilities_sharedEmphemeralSession__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F290E0];
  id v3 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
  uint64_t v1 = [v0 sessionWithConfiguration:v3];
  v2 = (void *)_MergedGlobals_32;
  _MergedGlobals_32 = v1;
}

+ (id)copyDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F3B988];
  uint64_t v8 = *MEMORY[0x1E4F3B850];
  v21[0] = *MEMORY[0x1E4F3B978];
  v21[1] = v8;
  v22[0] = v7;
  v22[1] = v5;
  uint64_t v9 = *MEMORY[0x1E4F3BB80];
  v21[2] = *MEMORY[0x1E4F3B5C0];
  v21[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F3BB90];
  v22[2] = v6;
  v22[3] = v10;
  v21[4] = *MEMORY[0x1E4F3BC70];
  v22[4] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  CFTypeRef result = 0;
  OSStatus v12 = SecItemCopyMatching(v11, &result);
  if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      OSStatus v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_debug_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching returned %d for %@", buf, 0x12u);
    }

    CFTypeRef v13 = 0;
  }
  else
  {
    CFTypeRef v13 = result;
  }

  return (id)v13;
}

+ (void)saveDataToKeychain:(id)a3 withIdentifier:(id)a4 accountName:(id)a5
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F3B978];
  uint64_t v10 = *MEMORY[0x1E4F3B988];
  uint64_t v11 = *MEMORY[0x1E4F3B850];
  v29[0] = *MEMORY[0x1E4F3B978];
  v29[1] = v11;
  v31[0] = v10;
  v31[1] = v7;
  uint64_t v30 = *MEMORY[0x1E4F3B5C0];
  uint64_t v12 = v30;
  v31[2] = v8;
  CFTypeRef v13 = (void *)MEMORY[0x1E4F1C9E8];
  id v14 = a3;
  CFDictionaryRef v15 = [v13 dictionaryWithObjects:v31 forKeys:v29 count:3];
  v27[0] = v11;
  v27[1] = v12;
  v28[0] = v7;
  v28[1] = v8;
  uint64_t v16 = *MEMORY[0x1E4F3B558];
  v27[2] = *MEMORY[0x1E4F3BD38];
  v27[3] = v16;
  uint64_t v17 = *MEMORY[0x1E4F3B578];
  v28[2] = v14;
  v28[3] = v17;
  CFDictionaryRef v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

  OSStatus v19 = SecItemUpdate(v15, v18);
  if (v19 == -25300)
  {
    id v20 = (void *)[(__CFDictionary *)v18 mutableCopy];
    [v20 setObject:v10 forKeyedSubscript:v9];
    OSStatus v19 = SecItemAdd((CFDictionaryRef)v20, 0);
  }
  if (v19)
  {
    v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v7;
      __int16 v25 = 1024;
      OSStatus v26 = v19;
      _os_log_error_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_ERROR, "Failed to save %@ to the keychain: %d", buf, 0x12u);
    }

    [a1 removeDataFromKeychainWithIdentifier:v7 accountName:v8];
  }
}

+ (unint64_t)totalDataInKeychainWithIdentifier:(id)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F3B988];
  uint64_t v5 = *MEMORY[0x1E4F3B850];
  v25[0] = *MEMORY[0x1E4F3B978];
  v25[1] = v5;
  v26[0] = v4;
  v26[1] = v3;
  uint64_t v6 = *MEMORY[0x1E4F3BB88];
  uint64_t v7 = *MEMORY[0x1E4F3BC70];
  v25[2] = *MEMORY[0x1E4F3BB80];
  v25[3] = v7;
  v26[2] = v6;
  v26[3] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
  CFTypeRef result = 0;
  OSStatus v9 = SecItemCopyMatching(v8, &result);
  unint64_t v10 = 0;
  uint64_t v11 = (void *)result;
  if (!v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v10 = [v11 length];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          unint64_t v10 = 0;
          uint64_t v15 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v10 += objc_msgSend(v17, "length", (void)v19);
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
          }
          while (v14);
        }
        else
        {
          unint64_t v10 = 0;
        }
      }
      else
      {
        unint64_t v10 = 0;
      }
    }
  }

  return v10;
}

+ (void)removeDataFromKeychainWithIdentifier:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F3B988];
  uint64_t v5 = *MEMORY[0x1E4F3B850];
  v15[0] = *MEMORY[0x1E4F3B978];
  v15[1] = v5;
  v16[0] = v4;
  v16[1] = v3;
  CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  OSStatus v7 = SecItemDelete(v6);
  if (v7 != -25300 && v7 != 0)
  {
    OSStatus v9 = v7;
    unint64_t v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v3;
      __int16 v13 = 1024;
      OSStatus v14 = v9;
      _os_log_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEFAULT, "Failed to delete %@ from the keychain: %d", (uint8_t *)&v11, 0x12u);
    }
  }
}

+ (void)removeDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F3B988];
  uint64_t v7 = *MEMORY[0x1E4F3B850];
  v19[0] = *MEMORY[0x1E4F3B978];
  v19[1] = v7;
  v20[0] = v6;
  v20[1] = v5;
  v19[2] = *MEMORY[0x1E4F3B5C0];
  v20[2] = a4;
  CFDictionaryRef v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a4;
  CFDictionaryRef v10 = [v8 dictionaryWithObjects:v20 forKeys:v19 count:3];

  OSStatus v11 = SecItemDelete(v10);
  if (v11 != -25300 && v11 != 0)
  {
    OSStatus v13 = v11;
    OSStatus v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v5;
      __int16 v17 = 1024;
      OSStatus v18 = v13;
      _os_log_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEFAULT, "Failed to delete %@ from the keychain: %d", (uint8_t *)&v15, 0x12u);
    }
  }
}

+ (__SecKey)copyKeyFromKeychainWithIdentifier:(id)a3
{
  void v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F3B9A0];
  uint64_t v5 = *MEMORY[0x1E4F3B5D0];
  v19[0] = *MEMORY[0x1E4F3B978];
  v19[1] = v5;
  v20[0] = v4;
  v20[1] = v3;
  uint64_t v6 = *MEMORY[0x1E4F3BB90];
  uint64_t v7 = *MEMORY[0x1E4F3BC80];
  v19[2] = *MEMORY[0x1E4F3BB80];
  void v19[3] = v7;
  v20[2] = v6;
  v20[3] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  CFTypeRef result = 0;
  OSStatus v9 = SecItemCopyMatching(v8, &result);
  if (v9 || (CFTypeID v10 = CFGetTypeID(result), v10 != SecKeyGetTypeID()))
  {
    id v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      OSStatus v16 = v9;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_debug_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching returned %d for %@", buf, 0x12u);
    }

    if (result) {
      CFRelease(result);
    }
    OSStatus v11 = 0;
  }
  else
  {
    OSStatus v11 = (__SecKey *)result;
  }

  return v11;
}

+ (void)saveKeyToKeychain:(__SecKey *)a3 withIdentifier:(id)a4
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F3B9A0];
  uint64_t v7 = *MEMORY[0x1E4F3B5D0];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B558];
  v18[2] = *MEMORY[0x1E4F3BD48];
  v18[3] = v8;
  v19[0] = v6;
  v19[1] = v5;
  uint64_t v9 = *MEMORY[0x1E4F3B578];
  v19[2] = a3;
  void v19[3] = v9;
  CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  OSStatus v11 = SecItemAdd(v10, 0);
  if (v11)
  {
    OSStatus v12 = v11;
    OSStatus v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 1024;
      OSStatus v17 = v12;
      _os_log_error_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_ERROR, "Failed to save key %@ to the keychain: %d", (uint8_t *)&v14, 0x12u);
    }
  }
}

+ (void)removeKeyFromKeychainWithIdentifier:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F3B9A0];
  uint64_t v5 = *MEMORY[0x1E4F3B5D0];
  v15[0] = *MEMORY[0x1E4F3B978];
  v15[1] = v5;
  v16[0] = v4;
  v16[1] = v3;
  CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  OSStatus v7 = SecItemDelete(v6);
  if (v7 != -25300 && v7 != 0)
  {
    OSStatus v9 = v7;
    CFDictionaryRef v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v3;
      __int16 v13 = 1024;
      OSStatus v14 = v9;
      _os_log_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEFAULT, "Failed to delete key %@ from the keychain: %d", (uint8_t *)&v11, 0x12u);
    }
  }
}

+ (id)copyItemIdentifiersFromKeychainWithAccountName:(id)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F3B988];
  uint64_t v5 = *MEMORY[0x1E4F3B5C0];
  v32[0] = *MEMORY[0x1E4F3B978];
  v32[1] = v5;
  v33[0] = v4;
  v33[1] = v3;
  uint64_t v6 = *MEMORY[0x1E4F3BB88];
  uint64_t v7 = *MEMORY[0x1E4F3BC68];
  v32[2] = *MEMORY[0x1E4F3BB80];
  v32[3] = v7;
  v33[2] = v6;
  v33[3] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];
  CFTypeRef result = 0;
  OSStatus v9 = SecItemCopyMatching(v8, &result);
  if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    CFDictionaryRef v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      OSStatus v28 = v9;
      __int16 v29 = 2112;
      id v30 = v3;
      _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching returned %d for %@", buf, 0x12u);
    }
    goto LABEL_19;
  }
  CFDictionaryRef v10 = (id)result;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (!v11)
  {
LABEL_19:
    id v13 = 0;
    goto LABEL_20;
  }
  uint64_t v12 = v11;
  CFDictionaryRef v20 = v8;
  id v21 = v3;
  id v13 = 0;
  uint64_t v14 = *(void *)v23;
  uint64_t v15 = *MEMORY[0x1E4F3B850];
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v10);
      }
      OSStatus v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = [v17 objectForKeyedSubscript:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v13) {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          objc_msgSend(v13, "addObject:", v18, v20, v21);
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
  }
  while (v12);
  CFDictionaryRef v8 = v20;
  id v3 = v21;
LABEL_20:

  if (result) {
    CFRelease(result);
  }

  return v13;
}

+ (int64_t)interfaceTypeOfInterface:(id)a3
{
  uint64_t v3 = nw_interface_get_type((nw_interface_t)a3) - 1;
  if (v3 < 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

+ (int64_t)interfaceTypeOfNWInterface:(id)a3
{
  int64_t result = [a3 type];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

+ (id)getInterfaceName:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"UNKNOWN";
  }
  else {
    return off_1E5A3B430[a3 - 1];
  }
}

+ (int64_t)protocolTypeFromPath:(id)a3 endpoint:(id)a4
{
  uint64_t v5 = a3;
  uint64_t v6 = a4;
  if (nw_path_has_ipv6(v5))
  {
    BOOL v7 = !nw_path_has_ipv4(v5);
    if (!v6)
    {
LABEL_13:
      if (v7) {
        int64_t v10 = 2;
      }
      else {
        int64_t v10 = 1;
      }
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v7 = 0;
    if (!v6) {
      goto LABEL_13;
    }
  }
  if (nw_endpoint_get_type(v6) != nw_endpoint_type_address) {
    goto LABEL_13;
  }
  int sa_family = nw_endpoint_get_address(v6)->sa_family;
  uint64_t v9 = 3;
  if (!v7) {
    uint64_t v9 = 1;
  }
  if (sa_family != 2) {
    uint64_t v9 = 0;
  }
  if (sa_family == 30) {
    int64_t v10 = 2;
  }
  else {
    int64_t v10 = v9;
  }
LABEL_16:

  return v10;
}

+ (void)fillOutConnectionInfo:(id)a3 withPath:(id)a4 interface:(id)a5 remoteEndpoint:(id)a6 parameters:(id)a7 outputHandler:(nw_protocol *)a8
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = a5;
  __int16 v16 = a6;
  OSStatus v17 = a7;
  if (!v16 || nw_endpoint_get_type(v16) != nw_endpoint_type_address) {
    goto LABEL_10;
  }
  id v18 = nw_endpoint_copy_address_string(v16);
  long long v19 = nw_endpoint_copy_port_string(v16);
  CFDictionaryRef v20 = v19;
  if (v18 && v19)
  {
    id v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s@%s", v18, v19);
    [v13 setEdgeAddress:v21];
  }
  else if (!v18)
  {
    goto LABEL_8;
  }
  free(v18);
LABEL_8:
  if (v20) {
    free(v20);
  }
LABEL_10:
  if (v14 && !v15) {
    uint64_t v15 = nw_path_copy_interface();
  }
  if (v14 && v15)
  {
    objc_msgSend(v13, "setIPType:", +[NPUtilities protocolTypeFromPath:endpoint:](NPUtilities, "protocolTypeFromPath:endpoint:", v14, v16));
    objc_msgSend(v13, "setInterfaceType:", +[NPUtilities interfaceTypeOfInterface:](NPUtilities, "interfaceTypeOfInterface:", v15));
LABEL_17:
    long long v22 = [NSString stringWithUTF8String:nw_interface_get_name(v15)];
    [v13 setInterfaceName:v22];

    goto LABEL_18;
  }
  if (v15) {
    goto LABEL_17;
  }
LABEL_18:
  if (a8)
  {
    long long v23 = (uint64_t (*)(nw_protocol *, uint64_t, uint64_t *))*((void *)a8->callbacks + 28);
    if (v23)
    {
      uint64_t v77 = 0;
      if (v17)
      {
        v69 = a8;
        if (nw_parameters_get_multipath_service(v17))
        {
          uint64_t v24 = (*((uint64_t (**)(nw_protocol *, uint64_t, uint64_t *))a8->callbacks + 28))(a8, 3, &v77);
          id v25 = 0;
          LOBYTE(v26) = 0;
          uint64_t v27 = v77;
          unint64_t v28 = 0xFFFFFFFFLL;
          if (v24 && v77 == 24)
          {
            __int16 v29 = (void *)v24;
            v68 = v16;
            unint64_t v30 = *(unsigned int *)(v24 + 16);
            v31 = &off_1A1092000;
            uint64_t v76 = v24;
            v75 = v17;
            if (v30)
            {
              unint64_t v32 = 0;
              id v25 = 0;
              LOBYTE(v70) = 0;
              unint64_t v28 = 0xFFFFFFFFLL;
              v72 = v15;
              id v73 = v14;
              do
              {
                uint64_t v33 = *(void *)(v29[1] + 8 * v32);
                if (v33)
                {
                  v34 = *(unsigned int **)(v33 + 32);
                  if (v34[15])
                  {
                    id v35 = v25;
                    unint64_t v36 = v28;
                    v37 = nw_interface_create_with_index();
                    v38 = v37;
                    if (v37)
                    {
                      uint64_t v39 = [NSString stringWithUTF8String:nw_interface_get_name(v37)];
                      if (v39)
                      {
                        v40 = v39;
                        v41 = v31;
                        if (!v25) {
                          id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                        }
                        v42 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v34 length:408];
                        id v35 = v25;
                        [v25 setObject:v42 forKeyedSubscript:v40];

                        uint64_t v43 = v34[6];
                        if (v43)
                        {
                          LODWORD(v44) = v34[7];
                          uint64_t v44 = v43 >= v44 ? v44 : 0;
                          unint64_t v45 = v43 - v44;
                          if (v45 < v36) {
                            unint64_t v36 = v45;
                          }
                        }
                        v31 = v41;
                        if ((v70 & 1) == 0) {
                          int v70 = (v34[61] >> 4) & 1;
                        }
                      }
                      else
                      {
                        v47 = nplog_obj();
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v79 = v38;
                          _os_log_error_impl(&dword_1A0FEE000, v47, OS_LOG_TYPE_ERROR, "Failed to get the interface name from %@", buf, 0xCu);
                        }

                        v40 = 0;
                      }
                    }
                    else
                    {
                      v40 = nplog_obj();
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v46 = v34[15];
                        *(_DWORD *)buf = 67109120;
                        LODWORD(v79) = v46;
                        _os_log_error_impl(&dword_1A0FEE000, v40, OS_LOG_TYPE_ERROR, "Failed to create an nw_interface object with interface index %d", buf, 8u);
                      }
                    }

                    __int16 v29 = (void *)v76;
                    unint64_t v30 = *(unsigned int *)(v76 + 16);
                    unint64_t v28 = v36;
                    OSStatus v17 = v75;
                    id v25 = v35;
                    uint64_t v15 = v72;
                    id v14 = v73;
                  }
                }
                ++v32;
              }
              while (v32 < v30);
            }
            else
            {
              LOBYTE(v70) = 0;
              id v25 = 0;
              unint64_t v28 = 0xFFFFFFFFLL;
            }
            if (*(_DWORD *)(*v29 + 28) == 2)
            {
              uint64_t v50 = 0;
              v74 = 0;
              v51 = *(unsigned int **)(*v29 + 32);
              int v67 = *((void *)v31 + 383);
              unint64_t v71 = v28;
              do
              {
                if (LOWORD(v51[v50 + 10]))
                {
                  v52 = nw_interface_create_with_index();
                  v53 = v52;
                  if (v52)
                  {
                    v54 = [NSString stringWithUTF8String:nw_interface_get_name(v52)];
                    if (v54)
                    {
                      id v55 = v74;
                      if (!v74) {
                        id v55 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                      }
                      v56 = [NSNumber numberWithUnsignedShort:HIWORD(v51[v50 + 10])];
                      v74 = v55;
                      [v55 setObject:v56 forKeyedSubscript:v54];
                    }
                    else
                    {
                      v56 = nplog_obj();
                      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v79 = v53;
                        _os_log_error_impl(&dword_1A0FEE000, v56, OS_LOG_TYPE_ERROR, "Failed to get the interface name from %@", buf, 0xCu);
                      }
                    }

                    unint64_t v28 = v71;
                  }
                  else
                  {
                    v54 = nplog_obj();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                    {
                      int v57 = LOWORD(v51[v50 + 10]);
                      *(_DWORD *)buf = v67;
                      LODWORD(v79) = v57;
                      _os_log_error_impl(&dword_1A0FEE000, v54, OS_LOG_TYPE_ERROR, "Failed to create an nw_interface object with interface index %d", buf, 8u);
                    }
                  }
                }
                v50 += 18;
              }
              while (v50 != 72);
              [v13 setMultipathSubflowSwitchCounts:v74];
              [v13 setMultipathSubflowCount:*v51];
              [v13 setMultipathConnectedSubflowCount:*v51];

              OSStatus v17 = v75;
            }
            if (v15) {
              [v13 setMultipathPrimarySubflowInterfaceIndex:nw_interface_get_index(v15)];
            }
            [v13 setIsMultipath:1];
            freemptcpinfo();
            uint64_t v27 = v77;
            __int16 v16 = v68;
            LOBYTE(v26) = v70;
          }
          if (v27) {
            goto LABEL_87;
          }
        }
        else
        {
          id v25 = 0;
          LOBYTE(v26) = 0;
          unint64_t v28 = 0xFFFFFFFFLL;
        }
        v49 = v69;
        long long v23 = (uint64_t (*)(nw_protocol *, uint64_t, uint64_t *))*((void *)v69->callbacks + 28);
      }
      else
      {
        v49 = a8;
        id v25 = 0;
        LOBYTE(v26) = 0;
        unint64_t v28 = 0xFFFFFFFFLL;
      }
      uint64_t v58 = v23(v49, 1, &v77);
      v59 = (unsigned int *)v58;
      if (v58 && v77 == 408)
      {
        v60 = [v13 interfaceName];

        if (v60)
        {
          if (!v25) {
            id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          id v61 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          v62 = (void *)[v61 initWithBytesNoCopy:v59 length:v77];
          v63 = [v13 interfaceName];
          [v25 setObject:v62 forKeyedSubscript:v63];

          uint64_t v64 = v59[6];
          if (v64)
          {
            LODWORD(v65) = v59[7];
            if (v64 >= v65) {
              uint64_t v65 = v65;
            }
            else {
              uint64_t v65 = 0;
            }
            unint64_t v66 = v64 - v65;
            if (v66 < v28) {
              unint64_t v28 = v66;
            }
          }
          int v26 = (v59[61] >> 4) & 1;
          goto LABEL_87;
        }
      }
      else if (!v58)
      {
LABEL_87:
        uint64_t v48 = v26 & 1;
        goto LABEL_88;
      }
      free(v59);
      goto LABEL_87;
    }
  }
  uint64_t v48 = 0;
  id v25 = 0;
  unint64_t v28 = 0xFFFFFFFFLL;
LABEL_88:
  [v13 setTCPInfo:v25];
  [v13 setMinimumRTT:v28];
  [v13 setTFOSucceeded:v48];
}

+ (BOOL)hasPacketDrop:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 state] && objc_msgSend(v4, "state") != 5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v7 = objc_msgSend(v4, "TCPInfo", 0);
    uint64_t v5 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v4 TCPInfo];
          uint64_t v12 = [v11 objectForKeyedSubscript:v10];

          if ([v12 length] == 408)
          {
            id v13 = v12;
            if (*(void *)([v13 bytes] + 84))
            {

              LOBYTE(v5) = 1;
              goto LABEL_17;
            }
          }
        }
        uint64_t v5 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (id)stripWhitespace:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length])
  {
    uint64_t v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\s+", &stru_1EF4275C8, 1024, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)hexDumpBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v4 = 0;
  if (a3 && a4)
  {
    BOOL v7 = malloc_type_malloc((2 * a4) | 1, 0xC419BCFAuLL);
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      unint64_t v10 = 2;
      do
      {
        sprintf(&v8[v10 - 2], "%x", *((char *)a3 + v9++));
        if (v9 >= a4) {
          break;
        }
        BOOL v11 = v10 >= 2 * a4 - 1;
        v10 += 2;
      }
      while (!v11);
      v8[2 * a4] = 0;
      uint64_t v4 = (void *)[[NSString alloc] initWithCString:v8 encoding:4];
      free(v8);
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

+ (void)parseXTimeout:(id)a3 hardTTLInSeconds:(double *)a4
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 doubleValue];
    double v6 = v5 * 60.0;
    BOOL v7 = v5 <= 0.0;
    double v8 = 92160.0;
    if (!v7) {
      double v8 = v6;
    }
    if (v8 > 151200.0) {
      double v8 = 151200.0;
    }
  }
  else
  {
    double v8 = 92160.0;
  }
  *a4 = v8;
}

+ (id)parseXHost:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length])
  {
    uint64_t v4 = [v3 componentsSeparatedByString:@","];
    double v6 = 0;
    if ([v4 count])
    {
      unint64_t v7 = 0;
      *(void *)&long long v5 = 138412290;
      long long v13 = v5;
      do
      {
        double v8 = objc_msgSend(v4, "objectAtIndexedSubscript:", v7, v13);
        id v9 = +[NPUtilities endpointFromString:v8 defaultPortString:0];

        if (v9)
        {
          if (!v6) {
            double v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
          }
          [v6 addObject:v9];
        }
        else
        {
          unint64_t v10 = nplog_obj();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            BOOL v11 = [v4 objectAtIndexedSubscript:v7];
            *(_DWORD *)buf = v13;
            long long v15 = v11;
            _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "Invalid host specification: %@", buf, 0xCu);
          }
        }

        ++v7;
      }
      while (v7 < [v4 count]);
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

+ (unint64_t)parseXRTT:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length])
  {
    uint64_t v4 = [v3 componentsSeparatedByString:@","];
    if ([v4 count])
    {
      long long v5 = [v4 objectAtIndexedSubscript:0];
      if ([v5 integerValue]) {
        unint64_t v6 = [v5 integerValue] / 1000 + 1;
      }
      else {
        unint64_t v6 = 0;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)copyBase64HeaderValueFromData:(id)a3
{
  id v3 = [a3 base64EncodedStringWithOptions:0];
  uint64_t v4 = [NSString stringWithFormat:@":%@:", v3];

  return v4;
}

+ (id)copyCurrentNetworkCharacteristicsForPath:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 status] == 1)
  {
    uint64_t v4 = [v3 interface];
    long long v5 = [v4 interfaceName];
    if (v5 && nwi_state_copy())
    {
      [v5 UTF8String];
      ifstate = (void *)nwi_state_get_ifstate();
      if (ifstate)
      {
        if ((nwi_ifstate_get_flags() & 3) != 0)
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
          nwi_ifstate_get_signature();
          nwi_ifstate_get_signature();
          [v7 appendBytes:"default_signature" length:18];
          unint64_t v8 = ((unint64_t)nwi_ifstate_get_flags() >> 1) & 1;
          v13[0] = v7;
          v12[0] = @"Signature";
          v12[1] = @"InterfaceType";
          id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "type"));
          v13[1] = v9;
          v12[2] = @"HasIPv6";
          unint64_t v10 = [NSNumber numberWithBool:v8];
          v13[2] = v10;
          ifstate = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
        }
        else
        {
          ifstate = 0;
        }
      }
      nwi_state_release();
    }
    else
    {
      ifstate = 0;
    }
  }
  else
  {
    ifstate = 0;
  }

  return ifstate;
}

+ (id)connectionInfoToDict:(id)a3 dictionary:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  *(void *)v79 = 0;
  uint64_t v80 = 0;
  char v81 = 0;
  if (!v5)
  {
    unint64_t v10 = 0;
    goto LABEL_57;
  }
  if (!v6) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  unint64_t v8 = [v5 pathType];
  if (v8 > 5) {
    id v9 = 0;
  }
  else {
    id v9 = off_1E5A3B450[v8];
  }
  [v7 setObject:v9 forKeyedSubscript:@"PathType"];
  if ([v5 pathType] == 2)
  {
    BOOL v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "fallbackReason"));
    [v7 setObject:v11 forKeyedSubscript:@"FallbackReasonNumber"];

    uint64_t v12 = +[NSPConnectionInfo getFallbackReasonDescription:](NSPConnectionInfo, "getFallbackReasonDescription:", [v5 fallbackReason]);
    [v7 setObject:v12 forKeyedSubscript:@"FallbackReason"];

    unint64_t v13 = [v5 fallbackReasonCategory];
    if (v13 <= 4) {
      id v9 = off_1E5A3B480[v13];
    }
    [v7 setObject:v9 forKeyedSubscript:@"FallbackCategory"];
    id v14 = objc_alloc(NSNumber);
    [v5 fallbackDelay];
    long long v15 = (__CFString *)objc_msgSend(v14, "initWithDouble:");
    uint64_t v16 = @"FallbackDelay";
    long long v17 = v7;
    id v18 = v15;
    goto LABEL_12;
  }
  if ([v5 pathType] == 1)
  {
    unint64_t v19 = [v5 edgeType];
    if (v19 <= 3) {
      id v9 = off_1E5A3B4A8[v19];
    }
    [v7 setObject:v9 forKeyedSubscript:@"EdgeType"];
    CFDictionaryRef v20 = [v5 edgeAddress];
    if (v20)
    {
      id v21 = [v5 edgeAddress];
      [v7 setObject:v21 forKeyedSubscript:@"EdgeAddress"];
    }
    else
    {
      [v7 setObject:@"unknown" forKeyedSubscript:@"EdgeAddress"];
    }

    long long v15 = [v5 firstTxByteTimeStamp];
    if (v15)
    {
      long long v22 = [v5 firstTxByteTimeStamp];
      long long v23 = [v22 description];
      [v7 setObject:v23 forKeyedSubscript:@"tunnelFirstTxByteTimestamp"];

      goto LABEL_21;
    }
    id v18 = @"unknown";
    uint64_t v16 = @"tunnelFirstTxByteTimestamp";
    long long v17 = v7;
LABEL_12:
    [v17 setObject:v18 forKeyedSubscript:v16];
LABEL_21:
  }
  if ([v5 isMultipath]) {
    uint64_t v24 = @"yes";
  }
  else {
    uint64_t v24 = @"no";
  }
  [v7 setObject:v24 forKeyedSubscript:@"IsMultipath"];
  id v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "multipathSubflowCount"));
  [v7 setObject:v25 forKeyedSubscript:@"SubflowCount"];

  int v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "multipathConnectedSubflowCount"));
  [v7 setObject:v26 forKeyedSubscript:@"ConnectedSubflowCount"];

  if ([v5 isTFOProbeSucceeded]) {
    uint64_t v27 = @"yes";
  }
  else {
    uint64_t v27 = @"no";
  }
  [v7 setObject:v27 forKeyedSubscript:@"IsTFOProbeSucceeded"];
  if (if_indextoname([v5 multipathPrimarySubflowInterfaceIndex], v79))
  {
    unint64_t v28 = [NSString stringWithUTF8String:v79];
    [v7 setObject:v28 forKeyedSubscript:@"PrimarySubflowInterface"];
  }
  uint64_t v29 = [v5 multipathSubflowSwitchCounts];
  if (v29)
  {
    unint64_t v30 = (void *)v29;
    v31 = [v5 multipathSubflowSwitchCounts];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      uint64_t v33 = [v5 multipathSubflowSwitchCounts];
      [v7 setObject:v33 forKeyedSubscript:@"SwitchCounts"];
    }
  }
  [v5 connectionDelay];
  if (v34 > 0.0)
  {
    id v35 = NSNumber;
    [v5 connectionDelay];
    unint64_t v36 = objc_msgSend(v35, "numberWithDouble:");
    [v7 setObject:v36 forKeyedSubscript:@"ConnectionDelay"];
  }
  [v5 firstTxByteDelay];
  if (v37 > 0.0)
  {
    v38 = NSNumber;
    [v5 firstTxByteDelay];
    uint64_t v39 = objc_msgSend(v38, "numberWithDouble:");
    [v7 setObject:v39 forKeyedSubscript:@"FirstTxByteDelay"];
  }
  [v5 timeToFirstByte];
  if (v40 > 0.0)
  {
    v41 = NSNumber;
    [v5 timeToFirstByte];
    v42 = objc_msgSend(v41, "numberWithDouble:");
    [v7 setObject:v42 forKeyedSubscript:@"TimeToFirstByte"];
  }
  if ([v5 tunnelConnectionError])
  {
    uint64_t v43 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "tunnelConnectionError"));
    [v7 setObject:v43 forKeyedSubscript:@"ConnectionError"];
  }
  uint64_t v44 = [v5 TCPInfo];
  if (v44)
  {
    unint64_t v45 = (void *)v44;
    unsigned int v46 = [v5 TCPInfo];
    uint64_t v47 = [v46 count];

    if (v47)
    {
      int v67 = v7;
      id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id obj = [v5 TCPInfo];
      uint64_t v71 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
      if (v71)
      {
        uint64_t v69 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v71; ++i)
          {
            if (*(void *)v73 != v69) {
              objc_enumerationMutation(obj);
            }
            uint64_t v49 = *(void *)(*((void *)&v72 + 1) + 8 * i);
            [v5 TCPInfo];
            v51 = id v50 = v5;
            v52 = [v51 objectForKeyedSubscript:v49];

            id v53 = v52;
            uint64_t v54 = [v53 bytes];
            v76[0] = @"TxBytes";
            id v55 = [NSNumber numberWithUnsignedLongLong:*(void *)(v54 + 76)];
            v77[0] = v55;
            v76[1] = @"TxPackets";
            v56 = [NSNumber numberWithUnsignedLongLong:*(void *)(v54 + 68)];
            v77[1] = v56;
            v76[2] = @"RxBytes";
            int v57 = [NSNumber numberWithUnsignedLongLong:*(void *)(v54 + 108)];
            v77[2] = v57;
            v76[3] = @"RxPackets";
            uint64_t v58 = [NSNumber numberWithUnsignedLongLong:*(void *)(v54 + 100)];
            v77[3] = v58;
            v76[4] = @"Resend";
            v59 = [NSNumber numberWithUnsignedLongLong:*(void *)(v54 + 284)];
            v77[4] = v59;
            v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:5];

            [v70 setObject:v60 forKeyedSubscript:v49];
            id v5 = v50;
          }
          uint64_t v71 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
        }
        while (v71);
      }

      id v7 = v67;
      [v67 setObject:v70 forKeyedSubscript:@"TCPMetrics"];
    }
  }
  [v5 timeIntervalSinceLastUsage];
  if (v61 > 0.0)
  {
    v62 = NSNumber;
    [v5 timeIntervalSinceLastUsage];
    v63 = objc_msgSend(v62, "numberWithDouble:");
    [v7 setObject:v63 forKeyedSubscript:@"TimeSinceLastUsage"];
  }
  if ([v5 TFOSucceeded]) {
    uint64_t v64 = @"yes";
  }
  else {
    uint64_t v64 = @"no";
  }
  [v7 setObject:v64 forKeyedSubscript:@"TFOSucceeded"];
  uint64_t v65 = [v5 timingIntervals];
  [v7 setObject:v65 forKeyedSubscript:@"TimingIntervals"];

  id v7 = v7;
  unint64_t v10 = v7;
LABEL_57:

  return v10;
}

+ (BOOL)printDictionaryAsJson:(id)a3 debugName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![MEMORY[0x1E4F28D90] isValidJSONObject:v5])
  {
    printf("%s are not a valid JSON object\n", (const char *)[v6 UTF8String]);
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  id v14 = 0;
  id v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:1 error:&v14];
  id v8 = v14;
  if (!v7)
  {
    BOOL v11 = (const char *)[v6 UTF8String];
    id v12 = [v8 description];
    printf("Failed to create JSON data from the %s: %s\n", v11, (const char *)[v12 UTF8String]);

    goto LABEL_6;
  }
  id v9 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  puts((const char *)[v9 UTF8String]);

  BOOL v10 = 1;
LABEL_7:

  return v10;
}

+ (id)endpointFromString:(id)a3 defaultPortString:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[NPUtilities stripWhitespace:a3];
  id v7 = [v6 componentsSeparatedByString:@"@"];
  id v8 = [v6 componentsSeparatedByString:@"."];
  if ((unint64_t)[v8 count] >= 3)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v25 + 1) + 8 * i) isEqualToString:@"_tcp"])
          {
            uint64_t v24 = [v9 objectAtIndexedSubscript:0];
            id v18 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
            unint64_t v19 = [v9 objectAtIndexedSubscript:1];
            if ((unint64_t)([v9 count] - 4) > 0xFFFFFFFFFFFFFFFCLL)
            {
              long long v22 = v19;
            }
            else
            {
              unint64_t v20 = 2;
              do
              {
                id v21 = [v9 objectAtIndexedSubscript:v20];
                long long v22 = [v19 stringByAppendingFormat:@".%@", v21];

                ++v20;
                unint64_t v19 = v22;
              }
              while (v20 < [v9 count] - 1);
            }
            long long v17 = [MEMORY[0x1E4F38BD0] endpointWithName:v24 type:v22 domain:v18];

            goto LABEL_22;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  if ((unint64_t)[v7 count] < 2)
  {
    if (v5)
    {
      long long v17 = [MEMORY[0x1E4F38BF0] endpointWithHostname:v6 port:v5];
    }
    else
    {
      long long v17 = 0;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F38BF0];
    long long v15 = [v7 objectAtIndexedSubscript:0];
    uint64_t v16 = [v7 objectAtIndexedSubscript:1];
    long long v17 = [v14 endpointWithHostname:v15 port:v16];
  }
LABEL_22:

  return v17;
}

+ (BOOL)compareAddressEndpoints:(id)a3 endpoint2:(id)a4 addressOnly:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      uint64_t v10 = (unsigned __int8 *)[v7 address];
      uint64_t v11 = (unsigned __int8 *)[v9 address];
      int v12 = v10[1];
      if (v12 == v11[1])
      {
        if (v12 == 30)
        {
          if (*v10 >= 0x1Cu
            && *v11 >= 0x1Cu
            && (a5 || *((unsigned __int16 *)v10 + 1) == *((unsigned __int16 *)v11 + 1)))
          {
            BOOL v13 = *((void *)v10 + 1) == *((void *)v11 + 1) && *((void *)v10 + 2) == *((void *)v11 + 2);
            goto LABEL_22;
          }
        }
        else if (v12 == 2 {
               && *v10 >= 0x10u
        }
               && *v11 >= 0x10u
               && (a5 || *((unsigned __int16 *)v10 + 1) == *((unsigned __int16 *)v11 + 1)))
        {
          BOOL v13 = *((_DWORD *)v10 + 1) == *((_DWORD *)v11 + 1);
LABEL_22:
          BOOL v14 = v13;
          goto LABEL_17;
        }
      }
      BOOL v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  BOOL v14 = 0;
LABEL_18:

  return v14;
}

+ (id)getInterfaceTypeString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Other";
  }
  else {
    return off_1E5A3B4C8[a3 - 1];
  }
}

+ (BOOL)rollDiceWithSuccessRatio:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unsigned int bytes = 0;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 4uLL, &bytes) < 0)
  {
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_ERROR, "SecRandomCopyBytes failed", buf, 2u);
    }

    BOOL v7 = 0;
  }
  else
  {
    double v4 = (double)(bytes % 0x2710) / 10000.0;
    id v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v12 = v4;
      _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Random ratio %f", buf, 0xCu);
    }

    [v3 doubleValue];
    BOOL v7 = v4 < v6;
  }

  return v7;
}

+ (id)timestampIdentifierToName:(unint64_t)a3
{
  if (a3 - 1 > 0xE) {
    return @"EnableNSP";
  }
  else {
    return off_1E5A3B4E0[a3 - 1];
  }
}

+ (id)getHashForObject:(id)a3
{
  return (id)[MEMORY[0x1E4F38CF0] hashObject:a3 withClassPrefixWhitelist:&unk_1EF43BDF0];
}

+ (id)copyDataHexString:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    double v4 = v13;
    memset(v13, 0, sizeof(v13));
    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    char v12 = 60;
    if ([v5 length])
    {
      uint64_t v7 = 0;
      do
      {
        snprintf(v4, 3uLL, "%02x", *(unsigned __int8 *)(v6 + v7));
        id v8 = v4 + 2;
        uint64_t v9 = v4 + 2 - &v12;
        if (v7 && (v7 & 3) == 0 && v9 <= 254)
        {
          v4[2] = 32;
          id v8 = v4 + 3;
          uint64_t v9 = v4 + 3 - &v12;
        }
        if (++v7 >= (unint64_t)[v5 length]) {
          break;
        }
        double v4 = v8;
      }
      while (v9 < 254);
      if (v9 > 254) {
        goto LABEL_15;
      }
    }
    else
    {
      id v8 = v13;
    }
    *v8++ = 62;
LABEL_15:
    *id v8 = 0;
    uint64_t v10 = (__CFString *)[[NSString alloc] initWithUTF8String:&v12];
    goto LABEL_16;
  }
  uint64_t v10 = &stru_1EF4275C8;
LABEL_16:

  return v10;
}

+ (id)copyNetworkDescription:(id)a3
{
  id v3 = a3;
  double v4 = [v3 objectForKeyedSubscript:@"InterfaceType"];
  id v5 = [v3 objectForKeyedSubscript:@"Signature"];

  id v6 = [NSString alloc];
  uint64_t v7 = +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", (int)[v4 intValue]);
  id v8 = +[NPUtilities copyDataHexString:v5];
  uint64_t v9 = (void *)[v6 initWithFormat:@"(%@): %@", v7, v8];

  return v9;
}

+ (int64_t)certificateDateIsValid:(__SecCertificate *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    SecCertificateNotValidBefore();
    CFAbsoluteTime v4 = v3;
    if (v3 == 0.0) {
      CFDateRef v5 = 0;
    }
    else {
      CFDateRef v5 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3);
    }
    SecCertificateNotValidAfter();
    CFAbsoluteTime v8 = v7;
    if (v7 == 0.0) {
      CFDateRef v9 = 0;
    }
    else {
      CFDateRef v9 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7);
    }
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current == 0.0)
    {
      CFDateRef v12 = 0;
      int64_t v6 = 4;
    }
    else
    {
      CFDateRef v11 = CFDateCreate(0, Current);
      CFDateRef v12 = v11;
      int64_t v6 = 4;
      if (v5 && v11)
      {
        if (CFDateCompare(v11, v5, 0) == kCFCompareLessThan)
        {
          uint64_t v13 = nplog_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            int64_t v6 = 2;
            _os_log_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_INFO, "Current time before valid time", buf, 2u);
          }
          else
          {
            int64_t v6 = 2;
          }
LABEL_23:

          uint64_t v20 = 0;
          uint64_t v21 = 0;
          int v19 = 0;
          uint64_t v14 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFCalendarIdentifier)*MEMORY[0x1E4F1D198]);
          if (v14)
          {
            long long v15 = v14;
            CFCalendarDecomposeAbsoluteTime(v14, v4, "yMdHm", (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20, &v19);
            uint64_t v16 = nplog_obj();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67110144;
              int v23 = HIDWORD(v21);
              __int16 v24 = 1024;
              int v25 = v21;
              __int16 v26 = 1024;
              int v27 = HIDWORD(v20);
              __int16 v28 = 1024;
              int v29 = v20;
              __int16 v30 = 1024;
              int v31 = v19;
              _os_log_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_INFO, "Certificate not valid before yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
            }

            CFCalendarDecomposeAbsoluteTime(v15, v8, "yMdHm", (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20, &v19);
            long long v17 = nplog_obj();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67110144;
              int v23 = HIDWORD(v21);
              __int16 v24 = 1024;
              int v25 = v21;
              __int16 v26 = 1024;
              int v27 = HIDWORD(v20);
              __int16 v28 = 1024;
              int v29 = v20;
              __int16 v30 = 1024;
              int v31 = v19;
              _os_log_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_INFO, "Certificate not valid after yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
            }

            CFRelease(v15);
          }
          goto LABEL_29;
        }
        if (v9 && CFDateCompare(v12, v9, 0) == kCFCompareGreaterThan)
        {
          uint64_t v13 = nplog_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_INFO, "Current time after valid time", buf, 2u);
          }
          int64_t v6 = 3;
          goto LABEL_23;
        }
        int64_t v6 = 1;
      }
    }
LABEL_29:
    CFRelease(v5);
    CFRelease(v9);
    CFRelease(v12);
    return v6;
  }
  return 4;
}

+ (void)postNotification:(id)a3 value:(unint64_t)a4
{
  id v5 = a3;
  int64_t v6 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v6);

  int out_token = -1;
  if (!notify_register_check((const char *)[v5 UTF8String], &out_token))
  {
    uint64_t v7 = 0;
    if (notify_get_state(out_token, &v7) || v7 != a4)
    {
      uint64_t v7 = a4;
      if (!notify_set_state(out_token, a4)) {
        notify_post((const char *)[v5 UTF8String]);
      }
    }
    notify_cancel(out_token);
  }
}

+ (id)copyTrueClientIPAddressFromPreferences
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!os_variant_allows_internal_security_policies()) {
    return 0;
  }
  v2 = CFPreferencesCopyAppValue(@"NSPTrueClientIPAddress", (CFStringRef)*MEMORY[0x1E4F1D3D8]);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CFAbsoluteTime v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = v2;
      _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "Detected true client ip address in preferences file: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    id v4 = v2;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)stringFromLinkQualityValue:(int)a3
{
  CFAbsoluteTime v3 = @"Invalid";
  id v4 = @"Minimally Viable";
  id v5 = @"Poor";
  int v6 = @"Good";
  if (a3 != 100) {
    int v6 = @"Invalid";
  }
  if (a3 != 50) {
    id v5 = v6;
  }
  if (a3 != 20) {
    id v4 = v5;
  }
  if (a3 == 10) {
    CFAbsoluteTime v3 = @"Bad";
  }
  if (a3 == -1) {
    CFAbsoluteTime v3 = @"Unknown";
  }
  if (a3 == -2) {
    CFAbsoluteTime v3 = @"Off";
  }
  if (a3 <= 19) {
    uint64_t v7 = v3;
  }
  else {
    uint64_t v7 = v4;
  }
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"%@ (%d)", v7, *(void *)&a3];
  return v8;
}

+ (id)machoUUIDFromPID:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  memset(buffer, 0, sizeof(buffer));
  id v4 = 0;
  if (proc_pidinfo(a3, 17, 1uLL, buffer, 56) == 56) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:buffer];
  }
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109378;
    v7[1] = a3;
    __int16 v8 = 2112;
    CFDateRef v9 = v4;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Mach-O UUID for process PID=%d is %@", (uint8_t *)v7, 0x12u);
  }

  return v4;
}

+ (int)pidFromAuditToken:(id *)a3
{
  return a3->var0[5];
}

+ (id)createAddressStringFromBuffer:(unint64_t)a3 addressLen:(uint64_t)a4 family:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self;
  if (!a2)
  {
    __int16 v8 = 0;
    goto LABEL_9;
  }
  if (a4 == 2)
  {
    int v7 = 2;
LABEL_8:
    inet_ntop(v7, a2, v10, 0x40u);
    __int16 v8 = [NSString stringWithUTF8String:v10];
    goto LABEL_9;
  }
  __int16 v8 = 0;
  if (a3 >= 0x10 && a4 == 30)
  {
    int v7 = 30;
    goto LABEL_8;
  }
LABEL_9:
  return v8;
}

+ (id)createMaskedIPv4Address:(id)a3 prefix:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a3;
    self;
    if (a4 < 0x21)
    {
      int __b = 0;
      if (a4 >= 8)
      {
        unint64_t v8 = a4 >> 3;
        memset(&__b, 255, a4 >> 3);
      }
      else
      {
        unint64_t v8 = 0;
      }
      if ((a4 & 7) != 0) {
        *((unsigned char *)&__b + v8) = 0xFF00u >> (a4 & 7);
      }
      int v7 = +[NPUtilities createAddressStringFromBuffer:addressLen:family:]((uint64_t)NPUtilities, &__b, 4uLL, 2);
      if (v7)
      {
        int v11 = 0;
        int __b = 0;
        inet_pton(2, (const char *)[v6 UTF8String], &__b);
        inet_pton(2, (const char *)[v7 UTF8String], &v11);
        __b &= v11;
        CFDateRef v9 = +[NPUtilities createAddressStringFromBuffer:addressLen:family:]((uint64_t)NPUtilities, &__b, 4uLL, 2);
        goto LABEL_14;
      }
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int __b = 136315138;
      uint64_t v13 = "+[NPUtilities createMaskedIPv4Address:prefix:]";
      _os_log_fault_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_FAULT, "%s called with null address", (uint8_t *)&__b, 0xCu);
    }
  }
  CFDateRef v9 = 0;
LABEL_14:

  return v9;
}

+ (id)createMaskedIPv6Address:(id)a3 prefix:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    self;
    unint64_t v6 = 0;
    int8x16_t __b = 0uLL;
    if (a4 >= 8)
    {
      unint64_t v6 = a4 >> 3;
      memset(&__b, 255, a4 >> 3);
    }
    if ((a4 & 7) != 0) {
      __b.i8[v6] = 0xFF00u >> (a4 & 7);
    }
    int v7 = +[NPUtilities createAddressStringFromBuffer:addressLen:family:]((uint64_t)NPUtilities, &__b, 0x10uLL, 30);
    if (v7)
    {
      int8x16_t __b = 0uLL;
      int8x16_t v10 = 0uLL;
      inet_pton(30, (const char *)[v5 UTF8String], &__b);
      inet_pton(30, (const char *)[v7 UTF8String], &v10);
      int8x16_t __b = vandq_s8(v10, __b);
      unint64_t v8 = +[NPUtilities createAddressStringFromBuffer:addressLen:family:]((uint64_t)NPUtilities, &__b, 0x10uLL, 30);
      goto LABEL_11;
    }
  }
  else
  {
    int v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __b.i32[0] = 136315138;
      *(uint64_t *)((char *)__b.i64 + 4) = (uint64_t)"+[NPUtilities createMaskedIPv6Address:prefix:]";
      _os_log_fault_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_FAULT, "%s called with null address", (uint8_t *)&__b, 0xCu);
    }
  }
  unint64_t v8 = 0;
LABEL_11:

  return v8;
}

@end