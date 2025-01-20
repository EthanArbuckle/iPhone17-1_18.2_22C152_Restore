@interface _MSVSQLConnection
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)executeStatementString:(id)a3 error:(id *)a4;
- (char)initWithDatabaseURI:(uint64_t)a3 options:(void *)a4 error:;
- (id)_cloneWithOptions:(unint64_t)a3 error:(id *)a4;
- (id)resultsForStatement:(id)a3;
- (id)statementWithString:(id)a3 error:(id *)a4;
- (sqlite3)lastError;
- (void)_registerAggregateFunctionDescriptor:(id)a3;
- (void)_registerScalarFunctionDescriptor:(id)a3;
- (void)dealloc;
- (void)mutableCloneWithError:(void *)a1;
- (void)registerAggregateFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 start:(id)a6 add:(id)a7 remove:(id)a8 value:(id)a9;
- (void)registerFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 block:(id)a6;
- (void)unregisterFunctionNamed:(id)a3 arguments:(int64_t)a4;
@end

@implementation _MSVSQLConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURI, 0);
  objc_storeStrong((id *)&self->_aggregateFunctions, 0);
  objc_storeStrong((id *)&self->_scalarFunctions, 0);
  objc_storeStrong((id *)&self->_attachedDatabases, 0);
}

- (BOOL)executeStatementString:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (self->_invalid)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:1256 description:@"Attempt to use invalidated connection."];
  }
  v8 = [(_MSVSQLConnection *)self statementWithString:v7 error:a4];
  if (v8)
  {
    BOOL v9 = [(_MSVSQLConnection *)self executeStatement:v8 error:a4];
    [v8 invalidate];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = v7;
  if (self->_invalid)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:1240 description:@"Attempt to use invalidated connection."];

    if (v8) {
      goto LABEL_3;
    }
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_11;
  }
LABEL_3:
  BOOL v9 = (sqlite3_stmt *)v8[1];
LABEL_4:
  int v10 = sqlite3_step(v9);
  int v11 = v10;
  if (a4 && v10 != 101)
  {
    if (v8) {
      v12 = (void *)v8[2];
    }
    else {
      v12 = 0;
    }
    v13 = v12;
    -[_MSVSQLConnection lastError](v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    *a4 = v14;
  }

  return v11 == 101;
}

- (id)statementWithString:(id)a3 error:(id *)a4
{
  v256[0] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self->_invalid)
  {
    v231 = [MEMORY[0x1E4F28B00] currentHandler];
    [v231 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:1191 description:@"Attempt to use invalidated connection."];
  }
  ppStmt = 0;
  connectionHandle = self->_connectionHandle;
  id v9 = v7;
  if (sqlite3_prepare_v2(connectionHandle, (const char *)[v9 UTF8String], -1, &ppStmt, 0))
  {
    int v10 = -[_MSVSQLConnection lastError](&self->super.isa);
    if (!v10)
    {
LABEL_142:
      if (a4) {
        *a4 = v10;
      }

      v23 = 0;
      goto LABEL_145;
    }
    unint64_t v11 = MSVHasherSharedSeed();
    v12 = self->_databaseURI;
    long long v248 = 0u;
    long long v247 = 0u;
    long long v246 = 0u;
    long long v245 = 0u;
    long long v244 = 0u;
    long long v243 = 0u;
    long long v242 = 0u;
    long long v241 = 0u;
    *(_OWORD *)v235 = xmmword_1A312BAB0;
    *(int64x2_t *)&v235[16] = vaddq_s64(vdupq_n_s64(v11), (int64x2_t)xmmword_1A312BAC0);
    unint64_t v236 = v11;
    unint64_t v237 = v11 + 0x61C8864E7A143579;
    long long v238 = 0u;
    long long v239 = 0u;
    uint64_t v240 = 0;
    v13 = v12;
    id v14 = [(NSString *)v13 UTF8String];
    uint64_t v15 = [(NSString *)v13 length];
    int v16 = v15;
    if (*(uint64_t *)v235 > 3999)
    {
      if (*(uint64_t *)v235 > 4255)
      {
        if (*(void *)v235 == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)&v235[8], v14, v15);
        }
        else if (*(void *)v235 == 4512)
        {
          CC_SHA512_Update((CC_SHA512_CTX *)&v235[8], v14, v15);
        }
      }
      else if (*(void *)v235 == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)&v235[8], v14, v15);
      }
      else if (*(void *)v235 == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)&v235[8], v14, v15);
      }
    }
    else if (*(uint64_t *)v235 > 2999)
    {
      if (*(void *)v235 == 3000)
      {
        _MSV_XXH_XXH32_update(&v235[8], v14, v15);
      }
      else if (*(void *)v235 == 3001)
      {
        _MSV_XXH_XXH64_update(&v235[8], v14, v15);
      }
    }
    else if (*(void *)v235)
    {
      if (*(void *)v235 == 2000)
      {
        int v17 = (((v15 + v235[19]) & 3) - v235[19]);
        v18 = &v235[v235[19] + 16];
        switch(v17)
        {
          case 0:
            break;
          case 1:
            char *v18 = *v14;
            break;
          case 2:
            __int16 v36 = *(_WORD *)v14;
            goto LABEL_54;
          case 3:
            __int16 v36 = *(_WORD *)v14;
            v18[2] = v14[2];
LABEL_54:
            *(_WORD *)v18 = v36;
            break;
          default:
            memcpy(v18, v14, (((v16 + v235[19]) & 3) - v235[19]));
            break;
        }
        *(_DWORD *)&v235[12] += v16;
      }
    }
    else
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      v33 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
      [v32 handleFailureInFunction:v33 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
    }
    memset(&v249[8], 0, 64);
    *(void *)v249 = *(void *)v235;
    if (*(uint64_t *)v235 > 3000)
    {
      if (*(uint64_t *)v235 <= 4000)
      {
        if (*(void *)v235 == 3001)
        {
          *(void *)&v249[8] = _MSV_XXH_XXH64_digest(&v235[8]);
        }
        else if (*(void *)v235 == 4000)
        {
          CC_MD5_Final(&v249[8], (CC_MD5_CTX *)&v235[8]);
        }
      }
      else
      {
        switch(*(void *)v235)
        {
          case 0xFA1:
            CC_SHA1_Final(&v249[8], (CC_SHA1_CTX *)&v235[8]);
            break;
          case 0x10A0:
            CC_SHA256_Final(&v249[8], (CC_SHA256_CTX *)&v235[8]);
            break;
          case 0x11A0:
            CC_SHA512_Final(&v249[8], (CC_SHA512_CTX *)&v235[8]);
            break;
        }
      }
      goto LABEL_93;
    }
    if (*(uint64_t *)v235 <= 1999)
    {
      if (*(void *)v235)
      {
        if (*(void *)v235 == 1000)
        {
          uint64_t v37 = (*(void *)&v235[8] + *(void *)&v235[16]) ^ __ROR8__(*(void *)&v235[16], 51);
          unint64_t v38 = *(void *)&v235[24] + (v236 ^ v237);
          uint64_t v39 = __ROR8__(v236 ^ v237, 48);
          unint64_t v40 = (v38 ^ v39) + __ROR8__(*(void *)&v235[8] + *(void *)&v235[16], 32);
          uint64_t v41 = v40 ^ __ROR8__(v38 ^ v39, 43);
          uint64_t v42 = v38 + v37;
          uint64_t v43 = v42 ^ __ROR8__(v37, 47);
          unint64_t v44 = (v40 ^ v237) + v43;
          uint64_t v45 = v44 ^ __ROR8__(v43, 51);
          uint64_t v46 = (__ROR8__(v42, 32) ^ 0xFFLL) + v41;
          uint64_t v47 = __ROR8__(v41, 48);
          uint64_t v48 = __ROR8__(v44, 32) + (v46 ^ v47);
          uint64_t v49 = v48 ^ __ROR8__(v46 ^ v47, 43);
          uint64_t v50 = v45 + v46;
          uint64_t v51 = v50 ^ __ROR8__(v45, 47);
          uint64_t v52 = v51 + v48;
          uint64_t v53 = v52 ^ __ROR8__(v51, 51);
          uint64_t v54 = __ROR8__(v50, 32) + v49;
          uint64_t v55 = __ROR8__(v49, 48);
          uint64_t v56 = __ROR8__(v52, 32) + (v54 ^ v55);
          uint64_t v57 = v56 ^ __ROR8__(v54 ^ v55, 43);
          uint64_t v58 = v53 + v54;
          uint64_t v59 = v58 ^ __ROR8__(v53, 47);
          uint64_t v60 = v59 + v56;
          uint64_t v61 = v60 ^ __ROR8__(v59, 51);
          uint64_t v62 = __ROR8__(v58, 32) + v57;
          uint64_t v63 = __ROR8__(v57, 48);
          uint64_t v64 = __ROR8__(v60, 32) + (v62 ^ v63);
          unint64_t v65 = v64 ^ __ROR8__(v62 ^ v63, 43);
          uint64_t v66 = v61 + v62;
          *(void *)&v235[8] = v64;
          *(void *)&v235[16] = v66 ^ __ROR8__(v61, 47);
          *(void *)&v235[24] = __ROR8__(v66, 32);
          unint64_t v236 = v65;
          *(void *)&v249[8] = *(void *)&v235[16] ^ v64 ^ *(void *)&v235[24] ^ v65;
        }
      }
      else
      {
        v69 = [MEMORY[0x1E4F28B00] currentHandler];
        v70 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v69 handleFailureInFunction:v70 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
      }
LABEL_93:
      long long v250 = *(_OWORD *)v249;
      long long v251 = *(_OWORD *)&v249[16];
      long long v252 = *(_OWORD *)&v249[32];
      long long v253 = *(_OWORD *)&v249[48];
      uint64_t v254 = *(void *)&v249[64];
      if (*(uint64_t *)v249 > 3999)
      {
        if (*(uint64_t *)v249 > 4255)
        {
          if (*(void *)v249 == 4256)
          {
            v123 = (unsigned __int8 *)&v250 + 8;
            v124 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
            v125 = v124;
            for (uint64_t i = 0; i != 64; i += 2)
            {
              unsigned int v127 = *v123++;
              v128 = &v124[i];
              char *v128 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v127 >> 4];
              v128[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v127 & 0xF];
            }
            id v94 = [NSString alloc];
            v95 = v125;
            uint64_t v96 = 64;
          }
          else
          {
            if (*(void *)v249 != 4512) {
              goto LABEL_148;
            }
            v101 = (unsigned __int8 *)&v250 + 8;
            v102 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
            v103 = v102;
            for (uint64_t j = 0; j != 128; j += 2)
            {
              unsigned int v105 = *v101++;
              v106 = &v102[j];
              char *v106 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v105 >> 4];
              v106[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v105 & 0xF];
            }
            id v94 = [NSString alloc];
            v95 = v103;
            uint64_t v96 = 128;
          }
        }
        else if (*(void *)v249 == 4000)
        {
          v113 = (unsigned __int8 *)&v250 + 8;
          v114 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
          v115 = v114;
          for (uint64_t k = 0; k != 32; k += 2)
          {
            unsigned int v117 = *v113++;
            v118 = &v114[k];
            char *v118 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v117 >> 4];
            v118[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v117 & 0xF];
          }
          id v94 = [NSString alloc];
          v95 = v115;
          uint64_t v96 = 32;
        }
        else
        {
          if (*(void *)v249 != 4001) {
            goto LABEL_148;
          }
          v88 = (unsigned __int8 *)&v250 + 8;
          v89 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
          v90 = v89;
          for (uint64_t m = 0; m != 40; m += 2)
          {
            unsigned int v92 = *v88++;
            v93 = &v89[m];
            char *v93 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v92 >> 4];
            v93[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v92 & 0xF];
          }
          id v94 = [NSString alloc];
          v95 = v90;
          uint64_t v96 = 40;
        }
      }
      else
      {
        if (*(uint64_t *)v249 <= 2999)
        {
          if (*(void *)v249 == 1000)
          {
            uint64_t v107 = *((void *)&v250 + 1);
            v108 = (char *)v256 + 1;
            uint64_t quot = *((void *)&v250 + 1);
            do
            {
              lldiv_t v110 = lldiv(quot, 10);
              uint64_t quot = v110.quot;
              if (v110.rem >= 0) {
                LOBYTE(v111) = v110.rem;
              }
              else {
                uint64_t v111 = -v110.rem;
              }
              *(v108 - 2) = v111 + 48;
              v87 = (const UInt8 *)(v108 - 2);
              --v108;
            }
            while (v110.quot);
            if (v107 < 0)
            {
              *(v108 - 2) = 45;
              v87 = (const UInt8 *)(v108 - 2);
            }
            v86 = (char *)((char *)v256 - (char *)v87);
            goto LABEL_127;
          }
          if (*(void *)v249 == 2000)
          {
            uint64_t v82 = DWORD2(v250);
            v83 = v256;
            do
            {
              ldiv_t v84 = ldiv(v82, 10);
              uint64_t v82 = v84.quot;
              if (v84.rem >= 0) {
                LOBYTE(v85) = v84.rem;
              }
              else {
                uint64_t v85 = -v84.rem;
              }
              *((unsigned char *)v83 - 1) = v85 + 48;
              v83 = (void *)((char *)v83 - 1);
            }
            while (v84.quot);
            v86 = (char *)((char *)v256 - (char *)v83);
            v87 = (const UInt8 *)v83;
LABEL_127:
            CFStringRef v112 = CFStringCreateWithBytes(0, v87, (CFIndex)v86, 0x8000100u, 0);
LABEL_138:
            v129 = (__CFString *)v112;
LABEL_139:

            v130 = os_log_create("com.apple.amp.MediaServices", "SQL");
            if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v235 = 138543874;
              *(void *)&v235[4] = v129;
              *(_WORD *)&v235[12] = 2048;
              *(void *)&v235[14] = self;
              *(_WORD *)&v235[22] = 2114;
              *(void *)&v235[24] = v10;
              _os_log_impl(&dword_1A30CD000, v130, OS_LOG_TYPE_ERROR, "[SQL:%{public}@:%p] statementWithString:… | failed to create statement [] error=%{public}@", v235, 0x20u);
            }

            goto LABEL_142;
          }
LABEL_148:
          v132 = [MEMORY[0x1E4F28B00] currentHandler];
          v133 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
          [v132 handleFailureInFunction:v133 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

          v129 = &stru_1EF642BA8;
          goto LABEL_139;
        }
        if (*(void *)v249 == 3000)
        {
          LODWORD(v255[0]) = bswap32(DWORD2(v250));
          v119 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
          uint64_t v120 = 0;
          v121 = v119 + 1;
          do
          {
            unint64_t v122 = *((unsigned __int8 *)v255 + v120);
            *(v121 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v122 >> 4];
            unsigned char *v121 = MSVFastHexStringFromBytes_hexCharacters_3705[v122 & 0xF];
            v121 += 2;
            ++v120;
          }
          while (v120 != 4);
          id v94 = [NSString alloc];
          v95 = v119;
          uint64_t v96 = 8;
        }
        else
        {
          if (*(void *)v249 != 3001) {
            goto LABEL_148;
          }
          v255[0] = bswap64(*((unint64_t *)&v250 + 1));
          v97 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
          uint64_t v98 = 0;
          v99 = v97 + 1;
          do
          {
            unint64_t v100 = *((unsigned __int8 *)v255 + v98);
            *(v99 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v100 >> 4];
            unsigned char *v99 = MSVFastHexStringFromBytes_hexCharacters_3705[v100 & 0xF];
            v99 += 2;
            ++v98;
          }
          while (v98 != 8);
          id v94 = [NSString alloc];
          v95 = v97;
          uint64_t v96 = 16;
        }
      }
      CFStringRef v112 = (CFStringRef)[v94 initWithBytesNoCopy:v95 length:v96 encoding:4 freeWhenDone:1];
      goto LABEL_138;
    }
    if (*(void *)v235 != 2000)
    {
      if (*(void *)v235 != 3000) {
        goto LABEL_93;
      }
      v67 = &v236;
      if (*(_DWORD *)&v235[12]) {
        int v68 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v235[16], (uint32x4_t)xmmword_1A312BAA0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v235[16], (uint32x4_t)xmmword_1A312BA90)));
      }
      else {
        int v68 = *(_DWORD *)&v235[24] + 374761393;
      }
      unsigned int v72 = *(_DWORD *)&v235[8] + v68;
      unint64_t v73 = v238 & 0xF;
      if (v73 >= 4)
      {
        do
        {
          int v74 = *(_DWORD *)v67;
          v67 = (unint64_t *)((char *)v67 + 4);
          HIDWORD(v75) = v72 - 1028477379 * v74;
          LODWORD(v75) = HIDWORD(v75);
          unsigned int v72 = 668265263 * (v75 >> 15);
          v73 -= 4;
        }
        while (v73 > 3);
      }
      for (; v73; --v73)
      {
        int v76 = *(unsigned __int8 *)v67;
        v67 = (unint64_t *)((char *)v67 + 1);
        HIDWORD(v77) = v72 + 374761393 * v76;
        LODWORD(v77) = HIDWORD(v77);
        unsigned int v72 = -1640531535 * (v77 >> 21);
      }
      unsigned int v78 = -1028477379 * ((-2048144777 * (v72 ^ (v72 >> 15))) ^ ((-2048144777 * (v72 ^ (v72 >> 15))) >> 13));
      unsigned int v79 = v78 ^ HIWORD(v78);
      goto LABEL_92;
    }
    switch(v235[19])
    {
      case 1:
        int v71 = v235[16];
        break;
      case 2:
        int v71 = *(unsigned __int16 *)&v235[16];
        break;
      case 3:
        int v71 = *(unsigned __int16 *)&v235[16] | (v235[18] << 16);
        break;
      default:
        unsigned int v80 = *(_DWORD *)&v235[8];
        goto LABEL_91;
    }
    unsigned int v80 = (461845907 * ((380141568 * v71) | ((-862048943 * v71) >> 17))) ^ *(_DWORD *)&v235[8];
LABEL_91:
    unsigned int v81 = -2048144789 * (v80 ^ *(_DWORD *)&v235[12] ^ ((v80 ^ *(_DWORD *)&v235[12]) >> 16));
    unsigned int v79 = (-1028477387 * (v81 ^ (v81 >> 13))) ^ ((-1028477387 * (v81 ^ (v81 >> 13))) >> 16);
    *(_DWORD *)&v235[8] = v79;
LABEL_92:
    *(_DWORD *)&v249[8] = v79;
    goto LABEL_93;
  }
  if ((self->_options & 1) != 0 || sqlite3_stmt_readonly(ppStmt))
  {
    v19 = [MSVSQLStatement alloc];
    v20 = ppStmt;
    v21 = self;
    if (v19)
    {
      *(void *)v235 = v19;
      *(void *)&v235[8] = MSVSQLStatement;
      v22 = (id *)objc_msgSendSuper2((objc_super *)v235, sel_init);
      v23 = v22;
      if (v22)
      {
        v22[1] = v20;
        objc_storeStrong(v22 + 2, self);
      }
    }
    else
    {
      v23 = 0;
    }

    goto LABEL_145;
  }
  unint64_t v24 = MSVHasherSharedSeed();
  v25 = self->_databaseURI;
  long long v248 = 0u;
  long long v247 = 0u;
  long long v246 = 0u;
  long long v245 = 0u;
  long long v244 = 0u;
  long long v243 = 0u;
  long long v242 = 0u;
  long long v241 = 0u;
  *(_OWORD *)v235 = xmmword_1A312BAB0;
  *(int64x2_t *)&v235[16] = vaddq_s64(vdupq_n_s64(v24), (int64x2_t)xmmword_1A312BAC0);
  unint64_t v236 = v24;
  unint64_t v237 = v24 + 0x61C8864E7A143579;
  long long v238 = 0u;
  long long v239 = 0u;
  uint64_t v240 = 0;
  v26 = v25;
  v27 = [(NSString *)v26 UTF8String];
  uint64_t v28 = [(NSString *)v26 length];
  int v29 = v28;
  if (*(uint64_t *)v235 > 3999)
  {
    if (*(uint64_t *)v235 > 4255)
    {
      if (*(void *)v235 == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&v235[8], v27, v28);
      }
      else if (*(void *)v235 == 4512)
      {
        CC_SHA512_Update((CC_SHA512_CTX *)&v235[8], v27, v28);
      }
    }
    else if (*(void *)v235 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v235[8], v27, v28);
    }
    else if (*(void *)v235 == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&v235[8], v27, v28);
    }
  }
  else if (*(uint64_t *)v235 > 2999)
  {
    if (*(void *)v235 == 3000)
    {
      _MSV_XXH_XXH32_update(&v235[8], v27, v28);
    }
    else if (*(void *)v235 == 3001)
    {
      _MSV_XXH_XXH64_update(&v235[8], v27, v28);
    }
  }
  else if (*(void *)v235)
  {
    if (*(void *)v235 == 2000)
    {
      int v30 = (((v28 + v235[19]) & 3) - v235[19]);
      v31 = &v235[v235[19] + 16];
      switch(v30)
      {
        case 0:
          break;
        case 1:
          char *v31 = *v27;
          break;
        case 2:
          __int16 v134 = *(_WORD *)v27;
          goto LABEL_152;
        case 3:
          __int16 v134 = *(_WORD *)v27;
          v31[2] = v27[2];
LABEL_152:
          *(_WORD *)v31 = v134;
          break;
        default:
          memcpy(v31, v27, (((v29 + v235[19]) & 3) - v235[19]));
          break;
      }
      *(_DWORD *)&v235[12] += v29;
    }
  }
  else
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    v35 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
    [v34 handleFailureInFunction:v35 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
  }
  memset(&v249[8], 0, 64);
  *(void *)v249 = *(void *)v235;
  if (*(uint64_t *)v235 > 3000)
  {
    if (*(uint64_t *)v235 <= 4000)
    {
      if (*(void *)v235 == 3001)
      {
        *(void *)&v249[8] = _MSV_XXH_XXH64_digest(&v235[8]);
      }
      else if (*(void *)v235 == 4000)
      {
        CC_MD5_Final(&v249[8], (CC_MD5_CTX *)&v235[8]);
      }
    }
    else
    {
      switch(*(void *)v235)
      {
        case 0xFA1:
          CC_SHA1_Final(&v249[8], (CC_SHA1_CTX *)&v235[8]);
          break;
        case 0x10A0:
          CC_SHA256_Final(&v249[8], (CC_SHA256_CTX *)&v235[8]);
          break;
        case 0x11A0:
          CC_SHA512_Final(&v249[8], (CC_SHA512_CTX *)&v235[8]);
          break;
      }
    }
    goto LABEL_183;
  }
  if (*(uint64_t *)v235 <= 1999)
  {
    if (*(void *)v235)
    {
      if (*(void *)v235 == 1000)
      {
        uint64_t v135 = (*(void *)&v235[8] + *(void *)&v235[16]) ^ __ROR8__(*(void *)&v235[16], 51);
        unint64_t v136 = *(void *)&v235[24] + (v236 ^ v237);
        uint64_t v137 = __ROR8__(v236 ^ v237, 48);
        unint64_t v138 = (v136 ^ v137) + __ROR8__(*(void *)&v235[8] + *(void *)&v235[16], 32);
        uint64_t v139 = v138 ^ __ROR8__(v136 ^ v137, 43);
        uint64_t v140 = v136 + v135;
        uint64_t v141 = v140 ^ __ROR8__(v135, 47);
        unint64_t v142 = (v138 ^ v237) + v141;
        uint64_t v143 = v142 ^ __ROR8__(v141, 51);
        uint64_t v144 = (__ROR8__(v140, 32) ^ 0xFFLL) + v139;
        uint64_t v145 = __ROR8__(v139, 48);
        uint64_t v146 = __ROR8__(v142, 32) + (v144 ^ v145);
        uint64_t v147 = v146 ^ __ROR8__(v144 ^ v145, 43);
        uint64_t v148 = v143 + v144;
        uint64_t v149 = v148 ^ __ROR8__(v143, 47);
        uint64_t v150 = v149 + v146;
        uint64_t v151 = v150 ^ __ROR8__(v149, 51);
        uint64_t v152 = __ROR8__(v148, 32) + v147;
        uint64_t v153 = __ROR8__(v147, 48);
        uint64_t v154 = __ROR8__(v150, 32) + (v152 ^ v153);
        uint64_t v155 = v154 ^ __ROR8__(v152 ^ v153, 43);
        uint64_t v156 = v151 + v152;
        uint64_t v157 = v156 ^ __ROR8__(v151, 47);
        uint64_t v158 = v157 + v154;
        uint64_t v159 = v158 ^ __ROR8__(v157, 51);
        uint64_t v160 = __ROR8__(v156, 32) + v155;
        uint64_t v161 = __ROR8__(v155, 48);
        uint64_t v162 = __ROR8__(v158, 32) + (v160 ^ v161);
        unint64_t v163 = v162 ^ __ROR8__(v160 ^ v161, 43);
        uint64_t v164 = v159 + v160;
        *(void *)&v235[8] = v162;
        *(void *)&v235[16] = v164 ^ __ROR8__(v159, 47);
        *(void *)&v235[24] = __ROR8__(v164, 32);
        unint64_t v236 = v163;
        *(void *)&v249[8] = *(void *)&v235[16] ^ v162 ^ *(void *)&v235[24] ^ v163;
      }
    }
    else
    {
      v165 = [MEMORY[0x1E4F28B00] currentHandler];
      v166 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
      [v165 handleFailureInFunction:v166 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
    }
    goto LABEL_183;
  }
  if (*(void *)v235 == 2000)
  {
    switch(v235[19])
    {
      case 1:
        int v167 = v235[16];
        break;
      case 2:
        int v167 = *(unsigned __int16 *)&v235[16];
        break;
      case 3:
        int v167 = *(unsigned __int16 *)&v235[16] | (v235[18] << 16);
        break;
      default:
        unsigned int v168 = *(_DWORD *)&v235[8];
        goto LABEL_182;
    }
    unsigned int v168 = (461845907 * ((380141568 * v167) | ((-862048943 * v167) >> 17))) ^ *(_DWORD *)&v235[8];
LABEL_182:
    unsigned int v169 = -2048144789 * (v168 ^ *(_DWORD *)&v235[12] ^ ((v168 ^ *(_DWORD *)&v235[12]) >> 16));
    *(_DWORD *)&v235[8] = (-1028477387 * (v169 ^ (v169 >> 13))) ^ ((-1028477387 * (v169 ^ (v169 >> 13))) >> 16);
    *(_DWORD *)&v249[8] = *(_DWORD *)&v235[8];
    goto LABEL_183;
  }
  if (*(void *)v235 == 3000) {
    *(_DWORD *)&v249[8] = _MSV_XXH_XXH32_digest((uint64_t)&v235[8]);
  }
LABEL_183:
  long long v250 = *(_OWORD *)v249;
  long long v251 = *(_OWORD *)&v249[16];
  long long v252 = *(_OWORD *)&v249[32];
  long long v253 = *(_OWORD *)&v249[48];
  uint64_t v254 = *(void *)&v249[64];
  if (*(uint64_t *)v249 > 3999)
  {
    if (*(uint64_t *)v249 > 4255)
    {
      if (*(void *)v249 == 4256)
      {
        v211 = (unsigned __int8 *)&v250 + 8;
        v212 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v213 = v212;
        for (uint64_t n = 0; n != 64; n += 2)
        {
          unsigned int v215 = *v211++;
          v216 = &v212[n];
          char *v216 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v215 >> 4];
          v216[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v215 & 0xF];
        }
        id v182 = [NSString alloc];
        v183 = v213;
        uint64_t v184 = 64;
      }
      else
      {
        if (*(void *)v249 != 4512) {
          goto LABEL_246;
        }
        v189 = (unsigned __int8 *)&v250 + 8;
        v190 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v191 = v190;
        for (iuint64_t i = 0; ii != 128; ii += 2)
        {
          unsigned int v193 = *v189++;
          v194 = &v190[ii];
          char *v194 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v193 >> 4];
          v194[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v193 & 0xF];
        }
        id v182 = [NSString alloc];
        v183 = v191;
        uint64_t v184 = 128;
      }
    }
    else if (*(void *)v249 == 4000)
    {
      v201 = (unsigned __int8 *)&v250 + 8;
      v202 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v203 = v202;
      for (juint64_t j = 0; jj != 32; jj += 2)
      {
        unsigned int v205 = *v201++;
        v206 = &v202[jj];
        char *v206 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v205 >> 4];
        v206[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v205 & 0xF];
      }
      id v182 = [NSString alloc];
      v183 = v203;
      uint64_t v184 = 32;
    }
    else
    {
      if (*(void *)v249 != 4001) {
        goto LABEL_246;
      }
      v176 = (unsigned __int8 *)&v250 + 8;
      v177 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v178 = v177;
      for (kuint64_t k = 0; kk != 40; kk += 2)
      {
        unsigned int v180 = *v176++;
        v181 = &v177[kk];
        char *v181 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v180 >> 4];
        v181[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v180 & 0xF];
      }
      id v182 = [NSString alloc];
      v183 = v178;
      uint64_t v184 = 40;
    }
LABEL_227:
    CFStringRef v200 = (CFStringRef)[v182 initWithBytesNoCopy:v183 length:v184 encoding:4 freeWhenDone:1];
    goto LABEL_228;
  }
  if (*(uint64_t *)v249 > 2999)
  {
    if (*(void *)v249 == 3000)
    {
      LODWORD(v255[0]) = bswap32(DWORD2(v250));
      v207 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v208 = 0;
      v209 = v207 + 1;
      do
      {
        unint64_t v210 = *((unsigned __int8 *)v255 + v208);
        *(v209 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v210 >> 4];
        unsigned char *v209 = MSVFastHexStringFromBytes_hexCharacters_3705[v210 & 0xF];
        v209 += 2;
        ++v208;
      }
      while (v208 != 4);
      id v182 = [NSString alloc];
      v183 = v207;
      uint64_t v184 = 8;
    }
    else
    {
      if (*(void *)v249 != 3001) {
        goto LABEL_246;
      }
      v255[0] = bswap64(*((unint64_t *)&v250 + 1));
      v185 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v186 = 0;
      v187 = v185 + 1;
      do
      {
        unint64_t v188 = *((unsigned __int8 *)v255 + v186);
        *(v187 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v188 >> 4];
        unsigned char *v187 = MSVFastHexStringFromBytes_hexCharacters_3705[v188 & 0xF];
        v187 += 2;
        ++v186;
      }
      while (v186 != 8);
      id v182 = [NSString alloc];
      v183 = v185;
      uint64_t v184 = 16;
    }
    goto LABEL_227;
  }
  if (*(void *)v249 == 1000)
  {
    uint64_t v195 = *((void *)&v250 + 1);
    v196 = (char *)v256 + 1;
    uint64_t v197 = *((void *)&v250 + 1);
    do
    {
      lldiv_t v198 = lldiv(v197, 10);
      uint64_t v197 = v198.quot;
      if (v198.rem >= 0) {
        LOBYTE(v199) = v198.rem;
      }
      else {
        uint64_t v199 = -v198.rem;
      }
      *(v196 - 2) = v199 + 48;
      v175 = (const UInt8 *)(v196 - 2);
      --v196;
    }
    while (v198.quot);
    if (v195 < 0)
    {
      *(v196 - 2) = 45;
      v175 = (const UInt8 *)(v196 - 2);
    }
    v174 = (char *)((char *)v256 - (char *)v175);
    goto LABEL_217;
  }
  if (*(void *)v249 != 2000)
  {
LABEL_246:
    v229 = [MEMORY[0x1E4F28B00] currentHandler];
    v230 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
    [v229 handleFailureInFunction:v230 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

    v217 = &stru_1EF642BA8;
    goto LABEL_229;
  }
  uint64_t v170 = DWORD2(v250);
  v171 = v256;
  do
  {
    ldiv_t v172 = ldiv(v170, 10);
    uint64_t v170 = v172.quot;
    if (v172.rem >= 0) {
      LOBYTE(v173) = v172.rem;
    }
    else {
      uint64_t v173 = -v172.rem;
    }
    *((unsigned char *)v171 - 1) = v173 + 48;
    v171 = (void *)((char *)v171 - 1);
  }
  while (v172.quot);
  v174 = (char *)((char *)v256 - (char *)v171);
  v175 = (const UInt8 *)v171;
LABEL_217:
  CFStringRef v200 = CFStringCreateWithBytes(0, v175, (CFIndex)v174, 0x8000100u, 0);
LABEL_228:
  v217 = (__CFString *)v200;
LABEL_229:

  v218 = os_log_create("com.apple.amp.MediaServices", "SQL");
  if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v235 = 138543874;
    *(void *)&v235[4] = v217;
    *(_WORD *)&v235[12] = 2048;
    *(void *)&v235[14] = self;
    *(_WORD *)&v235[22] = 2114;
    *(void *)&v235[24] = v9;
    _os_log_impl(&dword_1A30CD000, v218, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] statementWithString:… | creating mutable connection [mutating sql statement] statement=%{public}@", v235, 0x20u);
  }

  id v233 = 0;
  v219 = -[_MSVSQLConnection mutableCloneWithError:](self, (uint64_t)&v233);
  id v220 = v233;
  v221 = os_log_create("com.apple.amp.MediaServices", "SQL");
  v222 = v221;
  if (v219)
  {
    if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v235 = 138543618;
      *(void *)&v235[4] = v217;
      *(_WORD *)&v235[12] = 2048;
      *(void *)&v235[14] = self;
      _os_log_impl(&dword_1A30CD000, v222, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] statementWithString:… | creating implicit transaction [mutating sql statement]", v235, 0x16u);
    }

    v223 = [MSVSQLDatabaseTransaction alloc];
    v224 = [@"Implicit-" stringByAppendingString:v217];
    id v232 = 0;
    v225 = -[MSVSQLDatabaseTransaction initWithConnection:name:error:]((__CFString *)v223, v219, v224, &v232);
    id v226 = v232;

    if (v225)
    {
      uint64_t v227 = [(__CFString *)v225 statementWithString:v9 error:a4];
      v23 = (void *)v227;
      if (v227) {
        objc_storeStrong((id *)(v227 + 24), v225);
      }
    }
    else
    {
      v228 = _MSVLogCategorySQL();
      if (os_log_type_enabled(v228, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v235 = 138543874;
        *(void *)&v235[4] = v217;
        *(_WORD *)&v235[12] = 2048;
        *(void *)&v235[14] = self;
        *(_WORD *)&v235[22] = 2114;
        *(void *)&v235[24] = v226;
        _os_log_impl(&dword_1A30CD000, v228, OS_LOG_TYPE_ERROR, "[SQL:%{public}@:%p] statementWithString:… | failed to create implicit transaction [] error=%{public}@", v235, 0x20u);
      }

      v23 = 0;
      if (a4) {
        *a4 = v226;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v235 = 138543874;
      *(void *)&v235[4] = v217;
      *(_WORD *)&v235[12] = 2048;
      *(void *)&v235[14] = self;
      *(_WORD *)&v235[22] = 2114;
      *(void *)&v235[24] = v220;
      _os_log_impl(&dword_1A30CD000, v222, OS_LOG_TYPE_ERROR, "[SQL:%{public}@:%p] statementWithString:… | failed to create mutable connection [] error=%{public}@", v235, 0x20u);
    }

    v23 = 0;
    if (a4) {
      *a4 = v220;
    }
  }

LABEL_145:
  return v23;
}

- (char)initWithDatabaseURI:(uint64_t)a3 options:(void *)a4 error:
{
  v155[0] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1)
  {
    v137.receiver = a1;
    v137.super_class = (Class)_MSVSQLConnection;
    a1 = (char *)objc_msgSendSuper2(&v137, sel_init);
    if (a1)
    {
      unint64_t v136 = a4;
      uint64_t v8 = [v7 copy];
      id v9 = (void *)*((void *)a1 + 7);
      *((void *)a1 + 7) = v8;

      *((void *)a1 + 2) = a3;
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
      unint64_t v11 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v10;

      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      v13 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v12;

      uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v15 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v14;

      if (a3) {
        int v16 = 33554434;
      }
      else {
        int v16 = 33554433;
      }
      unint64_t v17 = MSVHasherSharedSeed();
      id v18 = v7;
      long long v150 = 0u;
      long long v149 = 0u;
      long long v148 = 0u;
      long long v147 = 0u;
      long long v146 = 0u;
      long long v145 = 0u;
      long long v144 = 0u;
      long long v143 = 0u;
      *(_OWORD *)buf = xmmword_1A312BAB0;
      *(int64x2_t *)&buf[16] = vaddq_s64(vdupq_n_s64(v17), (int64x2_t)xmmword_1A312BAC0);
      *(void *)&long long v139 = v17;
      *((void *)&v139 + 1) = v17 + 0x61C8864E7A143579;
      long long v140 = 0u;
      long long v141 = 0u;
      uint64_t v142 = 0;
      id v19 = v18;
      v20 = (unsigned char *)[v19 UTF8String];
      uint64_t v21 = [v19 length];
      int v22 = v21;
      if (*(uint64_t *)buf > 3999)
      {
        if (*(uint64_t *)buf > 4255)
        {
          if (*(void *)buf == 4256)
          {
            CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v20, v21);
          }
          else if (*(void *)buf == 4512)
          {
            CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v20, v21);
          }
        }
        else if (*(void *)buf == 4000)
        {
          CC_MD5_Update((CC_MD5_CTX *)&buf[8], v20, v21);
        }
        else if (*(void *)buf == 4001)
        {
          CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v20, v21);
        }
      }
      else if (*(uint64_t *)buf > 2999)
      {
        if (*(void *)buf == 3000)
        {
          _MSV_XXH_XXH32_update(&buf[8], v20, v21);
        }
        else if (*(void *)buf == 3001)
        {
          _MSV_XXH_XXH64_update(&buf[8], v20, v21);
        }
      }
      else if (*(void *)buf)
      {
        if (*(void *)buf == 2000)
        {
          int v23 = (((v21 + buf[19]) & 3) - buf[19]);
          unint64_t v24 = &buf[buf[19] + 16];
          switch(v23)
          {
            case 0:
              break;
            case 1:
              *unint64_t v24 = *v20;
              break;
            case 2:
              __int16 v27 = *(_WORD *)v20;
              goto LABEL_29;
            case 3:
              __int16 v27 = *(_WORD *)v20;
              v24[2] = v20[2];
LABEL_29:
              *(_WORD *)unint64_t v24 = v27;
              break;
            default:
              memcpy(v24, v20, (((v22 + buf[19]) & 3) - buf[19]));
              break;
          }
          *(_DWORD *)&buf[12] += v22;
        }
      }
      else
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        v26 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
        [v25 handleFailureInFunction:v26 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
      }
      memset(&v151[8], 0, 64);
      *(void *)uint64_t v151 = *(void *)buf;
      if (*(uint64_t *)buf > 3000)
      {
        if (*(uint64_t *)buf <= 4000)
        {
          if (*(void *)buf == 3001)
          {
            *(void *)&v151[8] = _MSV_XXH_XXH64_digest(&buf[8]);
          }
          else if (*(void *)buf == 4000)
          {
            CC_MD5_Final(&v151[8], (CC_MD5_CTX *)&buf[8]);
          }
        }
        else
        {
          switch(*(void *)buf)
          {
            case 0xFA1:
              CC_SHA1_Final(&v151[8], (CC_SHA1_CTX *)&buf[8]);
              break;
            case 0x10A0:
              CC_SHA256_Final(&v151[8], (CC_SHA256_CTX *)&buf[8]);
              break;
            case 0x11A0:
              CC_SHA512_Final(&v151[8], (CC_SHA512_CTX *)&buf[8]);
              break;
          }
        }
        goto LABEL_68;
      }
      if (*(uint64_t *)buf <= 1999)
      {
        if (*(void *)buf)
        {
          if (*(void *)buf == 1000)
          {
            uint64_t v28 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
            uint64_t v29 = *(void *)&buf[24] + (v139 ^ *((void *)&v139 + 1));
            uint64_t v30 = __ROR8__(v139 ^ *((void *)&v139 + 1), 48);
            uint64_t v31 = (v29 ^ v30) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
            uint64_t v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
            uint64_t v33 = v29 + v28;
            uint64_t v34 = v33 ^ __ROR8__(v28, 47);
            uint64_t v35 = (v31 ^ *((void *)&v139 + 1)) + v34;
            uint64_t v36 = v35 ^ __ROR8__(v34, 51);
            uint64_t v37 = (__ROR8__(v33, 32) ^ 0xFFLL) + v32;
            uint64_t v38 = __ROR8__(v32, 48);
            uint64_t v39 = __ROR8__(v35, 32) + (v37 ^ v38);
            uint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
            uint64_t v41 = v36 + v37;
            uint64_t v42 = v41 ^ __ROR8__(v36, 47);
            uint64_t v43 = v42 + v39;
            uint64_t v44 = v43 ^ __ROR8__(v42, 51);
            uint64_t v45 = __ROR8__(v41, 32) + v40;
            uint64_t v46 = __ROR8__(v40, 48);
            uint64_t v47 = __ROR8__(v43, 32) + (v45 ^ v46);
            uint64_t v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
            uint64_t v49 = v44 + v45;
            uint64_t v50 = v49 ^ __ROR8__(v44, 47);
            uint64_t v51 = v50 + v47;
            uint64_t v52 = v51 ^ __ROR8__(v50, 51);
            uint64_t v53 = __ROR8__(v49, 32) + v48;
            uint64_t v54 = __ROR8__(v48, 48);
            uint64_t v55 = __ROR8__(v51, 32) + (v53 ^ v54);
            uint64_t v56 = v55 ^ __ROR8__(v53 ^ v54, 43);
            uint64_t v57 = v52 + v53;
            *(void *)&buf[8] = v55;
            *(void *)&buf[16] = v57 ^ __ROR8__(v52, 47);
            *(void *)&buf[24] = __ROR8__(v57, 32);
            *(void *)&long long v139 = v56;
            *(void *)&v151[8] = *(void *)&buf[16] ^ v55 ^ *(void *)&buf[24] ^ v56;
          }
        }
        else
        {
          uint64_t v60 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v61 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
          [v60 handleFailureInFunction:v61 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
        }
LABEL_68:
        v152[0] = *(_OWORD *)v151;
        v152[1] = *(_OWORD *)&v151[16];
        v152[2] = *(_OWORD *)&v151[32];
        v152[3] = *(_OWORD *)&v151[48];
        uint64_t v153 = *(void *)&v151[64];
        if (*(uint64_t *)v151 > 3999)
        {
          if (*(uint64_t *)v151 > 4255)
          {
            if (*(void *)v151 == 4256)
            {
              v114 = (unsigned __int8 *)v152 + 8;
              v115 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v116 = v115;
              for (uint64_t i = 0; i != 64; i += 2)
              {
                unsigned int v118 = *v114++;
                v119 = &v115[i];
                char *v119 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v118 >> 4];
                v119[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v118 & 0xF];
              }
              id v85 = [NSString alloc];
              v86 = v116;
              uint64_t v87 = 64;
            }
            else
            {
              if (*(void *)v151 != 4512) {
                goto LABEL_139;
              }
              unsigned int v92 = (unsigned __int8 *)v152 + 8;
              v93 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              id v94 = v93;
              for (uint64_t j = 0; j != 128; j += 2)
              {
                unsigned int v96 = *v92++;
                v97 = &v93[j];
                char *v97 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v96 >> 4];
                v97[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v96 & 0xF];
              }
              id v85 = [NSString alloc];
              v86 = v94;
              uint64_t v87 = 128;
            }
          }
          else if (*(void *)v151 == 4000)
          {
            v104 = (unsigned __int8 *)v152 + 8;
            unsigned int v105 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            v106 = v105;
            for (uint64_t k = 0; k != 32; k += 2)
            {
              unsigned int v108 = *v104++;
              v109 = &v105[k];
              char *v109 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v108 >> 4];
              v109[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v108 & 0xF];
            }
            id v85 = [NSString alloc];
            v86 = v106;
            uint64_t v87 = 32;
          }
          else
          {
            if (*(void *)v151 != 4001) {
              goto LABEL_139;
            }
            unsigned int v79 = (unsigned __int8 *)v152 + 8;
            unsigned int v80 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            unsigned int v81 = v80;
            for (uint64_t m = 0; m != 40; m += 2)
            {
              unsigned int v83 = *v79++;
              ldiv_t v84 = &v80[m];
              *ldiv_t v84 = MSVFastHexStringFromBytes_hexCharacters_3705[(unint64_t)v83 >> 4];
              v84[1] = MSVFastHexStringFromBytes_hexCharacters_3705[v83 & 0xF];
            }
            id v85 = [NSString alloc];
            v86 = v81;
            uint64_t v87 = 40;
          }
        }
        else
        {
          if (*(uint64_t *)v151 <= 2999)
          {
            if (*(void *)v151 == 1000)
            {
              uint64_t v98 = *((void *)&v152[0] + 1);
              v99 = (char *)v155 + 1;
              uint64_t quot = *((void *)&v152[0] + 1);
              do
              {
                lldiv_t v101 = lldiv(quot, 10);
                uint64_t quot = v101.quot;
                if (v101.rem >= 0) {
                  LOBYTE(v102) = v101.rem;
                }
                else {
                  uint64_t v102 = -v101.rem;
                }
                *(v99 - 2) = v102 + 48;
                unsigned int v78 = (const UInt8 *)(v99 - 2);
                --v99;
              }
              while (v101.quot);
              if (v98 < 0)
              {
                *(v99 - 2) = 45;
                unsigned int v78 = (const UInt8 *)(v99 - 2);
              }
              unint64_t v77 = (char *)((char *)v155 - (char *)v78);
              goto LABEL_102;
            }
            if (*(void *)v151 == 2000)
            {
              uint64_t v73 = DWORD2(v152[0]);
              int v74 = v155;
              do
              {
                ldiv_t v75 = ldiv(v73, 10);
                uint64_t v73 = v75.quot;
                if (v75.rem >= 0) {
                  LOBYTE(v76) = v75.rem;
                }
                else {
                  uint64_t v76 = -v75.rem;
                }
                *((unsigned char *)v74 - 1) = v76 + 48;
                int v74 = (void *)((char *)v74 - 1);
              }
              while (v75.quot);
              unint64_t v77 = (char *)((char *)v155 - (char *)v74);
              unsigned int v78 = (const UInt8 *)v74;
LABEL_102:
              CFStringRef v103 = CFStringCreateWithBytes(0, v78, (CFIndex)v77, 0x8000100u, 0);
LABEL_113:
              uint64_t v120 = (__CFString *)v103;
              goto LABEL_114;
            }
LABEL_139:
            __int16 v134 = [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v135 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
            [v134 handleFailureInFunction:v135 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

            uint64_t v120 = &stru_1EF642BA8;
LABEL_114:

            v121 = os_log_create("com.apple.amp.MediaServices", "SQL");
            if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138544130;
              *(void *)&buf[4] = v120;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = a1;
              *(_WORD *)&buf[22] = 2114;
              *(void *)&buf[24] = v19;
              LOWORD(v139) = 2048;
              *(void *)((char *)&v139 + 2) = a3;
              _os_log_impl(&dword_1A30CD000, v121, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | opening database", buf, 0x2Au);
            }

            unint64_t v122 = (sqlite3 **)(a1 + 8);
            int v123 = OpenSQLiteConnection(v19, (sqlite3 **)a1 + 1, v16);
            v124 = os_log_create("com.apple.amp.MediaServices", "SQL");
            if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138544386;
              *(void *)&buf[4] = v120;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = a1;
              *(_WORD *)&buf[22] = 2114;
              *(void *)&buf[24] = v19;
              LOWORD(v139) = 2048;
              *(void *)((char *)&v139 + 2) = a3;
              WORD5(v139) = 1024;
              HIDWORD(v139) = v123;
              _os_log_impl(&dword_1A30CD000, v124, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | opening database [] result=%d", buf, 0x30u);
            }

            if (!v123)
            {
              sqlite3_busy_timeout(*v122, 1000);
              sqlite3_exec(*v122, "PRAGMA journal_mode=WAL", 0, 0, 0);
LABEL_137:

              goto LABEL_138;
            }
            int v125 = OpenSQLiteConnection(v19, (sqlite3 **)a1 + 1, 33554438);
            v126 = os_log_create("com.apple.amp.MediaServices", "SQL");
            if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138544386;
              *(void *)&buf[4] = v120;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = a1;
              *(_WORD *)&buf[22] = 2114;
              *(void *)&buf[24] = v19;
              LOWORD(v139) = 2048;
              *(void *)((char *)&v139 + 2) = a3;
              WORD5(v139) = 1024;
              HIDWORD(v139) = v125;
              _os_log_impl(&dword_1A30CD000, v126, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | opening database for creation [failed readonly open] result=%d", buf, 0x30u);
            }

            if (v125)
            {
              unsigned int v127 = -[_MSVSQLConnection lastError]((sqlite3 **)a1);
              v128 = v127;
              if (v136) {
                *unint64_t v136 = v127;
              }
              v129 = os_log_create("com.apple.amp.MediaServices", "SQL");
              if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138544642;
                *(void *)&buf[4] = v120;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = a1;
                *(_WORD *)&buf[22] = 2114;
                *(void *)&buf[24] = v19;
                LOWORD(v139) = 2048;
                *(void *)((char *)&v139 + 2) = a3;
                WORD5(v139) = 1024;
                HIDWORD(v139) = v125;
                LOWORD(v140) = 2114;
                *(void *)((char *)&v140 + 2) = v128;
                _os_log_impl(&dword_1A30CD000, v129, OS_LOG_TYPE_ERROR, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | failed opening database [failed create open] result=%d error=%{public}@", buf, 0x3Au);
              }
            }
            else
            {
              if ((a3 & 1) == 0)
              {
                sqlite3_exec(*v122, "PRAGMA journal_mode=WAL", 0, 0, 0);
                sqlite3_close(*v122);
                *unint64_t v122 = 0;
                v130 = os_log_create("com.apple.amp.MediaServices", "SQL");
                if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138544130;
                  *(void *)&buf[4] = v120;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = a1;
                  *(_WORD *)&buf[22] = 2114;
                  *(void *)&buf[24] = v19;
                  LOWORD(v139) = 2048;
                  *(void *)((char *)&v139 + 2) = a3;
                  _os_log_impl(&dword_1A30CD000, v130, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | re-opening database disallowing creation [need read-only connection]", buf, 0x2Au);
                }

                a1 = (char *)(id)-[_MSVSQLConnection initWithDatabaseURI:options:error:](a1, v19, a3, v136);
                v131 = a1;
                goto LABEL_136;
              }
              v132 = os_log_create("com.apple.amp.MediaServices", "SQL");
              if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138544130;
                *(void *)&buf[4] = v120;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = a1;
                *(_WORD *)&buf[22] = 2114;
                *(void *)&buf[24] = v19;
                LOWORD(v139) = 2048;
                *(void *)((char *)&v139 + 2) = a3;
                _os_log_impl(&dword_1A30CD000, v132, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | using created database [mutation allowed]", buf, 0x2Au);
              }
            }
            v131 = 0;
LABEL_136:

            uint64_t v120 = (__CFString *)a1;
            a1 = v131;
            goto LABEL_137;
          }
          if (*(void *)v151 == 3000)
          {
            LODWORD(v154[0]) = bswap32(DWORD2(v152[0]));
            lldiv_t v110 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v111 = 0;
            CFStringRef v112 = v110 + 1;
            do
            {
              unint64_t v113 = *((unsigned __int8 *)v154 + v111);
              *(v112 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v113 >> 4];
              *CFStringRef v112 = MSVFastHexStringFromBytes_hexCharacters_3705[v113 & 0xF];
              v112 += 2;
              ++v111;
            }
            while (v111 != 4);
            id v85 = [NSString alloc];
            v86 = v110;
            uint64_t v87 = 8;
          }
          else
          {
            if (*(void *)v151 != 3001) {
              goto LABEL_139;
            }
            v154[0] = bswap64(*((unint64_t *)&v152[0] + 1));
            v88 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v89 = 0;
            v90 = v88 + 1;
            do
            {
              unint64_t v91 = *((unsigned __int8 *)v154 + v89);
              *(v90 - 1) = MSVFastHexStringFromBytes_hexCharacters_3705[v91 >> 4];
              unsigned char *v90 = MSVFastHexStringFromBytes_hexCharacters_3705[v91 & 0xF];
              v90 += 2;
              ++v89;
            }
            while (v89 != 8);
            id v85 = [NSString alloc];
            v86 = v88;
            uint64_t v87 = 16;
          }
        }
        CFStringRef v103 = (CFStringRef)[v85 initWithBytesNoCopy:v86 length:v87 encoding:4 freeWhenDone:1];
        goto LABEL_113;
      }
      if (*(void *)buf != 2000)
      {
        if (*(void *)buf != 3000) {
          goto LABEL_68;
        }
        uint64_t v58 = (int *)&v139;
        if (*(_DWORD *)&buf[12]) {
          int v59 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A312BAA0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A312BA90)));
        }
        else {
          int v59 = *(_DWORD *)&buf[24] + 374761393;
        }
        unsigned int v63 = *(_DWORD *)&buf[8] + v59;
        unint64_t v64 = v140 & 0xF;
        if (v64 >= 4)
        {
          do
          {
            int v65 = *v58++;
            HIDWORD(v66) = v63 - 1028477379 * v65;
            LODWORD(v66) = HIDWORD(v66);
            unsigned int v63 = 668265263 * (v66 >> 15);
            v64 -= 4;
          }
          while (v64 > 3);
        }
        for (; v64; --v64)
        {
          int v67 = *(unsigned __int8 *)v58;
          uint64_t v58 = (int *)((char *)v58 + 1);
          HIDWORD(v68) = v63 + 374761393 * v67;
          LODWORD(v68) = HIDWORD(v68);
          unsigned int v63 = -1640531535 * (v68 >> 21);
        }
        unsigned int v69 = -1028477379 * ((-2048144777 * (v63 ^ (v63 >> 15))) ^ ((-2048144777 * (v63 ^ (v63 >> 15))) >> 13));
        unsigned int v70 = v69 ^ HIWORD(v69);
        goto LABEL_67;
      }
      switch(buf[19])
      {
        case 1:
          int v62 = buf[16];
          break;
        case 2:
          int v62 = *(unsigned __int16 *)&buf[16];
          break;
        case 3:
          int v62 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
          break;
        default:
          unsigned int v71 = *(_DWORD *)&buf[8];
          goto LABEL_66;
      }
      unsigned int v71 = (461845907 * ((380141568 * v62) | ((-862048943 * v62) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_66:
      unsigned int v72 = -2048144789 * (v71 ^ *(_DWORD *)&buf[12] ^ ((v71 ^ *(_DWORD *)&buf[12]) >> 16));
      unsigned int v70 = (-1028477387 * (v72 ^ (v72 >> 13))) ^ ((-1028477387 * (v72 ^ (v72 >> 13))) >> 16);
      *(_DWORD *)&buf[8] = v70;
LABEL_67:
      *(_DWORD *)&v151[8] = v70;
      goto LABEL_68;
    }
  }
LABEL_138:

  return a1;
}

- (void)dealloc
{
  if (!self->_invalid)
  {
    self->_invalid = 1;
    sqlite3_close(self->_connectionHandle);
    self->_connectionHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_MSVSQLConnection;
  [(_MSVSQLConnection *)&v3 dealloc];
}

- (void)mutableCloneWithError:(void *)a1
{
  if (a1)
  {
    a1 = [a1 _cloneWithOptions:a1[2] | 1 error:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)_cloneWithOptions:(unint64_t)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = [_MSVSQLConnection alloc];
  databaseURI = self->_databaseURI;
  id v42 = 0;
  id v9 = -[_MSVSQLConnection initWithDatabaseURI:options:error:]((char *)v7, databaseURI, a3, &v42);
  id v10 = v42;
  unint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__3695;
    uint64_t v40 = __Block_byref_object_dispose__3696;
    id v41 = 0;
    attachedDatabases = self->_attachedDatabases;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __45___MSVSQLConnection__cloneWithOptions_error___block_invoke;
    v33[3] = &unk_1E5ADA238;
    uint64_t v14 = v9;
    uint64_t v34 = v14;
    uint64_t v35 = &v36;
    [(NSMutableDictionary *)attachedDatabases enumerateKeysAndObjectsUsingBlock:v33];
    uint64_t v15 = (void *)v37[5];
    if (v15)
    {
      uint64_t v12 = 0;
      if (a4) {
        *a4 = v15;
      }
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      int v16 = self->_scalarFunctions;
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v16);
            }
            [v14 _registerScalarFunctionDescriptor:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          }
          uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v44 count:16];
        }
        while (v17);
      }

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v20 = self->_aggregateFunctions;
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v43 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(v20);
            }
            objc_msgSend(v14, "_registerAggregateFunctionDescriptor:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
          }
          uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v43 count:16];
        }
        while (v21);
      }

      uint64_t v12 = v14;
    }

    _Block_object_dispose(&v36, 8);
  }

  return v12;
}

- (sqlite3)lastError
{
  if (a1)
  {
    uint64_t v2 = a1;
    objc_super v3 = sqlite3_errmsg(a1[1]);
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVSQLDatabaseError", 1, @"[%lld] %s", sqlite3_errcode(v2[1]), v3);
    a1 = (sqlite3 **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_registerAggregateFunctionDescriptor:(id)a3
{
  v4 = a3;
  connectionHandle = self->_connectionHandle;
  pApp = v4;
  if (v4) {
    v6 = (void *)*((void *)v4 + 1);
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = (const char *)[v7 UTF8String];
  if (pApp)
  {
    int v9 = pApp[4];
    uint64_t v10 = *((void *)pApp + 3);
    if (v10) {
      int v11 = 2049;
    }
    else {
      int v11 = 1;
    }
    if ((v10 & 2) != 0) {
      int v12 = v11;
    }
    else {
      int v12 = v11 | 0x80000;
    }
    unsigned int v13 = v12 & 0xFFDFFFFF | (((v10 >> 2) & 1) << 21);
    uint64_t v14 = pApp;
    id v15 = v14[6];
    if (v15) {
      int v16 = (void (__cdecl *)(sqlite3_context *))_aggregateFunctionValue;
    }
    else {
      int v16 = 0;
    }
    id v17 = v14[6];
  }
  else
  {
    int v16 = 0;
    id v15 = 0;
    int v9 = 0;
    unsigned int v13 = 0;
    id v17 = 0;
  }
  if (v17) {
    xInverse = (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_aggregateFunctionInverse;
  }
  else {
    xInverse = 0;
  }
  sqlite3_create_window_function(connectionHandle, v8, v9, v13, pApp, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_aggregateFunctionStep, (void (__cdecl *)(sqlite3_context *))_aggregateFunctionFinal, v16, xInverse, _MSVSQLBridgeDestroy);

  [(NSMutableArray *)self->_aggregateFunctions addObject:pApp];
}

- (void)registerAggregateFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 start:(id)a6 add:(id)a7 remove:(id)a8 value:(id)a9
{
  id newValue = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  id v17 = a3;
  uint64_t v18 = objc_alloc_init(_MSVSQLDatabaseAggregateFunctionDescriptor);
  id v19 = (void *)[v17 copy];

  if (v18)
  {
    objc_setProperty_nonatomic_copy(v18, v20, v19, 8);

    v18->super._numberOfArguments = a4;
    objc_setProperty_nonatomic_copy(v18, v21, newValue, 32);
    objc_setProperty_nonatomic_copy(v18, v22, v14, 40);
    objc_setProperty_nonatomic_copy(v18, v23, v15, 48);
    objc_setProperty_nonatomic_copy(v18, v24, v16, 56);
  }
  else
  {
  }
  [(_MSVSQLConnection *)self _registerAggregateFunctionDescriptor:v18];
}

- (void)unregisterFunctionNamed:(id)a3 arguments:(int64_t)a4
{
  id v6 = a3;
  connectionHandle = self->_connectionHandle;
  id v8 = v6;
  sqlite3_create_function_v2(connectionHandle, (const char *)[v8 UTF8String], a4, 1, 0, 0, 0, 0, 0);
  scalarFunctions = self->_scalarFunctions;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55___MSVSQLConnection_unregisterFunctionNamed_arguments___block_invoke;
  v18[3] = &unk_1E5ADA1E8;
  id v10 = v8;
  id v19 = v10;
  int64_t v20 = a4;
  int v11 = [(NSMutableArray *)scalarFunctions indexesOfObjectsPassingTest:v18];
  [(NSMutableArray *)self->_scalarFunctions removeObjectsAtIndexes:v11];
  aggregateFunctions = self->_aggregateFunctions;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55___MSVSQLConnection_unregisterFunctionNamed_arguments___block_invoke_2;
  v15[3] = &unk_1E5ADA210;
  id v16 = v10;
  int64_t v17 = a4;
  id v13 = v10;
  id v14 = [(NSMutableArray *)aggregateFunctions indexesOfObjectsPassingTest:v15];
  [(NSMutableArray *)self->_aggregateFunctions removeObjectsAtIndexes:v14];
}

- (void)_registerScalarFunctionDescriptor:(id)a3
{
  v4 = a3;
  connectionHandle = self->_connectionHandle;
  id v14 = v4;
  if (v4) {
    v4 = (void *)v4[1];
  }
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];
  if (v14)
  {
    int v8 = v14[4];
    uint64_t v9 = *((void *)v14 + 3);
    if (v9) {
      int v10 = 2049;
    }
    else {
      int v10 = 1;
    }
    if ((v9 & 2) != 0) {
      int v11 = v10;
    }
    else {
      int v11 = v10 | 0x80000;
    }
    unsigned int v12 = v11 & 0xFFDFFFFF | (((v9 >> 2) & 1) << 21);
    id v13 = (void *)*((void *)v14 + 4);
  }
  else
  {
    unsigned int v12 = 0;
    int v8 = 0;
    id v13 = 0;
  }
  sqlite3_create_function_v2(connectionHandle, v7, v8, v12, v13, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_scalarFunctionImplementation, 0, 0, _MSVSQLBridgeDestroy);

  [(NSMutableArray *)self->_scalarFunctions addObject:v14];
}

- (void)registerFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 block:(id)a6
{
  id newValue = a3;
  id v9 = a6;
  int v10 = objc_alloc_init(_MSVSQLDatabaseScalarFunctionDescriptor);
  unsigned int v12 = v10;
  if (v10)
  {
    objc_setProperty_nonatomic_copy(v10, v11, newValue, 8);
    v12->super._options = a5;
    objc_setProperty_nonatomic_copy(v12, v13, v9, 32);
  }
  [(_MSVSQLConnection *)self _registerScalarFunctionDescriptor:v12];
}

- (id)resultsForStatement:(id)a3
{
  id v5 = a3;
  if (self->_invalid)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:1251 description:@"Attempt to use invalidated connection."];
  }
  id v6 = -[MSVSQLRowEnumerator initWithStatement:]((id *)[MSVSQLRowEnumerator alloc], v5);

  return v6;
}

@end