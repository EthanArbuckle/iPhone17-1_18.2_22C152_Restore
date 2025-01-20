@interface NFRemoteAdminSession
- (BOOL)_openSessionWithTimeout:(unint64_t)a3;
- (BOOL)performRequest;
- (NFRemoteAdminSession)init;
- (unint64_t)run;
- (unsigned)_deactiveAllAppletsOnSE:(id)a3;
- (void)_postProcessNotification:(id)a3 executionStatus:(BOOL)a4 regionIdentifier:(id)a5;
- (void)_preprocessNotification:(id)a3 withTaskID:(id)a4;
- (void)abort:(int64_t)a3;
- (void)processAppletChanged:(id)a3 regionIdentifier:(id)a4;
- (void)processAppletsDeleted:(id)a3 regionIdentifier:(id)a4;
@end

@implementation NFRemoteAdminSession

- (NFRemoteAdminSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFRemoteAdminSession;
  v2 = [(NFRemoteAdminSession *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    endMetric = v2->_endMetric;
    v2->_endMetric = (NSMutableDictionary *)v3;

    v2->_allocateSESession = 1;
  }
  return v2;
}

- (void)abort:(int64_t)a3
{
  v5 = self;
  objc_sync_enter(v5);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v5);
    if (class_isMetaClass(Class)) {
      uint64_t v8 = 43;
    }
    else {
      uint64_t v8 = 45;
    }
    ClassName = object_getClassName(v5);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Aborting (%u)...", v8, ClassName, Name, 90, a3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(v5);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v15 = v13;
    __int16 v16 = 2082;
    v17 = object_getClassName(v5);
    __int16 v18 = 2082;
    v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 90;
    __int16 v22 = 1024;
    int v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborting (%u)...", buf, 0x28u);
  }

  v5->_abort = a3;
  [(NFRemoteAdminConnection *)v5->_connection disconnect];
  objc_sync_exit(v5);
}

- (void)_preprocessNotification:(id)a3 withTaskID:(id)a4
{
  id v274 = a3;
  id v275 = a4;
  [v274 NF_arrayForKey:@"mfdListPreExecution"];
  v273 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v273 count])
  {
    uint64_t v5 = objc_opt_new();
    if (byte_100060438)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v7 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v10 = 45;
        if (isMetaClass) {
          uint64_t v10 = 43;
        }
        v7(6, "%c[%{public}s %{public}s]:%i [TSM] MFD list: %@", v10, ClassName, Name, 112, v273);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = object_getClass(self);
        if (class_isMetaClass(v12)) {
          int v13 = 43;
        }
        else {
          int v13 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v309 = v13;
        __int16 v310 = 2082;
        v311 = object_getClassName(self);
        __int16 v312 = 2082;
        v313 = sel_getName(a2);
        __int16 v314 = 1024;
        int v315 = 112;
        __int16 v316 = 2112;
        CFStringRef v317 = v273;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] MFD list: %@", buf, 0x2Cu);
      }
    }
    v282 = (void *)v5;
    long long v303 = 0u;
    long long v304 = 0u;
    long long v301 = 0u;
    long long v302 = 0u;
    v14 = v273;
    id v15 = [(__CFString *)v14 countByEnumeratingWithState:&v301 objects:v320 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v302;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v302 != v17) {
            objc_enumerationMutation(v14);
          }
          CFStringRef v19 = *(const __CFString **)(*((void *)&v301 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v20 = [(NFSecureElementManagerSession *)self->_seSession appletWithIdentifier:v19];
            if (v20)
            {
              [v282 addObject:v20];
              if (byte_100060438)
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v21 = NFLogGetLogger();
                if (v21)
                {
                  __int16 v22 = (void (*)(uint64_t, const char *, ...))v21;
                  int v23 = object_getClass(self);
                  BOOL v24 = class_isMetaClass(v23);
                  v250 = object_getClassName(self);
                  v256 = sel_getName(a2);
                  uint64_t v25 = 45;
                  if (v24) {
                    uint64_t v25 = 43;
                  }
                  v22(6, "%c[%{public}s %{public}s]:%i [TSM] Deleting applet: %@", v25, v250, v256, 122, v19);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v26 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  v27 = object_getClass(self);
                  if (class_isMetaClass(v27)) {
                    int v28 = 43;
                  }
                  else {
                    int v28 = 45;
                  }
                  v29 = object_getClassName(self);
                  v30 = sel_getName(a2);
                  *(_DWORD *)buf = 67110146;
                  int v309 = v28;
                  __int16 v310 = 2082;
                  v311 = v29;
                  __int16 v312 = 2082;
                  v313 = v30;
                  __int16 v314 = 1024;
                  int v315 = 122;
                  __int16 v316 = 2112;
                  CFStringRef v317 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Deleting applet: %@", buf, 0x2Cu);
                }
              }
            }
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v31 = NFLogGetLogger();
            if (v31)
            {
              v32 = (void (*)(uint64_t, const char *, ...))v31;
              v33 = object_getClass(self);
              BOOL v34 = class_isMetaClass(v33);
              v35 = object_getClassName(self);
              v36 = sel_getName(a2);
              uint64_t v267 = objc_opt_class();
              uint64_t v37 = 45;
              if (v34) {
                uint64_t v37 = 43;
              }
              v32(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", v37, v35, v36, 116, @"mfdListPreExecution", v267);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            __int16 v20 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v38 = object_getClass(self);
              if (class_isMetaClass(v38)) {
                int v39 = 43;
              }
              else {
                int v39 = 45;
              }
              v40 = object_getClassName(self);
              v41 = sel_getName(a2);
              uint64_t v42 = objc_opt_class();
              *(_DWORD *)buf = 67110402;
              int v309 = v39;
              __int16 v310 = 2082;
              v311 = v40;
              __int16 v312 = 2082;
              v313 = v41;
              __int16 v314 = 1024;
              int v315 = 116;
              __int16 v316 = 2114;
              CFStringRef v317 = @"mfdListPreExecution";
              __int16 v318 = 2114;
              v319 = v42;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", buf, 0x36u);
            }
          }
        }
        id v16 = [(__CFString *)v14 countByEnumeratingWithState:&v301 objects:v320 count:16];
      }
      while (v16);
    }

    if ([v282 count]) {
      [(NFSecureElementManagerSession *)self->_seSession deleteApplets:v282 queueServerConnection:0];
    }
  }
  [v274 NF_arrayForKey:@"PTDeleteKeyIdsPreExecution"];
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v43 count] && byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v44 = NFLogGetLogger();
    if (v44)
    {
      v45 = (void (*)(uint64_t, const char *, ...))v44;
      v46 = object_getClass(self);
      BOOL v47 = class_isMetaClass(v46);
      v251 = object_getClassName(self);
      v257 = sel_getName(a2);
      uint64_t v48 = 45;
      if (v47) {
        uint64_t v48 = 43;
      }
      v45(6, "%c[%{public}s %{public}s]:%i [TSM] PT Keys to delete: %@", v48, v251, v257, 133, v43);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v49 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = object_getClass(self);
      if (class_isMetaClass(v50)) {
        int v51 = 43;
      }
      else {
        int v51 = 45;
      }
      v52 = object_getClassName(self);
      v53 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v309 = v51;
      __int16 v310 = 2082;
      v311 = v52;
      __int16 v312 = 2082;
      v313 = v53;
      __int16 v314 = 1024;
      int v315 = 133;
      __int16 v316 = 2112;
      CFStringRef v317 = v43;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] PT Keys to delete: %@", buf, 0x2Cu);
    }
  }
  long long v299 = 0u;
  long long v300 = 0u;
  long long v297 = 0u;
  long long v298 = 0u;
  obj = v43;
  id v54 = [(__CFString *)obj countByEnumeratingWithState:&v297 objects:v307 count:16];
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v298;
    do
    {
      for (j = 0; j != v55; j = (char *)j + 1)
      {
        if (*(void *)v298 != v56) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v58 = *(const __CFString **)(*((void *)&v297 + 1) + 8 * (void)j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v59 = self->_targetSEID;
          uint64_t v296 = 0;
          int v60 = SESEndPointDeleteWithSession();
          v61 = 0;

          v62 = 0;
          if (v60) {
            BOOL v63 = v61 == 0;
          }
          else {
            BOOL v63 = 0;
          }
          if (!v63)
          {
            if (byte_100060438)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v64 = NFLogGetLogger();
              if (v64)
              {
                v65 = (void (*)(uint64_t, const char *, ...))v64;
                v66 = object_getClass(self);
                BOOL v67 = class_isMetaClass(v66);
                v68 = object_getClassName(self);
                v258 = sel_getName(a2);
                if (v67) {
                  uint64_t v69 = 43;
                }
                else {
                  uint64_t v69 = 45;
                }
                v65(6, "%c[%{public}s %{public}s]:%i [TSM] Failed to delete key with identifier %@ : %@", v69, v68, v258, 142, v58, v61);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v70 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                v71 = object_getClass(self);
                if (class_isMetaClass(v71)) {
                  int v72 = 43;
                }
                else {
                  int v72 = 45;
                }
                v73 = object_getClassName(self);
                v74 = sel_getName(a2);
                *(_DWORD *)buf = 67110402;
                int v309 = v72;
                __int16 v310 = 2082;
                v311 = v73;
                __int16 v312 = 2082;
                v313 = v74;
                __int16 v314 = 1024;
                int v315 = 142;
                __int16 v316 = 2112;
                CFStringRef v317 = v58;
                __int16 v318 = 2112;
                v319 = v61;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Failed to delete key with identifier %@ : %@", buf, 0x36u);
              }
            }
            v62 = v61;
          }
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v75 = NFLogGetLogger();
          if (v75)
          {
            v76 = (void (*)(uint64_t, const char *, ...))v75;
            v77 = object_getClass(self);
            BOOL v78 = class_isMetaClass(v77);
            v79 = object_getClassName(self);
            v80 = sel_getName(a2);
            uint64_t v268 = objc_opt_class();
            if (v78) {
              uint64_t v81 = 43;
            }
            else {
              uint64_t v81 = 45;
            }
            v76(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", v81, v79, v80, 136, @"PTDeleteKeyIdsPreExecution", v268);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v62 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v82 = object_getClass(self);
            if (class_isMetaClass(v82)) {
              int v83 = 43;
            }
            else {
              int v83 = 45;
            }
            v84 = object_getClassName(self);
            v85 = sel_getName(a2);
            uint64_t v86 = objc_opt_class();
            *(_DWORD *)buf = 67110402;
            int v309 = v83;
            __int16 v310 = 2082;
            v311 = v84;
            __int16 v312 = 2082;
            v313 = v85;
            __int16 v314 = 1024;
            int v315 = 136;
            __int16 v316 = 2114;
            CFStringRef v317 = @"PTDeleteKeyIdsPreExecution";
            __int16 v318 = 2114;
            v319 = v86;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", buf, 0x36u);
          }
        }
      }
      id v55 = [(__CFString *)obj countByEnumeratingWithState:&v297 objects:v307 count:16];
    }
    while (v55);
  }

  [v274 NF_arrayForKey:@"PTTerminateKeyIdsPreExecution"];
  v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v87 count] && byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v88 = NFLogGetLogger();
    if (v88)
    {
      v89 = (void (*)(uint64_t, const char *, ...))v88;
      v90 = object_getClass(self);
      BOOL v91 = class_isMetaClass(v90);
      v252 = object_getClassName(self);
      v259 = sel_getName(a2);
      uint64_t v92 = 45;
      if (v91) {
        uint64_t v92 = 43;
      }
      v89(6, "%c[%{public}s %{public}s]:%i [TSM] PT Keys to terminate: %@", v92, v252, v259, 147, v87);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v93 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      v94 = object_getClass(self);
      if (class_isMetaClass(v94)) {
        int v95 = 43;
      }
      else {
        int v95 = 45;
      }
      v96 = object_getClassName(self);
      v97 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v309 = v95;
      __int16 v310 = 2082;
      v311 = v96;
      __int16 v312 = 2082;
      v313 = v97;
      __int16 v314 = 1024;
      int v315 = 147;
      __int16 v316 = 2112;
      CFStringRef v317 = v87;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] PT Keys to terminate: %@", buf, 0x2Cu);
    }
  }
  long long v295 = 0u;
  long long v293 = 0u;
  long long v294 = 0u;
  long long v292 = 0u;
  v98 = v87;
  id v99 = [(__CFString *)v98 countByEnumeratingWithState:&v292 objects:v306 count:16];
  v276 = v98;
  if (v99)
  {
    id v100 = v99;
    uint64_t v101 = *(void *)v293;
    do
    {
      for (k = 0; k != v100; k = (char *)k + 1)
      {
        if (*(void *)v293 != v101) {
          objc_enumerationMutation(v98);
        }
        v103 = *(void **)(*((void *)&v292 + 1) + 8 * (void)k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v104 = [v103 objectForKeyedSubscript:@"keyId"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v105 = [v103 NF_stringForKey:@"remoteTerminationRequest"];
            v106 = [v103 objectForKey:@"remoteTerminationRequest"];

            if (v106) {
              BOOL v107 = v105 == 0;
            }
            else {
              BOOL v107 = 0;
            }
            if (v107)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v145 = NFLogGetLogger();
              if (v145)
              {
                v146 = (void (*)(uint64_t, const char *, ...))v145;
                v147 = object_getClass(self);
                BOOL v148 = class_isMetaClass(v147);
                v149 = object_getClassName(self);
                v150 = sel_getName(a2);
                uint64_t v271 = objc_opt_class();
                v261 = v150;
                v98 = v276;
                uint64_t v151 = 45;
                if (v148) {
                  uint64_t v151 = 43;
                }
                v146(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", v151, v149, v261, 164, @"remoteTerminationRequest", v271);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v109 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
              {
                v152 = object_getClass(self);
                if (class_isMetaClass(v152)) {
                  int v153 = 43;
                }
                else {
                  int v153 = 45;
                }
                v154 = object_getClassName(self);
                v155 = sel_getName(a2);
                uint64_t v156 = objc_opt_class();
                *(_DWORD *)buf = 67110402;
                int v309 = v153;
                __int16 v310 = 2082;
                v311 = v154;
                __int16 v312 = 2082;
                v313 = v155;
                __int16 v314 = 1024;
                int v315 = 164;
                __int16 v316 = 2114;
                CFStringRef v317 = @"remoteTerminationRequest";
                __int16 v318 = 2114;
                v319 = v156;
                _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", buf, 0x36u);
              }
            }
            else
            {
              uint64_t v108 = +[NSData NF_dataWithHexString:v105];
              v109 = v108;
              if (!v105 || v108)
              {
                targetSEID = self->_targetSEID;
                uint64_t v291 = 0;
                v158 = targetSEID;
                int v159 = SESEndPointRemoteTerminationRequestFromTSM();
                v160 = 0;

                if (!v159 || (v116 = 0, v160))
                {
                  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  uint64_t v161 = NFLogGetLogger();
                  if (v161)
                  {
                    v162 = (void (*)(uint64_t, const char *, ...))v161;
                    v163 = object_getClass(self);
                    BOOL v164 = class_isMetaClass(v163);
                    v165 = object_getClassName(self);
                    v262 = sel_getName(a2);
                    uint64_t v166 = 45;
                    if (v164) {
                      uint64_t v166 = 43;
                    }
                    v162(3, "%c[%{public}s %{public}s]:%i Failed to terminate key with identifier %{public}@ : %{public}@", v166, v165, v262, 181, v104, v160);
                  }
                  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  v167 = NFSharedLogGetLogger();
                  if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
                  {
                    v168 = object_getClass(self);
                    if (class_isMetaClass(v168)) {
                      int v169 = 43;
                    }
                    else {
                      int v169 = 45;
                    }
                    v170 = object_getClassName(self);
                    v171 = sel_getName(a2);
                    *(_DWORD *)buf = 67110402;
                    int v309 = v169;
                    __int16 v310 = 2082;
                    v311 = v170;
                    __int16 v312 = 2082;
                    v313 = v171;
                    __int16 v314 = 1024;
                    int v315 = 181;
                    __int16 v316 = 2114;
                    CFStringRef v317 = (const __CFString *)v104;
                    __int16 v318 = 2114;
                    v319 = v160;
                    _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to terminate key with identifier %{public}@ : %{public}@", buf, 0x36u);
                  }

                  v116 = v160;
                }
              }
              else
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v110 = NFLogGetLogger();
                if (v110)
                {
                  v111 = (void (*)(uint64_t, const char *, ...))v110;
                  v112 = object_getClass(self);
                  BOOL v113 = class_isMetaClass(v112);
                  v114 = object_getClassName(self);
                  v260 = sel_getName(a2);
                  uint64_t v115 = 45;
                  if (v113) {
                    uint64_t v115 = 43;
                  }
                  v111(3, "%c[%{public}s %{public}s]:%i %{public}@ Got non-nil RTR but it wasn't hex-encoded : %{public}@", v115, v114, v260, 169, @"remoteTerminationRequest", v105);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v116 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                {
                  v117 = object_getClass(self);
                  if (class_isMetaClass(v117)) {
                    int v118 = 43;
                  }
                  else {
                    int v118 = 45;
                  }
                  v119 = object_getClassName(self);
                  v120 = sel_getName(a2);
                  *(_DWORD *)buf = 67110402;
                  int v309 = v118;
                  __int16 v310 = 2082;
                  v311 = v119;
                  __int16 v312 = 2082;
                  v313 = v120;
                  __int16 v314 = 1024;
                  int v315 = 169;
                  __int16 v316 = 2114;
                  CFStringRef v317 = @"remoteTerminationRequest";
                  __int16 v318 = 2114;
                  v319 = v105;
                  _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Got non-nil RTR but it wasn't hex-encoded : %{public}@", buf, 0x36u);
                }
              }

              v98 = v276;
            }
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v133 = NFLogGetLogger();
            if (v133)
            {
              v134 = (void (*)(uint64_t, const char *, ...))v133;
              v135 = object_getClass(self);
              BOOL v136 = class_isMetaClass(v135);
              v137 = object_getClassName(self);
              v138 = sel_getName(a2);
              uint64_t v270 = objc_opt_class();
              uint64_t v139 = 45;
              if (v136) {
                uint64_t v139 = 43;
              }
              v134(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", v139, v137, v138, 156, @"keyId", v270);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v105 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              v140 = object_getClass(self);
              if (class_isMetaClass(v140)) {
                int v141 = 43;
              }
              else {
                int v141 = 45;
              }
              v142 = object_getClassName(self);
              v143 = sel_getName(a2);
              uint64_t v144 = objc_opt_class();
              *(_DWORD *)buf = 67110402;
              int v309 = v141;
              __int16 v310 = 2082;
              v311 = v142;
              __int16 v312 = 2082;
              v313 = v143;
              __int16 v314 = 1024;
              int v315 = 156;
              __int16 v316 = 2114;
              CFStringRef v317 = @"keyId";
              __int16 v318 = 2114;
              v319 = v144;
              _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected String, got %{public}@", buf, 0x36u);
            }
          }
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v121 = NFLogGetLogger();
          if (v121)
          {
            v122 = (void (*)(uint64_t, const char *, ...))v121;
            v123 = object_getClass(self);
            BOOL v124 = class_isMetaClass(v123);
            v125 = object_getClassName(self);
            v126 = sel_getName(a2);
            uint64_t v269 = objc_opt_class();
            uint64_t v127 = 45;
            if (v124) {
              uint64_t v127 = 43;
            }
            v122(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected Dictionary, got %{public}@", v127, v125, v126, 150, @"PTTerminateKeyIdsPreExecution", v269);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v104 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            v128 = object_getClass(self);
            if (class_isMetaClass(v128)) {
              int v129 = 43;
            }
            else {
              int v129 = 45;
            }
            v130 = object_getClassName(self);
            v131 = sel_getName(a2);
            uint64_t v132 = objc_opt_class();
            *(_DWORD *)buf = 67110402;
            int v309 = v129;
            __int16 v310 = 2082;
            v311 = v130;
            __int16 v312 = 2082;
            v313 = v131;
            __int16 v314 = 1024;
            int v315 = 150;
            __int16 v316 = 2114;
            CFStringRef v317 = @"PTTerminateKeyIdsPreExecution";
            __int16 v318 = 2114;
            v319 = v132;
            _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected Dictionary, got %{public}@", buf, 0x36u);
          }
        }
      }
      id v100 = [(__CFString *)v98 countByEnumeratingWithState:&v292 objects:v306 count:16];
    }
    while (v100);
  }

  [v274 NF_arrayForKey:@"FiDOKeyRevokeList"];
  v172 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v172 count] && byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v173 = NFLogGetLogger();
    if (v173)
    {
      v174 = (void (*)(uint64_t, const char *, ...))v173;
      v175 = object_getClass(self);
      BOOL v176 = class_isMetaClass(v175);
      v253 = object_getClassName(self);
      v263 = sel_getName(a2);
      uint64_t v177 = 45;
      if (v176) {
        uint64_t v177 = 43;
      }
      v174(6, "%c[%{public}s %{public}s]:%i [TSM] Revoking FiDO Keys %@", v177, v253, v263, 188, v172);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v178 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
    {
      v179 = object_getClass(self);
      if (class_isMetaClass(v179)) {
        int v180 = 43;
      }
      else {
        int v180 = 45;
      }
      v181 = object_getClassName(self);
      v182 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v309 = v180;
      __int16 v310 = 2082;
      v311 = v181;
      __int16 v312 = 2082;
      v313 = v182;
      __int16 v314 = 1024;
      int v315 = 188;
      __int16 v316 = 2112;
      CFStringRef v317 = v172;
      _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Revoking FiDO Keys %@", buf, 0x2Cu);
    }
  }
  long long v289 = 0u;
  long long v290 = 0u;
  long long v287 = 0u;
  long long v288 = 0u;
  v183 = v172;
  id v283 = [(__CFString *)v183 countByEnumeratingWithState:&v287 objects:v305 count:16];
  if (v283)
  {
    uint64_t v184 = *(void *)v288;
    v277 = v183;
    uint64_t v280 = *(void *)v288;
    do
    {
      for (m = 0; m != v283; m = (char *)m + 1)
      {
        if (*(void *)v288 != v184) {
          objc_enumerationMutation(v183);
        }
        v186 = *(__CFString **)(*((void *)&v287 + 1) + 8 * (void)m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v187 = [(__CFString *)v186 NF_stringForKey:@"relyingParty"];
          v188 = [(__CFString *)v186 NF_stringForKey:@"rpAccountHash"];
          v189 = [(__CFString *)v186 NF_stringForKey:@"keyHash"];
          uint64_t v190 = +[NSData NF_dataWithHexString:v189];
          v191 = (void *)v190;
          if (v187) {
            BOOL v192 = v188 == 0;
          }
          else {
            BOOL v192 = 1;
          }
          if (v192 || v190 == 0)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v194 = NFLogGetLogger();
            if (v194)
            {
              v195 = (void (*)(uint64_t, const char *, ...))v194;
              v196 = object_getClass(self);
              v278 = v191;
              v197 = v188;
              v198 = v183;
              v199 = v189;
              BOOL v200 = class_isMetaClass(v196);
              v254 = object_getClassName(self);
              v264 = sel_getName(a2);
              BOOL v63 = !v200;
              v189 = v199;
              v183 = v198;
              v188 = v197;
              v191 = v278;
              uint64_t v201 = 45;
              if (!v63) {
                uint64_t v201 = 43;
              }
              v195(3, "%c[%{public}s %{public}s]:%i Invalid FiDO Key Revoke directive %{public}@", v201, v254, v264, 200, v186);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v218 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
            {
              v202 = object_getClass(self);
              if (class_isMetaClass(v202)) {
                int v203 = 43;
              }
              else {
                int v203 = 45;
              }
              v204 = object_getClassName(self);
              v205 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v309 = v203;
              __int16 v310 = 2082;
              v311 = v204;
              __int16 v312 = 2082;
              v313 = v205;
              __int16 v314 = 1024;
              int v315 = 200;
              __int16 v316 = 2114;
              CFStringRef v317 = v186;
              _os_log_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid FiDO Key Revoke directive %{public}@", buf, 0x2Cu);
            }
          }
          else
          {
            v279 = v189;
            v218 = +[SEFidoKeySearchParameters withRelyingParty:v187 relyingPartyAccountHash:v188 fidoKeyHash:v190];
            v219 = +[SEFidoKeyService shared];
            seSession = self->_seSession;
            v221 = self->_targetSEID;
            id v286 = 0;
            unsigned int v222 = [v219 deleteFidoKeyFor:v218 usingSession:seSession withSessionSEID:v221 error:&v286];
            v223 = v286;

            if (v222) {
              BOOL v224 = v223 == 0;
            }
            else {
              BOOL v224 = 0;
            }
            if (!v224)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v225 = NFLogGetLogger();
              if (v225)
              {
                v226 = (void (*)(uint64_t, const char *, ...))v225;
                v227 = object_getClass(self);
                BOOL v228 = class_isMetaClass(v227);
                v229 = object_getClassName(self);
                v265 = sel_getName(a2);
                uint64_t v230 = 45;
                if (v228) {
                  uint64_t v230 = 43;
                }
                v226(3, "%c[%{public}s %{public}s]:%i Failed to revoke FiDO Key %{public}@ : %{public}@", v230, v229, v265, 213, v186, v223);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v231 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v231, OS_LOG_TYPE_ERROR))
              {
                v232 = object_getClass(self);
                if (class_isMetaClass(v232)) {
                  int v233 = 43;
                }
                else {
                  int v233 = 45;
                }
                v234 = object_getClassName(self);
                v235 = sel_getName(a2);
                *(_DWORD *)buf = 67110402;
                int v309 = v233;
                __int16 v310 = 2082;
                v311 = v234;
                __int16 v312 = 2082;
                v313 = v235;
                __int16 v314 = 1024;
                int v315 = 213;
                __int16 v316 = 2114;
                CFStringRef v317 = v186;
                __int16 v318 = 2114;
                v319 = v223;
                _os_log_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to revoke FiDO Key %{public}@ : %{public}@", buf, 0x36u);
              }
            }
            v183 = v277;
            v189 = v279;
          }

          uint64_t v184 = v280;
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v206 = NFLogGetLogger();
          if (v206)
          {
            v207 = (void (*)(uint64_t, const char *, ...))v206;
            v208 = object_getClass(self);
            BOOL v209 = class_isMetaClass(v208);
            v210 = object_getClassName(self);
            v211 = sel_getName(a2);
            uint64_t v272 = objc_opt_class();
            uint64_t v212 = 45;
            if (v209) {
              uint64_t v212 = 43;
            }
            v207(3, "%c[%{public}s %{public}s]:%i Element in %{public}@ Expected Dictionary, got %{public}@", v212, v210, v211, 191, @"FiDOKeyRevokeList", v272);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v187 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
          {
            v213 = object_getClass(self);
            if (class_isMetaClass(v213)) {
              int v214 = 43;
            }
            else {
              int v214 = 45;
            }
            v215 = object_getClassName(self);
            v216 = sel_getName(a2);
            uint64_t v217 = objc_opt_class();
            *(_DWORD *)buf = 67110402;
            int v309 = v214;
            __int16 v310 = 2082;
            v311 = v215;
            __int16 v312 = 2082;
            v313 = v216;
            __int16 v314 = 1024;
            int v315 = 191;
            __int16 v316 = 2114;
            CFStringRef v317 = @"FiDOKeyRevokeList";
            __int16 v318 = 2114;
            v319 = v217;
            _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Element in %{public}@ Expected Dictionary, got %{public}@", buf, 0x36u);
          }
        }
      }
      id v283 = [(__CFString *)v183 countByEnumeratingWithState:&v287 objects:v305 count:16];
    }
    while (v283);
  }

  v236 = [v274 NF_numberForKey:@"spManagedStart"];
  if (v236)
  {
    if (byte_100060438)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v237 = NFLogGetLogger();
      if (v237)
      {
        v238 = (void (*)(uint64_t, const char *, ...))v237;
        v239 = object_getClass(self);
        BOOL v240 = class_isMetaClass(v239);
        v241 = object_getClassName(self);
        v266 = sel_getName(a2);
        uint64_t v242 = 45;
        if (v240) {
          uint64_t v242 = 43;
        }
        v238(6, "%c[%{public}s %{public}s]:%i [TSM] SP managed script start", v242, v241, v266, 221);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v243 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
      {
        v244 = object_getClass(self);
        if (class_isMetaClass(v244)) {
          int v245 = 43;
        }
        else {
          int v245 = 45;
        }
        v246 = object_getClassName(self);
        v247 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v309 = v245;
        __int16 v310 = 2082;
        v311 = v246;
        __int16 v312 = 2082;
        v313 = v247;
        __int16 v314 = 1024;
        int v315 = 221;
        _os_log_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] SP managed script start", buf, 0x22u);
      }
    }
    unsigned int v248 = [v236 BOOLValue];
    self->_spManagedScript = v248;
    if (v248) {
      self->_notifySPInstallScriptStart = 1;
    }
  }
}

- (void)_postProcessNotification:(id)a3 executionStatus:(BOOL)a4 regionIdentifier:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 NF_stringForKey:@"type"];
  v11 = v10;
  if (v10)
  {
    if ([v10 isEqualToString:@"restrictedModeExited"] && v6)
    {
      [(NFSecureElementManagerSession *)self->_seSession didExitRestrictedMode:self->_targetSEID];
      [(NSMutableDictionary *)self->_endMetric setObject:&__kCFBooleanTrue forKeyedSubscript:@"restrictedModeExit"];
    }
    else if ([v11 isEqualToString:@"cleanupPerformed"])
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        __int16 v22 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v26 = 45;
        if (isMetaClass) {
          uint64_t v26 = 43;
        }
        v22(6, "%c[%{public}s %{public}s]:%i CleanupPerformed", v26, ClassName, Name, 246);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v27 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = object_getClass(self);
        if (class_isMetaClass(v28)) {
          int v29 = 43;
        }
        else {
          int v29 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v87 = v29;
        __int16 v88 = 2082;
        v89 = object_getClassName(self);
        __int16 v90 = 2082;
        BOOL v91 = sel_getName(a2);
        __int16 v92 = 1024;
        int v93 = 246;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CleanupPerformed", buf, 0x22u);
      }

      v30 = SESEndPointAppletCleanup();
      if (v30)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v31 = NFLogGetLogger();
        if (v31)
        {
          v32 = (void (*)(uint64_t, const char *, ...))v31;
          v33 = object_getClass(self);
          BOOL v34 = class_isMetaClass(v33);
          v71 = object_getClassName(self);
          v74 = sel_getName(a2);
          uint64_t v35 = 45;
          if (v34) {
            uint64_t v35 = 43;
          }
          v32(3, "%c[%{public}s %{public}s]:%i SESEndPointAppletCleanup failed: %@", v35, v71, v74, 249, v30);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v36 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = object_getClass(self);
          if (class_isMetaClass(v37)) {
            int v38 = 43;
          }
          else {
            int v38 = 45;
          }
          int v39 = object_getClassName(self);
          v40 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v87 = v38;
          __int16 v88 = 2082;
          v89 = v39;
          __int16 v90 = 2082;
          BOOL v91 = v40;
          __int16 v92 = 1024;
          int v93 = 249;
          __int16 v94 = 2112;
          int v95 = v30;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SESEndPointAppletCleanup failed: %@", buf, 0x2Cu);
        }
      }
    }
    else if ([v11 isEqualToString:@"appletChanged"])
    {
      __int16 v18 = [v8 NF_stringForKey:@"aid"];
      if ([v18 length])
      {
        v41 = +[NSData NF_dataWithHexString:v18];
        if (v41) {
          [(NSMutableDictionary *)self->_endMetric setObject:v41 forKeyedSubscript:@"aid"];
        }
        if (v6) {
          [(NFRemoteAdminSession *)self processAppletChanged:v18 regionIdentifier:v9];
        }
      }
      id v77 = v9;
      id v78 = v8;
      uint64_t v42 = [v8 NF_arrayForKey:@"aids"];
      v43 = objc_opt_new();
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id obj = v42;
      id v44 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v82;
        while (2)
        {
          for (i = 0; i != v45; i = (char *)i + 1)
          {
            if (*(void *)v82 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v48 = *(void *)(*((void *)&v81 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v60 = NFLogGetLogger();
              if (v60)
              {
                v61 = (void (*)(uint64_t, const char *, ...))v60;
                v62 = object_getClass(self);
                BOOL v63 = class_isMetaClass(v62);
                uint64_t v64 = object_getClassName(self);
                v76 = sel_getName(a2);
                uint64_t v65 = 45;
                if (v63) {
                  uint64_t v65 = 43;
                }
                v61(3, "%c[%{public}s %{public}s]:%i target AID is not NSString!", v65, v64, v76, 272);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v66 = NFSharedLogGetLogger();
              id v8 = v78;
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                BOOL v67 = object_getClass(self);
                if (class_isMetaClass(v67)) {
                  int v68 = 43;
                }
                else {
                  int v68 = 45;
                }
                uint64_t v69 = object_getClassName(self);
                v70 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                int v87 = v68;
                __int16 v88 = 2082;
                v89 = v69;
                __int16 v90 = 2082;
                BOOL v91 = v70;
                __int16 v92 = 1024;
                int v93 = 272;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i target AID is not NSString!", buf, 0x22u);
              }

              id v9 = v77;
              goto LABEL_68;
            }
            [v43 addObject:v48];
          }
          id v45 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
          if (v45) {
            continue;
          }
          break;
        }
      }

      id v9 = v77;
      if ([v43 count] && v6) {
        [(NFRemoteAdminSession *)self processAppletsDeleted:v43 regionIdentifier:v77];
      }

      id v8 = v78;
    }
    __int16 v18 = [v8 NF_numberForKey:@"mfdAllPostExecution"];
    if ([v18 BOOLValue])
    {
      if (byte_100060438)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v49 = NFLogGetLogger();
        if (v49)
        {
          v50 = (void (*)(uint64_t, const char *, ...))v49;
          int v51 = object_getClass(self);
          BOOL v52 = class_isMetaClass(v51);
          v53 = object_getClassName(self);
          uint64_t v75 = sel_getName(a2);
          uint64_t v54 = 45;
          if (v52) {
            uint64_t v54 = 43;
          }
          v50(6, "%c[%{public}s %{public}s]:%i [TSM] Deleting all applets", v54, v53, v75, 286);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v55 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v56 = object_getClass(self);
          if (class_isMetaClass(v56)) {
            int v57 = 43;
          }
          else {
            int v57 = 45;
          }
          CFStringRef v58 = object_getClassName(self);
          v59 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v87 = v57;
          __int16 v88 = 2082;
          v89 = v58;
          __int16 v90 = 2082;
          BOOL v91 = v59;
          __int16 v92 = 1024;
          int v93 = 286;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Deleting all applets", buf, 0x22u);
        }
      }
      [(NFSecureElementManagerSession *)self->_seSession deleteAllApplets:0];
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v12 = NFLogGetLogger();
    if (v12)
    {
      int v13 = (void (*)(uint64_t, const char *, ...))v12;
      v14 = object_getClass(self);
      BOOL v15 = class_isMetaClass(v14);
      id v16 = object_getClassName(self);
      int v72 = sel_getName(a2);
      uint64_t v17 = 45;
      if (v15) {
        uint64_t v17 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Missing notification type", v17, v16, v72, 235);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v87 = v20;
      __int16 v88 = 2082;
      v89 = object_getClassName(self);
      __int16 v90 = 2082;
      BOOL v91 = sel_getName(a2);
      __int16 v92 = 1024;
      int v93 = 235;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing notification type", buf, 0x22u);
    }
  }
LABEL_68:
}

- (void)processAppletChanged:(id)a3 regionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_100037740();
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    id v30 = v8;
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v13 = 43;
    }
    else {
      uint64_t v13 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v16 = a2;
    uint64_t v17 = v9;
    if (self) {
      serverState = self->_serverState;
    }
    else {
      serverState = 0;
    }
    CFStringRef v19 = serverState;
    int v20 = [(NFRemoteAdminState *)v19 serverIdentifier];
    v11(6, "%c[%{public}s %{public}s]:%i updating aid %{public}@ with topic %{public}@", v13, ClassName, Name, 296, v7, v20);

    id v9 = v17;
    id v8 = v30;
    a2 = v16;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    BOOL v24 = object_getClassName(self);
    uint64_t v25 = sel_getName(a2);
    if (self) {
      uint64_t v26 = self->_serverState;
    }
    else {
      uint64_t v26 = 0;
    }
    v27 = v26;
    int v28 = [(NFRemoteAdminState *)v27 serverIdentifier];
    *(_DWORD *)buf = 67110402;
    int v32 = v23;
    __int16 v33 = 2082;
    BOOL v34 = v24;
    __int16 v35 = 2082;
    v36 = v25;
    __int16 v37 = 1024;
    int v38 = 296;
    __int16 v39 = 2114;
    id v40 = v7;
    __int16 v41 = 2114;
    uint64_t v42 = v28;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i updating aid %{public}@ with topic %{public}@", buf, 0x36u);
  }
  sub_10003B14C(v9, v8, v7);

  if (self) {
    delegate = self->_delegate;
  }
  else {
    delegate = 0;
  }
  [(NFRemoteAdminSessionDelegate *)delegate handleAppletStateChange:v7];
}

- (void)processAppletsDeleted:(id)a3 regionIdentifier:(id)a4
{
  id v6 = a3;
  id v33 = a4;
  int v32 = sub_100037740();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v31 = *(void *)v36;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v9);
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          if (class_isMetaClass(Class)) {
            uint64_t v14 = 43;
          }
          else {
            uint64_t v14 = 45;
          }
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          if (self) {
            serverState = self->_serverState;
          }
          else {
            serverState = 0;
          }
          __int16 v18 = serverState;
          CFStringRef v19 = [(NFRemoteAdminState *)v18 serverIdentifier];
          v12(6, "%c[%{public}s %{public}s]:%i updating aid %{public}@ with topic %{public}@", v14, ClassName, Name, 308, v10, v19);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v20 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = object_getClass(self);
          if (class_isMetaClass(v21)) {
            int v22 = 43;
          }
          else {
            int v22 = 45;
          }
          int v23 = object_getClassName(self);
          BOOL v24 = sel_getName(a2);
          if (self) {
            uint64_t v25 = self->_serverState;
          }
          else {
            uint64_t v25 = 0;
          }
          uint64_t v26 = v25;
          v27 = [(NFRemoteAdminState *)v26 serverIdentifier];
          *(_DWORD *)buf = 67110402;
          int v40 = v22;
          __int16 v41 = 2082;
          uint64_t v42 = v23;
          __int16 v43 = 2082;
          id v44 = v24;
          __int16 v45 = 1024;
          int v46 = 308;
          __int16 v47 = 2114;
          uint64_t v48 = v10;
          __int16 v49 = 2114;
          v50 = v27;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i updating aid %{public}@ with topic %{public}@", buf, 0x36u);
        }
        sub_10003B14C(v32, v33, v10);
        id v9 = (char *)v9 + 1;
      }
      while (v8 != v9);
      id v28 = [obj countByEnumeratingWithState:&v35 objects:v51 count:16];
      id v8 = v28;
    }
    while (v28);
  }

  if (self) {
    delegate = self->_delegate;
  }
  else {
    delegate = 0;
  }
  [(NFRemoteAdminSessionDelegate *)delegate handleAppletsDeleted:obj];
}

- (BOOL)performRequest
{
  sub_100037740();
  uint64_t v3 = (id *)objc_claimAutoreleasedReturnValue();
  if (self) {
    serverState = self->_serverState;
  }
  else {
    serverState = 0;
  }
  uint64_t v5 = serverState;
  id v6 = [(NFRemoteAdminState *)v5 serverIdentifier];
  id v7 = sub_10003C478(v3, v6, self->_seSession);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  id v9 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v7)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(6, "%c[%{public}s %{public}s]:%i Performing request", v13, ClassName, Name, 325);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v319 = v16;
      __int16 v320 = 2082;
      v321 = object_getClassName(self);
      __int16 v322 = 2082;
      v323 = sel_getName(a2);
      __int16 v324 = 1024;
      int v325 = 325;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing request", buf, 0x22u);
    }

    uint64_t v17 = objc_opt_new();
    uint64_t v18 = objc_opt_new();
    connection = self->_connection;
    int v20 = self->_serverState;
    uint64_t v21 = [(NFRemoteAdminState *)v20 httpHeaderInfo];
    v305 = (void *)v18;
    id v22 = [(NFRemoteAdminConnection *)connection performRequest:@"get_pending_commands" body:v7 header:v21 response:v17 responseHeader:v18 httpStatus:0 duration:0 sessionError:0];

    if ((v22 | 8) == 0x19
      || ([(NFRemoteAdminState *)self->_serverState setHttpHeaderInfo:v305], v22 == 18))
    {
      +[NFExceptionsCALogger postAnalyticsTSMConnectivityException:v22];
    }
    if (self->_abort)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v23 = NFLogGetLogger();
      if (v23)
      {
        BOOL v24 = (void (*)(uint64_t, const char *, ...))v23;
        uint64_t v25 = object_getClass(self);
        BOOL v26 = class_isMetaClass(v25);
        v27 = object_getClassName(self);
        v277 = sel_getName(a2);
        uint64_t v28 = 45;
        if (v26) {
          uint64_t v28 = 43;
        }
        v24(6, "%c[%{public}s %{public}s]:%i Aborted...", v28, v27, v277, 348);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = object_getClass(self);
        if (class_isMetaClass(v30)) {
          int v31 = 43;
        }
        else {
          int v31 = 45;
        }
        int v32 = object_getClassName(self);
        id v33 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v319 = v31;
        __int16 v320 = 2082;
        v321 = v32;
        __int16 v322 = 2082;
        v323 = v33;
        __int16 v324 = 1024;
        int v325 = 348;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborted...", buf, 0x22u);
      }

      BOOL v34 = 0;
      unint64_t v35 = 1;
    }
    else
    {
      if (!v22)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v55 = NFLogGetLogger();
        if (v55)
        {
          uint64_t v56 = (void (*)(uint64_t, const char *, ...))v55;
          int v57 = object_getClass(self);
          BOOL v58 = class_isMetaClass(v57);
          v59 = object_getClassName(self);
          uint64_t v280 = sel_getName(a2);
          uint64_t v60 = 45;
          if (v58) {
            uint64_t v60 = 43;
          }
          v56(6, "%c[%{public}s %{public}s]:%i Request sent success", v60, v59, v280, 384);
        }
        long long v304 = v17;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v61 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = object_getClass(self);
          if (class_isMetaClass(v62)) {
            int v63 = 43;
          }
          else {
            int v63 = 45;
          }
          uint64_t v64 = object_getClassName(self);
          uint64_t v65 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v319 = v63;
          __int16 v320 = 2082;
          v321 = v64;
          __int16 v322 = 2082;
          v323 = v65;
          __int16 v324 = 1024;
          int v325 = 384;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Request sent success", buf, 0x22u);
        }

        __int16 v310 = self;
        [(NFRemoteAdminState *)self->_serverState setUnsentScriptResponse:0];
        long long v303 = v7;
        [v7 objectForKeyedSubscript:@"SEStateInformation"];
        v306 = v3;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        if (obj)
        {
          long long v314 = 0u;
          long long v315 = 0u;
          long long v312 = 0u;
          long long v313 = 0u;
          id v66 = [obj countByEnumeratingWithState:&v312 objects:v317 count:16];
          if (v66)
          {
            id v67 = v66;
            uint64_t v68 = *(void *)v313;
            do
            {
              for (i = 0; i != v67; i = (char *)i + 1)
              {
                if (*(void *)v313 != v68) {
                  objc_enumerationMutation(obj);
                }
                v70 = *(void **)(*((void *)&v312 + 1) + 8 * i);
                v71 = [v70 objectForKeyedSubscript:@"secureElementType"];
                int v72 = [v70 objectForKeyedSubscript:@"osUpdateInfo"];

                if (v72 && [v71 isEqualToString:@"JCOP"])
                {
                  if (byte_100060438)
                  {
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    uint64_t v73 = NFLogGetLogger();
                    if (v73)
                    {
                      v74 = (void (*)(uint64_t, const char *, ...))v73;
                      uint64_t v75 = object_getClass(v310);
                      BOOL v76 = class_isMetaClass(v75);
                      id v77 = object_getClassName(v310);
                      v281 = sel_getName(a2);
                      uint64_t v78 = 45;
                      if (v76) {
                        uint64_t v78 = 43;
                      }
                      uint64_t v272 = v77;
                      uint64_t v3 = v306;
                      v74(6, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", v78, v272, v281, 395);
                    }
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v79 = NFSharedLogGetLogger();
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                    {
                      v80 = object_getClass(v310);
                      if (class_isMetaClass(v80)) {
                        int v81 = 43;
                      }
                      else {
                        int v81 = 45;
                      }
                      long long v82 = object_getClassName(v310);
                      long long v83 = sel_getName(a2);
                      *(_DWORD *)buf = 67109890;
                      int v319 = v81;
                      uint64_t v3 = v306;
                      __int16 v320 = 2082;
                      v321 = v82;
                      __int16 v322 = 2082;
                      v323 = v83;
                      __int16 v324 = 1024;
                      int v325 = 395;
                      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", buf, 0x22u);
                    }
                  }
                  sub_10003B534(v3, 0);
                }
                long long v84 = [v70 objectForKeyedSubscript:@"jsblCounterChanged"];

                if (v84)
                {
                  if (byte_100060438)
                  {
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    uint64_t v85 = NFLogGetLogger();
                    if (v85)
                    {
                      uint64_t v86 = (void (*)(uint64_t, const char *, ...))v85;
                      int v87 = object_getClass(v310);
                      BOOL v88 = class_isMetaClass(v87);
                      v89 = object_getClassName(v310);
                      v282 = sel_getName(a2);
                      uint64_t v90 = 45;
                      if (v88) {
                        uint64_t v90 = 43;
                      }
                      v86(6, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", v90, v89, v282, 401);
                    }
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    BOOL v91 = NFSharedLogGetLogger();
                    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                    {
                      __int16 v92 = object_getClass(v310);
                      if (class_isMetaClass(v92)) {
                        int v93 = 43;
                      }
                      else {
                        int v93 = 45;
                      }
                      __int16 v94 = object_getClassName(v310);
                      int v95 = sel_getName(a2);
                      *(_DWORD *)buf = 67109890;
                      int v319 = v93;
                      __int16 v320 = 2082;
                      v321 = v94;
                      __int16 v322 = 2082;
                      v323 = v95;
                      __int16 v324 = 1024;
                      int v325 = 401;
                      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", buf, 0x22u);
                    }
                  }
                  sub_10003B534(v3, 0);
                }
              }
              id v67 = [obj countByEnumeratingWithState:&v312 objects:v317 count:16];
            }
            while (v67);
          }
        }
        v96 = [v7 objectForKeyedSubscript:@"jsblCounterChanged"];

        v97 = v310;
        uint64_t v17 = v304;
        if (v96)
        {
          if (byte_100060438)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v98 = NFLogGetLogger();
            if (v98)
            {
              id v99 = (void (*)(uint64_t, const char *, ...))v98;
              id v100 = object_getClass(v310);
              BOOL v101 = class_isMetaClass(v100);
              v102 = object_getClassName(v310);
              id v283 = sel_getName(a2);
              uint64_t v103 = 45;
              if (v101) {
                uint64_t v103 = 43;
              }
              v99(6, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", v103, v102, v283, 408);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v104 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
            {
              v105 = object_getClass(v310);
              if (class_isMetaClass(v105)) {
                int v106 = 43;
              }
              else {
                int v106 = 45;
              }
              BOOL v107 = object_getClassName(v310);
              uint64_t v108 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v319 = v106;
              __int16 v320 = 2082;
              v321 = v107;
              __int16 v322 = 2082;
              v323 = v108;
              __int16 v324 = 1024;
              int v325 = 408;
              _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Clearing JCOP update info", buf, 0x22u);
            }
          }
          sub_10003B534(v3, 0);
        }
        sub_10003B810(v3, 0);
        sub_10003BFF0(v3);
        if (v310)
        {
          [(NFRemoteAdminState *)v310->_serverState save];
          id v109 = v304;
          id v110 = v7;
          v111 = v3;
          if ([v109 count])
          {
            long long v298 = v111;
            v112 = [v109 NF_dictionaryForKey:@"kNotification"];
            BOOL v113 = [v109 objectForKeyedSubscript:@"kStartNewSession"];
            unsigned int v300 = [v113 BOOLValue];

            long long v302 = [v109 NF_stringForKey:@"kTaskId"];
            v307 = [v109 NF_stringForKey:@"targetSEID"];
            v114 = [v109 objectForKeyedSubscript:@"kVersion"];
            id v115 = [v114 integerValue];

            v116 = [v110 objectForKeyedSubscript:@"kVersion"];
            id v117 = [v116 integerValue];

            if (v115 != v117)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v118 = NFLogGetLogger();
              if (v118)
              {
                v119 = (void (*)(uint64_t, const char *, ...))v118;
                v120 = object_getClass(v310);
                BOOL v121 = class_isMetaClass(v120);
                v122 = object_getClassName(v310);
                v123 = v112;
                BOOL v124 = sel_getName("_processServerResponse:originalRequest:storage:");
                v125 = +[NSNumber numberWithInteger:v117];
                v126 = +[NSNumber numberWithInteger:v115];
                v284 = v124;
                v112 = v123;
                uint64_t v127 = 45;
                if (v121) {
                  uint64_t v127 = 43;
                }
                v119(4, "%c[%{public}s %{public}s]:%i Protocol version mismatch, expected=%{public}@, rcv=%{public}@", v127, v122, v284, 498, v125, v126);

                id v7 = v303;
                uint64_t v3 = v306;
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v128 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              {
                int v129 = object_getClass(v310);
                uint64_t v296 = v112;
                if (class_isMetaClass(v129)) {
                  int v130 = 43;
                }
                else {
                  int v130 = 45;
                }
                v131 = object_getClassName(v310);
                uint64_t v132 = sel_getName("_processServerResponse:originalRequest:storage:");
                uint64_t v133 = +[NSNumber numberWithInteger:v117];
                v134 = +[NSNumber numberWithInteger:v115];
                *(_DWORD *)buf = 67110402;
                int v319 = v130;
                v112 = v296;
                __int16 v320 = 2082;
                v321 = v131;
                __int16 v322 = 2082;
                v323 = v132;
                __int16 v324 = 1024;
                int v325 = 498;
                __int16 v326 = 2114;
                CFStringRef v327 = v133;
                __int16 v328 = 2114;
                *(void *)v329 = v134;
                _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Protocol version mismatch, expected=%{public}@, rcv=%{public}@", buf, 0x36u);
              }
              v97 = v310;
              uint64_t v17 = v304;
            }
            v135 = v307;
            BOOL v136 = +[NSData NF_dataWithHexString:v307];

            if (!v136)
            {

              v135 = 0;
            }
            unsigned int v137 = v300;
            if (v135) {
              char v138 = 1;
            }
            else {
              char v138 = v300;
            }
            if (v138)
            {
              uint64_t v139 = v135;
              p_targetSEID = &v97->_targetSEID;
              v308 = v139;
              objc_storeStrong((id *)&v97->_targetSEID, v139);
              if (v112 && v302)
              {
                [(NFRemoteAdminSession *)v97 _preprocessNotification:v112 withTaskID:v302];
              }
              else
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v188 = NFLogGetLogger();
                if (v188)
                {
                  v189 = (void (*)(uint64_t, const char *, ...))v188;
                  uint64_t v190 = object_getClass(v97);
                  BOOL v191 = class_isMetaClass(v190);
                  BOOL v192 = object_getClassName(v97);
                  long long v288 = sel_getName("_processServerResponse:originalRequest:storage:");
                  uint64_t v193 = 45;
                  if (v191) {
                    uint64_t v193 = 43;
                  }
                  v189(4, "%c[%{public}s %{public}s]:%i Invalid notification and task id", v193, v192, v288, 519);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v194 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
                {
                  v195 = object_getClass(v97);
                  if (class_isMetaClass(v195)) {
                    int v196 = 43;
                  }
                  else {
                    int v196 = 45;
                  }
                  v197 = object_getClassName(v97);
                  v198 = sel_getName("_processServerResponse:originalRequest:storage:");
                  *(_DWORD *)buf = 67109890;
                  int v319 = v196;
                  __int16 v320 = 2082;
                  v321 = v197;
                  __int16 v322 = 2082;
                  v323 = v198;
                  __int16 v324 = 1024;
                  int v325 = 519;
                  _os_log_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid notification and task id", buf, 0x22u);
                }

                unsigned int v137 = v300;
              }
              if (v137)
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v199 = NFLogGetLogger();
                if (v199)
                {
                  BOOL v200 = (void (*)(uint64_t, const char *, ...))v199;
                  uint64_t v201 = object_getClass(v97);
                  BOOL v202 = class_isMetaClass(v201);
                  int v203 = object_getClassName(v97);
                  long long v289 = sel_getName("_processServerResponse:originalRequest:storage:");
                  uint64_t v204 = 45;
                  if (v202) {
                    uint64_t v204 = 43;
                  }
                  v200(6, "%c[%{public}s %{public}s]:%i New session requested", v204, v203, v289, 524);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v205 = NFSharedLogGetLogger();
                v135 = v308;
                if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v206 = object_getClass(v97);
                  if (class_isMetaClass(v206)) {
                    int v207 = 43;
                  }
                  else {
                    int v207 = 45;
                  }
                  v208 = object_getClassName(v97);
                  BOOL v209 = sel_getName("_processServerResponse:originalRequest:storage:");
                  *(_DWORD *)buf = 67109890;
                  int v319 = v207;
                  __int16 v320 = 2082;
                  v321 = v208;
                  __int16 v322 = 2082;
                  v323 = v209;
                  __int16 v324 = 1024;
                  int v325 = 524;
                  _os_log_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i New session requested", buf, 0x22u);
                }

                v97->_spManagedScript = 0;
                BOOL v34 = 1;
              }
              else
              {
                [v109 NF_dictionaryForKey:@"redirectRequest"];
                v301 = long long v297 = v112;
                if ([v301 count])
                {
                  uint64_t v210 = sub_10003D270(v298, v302);
                  v135 = v308;
                  if (v210)
                  {
                    v211 = (NFRemoteAdminRedirectState *)v210;
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    uint64_t v212 = NFLogGetLogger();
                    if (v212)
                    {
                      v213 = (void (*)(uint64_t, const char *, ...))v212;
                      int v214 = object_getClass(v97);
                      BOOL v215 = class_isMetaClass(v214);
                      v216 = object_getClassName(v97);
                      long long v290 = sel_getName("_processServerResponse:originalRequest:storage:");
                      uint64_t v217 = 45;
                      if (v215) {
                        uint64_t v217 = 43;
                      }
                      id v274 = v216;
                      v135 = v308;
                      v213(6, "%c[%{public}s %{public}s]:%i Redirect request is aready in queue", v217, v274, v290, 538);
                    }
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v218 = NFSharedLogGetLogger();
                    if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
                    {
                      v219 = object_getClass(v97);
                      if (class_isMetaClass(v219)) {
                        int v220 = 43;
                      }
                      else {
                        int v220 = 45;
                      }
                      v221 = object_getClassName(v97);
                      unsigned int v222 = sel_getName("_processServerResponse:originalRequest:storage:");
                      *(_DWORD *)buf = 67109890;
                      int v319 = v220;
                      v135 = v308;
                      __int16 v320 = 2082;
                      v321 = v221;
                      __int16 v322 = 2082;
                      v323 = v222;
                      __int16 v324 = 1024;
                      int v325 = 538;
                      _os_log_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Redirect request is aready in queue", buf, 0x22u);
                    }

                    [(NFRemoteAdminState *)v211 setPendingImmediateRetry:1];
                    [(NFRemoteAdminRedirectState *)v211 save];
                  }
                  else
                  {
                    v254 = [NFRemoteAdminRedirectState alloc];
                    v255 = [(NFRemoteAdminConnection *)v97->_connection urlString];
                    v256 = [(NFRemoteAdminState *)v97->_serverState serverIdentifier];
                    v211 = [(NFRemoteAdminRedirectState *)v254 initWithDictionary:v109 sourceURL:v255 originator:v256];

                    v257 = [(NFRemoteAdminState *)v97->_serverState httpHeaderInfo];
                    [(NFRemoteAdminState *)v211 setHttpHeaderInfo:v257];

                    sub_10003D160(v298, v211);
                  }
                  v97->_returnCode = 11;

                  BOOL v34 = 0;
                }
                else
                {
                  v223 = +[NFSecureElement embeddedSecureElementWithError:0];
                  BOOL v224 = [v223 serialNumber];
                  id v225 = [v224 caseInsensitiveCompare:*p_targetSEID];

                  if (!v225) {
                    [(NFRemoteAdminSession *)v97 _deactiveAllAppletsOnSE:v97->_targetSEID];
                  }
                  id v226 = v109;
                  v227 = [v226 NF_dictionaryForKey:@"kNotification"];
                  uint64_t v228 = [v226 NF_stringForKey:@"kBatchId"];
                  long long v299 = [v226 NF_stringForKey:@"kTaskId"];
                  v229 = objc_opt_new();
                  [v229 setSeid:v97->_targetSEID];
                  [v229 setIncludeAPDUDuration:1];
                  [v229 setDisableCompletionNotification:v97->_spManagedScript];
                  uint64_t v230 = objc_opt_new();
                  v231 = +[NSNumber numberWithInteger:2];
                  [v230 setObject:v231 forKeyedSubscript:@"kVersion"];

                  if (v228) {
                    [v230 setObject:v228 forKeyedSubscript:@"kBatchId"];
                  }
                  if (v299) {
                    [v230 setObject:v299 forKeyedSubscript:@"kTaskId"];
                  }
                  long long v294 = (void *)v228;
                  if (*p_targetSEID) {
                    [v230 setObject:*p_targetSEID forKeyedSubscript:@"targetSEID"];
                  }
                  v232 = objc_opt_new();
                  [v230 setObject:v232 forKeyedSubscript:@"kCommandsResponse"];

                  [v230 setObject:@"UnexpectedInterruption" forKeyedSubscript:@"clientIncompleteReason"];
                  int v233 = +[NSNumber numberWithBool:1];
                  [v230 setObject:v233 forKeyedSubscript:@"incompletedExecution"];

                  [(NFRemoteAdminState *)v310->_serverState setUnsentScriptResponse:v230];
                  v234 = [v227 NF_stringForKey:@"type"];
                  [v229 setToSystemOS:[v234 isEqualToString:@"restrictedModeExited"]];
                  seSession = v310->_seSession;
                  id v316 = 0;
                  unsigned int v295 = [(NFSecureElementManagerSession *)seSession runScript:v226 parameters:v229 outputResults:&v316];
                  id v236 = v316;
                  [(NFRemoteAdminState *)v310->_serverState setUnsentScriptResponse:v236];
                  [(NFRemoteAdminState *)v310->_serverState save];
                  id v237 = [v229 outFinalSWStatus];
                  v238 = +[NSNumber numberWithUnsignedInteger:v237];
                  [(NSMutableDictionary *)v310->_endMetric setObject:v238 forKeyedSubscript:@"status"];

                  if (byte_100060438)
                  {
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    uint64_t v239 = NFLogGetLogger();
                    if (v239)
                    {
                      BOOL v240 = (void (*)(uint64_t, const char *, ...))v239;
                      v241 = object_getClass(v310);
                      BOOL v242 = class_isMetaClass(v241);
                      v243 = object_getClassName(v310);
                      uint64_t v291 = sel_getName("_executeScript:");
                      uint64_t v244 = 45;
                      if (v242) {
                        uint64_t v244 = 43;
                      }
                      id v275 = v243;
                      id v7 = v303;
                      v240(6, "%c[%{public}s %{public}s]:%i [TSM] Execution result=%ld, lastAPDUStatus=0x%lx", v244, v275, v291, 473, v295, v237);
                    }
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    int v245 = NFSharedLogGetLogger();
                    if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
                    {
                      v246 = object_getClass(v310);
                      if (class_isMetaClass(v246)) {
                        int v247 = 43;
                      }
                      else {
                        int v247 = 45;
                      }
                      unsigned int v248 = object_getClassName(v310);
                      v249 = sel_getName("_executeScript:");
                      *(_DWORD *)buf = 67110402;
                      int v319 = v247;
                      id v7 = v303;
                      __int16 v320 = 2082;
                      v321 = v248;
                      __int16 v322 = 2082;
                      v323 = v249;
                      __int16 v324 = 1024;
                      int v325 = 473;
                      __int16 v326 = 2048;
                      CFStringRef v327 = (const __CFString *)v295;
                      __int16 v328 = 2048;
                      *(void *)v329 = v237;
                      _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Execution result=%ld, lastAPDUStatus=0x%lx", buf, 0x36u);
                    }
                  }
                  v112 = v297;
                  if (v297)
                  {
                    if (v295) {
                      BOOL v250 = 0;
                    }
                    else {
                      BOOL v250 = v237 == (id)36864;
                    }
                    uint64_t v251 = v250;
                    v252 = [(NFRemoteAdminState *)v310->_serverState serverIdentifier];
                    [(NFRemoteAdminSession *)v310 _postProcessNotification:v297 executionStatus:v251 regionIdentifier:v252];
                  }
                  v253 = [(NFRemoteAdminState *)v310->_serverState unsentScriptResponse];

                  uint64_t v3 = v306;
                  uint64_t v17 = v304;
                  if (v253)
                  {
                    [(NFSecureElementManagerSession *)v310->_seSession refreshSecureElement:v310->_targetSEID];
                    BOOL v34 = 1;
                  }
                  else
                  {
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    uint64_t v258 = NFLogGetLogger();
                    if (v258)
                    {
                      v259 = (void (*)(uint64_t, const char *, ...))v258;
                      v260 = object_getClass(v310);
                      BOOL v261 = class_isMetaClass(v260);
                      v262 = object_getClassName(v310);
                      long long v292 = sel_getName("_processServerResponse:originalRequest:storage:");
                      uint64_t v263 = 45;
                      if (v261) {
                        uint64_t v263 = 43;
                      }
                      v259(3, "%c[%{public}s %{public}s]:%i C-APDU execution failure", v263, v262, v292, 568);
                    }
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v264 = NFSharedLogGetLogger();
                    if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR))
                    {
                      v265 = object_getClass(v310);
                      if (class_isMetaClass(v265)) {
                        int v266 = 43;
                      }
                      else {
                        int v266 = 45;
                      }
                      uint64_t v267 = object_getClassName(v310);
                      uint64_t v268 = sel_getName("_processServerResponse:originalRequest:storage:");
                      *(_DWORD *)buf = 67109890;
                      int v319 = v266;
                      __int16 v320 = 2082;
                      v321 = v267;
                      __int16 v322 = 2082;
                      v323 = v268;
                      __int16 v324 = 1024;
                      int v325 = 568;
                      _os_log_impl((void *)&_mh_execute_header, v264, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i C-APDU execution failure", buf, 0x22u);
                    }

                    BOOL v34 = 0;
                    v310->_returnCode = 4;
                  }
                  v135 = v308;
                }
              }
            }
            else
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v177 = NFLogGetLogger();
              if (v177)
              {
                v178 = (void (*)(uint64_t, const char *, ...))v177;
                v179 = object_getClass(v97);
                BOOL v180 = class_isMetaClass(v179);
                v181 = object_getClassName(v97);
                long long v287 = sel_getName("_processServerResponse:originalRequest:storage:");
                uint64_t v182 = 45;
                if (v180) {
                  uint64_t v182 = 43;
                }
                v178(3, "%c[%{public}s %{public}s]:%i Missing target SEID.  Halt TSM script execution", v182, v181, v287, 507);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v183 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
              {
                uint64_t v184 = object_getClass(v97);
                if (class_isMetaClass(v184)) {
                  int v185 = 43;
                }
                else {
                  int v185 = 45;
                }
                v186 = object_getClassName(v97);
                v187 = sel_getName("_processServerResponse:originalRequest:storage:");
                *(_DWORD *)buf = 67109890;
                int v319 = v185;
                __int16 v320 = 2082;
                v321 = v186;
                __int16 v322 = 2082;
                v323 = v187;
                __int16 v324 = 1024;
                int v325 = 507;
                _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing target SEID.  Halt TSM script execution", buf, 0x22u);
              }

              BOOL v34 = 0;
              v97->_returnCode = 4;
            }
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v166 = NFLogGetLogger();
            if (v166)
            {
              v167 = (void (*)(uint64_t, const char *, ...))v166;
              v168 = object_getClass(v310);
              BOOL v169 = class_isMetaClass(v168);
              v170 = object_getClassName(v310);
              id v286 = sel_getName("_processServerResponse:originalRequest:storage:");
              uint64_t v171 = 45;
              if (v169) {
                uint64_t v171 = 43;
              }
              v167(6, "%c[%{public}s %{public}s]:%i no further action required", v171, v170, v286, 483);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v172 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v173 = object_getClass(v310);
              if (class_isMetaClass(v173)) {
                int v174 = 43;
              }
              else {
                int v174 = 45;
              }
              v175 = object_getClassName(v310);
              BOOL v176 = sel_getName("_processServerResponse:originalRequest:storage:");
              *(_DWORD *)buf = 67109890;
              int v319 = v174;
              __int16 v320 = 2082;
              v321 = v175;
              __int16 v322 = 2082;
              v323 = v176;
              __int16 v324 = 1024;
              int v325 = 483;
              _os_log_impl((void *)&_mh_execute_header, v172, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i no further action required", buf, 0x22u);
            }

            BOOL v34 = 0;
            v310->_returnCode = 0;
          }
        }
        else
        {
          [0 save];
          id v269 = v304;
          id v270 = v7;
          uint64_t v271 = v3;
          BOOL v34 = 0;
        }

        goto LABEL_27;
      }
      if (v22 == 3)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v44 = NFLogGetLogger();
        if (v44)
        {
          __int16 v45 = (void (*)(uint64_t, const char *, ...))v44;
          int v46 = object_getClass(self);
          BOOL v47 = class_isMetaClass(v46);
          uint64_t v48 = object_getClassName(self);
          v279 = sel_getName(a2);
          uint64_t v49 = 45;
          if (v47) {
            uint64_t v49 = 43;
          }
          v45(6, "%c[%{public}s %{public}s]:%i Session abort", v49, v48, v279, 355);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v50 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          int v51 = object_getClass(self);
          if (class_isMetaClass(v51)) {
            int v52 = 43;
          }
          else {
            int v52 = 45;
          }
          v53 = object_getClassName(self);
          uint64_t v54 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v319 = v52;
          __int16 v320 = 2082;
          v321 = v53;
          __int16 v322 = 2082;
          v323 = v54;
          __int16 v324 = 1024;
          int v325 = 355;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session abort", buf, 0x22u);
        }

        [(NFRemoteAdminState *)self->_serverState setUnsentScriptResponse:0];
        [(NFRemoteAdminState *)self->_serverState save];
        BOOL v34 = 1;
        goto LABEL_27;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v141 = NFLogGetLogger();
      if (v141)
      {
        v142 = (void (*)(uint64_t, const char *, ...))v141;
        v143 = object_getClass(self);
        BOOL v144 = class_isMetaClass(v143);
        v273 = object_getClassName(self);
        v285 = sel_getName(a2);
        uint64_t v145 = 45;
        if (v144) {
          uint64_t v145 = 43;
        }
        v142(4, "%c[%{public}s %{public}s]:%i Request sent failed, status=%d", v145, v273, v285, 367, v22);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v146 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
      {
        v147 = object_getClass(self);
        if (class_isMetaClass(v147)) {
          int v148 = 43;
        }
        else {
          int v148 = 45;
        }
        v149 = object_getClassName(self);
        v150 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v319 = v148;
        __int16 v320 = 2082;
        v321 = v149;
        __int16 v322 = 2082;
        v323 = v150;
        __int16 v324 = 1024;
        int v325 = 367;
        __int16 v326 = 1024;
        LODWORD(v327) = v22;
        _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Request sent failed, status=%d", buf, 0x28u);
      }

      if (v22 == 25)
      {
        BOOL v34 = 0;
        unint64_t v35 = 2;
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v151 = NFLogGetLogger();
        if (v151)
        {
          v152 = (void (*)(uint64_t, const char *, ...))v151;
          int v153 = object_getClass(self);
          BOOL v154 = class_isMetaClass(v153);
          v155 = object_getClassName(self);
          uint64_t v156 = sel_getName(a2);
          if (v22 >= 0x47) {
            int v157 = 71;
          }
          else {
            int v157 = (int)v22;
          }
          long long v293 = off_100058D68[v157];
          uint64_t v158 = 43;
          if (!v154) {
            uint64_t v158 = 45;
          }
          v152(3, "%c[%{public}s %{public}s]:%i %@ err=%d \"%s\", v158, v155, v156, 369, @"Returned"", v22, v293);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v159 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        {
          v160 = object_getClass(self);
          if (class_isMetaClass(v160)) {
            int v161 = 43;
          }
          else {
            int v161 = 45;
          }
          v162 = object_getClassName(self);
          v163 = sel_getName(a2);
          if (v22 >= 0x47) {
            int v164 = 71;
          }
          else {
            int v164 = (int)v22;
          }
          v165 = off_100058D68[v164];
          *(_DWORD *)buf = 67110658;
          int v319 = v161;
          __int16 v320 = 2082;
          v321 = v162;
          __int16 v322 = 2082;
          v323 = v163;
          __int16 v324 = 1024;
          int v325 = 369;
          __int16 v326 = 2112;
          CFStringRef v327 = @"Returned";
          __int16 v328 = 1024;
          *(_DWORD *)v329 = v22;
          *(_WORD *)&v329[4] = 2080;
          *(void *)&v329[6] = v165;
          _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@ err=%d \"%s\"", buf, 0x3Cu);
        }

        BOOL v34 = 0;
        if ((v22 - 19) > 1) {
          unint64_t v35 = 4;
        }
        else {
          unint64_t v35 = 3;
        }
      }
    }
    self->_returnCode = v35;
LABEL_27:

    goto LABEL_38;
  }
  if (Logger)
  {
    long long v36 = object_getClass(self);
    BOOL v37 = class_isMetaClass(v36);
    long long v38 = object_getClassName(self);
    v278 = sel_getName(a2);
    uint64_t v39 = 45;
    if (v37) {
      uint64_t v39 = 43;
    }
    v9(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v39, v38, v278, 320);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v40 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    __int16 v41 = object_getClass(self);
    if (class_isMetaClass(v41)) {
      int v42 = 43;
    }
    else {
      int v42 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v319 = v42;
    __int16 v320 = 2082;
    v321 = object_getClassName(self);
    __int16 v322 = 2082;
    v323 = sel_getName(a2);
    __int16 v324 = 1024;
    int v325 = 320;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
  }

  BOOL v34 = 0;
  self->_returnCode = 4;
LABEL_38:

  return v34;
}

- (BOOL)_openSessionWithTimeout:(unint64_t)a3
{
  if (self->_allocateSESession)
  {
    uint64_t v45 = 0;
    int v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    uint64_t v39 = 0;
    int v40 = &v39;
    uint64_t v41 = 0x3032000000;
    int v42 = sub_1000369D0;
    __int16 v43 = sub_1000369E0;
    uint64_t v44 = &stru_100059418;
    id v6 = sub_10001AEC4();
    sub_10001FDA4((uint64_t)v6);

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = +[NFHardwareManager sharedHardwareManager];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000369E8;
    v34[3] = &unk_100058FB0;
    long long v36 = &v39;
    BOOL v37 = &v45;
    v34[4] = self;
    SEL v38 = a2;
    id v9 = v7;
    unint64_t v35 = v9;
    uint64_t v10 = [v8 startSecureElementManagerSessionWithPriority:v34];

    unint64_t v11 = 60 * a3;
    if (60 * a3 <= 1) {
      unint64_t v11 = 1;
    }
    if (a3 == -1) {
      unint64_t v12 = -1;
    }
    else {
      unint64_t v12 = v11;
    }
    unint64_t v13 = 119;
    do
    {
      unint64_t v14 = v12 - v13;
      if (v12 >= v13)
      {
        unint64_t v15 = v13;
      }
      else
      {
        unint64_t v14 = 0;
        unint64_t v15 = v12;
      }
      BOOL v16 = v12 == -1;
      if (v12 == -1) {
        unint64_t v12 = -1;
      }
      else {
        unint64_t v12 = v14;
      }
      if (!v16) {
        unint64_t v13 = v15;
      }
      dispatch_time_t v17 = dispatch_time(0, 1000000000 * v13);
      intptr_t v18 = dispatch_semaphore_wait(v9, v17);
      CFStringRef v19 = sub_10001AEC4();
      sub_10001FDFC(v19);
    }
    while (v12 && v18);
    id v20 = (id)v40[5];
    objc_sync_enter(v20);
    if (v18)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class)) {
          uint64_t v23 = 43;
        }
        else {
          uint64_t v23 = 45;
        }
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i Timeout waiting for nfcd session to start", v23, ClassName, Name, 636);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = object_getClass(self);
        if (class_isMetaClass(v27)) {
          int v28 = 43;
        }
        else {
          int v28 = 45;
        }
        int v29 = object_getClassName(self);
        id v30 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v50 = v28;
        __int16 v51 = 2082;
        int v52 = v29;
        __int16 v53 = 2082;
        uint64_t v54 = v30;
        __int16 v55 = 1024;
        int v56 = 636;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Timeout waiting for nfcd session to start", buf, 0x22u);
      }

      *((unsigned char *)v46 + 24) = 1;
      [v10 endSessionWithCompletion:&stru_100058FD0];
      seSession = self->_seSession;
      self->_seSession = 0;
    }
    objc_sync_exit(v20);

    int v32 = sub_10001AEC4();
    sub_10001FD4C((uint64_t)v32);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
  }
  return self->_seSession != 0;
}

- (unsigned)_deactiveAllAppletsOnSE:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_new();
  [v6 setSeid:v5];

  [v6 setDeactivateAllApps:1];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    unint64_t v13 = [v6 seid];
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i Deactivating all applets on SEID:%{public}@", v14, ClassName, Name, 654, v13);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  unint64_t v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    intptr_t v18 = object_getClassName(self);
    CFStringRef v19 = sel_getName(a2);
    id v20 = [v6 seid];
    *(_DWORD *)buf = 67110146;
    int v25 = v17;
    __int16 v26 = 2082;
    v27 = v18;
    __int16 v28 = 2082;
    int v29 = v19;
    __int16 v30 = 1024;
    int v31 = 654;
    __int16 v32 = 2114;
    id v33 = v20;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deactivating all applets on SEID:%{public}@", buf, 0x2Cu);
  }
  seSession = self->_seSession;
  id v22 = objc_opt_new();
  LODWORD(seSession) = [(NFSecureElementManagerSession *)seSession runScript:v22 parameters:v6 outputResults:0];

  return seSession;
}

- (unint64_t)run
{
  if (!self->_serverURL) {
    return 5;
  }
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_abort)
  {
    int v5 = 1;
    unint64_t v6 = 1;
    goto LABEL_46;
  }
  id v72 = 0;
  dispatch_semaphore_t v7 = +[NFSecureElement embeddedSecureElementWithError:&v72];
  id v8 = v72;
  if (!v7 || ([v7 available] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v4);
      if (class_isMetaClass(Class)) {
        uint64_t v19 = 43;
      }
      else {
        uint64_t v19 = 45;
      }
      ClassName = object_getClassName(v4);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error = %{public}@", v19, ClassName, Name, 675, v8);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v22 = object_getClass(v4);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      BOOL v24 = object_getClassName(v4);
      int v25 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v74 = v23;
      __int16 v75 = 2082;
      BOOL v76 = v24;
      __int16 v77 = 2082;
      uint64_t v78 = v25;
      __int16 v79 = 1024;
      int v80 = 675;
      __int16 v81 = 2114;
      id v82 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error = %{public}@", buf, 0x2Cu);
    }
    unint64_t v6 = 1;
    goto LABEL_44;
  }
  id v9 = [v7 serialNumber];
  objc_storeStrong((id *)&v4->_targetSEID, v9);

  if (!v4->_targetSEID)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26)
    {
      v27 = object_getClass(v4);
      if (class_isMetaClass(v27)) {
        uint64_t v28 = 43;
      }
      else {
        uint64_t v28 = 45;
      }
      int v29 = object_getClassName(v4);
      __int16 v30 = sel_getName(a2);
      v26(3, "%c[%{public}s %{public}s]:%i Missing SEID", v28, v29, v30, 681);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v16 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    int v31 = object_getClass(v4);
    if (class_isMetaClass(v31)) {
      int v32 = 43;
    }
    else {
      int v32 = 45;
    }
    id v33 = object_getClassName(v4);
    BOOL v34 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v74 = v32;
    __int16 v75 = 2082;
    BOOL v76 = v33;
    __int16 v77 = 2082;
    uint64_t v78 = v34;
    __int16 v79 = 1024;
    int v80 = 681;
    unint64_t v35 = "%c[%{public}s %{public}s]:%i Missing SEID";
    goto LABEL_42;
  }
  uint64_t v10 = [NFRemoteAdminConnectionHTTP alloc];
  unint64_t v11 = [(NSURL *)self->_serverURL URLByAppendingPathComponent:@"v2"];
  unint64_t v6 = v4->_targetSEID;
  unint64_t v12 = +[NFSecureElement embeddedSecureElementWithError:0];
  unint64_t v13 = -[NFRemoteAdminConnectionHTTP initWithURL:SEID:showProprietaryHeaders:disableEVTrustValidation:](v10, "initWithURL:SEID:showProprietaryHeaders:disableEVTrustValidation:", v11, v6, 1, [v12 isProductionSigned] ^ 1);
  connection = v4->_connection;
  v4->_connection = (NFRemoteAdminConnection *)v13;

  unint64_t v15 = v4->_connection;
  if (v15)
  {
    if (![(NFRemoteAdminConnection *)v15 connect])
    {
      int v5 = 0;
      goto LABEL_45;
    }
    BOOL v16 = v4->_connection;
    v4->_connection = 0;
    goto LABEL_43;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  long long v36 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v36)
  {
    BOOL v37 = object_getClass(v4);
    if (class_isMetaClass(v37)) {
      uint64_t v38 = 43;
    }
    else {
      uint64_t v38 = 45;
    }
    uint64_t v39 = object_getClassName(v4);
    int v40 = sel_getName(a2);
    v36(3, "%c[%{public}s %{public}s]:%i Failed to create connection", v38, v39, v40, 691);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v41 = object_getClass(v4);
    if (class_isMetaClass(v41)) {
      int v42 = 43;
    }
    else {
      int v42 = 45;
    }
    __int16 v43 = object_getClassName(v4);
    uint64_t v44 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v74 = v42;
    __int16 v75 = 2082;
    BOOL v76 = v43;
    __int16 v77 = 2082;
    uint64_t v78 = v44;
    __int16 v79 = 1024;
    int v80 = 691;
    unint64_t v35 = "%c[%{public}s %{public}s]:%i Failed to create connection";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v35, buf, 0x22u);
  }
LABEL_43:
  unint64_t v6 = 4;
LABEL_44:

  int v5 = 1;
LABEL_45:

LABEL_46:
  objc_sync_exit(v4);

  if (!v5)
  {
    if ([(NFRemoteAdminSession *)v4 _openSessionWithTimeout:-1] && v4->_seSession)
    {
      *(_WORD *)&v4->_spManagedScript = 0;
      int v45 = 201;
      while (1)
      {
        if (v4->_abort) {
          break;
        }
        if (![(NFRemoteAdminSession *)v4 performRequest]) {
          goto LABEL_76;
        }
        if (--v45 <= 1) {
          goto LABEL_77;
        }
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v57 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v57)
      {
        BOOL v58 = object_getClass(v4);
        if (class_isMetaClass(v58)) {
          uint64_t v59 = 43;
        }
        else {
          uint64_t v59 = 45;
        }
        uint64_t v60 = object_getClassName(v4);
        v61 = sel_getName(a2);
        v57(5, "%c[%{public}s %{public}s]:%i Aborted: system shutting down", v59, v60, v61, 722);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v62 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        int v63 = object_getClass(v4);
        if (class_isMetaClass(v63)) {
          int v64 = 43;
        }
        else {
          int v64 = 45;
        }
        uint64_t v65 = object_getClassName(v4);
        id v66 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v74 = v64;
        __int16 v75 = 2082;
        BOOL v76 = v65;
        __int16 v77 = 2082;
        uint64_t v78 = v66;
        __int16 v79 = 1024;
        int v80 = 722;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborted: system shutting down", buf, 0x22u);
      }

      v4->_returnCode = 1;
LABEL_76:
LABEL_77:
      if (v4->_allocateSESession) {
        [(NFSecureElementManagerSession *)v4->_seSession endSessionWithCompletion:&stru_100058FF0];
      }
      [(NFRemoteAdminConnection *)v4->_connection disconnect];
      if (v4->_notifySPInstallScriptStart)
      {
        uint64_t v67 = sub_10001AEC4();
        uint64_t v68 = (void *)v67;
        if (v67) {
          uint64_t v69 = *(void **)(v67 + 224);
        }
        else {
          uint64_t v69 = 0;
        }
        id v70 = v69;
        [v70 sendXpcNotificationEventWithDictionary:&off_10005B518];
      }
      return v4->_returnCode;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v47 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v47)
      {
        char v48 = object_getClass(v4);
        if (class_isMetaClass(v48)) {
          uint64_t v49 = 43;
        }
        else {
          uint64_t v49 = 45;
        }
        int v50 = object_getClassName(v4);
        __int16 v51 = sel_getName(a2);
        v47(3, "%c[%{public}s %{public}s]:%i Failed to open SE session", v49, v50, v51, 707);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        __int16 v53 = object_getClass(v4);
        if (class_isMetaClass(v53)) {
          int v54 = 43;
        }
        else {
          int v54 = 45;
        }
        __int16 v55 = object_getClassName(v4);
        int v56 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v74 = v54;
        __int16 v75 = 2082;
        BOOL v76 = v55;
        __int16 v77 = 2082;
        uint64_t v78 = v56;
        __int16 v79 = 1024;
        int v80 = 707;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open SE session", buf, 0x22u);
      }

      [(NFRemoteAdminConnection *)v4->_connection disconnect];
      return 4;
    }
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSEID, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_serverState, 0);
  objc_storeStrong((id *)&self->_endMetric, 0);
  objc_storeStrong((id *)&self->_seSession, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end