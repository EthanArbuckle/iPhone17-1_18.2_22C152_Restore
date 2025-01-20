@interface NPSSettings
+ (BOOL)domainShouldSyncFirst:(id)a3 key:(id)a4;
+ (id)bbAppsSettings;
+ (id)preprocessItemSyncGroups:(id)a3 forDomain:(id)a4 key:(id)a5;
- (NSMutableDictionary)permittedUserDefaults;
- (NSMutableDictionary)syncedUserDefaults;
- (id)_settingBundlesInDirectories:(id)a3;
- (void)loadSettingsBundles;
- (void)setPermittedUserDefaults:(id)a3;
- (void)setSyncedUserDefaults:(id)a3;
@end

@implementation NPSSettings

+ (BOOL)domainShouldSyncFirst:(id)a3 key:(id)a4
{
  uint64_t v5 = qword_100045788;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_100045788, &stru_10003D3D0);
  }
  v8 = [(id)qword_100045780 objectForKeyedSubscript:v7];

  unsigned __int8 v9 = [v8 containsObject:v6];
  return v9;
}

+ (id)preprocessItemSyncGroups:(id)a3 forDomain:(id)a4 key:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [a3 mutableCopy];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[NSMutableSet set];
  }
  v12 = v11;

  unsigned int v13 = +[NPSSettings domainShouldSyncFirst:v8 key:v7];
  if (v13)
  {
    [v12 addObject:@"First"];
    if (a3) {
      goto LABEL_9;
    }
  }
  else
  {
    [v12 removeObject:@"First"];
    if (a3) {
      goto LABEL_9;
    }
  }
  [v12 addObject:@"Local"];
LABEL_9:
  return v12;
}

- (id)_settingBundlesInDirectories:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v28 = +[NSPredicate predicateWithFormat:@"self ENDSWITH '.bundle'"];
  uint64_t v5 = +[NSFileManager defaultManager];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v6)
  {
    id v8 = v6;
    id v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v37;
    *(void *)&long long v7 = 138412546;
    long long v25 = v7;
    uint64_t v26 = *(void *)v37;
    v27 = v5;
    do
    {
      v12 = 0;
      id v29 = v8;
      do
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(obj);
        }
        unsigned int v13 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v12);

        id v35 = 0;
        v14 = [v5 contentsOfDirectoryAtPath:v13 error:&v35];
        id v10 = v35;

        if (v10)
        {
          v15 = nps_daemon_log;
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v42 = v13;
            __int16 v43 = 2112;
            id v44 = v10;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to list contents of %@: %@", buf, 0x16u);
          }
          id v9 = v14;
        }
        else
        {
          v16 = [v14 filteredArrayUsingPredicate:v28];

          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v9 = v16;
          id v17 = [v9 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v32;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v32 != v19) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                v22 = objc_msgSend(v13, "stringByAppendingPathComponent:", v21, v25);
                [v4 setObject:v22 forKeyedSubscript:v21];
              }
              id v18 = [v9 countByEnumeratingWithState:&v31 objects:v40 count:16];
            }
            while (v18);
          }

          uint64_t v11 = v26;
          uint64_t v5 = v27;
          id v8 = v29;
        }
        v12 = (char *)v12 + 1;
      }
      while (v12 != v8);
      id v8 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v8);
  }
  v23 = [v4 allValues];

  return v23;
}

- (void)loadSettingsBundles
{
  id v3 = (NSMutableDictionary *)objc_opt_new();
  syncedUserDefaults = self->_syncedUserDefaults;
  self->_syncedUserDefaults = v3;

  uint64_t v5 = (NSMutableDictionary *)objc_opt_new();
  permittedUserDefaults = self->_permittedUserDefaults;
  self->_permittedUserDefaults = v5;

  long long v7 = [@"/" stringByAppendingPathComponent:@"System/Library/PreferencesSyncBundles"];
  v222[0] = v7;
  v222[1] = @"/System/Cryptexes/App/System/Library/PreferencesSyncBundles";
  id v8 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
  id v9 = +[NSArray arrayWithObjects:v222 count:2];

  id v10 = [(NPSSettings *)self _settingBundlesInDirectories:v9];
  if ([v10 count])
  {
    v113 = v10;
    v114 = self;
    long long v204 = 0u;
    long long v203 = 0u;
    long long v202 = 0u;
    long long v201 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v201 objects:v221 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v202;
      v14 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
      uint64_t v117 = *(void *)v202;
      do
      {
        v15 = 0;
        id v118 = v12;
        do
        {
          if (*(void *)v202 != v13) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v16 = *(const __CFString **)(*((void *)&v201 + 1) + 8 * (void)v15);
          id v17 = (NSBundle *)[objc_alloc((Class)v14[284]) initWithPath:v16];
          id v18 = v17;
          if (v17)
          {
            uint64_t v19 = [(NSBundle *)v17 objectForInfoDictionaryKey:@"NPSDomains"];
            uint64_t v20 = (uint64_t)v8;
            if (!v19
              || (uint64_t v21 = objc_opt_class(), sub_1000235AC(v21, v18, @"NPSDomains", 0, v19, (Class)v21)))
            {
              v120 = v19;
              v121 = v15;
              long long v200 = 0u;
              long long v199 = 0u;
              long long v198 = 0u;
              long long v197 = 0u;
              v22 = v19;
              id v142 = [v22 countByEnumeratingWithState:&v197 objects:v220 count:16];
              if (!v142) {
                goto LABEL_126;
              }
              uint64_t v141 = *(void *)v198;
              v138 = v22;
              while (1)
              {
                v23 = 0;
                do
                {
                  if (*(void *)v198 != v141) {
                    objc_enumerationMutation(v22);
                  }
                  v24 = *(NSObject **)(*((void *)&v197 + 1) + 8 * (void)v23);
                  long long v25 = objc_opt_class();
                  if (sub_1000235AC(v25, v18, @"NPSDomains", 1, v24, (Class)v25))
                  {
                    uint64_t v26 = [v24 objectForKey:@"NPSDefaultsDomain"];
                    v27 = objc_opt_class();
                    v140 = v26;
                    if (!sub_1000235AC(v27, v18, @"NPSDefaultsDomain", 0, v26, (Class)v27)) {
                      goto LABEL_120;
                    }
                    v28 = [v24 objectForKey:@"NPSDefaultsKeys"];
                    if (v28)
                    {
                      id v29 = objc_opt_class();
                      if (!sub_1000235AC(v29, v18, @"NPSDefaultsKeys", 0, v28, (Class)v29)) {
                        goto LABEL_119;
                      }
                    }
                    v30 = [v24 objectForKey:@"NPSDefaultsKeyPrefixes", v113];
                    if (v30)
                    {
                      long long v31 = objc_opt_class();
                      if (!sub_1000235AC(v31, v18, @"NPSDefaultsKeyPrefixes", 0, v30, (Class)v31)) {
                        goto LABEL_118;
                      }
                    }
                    v139 = v30;
                    if (![v28 count] && ![v30 count])
                    {
                      v41 = nps_daemon_log;
                      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412802;
                        CFStringRef v212 = @"NPSDefaultsKeys";
                        __int16 v213 = 2112;
                        CFStringRef v214 = @"NPSDefaultsKeyPrefixes";
                        __int16 v215 = 2112;
                        CFStringRef v216 = (const __CFString *)v18;
                        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Missing %@ or %@ entry for bundle: %@.", buf, 0x20u);
                      }
                      goto LABEL_118;
                    }
                    long long v32 = [v24 objectForKey:@"NPSAction"];
                    long long v33 = objc_opt_class();
                    if (!sub_1000235AC(v33, v18, @"NPSAction", 0, v32, (Class)v33)) {
                      goto LABEL_117;
                    }
                    long long v34 = [v24 objectForKey:@"NPSContainer"];
                    if (v34)
                    {
                      id v35 = objc_opt_class();
                      if (!sub_1000235AC(v35, v18, @"NPSContainer", 0, v34, (Class)v35)) {
                        goto LABEL_116;
                      }
                    }
                    long long v36 = [v24 objectForKey:@"NPSAppGroupContainer"];
                    if (v36)
                    {
                      long long v37 = objc_opt_class();
                      if (!sub_1000235AC(v37, v18, @"NPSAppGroupContainer", 0, v36, (Class)v37)) {
                        goto LABEL_115;
                      }
                    }
                    v134 = v36;
                    v135 = v34;
                    v136 = v32;
                    long long v38 = [v24 objectForKey:@"NPSChangeNotificationName"];
                    long long v39 = +[NSMutableSet set];
                    objc_opt_class();
                    v133 = v38;
                    if (objc_opt_isKindOfClass())
                    {
                      v40 = +[NSArray arrayWithObject:v38];
                    }
                    else
                    {
                      v40 = v38;
                    }
                    v137 = v40;
                    if (!v40) {
                      goto LABEL_45;
                    }
                    v42 = objc_opt_class();
                    if (!sub_1000235AC(v42, v18, @"NPSChangeNotificationName", 0, v40, (Class)v42)) {
                      goto LABEL_114;
                    }
                    v128 = v28;
                    long long v195 = 0u;
                    long long v196 = 0u;
                    long long v193 = 0u;
                    long long v194 = 0u;
                    __int16 v43 = v40;
                    id v44 = [v43 countByEnumeratingWithState:&v193 objects:v219 count:16];
                    if (v44)
                    {
                      id v45 = v44;
                      uint64_t v46 = *(void *)v194;
                      do
                      {
                        for (i = 0; i != v45; i = (char *)i + 1)
                        {
                          if (*(void *)v194 != v46) {
                            objc_enumerationMutation(v43);
                          }
                          v48 = *(NSObject **)(*((void *)&v193 + 1) + 8 * i);
                          v49 = objc_opt_class();
                          if (sub_1000235AC(v49, v18, @"NPSChangeNotificationName", 1, v48, (Class)v49)) {
                            [v39 addObject:v48];
                          }
                        }
                        id v45 = [v43 countByEnumeratingWithState:&v193 objects:v219 count:16];
                      }
                      while (v45);
                    }

                    v28 = v128;
LABEL_45:
                    v50 = [v24 objectForKey:@"NPSCloudEnabled"];
                    if (v50)
                    {
                      v51 = objc_opt_class();
                      v40 = v137;
                      if (sub_1000235AC(v51, v18, @"NPSCloudEnabled", 0, v50, (Class)v51))
                      {
                        v131 = v50;
                        unsigned __int8 v124 = [v50 BOOLValue];
                        goto LABEL_49;
                      }
LABEL_113:

LABEL_114:
                      long long v34 = v135;
                      long long v32 = v136;
                      long long v36 = v134;
LABEL_115:

                      uint64_t v20 = 0x10003C000;
LABEL_116:

LABEL_117:
                      v30 = v139;
LABEL_118:

                      v22 = v138;
LABEL_119:

LABEL_120:
                      goto LABEL_121;
                    }
                    v131 = 0;
                    unsigned __int8 v124 = 0;
LABEL_49:
                    uint64_t v52 = [v24 objectForKey:@"NPSSyncGroups"];
                    v130 = (void *)v52;
                    if (v52)
                    {
                      v132 = +[NSSet setWithArray:v52];
                    }
                    else
                    {
                      v132 = 0;
                    }
                    v53 = [v24 objectForKey:@"NPSPerGizmo"];
                    if (!v53)
                    {
                      v127 = 0;
                      unsigned __int8 v122 = 0;
                      v40 = v137;
                      goto LABEL_56;
                    }
                    v54 = objc_opt_class();
                    v40 = v137;
                    if (!sub_1000235AC(v54, v18, @"NPSPerGizmo", 0, v53, (Class)v54)) {
                      goto LABEL_112;
                    }
                    v127 = v53;
                    unsigned __int8 v122 = [v53 BOOLValue];
LABEL_56:
                    v55 = [v24 objectForKey:@"NPSMirrorableBBDomain"];
                    if (v55)
                    {
                      v56 = objc_opt_class();
                      if (!sub_1000235AC(v56, v18, @"NPSMirrorableBBDomain", 0, v55, (Class)v56)) {
                        goto LABEL_111;
                      }
                    }
                    v126 = v55;
                    v57 = [v24 objectForKey:@"NPSMirrorableDomain"];
                    if (v57)
                    {
                      v58 = objc_opt_class();
                      if (!sub_1000235AC(v58, v18, @"NPSMirrorableDomain", 0, v57, (Class)v58)) {
                        goto LABEL_110;
                      }
                    }
                    v123 = v57;
                    uint64_t v59 = [v24 objectForKey:@"NPSMirrorableKey"];
                    if (v59)
                    {
                      v60 = objc_opt_class();
                      if (!sub_1000235AC(v60, v18, @"NPSMirrorableKey", 0, v59, (Class)v60)) {
                        goto LABEL_109;
                      }
                    }
                    if (v126 && (unint64_t)v123 | v59)
                    {
                      v61 = nps_daemon_log;
                      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138413058;
                        CFStringRef v212 = @"NPSMirrorableBBDomain";
                        __int16 v213 = 2112;
                        CFStringRef v214 = @"NPSMirrorableDomain";
                        __int16 v215 = 2112;
                        CFStringRef v216 = @"NPSMirrorableKey";
                        __int16 v217 = 2112;
                        v218 = v18;
                        v62 = v61;
                        v63 = "Key %@ mutually exclusive with keys %@ and %@ in bundle %@";
                        uint32_t v64 = 42;
                        goto LABEL_69;
                      }
LABEL_109:

                      v40 = v137;
                      v57 = v123;
LABEL_110:

                      v55 = v126;
LABEL_111:

                      v53 = v127;
LABEL_112:

                      v50 = v131;
                      goto LABEL_113;
                    }
                    if ((v123 != 0) != (v59 != 0))
                    {
                      v65 = nps_daemon_log;
                      if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_109;
                      }
                      *(_DWORD *)buf = 138412802;
                      CFStringRef v212 = @"NPSMirrorableDomain";
                      __int16 v213 = 2112;
                      CFStringRef v214 = @"NPSMirrorableKey";
                      __int16 v215 = 2112;
                      CFStringRef v216 = (const __CFString *)v18;
                      v62 = v65;
                      v63 = "Keys %@ and %@ must go together in bundle %@";
                      uint32_t v64 = 32;
                      goto LABEL_69;
                    }
                    v129 = v28;
                    uint64_t v116 = v59;
                    if (([v136 isEqualToString:@"OneWaySync"] & 1) != 0
                      || [v136 isEqualToString:@"TwoWaySync"])
                    {
                      unsigned __int8 v66 = [v136 isEqualToString:@"TwoWaySync"];
                      v67 = [(NSMutableDictionary *)v114->_syncedUserDefaults objectForKey:v140];
                      v68 = v126;
                      if (!v67)
                      {
                        v67 = objc_opt_new();
                        [v67 setDomain:v140];
                        uint64_t v69 = v59;
                        v70 = objc_opt_new();
                        [v67 setKeyArrays:v70];

                        v71 = objc_opt_new();
                        [v67 setKeyPrefixArrays:v71];

                        uint64_t v59 = v69;
                        v68 = v126;
                        [(NSMutableDictionary *)v114->_syncedUserDefaults setObject:v67 forKey:v140];
                      }
                      v177[0] = _NSConcreteStackBlock;
                      v177[1] = 3221225472;
                      v177[2] = sub_100023738;
                      v177[3] = &unk_10003D438;
                      v189 = &stru_10003D410;
                      v178 = v18;
                      id v115 = v67;
                      id v179 = v115;
                      unsigned __int8 v190 = v66;
                      v180 = v135;
                      v181 = v134;
                      unsigned __int8 v191 = v124;
                      id v182 = v132;
                      v183 = v140;
                      unsigned __int8 v192 = v122;
                      v184 = v68;
                      v185 = v123;
                      id v186 = (id)v59;
                      v187 = v114;
                      id v188 = v39;
                      v72 = objc_retainBlock(v177);
                      long long v173 = 0u;
                      long long v174 = 0u;
                      long long v175 = 0u;
                      long long v176 = 0u;
                      v73 = v28;
                      id v74 = [v73 countByEnumeratingWithState:&v173 objects:v210 count:16];
                      if (v74)
                      {
                        id v75 = v74;
                        uint64_t v76 = *(void *)v174;
                        do
                        {
                          for (j = 0; j != v75; j = (char *)j + 1)
                          {
                            if (*(void *)v174 != v76) {
                              objc_enumerationMutation(v73);
                            }
                            ((void (*)(void *, void, void, const __CFString *))v72[2])(v72, *(void *)(*((void *)&v173 + 1) + 8 * (void)j), 0, @"NPSDefaultsKeys");
                          }
                          id v75 = [v73 countByEnumeratingWithState:&v173 objects:v210 count:16];
                        }
                        while (v75);
                      }

                      long long v171 = 0u;
                      long long v172 = 0u;
                      long long v169 = 0u;
                      long long v170 = 0u;
                      v78 = v139;
                      id v79 = [v78 countByEnumeratingWithState:&v169 objects:v209 count:16];
                      if (v79)
                      {
                        id v80 = v79;
                        uint64_t v81 = *(void *)v170;
                        do
                        {
                          for (k = 0; k != v80; k = (char *)k + 1)
                          {
                            if (*(void *)v170 != v81) {
                              objc_enumerationMutation(v78);
                            }
                            ((void (*)(void *, void, uint64_t, const __CFString *))v72[2])(v72, *(void *)(*((void *)&v169 + 1) + 8 * (void)k), 1, @"NPSDefaultsKeyPrefixes");
                          }
                          id v80 = [v78 countByEnumeratingWithState:&v169 objects:v209 count:16];
                        }
                        while (v80);
                      }

                      v83 = v115;
                    }
                    else
                    {
                      if (([v136 isEqualToString:@"Whitelist"] & 1) == 0
                        && ![v136 isEqualToString:@"Permitlist"])
                      {
                        v98 = nps_daemon_log;
                        if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_109;
                        }
                        *(_DWORD *)buf = 138412546;
                        CFStringRef v212 = (const __CFString *)v136;
                        __int16 v213 = 2112;
                        CFStringRef v214 = (const __CFString *)v18;
                        v62 = v98;
                        v63 = "Action %@ not supported in bundle (%@).";
                        uint32_t v64 = 22;
LABEL_69:
                        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, v63, buf, v64);
                        goto LABEL_109;
                      }
                      v84 = [(NSMutableDictionary *)v114->_permittedUserDefaults objectForKey:v140];
                      if (!v84)
                      {
                        v84 = objc_opt_new();
                        [v84 setDomain:v140];
                        v85 = objc_opt_new();
                        [v84 setKeys:v85];

                        v86 = objc_opt_new();
                        [v84 setKeyPrefixes:v86];

                        [(NSMutableDictionary *)v114->_permittedUserDefaults setObject:v84 forKey:v140];
                      }
                      v159[0] = _NSConcreteStackBlock;
                      v159[1] = 3221225472;
                      v159[2] = sub_100023C5C;
                      v159[3] = &unk_10003D460;
                      v167 = &stru_10003D410;
                      v160 = v18;
                      id v125 = v84;
                      id v161 = v125;
                      v162 = v135;
                      v163 = v140;
                      unsigned __int8 v168 = v122;
                      v164 = v134;
                      id v165 = v132;
                      id v166 = v39;
                      v87 = objc_retainBlock(v159);
                      long long v155 = 0u;
                      long long v156 = 0u;
                      long long v157 = 0u;
                      long long v158 = 0u;
                      v88 = v28;
                      id v89 = [v88 countByEnumeratingWithState:&v155 objects:v208 count:16];
                      if (v89)
                      {
                        id v90 = v89;
                        uint64_t v91 = *(void *)v156;
                        do
                        {
                          for (m = 0; m != v90; m = (char *)m + 1)
                          {
                            if (*(void *)v156 != v91) {
                              objc_enumerationMutation(v88);
                            }
                            ((void (*)(void *, void, void, const __CFString *))v87[2])(v87, *(void *)(*((void *)&v155 + 1) + 8 * (void)m), 0, @"NPSDefaultsKeys");
                          }
                          id v90 = [v88 countByEnumeratingWithState:&v155 objects:v208 count:16];
                        }
                        while (v90);
                      }

                      long long v153 = 0u;
                      long long v154 = 0u;
                      long long v151 = 0u;
                      long long v152 = 0u;
                      v93 = v139;
                      id v94 = [v93 countByEnumeratingWithState:&v151 objects:v207 count:16];
                      if (v94)
                      {
                        id v95 = v94;
                        uint64_t v96 = *(void *)v152;
                        do
                        {
                          for (n = 0; n != v95; n = (char *)n + 1)
                          {
                            if (*(void *)v152 != v96) {
                              objc_enumerationMutation(v93);
                            }
                            ((void (*)(void *, void, uint64_t, const __CFString *))v87[2])(v87, *(void *)(*((void *)&v151 + 1) + 8 * (void)n), 1, @"NPSDefaultsKeyPrefixes");
                          }
                          id v95 = [v93 countByEnumeratingWithState:&v151 objects:v207 count:16];
                        }
                        while (v95);
                      }

                      v83 = v125;
                    }

                    v28 = v129;
                    uint64_t v59 = v116;
                    goto LABEL_109;
                  }
LABEL_121:
                  v23 = (char *)v23 + 1;
                }
                while (v23 != v142);
                id v99 = [v22 countByEnumeratingWithState:&v197 objects:v220 count:16];
                id v142 = v99;
                if (!v99)
                {
LABEL_126:

                  uint64_t v13 = v117;
                  id v12 = v118;
                  v14 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
                  uint64_t v19 = v120;
                  v15 = v121;
                  break;
                }
              }
            }
            id v8 = (CFNotificationCenterRef (**)(void))v20;
          }
          else
          {
            v100 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v212 = v16;
              _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Unable to read bundle: %@", buf, 0xCu);
            }
          }

          v15 = (char *)v15 + 1;
        }
        while (v15 != v12);
        id v12 = [obj countByEnumeratingWithState:&v201 objects:v221 count:16];
      }
      while (v12);
    }

    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    v101 = v114->_syncedUserDefaults;
    id v102 = [(NSMutableDictionary *)v101 countByEnumeratingWithState:&v147 objects:v206 count:16];
    if (v102)
    {
      id v103 = v102;
      uint64_t v104 = *(void *)v148;
      do
      {
        for (ii = 0; ii != v103; ii = (char *)ii + 1)
        {
          if (*(void *)v148 != v104) {
            objc_enumerationMutation(v101);
          }
          v106 = -[NSMutableDictionary objectForKeyedSubscript:](v114->_syncedUserDefaults, "objectForKeyedSubscript:", *(void *)(*((void *)&v147 + 1) + 8 * (void)ii), v113);
          [v106 log];
        }
        id v103 = [(NSMutableDictionary *)v101 countByEnumeratingWithState:&v147 objects:v206 count:16];
      }
      while (v103);
    }

    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    v107 = v114->_permittedUserDefaults;
    id v108 = [(NSMutableDictionary *)v107 countByEnumeratingWithState:&v143 objects:v205 count:16];
    if (v108)
    {
      id v109 = v108;
      uint64_t v110 = *(void *)v144;
      do
      {
        for (jj = 0; jj != v109; jj = (char *)jj + 1)
        {
          if (*(void *)v144 != v110) {
            objc_enumerationMutation(v107);
          }
          v112 = -[NSMutableDictionary objectForKeyedSubscript:](v114->_permittedUserDefaults, "objectForKeyedSubscript:", *(void *)(*((void *)&v143 + 1) + 8 * (void)jj), v113);
          [v112 log];
        }
        id v109 = [(NSMutableDictionary *)v107 countByEnumeratingWithState:&v143 objects:v205 count:16];
      }
      while (v109);
    }

    id v10 = v113;
  }
}

+ (id)bbAppsSettings
{
  if (qword_100045798 != -1) {
    dispatch_once(&qword_100045798, &stru_10003D480);
  }
  v2 = (void *)qword_100045790;
  return v2;
}

- (NSMutableDictionary)syncedUserDefaults
{
  return self->_syncedUserDefaults;
}

- (void)setSyncedUserDefaults:(id)a3
{
}

- (NSMutableDictionary)permittedUserDefaults
{
  return self->_permittedUserDefaults;
}

- (void)setPermittedUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permittedUserDefaults, 0);
  objc_storeStrong((id *)&self->_syncedUserDefaults, 0);
}

@end