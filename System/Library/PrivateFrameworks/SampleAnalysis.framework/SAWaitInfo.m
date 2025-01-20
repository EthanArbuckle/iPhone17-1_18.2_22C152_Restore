@interface SAWaitInfo
+ (SAWaitInfo)stateWithPAStyleSerializedWaitInfo:(uint64_t)a1;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)waitInfoWithKCDataWaitInfo:(void *)a3 portName:(unint64_t)a4 flags:(unint64_t)a5 domain:;
- (BOOL)_displaysContentForPid:(uint64_t)a3 tid:(char)a4 options:(void *)a5 displayString:(void *)a6 nameCallback:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (SAWaitInfo)init;
- (SAWaitInfo)initWithKCDataWaitInfo:(const stackshot_thread_waitinfo_v2 *)a3;
- (id)descriptionForPid:(int)a3 tid:(unint64_t)a4 options:(unint64_t)a5 nameCallback:(id)a6;
- (int)blockingPid;
- (int64_t)compare:(id)a3;
- (uint64_t)displaysSameContentAs:(int)a3 forPid:(uint64_t)a4 tid:(char)a5 displayOptions:;
- (uint64_t)matchesKCDataWaitInfo:(void *)a3 portName:(uint64_t)a4 flags:(uint64_t)a5 domain:;
- (unint64_t)blockingTid;
- (unint64_t)context;
- (unint64_t)hash;
- (unint64_t)owner;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unsigned)type;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAWaitInfo

- (SAWaitInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)SAWaitInfo;
  return (SAWaitInfo *)[(SABlockingInfo *)&v3 _init];
}

- (SAWaitInfo)initWithKCDataWaitInfo:(const stackshot_thread_waitinfo_v2 *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAWaitInfo;
  result = [(SABlockingInfo *)&v5 _init];
  if (result)
  {
    result->_owner = a3->owner;
    result->_context = a3->context;
    result->_type = a3->wait_type;
  }
  return result;
}

+ (id)waitInfoWithKCDataWaitInfo:(void *)a3 portName:(unint64_t)a4 flags:(unint64_t)a5 domain:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (objc_class *)self;
  if (v9)
  {
    v11 = [SAWaitInfoWithPortLabel alloc];
    id v12 = v9;
    if (v11)
    {
      v20.receiver = v11;
      v20.super_class = (Class)SAWaitInfoWithPortLabel;
      v13 = (id *)objc_msgSendSuper2(&v20, sel_initWithKCDataWaitInfo_, a2);
      uint64_t v14 = (uint64_t)v13;
      if (v13)
      {
        objc_storeStrong(v13 + 4, a3);
        if (a4 >= 0x10000)
        {
          int v16 = *__error();
          v17 = _sa_logt();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v22 = a4;
            _os_log_fault_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_FAULT, "port label flags 0x%llx is too large", buf, 0xCu);
          }

          *__error() = v16;
        }
        *(_WORD *)(v14 + 40) = a4;
        if (a5 >= 0x100)
        {
          int v18 = *__error();
          v19 = _sa_logt();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v22 = a5;
            _os_log_fault_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_FAULT, "port label domain %llu is too large", buf, 0xCu);
          }

          *__error() = v18;
        }
        *(unsigned char *)(v14 + 42) = a5;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = [[v10 alloc] initWithKCDataWaitInfo:a2];
  }

  return (id)v14;
}

- (uint64_t)displaysSameContentAs:(int)a3 forPid:(uint64_t)a4 tid:(char)a5 displayOptions:
{
  id v9 = a2;
  v10 = v9;
  if (a1)
  {
    if ((void *)a1 == v9) {
      goto LABEL_24;
    }
    if (v9)
    {
      if (*(unsigned __int16 *)(a1 + 8) != *((unsigned __int16 *)v9 + 4)) {
        goto LABEL_22;
      }
      if (*(void *)(a1 + 16) != v9[2]) {
        goto LABEL_22;
      }
      uint64_t v11 = [(id)a1 portFlags];
      if (v11 != [v10 portFlags]) {
        goto LABEL_22;
      }
      id v12 = (void *)[(id)a1 portDomain];
      if (v12 != (void *)[v10 portDomain] || (a5 & 2) != 0 && *(void *)(a1 + 24) != v10[3]) {
        goto LABEL_22;
      }
      v13 = [(id)a1 portName];
      if (!v13)
      {
        id v12 = [v10 portName];
        if (!v12) {
          goto LABEL_24;
        }
      }
      uint64_t v14 = [(id)a1 portName];
      if (v14)
      {
        v15 = (void *)v14;
        uint64_t v16 = [v10 portName];
        if (v16)
        {
          v17 = (void *)v16;
          int v18 = [(id)a1 portName];
          v19 = [v10 portName];
          char v20 = [v18 isEqualToString:v19];

          if (v13)
          {

            if (v20) {
              goto LABEL_24;
            }
            goto LABEL_22;
          }

          if (v20)
          {
LABEL_24:
            a1 = 1;
            goto LABEL_25;
          }
LABEL_22:
          a1 = 0;
          goto LABEL_25;
        }
      }
      if (v13) {
        id v12 = v13;
      }

      goto LABEL_22;
    }
    a1 = !-[SAWaitInfo _displaysContentForPid:tid:options:displayString:nameCallback:](a1, a3, a4, a5, 0, 0);
  }
LABEL_25:

  return a1;
}

- (BOOL)_displaysContentForPid:(uint64_t)a3 tid:(char)a4 options:(void *)a5 displayString:(void *)a6 nameCallback:
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = (void (**)(void, void, void))v11;
  if (!a1)
  {
LABEL_279:
    BOOL v13 = 0;
    goto LABEL_276;
  }
  if ((a5 != 0) != (v11 != 0))
  {
    int v102 = *__error();
    v103 = _sa_logt();
    BOOL v104 = v12 != 0;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a5) = a5 != 0;
      *(_DWORD *)buf = 67109376;
      int v113 = (int)a5;
      __int16 v114 = 1024;
      BOOL v115 = v104;
      _os_log_error_impl(&dword_1BF22B000, v103, OS_LOG_TYPE_ERROR, "string_out:%d StringForPidAndTid:%d", buf, 0xEu);
    }
    else
    {
      LOBYTE(a5) = a5 != 0;
    }

    *__error() = v102;
    _SASetCrashLogMessage(2202, "string_out:%d StringForPidAndTid:%d", v105, v106, v107, v108, v109, v110, (char)a5);
    _os_crash();
    __break(1u);
  }
  BOOL v13 = 0;
  uint64_t v14 = a4 & 1;
  switch(*(unsigned char *)(a1 + 8))
  {
    case 0:
      int v15 = *__error();
      uint64_t v16 = _sa_logt();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "waitinfo has no type", buf, 2u);
      }

      BOOL v13 = 0;
      *__error() = v15;
      goto LABEL_276;
    case 1:
      uint64_t v21 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v21 != 0;
      if (a5 && v21)
      {
        unint64_t v22 = (void *)[@"kernel mutex" mutableCopy];
        uint64_t v23 = v22;
        if ((a4 & 2) != 0) {
          objc_msgSend(v22, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
        }
        uint64_t v24 = *(void *)(a1 + 16);
        if (!v24) {
          goto LABEL_210;
        }
        if (v24 != -6) {
          goto LABEL_208;
        }
        v25 = @" in spin mode";
        goto LABEL_211;
      }
      goto LABEL_276;
    case 2:
      if ((a4 & 1) == 0)
      {
        v26 = [(id)a1 portName];

        if (!v26)
        {
          uint64_t v27 = *(void *)(a1 + 16);
          if (v27 != -3 && v27 != -5) {
            goto LABEL_279;
          }
        }
      }
      if (!a5) {
        goto LABEL_275;
      }
      v17 = (void *)[@"mach_msg receive" mutableCopy];
      if ((a4 & 2) != 0
        || ((uint64_t v29 = *(void *)(a1 + 16), v29 != -5) ? (v30 = v29 == -3) : (v30 = 1),
            v30
         || ([(id)a1 portName], v31 = objc_claimAutoreleasedReturnValue(), v31, v31)))
      {
        uint64_t v32 = *(void *)(a1 + 16);
        v33 = @" on port";
        if (v32 == -5) {
          v33 = @" on intransit port";
        }
        if (v32 == -3) {
          v34 = @" on locked port";
        }
        else {
          v34 = v33;
        }
        [v17 appendFormat:v34];
        v35 = [(id)a1 portName];

        if (v35)
        {
          v36 = [(id)a1 portName];
          [v17 appendFormat:@" name \"%@\"", v36];
        }
        if ([(id)a1 portFlags]) {
          objc_msgSend(v17, "appendFormat:", @" flags 0x%llx", objc_msgSend((id)a1, "portFlags"));
        }
        if ([(id)a1 portDomain]) {
          objc_msgSend(v17, "appendFormat:", @" in domain %llu", objc_msgSend((id)a1, "portDomain"));
        }
        if ((a4 & 2) != 0) {
          objc_msgSend(v17, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
        }
        unint64_t v37 = *(void *)(a1 + 16);
        if (v37 != 0 && v37 < 0xFFFFFFFFFFFFFFFBLL || ((1 << (v37 + 5)) & 0x25) == 0) {
          objc_msgSend(v17, "appendFormat:", @" name 0x%llx", *(void *)(a1 + 16));
        }
      }
      goto LABEL_197;
    case 3:
      if ((a4 & 1) != 0
        || ([(id)a1 portName], v38 = objc_claimAutoreleasedReturnValue(), v38, v38))
      {
        if (!a5) {
          goto LABEL_275;
        }
      }
      else
      {
        uint64_t v98 = *(void *)(a1 + 16);
        BOOL v13 = v98 == -4;
        if (!a5 || v98 != -4) {
          goto LABEL_276;
        }
      }
      v17 = (void *)[@"mach_msg receive" mutableCopy];
      if ((a4 & 2) != 0
        || *(void *)(a1 + 16) == -4
        || ([(id)a1 portName], v39 = objc_claimAutoreleasedReturnValue(), v39, v39))
      {
        if (*(void *)(a1 + 16) == -4) {
          v40 = @" on locked port set";
        }
        else {
          v40 = @" on port set";
        }
        [v17 appendFormat:v40];
        v41 = [(id)a1 portName];

        if (v41)
        {
          v42 = [(id)a1 portName];
          [v17 appendFormat:@" name \"%@\"", v42];
        }
        if ([(id)a1 portFlags]) {
          objc_msgSend(v17, "appendFormat:", @" flags 0x%llx", objc_msgSend((id)a1, "portFlags"));
        }
        if ([(id)a1 portDomain]) {
          objc_msgSend(v17, "appendFormat:", @" in domain %llu", objc_msgSend((id)a1, "portDomain"));
        }
LABEL_68:
        if ((a4 & 2) != 0) {
          objc_msgSend(v17, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
        }
      }
      goto LABEL_197;
    case 4:
      if ((a4 & 1) != 0
        || ((uint64_t v43 = *(void *)(a1 + 16), (unint64_t)(v43 + 3) >= 2) ? (v44 = v43 == -5) : (v44 = 1),
            v44 || (v43 ? (BOOL v96 = (int)v43 <= 0) : (BOOL v96 = 1), !v96)))
      {
        if (!a5) {
          goto LABEL_275;
        }
      }
      else
      {
        v97 = [(id)a1 portName];
        BOOL v13 = v97 != 0;

        if (!a5 || !v97) {
          goto LABEL_276;
        }
      }
      v17 = (void *)[@"mach_msg send" mutableCopy];
      if ((a4 & 2) != 0
        || ((uint64_t v45 = *(void *)(a1 + 16), v45 != -5) ? (v46 = v45 == -3) : (v46 = 1),
            v46
         || ([(id)a1 portName], v47 = objc_claimAutoreleasedReturnValue(), v47, v47)))
      {
        uint64_t v48 = *(void *)(a1 + 16);
        v49 = @" on port";
        if (v48 == -5) {
          v49 = @" on intransit port";
        }
        if (v48 == -3) {
          v50 = @" on locked port";
        }
        else {
          v50 = v49;
        }
        [v17 appendFormat:v50];
        v51 = [(id)a1 portName];

        if (v51)
        {
          v52 = [(id)a1 portName];
          [v17 appendFormat:@" name \"%@\"", v52];
        }
        if ([(id)a1 portFlags]) {
          objc_msgSend(v17, "appendFormat:", @" flags 0x%llx", objc_msgSend((id)a1, "portFlags"));
        }
        if ([(id)a1 portDomain]) {
          objc_msgSend(v17, "appendFormat:", @" in domain %llu", objc_msgSend((id)a1, "portDomain"));
        }
        if ((a4 & 2) != 0) {
          objc_msgSend(v17, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
        }
      }
      uint64_t v53 = *(void *)(a1 + 16);
      switch(v53)
      {
        case -5:
        case -3:
          goto LABEL_197;
        case -2:
          uint64_t v53 = 0;
          *(void *)(a1 + 16) = 0;
          goto LABEL_245;
        case 0:
          goto LABEL_247;
        default:
          goto LABEL_244;
      }
      goto LABEL_197;
    case 5:
      if (a4)
      {
        if (!a5) {
          goto LABEL_275;
        }
      }
      else
      {
        v54 = [(id)a1 portName];
        BOOL v13 = v54 != 0;

        if (!a5 || !v54) {
          goto LABEL_276;
        }
      }
      v17 = (void *)[@"mach_msg send" mutableCopy];
      if ((a4 & 2) != 0) {
        goto LABEL_220;
      }
      v89 = [(id)a1 portName];
      if (v89 || [(id)a1 portFlags])
      {
      }
      else if (![(id)a1 portDomain])
      {
        goto LABEL_228;
      }
LABEL_220:
      [v17 appendString:@" on port"];
      v90 = [(id)a1 portName];

      if (v90)
      {
        v91 = [(id)a1 portName];
        [v17 appendFormat:@" name \"%@\"", v91];
      }
      if ([(id)a1 portFlags]) {
        objc_msgSend(v17, "appendFormat:", @" flags 0x%llx", objc_msgSend((id)a1, "portFlags"));
      }
      if ([(id)a1 portDomain]) {
        objc_msgSend(v17, "appendFormat:", @" in domain %llu", objc_msgSend((id)a1, "portDomain"));
      }
      if ((a4 & 2) != 0) {
        objc_msgSend(v17, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
      }
LABEL_228:
      [v17 appendString:@" in transit"];
      if (!*(void *)(a1 + 16))
      {
        v70 = @" to unknown port";
        goto LABEL_196;
      }
      if ((a4 & 2) != 0) {
        objc_msgSend(v17, "appendFormat:", @" to port address 0x%llx", *(void *)(a1 + 16));
      }
      goto LABEL_197;
    case 6:
      uint64_t v55 = *(void *)(a1 + 16);
      if (!v55)
      {
        if ((a4 & 3) == 0) {
          goto LABEL_111;
        }
        goto LABEL_232;
      }
      BOOL v57 = v55 != a2 && (int)v55 >= 0;
      if ((a4 & 3) != 0 || v57)
      {
LABEL_232:
        if (a5) {
          goto LABEL_233;
        }
LABEL_275:
        BOOL v13 = 1;
        goto LABEL_276;
      }
LABEL_111:
      v58 = [(id)a1 portName];
      BOOL v13 = v58 != 0;

      if (a5 && v58)
      {
LABEL_233:
        v17 = (void *)[@"semaphore" mutableCopy];
        if ((a4 & 2) != 0
          || ([(id)a1 portName], v92 = objc_claimAutoreleasedReturnValue(),
                                                v92,
                                                v92))
        {
          [v17 appendFormat:@" port"];
          v93 = [(id)a1 portName];

          if (v93)
          {
            v94 = [(id)a1 portName];
            [v17 appendFormat:@" name \"%@\"", v94];
          }
          if ([(id)a1 portFlags]) {
            objc_msgSend(v17, "appendFormat:", @" flags 0x%llx", objc_msgSend((id)a1, "portFlags"));
          }
          if ([(id)a1 portDomain]) {
            objc_msgSend(v17, "appendFormat:", @" in domain %llu", objc_msgSend((id)a1, "portDomain"));
          }
          if ((a4 & 2) != 0) {
            objc_msgSend(v17, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
          }
        }
        uint64_t v53 = *(void *)(a1 + 16);
        if (v53)
        {
LABEL_244:
          if ((v53 & 0x80000000) != 0)
          {
            v70 = @" owned by unknown process";
          }
          else
          {
LABEL_245:
            if (v53 != a2)
            {
              v95 = v12[2](v12, v53, 0);
              [v17 appendFormat:@" owned by %@", v95];

              goto LABEL_197;
            }
            v70 = @" owned by this process";
          }
        }
        else
        {
LABEL_247:
          v70 = @" with unknown owner";
        }
LABEL_196:
        objc_msgSend(v17, "appendFormat:", v70, v111);
LABEL_197:
        v84 = v17;
        goto LABEL_274;
      }
LABEL_276:

      return v13;
    case 7:
      uint64_t v59 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v59 != 0;
      if (!a5 || !v59) {
        goto LABEL_276;
      }
      v60 = (void *)[@"krwlock" mutableCopy];
      uint64_t v23 = v60;
      if ((a4 & 2) != 0) {
        objc_msgSend(v60, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
      }
      v61 = @" for reading";
      goto LABEL_206;
    case 8:
      uint64_t v62 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v62 != 0;
      if (!a5 || !v62) {
        goto LABEL_276;
      }
      v63 = (void *)[@"krwlock" mutableCopy];
      uint64_t v23 = v63;
      if ((a4 & 2) != 0) {
        objc_msgSend(v63, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
      }
      v61 = @" for writing";
      goto LABEL_206;
    case 9:
      uint64_t v64 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v64 != 0;
      if (!a5 || !v64) {
        goto LABEL_276;
      }
      v65 = (void *)[@"krwlock" mutableCopy];
      uint64_t v23 = v65;
      if ((a4 & 2) != 0) {
        objc_msgSend(v65, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
      }
      v61 = @" for upgrading";
      goto LABEL_206;
    case 0xA:
      uint64_t v66 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v66 != 0;
      if (!a5 || !v66) {
        goto LABEL_276;
      }
      v67 = @"user lock";
      goto LABEL_135;
    case 0xB:
      uint64_t v68 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v68 != 0;
      if (!a5 || !v68) {
        goto LABEL_276;
      }
      v67 = @"pthread mutex";
LABEL_135:
      uint64_t v23 = (void *)[(__CFString *)v67 mutableCopy];
      if ((a4 & 2) != 0) {
        objc_msgSend(v23, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
      }
      goto LABEL_207;
    case 0xC:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      v69 = (void *)[@"pthread rwlock" mutableCopy];
      v17 = v69;
      if ((a4 & 2) != 0) {
        objc_msgSend(v69, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
      }
      v70 = @" for reading";
      goto LABEL_196;
    case 0xD:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      v71 = (void *)[@"pthread rwlock" mutableCopy];
      v17 = v71;
      if ((a4 & 2) != 0) {
        objc_msgSend(v71, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
      }
      v70 = @" for writing";
      goto LABEL_196;
    case 0xE:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      v17 = (void *)[@"pthread condvar" mutableCopy];
      goto LABEL_68;
    case 0xF:
    case 0x15:
      goto LABEL_276;
    case 0x10:
      if (!a5) {
        goto LABEL_275;
      }
      v72 = (void *)[@"queue" mutableCopy];
      uint64_t v23 = v72;
      if ((a4 & 2) != 0) {
        objc_msgSend(v72, "appendFormat:", @" workloop address 0x%llx", *(void *)(a1 + 24));
      }
      uint64_t v73 = *(void *)(a1 + 16);
      if (v73 == -8)
      {
        v25 = @" that is suspended";
        goto LABEL_211;
      }
      if (v73 == -7)
      {
        v25 = @" thread to be allocated";
        goto LABEL_211;
      }
      if (v73 == a3)
      {
        v25 = @" processed by this thread";
        goto LABEL_211;
      }
      if (v73)
      {
        v88 = ((void (*)(void (**)(void, void, void), uint64_t))v12[2])(v12, 0xFFFFFFFFLL);
        [v23 appendFormat:@" processed by %@", v88];
        goto LABEL_213;
      }
      v25 = @" in a transient state";
      goto LABEL_211;
    case 0x11:
      if (!a5) {
        goto LABEL_275;
      }
      v74 = (void *)[@"wait4" mutableCopy];
      uint64_t v75 = *(void *)(a1 + 16);
      if (v75 == -1)
      {
        v79 = @" on any child process";
      }
      else
      {
        if ((v75 & 0x8000000000000000) == 0)
        {
          v76 = ((void (*)(void (**)(void, void, void)))v12[2])(v12);
          [v74 appendFormat:@" on %@", v76];
          goto LABEL_270;
        }
        uint64_t v111 = -v75;
        v79 = @" on any process in pgrp %lld";
      }
      goto LABEL_272;
    case 0x12:
      uint64_t v77 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v77 != 0;
      if (!a5 || !v77) {
        goto LABEL_276;
      }
      v74 = (void *)[@"turnstile" mutableCopy];
      uint64_t v78 = *(void *)(a1 + 16);
      if (v78) {
        goto LABEL_164;
      }
      v79 = @" with unknown owner";
      goto LABEL_272;
    case 0x13:
      uint64_t v80 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v80 != 0;
      if (!a5 || !v80) {
        goto LABEL_276;
      }
      v74 = (void *)[@"event link" mutableCopy];
      uint64_t v78 = *(void *)(a1 + 16);
      if (!v78)
      {
        v79 = @" (held)";
        goto LABEL_272;
      }
LABEL_164:
      if (v78 == a3)
      {
        v79 = @" owned by this thread";
        goto LABEL_272;
      }
      v76 = ((void (*)(void (**)(void, void, void), uint64_t))v12[2])(v12, 0xFFFFFFFFLL);
      [v74 appendFormat:@" owned by %@", v76];
      goto LABEL_270;
    case 0x14:
      uint64_t v81 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v81 != 0;
      if (!a5 || !v81) {
        goto LABEL_276;
      }
      v74 = (void *)[@"compressor segment" mutableCopy];
      uint64_t v82 = *(void *)(a1 + 16);
      if (!v82)
      {
        v79 = @" busy for unknown thread";
        goto LABEL_272;
      }
      if (v82 == a3)
      {
        v79 = @" busy for this thread";
LABEL_272:
        objc_msgSend(v74, "appendFormat:", v79, v111);
        goto LABEL_273;
      }
      v76 = ((void (*)(void (**)(void, void, void), uint64_t))v12[2])(v12, 0xFFFFFFFFLL);
      [v74 appendFormat:@" busy for thread %@", v76];
LABEL_270:

LABEL_273:
      v84 = v74;
      goto LABEL_274;
    case 0x16:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      int v18 = @"busy page";
      goto LABEL_174;
    case 0x17:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      v83 = @"pager initialization";
      goto LABEL_194;
    case 0x18:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      v83 = @"pager ready";
      goto LABEL_194;
    case 0x19:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      v83 = @"paging/activity in progress";
      goto LABEL_194;
    case 0x1A:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      v83 = @"mapping in progress";
      goto LABEL_194;
    case 0x1B:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      int v18 = @"blocked vm object";
LABEL_174:
      v17 = (void *)[(__CFString *)v18 mutableCopy];
      if ((a4 & 2) != 0) {
        objc_msgSend(v17, "appendFormat:", @" 0x%llx", *(void *)(a1 + 24));
      }
      goto LABEL_197;
    case 0x1C:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      v83 = @"paging in progress";
      goto LABEL_194;
    case 0x1D:
      BOOL v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5) {
        goto LABEL_276;
      }
      v83 = @"pagein throttle";
LABEL_194:
      v17 = (void *)[(__CFString *)v83 mutableCopy];
      if ((a4 & 2) == 0) {
        goto LABEL_197;
      }
      uint64_t v111 = *(void *)(a1 + 24);
      v70 = @" for vm object 0x%llx";
      goto LABEL_196;
    case 0x1E:
      uint64_t v85 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v85 != 0;
      if (!a5 || !v85) {
        goto LABEL_276;
      }
      v86 = @"exclave core";
      goto LABEL_204;
    case 0x1F:
      uint64_t v87 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v87 != 0;
      if (!a5 || !v87) {
        goto LABEL_276;
      }
      v86 = @"exclave kit";
LABEL_204:
      uint64_t v23 = (void *)[(__CFString *)v86 mutableCopy];
      if ((a4 & 2) != 0)
      {
        uint64_t v111 = *(void *)(a1 + 24);
        v61 = @" id 0x%llx";
LABEL_206:
        objc_msgSend(v23, "appendFormat:", v61, v111);
      }
LABEL_207:
      uint64_t v24 = *(void *)(a1 + 16);
      if (v24)
      {
LABEL_208:
        if (v24 != a3)
        {
          v88 = ((void (*)(void (**)(void, void, void), uint64_t))v12[2])(v12, 0xFFFFFFFFLL);
          [v23 appendFormat:@" owned by %@", v88];
LABEL_213:

LABEL_214:
          v84 = v23;
LABEL_274:
          id v99 = v84;
          *a5 = v99;

          goto LABEL_275;
        }
        v25 = @" owned by this thread";
      }
      else
      {
LABEL_210:
        v25 = @" with unknown owner";
      }
LABEL_211:
      [v23 appendFormat:v25];
      goto LABEL_214;
    default:
      int v19 = *__error();
      char v20 = _sa_logt();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v101 = *(unsigned __int16 *)(a1 + MEMORY[0xD10]);
        *(_DWORD *)buf = 67109120;
        int v113 = v101;
        _os_log_error_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_ERROR, "waitinfo has unknown type %u", buf, 8u);
      }

      BOOL v13 = 0;
      *__error() = v19;
      goto LABEL_276;
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_super v5 = (SAWaitInfo *)a3;
  if (self == v5)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        v7 = v6;
        if (self->_type != v6->_type
          || self->_context != v6->_context
          || (unint64_t v8 = [(SABlockingInfo *)self portFlags], v8 != [(SABlockingInfo *)v7 portFlags])
          || (unint64_t v9 = [(SABlockingInfo *)self portDomain], v9 != [(SABlockingInfo *)v7 portDomain])|| self->_owner != v7->_owner)
        {
          char v17 = 0;
LABEL_18:

          goto LABEL_19;
        }
        v10 = [(SABlockingInfo *)self portName];
        if (!v10)
        {
          objc_super v3 = [(SABlockingInfo *)v7 portName];
          if (!v3)
          {
            char v17 = 1;
LABEL_24:

            goto LABEL_25;
          }
        }
        uint64_t v11 = [(SABlockingInfo *)self portName];
        if (v11)
        {
          id v12 = (void *)v11;
          uint64_t v13 = [(SABlockingInfo *)v7 portName];
          if (v13)
          {
            uint64_t v14 = (void *)v13;
            int v15 = [(SABlockingInfo *)self portName];
            uint64_t v16 = [(SABlockingInfo *)v7 portName];
            char v17 = [v15 isEqualToString:v16];

            if (!v10) {
              goto LABEL_24;
            }
LABEL_25:

            goto LABEL_18;
          }
        }
        char v17 = 0;
        if (!v10) {
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
    char v17 = 0;
  }
LABEL_19:

  return v17;
}

- (int64_t)compare:(id)a3
{
  v4 = a3;
  unsigned int type = self->_type;
  unsigned int v6 = *((unsigned __int16 *)v4 + 4);
  if (type > v6) {
    goto LABEL_7;
  }
  if (type < v6)
  {
LABEL_5:
    int64_t v9 = -1;
    goto LABEL_8;
  }
  unint64_t owner = self->_owner;
  unint64_t v8 = v4[2];
  if (owner > v8) {
    goto LABEL_7;
  }
  if (owner < v8) {
    goto LABEL_5;
  }
  unint64_t context = self->_context;
  unint64_t v11 = v4[3];
  if (context > v11)
  {
LABEL_7:
    int64_t v9 = 1;
    goto LABEL_8;
  }
  if (context >= v11) {
    int64_t v9 = 0;
  }
  else {
    int64_t v9 = -1;
  }
LABEL_8:

  return v9;
}

- (uint64_t)matchesKCDataWaitInfo:(void *)a3 portName:(uint64_t)a4 flags:(uint64_t)a5 domain:
{
  unint64_t v9 = a3;
  if (a1
    && *(_WORD *)(a1 + 8) == *(unsigned __int8 *)(a2 + 24)
    && *(void *)(a1 + 24) == *(void *)(a2 + 16)
    && *(void *)(a1 + 16) == *(void *)a2
    && [(id)a1 portDomain] == a5
    && [(id)a1 portFlags] == a4)
  {
    uint64_t v10 = [(id)a1 portName];
    if (v9 | v10)
    {
      uint64_t v11 = [(id)a1 portName];
      id v12 = (void *)v11;
      uint64_t v13 = 0;
      if (v9 && v11)
      {
        uint64_t v14 = [(id)a1 portName];
        uint64_t v13 = [v14 isEqualToString:v9];
      }
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_context ^ self->_type ^ self->_owner;
}

- (NSString)debugDescription
{
  objc_super v3 = [(SABlockingInfo *)self portName];

  id v4 = [NSString alloc];
  objc_super v5 = v4;
  uint64_t type = self->_type;
  unint64_t context = self->_context;
  unint64_t owner = self->_owner;
  if (v3)
  {
    unint64_t v9 = [(SABlockingInfo *)self portName];
    uint64_t v10 = (void *)[v5 initWithFormat:@"[ wait_type:0x%x, context:0x%llx, owner:0x%llx, port name:%@, flags:0x%llx, domain:%llu]", type, context, owner, v9, -[SABlockingInfo portFlags](self, "portFlags"), -[SABlockingInfo portDomain](self, "portDomain")];
  }
  else
  {
    uint64_t v10 = (void *)[v4 initWithFormat:@"[ wait_type:0x%x, context:0x%llx, owner:0x%llx ]", type, self->_context, owner];
  }
  return (NSString *)v10;
}

- (unint64_t)blockingTid
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int type_low = LOBYTE(self->_type);
  unint64_t result = 0;
  switch(type_low)
  {
    case 0:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 12:
    case 13:
    case 14:
    case 15:
    case 17:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
      return result;
    case 1:
      unint64_t owner = self->_owner;
      BOOL v9 = owner == -6;
      goto LABEL_8;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 18:
    case 19:
    case 20:
    case 30:
    case 31:
      unint64_t result = self->_owner;
      break;
    case 16:
      unint64_t owner = self->_owner;
      BOOL v9 = (owner & 0xFFFFFFFFFFFFFFFELL) == -8;
LABEL_8:
      if (v9) {
        unint64_t result = 0;
      }
      else {
        unint64_t result = owner;
      }
      break;
    default:
      int v5 = *__error();
      unsigned int v6 = _sa_logt();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int type = self->_type;
        v11[0] = 67109120;
        v11[1] = type;
        _os_log_fault_impl(&dword_1BF22B000, v6, OS_LOG_TYPE_FAULT, "waitinfo has unknown type %u", (uint8_t *)v11, 8u);
      }

      v7 = __error();
      unint64_t result = 0;
      int *v7 = v5;
      break;
  }
  return result;
}

- (int)blockingPid
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int type_low = LOBYTE(self->_type);
  if (type_low > 0x1F)
  {
    int v6 = *__error();
    v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int type = self->_type;
      v11[0] = 67109120;
      v11[1] = type;
      _os_log_fault_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_FAULT, "waitinfo has unknown type %u", (uint8_t *)v11, 8u);
    }

    *__error() = v6;
    return -1;
  }
  int v4 = 1 << type_low;
  if ((v4 & 0xFFFDFFAF) != 0) {
    return -1;
  }
  if ((v4 & 0x20040) != 0)
  {
    if (SLODWORD(self->_owner) < 0) {
      return -1;
    }
    else {
      return self->_owner;
    }
  }
  else
  {
    unint64_t owner = self->_owner;
    if (owner == -5 || owner == -3) {
      return -1;
    }
    if (owner == -2)
    {
      return 0;
    }
    else if ((owner & 0x80000000) != 0)
    {
      return -1;
    }
    else
    {
      return self->_owner;
    }
  }
}

- (id)descriptionForPid:(int)a3 tid:(unint64_t)a4 options:(unint64_t)a5 nameCallback:(id)a6
{
  id v8 = 0;
  -[SAWaitInfo _displaysContentForPid:tid:options:displayString:nameCallback:]((uint64_t)self, a3, a4, a5, &v8, a6);
  id v6 = v8;
  return v6;
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)owner
{
  return self->_owner;
}

- (unint64_t)context
{
  return self->_context;
}

+ (id)classDictionaryKey
{
  return @"SAWaitInfo";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 44;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAWaitInfo *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v11 = *__error();
    uint64_t v12 = _sa_logt();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(SAWaitInfo *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = [v13 UTF8String];
      __int16 v24 = 2048;
      unint64_t v25 = [(SAWaitInfo *)self sizeInBytesForSerializedVersion];
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v11;
    id v14 = [(SAWaitInfo *)self debugDescription];
    char v15 = [v14 UTF8String];
    [(SAWaitInfo *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(5534, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 513;
  a3->var2 = self->_type;
  *(void *)(&a3->var2 + 1) = self->_owner;
  *(unint64_t *)((char *)&a3->var3 + 4) = self->_context;
  BOOL v9 = [(SABlockingInfo *)self portName];
  *(unint64_t *)((char *)&a3->var4 + 4) = SASerializableIndexForPointerFromSerializationDictionary(v9, v8);

  *(unint64_t *)((char *)&a3->var5 + 4) = [(SABlockingInfo *)self portFlags];
  *(unint64_t *)((char *)&a3->var6 + 4) = [(SABlockingInfo *)self portDomain];

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v7 = a3;
  int v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    id v6 = [(SABlockingInfo *)self portName];
    [v6 addSelfToSerializationDictionary:v7];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 3u) {
    goto LABEL_17;
  }
  if (a4 <= 0x13)
  {
    int v8 = *__error();
    BOOL v9 = _sa_logt();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = a4;
      __int16 v27 = 2048;
      uint64_t v28 = 20;
      _os_log_error_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAWaitInfo struct %lu", buf, 0x16u);
    }

    *__error() = v8;
    _SASetCrashLogMessage(5565, "bufferLength %lu < serialized SAWaitInfo struct %lu", v10, v11, v12, v13, v14, v15, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    int v16 = *__error();
    uint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = a4;
      __int16 v27 = 2048;
      uint64_t v28 = 44;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5571, "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_17:
    id v24 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAWaitInfo version" userInfo:0];
    objc_exception_throw(v24);
  }
  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
LABEL_9:
    id v6 = objc_alloc_init(SAWaitInfo);
    goto LABEL_10;
  }
  if (a4 <= 0x2B) {
    goto LABEL_14;
  }
  if (*(void *)((char *)a3 + 20) == -1 && !*(void *)((char *)a3 + 28) && !*(void *)((char *)a3 + 36)) {
    goto LABEL_9;
  }
  id v6 = objc_alloc_init(SAWaitInfoWithPortLabel);
  [(SAWaitInfoWithPortLabel *)v6 setPortFlags:*(void *)((char *)a3 + 28)];
  [(SAWaitInfoWithPortLabel *)v6 setPortDomain:*(void *)((char *)a3 + 36)];
LABEL_10:
  v6->super._int type = *((unsigned __int8 *)a3 + 2);
  v6->super._unint64_t owner = *(void *)((char *)a3 + 4);
  v6->super._unint64_t context = *(void *)((char *)a3 + 12);
  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v42 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_22;
  }
  if (a4 <= 0x13)
  {
    int v16 = *__error();
    uint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v44 = a4;
      __int16 v45 = 2048;
      uint64_t v46 = 20;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAWaitInfo struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5599, "bufferLength %lu < serialized SAWaitInfo struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_16:
    int v24 = *__error();
    _sa_logt();
    self = (SAWaitInfo *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v44 = a4;
      __int16 v45 = 2048;
      uint64_t v46 = 44;
      _os_log_error_impl(&dword_1BF22B000, &self->super.super, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu", buf, 0x16u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(5603, "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu", v25, v26, v27, v28, v29, v30, a4);
    _os_crash();
    __break(1u);
LABEL_19:
    int v31 = *__error();
    uint64_t v32 = _sa_logt();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      ClassName = object_getClassName(self);
      *(_DWORD *)buf = 136315138;
      unint64_t v44 = (unint64_t)ClassName;
      _os_log_error_impl(&dword_1BF22B000, v32, OS_LOG_TYPE_ERROR, "wait info with port info, but class is %s", buf, 0xCu);
    }

    *__error() = v31;
    char v34 = object_getClassName(self);
    _SASetCrashLogMessage(5609, "wait info with port info, but class is %s", v35, v36, v37, v38, v39, v40, v34);
    _os_crash();
    __break(1u);
LABEL_22:
    id v41 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAWaitInfo version" userInfo:0];
    objc_exception_throw(v41);
  }
  uint64_t v11 = v10;
  if (*((unsigned __int8 *)a3 + 1) < 2u) {
    goto LABEL_10;
  }
  if (a4 <= 0x2B) {
    goto LABEL_16;
  }
  if (*(void *)((char *)a3 + 20) != -1 || *(void *)((char *)a3 + 28) || *(void *)((char *)a3 + 36))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v12 = *(void *)((char *)a3 + 20);
      uint64_t v13 = self;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v42, v11, v14, 0);
      [(SAWaitInfo *)v13 setPortName:v15];

      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_10:
}

+ (SAWaitInfo)stateWithPAStyleSerializedWaitInfo:(uint64_t)a1
{
  self;
  objc_super v3 = objc_alloc_init(SAWaitInfo);
  v3->_int type = *(unsigned __int8 *)(a2 + 24);
  v3->_unint64_t owner = *(void *)(a2 + 8);
  v3->_unint64_t context = *(void *)(a2 + 16);
  return v3;
}

@end