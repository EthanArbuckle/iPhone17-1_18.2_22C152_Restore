@interface DICryptoHelper
+ (BOOL)createPublicKeyHeaderWithBackendXPC:(id)a3 publicKeyHeader:(void *)a4 error:(id *)a5;
+ (BOOL)getPassphraseUsingSaksWithBackendXPC:(id)a3 passPhrase:(char *)a4 error:(id *)a5;
+ (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5;
+ (BOOL)getPublicKeyWithCertificate:(id)a3 key:(__SecKey *)a4 error:(id *)a5;
+ (BOOL)validateWithPubKeyHeader:(void *)a3;
+ (id)getAuthValueWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6;
+ (unique_ptr<crypto::auth_table_entry,)getAuthEntryWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6;
@end

@implementation DICryptoHelper

+ (id)getAuthValueWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6
{
  uint64_t v6 = *(void *)&a5;
  ptr = (uint64_t *)a3.__ptr_;
  v8 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v17 = *(void *)a3.__ptr_;
  v18 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  +[DICryptoHelper getAuthEntryWithBackend:authTableNumEntries:mechanism:error:](DICryptoHelper, "getAuthEntryWithBackend:authTableNumEntries:mechanism:error:", &v17, a3.__cntrl_, *(void *)&a4, *(void *)&a5, a6);
  if (v18) {
    sub_100010A48(v18);
  }
  if (v19)
  {
    v9 = malloc_type_valloc(*(void *)(v19 + 12), 0xF8ED6DDuLL);
    if (!v9)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v16 = std::bad_alloc::bad_alloc(exception);
    }
    v22[0] = off_100195D50;
    v22[3] = v22;
    v20 = v9;
    sub_100017FFC((uint64_t)v21, (uint64_t)v22);
    sub_100017750(v22);
    uint64_t v10 = sub_1000380B0(*ptr, (uint64_t)v20, *(void *)(v19 + 12), *(void *)(v19 + 4));
    if ((v10 & 0x80000000) != 0)
    {
      id v12 = +[DIError nilWithPOSIXCode:v10 description:@"can't read crypto header" error:v6];
      v11 = 0;
    }
    else
    {
      v11 = +[NSData dataWithBytes:v20 length:*(void *)(v19 + 12)];
    }
    sub_1000176CC((uint64_t *)&v20, 0);
    sub_100017750(v21);
    uint64_t v13 = v19;
    uint64_t v19 = 0;
    if (v13) {
      operator delete();
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (unique_ptr<crypto::auth_table_entry,)getAuthEntryWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6
{
}

+ (BOOL)getPassphraseUsingSaksWithBackendXPC:(id)a3 passPhrase:(char *)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    [v7 getCryptoHeaderBackend];
    uint64_t v10 = v20;
    v9 = v21;
  }
  else
  {
    v9 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(unsigned int *)(*(void *)[v8 cryptoHeader] + 72);
  uint64_t v18 = v10;
  uint64_t v19 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v17 = 0;
  id v12 = +[DICryptoHelper getAuthValueWithBackend:&v18 authTableNumEntries:v11 mechanism:9 error:&v17];
  id v13 = v17;
  if (v19) {
    sub_100010A48(v19);
  }
  if (v12)
  {
    id v14 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
    BOOL v15 = +[DIKeyRetriever decryptKeyWithData:v14 destKey:a4 destKeySize:88 error:a5];
  }
  else if (v13)
  {
    BOOL v15 = 0;
    if (a5) {
      *a5 = v13;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  if (v9) {
    sub_100010A48(v9);
  }

  return v15;
}

+ (BOOL)validateWithPubKeyHeader:(void *)a3
{
  return *(_DWORD *)a3 <= 0x20u && *((_DWORD *)a3 + 12) < 0x201u;
}

+ (BOOL)createPublicKeyHeaderWithBackendXPC:(id)a3 publicKeyHeader:(void *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = *(unsigned int *)(*(void *)[v7 cryptoHeader] + 72);
  if (v7)
  {
    [v7 getCryptoHeaderBackend];
    uint64_t v10 = (uint64_t)v22;
    v9 = v23;
    uint64_t v19 = v22;
    uint64_t v20 = v23;
    if (v23)
    {
      char v11 = 0;
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
    v9 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  char v11 = 1;
LABEL_6:
  +[DICryptoHelper getAuthEntryWithBackend:&v19 authTableNumEntries:v8 mechanism:2 error:a5];
  if (v20) {
    sub_100010A48(v20);
  }
  if (v21)
  {
    id v12 = malloc_type_valloc(*(void *)(v21 + 12), 0xF8ED6DDuLL);
    if (!v12)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      uint64_t v18 = std::bad_alloc::bad_alloc(exception);
    }
    v22 = off_100195D50;
    v24 = &v22;
    uint64_t v25 = (uint64_t)v12;
    sub_100017FFC((uint64_t)v26, (uint64_t)&v22);
    sub_100017750(&v22);
    uint64_t v13 = sub_1000380B0(v10, v25, 564, *(void *)(v21 + 4));
    if (v13 == 564)
    {
      sub_100136568(&v22, v25, v13);
      sub_100038870((uint64_t)a4, (uint64_t)&v22);
      BOOL v14 = 1;
    }
    else
    {
      BOOL v14 = +[DIError failWithPOSIXCode:v13, @"Error while creating public key header", a5, v19 description error];
    }
    sub_1000176CC(&v25, 0);
    sub_100017750(v26);
    uint64_t v15 = v21;
    uint64_t v21 = 0;
    if (v15) {
      operator delete();
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  if ((v11 & 1) == 0) {
    sub_100010A48(v9);
  }

  return v14;
}

+ (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  id v7 = +[NSData dataWithBytes:(char *)a3 + 4 length:*(unsigned int *)a3];
  v12[0] = kSecClass;
  v12[1] = kSecAttrKeyClass;
  v13[0] = kSecClassKey;
  v13[1] = kSecAttrKeyClassPrivate;
  v12[2] = kSecAttrApplicationLabel;
  v12[3] = kSecReturnRef;
  v13[2] = v7;
  v13[3] = &__kCFBooleanTrue;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  CFDictionaryRef v9 = +[NSMutableDictionary dictionaryWithDictionary:v8];

  if (SecItemCopyMatching(v9, (CFTypeRef *)a4)) {
    BOOL v10 = +[DIError failWithPOSIXCode:22 description:@"Couldn't find item in keychain" error:a5];
  }
  else {
    BOOL v10 = 1;
  }

  return v10;
}

+ (BOOL)getPublicKeyWithCertificate:(id)a3 key:(__SecKey *)a4 error:(id *)a5
{
  CFDataRef v7 = (const __CFData *)a3;
  LOBYTE(v8) = 1;
  if (v7 && a4)
  {
    CFDictionaryRef v9 = SecCertificateCreateWithData(kCFAllocatorDefault, v7);
    BOOL v10 = v9;
    if (v9)
    {
      *a4 = SecCertificateCopyKey(v9);
      CFRelease(v10);
      if (*a4)
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        id v11 = +[DIError nilWithPOSIXCode:22 description:@"public key has an encoding issue or uses an unsupported algorithm" error:a5];
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      BOOL v8 = +[DIError failWithPOSIXCode:22 description:@"not a valid DER-encoded X.509 certificate" error:a5];
    }
  }

  return v8;
}

@end