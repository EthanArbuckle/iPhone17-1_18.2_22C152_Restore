@interface MRDMusicUserStateCenter
+ (MRDMusicUserStateCenter)sharedCenter;
- (BOOL)cachedStateLoaded;
- (BOOL)isMusicAppInstalled;
- (MRDMediaUserState)localActiveUserState;
- (MRDMusicUserStateCenter)init;
- (MRUserIdentity)localActiveIdentity;
- (NSArray)localUserIdentities;
- (NSArray)localUserStates;
- (NSMutableDictionary)dsidToPendingCompletionMap;
- (NSMutableSet)finishedWaitingForCloudStateDSIDs;
- (NSString)musicApplicationBundleIdentifier;
- (id)identityForHomeUserIdentifier:(id)a3;
- (id)identityForUserState:(id)a3;
- (id)privacyObserver;
- (id)stateCenter;
- (os_unfair_lock_s)lock;
- (void)checkPendingIdentityCompletions;
- (void)handleRegisteredApplicationsChangedNotification:(id)a3;
- (void)handleiTunesNotification:(id)a3;
- (void)postCloudStateChanged;
- (void)registerNotifications;
- (void)setDsidToPendingCompletionMap:(id)a3;
- (void)setFinishedWaitingForCloudStateDSIDs:(id)a3;
- (void)setPrivacyObserver:(id)a3;
- (void)updateIsMusicAppInstalled;
- (void)userIdentityForDSID:(id)a3 completion:(id)a4;
@end

@implementation MRDMusicUserStateCenter

+ (MRDMusicUserStateCenter)sharedCenter
{
  if (qword_10047DEE8 != -1) {
    dispatch_once(&qword_10047DEE8, &stru_100417220);
  }
  v2 = (void *)qword_10047DEF0;

  return (MRDMusicUserStateCenter *)v2;
}

- (MRDMusicUserStateCenter)init
{
  v12.receiver = self;
  v12.super_class = (Class)MRDMusicUserStateCenter;
  v2 = [(MRDMusicUserStateCenter *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableSet set];
    finishedWaitingForCloudStateDSIDs = v3->_finishedWaitingForCloudStateDSIDs;
    v3->_finishedWaitingForCloudStateDSIDs = (NSMutableSet *)v4;

    uint64_t v6 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    musicApplicationBundleIdentifier = v3->_musicApplicationBundleIdentifier;
    v3->_musicApplicationBundleIdentifier = (NSString *)v6;

    [(MRDMusicUserStateCenter *)v3 registerNotifications];
    v8 = MRGroupSessionSubsystemGetQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003CF94;
    block[3] = &unk_100415CC8;
    v11 = v3;
    dispatch_async(v8, block);
  }
  return v3;
}

- (void)registerNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleiTunesNotification:" name:ICMediaUserStateCenterUserStatesDidChangeNotification object:0];

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleiTunesNotification:" name:ICMusicUserStateGroupSessionCapabilityChangedNotification object:0];

  v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleRegisteredApplicationsChangedNotification:" name:@"com.apple.LaunchServices.applicationRegistered" object:0 suspensionBehavior:3];

  id v6 = +[NSDistributedNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"handleRegisteredApplicationsChangedNotification:" name:@"com.apple.LaunchServices.applicationUnregistered" object:0 suspensionBehavior:3];
}

- (void)userIdentityForDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = [(MRDMusicUserStateCenter *)self stateCenter];
  v10 = [v9 allUserStates];
  v144[0] = _NSConcreteStackBlock;
  v144[1] = 3221225472;
  v144[2] = sub_10003E1C8;
  v144[3] = &unk_100417248;
  id v11 = v6;
  id v145 = v11;
  objc_super v12 = objc_msgSend(v10, "msv_firstWhere:", v144);

  v13 = [v12 music];
  v14 = v13;
  if (!v13)
  {
    v25 = [(MRDMusicUserStateCenter *)self finishedWaitingForCloudStateDSIDs];
    unsigned __int8 v26 = [v25 containsObject:v11];

    if ((v26 & 1) == 0)
    {
      v27 = _MRLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[MRDMusicUserStateCenter] No music user state for dsid: %@. Will wait for user state update.", buf, 0xCu);
      }
    }
    goto LABEL_116;
  }
  v141 = v12;
  v15 = [v13 userProfile];
  v16 = [v15 socialProfile];
  v17 = [v16 socialProfileID];

  if (v17)
  {
    id v140 = v7;
    v18 = [v14 userProfile];
    v19 = [(__CFString *)v18 socialProfile];
    v20 = [v19 socialProfileID];
    v21 = [v14 userProfile];
    v22 = [v21 socialProfile];
    v23 = [v22 name];
    v24 = +[MRUserIdentity resolvableIdentityWithIdentifier:v20 displayName:v23];

    goto LABEL_114;
  }
  v28 = [v14 userProfile];
  v29 = [v28 name];

  p_locuint64_t k = &self->_lock;
  objc_super v12 = v141;
  if (!v29) {
    goto LABEL_116;
  }
  id v140 = v7;
  v30 = _MRLogForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[MRDMusicUserStateCenter] No social profile for dsid: %@. Will use basic identity.", buf, 0xCu);
  }

  id v31 = v11;
  long long v158 = 0u;
  long long v157 = 0u;
  long long v156 = 0u;
  long long v155 = 0u;
  long long v154 = 0u;
  long long v153 = 0u;
  long long v152 = 0u;
  long long v151 = 0u;
  long long v150 = 0u;
  long long v149 = 0u;
  long long v148 = 0u;
  long long v147 = 0u;
  *(_OWORD *)&buf[8] = 0u;
  *(void *)buf = 4001;
  CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
  id v32 = v31;
  v33 = [v32 UTF8String];
  id v34 = [v32 length];
  int v35 = (int)v34;
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(void *)buf == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v33, (CC_LONG)v34);
      }
      else if (*(void *)buf == 4512)
      {
        CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v33, (CC_LONG)v34);
      }
    }
    else if (*(void *)buf == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&buf[8], v33, (CC_LONG)v34);
    }
    else if (*(void *)buf == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v33, (CC_LONG)v34);
    }
  }
  else if (*(uint64_t *)buf > 2999)
  {
    if (*(void *)buf == 3000)
    {
      sub_1000411AC(&buf[8], v33, (size_t)v34);
    }
    else if (*(void *)buf == 3001)
    {
      sub_10004135C(&buf[8], v33, (size_t)v34);
    }
  }
  else if (*(void *)buf)
  {
    if (*(void *)buf == 2000)
    {
      int v36 = ((((_BYTE)v34 + buf[19]) & 3) - buf[19]);
      v37 = &buf[buf[19] + 16];
      switch(v36)
      {
        case 0:
          break;
        case 1:
          unsigned char *v37 = *v33;
          break;
        case 2:
          __int16 v40 = *(_WORD *)v33;
          goto LABEL_34;
        case 3:
          __int16 v40 = *(_WORD *)v33;
          buf[buf[19] + 18] = v33[2];
LABEL_34:
          *(_WORD *)v37 = v40;
          break;
        default:
          memcpy(v37, v33, (((v35 + buf[19]) & 3) - buf[19]));
          break;
      }
      *(_DWORD *)&buf[12] += v35;
    }
  }
  else
  {
    v38 = +[NSAssertionHandler currentHandler];
    v39 = +[NSString stringWithUTF8String:"void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)"];
    [v38 handleFailureInFunction:v39 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
  }
  memset(&v159[8], 0, 64);
  *(void *)v159 = *(void *)buf;
  if (*(uint64_t *)buf > 3000)
  {
    if (*(uint64_t *)buf <= 4000)
    {
      if (*(void *)buf == 3001)
      {
        *(void *)&v159[8] = sub_1000415C4(&buf[8]);
      }
      else if (*(void *)buf == 4000)
      {
        CC_MD5_Final(&v159[8], (CC_MD5_CTX *)&buf[8]);
      }
    }
    else
    {
      switch(*(void *)buf)
      {
        case 0xFA1:
          CC_SHA1_Final(&v159[8], (CC_SHA1_CTX *)&buf[8]);
          break;
        case 0x10A0:
          CC_SHA256_Final(&v159[8], (CC_SHA256_CTX *)&buf[8]);
          break;
        case 0x11A0:
          CC_SHA512_Final(&v159[8], (CC_SHA512_CTX *)&buf[8]);
          break;
      }
    }
    goto LABEL_65;
  }
  if (*(uint64_t *)buf <= 1999)
  {
    if (*(void *)buf)
    {
      if (*(void *)buf == 1000)
      {
        uint64_t v41 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
        uint64_t v42 = v147 + (*((void *)&v147 + 1) ^ v148);
        uint64_t v43 = __ROR8__(*((void *)&v147 + 1) ^ v148, 48);
        uint64_t v44 = (v42 ^ v43) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
        uint64_t v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
        uint64_t v46 = v42 + v41;
        uint64_t v47 = v46 ^ __ROR8__(v41, 47);
        uint64_t v48 = (v44 ^ v148) + v47;
        uint64_t v49 = v48 ^ __ROR8__(v47, 51);
        uint64_t v50 = (__ROR8__(v46, 32) ^ 0xFFLL) + v45;
        uint64_t v51 = __ROR8__(v45, 48);
        uint64_t v52 = __ROR8__(v48, 32) + (v50 ^ v51);
        uint64_t v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
        uint64_t v54 = v49 + v50;
        uint64_t v55 = v54 ^ __ROR8__(v49, 47);
        uint64_t v56 = v55 + v52;
        uint64_t v57 = v56 ^ __ROR8__(v55, 51);
        uint64_t v58 = __ROR8__(v54, 32) + v53;
        uint64_t v59 = __ROR8__(v53, 48);
        uint64_t v60 = __ROR8__(v56, 32) + (v58 ^ v59);
        uint64_t v61 = v60 ^ __ROR8__(v58 ^ v59, 43);
        uint64_t v62 = v57 + v58;
        uint64_t v63 = v62 ^ __ROR8__(v57, 47);
        uint64_t v64 = v63 + v60;
        uint64_t v65 = v64 ^ __ROR8__(v63, 51);
        uint64_t v66 = __ROR8__(v62, 32) + v61;
        uint64_t v67 = __ROR8__(v61, 48);
        uint64_t v68 = __ROR8__(v64, 32) + (v66 ^ v67);
        uint64_t v69 = v68 ^ __ROR8__(v66 ^ v67, 43);
        uint64_t v70 = v65 + v66;
        *(void *)&buf[8] = v68;
        *(void *)&buf[16] = v70 ^ __ROR8__(v65, 47);
        *(void *)&long long v147 = __ROR8__(v70, 32);
        *((void *)&v147 + 1) = v69;
        *(void *)&v159[8] = *(void *)&buf[16] ^ v68 ^ v147 ^ v69;
      }
    }
    else
    {
      v71 = +[NSAssertionHandler currentHandler];
      v72 = +[NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
      [v71 handleFailureInFunction:v72 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
    }
    goto LABEL_65;
  }
  if (*(void *)buf == 2000)
  {
    switch(buf[19])
    {
      case 1:
        int v73 = buf[16];
        break;
      case 2:
        int v73 = *(unsigned __int16 *)&buf[16];
        break;
      case 3:
        int v73 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
        break;
      default:
        unsigned int v74 = *(_DWORD *)&buf[8];
        goto LABEL_64;
    }
    unsigned int v74 = (461845907 * ((380141568 * v73) | ((-862048943 * v73) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_64:
    unsigned int v75 = -2048144789 * (v74 ^ *(_DWORD *)&buf[12] ^ ((v74 ^ *(_DWORD *)&buf[12]) >> 16));
    *(_DWORD *)&buf[8] = (-1028477387 * (v75 ^ (v75 >> 13))) ^ ((-1028477387 * (v75 ^ (v75 >> 13))) >> 16);
    *(_DWORD *)&v159[8] = *(_DWORD *)&buf[8];
    goto LABEL_65;
  }
  if (*(void *)buf == 3000) {
    *(_DWORD *)&v159[8] = sub_1000414F4((uint64_t)&buf[8]);
  }
LABEL_65:
  v160[0] = *(_OWORD *)v159;
  v160[1] = *(_OWORD *)&v159[16];
  v160[2] = *(_OWORD *)&v159[32];
  v160[3] = *(_OWORD *)&v159[48];
  uint64_t v161 = *(void *)&v159[64];
  if (*(uint64_t *)v159 > 3999)
  {
    if (*(uint64_t *)v159 > 4255)
    {
      if (*(void *)v159 == 4256)
      {
        v116 = (unsigned __int8 *)v160 + 8;
        v117 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v118 = v117;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v120 = *v116++;
          v121 = &v117[i];
          char *v121 = a0123456789abcd_0[(unint64_t)v120 >> 4];
          v121[1] = a0123456789abcd_0[v120 & 0xF];
        }
        id v88 = objc_alloc((Class)NSString);
        v89 = v118;
        uint64_t v90 = 64;
      }
      else
      {
        if (*(void *)v159 != 4512) {
          goto LABEL_108;
        }
        v95 = (unsigned __int8 *)v160 + 8;
        v96 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v97 = v96;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v99 = *v95++;
          v100 = &v96[j];
          char *v100 = a0123456789abcd_0[(unint64_t)v99 >> 4];
          v100[1] = a0123456789abcd_0[v99 & 0xF];
        }
        id v88 = objc_alloc((Class)NSString);
        v89 = v97;
        uint64_t v90 = 128;
      }
    }
    else if (*(void *)v159 == 4000)
    {
      v106 = (unsigned __int8 *)v160 + 8;
      v107 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v108 = v107;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v110 = *v106++;
        v111 = &v107[k];
        char *v111 = a0123456789abcd_0[(unint64_t)v110 >> 4];
        v111[1] = a0123456789abcd_0[v110 & 0xF];
      }
      id v88 = objc_alloc((Class)NSString);
      v89 = v108;
      uint64_t v90 = 32;
    }
    else
    {
      if (*(void *)v159 != 4001) {
        goto LABEL_108;
      }
      v82 = (unsigned __int8 *)v160 + 8;
      v83 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v84 = v83;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v86 = *v82++;
        v87 = &v83[m];
        char *v87 = a0123456789abcd_0[(unint64_t)v86 >> 4];
        v87[1] = a0123456789abcd_0[v86 & 0xF];
      }
      id v88 = objc_alloc((Class)NSString);
      v89 = v84;
      uint64_t v90 = 40;
    }
LABEL_107:
    CFStringRef v122 = (CFStringRef)[v88 initWithBytesNoCopy:v89 length:v90 encoding:4 freeWhenDone:1];
LABEL_112:
    v18 = (__CFString *)v122;
    goto LABEL_113;
  }
  if (*(uint64_t *)v159 > 2999)
  {
    if (*(void *)v159 == 3000)
    {
      LODWORD(v162[0]) = bswap32(DWORD2(v160[0]));
      v112 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v113 = 0;
      v114 = v112 + 1;
      do
      {
        unint64_t v115 = *((unsigned __int8 *)v162 + v113);
        *(v114 - 1) = a0123456789abcd_0[v115 >> 4];
        unsigned char *v114 = a0123456789abcd_0[v115 & 0xF];
        v114 += 2;
        ++v113;
      }
      while (v113 != 4);
      id v88 = objc_alloc((Class)NSString);
      v89 = v112;
      uint64_t v90 = 8;
    }
    else
    {
      if (*(void *)v159 != 3001) {
        goto LABEL_108;
      }
      v162[0] = bswap64(*((unint64_t *)&v160[0] + 1));
      v91 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v92 = 0;
      v93 = v91 + 1;
      do
      {
        unint64_t v94 = *((unsigned __int8 *)v162 + v92);
        *(v93 - 1) = a0123456789abcd_0[v94 >> 4];
        unsigned char *v93 = a0123456789abcd_0[v94 & 0xF];
        v93 += 2;
        ++v92;
      }
      while (v92 != 8);
      id v88 = objc_alloc((Class)NSString);
      v89 = v91;
      uint64_t v90 = 16;
    }
    goto LABEL_107;
  }
  if (*(void *)v159 == 1000)
  {
    uint64_t v101 = *((void *)&v160[0] + 1);
    v102 = (UInt8 *)&v163;
    uint64_t quot = *((void *)&v160[0] + 1);
    do
    {
      lldiv_t v104 = lldiv(quot, 10);
      uint64_t quot = v104.quot;
      if (v104.rem >= 0) {
        LOBYTE(v105) = v104.rem;
      }
      else {
        uint64_t v105 = -v104.rem;
      }
      *v102-- = v105 + 48;
    }
    while (v104.quot);
    if (v101 < 0) {
      UInt8 *v102 = 45;
    }
    else {
      ++v102;
    }
    CFIndex v80 = (char *)v164 - (char *)v102;
    v81 = v102;
    goto LABEL_111;
  }
  if (*(void *)v159 == 2000)
  {
    uint64_t v76 = 0;
    uint64_t v77 = DWORD2(v160[0]);
    do
    {
      ldiv_t v78 = ldiv(v77, 10);
      uint64_t v77 = v78.quot;
      if (v78.rem >= 0) {
        LOBYTE(v79) = v78.rem;
      }
      else {
        uint64_t v79 = -v78.rem;
      }
      *(&v163 + v76--) = v79 + 48;
    }
    while (v78.quot);
    CFIndex v80 = -v76;
    v81 = (const UInt8 *)v164 + v76;
LABEL_111:
    CFStringRef v122 = CFStringCreateWithBytes(0, v81, v80, 0x8000100u, 0);
    goto LABEL_112;
  }
LABEL_108:
  v123 = +[NSAssertionHandler currentHandler];
  v124 = +[NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
  [v123 handleFailureInFunction:v124 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

  v18 = &stru_10042ACB0;
LABEL_113:

  v19 = [(__CFString *)v18 substringToIndex:7];
  v20 = [v14 userProfile];
  v21 = [v20 name];
  v24 = +[MRUserIdentity basicIdentityWithIdentifier:v19 displayName:v21];
LABEL_114:

  id v7 = v140;
  p_locuint64_t k = &self->_lock;
  objc_super v12 = v141;
  if (v24)
  {
    os_unfair_lock_unlock(&self->_lock);
    (*((void (**)(id, void *, void))v140 + 2))(v140, v24, 0);
LABEL_124:

    goto LABEL_125;
  }
LABEL_116:
  v125 = [(MRDMusicUserStateCenter *)self finishedWaitingForCloudStateDSIDs];
  unsigned __int8 v126 = [v125 containsObject:v11];

  if ((v126 & 1) == 0)
  {
    v127 = [(MRDMusicUserStateCenter *)self dsidToPendingCompletionMap];

    if (!v127)
    {
      v128 = +[NSMutableDictionary dictionary];
      [(MRDMusicUserStateCenter *)self setDsidToPendingCompletionMap:v128];
    }
    v129 = [(MRDMusicUserStateCenter *)self dsidToPendingCompletionMap];
    v130 = [v129 objectForKeyedSubscript:v11];

    if (!v130)
    {
      v131 = +[NSMutableArray array];
      v132 = [(MRDMusicUserStateCenter *)self dsidToPendingCompletionMap];
      [v132 setObject:v131 forKeyedSubscript:v11];

      dispatch_time_t v133 = dispatch_time(0, 5000000000);
      v134 = MRGroupSessionSubsystemGetQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003E238;
      block[3] = &unk_1004158D8;
      void block[4] = self;
      id v143 = v11;
      dispatch_after(v133, v134, block);
    }
    v135 = [(MRDMusicUserStateCenter *)self dsidToPendingCompletionMap];
    v136 = [v135 objectForKeyedSubscript:v11];
    id v137 = objc_retainBlock(v7);
    [v136 addObject:v137];
  }
  os_unfair_lock_unlock(p_lock);
  v138 = [(MRDMusicUserStateCenter *)self finishedWaitingForCloudStateDSIDs];
  unsigned int v139 = [v138 containsObject:v11];

  if (v139)
  {
    v24 = +[NSError msv_errorWithDomain:MRGroupSessionError code:4 debugDescription:@"No identity found for dsid."];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v24);
    goto LABEL_124;
  }
LABEL_125:
}

- (void)checkPendingIdentityCompletions
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v145 = self;
  uint64_t v4 = [(MRDMusicUserStateCenter *)self dsidToPendingCompletionMap];
  id v5 = [v4 count];

  if (v5)
  {
    unsigned int v139 = p_lock;
    id v6 = [(MRDMusicUserStateCenter *)v145 stateCenter];
    id v7 = [v6 allUserStates];

    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    obuint64_t j = v7;
    id v8 = [obj countByEnumeratingWithState:&v149 objects:v153 count:16];
    if (!v8) {
      goto LABEL_132;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v150;
    uint64_t v141 = *(void *)v150;
    while (1)
    {
      id v11 = 0;
      id v140 = v9;
      do
      {
        if (*(void *)v150 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = *(void **)(*((void *)&v149 + 1) + 8 * (void)v11);
        v13 = [v12 dsid];

        if (v13)
        {
          v14 = [v12 dsid];
          v15 = [v14 stringValue];

          v16 = [(MRDMusicUserStateCenter *)v145 dsidToPendingCompletionMap];
          v17 = [v16 objectForKeyedSubscript:v15];

          if (!v17) {
            goto LABEL_129;
          }
          v18 = [v12 music];
          v19 = v18;
          if (!v18) {
            goto LABEL_128;
          }
          v144 = v15;
          v20 = [v18 userProfile];
          v21 = [v20 socialProfile];
          v22 = [v21 socialProfileID];

          if (v22)
          {
            v23 = [v19 userProfile];
            v24 = [(__CFString *)v23 socialProfile];
            v25 = [v24 socialProfileID];
            v142 = v19;
            unsigned __int8 v26 = [v19 userProfile];
            v27 = [v26 socialProfile];
            v28 = [v27 name];
            v29 = +[MRUserIdentity resolvableIdentityWithIdentifier:v25 displayName:v28];

            v30 = v23;
            id v9 = v140;
            v15 = v144;
LABEL_126:

            uint64_t v10 = v141;
            v19 = v142;
            if (v29)
            {
              v136 = [(MRDMusicUserStateCenter *)v145 dsidToPendingCompletionMap];
              [v136 setObject:0 forKeyedSubscript:v15];

              id v137 = MRGroupSessionSubsystemGetNotificationQueue();
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10003F560;
              block[3] = &unk_1004158D8;
              id v147 = v17;
              id v148 = v29;
              id v138 = v29;
              dispatch_async(v137, block);
            }
LABEL_128:

LABEL_129:
            goto LABEL_130;
          }
          id v31 = [v19 userProfile];
          id v32 = [v31 name];

          v15 = v144;
          if (!v32) {
            goto LABEL_128;
          }
          v142 = v19;
          v33 = _MRLogForCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v144;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[MRDMusicUserStateCenter] No social profile for dsid: %@. Will use basic identity.", buf, 0xCu);
          }

          id v34 = v144;
          long long v164 = 0u;
          long long v165 = 0u;
          long long v162 = 0u;
          long long v163 = 0u;
          long long v160 = 0u;
          long long v161 = 0u;
          long long v158 = 0u;
          long long v159 = 0u;
          long long v156 = 0u;
          long long v157 = 0u;
          long long v155 = 0u;
          memset(&buf[8], 0, 32);
          *(void *)buf = 4001;
          CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
          id v35 = v34;
          int v36 = [v35 UTF8String];
          id v37 = [v35 length];
          int v38 = (int)v37;
          if (*(uint64_t *)buf > 3999)
          {
            if (*(uint64_t *)buf > 4255)
            {
              if (*(void *)buf == 4256)
              {
                CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v36, (CC_LONG)v37);
              }
              else if (*(void *)buf == 4512)
              {
                CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v36, (CC_LONG)v37);
              }
            }
            else if (*(void *)buf == 4000)
            {
              CC_MD5_Update((CC_MD5_CTX *)&buf[8], v36, (CC_LONG)v37);
            }
            else if (*(void *)buf == 4001)
            {
              CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v36, (CC_LONG)v37);
            }
          }
          else if (*(uint64_t *)buf > 2999)
          {
            if (*(void *)buf == 3000)
            {
              sub_1000411AC(&buf[8], v36, (size_t)v37);
            }
            else if (*(void *)buf == 3001)
            {
              sub_10004135C(&buf[8], v36, (size_t)v37);
            }
          }
          else if (*(void *)buf)
          {
            if (*(void *)buf == 2000)
            {
              int v39 = ((((_BYTE)v37 + buf[19]) & 3) - buf[19]);
              __int16 v40 = &buf[buf[19] + 16];
              switch(v39)
              {
                case 0:
                  break;
                case 1:
                  *__int16 v40 = *v36;
                  break;
                case 2:
                  __int16 v43 = *(_WORD *)v36;
                  goto LABEL_38;
                case 3:
                  __int16 v43 = *(_WORD *)v36;
                  v40[2] = v36[2];
LABEL_38:
                  *(_WORD *)__int16 v40 = v43;
                  break;
                default:
                  memcpy(v40, v36, (((v38 + buf[19]) & 3) - buf[19]));
                  break;
              }
              *(_DWORD *)&buf[12] += v38;
            }
          }
          else
          {
            uint64_t v41 = +[NSAssertionHandler currentHandler];
            uint64_t v42 = +[NSString stringWithUTF8String:"void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)"];
            [v41 handleFailureInFunction:v42 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
          }
          memset(&v166[8], 0, 64);
          *(void *)v166 = *(void *)buf;
          if (*(uint64_t *)buf > 3000)
          {
            v15 = v144;
            if (*(uint64_t *)buf <= 4000)
            {
              if (*(void *)buf == 3001)
              {
                *(void *)&v166[8] = sub_1000415C4(&buf[8]);
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
            goto LABEL_77;
          }
          v15 = v144;
          if (*(uint64_t *)buf <= 1999)
          {
            if (*(void *)buf)
            {
              if (*(void *)buf == 1000)
              {
                uint64_t v44 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
                uint64_t v45 = *(void *)&buf[24] + (*(void *)&buf[32] ^ v155);
                uint64_t v46 = __ROR8__(*(void *)&buf[32] ^ v155, 48);
                uint64_t v47 = (v45 ^ v46) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
                uint64_t v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
                uint64_t v49 = v45 + v44;
                uint64_t v50 = v49 ^ __ROR8__(v44, 47);
                uint64_t v51 = (v47 ^ v155) + v50;
                uint64_t v52 = v51 ^ __ROR8__(v50, 51);
                uint64_t v53 = (__ROR8__(v49, 32) ^ 0xFFLL) + v48;
                uint64_t v54 = __ROR8__(v48, 48);
                uint64_t v55 = __ROR8__(v51, 32) + (v53 ^ v54);
                uint64_t v56 = v55 ^ __ROR8__(v53 ^ v54, 43);
                uint64_t v57 = v52 + v53;
                uint64_t v58 = v57 ^ __ROR8__(v52, 47);
                uint64_t v59 = v58 + v55;
                uint64_t v60 = v59 ^ __ROR8__(v58, 51);
                uint64_t v61 = __ROR8__(v57, 32) + v56;
                uint64_t v62 = __ROR8__(v56, 48);
                uint64_t v63 = __ROR8__(v59, 32) + (v61 ^ v62);
                uint64_t v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
                uint64_t v65 = v60 + v61;
                uint64_t v66 = v65 ^ __ROR8__(v60, 47);
                uint64_t v67 = v66 + v63;
                uint64_t v68 = v67 ^ __ROR8__(v66, 51);
                uint64_t v69 = __ROR8__(v65, 32) + v64;
                uint64_t v70 = __ROR8__(v64, 48);
                uint64_t v71 = __ROR8__(v67, 32) + (v69 ^ v70);
                uint64_t v72 = v71 ^ __ROR8__(v69 ^ v70, 43);
                uint64_t v73 = v68 + v69;
                *(void *)&buf[8] = v71;
                *(void *)&buf[16] = v73 ^ __ROR8__(v68, 47);
                *(void *)&unsigned char buf[24] = __ROR8__(v73, 32);
                *(void *)&buf[32] = v72;
                *(void *)&v166[8] = *(void *)&buf[16] ^ v71 ^ *(void *)&buf[24] ^ v72;
              }
            }
            else
            {
              unsigned int v75 = +[NSAssertionHandler currentHandler];
              uint64_t v76 = +[NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
              [v75 handleFailureInFunction:v76 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
            }
LABEL_77:
            v167[0] = *(_OWORD *)v166;
            v167[1] = *(_OWORD *)&v166[16];
            v167[2] = *(_OWORD *)&v166[32];
            v167[3] = *(_OWORD *)&v166[48];
            uint64_t v168 = *(void *)&v166[64];
            if (*(uint64_t *)v166 > 3999)
            {
              if (*(uint64_t *)v166 > 4255)
              {
                if (*(void *)v166 == 4256)
                {
                  v128 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
                  v129 = v128;
                  uint64_t v130 = 0;
                  v131 = (unsigned __int8 *)v167 + 8;
                  do
                  {
                    unsigned int v132 = *v131++;
                    dispatch_time_t v133 = &v128[v130];
                    *dispatch_time_t v133 = a0123456789abcd_0[(unint64_t)v132 >> 4];
                    v133[1] = a0123456789abcd_0[v132 & 0xF];
                    v130 += 2;
                  }
                  while (v130 != 64);
                  id v100 = objc_alloc((Class)NSString);
                  uint64_t v101 = v129;
                  uint64_t v102 = 64;
                }
                else
                {
                  if (*(void *)v166 != 4512) {
                    goto LABEL_121;
                  }
                  v107 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
                  v108 = v107;
                  uint64_t v109 = 0;
                  unsigned int v110 = (unsigned __int8 *)v167 + 8;
                  do
                  {
                    unsigned int v111 = *v110++;
                    v112 = &v107[v109];
                    char *v112 = a0123456789abcd_0[(unint64_t)v111 >> 4];
                    v112[1] = a0123456789abcd_0[v111 & 0xF];
                    v109 += 2;
                  }
                  while (v109 != 128);
                  id v100 = objc_alloc((Class)NSString);
                  uint64_t v101 = v108;
                  uint64_t v102 = 128;
                }
              }
              else
              {
                if (*(void *)v166 == 4000)
                {
                  v118 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
                  uint64_t v119 = 0;
                  unsigned int v120 = (unsigned __int8 *)v167 + 8;
                  do
                  {
                    unsigned int v121 = *v120++;
                    CFStringRef v122 = &v118[v119];
                    *CFStringRef v122 = a0123456789abcd_0[(unint64_t)v121 >> 4];
                    v122[1] = a0123456789abcd_0[v121 & 0xF];
                    v119 += 2;
                  }
                  while (v119 != 32);
                  CFStringRef v123 = (CFStringRef)[objc_alloc((Class)NSString) initWithBytesNoCopy:v118 length:32 encoding:4 freeWhenDone:1];
                  goto LABEL_124;
                }
                if (*(void *)v166 != 4001) {
                  goto LABEL_121;
                }
                unint64_t v94 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
                v95 = v94;
                uint64_t v96 = 0;
                v97 = (unsigned __int8 *)v167 + 8;
                do
                {
                  unsigned int v98 = *v97++;
                  unsigned int v99 = &v94[v96];
                  *unsigned int v99 = a0123456789abcd_0[(unint64_t)v98 >> 4];
                  v99[1] = a0123456789abcd_0[v98 & 0xF];
                  v96 += 2;
                }
                while (v96 != 40);
                id v100 = objc_alloc((Class)NSString);
                uint64_t v101 = v95;
                uint64_t v102 = 40;
              }
            }
            else
            {
              if (*(uint64_t *)v166 <= 2999)
              {
                if (*(void *)v166 != 1000)
                {
                  if (*(void *)v166 == 2000)
                  {
                    uint64_t v89 = 0;
                    uint64_t quot = DWORD2(v167[0]);
                    do
                    {
                      ldiv_t v91 = ldiv(quot, 10);
                      uint64_t quot = v91.quot;
                      if (v91.rem >= 0) {
                        LOBYTE(v92) = v91.rem;
                      }
                      else {
                        uint64_t v92 = -v91.rem;
                      }
                      v171[--v89] = v92 + 48;
                    }
                    while (v91.quot);
                    CFStringRef v93 = CFStringCreateWithBytes(0, &v171[v89], -v89, 0x8000100u, 0);
LABEL_120:
                    v30 = (__CFString *)v93;
LABEL_125:

                    v24 = [(__CFString *)v30 substringToIndex:7];
                    v25 = [v19 userProfile];
                    unsigned __int8 v26 = [v25 name];
                    v29 = +[MRUserIdentity basicIdentityWithIdentifier:v24 displayName:v26];
                    goto LABEL_126;
                  }
LABEL_121:
                  v134 = +[NSAssertionHandler currentHandler];
                  v135 = +[NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
                  [v134 handleFailureInFunction:v135 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

                  v30 = &stru_10042ACB0;
                  goto LABEL_125;
                }
                uint64_t v113 = *((void *)&v167[0] + 1);
                v114 = (UInt8 *)&v170;
                uint64_t v115 = *((void *)&v167[0] + 1);
                do
                {
                  lldiv_t v116 = lldiv(v115, 10);
                  uint64_t v115 = v116.quot;
                  if (v116.rem >= 0) {
                    LOBYTE(v117) = v116.rem;
                  }
                  else {
                    uint64_t v117 = -v116.rem;
                  }
                  *v114-- = v117 + 48;
                }
                while (v116.quot);
                if (v113 < 0) {
                  UInt8 *v114 = 45;
                }
                else {
                  ++v114;
                }
                CFStringRef v123 = CFStringCreateWithBytes(0, v114, v171 - v114, 0x8000100u, 0);
LABEL_124:
                v30 = (__CFString *)v123;
                goto LABEL_125;
              }
              if (*(void *)v166 == 3000)
              {
                LODWORD(v169[0]) = bswap32(DWORD2(v167[0]));
                v124 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
                uint64_t v125 = 0;
                unsigned __int8 v126 = v124 + 1;
                do
                {
                  unint64_t v127 = *((unsigned __int8 *)v169 + v125);
                  *(v126 - 1) = a0123456789abcd_0[v127 >> 4];
                  *unsigned __int8 v126 = a0123456789abcd_0[v127 & 0xF];
                  v126 += 2;
                  ++v125;
                }
                while (v125 != 4);
                id v100 = objc_alloc((Class)NSString);
                uint64_t v101 = v124;
                uint64_t v102 = 8;
              }
              else
              {
                if (*(void *)v166 != 3001) {
                  goto LABEL_121;
                }
                v169[0] = bswap64(*((unint64_t *)&v167[0] + 1));
                v103 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
                uint64_t v104 = 0;
                uint64_t v105 = v103 + 1;
                do
                {
                  unint64_t v106 = *((unsigned __int8 *)v169 + v104);
                  *(v105 - 1) = a0123456789abcd_0[v106 >> 4];
                  *uint64_t v105 = a0123456789abcd_0[v106 & 0xF];
                  v105 += 2;
                  ++v104;
                }
                while (v104 != 8);
                id v100 = objc_alloc((Class)NSString);
                uint64_t v101 = v103;
                uint64_t v102 = 16;
              }
            }
            CFStringRef v93 = (CFStringRef)[v100 initWithBytesNoCopy:v101 length:v102 encoding:4 freeWhenDone:1];
            goto LABEL_120;
          }
          if (*(void *)buf != 2000)
          {
            if (*(void *)buf != 3000) {
              goto LABEL_77;
            }
            if (*(_DWORD *)&buf[12]) {
              int v74 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1003C53A0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1003C5390)));
            }
            else {
              int v74 = *(_DWORD *)&buf[24] + 374761393;
            }
            unsigned int v78 = *(_DWORD *)&buf[8] + v74;
            unint64_t v79 = BYTE8(v155) & 0xF;
            CFIndex v80 = &buf[32];
            if (v79 >= 4)
            {
              do
              {
                int v81 = *(_DWORD *)v80;
                v80 += 4;
                HIDWORD(v82) = v78 - 1028477379 * v81;
                LODWORD(v82) = HIDWORD(v82);
                unsigned int v78 = 668265263 * (v82 >> 15);
                v79 -= 4;
              }
              while (v79 > 3);
            }
            for (; v79; --v79)
            {
              int v83 = *v80++;
              HIDWORD(v84) = v78 + 374761393 * v83;
              LODWORD(v84) = HIDWORD(v84);
              unsigned int v78 = -1640531535 * (v84 >> 21);
            }
            unsigned int v85 = -1028477379 * ((-2048144777 * (v78 ^ (v78 >> 15))) ^ ((-2048144777 * (v78 ^ (v78 >> 15))) >> 13));
            unsigned int v86 = v85 ^ HIWORD(v85);
            goto LABEL_76;
          }
          switch(buf[19])
          {
            case 1:
              int v77 = buf[16];
              break;
            case 2:
              int v77 = *(unsigned __int16 *)&buf[16];
              break;
            case 3:
              int v77 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
              break;
            default:
              unsigned int v87 = *(_DWORD *)&buf[8];
LABEL_75:
              unsigned int v88 = -2048144789 * (v87 ^ *(_DWORD *)&buf[12] ^ ((v87 ^ *(_DWORD *)&buf[12]) >> 16));
              unsigned int v86 = (-1028477387 * (v88 ^ (v88 >> 13))) ^ ((-1028477387 * (v88 ^ (v88 >> 13))) >> 16);
              *(_DWORD *)&buf[8] = v86;
LABEL_76:
              *(_DWORD *)&v166[8] = v86;
              goto LABEL_77;
          }
          unsigned int v87 = (461845907 * ((380141568 * v77) | ((-862048943 * v77) >> 17))) ^ *(_DWORD *)&buf[8];
          goto LABEL_75;
        }
LABEL_130:
        id v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v149 objects:v153 count:16];
      if (!v9)
      {
LABEL_132:

        p_locuint64_t k = v139;
        break;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)localUserStates
{
  v2 = [(MRDMusicUserStateCenter *)self stateCenter];
  v3 = [v2 allUserStates];
  uint64_t v4 = objc_msgSend(v3, "msv_map:", &stru_100417288);

  return (NSArray *)v4;
}

- (MRDMediaUserState)localActiveUserState
{
  v3 = [MRDMediaUserState alloc];
  uint64_t v4 = [(MRDMusicUserStateCenter *)self stateCenter];
  id v5 = [v4 activeUserState];
  id v6 = [(MRDMediaUserState *)v3 initWithUserState:v5];

  return v6;
}

- (MRUserIdentity)localActiveIdentity
{
  v2 = [(MRDMusicUserStateCenter *)self localActiveUserState];
  v3 = [v2 userIdentity];

  return (MRUserIdentity *)v3;
}

- (id)identityForUserState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 music];
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  id v6 = [v4 userProfile];
  id v7 = [v6 socialProfile];
  id v8 = [v7 socialProfileID];

  if (!v8)
  {
    v16 = [v5 userProfile];
    v17 = [v16 name];

    if (v17)
    {
      v18 = [v3 dsid];
      v19 = [v18 stringValue];

      id v20 = v19;
      long long v78 = 0u;
      long long v77 = 0u;
      long long v76 = 0u;
      long long v75 = 0u;
      long long v74 = 0u;
      long long v73 = 0u;
      long long v72 = 0u;
      memset(&v71, 0, sizeof(v71));
      CC_SHA1_Init(&v71);
      id v9 = v20;
      CC_SHA1_Update(&v71, [v9 UTF8String], (CC_LONG)objc_msgSend(v9, "length"));

      memset(&v79[8], 0, 64);
      *(void *)unint64_t v79 = 4001;
      CC_SHA1_Final(&v79[8], &v71);
      v80[0] = *(_OWORD *)v79;
      v80[1] = *(_OWORD *)&v79[16];
      v80[2] = *(_OWORD *)&v79[32];
      v80[3] = *(_OWORD *)&v79[48];
      uint64_t v81 = *(void *)&v79[64];
      if (*(uint64_t *)v79 > 3999)
      {
        if (*(uint64_t *)v79 > 4255)
        {
          if (*(void *)v79 == 4256)
          {
            uint64_t v61 = (unsigned __int8 *)v80 + 8;
            uint64_t v62 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v63 = v62;
            for (uint64_t i = 0; i != 64; i += 2)
            {
              unsigned int v65 = *v61++;
              uint64_t v66 = &v62[i];
              *uint64_t v66 = a0123456789abcd_0[(unint64_t)v65 >> 4];
              v66[1] = a0123456789abcd_0[v65 & 0xF];
            }
            id v33 = objc_alloc((Class)NSString);
            id v34 = v63;
            uint64_t v35 = 64;
          }
          else
          {
            if (*(void *)v79 != 4512) {
              goto LABEL_50;
            }
            __int16 v40 = (unsigned __int8 *)v80 + 8;
            uint64_t v41 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v42 = v41;
            for (uint64_t j = 0; j != 128; j += 2)
            {
              unsigned int v44 = *v40++;
              uint64_t v45 = &v41[j];
              *uint64_t v45 = a0123456789abcd_0[(unint64_t)v44 >> 4];
              v45[1] = a0123456789abcd_0[v44 & 0xF];
            }
            id v33 = objc_alloc((Class)NSString);
            id v34 = v42;
            uint64_t v35 = 128;
          }
        }
        else if (*(void *)v79 == 4000)
        {
          uint64_t v51 = (unsigned __int8 *)v80 + 8;
          uint64_t v52 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
          uint64_t v53 = v52;
          for (uint64_t k = 0; k != 32; k += 2)
          {
            unsigned int v55 = *v51++;
            uint64_t v56 = &v52[k];
            *uint64_t v56 = a0123456789abcd_0[(unint64_t)v55 >> 4];
            v56[1] = a0123456789abcd_0[v55 & 0xF];
          }
          id v33 = objc_alloc((Class)NSString);
          id v34 = v53;
          uint64_t v35 = 32;
        }
        else
        {
          if (*(void *)v79 != 4001) {
            goto LABEL_50;
          }
          v27 = (unsigned __int8 *)v80 + 8;
          v28 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
          v29 = v28;
          for (uint64_t m = 0; m != 40; m += 2)
          {
            unsigned int v31 = *v27++;
            id v32 = &v28[m];
            *id v32 = a0123456789abcd_0[(unint64_t)v31 >> 4];
            v32[1] = a0123456789abcd_0[v31 & 0xF];
          }
          id v33 = objc_alloc((Class)NSString);
          id v34 = v29;
          uint64_t v35 = 40;
        }
      }
      else
      {
        if (*(uint64_t *)v79 <= 2999)
        {
          if (*(void *)v79 == 1000)
          {
            uint64_t v46 = *((void *)&v80[0] + 1);
            uint64_t v47 = (UInt8 *)&v83;
            uint64_t quot = *((void *)&v80[0] + 1);
            do
            {
              lldiv_t v49 = lldiv(quot, 10);
              uint64_t quot = v49.quot;
              if (v49.rem >= 0) {
                LOBYTE(v50) = v49.rem;
              }
              else {
                uint64_t v50 = -v49.rem;
              }
              *v47-- = v50 + 48;
            }
            while (v49.quot);
            if (v46 < 0) {
              *uint64_t v47 = 45;
            }
            else {
              ++v47;
            }
            CFIndex v25 = (char *)&v84 - (char *)v47;
            unsigned __int8 v26 = v47;
            goto LABEL_53;
          }
          if (*(void *)v79 == 2000)
          {
            uint64_t v21 = 0;
            uint64_t v22 = DWORD2(v80[0]);
            do
            {
              ldiv_t v23 = ldiv(v22, 10);
              uint64_t v22 = v23.quot;
              if (v23.rem >= 0) {
                LOBYTE(v24) = v23.rem;
              }
              else {
                uint64_t v24 = -v23.rem;
              }
              *(&v83 + v21--) = v24 + 48;
            }
            while (v23.quot);
            CFIndex v25 = -v21;
            unsigned __int8 v26 = (const UInt8 *)&v84 + v21;
LABEL_53:
            CFStringRef v67 = CFStringCreateWithBytes(0, v26, v25, 0x8000100u, 0);
            goto LABEL_54;
          }
LABEL_50:
          uint64_t v68 = +[NSAssertionHandler currentHandler];
          uint64_t v69 = +[NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
          [v68 handleFailureInFunction:v69 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

          uint64_t v10 = &stru_10042ACB0;
LABEL_55:

          id v11 = [(__CFString *)v10 substringToIndex:7];
          objc_super v12 = [v5 userProfile];
          v13 = [v12 name];
          v15 = +[MRUserIdentity basicIdentityWithIdentifier:v11 displayName:v13];
          goto LABEL_56;
        }
        if (*(void *)v79 == 3000)
        {
          LODWORD(v82[0]) = bswap32(DWORD2(v80[0]));
          uint64_t v57 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
          uint64_t v58 = 0;
          uint64_t v59 = v57 + 1;
          do
          {
            unint64_t v60 = *((unsigned __int8 *)v82 + v58);
            *(v59 - 1) = a0123456789abcd_0[v60 >> 4];
            *uint64_t v59 = a0123456789abcd_0[v60 & 0xF];
            v59 += 2;
            ++v58;
          }
          while (v58 != 4);
          id v33 = objc_alloc((Class)NSString);
          id v34 = v57;
          uint64_t v35 = 8;
        }
        else
        {
          if (*(void *)v79 != 3001) {
            goto LABEL_50;
          }
          v82[0] = bswap64(*((unint64_t *)&v80[0] + 1));
          int v36 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
          uint64_t v37 = 0;
          int v38 = v36 + 1;
          do
          {
            unint64_t v39 = *((unsigned __int8 *)v82 + v37);
            *(v38 - 1) = a0123456789abcd_0[v39 >> 4];
            unsigned char *v38 = a0123456789abcd_0[v39 & 0xF];
            v38 += 2;
            ++v37;
          }
          while (v37 != 8);
          id v33 = objc_alloc((Class)NSString);
          id v34 = v36;
          uint64_t v35 = 16;
        }
      }
      CFStringRef v67 = (CFStringRef)objc_msgSend(v33, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v34, v35, 4, 1, 4001, *(void *)&v71.h0);
LABEL_54:
      uint64_t v10 = (__CFString *)v67;
      goto LABEL_55;
    }
LABEL_6:
    v15 = 0;
    goto LABEL_57;
  }
  id v9 = [v5 userProfile];
  uint64_t v10 = [v9 socialProfile];
  id v11 = [(__CFString *)v10 socialProfileID];
  objc_super v12 = [v5 userProfile];
  v13 = [v12 socialProfile];
  v14 = [v13 name];
  v15 = +[MRUserIdentity resolvableIdentityWithIdentifier:v11 displayName:v14];

LABEL_56:
LABEL_57:

  return v15;
}

- (NSArray)localUserIdentities
{
  id v3 = [(MRDMusicUserStateCenter *)self stateCenter];
  uint64_t v4 = [v3 allUserStates];

  id v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[MRDMusicUserStateCenter identityForUserState:](self, "identityForUserState:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (id)identityForHomeUserIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDMusicUserStateCenter *)self stateCenter];
  id v6 = [v5 allUserStates];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "homeUserIDs", (void)v17);
        unsigned __int8 v14 = [v13 containsObject:v4];

        if (v14)
        {
          long long v15 = [(MRDMusicUserStateCenter *)self identityForUserState:v12];
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  long long v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)cachedStateLoaded
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_cachedStateLoaded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)stateCenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000408F0;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  if (qword_10047DF00 != -1) {
    dispatch_once(&qword_10047DF00, block);
  }
  return (id)qword_10047DEF8;
}

- (void)updateIsMusicAppInstalled
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  id v4 = [(MRDMusicUserStateCenter *)self musicApplicationBundleIdentifier];
  unsigned int v5 = [v3 applicationIsInstalled:v4];

  os_unfair_lock_lock(&self->_lock);
  LODWORD(v4) = self->_isMusicAppInstalled;
  self->_isMusicAppInstalled = v5;
  os_unfair_lock_unlock(&self->_lock);
  if (v4 != v5)
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      CFStringRef v7 = @"not installed";
      if (v5) {
        CFStringRef v7 = @"installed";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[MRDMusicUserStateCenter] Music application changed to: %@", buf, 0xCu);
    }

    id v8 = MRGroupSessionSubsystemGetNotificationQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100040DA8;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_async(v8, block);
  }
}

- (void)handleRegisteredApplicationsChangedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:@"bundleIDs"];

  unsigned int v5 = [(MRDMusicUserStateCenter *)self musicApplicationBundleIdentifier];
  unsigned int v6 = [v7 containsObject:v5];

  if (v6) {
    [(MRDMusicUserStateCenter *)self updateIsMusicAppInstalled];
  }
}

- (void)handleiTunesNotification:(id)a3
{
  [(MRDMusicUserStateCenter *)self postCloudStateChanged];

  [(MRDMusicUserStateCenter *)self checkPendingIdentityCompletions];
}

- (void)postCloudStateChanged
{
  id v3 = MRGroupSessionSubsystemGetNotificationQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040F68;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)isMusicAppInstalled
{
  return self->_isMusicAppInstalled;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (id)privacyObserver
{
  return self->_privacyObserver;
}

- (void)setPrivacyObserver:(id)a3
{
}

- (NSString)musicApplicationBundleIdentifier
{
  return self->_musicApplicationBundleIdentifier;
}

- (NSMutableDictionary)dsidToPendingCompletionMap
{
  return self->_dsidToPendingCompletionMap;
}

- (void)setDsidToPendingCompletionMap:(id)a3
{
}

- (NSMutableSet)finishedWaitingForCloudStateDSIDs
{
  return self->_finishedWaitingForCloudStateDSIDs;
}

- (void)setFinishedWaitingForCloudStateDSIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedWaitingForCloudStateDSIDs, 0);
  objc_storeStrong((id *)&self->_dsidToPendingCompletionMap, 0);
  objc_storeStrong((id *)&self->_musicApplicationBundleIdentifier, 0);

  objc_storeStrong(&self->_privacyObserver, 0);
}

@end