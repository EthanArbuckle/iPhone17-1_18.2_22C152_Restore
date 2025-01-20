id __SpecifiersFromPlist(void *a1, void *a2, void *a3, void *a4, void *a5, id *a6, void **a7, void *a8, void **a9, char a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char isKindOfClass;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  int HasCapabilities;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  char v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  BOOL v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t m;
  uint64_t v108;
  void *v109;
  NSString *v110;
  NSString *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSString *v118;
  NSString *v119;
  NSString *v120;
  NSString *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  NSString *v128;
  uint64_t v129;
  NSString *v130;
  NSString *v131;
  SEL v132;
  SEL v133;
  NSString *v134;
  char v135;
  NSString *v136;
  NSString *v137;
  Class v138;
  void *v139;
  SEL v140;
  SEL v141;
  id v142;
  id v143;
  id v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t n;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  char v163;
  void *v164;
  char v165;
  void *v166;
  char v167;
  void *v168;
  char v169;
  void *v170;
  char v171;
  void *v172;
  int v173;
  void *v174;
  void *v175;
  void *v176;
  NSString *v177;
  SEL v178;
  NSString *v179;
  NSString *v180;
  SEL v181;
  void *v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  __CFString *v187;
  void *v188;
  void *v189;
  NSString *v190;
  NSString *v191;
  SEL v192;
  NSString *v193;
  NSString *v194;
  SEL v195;
  NSString *v196;
  NSString *v197;
  SEL v198;
  NSString *v199;
  NSString *v200;
  SEL v201;
  uint64_t v202;
  id v203;
  void *v205;
  void *v206;
  __CFString *v207;
  id v208;
  id v209;
  id v210;
  id obj;
  void *v212;
  id v213;
  unint64_t v214;
  id v215;
  id v216;
  NSString *v217;
  NSString *v218;
  NSString *v219;
  void *v220;
  void *v221;
  void *v222;
  uint64_t v223;
  id v224;
  void *v225;
  uint64_t v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  uint64_t v236;
  NSString *v237;
  NSString *aSelectorName;
  id v239;
  void *v240;
  uint64_t v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  long long v249;
  long long v250;
  long long v251;
  long long v252;
  long long v253;
  long long v254;
  long long v255;
  long long v256;
  long long v257;
  long long v258;
  long long v259;
  long long v260;
  long long v261;
  long long v262;
  long long v263;
  long long v264;
  long long v265;
  long long v266;
  long long v267;
  long long v268;
  unsigned char v269[128];
  unsigned char v270[128];
  unsigned char v271[128];
  unsigned char v272[128];
  unsigned char v273[128];
  uint64_t v274;

  v274 = *MEMORY[0x1E4F143B8];
  v17 = a1;
  v209 = a2;
  v213 = a3;
  v210 = a4;
  v18 = a5;
  v208 = a8;
  v206 = [v17 objectForKey:@"title"];
  if (a6)
  {
    if (v18)
    {
      v19 = [v18 localizedStringForKey:v206 value:&stru_1EFB51FD0 table:v210];
      objc_storeStrong(a6, v19);
    }
    else
    {
      v20 = v206;
      v19 = *a6;
      *a6 = v20;
    }
  }
  if (a7)
  {
    v21 = [v17 objectForKey:@"id"];
    v22 = *a7;
    *a7 = (void *)v21;
  }
  v225 = [v17 objectForKey:@"specifierAttributes"];
  v205 = v17;
  v23 = [v17 objectForKey:@"items"];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  v224 = (id)objc_claimAutoreleasedReturnValue();
  v261 = 0u;
  v262 = 0u;
  v263 = 0u;
  v264 = 0u;
  obj = v23;
  v226 = [obj countByEnumeratingWithState:&v261 objects:v272 count:16];
  if (v226)
  {
    v223 = *(void *)v262;
    v248 = v18;
    do
    {
      v24 = 0;
      do
      {
        if (*(void *)v262 != v223) {
          objc_enumerationMutation(obj);
        }
        v241 = v24;
        v25 = *(id *)(*((void *)&v261 + 1) + 8 * v24);
        v26 = (void *)[v25 mutableCopy];

        v259 = 0u;
        v260 = 0u;
        v257 = 0u;
        v258 = 0u;
        v27 = v225;
        v28 = [v27 countByEnumeratingWithState:&v257 objects:v271 count:16];
        if (v28)
        {
          v29 = v28;
          v30 = *(void *)v258;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(void *)v258 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void *)(*((void *)&v257 + 1) + 8 * i);
              v33 = [v26 objectForKeyedSubscript:v32];

              if (v33)
              {
                v34 = [v26 objectForKeyedSubscript:v32];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v35 = [v27 objectForKeyedSubscript:v32];
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();

                  if (isKindOfClass)
                  {
                    v37 = [v27 objectForKeyedSubscript:v32];
                    v38 = [v26 objectForKeyedSubscript:v32];
                    v39 = (void *)[v38 mutableCopy];

                    [v39 addObjectsFromArray:v37];
LABEL_27:
                    [v26 setObject:v39 forKeyedSubscript:v32];

                    goto LABEL_28;
                  }
                }
                else
                {
                }
                v37 = [v26 objectForKeyedSubscript:v32];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v40 = [v27 objectForKeyedSubscript:v32];
                  objc_opt_class();
                  v41 = objc_opt_isKindOfClass();

                  if ((v41 & 1) == 0) {
                    continue;
                  }
                  v37 = [v27 objectForKeyedSubscript:v32];
                  v42 = [v26 objectForKeyedSubscript:v32];
                  v39 = (void *)[v42 mutableCopy];

                  [v39 addEntriesFromDictionary:v37];
                  goto LABEL_27;
                }
              }
              else
              {
                v37 = [v27 objectForKeyedSubscript:v32];
                [v26 setObject:v37 forKeyedSubscript:v32];
              }
LABEL_28:
            }
            v29 = [v27 countByEnumeratingWithState:&v257 objects:v271 count:16];
          }
          while (v29);
        }

        v43 = objc_opt_class();
        v44 = v26;
        v45 = [v44 objectForKey:@"requiredCapabilities"];
        v46 = v45;
        if (v45) {
          HasCapabilities = SystemHasCapabilities(v45);
        }
        else {
          HasCapabilities = 1;
        }
        v48 = [v44 objectForKey:@"requiredCapabilitiesOr"];
        v49 = v48;
        if (v48)
        {
          v268 = 0u;
          v267 = 0u;
          v266 = 0u;
          v265 = 0u;
          v50 = [v48 countByEnumeratingWithState:&v265 objects:v273 count:16];
          if (v50)
          {
            v51 = v50;
            LOBYTE(v52) = 0;
            v53 = *(void *)v266;
            do
            {
              for (j = 0; j != v51; ++j)
              {
                if (*(void *)v266 != v53) {
                  objc_enumerationMutation(v49);
                }
                if (v52) {
                  v52 = 1;
                }
                else {
                  v52 = SystemHasCapabilities(*(void **)(*((void *)&v265 + 1) + 8 * j));
                }
              }
              v51 = [v49 countByEnumeratingWithState:&v265 objects:v273 count:16];
            }
            while (v51);
          }
          else
          {
            v52 = 0;
          }
          HasCapabilities &= v52;
        }
        v18 = v248;
        if (_CustomCapabilityCheck) {
          HasCapabilities = (*(uint64_t (**)(void))(_CustomCapabilityCheck + 16))();
        }
        v55 = [v44 objectForKey:@"skippedInEduMode"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v55 BOOLValue]) {
          v56 = PSIsInEDUMode();
        }
        else {
          v56 = 0;
        }

        if (((v56 & 1) != 0
           || ((HasCapabilities ^ 1) & 1) != 0
           || ProcessedSpecifierBundle(v44, v208, v209, a9, v224))
          && (a10 & 1) != 0)
        {
          v57 = v241;
          goto LABEL_276;
        }
        v58 = v210;
        v59 = [v44 objectForKeyedSubscript:@"strings"];

        v245 = (void *)v43;
        if (v59)
        {
          v60 = [v44 objectForKeyedSubscript:@"strings"];

          v58 = (id)v60;
        }
        v61 = v248;
        v62 = [v44 objectForKeyedSubscript:@"stringsBundlePath"];

        if (v62)
        {
          v63 = (void *)MEMORY[0x1E4F28B50];
          v64 = [v44 objectForKeyedSubscript:@"stringsBundlePath"];
          v65 = SFRuntimeAbsoluteFilePathForPath();
          v66 = [v63 bundleWithPath:v65];
        }
        else
        {
          v67 = [v44 objectForKeyedSubscript:@"stringsBundleID"];

          v66 = v61;
          if (!v67) {
            goto LABEL_66;
          }
          v68 = (void *)MEMORY[0x1E4F28B50];
          v64 = [v44 objectForKeyedSubscript:@"stringsBundleID"];
          v66 = [v68 bundleWithIdentifier:v64];
          v65 = v61;
        }

LABEL_66:
        v229 = v61;
        v222 = [v44 objectForKey:@"cell"];
        v69 = +[PSTableCell cellTypeFromString:](PSTableCell, "cellTypeFromString:");
        v70 = [v44 objectForKey:@"label"];
        v228 = v70;
        if (v70)
        {
          if (v66)
          {
            v239 = [v66 localizedStringForKey:v70 value:&stru_1EFB51FD0 table:v58];
          }
          else
          {
            v239 = v70;
          }
          v71 = [v44 objectForKey:@"id"];

          if (!v71) {
            [v44 setObject:v228 forKey:@"id"];
          }
        }
        else
        {
          v239 = 0;
        }
        v235 = [v44 objectForKey:@"footerText"];
        if (v235)
        {
          if (v66)
          {
            v72 = [v66 localizedStringForKey:v235 value:&stru_1EFB51FD0 table:v58];
            [v44 setObject:v72 forKey:@"footerText"];
          }
          else
          {
            [v44 setObject:v235 forKey:@"footerText"];
          }
        }
        v234 = [v44 objectForKey:@"headerDetailText"];
        if (v234)
        {
          if (v66)
          {
            v73 = [v66 localizedStringForKey:v234 value:&stru_1EFB51FD0 table:v58];
            [v44 setObject:v73 forKey:@"headerDetailText"];
          }
          else
          {
            [v44 setObject:v234 forKey:@"headerDetailText"];
          }
        }
        v74 = [v44 objectForKey:@"keywords"];
        objc_opt_class();
        v233 = (void *)v74;
        if (objc_opt_isKindOfClass())
        {
          if (v66)
          {
            v75 = [v66 localizedStringForKey:v74 value:&stru_1EFB51FD0 table:v58];
            [v44 setObject:v75 forKey:@"keywords"];
          }
          else
          {
            [v44 setObject:v74 forKey:@"keywords"];
          }
        }
        v76 = [v44 objectForKey:@"contentDescription"];
        objc_opt_class();
        v232 = (void *)v76;
        if (objc_opt_isKindOfClass())
        {
          if (v66)
          {
            v77 = [v66 localizedStringForKey:v76 value:&stru_1EFB51FD0 table:v58];
            [v44 setObject:v77 forKey:@"contentDescription"];
          }
          else
          {
            [v44 setObject:v76 forKey:@"contentDescription"];
          }
        }
        v78 = [v44 objectForKey:@"alignment"];
        if (v78)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v79 = AlignmentFromString(v78);
            [v44 setObject:v79 forKey:@"alignment"];
          }
          v80 = [v44 objectForKey:@"footerAlignment"];
          objc_opt_class();
          v220 = v80;
          if (objc_opt_isKindOfClass())
          {
            v81 = AlignmentFromString(v80);
            [v44 setObject:v81 forKey:@"footerAlignment"];
          }
        }
        else
        {
          v220 = [v44 objectForKey:@"footerAlignment"];
        }
        v221 = v78;
        v214 = v69;
        if (v69 > 8)
        {
          if (v69 != 13)
          {
            if (v69 == 9)
            {
LABEL_101:
              v242 = [v44 objectForKey:@"validValues"];
              v82 = [v44 objectForKey:@"validTitles"];
              v243 = v82;
              if (v82)
              {
                v83 = v82;
                v247 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v82, "count"));
                v253 = 0u;
                v254 = 0u;
                v255 = 0u;
                v256 = 0u;
                v84 = v83;
                v85 = [v84 countByEnumeratingWithState:&v253 objects:v270 count:16];
                if (v85)
                {
                  v86 = v85;
                  v87 = *(void *)v254;
                  do
                  {
                    for (k = 0; k != v86; ++k)
                    {
                      if (*(void *)v254 != v87) {
                        objc_enumerationMutation(v84);
                      }
                      v89 = *(void *)(*((void *)&v253 + 1) + 8 * k);
                      if (v66)
                      {
                        v90 = [v66 localizedStringForKey:v89 value:&stru_1EFB51FD0 table:v58];
                        [v247 addObject:v90];
                      }
                      else
                      {
                        [v247 addObject:v89];
                      }
                    }
                    v86 = [v84 countByEnumeratingWithState:&v253 objects:v270 count:16];
                  }
                  while (v86);
                }
              }
              else
              {
                v247 = 0;
              }
              v100 = [v44 objectForKey:@"shortTitles"];
              v101 = v100;
              if (v100)
              {
                v215 = v44;
                v102 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v100, "count"));
                v249 = 0u;
                v250 = 0u;
                v251 = 0u;
                v252 = 0u;
                v103 = v101;
                v104 = [v103 countByEnumeratingWithState:&v249 objects:v269 count:16];
                if (v104)
                {
                  v105 = v104;
                  v106 = *(void *)v250;
                  do
                  {
                    for (m = 0; m != v105; ++m)
                    {
                      if (*(void *)v250 != v106) {
                        objc_enumerationMutation(v103);
                      }
                      v108 = *(void *)(*((void *)&v249 + 1) + 8 * m);
                      if (v66)
                      {
                        v109 = [v66 localizedStringForKey:v108 value:&stru_1EFB51FD0 table:v58];
                        [v102 addObject:v109];
                      }
                      else
                      {
                        [v102 addObject:v108];
                      }
                    }
                    v105 = [v103 countByEnumeratingWithState:&v249 objects:v269 count:16];
                  }
                  while (v105);
                }
                v240 = v102;

                v44 = v215;
                v69 = v214;
              }
              else
              {
                v240 = 0;
              }
              if (!v242)
              {
                v110 = [v44 objectForKey:@"valuesDataSource"];
                v111 = v110;
                if (v110)
                {
                  NSSelectorFromString(v110);
                  v242 = SFPerformSelector();
                }
                else
                {
                  v242 = 0;
                }
              }
              if (!v247)
              {
                v118 = [v44 objectForKey:@"titlesDataSource"];
                v119 = v118;
                if (v118)
                {
                  NSSelectorFromString(v118);
                  v247 = SFPerformSelector();
                }
                else
                {
                  v247 = 0;
                }
              }
              if (!v240)
              {
                v120 = [v44 objectForKey:@"shortTitlesDataSource"];
                v121 = v120;
                if (v120)
                {
                  NSSelectorFromString(v120);
                  v240 = SFPerformSelector();
                }
                else
                {
                  v240 = 0;
                }
              }
              if (v69 == 2)
              {
                v122 = [v44 objectForKey:@"staticTextMessage"];
                if (v122)
                {
                  if (v66)
                  {
                    v123 = [v66 localizedStringForKey:v122 value:&stru_1EFB51FD0 table:v58];
                    [v44 setObject:v123 forKey:@"staticTextMessage"];
                  }
                  else
                  {
                    [v44 setObject:v122 forKey:@"staticTextMessage"];
                  }
                }
              }
LABEL_174:
              if (v69 == 5)
              {
                v124 = [v44 objectForKey:@"rightImage"];
                v125 = [v44 objectForKey:@"leftImage"];
                if (v124)
                {
                  v126 = +[PSLazyImagePromise imagePromiseWithImageNamed:v124 inBundle:v229];
                  [v44 setObject:v126 forKeyedSubscript:@"rightImagePromise"];
                  [v44 removeObjectForKey:@"rightImage"];
                }
                if (v125)
                {
                  v127 = +[PSLazyImagePromise imagePromiseWithImageNamed:v125 inBundle:v229];
                  [v44 setObject:v127 forKeyedSubscript:@"leftImagePromise"];
                  [v44 removeObjectForKey:@"leftImage"];
                }
              }
LABEL_180:
              v93 = 0;
              v227 = 0;
            }
            else
            {
LABEL_117:
              if ((v69 & 0xFFFFFFFFFFFFFFFBLL) != 8)
              {
                v242 = 0;
                v240 = 0;
                v247 = 0;
                goto LABEL_174;
              }
              v245 = objc_opt_class();
              v97 = [v44 objectForKey:@"placeholder"];
              if (!v97)
              {
                v247 = 0;
                v240 = 0;
                v242 = 0;
                goto LABEL_180;
              }
              v98 = v97;
              if (v66)
              {
                v99 = [v66 localizedStringForKey:v97 value:&stru_1EFB51FD0 table:v58];
              }
              else
              {
                v99 = v97;
              }

              v227 = v99;
              [v44 setObject:v99 forKey:@"placeholder"];
              v247 = 0;
              v240 = 0;
              v242 = 0;
              v93 = 0;
            }
            v94 = 0;
            goto LABEL_182;
          }
        }
        else
        {
          if (v69 == 2) {
            goto LABEL_101;
          }
          if (v69 != 6) {
            goto LABEL_117;
          }
        }
        v91 = [v44 objectForKey:@"confirmation"];
        v92 = v91;
        v93 = v91 != 0;
        if (v91)
        {
          v94 = (void *)[v91 mutableCopy];
          v95 = [v94 objectForKey:@"cancelTitle"];
          if (v95)
          {
            if (v66)
            {
              v96 = [v66 localizedStringForKey:v95 value:&stru_1EFB51FD0 table:v58];
              [v94 setObject:v96 forKey:@"cancelTitle"];
            }
            else
            {
              [v94 setObject:v95 forKey:@"cancelTitle"];
            }
          }
          v112 = [v94 objectForKey:@"okTitle"];

          if (v112)
          {
            if (v66)
            {
              v113 = [v66 localizedStringForKey:v112 value:&stru_1EFB51FD0 table:v58];
              [v94 setObject:v113 forKey:@"okTitle"];
            }
            else
            {
              [v94 setObject:v112 forKey:@"okTitle"];
            }
          }
          v114 = [v94 objectForKey:@"prompt"];

          if (v114)
          {
            if (v66)
            {
              v115 = [v66 localizedStringForKey:v114 value:&stru_1EFB51FD0 table:v58];
              [v94 setObject:v115 forKey:@"prompt"];
            }
            else
            {
              [v94 setObject:v114 forKey:@"prompt"];
            }
          }
          v116 = [v94 objectForKey:@"title"];

          if (v116)
          {
            if (v66)
            {
              v117 = [v66 localizedStringForKey:v116 value:&stru_1EFB51FD0 table:v58];
              [v94 setObject:v117 forKey:@"title"];
            }
            else
            {
              [v94 setObject:v116 forKey:@"title"];
            }
          }
          [v44 setObject:v94 forKey:@"confirmation"];
          v245 = objc_opt_class();
        }
        else
        {
          v94 = 0;
        }

        v247 = 0;
        v240 = 0;
        v242 = 0;
        v227 = 0;
LABEL_182:
        v128 = [v44 objectForKey:@"detail"];
        v219 = v128;
        if (v128)
        {
          v129 = (uint64_t)NSClassFromString(v128);
LABEL_186:
          v236 = v129;
          goto LABEL_187;
        }
        if ((unint64_t)(v69 - 1) <= 1)
        {
          v129 = objc_opt_class();
          goto LABEL_186;
        }
        v236 = 0;
LABEL_187:
        aSelectorName = [v44 objectForKey:@"get"];
        v130 = [v44 objectForKey:@"set"];
        v131 = v130;
        v132 = sel_setPreferenceValue_specifier_;
        if (v130) {
          v132 = NSSelectorFromString(v130);
        }
        v218 = v131;
        v231 = v94;
        v133 = sel_readPreferenceValue_;
        if (aSelectorName) {
          v133 = NSSelectorFromString(aSelectorName);
        }
        v134 = [v44 objectForKey:@"pane"];
        v244 = [v245 preferenceSpecifierNamed:v239 target:v213 set:v132 get:v133 detail:v236 cell:v69 edit:NSClassFromString(v134)];

        if (v242 && v247)
        {
          [v244 setValues:v242 titles:v247 shortTitles:v240];
LABEL_198:
          v18 = v248;
          goto LABEL_199;
        }
        v135 = !v93;
        if (!v231) {
          v135 = 1;
        }
        if ((v135 & 1) == 0)
        {
          objc_msgSend(v244, "setupWithDictionary:");
          goto LABEL_198;
        }
        v18 = v248;
        if ((v69 & 0xFFFFFFFFFFFFFFFBLL) == 8)
        {
          if (v227) {
            objc_msgSend(v244, "setPlaceholder:");
          }
          v139 = [v44 objectForKey:@"bestGuess"];
          if ([v139 length] && (v140 = NSSelectorFromString((NSString *)v139)) != 0) {
            v141 = v140;
          }
          else {
            v141 = 0;
          }
          v244[26] = v141;
        }
LABEL_199:
        v136 = [v44 objectForKey:@"cellClass"];
        v137 = v136;
        if (v136)
        {
          v138 = NSClassFromString(v136);
          if (v138) {
            [v44 setObject:v138 forKey:@"cellClass"];
          }
          else {
            [v44 removeObjectForKey:@"cellClass"];
          }
        }
        v217 = v137;
        v142 = v44;
        v143 = v229;
        v144 = v58;
        v145 = [MEMORY[0x1E4F1CA48] array];
        v146 = [v142 objectForKeyedSubscript:@"keywords"];
        objc_opt_class();
        v246 = v142;
        v230 = (void *)v146;
        if (objc_opt_isKindOfClass())
        {
          v147 = [v142 objectForKeyedSubscript:@"keywords"];
          [v145 addObjectsFromArray:v147];
          v148 = v244;
        }
        else
        {
          objc_opt_class();
          v148 = v244;
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_214;
          }
          v147 = [v142 objectForKeyedSubscript:@"keywords"];
          [v147 componentsSeparatedByString:@","];
          v150 = v149 = v145;
          [v149 addObjectsFromArray:v150];

          v145 = v149;
        }

LABEL_214:
        v151 = v246;
        v152 = [v246 objectForKeyedSubscript:@"validTitles"];
        [v145 addObjectsFromArray:v152];

        if ([v145 count])
        {
          v216 = v44;
          v153 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v145, "count"));
          v265 = 0u;
          v266 = 0u;
          v267 = 0u;
          v268 = 0u;
          v212 = v145;
          v154 = v145;
          v155 = [v154 countByEnumeratingWithState:&v265 objects:v273 count:16];
          if (v155)
          {
            v156 = v155;
            v157 = *(void *)v266;
            do
            {
              for (n = 0; n != v156; ++n)
              {
                if (*(void *)v266 != v157) {
                  objc_enumerationMutation(v154);
                }
                v159 = *(void *)(*((void *)&v265 + 1) + 8 * n);
                if (v18)
                {
                  v160 = [v143 localizedStringForKey:v159 value:&stru_1EFB51FD0 table:v144];
                  [v153 addObject:v160];

                  v18 = v248;
                }
                else
                {
                  [v153 addObject:v159];
                }
              }
              v156 = [v154 countByEnumeratingWithState:&v265 objects:v273 count:16];
            }
            while (v156);
          }

          v151 = v246;
          [v246 setObject:v153 forKeyedSubscript:@"keywords"];

          v44 = v216;
          v148 = v244;
          v145 = v212;
        }

        [v148 setProperties:v151];
        v161 = v236;
        if (v236 || v214 <= 8 && ((1 << v214) & 0x106) != 0)
        {
          v162 = [v151 objectForKey:@"isIP"];
          v163 = [v162 BOOLValue];

          if (v163)
          {
            v161 = 3;
          }
          else
          {
            v164 = [v151 objectForKey:@"isURL"];
            v165 = [v164 BOOLValue];

            if (v165)
            {
              v161 = 1;
            }
            else
            {
              v166 = [v151 objectForKey:@"isNumeric"];
              v167 = [v166 BOOLValue];

              if (v167)
              {
                v161 = 2;
              }
              else
              {
                v168 = [v151 objectForKey:@"isEmail"];
                v169 = [v168 BOOLValue];

                if (v169)
                {
                  v161 = 4;
                }
                else
                {
                  v170 = [v151 objectForKey:@"isEmailAddressing"];
                  v171 = [v170 BOOLValue];

                  if (v171)
                  {
                    v161 = 5;
                  }
                  else
                  {
                    v172 = [v151 objectForKey:@"isDecimalPad"];
                    v173 = [v172 BOOLValue];

                    v161 = 6;
                    if (!v173) {
                      v161 = 0;
                    }
                  }
                }
              }
            }
          }
        }
        v148[12] = v161;
        v174 = [v246 objectForKey:@"autoCaps"];
        v148[10] = +[PSSpecifier autoCapsTypeForString:v174];

        v175 = [v246 objectForKey:@"autoCorrection"];
        v148[11] = +[PSSpecifier autoCorrectionTypeForNumber:v175];

        v176 = [v246 objectForKey:@"keyboard"];
        v148[9] = +[PSSpecifier keyboardTypeForString:v176];

        if (CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0)) {
          goto LABEL_263;
        }
        v177 = [v246 objectForKey:@"action"];
        v237 = v177;
        if (v177) {
          v178 = NSSelectorFromString(v177);
        }
        else {
          v178 = 0;
        }
        [v148 setLegacyAction:v178];
        v179 = [v246 objectForKey:@"cancel"];
        v180 = v179;
        if (v179) {
          v181 = NSSelectorFromString(v179);
        }
        else {
          v181 = 0;
        }
        [v148 setLegacyCancel:v181];
        v182 = [MEMORY[0x1E4F42948] currentDevice];
        if (!objc_msgSend(v182, "sf_isInternalInstall")) {
          goto LABEL_261;
        }
        v183 = [v148 legacyAction];

        if (v183)
        {
          v184 = (void *)MEMORY[0x1E4F28B50];
          v185 = [@"/AppleInternal/Library/PreferenceBundles/" stringByAppendingPathComponent:@"Internal Settings"];
          v186 = [v185 stringByAppendingPathExtension:@"bundle"];
          v182 = [v184 bundleWithPath:v186];

          if (v182)
          {
            v187 = [v182 localizedStringForKey:@"SPECIFIER_ACTION_DESCRIPTION" value:&stru_1EFB51FD0 table:@"SpecifierActions"];
            v207 = v187;
          }
          else
          {
            v187 = @"SPECIFIER_ACTION_DESCRIPTION";
          }
          v188 = NSStringFromSelector((SEL)[v244 legacyAction]);
          v189 = NSStringFromSelector((SEL)[v244 legacyCancel]);
          NSLog(&v187->isa, v244, v188, v189);

          if (v182) {
          v18 = v248;
          }
          v148 = v244;
LABEL_261:

          goto LABEL_262;
        }
        v18 = v248;
LABEL_262:

LABEL_263:
        v190 = [v246 objectForKey:@"confirmationAction"];
        if (v190)
        {
          v191 = v190;
          v192 = NSSelectorFromString(v190);
        }
        else
        {
          v191 = 0;
          v192 = 0;
        }
        [v148 setConfirmationAction:v192];
        v193 = [v246 objectForKey:@"cancel"];
        v194 = v193;
        if (v193) {
          v195 = NSSelectorFromString(v193);
        }
        else {
          v195 = 0;
        }
        [v148 setConfirmationCancelAction:v195];
        v196 = [v246 objectForKey:@"loadAction"];
        v197 = v196;
        if (v196) {
          v198 = NSSelectorFromString(v196);
        }
        else {
          v198 = 0;
        }
        [v244 setControllerLoadAction:v198];
        v199 = [v246 objectForKey:@"buttonAction"];
        v200 = v199;
        if (v199) {
          v201 = NSSelectorFromString(v199);
        }
        else {
          v201 = 0;
        }
        [v244 setButtonAction:v201];
        [v244 setupIconImageWithBundle:v143];
        [v224 addObject:v244];

        v57 = v241;
LABEL_276:

        v24 = v57 + 1;
      }
      while (v24 != v226);
      v202 = [obj countByEnumeratingWithState:&v261 objects:v272 count:16];
      v226 = v202;
    }
    while (v202);
  }

  v203 = v224;
  return v203;
}

double ScreenScale()
{
  double result = *(double *)&_screenScale;
  if (*(double *)&_screenScale == 0.0)
  {
    v1 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", *(double *)&_screenScale);
    [v1 scale];
    _screenScale = v2;

    return *(double *)&_screenScale;
  }
  return result;
}

uint64_t ProcessedSpecifierBundle(void *a1, void *a2, void *a3, void **a4, void *a5)
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  v13 = [v9 objectForKey:@"bundle"];
  if (!v13)
  {
    uint64_t v23 = 0;
    goto LABEL_54;
  }
  v14 = PKLogForCategory(6);
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, "PSSpecifierLoading.ProcessedSpecifierBundle");

  v16 = PKLogForCategory(6);
  v17 = v16;
  unint64_t v96 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138543618;
    v109 = v13;
    __int16 v110 = 2114;
    id v111 = (id)objc_opt_class();
    id v18 = v111;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PSSpecifierLoading.ProcessedSpecifierBundle", "%{public}@ loaded from controller %{public}@", buf, 0x16u);
  }
  v19 = [v9 objectForKey:@"internal"];
  int v20 = [v19 BOOLValue];

  os_signpost_id_t spid = v15;
  if (v20)
  {
    v21 = @"/AppleInternal/Library/PreferenceBundles/";
LABEL_7:
    v22 = [(__CFString *)v21 stringByAppendingPathComponent:v13];
    v97 = [v22 stringByAppendingPathExtension:@"bundle"];
LABEL_11:

    goto LABEL_12;
  }
  v24 = [v9 objectForKey:@"developer"];
  int v25 = [v24 BOOLValue];

  if (v25)
  {
    v22 = SFDeveloperSettingsBundlesDirectoryPath();
    v26 = [v22 stringByAppendingPathComponent:v13];
    v97 = [v26 stringByAppendingPathExtension:@"bundle"];

    goto LABEL_11;
  }
  v46 = [v9 objectForKey:@"nanoBundlePath"];
  int v47 = [v46 BOOLValue];

  if (v47)
  {
    v21 = @"/System/Library/NanoPreferenceBundles/General/";
    goto LABEL_7;
  }
  v71 = [v9 objectForKey:@"nanoInternalBundlePath"];
  int v72 = [v71 BOOLValue];

  if (v72)
  {
    v21 = @"/AppleInternal/Library/NanoPreferenceBundles/General/";
    goto LABEL_7;
  }
  v78 = [v9 objectForKey:@"nanoAppsBundlePath"];
  int v79 = [v78 BOOLValue];

  if (v79)
  {
    v21 = @"/System/Library/NanoPreferenceBundles/Applications/";
    goto LABEL_7;
  }
  v97 = PSBundlePathForPreferenceBundle((uint64_t)v13);
LABEL_12:
  v27 = [v9 objectForKey:@"isController"];
  int v28 = [v27 BOOLValue];

  if ((v28 & 1) == 0)
  {
    v95 = v12;
    v32 = (void *)MEMORY[0x1E4F28B50];
    v33 = SFRuntimeAbsoluteFilePathForPath();
    v34 = [v32 bundleWithPath:v33];

    v35 = (objc_class *)[v34 principalClass];
    if (!v35 || ![(objc_class *)v35 isSubclassOfClass:objc_opt_class()])
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      v45 = NSStringFromClass(v35);
      NSLog(&cfstr_IncorrectPlugi.isa, v44, v45, v97);

LABEL_31:
      goto LABEL_32;
    }
    id v91 = v11;
    v92 = a4;
    if (a4)
    {
      v36 = *a4;
      if (*a4)
      {
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v37 = v36;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v102 objects:v107 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v103;
          id v90 = v10;
LABEL_23:
          uint64_t v41 = 0;
          while (1)
          {
            if (*(void *)v103 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = *(void **)(*((void *)&v102 + 1) + 8 * v41);
            if ([v42 isMemberOfClass:v35]) {
              break;
            }
            if (v39 == ++v41)
            {
              uint64_t v39 = [v37 countByEnumeratingWithState:&v102 objects:v107 count:16];
              id v10 = v90;
              if (v39) {
                goto LABEL_23;
              }
              goto LABEL_29;
            }
          }
          id v44 = v42;

          id v10 = v90;
          id v11 = v91;
          a4 = v92;
          if (!v44) {
            goto LABEL_63;
          }
          int v89 = 0;
          goto LABEL_65;
        }
LABEL_29:

        id v11 = v91;
        a4 = v92;
      }
    }
LABEL_63:
    id v44 = (id)[[v35 alloc] initWithParentListController:v10 properties:v9];
    BOOL v80 = v44 != 0;
    if (!v44)
    {
LABEL_73:
      if (a4 && v80)
      {
        id v86 = *a4;
        id v11 = v91;
        if (!*a4)
        {
          id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          *a4 = v86;
        }
        [v86 addObject:v44];
      }
      else
      {
        id v11 = v91;
      }
      goto LABEL_31;
    }
    int v89 = 1;
    id v90 = v10;
LABEL_65:
    v81 = [v44 specifiersWithSpecifier:v11];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v82 = [v81 countByEnumeratingWithState:&v98 objects:v106 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v99 != v84) {
            objc_enumerationMutation(v81);
          }
          [*(id *)(*((void *)&v98 + 1) + 8 * i) setProperty:v13 forKey:@"searchBundle"];
        }
        uint64_t v83 = [v81 countByEnumeratingWithState:&v98 objects:v106 count:16];
      }
      while (v83);
    }
    [v95 addObjectsFromArray:v81];

    id v10 = v90;
    a4 = v92;
    BOOL v80 = v89;
    goto LABEL_73;
  }
  v29 = SFRuntimeAbsoluteFilePathForPath();
  [v9 setObject:v29 forKey:@"lazy-bundle"];

  v30 = [v9 objectForKey:@"loadAction"];

  if (v30)
  {
    if (!CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0))
    {
      v31 = [v9 objectForKey:@"action"];

      if (v31) {
        [v9 removeObjectForKey:@"loadAction"];
      }
    }
  }
  else
  {
    [v9 setObject:@"lazyLoadBundle:" forKey:@"loadAction"];
  }
  v48 = [v9 objectForKey:@"hasIcon"];
  int v49 = [v48 BOOLValue];

  if (!v49) {
    goto LABEL_40;
  }
  v95 = v12;
  v50 = (void *)MEMORY[0x1E4F28B50];
  v51 = SFRuntimeAbsoluteFilePathForPath();
  v34 = [v50 bundleWithPath:v51];

  if (v34)
  {
    v52 = [v9 objectForKey:@"hasBundleIcon"];
    int v53 = [v52 BOOLValue];

    if (v53)
    {
      v54 = (void *)MEMORY[0x1E4F42A80];
      v55 = [MEMORY[0x1E4F42D90] mainScreen];
      [v55 traitCollection];
      id v56 = v10;
      v57 = a4;
      v59 = id v58 = v11;
      id v44 = [v54 imageNamed:@"icon.png" inBundle:v34 compatibleWithTraitCollection:v59];

      id v11 = v58;
      a4 = v57;
      id v10 = v56;

      [v9 setObject:v44 forKey:@"iconImage"];
    }
    else
    {
      id v44 = [v9 objectForKey:@"icon"];
      v73 = [v97 stringByAppendingPathComponent:@"icon.png"];
      if (v44)
      {
        v87 = (void *)MEMORY[0x1E4F42A80];
        [MEMORY[0x1E4F42D90] mainScreen];
        v93 = a4;
        v75 = id v74 = v11;
        v76 = [v75 traitCollection];
        [v87 imageNamed:v44 inBundle:v34 compatibleWithTraitCollection:v76];
        v77 = v88 = v73;

        id v11 = v74;
        a4 = v93;
        [v9 setObject:v77 forKey:@"iconImage"];
        [v9 setObject:v88 forKey:@"icon2"];

        v73 = v88;
      }
      else
      {
        [v9 setObject:v73 forKey:@"icon"];
      }
    }
    goto LABEL_31;
  }
LABEL_32:

  id v12 = v95;
LABEL_40:
  if (a4) {
    v60 = *a4;
  }
  else {
    v60 = 0;
  }
  uint64_t v23 = v28 ^ 1u;
  id v61 = v60;
  uint64_t v62 = [v61 count];
  v63 = PKLogForCategory(6);
  v64 = v63;
  if (v62 == 1)
  {
    if (v96 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      v65 = [v61 objectAtIndexedSubscript:0];
      v66 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v109 = v66;
      id v67 = v11;
      id v68 = v66;
      _os_signpost_emit_with_name_impl(&dword_1A6597000, v64, OS_SIGNPOST_INTERVAL_END, spid, "PSSpecifierLoading.ProcessedSpecifierBundle", "Bundle Controller: %{public}@", buf, 0xCu);

      id v11 = v67;
    }
  }
  else if (v96 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    if ([v61 count]) {
      id v69 = v61;
    }
    else {
      id v69 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v109 = v69;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v64, OS_SIGNPOST_INTERVAL_END, spid, "PSSpecifierLoading.ProcessedSpecifierBundle", "Bundle Controllers: %{public}@", buf, 0xCu);
  }

LABEL_54:
  return v23;
}

id PKLogForCategory(uint64_t a1)
{
  if (PKLogForCategory_loggingToken != -1) {
    dispatch_once(&PKLogForCategory_loggingToken, &__block_literal_global_4_0);
  }
  uint64_t v2 = (void *)PKLogForCategory_logObjects[a1];
  return v2;
}

uint64_t __ensureDefaultAppearanceProviderAndNavigationRegistration_block_invoke()
{
  defaultAppearanceProviderClass = objc_opt_class();
  uint64_t result = objc_opt_class();
  defaultNavigationCoordinatorClass = result;
  return result;
}

id _copyIconForPathFromSpecifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length])
  {
    v5 = [v3 stringByDeletingLastPathComponent];
    v6 = [v3 lastPathComponent];
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v8 = (void *)[v7 initWithCapacity:gScale];
    if ([v6 rangeOfString:@".png"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [v6 stringByAppendingString:@".png"];

      v6 = (void *)v9;
    }
    [v8 addObject:v6];
    if (gScale >= 2)
    {
      id v10 = [v6 stringByReplacingOccurrencesOfString:@".png", @"@2x.png", 13, objc_msgSend(v6, "length") - objc_msgSend(@".png", "length"), objc_msgSend(@".png", "length") withString options range];
      [v8 addObject:v10];

      if (gScale >= 3)
      {
        id v11 = [v6 stringByReplacingOccurrencesOfString:@".png", @"@3x.png", 13, objc_msgSend(v6, "length") - objc_msgSend(@".png", "length"), objc_msgSend(@".png", "length") withString options range];
        [v8 addObject:v11];
      }
    }
    if ((unint64_t)[v5 length] < 2)
    {
      id v13 = v4;
    }
    else
    {
      if ([v5 hasPrefix:@"~/"]) {
        [v5 stringByExpandingTildeInPath];
      }
      else {
      v14 = SFRuntimeAbsoluteFilePathForPath();
      }
      id v13 = [v14 stringByResolvingSymlinksInPath];

      v5 = v14;
    }

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__9;
    v24 = __Block_byref_object_dispose__9;
    id v25 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = ___copyIconForPathFromSpecifier_block_invoke;
    v17[3] = &unk_1E5C5FE88;
    id v15 = v13;
    id v18 = v15;
    v19 = &v20;
    [v8 enumerateObjectsWithOptions:2 usingBlock:v17];
    id v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void sub_1A659E5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PSBlankIconImage()
{
  if (PSBlankIconImage_onceToken != -1) {
    dispatch_once(&PSBlankIconImage_onceToken, &__block_literal_global_183);
  }
  v0 = (void *)PSBlankIconImage_result;
  return v0;
}

BOOL ShouldIndexSpecifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 identifier];

  if (v2
    && ([v1 name],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unint64_t v4 = [v3 length],
        v3,
        v4 <= 0x3C))
  {
    v6 = [v1 propertyForKey:@"searchable"];
    id v7 = v6;
    BOOL v5 = (!v6 || [v6 BOOLValue]) && !PSIsSpecifierHiddenDueToRestrictions(v1);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL PSIsSpecifierHiddenDueToRestrictions(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 propertyForKey:@"restrictByID"];
  if (PSIsBundleIDHiddenDueToRestrictions(v2))
  {
    id v3 = _PSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = [v1 identifier];
      int v9 = 138543618;
      id v10 = v4;
      __int16 v11 = 2114;
      id v12 = v2;
      _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "Specifier %{public}@ is hidden because identifier is restricted: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    BOOL v5 = 1;
  }
  else
  {
    id v3 = [v1 propertyForKey:@"restrictByMCFeature"];
    BOOL v5 = _PSIsValueRestrictedByMCFeature(v3);
    if (v5)
    {
      v6 = _PSLoggingFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v1 identifier];
        int v9 = 138543618;
        id v10 = v7;
        __int16 v11 = 2114;
        id v12 = v3;
        _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Specifier %{public}@ is hidden because feature is restricted: %{public}@", (uint8_t *)&v9, 0x16u);
      }
    }
  }

  return v5;
}

BOOL _PSIsValueRestrictedByMCFeature(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
    BOOL v3 = [v2 effectiveBoolValueForSetting:v1] == 2;
  }
  else
  {
    objc_opt_class();
    BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0
      && [v1 indexOfObjectPassingTest:&__block_literal_global_305] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v3;
}

BOOL PSIsBundleIDHiddenDueToRestrictions(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
    BOOL v3 = [v2 effectiveWhitelistedAppBundleIDs];

    if (v3 && ![v3 containsObject:v1])
    {
      BOOL v8 = 1;
    }
    else
    {
      unint64_t v4 = [MEMORY[0x1E4F74230] sharedConnection];
      BOOL v5 = [v4 effectiveBlacklistedAppBundleIDs];

      BOOL v8 = 1;
      if (([v5 containsObject:v1] & 1) == 0)
      {
        if (![v1 isEqualToString:@"com.apple.podcasts"]
          || ([MEMORY[0x1E4F74230] sharedConnection],
              v6 = objc_claimAutoreleasedReturnValue(),
              int v7 = [v6 effectiveBoolValueForSetting:*MEMORY[0x1E4F74110]],
              v6,
              v7 != 2))
        {
          BOOL v8 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

id SearchSpecifiersFromPlistWithCapabilities(void *a1, void *a2, void *a3, void *a4, char a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = __SpecifiersFromPlist(a1, a2, 0, a3, a4, 0, 0, 0, 0, a5);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        __int16 v11 = [v10 propertyForKey:@"searchLabel"];
        if (v11) {
          [v10 setName:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v5;
}

uint64_t PSSupportedOrientations()
{
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  char v1 = objc_msgSend(v0, "sf_isiPad");

  if (v1) {
    return 30;
  }
  BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
  unint64_t v4 = [v3 fixedCoordinateSpace];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v13.origin.x = v6;
  v13.origin.y = v8;
  v13.size.width = v10;
  v13.size.height = v12;
  CGRectGetHeight(v13);
  if (_UIUserInterfaceSizeClassForWidth() == 2) {
    return 26;
  }
  else {
    return 2;
  }
}

uint64_t PSSetCustomWatchCapabilityCheck(void *a1)
{
  _CustomCapabilityCheck = [a1 copy];
  return MEMORY[0x1F41817F8]();
}

void ___copyIconForPathFromSpecifier_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  double v7 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v6];
  CGFloat v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithContentsOfFile:v7];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    CGFloat v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      *a4 = 1;
      CGRect v13 = _PSLoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v17 = 138412546;
        id v18 = v6;
        __int16 v19 = 2112;
        uint64_t v20 = v14;
        long long v15 = " Found  %@ in bundle %@";
LABEL_7:
        _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 0x16u);
      }
    }
    else
    {
      CGRect v13 = _PSLoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v17 = 138412546;
        id v18 = v6;
        __int16 v19 = 2112;
        uint64_t v20 = v16;
        long long v15 = "Missing %@ in bundle %@";
        goto LABEL_7;
      }
    }
  }
}

uint64_t PSShouldInsetListView(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  BOOL v3 = [v2 traitCollection];

  if ([v3 userInterfaceIdiom] == 1) {
    goto LABEL_2;
  }
  if (!_os_feature_enabled_impl()) {
    goto LABEL_15;
  }
  [v1 frame];
  double Width = CGRectGetWidth(v14);
  id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F43798], *MEMORY[0x1E4F43790], 0);
  double v7 = [v3 preferredContentSizeCategory];
  int v8 = [v6 containsObject:v7];

  uint64_t v9 = [v3 horizontalSizeClass];
  if (Width <= 320.0 && (v8 & 1) != 0) {
    goto LABEL_15;
  }
  BOOL v10 = Width <= 320.0;
  if (Width <= 320.0) {
    int v11 = 1;
  }
  else {
    int v11 = v8;
  }
  if (v9 != 2) {
    BOOL v10 = 1;
  }
  if ((v10 | v8 ^ 1) != 1 || v11 == 0) {
LABEL_2:
  }
    uint64_t v4 = 1;
  else {
LABEL_15:
  }
    uint64_t v4 = 0;

  return v4;
}

id _PSLoggingFacility()
{
  if (_PSLoggingFacility_onceToken != -1) {
    dispatch_once(&_PSLoggingFacility_onceToken, &__block_literal_global_34);
  }
  v0 = (void *)_PSLoggingFacility_oslog;
  return v0;
}

void sub_1A65A42E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65A4DEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65A5770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A65A5D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A65A5ED4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PSIsInEDUMode()
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getUMUserManagerClass_softClass;
  uint64_t v9 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getUMUserManagerClass_block_invoke;
    v5[3] = &unk_1E5C5D4D8;
    v5[4] = &v6;
    __getUMUserManagerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  uint64_t v2 = [v1 sharedManager];
  uint64_t v3 = [v2 isMultiUser];

  return v3;
}

void sub_1A65A69F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __UserManagementLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5C60718;
    uint64_t v5 = 0;
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UserManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getUMUserManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getUMUserManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id SpecifiersFromPlist(void *a1, void *a2, void *a3, void *a4, void *a5, id *a6, void **a7, void *a8, void **a9)
{
  return SpecifiersFromPlistWithCapabilities(a1, a2, a3, a4, a5, a6, a7, a8, a9, 1);
}

id SpecifiersFromPlistWithCapabilities(void *a1, void *a2, void *a3, void *a4, void *a5, id *a6, void **a7, void *a8, void **a9, char a10)
{
  id v17 = a1;
  id v18 = a2;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a8;
  if (a9 && !*a9) {
    *a9 = (id)objc_opt_new();
  }
  uint64_t v23 = __SpecifiersFromPlist(v17, v18, v19, v20, v21, a6, a7, v22, a9, a10);

  return v23;
}

void sub_1A65A740C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65A802C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65A8554(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65A8CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSIsRunningInAssistant()
{
  if (PSIsRunningInAssistant_onceToken != -1) {
    dispatch_once(&PSIsRunningInAssistant_onceToken, &__block_literal_global_206);
  }
  return PSIsRunningInAssistant_isRunningInAssistant;
}

void sub_1A65A9108(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PSSimIsRequired()
{
  if (MGGetBoolAnswer())
  {
    uint64_t v0 = _CTServerConnectionCreate();
    if (v0)
    {
      id v1 = (const void *)v0;
      unint64_t IsUserIdentityModuleRequired = _CTServerConnectionIsUserIdentityModuleRequired();
      if (HIDWORD(IsUserIdentityModuleRequired)) {
        NSLog(&cfstr_CterrorDomainI.isa, IsUserIdentityModuleRequired, HIDWORD(IsUserIdentityModuleRequired));
      }
      CFRelease(v1);
    }
  }
  return 1;
}

void __PSBlankIconImage_block_invoke()
{
  id v7 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
  uint64_t v0 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
  id v1 = [v7 prepareImageForDescriptor:v0];
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v4 = [v1 CGImage];
    [v2 scale];
    uint64_t v5 = objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v4, 0);
    uint64_t v6 = (void *)PSBlankIconImage_result;
    PSBlankIconImage_Class result = v5;
  }
}

uint64_t __PKLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.preferences", "Preferences");
  id v1 = (void *)PKLogForCategory_logObjects[0];
  PKLogForCategory_logObjects[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.preferences", "LoadFirstPartyBundle");
  uint64_t v3 = (void *)qword_1E96C0678;
  qword_1E96C0678 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.preferences", "LoadThirdPartyBundle");
  uint64_t v5 = (void *)qword_1E96C0680;
  qword_1E96C0680 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.preferences", "Navigation");
  id v7 = (void *)qword_1E96C0688;
  qword_1E96C0688 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.preferences", "Search");
  uint64_t v9 = (void *)qword_1E96C0690;
  qword_1E96C0690 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.preferences", "Url");
  int v11 = (void *)qword_1E96C0698;
  qword_1E96C0698 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.preferences", "Signposts");
  CGRect v13 = (void *)qword_1E96C06A0;
  qword_1E96C06A0 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.preferences", "Specifier Actions");
  uint64_t v15 = qword_1E96C06A8;
  qword_1E96C06A8 = (uint64_t)v14;
  return MEMORY[0x1F41817F8](v14, v15);
}

void __PSIsRunningInAssistant_block_invoke()
{
  os_log_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  uint64_t v5 = 0;
  os_log_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  os_log_t v2 = (void *)getBYSetupAssistantBundleIdentifierSymbolLoc_ptr;
  uint64_t v8 = getBYSetupAssistantBundleIdentifierSymbolLoc_ptr;
  if (!getBYSetupAssistantBundleIdentifierSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke;
    v4[3] = &unk_1E5C5D4D8;
    v4[4] = &v5;
    __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke((uint64_t)v4);
    os_log_t v2 = (void *)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    uint64_t v3 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  PSIsRunningInAssistant_isRunningInAssistant = [v1 isEqualToString:*v2];
}

void *__getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __SetupAssistantLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E5C60700;
    uint64_t v7 = 0;
    SetupAssistantLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    os_log_t v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary_0;
    if (SetupAssistantLibraryCore_frameworkLibrary_0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  os_log_t v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary_0;
LABEL_5:
  Class result = dlsym(v2, "BYSetupAssistantBundleIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantBundleIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A65ABFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MomentsOnboardingAndSettingsLibraryCore()
{
  if (!MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary) {
    MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary;
}

uint64_t __MomentsOnboardingAndSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

PSAccessoriesPolicyController *__getMOApprovedApplicationsManagerClass_block_invoke(uint64_t a1)
{
  if (!MomentsOnboardingAndSettingsLibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  uint64_t result = (PSAccessoriesPolicyController *)objc_getClass("MOApprovedApplicationsManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMOApprovedApplicationsManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    os_log_t v4 = (PSAccessoriesPolicyController *)__getMOApprovedApplicationsManagerClass_block_invoke_cold_1();
    return [(PSAccessoriesPolicyController *)v4 initWithAppBundleID:v6];
  }
  return result;
}

void sub_1A65AC2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getDADaemonSessionClass()
{
  uint64_t v4 = 0;
  SEL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getDADaemonSessionClass_softClass;
  uint64_t v7 = getDADaemonSessionClass_softClass;
  if (!getDADaemonSessionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getDADaemonSessionClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getDADaemonSessionClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65AC3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65ACBC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getDADaemonSessionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!DeviceAccessLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __DeviceAccessLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5D590;
    uint64_t v6 = 0;
    DeviceAccessLibraryCore_frameworkLibrary = _sl_dlopen();
    os_log_t v2 = (void *)v4[0];
    if (!DeviceAccessLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("DADaemonSession");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    os_log_t v2 = (void *)__getDADaemonSessionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getDADaemonSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DeviceAccessLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DeviceAccessLibraryCore_frameworkLibrary = result;
  return result;
}

id getOBPrivacyPresenterClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getOBPrivacyPresenterClass_softClass;
  uint64_t v7 = getOBPrivacyPresenterClass_softClass;
  if (!getOBPrivacyPresenterClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getOBPrivacyPresenterClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getOBPrivacyPresenterClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65ADAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBPrivacyPresenterClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __OnBoardingKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5D660;
    uint64_t v6 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    os_log_t v2 = (void *)v4[0];
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("OBPrivacyPresenter");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    os_log_t v2 = (void *)__getOBPrivacyPresenterClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getOBPrivacyPresenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A65B27C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PSCalendarAuthorizationStates(void *a1, void *a2, void *a3)
{
  uint64_t v6 = (void *)tcc_server_create();
  uint64_t v7 = tcc_service_singleton_for_CF_name();
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int v11 = _PSLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6597000, v11, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service kTCCServiceCalendar", buf, 2u);
  }

  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  tcc_server_message_get_authorization_records_by_service();
  if (a1) {
    *a1 = (id)[v12 copy];
  }
  if (a2) {
    *a2 = (id)[v13 copy];
  }
  if (a3) {
    *a3 = (id)[v14 copy];
  }
}

void __PSCalendarAuthorizationStates_block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    id v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          id v9 = a1 + 6;
          goto LABEL_14;
        case 4:
          id v9 = a1 + 5;
          goto LABEL_14;
        case 2:
          id v9 = a1 + 4;
LABEL_14:
          [*v9 addObject:v8];
          break;
      }
    }

    goto LABEL_16;
  }
  id v10 = _PSLoggingFacility();
  uint64_t v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PSCalendarAuthorizationStates_block_invoke_cold_1(a3, v6);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for kTCCServiceCalendar", v11, 2u);
  }
LABEL_16:
}

void sub_1A65B41B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id bundleIdentifiersWithPickerAccess()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  os_log_t v0 = (void *)getCNPrivateAccessAggregatorClass_softClass;
  uint64_t v9 = getCNPrivateAccessAggregatorClass_softClass;
  if (!getCNPrivateAccessAggregatorClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getCNPrivateAccessAggregatorClass_block_invoke;
    v5[3] = &unk_1E5C5D4D8;
    v5[4] = &v6;
    __getCNPrivateAccessAggregatorClass_block_invoke((uint64_t)v5);
    os_log_t v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  os_log_t v2 = [v1 allLoggedBundledIdentifiers];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];

  return v3;
}

void sub_1A65B4B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65B5160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNLimitedAccessContactPickerViewControllerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getCNLimitedAccessContactPickerViewControllerClass_softClass;
  uint64_t v7 = getCNLimitedAccessContactPickerViewControllerClass_softClass;
  if (!getCNLimitedAccessContactPickerViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNLimitedAccessContactPickerViewControllerClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getCNLimitedAccessContactPickerViewControllerClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65B585C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65B5B50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PSContactsAuthorizationStatesForService(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)tcc_server_create();
  uint64_t v9 = tcc_service_singleton_for_CF_name();
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v13 = _PSLoggingFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = a1;
    _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", buf, 0xCu);
  }

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v14 = v10;
  id v18 = v14;
  id v15 = v11;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  tcc_server_message_get_authorization_records_by_service();
  if (a2) {
    *a2 = (id)objc_msgSend(v14, "copy", v17, 3221225472, __PSContactsAuthorizationStatesForService_block_invoke, &unk_1E5C5D778, v14, v15, v16, a1);
  }
  if (a3) {
    *a3 = (id)[v15 copy];
  }
  if (v16) {
    *a4 = (id)[v16 copy];
  }
}

void *__getCNContactStoreDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  os_log_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactStoreDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactStoreDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ContactsLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __ContactsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5D740;
    uint64_t v5 = 0;
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ContactsLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __ContactsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsLibraryCore_frameworkLibrary = result;
  return result;
}

void __getCNPrivateAccessAggregatorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CNPrivateAccessAggregator");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNPrivateAccessAggregatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNPrivateAccessAggregatorClass_block_invoke_cold_1();
    ContactsUILibrary();
  }
}

void ContactsUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ContactsUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C5D758;
    uint64_t v3 = 0;
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ContactsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  Class result = objc_getClass("CNContactStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNContactStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCNContactStoreClass_block_invoke_cold_1();
    return (Class)__getCNLimitedAccessContactPickerViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getCNLimitedAccessContactPickerViewControllerClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNLimitedAccessContactPickerViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNLimitedAccessContactPickerViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  }
  else
  {
    uint64_t v3 = __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1();
    return (Class)__PSContactsAuthorizationStatesForService_block_invoke(v3);
  }
  return result;
}

void __PSContactsAuthorizationStatesForService_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    uint64_t v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          uint64_t v9 = (id *)(a1 + 48);
          goto LABEL_14;
        case 3:
          uint64_t v9 = (id *)(a1 + 40);
          goto LABEL_14;
        case 2:
          uint64_t v9 = (id *)(a1 + 32);
LABEL_14:
          [*v9 addObject:v8];
          break;
      }
    }

    goto LABEL_16;
  }
  id v10 = _PSLoggingFacility();
  uint64_t v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PSContactsAuthorizationStatesForService_block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_16:
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1A65B7B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1A65B846C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id getDriverManagerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getDriverManagerClass_softClass;
  uint64_t v7 = getDriverManagerClass_softClass;
  if (!getDriverManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getDriverManagerClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getDriverManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65B89C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDriverManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!DriverManagementLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __DriverManagementLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5D8A0;
    uint64_t v6 = 0;
    DriverManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!DriverManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("DriverManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getDriverManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getDriverManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DriverManagementLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DriverManagementLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A65BA16C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage()
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  id v1 = [getPLPrivacyClass() sharedInstance];
  long long v2 = [v1 photosPickerPresentedLibraryLogsByClient];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = getPLPhotosPickerLogClientBundleIdentifierKey();
        id v10 = objc_msgSend(v8, "objectForKeyedSubscript:", v9, (void)v16);

        uint64_t v11 = getPLPhotosPickerLogPresentedTimestampKey();
        int v12 = [v8 objectForKeyedSubscript:v11];

        [v12 timeIntervalSinceNow];
        if (v13 <= 0.0 && v13 > -2592000.0) {
          [v0 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  uint64_t v14 = (void *)[v0 copy];
  return v14;
}

id getPLPrivacyClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPLPrivacyClass_softClass;
  uint64_t v7 = getPLPrivacyClass_softClass;
  if (!getPLPrivacyClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPLPrivacyClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getPLPrivacyClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65BAA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPLPhotosPickerLogClientBundleIdentifierKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_ptr;
  uint64_t v8 = getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_ptr;
  if (!getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_ptr)
  {
    id v1 = (void *)PhotoLibraryServicesCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PLPhotosPickerLogClientBundleIdentifierKey");
    getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

id getPLPhotosPickerLogPresentedTimestampKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_ptr;
  uint64_t v8 = getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_ptr;
  if (!getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_ptr)
  {
    id v1 = (void *)PhotoLibraryServicesCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PLPhotosPickerLogPresentedTimestampKey");
    getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

void PSPXTCCSettingsLimitedAccessSubtitle(void *a1)
{
  id v1 = a1;
  PXTCCSettingsLimitedAccessSubtitleSymbolLoc = (void (*)(id))getPXTCCSettingsLimitedAccessSubtitleSymbolLoc();
  if (PXTCCSettingsLimitedAccessSubtitleSymbolLoc)
  {
    id v3 = PXTCCSettingsLimitedAccessSubtitleSymbolLoc(v1);

    id v4 = v3;
  }
  else
  {
    uint64_t v5 = (PSPhotoServicesAuthorizationLevelController *)-[PSContactsAuthorizationLevelController dealloc]();
    [(PSPhotoServicesAuthorizationLevelController *)v5 setSpecifier:v7];
  }
}

void sub_1A65BB43C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65BC5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65BCA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

Class __getPLPrivacyClass_block_invoke(uint64_t a1)
{
  PhotoLibraryServicesCoreLibrary();
  Class result = objc_getClass("PLPrivacy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPLPrivacyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPLPrivacyClass_block_invoke_cold_1();
    return (Class)PhotoLibraryServicesCoreLibrary();
  }
  return result;
}

uint64_t PhotoLibraryServicesCoreLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __PhotoLibraryServicesCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5D980;
    uint64_t v5 = 0;
    PhotoLibraryServicesCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PhotoLibraryServicesCoreLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PhotoLibraryServicesCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoLibraryServicesCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PhotoLibraryServicesCoreLibrary();
  uint64_t result = dlsym(v2, "PLPhotosPickerLogClientBundleIdentifierKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PhotoLibraryServicesCoreLibrary();
  uint64_t result = dlsym(v2, "PLPhotosPickerLogPresentedTimestampKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhotosUICoreLibraryCore()
{
  if (!PhotosUICoreLibraryCore_frameworkLibrary) {
    PhotosUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return PhotosUICoreLibraryCore_frameworkLibrary;
}

uint64_t getPXTCCSettingsFullAccessSubtitleSymbolLoc()
{
  uint64_t v3 = 0;
  long long v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr;
  uint64_t v6 = getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr)
  {
    id v1 = (void *)PhotosUICoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "PXTCCSettingsFullAccessSubtitle");
    getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A65BDD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PhotosUICoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosUICoreLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPXTCCSettingsFullAccessSubtitleSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PhotosUICoreLibrary();
  uint64_t result = dlsym(v2, "PXTCCSettingsFullAccessSubtitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhotosUICoreLibrary()
{
  uint64_t v0 = PhotosUICoreLibraryCore();
  if (!v0)
  {
    long long v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getPXTCCSettingsLimitedAccessSubtitleSymbolLoc()
{
  uint64_t v3 = 0;
  long long v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr;
  uint64_t v6 = getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr)
  {
    id v1 = (void *)PhotosUICoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "PXTCCSettingsLimitedAccessSubtitle");
    getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A65BDF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PhotosUICoreLibrary();
  uint64_t result = dlsym(v2, "PXTCCSettingsLimitedAccessSubtitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TCCLibraryCore()
{
  if (!TCCLibraryCore_frameworkLibrary) {
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return TCCLibraryCore_frameworkLibrary;
}

uint64_t gettcc_server_message_prompt_authorization_valueSymbolLoc()
{
  uint64_t v3 = 0;
  long long v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr;
  uint64_t v6 = gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr;
  if (!gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke;
    v2[3] = &unk_1E5C5D4D8;
    v2[4] = &v3;
    __gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A65BE178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __TCCLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TCCLibraryCore_frameworkLibrary = result;
  return result;
}

void *__gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)TCCLibraryCore();
  if (!v2)
  {
    long long v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "tcc_server_message_prompt_authorization_value");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void sub_1A65BE498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65BF56C(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A65C00BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a15) {
    (*(void (**)(void))(a15 + 16))();
  }
  _Unwind_Resume(exception_object);
}

void sub_1A65C00F4(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1A65C00CCLL);
}

id getNudityDetectionPreferencesHelperClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNudityDetectionPreferencesHelperClass_softClass;
  uint64_t v7 = getNudityDetectionPreferencesHelperClass_softClass;
  if (!getNudityDetectionPreferencesHelperClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNudityDetectionPreferencesHelperClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getNudityDetectionPreferencesHelperClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65C0660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65C0AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACActivityAuthorizationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getACActivityAuthorizationClass_softClass;
  uint64_t v7 = getACActivityAuthorizationClass_softClass;
  if (!getACActivityAuthorizationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getACActivityAuthorizationClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getACActivityAuthorizationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65C0D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65C1180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A65C1AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFOAuthorizationCenterClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getFOAuthorizationCenterClass_softClass;
  uint64_t v7 = getFOAuthorizationCenterClass_softClass;
  if (!getFOAuthorizationCenterClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFOAuthorizationCenterClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getFOAuthorizationCenterClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65C1E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65C2138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1A65C2D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A65C4580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65C4E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_1A65C51D0(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A65C611C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65C7484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A65C79AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getPRSettingsProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRSettingsProviderClass_softClass;
  uint64_t v7 = getPRSettingsProviderClass_softClass;
  if (!getPRSettingsProviderClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRSettingsProviderClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getPRSettingsProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65C808C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBBObserverClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!BulletinBoardLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __BulletinBoardLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DB78;
    uint64_t v6 = 0;
    BulletinBoardLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!BulletinBoardLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BBObserver");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getBBObserverClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBBObserverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BulletinBoardLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BulletinBoardLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNudityDetectionPreferencesHelperClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CommunicationSafetySettingsUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CommunicationSafetySettingsUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DB90;
    uint64_t v6 = 0;
    CommunicationSafetySettingsUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!CommunicationSafetySettingsUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NudityDetectionPreferencesHelper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getNudityDetectionPreferencesHelperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNudityDetectionPreferencesHelperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CommunicationSafetySettingsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CommunicationSafetySettingsUILibraryCore_frameworkLibrary = result;
  return result;
}

void __getACActivityCenterClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ACActivityCenter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getACActivityCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getACActivityCenterClass_block_invoke_cold_1();
    ActivityKitLibrary();
  }
}

void ActivityKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ActivityKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ActivityKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C5DBA8;
    uint64_t v3 = 0;
    ActivityKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!ActivityKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ActivityKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ActivityKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getACActivityAuthorizationClass_block_invoke(uint64_t a1)
{
  ActivityKitLibrary();
  Class result = objc_getClass("ACActivityAuthorization");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getACActivityAuthorizationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getACActivityAuthorizationClass_block_invoke_cold_1();
    return (Class)MomentsOnboardingAndSettingsLibraryCore_0(v3);
  }
  return result;
}

uint64_t MomentsOnboardingAndSettingsLibraryCore_0()
{
  if (!MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary_0) {
    MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary_0;
}

uint64_t __MomentsOnboardingAndSettingsLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getPSAppCellularUsageSpecifierClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SettingsCellularLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SettingsCellularLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DBD8;
    uint64_t v6 = 0;
    SettingsCellularLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!SettingsCellularLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PSAppCellularUsageSpecifier");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getPSAppCellularUsageSpecifierClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPSAppCellularUsageSpecifierClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SettingsCellularLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SettingsCellularLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getFOAuthorizationCenterClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FamilyControlsObjCLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FamilyControlsObjCLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DBF0;
    uint64_t v6 = 0;
    FamilyControlsObjCLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!FamilyControlsObjCLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FOAuthorizationCenter");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getFOAuthorizationCenterClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFOAuthorizationCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FamilyControlsObjCLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FamilyControlsObjCLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getADTrackingTransparencyClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!LimitAdTrackingLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __LimitAdTrackingLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DC08;
    uint64_t v6 = 0;
    LimitAdTrackingLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!LimitAdTrackingLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ADTrackingTransparency");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getADTrackingTransparencyClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getADTrackingTransparencyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LimitAdTrackingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LimitAdTrackingLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getDOCDocumentSourceClass_block_invoke(uint64_t a1)
{
  if (!DocumentManagerLibrary_frameworkLibrary) {
    DocumentManagerLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/DocumentManager.framework/DocumentManager", 2);
  }
  Class result = objc_getClass("DOCDocumentSource");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDOCDocumentSourceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getDOCDocumentSourceClass_block_invoke_cold_1();
    return (Class)__getPRSettingsProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getPRSettingsProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ProximityReaderLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ProximityReaderLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DC20;
    uint64_t v6 = 0;
    ProximityReaderLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!ProximityReaderLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PRSettingsProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getPRSettingsProviderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPRSettingsProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ProximityReaderLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ProximityReaderLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A65CA8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65CAB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose((const void *)(v6 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1A65CAC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65CAEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65CB3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A65CB5C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65CBDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAnalyticsWorkspaceClass_block_invoke(uint64_t a1)
{
  if (!SymptomAnalyticsLibrary_frameworkLibrary) {
    SymptomAnalyticsLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomAnalytics.framework/SymptomAnalytics", 2);
  }
  Class result = objc_getClass("AnalyticsWorkspace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAnalyticsWorkspaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAnalyticsWorkspaceClass_block_invoke_cold_1();
    return __getProcessAnalyticsClass_block_invoke(v3);
  }
  return result;
}

Class __getProcessAnalyticsClass_block_invoke(uint64_t a1)
{
  if (!SymptomAnalyticsLibrary_frameworkLibrary) {
    SymptomAnalyticsLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomAnalytics.framework/SymptomAnalytics", 2);
  }
  Class result = objc_getClass("ProcessAnalytics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getProcessAnalyticsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getProcessAnalyticsClass_block_invoke_cold_1();
    return (Class)__getPRSettingsProviderClass_block_invoke_0(v3);
  }
  return result;
}

Class __getPRSettingsProviderClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ProximityReaderLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ProximityReaderLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DC80;
    uint64_t v6 = 0;
    ProximityReaderLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!ProximityReaderLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PRSettingsProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getPRSettingsProviderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPRSettingsProviderClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ProximityReaderLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ProximityReaderLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getFOAuthorizationCenterClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FamilyControlsObjCLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FamilyControlsObjCLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DC98;
    uint64_t v6 = 0;
    FamilyControlsObjCLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!FamilyControlsObjCLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FOAuthorizationCenter");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getFOAuthorizationCenterClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFOAuthorizationCenterClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FamilyControlsObjCLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  FamilyControlsObjCLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id getOBPrivacyPresenterClass_0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getOBPrivacyPresenterClass_softClass_0;
  uint64_t v7 = getOBPrivacyPresenterClass_softClass_0;
  if (!getOBPrivacyPresenterClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getOBPrivacyPresenterClass_block_invoke_0;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getOBPrivacyPresenterClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65CCA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBPrivacyPresenterClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __OnBoardingKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DCB0;
    uint64_t v6 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("OBPrivacyPresenter");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getOBPrivacyPresenterClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getOBPrivacyPresenterClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1A65CDC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBTextWelcomeControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __OnBoardingKitLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DCC8;
    uint64_t v6 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!OnBoardingKitLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("OBTextWelcomeController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getOBTextWelcomeControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getOBTextWelcomeControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1A65CE174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVSAccountStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VideoSubscriberAccountLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VideoSubscriberAccountLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DCE0;
    uint64_t v6 = 0;
    VideoSubscriberAccountLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!VideoSubscriberAccountLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VSAccountStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getVSAccountStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVSAccountStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VideoSubscriberAccountLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VideoSubscriberAccountLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A65CE5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFKPrivacySettingsControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FinanceKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FinanceKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DCF8;
    uint64_t v6 = 0;
    FinanceKitLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!FinanceKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FKPrivacySettingsController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getFKPrivacySettingsControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFKPrivacySettingsControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FinanceKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FinanceKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A65D02F0(_Unwind_Exception *a1)
{
}

void sub_1A65D0554(_Unwind_Exception *a1)
{
}

void sub_1A65D0914(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A65D0B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke();
  _Unwind_Resume(a1);
}

void sub_1A65D0FF0(_Unwind_Exception *a1)
{
}

void sub_1A65D1244(_Unwind_Exception *a1)
{
}

void sub_1A65D1498(_Unwind_Exception *a1)
{
}

void sub_1A65D2780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getOBPrivacyAppleIDIdentifier()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getOBPrivacyAppleIDIdentifierSymbolLoc_ptr;
  uint64_t v8 = getOBPrivacyAppleIDIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyAppleIDIdentifierSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)OnBoardingKitLibrary();
    v6[3] = (uint64_t)dlsym(v1, "OBPrivacyAppleIDIdentifier");
    getOBPrivacyAppleIDIdentifierSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

void sub_1A65D2B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAKAppleIDAuthenticationInAppContextClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
  uint64_t v7 = getAKAppleIDAuthenticationInAppContextClass_softClass;
  if (!getAKAppleIDAuthenticationInAppContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAKAppleIDAuthenticationInAppContextClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65D3480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAKAuthenticationNewAppleIDSetupInfoKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_ptr;
  uint64_t v8 = getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_ptr;
  if (!getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_ptr)
  {
    id v1 = (void *)AuthKitLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AKAuthenticationNewAppleIDSetupInfoKey");
    getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

id getAKAppleIDAuthenticationErrorDomain()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr;
  uint64_t v8 = getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr;
  if (!getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr)
  {
    id v1 = (void *)AuthKitLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AKAppleIDAuthenticationErrorDomain");
    getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

void sub_1A65D42F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A65D4900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A65D51B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A65D5700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBBundleClass_block_invoke(uint64_t a1)
{
  OnBoardingKitLibrary();
  Class result = objc_getClass("OBBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBBundleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBBundleClass_block_invoke_cold_1();
    return (Class)OnBoardingKitLibrary();
  }
  return result;
}

uint64_t OnBoardingKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary_2)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __OnBoardingKitLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5DEB8;
    uint64_t v5 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = OnBoardingKitLibraryCore_frameworkLibrary_2;
  uint64_t v1 = (void *)v3[0];
  if (!OnBoardingKitLibraryCore_frameworkLibrary_2)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void *__getOBPrivacyAppleIDIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyAppleIDIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyAppleIDIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getOBPrivacyPresenterClass_block_invoke_1(uint64_t a1)
{
  OnBoardingKitLibrary();
  Class result = objc_getClass("OBPrivacyPresenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBPrivacyPresenterClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getOBPrivacyPresenterClass_block_invoke_cold_1();
    return (Class)__getAKAppleIDAuthenticationInAppContextClass_block_invoke(v3);
  }
  return result;
}

Class __getAKAppleIDAuthenticationInAppContextClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AuthKitUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AuthKitUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DED0;
    uint64_t v6 = 0;
    AuthKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!AuthKitUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AKAppleIDAuthenticationInAppContext");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAKAppleIDAuthenticationInAppContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AuthKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AuthKitLibrary();
  uint64_t result = dlsym(v2, "AKAuthenticationNewAppleIDSetupInfoKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AuthKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AuthKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5DEE8;
    uint64_t v5 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AuthKitLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AuthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAKAppleIDAuthenticationErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AuthKitLibrary();
  uint64_t result = dlsym(v2, "AKAppleIDAuthenticationErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAADeviceInfoClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AADeviceInfo");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAADeviceInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAADeviceInfoClass_block_invoke_cold_1();
    AppleAccountLibrary();
  }
}

void AppleAccountLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppleAccountLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C5DF00;
    uint64_t v3 = 0;
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppleAccountLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleAccountLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAAURLConfigurationClass_block_invoke(uint64_t a1)
{
  AppleAccountLibrary();
  Class result = objc_getClass("AAURLConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAAURLConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAAURLConfigurationClass_block_invoke_cold_1();
    return (Class)__getRemoteUIControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getRemoteUIControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!RemoteUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __RemoteUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DF18;
    uint64_t v6 = 0;
    RemoteUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!RemoteUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("RemoteUIController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getRemoteUIControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getRemoteUIControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RemoteUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RemoteUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getiCloudMailAccountProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!iCloudMailAccountUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __iCloudMailAccountUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DF30;
    uint64_t v6 = 0;
    iCloudMailAccountUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!iCloudMailAccountUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("iCloudMailAccountProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getiCloudMailAccountProviderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getiCloudMailAccountProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudMailAccountUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudMailAccountUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKAppleIDAuthenticationControllerClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  Class result = objc_getClass("AKAppleIDAuthenticationController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    return (Class)PSHasStockholmPass(v3);
  }
  return result;
}

BOOL PSHasStockholmPass()
{
  id PKPassLibraryClass = getPKPassLibraryClass();
  if (![PKPassLibraryClass isPassLibraryAvailable]) {
    return 0;
  }
  id v1 = objc_alloc_init((Class)PKPassLibraryClass);
  long long v2 = [v1 passesOfType:1];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

id getPKPassLibraryClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPKPassLibraryClass_softClass;
  uint64_t v7 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPKPassLibraryClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getPKPassLibraryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65D6860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PSStockholmLocallyStoredValuePassNames()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  id PKPassLibraryClass = (objc_class *)getPKPassLibraryClass();
  if ([(objc_class *)PKPassLibraryClass isPassLibraryAvailable])
  {
    id v2 = objc_alloc_init(PKPassLibraryClass);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v3 = objc_msgSend(v2, "paymentPassesWithLocallyStoredValue", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) localizedDescription];
          if (v8) {
            [v0 addObject:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  return v0;
}

id PSLocalizableStockholmStringForKey(void *a1)
{
  id v1 = a1;
  id v2 = PSPreferencesFrameworkBundle();
  BOOL v3 = [v2 localizedStringForKey:v1 value:&stru_1EFB51FD0 table:@"Payment_Prefs"];

  return v3;
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PassKitCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5DF48;
    uint64_t v6 = 0;
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!PassKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PKPassLibrary");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getPKPassLibraryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPKPassLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A65D7620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A65D7F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1A65D95F8()
{
}

uint64_t TopToBottomLeftToRightViewCompare(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 frame];
  double v6 = v5;
  [v4 frame];
  objc_msgSend(v3, "convertRect:fromView:", v4);
  if (v6 < v7)
  {
LABEL_5:
    uint64_t v11 = -1;
    goto LABEL_6;
  }
  [v3 frame];
  double v9 = v8;
  [v4 frame];
  objc_msgSend(v3, "convertRect:fromView:", v4);
  if (v9 <= v10)
  {
    [v3 frame];
    double v13 = v12;
    [v4 frame];
    objc_msgSend(v3, "convertRect:fromView:", v4);
    if (v13 >= v14)
    {
      [v3 frame];
      double v17 = v16;
      [v4 frame];
      objc_msgSend(v3, "convertRect:fromView:", v4);
      uint64_t v11 = v17 > v18;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v11 = 1;
LABEL_6:

  return v11;
}

void sub_1A65D9E70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65DA1A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65DA2F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65DC6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1A65DF0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A65E0128(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65E03BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

Class __getBFFStyleClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SetupAssistantUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SetupAssistantUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5E0F8;
    uint64_t v6 = 0;
    SetupAssistantUILibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SetupAssistantUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getBFFStyleClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBFFStyleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantUILibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

Class __getBFFStyleClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SetupAssistantUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5E110;
    uint64_t v6 = 0;
    SetupAssistantUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getBFFStyleClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBFFStyleClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1A65E310C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNPSDomainAccessorClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNPSDomainAccessorClass_softClass;
  uint64_t v7 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNPSDomainAccessorClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65E31F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("NPSDomainAccessor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSDomainAccessorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNPSDomainAccessorClass_block_invoke_cold_1();
    NanoPreferencesSyncLibrary();
  }
}

void NanoPreferencesSyncLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __NanoPreferencesSyncLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C5E1D0;
    uint64_t v3 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

PSSetupController *__getNPSManagerClass_block_invoke(uint64_t a1)
{
  NanoPreferencesSyncLibrary();
  uint64_t result = (PSSetupController *)objc_getClass("NPSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNPSManagerClass_block_invoke_cold_1();
    return [(PSSetupController *)v3 init];
  }
  return result;
}

void sub_1A65E6F04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65E701C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(v10);
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A65E7414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A65E75A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65E96C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A65E9CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PSStorageLocStr(void *a1)
{
  id v1 = a1;
  long long v2 = PSPreferencesFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:v1 table:@"Localizable"];

  return v3;
}

void sub_1A65F117C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPXTCCPhotoGridViewClass_block_invoke(uint64_t a1)
{
  PhotosUICoreLibrary_0();
  Class result = objc_getClass("PXTCCPhotoGridView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPXTCCPhotoGridViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPXTCCPhotoGridViewClass_block_invoke_cold_1();
    return (Class)PhotosUICoreLibrary_0();
  }
  return result;
}

uint64_t PhotosUICoreLibrary_0()
{
  uint64_t v0 = PhotosUICoreLibraryCore_0();
  if (!v0)
  {
    long long v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t PhotosUICoreLibraryCore_0()
{
  if (!PhotosUICoreLibraryCore_frameworkLibrary_0) {
    PhotosUICoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return PhotosUICoreLibraryCore_frameworkLibrary_0;
}

uint64_t __PhotosUICoreLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PhotosUICoreLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t getPXTCCSettingsGridTitleSymbolLoc()
{
  uint64_t v3 = 0;
  SEL v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPXTCCSettingsGridTitleSymbolLoc_ptr;
  uint64_t v6 = getPXTCCSettingsGridTitleSymbolLoc_ptr;
  if (!getPXTCCSettingsGridTitleSymbolLoc_ptr)
  {
    id v1 = (void *)PhotosUICoreLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PXTCCSettingsGridTitle");
    getPXTCCSettingsGridTitleSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A65F146C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPXTCCSettingsGridTitleSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PhotosUICoreLibrary_0();
  uint64_t result = dlsym(v2, "PXTCCSettingsGridTitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPXTCCSettingsGridTitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getPXTCCSettingsGridSubtitleSymbolLoc()
{
  uint64_t v3 = 0;
  SEL v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPXTCCSettingsGridSubtitleSymbolLoc_ptr;
  uint64_t v6 = getPXTCCSettingsGridSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsGridSubtitleSymbolLoc_ptr)
  {
    id v1 = (void *)PhotosUICoreLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PXTCCSettingsGridSubtitle");
    getPXTCCSettingsGridSubtitleSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A65F15AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPXTCCSettingsGridSubtitleSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PhotosUICoreLibrary_0();
  uint64_t result = dlsym(v2, "PXTCCSettingsGridSubtitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPXTCCSettingsGridSubtitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A65F54C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

id CreateRangeTitleLabel()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  id v1 = [MEMORY[0x1E4F428B8] clearColor];
  [v0 setBackgroundColor:v1];

  long long v2 = +[PSListController appearance];
  uint64_t v3 = [v2 textColor];
  [v0 setTextColor:v3];

  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v4) = 1144750080;
  [v0 setContentCompressionResistancePriority:0 forAxis:v4];
  return v0;
}

id CreateRangeTimeLabel()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  id v1 = [MEMORY[0x1E4F428B8] tableCellBlueTextColor];
  [v0 setTextColor:v1];

  long long v2 = [MEMORY[0x1E4F428B8] clearColor];
  [v0 setBackgroundColor:v2];

  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v3) = 1144750080;
  [v0 setContentCompressionResistancePriority:0 forAxis:v3];
  return v0;
}

void sub_1A65F85A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65F8680(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A65F886C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1A65F8A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

uint64_t PSPNCreateFormattedStringWithCountry(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  double v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))getPNCreateFormattedStringWithCountrySymbolLoc_ptr;
  uint64_t v11 = getPNCreateFormattedStringWithCountrySymbolLoc_ptr;
  if (!getPNCreateFormattedStringWithCountrySymbolLoc_ptr)
  {
    uint64_t v5 = (void *)PhoneNumbersLibrary();
    v9[3] = (uint64_t)dlsym(v5, "PNCreateFormattedStringWithCountry");
    getPNCreateFormattedStringWithCountrySymbolLoc_ptr = (_UNKNOWN *)v9[3];
    double v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    uint64_t v7 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return v4(a1, a2, 2, 0);
}

void sub_1A65FCD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

id getkSecureBackupCountryCodeKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getkSecureBackupCountryCodeKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupCountryCodeKeySymbolLoc_ptr;
  if (!getkSecureBackupCountryCodeKeySymbolLoc_ptr)
  {
    id v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupCountryCodeKey");
    getkSecureBackupCountryCodeKeySymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

void *__getPNCreateFormattedStringWithCountrySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PhoneNumbersLibrary();
  uint64_t result = dlsym(v2, "PNCreateFormattedStringWithCountry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPNCreateFormattedStringWithCountrySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhoneNumbersLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhoneNumbersLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __PhoneNumbersLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5E678;
    uint64_t v5 = 0;
    PhoneNumbersLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PhoneNumbersLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!PhoneNumbersLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PhoneNumbersLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhoneNumbersLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkSecureBackupSMSTargetInfoKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupSMSTargetInfoKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CloudServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CloudServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5E690;
    uint64_t v5 = 0;
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CloudServicesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CloudServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupSMSTargetPhoneNumberKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupCountryDialCodeKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupCountryDialCodeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupCountryDialCodeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupCountryCodeKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupCountryCodeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupCountryCodeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupMetadataKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupMetadataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkSecureBackupMetadataKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupMetadataKeySymbolLoc_ptr_0;
  uint64_t v8 = getkSecureBackupMetadataKeySymbolLoc_ptr_0;
  if (!getkSecureBackupMetadataKeySymbolLoc_ptr_0)
  {
    id v1 = (void *)CloudServicesLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupMetadataKey");
    getkSecureBackupMetadataKeySymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    long long v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;
  return v2;
}

id getSecureBackupClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSecureBackupClass_softClass;
  uint64_t v7 = getSecureBackupClass_softClass;
  if (!getSecureBackupClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSecureBackupClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getSecureBackupClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A65FFE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A66011DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkSecureBackupRecordStatusKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  uint64_t result = dlsym(v2, "kSecureBackupRecordStatusKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecordStatusKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CloudServicesLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CloudServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CloudServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5E748;
    uint64_t v5 = 0;
    CloudServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = CloudServicesLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!CloudServicesLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CloudServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CloudServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getkSecureBackupRecordStatusInvalidSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  uint64_t result = dlsym(v2, "kSecureBackupRecordStatusInvalid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecordStatusInvalidSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupEscrowTrustStatusKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  uint64_t result = dlsym(v2, "kSecureBackupEscrowTrustStatusKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupEscrowTrustStatusKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupIsEnabledKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  uint64_t result = dlsym(v2, "kSecureBackupIsEnabledKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupIsEnabledKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUsesRandomPassphraseKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  uint64_t result = dlsym(v2, "kSecureBackupUsesRandomPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupMetadataKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  uint64_t result = dlsym(v2, "kSecureBackupMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupMetadataKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUsesComplexPassphraseKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  uint64_t result = dlsym(v2, "kSecureBackupUsesComplexPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUsesNumericPassphraseKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  uint64_t result = dlsym(v2, "kSecureBackupUsesNumericPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSecureBackupClass_block_invoke(uint64_t a1)
{
  CloudServicesLibrary_0();
  Class result = objc_getClass("SecureBackup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSecureBackupClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSecureBackupClass_block_invoke_cold_1();
    return (Class)__getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_block_invoke_0(v3);
  }
  return result;
}

void *__getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  Class result = dlsym(v2, "kSecureBackupSMSTargetPhoneNumberKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupCountryDialCodeKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  Class result = dlsym(v2, "kSecureBackupCountryDialCodeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupCountryCodeKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  Class result = dlsym(v2, "kSecureBackupCountryCodeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupCountryCodeKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAuthenticationAppleIDSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  Class result = dlsym(v2, "kSecureBackupAuthenticationAppleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAuthenticationPasswordSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  Class result = dlsym(v2, "kSecureBackupAuthenticationPassword");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationPasswordSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CloudServicesLibrary_0();
  Class result = dlsym(v2, "kSecureBackupErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PSKeychainSyncIsUsingICDP()
{
  id CDPAccountClass = getCDPAccountClass();
  id v1 = [getCDPAccountClass() sharedInstance];
  long long v2 = [v1 primaryAccountDSID];
  uint64_t v3 = [CDPAccountClass isICDPEnabledForDSID:v2];

  return v3;
}

id getCDPAccountClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCDPAccountClass_softClass;
  uint64_t v7 = getCDPAccountClass_softClass;
  if (!getCDPAccountClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCDPAccountClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getCDPAccountClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A6601DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSKeychainSyncGetStatus(void *a1)
{
  if (!PSKeychainSyncIsUsingICDP())
  {
    uint64_t v5 = [MEMORY[0x1E4F179C8] defaultStore];
    uint64_t v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
    if (v6)
    {
      unsigned int v7 = SOSCCThisDeviceIsInCircle();
      if (v7 <= 3)
      {
        uint64_t v4 = dword_1A667F530[v7];
        goto LABEL_13;
      }
    }
    else if (a1)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:3 userInfo:0];
      uint64_t v4 = 0;
      *a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

      return v4;
    }
    uint64_t v4 = 0;
    goto LABEL_13;
  }
  int v2 = [getCDPKeychainSyncClass() isUserVisibleKeychainSyncEnabled];
  uint64_t v3 = @"DISABLED";
  if (v2)
  {
    uint64_t v3 = @"ENABLED";
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 1;
  }
  NSLog(&cfstr_IcdpUserVisibl.isa, v3);
  return v4;
}

id getCDPKeychainSyncClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCDPKeychainSyncClass_softClass;
  uint64_t v7 = getCDPKeychainSyncClass_softClass;
  if (!getCDPKeychainSyncClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCDPKeychainSyncClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getCDPKeychainSyncClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A6601FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSKeychainSyncGetCircleMembershipStatus(unsigned char *a1, BOOL *a2)
{
  uint64_t v4 = SOSCCThisDeviceIsInCircle();
  if (v4 >= 4)
  {
    NSLog(&cfstr_UnexpectedCirc.isa, v4);
    return 0;
  }
  else
  {
    if (a1) {
      *a1 = (7u >> (v4 & 0xF)) & 1;
    }
    if (a2) {
      *a2 = (v4 & 0xF) == 0;
    }
    return 1;
  }
}

uint64_t PSIsUsingPasscode(BOOL *a1)
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v3 = v2;
  if (a1) {
    *a1 = [v2 unlockScreenType] == 0;
  }
  uint64_t v4 = [v3 isPasscodeSet];

  return v4;
}

id PSSecureBackupAccountInfo(void *a1, char a2)
{
  uint64_t v4 = PSSecureBackupAccountInfo__infoQueue;
  if (!PSSecureBackupAccountInfo__infoQueue)
  {
    dispatch_queue_t v5 = dispatch_queue_create("preferences-securebackup-info", 0);
    uint64_t v6 = (void *)PSSecureBackupAccountInfo__infoQueue;
    PSSecureBackupAccountInfo__infoQueue = (uint64_t)v5;

    uint64_t v4 = PSSecureBackupAccountInfo__infoQueue;
  }
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5;
  double v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __PSSecureBackupAccountInfo_block_invoke;
  block[3] = &unk_1E5C5E778;
  char v11 = a2;
  block[4] = &v12;
  block[5] = &v18;
  dispatch_sync(v4, block);
  if (a1)
  {
    uint64_t v7 = (void *)v13[5];
    if (v7) {
      *a1 = v7;
    }
  }
  id v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __PSSecureBackupAccountInfo_block_invoke(uint64_t a1)
{
  if (!PSSecureBackupAccountInfo__secureBackup)
  {
    id v2 = objc_alloc_init((Class)getSecureBackupClass_0());
    uint64_t v3 = (void *)PSSecureBackupAccountInfo__secureBackup;
    PSSecureBackupAccountInfo__secureBackup = (uint64_t)v2;
  }
  uint64_t v4 = (void *)PSSecureBackupAccountInfo__accountInfoDict;
  if (!PSSecureBackupAccountInfo__accountInfoDict || *(unsigned char *)(a1 + 48))
  {
    PSSecureBackupAccountInfo__accountInfoDict = 0;

    id v13 = 0;
    uint64_t v5 = [(id)PSSecureBackupAccountInfo__secureBackup getAccountInfoWithInfo:0 results:&v13];
    id v6 = v13;
    id v7 = v13;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v5;

    objc_storeStrong((id *)&PSSecureBackupAccountInfo__accountInfoDict, v6);
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
      NSLog(&cfstr_ErrorLoadingAc.isa, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    }

    uint64_t v4 = (void *)PSSecureBackupAccountInfo__accountInfoDict;
  }
  uint64_t v10 = [v4 copy];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

id getSecureBackupClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSecureBackupClass_softClass_0;
  uint64_t v7 = getSecureBackupClass_softClass_0;
  if (!getSecureBackupClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSecureBackupClass_block_invoke_0;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getSecureBackupClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A6602454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSIsKeychainSecureBackupEnabled(void *a1)
{
  id v1 = PSSecureBackupAccountInfo(a1, 1);
  id v2 = getkSecureBackupIsEnabledKey();
  uint64_t v3 = [v1 objectForKey:v2];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

id getkSecureBackupIsEnabledKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupIsEnabledKeySymbolLoc_ptr_0;
  uint64_t v8 = getkSecureBackupIsEnabledKeySymbolLoc_ptr_0;
  if (!getkSecureBackupIsEnabledKeySymbolLoc_ptr_0)
  {
    id v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupIsEnabledKey");
    getkSecureBackupIsEnabledKeySymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

void PSShowEnableKeychainSync(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (PSKeychainSyncIsUsingICDP())
  {
    id CDPKeychainSyncClass = getCDPKeychainSyncClass();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __PSShowEnableKeychainSync_block_invoke;
    v10[3] = &unk_1E5C5E7C8;
    id v13 = v7;
    id v11 = v6;
    id v12 = v5;
    [CDPKeychainSyncClass setUserVisibleKeychainSyncEnabled:1 withCompletion:v10];
  }
  else
  {
    uint64_t v9 = +[PSKeychainSyncManager sharedManager];
    [v9 showEnableSyncFlowWithSpecifier:v5 overController:v6 completion:v7];
  }
}

void __PSShowEnableKeychainSync_block_invoke(id *a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = (void (*)(void))*((void *)a1[6] + 2);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  uint64_t v8 = [v5 domain];
  uint64_t v9 = getCDPStateErrorDomain();
  if ([v8 isEqualToString:v9])
  {
    uint64_t v10 = [v6 code];

    if (v10 == -5700)
    {
      id v11 = objc_opt_new();
      id v12 = objc_msgSend(v11, "aa_primaryAppleAccount");
      id v13 = objc_alloc_init((Class)getCDPContextClass());
      uint64_t v14 = objc_msgSend(v12, "aa_appleId");
      [v13 setAppleID:v14];

      uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
      double v16 = objc_msgSend(v12, "aa_personID");
      id v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "integerValue"));
      [v13 setDsid:v17];

      uint64_t v18 = (void *)[objc_alloc((Class)getCDPStateControllerClass()) initWithContext:v13];
      long long v19 = (void *)[objc_alloc((Class)getCDPUIControllerClass()) initWithPresentingViewController:a1[4]];
      [v18 setUiProvider:v19];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __PSShowEnableKeychainSync_block_invoke_2;
      v21[3] = &unk_1E5C5E7A0;
      id v22 = a1[5];
      id v23 = a1[4];
      id v24 = a1[6];
      [v18 repairCloudDataProtectionStateWithCompletion:v21];

      goto LABEL_10;
    }
  }
  else
  {
  }
  id v20 = a1[6];
  if (v20)
  {
    id v7 = (void (*)(void))*((void *)v20 + 2);
    goto LABEL_9;
  }
LABEL_10:
}

id getCDPStateErrorDomain()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getCDPStateErrorDomainSymbolLoc_ptr;
  uint64_t v8 = getCDPStateErrorDomainSymbolLoc_ptr;
  if (!getCDPStateErrorDomainSymbolLoc_ptr)
  {
    id v1 = (void *)CoreCDPLibrary();
    v6[3] = (uint64_t)dlsym(v1, "CDPStateErrorDomain");
    getCDPStateErrorDomainSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getCDPContextClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCDPContextClass_softClass;
  uint64_t v7 = getCDPContextClass_softClass;
  if (!getCDPContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCDPContextClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getCDPContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A6602B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCDPStateControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCDPStateControllerClass_softClass;
  uint64_t v7 = getCDPStateControllerClass_softClass;
  if (!getCDPStateControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCDPStateControllerClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getCDPStateControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A6602BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCDPUIControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCDPUIControllerClass_softClass;
  uint64_t v7 = getCDPUIControllerClass_softClass;
  if (!getCDPUIControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCDPUIControllerClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getCDPUIControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A6602CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PSShowEnableKeychainSync_block_invoke_2(void *a1, int a2, void *a3)
{
  a3;
  if (a2)
  {
    PSShowEnableKeychainSync(a1[4], a1[5], a1[6]);
  }
  else
  {
    uint64_t v5 = a1[6];
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
  }
  return MEMORY[0x1F4181820]();
}

void PSShowKeychainSyncRecovery(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = +[PSKeychainSyncManager sharedManager];
  [v8 showRecoveryFlowWithSpecifier:v7 overController:v6 completion:v5];
}

uint64_t _clearKeychainSyncCache(uint64_t a1, void *a2)
{
  return [a2 _cleanupAppleIDCredentials];
}

uint64_t PSKeychainSyncCircleExists()
{
  uint64_t v0 = SOSCCThisDeviceIsInCircle();
  if ((v0 + 1) < 5) {
    return (0xEu >> (v0 + 1)) & 1;
  }
  NSLog(&cfstr_UnexpectedCirc.isa, v0);
  return 0;
}

id getkSecureBackupMetadataKey_0()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupMetadataKeySymbolLoc_ptr_1;
  uint64_t v8 = getkSecureBackupMetadataKeySymbolLoc_ptr_1;
  if (!getkSecureBackupMetadataKeySymbolLoc_ptr_1)
  {
    id v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupMetadataKey");
    getkSecureBackupMetadataKeySymbolLoc_ptr_1 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupUsesComplexPassphraseKey()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr_0;
  uint64_t v8 = getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr_0;
  if (!getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr_0)
  {
    id v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupUsesComplexPassphraseKey");
    getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupUsesRandomPassphraseKey()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr_0;
  uint64_t v8 = getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr_0;
  if (!getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr_0)
  {
    id v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupUsesRandomPassphraseKey");
    getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupUsesNumericPassphraseKey()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr_0;
  uint64_t v8 = getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr_0;
  if (!getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr_0)
  {
    id v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupUsesNumericPassphraseKey");
    getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupNumericPassphraseLengthKey()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  if (!getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr)
  {
    id v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupNumericPassphraseLengthKey");
    getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAKAppleIDAuthenticationInAppContextClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass_0;
  uint64_t v7 = getAKAppleIDAuthenticationInAppContextClass_softClass_0;
  if (!getAKAppleIDAuthenticationInAppContextClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAKAppleIDAuthenticationInAppContextClass_block_invoke_0;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A66058B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAKAppleIDAuthenticationControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAKAppleIDAuthenticationControllerClass_softClass_0;
  uint64_t v7 = getAKAppleIDAuthenticationControllerClass_softClass_0;
  if (!getAKAppleIDAuthenticationControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAKAppleIDAuthenticationControllerClass_block_invoke_0;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getAKAppleIDAuthenticationControllerClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A6605998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(__CFString *))getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr;
  uint64_t v7 = getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr;
  if (!getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr)
  {
    id v1 = (void *)HSAAuthenticationLibrary();
    v5[3] = (uint64_t)dlsym(v1, "HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier");
    getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    uint64_t v0 = (uint64_t (*)(__CFString *))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0(@"KeychainSyncSMSValidation");
}

void sub_1A6606A9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id getkSecureBackupSMSTargetInfoKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr_0;
  uint64_t v8 = getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr_0;
  if (!getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr_0)
  {
    uint64_t v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupSMSTargetInfoKey");
    getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupSMSTargetPhoneNumberKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_1;
  uint64_t v8 = getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_1;
  if (!getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_1)
  {
    uint64_t v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupSMSTargetPhoneNumberKey");
    getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_1 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupCountryDialCodeKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_1;
  uint64_t v8 = getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_1;
  if (!getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_1)
  {
    uint64_t v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupCountryDialCodeKey");
    getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_1 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupCountryCodeKey_0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupCountryCodeKeySymbolLoc_ptr_1;
  uint64_t v8 = getkSecureBackupCountryCodeKeySymbolLoc_ptr_1;
  if (!getkSecureBackupCountryCodeKeySymbolLoc_ptr_1)
  {
    uint64_t v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupCountryCodeKey");
    getkSecureBackupCountryCodeKeySymbolLoc_ptr_1 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupPassphraseKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupPassphraseKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupPassphraseKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupPassphraseKey");
    getkSecureBackupPassphraseKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupAuthenticationAppleID()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr_0;
  uint64_t v8 = getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr_0;
  if (!getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr_0)
  {
    uint64_t v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupAuthenticationAppleID");
    getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupAuthenticationPassword()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupAuthenticationPasswordSymbolLoc_ptr_0;
  uint64_t v8 = getkSecureBackupAuthenticationPasswordSymbolLoc_ptr_0;
  if (!getkSecureBackupAuthenticationPasswordSymbolLoc_ptr_0)
  {
    uint64_t v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupAuthenticationPassword");
    getkSecureBackupAuthenticationPasswordSymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkSecureBackupErrorDomain()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupErrorDomainSymbolLoc_ptr_0;
  uint64_t v8 = getkSecureBackupErrorDomainSymbolLoc_ptr_0;
  if (!getkSecureBackupErrorDomainSymbolLoc_ptr_0)
  {
    uint64_t v1 = (void *)CloudServicesLibrary_1();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupErrorDomain");
    getkSecureBackupErrorDomainSymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getFTDeviceSupportClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getFTDeviceSupportClass_softClass;
  uint64_t v7 = getFTDeviceSupportClass_softClass;
  if (!getFTDeviceSupportClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFTDeviceSupportClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getFTDeviceSupportClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A660D338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PSHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v2 = (void (*)(id, __CFString *))getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr;
  uint64_t v8 = getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr;
  if (!getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)HSAAuthenticationLibrary();
    v6[3] = (uint64_t)dlsym(v3, "HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier");
    getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    id v2 = (void (*)(id, __CFString *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    uint64_t v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2(v1, @"KeychainSyncSMSValidation");
}

Class __getCDPAccountClass_block_invoke(uint64_t a1)
{
  CoreCDPLibrary();
  Class result = objc_getClass("CDPAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCDPAccountClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCDPAccountClass_block_invoke_cold_1();
    return (Class)CoreCDPLibrary();
  }
  return result;
}

uint64_t CoreCDPLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreCDPLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CoreCDPLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5EE50;
    uint64_t v5 = 0;
    CoreCDPLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreCDPLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!CoreCDPLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CoreCDPLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreCDPLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCDPKeychainSyncClass_block_invoke(uint64_t a1)
{
  CoreCDPLibrary();
  Class result = objc_getClass("CDPKeychainSync");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCDPKeychainSyncClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCDPKeychainSyncClass_block_invoke_cold_1();
    return __getSecureBackupClass_block_invoke_0(v3);
  }
  return result;
}

Class __getSecureBackupClass_block_invoke_0(uint64_t a1)
{
  CloudServicesLibrary_1();
  Class result = objc_getClass("SecureBackup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSecureBackupClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSecureBackupClass_block_invoke_cold_1();
    return (Class)CloudServicesLibrary_1();
  }
  return result;
}

uint64_t CloudServicesLibrary_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CloudServicesLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CloudServicesLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5EE68;
    uint64_t v5 = 0;
    CloudServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = CloudServicesLibraryCore_frameworkLibrary_1;
  id v1 = (void *)v3[0];
  if (!CloudServicesLibraryCore_frameworkLibrary_1)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CloudServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  CloudServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getkSecureBackupIsEnabledKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupIsEnabledKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupIsEnabledKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCDPStateErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreCDPLibrary();
  uint64_t result = dlsym(v2, "CDPStateErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCDPStateErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCDPContextClass_block_invoke(uint64_t a1)
{
  CoreCDPLibrary();
  Class result = objc_getClass("CDPContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCDPContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCDPContextClass_block_invoke_cold_1();
    return (Class)__getCDPStateControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getCDPStateControllerClass_block_invoke(uint64_t a1)
{
  CoreCDPLibrary();
  Class result = objc_getClass("CDPStateController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCDPStateControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCDPStateControllerClass_block_invoke_cold_1();
    return (Class)__getCDPUIControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getCDPUIControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreCDPUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreCDPUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5EE80;
    uint64_t v6 = 0;
    CoreCDPUILibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!CoreCDPUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CDPUIController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getCDPUIControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCDPUIControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreCDPUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreCDPUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkSecureBackupMetadataKeySymbolLoc_block_invoke_1(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupMetadataKeySymbolLoc_ptr_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUsesComplexPassphraseKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupUsesComplexPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUsesRandomPassphraseKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupUsesRandomPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUsesNumericPassphraseKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupUsesNumericPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupNumericPassphraseLengthKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupNumericPassphraseLengthKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAKAppleIDAuthenticationInAppContextClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AuthKitUILibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AuthKitUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5EE98;
    uint64_t v6 = 0;
    AuthKitUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AuthKitUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AKAppleIDAuthenticationInAppContext");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1_0();
LABEL_8:
    free(v2);
  }
  getAKAppleIDAuthenticationInAppContextClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AuthKitUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AuthKitUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getAKAppleIDAuthenticationControllerClass_block_invoke_0(uint64_t a1)
{
  AuthKitLibrary_0();
  Class result = objc_getClass("AKAppleIDAuthenticationController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1_0();
    return (Class)AuthKitLibrary_0();
  }
  return result;
}

uint64_t AuthKitLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AuthKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5EEB0;
    uint64_t v5 = 0;
    AuthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = AuthKitLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!AuthKitLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AuthKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getAKAuthenticationUsernameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AuthKitLibrary_0();
  uint64_t result = dlsym(v2, "AKAuthenticationUsernameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKAuthenticationUsernameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAKAuthenticationRawPasswordKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AuthKitLibrary_0();
  uint64_t result = dlsym(v2, "AKAuthenticationRawPasswordKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKAuthenticationRawPasswordKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAKAuthenticationDSIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AuthKitLibrary_0();
  uint64_t result = dlsym(v2, "AKAuthenticationDSIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKAuthenticationDSIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)HSAAuthenticationLibrary();
  uint64_t result = dlsym(v2, "HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HSAAuthenticationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!HSAAuthenticationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __HSAAuthenticationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5EEC8;
    uint64_t v5 = 0;
    HSAAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = HSAAuthenticationLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!HSAAuthenticationLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HSAAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HSAAuthenticationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAKAuthenticationPasswordKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AuthKitLibrary_0();
  uint64_t result = dlsym(v2, "AKAuthenticationPasswordKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKAuthenticationPasswordKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupSMSTargetInfoKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupSMSTargetInfoKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_block_invoke_1(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupSMSTargetPhoneNumberKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupCountryDialCodeKeySymbolLoc_block_invoke_1(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupCountryDialCodeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupCountryCodeKeySymbolLoc_block_invoke_1(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupCountryCodeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupCountryCodeKeySymbolLoc_ptr_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupPassphraseKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupPassphraseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAuthenticationAppleIDSymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupAuthenticationAppleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAuthenticationPasswordSymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupAuthenticationPassword");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationPasswordSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupErrorDomainSymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupErrorDomainSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupVerificationTokenKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupVerificationTokenKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupVerificationTokenKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAccountIsHighSecurityKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupAccountIsHighSecurityKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAccountIsHighSecurityKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupRecoveryRequiresVerificationTokenKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

Class __getFTDeviceSupportClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FTServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FTServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5EEE0;
    uint64_t v6 = 0;
    FTServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!FTServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FTDeviceSupport");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getFTDeviceSupportClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFTDeviceSupportClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FTServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FTServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)HSAAuthenticationLibrary();
  uint64_t result = dlsym(v2, "HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupRecoveryVerificationTokenLengthKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getkSecureBackupUseCachedPassphraseKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CloudServicesLibrary_1();
  uint64_t result = dlsym(v2, "kSecureBackupUseCachedPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCFPhoneNumberCreateSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PhoneNumbersLibrary_0();
  uint64_t result = dlsym(v2, "CFPhoneNumberCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCFPhoneNumberCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhoneNumbersLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhoneNumbersLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __PhoneNumbersLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5EF20;
    uint64_t v5 = 0;
    PhoneNumbersLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = PhoneNumbersLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!PhoneNumbersLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PhoneNumbersLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PhoneNumbersLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getCFPhoneNumberCreateStringSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PhoneNumbersLibrary_0();
  uint64_t result = dlsym(v2, "CFPhoneNumberCreateString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCFPhoneNumberCreateStringSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupIsEnabledKeySymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!CloudServicesLibraryCore_frameworkLibrary_2)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __CloudServicesLibraryCore_block_invoke_2;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E5C5EFB8;
    uint64_t v7 = 0;
    CloudServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    id v2 = (void *)CloudServicesLibraryCore_frameworkLibrary_2;
    if (CloudServicesLibraryCore_frameworkLibrary_2)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)CloudServicesLibraryCore_frameworkLibrary_2;
LABEL_5:
  uint64_t result = dlsym(v2, "kSecureBackupIsEnabledKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupIsEnabledKeySymbolLoc_ptr_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudServicesLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  CloudServicesLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void *__getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __SetupAssistantLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E5C5EFD0;
    uint64_t v7 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    id v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (SetupAssistantLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A66163D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

uint64_t PSSearchInlineTogglesEnabled()
{
  uint64_t v0 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_msgSend(v0, "sf_isInternalInstall"))
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PSSearchShowToggles", @"com.apple.Preferences", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v2 = AppBooleanValue == 0;
    }
    else {
      BOOL v2 = 1;
    }
    uint64_t v3 = !v2;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id PSSearchFormattedString(void *a1)
{
  id v1 = a1;
  if ([v1 hasSuffix:@":"])
  {
    uint64_t v2 = objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length") - 1);

    id v1 = (id)v2;
  }
  uint64_t v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  long long v4 = [v1 stringByTrimmingCharactersInSet:v3];

  return v4;
}

id SearchEntriesFromSpecifiers(void *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v25 = a3;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v24 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "cellType", v24);
          if (!v15)
          {
            id v16 = v14;

            id v11 = v16;
          }
          id v17 = SearchEntryFromSpecifier(v14, v6);
          uint64_t v18 = v17;
          if (v17)
          {
            [v17 setPlistName:v25];
            if (v15)
            {
              [v18 setGroupSpecifier:v11];
              long long v19 = [v11 name];

              if (v19)
              {
                id v20 = [v11 name];
                [v18 setGroupName:v20];

                uint64_t v21 = [v18 keywords];
                id v22 = [v11 name];
                [v21 addObject:v22];
              }
            }
            [v7 addObject:v18];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }
    else
    {
      id v11 = 0;
    }

    id v5 = v24;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id SearchEntriesFromManifest(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (SearchEntriesFromManifest_onceToken != -1) {
    dispatch_once(&SearchEntriesFromManifest_onceToken, &__block_literal_global_69);
  }
  id v5 = [v4 pathForResource:@"SettingsSearchManifest" ofType:@"plist"];
  if (v5)
  {
    id v6 = [(id)SearchEntriesFromManifest_manifestCache objectForKeyedSubscript:v5];

    if (v6)
    {
      uint64_t v7 = [(id)SearchEntriesFromManifest_manifestCache objectForKeyedSubscript:v5];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
      [(id)SearchEntriesFromManifest_manifestCache setObject:v7 forKeyedSubscript:v5];
    }
    uint64_t v9 = [v7 objectForKeyedSubscript:@"stringTable"];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v7 objectForKeyedSubscript:@"title"];
    }
    uint64_t v12 = v11;

    id v13 = [v4 bundlePath];
    uint64_t v14 = [v13 lastPathComponent];
    uint64_t v15 = [v14 stringByDeletingPathExtension];

    id v16 = [v3 specifier];
    id v17 = SearchSpecifiersFromPlist(v7, v16, v12, v4);

    id v23 = v3;
    id v8 = SearchEntriesFromSpecifiers(v17, v3, 0);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) setManifestBundleName:v15];
        }
        uint64_t v19 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }

    id v3 = v23;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

PSSearchEntry *SearchEntryFromSpecifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    id v6 = 0;
    goto LABEL_12;
  }
  id v5 = v3;
  id v6 = [v5 identifier];
  if (v6)
  {
    uint64_t v7 = [v5 cellType];

    if (v7)
    {
      id v8 = [v5 propertyForKey:@"searchable"];
      uint64_t v9 = v8;
      if (!v8 || ([v8 BOOLValue] & 1) != 0)
      {

        id v6 = [[PSSearchEntry alloc] initWithSpecifier:v5 parent:v4];
        id v5 = [v5 propertyForKey:@"searchBundle"];
        if (v5)
        {
          [(PSSearchEntry *)v6 setBundleName:v5];
        }
        else
        {
          id v11 = [(PSSearchEntry *)v6 bundleName];

          if (!v11)
          {
            uint64_t v12 = [v4 bundleName];
            [(PSSearchEntry *)v6 setBundleName:v12];
          }
        }
        goto LABEL_11;
      }
    }
    id v6 = 0;
  }
LABEL_11:

LABEL_12:
  return v6;
}

uint64_t __SearchEntriesFromManifest_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = SearchEntriesFromManifest_manifestCache;
  SearchEntriesFromManifest_manifestCache = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1A661BB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A661C6A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A661CC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1A6622180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1A6622A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A6622C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A6622E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A662416C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSGetCapabilityBoolAnswer(uint64_t a1)
{
  uint64_t v2 = +[PSCapabilityManager sharedManager];
  uint64_t v3 = [v2 capabilityBoolAnswer:a1];

  return v3;
}

void sub_1A6628B50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A66296D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPSUICellularPlanManagerCacheClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getPSUICellularPlanManagerCacheClass_softClass;
  uint64_t v7 = getPSUICellularPlanManagerCacheClass_softClass;
  if (!getPSUICellularPlanManagerCacheClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPSUICellularPlanManagerCacheClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getPSUICellularPlanManagerCacheClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A6629DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCBClientClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getCBClientClass_softClass;
  uint64_t v7 = getCBClientClass_softClass;
  if (!getCBClientClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCBClientClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getCBClientClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A662A0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRTTTelephonyUtilitiesClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getRTTTelephonyUtilitiesClass_softClass;
  uint64_t v7 = getRTTTelephonyUtilitiesClass_softClass;
  if (!getRTTTelephonyUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRTTTelephonyUtilitiesClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getRTTTelephonyUtilitiesClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A662A370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCAMCaptureCapabilitiesClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getCAMCaptureCapabilitiesClass_softClass;
  uint64_t v7 = getCAMCaptureCapabilitiesClass_softClass;
  if (!getCAMCaptureCapabilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCAMCaptureCapabilitiesClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getCAMCaptureCapabilitiesClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A662A524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXCapabilityManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5F900;
    uint64_t v6 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AXCapabilityManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getAXCapabilityManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXCapabilityManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPGPictureInPictureProxyClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PegasusLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PegasusLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5F918;
    uint64_t v6 = 0;
    PegasusLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PegasusLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PGPictureInPictureProxy");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPGPictureInPictureProxyClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPGPictureInPictureProxyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PegasusLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PegasusLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getADASManagerClass_block_invoke(uint64_t a1)
{
  AudioDataAnalysisLibrary();
  Class result = objc_getClass("ADASManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getADASManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getADASManagerClass_block_invoke_cold_1();
    return (Class)AudioDataAnalysisLibrary();
  }
  return result;
}

uint64_t AudioDataAnalysisLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AudioDataAnalysisLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AudioDataAnalysisLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C5F930;
    uint64_t v5 = 0;
    AudioDataAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AudioDataAnalysisLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!AudioDataAnalysisLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AudioDataAnalysisLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AudioDataAnalysisLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AudioDataAnalysisLibrary();
  uint64_t result = dlsym(v2, "ADAFPreferenceKeyHAENKnownAccessories");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AudioDataAnalysisLibrary();
  uint64_t result = dlsym(v2, "ADAFPreferenceKeyConnectedWiredDeviceIsHeadphone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

Class __getPSUICellularPlanManagerCacheClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SettingsCellularUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SettingsCellularUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5F948;
    uint64_t v6 = 0;
    SettingsCellularUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SettingsCellularUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PSUICellularPlanManagerCache");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPSUICellularPlanManagerCacheClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPSUICellularPlanManagerCacheClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SettingsCellularUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SettingsCellularUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCBClientClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreBrightnessLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreBrightnessLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5F960;
    uint64_t v6 = 0;
    CoreBrightnessLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CoreBrightnessLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CBClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCBClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCBClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreBrightnessLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreBrightnessLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getRTTTelephonyUtilitiesClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!RTTUtilitiesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __RTTUtilitiesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5F978;
    uint64_t v6 = 0;
    RTTUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!RTTUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("RTTTelephonyUtilities");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getRTTTelephonyUtilitiesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getRTTTelephonyUtilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RTTUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RTTUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCAMCaptureCapabilitiesClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CameraUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CameraUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C5F990;
    uint64_t v6 = 0;
    CameraUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CameraUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CAMCaptureCapabilities");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getCAMCaptureCapabilitiesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCAMCaptureCapabilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CameraUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CameraUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_1A662E248(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t SystemHasCapabilities(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[PSCapabilityManager sharedManager];
  uint64_t v3 = [v2 hasCapabilities:v1];

  return v3;
}

id SearchSpecifiersFromPlist(void *a1, void *a2, void *a3, void *a4)
{
  return SearchSpecifiersFromPlistWithCapabilities(a1, a2, a3, a4, 1);
}

id AlignmentFromString(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"UITextAlignmentCenter"] & 1) != 0
    || ([v1 isEqualToString:@"NSCenterTextAlignment"] & 1) != 0
    || ([v1 lowercaseString],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 isEqualToString:@"center"],
        v2,
        (v3 & 1) != 0))
  {
    uint64_t v4 = 2;
  }
  else if (([v1 isEqualToString:@"UITextAlignmentLeft"] & 1) != 0 {
         || ([v1 isEqualToString:@"NSLeftTextAlignment"] & 1) != 0
  }
         || ([v1 lowercaseString],
             uint64_t v7 = objc_claimAutoreleasedReturnValue(),
             char v8 = [v7 isEqualToString:@"left"],
             v7,
             (v8 & 1) != 0))
  {
    uint64_t v4 = 1;
  }
  else if ([v1 isEqualToString:@"UITexitAlignmentRight"])
  {
    uint64_t v4 = 3;
  }
  else
  {
    uint64_t v4 = 3;
    if (([v1 isEqualToString:@"NSRightTextAlignment"] & 1) == 0)
    {
      uint64_t v9 = [v1 lowercaseString];
      int v10 = [v9 isEqualToString:@"right"];

      if (v10) {
        uint64_t v4 = 3;
      }
      else {
        uint64_t v4 = 0xFFFFFFFFLL;
      }
    }
  }
  long long v5 = [MEMORY[0x1E4F28ED0] numberWithInt:v4];

  return v5;
}

void sub_1A6631BD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1A6633124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A66346D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1A6636154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6637788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1A6638804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

id GetImage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v5 = +[PSListController appearance];
  int v6 = [v5 usesDarkTheme];

  if (v6) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = v3;
  }
  char v8 = (void *)MEMORY[0x1E4F42A80];
  id v9 = v7;
  int v10 = PSPreferencesFrameworkBundle();
  uint64_t v11 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v12 = [v11 traitCollection];
  uint64_t v13 = [v8 imageNamed:v9 inBundle:v10 compatibleWithTraitCollection:v12];

  if ((v6 & 1) == 0)
  {
    uint64_t v14 = +[PSListController appearance];
    uint64_t v15 = [v14 textColor];

    if (v15)
    {
      uint64_t v16 = [v13 _flatImageWithColor:v15];

      uint64_t v13 = (void *)v16;
    }
  }
  return v13;
}

id GetImageTemplate(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F42A80];
  id v5 = a1;
  int v6 = PSPreferencesFrameworkBundle();
  uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
  char v8 = [v7 traitCollection];
  id v9 = [v4 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:v8];

  if (v3)
  {
    uint64_t v10 = [v9 _flatImageWithColor:v3];

    id v9 = (void *)v10;
  }

  return v9;
}

__CFString *SUIKCategoryFromSearchableItem(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 attributeSet];
  id v3 = [v2 theme];

  id v4 = [v1 uniqueIdentifier];

  if (!v3)
  {
    id v5 = SFObjectAndOffsetForURLPair();
    int v6 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    uint64_t v7 = [MEMORY[0x1E4F29088] componentsWithURL:v6 resolvingAgainstBaseURL:1];
    char v8 = [v7 path];
    id v9 = [v8 componentsSeparatedByString:@"#"];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v10 componentsSeparatedByString:@"&"];
    uint64_t v12 = [v11 firstObject];
    uint64_t v13 = [v12 componentsSeparatedByString:@"="];

    id v3 = [v13 lastObject];
    if ([(__CFString *)v3 isEqualToString:@"ROOT"])
    {
      uint64_t v14 = [v5 objectForKeyedSubscript:@"offsetItem"];

      id v3 = (__CFString *)v14;
    }
    if (!v3) {
      id v3 = &stru_1EFB51FD0;
    }
  }
  return v3;
}

void sub_1A6641E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A664281C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6643440(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 256));
  _Unwind_Resume(a1);
}

void sub_1A66453D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCommerceRemoteUIDelegateClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!UsageSettingsLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __UsageSettingsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C60348;
    uint64_t v6 = 0;
    UsageSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!UsageSettingsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CommerceRemoteUIDelegate");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCommerceRemoteUIDelegateClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCommerceRemoteUIDelegateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UsageSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UsageSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getCommerceOffersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!iCloudQuotaUILibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __iCloudQuotaUILibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E5C60360;
    uint64_t v7 = 0;
    iCloudQuotaUILibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)iCloudQuotaUILibraryCore_frameworkLibrary;
    if (iCloudQuotaUILibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)iCloudQuotaUILibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "CommerceOffers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCommerceOffersSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudQuotaUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudQuotaUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A664645C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getQuotaRequestManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!UsageSettingsLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __UsageSettingsLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C603A0;
    uint64_t v6 = 0;
    UsageSettingsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!UsageSettingsLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("QuotaRequestManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getQuotaRequestManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getQuotaRequestManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UsageSettingsLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UsageSettingsLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1A66490C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1A6649C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getGMAvailabilityWrapperClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getGMAvailabilityWrapperClass_softClass;
  uint64_t v7 = getGMAvailabilityWrapperClass_softClass;
  if (!getGMAvailabilityWrapperClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getGMAvailabilityWrapperClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getGMAvailabilityWrapperClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A664CF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getGMAvailabilityWrapperClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!GenerativeModelsLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __GenerativeModelsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C604E8;
    uint64_t v6 = 0;
    GenerativeModelsLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!GenerativeModelsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("GMAvailabilityWrapper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getGMAvailabilityWrapperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getGMAvailabilityWrapperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __GenerativeModelsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GenerativeModelsLibraryCore_frameworkLibrary = result;
  return result;
}

id PS_LocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:0];

  return v3;
}

id PS_LocalizedStringForDocumentsPolicy(void *a1)
{
  id v1 = a1;
  uint64_t v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"PSDocumentsPolicy"];

  return v3;
}

id PS_LocalizedStringForSystemPolicy(void *a1)
{
  id v1 = a1;
  uint64_t v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"PSSystemPolicy"];

  return v3;
}

id PS_LocalizedStringForDriverPolicy(void *a1)
{
  id v1 = a1;
  uint64_t v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"PSDriverPolicy"];

  return v3;
}

id PS_LocalizedStringForAppleID(void *a1)
{
  id v1 = a1;
  uint64_t v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"AppleID"];

  return v3;
}

id PS_RebrandedKeyForAppleID(void *a1)
{
  id v1 = a1;
  if (([v1 containsString:@"REBRAND"] & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [v1 stringByAppendingString:@"_REBRAND"];
  }
  id v3 = v2;

  return v3;
}

id PS_LocalizedStringForKeychainSync(void *a1)
{
  id v1 = a1;
  id v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"KeychainSync"];

  return v3;
}

id PS_LocalizedStringForInternational(void *a1)
{
  id v1 = a1;
  id v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"PSInternational"];

  return v3;
}

id PS_LocalizedStringForSoftwareUpdate(void *a1)
{
  id v1 = a1;
  id v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"Software Update"];

  return v3;
}

id PS_LocalizedStringForPINEntry(void *a1)
{
  id v1 = a1;
  id v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"PIN Entry"];

  return v3;
}

id PS_LocalizedStringForAccessories(void *a1)
{
  id v1 = a1;
  id v2 = PSPreferencesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"Accessories"];

  return v3;
}

uint64_t PSGreenTeaLoggerForAppListing()
{
  if (PSGreenTeaLoggerForAppListing_onceToken != -1) {
    dispatch_once(&PSGreenTeaLoggerForAppListing_onceToken, &__block_literal_global_14_0);
  }
  return PSGreenTeaLoggerForAppListing_appListLogger;
}

uint64_t __PSGreenTeaLoggerForAppListing_block_invoke()
{
  uint64_t result = ct_green_tea_logger_create();
  PSGreenTeaLoggerForAppListing_appListLogger = result;
  return result;
}

void PSGreenTeaAppListLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  if (PSGreenTeaLoggerForAppListing_onceToken != -1) {
    dispatch_once(&PSGreenTeaLoggerForAppListing_onceToken, &__block_literal_global_14_0);
  }
  if (PSGreenTeaLoggerForAppListing_appListLogger)
  {
    uint64_t v10 = getCTGreenTeaOsLogHandle();
    uint64_t v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v13 = [v12 bundleIdentifier];
      uint64_t v14 = (void *)[[NSString alloc] initWithFormat:v9 arguments:&a9];
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      _os_log_impl(&dword_1A6597000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);
    }
  }
}

void PSMigrateSoundsDefaults_10_0()
{
  uint64_t v0 = _PSLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "Migrating sounds defaults if needed", v2, 2u);
  }

  id v1 = objc_opt_new();
  [v1 _migrateKey:@"lock-unlock" domain:@"com.apple.springboard" toKey:@"lock-audio" toDomain:@"com.apple.preferences.sounds" migrateCloud:1];
  [v1 _migrateKey:@"keyboard" domain:@"com.apple.preferences.sounds" toKey:@"keyboard-audio" toDomain:@"com.apple.preferences.sounds" migrateCloud:0];
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  CFPreferencesAppSynchronize(@"com.apple.preferences.sounds");
}

void sub_1A664DD98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getBBSettingsGatewayClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!BulletinBoardLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __BulletinBoardLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C60508;
    uint64_t v6 = 0;
    BulletinBoardLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!BulletinBoardLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BBSettingsGateway");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getBBSettingsGatewayClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBBSettingsGatewayClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BulletinBoardLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  BulletinBoardLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id PSConnected298()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F50B70], "sharedInstance", 0);
  uint64_t v1 = [v0 connectedDevices];

  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        long long v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if ([v5 productId] == 8206 && objc_msgSend(v5, "vendorId") == 76)
        {
          id v2 = v5;
          goto LABEL_12;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

id PSConnected698()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F50B70], "sharedInstance", 0);
  uint64_t v1 = [v0 connectedDevices];

  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        long long v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (([v5 productId] == 8212 || objc_msgSend(v5, "productId") == 8228)
          && [v5 vendorId] == 76)
        {
          id v2 = v5;
          goto LABEL_13;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v2;
}

uint64_t PSBTAccessoryListeningMode(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F50B70];
  id v2 = a1;
  uint64_t v3 = [v1 sharedInstance];
  [v3 _accessoryManager];
  [v2 device];

  int ControlCommand = BTAccessoryManagerGetControlCommand();
  if (ControlCommand)
  {
    long long v5 = _PSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = ControlCommand;
      _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get listening mode : %d", buf, 8u);
    }
  }
  uint64_t v6 = _PSLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = 0;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "listening mode : %d", buf, 8u);
  }

  return 0;
}

void PSBTSetAccessoryListeningMode(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F50B70];
  id v2 = a1;
  uint64_t v3 = [v1 sharedInstance];
  [v3 _accessoryManager];
  [v2 device];

  int v4 = BTAccessoryManagerSendControlCommand();
  if (v4)
  {
    long long v5 = _PSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Failed to set listening mode : %d", (uint8_t *)v6, 8u);
    }
  }
}

uint64_t PSWiFiManagerClientCreate(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t, void))getWiFiManagerClientCreateSymbolLoc_ptr;
  int v9 = getWiFiManagerClientCreateSymbolLoc_ptr;
  if (!getWiFiManagerClientCreateSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)MobileWiFiLibrary();
    v7[3] = (uint64_t)dlsym(v3, "WiFiManagerClientCreate");
    getWiFiManagerClientCreateSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    id v2 = (uint64_t (*)(uint64_t, void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    long long v5 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(a1, 0);
}

uint64_t PSWiFiManagerClientScheduleWithRunLoop(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr;
  uint64_t v13 = getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr;
  if (!getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr)
  {
    uint64_t v7 = (void *)MobileWiFiLibrary();
    v11[3] = (uint64_t)dlsym(v7, "WiFiManagerClientScheduleWithRunLoop");
    getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr = (_UNKNOWN *)v11[3];
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    int v9 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  return v6(a1, a2, a3);
}

uint64_t PSWiFiManagerClientCopyDevices(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t))getWiFiManagerClientCopyDevicesSymbolLoc_ptr;
  int v9 = getWiFiManagerClientCopyDevicesSymbolLoc_ptr;
  if (!getWiFiManagerClientCopyDevicesSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)MobileWiFiLibrary();
    v7[3] = (uint64_t)dlsym(v3, "WiFiManagerClientCopyDevices");
    getWiFiManagerClientCopyDevicesSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    id v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    long long v5 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(a1);
}

uint64_t PSWiFiDeviceClientGetPower(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t))getWiFiDeviceClientGetPowerSymbolLoc_ptr;
  int v9 = getWiFiDeviceClientGetPowerSymbolLoc_ptr;
  if (!getWiFiDeviceClientGetPowerSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)MobileWiFiLibrary();
    v7[3] = (uint64_t)dlsym(v3, "WiFiDeviceClientGetPower");
    getWiFiDeviceClientGetPowerSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    id v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    long long v5 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(a1);
}

uint64_t PSWiFiManagerClientUnscheduleFromRunLoop(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr;
  uint64_t v13 = getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr;
  if (!getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr)
  {
    uint64_t v7 = (void *)MobileWiFiLibrary();
    v11[3] = (uint64_t)dlsym(v7, "WiFiManagerClientUnscheduleFromRunLoop");
    getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr = (_UNKNOWN *)v11[3];
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    int v9 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  return v6(a1, a2, a3);
}

uint64_t PSWiFiManagerClientSetMISDiscoveryState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_ptr;
  uint64_t v13 = getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_ptr;
  if (!getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_ptr)
  {
    uint64_t v7 = (void *)MobileWiFiLibrary();
    v11[3] = (uint64_t)dlsym(v7, "WiFiManagerClientSetMISDiscoveryState");
    getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_ptr = (_UNKNOWN *)v11[3];
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    int v9 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  return v6(a1, a2, a3);
}

uint64_t PSBKSDisplayBrightnessGetCurrent()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr;
  uint64_t v7 = getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr;
  if (!getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)BackBoardServicesLibrary();
    v5[3] = (uint64_t)dlsym(v1, "BKSDisplayBrightnessGetCurrent");
    getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    uint64_t v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0();
}

uint64_t PSBKSDisplayBrightnessSet(float a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t, float))getBKSDisplayBrightnessSetSymbolLoc_ptr;
  int v9 = getBKSDisplayBrightnessSetSymbolLoc_ptr;
  if (!getBKSDisplayBrightnessSetSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)BackBoardServicesLibrary();
    v7[3] = (uint64_t)dlsym(v3, "BKSDisplayBrightnessSet");
    getBKSDisplayBrightnessSetSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    id v2 = (uint64_t (*)(uint64_t, float))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    long long v5 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(1, a1);
}

void _BrightnessChangedExternally()
{
  id v2 = +[PSBrightnessController sharedController];
  uint64_t v0 = [v2 isTracking];
  if ((v0[2]() & 1) == 0)
  {
    uint64_t v1 = [v2 brightnessChangedExternally];
    v1[2]();
  }
}

uint64_t PSPreferencesLaunchURL()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root="];
}

void *__getWiFiManagerClientCreateSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileWiFiLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileWiFiLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MobileWiFiLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C60540;
    uint64_t v5 = 0;
    MobileWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MobileWiFiLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!MobileWiFiLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MobileWiFiLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileWiFiLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getWiFiManagerClientScheduleWithRunLoopSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientScheduleWithRunLoop");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiManagerClientCopyDevicesSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientCopyDevices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientCopyDevicesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiDeviceClientGetPowerSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiDeviceClientGetPower");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiDeviceClientGetPowerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiManagerClientSetPowerSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientSetPower");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientSetPowerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientUnscheduleFromRunLoop");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NetrbLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!NetrbLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __NetrbLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C60558;
    uint64_t v5 = 0;
    NetrbLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NetrbLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!NetrbLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __NetrbLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NetrbLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientSetMISDiscoveryState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientGetMISDiscoveryState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXGuidedAccessGetAvailabilitySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E5C60570;
    uint64_t v7 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    id v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
    if (AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
LABEL_5:
  uint64_t result = dlsym(v2, "AXGuidedAccessGetAvailability");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXGuidedAccessGetAvailabilitySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getBKSDisplayBrightnessGetCurrentSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)BackBoardServicesLibrary();
  uint64_t result = dlsym(v2, "BKSDisplayBrightnessGetCurrent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BackBoardServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!BackBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __BackBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C60588;
    uint64_t v5 = 0;
    BackBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = BackBoardServicesLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!BackBoardServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __BackBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BackBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBKSDisplayBrightnessSetSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)BackBoardServicesLibrary();
  uint64_t result = dlsym(v2, "BKSDisplayBrightnessSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBKSDisplayBrightnessSetSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBKSDisplayBrightnessTransactionCreateSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)BackBoardServicesLibrary();
  uint64_t result = dlsym(v2, "BKSDisplayBrightnessTransactionCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void WifiStateChanged()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"com.apple.Preferences.wifiChanges" object:0];
}

void __SCDynamicStoreCallback(uint64_t a1, uint64_t a2, void *a3)
{
  long long v4 = (void *)MEMORY[0x1AD0BE030]();
  [a3 sendStateUpdate];
}

uint64_t __registerForEthernetAdapterNotificationsCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 ethernetDynamicStoreDidChange];
}

id PSStringForMinutes(uint64_t a1)
{
  if (!PSStringForMinutes_singular)
  {
    uint64_t v2 = PS_LocalizedString(@"%@ minute");
    uint64_t v3 = (void *)PSStringForMinutes_singular;
    PSStringForMinutes_singular = v2;

    uint64_t v4 = PS_LocalizedString(@"%@ minutes");
    uint64_t v5 = (void *)PSStringForMinutes_plural;
    PSStringForMinutes_plural = v4;

    uint64_t v6 = PS_LocalizedString(@"0 minutes");
    uint64_t v7 = (void *)PSStringForMinutes_zero;
    PSStringForMinutes_zero = v6;
  }
  if (a1 == 1)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = PSStringForMinutes_singular;
    uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v8 = NSString;
    if (a1)
    {
      uint64_t v9 = PSStringForMinutes_plural;
      uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v12 = a1;
    }
    else
    {
      uint64_t v9 = PSStringForMinutes_zero;
      uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v12 = 0;
    }
  }
  uint64_t v13 = [v11 numberWithUnsignedInt:v12];
  uint64_t v14 = [v10 localizedStringFromNumber:v13 numberStyle:1];
  uint64_t v15 = objc_msgSend(v8, "stringWithFormat:", v9, v14);

  return v15;
}

id PSStringForMins(uint64_t a1)
{
  uint64_t v2 = PSStringForMins_unit;
  if (!PSStringForMins_unit)
  {
    uint64_t v3 = PS_LocalizedString(@"%@ min");
    uint64_t v4 = (void *)PSStringForMins_unit;
    PSStringForMins_unit = v3;

    uint64_t v2 = PSStringForMins_unit;
  }
  uint64_t v5 = NSString;
  uint64_t v6 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a1];
  uint64_t v8 = [v6 localizedStringFromNumber:v7 numberStyle:1];
  uint64_t v9 = objc_msgSend(v5, "stringWithFormat:", v2, v8);

  return v9;
}

id PSStringForHours(uint64_t a1)
{
  if (!PSStringForHours_singular)
  {
    uint64_t v2 = PS_LocalizedString(@"%@ hour");
    uint64_t v3 = (void *)PSStringForHours_singular;
    PSStringForHours_singular = v2;

    uint64_t v4 = PS_LocalizedString(@"%@ hours");
    uint64_t v5 = (void *)PSStringForHours_plural;
    PSStringForHours_plural = v4;

    uint64_t v6 = PS_LocalizedString(@"0 hours");
    uint64_t v7 = (void *)PSStringForHours_zero;
    PSStringForHours_zero = v6;
  }
  if (a1 == 1)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = PSStringForHours_singular;
    uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v8 = NSString;
    if (a1)
    {
      uint64_t v9 = PSStringForHours_plural;
      uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v12 = a1;
    }
    else
    {
      uint64_t v9 = PSStringForHours_zero;
      uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v12 = 0;
    }
  }
  uint64_t v13 = [v11 numberWithUnsignedInt:v12];
  uint64_t v14 = [v10 localizedStringFromNumber:v13 numberStyle:1];
  uint64_t v15 = objc_msgSend(v8, "stringWithFormat:", v9, v14);

  return v15;
}

id PSStringForDays(uint64_t a1)
{
  if (!PSStringForDays_singular)
  {
    uint64_t v2 = PS_LocalizedString(@"%@ day");
    uint64_t v3 = (void *)PSStringForDays_singular;
    PSStringForDays_singular = v2;

    uint64_t v4 = PS_LocalizedString(@"%@ days");
    uint64_t v5 = (void *)PSStringForDays_plural;
    PSStringForDays_plural = v4;

    uint64_t v6 = PS_LocalizedString(@"0 days");
    uint64_t v7 = (void *)PSStringForDays_zero;
    PSStringForDays_zero = v6;
  }
  if (a1 == 1)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = PSStringForDays_singular;
    uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v8 = NSString;
    if (a1)
    {
      uint64_t v9 = PSStringForDays_plural;
      uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v12 = a1;
    }
    else
    {
      uint64_t v9 = PSStringForDays_zero;
      uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v12 = 0;
    }
  }
  uint64_t v13 = [v11 numberWithUnsignedInt:v12];
  uint64_t v14 = [v10 localizedStringFromNumber:v13 numberStyle:1];
  uint64_t v15 = objc_msgSend(v8, "stringWithFormat:", v9, v14);

  return v15;
}

id PSFormattedTimeString(int a1)
{
  uint64_t v2 = (a1 / 60);
  if ((a1 / 60) > 0x3B)
  {
    unint64_t v4 = v2 / 0x3CuLL;
    uint64_t v5 = v2 % 0x3C;
    uint64_t v6 = NSString;
    uint64_t v7 = PS_LocalizedString(@"%@, %@");
    uint64_t v8 = PSStringForHours(v4);
    uint64_t v9 = PSStringForMinutes(v5);
    uint64_t v3 = objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
  }
  else
  {
    uint64_t v3 = PSStringForMinutes(v2);
  }
  return v3;
}

id PSAbbreviatedFormattedTimeString(int a1)
{
  uint64_t v2 = (a1 / 60);
  if ((a1 / 60) > 0x3B)
  {
    unint64_t v4 = v2 / 0x3CuLL;
    uint64_t v5 = v2 % 0x3C;
    uint64_t v6 = NSString;
    uint64_t v7 = PS_LocalizedString(@"%@, %@");
    uint64_t v8 = PSStringForHours(v4);
    uint64_t v9 = PSStringForMins(v5);
    uint64_t v3 = objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
  }
  else
  {
    uint64_t v3 = PSStringForMins(v2);
  }
  return v3;
}

id PSFormattedTimeStringWithDays(int a1)
{
  uint64_t v1 = (a1 / 86400);
  int v2 = a1 % 86400;
  if (v1)
  {
    uint64_t v3 = (v2 / 3600);
    unint64_t v4 = NSString;
    uint64_t v5 = PS_LocalizedString(@"%@, %@");
    uint64_t v6 = PSStringForDays(v1);
    uint64_t v7 = PSStringForHours(v3);
    uint64_t v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  }
  else
  {
    uint64_t v8 = PSFormattedTimeString(v2);
  }
  return v8;
}

id PSAbbreviatedFormattedTimeStringWithDays(int a1)
{
  uint64_t v1 = (a1 / 86400);
  int v2 = a1 % 86400;
  if (v1)
  {
    uint64_t v3 = (v2 / 3600);
    unint64_t v4 = NSString;
    uint64_t v5 = PS_LocalizedString(@"%@, %@");
    uint64_t v6 = PSStringForDays(v1);
    uint64_t v7 = PSStringForHours(v3);
    uint64_t v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  }
  else
  {
    uint64_t v8 = PSAbbreviatedFormattedTimeString(v2);
  }
  return v8;
}

BOOL PSTimeStringIsShortened(int a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v4 = *MEMORY[0x1E4F43870];
  id v5 = a2;
  uint64_t v6 = [v3 preferredFontForTextStyle:v4];
  uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  float v9 = v8 + -20.0;

  uint64_t v10 = [v5 name];

  objc_msgSend(v10, "_legacy_sizeWithFont:", v6);
  float v12 = v9 - v11 + -20.0 + -12.0;

  uint64_t v13 = PSFormattedTimeString(a1);
  objc_msgSend(v13, "_legacy_sizeWithFont:", v6);
  BOOL v15 = v14 > v12;

  return v15;
}

BOOL PSLocaleUses24HourClock(CFLocaleRef locale)
{
  if (!locale) {
    return 0;
  }
  BOOL v1 = 1;
  int v2 = CFDateFormatterCreate(0, locale, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  uint64_t v3 = CFDateFormatterGetFormat(v2);
  if ([v3 rangeOfString:@"H"] == 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v1 = [v3 rangeOfString:@"k"] != 0x7FFFFFFFFFFFFFFFLL;
  }
  CFRelease(v2);

  return v1;
}

PSDetailController *CreateDetailControllerInstanceWithClass(objc_class *a1)
{
  id v1 = [a1 alloc];
  if (v1)
  {
    int v2 = v1;
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (PSDetailController *)objc_msgSend(v2, "initForContentSize:", 100.0, 100.0);
    }
    else {
      uint64_t v3 = (PSDetailController *)[v2 init];
    }
  }
  else
  {
    uint64_t v3 = objc_alloc_init(PSDetailController);
  }
  return v3;
}

uint64_t PSLocalizedStringFromTableInBundleForLanguage()
{
  return MEMORY[0x1F414B030]();
}

id PSCityForSpecifier(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (!a2
    || ([v3 propertyForKey:@"value"], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = +[PSRootController readPreferenceValue:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v5];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F4BE38] sharedManager];
      uint64_t v8 = [v7 citiesWithTimeZone:v6];
    }
    else
    {
      uint64_t v10 = [v5 rangeOfString:@","];
      double v11 = [MEMORY[0x1E4F4BE38] sharedManager];
      uint64_t v7 = v11;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        float v9 = [v11 cityForClassicIdentifier:v5];

        float v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v8 = [v11 citiesMatchingName:v5 localized:0];
    }
    float v12 = (void *)v8;

    if (v12 && [v12 count])
    {
      float v9 = [v12 objectAtIndex:0];
    }
    else
    {
      float v9 = 0;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [MEMORY[0x1E4F4BE38] sharedManager];
    float v9 = [v6 bestCityForLegacyCity:v5];
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    float v9 = (void *)[objc_alloc(MEMORY[0x1E4F4BE30]) initWithProperties:v5];
  }
  else {
    float v9 = 0;
  }
LABEL_21:

  return v9;
}

id PSCityForTimeZone(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F4BE38] sharedManager];
  id v3 = [v2 defaultCityForTimeZone:a1];

  return v3;
}

uint64_t PSLegacyCityFromCity(uint64_t a1)
{
  return [MEMORY[0x1E4F4BE38] legacyCityForCity:a1];
}

uint64_t PSPIDForProcessNamed()
{
  return MEMORY[0x1F414B050]();
}

uint64_t PSKillProcessNamed()
{
  return MEMORY[0x1F414B020]();
}

id PSPreferencesFrameworkBundle()
{
  if (PSPreferencesFrameworkBundle_onceToken != -1) {
    dispatch_once(&PSPreferencesFrameworkBundle_onceToken, &__block_literal_global_38);
  }
  id v0 = (void *)PSPreferencesFrameworkBundle_preferences;
  return v0;
}

uint64_t __PSPreferencesFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = PSPreferencesFrameworkBundle_preferences;
  PSPreferencesFrameworkBundle_preferences = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PSPreferencesUIFrameworkBundle()
{
  if (PSPreferencesUIFrameworkBundle_onceToken != -1) {
    dispatch_once(&PSPreferencesUIFrameworkBundle_onceToken, &__block_literal_global_79_0);
  }
  uint64_t v0 = (void *)PSPreferencesUIFrameworkBundle_preferencesUI;
  return v0;
}

uint64_t __PSPreferencesUIFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.preferences-ui-framework"];
  uint64_t v1 = PSPreferencesUIFrameworkBundle_preferencesUI;
  PSPreferencesUIFrameworkBundle_preferencesUI = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void LocalizeWeeAppName(void *a1)
{
  id v1 = a1;
  int v2 = (void *)MEMORY[0x1E4F28B50];
  id v9 = v1;
  id v3 = [v1 objectForKey:@"PATH"];
  uint64_t v4 = [v2 bundleWithPath:v3];

  id v5 = [v4 infoDictionary];
  uint64_t v6 = [v5 objectForKey:@"CFBundleDisplayName"];

  uint64_t v7 = [v4 localizedInfoDictionary];
  uint64_t v8 = [v7 objectForKey:v6];

  if (v8) {
    [v9 setObject:v8 forKey:@"NAME"];
  }
}

id PSDisplayNameForBBSection(void *a1)
{
  id v1 = a1;
  int v2 = [v1 sectionID];
  id v3 = [v1 displayName];

  if (v3)
  {
    id v4 = [v1 displayName];
  }
  else if (v2)
  {
    id v5 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v2];
    id v4 = [v5 localizedName];
  }
  else
  {
    id v4 = 0;
  }
  if ([v1 sectionType] == 1 && !v4)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = [v1 pathToWeeAppPluginBundle];
    uint64_t v8 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, @"PATH", 0);

    LocalizeWeeAppName(v8);
    id v9 = [v8 objectForKey:@"NAME"];
    id v4 = (id)[v9 copy];
  }
  if (!v4) {
    id v4 = v2;
  }

  return v4;
}

id PSApplicationSpecifierForBBSection(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  uint64_t v8 = PSDisplayNameForBBSection(v7);
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:a4 cell:1 edit:0];
  if (![v7 suppressedSettings]) {
    goto LABEL_4;
  }
  uint64_t v10 = [v7 subsectionID];
  if ([v10 length])
  {

LABEL_4:
    uint64_t v11 = [v7 showsInNotificationCenter];
    goto LABEL_5;
  }
  if ([v7 suppressedSettings])
  {
    uint64_t v19 = [v7 subsections];
    uint64_t v20 = [v19 count];

    if (!v20) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v21 = [v7 subsections];
  uint64_t v11 = [v21 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v22 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v21);
        }
        if ([*(id *)(*((void *)&v24 + 1) + 8 * i) showsInNotificationCenter])
        {
          uint64_t v11 = 1;
          goto LABEL_23;
        }
      }
      uint64_t v11 = [v21 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_23:

LABEL_5:
  float v12 = [v7 sectionID];
  [v9 setIdentifier:v12];

  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v11];
  [v9 setProperty:v13 forKey:ShowInNotificationsState];

  [v9 setProperty:v7 forKey:@"BBSECTION_INFO_KEY"];
  double v14 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
  [v9 setProperty:v14 forKey:kWantsIcon];

  [v9 setProperty:a3 forKey:@"cellClass"];
  if (objc_opt_respondsToSelector())
  {
    BOOL v15 = (void *)MEMORY[0x1E4F28ED0];
    [a3 defaultCellHeight];
    *(float *)&double v16 = v16;
    __int16 v17 = [v15 numberWithFloat:v16];
    [v9 setProperty:v17 forKey:@"height"];
  }
  return v9;
}

id PSApplicationSpecifierForAssistantSectionForBundleId(uint64_t a1, int a2, int a3, int a4)
{
  id v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:a1];
  uint64_t v8 = PSApplicationSpecifierForAssistantSection(v7, a2, a3, a4);

  return v8;
}

id PSApplicationSpecifierForAssistantSection(void *a1, int a2, int a3, int a4)
{
  id v7 = a1;
  if (PSApplicationSpecifierForAssistantSection_onceToken != -1) {
    dispatch_once(&PSApplicationSpecifierForAssistantSection_onceToken, &__block_literal_global_107);
  }
  uint64_t v8 = [v7 bundleIdentifier];

  if (!v8) {
    goto LABEL_10;
  }
  id v9 = [v7 localizedName];
  if (![v9 length])
  {
    uint64_t v10 = [v7 localizedShortName];

    if ([v10 length])
    {
      id v9 = v10;
      goto LABEL_8;
    }
    id v9 = [v7 itemName];

    if (v9) {
      goto LABEL_8;
    }
LABEL_10:
    float v12 = 0;
    goto LABEL_23;
  }
LABEL_8:
  if (a4)
  {
    id v11 = v9;
  }
  else
  {
    BOOL v13 = +[PSGMSAvailability eligibleDevice];
    double v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v15 = v14;
    if (v13) {
      double v16 = @"APPLE_INTELLIGENCE_ASSISTANT";
    }
    else {
      double v16 = @"ASSISTANT";
    }
    id v11 = [v14 localizedStringForKey:v16 value:&stru_1EFB51FD0 table:@"AssistantShared"];
  }
  float v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:PSApplicationSpecifierForAssistantSection_sDetailClass cell:1 edit:0];
  [v12 setProperty:v9 forKey:@"APP_NAME"];
  __int16 v17 = [v7 bundleIdentifier];
  [v12 setProperty:v17 forKey:@"BUNDLE_ID"];

  uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithInt:PSApplicationSpecifierForAssistantSection_sDetailClass != 0];
  [v12 setProperty:v18 forKey:@"enabled"];

  uint64_t v19 = [v7 bundleIdentifier];
  [v12 setProperty:v19 forKey:@"id"];

  [v12 setProperty:PSApplicationSpecifierForAssistantSection_sAssistantCellClass forKey:@"cellClass"];
  if (a2)
  {
    [v12 setProperty:MEMORY[0x1E4F1CC38] forKey:@"useLazyIcons"];
    if (a3)
    {
      uint64_t v20 = [v7 bundleIdentifier];
      [v12 setProperty:v20 forKey:@"appIDForLazyIcon"];
    }
    else
    {
      BOOL v21 = +[PSGMSAvailability eligibleDevice];
      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
      if (v21)
      {
        uint64_t v22 = @"iconUTTypeIdentifier";
        id v23 = @"com.apple.graphic-icon.intelligence";
      }
      else
      {
        uint64_t v22 = @"appIDForLazyIcon";
        id v23 = @"com.apple.siri";
      }
      [v12 setObject:v23 forKeyedSubscript:v22];
    }
  }

LABEL_23:
  return v12;
}

void __PSApplicationSpecifierForAssistantSection_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B50];
  id v1 = PSBundlePathForPreferenceBundle(@"AssistantSettings");
  int v2 = SFRuntimeAbsoluteFilePathForPath();
  id v3 = [v0 bundleWithPath:v2];

  [v3 load];
  PSApplicationSpecifierForAssistantSection_sAssistantCellClass = (uint64_t)NSClassFromString(&cfstr_Assistantcell.isa);
  PSApplicationSpecifierForAssistantSection_sDetailClass = (uint64_t)NSClassFromString(&cfstr_Assistantdetai.isa);
}

id PSBundlePathForPreferenceBundle(uint64_t a1)
{
  id v1 = [@"/System/Library/PreferenceBundles/" stringByAppendingPathComponent:a1];
  int v2 = [v1 stringByAppendingPathExtension:@"bundle"];

  return v2;
}

id PSApplicationSpecifierForSearchSectionForBundleId(void *a1, int a2, int a3, int a4)
{
  id v7 = (objc_class *)MEMORY[0x1E4F223C8];
  id v8 = a1;
  id v9 = (void *)[[v7 alloc] initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];

  uint64_t v10 = PSApplicationSpecifierForSearchSection(v9, a2, a3, a4);

  return v10;
}

id PSApplicationSpecifierForSearchSection(void *a1, int a2, int a3, int a4)
{
  id v7 = a1;
  if (PSApplicationSpecifierForSearchSection_onceToken != -1) {
    dispatch_once(&PSApplicationSpecifierForSearchSection_onceToken, &__block_literal_global_145);
  }
  id v8 = [v7 bundleIdentifier];

  if (!v8)
  {
    id v11 = 0;
    goto LABEL_15;
  }
  id v9 = [v7 localizedName];
  if (![v9 length])
  {
    uint64_t v12 = [v7 localizedShortName];

    id v9 = (void *)v12;
    if (a4) {
      goto LABEL_6;
    }
LABEL_9:
    BOOL v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v10 = [v13 localizedStringForKey:@"SEARCH" value:&stru_1EFB51FD0 table:@"AssistantShared"];

    goto LABEL_10;
  }
  if (!a4) {
    goto LABEL_9;
  }
LABEL_6:
  id v10 = v9;
LABEL_10:
  id v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:PSApplicationSpecifierForSearchSection_sDetailClass cell:1 edit:0];
  [v11 setProperty:v9 forKey:@"APP_NAME"];
  double v14 = [v7 bundleIdentifier];
  [v11 setProperty:v14 forKey:@"BUNDLE_ID"];

  BOOL v15 = [MEMORY[0x1E4F28ED0] numberWithInt:PSApplicationSpecifierForSearchSection_sDetailClass != 0];
  [v11 setProperty:v15 forKey:@"enabled"];

  double v16 = [v7 bundleIdentifier];
  [v11 setProperty:v16 forKey:@"id"];

  [v11 setProperty:PSApplicationSpecifierForSearchSection_sSearchCellClass forKey:@"cellClass"];
  if (a2)
  {
    [v11 setProperty:MEMORY[0x1E4F1CC38] forKey:@"useLazyIcons"];
    if (a3)
    {
      __int16 v17 = [v7 bundleIdentifier];
      [v11 setProperty:v17 forKey:@"appIDForLazyIcon"];
    }
    else
    {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
      [v11 setObject:@"com.apple.graphic-icon.search" forKeyedSubscript:@"iconUTTypeIdentifier"];
    }
  }

LABEL_15:
  return v11;
}

void __PSApplicationSpecifierForSearchSection_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B50];
  id v1 = PSBundlePathForPreferenceBundle(@"SpotlightSetting");
  int v2 = SFRuntimeAbsoluteFilePathForPath();
  id v3 = [v0 bundleWithPath:v2];

  [v3 load];
  PSApplicationSpecifierForSearchSection_sSearchCellClass = (uint64_t)NSClassFromString(&cfstr_Spotlightcell.isa);
  PSApplicationSpecifierForSearchSection_sDetailClass = (uint64_t)NSClassFromString(&cfstr_Spotlightdetai.isa);
}

PSAccountsLinkSpecifier *PSApplicationSpecifierForAccountsSection()
{
  if (_initAccountsUI_onceToken != -1) {
    dispatch_once(&_initAccountsUI_onceToken, &__block_literal_global_320);
  }
  uint64_t v0 = [PSAccountsLinkSpecifier alloc];
  id v1 = [(PSAccountsLinkSpecifier *)v0 initWithDetailClass:sAccountsUISettingsControllerClass];
  [(PSSpecifier *)v1 setIdentifier:@"ACCOUNTS"];
  return v1;
}

id PSApplicationSpecifierForAddAccountButton()
{
  if (_initAccountsUI_onceToken != -1) {
    dispatch_once(&_initAccountsUI_onceToken, &__block_literal_global_320);
  }
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v1 = [v0 localizedStringForKey:@"ADD_ACCOUNT" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  int v2 = +[PSSpecifier preferenceSpecifierNamed:v1 target:0 set:0 get:0 detail:sAccountsUIAddAccountControllerClass cell:13 edit:0];

  [v2 setIdentifier:@"ADD_ACCOUNT"];
  return v2;
}

void __init_sirikit_enabled_lock()
{
  if (__init_sirikit_enabled_lock_onceToken != -1) {
    dispatch_once(&__init_sirikit_enabled_lock_onceToken, &__block_literal_global_172);
  }
}

uint64_t ____init_sirikit_enabled_lock_block_invoke()
{
  return pthread_mutex_init(&s_sirikit_enabled_lock, 0);
}

uint64_t PSResetCachedSiriKitTCCEnabledAppIds()
{
  if (__init_sirikit_enabled_lock_onceToken != -1) {
    dispatch_once(&__init_sirikit_enabled_lock_onceToken, &__block_literal_global_172);
  }
  pthread_mutex_lock(&s_sirikit_enabled_lock);
  return pthread_mutex_unlock(&s_sirikit_enabled_lock);
}

uint64_t PSIsBundleIDInstalled()
{
  return MEMORY[0x1F414B018]();
}

double PSSizeForMessagesIcon()
{
  if (PSSizeForMessagesIcon_onceToken != -1) {
    dispatch_once(&PSSizeForMessagesIcon_onceToken, &__block_literal_global_180);
  }
  return *(double *)&PSSizeForMessagesIcon_result_0;
}

void __PSSizeForMessagesIcon_block_invoke()
{
  uint64_t v0 = PSBlankIconImage();
  [v0 size];
  double v2 = v1;

  id v5 = [MEMORY[0x1E4F6F230] iosMessagesAppIconSpecification];
  [v5 maxSize];
  *(double *)&PSSizeForMessagesIcon_result_0 = v2 * (v3 / v4);
  PSSizeForMessagesIcon_result_1 = *(void *)&v2;
}

id PSBlankMessageAppIconImage()
{
  if (PSBlankMessageAppIconImage_onceToken != -1) {
    dispatch_once(&PSBlankMessageAppIconImage_onceToken, &__block_literal_global_188);
  }
  uint64_t v0 = (void *)PSBlankMessageAppIconImage_result;
  return v0;
}

void __PSBlankMessageAppIconImage_block_invoke()
{
  id v8 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
  uint64_t v0 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2A0]];
  double v1 = [v8 prepareImageForDescriptor:v0];
  double v2 = v1;
  if (v1)
  {
    double v3 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v4 = [v1 CGImage];
    [v2 scale];
    id v5 = objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v4, 0);
    uint64_t v6 = [v5 imageByPreparingThumbnailOfSize:PSSizeForMessagesIcon()];
    id v7 = (void *)PSBlankMessageAppIconImage_result;
    PSBlankMessageAppIconImage_uint64_t result = v6;
  }
}

id DeviceName()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  return v0;
}

uint64_t SetDeviceName(void *a1)
{
  id v1 = a1;
  if (![v1 length])
  {
LABEL_7:
    uint64_t v2 = 0xFFFFFFFFLL;
    goto LABEL_8;
  }
  if (!lockdown_connect())
  {
    double v3 = _PSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "failed to connect to lockdown", v5, 2u);
    }

    goto LABEL_7;
  }
  lockdown_set_value();
  lockdown_disconnect();
  uint64_t v2 = 0;
LABEL_8:

  return v2;
}

uint64_t ShouldShowWeibo()
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (CFPreferencesGetAppBooleanValue(@"AlwaysShowWeibo", @"com.apple.Preferences", 0)) {
    return 1;
  }
  id v1 = CPGetDeviceRegionCode();
  uint64_t v2 = v1;
  if (v1) {
    int v3 = [v1 isEqualToString:@"CH"];
  }
  else {
    int v3 = 0;
  }
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__11;
  uint64_t v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  uint64_t v4 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __ShouldShowWeibo_block_invoke;
  v15[3] = &unk_1E5C5D4D8;
  v15[4] = &v16;
  [v4 performWithoutExtensionInputModes:v15];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = (id)v17[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = MEMORY[0x1AD0BDA40](*(void *)(*((void *)&v11 + 1) + 8 * i));
        char v10 = objc_msgSend(v9, "isEqualToString:", @"zh", (void)v11);

        if (v10)
        {
          LODWORD(v6) = 1;
          goto LABEL_16;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  _Block_object_dispose(&v16, 8);
  return v3 | v6;
}

void sub_1A6655F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __ShouldShowWeibo_block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  uint64_t v2 = [v5 enabledInputModeIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t UserInterfaceIdiom()
{
  if (UserInterfaceIdiom_onceToken != -1) {
    dispatch_once(&UserInterfaceIdiom_onceToken, &__block_literal_global_208);
  }
  return UserInterfaceIdiom_idiom;
}

void __UserInterfaceIdiom_block_invoke()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  UserInterfaceIdiom_idiom = [v0 userInterfaceIdiom];
}

uint64_t PSToolbarLabelsTextColor()
{
  return [MEMORY[0x1E4F428B8] blackColor];
}

objc_class *PSStorageClass()
{
  return _usageBundleClassWithName(@"CloudStorageController");
}

objc_class *_usageBundleClassWithName(void *a1)
{
  id v1 = a1;
  Class v2 = NSClassFromString(v1);
  if (!v2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v4 = [@"/System/Library/PreferenceBundles/" stringByAppendingPathComponent:@"UsageSettings"];
    id v5 = [v4 stringByAppendingPathExtension:@"bundle"];
    uint64_t v6 = [v3 bundleWithPath:v5];

    [v6 load];
    Class v2 = NSClassFromString(v1);
  }
  uint64_t v7 = v2;

  return v7;
}

objc_class *PSBackupClass()
{
  return _usageBundleClassWithName(@"BackupController");
}

uint64_t PSIsInternalInstall()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_isInternalInstall");

  return v1;
}

uint64_t PSUsedByManagedAccount()
{
  id v0 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v1 = objc_msgSend(v0, "aa_primaryAppleAccount");
  getACAccountStoreClass();
  if (objc_opt_class())
  {
    Class v2 = objc_msgSend(getACAccountStoreClass(), "ams_sharedAccountStore");
    uint64_t v3 = objc_msgSend(v2, "ams_activeiTunesAccount");
    int v4 = objc_msgSend(v3, "ams_isManagedAppleID");
  }
  else
  {
    int v4 = 0;
  }
  uint64_t v5 = objc_msgSend(v1, "aa_isManagedAppleID") | v4;

  return v5;
}

id getACAccountStoreClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getACAccountStoreClass_softClass;
  uint64_t v7 = getACAccountStoreClass_softClass;
  if (!getACAccountStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getACAccountStoreClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getACAccountStoreClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A66562E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSUsedByHSA2Account()
{
  id v0 = [MEMORY[0x1E4F179C8] defaultStore];
  id v1 = objc_msgSend(v0, "aa_primaryAppleAccount");
  Class v2 = v1;
  if (v1 && (objc_msgSend(v1, "aa_altDSID"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    uint64_t v4 = [getAKAccountManagerClass() sharedInstance];
    uint64_t v5 = objc_msgSend(v2, "aa_altDSID");
    uint64_t v6 = [v4 authKitAccountWithAltDSID:v5];

    if (v6)
    {
      uint64_t v7 = objc_msgSend(v6, "aa_altDSID");

      if (v7)
      {
        id v8 = [getAKAccountManagerClass() sharedInstance];
        uint64_t v7 = [v8 securityLevelForAccount:v6] == 4;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id getAKAccountManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAKAccountManagerClass_softClass;
  uint64_t v7 = getAKAccountManagerClass_softClass;
  if (!getAKAccountManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAKAccountManagerClass_block_invoke;
    v3[3] = &unk_1E5C5D4D8;
    v3[4] = &v4;
    __getAKAccountManagerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A66564D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSJoinedCDPCircleAccount()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v0 = (void *)getCDPStateControllerClass_softClass_0;
  uint64_t v14 = getCDPStateControllerClass_softClass_0;
  if (!getCDPStateControllerClass_softClass_0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __getCDPStateControllerClass_block_invoke_0;
    uint64_t v16 = &unk_1E5C5D4D8;
    __int16 v17 = &v11;
    __getCDPStateControllerClass_block_invoke_0((uint64_t)buf);
    id v0 = (void *)v12[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v11, 8);
  Class v2 = objc_opt_new();
  id v10 = 0;
  uint64_t v3 = [v2 isManateeAvailable:&v10];
  id v4 = v10;

  if (v4) {
    char v5 = 0;
  }
  else {
    char v5 = v3;
  }
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = _PSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
      id v8 = [v4 description];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Has joined CDP Circle: %@ Error: %@", buf, 0x16u);
    }
  }

  return v3;
}

void sub_1A66566A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSIsWebAppPlaceholder(void *a1)
{
  id v1 = a1;
  if ([v1 isWebAppPlaceholder])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v3 = [v1 bundleIdentifier];
    uint64_t v2 = [v3 hasPrefix:@"com.apple.WebKit.PushBundle"];
  }
  return v2;
}

__CFString *PSDeviceClass()
{
  id v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    id v0 = @"iPhone";
  }
  return v0;
}

uint64_t PSUsePadStylePIN()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_isiPad");

  return v1;
}

void resetLocale()
{
  __textDirection = 0;
}

uint64_t PSLocaleLanguageDirection()
{
  uint64_t result = __textDirection;
  if (!__textDirection)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CA20];
    uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F1C438]];
    __textDirection = [v1 characterDirectionForLanguage:v3];

    return __textDirection;
  }
  return result;
}

void PSSetBatteryMonitoringEnabled(char a1)
{
  if (a1)
  {
    uint64_t v1 = 1;
  }
  else
  {
    if (!PSSetBatteryMonitoringEnabled_refCount) {
      goto LABEL_6;
    }
    uint64_t v1 = -1;
  }
  PSSetBatteryMonitoringEnabled_refCount += v1;
LABEL_6:
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  [v2 setBatteryMonitoringEnabled:PSSetBatteryMonitoringEnabled_refCount != 0];
}

id PSAboutDeviceSupervision()
{
  id v0 = PSPreferencesFrameworkBundle();
  if (MGGetBoolAnswer()) {
    uint64_t v1 = @"DEVICE_SUPERVISION_INFO_WLAN";
  }
  else {
    uint64_t v1 = @"DEVICE_SUPERVISION_INFO";
  }
  id v2 = [v0 localizedStringForKey:v1 value:&stru_1EFB51FD0 table:@"DeviceSupervisionInfo"];

  return v2;
}

uint64_t PSIsTelephonyDead()
{
  uint64_t result = _CTServerConnectionCreate();
  if (result)
  {
    uint64_t v1 = (const void *)result;
    _CTServerConnectionGetRadioModuleIsDead();
    CFRelease(v1);
    return 0;
  }
  return result;
}

uint64_t PSIsiPad()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_isiPad");

  return v1;
}

uint64_t PSIsiPhone()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_isiPhone");

  return v1;
}

BOOL PSIsN56()
{
  id v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 _referenceBounds];
  BOOL v2 = v1 == 736.0;

  return v2;
}

BOOL PSIsJ99()
{
  id v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 _referenceBounds];
  BOOL v2 = v1 == 1366.0;

  return v2;
}

BOOL PSIsD22ScreenSize()
{
  id v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 _referenceBounds];
  BOOL v2 = v1 == 812.0;

  return v2;
}

CFArrayRef PSIsHostingPersonalHotspot()
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = _NETRBClientCreate();
  double v1 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (v0)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    memset(cStr, 0, sizeof(cStr));
    if (_NETRBClientGetDynamicStoreKey())
    {
      CFStringRef v2 = CFStringCreateWithCString(*v1, cStr, 0x8000100u);
      if (v2)
      {
LABEL_13:
        _NETRBClientDestroy();
        goto LABEL_14;
      }
      uint64_t v3 = _PSLoggingFacility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v25 = 0;
        id v4 = "CFStringCreateWithCString failed";
LABEL_11:
        _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, v4, v25, 2u);
      }
    }
    else
    {
      uint64_t v3 = _PSLoggingFacility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v25 = 0;
        id v4 = "_NETRBClientGetDynamicStoreKey failed.";
        goto LABEL_11;
      }
    }

    CFStringRef v2 = 0;
    goto LABEL_13;
  }
  char v5 = _PSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)cStr = 0;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "_NETRBClientCreate failed.", (uint8_t *)cStr, 2u);
  }

  CFStringRef v2 = 0;
LABEL_14:
  CFAllocatorRef v6 = *v1;
  uint64_t v7 = SCDynamicStoreCreate(*v1, @"com.apple.Preferences", 0, 0);
  if (v7)
  {
    id v8 = v7;
    if (!v2 || (CFDictionaryRef v9 = (const __CFDictionary *)SCDynamicStoreCopyValue(v7, v2)) == 0)
    {
      LODWORD(v19) = 0;
      CFArrayRef v13 = 0;
      goto LABEL_38;
    }
    CFDictionaryRef v10 = v9;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFDictionaryGetTypeID())
    {
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v10, @"ExternalInterfaces");
      CFArrayRef v13 = Value;
      if (!Value)
      {
        LODWORD(v19) = 0;
        goto LABEL_37;
      }
      if (CFArrayGetCount(Value))
      {
        CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F41AC8];
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, 0);
        CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v6, v14, ValueAtIndex, (CFStringRef)*MEMORY[0x1E4F41B10]);
        if (NetworkInterfaceEntity)
        {
          CFStringRef v17 = NetworkInterfaceEntity;
          CFArrayRef v13 = (const __CFArray *)SCDynamicStoreCopyValue(v8, NetworkInterfaceEntity);
          if (v13)
          {
            CFDictionaryRef v18 = (const __CFDictionary *)CFDictionaryGetValue(v10, @"Hosts");
            CFDictionaryRef v19 = v18;
            if (v18)
            {
              if (CFDictionaryGetCount(v18))
              {
                uint64_t v20 = CFDictionaryGetValue(v19, @"Current");
                id v21 = v20;
                if (v20) {
                  CFDictionaryRef v19 = (const __CFDictionary *)[v20 integerValue];
                }
                else {
                  CFDictionaryRef v19 = 0;
                }
              }
              else
              {
                CFDictionaryRef v19 = 0;
              }
            }
            CFRelease(v13);
            CFArrayRef v13 = (const __CFArray *)((uint64_t)v19 > 0);
          }
          else
          {
            LODWORD(v19) = 0;
          }
          CFRelease(v17);
          goto LABEL_37;
        }
      }
    }
    LODWORD(v19) = 0;
    CFArrayRef v13 = 0;
LABEL_37:
    CFRelease(v10);
LABEL_38:
    CFRelease(v8);
    if (!v2) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  LODWORD(v19) = 0;
  CFArrayRef v13 = 0;
  if (v2) {
LABEL_39:
  }
    CFRelease(v2);
LABEL_40:
  uint64_t v22 = _PSLoggingFacility();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = @"OFF";
    if (v13) {
      uint64_t v23 = @"ON";
    }
    *(_DWORD *)cStr = 138412546;
    *(void *)&cStr[4] = v23;
    *(_WORD *)&cStr[12] = 1024;
    *(_DWORD *)&cStr[14] = v19;
    _os_log_impl(&dword_1A6597000, v22, OS_LOG_TYPE_DEFAULT, "Tethering is currently %@ with %d devices connected.", (uint8_t *)cStr, 0x12u);
  }

  return v13;
}

id PSCurrentCallTypes()
{
  v11[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v1 = *MEMORY[0x1E4F23B68];
  v11[0] = *MEMORY[0x1E4F23B50];
  v11[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F23B48];
  v11[2] = *MEMORY[0x1E4F23B60];
  v11[3] = v2;
  v11[4] = *MEMORY[0x1E4F23B58];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  CFArrayRef v4 = (const __CFArray *)CTCopyCurrentCallsWithTypes();
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (CFArrayGetCount(v4) >= 1)
    {
      CFIndex v6 = 0;
      do
      {
        CFArrayGetValueAtIndex(v5, v6);
        uint64_t v7 = CTCallGetCallType();
        if (v7)
        {
          [v0 addObject:v7];
        }
        else
        {
          id v8 = _PSLoggingFacility();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)CFDictionaryRef v10 = 0;
            _os_log_impl(&dword_1A6597000, v8, OS_LOG_TYPE_DEFAULT, "Unknown call type", v10, 2u);
          }
        }
        ++v6;
      }
      while (v6 < CFArrayGetCount(v5));
    }
    CFRelease(v5);
  }

  return v0;
}

void PSLog()
{
  if (PSLog_onceToken != -1) {
    dispatch_once(&PSLog_onceToken, &__block_literal_global_260);
  }
}

uint64_t PSIsDebug()
{
  return 0;
}

uint64_t PreferencesTableViewHeaderFont()
{
  return [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
}

uint64_t PreferencesTableViewHeaderColor()
{
  return [MEMORY[0x1E4F428B8] systemGrayColor];
}

uint64_t PreferencesTableViewFooterFont()
{
  return [MEMORY[0x1E4F42EB8] _defaultFontForTableViewStyle:1 isSectionHeader:0];
}

id PreferencesTableViewFooterColor()
{
  uint64_t v0 = [MEMORY[0x1E4F42B58] groupedHeaderConfiguration];
  uint64_t v1 = [v0 textProperties];
  uint64_t v2 = [v1 resolvedColor];

  return v2;
}

float PreferencesTableViewCellRightPad()
{
  return 15.0;
}

float PreferencesTableViewCellLeftPad()
{
  return 15.0;
}

double PSTableSectionFooterTopPad()
{
  return 6.0;
}

double PSTableSectionFooterBottomPad()
{
  return 10.0;
}

double PSTableViewSideInset()
{
  if (PSIsJ99())
  {
    uint64_t v0 = [MEMORY[0x1E4F42738] sharedApplication];
    unint64_t v1 = [v0 statusBarOrientation] - 3;

    if (v1 < 2) {
      return 90.0;
    }
  }
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  char v4 = objc_msgSend(v3, "sf_isiPad");

  double result = 28.0;
  if ((v4 & 1) == 0)
  {
    BOOL v5 = PSIsN56();
    double result = 0.0;
    if (v5) {
      return 20.0;
    }
  }
  return result;
}

double PSTextViewInsets()
{
  return 5.0;
}

id PSPointImageOfColor(void *a1)
{
  id v1 = a1;
  v5.width = 1.0;
  v5.height = 1.0;
  UIGraphicsBeginImageContext(v5);
  [v1 set];

  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  UIRectFill(v6);
  uint64_t v2 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v2;
}

double PSRoundToPixel(double a1)
{
  double v2 = *(double *)&PSRoundToPixel_scale;
  if (*(double *)&PSRoundToPixel_scale == -1.0)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", *(double *)&PSRoundToPixel_scale);
    [v3 scale];
    PSRoundToPixel_scale = v4;

    double v2 = *(double *)&PSRoundToPixel_scale;
  }
  return round(v2 * a1) / v2;
}

uint64_t PSSiriImage()
{
  return objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithApplicationBundleIdentifier:", @"com.apple.siri");
}

id PSPassbookImage()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F42A80];
  id v1 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v1 userInterfaceIdiom]) {
    double v2 = @"com.apple.PassbookStub";
  }
  else {
    double v2 = @"com.apple.Passbook";
  }
  uint64_t v3 = objc_msgSend(v0, "ps_synchronousIconWithApplicationBundleIdentifier:", v2);

  return v3;
}

uint64_t PSAirDropImage()
{
  return objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.airdrop");
}

id _PSFindViewRecursively(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndex:0];
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
    }
    else
    {
      [v3 removeObjectAtIndex:0];
      CGRect v6 = [v4 subviews];
      if ([v6 count]) {
        [v3 addObjectsFromArray:v6];
      }
      _PSFindViewRecursively(v3, a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id PSFindViewOfClass(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3 && a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1E4F1CA48];
    CGRect v6 = [v3 subviews];
    uint64_t v7 = [v5 arrayWithArray:v6];

    _PSFindViewRecursively(v7, a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

id PSAuthorizationTokenForPasscode(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = [v1 UTF8String];
    int v3 = [v1 lengthOfBytesUsingEncoding:4];

    size_t v9 = 64;
    id v4 = malloc_type_malloc(0x40uLL, 0x2957F818uLL);
    if (aks_auth_token_create(0, v2, v3, 0, v4, &v9))
    {
      id v5 = _PSLoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Failed to create authorization token", v8, 2u);
      }

      CGRect v6 = 0;
    }
    else
    {
      CGRect v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:v9];
    }
    __memset_chk();
    free(v4);
  }
  else
  {
    CGRect v6 = 0;
  }
  return v6;
}

uint64_t PSIsNanoMirroringDomain(void *a1)
{
  id v1 = a1;
  uint64_t v10 = 0;
  CFTypeID v11 = &v10;
  uint64_t v12 = 0x2050000000;
  uint64_t v2 = (void *)getNPSDomainAccessorClass_softClass_0;
  uint64_t v13 = getNPSDomainAccessorClass_softClass_0;
  if (!getNPSDomainAccessorClass_softClass_0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getNPSDomainAccessorClass_block_invoke_0;
    v9[3] = &unk_1E5C5D4D8;
    v9[4] = &v10;
    __getNPSDomainAccessorClass_block_invoke_0((uint64_t)v9);
    uint64_t v2 = (void *)v11[3];
  }
  int v3 = v2;
  _Block_object_dispose(&v10, 8);
  id v4 = (void *)[[v3 alloc] initWithDomain:@"com.apple.bulletinboard.apps"];
  id v5 = [v4 objectForKey:v1];
  CGRect v6 = [v5 objectForKeyedSubscript:@"BPSNanoBulletinShowsCustomSettings"];
  uint64_t v7 = [v6 BOOLValue] ^ 1;

  return v7;
}

void sub_1A6657788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSSupportsMesa()
{
  return MGGetBoolAnswer();
}

id PSLocalizableMesaStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = PSPreferencesFrameworkBundle();
  int v3 = [v2 localizedStringForKey:v1 value:&stru_1EFB51FD0 table:@"TouchID"];

  return v3;
}

uint64_t PSIsPearlAvailable()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F50500];
  id v1 = [MEMORY[0x1E4F50508] deviceDescriptorForType:2];
  uint64_t v7 = 0;
  uint64_t v2 = [v0 deviceWithDescriptor:v1 error:&v7];
  uint64_t v3 = v7;

  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

uint64_t PSIsPearlInterlocked()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_msgSend(v0, "sf_isInternalInstall"))
  {
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v2 = [v1 BOOLForKey:@"PSTestIsPearlInterlocked"];

    if (v2) {
      return 1;
    }
  }
  else
  {
  }
  BOOL v4 = (void *)MEMORY[0x1E4F50500];
  uint64_t v5 = [MEMORY[0x1E4F50508] deviceDescriptorForType:2];
  id v16 = 0;
  CGRect v6 = [v4 deviceWithDescriptor:v5 error:&v16];
  id v7 = v16;

  if (v6)
  {
    uint64_t v15 = 0;
    id v14 = 0;
    uint64_t v8 = [v6 bioLockoutState:&v15 forUser:getuid() error:&v14];
    id v9 = v14;
    uint64_t v10 = _PSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeID v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v15];
      uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
      *(_DWORD *)buf = 138413058;
      CFDictionaryRef v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      long long v24 = v12;
      _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "Biolockout state for device: %@, state: %@, error: %@, success: %@", buf, 0x2Au);
    }
    BOOL v3 = v15 == 7;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

id PSLocalizablePearlStringForKey(void *a1)
{
  id v1 = a1;
  char v2 = PSPreferencesFrameworkBundle();
  BOOL v3 = [v2 localizedStringForKey:v1 value:&stru_1EFB51FD0 table:@"Pearl"];

  return v3;
}

uint64_t PSIsLocationRestricted()
{
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  uint64_t v0 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  id v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 containsObject:@"location"];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

id PSHighLegibilityAlternateFont(void *a1)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = *MEMORY[0x1E4F43850];
  v15[0] = *MEMORY[0x1E4F43858];
  v15[1] = v2;
  v16[0] = &unk_1EFB742A0;
  v16[1] = &unk_1EFB742B8;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  BOOL v4 = [v1 fontDescriptor];
  uint64_t v5 = *MEMORY[0x1E4F43808];
  uint64_t v12 = v3;
  uint64_t v13 = v5;
  CGRect v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  id v14 = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v8 = [v4 fontDescriptorByAddingAttributes:v7];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F42A30];
    [v1 pointSize];
    uint64_t v10 = objc_msgSend(v9, "fontWithDescriptor:size:", v8);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

BOOL PSDiagnosticsAreEnabled()
{
  uint64_t v0 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v1 = [v0 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FB8]] == 1;

  return v1;
}

uint64_t PSAnimationOptionsFromAnimationCurve(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    return 0;
  }
  else {
    return ((a1 - 1) << 16) + 0x10000;
  }
}

uint64_t PKIsUSBRestrictedModeDisabledByMobileAsset()
{
  unsigned int v2 = 0;
  uint64_t v10 = 0;
  CFTypeID v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = -5;
  int v9 = 7;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __ACMTRMEnv_Get_block_invoke;
  CGRect v6 = &unk_1E5C60798;
  id v7 = &v10;
  uint64_t v8 = &v2;
  int v0 = ACMKernelControl(18);
  if (!v0) {
    int v0 = *((_DWORD *)v11 + 6);
  }
  _Block_object_dispose(&v10, 8);
  if (v0) {
    return 0;
  }
  else {
    return (v2 >> 4) & 1;
  }
}

void sub_1A6657EAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void PSSetTCCLevelForService(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  CGRect v6 = _PSLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
    int v12 = 138412802;
    uint64_t v13 = a1;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    CFStringRef v17 = v7;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v8 = tcc_server_singleton_default();
  id v9 = v5;
  [v9 cStringUsingEncoding:4];
  uint64_t v10 = (void *)tcc_identity_create();
  CFTypeID v11 = tcc_service_singleton_for_CF_name();
  tcc_server_message_set_authorization_value();
}

void PSGetAuthorizationStatesForService(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = tcc_server_singleton_default();
  id v9 = tcc_service_singleton_for_CF_name();
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  CFTypeID v11 = [MEMORY[0x1E4F1CA48] array];
  int v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = _PSLoggingFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = a1;
    _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", buf, 0xCu);
  }

  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  tcc_server_message_get_authorization_records_by_service();
  if (a2) {
    *a2 = v14;
  }
  if (a3) {
    *a3 = v15;
  }
  if (a4) {
    *a4 = v16;
  }
}

void __PSGetAuthorizationStatesForService_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    CGRect v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    uint64_t v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          id v9 = (id *)(a1 + 48);
          goto LABEL_14;
        case 3:
          id v9 = (id *)(a1 + 40);
          goto LABEL_14;
        case 2:
          id v9 = (id *)(a1 + 32);
LABEL_14:
          [*v9 addObject:v8];
          break;
      }
    }

    goto LABEL_16;
  }
  uint64_t v10 = _PSLoggingFacility();
  CGRect v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PSGetAuthorizationStatesForService_block_invoke_cold_1(a1, a3, v6);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_16:
}

uint64_t PSIsUserParcElisabethEligible()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int domain_answer = os_eligibility_get_domain_answer();
  uint64_t v1 = _PSLoggingFacility();
  BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if (domain_answer)
  {
    if (v2)
    {
      *(_DWORD *)buf = 67109120;
      int v8 = domain_answer;
      uint64_t v3 = "Cannot determine eligibility due to error: %d";
      uint64_t v4 = v1;
      uint32_t v5 = 8;
LABEL_6:
      _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, v3, buf, v5);
    }
  }
  else if (v2)
  {
    *(_WORD *)buf = 0;
    uint64_t v3 = "Unable to determine eligibility ";
    uint64_t v4 = v1;
    uint32_t v5 = 2;
    goto LABEL_6;
  }

  return 0;
}

void ___initAccountsUI_block_invoke()
{
  int v0 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v1 = PSBundlePathForPreferenceBundle(@"AccountSettingsUI");
  BOOL v2 = SFRuntimeAbsoluteFilePathForPath();
  id v3 = [v0 bundleWithPath:v2];

  [v3 load];
  sAccountsUISettingsControllerClass = (uint64_t)NSClassFromString(&cfstr_Acuisettingsco.isa);
  sAccountsUIAddAccountControllerClass = (uint64_t)NSClassFromString(&cfstr_Acuiaddaccount.isa);
}

uint64_t __SetupAssistantLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t __UserManagementLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserManagementLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AppleMediaServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C60730;
    uint64_t v5 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getACAccountStoreClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("ACAccountStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getACAccountStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AuthKitLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C60748;
    uint64_t v5 = 0;
    AuthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!AuthKitLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
LABEL_8:
      __getAKAccountManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AKAccountManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAKAccountManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AuthKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getCDPStateControllerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreCDPLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreCDPLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5C60760;
    uint64_t v6 = 0;
    CoreCDPLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!CoreCDPLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CDPStateController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getCDPStateControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCDPStateControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreCDPLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreCDPLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getNPSDomainAccessorClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __NanoPreferencesSyncLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C60778;
    uint64_t v5 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!NanoPreferencesSyncLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
LABEL_8:
      __getNPSDomainAccessorClass_block_invoke_cold_1_0();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NPSDomainAccessor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getNPSDomainAccessorClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id PSDescriptionForHealthAnalyticsFileWithName(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  BOOL v2 = (void (*)(id))getHKDescriptionForAnalyticsFileWithNameSymbolLoc_ptr;
  uint64_t v10 = getHKDescriptionForAnalyticsFileWithNameSymbolLoc_ptr;
  if (!getHKDescriptionForAnalyticsFileWithNameSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __getHKDescriptionForAnalyticsFileWithNameSymbolLoc_block_invoke;
    v6[3] = &unk_1E5C5D4D8;
    v6[4] = &v7;
    __getHKDescriptionForAnalyticsFileWithNameSymbolLoc_block_invoke((uint64_t)v6);
    BOOL v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    uint64_t v5 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  id v3 = v2(v1);

  return v3;
}

void *__getHKDescriptionForAnalyticsFileWithNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __HealthKitLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E5C60810;
    uint64_t v7 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    BOOL v2 = (void *)HealthKitLibraryCore_frameworkLibrary;
    if (HealthKitLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  BOOL v2 = (void *)HealthKitLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "HKDescriptionForAnalyticsFileWithName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKDescriptionForAnalyticsFileWithNameSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t acm_explicit_bzero(void *a1, rsize_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return _allocatedMem_0;
}

void *acm_mem_alloc_data(size_t size)
{
  uint64_t result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result) {
    _allocatedMem_2 += size;
  }
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = _allocatedMem_2 - __n;
    if (_allocatedMem_2 < __n) {
      uint64_t v4 = 0;
    }
    _allocatedMem_2 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  uint64_t result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result) {
    _allocatedMem_3 += size;
  }
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = _allocatedMem_3 - __n;
    if (_allocatedMem_3 < __n) {
      uint64_t v4 = 0;
    }
    _allocatedMem_3 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2) {
    _allocatedMem_0 += a3;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    long long v6 = "NULL";
    if (result) {
      uint64_t v7 = result;
    }
    else {
      uint64_t v7 = "NULL";
    }
    if (a4) {
      uint64_t v8 = a4;
    }
    else {
      uint64_t v8 = "NULL";
    }
    if (a6) {
      long long v6 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2)
  {
    uint64_t v6 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3) {
      uint64_t v6 = 0;
    }
    _allocatedMem_0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    uint64_t v7 = "NULL";
    if (result) {
      uint64_t v8 = result;
    }
    else {
      uint64_t v8 = "NULL";
    }
    if (a4) {
      uint64_t v9 = a4;
    }
    else {
      uint64_t v9 = "NULL";
    }
    if (a6) {
      uint64_t v7 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v9, a5, v7);
  }
  return result;
}

uint64_t GetSerializedVerifyPolicySize(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, void *a7)
{
  unsigned int v14 = 0;
  uint64_t result = 4294967293;
  if (a1 && __s1 && a7)
  {
    size_t v12 = strnlen(__s1, 0x81uLL);
    if (v12 > 0x80)
    {
      return 4294967293;
    }
    else
    {
      size_t v13 = v12;
      uint64_t result = getLengthOfParameters(a5, a6, &v14);
      if (!result) {
        *a7 = v13 + v14 + 26;
      }
    }
  }
  return result;
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  }
  if (a3)
  {
    *a3 = 0;
    int v6 = 0;
    if (a2)
    {
      uint64_t v7 = a2;
      while (1)
      {
        uint64_t v8 = checkParameter(a1);
        if (v8) {
          break;
        }
        int v9 = v6 + 8;
        int v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9)) {
          goto LABEL_10;
        }
        a1 += 6;
        if (!--v7) {
          goto LABEL_9;
        }
      }
      uint64_t v11 = v8;
      unsigned int v12 = 70;
    }
    else
    {
LABEL_9:
      uint64_t v11 = 0;
      *a3 = v6;
      unsigned int v12 = 10;
    }
  }
  else
  {
LABEL_10:
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  }
  return v11;
}

uint64_t SerializeVerifyPolicy(_OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  unint64_t v21 = 0;
  uint64_t result = 4294967293;
  if (a1)
  {
    if (__s1)
    {
      if (a8)
      {
        if (a7)
        {
          if (a6 <= 0xA && (a5 != 0) == (a6 != 0))
          {
            int v15 = a4;
            uint64_t result = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0, a4, a5, a6, &v21);
            if (!result)
            {
              if (*a8 < v21) {
                return 4294967293;
              }
              *a7 = *a1;
              size_t v17 = strnlen(__s1, 0x81uLL);
              if (v17 > 0x80)
              {
                return 4294967293;
              }
              else
              {
                size_t v18 = v17;
                memcpy(a7 + 1, __s1, v17 + 1);
                uint64_t v19 = (char *)a7 + v18;
                v19[17] = a3;
                *(_DWORD *)(v19 + 18) = v15;
                size_t v20 = v18 + 22;
                uint64_t result = serializeParameters((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v20);
                if (!result) {
                  *a8 = v20;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t serializeParameters(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  LODWORD(v6) = a2;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "serializeParameters");
  }
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a3 && a4)
  {
    uint64_t v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    uint64_t v11 = v10 + 4;
    if (v6)
    {
      uint64_t v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        size_t __n = *(void *)(a1 + 16);
        uint64_t v12 = checkParameter(__src);
        if (v12) {
          break;
        }
        size_t v13 = (_DWORD *)(a3 + v11);
        size_t v14 = __n;
        _DWORD *v13 = __src[0];
        v13[1] = v14;
        v11 += 8;
        if (v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }
        a1 += 24;
        if (!--v6) {
          goto LABEL_11;
        }
      }
      uint64_t v9 = v12;
      unsigned int v8 = 70;
    }
    else
    {
LABEL_11:
      uint64_t v9 = 0;
      *a4 = v11;
      unsigned int v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v9);
  }
  return v9;
}

uint64_t DeserializeVerifyPolicy(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, BOOL *a5, _DWORD *a6, void *a7, _DWORD *a8)
{
  long long v28 = 0;
  unsigned int v27 = 0;
  uint64_t v8 = 4294967293;
  unint64_t v9 = a2 - 16;
  if (a2 >= 0x10 && a1 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    *a3 = *(_OWORD *)a1;
    unint64_t v17 = strnlen((const char *)(a1 + 16), a2 - 16);
    if (v17 > 0x80 || v9 <= v17) {
      return 4294967293;
    }
    long long v26 = a4;
    unint64_t v18 = v17 + 1;
    uint64_t v19 = acm_mem_alloc_data(v17 + 1);
    acm_mem_alloc_info("<data>", v19, v17 + 1, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 349, "DeserializeVerifyPolicy");
    if (!v19) {
      return 4294967292;
    }
    memcpy(v19, (const void *)(a1 + 16), v17 + 1);
    unint64_t v29 = v17 + 17;
    if (v17 + 17 == a2 || (size_t v20 = a5, v21 = *(unsigned char *)(a1 + v17 + 17) != 0, v29 = v17 + 18, a2 - (v17 + 18) < 4))
    {
      uint64_t v8 = 4294967293;
    }
    else
    {
      unint64_t v25 = v17 + 1;
      id v22 = a8;
      int v23 = *(_DWORD *)(a1 + v17 + 18);
      unint64_t v29 = v17 + 22;
      uint64_t v8 = deserializeParameters(a1, a2, &v29, &v28, &v27);
      if (!v8)
      {
        void *v26 = v19;
        *size_t v20 = v21;
        *a6 = v23;
        *a7 = v28;
        _DWORD *v22 = v27;
        return v8;
      }
      unint64_t v18 = v25;
    }
    acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 378, "DeserializeVerifyPolicy");
    acm_mem_free_data(v19, v18);
    if (v28) {
      Util_SafeDeallocParameters(v28, v27);
    }
  }
  return v8;
}

uint64_t deserializeParameters(uint64_t a1, unint64_t a2, unint64_t *a3, void *a4, _DWORD *a5)
{
  p_cb = &OBJC_PROTOCOL___PINEntryView.cb;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "deserializeParameters");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (!a1 || !a3 || !a4 || !a5) {
    goto LABEL_25;
  }
  unint64_t v13 = *a3;
  if (a2 <= *a3)
  {
    LODWORD(v14) = 0;
LABEL_23:
    id v16 = 0;
LABEL_24:
    uint64_t v12 = 0;
    *a4 = v16;
    *a5 = v14;
    unsigned int v11 = 10;
    *a3 = v13;
    goto LABEL_25;
  }
  if (a2 - *a3 < 4 || (uint64_t v14 = *(unsigned int *)(a1 + v13), v14 > 0xA))
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967293;
    goto LABEL_25;
  }
  v13 += 4;
  if (!v14) {
    goto LABEL_23;
  }
  int v27 = v14;
  uint64_t v15 = 24 * v14;
  id v16 = (char *)acm_mem_alloc(24 * v14);
  acm_mem_alloc_info("array of ACMParameter", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 194, "deserializeParameters");
  if (!v16)
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967292;
    goto LABEL_25;
  }
  long long v24 = a4;
  unint64_t v25 = a5;
  long long v26 = a3;
  uint64_t v17 = 0;
  while (1)
  {
    unint64_t v18 = &v16[v17];
    *(void *)&v16[v17 + 8] = 0;
    if (a2 - v13 < 8
      || (*(_DWORD *)unint64_t v18 = *(_DWORD *)(a1 + v13), a2 - (v13 + 4) < 4)
      || (uint64_t v19 = &v16[v17],
          size_t v20 = *(unsigned int *)(a1 + v13 + 4),
          *(_DWORD *)&v16[v17 + 16] = v20,
          v13 += 8,
          a2 - v13 < v20))
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967293;
      goto LABEL_31;
    }
    uint64_t v21 = checkParameter(&v16[v17]);
    if (v21)
    {
      uint64_t v12 = v21;
      unsigned int v11 = 70;
      goto LABEL_31;
    }
    if (v20) {
      break;
    }
LABEL_20:
    v17 += 24;
    if (v15 == v17)
    {
      p_cb = (_DWORD *)(&OBJC_PROTOCOL___PINEntryView + 64);
      a5 = v25;
      a3 = v26;
      a4 = v24;
      LODWORD(v14) = v27;
      goto LABEL_24;
    }
  }
  id v22 = acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v22, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 212, "deserializeParameters");
  *((void *)v18 + 1) = v22;
  if (v22)
  {
    memcpy(v22, (const void *)(a1 + v13), *((unsigned int *)v19 + 4));
    v13 += *((unsigned int *)v19 + 4);
    goto LABEL_20;
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967292;
LABEL_31:
  p_cb = (_DWORD *)(&OBJC_PROTOCOL___PINEntryView + 64);
LABEL_25:
  if (v11 >= *((unsigned __int8 *)p_cb + 536)) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v12);
  }
  return v12;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, void *a11)
{
  unsigned int v18 = 0;
  uint64_t result = 4294967293;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0) == (a10 != 0))
      {
        uint64_t result = getLengthOfParameters(a9, a10, &v18);
        if (!result)
        {
          uint64_t v15 = 29;
          if (a1 == 32) {
            uint64_t v15 = 33;
          }
          uint64_t v16 = v15 + a4;
          if (a1 == 32) {
            uint64_t v17 = a6;
          }
          else {
            uint64_t v17 = 0;
          }
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }
  return result;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, void *a12)
{
  if (!a3) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a12) {
    BOOL v14 = a11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && a10 <= 0xA && (a9 != 0) == (a10 != 0))
  {
    unsigned int v31 = 0;
    uint64_t result = getLengthOfParameters(a9, a10, &v31);
    if (!result)
    {
      uint64_t v21 = 29;
      if (a1 == 32) {
        uint64_t v21 = 33;
      }
      uint64_t v22 = v21 + a4;
      if (a1 == 32) {
        uint64_t v23 = a6;
      }
      else {
        uint64_t v23 = 0;
      }
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293;
      }
      else
      {
        int v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }
        else
        {
          *(void *)a11 = 0;
          *(void *)(a11 + 8) = 0;
        }
        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        uint64_t v24 = a4 + 20;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          uint64_t v25 = a4 + 24;
          memcpy((void *)(a11 + v25), a5, a6);
          uint64_t v24 = v25 + a6;
        }
        uint64_t v26 = a11 + v24;
        *(unsigned char *)uint64_t v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        uint64_t v30 = v24 + 5;
        uint64_t result = serializeParameters((uint64_t)a9, a10, a11, &v30);
        if (!result) {
          *a12 = v30;
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeVerifyAclConstraint(int a1, uint64_t a2, unsigned int a3, _OWORD *a4, void *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, void *a11, _DWORD *a12)
{
  long long v33 = 0;
  unint64_t v34 = 0;
  unsigned int v32 = 0;
  uint64_t v12 = 4294967293;
  if (a2 && a4 && a5 && a6 && a9 && a10 && a11 && a12 && a3 >= 0x10)
  {
    unint64_t v16 = a3;
    *a4 = *(_OWORD *)a2;
    unint64_t v34 = 16;
    if ((a3 & 0xFFFFFFFC) == 0x10)
    {
      uint64_t v12 = 4294967293;
    }
    else
    {
      unint64_t v20 = *(unsigned int *)(a2 + 16);
      unint64_t v34 = 20;
      uint64_t v21 = acm_mem_alloc_data(v20);
      acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 532, "DeserializeVerifyAclConstraint");
      if (v21)
      {
        if (v16 - 20 < v20) {
          goto LABEL_24;
        }
        memcpy(v21, (const void *)(a2 + 20), v20);
        unint64_t v22 = v20 + 20;
        unint64_t v34 = v20 + 20;
        unsigned int v31 = a5;
        if (a1 != 32)
        {
          uint64_t v25 = 0;
          LODWORD(v23) = 0;
          goto LABEL_19;
        }
        if (v16 - v22 < 4)
        {
LABEL_24:
          uint64_t v25 = 0;
          LODWORD(v23) = 0;
        }
        else
        {
          size_t v23 = *(unsigned int *)(a2 + v22);
          unint64_t v24 = v20 + 24;
          unint64_t v34 = v20 + 24;
          uint64_t v25 = acm_mem_alloc_data(v23);
          acm_mem_alloc_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 544, "DeserializeVerifyAclConstraint");
          if (!v25)
          {
            uint64_t v12 = 4294967292;
LABEL_26:
            acm_mem_free_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 580, "DeserializeVerifyAclConstraint");
            acm_mem_free_data(v21, v20);
            if (v25)
            {
              acm_mem_free_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 583, "DeserializeVerifyAclConstraint");
              acm_mem_free_data(v25, v23);
            }
            goto LABEL_30;
          }
          if (v16 - v24 >= v23)
          {
            memcpy(v25, (const void *)(a2 + v24), v23);
            unint64_t v22 = v24 + v23;
            unint64_t v34 = v24 + v23;
LABEL_19:
            if (v22 != v16)
            {
              BOOL v26 = *(unsigned char *)(a2 + v22) != 0;
              unint64_t v34 = v22 + 1;
              if (v16 - (v22 + 1) >= 4)
              {
                unint64_t v30 = v20;
                int v27 = v23;
                size_t v23 = (size_t)v25;
                int v28 = *(_DWORD *)(a2 + v22 + 1);
                unint64_t v34 = v22 + 5;
                uint64_t v12 = deserializeParameters(a2, v16, &v34, &v33, &v32);
                if (!v12)
                {
                  void *v31 = v21;
                  *a7 = v23;
                  *a8 = v27;
                  *a6 = v30;
                  *a9 = v26;
                  *a10 = v28;
                  *a11 = v33;
                  *a12 = v32;
                  return v12;
                }
                uint64_t v25 = (void *)v23;
                LODWORD(v23) = v27;
                unint64_t v20 = v30;
                goto LABEL_26;
              }
            }
          }
        }
        uint64_t v12 = 4294967293;
        goto LABEL_26;
      }
      uint64_t v12 = 4294967292;
    }
  }
LABEL_30:
  if (v33) {
    Util_SafeDeallocParameters(v33, v32);
  }
  return v12;
}

uint64_t GetSerializedProcessAclSize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, void *a9)
{
  unsigned int v12 = 0;
  uint64_t result = 4294967293;
  if (a2 && a3 && a9 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
  {
    uint64_t result = getLengthOfParameters(a7, a8, &v12);
    if (!result) {
      *a9 = a3 + (unint64_t)a5 + v12 + 36;
    }
  }
  return result;
}

uint64_t SerializeProcessAcl(_OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  unint64_t v23 = 0;
  uint64_t result = 4294967293;
  if (a2 && a3)
  {
    BOOL v15 = !a10 || a9 == 0;
    if (!v15 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
    {
      int v17 = a6;
      uint64_t result = GetSerializedProcessAclSize(4294967293, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v23);
      if (!result)
      {
        if (*a10 < v23)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a9 = *a1;
          }
          else
          {
            *(void *)a9 = 0;
            *(void *)(a9 + 8) = 0;
          }
          *(_DWORD *)(a9 + 16) = a3;
          memcpy((void *)(a9 + 20), a2, a3);
          *(_DWORD *)(a9 + a3 + 20) = a5;
          uint64_t v21 = a3 + 24;
          if (a5)
          {
            memcpy((void *)(a9 + v21), a4, a5);
            v21 += a5;
          }
          *(_DWORD *)(a9 + v21) = v17;
          unint64_t v22 = v21 + 4;
          uint64_t result = serializeParameters((uint64_t)a7, a8, a9, (uint64_t *)&v22);
          if (!result) {
            *a10 = v22;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeProcessAcl(uint64_t a1, unsigned int a2, _OWORD *a3, void *a4, _DWORD *a5, void *a6, unsigned int *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  long long v39 = 0;
  unint64_t v40 = 0;
  unsigned int v38 = 0;
  uint64_t v10 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      unsigned int v11 = a4;
      if (a4)
      {
        unsigned int v12 = a5;
        if (a5)
        {
          unint64_t v13 = a6;
          if (a6)
          {
            BOOL v14 = a7;
            if (a7)
            {
              BOOL v15 = a8;
              if (a8)
              {
                if (a9 && a10 && a2 >= 0x10)
                {
                  unint64_t v17 = a2;
                  *a3 = *(_OWORD *)a1;
                  unint64_t v40 = 16;
                  if ((a2 & 0xFFFFFFFC) == 0x10)
                  {
                    uint64_t v10 = 4294967293;
                  }
                  else
                  {
                    unint64_t v18 = *(unsigned int *)(a1 + 16);
                    unint64_t v40 = 20;
                    uint64_t v19 = acm_mem_alloc_data(v18);
                    acm_mem_alloc_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 722, "DeserializeProcessAcl");
                    if (v19)
                    {
                      if (v17 - 20 < v18
                        || (memcpy(v19, (const void *)(a1 + 20), v18), unint64_t v40 = v18 + 20, v17 - (v18 + 20) < 4))
                      {
                        unsigned int v32 = 0;
                        unsigned int v37 = 0;
                        uint64_t v10 = 4294967293;
                      }
                      else
                      {
                        size_t v20 = *(unsigned int *)(a1 + v18 + 20);
                        unint64_t v21 = v18 + 24;
                        unint64_t v40 = v18 + 24;
                        unsigned int v37 = v20;
                        if (!v20)
                        {
                          long long v36 = 0;
                          goto LABEL_20;
                        }
                        long long v33 = v12;
                        unint64_t v34 = v11;
                        unint64_t v22 = v13;
                        unint64_t v23 = v14;
                        unint64_t v24 = v15;
                        size_t v25 = v20;
                        BOOL v26 = acm_mem_alloc_data(v20);
                        acm_mem_alloc_info("<data>", v26, v25, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 734, "DeserializeProcessAcl");
                        if (v26)
                        {
                          int v27 = v26;
                          unsigned int v11 = v34;
                          if (v17 - v21 >= v25)
                          {
                            long long v36 = v27;
                            memcpy(v27, (const void *)(a1 + v21), v25);
                            v21 += v25;
                            unint64_t v40 = v21;
                            BOOL v15 = v24;
                            BOOL v14 = v23;
                            unint64_t v13 = v22;
                            unsigned int v12 = v33;
LABEL_20:
                            if (v17 - v21 < 4)
                            {
                              uint64_t v10 = 4294967293;
                            }
                            else
                            {
                              unint64_t v35 = v18;
                              int v28 = v19;
                              unint64_t v29 = v15;
                              int v30 = *(_DWORD *)(a1 + v21);
                              unint64_t v40 = v21 + 4;
                              uint64_t v10 = deserializeParameters(a1, v17, &v40, &v39, &v38);
                              if (!v10)
                              {
                                *unsigned int v11 = v28;
                                *unsigned int v12 = v35;
                                void *v13 = v36;
                                unsigned int *v14 = v37;
                                _DWORD *v29 = v30;
                                *a9 = v39;
                                *a10 = v38;
                                return v10;
                              }
                              uint64_t v19 = v28;
                              unint64_t v18 = v35;
                            }
                            unsigned int v32 = v36;
                            goto LABEL_32;
                          }
                          uint64_t v10 = 4294967293;
                          unsigned int v32 = v27;
                        }
                        else
                        {
                          unsigned int v32 = 0;
                          uint64_t v10 = 4294967292;
                        }
                      }
LABEL_32:
                      acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 763, "DeserializeProcessAcl");
                      acm_mem_free_data(v19, v18);
                      if (v32)
                      {
                        acm_mem_free_info("<data>", v32, v37, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 766, "DeserializeProcessAcl");
                        acm_mem_free_data(v32, v37);
                      }
                      goto LABEL_34;
                    }
                    uint64_t v10 = 4294967292;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  if (v39) {
    Util_SafeDeallocParameters(v39, v38);
  }
  return v10;
}

uint64_t GetSerializedRequirementSize(_DWORD *a1, uint64_t *a2)
{
  uint64_t v12 = 0;
  uint64_t result = 4294967293;
  if (!a1) {
    return result;
  }
  if (!a2) {
    return result;
  }
  int v5 = *a1;
  if (*a1 > 0x1Cu) {
    return result;
  }
  if (((1 << v5) & 0x1FFCFF4E) != 0)
  {
    uint64_t result = 0;
    *a2 = a1[3] + 16;
    return result;
  }
  if (((1 << v5) & 0x30) == 0)
  {
    if (v5 != 7) {
      return result;
    }
    *a2 = 24;
    uint64_t v9 = a1[5];
    if (v9)
    {
      uint64_t v10 = a1 + 6;
      uint64_t v11 = 24;
      do
      {
        uint64_t result = GetSerializedRequirementSize(*v10, &v12);
        if (result) {
          break;
        }
        v11 += v12;
        *a2 = v11;
        ++v10;
        --v9;
      }
      while (v9);
      return result;
    }
    return 0;
  }
  *a2 = 20;
  uint64_t v6 = a1[4];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = a1 + 5;
  uint64_t v8 = 20;
  while (1)
  {
    uint64_t result = GetSerializedRequirementSize(*v7, &v12);
    if (result) {
      break;
    }
    v8 += v12;
    *a2 = v8;
    ++v7;
    if (!--v6) {
      return 0;
    }
  }
  return result;
}

uint64_t SerializeRequirement(_DWORD *a1, _OWORD *a2, uint64_t *a3)
{
  unint64_t v12 = 0;
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t result = GetSerializedRequirementSize(a1, (uint64_t *)&v12);
        if (!result)
        {
          if (v12 > *a3) {
            return 4294967293;
          }
          *a2 = *(_OWORD *)a1;
          int v7 = *a1;
          uint64_t result = 4294967293;
          if (*a1 <= 0x1Cu)
          {
            if (((1 << v7) & 0x1FFCFF4E) != 0)
            {
              memcpy(a2 + 1, a1 + 4, a1[3]);
              uint64_t v8 = a1[3] + 16;
LABEL_9:
              uint64_t result = 0;
              *a3 = v8;
              return result;
            }
            if (((1 << v7) & 0x30) != 0)
            {
              *((_DWORD *)a2 + 4) = a1[4];
              if (!a1[4])
              {
                uint64_t v8 = 20;
                goto LABEL_9;
              }
              uint64_t v9 = 0;
              uint64_t v8 = 20;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v9 + 5], (char *)a2 + v8, &v11);
                if (result) {
                  break;
                }
                v8 += v11;
                if (++v9 >= (unint64_t)a1[4]) {
                  goto LABEL_9;
                }
              }
            }
            else if (v7 == 7)
            {
              *((void *)a2 + 2) = *((void *)a1 + 2);
              if (!a1[5])
              {
                uint64_t v8 = 24;
                goto LABEL_9;
              }
              uint64_t v10 = 0;
              uint64_t v8 = 24;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v10 + 6], (char *)a2 + v8, &v11);
                if (result) {
                  break;
                }
                v8 += v11;
                if (++v10 >= (unint64_t)a1[5]) {
                  goto LABEL_9;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  __dst = 0;
  uint64_t v4 = 4294967293;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          unsigned int v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              size_t v10 = a1[3] + 16;
              if (v10 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, 0, &__dst);
              if (!v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  uint64_t v4 = 0;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }
                return 4294967292;
              }
              goto LABEL_35;
            }
            if (((1 << v9) & 0x30) != 0)
            {
              uint64_t v13 = a1[4];
              if (8 * v13 + 20 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, v13, &__dst);
              if (v11) {
                goto LABEL_35;
              }
              BOOL v14 = __dst;
              if (!__dst) {
                return 4294967292;
              }
              if (*((_DWORD *)__dst + 3) == 84)
              {
                long long v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                _OWORD *v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  size_t v10 = 20;
                  goto LABEL_11;
                }
                uint64_t v16 = 0;
                size_t v10 = 20;
                while (1)
                {
                  uint64_t v21 = 0;
                  uint64_t v22 = 0;
                  uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if (v11) {
                    goto LABEL_35;
                  }
                  *(void *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                  if (++v16 >= (unint64_t)a1[4]) {
                    goto LABEL_11;
                  }
                }
              }
              goto LABEL_39;
            }
            if (v9 == 7)
            {
              uint64_t v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                uint64_t v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!v11)
                {
                  unint64_t v18 = __dst;
                  if (!__dst) {
                    return 4294967292;
                  }
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    uint64_t v4 = 4294967291;
                    goto LABEL_36;
                  }
                  long long v19 = *(_OWORD *)a1;
                  *((void *)__dst + 2) = *((void *)a1 + 2);
                  *unint64_t v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    size_t v10 = 24;
                    goto LABEL_11;
                  }
                  uint64_t v20 = 0;
                  size_t v10 = 24;
                  while (1)
                  {
                    uint64_t v21 = 0;
                    uint64_t v22 = 0;
                    uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if (v11) {
                      break;
                    }
                    *((void *)__dst + v20 + 3) = v22;
                    v10 += v21;
                    if (++v20 >= (unint64_t)a1[5]) {
                      goto LABEL_11;
                    }
                  }
                }
LABEL_35:
                uint64_t v4 = v11;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  if (__dst) {
    Util_DeallocRequirement((int *)__dst);
  }
  return v4;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, void *a2)
{
  uint64_t result = 4294967293;
  if (a1 && a2 && *a1 <= 0x17u && ((1 << *a1) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a2 = a1[7] + 32;
  }
  return result;
}

uint64_t SerializeCredential(unsigned int *__src, void *__dst, size_t *a3)
{
  uint64_t result = 4294967293;
  if (__src && __dst && a3)
  {
    unsigned int v6 = *__src;
    if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0)
    {
      size_t v8 = __src[7] + 32;
      if (v8 <= *a3 && v6 <= 0x17 && ((1 << v6) & 0xFFF7FE) != 0)
      {
        memcpy(__dst, __src, v8);
        uint64_t result = 0;
        *a3 = __src[7] + 32;
      }
    }
  }
  return result;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, void *a4)
{
  __dst = 0;
  uint64_t v4 = 4294967293;
  if (a2 >= 0x20 && a1 && a3 && a4)
  {
    unsigned int v8 = *a1;
    uint64_t v10 = a1[7];
    switch(*a1)
    {
      case 1u:
        if (v10 == 28) {
          goto LABEL_7;
        }
        return v4;
      case 2u:
        if (v10 == 136) {
          goto LABEL_7;
        }
        return v4;
      case 3u:
        if (v10 == 305) {
          goto LABEL_7;
        }
        return v4;
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 0xEu:
      case 0x10u:
      case 0x13u:
      case 0x16u:
      case 0x17u:
        if (!v10) {
          goto LABEL_7;
        }
        return v4;
      case 7u:
        if (v10 == 56) {
          goto LABEL_7;
        }
        return v4;
      case 9u:
        if (v10 == 24) {
          goto LABEL_7;
        }
        return v4;
      case 0xAu:
        if (v10 == 52) {
          goto LABEL_7;
        }
        return v4;
      case 0xCu:
      case 0xFu:
        if (v10 == 8) {
          goto LABEL_7;
        }
        return v4;
      case 0xDu:
      case 0x15u:
        if (v10 == 132) {
          goto LABEL_7;
        }
        return v4;
      case 0x11u:
        if (v10 == 81) {
          goto LABEL_7;
        }
        return v4;
      case 0x12u:
        if (v10 == 20) {
          goto LABEL_7;
        }
        return v4;
      case 0x14u:
        if (v10 != 32) {
          return v4;
        }
LABEL_7:
        uint64_t v4 = Util_AllocCredential(*a1, &__dst);
        if (v4)
        {
          if (__dst)
          {
LABEL_16:
            Util_DeallocCredential(__dst);
            return v4;
          }
        }
        else
        {
          if (__dst)
          {
            if (*((_DWORD *)__dst + 1) > 3u || *((_DWORD *)__dst + 2) > 0x50u)
            {
              uint64_t v4 = 4294967293;
            }
            else
            {
              uint64_t v4 = 4294967293;
              if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0 && v10 + 32 <= a2)
              {
                memcpy(__dst, a1, v10 + 32);
                uint64_t v4 = 0;
                *a3 = __dst;
                *a4 = v10 + 32;
                return v4;
              }
            }
            goto LABEL_16;
          }
          uint64_t v4 = 4294967292;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  __dst = 0;
  uint64_t v2 = 4294967293;
  if (a1 && a2)
  {
    uint64_t v2 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if (v2)
    {
      if (__dst) {
        Util_DeallocCredential(__dst);
      }
    }
    else if (__dst)
    {
      memcpy(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32);
      uint64_t v2 = 0;
      *a2 = __dst;
    }
    else
    {
      return 4294967292;
    }
  }
  return v2;
}

uint64_t CompareCredentials(void *__s1, void *__s2, unsigned char *a3)
{
  uint64_t v3 = 4294967293;
  if (__s1)
  {
    uint64_t v4 = __s2;
    if (__s2)
    {
      if (a3)
      {
        unsigned int v6 = __s1;
        if (*(_DWORD *)__s1 == *(_DWORD *)__s2)
        {
          uint64_t v7 = *((unsigned int *)__s1 + 7);
          if (v7 == *((_DWORD *)__s2 + 7))
          {
            uint64_t v3 = 4294967293;
            switch(*(_DWORD *)__s1)
            {
              case 1:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 44;
                BOOL v14 = (char *)__s2 + 44;
                goto LABEL_74;
              case 2:
                if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                size_t v8 = *((unsigned int *)__s1 + 9);
                if (v8 != *((_DWORD *)__s2 + 9)) {
                  break;
                }
                __s2 += 5;
                __s1 += 5;
                goto LABEL_8;
              case 3:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 13);
                BOOL v14 = (char *)(__s2 + 13);
                goto LABEL_74;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xC:
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x16:
              case 0x17:
                size_t v8 = v7 + 32;
                goto LABEL_8;
              case 7:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)(__s1 + 4), 0x20uLL, (unint64_t)(__s2 + 4), 32);
                if (!isNullOrEqualMem2) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)(v6 + 8);
                BOOL v14 = (char *)(v4 + 8);
                size_t v21 = 24;
                uint64_t v22 = 24;
                goto LABEL_103;
              case 9:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 5);
                BOOL v14 = (char *)(__s2 + 5);
                goto LABEL_74;
              case 0xA:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)__s1 + 36, 0x10uLL, (unint64_t)__s2 + 36, 16);
                if (!isNullOrEqualMem2) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)v6 + 52;
                BOOL v14 = (char *)v4 + 52;
LABEL_74:
                size_t v21 = 16;
                uint64_t v22 = 16;
                goto LABEL_103;
              case 0xD:
                size_t v8 = *((unsigned int *)__s1 + 8);
                if (v8 != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                __s2 = (void *)((char *)__s2 + 36);
                __s1 = (void *)((char *)__s1 + 36);
LABEL_8:
                LOBYTE(isNullOrEqualMem2) = memcmp(__s1, __s2, v8) == 0;
                goto LABEL_100;
              case 0x14:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL v14 = (char *)(__s2 + 4);
                uint64_t v13 = (char *)(__s1 + 4);
                size_t v21 = 32;
                uint64_t v22 = 32;
                goto LABEL_103;
              case 0x15:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 36;
                BOOL v14 = (char *)__s2 + 36;
                size_t v21 = 128;
                uint64_t v22 = 128;
LABEL_103:
                LOBYTE(isNullOrEqualMem2) = _isNullOrEqualMem2((unint64_t)v13, v21, (unint64_t)v14, v22);
                goto LABEL_100;
              default:
                return v3;
            }
          }
        }
        LOBYTE(isNullOrEqualMem2) = 0;
LABEL_100:
        uint64_t v3 = 0;
        *a3 = isNullOrEqualMem2;
      }
    }
  }
  return v3;
}

BOOL _isNullOrEqualMem2(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  if (!(__s1 | __s2)) {
    return 1;
  }
  BOOL result = 0;
  BOOL v6 = __s1 == 0;
  if (__s2)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = __s1 == 0;
  }
  if (v7 && !v6) {
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  }
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeAddCredential(_OWORD *a1, unsigned int *__src, int a3, uint64_t a4, void *a5)
{
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  uint64_t result = 4294967293;
  if (a5)
  {
    if (a4)
    {
      if (__src)
      {
        if ((v7 & 1) == 0)
        {
          uint64_t result = 4294967293;
          if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0 && *a5 >= (unint64_t)__src[7] + 52)
          {
            if (a1)
            {
              *(_OWORD *)a4 = *a1;
            }
            else
            {
              *(void *)a4 = 0;
              *(void *)(a4 + 8) = 0;
            }
            uint64_t v13 = *a5 - 16;
            uint64_t result = SerializeCredential(__src, (void *)(a4 + 16), (size_t *)&v13);
            if (!result)
            {
              size_t v12 = v13;
              *(_DWORD *)(v13 + a4 + 16) = a3;
              *a5 = v12 + 20;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  size_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v5 = 4294967293;
  if (a1 && a2 >= 0x34 && a3 && a4 && a5)
  {
    *a3 = *(_OWORD *)a1;
    uint64_t v10 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)&v12, &v13);
    if (v10)
    {
      uint64_t v5 = v10;
    }
    else if (a2 - (v13 + 16) >= 4)
    {
      uint64_t v5 = 0;
      *a5 = *(_DWORD *)(a1 + v13 + 16);
      *a4 = v12;
      return v5;
    }
  }
  if (v12) {
    Util_DeallocCredential(v12);
  }
  return v5;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result = 4294967293;
  if (a2 >= 0x34 && a1)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t GetSerializedRemoveCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t GetSerializedReplacePassphraseCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeCredentialList(unsigned int **a1, unsigned int a2, unsigned int *a3, void *a4)
{
  if (a2) {
    BOOL v6 = a1 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6 || a3 == 0 || a4 == 0) {
    return 4294967293;
  }
  v16[7] = v4;
  v16[8] = v5;
  *a3 = a2;
  if (a2)
  {
    uint64_t v11 = a1;
    uint64_t v12 = a2;
    uint64_t v13 = 4;
    while (1)
    {
      BOOL v14 = *v11;
      if (!*v11) {
        return 4294967293;
      }
      v16[0] = *a4 - v13;
      uint64_t result = SerializeCredential(v14, (char *)a3 + v13, v16);
      if (result) {
        return result;
      }
      v13 += v16[0];
      ++v11;
      if (!--v12) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v13 = 4;
LABEL_18:
    uint64_t result = 0;
    *a4 = v13;
  }
  return result;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t v15 = 0;
  uint64_t v4 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        uint64_t v8 = *a1;
        if (v8 <= 0x3E8)
        {
          if (v8)
          {
            uint64_t v10 = (char *)acm_mem_alloc(8 * v8);
            acm_mem_alloc_info("array of ACMCredentialRef", v10, 8 * v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1778, "DeserializeCredentialList");
            if (v10)
            {
              uint64_t v11 = 0;
              uint64_t v12 = 4;
              while (1)
              {
                uint64_t v13 = DeserializeCredential((unsigned int *)((char *)a1 + v12), a2 - v12, (void **)&v10[v11], &v15);
                if (v13) {
                  break;
                }
                v12 += v15;
                v11 += 8;
                if (8 * v8 == v11) {
                  goto LABEL_12;
                }
              }
              uint64_t v4 = v13;
              DeallocCredentialList((_DWORD **)v10, v8);
            }
            else
            {
              return 4294967292;
            }
          }
          else
          {
            uint64_t v10 = 0;
LABEL_12:
            uint64_t v4 = 0;
            *a4 = v8;
            *a3 = v10;
          }
        }
      }
    }
  }
  return v4;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      uint64_t v4 = a1;
      uint64_t v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          *uint64_t v4 = 0;
        }
        ++v4;
        --v5;
      }
      while (v5);
    }
    unint64_t v6 = 8 * v3;
    acm_mem_free_info("array of ACMCredentialRef", a1, v6, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1816, "DeallocCredentialList");
    acm_mem_free(a1, v6);
  }
}

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = 20;
  return result;
}

__n128 SerializeGetContextProperty(__n128 *a1, unsigned __int32 a2, __n128 *a3, void *a4)
{
  if (a1 && a3 && a4 && *a4 >= 0x14uLL)
  {
    __n128 result = *a1;
    *a3 = *a1;
    a3[1].n128_u32[0] = a2;
    *a4 = 20;
  }
  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a2 >= 0x10 && a1 && a3 && a4)
  {
    *a3 = *(_OWORD *)a1;
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x10)
    {
      uint64_t result = 0;
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_GetAclAuthMethod_Serialize(__n128 *a1, __n128 *a2, void *a3)
{
  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_GetAclAuthMethod_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      __n128 result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, void *a5)
{
  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    __n128 result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      __n128 result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(void *a1)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a1 = 8;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, void *a4)
{
  uint64_t result = 4294967293;
  if (a3 && a4 && *a4 >= 8uLL)
  {
    uint64_t result = 0;
    *a3 = a1;
    a3[1] = a2;
    *a4 = 8;
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize(_DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a2 >= 8 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *a1;
      *a4 = a1[1];
    }
  }
  return result;
}

uint64_t LibSer_RemoveCredentialByType_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_RemoveCredentialByType_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, void *a5)
{
  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    __n128 result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_RemoveCredentialByType_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      __n128 result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_DeleteContext_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_DeleteContext_Serialize(__n128 *a1, __n128 *a2, void *a3)
{
  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_DeleteContext_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      __n128 result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a1 && a2 >= 0x14)
  {
    if (a3) {
      *a3 = *(_OWORD *)a1;
    }
    uint64_t result = 0;
    if (a4) {
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a2, a3, &v7);
  if (!result) {
    *a4 = a1 + v7 + 28;
  }
  return result;
}

uint64_t LibSer_StorageSetData_Serialize(_OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a7)
      {
        if (a8)
        {
          unsigned int v18 = 0;
          uint64_t result = getLengthOfParameters(a5, a6, &v18);
          if (!result)
          {
            if (*a8 < a4 + v18 + 28)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a7 = *a1;
              *(_DWORD *)(a7 + 16) = a2;
              *(_DWORD *)(a7 + 20) = a4;
              memcpy((void *)(a7 + 24), a3, a4);
              size_t v17 = a4 + 24;
              uint64_t result = serializeParameters((uint64_t)a5, a6, a7, (uint64_t *)&v17);
              if (!result) {
                *a8 = v17;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, void *a5, void *a6, void *a7, _DWORD *a8)
{
  uint64_t v10 = 4294967293;
  if (a1 && a2 >= 0x18 && a6 && a3 && a4 && a5 && a7 && a8)
  {
    v14[1] = v8;
    v14[2] = v9;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    uint64_t v11 = *(unsigned int *)(a1 + 20);
    v14[0] = 24;
    *a6 = v11;
    if (v11)
    {
      unint64_t v12 = v11 + 24;
      if (v12 > a2) {
        return 4294967293;
      }
      *a5 = a1 + 24;
      v14[0] = v12;
    }
    else
    {
      *a5 = 0;
    }
    return deserializeParameters(a1, a2, v14, a7, a8);
  }
  return v10;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a1, a2, &v5);
  if (!result) {
    *a3 = v5 + 25;
  }
  return result;
}

uint64_t LibSer_StorageGetData_Serialize(_OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a6)
      {
        if (a7)
        {
          unsigned int v16 = 0;
          uint64_t result = getLengthOfParameters(a4, a5, &v16);
          if (!result)
          {
            if (*a7 < (unint64_t)v16 + 25)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a6 = *a1;
              *(_DWORD *)(a6 + 16) = a2;
              *(unsigned char *)(a6 + 20) = a3;
              uint64_t v15 = 21;
              uint64_t result = serializeParameters((uint64_t)a4, a5, a6, &v15);
              if (!result) {
                *a7 = v15;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageGetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, void *a6, _DWORD *a7)
{
  uint64_t v9 = 4294967293;
  if (a1 && a2 >= 0x15 && a3 && a4 && a5)
  {
    v11[1] = v7;
    v11[2] = v8;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    *a5 = *(unsigned char *)(a1 + 20) != 0;
    v11[0] = 21;
    return deserializeParameters(a1, a2, v11, a6, a7);
  }
  return v9;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a1, a2, &v5);
  if (!result) {
    *a3 = v5 + 20;
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, void *a5)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v12 = 0;
        uint64_t result = getLengthOfParameters(a2, a3, &v12);
        if (!result)
        {
          if (*a5 < (unint64_t)v12 + 20)
          {
            return 4294967293;
          }
          else
          {
            *a4 = *a1;
            uint64_t v11 = 16;
            uint64_t result = serializeParameters((uint64_t)a2, a3, (uint64_t)a4, &v11);
            if (!result) {
              *a5 = v11;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 0x10 && a3 && a4)
  {
    if (a5)
    {
      v9[1] = v5;
      v9[2] = v6;
      *a3 = *a1;
      v9[0] = 16;
      return deserializeParameters((uint64_t)a1, a2, v9, a4, a5);
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a2 = a1 + 1;
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __n, char a3, unsigned char *a4, void *a5)
{
  uint64_t result = 4294967293;
  if (__src && __n && a4 && a5)
  {
    size_t v9 = __n + 1;
    if (*a5 < __n + 1)
    {
      return 4294967293;
    }
    else
    {
      *a4 = a3;
      memcpy(a4 + 1, __src, __n);
      uint64_t result = 0;
      *a5 = v9;
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(unsigned char *a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  uint64_t result = 4294967293;
  if (a2 && a5 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a5 = *a1;
      *a3 = a1 + 1;
      *a4 = a2 - 1;
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a2, a3, &v7);
  if (!result) {
    *a4 = a1 + v7 + 24;
  }
  return result;
}

uint64_t LibSer_SEPControl_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293;
  if (a6)
  {
    if (a7)
    {
      unsigned int v18 = 0;
      uint64_t result = getLengthOfParameters(a2, a3, &v18);
      if (!result)
      {
        if (*a7 < a5 + v18 + 24)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a6 = *a1;
          }
          else
          {
            *(void *)a6 = 0;
            *(void *)(a6 + 8) = 0;
          }
          uint64_t v17 = 16;
          uint64_t result = serializeParameters((uint64_t)a2, a3, a6, &v17);
          if (!result)
          {
            uint64_t v15 = v17;
            *(_DWORD *)(a6 + v17) = a5;
            uint64_t v16 = v15 + 4;
            memcpy((void *)(a6 + v15 + 4), a4, a5);
            uint64_t result = 0;
            *a7 = v16 + a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5, unint64_t *a6, void *a7)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 0x18 && a7 && a3 && a4 && a5 && a6)
  {
    *a3 = *a1;
    unint64_t v12 = 16;
    uint64_t result = deserializeParameters((uint64_t)a1, a2, &v12, a4, a5);
    if (!result)
    {
      unint64_t v11 = (unint64_t)a1 + v12 + 4;
      *a7 = *(unsigned int *)((char *)a1 + v12);
      *a6 = v11;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a2 = a1 + 4;
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __n, _DWORD *a3, uint64_t *a4)
{
  uint64_t result = 4294967293;
  if (a3 && a4)
  {
    uint64_t v8 = __n + 4;
    if (*a4 < __n + 4)
    {
      return 4294967293;
    }
    else
    {
      *a3 = __n;
      if (__src) {
        memcpy(a3 + 1, __src, __n);
      }
      else {
        uint64_t v8 = 4;
      }
      uint64_t result = 0;
      *a4 = v8;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, void *a3, void *a4)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 4 && a3 && a4)
  {
    uint64_t result = 0;
    unsigned int v7 = *a1;
    unint64_t v6 = a1 + 1;
    *a4 = v7;
    if (!v7) {
      unint64_t v6 = 0;
    }
    *a3 = v6;
  }
  return result;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (!a1) {
    return 4294967293;
  }
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4]) {
        return 4294967293;
      }
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4) {
        return 4294967293;
      }
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16) {
        return 4294967293;
      }
      break;
    case 3:
      if ((a1[4] - 1001) < 0xFFFFFC18) {
        return 4294967293;
      }
      break;
    case 8:
    case 9:
      if (a1[4] != 1) {
        return 4294967293;
      }
      break;
    case 0xB:
      if (a1[4] > 0x400u) {
        return 4294967293;
      }
      break;
    default:
      return 4294967293;
  }
  return 0;
}

uint64_t LibCall_ACMKernelControl_Block(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  uint64_t v3 = v2;
  size_t v5 = v4;
  unsigned int v7 = v6;
  int v9 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))v1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl_Block");
  }
  uint64_t v17 = 0x2000;
  uint64_t v13 = LibCall_ACMKernelControl(v12, v11, v9, v7, v5, (uint64_t)v18, (uint64_t)&v17);
  if (v3)
  {
    if (v17) {
      BOOL v14 = v18;
    }
    else {
      BOOL v14 = 0;
    }
    (*(void (**)(uint64_t, unsigned char *))(v3 + 16))(v3, v14);
  }
  if (v13) {
    unsigned int v15 = 70;
  }
  else {
    unsigned int v15 = 10;
  }
  if (v15 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl_Block", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMSEPControl_Block(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl_Block");
  }
  size_t v20 = 1024;
  uint64_t v16 = LibCall_ACMSEPControl(a1, a2, a3, a4, a5, a6, a7, v21, &v20);
  if (a8)
  {
    if (v20) {
      uint64_t v17 = v21;
    }
    else {
      uint64_t v17 = 0;
    }
    (*(void (**)(uint64_t, unsigned char *))(a8 + 16))(a8, v17);
  }
  if (v16) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl_Block", (int)v16);
  }
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty_Block(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  int v9 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, unsigned char *, uint64_t *))result;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block");
  }
  uint64_t v14 = 256;
  if (v9)
  {
    uint64_t v13 = 8;
    uint64_t result = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v15, &v13);
    if (result)
    {
LABEL_7:
      uint64_t v10 = result;
      goto LABEL_8;
    }
    if (v13 == 8)
    {
      uint64_t result = v9(a2, 27, 0, &v15, 8, v16, &v14);
      goto LABEL_7;
    }
    uint64_t v10 = 4294967291;
  }
  else
  {
    uint64_t v10 = 4294967293;
  }
LABEL_8:
  if (a5)
  {
    if (v14) {
      uint64_t v11 = v16;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *))(a5 + 16))(a5, v10, v11);
  }
  if (v10) {
    unsigned int v12 = 70;
  }
  else {
    unsigned int v12 = 10;
  }
  if (v12 >= gACMLoggingLevel) {
    return printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block", (int)v10);
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *a4, uint64_t a5)
{
  return LibCall_ACMContextVerifyPolicyWithPreflight_Block(a1, a2, a3, a4, 0, a5);
}

uint64_t LibCall_ACMContextVerifyPolicyWithPreflight_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, uint64_t a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block");
  }
  uint64_t v17 = 0;
  BOOL v16 = 0;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a3 && __s1 && a6)
  {
    uint64_t v13 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, 0, 0, 0, &v16, &v17);
    uint64_t v14 = v17;
    if (!v13)
    {
      (*(void (**)(uint64_t, BOOL, int *))(a6 + 16))(a6, v16, v17);
      uint64_t v14 = v17;
    }
    if (v14) {
      Util_DeallocRequirement(v14);
    }
    if (v13) {
      unsigned int v12 = 70;
    }
    else {
      unsigned int v12 = 10;
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block", (int)v13);
  }
  return v13;
}

int *LibCall_ACMContextVerifyPolicyEx_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  }
  BOOL v17 = 0;
  unsigned int v18 = 0;
  uint64_t v22 = 0;
  BOOL v21 = 0;
  uint64_t v19 = 4294967293;
  if (a3 && __s1 && a9)
  {
    uint64_t v19 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, a6, a7, a8, &v21, &v22);
    unsigned int v18 = v22;
    BOOL v17 = v21;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a9 + 16))(a9, v19, v17, v18);
  uint64_t result = v22;
  if (v22) {
    uint64_t result = (int *)Util_DeallocRequirement(v22);
  }
  if (gACMLoggingLevel <= 0xAu) {
    return (int *)printf("%s: %s: returning.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  }
  return result;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, uint64_t a7)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  }
  *(void *)int v15 = 0;
  uint64_t result = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))a1, a2, v15, 0, 1);
  if (result)
  {
    if (a7) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(a7 + 16))(a7, result, 0, 0);
    }
  }
  else
  {
    uint64_t result = (uint64_t)LibCall_ACMContextVerifyPolicyEx_Block(a1, a2, *(_OWORD **)v15, a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
  }
  if (*(void *)v15) {
    uint64_t result = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1, a2, *(void **)v15, 1);
  }
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  }
  return result;
}

uint64_t LibCall_ACMGetEnvironmentVariable_Block(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block");
  }
  uint64_t v14 = 128;
  if (!a4)
  {
    unsigned int v12 = 70;
    uint64_t v9 = 4294967293;
    goto LABEL_17;
  }
  if (a3 == 36)
  {
    int v8 = acm_mem_alloc_data(0x800uLL);
    acm_mem_alloc_info("<data>", v8, 2048, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 162, "LibCall_ACMGetEnvironmentVariable_Block");
    if (!v8)
    {
      unsigned int v12 = 70;
      uint64_t v9 = 4294967292;
      goto LABEL_17;
    }
    uint64_t v14 = 2048;
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, 36, (uint64_t)v8, (uint64_t)&v14);
    if (!v9)
    {
      if (v14) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = 0;
      }
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v10);
      acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
      acm_mem_free_data(v8, 0x800uLL);
LABEL_16:
      unsigned int v12 = 10;
      goto LABEL_17;
    }
    acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
    acm_mem_free_data(v8, 0x800uLL);
  }
  else
  {
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, a3, (uint64_t)v15, (uint64_t)&v14);
    if (!v9)
    {
      if (v14) {
        uint64_t v11 = v15;
      }
      else {
        uint64_t v11 = 0;
      }
      (*(void (**)(uint64_t, unsigned char *))(a4 + 16))(a4, v11);
      goto LABEL_16;
    }
  }
  unsigned int v12 = 70;
LABEL_17:
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMTRMLoadState_Block(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t))v1;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState_Block");
  }
  uint64_t v11 = 0x2000;
  if (v3)
  {
    uint64_t v7 = LibCall_ACMTRMLoadState(v6, v5, (uint64_t)v12, (uint64_t)&v11);
    if (v7)
    {
      unsigned int v9 = 70;
    }
    else
    {
      if (v11) {
        int v8 = v12;
      }
      else {
        int v8 = 0;
      }
      (*(void (**)(uint64_t, unsigned char *))(v3 + 16))(v3, v8);
      unsigned int v9 = 10;
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v7 = 4294967293;
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState_Block", (int)v7);
  }
  return v7;
}

uint64_t LibCall_ACMContextUnloadToImage_Block(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block");
  }
  if (v3)
  {
    uint64_t v5 = LibCall_ACMContextUnloadToImage(v4);
    if (v5)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, unsigned char *))(v3 + 16))(v3, v8);
      unsigned int v6 = 10;
    }
  }
  else
  {
    unsigned int v6 = 70;
    uint64_t v5 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMGetAclAuthMethod_Block(uint64_t result, uint64_t a2, __n128 *a3, uint64_t a4)
{
  uint64_t v7 = (void (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, unsigned char *, uint64_t *, __n128))result;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  }
  uint64_t v11 = 256;
  if (v7 && a3 && a4)
  {
    uint64_t v10 = 16;
    __n128 AclAuthMethod_Serialize = LibSer_GetAclAuthMethod_Serialize(a3, &v12, &v10);
    if (!v9 && v10 == 16) {
      v7(a2, 31, 0, &v12, 16, v13, &v11, AclAuthMethod_Serialize);
    }
    goto LABEL_9;
  }
  if (a4) {
LABEL_9:
  }
    uint64_t result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraint(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0xBu, a3, a4, a5, 0, 0, a6, a7, a8, a9, a10);
}

uint64_t verifyAclConstraintForOperationCommandInternal(uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  size_t v20 = (uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *))result;
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  }
  size_t v25 = 0;
  BOOL v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    uint64_t v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    uint64_t v22 = v25;
    BOOL v23 = v24;
  }
  else
  {
    if (!a13) {
      goto LABEL_10;
    }
    uint64_t v22 = 0;
    BOOL v23 = 0;
    uint64_t v21 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a13 + 16))(a13, v21, v23, v22);
  uint64_t result = (uint64_t)v25;
  if (v25) {
    uint64_t result = Util_DeallocRequirement(v25);
  }
LABEL_10:
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraintForOperation(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0x20u, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

BOOL Util_isNullOrZeroMemory(unsigned char *a1, uint64_t a2)
{
  if (!a1) {
    return 1;
  }
  if (*a1) {
    return 0;
  }
  return memcmp(a1, a1 + 1, a2 - 1) == 0;
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  BOOL result = 0;
  if (__s1)
  {
    if (__s2) {
      return memcmp(__s1, __s2, __n) == 0;
    }
  }
  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!result && a2) {
    Util_hexDumpToStrHelper_cold_1();
  }
  if (!a3 && a4) {
    Util_hexDumpToStrHelper_cold_2();
  }
  if (a2 >= a4) {
    unint64_t v4 = a4;
  }
  else {
    unint64_t v4 = a2;
  }
  if (v4)
  {
    uint64_t v5 = (unsigned char *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd[(unint64_t)*result >> 4];
      char v6 = *result++;
      unsigned char *v5 = a0123456789abcd[v6 & 0xF];
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, void *a3, void *__src, size_t __n)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_WriteToBuffer");
  }
  if (a3)
  {
    uint64_t v10 = *a3;
    size_t v11 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (a1 && v11 > a2)
      {
        uint64_t v12 = 4294967276;
        goto LABEL_19;
      }
      if (!a1 || !__src || !__n) {
        goto LABEL_12;
      }
      if (!__CFADD__(a1, v10))
      {
        memcpy((void *)(a1 + v10), __src, __n);
LABEL_12:
        uint64_t v12 = 0;
        *a3 = v11;
        unsigned int v13 = 10;
        goto LABEL_13;
      }
    }
    uint64_t v12 = 4294967291;
  }
  else
  {
    uint64_t v12 = 4294967293;
  }
LABEL_19:
  unsigned int v13 = 70;
LABEL_13:
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_WriteToBuffer", (int)v12);
  }
  return v12;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, void *a3, void *__dst, size_t __n)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_ReadFromBuffer");
  }
  uint64_t v10 = 4294967293;
  unsigned int v11 = 70;
  if (a1 && a3)
  {
    uint64_t v12 = *a3;
    size_t v13 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (v13 > a2)
      {
        uint64_t v10 = 4294967276;
        goto LABEL_17;
      }
      if (!__dst || !__n) {
        goto LABEL_11;
      }
      if (!__CFADD__(a1, v12))
      {
        memcpy(__dst, (const void *)(a1 + v12), __n);
LABEL_11:
        uint64_t v10 = 0;
        *a3 = v13;
        unsigned int v11 = 10;
        goto LABEL_12;
      }
    }
    uint64_t v10 = 4294967291;
LABEL_17:
    unsigned int v11 = 70;
  }
LABEL_12:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_ReadFromBuffer", (int)v10);
  }
  return v10;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7) {
    LOBYTE(v1) = 1;
  }
  return v1 & 3;
}

void Util_SafeDeallocParameters(unsigned int *a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      unint64_t v4 = a1 + 4;
      uint64_t v5 = a2;
      do
      {
        char v6 = (void *)*((void *)v4 - 1);
        if (v6)
        {
          unint64_t v7 = *v4;
          acm_mem_free_info("<data>", *((const void **)v4 - 1), v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 118, "Util_SafeDeallocParameters");
          acm_mem_free_data(v6, v7);
        }
        v4 += 6;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMParameter", a1, 24 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 121, "Util_SafeDeallocParameters");
    acm_mem_free(a1, 24 * v3);
  }
}

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_DeallocCredential");
  }
  if (a1)
  {
    uint64_t v2 = 4294967293;
    unsigned int v3 = 70;
    switch(*a1)
    {
      case 1:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated";
        rsize_t v5 = 60;
        char v6 = a1;
        unint64_t v7 = 60;
        int v8 = 144;
        goto LABEL_6;
      case 2:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseEntered";
        rsize_t v5 = 168;
        char v6 = a1;
        unint64_t v7 = 168;
        int v8 = 136;
        goto LABEL_6;
      case 3:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatched";
        rsize_t v5 = 337;
        char v6 = a1;
        unint64_t v7 = 337;
        int v8 = 140;
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        unint64_t v4 = "ACMCredential";
        rsize_t v5 = 32;
        char v6 = a1;
        unint64_t v7 = 32;
        int v8 = 189;
        goto LABEL_6;
      case 7:
        unint64_t v4 = "ACMCredential - ACMCredentialDataUserOutputDisplayed";
        rsize_t v5 = 88;
        char v6 = a1;
        unint64_t v7 = 88;
        int v8 = 152;
        goto LABEL_6;
      case 9:
        unint64_t v4 = "ACMCredential - ACMCredentialDataContinuityUnlock";
        rsize_t v5 = 56;
        char v6 = a1;
        unint64_t v7 = 56;
        int v8 = 156;
        goto LABEL_6;
      case 0xA:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated2";
        rsize_t v5 = 84;
        char v6 = a1;
        unint64_t v7 = 84;
        int v8 = 148;
        goto LABEL_6;
      case 0xC:
      case 0xF:
        unint64_t v4 = "ACMCredential - ACMCredentialDataKextDenyList";
        rsize_t v5 = 40;
        char v6 = a1;
        unint64_t v7 = 40;
        int v8 = 161;
        goto LABEL_6;
      case 0xD:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        rsize_t v5 = 164;
        char v6 = a1;
        unint64_t v7 = 164;
        int v8 = 132;
        goto LABEL_6;
      case 0x11:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSecureIntent";
        rsize_t v5 = 113;
        char v6 = a1;
        unint64_t v7 = 113;
        int v8 = 165;
        goto LABEL_6;
      case 0x12:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatchAttempted";
        rsize_t v5 = 52;
        char v6 = a1;
        unint64_t v7 = 52;
        int v8 = 169;
        goto LABEL_6;
      case 0x14:
        unint64_t v4 = "ACMCredential - ACMCredentialDataAP";
        rsize_t v5 = 64;
        char v6 = a1;
        unint64_t v7 = 64;
        int v8 = 173;
        goto LABEL_6;
      case 0x15:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSignature";
        rsize_t v5 = 164;
        char v6 = a1;
        unint64_t v7 = 164;
        int v8 = 177;
LABEL_6:
        acm_mem_free_info(v4, v6, v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v8, "Util_DeallocCredential");
        acm_mem_free(a1, v5);
        uint64_t v2 = 0;
        unsigned int v3 = 10;
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v2 = 4294967293;
    unsigned int v3 = 70;
  }
  if (v3 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocCredential", (int)v2);
  }
  return v2;
}

uint64_t Util_AllocCredential(int a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  switch(a1)
  {
    case 1:
      rsize_t v5 = acm_mem_alloc(0x3CuLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated", v5, 60, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 226, "Util_AllocCredential");
      int v6 = 28;
      goto LABEL_4;
    case 2:
      rsize_t v5 = acm_mem_alloc(0xA8uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPassphraseEntered", v5, 168, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 216, "Util_AllocCredential");
      int v6 = 136;
      goto LABEL_4;
    case 3:
      rsize_t v5 = acm_mem_alloc(0x151uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatched", v5, 337, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 221, "Util_AllocCredential");
      int v6 = 305;
      goto LABEL_4;
    case 4:
    case 5:
    case 6:
    case 8:
    case 14:
    case 16:
    case 19:
    case 22:
    case 23:
      rsize_t v5 = acm_mem_alloc(0x20uLL);
      acm_mem_alloc_info("ACMCredential", v5, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 280, "Util_AllocCredential");
      int v6 = 0;
      goto LABEL_4;
    case 7:
      rsize_t v5 = acm_mem_alloc(0x58uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", v5, 88, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 236, "Util_AllocCredential");
      int v6 = 56;
      goto LABEL_4;
    case 9:
      rsize_t v5 = acm_mem_alloc(0x38uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataContinuityUnlock", v5, 56, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 241, "Util_AllocCredential");
      int v6 = 24;
      goto LABEL_4;
    case 10:
      rsize_t v5 = acm_mem_alloc(0x54uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated2", v5, 84, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 231, "Util_AllocCredential");
      int v6 = 52;
      goto LABEL_4;
    case 12:
    case 15:
      rsize_t v5 = acm_mem_alloc(0x28uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataKextDenyList", v5, 40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 247, "Util_AllocCredential");
      int v6 = 8;
      goto LABEL_4;
    case 13:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
      int v8 = v5;
      int v9 = 211;
      goto LABEL_18;
    case 17:
      rsize_t v5 = acm_mem_alloc(0x71uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataSecureIntent", v5, 113, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 252, "Util_AllocCredential");
      int v6 = 81;
      goto LABEL_4;
    case 18:
      rsize_t v5 = acm_mem_alloc(0x34uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", v5, 52, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 257, "Util_AllocCredential");
      int v6 = 20;
      goto LABEL_4;
    case 20:
      rsize_t v5 = acm_mem_alloc(0x40uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataAP", v5, 64, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 262, "Util_AllocCredential");
      int v6 = 32;
      goto LABEL_4;
    case 21:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataSignature";
      int v8 = v5;
      int v9 = 267;
LABEL_18:
      acm_mem_alloc_info(v7, v8, 164, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v9, "Util_AllocCredential");
      int v6 = 132;
LABEL_4:
      if (v5)
      {
        uint64_t result = 0;
        _DWORD *v5 = a1;
        v5[1] = 1;
        v5[7] = v6;
        v5[3] = -1;
        *a2 = v5;
      }
      else
      {
        uint64_t result = 4294967292;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, void *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  }
  if (a3)
  {
    uint64_t v6 = 4294967293;
    unsigned int v7 = 70;
    switch(a1)
    {
      case 1:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        uint64_t v12 = v8;
        int v13 = 338;
        goto LABEL_49;
      case 2:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        uint64_t v12 = v8;
        int v13 = 343;
        goto LABEL_49;
      case 3:
        int v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v8, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        int v9 = 156;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 4:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataOr";
        int v15 = v8;
        int v16 = 406;
        goto LABEL_28;
      case 5:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataAnd";
        int v15 = v8;
        int v16 = 398;
LABEL_28:
        acm_mem_alloc_info(v14, v15, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v16, "Util_AllocRequirement");
        int v9 = 84;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        int v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info("ACMRequirement", v8, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        int v9 = 0;
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_50;
      case 7:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v8, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        int v9 = 88;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 8:
        int v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v8, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        int v9 = 1024;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 13:
        int v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v8, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        int v9 = 32;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        uint64_t v12 = v8;
        int v13 = 353;
        goto LABEL_49;
      case 21:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        uint64_t v12 = v8;
        int v13 = 358;
LABEL_49:
        acm_mem_alloc_info(v11, v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_AllocRequirement");
        int v9 = 4;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 24:
        int v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v8, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        int v9 = 1060;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 25:
        int v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v8, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        int v9 = 43;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 26:
        int v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v8, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        int v9 = 28;
        if (!v8)
        {
LABEL_50:
          uint64_t v6 = 4294967292;
          goto LABEL_54;
        }
LABEL_6:
        _DWORD *v8 = a1;
        *(void *)(v8 + 1) = 0x100000001;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }
        else if (a1 == 1000)
        {
          v8[13] = a2;
        }
        else if (a1 == 7)
        {
          v8[5] = a2;
        }
        uint64_t v6 = 0;
        *a3 = v8;
        unsigned int v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
              goto LABEL_53;
            }
            int v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v8, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            int v9 = 120;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1001:
            int v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v8, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            int v9 = 168;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1002:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            uint64_t v12 = v8;
            int v13 = 424;
            goto LABEL_49;
          case 1003:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            uint64_t v12 = v8;
            int v13 = 429;
            goto LABEL_49;
          case 1004:
            int v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            int v9 = 16;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }
  else
  {
LABEL_53:
    uint64_t v6 = 4294967293;
LABEL_54:
    unsigned int v7 = 70;
  }
LABEL_17:
  if (v7 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v6);
  }
  return v6;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_CreateRequirement");
  }
  uint64_t v5 = 0;
  Util_AllocRequirement(a1, a2, &v5);
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "Util_CreateRequirement");
  }
  return v5;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  }
  if (!a1)
  {
    uint64_t v7 = 4294967293;
    unsigned int v8 = 70;
    goto LABEL_28;
  }
  int v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        unint64_t v6 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000) {
        goto LABEL_25;
      }
      if (a1[13])
      {
        unint64_t v4 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      unint64_t v5 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5) {
      goto LABEL_25;
    }
    if (a1[4])
    {
      unint64_t v3 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  int v2 = *a1;
LABEL_25:
  uint64_t v7 = 4294967293;
  unsigned int v8 = 70;
  switch(v2)
  {
    case 1:
      int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 542;
      goto LABEL_27;
    case 2:
      int v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 546;
      goto LABEL_27;
    case 3:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      rsize_t v10 = 172;
      unsigned int v11 = a1;
      unint64_t v12 = 172;
      int v13 = 550;
      goto LABEL_27;
    case 4:
      int v9 = "ACMRequirement - ACMRequirementDataOr";
      rsize_t v10 = 100;
      unsigned int v11 = a1;
      unint64_t v12 = 100;
      int v13 = 595;
      goto LABEL_27;
    case 5:
      int v9 = "ACMRequirement - ACMRequirementDataAnd";
      rsize_t v10 = 100;
      unsigned int v11 = a1;
      unint64_t v12 = 100;
      int v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      int v9 = "ACMRequirement";
      rsize_t v10 = 16;
      unsigned int v11 = a1;
      unint64_t v12 = 16;
      int v13 = 538;
      goto LABEL_27;
    case 7:
      int v9 = "ACMRequirement - ACMRequirementDataKofN";
      rsize_t v10 = 104;
      unsigned int v11 = a1;
      unint64_t v12 = 104;
      int v13 = 584;
      goto LABEL_27;
    case 8:
      int v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      rsize_t v10 = 1040;
      unsigned int v11 = a1;
      unint64_t v12 = 1040;
      int v13 = 574;
      goto LABEL_27;
    case 13:
      int v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      rsize_t v10 = 48;
      unsigned int v11 = a1;
      unint64_t v12 = 48;
      int v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      int v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 554;
      goto LABEL_27;
    case 21:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 558;
      goto LABEL_27;
    case 24:
      int v9 = "ACMRequirement - ACMRequirementDataAP";
      rsize_t v10 = 1076;
      unsigned int v11 = a1;
      unint64_t v12 = 1076;
      int v13 = 566;
      goto LABEL_27;
    case 25:
      int v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      rsize_t v10 = 59;
      unsigned int v11 = a1;
      unint64_t v12 = 59;
      int v13 = 570;
      goto LABEL_27;
    case 26:
      int v9 = "ACMRequirement - ACMRequirementDataRatchet";
      rsize_t v10 = 44;
      unsigned int v11 = a1;
      unint64_t v12 = 44;
      int v13 = 579;
LABEL_27:
      acm_mem_free_info(v9, v11, v12, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      uint64_t v7 = 0;
      unsigned int v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          int v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          rsize_t v10 = 136;
          unsigned int v11 = a1;
          unint64_t v12 = 136;
          int v13 = 601;
          goto LABEL_27;
        case 1001:
          int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          rsize_t v10 = 184;
          unsigned int v11 = a1;
          unint64_t v12 = 184;
          int v13 = 605;
          goto LABEL_27;
        case 1002:
          int v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          rsize_t v10 = 20;
          unsigned int v11 = a1;
          unint64_t v12 = 20;
          int v13 = 609;
          goto LABEL_27;
        case 1003:
          int v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          rsize_t v10 = 20;
          unsigned int v11 = a1;
          unint64_t v12 = 20;
          int v13 = 613;
          goto LABEL_27;
        case 1004:
          int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          rsize_t v10 = 32;
          unsigned int v11 = a1;
          unint64_t v12 = 32;
          int v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v7);
  }
  return v7;
}

void Util_hexDumpToStrHelper_cold_1()
{
}

void Util_hexDumpToStrHelper_cold_2()
{
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  uint64_t v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))ioKitTransport, (uint64_t)&v6, a1, &_logLevel, 1);
  if (v2)
  {
    updateLogLevelFromKext();
    unsigned int v3 = 70;
  }
  else
  {
    unsigned int v3 = 10;
    if (a1 && _logLevel <= 0x28u)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *a1;
        if (*a1) {
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        }
        *(_DWORD *)buf = 136315650;
        unsigned int v8 = "ACMLib";
        __int16 v9 = 2080;
        rsize_t v10 = "ACMContextCreate";
        __int16 v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      unsigned int v3 = 10;
    }
  }
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v2;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t ioKitTransport(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    uint64_t v14 = init();
    unsigned int v15 = 70;
    if (v14)
    {
      uint64_t v16 = v14;
    }
    else
    {
      uint64_t v16 = performCommand(*a1, a2, a3, a4, a5, a6, a7);
      if (v16) {
        unsigned int v15 = 70;
      }
      else {
        unsigned int v15 = 10;
      }
    }
  }
  else
  {
    unsigned int v15 = 70;
    uint64_t v16 = 4294967293;
  }
  if (v15 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    __int16 v22 = 2048;
    uint64_t v23 = (int)v16;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v8 = 0;
  uint64_t v4 = LibCall_ACMContextCreateWithExternalForm((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *))ioKitTransport, (uint64_t)&v8, a1, a2, &_logLevel, 1);
  if (v4)
  {
    if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v5 = v4[4];
      *(_DWORD *)buf = 136315650;
      rsize_t v10 = "ACMLib";
      __int16 v11 = 2080;
      uint64_t v12 = "ACMContextCreateWithExternalForm";
      __int16 v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }
    unsigned int v6 = 30;
  }
  else
  {
    updateLogLevelFromKext();
    unsigned int v6 = 70;
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, -> ctx = %p.\n", buf, 0x20u);
  }
  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  unsigned int v4 = _logLevel;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    unsigned int v4 = _logLevel;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = a1[4];
    unsigned int v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "ACMLib";
    uint64_t v14 = "ACMContextDelete";
    __int16 v13 = 2080;
    if (a2) {
      unsigned int v6 = "destroyed";
    }
    __int16 v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(void *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  rsize_t v10 = a1;
  uint64_t v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))ioKitTransport, (uint64_t)&v10, a1, a2);
  if (v7) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    __int16 v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1 || !a2 || init() || performCommand((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0)) {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0, 0);
  }
  else {
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t init()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "init";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v7, 0x16u);
  }
  if (_initialized)
  {
    uint64_t v0 = 0;
  }
  else
  {
    mach_port_t v1 = *MEMORY[0x1E4F2EF00];
    CFDictionaryRef v2 = IOServiceMatching("AppleCredentialManager");
    io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      unsigned int v5 = 70;
      uint64_t v0 = 4294967291;
      goto LABEL_10;
    }
    io_object_t v4 = MatchingService;
    uint64_t v0 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, (io_connect_t *)&_connect);
    if (v0)
    {
      unsigned int v5 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v4);
    _initialized = 1;
  }
  unsigned int v5 = 10;
LABEL_10:
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    uint64_t v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "init";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v0;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
  }
  return v0;
}

uint64_t performCommand(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t inputStructCnt = 0;
  uint64_t v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    __int16 v15 = v14;
    if (!a6 && a7)
    {
      uint64_t v18 = 4294967293;
    }
    else
    {
      if (a7) {
        size_t v16 = *a7;
      }
      else {
        size_t v16 = 0;
      }
      size_t v22 = v16;
      uint64_t v17 = IOConnectCallStructMethod(_connect, 0, v14, inputStructCnt, a6, &v22);
      uint64_t v18 = v17;
      if (a1) {
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      }
      if (v17)
      {
        if (_logLevel <= 0x46u && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          __int16 v30 = 1024;
          int v31 = v18;
          __int16 v32 = 1024;
          int v33 = v18;
          _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        uint64_t v18 = 0;
        if (a7) {
          *a7 = v22;
        }
      }
    }
    size_t v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if (v18) {
      unsigned int v20 = 70;
    }
    else {
      unsigned int v20 = 10;
    }
  }
  else
  {
    unsigned int v20 = 70;
    uint64_t v18 = 4294967291;
  }
  if (v20 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    __int16 v28 = 2048;
    *(void *)unint64_t v29 = (int)v18;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

uint64_t ACMContextAddCredential(_OWORD *a1, unsigned int *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    __int16 v6 = "ACMLib";
    __int16 v7 = 2080;
    uint64_t v8 = "ACMContextAddCredential";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextAddCredentialWithScope(a1, a2, 1);
}

uint64_t ACMContextAddCredentialWithScope(_OWORD *a1, unsigned int *a2, int a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = init();
    if (SerializedAddCredentialSize
      || (uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &size),
          SerializedAddCredentialSize))
    {
      uint64_t v9 = SerializedAddCredentialSize;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 325, "ACMContextAddCredentialWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeAddCredential(a1, a2, a3, (uint64_t)v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand((uint64_t)a1, 5, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        size_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 338, "ACMContextAddCredentialWithScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextRemoveCredentialsByType(_OWORD *a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextRemoveCredentialsByType";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByTypeAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    size_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 386, "ACMContextRemoveCredentialsByTypeAndScope");
      if (v7)
      {
        if (a1)
        {
          *__int16 v7 = *a1;
        }
        else
        {
          *(void *)__int16 v7 = 0;
          *((void *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = performCommand((uint64_t)a1, 9, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 407, "ACMContextRemoveCredentialsByTypeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if (v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }
      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    size_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextRemoveCredentialsByValue(uint64_t a1, _DWORD *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    uint64_t v8 = "ACMContextRemoveCredentialsByValue";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByValueAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByValueAndScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t v10 = init();
    if (v10 || (uint64_t v10 = GetSerializedRemoveCredentialSize(a1, a2, a3, &size), v10))
    {
      uint64_t v9 = v10;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 457, "ACMContextRemoveCredentialsByValueAndScope");
      if (v12)
      {
        uint64_t v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand(a1, 6, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        size_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 470, "ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsCredentialType(_OWORD *a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextContainsCredentialType";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextContainsCredentialTypeEx(a1, a2, 0);
}

uint64_t ACMContextContainsCredentialTypeEx(_OWORD *a1, int a2, int a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  int v14 = 0;
  size_t v13 = 4;
  if (a1)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 576, "ACMContextContainsCredentialTypeEx");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)__int16 v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = performCommand((uint64_t)a1, 4, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 590, "ACMContextContainsCredentialTypeEx");
        acm_mem_free_data(v7, 0x18uLL);
        if (v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        uint64_t v11 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMGlobalContextAddCredential(unsigned int *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  if (a1)
  {
    uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
    if (!v2) {
      uint64_t v2 = ACMContextAddCredentialWithScope(v6, a1, 2);
    }
    uint64_t v3 = v2;
    if (v6) {
      ACMContextDelete(v6, 1);
    }
    if (v3) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  else
  {
    unsigned int v4 = 70;
    uint64_t v3 = 4294967293;
  }
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMGlobalContextRemoveCredentialsByType(int a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
  if (!v2) {
    uint64_t v2 = ACMContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  }
  uint64_t v3 = v2;
  if (v6) {
    ACMContextDelete(v6, 1);
  }
  if (v3) {
    unsigned int v4 = 70;
  }
  else {
    unsigned int v4 = 10;
  }
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 492, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          *__int16 v7 = *a1;
        }
        else
        {
          *(void *)__int16 v7 = 0;
          *((void *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = performCommand((uint64_t)a1, 16, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 513, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if (v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }
      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextReplacePassphraseCredentialsWithScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedReplacePassphraseCredentialSize = init();
    if (SerializedReplacePassphraseCredentialSize
      || (uint64_t SerializedReplacePassphraseCredentialSize = GetSerializedReplacePassphraseCredentialSize(a1, a2, a3, &size),
          SerializedReplacePassphraseCredentialSize))
    {
      uint64_t v9 = SerializedReplacePassphraseCredentialSize;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 538, "ACMContextReplacePassphraseCredentialsWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeReplacePassphraseCredential(a1, a2, a3, v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand(a1, 15, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        bzero(v12, size);
        size_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 552, "ACMContextReplacePassphraseCredentialsWithScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsPassphraseCredentialWithPurpose(_OWORD *a1, int a2, int a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  int v14 = 0;
  size_t v13 = 4;
  if (a1)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }
    else
    {
      char v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 614, "ACMContextContainsPassphraseCredentialWithPurpose");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)char v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = performCommand((uint64_t)a1, 13, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 628, "ACMContextContainsPassphraseCredentialWithPurpose");
        acm_mem_free_data(v7, 0x18uLL);
        if (v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        uint64_t v11 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMContextVerifyPolicy(_OWORD *a1, char *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextVerifyPolicy_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMContextVerifyPolicyWithPreflight(_OWORD *a1, char *__s1, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v11 = a1;
  uint64_t v8 = LibCall_ACMContextVerifyPolicyWithPreflight_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v11, a1, __s1, a3, a4);
  if (v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    __int16 v16 = 2048;
    uint64_t v17 = (int)v8;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v8;
}

void ACMContextVerifyPolicyEx(_OWORD *a1, char *__s1, uint64_t a3, _DWORD *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  __int16 v14 = a1;
  LibCall_ACMContextVerifyPolicyEx_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v14, a1, __s1, a3, a4, a5, a6, a7);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMGlobalContextVerifyPolicy(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  *(void *)uint64_t v11 = 0;
  uint64_t v10 = ACMContextCreate((uint64_t *)v11);
  if (v10)
  {
    if (a5) {
      (*(void (**)(uint64_t, uint64_t, void, void))(a5 + 16))(a5, v10, 0, 0);
    }
  }
  else
  {
    ACMContextVerifyPolicyEx(*(_OWORD **)v11, a1, a2, a3, a4, 0xFFFFFFFFLL, a5);
  }
  if (*(void *)v11) {
    ACMContextDelete(*(_DWORD **)v11, 1);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMContextVerifyAclConstraint(_OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  unsigned int v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)ioKitTransport, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ACMContextVerifyAclConstraintForOperation(_OWORD *a1, const void *a2, uint64_t a3, const void *a4, unsigned int a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  uint64_t v11 = a1;
  return LibCall_ACMContextVerifyAclConstraintForOperation((uint64_t)ioKitTransport, (uint64_t)&v11, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t ACMContextGetTrackingNumber(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t ACMParseAclAndCopyConstraintCharacteristics(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  size_t __n = 4096;
  size_t size = 0;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "ACMLib";
    __int16 v23 = 2080;
    uint64_t v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 4294967293;
  if (!a1 || !a2 || !a3) {
    goto LABEL_28;
  }
  uint64_t SerializedProcessAclSize = init();
  if (SerializedProcessAclSize
    || (uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize(0, (uint64_t)a1, a2, 0, 0, 0, 0, 0, &size),
        SerializedProcessAclSize))
  {
    uint64_t v6 = SerializedProcessAclSize;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t, void, uint64_t))(a3 + 16))(a3, v6, 0, 4096);
    goto LABEL_19;
  }
  size_t v8 = size;
  unsigned int v9 = acm_mem_alloc_data(size);
  acm_mem_alloc_info("<data>", v9, v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 744, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v9)
  {
    uint64_t v6 = 4294967292;
    goto LABEL_28;
  }
  uint64_t v10 = SerializeProcessAcl(0, a1, a2, 0, 0, 0, 0, 0, (uint64_t)v9, &size);
  if (v10)
  {
    uint64_t v6 = v10;
    __int16 v12 = 0;
    __int16 v14 = 0;
    size_t v11 = 4096;
    goto LABEL_15;
  }
  size_t v11 = 4096;
  __int16 v12 = acm_mem_alloc_data(0x1000uLL);
  acm_mem_alloc_info("<data>", v12, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 750, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v12)
  {
    __int16 v14 = 0;
LABEL_31:
    uint64_t v6 = 4294967292;
    goto LABEL_15;
  }
  uint64_t v13 = performCommand(0, 20, 0, v9, size, v12, &__n);
  size_t v11 = __n;
  if (v13)
  {
    uint64_t v6 = v13;
    __int16 v14 = 0;
    goto LABEL_15;
  }
  __int16 v14 = acm_mem_alloc_data(__n);
  acm_mem_alloc_info("<data>", v14, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 756, "ACMParseAclAndCopyConstraintCharacteristics");
  size_t v11 = __n;
  if (!v14) {
    goto LABEL_31;
  }
  memcpy(v14, v12, __n);
  uint64_t v6 = 0;
  size_t v11 = __n;
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, void *, size_t))(a3 + 16))(a3, v6, v14, v11);
  size_t v15 = size;
  acm_mem_free_info("<data>", v9, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 767, "ACMParseAclAndCopyConstraintCharacteristics");
  acm_mem_free_data(v9, v15);
  if (v12)
  {
    acm_mem_free_info("<data>", v12, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 770, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v12, 0x1000uLL);
  }
  if (v14)
  {
    size_t v16 = __n;
    acm_mem_free_info("<data>", v14, __n, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 773, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v14, v16);
  }
LABEL_19:
  if (v6) {
    unsigned int v17 = 70;
  }
  else {
    unsigned int v17 = 10;
  }
  if (v17 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "ACMLib";
    __int16 v23 = 2080;
    uint64_t v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    __int16 v25 = 2048;
    uint64_t v26 = (int)v6;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMCredentialGetProperty(int *a1, int a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMCredentialGetPropertyData(a1, a2, &v10, &v9);
    if (v7)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, uint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  if (a1 && a2)
  {
    int v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        unint64_t v6 = 0;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }
    else if (v4 == 5)
    {
      if (a1[4])
      {
        unint64_t v7 = 0;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }
    else if (v4 == 7 && a1[5])
    {
      unint64_t v5 = 0;
      do
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unint64_t v9 = 0;
  __int16 v10 = 0;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if (v7)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

uint64_t ACMRequirementGetProperties(int *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v4 = 4294967293;
  unsigned int v5 = 70;
  if (a1 && a2)
  {
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 1, a1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 2, a1 + 1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 3, a1 + 2, 4);
    uint64_t v4 = 0;
    int v6 = *a1;
    unsigned int v5 = 10;
    switch(*a1)
    {
      case 1:
        goto LABEL_10;
      case 2:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 200, a1 + 4, 4);
        goto LABEL_13;
      case 3:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 300, a1 + 5, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 302, a1 + 9, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 301, a1 + 13, 8);
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        break;
      case 7:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 700, a1 + 4, 4);
        goto LABEL_13;
      default:
        if (v6 != 20 && v6 != 21) {
          break;
        }
LABEL_10:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
LABEL_13:
        uint64_t v4 = 0;
        unsigned int v5 = 10;
        break;
    }
  }
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v8, 0x20u);
  }
  return v4;
}

void ACMGetAclAuthMethod(__n128 *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v4 = a1;
  LibCall_ACMGetAclAuthMethod_Block((uint64_t)ioKitTransport, (uint64_t)&v4, a1, a2);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v9 = 0;
  uint64_t v6 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))ioKitTransport, (uint64_t)&v9, a1, 0, 0, 0, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    __int16 v16 = 1024;
    int v17 = a1;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v6;
}

uint64_t ACMSetEnvironmentVariableWithAccessPolicy(int a1, _OWORD *a2, _OWORD *a3, uint64_t a4, const void *a5, size_t a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v15 = 0;
  uint64_t v12 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if (v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    __int16 v22 = 1024;
    int v23 = a1;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v12;
}

uint64_t ACMGetEnvironmentVariable(int a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v7 = 0;
  uint64_t v4 = LibCall_ACMGetEnvironmentVariable_Block((uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v7, a1, a2);
  if (v4) {
    unsigned int v5 = 70;
  }
  else {
    unsigned int v5 = 10;
  }
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    __int16 v14 = 1024;
    int v15 = a1;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v4;
}

uint64_t ACMKernelControl(int a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMKernelControl";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v2 = LibCall_ACMKernelControl_Block((uint64_t)ioKitTransport);
  if (v2) {
    unsigned int v3 = 70;
  }
  else {
    unsigned int v3 = 10;
  }
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMKernelControl";
    __int16 v9 = 2048;
    uint64_t v10 = (int)v2;
    __int16 v11 = 1024;
    int v12 = a1;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, code=%u.\n", buf, 0x26u);
  }
  return v2;
}

uint64_t ACMSEPControl(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v4, a1, a2, 0, 0, 0, a3);
}

uint64_t ACMSEPControlEx(uint64_t a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v7 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v7, a4, a5, a1, a2, a3, a6);
}

void ACMGlobalContextCredentialGetProperty(int a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v8 = "ACMLib";
    __int16 v9 = 2080;
    uint64_t v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  LibCall_ACMGlobalContextCredentialGetProperty_Block((uint64_t)ioKitTransport, (uint64_t)&v6, a1, a2, a3);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v8 = "ACMLib";
    __int16 v9 = 2080;
    uint64_t v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMContextCredentialGetProperty(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    __int16 v18 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v10 = 256;
  if (a4)
  {
    __int16 v9 = a1;
    uint64_t v8 = LibCall_ACMContextCredentialGetProperty((uint64_t (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128))ioKitTransport, (uint64_t)&v9, a1, a2, a3, (uint64_t)buf, (uint64_t)&v10);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, uint64_t))(a4 + 16))(a4, v8, buf, v10);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v11 = 136315394;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", v11, 0x16u);
  }
}

uint64_t ACMContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = ACMContextSetDataEx(a1, a2, 0, 0, a3, a4);
  if (v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextSetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, const void *a5, size_t a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMContextSetDataEx";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  __int16 v15 = a1;
  uint64_t v12 = LibCall_ACMContextSetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, void, void))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if (v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMContextSetDataEx";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v12;
}

uint64_t ACMContextGetData(_OWORD *a1, int a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v9, 0x16u);
  }
  uint64_t Data = ACMContextGetDataEx(a1, a2, 0, 0, a3);
  if (Data) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    __int16 v13 = 2048;
    uint64_t v14 = (int)Data;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v9, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int size_4 = 136315394;
    uint64_t v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&size_4, 0x16u);
  }
  unsigned int size = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 4;
  uint64_t v19 = a1;
  uint64_t v10 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v19, a1, a2, 1, a3, a4, (uint64_t)&size, (uint64_t)&v21);
  if (!v10)
  {
    uint64_t v11 = size;
    if (size)
    {
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1199, "ACMContextGetDataEx");
      if (!v12)
      {
        unsigned int v16 = 70;
        uint64_t v14 = 4294967292;
        goto LABEL_15;
      }
      uint64_t v20 = size;
      __int16 v18 = a1;
      uint64_t v13 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v18, a1, a2, 0, a3, a4, (uint64_t)v12, (uint64_t)&v20);
      uint64_t v14 = v13;
      if (a5 && !v13) {
        (*(void (**)(uint64_t, void *, uint64_t))(a5 + 16))(a5, v12, v20);
      }
      rsize_t v15 = size;
      acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1213, "ACMContextGetDataEx");
      acm_mem_free_data(v12, v15);
      if (v14) {
        goto LABEL_11;
      }
    }
    else if (a5)
    {
      (*(void (**)(uint64_t, void, void))(a5 + 16))(a5, 0, 0);
    }
    uint64_t v14 = 0;
    unsigned int v16 = 10;
    goto LABEL_15;
  }
  uint64_t v14 = v10;
LABEL_11:
  unsigned int v16 = 70;
LABEL_15:
  if (v16 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int size_4 = 136315650;
    uint64_t v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    __int16 v27 = 2048;
    uint64_t v28 = (int)v14;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&size_4, 0x20u);
  }
  return v14;
}

uint64_t ACMContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  uint64_t Data = ACMContextGetData(a1, a2 | (a3 << 16), a4);
  if (Data) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)Data;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetInfo(long long *a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextGetInfo((uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMPing()
{
  uint64_t v1 = 0;
  return LibCall_ACMPing((uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))ioKitTransport, (uint64_t)&v1, 29);
}

void updateLogLevelFromKext()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(_connect, 2u, 0, 0, &output, &outputCnt)) {
    goto LABEL_8;
  }
  unsigned __int8 v0 = output;
  unsigned int v1 = output;
  _logLevel = output;
  if (output <= 0x1EuLL && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    __int16 v8 = 1024;
    int v9 = v0;
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    unsigned int v1 = _logLevel;
  }
  if (v1 <= 0xA && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

unsigned char *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, void *a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  }
  __int16 v12 = 0;
  if (a5) {
    BOOL v13 = a4 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      __int16 v12 = 0;
    }
    else
    {
      __int16 v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)__int16 v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5) {
          memcpy(v12 + 8, a4, a5);
        }
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  }
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *), uint64_t a2, void *a3, unsigned char *a4, int a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (!a1 || !a3) {
    goto LABEL_25;
  }
  __int16 v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    uint64_t v18 = 21;
    uint64_t v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!v13)
    {
      if (v18 != 21)
      {
        uint64_t v11 = 4294967291;
        goto LABEL_23;
      }
      uint64_t v11 = 0;
      goto LABEL_20;
    }
    uint64_t v11 = v13;
    if (v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      unsigned int v10 = 70;
      goto LABEL_25;
    }
  }
  uint64_t v18 = 17;
  unsigned int v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = -5;
  }
  if (v14) {
    uint64_t v11 = v14;
  }
  else {
    uint64_t v11 = v15;
  }
  if (!v14 && v18 == 17)
  {
LABEL_20:
    int v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)__int16 v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4) {
      *a4 = v19[16];
    }
  }
  if (v11) {
    goto LABEL_23;
  }
  unsigned int v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  }
  return v11;
}

_DWORD *LibCall_ACMContextCreateWithExternalForm(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, unsigned char *a5, int a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  }
  __int16 v12 = 0;
  unsigned int v13 = 70;
  int v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      uint64_t v20 = 9;
      int v15 = a1(a2, 37, 0, a3, 16, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          int v14 = 0;
          goto LABEL_19;
        }
        int v14 = -5;
        goto LABEL_28;
      }
      int v14 = v15;
      if (v15 != -3) {
        goto LABEL_28;
      }
    }
    uint64_t v20 = 5;
    int v16 = a1(a2, 18, 0, a3, 16, v21, &v20);
    if (v20 == 5) {
      int v17 = 0;
    }
    else {
      int v17 = -5;
    }
    if (v16) {
      int v14 = v16;
    }
    else {
      int v14 = v17;
    }
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        __int16 v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          unsigned int v13 = 70;
          int v14 = -4;
          goto LABEL_31;
        }
        int v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)__int16 v12 = *a3;
        v12[4] = v18;
        if (a5) {
          *a5 = BYTE4(v21[0]);
        }
        if (v14)
        {
          acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 147, "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          unsigned int v13 = 70;
          goto LABEL_31;
        }
      }
      else
      {
        __int16 v12 = 0;
      }
      goto LABEL_30;
    }
LABEL_28:
    __int16 v12 = 0;
    if (v14) {
      goto LABEL_29;
    }
LABEL_30:
    int v14 = 0;
    unsigned int v13 = 10;
  }
LABEL_31:
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  }
  return v12;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, void, void *, uint64_t, void, void), uint64_t a2, void *a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  }
  if (a1 && a3)
  {
    if (a4) {
      a1(a2, 2, 0, a3, 16, 0, 0);
    }
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    uint64_t v8 = 0;
    unsigned int v9 = 10;
    goto LABEL_8;
  }
  unsigned int v9 = 70;
  uint64_t v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  }
  return v8;
}

uint64_t LibCall_ACMContexAddCredentialWithScope(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, unsigned int *a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope");
  }
  size_t size = 0;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &size);
    if (SerializedAddCredentialSize)
    {
      uint64_t v13 = SerializedAddCredentialSize;
      unsigned int v12 = 70;
    }
    else
    {
      size_t v15 = size;
      int v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 192, "LibCall_ACMContexAddCredentialWithScope");
      if (v16)
      {
        uint64_t v17 = SerializeAddCredential(a3, a4, a5, (uint64_t)v16, &size);
        if (!v17) {
          uint64_t v17 = a1(a2, 5, 0, v16, size, 0, 0);
        }
        uint64_t v13 = v17;
        size_t v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 203, "LibCall_ACMContexAddCredentialWithScope");
        acm_mem_free_data(v16, v18);
        if (v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }
      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void, void), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
  }
  if (a3 || a5 == 2)
  {
    BOOL v10 = acm_mem_alloc_data(0x18uLL);
    acm_mem_alloc_info("<data>", v10, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 217, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        *BOOL v10 = *a3;
      }
      else
      {
        *(void *)BOOL v10 = 0;
        *((void *)v10 + 1) = 0;
      }
      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      uint64_t v11 = a1(a2, 9, 0, v10, 24, 0, 0);
      acm_mem_free_info("<data>", v10, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 233, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data(v10, 0x18uLL);
      if (v11) {
        unsigned int v12 = 70;
      }
      else {
        unsigned int v12 = 10;
      }
    }
    else
    {
      unsigned int v12 = 70;
      uint64_t v11 = 4294967292;
    }
  }
  else
  {
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  }
  size_t size = 0;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t v14 = GetSerializedRemoveCredentialSize(a3, a4, a5, &size);
    if (v14)
    {
      uint64_t v13 = v14;
      unsigned int v12 = 70;
    }
    else
    {
      size_t v15 = size;
      int v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 251, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
      if (v16)
      {
        uint64_t v17 = SerializeRemoveCredential(a3, a4, a5, v16, &size);
        if (!v17) {
          uint64_t v17 = a1(a2, 6, 0, v16, size, 0, 0);
        }
        uint64_t v13 = v17;
        size_t v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 264, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v16, v18);
        if (v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }
      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, void *a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  }
  size_t v32 = 0;
  size_t size = 0;
  __int16 v30 = 0;
  unint64_t v31 = 4096;
  unsigned int v18 = 70;
  uint64_t v19 = 4294967293;
  size_t v29 = 0;
  if (a1 && a3 && __s1 && a9)
  {
    if ((a6 != 0) != (a7 != 0))
    {
      unsigned int v18 = 70;
      uint64_t v19 = 4294967293;
    }
    else
    {
      uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
      if (SerializedVerifyPolicySize)
      {
        uint64_t v19 = SerializedVerifyPolicySize;
        unsigned int v18 = 70;
      }
      else
      {
        size_t v21 = size;
        uint64_t v22 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 293, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
        if (v22)
        {
          size_t v32 = size;
          uint64_t v23 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v22, &v32);
          if (v23)
          {
            uint64_t v19 = v23;
            uint64_t v24 = 0;
          }
          else
          {
            uint64_t v24 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
            acm_mem_alloc_info("<data>", v24, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 300, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            if (v24)
            {
              uint64_t v25 = a1(a2, 3, 0, v22, v32, v24, &v31);
              if (v25)
              {
                uint64_t v19 = v25;
              }
              else
              {
                unint64_t v26 = v31 - 4;
                if (v31 < 4)
                {
                  uint64_t v19 = 4294967291;
                }
                else
                {
                  *a9 = *v24 != 0;
                  if (a10)
                  {
                    uint64_t v19 = DeserializeRequirement(v24 + 1, v26, &v30, &v29);
                    if (!v19) {
                      *a10 = v30;
                    }
                  }
                  else
                  {
                    uint64_t v19 = 0;
                  }
                }
              }
            }
            else
            {
              uint64_t v19 = 4294967292;
            }
          }
          size_t v27 = size;
          acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 324, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
          acm_mem_free_data(v22, v27);
          if (v24)
          {
            acm_mem_free_info("<data>", v24, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 327, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            acm_mem_free_data(v24, 0x1000uLL);
          }
          if (v19) {
            unsigned int v18 = 70;
          }
          else {
            unsigned int v18 = 10;
          }
        }
        else
        {
          unsigned int v18 = 70;
          uint64_t v19 = 4294967292;
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx", (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMRequirementDelete");
  }
  unsigned int v4 = 70;
  uint64_t v5 = 4294967293;
  if (a1 && a2)
  {
    uint64_t v5 = Util_DeallocRequirement(a2);
    if (v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  if (v4 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMRequirementDelete", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = a1;
  v20[1] = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  }
  if (!v13) {
    goto LABEL_16;
  }
  BOOL v14 = a5 != 0;
  if (a4) {
    BOOL v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  }
  if (v14)
  {
LABEL_16:
    unsigned int v18 = 70;
    uint64_t v17 = 4294967293;
  }
  else
  {
    v20[0] = v20;
    MEMORY[0x1F4188790](a1);
    size_t v15 = (_DWORD *)((char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
    *size_t v15 = a3;
    int v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      int v16 = (_DWORD *)((char *)v16 + a5);
    }
    if (v16 != (_DWORD *)((char *)v15 + a5 + 4)) {
      LibCall_ACMKernelControl_cold_1();
    }
    uint64_t v17 = v13(a2, 26, 0, (char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
    if (v17) {
      unsigned int v18 = 70;
    }
    else {
      unsigned int v18 = 10;
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v17);
  }
  return v17;
}

_DWORD *LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1) {
    return (_DWORD *)Util_DeallocCredential(a1);
  }
  return a1;
}

unsigned int *LibCall_ACMCredentialGetType(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, _OWORD *__src, size_t __n)
{
  if (!a1) {
    return 4294967293;
  }
  int v4 = __n;
  if ((__src != 0) != (__n != 0)) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 <= 801)
      {
        if (a2 != 602)
        {
          if (a2 == 701)
          {
            if (__n <= 0x80 && *a1 == 13)
            {
              a1[8] = __n;
              BOOL v14 = a1 + 9;
LABEL_118:
              memcpy(v14, __src, __n);
              return 0;
            }
          }
          else if (a2 == 801 && __n == 16 && *a1 == 17)
          {
            uint64_t result = 0;
            *((_OWORD *)a1 + 2) = *__src;
          }
          return result;
        }
        BOOL v13 = *a1 == 12 || *a1 == 15;
        if (__n != 4 || !v13) {
          return result;
        }
LABEL_79:
        uint64_t result = 0;
        a1[9] = *(_DWORD *)__src;
        return result;
      }
      if (a2 == 802)
      {
        if (__n != 65 || *a1 != 17) {
          return result;
        }
        uint64_t result = 0;
        *((_OWORD *)a1 + 3) = *__src;
        long long v11 = __src[1];
        long long v16 = __src[2];
        long long v17 = __src[3];
        *((unsigned char *)a1 + 112) = *((unsigned char *)__src + 64);
        *((_OWORD *)a1 + 5) = v16;
        *((_OWORD *)a1 + 6) = v17;
        goto LABEL_92;
      }
      if (a2 != 901)
      {
        if (a2 == 1001 && __n <= 0x80 && *a1 == 21)
        {
          memcpy(a1 + 9, __src, __n);
          uint64_t result = 0;
          a1[8] = v4;
        }
        return result;
      }
      if (__n != 32 || *a1 != 20) {
        return result;
      }
    }
    else
    {
      if (a2 > 501)
      {
        switch(a2)
        {
          case 502:
            if (__n == 16 && *a1 == 10)
            {
LABEL_102:
              uint64_t result = 0;
              *(_OWORD *)(a1 + 13) = *__src;
            }
            break;
          case 503:
            if (__n == 16 && *a1 == 10)
            {
              uint64_t result = 0;
              long long v15 = *__src;
LABEL_99:
              *(_OWORD *)(a1 + 17) = v15;
            }
            break;
          case 601:
            BOOL v9 = *a1 == 12 || *a1 == 15;
            BOOL v10 = v9;
            if (__n == 4 && v10)
            {
LABEL_64:
              uint64_t result = 0;
              a1[8] = *(_DWORD *)__src;
            }
            break;
        }
        return result;
      }
      if (a2 != 400)
      {
        if (a2 != 401)
        {
          if (a2 == 501 && __n == 16 && *a1 == 10)
          {
LABEL_16:
            uint64_t result = 0;
            *(_OWORD *)(a1 + 9) = *__src;
          }
          return result;
        }
        if (__n != 24 || *a1 != 7) {
          return result;
        }
        uint64_t result = 0;
        long long v11 = *__src;
        *((void *)a1 + 10) = *((void *)__src + 2);
LABEL_92:
        *((_OWORD *)a1 + 4) = v11;
        return result;
      }
      if (__n != 32 || *a1 != 7) {
        return result;
      }
    }
    uint64_t result = 0;
    long long v18 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v18;
    return result;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_16;
        }
        break;
      case 301:
        if (__n == 32 && *a1 == 3)
        {
          uint64_t result = 0;
          long long v15 = *__src;
          *(_OWORD *)(a1 + 21) = __src[1];
          goto LABEL_99;
        }
        break;
      case 302:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_102;
        }
        break;
      case 303:
        if (__n == 65 && *a1 == 3)
        {
          uint64_t result = 0;
          *(_OWORD *)(a1 + 30) = *__src;
          long long v19 = __src[1];
          long long v20 = __src[2];
          long long v21 = __src[3];
          *((unsigned char *)a1 + 184) = *((unsigned char *)__src + 64);
          *(_OWORD *)(a1 + 42) = v21;
          *(_OWORD *)(a1 + 38) = v20;
          *(_OWORD *)(a1 + 34) = v19;
        }
        break;
      case 304:
        if (__n == 16 && *a1 == 3)
        {
          uint64_t result = 0;
          *(_OWORD *)((char *)a1 + 185) = *__src;
        }
        break;
      case 305:
        if (__n == 4 && *a1 == 3)
        {
          uint64_t result = 0;
          *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
        }
        break;
      case 306:
        if (__n <= 0x80 && *a1 == 3)
        {
          memcpy((char *)a1 + 209, __src, __n);
          uint64_t result = 0;
          *(int *)((char *)a1 + 205) = v4;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (__n <= 0x80 && *a1 == 2)
          {
            a1[9] = __n;
            BOOL v14 = a1 + 10;
            goto LABEL_118;
          }
        }
        else if (a2 == 201 && __n == 4 && *a1 == 2)
        {
          goto LABEL_64;
        }
        break;
    }
    return result;
  }
  if (a2 > 100)
  {
    if (a2 == 101)
    {
      if (__n == 4)
      {
        switch(*a1)
        {
          case 1:
          case 3:
          case 9:
          case 10:
            goto LABEL_64;
          case 2:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            return result;
          default:
            if (*a1 == 18) {
              goto LABEL_64;
            }
            break;
        }
      }
      return result;
    }
    if (a2 != 102 || __n != 4 || *a1 != 1) {
      return result;
    }
    goto LABEL_79;
  }
  if (a2 == 5)
  {
    if (__n == 4)
    {
      uint64_t result = 0;
      a1[3] = *(_DWORD *)__src;
    }
  }
  else if (a2 == 100 && __n == 16)
  {
    int v7 = *a1;
    if (*a1 > 8)
    {
      if (v7 == 9)
      {
        uint64_t v8 = a1 + 10;
        a1[9] = 16;
      }
      else
      {
        if (v7 != 18) {
          return result;
        }
        uint64_t v8 = a1 + 9;
      }
    }
    else if (v7 == 1)
    {
      uint64_t v8 = a1 + 11;
      a1[10] = 16;
    }
    else
    {
      if (v7 != 3) {
        return result;
      }
      uint64_t v8 = a1 + 26;
      a1[25] = 16;
    }
    uint64_t result = 0;
    _OWORD *v8 = *__src;
  }
  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  uint64_t result = 4294967293;
  if (!a1 || !a3 || !a4) {
    return result;
  }
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 > 801)
      {
        if (a2 == 802)
        {
          if (*a1 != 17) {
            return result;
          }
          long long v11 = a1 + 12;
LABEL_87:
          uint64_t v12 = 65;
          BOOL v13 = v11;
          uint64_t v14 = 65;
        }
        else
        {
          if (a2 != 901)
          {
            if (a2 != 1001 || *a1 != 21) {
              return result;
            }
            long long v15 = a1 + 9;
            if (Util_isNullOrZeroMemory((unsigned char *)a1 + 36, 128))
            {
              long long v15 = 0;
              uint64_t v10 = 0;
            }
            else
            {
              uint64_t v10 = a1[8];
            }
            uint64_t result = 0;
            *a3 = v15;
LABEL_99:
            *a4 = v10;
            return result;
          }
          if (*a1 != 20) {
            return result;
          }
          long long v11 = a1 + 8;
          uint64_t v12 = 32;
          BOOL v13 = v11;
          uint64_t v14 = 32;
        }
      }
      else
      {
        if (a2 == 602)
        {
          if (*a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_61;
        }
        if (a2 == 701)
        {
          if (*a1 != 13) {
            return result;
          }
          uint64_t result = 0;
          *a3 = a1 + 9;
          uint64_t v10 = a1[8];
          goto LABEL_99;
        }
        if (a2 != 801 || *a1 != 17) {
          return result;
        }
        long long v11 = a1 + 8;
        uint64_t v12 = 16;
        BOOL v13 = v11;
        uint64_t v14 = 16;
      }
      BOOL isNullOrZeroMemory = Util_isNullOrZeroMemory(v13, v14);
      uint64_t result = 0;
      BOOL v20 = !isNullOrZeroMemory;
      if (isNullOrZeroMemory) {
        long long v21 = 0;
      }
      else {
        long long v21 = (int *)v11;
      }
      if (v20) {
        uint64_t v22 = v12;
      }
      else {
        uint64_t v22 = 0;
      }
      *a3 = v21;
      *a4 = v22;
      return result;
    }
    if (a2 > 501)
    {
      if (a2 == 502)
      {
        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 13;
      }
      else
      {
        if (a2 != 503)
        {
          if (a2 != 601 || *a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_77;
        }
        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 17;
      }
LABEL_68:
      *a3 = v9;
      uint64_t result = Util_isNullOrZeroMemory(v9, 16);
      if (result)
      {
        uint64_t result = 0;
        *a4 = 0;
        *a3 = 0;
        return result;
      }
LABEL_70:
      uint64_t v10 = 16;
      goto LABEL_99;
    }
    if (a2 == 400)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0;
      long long v16 = a1 + 8;
LABEL_84:
      *a3 = v16;
      uint64_t v10 = 32;
      goto LABEL_99;
    }
    if (a2 == 401)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0;
      *a3 = a1 + 16;
      uint64_t v10 = 24;
      goto LABEL_99;
    }
    if (a2 != 501 || *a1 != 10) {
      return result;
    }
LABEL_15:
    BOOL v9 = a1 + 9;
    goto LABEL_68;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = a1 + 9;
          goto LABEL_50;
        }
        break;
      case 301:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          long long v16 = a1 + 17;
          goto LABEL_84;
        }
        break;
      case 302:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = a1 + 13;
          goto LABEL_50;
        }
        break;
      case 303:
        if (*a1 == 3)
        {
          long long v11 = a1 + 30;
          goto LABEL_87;
        }
        break;
      case 304:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = (int *)((char *)a1 + 185);
LABEL_50:
          *a3 = v8;
          goto LABEL_70;
        }
        break;
      case 305:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          long long v17 = (int *)((char *)a1 + 201);
          goto LABEL_97;
        }
        break;
      case 306:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v10 = *(unsigned int *)((char *)a1 + 205);
          uint64_t v23 = (int *)((char *)a1 + 209);
          if (!*(int *)((char *)a1 + 205)) {
            uint64_t v23 = 0;
          }
          *a3 = v23;
          goto LABEL_99;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (*a1 == 2)
          {
            uint64_t result = 0;
            *a3 = a1 + 10;
            uint64_t v10 = a1[9];
            goto LABEL_99;
          }
        }
        else if (a2 == 201 && *a1 == 2)
        {
          goto LABEL_77;
        }
        break;
    }
    return result;
  }
  if (a2 > 99)
  {
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 != 102 || *a1 != 1) {
          return result;
        }
LABEL_61:
        uint64_t result = 0;
        long long v17 = a1 + 9;
        goto LABEL_97;
      }
      if (*a1 > 0x12 || ((1 << *a1) & 0x4060A) == 0) {
        return result;
      }
LABEL_77:
      uint64_t result = 0;
      long long v17 = a1 + 8;
LABEL_97:
      *a3 = v17;
LABEL_98:
      uint64_t v10 = 4;
      goto LABEL_99;
    }
    int v18 = *a1;
    if (*a1 <= 8)
    {
      if (v18 == 1)
      {
        BOOL v9 = a1 + 11;
      }
      else
      {
        if (v18 != 3) {
          return result;
        }
        BOOL v9 = a1 + 26;
      }
      goto LABEL_68;
    }
    if (v18 == 9)
    {
      BOOL v9 = a1 + 10;
      goto LABEL_68;
    }
    if (v18 != 18) {
      return result;
    }
    goto LABEL_15;
  }
  switch(a2)
  {
    case 1:
      uint64_t result = 0;
      *a3 = a1 + 4;
      uint64_t v10 = 8;
      goto LABEL_99;
    case 2:
      uint64_t result = 0;
      long long v17 = a1 + 6;
      goto LABEL_97;
    case 3:
      uint64_t result = 0;
      *a3 = a1;
      goto LABEL_98;
    case 4:
      uint64_t result = 0;
      long long v17 = a1 + 1;
      goto LABEL_97;
    case 5:
      uint64_t result = 0;
      long long v17 = a1 + 3;
      goto LABEL_97;
    default:
      return result;
  }
  return result;
}

unsigned int *LibCall_ACMRequirementGetType(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 4);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4 = 4294967293;
  if (!a1 || !a3 || !a4) {
    return v4;
  }
  uint64_t v4 = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            int v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            unint64_t v10 = 16;
            goto LABEL_72;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (a2 != 602)
      {
        if (a2 != 700) {
          return v4;
        }
        if (*a1 == 7)
        {
LABEL_28:
          uint64_t v8 = a1 + 4;
          goto LABEL_58;
        }
        return 4294967293;
      }
      if (*a1 != 26) {
        return 4294967293;
      }
      if (a1[3] < 0x1C) {
        return 4294967282;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 8;
    }
    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          BOOL v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          unint64_t v10 = 32;
          goto LABEL_72;
        }
        return 4294967293;
      }
      if (a2 != 500)
      {
        if (a2 != 600) {
          return v4;
        }
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            uint64_t v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (*a1 != 25) {
        return 4294967293;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 43;
    }
LABEL_72:
    uint64_t v4 = 0;
    *a4 = v10;
    return v4;
  }
  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3) {
          return 4294967293;
        }
        int v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3) {
          return 4294967293;
        }
        BOOL v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3) {
          return 4294967293;
        }
        int v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3) {
          return 4294967293;
        }
        unint64_t v10 = 0;
        long long v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3) {
          return 4294967293;
        }
        if (a1[3] < 0x9C) {
          return 4294967282;
        }
        uint64_t v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3) {
          return 4294967293;
        }
        if (a1[3] < 0x9C) {
          return 4294967282;
        }
        uint64_t v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24) {
          return 4294967293;
        }
        *a3 = a1 + 5;
        unint64_t v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24) {
          return 4294967293;
        }
        BOOL v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          int v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21) {
              goto LABEL_28;
            }
          }
          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }
          return v4;
        }
        if (a2 != 200) {
          return v4;
        }
        if (*a1 != 2) {
          return 4294967293;
        }
        goto LABEL_28;
    }
    while (!Util_isNullOrZeroMemory((unsigned char *)v11 + v10, 16))
    {
      BOOL v12 = v10 >= 0x40;
      v10 += 16;
      if (v12)
      {
        unint64_t v10 = 80;
        goto LABEL_71;
      }
    }
    if (!v10) {
      long long v11 = 0;
    }
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }
  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      unint64_t v10 = 4;
      goto LABEL_72;
    case 2:
      uint64_t v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      uint64_t v8 = a1 + 2;
      goto LABEL_58;
  }
  return v4;
}

uint64_t LibCall_ACMPing(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2, uint64_t a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMPing");
  }
  unsigned int v6 = 70;
  if (a1 && (a3 == 47 || a3 == 29))
  {
    uint64_t v7 = a1(a2, a3, 0, 0, 0, 0, 0);
    if (v7) {
      unsigned int v6 = 70;
    }
    else {
      unsigned int v6 = 10;
    }
  }
  else
  {
    uint64_t v7 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPing", (int)v7);
  }
  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernDoubleClickNotify");
  }
  unsigned int v4 = 70;
  if (a1)
  {
    uint64_t v5 = a1(a2, 28, 0, 0, 0, 0, 0);
    if (v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  else
  {
    uint64_t v5 = 4294967293;
  }
  if (v4 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernDoubleClickNotify", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128), uint64_t a2, __n128 *a3, unsigned __int32 a4, unsigned __int32 a5, uint64_t a6, uint64_t a7)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCredentialGetProperty");
  }
  unsigned int v14 = 70;
  uint64_t v15 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      uint64_t v15 = 4294967293;
      if (a6)
      {
        if (a7)
        {
          uint64_t v19 = 24;
          __n128 Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, &v20, &v19);
          if (v16)
          {
            uint64_t v15 = v16;
          }
          else if (v19 == 24)
          {
            uint64_t v15 = a1(a2, 33, 0, &v20, 24, a6, a7, Property_Serialize);
            if (!v15)
            {
              unsigned int v14 = 10;
              goto LABEL_11;
            }
          }
          else
          {
            uint64_t v15 = 4294967291;
          }
          unsigned int v14 = 70;
        }
      }
    }
  }
LABEL_11:
  if (v14 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCredentialGetProperty", (int)v15);
  }
  return v15;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty");
  }
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a1 && a5 && a6)
  {
    uint64_t v16 = 8;
    uint64_t Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v17, &v16);
    if (Property_Serialize)
    {
      uint64_t v13 = Property_Serialize;
    }
    else if (v16 == 8)
    {
      uint64_t v13 = a1(a2, 27, 0, &v17, 8, a5, a6);
      if (!v13)
      {
        unsigned int v12 = 10;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v13 = 4294967291;
    }
    unsigned int v12 = 70;
  }
LABEL_10:
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx");
  }
  unint64_t v31 = 4096;
  size_t size = 0;
  size_t v29 = 0;
  __int16 v30 = 0;
  uint64_t v18 = 4294967293;
  if (!a3 || !__s1 || !a9)
  {
LABEL_18:
    if (!v18) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
  if (!SerializedVerifyPolicySize)
  {
    size_t v20 = size;
    uint64_t v21 = acm_mem_alloc_data(size);
    acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1257, "LibCall_ACMContextVerifyPolicyEx");
    if (v21)
    {
      uint64_t v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &size);
      if (v22)
      {
        uint64_t v18 = v22;
        uint64_t v23 = 0;
      }
      else
      {
        uint64_t v23 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v23, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1263, "LibCall_ACMContextVerifyPolicyEx");
        if (v23)
        {
          uint64_t v24 = a1(a2, 3, 0, v21, size, v23, &v31);
          if (v24)
          {
            uint64_t v18 = v24;
          }
          else
          {
            unint64_t v25 = v31 - 4;
            if (v31 < 4)
            {
              uint64_t v18 = 4294967291;
            }
            else
            {
              *a9 = *v23 != 0;
              if (a10)
              {
                uint64_t v18 = DeserializeRequirement(v23 + 1, v25, (void **)&v30, &v29);
                if (!v18) {
                  *a10 = v30;
                }
              }
              else
              {
                uint64_t v18 = 0;
              }
            }
          }
        }
        else
        {
          uint64_t v18 = 4294967292;
        }
      }
      size_t v26 = size;
      acm_mem_free_info("<data>", v21, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1288, "LibCall_ACMContextVerifyPolicyEx");
      acm_mem_free_data(v21, v26);
      if (v23)
      {
        acm_mem_free_info("<data>", v23, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1291, "LibCall_ACMContextVerifyPolicyEx");
        acm_mem_free_data(v23, 0x1000uLL);
      }
    }
    else
    {
      uint64_t v18 = 4294967292;
    }
    goto LABEL_18;
  }
  uint64_t v18 = SerializedVerifyPolicySize;
LABEL_19:
  if (v30) {
    Util_DeallocRequirement(v30);
  }
LABEL_21:
  if (v18) {
    unsigned int v27 = 70;
  }
  else {
    unsigned int v27 = 10;
  }
  if (v27 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx");
  }
  *(void *)size_t v20 = 0;
  uint64_t v16 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))a1, a2, v20, 0, 1);
  if (!v16) {
    uint64_t v16 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v20, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
  }
  uint64_t v17 = v16;
  if (*(void *)v20) {
    LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1, a2, *(void **)v20, 1);
  }
  if (v17) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v12 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable");
  }
  unsigned int v9 = 70;
  uint64_t v10 = 4294967293;
  if (a1 && a4 && a5)
  {
    uint64_t v10 = a1(a2, 25, 0, &v12, 4, a4, a5);
    if (v10) {
      unsigned int v9 = 70;
    }
    else {
      unsigned int v9 = 10;
    }
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable", (int)v10);
  }
  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t v15 = a1;
  v21[1] = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSetEnvironmentVariable");
  }
  if (!v15 || a6 != 16 * (a5 != 0)) {
    goto LABEL_20;
  }
  BOOL v16 = a8 != 0;
  if (a7) {
    BOOL v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80;
  }
  if (!v16)
  {
    MEMORY[0x1F4188790](a1);
    uint64_t v17 = (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)uint64_t v17 = a3;
    *((_DWORD *)v17 + 1) = 2;
    *((_DWORD *)v17 + 2) = a8;
    *(_OWORD *)(v17 + 12) = 0u;
    *(_OWORD *)(v17 + 28) = 0u;
    if (a4) {
      *(_OWORD *)(v17 + 12) = *a4;
    }
    if (a5) {
      *(_OWORD *)(v17 + 28) = *a5;
    }
    if (a8) {
      memcpy(v17 + 44, a7, a8);
    }
    uint64_t v18 = v15(a2, 44, 0, (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0), a8 + 44, 0, 0);
    if (v18) {
      unsigned int v19 = 70;
    }
    else {
      unsigned int v19 = 10;
    }
  }
  else
  {
LABEL_20:
    unsigned int v19 = 70;
    uint64_t v18 = 4294967293;
  }
  if (v19 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSetEnvironmentVariable", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMTRMLoadState(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState");
  }
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a1 && a3 && a4)
  {
    uint64_t v9 = a1(a2, 38, 0, 0, 0, a3, a4);
    if (v9) {
      unsigned int v8 = 70;
    }
    else {
      unsigned int v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMTRMSaveState(uint64_t (*a1)(uint64_t, uint64_t, void, uint64_t, uint64_t, void, void), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMSaveState");
  }
  if (a1)
  {
    BOOL v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000;
    if (!a3) {
      BOOL v10 = a4 != 0;
    }
    unsigned int v11 = 70;
    if (!v10)
    {
      if (a5) {
        uint64_t v12 = 43;
      }
      else {
        uint64_t v12 = 39;
      }
      uint64_t v13 = a1(a2, v12, 0, a3, a4, 0, 0);
      if (v13) {
        unsigned int v11 = 70;
      }
      else {
        unsigned int v11 = 10;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v11 = 70;
  }
  uint64_t v13 = 4294967293;
LABEL_13:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMSaveState", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  unsigned int v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, _OWORD *, unint64_t *))v1;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextLoadFromImage");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (v10 && v7 && (unint64_t)(v5 - 4097) >= 0xFFFFFFFFFFFFF000)
  {
    uint64_t v13 = acm_mem_alloc(0x14uLL);
    acm_mem_alloc_info("ACMHandleWithPayload", v13, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1447, "LibCall_ACMContextLoadFromImage");
    if (v13)
    {
      bzero(v21, 0x1005uLL);
      char v20 = 1;
      *(_WORD *)&v21[1] = 6;
      __int16 v22 = v5;
      __memcpy_chk();
      memset(v18, 0, sizeof(v18));
      uint64_t v19 = 0;
      unint64_t v17 = 280;
      uint64_t v14 = v10(v9, 48, 0, &v20, 4102, v18, &v17);
      if (v14)
      {
        uint64_t v12 = v14;
      }
      else if (v17 < 0x18)
      {
        uint64_t v12 = 4294967291;
      }
      else
      {
        if (LOBYTE(v18[0]))
        {
          uint64_t v12 = 0;
          int v15 = DWORD1(v18[1]);
          *(_OWORD *)uint64_t v13 = *(_OWORD *)((char *)v18 + 4);
          v13[4] = v15;
          *unsigned int v3 = v13;
          unsigned int v11 = 10;
          goto LABEL_11;
        }
        uint64_t v12 = 4294967280;
      }
      acm_mem_free_info("ACMHandleWithPayload", v13, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1508, "LibCall_ACMContextLoadFromImage");
      acm_mem_free(v13, 0x14uLL);
      unsigned int v11 = 70;
    }
    else
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967292;
    }
  }
LABEL_11:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextLoadFromImage", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextUnloadToImage(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  unsigned int v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, unsigned char *, int *))v1;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (v10 && v5 && v3)
  {
    long long v21 = 0uLL;
    int v20 = 1310721;
    if (v7) {
      long long v21 = *v7;
    }
    else {
      long long v21 = 0uLL;
    }
    bzero(v17, 0x1106uLL);
    *(void *)BOOL v16 = 4358;
    uint64_t v13 = v10(v9, 49, 0, &v20, 20, v17, v16);
    if (v13)
    {
      uint64_t v12 = v13;
LABEL_18:
      unsigned int v11 = 70;
      goto LABEL_14;
    }
    if (*(void *)v16 < 6uLL)
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967291;
    }
    else
    {
      if (v17[0])
      {
        uint64_t v15 = v18;
        uint64_t v12 = Util_ReadFromBuffer((uint64_t)v17, *(size_t *)v16, &v15, v5, (unsigned __int16)__n);
        if (!v12)
        {
          *unsigned int v3 = v15 - v18;
          unsigned int v11 = 10;
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      unsigned int v11 = 70;
      uint64_t v12 = 4294967280;
    }
  }
LABEL_14:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextSetData(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextSetData");
  }
  size_t size = 0;
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293;
  if (a1 && a3)
  {
    if ((a7 != 0) != (a8 != 0))
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967293;
    }
    else if (a8 > 0xE00)
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967276;
    }
    else
    {
      uint64_t v18 = LibSer_StorageSetData_GetSize(a8, a5, a6, &size);
      if (v18)
      {
        uint64_t v17 = v18;
        unsigned int v16 = 70;
      }
      else
      {
        size_t v19 = size;
        int v20 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1593, "LibCall_ACMContextSetData");
        if (v20)
        {
          uint64_t v21 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v20, &size);
          if (!v21) {
            uint64_t v21 = a1(a2, 40, 0, v20, size, 0, 0);
          }
          uint64_t v17 = v21;
          size_t v22 = size;
          acm_mem_free_info("<data>", v20, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1605, "LibCall_ACMContextSetData");
          acm_mem_free_data(v20, v22);
          if (v17) {
            unsigned int v16 = 70;
          }
          else {
            unsigned int v16 = 10;
          }
        }
        else
        {
          unsigned int v16 = 70;
          uint64_t v17 = 4294967292;
        }
      }
    }
  }
  if (v16 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextSetData", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMContextGetData(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu)
  {
    uint64_t v16 = a8;
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
    a8 = v16;
  }
  size_t size = 0;
  unsigned int v17 = 70;
  uint64_t v18 = 4294967293;
  if (a1)
  {
    uint64_t v26 = a2;
    if (a3)
    {
      uint64_t v18 = 4294967293;
      if (a8)
      {
        if (a9)
        {
          uint64_t v19 = a8;
          uint64_t v20 = LibSer_StorageGetData_GetSize(a6, a7, &size);
          if (v20)
          {
            uint64_t v18 = v20;
            unsigned int v17 = 70;
          }
          else
          {
            size_t v21 = size;
            size_t v22 = acm_mem_alloc_data(size);
            acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1628, "LibCall_ACMContextGetData");
            if (v22)
            {
              uint64_t Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v22, &size);
              if (!Data_Serialize) {
                uint64_t Data_Serialize = a1(v26, 41, 0, v22, size, v19, a9);
              }
              uint64_t v18 = Data_Serialize;
              size_t v24 = size;
              acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1640, "LibCall_ACMContextGetData");
              acm_mem_free_data(v22, v24);
              if (v18) {
                unsigned int v17 = 70;
              }
              else {
                unsigned int v17 = 10;
              }
            }
            else
            {
              unsigned int v17 = 70;
              uint64_t v18 = 4294967292;
            }
          }
        }
      }
    }
  }
  if (v17 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetData", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMPublishTrustedAccessories(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v7 = a1;
  v14[1] = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMPublishTrustedAccessories");
  }
  if (v7)
  {
    if (a3) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = a4 == 0;
    }
    char v9 = !v8;
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293;
    if ((a4 & 0xF) == 0 && a4 <= 0x100 && (v9 & 1) == 0)
    {
      MEMORY[0x1F4188790](a1);
      uint64_t v12 = (_DWORD *)((char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0));
      *uint64_t v12 = 1;
      v12[1] = a4;
      if (a4) {
        memcpy(v12 + 2, a3, a4);
      }
      uint64_t v11 = v7(a2, 45, 0, (char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0), a4 + 8, 0, 0);
      if (v11) {
        unsigned int v10 = 70;
      }
      else {
        unsigned int v10 = 10;
      }
    }
  }
  else
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPublishTrustedAccessories", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextGetInfo(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, long long *a3, int a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetInfo");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (a3 && a1 && a5)
  {
    int v16 = 1;
    int v18 = a4;
    long long v17 = *a3;
    memset(v15, 0, 140);
    unint64_t v14 = 140;
    uint64_t v12 = a1(a2, 46, 0, &v16, 24, v15, &v14);
    if (v12)
    {
      uint64_t v11 = v12;
    }
    else if (v14 < 0xC)
    {
      uint64_t v11 = 4294967291;
    }
    else
    {
      if (LODWORD(v15[0]))
      {
        uint64_t v11 = 0;
        *a5 = *(void *)((char *)v15 + 4);
        unsigned int v10 = 10;
        goto LABEL_10;
      }
      uint64_t v11 = 4294967281;
    }
    unsigned int v10 = 70;
  }
LABEL_10:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetInfo", (int)v11);
  }
  return v11;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  }
  size_t v36 = 0;
  uint64_t v34 = 0;
  unint64_t v35 = 4096;
  size_t v33 = 0;
  uint64_t v20 = 4294967293;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!v20) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  uint64_t SerializedVerifyAclConstraintSize = GetSerializedVerifyAclConstraintSize(a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v36);
  if (!SerializedVerifyAclConstraintSize)
  {
    uint64_t v22 = v36;
    uint64_t v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info("<data>", v23, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
    if (v23)
    {
      uint64_t v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if (v24)
      {
        uint64_t v20 = v24;
        unint64_t v25 = 0;
      }
      else
      {
        unint64_t v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v25, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
        if (v25)
        {
          uint64_t v26 = a1(a2, a3, 0, v23, v36, v25, &v35);
          if (v26)
          {
            uint64_t v20 = v26;
          }
          else
          {
            unint64_t v27 = v35 - 4;
            if (v35 < 4)
            {
              uint64_t v20 = 4294967291;
            }
            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                uint64_t v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!v20) {
                  *a14 = v34;
                }
              }
              else
              {
                uint64_t v20 = 0;
              }
            }
          }
        }
        else
        {
          uint64_t v20 = 4294967292;
        }
      }
      rsize_t v28 = v36;
      acm_mem_free_info("<data>", v23, v36, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info("<data>", v25, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }
    else
    {
      uint64_t v20 = 4294967292;
    }
    goto LABEL_19;
  }
  uint64_t v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34) {
    Util_DeallocRequirement(v34);
  }
LABEL_22:
  if (v20) {
    unsigned int v29 = 70;
  }
  else {
    unsigned int v29 = 10;
  }
  if (v29 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v20);
  }
  return v20;
}

uint64_t LibCall_ACMSecContextProcessAcl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return processAclCommandInternal(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

uint64_t processAclCommandInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, void *a14, unint64_t *a15)
{
  unsigned int v19 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    printf("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    unsigned int v19 = gACMLoggingLevel;
  }
  if (v19 <= 0x14)
  {
    printf("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: acl = %p, aclLength = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        unsigned int v19 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          unsigned int v19 = gACMLoggingLevel;
        }
      }
    }
  }
  if (a6)
  {
    uint64_t v20 = a6;
    size_t v21 = a5;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v21);
        unsigned int v19 = gACMLoggingLevel;
      }
      ++v21;
      --v20;
    }
    while (v20);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: operation = %p, operationLength = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        unsigned int v19 = gACMLoggingLevel;
      }
    }
  }
  int v39 = a3;
  if (a8)
  {
    uint64_t v22 = a8;
    uint64_t v23 = a7;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v23);
        unsigned int v19 = gACMLoggingLevel;
      }
      ++v23;
      --v22;
    }
    while (v22);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
          if (gACMLoggingLevel <= 0x14u) {
            printf("%s: %s: requirePasscode = %p.\n", "ACM", "processAclCommandInternal", a13);
          }
        }
      }
    }
  }
  if (a7 || a9 || a12)
  {
    if (a5) {
      BOOL v26 = a6 == 0;
    }
    else {
      BOOL v26 = 1;
    }
    int v27 = v26;
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    if (!a7) {
      goto LABEL_79;
    }
    if (!a8) {
      goto LABEL_79;
    }
    if (v27) {
      goto LABEL_79;
    }
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    if ((a9 != 0) != (a10 != 0) || !a12) {
      goto LABEL_79;
    }
    size_t v45 = 0;
    unint64_t v44 = 4096;
    if (gACMLoggingLevel <= 0xAu) {
      printf("%s: %s: called.\n", "ACM", "processAclInternal");
    }
    uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a11, a9, a10, &v45);
    if (SerializedProcessAclSize)
    {
      uint64_t v25 = SerializedProcessAclSize;
      unsigned int v37 = 70;
      goto LABEL_74;
    }
    uint64_t v29 = v45;
    __int16 v30 = acm_mem_alloc_data(v45);
    acm_mem_alloc_info("<data>", v30, v29, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1776, "processAclInternal");
    if (!v30)
    {
      unsigned int v37 = 70;
      uint64_t v25 = 4294967292;
      goto LABEL_74;
    }
    unint64_t v44 = 4096;
    unint64_t v31 = acm_mem_alloc_data(0x1000uLL);
    acm_mem_alloc_info("<data>", v31, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1780, "processAclInternal");
    if (!v31)
    {
      unint64_t v35 = 0;
      unint64_t v34 = 0;
      uint64_t v25 = 4294967292;
      goto LABEL_68;
    }
    uint64_t v32 = SerializeProcessAcl(a4, a5, a6, a7, a8, a11, a9, a10, (uint64_t)v30, &v45);
    if (v32 || (uint64_t v32 = a1(a2, v39, 0, (char *)v30, v45, v31, (uint64_t *)&v44), v32))
    {
      uint64_t v25 = v32;
      unint64_t v34 = 0;
      unint64_t v35 = 0;
      goto LABEL_67;
    }
    unint64_t v33 = v44;
    if (v44 >= 8)
    {
      *a12 = *v31;
      if (a13) {
        *a13 = v31[1] != 0;
      }
      uint64_t v25 = 0;
      unint64_t v34 = 0;
      if (v39 != 30 || !a14)
      {
        unint64_t v35 = 0;
        goto LABEL_67;
      }
      unint64_t v35 = 0;
      if (!a15)
      {
LABEL_67:
        acm_mem_free_info("<data>", v31, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1817, "processAclInternal");
        acm_mem_free_data(v31, 0x1000uLL);
LABEL_68:
        rsize_t v36 = v45;
        acm_mem_free_info("<data>", v30, v45, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1821, "processAclInternal");
        acm_mem_free_data(v30, v36);
        if (v25 && v35)
        {
          acm_mem_free_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1825, "processAclInternal");
          acm_mem_free_data(v35, v34);
          unsigned int v37 = 70;
        }
        else if (v25)
        {
          unsigned int v37 = 70;
        }
        else
        {
          unsigned int v37 = 10;
        }
LABEL_74:
        if (v37 >= gACMLoggingLevel) {
          printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclInternal", (int)v25);
        }
        goto LABEL_76;
      }
      if (v33 >= 0xC)
      {
        unint64_t v34 = v31[2];
        if (v34)
        {
          if (v33 >= v34 + 12)
          {
            unint64_t v35 = acm_mem_alloc_data(v31[2]);
            acm_mem_alloc_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1805, "processAclInternal");
            if (v35)
            {
              memcpy(v35, v31 + 3, v34);
              uint64_t v25 = 0;
              *a14 = v35;
              *a15 = v34;
            }
            else
            {
              uint64_t v25 = 4294967292;
            }
            goto LABEL_67;
          }
          goto LABEL_84;
        }
        unint64_t v34 = 0;
        unint64_t v35 = 0;
        uint64_t v25 = 0;
        goto LABEL_67;
      }
    }
    unint64_t v34 = 0;
LABEL_84:
    unint64_t v35 = 0;
    uint64_t v25 = 4294967291;
    goto LABEL_67;
  }
  if (a4)
  {
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    goto LABEL_79;
  }
  unsigned int v24 = 70;
  uint64_t v25 = 4294967293;
  if (a5 && a13 && a6)
  {
    uint64_t v25 = aclRequiresPasscodeInternal(a1, a2, a5, a6, a13);
LABEL_76:
    if (v25) {
      unsigned int v24 = 70;
    }
    else {
      unsigned int v24 = 10;
    }
  }
LABEL_79:
  if (v24 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclCommandInternal", (int)v25);
  }
  return v25;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, void *a13, unint64_t *a14)
{
  return processAclCommandInternal(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement");
  }
  unsigned int v21 = 70;
  uint64_t v22 = 4294967293;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v21 = 70;
        uint64_t v22 = 4294967293;
        if ((a9 != 0) == (a10 != 0))
        {
          if (a12)
          {
            uint64_t v22 = verifyAclConstraintInternal(a1, a2, 11, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
            if (v22) {
              unsigned int v21 = 70;
            }
            else {
              unsigned int v21 = 10;
            }
          }
        }
      }
    }
  }
  if (v21 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement", (int)v22);
  }
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, void, void), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  int v16 = a1;
  v24[1] = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser");
  }
  BOOL v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3) {
    BOOL v17 = a4 != 0;
  }
  if (v17)
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293;
  }
  else
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293;
    if (a8)
    {
      if (a9 == 16)
      {
        uint64_t v19 = 4294967293;
        if (a5)
        {
          if (a6 == 16)
          {
            uint64_t v20 = a4 + 36;
            MEMORY[0x1F4188790](a1);
            uint64_t v22 = (char *)v24 - ((v21 + 51) & 0x1FFFFFFF0);
            *(_DWORD *)uint64_t v22 = a7;
            *(_OWORD *)(v22 + 4) = *a8;
            *(_OWORD *)(v22 + 20) = *a5;
            if (a3) {
              memcpy(v22 + 36, a3, v21);
            }
            uint64_t v19 = v16(a2, 14, 0, v22, v20, 0, 0);
            if (v19) {
              unsigned int v18 = 70;
            }
            else {
              unsigned int v18 = 10;
            }
          }
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser", (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, char a3)
{
  char v9 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry");
  }
  uint64_t v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0, 0, 0, &v9, 1uLL);
  uint64_t v6 = v5;
  if (v5) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry", (int)v5);
  }
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability");
  }
  char v15 = 0;
  unint64_t v14 = 1;
  char v13 = 0;
  uint64_t v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v15, (uint64_t)&v14);
  if (v8)
  {
    uint64_t v11 = v8;
    unsigned int v9 = 70;
  }
  else
  {
    unsigned int v9 = 70;
    if (v14 > 1)
    {
      uint64_t v11 = 4294967291;
    }
    else
    {
      char v10 = v15 & ~a3;
      if (a4) {
        char v10 = v15 | a3;
      }
      char v13 = v10;
      uint64_t v11 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))a1, a2, 6, 0, 0, 0, &v13, 1uLL);
      if (v11) {
        unsigned int v9 = 70;
      }
      else {
        unsigned int v9 = 10;
      }
    }
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret(uint64_t (*a1)(void, void, void, void, void, void, void), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, unsigned char *a8)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret");
  }
  memset(v27, 0, sizeof(v27));
  uint64_t v25 = 64;
  uint64_t v24 = 129;
  if (!a3) {
    goto LABEL_18;
  }
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293;
  if (!a6 || !a7 || !a8) {
    goto LABEL_14;
  }
  if ((a4 != 0) != (a5 != 0))
  {
LABEL_18:
    unsigned int v16 = 70;
    uint64_t v17 = 4294967293;
    goto LABEL_14;
  }
  uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v27, &v25);
  if (UnlockSecret_Serialize
    || (uint64_t UnlockSecret_Serialize = a1(a2, 50, 0, v27, v25, v26, &v24), UnlockSecret_Serialize)
    || (size_t __n = 0,
        __src = 0,
        char v21 = 0,
        uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecretResponse_Deserialize(v26, v24, &__src, &__n, &v21),
        UnlockSecret_Serialize))
  {
    uint64_t v17 = UnlockSecret_Serialize;
  }
  else
  {
    size_t v19 = __n;
    if (*a7 < __n)
    {
      uint64_t v17 = 4294967276;
    }
    else
    {
      if (__src)
      {
        memcpy(a6, __src, __n);
        uint64_t v17 = 0;
        *a7 = v19;
        *a8 = v21;
        unsigned int v16 = 10;
        goto LABEL_14;
      }
      uint64_t v17 = 4294967291;
    }
  }
  unsigned int v16 = 70;
LABEL_14:
  if (v16 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMSEPControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  __int16 v30 = a8;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl");
  }
  unint64_t v33 = 1024;
  uint64_t v34 = 0;
  if (!a1) {
    goto LABEL_17;
  }
  BOOL v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000;
  if (!a3) {
    BOOL v16 = a4 != 0;
  }
  if (v16)
  {
LABEL_17:
    unsigned int v25 = 70;
    uint64_t v24 = 4294967293;
    goto LABEL_21;
  }
  uint64_t Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if (Size)
  {
LABEL_18:
    uint64_t v24 = Size;
LABEL_25:
    unsigned int v25 = 70;
    goto LABEL_21;
  }
  uint64_t v18 = a5;
  uint64_t v19 = a2;
  uint64_t v20 = (_OWORD *)MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = LibSer_SEPControl_Serialize(v20, a6, a7, a3, a4, (uint64_t)v22, &v34);
  if (v23)
  {
    uint64_t v24 = v23;
    goto LABEL_20;
  }
  uint64_t v24 = a1(v19, 51, 0, v22, v34, v35, &v33);
  if (v24)
  {
LABEL_20:
    unsigned int v25 = 70;
    goto LABEL_21;
  }
  unsigned int v25 = 10;
  BOOL v26 = v30;
  if (!v30 || !a9) {
    goto LABEL_21;
  }
  size_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t Size = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if (Size) {
    goto LABEL_18;
  }
  size_t v27 = v31;
  if (*a9 < v31)
  {
    uint64_t v24 = 4294967276;
    goto LABEL_25;
  }
  if (v32) {
    memcpy(v26, v32, v31);
  }
  uint64_t v24 = 0;
  *a9 = v27;
  unsigned int v25 = 10;
LABEL_21:
  if (v25 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl", (int)v24);
  }
  return v24;
}

uint64_t aclRequiresPasscodeInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, unsigned char *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v19 = 0;
  uint64_t v18 = 4;
  size_t v10 = a4;
  uint64_t v11 = a4 + 4;
  MEMORY[0x1F4188790](a1);
  uint64_t v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0));
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "aclRequiresPasscodeInternal");
  }
  unsigned int v13 = 70;
  uint64_t v14 = 4294967293;
  if (a3 && a5)
  {
    *uint64_t v12 = a4;
    memcpy(v12 + 1, a3, v10);
    uint64_t v15 = a1(a2, 17, 0, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11, &v19, &v18);
    if (v15)
    {
      uint64_t v14 = v15;
      unsigned int v13 = 70;
    }
    else if (v18 == 4)
    {
      uint64_t v14 = 0;
      *a5 = 1;
      unsigned int v13 = 10;
    }
    else
    {
      unsigned int v13 = 70;
      uint64_t v14 = 4294967291;
    }
  }
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "aclRequiresPasscodeInternal", (int)v14);
  }
  return v14;
}

void LibCall_ACMKernelControl_cold_1()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

uint64_t get_aks_client_connection()
{
  if (get_aks_client_dispatch_queue_onceToken != -1) {
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_173);
  }
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_152_0);
  uint64_t result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection) {
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  kern_return_t v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  mach_port_t v3 = *MEMORY[0x1E4F2EF00];
  io_service_t v4 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EF00], path);
  uint64_t v5 = (task_port_t *)MEMORY[0x1E4F14960];
  if (!v4 || (v6 = v4, unsigned int v7 = IOServiceOpen(v4, *MEMORY[0x1E4F14960], 0, &connect), IOObjectRelease(v6), v7))
  {
    uint64_t v8 = IOServiceMatching(a2);
    io_service_t MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      size_t v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  dispatch_queue_t result = connect;
  if (connect)
  {
    uint64_t v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    dispatch_queue_t result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t aks_auth_token_create(int a1, uint64_t a2, int a3, unsigned int a4, void *a5, size_t *a6)
{
  input[4] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v12 = 3758097090;
    if (a5 && a6)
    {
      input[0] = a1;
      input[1] = a4;
      input[2] = a2;
      input[3] = a3;
      return IOConnectCallMethod(aks_client_connection, 0x26u, input, 4u, 0, 0, 0, 0, a5, a6);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_auth_token_create", ":", 1415, "", 0, "", "");
  }
  return v12;
}

uint64_t __getMOApprovedApplicationsManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getDADaemonSessionClass_block_invoke_cold_1(v0);
}

uint64_t __getDADaemonSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[PSAppListController specifiersFromDictionary:stringsTable:parentSpecifier:target:](v0);
}

uint64_t __getOBPrivacyPresenterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PSCalendarPolicyController calendarStatus:](v0);
}

void __PSCalendarAuthorizationStates_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "Error when requesting TCC for kTCCServiceCalendar error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __getCNPrivateAccessAggregatorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCNContactStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __PSContactsAuthorizationStatesForService_block_invoke_cold_1(v0);
}

void __PSContactsAuthorizationStatesForService_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A6597000, v0, v1, "Error when requesting TCC for service: %@ error: %@");
}

uint64_t __getDriverManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1(v0);
}

uint64_t __getPLPrivacyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __62__PSSystemPolicyForApp_loadNetworkConfigurationsForceRefresh___block_invoke_cold_1(v0);
}

uint64_t __getBBObserverClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNudityDetectionPreferencesHelperClass_block_invoke_cold_1(v0);
}

uint64_t __getNudityDetectionPreferencesHelperClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getACActivityCenterClass_block_invoke_cold_1(v0);
}

uint64_t __getACActivityCenterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getACActivityAuthorizationClass_block_invoke_cold_1(v0);
}

uint64_t __getACActivityAuthorizationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPSAppCellularUsageSpecifierClass_block_invoke_cold_1(v0);
}

uint64_t __getPSAppCellularUsageSpecifierClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFOAuthorizationCenterClass_block_invoke_cold_1(v0);
}

uint64_t __getFOAuthorizationCenterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getADTrackingTransparencyClass_block_invoke_cold_1(v0);
}

uint64_t __getADTrackingTransparencyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getDOCDocumentSourceClass_block_invoke_cold_1(v0);
}

uint64_t __getDOCDocumentSourceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPRSettingsProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getPRSettingsProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAnalyticsWorkspaceClass_block_invoke_cold_1(v0);
}

uint64_t __getAnalyticsWorkspaceClass_block_invoke_cold_1()
{
  return __getProcessAnalyticsClass_block_invoke_cold_1();
}

uint64_t __getProcessAnalyticsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getOBTextWelcomeControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getOBTextWelcomeControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVSAccountStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getVSAccountStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFKPrivacySettingsControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getFKPrivacySettingsControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2_cold_1(v0);
}

uint64_t __getOBBundleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAADeviceInfoClass_block_invoke_cold_1(v0);
}

uint64_t __getAADeviceInfoClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAAURLConfigurationClass_block_invoke_cold_1(v0);
}

uint64_t __getAAURLConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRemoteUIControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getRemoteUIControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getiCloudMailAccountProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getiCloudMailAccountProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPKPassLibraryClass_block_invoke_cold_1(v0);
}

uint64_t __getPKPassLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = (uint8_t *)abort_report_np();
  return -[PSAccountsClientListController updateAccountSpecifier](v0);
}

uint64_t __getBFFStyleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PSRootController showController:animate:](v0);
}

uint64_t __getNPSDomainAccessorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNPSManagerClass_block_invoke_cold_1(v0);
}

void __getNPSManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  [(PSViewController *)v0 rootController];
}

uint64_t __getPXTCCPhotoGridViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSecureBackupClass_block_invoke_cold_1(v0);
}

uint64_t __getSecureBackupClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_1(v0);
}

uint64_t __getCDPAccountClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCDPKeychainSyncClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPKeychainSyncClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCDPContextClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCDPStateControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPStateControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCDPUIControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPUIControllerClass_block_invoke_cold_1()
{
  return __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1_0();
}

uint64_t __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  return __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1_0(v0);
}

uint64_t __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  return __getFTDeviceSupportClass_block_invoke_cold_1(v0);
}

uint64_t __getFTDeviceSupportClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](v0);
}

uint64_t __getAXCapabilityManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPGPictureInPictureProxyClass_block_invoke_cold_1(v0);
}

uint64_t __getPGPictureInPictureProxyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getADASManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getADASManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPSUICellularPlanManagerCacheClass_block_invoke_cold_1(v0);
}

uint64_t __getPSUICellularPlanManagerCacheClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCBClientClass_block_invoke_cold_1(v0);
}

uint64_t __getCBClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRTTTelephonyUtilitiesClass_block_invoke_cold_1(v0);
}

uint64_t __getRTTTelephonyUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCAMCaptureCapabilitiesClass_block_invoke_cold_1(v0);
}

void __getCAMCaptureCapabilitiesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  [(PSSpecifier *)v0 identifier];
}

uint64_t __getCommerceRemoteUIDelegateClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getQuotaRequestManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getQuotaRequestManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getGMAvailabilityWrapperClass_block_invoke_cold_1(v0);
}

uint64_t __getGMAvailabilityWrapperClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBBSettingsGatewayClass_block_invoke_cold_1(v0);
}

uint64_t __getBBSettingsGatewayClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[PSLowPowerModeSettingsDetail setEnabled:](v0);
}

void __PSGetAuthorizationStatesForService_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A6597000, log, OS_LOG_TYPE_ERROR, "Error when requesting TCC for service: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

void __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getACAccountStoreClass_block_invoke_cold_1(v0);
}

void __getACAccountStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAKAccountManagerClass_block_invoke_cold_1(v0);
}

void __getAKAccountManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getNPSDomainAccessorClass_block_invoke_cold_1_0(v0);
}

void __getNPSDomainAccessorClass_block_invoke_cold_1_0()
{
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1F41071E0]();
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x1F40D0EB8]();
}

OSStatus AudioServicesSetProperty(AudioServicesPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1F40D4E60](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, *(void *)&inPropertyDataSize, inPropertyData);
}

uint64_t BTAccessoryManagerGetControlCommand()
{
  return MEMORY[0x1F412F608]();
}

uint64_t BTAccessoryManagerSendControlCommand()
{
  return MEMORY[0x1F412F668]();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x1F40D78F8](formatter);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CLCopyAppsUsingLocation()
{
  return MEMORY[0x1F40DB578]();
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1F4109310]();
}

uint64_t CTCallGetCallType()
{
  return MEMORY[0x1F40DEF38]();
}

uint64_t CTCellularDataPlanGetIsEnabled()
{
  return MEMORY[0x1F40DEF58]();
}

uint64_t CTCopyCurrentCallsWithTypes()
{
  return MEMORY[0x1F40DEF70]();
}

uint64_t GSSendAppPreferencesChanged()
{
  return MEMORY[0x1F411CA08]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1F40E86D0](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86D8](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1F40E8F00](*(void *)&bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1F40E8F38](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1F40E91C8](*(void *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9200](entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1F417CE50]();
}

uint64_t MKBGetDeviceLockStateInfo()
{
  return MEMORY[0x1F412F990]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

void NSLog(NSString *format, ...)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E71F8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x1F415C308]();
}

uint64_t SCDynamicStoreAddWatchedKey()
{
  return MEMORY[0x1F4101D68]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F4101DB8](allocator, store, order);
}

SCDynamicStoreRef SCDynamicStoreCreateWithOptions(CFAllocatorRef allocator, CFStringRef name, CFDictionaryRef storeOptions, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DC0](allocator, name, storeOptions, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DD8](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterface(CFAllocatorRef allocator, CFStringRef domain)
{
  return (CFStringRef)MEMORY[0x1F4101DE0](allocator, domain);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DE8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DF0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x1F4101E20]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x1F4101E28](*(void *)&status);
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x1F4101E68]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101E78](interface);
}

CFDictionaryRef SCNetworkInterfaceGetConfiguration(SCNetworkInterfaceRef interface)
{
  return (CFDictionaryRef)MEMORY[0x1F4101E80](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101EA0](interface);
}

Boolean SCNetworkInterfaceSetConfiguration(SCNetworkInterfaceRef interface, CFDictionaryRef config)
{
  return MEMORY[0x1F4101EA8](interface, config);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x1F4101EB8](protocol);
}

Boolean SCNetworkProtocolSetConfiguration(SCNetworkProtocolRef protocol, CFDictionaryRef config)
{
  return MEMORY[0x1F4101EC8](protocol, config);
}

SCNetworkServiceRef SCNetworkServiceCopy(SCPreferencesRef prefs, CFStringRef serviceID)
{
  return (SCNetworkServiceRef)MEMORY[0x1F4101F40](prefs, serviceID);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x1F4101F58](service, protocolType);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x1F4101F78](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x1F4101F88](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x1F4101FC0](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x1F4101FC8](set);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FE8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FF0](prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1F4102000](allocator, name, prefsID, authorization);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x1F4102018](prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

uint64_t SFDeveloperSettingsBundlesDirectoryPath()
{
  return MEMORY[0x1F414B010]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x1F414B028]();
}

uint64_t SFObjectAndOffsetForURLPair()
{
  return MEMORY[0x1F414B038]();
}

uint64_t SFPerformSelector()
{
  return MEMORY[0x1F414B040]();
}

uint64_t SFPerformSelector2()
{
  return MEMORY[0x1F414B048]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x1F414B060]();
}

uint64_t SFTintedImageFromMask()
{
  return MEMORY[0x1F414B068]();
}

uint64_t SOSCCCanAuthenticate()
{
  return MEMORY[0x1F40F6828]();
}

uint64_t SOSCCRemoveThisDeviceFromCircle()
{
  return MEMORY[0x1F40F6858]();
}

uint64_t SOSCCRequestToJoinCircle()
{
  return MEMORY[0x1F40F6860]();
}

uint64_t SOSCCRequestToJoinCircleAfterRestore()
{
  return MEMORY[0x1F40F6868]();
}

uint64_t SOSCCResetToEmpty()
{
  return MEMORY[0x1F40F6870]();
}

uint64_t SOSCCSetUserCredentials()
{
  return MEMORY[0x1F40F6878]();
}

uint64_t SOSCCSetUserCredentialsAndDSID()
{
  return MEMORY[0x1F40F6880]();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return MEMORY[0x1F40F6888]();
}

uint64_t SOSCCViewSet()
{
  return MEMORY[0x1F40F6890]();
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x1F40F6FA8]();
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x1F40F6FB8]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x1F415CB68]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x1F415CB70]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1F415CB78]();
}

uint64_t TCCAccessCopyInformationForBundle()
{
  return MEMORY[0x1F415CB88]();
}

uint64_t TCCAccessGetOverrides()
{
  return MEMORY[0x1F415CBB0]();
}

uint64_t TCCAccessSetForBundle()
{
  return MEMORY[0x1F415CC28]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4102B78]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1F4102BB0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

uint64_t UIKeyboardAutomaticIsOffScreen()
{
  return MEMORY[0x1F4102CA0]();
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x1F4102CA8]();
}

uint64_t UIKeyboardDisableAutomaticAppearance()
{
  return MEMORY[0x1F4102CB0]();
}

uint64_t UIKeyboardEnableAutomaticAppearance()
{
  return MEMORY[0x1F4102CB8]();
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x1F4102CF0]();
}

uint64_t UIKeyboardOrderInAutomatic()
{
  return MEMORY[0x1F4102D08]();
}

uint64_t UIKeyboardOrderInAutomaticSkippingAnimation()
{
  return MEMORY[0x1F4102D18]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x1F4102D20]();
}

uint64_t UIKeyboardOrderOutAutomaticSkippingAnimation()
{
  return MEMORY[0x1F4102D28]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4102D78]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4102DD0]();
}

uint64_t UISystemFontForSize()
{
  return MEMORY[0x1F4102E30]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x1F41788E8]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x1F4178A18]();
}

uint64_t _AXSGuidedAccessHasPasscode()
{
  return MEMORY[0x1F4178B18]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x1F4178CF0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1F4179120]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x1F40D8F38]();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x1F40D8F40]();
}

uint64_t _CFPreferencesPostValuesChangedInDomains()
{
  return MEMORY[0x1F40D8F90]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x1F40D8FB0]();
}

uint64_t _CTServerConnectionCopyCellularUsageWorkspaceInfo()
{
  return MEMORY[0x1F40DF028]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1F40DF0B0]();
}

uint64_t _CTServerConnectionGetRadioModuleIsDead()
{
  return MEMORY[0x1F40DF168]();
}

uint64_t _CTServerConnectionIsUserIdentityModuleRequired()
{
  return MEMORY[0x1F40DF1B0]();
}

uint64_t _NETRBClientCreate()
{
  return MEMORY[0x1F4130810]();
}

uint64_t _NETRBClientDestroy()
{
  return MEMORY[0x1F4130828]();
}

uint64_t _NETRBClientGetDynamicStoreKey()
{
  return MEMORY[0x1F4130830]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _SCNetworkInterfaceGetFamilySubType()
{
  return MEMORY[0x1F41020D0]();
}

uint64_t _SCNetworkInterfaceGetFamilyType()
{
  return MEMORY[0x1F41020D8]();
}

uint64_t _SCNetworkInterfaceGetIOInterfaceType()
{
  return MEMORY[0x1F41020E0]();
}

uint64_t _SCNetworkInterfaceGetIORegistryEntryID()
{
  return MEMORY[0x1F41020F0]();
}

uint64_t _UIUserInterfaceSizeClassForWidth()
{
  return MEMORY[0x1F4103008]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1F40C9C38]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1F40C9CC8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t createDescriptionForMetriclogFile()
{
  return MEMORY[0x1F4178790]();
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1F417A378]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40CC690](*(void *)&a1, a2);
}

uint64_t lockdown_connect()
{
  return MEMORY[0x1F4180930]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x1F4180968]();
}

uint64_t lockdown_set_value()
{
  return MEMORY[0x1F4180990]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

uint64_t setupAWDConnection()
{
  return MEMORY[0x1F4178798]();
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1F415CC68]();
}

uint64_t tcc_authorization_record_get_has_prompted_for_allow()
{
  return MEMORY[0x1F415CC78]();
}

uint64_t tcc_authorization_record_get_service()
{
  return MEMORY[0x1F415CC80]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1F415CC90]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1F415CCF0]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1F415CD00]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1F415CD20]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1F415CD50]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x1F415CD60]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1F415CD80]();
}

uint64_t tcc_server_message_get_authorization_records_by_identity()
{
  return MEMORY[0x1F415CD90]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x1F415CD98]();
}

uint64_t tcc_server_message_prompt_authorization_value()
{
  return MEMORY[0x1F415CDA8]();
}

uint64_t tcc_server_message_set_authorization_value()
{
  return MEMORY[0x1F415CDC8]();
}

uint64_t tcc_server_singleton_default()
{
  return MEMORY[0x1F415CDD0]();
}

uint64_t tcc_service_get_CF_name()
{
  return MEMORY[0x1F415CDD8]();
}

uint64_t tcc_service_get_name()
{
  return MEMORY[0x1F415CDE8]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1F415CDF8]();
}

uint64_t teardownAWDConnection()
{
  return MEMORY[0x1F41787A0]();
}

uint64_t tzlink()
{
  return MEMORY[0x1F4182548]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SpringBoardUIServices(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___SBSUITraitHomeScreenIconStyle(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_SpringBoardUIServices)) {
    return dlopenHelper_SpringBoardUIServices(result);
  }
  return result;
}