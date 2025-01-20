@interface ICDMusicUserSocialProfileRequestContext
- (BOOL)isEqual:(id)a3;
- (ICDMusicUserSocialProfileRequestContext)initWithStoreRequestContext:(id)a3 subscriptionStatus:(id)a4;
- (ICMusicSubscriptionStatus)subscriptionStatus;
- (ICStoreRequestContext)storeRequestContext;
- (NSString)cacheKey;
- (NSString)hashedDSID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation ICDMusicUserSocialProfileRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_hashedDSID, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);

  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (NSString)hashedDSID
{
  return self->_hashedDSID;
}

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (unint64_t)hash
{
  return [(NSString *)self->_cacheKey hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [v4 cacheKey];
    v6 = [(ICDMusicUserSocialProfileRequestContext *)self cacheKey];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ICDMusicUserSocialProfileRequestContext allocWithZone:a3];
  storeRequestContext = self->_storeRequestContext;
  subscriptionStatus = self->_subscriptionStatus;

  return [(ICDMusicUserSocialProfileRequestContext *)v4 initWithStoreRequestContext:storeRequestContext subscriptionStatus:subscriptionStatus];
}

- (ICDMusicUserSocialProfileRequestContext)initWithStoreRequestContext:(id)a3 subscriptionStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v151.receiver = self;
  v151.super_class = (Class)ICDMusicUserSocialProfileRequestContext;
  v8 = [(ICDMusicUserSocialProfileRequestContext *)&v151 init];
  if (v8)
  {
    v9 = (ICStoreRequestContext *)[v6 copy];
    storeRequestContext = v8->_storeRequestContext;
    v8->_storeRequestContext = v9;

    objc_storeStrong((id *)&v8->_subscriptionStatus, a4);
    v150 = [(ICStoreRequestContext *)v8->_storeRequestContext identity];
    id v11 = [v150 accountDSID];
    memset(&v153, 0, sizeof(v153));
    uint64_t v152 = 4001;
    CC_SHA1_Init((CC_SHA1_CTX *)&v153);
    id v12 = v11;
    v13 = [v12 UTF8String];
    size_t v14 = (size_t)[v12 length];
    int v15 = v14;
    v16 = &ML3TrackPropertyLyrics_ptr;
    if (v152 > 3999)
    {
      if (v152 > 4255)
      {
        if (v152 == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)&v153, v13, v14);
        }
        else if (v152 == 4512)
        {
          CC_SHA512_Update(&v153, v13, v14);
        }
      }
      else if (v152 == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)&v153, v13, v14);
      }
      else if (v152 == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)&v153, v13, v14);
      }
    }
    else
    {
      if (v152 <= 2999)
      {
        if (v152)
        {
          if (v152 == 2000)
          {
            int v17 = (((v14 + BYTE3(v153.count[1])) & 3) - BYTE3(v153.count[1]));
            v18 = (char *)&v153.hash[-1] + BYTE3(v153.count[1]);
            switch(v17)
            {
              case 0:
                break;
              case 1:
                unsigned char *v18 = *v13;
                break;
              case 2:
                __int16 v38 = *(_WORD *)v13;
                goto LABEL_53;
              case 3:
                __int16 v38 = *(_WORD *)v13;
                *((unsigned char *)&v153.count[1] + BYTE3(v153.count[1]) + 2) = v13[2];
LABEL_53:
                *(_WORD *)v18 = v38;
                break;
              default:
                memcpy(v18, v13, (((v15 + BYTE3(v153.count[1])) & 3) - BYTE3(v153.count[1])));
                break;
            }
            HIDWORD(v153.count[0]) += v15;
          }
        }
        else
        {
          v20 = +[NSAssertionHandler currentHandler];
          v21 = +[NSString stringWithUTF8String:"void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)"];
          [v20 handleFailureInFunction:v21 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
        }
        goto LABEL_55;
      }
      if (v152 == 3000)
      {
        if (!v13) {
          goto LABEL_55;
        }
        BOOL v23 = v14 > 0xF || (LODWORD(v153.count[0]) + v14) > 0xF;
        LODWORD(v153.count[0]) += v14;
        HIDWORD(v153.count[0]) |= v23;
        if (v14 + LODWORD(v153.hash[3]) > 0xF)
        {
          v30 = &v13[v14];
          if (LODWORD(v153.hash[3]))
          {
            memcpy((char *)&v153.wbuf[-7] + LODWORD(v153.hash[3]), v13, (16 - LODWORD(v153.hash[3])));
            HIDWORD(v31) = LODWORD(v153.count[1]) - 2048144777 * LODWORD(v153.hash[1]);
            LODWORD(v31) = HIDWORD(v31);
            int v32 = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = HIDWORD(v153.count[1]) - 2048144777 * HIDWORD(v153.hash[1]);
            LODWORD(v31) = HIDWORD(v31);
            LODWORD(v153.count[1]) = v32;
            HIDWORD(v153.count[1]) = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = LODWORD(v153.hash[0]) - 2048144777 * LODWORD(v153.hash[2]);
            LODWORD(v31) = HIDWORD(v31);
            LODWORD(v153.hash[0]) = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = HIDWORD(v153.hash[0]) - 2048144777 * HIDWORD(v153.hash[2]);
            LODWORD(v31) = HIDWORD(v31);
            v13 += (16 - LODWORD(v153.hash[3]));
            HIDWORD(v153.hash[0]) = -1640531535 * (v31 >> 19);
            LODWORD(v153.hash[3]) = 0;
          }
          if (v13 <= v30 - 16)
          {
            unsigned int v33 = v153.count[1];
            unsigned int v34 = HIDWORD(v153.count[1]);
            unsigned int v35 = v153.hash[0];
            unsigned int v36 = HIDWORD(v153.hash[0]);
            do
            {
              HIDWORD(v37) = v33 - 2048144777 * *(_DWORD *)v13;
              LODWORD(v37) = HIDWORD(v37);
              unsigned int v33 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v34 - 2048144777 * *((_DWORD *)v13 + 1);
              LODWORD(v37) = HIDWORD(v37);
              unsigned int v34 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v35 - 2048144777 * *((_DWORD *)v13 + 2);
              LODWORD(v37) = HIDWORD(v37);
              unsigned int v35 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v36 - 2048144777 * *((_DWORD *)v13 + 3);
              LODWORD(v37) = HIDWORD(v37);
              unsigned int v36 = -1640531535 * (v37 >> 19);
              v13 += 16;
            }
            while (v13 <= v30 - 16);
            v153.count[1] = __PAIR64__(v34, v33);
            v153.hash[0] = __PAIR64__(v36, v35);
          }
          v16 = &ML3TrackPropertyLyrics_ptr;
          if (v13 >= v30) {
            goto LABEL_55;
          }
          int v24 = v30 - v13;
          __memcpy_chk();
        }
        else
        {
          memcpy((char *)&v153.wbuf[-7] + LODWORD(v153.hash[3]), v13, v14);
          int v24 = LODWORD(v153.hash[3]) + v15;
        }
        LODWORD(v153.hash[3]) = v24;
        goto LABEL_55;
      }
      if (v152 != 3001 || !v13) {
        goto LABEL_55;
      }
      v153.count[0] += v14;
      if (v14 + LODWORD(v153.hash[7]) <= 0x1F)
      {
        memcpy((char *)&v153.wbuf[-5] + LODWORD(v153.hash[7]), v13, v14);
        int v19 = LODWORD(v153.hash[7]) + v15;
LABEL_40:
        LODWORD(v153.hash[7]) = v19;
        goto LABEL_55;
      }
      unint64_t v25 = (unint64_t)&v13[v14];
      if (LODWORD(v153.hash[7]))
      {
        memcpy((char *)&v153.wbuf[-5] + LODWORD(v153.hash[7]), v13, (32 - LODWORD(v153.hash[7])));
        v153.count[1] = 0x9E3779B185EBCA87 * __ROR8__(v153.count[1] - 0x3D4D51C2D82B14B1 * v153.hash[3], 33);
        v153.hash[0] = 0x9E3779B185EBCA87 * __ROR8__(v153.hash[0] - 0x3D4D51C2D82B14B1 * v153.hash[4], 33);
        v153.hash[1] = 0x9E3779B185EBCA87 * __ROR8__(v153.hash[1] - 0x3D4D51C2D82B14B1 * v153.hash[5], 33);
        v153.hash[2] = 0x9E3779B185EBCA87 * __ROR8__(v153.hash[2] - 0x3D4D51C2D82B14B1 * v153.hash[6], 33);
        v13 += (32 - LODWORD(v153.hash[7]));
        LODWORD(v153.hash[7]) = 0;
      }
      if ((unint64_t)(v13 + 32) <= v25)
      {
        unint64_t v26 = v153.count[1];
        unint64_t v28 = v153.hash[1];
        unint64_t v29 = v153.hash[0];
        unint64_t v27 = v153.hash[2];
        do
        {
          unint64_t v26 = 0x9E3779B185EBCA87 * __ROR8__(v26 - 0x3D4D51C2D82B14B1 * *(void *)v13, 33);
          unint64_t v29 = 0x9E3779B185EBCA87 * __ROR8__(v29 - 0x3D4D51C2D82B14B1 * *((void *)v13 + 1), 33);
          unint64_t v28 = 0x9E3779B185EBCA87 * __ROR8__(v28 - 0x3D4D51C2D82B14B1 * *((void *)v13 + 2), 33);
          unint64_t v27 = 0x9E3779B185EBCA87 * __ROR8__(v27 - 0x3D4D51C2D82B14B1 * *((void *)v13 + 3), 33);
          v13 += 32;
        }
        while ((unint64_t)v13 <= v25 - 32);
        v153.count[1] = v26;
        v153.hash[0] = v29;
        v153.hash[1] = v28;
        v153.hash[2] = v27;
      }
      v16 = &ML3TrackPropertyLyrics_ptr;
      if ((unint64_t)v13 < v25)
      {
        int v19 = v25 - v13;
        __memcpy_chk();
        goto LABEL_40;
      }
    }
LABEL_55:

    memset(&v154[8], 0, 64);
    *(void *)v154 = v152;
    if (v152 > 3000)
    {
      if (v152 > 4000)
      {
        switch(v152)
        {
          case 4001:
            CC_SHA1_Final(&v154[8], (CC_SHA1_CTX *)&v153);
            break;
          case 4256:
            CC_SHA256_Final(&v154[8], (CC_SHA256_CTX *)&v153);
            break;
          case 4512:
            CC_SHA512_Final(&v154[8], &v153);
            break;
        }
        goto LABEL_102;
      }
      if (v152 != 3001)
      {
        if (v152 == 4000) {
          CC_MD5_Final(&v154[8], (CC_MD5_CTX *)&v153);
        }
LABEL_102:
        v155[0] = *(_OWORD *)v154;
        v155[1] = *(_OWORD *)&v154[16];
        v155[2] = *(_OWORD *)&v154[32];
        v155[3] = *(_OWORD *)&v154[48];
        uint64_t v156 = *(void *)&v154[64];
        if (*(uint64_t *)v154 > 3999)
        {
          if (*(uint64_t *)v154 > 4255)
          {
            if (*(void *)v154 == 4256)
            {
              v134 = (unsigned __int8 *)v155 + 8;
              v135 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v136 = v135;
              for (uint64_t i = 0; i != 64; i += 2)
              {
                unsigned int v138 = *v134++;
                v139 = &v135[i];
                char *v139 = a0123456789abcd[(unint64_t)v138 >> 4];
                v139[1] = a0123456789abcd[v138 & 0xF];
              }
              id v105 = objc_alloc((Class)v16[250]);
              v106 = v136;
              uint64_t v107 = 64;
            }
            else
            {
              if (*(void *)v154 != 4512) {
                goto LABEL_150;
              }
              v112 = (unsigned __int8 *)v155 + 8;
              v113 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v114 = v113;
              for (uint64_t j = 0; j != 128; j += 2)
              {
                unsigned int v116 = *v112++;
                v117 = &v113[j];
                char *v117 = a0123456789abcd[(unint64_t)v116 >> 4];
                v117[1] = a0123456789abcd[v116 & 0xF];
              }
              id v105 = objc_alloc((Class)v16[250]);
              v106 = v114;
              uint64_t v107 = 128;
            }
          }
          else if (*(void *)v154 == 4000)
          {
            v124 = (unsigned __int8 *)v155 + 8;
            v125 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            v126 = v125;
            for (uint64_t k = 0; k != 32; k += 2)
            {
              unsigned int v128 = *v124++;
              v129 = &v125[k];
              char *v129 = a0123456789abcd[(unint64_t)v128 >> 4];
              v129[1] = a0123456789abcd[v128 & 0xF];
            }
            id v105 = objc_alloc((Class)v16[250]);
            v106 = v126;
            uint64_t v107 = 32;
          }
          else
          {
            if (*(void *)v154 != 4001) {
              goto LABEL_150;
            }
            v99 = (unsigned __int8 *)v155 + 8;
            v100 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v101 = v100;
            for (uint64_t m = 0; m != 40; m += 2)
            {
              unsigned int v103 = *v99++;
              v104 = &v100[m];
              char *v104 = a0123456789abcd[(unint64_t)v103 >> 4];
              v104[1] = a0123456789abcd[v103 & 0xF];
            }
            id v105 = objc_alloc((Class)v16[250]);
            v106 = v101;
            uint64_t v107 = 40;
          }
        }
        else
        {
          if (*(uint64_t *)v154 <= 2999)
          {
            if (*(void *)v154 == 1000)
            {
              uint64_t v118 = *((void *)&v155[0] + 1);
              v119 = (char *)v158 + 1;
              uint64_t quot = *((void *)&v155[0] + 1);
              do
              {
                lldiv_t v121 = lldiv(quot, 10);
                uint64_t quot = v121.quot;
                if (v121.rem >= 0) {
                  LOBYTE(v122) = v121.rem;
                }
                else {
                  uint64_t v122 = -v121.rem;
                }
                *(v119 - 2) = v122 + 48;
                v98 = (const UInt8 *)(v119 - 2);
                --v119;
              }
              while (v121.quot);
              if (v118 < 0)
              {
                *(v119 - 2) = 45;
                v98 = (const UInt8 *)(v119 - 2);
              }
              v97 = (char *)((char *)v158 - (char *)v98);
              goto LABEL_136;
            }
            if (*(void *)v154 == 2000)
            {
              uint64_t v93 = DWORD2(v155[0]);
              v94 = v158;
              do
              {
                ldiv_t v95 = ldiv(v93, 10);
                uint64_t v93 = v95.quot;
                if (v95.rem >= 0) {
                  LOBYTE(v96) = v95.rem;
                }
                else {
                  uint64_t v96 = -v95.rem;
                }
                *((unsigned char *)v94 - 1) = v96 + 48;
                v94 = (void *)((char *)v94 - 1);
              }
              while (v95.quot);
              v97 = (char *)((char *)v158 - (char *)v94);
              v98 = (const UInt8 *)v94;
LABEL_136:
              CFStringRef v123 = CFStringCreateWithBytes(0, v98, (CFIndex)v97, 0x8000100u, 0);
LABEL_147:
              CFStringRef v140 = v123;
LABEL_148:

              hashedDSID = v8->_hashedDSID;
              v8->_hashedDSID = &v140->isa;

              v142 = v16[250];
              v143 = v8->_hashedDSID;
              v144 = +[NSNumber numberWithInteger:[(ICMusicSubscriptionStatus *)v8->_subscriptionStatus statusType]];
              uint64_t v145 = [v142 stringWithFormat:@"%@-%@", v143, v144];
              cacheKey = v8->_cacheKey;
              v8->_cacheKey = (NSString *)v145;

              goto LABEL_149;
            }
LABEL_150:
            v148 = +[NSAssertionHandler currentHandler];
            v149 = [v16[250] stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
            [v148 handleFailureInFunction:v149 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

            CFStringRef v140 = &stru_1001BF9F0;
            goto LABEL_148;
          }
          if (*(void *)v154 == 3000)
          {
            LODWORD(v157[0]) = bswap32(DWORD2(v155[0]));
            v130 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v131 = 0;
            v132 = v130 + 1;
            do
            {
              unint64_t v133 = *((unsigned __int8 *)v157 + v131);
              *(v132 - 1) = a0123456789abcd[v133 >> 4];
              unsigned char *v132 = a0123456789abcd[v133 & 0xF];
              v132 += 2;
              ++v131;
            }
            while (v131 != 4);
            id v105 = objc_alloc((Class)v16[250]);
            v106 = v130;
            uint64_t v107 = 8;
          }
          else
          {
            if (*(void *)v154 != 3001) {
              goto LABEL_150;
            }
            v157[0] = bswap64(*((unint64_t *)&v155[0] + 1));
            v108 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v109 = 0;
            v110 = v108 + 1;
            do
            {
              unint64_t v111 = *((unsigned __int8 *)v157 + v109);
              *(v110 - 1) = a0123456789abcd[v111 >> 4];
              unsigned char *v110 = a0123456789abcd[v111 & 0xF];
              v110 += 2;
              ++v109;
            }
            while (v109 != 8);
            id v105 = objc_alloc((Class)v16[250]);
            v106 = v108;
            uint64_t v107 = 16;
          }
        }
        CFStringRef v123 = (CFStringRef)[v105 initWithBytesNoCopy:v106 length:v107 encoding:4 freeWhenDone:1];
        goto LABEL_147;
      }
      if (v153.count[0] < 0x20) {
        CC_LONG64 v74 = v153.hash[1] + 0x27D4EB2F165667C5;
      }
      else {
        CC_LONG64 v74 = 0x9E3779B185EBCA87
      }
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((0x9E3779B185EBCA87
                  * ((__ROR8__(v153.hash[0], 57)
                    + __ROR8__(v153.count[1], 63)
                    + __ROR8__(v153.hash[1], 52)
                    + __ROR8__(v153.hash[2], 46)) ^ (0x9E3779B185EBCA87
                                                   * __ROR8__(0xC2B2AE3D27D4EB4FLL * v153.count[1], 33)))
                  - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v153.hash[0], 33)))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v153.hash[1], 33)))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v153.hash[2], 33)))
            - 0x7A1435883D4D519DLL;
      unint64_t v75 = v74 + v153.count[0];
      v76 = &v153.hash[3];
      unint64_t v77 = v153.count[0] & 0x1F;
      if (v77 >= 8)
      {
        do
        {
          uint64_t v78 = *v76++;
          unint64_t v75 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v78, 33)) ^ v75, 37);
          v77 -= 8;
        }
        while (v77 > 7);
      }
      if (v77 >= 4)
      {
        unsigned int v79 = *(_DWORD *)v76;
        v76 = (CC_LONG64 *)((char *)v76 + 4);
        unint64_t v75 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v79) ^ v75, 41);
        v77 -= 4;
      }
      for (; v77; --v77)
      {
        unsigned int v80 = *(unsigned __int8 *)v76;
        v76 = (CC_LONG64 *)((char *)v76 + 1);
        unint64_t v75 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v80) ^ v75, 53);
      }
      unint64_t v81 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v75 ^ (v75 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v75 ^ (v75 >> 33))) >> 29));
      CC_LONG64 v69 = v81 ^ HIDWORD(v81);
LABEL_89:
      *(void *)&v154[8] = v69;
      goto LABEL_102;
    }
    if (v152 <= 1999)
    {
      if (!v152)
      {
        v71 = +[NSAssertionHandler currentHandler];
        v72 = [v16[250] stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v71 handleFailureInFunction:v72 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

        goto LABEL_102;
      }
      if (v152 != 1000) {
        goto LABEL_102;
      }
      CC_LONG64 v39 = (v153.count[0] + v153.count[1]) ^ __ROR8__(v153.count[1], 51);
      CC_LONG64 v40 = v153.hash[0] + (v153.hash[1] ^ v153.hash[2]);
      uint64_t v41 = __ROR8__(v153.hash[1] ^ v153.hash[2], 48);
      CC_LONG64 v42 = (v40 ^ v41) + __ROR8__(v153.count[0] + v153.count[1], 32);
      CC_LONG64 v43 = v42 ^ __ROR8__(v40 ^ v41, 43);
      CC_LONG64 v44 = v40 + v39;
      CC_LONG64 v45 = v44 ^ __ROR8__(v39, 47);
      CC_LONG64 v46 = (v42 ^ v153.hash[2]) + v45;
      CC_LONG64 v47 = v46 ^ __ROR8__(v45, 51);
      CC_LONG64 v48 = (__ROR8__(v44, 32) ^ 0xFFLL) + v43;
      uint64_t v49 = __ROR8__(v43, 48);
      uint64_t v50 = __ROR8__(v46, 32) + (v48 ^ v49);
      uint64_t v51 = v50 ^ __ROR8__(v48 ^ v49, 43);
      CC_LONG64 v52 = v47 + v48;
      CC_LONG64 v53 = v52 ^ __ROR8__(v47, 47);
      CC_LONG64 v54 = v53 + v50;
      uint64_t v55 = v54 ^ __ROR8__(v53, 51);
      uint64_t v56 = __ROR8__(v52, 32) + v51;
      uint64_t v57 = __ROR8__(v51, 48);
      uint64_t v58 = __ROR8__(v54, 32) + (v56 ^ v57);
      uint64_t v59 = v58 ^ __ROR8__(v56 ^ v57, 43);
      uint64_t v60 = v55 + v56;
      uint64_t v61 = v60 ^ __ROR8__(v55, 47);
      uint64_t v62 = v61 + v58;
      uint64_t v63 = v62 ^ __ROR8__(v61, 51);
      uint64_t v64 = __ROR8__(v60, 32) + v59;
      uint64_t v65 = __ROR8__(v59, 48);
      CC_LONG64 v66 = __ROR8__(v62, 32) + (v64 ^ v65);
      CC_LONG64 v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
      uint64_t v68 = v63 + v64;
      v153.count[0] = v66;
      v153.count[1] = v68 ^ __ROR8__(v63, 47);
      v153.hash[0] = __ROR8__(v68, 32);
      v153.hash[1] = v67;
      CC_LONG64 v69 = v153.count[1] ^ v66 ^ v153.hash[0] ^ v67;
      goto LABEL_89;
    }
    if (v152 != 2000)
    {
      if (v152 != 3000) {
        goto LABEL_102;
      }
      if (HIDWORD(v153.count[0])) {
        int v70 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v153.count[1], (uint32x4_t)xmmword_100152460), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v153.count[1], (uint32x4_t)xmmword_100152450)));
      }
      else {
        int v70 = LODWORD(v153.hash[0]) + 374761393;
      }
      unsigned int v82 = LODWORD(v153.count[0]) + v70;
      v83 = &v153.hash[1];
      unint64_t v84 = v153.hash[3] & 0xF;
      if (v84 >= 4)
      {
        do
        {
          int v85 = *(_DWORD *)v83;
          v83 = (CC_LONG64 *)((char *)v83 + 4);
          HIDWORD(v86) = v82 - 1028477379 * v85;
          LODWORD(v86) = HIDWORD(v86);
          unsigned int v82 = 668265263 * (v86 >> 15);
          v84 -= 4;
        }
        while (v84 > 3);
      }
      for (; v84; --v84)
      {
        int v87 = *(unsigned __int8 *)v83;
        v83 = (CC_LONG64 *)((char *)v83 + 1);
        HIDWORD(v88) = v82 + 374761393 * v87;
        LODWORD(v88) = HIDWORD(v88);
        unsigned int v82 = -1640531535 * (v88 >> 21);
      }
      unsigned int v89 = (-2048144777 * (v82 ^ (v82 >> 15))) ^ ((-2048144777 * (v82 ^ (v82 >> 15))) >> 13);
      unsigned int v90 = (-1028477379 * v89) ^ ((-1028477379 * v89) >> 16);
      goto LABEL_101;
    }
    switch(BYTE3(v153.count[1]))
    {
      case 1u:
        int v73 = LOBYTE(v153.count[1]);
        break;
      case 2u:
        int v73 = LOWORD(v153.count[1]);
        break;
      case 3u:
        int v73 = LOWORD(v153.count[1]) | (BYTE2(v153.count[1]) << 16);
        break;
      default:
        unsigned int v91 = v153.count[0];
        goto LABEL_100;
    }
    unsigned int v91 = (461845907 * ((380141568 * v73) | ((-862048943 * v73) >> 17))) ^ LODWORD(v153.count[0]);
LABEL_100:
    unsigned int v92 = -2048144789 * (v91 ^ HIDWORD(v153.count[0]) ^ ((v91 ^ HIDWORD(v153.count[0])) >> 16));
    unsigned int v90 = (-1028477387 * (v92 ^ (v92 >> 13))) ^ ((-1028477387 * (v92 ^ (v92 >> 13))) >> 16);
    LODWORD(v153.count[0]) = v90;
LABEL_101:
    *(_DWORD *)&v154[8] = v90;
    goto LABEL_102;
  }
LABEL_149:

  return v8;
}

@end