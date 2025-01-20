@interface NESMPathControllerSession
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)shouldBeIdleForStatus:(int)a3;
- (NESMPathControllerSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (int)type;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)handleChangeEventForFallbackInterfaces:(id)a3;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)install;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)uninstall;
@end

@implementation NESMPathControllerSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiNOI, 0);
  objc_storeStrong((id *)&self->_noiManager, 0);
  objc_storeStrong((id *)&self->_localResolverAddresses, 0);
  objc_storeStrong((id *)&self->_fallbackNotificationTimer, 0);
  objc_storeStrong((id *)&self->_fallbackAssertions, 0);
  objc_storeStrong((id *)&self->_fallbackAllowedBundleIDs, 0);
  objc_storeStrong((id *)&self->_backgroundBundleIDs, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIDs, 0);
  objc_storeStrong((id *)&self->_fallbackInterfacesDict, 0);
  objc_storeStrong((id *)&self->_primaryFallbackFromInterface, 0);
  objc_storeStrong((id *)&self->_primaryFallbackInterface, 0);
  objc_storeStrong((id *)&self->_fallbackTransaction, 0);
  objc_storeStrong((id *)&self->_roamingMonitorTransaction, 0);
  objc_storeStrong((id *)&self->_currentMatchedSSID, 0);
  objc_storeStrong((id *)&self->_ssidWatchers, 0);
  objc_storeStrong((id *)&self->_roamingMonitor, 0);
  objc_storeStrong((id *)&self->_rulePolicies, 0);
  objc_storeStrong((id *)&self->_ruleMonitors, 0);

  objc_storeStrong((id *)&self->_controllerConfiguration, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 392, 1);
  }
  else {
    id Property = 0;
  }
  id v14 = Property;
  if (v14 != v10)
  {

LABEL_8:
    int v18 = 0;
    goto LABEL_9;
  }
  unsigned int v15 = [v9 isEqualToString:@"status"];

  if (!v15) {
    goto LABEL_8;
  }
  v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (self) {
      id v87 = objc_getProperty(self, v17, 392, 1);
    }
    else {
      id v87 = 0;
    }
    id v88 = [v87 status];
    v89 = @"Invalid";
    if (v88 == (id)2) {
      v89 = @"Not Available";
    }
    if (v88 == (id)1) {
      v89 = @"Available";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v185 = v89;
    v90 = v89;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Roaming status changed to %@", buf, 0xCu);
  }
  int v18 = 1;
LABEL_9:
  uint64_t v19 = [(NESMSession *)self server];
  if ((id)v19 == v10)
  {
    if ([v9 isEqualToString:@"primaryCellularInterface"])
    {
    }
    else
    {
      unsigned __int8 v22 = [v9 isEqualToString:@"primaryPhysicalInterface"];

      if ((v22 & 1) == 0)
      {
        int v21 = 0;
        goto LABEL_72;
      }
    }
    unsigned int v24 = [v9 isEqualToString:@"primaryCellularInterface"];
    v25 = ne_log_obj();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v24)
    {
      if (!v26) {
        goto LABEL_18;
      }
      v27 = [(NESMSession *)self server];
      [v27 primaryCellularInterface];
      v29 = id v28 = v12;
      *(_DWORD *)buf = 138412290;
      *(void *)v185 = v29;
      v30 = "Primary cellular interface changed to %@";
    }
    else
    {
      if (!v26) {
        goto LABEL_18;
      }
      v27 = [(NESMSession *)self server];
      [v27 primaryPhysicalInterface];
      v29 = id v28 = v12;
      *(_DWORD *)buf = 138412290;
      *(void *)v185 = v29;
      v30 = "Primary physical interface changed to %@";
    }
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, v30, buf, 0xCu);

    id v12 = v28;
LABEL_18:
    int v174 = v18;

    v31 = [(NESMSession *)self server];
    uint64_t v32 = [v31 primaryCellularInterface];
    id v172 = v12;
    if (v32)
    {
      v33 = (void *)v32;
      v34 = [(NESMSession *)self server];
      v35 = [v34 primaryCellularInterface];
      v36 = [v35 interfaceName];
      [(NESMSession *)self server];
      v37 = id v167 = v9;
      [v37 primaryPhysicalInterface];
      v38 = id v164 = v10;
      [v38 interfaceName];
      v40 = v39 = self;
      unsigned __int8 v41 = [v36 isEqualToString:v40];

      self = v39;
      id v10 = v164;

      id v9 = v167;
      id v12 = v172;

      if ((v41 & 1) == 0)
      {
        v43 = [(NESMSession *)v39 server];
        id v20 = [v43 primaryCellularInterface];

        v44 = [(NESMSession *)v39 server];
        id v45 = [v44 primaryPhysicalInterface];

        if (v20)
        {
          if (v39)
          {
            v46 = &selRef_setLastPrimaryInterface_;
            int v21 = 1;
            id v47 = objc_getProperty(self, v42, 432, 1);
            int v18 = v174;
            if (v47)
            {
              id v48 = v47;
              int v170 = 0;
              goto LABEL_32;
            }
LABEL_26:
            id v49 = objc_getProperty(self, v42, *((int *)v46 + 728), 1);
            if (v20 != v49)
            {

              if (v21)
              {
LABEL_65:
                if (!objc_getProperty(self, v42, *((int *)v46 + 728), 1)) {
                  int v18 = 1;
                }
                goto LABEL_67;
              }
LABEL_59:
              int v18 = 1;
LABEL_67:
              objc_setProperty_atomic(self, v42, v20, *((int *)v46 + 728));
              objc_setProperty_atomic(self, v66, v45, 440);
LABEL_68:
              v67 = ne_log_obj();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                if (self) {
                  id v81 = objc_getProperty(self, v68, *((int *)v46 + 728), 1);
                }
                else {
                  id v81 = 0;
                }
                v83 = [v81 interfaceName];
                int v84 = v18;
                if (self) {
                  id v85 = objc_getProperty(self, v82, 440, 1);
                }
                else {
                  id v85 = 0;
                }
                v86 = [v85 interfaceName];
                *(_DWORD *)buf = 138412546;
                *(void *)v185 = v83;
                *(_WORD *)&v185[8] = 2112;
                uint64_t v186 = (uint64_t)v86;
                _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "Fallback interface set to %@ from %@", buf, 0x16u);

                int v18 = v84;
              }

              int v21 = 1;
              goto LABEL_70;
            }
            id v48 = 0;
            if (!v21)
            {
              LOBYTE(v170) = 1;
              int v165 = 0;
              int v162 = 0;
              goto LABEL_42;
            }
            int v170 = 1;
LABEL_32:
            id v50 = objc_getProperty(self, v42, *((int *)v46 + 728), 1);
            if (v50)
            {
              v168 = v48;
              v160 = v50;
              v51 = [v20 interfaceName];
              id v53 = objc_getProperty(self, v52, *((int *)v46 + 728), 1);
              v54 = [v53 interfaceName];
              if ([v51 isEqualToString:v54])
              {

                if (v170) {
                id v12 = v172;
                }
                goto LABEL_65;
              }
              v157 = v54;
              v158 = v53;
              v159 = v51;
              int v165 = 1;
              int v162 = 1;
              id v12 = v172;
              id v48 = v168;
            }
            else
            {
              int v165 = 1;
              v160 = 0;
              int v162 = 0;
              id v12 = v172;
            }
LABEL_42:
            v169 = v48;
            if (v45)
            {
              id v55 = objc_getProperty(self, v42, 440, 1);
              if (v55)
              {
                v56 = v55;
                id v57 = v9;
                int v58 = 0;
                goto LABEL_50;
              }
            }
            id v59 = objc_getProperty(self, v42, 440, 1);
            unsigned __int8 v60 = v45 != v59;
            if (v45 == v59)
            {
              if (v45)
              {
                id v57 = v9;
                v56 = 0;
                int v58 = 1;
LABEL_50:
                id v61 = v10;
                if (objc_getProperty(self, v42, 440, 1))
                {
                  v62 = [v45 interfaceName];
                  v63 = self;
                  v65 = [objc_getProperty(self, v64, 440, 1) interfaceName];
                  unsigned __int8 v60 = [v62 isEqualToString:v65];

                  int v18 = v174;
                  if (!v58)
                  {
LABEL_53:
                    id v9 = v57;
                    self = v63;
                    id v10 = v61;
                    id v12 = v172;
                    v46 = &selRef_setLastPrimaryInterface_;
LABEL_54:

                    if (v162) {
                      goto LABEL_55;
                    }
                    goto LABEL_61;
                  }
                }
                else
                {
                  v63 = self;
                  unsigned __int8 v60 = 0;
                  if (!v58) {
                    goto LABEL_53;
                  }
                }

                goto LABEL_53;
              }
            }
            else
            {

              if (v45)
              {
                v56 = 0;
                unsigned __int8 v60 = 1;
                goto LABEL_54;
              }
            }
            id v45 = 0;
            if (v162)
            {
LABEL_55:

              if ((v165 & 1) == 0) {
                goto LABEL_56;
              }
              goto LABEL_62;
            }
LABEL_61:
            if (!v165)
            {
LABEL_56:
              if (v170) {

              }
              if (v60) {
                goto LABEL_59;
              }
              goto LABEL_90;
            }
LABEL_62:

            if (v170) {
            if (v60)
            }
              goto LABEL_65;
LABEL_90:
            int v21 = 0;
LABEL_70:

            goto LABEL_71;
          }
          int v18 = 1;
        }
        else
        {
          id v20 = 0;
          if (v39)
          {
            int v21 = 0;
            int v18 = v174;
            v46 = &selRef_setLastPrimaryInterface_;
            goto LABEL_26;
          }
          if (!v45)
          {
            int v21 = 0;
            id v45 = 0;
            id v10 = v164;
            id v9 = v167;
            self = 0;
            id v12 = v172;
            int v18 = v174;
            goto LABEL_70;
          }
          int v18 = 1;
          id v10 = v164;
          id v9 = v167;
          self = 0;
          id v12 = v172;
        }
        v46 = &selRef_setLastPrimaryInterface_;
        goto LABEL_68;
      }
    }
    else
    {
    }
    id v45 = 0;
    int v21 = 0;
    id v20 = 0;
    int v18 = v174;
    v46 = &selRef_setLastPrimaryInterface_;
    if (!self)
    {
      id v20 = 0;
      goto LABEL_70;
    }
    goto LABEL_26;
  }
  id v20 = (id)v19;
  int v21 = 0;
LABEL_71:

LABEL_72:
  if (self) {
    id v69 = objc_getProperty(self, v23, 512, 1);
  }
  else {
    id v69 = 0;
  }
  id v70 = v69;
  v71 = &selRef_setLastPrimaryInterface_;
  if (v70 == v10)
  {
    unsigned int v73 = [v9 isEqualToString:@"considerAlternateUpdate"];

    if (!v73) {
      goto LABEL_165;
    }
    if (self) {
      id v75 = objc_getProperty(self, v74, 512, 1);
    }
    else {
      id v75 = 0;
    }
    v72 = [v75 considerAlternateUpdate];
    v76 = ne_log_obj();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v185 = v72;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Consider alternate update, new advice: %@", buf, 0xCu);
    }

    v171 = [v72 applications];
    id v77 = [v72 level];
    v163 = v72;
    if (self)
    {
      if (self->_level == v77) {
        goto LABEL_120;
      }
      self->_level = (int64_t)v77;
      if (v77 == (id)2)
      {
        if (self->_fallbackEnabled)
        {
          if (!self->_weakFallback)
          {
LABEL_120:
            int v161 = v21;
            id v105 = v171;
            id v107 = objc_getProperty(self, v106, 504, 1);
            if (v107)
            {
              v109 = v107;
              id v110 = objc_getProperty(self, v108, 512, 1);
              if (v110)
              {
                v112 = v110;
                int v175 = v18;
                id v113 = objc_getProperty(self, v111, 472, 1);

                if (v113)
                {
                  id v166 = v10;
                  v114 = +[NSMutableSet set];
                  long long v178 = 0u;
                  long long v179 = 0u;
                  long long v180 = 0u;
                  long long v181 = 0u;
                  id v115 = v105;
                  id v116 = [v115 countByEnumeratingWithState:&v178 objects:buf count:16];
                  if (v116)
                  {
                    id v117 = v116;
                    id v173 = v12;
                    char v118 = 0;
                    uint64_t v119 = *(void *)v179;
                    do
                    {
                      for (i = 0; i != v117; i = (char *)i + 1)
                      {
                        if (*(void *)v179 != v119) {
                          objc_enumerationMutation(v115);
                        }
                        v121 = *(void **)(*((void *)&v178 + 1) + 8 * i);
                        v122 = [v121 bundleIdentifier];
                        if (v122)
                        {
                          [v114 addObject:v122];
                          if ([v121 state] == (id)2
                            && (objc_msgSend(objc_getProperty(self, v123, 456, 1), "containsObject:", v122) & 1) == 0)
                          {
                            char v118 = 1;
                            [objc_getProperty(self, v124, 456, 1) addObject:v122];
                          }
                          else if ([v121 state] == (id)1 {
                                 && objc_msgSend(objc_getProperty(self, v125, 456, 1), "containsObject:", v122))
                          }
                          {
                            char v118 = 1;
                            [objc_getProperty(self, v126, 456, 1) removeObject:v122];
                          }
                          if ([v121 state] == (id)1
                            && (objc_msgSend(objc_getProperty(self, v127, 464, 1), "containsObject:", v122) & 1) == 0)
                          {
                            char v118 = 1;
                            [objc_getProperty(self, v128, 464, 1) addObject:v122];
                          }
                          else if ([v121 state] == (id)2 {
                                 && objc_msgSend(objc_getProperty(self, v129, 464, 1), "containsObject:", v122))
                          }
                          {
                            char v118 = 1;
                            [objc_getProperty(self, v130, 464, 1) removeObject:v122];
                          }
                        }
                      }
                      id v117 = [v115 countByEnumeratingWithState:&v178 objects:buf count:16];
                    }
                    while (v117);

                    v72 = v163;
                    id v10 = v166;
                    id v12 = v173;
                    int v21 = v161;
                    v132 = v114;
                    if (v118)
                    {
                      v133 = ne_log_obj();
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
                      {
                        v154 = (NESMPathControllerSession *)objc_getProperty(self, v134, 456, 1);
                        *(_DWORD *)v182 = 138412290;
                        v183 = v154;
                        _os_log_debug_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEBUG, "Foreground apps changed to %@", v182, 0xCu);
                      }

                      v135 = ne_log_obj();
                      if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG))
                      {
                        v155 = (NESMPathControllerSession *)objc_getProperty(self, v136, 464, 1);
                        *(_DWORD *)v182 = 138412290;
                        v183 = v155;
                        _os_log_debug_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEBUG, "Background running apps changed to %@", v182, 0xCu);
                      }

                      v137 = ne_log_obj();
                      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v182 = 138412290;
                        v183 = self;
                        _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "%@: Updating policies on app state change", v182, 0xCu);
                      }

                      sub_10008E3E8(self, 1, 0);
                      v72 = v163;
                    }
                  }
                  else
                  {

                    id v10 = v166;
                    int v21 = v161;
                    v132 = v114;
                  }
                  int v18 = v175;
                  v71 = &selRef_setLastPrimaryInterface_;
                  if ((objc_msgSend(objc_getProperty(self, v131, 472, 1), "isEqualToSet:", v132) & 1) == 0)
                  {
                    objc_setProperty_atomic(self, v138, v132, 472);
                    v139 = ne_log_obj();
                    if (os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
                    {
                      v153 = (NESMPathControllerSession *)objc_getProperty(self, v140, 472, 1);
                      *(_DWORD *)v182 = 138412290;
                      v183 = v153;
                      _os_log_debug_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEBUG, "Fallback allowed apps changed to %@", v182, 0xCu);
                    }

                    v141 = ne_log_obj();
                    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v182 = 138412290;
                      v183 = self;
                      _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "%@: Updating policies on fallback app change", v182, 0xCu);
                    }

                    sub_10008E3E8(self, 1, 0);
                  }

                  goto LABEL_163;
                }
                int v18 = v175;
              }
              else
              {
              }
              int v21 = v161;
            }
LABEL_163:

            goto LABEL_164;
          }
        }
        else
        {
          v91 = ne_log_obj();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "Begin strong fallback advisory", buf, 2u);
          }

          id v92 = objc_alloc((Class)NSString);
          v93 = [(NESMSession *)self configuration];
          v94 = [v93 identifier];
          id v95 = [v92 initWithFormat:@"com.apple.nesessionmanager.strongFallback.%@", v94];

          [v95 UTF8String];
          v96 = (void *)os_transaction_create();
          objc_setProperty_atomic(self, v97, v96, 424);

          int v18 = 1;
        }
        BOOL v80 = 0;
        self->_fallbackEnabled = 1;
LABEL_119:
        self->_weakFallback = v80;
        int v21 = 1;
        goto LABEL_120;
      }
      if (v77 == (id)1)
      {
        if (self->_fallbackEnabled)
        {
          if (self->_weakFallback)
          {
            v71 = &selRef_setLastPrimaryInterface_;
            goto LABEL_120;
          }
        }
        else
        {
          v98 = ne_log_obj();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Begin weak fallback advisory", buf, 2u);
          }

          id v99 = objc_alloc((Class)NSString);
          v100 = [(NESMSession *)self configuration];
          v101 = [v100 identifier];
          id v102 = [v99 initWithFormat:@"com.apple.nesessionmanager.weakFallback.%@", v101];

          [v102 UTF8String];
          v103 = (void *)os_transaction_create();
          objc_setProperty_atomic(self, v104, v103, 424);

          int v18 = 1;
        }
        BOOL v80 = 1;
        self->_fallbackEnabled = 1;
        v71 = &selRef_setLastPrimaryInterface_;
        goto LABEL_119;
      }
      if (v77) {
        goto LABEL_120;
      }
    }
    else if (!v77)
    {
      id v156 = v171;
      goto LABEL_163;
    }
    if (!self->_fallbackEnabled) {
      goto LABEL_120;
    }
    v78 = ne_log_obj();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "End fallback advisory", buf, 2u);
    }

    objc_setProperty_atomic(self, v79, 0, 424);
    BOOL v80 = 0;
    self->_fallbackEnabled = 0;
    int v18 = 1;
    goto LABEL_119;
  }
  v72 = v70;
LABEL_164:

LABEL_165:
  int v142 = v21;
  uint64_t v143 = *((int *)v71 + 726);
  int v144 = 3;
  if (!*((unsigned char *)&self->super.super.isa + v143))
  {
    if (objc_msgSend(objc_getProperty(self, v74, 368, 1), "hasNonDefaultRules")) {
      int v144 = 3;
    }
    else {
      int v144 = 1;
    }
  }
  int v145 = v18;
  v146 = ne_log_obj();
  if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v147 = ne_session_status_to_string();
    int v148 = *((unsigned __int8 *)&self->super.super.isa + v143);
    unsigned int v150 = [objc_getProperty(self, v149, 368, 1) hasNonDefaultRules];
    *(_DWORD *)buf = 138413058;
    *(void *)v185 = self;
    *(_WORD *)&v185[8] = 2080;
    uint64_t v186 = v147;
    __int16 v187 = 1024;
    int v188 = v148;
    __int16 v189 = 1024;
    unsigned int v190 = v150;
    _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "Will update session %@ status to %s (fallback %u non-default %u)", buf, 0x22u);
  }

  v151 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009101C;
  block[3] = &unk_1000C6DD8;
  block[4] = self;
  int v177 = v144;
  dispatch_async(v151, block);

  if ((v142 | v145) == 1)
  {
    v152 = ne_log_obj();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v185 = v145;
      *(_WORD *)&v185[4] = 1024;
      *(_DWORD *)&v185[6] = v142;
      _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "Updating on KVO change, policies=%d, agent=%d", buf, 0xEu);
    }

    sub_10008E3E8(self, v145, v142);
  }
}

- (void)handleChangeEventForFallbackInterfaces:(id)a3
{
  id v4 = a3;
  v5 = [(NESMSession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000911A0;
  v7[3] = &unk_1000C6C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)dealloc
{
  [(NESMPathControllerSession *)self uninstall];
  v3.receiver = self;
  v3.super_class = (Class)NESMPathControllerSession;
  [(NESMSession *)&v3 dealloc];
}

- (void)uninstall
{
  sub_100091518(self, a2);
  if (self && self->_watchingFallbackNotifications) {
    sub_100091604((uint64_t)self, v3);
  }
  id v4 = [(NESMSession *)self policySession];
  sub_10002E7D4((uint64_t)v4);

  [(NESMSession *)self setStatus:1];
}

- (void)install
{
  if (self)
  {
    if (self->_needsRoamingMonitor)
    {
      if (!objc_getProperty(self, a2, 392, 1))
      {
        id v3 = objc_alloc_init((Class)NWNetworkDescription);
        [v3 setRoamingPreference:1];
        id v4 = objc_alloc_init((Class)NWParameters);
        [v4 setRequiredInterfaceType:2];
        v5 = +[NWMonitor monitorWithNetworkDescription:v3 endpoint:0 parameters:v4];
        objc_setProperty_atomic(self, v6, v5, 392);

        if (objc_getProperty(self, v7, 392, 1))
        {
          id v9 = objc_getProperty(self, v8, 416, 1);
          if (v9)
          {
          }
          else if (sub_1000922B8(self, (const char *)1))
          {
            id v12 = ne_log_obj();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(handler) = 0;
              _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Begin roaming monitor transaction", (uint8_t *)&handler, 2u);
            }

            id v13 = objc_alloc((Class)NSString);
            id v14 = [(NESMSession *)self configuration];
            unsigned int v15 = [v14 identifier];
            id v16 = [v13 initWithFormat:@"com.apple.nesessionmanager.RoamingMonitor.%@", v15];

            [v16 UTF8String];
            v17 = (void *)os_transaction_create();
            objc_setProperty_atomic(self, v18, v17, 416);
          }
          [objc_getProperty(self, v10, 392, 1) addObserver:self forKeyPath:@"status" options:5 context:0];
        }
        else
        {
          v11 = ne_log_obj();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            LOWORD(handler) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Roaming monitor creation failed", (uint8_t *)&handler, 2u);
          }
        }
      }
    }
    else
    {
      sub_100091518(self, a2);
    }
    if (self->_needsFallbackNotifications)
    {
      if (!self->_watchingFallbackNotifications)
      {
        uint64_t v19 = +[NSMutableArray array];
        objc_setProperty_atomic(self, v20, v19, 456);

        int v21 = +[NSMutableArray array];
        objc_setProperty_atomic(self, v22, v21, 464);

        v23 = +[NSMutableSet set];
        objc_setProperty_atomic(self, v24, v23, 472);

        v25 = +[NSMutableDictionary dictionary];
        objc_setProperty_atomic(self, v26, v25, 480);

        self->_fallbackInUseToken = -1;
        v27 = [(NESMSession *)self queue];
        id v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v27);

        dispatch_time_t v29 = dispatch_time(0, -1);
        dispatch_source_set_timer(v28, v29, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
        *(void *)&long long handler = _NSConcreteStackBlock;
        *((void *)&handler + 1) = 3221225472;
        v46 = sub_1000922B0;
        id v47 = &unk_1000C6C60;
        id v48 = self;
        dispatch_source_set_event_handler(v28, &handler);
        dispatch_resume(v28);
        objc_setProperty_atomic(self, v30, v28, 488);

        id v31 = objc_alloc_init(off_1000D7920());
        objc_setProperty_atomic(self, v32, v31, 504);

        if (objc_getProperty(self, v33, 504, 1))
        {
          id v35 = objc_getProperty(self, v34, 504, 1);
          v36 = [(NESMSession *)self queue];
          [v35 setQueue:v36];

          [objc_getProperty(self, v37, 504, 1) setDelegate:self];
          [objc_getProperty(self, v38, 504, 1) trackNOIAnyForInterfaceType:1 options:0];
        }
        else
        {
          v39 = ne_log_obj();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            LOWORD(handler) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "NWNetworkOfInterestManager alloc failed", (uint8_t *)&handler, 2u);
          }
        }
        v40 = [(NESMSession *)self server];
        [v40 addObserver:self forKeyPath:@"primaryCellularInterface" options:5 context:0];

        unsigned __int8 v41 = [(NESMSession *)self server];
        [v41 addObserver:self forKeyPath:@"primaryPhysicalInterface" options:5 context:0];

        self->_watchingFallbackNotifications = 1;
      }
    }
    else if (self->_watchingFallbackNotifications)
    {
      sub_100091604((uint64_t)self, a2);
    }
  }
  sub_100091DE4(self, a2);
  v42 = ne_log_obj();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(handler) = 138412290;
    *(void *)((char *)&handler + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@: Updating policies and agent on install", (uint8_t *)&handler, 0xCu);
  }

  sub_10008E3E8(self, 1, 1);
  if (self) {
    id Property = objc_getProperty(self, v43, 368, 1);
  }
  else {
    id Property = 0;
  }
  if (([Property hasNonDefaultRules] & 1) != 0
    || ne_session_fallback_advisory())
  {
    [(NESMSession *)self setStatus:3];
  }
  [(NESMSession *)self sendConfigurationChangeHandledNotification];
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4 = a3;
  v5 = ne_log_large_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "didStopTrackingAllNOIs %@", (uint8_t *)&v10, 0xCu);
  }

  if (self)
  {
    if (objc_msgSend(v4, "containsObject:", objc_getProperty(self, v6, 512, 1)))
    {
      [objc_getProperty(self, v7, 512, 1) removeObserver:self forKeyPath:@"considerAlternateUpdate"];
      objc_setProperty_atomic(self, v8, 0, 512);
    }
    if (objc_getProperty(self, v7, 504, 1)) {
      [objc_getProperty(self, v9, 504, 1) trackNOIAnyForInterfaceType:1 options:0];
    }
  }
  else if ([v4 containsObject:0])
  {
    [0 removeObserver:0 forKeyPath:@"considerAlternateUpdate"];
  }
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "didStopTrackingNOI %@", (uint8_t *)&v9, 0xCu);
  }

  if (self)
  {
    if (objc_getProperty(self, v6, 512, 1) == v4)
    {
      [objc_getProperty(self, v7, 512, 1) removeObserver:self forKeyPath:@"considerAlternateUpdate"];
      objc_setProperty_atomic(self, v8, 0, 512);
    }
  }
  else if (!v4)
  {
    [0 removeObserver:0 forKeyPath:@"considerAlternateUpdate"];
  }
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "didStartTrackingNOI %@", (uint8_t *)&v10, 0xCu);
  }

  if (self)
  {
    id v7 = objc_getProperty(self, v6, 512, 1);
    int v9 = v7;
    if (v7) {
      [v7 removeObserver:self forKeyPath:@"considerAlternateUpdate"];
    }
    objc_setProperty_atomic(self, v8, v4, 512);
  }
  [v4 addObserver:self forKeyPath:@"considerAlternateUpdate" options:5 context:0];
}

- (void)handleInstalledAppsChanged
{
  id v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000928D0;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  id v4 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092B04;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 <= 5)
  {
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    if (((1 << a3) & 0x2A) != 0)
    {
      id v7 = [(NESMSession *)self queue];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100092C10;
      v8[3] = &unk_1000C6DD8;
      v8[4] = self;
      int v9 = a3;
      dispatch_async(v7, v8);
    }
  }
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v13.receiver = self,
        v13.super_class = (Class)NESMPathControllerSession,
        [(NESMSession *)&v13 handleUpdateConfiguration:v4]))
  {
    v5 = [v4 pathController];
    id v7 = v5;
    if (self)
    {
      objc_setProperty_atomic(self, v6, v5, 368);

      self->_needsRoamingMonitor = sub_1000922B8(self, 0);
      self->_needsFallbackNotifications = sub_100092E28(self, v8);
      sub_100092F24(self, v9);
    }
    else
    {
    }
    uint64_t v10 = [(NESMSession *)self server];
    [v10 requestInstallForSession:self withParentSession:0 exclusive:0];

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3 == 36)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Resetting policies", buf, 0xCu);
    }

    [(NESMSession *)self setRestartPending:0];
    sub_10008E3E8(self, 1, 0);
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Uninstalling", buf, 0xCu);
    }

    v8.receiver = self;
    v8.super_class = (Class)NESMPathControllerSession;
    [(NESMSession *)&v8 handleStopMessageWithReason:v3];
    id v7 = [(NESMSession *)self server];
    [v7 requestUninstallForSession:self];
  }
}

- (void)handleStartMessage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NESMPathControllerSession;
  [(NESMSession *)&v5 handleStartMessage:a3];
  id v4 = [(NESMSession *)self server];
  [v4 requestInstallForSession:self withParentSession:0 exclusive:0];
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  return !a3 || (a3 & 0xFFFFFFFD) == 1;
}

- (int)type
{
  return 5;
}

- (NESMPathControllerSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NESMPathControllerSession;
  id v7 = [(NESMSession *)&v17 initWithConfiguration:v6 andServer:a4];
  objc_super v8 = v7;
  if (v7)
  {
    v7->_level = 0;
    uint64_t v9 = [v6 pathController];
    controllerConfiguration = v8->_controllerConfiguration;
    v8->_controllerConfiguration = (NEPathController *)v9;

    v8->_needsRoamingMonitor = sub_1000922B8(v8, 0);
    v8->_needsFallbackNotifications = sub_100092E28(v8, v11);
    sub_100092F24(v8, v12);
    objc_super v13 = [NESMPolicySession alloc];
    id v14 = [v6 identifier];
    id v15 = [v6 grade];
    if (v13) {
      objc_super v13 = (NESMPolicySession *)sub_100031564((id *)&v13->super.isa, v14, 5, v15, (void *)1, (void *)1);
    }
    [(NESMSession *)v8 setPolicySession:v13];

    sub_10007FEB0(v8);
  }

  return v8;
}

@end