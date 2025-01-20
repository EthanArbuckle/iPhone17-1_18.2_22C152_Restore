@interface NSError(MSVErrorAdditions)
+ (id)_msv_errorWithDomain:()MSVErrorAdditions code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:;
+ (id)msv_errorWithDomain:()MSVErrorAdditions code:debugDescription:;
+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingError:debugDescription:;
+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingError:userInfo:debugDescription:;
+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingErrors:debugDescription:;
+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingErrors:userInfo:debugDescription:;
+ (id)msv_errorWithDomain:()MSVErrorAdditions code:userInfo:debugDescription:;
- (__CFString)msv_codeDescription;
- (id)msv_analyticSignature;
- (id)msv_description;
- (id)msv_errorByRemovingUnsafeUserInfo;
- (id)msv_errorByUnwrappingDomain:()MSVErrorAdditions;
- (id)msv_errorByUnwrappingDomain:()MSVErrorAdditions code:;
- (id)msv_errorByWrappingWithDomain:()MSVErrorAdditions code:debugDescription:;
- (id)msv_errorByWrappingWithDomain:()MSVErrorAdditions code:userInfo:debugDescription:;
- (id)msv_firstValueForUserInfoKey:()MSVErrorAdditions;
- (id)msv_signature;
- (id)msv_underlyingError;
@end

@implementation NSError(MSVErrorAdditions)

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:debugDescription:
{
  v9 = objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, 0, 0, 0, a5, &a9, &a9);
  return v9;
}

+ (id)_msv_errorWithDomain:()MSVErrorAdditions code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v18 = (void *)[a7 mutableCopy];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  }
  v21 = v20;

  if (v17)
  {
    v22 = (void *)[[NSString alloc] initWithFormat:v17 arguments:a9];
    [v21 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  if (v15) {
    [v21 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if ([v16 count])
  {
    v23 = (void *)[v16 copy];
    [v21 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F28750]];
  }
  v24 = [MEMORY[0x1E4F28C58] errorWithDomain:v14 code:a4 userInfo:v21];

  return v24;
}

- (id)msv_signature
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  uint64_t v145 = 0;
  memset(v144, 0, sizeof(v144));
  long long v140 = xmmword_1A312BA80;
  v141.i64[0] = 0x85EBCA7724234428;
  v141.i64[1] = 0x61C8864F00000000;
  v4 = (int *)&v142;
  uint64_t v142 = 0;
  uint64_t v143 = 0;
  LODWORD(v144[0]) = 0;
  id v5 = [a1 domain];
  v6 = (char *)[v5 UTF8String];
  size_t v7 = [v5 length];
  if (v6)
  {
    int v8 = v7;
    DWORD2(v140) = v7;
    HIDWORD(v140) = v7 > 0xF;
    if (v7 <= 0xF)
    {
      memcpy(&v142, v6, v7);
      int v9 = LODWORD(v144[0]) + v8;
LABEL_10:
      LODWORD(v144[0]) = v9;
      goto LABEL_11;
    }
    v10 = &v6[v7];
    unint64_t v11 = (unint64_t)&v6[v7 - 16];
    if ((unint64_t)v6 <= v11)
    {
      unsigned int v12 = 0;
      int v13 = 1640531535;
      int v14 = 606290984;
      int v15 = -2048144777;
      do
      {
        HIDWORD(v16) = v14 - 2048144777 * *(_DWORD *)v6;
        LODWORD(v16) = HIDWORD(v16);
        int v14 = -1640531535 * (v16 >> 19);
        HIDWORD(v16) = v15 - 2048144777 * *((_DWORD *)v6 + 1);
        LODWORD(v16) = HIDWORD(v16);
        int v15 = -1640531535 * (v16 >> 19);
        HIDWORD(v16) = v12 - 2048144777 * *((_DWORD *)v6 + 2);
        LODWORD(v16) = HIDWORD(v16);
        unsigned int v12 = -1640531535 * (v16 >> 19);
        HIDWORD(v16) = v13 - 2048144777 * *((_DWORD *)v6 + 3);
        LODWORD(v16) = HIDWORD(v16);
        int v13 = -1640531535 * (v16 >> 19);
        v6 += 16;
      }
      while ((unint64_t)v6 <= v11);
      v141.i64[0] = __PAIR64__(v15, v14);
      v141.i64[1] = __PAIR64__(v13, v12);
    }
    if (v6 < v10)
    {
      int v9 = v10 - v6;
      __memcpy_chk();
      goto LABEL_10;
    }
  }
LABEL_11:

  memset(&v149[8], 0, 64);
  *(void *)v149 = v140;
  if ((uint64_t)v140 <= 3000)
  {
    if ((uint64_t)v140 <= 1999)
    {
      if (!(void)v140)
      {
        v49 = [MEMORY[0x1E4F28B00] currentHandler];
        v50 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v49 handleFailureInFunction:v50 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

        goto LABEL_58;
      }
      if ((void)v140 != 1000) {
        goto LABEL_58;
      }
      uint64_t v17 = (*((void *)&v140 + 1) + v141.i64[0]) ^ __ROR8__(v141.i64[0], 51);
      uint64_t v18 = v141.i64[1] + (v142 ^ v143);
      uint64_t v19 = __ROR8__(v142 ^ v143, 48);
      uint64_t v20 = (v18 ^ v19) + __ROR8__(*((void *)&v140 + 1) + v141.i64[0], 32);
      uint64_t v21 = v20 ^ __ROR8__(v18 ^ v19, 43);
      uint64_t v22 = v18 + v17;
      uint64_t v23 = v22 ^ __ROR8__(v17, 47);
      uint64_t v24 = (v20 ^ v143) + v23;
      uint64_t v25 = v24 ^ __ROR8__(v23, 51);
      uint64_t v26 = (__ROR8__(v22, 32) ^ 0xFFLL) + v21;
      uint64_t v27 = __ROR8__(v21, 48);
      uint64_t v28 = __ROR8__(v24, 32) + (v26 ^ v27);
      uint64_t v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
      uint64_t v30 = v25 + v26;
      uint64_t v31 = v30 ^ __ROR8__(v25, 47);
      uint64_t v32 = v31 + v28;
      uint64_t v33 = v32 ^ __ROR8__(v31, 51);
      uint64_t v34 = __ROR8__(v30, 32) + v29;
      uint64_t v35 = __ROR8__(v29, 48);
      uint64_t v36 = __ROR8__(v32, 32) + (v34 ^ v35);
      uint64_t v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
      uint64_t v38 = v33 + v34;
      uint64_t v39 = v38 ^ __ROR8__(v33, 47);
      uint64_t v40 = v39 + v36;
      uint64_t v41 = v40 ^ __ROR8__(v39, 51);
      uint64_t v42 = __ROR8__(v38, 32) + v37;
      uint64_t v43 = __ROR8__(v37, 48);
      uint64_t v44 = __ROR8__(v40, 32) + (v42 ^ v43);
      uint64_t v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
      uint64_t v46 = v41 + v42;
      *((void *)&v140 + 1) = v44;
      v141.i64[0] = v46 ^ __ROR8__(v41, 47);
      v141.i64[1] = __ROR8__(v46, 32);
      uint64_t v142 = v45;
      uint64_t v47 = v141.i64[0] ^ v44 ^ v141.i64[1] ^ v45;
      goto LABEL_45;
    }
    if ((void)v140 != 2000)
    {
      if ((void)v140 != 3000) {
        goto LABEL_58;
      }
      if (HIDWORD(v140)) {
        __int32 v48 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v141, (uint32x4_t)xmmword_1A312BAA0), (int8x16_t)vshlq_u32(v141, (uint32x4_t)xmmword_1A312BA90)));
      }
      else {
        __int32 v48 = v141.i32[2] + 374761393;
      }
      unsigned __int32 v60 = DWORD2(v140) + v48;
      unint64_t v61 = v144[0] & 0xF;
      if (v61 >= 4)
      {
        do
        {
          int v62 = *v4++;
          HIDWORD(v63) = v60 - 1028477379 * v62;
          LODWORD(v63) = HIDWORD(v63);
          unsigned __int32 v60 = 668265263 * (v63 >> 15);
          v61 -= 4;
        }
        while (v61 > 3);
      }
      for (; v61; --v61)
      {
        int v64 = *(unsigned __int8 *)v4;
        v4 = (int *)((char *)v4 + 1);
        HIDWORD(v65) = v60 + 374761393 * v64;
        LODWORD(v65) = HIDWORD(v65);
        unsigned __int32 v60 = -1640531535 * (v65 >> 21);
      }
      unsigned int v66 = (-2048144777 * (v60 ^ (v60 >> 15))) ^ ((-2048144777 * (v60 ^ (v60 >> 15))) >> 13);
      unsigned int v67 = (-1028477379 * v66) ^ ((-1028477379 * v66) >> 16);
      goto LABEL_57;
    }
    switch(v141.u8[3])
    {
      case 1u:
        int v53 = v141.u8[0];
        break;
      case 2u:
        int v53 = v141.u16[0];
        break;
      case 3u:
        int v53 = v141.u16[0] | (v141.u8[2] << 16);
        break;
      default:
        unsigned int v68 = DWORD2(v140);
        goto LABEL_56;
    }
    unsigned int v68 = (461845907 * ((380141568 * v53) | ((-862048943 * v53) >> 17))) ^ DWORD2(v140);
LABEL_56:
    unsigned int v69 = -2048144789 * (v68 ^ HIDWORD(v140) ^ ((v68 ^ HIDWORD(v140)) >> 16));
    unsigned int v67 = (-1028477387 * (v69 ^ (v69 >> 13))) ^ ((-1028477387 * (v69 ^ (v69 >> 13))) >> 16);
    DWORD2(v140) = v67;
LABEL_57:
    *(_DWORD *)&v149[8] = v67;
    goto LABEL_58;
  }
  if ((uint64_t)v140 > 4000)
  {
    switch((void)v140)
    {
      case 0xFA1:
        CC_SHA1_Final(&v149[8], (CC_SHA1_CTX *)((char *)&v140 + 8));
        break;
      case 0x10A0:
        CC_SHA256_Final(&v149[8], (CC_SHA256_CTX *)((char *)&v140 + 8));
        break;
      case 0x11A0:
        CC_SHA512_Final(&v149[8], (CC_SHA512_CTX *)((char *)&v140 + 8));
        break;
    }
    goto LABEL_58;
  }
  if ((void)v140 == 3001)
  {
    v51 = (uint64_t *)v144;
    if (*((void *)&v140 + 1) < 0x20uLL) {
      unint64_t v52 = v142 + 0x27D4EB2F165667C5;
    }
    else {
      unint64_t v52 = 0x85EBCA77C2B2AE63
    }
          - 0x61C8864E7A143579
          * ((0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((__ROR8__(v141.i64[1], 57) + __ROR8__(v141.i64[0], 63) + __ROR8__(v142, 52) + __ROR8__(v143, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v141.i64[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v141.i64[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v142, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v143, 33)));
    unint64_t v54 = v52 + *((void *)&v140 + 1);
    unint64_t v55 = BYTE8(v140) & 0x1F;
    if (v55 >= 8)
    {
      do
      {
        uint64_t v56 = *v51++;
        unint64_t v54 = 0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v56, 33)) ^ v54, 37);
        v55 -= 8;
      }
      while (v55 > 7);
    }
    if (v55 >= 4)
    {
      unsigned int v57 = *(_DWORD *)v51;
      v51 = (uint64_t *)((char *)v51 + 4);
      unint64_t v54 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v57) ^ v54, 41);
      v55 -= 4;
    }
    for (; v55; --v55)
    {
      unsigned int v58 = *(unsigned __int8 *)v51;
      v51 = (uint64_t *)((char *)v51 + 1);
      unint64_t v54 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v58) ^ v54, 53);
    }
    unint64_t v59 = 0x165667B19E3779F9
        * ((0xC2B2AE3D27D4EB4FLL * (v54 ^ (v54 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v54 ^ (v54 >> 33))) >> 29));
    uint64_t v47 = v59 ^ HIDWORD(v59);
LABEL_45:
    *(void *)&v149[8] = v47;
    goto LABEL_58;
  }
  if ((void)v140 == 4000) {
    CC_MD5_Final(&v149[8], (CC_MD5_CTX *)((char *)&v140 + 8));
  }
LABEL_58:
  long long v150 = *(_OWORD *)v149;
  v151[0] = *(_OWORD *)&v149[16];
  v151[1] = *(_OWORD *)&v149[32];
  v151[2] = *(_OWORD *)&v149[48];
  uint64_t v152 = *(void *)&v149[64];
  if (*(uint64_t *)v149 > 3999)
  {
    if (*(uint64_t *)v149 > 4255)
    {
      if (*(void *)v149 == 4256)
      {
        v111 = (unsigned __int8 *)&v150 + 8;
        v112 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v113 = v112;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v115 = *v111++;
          v116 = &v112[i];
          char *v116 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v115 >> 4];
          v116[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v115 & 0xF];
        }
        id v82 = [NSString alloc];
        v83 = v113;
        uint64_t v84 = 64;
      }
      else
      {
        if (*(void *)v149 != 4512) {
          goto LABEL_119;
        }
        v89 = (unsigned __int8 *)&v150 + 8;
        v90 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v91 = v90;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v93 = *v89++;
          v94 = &v90[j];
          char *v94 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v93 >> 4];
          v94[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v93 & 0xF];
        }
        id v82 = [NSString alloc];
        v83 = v91;
        uint64_t v84 = 128;
      }
    }
    else if (*(void *)v149 == 4000)
    {
      v101 = (unsigned __int8 *)&v150 + 8;
      v102 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v103 = v102;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v105 = *v101++;
        v106 = &v102[k];
        char *v106 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v105 >> 4];
        v106[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v105 & 0xF];
      }
      id v82 = [NSString alloc];
      v83 = v103;
      uint64_t v84 = 32;
    }
    else
    {
      if (*(void *)v149 != 4001) {
        goto LABEL_119;
      }
      v76 = (unsigned __int8 *)&v150 + 8;
      v77 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v78 = v77;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v80 = *v76++;
        v81 = &v77[m];
        char *v81 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v80 >> 4];
        v81[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v80 & 0xF];
      }
      id v82 = [NSString alloc];
      v83 = v78;
      uint64_t v84 = 40;
    }
LABEL_102:
    CFStringRef v100 = (CFStringRef)[v82 initWithBytesNoCopy:v83 length:v84 encoding:4 freeWhenDone:1];
    goto LABEL_103;
  }
  if (*(uint64_t *)v149 > 2999)
  {
    if (*(void *)v149 == 3000)
    {
      LODWORD(v153[0]) = bswap32(DWORD2(v150));
      v107 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v108 = 0;
      v109 = v107 + 1;
      do
      {
        unint64_t v110 = *((unsigned __int8 *)v153 + v108);
        *(v109 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v110 >> 4];
        unsigned char *v109 = MSVFastHexStringFromBytes_hexCharacters_3705[v110 & 0xF];
        v109 += 2;
        ++v108;
      }
      while (v108 != 4);
      id v82 = [NSString alloc];
      v83 = v107;
      uint64_t v84 = 8;
    }
    else
    {
      if (*(void *)v149 != 3001) {
        goto LABEL_119;
      }
      v153[0] = bswap64(*((unint64_t *)&v150 + 1));
      v85 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v86 = 0;
      v87 = v85 + 1;
      do
      {
        unint64_t v88 = *((unsigned __int8 *)v153 + v86);
        *(v87 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v88 >> 4];
        unsigned char *v87 = MSVFastHexStringFromBytes_hexCharacters_3705[v88 & 0xF];
        v87 += 2;
        ++v86;
      }
      while (v86 != 8);
      id v82 = [NSString alloc];
      v83 = v85;
      uint64_t v84 = 16;
    }
    goto LABEL_102;
  }
  if (*(void *)v149 == 1000)
  {
    uint64_t v95 = *((void *)&v150 + 1);
    v96 = (char *)&v154 + 1;
    uint64_t quot = *((void *)&v150 + 1);
    do
    {
      lldiv_t v98 = lldiv(quot, 10);
      uint64_t quot = v98.quot;
      if (v98.rem >= 0) {
        LOBYTE(v99) = v98.rem;
      }
      else {
        uint64_t v99 = -v98.rem;
      }
      *(v96 - 2) = v99 + 48;
      v75 = (const UInt8 *)(v96 - 2);
      --v96;
    }
    while (v98.quot);
    if (v95 < 0)
    {
      *(v96 - 2) = 45;
      v75 = (const UInt8 *)(v96 - 2);
    }
    v74 = (char *)((char *)&v154 - (char *)v75);
    goto LABEL_92;
  }
  if (*(void *)v149 != 2000)
  {
LABEL_119:
    v137 = [MEMORY[0x1E4F28B00] currentHandler];
    v138 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
    [v137 handleFailureInFunction:v138 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

    v117 = &stru_1EF642BA8;
    goto LABEL_104;
  }
  uint64_t v70 = DWORD2(v150);
  v71 = &v154;
  do
  {
    ldiv_t v72 = ldiv(v70, 10);
    uint64_t v70 = v72.quot;
    if (v72.rem >= 0) {
      LOBYTE(v73) = v72.rem;
    }
    else {
      uint64_t v73 = -v72.rem;
    }
    *((unsigned char *)v71 - 1) = v73 + 48;
    v71 = (uint64_t *)((char *)v71 - 1);
  }
  while (v72.quot);
  v74 = (char *)((char *)&v154 - (char *)v71);
  v75 = (const UInt8 *)v71;
LABEL_92:
  CFStringRef v100 = CFStringCreateWithBytes(0, v75, (CFIndex)v74, 0x8000100u, 0);
LABEL_103:
  v117 = (__CFString *)v100;
LABEL_104:
  v148[0] = v117;
  uint64_t v118 = [a1 code];
  uint64_t v119 = v118;
  v120 = (char *)v151 + 9;
  do
  {
    ldiv_t v121 = ldiv(v118, 10);
    uint64_t v118 = v121.quot;
    if (v121.rem >= 0) {
      LOBYTE(v122) = v121.rem;
    }
    else {
      uint64_t v122 = -v121.rem;
    }
    *(v120 - 2) = v122 + 48;
    v123 = (const UInt8 *)(v120 - 2);
    --v120;
  }
  while (v121.quot);
  if (v119 < 0)
  {
    *(v120 - 2) = 45;
    v123 = (const UInt8 *)(v120 - 2);
  }
  v124 = (__CFString *)CFStringCreateWithBytes(0, v123, (char *)v151 + 8 - (char *)v123, 0x8000100u, 0);
  v148[1] = v124;
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:2];
  v126 = [v125 componentsJoinedByString:@":"];

  v127 = [a1 underlyingErrors];
  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = __43__NSError_MSVErrorAdditions__msv_signature__block_invoke;
  v139[3] = &unk_1E5AD9D18;
  v139[4] = a1;
  v139[5] = a2;
  v128 = objc_msgSend(v127, "msv_map:", v139);

  if ([v128 count] == 1)
  {
    v147[0] = v126;
    v129 = [v128 firstObject];
    v147[1] = v129;
    v130 = v147;
  }
  else
  {
    if ((unint64_t)[v128 count] < 2) {
      goto LABEL_116;
    }
    v131 = NSString;
    v132 = [v128 componentsJoinedByString:@","];
    v129 = [v131 stringWithFormat:@"[%@]", v132];

    v146[0] = v126;
    v146[1] = v129;
    v130 = v146;
  }
  v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
  uint64_t v134 = [v133 componentsJoinedByString:@"/"];

  v126 = (void *)v134;
LABEL_116:
  id v135 = v126;

  return v135;
}

- (id)msv_analyticSignature
{
  v2 = [MEMORY[0x1E4F28E78] string];
  id v3 = a1;
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *MEMORY[0x1E4F28750];
    int v15 = v18;
    uint64_t v16 = *MEMORY[0x1E4F28A50];
    while (1)
    {
      v6 = [v4 domain];
      [v2 appendFormat:@"%@-%lld", v6, objc_msgSend(v4, "code"), v15];

      size_t v7 = [v4 userInfo];
      id v8 = [v7 objectForKeyedSubscript:v5];

      if ((_NSIsNSArray() & 1) == 0)
      {

        id v8 = 0;
      }
      if ((unint64_t)[v8 count] >= 2) {
        break;
      }
      int v9 = [v8 firstObject];
      v10 = v9;
      if (v9)
      {
        unint64_t v11 = v4;
        id v4 = v9;
      }
      else
      {
        unint64_t v11 = [v4 userInfo];
        uint64_t v12 = [v11 objectForKeyedSubscript:v16];

        id v4 = (id)v12;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      [v2 appendString:@">"];

      if (!v4) {
        goto LABEL_14;
      }
    }
    [v2 appendString:@"["];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v18[0] = __51__NSError_MSVErrorAdditions__msv_analyticSignature__block_invoke;
    v18[1] = &unk_1E5AD9CF0;
    id v13 = v2;
    id v19 = v13;
    id v8 = v8;
    id v20 = v8;
    [v8 enumerateObjectsUsingBlock:v17];
    [v13 appendString:@"]"];

    id v4 = v19;
LABEL_13:
  }
LABEL_14:
  return v2;
}

- (id)msv_underlyingError
{
  v1 = [a1 underlyingErrors];
  v2 = [v1 firstObject];

  return v2;
}

- (id)msv_description
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E78] string];
  id v3 = [a1 userInfo];
  uint64_t v4 = *MEMORY[0x1E4F28228];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [a1 localizedDescription];
  }
  id v8 = v7;

  int v9 = [a1 domain];
  v10 = objc_msgSend(a1, "msv_codeDescription");
  [v2 appendFormat:@"<%@.%@ \"%@\" {\n", v9, v10, v8];

  unint64_t v11 = [a1 userInfo];
  uint64_t v12 = (void *)[v11 mutableCopy];

  [v12 setObject:0 forKeyedSubscript:v4];
  [v12 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  [v12 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  [v12 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28750]];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    int v14 = objc_msgSend(v12, "msv_compactDescription");
    [v2 appendFormat:@"    userInfo: %@;\n", v14];
  }
  int v15 = [a1 underlyingErrors];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    uint64_t v29 = v16;
    uint64_t v30 = v13;
    uint64_t v31 = v12;
    uint64_t v32 = v8;
    [v2 appendString:@"    underlyingErrors: ["];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = [a1 underlyingErrors];
    uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "msv_description");
          uint64_t v22 = [v21 componentsSeparatedByString:@"\n"];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v35 != v25) {
                  objc_enumerationMutation(v22);
                }
                [v2 appendFormat:@"\n        %@", *(void *)(*((void *)&v34 + 1) + 8 * j)];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v24);
          }
          [v2 appendString:@","];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v18);
    }

    [v2 appendString:@"\n    ];\n"];
    uint64_t v12 = v31;
    id v8 = v32;
    uint64_t v16 = v29;
    uint64_t v13 = v30;
  }
  [v2 appendString:@"}>"];
  if (!(v13 | v16)) {
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\n", &stru_1EF642BA8, 0, 0, objc_msgSend(v2, "length"));
  }
  uint64_t v27 = (void *)[v2 copy];

  return v27;
}

- (__CFString)msv_codeDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t quot = [a1 code];
  uint64_t v3 = quot;
  uint64_t v4 = (char *)&v18 + 1;
  do
  {
    ldiv_t v5 = ldiv(quot, 10);
    uint64_t quot = v5.quot;
    if (v5.rem >= 0) {
      LOBYTE(v6) = v5.rem;
    }
    else {
      uint64_t v6 = -v5.rem;
    }
    *(v4 - 2) = v6 + 48;
    id v7 = (const UInt8 *)(v4 - 2);
    --v4;
  }
  while (v5.quot);
  if (v3 < 0)
  {
    *(v4 - 2) = 45;
    id v7 = (const UInt8 *)(v4 - 2);
  }
  id v8 = (__CFString *)CFStringCreateWithBytes(0, v7, (char *)&v18 - (char *)v7, 0x8000100u, 0);
  int v9 = NSString;
  v10 = [a1 domain];
  unint64_t v11 = [v9 stringWithFormat:@"NSStringFrom%@Code", v10];

  id v12 = v11;
  uint64_t v13 = (void (*)(uint64_t))dlsym((void *)0xFFFFFFFFFFFFFFFELL, (const char *)[v12 UTF8String]);
  if (v13)
  {
    int v14 = NSString;
    int v15 = v13([a1 code]);
    uint64_t v16 = [v14 stringWithFormat:@"%@ (%@)", v15, v8];

    id v8 = (__CFString *)v16;
  }

  return v8;
}

- (id)msv_firstValueForUserInfoKey:()MSVErrorAdditions
{
  id v4 = a3;
  ldiv_t v5 = [a1 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v8 = [a1 underlyingErrors];
    int v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = [v9 firstObject];
    if (v10)
    {
      unint64_t v11 = (void *)v10;
      while (1)
      {
        id v12 = [v11 userInfo];
        id v7 = [v12 objectForKeyedSubscript:v4];

        if (v7) {
          break;
        }
        objc_msgSend(v9, "msv_removeFirstObject");
        uint64_t v13 = [v11 underlyingErrors];
        [v9 addObjectsFromArray:v13];

        id v7 = [v9 firstObject];

        unint64_t v11 = v7;
        if (!v7) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      id v7 = 0;
    }
LABEL_10:
  }
  return v7;
}

- (id)msv_errorByUnwrappingDomain:()MSVErrorAdditions code:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a1 code] != a4) {
    goto LABEL_4;
  }
  id v7 = [a1 domain];
  if (v7 == v6)
  {

    goto LABEL_15;
  }
  id v8 = v7;
  int v9 = [v7 isEqual:v6];

  if (v9)
  {
LABEL_15:
    id v16 = a1;
    goto LABEL_16;
  }
LABEL_4:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = objc_msgSend(a1, "underlyingErrors", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "msv_errorByUnwrappingDomain:code:", v6, a4);
        if (v15)
        {
          id v16 = (id)v15;

          goto LABEL_16;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v16 = 0;
LABEL_16:

  return v16;
}

- (id)msv_errorByUnwrappingDomain:()MSVErrorAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 domain];
  if (v5 == v4)
  {

    goto LABEL_13;
  }
  id v6 = v5;
  int v7 = [v5 isEqual:v4];

  if (v7)
  {
LABEL_13:
    id v14 = a1;
    goto LABEL_15;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = objc_msgSend(a1, "underlyingErrors", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "msv_errorByUnwrappingDomain:", v4);
        if (v13)
        {
          id v14 = (id)v13;

          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v14 = 0;
LABEL_15:

  return v14;
}

- (id)msv_errorByWrappingWithDomain:()MSVErrorAdditions code:userInfo:debugDescription:
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  long long v16 = objc_msgSend((id)objc_opt_class(), "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", v15, a4, a1, 0, v14, v13, &a9);

  return v16;
}

- (id)msv_errorByWrappingWithDomain:()MSVErrorAdditions code:debugDescription:
{
  id v12 = a5;
  id v13 = a3;
  id v14 = objc_msgSend((id)objc_opt_class(), "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", v13, a4, a1, 0, 0, v12, &a9);

  return v14;
}

- (id)msv_errorByRemovingUnsafeUserInfo
{
  id v2 = [a1 userInfo];
  if (![v2 count])
  {
    id v15 = a1;
    goto LABEL_9;
  }
  uint64_t v3 = objc_msgSend(v2, "msv_filter:", &__block_literal_global_2153);
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x1E4F28A50];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  int v7 = objc_msgSend(v6, "msv_errorByRemovingUnsafeUserInfo");
  [v4 setObject:v7 forKeyedSubscript:v5];

  uint64_t v8 = *MEMORY[0x1E4F28750];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28750]];
  uint64_t v10 = objc_msgSend(v9, "msv_map:", &__block_literal_global_5);
  [v4 setObject:v10 forKeyedSubscript:v8];

  objc_msgSend(v4, "msv_compactMapValues:", &__block_literal_global_8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 == v11)
  {

    goto LABEL_7;
  }
  int v12 = [v2 isEqual:v11];

  if (v12)
  {
LABEL_7:
    id v15 = a1;
    goto LABEL_8;
  }
  id v13 = (void *)MEMORY[0x1E4F28C58];
  id v14 = [a1 domain];
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(a1, "code"), v11);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
LABEL_9:

  return v15;
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingErrors:userInfo:debugDescription:
{
  uint64_t v9 = objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, 0, a5, a6, a7, &a9, &a9);
  return v9;
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingErrors:debugDescription:
{
  uint64_t v9 = objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, 0, a5, 0, a6, &a9, &a9);
  return v9;
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingError:userInfo:debugDescription:
{
  uint64_t v9 = objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, a5, 0, a6, a7, &a9, &a9);
  return v9;
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:userInfo:debugDescription:
{
  uint64_t v9 = objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, 0, 0, a5, a6, &a9, &a9);
  return v9;
}

+ (id)msv_errorWithDomain:()MSVErrorAdditions code:underlyingError:debugDescription:
{
  uint64_t v9 = objc_msgSend(a1, "_msv_errorWithDomain:code:underlyingError:underlyingErrors:userInfo:debugDescriptionFormat:arguments:", a3, a4, a5, 0, 0, a6, &a9, &a9);
  return v9;
}

@end