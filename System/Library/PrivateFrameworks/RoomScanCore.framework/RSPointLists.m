@interface RSPointLists
- (RSPointLists)init;
- (id)getRSOuterPointList;
- (id)getRSPointLists;
- (id)getRSWallLists;
- (void)generateRSPointListsWithWalls:(id)a3;
@end

@implementation RSPointLists

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerPointList_array, 0);
  objc_storeStrong((id *)&self->_wallLists_array, 0);

  objc_storeStrong((id *)&self->_pointLists_array, 0);
}

- (id)getRSOuterPointList
{
  return self->_outerPointList_array;
}

- (id)getRSWallLists
{
  return self->_wallLists_array;
}

- (id)getRSPointLists
{
  return self->_pointLists_array;
}

- (void)generateRSPointListsWithWalls:(id)a3
{
  uint64_t v399 = *MEMORY[0x263EF8340];
  id v344 = a3;
  objc_msgSend_removeAllObjects(self->_pointLists_array, v4, v5);
  objc_msgSend_removeAllObjects(self->_wallLists_array, v6, v7);
  objc_msgSend_removeAllObjects(self->_outerPointList_array, v8, v9);
  v379 = 0;
  v380 = 0;
  unint64_t v381 = 0;
  v376 = 0;
  v377 = 0;
  unint64_t v378 = 0;
  id v350 = v344;
  unint64_t v12 = 0;
  long long v389 = 0uLL;
  v390 = 0;
  long long v387 = 0uLL;
  v388 = 0;
  *(_OWORD *)v391 = 0u;
  long long v392 = 0u;
  LODWORD(v393) = 1065353216;
  while (objc_msgSend_count(v350, v10, v11) > v12)
  {
    sub_25B3FAF64((uint64_t)v391, v12, v12);
    ++v12;
  }
  v349 = self;
  while (*((void *)&v392 + 1))
  {
    v384 = &v384;
    v385 = (void **)&v384;
    uint64_t v386 = 0;
    v382.i64[0] = (uint64_t)&v382;
    v382.i64[1] = (uint64_t)&v382;
    uint64_t v383 = 0;
    int v13 = *(_DWORD *)(v392 + 16);
    sub_25B473798(v391, v13);
    v14 = operator new(0x18uLL);
    v14[4] = v13;
    v15 = v384;
    *(void *)v14 = v384;
    *((void *)v14 + 1) = &v384;
    v15[1] = v14;
    v384 = v14;
    ++v386;
    v17 = objc_msgSend_objectAtIndexedSubscript_(v350, v16, v13);
    objc_msgSend_quad(v17, v18, v19);
    long long v364 = v20;
    v21 = operator new(0x20uLL);
    v21[1] = v364;
    uint64_t v22 = v382.i64[0];
    *(void *)v21 = v382.i64[0];
    *((void *)v21 + 1) = &v382;
    *(void *)(v22 + 8) = v21;
    v382.i64[0] = (uint64_t)v21;
    ++v383;
    objc_msgSend_quad(v17, v23, v24);
    long long v365 = v25;
    v26 = operator new(0x20uLL);
    v26[1] = v365;
    uint64_t v27 = v382.i64[0];
    *(void *)v26 = v382.i64[0];
    *((void *)v26 + 1) = &v382;
    *(void *)(v27 + 8) = v26;
    v382.i64[0] = (uint64_t)v26;
    ++v383;
    objc_msgSend_quad(v17, v28, v29);
    float32x2_t v366 = v30;
    objc_msgSend_quad(v17, v31, v32);
    float obj_4a = v33;
    objc_msgSend_quad(v17, v34, v35);
    float32x2_t __p = v36;
    objc_msgSend_quad(v17, v37, v38);
    double v39 = COERCE_DOUBLE(__PAIR64__(LODWORD(obj_4a), v366.u32[0]));
    float v40 = obj_4a;
    float obj_4 = v41;
    float v42 = v41;
    LODWORD(v43) = vsub_f32(v366, __p).u32[0];
    *((float *)&v43 + 1) = v40 - v41;
    if ((sub_25B4737E4(&v382, &v384, 1u, v391, v350, v39, v43) & 1) == 0)
    {
      LODWORD(v44) = vsub_f32(__p, v366).u32[0];
      *((float *)&v44 + 1) = v42 - v40;
      sub_25B4737E4(&v382, &v384, 0, v391, v350, COERCE_DOUBLE(__PAIR64__(LODWORD(obj_4), __p.u32[0])), v44);
    }
    uint64_t v45 = *((void *)&v389 + 1);
    if (*((void *)&v389 + 1) >= (unint64_t)v390)
    {
      unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v389 + 1) - v389) >> 3);
      unint64_t v48 = v47 + 1;
      if (v47 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_25B3FBC4C();
      }
      if (0x5555555555555556 * (((uint64_t)v390 - (uint64_t)v389) >> 3) > v48) {
        unint64_t v48 = 0x5555555555555556 * (((uint64_t)v390 - (uint64_t)v389) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v390 - (uint64_t)v389) >> 3) >= 0x555555555555555) {
        unint64_t v49 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v49 = v48;
      }
      v398.i64[0] = (uint64_t)&v390;
      if (v49)
      {
        if (v49 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_372;
        }
        v50 = (char *)operator new(24 * v49);
      }
      else
      {
        v50 = 0;
      }
      v397[0] = v50;
      v397[1] = &v50[24 * v47];
      v397[2] = v397[1];
      v397[3] = &v50[24 * v49];
      sub_25B474108((void *)v397[1], (uint64_t)&v384);
      v51 = (uint64_t *)v397[1];
      v46 = (char *)v397[2] + 24;
      v397[2] = (char *)v397[2] + 24;
      uint64_t v52 = *((void *)&v389 + 1);
      uint64_t v53 = v389;
      if (*((void *)&v389 + 1) == (void)v389)
      {
        int64x2_t v60 = vdupq_n_s64(*((unint64_t *)&v389 + 1));
      }
      else
      {
        v54 = (uint64_t *)((char *)v397[1] - 24);
        do
        {
          v51 = v54;
          uint64_t *v54 = (uint64_t)v54;
          v54[1] = (uint64_t)v54;
          v54[2] = 0;
          uint64_t v55 = *(void *)(v52 - 8);
          if (v55)
          {
            uint64_t v57 = *(void *)(v52 - 24);
            v56 = *(uint64_t **)(v52 - 16);
            uint64_t v58 = *v56;
            *(void *)(v58 + 8) = *(void *)(v57 + 8);
            **(void **)(v57 + 8) = v58;
            uint64_t v59 = *v51;
            *(void *)(v59 + 8) = v56;
            uint64_t *v56 = v59;
            uint64_t *v51 = v57;
            *(void *)(v57 + 8) = v51;
            v51[2] = v55;
            *(void *)(v52 - 8) = 0;
          }
          v52 -= 24;
          v54 = v51 - 3;
        }
        while (v52 != v53);
        int64x2_t v60 = (int64x2_t)v389;
        v46 = (char *)v397[2];
      }
      *(void *)&long long v389 = v51;
      *((void *)&v389 + 1) = v46;
      *(int64x2_t *)&v397[1] = v60;
      v61 = v390;
      v390 = v397[3];
      v397[3] = v61;
      v397[0] = (void *)v60.i64[0];
      sub_25B474328((uint64_t)v397);
    }
    else
    {
      sub_25B474108(*((void **)&v389 + 1), (uint64_t)&v384);
      v46 = (char *)(v45 + 24);
    }
    *((void *)&v389 + 1) = v46;
    uint64_t v62 = *((void *)&v387 + 1);
    if (*((void *)&v387 + 1) >= (unint64_t)v388)
    {
      unint64_t v64 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v387 + 1) - v387) >> 3);
      unint64_t v65 = v64 + 1;
      if (v64 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_25B3FBC4C();
      }
      if (0x5555555555555556 * (((uint64_t)v388 - (uint64_t)v387) >> 3) > v65) {
        unint64_t v65 = 0x5555555555555556 * (((uint64_t)v388 - (uint64_t)v387) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v388 - (uint64_t)v387) >> 3) >= 0x555555555555555) {
        unint64_t v66 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v66 = v65;
      }
      v398.i64[0] = (uint64_t)&v388;
      if (v66)
      {
        if (v66 > 0xAAAAAAAAAAAAAAALL) {
LABEL_372:
        }
          sub_25B3FA70C();
        v67 = (char *)operator new(24 * v66);
      }
      else
      {
        v67 = 0;
      }
      v397[0] = v67;
      v397[1] = &v67[24 * v64];
      v397[2] = v397[1];
      v397[3] = &v67[24 * v66];
      sub_25B4741A4((void *)v397[1], (uint64_t)&v382);
      v68 = (uint64_t *)v397[1];
      v63 = (char *)v397[2] + 24;
      v397[2] = (char *)v397[2] + 24;
      uint64_t v69 = *((void *)&v387 + 1);
      uint64_t v70 = v387;
      if (*((void *)&v387 + 1) == (void)v387)
      {
        int64x2_t v77 = vdupq_n_s64(*((unint64_t *)&v387 + 1));
      }
      else
      {
        v71 = (uint64_t *)((char *)v397[1] - 24);
        do
        {
          v68 = v71;
          uint64_t *v71 = (uint64_t)v71;
          v71[1] = (uint64_t)v71;
          v71[2] = 0;
          uint64_t v72 = *(void *)(v69 - 8);
          if (v72)
          {
            uint64_t v74 = *(void *)(v69 - 24);
            v73 = *(uint64_t **)(v69 - 16);
            uint64_t v75 = *v73;
            *(void *)(v75 + 8) = *(void *)(v74 + 8);
            **(void **)(v74 + 8) = v75;
            uint64_t v76 = *v68;
            *(void *)(v76 + 8) = v73;
            uint64_t *v73 = v76;
            uint64_t *v68 = v74;
            *(void *)(v74 + 8) = v68;
            v68[2] = v72;
            *(void *)(v69 - 8) = 0;
          }
          v69 -= 24;
          v71 = v68 - 3;
        }
        while (v69 != v70);
        int64x2_t v77 = (int64x2_t)v387;
        v63 = (char *)v397[2];
      }
      *(void *)&long long v387 = v68;
      *((void *)&v387 + 1) = v63;
      *(int64x2_t *)&v397[1] = v77;
      v78 = v388;
      v388 = v397[3];
      v397[3] = v78;
      v397[0] = (void *)v77.i64[0];
      sub_25B474328((uint64_t)v397);
    }
    else
    {
      sub_25B4741A4(*((void **)&v387 + 1), (uint64_t)&v382);
      v63 = (char *)(v62 + 24);
    }
    *((void *)&v387 + 1) = v63;

    sub_25B474240(&v382);
    sub_25B474240(&v384);
  }
  uint64_t v79 = *((void *)&v389 + 1);
  for (uint64_t i = v389; i != v79; i += 24)
  {
    sub_25B474108(&v384, i);
    v81 = v385;
    if (v385 == (void **)&v384)
    {
      v88 = 0;
      long long v86 = 0uLL;
    }
    else
    {
      unint64_t v82 = -1;
      v83 = v385;
      do
      {
        unint64_t v84 = v82;
        v83 = (void **)v83[1];
        ++v82;
      }
      while (v83 != (void **)&v384);
      if (v82 >= 0x3FFFFFFFFFFFFFFFLL) {
        sub_25B3FBC4C();
      }
      v85 = sub_25B3FBC64(v84 + 2);
      *(void *)&long long v86 = v85;
      v88 = &v85[v87];
      do
      {
        *v85++ = *((_DWORD *)v81 + 4);
        v81 = (void **)v81[1];
      }
      while (v81 != (void **)&v384);
      *((void *)&v86 + 1) = v85;
    }
    v89 = v380;
    if ((unint64_t)v380 >= v381)
    {
      long long v367 = v86;
      unint64_t v91 = 0xAAAAAAAAAAAAAAABLL * ((v380 - v379) >> 3);
      unint64_t v92 = v91 + 1;
      if (v91 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_25B3FBC4C();
      }
      if (0x5555555555555556 * ((uint64_t)(v381 - (void)v379) >> 3) > v92) {
        unint64_t v92 = 0x5555555555555556 * ((uint64_t)(v381 - (void)v379) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v381 - (void)v379) >> 3) >= 0x555555555555555) {
        unint64_t v93 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v93 = v92;
      }
      v398.i64[0] = (uint64_t)&v381;
      v94 = (char *)sub_25B413D74(v93);
      v95 = &v94[24 * v91];
      v397[0] = v94;
      v397[1] = v95;
      v397[3] = &v94[24 * v96];
      *(_OWORD *)v95 = v367;
      *((void *)v95 + 2) = v88;
      v397[2] = v95 + 24;
      sub_25B43EA54(&v379, v397);
      v90 = v380;
      sub_25B43EAC4((uint64_t)v397);
    }
    else
    {
      *(_OWORD *)v380 = v86;
      *((void *)v89 + 2) = v88;
      v90 = (char *)v89 + 24;
    }
    v380 = v90;
    sub_25B474240(&v384);
  }
  uint64_t v97 = *((void *)&v387 + 1);
  for (uint64_t j = v387; j != v97; j += 24)
  {
    sub_25B4741A4(&v384, j);
    v99 = v385;
    if (v385 == (void **)&v384)
    {
      v106 = 0;
      long long v104 = 0uLL;
    }
    else
    {
      unint64_t v100 = -1;
      v101 = v385;
      do
      {
        unint64_t v102 = v100;
        v101 = (void **)v101[1];
        ++v100;
      }
      while (v101 != (void **)&v384);
      if (v100 >= 0xFFFFFFFFFFFFFFFLL) {
        sub_25B3FBC4C();
      }
      v103 = sub_25B3FFAEC(v102 + 2);
      *(void *)&long long v104 = v103;
      v106 = &v103[v105];
      do
      {
        *v103++ = *((_OWORD *)v99 + 1);
        v99 = (void **)v99[1];
      }
      while (v99 != (void **)&v384);
      *((void *)&v104 + 1) = v103;
    }
    v107 = v377;
    if ((unint64_t)v377 >= v378)
    {
      long long v368 = v104;
      unint64_t v109 = 0xAAAAAAAAAAAAAAABLL * ((v377 - v376) >> 3);
      unint64_t v110 = v109 + 1;
      if (v109 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_25B3FBC4C();
      }
      if (0x5555555555555556 * ((uint64_t)(v378 - (void)v376) >> 3) > v110) {
        unint64_t v110 = 0x5555555555555556 * ((uint64_t)(v378 - (void)v376) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v378 - (void)v376) >> 3) >= 0x555555555555555) {
        unint64_t v111 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v111 = v110;
      }
      v398.i64[0] = (uint64_t)&v378;
      v112 = (char *)sub_25B413D74(v111);
      v113 = &v112[24 * v109];
      v397[0] = v112;
      v397[1] = v113;
      v397[3] = &v112[24 * v114];
      *(_OWORD *)v113 = v368;
      *((void *)v113 + 2) = v106;
      v397[2] = v113 + 24;
      sub_25B43EA54(&v376, v397);
      v108 = v377;
      sub_25B43EAC4((uint64_t)v397);
    }
    else
    {
      *(_OWORD *)v377 = v104;
      *((void *)v107 + 2) = v106;
      v108 = (char *)v107 + 24;
    }
    v377 = v108;
    sub_25B474240(&v384);
  }
  sub_25B3FB178((uint64_t)v391);
  v397[0] = &v387;
  sub_25B4742A4((void ***)v397);
  v397[0] = &v389;
  sub_25B4742A4((void ***)v397);

  v116 = v376;
  v115 = v377;
  if (!v349)
  {
LABEL_119:
    if (v116 != (_OWORD *)v115)
    {
      obuint64_t j = v115;
      do
      {
        memset(v397, 0, 24);
        sub_25B40EE6C(v397, *(const void **)v116, *((void *)v116 + 1), (uint64_t)(*((void *)v116 + 1) - *(void *)v116) >> 4);
        id v144 = objc_alloc_init(MEMORY[0x263EFF980]);
        v145 = (long long *)v397[1];
        v146 = (long long *)v397[0];
        for (__pa = v397[0]; v146 != v145; ++v146)
        {
          long long v369 = *v146;
          v147 = objc_msgSend_numberWithFloat_(NSNumber, v142, v143);
          v396[0] = v147;
          HIDWORD(v148) = DWORD1(v369);
          LODWORD(v148) = DWORD1(v369);
          v151 = objc_msgSend_numberWithFloat_(NSNumber, v149, v150, v148);
          v396[1] = v151;
          v154 = objc_msgSend_numberWithFloat_(NSNumber, v152, v153, COERCE_DOUBLE(__PAIR64__(DWORD1(v369), DWORD2(v369))));
          v396[2] = v154;
          v156 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v155, (uint64_t)v396, 3);
          objc_msgSend_addObject_(v144, v157, (uint64_t)v156);
        }
        objc_msgSend_addObject_(v349->_pointLists_array, v142, (uint64_t)v144);

        if (__pa) {
          operator delete(__pa);
        }
        v116 = (_OWORD *)((char *)v116 + 24);
      }
      while (v116 != (_OWORD *)obj);
    }
    v158 = v379;
    v159 = v380;
    if (v379 == v380)
    {
      v160 = v350;
      id v161 = v350;
      if (!v349)
      {

        goto LABEL_367;
      }
      goto LABEL_136;
    }
    goto LABEL_130;
  }
  if (v377 != v376)
  {
    unint64_t v117 = 0;
    do
    {
      v118 = (float32x4_t *)*((void *)v116 + 3 * v117);
      v119 = (float32x4_t *)*((void *)v116 + 3 * v117 + 1);
      if ((unint64_t)((char *)v119 - (char *)v118) >= 0x30)
      {
        int v120 = 0;
        unint64_t v121 = v119 - v118;
        float32x4_t v122 = *v118;
        if (v121 <= 2) {
          uint64_t v123 = 2;
        }
        else {
          uint64_t v123 = v119 - v118;
        }
        uint64_t v124 = 1;
        do
        {
          float32x4_t v125 = v118[v124];
          if ((vmovn_s32(vcgtq_f32(v122, v125)).u8[0] & 1) != 0
            || (vmovn_s32(vceqq_f32(v125, v122)).u8[0] & 1) != 0 && (vmovn_s32(vcgtq_f32(v125, v122)).i8[2] & 1) != 0)
          {
            float32x4_t v122 = v118[v124];
            int v120 = v124;
          }
          ++v124;
        }
        while (v123 != v124);
        unint64_t v126 = v121 - 1;
        unint64_t v127 = v120 - 1;
        if (!v120) {
          unint64_t v127 = v126;
        }
        if (v126 == v120) {
          uint64_t v128 = 0;
        }
        else {
          uint64_t v128 = v120 + 1;
        }
        unint64_t v129 = vsubq_f32(v122, v118[v127]).u64[0];
        unint64_t v130 = vsubq_f32(v118[v128], v122).u64[0];
        if (vmlas_n_f32((float)-*((float *)&v129 + 1) * *(float *)&v130, *((float *)&v130 + 1), *(float *)&v129) > 0.0)
        {
          if (v118 != v119)
          {
            v131 = v119 - 1;
            if (v131 > v118)
            {
              v132 = v118 + 1;
              do
              {
                float32x4_t v133 = v132[-1];
                v132[-1] = *v131;
                *v131-- = v133;
                BOOL v134 = v132++ >= v131;
              }
              while (!v134);
            }
          }
          v135 = (unint64_t *)&v379[24 * v117];
          unint64_t v136 = *v135;
          unint64_t v137 = v135[1];
          v138 = (_DWORD *)(v137 - 4);
          if (v136 != v137 && (unint64_t)v138 > v136)
          {
            unint64_t v140 = v136 + 4;
            do
            {
              int v141 = *(_DWORD *)(v140 - 4);
              *(_DWORD *)(v140 - 4) = *v138;
              *v138-- = v141;
              BOOL v134 = v140 >= (unint64_t)v138;
              v140 += 4;
            }
            while (!v134);
          }
        }
      }
      ++v117;
      v116 = v376;
      v115 = v377;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v377 - v376) >> 3) > v117);
    goto LABEL_119;
  }
  v158 = v379;
  v159 = v380;
  if (v379 != v380)
  {
    do
    {
LABEL_130:
      memset(v397, 0, 24);
      sub_25B3FC724(v397, *(const void **)v158, *((void *)v158 + 1), (uint64_t)(*((void *)v158 + 1) - *(void *)v158) >> 2);
      id v163 = objc_alloc_init(MEMORY[0x263EFF980]);
      v164 = v397[0];
      v165 = (unsigned int *)v397[1];
      for (k = (unsigned int *)v397[0]; k != v165; ++k)
      {
        v167 = objc_msgSend_numberWithInt_(NSNumber, v162, *k);
        objc_msgSend_addObject_(v163, v168, (uint64_t)v167);
      }
      objc_msgSend_addObject_(v349->_wallLists_array, v162, (uint64_t)v163);

      if (v164) {
        operator delete(v164);
      }
      v158 = (_OWORD *)((char *)v158 + 24);
    }
    while (v158 != (_OWORD *)v159);
  }
  v160 = v350;
  id v169 = v350;
LABEL_136:
  id v170 = v160;
  *(_OWORD *)v391 = 0u;
  long long v392 = 0u;
  long long v393 = 0u;
  long long v394 = 0u;
  id obja = v170;
  uint64_t v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v171, (uint64_t)v391, v397, 16);
  if (v174)
  {
    v175 = 0;
    unint64_t v176 = 0;
    v177 = 0;
    uint64_t v178 = *(void *)v392;
    do
    {
      for (uint64_t m = 0; m != v174; ++m)
      {
        if (*(void *)v392 != v178) {
          objc_enumerationMutation(obja);
        }
        v180 = (void *)*((void *)v391[1] + m);
        objc_msgSend_quad(v180, v172, v173);
        uint64_t v370 = v183;
        if ((unint64_t)v175 >= v176)
        {
          uint64_t v185 = v175 - v177;
          unint64_t v186 = v185 + 1;
          if ((unint64_t)(v185 + 1) >> 61) {
            sub_25B3FBC4C();
          }
          if ((uint64_t)(v176 - (void)v177) >> 2 > v186) {
            unint64_t v186 = (uint64_t)(v176 - (void)v177) >> 2;
          }
          if (v176 - (unint64_t)v177 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v187 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v187 = v186;
          }
          if (v187) {
            unint64_t v187 = (unint64_t)sub_25B3FCAD4(v187);
          }
          else {
            v181 = 0;
          }
          v188 = (uint64_t *)(v187 + 8 * v185);
          uint64_t *v188 = v370;
          v184 = v188 + 1;
          if (v175 != v177)
          {
            do
            {
              uint64_t v189 = *--v175;
              *--v188 = v189;
            }
            while (v175 != v177);
            v175 = v177;
          }
          v177 = v188;
          unint64_t v176 = v187 + 8 * (void)v181;
          if (v175) {
            operator delete(v175);
          }
        }
        else
        {
          uint64_t *v175 = v183;
          v184 = v175 + 1;
        }
        objc_msgSend_quad(v180, v181, v182);
        uint64_t v371 = v190;
        if ((unint64_t)v184 >= v176)
        {
          uint64_t v191 = v184 - v177;
          unint64_t v192 = v191 + 1;
          if ((unint64_t)(v191 + 1) >> 61) {
            sub_25B3FBC4C();
          }
          if ((uint64_t)(v176 - (void)v177) >> 2 > v192) {
            unint64_t v192 = (uint64_t)(v176 - (void)v177) >> 2;
          }
          if (v176 - (unint64_t)v177 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v193 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v193 = v192;
          }
          if (v193) {
            unint64_t v193 = (unint64_t)sub_25B3FCAD4(v193);
          }
          else {
            v172 = 0;
          }
          v194 = (uint64_t *)(v193 + 8 * v191);
          uint64_t *v194 = v371;
          v175 = v194 + 1;
          while (v184 != v177)
          {
            uint64_t v195 = *--v184;
            *--v194 = v195;
          }
          unint64_t v176 = v193 + 8 * (void)v172;
          if (v177) {
            operator delete(v177);
          }
          v177 = v194;
        }
        else
        {
          void *v184 = v190;
          v175 = v184 + 1;
        }
      }
      uint64_t v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v172, (uint64_t)v391, v397, 16);
    }
    while (v174);

    float32x4_t v197 = (float32x4_t)xmmword_25B5F1350;
    if (v177 != v175)
    {
      v198 = v177;
      do
      {
        uint64_t v199 = *v198++;
        v196.i64[0] = v199;
        float32x4_t v196 = (float32x4_t)vzip1q_s32((int32x4_t)v196, (int32x4_t)v196);
        float32x4_t v197 = (float32x4_t)vbslq_s8((int8x16_t)vmovl_s16(vtrn2_s16(vrev32_s16(vmovn_s32(vcgtq_f32(v197, v196))), vmovn_s32(vcgtq_f32(v196, v197)))), (int8x16_t)v196, (int8x16_t)v197);
      }
      while (v198 != v175);
    }
    int32x4_t v348 = (int32x4_t)v197;
    if (v177) {
      operator delete(v177);
    }
  }
  else
  {

    int32x4_t v348 = (int32x4_t)xmmword_25B5F1350;
  }

  id v200 = obja;
  if (!objc_msgSend_count(v200, v201, v202))
  {

    v208 = 0;
    v303 = 0;
    uint64_t v241 = 0;
    int64x2_t v398 = 0u;
    memset(v397, 0, sizeof(v397));
    goto LABEL_358;
  }
  unint64_t v205 = objc_msgSend_count(v200, v203, v204);
  LOBYTE(v397[0]) = 0;
  sub_25B443750(v391, v205, (unsigned __int8 *)v397);
  v208 = 0;
  v209 = 0;
  v345 = 0;
  unint64_t v210 = 0;
  int8x16_t v346 = vextq_s8((int8x16_t)v348, (int8x16_t)v348, 8uLL);
  __int32 v347 = vdup_laneq_s32(v348, 2).i32[1];
  while (objc_msgSend_count(v200, v206, v207) > v210)
  {
    v212 = objc_msgSend_objectAtIndexedSubscript_(v200, v211, v210);
    __pb = (void *)sub_25B5BEF80(v212).n128_u64[0];
    v372 = v213;

    BOOL v214 = 0;
    for (unsigned int n = 0; n != 4; ++n)
    {
      v216 = (void *)__PAIR64__(HIDWORD(v372), v348.u32[0]);
      v217 = (void *)__PAIR64__(HIDWORD(__pb), v348.u32[0]);
      switch(n)
      {
        case 0u:
          goto LABEL_192;
        case 1u:
          v216 = (void *)__PAIR64__(HIDWORD(v372), v348.u32[1]);
          unint64_t v218 = __PAIR64__(HIDWORD(__pb), v348.u32[1]);
          goto LABEL_191;
        case 2u:
          v216 = (void *)__PAIR64__(v347, v372);
          unint64_t v218 = __PAIR64__(v347, __pb);
          goto LABEL_191;
        case 3u:
          v216 = (void *)__PAIR64__(v346.u32[1], v372);
          unint64_t v218 = __PAIR64__(v346.u32[1], __pb);
          goto LABEL_191;
        default:
          puts("Error: in getQuad2DWithBoundingBox, index needs to be [0,3]!");
          v216 = (void *)__PAIR64__(HIDWORD(v372), v348.u32[0]);
          unint64_t v218 = __PAIR64__(HIDWORD(__pb), v348.u32[0]);
LABEL_191:
          v217 = (void *)v218;
LABEL_192:
          unint64_t v219 = 0;
          break;
      }
      while (objc_msgSend_count(v200, v206, v207) > v219)
      {
        if (v210 != v219 && ((*(void *)((char *)v391[0] + ((v219 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v219) & 1) == 0)
        {
          v220 = objc_msgSend_objectAtIndexedSubscript_(v200, v206, v219);
          *(void *)&double v221 = sub_25B5BEF80(v220).n128_u64[0];
          double v223 = v222;

          uint64_t v224 = 0;
          v397[0] = __pb;
          v397[1] = v372;
          v397[2] = v216;
          v397[3] = v217;
          while (v224 != 4)
          {
            v225 = &v397[v224 + 1];
            v226 = v397[v224];
            if (v224 == 3) {
              v225 = v397;
            }
            ++v224;
            if (sub_25B5BEFDC(0, v221, v223, *(double *)&v226, *(double *)v225)) {
              goto LABEL_205;
            }
          }
          if ((sub_25B5BF144(*(double *)&__pb, *(double *)&v372, *(double *)&v216, *(double *)&v217, v221) & 1) != 0
            && (sub_25B5BF144(*(double *)&__pb, *(double *)&v372, *(double *)&v216, *(double *)&v217, v223) & 1) != 0)
          {
            break;
          }
        }
        ++v219;
      }
LABEL_205:
      if (objc_msgSend_count(v200, v206, v207) == v219) {
        break;
      }
      BOOL v214 = n > 2;
    }
    unint64_t v227 = v210 >> 6;
    uint64_t v228 = 1 << v210;
    if (v214)
    {
      *((void *)v391[0] + v227) |= v228;
    }
    else
    {
      *((void *)v391[0] + v227) &= ~v228;
      v229 = objc_msgSend_objectAtIndexedSubscript_(v200, v206, v210);
      objc_msgSend_quad(v229, v230, v231);
      __int32 v355 = v232;

      if (v209 >= (float32x2_t *)v345)
      {
        uint64_t v233 = ((char *)v209 - (char *)v208) >> 5;
        unint64_t v234 = v233 + 1;
        if ((unint64_t)(v233 + 1) >> 59) {
          sub_25B3FBC4C();
        }
        if ((v345 - (char *)v208) >> 4 > v234) {
          unint64_t v234 = (v345 - (char *)v208) >> 4;
        }
        if ((unint64_t)(v345 - (char *)v208) >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v235 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v235 = v234;
        }
        if (v235)
        {
          if (v235 >> 59) {
            sub_25B3FA70C();
          }
          v236 = (char *)operator new(32 * v235);
        }
        else
        {
          v236 = 0;
        }
        v237 = &v236[32 * v233];
        *(void *)v237 = __pb;
        *((void *)v237 + 1) = v372;
        *((_DWORD *)v237 + 4) = v355;
        *((_DWORD *)v237 + 5) = v210;
        v237[24] = 0;
        if (v209 == v208)
        {
          v240 = (float32x2_t *)&v236[32 * v233];
        }
        else
        {
          v238 = &v236[32 * v233];
          do
          {
            long long v239 = *(_OWORD *)v209[-2].f32;
            v240 = (float32x2_t *)(v238 - 32);
            *((_OWORD *)v238 - 2) = *(_OWORD *)v209[-4].f32;
            *((_OWORD *)v238 - 1) = v239;
            v209 -= 4;
            v238 -= 32;
          }
          while (v209 != v208);
        }
        v345 = &v236[32 * v235];
        v209 = (float32x2_t *)(v237 + 32);
        if (v208) {
          operator delete(v208);
        }
        v208 = v240;
      }
      else
      {
        float32x2_t *v209 = (float32x2_t)__pb;
        v209[1] = (float32x2_t)v372;
        v209[2].i32[0] = v355;
        v209[2].i32[1] = v210;
        v209[3].i8[0] = 0;
        v209 += 4;
      }
    }
    ++v210;
  }
  if (v391[0]) {
    operator delete(v391[0]);
  }

  int64x2_t v398 = 0u;
  memset(v397, 0, sizeof(v397));
  uint64_t v241 = (char *)v209 - (char *)v208;
  if (!v241)
  {
    v303 = 0;
    goto LABEL_358;
  }
  int64x2_t v242 = (int64x2_t)sub_25B473368(v397, (uint64_t)v208);
  v208[3].i8[0] = 1;
  unint64_t v243 = v398.u64[1];
  if (v398.i64[1] >= (unint64_t)(v241 >> 5)) {
    goto LABEL_304;
  }
  unint64_t v244 = v241 >> 5;
  float32x2_t v246 = *v208;
  float32x2_t v245 = v208[1];
  if (v244 <= 1) {
    uint64_t v247 = 1;
  }
  else {
    uint64_t v247 = v244;
  }
  unint64_t v351 = v244;
  do
  {
    uint64_t v248 = 0;
    int v249 = 0;
    char v250 = 1;
    float v251 = 3.4028e38;
    char v252 = 1;
    do
    {
      while (1)
      {
        uint64_t v253 = v248;
        v254 = &v208[4 * v248];
        if (v254[3].i8[0])
        {
          float v255 = v251;
          break;
        }
        float32x2_t v256 = vsub_f32(v246, *v254);
        float v257 = sqrtf(vaddv_f32(vmul_f32(v256, v256)));
        if (v257 < v251)
        {
          char v252 = 1;
          float v251 = v257;
          char v250 = 1;
          int v249 = v253;
        }
        float32x2_t v258 = v254[1];
        float32x2_t v259 = vsub_f32(v246, v258);
        float v260 = sqrtf(vaddv_f32(vmul_f32(v259, v259)));
        if (v260 < v251)
        {
          char v250 = 0;
          char v252 = 1;
          float v251 = v260;
          int v249 = v253;
        }
        float32x2_t v261 = vsub_f32(v245, *v254);
        float v262 = sqrtf(vaddv_f32(vmul_f32(v261, v261)));
        if (v262 < v251)
        {
          char v252 = 0;
          char v250 = 1;
          float v251 = v262;
          int v249 = v253;
        }
        float v255 = v251;
        float32x2_t v263 = vsub_f32(v245, v258);
        float v251 = sqrtf(vaddv_f32(vmul_f32(v263, v263)));
        if (v251 >= v255) {
          break;
        }
        char v250 = 0;
        char v252 = 0;
        uint64_t v248 = v253 + 1;
        int v249 = v253;
        if (v253 + 1 == v247)
        {
          uint64_t v270 = v253 << 32;
          uint64_t v253 = (int)v253;
          v271 = (float32x2_t *)((char *)v208 + (v270 >> 27));
          v271[3].i8[0] = 1;
          goto LABEL_260;
        }
      }
      uint64_t v248 = v253 + 1;
      float v251 = v255;
    }
    while (v253 + 1 != v247);
    uint64_t v253 = v249;
    v271 = &v208[4 * v249];
    v271[3].i8[0] = 1;
    if ((v252 & 1) == 0)
    {
      if (v250)
      {
LABEL_261:
        uint64_t v274 = (uint64_t)&v208[4 * v253];
        int64x2_t v242 = (int64x2_t)sub_25B473368(v397, v274);
        float32x2_t v245 = *(float32x2_t *)(v274 + 8);
        unint64_t v243 = v398.u64[1];
        continue;
      }
LABEL_260:
      v272 = &v208[4 * v253];
      float32x2_t v273 = *v271;
      float32x2_t *v271 = v272[1];
      v272[1] = v273;
      goto LABEL_261;
    }
    if (v250)
    {
      v264 = &v208[4 * v249];
      float32x2_t v265 = *v271;
      float32x2_t *v271 = v264[1];
      v264[1] = v265;
    }
    unint64_t v266 = v398.i64[0];
    v267 = (char *)v397[1];
    v268 = (char *)v397[2];
    if (!v398.i64[0])
    {
      int64_t v269 = 16 * ((char *)v397[2] - (char *)v397[1]) - 1;
      if (v397[2] == v397[1]) {
        int64_t v269 = 0;
      }
      if ((unint64_t)(v269 - v398.i64[1]) < 0x80)
      {
        if ((void *)((char *)v397[2] - (char *)v397[1]) >= (void *)((char *)v397[3] - (char *)v397[0]))
        {
          if (v397[3] == v397[0]) {
            unint64_t v275 = 1;
          }
          else {
            unint64_t v275 = ((char *)v397[3] - (char *)v397[0]) >> 2;
          }
          *(void *)&long long v393 = &v397[3];
          v391[0] = sub_25B3FCAD4(v275);
          v391[1] = v391[0];
          *(void **)&long long v392 = v391[0];
          *((void *)&v392 + 1) = (char *)v391[0] + 8 * v276;
          *(void *)&long long v389 = operator new(0x1000uLL);
          sub_25B468624(v391, &v389);
          v277 = (uint64_t *)v397[1];
          v278 = (uint64_t *)v397[2];
          v279 = (char *)v392;
          while (v277 != v278)
          {
            if (v279 == *((char **)&v392 + 1))
            {
              v281 = v391[0];
              v280 = (char *)v391[1];
              if (v391[1] <= v391[0])
              {
                if (v279 == v391[0]) {
                  unint64_t v287 = 1;
                }
                else {
                  unint64_t v287 = (v279 - (char *)v391[0]) >> 2;
                }
                v288 = (char *)sub_25B3FCAD4(v287);
                uint64_t v291 = v279 - v280;
                BOOL v290 = v279 == v280;
                v279 = &v288[8 * (v287 >> 2)];
                if (!v290)
                {
                  v279 = &v288[8 * (v287 >> 2) + (v291 & 0xFFFFFFFFFFFFFFF8)];
                  uint64_t v292 = 8 * (v291 >> 3);
                  v293 = &v288[8 * (v287 >> 2)];
                  do
                  {
                    uint64_t v294 = *(void *)v280;
                    v280 += 8;
                    *(void *)v293 = v294;
                    v293 += 8;
                    v292 -= 8;
                  }
                  while (v292);
                }
                v391[0] = v288;
                v391[1] = &v288[8 * (v287 >> 2)];
                *(void *)&long long v392 = v279;
                *((void *)&v392 + 1) = &v288[8 * v289];
                if (v281) {
                  operator delete(v281);
                }
              }
              else
              {
                int64_t v282 = ((char *)v391[1] - (char *)v391[0]) >> 3;
                if (v282 >= -1) {
                  uint64_t v283 = v282 + 1;
                }
                else {
                  uint64_t v283 = v282 + 2;
                }
                v284 = (char *)v391[1] - 8 * (v283 >> 1);
                int64_t v285 = v279 - (char *)v391[1];
                if (v279 != v391[1])
                {
                  memmove((char *)v391[1] - 8 * (v283 >> 1), v391[1], v279 - (char *)v391[1]);
                  v279 = v280;
                }
                v286 = &v279[-8 * (v283 >> 1)];
                v279 = &v284[v285];
                v391[1] = v286;
                *(void *)&long long v392 = &v284[v285];
              }
            }
            uint64_t v295 = *v277++;
            *(void *)v279 = v295;
            v279 = (char *)(v392 + 8);
            *(void *)&long long v392 = v392 + 8;
            v278 = (uint64_t *)v397[2];
          }
          v296 = v397[0];
          v397[0] = v391[0];
          v397[1] = v391[1];
          v397[2] = v279;
          v397[3] = *((void **)&v392 + 1);
          uint64_t v297 = 64;
          if ((char *)(v279 - (char *)v391[1]) != (char *)8) {
            uint64_t v297 = v398.i64[0] + 128;
          }
          v398.i64[0] = v297;
          if (v296) {
            operator delete(v296);
          }
          unint64_t v244 = v351;
        }
        else
        {
          if (v397[1] == v397[0])
          {
            v391[0] = operator new(0x1000uLL);
            sub_25B468624(v397, v391);
            v391[0] = *((void **)v397[2] - 1);
            v397[2] = (char *)v397[2] - 8;
          }
          else
          {
            v391[0] = operator new(0x1000uLL);
          }
          sub_25B46850C((uint64_t)v397, v391);
          uint64_t v298 = 64;
          if ((void *)((char *)v397[2] - (char *)v397[1]) != (void *)8) {
            uint64_t v298 = v398.i64[0] + 128;
          }
          v398.i64[0] = v298;
        }
      }
      else
      {
        v398.i64[0] = 128;
        v391[0] = *((void **)v397[2] - 1);
        v397[2] = (char *)v397[2] - 8;
        sub_25B46850C((uint64_t)v397, v391);
      }
      unint64_t v266 = v398.i64[0];
      v267 = (char *)v397[1];
      v268 = (char *)v397[2];
    }
    v299 = &v267[8 * (v266 >> 7)];
    uint64_t v300 = *(void *)v299 + 32 * (v266 & 0x7F);
    if (v268 == v267) {
      uint64_t v301 = 0;
    }
    else {
      uint64_t v301 = v300;
    }
    if (v301 == *(void *)v299) {
      uint64_t v301 = *((void *)v299 - 1) + 4096;
    }
    long long v302 = *(_OWORD *)v271[2].f32;
    *(_OWORD *)(v301 - 32) = *(_OWORD *)v271->f32;
    *(_OWORD *)(v301 - 16) = v302;
    int64x2_t v242 = vaddq_s64(v398, (int64x2_t)xmmword_25B5F1300);
    int64x2_t v398 = v242;
    float32x2_t v246 = *v271;
    unint64_t v243 = v242.u64[1];
  }
  while (v243 < v244);
LABEL_304:
  v303 = 0;
  uint64_t v241 = 0;
  if (v243)
  {
    v304 = 0;
    float32x2_t v305 = (float32x2_t)vdup_n_s32(0x3727C5ACu);
    do
    {
      uint64_t v306 = *(void *)((char *)v397[1] + (((unint64_t)v398.i64[0] >> 4) & 0xFFFFFFFFFFFFFF8))
           + 32 * (v398.i8[0] & 0x7F);
      v242.i64[0] = *(void *)v306;
      __n128 v352 = (__n128)v242;
      v242.i64[0] = *(void *)(v306 + 8);
      __n128 v373 = (__n128)v242;
      unsigned __int32 __pc = *(_DWORD *)(v306 + 16);
      v398.i64[1] = v243 - 1;
      if (++v398.i64[0] >= 0x100uLL)
      {
        operator delete(*(void **)v397[1]);
        v397[1] = (char *)v397[1] + 8;
        v398.i64[0] -= 128;
      }
      uint64_t v307 = (v241 - (uint64_t)v303) >> 4;
      if ((float32x2_t *)v241 == v303)
      {
        __n128 v311 = v352;
        v311.n128_u32[2] = __pc;
        if (v303 >= v304)
        {
          __n128 v353 = v311;
          if (v304 - v303 <= (unint64_t)(v307 + 1)) {
            uint64_t v312 = v307 + 1;
          }
          else {
            uint64_t v312 = v304 - v303;
          }
          if ((unint64_t)((char *)v304 - (char *)v303) >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v313 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v313 = v312;
          }
          v314 = (char *)sub_25B3FFAEC(v313);
          v315 = &v314[16 * v307];
          v304 = (float32x2_t *)&v314[16 * v316];
          *(__n128 *)v315 = v353;
          v310 = (__n128 *)(v315 + 16);
          if (v303) {
            operator delete(v303);
          }
          v303 = (float32x2_t *)v315;
        }
        else
        {
          *(__n128 *)v303->f32 = v311;
          v310 = (__n128 *)&v303[2];
        }
        goto LABEL_338;
      }
      __n128 v308 = v352;
      int32x2_t v309 = vcgt_f32(v305, vabd_f32((float32x2_t)v352.n128_u64[0], v303[2 * v307 - 2]));
      if ((vand_s8((int8x8_t)v309, (int8x8_t)vdup_lane_s32(v309, 1)).u8[0] & 1) == 0)
      {
        v308.n128_u32[2] = __pc;
        if (v241 >= (unint64_t)v304)
        {
          __n128 v354 = v308;
          unint64_t v317 = v307 + 1;
          if ((unint64_t)(v307 + 1) >> 60) {
            sub_25B3FBC4C();
          }
          if (v304 - v303 > v317) {
            unint64_t v317 = v304 - v303;
          }
          if ((unint64_t)((char *)v304 - (char *)v303) >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v318 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v318 = v317;
          }
          if (v318) {
            unint64_t v318 = (unint64_t)sub_25B3FFAEC(v318);
          }
          else {
            uint64_t v319 = 0;
          }
          v320 = (__n128 *)(v318 + 16 * v307);
          v304 = (float32x2_t *)(v318 + 16 * v319);
          __n128 *v320 = v354;
          v310 = v320 + 1;
          do
          {
            __n128 v321 = *(__n128 *)(v241 - 16);
            v241 -= 16;
            v320[-1] = v321;
            --v320;
          }
          while ((float32x2_t *)v241 != v303);
          if (v303) {
            operator delete(v303);
          }
          v303 = (float32x2_t *)v320;
          goto LABEL_338;
        }
        *(__n128 *)uint64_t v241 = v308;
        v241 += 16;
      }
      v310 = (__n128 *)v241;
LABEL_338:
      int64x2_t v242 = (int64x2_t)v373;
      v242.i32[2] = __pc;
      if (v310 >= (__n128 *)v304)
      {
        __n128 v374 = (__n128)v242;
        uint64_t v322 = ((char *)v310 - (char *)v303) >> 4;
        unint64_t v323 = v322 + 1;
        if ((unint64_t)(v322 + 1) >> 60) {
          sub_25B3FBC4C();
        }
        if (v304 - v303 > v323) {
          unint64_t v323 = v304 - v303;
        }
        if ((unint64_t)((char *)v304 - (char *)v303) >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v324 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v324 = v323;
        }
        if (v324) {
          unint64_t v324 = (unint64_t)sub_25B3FFAEC(v324);
        }
        else {
          uint64_t v325 = 0;
        }
        v326 = (__n128 *)(v324 + 16 * v322);
        v304 = (float32x2_t *)(v324 + 16 * v325);
        __n128 *v326 = v374;
        uint64_t v241 = (uint64_t)&v326[1];
        if (v310 == (__n128 *)v303) {
          goto LABEL_352;
        }
        do
        {
          __n128 v327 = v310[-1];
          --v310;
          v242.i64[1] = v327.n128_i64[1];
          v326[-1] = v327;
          --v326;
        }
        while (v310 != (__n128 *)v303);
        if (v303) {
LABEL_352:
        }
          operator delete(v303);
        v303 = (float32x2_t *)v326;
      }
      else
      {
        __n128 *v310 = (__n128)v242;
        uint64_t v241 = (uint64_t)&v310[1];
      }
      unint64_t v243 = v398.u64[1];
    }
    while (v398.i64[1]);
  }
LABEL_358:
  if ((unint64_t)(v241 - (void)v303) >= 0x11)
  {
    int32x2_t v328 = vcgt_f32((float32x2_t)vdup_n_s32(0x3727C5ACu), vabd_f32(*(float32x2_t *)(v241 - 16), *v303));
    v241 += 16 * vand_s8((int8x8_t)v328, (int8x8_t)vdup_lane_s32(v328, 1)).i32[0];
  }
  sub_25B4732A0((uint64_t)v397);
  if (v208) {
    operator delete(v208);
  }

  if (v303 != (float32x2_t *)v241)
  {
    v331 = v303;
    do
    {
      outerPointList_array = v349->_outerPointList_array;
      long long v375 = *(_OWORD *)v331->f32;
      v333 = objc_msgSend_numberWithFloat_(NSNumber, v329, v330);
      v395[0] = v333;
      HIDWORD(v334) = DWORD1(v375);
      LODWORD(v334) = DWORD1(v375);
      v337 = objc_msgSend_numberWithFloat_(NSNumber, v335, v336, v334);
      v395[1] = v337;
      v340 = objc_msgSend_numberWithFloat_(NSNumber, v338, v339, COERCE_DOUBLE(__PAIR64__(DWORD1(v375), DWORD2(v375))));
      v395[2] = v340;
      v342 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v341, (uint64_t)v395, 3);
      objc_msgSend_addObject_(outerPointList_array, v343, (uint64_t)v342);

      v331 += 2;
    }
    while (v331 != (float32x2_t *)v241);
  }
  if (v303) {
    operator delete(v303);
  }
LABEL_367:
  v397[0] = &v376;
  sub_25B413C78((void ***)v397);
  v397[0] = &v379;
  sub_25B413BE8((void ***)v397);
}

- (RSPointLists)init
{
  v10.receiver = self;
  v10.super_class = (Class)RSPointLists;
  v2 = [(RSPointLists *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pointLists_array = v2->_pointLists_array;
    v2->_pointLists_array = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    wallLists_array = v2->_wallLists_array;
    v2->_wallLists_array = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    outerPointList_array = v2->_outerPointList_array;
    v2->_outerPointList_array = (NSMutableArray *)v7;
  }
  return v2;
}

@end