@interface NFRemoteAdminStorage
- (NFRemoteAdminStorage)init;
@end

@implementation NFRemoteAdminStorage

- (NFRemoteAdminStorage)init
{
  v167.receiver = self;
  v167.super_class = (Class)NFRemoteAdminStorage;
  v161 = [(NFRemoteAdminStorage *)&v167 init];
  if (v161)
  {
    uint64_t v2 = +[NSUserDefaults standardUserDefaults];
    ud = v161->_ud;
    v161->_ud = (NSUserDefaults *)v2;

    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm"];
    v5 = [v4 stringForKey:@"TrustedServiceManagerURL"];
    if ([v5 length])
    {
      CFStringRef v168 = @"com.apple.seld";
      v169 = v5;
      v6 = +[NSDictionary dictionaryWithObjects:&v169 forKeys:&v168 count:1];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v161);
        if (class_isMetaClass(Class)) {
          uint64_t v9 = 43;
        }
        else {
          uint64_t v9 = 45;
        }
        ClassName = object_getClassName(v161);
        Name = sel_getName("_importLegacyRegistration");
        Logger(5, "%c[%{public}s %{public}s]:%i Importing pre-multihoming config: %{public}@", v9, ClassName, Name, 247, v6);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = object_getClass(v161);
        if (class_isMetaClass(v13)) {
          int v14 = 43;
        }
        else {
          int v14 = 45;
        }
        v15 = object_getClassName(v161);
        v16 = sel_getName("_importLegacyRegistration");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v14;
        *(_WORD *)v177 = 2082;
        *(void *)&v177[2] = v15;
        *(_WORD *)&v177[10] = 2082;
        *(void *)&v177[12] = v16;
        *(_WORD *)&v177[20] = 1024;
        *(_DWORD *)&v177[22] = 247;
        *(_WORD *)&v177[26] = 2114;
        *(void *)&v177[28] = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Importing pre-multihoming config: %{public}@", buf, 0x2Cu);
      }

      v17 = [v6 allKeys];
      v18 = [v17 lastObject];
      sub_10003A384(v161, v6, v18);

      [v4 removeObjectForKey:@"TrustedServiceManagerURL"];
    }
    else
    {
      v6 = 0;
    }
    id v19 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm.tsmreg"];
    if ([v19 BOOLForKey:@"ForwardMigrationComplete"])
    {
      v20 = v6;
    }
    else
    {
      v20 = [v19 dictionaryForKey:@"RsptUrls"];

      if (v20)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v21)
        {
          v22 = object_getClass(v161);
          if (class_isMetaClass(v22)) {
            uint64_t v23 = 43;
          }
          else {
            uint64_t v23 = 45;
          }
          v24 = object_getClassName(v161);
          v25 = sel_getName("_importLegacyRegistration");
          v21(5, "%c[%{public}s %{public}s]:%i Importing post-multihoming config: %{public}@", v23, v24, v25, 260, v20);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v26 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = object_getClass(v161);
          if (class_isMetaClass(v27)) {
            int v28 = 43;
          }
          else {
            int v28 = 45;
          }
          v29 = object_getClassName(v161);
          v30 = sel_getName("_importLegacyRegistration");
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v28;
          *(_WORD *)v177 = 2082;
          *(void *)&v177[2] = v29;
          *(_WORD *)&v177[10] = 2082;
          *(void *)&v177[12] = v30;
          *(_WORD *)&v177[20] = 1024;
          *(_DWORD *)&v177[22] = 260;
          *(_WORD *)&v177[26] = 2114;
          *(void *)&v177[28] = v20;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Importing post-multihoming config: %{public}@", buf, 0x2Cu);
        }

        v31 = [v20 allKeys];
        v32 = [v31 lastObject];
        sub_10003A384(v161, v20, v32);

        v33 = [v19 dictionaryForKey:@"AidTopicMap"];
        *(void *)v170 = 0;
        *(void *)v171 = v170;
        *(void *)&v171[8] = 0x2020000000;
        v171[16] = 1;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)v177 = 3221225472;
        *(void *)&v177[8] = sub_10003AC74;
        *(void *)&v177[16] = &unk_100059060;
        *(void *)&v177[32] = v170;
        v178 = "_importLegacyRegistration";
        *(void *)&v177[24] = v161;
        [v33 enumerateKeysAndObjectsUsingBlock:buf];
        if (*(unsigned char *)(*(void *)v171 + 24) && [v33 count])
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v34)
          {
            v35 = object_getClass(v161);
            if (class_isMetaClass(v35)) {
              uint64_t v36 = 43;
            }
            else {
              uint64_t v36 = 45;
            }
            v37 = object_getClassName(v161);
            v38 = sel_getName("_importLegacyRegistration");
            v34(5, "%c[%{public}s %{public}s]:%i Importing post-multihoming map: %{public}@", v36, v37, v38, 279, v33);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v39 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = object_getClass(v161);
            if (class_isMetaClass(v40)) {
              int v41 = 43;
            }
            else {
              int v41 = 45;
            }
            v42 = object_getClassName(v161);
            v43 = sel_getName("_importLegacyRegistration");
            *(_DWORD *)v179 = 67110146;
            *(_DWORD *)&v179[4] = v41;
            *(_WORD *)&v179[8] = 2082;
            *(void *)&v179[10] = v42;
            *(_WORD *)&v179[18] = 2082;
            *(void *)&v179[20] = v43;
            *(_WORD *)&v179[28] = 1024;
            *(_DWORD *)&v179[30] = 279;
            *(_WORD *)&v179[34] = 2114;
            *(void *)&v179[36] = v33;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Importing post-multihoming map: %{public}@", v179, 0x2Cu);
          }

          [(NSMutableDictionary *)v161->_serversForApplets removeAllObjects];
          [(NSMutableDictionary *)v161->_serversForApplets addEntriesFromDictionary:v33];
          [(NSUserDefaults *)v161->_ud setObject:v161->_serversForApplets forKey:@"ServersForApplets"];
        }
        _Block_object_dispose(v170, 8);
      }
      [(NSUserDefaults *)v161->_ud synchronize];
      [v19 setBool:1 forKey:@"ForwardMigrationComplete"];
      [v19 synchronize];
    }
    v44 = [(NSUserDefaults *)v161->_ud dictionaryForKey:@"RegistrationInfo"];

    if (v44)
    {
      v45 = [(NSUserDefaults *)v161->_ud stringForKey:@"PrimaryRegionTopic"];
      BOOL v46 = v45 == 0;

      if (v46)
      {
        uint64_t v47 = [v44 allKeys];
        v48 = [(id)v47 lastObject];

        objc_opt_class();
        LOBYTE(v47) = objc_opt_isKindOfClass();
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v49 = NFLogGetLogger();
        v50 = (void (*)(uint64_t, const char *, ...))v49;
        if (v47)
        {
          if (v49)
          {
            v51 = object_getClass(v161);
            if (class_isMetaClass(v51)) {
              uint64_t v52 = 43;
            }
            else {
              uint64_t v52 = 45;
            }
            v53 = object_getClassName(v161);
            v54 = sel_getName("_importLegacyRegistration");
            v50(5, "%c[%{public}s %{public}s]:%i Found server registration but missing primary topic assignment, assuming %{public}@ as primary.", v52, v53, v54, 296, v48);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v55 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = object_getClass(v161);
            if (class_isMetaClass(v56)) {
              int v57 = 43;
            }
            else {
              int v57 = 45;
            }
            v58 = object_getClassName(v161);
            v59 = sel_getName("_importLegacyRegistration");
            *(_DWORD *)v179 = 67110146;
            *(_DWORD *)&v179[4] = v57;
            *(_WORD *)&v179[8] = 2082;
            *(void *)&v179[10] = v58;
            *(_WORD *)&v179[18] = 2082;
            *(void *)&v179[20] = v59;
            *(_WORD *)&v179[28] = 1024;
            *(_DWORD *)&v179[30] = 296;
            *(_WORD *)&v179[34] = 2114;
            *(void *)&v179[36] = v48;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found server registration but missing primary topic assignment, assuming %{public}@ as primary.", v179, 0x2Cu);
          }

          [(NSUserDefaults *)v161->_ud setObject:v48 forKey:@"PrimaryRegionTopic"];
        }
        else
        {
          if (v49)
          {
            v60 = object_getClass(v161);
            if (class_isMetaClass(v60)) {
              uint64_t v61 = 43;
            }
            else {
              uint64_t v61 = 45;
            }
            v62 = object_getClassName(v161);
            v63 = sel_getName("_importLegacyRegistration");
            uint64_t v64 = objc_opt_class();
            v50(4, "%c[%{public}s %{public}s]:%i Invalid topic: %{public}@", v61, v62, v63, 299, v64);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v65 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            v66 = object_getClass(v161);
            if (class_isMetaClass(v66)) {
              int v67 = 43;
            }
            else {
              int v67 = 45;
            }
            v68 = object_getClassName(v161);
            v69 = sel_getName("_importLegacyRegistration");
            uint64_t v70 = objc_opt_class();
            *(_DWORD *)v179 = 67110146;
            *(_DWORD *)&v179[4] = v67;
            *(_WORD *)&v179[8] = 2082;
            *(void *)&v179[10] = v68;
            *(_WORD *)&v179[18] = 2082;
            *(void *)&v179[20] = v69;
            *(_WORD *)&v179[28] = 1024;
            *(_DWORD *)&v179[30] = 299;
            *(_WORD *)&v179[34] = 2114;
            *(void *)&v179[36] = v70;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid topic: %{public}@", v179, 0x2Cu);
          }
        }
      }
    }

    v156 = [(NSUserDefaults *)v161->_ud dictionaryForKey:@"ServersForApplets"];
    id v71 = [v156 mutableCopy];
    v72 = v71;
    if (v71) {
      v73 = (NSMutableDictionary *)v71;
    }
    else {
      v73 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    serversForApplets = v161->_serversForApplets;
    v161->_serversForApplets = v73;

    v158 = [(NSUserDefaults *)v161->_ud dataForKey:@"ServerStates"];
    if (v158)
    {
      id v75 = objc_alloc((Class)NSSet);
      uint64_t v76 = objc_opt_class();
      uint64_t v77 = objc_opt_class();
      id v78 = [v75 initWithObjects:v76, v77, objc_opt_class(), 0];
      id v166 = 0;
      v79 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v78 fromData:v158 error:&v166];
      id v80 = v166;

      v81 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      serverStates = v161->_serverStates;
      v161->_serverStates = v81;

      if (v79)
      {
        v163[0] = _NSConcreteStackBlock;
        v163[1] = 3221225472;
        v163[2] = sub_100038F58;
        v163[3] = &unk_100059038;
        v83 = v161;
        v164 = v83;
        SEL v165 = a2;
        [v79 enumerateKeysAndObjectsUsingBlock:v163];
        sub_1000392B0(v83);
        v84 = v164;
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v86 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v86)
        {
          v87 = object_getClass(v161);
          if (class_isMetaClass(v87)) {
            uint64_t v88 = 43;
          }
          else {
            uint64_t v88 = 45;
          }
          v89 = object_getClassName(v161);
          v90 = sel_getName(a2);
          v86(3, "%c[%{public}s %{public}s]:%i Invalid data or decode failed: %{public}@", v88, v89, v90, 94, v80);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v84 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          v91 = object_getClass(v161);
          if (class_isMetaClass(v91)) {
            int v92 = 43;
          }
          else {
            int v92 = 45;
          }
          v93 = object_getClassName(v161);
          v94 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v92;
          *(_WORD *)v177 = 2082;
          *(void *)&v177[2] = v93;
          *(_WORD *)&v177[10] = 2082;
          *(void *)&v177[12] = v94;
          *(_WORD *)&v177[20] = 1024;
          *(_DWORD *)&v177[22] = 94;
          *(_WORD *)&v177[26] = 2114;
          *(void *)&v177[28] = v80;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid data or decode failed: %{public}@", buf, 0x2Cu);
        }
      }
    }
    else
    {
      v85 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v80 = 0;
      v79 = v161->_serverStates;
      v161->_serverStates = v85;
    }

    v157 = [(NSUserDefaults *)v161->_ud dataForKey:@"RedirectStates"];
    if (v157)
    {
      id v95 = objc_alloc((Class)NSSet);
      uint64_t v96 = objc_opt_class();
      uint64_t v97 = objc_opt_class();
      id v98 = [v95 initWithObjects:v96, v97, objc_opt_class(), 0];
      id v162 = v80;
      v154 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v98 fromData:v157 error:&v162];
      id v155 = v162;

      if (!v154)
      {
        v140 = v155;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v141 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v141)
        {
          v142 = object_getClass(v161);
          if (class_isMetaClass(v142)) {
            uint64_t v143 = 43;
          }
          else {
            uint64_t v143 = 45;
          }
          v144 = object_getClassName(v161);
          v145 = sel_getName(a2);
          v141(3, "%c[%{public}s %{public}s]:%i Invalid data or decode failed: %{public}@", v143, v144, v145, 121, v155);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v146 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
        {
          v147 = object_getClass(v161);
          if (class_isMetaClass(v147)) {
            int v148 = 43;
          }
          else {
            int v148 = 45;
          }
          v149 = object_getClassName(v161);
          v150 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v148;
          *(_WORD *)v177 = 2082;
          *(void *)&v177[2] = v149;
          *(_WORD *)&v177[10] = 2082;
          *(void *)&v177[12] = v150;
          *(_WORD *)&v177[20] = 1024;
          *(_DWORD *)&v177[22] = 121;
          *(_WORD *)&v177[26] = 2114;
          *(void *)&v177[28] = v155;
          _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid data or decode failed: %{public}@", buf, 0x2Cu);
        }

        uint64_t v151 = objc_opt_new();
        redirectStates = v161->_redirectStates;
        v161->_redirectStates = (NSMutableArray *)v151;

        goto LABEL_148;
      }
      v99 = (NSMutableArray *)[(NSMutableArray *)v154 mutableCopy];
      v100 = v161->_redirectStates;
      v161->_redirectStates = v99;

      v159 = objc_opt_new();
      long long v180 = 0u;
      memset(v179, 0, sizeof(v179));
      v101 = v161->_redirectStates;
      id v102 = [(NSMutableArray *)v101 countByEnumeratingWithState:v179 objects:buf count:16];
      if (v102)
      {
        uint64_t v103 = **(void **)&v179[16];
        do
        {
          for (i = 0; i != v102; i = (char *)i + 1)
          {
            if (**(void **)&v179[16] != v103) {
              objc_enumerationMutation(v101);
            }
            v105 = *(void **)(*(void *)&v179[8] + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v105 step] != (id)2)
            {
              id v106 = v105;
              BOOL v107 = [v106 step] == (id)1;
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v108 = NFLogGetLogger();
              v109 = (void (*)(uint64_t, const char *, ...))v108;
              if (v107)
              {
                if (v108)
                {
                  v110 = object_getClass(v161);
                  if (class_isMetaClass(v110)) {
                    uint64_t v111 = 43;
                  }
                  else {
                    uint64_t v111 = 45;
                  }
                  v112 = object_getClassName(v161);
                  v113 = sel_getName("_fixupRedirectState");
                  v109(5, "%c[%{public}s %{public}s]:%i State interrupted in progress - moving to error state: %{public}@", v111, v112, v113, 208, v106);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v114 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                {
                  v115 = object_getClass(v161);
                  if (class_isMetaClass(v115)) {
                    int v116 = 43;
                  }
                  else {
                    int v116 = 45;
                  }
                  v117 = object_getClassName(v161);
                  v118 = sel_getName("_fixupRedirectState");
                  *(_DWORD *)v170 = 67110146;
                  *(_DWORD *)&v170[4] = v116;
                  *(_WORD *)v171 = 2082;
                  *(void *)&v171[2] = v117;
                  *(_WORD *)&v171[10] = 2082;
                  *(void *)&v171[12] = v118;
                  __int16 v172 = 1024;
                  int v173 = 208;
                  __int16 v174 = 2114;
                  id v175 = v106;
                  _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i State interrupted in progress - moving to error state: %{public}@", v170, 0x2Cu);
                }

                [v106 setIncompleteReason:@"NetworkError"];
                [v106 incrementStep];
              }
              else
              {
                if (v108)
                {
                  v119 = object_getClass(v161);
                  if (class_isMetaClass(v119)) {
                    uint64_t v120 = 43;
                  }
                  else {
                    uint64_t v120 = 45;
                  }
                  v121 = object_getClassName(v161);
                  v122 = sel_getName("_fixupRedirectState");
                  v109(5, "%c[%{public}s %{public}s]:%i redirect request found in bad state, removing: %{public}@", v120, v121, v122, 213, v106);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v123 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
                {
                  v124 = object_getClass(v161);
                  if (class_isMetaClass(v124)) {
                    int v125 = 43;
                  }
                  else {
                    int v125 = 45;
                  }
                  v126 = object_getClassName(v161);
                  v127 = sel_getName("_fixupRedirectState");
                  *(_DWORD *)v170 = 67110146;
                  *(_DWORD *)&v170[4] = v125;
                  *(_WORD *)v171 = 2082;
                  *(void *)&v171[2] = v126;
                  *(_WORD *)&v171[10] = 2082;
                  *(void *)&v171[12] = v127;
                  __int16 v172 = 1024;
                  int v173 = 213;
                  __int16 v174 = 2114;
                  id v175 = v106;
                  _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i redirect request found in bad state, removing: %{public}@", v170, 0x2Cu);
                }

                [v159 addObject:v106];
              }
            }
          }
          id v102 = [(NSMutableArray *)v101 countByEnumeratingWithState:v179 objects:buf count:16];
        }
        while (v102);
      }

      if ([v159 count])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v128 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v128)
        {
          v129 = object_getClass(v161);
          if (class_isMetaClass(v129)) {
            uint64_t v130 = 43;
          }
          else {
            uint64_t v130 = 45;
          }
          v131 = object_getClassName(v161);
          v132 = sel_getName("_fixupRedirectState");
          v128(6, "%c[%{public}s %{public}s]:%i Removing invalid reader state entries", v130, v131, v132, 220);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v133 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
        {
          v134 = object_getClass(v161);
          if (class_isMetaClass(v134)) {
            int v135 = 43;
          }
          else {
            int v135 = 45;
          }
          v136 = object_getClassName(v161);
          v137 = sel_getName("_fixupRedirectState");
          *(_DWORD *)v170 = 67109890;
          *(_DWORD *)&v170[4] = v135;
          *(_WORD *)v171 = 2082;
          *(void *)&v171[2] = v136;
          *(_WORD *)&v171[10] = 2082;
          *(void *)&v171[12] = v137;
          __int16 v172 = 1024;
          int v173 = 220;
          _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing invalid reader state entries", v170, 0x22u);
        }

        [(NSMutableArray *)v161->_redirectStates removeObjectsInArray:v159];
        sub_10003A07C(v161);
      }

      v138 = v154;
    }
    else
    {
      uint64_t v139 = objc_opt_new();
      v138 = v161->_redirectStates;
      v161->_redirectStates = (NSMutableArray *)v139;
      id v155 = v80;
    }

    v140 = v155;
LABEL_148:
    [(NSUserDefaults *)v161->_ud removeObjectForKey:@"JCOPUpdateInfo"];
    [(NSUserDefaults *)v161->_ud removeObjectForKey:@"SEOSUpdateInfo"];
  }
  return v161;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seosPlatformID, 0);
  objc_storeStrong((id *)&self->_apnToken, 0);
  objc_storeStrong((id *)&self->_redirectStates, 0);
  objc_storeStrong((id *)&self->_serverStates, 0);
  objc_storeStrong((id *)&self->_serversForApplets, 0);

  objc_storeStrong((id *)&self->_ud, 0);
}

@end