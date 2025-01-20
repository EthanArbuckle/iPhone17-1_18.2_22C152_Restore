uint64_t mySSLPrivKeyRSA_sign(SecKeyRef key, int a2, UInt8 *bytes, size_t length, uint8_t *sig, size_t *sigLen)
{
  uint64_t v6;
  const __CFString **v10;
  CFStringRef v12;
  CFDataRef v13;
  CFDataRef v14;
  CFDataRef Signature;
  CFDataRef v16;
  size_t v17;
  const UInt8 *BytePtr;
  uint64_t vars8;

  v6 = 4294957486;
  v10 = (const __CFString **)MEMORY[0x263F17360];
  switch(a2)
  {
    case 0:
      return SecKeyRawSign(key, 1u, bytes, length, sig, sigLen);
    case 2:
      goto LABEL_8;
    case 4:
      v10 = (const __CFString **)MEMORY[0x263F17370];
      goto LABEL_8;
    case 5:
      v10 = (const __CFString **)MEMORY[0x263F17378];
      goto LABEL_8;
    case 6:
      v10 = (const __CFString **)MEMORY[0x263F17380];
LABEL_8:
      v12 = *v10;
      v13 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
      if (!v13) {
        return 4294957486;
      }
      v14 = v13;
      Signature = SecKeyCreateSignature(key, v12, v13, 0);
      if (Signature)
      {
        v16 = Signature;
        v17 = CFDataGetLength(Signature);
        BytePtr = CFDataGetBytePtr(v16);
        if (BytePtr && v17 >= *sigLen)
        {
          memcpy(sig, BytePtr, v17);
          v6 = 0;
          *sigLen = v17;
        }
        else
        {
          v6 = 4294957486;
        }
        CFRelease(v14);
        CFRelease(v16);
      }
      else
      {
        CFRelease(v14);
        return 4294957486;
      }
      return v6;
    default:
      return v6;
  }
}

uint64_t tls_helper_set_identity_from_array(int a1, CFArrayRef theArray)
{
  SecKeyRef privateKeyRef = 0;
  SecCertificateRef certificateRef = 0;
  if (!theArray)
  {
    v5 = 0;
    uint64_t v10 = 4294957488;
LABEL_27:
    free(v5);
    if (privateKeyRef) {
      CFRelease(privateKeyRef);
    }
    return v10;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (!Count)
  {
    v5 = 0;
    uint64_t v10 = 4294957488;
    goto LABEL_24;
  }
  uint64_t v4 = Count;
  v5 = (size_t *)sslMalloc(24 * Count);
  if (!v5)
  {
    uint64_t v10 = 4294967188;
    goto LABEL_24;
  }
  ValueAtIndex = (__SecIdentity *)CFArrayGetValueAtIndex(theArray, 0);
  if (!ValueAtIndex) {
    goto LABEL_23;
  }
  v7 = ValueAtIndex;
  CFTypeID v8 = CFGetTypeID(ValueAtIndex);
  if (v8 != SecIdentityGetTypeID()) {
    goto LABEL_23;
  }
  uint64_t v9 = SecIdentityCopyCertificate(v7, &certificateRef);
  if (v9 || (uint64_t v9 = SecIdentityCopyPrivateKey(v7, &privateKeyRef), v9))
  {
    uint64_t v10 = v9;
    goto LABEL_24;
  }
  BytePtr = (const void *)SecCertificateGetBytePtr();
  size_t Length = SecCertificateGetLength();
  SSLCopyBufferFromData(BytePtr, Length, v5 + 1);
  size_t *v5 = 0;
  if (v4 >= 2)
  {
    v13 = v5 + 3;
    for (CFIndex i = 1; i != v4; ++i)
    {
      v15 = CFArrayGetValueAtIndex(theArray, i);
      if (!v15) {
        goto LABEL_23;
      }
      CFTypeID v16 = CFGetTypeID(v15);
      if (v16 != SecCertificateGetTypeID()) {
        goto LABEL_23;
      }
      v17 = (const void *)SecCertificateGetBytePtr();
      size_t v18 = SecCertificateGetLength();
      SSLCopyBufferFromData(v17, v18, v13 + 1);
      void *v13 = 0;
      *(v13 - 3) = v13;
      v13 += 3;
    }
  }
  SecKeyGetBlockSize(privateKeyRef);
  if (SecKeyGetAlgorithmId() != 1)
  {
    if (SecKeyGetAlgorithmId() != 3)
    {
LABEL_23:
      uint64_t v10 = 4294967246;
      goto LABEL_24;
    }
    SecECKeyGetNamedCurve();
  }
  if (tls_private_key_create()) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 4294967188;
  }
LABEL_24:
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  if (v10) {
    goto LABEL_27;
  }
  context = (const void *)tls_private_key_get_context();
  CFRetain(context);
  uint64_t v10 = tls_handshake_set_identity();
  tls_private_key_destroy();
  if (v5)
  {
    v20 = v5;
    do
    {
      SSLFreeBuffer(v20 + 1);
      v20 = (size_t *)*v20;
    }
    while (v20);
  }
  sslFree(v5);
  return v10;
}

void *sslMalloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xC274D582uLL);
}

void sslFree(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t SSLFreeBuffer(void *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  v2 = (void *)a1[1];
  if (v2) {
    free(v2);
  }
  uint64_t result = 0;
  *a1 = 0;
  a1[1] = 0;
  return result;
}

uint64_t SSLCopyBufferFromData(const void *a1, size_t a2, size_t *a3)
{
  v5 = sslAllocCopy(a1, a2);
  a3[1] = (size_t)v5;
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a3 = a2;
  return result;
}

void *sslAllocCopy(const void *a1, size_t size)
{
  uint64_t v4 = malloc_type_malloc(size, 0xC274D582uLL);
  v5 = v4;
  if (v4) {
    memmove(v4, a1, size);
  }
  return v5;
}

uint64_t tls_helper_set_peer_pubkey()
{
  SecTrustRef trust = 0;
  peer_certificates = (uint64_t **)tls_handshake_get_peer_certificates();
  cfarray_from_certificates = tls_helper_create_cfarray_from_certificates(peer_certificates);
  if (!cfarray_from_certificates) {
    return 0;
  }
  v2 = cfarray_from_certificates;
  uint64_t v3 = SecTrustCreateWithCertificates(cfarray_from_certificates, 0, &trust);
  if (v3)
  {
    uint64_t v10 = v3;
    goto LABEL_16;
  }
  uint64_t v4 = MEMORY[0x23ECA66F0](trust);
  if (!v4)
  {
    uint64_t v10 = 4294957488;
    goto LABEL_16;
  }
  v5 = (const void *)v4;
  uint64_t AlgorithmId = SecKeyGetAlgorithmId();
  if (AlgorithmId == 3)
  {
    SecECKeyGetNamedCurve();
    CFDataRef v11 = (const __CFData *)SecECKeyCopyPublicBits();
    if (v11)
    {
      CFDataRef v9 = v11;
      CFDataGetBytePtr(v11);
      CFDataGetLength(v9);
      uint64_t v10 = tls_handshake_set_peer_ec_public_key();
      CFRelease(v5);
LABEL_15:
      CFRelease(v9);
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v10 = 4294957487;
    CFDataRef v9 = (const __CFData *)v5;
    goto LABEL_15;
  }
  if (AlgorithmId != 1) {
    goto LABEL_14;
  }
  uint64_t v7 = SecKeyCopyModulus();
  if (!v7) {
    goto LABEL_14;
  }
  CFDataRef v8 = (const __CFData *)v7;
  CFDataRef v9 = (const __CFData *)SecKeyCopyExponent();
  if (v9)
  {
    CFDataGetBytePtr(v8);
    CFDataGetLength(v8);
    CFDataGetBytePtr(v9);
    CFDataGetLength(v9);
    uint64_t v10 = tls_handshake_set_peer_rsa_public_key();
  }
  else
  {
    uint64_t v10 = 4294957487;
  }
  CFRelease(v5);
  CFRelease(v8);
  if (v9) {
    goto LABEL_15;
  }
LABEL_16:
  if (trust) {
    CFRelease(trust);
  }
  CFRelease(v2);
  return v10;
}

uint64_t tls_helper_create_peer_trust(uint64_t a1, char a2, SecTrustRef *a3)
{
  SecTrustRef trust = 0;
  peer_certificates = (uint64_t **)tls_handshake_get_peer_certificates();
  cfarray_from_certificates = tls_helper_create_cfarray_from_certificates(peer_certificates);
  if (cfarray_from_certificates)
  {
    uint64_t v7 = cfarray_from_certificates;
    if ((a2 & 1) == 0) {
      tls_handshake_get_peer_hostname();
    }
    SecPolicyRef SSL = SecPolicyCreateSSL(a2 ^ 1u, 0);
    if (SSL)
    {
      uint64_t v11 = SecTrustCreateWithCertificates(v7, SSL, &trust);
      if (v11)
      {
        uint64_t v9 = v11;
      }
      else
      {
        if (a2) {
          goto LABEL_9;
        }
        uint64_t peer_sct_list = tls_handshake_get_peer_sct_list();
        uint64_t peer_ocsp_response = tls_handshake_get_peer_ocsp_response();
        if (!peer_ocsp_response) {
          goto LABEL_17;
        }
        CFDataRef v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], *(const UInt8 **)(peer_ocsp_response + 8), *(void *)peer_ocsp_response);
        uint64_t v9 = SecTrustSetOCSPResponse(trust, v14);
        if (v14) {
          CFRelease(v14);
        }
        if (!v9)
        {
LABEL_17:
          if (!peer_sct_list) {
            goto LABEL_9;
          }
          v15 = (uint64_t **)tls_handshake_get_peer_sct_list();
          cfarray_from_buffer_list = tls_helper_create_cfarray_from_buffer_list(v15);
          uint64_t v9 = SecTrustSetSignedCertificateTimestamps(trust, cfarray_from_buffer_list);
          if (cfarray_from_buffer_list) {
            CFRelease(cfarray_from_buffer_list);
          }
          if (!v9) {
LABEL_9:
          }
            uint64_t v9 = 0;
        }
      }
    }
    else
    {
      uint64_t v9 = 4294967188;
    }
    if (SSL) {
      CFRelease(SSL);
    }
    CFRelease(v7);
    SecTrustRef v8 = trust;
  }
  else
  {
    SecTrustRef v8 = 0;
    uint64_t v9 = 0;
  }
  *a3 = v8;
  return v9;
}

__CFArray *tls_helper_create_cfarray_from_certificates(uint64_t **a1)
{
  if (!a1) {
    return 0;
  }
  v1 = a1;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
    while (1)
    {
      CFDataRef v5 = CFDataCreateWithBytesNoCopy(v2, (const UInt8 *)v1[2], (CFIndex)v1[1], v4);
      if (!v5)
      {
        v6 = Mutable;
        goto LABEL_10;
      }
      v6 = v5;
      SecCertificateRef v7 = SecCertificateCreateWithData(v2, v5);
      if (!v7) {
        break;
      }
      SecCertificateRef v8 = v7;
      CFArrayAppendValue(Mutable, v7);
      CFRelease(v8);
      CFRelease(v6);
      v1 = (uint64_t **)*v1;
      if (!v1) {
        return Mutable;
      }
    }
    CFRelease(Mutable);
LABEL_10:
    CFRelease(v6);
    return 0;
  }
  return Mutable;
}

void *sslRealloc(void *a1, int a2, size_t size)
{
  return malloc_type_realloc(a1, size, 0x5F1AF22BuLL);
}

uint64_t SSLAllocBuffer(size_t *a1, size_t size)
{
  CFAllocatorRef v4 = malloc_type_malloc(size, 0xC274D582uLL);
  if (v4) {
    size_t v5 = size;
  }
  else {
    size_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  *a1 = v5;
  a1[1] = (size_t)v4;
  return v6;
}

uint64_t SSLReallocBuffer(uint64_t a1, size_t a2)
{
  CFAllocatorRef v4 = malloc_type_realloc(*(void **)(a1 + 8), a2, 0x5F1AF22BuLL);
  if (v4) {
    size_t v5 = a2;
  }
  else {
    size_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v4;
  return v6;
}

uint64_t SSLAllocCopyBuffer(size_t *a1, size_t **a2)
{
  CFAllocatorRef v4 = (size_t *)malloc_type_malloc(0x10uLL, 0xC274D582uLL);
  if (v4)
  {
    size_t v5 = v4;
    SecCertificateRef v7 = a1;
    size_t v6 = *a1;
    SecCertificateRef v8 = sslAllocCopy((const void *)v7[1], v6);
    v5[1] = (size_t)v8;
    if (v8)
    {
      uint64_t result = 0;
      size_t *v5 = v6;
      *a2 = v5;
      return result;
    }
    free(v5);
  }
  return 0xFFFFFFFFLL;
}

uint64_t SSLCopyBuffer(uint64_t a1, size_t *a2)
{
  size_t v3 = *(void *)a1;
  CFAllocatorRef v4 = sslAllocCopy(*(const void **)(a1 + 8), *(void *)a1);
  a2[1] = (size_t)v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 = v3;
  return result;
}

uint64_t SSLCopyBufferTerm(const void *a1, size_t a2, uint64_t a3)
{
  size_t v6 = malloc_type_malloc(a2 + 1, 0xC274D582uLL);
  if (v6) {
    size_t v7 = a2 + 1;
  }
  else {
    size_t v7 = 0;
  }
  *(void *)a3 = v7;
  *(void *)(a3 + 8) = v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  memmove(v6, a1, a2);
  *(unsigned char *)(*(void *)(a3 + 8) + a2) = 0;
  size_t v8 = strlen(*(const char **)(a3 + 8));
  uint64_t result = 0;
  *(void *)a3 = v8;
  return result;
}

uint64_t tls_free_buffer_list(void *a1)
{
  if (a1)
  {
    v1 = a1;
    do
    {
      CFAllocatorRef v2 = (void *)*v1;
      size_t v3 = (void *)v1[2];
      if (v3) {
        free(v3);
      }
      free(v1);
      v1 = v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t tls_copy_buffer_list(uint64_t **a1, void *a2)
{
  if (a1)
  {
    size_t v3 = a1;
    CFAllocatorRef v4 = 0;
    size_t v5 = 0;
    while (1)
    {
      size_t v6 = malloc_type_malloc(0x18uLL, 0xC274D582uLL);
      if (!v6) {
        break;
      }
      size_t v7 = v6;
      void *v6 = 0;
      size_t v8 = (size_t)v3[1];
      uint64_t v9 = sslAllocCopy(v3[2], v8);
      v7[2] = v9;
      if (!v9)
      {
        free(v7);
        break;
      }
      v7[1] = v8;
      uint64_t v10 = v7;
      if (v5)
      {
        *CFAllocatorRef v4 = v7;
        uint64_t v10 = v5;
      }
      size_t v3 = (uint64_t **)*v3;
      CFAllocatorRef v4 = v7;
      size_t v5 = v10;
      if (!v3) {
        goto LABEL_10;
      }
    }
    tls_free_buffer_list(v5);
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v10 = 0;
LABEL_10:
    uint64_t result = 0;
    *a2 = v10;
  }
  return result;
}

uint64_t mySSLPrivKeyRSA_decrypt(__SecKey *a1, uint8_t *cipherText, size_t cipherTextLen, uint8_t *plainText, size_t *plainTextLen)
{
  return SecKeyDecrypt(a1, 1u, cipherText, cipherTextLen, plainText, plainTextLen);
}

uint64_t mySSLPrivKeyECDSA_sign(__SecKey *a1, uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return SecKeyRawSign(a1, 1u, dataToSign, dataToSignLen, sig, sigLen);
}

__CFArray *tls_helper_create_cfarray_from_buffer_list(uint64_t **a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (Mutable && a1)
  {
    while (1)
    {
      CFDataRef v4 = CFDataCreate(v2, (const UInt8 *)a1[2], (CFIndex)a1[1]);
      if (!v4) {
        break;
      }
      CFDataRef v5 = v4;
      CFArrayAppendValue(Mutable, v4);
      CFRelease(v5);
      a1 = (uint64_t **)*a1;
      if (!a1) {
        return Mutable;
      }
    }
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t tls_helper_version_from_SSLProtocol(int a1)
{
  int v1 = a1 - 2;
  uint64_t result = 768;
  switch(v1)
  {
    case 0:
      return result;
    case 2:
      uint64_t result = 769;
      break;
    case 5:
      uint64_t result = 770;
      break;
    case 6:
      uint64_t result = 771;
      break;
    case 7:
      uint64_t result = 65279;
      break;
    case 8:
      uint64_t result = 772;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t tls_helper_SSLProtocol_from_version(int a1)
{
  int v1 = a1 - 768;
  uint64_t result = 2;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 4;
      break;
    case 2:
      uint64_t result = 7;
      break;
    case 3:
      uint64_t result = 8;
      break;
    case 4:
      uint64_t result = 10;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

__CFArray *tls_helper_create_peer_acceptable_dn_array()
{
  peer_acceptable_dn_list = (uint64_t **)tls_handshake_get_peer_acceptable_dn_list();

  return tls_helper_create_cfarray_from_buffer_list(peer_acceptable_dn_list);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecCertificateGetBytePtr()
{
  return MEMORY[0x270EFD7F8]();
}

uint64_t SecCertificateGetLength()
{
  return MEMORY[0x270EFD808]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x270EFD828]();
}

uint64_t SecECKeyCopyPublicBits()
{
  return MEMORY[0x270EFD930]();
}

uint64_t SecECKeyGetNamedCurve()
{
  return MEMORY[0x270EFD938]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x270EFD950](identityRef, privateKeyRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x270EFD960]();
}

uint64_t SecKeyCopyExponent()
{
  return MEMORY[0x270EFD9A0]();
}

uint64_t SecKeyCopyModulus()
{
  return MEMORY[0x270EFD9C0]();
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

OSStatus SecKeyDecrypt(SecKeyRef key, SecPadding padding, const uint8_t *cipherText, size_t cipherTextLen, uint8_t *plainText, size_t *plainTextLen)
{
  return MEMORY[0x270EFDA68](key, *(void *)&padding, cipherText, cipherTextLen, plainText, plainTextLen);
}

uint64_t SecKeyGetAlgorithmId()
{
  return MEMORY[0x270EFDA88]();
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x270EFDA90](key);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x270EFDAB0](key, *(void *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x270EFDBB0](server, hostname);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x270EFDD30](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

OSStatus SecTrustSetOCSPResponse(SecTrustRef trust, CFTypeRef responseData)
{
  return MEMORY[0x270EFDDD8](trust, responseData);
}

OSStatus SecTrustSetSignedCertificateTimestamps(SecTrustRef trust, CFArrayRef sctArray)
{
  return MEMORY[0x270EFDDE8](trust, sctArray);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t tls_handshake_get_peer_acceptable_dn_list()
{
  return MEMORY[0x270F98F88]();
}

uint64_t tls_handshake_get_peer_certificates()
{
  return MEMORY[0x270F98F90]();
}

uint64_t tls_handshake_get_peer_hostname()
{
  return MEMORY[0x270F98F98]();
}

uint64_t tls_handshake_get_peer_ocsp_response()
{
  return MEMORY[0x270F98FA0]();
}

uint64_t tls_handshake_get_peer_sct_list()
{
  return MEMORY[0x270F98FA8]();
}

uint64_t tls_handshake_set_identity()
{
  return MEMORY[0x270F98FB0]();
}

uint64_t tls_handshake_set_peer_ec_public_key()
{
  return MEMORY[0x270F98FB8]();
}

uint64_t tls_handshake_set_peer_rsa_public_key()
{
  return MEMORY[0x270F98FC0]();
}

uint64_t tls_private_key_create()
{
  return MEMORY[0x270F98FC8]();
}

uint64_t tls_private_key_destroy()
{
  return MEMORY[0x270F98FD0]();
}