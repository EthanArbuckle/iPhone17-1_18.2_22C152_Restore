@interface RMIReportCommand
- (BOOL)_switchToRMDUserIfNeeded;
- (BOOL)runWithOptions:(id)a3;
- (id)_getDeclarationStatusWithContext:(id)a3 scope:(int64_t)a4;
- (id)_getReportWithContext:(id)a3;
- (id)_reportInScope:(int64_t)a3;
- (id)name;
- (id)options;
- (id)shortEnglishDescription;
- (id)usageLine;
@end

@implementation RMIReportCommand

- (id)name
{
  return @"report";
}

- (id)options
{
  v2 = objc_opt_new();
  [v2 setLongName:@"scope"];
  [v2 setShortName:@"s"];
  [v2 setShortEnglishDescription:@"Scope to use (default: system)."];
  [v2 setParameterCount:1];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)usageLine
{
  return @"[--scope (system|user)]";
}

- (id)shortEnglishDescription
{
  return @"Reports the Remote Management state on this device.";
}

- (BOOL)runWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 dictionaryWithOptionsAndValues];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"scope"];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"system";
  }
  v9 = v8;

  if ([(__CFString *)v9 isEqualToString:@"system"])
  {
    [(RMIReportCommand *)self _switchToRMDUserIfNeeded];
    uint64_t v10 = 1;
  }
  else
  {
    if (![(__CFString *)v9 isEqualToString:@"user"])
    {
      sub_100011860(@"You must specify a valid scope.", v11, v12, v13, v14, v15, v16, v17, v30);
      sub_100011A20(self);
    }
    v18 = +[RMManagedDevice currentManagedDevice];
    unsigned __int8 v19 = [v18 isSharediPad];

    if ((v19 & 1) == 0)
    {
      sub_100011A74(@"Device is not in Shared iPad mode", v20, v21, v22, v23, v24, v25, v26, v30);
      goto LABEL_11;
    }
    uint64_t v10 = 0;
  }
  v27 = [(RMIReportCommand *)self _reportInScope:v10];
  v28 = +[RMJSONSerialization serializeValue:v27];
  sub_100004980(0, @"Remote Management Report", v28, 0);

LABEL_11:
  return 1;
}

- (BOOL)_switchToRMDUserIfNeeded
{
  return 1;
}

- (id)_reportInScope:(int64_t)a3
{
  +[RMBundle setManagementScope:](RMBundle, "setManagementScope:");
  id v4 = sub_100004D04(1);
  v5 = v4;
  if (v4)
  {
    v89 = v4;
    v88 = self;
    id v90 = [v4 newBackgroundContext];
    -[RMIReportCommand _getReportWithContext:](self, "_getReportWithContext:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v92 = objc_alloc_init((Class)NSMutableDictionary);
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    id obj = v6;
    id v95 = [obj countByEnumeratingWithState:&v181 objects:v209 count:16];
    if (v95)
    {
      uint64_t v94 = *(void *)v182;
      CFStringRef v7 = @"inactiveReasons";
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v182 != v94)
          {
            uint64_t v9 = v8;
            objc_enumerationMutation(obj);
            uint64_t v8 = v9;
          }
          uint64_t v10 = *(void **)(*((void *)&v181 + 1) + 8 * v8);
          uint64_t v11 = v8;
          if ([v10 isEqual:@"Management Sources"])
          {
            uint64_t v93 = v11;
            v101 = +[NSMutableArray array];
            uint64_t v12 = [obj objectForKeyedSubscript:v10];
            long long v177 = 0u;
            long long v178 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            id v97 = v12;
            id v103 = [v12 countByEnumeratingWithState:&v177 objects:v208 count:16];
            if (v103)
            {
              uint64_t v99 = *(void *)v178;
              id v141 = v10;
              do
              {
                uint64_t v13 = 0;
                do
                {
                  if (*(void *)v178 != v99) {
                    objc_enumerationMutation(v97);
                  }
                  uint64_t v105 = v13;
                  uint64_t v14 = *(void **)(*((void *)&v177 + 1) + 8 * v13);
                  id v109 = objc_alloc_init((Class)NSMutableDictionary);
                  long long v173 = 0u;
                  long long v174 = 0u;
                  long long v175 = 0u;
                  long long v176 = 0u;
                  id v113 = v14;
                  id v111 = [v113 countByEnumeratingWithState:&v173 objects:v207 count:16];
                  if (v111)
                  {
                    uint64_t v107 = *(void *)v174;
                    do
                    {
                      uint64_t v15 = 0;
                      do
                      {
                        if (*(void *)v174 != v107)
                        {
                          uint64_t v16 = v15;
                          objc_enumerationMutation(v113);
                          uint64_t v15 = v16;
                        }
                        uint64_t v115 = v15;
                        uint64_t v17 = *(void **)(*((void *)&v173 + 1) + 8 * v15);
                        if ([v17 isEqual:@"activations"])
                        {
                          v121 = +[NSMutableArray array];
                          v18 = [v113 objectForKeyedSubscript:v17];
                          long long v169 = 0u;
                          long long v170 = 0u;
                          long long v171 = 0u;
                          long long v172 = 0u;
                          id v117 = v18;
                          id v123 = [v18 countByEnumeratingWithState:&v169 objects:v206 count:16];
                          if (v123)
                          {
                            uint64_t v119 = *(void *)v170;
                            v139 = v17;
                            do
                            {
                              uint64_t v19 = 0;
                              do
                              {
                                if (*(void *)v170 != v119) {
                                  objc_enumerationMutation(v117);
                                }
                                uint64_t v125 = v19;
                                uint64_t v20 = *(void **)(*((void *)&v169 + 1) + 8 * v19);
                                id v133 = objc_alloc_init((Class)NSMutableDictionary);
                                long long v165 = 0u;
                                long long v166 = 0u;
                                long long v167 = 0u;
                                long long v168 = 0u;
                                id v21 = v20;
                                id v135 = [v21 countByEnumeratingWithState:&v165 objects:v205 count:16];
                                if (v135)
                                {
                                  id v129 = v21;
                                  uint64_t v131 = *(void *)v166;
                                  do
                                  {
                                    uint64_t v22 = 0;
                                    do
                                    {
                                      if (*(void *)v166 != v131)
                                      {
                                        uint64_t v23 = v22;
                                        objc_enumerationMutation(v21);
                                        uint64_t v22 = v23;
                                      }
                                      uint64_t v137 = v22;
                                      uint64_t v24 = *(void **)(*((void *)&v165 + 1) + 8 * v22);
                                      if ([v24 isEqual:@"predicateDescription"])
                                      {
                                        [v133 setObject:@"YES" forKeyedSubscript:v24];
                                      }
                                      else
                                      {
                                        if ([v24 isEqual:@"state"])
                                        {
                                          v127 = v24;
                                          uint64_t v25 = [v21 objectForKeyedSubscript:v24];
                                          id v151 = objc_alloc_init((Class)NSMutableDictionary);
                                          long long v161 = 0u;
                                          long long v162 = 0u;
                                          long long v163 = 0u;
                                          long long v164 = 0u;
                                          id v26 = v25;
                                          id v27 = [v26 countByEnumeratingWithState:&v161 objects:v204 count:16];
                                          if (v27)
                                          {
                                            id v28 = v27;
                                            uint64_t v29 = *(void *)v162;
                                            uint64_t v143 = *(void *)v162;
                                            id v145 = v26;
                                            do
                                            {
                                              uint64_t v30 = 0;
                                              id v147 = v28;
                                              do
                                              {
                                                if (*(void *)v162 != v29)
                                                {
                                                  CFStringRef v31 = v7;
                                                  v32 = v17;
                                                  v33 = v10;
                                                  uint64_t v34 = v30;
                                                  objc_enumerationMutation(v26);
                                                  uint64_t v30 = v34;
                                                  uint64_t v10 = v33;
                                                  uint64_t v17 = v32;
                                                  CFStringRef v7 = v31;
                                                }
                                                uint64_t v153 = v30;
                                                v35 = *(void **)(*((void *)&v161 + 1) + 8 * v30);
                                                if ([v35 isEqual:v7])
                                                {
                                                  v149 = v35;
                                                  v36 = [v26 objectForKeyedSubscript:v35];
                                                  v37 = +[NSMutableArray array];
                                                  long long v199 = 0u;
                                                  long long v200 = 0u;
                                                  long long v201 = 0u;
                                                  long long v202 = 0u;
                                                  id v38 = v36;
                                                  id v159 = [v38 countByEnumeratingWithState:&v199 objects:v203 count:16];
                                                  if (v159)
                                                  {
                                                    id v155 = v38;
                                                    uint64_t v157 = *(void *)v200;
                                                    do
                                                    {
                                                      for (i = 0; i != v159; i = (char *)i + 1)
                                                      {
                                                        if (*(void *)v200 != v157) {
                                                          objc_enumerationMutation(v155);
                                                        }
                                                        v40 = *(void **)(*((void *)&v199 + 1) + 8 * i);
                                                        long long v195 = 0u;
                                                        long long v196 = 0u;
                                                        long long v197 = 0u;
                                                        long long v198 = 0u;
                                                        id v41 = v40;
                                                        id v42 = [v41 countByEnumeratingWithState:&v195 objects:&v191 count:16];
                                                        if (v42)
                                                        {
                                                          id v43 = v42;
                                                          uint64_t v44 = *(void *)v196;
                                                          do
                                                          {
                                                            for (j = 0; j != v43; j = (char *)j + 1)
                                                            {
                                                              if (*(void *)v196 != v44) {
                                                                objc_enumerationMutation(v41);
                                                              }
                                                              if ([*(id *)(*((void *)&v195 + 1)+ 8 * (void)j) isEqual:@"code"])
                                                              {
                                                                CFStringRef v189 = @"code";
                                                                v46 = [v41 objectForKeyedSubscript:@"code"];
                                                                v190 = v46;
                                                                v47 = +[NSDictionary dictionaryWithObjects:&v190 forKeys:&v189 count:1];
                                                                [v37 addObject:v47];
                                                              }
                                                            }
                                                            id v43 = [v41 countByEnumeratingWithState:&v195 objects:&v191 count:16];
                                                          }
                                                          while (v43);
                                                        }
                                                      }
                                                      id v38 = v155;
                                                      id v159 = [v155 countByEnumeratingWithState:&v199 objects:v203 count:16];
                                                    }
                                                    while (v159);
                                                  }

                                                  [v151 setObject:v37 forKey:v149];
                                                  CFStringRef v7 = @"inactiveReasons";
                                                  uint64_t v17 = v139;
                                                  uint64_t v10 = v141;
                                                  uint64_t v29 = v143;
                                                  id v26 = v145;
                                                  id v28 = v147;
                                                }
                                                else
                                                {
                                                  id v38 = [v26 objectForKey:v35];
                                                  [v151 setObject:v38 forKey:v35];
                                                }

                                                uint64_t v30 = v153 + 1;
                                              }
                                              while ((id)(v153 + 1) != v28);
                                              id v28 = [v26 countByEnumeratingWithState:&v161 objects:v204 count:16];
                                            }
                                            while (v28);
                                          }

                                          [v133 setObject:v151 forKey:v127];
                                        }
                                        else
                                        {
                                          v48 = [v21 objectForKey:v24];
                                          [v133 setObject:v48 forKey:v24];
                                        }
                                        id v21 = v129;
                                      }
                                      uint64_t v22 = v137 + 1;
                                    }
                                    while ((id)(v137 + 1) != v135);
                                    id v135 = [v21 countByEnumeratingWithState:&v165 objects:v205 count:16];
                                  }
                                  while (v135);
                                }

                                [v121 addObject:v133];
                                uint64_t v19 = v125 + 1;
                              }
                              while ((id)(v125 + 1) != v123);
                              id v123 = [v117 countByEnumeratingWithState:&v169 objects:v206 count:16];
                            }
                            while (v123);
                          }
                          v49 = v121;
                          [v109 setObject:v121 forKeyedSubscript:v17];
                        }
                        else
                        {
                          v49 = [v113 objectForKey:v17];
                          [v109 setObject:v49 forKeyedSubscript:v17];
                        }

                        uint64_t v15 = v115 + 1;
                      }
                      while ((id)(v115 + 1) != v111);
                      id v111 = [v113 countByEnumeratingWithState:&v173 objects:v207 count:16];
                    }
                    while (v111);
                  }

                  [v101 addObject:v109];
                  uint64_t v13 = v105 + 1;
                }
                while ((id)(v105 + 1) != v103);
                id v103 = [v97 countByEnumeratingWithState:&v177 objects:v208 count:16];
              }
              while (v103);
            }
            [v92 setObject:v101 forKeyedSubscript:v10];

            uint64_t v11 = v93;
          }
          uint64_t v8 = v11 + 1;
        }
        while ((id)(v11 + 1) != v95);
        id v95 = [obj countByEnumeratingWithState:&v181 objects:v209 count:16];
      }
      while (v95);
    }

    id v50 = [(RMIReportCommand *)v88 _getDeclarationStatusWithContext:v90 scope:a3];
    v104 = +[NSMutableArray array];
    long long v191 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    id v98 = v50;
    id v102 = [v98 countByEnumeratingWithState:&v191 objects:v209 count:16];
    if (v102)
    {
      uint64_t v100 = *(void *)v192;
      do
      {
        uint64_t v51 = 0;
        do
        {
          if (*(void *)v192 != v100) {
            objc_enumerationMutation(v98);
          }
          uint64_t v106 = v51;
          v52 = *(void **)(*((void *)&v191 + 1) + 8 * v51);
          id v110 = objc_alloc_init((Class)NSMutableDictionary);
          long long v181 = 0u;
          long long v182 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          id v114 = v52;
          id v112 = [v114 countByEnumeratingWithState:&v181 objects:v208 count:16];
          if (v112)
          {
            uint64_t v108 = *(void *)v182;
            do
            {
              uint64_t v53 = 0;
              do
              {
                if (*(void *)v182 != v108) {
                  objc_enumerationMutation(v114);
                }
                uint64_t v116 = v53;
                v54 = *(void **)(*((void *)&v181 + 1) + 8 * v53);
                unsigned __int8 v55 = [v54 isEqual:@"Status"];
                v56 = [v114 objectForKeyedSubscript:v54];
                id v57 = v56;
                if (v55)
                {
                  v58 = [v56 objectForKeyedSubscript:@"management"];

                  id v124 = objc_alloc_init((Class)NSMutableDictionary);
                  long long v177 = 0u;
                  long long v178 = 0u;
                  long long v179 = 0u;
                  long long v180 = 0u;
                  id v57 = v58;
                  id v59 = [v57 countByEnumeratingWithState:&v177 objects:v207 count:16];
                  if (v59)
                  {
                    id v60 = v59;
                    id v61 = *(id *)v178;
                    id v120 = v57;
                    v122 = v54;
                    id v118 = *(id *)v178;
                    do
                    {
                      v62 = 0;
                      id v126 = v60;
                      do
                      {
                        if (*(id *)v178 != v61) {
                          objc_enumerationMutation(v57);
                        }
                        v63 = *(void **)(*((void *)&v177 + 1) + 8 * (void)v62);
                        if ([v63 isEqual:@"declarations"])
                        {
                          v128 = v62;
                          v64 = [v57 objectForKeyedSubscript:v63];
                          id v132 = objc_alloc_init((Class)NSMutableDictionary);
                          long long v173 = 0u;
                          long long v174 = 0u;
                          long long v175 = 0u;
                          long long v176 = 0u;
                          id v136 = v64;
                          id v134 = [v136 countByEnumeratingWithState:&v173 objects:v206 count:16];
                          if (v134)
                          {
                            uint64_t v130 = *(void *)v174;
                            v152 = v63;
                            do
                            {
                              uint64_t v65 = 0;
                              do
                              {
                                if (*(void *)v174 != v130) {
                                  objc_enumerationMutation(v136);
                                }
                                uint64_t v138 = *(void *)(*((void *)&v173 + 1) + 8 * v65);
                                uint64_t v140 = v65;
                                v66 = objc_msgSend(v136, "objectForKeyedSubscript:");
                                v146 = +[NSMutableArray array];
                                long long v169 = 0u;
                                long long v170 = 0u;
                                long long v171 = 0u;
                                long long v172 = 0u;
                                id v142 = v66;
                                id v148 = [v142 countByEnumeratingWithState:&v169 objects:v205 count:16];
                                if (v148)
                                {
                                  uint64_t v144 = *(void *)v170;
                                  do
                                  {
                                    uint64_t v67 = 0;
                                    do
                                    {
                                      if (*(void *)v170 != v144) {
                                        objc_enumerationMutation(v142);
                                      }
                                      uint64_t v150 = v67;
                                      v68 = *(void **)(*((void *)&v169 + 1) + 8 * v67);
                                      v69 = +[NSMutableArray array];
                                      id v70 = objc_alloc_init((Class)NSMutableDictionary);
                                      long long v165 = 0u;
                                      long long v166 = 0u;
                                      long long v167 = 0u;
                                      long long v168 = 0u;
                                      id v71 = v68;
                                      id v160 = [v71 countByEnumeratingWithState:&v165 objects:v204 count:16];
                                      if (v160)
                                      {
                                        id v156 = v70;
                                        uint64_t v158 = *(void *)v166;
                                        id v154 = v71;
                                        do
                                        {
                                          for (k = 0; k != v160; k = (char *)k + 1)
                                          {
                                            if (*(void *)v166 != v158) {
                                              objc_enumerationMutation(v71);
                                            }
                                            v73 = *(void **)(*((void *)&v165 + 1) + 8 * (void)k);
                                            if ([v73 isEqual:@"reasons"])
                                            {
                                              v74 = [v71 objectForKeyedSubscript:@"reasons"];
                                              v75 = v74;
                                              if (v74)
                                              {
                                                long long v163 = 0u;
                                                long long v164 = 0u;
                                                long long v161 = 0u;
                                                long long v162 = 0u;
                                                id v76 = [v74 countByEnumeratingWithState:&v161 objects:v203 count:16];
                                                if (v76)
                                                {
                                                  id v77 = v76;
                                                  uint64_t v78 = *(void *)v162;
                                                  do
                                                  {
                                                    for (m = 0; m != v77; m = (char *)m + 1)
                                                    {
                                                      if (*(void *)v162 != v78) {
                                                        objc_enumerationMutation(v75);
                                                      }
                                                      v80 = *(void **)(*((void *)&v161 + 1) + 8 * (void)m);
                                                      *(void *)&long long v195 = @"code";
                                                      v81 = [v80 objectForKeyedSubscript:@"code"];
                                                      *(void *)&long long v199 = v81;
                                                      v82 = +[NSDictionary dictionaryWithObjects:&v199 forKeys:&v195 count:1];
                                                      [v69 addObject:v82];
                                                    }
                                                    id v77 = [v75 countByEnumeratingWithState:&v161 objects:v203 count:16];
                                                  }
                                                  while (v77);
                                                }
                                                id v70 = v156;
                                                [v156 setObject:v69 forKey:@"reasons"];
                                                v63 = v152;
                                                id v71 = v154;
                                              }
                                            }
                                            else
                                            {
                                              v75 = [v71 objectForKey:v73];
                                              [v70 setObject:v75 forKey:v73];
                                            }
                                          }
                                          id v160 = [v71 countByEnumeratingWithState:&v165 objects:v204 count:16];
                                        }
                                        while (v160);
                                      }

                                      [v146 addObject:v70];
                                      uint64_t v67 = v150 + 1;
                                    }
                                    while ((id)(v150 + 1) != v148);
                                    id v148 = [v142 countByEnumeratingWithState:&v169 objects:v205 count:16];
                                  }
                                  while (v148);
                                }

                                [v132 setObject:v146 forKey:v138];
                                uint64_t v65 = v140 + 1;
                              }
                              while ((id)(v140 + 1) != v134);
                              id v134 = [v136 countByEnumeratingWithState:&v173 objects:v206 count:16];
                            }
                            while (v134);
                          }

                          [v124 setObject:v132 forKey:v63];
                          id v57 = v120;
                          v54 = v122;
                          id v61 = v118;
                          id v60 = v126;
                          v62 = v128;
                        }
                        v62 = (char *)v62 + 1;
                      }
                      while (v62 != v60);
                      id v60 = [v57 countByEnumeratingWithState:&v177 objects:v207 count:16];
                    }
                    while (v60);
                  }

                  id v83 = objc_alloc_init((Class)NSMutableDictionary);
                  [v83 setObject:v124 forKey:@"management"];
                  [v110 setObject:v83 forKey:v54];
                }
                else
                {
                  [v110 setValue:v56 forKey:v54];
                }

                uint64_t v53 = v116 + 1;
              }
              while ((id)(v116 + 1) != v112);
              id v112 = [v114 countByEnumeratingWithState:&v181 objects:v208 count:16];
            }
            while (v112);
          }

          [v104 addObject:v110];
          uint64_t v51 = v106 + 1;
        }
        while ((id)(v106 + 1) != v102);
        id v102 = [v98 countByEnumeratingWithState:&v191 objects:v209 count:16];
      }
      while (v102);
    }

    CFStringRef v84 = @"user";
    if (a3 == 1) {
      CFStringRef v84 = @"system";
    }
    v187[0] = @"Scope";
    v187[1] = @"Report";
    v188[0] = v84;
    v188[1] = v92;
    v187[2] = @"Status";
    v188[2] = v104;
    v85 = +[NSDictionary dictionaryWithObjects:v188 forKeys:v187 count:3];

    v5 = v89;
  }
  else
  {
    v185[0] = @"Error";
    v185[1] = @"Scope";
    if (a3 == 1) {
      CFStringRef v86 = @"system";
    }
    else {
      CFStringRef v86 = @"user";
    }
    v186[0] = @"Missing or invalid container";
    v186[1] = v86;
    v85 = +[NSDictionary dictionaryWithObjects:v186 forKeys:v185 count:2];
  }

  return v85;
}

- (id)_getReportWithContext:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1000073E8;
  uint64_t v13 = sub_1000073F8;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007400;
  v6[3] = &unk_10001C5B8;
  uint64_t v8 = &v9;
  id v3 = a3;
  id v7 = v3;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)_getDeclarationStatusWithContext:(id)a3 scope:(int64_t)a4
{
  uint64_t v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472;
  uint64_t v32 = (uint64_t)sub_100007818;
  v33 = (uint64_t (*)(uint64_t, uint64_t))&unk_10001C5E0;
  id v14 = a3;
  uint64_t v15 = (void (*)(uint64_t))(id)objc_opt_new();
  uint64_t v34 = v15;
  [v14 performBlockAndWait:&v30];

  if ([v15 count])
  {
    id v18 = +[RMXPCProxy newConnectionWithScope:a4];
    [v18 resume];
    id v19 = (id)objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v15;
    id v5 = [obj countByEnumeratingWithState:&v20 objects:v36 count:16];
    if (v5)
    {
      uint64_t v17 = *(void *)v21;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v8 = v18;
          id v9 = v7;
          uint64_t v30 = 0;
          uint64_t v31 = (uint64_t)&v30;
          uint64_t v32 = 0x3032000000;
          v33 = sub_1000073E8;
          uint64_t v34 = sub_1000073F8;
          id v35 = (id)objc_opt_new();
          [*(id *)(v31 + 40) setObject:v9 forKeyedSubscript:@"Channel"];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100007974;
          v27[3] = &unk_10001C608;
          id v28 = &off_10001E930;
          uint64_t v29 = &v30;
          uint64_t v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v27];
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_100007B48;
          v24[3] = &unk_10001C630;
          uint64_t v25 = &off_10001E930;
          id v26 = &v30;
          [v10 queryForStatusAndErrorsWithKeyPaths:&off_10001E930 fromManagementSourceWithIdentifier:v9 completionHandler:v24];
          uint64_t v11 = v25;
          id v12 = *(id *)(v31 + 40);

          _Block_object_dispose(&v30, 8);
          [v19 addObject:v12];
        }
        id v5 = [obj countByEnumeratingWithState:&v20 objects:v36 count:16];
      }
      while (v5);
    }
  }
  else
  {
    id v19 = &__NSArray0__struct;
  }

  return v19;
}

@end