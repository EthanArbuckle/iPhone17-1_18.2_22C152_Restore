@interface MSVSQLDatabaseTransaction
- (BOOL)_releaseSavepoint:(id)a3;
- (BOOL)commit;
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)executeStatementString:(id)a3 error:(id *)a4;
- (BOOL)rollback;
- (BOOL)rollbackToSavepoint:(id)a3;
- (NSString)description;
- (NSString)name;
- (__CFString)initWithConnection:(void *)a3 name:(void *)a4 error:;
- (id)createSavepoint;
- (id)resultsForStatement:(id)a3;
- (id)statementWithString:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation MSVSQLDatabaseTransaction

- (BOOL)executeStatementString:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (self->_invalid)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:724 description:@"Attempt to use invalidated transaction."];
  }
  BOOL v8 = [(_MSVSQLConnection *)self->_connection executeStatementString:v7 error:a4];

  return v8;
}

- (id)resultsForStatement:(id)a3
{
  id v5 = a3;
  if (self->_invalid)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:719 description:@"Attempt to use invalidated transaction."];
  }
  v6 = -[MSVSQLRowEnumerator initWithStatement:]((id *)[MSVSQLRowEnumerator alloc], v5);

  return v6;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (self->_invalid)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:714 description:@"Attempt to use invalidated transaction."];
  }
  BOOL v8 = [(_MSVSQLConnection *)self->_connection executeStatement:v7 error:a4];

  return v8;
}

- (id)statementWithString:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (self->_invalid)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:709 description:@"Attempt to use invalidated transaction."];
  }
  BOOL v8 = [(_MSVSQLConnection *)self->_connection statementWithString:v7 error:a4];

  return v8;
}

- (__CFString)initWithConnection:(void *)a3 name:(void *)a4 error:
{
  v173[0] = *MEMORY[0x1E4F143B8];
  BOOL v8 = a2;
  id v9 = a3;
  if (!a1) {
    goto LABEL_144;
  }
  v152.receiver = a1;
  v152.super_class = (Class)MSVSQLDatabaseTransaction;
  v10 = (__CFString *)[(__CFString *)&v152 init];
  a1 = v10;
  if (!v10) {
    goto LABEL_144;
  }
  v148 = a4;
  id v149 = v9;
  objc_storeStrong((id *)&v10->data, a2);
  unint64_t v11 = MSVHasherSharedSeed();
  id v12 = v8[7];
  long long v165 = 0u;
  long long v164 = 0u;
  long long v163 = 0u;
  long long v162 = 0u;
  long long v161 = 0u;
  long long v160 = 0u;
  long long v159 = 0u;
  long long v158 = 0u;
  *(_OWORD *)buf = xmmword_1A312BAB0;
  *(int64x2_t *)&buf[16] = vaddq_s64(vdupq_n_s64(v11), (int64x2_t)xmmword_1A312BAC0);
  *(void *)&long long v154 = v11;
  *((void *)&v154 + 1) = v11 + 0x61C8864E7A143579;
  long long v155 = 0u;
  long long v156 = 0u;
  uint64_t v157 = 0;
  id v13 = v12;
  v14 = (unsigned char *)[v13 UTF8String];
  uint64_t v15 = [v13 length];
  int v16 = v15;
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(void *)buf == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v14, v15);
      }
      else if (*(void *)buf == 4512)
      {
        CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v14, v15);
      }
    }
    else if (*(void *)buf == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&buf[8], v14, v15);
    }
    else if (*(void *)buf == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v14, v15);
    }
  }
  else if (*(uint64_t *)buf > 2999)
  {
    if (*(void *)buf == 3000)
    {
      _MSV_XXH_XXH32_update(&buf[8], v14, v15);
    }
    else if (*(void *)buf == 3001)
    {
      _MSV_XXH_XXH64_update(&buf[8], v14, v15);
    }
  }
  else if (*(void *)buf)
  {
    if (*(void *)buf == 2000)
    {
      int v17 = (((v15 + buf[19]) & 3) - buf[19]);
      v18 = &buf[buf[19] + 16];
      switch(v17)
      {
        case 0:
          break;
        case 1:
          unsigned char *v18 = *v14;
          break;
        case 2:
          __int16 v21 = *(_WORD *)v14;
          goto LABEL_26;
        case 3:
          __int16 v21 = *(_WORD *)v14;
          v18[2] = v14[2];
LABEL_26:
          *(_WORD *)v18 = v21;
          break;
        default:
          memcpy(v18, v14, (((v16 + buf[19]) & 3) - buf[19]));
          break;
      }
      *(_DWORD *)&buf[12] += v16;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
    [v19 handleFailureInFunction:v20 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
  }
  memset(&v166[8], 0, 64);
  *(void *)v166 = *(void *)buf;
  if (*(uint64_t *)buf > 3000)
  {
    if (*(uint64_t *)buf <= 4000)
    {
      if (*(void *)buf == 3001)
      {
        *(void *)&v166[8] = _MSV_XXH_XXH64_digest(&buf[8]);
      }
      else if (*(void *)buf == 4000)
      {
        CC_MD5_Final(&v166[8], (CC_MD5_CTX *)&buf[8]);
      }
    }
    else
    {
      switch(*(void *)buf)
      {
        case 0xFA1:
          CC_SHA1_Final(&v166[8], (CC_SHA1_CTX *)&buf[8]);
          break;
        case 0x10A0:
          CC_SHA256_Final(&v166[8], (CC_SHA256_CTX *)&buf[8]);
          break;
        case 0x11A0:
          CC_SHA512_Final(&v166[8], (CC_SHA512_CTX *)&buf[8]);
          break;
      }
    }
    goto LABEL_65;
  }
  if (*(uint64_t *)buf > 1999)
  {
    if (*(void *)buf != 2000)
    {
      if (*(void *)buf != 3000) {
        goto LABEL_65;
      }
      v52 = (int *)&v154;
      if (*(_DWORD *)&buf[12]) {
        int v53 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A312BAA0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A312BA90)));
      }
      else {
        int v53 = *(_DWORD *)&buf[24] + 374761393;
      }
      unsigned int v57 = *(_DWORD *)&buf[8] + v53;
      unint64_t v58 = v155 & 0xF;
      if (v58 >= 4)
      {
        do
        {
          int v59 = *v52++;
          HIDWORD(v60) = v57 - 1028477379 * v59;
          LODWORD(v60) = HIDWORD(v60);
          unsigned int v57 = 668265263 * (v60 >> 15);
          v58 -= 4;
        }
        while (v58 > 3);
      }
      for (; v58; --v58)
      {
        int v61 = *(unsigned __int8 *)v52;
        v52 = (int *)((char *)v52 + 1);
        HIDWORD(v62) = v57 + 374761393 * v61;
        LODWORD(v62) = HIDWORD(v62);
        unsigned int v57 = -1640531535 * (v62 >> 21);
      }
      unsigned int v63 = -1028477379 * ((-2048144777 * (v57 ^ (v57 >> 15))) ^ ((-2048144777 * (v57 ^ (v57 >> 15))) >> 13));
      unsigned int v64 = v63 ^ HIWORD(v63);
      goto LABEL_64;
    }
    switch(buf[19])
    {
      case 1:
        int v56 = buf[16];
        break;
      case 2:
        int v56 = *(unsigned __int16 *)&buf[16];
        break;
      case 3:
        int v56 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
        break;
      default:
        unsigned int v65 = *(_DWORD *)&buf[8];
        goto LABEL_63;
    }
    unsigned int v65 = (461845907 * ((380141568 * v56) | ((-862048943 * v56) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_63:
    unsigned int v66 = -2048144789 * (v65 ^ *(_DWORD *)&buf[12] ^ ((v65 ^ *(_DWORD *)&buf[12]) >> 16));
    unsigned int v64 = (-1028477387 * (v66 ^ (v66 >> 13))) ^ ((-1028477387 * (v66 ^ (v66 >> 13))) >> 16);
    *(_DWORD *)&buf[8] = v64;
LABEL_64:
    *(_DWORD *)&v166[8] = v64;
    goto LABEL_65;
  }
  if (*(void *)buf)
  {
    if (*(void *)buf == 1000)
    {
      uint64_t v22 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
      uint64_t v23 = *(void *)&buf[24] + (v154 ^ *((void *)&v154 + 1));
      uint64_t v24 = __ROR8__(v154 ^ *((void *)&v154 + 1), 48);
      uint64_t v25 = (v23 ^ v24) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
      uint64_t v26 = v25 ^ __ROR8__(v23 ^ v24, 43);
      uint64_t v27 = v23 + v22;
      uint64_t v28 = v27 ^ __ROR8__(v22, 47);
      uint64_t v29 = (v25 ^ *((void *)&v154 + 1)) + v28;
      uint64_t v30 = v29 ^ __ROR8__(v28, 51);
      uint64_t v31 = (__ROR8__(v27, 32) ^ 0xFFLL) + v26;
      uint64_t v32 = __ROR8__(v26, 48);
      uint64_t v33 = __ROR8__(v29, 32) + (v31 ^ v32);
      uint64_t v34 = v33 ^ __ROR8__(v31 ^ v32, 43);
      uint64_t v35 = v30 + v31;
      uint64_t v36 = v35 ^ __ROR8__(v30, 47);
      uint64_t v37 = v36 + v33;
      uint64_t v38 = v37 ^ __ROR8__(v36, 51);
      uint64_t v39 = __ROR8__(v35, 32) + v34;
      uint64_t v40 = __ROR8__(v34, 48);
      uint64_t v41 = __ROR8__(v37, 32) + (v39 ^ v40);
      uint64_t v42 = v41 ^ __ROR8__(v39 ^ v40, 43);
      uint64_t v43 = v38 + v39;
      uint64_t v44 = v43 ^ __ROR8__(v38, 47);
      uint64_t v45 = v44 + v41;
      uint64_t v46 = v45 ^ __ROR8__(v44, 51);
      uint64_t v47 = __ROR8__(v43, 32) + v42;
      uint64_t v48 = __ROR8__(v42, 48);
      uint64_t v49 = __ROR8__(v45, 32) + (v47 ^ v48);
      uint64_t v50 = v49 ^ __ROR8__(v47 ^ v48, 43);
      uint64_t v51 = v46 + v47;
      *(void *)&buf[8] = v49;
      *(void *)&buf[16] = v51 ^ __ROR8__(v46, 47);
      *(void *)&buf[24] = __ROR8__(v51, 32);
      *(void *)&long long v154 = v50;
      *(void *)&v166[8] = *(void *)&buf[16] ^ v49 ^ *(void *)&buf[24] ^ v50;
    }
  }
  else
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    v55 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
    [v54 handleFailureInFunction:v55 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
  }
LABEL_65:
  *(_OWORD *)v167 = *(_OWORD *)v166;
  long long v168 = *(_OWORD *)&v166[16];
  long long v169 = *(_OWORD *)&v166[32];
  long long v170 = *(_OWORD *)&v166[48];
  uint64_t v171 = *(void *)&v166[64];
  if (*(uint64_t *)v166 > 3999)
  {
    if (*(uint64_t *)v166 > 4255)
    {
      if (*(void *)v166 == 4256)
      {
        v108 = &v167[8];
        v109 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v110 = v109;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v112 = *v108++;
          v113 = &v109[i];
          char *v113 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v112 >> 4];
          v113[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v112 & 0xF];
        }
        id v79 = [NSString alloc];
        v80 = v110;
        uint64_t v81 = 64;
      }
      else
      {
        if (*(void *)v166 != 4512) {
          goto LABEL_128;
        }
        v86 = &v167[8];
        v87 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v88 = v87;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v90 = *v86++;
          v91 = &v87[j];
          char *v91 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v90 >> 4];
          v91[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v90 & 0xF];
        }
        id v79 = [NSString alloc];
        v80 = v88;
        uint64_t v81 = 128;
      }
    }
    else if (*(void *)v166 == 4000)
    {
      v98 = &v167[8];
      v99 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v100 = v99;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v102 = *v98++;
        v103 = &v99[k];
        char *v103 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v102 >> 4];
        v103[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v102 & 0xF];
      }
      id v79 = [NSString alloc];
      v80 = v100;
      uint64_t v81 = 32;
    }
    else
    {
      if (*(void *)v166 != 4001) {
        goto LABEL_128;
      }
      v73 = &v167[8];
      v74 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v75 = v74;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v77 = *v73++;
        v78 = &v74[m];
        char *v78 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v77 >> 4];
        v78[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v77 & 0xF];
      }
      id v79 = [NSString alloc];
      v80 = v75;
      uint64_t v81 = 40;
    }
LABEL_109:
    CFStringRef v97 = (CFStringRef)objc_msgSend(v79, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v80, v81, 4, 1, v148);
    goto LABEL_110;
  }
  if (*(uint64_t *)v166 > 2999)
  {
    if (*(void *)v166 == 3000)
    {
      LODWORD(v172[0]) = bswap32(*(unsigned int *)&v167[8]);
      v104 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v105 = 0;
      v106 = v104 + 1;
      do
      {
        unint64_t v107 = *((unsigned __int8 *)v172 + v105);
        *(v106 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v107 >> 4];
        unsigned char *v106 = MSVFastHexStringFromBytes_hexCharacters_3705[v107 & 0xF];
        v106 += 2;
        ++v105;
      }
      while (v105 != 4);
      id v79 = [NSString alloc];
      v80 = v104;
      uint64_t v81 = 8;
    }
    else
    {
      if (*(void *)v166 != 3001) {
        goto LABEL_128;
      }
      v172[0] = bswap64(*(unint64_t *)&v167[8]);
      v82 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v83 = 0;
      v84 = v82 + 1;
      do
      {
        unint64_t v85 = *((unsigned __int8 *)v172 + v83);
        *(v84 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v85 >> 4];
        unsigned char *v84 = MSVFastHexStringFromBytes_hexCharacters_3705[v85 & 0xF];
        v84 += 2;
        ++v83;
      }
      while (v83 != 8);
      id v79 = [NSString alloc];
      v80 = v82;
      uint64_t v81 = 16;
    }
    goto LABEL_109;
  }
  if (*(void *)v166 == 1000)
  {
    uint64_t v92 = *(void *)&v167[8];
    v93 = (char *)v173 + 1;
    uint64_t quot = *(void *)&v167[8];
    do
    {
      lldiv_t v95 = lldiv(quot, 10);
      uint64_t quot = v95.quot;
      if (v95.rem >= 0) {
        LOBYTE(v96) = v95.rem;
      }
      else {
        uint64_t v96 = -v95.rem;
      }
      *(v93 - 2) = v96 + 48;
      v72 = (const UInt8 *)(v93 - 2);
      --v93;
    }
    while (v95.quot);
    if (v92 < 0)
    {
      *(v93 - 2) = 45;
      v72 = (const UInt8 *)(v93 - 2);
    }
    v71 = (char *)((char *)v173 - (char *)v72);
    goto LABEL_99;
  }
  if (*(void *)v166 == 2000)
  {
    uint64_t v67 = *(unsigned int *)&v167[8];
    v68 = v173;
    do
    {
      ldiv_t v69 = ldiv(v67, 10);
      uint64_t v67 = v69.quot;
      if (v69.rem >= 0) {
        LOBYTE(v70) = v69.rem;
      }
      else {
        uint64_t v70 = -v69.rem;
      }
      *((unsigned char *)v68 - 1) = v70 + 48;
      v68 = (void *)((char *)v68 - 1);
    }
    while (v69.quot);
    v71 = (char *)((char *)v173 - (char *)v68);
    v72 = (const UInt8 *)v68;
LABEL_99:
    CFStringRef v97 = CFStringCreateWithBytes(0, v72, (CFIndex)v71, 0x8000100u, 0);
LABEL_110:
    v114 = (__CFString *)v97;
    goto LABEL_111;
  }
LABEL_128:
  v131 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v148);
  v132 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
  [v131 handleFailureInFunction:v132 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

  v114 = &stru_1EF642BA8;
LABEL_111:

  v115 = os_log_create("com.apple.amp.MediaServices", "SQL");
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v114;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v9;
    _os_log_impl(&dword_1A30CD000, v115, OS_LOG_TYPE_DEFAULT, "[SQL:%{public}@:%p] initWithConnection:… name:%{public}@… | taking process assertion [database transaction]", buf, 0x20u);
  }

  id v116 = v9;
  if (+[MSVSonicAssertion hasEntitlement])
  {
    v117 = [[MSVSonicAssertion alloc] initWithName:v116];
    goto LABEL_133;
  }
  v118 = [_MSVSQLProcessAssertion alloc];
  id v119 = v116;
  if (!v118)
  {
    v117 = 0;
    goto LABEL_132;
  }
  *(void *)buf = v118;
  *(void *)&buf[8] = _MSVSQLProcessAssertion;
  v117 = (MSVSonicAssertion *)objc_msgSendSuper2((objc_super *)buf, sel_init);
  if (v117)
  {
    uint64_t v120 = [v119 copy];
    name = v117->_name;
    v117->_name = (NSString *)v120;

    os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock);
    v122 = (MSVSonicAssertion *)(id)__assertion;
    v123 = v122;
    if (v122
      && [(MSVSonicAssertion *)v122 valid]
      && (BKSProcessAssertionBackgroundTimeRemaining(), v124 >= 5.0))
    {
      ++__assertionCount;
    }
    else
    {
      v125 = os_log_create("com.apple.amp.MediaServices", "SQL");
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v167 = 0;
        _os_log_impl(&dword_1A30CD000, v125, OS_LOG_TYPE_DEFAULT, "[SQL] Taking Process Assertion", v167, 2u);
      }

      uint64_t v126 = [objc_alloc(MEMORY[0x1E4F4E280]) initWithPID:getpid() flags:1 reason:4 name:@"MSVSQLDatabase"];
      v127 = (void *)__assertion;
      __assertion = v126;

      char v128 = [(id)__assertion acquire];
      if (v123)
      {
        v129 = os_log_create("com.apple.amp.MediaServices", "SQL");
        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v167 = 0;
          _os_log_impl(&dword_1A30CD000, v129, OS_LOG_TYPE_DEFAULT, "[SQL] Invalidating Existing Process Assertion", v167, 2u);
        }

        [(MSVSonicAssertion *)v123 invalidate];
      }
      ++__assertionCount;
      if ((v128 & 1) == 0)
      {
        __assertionCount = 0;
        v130 = (void *)__assertion;
        __assertion = 0;

        os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock);
        v123 = v117;
        v117 = 0;
LABEL_131:

        id v9 = v149;
        goto LABEL_132;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock);
    goto LABEL_131;
  }
LABEL_132:

LABEL_133:
  length = (void *)a1->length;
  a1->length = (uint64_t)v117;

  uint64_t v134 = a1->length;
  v135 = os_log_create("com.apple.amp.MediaServices", "SQL");
  v136 = v135;
  if (v134)
  {
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v137 = a1->length;
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v114;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v116;
      LOWORD(v154) = 2114;
      *(void *)((char *)&v154 + 2) = v137;
      v138 = "[SQL:%{public}@:%p] initWithConnection:… name:%{public}@… | acquired process assertion [database transactio"
             "n] assertion=%{public}@";
      v139 = v136;
      os_log_type_t v140 = OS_LOG_TYPE_DEFAULT;
      uint32_t v141 = 42;
LABEL_138:
      _os_log_impl(&dword_1A30CD000, v139, v140, v138, buf, v141);
    }
  }
  else if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v114;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v116;
    v138 = "[SQL:%{public}@:%p] initWithConnection:… name:%{public}@… | failed to acquire process assertion [database transaction]";
    v139 = v136;
    os_log_type_t v140 = OS_LOG_TYPE_ERROR;
    uint32_t v141 = 32;
    goto LABEL_138;
  }

  uint64_t v142 = [v116 copy];
  isa = a1[1].isa;
  a1[1].isa = (void *)v142;

  id v151 = 0;
  v144 = [(__CFString *)a1 statementWithString:@"BEGIN TRANSACTION" error:&v151];
  id v145 = v151;
  id v150 = v145;
  [(__CFString *)a1 executeStatement:v144 error:&v150];
  id v146 = v150;

  if (v146)
  {
    if (v148) {
      void *v148 = v146;
    }

    v144 = v114;
    v114 = a1;
    a1 = 0;
  }

LABEL_144:
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  if (!self->_invalid) {
    [(MSVSQLDatabaseTransaction *)self rollback];
  }
  v3.receiver = self;
  v3.super_class = (Class)MSVSQLDatabaseTransaction;
  [(MSVSQLDatabaseTransaction *)&v3 dealloc];
}

- (BOOL)commit
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  if (self->_invalid)
  {
    id v119 = [MEMORY[0x1E4F28B00] currentHandler];
    [v119 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:639 description:@"Attempt to use invalidated transaction."];
  }
  objc_super v3 = [(MSVSQLDatabaseTransaction *)self statementWithString:@"COMMIT TRANSACTION" error:0];
  id v120 = 0;
  [(MSVSQLDatabaseTransaction *)self executeStatement:v3 error:&v120];
  id v4 = v120;
  [v3 invalidate];
  if (!v4)
  {
    self->_invalid = 1;
    connection = self->_connection;
    if (connection && !connection->_invalid)
    {
      connection->_invalid = 1;
      sqlite3_close(connection->_connectionHandle);
      connection->_connectionHandle = 0;
    }
    if (self->_assertion)
    {
      unint64_t v6 = MSVHasherSharedSeed();
      id v7 = self->_connection;
      if (v7) {
        id v7 = (_MSVSQLConnection *)v7->_databaseURI;
      }
      BOOL v8 = v7;
      long long v134 = 0u;
      long long v133 = 0u;
      long long v132 = 0u;
      long long v131 = 0u;
      long long v130 = 0u;
      long long v129 = 0u;
      long long v128 = 0u;
      long long v127 = 0u;
      *(_OWORD *)buf = xmmword_1A312BAB0;
      *(int64x2_t *)&buf[16] = vaddq_s64(vdupq_n_s64(v6), (int64x2_t)xmmword_1A312BAC0);
      unint64_t v122 = v6;
      unint64_t v123 = v6 + 0x61C8864E7A143579;
      long long v124 = 0u;
      long long v125 = 0u;
      uint64_t v126 = 0;
      id v9 = v8;
      v10 = (unsigned char *)[(_MSVSQLConnection *)v9 UTF8String];
      uint64_t v11 = [(_MSVSQLConnection *)v9 length];
      int v12 = v11;
      if (*(uint64_t *)buf > 3999)
      {
        if (*(uint64_t *)buf > 4255)
        {
          if (*(void *)buf == 4256)
          {
            CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v10, v11);
          }
          else if (*(void *)buf == 4512)
          {
            CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v10, v11);
          }
        }
        else if (*(void *)buf == 4000)
        {
          CC_MD5_Update((CC_MD5_CTX *)&buf[8], v10, v11);
        }
        else if (*(void *)buf == 4001)
        {
          CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v10, v11);
        }
      }
      else if (*(uint64_t *)buf > 2999)
      {
        if (*(void *)buf == 3000)
        {
          _MSV_XXH_XXH32_update(&buf[8], v10, v11);
        }
        else if (*(void *)buf == 3001)
        {
          _MSV_XXH_XXH64_update(&buf[8], v10, v11);
        }
      }
      else if (*(void *)buf)
      {
        if (*(void *)buf == 2000)
        {
          int v13 = (((v11 + buf[19]) & 3) - buf[19]);
          v14 = &buf[buf[19] + 16];
          switch(v13)
          {
            case 0:
              break;
            case 1:
              unsigned char *v14 = *v10;
              break;
            case 2:
              __int16 v17 = *(_WORD *)v10;
              goto LABEL_33;
            case 3:
              __int16 v17 = *(_WORD *)v10;
              v14[2] = v10[2];
LABEL_33:
              *(_WORD *)v14 = v17;
              break;
            default:
              memcpy(v14, v10, (((v12 + buf[19]) & 3) - buf[19]));
              break;
          }
          *(_DWORD *)&buf[12] += v12;
        }
      }
      else
      {
        uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
        int v16 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
        [v15 handleFailureInFunction:v16 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
      }
      memset(&v135[8], 0, 64);
      *(void *)v135 = *(void *)buf;
      if (*(uint64_t *)buf > 3000)
      {
        if (*(uint64_t *)buf <= 4000)
        {
          if (*(void *)buf == 3001)
          {
            *(void *)&v135[8] = _MSV_XXH_XXH64_digest(&buf[8]);
          }
          else if (*(void *)buf == 4000)
          {
            CC_MD5_Final(&v135[8], (CC_MD5_CTX *)&buf[8]);
          }
        }
        else
        {
          switch(*(void *)buf)
          {
            case 0xFA1:
              CC_SHA1_Final(&v135[8], (CC_SHA1_CTX *)&buf[8]);
              break;
            case 0x10A0:
              CC_SHA256_Final(&v135[8], (CC_SHA256_CTX *)&buf[8]);
              break;
            case 0x11A0:
              CC_SHA512_Final(&v135[8], (CC_SHA512_CTX *)&buf[8]);
              break;
          }
        }
        goto LABEL_72;
      }
      if (*(uint64_t *)buf <= 1999)
      {
        if (*(void *)buf)
        {
          if (*(void *)buf == 1000)
          {
            uint64_t v18 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
            unint64_t v19 = *(void *)&buf[24] + (v122 ^ v123);
            uint64_t v20 = __ROR8__(v122 ^ v123, 48);
            unint64_t v21 = (v19 ^ v20) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
            uint64_t v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
            uint64_t v23 = v19 + v18;
            uint64_t v24 = v23 ^ __ROR8__(v18, 47);
            unint64_t v25 = (v21 ^ v123) + v24;
            uint64_t v26 = v25 ^ __ROR8__(v24, 51);
            uint64_t v27 = (__ROR8__(v23, 32) ^ 0xFFLL) + v22;
            uint64_t v28 = __ROR8__(v22, 48);
            uint64_t v29 = __ROR8__(v25, 32) + (v27 ^ v28);
            uint64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
            uint64_t v31 = v26 + v27;
            uint64_t v32 = v31 ^ __ROR8__(v26, 47);
            uint64_t v33 = v32 + v29;
            uint64_t v34 = v33 ^ __ROR8__(v32, 51);
            uint64_t v35 = __ROR8__(v31, 32) + v30;
            uint64_t v36 = __ROR8__(v30, 48);
            uint64_t v37 = __ROR8__(v33, 32) + (v35 ^ v36);
            uint64_t v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
            uint64_t v39 = v34 + v35;
            uint64_t v40 = v39 ^ __ROR8__(v34, 47);
            uint64_t v41 = v40 + v37;
            uint64_t v42 = v41 ^ __ROR8__(v40, 51);
            uint64_t v43 = __ROR8__(v39, 32) + v38;
            uint64_t v44 = __ROR8__(v38, 48);
            uint64_t v45 = __ROR8__(v41, 32) + (v43 ^ v44);
            unint64_t v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
            uint64_t v47 = v42 + v43;
            *(void *)&buf[8] = v45;
            *(void *)&buf[16] = v47 ^ __ROR8__(v42, 47);
            *(void *)&buf[24] = __ROR8__(v47, 32);
            unint64_t v122 = v46;
            *(void *)&v135[8] = *(void *)&buf[16] ^ v45 ^ *(void *)&buf[24] ^ v46;
          }
        }
        else
        {
          uint64_t v50 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v51 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
          [v50 handleFailureInFunction:v51 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
        }
LABEL_72:
        v136[0] = *(_OWORD *)v135;
        v136[1] = *(_OWORD *)&v135[16];
        v136[2] = *(_OWORD *)&v135[32];
        v136[3] = *(_OWORD *)&v135[48];
        uint64_t v137 = *(void *)&v135[64];
        if (*(uint64_t *)v135 > 3999)
        {
          if (*(uint64_t *)v135 > 4255)
          {
            if (*(void *)v135 == 4256)
            {
              v104 = (unsigned __int8 *)v136 + 8;
              uint64_t v105 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v106 = v105;
              for (uint64_t i = 0; i != 64; i += 2)
              {
                unsigned int v108 = *v104++;
                v109 = &v105[i];
                char *v109 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v108 >> 4];
                v109[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v108 & 0xF];
              }
              id v75 = [NSString alloc];
              v76 = v106;
              uint64_t v77 = 64;
            }
            else
            {
              if (*(void *)v135 != 4512) {
                goto LABEL_122;
              }
              v82 = (unsigned __int8 *)v136 + 8;
              uint64_t v83 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v84 = v83;
              for (uint64_t j = 0; j != 128; j += 2)
              {
                unsigned int v86 = *v82++;
                v87 = &v83[j];
                char *v87 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v86 >> 4];
                v87[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v86 & 0xF];
              }
              id v75 = [NSString alloc];
              v76 = v84;
              uint64_t v77 = 128;
            }
          }
          else if (*(void *)v135 == 4000)
          {
            v94 = (unsigned __int8 *)v136 + 8;
            lldiv_t v95 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v96 = v95;
            for (uint64_t k = 0; k != 32; k += 2)
            {
              unsigned int v98 = *v94++;
              v99 = &v95[k];
              char *v99 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v98 >> 4];
              v99[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v98 & 0xF];
            }
            id v75 = [NSString alloc];
            v76 = v96;
            uint64_t v77 = 32;
          }
          else
          {
            if (*(void *)v135 != 4001) {
              goto LABEL_122;
            }
            ldiv_t v69 = (unsigned __int8 *)v136 + 8;
            uint64_t v70 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v71 = v70;
            for (uint64_t m = 0; m != 40; m += 2)
            {
              unsigned int v73 = *v69++;
              v74 = &v70[m];
              char *v74 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v73 >> 4];
              v74[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v73 & 0xF];
            }
            id v75 = [NSString alloc];
            v76 = v71;
            uint64_t v77 = 40;
          }
        }
        else
        {
          if (*(uint64_t *)v135 <= 2999)
          {
            if (*(void *)v135 == 1000)
            {
              uint64_t v88 = *((void *)&v136[0] + 1);
              v89 = (char *)&v139 + 1;
              uint64_t quot = *((void *)&v136[0] + 1);
              do
              {
                lldiv_t v91 = lldiv(quot, 10);
                uint64_t quot = v91.quot;
                if (v91.rem >= 0) {
                  LOBYTE(v92) = v91.rem;
                }
                else {
                  uint64_t v92 = -v91.rem;
                }
                *(v89 - 2) = v92 + 48;
                v68 = (const UInt8 *)(v89 - 2);
                --v89;
              }
              while (v91.quot);
              if (v88 < 0)
              {
                *(v89 - 2) = 45;
                v68 = (const UInt8 *)(v89 - 2);
              }
              uint64_t v67 = (char *)((char *)&v139 - (char *)v68);
              goto LABEL_106;
            }
            if (*(void *)v135 == 2000)
            {
              uint64_t v63 = DWORD2(v136[0]);
              unsigned int v64 = &v139;
              do
              {
                ldiv_t v65 = ldiv(v63, 10);
                uint64_t v63 = v65.quot;
                if (v65.rem >= 0) {
                  LOBYTE(v66) = v65.rem;
                }
                else {
                  uint64_t v66 = -v65.rem;
                }
                *((unsigned char *)v64 - 1) = v66 + 48;
                unsigned int v64 = (uint64_t *)((char *)v64 - 1);
              }
              while (v65.quot);
              uint64_t v67 = (char *)((char *)&v139 - (char *)v64);
              v68 = (const UInt8 *)v64;
LABEL_106:
              CFStringRef v93 = CFStringCreateWithBytes(0, v68, (CFIndex)v67, 0x8000100u, 0);
LABEL_117:
              v110 = (__CFString *)v93;
LABEL_118:

              v111 = os_log_create("com.apple.amp.MediaServices", "SQL");
              if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v112 = self->_connection;
                assertion = self->_assertion;
                *(_DWORD *)buf = 138543874;
                *(void *)&buf[4] = v110;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v112;
                *(_WORD *)&buf[22] = 2114;
                *(void *)&buf[24] = assertion;
                _os_log_impl(&dword_1A30CD000, v111, OS_LOG_TYPE_DEFAULT, "[SQL:%{public}@:%p] commit | invalidating process assertion [database transaction] assertion=%{public}@", buf, 0x20u);
              }

              [(_MSVSQLAssertion *)self->_assertion invalidate];
              v114 = self->_assertion;
              self->_assertion = 0;

              goto LABEL_121;
            }
LABEL_122:
            id v116 = [MEMORY[0x1E4F28B00] currentHandler];
            v117 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
            [v116 handleFailureInFunction:v117 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

            v110 = &stru_1EF642BA8;
            goto LABEL_118;
          }
          if (*(void *)v135 == 3000)
          {
            LODWORD(v138[0]) = bswap32(DWORD2(v136[0]));
            v100 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v101 = 0;
            unsigned int v102 = v100 + 1;
            do
            {
              unint64_t v103 = *((unsigned __int8 *)v138 + v101);
              *(v102 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v103 >> 4];
              *unsigned int v102 = MSVFastHexStringFromBytes_hexCharacters_3705[v103 & 0xF];
              v102 += 2;
              ++v101;
            }
            while (v101 != 4);
            id v75 = [NSString alloc];
            v76 = v100;
            uint64_t v77 = 8;
          }
          else
          {
            if (*(void *)v135 != 3001) {
              goto LABEL_122;
            }
            v138[0] = bswap64(*((unint64_t *)&v136[0] + 1));
            v78 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v79 = 0;
            v80 = v78 + 1;
            do
            {
              unint64_t v81 = *((unsigned __int8 *)v138 + v79);
              *(v80 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v81 >> 4];
              unsigned char *v80 = MSVFastHexStringFromBytes_hexCharacters_3705[v81 & 0xF];
              v80 += 2;
              ++v79;
            }
            while (v79 != 8);
            id v75 = [NSString alloc];
            v76 = v78;
            uint64_t v77 = 16;
          }
        }
        CFStringRef v93 = (CFStringRef)[v75 initWithBytesNoCopy:v76 length:v77 encoding:4 freeWhenDone:1];
        goto LABEL_117;
      }
      if (*(void *)buf != 2000)
      {
        if (*(void *)buf != 3000) {
          goto LABEL_72;
        }
        uint64_t v48 = &v122;
        if (*(_DWORD *)&buf[12]) {
          int v49 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A312BAA0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A312BA90)));
        }
        else {
          int v49 = *(_DWORD *)&buf[24] + 374761393;
        }
        unsigned int v53 = *(_DWORD *)&buf[8] + v49;
        unint64_t v54 = v124 & 0xF;
        if (v54 >= 4)
        {
          do
          {
            int v55 = *(_DWORD *)v48;
            uint64_t v48 = (unint64_t *)((char *)v48 + 4);
            HIDWORD(v56) = v53 - 1028477379 * v55;
            LODWORD(v56) = HIDWORD(v56);
            unsigned int v53 = 668265263 * (v56 >> 15);
            v54 -= 4;
          }
          while (v54 > 3);
        }
        for (; v54; --v54)
        {
          int v57 = *(unsigned __int8 *)v48;
          uint64_t v48 = (unint64_t *)((char *)v48 + 1);
          HIDWORD(v58) = v53 + 374761393 * v57;
          LODWORD(v58) = HIDWORD(v58);
          unsigned int v53 = -1640531535 * (v58 >> 21);
        }
        unsigned int v59 = -1028477379 * ((-2048144777 * (v53 ^ (v53 >> 15))) ^ ((-2048144777 * (v53 ^ (v53 >> 15))) >> 13));
        unsigned int v60 = v59 ^ HIWORD(v59);
        goto LABEL_71;
      }
      switch(buf[19])
      {
        case 1:
          int v52 = buf[16];
          break;
        case 2:
          int v52 = *(unsigned __int16 *)&buf[16];
          break;
        case 3:
          int v52 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
          break;
        default:
          unsigned int v61 = *(_DWORD *)&buf[8];
          goto LABEL_70;
      }
      unsigned int v61 = (461845907 * ((380141568 * v52) | ((-862048943 * v52) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_70:
      unsigned int v62 = -2048144789 * (v61 ^ *(_DWORD *)&buf[12] ^ ((v61 ^ *(_DWORD *)&buf[12]) >> 16));
      unsigned int v60 = (-1028477387 * (v62 ^ (v62 >> 13))) ^ ((-1028477387 * (v62 ^ (v62 >> 13))) >> 16);
      *(_DWORD *)&buf[8] = v60;
LABEL_71:
      *(_DWORD *)&v135[8] = v60;
      goto LABEL_72;
    }
  }
LABEL_121:

  return v4 == 0;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)_releaseSavepoint:(id)a3
{
  id v4 = a3;
  id v5 = [(MSVSQLDatabaseTransaction *)self statementWithString:@"RELEASE SAVEPOINT @name" error:0];
  unint64_t v6 = [v4 name];

  [v5 bindStringValue:v6 toParameterNamed:@"@name"];
  uint64_t v8 = 0;
  [(MSVSQLDatabaseTransaction *)self executeStatement:v5 error:&v8];
  LOBYTE(self) = v8 == 0;

  return (char)self;
}

- (BOOL)rollbackToSavepoint:(id)a3
{
  id v5 = a3;
  if (self->_invalid)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:697 description:@"Attempt to use invalidated transaction."];
  }
  unint64_t v6 = [(MSVSQLDatabaseTransaction *)self statementWithString:@"ROLLBACK TRANSACTION TO SAVEPOINT @name" error:0];
  id v7 = [v5 name];
  [v6 bindStringValue:v7 toParameterNamed:@"@name"];

  uint64_t v11 = 0;
  [(MSVSQLDatabaseTransaction *)self executeStatement:v6 error:&v11];
  BOOL v8 = v11 == 0;

  return v8;
}

- (id)createSavepoint
{
  if (self->_invalid)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:685 description:@"Attempt to use invalidated transaction."];
  }
  objc_super v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];

  id v5 = [(MSVSQLDatabaseTransaction *)self statementWithString:@"SAVEPOINT @name" error:0];
  [v5 bindStringValue:v4 toParameterNamed:@"@name"];
  [(MSVSQLDatabaseTransaction *)self executeStatement:v5 error:0];
  unint64_t v6 = [_MSVSQLDatabaseTransactionSavepoint alloc];
  id v7 = self;
  id v8 = v4;
  if (v6)
  {
    v15.receiver = v6;
    v15.super_class = (Class)_MSVSQLDatabaseTransactionSavepoint;
    id v9 = [(MSVSQLDatabaseTransaction *)&v15 init];
    unint64_t v6 = (_MSVSQLDatabaseTransactionSavepoint *)v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_connection, self);
      uint64_t v10 = [v8 copy];
      name = v6->_name;
      v6->_name = (NSString *)v10;
    }
  }

  return v6;
}

- (BOOL)rollback
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  if (self->_invalid)
  {
    id v119 = [MEMORY[0x1E4F28B00] currentHandler];
    [v119 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:662 description:@"Attempt to use invalidated transaction."];
  }
  objc_super v3 = [(MSVSQLDatabaseTransaction *)self statementWithString:@"ROLLBACK TRANSACTION" error:0];
  id v120 = 0;
  [(MSVSQLDatabaseTransaction *)self executeStatement:v3 error:&v120];
  id v4 = v120;
  [v3 invalidate];
  if (!v4)
  {
    self->_invalid = 1;
    connection = self->_connection;
    if (connection && !connection->_invalid)
    {
      connection->_invalid = 1;
      sqlite3_close(connection->_connectionHandle);
      connection->_connectionHandle = 0;
    }
    if (self->_assertion)
    {
      unint64_t v6 = MSVHasherSharedSeed();
      id v7 = self->_connection;
      if (v7) {
        id v7 = (_MSVSQLConnection *)v7->_databaseURI;
      }
      id v8 = v7;
      long long v134 = 0u;
      long long v133 = 0u;
      long long v132 = 0u;
      long long v131 = 0u;
      long long v130 = 0u;
      long long v129 = 0u;
      long long v128 = 0u;
      long long v127 = 0u;
      *(_OWORD *)buf = xmmword_1A312BAB0;
      *(int64x2_t *)&buf[16] = vaddq_s64(vdupq_n_s64(v6), (int64x2_t)xmmword_1A312BAC0);
      unint64_t v122 = v6;
      unint64_t v123 = v6 + 0x61C8864E7A143579;
      long long v124 = 0u;
      long long v125 = 0u;
      uint64_t v126 = 0;
      id v9 = v8;
      uint64_t v10 = (unsigned char *)[(_MSVSQLConnection *)v9 UTF8String];
      uint64_t v11 = [(_MSVSQLConnection *)v9 length];
      int v12 = v11;
      if (*(uint64_t *)buf > 3999)
      {
        if (*(uint64_t *)buf > 4255)
        {
          if (*(void *)buf == 4256)
          {
            CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v10, v11);
          }
          else if (*(void *)buf == 4512)
          {
            CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v10, v11);
          }
        }
        else if (*(void *)buf == 4000)
        {
          CC_MD5_Update((CC_MD5_CTX *)&buf[8], v10, v11);
        }
        else if (*(void *)buf == 4001)
        {
          CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v10, v11);
        }
      }
      else if (*(uint64_t *)buf > 2999)
      {
        if (*(void *)buf == 3000)
        {
          _MSV_XXH_XXH32_update(&buf[8], v10, v11);
        }
        else if (*(void *)buf == 3001)
        {
          _MSV_XXH_XXH64_update(&buf[8], v10, v11);
        }
      }
      else if (*(void *)buf)
      {
        if (*(void *)buf == 2000)
        {
          int v13 = (((v11 + buf[19]) & 3) - buf[19]);
          v14 = &buf[buf[19] + 16];
          switch(v13)
          {
            case 0:
              break;
            case 1:
              unsigned char *v14 = *v10;
              break;
            case 2:
              __int16 v17 = *(_WORD *)v10;
              goto LABEL_33;
            case 3:
              __int16 v17 = *(_WORD *)v10;
              v14[2] = v10[2];
LABEL_33:
              *(_WORD *)v14 = v17;
              break;
            default:
              memcpy(v14, v10, (((v12 + buf[19]) & 3) - buf[19]));
              break;
          }
          *(_DWORD *)&buf[12] += v12;
        }
      }
      else
      {
        objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
        int v16 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
        [v15 handleFailureInFunction:v16 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
      }
      memset(&v135[8], 0, 64);
      *(void *)v135 = *(void *)buf;
      if (*(uint64_t *)buf > 3000)
      {
        if (*(uint64_t *)buf <= 4000)
        {
          if (*(void *)buf == 3001)
          {
            *(void *)&v135[8] = _MSV_XXH_XXH64_digest(&buf[8]);
          }
          else if (*(void *)buf == 4000)
          {
            CC_MD5_Final(&v135[8], (CC_MD5_CTX *)&buf[8]);
          }
        }
        else
        {
          switch(*(void *)buf)
          {
            case 0xFA1:
              CC_SHA1_Final(&v135[8], (CC_SHA1_CTX *)&buf[8]);
              break;
            case 0x10A0:
              CC_SHA256_Final(&v135[8], (CC_SHA256_CTX *)&buf[8]);
              break;
            case 0x11A0:
              CC_SHA512_Final(&v135[8], (CC_SHA512_CTX *)&buf[8]);
              break;
          }
        }
        goto LABEL_72;
      }
      if (*(uint64_t *)buf <= 1999)
      {
        if (*(void *)buf)
        {
          if (*(void *)buf == 1000)
          {
            uint64_t v18 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
            unint64_t v19 = *(void *)&buf[24] + (v122 ^ v123);
            uint64_t v20 = __ROR8__(v122 ^ v123, 48);
            unint64_t v21 = (v19 ^ v20) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
            uint64_t v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
            uint64_t v23 = v19 + v18;
            uint64_t v24 = v23 ^ __ROR8__(v18, 47);
            unint64_t v25 = (v21 ^ v123) + v24;
            uint64_t v26 = v25 ^ __ROR8__(v24, 51);
            uint64_t v27 = (__ROR8__(v23, 32) ^ 0xFFLL) + v22;
            uint64_t v28 = __ROR8__(v22, 48);
            uint64_t v29 = __ROR8__(v25, 32) + (v27 ^ v28);
            uint64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
            uint64_t v31 = v26 + v27;
            uint64_t v32 = v31 ^ __ROR8__(v26, 47);
            uint64_t v33 = v32 + v29;
            uint64_t v34 = v33 ^ __ROR8__(v32, 51);
            uint64_t v35 = __ROR8__(v31, 32) + v30;
            uint64_t v36 = __ROR8__(v30, 48);
            uint64_t v37 = __ROR8__(v33, 32) + (v35 ^ v36);
            uint64_t v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
            uint64_t v39 = v34 + v35;
            uint64_t v40 = v39 ^ __ROR8__(v34, 47);
            uint64_t v41 = v40 + v37;
            uint64_t v42 = v41 ^ __ROR8__(v40, 51);
            uint64_t v43 = __ROR8__(v39, 32) + v38;
            uint64_t v44 = __ROR8__(v38, 48);
            uint64_t v45 = __ROR8__(v41, 32) + (v43 ^ v44);
            unint64_t v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
            uint64_t v47 = v42 + v43;
            *(void *)&buf[8] = v45;
            *(void *)&buf[16] = v47 ^ __ROR8__(v42, 47);
            *(void *)&buf[24] = __ROR8__(v47, 32);
            unint64_t v122 = v46;
            *(void *)&v135[8] = *(void *)&buf[16] ^ v45 ^ *(void *)&buf[24] ^ v46;
          }
        }
        else
        {
          uint64_t v50 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v51 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
          [v50 handleFailureInFunction:v51 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
        }
LABEL_72:
        v136[0] = *(_OWORD *)v135;
        v136[1] = *(_OWORD *)&v135[16];
        v136[2] = *(_OWORD *)&v135[32];
        v136[3] = *(_OWORD *)&v135[48];
        uint64_t v137 = *(void *)&v135[64];
        if (*(uint64_t *)v135 > 3999)
        {
          if (*(uint64_t *)v135 > 4255)
          {
            if (*(void *)v135 == 4256)
            {
              v104 = (unsigned __int8 *)v136 + 8;
              uint64_t v105 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v106 = v105;
              for (uint64_t i = 0; i != 64; i += 2)
              {
                unsigned int v108 = *v104++;
                v109 = &v105[i];
                char *v109 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v108 >> 4];
                v109[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v108 & 0xF];
              }
              id v75 = [NSString alloc];
              v76 = v106;
              uint64_t v77 = 64;
            }
            else
            {
              if (*(void *)v135 != 4512) {
                goto LABEL_122;
              }
              v82 = (unsigned __int8 *)v136 + 8;
              uint64_t v83 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v84 = v83;
              for (uint64_t j = 0; j != 128; j += 2)
              {
                unsigned int v86 = *v82++;
                v87 = &v83[j];
                char *v87 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v86 >> 4];
                v87[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v86 & 0xF];
              }
              id v75 = [NSString alloc];
              v76 = v84;
              uint64_t v77 = 128;
            }
          }
          else if (*(void *)v135 == 4000)
          {
            v94 = (unsigned __int8 *)v136 + 8;
            lldiv_t v95 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v96 = v95;
            for (uint64_t k = 0; k != 32; k += 2)
            {
              unsigned int v98 = *v94++;
              v99 = &v95[k];
              char *v99 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v98 >> 4];
              v99[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v98 & 0xF];
            }
            id v75 = [NSString alloc];
            v76 = v96;
            uint64_t v77 = 32;
          }
          else
          {
            if (*(void *)v135 != 4001) {
              goto LABEL_122;
            }
            ldiv_t v69 = (unsigned __int8 *)v136 + 8;
            uint64_t v70 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v71 = v70;
            for (uint64_t m = 0; m != 40; m += 2)
            {
              unsigned int v73 = *v69++;
              v74 = &v70[m];
              char *v74 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v73 >> 4];
              v74[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v73 & 0xF];
            }
            id v75 = [NSString alloc];
            v76 = v71;
            uint64_t v77 = 40;
          }
        }
        else
        {
          if (*(uint64_t *)v135 <= 2999)
          {
            if (*(void *)v135 == 1000)
            {
              uint64_t v88 = *((void *)&v136[0] + 1);
              v89 = (char *)&v139 + 1;
              uint64_t quot = *((void *)&v136[0] + 1);
              do
              {
                lldiv_t v91 = lldiv(quot, 10);
                uint64_t quot = v91.quot;
                if (v91.rem >= 0) {
                  LOBYTE(v92) = v91.rem;
                }
                else {
                  uint64_t v92 = -v91.rem;
                }
                *(v89 - 2) = v92 + 48;
                v68 = (const UInt8 *)(v89 - 2);
                --v89;
              }
              while (v91.quot);
              if (v88 < 0)
              {
                *(v89 - 2) = 45;
                v68 = (const UInt8 *)(v89 - 2);
              }
              uint64_t v67 = (char *)((char *)&v139 - (char *)v68);
              goto LABEL_106;
            }
            if (*(void *)v135 == 2000)
            {
              uint64_t v63 = DWORD2(v136[0]);
              unsigned int v64 = &v139;
              do
              {
                ldiv_t v65 = ldiv(v63, 10);
                uint64_t v63 = v65.quot;
                if (v65.rem >= 0) {
                  LOBYTE(v66) = v65.rem;
                }
                else {
                  uint64_t v66 = -v65.rem;
                }
                *((unsigned char *)v64 - 1) = v66 + 48;
                unsigned int v64 = (uint64_t *)((char *)v64 - 1);
              }
              while (v65.quot);
              uint64_t v67 = (char *)((char *)&v139 - (char *)v64);
              v68 = (const UInt8 *)v64;
LABEL_106:
              CFStringRef v93 = CFStringCreateWithBytes(0, v68, (CFIndex)v67, 0x8000100u, 0);
LABEL_117:
              v110 = (__CFString *)v93;
LABEL_118:

              v111 = os_log_create("com.apple.amp.MediaServices", "SQL");
              if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v112 = self->_connection;
                assertion = self->_assertion;
                *(_DWORD *)buf = 138543874;
                *(void *)&buf[4] = v110;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v112;
                *(_WORD *)&buf[22] = 2114;
                *(void *)&buf[24] = assertion;
                _os_log_impl(&dword_1A30CD000, v111, OS_LOG_TYPE_DEFAULT, "[SQL:%{public}@:%p] commit | invalidating process assertion [database transaction] assertion=%{public}@", buf, 0x20u);
              }

              [(_MSVSQLAssertion *)self->_assertion invalidate];
              v114 = self->_assertion;
              self->_assertion = 0;

              goto LABEL_121;
            }
LABEL_122:
            id v116 = [MEMORY[0x1E4F28B00] currentHandler];
            v117 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
            [v116 handleFailureInFunction:v117 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

            v110 = &stru_1EF642BA8;
            goto LABEL_118;
          }
          if (*(void *)v135 == 3000)
          {
            LODWORD(v138[0]) = bswap32(DWORD2(v136[0]));
            v100 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v101 = 0;
            unsigned int v102 = v100 + 1;
            do
            {
              unint64_t v103 = *((unsigned __int8 *)v138 + v101);
              *(v102 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v103 >> 4];
              *unsigned int v102 = MSVFastHexStringFromBytes_hexCharacters_3705[v103 & 0xF];
              v102 += 2;
              ++v101;
            }
            while (v101 != 4);
            id v75 = [NSString alloc];
            v76 = v100;
            uint64_t v77 = 8;
          }
          else
          {
            if (*(void *)v135 != 3001) {
              goto LABEL_122;
            }
            v138[0] = bswap64(*((unint64_t *)&v136[0] + 1));
            v78 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v79 = 0;
            v80 = v78 + 1;
            do
            {
              unint64_t v81 = *((unsigned __int8 *)v138 + v79);
              *(v80 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v81 >> 4];
              unsigned char *v80 = MSVFastHexStringFromBytes_hexCharacters_3705[v81 & 0xF];
              v80 += 2;
              ++v79;
            }
            while (v79 != 8);
            id v75 = [NSString alloc];
            v76 = v78;
            uint64_t v77 = 16;
          }
        }
        CFStringRef v93 = (CFStringRef)[v75 initWithBytesNoCopy:v76 length:v77 encoding:4 freeWhenDone:1];
        goto LABEL_117;
      }
      if (*(void *)buf != 2000)
      {
        if (*(void *)buf != 3000) {
          goto LABEL_72;
        }
        uint64_t v48 = &v122;
        if (*(_DWORD *)&buf[12]) {
          int v49 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A312BAA0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A312BA90)));
        }
        else {
          int v49 = *(_DWORD *)&buf[24] + 374761393;
        }
        unsigned int v53 = *(_DWORD *)&buf[8] + v49;
        unint64_t v54 = v124 & 0xF;
        if (v54 >= 4)
        {
          do
          {
            int v55 = *(_DWORD *)v48;
            uint64_t v48 = (unint64_t *)((char *)v48 + 4);
            HIDWORD(v56) = v53 - 1028477379 * v55;
            LODWORD(v56) = HIDWORD(v56);
            unsigned int v53 = 668265263 * (v56 >> 15);
            v54 -= 4;
          }
          while (v54 > 3);
        }
        for (; v54; --v54)
        {
          int v57 = *(unsigned __int8 *)v48;
          uint64_t v48 = (unint64_t *)((char *)v48 + 1);
          HIDWORD(v58) = v53 + 374761393 * v57;
          LODWORD(v58) = HIDWORD(v58);
          unsigned int v53 = -1640531535 * (v58 >> 21);
        }
        unsigned int v59 = -1028477379 * ((-2048144777 * (v53 ^ (v53 >> 15))) ^ ((-2048144777 * (v53 ^ (v53 >> 15))) >> 13));
        unsigned int v60 = v59 ^ HIWORD(v59);
        goto LABEL_71;
      }
      switch(buf[19])
      {
        case 1:
          int v52 = buf[16];
          break;
        case 2:
          int v52 = *(unsigned __int16 *)&buf[16];
          break;
        case 3:
          int v52 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
          break;
        default:
          unsigned int v61 = *(_DWORD *)&buf[8];
          goto LABEL_70;
      }
      unsigned int v61 = (461845907 * ((380141568 * v52) | ((-862048943 * v52) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_70:
      unsigned int v62 = -2048144789 * (v61 ^ *(_DWORD *)&buf[12] ^ ((v61 ^ *(_DWORD *)&buf[12]) >> 16));
      unsigned int v60 = (-1028477387 * (v62 ^ (v62 >> 13))) ^ ((-1028477387 * (v62 ^ (v62 >> 13))) >> 16);
      *(_DWORD *)&buf[8] = v60;
LABEL_71:
      *(_DWORD *)&v135[8] = v60;
      goto LABEL_72;
    }
  }
LABEL_121:

  return v4 == 0;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p name=%@>", objc_opt_class(), self, self->_name];
}

@end