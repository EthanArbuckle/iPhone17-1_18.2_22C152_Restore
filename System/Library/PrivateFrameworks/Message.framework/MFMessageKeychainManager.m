@interface MFMessageKeychainManager
+ (BOOL)_addAllIdentitiesToArray:(id *)a3 fromSyncableKeychain:(BOOL)a4 withError:(id *)a5 usingBlock:(id)a6;
+ (BOOL)_matchSSLClientIdentity:(__SecIdentity *)a3 withHostname:(id)a4;
+ (BOOL)_validateIdentity:(__SecIdentity *)a3 forAddress:(id)a4 policy:(__SecPolicy *)a5 usage:(unsigned int)a6 error:(id *)a7;
+ (BOOL)addPassword:(id)a3 forServiceName:(id)a4 accountName:(id)a5 keychainAccessibility:(void *)a6 synchronizable:(BOOL)a7 error:(id *)a8;
+ (BOOL)validateEncryptionIdentity:(__SecIdentity *)a3 forAddress:(id)a4 error:(id *)a5;
+ (BOOL)validateSigningIdentity:(__SecIdentity *)a3 forAddress:(id)a4 error:(id *)a5;
+ (__SecCertificate)_copyCertificateForPersistent:(id)a3 error:(id *)a4;
+ (__SecCertificate)copyEncryptionCertificateForAddress:(id)a3 error:(id *)a4;
+ (__SecIdentity)copyClientSSLIdentityForHostName:(id)a3 error:(id *)a4;
+ (__SecIdentity)copyIdentityForPersistentReference:(id)a3 error:(id *)a4;
+ (__SecPolicy)copySMIMEEncryptionPolicyForAddress:(id)a3;
+ (__SecPolicy)copySMIMESigningPolicyForAddress:(id)a3;
+ (id)_addCertificate:(__SecCertificate *)a3 persistent:(id *)a4;
+ (id)_addPersistentMapping:(id)a3 forAddress:(id)a4;
+ (id)_copyAllIdentitiesWithError:(id *)a3 usingBlock:(id)a4;
+ (id)_passwordForGenericAccount:(id)a3 service:(id)a4 error:(id *)a5;
+ (id)_passwordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(__CFString *)a6;
+ (id)_removeCertificateForPersistent:(id)a3;
+ (id)copyAllEncryptionIdentitiesForAddress:(id)a3 error:(id *)a4;
+ (id)copyAllSigningIdentitiesForAddress:(id)a3 error:(id *)a4;
+ (id)newTrustManager;
+ (id)passwordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(void *)a6;
+ (id)passwordForServiceName:(id)a3 accountName:(id)a4;
+ (id)passwordForServiceName:(id)a3 accountName:(id)a4 error:(id *)a5;
+ (id)passwordForServiceName:(id)a3 accountName:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6;
+ (id)persistentReferenceForIdentity:(__SecIdentity *)a3 error:(id *)a4;
+ (id)saveEncryptionCertificate:(__SecCertificate *)a3 forAddress:(id)a4;
+ (void)initialize;
+ (void)removePasswordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(void *)a6;
+ (void)removePasswordForServiceName:(id)a3 accountName:(id)a4;
+ (void)setPassword:(id)a3 forHost:(id)a4 username:(id)a5 port:(int)a6 keychainProtocol:(void *)a7 keychainAccessibility:(void *)a8;
+ (void)setPassword:(id)a3 forServiceName:(id)a4 accountName:(id)a5 keychainAccessibility:(void *)a6;
@end

@implementation MFMessageKeychainManager

+ (void)initialize
{
  if (!sKeychainLock) {
    sKeychainLock = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"keychainLock" andDelegate:0];
  }
}

+ (id)_passwordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(__CFString *)a6
{
  int valuePtr = a5;
  if ([a3 length] && objc_msgSend(a4, "length"))
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    Mutable = CFDictionaryCreateMutable(v9, 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B998]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B848], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B7C0], v10);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B7C8], a6);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
    OSStatus v12 = SecItemCopyMatching(Mutable, &cf);
    CFRelease(v10);
    CFRelease(Mutable);
    v13 = 0;
    if (!v12 && cf)
    {
      id v14 = [NSString alloc];
      v13 = (void *)[v14 initWithData:cf encoding:4];
      CFRelease(cf);
    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (id)passwordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(void *)a6
{
  uint64_t v7 = *(void *)&a5;
  objc_msgSend((id)sKeychainLock, "mf_waitForLock");
  v11 = (void *)[a1 _passwordForHost:a3 username:a4 port:v7 keychainProtocol:a6];
  [(id)sKeychainLock unlock];
  return v11;
}

+ (void)setPassword:(id)a3 forHost:(id)a4 username:(id)a5 port:(int)a6 keychainProtocol:(void *)a7 keychainAccessibility:(void *)a8
{
  unsigned int valuePtr = a6;
  objc_msgSend((id)sKeychainLock, "mf_waitForLock");
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFNumberRef v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  if (v15)
  {
    CFNumberRef v16 = v15;
    if ([a4 length])
    {
      if ([a5 length])
      {
        if ([a3 length])
        {
          uint64_t v17 = [a3 dataUsingEncoding:4];
          if (v17)
          {
            v18 = (const void *)v17;
            v25 = (void *)[a1 _passwordForHost:a4 username:a5 port:valuePtr keychainProtocol:a7];
            Mutable = CFDictionaryCreateMutable(v14, 0, 0, 0);
            if (Mutable)
            {
              v20 = Mutable;
              CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B998]);
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3B848], a4);
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3B7C0], v16);
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3B7C8], a7);
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3B5C0], a5);
              v21 = (const void *)*MEMORY[0x1E4F3B878];
              v22 = (const void *)*MEMORY[0x1E4F1CFD0];
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F1CFD0]);
              if (v25)
              {
                if (([v25 isEqualToString:a3] & 1) == 0)
                {
                  v23 = CFDictionaryCreateMutable(v14, 0, 0, 0);
                  if (v23)
                  {
                    v24 = v23;
                    CFDictionaryAddValue(v23, (const void *)*MEMORY[0x1E4F3BD38], v18);
                    CFDictionaryAddValue(v24, (const void *)*MEMORY[0x1E4F3B558], a8);
                    CFDictionaryAddValue(v24, v21, v22);
                    SecItemUpdate(v20, v24);
                    CFRelease(v24);
                  }
                }
              }
              else
              {
                CFTypeRef result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
                CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3BD38], v18);
                CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3B558], a8);
                SecItemAdd(v20, &result);
              }
              CFRelease(v20);
            }
          }
        }
      }
    }
    CFRelease(v16);
  }
  [(id)sKeychainLock unlock];
}

+ (void)removePasswordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(void *)a6
{
  int valuePtr = a5;
  objc_msgSend((id)sKeychainLock, "mf_waitForLock");
  if ([a3 length] && objc_msgSend(a4, "length"))
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    Mutable = CFDictionaryCreateMutable(v9, 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B998]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B848], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B7C0], v10);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B7C8], a6);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F1CFD0]);
    SecItemDelete(Mutable);
    CFRelease(v10);
    CFRelease(Mutable);
  }
  [(id)sKeychainLock unlock];
}

+ (id)_passwordForGenericAccount:(id)a3 service:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([a3 length] && objc_msgSend(a4, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFTypeRef result = 0;
    OSStatus v9 = SecItemCopyMatching(Mutable, &result);
    if (v9) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = result == 0;
    }
    if (v10)
    {
      OSStatus v11 = v9;
      OSStatus v12 = MFLogGeneral();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          *(_DWORD *)buf = 67109120;
          OSStatus v20 = v11;
          _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "#Warning SecItemCopyMatching result: %d", buf, 8u);
        }
        if (!a5)
        {
          CFNumberRef v16 = 0;
          goto LABEL_20;
        }
        CFAllocatorRef v14 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
        CFNumberRef v16 = 0;
      }
      else
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching succeeded with empty results", buf, 2u);
        }
        CFAllocatorRef v14 = 0;
        CFNumberRef v16 = 0;
        if (!a5) {
          goto LABEL_20;
        }
      }
    }
    else
    {
      id v15 = [NSString alloc];
      CFNumberRef v16 = (void *)[v15 initWithData:result encoding:4];
      CFRelease(result);
      if (!a5) {
        goto LABEL_20;
      }
      CFAllocatorRef v14 = 0;
    }
    *a5 = v14;
LABEL_20:
    CFRelease(Mutable);
    return v16;
  }
  CFNumberRef v16 = 0;
  return v16;
}

+ (id)passwordForServiceName:(id)a3 accountName:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6
{
  objc_msgSend((id)sKeychainLock, "mf_waitForLock", a3, a4, a5);
  BOOL v10 = (void *)[a1 _passwordForGenericAccount:a4 service:a3 error:a6];
  [(id)sKeychainLock unlock];
  return v10;
}

+ (id)passwordForServiceName:(id)a3 accountName:(id)a4 error:(id *)a5
{
  return (id)[a1 passwordForServiceName:a3 accountName:a4 synchronizable:1 error:a5];
}

+ (id)passwordForServiceName:(id)a3 accountName:(id)a4
{
  return (id)[a1 passwordForServiceName:a3 accountName:a4 error:0];
}

+ (BOOL)addPassword:(id)a3 forServiceName:(id)a4 accountName:(id)a5 keychainAccessibility:(void *)a6 synchronizable:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)sKeychainLock, "mf_waitForLock");
  if ([a4 length] && objc_msgSend(a3, "length") && objc_msgSend(a5, "length"))
  {
    CFAllocatorRef v14 = (const void *)[a3 dataUsingEncoding:4];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], a5);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], (const void *)[MEMORY[0x1E4F28ED0] numberWithBool:v9]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v14);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], a6);
    CFTypeRef result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
    OSStatus v16 = SecItemAdd(Mutable, &result);
    if (v16)
    {
      uint64_t v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v16;
        _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "#Warning SecItemAdd result: %ld", buf, 0xCu);
      }
    }
    CFRelease(Mutable);
  }
  else
  {
    OSStatus v16 = -25291;
  }
  [(id)sKeychainLock unlock];
  if (a8 && v16) {
    *a8 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
  }
  return v16 == 0;
}

+ (void)setPassword:(id)a3 forServiceName:(id)a4 accountName:(id)a5 keychainAccessibility:(void *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)sKeychainLock, "mf_waitForLock");
  if ([a4 length] && objc_msgSend(a3, "length") && objc_msgSend(a5, "length"))
  {
    OSStatus v11 = (const void *)[a3 dataUsingEncoding:4];
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], a5);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], a4);
    CFAllocatorRef v14 = (const void *)*MEMORY[0x1E4F3B878];
    id v15 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F1CFD0]);
    OSStatus v16 = (void *)[a1 _passwordForGenericAccount:a5 service:a4 error:0];
    if (v16)
    {
      if ([v16 isEqualToString:a3]) {
        goto LABEL_15;
      }
      uint64_t v17 = CFDictionaryCreateMutable(v12, 0, 0, 0);
      CFDictionaryAddValue(v17, (const void *)*MEMORY[0x1E4F3BD38], v11);
      CFDictionaryAddValue(v17, (const void *)*MEMORY[0x1E4F3B558], a6);
      CFDictionaryAddValue(v17, v14, v15);
      OSStatus v18 = SecItemUpdate(Mutable, v17);
      if (v17) {
        CFRelease(v17);
      }
      if (!v18) {
        goto LABEL_15;
      }
      v19 = MFLogGeneral();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v18;
      OSStatus v20 = "#Warning SecItemUpdate result: %ld";
      uint64_t v21 = v19;
    }
    else
    {
      CFTypeRef result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v11);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], a6);
      OSStatus v22 = SecItemAdd(Mutable, &result);
      if (!v22) {
        goto LABEL_15;
      }
      OSStatus v23 = v22;
      v24 = MFLogGeneral();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v23;
      OSStatus v20 = "#Warning SecItemAdd result: %ld";
      uint64_t v21 = v24;
    }
    _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
LABEL_15:
    CFRelease(Mutable);
  }
  [(id)sKeychainLock unlock];
}

+ (void)removePasswordForServiceName:(id)a3 accountName:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)sKeychainLock, "mf_waitForLock");
  if ([a3 length] && objc_msgSend(a4, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], a3);
    OSStatus v7 = SecItemDelete(Mutable);
    if (v7)
    {
      OSStatus v8 = v7;
      BOOL v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        uint64_t v11 = v8;
        _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "#Warning SecItemDelete result: %ld", (uint8_t *)&v10, 0xCu);
      }
    }
    CFRelease(Mutable);
  }
  [(id)sKeychainLock unlock];
}

+ (__SecPolicy)copySMIMESigningPolicyForAddress:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "emailAddressValue"), "simpleAddress");
  if (!v4) {
    uint64_t v4 = [a3 stringValue];
  }
  return (__SecPolicy *)MEMORY[0x1F40F7080](1, v4);
}

+ (__SecPolicy)copySMIMEEncryptionPolicyForAddress:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "emailAddressValue"), "simpleAddress");
  if (!v4) {
    uint64_t v4 = [a3 stringValue];
  }
  return (__SecPolicy *)MEMORY[0x1F40F7080](30, v4);
}

+ (__SecIdentity)copyIdentityForPersistentReference:(id)a3 error:(id *)a4
{
  keys[3] = *(void **)MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  CFTypeRef cf = 0;
  if (!a3) {
    return 0;
  }
  v5 = (void *)*MEMORY[0x1E4F3BD40];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v5;
  keys[2] = *(void **)MEMORY[0x1E4F3BC80];
  values[0] = *(void **)MEMORY[0x1E4F3B990];
  values[1] = a3;
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  OSStatus v7 = SecItemCopyMatching(v6, &cf);
  CFRelease(v6);
  if (!v7) {
    return (__SecIdentity *)cf;
  }
  OSStatus v8 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
  if (a4) {
    *a4 = v8;
  }
  CFTypeRef result = (__SecIdentity *)cf;
  if (cf)
  {
    CFRelease(cf);
    return 0;
  }
  return result;
}

+ (id)persistentReferenceForIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  CFTypeRef v12 = 0;
  if (a3)
  {
    v5 = (void *)*MEMORY[0x1E4F3BD48];
    keys[0] = *(void **)MEMORY[0x1E4F3B978];
    keys[1] = v5;
    CFDictionaryRef v6 = (void *)*MEMORY[0x1E4F3B550];
    keys[2] = *(void **)MEMORY[0x1E4F3BC78];
    keys[3] = v6;
    values[0] = *(void **)MEMORY[0x1E4F3B990];
    values[1] = a3;
    values[2] = *(void **)MEMORY[0x1E4F1CFD0];
    values[3] = @"com.apple.identities";
    CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    OSStatus v8 = SecItemCopyMatching(v7, &v12);
    CFRelease(v7);
    if (v8)
    {
      BOOL v9 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
      if (a4) {
        *a4 = v9;
      }
    }
    int v10 = (void *)v12;
  }
  else
  {
    int v10 = 0;
  }
  return v10;
}

+ (BOOL)_matchSSLClientIdentity:(__SecIdentity *)a3 withHostname:(id)a4
{
  SecCertificateRef certificateRef = (SecCertificateRef)0xAAAAAAAAAAAAAAAALL;
  if (SecIdentityCopyCertificate(a3, &certificateRef)
    || (CFArrayRef v6 = (const __CFArray *)SecCertificateCopyProperties(), CFRelease(certificateRef), !v6))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    CFIndex Count = CFArrayGetCount(v6);
    if (Count < 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      CFIndex v8 = Count;
      CFStringRef theString = (const __CFString *)a4;
      CFIndex v9 = 0;
      int v10 = (const void *)*MEMORY[0x1E4F3BC20];
      uint64_t v11 = (const void *)*MEMORY[0x1E4F3BC30];
      CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1E4F3BC40];
      key = (void *)*MEMORY[0x1E4F3BC38];
      CFTypeRef v30 = (CFTypeRef)*MEMORY[0x1E4F3BC48];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v9);
        CFTypeID v13 = CFGetTypeID(ValueAtIndex);
        if (v13 == CFDictionaryGetTypeID()
          && (CFAllocatorRef v14 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v10)) != 0
          && CFEqual(v14, @"1.2.840.113635.100.6.7")
          && (id v15 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v11)) != 0
          && CFEqual(v15, cf2)
          && (CFArrayRef v16 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, key),
              CFTypeID v17 = CFGetTypeID(v16),
              v17 == CFArrayGetTypeID())
          && (CFIndex v18 = CFArrayGetCount(v16), v18 >= 1))
        {
          CFIndex v19 = v18;
          uint64_t v20 = 1;
          do
          {
            uint64_t v21 = CFArrayGetValueAtIndex(v16, v20 - 1);
            CFTypeID v22 = CFGetTypeID(v21);
            BOOL v5 = v22 == CFDictionaryGetTypeID()
              && (Value = CFDictionaryGetValue((CFDictionaryRef)v21, v11)) != 0
              && CFEqual(Value, v30)
              && (CFStringRef v24 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v21, key),
                  CFTypeID v25 = CFGetTypeID(v24),
                  v25 == CFStringGetTypeID())
              && CFStringHasSuffix(theString, v24) != 0;
            if (v20 >= v19) {
              break;
            }
            ++v20;
          }
          while (!v5);
        }
        else
        {
          BOOL v5 = 0;
        }
        ++v9;
      }
      while (v9 < v8 && !v5);
    }
    CFRelease(v6);
  }
  return v5;
}

+ (__SecIdentity)copyClientSSLIdentityForHostName:(id)a3 error:(id *)a4
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  if (!a3) {
    return 0;
  }
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = keys[0];
  CFDictionaryRef v7 = (void *)*MEMORY[0x1E4F3BB80];
  keys[2] = *(void **)MEMORY[0x1E4F3BC80];
  keys[3] = v7;
  values[0] = *(void **)MEMORY[0x1E4F3B990];
  values[1] = values[0];
  CFIndex v8 = (void *)*MEMORY[0x1E4F3BB88];
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  values[3] = v8;
  CFDictionaryRef v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFTypeRef cf = 0;
  OSStatus v10 = SecItemCopyMatching(v9, &cf);
  CFRelease(v9);
  if (v10)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    if (a4) {
      *a4 = v11;
    }
    if (cf) {
      CFRelease(cf);
    }
    return 0;
  }
  if (!cf) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
  if (Count < 1)
  {
LABEL_14:
    ValueAtIndex = 0;
  }
  else
  {
    CFIndex v13 = Count;
    CFIndex v14 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)cf, v14);
      if ([a1 _matchSSLClientIdentity:ValueAtIndex withHostname:a3]) {
        break;
      }
      if (v13 == ++v14) {
        goto LABEL_14;
      }
    }
    CFRetain(ValueAtIndex);
  }
  CFRelease(cf);
  return (__SecIdentity *)ValueAtIndex;
}

+ (id)copyAllSigningIdentitiesForAddress:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  CFTypeRef v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__MFMessageKeychainManager_copyAllSigningIdentitiesForAddress_error___block_invoke;
  v10[3] = &unk_1E5D40C38;
  v10[5] = a3;
  v10[6] = &v11;
  v10[4] = a1;
  BOOL v5 = (void *)[a1 _copyAllIdentitiesWithError:a4 usingBlock:v10];
  CFArrayRef v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v5 count];
    uint64_t v8 = v12[3];
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = a3;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors Found %lu (out of %lu) matching signing identities for \"%@\"", buf, 0x20u);
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __69__MFMessageKeychainManager_copyAllSigningIdentitiesForAddress_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) validateSigningIdentity:a2 forAddress:*(void *)(a1 + 40) error:0];
}

+ (id)copyAllEncryptionIdentitiesForAddress:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  CFTypeRef v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__MFMessageKeychainManager_copyAllEncryptionIdentitiesForAddress_error___block_invoke;
  v10[3] = &unk_1E5D40C38;
  v10[5] = a3;
  v10[6] = &v11;
  v10[4] = a1;
  BOOL v5 = (void *)[a1 _copyAllIdentitiesWithError:a4 usingBlock:v10];
  CFArrayRef v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v5 count];
    uint64_t v8 = v12[3];
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = a3;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors Found %lu (out of %lu) matching encryption identities for \"%@\"", buf, 0x20u);
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __72__MFMessageKeychainManager_copyAllEncryptionIdentitiesForAddress_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) validateEncryptionIdentity:a2 forAddress:*(void *)(a1 + 40) error:0];
}

+ (id)_copyAllIdentitiesWithError:(id *)a3 usingBlock:(id)a4
{
  CFTypeRef v12 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__MFMessageKeychainManager__copyAllIdentitiesWithError_usingBlock___block_invoke;
  v11[3] = &unk_1E5D40C60;
  v11[4] = a4;
  int v6 = [a1 _addAllIdentitiesToArray:&v12 fromSyncableKeychain:0 withError:a3 usingBlock:v11];
  if (v6)
  {
    v9[4] = a4;
    id v10 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__MFMessageKeychainManager__copyAllIdentitiesWithError_usingBlock___block_invoke_2;
    v9[3] = &unk_1E5D40C60;
    if (([a1 _addAllIdentitiesToArray:&v12 fromSyncableKeychain:1 withError:&v10 usingBlock:v9] & 1) == 0)
    {
      uint64_t v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[MFMessageKeychainManager _copyAllIdentitiesWithError:usingBlock:](&v10, v7);
      }
    }
  }
  if (v6) {
    return v12;
  }
  else {
    return 0;
  }
}

uint64_t __67__MFMessageKeychainManager__copyAllIdentitiesWithError_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__MFMessageKeychainManager__copyAllIdentitiesWithError_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)_addAllIdentitiesToArray:(id *)a3 fromSyncableKeychain:(BOOL)a4 withError:(id *)a5 usingBlock:(id)a6
{
  keys[5] = *(void **)MEMORY[0x1E4F143B8];
  CFDictionaryRef v9 = @"com.apple.identities";
  id v10 = (void *)*MEMORY[0x1E4F3BB80];
  if (a4) {
    CFDictionaryRef v9 = @"com.apple.mail.identities";
  }
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v10;
  uint64_t v11 = (void *)*MEMORY[0x1E4F3BC80];
  keys[2] = *(void **)MEMORY[0x1E4F3B878];
  keys[3] = v11;
  keys[4] = *(void **)MEMORY[0x1E4F3B550];
  CFTypeRef v12 = (void *)*MEMORY[0x1E4F3BB88];
  values[0] = *(void **)MEMORY[0x1E4F3B990];
  values[1] = v12;
  uint64_t v13 = (void *)*MEMORY[0x1E4F1CFD0];
  uint64_t v14 = (void *)*MEMORY[0x1E4F1CFC8];
  if (a4) {
    uint64_t v14 = (void *)*MEMORY[0x1E4F1CFD0];
  }
  values[2] = v14;
  values[3] = v13;
  values[4] = v9;
  CFDictionaryRef v15 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 5, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFTypeRef result = 0;
  OSStatus v16 = SecItemCopyMatching(v15, &result);
  CFRelease(v15);
  if (v16 != -25300 && v16)
  {
    id v20 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
    if (a5) {
      *a5 = v20;
    }
    if (result) {
      CFRelease(result);
    }
    uint64_t v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = v16;
      _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_INFO, "#SMIMEErrors SecItemCopyMatching returned %ld", buf, 0xCu);
    }
  }
  else if (result)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)result);
    if (!*a3) {
      *a3 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
    }
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)result, i);
        if (!a6 || (*((unsigned int (**)(id, const void *))a6 + 2))(a6, ValueAtIndex)) {
          [*a3 addObject:ValueAtIndex];
        }
      }
    }
    CFRelease(result);
  }
  return !v16 || v16 == -25300;
}

+ (BOOL)validateSigningIdentity:(__SecIdentity *)a3 forAddress:(id)a4 error:(id *)a5
{
  CFDictionaryRef v9 = (const void *)[a1 copySMIMESigningPolicyForAddress:a4];
  LOBYTE(a5) = [a1 _validateIdentity:a3 forAddress:a4 policy:v9 usage:1 error:a5];
  CFRelease(v9);
  return (char)a5;
}

+ (BOOL)validateEncryptionIdentity:(__SecIdentity *)a3 forAddress:(id)a4 error:(id *)a5
{
  CFDictionaryRef v9 = (const void *)[a1 copySMIMEEncryptionPolicyForAddress:a4];
  LOBYTE(a5) = [a1 _validateIdentity:a3 forAddress:a4 policy:v9 usage:20 error:a5];
  CFRelease(v9);
  return (char)a5;
}

+ (BOOL)_validateIdentity:(__SecIdentity *)a3 forAddress:(id)a4 policy:(__SecPolicy *)a5 usage:(unsigned int)a6 error:(id *)a7
{
  CFTypeRef v12 = (void *)[a1 newTrustManager];
  uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "emailAddressValue"), "simpleAddress");
  if (!v13) {
    uint64_t v13 = [a4 stringValue];
  }
  SecCertificateRef certificateRef = 0;
  OSStatus v14 = SecIdentityCopyCertificate(a3, &certificateRef);
  if (certificateRef)
  {
    CFTypeRef cf = 0;
    OSStatus v15 = SecTrustCreateWithCertificates(certificateRef, a5, (SecTrustRef *)&cf);
    if (!cf)
    {
      if (!v15
        || a7 && *a7
        || (uint64_t v18 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v15 userInfo:0], !a7))
      {
        BOOL v16 = 0;
      }
      else
      {
        BOOL v16 = 0;
        *a7 = v18;
      }
      goto LABEL_26;
    }
    if ([v12 actionForSMIMETrust:cf sender:v13]
      && (SecCertificateGetKeyUsage() & a6) != 0)
    {
      BOOL v16 = 1;
LABEL_25:
      CFRelease(cf);
LABEL_26:
      CFRelease(certificateRef);
      goto LABEL_27;
    }
    if (a7)
    {
      if (!*a7)
      {
        BOOL v16 = 0;
        *a7 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"MFMessageKeychainManagerCertificateDeniedDomain" code:0 userInfo:0];
        goto LABEL_25;
      }
    }
    else
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"MFMessageKeychainManagerCertificateDeniedDomain" code:0 userInfo:0];
    }
    BOOL v16 = 0;
    goto LABEL_25;
  }
  if (!v14
    || a7 && *a7
    || (__int16 v17 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0], !a7))
  {
    BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = 0;
    *a7 = v17;
  }
LABEL_27:

  return v16;
}

+ (__SecCertificate)copyEncryptionCertificateForAddress:(id)a3 error:(id *)a4
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "emailAddressValue"), "simpleAddress");
  if (!v6) {
    uint64_t v6 = [a3 stringValue];
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"S/MIME Encryption for %@", v6];
  uint64_t v8 = *MEMORY[0x1E4F3B978];
  CFDictionaryRef v9 = (void *)*MEMORY[0x1E4F3B5C0];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v9;
  id v10 = (void *)*MEMORY[0x1E4F3B550];
  keys[2] = *(void **)MEMORY[0x1E4F3BC70];
  keys[3] = v10;
  values[0] = *(void **)MEMORY[0x1E4F3B988];
  values[1] = v7;
  uint64_t v11 = (void *)*MEMORY[0x1E4F1CFD0];
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  values[3] = @"com.apple.mobilemail.smime";
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v13 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);

  CFTypeRef result = 0;
  OSStatus v14 = SecItemCopyMatching(v13, &result);
  if (result)
  {
    uint64_t v15 = *MEMORY[0x1E4F3BD40];
    *(void *)v33 = v8;
    *(void *)&v33[8] = v15;
    *(void *)&v33[16] = *MEMORY[0x1E4F3BC80];
    v32[0] = *(void **)MEMORY[0x1E4F3B980];
    v32[1] = (void *)result;
    v32[2] = v11;
    CFDictionaryRef v16 = CFDictionaryCreate(v12, (const void **)v33, (const void **)v32, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFRelease(result);
    OSStatus v17 = SecItemCopyMatching(v16, &cf);
    CFRelease(v16);
    if (v17)
    {
      uint64_t v18 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v17 userInfo:0];
      if (a4) {
        *a4 = v18;
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
    else if (cf)
    {
      goto LABEL_17;
    }
    SecItemDelete(v13);
LABEL_17:
    uint64_t v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      CFStringRef v24 = "a";
      if (!cf) {
        CFStringRef v24 = "no";
      }
      *(_DWORD *)buf = 136315394;
      v29 = v24;
      __int16 v30 = 2112;
      uint64_t v31 = v6;
      CFTypeID v22 = "#SMIMEErrors Found %s certificate for \"%@\".";
      OSStatus v23 = buf;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  OSStatus v19 = v14;
  if (v14 != -25300)
  {
    if (v14)
    {
      id v20 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
      if (a4) {
        *a4 = v20;
      }
    }
  }
  uint64_t v21 = MFLogGeneral();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v33 = 138412546;
    *(void *)&v33[4] = v6;
    *(_WORD *)&v33[12] = 2048;
    *(void *)&v33[14] = v19;
    CFTypeID v22 = "#SMIMEErrors Found no certificates for \"%@\" (%ld)";
    OSStatus v23 = v33;
LABEL_21:
    _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_INFO, v22, v23, 0x16u);
  }
LABEL_22:
  CFRelease(v13);
  CFTypeID v25 = (__SecCertificate *)cf;
  if (a4 && cf)
  {
    if (*a4) {
      *a4 = 0;
    }
  }
  return v25;
}

+ (id)_addCertificate:(__SecCertificate *)a3 persistent:(id *)a4
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)*MEMORY[0x1E4F3BD48];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v5;
  uint64_t v6 = (void *)*MEMORY[0x1E4F3B550];
  keys[2] = *(void **)MEMORY[0x1E4F3BC78];
  keys[3] = v6;
  values[0] = *(void **)MEMORY[0x1E4F3B980];
  values[1] = a3;
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  values[3] = @"com.apple.mobilemail.smime";
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  OSStatus v8 = SecItemAdd(v7, (CFTypeRef *)a4);
  if (v8 == -25299) {
    OSStatus v8 = SecItemCopyMatching(v7, (CFTypeRef *)a4);
  }
  CFRelease(v7);
  if (!v8)
  {
    CFDictionaryRef v9 = 0;
    if (!a4) {
      return v9;
    }
    goto LABEL_5;
  }
  CFDictionaryRef v9 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
  if (a4) {
LABEL_5:
  }
    id v10 = *a4;
  return v9;
}

+ (__SecCertificate)_copyCertificateForPersistent:(id)a3 error:(id *)a4
{
  keys[3] = *(void **)MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)*MEMORY[0x1E4F3BD40];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v5;
  keys[2] = *(void **)MEMORY[0x1E4F3BC80];
  values[0] = *(void **)MEMORY[0x1E4F3B980];
  values[1] = a3;
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v11 = 0;
  OSStatus v7 = SecItemCopyMatching(v6, (CFTypeRef *)&v11);
  CFRelease(v6);
  if (a4)
  {
    if (v7 == -25300 || v7 == 0) {
      CFDictionaryRef v9 = 0;
    }
    else {
      CFDictionaryRef v9 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
    }
    *a4 = v9;
  }
  return v11;
}

+ (id)_addPersistentMapping:(id)a3 forAddress:(id)a4
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  id v17 = a3;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a4, "emailAddressValue"), "simpleAddress");
  if (!v6) {
    uint64_t v6 = [a4 stringValue];
  }
  OSStatus v7 = (void *)[[NSString alloc] initWithFormat:@"S/MIME Encryption for %@", v6];
  OSStatus v8 = (void *)*MEMORY[0x1E4F3B5C0];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F3BD38];
  id v10 = (void *)*MEMORY[0x1E4F3B550];
  keys[2] = *(void **)MEMORY[0x1E4F3BD38];
  keys[3] = v10;
  values[0] = *(void **)MEMORY[0x1E4F3B988];
  values[1] = v7;
  values[2] = a3;
  values[3] = @"com.apple.mobilemail.smime";
  CFDictionaryRef v11 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);

  OSStatus v12 = SecItemAdd(v11, 0);
  if (v12 == -25299)
  {
    CFDictionaryRef v13 = (void *)[(__CFDictionary *)v11 mutableCopy];
    [v13 removeObjectForKey:v9];
    id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    CFDictionaryRef v15 = (const __CFDictionary *)[v14 initWithObjects:&v17 forKeys:MEMORY[0x1E4F3BD38] count:1];
    OSStatus v12 = SecItemUpdate((CFDictionaryRef)v13, v15);
  }
  CFRelease(v11);
  if (v12) {
    return (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
  }
  else {
    return 0;
  }
}

+ (id)_removeCertificateForPersistent:(id)a3
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)*MEMORY[0x1E4F3B978];
  BOOL v5 = (void *)*MEMORY[0x1E4F3BC70];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v5;
  uint64_t v6 = (void *)*MEMORY[0x1E4F3B550];
  keys[2] = *(void **)MEMORY[0x1E4F3BB80];
  keys[3] = v6;
  OSStatus v7 = (void *)*MEMORY[0x1E4F1CFD0];
  values[0] = *(void **)MEMORY[0x1E4F3B988];
  values[1] = v7;
  values[2] = *(void **)MEMORY[0x1E4F3BB88];
  values[3] = @"com.apple.mobilemail.smime";
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFArrayRef theArray = 0;
  OSStatus v10 = SecItemCopyMatching(v9, (CFTypeRef *)&theArray);
  CFRelease(v9);
  if (v10 != -25300 && v10)
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28760];
    uint64_t v16 = v10;
  }
  else
  {
    if (theArray)
    {
      CFIndex Count = CFArrayGetCount(theArray);
      if (Count)
      {
        unint64_t v12 = Count;
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
        if (CFEqual(ValueAtIndex, a3))
        {
          CFRelease(theArray);
          return 0;
        }
        CFIndex v17 = 1;
        while (v12 != v17)
        {
          uint64_t v18 = CFArrayGetValueAtIndex(theArray, v17++);
          if (CFEqual(v18, a3))
          {
            CFRelease(theArray);
            if (v17 - 1 >= v12) {
              goto LABEL_14;
            }
            return 0;
          }
        }
      }
      CFRelease(theArray);
    }
LABEL_14:
    OSStatus v19 = (void *)*MEMORY[0x1E4F3BD40];
    v26[0] = v4;
    v26[1] = v19;
    v25[0] = *(void **)MEMORY[0x1E4F3B980];
    v25[1] = a3;
    CFDictionaryRef v20 = CFDictionaryCreate(v8, (const void **)v26, (const void **)v25, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    OSStatus v21 = SecItemDelete(v20);
    CFRelease(v20);
    if (v21 == -25300 || v21 == 0) {
      return 0;
    }
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28760];
    uint64_t v16 = v21;
  }
  return (id)[v14 errorWithDomain:v15 code:v16 userInfo:0];
}

+ (id)saveEncryptionCertificate:(__SecCertificate *)a3 forAddress:(id)a4
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  CFStringRef v24 = 0;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "emailAddressValue"), "simpleAddress");
  if (!v7) {
    uint64_t v7 = [a4 stringValue];
  }
  CFAllocatorRef v8 = (void *)[[NSString alloc] initWithFormat:@"S/MIME Encryption for %@", v7];
  CFDictionaryRef v9 = (void *)*MEMORY[0x1E4F3B5C0];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v9;
  OSStatus v10 = (void *)*MEMORY[0x1E4F3B550];
  keys[2] = *(void **)MEMORY[0x1E4F3BC70];
  keys[3] = v10;
  values[0] = *(void **)MEMORY[0x1E4F3B988];
  values[1] = v8;
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  values[3] = @"com.apple.mobilemail.smime";
  CFDictionaryRef v11 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);

  CFTypeRef result = 0;
  OSStatus v12 = SecItemCopyMatching(v11, &result);
  if (v12 != -25300 && v12)
  {
    CFStringRef v24 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
    goto LABEL_24;
  }
  if (a3)
  {
    if (!result)
    {
      uint64_t v18 = 0;
      BOOL v17 = 1;
      goto LABEL_18;
    }
    uint64_t v13 = [a1 _copyCertificateForPersistent:result error:&v24];
    if (!v13) {
      goto LABEL_24;
    }
    id v14 = (const void *)v13;
    SHA1Digest = (const void *)SecCertificateGetSHA1Digest();
    uint64_t v16 = (const void *)SecCertificateGetSHA1Digest();
    BOOL v17 = CFEqual(SHA1Digest, v16) == 0;
    CFRelease(v14);
    uint64_t v18 = (uint64_t)v24;
    if (!v17)
    {
LABEL_18:
      if (!v17) {
        goto LABEL_24;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v18 = 0;
    BOOL v17 = 0;
  }
  if (v18) {
    goto LABEL_18;
  }
  OSStatus v19 = SecItemDelete(v11);
  if (v19 && v19 != -25300)
  {
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v19 userInfo:0];
    CFStringRef v24 = (void *)v18;
    if (!v17) {
      goto LABEL_24;
    }
  }
  else
  {
    [a1 _removeCertificateForPersistent:result];
    uint64_t v18 = (uint64_t)v24;
    if (!v17) {
      goto LABEL_24;
    }
  }
LABEL_19:
  if (!v18)
  {
    CFStringRef v24 = (void *)[a1 _addCertificate:a3 persistent:&result];
    if (!v24)
    {
      CFStringRef v24 = (void *)[a1 _addPersistentMapping:result forAddress:v7];
      if (v24) {
        [a1 _removeCertificateForPersistent:result];
      }
    }
  }
LABEL_24:
  CFRelease(v11);
  if (!v24) {
    return 0;
  }
  CFDictionaryRef v20 = MFLogGeneral();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
  id v22 = v24;
  if (v21)
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v24;
    _os_log_error_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_ERROR, "#SMIMEErrors Error saving encryption certificate for \"%@\": %@", buf, 0x16u);
    return v24;
  }
  return v22;
}

+ (id)newTrustManager
{
  id v2 = objc_alloc(MEMORY[0x1E4F58108]);
  return (id)[v2 initWithAccessGroup:@"com.apple.mobilemail.smime"];
}

+ (void)_copyAllIdentitiesWithError:(id *)a1 usingBlock:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(*a1, "ef_publicDescription");
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "#SMIMEErrors Error getting identities from syncable keychain: %@", (uint8_t *)&v4, 0xCu);
}

@end