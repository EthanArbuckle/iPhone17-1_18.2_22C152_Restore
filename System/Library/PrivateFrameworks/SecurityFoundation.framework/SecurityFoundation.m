_SFSHA256DigestOperation *_defaultDigestOperation()
{
  _SFSHA256DigestOperation *v0;
  uint64_t vars8;

  v0 = objc_alloc_init(_SFSHA256DigestOperation);
  return v0;
}

SFMaskGenerationFunction1 *_defaultMaskGenerationFunction()
{
  v0 = objc_alloc_init(SFMaskGenerationFunction1);
  return v0;
}

SFHMACPseudoRandomFunction *_defaultPseudoRandomFunction()
{
  v0 = objc_alloc_init(SFHMACPseudoRandomFunction);
  return v0;
}

uint64_t SFAccessibilityMakeWithMode@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  a2[1] = 0;
  a2[2] = 0;
  *a2 = result;
  return result;
}

_SFECKeySpecifier *ECKeySpecifierForSecKey(__SecKey *a1)
{
  CFDictionaryRef v1 = SecKeyCopyAttributes(a1);
  v2 = [(__CFDictionary *)v1 objectForKeyedSubscript:*MEMORY[0x1E4F3B708]];
  uint64_t v3 = [v2 integerValue];
  if (v3 > 383)
  {
    if (v3 == 384)
    {
      uint64_t v4 = 4;
    }
    else
    {
      if (v3 != 521) {
        goto LABEL_13;
      }
      uint64_t v4 = 6;
    }
  }
  else
  {
    if (v3 != 224)
    {
      if (v3 == 256)
      {
        uint64_t v4 = 2;
        goto LABEL_10;
      }
LABEL_13:
      v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3B8];
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"unanticipated bitsize for EC key: %d", v3);
      id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

      objc_exception_throw(v10);
    }
    uint64_t v4 = 0;
  }
LABEL_10:
  v5 = [[_SFECKeySpecifier alloc] initWithCurve:v4];

  return v5;
}

uint64_t ECKeyBitSize(uint64_t a1)
{
  uint64_t result = 224;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
    case 3:
    case 5:
    case 7:
      id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"compressed elliptic curves are not presently supported" userInfo:0];
      objc_exception_throw(v4);
    case 2:
      uint64_t result = 256;
      break;
    case 4:
      uint64_t result = 384;
      break;
    case 6:
      uint64_t result = 521;
      break;
    default:
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3B8];
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"unknown SFEllipticCurve value: %d", a1);
      id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

      objc_exception_throw(v8);
  }
  return result;
}

uint64_t CCCurveParameters(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      JUMPOUT(0x1C188EE60);
    case 1:
    case 3:
    case 5:
    case 7:
      id v1 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"compressed elliptic curves are not presently supported" userInfo:0];
      objc_exception_throw(v1);
    case 2:
      JUMPOUT(0x1C188EE70);
    case 4:
      JUMPOUT(0x1C188EE80);
    case 6:
      return MEMORY[0x1F40CAA50]();
    default:
      v2 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v3 = *MEMORY[0x1E4F1C3B8];
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"unknown SFEllipticCurve value: %d", a1);
      id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

      objc_exception_throw(v5);
  }
}

void sub_1BE239DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1BE23AD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BE23EBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1BE23F184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CCCryptorGCM()
{
  return MEMORY[0x1F40C94D0]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9758](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9760](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9768](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C9798](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97A0](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97A8](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97C0](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1F40F6E38](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E40](key, error);
}

CFDataRef SecKeyCopyKeyExchangeResult(SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E50](privateKey, algorithm, publicKey, parameters, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1F40F6E70](key);
}

uint64_t SecKeyCopySubjectPublicKeyInfo()
{
  return MEMORY[0x1F40F6E80]();
}

uint64_t SecKeyCreateFromSubjectPublicKeyInfoData()
{
  return MEMORY[0x1F40F6EC8]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6EE0](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EF8](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F08](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

uint64_t SecPasswordCreateWithRandomDigits()
{
  return MEMORY[0x1F40F6FA0]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1F40CA6E8]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1F40CA6F0]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x1F40CAA38]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1F40CAA40]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1F40CAA48]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1F40CAB98]();
}

uint64_t ccec_x963_import_priv_size()
{
  return MEMORY[0x1F40CABA0]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1F40CABA8]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1F40CABB0]();
}

uint64_t ccecies_decrypt_gcm_composite()
{
  return MEMORY[0x1F40CABE0]();
}

uint64_t ccecies_decrypt_gcm_plaintext_size()
{
  return MEMORY[0x1F40CABE8]();
}

uint64_t ccecies_decrypt_gcm_setup()
{
  return MEMORY[0x1F40CABF0]();
}

uint64_t ccecies_encrypt_gcm_ciphertext_size()
{
  return MEMORY[0x1F40CAC00]();
}

uint64_t ccecies_encrypt_gcm_composite()
{
  return MEMORY[0x1F40CAC08]();
}

uint64_t ccecies_encrypt_gcm_setup()
{
  return MEMORY[0x1F40CAC10]();
}

uint64_t ccecies_pub_key_size()
{
  return MEMORY[0x1F40CAC18]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB030]();
}

uint64_t ccscrypt()
{
  return MEMORY[0x1F40CB128]();
}

uint64_t ccscrypt_storage_size()
{
  return MEMORY[0x1F40CB130]();
}

uint64_t ccspake_cp_256()
{
  return MEMORY[0x1F40CB1A0]();
}

uint64_t ccspake_generate_L()
{
  return MEMORY[0x1F40CB1B0]();
}

uint64_t ccspake_kex_generate()
{
  return MEMORY[0x1F40CB1B8]();
}

uint64_t ccspake_kex_process()
{
  return MEMORY[0x1F40CB1C0]();
}

uint64_t ccspake_mac_compute()
{
  return MEMORY[0x1F40CB1C8]();
}

uint64_t ccspake_mac_hkdf_hmac_sha256()
{
  return MEMORY[0x1F40CB1D8]();
}

uint64_t ccspake_mac_verify_and_get_session_key()
{
  return MEMORY[0x1F40CB1E0]();
}

uint64_t ccspake_prover_init()
{
  return MEMORY[0x1F40CB1E8]();
}

uint64_t ccspake_sizeof_ctx()
{
  return MEMORY[0x1F40CB200]();
}

uint64_t ccspake_sizeof_point()
{
  return MEMORY[0x1F40CB208]();
}

uint64_t ccspake_sizeof_w()
{
  return MEMORY[0x1F40CB210]();
}

uint64_t ccspake_verifier_init()
{
  return MEMORY[0x1F40CB218]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x1F40CBBB0]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1F40CE598](__b1, __b2, __len);
}