uint64_t tls_record_get_header_size(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 488)) {
    return 13;
  }
  else {
    return 5;
  }
}

uint64_t tls_handshake_get_peer_certificates(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t tls_handshake_continue(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 416)) {
    return 0;
  }
  uint64_t result = SSLAdvanceHandshake(*(_DWORD *)(a1 + 420), a1);
  if (result) {
    return result;
  }
  v3 = *(char **)(a1 + 656);
  if (!v3) {
    return 0;
  }
  size_t v4 = *(void *)(a1 + 648);

  return SSLProcessHandshakeRecordInner(v4, v3, a1);
}

unint64_t tls_record_decrypted_size(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 13;
  if (!*(unsigned char *)(a1 + 488)) {
    unint64_t v2 = 5;
  }
  uint64_t v3 = **(void **)(a1 + 16);
  int v4 = *(_DWORD *)(v3 + 4);
  if (v4)
  {
    if (v4 == 2)
    {
      v2 += 24;
    }
    else if (v4 == 1)
    {
      uint64_t v5 = *(unsigned __int8 *)(v3 + 10);
      unint64_t v6 = v2 + **(void **)(a1 + 8);
      if (*(_DWORD *)(a1 + 492) <= 0x301u) {
        uint64_t v5 = 0;
      }
      unint64_t v2 = v6 + v5 + 1;
    }
  }
  else
  {
    v2 += **(void **)(a1 + 8);
  }
  BOOL v7 = a2 >= v2;
  unint64_t v8 = a2 - v2;
  if (v7) {
    return v8;
  }
  else {
    return 0;
  }
}

uint64_t tls_private_key_get_context(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t tls_record_set_record_splitting(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 489) = a2;
  return 0;
}

uint64_t tls_handshake_set_peer_trust(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 72) = a2;
  return 0;
}

uint64_t tls_handshake_set_client_auth(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 424) = a2;
  return 0;
}

uint64_t tls_handshake_set_identity(uint64_t a1, uint64_t **a2, uint64_t *a3)
{
  SSLFreeCertificates(*(void *)(a1 + 56));
  unint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    BOOL v7 = (void (*)(void))v6[1];
    if (v7 && *v6) {
      v7();
    }
    sslFree(v6);
  }
  if (a2)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    tls_copy_buffer_list(a2, &v11);
    unint64_t v8 = v11;
  }
  else
  {
    unint64_t v8 = 0;
  }
  *(void *)(a1 + 56) = v8;
  if (a3) {
    v9 = tls_private_key_create((uint64_t)(a3 + 2), *a3, a3[1]);
  }
  else {
    v9 = 0;
  }
  *(void *)(a1 + 32) = v9;
  return 0;
}

char *tls_private_key_create(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (char *)sslMalloc(0x30uLL);
  if (result)
  {
    *(void *)uint64_t result = a2;
    *((void *)result + 1) = a3;
    *((_DWORD *)result + 4) = *(_DWORD *)a1;
    if (*(_DWORD *)a1 > 1u)
    {
      sslFree(result);
      return 0;
    }
    else
    {
      long long v7 = *(_OWORD *)(a1 + 8);
      *((void *)result + 5) = *(void *)(a1 + 24);
      *(_OWORD *)(result + 24) = v7;
    }
  }
  return result;
}

uint64_t tls_copy_buffer_list(uint64_t **a1, void *a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    int v4 = 0;
    uint64_t v5 = 0;
    while (1)
    {
      unint64_t v6 = malloc_type_malloc(0x18uLL, 0xC274D582uLL);
      if (!v6) {
        break;
      }
      long long v7 = v6;
      *unint64_t v6 = 0;
      size_t v8 = (size_t)v3[1];
      v9 = sslAllocCopy(v3[2], v8);
      v7[2] = v9;
      if (!v9)
      {
        free(v7);
        break;
      }
      v7[1] = v8;
      v10 = v7;
      if (v5)
      {
        *int v4 = v7;
        v10 = v5;
      }
      uint64_t v3 = (uint64_t **)*v3;
      int v4 = v7;
      uint64_t v5 = v10;
      if (!v3) {
        goto LABEL_10;
      }
    }
    tls_free_buffer_list(v5);
    return 0xFFFFFFFFLL;
  }
  else
  {
    v10 = 0;
LABEL_10:
    uint64_t result = 0;
    *a2 = v10;
  }
  return result;
}

uint64_t SelectNewCiphersuite(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 360)) {
    return 4294957495;
  }
  uint64_t v2 = 0;
  while (1)
  {
    unint64_t v3 = *(unsigned int *)(a1 + 376);
    if (v3)
    {
      int v4 = *(unsigned __int16 *)(*(void *)(a1 + 352) + 2 * v2);
      uint64_t v5 = *(unsigned __int16 **)(a1 + 368);
      if (*v5 == v4) {
        break;
      }
      uint64_t v6 = 1;
      do
      {
        unint64_t v7 = v6;
        if (v3 == v6) {
          break;
        }
        int v8 = v5[v6++];
      }
      while (v8 != v4);
      if (v7 < v3) {
        break;
      }
    }
LABEL_15:
    if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 360)) {
      return 4294957495;
    }
  }
  HIDWORD(v9) = sslCipherSuiteGetKeyExchangeMethod(v4) - 1;
  LODWORD(v9) = HIDWORD(v9);
  switch((v9 >> 1))
  {
    case 0u:
    case 4u:
    case 8u:
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_15;
      }
      int v11 = 0;
      goto LABEL_14;
    case 7u:
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_15;
      }
      int v11 = 1;
LABEL_14:
      if (*(_DWORD *)(v10 + 16) != v11) {
        goto LABEL_15;
      }
      goto LABEL_17;
    default:
LABEL_17:
      *(_WORD *)(a1 + 328) = *(_WORD *)(*(void *)(a1 + 352) + 2 * v2);
      InitCipherSpecParams(a1);
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t tls_handshake_create(char a1, char a2)
{
  int v4 = malloc_type_malloc(0x468uLL, 0x10F00405A3378A2uLL);
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    bzero(v4, 0x468uLL);
    *(unsigned char *)(v5 + 16) = a1;
    *(void *)(v5 + 840) = 1400;
    *(unsigned char *)(v5 + 17) = a2;
    *(void *)(v5 + 24) = Ssl3Callouts;
    InitCipherSpecParams(v5);
    tls_handshake_set_config(v5, 0);
    if (!*(unsigned char *)(v5 + 17))
    {
      *(unsigned char *)(v5 + 1066) = 1;
      *(unsigned char *)(v5 + 1008) = 1;
    }
    *(unsigned char *)(v5 + 768) = 1;
    tls_handshake_set_curves(v5, KnownCurves, 3u);
    *(_DWORD *)(v5 + 144) = -1;
    *(_DWORD *)(v5 + 784) = -1;
    tls_handshake_set_sigalgs(v5, KnownSigAlgs, 8u);
    if (*(unsigned char *)(v5 + 17)) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }
    *(_DWORD *)(v5 + 380) = v6;
  }
  return v5;
}

uint64_t InitCipherSpecParams(uint64_t a1)
{
  int v2 = *(unsigned __int16 *)(a1 + 328);
  *(_WORD *)(a1 + 332) = v2;
  *(unsigned char *)(a1 + 343) = sslCipherSuiteGetMacSize(v2);
  *(_DWORD *)(a1 + 344) = sslCipherSuiteGetMacAlgorithm(*(unsigned __int16 *)(a1 + 328));
  *(unsigned char *)(a1 + 340) = sslCipherSuiteGetSymmetricCipherKeySize(*(unsigned __int16 *)(a1 + 328));
  char SymmetricCipherBlockIvSize = sslCipherSuiteGetSymmetricCipherBlockIvSize(*(unsigned __int16 *)(a1 + 328));
  *(unsigned char *)(a1 + 342) = SymmetricCipherBlockIvSize;
  *(unsigned char *)(a1 + 341) = SymmetricCipherBlockIvSize;
  uint64_t result = sslCipherSuiteGetKeyExchangeMethod(*(unsigned __int16 *)(a1 + 328));
  *(_DWORD *)(a1 + 336) = result;
  return result;
}

uint64_t sslCipherSuiteGetSymmetricCipherKeySize(int a1)
{
  uint64_t v1 = (int)sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 1;
  if (v1 > 8) {
    return 0;
  }
  else {
    return byte_20DA4D038[v1];
  }
}

uint64_t sslCipherSuiteGetSymmetricCipherBlockIvSize(int a1)
{
  uint64_t v1 = (int)sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 1;
  if (v1 > 8) {
    return 0;
  }
  else {
    return byte_20DA4D041[v1];
  }
}

uint64_t sslCipherSuiteGetMacSize(int a1)
{
  if (sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 7 >= 2) {
    return (0x3020141000uLL >> (8 * sslCipherSuiteGetMacAlgorithm(a1)));
  }
  else {
    LOBYTE(v2) = 0;
  }
  return v2;
}

uint64_t tls_handshake_set_sigalgs(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  LODWORD(v3) = a3;
  int v4 = a2;
  if (a3)
  {
    unsigned int v6 = 0;
    uint64_t v7 = a3;
    int v8 = a2;
    do
    {
      uint64_t v9 = *v8++;
      v6 += tls_handshake_sigalg_is_supported(v9);
      --v7;
    }
    while (v7);
    size_t v10 = 8 * v6;
  }
  else
  {
    size_t v10 = 0;
  }
  sslFree(*(void **)(a1 + 808));
  *(_DWORD *)(a1 + 800) = 0;
  int v11 = sslMalloc(v10);
  *(void *)(a1 + 808) = v11;
  if (v11) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = 4294967188;
  }
  if (v11 && v3)
  {
    uint64_t v3 = v3;
    do
    {
      if (tls_handshake_sigalg_is_supported(*v4))
      {
        uint64_t v13 = *(void *)(a1 + 808);
        uint64_t v14 = *(unsigned int *)(a1 + 800);
        *(_DWORD *)(a1 + 800) = v14 + 1;
        *(void *)(v13 + 8 * v14) = *v4;
      }
      ++v4;
      --v3;
    }
    while (v3);
    return 0;
  }
  return result;
}

uint64_t tls_handshake_sigalg_is_supported(uint64_t a1)
{
  if (((HIDWORD(a1) - 1) & 0xFFFFFFFD) != 0) {
    return 0;
  }
  else {
    return (a1 < 7) & (0x74u >> a1);
  }
}

uint64_t tls_handshake_set_config(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)(a1 + 1092) = a2;
  if (*(unsigned char *)(a1 + 16))
  {
    int v2 = 65279;
    *(_DWORD *)(a1 + 8) = 65279;
  }
  else
  {
    signed int v3 = a2 + 1;
    if (a2 + 1 >= 0xF) {
      int v4 = 769;
    }
    else {
      int v4 = dword_20DA4CFC0[v3];
    }
    *(_DWORD *)(a1 + 8) = v4;
    if (v3 > 0xE) {
      int v2 = 771;
    }
    else {
      int v2 = dword_20DA4CFFC[v3];
    }
  }
  *(_DWORD *)(a1 + 12) = v2;
  *(_DWORD *)(a1 + 76) = 1024;
  unint64_t v5 = 0x100000000000101uLL >> (8 * (a2 - 4));
  if (a2 - 4 > 7) {
    LOBYTE(v5) = 0;
  }
  if (*(unsigned char *)(a1 + 17)) {
    char v6 = 0;
  }
  else {
    char v6 = v5;
  }
  *(unsigned char *)(a1 + 1064) = v6;
  return tls_handshake_set_ciphersuites_internal(a1, a2, all_ciphersuites, 0x24u);
}

uint64_t sslAnalyzeCipherSpecs(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 352);
  *(unsigned char *)(result + 771) = 0;
  if (*(_DWORD *)(result + 360))
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    do
    {
      uint64_t result = sslCipherSuiteGetKeyExchangeMethod(*(unsigned __int16 *)(v1 + 2 * v3));
      if (result <= 0x12 && ((1 << result) & 0x68000) != 0) {
        *(unsigned char *)(v2 + 771) = 1;
      }
      ++v3;
    }
    while (v3 < *(_DWORD *)(v2 + 360));
  }
  return result;
}

uint64_t tls_handshake_set_ciphersuites_internal(uint64_t a1, unsigned int a2, unsigned __int16 *a3, unsigned int a4)
{
  if (!a4) {
    return 4294967246;
  }
  int v4 = a3;
  unsigned int v7 = 0;
  uint64_t v8 = a4;
  uint64_t v9 = a4;
  size_t v10 = a3;
  do
  {
    int v12 = *v10++;
    int v11 = v12;
    if (tls_handshake_ciphersuite_is_supported(*(unsigned __int8 *)(a1 + 17), *(unsigned char *)(a1 + 16), v12)) {
      v7 += tls_handshake_ciphersuite_is_allowed(a2, v11);
    }
    --v9;
  }
  while (v9);
  if (!v7) {
    return 4294967246;
  }
  sslFree(*(void **)(a1 + 352));
  *(_DWORD *)(a1 + 360) = 0;
  uint64_t v13 = sslMalloc(2 * v7);
  if (!v13) {
    return 4294967188;
  }
  uint64_t v14 = v13;
  *(_DWORD *)(a1 + 360) = v7;
  *(void *)(a1 + 352) = v13;
  do
  {
    int v16 = *v4++;
    int v15 = v16;
    if (tls_handshake_ciphersuite_is_supported(*(unsigned __int8 *)(a1 + 17), *(unsigned char *)(a1 + 16), v16)
      && tls_handshake_ciphersuite_is_allowed(a2, v15))
    {
      *v14++ = v15;
    }
    --v8;
  }
  while (v8);
  sslAnalyzeCipherSpecs(a1);
  return 0;
}

BOOL tls_handshake_ciphersuite_is_supported(uint64_t a1, char a2, int a3)
{
  unsigned int KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(a3);
  int SymmetricCipherAlgorithm = sslCipherSuiteGetSymmetricCipherAlgorithm(a3);
  unsigned int MacAlgorithm = sslCipherSuiteGetMacAlgorithm(a3);
  uint64_t v8 = 0;
  if (KeyExchangeMethod <= 0x13 && ((1 << KeyExchangeMethod) & 0xE8A02) != 0) {
    return ((SymmetricCipherAlgorithm - 4) < 5
  }
         || !SymmetricCipherAlgorithm
         || SymmetricCipherAlgorithm == 2 && (a2 & 1) == 0)
        && MacAlgorithm < 5;
  return v8;
}

BOOL tls_handshake_ciphersuite_is_allowed(unsigned int a1, int a2)
{
  unsigned int KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(a2);
  unsigned int SymmetricCipherAlgorithm = sslCipherSuiteGetSymmetricCipherAlgorithm(a2);
  unsigned int MacAlgorithm = sslCipherSuiteGetMacAlgorithm(a2);
  switch(a1)
  {
    case 0xFFFFFFFF:
    case 0xDu:
      goto LABEL_4;
    case 6u:
      if (KeyExchangeMethod != 15 && KeyExchangeMethod != 17) {
        return 0;
      }
      goto LABEL_25;
    case 8u:
      HIDWORD(v10) = KeyExchangeMethod - 1;
      LODWORD(v10) = KeyExchangeMethod - 1;
      unsigned int v9 = v10 >> 1;
      BOOL v13 = v9 > 8;
      int v11 = (1 << v9) & 0x191;
      if (v13 || v11 == 0) {
        return 0;
      }
LABEL_14:
      uint64_t v7 = 0;
      BOOL v13 = SymmetricCipherAlgorithm == 2 || SymmetricCipherAlgorithm > 3;
      char v14 = v13;
      if (SymmetricCipherAlgorithm == 9 || (v14 & 1) == 0) {
        return v7;
      }
      goto LABEL_28;
    case 9u:
      if (KeyExchangeMethod != 11 && KeyExchangeMethod != 18) {
        return 0;
      }
      if (SymmetricCipherAlgorithm >= 0xA) {
        goto LABEL_28;
      }
LABEL_25:
      unsigned int v8 = 543;
LABEL_27:
      if ((v8 >> SymmetricCipherAlgorithm)) {
        return 0;
      }
LABEL_28:
      if (a1 > 0xD || ((1 << a1) & 0xD3F) != 0) {
        return MacAlgorithm != 0;
      }
      return MacAlgorithm > 1;
    case 0xCu:
      uint64_t v7 = 0;
      if (KeyExchangeMethod != 15 || SymmetricCipherAlgorithm <= 4) {
        return v7;
      }
      return MacAlgorithm > 1;
    default:
      uint64_t v7 = 0;
      if (KeyExchangeMethod <= 0x11 && ((1 << KeyExchangeMethod) & 0x28002) != 0)
      {
LABEL_4:
        uint64_t v7 = 1;
        switch(a1)
        {
          case 0xFFFFFFFF:
            return v7;
          case 0u:
          case 4u:
          case 0xAu:
          case 0xBu:
            if (SymmetricCipherAlgorithm >= 0xA) {
              goto LABEL_28;
            }
            unsigned int v8 = 527;
            goto LABEL_27;
          case 1u:
          case 3u:
          case 5u:
          case 8u:
            goto LABEL_14;
          case 2u:
          case 6u:
          case 7u:
          case 9u:
            goto LABEL_25;
          case 0xCu:
            if (SymmetricCipherAlgorithm <= 4) {
              return 0;
            }
            return MacAlgorithm > 1;
          case 0xDu:
            if (SymmetricCipherAlgorithm > 6) {
              return MacAlgorithm > 1;
            }
            return 0;
          default:
            if (SymmetricCipherAlgorithm <= 3) {
              return 0;
            }
            goto LABEL_28;
        }
      }
      return v7;
  }
}

uint64_t sslCipherSuiteGetKeyExchangeMethod(int a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 1:
    case 2:
    case 4:
    case 5:
    case 7:
    case 9:
    case 10:
    case 47:
    case 53:
    case 59:
    case 60:
    case 61:
    case 156:
    case 157:
LABEL_2:
      uint64_t result = 1;
      break;
    case 3:
    case 6:
    case 8:
      uint64_t result = 2;
      break;
    case 11:
      uint64_t result = 4;
      break;
    case 12:
    case 13:
    case 48:
    case 54:
    case 62:
    case 104:
    case 164:
    case 165:
      uint64_t result = 3;
      break;
    case 14:
      uint64_t result = 6;
      break;
    case 15:
    case 16:
    case 49:
    case 55:
    case 63:
    case 105:
    case 160:
    case 161:
      uint64_t result = 5;
      break;
    case 17:
      uint64_t result = 8;
      break;
    case 18:
    case 19:
    case 50:
    case 56:
    case 64:
    case 106:
    case 162:
    case 163:
      uint64_t result = 7;
      break;
    case 20:
      uint64_t result = 10;
      break;
    case 21:
    case 22:
    case 51:
    case 57:
    case 103:
    case 107:
    case 158:
    case 159:
      uint64_t result = 9;
      break;
    case 23:
    case 25:
      uint64_t result = 12;
      break;
    case 24:
    case 26:
    case 27:
    case 52:
    case 58:
    case 108:
    case 109:
    case 166:
    case 167:
      uint64_t result = 11;
      break;
    case 28:
    case 29:
      uint64_t result = 13;
      break;
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
      return result;
    case 44:
    case 138:
    case 139:
    case 140:
    case 141:
    case 168:
    case 169:
    case 174:
    case 175:
    case 176:
    case 177:
      uint64_t result = 19;
      break;
    case 45:
    case 142:
    case 143:
    case 144:
    case 145:
    case 170:
    case 171:
    case 178:
    case 179:
    case 180:
    case 181:
      uint64_t result = 20;
      break;
    case 46:
    case 146:
    case 147:
    case 148:
    case 149:
    case 172:
    case 173:
    case 182:
    case 183:
    case 184:
    case 185:
      uint64_t result = 21;
      break;
    default:
      switch(a1)
      {
        case 49153:
        case 49154:
        case 49155:
        case 49156:
        case 49157:
        case 49189:
        case 49190:
        case 49197:
        case 49198:
          uint64_t result = 14;
          break;
        case 49158:
        case 49159:
        case 49160:
        case 49161:
        case 49162:
        case 49187:
        case 49188:
        case 49195:
        case 49196:
          uint64_t result = 15;
          break;
        case 49163:
        case 49164:
        case 49165:
        case 49166:
        case 49167:
        case 49193:
        case 49194:
        case 49201:
        case 49202:
          uint64_t result = 16;
          break;
        case 49168:
        case 49169:
        case 49170:
        case 49171:
        case 49172:
        case 49191:
        case 49192:
        case 49199:
        case 49200:
          uint64_t result = 17;
          break;
        case 49173:
        case 49174:
        case 49175:
        case 49176:
        case 49177:
          uint64_t result = 18;
          break;
        case 49178:
        case 49179:
        case 49180:
        case 49181:
        case 49182:
        case 49183:
        case 49184:
        case 49185:
        case 49186:
          return result;
        default:
          unsigned int v3 = a1 - 65408;
          if (v3 <= 3 && v3 != 1) {
            goto LABEL_2;
          }
          break;
      }
      break;
  }
  return result;
}

uint64_t sslCipherSuiteGetSymmetricCipherAlgorithm(int a1)
{
  uint64_t result = 0;
  if (a1 > 4865)
  {
    if (a1 > 65407)
    {
      if (a1 == 65411)
      {
        return 4;
      }
      else if (a1 == 65410)
      {
        return 3;
      }
      else
      {
        return a1 == 65408;
      }
    }
    else
    {
      switch(a1)
      {
        case 49154:
        case 49159:
        case 49164:
        case 49169:
        case 49174:
LABEL_10:
          uint64_t result = 2;
          break;
        case 49155:
        case 49160:
        case 49165:
        case 49170:
        case 49175:
          return 4;
        case 49156:
        case 49161:
        case 49166:
        case 49171:
        case 49176:
        case 49187:
        case 49189:
        case 49191:
        case 49193:
LABEL_6:
          uint64_t result = 5;
          break;
        case 49157:
        case 49162:
        case 49167:
        case 49172:
        case 49177:
        case 49188:
        case 49190:
        case 49192:
        case 49194:
LABEL_7:
          uint64_t result = 6;
          break;
        case 49158:
        case 49163:
        case 49168:
        case 49173:
        case 49178:
        case 49179:
        case 49180:
        case 49181:
        case 49182:
        case 49183:
        case 49184:
        case 49185:
        case 49186:
          return result;
        case 49195:
        case 49197:
        case 49199:
        case 49201:
LABEL_8:
          uint64_t result = 7;
          break;
        case 49196:
        case 49198:
        case 49200:
        case 49202:
LABEL_9:
          uint64_t result = 8;
          break;
        default:
          if (a1 == 4867) {
            unsigned int v3 = 9;
          }
          else {
            unsigned int v3 = 0;
          }
          if (a1 == 4866) {
            uint64_t result = 8;
          }
          else {
            uint64_t result = v3;
          }
          break;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 4:
      case 5:
      case 24:
      case 138:
      case 142:
      case 146:
        goto LABEL_10;
      case 6:
      case 7:
      case 8:
      case 11:
      case 14:
      case 17:
      case 20:
      case 23:
      case 25:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 59:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 176:
      case 177:
      case 180:
      case 181:
        return result;
      case 9:
      case 12:
      case 15:
      case 18:
      case 21:
      case 26:
        return 3;
      case 10:
      case 13:
      case 16:
      case 19:
      case 22:
      case 27:
      case 139:
      case 143:
      case 147:
        return 4;
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 60:
      case 62:
      case 63:
      case 64:
      case 103:
      case 108:
      case 140:
      case 144:
      case 148:
      case 174:
      case 178:
      case 182:
        goto LABEL_6;
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 61:
      case 104:
      case 105:
      case 106:
      case 107:
      case 109:
      case 141:
      case 145:
      case 149:
      case 175:
      case 179:
      case 183:
        goto LABEL_7;
      case 156:
      case 158:
      case 160:
      case 162:
      case 164:
      case 166:
      case 168:
      case 170:
      case 172:
        goto LABEL_8;
      case 157:
      case 159:
      case 161:
      case 163:
      case 165:
      case 167:
      case 169:
      case 171:
      case 173:
        goto LABEL_9;
      default:
        if (a1 == 4865) {
          uint64_t result = 7;
        }
        else {
          uint64_t result = 0;
        }
        break;
    }
  }
  return result;
}

uint64_t sslCipherSuiteGetMacAlgorithm(int a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 1:
    case 3:
    case 4:
    case 6:
    case 23:
    case 24:
      return 1;
    case 2:
    case 5:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
      return 2;
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
      return result;
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 156:
    case 158:
    case 160:
    case 162:
    case 164:
    case 166:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 178:
    case 180:
    case 182:
    case 184:
      return 3;
    case 157:
    case 159:
    case 161:
    case 163:
    case 165:
    case 167:
    case 169:
    case 171:
    case 173:
    case 175:
    case 177:
    case 179:
    case 181:
    case 183:
    case 185:
      return 4;
    default:
      char v3 = a1 - 1;
      if ((a1 - 49153) > 0x31) {
        goto LABEL_10;
      }
      if (((1 << v3) & 0x1FFFFFF) != 0) {
        return 2;
      }
      if (((1 << v3) & 0x1555400000000) != 0) {
        return 3;
      }
      if (((1 << v3) & 0x2AAA800000000) != 0) {
        return 4;
      }
LABEL_10:
      unsigned int v4 = a1 - 65408;
      if (v4 <= 3 && v4 != 1) {
        return 1;
      }
      return result;
  }
}

uint64_t tls_handshake_close(uint64_t a1)
{
  uint64_t result = SSLSendAlert(1, 0, a1);
  *(_DWORD *)(a1 + 380) = 3;
  return result;
}

uint64_t SSLSendAlert(char a1, int a2, uint64_t a3)
{
  unsigned int v9 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
  if (!*(_DWORD *)a3 || *(unsigned char *)(a3 + 704)) {
    return 0;
  }
  size_t v8 = 2;
  uint64_t v4 = SSLAllocBuffer(&v8, 2uLL);
  if (!v4)
  {
    unsigned char *v9 = a1;
    v9[1] = a2;
    uint64_t v4 = (**(uint64_t (***)(void, size_t, unsigned char *, uint64_t))(a3 + 1112))(*(void *)(a3 + 1104), v8, v9, 21);
    SSLFreeBuffer(&v8);
    if (!a2) {
      *(unsigned char *)(a3 + 704) = 1;
    }
  }
  return v4;
}

uint64_t SSLProcessKeyExchange(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t)a2;
  uint64_t v37 = *MEMORY[0x263EF8340];
  unsigned int v6 = *(_DWORD *)(a3 + 336);
  if (v6 <= 0x13)
  {
    if (((1 << v6) & 0x68000) != 0)
    {
      *(void *)&v36[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v36[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      if (!*(void *)(a3 + 152)) {
        return 4294957486;
      }
      if (!a1) {
        return 4294957496;
      }
      unsigned int v7 = SSLDecodeInt(a2, 1);
      if (a1 != v7 + 1) {
        return 4294957496;
      }
      unsigned int v8 = v7;
      SSLFreeBuffer((void *)(a3 + 128));
      uint64_t EcPubKeyFromBits = SSLAllocBuffer((size_t *)(a3 + 128), v8);
      if (EcPubKeyFromBits
        || (memmove(*(void **)(a3 + 136), (const void *)(v4 + 1), v8),
            uint64_t EcPubKeyFromBits = sslGetEcPubKeyFromBits(*(_DWORD *)(a3 + 144), (void *)(a3 + 128), (uint64_t)v36),
            EcPubKeyFromBits))
      {
        uint64_t v10 = EcPubKeyFromBits;
        sslFreePubKey((uint64_t)v36);
        return v10;
      }
      SSLFreeBuffer((void *)(a3 + 504));
      uint64_t v10 = sslEcdhKeyExchange(*(uint64_t ***)(a3 + 152), *((uint64_t *)&v36[0] + 1), (size_t *)(a3 + 504));
      sslFreePubKey((uint64_t)v36);
      if (v10) {
        return v10;
      }
      return 0;
    }
    if (((1 << v6) & 0xA00) != 0)
    {
      if (*(void *)(a3 + 104))
      {
        if (a1 <= 1)
        {
          __ssl_debug("sslError", "SSLDecodeDHClientKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1301, "SSLDecodeDHClientKeyExchange: msg len error 1\n");
          return 4294957496;
        }
        unsigned int v26 = SSLDecodeInt(a2, 2);
        if (a1 < v26 + 2)
        {
          __ssl_debug("sslError", "SSLDecodeDHClientKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1309, "SSLDecodeDHClientKeyExchange: msg len error 2\n");
          return 4294957496;
        }
        unsigned int v28 = v26;
        SSLFreeBuffer((void *)(a3 + 80));
        uint64_t v10 = SSLAllocBuffer((size_t *)(a3 + 80), v28);
        if (!v10)
        {
          memmove(*(void **)(a3 + 88), (const void *)(v4 + 2), v28);
          SSLFreeBuffer((void *)(a3 + 504));
          uint64_t v10 = sslDhKeyExchange(*(uint64_t **)(a3 + 104), a3 + 80, (size_t *)(a3 + 504));
          if (!v10) {
            return 0;
          }
        }
        return v10;
      }
      return 4294957486;
    }
    if (v6 == 19)
    {
      if (a1 <= 1)
      {
        __ssl_debug("sslError", "SSLDecodePSKClientKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1662, "SSLDecodePSKClientKeyExchange: msg len error 1\n");
        return 4294957496;
      }
      unsigned int v27 = SSLDecodeInt(a2, 2);
      if (a1 < v27 + 2)
      {
        __ssl_debug("sslError", "SSLDecodePSKClientKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1670, "SSLDecodePSKClientKeyExchange: msg len error 2\n");
        return 4294957496;
      }
      unsigned int v29 = v27;
      SSLFreeBuffer((void *)(a3 + 912));
      uint64_t v10 = SSLAllocBuffer((size_t *)(a3 + 912), v29);
      if (v10) {
        return v10;
      }
      memmove(*(void **)(a3 + 920), (const void *)(v4 + 2), v29);
      unint64_t v30 = *(void *)(a3 + 896);
      if (!v30) {
        return 4294957448;
      }
      uint64_t v10 = SSLAllocBuffer((size_t *)(a3 + 504), 2 * v30 + 4);
      if (v10) {
        return v10;
      }
      v31 = (void *)SSLEncodeInt(*(void *)(a3 + 512), v30, 2);
      bzero(v31, v30);
      v32 = (void *)SSLEncodeInt((uint64_t)v31 + v30, v30, 2);
      memcpy(v32, *(const void **)(a3 + 904), v30);
      return 0;
    }
  }
  if (v6 != 1)
  {
    __ssl_debug("sslError", "SSLProcessKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1862, "SSLProcessKeyExchange: unknown keyExchangeMethod (%d)\n", v6);
    return 4294967292;
  }
  uint64_t v35 = 0;
  uint64_t v11 = *(void *)(a3 + 32);
  uint64_t v12 = sslPrivKeyLengthInBytes(v11);
  if (!v12)
  {
    __ssl_debug("sslError", "SSLDecodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 867, "SSLDecodeRSAKeyExchange: private key modulus is 0\n");
    return 4294957487;
  }
  uint64_t v13 = v12;
  if (a1 != v12)
  {
    if (a1 != v12 + 2 || *(_DWORD *)a3 < 0x301u)
    {
      __ssl_debug("sslError", "SSLDecodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 886, "SSLDecodeRSAKeyExchange: length error (exp %u got %u)\n");
      return 4294957496;
    }
    v4 += 2;
  }
  uint64_t v10 = SSLAllocBuffer((size_t *)(a3 + 504), 0x30uLL);
  if (!v10)
  {
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v36[1] = v14;
    v36[2] = v14;
    v36[0] = v14;
    v34[0] = 48;
    v34[1] = v36;
    sslRand(v34);
    int v15 = *(unsigned __int8 **)(a3 + 512);
    int v16 = sslRsaDecrypt(v11, v4, v13, (uint64_t)v15, 48, &v35);
    uint64_t v17 = 0;
    uint32x2_t v18 = vshr_n_u32(*(uint32x2_t *)a3, 8uLL);
    v19.i64[0] = v18.u32[0];
    v19.i64[1] = v18.u32[1];
    v20.i64[0] = -1;
    v20.i64[1] = -1;
    int8x16_t v21 = (int8x16_t)vaddq_s64((int64x2_t)veorq_s8((int8x16_t)vdupq_n_s64(*v15), v19), v20);
    int8x8_t v22 = vand_s8(*(int8x8_t *)a3, (int8x8_t)0xFF000000FFLL);
    v19.i64[0] = v22.u32[0];
    v19.i64[1] = v22.u32[1];
    int64x2_t v23 = (int64x2_t)vandq_s8(v21, (int8x16_t)vaddq_s64((int64x2_t)veorq_s8((int8x16_t)vdupq_n_s64(v15[1]), v19), v20));
    int64_t v24 = (v16 - 1) & ~(v35 | v16) & ((v35 ^ 0x30) - 1) & vorrq_s8((int8x16_t)vdupq_laneq_s64(v23, 1), (int8x16_t)v23).u64[0];
    do
    {
      v25 = (unsigned __int8 *)v36 + v17;
      if (v24 < 0) {
        v25 = &v15[v17];
      }
      v15[v17++] = *v25;
    }
    while (v17 != 48);
    return 0;
  }
  return v10;
}

uint64_t sslGetEcPubKeyFromBits(int a1, void *a2, uint64_t a3)
{
  switch(a1)
  {
    case 25:
      unint64_t v5 = (void *)ccec_cp_521();
      break;
    case 24:
      unint64_t v5 = (void *)MEMORY[0x210563930]();
      break;
    case 23:
      unint64_t v5 = (void *)MEMORY[0x210563920]();
      break;
    default:
      __ssl_debug("sslError", "sslGetEcPubKeyFromBits", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 768, "sslEcdhGenerateKeyPair: bad namedCurve (%u)\n", a1);
      return 4294967246;
  }
  unsigned int v6 = v5;
  unsigned int v7 = sslMalloc(24 * *v5 + 16);
  if (!v7) {
    return 4294967188;
  }
  unsigned int v8 = v7;
  uint64_t result = MEMORY[0x210563970](v6, *a2, a2[1], v7);
  if (result)
  {
    sslFree(v8);
    return 4294957487;
  }
  else
  {
    *(unsigned char *)a3 = 0;
    *(void *)(a3 + 8) = v8;
  }
  return result;
}

uint64_t sslEcdhKeyExchange(uint64_t **a1, uint64_t a2, size_t *a3)
{
  uint64_t v6 = **a1;
  uint64_t v7 = ccDRBGGetRngState();
  if (!v7) {
    abort();
  }
  uint64_t v8 = v7;
  uint64_t result = SSLAllocBuffer(a3, (16 * v6) | 1);
  if (!result)
  {
    size_t v10 = a3[1];
    return MEMORY[0x270ED8B38](a1, a2, a3, v10, v8);
  }
  return result;
}

uint64_t SSLEncodeRandom(uint64_t a1)
{
  v3[0] = 0xAAAAAAAAAAAAAAAALL;
  time(v3);
  SSLEncodeInt(a1, LODWORD(v3[0]), 4);
  v3[0] = 28;
  v3[1] = a1 + 4;
  return sslRand(v3);
}

uint64_t SSLEncodeServerHello(size_t *a1, unsigned int *a2)
{
  if (!*((void *)a2 + 39) || (unsigned int v4 = *((void *)a2 + 38)) == 0) {
    unsigned int v4 = 32;
  }
  if (*((unsigned char *)a2 + 929) && *((unsigned char *)a2 + 930) && !*((unsigned char *)a2 + 931))
  {
    unint64_t v5 = *((void *)a2 + 117) + 4;
    *((unsigned char *)a2 + 931) = 1;
  }
  else
  {
    unint64_t v5 = 0;
  }
  uint64_t v6 = *((void *)a2 + 122);
  if (v6 && *((unsigned char *)a2 + 969))
  {
    v5 += v6 + 6;
    *((unsigned char *)a2 + 970) = 1;
  }
  if (*((unsigned char *)a2 + 1009) && *((unsigned char *)a2 + 1008)) {
    v5 += 4;
  }
  if (*((unsigned char *)a2 + 1067) && (uint64_t v7 = (void *)*((void *)a2 + 134)) != 0 && !*((unsigned char *)a2 + 320))
  {
    unint64_t v8 = SSLEncodedBufferListSize(v7, 2);
    v5 += v8 + 6;
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (*((void *)a2 + 50)) {
    v5 += 4;
  }
  if (*((unsigned char *)a2 + 848)) {
    v5 += *((void *)a2 + 107) + *((void *)a2 + 109) + 5;
  }
  if (*((unsigned char *)a2 + 768) && *((unsigned char *)a2 + 769)) {
    v5 += 4;
  }
  unint64_t v9 = v5 + 2;
  if (!v5) {
    unint64_t v9 = 0;
  }
  unint64_t v10 = v9 + v4 + 38;
  uint64_t v11 = 12;
  if (!*((unsigned char *)a2 + 16)) {
    uint64_t v11 = 4;
  }
  uint64_t result = SSLAllocBuffer(a1, v10 + v11);
  if (!result)
  {
    uint64_t v13 = SSLEncodeHandshakeHeader((uint64_t)a2, (uint64_t)a1, 2, v10);
    uint64_t v14 = SSLEncodeInt(v13, *a2, 2);
    uint64_t result = SSLEncodeRandom((uint64_t)(a2 + 117));
    if (!result)
    {
      long long v15 = *(_OWORD *)(a2 + 121);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)(a2 + 117);
      *(_OWORD *)(v14 + 16) = v15;
      int v16 = (void *)(v14 + 33);
      *(unsigned char *)(v14 + 32) = v4;
      uint64_t v17 = (const void *)*((void *)a2 + 39);
      if (v17)
      {
        uint64_t v18 = v4;
        memcpy(v16, v17, v4);
      }
      else
      {
        v36[0] = 32;
        v36[1] = v14 + 33;
        sslRand(v36);
        uint64_t v18 = v4;
      }
      int8x16_t v19 = (unsigned char *)SSLEncodeInt((uint64_t)v16 + v18, *((unsigned __int16 *)a2 + 164), 2);
      *int8x16_t v19 = 0;
      uint64_t v20 = (uint64_t)(v19 + 1);
      if (v5)
      {
        uint64_t v20 = SSLEncodeInt(v20, v5, 2);
        if (*((void *)a2 + 50))
        {
          uint64_t v21 = SSLEncodeInt(v20, 0, 2);
          uint64_t v20 = SSLEncodeInt(v21, 0, 2);
        }
        if (*((unsigned char *)a2 + 931))
        {
          uint64_t v22 = SSLEncodeInt(v20, 0x3374uLL, 2);
          int64x2_t v23 = (void *)SSLEncodeInt(v22, *((void *)a2 + 117), 2);
          memcpy(v23, *((const void **)a2 + 118), *((void *)a2 + 117));
          uint64_t v20 = (uint64_t)v23 + *((void *)a2 + 117);
        }
        if (*((unsigned char *)a2 + 970))
        {
          uint64_t v24 = SSLEncodeInt(v20, 0x10uLL, 2);
          uint64_t v25 = SSLEncodeInt(v24, *((void *)a2 + 122) + 2, 2);
          unsigned int v26 = (void *)SSLEncodeInt(v25, *((void *)a2 + 122), 2);
          memcpy(v26, *((const void **)a2 + 123), *((void *)a2 + 122));
          uint64_t v20 = (uint64_t)v26 + *((void *)a2 + 122);
        }
        if (*((unsigned char *)a2 + 1008) && *((unsigned char *)a2 + 1009))
        {
          uint64_t v27 = SSLEncodeInt(v20, 5uLL, 2);
          uint64_t v20 = SSLEncodeInt(v27, 0, 2);
        }
        if (v8)
        {
          uint64_t v28 = SSLEncodeInt(v20, 0x12uLL, 2);
          uint64_t v29 = SSLEncodeInt(v28, v8 + 2, 2);
          uint64_t v30 = SSLEncodeInt(v29, v8, 2);
          uint64_t v20 = SSLEncodeBufferList(*((uint64_t **)a2 + 134), 2, v30);
        }
        if (*((unsigned char *)a2 + 848))
        {
          uint64_t v31 = SSLEncodeInt(v20, 0xFF01uLL, 2);
          uint64_t v32 = SSLEncodeInt(v31, *((void *)a2 + 107) + *((void *)a2 + 109) + 1, 2);
          v33 = (char *)SSLEncodeInt(v32, *((void *)a2 + 109) + *((void *)a2 + 107), 1);
          memcpy(v33, *((const void **)a2 + 110), *((void *)a2 + 109));
          v34 = &v33[*((void *)a2 + 109)];
          memcpy(v34, *((const void **)a2 + 108), *((void *)a2 + 107));
          uint64_t v20 = (uint64_t)&v34[*((void *)a2 + 107)];
        }
        if (*((unsigned char *)a2 + 768) && *((unsigned char *)a2 + 769))
        {
          uint64_t v35 = SSLEncodeInt(v20, 0x17uLL, 2);
          uint64_t v20 = SSLEncodeInt(v35, 0, 2);
        }
      }
      if (v20 == a1[1] + *a1) {
        return 0;
      }
      else {
        return 4294957486;
      }
    }
  }
  return result;
}

uint64_t sslRand(void *a1)
{
  if (*a1)
  {
    uint64_t v1 = (uint64_t (**)(void))ccDRBGGetRngState();
    if (!v1) {
      abort();
    }
    uint64_t v2 = *v1;
    return v2();
  }
  else
  {
    __ssl_debug("sslError", "sslRand", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 275, "sslRand: zero buf->length\n");
    return 0;
  }
}

uint64_t SSLEncodeCertificate(size_t *a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 17) && *(_DWORD *)(a2 + 784) == -1)
  {
    unint64_t v5 = 0;
    unsigned int v4 = 0;
  }
  else
  {
    unsigned int v4 = *(uint64_t **)(a2 + 56);
    if (v4)
    {
      unint64_t v5 = 0;
      uint64_t v6 = *(void **)(a2 + 56);
      do
      {
        uint64_t v7 = v6;
        uint64_t v6 = (void *)*v6;
        v5 += v7[1] + 3;
      }
      while (v6);
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  uint64_t v8 = 12;
  if (!*(unsigned char *)(a2 + 16)) {
    uint64_t v8 = 4;
  }
  uint64_t result = SSLAllocBuffer(a1, v5 + 3 + v8);
  if (!result)
  {
    uint64_t v10 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 11, v5 + 3);
    for (uint64_t i = SSLEncodeInt(v10, v5, 3); v4; uint64_t i = (uint64_t)v12 + v13[1])
    {
      uint64_t v12 = (void *)SSLEncodeInt(i, v4[1], 3);
      memcpy(v12, (const void *)v4[2], v4[1]);
      uint64_t v13 = v4;
      unsigned int v4 = (uint64_t *)*v4;
    }
    if (*(unsigned char *)(a2 + 17) || *(_DWORD *)(a2 + 784) == -1)
    {
      return 0;
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)(a2 + 433) = 1;
      *(_DWORD *)(a2 + 428) = 2;
    }
  }
  return result;
}

uint64_t SSLEncodeFinishedMessage(size_t *a1, uint64_t a2)
{
  int v4 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 - 769) >= 3)
  {
    if (v4 == 768)
    {
      unsigned int v5 = 36;
      goto LABEL_5;
    }
    if (v4 != 65279) {
      return 4294957486;
    }
  }
  unsigned int v5 = 12;
LABEL_5:
  if (*(unsigned char *)(a2 + 16)) {
    int v6 = 12;
  }
  else {
    int v6 = 4;
  }
  uint64_t result = SSLAllocBuffer(a1, v6 + v5);
  if (!result)
  {
    uint64_t v9 = v5;
    uint64_t v10 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 20, v5);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, void))(*(void *)(a2 + 24) + 16))(a2, v5, v10, *(unsigned __int8 *)(a2 + 17));
    if (!result)
    {
      uint64_t v8 = (size_t *)(a2 + 856);
      SSLFreeBuffer(v8);
      return SSLCopyBuffer((uint64_t)&v9, v8);
    }
  }
  return result;
}

uint64_t SSLEncodeHandshakeHeader(uint64_t a1, uint64_t a2, char a3, unint64_t a4)
{
  int v6 = *(unsigned char **)(a2 + 8);
  *int v6 = a3;
  uint64_t result = SSLEncodeInt((uint64_t)(v6 + 1), a4, 3);
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v8 = SSLEncodeInt(result, *(unsigned __int16 *)(a1 + 202), 2);
    uint64_t v9 = SSLEncodeInt(v8, 0, 3);
    return SSLEncodeInt(v9, a4, 3);
  }
  return result;
}

uint64_t tls12ComputeFinishedMac(uint64_t a1, size_t a2, char *a3, int a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[2] = v8;
  v19[3] = v8;
  v19[0] = v8;
  v19[1] = v8;
  size_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v18 = (_OWORD *)0xAAAAAAAAAAAAAAAALL;
  int v9 = *(_DWORD *)(a1 + 344);
  if (v9 == 4) {
    uint64_t v10 = a1 + 616;
  }
  else {
    uint64_t v10 = a1 + 600;
  }
  if (v9 == 4) {
    uint64_t v11 = &SSLHashSHA384;
  }
  else {
    uint64_t v11 = &SSLHashSHA256;
  }
  v16[0] = 0xAAAAAAAAAAAAAAAALL;
  v16[1] = 0;
  uint64_t v12 = CloneHashState((uint64_t)v11, v10, v16);
  if (!v12)
  {
    size_t v17 = *v11;
    uint64_t v18 = v19;
    uint64_t v13 = off_26C242598;
    if (v9 != 4) {
      uint64_t v13 = off_26C242560;
    }
    uint64_t v12 = ((uint64_t (*)(size_t *, size_t *))*v13)(v16, &v17);
    if (!v12)
    {
      if (a4) {
        uint64_t v14 = "server finished";
      }
      else {
        uint64_t v14 = "client finished";
      }
      uint64_t v12 = tls_handshake_internal_prf(a1, a1 + 520, 0x30uLL, v14, 0xFuLL, v18, v17, a3, a2);
    }
  }
  SSLFreeBuffer(v16);
  return v12;
}

uint64_t tls_handshake_internal_prf(uint64_t a1, uint64_t a2, unint64_t a3, const void *a4, size_t a5, void *a6, size_t a7, char *a8, size_t a9)
{
  size_t v10 = a7;
  if (a4)
  {
    size_t v17 = a7 + a5;
    uint64_t v18 = (char *)sslMalloc(a7 + a5);
    if (!v18) {
      return 4294967188;
    }
    int8x16_t v19 = v18;
    memmove(v18, a4, a5);
    memmove(&v19[a5], a6, v10);
    a6 = v19;
    size_t v10 = v17;
  }
  if (*(unsigned char *)(a1 + 16)) {
    unsigned int v20 = 65279;
  }
  else {
    unsigned int v20 = 770;
  }
  if (*(_DWORD *)a1 > v20)
  {
    if (*(_DWORD *)(a1 + 344) == 4) {
      uint64_t v21 = &TlsHmacSHA384;
    }
    else {
      uint64_t v21 = &TlsHmacSHA256;
    }
    uint64_t v22 = tlsPHash((uint64_t)v21, a2, a3, (uint64_t)a6, v10, a8, a9);
    int64x2_t v23 = 0;
    if (!v22) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  int64x2_t v23 = (char *)sslMalloc(a9);
  if (v23)
  {
    uint64_t v24 = tlsPHash((uint64_t)&TlsHmacMD5, a2, (a3 & 1) + (a3 >> 1), (uint64_t)a6, v10, a8, a9);
    if (!v24)
    {
      uint64_t v24 = tlsPHash((uint64_t)&TlsHmacSHA1, a2 + (a3 >> 1), (a3 & 1) + (a3 >> 1), (uint64_t)a6, v10, v23, a9);
      if (!v24)
      {
        if (a9)
        {
          for (uint64_t i = 0; i != a9; ++i)
            a8[i] ^= v23[i];
        }
LABEL_12:
        uint64_t v22 = 0;
        if (!a4) {
          goto LABEL_21;
        }
LABEL_19:
        if (a6) {
          sslFree(a6);
        }
        goto LABEL_21;
      }
    }
    uint64_t v22 = v24;
LABEL_18:
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t v22 = 4294967188;
  if (a4) {
    goto LABEL_19;
  }
LABEL_21:
  if (v23) {
    sslFree(v23);
  }
  return v22;
}

uint64_t SSLCopyBuffer(uint64_t a1, size_t *a2)
{
  size_t v3 = *(void *)a1;
  int v4 = sslAllocCopy(*(const void **)(a1 + 8), *(void *)a1);
  a2[1] = (size_t)v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 = v3;
  return result;
}

void *sslAllocCopy(const void *a1, size_t size)
{
  int v4 = malloc_type_malloc(size, 0xC274D582uLL);
  unsigned int v5 = v4;
  if (v4) {
    memmove(v4, a1, size);
  }
  return v5;
}

uint64_t SSLEncodeServerKeyExchange(size_t *a1, uint64_t a2)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  unsigned int v2 = *(_DWORD *)(a2 + 336);
  uint64_t MaxSigSize = 4294967292;
  if (v2 > 0x12) {
    return MaxSigSize;
  }
  if (((1 << v2) & 0x28202) == 0)
  {
    if (((1 << v2) & 0x40800) == 0) {
      return MaxSigSize;
    }
    if (*(unsigned char *)(a2 + 16)) {
      unsigned int v16 = 12;
    }
    else {
      unsigned int v16 = 4;
    }
    if (v2 == 18)
    {
      uint64_t v17 = SSLGenServerECDHParamsAndKey(a2);
      if (!v17)
      {
        unint64_t v27 = (((unint64_t)(cczp_bitlen() + 7) >> 2) | 1) + 4;
        uint64_t v17 = SSLAllocBuffer(a1, v27 + v16);
        if (!v17)
        {
          uint64_t v28 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 12, v27);
          SSLEncodeECDHKeyParams(a2, v28);
          return 0;
        }
      }
    }
    else
    {
      if (v2 != 11)
      {
        SSLFreeBuffer(a1);
        return 4294957486;
      }
      uint64_t v17 = SSLGenServerDHParamsAndKey(a2);
      if (!v17)
      {
        unint64_t v18 = SSLEncodedDHKeyParamsLen(a2);
        uint64_t v17 = SSLAllocBuffer(a1, v18 + v16);
        if (!v17)
        {
          uint64_t v19 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 12, v18);
          SSLEncodeDHKeyParams(a2, v19);
          return 0;
        }
      }
    }
    return v17;
  }
  size_t v66 = 0xAAAAAAAAAAAAAAAALL;
  size_t size = 0xAAAAAAAAAAAAAAAALL;
  size_t v62 = 0xAAAAAAAAAAAAAAAALL;
  v63 = 0;
  size_t v64 = 0xAAAAAAAAAAAAAAAALL;
  v65 = 0;
  HIDWORD(v6) = v2 - 1;
  LODWORD(v6) = v2 - 1;
  uint64_t MaxSigSize = 4294957486;
  int v7 = *(unsigned __int8 *)(a2 + 16);
  int v8 = 1;
  switch((v6 >> 1))
  {
    case 0u:
      uint64_t v9 = ccn_write_uint_size();
      uint64_t v10 = ccn_write_uint_size();
      uint64_t v11 = SSLAllocBuffer(&v62, v9 + v10 + 4);
      if (v11) {
        goto LABEL_87;
      }
      uint64_t v12 = (uint64_t)v63;
      unint64_t v13 = ccn_write_uint_size();
      unint64_t v14 = ccn_write_uint_size();
      uint64_t v15 = SSLEncodeInt(v12, v13, 2);
      ccn_write_uint();
      SSLEncodeInt(v15 + v13, v14, 2);
      ccn_write_uint();
      int v8 = 1;
      goto LABEL_22;
    case 4u:
      uint64_t v11 = SSLGenServerDHParamsAndKey(a2);
      if (v11) {
        goto LABEL_87;
      }
      size_t v20 = SSLEncodedDHKeyParamsLen(a2);
      uint64_t v11 = SSLAllocBuffer(&v62, v20);
      if (v11) {
        goto LABEL_87;
      }
      SSLEncodeDHKeyParams(a2, (uint64_t)v63);
      goto LABEL_22;
    case 7u:
      int v8 = 0;
      goto LABEL_19;
    case 8u:
LABEL_19:
      uint64_t v11 = SSLGenServerECDHParamsAndKey(a2);
      if (v11
        || (v21 = cczp_bitlen(), uint64_t v11 = SSLAllocBuffer(&v62, (((unint64_t)(v21 + 7) >> 2) | 1) + 4), v11))
      {
LABEL_87:
        uint64_t MaxSigSize = v11;
        goto LABEL_88;
      }
      SSLEncodeECDHKeyParams(a2, (uint64_t)v63);
LABEL_22:
      uint64_t MaxSigSize = sslGetMaxSigSize(*(void *)(a2 + 32), &size);
      if (MaxSigSize) {
        goto LABEL_88;
      }
      uint64_t MaxSigSize = SSLAllocBuffer(&v64, size);
      if (MaxSigSize) {
        goto LABEL_88;
      }
      unsigned int v22 = *(_DWORD *)a2;
      if (*(unsigned char *)(a2 + 16)) {
        unsigned int v23 = 65279;
      }
      else {
        unsigned int v23 = 770;
      }
      if (v22 <= v23)
      {
        size_t v61 = v62 + 2;
        size_t v29 = v64;
        uint64_t v30 = v65;
        size_t v75 = v62;
        v76 = v63;
        LODWORD(v79) = -1431655766;
        *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v77 = v31;
        long long v78 = v31;
        memset(v69, 170, sizeof(v69));
        uint64_t v70 = 0;
        uint64_t v73 = 32;
        v74 = (long long *)(a2 + 436);
        size_t v71 = 32;
        uint64_t v72 = a2 + 468;
        if (v8)
        {
          v69[0] = 16;
          v69[1] = &v77;
          uint64_t MaxSigSize = ReadyHash((uint64_t)&SSLHashMD5, &v69[2]);
          if (MaxSigSize
            || (uint64_t v32 = off_26C2424E8, MaxSigSize = off_26C2424E8(), MaxSigSize)
            || (uint64_t MaxSigSize = v32(), MaxSigSize)
            || (uint64_t MaxSigSize = v32(), MaxSigSize)
            || (uint64_t MaxSigSize = ((uint64_t (*)(uint64_t, void *))off_26C2424F0[0])((uint64_t)&v69[2], v69),
                MaxSigSize)
            || (uint64_t MaxSigSize = SSLFreeBuffer(&v69[2]), MaxSigSize))
          {
LABEL_55:
            SSLFreeBuffer(&v69[2]);
            LOBYTE(v36) = 0;
            LOBYTE(v37) = 0;
            goto LABEL_56;
          }
          v33 = &v77;
          uint64_t v34 = 36;
        }
        else
        {
          v33 = &v78;
          uint64_t v34 = 20;
        }
        v69[0] = 20;
        v69[1] = &v78;
        uint64_t MaxSigSize = ReadyHash((uint64_t)&SSLHashSHA1, &v69[2]);
        if (!MaxSigSize)
        {
          uint64_t v35 = off_26C242520;
          uint64_t MaxSigSize = off_26C242520();
          if (!MaxSigSize)
          {
            uint64_t MaxSigSize = v35();
            if (!MaxSigSize)
            {
              uint64_t MaxSigSize = v35();
              if (!MaxSigSize)
              {
                uint64_t MaxSigSize = ((uint64_t (*)(uint64_t, void *))off_26C242528[0])((uint64_t)&v69[2], v69);
                if (!MaxSigSize)
                {
                  uint64_t MaxSigSize = SSLFreeBuffer(&v69[2]);
                  if (!MaxSigSize) {
                    uint64_t MaxSigSize = sslRawSign(*(void **)(a2 + 32), (uint64_t)v33, v34, v30, v29, &v66);
                  }
                }
              }
            }
          }
        }
        goto LABEL_55;
      }
      if (!*(_DWORD *)(a2 + 788)) {
        goto LABEL_34;
      }
      uint64_t v24 = *(void *)(a2 + 792);
      if (!v24) {
        goto LABEL_34;
      }
      uint64_t v25 = *(void *)(a2 + 32);
      if (!v25) {
        goto LABEL_34;
      }
      int v26 = *(_DWORD *)(v25 + 16);
      if (v26)
      {
        if (v26 != 1 || v22 < 0x301)
        {
LABEL_34:
          uint64_t MaxSigSize = 4294957486;
          goto LABEL_88;
        }
        int v44 = 0;
        int v36 = 3;
      }
      else
      {
        int v44 = 1;
        int v36 = 1;
      }
      uint64_t v45 = *(unsigned int *)(a2 + 800);
      if (!v45)
      {
        uint64_t MaxSigSize = 4294957496;
        goto LABEL_88;
      }
      uint64_t v46 = 0;
      uint64_t v47 = *(void *)(a2 + 808);
      uint64_t v48 = v24 + 4;
      while (v36 != *(_DWORD *)(v47 + 8 * v46 + 4))
      {
LABEL_74:
        ++v46;
        uint64_t MaxSigSize = 4294957496;
        if (v46 == v45) {
          goto LABEL_88;
        }
      }
      uint64_t v37 = *(unsigned int *)(v47 + 8 * v46);
      uint64_t v49 = *(unsigned int *)(a2 + 788);
      uint64_t v50 = v48;
      while (__PAIR64__(v36, v37) != *(void *)(v50 - 4))
      {
        v50 += 8;
        if (!--v49) {
          goto LABEL_74;
        }
      }
      size_t v61 = v62 + 4;
      size_t v51 = v64;
      v52 = v65;
      size_t v75 = v62;
      v76 = v63;
      size_t v71 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v72 = 0;
      v69[2] = 32;
      uint64_t v70 = a2 + 436;
      int v53 = v37 - 2;
      v69[1] = a2 + 468;
      v68[1] = 0;
      v69[0] = 32;
      if (v37 - 2) < 5 && ((0x1Du >> v53))
      {
        v54 = off_264124B50[v53];
        *(void *)&long long v55 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v79 = v55;
        long long v80 = v55;
        long long v77 = v55;
        long long v78 = v55;
        v68[0] = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v73 = *v54;
        v74 = &v77;
        uint64_t v60 = v73;
        uint64_t MaxSigSize = ReadyHash((uint64_t)v54, &v71);
        if (!MaxSigSize)
        {
          v59 = (uint64_t (*)(size_t *, size_t *))*((void *)v54 + 3);
          uint64_t MaxSigSize = v59(&v71, &v69[2]);
          if (!MaxSigSize)
          {
            uint64_t MaxSigSize = v59(&v71, v69);
            if (!MaxSigSize)
            {
              uint64_t MaxSigSize = v59(&v71, &v75);
              if (!MaxSigSize)
              {
                uint64_t MaxSigSize = (*((uint64_t (**)(size_t *, uint64_t *))v54 + 4))(&v71, &v73);
                if (!MaxSigSize)
                {
                  v56 = *(void **)(a2 + 32);
                  uint64_t v57 = v44
                      ? sslRsaSign((uint64_t)v56, v37, (uint64_t)&v77, v60, v52, v51, &v66)
                      : sslRawSign(v56, (uint64_t)&v77, v60, v52, v51, &v66);
                  uint64_t MaxSigSize = v57;
                  if (v57) {
                    __ssl_debug("sslError", "SSLSignServerKeyExchangeTls12", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 287, "SSLDecodeSignedServerKeyExchangeTls12: sslRawVerify returned %d\n", v57);
                  }
                }
              }
            }
          }
        }
        SSLFreeBuffer(v68);
        SSLFreeBuffer(&v71);
      }
      else
      {
        __ssl_debug("sslError", "SSLSignServerKeyExchangeTls12", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 247, "SSLVerifySignedServerKeyExchangeTls12: unsupported hash %d\n", v37);
        uint64_t MaxSigSize = 4294957496;
      }
LABEL_56:
      if (!MaxSigSize)
      {
        unint64_t v38 = v66 + v61;
        uint64_t v39 = 12;
        if (!v7) {
          uint64_t v39 = 4;
        }
        uint64_t MaxSigSize = SSLAllocBuffer(a1, v38 + v39);
        if (!MaxSigSize)
        {
          v40 = (char *)SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 12, v38);
          memcpy(v40, v63, v62);
          v41 = &v40[v62];
          if (*(unsigned char *)(a2 + 16)) {
            unsigned int v42 = 65279;
          }
          else {
            unsigned int v42 = 770;
          }
          if (*(_DWORD *)a2 > v42)
          {
            char *v41 = v37;
            v41[1] = v36;
            v41 += 2;
          }
          v43 = (void *)SSLEncodeInt((uint64_t)v41, v66, 2);
          memcpy(v43, v65, v66);
          uint64_t MaxSigSize = 0;
        }
      }
LABEL_88:
      SSLFreeBuffer(&v62);
      SSLFreeBuffer(&v64);
      if (!MaxSigSize) {
        return 0;
      }
      return MaxSigSize;
    default:
      goto LABEL_88;
  }
}

uint64_t CloneHashState(uint64_t a1, uint64_t a2, size_t *a3)
{
  uint64_t result = SSLAllocBuffer(a3, *(unsigned int *)(a1 + 8));
  if (!result)
  {
    int v7 = *(uint64_t (**)(uint64_t, size_t *))(a1 + 48);
    return v7(a2, a3);
  }
  return result;
}

uint64_t ReadyHash(uint64_t a1, size_t *a2)
{
  uint64_t result = SSLAllocBuffer(a2, *(unsigned int *)(a1 + 8));
  if (!result)
  {
    unsigned int v5 = *(uint64_t (**)(size_t *))(a1 + 16);
    return v5(a2);
  }
  return result;
}

uint64_t SSLAllocBuffer(size_t *a1, size_t size)
{
  int v4 = malloc_type_malloc(size, 0xC274D582uLL);
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

uint64_t HashSHA256Init()
{
  return 0;
}

uint64_t sslRsaSign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, size_t a6, size_t *a7)
{
  size_t v8 = a6;
  size_t __len = a6;
  uint64_t v10 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, char *, size_t *))(a1 + 32))(*(void *)a1, a2, a3, a4, a5, &__len);
  if (v10)
  {
    __ssl_debug("sslError", "sslRsaSign", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 399, "privKey->desc.rsa.sign: failed (error %d)\n", v10);
    size_t v8 = __len;
  }
  else
  {
    size_t v11 = v8 - __len;
    if (v8 <= __len)
    {
      size_t v8 = __len;
    }
    else
    {
      memmove(&a5[v11], a5, __len);
      bzero(a5, v11);
    }
  }
  *a7 = v8;
  return v10;
}

uint64_t sslGetMaxSigSize(uint64_t a1, void *a2)
{
  if (!a1) {
    return 4294957486;
  }
  if (*(_DWORD *)(a1 + 16) > 1u) {
    return 4294967246;
  }
  uint64_t result = 0;
  *a2 = *(void *)(a1 + 24);
  return result;
}

uint64_t sslEcdhCreateKey(void *a1, void *a2)
{
  size_t v3 = sslMalloc((32 * *a1) | 0x10);
  if (!v3) {
    return 4294967188;
  }
  int v4 = v3;
  if (!ccDRBGGetRngState()) {
    abort();
  }
  uint64_t result = ccec_generate_key();
  if (!result) {
    *a2 = v4;
  }
  return result;
}

uint64_t SSLGenServerECDHParamsAndKey(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1088))
  {
    uint64_t v2 = 0;
    while (!tls_handshake_curve_is_supported(*(unsigned __int16 *)(*(void *)(a1 + 1080) + 2 * v2)))
    {
      if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 1088)) {
        goto LABEL_7;
      }
    }
    *(_DWORD *)(a1 + 144) = *(unsigned __int16 *)(*(void *)(a1 + 1080) + 2 * v2);
  }
LABEL_7:
  int v3 = *(_DWORD *)(a1 + 144);
  switch(v3)
  {
    case 25:
      int v4 = (void *)ccec_cp_521();
      break;
    case 24:
      int v4 = (void *)MEMORY[0x210563930]();
      break;
    case 23:
      int v4 = (void *)MEMORY[0x210563920]();
      break;
    default:
      return 4294957496;
  }

  return sslEcdhCreateKey(v4, (void *)(a1 + 152));
}

uint64_t tls_handshake_set_curves(uint64_t a1, unsigned __int16 *a2, unsigned int a3)
{
  int v4 = a2;
  unsigned int v6 = 0;
  if (a3)
  {
    uint64_t v7 = a3;
    size_t v8 = a2;
    do
    {
      int v9 = *v8++;
      v6 += tls_handshake_curve_is_supported(v9);
      --v7;
    }
    while (v7);
  }
  sslFree(*(void **)(a1 + 112));
  *(_DWORD *)(a1 + 120) = 0;
  uint64_t v10 = sslMalloc(2 * v6);
  if (!v10) {
    return 4294967188;
  }
  size_t v11 = v10;
  *(_DWORD *)(a1 + 120) = v6;
  *(void *)(a1 + 112) = v10;
  if (a3)
  {
    uint64_t v12 = a3;
    do
    {
      int v14 = *v4++;
      __int16 v13 = v14;
      if (tls_handshake_curve_is_supported(v14)) {
        *v11++ = v13;
      }
      --v12;
    }
    while (v12);
  }
  return 0;
}

BOOL tls_handshake_curve_is_supported(int a1)
{
  return (a1 - 23) < 3;
}

uint64_t SSLEncodeECDHKeyParams(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
  uint64_t v5 = SSLEncodeInt(a2, 3uLL, 1);
  uint64_t v6 = SSLEncodeInt(v5, *(int *)(a1 + 144), 2);
  SSLEncodeInt(v6, v4, 1);

  return ccec_export_pub();
}

uint64_t SSLEncodeCertificateRequest(size_t *a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 16)) {
    unsigned int v4 = 65279;
  }
  else {
    unsigned int v4 = 770;
  }
  if (*(_DWORD *)a2 <= v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (2 * *(_DWORD *)(a2 + 800) + 2);
  }
  uint64_t v6 = *(void **)(a2 + 384);
  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      size_t v8 = v6;
      uint64_t v6 = (void *)*v6;
      v7 += v8[1] + 2;
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }
  uint64_t v9 = 12;
  if (!*(unsigned char *)(a2 + 16)) {
    uint64_t v9 = 4;
  }
  uint64_t result = SSLAllocBuffer(a1, v5 + v7 + 5 + v9);
  if (!result)
  {
    uint64_t v11 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 13, v5 + v7 + 5);
    *(_WORD *)uint64_t v11 = 258;
    uint64_t v12 = v11 + 3;
    *(unsigned char *)(v11 + 2) = 64;
    if (v5)
    {
      uint64_t v12 = SSLEncodeInt(v12, v5 - 2, 2);
      if (*(_DWORD *)(a2 + 800))
      {
        uint64_t v13 = 0;
        unint64_t v14 = 0;
        do
        {
          uint64_t v15 = SSLEncodeInt(v12, *(unsigned int *)(*(void *)(a2 + 808) + v13), 1);
          uint64_t v12 = SSLEncodeInt(v15, *(unsigned int *)(*(void *)(a2 + 808) + v13 + 4), 1);
          ++v14;
          v13 += 8;
        }
        while (v14 < *(unsigned int *)(a2 + 800));
      }
    }
    uint64_t v16 = SSLEncodeInt(v12, v7, 2);
    for (i = *(uint64_t **)(a2 + 384); i; uint64_t v16 = (uint64_t)v18 + v19[1])
    {
      unint64_t v18 = (void *)SSLEncodeInt(v16, i[1], 2);
      memcpy(v18, (const void *)i[2], i[1]);
      uint64_t v19 = i;
      uint64_t i = (uint64_t *)*i;
    }
    return 0;
  }
  return result;
}

void tls_record_decrypt(uint64_t a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned char *a5)
{
  v23[2] = *MEMORY[0x263EF8340];
  unint64_t v5 = 13;
  if (!*(unsigned char *)(a1 + 488)) {
    unint64_t v5 = 5;
  }
  if (a2 >= v5)
  {
    uint64_t v12 = a3 + 3;
    uint64_t v11 = *a3;
    if (*(unsigned char *)(a1 + 488))
    {
      unint64_t v13 = SSLDecodeUInt64(a3 + 3, 8);
      uint64_t v12 = a3 + 11;
    }
    else
    {
      unint64_t v13 = 0;
    }
    unsigned int v14 = SSLDecodeInt(v12, 2);
    unsigned int v15 = v14;
    size_t __n = v14;
    __src = v12 + 2;
    uint64_t v16 = 13;
    if (!*(unsigned char *)(a1 + 488)) {
      uint64_t v16 = 5;
    }
    if (a2 >= v16 + (unint64_t)v14)
    {
      if (*(unsigned char *)(a1 + 488))
      {
        if ((*(void *)(a1 + 40) ^ v13) >> 48) {
          return;
        }
        *(void *)(a1 + 40) = v13;
      }
      uint64_t v17 = *(unsigned int (***)(void))(a1 + 16);
      if (*((_DWORD *)*v17 + 1) != 2
        || v15 >= 0x18
        && !v17[3]()
        && (memset(v23, 170, 13),
            SSLEncodeUInt64((uint64_t)v23, *(void *)(a1 + 40)),
            char v18 = *(v12 - 1),
            LOWORD(v23[1]) = *(_WORD *)(v12 - 3),
            BYTE2(v23[1]) = v18,
            *(_WORD *)((char *)&v23[1] + 3) = bswap32(v15 - 24) >> 16,
            !(*(unsigned int (**)(void *, uint64_t, void))(*(void *)(a1 + 16) + 40))(v23, 13, *(void *)(a1 + 24))))
      {
        SSLDecryptRecord(v11, &__n, a1);
        if (!v19)
        {
          size_t v20 = __n;
          if (*(void *)a4 >= __n)
          {
            *(void *)a4 = __n;
            memcpy(*(void **)(a4 + 8), __src, v20);
            IncrementUInt64((void *)(a1 + 40));
            if (a5) {
              *a5 = v11;
            }
          }
        }
      }
    }
  }
}

uint64_t tls_record_encrypt(uint64_t a1, unint64_t a2, char *a3, int a4, unint64_t *a5)
{
  v40[2] = *MEMORY[0x263EF8340];
  if (!a2) {
    return 0;
  }
  char v5 = a4;
  unint64_t v6 = a2;
  unint64_t v8 = *a5;
  uint64_t v9 = (char *)a5[1];
  char v10 = *(unsigned char *)(a1 + 490);
  if (v10) {
    char v10 = a4 == 23
  }
       && *(unsigned char *)(a1 + 489) != 0
       && *(_DWORD *)(**(void **)(a1 + 112) + 4) == 1
       && *(_DWORD *)(a1 + 492) < 0x302u;
  *(unsigned char *)(a1 + 490) = a4 == 23;
  uint64_t v34 = (unint64_t *)(a1 + 136);
  uint64_t v35 = (size_t **)(a1 + 104);
  char v33 = a4;
  while (1)
  {
    uint64_t v14 = 0x4000;
    if (v6 < 0x4000) {
      uint64_t v14 = v6;
    }
    if (v10) {
      unint64_t v15 = 1;
    }
    else {
      unint64_t v15 = v14;
    }
    unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    unsigned __int16 v16 = tls_record_encrypted_size_1(a1, v15);
    if (v8 < v16) {
      return 4294967246;
    }
    int v36 = *(_DWORD ***)(a1 + 112);
    int v17 = (*v36)[1];
    unint64_t v18 = *((unsigned __int8 *)*v36 + 10);
    if (*(unsigned char *)(a1 + 488)) {
      __int16 v19 = -13;
    }
    else {
      __int16 v19 = -5;
    }
    char *v9 = v5;
    uint64_t v20 = SSLEncodeInt((uint64_t)(v9 + 1), *(unsigned int *)(a1 + 492), 2);
    if (*(unsigned char *)(a1 + 488)) {
      uint64_t v20 = SSLEncodeUInt64(v20, *v34);
    }
    unint64_t v21 = (unsigned __int16)(v19 + v16);
    uint64_t v22 = SSLEncodeInt(v20, v21, 2);
    unint64_t v23 = v22;
    if (*(_DWORD *)(a1 + 492) >= 0x302u && v17 == 1)
    {
      uint64_t result = (**(uint64_t (***)(void))(a1 + 496))();
      if (result) {
        return result;
      }
      v23 += v18;
      unint64_t v39 = v23;
    }
    else
    {
      unint64_t v39 = v22;
      if (v17 == 2)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)(a1 + 112) + 32))(v22, *(void *)(a1 + 120));
        if (result) {
          return result;
        }
        uint64_t result = (*(uint64_t (**)(unint64_t, void))(*(void *)(a1 + 112) + 24))(v23, *(void *)(a1 + 120));
        if (result) {
          return result;
        }
        memset(v40, 170, 13);
        SSLEncodeUInt64((uint64_t)v40, *(void *)(a1 + 136));
        char v25 = *(unsigned char *)(v23 - 3);
        LOWORD(v40[1]) = *(_WORD *)(v23 - 5);
        BYTE2(v40[1]) = v25;
        *(_WORD *)((char *)&v40[1] + 3) = bswap32(v15) >> 16;
        uint64_t result = (*(uint64_t (**)(void *, uint64_t, void))(*(void *)(a1 + 112) + 40))(v40, 13, *(void *)(a1 + 120));
        if (result) {
          return result;
        }
        memcpy((void *)(v23 + 8), a3, v15);
        unint64_t v38 = v21;
        uint64_t result = ((uint64_t (*)(unint64_t, unint64_t, unint64_t, void))v36[6])(v23, v23, v21, *(void *)(a1 + 120));
        goto LABEL_49;
      }
    }
    memcpy((void *)v23, a3, v15);
    unint64_t v38 = v15;
    int v26 = v35;
    if (**v35)
    {
      uint64_t result = SSLComputeMac(v33, &v38, 0, v23 + v15, v35, *(_DWORD *)(a1 + 492));
      int v26 = v35;
      if (result) {
        return result;
      }
    }
    if (*(_DWORD *)(a1 + 492) >= 0x302u && v17 == 1)
    {
      unint64_t v38 = v21;
      v39 -= v18;
      goto LABEL_43;
    }
    unint64_t v38 = v21;
    if (v17) {
      break;
    }
    unint64_t v27 = v36;
LABEL_48:
    uint64_t result = ((uint64_t (*)(unint64_t, unint64_t, unint64_t, void))v27[3])(v39, v39, v21, *(void *)(a1 + 120));
LABEL_49:
    if (result) {
      return result;
    }
    IncrementUInt64(v34);
    char v10 = 0;
    a3 += v15;
    v9 += v16;
    v8 -= v16;
    v6 -= v15;
    char v5 = v33;
    if (!v6)
    {
      uint64_t result = 0;
      *a5 -= v8;
      return result;
    }
  }
  if (v17 == 1)
  {
LABEL_43:
    unint64_t v27 = v36;
    unint64_t v28 = (**v26 + v15) % v18;
    int v29 = v18 + ~v28;
    if ((v29 & 0x80000000) == 0)
    {
      uint64_t v30 = -(uint64_t)(v18 - v28 + 1);
      uint64_t v31 = -1;
      do
        *(unsigned char *)(v39 + v38 + v31--) = v29;
      while (v30 != v31);
      unint64_t v21 = v38;
    }
    goto LABEL_48;
  }
  return 4294957296;
}

uint64_t SSLEncodeInt(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    do
    {
      *(unsigned char *)(a1 - 1 + v3) = a2;
      a2 >>= 8;
      --v3;
    }
    while (v3);
  }
  return a1 + a3;
}

void *IncrementUInt64(void *result)
{
  return result;
}

uint64_t SSLEncodeUInt64(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = HIDWORD(a2);
  for (uint64_t i = 3; i != -1; --i)
  {
    *(unsigned char *)(a1 + i) = v2;
    v2 >>= 8;
  }
  unint64_t v4 = a2;
  for (uint64_t j = 7; j != 3; --j)
  {
    *(unsigned char *)(a1 + j) = v4;
    v4 >>= 8;
  }
  return a1 + 8;
}

uint64_t CCSymmAddADD(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3 && *a3)
  {
    return MEMORY[0x270ED8B68]();
  }
  else
  {
    __ssl_debug("sslError", "CCSymmAddADD", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 187, "CCSymmAddADD: NULL cipherCtx\n");
    return 4294957296;
  }
}

uint64_t CCSymmAEADSetIV(void *a1, void *a2)
{
  if (a2 && *a2)
  {
    *(void *)((char *)a2 + 20) = *a1;
    return MEMORY[0x270ED8B80]();
  }
  else
  {
    __ssl_debug("sslError", "CCSymmAEADSetIV", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 99, "CCSymmAEADSetIV: NULL cipherCtx\n");
    return 4294957296;
  }
}

uint64_t tls_record_encrypted_size(uint64_t a1, int a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 490))
  {
    BOOL v7 = a2 == 23
      && *(unsigned char *)(a1 + 489) != 0
      && *(_DWORD *)(**(void **)(a1 + 112) + 4) == 1
      && *(_DWORD *)(a1 + 492) < 0x302u;
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }
  unint64_t v9 = (unint64_t)(a3 - v8) >> 14;
  uint64_t v10 = (a3 - v8) & 0x3FFF;
  uint64_t v11 = tls_record_encrypted_size_1(a1, 0x4000);
  uint64_t v12 = tls_record_encrypted_size_1(a1, 1) * v8 + v9 * v11;
  if (v10) {
    v12 += tls_record_encrypted_size_1(a1, v10);
  }
  return v12;
}

uint64_t tls_record_encrypted_size_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = **(void **)(a1 + 112);
  int v3 = *(_DWORD *)(v2 + 4);
  if (v3)
  {
    if (v3 == 2)
    {
      a2 += 24;
    }
    else if (v3 == 1)
    {
      unint64_t v4 = *(unsigned __int8 *)(v2 + 10);
      unint64_t v5 = **(void **)(a1 + 104) + a2;
      uint64_t v6 = v5 / v4 * v4 - v5;
      uint64_t v7 = v4 + v5;
      if (*(_DWORD *)(a1 + 492) <= 0x301u) {
        unint64_t v4 = 0;
      }
      a2 = v7 + v4 + v6;
    }
  }
  else
  {
    a2 += **(void **)(a1 + 104);
  }
  uint64_t v8 = 13;
  if (!*(unsigned char *)(a1 + 488)) {
    uint64_t v8 = 5;
  }
  return v8 + a2;
}

double SSLDecryptRecord(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  *(void *)&long long v42 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = *(void *)(a3 + 16);
  int v7 = *(_DWORD *)(*(void *)v6 + 4);
  if (v7)
  {
    if (v7 != 1)
    {
      if (v7 == 2)
      {
        if ((*(unsigned int (**)(unint64_t, unint64_t, unint64_t, void))(v6 + 56))(a2[1] + 8, a2[1] + 8, *a2 - 8, *(void *)(a3 + 24)))
        {
          return result;
        }
        uint64_t v9 = a2[1] + 8;
        BOOL v10 = *a2 >= 0x18;
        *(void *)&long long v42 = *a2 - 24;
        *((void *)&v42 + 1) = v9;
        if (!v10) {
          return result;
        }
      }
LABEL_49:
      double result = *(double *)&v42;
      *(_OWORD *)a2 = v42;
      return result;
    }
    if (!(*a2 % *(unsigned __int8 *)(*(void *)v6 + 10)))
    {
      uint64_t v14 = (*(uint64_t (**)(unint64_t, unint64_t))(v6 + 32))(a2[1], a2[1]);
      if (!v14)
      {
        unsigned int v15 = *(_DWORD *)(a3 + 492);
        unint64_t v16 = a2[1];
        if (v15 < 0x302)
        {
          size_t v20 = **(void **)(a3 + 8);
          size_t v19 = v20;
          unint64_t v18 = a2[1];
        }
        else
        {
          uint64_t v17 = *(unsigned __int8 *)(**(void **)(a3 + 16) + 10);
          unint64_t v18 = v16 + v17;
          size_t v19 = **(void **)(a3 + 8);
          size_t v20 = v19 + v17;
        }
        unint64_t v21 = *a2;
        unint64_t v22 = *a2 + ~v20;
        *(void *)&long long v42 = v22;
        *((void *)&v42 + 1) = v18;
        if (v22 <= v21)
        {
          unint64_t v23 = *(unsigned __int8 *)(v21 + v16 - 1);
          if (v15 == 768) {
            unint64_t v24 = *(unsigned __int8 *)(**(void **)(a3 + 16) + 10) - 1;
          }
          else {
            unint64_t v24 = 255;
          }
          if (v24 >= v22) {
            unint64_t v25 = v22;
          }
          else {
            unint64_t v25 = v24;
          }
          int v26 = v25 >= v23;
          if (v25 < v23) {
            char v27 = 0;
          }
          else {
            char v27 = -1;
          }
          unsigned __int8 v28 = v25 & ~v27 | v27 & v23;
          if (v15 != 768 && v25)
          {
            unint64_t v29 = 0;
            uint64_t v30 = (unsigned __int8 *)(v21 + v16 - 1);
            do
            {
              int v32 = *v30--;
              int v31 = v32;
              unint64_t v33 = v29 + 1;
              BOOL v35 = v29 >= v28 || v31 == v28;
              v26 &= v35;
              ++v29;
            }
            while (v25 != v33);
          }
          if (v19)
          {
            uint64_t v41 = (uint64_t)&v41;
            MEMORY[0x270FA5388](v14);
            memset((char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v19);
            size_t v36 = **(void **)(a3 + 8);
            bzero((char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v36);
            size_t v37 = 0;
            size_t v38 = a2[1] + ~v36 + *a2 - v25;
            do
            {
              uint64_t v39 = 0;
              if (v37 == v25 - v28) {
                char v40 = -1;
              }
              else {
                char v40 = 0;
              }
              do
              {
                *((unsigned char *)&v41 + v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0)) = *((unsigned char *)&v41
                                                                               + v39
                                                                               - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0)) & ~v40 | v40 & *(unsigned char *)(v38 + v39);
                ++v39;
              }
              while (v19 != v39);
              ++v37;
              ++v38;
            }
            while (v37 <= v36 + v25 - v19);
            SSLVerifyMac(a1, (unint64_t *)&v42, v28, (uint64_t)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
            *(void *)&long long v42 = v22 - v28;
          }
          goto LABEL_49;
        }
      }
    }
  }
  else if (!(*(unsigned int (**)(unint64_t, unint64_t, unint64_t, void))(v6 + 32))(a2[1], a2[1], *a2, *(void *)(a3 + 24)))
  {
    unint64_t v11 = a2[1];
    unint64_t v12 = **(void **)(a3 + 8);
    BOOL v10 = *a2 >= v12;
    unint64_t v13 = *a2 - v12;
    *(void *)&long long v42 = v13;
    *((void *)&v42 + 1) = v11;
    if (v10)
    {
      if (v12) {
        SSLVerifyMac(a1, (unint64_t *)&v42, 0, v11 + v13, a3);
      }
      goto LABEL_49;
    }
  }
  return result;
}

uint64_t NullCrypt(void *__src, void *__dst, size_t a3)
{
  if (__src != __dst) {
    memcpy(__dst, __src, a3);
  }
  return 0;
}

uint64_t CCSymmAEADGetIV(void *a1, void *a2)
{
  if (a2 && *a2)
  {
    uint64_t result = 0;
    *a1 = *(void *)((char *)a2 + 20);
  }
  else
  {
    __ssl_debug("sslError", "CCSymmAEADGetIV", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 115, "CCSymmAEADSetIV: NULL cipherCtx\n");
    return 4294957296;
  }
  return result;
}

uint64_t CCSymmAEADEncrypt(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4 && *a4)
  {
    int v4 = ccgcm_update();
    int v5 = ccgcm_finalize() | v4;
    int v6 = ccgcm_reset();
    return v5 | v6 | ccgcm_inc_iv();
  }
  else
  {
    __ssl_debug("sslError", "CCSymmAEADEncrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 134, "CCSymmAEADEncrypt: NULL cipherCtx\n");
    return 4294957296;
  }
}

uint64_t CCSymmAEADDecrypt(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4 && *a4)
  {
    int v4 = ccgcm_update();
    int v5 = ccgcm_finalize() | v4;
    int v6 = ccgcm_reset();
    uint64_t v7 = v5 | v6 | ccgcm_inc_iv();
    if (v7) {
      cc_clear();
    }
  }
  else
  {
    puts("CCSymmAEADDecrypt: NULL cipherCtx");
    return 0xFFFFFFFFLL;
  }
  return v7;
}

uint64_t tls_handshake_set_callbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 1104) = a3;
  *(void *)(a1 + 1112) = a2;
  return 0;
}

uint64_t tls_handshake_get_peer_signature_algorithms(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 788);
  return *(void *)(a1 + 792);
}

uint64_t tls_handshake_get_min_protocol_version(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 8);
  return 0;
}

uint64_t tls_handshake_get_max_protocol_version(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 12);
  return 0;
}

uint64_t tls_record_parse_header(uint64_t a1, unint64_t a2, unsigned char *a3, void *a4, unsigned char *a5)
{
  unint64_t v5 = 13;
  if (!*(unsigned char *)(a1 + 488)) {
    unint64_t v5 = 5;
  }
  if (a2 < v5) {
    return 0xFFFFFFFFLL;
  }
  *a4 = SSLDecodeInt(&a3[v5 - 2], 2);
  uint64_t result = 0;
  if (a5) {
    *a5 = *a3;
  }
  return result;
}

uint64_t SSLProcessClientHello(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 <= 0x28)
  {
    __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1481, "SSLProcessClientHello: msg len error 1\n");
    return 4294957496;
  }
  unsigned int v7 = SSLDecodeInt((unsigned __int8 *)a2, 2);
  *(_DWORD *)(a3 + 4) = v7;
  unsigned int v8 = *(_DWORD *)(a3 + 8);
  if (!*(unsigned char *)(a3 + 16))
  {
    if (v8 > v7) {
      goto LABEL_15;
    }
    unsigned int v9 = *(_DWORD *)(a3 + 12);
    int v10 = v7;
    if (v9 >= v7) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v8 < v7) {
    goto LABEL_15;
  }
  unsigned int v9 = *(_DWORD *)(a3 + 12);
  int v10 = v7;
  if (v9 > v7)
  {
LABEL_10:
    int v10 = v9;
    if (*(unsigned char *)(a3 + 17)) {
      goto LABEL_11;
    }
LABEL_15:
    __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1490, "SSLProcessClientHello: protocol version error %04x\n", v7);
    return 4294957495;
  }
LABEL_11:
  uint64_t result = 4294957495;
  if (v10 > 770)
  {
    if (v10 == 771)
    {
      unint64_t v11 = Tls12Callouts;
      goto LABEL_21;
    }
    if (v10 != 65279) {
      return result;
    }
LABEL_19:
    unint64_t v11 = Tls1Callouts;
    goto LABEL_21;
  }
  if ((v10 - 769) < 2) {
    goto LABEL_19;
  }
  if (v10 != 768) {
    return result;
  }
  unint64_t v11 = Ssl3Callouts;
LABEL_21:
  *(void *)(a3 + 24) = v11;
  *(_DWORD *)a3 = v10;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a3 + 1112) + 96))(*(void *)(a3 + 1104));
  if (result) {
    return result;
  }
  long long v12 = *(_OWORD *)(a2 + 18);
  *(_OWORD *)(a3 + 436) = *(_OWORD *)(a2 + 2);
  *(_OWORD *)(a3 + 452) = v12;
  size_t v13 = *(unsigned __int8 *)(a2 + 34);
  if (a1 < v13 + 41)
  {
    __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1519, "SSLProcessClientHello: msg len error 2\n");
    return 4294957496;
  }
  SSLFreeBuffer((void *)(a3 + 288));
  if (v13)
  {
    int v14 = SSLCopyBufferFromData((const void *)(a2 + 35), v13, (size_t *)(a3 + 288));
    size_t v15 = v13;
    if (v14) {
      return 4294967188;
    }
  }
  else
  {
    size_t v15 = 0;
  }
  unint64_t v16 = a2 + a1;
  uint64_t v17 = (unsigned __int8 *)(a2 + 35 + v15);
  if (*(unsigned char *)(a3 + 16))
  {
    unsigned int v20 = *v17;
    size_t v19 = (char *)(v17 + 1);
    size_t v18 = v20;
    unint64_t v21 = (unsigned __int8 *)&v19[v20];
    if ((unint64_t)v21 > v16)
    {
      __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1539, "SSLProcessClientHello: msg len error 3\n");
      return 4294957496;
    }
    uint64_t v22 = *(void *)(a3 + 184);
    BOOL v23 = !v22 || v22 == v18 && !memcmp(*(const void **)(a3 + 192), v19, v18);
    *(unsigned char *)(a3 + 200) = v23;
    uint64_t v17 = v21;
  }
  unsigned __int16 v24 = SSLDecodeInt(v17, 2);
  size_t v25 = v24;
  if ((unint64_t)&v17[v24 + 2] > v16)
  {
    __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1560, "SSLProcessClientHello: msg len error 4\n");
    return 4294957496;
  }
  if ((v24 & 1) != 0 || v24 < 2u || a1 < v13 + v24 + 39)
  {
    __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1566, "SSLProcessClientHello: msg len error 5\n");
    return 4294957496;
  }
  sslFree(*(void **)(a3 + 368));
  int v26 = sslMalloc(v25);
  *(void *)(a3 + 368) = v26;
  if (!v26) {
    return 4294967188;
  }
  unint64_t v27 = 0;
  *(unsigned char *)(a3 + 850) = 0;
  *(unsigned char *)(a3 + 1065) = 0;
  *(_DWORD *)(a3 + 376) = v25 >> 1;
  __int16 v28 = (_WORD)v17 - a1 - a2 + 3;
  do
  {
    __int16 v29 = SSLDecodeInt(v17 + 2, 2);
    *(_WORD *)(*(void *)(a3 + 368) + 2 * v27) = v29;
    if (v29 == 255) {
      *(unsigned char *)(a3 + 850) = 1;
    }
    if (v29 == 22016) {
      *(unsigned char *)(a3 + 1065) = 1;
    }
    ++v27;
    v17 += 2;
    v28 += 2;
  }
  while (v27 < *(unsigned int *)(a3 + 376));
  int v30 = v17[2];
  if (!v17[2] || a1 < (v13 + v25 + v30 + 38))
  {
    __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1594, "SSLProcessClientHello: msg len error 6\n");
    return 4294957496;
  }
  int v31 = &v17[v17[2] + 3];
  if ((unint64_t)v31 < v16) {
    SSLProcessClientHelloExtensions(a3, (unsigned __int16)(-v28 - v30), v31);
  }
  if (*(void *)(a3 + 872))
  {
    if (*(unsigned char *)(a3 + 848) && (*(unsigned char *)(a3 + 850) || !*(unsigned char *)(a3 + 849))) {
      return 4294957495;
    }
  }
  else
  {
    if (*(unsigned char *)(a3 + 850)) {
      char v32 = 1;
    }
    else {
      char v32 = *(unsigned char *)(a3 + 849);
    }
    *(unsigned char *)(a3 + 848) = v32;
  }

  return SSLInitMessageHashes((size_t *)a3);
}

uint64_t SSLDecodeInt(unsigned __int8 *a1, uint64_t a2)
{
  for (uint64_t i = 0; a2; --a2)
  {
    unsigned int v3 = *a1++;
    uint64_t i = v3 | (i << 8);
  }
  return i;
}

uint64_t tls_record_set_protocol_version(uint64_t a1, int a2)
{
  if ((a2 - 768) >= 4 && a2 != 65279) {
    return 4294957293;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 492) = a2;
  return result;
}

void SSLProcessClientHelloExtensions(uint64_t a1, unsigned int a2, unsigned __int8 *a3)
{
  if (a2 <= 1)
  {
    unsigned int v3 = "SSLProcessClientHelloExtensions";
    int v4 = "SSLProcessClientHelloExtensions: need a least 2 bytes\n";
    uint64_t v5 = 1380;
    goto LABEL_5;
  }
  __int16 v7 = a2;
  *(unsigned char *)(a1 + 1009) = 0;
  unsigned int v9 = (size_t *)(a1 + 392);
  SSLFreeBuffer((void *)(a1 + 392));
  *(unsigned char *)(a1 + 769) = 0;
  unsigned __int16 v10 = SSLDecodeInt(a3, 2);
  if (v10 > (unsigned __int16)(v7 - 2))
  {
    unsigned int v3 = "SSLProcessClientHelloExtensions";
    int v4 = "SSLProcessClientHelloExtensions: ext len error 1\n";
    uint64_t v5 = 1395;
    goto LABEL_5;
  }
  unsigned __int16 v11 = v10;
  if (v10 < (unsigned __int16)(v7 - 2)) {
    __ssl_debug("sslError", "SSLProcessClientHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1400, "Warning: SSLProcessClientHelloExtensions: Too many bytes\n");
  }
  if (v11)
  {
    long long v12 = a3 + 2;
    do
    {
      if (v11 <= 3u)
      {
        unsigned int v3 = "SSLProcessClientHelloExtensions";
        int v4 = "SSLProcessClientHelloExtensions: ext len error\n";
        uint64_t v5 = 1408;
        goto LABEL_5;
      }
      unsigned __int16 v13 = SSLDecodeInt(v12, 2);
      int v14 = SSLDecodeInt(v12 + 2, 2);
      int v15 = (unsigned __int16)v14;
      unsigned int v16 = (unsigned __int16)v14 + 4;
      if (v16 > v11)
      {
        unsigned int v3 = "SSLProcessClientHelloExtensions";
        int v4 = "SSLProcessClientHelloExtension: ext len error 2\n";
        uint64_t v5 = 1416;
        goto LABEL_5;
      }
      __int16 v17 = v14;
      size_t v18 = v12 + 4;
      if (v13 > 0x11u)
      {
        if (v13 > 0x3373u)
        {
          if (v13 == 13172)
          {
            if (*(unsigned char *)(a1 + 930)) {
              return;
            }
            if ((_WORD)v14)
            {
              unsigned int v3 = "SSLProcessClientHelloExtension_NPN";
              int v4 = "SSLProcessClientHelloExtension_NPN: length decode error 1\n";
              uint64_t v5 = 1147;
              goto LABEL_5;
            }
            *(unsigned char *)(a1 + 930) = 1;
          }
          else if (v13 == 65281)
          {
            *(unsigned char *)(a1 + 849) = 0;
            size_t v32 = *(void *)(a1 + 872);
            if (v32 + 1 != (unsigned __int16)v14 || v32 != *v18 || memcmp(v12 + 5, *(const void **)(a1 + 880), v32)) {
              return;
            }
            *(unsigned char *)(a1 + 849) = 1;
          }
        }
        else if (v13 == 18)
        {
          if ((_WORD)v14)
          {
            unsigned int v3 = "SSLProcessClientHelloExtension_SCT";
            int v4 = "SSLProcessClientHelloExtension_SCT: length decode error 1\n";
            uint64_t v5 = 1160;
            goto LABEL_5;
          }
          *(unsigned char *)(a1 + 1067) = 1;
        }
        else if (v13 == 23)
        {
          *(unsigned char *)(a1 + 769) = 1;
        }
      }
      else if (v13 > 9u)
      {
        if (v13 == 10)
        {
          if ((unsigned __int16)v14 <= 1u)
          {
            unsigned int v3 = "SSLProcessClientHelloExtension_EllipticCurves";
            int v4 = "SSLProcessClientHelloExtension_SignatureAlgorithms: length decode error 1\n";
            uint64_t v5 = 1322;
            goto LABEL_5;
          }
          unsigned int v42 = SSLDecodeInt(v12 + 4, 2);
          if (v42 != (unsigned __int16)(v17 - 2) || v42 < 2 || (v42 & 1) != 0) {
            return;
          }
          *(_DWORD *)(a1 + 1088) = v42 >> 1;
          sslFree(*(void **)(a1 + 1080));
          *(void *)(a1 + 1080) = sslMalloc(2 * *(unsigned int *)(a1 + 1088));
          if (*(_DWORD *)(a1 + 1088))
          {
            unint64_t v43 = 0;
            int v44 = v12 + 6;
            do
            {
              *(_WORD *)(*(void *)(a1 + 1080) + 2 * v43++) = SSLDecodeInt(v44, 2);
              v44 += 2;
            }
            while (v43 < *(unsigned int *)(a1 + 1088));
          }
        }
        else if (v13 == 13)
        {
          if ((unsigned __int16)v14 <= 1u)
          {
            unsigned int v3 = "SSLProcessClientHelloExtension_SignatureAlgorithms";
            int v4 = "SSLProcessClientHelloExtension_SignatureAlgorithms: length decode error 1\n";
            uint64_t v5 = 1287;
            goto LABEL_5;
          }
          int v25 = SSLDecodeInt(v12 + 4, 2);
          if (v17) {
            return;
          }
          unsigned int v26 = (unsigned __int16)(v17 - 2);
          if (v25 != v26 || (v25 & 1) != 0) {
            return;
          }
          *(_DWORD *)(a1 + 788) = v26 >> 1;
          sslFree(*(void **)(a1 + 792));
          unint64_t v27 = (char *)sslMalloc(8 * *(unsigned int *)(a1 + 788));
          *(void *)(a1 + 792) = v27;
          uint64_t v28 = *(unsigned int *)(a1 + 788);
          if (v28)
          {
            __int16 v29 = v27 + 4;
            int v30 = v12 + 7;
            do
            {
              *(v29 - 1) = *(v30 - 1);
              int v31 = *v30;
              v30 += 2;
              *__int16 v29 = v31;
              v29 += 2;
              --v28;
            }
            while (v28);
          }
        }
      }
      else if (v13)
      {
        if (v13 == 5)
        {
          if (!(_WORD)v14)
          {
            unsigned int v3 = "SSLProcessClientHelloExtension_StatusRequest";
            int v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 1\n";
            uint64_t v5 = 1175;
            goto LABEL_5;
          }
          if (*(unsigned char *)(a1 + 1008) && v12[4] == 1)
          {
            if ((unsigned __int16)v14 <= 2u)
            {
              unsigned int v3 = "SSLProcessClientHelloExtension_StatusRequest";
              int v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 2\n";
              uint64_t v5 = 1186;
              goto LABEL_5;
            }
            unint64_t v19 = SSLDecodeSize((unint64_t)(v12 + 5), 2);
            unsigned __int16 v20 = v17 - 3;
            if (v19 > v20)
            {
              unsigned int v3 = "SSLProcessClientHelloExtension_StatusRequest";
              int v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 3\n";
              uint64_t v5 = 1192;
              goto LABEL_5;
            }
            unint64_t v21 = v19;
            uint64_t v22 = v12 + 7;
            if (SSLDecodeBufferList(v22, v19, 2, (void ***)(a1 + 1032))) {
              return;
            }
            if ((unsigned __int16)(v20 - v21) <= 1u)
            {
              unsigned int v3 = "SSLProcessClientHelloExtension_StatusRequest";
              int v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 4\n";
              uint64_t v5 = 1202;
              goto LABEL_5;
            }
            unint64_t v23 = (unint64_t)&v22[v21];
            size_t v24 = SSLDecodeSize(v23, 2);
            if (v24 != (unsigned __int16)(v20 - v21 - 2))
            {
              unsigned int v3 = "SSLProcessClientHelloExtension_StatusRequest";
              int v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 5\n";
              uint64_t v5 = 1209;
              goto LABEL_5;
            }
            SSLCopyBufferFromData((const void *)(v23 + 2), v24, (size_t *)(a1 + 1016));
            *(unsigned char *)(a1 + 1009) = 1;
          }
        }
      }
      else
      {
        if ((unsigned __int16)v14 <= 1u)
        {
          unsigned int v3 = "SSLProcessClientHelloExtension_ServerName";
          int v4 = "SSLProcessClientHelloExtension_ServerName: length decode error 1\n";
          uint64_t v5 = 1226;
          goto LABEL_5;
        }
        int v33 = v14 - 2;
        if (SSLDecodeSize((unint64_t)(v12 + 4), 2) != (unsigned __int16)(v14 - 2))
        {
          unsigned int v3 = "SSLProcessClientHelloExtension_ServerName";
          int v4 = "SSLProcessClientHelloExtension_ServerName: length decode error 2\n";
          uint64_t v5 = 1232;
          goto LABEL_5;
        }
        if ((_WORD)v33)
        {
          uint64_t v34 = (char *)(v12 + 6);
          while (1)
          {
            if ((unsigned __int16)v33 <= 2u)
            {
              unsigned int v3 = "SSLProcessClientHelloExtension_ServerName";
              int v4 = "SSLProcessClientHelloExtension_ServerName: length decode error 3\n";
              uint64_t v5 = 1241;
              goto LABEL_5;
            }
            unint64_t v35 = (unint64_t)(v34 + 1);
            int v38 = *v34;
            size_t v37 = v34 + 3;
            int v36 = v38;
            unint64_t v39 = SSLDecodeSize(v35, 2);
            int v40 = v33 - 3;
            if (v39 > (unsigned __int16)v40) {
              break;
            }
            size_t v41 = v39;
            if (!v36)
            {
              SSLFreeBuffer(v9);
              SSLAllocBuffer(v9, v41 + 1);
              memcpy(*(void **)(a1 + 400), v37, v41);
              *(unsigned char *)(*(void *)(a1 + 400) + v41) = 0;
            }
            uint64_t v34 = &v37[v41];
            int v33 = v40 - v41;
            if (!(_WORD)v33) {
              goto LABEL_70;
            }
          }
          unsigned int v3 = "SSLProcessClientHelloExtension_ServerName";
          int v4 = "SSLProcessClientHelloExtension_ServerName: length decode error 4\n";
          uint64_t v5 = 1249;
LABEL_5:
          __ssl_debug("sslError", v3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", v5, v4);
          return;
        }
      }
LABEL_70:
      v11 -= v16;
      long long v12 = &v18[v15];
    }
    while (v11);
  }
}

uint64_t tls_handshake_process(uint64_t a1, size_t size, unsigned __int8 *__src, int a4)
{
  uint64_t v6 = 4294957496;
  if (a4 > 21)
  {
    if (a4 == 128)
    {
      uint64_t v7 = SSLProcessSSL2Message(size, __src, a1);
    }
    else
    {
      if (a4 != 22) {
        return v6;
      }
      uint64_t v7 = SSLProcessHandshakeRecord(size, __src, a1);
    }
  }
  else if (a4 == 20)
  {
    uint64_t v7 = SSLProcessChangeCipherSpec(size, __src, a1);
  }
  else
  {
    if (a4 != 21) {
      return v6;
    }
    uint64_t v7 = SSLProcessAlert(size, __src, a1);
  }
  uint64_t v6 = v7;
  if (v7 == -9849) {
    uint64_t v6 = DTLSRetransmit(a1);
  }
  if (v6) {
    __ssl_debug("sslError", "tls_handshake_process", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/tls_handshake.c", 326, "Error processing a message (ct=%d, err=%d)", a4, v6);
  }
  return v6;
}

uint64_t SSLProcessHandshakeRecordInner(size_t size, char *__src, uint64_t a3)
{
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  int v25 = (char *)0xAAAAAAAAAAAAAAAALL;
  while (size >= 4)
  {
    int v25 = __src;
    uint64_t v6 = *__src;
    unint64_t v7 = SSLDecodeSize((unint64_t)(__src + 1), 3);
    size_t v8 = size - (v7 + 4);
    if (size < v7 + 4)
    {
      uint64_t v14 = 0;
      goto LABEL_14;
    }
    unint64_t v9 = v7;
    unsigned __int16 v10 = __src + 4;
    unint64_t v23 = v10;
    unint64_t v24 = v7 + 4;
    v21[0] = v6;
    v21[1] = 0;
    unint64_t v22 = v7;
    uint64_t v11 = SSLProcessHandshakeMessage((uint64_t)v21, a3);
    if (v11) {
      return v11;
    }
    if (v6)
    {
      uint64_t v12 = SSLUpdateHandshakeMacs((uint64_t)&v24, a3);
      if (v12)
      {
        uint64_t v14 = v12;
        SSLFatalSessionAlert(80, a3);
        return v14;
      }
    }
    __src = &v10[v9];
    *(unsigned char *)(a3 + 416) = 1;
    *(_DWORD *)(a3 + 420) = v6;
    uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a3 + 1112) + 8))(*(void *)(a3 + 1104), v6);
    if (v13)
    {
      uint64_t v14 = v13;
      size_t size = v8;
      if (v8) {
        goto LABEL_14;
      }
LABEL_19:
      if (*(void *)(a3 + 656))
      {
        uint64_t v18 = SSLFreeBuffer((void *)(a3 + 648));
        if (v18)
        {
          uint64_t v19 = v18;
          SSLFatalSessionAlert(80, a3);
          return v19;
        }
      }
      return v14;
    }
    uint64_t v11 = SSLAdvanceHandshake(v6, a3);
    size_t size = v8;
    if (v11) {
      return v11;
    }
  }
  uint64_t v14 = 0;
  if (!size) {
    goto LABEL_19;
  }
LABEL_14:
  int v15 = *(char **)(a3 + 656);
  if (!v15)
  {
    uint64_t v16 = SSLAllocBuffer((size_t *)(a3 + 648), size);
    if (v16)
    {
      uint64_t v17 = v16;
      SSLFatalSessionAlert(80, a3);
      return v17;
    }
    int v15 = *(char **)(a3 + 656);
  }
  if (__src != v15)
  {
    memmove(v15, __src, size);
    *(void *)(a3 + 648) = size;
  }
  return v14;
}

uint64_t SSLUpdateHandshakeMacs(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)a2)
  {
    unsigned int v4 = *(_DWORD *)(a2 + 12);
    if (*(unsigned char *)(a2 + 16))
    {
      if (v4 < 0xFEFF)
      {
LABEL_9:
        int v3 = 1;
        goto LABEL_12;
      }
    }
    else if (v4 >= 0x303)
    {
      goto LABEL_9;
    }
LABEL_11:
    int v3 = 0;
LABEL_12:
    uint64_t result = off_26C2424E8();
    if (result) {
      return result;
    }
    goto LABEL_13;
  }
  if (*(unsigned char *)(a2 + 16)) {
    unsigned int v2 = 65279;
  }
  else {
    unsigned int v2 = 770;
  }
  if (*(_DWORD *)a2 <= v2) {
    goto LABEL_11;
  }
  int v3 = 1;
LABEL_13:
  uint64_t result = off_26C242520();
  if (v3)
  {
    if (!result)
    {
      uint64_t result = off_26C242558();
      if (!result)
      {
        uint64_t result = off_26C242590();
        if (!result)
        {
          uint64_t v6 = off_26C2425C8[0];
          return v6();
        }
      }
    }
  }
  return result;
}

uint64_t HashSHA256Update()
{
  return 0;
}

uint64_t HashSHA1Update()
{
  return 0;
}

uint64_t HashSHA512Update()
{
  return 0;
}

unint64_t SSLDecodeSize(unint64_t result, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  unsigned int v2 = (unsigned __int8 *)result;
  LODWORD(result) = 0;
  do
  {
    unsigned int v3 = *v2++;
    uint64_t result = v3 | (result << 8);
    --a2;
  }
  while (a2);
  return result;
}

uint64_t SSLAdvanceHandshake(int a1, uint64_t a2)
{
  SSLResetFlight(a2);
  *(unsigned char *)(a2 + 416) = 0;
  switch(a1)
  {
    case 0:
      int v5 = *(_DWORD *)(a2 + 380);
      if (v5 == 17 || v5 == 2) {
        goto LABEL_8;
      }
      return 0;
    case 1:
      *(unsigned char *)(a2 + 320) = 0;
      *(void *)(a2 + 428) = 0;
      if (*(unsigned char *)(a2 + 322))
      {
        *(unsigned char *)(a2 + 322) = 0;
        (*(void (**)(void, void, void))(*(void *)(a2 + 1112) + 16))(*(void *)(a2 + 1104), 0, 0);
      }
      if (*(unsigned char *)(a2 + 323))
      {
        *(unsigned char *)(a2 + 323) = 0;
        (*(void (**)(void, uint64_t, void))(*(void *)(a2 + 1112) + 16))(*(void *)(a2 + 1104), 1, 0);
      }
      if (*(unsigned char *)(a2 + 1065))
      {
        unsigned int v7 = *(_DWORD *)(a2 + 12);
        unsigned int v8 = *(_DWORD *)(a2 + 4);
        if (!*(unsigned char *)(a2 + 16))
        {
          if (v7 > v8)
          {
LABEL_79:
            SSLFatalSessionAlert(86, a2);
            return 4294957460;
          }
          goto LABEL_80;
        }
        if (v7 < v8) {
          goto LABEL_79;
        }
      }
      else if (!*(unsigned char *)(a2 + 16))
      {
        goto LABEL_80;
      }
      if (!*(unsigned char *)(a2 + 200))
      {
        uint64_t v19 = SSLPrepareAndQueueMessage((uint64_t (*)(size_t *, uint64_t))SSLEncodeServerHelloVerifyRequest, 22, a2);
        goto LABEL_89;
      }
LABEL_80:
      uint64_t v21 = *(void *)(a2 + 296);
      if (v21)
      {
        size_t __n = 0xAAAAAAAAAAAAAAAALL;
        __s1 = (void *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v20 = (*(uint64_t (**)(void, void, uint64_t, size_t *))(*(void *)(a2 + 1112) + 40))(*(void *)(a2 + 1104), *(void *)(a2 + 288), v21, &__n);
        if (!v20) {
          uint64_t v20 = SSLServerValidateSessionData(__n, (uint64_t)__s1, a2);
        }
        if (v20 == -9802) {
          return v20;
        }
        if (!v20)
        {
          uint64_t v20 = SSLInstallSessionFromData(__n, (uint64_t)__s1, a2);
          if (v20) {
            return v20;
          }
          *(unsigned char *)(a2 + 320) = 1;
        }
      }
      if (*(unsigned char *)(a2 + 320))
      {
        SSLFreeBuffer((void *)(a2 + 304));
        SSLCopyBuffer(a2 + 288, (size_t *)(a2 + 304));
        uint64_t v19 = SSLResumeServerSide(a2);
LABEL_89:
        uint64_t v20 = v19;
        if (!v19) {
          return SSLSendFlight(a2);
        }
        return v20;
      }
      uint64_t v20 = SelectNewCiphersuite(a2);
      if (v20) {
        return v20;
      }
      SSLFreeBuffer((void *)(a2 + 304));
      if (*(unsigned char *)(a2 + 280))
      {
        if (!SSLAllocBuffer((size_t *)(a2 + 304), 0x10uLL))
        {
          uint64_t v27 = sslRand((void *)(a2 + 304));
          if (v27) {
            goto LABEL_146;
          }
        }
      }
      uint64_t v20 = SSLPrepareAndQueueMessage((uint64_t (*)(size_t *, uint64_t))SSLEncodeServerHello, 22, a2);
      if (v20) {
        return v20;
      }
      unsigned int v24 = *(_DWORD *)(a2 + 336);
      if (v24 > 0x13) {
        goto LABEL_167;
      }
      int v25 = 1 << v24;
      if ((v25 & 0x28202) != 0)
      {
        if (!*(void *)(a2 + 56))
        {
          __ssl_debug("sslError", "SSLAdvanceHandshake", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 841, "SSLAdvanceHandshake: No server cert!\n");
          goto LABEL_166;
        }
        uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeCertificate, 22, a2);
        if (v20) {
          return v20;
        }
        if (*(unsigned char *)(a2 + 1009))
        {
          if (*(void *)(a2 + 1048))
          {
            uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeCertificateStatus, 22, a2);
            if (v20) {
              return v20;
            }
          }
        }
      }
      else
      {
        if ((v25 & 0xC0801) == 0)
        {
LABEL_167:
          __ssl_debug("sslError", "SSLAdvanceHandshake", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 855, "SSLAdvanceHandshake: Unsupported KEM!\n");
          SSLFatalSessionAlert(80, a2);
          return 4294957486;
        }
        if (*(unsigned char *)(a2 + 424))
        {
          __ssl_debug("sslError", "SSLAdvanceHandshake", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 826, "SSLAdvanceHandshake: Attempting Client Auth with Anonyous CipherSuite!\n");
LABEL_166:
          SSLFatalSessionAlert(80, a2);
          return 4294957448;
        }
        *(unsigned char *)(a2 + 424) = 0;
      }
      unsigned int v28 = *(_DWORD *)(a2 + 336);
      if (v28 > 0x12
        || ((1 << v28) & 0x68A00) == 0 && (v28 != 1 || !*(void *)(a2 + 176))
        || (uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeServerKeyExchange, 22, a2), !v20))
      {
        if (*(unsigned char *)(a2 + 424))
        {
          uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeCertificateRequest, 22, a2);
          if (v20) {
            return v20;
          }
          *(unsigned char *)(a2 + 432) = 1;
          *(_DWORD *)(a2 + 428) = 1;
        }
        uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeServerHelloDone, 22, a2);
        if (!v20)
        {
          if (*(unsigned char *)(a2 + 432)) {
            int v4 = 10;
          }
          else {
            int v4 = 11;
          }
          goto LABEL_101;
        }
      }
      return v20;
    case 2:
      *(unsigned char *)(a2 + 320) = 0;
      uint64_t v9 = *(void *)(a2 + 272);
      if (v9)
      {
        if (*(void *)(a2 + 312))
        {
          size_t __n = 0xAAAAAAAAAAAAAAAALL;
          __s1 = (void *)0xAAAAAAAAAAAAAAAALL;
          SSLRetrieveSessionID(*(void *)(a2 + 264), v9, &__n);
          if (__n == *(void *)(a2 + 304) && !memcmp(__s1, *(const void **)(a2 + 312), __n))
          {
            if (SSLClientValidateSessionDataAfter(*(void *)(a2 + 264), *(void *)(a2 + 272), a2))
            {
              uint64_t v20 = 4294957496;
              int v26 = 47;
              goto LABEL_148;
            }
            uint64_t v27 = SSLInstallSessionFromData(*(void *)(a2 + 264), *(void *)(a2 + 272), a2);
            if (v27 || (uint64_t v27 = SSLInitPendingCiphers(a2), v27))
            {
LABEL_146:
              uint64_t v20 = v27;
              goto LABEL_147;
            }
            *(unsigned char *)(a2 + 320) = 1;
            if (*(unsigned char *)(a2 + 707)) {
              int v4 = 13;
            }
            else {
              int v4 = 14;
            }
            goto LABEL_101;
          }
        }
      }
      unsigned int v10 = *(_DWORD *)(a2 + 336);
      if (v10 > 0x13) {
        return SSLSendFlight(a2);
      }
      if (((1 << v10) & 0x28202) != 0)
      {
        int v4 = 8;
        goto LABEL_101;
      }
      if (((1 << v10) & 0x40801) != 0) {
        goto LABEL_41;
      }
      if (v10 == 19) {
        goto LABEL_100;
      }
      return SSLSendFlight(a2);
    case 3:
LABEL_8:
      *(void *)(a2 + 428) = 0;
      if (*(unsigned char *)(a2 + 322))
      {
        *(unsigned char *)(a2 + 322) = 0;
        (*(void (**)(void, void, void))(*(void *)(a2 + 1112) + 16))(*(void *)(a2 + 1104), 0, 0);
      }
      if (*(unsigned char *)(a2 + 323))
      {
        *(unsigned char *)(a2 + 323) = 0;
        (*(void (**)(void, uint64_t, void))(*(void *)(a2 + 1112) + 16))(*(void *)(a2 + 1104), 1, 0);
      }
      uint64_t v20 = SSLPrepareAndQueueMessage((uint64_t (*)(size_t *, uint64_t))SSLEncodeClientHello, 22, a2);
      if (v20) {
        return v20;
      }
      int v4 = 6;
      goto LABEL_101;
    case 4:
    case 15:
      goto LABEL_2;
    case 11:
      if (*(unsigned char *)(a2 + 17) && *(void *)(a2 + 64)) {
        *(_DWORD *)(a2 + 428) = 2;
      }
      int v11 = *(_DWORD *)(a2 + 380);
      if (v11 == 10)
      {
        *(_DWORD *)(a2 + 380) = 11;
        if (*(void *)(a2 + 64)) {
          *(unsigned char *)(a2 + 434) = 1;
        }
      }
      else
      {
        if (v11 != 8) {
          return SSLSendFlight(a2);
        }
        HIDWORD(v13) = *(_DWORD *)(a2 + 336) - 1;
        LODWORD(v13) = HIDWORD(v13);
        int v12 = v13 >> 1;
        if ((v12 - 7) < 2 || v12 == 4)
        {
LABEL_41:
          int v4 = 7;
          goto LABEL_101;
        }
        if (!v12)
        {
LABEL_100:
          int v4 = 9;
          goto LABEL_101;
        }
      }
      return SSLSendFlight(a2);
    case 12:
      goto LABEL_100;
    case 13:
      if (*(void *)(a2 + 64))
      {
        *(unsigned char *)(a2 + 432) = 1;
        *(_DWORD *)(a2 + 428) = 1;
        return SSLSendFlight(a2);
      }
      SSLFatalSessionAlert(40, a2);
      return 4294957496;
    case 14:
      if (*(void *)(a2 + 64))
      {
        int v15 = 80;
        uint64_t v20 = 4294957486;
        switch(*(_DWORD *)(a2 + 72))
        {
          case 0:
            break;
          case 1:
            goto LABEL_94;
          case 2:
            goto LABEL_92;
          case 3:
            goto LABEL_93;
          default:
            goto LABEL_91;
        }
      }
      if (*(_DWORD *)(a2 + 428) != 1) {
        goto LABEL_129;
      }
      if (!*(void *)(a2 + 56)) {
        goto LABEL_97;
      }
      uint64_t v16 = *(void *)(a2 + 32);
      if (!v16) {
        goto LABEL_97;
      }
      int v17 = *(_DWORD *)(v16 + 16);
      if (v17 == 1)
      {
        int v18 = 64;
        goto LABEL_126;
      }
      if (!v17)
      {
        int v18 = 1;
LABEL_126:
        *(_DWORD *)(a2 + 784) = v18;
        goto LABEL_127;
      }
LABEL_97:
      *(_DWORD *)(a2 + 784) = -1;
      if (*(_DWORD *)a2 < 0x301u)
      {
        uint64_t v22 = SSLSendAlert(1, 41, a2);
        goto LABEL_128;
      }
LABEL_127:
      uint64_t v22 = SSLPrepareAndQueueMessage(SSLEncodeCertificate, 22, a2);
LABEL_128:
      uint64_t v20 = v22;
      if (!v22)
      {
LABEL_129:
        uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeKeyExchange, 22, a2);
        if (!v20)
        {
          uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 8))(a2);
          if (v20 || (uint64_t v20 = SSLInitPendingCiphers(a2), v20))
          {
LABEL_147:
            int v26 = 80;
LABEL_148:
            SSLFatalSessionAlert(v26, a2);
          }
          else
          {
            bzero(*(void **)(a2 + 512), *(void *)(a2 + 504));
            uint64_t v20 = SSLFreeBuffer((void *)(a2 + 504));
            if (!v20)
            {
              if (!*(unsigned char *)(a2 + 433)
                || (uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeCertificateVerify, 22, a2), !v20))
              {
                uint64_t v20 = SSLPrepareAndQueueMessage((uint64_t (*)(size_t *, uint64_t))SSLEncodeChangeCipherSpec, 20, a2);
                if (!v20)
                {
                  if (*(unsigned char *)(a2 + 17)
                    || !*(unsigned char *)(a2 + 932)
                    || *(unsigned char *)(a2 + 931)
                    || (uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeNPNEncryptedExtensionMessage, 22, a2), !v20))
                  {
                    uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeFinishedMessage, 22, a2);
                    if (!v20)
                    {
                      if (*(unsigned char *)(a2 + 707)) {
                        int v4 = 13;
                      }
                      else {
LABEL_2:
                      }
                        int v4 = 14;
LABEL_101:
                      *(_DWORD *)(a2 + 380) = v4;
                      return SSLSendFlight(a2);
                    }
                  }
                }
              }
            }
          }
        }
      }
      return v20;
    case 16:
      uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 8))(a2);
      if (v20) {
        goto LABEL_147;
      }
      uint64_t v20 = SSLInitPendingCiphers(a2);
      if (v20) {
        goto LABEL_147;
      }
      bzero(*(void **)(a2 + 512), *(void *)(a2 + 504));
      uint64_t v20 = SSLFreeBuffer((void *)(a2 + 504));
      if (v20) {
        return v20;
      }
      if (!*(unsigned char *)(a2 + 434)) {
        goto LABEL_2;
      }
      int v4 = 12;
      goto LABEL_101;
    case 20:
      if (*(unsigned char *)(a2 + 17) && *(unsigned char *)(a2 + 432))
      {
        int v15 = 80;
        uint64_t v20 = 4294957486;
        switch(*(_DWORD *)(a2 + 72))
        {
          case 0:
            goto LABEL_60;
          case 1:
            break;
          case 2:
LABEL_92:
            int v15 = 48;
            uint64_t v20 = 4294957484;
            break;
          case 3:
LABEL_93:
            int v15 = 45;
            uint64_t v20 = 4294957482;
            break;
          default:
LABEL_91:
            int v15 = 46;
            uint64_t v20 = 4294957489;
            break;
        }
LABEL_94:
        SSLFatalSessionAlert(v15, a2);
        if (*(unsigned char *)(a2 + 17) && *(void *)(a2 + 64)) {
          *(_DWORD *)(a2 + 428) = 3;
        }
        return v20;
      }
LABEL_60:
      if (!*(unsigned char *)(a2 + 322))
      {
        *(unsigned char *)(a2 + 322) = 1;
        (*(void (**)(void, void, uint64_t))(*(void *)(a2 + 1112) + 16))(*(void *)(a2 + 1104), 0, 1);
      }
      if (*(unsigned char *)(a2 + 325))
      {
        uint64_t v20 = SSLPrepareAndQueueMessage((uint64_t (*)(size_t *, uint64_t))SSLEncodeChangeCipherSpec, 20, a2);
        if (v20) {
          return v20;
        }
        if (!*(unsigned char *)(a2 + 17))
        {
          if (*(unsigned char *)(a2 + 932))
          {
            if (!*(unsigned char *)(a2 + 931))
            {
              uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeNPNEncryptedExtensionMessage, 22, a2);
              if (v20) {
                return v20;
              }
            }
          }
        }
        uint64_t v20 = SSLPrepareAndQueueMessage(SSLEncodeFinishedMessage, 22, a2);
        if (v20) {
          return v20;
        }
      }
      else if (!*(unsigned char *)(a2 + 323))
      {
        *(unsigned char *)(a2 + 323) = 1;
        (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a2 + 1112) + 16))(*(void *)(a2 + 1104), 1, 1);
      }
      if (*(unsigned char *)(a2 + 17))
      {
        *(_DWORD *)(a2 + 380) = 16;
      }
      else
      {
        *(_DWORD *)(a2 + 380) = 17;
        if (!*(unsigned char *)(a2 + 320)) {
          tls_metric_client_finished(a2);
        }
      }
      if (*(unsigned char *)(a2 + 280) && (!*(unsigned char *)(a2 + 320) || *(void *)(a2 + 720))) {
        SSLAddSessionData(a2);
      }
      return SSLSendFlight(a2);
    default:
      return SSLSendFlight(a2);
  }
}

uint64_t SSLPrepareAndQueueMessage(uint64_t (*a1)(size_t *a1, uint64_t a2), int a2, uint64_t a3)
{
  long long v14 = 0uLL;
  uint64_t v6 = a1((size_t *)&v14, a3);
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
LABEL_3:
    SSLFatalSessionAlert(v8, a3);
LABEL_4:
    SSLFreeBuffer(&v14);
    return v7;
  }
  if (a2 == 22)
  {
    if (a1 != SSLEncodeServerHelloRequest)
    {
      uint64_t v10 = SSLUpdateHandshakeMacs((uint64_t)&v14, a3);
      if (v10)
      {
        uint64_t v7 = v10;
        int v8 = 80;
        goto LABEL_3;
      }
    }
    ++*(_WORD *)(a3 + 202);
  }
  int v11 = (char *)sslMalloc(0x20uLL);
  if (!v11)
  {
    uint64_t v7 = 4294957486;
    goto LABEL_4;
  }
  *(void *)int v11 = 0;
  *(_OWORD *)(v11 + 8) = v14;
  v11[24] = a2;
  int v12 = *(void **)(a3 + 664);
  if (v12)
  {
    do
    {
      unint64_t v13 = v12;
      int v12 = (void *)*v12;
    }
    while (v12);
    uint64_t v7 = 0;
    *unint64_t v13 = v11;
  }
  else
  {
    uint64_t v7 = 0;
    *(void *)(a3 + 664) = v11;
  }
  return v7;
}

uint64_t SSLResetFlight(uint64_t a1)
{
  *(_DWORD *)(a1 + 204) = 0;
  if (*(unsigned char *)(a1 + 16)) {
    (*(void (**)(void, void))(*(void *)(a1 + 1112) + 24))(*(void *)(a1 + 1104), 0);
  }
  unsigned int v2 = *(void **)(a1 + 664);
  *(unsigned char *)(a1 + 672) = 0;
  if (v2)
  {
    while (1)
    {
      uint64_t result = SSLFreeBuffer(v2 + 1);
      if (result) {
        break;
      }
      int v4 = (void *)*v2;
      sslFree(v2);
      unsigned int v2 = v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t result = 0;
    *(void *)(a1 + 664) = 0;
  }
  return result;
}

uint64_t SSLSendFlight(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16))
  {
    unsigned int v2 = *(_DWORD *)(a1 + 204) + 1;
    *(_DWORD *)(a1 + 204) = v2;
    if (v2 > 0xA) {
      return 4294957452;
    }
    (*(void (**)(void))(*(void *)(a1 + 1112) + 24))(*(void *)(a1 + 1104));
  }
  uint64_t v4 = a1 + 664;
  while (1)
  {
    uint64_t v4 = *(void *)v4;
    if (!v4) {
      break;
    }
    int v5 = *(unsigned __int8 *)(v4 + 24);
    uint64_t v6 = *(void *)(v4 + 8);
    if (*(unsigned char *)(a1 + 16) && (uint64_t v7 = *(unsigned __int8 **)(v4 + 16), v5 == 22))
    {
      size_t v24 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
      SSLDecodeInt(v7 + 4, 2);
      unint64_t v8 = *(void *)(a1 + 840) - 13;
      uint64_t v9 = *(unsigned __int8 *)(a1 + 343);
      if (*(unsigned char *)(a1 + 342)) {
        unint64_t v8 = (v8 & -(uint64_t)*(unsigned __int8 *)(a1 + 342)) + ~(unint64_t)*(unsigned __int8 *)(a1 + 342);
      }
      uint64_t v10 = v8 - v9;
      uint64_t v11 = SSLAllocBuffer(&v24, v8 - v9);
      if (v11) {
        return v11;
      }
      unint64_t v12 = v10 - 12;
      unint64_t v13 = v6 - 12;
      long long v14 = (_DWORD *)v25;
      int v15 = *(_DWORD *)v7;
      *(_WORD *)(v25 + 4) = *((_WORD *)v7 + 2);
      *long long v14 = v15;
      if (v13 <= v10 - 12)
      {
        unint64_t v16 = 0;
LABEL_23:
        SSLEncodeInt(v25 + 6, v16, 3);
        SSLEncodeInt(v25 + 9, v13, 3);
        memcpy((void *)(v25 + 12), &v7[v16 + 12], v13);
        size_t v24 = v13 + 12;
        uint64_t v17 = (**(uint64_t (***)(void))(a1 + 1112))(*(void *)(a1 + 1104));
      }
      else
      {
        unint64_t v16 = 0;
        while (1)
        {
          SSLEncodeInt(v25 + 6, v16, 3);
          SSLEncodeInt(v25 + 9, v12, 3);
          memcpy((void *)(v25 + 12), &v7[v16 + 12], v12);
          uint64_t v17 = (**(uint64_t (***)(void, size_t, unint64_t, uint64_t))(a1 + 1112))(*(void *)(a1 + 1104), v24, v25, 22);
          if (v17) {
            break;
          }
          v13 -= v12;
          v16 += v12;
          if (v13 <= v12) {
            goto LABEL_23;
          }
        }
      }
      uint64_t v3 = v17;
      SSLFreeBuffer(&v24);
    }
    else
    {
      uint64_t v11 = (**(uint64_t (***)(void, void, void, void))(a1 + 1112))(*(void *)(a1 + 1104), *(void *)(v4 + 8), *(void *)(v4 + 16), *(unsigned __int8 *)(v4 + 24));
      if (v11) {
        return v11;
      }
      if (v5 == 20)
      {
        uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 1112) + 72))(*(void *)(a1 + 1104));
        if (v3)
        {
          SSLFatalSessionAlert(80, a1);
          return v3;
        }
        *(unsigned char *)(a1 + 325) = 0;
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
    if (v3) {
      return v3;
    }
  }
  if (*(unsigned char *)(a1 + 672))
  {
    if ((int SymmetricCipherAlgorithm = sslCipherSuiteGetSymmetricCipherAlgorithm(*(unsigned __int16 *)(a1 + 328)),
          unsigned int KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(*(unsigned __int16 *)(a1 + 328)),
          *(unsigned char *)(a1 + 928))
      && ((SymmetricCipherAlgorithm - 5) <= 3 ? (BOOL v20 = KeyExchangeMethod > 0x11) : (BOOL v20 = 1),
          !v20 ? (BOOL v21 = ((1 << KeyExchangeMethod) & 0x28200) == 0) : (BOOL v21 = 1),
          !v21 && ((int v22 = *(_DWORD *)(a1 + 784), v22 == -1) || v22 == 1 || v22 == 64))
      || *(unsigned char *)(a1 + 322))
    {
      if (!*(unsigned char *)(a1 + 323))
      {
        *(unsigned char *)(a1 + 323) = 1;
        (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 1112) + 16))(*(void *)(a1 + 1104), 1, 1);
      }
    }
  }
  return 0;
}

uint64_t SSLProcessHandshakeRecord(size_t size, unsigned __int8 *__src, uint64_t a3)
{
  size_t v5 = size;
  *(void *)((char *)&v44[1] + 3) = *MEMORY[0x263EF8340];
  uint64_t v6 = (size_t *)(a3 + 648);
  if (*(void *)(a3 + 656))
  {
    size_t v7 = *v6;
    uint64_t v8 = SSLReallocBuffer(a3 + 648, *v6 + size);
    if (v8)
    {
LABEL_3:
      uint64_t v9 = v8;
      SSLFatalSessionAlert(80, a3);
      return v9;
    }
    memcpy((void *)(*(void *)(a3 + 656) + v7), __src, v5);
    size_t v5 = *(void *)(a3 + 648);
    uint64_t v10 = *(unsigned __int8 **)(a3 + 656);
    __src = v10;
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (!*(unsigned char *)(a3 + 16))
  {
    return SSLProcessHandshakeRecordInner(v5, (char *)__src, a3);
  }
  if (!v5)
  {
    uint64_t v9 = 0;
LABEL_37:
    if (v10)
    {
      uint64_t v29 = SSLFreeBuffer(v6);
      if (v29)
      {
        uint64_t v30 = v29;
        SSLFatalSessionAlert(80, a3);
        return v30;
      }
    }
    return v9;
  }
  unint64_t v39 = (_DWORD *)(a3 + 216);
  int v40 = (size_t *)(a3 + 224);
  uint64_t v34 = v6;
  uint64_t v37 = a3 + 568;
  int v38 = off_26C242520;
  uint64_t v35 = a3 + 584;
  int v36 = off_26C2424E8;
  size_t v11 = v5;
  while (1)
  {
    if (v11 <= 0xB)
    {
      __ssl_debug("sslError", "DTLSProcessHandshakeRecordInner", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 308, "DTLSProcessHandshakeRecord: remaining too small (%lu out of %lu)\n", v11, v5);
      uint64_t v9 = 4294957447;
LABEL_49:
      BOOL v20 = (void *)(a3 + 224);
LABEL_50:
      __ssl_debug("sslError", "DTLSProcessHandshakeRecordInner", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 456, "DTLSProcessHandshakeRecord: flushing record (err=%d)\n", v9);
      SSLFreeBuffer(v20);
      *(_WORD *)(a3 + 240) = 0;
      return v9;
    }
    unint64_t v12 = (char *)(__src + 12);
    uint64_t v13 = *__src;
    unsigned int v14 = SSLDecodeInt(__src + 1, 3);
    unsigned int v15 = SSLDecodeInt(__src + 4, 2);
    int v16 = SSLDecodeInt(__src + 6, 3);
    unsigned int v17 = SSLDecodeInt(__src + 9, 3);
    unsigned int v18 = v17;
    unint64_t v19 = v11 - 12;
    BOOL v20 = (void *)(a3 + 224);
    if (v17 + v16 > v14
      || v19 < v17
      || v15 != *(unsigned __int16 *)(a3 + 208)
      || (uint64_t v21 = *(unsigned __int16 *)(a3 + 240), v16 != v21))
    {
LABEL_40:
      __ssl_debug("sslError", "DTLSProcessHandshakeRecordInner", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 337, "DTLSProcessHandshakeRecord: wrong fragment (fl=%d, fo=%d, ml=%d, rm=%d | ms=%d/%d | mt=%d/%d, ml=%d/%d\n", v17, v16, v14, v19, v13, *v39, v14, *v40, v33, v34);
      uint64_t v9 = 4294957447;
      goto LABEL_50;
    }
    if (v16)
    {
      if (*v39 != v13 || *v40 != v14) {
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v8 = SSLAllocBuffer(v40, v14);
      if (v8) {
        goto LABEL_3;
      }
      *(_DWORD *)(a3 + 216) = v13;
      uint64_t v21 = *(unsigned __int16 *)(a3 + 240);
    }
    uint64_t v22 = v18;
    memcpy((void *)(*(void *)(a3 + 232) + v21), v12, v18);
    unsigned __int16 v23 = *(_WORD *)(a3 + 240) + v18;
    *(_WORD *)(a3 + 240) = v23;
    __src = (unsigned __int8 *)&v12[v18];
    size_t v11 = v19 - v22;
    if (*(void *)(a3 + 224) != v23) {
      goto LABEL_30;
    }
    long long v41 = *(_OWORD *)v39;
    uint64_t v42 = *(void *)(a3 + 232);
    uint64_t v24 = SSLProcessHandshakeMessage((uint64_t)&v41, a3);
    if (v24)
    {
      uint64_t v9 = v24;
      goto LABEL_49;
    }
    if (v13)
    {
      if (v13 != 3)
      {
        v44[0] = 0xAAAAAAAAAAAAAAAALL;
        *(_DWORD *)((char *)v44 + 7) = -1431655766;
        *((void *)&v41 + 1) = &v43;
        *(void *)&long long v41 = 12;
        char v43 = v13;
        SSLEncodeInt((uint64_t)v44, v14, 3);
        SSLEncodeInt((uint64_t)v44 + 3, v15, 2);
        SSLEncodeInt((uint64_t)v44 + 5, 0, 3);
        SSLEncodeInt((uint64_t)&v44[1], v14, 3);
        uint64_t v25 = ((uint64_t (*)(uint64_t, long long *))v38)(v37, &v41);
        if (v25
          || (uint64_t v25 = ((uint64_t (*)(uint64_t, long long *))v36)(v35, &v41), v25)
          || (uint64_t v25 = ((uint64_t (*)(uint64_t, size_t *))v38)(v37, v40), v25)
          || (uint64_t v25 = ((uint64_t (*)(uint64_t, size_t *))v36)(v35, v40), v25))
        {
          uint64_t v9 = v25;
          SSLFatalSessionAlert(80, a3);
          goto LABEL_49;
        }
      }
    }
    SSLFreeBuffer(v40);
    *(_WORD *)(a3 + 240) = 0;
    ++*(_WORD *)(a3 + 208);
    *(unsigned char *)(a3 + 416) = 1;
    *(_DWORD *)(a3 + 420) = v13;
    uint64_t v26 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a3 + 1112) + 8))(*(void *)(a3 + 1104), v13);
    if (v26) {
      break;
    }
    uint64_t v27 = SSLAdvanceHandshake(v13, a3);
    if (v27)
    {
      uint64_t v9 = v27;
      __ssl_debug("sslError", "DTLSProcessHandshakeRecordInner", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 421, "AdvanceHandshake error: %d\n", v27);
      goto LABEL_49;
    }
LABEL_30:
    if (!v11)
    {
      uint64_t v9 = 0;
      uint64_t v10 = *(unsigned __int8 **)(a3 + 656);
LABEL_32:
      uint64_t v6 = v34;
      goto LABEL_37;
    }
  }
  uint64_t v9 = v26;
  uint64_t v10 = *(unsigned __int8 **)(a3 + 656);
  if (!v11) {
    goto LABEL_32;
  }
  if (v10)
  {
LABEL_46:
    if (__src != v10)
    {
      memmove(v10, __src, v11);
      size_t *v34 = v11;
    }
  }
  else
  {
    uint64_t v31 = SSLAllocBuffer(v34, v11);
    if (!v31)
    {
      uint64_t v10 = *(unsigned __int8 **)(a3 + 656);
      goto LABEL_46;
    }
    uint64_t v32 = v31;
    SSLFatalSessionAlert(80, a3);
    return v32;
  }
  return v9;
}

uint64_t SSLProcessHandshakeMessage(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a1)
  {
    case 0:
      if (*(unsigned char *)(a2 + 17)) {
        goto LABEL_45;
      }
      if (*(void *)(a1 + 8))
      {
        uint64_t v3 = 4294957496;
        goto LABEL_50;
      }
      return 0;
    case 1:
      int v7 = *(_DWORD *)(a2 + 380);
      if (v7 == 1) {
        goto LABEL_19;
      }
      if (v7 != 16) {
        goto LABEL_45;
      }
      if (*(unsigned char *)(a2 + 321)) {
LABEL_19:
      }
        uint64_t v4 = SSLProcessClientHello(*(void *)(a1 + 8), *(void *)(a1 + 16), a2);
      else {
        uint64_t v4 = SSLSendAlert(1, 100, a2);
      }
      goto LABEL_49;
    case 2:
      if (*(_DWORD *)(a2 + 380) != 6) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessServerHello(*(void *)(a1 + 8), *(void *)(a1 + 16), a2);
      goto LABEL_49;
    case 3:
      if (*(unsigned char *)(a2 + 17) || *(_DWORD *)(a2 + 380) != 6) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessServerHelloVerifyRequest(*(void *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 4:
      if (*(_DWORD *)(a2 + 380) != 13) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessNewSessionTicket(*(void *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xA:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x15:
      goto LABEL_45;
    case 0xB:
      if ((*(_DWORD *)(a2 + 380) | 2) != 0xA) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessCertificate(*(void *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 0xC:
      int v8 = *(_DWORD *)(a2 + 380);
      if (v8 != 9 && v8 != 7) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessServerKeyExchange(*(void *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 0xD:
      if (*(_DWORD *)(a2 + 380) != 9 || *(unsigned char *)(a2 + 432)) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessCertificateRequest(*(void *)(a1 + 8), *(unsigned char **)(a1 + 16), a2);
      goto LABEL_49;
    case 0xE:
      if (*(_DWORD *)(a2 + 380) != 9) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessServerHelloDone(*(void *)(a1 + 8));
      goto LABEL_49;
    case 0xF:
      if (*(_DWORD *)(a2 + 380) != 12) {
        goto LABEL_45;
      }
      uint64_t v3 = SSLProcessCertificateVerify(*(void *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      if (!v3) {
        return v3;
      }
      *(_DWORD *)(a2 + 428) = 3;
      goto LABEL_50;
    case 0x10:
      if (*(_DWORD *)(a2 + 380) != 11) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessKeyExchange(*(void *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 0x14:
      if (*(_DWORD *)(a2 + 380) != 15) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessFinished(*(void *)(a1 + 8), *(const void **)(a1 + 16), (int *)a2);
      goto LABEL_49;
    case 0x16:
      int v5 = *(_DWORD *)(a2 + 380);
      if (v5 != 9 && v5 != 7) {
        goto LABEL_45;
      }
      uint64_t v4 = SSLProcessCertificateStatus(*(void *)(a1 + 8), *(unsigned char **)(a1 + 16), a2);
      goto LABEL_49;
    default:
      if (*(_DWORD *)a1 != 67 || *(_DWORD *)(a2 + 380) != 15)
      {
LABEL_45:
        int v10 = 10;
        goto LABEL_46;
      }
      uint64_t v4 = SSLProcessEncryptedExtension(*(void *)(a1 + 8), *(const void **)(a1 + 16), a2);
LABEL_49:
      uint64_t v3 = v4;
      if (v4)
      {
LABEL_50:
        if (*(unsigned char *)(a2 + 704)) {
          return v3;
        }
        if ((int)v3 <= -9804)
        {
          if ((v3 + 9842) < 2) {
            return v3;
          }
          if (v3 == -9810)
          {
            SSLFatalSessionAlert(80, a2);
            return 4294957486;
          }
LABEL_61:
          SSLFatalSessionAlert(0, a2);
          return v3;
        }
        if (v3 == -9803) {
          return v3;
        }
        if (v3 == -9801)
        {
          SSLFatalSessionAlert(40, a2);
          return 4294957495;
        }
        if (v3 != -9800) {
          goto LABEL_61;
        }
        int v10 = 47;
LABEL_46:
        SSLFatalSessionAlert(v10, a2);
        return 4294957496;
      }
      return v3;
  }
}

uint64_t tlsPHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6, size_t a7)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = v12;
  v19[2] = v12;
  __src[2] = v12;
  v19[0] = v12;
  __src[0] = v12;
  __src[1] = v12;
  size_t __len = *(void *)a1;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *))(a1 + 16))(a1, a2, a3, &v17);
  if (!v13)
  {
    uint64_t v13 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, _OWORD *, size_t *))(a1 + 56))(v17, a4, a5, v19, &__len);
    if (!v13)
    {
      while (1)
      {
        uint64_t v14 = (*(uint64_t (**)(unint64_t))(a1 + 32))(v17);
        if (v14
          || (uint64_t v14 = (*(uint64_t (**)(unint64_t, _OWORD *, size_t))(a1 + 40))(v17, v19, __len),
              v14)
          || (uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(a1 + 40))(v17, a4, a5), v14)
          || (uint64_t v14 = (*(uint64_t (**)(unint64_t, _OWORD *, size_t *))(a1 + 48))(v17, __src, &__len),
              v14))
        {
LABEL_10:
          uint64_t v13 = v14;
          goto LABEL_11;
        }
        if (a7 <= __len) {
          break;
        }
        memmove(a6, __src, __len);
        a6 += __len;
        a7 -= __len;
        uint64_t v14 = (*(uint64_t (**)(unint64_t, _OWORD *))(a1 + 56))(v17, v19);
        if (v14) {
          goto LABEL_10;
        }
      }
      memmove(a6, __src, a7);
      uint64_t v13 = 0;
    }
LABEL_11:
    (*(void (**)(unint64_t))(a1 + 24))(v17);
  }
  return v13;
}

void HMAC_Update(HMAC_CTX *ctx, const unsigned __int8 *data, size_t len)
{
  v3[0] = len;
  v3[1] = data;
  if (ctx) {
    ((void (*)(EVP_MD_CTX *, void *))ctx->md->init)(&ctx->i_ctx, v3);
  }
}

uint64_t HashSHA384Update()
{
  return 0;
}

void HMAC_Final(HMAC_CTX *ctx, unsigned __int8 *md, unsigned int *len)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v8[0] = 48;
  v8[1] = v9;
  if (ctx && md)
  {
    if (len)
    {
      *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v9[1] = v5;
      v9[2] = v5;
      v9[0] = v5;
      v7[0] = *(void *)len;
      v7[1] = md;
      ((void (*)(EVP_MD_CTX *, void *))ctx->md->update)(&ctx->i_ctx, v8);
      ((void (*)(EVP_MD_CTX *, EVP_MD_CTX *))ctx->md->copy)(&ctx->md_ctx, &ctx->i_ctx);
      ((void (*)(EVP_MD_CTX *, void *))ctx->md->init)(&ctx->i_ctx, v8);
      uint64_t v6 = ctx->md;
      __memset_chk();
      ((void (*)(EVP_MD_CTX *, void *))v6->update)(&ctx->i_ctx, v7);
      *(void *)len = ctx->md->type;
    }
  }
}

uint64_t HashSHA384Final(uint64_t a1, void *a2)
{
  uint64_t v4 = ccsha384_di();
  (*(void (**)(uint64_t, void, void))(v4 + 56))(v4, *(void *)(a1 + 8), a2[1]);
  *a2 = *(void *)v4;
  return 0;
}

void HMAC_Init(HMAC_CTX *ctx, const void *key, int len, const EVP_MD *md)
{
  if (ctx)
  {
    p_i_ctx = &ctx->i_ctx;
    ((void (*)(EVP_MD_CTX *, const void *, void, const EVP_MD *))ctx->md->final)(&ctx->i_ctx, key, *(void *)&len, md);
    ((void (*)(unint64_t *, EVP_MD_CTX *))ctx->md->copy)(&ctx->md_ctx.flags, p_i_ctx);
  }
}

void HMAC_Hmac(HMAC_CTX *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned int *a5)
{
  if (a1)
  {
    p_i_ctx = &a1->i_ctx;
    ((void (*)(EVP_MD_CTX *))a1->md->final)(&a1->i_ctx);
    ((void (*)(unint64_t *, EVP_MD_CTX *))a1->md->copy)(&a1->md_ctx.flags, p_i_ctx);
    v11[0] = a3;
    v11[1] = a2;
    ((void (*)(EVP_MD_CTX *, void *))a1->md->init)(p_i_ctx, v11);
    HMAC_Final(a1, a4, a5);
  }
}

uint64_t HMAC_Free(void **a1)
{
  if (a1)
  {
    (*((void (**)(void **))*a1 + 5))(a1 + 1);
    (*((void (**)(void **))*a1 + 5))(a1 + 3);
    (*((void (**)(void **))*a1 + 5))(a1 + 5);
    bzero(a1[2], (size_t)a1[1]);
    bzero(a1[4], (size_t)a1[3]);
    bzero(a1[6], (size_t)a1[5]);
    sslFree(a1);
  }
  return 0;
}

uint64_t HashSHA384Close()
{
  return 0;
}

uint64_t HMAC_Alloc(uint64_t a1, char *a2, size_t a3, void *a4)
{
  v37[2] = *MEMORY[0x263EF8340];
  int v4 = *(_DWORD *)(a1 + 8) - 1;
  if (v4 > 3) {
    return 0xFFFFFFFFLL;
  }
  size_t v8 = *(void *)&SSLMACPad2[8 * v4 + 48];
  uint64_t v9 = (unsigned int *)*(&off_264124B78 + v4);
  uint64_t v10 = v9[2];
  size_t v11 = sslMalloc((3 * v10) + 56);
  if (!v11) {
    return 0xFFFFFFFFLL;
  }
  long long v12 = v11;
  int v33 = a4;
  *size_t v11 = v9;
  v11[1] = v10;
  void v11[2] = v11 + 7;
  uint64_t v13 = (char *)v11 + v10 + 56;
  v11[3] = v10;
  v11[4] = v13;
  v11[5] = v10;
  uint64_t v32 = v11 + 5;
  v11[6] = &v13[v10];
  uint64_t v14 = (void (*)(void))*((void *)v9 + 2);
  uint64_t v30 = v11 + 1;
  v14();
  uint64_t v15 = ((uint64_t (*)(void *))v14)(v12 + 3);
  uint64_t v31 = &v29;
  size_t v16 = *v9;
  unint64_t v17 = (void *)MEMORY[0x270FA5388](v15);
  if (v16) {
    unint64_t v17 = memset((char *)&v29 - ((v16 + 15) & 0x1FFFFFFF0), 170, v16);
  }
  MEMORY[0x270FA5388](v17);
  unsigned int v18 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v18, 170, v8);
  v37[0] = v8;
  v37[1] = v18;
  if (v8 < a3)
  {
    v36[0] = a3;
    v36[1] = a2;
    size_t v34 = v16;
    uint64_t v35 = (char *)&v29 - ((v16 + 15) & 0x1FFFFFFF0);
    (*((void (**)(void *, void *))v9 + 3))(v12 + 3, v36);
    (*((void (**)(void *, size_t *))v9 + 4))(v12 + 3, &v34);
    a3 = v34;
    a2 = v35;
    ((void (*)(void *))v14)(v12 + 3);
  }
  if (a3)
  {
    unint64_t v19 = a2;
    uint64_t v20 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    size_t v21 = a3;
    do
    {
      char v22 = *v19++;
      *v20++ = v22 ^ 0x5C;
      --v21;
    }
    while (v21);
  }
  size_t v23 = v8 - a3;
  memset(&v18[a3], 92, v23);
  uint64_t v24 = (void (*)(void *, void *))*((void *)v9 + 3);
  v24(v30, v37);
  if (a3)
  {
    uint64_t v25 = v18;
    size_t v26 = a3;
    do
    {
      char v27 = *a2++;
      *v25++ = v27 ^ 0x36;
      --v26;
    }
    while (v26);
  }
  memset(&v18[a3], 54, v23);
  v24(v12 + 3, v37);
  bzero(v18, a3);
  (*((void (**)(void *, void *))v9 + 6))(v12 + 3, v32);
  void *v33 = v12;
  return 0;
}

uint64_t HashSHA384Init()
{
  return 0;
}

uint64_t CCGCMSymmInit(uint64_t a1, int a2, const void *a3, _DWORD *a4, void (**a5)(void, uint64_t, uint64_t), void **a6)
{
  if (*a6) {
    sslFree(*a6);
  }
  if (a2) {
    uint64_t v12 = ccaes_gcm_encrypt_mode();
  }
  else {
    uint64_t v12 = ccaes_gcm_decrypt_mode();
  }
  uint64_t v13 = (size_t *)v12;
  uint64_t v14 = sslMalloc(0x30uLL);
  if (v14)
  {
    uint64_t v15 = v14;
    *uint64_t v14 = v13;
    v14[1] = sslMalloc(*v13);
    *((_DWORD *)v15 + 4) = *a4;
    (*a5)(a5, 8, (uint64_t)v15 + 20);
    size_t v16 = *(unsigned __int8 *)(a1 + 8);
    v15[5] = v16;
    unint64_t v17 = sslMalloc(v16);
    v15[4] = v17;
    memcpy(v17, a3, v15[5]);
    uint64_t result = 0;
    *a6 = v15;
  }
  else
  {
    __ssl_debug("sslError", "CCGCMSymmInit", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 69, "CCSymmInit: Can't allocate context\n");
    return 4294957296;
  }
  return result;
}

void *sslMalloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xC274D582uLL);
}

void __ssl_debug(const char *a1, const char *a2, uint64_t a3, uint64_t a4, char *a5, ...)
{
  va_start(va, a5);
  v8[0] = 0;
  va_copy((va_list)&v8[1], va);
  vasprintf(v8, a5, va);
  if (v8[0])
  {
    if (__ssl_debug_enabled(a1)) {
      syslog(4, "[%s] %s: %s", a1, a2, v8[0]);
    }
    for (uint64_t i = gDebugLoggers; i; uint64_t i = *(void *)(i + 16))
      (*(void (**)(void, const char *, const char *, char *))i)(*(void *)(i + 8), a1, a2, v8[0]);
    sslFree(v8[0]);
  }
}

double tls_record_advance_write_cipher(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 400);
  if (!v2 || !(*(unsigned int (**)(void))(v2 + 8))(*(void *)(a1 + 408)))
  {
    long long v4 = *(_OWORD *)(a1 + 152);
    *(_OWORD *)(a1 + 424) = *(_OWORD *)(a1 + 136);
    *(_OWORD *)(a1 + 440) = v4;
    long long v5 = *(_OWORD *)(a1 + 184);
    *(_OWORD *)(a1 + 456) = *(_OWORD *)(a1 + 168);
    *(_OWORD *)(a1 + 472) = v5;
    long long v6 = *(_OWORD *)(a1 + 120);
    *(_OWORD *)(a1 + 392) = *(_OWORD *)(a1 + 104);
    *(_OWORD *)(a1 + 408) = v6;
    long long v7 = *(_OWORD *)(a1 + 344);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a1 + 328);
    *(_OWORD *)(a1 + 152) = v7;
    long long v8 = *(_OWORD *)(a1 + 376);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a1 + 360);
    *(_OWORD *)(a1 + 184) = v8;
    long long v9 = *(_OWORD *)(a1 + 312);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a1 + 296);
    *(_OWORD *)(a1 + 120) = v9;
    *(unsigned char *)(a1 + 490) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 296) = 0u;
    *(_OWORD *)(a1 + 312) = 0u;
    *(_OWORD *)(a1 + 328) = 0u;
    *(_OWORD *)(a1 + 344) = 0u;
    *(_OWORD *)(a1 + 360) = 0u;
    *(_OWORD *)(a1 + 376) = 0u;
  }
  return result;
}

void tls_handshake_destroy(uint64_t a1)
{
  tls_metric_destroyed(a1);
  SSLResetFlight(a1);
  CloseHash((uint64_t)&SSLHashSHA1, (void *)(a1 + 568));
  CloseHash((uint64_t)&SSLHashMD5, (void *)(a1 + 584));
  CloseHash((uint64_t)&SSLHashSHA256, (void *)(a1 + 600));
  CloseHash((uint64_t)&SSLHashSHA384, (void *)(a1 + 616));
  CloseHash((uint64_t)&SSLHashSHA512, (void *)(a1 + 632));
  sslFreePubKey(a1 + 40);
  sslFreePubKey(a1 + 168);
  SSLFreeBuffer((void *)(a1 + 648));
  SSLFreeBuffer((void *)(a1 + 248));
  SSLFreeBuffer((void *)(a1 + 288));
  SSLFreeBuffer((void *)(a1 + 304));
  SSLFreeBuffer((void *)(a1 + 712));
  SSLFreeBuffer((void *)(a1 + 736));
  SSLFreeBuffer((void *)(a1 + 504));
  SSLFreeBuffer((void *)(a1 + 80));
  SSLFreeBuffer((void *)(a1 + 128));
  SSLFreeBuffer((void *)(a1 + 936));
  SSLFreeBuffer((void *)(a1 + 952));
  SSLFreeBuffer((void *)(a1 + 976));
  SSLFreeBuffer((void *)(a1 + 992));
  SSLFreeBuffer((void *)(a1 + 856));
  SSLFreeBuffer((void *)(a1 + 872));
  SSLFreeBuffer((void *)(a1 + 912));
  SSLFreeBuffer((void *)(a1 + 896));
  SSLFreeBuffer((void *)(a1 + 392));
  SSLFreeBuffer((void *)(a1 + 1048));
  SSLFreeBuffer((void *)(a1 + 1016));
  tls_free_buffer_list(*(void **)(a1 + 1032));
  tls_free_buffer_list(*(void **)(a1 + 1072));
  sslFree(*(void **)(a1 + 408));
  sslFree(*(void **)(a1 + 352));
  sslFree(*(void **)(a1 + 368));
  sslFree(*(void **)(a1 + 112));
  sslFree(*(void **)(a1 + 792));
  sslFree(*(void **)(a1 + 808));
  sslFree(*(void **)(a1 + 776));
  sslFree(*(void **)(a1 + 152));
  sslFree(*(void **)(a1 + 96));
  sslFree(*(void **)(a1 + 104));
  sslFree(*(void **)(a1 + 1080));
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (void (*)(void))v2[1];
    if (v3 && *v2) {
      v3();
    }
    sslFree(v2);
  }
  SSLFreeCertificates(*(void *)(a1 + 56));
  SSLFreeCertificates(*(void *)(a1 + 64));
  if (!*(unsigned char *)(a1 + 17)) {
    SSLFreeCertificates(*(void *)(a1 + 384));
  }

  free((void *)a1);
}

uint64_t SSLFreeBuffer(void *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = (void *)a1[1];
  if (v2) {
    free(v2);
  }
  uint64_t result = 0;
  *a1 = 0;
  a1[1] = 0;
  return result;
}

void sslFree(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t HashSHA384Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = ccsha384_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(void *)(v4 + 8) + *(void *)(v4 + 16) + 12);
  return 0;
}

uint64_t CloseHash(uint64_t a1, void *a2)
{
  if (!a2[1]) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(void *))(a1 + 40))(a2);
  if (!result)
  {
    return SSLFreeBuffer(a2);
  }
  return result;
}

uint64_t tls_free_buffer_list(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = (void *)v1[2];
      if (v3) {
        free(v3);
      }
      free(v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t sslFreePubKey(uint64_t a1)
{
  if (a1)
  {
    sslFree(*(void **)(a1 + 8));
    *(void *)(a1 + 8) = 0;
    sslFree(0);
    *(void *)(a1 + 8) = 0;
  }
  return 0;
}

void tls_metric_destroyed(uint64_t a1)
{
  if (!arc4random_uniform(0x64u))
  {
    if (*(unsigned char *)(a1 + 17)) {
      uint64_t v2 = "server_released";
    }
    else {
      uint64_t v2 = "client_released";
    }
    if (process_identifier___csops_once != -1) {
      dispatch_once(&process_identifier___csops_once, &__block_literal_global);
    }
    if (*(unsigned char *)(a1 + 16)) {
      uint64_t v3 = "dtls";
    }
    else {
      uint64_t v3 = "tls";
    }
    uint64_t v4 = tls_metric_event_new(v2, (const char *)process_identifier_data, v3);
    free(v4);
  }
}

uint64_t tls12GenerateMasterSecret(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[2] = v2;
  v13[3] = v2;
  v13[0] = v2;
  v13[1] = v2;
  v12[0] = 0xAAAAAAAAAAAAAAAALL;
  if (*(unsigned char *)(a1 + 768) && *(unsigned char *)(a1 + 769))
  {
    int v3 = *(_DWORD *)(a1 + 344);
    if (v3 == 4) {
      uint64_t v4 = &SSLHashSHA384;
    }
    else {
      uint64_t v4 = &SSLHashSHA256;
    }
    if (v3 == 4) {
      uint64_t v5 = a1 + 616;
    }
    else {
      uint64_t v5 = a1 + 600;
    }
    v12[1] = 0;
    uint64_t v6 = CloneHashState((uint64_t)v4, v5, v12);
    if (!v6)
    {
      *(void *)&v14[0] = *v4;
      *((void *)&v14[0] + 1) = v13;
      long long v7 = off_26C242598;
      if (v3 != 4) {
        long long v7 = off_26C242560;
      }
      uint64_t v8 = ((uint64_t (*)(size_t *, _OWORD *))*v7)(v12, v14);
      if (!v8) {
        uint64_t v8 = tls_handshake_internal_prf(a1, *(void *)(a1 + 512), *(void *)(a1 + 504), "extended master secret", 0x16uLL, *((void **)&v14[0] + 1), *(size_t *)&v14[0], (char *)(a1 + 520), 0x30uLL);
      }
      uint64_t v6 = v8;
      SSLFreeBuffer(v12);
    }
  }
  else
  {
    long long v9 = *(_OWORD *)(a1 + 452);
    v14[0] = *(_OWORD *)(a1 + 436);
    v14[1] = v9;
    long long v10 = *(_OWORD *)(a1 + 484);
    v14[2] = *(_OWORD *)(a1 + 468);
    v14[3] = v10;
    return tls_handshake_internal_prf(a1, *(void *)(a1 + 512), *(void *)(a1 + 504), "master secret", 0xDuLL, v14, 0x40uLL, (char *)(a1 + 520), 0x30uLL);
  }
  return v6;
}

uint64_t SSLProcessFinished(size_t size, const void *a2, int *a3)
{
  size_t v11 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = *a3;
  if ((*a3 - 769) < 3)
  {
LABEL_4:
    uint64_t v7 = 12;
    goto LABEL_5;
  }
  if (v6 != 768)
  {
    if (v6 != 65279) {
      return 4294957486;
    }
    goto LABEL_4;
  }
  uint64_t v7 = 36;
LABEL_5:
  if (size == v7)
  {
    __s1 = 0;
    uint64_t v8 = SSLAllocBuffer(&v11, size);
    if (!v8)
    {
      uint64_t v8 = (*(uint64_t (**)(int *, size_t, void *, BOOL))(*((void *)a3 + 3) + 16))(a3, v11, __s1, *((unsigned char *)a3 + 17) == 0);
      if (!v8)
      {
        if (!memcmp(__s1, a2, size))
        {
          long long v9 = (size_t *)(a3 + 218);
          SSLFreeBuffer(v9);
          uint64_t v8 = SSLCopyBuffer((uint64_t)&v11, v9);
        }
        else
        {
          __ssl_debug("sslError", "SSLProcessFinished", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeFinish.c", 235, "SSLProcessFinished: memcmp failure\n");
          uint64_t v8 = 4294957496;
        }
      }
      SSLFreeBuffer(&v11);
    }
  }
  else
  {
    __ssl_debug("sslError", "SSLProcessFinished", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeFinish.c", 224, "SSLProcessFinished: msg len error 1\n");
    return 4294957496;
  }
  return v8;
}

uint64_t SSLProcessChangeCipherSpec(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != 1 || *a2 != 1)
  {
    if (!*(unsigned char *)(a3 + 16))
    {
      SSLFatalSessionAlert(10, a3);
      __ssl_debug("sslError", "SSLProcessChangeCipherSpec", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslChangeCipher.c", 69, "***bad changeCipherSpec msg: length %d data 0x%x\n");
      return 4294957496;
    }
    return 4294957447;
  }
  if (*(unsigned char *)(a3 + 17)
    || !*(void *)(a3 + 736)
    || (*(_DWORD *)(a3 + 380) - 7) > 1
    || (int v6 = *(void (**)(void, uint64_t, uint64_t *))(a3 + 752)) == 0)
  {
LABEL_4:
    if (*(unsigned char *)(a3 + 324) && *(_DWORD *)(a3 + 380) == 14)
    {
      uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a3 + 1112) + 88))(*(void *)(a3 + 1104));
      if (!v4)
      {
        *(unsigned char *)(a3 + 324) = 0;
        *(_DWORD *)(a3 + 380) = 15;
        return v4;
      }
      goto LABEL_7;
    }
    if (!*(unsigned char *)(a3 + 16))
    {
      SSLFatalSessionAlert(10, a3);
      __ssl_debug("sslError", "SSLProcessChangeCipherSpec", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslChangeCipher.c", 110, "***bad changeCipherSpec msg: readPending.ready %d state %d\n");
      return 4294957496;
    }
    return 4294957447;
  }
  uint64_t v8 = 48;
  v6(*(void *)(a3 + 760), a3 + 520, &v8);
  *(unsigned char *)(a3 + 320) = 1;
  uint64_t v4 = ValidateSelectedCiphersuite(a3);
  if (v4) {
    return v4;
  }
  uint64_t v7 = SSLInitPendingCiphers(a3);
  if (!v7)
  {
    *(_DWORD *)(a3 + 380) = 14;
    goto LABEL_4;
  }
  uint64_t v4 = v7;
LABEL_7:
  SSLFatalSessionAlert(80, a3);
  return v4;
}

double tls_record_advance_read_cipher(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || !(*(unsigned int (**)(void))(v2 + 8))(*(void *)(a1 + 24)))
  {
    long long v4 = *(_OWORD *)(a1 + 248);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a1 + 232);
    *(_OWORD *)(a1 + 56) = v4;
    long long v5 = *(_OWORD *)(a1 + 216);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a1 + 200);
    *(_OWORD *)(a1 + 24) = v5;
    long long v6 = *(_OWORD *)(a1 + 280);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a1 + 264);
    *(_OWORD *)(a1 + 88) = v6;
    double result = 0.0;
    *(_OWORD *)(a1 + 200) = 0u;
    *(_OWORD *)(a1 + 216) = 0u;
    *(_OWORD *)(a1 + 232) = 0u;
    *(_OWORD *)(a1 + 248) = 0u;
    *(_OWORD *)(a1 + 264) = 0u;
    *(_OWORD *)(a1 + 280) = 0u;
  }
  return result;
}

void tls_record_destroy(void *a1)
{
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(void))(v2 + 8))(a1[3]);
  }
  uint64_t v3 = a1[14];
  if (v3) {
    (*(void (**)(void))(v3 + 8))(a1[15]);
  }
  uint64_t v4 = a1[26];
  if (v4) {
    (*(void (**)(void))(v4 + 8))(a1[27]);
  }
  uint64_t v5 = a1[38];
  if (v5) {
    (*(void (**)(void))(v5 + 8))(a1[39]);
  }
  uint64_t v6 = a1[50];
  if (v6) {
    (*(void (**)(void))(v6 + 8))(a1[51]);
  }

  sslFree(a1);
}

uint64_t CCSymmFinish(void *a1)
{
  if (a1)
  {
    cc_clear();
    sslFree(a1);
  }
  return 0;
}

uint64_t CCSymmFinish_0(void **a1)
{
  if (a1)
  {
    cc_clear();
    sslFree(a1[1]);
    cc_clear();
    sslFree(a1[4]);
    sslFree(a1);
  }
  return 0;
}

uint64_t NullFinish()
{
  return 0;
}

uint64_t SSLProcessCertificateVerify(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v15[2] = v4;
  v15[3] = v4;
  v15[0] = v4;
  v15[1] = v4;
  if (*(unsigned char *)(a3 + 16)) {
    unsigned int v5 = 65279;
  }
  else {
    unsigned int v5 = 770;
  }
  if (*(_DWORD *)a3 <= v5)
  {
    uint64_t v6 = 0;
    int v7 = 0;
    unint64_t v8 = (unint64_t)a2;
  }
  else
  {
    if (a1 <= 1)
    {
      __ssl_debug("sslError", "SSLProcessCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 677, "SSLProcessCertificateVerify: msg len error 1\n");
      return 4294957496;
    }
    uint64_t v6 = *a2;
    unint64_t v8 = (unint64_t)(a2 + 2);
    int v7 = a2[1];
  }
  if (v8 + 2 > (unint64_t)&a2[a1])
  {
    __ssl_debug("sslError", "SSLProcessCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 685, "SSLProcessCertificateVerify: msg len error\n");
    return 4294957496;
  }
  if (v8 + 2 + SSLDecodeSize(v8, 2) > (unint64_t)&a2[a1])
  {
    __ssl_debug("sslError", "SSLProcessCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 692, "SSLProcessCertificateVerify: sig len error 1\n");
    return 4294957496;
  }
  v14[0] = 64;
  v14[1] = v15;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(*(void *)(a3 + 24) + 24))(a3, v14, v6);
  if (!v9)
  {
    if (*(unsigned char *)(a3 + 16)) {
      unsigned int v11 = 65279;
    }
    else {
      unsigned int v11 = 770;
    }
    uint64_t v12 = a3 + 40;
    if (*(_DWORD *)a3 > v11 && v7 == 1) {
      uint64_t v13 = sslRsaVerify(v12);
    }
    else {
      uint64_t v13 = sslRawVerify(v12);
    }
    uint64_t v9 = v13;
    if (v13) {
      SSLFatalSessionAlert(51, a3);
    }
  }
  return v9;
}

uint64_t tls12ComputeCertVfyMac(uint64_t a1, void *a2, int a3)
{
  v8[1] = 0;
  uint64_t v3 = 4294957486;
  switch(a3)
  {
    case 2:
      uint64_t v5 = a1 + 568;
      uint64_t v6 = &SSLHashSHA1;
      goto LABEL_6;
    case 4:
      uint64_t v5 = a1 + 600;
      uint64_t v6 = &SSLHashSHA256;
      goto LABEL_6;
    case 5:
      uint64_t v5 = a1 + 616;
      uint64_t v6 = &SSLHashSHA384;
      goto LABEL_6;
    case 6:
      uint64_t v5 = a1 + 632;
      uint64_t v6 = &SSLHashSHA512;
LABEL_6:
      v8[0] = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v3 = CloneHashState((uint64_t)v6, v5, v8);
      if (!v3)
      {
        *a2 = *v6;
        uint64_t v3 = (*((uint64_t (**)(uint64_t, void *))v6 + 4))((uint64_t)v8, a2);
      }
      SSLFreeBuffer(v8);
      break;
    default:
      return v3;
  }
  return v3;
}

uint64_t HashSHA256Final(uint64_t a1, void *a2)
{
  uint64_t v4 = ccsha256_di();
  (*(void (**)(uint64_t, void, void))(v4 + 56))(v4, *(void *)(a1 + 8), a2[1]);
  *a2 = *(void *)v4;
  return 0;
}

uint64_t sslRsaVerify(uint64_t a1)
{
  if (*(unsigned char *)a1 && *(void *)(a1 + 8))
  {
    uint64_t v1 = ccrsa_verify_pkcs1v15();
    if (v1)
    {
      uint64_t v2 = v1;
      __ssl_debug("sslError", "sslRsaVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 535, "sslRsaVerify: ccrsa_verify_pkcs1v15 failed (error %d)\n", v1);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    __ssl_debug("sslError", "sslRsaVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 528, "Internal Error: Invalid RSA public key\n");
    return 4294957486;
  }
  return v2;
}

uint64_t SSLInitPendingCiphers(uint64_t a1)
{
  size_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = 0;
  uint64_t v2 = SSLAllocBuffer(&v4, 2* (*(unsigned __int8 *)(a1 + 340)+ (unint64_t)*(unsigned __int8 *)(a1 + 343)+ *(unsigned __int8 *)(a1 + 341)));
  if (!v2)
  {
    uint64_t v2 = (**(uint64_t (***)(size_t, uint64_t, uint64_t))(a1 + 24))(v4, v5, a1);
    if (!v2)
    {
      uint64_t v2 = (*(uint64_t (**)(void, void, void, size_t, uint64_t))(*(void *)(a1 + 1112) + 64))(*(void *)(a1 + 1104), *(unsigned __int16 *)(a1 + 328), *(unsigned __int8 *)(a1 + 17), v4, v5);
      if (!v2) {
        *(_WORD *)(a1 + 324) = 257;
      }
    }
    SSLFreeBuffer(&v4);
  }
  return v2;
}

uint64_t tls1GenerateKeyMaterial(size_t a1, char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)(a3 + 484);
  long long v7 = *(_OWORD *)(a3 + 468);
  long long v8 = v3;
  long long v4 = *(_OWORD *)(a3 + 452);
  long long v9 = *(_OWORD *)(a3 + 436);
  qmemcpy(v6, "key expansion", sizeof(v6));
  long long v10 = v4;
  return tls_handshake_internal_prf(a3, a3 + 520, 0x30uLL, 0, 0, v6, 0x4DuLL, a2, a1);
}

uint64_t SSLEncodeChangeCipherSpec(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 1;
  uint64_t result = SSLAllocBuffer((size_t *)a1, 1uLL);
  if (!result)
  {
    **(unsigned char **)(a1 + 8) = 1;
    *(unsigned char *)(a2 + 672) = 1;
  }
  return result;
}

uint64_t HashSHA512Close()
{
  return 0;
}

uint64_t HashSHA256Close()
{
  return 0;
}

uint64_t HashSHA256Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = ccsha256_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(void *)(v4 + 8) + *(void *)(v4 + 16) + 12);
  return 0;
}

uint64_t HashMD5Close()
{
  return 0;
}

unsigned __int16 *tls_record_create(char a1, uint64_t a2)
{
  uint64_t v4 = (unsigned __int16 *)sslMalloc(0x1F8uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    *((void *)v4 + 62) = 0;
    *((_OWORD *)v4 + 29) = 0u;
    *((_OWORD *)v4 + 30) = 0u;
    *((_OWORD *)v4 + 27) = 0u;
    *((_OWORD *)v4 + 28) = 0u;
    *((_OWORD *)v4 + 25) = 0u;
    *((_OWORD *)v4 + 26) = 0u;
    *((_OWORD *)v4 + 23) = 0u;
    *((_OWORD *)v4 + 24) = 0u;
    *((_OWORD *)v4 + 21) = 0u;
    *((_OWORD *)v4 + 22) = 0u;
    *((_OWORD *)v4 + 19) = 0u;
    *((_OWORD *)v4 + 20) = 0u;
    *((_OWORD *)v4 + 17) = 0u;
    *((_OWORD *)v4 + 18) = 0u;
    *((_OWORD *)v4 + 15) = 0u;
    *((_OWORD *)v4 + 16) = 0u;
    *((_OWORD *)v4 + 13) = 0u;
    *((_OWORD *)v4 + 14) = 0u;
    *((_OWORD *)v4 + 11) = 0u;
    *((_OWORD *)v4 + 12) = 0u;
    *((_OWORD *)v4 + 9) = 0u;
    *((_OWORD *)v4 + 10) = 0u;
    *((_OWORD *)v4 + 7) = 0u;
    *((_OWORD *)v4 + 8) = 0u;
    *((_OWORD *)v4 + 5) = 0u;
    *((_OWORD *)v4 + 6) = 0u;
    *((_OWORD *)v4 + 3) = 0u;
    *((_OWORD *)v4 + 4) = 0u;
    *((_OWORD *)v4 + 1) = 0u;
    *((_OWORD *)v4 + 2) = 0u;
    *(_OWORD *)uint64_t v4 = 0u;
    *((_DWORD *)v4 + 123) = 0;
    *uint64_t v4 = 0;
    *((void *)v4 + 13) = sslCipherSuiteGetDigestInfo(0);
    *((void *)v5 + 1) = sslCipherSuiteGetDigestInfo(*v5);
    *((void *)v5 + 2) = sslCipherSuiteGetSymmetricCipher(*v5);
    *((void *)v5 + 14) = sslCipherSuiteGetSymmetricCipher(*v5);
    *((unsigned char *)v5 + 32) = 0;
    *((unsigned char *)v5 + 128) = 1;
    *((unsigned char *)v5 + 488) = a1;
    *((void *)v5 + 62) = a2;
  }
  return v5;
}

uint64_t tls_record_init_pending_ciphers(uint64_t a1, int a2, int a3, uint64_t a4, char *a5)
{
  *(_WORD *)a1 = a2;
  *(void *)(a1 + 200) = sslCipherSuiteGetDigestInfo(a2);
  *(void *)(a1 + 296) = sslCipherSuiteGetDigestInfo(a2);
  *(void *)(a1 + 208) = sslCipherSuiteGetSymmetricCipher(a2);
  *(void *)(a1 + 304) = sslCipherSuiteGetSymmetricCipher(a2);
  *(unsigned char *)(a1 + 224) = 0;
  *(unsigned char *)(a1 + 320) = 1;
  if (*(unsigned char *)(a1 + 488))
  {
    *(void *)(a1 + 232) = ((unint64_t)*(unsigned __int16 *)(a1 + 238) << 48) + 0x1000000000000;
    *(void *)(a1 + 328) = ((unint64_t)*(unsigned __int16 *)(a1 + 334) << 48) + 0x1000000000000;
  }
  else
  {
    *(void *)(a1 + 328) = 0;
    *(void *)(a1 + 232) = 0;
  }
  BOOL v10 = a3 == 0;
  if (a3) {
    uint64_t v11 = a1 + 296;
  }
  else {
    uint64_t v11 = a1 + 200;
  }
  if (v10) {
    uint64_t v12 = a1 + 296;
  }
  else {
    uint64_t v12 = a1 + 200;
  }
  uint64_t v13 = *(unsigned __int8 ***)(a1 + 208);
  uint64_t v14 = *v13;
  if (*((_DWORD *)*v13 + 1) == 2)
  {
    uint64_t v15 = *((unsigned __int8 *)v14 + 8);
    if (a4 != 2 * (*((unsigned __int8 *)v14 + 9) + v15)) {
      return 4294957296;
    }
  }
  else
  {
    size_t v16 = **(void **)(a1 + 200);
    if (a4 != 2 * (v16 + *((unsigned __int8 *)v14 + 8) + *((unsigned __int8 *)v14 + 9))) {
      return 4294957296;
    }
    memcpy((void *)(v12 + 41), a5, v16);
    size_t v17 = **(void **)(a1 + 200);
    unsigned int v18 = &a5[v17];
    memcpy((void *)(v11 + 41), v18, v17);
    uint64_t v13 = *(unsigned __int8 ***)(a1 + 208);
    a5 = &v18[**(void **)(a1 + 200)];
    uint64_t v15 = (*v13)[8];
  }
  unint64_t v19 = &a5[v15];
  uint64_t result = ((uint64_t (*)(void, void, char *, char *, void, uint64_t))v13[2])(**(void **)(v12 + 8), *(unsigned __int8 *)(v12 + 24), a5, &a5[v15 + v15], *(void *)(a1 + 496), v12 + 16);
  if (!result)
  {
    size_t v21 = *(_DWORD ***)(a1 + 208);
    uint64_t v22 = -8;
    if ((*v21)[1] != 2) {
      uint64_t v22 = 0;
    }
    uint64_t result = ((uint64_t (*)(void, void, char *, char *, void, uint64_t))v21[2])(**(void **)(v11 + 8), *(unsigned __int8 *)(v11 + 24), v19, &v19[*((unsigned __int8 *)*v21 + 8) + (unint64_t)*((unsigned __int8 *)*v21 + 9) + v22], *(void *)(a1 + 496), v11 + 16);
    if (!result)
    {
      *(unsigned char *)(a1 + 336) = 1;
      *(unsigned char *)(a1 + 240) = 1;
    }
  }
  return result;
}

_UNKNOWN **sslCipherSuiteGetSymmetricCipher(int a1)
{
  unsigned int v1 = sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 4;
  if (v1 > 4) {
    return &SSLCipherNull;
  }
  else {
    return (_UNKNOWN **)off_264124238[v1];
  }
}

uint64_t sslCipherSuiteGetDigestInfo(int a1)
{
  int MacAlgorithm = sslCipherSuiteGetMacAlgorithm(a1);
  uint64_t v2 = &null_di;
  switch(MacAlgorithm)
  {
    case 0:
      goto LABEL_6;
    case 1:
      uint64_t result = ccmd5_di();
      break;
    case 2:
      uint64_t result = ccsha1_di();
      break;
    case 3:
      uint64_t result = ccsha256_di();
      break;
    case 4:
      uint64_t result = ccsha384_di();
      break;
    default:
      __ssl_debug("sslError", "sslCipherSuiteGetDigestInfo", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/tls_record.c", 64, "Invalid hashAlgorithm %d", MacAlgorithm);
      uint64_t v2 = 0;
LABEL_6:
      uint64_t result = (uint64_t)v2;
      break;
  }
  return result;
}

uint64_t SSLProcessCertificate(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 > 2)
  {
    unint64_t v6 = SSLDecodeInt(a2, 3);
    if (v6 + 3 != a1)
    {
      __ssl_debug("sslError", "SSLProcessCertificate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 208, "SSLProcessCertificate: length decode error 1\n");
      return 4294957496;
    }
    uint64_t v11 = (void *)0xAAAAAAAAAAAAAAAALL;
    uint64_t result = SSLDecodeBufferList(a2 + 3, v6, 3, (void ***)&v11);
    if (result) {
      return result;
    }
    uint64_t v8 = *(void *)(a3 + 64);
    if (*(unsigned char *)(a3 + 888))
    {
      if (v8)
      {
LABEL_21:
        tls_free_buffer_list(*(void **)(a3 + 64));
        uint64_t result = 0;
        *(void *)(a3 + 64) = v11;
        return result;
      }
    }
    else if (v8)
    {
      unint64_t v9 = (unint64_t)v11;
      while (v8)
      {
        if (!v9) {
          break;
        }
        size_t v10 = *(void *)(v8 + 8);
        if (v10 != *(void *)(v9 + 8) || memcmp(*(const void **)(v8 + 16), *(const void **)(v9 + 16), v10)) {
          break;
        }
        uint64_t v8 = *(void *)v8;
        unint64_t v9 = *(void *)v9;
        if (!(v8 | v9)) {
          goto LABEL_21;
        }
      }
      __ssl_debug("sslError", "SSLProcessCertificate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 232, "Illegal server identity change during renegotiation\n");
      tls_free_buffer_list(v11);
      return 4294957496;
    }
    if (__ssl_debug_enabled("sslLogNegotiateDebug")) {
      debug_log_chain(v11);
    }
    goto LABEL_21;
  }
  __ssl_debug("sslError", "SSLProcessCertificate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 200, "SSLProcessCertificate: message length decode error\n");
  return 4294957496;
}

uint64_t __ssl_debug_enabled(const char *a1)
{
  pthread_once(&__ssl_debug_enabled___security_debug_once, (void (*)(void))__security_debug_init);
  if (__ssl_debug_all) {
    return 1;
  }
  uint64_t result = gDebugScope;
  if (gDebugScope)
  {
    uint64_t result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)gDebugScope, a1);
    if (result) {
      return 1;
    }
  }
  return result;
}

uint64_t SSLInitMessageHashes(size_t *a1)
{
  uint64_t v2 = a1 + 71;
  uint64_t result = CloseHash((uint64_t)&SSLHashSHA1, a1 + 71);
  if (!result)
  {
    uint64_t v4 = a1 + 73;
    uint64_t result = CloseHash((uint64_t)&SSLHashMD5, a1 + 73);
    if (!result)
    {
      uint64_t v5 = a1 + 75;
      uint64_t result = CloseHash((uint64_t)&SSLHashSHA256, a1 + 75);
      if (!result)
      {
        unint64_t v6 = a1 + 77;
        uint64_t result = CloseHash((uint64_t)&SSLHashSHA384, a1 + 77);
        if (!result)
        {
          long long v7 = a1 + 79;
          uint64_t result = CloseHash((uint64_t)&SSLHashSHA512, v7);
          if (!result)
          {
            uint64_t result = ReadyHash((uint64_t)&SSLHashSHA1, v2);
            if (!result)
            {
              uint64_t result = ReadyHash((uint64_t)&SSLHashMD5, v4);
              if (!result)
              {
                uint64_t result = ReadyHash((uint64_t)&SSLHashSHA256, v5);
                if (!result)
                {
                  uint64_t result = ReadyHash((uint64_t)&SSLHashSHA384, v6);
                  if (!result)
                  {
                    return ReadyHash((uint64_t)&SSLHashSHA512, v7);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t SSLEncodeServerHelloDone(size_t *a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 16)) {
    size_t v4 = 12;
  }
  else {
    size_t v4 = 4;
  }
  uint64_t v5 = SSLAllocBuffer(a1, v4);
  if (!v5) {
    SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 14, 0);
  }
  return v5;
}

uint64_t SSLDecodeBufferList(unsigned __int8 *a1, unint64_t a2, int a3, void ***a4)
{
  if (!a2)
  {
    size_t v17 = 0;
LABEL_13:
    uint64_t v18 = 0;
    *a4 = v17;
    return v18;
  }
  unint64_t v5 = a2;
  long long v7 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = a3;
  while (1)
  {
    if (v5 < v9)
    {
      __ssl_debug("sslError", "SSLDecodeBufferList", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslDecode.c", 72, "SSLDecodeBufferList: length decode error 2\n");
LABEL_17:
      uint64_t v18 = 4294957496;
      goto LABEL_20;
    }
    unsigned int v10 = SSLDecodeInt(a1, v9);
    unint64_t v11 = v9 + v10;
    if (v5 < v11)
    {
      __ssl_debug("sslError", "SSLDecodeBufferList", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslDecode.c", 79, "SSLDecodeBufferList: length decode error 3\n");
      goto LABEL_17;
    }
    size_t v12 = v10;
    if (!v10)
    {
      __ssl_debug("sslError", "SSLDecodeBufferList", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslDecode.c", 84, "SSLDecodeBufferList: lenght decode error 4 (empty item)\n");
      goto LABEL_17;
    }
    uint64_t v13 = (size_t *)sslMalloc(0x18uLL);
    if (!v13)
    {
      uint64_t v18 = 4294967188;
      goto LABEL_20;
    }
    uint64_t v14 = (void **)v13;
    uint64_t v15 = SSLAllocBuffer(v13 + 1, v12);
    if (v15) {
      break;
    }
    size_t v16 = &a1[v9];
    *uint64_t v14 = 0;
    memcpy(v14[2], v16, v12);
    size_t v17 = v14;
    if (v8)
    {
      *long long v7 = v14;
      size_t v17 = v8;
    }
    a1 = &v16[v12];
    long long v7 = v14;
    uint64_t v8 = v17;
    v5 -= v11;
    if (!v5) {
      goto LABEL_13;
    }
  }
  uint64_t v18 = v15;
  sslFree(v14);
LABEL_20:
  tls_free_buffer_list(v8);
  return v18;
}

uint64_t HashSHA512Init()
{
  return 0;
}

uint64_t HashSHA1Init()
{
  return 0;
}

uint64_t HashMD5Init()
{
  return 0;
}

uint64_t HashSHA1Close()
{
  return 0;
}

uint64_t tls_handshake_set_min_protocol_version(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)(a1 + 8) = a2;
  unsigned int v2 = *(_DWORD *)(a1 + 12);
  if (!*(unsigned char *)(a1 + 16))
  {
    if (v2 >= a2) {
      return 0;
    }
    goto LABEL_3;
  }
  if (v2 > a2) {
LABEL_3:
  }
    *(_DWORD *)(a1 + 12) = a2;
  return 0;
}

uint64_t tls_handshake_set_max_protocol_version(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)(a1 + 12) = a2;
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (!*(unsigned char *)(a1 + 16))
  {
    if (v2 <= a2) {
      return 0;
    }
    goto LABEL_3;
  }
  if (v2 < a2) {
LABEL_3:
  }
    *(_DWORD *)(a1 + 8) = a2;
  return 0;
}

void tls_private_key_destroy(void *a1)
{
  unsigned int v2 = (void (*)(void))a1[1];
  if (v2 && *a1) {
    v2();
  }

  sslFree(a1);
}

uint64_t tls_handshake_set_peer_rsa_public_key(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1 + 40;
  sslFreePubKey(a1 + 40);

  return sslGetPubKeyFromBits(a2, a3, v5);
}

uint64_t tls_cache_cleanup(uint64_t a1)
{
  unsigned int v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  SessionCacheCleanup((void **)a1);

  return pthread_mutex_unlock(v2);
}

uint64_t SessionCacheCleanup(void **a1)
{
  time_t v2 = time(0);
  long long v3 = *a1;
  if (*a1)
  {
    time_t v4 = v2;
    char v5 = 0;
    do
    {
      if (v3[5] >= v4)
      {
        char v5 = 1;
        a1 = (void **)v3;
      }
      else
      {
        *a1 = (void *)*v3;
        SSLFreeBuffer(v3 + 1);
        SSLFreeBuffer(v3 + 3);
        sslFree(v3);
      }
      long long v3 = *a1;
    }
    while (*a1);
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t sslGetPubKeyFromBits(void *a1, uint64_t a2, uint64_t a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (!a3) {
    return 4294967246;
  }
  unint64_t v4 = *a1 + 7;
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  unint64_t v7 = (8 * (v4 >> 3) + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v4 > 7)
  {
    size_t v9 = ((v6 - 1) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = memset((char *)v13 - v7, 170, v9);
    MEMORY[0x270FA5388](v10);
    memset((char *)v13 - v7, 170, v9);
  }
  else
  {
    MEMORY[0x270FA5388](v5);
  }
  if (ccn_read_uint()
    || ccn_read_uint()
    || (unint64_t)ccn_bitlen() < 2
    || (unint64_t v11 = sslMalloc(3 * (v4 & 0xFFFFFFFFFFFFFFF8) + 40)) == 0)
  {
    __ssl_debug("sslError", "sslGetPubKeyFromBits", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 742, "sslGetPubKeyFromBits: SecKeyCreateRSAPublicKey failed\n");
    return 4294957487;
  }
  else
  {
    size_t v12 = v11;
    *unint64_t v11 = v4 >> 3;
    ccrsa_init_pub();
    uint64_t result = 0;
    *(unsigned char *)a3 = 1;
    *(void *)(a3 + 8) = v12;
  }
  return result;
}

void tls_metric_event_add_string(const char **a1, const char *a2, char *a3, ...)
{
  va_start(va, a3);
  v5[0] = 0;
  va_copy((va_list)&v5[1], va);
  vasprintf(v5, a3, va);
  if (v5[0])
  {
    ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s=%s.%s", *a1, a1[1], a2, v5[0], a1[2]);
    free(v5[0]);
  }
}

void tls_metric_client_finished(uint64_t a1)
{
  if (arc4random_uniform(0x64u) > 9) {
    return;
  }
  int KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(*(unsigned __int16 *)(a1 + 328));
  if (KeyExchangeMethod == 17 || KeyExchangeMethod == 15)
  {
    int v4 = *(_DWORD *)(a1 + 144);
    if (v4 > 23)
    {
      if (v4 == 24)
      {
        int v28 = 0;
        char v5 = 0;
        uint64_t v6 = "p384";
        goto LABEL_26;
      }
      if (v4 == 25)
      {
        int v28 = 0;
        char v5 = 0;
        uint64_t v6 = "p521";
        goto LABEL_26;
      }
    }
    else
    {
      if (v4 == -1)
      {
LABEL_25:
        int v28 = 0;
        uint64_t v6 = 0;
        char v5 = 1;
        goto LABEL_26;
      }
      if (v4 == 23)
      {
        int v28 = 0;
        char v5 = 0;
        uint64_t v6 = "p256";
        goto LABEL_26;
      }
    }
    int v28 = 0;
    char v5 = 0;
    uint64_t v6 = "other";
    goto LABEL_26;
  }
  if (KeyExchangeMethod != 9 || !*(void *)(a1 + 96)) {
    goto LABEL_25;
  }
  unint64_t v7 = cczp_bitlen();
  if (v7 < 0x800) {
    int v8 = 4;
  }
  else {
    int v8 = 5;
  }
  if (v7 >= 0x400) {
    int v9 = v8;
  }
  else {
    int v9 = 3;
  }
  if (v7 >= 0x300) {
    int v10 = v9;
  }
  else {
    int v10 = 2;
  }
  if (v7 < 0x200) {
    int v10 = 1;
  }
  int v28 = v10;
  char v5 = 1;
  uint64_t v6 = 0;
LABEL_26:
  uint64_t v11 = *(unsigned int *)(a1 + 772);
  if (v11)
  {
    int v12 = 0;
    int v13 = 0;
    char v14 = 0;
    uint64_t v15 = *(int **)(a1 + 776);
    do
    {
      int v17 = *v15++;
      int v16 = v17;
      BOOL v18 = v17 == 64;
      if (v17 == 64) {
        int v19 = 1;
      }
      else {
        int v19 = v13;
      }
      if (v18) {
        int v20 = v12;
      }
      else {
        int v20 = 1;
      }
      if (v16 == 1)
      {
        char v14 = 1;
      }
      else
      {
        int v13 = v19;
        int v12 = v20;
      }
      --v11;
    }
    while (v11);
  }
  else
  {
    char v14 = 0;
    LOBYTE(v13) = 0;
    LOBYTE(v12) = 0;
  }
  int v21 = *(_DWORD *)(a1 + 784);
  if (v21 == -1)
  {
    size_t v23 = 0;
    char v22 = 1;
  }
  else if (v21 == 1)
  {
    char v22 = 0;
    size_t v23 = "rsa";
  }
  else
  {
    char v22 = 0;
    if (v21 == 64) {
      size_t v23 = "ecc";
    }
    else {
      size_t v23 = "other";
    }
  }
  if (*(void *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v24 = "rsa";
    }
    else {
      uint64_t v24 = "ecc";
    }
  }
  else
  {
    uint64_t v24 = "none";
  }
  if (process_identifier___csops_once != -1) {
    dispatch_once(&process_identifier___csops_once, &__block_literal_global);
  }
  if (*(unsigned char *)(a1 + 16)) {
    uint64_t v25 = "dtls";
  }
  else {
    uint64_t v25 = "tls";
  }
  size_t v26 = (const char **)tls_metric_event_new("client_finished", (const char *)process_identifier_data, v25);
  if (v26)
  {
    char v27 = v26;
    tls_metric_event_add_string(v26, "config", "%d", *(_DWORD *)(a1 + 1092));
    tls_metric_event_add_string(v27, "pv", "%04x", *(_DWORD *)a1);
    tls_metric_event_add_string(v27, "cs", "%04x", *(unsigned __int16 *)(a1 + 328));
    tls_metric_event_add_string(v27, "key_type", "%s", v24);
    if (*(void *)(a1 + 824)) {
      tls_metric_event_add_string(v27, "kxSigAlg", "%02x_%02x", *(_DWORD *)(a1 + 824), *(_DWORD *)(a1 + 828));
    }
    if (*(void *)(a1 + 816)) {
      tls_metric_event_add_string(v27, "certSigAlg", "%02x_%02x", *(_DWORD *)(a1 + 816), *(_DWORD *)(a1 + 820));
    }
    if (v28) {
      tls_metric_event_add_string(v27, "dhe_bucket", "%d", v28);
    }
    if (v5)
    {
      if (v22) {
        goto LABEL_69;
      }
    }
    else
    {
      tls_metric_event_add_string(v27, "curve", "%s", v6);
      if (v22)
      {
LABEL_69:
        if ((v14 & 1) == 0) {
          goto LABEL_70;
        }
        goto LABEL_97;
      }
    }
    tls_metric_event_add_string(v27, "neg_client_cert", "%s", v23);
    if ((v14 & 1) == 0)
    {
LABEL_70:
      if ((v13 & 1) == 0) {
        goto LABEL_71;
      }
      goto LABEL_98;
    }
LABEL_97:
    ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "req_client_cert_rsa", v27[2]);
    if ((v13 & 1) == 0)
    {
LABEL_71:
      if ((v12 & 1) == 0)
      {
LABEL_73:
        if (*(unsigned char *)(a1 + 931)) {
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "npn_confirmed", v27[2]);
        }
        if (*(unsigned char *)(a1 + 971)) {
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "alpn_received", v27[2]);
        }
        if (*(unsigned char *)(a1 + 1009)) {
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "ocsp_peer_enabled", v27[2]);
        }
        if (*(unsigned char *)(a1 + 1040)) {
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "ocsp_response_received", v27[2]);
        }
        if (*(unsigned char *)(a1 + 1067)) {
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "sct_peer_enabled", v27[2]);
        }
        if (*(void *)(a1 + 1072)) {
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "sct_list", v27[2]);
        }
        if (*(unsigned char *)(a1 + 707)) {
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "sessionticket_confirmed", v27[2]);
        }
        if (*(void *)(a1 + 952)) {
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "npnpeerdata", v27[2]);
        }
        if (*(void *)(a1 + 712)) {
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "sessionticket", v27[2]);
        }
        free(v27);
        return;
      }
LABEL_72:
      ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "req_client_cert_other", v27[2]);
      goto LABEL_73;
    }
LABEL_98:
    ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "req_client_cert_ecc", v27[2]);
    if ((v12 & 1) == 0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
}

void *SessionCacheInit(void *result)
{
  *uint64_t result = 0;
  result[1] = 600;
  return result;
}

uint64_t SessionCacheAddEntry(size_t **a1, size_t *a2, uint64_t a3, size_t *a4)
{
  uint64_t v8 = (uint64_t)a1;
  do
  {
    uint64_t v8 = *(void *)v8;
    if (!v8)
    {
      time_t v11 = time(0);
      if (!a4) {
        a4 = a1[1];
      }
      int v12 = (size_t *)sslMalloc(0x30uLL);
      if (!v12) {
        goto LABEL_16;
      }
      if (!SSLCopyBuffer((uint64_t)a2, v12 + 1))
      {
        if (!SSLCopyBuffer(a3, v12 + 3))
        {
          v12[5] = (size_t)a4 + v11;
          goto LABEL_16;
        }
        SSLFreeBuffer(v12 + 1);
      }
      sslFree(v12);
      int v12 = 0;
LABEL_16:
      *int v12 = (size_t)*a1;
      *a1 = v12;
      return 0;
    }
  }
  while (!SessionCacheEntryMatchKey(v8, a2));
  size_t v9 = *(void *)(v8 + 24);
  if (v9 == *(void *)a3 && !memcmp(*(const void **)(v8 + 32), *(const void **)(a3 + 8), v9)) {
    return 0;
  }
  SSLFreeBuffer((void *)(v8 + 24));

  return SSLCopyBuffer(a3, (size_t *)(v8 + 24));
}

const void *SessionCacheEntryMatchKey(uint64_t a1, size_t *a2)
{
  size_t v2 = *a2;
  if (*a2 != *(void *)(a1 + 8)) {
    return 0;
  }
  uint64_t result = (const void *)a2[1];
  if (!result) {
    return result;
  }
  char v5 = *(const void **)(a1 + 16);
  if (v5) {
    return (const void *)(memcmp(result, v5, v2) == 0);
  }
  else {
    return 0;
  }
}

uint64_t SessionCacheLookupEntry(void *a1, size_t *a2, size_t *a3)
{
  do
  {
    uint64_t v6 = a1;
    a1 = (void *)*a1;
    if (!a1) {
      return 4294957492;
    }
  }
  while (!SessionCacheEntryMatchKey((uint64_t)a1, a2));
  if (a1[5] < time(0))
  {
    *uint64_t v6 = *a1;
    SSLFreeBuffer(a1 + 1);
    SSLFreeBuffer(a1 + 3);
    sslFree(a1);
    return 4294957492;
  }

  return SSLCopyBuffer((uint64_t)(a1 + 3), a3);
}

uint64_t SessionCacheDeleteEntry(void *a1, size_t *a2)
{
  while (1)
  {
    int v4 = a1;
    a1 = (void *)*a1;
    if (!a1) {
      break;
    }
    if (SessionCacheEntryMatchKey((uint64_t)a1, a2))
    {
      *int v4 = *a1;
      SSLFreeBuffer(a1 + 1);
      SSLFreeBuffer(a1 + 3);
      sslFree(a1);
      return 0;
    }
  }
  return 0;
}

void SessionCacheEmpty(void **a1)
{
  for (uint64_t i = *a1; *a1; uint64_t i = *a1)
  {
    *a1 = (void *)*i;
    SSLFreeBuffer(i + 1);
    SSLFreeBuffer(i + 3);
    sslFree(i);
  }
}

double tls_record_rollback_write_cipher(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 304);
  if (!v2 || !(*(unsigned int (**)(void))(v2 + 8))(*(void *)(a1 + 312)))
  {
    long long v4 = *(_OWORD *)(a1 + 152);
    *(_OWORD *)(a1 + 328) = *(_OWORD *)(a1 + 136);
    *(_OWORD *)(a1 + 344) = v4;
    long long v5 = *(_OWORD *)(a1 + 184);
    *(_OWORD *)(a1 + 360) = *(_OWORD *)(a1 + 168);
    *(_OWORD *)(a1 + 376) = v5;
    long long v6 = *(_OWORD *)(a1 + 120);
    *(_OWORD *)(a1 + 296) = *(_OWORD *)(a1 + 104);
    *(_OWORD *)(a1 + 312) = v6;
    long long v7 = *(_OWORD *)(a1 + 440);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a1 + 424);
    *(_OWORD *)(a1 + 152) = v7;
    long long v8 = *(_OWORD *)(a1 + 472);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a1 + 456);
    *(_OWORD *)(a1 + 184) = v8;
    long long v9 = *(_OWORD *)(a1 + 408);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a1 + 392);
    *(_OWORD *)(a1 + 120) = v9;
    double result = 0.0;
    *(_OWORD *)(a1 + 456) = 0u;
    *(_OWORD *)(a1 + 472) = 0u;
    *(_OWORD *)(a1 + 424) = 0u;
    *(_OWORD *)(a1 + 440) = 0u;
    *(_OWORD *)(a1 + 392) = 0u;
    *(_OWORD *)(a1 + 408) = 0u;
  }
  return result;
}

uint64_t tls_record_parse_ssl2_header(uint64_t a1, unint64_t a2, unsigned __int8 *a3, uint64_t *a4, unsigned char *a5)
{
  if (a2 < 2) {
    return 0xFFFFFFFFLL;
  }
  if (((char)*a3 & 0x80000000) == 0) {
    return 0xFFFFFFFFLL;
  }
  *a4 = SSLDecodeInt(a3, 2) & 0x7FFF;
  uint64_t result = 0;
  if (a5) {
    *a5 = 0x80;
  }
  return result;
}

double tls_stream_parser_create(uint64_t a1, uint64_t a2)
{
  long long v4 = malloc_type_malloc(0x30uLL, 0x10900402D626F53uLL);
  double result = 0.0;
  *long long v4 = 0u;
  v4[1] = 0u;
  *((void *)v4 + 4) = a1;
  *((void *)v4 + 5) = a2;
  return result;
}

uint64_t tls_stream_parser_parse(uint64_t *a1, unint64_t a2, char *__src)
{
  if (!a2) {
    return 0;
  }
  unint64_t v4 = a2;
  long long v6 = (size_t *)(a1 + 2);
  long long v7 = (unsigned __int8 *)(a1 + 1);
  long long v8 = (unsigned __int8 *)a1 + 11;
  do
  {
    unint64_t v9 = *a1;
    if ((unint64_t)*a1 > 4)
    {
      if (v4 >= a1[2] - v9) {
        size_t v10 = a1[2] - v9;
      }
      else {
        size_t v10 = v4;
      }
      memcpy((void *)(a1[3] + v9), __src, v10);
      size_t v13 = *a1 + v10;
      *a1 = v13;
      if (v13 >= a1[2])
      {
        uint64_t result = ((uint64_t (*)(uint64_t))a1[5])(a1[4]);
        if (result) {
          return result;
        }
        *a1 = 0;
        SSLFreeBuffer(v6);
      }
    }
    else
    {
      if (v4 >= 5 - v9) {
        size_t v10 = 5 - v9;
      }
      else {
        size_t v10 = v4;
      }
      memcpy(&v7[v9], __src, v10);
      size_t v11 = *a1 + v10;
      *a1 = v11;
      if (v11 == 5)
      {
        if ((char)*v7 < 0) {
          size_t v12 = (SSLDecodeInt(v7, 2) & 0x7FFF) + 2;
        }
        else {
          size_t v12 = SSLDecodeInt(v8, 2) + 5;
        }
        uint64_t result = SSLAllocBuffer(v6, v12);
        if (result) {
          return result;
        }
        uint64_t v15 = a1[3];
        int v16 = *(_DWORD *)v7;
        *(unsigned char *)(v15 + 4) = v7[4];
        *(_DWORD *)uint64_t v15 = v16;
      }
    }
    __src += v10;
    v4 -= v10;
  }
  while (v4);
  return 0;
}

void tls_stream_parser_destroy(void *a1)
{
  SSLFreeBuffer(a1 + 2);

  sslFree(a1);
}

void *tls_cache_create()
{
  v0 = malloc_type_malloc(0x50uLL, 0x102004089B94702uLL);
  unsigned int v1 = v0;
  if (v0)
  {
    SessionCacheInit(v0);
    pthread_mutex_init((pthread_mutex_t *)(v1 + 2), 0);
  }
  return v1;
}

uint64_t tls_cache_destroy(uint64_t a1)
{
  SessionCacheEmpty((void **)a1);

  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
}

uint64_t tls_cache_empty(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  SessionCacheEmpty((void **)a1);

  return pthread_mutex_unlock(v2);
}

uint64_t tls_cache_save_session_data(uint64_t a1, size_t *a2, uint64_t a3, size_t *a4)
{
  long long v8 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v9 = SessionCacheAddEntry((size_t **)a1, a2, a3, a4);
  pthread_mutex_unlock(v8);
  return v9;
}

uint64_t tls_cache_load_session_data(uint64_t a1, size_t *a2, size_t *a3)
{
  long long v6 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v7 = SessionCacheLookupEntry((void *)a1, a2, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t tls_cache_delete_session_data(uint64_t a1, size_t *a2)
{
  unint64_t v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v5 = SessionCacheDeleteEntry((void *)a1, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t SSLReallocBuffer(uint64_t a1, size_t a2)
{
  unint64_t v4 = malloc_type_realloc(*(void **)(a1 + 8), a2, 0x5F1AF22BuLL);
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

uint64_t SSLCopyBufferFromData(const void *a1, size_t a2, size_t *a3)
{
  size_t v5 = sslAllocCopy(a1, a2);
  a3[1] = (size_t)v5;
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a3 = a2;
  return result;
}

uint64_t SSLCopyBufferTerm(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v6 = malloc_type_malloc(a2 + 1, 0xC274D582uLL);
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

char *tls_private_key_rsa_create(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[1] = a2;
  v5[0] = 0xAAAAAAAA00000000;
  v5[2] = a3;
  v5[3] = a4;
  return tls_private_key_create((uint64_t)v5, a1, 0);
}

char *tls_private_key_ecdsa_create(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  v5[1] = a2;
  v5[0] = 0xAAAAAAAA00000001;
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = a4;
  LOWORD(v6) = a3;
  return tls_private_key_create((uint64_t)v5, a1, 0);
}

uint64_t tls_handshake_set_sct_enable(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 1066) = a2;
  return 0;
}

uint64_t tls_handshake_set_ocsp_enable(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 1008) = a2;
  return 0;
}

uint64_t tls_handshake_set_ems_enable(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 768) = a2;
  return 0;
}

uint64_t tls_handshake_set_ciphersuites(uint64_t a1, unsigned __int16 *a2, unsigned int a3)
{
  return tls_handshake_set_ciphersuites_internal(a1, 0xFFFFFFFF, a2, a3);
}

uint64_t tls_handshake_get_ciphersuites(uint64_t a1, void *a2, _DWORD *a3)
{
  *a2 = *(void *)(a1 + 352);
  *a3 = *(_DWORD *)(a1 + 360);
  return 0;
}

uint64_t tls_handshake_set_resumption(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 280) = a2;
  return 0;
}

uint64_t tls_handshake_set_session_ticket_enabled(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 705) = a2;
  return 0;
}

uint64_t tls_handshake_set_renegotiation(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 321) = a2;
  return 0;
}

uint64_t tls_handshake_set_mtu(uint64_t a1, unint64_t a2)
{
  if (a2 < 0x40) {
    return 4294967246;
  }
  uint64_t result = 0;
  *(void *)(a1 + 840) = a2;
  return result;
}

uint64_t tls_handshake_set_peer_hostname(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v5 = a1 + 392;
  SSLFreeBuffer((void *)(a1 + 392));

  return SSLCopyBufferTerm(a2, a3, v5);
}

uint64_t tls_handshake_get_peer_hostname(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 392);
  *a2 = *(void *)(a1 + 400);
  *a3 = v3;
  return 0;
}

uint64_t tls_handshake_set_min_dh_group_size(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0x200) {
    unsigned int v2 = 512;
  }
  else {
    unsigned int v2 = a2;
  }
  if (v2 >= 0x800) {
    unsigned int v2 = 2048;
  }
  *(_DWORD *)(a1 + 76) = v2;
  return 0;
}

uint64_t tls_handshake_get_min_dh_group_size(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 76);
  return 0;
}

uint64_t tls_handshake_set_dh_parameters(uint64_t a1)
{
  uint64_t v2 = ccder_decode_dhparam_n();
  sslFree(*(void **)(a1 + 96));
  size_t v3 = ccdh_gp_size();
  unint64_t v4 = sslMalloc(v3);
  *(void *)(a1 + 96) = v4;
  if (!v4) {
    return 4294967188;
  }
  *unint64_t v4 = v2;
  if (ccder_decode_dhparams()) {
    return 0;
  }
  else {
    return 4294967246;
  }
}

uint64_t tls_handshake_set_encrypt_rsa_public_key(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1 + 168;
  sslFreePubKey(a1 + 168);

  return sslGetPubKeyFromBits(a2, a3, v5);
}

uint64_t tls_handshake_set_psk_identity(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t tls_handshake_set_psk_identity_hint()
{
  return 0xFFFFFFFFLL;
}

uint64_t tls_handshake_set_psk_secret(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t tls_handshake_set_client_auth_type(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 784) = a2;
  return 0;
}

uint64_t tls_handshake_set_acceptable_dn_list(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 384) = a2;
  return 0;
}

uint64_t tls_handshake_get_acceptable_dn_list(uint64_t a1, void *a2)
{
  *a2 = *(void *)(a1 + 384);
  return 0;
}

uint64_t tls_handshake_set_acceptable_client_auth_type(uint64_t a1, const void *a2, unsigned int a3)
{
  sslFree(*(void **)(a1 + 776));
  unint64_t v6 = sslMalloc(4 * a3);
  *(void *)(a1 + 776) = v6;
  if (!v6) {
    return 4294967188;
  }
  *(_DWORD *)(a1 + 772) = a3;
  memcpy(v6, a2, 4 * a3);
  return 0;
}

uint64_t tls_handshake_set_peer_ec_public_key(uint64_t a1, int a2, void *a3)
{
  uint64_t v5 = a1 + 40;
  sslFreePubKey(a1 + 40);

  return sslGetEcPubKeyFromBits(a2, a3, v5);
}

uint64_t tls_handshake_set_false_start(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 928) = a2;
  return 0;
}

uint64_t tls_handshake_get_false_start(uint64_t a1, unsigned char *a2)
{
  *a2 = *(unsigned char *)(a1 + 928);
  return 0;
}

uint64_t tls_handshake_set_npn_enable(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 929) = a2;
  return 0;
}

uint64_t tls_handshake_set_npn_data(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a2;
  v5[1] = a3;
  size_t v3 = (size_t *)(a1 + 936);
  SSLFreeBuffer((void *)(a1 + 936));
  return SSLCopyBuffer((uint64_t)v5, v3);
}

uint64_t tls_handshake_set_alpn_data(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a2;
  v5[1] = a3;
  size_t v3 = (size_t *)(a1 + 976);
  SSLFreeBuffer((void *)(a1 + 976));
  return SSLCopyBuffer((uint64_t)v5, v3);
}

uint64_t tls_handshake_set_server_identity_change(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 888) = a2;
  return 0;
}

uint64_t tls_handshake_get_server_identity_change(uint64_t a1, unsigned char *a2)
{
  *a2 = *(unsigned char *)(a1 + 888);
  return 0;
}

uint64_t tls_handshake_set_fallback(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 1064) = a2;
  return 0;
}

uint64_t tls_handshake_get_fallback(uint64_t a1, unsigned char *a2)
{
  *a2 = *(unsigned char *)(a1 + 1064);
  return 0;
}

uint64_t tls_handshake_set_ocsp_responder_id_list(uint64_t a1, uint64_t **a2)
{
  size_t v3 = (void *)(a1 + 1032);
  tls_free_buffer_list(*(void **)(a1 + 1032));

  return tls_copy_buffer_list(a2, v3);
}

uint64_t tls_handshake_set_ocsp_request_extensions(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a2;
  v5[1] = a3;
  size_t v3 = (size_t *)(a1 + 1016);
  SSLFreeBuffer((void *)(a1 + 1016));
  return SSLCopyBuffer((uint64_t)v5, v3);
}

uint64_t tls_handshake_set_ocsp_response(uint64_t a1, uint64_t a2)
{
  size_t v3 = (size_t *)(a1 + 1048);
  SSLFreeBuffer((void *)(a1 + 1048));

  return SSLCopyBuffer(a2, v3);
}

uint64_t tls_handshake_set_sct_list(uint64_t a1, uint64_t **a2)
{
  size_t v3 = (void *)(a1 + 1072);
  tls_free_buffer_list(*(void **)(a1 + 1072));

  return tls_copy_buffer_list(a2, v3);
}

BOOL tls_handshake_get_negotiated_ems(uint64_t a1)
{
  return *(unsigned char *)(a1 + 768) && *(unsigned char *)(a1 + 769);
}

uint64_t tls_handshake_set_user_agent(uint64_t a1, const char *a2)
{
  sslFree(*(void **)(a1 + 408));
  *(void *)(a1 + 408) = 0;
  if (a2)
  {
    size_t v4 = strlen(a2);
    uint64_t v5 = (char *)sslMalloc(v4 + 1);
    *(void *)(a1 + 408) = v5;
    strcpy(v5, a2);
  }
  return 0;
}

uint64_t tls_handshake_get_config(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 1092);
  return 0;
}

uint64_t tls_handshake_negotiate(uint64_t a1, void *a2)
{
  int v2 = *(_DWORD *)(a1 + 380);
  if (v2 != 17 && v2 != 2) {
    return 4294957466;
  }
  if (a2)
  {
    (*(void (**)(void, void, void, uint64_t))(*(void *)(a1 + 1112) + 40))(*(void *)(a1 + 1104), *a2, a2[1], a1 + 264);
    SSLFreeBuffer((void *)(a1 + 248));
    SSLCopyBuffer((uint64_t)a2, (size_t *)(a1 + 248));
  }
  else
  {
    SSLFreeBuffer((void *)(a1 + 248));
  }

  return SSLAdvanceHandshake(0, a1);
}

uint64_t tls_handshake_request_renegotiation(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 380) != 16) {
    return 4294957466;
  }
  uint64_t result = SSLResetFlight(a1);
  if (!result)
  {
    *(_WORD *)(a1 + 202) = 0;
    uint64_t result = SSLPrepareAndQueueMessage(SSLEncodeServerHelloRequest, 22, a1);
    if (!result)
    {
      return SSLSendFlight(a1);
    }
  }
  return result;
}

uint64_t tls_handshake_send_alert(uint64_t a1, int a2, unsigned int a3)
{
  if ((a3 > 0x3C || ((1 << a3) & 0x100FFF0040700401) == 0)
    && (a3 - 70 > 0x28 || ((1 << (a3 - 70)) & 0x10040110403) == 0))
  {
    return 4294967246;
  }
  if (a2 == 2) {
    char v4 = 2;
  }
  else {
    char v4 = 1;
  }
  return SSLSendAlert(v4, a3, a1);
}

uint64_t tls_handshake_get_negotiated_protocol_version(unsigned int *a1)
{
  return *a1;
}

uint64_t tls_handshake_get_negotiated_cipherspec(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 328);
}

uint64_t tls_handshake_get_negotiated_curve(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 144);
}

uint64_t tls_handshake_get_server_random(uint64_t a1)
{
  return a1 + 468;
}

uint64_t tls_handshake_get_client_random(uint64_t a1)
{
  return a1 + 436;
}

uint64_t tls_handshake_get_master_secret(uint64_t a1)
{
  return a1 + 520;
}

BOOL tls_handshake_get_session_proposed(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 296);
    *a2 = *(void *)(a1 + 288);
    a2[1] = v2;
  }
  return *(void *)(a1 + 296) != 0;
}

uint64_t tls_handshake_get_session_match(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 312);
    *a2 = *(void *)(a1 + 304);
    a2[1] = v2;
  }
  return *(unsigned __int8 *)(a1 + 320);
}

uint64_t tls_handshake_get_sni_hostname(uint64_t a1)
{
  return a1 + 392;
}

uint64_t tls_handshake_get_peer_requested_ciphersuites(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 376);
  return *(void *)(a1 + 368);
}

uint64_t tls_handshake_get_peer_acceptable_client_auth_type(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 772);
  return *(void *)(a1 + 776);
}

uint64_t tls_handshake_get_peer_acceptable_dn_list(uint64_t a1)
{
  return *(void *)(a1 + 384);
}

uint64_t tls_handshake_get_peer_psk_identity_hint()
{
  return 0;
}

uint64_t tls_handshake_get_peer_psk_identity(uint64_t a1)
{
  return a1 + 912;
}

uint64_t tls_handshake_get_peer_npn_data(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 932)) {
    return a1 + 952;
  }
  else {
    return 0;
  }
}

uint64_t tls_handshake_get_peer_alpn_data(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 971)) {
    return a1 + 992;
  }
  else {
    return 0;
  }
}

uint64_t tls_handshake_get_peer_ocsp_enabled(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1009);
}

uint64_t tls_handshake_get_peer_ocsp_response(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1040)) {
    return a1 + 1048;
  }
  else {
    return 0;
  }
}

uint64_t tls_handshake_get_peer_ocsp_responder_id_list(uint64_t a1)
{
  return *(void *)(a1 + 1032);
}

uint64_t tls_handshake_get_peer_ocsp_request_extensions(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1009)) {
    return a1 + 1016;
  }
  else {
    return 0;
  }
}

uint64_t tls_handshake_get_peer_sct_enabled(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1067);
}

uint64_t tls_handshake_get_peer_sct_list(uint64_t a1)
{
  return *(void *)(a1 + 1072);
}

uint64_t tls_handshake_get_peer_requested_ecdh_curves(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 1088);
  return *(void *)(a1 + 1080);
}

__n128 tls_handshake_internal_master_secret(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 >= 0x30uLL)
  {
    __n128 result = *(__n128 *)(a1 + 520);
    long long v4 = *(_OWORD *)(a1 + 552);
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 536);
    *(_OWORD *)(a2 + 32) = v4;
    *(__n128 *)a2 = result;
    *a3 = 48;
  }
  return result;
}

__n128 tls_handshake_internal_server_random(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 >= 0x20uLL)
  {
    __n128 result = *(__n128 *)(a1 + 468);
    long long v4 = *(_OWORD *)(a1 + 484);
    *(__n128 *)a2 = result;
    *(_OWORD *)(a2 + 16) = v4;
    *a3 = 32;
  }
  return result;
}

__n128 tls_handshake_internal_client_random(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 >= 0x20uLL)
  {
    __n128 result = *(__n128 *)(a1 + 436);
    long long v4 = *(_OWORD *)(a1 + 452);
    *(__n128 *)a2 = result;
    *(_OWORD *)(a2 + 16) = v4;
    *a3 = 32;
  }
  return result;
}

uint64_t tls_handshake_internal_set_master_secret_function(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 752) = a2;
  *(void *)(a1 + 760) = a3;
  return 0;
}

uint64_t tls_handshake_internal_set_session_ticket(uint64_t a1, const void *a2, size_t a3)
{
  if (a3 >> 16) {
    return 4294967246;
  }
  uint64_t v7 = (size_t *)(a1 + 736);
  SSLFreeBuffer((void *)(a1 + 736));
  return SSLCopyBufferFromData(a2, a3, v7);
}

uint64_t tls_handshake_get_session_warning(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1120);
}

uint64_t tls_handshake_set_session_warning(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1120) = a2;
  return 0;
}

uint64_t sslCipherSuiteGetMinSupportedTLSVersion(int a1)
{
  if (a1 > 155)
  {
    if ((a1 - 49153) < 0x19) {
      return 769;
    }
    else {
      return 771;
    }
  }
  else
  {
    uint64_t v1 = 768;
    switch(a1)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
        return v1;
      default:
        return 771;
    }
  }
}

uint64_t sslCipherSuiteGetKeydataSize(int a1)
{
  uint64_t v2 = (int)sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 1;
  if (v2 > 8) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_20DA4D050[v2];
  }
  char SymmetricCipherKeySize = sslCipherSuiteGetSymmetricCipherKeySize(a1);
  return v3 + 2 * ((sslCipherSuiteGetMacSize(a1) + SymmetricCipherKeySize) & 0x7F);
}

uint64_t SSLEncodedBufferListSize(void *a1, int a2)
{
  for (uint64_t i = 0; a1; i += a2 + v3[1])
  {
    uint64_t v3 = a1;
    a1 = (void *)*a1;
  }
  return i;
}

uint64_t SSLEncodeBufferList(uint64_t *a1, int a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v3 = a1;
    uint64_t v4 = a2;
    do
    {
      uint64_t v5 = (void *)SSLEncodeInt(a3, v3[1], v4);
      memcpy(v5, (const void *)v3[2], v3[1]);
      unint64_t v6 = v3;
      uint64_t v3 = (uint64_t *)*v3;
      a3 = (uint64_t)v5 + v6[1];
    }
    while (v3);
  }
  return a3;
}

uint64_t SSLAddSessionData(uint64_t a1)
{
  size_t v17 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  if (!*(void *)(a1 + 312) && !*(void *)(a1 + 720)) {
    return 4294957492;
  }
  uint64_t v2 = SSLEncodedBufferListSize(*(void **)(a1 + 1072), 2);
  uint64_t v3 = SSLEncodedBufferListSize(*(void **)(a1 + 64), 3);
  uint64_t v4 = SSLAllocBuffer(&v17, v2 + v3 + *(void *)(a1 + 712) + *(void *)(a1 + 1048) + 144);
  if (!v4)
  {
    unint64_t v5 = v18;
    unint64_t v6 = *(const void **)(a1 + 312);
    if (v6)
    {
      size_t v7 = *(void *)(a1 + 304);
      *(void *)unint64_t v18 = v7;
      memcpy((void *)(v5 + 8), v6, v7);
    }
    else
    {
      *(void *)unint64_t v18 = 14;
      qmemcpy((void *)(v5 + 8), "SESSION-TICKET", 14);
    }
    *(void *)(v5 + 40) = *(void *)a1;
    *(_WORD *)(v5 + 48) = *(_WORD *)(a1 + 328);
    long long v8 = *(_OWORD *)(a1 + 520);
    long long v9 = *(_OWORD *)(a1 + 536);
    *(_OWORD *)(v5 + 84) = *(_OWORD *)(a1 + 552);
    *(_OWORD *)(v5 + 68) = v9;
    *(_OWORD *)(v5 + 52) = v8;
    size_t v10 = *(void *)(a1 + 712);
    *(void *)(v5 + 104) = v10;
    *(void *)(v5 + 112) = *(void *)(a1 + 1048);
    *(void *)(v5 + 120) = v2;
    *(void *)(v5 + 128) = v3;
    *(_WORD *)(v5 + 50) = 0;
    memcpy((void *)(v5 + 137), *(const void **)(a1 + 720), v10);
    size_t v11 = (void *)(v5 + 137 + *(void *)(a1 + 712));
    memcpy(v11, *(const void **)(a1 + 1056), *(void *)(a1 + 1048));
    uint64_t v12 = SSLEncodeBufferList(*(uint64_t **)(a1 + 1072), 2, (uint64_t)v11 + *(void *)(a1 + 1048));
    SSLEncodeBufferList(*(uint64_t **)(a1 + 64), 3, v12);
    if (v17 >= 0x90 && v17 == vaddvq_s64(vaddq_s64(*(int64x2_t *)(v18 + 104), *(int64x2_t *)(v18 + 120))) + 144)
    {
      BOOL v13 = *(unsigned char *)(a1 + 768) && *(unsigned char *)(a1 + 769);
      *(unsigned char *)(v5 + 136) = v13;
      uint64_t v14 = 312;
      if (!*(unsigned char *)(a1 + 17)) {
        uint64_t v14 = 256;
      }
      uint64_t v15 = 304;
      if (!*(unsigned char *)(a1 + 17)) {
        uint64_t v15 = 248;
      }
      uint64_t v4 = (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 1112) + 32))(*(void *)(a1 + 1104), *(void *)(a1 + v15), *(void *)(a1 + v14));
    }
    else
    {
      uint64_t v4 = 4294957486;
    }
    SSLFreeBuffer(&v17);
  }
  return v4;
}

uint64_t SSLDeleteSessionData(void *a1)
{
  if (a1[39]) {
    return (*(uint64_t (**)(void, void))(a1[139] + 48))(a1[138], a1[38]);
  }
  else {
    return 4294957492;
  }
}

uint64_t SSLRetrieveSessionTicket(unint64_t a1, uint64_t a2, void *a3)
{
  if (a1 < 0x90) {
    return 4294957486;
  }
  int64x2_t v3 = *(int64x2_t *)(a2 + 104);
  if (a1 != vaddvq_s64(vaddq_s64(v3, *(int64x2_t *)(a2 + 120))) + 144) {
    return 4294957486;
  }
  uint64_t result = 0;
  a3[1] = a2 + 137;
  *a3 = v3.i64[0];
  return result;
}

uint64_t SSLRetrieveSessionID(unint64_t a1, uint64_t a2, void *a3)
{
  if (a1 < 0x90 || a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144) {
    return 4294957486;
  }
  uint64_t result = 0;
  *a3 = *(void *)a2;
  a3[1] = a2 + 8;
  return result;
}

uint64_t SSLServerValidateSessionData(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0x90) {
    return 4294957486;
  }
  if (a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144) {
    return 4294957486;
  }
  if (*(void *)a2 != *(void *)(a3 + 288)
    || memcmp((const void *)(a2 + 8), *(const void **)(a3 + 296), *(void *)a2)
    || *(_DWORD *)(a2 + 40) != *(_DWORD *)a3
    || !cipherSuiteInSet(*(unsigned __int16 *)(a2 + 48), *(unsigned __int16 **)(a3 + 352), *(unsigned int *)(a3 + 360))
    || !cipherSuiteInSet(*(unsigned __int16 *)(a2 + 48), *(unsigned __int16 **)(a3 + 368), *(unsigned int *)(a3 + 376)))
  {
    return 4294957492;
  }
  if (*(unsigned char *)(a2 + 136))
  {
    if (!*(unsigned char *)(a3 + 769))
    {
      SSLFatalSessionAlert(40, a3);
      return 4294957494;
    }
    goto LABEL_15;
  }
  if (*(unsigned char *)(a3 + 769)) {
    return 4294957492;
  }
LABEL_15:
  *(_WORD *)(a3 + 328) = *(_WORD *)(a2 + 48);
  InitCipherSpecParams(a3);
  return 0;
}

uint64_t SSLClientValidateSessionDataBefore(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0x90) {
    return 4294957486;
  }
  if (a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144) {
    return 4294957486;
  }
  unsigned int v4 = *(_DWORD *)(a3 + 12);
  if (v4 <= *(_DWORD *)(a2 + 44)
    && (unsigned int v5 = *(_DWORD *)(a2 + 40), v5 <= v4)
    && v5 >= *(_DWORD *)(a3 + 8)
    && cipherSuiteInSet(*(unsigned __int16 *)(a2 + 48), *(unsigned __int16 **)(a3 + 352), *(unsigned int *)(a3 + 360)))
  {
    return 0;
  }
  else
  {
    return 4294957492;
  }
}

uint64_t SSLClientValidateSessionDataAfter(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0x90 || a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144) {
    return 4294957486;
  }
  if (*(_DWORD *)(a2 + 40) == *(_DWORD *)a3
    && *(unsigned __int16 *)(a2 + 48) == *(unsigned __int16 *)(a3 + 328)
    && *(unsigned __int8 *)(a2 + 136) == *(unsigned __int8 *)(a3 + 769))
  {
    return 0;
  }
  return 4294957496;
}

uint64_t SSLInstallSessionFromData(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0x90) {
    return 4294957486;
  }
  if (a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144) {
    return 4294957486;
  }
  long long v6 = *(_OWORD *)(a2 + 52);
  long long v7 = *(_OWORD *)(a2 + 84);
  *(_OWORD *)(a3 + 536) = *(_OWORD *)(a2 + 68);
  *(_OWORD *)(a3 + 552) = v7;
  *(_OWORD *)(a3 + 520) = v6;
  long long v8 = (char *)(a2 + *(void *)(a2 + 104) + 137);
  long long v9 = (size_t *)(a3 + 1048);
  SSLFreeBuffer((void *)(a3 + 1048));
  *(unsigned char *)(a3 + 1040) = 0;
  size_t v10 = *(void *)(a2 + 112);
  if (v10)
  {
    *(unsigned char *)(a3 + 1040) = 1;
    SSLCopyBufferFromData(v8, v10, v9);
    uint64_t v11 = *(void *)(a2 + 112);
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = (unsigned __int8 *)&v8[v11];
  tls_free_buffer_list(*(void **)(a3 + 1072));
  *(void *)(a3 + 1072) = 0;
  unint64_t v13 = *(void *)(a2 + 120);
  if (v13)
  {
    uint64_t result = SSLDecodeBufferList(v12, v13, 2, (void ***)(a3 + 1072));
    if (result) {
      return result;
    }
    uint64_t v14 = *(void *)(a2 + 120);
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v16 = *(void *)(a3 + 64);
  uint64_t v15 = (void ***)(a3 + 64);
  SSLFreeCertificates(v16);
  *uint64_t v15 = 0;
  unint64_t v17 = *(void *)(a2 + 128);
  if (!v17) {
    return 0;
  }
  uint64_t result = SSLDecodeBufferList(&v12[v14], v17, 3, v15);
  if (!result) {
    return 0;
  }
  return result;
}

BOOL cipherSuiteInSet(int a1, unsigned __int16 *a2, unint64_t a3)
{
  if (!a3) {
    return 0;
  }
  if (*a2 == a1) {
    return 1;
  }
  uint64_t v4 = 1;
  do
  {
    unint64_t v5 = v4;
    if (a3 == v4) {
      break;
    }
    int v6 = a2[v4++];
  }
  while (v6 != a1);
  return v5 < a3;
}

uint64_t ValidateSelectedCiphersuite(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 360);
  if (!v1) {
    return 4294957495;
  }
  uint64_t v2 = *(unsigned __int16 **)(a1 + 352);
  while (1)
  {
    int v3 = *v2++;
    if (v3 == *(unsigned __int16 *)(a1 + 328)) {
      break;
    }
    if (!--v1) {
      return 4294957495;
    }
  }
  InitCipherSpecParams(a1);
  return 0;
}

uint64_t tls_handshake_ciphersuite_is_valid(uint64_t a1, int a2)
{
  unsigned int KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(a2);
  unsigned int SymmetricCipherAlgorithm = sslCipherSuiteGetSymmetricCipherAlgorithm(a2);
  sslCipherSuiteGetMacAlgorithm(a2);
  uint64_t result = 0;
  if (KeyExchangeMethod <= 0x13)
  {
    if (((1 << KeyExchangeMethod) & 0x80A22) != 0) {
      goto LABEL_5;
    }
    if (((1 << KeyExchangeMethod) & 0x68000) == 0) {
      return result;
    }
    if (*(_DWORD *)(a1 + 12) != 768)
    {
LABEL_5:
      uint64_t result = 0;
      if (SymmetricCipherAlgorithm > 8) {
        return result;
      }
      if (((1 << SymmetricCipherAlgorithm) & 0x70) != 0)
      {
        if (*(_DWORD *)(a1 + 12) != 768 || !*(unsigned char *)(a1 + 1064)) {
          return 1;
        }
      }
      else
      {
        if (((1 << SymmetricCipherAlgorithm) & 5) != 0) {
          return 1;
        }
        if (((1 << SymmetricCipherAlgorithm) & 0x180) == 0) {
          return result;
        }
        if (*(_DWORD *)(a1 + 12) == 771) {
          return 1;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t sslEncodeDhParams(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  size_t v8 = ccdh_gp_size();
  long long v9 = sslMalloc(v8);
  if (!v9) {
    return 4294967188;
  }
  size_t v10 = v9;
  size_t v11 = ccdh_gp_size();
  bzero(v10, v11);
  uint64_t inited = ccdh_init_gp_from_bytes();
  uint64_t v13 = inited;
  if (inited)
  {
    if (inited == -168)
    {
      uint64_t v14 = copyHexString(*(void *)(a3 + 8), *(void *)a3);
      uint64_t v15 = copyHexString(*(void *)(a4 + 8), *(void *)a4);
      tls_metric_insecure_dh_param();
      tls_handshake_set_session_warning(a1, -168);
      if (v14) {
        CFRelease(v14);
      }
      if (v15) {
        CFRelease(v15);
      }
      uint64_t v13 = 4294957446;
    }
    sslFree(v10);
  }
  else
  {
    *a2 = v10;
  }
  return v13;
}

uint64_t sslDhCreateKey(uint64_t a1, void *a2)
{
  uint64_t v3 = ccdh_ccn_size();
  uint64_t v4 = sslMalloc(2 * v3 + 16);
  if (!v4) {
    return 4294967188;
  }
  unint64_t v5 = v4;
  if (!ccDRBGGetRngState()) {
    abort();
  }
  uint64_t key = ccdh_generate_key();
  if (key) {
    sslFree(v5);
  }
  else {
    *a2 = v5;
  }
  return key;
}

uint64_t sslDhExportPub(uint64_t a1, size_t *a2)
{
  ccdh_ctx_public();
  size_t v3 = ccdh_export_pub_size();
  uint64_t v4 = SSLAllocBuffer(a2, v3);
  if (!v4)
  {
    ccdh_ctx_public();
    ccdh_export_pub();
  }
  return v4;
}

uint64_t sslDhKeyExchange(uint64_t *a1, uint64_t a2, size_t *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (!ccDRBGGetRngState()) {
    abort();
  }
  uint64_t v5 = *a1;
  ccdh_ccn_size();
  MEMORY[0x270FA5388]();
  if (v7 >= 0x10)
  {
    size_t v8 = (void *)((char *)v13 - v6);
    do
    {
      *size_t v8 = 0xAAAAAAAAAAAAAAAALL;
      v8[1] = 0xAAAAAAAAAAAAAAAALL;
      v8 += 2;
      v6 -= 16;
    }
    while (v6);
  }
  if (ccdh_import_pub()) {
    goto LABEL_10;
  }
  uint64_t v9 = MEMORY[0x2105638A0](v5);
  uint64_t v10 = SSLAllocBuffer(a3, 8 * v9);
  if (v10)
  {
    uint64_t v11 = v10;
    goto LABEL_12;
  }
  if (ccdh_compute_shared_secret())
  {
LABEL_10:
    uint64_t v11 = 4294957496;
LABEL_12:
    __ssl_debug("sslError", "sslDhKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 192, "sslDhKeyExchange: failed to compute key (error %d)\n", v11);
    return v11;
  }
  return 0;
}

uint64_t sslEcdhExportPub(uint64_t a1, size_t *a2)
{
  uint64_t v3 = cczp_bitlen();
  uint64_t v4 = SSLAllocBuffer(a2, ((unint64_t)(v3 + 7) >> 2) | 1);
  if (!v4) {
    ccec_export_pub();
  }
  return v4;
}

uint64_t sslRawSign(void *a1, uint64_t a2, uint64_t a3, char *a4, size_t a5, size_t *a6)
{
  size_t __len = a5;
  int v10 = *((_DWORD *)a1 + 4);
  if (v10 == 1)
  {
    uint64_t v11 = ((uint64_t (*)(void, uint64_t, uint64_t, char *, size_t *))a1[5])(*a1, a2, a3, a4, &__len);
  }
  else
  {
    if (v10)
    {
      uint64_t v12 = 4294967246;
      goto LABEL_12;
    }
    uint64_t v11 = ((uint64_t (*)(void, void, uint64_t, uint64_t, char *, size_t *))a1[4])(*a1, 0, a2, a3, a4, &__len);
  }
  uint64_t v12 = v11;
  if (v11)
  {
LABEL_12:
    __ssl_debug("sslError", "sslRawSign", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 336, "privKey->desc.rsa.sign: failed (error %d)\n", v12);
    size_t v13 = __len;
    goto LABEL_13;
  }
  size_t v13 = __len;
  if (*((_DWORD *)a1 + 4)) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = a5 > __len;
  }
  if (v14)
  {
    size_t v16 = a5 - __len;
    memmove(&a4[a5 - __len], a4, __len);
    bzero(a4, v16);
    uint64_t v12 = 0;
    size_t v13 = a5;
  }
  else
  {
    uint64_t v12 = 0;
  }
LABEL_13:
  *a6 = v13;
  return v12;
}

uint64_t sslEcdsaSign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v9 = a5;
  uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 40))(*(void *)a1, a2, a3, a4, &v9);
  if (v7) {
    __ssl_debug("sslError", "sslEcdsaSign", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 373, "privKey->desc.ecdsa.sign: failed (error %d)\n", v7);
  }
  *a6 = v9;
  return v7;
}

uint64_t sslRawVerify(uint64_t a1)
{
  if (!*(unsigned char *)a1)
  {
    if (*(void *)(a1 + 8))
    {
      uint64_t v3 = ccec_verify();
      if (v3)
      {
        uint64_t v2 = v3;
        __ssl_debug("sslError", "sslRawEccVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 466, "sslRawEccVerify: ccec_verify failed (error %d)\n", v3);
        return v2;
      }
      return 0;
    }
    __ssl_debug("sslError", "sslRawEccVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 460, "Internal Error: Invalid EC public key\n");
    return 4294957486;
  }
  if (!*(void *)(a1 + 8))
  {
    __ssl_debug("sslError", "sslRawRsaVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 431, "Internal Error: Invalid RSA public key\n");
    return 4294957486;
  }
  uint64_t v1 = ccrsa_verify_pkcs1v15();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  __ssl_debug("sslError", "sslRawRsaVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 438, "sslRawRsaVerify: ccrsa_verify_pkcs1v15 failed (error %d)\n", v1);
  return v2;
}

uint64_t sslRsaEncrypt(uint64_t a1, const void *a2, size_t a3, char *a4, size_t a5, size_t *a6)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)a1 && (uint64_t v6 = *(uint64_t **)(a1 + 8)) != 0)
  {
    char v22 = a6;
    size_t v23 = a5;
    uint64_t v24 = &v22;
    MEMORY[0x270FA5388]();
    uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v12) {
      memset((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v10);
    }
    uint64_t v13 = *v6;
    uint64_t v14 = ccn_write_uint_size();
    if (v14 - 11 < a3) {
      goto LABEL_22;
    }
    size_t v15 = v14;
    size_t v16 = v11;
    size_t v17 = 8 * v13 - v14;
    if (v17)
    {
      bzero(v11, v17);
      size_t v16 = &v11[v17];
    }
    *(_WORD *)size_t v16 = 512;
    unint64_t v18 = v16 + 2;
    int v19 = (unsigned int (**)(void, size_t, char *))ccDRBGGetRngState();
    if (!v19) {
      abort();
    }
    if ((*v19)(v19, v15 - a3 - 3, v16 + 2)) {
      goto LABEL_22;
    }
    if ((uint64_t)(v15 - a3 - 3) >= 1)
    {
      do
      {
        if (!*v18) {
          *unint64_t v18 = -1;
        }
        ++v18;
      }
      while (v18 < &v16[v15 - a3 - 1]);
    }
    *unint64_t v18 = 0;
    memcpy(v18 + 1, a2, a3);
    ccn_swap();
    if (ccrsa_pub_crypt())
    {
LABEL_22:
      __ssl_debug("sslError", "sslRsaEncrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 640, "***sslRsaEncrypt error\n");
      return 4294957487;
    }
    else
    {
      ccn_write_uint_padded();
      size_t v20 = v23;
      if (v23 <= v15)
      {
        size_t v20 = v15;
      }
      else
      {
        memmove(&a4[v23 - v15], a4, v15);
        bzero(a4, v20 - v15);
      }
      uint64_t result = 0;
      if (v22) {
        *char v22 = v20;
      }
    }
  }
  else
  {
    __ssl_debug("sslError", "sslRsaEncrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 565, "Internal Error: Invalid RSA public key\n");
    return 4294957486;
  }
  return result;
}

uint64_t sslRsaDecrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v9 = a5;
  uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 40))(*(void *)a1, a2, a3, a4, &v9);
  *a6 = v9;
  if (v7) {
    __ssl_debug("sslError", "sslRsaDecrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 662, "sslRsaDecrypt: privKey->desc.rsa->decrypt failed (error %d)\n", v7);
  }
  return v7;
}

uint64_t sslPrivKeyLengthInBytes(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t sslPubKeyLengthInBytes()
{
  return ccn_write_uint_size();
}

void debug_log_chain(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v1 = a1;
    uint64_t v2 = 0;
    do
    {
      char v14 = -86;
      *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
      void v13[2] = v3;
      v13[3] = v3;
      v13[0] = v3;
      v13[1] = v3;
      __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 147, "cert: %lu", v2);
      __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 148, "-----BEGIN CERTIFICATE-----");
      unint64_t v4 = v1[1];
      if (v4)
      {
        uint64_t v5 = 0;
        unint64_t v6 = 0;
        do
        {
          uint64_t v7 = v1[2];
          int v8 = *(unsigned __int8 *)(v7 + v6) << 8;
          if (v6 + 1 < v4) {
            v8 |= *(unsigned __int8 *)(v7 + v6 + 1);
          }
          unint64_t v9 = (v8 << 8);
          if (v6 + 2 < v4) {
            unint64_t v9 = v9 | *(unsigned __int8 *)(v7 + v6 + 2);
          }
          v6 += 3;
          size_t v10 = (char *)v13 + v5;
          char *v10 = base64_chars[(unint64_t)v9 >> 18];
          v10[1] = base64_chars[(v9 >> 12) & 0x3F];
          if (v6 <= v1[1] + 1) {
            char v11 = base64_chars[(v9 >> 6) & 0x3F];
          }
          else {
            char v11 = 61;
          }
          *((unsigned char *)v13 + v5 + 2) = v11;
          if (v6 <= v1[1]) {
            char v12 = base64_chars[v9 & 0x3F];
          }
          else {
            char v12 = 61;
          }
          *((unsigned char *)v13 + v5 + 3) = v12;
          v5 += 4;
          if (v5 == 64)
          {
            char v14 = 0;
            __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 176, "%s", (const char *)v13);
            uint64_t v5 = 0;
          }
          unint64_t v4 = v1[1];
        }
        while (v6 < v4);
        if (v5)
        {
          *((unsigned char *)v13 + v5) = 0;
          __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 183, "%s", (const char *)v13);
        }
      }
      ++v2;
      __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 185, "-----END CERTIFICATE-----");
      uint64_t v1 = (void *)*v1;
    }
    while (v1);
  }
}

uint64_t SSLEncodeCertificateStatus(size_t *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 1048);
  if (!v2) {
    return 4294957486;
  }
  unint64_t v5 = v2 + 4;
  uint64_t v6 = 12;
  if (!*(unsigned char *)(a2 + 16)) {
    uint64_t v6 = 4;
  }
  uint64_t result = SSLAllocBuffer(a1, v6 + v5);
  if (!result)
  {
    int v8 = (unsigned char *)SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 22, v5);
    *int v8 = 1;
    unint64_t v9 = (void *)SSLEncodeInt((uint64_t)(v8 + 1), *(void *)(a2 + 1048), 3);
    memcpy(v9, *(const void **)(a2 + 1056), *(void *)(a2 + 1048));
    return 0;
  }
  return result;
}

uint64_t SSLProcessCertificateStatus(unint64_t a1, unsigned char *a2, uint64_t a3)
{
  if (!a1)
  {
    __ssl_debug("sslError", "SSLProcessCertificateStatus", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 294, "SSLProcessCertificateStatus: message length decode error (1)\n");
    return 4294957496;
  }
  if (*a2 != 1) {
    return 0;
  }
  if (a1 <= 2)
  {
    __ssl_debug("sslError", "SSLProcessCertificateStatus", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 305, "SSLProcessCertificateStatus: message length decode error (2)\n");
    return 4294957496;
  }
  unint64_t v7 = SSLDecodeSize((unint64_t)(a2 + 1), 3);
  if (!v7)
  {
    __ssl_debug("sslError", "SSLProcessCertificateStatus", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 312, "SSLProcessCertificateStatus: message length decode error (3)\n");
    return 4294957496;
  }
  size_t v8 = v7;
  if (v7 + 4 != a1)
  {
    __ssl_debug("sslError", "SSLProcessCertificateStatus", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 317, "SSLProcessCertificateStatus: message length decode error (4)\n");
    return 4294957496;
  }
  *(unsigned char *)(a3 + 1040) = 1;
  unint64_t v9 = (size_t *)(a3 + 1048);
  SSLFreeBuffer(v9);

  return SSLCopyBufferFromData(a2 + 4, v8, v9);
}

uint64_t SSLProcessCertificateRequest(unint64_t a1, unsigned char *a2, uint64_t a3)
{
  size_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  if (*(unsigned char *)(a3 + 16)) {
    unsigned int v3 = 65279;
  }
  else {
    unsigned int v3 = 770;
  }
  if (*(_DWORD *)a3 <= v3) {
    unint64_t v4 = 3;
  }
  else {
    unint64_t v4 = 5;
  }
  if (a1 < v4)
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 408, "SSLProcessCertificateRequest: length decode error 1\n", v31);
    return 4294957496;
  }
  unsigned int v6 = *a2;
  if (!*a2 || (unint64_t v8 = v4 + v6, a1 < v8))
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 414, "SSLProcessCertificateRequest: length decode error 2\n", v31);
    return 4294957496;
  }
  sslFree(*(void **)(a3 + 776));
  *(_DWORD *)(a3 + 772) = v6;
  char v12 = sslMalloc(4 * v6);
  *(void *)(a3 + 776) = v12;
  if (!v12) {
    return 4294957486;
  }
  uint64_t v13 = a2 + 1;
  if (*(_DWORD *)(a3 + 772))
  {
    unint64_t v14 = 0;
    do
    {
      *(_DWORD *)(*(void *)(a3 + 776) + 4 * v14) = v13[v14];
      ++v14;
    }
    while (v14 < *(unsigned int *)(a3 + 772));
    v13 += v14;
  }
  if (*(unsigned char *)(a3 + 16)) {
    unsigned int v15 = 65279;
  }
  else {
    unsigned int v15 = 770;
  }
  if (*(_DWORD *)a3 <= v15)
  {
    unsigned int v17 = 0;
    goto LABEL_33;
  }
  unsigned int v16 = SSLDecodeInt(v13, 2);
  if (v16 < 2 || (unsigned int v17 = v16, a1 < v16 + v8))
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 436, "SSLProcessCertificateRequest: length decode error 3\n", v31);
    return 4294957496;
  }
  if (v16)
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 441, "SSLProcessCertificateRequest: signAlg len odd\n", v31);
    return 4294957496;
  }
  sslFree(*(void **)(a3 + 792));
  *(_DWORD *)(a3 + 788) = v17 >> 1;
  unint64_t v18 = (char *)sslMalloc(8 * (v17 >> 1));
  *(void *)(a3 + 792) = v18;
  if (!v18) {
    return 4294957486;
  }
  uint64_t v19 = *(unsigned int *)(a3 + 788);
  v13 += 2;
  if (v19)
  {
    size_t v20 = v18 + 4;
    do
    {
      *(v20 - 1) = *v13;
      *size_t v20 = v13[1];
      v20 += 2;
      v13 += 2;
      --v19;
    }
    while (v19);
  }
LABEL_33:
  tls_free_buffer_list(*(void **)(a3 + 384));
  *(void *)(a3 + 384) = 0;
  uint64_t v21 = SSLDecodeInt(v13, 2);
  if (a1 != v17 + v8 + v21)
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 468, "SSLProcessCertificateRequest: length decode error 3\n", v31);
    return 4294957496;
  }
  uint64_t v9 = v21;
  char v22 = v13 + 2;
  if (v21)
  {
    while (1)
    {
      if (v9 == 1)
      {
        __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 473, "SSLProcessCertificateRequest: dnListLen error 1\n", v31);
        return 4294957496;
      }
      unsigned int v23 = SSLDecodeInt(v22, 2);
      BOOL v24 = v9 >= v23 + 2;
      uint64_t v9 = v9 - (v23 + 2);
      if (!v24)
      {
        __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 479, "SSLProcessCertificateRequest: dnListLen error 2\n", v31);
        return 4294957496;
      }
      unsigned int v25 = v23;
      uint64_t v26 = SSLAllocBuffer(&v31, 0x18uLL);
      if (v26) {
        return v26;
      }
      unint64_t v27 = v32;
      uint64_t v28 = SSLAllocBuffer((size_t *)(v32 + 8), v25);
      if (v28) {
        break;
      }
      uint64_t v29 = (char *)(v22 + 2);
      memcpy(*(void **)(v27 + 16), v29, v25);
      char v22 = (unsigned __int8 *)&v29[v25];
      *(void *)unint64_t v27 = *(void *)(a3 + 384);
      *(void *)(a3 + 384) = v27;
      if (!v9) {
        return v9;
      }
    }
    uint64_t v30 = v28;
    SSLFreeBuffer(&v31);
    return v30;
  }
  return v9;
}

uint64_t SSLEncodeCertificateVerify(size_t *a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v4;
  v32[3] = v4;
  v32[0] = v4;
  v32[1] = v4;
  size_t v29 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0;
  v31[0] = 64;
  v31[1] = (uint64_t)v32;
  uint64_t MaxSigSize = sslGetMaxSigSize(*(void *)(a2 + 32), &v29);
  if (!MaxSigSize)
  {
    int v6 = *(_DWORD *)(*(void *)(a2 + 32) + 16);
    if (v6 == 1)
    {
      unsigned int v7 = *(_DWORD *)a2;
      if (*(_DWORD *)a2 < 0x301u) {
        return 4294957486;
      }
      int v8 = 0;
      uint64_t v9 = 3;
    }
    else
    {
      if (v6) {
        return 4294957486;
      }
      unsigned int v7 = *(_DWORD *)a2;
      int v8 = 1;
      uint64_t v9 = 1;
    }
    BOOL v10 = *(unsigned char *)(a2 + 16) == 0;
    if (*(unsigned char *)(a2 + 16)) {
      uint64_t v11 = 12;
    }
    else {
      uint64_t v11 = 4;
    }
    size_t v12 = v11 + v29;
    size_t v13 = v11 + v29 + 2;
    size_t v30 = v13;
    if (v10) {
      unsigned int v14 = 770;
    }
    else {
      unsigned int v14 = 65279;
    }
    if (v7 <= v14)
    {
      uint64_t v18 = 0;
    }
    else
    {
      if (!*(_DWORD *)(a2 + 788)) {
        return 4294957486;
      }
      uint64_t v15 = *(unsigned int *)(a2 + 800);
      if (!v15) {
        return 4294957486;
      }
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)(a2 + 808);
      while (v9 != *(_DWORD *)(v17 + 8 * v16 + 4))
      {
LABEL_22:
        ++v16;
        uint64_t MaxSigSize = 4294957496;
        if (v16 == v15) {
          return MaxSigSize;
        }
      }
      uint64_t v18 = *(unsigned int *)(v17 + 8 * v16);
      uint64_t v19 = *(void *)(a2 + 792) + 4;
      uint64_t v20 = *(unsigned int *)(a2 + 788);
      while (__PAIR64__(v9, v18) != *(void *)(v19 - 4))
      {
        v19 += 8;
        if (!--v20) {
          goto LABEL_22;
        }
      }
      size_t v13 = v12 + 4;
      size_t v30 = v12 + 4;
      *(void *)(a2 + 816) = v18 | (v9 << 32);
    }
    uint64_t MaxSigSize = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(a2 + 24) + 24))(a2, v31, v18);
    if (!MaxSigSize)
    {
      uint64_t MaxSigSize = SSLAllocBuffer(a1, v13);
      if (!MaxSigSize)
      {
        uint64_t v21 = (unsigned char *)(a1[1] + v11);
        if (*(unsigned char *)(a2 + 16)) {
          unsigned int v22 = 65279;
        }
        else {
          unsigned int v22 = 770;
        }
        if (*(_DWORD *)a2 <= v22)
        {
          uint64_t MaxSigSize = sslRawSign(*(void **)(a2 + 32), (uint64_t)v32, v31[0], v21 + 2, v29, &v30);
          unint64_t v25 = v30;
          size_t v26 = v30;
LABEL_38:
          if (MaxSigSize)
          {
            __ssl_debug("sslError", "SSLEncodeCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 643, "SSLEncodeCertificateVerify: unable to sign data (error %d)\n", MaxSigSize);
          }
          else
          {
            unint64_t v27 = v26 + 2;
            *a1 = v26 + 2 + v11;
            SSLEncodeInt((uint64_t)v21, v25, 2);
            SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 15, v27);
          }
          return MaxSigSize;
        }
        *uint64_t v21 = v18;
        v21[1] = v9;
        if (v18 <= 6 && ((1 << v18) & 0x74) != 0)
        {
          uint64_t v23 = *(void *)(a2 + 32);
          if (v8) {
            uint64_t v24 = sslRsaSign(v23, v18, (uint64_t)v32, v31[0], v21 + 4, v29, &v30);
          }
          else {
            uint64_t v24 = sslEcdsaSign(v23, (uint64_t)v32, v31[0], (uint64_t)(v21 + 4), v29, &v30);
          }
          uint64_t MaxSigSize = v24;
          unint64_t v25 = v30;
          size_t v26 = v30 + 2;
          v21 += 2;
          goto LABEL_38;
        }
        __ssl_debug("sslError", "SSLEncodeCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 610, "SSLEncodeCertificateVerify: unsupported signature hash algorithm (%d)\n", v18);
        return 4294957486;
      }
    }
  }
  return MaxSigSize;
}

void *tls_metric_event_new(const char *a1, const char *a2, const char *a3)
{
  int v6 = malloc_type_malloc(0x20uLL, 0x50040BBB33FCDuLL);
  unsigned int v7 = v6;
  if (v6)
  {
    *int v6 = a1;
    v6[1] = a3;
    v6[2] = a2;
    ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", a1, a3, "events", a2);
  }
  return v7;
}

uint64_t tls_metric_insecure_dh_param()
{
  uint64_t result = arc4random_uniform(0x64u);
  if (result <= 9)
  {
    if (process_identifier___csops_once != -1) {
      dispatch_once(&process_identifier___csops_once, &__block_literal_global);
    }
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 0x40000000;
    v2[2] = __tls_metric_insecure_dh_param_block_invoke;
    v2[3] = &__block_descriptor_tmp;
    v2[4] = process_identifier_data;
    uint64_t v4 = 0;
    unint64_t v5 = &v4;
    uint64_t v6 = 0x2000000000;
    uint64_t v1 = (uint64_t (*)(const char *, void *))getanalytics_send_event_lazySymbolLoc_ptr;
    unsigned int v7 = getanalytics_send_event_lazySymbolLoc_ptr;
    if (!getanalytics_send_event_lazySymbolLoc_ptr)
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 0x40000000;
      void v3[2] = __getanalytics_send_event_lazySymbolLoc_block_invoke;
      v3[3] = &unk_264124AF8;
      v3[4] = &v4;
      __getanalytics_send_event_lazySymbolLoc_block_invoke((uint64_t)v3);
      uint64_t v1 = (uint64_t (*)(const char *, void *))v5[3];
    }
    _Block_object_dispose(&v4, 8);
    if (!v1) {
      tls_metric_insecure_dh_param_cold_1();
    }
    return v1("com.apple.coretls.insecureDHParams", v2);
  }
  return result;
}

xpc_object_t __tls_metric_insecure_dh_param_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "Client", *(const char **)(a1 + 32));
  return v2;
}

void __process_identifier_block_invoke()
{
  getpid();
  if (csops() != -1) {
    goto LABEL_7;
  }
  if (*__error() != 34) {
    goto LABEL_7;
  }
  uint64_t v0 = bswap32(0xAAAAAAAA);
  if ((v0 - 1025) < 0xFFFFFC07) {
    goto LABEL_7;
  }
  uint64_t v1 = (char *)malloc_type_malloc((v0 + 1), 0x167FC559uLL);
  if (!v1) {
    goto LABEL_7;
  }
  xpc_object_t v2 = v1;
  getpid();
  if (csops())
  {
    free(v2);
LABEL_7:
    xpc_object_t v2 = 0;
    unsigned int v3 = "no_bundle_id";
    goto LABEL_8;
  }
  v2[v0] = 0;
  if (strncmp(v2 + 8, "com.apple.", 0xAuLL))
  {
    uint64_t v4 = 0;
    unsigned int v3 = "redacted_bundle_id";
    while (strcmp(top_bundles[v4], v2 + 8))
    {
      if (++v4 == 249) {
        goto LABEL_8;
      }
    }
  }
  unsigned int v3 = strdup(v2 + 8);
LABEL_8:
  process_identifier_data = (uint64_t)v3;
  free(v2);
}

void ADClientIncValueForScalarKeyWithFormat(char *a1, ...)
{
  va_start(va, a1);
  v3[0] = 0;
  va_copy((va_list)&v3[1], va);
  vasprintf((char **)v3, a1, va);
  uint64_t v1 = (const char *)v3[0];
  if (v3[0])
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v2, "operation", 5);
    xpc_dictionary_set_int64(v2, "value", 1);
    xpc_dictionary_set_string(v2, "key", v1);
    if (connection___once != -1) {
      dispatch_once(&connection___once, &__block_literal_global_301);
    }
    xpc_connection_send_notification();
    xpc_release(v2);
    free(v3[0]);
  }
}

void __connection_block_invoke()
{
  if (queue___once != -1) {
    dispatch_once(&queue___once, &__block_literal_global_310);
  }
  connection___connection = (uint64_t)xpc_connection_create_mach_service("com.apple.aggregated", (dispatch_queue_t)queue___queue, 0);
  xpc_connection_set_event_handler((xpc_connection_t)connection___connection, &__block_literal_global_306);
  uint64_t v0 = (_xpc_connection_s *)connection___connection;

  xpc_connection_resume(v0);
}

uint64_t __connection_block_invoke_2(int a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
  return fprintf((FILE *)*MEMORY[0x263EF8348], "error in %s: %s\n", "connection_block_invoke_2", string);
}

dispatch_queue_t __queue_block_invoke()
{
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.aggregated.requestQueue", v0);
  queue___queue = (uint64_t)result;
  return result;
}

void *__getanalytics_send_event_lazySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    void v5[2] = 0x40000000;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke;
    void v5[4] = &__block_descriptor_tmp_315;
    v5[5] = v5;
    long long v6 = xmmword_264124B18;
    uint64_t v7 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    unsigned int v3 = (void *)v5[0];
    xpc_object_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
    if (CoreAnalyticsLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      unsigned int v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  xpc_object_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
LABEL_5:
  dispatch_queue_t result = dlsym(v2, "analytics_send_event_lazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getanalytics_send_event_lazySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t SSLProcessServerKeyExchange(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  tls_handshake_set_session_warning(a3, 0);
  unsigned int v6 = *(_DWORD *)(a3 + 336);
  uint64_t ready = 4294967292;
  if (v6 <= 0x12)
  {
    if (((1 << v6) & 0x28200) != 0)
    {
      if (a1 <= 1)
      {
        __ssl_debug("sslError", "SSLDecodeSignedServerKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 717, "SSLDecodeSignedServerKeyExchange: msg len error 1\n");
        return 4294957496;
      }
      size_t v29 = a2;
      switch(v6)
      {
        case 0x11u:
          int v9 = 1;
          break;
        case 0xFu:
          int v9 = 0;
          break;
        case 9u:
          uint64_t ready = SSLDecodeDHKeyParams(a3, &v29, a1);
          if (ready) {
            return ready;
          }
          int v9 = 1;
          goto LABEL_27;
        default:
          return 4294957486;
      }
      uint64_t ready = SSLDecodeECDHKeyParams(a3, (const void **)&v29, a1);
      if (ready) {
        return ready;
      }
LABEL_27:
      unint64_t v12 = (unint64_t)&a2[a1];
      size_t v13 = v29;
      if (*(unsigned char *)(a3 + 16)) {
        unsigned int v14 = 65279;
      }
      else {
        unsigned int v14 = 770;
      }
      if (*(_DWORD *)a3 <= v14)
      {
        uint64_t v15 = v29;
      }
      else
      {
        uint64_t v15 = v29 + 2;
        if ((unint64_t)(v29 + 2) > v12)
        {
          __ssl_debug("sslError", "SSLDecodeSignedServerKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 757, "signedServerKeyExchange: msg len error 499\n", v28, v29);
          return 4294957496;
        }
        *(_DWORD *)(a3 + 824) = *v29;
        *(_DWORD *)(a3 + 828) = v13[1];
      }
      unsigned __int16 v16 = SSLDecodeInt(v15, 2);
      size_t v29 = v15 + 2;
      if (&v15[v16 + 2] == (unsigned __int8 *)v12)
      {
        if (*(unsigned char *)(a3 + 16)) {
          unsigned int v17 = 65279;
        }
        else {
          unsigned int v17 = 770;
        }
        if (*(_DWORD *)a3 <= v17)
        {
          int64_t v40 = v13 - a2;
          long long v41 = a2;
          unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v39 = (long long *)0xAAAAAAAAAAAAAAAALL;
          LODWORD(v44) = -1431655766;
          *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v42 = v20;
          long long v43 = v20;
          unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v31 = 0;
          size_t v36 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v37 = 0;
          uint64_t v34 = 32;
          uint64_t v35 = a3 + 436;
          uint64_t v32 = 32;
          uint64_t v33 = a3 + 468;
          if (!v9) {
            goto LABEL_71;
          }
          unint64_t v38 = 16;
          unint64_t v39 = &v42;
          uint64_t ready = ReadyHash((uint64_t)&SSLHashMD5, &v36);
          if (!ready)
          {
            uint64_t v21 = off_26C2424E8;
            uint64_t ready = off_26C2424E8();
            if (!ready)
            {
              uint64_t ready = v21();
              if (!ready)
              {
                uint64_t ready = v21();
                if (!ready)
                {
                  uint64_t ready = ((uint64_t (*)(uint64_t, void *))off_26C2424F0[0])((uint64_t)&v36, &v38);
                  if (!ready)
                  {
LABEL_71:
                    unint64_t v38 = 20;
                    unint64_t v39 = &v43;
                    uint64_t ready = SSLFreeBuffer(&v36);
                    if (!ready)
                    {
                      uint64_t ready = ReadyHash((uint64_t)&SSLHashSHA1, &v36);
                      if (!ready)
                      {
                        unsigned int v22 = off_26C242520;
                        uint64_t ready = off_26C242520();
                        if (!ready)
                        {
                          uint64_t ready = v22();
                          if (!ready)
                          {
                            uint64_t ready = v22();
                            if (!ready)
                            {
                              uint64_t ready = ((uint64_t (*)(uint64_t, void *))off_26C242528[0])((uint64_t)&v36, &v38);
                              if (!ready)
                              {
                                uint64_t ready = sslRawVerify(a3 + 40);
                                if (ready) {
                                  __ssl_debug("sslError", "SSLVerifySignedServerKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 609, "SSLDecodeSignedServerKeyExchange: sslRawVerify returned %d\n", ready);
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        else
        {
          unint64_t v18 = *(void *)(a3 + 824);
          int64_t v40 = v13 - a2;
          long long v41 = a2;
          size_t v36 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v37 = 0;
          uint64_t v34 = 32;
          uint64_t v35 = a3 + 436;
          uint64_t v33 = a3 + 468;
          uint64_t v31 = 0;
          uint64_t v32 = 32;
          int v19 = v18 - 2;
          if ((v18 - 2) >= 5 || ((0x1Du >> v19) & 1) == 0)
          {
            __ssl_debug("sslError", "SSLVerifySignedServerKeyExchangeTls12", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 654, "SSLVerifySignedServerKeyExchangeTls12: unsupported hash %d\n");
            return 4294957496;
          }
          uint64_t v23 = off_264124B50[v19];
          *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v44 = v24;
          long long v45 = v24;
          long long v42 = v24;
          long long v43 = v24;
          unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v38 = *v23;
          unint64_t v39 = &v42;
          uint64_t ready = ReadyHash((uint64_t)v23, &v36);
          if (!ready)
          {
            unint64_t v25 = (uint64_t (*)(size_t *, uint64_t *))*((void *)v23 + 3);
            uint64_t ready = v25(&v36, &v34);
            if (!ready)
            {
              uint64_t ready = v25(&v36, &v32);
              if (!ready)
              {
                uint64_t ready = v25(&v36, &v40);
                if (!ready)
                {
                  uint64_t ready = (*((uint64_t (**)(size_t *, unint64_t *))v23 + 4))(&v36, &v38);
                  if (!ready)
                  {
                    uint64_t v26 = a3 + 40;
                    if (HIDWORD(v18) == 1) {
                      uint64_t v27 = sslRsaVerify(v26);
                    }
                    else {
                      uint64_t v27 = sslRawVerify(v26);
                    }
                    uint64_t ready = v27;
                    if (v27) {
                      __ssl_debug("sslError", "SSLVerifySignedServerKeyExchangeTls12", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 691, "SSLDecodeSignedServerKeyExchangeTls12: sslRawVerify returned %d\n", v27);
                    }
                  }
                }
              }
            }
          }
        }
        SSLFreeBuffer(&v30);
        SSLFreeBuffer(&v36);
        return ready;
      }
      __ssl_debug("sslError", "SSLDecodeSignedServerKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 767, "signedServerKeyExchange: msg len error 4\n", v28, v29);
      return 4294957496;
    }
    if (((1 << v6) & 0x40800) == 0) {
      return ready;
    }
    *(void *)&long long v42 = a2;
    if (v6 == 18)
    {
      unsigned int v8 = SSLDecodeECDHKeyParams(a3, (const void **)&v42, a1);
    }
    else
    {
      if (v6 != 11) {
        return 4294957486;
      }
      unsigned int v8 = SSLDecodeDHKeyParams(a3, (unsigned __int8 **)&v42, a1);
    }
    if (&a2[a1] == (unsigned __int8 *)v42) {
      unsigned int v10 = 0;
    }
    else {
      unsigned int v10 = -9800;
    }
    if (v8) {
      return v8;
    }
    else {
      return v10;
    }
  }
  return ready;
}

uint64_t SSLEncodeKeyExchange(size_t *a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a2 + 336);
  if (v4 > 0x13) {
    goto LABEL_26;
  }
  if (((1 << v4) & 0x68000) == 0)
  {
    if (((1 << v4) & 0xA00) != 0)
    {
      unsigned int v6 = (uint64_t *)(a2 + 104);
      unint64_t v5 = *(void **)(a2 + 104);
      size_t v36 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v37 = (void **)0xAAAAAAAAAAAAAAAALL;
      sslFree(v5);
      SSLFreeBuffer((void *)(a2 + 504));
      if (*(void *)(a2 + 96))
      {
        if (cczp_bitlen() < (unint64_t)*(unsigned int *)(a2 + 76)) {
          return 4294957446;
        }
        uint64_t Key = sslDhCreateKey(*(void *)(a2 + 96), (void *)(a2 + 104));
        if (!Key)
        {
          uint64_t v7 = sslDhKeyExchange(*(uint64_t **)(a2 + 104), a2 + 80, (size_t *)(a2 + 504));
          if (!v7)
          {
            uint64_t v7 = sslDhExportPub(*v6, &v36);
            if (!v7)
            {
              unint64_t v25 = v36 + 2;
              uint64_t v26 = 12;
              if (!*(unsigned char *)(a2 + 16)) {
                uint64_t v26 = 4;
              }
              uint64_t v7 = SSLAllocBuffer(a1, v26 + v25);
              if (!v7)
              {
                uint64_t v14 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 16, v25);
                unint64_t v15 = v36;
                uint64_t v16 = 2;
                goto LABEL_39;
              }
            }
          }
          return v7;
        }
        return Key;
      }
      return 4294957496;
    }
    if (v4 == 19)
    {
      unint64_t v17 = *(void *)(a2 + 912) + 2;
      uint64_t v18 = 12;
      if (!*(unsigned char *)(a2 + 16)) {
        uint64_t v18 = 4;
      }
      uint64_t v7 = SSLAllocBuffer(a1, v18 + v17);
      if (!v7)
      {
        uint64_t v19 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 16, v17);
        long long v20 = (void *)SSLEncodeInt(v19, *(void *)(a2 + 912), 2);
        memcpy(v20, *(const void **)(a2 + 920), *(void *)(a2 + 912));
        unint64_t v21 = *(void *)(a2 + 896);
        if (v21)
        {
          uint64_t v7 = SSLAllocBuffer((size_t *)(a2 + 504), 2 * v21 + 4);
          if (!v7)
          {
            unsigned int v22 = (void *)SSLEncodeInt(*(void *)(a2 + 512), v21, 2);
            bzero(v22, v21);
            uint64_t v23 = (void *)SSLEncodeInt((uint64_t)v22 + v21, v21, 2);
            memcpy(v23, *(const void **)(a2 + 904), v21);
            return 0;
          }
        }
        else
        {
          return 4294957448;
        }
      }
      return v7;
    }
LABEL_26:
    if (v4 != 1)
    {
      __ssl_debug("sslError", "SSLEncodeKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1823, "SSLEncodeKeyExchange: unknown method (%d)\n", v4);
      return 4294967292;
    }
    if (!*(unsigned char *)(a2 + 40) || !*(void *)(a2 + 48))
    {
      __ssl_debug("sslError", "SSLEncodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 954, "SSLEncodeRSAKeyExchange: no RSA peer pub key\n");
      return 4294957487;
    }
    uint64_t Key = SSLAllocBuffer((size_t *)(a2 + 504), 0x30uLL);
    if (!Key)
    {
      size_t v35 = 0xAAAAAAAAAAAAAAAALL;
      SSLEncodeInt(*(void *)(a2 + 512), *(unsigned int *)(a2 + 4), 2);
      size_t v29 = (void **)(*(void *)(a2 + 512) + 2);
      size_t v36 = 46;
      uint64_t v37 = v29;
      uint64_t v7 = sslRand(&v36);
      if (!v7)
      {
        unint64_t v30 = sslPubKeyLengthInBytes();
        if (!v30) {
          __ssl_debug("sslError", "SSLEncodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 965, "SSLEncodeRSAKeyExchange: peer key modulus is 0\n");
        }
        unsigned int v31 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 <= 0x300u) {
          unint64_t v32 = v30;
        }
        else {
          unint64_t v32 = v30 + 2;
        }
        if (*(unsigned char *)(a2 + 16)) {
          uint64_t v33 = 12;
        }
        else {
          uint64_t v33 = 4;
        }
        uint64_t v7 = SSLAllocBuffer(a1, v33 + v32);
        if (!v7)
        {
          uint64_t v34 = (char *)(a1[1] + v33 + 2 * (v31 > 0x300));
          SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 16, v32);
          if (v31 >= 0x301) {
            SSLEncodeInt(a1[1] + v33, v30, 2);
          }
          uint64_t v7 = sslRsaEncrypt(a2 + 40, *(const void **)(a2 + 512), 0x30uLL, v34, v30, &v35);
          if (v7) {
            __ssl_debug("sslError", "SSLEncodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1004, "SSLEncodeRSAKeyExchange: error %d\n", v7);
          }
        }
      }
      return v7;
    }
    return Key;
  }
  size_t v36 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v37 = (void **)0xAAAAAAAAAAAAAAAALL;
  BOOL v8 = v4 > 0x12;
  int v9 = (1 << v4) & 0x68000;
  if (v8 || v9 == 0) {
    return 4294957486;
  }
  if (!*(void *)(a2 + 136))
  {
    __ssl_debug("sslError", "SSLGenClientECDHKeyAndExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1399, "SSLGenClientECDHKeyAndExchange: incomplete server params\n");
    return 4294957496;
  }
  uint64_t EcPubKeyFromBits = sslGetEcPubKeyFromBits(*(_DWORD *)(a2 + 144), (void *)(a2 + 128), (uint64_t)&v36);
  if (EcPubKeyFromBits
    || (sslFree(*(void **)(a2 + 152)),
        uint64_t EcPubKeyFromBits = sslEcdhCreateKey(*v37, (void *)(a2 + 152)),
        EcPubKeyFromBits))
  {
    uint64_t v7 = EcPubKeyFromBits;
    sslFreePubKey((uint64_t)&v36);
    return v7;
  }
  SSLFreeBuffer((void *)(a2 + 504));
  uint64_t v7 = sslEcdhKeyExchange(*(uint64_t ***)(a2 + 152), (uint64_t)v37, (size_t *)(a2 + 504));
  sslFreePubKey((uint64_t)&v36);
  if (!v7)
  {
    size_t v36 = 0;
    uint64_t v37 = 0;
    sslEcdhExportPub(*(void *)(a2 + 152), &v36);
    unint64_t v12 = v36 + 1;
    uint64_t v13 = 12;
    if (!*(unsigned char *)(a2 + 16)) {
      uint64_t v13 = 4;
    }
    uint64_t v7 = SSLAllocBuffer(a1, v13 + v12);
    if (!v7)
    {
      uint64_t v14 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 16, v12);
      unint64_t v15 = v36;
      uint64_t v16 = 1;
LABEL_39:
      uint64_t v27 = (void *)SSLEncodeInt(v14, v15, v16);
      memcpy(v27, v37, v36);
      SSLFreeBuffer(&v36);
    }
  }
  return v7;
}

uint64_t SSLGenServerDHParamsAndKey(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (!v2) {
    uint64_t v2 = ccdh_gp_rfc5114_MODP_2048_256();
  }

  return sslDhCreateKey(v2, (void *)(a1 + 104));
}

uint64_t SSLEncodedDHKeyParamsLen(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 104);
  MEMORY[0x2105638A0](v1);
  MEMORY[0x2105638B0](v1);
  uint64_t v2 = ccn_write_uint_size();
  ccdh_gp_g();
  uint64_t v3 = ccn_write_uint_size();
  ccdh_ctx_public();
  return v2 + v3 + ccdh_export_pub_size() + 6;
}

uint64_t SSLEncodeDHKeyParams(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = **(void **)(a1 + 104);
  MEMORY[0x2105638A0](v3);
  MEMORY[0x2105638B0](v3);
  unint64_t v4 = ccn_write_uint_size();
  ccdh_gp_g();
  unint64_t v5 = ccn_write_uint_size();
  ccdh_ctx_public();
  unint64_t v6 = ccdh_export_pub_size();
  uint64_t v7 = SSLEncodeInt(a2, v4, 2);
  MEMORY[0x2105638B0](v3);
  ccn_write_uint();
  uint64_t v8 = SSLEncodeInt(v7 + v4, v5, 2);
  ccdh_gp_g();
  ccn_write_uint();
  SSLEncodeInt(v8 + v5, v6, 2);
  ccdh_ctx_public();

  return ccdh_export_pub();
}

uint64_t SSLDecodeDHKeyParams(uint64_t a1, unsigned __int8 **a2, uint64_t a3)
{
  unint64_t v5 = (unint64_t)&(*a2)[a3];
  unint64_t v6 = (size_t *)(a1 + 80);
  SSLFreeBuffer((void *)(a1 + 80));
  if ((unint64_t)(*a2 + 2) > v5) {
    return 4294957496;
  }
  unsigned int v7 = SSLDecodeInt(*a2, 2);
  uint64_t v8 = (uint64_t)(*a2 + 2);
  *a2 = (unsigned __int8 *)v8;
  int v9 = (unsigned __int8 *)(v8 + v7);
  if ((unint64_t)v9 > v5) {
    return 4294957496;
  }
  v17[0] = v7;
  v17[1] = v8;
  *a2 = v9;
  if ((unint64_t)(v9 + 2) > v5) {
    return 4294957496;
  }
  unsigned int v10 = SSLDecodeInt(v9, 2);
  uint64_t v11 = (uint64_t)(*a2 + 2);
  *a2 = (unsigned __int8 *)v11;
  unint64_t v12 = (unsigned __int8 *)(v11 + v10);
  if ((unint64_t)v12 > v5) {
    return 4294957496;
  }
  v16[0] = v10;
  v16[1] = v11;
  *a2 = v12;
  sslFree(*(void **)(a1 + 96));
  uint64_t result = sslEncodeDhParams(a1, (void *)(a1 + 96), (uint64_t)v17, (uint64_t)v16);
  if (!result)
  {
    if ((unint64_t)(*a2 + 2) > v5) {
      return 4294957496;
    }
    unsigned int v14 = SSLDecodeInt(*a2, 2);
    *a2 += 2;
    size_t v15 = v14;
    uint64_t result = SSLAllocBuffer(v6, v14);
    if (!result)
    {
      memmove(*(void **)(a1 + 88), *a2, v15);
      uint64_t result = 0;
      *a2 += v15;
    }
  }
  return result;
}

uint64_t SSLDecodeECDHKeyParams(uint64_t a1, const void **a2, uint64_t a3)
{
  unint64_t v5 = (unsigned __int8 *)*a2 + a3;
  unint64_t v6 = (size_t *)(a1 + 128);
  SSLFreeBuffer((void *)(a1 + 128));
  unsigned int v7 = (unsigned __int8 *)*a2;
  uint64_t v8 = (unsigned __int8 *)*a2 + 1;
  if (v8 > v5) {
    return 4294957496;
  }
  int v10 = *v7;
  int v9 = v7 + 3;
  *a2 = v8;
  if (v10 != 3 || v9 > v5) {
    return 4294957496;
  }
  int v12 = SSLDecodeInt(v8, 2);
  *(_DWORD *)(a1 + 144) = v12;
  uint64_t v13 = (char *)*a2;
  unsigned int v14 = (unsigned __int8 *)*a2 + 2;
  *a2 = v14;
  size_t v15 = v13 + 3;
  if ((v12 - 26) < 0xFFFFFFFD || v15 > (char *)v5) {
    return 4294957496;
  }
  unsigned int v17 = SSLDecodeInt(v14, 1);
  uint64_t v18 = (uint64_t)*a2 + 1;
  *a2 = (const void *)v18;
  if (v18 + (unint64_t)v17 > (unint64_t)v5) {
    return 4294957496;
  }
  size_t v20 = v17;
  uint64_t result = SSLAllocBuffer(v6, v17);
  if (!result)
  {
    memmove(*(void **)(a1 + 136), *a2, v20);
    uint64_t result = 0;
    *a2 = (char *)*a2 + v20;
  }
  return result;
}

uint64_t SSLProcessAlert(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1)
  {
    unsigned int v14 = SSLFatalSessionAlert(47, a3);
    if (v14) {
      return v14;
    }
    else {
      return 4294957496;
    }
  }
  if (!a1) {
    return 0;
  }
  uint64_t v5 = 0;
  char v6 = 0;
  uint64_t v7 = a1 - 2;
  while (1)
  {
    uint64_t v8 = v7;
    int v9 = *a2;
    int v10 = a2[1];
    if (v9 == 2)
    {
      __ssl_debug("sslError", "SSLProcessAlert", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAlertMessage.c", 112, "***Fatal alert %d received\n", a2[1]);
      char v6 = 1;
    }
    int v11 = *(unsigned __int8 *)(a3 + 17);
    if (!*(unsigned char *)(a3 + 17) && *(_DWORD *)(a3 + 428) == 2 && ((v10 - 42) < 5 || v10 == 48)) {
      *(_DWORD *)(a3 + 428) = 3;
    }
    if (v10 > 69) {
      break;
    }
    int v12 = v10 - 20;
    uint64_t v13 = 4294957471;
    switch(v12)
    {
      case 0:
        uint64_t v13 = 4294957476;
        goto LABEL_61;
      case 1:
        uint64_t v13 = 4294957475;
        goto LABEL_61;
      case 2:
        uint64_t v13 = 4294957474;
        goto LABEL_61;
      case 10:
        uint64_t v13 = 4294957473;
        goto LABEL_61;
      case 20:
        uint64_t v13 = 4294957472;
        goto LABEL_61;
      case 21:
        if (v11)
        {
          uint64_t v13 = v5;
          if (*(_DWORD *)(a3 + 380) == 10)
          {
            uint64_t v13 = SSLAdvanceHandshake(11, a3);
            if (v13) {
              return v13;
            }
          }
          goto LABEL_56;
        }
        uint64_t v13 = v5;
        if (v6)
        {
LABEL_60:
          if (v6) {
            goto LABEL_61;
          }
          return v13;
        }
        break;
      case 22:
        goto LABEL_56;
      case 23:
        uint64_t v13 = 4294957470;
        if (v6) {
          goto LABEL_60;
        }
        break;
      case 24:
        uint64_t v13 = 4294957469;
        if (v6) {
          goto LABEL_60;
        }
        break;
      case 25:
        uint64_t v13 = 4294957468;
        if (v6) {
          goto LABEL_60;
        }
        break;
      case 26:
        uint64_t v13 = 4294957467;
        if (v6) {
          goto LABEL_60;
        }
        break;
      case 27:
        uint64_t v13 = 4294957466;
        goto LABEL_61;
      case 28:
        uint64_t v13 = 4294957465;
        if (v6) {
          goto LABEL_60;
        }
        break;
      case 29:
        uint64_t v13 = 4294957464;
        if (v6) {
          goto LABEL_60;
        }
        break;
      case 30:
        uint64_t v13 = 4294957463;
        if (v6) {
          goto LABEL_60;
        }
        break;
      case 31:
        uint64_t v13 = 4294957462;
        if (v6) {
          goto LABEL_60;
        }
        break;
      case 40:
        uint64_t v13 = 4294957461;
        if (v6) {
          goto LABEL_60;
        }
        break;
      default:
        goto LABEL_53;
    }
LABEL_57:
    uint64_t v7 = v8 - 2;
    a2 += 2;
    uint64_t v5 = v13;
    if (!v8) {
      goto LABEL_60;
    }
  }
  if (v10 <= 89)
  {
    switch(v10)
    {
      case 'F':
        uint64_t v13 = 4294957460;
        if (v6) {
          goto LABEL_60;
        }
        goto LABEL_57;
      case 'G':
        uint64_t v13 = 4294957459;
        if (v6) {
          goto LABEL_60;
        }
        goto LABEL_57;
      case 'P':
        uint64_t v13 = 4294957458;
        if (v6) {
          goto LABEL_60;
        }
        goto LABEL_57;
    }
    goto LABEL_53;
  }
  if (v10 == 90)
  {
    uint64_t v13 = 4294957457;
    if (v6) {
      goto LABEL_60;
    }
    goto LABEL_57;
  }
  if (v10 == 100)
  {
    uint64_t v13 = 4294957456;
    if (v6) {
      goto LABEL_60;
    }
    goto LABEL_57;
  }
  if (v10 != 110)
  {
LABEL_53:
    if (v9 == 2) {
      uint64_t v13 = 4294957494;
    }
    else {
      uint64_t v13 = 0;
    }
LABEL_56:
    if (v6) {
      goto LABEL_60;
    }
    goto LABEL_57;
  }
  uint64_t v13 = 4294957494;
LABEL_61:
  SSLDeleteSessionData((void *)a3);
  return v13;
}

uint64_t SSLFatalSessionAlert(int a1, uint64_t a2)
{
  int v3 = a1;
  *(_DWORD *)(a2 + 380) = 4;
  if (*(_DWORD *)a2 > 0x300u) {
    goto LABEL_5;
  }
  uint64_t v4 = (a1 - 48);
  if (v4 <= 0x34)
  {
    if (((1 << (a1 - 48)) & 0x10040000C0000ELL) != 0)
    {
LABEL_4:
      int v3 = 40;
      goto LABEL_5;
    }
    if (a1 == 48)
    {
      int v3 = 43;
      goto LABEL_5;
    }
    if (v4 == 32)
    {
      int v3 = 0;
      goto LABEL_5;
    }
  }
  if (a1 == 22) {
    goto LABEL_4;
  }
LABEL_5:
  unsigned int v5 = SSLDeleteSessionData((void *)a2);
  LODWORD(result) = SSLSendAlert(2, v3, a2);
  *(unsigned char *)(a2 + 704) = 1;
  if (v5) {
    return v5;
  }
  else {
    return result;
  }
}

uint64_t SSLProcessSSL2Message(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3 = a1 - 3;
  if (a1 < 3) {
    return 4294967246;
  }
  __int16 v7 = SSLDecodeInt(a2, 2);
  if ((v7 & 0x8000) == 0) {
    return 4294967246;
  }
  if (a1 != (v7 & 0x7FFF) + 2 || a2[2] != 1) {
    return 4294967246;
  }
  uint64_t v9 = SSLProcessSSL2ClientHello(v3, a2 + 3, a3);
  if (v9) {
    return v9;
  }
  v13[0] = a1 - 2;
  v13[1] = a2 + 2;
  uint64_t v10 = SSLUpdateHandshakeMacs((uint64_t)v13, a3);
  if (!v10) {
    return SSLAdvanceHandshake(1, a3);
  }
  uint64_t v11 = v10;
  SSLFatalSessionAlert(80, a3);
  return v11;
}

uint64_t DTLSRetransmit(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 672)
    || (uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 1112) + 80))(*(void *)(a1 + 1104)),
        !result))
  {
    return SSLSendFlight(a1);
  }
  return result;
}

uint64_t SSLResumeServerSide(uint64_t a1)
{
  uint64_t v2 = SSLPrepareAndQueueMessage((uint64_t (*)(size_t *, uint64_t))SSLEncodeServerHello, 22, a1);
  if (!v2)
  {
    uint64_t v3 = SSLInitPendingCiphers(a1);
    if (v3)
    {
      uint64_t v2 = v3;
      SSLFatalSessionAlert(80, a1);
    }
    else
    {
      uint64_t v2 = SSLPrepareAndQueueMessage((uint64_t (*)(size_t *, uint64_t))SSLEncodeChangeCipherSpec, 20, a1);
      if (!v2)
      {
        uint64_t v2 = SSLPrepareAndQueueMessage(SSLEncodeFinishedMessage, 22, a1);
        if (!v2) {
          *(_DWORD *)(a1 + 380) = 14;
        }
      }
    }
  }
  return v2;
}

uint64_t sslGetMaxProtVersion(uint64_t a1, _DWORD *a2)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (!v2) {
    return 4294967246;
  }
  uint64_t result = 0;
  *a2 = v2;
  return result;
}

uint64_t SSLEncodeNPNEncryptedExtensionMessage(size_t *a1, uint64_t a2)
{
  if (!*(void *)(a2 + 944)) {
    return 4294957448;
  }
  int v4 = *(_DWORD *)(a2 + 936);
  int v5 = ((_BYTE)v4 + 2) & 0x1F;
  unint64_t v6 = (v4 - v5 + 34);
  if (*(unsigned char *)(a2 + 16)) {
    int v7 = 12;
  }
  else {
    int v7 = 4;
  }
  uint64_t result = SSLAllocBuffer(a1, (v6 + v7));
  if (!result)
  {
    unint64_t v9 = (32 - v5);
    uint64_t v10 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 67, v6);
    uint64_t v11 = (void *)SSLEncodeInt(v10, *(void *)(a2 + 936), 1);
    memcpy(v11, *(const void **)(a2 + 944), *(void *)(a2 + 936));
    int v12 = (void *)SSLEncodeInt((uint64_t)v11 + *(void *)(a2 + 936), v9, 1);
    bzero(v12, v9);
    uint64_t result = 0;
    *(unsigned char *)(a2 + 931) = 1;
  }
  return result;
}

uint64_t SSLProcessEncryptedExtension(size_t size, const void *a2, uint64_t a3)
{
  if (!*(unsigned char *)(a3 + 930)) {
    return 4294957496;
  }
  *(unsigned char *)(a3 + 932) = 1;
  uint64_t result = SSLAllocBuffer((size_t *)(a3 + 952), size);
  if (!result)
  {
    memcpy(*(void **)(a3 + 960), a2, *(void *)(a3 + 952));
    return 0;
  }
  return result;
}

uint64_t SSLProcessServerHelloDone(uint64_t result)
{
  if (result)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloDone", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeFinish.c", 269, "SSLProcessServerHelloDone: nonzero msg len\n");
    return 4294957496;
  }
  return result;
}

uint64_t tls1GenerateMasterSecret(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v11[0] = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = 0xAAAAAAAAAAAAAAAALL;
  int v13 = -1431655766;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = v2;
  v12[1] = v2;
  if (*(unsigned char *)(a1 + 768) && *(unsigned char *)(a1 + 769))
  {
    v11[1] = 0;
    v10[1] = 0;
    uint64_t v3 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, v11);
    if (!v3)
    {
      uint64_t v4 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, v10);
      if (v4)
      {
        uint64_t v3 = v4;
        int v5 = v11;
      }
      else
      {
        *(void *)&v14[0] = 16;
        *((void *)&v14[0] + 1) = v12;
        uint64_t v9 = ((uint64_t (*)(uint64_t, void *))off_26C2424F0[0])((uint64_t)v10, v14);
        if (!v9)
        {
          *(void *)&v14[0] = 20;
          *((void *)&v14[0] + 1) += 16;
          uint64_t v9 = ((uint64_t (*)(uint64_t, void *))off_26C242528[0])((uint64_t)v11, v14);
          if (!v9) {
            uint64_t v9 = tls_handshake_internal_prf(a1, *(void *)(a1 + 512), *(void *)(a1 + 504), "extended master secret", 0x16uLL, v12, 0x24uLL, (char *)(a1 + 520), 0x30uLL);
          }
        }
        uint64_t v3 = v9;
        SSLFreeBuffer(v11);
        int v5 = v10;
      }
      SSLFreeBuffer(v5);
    }
  }
  else
  {
    long long v6 = *(_OWORD *)(a1 + 452);
    v14[0] = *(_OWORD *)(a1 + 436);
    v14[1] = v6;
    long long v7 = *(_OWORD *)(a1 + 484);
    void v14[2] = *(_OWORD *)(a1 + 468);
    v14[3] = v7;
    return tls_handshake_internal_prf(a1, *(void *)(a1 + 512), *(void *)(a1 + 504), "master secret", 0xDuLL, v14, 0x40uLL, (char *)(a1 + 520), 0x30uLL);
  }
  return v3;
}

uint64_t tls1ComputeFinishedMac(uint64_t a1, size_t a2, char *a3, int a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v17 = -1431655766;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[0] = v8;
  v16[1] = v8;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v15 = (_OWORD *)0xAAAAAAAAAAAAAAAALL;
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0;
  v12[0] = 0xAAAAAAAAAAAAAAAALL;
  v12[1] = 0;
  uint64_t v9 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, v13);
  if (v9) {
    goto LABEL_3;
  }
  uint64_t v9 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, v12);
  if (v9) {
    goto LABEL_3;
  }
  if (a4) {
    uint64_t v11 = "server finished";
  }
  else {
    uint64_t v11 = "client finished";
  }
  unint64_t v14 = 16;
  uint64_t v15 = v16;
  uint64_t v9 = ((uint64_t (*)(uint64_t, void *))off_26C2424F0[0])((uint64_t)v12, &v14);
  if (!v9)
  {
    unint64_t v14 = 20;
    ++v15;
    uint64_t v9 = ((uint64_t (*)(uint64_t, void *))off_26C242528[0])((uint64_t)v13, &v14);
    if (!v9)
    {
      uint64_t v9 = tls_handshake_internal_prf(a1, a1 + 520, 0x30uLL, v11, 0xFuLL, v16, 0x24uLL, a3, a2);
LABEL_3:
      SSLFreeBuffer(v13);
      SSLFreeBuffer(v12);
    }
  }
  return v9;
}

uint64_t tls1ComputeCertVfyMac(uint64_t a1, uint64_t *a2)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  v9[0] = 0xAAAAAAAAAAAAAAAALL;
  v9[1] = 0;
  v8[0] = 0xAAAAAAAAAAAAAAAALL;
  v8[1] = 0;
  uint64_t v4 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, v9);
  if (!v4)
  {
    uint64_t v4 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, v8);
    if (!v4)
    {
      uint64_t v5 = a2[1];
      if (*(_DWORD *)(a1 + 784) == 64)
      {
        uint64_t v6 = 20;
LABEL_7:
        *a2 = v6;
        unint64_t v10 = 20;
        unint64_t v11 = v5;
        uint64_t v4 = ((uint64_t (*)(uint64_t, void *))off_26C242528[0])((uint64_t)v9, &v10);
        goto LABEL_8;
      }
      unint64_t v10 = 16;
      unint64_t v11 = v5;
      uint64_t v4 = ((uint64_t (*)(uint64_t, void *))off_26C2424F0[0])((uint64_t)v8, &v10);
      if (!v4)
      {
        uint64_t v5 = a2[1] + 16;
        uint64_t v6 = 36;
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  SSLFreeBuffer(v9);
  SSLFreeBuffer(v8);
  return v4;
}

uint64_t SSLEncodeServerHelloRequest(size_t *a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 16)) {
    size_t v4 = 12;
  }
  else {
    size_t v4 = 4;
  }
  uint64_t v5 = SSLAllocBuffer(a1, v4);
  if (!v5) {
    SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 0, 0);
  }
  return v5;
}

uint64_t SSLEncodeServerHelloVerifyRequest(size_t *a1, unsigned int *a2)
{
  unint64_t v4 = *((void *)a2 + 23) + 3;
  uint64_t v5 = 12;
  if (!*((unsigned char *)a2 + 16)) {
    uint64_t v5 = 4;
  }
  uint64_t result = SSLAllocBuffer(a1, v5 + v4);
  if (!result)
  {
    uint64_t v7 = SSLEncodeHandshakeHeader((uint64_t)a2, (uint64_t)a1, 3, v4);
    long long v8 = (unsigned char *)SSLEncodeInt(v7, *a2, 2);
    *long long v8 = *((void *)a2 + 23);
    uint64_t v9 = v8 + 1;
    memcpy(v8 + 1, *((const void **)a2 + 24), *((void *)a2 + 23));
    if (&v9[*((void *)a2 + 23)] == (unsigned char *)(a1[1] + *a1)) {
      return 0;
    }
    else {
      return 4294957486;
    }
  }
  return result;
}

uint64_t SSLProcessServerHelloVerifyRequest(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 <= 2)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloVerifyRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 344, "SSLProcessServerHelloVerifyRequest: msg len error\n");
    return 4294957496;
  }
  if (SSLDecodeInt(a2, 2) != 65279)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloVerifyRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 354, "SSLProcessServerHelloVerifyRequest: protocol version error\n");
    return 4294957496;
  }
  size_t v6 = a2[2];
  if (a1 < v6 + 3)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloVerifyRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 362, "SSLProcessServerHelloVerifyRequest: msg len error 2\n");
    return 4294957496;
  }
  uint64_t result = SSLAllocBuffer((size_t *)(a3 + 184), a2[2]);
  if (!result)
  {
    memcpy(*(void **)(a3 + 192), a2 + 3, v6);
    return 0;
  }
  return result;
}

uint64_t SSLProcessServerHello(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 <= 0x25)
  {
    __ssl_debug("sslError", "SSLProcessServerHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 596, "SSLProcessServerHello: msg len error\n");
    return 4294957496;
  }
  unsigned int v7 = SSLDecodeInt((unsigned __int8 *)a2, 2);
  int v8 = v7;
  unsigned int v9 = *(_DWORD *)(a3 + 8);
  if (!*(unsigned char *)(a3 + 16))
  {
    if (v9 > v7) {
      return 4294957495;
    }
    unsigned int v10 = *(_DWORD *)(a3 + 12);
    if (v10 >= v7) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v9 < v7) {
    return 4294957495;
  }
  unsigned int v10 = *(_DWORD *)(a3 + 12);
  if (v10 > v7)
  {
LABEL_10:
    int v8 = v10;
    if (*(unsigned char *)(a3 + 17)) {
      goto LABEL_11;
    }
    return 4294957495;
  }
LABEL_11:
  *(_DWORD *)a3 = v8;
  uint64_t result = 4294957495;
  if (v8 <= 770)
  {
    if ((v8 - 769) >= 2)
    {
      if (v8 != 768) {
        return result;
      }
      unint64_t v11 = Ssl3Callouts;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v8 != 771)
  {
    if (v8 != 65279) {
      return result;
    }
LABEL_18:
    unint64_t v11 = Tls1Callouts;
    goto LABEL_20;
  }
  unint64_t v11 = Tls12Callouts;
LABEL_20:
  *(void *)(a3 + 24) = v11;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a3 + 1112) + 96))(*(void *)(a3 + 1104));
  if (!result)
  {
    long long v12 = *(_OWORD *)(a2 + 18);
    *(_OWORD *)(a3 + 468) = *(_OWORD *)(a2 + 2);
    *(_OWORD *)(a3 + 484) = v12;
    size_t v13 = *(unsigned __int8 *)(a2 + 34);
    size_t v14 = v13 + 38;
    if (a1 < v13 + 38)
    {
      __ssl_debug("sslError", "SSLProcessServerHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 637, "SSLProcessServerHello: msg len error 2\n");
      return 4294957496;
    }
    uint64_t v15 = (char *)(a2 + 35);
    SSLFreeBuffer((void *)(a3 + 304));
    if (v13 && *(void *)(a3 + 256) && !SSLAllocBuffer((size_t *)(a3 + 304), v13)) {
      memcpy(*(void **)(a3 + 312), v15, v13);
    }
    uint64_t v16 = (unsigned __int8 *)&v15[v13];
    *(_WORD *)(a3 + 328) = SSLDecodeInt(v16, 2);
    uint64_t result = ValidateSelectedCiphersuite(a3);
    if (!result)
    {
      if (v16[2])
      {
        return 4294967292;
      }
      else if (a1 == v14 {
             || (uint64_t result = SSLProcessServerHelloExtensions(a3, (unsigned __int16)(a1 - v14), v16 + 3), !result))
      }
      {
        if (*(unsigned char *)(a3 + 848)) {
          uint64_t result = 4294957495;
        }
        else {
          uint64_t result = 0;
        }
        if (*(unsigned char *)(a3 + 849))
        {
          uint64_t result = 0;
          *(unsigned char *)(a3 + 848) = 1;
        }
      }
    }
  }
  return result;
}

uint64_t SSLProcessServerHelloExtensions(uint64_t a1, unsigned int a2, unsigned __int8 *a3)
{
  if (a2 <= 1)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 494, "SSLProcessHelloExtensions: need a least 2 bytes\n");
    return 4294957496;
  }
  __int16 v4 = a2;
  *(unsigned char *)(a1 + 1009) = 0;
  *(unsigned char *)(a1 + 1067) = 0;
  *(unsigned char *)(a1 + 849) = 0;
  tls_free_buffer_list(*(void **)(a1 + 1072));
  *(unsigned char *)(a1 + 769) = 0;
  unsigned __int16 v6 = SSLDecodeInt(a3, 2);
  if (v6 > (unsigned __int16)(v4 - 2))
  {
    __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 512, "SSLProcessHelloExtensions: ext len error 1\n");
    return 4294957496;
  }
  unsigned __int16 v8 = v6;
  if (v6 < (unsigned __int16)(v4 - 2)) {
    __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 517, "Warning: SSLProcessServerHelloExtensions: Too many bytes\n");
  }
  if (!v8) {
    return 0;
  }
  int v9 = 0;
  unsigned int v10 = a3 + 2;
  while (1)
  {
    if (v8 <= 3u)
    {
      __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 525, "SSLProcessHelloExtensions: ext len error\n");
      return 4294957496;
    }
    unsigned __int16 v11 = SSLDecodeInt(v10, 2);
    unsigned __int16 v12 = SSLDecodeInt(v10 + 2, 2);
    size_t v13 = v12;
    if (v12 + 4 > v8)
    {
      __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 533, "SSLProcessHelloExtension: ext len error 2\n");
      return 4294957496;
    }
    unsigned __int16 v14 = v12;
    uint64_t v15 = v10 + 4;
    if (v11 <= 0x16u) {
      break;
    }
    if (v11 > 0x3373u)
    {
      if (v11 == 13172)
      {
        if (!*(unsigned char *)(a1 + 930)) {
          return 4294957496;
        }
        *(unsigned char *)(a1 + 932) = 1;
        if (*(void *)(a1 + 960)) {
          return 4294957496;
        }
        uint64_t v23 = v10 + 4;
        size_t v22 = v13;
        long long v24 = (size_t *)(a1 + 952);
LABEL_47:
        uint64_t result = SSLCopyBufferFromData(v23, v22, v24);
        if (result) {
          return result;
        }
        goto LABEL_48;
      }
      if (v11 == 65281)
      {
        if (v9) {
          return 4294957496;
        }
        uint64_t v18 = *(void *)(a1 + 856);
        size_t v19 = *(void *)(a1 + 872);
        if (v19 + v18 + 1 == v12 && v19 + v18 == *v15)
        {
          size_t v20 = (char *)(v10 + 5);
          if (!memcmp(v20, *(const void **)(a1 + 864), *(void *)(a1 + 856)))
          {
            int v25 = memcmp(&v20[v18], *(const void **)(a1 + 880), v19);
            int v9 = 1;
            uint64_t v16 = (unsigned char *)(a1 + 849);
            if (v25) {
              goto LABEL_48;
            }
            goto LABEL_38;
          }
        }
        int v9 = 1;
      }
    }
    else
    {
      if (v11 == 23)
      {
        uint64_t v16 = (unsigned char *)(a1 + 769);
LABEL_38:
        *uint64_t v16 = 1;
        goto LABEL_48;
      }
      if (v11 == 35)
      {
        uint64_t result = 4294957496;
        if (v14) {
          return result;
        }
        uint64_t v16 = (unsigned char *)(a1 + 707);
        if (!*(unsigned char *)(a1 + 706)) {
          return result;
        }
        goto LABEL_38;
      }
    }
LABEL_48:
    v8 -= v13 + 4;
    unsigned int v10 = &v15[v13];
    if (!v8) {
      return 0;
    }
  }
  if (v11 == 5)
  {
    uint64_t result = 4294957496;
    if (v14) {
      return result;
    }
    uint64_t v16 = (unsigned char *)(a1 + 1009);
    if (!*(unsigned char *)(a1 + 1008)) {
      return result;
    }
    goto LABEL_38;
  }
  if (v11 == 16)
  {
    uint64_t result = 4294957496;
    if (!*(unsigned char *)(a1 + 969)) {
      return result;
    }
    if (v14 < 4u) {
      return result;
    }
    *(unsigned char *)(a1 + 971) = 1;
    if (*(void *)(a1 + 1000)) {
      return result;
    }
    unint64_t v21 = SSLDecodeSize((unint64_t)(v10 + 4), 2);
    if (v21 != v13 - 2) {
      return 4294957496;
    }
    size_t v22 = v21;
    uint64_t v23 = v10 + 6;
    long long v24 = (size_t *)(a1 + 992);
    goto LABEL_47;
  }
  if (v11 != 18) {
    goto LABEL_48;
  }
  if (!*(unsigned char *)(a1 + 1066)) {
    return 4294957496;
  }
  if (v12 <= 1u)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloExtension_SCT", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 457, "SSLProcessClientHelloExtension_SCT: length decode error 1\n");
    return 4294957496;
  }
  unint64_t v17 = SSLDecodeSize((unint64_t)(v10 + 4), 2);
  if (v17 == (unsigned __int16)(v14 - 2))
  {
    uint64_t result = SSLDecodeBufferList(v10 + 6, v17, 2, (void ***)(a1 + 1072));
    if (result) {
      return result;
    }
    goto LABEL_48;
  }
  __ssl_debug("sslError", "SSLProcessServerHelloExtension_SCT", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 464, "SSLProcessClientHelloExtension_SCT: length decode error 2\n");
  return 4294957496;
}

uint64_t SSLEncodeClientHello(size_t *a1, unsigned int *a2)
{
  size_t v95 = 0;
  __src = 0;
  long long v94 = 0uLL;
  *a1 = 0;
  a1[1] = 0;
  int v4 = *((unsigned __int8 *)a2 + 16);
  uint64_t v5 = (long long *)(a2 + 184);
  if (*((void *)a2 + 92))
  {
    size_t v6 = 0;
    long long v94 = *v5;
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 34);
    if (!v7 || SSLClientValidateSessionDataBefore(*((void *)a2 + 33), v7, (uint64_t)a2)) {
      goto LABEL_5;
    }
    uint64_t MaxProtVersion = SSLRetrieveSessionID(*((void *)a2 + 33), *((void *)a2 + 34), &v95);
    if (MaxProtVersion) {
      goto LABEL_146;
    }
    uint64_t MaxProtVersion = SSLRetrieveSessionTicket(*((void *)a2 + 33), *((void *)a2 + 34), &v94);
    if (MaxProtVersion) {
      goto LABEL_146;
    }
    if ((void)v94 && !*((unsigned char *)a2 + 705))
    {
LABEL_5:
      size_t v6 = 0;
    }
    else
    {
      size_t v6 = v95;
      SSLCopyBuffer((uint64_t)&v95, (size_t *)a2 + 36);
    }
  }
  if (a2[90])
  {
    unint64_t v8 = 0;
    int v9 = 0;
    do
      v9 += tls_handshake_ciphersuite_is_valid((uint64_t)a2, *(unsigned __int16 *)(*((void *)a2 + 44) + 2 * v8++));
    while (v8 < a2[90]);
  }
  else
  {
    LOWORD(v9) = 0;
  }
  if (!*((unsigned char *)a2 + 848)) {
    LOWORD(v9) = v9 + 1;
  }
  __int16 v10 = *((unsigned __int8 *)a2 + 1064);
  uint64_t MaxProtVersion = sslGetMaxProtVersion((uint64_t)a2, a2 + 1);
  if (MaxProtVersion) {
    goto LABEL_146;
  }
  unint64_t v12 = 2 * (unsigned __int16)(v9 + v10);
  *((unsigned char *)a2 + 849) = 0;
  uint64_t v13 = *a2;
  if (!v13)
  {
    uint64_t v13 = a2[2];
    if (v13 <= 0x300 && a2[3] > 0x300) {
      uint64_t v13 = 769;
    }
  }
  unint64_t v14 = v6 + (v12 + 39);
  (*(void (**)(void, uint64_t))(*((void *)a2 + 139) + 96))(*((void *)a2 + 138), v13);
  int v15 = *((unsigned __int8 *)a2 + 16);
  if (*((unsigned char *)a2 + 16)) {
    v14 += *((void *)a2 + 23) + 1;
  }
  if (*((unsigned char *)a2 + 848)) {
    uint64_t v16 = *((void *)a2 + 107) + 5;
  }
  else {
    uint64_t v16 = 0;
  }
  unsigned int v17 = a2[1];
  if (v17 >= 0x301 && *((void *)a2 + 50))
  {
    uint64_t v18 = *((void *)a2 + 49);
    uint64_t v19 = v18 + 9 + v16;
    BOOL v20 = v18 == 0;
    if (v18) {
      uint64_t v21 = v18 + 9;
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t v90 = v21;
    if (!v20) {
      uint64_t v16 = v19;
    }
  }
  else
  {
    uint64_t v90 = 0;
  }
  if (*((unsigned char *)a2 + 705) || *(void *)v5)
  {
    uint64_t v22 = v94 + 4;
    v16 += v94 + 4;
    *((unsigned char *)a2 + 706) = 1;
  }
  else
  {
    uint64_t v22 = 0;
  }
  if (v17 >= 0x301 && *((unsigned char *)a2 + 771))
  {
    uint64_t v91 = 2 * a2[30] + 6;
    v16 += v91 + 6;
    uint64_t v92 = 6;
    if (!v15) {
      goto LABEL_38;
    }
LABEL_41:
    if (v17 >= 0xFEFF)
    {
      uint64_t v23 = 0;
      goto LABEL_46;
    }
    goto LABEL_42;
  }
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  if (v15) {
    goto LABEL_41;
  }
LABEL_38:
  if (v17 < 0x303)
  {
    uint64_t v23 = 0;
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v23 = 2 * a2[200] + 6;
  v16 += v23;
LABEL_43:
  if (v17 < 0x301)
  {
    uint64_t v93 = v23;
    uint64_t v85 = 0;
    BOOL v88 = 0;
    uint64_t v89 = 0;
LABEL_61:
    BOOL v86 = 0;
    BOOL v87 = 0;
    goto LABEL_68;
  }
LABEL_46:
  if (*((unsigned char *)a2 + 929))
  {
    BOOL v88 = *((unsigned char *)a2 + 930) == 0;
    if (!*((unsigned char *)a2 + 930)) {
      v16 += 4;
    }
  }
  else
  {
    BOOL v88 = 0;
  }
  uint64_t v24 = *((void *)a2 + 122);
  if (v24) {
    uint64_t v25 = v24 + 6;
  }
  else {
    uint64_t v25 = 0;
  }
  v16 += v25;
  uint64_t v89 = v25;
  uint64_t v93 = v23;
  if (*((unsigned char *)a2 + 1008))
  {
    uint64_t v85 = SSLEncodedBufferListSize(*((void **)a2 + 129), 2) + *((void *)a2 + 127) + 9;
    v16 += v85;
    if (a2[1] < 0x301) {
      goto LABEL_61;
    }
  }
  else
  {
    uint64_t v85 = 0;
  }
  uint64_t v26 = v16 + 4;
  if (!*((unsigned char *)a2 + 1066)) {
    uint64_t v26 = v16;
  }
  BOOL v86 = *((unsigned char *)a2 + 1066) != 0;
  BOOL v87 = *((unsigned char *)a2 + 768) != 0;
  if (*((unsigned char *)a2 + 768)) {
    uint64_t v16 = v26 + 4;
  }
  else {
    uint64_t v16 = v26;
  }
LABEL_68:
  if (v4) {
    uint64_t v27 = 12;
  }
  else {
    uint64_t v27 = 4;
  }
  unint64_t v28 = v14 + v27 + v16;
  unint64_t v29 = (v28 + 2) & 0xFFFFFFFFFFFFFF00;
  unint64_t v30 = 510 - v28;
  if (v30 <= 4) {
    unint64_t v30 = 4;
  }
  unint64_t v31 = v29;
  unint64_t v84 = v30;
  if (v29 != 256) {
    unint64_t v30 = 0;
  }
  unint64_t v32 = v30 + v16;
  if (v30 + v16)
  {
    if (v32 < 0x10000)
    {
      v14 += v32 + 2;
    }
    else
    {
      __ssl_debug("sslError", "SSLEncodeClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 931, "Total extensions length EXCEEDED\n");
      uint64_t v22 = 0;
      uint64_t v90 = 0;
      uint64_t v91 = 0;
      uint64_t v92 = 0;
      uint64_t v93 = 0;
      unint64_t v32 = 0;
    }
  }
  uint64_t MaxProtVersion = SSLAllocBuffer(a1, v14 + v27);
  if (MaxProtVersion) {
    goto LABEL_146;
  }
  uint64_t v33 = SSLEncodeHandshakeHeader((uint64_t)a2, (uint64_t)a1, 1, v14);
  uint64_t v34 = SSLEncodeInt(v33, a2[1], 2);
  uint64_t MaxProtVersion = SSLEncodeRandom(v34);
  if (MaxProtVersion) {
    goto LABEL_146;
  }
  long long v35 = *(_OWORD *)(v34 + 16);
  *(_OWORD *)(a2 + 109) = *(_OWORD *)v34;
  *(_OWORD *)(a2 + 113) = v35;
  *(unsigned char *)(v34 + 32) = v6;
  if (v6) {
    memcpy((void *)(v34 + 33), __src, v6);
  }
  size_t v36 = (unsigned char *)(v34 + 33 + v6);
  if (*((unsigned char *)a2 + 16))
  {
    *v36++ = *((void *)a2 + 23);
    size_t v37 = *((void *)a2 + 23);
    if (v37)
    {
      memcpy(v36, *((const void **)a2 + 24), v37);
      v36 += *((void *)a2 + 23);
    }
  }
  uint64_t v38 = SSLEncodeInt((uint64_t)v36, v12, 2);
  unint64_t v39 = (_WORD *)v38;
  if (!*((unsigned char *)a2 + 848)) {
    unint64_t v39 = (_WORD *)SSLEncodeInt(v38, 0xFFuLL, 2);
  }
  if (*((unsigned char *)a2 + 1064)) {
    unint64_t v39 = (_WORD *)SSLEncodeInt((uint64_t)v39, 0x5600uLL, 2);
  }
  if (a2[90])
  {
    unint64_t v40 = 0;
    do
    {
      if (tls_handshake_ciphersuite_is_valid((uint64_t)a2, *(unsigned __int16 *)(*((void *)a2 + 44) + 2 * v40)))unint64_t v39 = (_WORD *)SSLEncodeInt((uint64_t)v39, *(unsigned __int16 *)(*((void *)a2 + 44) + 2 * v40), 2); {
      ++v40;
      }
    }
    while (v40 < a2[90]);
  }
  *unint64_t v39 = 1;
  uint64_t v41 = (uint64_t)(v39 + 1);
  if (v32) {
    uint64_t v41 = SSLEncodeInt(v41, v32, 2);
  }
  if (*((unsigned char *)a2 + 848) && v41)
  {
    uint64_t v42 = SSLEncodeInt(v41, 0xFF01uLL, 2);
    uint64_t v43 = SSLEncodeInt(v42, *((void *)a2 + 107) + 1, 2);
    long long v44 = (void *)SSLEncodeInt(v43, *((void *)a2 + 107), 1);
    memcpy(v44, *((const void **)a2 + 108), *((void *)a2 + 107));
    uint64_t v41 = (uint64_t)v44 + *((void *)a2 + 107);
  }
  if (v22 && v41)
  {
    uint64_t v45 = SSLEncodeInt(v41, 0x23uLL, 2);
    uint64_t v46 = (void *)SSLEncodeInt(v45, v94, 2);
    memcpy(v46, *((const void **)&v94 + 1), v94);
    uint64_t v41 = (uint64_t)v46 + v94;
  }
  if (v90 && v41)
  {
    uint64_t v47 = SSLEncodeInt(v41, 0, 2);
    uint64_t v48 = SSLEncodeInt(v47, *((void *)a2 + 49) + 5, 2);
    uint64_t v49 = SSLEncodeInt(v48, *((void *)a2 + 49) + 3, 2);
    uint64_t v50 = SSLEncodeInt(v49, 0, 1);
    size_t v51 = (void *)SSLEncodeInt(v50, *((void *)a2 + 49), 2);
    memcpy(v51, *((const void **)a2 + 50), *((void *)a2 + 49));
    uint64_t v41 = (uint64_t)v51 + *((void *)a2 + 49);
  }
  if (v91)
  {
    if (v41)
    {
      unint64_t v52 = 2 * a2[30];
      uint64_t v53 = SSLEncodeInt(v41, 0xAuLL, 2);
      uint64_t v54 = SSLEncodeInt(v53, (v52 + 2), 2);
      uint64_t v41 = SSLEncodeInt(v54, v52, 2);
      if (a2[30])
      {
        unint64_t v55 = 0;
        do
          uint64_t v41 = SSLEncodeInt(v41, *(unsigned __int16 *)(*((void *)a2 + 14) + 2 * v55++), 2);
        while (v55 < a2[30]);
      }
    }
  }
  if (v92 && v41)
  {
    uint64_t v56 = SSLEncodeInt(v41, 0xBuLL, 2);
    uint64_t v57 = SSLEncodeInt(v56, 2uLL, 2);
    uint64_t v58 = SSLEncodeInt(v57, 1uLL, 1);
    uint64_t v41 = SSLEncodeInt(v58, 0, 1);
  }
  if (v93)
  {
    if (v41)
    {
      unint64_t v59 = 2 * a2[200];
      uint64_t v60 = SSLEncodeInt(v41, 0xDuLL, 2);
      uint64_t v61 = SSLEncodeInt(v60, (v59 + 2), 2);
      uint64_t v41 = SSLEncodeInt(v61, v59, 2);
      if (a2[200])
      {
        uint64_t v62 = 0;
        unint64_t v63 = 0;
        do
        {
          uint64_t v64 = SSLEncodeInt(v41, *(unsigned int *)(*((void *)a2 + 101) + v62), 1);
          uint64_t v41 = SSLEncodeInt(v64, *(unsigned int *)(*((void *)a2 + 101) + v62 + 4), 1);
          ++v63;
          v62 += 8;
        }
        while (v63 < a2[200]);
      }
    }
  }
  BOOL v65 = v88;
  if (!v41) {
    BOOL v65 = 0;
  }
  if (v65)
  {
    *((unsigned char *)a2 + 930) = 1;
    uint64_t v66 = SSLEncodeInt(v41, 0x3374uLL, 2);
    uint64_t v41 = SSLEncodeInt(v66, 0, 2);
  }
  if (v89 && v41)
  {
    *((unsigned char *)a2 + 969) = 1;
    uint64_t v67 = SSLEncodeInt(v41, 0x10uLL, 2);
    uint64_t v68 = SSLEncodeInt(v67, *((void *)a2 + 122) + 2, 2);
    v69 = (void *)SSLEncodeInt(v68, *((void *)a2 + 122), 2);
    memcpy(v69, *((const void **)a2 + 123), *((void *)a2 + 122));
    uint64_t v41 = (uint64_t)v69 + *((void *)a2 + 122);
  }
  if (v85 && v41)
  {
    uint64_t v70 = SSLEncodeInt(v41, 5uLL, 2);
    size_t v71 = (unsigned char *)SSLEncodeInt(v70, v85 - 4, 2);
    *size_t v71 = 1;
    uint64_t v72 = (uint64_t)(v71 + 1);
    unint64_t v73 = SSLEncodedBufferListSize(*((void **)a2 + 129), 2);
    uint64_t v74 = SSLEncodeInt(v72, v73, 2);
    uint64_t v75 = SSLEncodeBufferList(*((uint64_t **)a2 + 129), 2, v74);
    v76 = (void *)SSLEncodeInt(v75, *((void *)a2 + 127), 2);
    memcpy(v76, *((const void **)a2 + 128), *((void *)a2 + 127));
    uint64_t v41 = (uint64_t)v76 + *((void *)a2 + 127);
  }
  if (v41) {
    BOOL v77 = v86;
  }
  else {
    BOOL v77 = 0;
  }
  if (v77)
  {
    uint64_t v78 = SSLEncodeInt(v41, 0x12uLL, 2);
    uint64_t v41 = SSLEncodeInt(v78, 0, 2);
  }
  if (v41) {
    BOOL v79 = v87;
  }
  else {
    BOOL v79 = 0;
  }
  if (v79)
  {
    uint64_t v80 = SSLEncodeInt(v41, 0x17uLL, 2);
    uint64_t v41 = SSLEncodeInt(v80, 0, 2);
  }
  if (v31 == 256 && v41)
  {
    uint64_t v81 = SSLEncodeInt(v41, 0x15uLL, 2);
    v82 = (void *)SSLEncodeInt(v81, v84 - 4, 2);
    bzero(v82, v84 - 4);
    uint64_t v41 = (uint64_t)v82 + v84 - 4;
  }
  if (v41 != a1[1] + *a1)
  {
    uint64_t MaxProtVersion = 4294957486;
LABEL_146:
    SSLFreeBuffer(a1);
    return MaxProtVersion;
  }
  uint64_t MaxProtVersion = SSLInitMessageHashes((size_t *)a2);
  if (MaxProtVersion) {
    goto LABEL_146;
  }
  return MaxProtVersion;
}

uint64_t SSLProcessSSL2ClientHello(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 < 8) {
    return 4294967246;
  }
  unsigned __int16 v6 = SSLDecodeInt(a2, 2);
  unsigned __int16 v7 = SSLDecodeInt(a2 + 2, 2);
  __int16 v8 = SSLDecodeInt(a2 + 4, 2);
  unsigned __int16 v9 = SSLDecodeInt(a2 + 6, 2);
  if (v8) {
    return 4294967246;
  }
  unsigned __int16 v10 = v9;
  int v11 = v9;
  uint64_t result = 4294967246;
  if (v11 == 32)
  {
    int v13 = v7;
    uint64_t v14 = v7 + v10 + 8;
    unsigned int v15 = v7 / 3u;
    if (!(v7 % 3u) && a1 == v14)
    {
      int v17 = v6;
      *(_DWORD *)(a3 + 4) = v6;
      unsigned int v18 = *(_DWORD *)(a3 + 8);
      if (*(unsigned char *)(a3 + 16))
      {
        if (v18 < v6) {
          return 4294957495;
        }
        unsigned int v19 = *(_DWORD *)(a3 + 12);
        if (v19 <= v6)
        {
LABEL_16:
          uint64_t result = 4294957495;
          if (v17 > 770)
          {
            if (v17 == 771)
            {
              BOOL v20 = Tls12Callouts;
LABEL_25:
              *(void *)(a3 + 24) = v20;
              *(_DWORD *)a3 = v17;
              uint64_t result = (*(uint64_t (**)(void))(*(void *)(a3 + 1112) + 96))(*(void *)(a3 + 1104));
              if (!result)
              {
                uint64_t v21 = a2 + 8;
                *(_DWORD *)(a3 + 376) = 0;
                if (v7 >= 3u)
                {
                  int v22 = 0;
                  if (v15 <= 1) {
                    uint64_t v23 = 1;
                  }
                  else {
                    uint64_t v23 = v15;
                  }
                  uint64_t v24 = a2 + 8;
                  do
                  {
                    int v25 = *v24;
                    v24 += 3;
                    if (!v25) {
                      *(_DWORD *)(a3 + 376) = ++v22;
                    }
                    --v23;
                  }
                  while (v23);
                }
                sslFree(*(void **)(a3 + 368));
                uint64_t v26 = sslMalloc(2 * *(unsigned int *)(a3 + 376));
                *(void *)(a3 + 368) = v26;
                if (v26)
                {
                  if (v7 >= 3u)
                  {
                    int v27 = 0;
                    if (v15 <= 1) {
                      int v28 = 1;
                    }
                    else {
                      int v28 = v15;
                    }
                    unint64_t v29 = a2 + 9;
                    do
                    {
                      if (!*(v29 - 1)) {
                        *(_WORD *)(*(void *)(a3 + 368) + 2 * v27++) = SSLDecodeInt(v29, 2);
                      }
                      v29 += 3;
                      --v28;
                    }
                    while (v28);
                  }
                  unint64_t v30 = &v21[v13];
                  long long v31 = *((_OWORD *)v30 + 1);
                  *(_OWORD *)(a3 + 436) = *(_OWORD *)v30;
                  *(_OWORD *)(a3 + 452) = v31;
                  return SSLInitMessageHashes((size_t *)a3);
                }
                else
                {
                  return 4294967188;
                }
              }
              return result;
            }
            if (v17 != 65279) {
              return result;
            }
          }
          else if ((v17 - 769) >= 2)
          {
            if (v17 != 768) {
              return result;
            }
            BOOL v20 = Ssl3Callouts;
            goto LABEL_25;
          }
          BOOL v20 = Tls1Callouts;
          goto LABEL_25;
        }
      }
      else
      {
        if (v18 > v6) {
          return 4294957495;
        }
        unsigned int v19 = *(_DWORD *)(a3 + 12);
        if (v19 >= v6) {
          goto LABEL_16;
        }
      }
      int v17 = v19;
      if (*(unsigned char *)(a3 + 17)) {
        goto LABEL_16;
      }
      return 4294957495;
    }
  }
  return result;
}

uint64_t SSLProcessNewSessionTicket(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  size_t v3 = a1 - 6;
  if (a1 < 6) {
    return 4294957496;
  }
  int v6 = SSLDecodeInt(a2, 4);
  if (v3 != (unsigned __int16)SSLDecodeInt(a2 + 4, 2)) {
    return 4294957496;
  }
  *(_DWORD *)(a3 + 728) = v6;
  unsigned __int16 v7 = (size_t *)(a3 + 712);
  SSLFreeBuffer(v7);

  return SSLCopyBufferFromData(a2 + 6, v3, v7);
}

uint64_t ssl3GenerateKeyMaterial(unint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  __int16 v26 = -21846;
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  memset(v24, 170, 20);
  __src[0] = 0xAAAAAAAAAAAAAAAALL;
  __src[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v20 = &v25;
  v18[6] = 48;
  v18[7] = a3 + 520;
  v18[4] = 32;
  v18[5] = a3 + 468;
  v18[2] = 32;
  v18[3] = a3 + 436;
  v18[0] = 20;
  v18[1] = v24;
  v17[0] = 16;
  v17[1] = __src;
  v21[0] = 0xAAAAAAAAAAAAAAAALL;
  v21[1] = 0;
  v22[0] = 0xAAAAAAAAAAAAAAAALL;
  v22[1] = 0;
  uint64_t ready = ReadyHash((uint64_t)&SSLHashMD5, v21);
  if (!ready)
  {
    uint64_t ready = ReadyHash((uint64_t)&SSLHashSHA1, v22);
    if (!ready)
    {
      if (a1)
      {
        unint64_t v6 = 0;
        unsigned __int16 v7 = off_26C2424E8;
        unsigned int v15 = off_26C2424E0[0];
        uint64_t v16 = off_26C2424F0[0];
        __int16 v8 = off_26C242520;
        unsigned __int16 v9 = off_26C242528[0];
        unsigned __int16 v10 = off_26C242518[0];
        while (1)
        {
          unint64_t v11 = 0;
          do
            *((unsigned char *)&v25 + v11++) = v6 + 65;
          while (v11 <= v6);
          unint64_t v19 = ++v6;
          uint64_t v12 = v8();
          if (v12) {
            break;
          }
          uint64_t v12 = v8();
          if (v12) {
            break;
          }
          uint64_t v12 = v8();
          if (v12) {
            break;
          }
          uint64_t v12 = v8();
          if (v12) {
            break;
          }
          uint64_t v12 = ((uint64_t (*)(uint64_t, void *))v9)((uint64_t)v22, v18);
          if (v12) {
            break;
          }
          uint64_t v12 = v7();
          if (v12) {
            break;
          }
          uint64_t v12 = v7();
          if (v12) {
            break;
          }
          uint64_t v12 = ((uint64_t (*)(size_t *, void *))v16)(v21, v17);
          if (v12) {
            break;
          }
          if (a1 >= 0x10) {
            size_t v13 = 16;
          }
          else {
            size_t v13 = a1;
          }
          memcpy(a2, __src, v13);
          a1 -= v13;
          if (!a1) {
            goto LABEL_23;
          }
          uint64_t v12 = ((uint64_t (*)(size_t *))v15)(v21);
          if (v12) {
            break;
          }
          a2 += v13;
          uint64_t ready = v10();
          if (ready) {
            goto LABEL_24;
          }
        }
        uint64_t ready = v12;
      }
      else
      {
LABEL_23:
        uint64_t ready = 0;
      }
    }
  }
LABEL_24:
  SSLFreeBuffer(v21);
  SSLFreeBuffer(v22);
  return ready;
}

uint64_t ssl3GenerateMasterSecret(uint64_t a1)
{
  v18[3] = *MEMORY[0x263EF8340];
  memset(v16, 170, 56);
  memset(v15, 170, sizeof(v15));
  memset(v18, 170, 20);
  __int16 v13 = -21846;
  char v14 = -86;
  v17[0] = 0xAAAAAAAAAAAAAAAALL;
  v17[1] = 0;
  v16[7] = 0;
  uint64_t v2 = SSLAllocBuffer(&v16[6], dword_26C2424D8);
  if (!v2)
  {
    uint64_t v2 = SSLAllocBuffer(v17, dword_26C242510);
    if (!v2)
    {
      v16[4] = 32;
      v16[5] = a1 + 436;
      _OWORD v16[2] = 32;
      v16[3] = a1 + 468;
      v16[0] = 20;
      v16[1] = v18;
      uint64_t v3 = a1 + 520;
      int v4 = off_26C242518[0];
      uint64_t v5 = off_26C242520;
      unint64_t v6 = off_26C242528[0];
      unsigned __int16 v7 = off_26C2424E0[0];
      __int16 v8 = off_26C2424E8;
      uint64_t v9 = 1;
      unsigned __int16 v10 = off_26C2424F0[0];
      while (1)
      {
        uint64_t v11 = v7();
        if (v11) {
          break;
        }
        uint64_t v11 = v4();
        if (v11) {
          break;
        }
        char v14 = v9 + 64;
        HIBYTE(v13) = v9 + 64;
        LOBYTE(v13) = v9 + 64;
        v15[0] = v9;
        v15[1] = &v13;
        uint64_t v11 = v5();
        if (v11) {
          break;
        }
        uint64_t v11 = v5();
        if (v11) {
          break;
        }
        uint64_t v11 = v5();
        if (v11) {
          break;
        }
        uint64_t v11 = v5();
        if (v11) {
          break;
        }
        uint64_t v11 = ((uint64_t (*)(uint64_t, void *))v6)((uint64_t)v17, v16);
        if (v11) {
          break;
        }
        uint64_t v11 = v8();
        if (v11) {
          break;
        }
        uint64_t v11 = v8();
        if (v11) {
          break;
        }
        v15[2] = 16;
        v15[3] = v3;
        uint64_t v2 = ((uint64_t (*)(uint64_t, void *))v10)((uint64_t)&v16[6], &v15[2]);
        if (!v2)
        {
          v3 += 16;
          if (++v9 != 4) {
            continue;
          }
        }
        goto LABEL_17;
      }
      uint64_t v2 = v11;
    }
  }
LABEL_17:
  SSLFreeBuffer(v17);
  SSLFreeBuffer(&v16[6]);
  return v2;
}

uint64_t ssl3ComputeFinishedMac(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v14 = 0;
  uint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = 0;
  uint64_t v8 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, (size_t *)&v13);
  if (!v8)
  {
    uint64_t v8 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, (size_t *)&v11);
    if (!v8)
    {
      if (a4) {
        unsigned int v9 = 1397904978;
      }
      else {
        unsigned int v9 = 1129074260;
      }
      uint64_t v8 = ssl3CalculateFinishedMessage(a1, a2, a3, v13, v14, v11, v12, v9);
    }
  }
  SSLFreeBuffer(&v13);
  SSLFreeBuffer(&v11);
  return v8;
}

uint64_t ssl3ComputeCertVfyMac(uint64_t a1, void *a2)
{
  uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v9 = 0;
  uint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = 0;
  uint64_t v4 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, (size_t *)&v8);
  if (!v4)
  {
    uint64_t v4 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, (size_t *)&v6);
    if (!v4)
    {
      *a2 = 36;
      uint64_t v4 = ssl3CalculateFinishedMessage(a1, 36, a2[1], v8, v9, v6, v7, 0);
    }
  }
  SSLFreeBuffer(&v8);
  SSLFreeBuffer(&v6);
  return v4;
}

uint64_t ssl3CalculateFinishedMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  size_t v22[2] = *MEMORY[0x263EF8340];
  v20[0] = a4;
  v20[1] = a5;
  v19[0] = a6;
  v19[1] = a7;
  memset(v18, 170, sizeof(v18));
  v22[0] = 0xAAAAAAAAAAAAAAAALL;
  v22[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(v21, 170, 20);
  if (a8)
  {
    SSLEncodeInt((uint64_t)v18, a8, 4);
    *(void *)&v18[1] = 4;
    *(void *)&v18[3] = v18;
    unsigned __int16 v10 = off_26C2424E8;
    uint64_t result = off_26C2424E8();
    if (result) {
      return result;
    }
    uint64_t result = off_26C242520();
    if (result) {
      return result;
    }
  }
  else
  {
    unsigned __int16 v10 = off_26C2424E8;
  }
  uint64_t v12 = a1 + 520;
  *(void *)&v18[1] = 48;
  *(void *)&v18[3] = a1 + 520;
  uint64_t result = v10();
  if (!result)
  {
    uint64_t v13 = off_26C242520;
    uint64_t result = off_26C242520();
    if (!result)
    {
      uint64_t v14 = dword_26C2424D4;
      *(void *)&v18[1] = dword_26C2424D4;
      *(void *)&v18[3] = &SSLMACPad1;
      uint64_t result = v10();
      if (!result)
      {
        uint64_t v15 = dword_26C24250C;
        *(void *)&v18[1] = dword_26C24250C;
        uint64_t result = v13();
        if (!result)
        {
          *(void *)&void v18[5] = 16;
          *(void *)&v18[7] = v22;
          uint64_t v16 = off_26C2424F0[0];
          uint64_t result = ((uint64_t (*)(uint64_t, void *))off_26C2424F0[0])((uint64_t)v19, &v18[5]);
          if (!result)
          {
            *(void *)&void v18[5] = 20;
            *(void *)&v18[7] = v21;
            int v17 = off_26C242528[0];
            uint64_t result = ((uint64_t (*)(uint64_t, void *))off_26C242528[0])((uint64_t)v20, &v18[5]);
            if (!result)
            {
              uint64_t result = off_26C2424E0[0]();
              if (!result)
              {
                uint64_t result = off_26C242518[0]();
                if (!result)
                {
                  *(void *)&v18[1] = 48;
                  *(void *)&v18[3] = v12;
                  uint64_t result = v10();
                  if (!result)
                  {
                    uint64_t result = v13();
                    if (!result)
                    {
                      *(void *)&v18[1] = v14;
                      *(void *)&v18[3] = "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\""
                                           "\\\\\\\\\\\\\\\\\\@";
                      uint64_t result = v10();
                      if (!result)
                      {
                        *(void *)&v18[1] = v15;
                        uint64_t result = v13();
                        if (!result)
                        {
                          *(void *)&v18[1] = 16;
                          *(void *)&v18[3] = v22;
                          uint64_t result = v10();
                          if (!result)
                          {
                            *(void *)&void v18[5] = 16;
                            *(void *)&v18[7] = a3;
                            uint64_t result = ((uint64_t (*)(uint64_t, void *))v16)((uint64_t)v19, &v18[5]);
                            if (!result)
                            {
                              *(void *)&v18[1] = 20;
                              *(void *)&v18[3] = v21;
                              uint64_t result = v13();
                              if (!result)
                              {
                                *(void *)&void v18[5] = 20;
                                *(void *)&v18[7] = a3 + 16;
                                return ((uint64_t (*)(uint64_t, void *))v17)((uint64_t)v20, &v18[5]);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t SSLComputeMac(char a1, unint64_t *a2, uint64_t a3, uint64_t a4, size_t **a5, int a6)
{
  uint64_t v100 = a4;
  v110[1] = *MEMORY[0x263EF8340];
  v106 = a2;
  unint64_t v10 = *a2;
  uint64_t v11 = *a5;
  size_t v12 = (*a5)[2];
  size_t v13 = **a5;
  ((void (*)(void))MEMORY[0x270FA5388])();
  if (v13) {
    memset((char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v13);
  }
  uint64_t v14 = v10 - a3;
  v101 = (char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v101, v13);
  size_t v15 = 40;
  uint64_t v16 = 40;
  if (v13 == 16) {
    uint64_t v16 = 48;
  }
  if (a6 == 768) {
    size_t v15 = v16;
  }
  size_t v98 = v15;
  if (a6 == 768) {
    size_t v17 = v13 + v16 + 11;
  }
  else {
    size_t v17 = v12 + 13;
  }
  ((void (*)(void))MEMORY[0x270FA5388])();
  unsigned int v18 = (char *)&v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = v18;
  if (v17)
  {
    memset(v108, 170, v17);
    unsigned int v18 = v108;
  }
  v97 = a5;
  if (a6 == 768)
  {
    memcpy(v18, (char *)a5 + 41, v13);
    unint64_t v19 = &v18[v13];
    size_t v20 = v98;
    memset(v19, 54, v98);
    uint64_t v21 = (unsigned char *)SSLEncodeUInt64((uint64_t)&v19[v20], (unint64_t)a5[4]);
    *uint64_t v21 = a1;
    int v22 = v21 + 2;
    v21[1] = BYTE1(v14);
  }
  else
  {
    memset(v108, 54, v12);
    uint64_t v23 = v108;
    if (v13)
    {
      for (size_t i = 0; i < v13; ++i)
        v23[i] ^= *((unsigned char *)a5 + i + 41);
    }
    unint64_t v25 = (unsigned char *)SSLEncodeUInt64((uint64_t)&v23[v12], (unint64_t)a5[4]);
    unsigned char *v25 = a1;
    v25[1] = BYTE1(a6);
    v25[2] = a6;
    int v22 = v25 + 4;
    v25[3] = BYTE1(v14);
  }
  int v99 = a6;
  *int v22 = v14;
  __int16 v26 = (void *)((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v27 = (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v12) {
    __int16 v26 = memset((char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v12);
  }
  size_t v28 = v11[1];
  MEMORY[0x270FA5388](v26);
  unint64_t v29 = (8 * ((v28 + 7) >> 3) + 15) & 0xFFFFFFFFFFFFFFF0;
  v109 = (char *)&v96 - v29;
  if (v30 > 7)
  {
    unint64_t v32 = memset(v109, 170, ((v28 - 1) & 0xFFFFFFFFFFFFFFF8) + 8);
    MEMORY[0x270FA5388](v32);
    v102 = (char *)&v96 - v29;
    memset((char *)&v96 - v29, 170, ((v28 - 1) & 0xFFFFFFFFFFFFFFF8) + 8);
    long long v31 = v109;
  }
  else
  {
    long long v31 = (char *)MEMORY[0x270FA5388]((char *)&v96 - v29);
    v102 = (char *)&v96 - v29;
  }
  memcpy(v31, (const void *)v11[5], v28);
  size_t v33 = *v11;
  bzero(v101, *v11);
  size_t v34 = v17 + v14;
  v110[0] = 0;
  if (v33 == 16)
  {
    v110[0] = 8 * v34;
    uint64_t v35 = 8;
  }
  else
  {
    size_t v36 = v11[2];
    v110[0] = bswap64(8 * v34);
    BOOL v37 = v36 == 128;
    uint64_t v35 = 16;
    if (!v37) {
      uint64_t v35 = 8;
    }
  }
  unint64_t v39 = v108;
  uint64_t v38 = v109;
  v107 = v11;
  size_t v40 = v17 + *v106;
  v103 = (char *)v35;
  size_t v41 = (v35 + v40) / v12;
  unint64_t v42 = v41 + 1;
  size_t v43 = v41 - 5;
  unint64_t v105 = v42;
  if (v42 >= 6) {
    unint64_t v44 = v43;
  }
  else {
    unint64_t v44 = 0;
  }
  if (v44)
  {
    size_t v45 = 0;
    uint64_t v104 = -(uint64_t)v17;
    size_t v46 = v17;
    unint64_t v47 = v44;
    do
    {
      if (v12 + v45 >= v17)
      {
        if (v45 >= v17)
        {
          ((void (*)(char *, uint64_t, unint64_t))v107[6])(v38, 1, v106[1] + v104 + v45);
        }
        else
        {
          uint64_t v48 = v38;
          memcpy((char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), &v39[v45], v46);
          memcpy(&v27[v46], (const void *)v106[1], v12 - v17 + v45);
          ((void (*)(char *, uint64_t, char *))v107[6])(v48, 1, (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
        }
      }
      else
      {
        ((void (*)(char *, uint64_t, unsigned char *))v107[6])(v38, 1, &v39[v45]);
      }
      v45 += v12;
      v46 -= v12;
      --v47;
      unint64_t v39 = v108;
      uint64_t v38 = v109;
    }
    while (v47);
  }
  uint64_t v49 = v106;
  if (v44 < v105)
  {
    size_t v50 = (unint64_t)&v103[v34] / v12;
    size_t v51 = v12 + v12 * v50;
    unint64_t v52 = v51 - 1;
    size_t v53 = v51 - 9;
    uint64_t v54 = (char *)&v110[1] - v12;
    v103 = v54;
    uint64_t v104 = v51 - 1;
    unint64_t v55 = v107;
    do
    {
      unint64_t v56 = 0;
      size_t v57 = v44 * v12;
      do
      {
        unint64_t v58 = v56 + v57;
        unint64_t v59 = v56 + v57 - v17;
        if (v56 + v57 >= v17)
        {
          if (v59 >= *v49) {
            char v61 = 0;
          }
          else {
            char v61 = *(unsigned char *)(v49[1] + v59);
          }
          if (v58 == v34) {
            char v62 = 0;
          }
          else {
            char v62 = -1;
          }
          char v60 = v62 & v61 | ~v62 & 0x80;
          BOOL v63 = v58 <= v53 && v58 > v34;
          if (v63) {
            char v60 = 0;
          }
          if (v56 >= v12 - 8)
          {
            if (v58 <= v52 && v58 > v53) {
              char v65 = -1;
            }
            else {
              char v65 = 0;
            }
            char v60 = v65 & v54[v56] | v60 & ~v65;
          }
        }
        else
        {
          char v60 = v39[v58];
        }
        v27[v56++] = v60;
      }
      while (v12 != v56);
      ((void (*)(char *, uint64_t, char *))v55[6])(v109, 1, (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v38 = v109;
      unint64_t v66 = v55[1];
      if (v66 >= 4)
      {
        unint64_t v67 = v66 >> 2;
        uint64_t v68 = v102;
        v69 = v109;
        do
        {
          if (v44 == v50) {
            uint64_t v70 = v69;
          }
          else {
            uint64_t v70 = v68;
          }
          *(_DWORD *)uint64_t v68 = *(_DWORD *)v70;
          v68 += 4;
          v69 += 4;
          --v67;
        }
        while (v67);
      }
      ++v44;
      uint64_t v49 = v106;
      unint64_t v39 = v108;
      uint64_t v54 = v103;
      unint64_t v52 = v104;
    }
    while (v44 < v105);
  }
  size_t v71 = v107;
  unint64_t v72 = *v107;
  if (*v107 > 0x10)
  {
    uint64_t v74 = v101;
    BOOL v79 = v102;
    int v75 = v99;
    if (v72 >= 0x21)
    {
      int v83 = 0;
      uint64_t v84 = 0;
      unint64_t v85 = v72 >> 3;
      unsigned int v86 = 1;
      do
      {
        *(void *)&v74[v83] = bswap64(*(void *)&v79[8 * v84]);
        uint64_t v84 = v86;
        BOOL v63 = v85 > v86++;
        v83 += 8;
      }
      while (v63);
    }
    else
    {
      uint64_t v80 = 0;
      unint64_t v81 = v72 >> 2;
      unsigned int v82 = 1;
      do
      {
        *(_DWORD *)&v74[v80] = bswap32(*(_DWORD *)&v79[v80]);
        v80 += 4;
        BOOL v63 = v81 > v82++;
      }
      while (v63);
    }
  }
  else
  {
    uint64_t v74 = v101;
    unint64_t v73 = v102;
    int v75 = v99;
    if (v72 >= 4)
    {
      uint64_t v76 = 0;
      unint64_t v77 = v72 >> 2;
      unsigned int v78 = 1;
      do
      {
        *(_DWORD *)&v74[v76] = *(_DWORD *)&v73[v76];
        v76 += 4;
        BOOL v63 = v77 > v78++;
      }
      while (v63);
    }
  }
  bzero(v38, v71[1]);
  BOOL v87 = memset((char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 92, v12);
  MEMORY[0x270FA5388](v87);
  uint64_t v90 = (char *)&v96 - v89;
  if (v91 >= 8) {
    memset((char *)&v96 - v89, 170, v88);
  }
  ccdigest_init();
  size_t v92 = *v71;
  if (v75 == 768)
  {
    ccdigest_update();
  }
  else if (v92)
  {
    size_t v93 = 0;
    uint64_t v94 = (uint64_t)v97 + 41;
    do
    {
      v27[v93] ^= *(unsigned char *)(v94 + v93);
      ++v93;
    }
    while (v93 < v92);
  }
  ccdigest_update();
  ccdigest_update();
  ((void (*)(size_t *, char *, uint64_t))v71[7])(v71, v90, v100);
  cc_clear();
  bzero(v74, *v71);
  return 0;
}

BOOL SSLVerifyMac(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v8 = a1;
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = (size_t **)(a5 + 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v10) {
    memset((char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v10);
  }
  SSLComputeMac(v8, a2, a3, (uint64_t)v11, v9, *(_DWORD *)(a5 + 492));
  return (cc_cmp_safe() & 1) == 0;
}

__CFString *copyHexString(uint64_t a1, unint64_t a2)
{
  Mutable = CFStringCreateMutable(0, 2 * a2);
  if (a2)
  {
    unint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      CFStringAppendFormat(Mutable, 0, @"%02X", *(unsigned __int8 *)(a1 + v5));
      unint64_t v5 = v6++;
    }
    while (v5 < a2);
  }
  return Mutable;
}

unint64_t SSLDecodeUInt64(unsigned __int8 *a1, uint64_t a2)
{
  for (unint64_t i = 0; a2; --a2)
  {
    unsigned int v3 = *a1++;
    unint64_t i = v3 | (i << 8);
  }
  return i;
}

void *__ssl_add_debug_logger(uint64_t a1, uint64_t a2)
{
  uint64_t result = sslMalloc(0x18uLL);
  *uint64_t result = a1;
  result[1] = a2;
  result[2] = gDebugLoggers;
  gDebugLoggers = (uint64_t)result;
  return result;
}

uint64_t __security_debug_init()
{
  uint64_t result = open("/Library/Preferences/com.apple.security.plist", 0);
  if (result != -1)
  {
    int v1 = result;
    v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v8.st_blksize_t size = v2;
    *(timespec *)v8.st_qspare = v2;
    v8.st_birthtimespec = v2;
    *(timespec *)&v8.st_size_t size = v2;
    v8.st_mtimespec = v2;
    v8.st_ctimespec = v2;
    *(timespec *)&v8.st_uid = v2;
    v8.st_atimespec = v2;
    *(timespec *)&v8.st_dev = v2;
    if (fstat(result, &v8) != -1 && v8.st_size <= 99999)
    {
      unsigned int v3 = malloc_type_malloc(v8.st_size, 0xEC05DB5FuLL);
      if (v3)
      {
        uint64_t v4 = v3;
        st_size_t size = v8.st_size;
        if (st_size == read(v1, v3, v8.st_size))
        {
          unsigned int v6 = (void *)xpc_create_from_plist();
          if (v6)
          {
            uint64_t v7 = v6;
            gDebugScope = (uint64_t)xpc_dictionary_get_value(v6, "SSLDebugScope");
            if (gDebugScope)
            {
              if (MEMORY[0x210563DB0]() == MEMORY[0x263EF8708])
              {
                xpc_retain((xpc_object_t)gDebugScope);
              }
              else if (MEMORY[0x210563DB0](gDebugScope) == MEMORY[0x263EF86E0])
              {
                __ssl_debug_all = xpc_BOOL_get_value((xpc_object_t)gDebugScope);
                gDebugScope = 0;
              }
            }
            xpc_release(v7);
          }
        }
        free(v4);
      }
    }
    return close(v1);
  }
  return result;
}

uint64_t NullInit()
{
  return 0;
}

uint64_t CCSymmInit(_DWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void **a6)
{
  if (*a6) {
    sslFree(*a6);
  }
  if ((*a1 - 5) > 1)
  {
    if (a2) {
      uint64_t v9 = (void *)ccdes3_cbc_encrypt_mode();
    }
    else {
      uint64_t v9 = (void *)ccdes3_cbc_decrypt_mode();
    }
  }
  else if (a2)
  {
    uint64_t v9 = (void *)ccaes_cbc_encrypt_mode();
  }
  else
  {
    uint64_t v9 = (void *)ccaes_cbc_decrypt_mode();
  }
  size_t v10 = v9;
  uint64_t v11 = sslMalloc(((v9[1] + ((*v9 + 15) & 0xFFFFFFFFFFFFFFF0) + 15) & 0xFFFFFFFFFFFFFFF0) + 16);
  if (!v11)
  {
    __ssl_debug("sslError", "CCSymmInit", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/symCipher.c", 140, "CCSymmInit: Can't allocate context\n");
    return 4294957296;
  }
  size_t v12 = v11;
  *uint64_t v11 = v10;
  uint64_t v13 = cccbc_init();
  if (v13)
  {
    uint64_t v14 = v13;
    goto LABEL_17;
  }
  uint64_t v14 = cccbc_set_iv();
  if (v14)
  {
LABEL_17:
    sslFree(v12);
    return v14;
  }
  *a6 = v12;
  return v14;
}

uint64_t CCSymmEncryptDecrypt(uint64_t a1, uint64_t a2, unint64_t a3, void **a4)
{
  if (!a4 || (unint64_t v5 = *a4) == 0)
  {
    __ssl_debug("sslError", "CCSymmEncryptDecrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/symCipher.c", 167, "CCSymmEncryptDecrypt: NULL cipherCtx\n");
    return 4294957296;
  }
  unint64_t v6 = v5[1];
  unint64_t v7 = a3 / v6;
  if (a3 % v6)
  {
    __ssl_debug("sslError", "CCSymmEncryptDecrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/symCipher.c", 174, "CCSymmEncryptDecrypt: Invalid size\n");
    return 4294957296;
  }
  unint64_t v9 = (unint64_t)a4 + ((*v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;

  return MEMORY[0x270ED8840](v5, a4 + 2, v9, v7, a1, a2);
}

uint64_t HashMD5Update()
{
  return 0;
}

uint64_t HashMD5Final(uint64_t a1, void *a2)
{
  uint64_t v4 = ccmd5_di();
  (*(void (**)(uint64_t, void, void))(v4 + 56))(v4, *(void *)(a1 + 8), a2[1]);
  *a2 = *(void *)v4;
  return 0;
}

uint64_t HashMD5Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = ccmd5_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(void *)(v4 + 8) + *(void *)(v4 + 16) + 12);
  return 0;
}

uint64_t HashSHA1Final(uint64_t a1, void *a2)
{
  uint64_t v4 = ccsha1_di();
  (*(void (**)(uint64_t, void, void))(v4 + 56))(v4, *(void *)(a1 + 8), a2[1]);
  *a2 = *(void *)v4;
  return 0;
}

uint64_t HashSHA1Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = ccsha1_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(void *)(v4 + 8) + *(void *)(v4 + 16) + 12);
  return 0;
}

uint64_t HashSHA512Final(uint64_t a1, void *a2)
{
  uint64_t v4 = ccsha512_di();
  (*(void (**)(uint64_t, void, void))(v4 + 56))(v4, *(void *)(a1 + 8), a2[1]);
  *a2 = *(void *)v4;
  return 0;
}

uint64_t HashSHA512Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = ccsha512_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(void *)(v4 + 8) + *(void *)(v4 + 16) + 12);
  return 0;
}

void tls_metric_insecure_dh_param_cold_1()
{
  dlerror();
  uint64_t v0 = (const void *)abort_report_np();
  CFRelease(v0);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x270ED7E48]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccDRBGGetRngState()
{
  return MEMORY[0x270ED87C8]();
}

uint64_t cc_clear()
{
  return MEMORY[0x270ED87D0]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x270ED87E0]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x270ED87E8]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x270ED8800]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x270ED8808]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x270ED8828]();
}

uint64_t cccbc_set_iv()
{
  return MEMORY[0x270ED8838]();
}

uint64_t ccder_decode_dhparam_n()
{
  return MEMORY[0x270ED8900]();
}

uint64_t ccder_decode_dhparams()
{
  return MEMORY[0x270ED8908]();
}

uint64_t ccdes3_cbc_decrypt_mode()
{
  return MEMORY[0x270ED89C8]();
}

uint64_t ccdes3_cbc_encrypt_mode()
{
  return MEMORY[0x270ED89D0]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x270ED89D8]();
}

uint64_t ccdh_compute_shared_secret()
{
  return MEMORY[0x270ED89E0]();
}

uint64_t ccdh_ctx_public()
{
  return MEMORY[0x270ED89E8]();
}

uint64_t ccdh_export_pub()
{
  return MEMORY[0x270ED89F0]();
}

uint64_t ccdh_export_pub_size()
{
  return MEMORY[0x270ED89F8]();
}

uint64_t ccdh_generate_key()
{
  return MEMORY[0x270ED8A00]();
}

uint64_t ccdh_gp_g()
{
  return MEMORY[0x270ED8A08]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x270ED8A10]();
}

uint64_t ccdh_gp_prime()
{
  return MEMORY[0x270ED8A18]();
}

uint64_t ccdh_gp_rfc5114_MODP_2048_256()
{
  return MEMORY[0x270ED8A20]();
}

uint64_t ccdh_gp_size()
{
  return MEMORY[0x270ED8A28]();
}

uint64_t ccdh_import_pub()
{
  return MEMORY[0x270ED8A30]();
}

uint64_t ccdh_init_gp_from_bytes()
{
  return MEMORY[0x270ED8A38]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x270ED8A98]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x270ED8AA0]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x270ED8AA8]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x270ED8AB8]();
}

uint64_t ccec_generate_key()
{
  return MEMORY[0x270ED8AC0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x270ED8AD8]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x270ED8B00]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x270ED8B60]();
}

uint64_t ccgcm_inc_iv()
{
  return MEMORY[0x270ED8B70]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x270ED8B90]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x270ED8BA0]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x270ED8C28]();
}

uint64_t ccn_bitlen()
{
  return MEMORY[0x270ED8C30]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x270ED8C40]();
}

uint64_t ccn_swap()
{
  return MEMORY[0x270ED8C50]();
}

uint64_t ccn_write_uint()
{
  return MEMORY[0x270ED8C58]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x270ED8C60]();
}

uint64_t ccn_write_uint_size()
{
  return MEMORY[0x270ED8C68]();
}

uint64_t ccrsa_init_pub()
{
  return MEMORY[0x270ED8D18]();
}

uint64_t ccrsa_pub_crypt()
{
  return MEMORY[0x270ED8D28]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x270ED8D38]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x270ED8D60]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x270ED8D88]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x270ED8E70]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t csops()
{
  return MEMORY[0x270ED9150]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x270EDBED8]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x270EDBF70]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}