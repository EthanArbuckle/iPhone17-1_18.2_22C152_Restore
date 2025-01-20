char **sub_1000020A0()
{
  return off_100008138;
}

uint64_t start(int a1, const char **a2)
{
  if (a1 >= 2)
  {
    v4 = a2[1];
    if (!strcmp(v4, "-n"))
    {
      byte_100008150 = 1;
      byte_100008151 = 1;
    }
    if (!strcmp(v4, "-v")) {
      ++dword_100008154;
    }
    if (a1 >= 3)
    {
      if (!strcmp(a2[2], "-v")) {
        ++dword_100008154;
      }
      if (a1 >= 4 && !strcmp(a2[3], "-v")) {
        ++dword_100008154;
      }
    }
  }
  if (os_variant_allows_internal_security_policies() && (byte_100008151 & 1) == 0)
  {
    v5 = +[NSFileManager defaultManager];
    v204[0] = NSFileOwnerAccountID;
    v204[1] = NSFileGroupOwnerAccountID;
    v205[0] = &off_100004388;
    v205[1] = &off_100004388;
    v204[2] = NSFilePosixPermissions;
    v205[2] = &off_1000043A0;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:v205 forKeys:v204 count:3];
    *(void *)&long long v210 = NSFileOwnerAccountID;
    *((void *)&v210 + 1) = NSFileGroupOwnerAccountID;
    *(void *)&long long v215 = &off_100004388;
    *((void *)&v215 + 1) = &off_100004388;
    *(void *)&long long v211 = NSFilePosixPermissions;
    *(void *)&long long v216 = &off_1000043B8;
    v189 = +[NSDictionary dictionaryWithObjects:&v215 forKeys:&v210 count:3];
    v7 = +[NSString stringWithUTF8String:sub_1000020A0()[1]];
    id v182 = (id)v6;
    *(void *)&long long v195 = 0;
    if ([v5 fileExistsAtPath:v7]) {
      unsigned __int8 v8 = [v5 setAttributes:v6 ofItemAtPath:v7 error:&v195];
    }
    else {
      unsigned __int8 v8 = [v5 createDirectoryAtPath:v7 withIntermediateDirectories:0 attributes:v6 error:&v195];
    }
    unsigned __int8 v9 = v8;
    id v10 = (id)v195;
    if ((v9 & 1) == 0)
    {
      id v11 = [v7 UTF8String];
      id v12 = [v10 description];
      [v12 UTF8String];
      sub_100002E60(@"Failed to create or configure directory %s: %s", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    *(void *)&long long v191 = v10;
    __nel = v5;
    v20 = v7;
    v21 = [v5 contentsOfDirectoryAtPath:v7 error:&v191];
    id v22 = (id)v191;

    id v23 = [v21 countByEnumeratingWithState:&v206 objects:v214 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v207;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v207 != v25) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v206 + 1) + 8 * i);
          v28 = [v27 pathExtension];
          unsigned int v29 = [v28 isEqualToString:@"plist"];

          if (v29)
          {
            v30 = [v20 stringByAppendingPathComponent:v27];
            *(void *)&long long v201 = v22;
            unsigned __int8 v31 = [__nel setAttributes:v189 ofItemAtPath:v30 error:&v201];
            id v32 = (id)v201;

            if ((v31 & 1) == 0)
            {
              id v33 = [v30 UTF8String];
              id v34 = [v32 description];
              [v34 UTF8String];
              sub_100002E60(@"Failed to set permissions for file %s: %s", v35, v36, v37, v38, v39, v40, v41, (uint64_t)v33);
            }
            id v22 = v32;
          }
        }
        id v24 = [v21 countByEnumeratingWithState:&v206 objects:v214 count:16];
      }
      while (v24);
    }
  }
  id v42 = objc_alloc_init((Class)NSMutableArray);
  id v43 = [objc_alloc((Class)FFConfiguration) initPrivateForBootTask];
  v44 = [v43 domains];
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id obj = v44;
  v190 = v43;
  id v183 = [v44 countByEnumeratingWithState:&v195 objects:v205 count:16];
  if (v183)
  {
    uint64_t v180 = *(void *)v196;
    do
    {
      size_t v45 = 0;
      do
      {
        if (*(void *)v196 != v180) {
          objc_enumerationMutation(obj);
        }
        size_t __nela = v45;
        uint64_t v46 = *(void *)(*((void *)&v195 + 1) + 8 * v45);
        v47 = [v43 featuresForDomain:v46];
        long long v191 = 0u;
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        id v48 = [v47 countByEnumeratingWithState:&v191 objects:v204 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = *(void *)v192;
          do
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(void *)v192 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = [v43 stateForFeature:*(void *)(*((void *)&v191 + 1) + 8 * (void)j) domain:v46 level:4];
              if (v52) {
                [v42 addObject:v52];
              }
              if (dword_100008154 >= 2)
              {
                v53 = __stderrp;
                id v54 = [v52 name];
                v55 = (const char *)[v54 UTF8String];
                id v56 = [v52 value];
                v57 = "disabled";
                if (v56 == (id)1) {
                  v57 = "enabled";
                }
                fprintf(v53, "Feature %s = %s\n", v55, v57);

                id v43 = v190;
              }
            }
            id v49 = [v47 countByEnumeratingWithState:&v191 objects:v204 count:16];
          }
          while (v49);
        }

        size_t v45 = __nela + 1;
      }
      while ((id)(__nela + 1) != v183);
      id v183 = [obj countByEnumeratingWithState:&v195 objects:v205 count:16];
    }
    while (v183);
  }

  id v174 = v42;
  uint64_t v58 = +[NSMutableDictionary dictionary];
  size_t v59 = 0;
  int contexta = 0;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v199 = *(_OWORD *)"FEATFLAG";
  long long v200 = *(_OWORD *)&algn_100003A29[7];
  long long v201 = 0u;
  v181 = (void *)v58;
  do
  {
    arc4random_buf((char *)&v200 + 8, 8uLL);
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v184 = v174;
    id v60 = [v184 countByEnumeratingWithState:&v215 objects:v214 count:16];
    if (v60)
    {
      id v61 = v60;
      size_t __nelb = 0;
      id v62 = *(id *)v216;
      id obja = *(id *)v216;
      while (2)
      {
        for (k = 0; k != v61; k = (char *)k + 1)
        {
          if (*(id *)v216 != v62) {
            objc_enumerationMutation(v184);
          }
          v64 = *(void **)(*((void *)&v215 + 1) + 8 * (void)k);
          id v65 = [v64 name];
          v66 = (const char *)[v65 UTF8String];

          size_t v67 = strlen(v66);
          if (v67 < 0x401)
          {
            unint64_t v75 = *((void *)&v200 + 1) ^ (0xC6A4A7935BD1E995 * v67);
            *(void *)&long long v201 = v67;
            *((void *)&v201 + 1) = v75;
            *(void *)&long long v202 = 0;
            DWORD2(v202) = 0;
            unint64_t v76 = (unint64_t)&v66[v67];
            v77 = v66;
            if (v67 >= 0x10)
            {
              do
              {
                unint64_t v75 = 0xC6A4A7935BD1E995
                    * ((0xC6A4A7935BD1E995
                      * ((0xC6A4A7935BD1E995
                        * ((0xC6A4A7935BD1E995 * *(void *)v77) ^ ((0xC6A4A7935BD1E995 * *(void *)v77) >> 47))) ^ v75)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((void *)v77 + 1)) ^ ((0xC6A4A7935BD1E995 * *((void *)v77 + 1)) >> 47))));
                v78 = v77 + 32;
                v77 += 16;
              }
              while ((unint64_t)v78 <= v76);
            }
            if ((unint64_t)(v77 + 8) <= v76)
            {
              do
              {
                unint64_t v75 = 0xC6A4A7935BD1E995
                    * ((0xC6A4A7935BD1E995
                      * ((0xC6A4A7935BD1E995 * *(void *)v77) ^ ((0xC6A4A7935BD1E995 * *(void *)v77) >> 47))) ^ v75);
                BOOL v79 = (unint64_t)(v77 + 16) > v76;
                v77 += 8;
              }
              while (!v79);
            }
            size_t v80 = v59;
            if ((unint64_t)v77 >= v76)
            {
              uint64_t v82 = 0;
              int v81 = 0;
            }
            else
            {
              int v81 = 0;
              uint64_t v82 = 0;
              int64_t v83 = &v66[v67] - v77;
              do
              {
                unsigned int v84 = *(unsigned __int8 *)v77++;
                v82 |= (unint64_t)v84 << v81;
                v81 += 8;
                --v83;
              }
              while (v83);
            }
            *(void *)&long long v201 = 0;
            *((void *)&v201 + 1) = v75;
            *(void *)&long long v202 = v82;
            DWORD2(v202) = v81;
            unint64_t v85 = sub_100002F64((uint64_t)&v201);
            v86 = +[NSNumber numberWithUnsignedLongLong:v85];
            v87 = [v181 objectForKeyedSubscript:v86];

            if (v87)
            {
              [v181 removeAllObjects];
              size_t v59 = 0;
              goto LABEL_79;
            }
            v88 = +[NSNumber numberWithUnsignedLongLong:v85];
            [v181 setObject:v64 forKeyedSubscript:v88];

            if ([v64 value] == (id)1) {
              size_t v59 = v80 + 1;
            }
            else {
              size_t v59 = v80;
            }
            id v62 = obja;
          }
          else
          {
            sub_100002EEC(v67, v68, v69, v70, v71, v72, v73, v74, (uint64_t)v66);
            ++__nelb;
          }
        }
        id v61 = [v184 countByEnumeratingWithState:&v215 objects:v214 count:16];
        if (v61) {
          continue;
        }
        break;
      }
    }
    else
    {
      size_t __nelb = 0;
    }
LABEL_79:

    v89 = (char *)[v181 count] + __nelb;
    if (v89 == [v184 count]) {
      break;
    }
    ++contexta;
  }
  while (contexta != 10);
  v90 = (char *)[v181 count] + __nelb;
  if (v90 != [v184 count]) {
    sub_1000032D4(@"hash collision retry reached", v91, v92, v93, v94, v95, v96, v97, v172);
  }
  uint64_t v98 = v59;
  v99 = malloc_type_malloc(8 * v59 + 32, 0xA9D2D092uLL);
  if (!v99)
  {
    __error();
    sub_1000032D4(@"could not malloc(%zu): %d", v125, v126, v127, v128, v129, v130, v131, 8 * v59 + 32);
  }
  v100 = v99;
  id objb = (id)(8 * v59 + 32);
  long long v101 = v200;
  _OWORD *v99 = v199;
  v99[1] = v101;
  *((void *)v99 + 2) = v59;
  if (dword_100008154 >= 1) {
    fprintf(__stderrp, "Generating hash table with %zu enabled features of %lu known\n", v59, [v181 count]);
  }
  size_t __nelc = v59;
  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  id v102 = v181;
  id v103 = [v102 countByEnumeratingWithState:&v210 objects:&v206 count:16];
  if (v103)
  {
    id v104 = v103;
    uint64_t v105 = 0;
    uint64_t v106 = *(void *)v211;
    do
    {
      for (m = 0; m != v104; m = (char *)m + 1)
      {
        if (*(void *)v211 != v106) {
          objc_enumerationMutation(v102);
        }
        v108 = *(void **)(*((void *)&v210 + 1) + 8 * (void)m);
        v109 = [v102 objectForKeyedSubscript:v108];
        if ([v109 value] == (id)1) {
          v100[v105++ + 4] = [v108 unsignedLongLongValue];
        }
      }
      id v104 = [v102 countByEnumeratingWithState:&v210 objects:&v206 count:16];
    }
    while (v104);
  }

  qsort_b(v100 + 4, __nelc, 8uLL, &stru_1000041B8);
  uint64_t v110 = *((void *)&v200 + 1) ^ (0x35253C9ADE8F4CA8 * __nelc);
  *(void *)&long long v201 = v98 * 8;
  *((void *)&v201 + 1) = v110;
  *(void *)&long long v202 = 0;
  DWORD2(v202) = 0;
  unint64_t v111 = (unint64_t)&v100[v98 + 4];
  if ((unint64_t)(v100 + 6) <= v111)
  {
    v113 = v100 + 4;
    do
    {
      uint64_t v110 = 0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v113) ^ ((0xC6A4A7935BD1E995 * *v113) >> 47))) ^ v110)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v113[1]) ^ ((0xC6A4A7935BD1E995 * v113[1]) >> 47))));
      v112 = (char *)(v113 + 2);
      v114 = v113 + 4;
      v113 += 2;
    }
    while ((unint64_t)v114 <= v111);
  }
  else
  {
    v112 = (char *)(v100 + 4);
  }
  if ((unint64_t)(v112 + 8) <= v111)
  {
    do
    {
      v115 = v112 + 8;
      uint64_t v110 = 0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(void *)v112) ^ ((0xC6A4A7935BD1E995 * *(void *)v112) >> 47))) ^ v110);
      BOOL v79 = (unint64_t)(v112 + 16) > v111;
      v112 += 8;
    }
    while (!v79);
  }
  else
  {
    v115 = v112;
  }
  if ((unint64_t)v115 >= v111)
  {
    uint64_t v117 = 0;
    int v116 = 0;
  }
  else
  {
    int v116 = 0;
    uint64_t v117 = 0;
    int64_t v118 = (char *)&v100[v98 + 4] - v115;
    do
    {
      unsigned int v119 = *v115++;
      v117 |= (unint64_t)v119 << v116;
      v116 += 8;
      --v118;
    }
    while (v118);
  }
  *(void *)&long long v201 = 0;
  *((void *)&v201 + 1) = v110;
  *(void *)&long long v202 = v117;
  DWORD2(v202) = v116;
  v100[1] = sub_100002F64((uint64_t)&v201);

  if ((byte_100008150 & 1) == 0)
  {
    int v120 = shm_open("com.apple.featureflags.shm", 2562, 420);
    if (v120 < 0)
    {
      v132 = __error();
      sub_1000032D4(@"shm_open failed: %d", v133, v134, v135, v136, v137, v138, v139, *v132);
    }
    int v121 = v120;
    if (ftruncate(v120, (off_t)objb) == -1)
    {
      v140 = __error();
      sub_1000032D4(@"failed to size shared memory: %d", v141, v142, v143, v144, v145, v146, v147, *v140);
    }
    v122 = mmap(0, (size_t)objb, 3, 1, v121, 0);
    if (v122 == (void *)-1)
    {
      v148 = __error();
      sub_1000032D4(@"failed to mmap shared memory: %d", v149, v150, v151, v152, v153, v154, v155, *v148);
    }
    v123 = v122;
    memcpy(v122, v100, (size_t)objb);
    if (munmap(v123, (size_t)objb) == -1)
    {
      v156 = __error();
      sub_1000032D4(@"failed to unmap shared memory: %d", v157, v158, v159, v160, v161, v162, v163, *v156);
    }
    if (close(v121) == -1)
    {
      v164 = __error();
      sub_1000032D4(@"failed to close shared memory descriptor: %d", v165, v166, v167, v168, v169, v170, v171, *v164);
    }
  }

  return 0;
}

void sub_100002E60(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&a9];

  id v11 = __stderrp;
  id v12 = v10;
  fprintf(v11, "init_featureflags: %s\n", (const char *)[v12 UTF8String]);
}

void sub_100002EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"feature name is too long: %s - ignored" arguments:&a9];
  id v10 = __stderrp;
  id v11 = v9;
  fprintf(v10, "init_featureflags: %s\n", (const char *)[v11 UTF8String]);
}

unint64_t sub_100002F64(uint64_t a1)
{
  unint64_t v1 = *(void *)a1;
  if (!*(void *)a1)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    if (!*(_DWORD *)(a1 + 24)) {
      return (0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) >> 47);
    }
    goto LABEL_61;
  }
  memset(v29, 0, sizeof(v29));
  if (v1 > 0x1F)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(a1 + 16);
    unint64_t v4 = v1;
    unsigned int v5 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      uint64_t v6 = v1 >= 0x20 ? 32 : v1;
      v7 = (char *)v29 + v6;
      if (!v5) {
        break;
      }
      if (v6 && v5 <= 0x3F)
      {
        uint64_t v8 = 0;
        id v9 = (char *)v29;
        do
        {
          unint64_t v10 = v5 + v8;
          unsigned int v11 = *v9++;
          v3 |= (unint64_t)v11 << (v5 + v8);
          v8 += 8;
        }
        while (v9 < v7 && v10 < 0x38);
        if (v10 > 0x37) {
          goto LABEL_18;
        }
        v5 += v8;
      }
      else if (v5 >= 0x40)
      {
        id v9 = (char *)v29;
LABEL_18:
        unint64_t v12 = 0xC6A4A7935BD1E995 * v3;
        uint64_t v3 = 0;
        unint64_t v2 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ v2);
LABEL_19:
        uint64_t v13 = v9 + 16;
        while (v13 <= v7)
        {
          unint64_t v2 = 0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995
                 * ((0xC6A4A7935BD1E995 * *(void *)v9) ^ ((0xC6A4A7935BD1E995 * *(void *)v9) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((void *)v9 + 1)) ^ ((0xC6A4A7935BD1E995 * *((void *)v9 + 1)) >> 47))));
          uint64_t v13 = v9 + 32;
          v9 += 16;
        }
        if (v9 + 8 <= v7)
        {
          do
          {
            unint64_t v2 = 0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995
                 * ((0xC6A4A7935BD1E995 * *(void *)v9) ^ ((0xC6A4A7935BD1E995 * *(void *)v9) >> 47))) ^ v2);
            BOOL v14 = v9 + 16 > v7;
            v9 += 8;
          }
          while (!v14);
        }
        if (v9 >= v7)
        {
          unsigned int v5 = 0;
        }
        else
        {
          unsigned int v5 = 0;
          uint64_t v15 = (char *)((char *)v29 + v6 - v9);
          do
          {
            unsigned int v16 = *v9++;
            v3 |= (unint64_t)v16 << v5;
            v5 += 8;
            --v15;
          }
          while (v15);
        }
      }
      v1 -= v6;
      v4 -= 32;
      if (v4 <= 0x1F)
      {
        *(void *)a1 = v1;
        *(void *)(a1 + 8) = v2;
        *(void *)(a1 + 16) = v3;
        *(_DWORD *)(a1 + 24) = v5;
        goto LABEL_35;
      }
    }
    id v9 = (char *)v29;
    goto LABEL_19;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t v4 = v1;
  unsigned int v5 = *(_DWORD *)(a1 + 24);
LABEL_35:
  if (v1 < v4) {
    unint64_t v4 = v1;
  }
  uint64_t v17 = (unsigned __int8 *)v29;
  uint64_t v18 = (unsigned __int8 *)v29 + v4;
  if (v5)
  {
    if (v4 && v5 <= 0x3F)
    {
      uint64_t v19 = 0;
      uint64_t v17 = (unsigned __int8 *)v29;
      do
      {
        unint64_t v20 = v5 + v19;
        unsigned int v21 = *v17++;
        v3 |= (unint64_t)v21 << (v5 + v19);
        v19 += 8;
      }
      while (v17 < v18 && v20 < 0x38);
      if (v20 <= 0x37)
      {
        v5 += v19;
        goto LABEL_60;
      }
    }
    else
    {
      if (v5 < 0x40) {
        goto LABEL_60;
      }
      uint64_t v17 = (unsigned __int8 *)v29;
    }
    unint64_t v22 = 0xC6A4A7935BD1E995 * v3;
    uint64_t v3 = 0;
    unint64_t v2 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v22 ^ (v22 >> 47))) ^ v2);
  }
  if (v17 + 16 <= v18)
  {
    do
    {
      unint64_t v2 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(void *)v17) ^ ((0xC6A4A7935BD1E995 * *(void *)v17) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((void *)v17 + 1)) ^ ((0xC6A4A7935BD1E995 * *((void *)v17 + 1)) >> 47))));
      id v23 = (char *)(v17 + 16);
      id v24 = v17 + 32;
      v17 += 16;
    }
    while (v24 <= v18);
  }
  else
  {
    id v23 = (char *)v17;
  }
  if (v23 + 8 <= (char *)v18)
  {
    do
    {
      uint64_t v25 = v23 + 8;
      unint64_t v2 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995 * *(void *)v23) ^ ((0xC6A4A7935BD1E995 * *(void *)v23) >> 47))) ^ v2);
      BOOL v14 = v23 + 16 > (char *)v18;
      v23 += 8;
    }
    while (!v14);
  }
  else
  {
    uint64_t v25 = v23;
  }
  if (v25 >= (char *)v18)
  {
    unsigned int v5 = 0;
  }
  else
  {
    unsigned int v5 = 0;
    v26 = (char *)((char *)v29 + v4 - v25);
    do
    {
      unsigned int v27 = *v25++;
      v3 |= (unint64_t)v27 << v5;
      v5 += 8;
      --v26;
    }
    while (v26);
  }
LABEL_60:
  *(void *)a1 = v1 - v4;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = v5;
  if (v5) {
LABEL_61:
  }
    unint64_t v2 = 0xC6A4A7935BD1E995 * (*(void *)(a1 + 16) ^ v2);
  return (0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) >> 47);
}

void sub_1000032D4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:a1 arguments:&a9];
  fprintf(__stderrp, "init_featureflags: %s\n", (const char *)[v9 UTF8String]);
  abort();
}

int sub_10000333C(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3) {
    sub_1000032D4(@"duplicate hash found in table: 0x%llx", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, *(void *)a2);
  }
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return 1;
  }
}

int *__error(void)
{
  return ___error();
}

void abort(void)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int close(int a1)
{
  return _close(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int shm_open(const char *a1, int a2, ...)
{
  return _shm_open(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return [a1 domains];
}

id objc_msgSend_feature(void *a1, const char *a2, ...)
{
  return [a1 feature];
}

id objc_msgSend_initPrivateForBootTask(void *a1, const char *a2, ...)
{
  return [a1 initPrivateForBootTask];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}