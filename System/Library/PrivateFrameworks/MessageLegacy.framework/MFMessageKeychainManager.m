@interface MFMessageKeychainManager
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
+ (int)_actionForCertificate:(__SecCertificate *)a3 policy:(__SecPolicy *)a4 uncommentedAddress:(id)a5;
+ (int)actionForEncryptionCertificate:(__SecCertificate *)a3 address:(id)a4;
+ (int)actionForSigningIdentity:(__SecIdentity *)a3 address:(id)a4;
+ (void)initialize;
+ (void)removePasswordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(void *)a6;
+ (void)removePasswordForServiceName:(id)a3 accountName:(id)a4;
+ (void)setPassword:(id)a3 forHost:(id)a4 username:(id)a5 port:(int)a6 keychainProtocol:(void *)a7 keychainAccessibility:(void *)a8;
+ (void)setPassword:(id)a3 forServiceName:(id)a4 accountName:(id)a5 keychainAccessibility:(void *)a6;
@end

@implementation MFMessageKeychainManager

+ (void)initialize
{
  if (!_keychainLock) {
    _keychainLock = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"keychainLock" andDelegate:0];
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
    CFTypeRef cf = 0;
    OSStatus v12 = SecItemCopyMatching(Mutable, &cf);
    CFRelease(v10);
    CFRelease(Mutable);
    v13 = 0;
    if (v12) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = cf == 0;
    }
    if (!v14)
    {
      id v15 = [NSString alloc];
      v13 = (void *)[v15 initWithData:cf encoding:4];
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
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
  v11 = (void *)[a1 _passwordForHost:a3 username:a4 port:v7 keychainProtocol:a6];
  [(id)_keychainLock unlock];
  return v11;
}

+ (void)setPassword:(id)a3 forHost:(id)a4 username:(id)a5 port:(int)a6 keychainProtocol:(void *)a7 keychainAccessibility:(void *)a8
{
  unsigned int valuePtr = a6;
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
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
                CFTypeRef result = 0;
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
  [(id)_keychainLock unlock];
}

+ (void)removePasswordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(void *)a6
{
  int valuePtr = a5;
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
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
  [(id)_keychainLock unlock];
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
          _os_log_impl(&dword_1CFCFE000, v12, OS_LOG_TYPE_DEFAULT, "#Warning SecItemCopyMatching result: %d", buf, 8u);
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
          _os_log_impl(&dword_1CFCFE000, v12, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching succeeded with empty results", buf, 2u);
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
  objc_msgSend((id)_keychainLock, "mf_waitForLock", a3, a4, a5);
  BOOL v10 = (void *)[a1 _passwordForGenericAccount:a4 service:a3 error:a6];
  [(id)_keychainLock unlock];
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
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
  if ([a4 length] && objc_msgSend(a3, "length") && objc_msgSend(a5, "length"))
  {
    CFAllocatorRef v14 = (const void *)[a3 dataUsingEncoding:4];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], a5);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], (const void *)[NSNumber numberWithBool:v9]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v14);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], a6);
    CFTypeRef result = 0;
    OSStatus v16 = SecItemAdd(Mutable, &result);
    if (v16)
    {
      uint64_t v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v16;
        _os_log_impl(&dword_1CFCFE000, v17, OS_LOG_TYPE_DEFAULT, "#Warning SecItemAdd result: %ld", buf, 0xCu);
      }
    }
    CFRelease(Mutable);
  }
  else
  {
    OSStatus v16 = -25291;
  }
  [(id)_keychainLock unlock];
  if (a8 && v16) {
    *a8 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
  }
  return v16 == 0;
}

+ (void)setPassword:(id)a3 forServiceName:(id)a4 accountName:(id)a5 keychainAccessibility:(void *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
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
      CFTypeRef result = 0;
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
    _os_log_impl(&dword_1CFCFE000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
LABEL_15:
    CFRelease(Mutable);
  }
  [(id)_keychainLock unlock];
}

+ (void)removePasswordForServiceName:(id)a3 accountName:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
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
        _os_log_impl(&dword_1CFCFE000, v9, OS_LOG_TYPE_DEFAULT, "#Warning SecItemDelete result: %ld", (uint8_t *)&v10, 0xCu);
      }
    }
    CFRelease(Mutable);
  }
  [(id)_keychainLock unlock];
}

+ (__SecPolicy)copySMIMESigningPolicyForAddress:(id)a3
{
  v3 = objc_msgSend(a3, "mf_copyUncommentedAddress");
  SMIME = (__SecPolicy *)SecPolicyCreateSMIME();

  return SMIME;
}

+ (__SecPolicy)copySMIMEEncryptionPolicyForAddress:(id)a3
{
  v3 = objc_msgSend(a3, "mf_copyUncommentedAddress");
  SMIME = (__SecPolicy *)SecPolicyCreateSMIME();

  return SMIME;
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
  SecCertificateRef certificateRef = 0;
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
  v10[3] = &unk_1E6867AF8;
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
    _os_log_impl(&dword_1CFCFE000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors Found %lu (out of %lu) matching signing identities for \"%@\"", buf, 0x20u);
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
  v10[3] = &unk_1E6867AF8;
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
    _os_log_impl(&dword_1CFCFE000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors Found %lu (out of %lu) matching encryption identities for \"%@\"", buf, 0x20u);
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
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  CFArrayRef v6 = (void *)*MEMORY[0x1E4F3BB80];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v6;
  uint64_t v7 = (void *)*MEMORY[0x1E4F3B550];
  keys[2] = *(void **)MEMORY[0x1E4F3BC80];
  keys[3] = v7;
  uint64_t v8 = (void *)*MEMORY[0x1E4F3BB88];
  values[0] = *(void **)MEMORY[0x1E4F3B990];
  values[1] = v8;
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  values[3] = @"com.apple.identities";
  CFDictionaryRef v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFTypeRef result = 0;
  OSStatus v10 = SecItemCopyMatching(v9, &result);
  CFRelease(v9);
  if (v10 != -25300 && v10)
  {
    id v15 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    if (a3) {
      *a3 = v15;
    }
    if (result) {
      CFRelease(result);
    }
    uint64_t v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1CFCFE000, v16, OS_LOG_TYPE_INFO, "#SMIMEErrors SecItemCopyMatching returned %ld", buf, 0xCu);
    }
    return 0;
  }
  if (!result) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)result);
  CFTypeRef v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)result, i);
      if (!a4 || (*((unsigned int (**)(id, const void *))a4 + 2))(a4, ValueAtIndex)) {
        [v12 addObject:ValueAtIndex];
      }
    }
  }
  CFRelease(result);
  if (a3 && v12 && *a3) {
    *a3 = 0;
  }
  return v12;
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
  LOBYTE(a5) = [a1 _validateIdentity:a3 forAddress:a4 policy:v9 usage:4 error:a5];
  CFRelease(v9);
  return (char)a5;
}

+ (BOOL)_validateIdentity:(__SecIdentity *)a3 forAddress:(id)a4 policy:(__SecPolicy *)a5 usage:(unsigned int)a6 error:(id *)a7
{
  CFTypeRef v12 = (void *)[a1 newTrustManager];
  uint64_t v13 = objc_msgSend(a4, "mf_uncommentedAddress");
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
      goto LABEL_24;
    }
    if ([v12 actionForSMIMETrust:cf sender:v13]
      && (SecCertificateGetKeyUsage() & a6) != 0)
    {
      BOOL v16 = 1;
LABEL_23:
      CFRelease(cf);
LABEL_24:
      CFRelease(certificateRef);
      goto LABEL_25;
    }
    if (a7)
    {
      if (!*a7)
      {
        BOOL v16 = 0;
        *a7 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"MFMessageKeychainManagerCertificateDeniedDomain" code:0 userInfo:0];
        goto LABEL_23;
      }
    }
    else
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"MFMessageKeychainManagerCertificateDeniedDomain" code:0 userInfo:0];
    }
    BOOL v16 = 0;
    goto LABEL_23;
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
LABEL_25:

  return v16;
}

+ (__SecCertificate)copyEncryptionCertificateForAddress:(id)a3 error:(id *)a4
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  uint64_t v5 = objc_msgSend(a3, "mf_uncommentedAddress");
  CFArrayRef v6 = (void *)[[NSString alloc] initWithFormat:@"S/MIME Encryption for %@", v5];
  uint64_t v7 = *MEMORY[0x1E4F3B978];
  uint64_t v8 = (void *)*MEMORY[0x1E4F3B5C0];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v8;
  CFDictionaryRef v9 = (void *)*MEMORY[0x1E4F3B550];
  keys[2] = *(void **)MEMORY[0x1E4F3BC70];
  keys[3] = v9;
  values[0] = *(void **)MEMORY[0x1E4F3B988];
  values[1] = v6;
  OSStatus v10 = (void *)*MEMORY[0x1E4F1CFD0];
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  values[3] = @"com.apple.mobilemail.smime";
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);

  CFTypeRef result = 0;
  OSStatus v13 = SecItemCopyMatching(v12, &result);
  if (result)
  {
    uint64_t v14 = *MEMORY[0x1E4F3BD40];
    *(void *)v32 = v7;
    *(void *)&v32[8] = v14;
    *(void *)&v32[16] = *MEMORY[0x1E4F3BC80];
    v31[0] = *(void **)MEMORY[0x1E4F3B980];
    v31[1] = (void *)result;
    v31[2] = v10;
    CFDictionaryRef v15 = CFDictionaryCreate(v11, (const void **)v32, (const void **)v31, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFRelease(result);
    OSStatus v16 = SecItemCopyMatching(v15, &cf);
    CFRelease(v15);
    if (v16)
    {
      __int16 v17 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
      if (a4) {
        *a4 = v17;
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
    else if (cf)
    {
      goto LABEL_15;
    }
    SecItemDelete(v12);
LABEL_15:
    uint64_t v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      OSStatus v23 = "a";
      if (!cf) {
        OSStatus v23 = "no";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      uint64_t v30 = v5;
      uint64_t v21 = "#SMIMEErrors Found %s certificate for \"%@\".";
      CFTypeID v22 = buf;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  OSStatus v18 = v13;
  if (v13 != -25300)
  {
    if (v13)
    {
      __int16 v19 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v13 userInfo:0];
      if (a4) {
        *a4 = v19;
      }
    }
  }
  uint64_t v20 = MFLogGeneral();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v32 = 138412546;
    *(void *)&v32[4] = v5;
    *(_WORD *)&v32[12] = 2048;
    *(void *)&v32[14] = v18;
    uint64_t v21 = "#SMIMEErrors Found no certificates for \"%@\" (%ld)";
    CFTypeID v22 = v32;
LABEL_19:
    _os_log_impl(&dword_1CFCFE000, v20, OS_LOG_TYPE_INFO, v21, v22, 0x16u);
  }
LABEL_20:
  CFRelease(v12);
  CFStringRef v24 = (__SecCertificate *)cf;
  if (a4 && cf)
  {
    if (*a4) {
      *a4 = 0;
    }
  }
  return v24;
}

+ (id)_addCertificate:(__SecCertificate *)a3 persistent:(id *)a4
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)*MEMORY[0x1E4F3BD48];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v5;
  CFArrayRef v6 = (void *)*MEMORY[0x1E4F3B550];
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
  uint64_t v5 = (void *)*MEMORY[0x1E4F3BD40];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v5;
  keys[2] = *(void **)MEMORY[0x1E4F3BC80];
  values[0] = *(void **)MEMORY[0x1E4F3B980];
  values[1] = a3;
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFAllocatorRef v11 = 0;
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
  id v16 = a3;
  uint64_t v5 = objc_msgSend(a4, "mf_uncommentedAddress");
  CFDictionaryRef v6 = (void *)[[NSString alloc] initWithFormat:@"S/MIME Encryption for %@", v5];
  OSStatus v7 = (void *)*MEMORY[0x1E4F3B5C0];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3BD38];
  CFDictionaryRef v9 = (void *)*MEMORY[0x1E4F3B550];
  keys[2] = *(void **)MEMORY[0x1E4F3BD38];
  keys[3] = v9;
  values[0] = *(void **)MEMORY[0x1E4F3B988];
  values[1] = v6;
  values[2] = a3;
  values[3] = @"com.apple.mobilemail.smime";
  CFDictionaryRef v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);

  OSStatus v11 = SecItemAdd(v10, 0);
  if (v11 == -25299)
  {
    CFDictionaryRef v12 = (void *)[(__CFDictionary *)v10 mutableCopy];
    [v12 removeObjectForKey:v8];
    id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    CFDictionaryRef v14 = (const __CFDictionary *)[v13 initWithObjects:&v16 forKeys:MEMORY[0x1E4F3BD38] count:1];
    OSStatus v11 = SecItemUpdate((CFDictionaryRef)v12, v14);
  }
  CFRelease(v10);
  if (v11) {
    return (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
  }
  else {
    return 0;
  }
}

+ (id)_removeCertificateForPersistent:(id)a3
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  v4 = (void *)*MEMORY[0x1E4F3B978];
  uint64_t v5 = (void *)*MEMORY[0x1E4F3BC70];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v5;
  CFDictionaryRef v6 = (void *)*MEMORY[0x1E4F3B550];
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
    CFDictionaryRef v14 = (void *)MEMORY[0x1E4F28C58];
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
          OSStatus v18 = CFArrayGetValueAtIndex(theArray, v17++);
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
    __int16 v19 = (void *)*MEMORY[0x1E4F3BD40];
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
    CFDictionaryRef v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28760];
    uint64_t v16 = v21;
  }
  return (id)[v14 errorWithDomain:v15 code:v16 userInfo:0];
}

+ (id)saveEncryptionCertificate:(__SecCertificate *)a3 forAddress:(id)a4
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  OSStatus v23 = 0;
  uint64_t v6 = objc_msgSend(a4, "mf_uncommentedAddress");
  OSStatus v7 = (void *)[[NSString alloc] initWithFormat:@"S/MIME Encryption for %@", v6];
  CFAllocatorRef v8 = (void *)*MEMORY[0x1E4F3B5C0];
  keys[0] = *(void **)MEMORY[0x1E4F3B978];
  keys[1] = v8;
  CFDictionaryRef v9 = (void *)*MEMORY[0x1E4F3B550];
  keys[2] = *(void **)MEMORY[0x1E4F3BC70];
  keys[3] = v9;
  values[0] = *(void **)MEMORY[0x1E4F3B988];
  values[1] = v7;
  values[2] = *(void **)MEMORY[0x1E4F1CFD0];
  values[3] = @"com.apple.mobilemail.smime";
  CFDictionaryRef v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);

  CFTypeRef result = 0;
  OSStatus v11 = SecItemCopyMatching(v10, &result);
  if (v11 != -25300 && v11)
  {
    OSStatus v23 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
    goto LABEL_22;
  }
  if (a3)
  {
    if (!result)
    {
      uint64_t v17 = 0;
      BOOL v16 = 1;
      goto LABEL_16;
    }
    uint64_t v12 = [a1 _copyCertificateForPersistent:result error:&v23];
    if (!v12) {
      goto LABEL_22;
    }
    id v13 = (const void *)v12;
    SHA1Digest = (const void *)SecCertificateGetSHA1Digest();
    uint64_t v15 = (const void *)SecCertificateGetSHA1Digest();
    BOOL v16 = CFEqual(SHA1Digest, v15) == 0;
    CFRelease(v13);
    uint64_t v17 = (uint64_t)v23;
    if (!v16)
    {
LABEL_16:
      if (!v16) {
        goto LABEL_22;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v17 = 0;
    BOOL v16 = 0;
  }
  if (v17) {
    goto LABEL_16;
  }
  OSStatus v18 = SecItemDelete(v10);
  if (v18 && v18 != -25300)
  {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v18 userInfo:0];
    OSStatus v23 = (void *)v17;
    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
    [a1 _removeCertificateForPersistent:result];
    uint64_t v17 = (uint64_t)v23;
    if (!v16) {
      goto LABEL_22;
    }
  }
LABEL_17:
  if (!v17)
  {
    OSStatus v23 = (void *)[a1 _addCertificate:a3 persistent:&result];
    if (!v23)
    {
      OSStatus v23 = (void *)[a1 _addPersistentMapping:result forAddress:v6];
      if (v23) {
        [a1 _removeCertificateForPersistent:result];
      }
    }
  }
LABEL_22:
  CFRelease(v10);
  if (!v23) {
    return 0;
  }
  __int16 v19 = MFLogGeneral();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  id v21 = v23;
  if (v20)
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v6;
    __int16 v26 = 2112;
    uint64_t v27 = v23;
    _os_log_error_impl(&dword_1CFCFE000, v19, OS_LOG_TYPE_ERROR, "#SMIMEErrors Error saving encryption certificate for \"%@\": %@", buf, 0x16u);
    return v23;
  }
  return v21;
}

+ (int)_actionForCertificate:(__SecCertificate *)a3 policy:(__SecPolicy *)a4 uncommentedAddress:(id)a5
{
  SecTrustRef trust = 0;
  SecTrustCreateWithCertificates(a3, a4, &trust);
  if (!trust) {
    return 0;
  }
  OSStatus v7 = (void *)[a1 newTrustManager];
  int v8 = [v7 actionForSMIMETrust:trust sender:a5];

  CFRelease(trust);
  return v8;
}

+ (int)actionForSigningIdentity:(__SecIdentity *)a3 address:(id)a4
{
  SecCertificateRef certificateRef = 0;
  SecIdentityCopyCertificate(a3, &certificateRef);
  if (!certificateRef) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(a4, "mf_uncommentedAddress");
  OSStatus v7 = (const void *)[a1 copySMIMESigningPolicyForAddress:v6];
  int v8 = [a1 _actionForCertificate:certificateRef policy:v7 uncommentedAddress:v6];
  CFRelease(v7);
  CFRelease(certificateRef);
  return v8;
}

+ (int)actionForEncryptionCertificate:(__SecCertificate *)a3 address:(id)a4
{
  uint64_t v6 = objc_msgSend(a4, "mf_uncommentedAddress");
  OSStatus v7 = (const void *)[a1 copySMIMEEncryptionPolicyForAddress:v6];
  LODWORD(a3) = [a1 _actionForCertificate:a3 policy:v7 uncommentedAddress:v6];
  CFRelease(v7);
  return (int)a3;
}

+ (id)newTrustManager
{
  id v2 = objc_alloc(MEMORY[0x1E4F58108]);
  return (id)[v2 initWithAccessGroup:@"com.apple.mobilemail.smime"];
}

@end