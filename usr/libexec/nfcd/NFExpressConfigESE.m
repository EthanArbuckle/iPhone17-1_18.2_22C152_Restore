@interface NFExpressConfigESE
- (BOOL)hasUWBKeys:(id)a3;
- (BOOL)validateAndUpdateExpressConfig:(id)a3 avoidChangingRouting:(BOOL)a4;
- (id)disableExpressForKeys:(id)a3 onApplet:(id)a4;
- (id)extractConfigFrom:(id)a3;
- (id)fetchFromStorage;
- (id)getSecureElementWrapper;
- (id)getSecureElementWrapperAndSetRouting;
- (id)migrateFromDefaults;
- (id)seName;
- (id)updateExpressConfigLimitedTo:(id)a3 andActivate:(BOOL)a4 hasChanged:(BOOL *)a5;
- (void)updateStorage;
@end

@implementation NFExpressConfigESE

- (id)getSecureElementWrapper
{
  v2 = +[_NFHardwareManager sharedHardwareManager];
  v3 = [v2 secureElementWrapper];

  return v3;
}

- (id)getSecureElementWrapperAndSetRouting
{
  v4 = +[_NFHardwareManager sharedHardwareManager];
  v5 = +[NFRoutingConfig embeddedWiredMode];
  v6 = [v4 setRoutingConfig:v5];

  if (v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Failed to set eSE to wired mode", v12, ClassName, Name, 118);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v20 = v15;
      __int16 v21 = 2082;
      v22 = object_getClassName(self);
      __int16 v23 = 2082;
      v24 = sel_getName(a2);
      __int16 v25 = 1024;
      int v26 = 118;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set eSE to wired mode", buf, 0x22u);
    }

    v16 = 0;
  }
  else
  {
    v16 = [v4 secureElementWrapper];
  }

  return v16;
}

- (void)updateStorage
{
  v3 = objc_opt_new();
  v161 = +[NSUserDefaults standardUserDefaults];
  LOBYTE(v165) = [v161 BOOLForKey:@"eSETestDBErrors"];
  uint64_t v166 = 0;
  v163 = v3;
  v167 = self;
  while (2)
  {
    if (self) {
      passes = self->super._passes;
    }
    else {
      passes = 0;
    }
    v5 = passes;
    p_super = &v5->super.super;
    if (v165)
    {
      id v7 = [(NSMutableArray *)v5 count];

      if (v166 || !v7)
      {
        __int16 v23 = v167;
        if (v167) {
          __int16 v23 = v167->super._passes;
        }
        v3 = v163;
        id v24 = v23;
        [v163 updateESEExpressEntitiesWithConfig:v24];

        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          int v26 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v167);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v167);
          Name = sel_getName(a2);
          BOOL v30 = !isMetaClass;
          v3 = v163;
          uint64_t v31 = 45;
          if (!v30) {
            uint64_t v31 = 43;
          }
          v26(6, "%c[%{public}s %{public}s]:%i Read back the config", v31, ClassName, Name, 227);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        p_super = NFSharedLogGetLogger();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          v32 = object_getClass(v167);
          if (class_isMetaClass(v32)) {
            int v33 = 43;
          }
          else {
            int v33 = 45;
          }
          v34 = object_getClassName(v167);
          v35 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v185 = v33;
          __int16 v186 = 2082;
          v187 = v34;
          v3 = v163;
          __int16 v188 = 2082;
          v189 = v35;
          __int16 v190 = 1024;
          int v191 = 227;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Read back the config", buf, 0x22u);
        }
        int v165 = 1;
        goto LABEL_34;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v8 = NFLogGetLogger();
      if (v8)
      {
        v9 = (void (*)(uint64_t, const char *, ...))v8;
        v10 = object_getClass(v167);
        BOOL v11 = class_isMetaClass(v10);
        uint64_t v12 = object_getClassName(v167);
        v156 = sel_getName(a2);
        uint64_t v13 = 45;
        if (v11) {
          uint64_t v13 = 43;
        }
        v9(6, "%c[%{public}s %{public}s]:%i testing DB errors - doubling array", v13, v12, v156, 215);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = object_getClass(v167);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        v17 = object_getClassName(v167);
        v18 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v185 = v16;
        __int16 v186 = 2082;
        v187 = v17;
        __int16 v188 = 2082;
        v189 = v18;
        __int16 v190 = 1024;
        int v191 = 215;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i testing DB errors - doubling array", buf, 0x22u);
      }

      if (v167) {
        v19 = v167->super._passes;
      }
      else {
        v19 = 0;
      }
      int v20 = v19;
      p_super = +[NSMutableArray arrayWithArray:v20];

      if (v167) {
        __int16 v21 = v167->super._passes;
      }
      else {
        __int16 v21 = 0;
      }
      v22 = v21;
      [p_super addObjectsFromArray:v22];

      v3 = v163;
    }
    [v3 updateESEExpressEntitiesWithConfig:p_super];
    int v165 = 0;
LABEL_34:

    id v174 = 0;
    v36 = [v3 fetchESEExpressEntitiesWithError:&v174];
    id v37 = v174;
    id v38 = v37;
    v164 = v36;
    if (!v36 || v37)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v119 = NFLogGetLogger();
      if (v119)
      {
        v120 = (void (*)(uint64_t, const char *, ...))v119;
        v121 = object_getClass(v167);
        BOOL v122 = class_isMetaClass(v121);
        v123 = object_getClassName(v167);
        v158 = sel_getName(a2);
        uint64_t v124 = 45;
        if (v122) {
          uint64_t v124 = 43;
        }
        v120(3, "%c[%{public}s %{public}s]:%i Failed to read expressConfig from storage (iteration %d): error: %{public}@", v124, v123, v158, 235, v166, v38);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v125 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
      {
        v126 = object_getClass(v167);
        if (class_isMetaClass(v126)) {
          int v127 = 43;
        }
        else {
          int v127 = 45;
        }
        v128 = object_getClassName(v167);
        v129 = sel_getName(a2);
        *(_DWORD *)buf = 67110402;
        int v185 = v127;
        __int16 v186 = 2082;
        v187 = v128;
        __int16 v188 = 2082;
        v189 = v129;
        __int16 v190 = 1024;
        int v191 = 235;
        __int16 v192 = 1024;
        int v193 = v166;
        __int16 v194 = 2114;
        id v195 = v38;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to read expressConfig from storage (iteration %d): error: %{public}@", buf, 0x32u);
      }

      v3 = v163;
      goto LABEL_112;
    }
    id v39 = v36;
    if (!v167
      || (v40 = v167->super._passes,
          id v41 = [(NSMutableArray *)v40 count],
          id v42 = [v39 count],
          v40,
          v41 != v42))
    {

      goto LABEL_99;
    }
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    obj = v167->super._passes;
    id v171 = [(NSMutableArray *)obj countByEnumeratingWithState:&v179 objects:buf count:16];
    if (!v171) {
      goto LABEL_86;
    }
    id v169 = v39;
    uint64_t v170 = *(void *)v180;
    do
    {
      v43 = 0;
      do
      {
        if (*(void *)v180 != v170) {
          objc_enumerationMutation(obj);
        }
        v44 = *(void **)(*((void *)&v179 + 1) + 8 * (void)v43);
        long long v175 = 0u;
        long long v176 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        id v45 = v39;
        id v46 = [v45 countByEnumeratingWithState:&v175 objects:v183 count:16];
        if (!v46) {
          goto LABEL_80;
        }
        id v47 = v46;
        v172 = v43;
        uint64_t v48 = *(void *)v176;
LABEL_45:
        uint64_t v49 = 0;
        while (1)
        {
          if (*(void *)v176 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v175 + 1) + 8 * v49);
          v51 = [v44 objectForKeyedSubscript:@"passUniqueID"];
          v52 = [v50 objectForKeyedSubscript:@"passUniqueID"];
          id v53 = [v51 caseInsensitiveCompare:v52];

          if (!v53)
          {
            v54 = [v44 objectForKeyedSubscript:@"appletIdentifier"];
            v55 = [v50 objectForKeyedSubscript:@"appletIdentifier"];
            id v56 = [v54 caseInsensitiveCompare:v55];

            if (!v56)
            {
              v57 = [v44 objectForKeyedSubscript:@"ExpressType"];
              v58 = [v50 objectForKeyedSubscript:@"ExpressType"];
              id v59 = [v57 caseInsensitiveCompare:v58];

              if (!v59)
              {
                v60 = [v44 objectForKeyedSubscript:@"expressEnabled"];
                unsigned int v61 = [v60 BOOLValue];
                v62 = [v50 objectForKeyedSubscript:@"expressEnabled"];
                unsigned int v63 = [v62 BOOLValue];

                if (v61 == v63)
                {
                  v64 = [v44 objectForKeyedSubscript:@"moduleIdentifier"];
                  v65 = [v50 objectForKeyedSubscript:@"moduleIdentifier"];
                  id v66 = [v64 caseInsensitiveCompare:v65];

                  if (!v66)
                  {
                    v67 = [v44 objectForKeyedSubscript:@"keyIdentifier"];

                    if (!v67
                      || ([v44 objectForKeyedSubscript:@"keyIdentifier"],
                          v68 = objc_claimAutoreleasedReturnValue(),
                          [v50 objectForKeyedSubscript:@"keyIdentifier"],
                          v69 = objc_claimAutoreleasedReturnValue(),
                          id v70 = [v68 caseInsensitiveCompare:v69],
                          v69,
                          v68,
                          !v70))
                    {
                      v71 = [v44 objectForKeyedSubscript:@"inSessionOnly"];

                      if (!v71) {
                        goto LABEL_133;
                      }
                      v72 = [v44 objectForKeyedSubscript:@"inSessionOnly"];
                      unsigned int v73 = [v72 BOOLValue];
                      v74 = [v50 objectForKeyedSubscript:@"inSessionOnly"];
                      unsigned int v75 = [v74 BOOLValue];

                      if (v73 == v75)
                      {
LABEL_133:
                        v76 = [v44 objectForKeyedSubscript:@"UWBExpressEnabled"];

                        if (!v76) {
                          goto LABEL_134;
                        }
                        v77 = [v44 objectForKeyedSubscript:@"UWBExpressEnabled"];
                        unsigned int v78 = [v77 BOOLValue];
                        v79 = [v50 objectForKeyedSubscript:@"UWBExpressEnabled"];
                        unsigned int v80 = [v79 BOOLValue];

                        if (v78 == v80)
                        {
LABEL_134:
                          v81 = [v44 objectForKeyedSubscript:@"userChoice"];

                          if (!v81) {
                            goto LABEL_135;
                          }
                          v82 = [v44 objectForKeyedSubscript:@"userChoice"];
                          unsigned int v83 = [v82 BOOLValue];
                          v84 = [v50 objectForKeyedSubscript:@"userChoice"];
                          unsigned int v85 = [v84 BOOLValue];

                          if (v83 == v85)
                          {
LABEL_135:
                            v86 = [v44 objectForKeyedSubscript:@"ECP2Info"];

                            if (!v86
                              || ([v44 objectForKeyedSubscript:@"ECP2Info"],
                                  v87 = objc_claimAutoreleasedReturnValue(),
                                  [v50 objectForKeyedSubscript:@"ECP2Info"],
                                  v88 = objc_claimAutoreleasedReturnValue(),
                                  unsigned int v89 = [v87 isEqual:v88],
                                  v88,
                                  v87,
                                  v89))
                            {
                              v90 = [v44 objectForKeyedSubscript:@"readerIdentifier"];

                              if (!v90
                                || ([v44 objectForKeyedSubscript:@"readerIdentifier"],
                                    v91 = objc_claimAutoreleasedReturnValue(),
                                    [v50 objectForKeyedSubscript:@"readerIdentifier"],
                                    v92 = objc_claimAutoreleasedReturnValue(),
                                    id v93 = [v91 caseInsensitiveCompare:v92],
                                    v92,
                                    v91,
                                    !v93))
                              {
                                v94 = [v44 objectForKeyedSubscript:@"groupActivationStyle"];

                                if (!v94) {
                                  goto LABEL_136;
                                }
                                v95 = [v44 objectForKeyedSubscript:@"groupActivationStyle"];
                                unsigned int v96 = [v95 intValue];
                                v97 = [v50 objectForKeyedSubscript:@"groupActivationStyle"];
                                unsigned int v98 = [v97 intValue];

                                if (v96 == v98)
                                {
LABEL_136:
                                  v99 = [v44 objectForKeyedSubscript:@"groupHead"];

                                  if (!v99
                                    || ([v44 objectForKeyedSubscript:@"groupHead"],
                                        v100 = objc_claimAutoreleasedReturnValue(),
                                        [v50 objectForKeyedSubscript:@"groupHead"],
                                        v101 = objc_claimAutoreleasedReturnValue(),
                                        id v102 = [v100 caseInsensitiveCompare:v101],
                                        v101,
                                        v100,
                                        !v102))
                                  {
                                    v103 = [v44 objectForKeyedSubscript:@"groupMembers"];

                                    if (!v103
                                      || ([v44 objectForKeyedSubscript:@"groupMembers"],
                                          v104 = objc_claimAutoreleasedReturnValue(),
                                          [v50 objectForKeyedSubscript:@"groupMembers"],
                                          v105 = objc_claimAutoreleasedReturnValue(),
                                          unsigned int v106 = [v104 isEqual:v105],
                                          v105,
                                          v104,
                                          v106))
                                    {
                                      v107 = [v44 objectForKeyedSubscript:@"aliroGroupResolvingKeys"];

                                      if (!v107
                                        || ([v44 objectForKeyedSubscript:@"aliroGroupResolvingKeys"], v108 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v50, "objectForKeyedSubscript:", @"aliroGroupResolvingKeys"), v109 = objc_claimAutoreleasedReturnValue(), unsigned int v110 = objc_msgSend(v108, "isEqual:", v109), v109, v108, v110))
                                      {
                                        v111 = [v44 objectForKeyedSubscript:@"associatedReaderIdentifiers"];

                                        if (!v111) {
                                          break;
                                        }
                                        v112 = [v44 objectForKeyedSubscript:@"associatedReaderIdentifiers"];
                                        v113 = [v50 objectForKeyedSubscript:@"associatedReaderIdentifiers"];
                                        unsigned __int8 v114 = [v112 isEqual:v113];

                                        if (v114) {
                                          break;
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
          }
          if (v47 == (id)++v49)
          {
            id v115 = [v45 countByEnumeratingWithState:&v175 objects:v183 count:16];
            id v47 = v115;
            if (!v115)
            {
              id v39 = v169;
              v43 = v172;
              goto LABEL_80;
            }
            goto LABEL_45;
          }
        }
        id v116 = v50;

        id v39 = v169;
        v43 = v172;
        if (v116)
        {
          [v45 removeObject:v116];
          id v45 = v116;
LABEL_80:
        }
        v43 = (char *)v43 + 1;
      }
      while (v43 != v171);
      id v117 = [(NSMutableArray *)obj countByEnumeratingWithState:&v179 objects:buf count:16];
      id v171 = v117;
    }
    while (v117);
LABEL_86:

    id v118 = [v39 count];
    if (v118)
    {
LABEL_99:
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v130 = NFLogGetLogger();
      if (v130)
      {
        v131 = (void (*)(uint64_t, const char *, ...))v130;
        v132 = object_getClass(v167);
        BOOL v133 = class_isMetaClass(v132);
        v134 = object_getClassName(v167);
        v159 = sel_getName(a2);
        uint64_t v135 = 45;
        if (v133) {
          uint64_t v135 = 43;
        }
        v131(3, "%c[%{public}s %{public}s]:%i Passes in storage don't match to configured (iteration %d)", v135, v134, v159, 248, v166);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v136 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
      {
        v137 = object_getClass(v167);
        if (class_isMetaClass(v137)) {
          int v138 = 43;
        }
        else {
          int v138 = 45;
        }
        v139 = object_getClassName(v167);
        v140 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v185 = v138;
        __int16 v186 = 2082;
        v187 = v139;
        __int16 v188 = 2082;
        v189 = v140;
        __int16 v190 = 1024;
        int v191 = 248;
        __int16 v192 = 1024;
        int v193 = v166;
        _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Passes in storage don't match to configured (iteration %d)", buf, 0x28u);
      }

      if (v167) {
        v141 = v167->super._passes;
      }
      else {
        v141 = 0;
      }
      v3 = v163;
      v142 = v141;
      [(NFExpressConfig *)v167 dumpConfig:v142 logLevel:3 prefix:@"updateStorage: current config"];

      id v173 = 0;
      v143 = [v163 fetchESEExpressEntitiesWithError:&v173];
      id v38 = v173;
      [(NFExpressConfig *)v167 dumpConfig:v143 logLevel:3 prefix:@"updateStorage: stored config"];

      if (!v166)
      {
        sub_100199288((uint64_t)NFBugCapture, @"Incorrect eSE config has been stored", @"CoreData update error", 0);
        +[NFExceptionsCALogger postAnalyticsExpressSetupFailureEvent:2 context:0 error:0];
      }
LABEL_112:

      self = v167;
      uint64_t v166 = (v166 + 1);
      if (v166 == 5)
      {
        [v3 disconnect];
        goto LABEL_130;
      }
      continue;
    }
    break;
  }
  v3 = v163;
  if (v165)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v144 = NFLogGetLogger();
    if (v144)
    {
      v145 = (void (*)(uint64_t, const char *, ...))v144;
      v146 = object_getClass(v167);
      BOOL v147 = class_isMetaClass(v146);
      v148 = object_getClassName(v167);
      v160 = sel_getName(a2);
      uint64_t v149 = 45;
      if (v147) {
        uint64_t v149 = 43;
      }
      v155 = v148;
      v3 = v163;
      v145(6, "%c[%{public}s %{public}s]:%i passes match", v149, v155, v160, 239);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v150 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
    {
      v151 = object_getClass(v167);
      if (class_isMetaClass(v151)) {
        int v152 = 43;
      }
      else {
        int v152 = 45;
      }
      v153 = object_getClassName(v167);
      v154 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v185 = v152;
      v3 = v163;
      __int16 v186 = 2082;
      v187 = v153;
      __int16 v188 = 2082;
      v189 = v154;
      __int16 v190 = 1024;
      int v191 = 239;
      _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i passes match", buf, 0x22u);
    }
  }
  [v3 disconnect];

LABEL_130:
}

- (id)seName
{
  return @"eSE";
}

- (BOOL)validateAndUpdateExpressConfig:(id)a3 avoidChangingRouting:(BOOL)a4
{
  id v6 = a3;
  if (![v6 count])
  {
    BOOL v31 = 1;
    goto LABEL_95;
  }
  v99 = a2;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v103 objects:v119 count:16];
  if (!v7)
  {
    BOOL v31 = 1;
    goto LABEL_94;
  }
  id v8 = v7;
  v9 = &AMFDRSealingMapCopyLocalData_ptr;
  uint64_t v10 = *(void *)v104;
  id v98 = v6;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v104 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v103 + 1) + 8 * i);
      uint64_t v13 = [v12 objectForKeyedSubscript:@"appletIdentifier"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        sub_100199288((uint64_t)NFBugCapture, @"Unable to set as express", @"NFExpressConfigESE : validateAndUpdateExpressConfig, Error: Wrong class", 0);
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          id v46 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(v99);
          uint64_t v50 = 45;
          if (isMetaClass) {
            uint64_t v50 = 43;
          }
          v46(3, "%c[%{public}s %{public}s]:%i Wrong class for AID", v50, ClassName, Name, 289);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v51 = NFSharedLogGetLogger();
        id v6 = v98;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = object_getClass(self);
          if (class_isMetaClass(v52)) {
            int v53 = 43;
          }
          else {
            int v53 = 45;
          }
          v54 = object_getClassName(self);
          v55 = sel_getName(v99);
          *(_DWORD *)buf = 67109890;
          int v108 = v53;
          __int16 v109 = 2082;
          unsigned int v110 = v54;
          __int16 v111 = 2082;
          v112 = v55;
          __int16 v113 = 1024;
          int v114 = 289;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Wrong class for AID", buf, 0x22u);
        }

        +[NFExceptionsCALogger postAnalyticsExpressSetupFailureEvent:0 context:1 error:0];
        goto LABEL_93;
      }
      v14 = [v12 objectForKeyedSubscript:@"ExpressType"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !+[NFExpressConfig expressTypeForATLConfigKey:v14])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v32 = NFLogGetLogger();
        id v6 = v98;
        if (v32)
        {
          int v33 = (void (*)(uint64_t, const char *, ...))v32;
          v34 = object_getClass(self);
          BOOL v35 = class_isMetaClass(v34);
          v36 = object_getClassName(self);
          id v93 = sel_getName(v99);
          uint64_t v37 = 45;
          if (v35) {
            uint64_t v37 = 43;
          }
          unsigned int v89 = v36;
          v9 = &AMFDRSealingMapCopyLocalData_ptr;
          v33(3, "%c[%{public}s %{public}s]:%i Incorrect express type %{public}@ for %{public}@", v37, v89, v93, 299, v14, v13);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v38 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          id v39 = object_getClass(self);
          if (class_isMetaClass(v39)) {
            int v40 = 43;
          }
          else {
            int v40 = 45;
          }
          id v41 = object_getClassName(self);
          id v42 = sel_getName(v99);
          *(_DWORD *)buf = 67110402;
          int v108 = v40;
          v9 = &AMFDRSealingMapCopyLocalData_ptr;
          __int16 v109 = 2082;
          unsigned int v110 = v41;
          __int16 v111 = 2082;
          v112 = v42;
          __int16 v113 = 1024;
          int v114 = 299;
          __int16 v115 = 2114;
          id v116 = v14;
          __int16 v117 = 2114;
          id v118 = v13;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Incorrect express type %{public}@ for %{public}@", buf, 0x36u);
        }

        id v102 = v13;
        id v19 = [objc_alloc((Class)v9[466]) initWithFormat:@"NFExpressConfigESE : validateAndUpdateExpressConfig, Error: Wrong express type %@ for %@", v14, v13];
        sub_100199288((uint64_t)NFBugCapture, @"Incorrect express type", v19, 0);
        uint64_t v43 = 1;
        uint64_t v44 = 2;
LABEL_92:
        +[NFExceptionsCALogger postAnalyticsExpressSetupFailureEvent:v43 context:v44 error:0];

        uint64_t v13 = v102;
LABEL_93:

        BOOL v31 = 0;
        goto LABEL_94;
      }
      int v15 = [v12 objectForKeyedSubscript:@"inSessionOnly"];

      if (!v15) {
        [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:@"inSessionOnly"];
      }
      int v16 = [v12 objectForKeyedSubscript:@"UWBExpressEnabled"];

      if (!v16) {
        [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:@"UWBExpressEnabled"];
      }
      v17 = [v12 objectForKeyedSubscript:@"userChoice"];

      if (!v17) {
        [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:@"userChoice"];
      }
      v18 = [v12 objectForKeyedSubscript:@"supportsUWB"];

      if (v18)
      {
        if (a4) {
          goto LABEL_36;
        }
      }
      else
      {
        [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:@"supportsUWB"];
        if (a4) {
          goto LABEL_36;
        }
      }
      id v102 = v13;
      sub_100020A34(self, v13);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        v68 = [v9[466] stringWithFormat:@"NFExpressConfigESE: validateAndUpdateExpressConfig, Error: %@ is not on SE", v102];
        sub_100199288((uint64_t)NFBugCapture, @"Unable to set as express", v68, 0);

        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v69 = NFLogGetLogger();
        if (v69)
        {
          id v70 = (void (*)(uint64_t, const char *, ...))v69;
          v71 = object_getClass(self);
          BOOL v72 = class_isMetaClass(v71);
          v91 = object_getClassName(self);
          unsigned int v96 = sel_getName(v99);
          uint64_t v73 = 45;
          if (v72) {
            uint64_t v73 = 43;
          }
          v70(3, "%c[%{public}s %{public}s]:%i %{public}@ not installed on eSE", v73, v91, v96, 324, v102);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v62 = NFSharedLogGetLogger();
        id v6 = v98;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          v74 = object_getClass(self);
          if (class_isMetaClass(v74)) {
            int v75 = 43;
          }
          else {
            int v75 = 45;
          }
          v76 = object_getClassName(self);
          v77 = sel_getName(v99);
          *(_DWORD *)buf = 67110146;
          int v108 = v75;
          __int16 v109 = 2082;
          unsigned int v110 = v76;
          __int16 v111 = 2082;
          v112 = v77;
          __int16 v113 = 1024;
          int v114 = 324;
          __int16 v115 = 2114;
          id v116 = v102;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ not installed on eSE", buf, 0x2Cu);
        }
        uint64_t v67 = 3;
        goto LABEL_91;
      }
      int v20 = [v12 objectForKeyedSubscript:@"expressEnabled"];
      if ([v20 BOOLValue])
      {
        unsigned int v21 = [v19 authTransientSupport];

        if (v21)
        {
          unsigned int v78 = +[NSString stringWithFormat:@"NFExpressConfigESE: validateAndUpdateExpressConfig, Error: Transient authorization enabled for %@", v102];
          sub_100199288((uint64_t)NFBugCapture, @"Unable to set as express", v78, 0);

          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v79 = NFLogGetLogger();
          if (v79)
          {
            unsigned int v80 = (void (*)(uint64_t, const char *, ...))v79;
            v81 = object_getClass(self);
            BOOL v82 = class_isMetaClass(v81);
            v92 = object_getClassName(self);
            v97 = sel_getName(v99);
            uint64_t v83 = 45;
            if (v82) {
              uint64_t v83 = 43;
            }
            v80(3, "%c[%{public}s %{public}s]:%i Transient authorization enabled for %{public}@", v83, v92, v97, 336, v102);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v62 = NFSharedLogGetLogger();
          id v6 = v98;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v84 = object_getClass(self);
            if (class_isMetaClass(v84)) {
              int v85 = 43;
            }
            else {
              int v85 = 45;
            }
            v86 = object_getClassName(self);
            v87 = sel_getName(v99);
            *(_DWORD *)buf = 67110146;
            int v108 = v85;
            __int16 v109 = 2082;
            unsigned int v110 = v86;
            __int16 v111 = 2082;
            v112 = v87;
            __int16 v113 = 1024;
            int v114 = 336;
            __int16 v115 = 2114;
            id v116 = v102;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Transient authorization enabled for %{public}@", buf, 0x2Cu);
          }
          uint64_t v67 = 4;
LABEL_91:

          uint64_t v43 = 0;
          uint64_t v44 = v67;
          goto LABEL_92;
        }
      }
      else
      {
      }
      if ([v19 lifecycleState] == 129
        || [v19 lifecycleState] == 130)
      {
        id v56 = +[NSString stringWithFormat:@"NFExpressConfigESE: validateAndUpdateExpressConfig, Error: Applet %@ is terminated/frozen", v102];
        sub_100199288((uint64_t)NFBugCapture, @"Unable to set as express", v56, 0);

        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v57 = NFLogGetLogger();
        if (v57)
        {
          v58 = (void (*)(uint64_t, const char *, ...))v57;
          id v59 = object_getClass(self);
          BOOL v60 = class_isMetaClass(v59);
          v90 = object_getClassName(self);
          v95 = sel_getName(v99);
          uint64_t v61 = 45;
          if (v60) {
            uint64_t v61 = 43;
          }
          v58(3, "%c[%{public}s %{public}s]:%i Applet %{public}@ is terminated/frozen", v61, v90, v95, 349, v102);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v62 = NFSharedLogGetLogger();
        id v6 = v98;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          unsigned int v63 = object_getClass(self);
          if (class_isMetaClass(v63)) {
            int v64 = 43;
          }
          else {
            int v64 = 45;
          }
          v65 = object_getClassName(self);
          id v66 = sel_getName(v99);
          *(_DWORD *)buf = 67110146;
          int v108 = v64;
          __int16 v109 = 2082;
          unsigned int v110 = v65;
          __int16 v111 = 2082;
          v112 = v66;
          __int16 v113 = 1024;
          int v114 = 349;
          __int16 v115 = 2114;
          id v116 = v102;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet %{public}@ is terminated/frozen", buf, 0x2Cu);
        }
        uint64_t v67 = 5;
        goto LABEL_91;
      }
      v22 = [v12 objectForKeyedSubscript:@"moduleIdentifier"];

      if (!v22)
      {
        __int16 v23 = [v19 moduleIdentifier];
        [v12 setObject:v23 forKeyedSubscript:@"moduleIdentifier"];
      }
      id v24 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v19 groupActivationStyle]);
      [v12 setObject:v24 forKeyedSubscript:@"groupActivationStyle"];

      __int16 v25 = [v19 moduleIdentifier];

      if (v25)
      {
        int v26 = [v19 moduleIdentifier];
        [v12 setObject:v26 forKeyedSubscript:@"moduleIdentifier"];
      }
      v27 = [v19 groupHeadID];

      if (v27)
      {
        v28 = [v19 groupHeadID];
        [v12 setObject:v28 forKeyedSubscript:@"groupHead"];
      }
      v29 = [v19 groupMemberIDs];

      if (v29)
      {
        BOOL v30 = [v19 groupMemberIDs];
        [v12 setObject:v30 forKeyedSubscript:@"groupMembers"];
      }
      v9 = &AMFDRSealingMapCopyLocalData_ptr;
      uint64_t v13 = v102;
LABEL_36:
    }
    id v8 = [obj countByEnumeratingWithState:&v103 objects:v119 count:16];
    BOOL v31 = 1;
    id v6 = v98;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_94:

LABEL_95:
  return v31;
}

- (id)fetchFromStorage
{
  v4 = objc_opt_new();
  id v20 = 0;
  v5 = [v4 fetchESEExpressEntitiesWithError:&v20];
  id v6 = v20;
  if (v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@", v11, ClassName, Name, 380, v6);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      int v15 = object_getClassName(self);
      int v16 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v22 = v14;
      __int16 v23 = 2082;
      id v24 = v15;
      __int16 v25 = 2082;
      int v26 = v16;
      __int16 v27 = 1024;
      int v28 = 380;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to execute fetch request: %{public}@", buf, 0x2Cu);
    }
  }
  [v4 disconnect];

  return v5;
}

- (id)migrateFromDefaults
{
  v132 = +[NSUserDefaults standardUserDefaults];
  v3 = [v132 dictionaryForKey:@"eSEExpressConfig"];
  v131 = v3;
  if (v3)
  {
    id v141 = [v3 mutableCopy];
    if (v141)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v5 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v8 = 45;
        if (isMetaClass) {
          uint64_t v8 = 43;
        }
        v5(6, "%c[%{public}s %{public}s]:%i new style express config: %{public}@", v8, ClassName, Name, 400, v141);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = object_getClass(self);
        if (class_isMetaClass(v10)) {
          int v11 = 43;
        }
        else {
          int v11 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v172 = v11;
        __int16 v173 = 2082;
        id v174 = object_getClassName(self);
        __int16 v175 = 2082;
        long long v176 = sel_getName(a2);
        __int16 v177 = 1024;
        int v178 = 400;
        __int16 v179 = 2114;
        id v180 = v141;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i new style express config: %{public}@", buf, 0x2Cu);
      }

      [v132 removeObjectForKey:@"eSEExpressConfig"];
LABEL_147:
      uint64_t v37 = [(NFExpressConfig *)self arrayConfigFromDictionary:v141];
      goto LABEL_148;
    }
  }
  BOOL v133 = [v132 objectForKey:@"ExpressTransitIdentifiers"];
  v129 = [v132 objectForKey:@"ExpressTransitIdentifier"];
  id v141 = (id)objc_opt_new();
  uint64_t v12 = +[_NFHardwareManager sharedHardwareManager];
  uint64_t v130 = [v12 secureElementWrapper];

  if (v130)
  {
    if (([v130 supportedTechnologies] & 4) != 0)
    {
      if (v133)
      {
        long long v168 = 0u;
        long long v169 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        id obj = v133;
        id v13 = [obj countByEnumeratingWithState:&v166 objects:v186 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v167;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v167 != v14) {
                objc_enumerationMutation(obj);
              }
              int v16 = *(void **)(*((void *)&v166 + 1) + 8 * i);
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v17)
              {
                v18 = object_getClass(self);
                if (class_isMetaClass(v18)) {
                  uint64_t v19 = 43;
                }
                else {
                  uint64_t v19 = 45;
                }
                id v20 = object_getClassName(self);
                unsigned int v21 = sel_getName(a2);
                v17(6, "%c[%{public}s %{public}s]:%i Adding Express Transit: %{public}@", v19, v20, v21, 425, v16);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              int v22 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v23 = object_getClass(self);
                if (class_isMetaClass(v23)) {
                  int v24 = 43;
                }
                else {
                  int v24 = 45;
                }
                __int16 v25 = object_getClassName(self);
                int v26 = sel_getName(a2);
                *(_DWORD *)buf = 67110146;
                int v172 = v24;
                __int16 v173 = 2082;
                id v174 = v25;
                __int16 v175 = 2082;
                long long v176 = v26;
                __int16 v177 = 1024;
                int v178 = 425;
                __int16 v179 = 2114;
                id v180 = v16;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding Express Transit: %{public}@", buf, 0x2Cu);
              }

              __int16 v27 = objc_opt_new();
              [v27 setObject:@"Suica" forKeyedSubscript:@"ExpressType"];
              [v141 setObject:v27 forKeyedSubscript:v16];
            }
            id v13 = [obj countByEnumeratingWithState:&v166 objects:v186 count:16];
          }
          while (v13);
        }

        [v132 removeObjectForKey:@"ExpressTransitIdentifiers"];
      }
      else if (v129)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v38 = NFLogGetLogger();
        if (v38)
        {
          id v39 = (void (*)(uint64_t, const char *, ...))v38;
          int v40 = object_getClass(self);
          BOOL v41 = class_isMetaClass(v40);
          v123 = object_getClassName(self);
          v126 = sel_getName(a2);
          uint64_t v42 = 45;
          if (v41) {
            uint64_t v42 = 43;
          }
          v39(6, "%c[%{public}s %{public}s]:%i Express Transit aid: %{public}@", v42, v123, v126, 435, v129);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v43 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v44 = object_getClass(self);
          if (class_isMetaClass(v44)) {
            int v45 = 43;
          }
          else {
            int v45 = 45;
          }
          *(_DWORD *)buf = 67110146;
          int v172 = v45;
          __int16 v173 = 2082;
          id v174 = object_getClassName(self);
          __int16 v175 = 2082;
          long long v176 = sel_getName(a2);
          __int16 v177 = 1024;
          int v178 = 435;
          __int16 v179 = 2114;
          id v180 = v129;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Express Transit aid: %{public}@", buf, 0x2Cu);
        }

        id v46 = objc_opt_new();
        [v46 setObject:@"Suica" forKeyedSubscript:@"ExpressType"];
        [v141 setObject:v46 forKeyedSubscript:v129];
        [v132 removeObjectForKey:@"ExpressTransitIdentifier"];
      }
    }
    int v127 = [v132 objectForKey:@"ExpressAccessIdentifiers"];

    if (v127)
    {
      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      id obja = v127;
      id v47 = [obja countByEnumeratingWithState:&v162 objects:v185 count:16];
      if (v47)
      {
        uint64_t v48 = *(void *)v163;
        do
        {
          for (j = 0; j != v47; j = (char *)j + 1)
          {
            if (*(void *)v163 != v48) {
              objc_enumerationMutation(obja);
            }
            uint64_t v50 = *(void **)(*((void *)&v162 + 1) + 8 * (void)j);
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v51)
            {
              v52 = object_getClass(self);
              if (class_isMetaClass(v52)) {
                uint64_t v53 = 43;
              }
              else {
                uint64_t v53 = 45;
              }
              v54 = object_getClassName(self);
              v55 = sel_getName(a2);
              v51(6, "%c[%{public}s %{public}s]:%i Adding Express Access aid: %{public}@", v53, v54, v55, 449, v50);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v56 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v57 = object_getClass(self);
              if (class_isMetaClass(v57)) {
                int v58 = 43;
              }
              else {
                int v58 = 45;
              }
              id v59 = object_getClassName(self);
              BOOL v60 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v172 = v58;
              __int16 v173 = 2082;
              id v174 = v59;
              __int16 v175 = 2082;
              long long v176 = v60;
              __int16 v177 = 1024;
              int v178 = 449;
              __int16 v179 = 2114;
              id v180 = v50;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding Express Access aid: %{public}@", buf, 0x2Cu);
            }

            uint64_t v61 = objc_opt_new();
            [v61 setObject:@"ECP1.Access" forKeyedSubscript:@"ExpressType"];
            [v141 setObject:v61 forKeyedSubscript:v50];
          }
          id v47 = [obja countByEnumeratingWithState:&v162 objects:v185 count:16];
        }
        while (v47);
      }

      [v132 removeObjectForKey:@"ExpressAccessIdentifiers"];
    }
    v134 = [v132 objectForKey:@"ExpressGenericAIdentifiers"];

    if (v134)
    {
      long long v160 = 0u;
      long long v161 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      id objb = v134;
      id v62 = [objb countByEnumeratingWithState:&v158 objects:v184 count:16];
      if (v62)
      {
        uint64_t v63 = *(void *)v159;
        do
        {
          for (k = 0; k != v62; k = (char *)k + 1)
          {
            if (*(void *)v159 != v63) {
              objc_enumerationMutation(objb);
            }
            v65 = *(void **)(*((void *)&v158 + 1) + 8 * (void)k);
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v66 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v66)
            {
              uint64_t v67 = object_getClass(self);
              if (class_isMetaClass(v67)) {
                uint64_t v68 = 43;
              }
              else {
                uint64_t v68 = 45;
              }
              uint64_t v69 = object_getClassName(self);
              id v70 = sel_getName(a2);
              v66(6, "%c[%{public}s %{public}s]:%i Adding Express Generic-A aid: %{public}@", v68, v69, v70, 463, v65);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v71 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v72 = object_getClass(self);
              if (class_isMetaClass(v72)) {
                int v73 = 43;
              }
              else {
                int v73 = 45;
              }
              v74 = object_getClassName(self);
              int v75 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v172 = v73;
              __int16 v173 = 2082;
              id v174 = v74;
              __int16 v175 = 2082;
              long long v176 = v75;
              __int16 v177 = 1024;
              int v178 = 463;
              __int16 v179 = 2114;
              id v180 = v65;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding Express Generic-A aid: %{public}@", buf, 0x2Cu);
            }

            v76 = objc_opt_new();
            [v76 setObject:@"GenericA" forKeyedSubscript:@"ExpressType"];
            [v141 setObject:v76 forKeyedSubscript:v65];
          }
          id v62 = [objb countByEnumeratingWithState:&v158 objects:v184 count:16];
        }
        while (v62);
      }

      [v132 removeObjectForKey:@"ExpressGenericAIdentifiers"];
    }
    v128 = [v132 objectForKey:@"ExpressECP2Identifiers"];

    if (v128)
    {
      long long v156 = 0u;
      long long v157 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      id objc = v128;
      id v77 = [objc countByEnumeratingWithState:&v154 objects:v183 count:16];
      if (v77)
      {
        uint64_t v78 = *(void *)v155;
        do
        {
          for (m = 0; m != v77; m = (char *)m + 1)
          {
            if (*(void *)v155 != v78) {
              objc_enumerationMutation(objc);
            }
            unsigned int v80 = *(void **)(*((void *)&v154 + 1) + 8 * (void)m);
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v81 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v81)
            {
              BOOL v82 = object_getClass(self);
              if (class_isMetaClass(v82)) {
                uint64_t v83 = 43;
              }
              else {
                uint64_t v83 = 45;
              }
              v84 = object_getClassName(self);
              int v85 = sel_getName(a2);
              v81(6, "%c[%{public}s %{public}s]:%i Adding Express ECP2.0 aid: %{public}@", v83, v84, v85, 477, v80);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v86 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              v87 = object_getClass(self);
              if (class_isMetaClass(v87)) {
                int v88 = 43;
              }
              else {
                int v88 = 45;
              }
              unsigned int v89 = object_getClassName(self);
              v90 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v172 = v88;
              __int16 v173 = 2082;
              id v174 = v89;
              __int16 v175 = 2082;
              long long v176 = v90;
              __int16 v177 = 1024;
              int v178 = 477;
              __int16 v179 = 2114;
              id v180 = v80;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Adding Express ECP2.0 aid: %{public}@", buf, 0x2Cu);
            }

            v91 = objc_opt_new();
            [v91 setObject:@"ECP2" forKeyedSubscript:@"ExpressType"];
            [v141 setObject:v91 forKeyedSubscript:v80];
          }
          id v77 = [objc countByEnumeratingWithState:&v154 objects:v183 count:16];
        }
        while (v77);
      }

      [v132 removeObjectForKey:@"ExpressECP2Identifiers"];
    }
    id objd = [v132 objectForKey:@"ExpressAppletTCIs"];
    if (objd)
    {
      if ([v132 BOOLForKey:@"Migrated49292960"])
      {
        [v132 removeObjectForKey:@"Migrated49292960"];
      }
      else
      {
        uint64_t v148 = 0;
        uint64_t v149 = &v148;
        uint64_t v150 = 0x3032000000;
        v151 = sub_10000B7B8;
        int v152 = sub_1000241D8;
        id v153 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[objd count]];
        v147[0] = _NSConcreteStackBlock;
        v147[1] = 3221225472;
        v147[2] = sub_1000241E0;
        v147[3] = &unk_100301130;
        v147[4] = &v148;
        [objd enumerateKeysAndObjectsUsingBlock:v147];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v92 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v92)
        {
          id v93 = object_getClass(self);
          if (class_isMetaClass(v93)) {
            uint64_t v94 = 43;
          }
          else {
            uint64_t v94 = 45;
          }
          v95 = object_getClassName(self);
          unsigned int v96 = sel_getName(a2);
          v92(4, "%c[%{public}s %{public}s]:%i Migrated %{public}@ --> %{public}@", v94, v95, v96, 502, objd, v149[5]);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v97 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          id v98 = object_getClass(self);
          if (class_isMetaClass(v98)) {
            int v99 = 43;
          }
          else {
            int v99 = 45;
          }
          v100 = object_getClassName(self);
          v101 = sel_getName(a2);
          id v102 = (void *)v149[5];
          *(_DWORD *)buf = 67110402;
          int v172 = v99;
          __int16 v173 = 2082;
          id v174 = v100;
          __int16 v175 = 2082;
          long long v176 = v101;
          __int16 v177 = 1024;
          int v178 = 502;
          __int16 v179 = 2114;
          id v180 = objd;
          __int16 v181 = 2114;
          long long v182 = v102;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Migrated %{public}@ --> %{public}@", buf, 0x36u);
        }

        id v103 = (id)v149[5];
        _Block_object_dispose(&v148, 8);

        id objd = v103;
      }
      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      uint64_t v135 = [v141 allKeys];
      id v104 = [v135 countByEnumeratingWithState:&v143 objects:v170 count:16];
      if (v104)
      {
        uint64_t v105 = *(void *)v144;
        do
        {
          for (n = 0; n != v104; n = (char *)n + 1)
          {
            if (*(void *)v144 != v105) {
              objc_enumerationMutation(v135);
            }
            v107 = *(void **)(*((void *)&v143 + 1) + 8 * (void)n);
            int v108 = [objd objectForKey:v107];
            if (v108)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              __int16 v109 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v109)
              {
                unsigned int v110 = object_getClass(self);
                if (class_isMetaClass(v110)) {
                  uint64_t v111 = 43;
                }
                else {
                  uint64_t v111 = 45;
                }
                v112 = object_getClassName(self);
                __int16 v113 = sel_getName(a2);
                v109(6, "%c[%{public}s %{public}s]:%i %{public}@ --> TCIs: %{public}@", v111, v112, v113, 513, v107, v108);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              int v114 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v115 = object_getClass(self);
                if (class_isMetaClass(v115)) {
                  int v116 = 43;
                }
                else {
                  int v116 = 45;
                }
                __int16 v117 = object_getClassName(self);
                id v118 = sel_getName(a2);
                *(_DWORD *)buf = 67110402;
                int v172 = v116;
                __int16 v173 = 2082;
                id v174 = v117;
                __int16 v175 = 2082;
                long long v176 = v118;
                __int16 v177 = 1024;
                int v178 = 513;
                __int16 v179 = 2114;
                id v180 = v107;
                __int16 v181 = 2114;
                long long v182 = v108;
                _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ --> TCIs: %{public}@", buf, 0x36u);
              }

              uint64_t v119 = [v141 objectForKeyedSubscript:v107];
              id v120 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v108];
              [v119 setObject:v120 forKeyedSubscript:@"ECP2Info"];
            }
          }
          id v104 = [v135 countByEnumeratingWithState:&v143 objects:v170 count:16];
        }
        while (v104);
      }

      [v132 removeObjectForKey:@"ExpressAppletTCIs"];
    }

    goto LABEL_147;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v28 = NFLogGetLogger();
  if (v28)
  {
    __int16 v29 = (void (*)(uint64_t, const char *, ...))v28;
    id v30 = object_getClass(self);
    BOOL v31 = class_isMetaClass(v30);
    uint64_t v32 = object_getClassName(self);
    v125 = sel_getName(a2);
    uint64_t v33 = 45;
    if (v31) {
      uint64_t v33 = 43;
    }
    v29(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v33, v32, v125, 414);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v34 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    BOOL v35 = object_getClass(self);
    if (class_isMetaClass(v35)) {
      int v36 = 43;
    }
    else {
      int v36 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v172 = v36;
    __int16 v173 = 2082;
    id v174 = object_getClassName(self);
    __int16 v175 = 2082;
    long long v176 = sel_getName(a2);
    __int16 v177 = 1024;
    int v178 = 414;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
  }

  uint64_t v37 = 0;
LABEL_148:

  return v37;
}

- (id)extractConfigFrom:(id)a3
{
  id v4 = a3;
  v52 = self;
  [(NFExpressConfig *)self dumpConfig:v4 logLevel:8 prefix:@"expressConfig"];
  v5 = objc_opt_new();
  id v6 = +[_NFHardwareManager sharedHardwareManager];
  id v7 = [v6 secureElementWrapper];

  if (v7)
  {
    unsigned __int8 v8 = [v7 supportedTechnologies];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v10)
    {
      id v11 = v10;
      id v49 = v4;
      uint64_t v53 = v5;
      char v50 = 0;
      uint64_t v12 = *(void *)v55;
      uint64_t v13 = v8 & 4;
      do
      {
        uint64_t v14 = v9;
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v55 != v12) {
            objc_enumerationMutation(v14);
          }
          int v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v17 = [v16 objectForKeyedSubscript:@"ExpressType"];
          unsigned int v18 = +[NFExpressConfig expressTypeForATLConfigKey:v17];

          if (v18 != 1 || v13 != 0)
          {
            id v20 = [v16 mutableCopy];
            unsigned int v21 = [v16 objectForKeyedSubscript:@"expressEnabled"];
            unsigned int v22 = [v21 BOOLValue];

            if (v22) {
              BOOL v23 = v18 == 6;
            }
            else {
              BOOL v23 = 0;
            }
            if (v23)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t Logger = NFLogGetLogger();
              if (Logger)
              {
                __int16 v25 = (void (*)(uint64_t, const char *, ...))Logger;
                Class = object_getClass(v52);
                BOOL isMetaClass = class_isMetaClass(Class);
                ClassName = object_getClassName(v52);
                Name = sel_getName(a2);
                uint64_t v29 = 45;
                if (isMetaClass) {
                  uint64_t v29 = 43;
                }
                v25(4, "%c[%{public}s %{public}s]:%i Overriding SinglePoll with GenericA mode express", v29, ClassName, Name, 567);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              id v30 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                BOOL v31 = object_getClass(v52);
                if (class_isMetaClass(v31)) {
                  int v32 = 43;
                }
                else {
                  int v32 = 45;
                }
                uint64_t v33 = object_getClassName(v52);
                v34 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                int v60 = v32;
                __int16 v61 = 2082;
                id v62 = v33;
                __int16 v63 = 2082;
                int v64 = v34;
                __int16 v65 = 1024;
                int v66 = 567;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Overriding SinglePoll with GenericA mode express", buf, 0x22u);
              }

              [v20 setObject:@"GenericA" forKeyedSubscript:@"ExpressType"];
              char v50 = 1;
            }
            [v53 addObject:v20];
          }
        }
        id v9 = v14;
        id v11 = [v14 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v11);

      if (v50) {
        uint64_t v35 = 4;
      }
      else {
        uint64_t v35 = 8;
      }
      id v4 = v49;
      v5 = v53;
    }
    else
    {

      uint64_t v35 = 8;
    }
    [(NFExpressConfig *)v52 dumpConfig:v5 logLevel:v35 prefix:@"new config"];
    id v45 = v5;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v36 = NFLogGetLogger();
    if (v36)
    {
      uint64_t v37 = (void (*)(uint64_t, const char *, ...))v36;
      uint64_t v38 = object_getClass(v52);
      BOOL v39 = class_isMetaClass(v38);
      int v40 = object_getClassName(v52);
      uint64_t v48 = sel_getName(a2);
      uint64_t v41 = 45;
      if (v39) {
        uint64_t v41 = 43;
      }
      v37(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v41, v40, v48, 544);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v42 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = object_getClass(v52);
      if (class_isMetaClass(v43)) {
        int v44 = 43;
      }
      else {
        int v44 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v60 = v44;
      __int16 v61 = 2082;
      id v62 = object_getClassName(v52);
      __int16 v63 = 2082;
      int v64 = sel_getName(a2);
      __int16 v65 = 1024;
      int v66 = 544;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
    }

    id v45 = 0;
  }

  return v45;
}

- (id)disableExpressForKeys:(id)a3 onApplet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v15 = [v8 identifier];
    uint64_t v16 = 45;
    if (isMetaClass) {
      uint64_t v16 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i keys:%{public}@ applet:%{public}@", v16, ClassName, Name, 789, v7, v15);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    id v20 = object_getClassName(self);
    unsigned int v21 = sel_getName(a2);
    unsigned int v22 = [v8 identifier];
    *(_DWORD *)buf = 67110402;
    int v78 = v19;
    __int16 v79 = 2082;
    unsigned int v80 = v20;
    __int16 v81 = 2082;
    BOOL v82 = v21;
    __int16 v83 = 1024;
    int v84 = 789;
    __int16 v85 = 2114;
    id v86 = v7;
    __int16 v87 = 2114;
    int v88 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i keys:%{public}@ applet:%{public}@", buf, 0x36u);
  }
  uint64_t v23 = [(NFExpressConfigESE *)self getSecureElementWrapperAndSetRouting];
  int v24 = (void *)v23;
  if (v23)
  {
    int v66 = (void *)v23;
    uint64_t v69 = v8;
    id v68 = objc_alloc_init((Class)NSMutableArray);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v67 = v7;
    id v25 = v7;
    id v26 = [v25 countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (!v26) {
      goto LABEL_31;
    }
    id v27 = v26;
    uint64_t v28 = *(void *)v71;
    while (1)
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v71 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (![v30 length]) {
            continue;
          }
          BOOL v31 = objc_alloc_init((Class)NSMutableDictionary);
          [v31 setObject:v30 forKeyedSubscript:@"keyIdentifier"];
          int v32 = [v69 identifier];
          [v31 setObject:v32 forKeyedSubscript:@"appletIdentifier"];

          [v68 addObject:v31];
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v33 = NFLogGetLogger();
          if (v33)
          {
            v34 = (void (*)(uint64_t, const char *, ...))v33;
            uint64_t v35 = object_getClass(self);
            BOOL v36 = class_isMetaClass(v35);
            uint64_t v37 = object_getClassName(self);
            int v64 = sel_getName(a2);
            uint64_t v38 = 45;
            if (v36) {
              uint64_t v38 = 43;
            }
            v34(3, "%c[%{public}s %{public}s]:%i Invalid key type.", v38, v37, v64, 801);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          BOOL v31 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            BOOL v39 = object_getClass(self);
            if (class_isMetaClass(v39)) {
              int v40 = 43;
            }
            else {
              int v40 = 45;
            }
            uint64_t v41 = object_getClassName(self);
            uint64_t v42 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v78 = v40;
            __int16 v79 = 2082;
            unsigned int v80 = v41;
            __int16 v81 = 2082;
            BOOL v82 = v42;
            __int16 v83 = 1024;
            int v84 = 801;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid key type.", buf, 0x22u);
          }
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v70 objects:v74 count:16];
      if (!v27)
      {
LABEL_31:

        uint64_t v43 = v68;
        if ([v68 count])
        {
          id v8 = v69;
          sub_1000247A4(self, v68, v69, 0, 0, 0xFFFFFFFF);
          id v44 = (id)objc_claimAutoreleasedReturnValue();
          id v7 = v67;
        }
        else
        {
          id v44 = 0;
          id v7 = v67;
          id v8 = v69;
        }
        int v24 = v66;
        goto LABEL_45;
      }
    }
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v45 = NFLogGetLogger();
  if (v45)
  {
    id v46 = (void (*)(uint64_t, const char *, ...))v45;
    id v47 = object_getClass(self);
    BOOL v48 = class_isMetaClass(v47);
    id v49 = object_getClassName(self);
    __int16 v65 = sel_getName(a2);
    uint64_t v50 = 45;
    if (v48) {
      uint64_t v50 = 43;
    }
    v46(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v50, v49, v65, 793);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v51 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    v52 = object_getClass(self);
    if (class_isMetaClass(v52)) {
      int v53 = 43;
    }
    else {
      int v53 = 45;
    }
    long long v54 = object_getClassName(self);
    long long v55 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v78 = v53;
    __int16 v79 = 2082;
    unsigned int v80 = v54;
    __int16 v81 = 2082;
    BOOL v82 = v55;
    __int16 v83 = 1024;
    int v84 = 793;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
  }

  id v56 = objc_alloc((Class)NSError);
  uint64_t v57 = +[NSString stringWithUTF8String:"nfcd"];
  v75[0] = NSLocalizedDescriptionKey;
  int v58 = +[NSString stringWithUTF8String:"Stack Error"];
  v76[0] = v58;
  v76[1] = &off_100319C48;
  v75[1] = @"Line";
  v75[2] = @"Method";
  id v59 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v76[2] = v59;
  v75[3] = NSDebugDescriptionErrorKey;
  id v60 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 794];
  v76[3] = v60;
  v75[4] = NSLocalizedFailureReasonErrorKey;
  uint64_t v43 = (void *)v57;
  id v61 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to initialize eSE wrapper"];
  v76[4] = v61;
  id v62 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:5];
  id v44 = [v56 initWithDomain:v43 code:15 userInfo:v62];

LABEL_45:

  return v44;
}

- (id)updateExpressConfigLimitedTo:(id)a3 andActivate:(BOOL)a4 hasChanged:(BOOL *)a5
{
  id v9 = a3;
  if (![(NFExpressConfig *)self isSEOperational])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v111 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v115 = 45;
      if (isMetaClass) {
        uint64_t v115 = 43;
      }
      v111(4, "%c[%{public}s %{public}s]:%i eSE is not in operational mode", v115, ClassName, Name, 838);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v92 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      int v116 = object_getClass(self);
      if (class_isMetaClass(v116)) {
        int v117 = 43;
      }
      else {
        int v117 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v261 = v117;
      __int16 v262 = 2082;
      v263 = object_getClassName(self);
      __int16 v264 = 2082;
      v265 = sel_getName(a2);
      __int16 v266 = 1024;
      int v267 = 838;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i eSE is not in operational mode", buf, 0x22u);
    }
    id v118 = 0;
    goto LABEL_204;
  }
  if (self) {
    passes = self->super._passes;
  }
  else {
    passes = 0;
  }
  id v11 = passes;

  if (!v11)
  {
    id v118 = 0;
    goto LABEL_205;
  }
  uint64_t v12 = NFSharedSignpostLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "begin", buf, 2u);
  }

  uint64_t v13 = +[_NFHardwareManager sharedHardwareManager];
  id v14 = [v13 nfcRadioEnabled:0 showUIPopup:0];

  if (!v14)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v119 = NFLogGetLogger();
    if (v119)
    {
      id v120 = (void (*)(uint64_t, const char *, ...))v119;
      v121 = object_getClass(self);
      BOOL v122 = class_isMetaClass(v121);
      v123 = object_getClassName(self);
      v221 = sel_getName(a2);
      uint64_t v124 = 45;
      if (v122) {
        uint64_t v124 = 43;
      }
      v120(6, "%c[%{public}s %{public}s]:%i NFC radio disabled - use empty config", v124, v123, v221, 853);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v125 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      v126 = object_getClass(self);
      if (class_isMetaClass(v126)) {
        int v127 = 43;
      }
      else {
        int v127 = 45;
      }
      v128 = object_getClassName(self);
      v129 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v261 = v127;
      __int16 v262 = 2082;
      v263 = v128;
      __int16 v264 = 2082;
      v265 = v129;
      __int16 v266 = 1024;
      int v267 = 853;
      _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC radio disabled - use empty config", buf, 0x22u);
    }

    id v130 = +[NSMutableArray array];
    v92 = v9;
    id v9 = 0;
    goto LABEL_181;
  }
  int v15 = NFSharedSignpostLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "validating", buf, 2u);
  }

  v235 = +[NSMutableOrderedSet orderedSet];
  v229 = v9;
  uint64_t v231 = objc_opt_new();
  long long v237 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  BOOL v228 = a4;
  v227 = a5;
  if (self) {
    uint64_t v16 = self->super._passes;
  }
  else {
    uint64_t v16 = 0;
  }
  id obj = v16;
  id v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v237 objects:v247 count:16];
  sel = a2;
  if (v17)
  {
    id v18 = v17;
    SEL v236 = *(SEL *)v238;
    do
    {
      int v19 = 0;
      do
      {
        if (*(SEL *)v238 != v236) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v237 + 1) + 8 * (void)v19);
        unsigned int v21 = [v20 objectForKeyedSubscript:@"appletIdentifier"];
        unsigned int v22 = [v20 objectForKeyedSubscript:@"expressEnabled"];
        unsigned __int8 v23 = [v22 BOOLValue];

        int v24 = sub_100020A34(self, v21);
        id v25 = v24;
        if (!v24)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v38 = NFLogGetLogger();
          if (v38)
          {
            BOOL v39 = (void (*)(uint64_t, const char *, ...))v38;
            int v40 = object_getClass(self);
            BOOL v41 = class_isMetaClass(v40);
            v208 = object_getClassName(self);
            v216 = sel_getName(a2);
            uint64_t v42 = 45;
            if (v41) {
              uint64_t v42 = 43;
            }
            v39(3, "%c[%{public}s %{public}s]:%i Could not find %{public}@ on eSE", v42, v208, v216, 873, v21);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v43 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            id v44 = object_getClass(self);
            if (class_isMetaClass(v44)) {
              int v45 = 43;
            }
            else {
              int v45 = 45;
            }
            id v46 = object_getClassName(self);
            id v47 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v261 = v45;
            __int16 v262 = 2082;
            v263 = v46;
            __int16 v264 = 2082;
            v265 = v47;
            __int16 v266 = 1024;
            int v267 = 873;
            __int16 v268 = 2114;
            v269 = v21;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find %{public}@ on eSE", buf, 0x2Cu);
          }

          BOOL v36 = v235;
          uint64_t v37 = v21;
          goto LABEL_40;
        }
        if ([v24 lifecycleState] == 129
          || [v25 lifecycleState] == 130)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v26 = NFLogGetLogger();
          if (v26)
          {
            id v27 = (void (*)(uint64_t, const char *, ...))v26;
            uint64_t v28 = object_getClass(self);
            BOOL v29 = class_isMetaClass(v28);
            v207 = object_getClassName(self);
            v215 = sel_getName(a2);
            uint64_t v30 = 45;
            if (v29) {
              uint64_t v30 = 43;
            }
            v27(6, "%c[%{public}s %{public}s]:%i Applet %{public}@ is terminated/frozen; remove from express mode",
              v30,
              v207,
              v215,
              878,
              v21);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          BOOL v31 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            int v32 = object_getClass(self);
            if (class_isMetaClass(v32)) {
              int v33 = 43;
            }
            else {
              int v33 = 45;
            }
            v34 = object_getClassName(self);
            uint64_t v35 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v261 = v33;
            __int16 v262 = 2082;
            v263 = v34;
            __int16 v264 = 2082;
            v265 = v35;
            __int16 v266 = 1024;
            int v267 = 878;
            __int16 v268 = 2114;
            v269 = v21;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet %{public}@ is terminated/frozen; remove from express mode",
              buf,
              0x2Cu);
          }

          BOOL v36 = v235;
          uint64_t v37 = v25;
LABEL_40:
          [v36 addObject:v37];
          goto LABEL_41;
        }
        if ((v23 & 1) == 0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v62 = NFLogGetLogger();
          if (v62)
          {
            __int16 v63 = (void (*)(uint64_t, const char *, ...))v62;
            int v64 = object_getClass(self);
            BOOL v65 = class_isMetaClass(v64);
            v209 = object_getClassName(self);
            v217 = sel_getName(a2);
            uint64_t v66 = 45;
            if (v65) {
              uint64_t v66 = 43;
            }
            v63(6, "%c[%{public}s %{public}s]:%i @applet %{public}@ is not in express. ATL to handle this going forward", v66, v209, v217, 882, v21);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v56 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            id v67 = object_getClass(self);
            if (class_isMetaClass(v67)) {
              int v68 = 43;
            }
            else {
              int v68 = 45;
            }
            uint64_t v69 = object_getClassName(self);
            long long v70 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v261 = v68;
            __int16 v262 = 2082;
            v263 = v69;
            __int16 v264 = 2082;
            v265 = v70;
            __int16 v266 = 1024;
            int v267 = 882;
            __int16 v268 = 2114;
            v269 = v21;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i @applet %{public}@ is not in express. ATL to handle this going forward", buf, 0x2Cu);
          }
          goto LABEL_63;
        }
        if ([v25 authTransientSupport])
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v48 = NFLogGetLogger();
          if (v48)
          {
            id v49 = (void (*)(uint64_t, const char *, ...))v48;
            uint64_t v50 = object_getClass(self);
            BOOL v51 = class_isMetaClass(v50);
            v52 = object_getClassName(self);
            int v53 = sel_getName(a2);
            long long v54 = [v25 identifier];
            uint64_t v55 = 45;
            if (v51) {
              uint64_t v55 = 43;
            }
            v49(4, "%c[%{public}s %{public}s]:%i Applet %{public}@ requires authorization and is invalid for express", v55, v52, v53, 885, v54);

            a2 = sel;
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v56 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            uint64_t v57 = object_getClass(self);
            if (class_isMetaClass(v57)) {
              int v58 = 43;
            }
            else {
              int v58 = 45;
            }
            id v59 = object_getClassName(self);
            id v60 = sel_getName(sel);
            id v61 = [v25 identifier];
            *(_DWORD *)buf = 67110146;
            int v261 = v58;
            a2 = sel;
            __int16 v262 = 2082;
            v263 = v59;
            __int16 v264 = 2082;
            v265 = v60;
            __int16 v266 = 1024;
            int v267 = 885;
            __int16 v268 = 2114;
            v269 = v61;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet %{public}@ requires authorization and is invalid for express", buf, 0x2Cu);
          }
LABEL_63:

          goto LABEL_41;
        }
        if ([v25 isGPLocked])
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v71 = NFLogGetLogger();
          if (v71)
          {
            long long v72 = (void (*)(uint64_t, const char *, ...))v71;
            long long v73 = object_getClass(self);
            BOOL v74 = class_isMetaClass(v73);
            v210 = object_getClassName(self);
            v218 = sel_getName(a2);
            uint64_t v75 = 45;
            if (v74) {
              uint64_t v75 = 43;
            }
            v72(4, "%c[%{public}s %{public}s]:%i @applet %{public}@ is in GP locked state", v75, v210, v218, 888, v21);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v76 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            id v77 = object_getClass(self);
            if (class_isMetaClass(v77)) {
              int v78 = 43;
            }
            else {
              int v78 = 45;
            }
            __int16 v79 = object_getClassName(self);
            unsigned int v80 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v261 = v78;
            __int16 v262 = 2082;
            v263 = v79;
            __int16 v264 = 2082;
            v265 = v80;
            __int16 v266 = 1024;
            int v267 = 888;
            __int16 v268 = 2114;
            v269 = v21;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i @applet %{public}@ is in GP locked state", buf, 0x2Cu);
          }

          BOOL v36 = (void *)v231;
          uint64_t v37 = v20;
          goto LABEL_40;
        }
        if ([v25 lifecycleState] != 15)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v81 = NFLogGetLogger();
          if (v81)
          {
            BOOL v82 = (void (*)(uint64_t, const char *, ...))v81;
            __int16 v83 = object_getClass(self);
            BOOL v84 = class_isMetaClass(v83);
            v211 = object_getClassName(self);
            v219 = sel_getName(a2);
            uint64_t v85 = 45;
            if (v84) {
              uint64_t v85 = 43;
            }
            v82(4, "%c[%{public}s %{public}s]:%i @applet %{public}@ is not personalized", v85, v211, v219, 892, v21);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v86 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            __int16 v87 = object_getClass(self);
            if (class_isMetaClass(v87)) {
              int v88 = 43;
            }
            else {
              int v88 = 45;
            }
            unsigned int v89 = object_getClassName(self);
            v90 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v261 = v88;
            __int16 v262 = 2082;
            v263 = v89;
            __int16 v264 = 2082;
            v265 = v90;
            __int16 v266 = 1024;
            int v267 = 892;
            __int16 v268 = 2114;
            v269 = v21;
            _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i @applet %{public}@ is not personalized", buf, 0x2Cu);
          }
        }
LABEL_41:

        int v19 = (char *)v19 + 1;
      }
      while (v18 != v19);
      id v91 = [(NSMutableArray *)obj countByEnumeratingWithState:&v237 objects:v247 count:16];
      id v18 = v91;
    }
    while (v91);
  }

  v92 = v235;
  if ([v235 count])
  {
    [(NFExpressConfig *)self removeAppletsFromConfig:v235];
    if (v227) {
      BOOL *v227 = 1;
    }
  }
  id v9 = v229;
  if (!v228)
  {
    v131 = NFSharedSignpostLog();
    if (os_signpost_enabled(v131))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v131, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "update complete", buf, 2u);
    }
    id v118 = 0;
    id v130 = (id)v231;
    goto LABEL_203;
  }
  id v93 = (void *)v231;
  if (!self)
  {
    __int16 v179 = 0;
    goto LABEL_178;
  }
  if (self->super._expressConfigUpdateRequired)
  {
    id v95 = objc_alloc((Class)NSMutableArray);
    unsigned int v96 = [(NFExpressConfig *)self getExpressAidsForType:1];
    id v97 = [v95 initWithArray:v96];

    id v98 = [(NFExpressConfig *)self getExpressAidsForType:5];
    [v97 addObjectsFromArray:v98];

    int v99 = [(NFExpressConfigESE *)self getSecureElementWrapperAndSetRouting];
    if (v99)
    {
      id obja = v94;
      long long v243 = 0u;
      long long v244 = 0u;
      long long v241 = 0u;
      long long v242 = 0u;
      v100 = v97;
      id v101 = [v100 countByEnumeratingWithState:&v241 objects:buf count:16];
      if (v101)
      {
        id v102 = v101;
        LODWORD(v103) = 0;
        uint64_t v104 = *(void *)v242;
        while (2)
        {
          for (i = 0; i != v102; i = (char *)i + 1)
          {
            if (*(void *)v242 != v104) {
              objc_enumerationMutation(v100);
            }
            long long v106 = *(__CFString **)(*((void *)&v241 + 1) + 8 * i);
            v107 = sub_1002473C8(v99, v106);
            int v108 = v107;
            if (!v107)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v143 = NFLogGetLogger();
              if (v143)
              {
                long long v144 = (void (*)(uint64_t, const char *, ...))v143;
                long long v145 = object_getClass(self);
                BOOL v146 = class_isMetaClass(v145);
                v213 = object_getClassName(self);
                v223 = sel_getName("_updateDriverExpressConfig");
                uint64_t v147 = 45;
                if (v146) {
                  uint64_t v147 = 43;
                }
                v144(3, "%c[%{public}s %{public}s]:%i %{public}@ not found on eSE", v147, v213, v223, 1018, v106);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v148 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
              {
                uint64_t v149 = object_getClass(self);
                if (class_isMetaClass(v149)) {
                  int v150 = 43;
                }
                else {
                  int v150 = 45;
                }
                v151 = object_getClassName(self);
                int v152 = sel_getName("_updateDriverExpressConfig");
                *(_DWORD *)v248 = 67110146;
                int v249 = v150;
                __int16 v250 = 2082;
                v251 = v151;
                __int16 v252 = 2082;
                v253 = v152;
                __int16 v254 = 1024;
                int v255 = 1018;
                __int16 v256 = 2114;
                CFStringRef v257 = v106;
                id v153 = "%c[%{public}s %{public}s]:%i %{public}@ not found on eSE";
LABEL_173:
                _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_ERROR, v153, v248, 0x2Cu);
              }
LABEL_174:
              id v9 = v229;
              uint64_t v94 = obja;

              goto LABEL_175;
            }
            unsigned int v109 = [v107 supportedTypeFSystem];
            if (v109 != 1 && v109 != 2)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v170 = NFLogGetLogger();
              if (v170)
              {
                id v171 = (void (*)(uint64_t, const char *, ...))v170;
                int v172 = object_getClass(self);
                BOOL v173 = class_isMetaClass(v172);
                v214 = object_getClassName(self);
                v224 = sel_getName("_updateDriverExpressConfig");
                uint64_t v174 = 45;
                if (v173) {
                  uint64_t v174 = 43;
                }
                v171(3, "%c[%{public}s %{public}s]:%i Unknown type F type for applet %{public}@", v174, v214, v224, 1034, v106);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v148 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
              {
                __int16 v175 = object_getClass(self);
                if (class_isMetaClass(v175)) {
                  int v176 = 43;
                }
                else {
                  int v176 = 45;
                }
                __int16 v177 = object_getClassName(self);
                int v178 = sel_getName("_updateDriverExpressConfig");
                *(_DWORD *)v248 = 67110146;
                int v249 = v176;
                __int16 v250 = 2082;
                v251 = v177;
                __int16 v252 = 2082;
                v253 = v178;
                __int16 v254 = 1024;
                int v255 = 1034;
                __int16 v256 = 2114;
                CFStringRef v257 = v106;
                id v153 = "%c[%{public}s %{public}s]:%i Unknown type F type for applet %{public}@";
                goto LABEL_173;
              }
              goto LABEL_174;
            }
            uint64_t v103 = v109 | v103;
          }
          id v102 = [v100 countByEnumeratingWithState:&v241 objects:buf count:16];
          if (v102) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v103 = 0;
      }

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v154 = NFLogGetLogger();
      if (v154)
      {
        long long v155 = (void (*)(uint64_t, const char *, ...))v154;
        long long v156 = object_getClass(self);
        BOOL v157 = class_isMetaClass(v156);
        long long v158 = object_getClassName(self);
        long long v159 = sel_getName("_updateDriverExpressConfig");
        id v160 = [v100 count];
        CFStringRef v161 = @"YES";
        if (!v160) {
          CFStringRef v161 = @"NO";
        }
        CFStringRef v226 = v161;
        uint64_t v162 = 45;
        if (v157) {
          uint64_t v162 = 43;
        }
        v155(6, "%c[%{public}s %{public}s]:%i has type F express: %{public}@  entryConditions: %02X", v162, v158, v159, 1039, v226, v103);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v163 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
      {
        long long v164 = object_getClass(self);
        if (class_isMetaClass(v164)) {
          int v165 = 43;
        }
        else {
          int v165 = 45;
        }
        long long v166 = object_getClassName(self);
        long long v167 = sel_getName("_updateDriverExpressConfig");
        id v168 = [v100 count];
        *(_DWORD *)v248 = 67110402;
        CFStringRef v169 = @"YES";
        if (!v168) {
          CFStringRef v169 = @"NO";
        }
        int v249 = v165;
        __int16 v250 = 2082;
        v251 = v166;
        __int16 v252 = 2082;
        v253 = v167;
        __int16 v254 = 1024;
        int v255 = 1039;
        __int16 v256 = 2114;
        CFStringRef v257 = v169;
        __int16 v258 = 1024;
        int v259 = v103;
        _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i has type F express: %{public}@  entryConditions: %02X", v248, 0x32u);
      }

      id v9 = v229;
      uint64_t v94 = obja;
      if (![v100 count] || !v103) {
        goto LABEL_176;
      }
      v100 = +[_NFHardwareManager sharedHardwareManager];
      [v100 configureExpressFelicaEntry:v103];
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v132 = NFLogGetLogger();
      if (v132)
      {
        BOOL v133 = (void (*)(uint64_t, const char *, ...))v132;
        v134 = object_getClass(self);
        BOOL v135 = class_isMetaClass(v134);
        v136 = v94;
        v137 = object_getClassName(self);
        v222 = sel_getName("_updateDriverExpressConfig");
        uint64_t v138 = 45;
        if (v135) {
          uint64_t v138 = 43;
        }
        v212 = v137;
        uint64_t v94 = v136;
        v133(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v138, v212, v222, 1010);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v100 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        v139 = object_getClass(self);
        if (class_isMetaClass(v139)) {
          int v140 = 43;
        }
        else {
          int v140 = 45;
        }
        id v141 = object_getClassName(self);
        v142 = sel_getName("_updateDriverExpressConfig");
        *(_DWORD *)buf = 67109890;
        int v261 = v140;
        __int16 v262 = 2082;
        v263 = v141;
        __int16 v264 = 2082;
        v265 = v142;
        __int16 v266 = 1024;
        int v267 = 1010;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
      }
    }
LABEL_175:

LABEL_176:
    self->super._expressConfigUpdateRequired = 0;
    id v93 = (void *)v231;
    a2 = sel;
    v92 = v235;
  }
  __int16 v179 = self->super._passes;
LABEL_178:
  id v180 = v179;
  id v130 = [(NSMutableArray *)v180 mutableCopy];

  if ([v93 count]) {
    [v130 removeObjectsInArray:v93];
  }

LABEL_181:
  __int16 v181 = NFSharedSignpostLog();
  if (os_signpost_enabled(v181))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v181, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "configuring ATL", buf, 2u);
  }

  v131 = [(NFExpressConfigESE *)self getSecureElementWrapperAndSetRouting];
  if (v131)
  {
    uint64_t v182 = +[_NFHardwareManager sharedHardwareManager];
    v183 = (void *)v182;
    if (v182)
    {
      unint64_t v184 = (unint64_t)[*(id *)(v182 + 120) walletDomain];
      if (v184 <= 4) {
        uint64_t v185 = (0x19u >> v184) & 1;
      }
      else {
        uint64_t v185 = 0;
      }
    }
    else
    {
      uint64_t v185 = 0;
    }

    [(NFExpressConfig *)self dumpConfig:v130 logLevel:6 prefix:@"Configuring"];
    __int16 v186 = +[NSData NF_dataWithHexString:v9];
    sub_100251EF4(v131, v130, v186, v185);
    id v187 = (id)objc_claimAutoreleasedReturnValue();

    __int16 v188 = NFSharedSignpostLog();
    if (os_signpost_enabled(v188))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v188, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_UPDATE_ESE_APPLETS", "ATL configured", buf, 2u);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v189 = NFLogGetLogger();
    if (v189)
    {
      __int16 v190 = (void (*)(uint64_t, const char *, ...))v189;
      int v191 = object_getClass(self);
      BOOL v192 = class_isMetaClass(v191);
      int v193 = object_getClassName(self);
      v225 = sel_getName(a2);
      uint64_t v194 = 45;
      if (v192) {
        uint64_t v194 = 43;
      }
      v190(3, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", v194, v193, v225, 925);
    }
    v230 = v9;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v195 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
    {
      v196 = object_getClass(self);
      if (class_isMetaClass(v196)) {
        int v197 = 43;
      }
      else {
        int v197 = 45;
      }
      v198 = object_getClassName(self);
      v199 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v261 = v197;
      __int16 v262 = 2082;
      v263 = v198;
      __int16 v264 = 2082;
      v265 = v199;
      __int16 v266 = 1024;
      int v267 = 925;
      _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize eSE wrapper", buf, 0x22u);
    }

    id v200 = objc_alloc((Class)NSError);
    __int16 v188 = +[NSString stringWithUTF8String:"nfcd"];
    v245[0] = NSLocalizedDescriptionKey;
    v201 = +[NSString stringWithUTF8String:"Stack Error"];
    v246[0] = v201;
    v246[1] = &off_100319C60;
    v245[1] = @"Line";
    v245[2] = @"Method";
    id v202 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v246[2] = v202;
    v245[3] = NSDebugDescriptionErrorKey;
    id v203 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 926];
    v246[3] = v203;
    v245[4] = NSLocalizedFailureReasonErrorKey;
    id v204 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to initialize eSE wrapper"];
    v246[4] = v204;
    v205 = +[NSDictionary dictionaryWithObjects:v246 forKeys:v245 count:5];
    id v187 = [v200 initWithDomain:v188 code:15 userInfo:v205];

    id v9 = v230;
  }

  if (v187) {
    +[NFExceptionsCALogger postAnalyticsExpressSetupFailureEvent:3 context:6 error:v187];
  }
  v92 = v187;
  id v118 = v92;
LABEL_203:

LABEL_204:
LABEL_205:

  return v118;
}

- (BOOL)hasUWBKeys:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"keyIdentifier"];
        if (v9)
        {
          id v10 = (void *)v9;
          id v11 = [v8 objectForKeyedSubscript:@"UWBExpressEnabled"];
          unsigned __int8 v12 = [v11 BOOLValue];

          if (v12)
          {
            BOOL v13 = 1;
            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

@end