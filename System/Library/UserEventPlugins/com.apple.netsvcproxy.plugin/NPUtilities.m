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
  if (qword_17DF8 != -1) {
    dispatch_once(&qword_17DF8, &stru_14778);
  }
  v2 = (void *)qword_17DF0;

  return v2;
}

+ (id)copyDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = kSecClass;
  v12[1] = kSecAttrService;
  v13[0] = kSecClassGenericPassword;
  v13[1] = v5;
  v12[2] = kSecAttrAccount;
  v12[3] = kSecMatchLimit;
  v13[2] = v6;
  v13[3] = kSecMatchLimitOne;
  v12[4] = kSecReturnData;
  v13[4] = &__kCFBooleanTrue;
  CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  CFTypeRef v11 = 0;
  if (SecItemCopyMatching(v7, &v11) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_B794();
    }

    CFTypeRef v8 = 0;
  }
  else
  {
    CFTypeRef v8 = v11;
  }

  return (id)v8;
}

+ (void)saveDataToKeychain:(id)a3 withIdentifier:(id)a4 accountName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v18[0] = kSecClass;
  v18[1] = kSecAttrService;
  v19[0] = kSecClassGenericPassword;
  v19[1] = v7;
  v18[2] = kSecAttrAccount;
  v19[2] = v8;
  id v9 = a3;
  CFDictionaryRef v10 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  v16[0] = kSecAttrService;
  v16[1] = kSecAttrAccount;
  v17[0] = v7;
  v17[1] = v8;
  v16[2] = kSecValueData;
  v16[3] = kSecAttrAccessible;
  v17[2] = v9;
  v17[3] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  CFDictionaryRef v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];

  OSStatus v12 = SecItemUpdate(v10, v11);
  if (v12 == -25300)
  {
    id v13 = [(__CFDictionary *)v11 mutableCopy];
    [v13 setObject:kSecClassGenericPassword forKeyedSubscript:kSecClass];
    OSStatus v12 = SecItemAdd((CFDictionaryRef)v13, 0);
  }
  if (v12)
  {
    v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_B7FC();
    }

    [a1 removeDataFromKeychainWithIdentifier:v7 accountName:v8];
  }
}

+ (unint64_t)totalDataInKeychainWithIdentifier:(id)a3
{
  id v3 = a3;
  v21[0] = kSecClass;
  v21[1] = kSecAttrService;
  v22[0] = kSecClassGenericPassword;
  v22[1] = v3;
  v21[2] = kSecMatchLimit;
  v21[3] = kSecReturnData;
  v22[2] = kSecMatchLimitAll;
  v22[3] = &__kCFBooleanTrue;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  CFTypeRef result = 0;
  OSStatus v5 = SecItemCopyMatching(v4, &result);
  id v6 = 0;
  id v7 = (void *)result;
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (char *)[v7 length];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v9)
        {
          id v10 = v9;
          id v6 = 0;
          uint64_t v11 = *(void *)v16;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v6 = &v6[(void)objc_msgSend(v13, "length", (void)v15)];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
          }
          while (v10);
        }
        else
        {
          id v6 = 0;
        }
      }
      else
      {
        id v6 = 0;
      }
    }
  }

  return (unint64_t)v6;
}

+ (void)removeDataFromKeychainWithIdentifier:(id)a3
{
  id v3 = a3;
  v13[0] = kSecClass;
  v13[1] = kSecAttrService;
  v14[0] = kSecClassGenericPassword;
  v14[1] = v3;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  OSStatus v5 = SecItemDelete(v4);
  if (v5 != -25300 && v5 != 0)
  {
    OSStatus v7 = v5;
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 1024;
      OSStatus v12 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Failed to delete %@ from the keychain: %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

+ (void)removeDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4
{
  id v5 = a3;
  v16[0] = kSecClass;
  v16[1] = kSecAttrService;
  v17[0] = kSecClassGenericPassword;
  v17[1] = v5;
  v16[2] = kSecAttrAccount;
  v17[2] = a4;
  id v6 = a4;
  CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  OSStatus v8 = SecItemDelete(v7);
  if (v8 != -25300 && v8 != 0)
  {
    OSStatus v10 = v8;
    __int16 v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 1024;
      OSStatus v15 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Failed to delete %@ from the keychain: %d", (uint8_t *)&v12, 0x12u);
    }
  }
}

+ (__SecKey)copyKeyFromKeychainWithIdentifier:(id)a3
{
  id v3 = a3;
  v10[0] = kSecClass;
  v10[1] = kSecAttrApplicationLabel;
  v11[0] = kSecClassKey;
  v11[1] = v3;
  v10[2] = kSecMatchLimit;
  v10[3] = kSecReturnRef;
  v11[2] = kSecMatchLimitOne;
  v11[3] = &__kCFBooleanTrue;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  CFTypeRef cf = 0;
  if (SecItemCopyMatching(v4, &cf) || (CFTypeID v5 = CFGetTypeID(cf), v5 != SecKeyGetTypeID()))
  {
    CFDictionaryRef v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_B794();
    }

    if (cf) {
      CFRelease(cf);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = (__SecKey *)cf;
  }

  return v6;
}

+ (void)saveKeyToKeychain:(__SecKey *)a3 withIdentifier:(id)a4
{
  id v5 = a4;
  v8[0] = kSecClass;
  v8[1] = kSecAttrApplicationLabel;
  v8[2] = kSecValueRef;
  v8[3] = kSecAttrAccessible;
  v9[0] = kSecClassKey;
  v9[1] = v5;
  v9[2] = a3;
  v9[3] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
  if (SecItemAdd(v6, 0))
  {
    CFDictionaryRef v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_B864();
    }
  }
}

+ (void)removeKeyFromKeychainWithIdentifier:(id)a3
{
  id v3 = a3;
  v13[0] = kSecClass;
  v13[1] = kSecAttrApplicationLabel;
  v14[0] = kSecClassKey;
  v14[1] = v3;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  OSStatus v5 = SecItemDelete(v4);
  if (v5 != -25300 && v5 != 0)
  {
    OSStatus v7 = v5;
    OSStatus v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 1024;
      OSStatus v12 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Failed to delete key %@ from the keychain: %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

+ (id)copyItemIdentifiersFromKeychainWithAccountName:(id)a3
{
  id v3 = a3;
  v22[0] = kSecClass;
  v22[1] = kSecAttrAccount;
  v23[0] = kSecClassGenericPassword;
  v23[1] = v3;
  v22[2] = kSecMatchLimit;
  v22[3] = kSecReturnAttributes;
  v23[2] = kSecMatchLimitAll;
  v23[3] = &__kCFBooleanTrue;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
  CFTypeRef result = 0;
  if (SecItemCopyMatching(v4, &result) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    OSStatus v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_B794();
    }
    goto LABEL_19;
  }
  OSStatus v5 = (id)result;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (!v6)
  {
LABEL_19:
    id v8 = 0;
    goto LABEL_20;
  }
  id v7 = v6;
  CFDictionaryRef v14 = v4;
  id v15 = v3;
  id v8 = 0;
  uint64_t v9 = *(void *)v17;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v5);
      }
      __int16 v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        OSStatus v12 = [v11 objectForKeyedSubscript:kSecAttrService];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v8) {
            id v8 = objc_alloc_init((Class)NSMutableArray);
          }
          objc_msgSend(v8, "addObject:", v12, v14, v15);
        }
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  }
  while (v7);
  CFDictionaryRef v4 = v14;
  id v3 = v15;
LABEL_20:

  if (result) {
    CFRelease(result);
  }

  return v8;
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
  int64_t result = (int64_t)[a3 type];
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
    return off_147D8[a3 - 1];
  }
}

+ (int64_t)protocolTypeFromPath:(id)a3 endpoint:(id)a4
{
  OSStatus v5 = a3;
  id v6 = a4;
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
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  long long v16 = a6;
  long long v17 = a7;
  if (!v16 || nw_endpoint_get_type(v16) != nw_endpoint_type_address) {
    goto LABEL_10;
  }
  long long v18 = nw_endpoint_copy_address_string(v16);
  long long v19 = nw_endpoint_copy_port_string(v16);
  v20 = v19;
  if (v18 && v19)
  {
    id v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s@%s", v18, v19);
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
    id v15 = nw_path_copy_interface();
  }
  if (v14 && v15)
  {
    objc_msgSend(v13, "setIPType:", +[NPUtilities protocolTypeFromPath:endpoint:](NPUtilities, "protocolTypeFromPath:endpoint:", v14, v16));
    objc_msgSend(v13, "setInterfaceType:", +[NPUtilities interfaceTypeOfInterface:](NPUtilities, "interfaceTypeOfInterface:", v15));
LABEL_17:
    v22 = +[NSString stringWithUTF8String:nw_interface_get_name(v15)];
    [v13 setInterfaceName:v22];

    goto LABEL_18;
  }
  if (v15) {
    goto LABEL_17;
  }
LABEL_18:
  if (a8)
  {
    v23 = (uint64_t (*)(nw_protocol *, uint64_t, uint64_t *))*((void *)a8->var2 + 28);
    if (v23)
    {
      uint64_t v76 = 0;
      if (v17)
      {
        v68 = a8;
        if (nw_parameters_get_multipath_service(v17))
        {
          uint64_t v24 = (*((uint64_t (**)(nw_protocol *, uint64_t, uint64_t *))a8->var2 + 28))(a8, 3, &v76);
          id v25 = 0;
          LOBYTE(v26) = 0;
          uint64_t v27 = v76;
          unint64_t v28 = 0xFFFFFFFFLL;
          if (v24 && v76 == 24)
          {
            v29 = (void *)v24;
            v67 = v16;
            unint64_t v30 = *(unsigned int *)(v24 + 16);
            v31 = "ame";
            uint64_t v75 = v24;
            v74 = v17;
            if (v30)
            {
              unint64_t v32 = 0;
              id v25 = 0;
              LOBYTE(v69) = 0;
              unint64_t v28 = 0xFFFFFFFFLL;
              v71 = v15;
              id v72 = v14;
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
                      v39 = +[NSString stringWithUTF8String:nw_interface_get_name(v37)];
                      if (v39)
                      {
                        v40 = v31;
                        if (!v25) {
                          id v25 = objc_alloc_init((Class)NSMutableDictionary);
                        }
                        id v41 = [objc_alloc((Class)NSData) initWithBytes:v34 length:408];
                        id v35 = v25;
                        [v25 setObject:v41 forKeyedSubscript:v39];

                        uint64_t v42 = v34[6];
                        if (v42)
                        {
                          LODWORD(v43) = v34[7];
                          uint64_t v43 = v42 >= v43 ? v43 : 0;
                          unint64_t v44 = v42 - v43;
                          if (v44 < v36) {
                            unint64_t v36 = v44;
                          }
                        }
                        v31 = v40;
                        if ((v69 & 1) == 0) {
                          int v69 = (v34[61] >> 4) & 1;
                        }
                      }
                      else
                      {
                        v46 = nplog_obj();
                        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v78 = v38;
                          _os_log_error_impl(&dword_0, v46, OS_LOG_TYPE_ERROR, "Failed to get the interface name from %@", buf, 0xCu);
                        }
                      }
                    }
                    else
                    {
                      v39 = nplog_obj();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v45 = v34[15];
                        *(_DWORD *)buf = 67109120;
                        LODWORD(v78) = v45;
                        _os_log_error_impl(&dword_0, v39, OS_LOG_TYPE_ERROR, "Failed to create an nw_interface object with interface index %d", buf, 8u);
                      }
                    }

                    v29 = (void *)v75;
                    unint64_t v30 = *(unsigned int *)(v75 + 16);
                    unint64_t v28 = v36;
                    long long v17 = v74;
                    id v25 = v35;
                    id v15 = v71;
                    id v14 = v72;
                  }
                }
                ++v32;
              }
              while (v32 < v30);
            }
            else
            {
              LOBYTE(v69) = 0;
              id v25 = 0;
              unint64_t v28 = 0xFFFFFFFFLL;
            }
            if (*(_DWORD *)(*v29 + 28) == 2)
            {
              uint64_t v49 = 0;
              v73 = 0;
              v50 = *(unsigned int **)(*v29 + 32);
              int v66 = *((void *)v31 + 503);
              unint64_t v70 = v28;
              do
              {
                if (LOWORD(v50[v49 + 10]))
                {
                  v51 = nw_interface_create_with_index();
                  v52 = v51;
                  if (v51)
                  {
                    v53 = +[NSString stringWithUTF8String:nw_interface_get_name(v51)];
                    if (v53)
                    {
                      id v54 = v73;
                      if (!v73) {
                        id v54 = objc_alloc_init((Class)NSMutableDictionary);
                      }
                      v55 = +[NSNumber numberWithUnsignedShort:HIWORD(v50[v49 + 10])];
                      v73 = v54;
                      [v54 setObject:v55 forKeyedSubscript:v53];
                    }
                    else
                    {
                      v55 = nplog_obj();
                      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v78 = v52;
                        _os_log_error_impl(&dword_0, v55, OS_LOG_TYPE_ERROR, "Failed to get the interface name from %@", buf, 0xCu);
                      }
                    }

                    unint64_t v28 = v70;
                  }
                  else
                  {
                    v53 = nplog_obj();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                    {
                      int v56 = LOWORD(v50[v49 + 10]);
                      *(_DWORD *)buf = v66;
                      LODWORD(v78) = v56;
                      _os_log_error_impl(&dword_0, v53, OS_LOG_TYPE_ERROR, "Failed to create an nw_interface object with interface index %d", buf, 8u);
                    }
                  }
                }
                v49 += 18;
              }
              while (v49 != 72);
              [v13 setMultipathSubflowSwitchCounts:v73];
              [v13 setMultipathSubflowCount:*v50];
              [v13 setMultipathConnectedSubflowCount:*v50];

              long long v17 = v74;
            }
            if (v15) {
              [v13 setMultipathPrimarySubflowInterfaceIndex:nw_interface_get_index(v15)];
            }
            [v13 setIsMultipath:1];
            freemptcpinfo();
            uint64_t v27 = v76;
            long long v16 = v67;
            LOBYTE(v26) = v69;
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
        v48 = v68;
        v23 = (uint64_t (*)(nw_protocol *, uint64_t, uint64_t *))*((void *)v68->var2 + 28);
      }
      else
      {
        v48 = a8;
        id v25 = 0;
        LOBYTE(v26) = 0;
        unint64_t v28 = 0xFFFFFFFFLL;
      }
      uint64_t v57 = v23(v48, 1, &v76);
      v58 = (unsigned int *)v57;
      if (v57 && v76 == 408)
      {
        v59 = [v13 interfaceName];

        if (v59)
        {
          if (!v25) {
            id v25 = objc_alloc_init((Class)NSMutableDictionary);
          }
          id v60 = objc_alloc((Class)NSData);
          id v61 = [v60 initWithBytesNoCopy:v58 length:v76];
          v62 = [v13 interfaceName];
          [v25 setObject:v61 forKeyedSubscript:v62];

          uint64_t v63 = v58[6];
          if (v63)
          {
            LODWORD(v64) = v58[7];
            if (v63 >= v64) {
              uint64_t v64 = v64;
            }
            else {
              uint64_t v64 = 0;
            }
            unint64_t v65 = v63 - v64;
            if (v65 < v28) {
              unint64_t v28 = v65;
            }
          }
          int v26 = (v58[61] >> 4) & 1;
          goto LABEL_87;
        }
      }
      else if (!v57)
      {
LABEL_87:
        uint64_t v47 = v26 & 1;
        goto LABEL_88;
      }
      free(v58);
      goto LABEL_87;
    }
  }
  uint64_t v47 = 0;
  id v25 = 0;
  unint64_t v28 = 0xFFFFFFFFLL;
LABEL_88:
  [v13 setTCPInfo:v25];
  [v13 setMinimumRTT:v28];
  [v13 setTFOSucceeded:v47];
}

+ (BOOL)hasPacketDrop:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = v3;
  if (v3 && [v3 state] && objc_msgSend(v4, "state") != (char *)&dword_4 + 1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v7 = objc_msgSend(v4, "TCPInfo", 0);
    id v5 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          __int16 v11 = [v4 TCPInfo];
          OSStatus v12 = [v11 objectForKeyedSubscript:v10];

          if ([v12 length] == &stru_158.flags)
          {
            id v13 = v12;
            if (*(void *)((char *)[v13 bytes] + 84))
            {

              LOBYTE(v5) = 1;
              goto LABEL_17;
            }
          }
        }
        id v5 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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

  return (char)v5;
}

+ (id)stripWhitespace:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length])
  {
    CFDictionaryRef v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\s+", &stru_15690, 1024, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    CFDictionaryRef v4 = 0;
  }

  return v4;
}

+ (id)hexDumpBytes:(const void *)a3 length:(unint64_t)a4
{
  id v4 = 0;
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
      id v4 = [objc_alloc((Class)NSString) initWithCString:v8 encoding:4];
      free(v8);
    }
    else
    {
      id v4 = 0;
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
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length])
  {
    id v4 = [v3 componentsSeparatedByString:@","];
    id v6 = 0;
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
            id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
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
            _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Invalid host specification: %@", buf, 0xCu);
          }
        }

        ++v7;
      }
      while (v7 < (unint64_t)[v4 count]);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (unint64_t)parseXRTT:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length])
  {
    id v4 = [v3 componentsSeparatedByString:@","];
    if ([v4 count])
    {
      long long v5 = [v4 objectAtIndexedSubscript:0];
      if ([v5 integerValue]) {
        unint64_t v6 = (uint64_t)[v5 integerValue] / 1000 + 1;
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
  id v4 = +[NSString stringWithFormat:@":%@:", v3];

  return v4;
}

+ (id)copyCurrentNetworkCharacteristicsForPath:(id)a3
{
  id v3 = a3;
  if ([v3 status] == (char *)&dword_0 + 1)
  {
    id v4 = [v3 interface];
    long long v5 = [v4 interfaceName];
    if (v5 && nwi_state_copy())
    {
      [v5 UTF8String];
      ifstate = (void *)nwi_state_get_ifstate();
      if (ifstate)
      {
        if ((nwi_ifstate_get_flags() & 3) != 0)
        {
          id v7 = objc_alloc_init((Class)NSMutableData);
          nwi_ifstate_get_signature();
          nwi_ifstate_get_signature();
          [v7 appendBytes:"default_signature" length:18];
          unint64_t v8 = ((unint64_t)nwi_ifstate_get_flags() >> 1) & 1;
          v13[0] = v7;
          v12[0] = @"Signature";
          v12[1] = @"InterfaceType";
          id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 type]);
          v13[1] = v9;
          v12[2] = @"HasIPv6";
          unint64_t v10 = +[NSNumber numberWithBool:v8];
          void v13[2] = v10;
          ifstate = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
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
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  *(void *)uint64_t v75 = 0;
  uint64_t v76 = 0;
  char v77 = 0;
  if (!v5)
  {
    unint64_t v10 = 0;
    goto LABEL_57;
  }
  if (!v6) {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
  }
  unint64_t v8 = (unint64_t)[v5 pathType];
  if (v8 > 5) {
    id v9 = 0;
  }
  else {
    id v9 = off_147F8[v8];
  }
  [v7 setObject:v9 forKeyedSubscript:@"PathType"];
  if ([v5 pathType] == (char *)&dword_0 + 2)
  {
    BOOL v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 fallbackReason]);
    [v7 setObject:v11 forKeyedSubscript:@"FallbackReasonNumber"];

    OSStatus v12 = +[NSPConnectionInfo getFallbackReasonDescription:](NSPConnectionInfo, "getFallbackReasonDescription:", [v5 fallbackReason]);
    [v7 setObject:v12 forKeyedSubscript:@"FallbackReason"];

    unint64_t v13 = (unint64_t)[v5 fallbackReasonCategory];
    if (v13 <= 4) {
      id v9 = off_14828[v13];
    }
    [v7 setObject:v9 forKeyedSubscript:@"FallbackCategory"];
    id v14 = objc_alloc((Class)NSNumber);
    [v5 fallbackDelay];
    long long v15 = (__CFString *)objc_msgSend(v14, "initWithDouble:");
    long long v16 = @"FallbackDelay";
    long long v17 = v7;
    long long v18 = v15;
    goto LABEL_12;
  }
  if ([v5 pathType] == (char *)&dword_0 + 1)
  {
    unint64_t v19 = (unint64_t)[v5 edgeType];
    if (v19 <= 3) {
      id v9 = off_14850[v19];
    }
    [v7 setObject:v9 forKeyedSubscript:@"EdgeType"];
    v20 = [v5 edgeAddress];
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
      v22 = [v5 firstTxByteTimeStamp];
      v23 = [v22 description];
      [v7 setObject:v23 forKeyedSubscript:@"tunnelFirstTxByteTimestamp"];

      goto LABEL_21;
    }
    long long v18 = @"unknown";
    long long v16 = @"tunnelFirstTxByteTimestamp";
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
  id v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 multipathSubflowCount]);
  [v7 setObject:v25 forKeyedSubscript:@"SubflowCount"];

  int v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 multipathConnectedSubflowCount]);
  [v7 setObject:v26 forKeyedSubscript:@"ConnectedSubflowCount"];

  if ([v5 isTFOProbeSucceeded]) {
    uint64_t v27 = @"yes";
  }
  else {
    uint64_t v27 = @"no";
  }
  [v7 setObject:v27 forKeyedSubscript:@"IsTFOProbeSucceeded"];
  if (if_indextoname([v5 multipathPrimarySubflowInterfaceIndex], v75))
  {
    unint64_t v28 = +[NSString stringWithUTF8String:v75];
    [v7 setObject:v28 forKeyedSubscript:@"PrimarySubflowInterface"];
  }
  uint64_t v29 = [v5 multipathSubflowSwitchCounts];
  if (v29)
  {
    unint64_t v30 = (void *)v29;
    v31 = [v5 multipathSubflowSwitchCounts];
    id v32 = [v31 count];

    if (v32)
    {
      uint64_t v33 = [v5 multipathSubflowSwitchCounts];
      [v7 setObject:v33 forKeyedSubscript:@"SwitchCounts"];
    }
  }
  [v5 connectionDelay];
  if (v34 > 0.0)
  {
    [v5 connectionDelay];
    id v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 setObject:v35 forKeyedSubscript:@"ConnectionDelay"];
  }
  [v5 firstTxByteDelay];
  if (v36 > 0.0)
  {
    [v5 firstTxByteDelay];
    v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 setObject:v37 forKeyedSubscript:@"FirstTxByteDelay"];
  }
  [v5 timeToFirstByte];
  if (v38 > 0.0)
  {
    [v5 timeToFirstByte];
    v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 setObject:v39 forKeyedSubscript:@"TimeToFirstByte"];
  }
  if ([v5 tunnelConnectionError])
  {
    v40 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 tunnelConnectionError]);
    [v7 setObject:v40 forKeyedSubscript:@"ConnectionError"];
  }
  uint64_t v41 = [v5 TCPInfo];
  if (v41)
  {
    uint64_t v42 = (void *)v41;
    uint64_t v43 = [v5 TCPInfo];
    id v44 = [v43 count];

    if (v44)
    {
      uint64_t v63 = v7;
      id v66 = objc_alloc_init((Class)NSMutableDictionary);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id obj = [v5 TCPInfo];
      id v67 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
      if (v67)
      {
        uint64_t v65 = *(void *)v69;
        do
        {
          for (i = 0; i != v67; i = (char *)i + 1)
          {
            if (*(void *)v69 != v65) {
              objc_enumerationMutation(obj);
            }
            uint64_t v46 = *(void *)(*((void *)&v68 + 1) + 8 * i);
            [v5 TCPInfo];
            v48 = id v47 = v5;
            uint64_t v49 = [v48 objectForKeyedSubscript:v46];

            id v50 = v49;
            v51 = (char *)[v50 bytes];
            v72[0] = @"TxBytes";
            v52 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v51 + 76)];
            v73[0] = v52;
            v72[1] = @"TxPackets";
            v53 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v51 + 68)];
            v73[1] = v53;
            v72[2] = @"RxBytes";
            id v54 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v51 + 108)];
            v73[2] = v54;
            v72[3] = @"RxPackets";
            v55 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v51 + 100)];
            v73[3] = v55;
            v72[4] = @"Resend";
            int v56 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v51 + 284)];
            v73[4] = v56;
            uint64_t v57 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:5];

            [v66 setObject:v57 forKeyedSubscript:v46];
            id v5 = v47;
          }
          id v67 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
        }
        while (v67);
      }

      id v7 = v63;
      [v63 setObject:v66 forKeyedSubscript:@"TCPMetrics"];
    }
  }
  [v5 timeIntervalSinceLastUsage];
  if (v58 > 0.0)
  {
    [v5 timeIntervalSinceLastUsage];
    v59 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 setObject:v59 forKeyedSubscript:@"TimeSinceLastUsage"];
  }
  if ([v5 TFOSucceeded]) {
    id v60 = @"yes";
  }
  else {
    id v60 = @"no";
  }
  [v7 setObject:v60 forKeyedSubscript:@"TFOSucceeded"];
  id v61 = [v5 timingIntervals];
  [v7 setObject:v61 forKeyedSubscript:@"TimingIntervals"];

  id v7 = v7;
  unint64_t v10 = v7;
LABEL_57:

  return v10;
}

+ (BOOL)printDictionaryAsJson:(id)a3 debugName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!+[NSJSONSerialization isValidJSONObject:v5])
  {
    printf("%s are not a valid JSON object\n", (const char *)[v6 UTF8String]);
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  id v14 = 0;
  id v7 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:&v14];
  id v8 = v14;
  if (!v7)
  {
    BOOL v11 = (const char *)[v6 UTF8String];
    id v12 = [v8 description];
    printf("Failed to create JSON data from the %s: %s\n", v11, (const char *)[v12 UTF8String]);

    goto LABEL_6;
  }
  id v9 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
  puts((const char *)[v9 UTF8String]);

  BOOL v10 = 1;
LABEL_7:

  return v10;
}

+ (id)endpointFromString:(id)a3 defaultPortString:(id)a4
{
  id v5 = a4;
  id v6 = +[NPUtilities stripWhitespace:a3];
  id v7 = [v6 componentsSeparatedByString:@"@"];
  id v8 = [v6 componentsSeparatedByString:@"."];
  if ((unint64_t)[v8 count] >= 3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v24 + 1) + 8 * i) isEqualToString:@"_tcp"])
          {
            v23 = [v9 objectAtIndexedSubscript:0];
            long long v17 = objc_msgSend(v9, "objectAtIndexedSubscript:", (char *)objc_msgSend(v9, "count") - 1);
            long long v18 = [v9 objectAtIndexedSubscript:1];
            if ((char *)[v9 count] - 4 > (char *)0xFFFFFFFFFFFFFFFCLL)
            {
              id v21 = v18;
            }
            else
            {
              unint64_t v19 = (unsigned char *)(&dword_0 + 2);
              do
              {
                v20 = [v9 objectAtIndexedSubscript:v19];
                id v21 = [v18 stringByAppendingFormat:@".%@", v20];

                ++v19;
                long long v18 = v21;
              }
              while (v19 < (char *)[v9 count] - 1);
            }
            long long v16 = +[NWBonjourServiceEndpoint endpointWithName:v23 type:v21 domain:v17];

            goto LABEL_22;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
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
      long long v16 = +[NWHostEndpoint endpointWithHostname:v6 port:v5];
    }
    else
    {
      long long v16 = 0;
    }
  }
  else
  {
    id v14 = [v7 objectAtIndexedSubscript:0];
    long long v15 = [v7 objectAtIndexedSubscript:1];
    long long v16 = +[NWHostEndpoint endpointWithHostname:v14 port:v15];
  }
LABEL_22:

  return v16;
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
      id v10 = (unsigned __int8 *)[v7 address];
      id v11 = (unsigned __int8 *)[v9 address];
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
    return off_14870[a3 - 1];
  }
}

+ (BOOL)rollDiceWithSuccessRatio:(id)a3
{
  id v3 = a3;
  unsigned int bytes = 0;
  if (SecRandomCopyBytes(kSecRandomDefault, 4uLL, &bytes) < 0)
  {
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_B8CC(v8);
    }

    BOOL v7 = 0;
  }
  else
  {
    double v4 = (double)(bytes % 0x2710) / 10000.0;
    id v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_B910(v5, v4);
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
    return off_14888[a3 - 1];
  }
}

+ (id)getHashForObject:(id)a3
{
  return +[NEHasher hashObject:a3 withClassPrefixWhitelist:&off_17DD0];
}

+ (id)copyDataHexString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    double v4 = v13;
    memset(v13, 0, sizeof(v13));
    id v5 = v3;
    double v6 = (unsigned __int8 *)[v5 bytes];
    char v12 = 60;
    if ([v5 length])
    {
      uint64_t v7 = 0;
      do
      {
        snprintf(v4, 3uLL, "%02x", v6[v7]);
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
    id v10 = (__CFString *)[objc_alloc((Class)NSString) initWithUTF8String:&v12];
    goto LABEL_16;
  }
  id v10 = &stru_15690;
LABEL_16:

  return v10;
}

+ (id)copyNetworkDescription:(id)a3
{
  id v3 = a3;
  double v4 = [v3 objectForKeyedSubscript:@"InterfaceType"];
  id v5 = [v3 objectForKeyedSubscript:@"Signature"];

  id v6 = objc_alloc((Class)NSString);
  uint64_t v7 = +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", (int)[v4 intValue]);
  id v8 = +[NPUtilities copyDataHexString:v5];
  id v9 = [v6 initWithFormat:@"(%@): %@", v7, v8];

  return v9;
}

+ (int64_t)certificateDateIsValid:(__SecCertificate *)a3
{
  if (a3)
  {
    SecCertificateNotValidBefore();
    CFAbsoluteTime v4 = v3;
    if (v3 == 0.0) {
      CFDateRef v5 = 0;
    }
    else {
      CFDateRef v5 = CFDateCreate(kCFAllocatorDefault, v3);
    }
    SecCertificateNotValidAfter();
    CFAbsoluteTime v8 = v7;
    if (v7 == 0.0) {
      CFDateRef v9 = 0;
    }
    else {
      CFDateRef v9 = CFDateCreate(kCFAllocatorDefault, v7);
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
          BOOL v13 = nplog_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            int64_t v6 = 2;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Current time before valid time", buf, 2u);
          }
          else
          {
            int64_t v6 = 2;
          }
LABEL_23:

          uint64_t v20 = 0;
          uint64_t v21 = 0;
          int v19 = 0;
          BOOL v14 = CFCalendarCreateWithIdentifier(kCFAllocatorDefault, kCFGregorianCalendar);
          if (v14)
          {
            long long v15 = v14;
            CFCalendarDecomposeAbsoluteTime(v14, v4, "yMdHm", (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20, &v19);
            long long v16 = nplog_obj();
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
              _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Certificate not valid before yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
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
              _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Certificate not valid after yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
            }

            CFRelease(v15);
          }
          goto LABEL_29;
        }
        if (v9 && CFDateCompare(v12, v9, 0) == kCFCompareGreaterThan)
        {
          BOOL v13 = nplog_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Current time after valid time", buf, 2u);
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
  if (!os_variant_allows_internal_security_policies()) {
    return 0;
  }
  v2 = CFPreferencesCopyAppValue(@"NSPTrueClientIPAddress", kCFPreferencesCurrentApplication);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CFAbsoluteTime v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = v2;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Detected true client ip address in preferences file: %{public}@", (uint8_t *)&v6, 0xCu);
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
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"%@ (%d)", v7, *(void *)&a3];

  return v8;
}

+ (id)machoUUIDFromPID:(int)a3
{
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  id v3 = 0;
  if (proc_pidinfo(a3, 17, 1uLL, v6, 56) == 56) {
    id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v6];
  }
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_B9D0();
  }

  return v3;
}

+ (int)pidFromAuditToken:(id *)a3
{
  return a3->var0[5];
}

+ (id)createMaskedIPv4Address:(id)a3 prefix:(unint64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = sub_6C20((uint64_t)NPUtilities, a4);
    if (v7)
    {
      uint64_t v11 = 0;
      inet_pton(2, (const char *)[v6 UTF8String], (char *)&v11 + 4);
      inet_pton(2, (const char *)[v7 UTF8String], &v11);
      HIDWORD(v11) &= v11;
      id v8 = sub_6B48((uint64_t)NPUtilities, (char *)&v11 + 4, 4uLL, 2);
      goto LABEL_7;
    }
  }
  else
  {
    id v9 = 0;
    uint64_t v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_BA38(v7);
    }
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

+ (id)createMaskedIPv6Address:(id)a3 prefix:(unint64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_6CC8((uint64_t)NPUtilities, a4);
    if (v6)
    {
      int8x16_t v10 = 0uLL;
      int8x16_t v9 = 0uLL;
      inet_pton(30, (const char *)[v5 UTF8String], &v10);
      inet_pton(30, (const char *)[v6 UTF8String], &v9);
      int8x16_t v10 = vandq_s8(v9, v10);
      uint64_t v7 = sub_6B48((uint64_t)NPUtilities, &v10, 0x10uLL, 30);
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_BABC(v6);
    }
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

@end