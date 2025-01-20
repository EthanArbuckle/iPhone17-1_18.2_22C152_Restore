@interface CUKeychainItem(RPIdentity)
- (uint64_t)updateWithRPIdentity:()RPIdentity error:;
- (uint64_t)updateWithRPIdentity:()RPIdentity revisionUpdate:error:;
@end

@implementation CUKeychainItem(RPIdentity)

- (uint64_t)updateWithRPIdentity:()RPIdentity error:
{
  return [a1 updateWithRPIdentity:a3 revisionUpdate:0 error:a4];
}

- (uint64_t)updateWithRPIdentity:()RPIdentity revisionUpdate:error:
{
  id v8 = a3;
  v9 = [a1 metadata];
  v254 = a1;
  v258 = [a1 secrets];
  CFArrayGetTypeID();
  v10 = CFDictionaryGetTypedValue();
  id v11 = [v8 accessGroups];
  id v12 = v10;
  v13 = v12;
  v250 = v12;
  int v222 = a4;
  v235 = a5;
  if (v11 == v12)
  {

    goto LABEL_6;
  }
  if ((v12 != 0) != (v11 == 0))
  {
    char v14 = [v11 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_8;
    }
LABEL_6:
    id v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_12;
  }

LABEL_8:
  v17 = (void *)[v9 mutableCopy];
  v18 = v17;
  if (v17)
  {
    id v15 = v17;
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [v15 setObject:v11 forKeyedSubscript:@"accessGroups"];
  uint64_t v16 = 0x80000;
LABEL_12:
  CFStringGetTypeID();
  v19 = CFDictionaryGetTypedValue();
  v20 = [v8 accountAltDSID];
  v249 = v19;
  v252 = v20;
  if (![v20 length]) {
    goto LABEL_25;
  }
  id v21 = v20;
  id v22 = v19;
  v23 = v22;
  if (v21 == v22)
  {

    goto LABEL_25;
  }
  if ((v22 != 0) != (v21 == 0))
  {
    char v24 = [v21 isEqual:v22];

    if (v24) {
      goto LABEL_25;
    }
    if (v15) {
      goto LABEL_24;
    }
    goto LABEL_20;
  }

  if (!v15)
  {
LABEL_20:
    v25 = (void *)[v9 mutableCopy];
    v26 = v25;
    if (v25)
    {
      id v15 = v25;
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
  }
LABEL_24:
  [v15 setObject:v21 forKeyedSubscript:@"accountAltDSID"];
  uint64_t v16 = v16 | 0x2000000;
LABEL_25:
  CFStringGetTypeID();
  v27 = CFDictionaryGetTypedValue();
  v28 = [v8 accountID];
  v248 = v27;
  if (![v28 length]) {
    goto LABEL_39;
  }
  v29 = v28;
  id v30 = v28;
  id v31 = v27;
  v32 = v31;
  if (v30 == v31)
  {
  }
  else
  {
    if ((v31 != 0) == (v30 == 0))
    {

      if (!v15)
      {
LABEL_33:
        v34 = (void *)[v9 mutableCopy];
        v35 = v34;
        if (v34)
        {
          id v15 = v34;
        }
        else
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
      }
LABEL_37:
      [v15 setObject:v30 forKeyedSubscript:@"accountID"];
      uint64_t v16 = v16 | 0x2000;
      goto LABEL_38;
    }
    char v33 = [v30 isEqual:v31];

    if ((v33 & 1) == 0)
    {
      if (!v15) {
        goto LABEL_33;
      }
      goto LABEL_37;
    }
  }
LABEL_38:
  v28 = v29;
LABEL_39:
  CFStringGetTypeID();
  v36 = CFDictionaryGetTypedValue();
  v37 = [v8 contactID];
  v246 = v37;
  v247 = v28;
  v251 = v36;
  if (![v37 length]) {
    goto LABEL_52;
  }
  id v38 = v37;
  id v39 = v36;
  v40 = v39;
  if (v38 == v39)
  {

    goto LABEL_52;
  }
  if ((v39 != 0) != (v38 == 0))
  {
    char v41 = [v38 isEqual:v39];

    if (v41) {
      goto LABEL_52;
    }
    if (v15) {
      goto LABEL_51;
    }
    goto LABEL_47;
  }

  if (!v15)
  {
LABEL_47:
    v42 = (void *)[v9 mutableCopy];
    v43 = v42;
    if (v42)
    {
      id v15 = v42;
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
  }
LABEL_51:
  [v15 setObject:v38 forKeyedSubscript:@"contactID"];
  uint64_t v16 = v16 | 0x8000;
LABEL_52:
  v44 = [v8 dateAcknowledged];
  CFDateGetTypeID();
  v45 = CFDictionaryGetTypedValue();
  id v46 = v44;
  id v47 = v45;
  v244 = v47;
  if (v46 == v47)
  {

    goto LABEL_64;
  }
  v48 = v47;
  if ((v46 == 0) != (v47 != 0))
  {
    char v49 = [v46 isEqual:v47];

    if (v49) {
      goto LABEL_64;
    }
    if (v15) {
      goto LABEL_63;
    }
    goto LABEL_59;
  }

  if (!v15)
  {
LABEL_59:
    v50 = (void *)[v9 mutableCopy];
    v51 = v50;
    if (v50)
    {
      id v15 = v50;
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
  }
LABEL_63:
  [v15 setObject:v46 forKeyedSubscript:@"dateAck"];
  uint64_t v16 = v16 | 2;
LABEL_64:
  uint64_t v52 = [v8 dateAdded];
  v237 = (void *)v52;
  if (!v52) {
    goto LABEL_79;
  }
  v53 = (void *)v52;
  CFDateGetTypeID();
  v54 = CFDictionaryGetTypedValue();
  id v55 = v53;
  id v56 = v54;
  v57 = v56;
  if (v55 != v56)
  {
    id v58 = v46;
    if (v56)
    {
      char v59 = [v55 isEqual:v56];

      if (v59)
      {
LABEL_77:
        id v46 = v58;
        goto LABEL_78;
      }
      if (!v15) {
        goto LABEL_72;
      }
    }
    else
    {

      if (!v15)
      {
LABEL_72:
        v60 = (void *)[v9 mutableCopy];
        v61 = v60;
        if (v60)
        {
          id v15 = v60;
        }
        else
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
      }
    }
    [v15 setObject:v55 forKeyedSubscript:@"dateAdded"];
    uint64_t v16 = v16 | 2;
    goto LABEL_77;
  }

LABEL_78:
LABEL_79:
  v62 = [v8 dateRemoved];
  CFDateGetTypeID();
  v63 = CFDictionaryGetTypedValue();
  id v64 = v62;
  id v65 = v63;
  v66 = v64;
  v245 = v46;
  v242 = v65;
  v243 = v64;
  if (v64 == v65)
  {

    if (v64) {
      goto LABEL_83;
    }
LABEL_85:
    id v253 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v253 addObject:@"dateRemoved"];
    goto LABEL_96;
  }
  v67 = v65;
  if ((v64 == 0) != (v65 != 0))
  {
    char v68 = [v64 isEqual:v65];

    if (v68)
    {
      if (v66)
      {
LABEL_83:
        id v253 = 0;
        goto LABEL_96;
      }
      goto LABEL_85;
    }
  }
  else
  {
  }
  if (v66)
  {
    if (!v15)
    {
      v69 = (void *)[v9 mutableCopy];
      v70 = v69;
      if (v69)
      {
        id v15 = v69;
      }
      else
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
    }
    [v15 setObject:v66 forKeyedSubscript:@"dateRemoved"];
    id v253 = 0;
  }
  else
  {
    id v253 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v253 addObject:@"dateRemoved"];
  }
  uint64_t v16 = v16 | 2;
LABEL_96:
  v71 = [v8 dateRequested];
  CFDateGetTypeID();
  v72 = CFDictionaryGetTypedValue();
  id v73 = v71;
  id v74 = v72;
  v241 = v74;
  if (v73 == v74)
  {

    if (v73) {
      goto LABEL_117;
    }
    goto LABEL_102;
  }
  v75 = v74;
  if ((v73 == 0) != (v74 != 0))
  {
    char v76 = [v73 isEqual:v74];

    if (v76)
    {
      if (v73) {
        goto LABEL_117;
      }
LABEL_102:
      id v77 = v253;
      if (!v253) {
        id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      id v253 = v77;
      [v77 addObject:@"dateReq"];
      goto LABEL_117;
    }
  }
  else
  {
  }
  if (v73)
  {
    if (!v15)
    {
      v78 = (void *)[v9 mutableCopy];
      v79 = v78;
      if (v78)
      {
        id v15 = v78;
      }
      else
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
    }
    [v15 setObject:v73 forKeyedSubscript:@"dateReq"];
  }
  else
  {
    id v80 = v253;
    if (!v253) {
      id v80 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v253 = v80;
    [v80 addObject:@"dateReq"];
  }
  uint64_t v16 = v16 | 2;
LABEL_117:
  v81 = [v8 deviceIRKData];
  v240 = v81;
  if ([v81 length] != 16)
  {
    v255 = 0;
    goto LABEL_131;
  }
  CFDataGetTypeID();
  v82 = CFDictionaryGetTypedValue();
  id v83 = v81;
  id v84 = v82;
  v85 = v84;
  if (v83 == v84)
  {
  }
  else
  {
    if ((v83 == 0) == (v84 != 0))
    {

LABEL_126:
      v87 = (void *)[v258 mutableCopy];
      v88 = v87;
      if (v87)
      {
        id v89 = v87;
      }
      else
      {
        id v89 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v255 = v89;
      [v89 setObject:v83 forKeyedSubscript:@"dIRK"];
      uint64_t v16 = v16 | 4;
      goto LABEL_130;
    }
    char v86 = [v83 isEqual:v84];

    if ((v86 & 1) == 0) {
      goto LABEL_126;
    }
  }
  v255 = 0;
LABEL_130:

LABEL_131:
  v90 = [v8 edPKData];
  v239 = v90;
  if ([v90 length] != 32) {
    goto LABEL_145;
  }
  CFDataGetTypeID();
  v91 = CFDictionaryGetTypedValue();
  id v92 = v90;
  id v93 = v91;
  v94 = v93;
  if (v92 != v93)
  {
    if ((v92 == 0) != (v93 != 0))
    {
      char v95 = [v92 isEqual:v93];

      if (v95) {
        goto LABEL_144;
      }
    }
    else
    {
    }
    v96 = v255;
    if (!v255)
    {
      v97 = (void *)[v258 mutableCopy];
      v98 = v97;
      if (v97)
      {
        id v99 = v97;
      }
      else
      {
        id v99 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v96 = v99;
    }
    v255 = v96;
    [v96 setObject:v92 forKeyedSubscript:@"edPK"];
    uint64_t v16 = v16 | 8;
    goto LABEL_144;
  }

LABEL_144:
LABEL_145:
  v100 = [v8 edSKData];
  v238 = v100;
  if ([v100 length] == 32)
  {
    CFDataGetTypeID();
    v101 = CFDictionaryGetTypedValue();
    id v102 = v100;
    id v103 = v101;
    v104 = v103;
    if (v102 != v103)
    {
      if ((v102 == 0) != (v103 != 0))
      {
        char v105 = [v102 isEqual:v103];

        if (v105) {
          goto LABEL_158;
        }
      }
      else
      {
      }
      v106 = v255;
      if (!v255)
      {
        v107 = (void *)[v258 mutableCopy];
        v108 = v107;
        if (v107)
        {
          id v109 = v107;
        }
        else
        {
          id v109 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        v106 = v109;
      }
      v255 = v106;
      [v106 setObject:v102 forKeyedSubscript:@"edSK"];
      uint64_t v16 = v16 | 0x10;
      goto LABEL_158;
    }

LABEL_158:
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  uint64_t v111 = [v8 featureFlags];
  if (v111)
  {
    uint64_t v112 = v111;
    if (v111 != Int64)
    {
      if (!v15)
      {
        v113 = (void *)[v9 mutableCopy];
        v114 = v113;
        if (v113)
        {
          id v15 = v113;
        }
        else
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
      }
      v115 = [NSNumber numberWithUnsignedLongLong:v112];
      [v15 setObject:v115 forKeyedSubscript:@"ff"];

      uint64_t v16 = v16 | 0x400;
    }
  }
  v117 = v251;
  v116 = v252;
  v118 = [v8 identifier];
  if (v118)
  {
    v119 = v118;
    v120 = [v254 identifier];
    id v232 = v119;
    id v121 = v119;
    id v122 = v120;
    if (v121 == v122)
    {

      goto LABEL_178;
    }
    v123 = v122;
    if (v122)
    {
      char v124 = [v121 isEqual:v122];

      if (v124)
      {
LABEL_178:
        v126 = [v8 idsDeviceID];
        v127 = v126;
        if (!v126) {
          goto LABEL_195;
        }
        id v128 = v126;
        id v129 = v121;
        v130 = v129;
        if (v128 == v129)
        {
        }
        else
        {
          char v131 = [v128 isEqual:v129];

          if (v131) {
            goto LABEL_195;
          }
          CFStringGetTypeID();
          v132 = CFDictionaryGetTypedValue();
          id v133 = v128;
          id v134 = v132;
          v130 = v134;
          if (v133 != v134)
          {
            if (v134)
            {
              char v135 = [v133 isEqual:v134];

              if (v135) {
                goto LABEL_194;
              }
            }
            else
            {
            }
            if (!v15)
            {
              v136 = (void *)[v9 mutableCopy];
              v137 = v136;
              if (v136)
              {
                id v15 = v136;
              }
              else
              {
                id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
            }
            [v15 setObject:v133 forKeyedSubscript:@"idsDeviceID"];
            uint64_t v16 = v16 | 0x40;
            goto LABEL_194;
          }
        }
LABEL_194:

LABEL_195:
        CFStringGetTypeID();
        v138 = CFDictionaryGetTypedValue();
        v139 = [v8 mediaRemoteID];
        v234 = v138;
        v231 = v139;
        if (![v139 length]) {
          goto LABEL_208;
        }
        id v140 = v139;
        id v141 = v138;
        v142 = v141;
        if (v140 == v141)
        {
        }
        else
        {
          if ((v141 != 0) != (v140 == 0))
          {
            char v143 = [v140 isEqual:v141];

            if (v143)
            {
              v138 = v234;
              goto LABEL_208;
            }
          }
          else
          {
          }
          v138 = v234;
          if (!v15)
          {
            v144 = (void *)[v9 mutableCopy];
            v145 = v144;
            if (v144)
            {
              id v15 = v144;
            }
            else
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
          }
          [v15 setObject:v140 forKeyedSubscript:@"mediaRemoteID"];
          uint64_t v16 = v16 | 0x10000;
        }
LABEL_208:
        CFStringGetTypeID();
        v146 = CFDictionaryGetTypedValue();
        v147 = [v8 mediaRouteID];
        v229 = v147;
        v230 = v146;
        if (![v147 length]) {
          goto LABEL_221;
        }
        id v148 = v147;
        id v149 = v146;
        v150 = v149;
        if (v148 == v149)
        {
        }
        else
        {
          if ((v149 != 0) != (v148 == 0))
          {
            char v151 = [v148 isEqual:v149];

            if (v151)
            {
              v138 = v234;
              goto LABEL_221;
            }
          }
          else
          {
          }
          v138 = v234;
          if (!v15)
          {
            v152 = (void *)[v9 mutableCopy];
            v153 = v152;
            if (v152)
            {
              id v15 = v152;
            }
            else
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
          }
          [v15 setObject:v148 forKeyedSubscript:@"mediaRouteID"];
          uint64_t v16 = v16 | 0x20000;
        }
LABEL_221:
        CFStringGetTypeID();
        v154 = CFDictionaryGetTypedValue();
        v155 = [v8 model];
        v227 = v155;
        v228 = v154;
        if (![v155 length]) {
          goto LABEL_234;
        }
        id v156 = v155;
        id v157 = v154;
        v158 = v157;
        if (v156 == v157)
        {
        }
        else
        {
          if ((v157 != 0) != (v156 == 0))
          {
            char v159 = [v156 isEqual:v157];

            if (v159)
            {
              v138 = v234;
              goto LABEL_234;
            }
          }
          else
          {
          }
          v138 = v234;
          if (!v15)
          {
            v160 = (void *)[v9 mutableCopy];
            v161 = v160;
            if (v160)
            {
              id v15 = v160;
            }
            else
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
          }
          [v15 setObject:v156 forKeyedSubscript:@"model"];
          uint64_t v16 = v16 | 0x80;
        }
LABEL_234:
        v162 = [v254 name];
        v163 = [v8 name];
        v225 = v163;
        v226 = v162;
        if (![v163 length]) {
          goto LABEL_243;
        }
        id v164 = v163;
        id v165 = v162;
        v166 = v165;
        if (v164 == v165)
        {

          goto LABEL_243;
        }
        if ((v165 != 0) != (v164 == 0))
        {
          char v167 = [v164 isEqual:v165];

          if (v167) {
            goto LABEL_242;
          }
        }
        else
        {
        }
        [v254 setName:v164];
        uint64_t v16 = v16 | 0x100;
LABEL_242:
        v138 = v234;
LABEL_243:
        CFStringGetTypeID();
        v168 = CFDictionaryGetTypedValue();
        v169 = [v8 sendersKnownAlias];
        id v233 = v11;
        v223 = v169;
        v224 = v168;
        if (![v169 length]) {
          goto LABEL_256;
        }
        id v170 = v169;
        id v171 = v168;
        v172 = v171;
        if (v170 == v171)
        {
        }
        else
        {
          if ((v171 != 0) != (v170 == 0))
          {
            char v173 = [v170 isEqual:v171];

            if (v173)
            {
              id v11 = v233;
              goto LABEL_256;
            }
          }
          else
          {
          }
          id v11 = v233;
          if (!v15)
          {
            v174 = (void *)[v9 mutableCopy];
            v175 = v174;
            if (v174)
            {
              id v15 = v174;
            }
            else
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
          }
          [v15 setObject:v170 forKeyedSubscript:@"ska"];
          uint64_t v16 = v16 | 0x40000;
        }
LABEL_256:
        objc_opt_class();
        v176 = NSDictionaryGetNSArrayOfClass();
        id v177 = [v8 allUsedSendersKnownAliases];
        id v178 = v176;
        v179 = v178;
        if (v177 == v178)
        {

LABEL_269:
          unsigned int v183 = [v8 type] - 1;
          if (v183 >= 0xC || ((0x8FFu >> v183) & 1) == 0)
          {
            if (v235)
            {
              [v8 type];
              RPErrorF();
              void *v235 = (id)objc_claimAutoreleasedReturnValue();
            }
            uint64_t v16 = 1;
LABEL_330:

            v117 = v251;
            v116 = v252;
            v125 = v237;
            v118 = v232;
            goto LABEL_331;
          }
          v236 = v127;
          v184 = off_1E605CF90[v183];
          v185 = [v254 type];
          if (v184 != v185)
          {
            v186 = v185;
            if (!v185
              || (char v187 = [(__CFString *)v184 isEqual:v185],
                  v186,
                  v186,
                  (v187 & 1) == 0))
            {
              [v254 setType:v184];
              uint64_t v16 = v16 | 0x200;
            }
          }
          BOOL v188 = CFDictionaryGetInt64() == 0;
          uint64_t v189 = [v8 userAdded];
          id v190 = v253;
          if (((v188 ^ v189) & 1) == 0)
          {
            uint64_t v191 = v189;
            if (!v15)
            {
              v192 = (void *)[v9 mutableCopy];
              v193 = v192;
              if (v192)
              {
                id v15 = v192;
              }
              else
              {
                id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              id v190 = v253;
            }
            v194 = [NSNumber numberWithBool:v191];
            [v15 setObject:v194 forKeyedSubscript:@"userAdded"];

            uint64_t v16 = v16 | 0x4000;
          }
          v195 = [v8 btIRKData];
          v221 = v195;
          if ([v195 length] != 16)
          {
LABEL_299:
            v204 = [v8 btAddress];
            v220 = v204;
            if ([v204 length] != 7) {
              goto LABEL_313;
            }
            CFDataGetTypeID();
            v205 = CFDictionaryGetTypedValue();
            id v206 = v204;
            id v207 = v205;
            v208 = v207;
            if (v206 != v207)
            {
              if ((v206 == 0) != (v207 != 0))
              {
                char v209 = [v206 isEqual:v207];

                if (v209) {
                  goto LABEL_312;
                }
              }
              else
              {
              }
              v210 = v255;
              if (!v255)
              {
                v211 = (void *)[v258 mutableCopy];
                v257 = v211;
                if (v211)
                {
                  id v212 = v211;
                }
                else
                {
                  id v212 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                }
                v210 = v212;
              }
              v255 = v210;
              [v210 setObject:v206 forKeyedSubscript:@"bAdd"];
              uint64_t v16 = v16 | 0x800000;
              goto LABEL_312;
            }

LABEL_312:
            id v190 = v253;

LABEL_313:
            if (v222 && v16) {
              objc_msgSend(v8, "setRevisionID:", objc_msgSend(v8, "revisionID") + 1);
            }
            int Int64Ranged = CFDictionaryGetInt64Ranged();
            uint64_t v214 = [v8 revisionID];
            if (v214 != Int64Ranged)
            {
              uint64_t v215 = v214;
              if (!v15)
              {
                v216 = (void *)[v9 mutableCopy];
                v217 = v216;
                if (v216)
                {
                  id v15 = v216;
                }
                else
                {
                  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                }
                id v190 = v253;
              }
              v218 = [NSNumber numberWithUnsignedInt:v215];
              [v15 setObject:v218 forKeyedSubscript:@"revisionID"];
            }
            id v11 = v233;
            v138 = v234;
            if (v15) {
              [v254 setMetadata:v15];
            }
            if (v190) {
              [v254 setRemovedMetadata:v190];
            }
            if (v255) {
              objc_msgSend(v254, "setSecrets:");
            }

            v127 = v236;
            goto LABEL_330;
          }
          CFDataGetTypeID();
          v196 = CFDictionaryGetTypedValue();
          id v197 = v195;
          id v198 = v196;
          v199 = v198;
          if (v197 != v198)
          {
            if ((v197 == 0) != (v198 != 0))
            {
              char v200 = [v197 isEqual:v198];

              if (v200) {
                goto LABEL_298;
              }
            }
            else
            {
            }
            v201 = v255;
            if (!v255)
            {
              v202 = (void *)[v258 mutableCopy];
              v256 = v202;
              if (v202)
              {
                id v203 = v202;
              }
              else
              {
                id v203 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              v201 = v203;
            }
            v255 = v201;
            [v201 setObject:v197 forKeyedSubscript:@"bIRK"];
            uint64_t v16 = v16 | 0x400000;
            goto LABEL_298;
          }

LABEL_298:
          id v190 = v253;

          goto LABEL_299;
        }
        if ((v178 != 0) != (v177 == 0))
        {
          char v180 = [v177 isEqual:v178];

          if (v180)
          {
LABEL_268:
            id v11 = v233;
            goto LABEL_269;
          }
          if (!v15) {
            goto LABEL_263;
          }
        }
        else
        {

          if (!v15)
          {
LABEL_263:
            v181 = (void *)[v9 mutableCopy];
            v182 = v181;
            if (v181)
            {
              id v15 = v181;
            }
            else
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
          }
        }
        [v15 setObject:v177 forKeyedSubscript:@"allUsedSKAs"];
        uint64_t v16 = v16 | 0x1000000;
        goto LABEL_268;
      }
    }
    else
    {
    }
    [v254 setIdentifier:v121];
    uint64_t v16 = v16 | 0x20;
    goto LABEL_178;
  }
  if (v235)
  {
    RPErrorF();
    void *v235 = (id)objc_claimAutoreleasedReturnValue();
    v118 = 0;
  }
  uint64_t v16 = 1;
  v125 = v237;
LABEL_331:

  return v16;
}

@end