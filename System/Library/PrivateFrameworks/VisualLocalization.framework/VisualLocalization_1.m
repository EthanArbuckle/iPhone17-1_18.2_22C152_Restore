void vl_dog_free_octave_list(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  signed int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  signed int v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t vars8;

  v1 = a1;
  if (*a1 >= 1)
  {
    v2 = 0;
    do
    {
      v25 = v1[1];
      v26 = v2;
      v4 = v25 + 72 * v2;
      if (*(uint64_t *)v4 >= 1)
      {
        v5 = 0;
        v6 = 0;
        do
        {
          v8 = *(void *)(v4 + 8);
          v9 = *(void *)(v8 + v5);
          if (v9)
          {
            v10 = *(void *)(v9 - 16 * *(void *)(v8 + v5 + 16) - 8);
            v11 = atomic_fetch_add((atomic_uint *volatile)(v10 + 24), 0xFFFFFFFF) - 1;
            if (v11 < 0) {
LABEL_23:
            }
              __assert_rtn("pmem_free", "pmem.c", 302, "count >= 0 && \"Negative count! Something is broken, double free? Memory corruption?\"");
            if (v11)
            {
              atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_or(&global_stats[2], 0);
              atomic_fetch_or(global_stats, 0);
              atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_or(&_pmem_total_blocks, 0);
              atomic_fetch_or(&pmem_bytes_allocated, 0);
            }
            else
            {
              v7 = -*(void *)(v10 + 8);
              atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_add(&global_stats[2], 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_add(global_stats, v7);
              atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_add(&_pmem_total_blocks, 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_add(&pmem_bytes_allocated, v7);
              (*(void (**)(uint64_t))(v10 + 40))(v10);
              free((void *)v10);
            }
          }
          *(void *)(v8 + v5) = 0;
          ++v6;
          v5 += 24;
        }
        while (v6 < *(void *)v4);
      }
      free(*(void **)(v4 + 8));
      v12 = v25 + 72 * v26;
      v14 = *(void *)(v12 + 24);
      v13 = (void *)(v12 + 24);
      if (v14 >= 1)
      {
        v15 = 0;
        v16 = 0;
        v17 = (uint64_t *)(v25 + 72 * v26 + 32);
        do
        {
          v19 = *v17;
          v20 = *(void *)(*v17 + v15);
          if (v20)
          {
            v21 = *(void *)(v20 - 16 * *(void *)(v19 + v15 + 16) - 8);
            v22 = atomic_fetch_add((atomic_uint *volatile)(v21 + 24), 0xFFFFFFFF) - 1;
            if (v22 < 0) {
              goto LABEL_23;
            }
            if (v22)
            {
              atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_or(&global_stats[2], 0);
              atomic_fetch_or(global_stats, 0);
              atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_or(&_pmem_total_blocks, 0);
              atomic_fetch_or(&pmem_bytes_allocated, 0);
            }
            else
            {
              v18 = -*(void *)(v21 + 8);
              atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_add(&global_stats[2], 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_add(global_stats, v18);
              atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_add(&_pmem_total_blocks, 0xFFFFFFFFFFFFFFFFLL);
              atomic_fetch_add(&pmem_bytes_allocated, v18);
              (*(void (**)(uint64_t))(v21 + 40))(v21);
              free((void *)v21);
            }
          }
          *(void *)(v19 + v15) = 0;
          ++v16;
          v15 += 24;
        }
        while (v16 < *v13);
      }
      v3 = v25 + 72 * v26;
      free(*(void **)(v3 + 32));
      free(*(void **)(v3 + 56));
      v2 = v26 + 1;
      v1 = a1;
    }
    while (v26 + 1 < *a1);
  }
  v23 = (void *)v1[1];
  free(v23);
}

uint64_t vl_dog_calculate_keypoints(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *a4 = 0;
  if (a6)
  {
    if (*(_DWORD *)(a6 + 212))
    {
      *(void *)(a6 + 120) -= mach_absolute_time();
    }
    else
    {
      clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a6 + 32));
      clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a6 + 16));
      clock_gettime(_CLOCK_MONOTONIC, (timespec *)a6);
    }
    vl_dog_create_octave_list_pwin(a1, a2, a3);
    vl_timer_stop(a6);
    if (*(_DWORD *)(a6 + 212))
    {
      printf("Verbose : ");
      printf("Total time for %40s : %7.3f ms", (const char *)(a6 + 148), (double)*(uint64_t *)(a6 + 120) * 0.000001);
      putchar(10);
      if (a7) {
        goto LABEL_9;
      }
    }
    else
    {
      log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v12, v13, v14, v15, v16, v17, v18, (char)&str_4_1);
      if (a7) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    vl_dog_create_octave_list_pwin(a1, a2, a3);
    if (a7)
    {
LABEL_9:
      if (*(_DWORD *)(a7 + 212))
      {
        *(void *)(a7 + 120) -= mach_absolute_time();
      }
      else
      {
        clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a7 + 32));
        clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a7 + 16));
        clock_gettime(_CLOCK_MONOTONIC, (timespec *)a7);
      }
      vl_dog_extract_keypoints_pwin();
      vl_timer_stop(a7);
      if (!*(_DWORD *)(a7 + 212)) {
        return log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v20, v21, v22, v23, v24, v25, v26, (char)&str_4_1);
      }
      printf("Verbose : ");
      printf("Total time for %40s : %7.3f ms", (const char *)(a7 + 148), (double)*(uint64_t *)(a7 + 120) * 0.000001);
      return putchar(10);
    }
  }
  return vl_dog_extract_keypoints_pwin();
}

void create_initial_image(uint64_t a1, uint64_t *a2, float a3)
{
  uint64_t v5 = *(unsigned int *)(a1 + 8);
  uint64_t v6 = *(int *)(a1 + 12);
  size_t v7 = 2 * (int)v5;
  unint64_t v250 = pmem_alloc_ex(v7 * (v6 + 16), 0, 0);
  if (v5 != *(_DWORD *)(a1 + 8)) {
    __assert_rtn("create_initial_image", "vl_dog.c", 555, "(&img_input)->x_size == (img)->x_size");
  }
  if (v6 != *(_DWORD *)(a1 + 12)) {
    __assert_rtn("create_initial_image", "vl_dog.c", 555, "(&img_input)->y_size == (img)->y_size");
  }
  uint64_t v262 = v6;
  if ((int)v6 >= 1 && (int)v5 >= 1)
  {
    int v8 = 0;
    v9 = *(int8x8_t **)a1;
    uint64_t v10 = *(void *)(a1 + 16) - (int)v5;
    uint64_t v11 = v5 & 0xFFFFFFE0;
    uint64_t v12 = (int16x8_t *)(v250 + 16 * (int)v5);
    do
    {
      if (v5 >= 0x20)
      {
        int v16 = v5;
        if (v12 >= (int16x8_t *)((char *)v9 + v5) || v9 >= (int8x8_t *)&v12->i16[(v5 - 1) + 1])
        {
          uint64_t v14 = (int8x8_t *)((char *)v9 + v11);
          uint64_t v15 = (int16x8_t *)((char *)v12 + 2 * (v5 & 0xFFFFFFE0));
          uint64_t v17 = v12 + 2;
          uint64_t v18 = v9 + 2;
          uint64_t v19 = v5 & 0xFFFFFFE0;
          do
          {
            _Q0 = *(int16x8_t *)v18[-2].i8;
            _Q1 = *(int16x8_t *)v18->i8;
            int16x8_t v22 = vshll_n_s8(*(int8x8_t *)_Q0.i8, 8uLL);
            __asm { SHLL2           V0.8H, V0.16B, #8 }
            int16x8_t v27 = vshll_n_s8(*v18, 8uLL);
            __asm { SHLL2           V1.8H, V1.16B, #8 }
            v17[-2] = v22;
            v17[-1] = _Q0;
            *uint64_t v17 = v27;
            v17[1] = _Q1;
            v17 += 4;
            v18 += 4;
            v19 -= 32;
          }
          while (v19);
          int v13 = v5 & 0x7FFFFFE0;
          if (v11 == v5) {
            goto LABEL_6;
          }
        }
        else
        {
          int v13 = 0;
          uint64_t v14 = v9;
          uint64_t v15 = v12;
        }
      }
      else
      {
        int v13 = 0;
        uint64_t v14 = v9;
        uint64_t v15 = v12;
        int v16 = v5;
      }
      int v28 = v16 - v13;
      do
      {
        __int16 v29 = v14->u8[0];
        uint64_t v14 = (int8x8_t *)((char *)v14 + 1);
        v15->i16[0] = v29 << 8;
        uint64_t v15 = (int16x8_t *)((char *)v15 + 2);
        --v28;
      }
      while (v28);
LABEL_6:
      v9 = (int8x8_t *)((char *)v14 + v10);
      ++v8;
      uint64_t v12 = v15;
    }
    while (v8 != v6);
  }
  uint64_t v264 = v6;
  unint64_t v251 = v250 + 16 * (int)v5;
  v260 = malloc_type_calloc((int)v5, 2uLL, 0x1000040BDFB0063uLL);
  float v30 = (float)(a3 * 6.0) + 1.0;
  double v31 = v30;
  BOOL v32 = v30 <= 0.0;
  double v33 = -0.5;
  if (!v32) {
    double v33 = 0.5;
  }
  int v34 = (int)(v33 + v31);
  LODWORD(v35) = v34 | 1;
  v36 = (float *)malloc_type_calloc(v34 | 1, 4uLL, 0x100004052888210uLL);
  v39 = (float32x4_t *)v36;
  uint64_t v259 = v34 | 1u;
  if (v34 < 0)
  {
    int v263 = 0;
    int v243 = v34;
    int v52 = v34 >> 1;
    v48 = v260;
    v49 = a2;
    unint64_t v50 = v250 + 16 * (int)v5;
    uint64_t v53 = v34 | 1u;
    uint64_t v51 = v264;
    int v254 = v264 - (v34 >> 1);
    int v257 = v34 >> 1;
    if ((int)v5 < 1) {
      goto LABEL_73;
    }
    goto LABEL_60;
  }
  if ((int)v35 <= 1) {
    uint64_t v35 = 1;
  }
  else {
    uint64_t v35 = v35;
  }
  unint64_t v40 = v34 >> 1;
  int v41 = -(v34 >> 1);
  *(void *)&long long v38 = 0;
  v42 = v36;
  uint64_t v43 = v35;
  float v44 = -0.5 / (float)(a3 * a3);
  do
  {
    long long v267 = v38;
    float v45 = expf((float)(v44 * (float)v41) * (float)v41);
    long long v38 = v267;
    *v42++ = v45;
    *(float *)&long long v38 = *(float *)&v267 + v45;
    ++v41;
    --v43;
  }
  while (v43);
  if (v35 >= 8)
  {
    uint64_t v46 = v35 & 0x7FFFFFF8;
    float32x4_t v54 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v38, 0);
    v55 = v39 + 1;
    uint64_t v56 = v46;
    uint64_t v47 = (int)v5;
    v48 = v260;
    v49 = a2;
    unint64_t v50 = v250 + 16 * (int)v5;
    uint64_t v51 = v264;
    do
    {
      float32x4_t v37 = vdivq_f32(v55[-1], v54);
      float32x4_t v57 = vdivq_f32(*v55, v54);
      v55[-1] = v37;
      float32x4_t *v55 = v57;
      v55 += 2;
      v56 -= 8;
    }
    while (v56);
  }
  else
  {
    uint64_t v46 = 0;
    uint64_t v47 = (int)v5;
    v48 = v260;
    v49 = a2;
    unint64_t v50 = v250 + 16 * (int)v5;
    uint64_t v51 = v264;
  }
  uint64_t v58 = v35 - v46;
  v59 = &v39->f32[v46];
  do
  {
    float *v59 = *v59 / *(float *)&v38;
    ++v59;
    --v58;
  }
  while (v58);
  uint64_t v53 = v34 | 1u;
  int v52 = v34 >> 1;
  if (v34 <= 1)
  {
    int v243 = v34;
    int v263 = 0;
    int v254 = v51 - v40;
    int v257 = v34 >> 1;
    if ((int)v5 < 1) {
      goto LABEL_73;
    }
    goto LABEL_60;
  }
  if ((int)v47 < 1)
  {
    int v263 = 1;
    if ((int)v51 >= 1) {
      goto LABEL_103;
    }
    goto LABEL_163;
  }
  unint64_t v60 = 0;
  uint64_t v61 = *v49;
  uint64_t v62 = v49[2];
  unsigned int v63 = v40 + 1;
  v37.i32[0] = 0.5;
  uint64_t v64 = v34 >> 1;
  do
  {
    uint64_t v65 = v63;
    uint64_t v66 = v60 * v62;
    if (v60 <= v40)
    {
      uint64_t v72 = 0;
      v73 = &v39->i8[4 * v63];
      v74 = (_WORD *)(v250 + 18 * (int)v47);
      do
      {
        float v75 = 0.0;
        uint64_t v76 = v65;
        v77 = (float *)v39;
        do
        {
          float v78 = *v77++;
          HIWORD(v79) = HIWORD(v78);
          float v75 = v75 + v78;
          --v76;
        }
        while (v76);
        LOWORD(v79) = *(_WORD *)(v50 + 2 * v72);
        float v80 = (float)v79;
        float v81 = v75 * v80;
        v82 = v74;
        do
        {
          LOWORD(v80) = *v82;
          float v80 = (float)LODWORD(v80);
          float v81 = v81 + (float)(v80 * *(float *)&v73[4 * v76++]);
          v82 = (_WORD *)((char *)v82 + v7);
        }
        while (v64 != v76);
        if (v81 <= 0.0) {
          *(float *)&long long v38 = -0.5;
        }
        else {
          *(float *)&long long v38 = 0.5;
        }
        *(_WORD *)(v61 + 2 * (v72 + v66)) = (int)(float)(v81 + *(float *)&v38);
        ++v72;
        ++v74;
      }
      while (v72 != v5);
    }
    else
    {
      uint64_t v67 = 0;
      v68 = (_WORD *)(v250 + 18 * (int)v47);
      do
      {
        uint64_t v69 = 0;
        float v70 = 0.0;
        v71 = v68;
        do
        {
          LOWORD(v38) = *v71;
          *(float *)&long long v38 = (float)v38;
          float v70 = v70 + (float)(*(float *)&v38 * v39->f32[v69]);
          v71 = (_WORD *)((char *)v71 + v7);
          ++v69;
        }
        while (v64 != v69);
        if (v70 <= 0.0) {
          *(float *)&long long v38 = -0.5;
        }
        else {
          *(float *)&long long v38 = 0.5;
        }
        *(_WORD *)(v61 + 2 * (v67 + v66)) = (int)(float)(v70 + *(float *)&v38);
        ++v67;
        ++v68;
      }
      while (v67 != v5);
    }
    ++v60;
    ++v64;
    unsigned int v63 = v65 - 1;
  }
  while (v60 != v40);
  int v243 = v34;
  int v263 = 1;
  int v254 = v51 - v40;
  int v257 = v34 >> 1;
  if ((int)v5 >= 1)
  {
LABEL_60:
    if (v254 > v52)
    {
      uint64_t v83 = 0;
      uint64_t v84 = *v49;
      uint64_t v85 = v49[2];
      uint64_t v86 = v52;
      uint64_t v87 = v52;
      do
      {
        if (v87 - v86 > v87 + v86)
        {
          bzero((void *)(v84 + 2 * v85 * (v83 + v86)), 2 * v5);
          uint64_t v51 = v264;
          int v52 = v257;
          uint64_t v53 = v259;
          v48 = v260;
          v49 = a2;
          unint64_t v50 = v250 + 16 * (int)v5;
        }
        else
        {
          uint64_t v88 = 0;
          v89 = (__int16 *)(v250 + (int)v5 * (2 * (int)v83 + 16));
          do
          {
            float v90 = 0.0;
            uint64_t v91 = v53;
            v92 = (float *)v39;
            v93 = v89;
            do
            {
              v37.i16[0] = *v93;
              v37.f32[0] = (float)v37.u32[0];
              float v94 = *v92++;
              float v90 = v90 + (float)(v37.f32[0] * v94);
              v93 = (__int16 *)((char *)v93 + v7);
              --v91;
            }
            while (v91);
            if (v90 <= 0.0) {
              v37.f32[0] = -0.5;
            }
            else {
              v37.f32[0] = 0.5;
            }
            *(_WORD *)(v84 + 2 * (v88 + v87 * v85)) = (int)(float)(v90 + v37.f32[0]);
            ++v88;
            ++v89;
          }
          while (v88 != v5);
        }
        ++v87;
        ++v83;
      }
      while (v262 - (v243 & 0xFFFFFFFE) != v83);
    }
  }
LABEL_73:
  char v95 = v263 ^ 1;
  if ((int)v5 < 1) {
    char v95 = 1;
  }
  if ((v95 & 1) == 0)
  {
    uint64_t v96 = 0;
    uint64_t v97 = (v51 - 1) * (int)v5;
    uint64_t v98 = *v49;
    uint64_t v99 = v49[2];
    uint64_t v100 = (int)v262 - 2;
    uint64_t v101 = v254;
    uint64_t v247 = v254;
    uint64_t v102 = v52;
    uint64_t v103 = v51 - 1 - v52;
    uint64_t v245 = 2 * v99;
    uint64_t v246 = v52;
    uint64_t v104 = v100 + 1;
    unint64_t v105 = v250 + (2 * v100 + 16) * (int)v5;
    int v106 = 1;
    unsigned int v107 = 2;
    uint64_t v252 = v99;
    unint64_t v244 = v105;
    do
    {
      uint64_t v108 = v107;
      ++v106;
      uint64_t v109 = v101 * v99;
      if (v101 - v102 <= v100)
      {
        uint64_t v117 = 0;
        v118 = (__int16 *)v105;
        do
        {
          if (v101 >= v103)
          {
            float v120 = 0.0;
            uint64_t v121 = v108;
            v122 = (float *)v39;
            do
            {
              float v123 = *v122++;
              v37.i16[1] = HIWORD(v123);
              float v120 = v120 + v123;
              --v121;
            }
            while (v121);
            unsigned int v119 = v106;
          }
          else
          {
            unsigned int v119 = 0;
            float v120 = 0.0;
          }
          v37.i16[0] = *(_WORD *)(v50 + 2 * (v117 + v97));
          v37.f32[0] = (float)v37.u32[0];
          float v124 = v120 * v37.f32[0];
          v125 = &v39->f32[v119];
          v126 = v118;
          uint64_t v127 = v104;
          do
          {
            v37.i16[0] = *v126;
            v37.f32[0] = (float)v37.u32[0];
            float v128 = *v125++;
            float v124 = v124 + (float)(v37.f32[0] * v128);
            --v127;
            v126 -= (int)v5;
          }
          while (v127 > v101 - v102);
          if (v124 <= 0.0) {
            v37.f32[0] = -0.5;
          }
          else {
            v37.f32[0] = 0.5;
          }
          *(_WORD *)(v98 + 2 * (v117 + v109)) = (int)(float)(v124 + v37.f32[0]);
          ++v117;
          ++v118;
        }
        while (v117 != v5);
      }
      else if (v101 < v103)
      {
        uint64_t v268 = v96;
        int v255 = v106;
        bzero((void *)(v98 + v245 * (v96 + v247)), 2 * v5);
        int v106 = v255;
        unint64_t v105 = v244;
        uint64_t v102 = v246;
        uint64_t v100 = (int)v262 - 2;
        unint64_t v50 = v250 + 16 * (int)v5;
        uint64_t v99 = v252;
        uint64_t v96 = v268;
        uint64_t v51 = v264;
        int v52 = v257;
        uint64_t v53 = v259;
        v48 = v260;
        v49 = a2;
      }
      else
      {
        uint64_t v110 = 0;
        do
        {
          float v111 = 0.0;
          uint64_t v112 = v108;
          v113 = (float *)v39;
          do
          {
            float v114 = *v113++;
            HIWORD(v115) = HIWORD(v114);
            float v111 = v111 + v114;
            --v112;
          }
          while (v112);
          LOWORD(v115) = *(_WORD *)(v50 + 2 * (v110 + v97));
          float v116 = v111 * (float)v115;
          if (v116 <= 0.0) {
            v37.f32[0] = -0.5;
          }
          else {
            v37.f32[0] = 0.5;
          }
          *(_WORD *)(v98 + 2 * (v110 + v109)) = (int)(float)(v116 + v37.f32[0]);
          ++v110;
        }
        while (v110 != v5);
      }
      ++v101;
      unsigned int v107 = v108 + 1;
      ++v96;
    }
    while (v101 < v51);
  }
  uint64_t v47 = (int)v5;
  int v34 = v243;
  if ((int)v51 >= 1)
  {
LABEL_103:
    uint64_t v265 = 0;
    uint64_t v129 = 0;
    int v249 = v52 + 1;
    int v248 = -v52;
    unsigned int v130 = v34 & 0xFFFFFFFE;
    uint64_t v131 = v52;
    uint64_t v132 = v52;
    int v133 = 1 - v52;
    int v134 = v5 - v52;
    int v135 = v5 - v130;
    uint64_t v136 = (int)v47 - 2;
    uint64_t v137 = v47 - 1 - v52;
    uint64_t v253 = v53 & 0xFFFFFFF0;
    uint64_t v256 = v134;
    uint64_t v266 = v136 + 2 * v52 + 1;
    v269 = v39 + 2;
    int v258 = v52;
    while (1)
    {
      if (v263)
      {
        uint64_t v138 = 0;
        uint64_t v139 = *v49;
        uint64_t v140 = v49[2];
        uint64_t v141 = v140 * v129;
        uint64_t v142 = *v49 + v140 * v265 + 18;
        unsigned int v143 = v249;
        unsigned int v144 = v249;
        int v145 = v248;
        int v146 = v52;
        while (1)
        {
          if (v145 <= 1) {
            int v147 = 1;
          }
          else {
            int v147 = v145;
          }
          float v148 = 0.0;
          if (v52 >= (int)v138)
          {
            uint64_t v149 = v143;
            v150 = (float *)v39;
            do
            {
              float v151 = *v150++;
              v37.i16[1] = HIWORD(v151);
              float v148 = v148 + v151;
              --v149;
            }
            while (v149);
          }
          v37.i16[0] = *(_WORD *)(v139 + 2 * v141);
          float v152 = v148 * (float)v37.u32[0];
          if (v133 > (int)v138) {
            goto LABEL_107;
          }
          unint64_t v153 = v144 - 1;
          uint64_t v154 = (v147 + v146);
          if (v153 < 0x10) {
            break;
          }
          unint64_t v156 = v153 & 0xFFFFFFFFFFFFFFF0;
          v157 = (float32x4_t *)((char *)v269 + 4 * v154);
          unint64_t v155 = v153 & 0xFFFFFFFFFFFFFFF0 | 1;
          v154 += v153 & 0xFFFFFFFFFFFFFFF0;
          v158 = (uint16x8_t *)v142;
          do
          {
            float32x4_t v159 = v157[-2];
            float32x4_t v160 = v157[-1];
            float32x4_t v161 = *v157;
            float32x4_t v162 = v157[1];
            v157 += 4;
            uint16x8_t v163 = v158[-1];
            float32x4_t v164 = vmulq_f32(v160, vcvtq_f32_u32(vmovl_high_u16(v163)));
            float32x4_t v165 = vmulq_f32(v159, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v163.i8)));
            float32x4_t v166 = vmulq_f32(v162, vcvtq_f32_u32(vmovl_high_u16(*v158)));
            float32x4_t v167 = vmulq_f32(v161, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v158->i8)));
            float v152 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v152 + v165.f32[0]) + v165.f32[1]) + v165.f32[2]) + v165.f32[3]) + v164.f32[0])
                                                                                                 + v164.f32[1])
                                                                                         + v164.f32[2])
                                                                                 + v164.f32[3])
                                                                         + v167.f32[0])
                                                                 + v167.f32[1])
                                                         + v167.f32[2])
                                                 + v167.f32[3])
                                         + v166.f32[0])
                                 + v166.f32[1])
                         + v166.f32[2])
                 + v166.f32[3];
            v158 += 2;
            v156 -= 16;
          }
          while (v156);
          if (v153 != (v153 & 0xFFFFFFFFFFFFFFF0)) {
            goto LABEL_123;
          }
LABEL_107:
          if (v152 <= 0.0) {
            v37.f32[0] = -0.5;
          }
          else {
            v37.f32[0] = 0.5;
          }
          v48[v138++] = (int)(float)(v152 + v37.f32[0]);
          --v146;
          --v143;
          ++v145;
          ++v144;
          if (v138 == v132) {
            goto LABEL_126;
          }
        }
        unint64_t v155 = 1;
LABEL_123:
        unint64_t v168 = v144 - v155;
        v169 = (unsigned __int16 *)(v139 + 2 * (v141 + v155));
        v170 = &v39->f32[v154];
        do
        {
          float v171 = *v170++;
          float v172 = v171;
          unsigned int v173 = *v169++;
          float v152 = v152 + (float)(v172 * (float)v173);
          --v168;
        }
        while (v168);
        goto LABEL_107;
      }
LABEL_126:
      if ((int)v256 > v52)
      {
        int v174 = 0;
        uint64_t v175 = v131;
        do
        {
          float v176 = 0.0;
          if (v175 - v131 <= v175 + v131)
          {
            uint64_t v177 = *v49;
            uint64_t v178 = v49[2];
            if (v53 >= 0x10)
            {
              uint64_t v180 = v253 + v174;
              v181 = (uint16x8_t *)(v177 + 2 * (v174 + v129 * v178) + 16);
              uint64_t v182 = v253;
              v183 = v39 + 2;
              do
              {
                float32x4_t v184 = v183[-2];
                float32x4_t v185 = v183[-1];
                float32x4_t v186 = *v183;
                float32x4_t v187 = v183[1];
                v183 += 4;
                uint16x8_t v188 = v181[-1];
                float32x4_t v189 = vmulq_f32(v185, vcvtq_f32_u32(vmovl_high_u16(v188)));
                float32x4_t v190 = vmulq_f32(v184, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v188.i8)));
                float32x4_t v191 = vmulq_f32(v187, vcvtq_f32_u32(vmovl_high_u16(*v181)));
                float32x4_t v192 = vmulq_f32(v186, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v181->i8)));
                float v176 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v176 + v190.f32[0]) + v190.f32[1]) + v190.f32[2]) + v190.f32[3]) + v189.f32[0]) + v189.f32[1])
                                                                                             + v189.f32[2])
                                                                                     + v189.f32[3])
                                                                             + v192.f32[0])
                                                                     + v192.f32[1])
                                                             + v192.f32[2])
                                                     + v192.f32[3])
                                             + v191.f32[0])
                                     + v191.f32[1])
                             + v191.f32[2])
                     + v191.f32[3];
                v181 += 2;
                v182 -= 16;
              }
              while (v182);
              uint64_t v179 = v253;
            }
            else
            {
              uint64_t v179 = 0;
              uint64_t v180 = v174;
            }
            v193 = (unsigned __int16 *)(v177 + 2 * (v180 + v129 * v178));
            v194 = &v39->f32[v179];
            uint64_t v195 = v53 - v179;
            do
            {
              float v196 = *v194++;
              float v197 = v196;
              unsigned int v198 = *v193++;
              float v176 = v176 + (float)(v197 * (float)v198);
              --v195;
            }
            while (v195);
          }
          if (v176 <= 0.0) {
            v37.f32[0] = -0.5;
          }
          else {
            v37.f32[0] = 0.5;
          }
          v48[v175++] = (int)(float)(v176 + v37.f32[0]);
          ++v174;
        }
        while (v174 != v135);
      }
      uint64_t v199 = *v49;
      uint64_t v200 = v49[2];
      uint64_t v201 = v200 * v129;
      if (v263) {
        break;
      }
LABEL_104:
      memcpy((void *)(v199 + 2 * v201), v48, v7);
      v48 = v260;
      v49 = a2;
      ++v129;
      v265 += 2;
      int v52 = v258;
      uint64_t v53 = v259;
      if (v129 == v262) {
        goto LABEL_163;
      }
    }
    uint64_t v202 = 0;
    uint64_t v203 = v266 - v47;
    uint64_t v204 = v201 + v47 - 1;
    uint64_t v205 = v199 + 2 * (v136 + v200 * v129) - 14;
    uint64_t v206 = v199 + v200 * v265;
    int v207 = 1;
    unsigned int v208 = 2;
    uint64_t v209 = v256;
    while (1)
    {
      ++v207;
      if (v209 >= v137)
      {
        float v213 = 0.0;
        uint64_t v214 = v208;
        v215 = (float *)v39;
        do
        {
          float v216 = *v215++;
          HIWORD(v217) = HIWORD(v216);
          float v213 = v213 + v216;
          --v214;
        }
        while (v214);
        unsigned int v210 = v207;
        LOWORD(v217) = *(_WORD *)(v199 + 2 * v204);
        v37.f32[0] = (float)v217;
        float v211 = v213 * v37.f32[0];
        uint64_t v212 = v209 - v131;
        if (v209 - v131 > v136) {
          goto LABEL_143;
        }
      }
      else
      {
        unsigned int v210 = 0;
        v37.i16[0] = *(_WORD *)(v199 + 2 * v204);
        v37.f32[0] = (float)v37.u32[0];
        float v211 = 0.0 * v37.f32[0];
        uint64_t v212 = v209 - v131;
        if (v209 - v131 > v136) {
          goto LABEL_143;
        }
      }
      unint64_t v218 = v266 - (v202 + v47);
      uint64_t v219 = v210;
      if (v218 < 0x10)
      {
        uint64_t v220 = (int)v47 - 2;
        uint64_t v221 = v210;
LABEL_158:
        v238 = &v39->f32[v221];
        do
        {
          v37.i16[0] = *(_WORD *)(v206 + 2 * v220);
          v37.f32[0] = (float)v37.u32[0];
          float v239 = *v238++;
          float v211 = v211 + (float)(v37.f32[0] * v239);
          BOOL v32 = v220-- <= v212;
        }
        while (!v32);
        goto LABEL_143;
      }
      unint64_t v222 = v203 & 0xFFFFFFFFFFFFFFF0;
      uint64_t v220 = v136 - (v218 & 0xFFFFFFFFFFFFFFF0);
      uint64_t v221 = (v218 & 0xFFFFFFFFFFFFFFF0) + v219;
      v223 = (float32x4_t *)((char *)v269 + 4 * v219);
      v224 = (int16x8_t *)v205;
      do
      {
        int8x16_t v225 = (int8x16_t)vrev64q_s16(*v224);
        uint16x8_t v226 = (uint16x8_t)vextq_s8(v225, v225, 8uLL);
        int8x16_t v227 = (int8x16_t)vrev64q_s16(v224[-1]);
        uint16x8_t v228 = (uint16x8_t)vextq_s8(v227, v227, 8uLL);
        float32x4_t v229 = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v226.i8));
        float32x4_t v230 = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v228.i8));
        float32x4_t v231 = v223[-2];
        float32x4_t v232 = v223[-1];
        float32x4_t v233 = *v223;
        float32x4_t v234 = v223[1];
        v223 += 4;
        float32x4_t v37 = vmulq_f32(v232, vcvtq_f32_u32(vmovl_high_u16(v226)));
        float32x4_t v235 = vmulq_f32(v231, v229);
        float32x4_t v236 = vmulq_f32(v234, vcvtq_f32_u32(vmovl_high_u16(v228)));
        float32x4_t v237 = vmulq_f32(v233, v230);
        float v211 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v211 + v235.f32[0]) + v235.f32[1]) + v235.f32[2]) + v235.f32[3]) + v37.f32[0])
                                                                                             + v37.f32[1])
                                                                                     + v37.f32[2])
                                                                             + v37.f32[3])
                                                                     + v237.f32[0])
                                                             + v237.f32[1])
                                                     + v237.f32[2])
                                             + v237.f32[3])
                                     + v236.f32[0])
                             + v236.f32[1])
                     + v236.f32[2])
             + v236.f32[3];
        v224 -= 2;
        v222 -= 16;
      }
      while (v222);
      if (v218 != (v218 & 0xFFFFFFFFFFFFFFF0)) {
        goto LABEL_158;
      }
LABEL_143:
      if (v211 <= 0.0) {
        v37.f32[0] = -0.5;
      }
      else {
        v37.f32[0] = 0.5;
      }
      v48[v209++] = (int)(float)(v211 + v37.f32[0]);
      ++v208;
      ++v202;
      --v203;
      if (v209 >= v47) {
        goto LABEL_104;
      }
    }
  }
LABEL_163:
  free(v48);
  free(v39);
  if (v250)
  {
    uint64_t v240 = *(void *)(v251 - 16 * v47 - 8);
    signed int v241 = atomic_fetch_add((atomic_uint *volatile)(v240 + 24), 0xFFFFFFFF) - 1;
    if (v241 < 0) {
      __assert_rtn("pmem_free", "pmem.c", 302, "count >= 0 && \"Negative count! Something is broken, double free? Memory corruption?\"");
    }
    if (v241)
    {
      atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_or(&global_stats[2], 0);
      atomic_fetch_or(global_stats, 0);
      atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_or(&_pmem_total_blocks, 0);
      atomic_fetch_or(&pmem_bytes_allocated, 0);
    }
    else
    {
      unint64_t v242 = -*(void *)(v240 + 8);
      atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_add(&global_stats[2], 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_add(global_stats, v242);
      atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_add(&_pmem_total_blocks, 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_add(&pmem_bytes_allocated, v242);
      (*(void (**)(uint64_t))(v240 + 40))(v240);
      free((void *)v240);
    }
  }
}

int8x16_t *create_pyr(int8x16_t *result, uint64_t a2)
{
  if ((int)result >= -1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(a2 + 8);
    int v5 = *(_DWORD *)(v4 + 8);
    int v6 = *(_DWORD *)(v4 + 12);
    unsigned int v7 = result + 2;
    uint64_t v54 = (result + 2);
    if ((int)result + 2 <= 1) {
      unsigned int v7 = 1;
    }
    uint64_t v8 = 2 * v5 * (v6 + 16);
    uint64_t v9 = 24 * v7;
    uint64_t v10 = 4;
    do
    {
      uint64_t v14 = *(void *)a2;
      uint64_t v15 = *(void *)(a2 + 16);
      if (*(void *)a2 >= v15)
      {
        uint64_t v16 = 2 * v15;
        BOOL v17 = v15 == 0;
        uint64_t v18 = 10;
        if (!v17) {
          uint64_t v18 = v16;
        }
        if (v18 <= v14) {
          uint64_t v19 = v14 + 1;
        }
        else {
          uint64_t v19 = v18;
        }
        if (v19)
        {
          *(void *)(a2 + 8) = malloc_type_realloc(*(void **)(a2 + 8), 24 * v19, 0x2DECA4BFuLL);
          uint64_t v14 = *(void *)a2;
        }
        *(void *)(a2 + 16) = v19;
      }
      *(void *)a2 = v14 + 1;
      uint64_t v11 = *(void *)(a2 + 8);
      uint64_t v12 = v11 + 24 * v14;
      int v13 = (uint64_t *)(v11 + v3);
      *(_DWORD *)(v12 + 8) = v5;
      *(_DWORD *)(v12 + 12) = v6;
      *(void *)(v12 + 16) = v5;
      *(void *)uint64_t v12 = pmem_alloc_ex(v8, 0, 0) + 16 * *(void *)(v12 + 16);
      vl_gauss16(v13, (unint64_t *)v12, *(float *)(*(void *)(a2 + 56) + v10));
      v3 += 24;
      v10 += 4;
    }
    while (v9 != v3);
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v21 = *(void *)(a2 + 24);
      uint64_t v22 = *(void *)(a2 + 40);
      if (v21 >= v22)
      {
        if (v22) {
          uint64_t v23 = 2 * v22;
        }
        else {
          uint64_t v23 = 10;
        }
        if (v23 <= v21) {
          uint64_t v24 = v21 + 1;
        }
        else {
          uint64_t v24 = v23;
        }
        if (v24)
        {
          *(void *)(a2 + 32) = malloc_type_realloc(*(void **)(a2 + 32), 24 * v24, 0x4CB8FCFDuLL);
          uint64_t v21 = *(void *)(a2 + 24);
        }
        *(void *)(a2 + 40) = v24;
      }
      *(void *)(a2 + 24) = v21 + 1;
      uint64_t v25 = *(void *)(a2 + 32) + 24 * v21;
      *(_DWORD *)(v25 + 8) = v5;
      *(_DWORD *)(v25 + 12) = v6;
      *(void *)(v25 + 16) = v5;
      unint64_t v26 = pmem_alloc_ex(v8, 0, 0);
      uint64_t v27 = *(void *)(v25 + 16);
      result = (int8x16_t *)(v26 + 16 * v27);
      *(void *)uint64_t v25 = result;
      uint64_t v28 = *(void *)(a2 + 8);
      uint64_t v29 = v28 + 24 * i;
      uint64_t v30 = *(int *)(v25 + 8);
      if (v30 != *(_DWORD *)(v29 + 32)) {
        __assert_rtn("create_pyr", "vl_dog.c", 519, "(dog)->x_size == ((&((&octave->gauss_pyr)->items[layer+1])))->x_size");
      }
      uint64_t v31 = i + 1;
      int v32 = *(_DWORD *)(v25 + 12);
      if (v32 != *(_DWORD *)(v28 + 24 * (i + 1) + 12)) {
        __assert_rtn("create_pyr", "vl_dog.c", 519, "(dog)->y_size == ((&((&octave->gauss_pyr)->items[layer+1])))->y_size");
      }
      if (v30 != *(_DWORD *)(v28 + 24 * i + 8)) {
        __assert_rtn("create_pyr", "vl_dog.c", 519, "(dog)->x_size == ((&((&octave->gauss_pyr)->items[layer])))->x_size");
      }
      if (v32 != *(_DWORD *)(v28 + 24 * i + 12)) {
        __assert_rtn("create_pyr", "vl_dog.c", 519, "(dog)->y_size == ((&((&octave->gauss_pyr)->items[layer])))->y_size");
      }
      v33.i64[0] = 0x8000800080008000;
      v33.i64[1] = 0x8000800080008000;
      if (v32 >= 1 && (int)v30 >= 1) {
        break;
      }
LABEL_16:
      if (v31 == v54) {
        return result;
      }
    }
    int v34 = 0;
    uint64_t v35 = *(int16x8_t **)(v29 + 24);
    v36 = *(int16x8_t **)v29;
    uint64_t v37 = v27 - v30;
    uint64_t v38 = *(void *)(v28 + 24 * v31 + 16) - v30;
    uint64_t v39 = *(void *)(v28 + 24 * i + 16) - v30;
    uint64_t v40 = 2 * (v30 & 0xFFFFFFF0);
    while (1)
    {
      if (v30 >= 0x10)
      {
        int v41 = 0;
        if ((unint64_t)((char *)result - (char *)v35) >= 0x20
          && (unint64_t)((char *)result - (char *)v36) >= 0x20)
        {
          v42 = (int16x8_t *)((char *)v36 + v40);
          uint64_t v43 = (int16x8_t *)((char *)v35 + v40);
          float v44 = (int8x16_t *)((char *)result + v40);
          v49 = result + 1;
          unint64_t v50 = v35 + 1;
          uint64_t v51 = v36 + 1;
          uint64_t v52 = v30 & 0xFFFFFFF0;
          do
          {
            int8x16_t v53 = veorq_s8((int8x16_t)vsubq_s16(*v50, *v51), v33);
            v49[-1] = veorq_s8((int8x16_t)vsubq_s16(v50[-1], v51[-1]), v33);
            int8x16_t *v49 = v53;
            v49 += 2;
            v50 += 2;
            v51 += 2;
            v52 -= 16;
          }
          while (v52);
          int v41 = v30 & 0x7FFFFFF0;
          if ((v30 & 0xFFFFFFF0) == v30) {
            goto LABEL_34;
          }
          goto LABEL_38;
        }
      }
      else
      {
        int v41 = 0;
      }
      v42 = v36;
      uint64_t v43 = v35;
      float v44 = result;
LABEL_38:
      int v45 = v30 - v41;
      do
      {
        __int16 v47 = v43->i16[0];
        uint64_t v43 = (int16x8_t *)((char *)v43 + 2);
        __int16 v46 = v47;
        __int16 v48 = v42->i16[0];
        v42 = (int16x8_t *)((char *)v42 + 2);
        v44->i16[0] = (v46 - v48) ^ 0x8000;
        float v44 = (int8x16_t *)((char *)v44 + 2);
        --v45;
      }
      while (v45);
LABEL_34:
      result = (int8x16_t *)((char *)v44 + 2 * v37);
      uint64_t v35 = (int16x8_t *)((char *)v43 + 2 * v38);
      ++v34;
      v36 = (int16x8_t *)((char *)v42 + 2 * v39);
      if (v34 == v32) {
        goto LABEL_16;
      }
    }
  }
  return result;
}

uint64_t create_pyr2(uint64_t result, void *a2)
{
  if ((int)result >= -1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = (result + 2);
    if ((int)v4 <= 1) {
      unsigned int v5 = 1;
    }
    else {
      unsigned int v5 = result + 2;
    }
    uint64_t v6 = 24 * v5;
    uint64_t v7 = 4;
    do
    {
      vl_gauss16((uint64_t *)(a2[1] + v3), (unint64_t *)(a2[1] + v3 + 24), *(float *)(a2[7] + v7));
      v3 += 24;
      v7 += 4;
    }
    while (v6 != v3);
    uint64_t v8 = 0;
    uint64_t v9 = a2[4];
    uint64_t v10 = (int16x8_t **)a2[1];
    uint64_t v11 = *v10;
    v12.i64[0] = 0x8000800080008000;
    v12.i64[1] = 0x8000800080008000;
    while (1)
    {
      int v13 = v11;
      result = v9 + 24 * v8;
      uint64_t v14 = &v10[3 * v8];
      uint64_t v15 = *(int *)(result + 8);
      if (v15 != *((_DWORD *)v14 + 8)) {
        __assert_rtn("create_pyr2", "vl_dog.c", 546, "(dog)->x_size == ((&((&octave->gauss_pyr)->items[layer+1])))->x_size");
      }
      uint64_t v16 = v8 + 1;
      int v17 = *(_DWORD *)(v9 + 24 * v8 + 12);
      if (v17 != HIDWORD(v10[3 * v8 + 4])) {
        __assert_rtn("create_pyr2", "vl_dog.c", 546, "(dog)->y_size == ((&((&octave->gauss_pyr)->items[layer+1])))->y_size");
      }
      if (v15 != LODWORD(v10[3 * v8 + 1])) {
        __assert_rtn("create_pyr2", "vl_dog.c", 546, "(dog)->x_size == ((&((&octave->gauss_pyr)->items[layer])))->x_size");
      }
      if (v17 != HIDWORD(v10[3 * v8 + 1])) {
        __assert_rtn("create_pyr2", "vl_dog.c", 546, "(dog)->y_size == ((&((&octave->gauss_pyr)->items[layer])))->y_size");
      }
      uint64_t v11 = v14[3];
      if (v17 >= 1 && (int)v15 >= 1) {
        break;
      }
LABEL_8:
      uint64_t v8 = v16;
      if (v16 == v4) {
        return result;
      }
    }
    int v18 = 0;
    uint64_t v19 = *(int8x16_t **)result;
    uint64_t v20 = 3 * v8;
    uint64_t v21 = *(void *)(v9 + 24 * v8 + 16) - v15;
    result = (uint64_t)v10[3 * v16 + 2]->i64 - v15;
    uint64_t v22 = (uint64_t)v10[v20 + 2]->i64 - v15;
    uint64_t v23 = 2 * (v15 & 0xFFFFFFF0);
    uint64_t v24 = v11;
    while (1)
    {
      if (v15 >= 0x10)
      {
        int v25 = 0;
        if ((unint64_t)((char *)v19 - (char *)v24) >= 0x20
          && (unint64_t)((char *)v19 - (char *)v13) >= 0x20)
        {
          unint64_t v26 = (int16x8_t *)((char *)v13 + v23);
          uint64_t v27 = (int16x8_t *)((char *)v24 + v23);
          uint64_t v28 = (int8x16_t *)((char *)v19 + v23);
          int8x16_t v33 = v19 + 1;
          int v34 = v24 + 1;
          uint64_t v35 = v13 + 1;
          uint64_t v36 = v15 & 0xFFFFFFF0;
          do
          {
            int8x16_t v37 = veorq_s8((int8x16_t)vsubq_s16(*v34, *v35), v12);
            v33[-1] = veorq_s8((int8x16_t)vsubq_s16(v34[-1], v35[-1]), v12);
            *int8x16_t v33 = v37;
            v33 += 2;
            v34 += 2;
            v35 += 2;
            v36 -= 16;
          }
          while (v36);
          int v25 = v15 & 0x7FFFFFF0;
          if ((v15 & 0xFFFFFFF0) == v15) {
            goto LABEL_16;
          }
          goto LABEL_20;
        }
      }
      else
      {
        int v25 = 0;
      }
      unint64_t v26 = v13;
      uint64_t v27 = v24;
      uint64_t v28 = v19;
LABEL_20:
      int v29 = v15 - v25;
      do
      {
        __int16 v31 = v27->i16[0];
        uint64_t v27 = (int16x8_t *)((char *)v27 + 2);
        __int16 v30 = v31;
        __int16 v32 = v26->i16[0];
        unint64_t v26 = (int16x8_t *)((char *)v26 + 2);
        v28->i16[0] = (v30 - v32) ^ 0x8000;
        uint64_t v28 = (int8x16_t *)((char *)v28 + 2);
        --v29;
      }
      while (v29);
LABEL_16:
      uint64_t v19 = (int8x16_t *)((char *)v28 + 2 * v21);
      uint64_t v24 = (int16x8_t *)((char *)v27 + 2 * result);
      ++v18;
      int v13 = (int16x8_t *)((char *)v26 + 2 * v22);
      if (v18 == v17) {
        goto LABEL_8;
      }
    }
  }
  return result;
}

void vl_height_get_for_latlon(int *a1, uint64_t a2, float a3, float a4)
{
  uint64_t v4 = *((void *)a1 + 15) / (a1[1] * (uint64_t)*a1);
  if ((int)v4 >= 1)
  {
    float64x2_t v39 = *(float64x2_t *)(a1 + 14);
    __double2 v8 = __sincos_stret(a3);
    double v9 = 6378137.0 / sqrt(v8.__sinval * -0.00669437999 * v8.__sinval + 1.0);
    double v38 = v8.__sinval * (v9 * 0.99330562) - *((double *)a1 + 12);
    float64x2_t v37 = *(float64x2_t *)(a1 + 2);
    __double2 v10 = __sincos_stret(a4);
    int v11 = 0;
    float64x2_t v12 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*((float64x2_t *)a1 + 2), v10.__sinval * (v8.__cosval * v9) - *((double *)a1 + 11)), v37, v10.__cosval * (v8.__cosval * v9) - *((double *)a1 + 10)), v39, v38);
    float32x2_t v13 = vcvt_f32_f64(v12);
    float64x2_t v14 = v12;
    do
    {
      float32x2_t v16 = (float32x2_t)vrev64_s32((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 26)));
      int32x2_t v17 = vcvt_s32_f32(vmul_f32(vadd_f32(vmul_f32(v16, (float32x2_t)0x3F0000003F000000), v13), vdiv_f32(vcvt_f32_s32(*(int32x2_t *)a1), v16)));
      int32x2_t v18 = vcgt_s32(*(int32x2_t *)a1, v17);
      if ((v18.i8[0] & 1) != 0
        && (v17.i32[0] & 0x80000000) == 0
        && (v17.i32[1] & 0x80000000) == 0
        && (v18.i8[4] & 1) != 0)
      {
        float v19 = *(float *)(*((void *)a1 + 16)
                       + 4 * (int)(v17.i32[0] + (v17.i32[1] + HIDWORD(*(void *)a1) * v11) * *(void *)a1));
        BOOL v20 = v19 != 3.4028e38 && v19 <= 80000.0;
        if (v20 && v19 >= -80000.0)
        {
          double v22 = v19;
          double v23 = *((double *)a1 + 10)
              + v14.f64[1] * *((double *)a1 + 2)
              + *((double *)a1 + 1) * v14.f64[0]
              + *((double *)a1 + 3) * v22;
          double v24 = v14.f64[1] * *((double *)a1 + 8);
          double v25 = *((double *)a1 + 12);
          double v26 = *((double *)a1 + 11)
              + v14.f64[1] * *((double *)a1 + 5)
              + *((double *)a1 + 4) * v14.f64[0]
              + *((double *)a1 + 6) * v22;
          double v27 = v25 + v24 + *((double *)a1 + 7) * v14.f64[0] + *((double *)a1 + 9) * v22;
          double v28 = sqrt(v26 * v26 + v23 * v23);
          if (v28 >= 0.001)
          {
            double v29 = atan2(v25 + v24 + *((double *)a1 + 7) * v14.f64[0] + *((double *)a1 + 9) * v22, v28 * 0.996647189);
          }
          else
          {
            double v29 = dbl_21BB7A6E0[v27 < 0.0];
            double v28 = 0.001;
          }
          __double2 v30 = __sincos_stret(v29);
          double v31 = atan2(v27 + v30.__sinval * (v30.__sinval * v30.__sinval) * 42841.3115, v28 + v30.__cosval * (v30.__cosval * v30.__cosval) * -42697.6727);
          __double2 v32 = __sincos_stret(v31);
          uint64_t v33 = *(void *)a2;
          uint64_t v34 = *(void *)(a2 + 16);
          if (*(void *)a2 >= v34)
          {
            if (v34) {
              uint64_t v35 = 2 * v34;
            }
            else {
              uint64_t v35 = 64;
            }
            if (v35 <= v33) {
              uint64_t v36 = v33 + 1;
            }
            else {
              uint64_t v36 = v35;
            }
            if (v36)
            {
              *(void *)(a2 + 8) = malloc_type_realloc(*(void **)(a2 + 8), 4 * v36, 0xD660BEBAuLL);
              uint64_t v33 = *(void *)a2;
            }
            *(void *)(a2 + 16) = v36;
          }
          *(void *)a2 = v33 + 1;
          float v15 = v28 / v32.__cosval + -6378137.0 / sqrt(v32.__sinval * -0.00669437999 * v32.__sinval + 1.0);
          *(float *)(*(void *)(a2 + 8) + 4 * v33) = v15;
        }
      }
      ++v11;
    }
    while (v4 != v11);
  }
}

int *vl_height_get_for_cs(int *result, double *a2, uint64_t a3, float a4, float a5)
{
  uint64_t v5 = *((void *)result + 15) / (result[1] * (uint64_t)*result);
  if ((int)v5 >= 1)
  {
    __double2 v8 = (double *)result;
    int v9 = 0;
    double v10 = a4;
    double v11 = a5;
    float v12 = 0.5;
    double v51 = a5;
    double v52 = a4;
    do
    {
      double v14 = a2[2];
      double v16 = a2[8];
      double v15 = a2[9];
      double v17 = a2[5];
      double v18 = a2[10];
      double v19 = a2[11];
      double v20 = v8[1];
      double v22 = v8[10];
      double v21 = v8[11];
      double v23 = v15 + a2[1] * v11 + *a2 * v10 + v14 * 0.0 - v22;
      double v24 = v8[4];
      double v25 = v18 + a2[4] * v11 + a2[3] * v10 + v17 * 0.0 - v21;
      double v26 = v8[7];
      double v27 = v8[12];
      double v28 = v19 + a2[7] * v11 + a2[6] * v10 + v16 * 0.0 - v27;
      double v29 = v24 * v25 + v20 * v23 + v26 * v28;
      float v30 = v29;
      float v31 = v8[14];
      int v32 = (int)(float)((float)((float)*(int *)v8 / v31) * (float)((float)(v31 * v12) + v30));
      if (*(_DWORD *)v8 > v32 && (v32 & 0x80000000) == 0)
      {
        double v33 = v8[2];
        double v34 = v8[5];
        double v35 = v8[8];
        double v36 = v25 * v34 + v33 * v23 + v35 * v28;
        float v37 = v36;
        float v38 = v8[13];
        int v39 = *((_DWORD *)v8 + 1);
        int v40 = (int)(float)((float)((float)(v38 * v12) + v37) * (float)((float)v39 / v38));
        if ((v40 & 0x80000000) == 0 && v39 > v40)
        {
          float v41 = *(float *)(*((void *)v8 + 16) + 4 * (v32 + (v40 + v39 * v9) * *(_DWORD *)v8));
          BOOL v42 = v41 != 3.4028e38 && v41 <= 80000.0;
          if (v42 && v41 >= -80000.0)
          {
            double v44 = v8[3];
            double v45 = v8[6];
            double v46 = v8[9];
            uint64_t v47 = *(void *)a3;
            uint64_t v48 = *(void *)(a3 + 16);
            if (*(void *)a3 >= v48)
            {
              if (v48) {
                uint64_t v49 = 2 * v48;
              }
              else {
                uint64_t v49 = 64;
              }
              if (v49 <= v47) {
                uint64_t v50 = v47 + 1;
              }
              else {
                uint64_t v50 = v49;
              }
              if (v50)
              {
                double v64 = a2[9];
                double v65 = a2[2];
                double v62 = a2[5];
                double v63 = a2[8];
                double v60 = a2[11];
                double v61 = a2[10];
                double v58 = v8[11];
                double v59 = v8[12];
                double v56 = v8[10];
                double v57 = v8[7];
                double v54 = v8[6];
                double v55 = v8[9];
                double v53 = v8[3];
                result = (int *)malloc_type_realloc(*(void **)(a3 + 8), 4 * v50, 0x80A02E46uLL);
                double v44 = v53;
                double v45 = v54;
                double v46 = v55;
                double v22 = v56;
                double v26 = v57;
                double v21 = v58;
                double v27 = v59;
                double v19 = v60;
                double v18 = v61;
                double v17 = v62;
                double v16 = v63;
                double v15 = v64;
                double v14 = v65;
                float v12 = 0.5;
                double v11 = v51;
                double v10 = v52;
                *(void *)(a3 + 8) = result;
                uint64_t v47 = *(void *)a3;
              }
              *(void *)(a3 + 16) = v50;
            }
            *(void *)a3 = v47 + 1;
            float v13 = v17 * (v21 + v34 * v36 + v24 * v29 + v45 * v41 - v18)
                + v14 * (v22 + v33 * v36 + v20 * v29 + v44 * v41 - v15)
                + v16 * (v27 + v35 * v36 + v26 * v29 + v46 * v41 - v19);
            *(float *)(*(void *)(a3 + 8) + 4 * v47) = v13;
          }
        }
      }
      ++v9;
    }
    while (v5 != v9);
  }
  return result;
}

float vl_height_get_for_global(uint64_t a1, double *a2)
{
  double v2 = *a2 - *(double *)(a1 + 80);
  double v3 = a2[1] - *(double *)(a1 + 88);
  double v4 = a2[2] - *(double *)(a1 + 96);
  float64x2_t v5 = (float64x2_t)vextq_s8(*(int8x16_t *)(a1 + 104), *(int8x16_t *)(a1 + 104), 8uLL);
  __asm
  {
    FMOV            V5.2D, #0.5
    FMOV            V6.2D, #-0.5
  }
  float64x2_t v11 = vaddq_f64(vmulq_f64(v5, _Q5), _Q6);
  v12.i64[0] = (int)*(void *)a1;
  v12.i64[1] = (int)HIDWORD(*(void *)a1);
  float64x2_t v13 = vcvtq_f64_s64(v12);
  float64x2_t v14 = vmulq_f64(vdivq_f64(v13, v5), vaddq_f64(v11, vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 32), v3), *(float64x2_t *)(a1 + 8), v2), *(float64x2_t *)(a1 + 56), v4)));
  int32x4_t v15 = (int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f64(v14, v13));
  *(int32x2_t *)v15.i8 = vmovn_s64((int64x2_t)v15);
  v15.i32[0] = vmovn_s32(v15).u32[0];
  int64x2_t v16 = (int64x2_t)vmvnq_s8((int8x16_t)vcltzq_f64(v14));
  v15.i32[1] = vmovn_s32(vmovn_hight_s64(*(int32x2_t *)&v16, v16)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(*(int16x4_t *)v15.i8, 0xFuLL))) & 1) == 0) {
    return 3.4028e38;
  }
  float v17 = *(float *)(*(void *)(a1 + 128) + 4 * (int)((int)v14.f64[0] + *(void *)a1 * (int)v14.f64[1]));
  if (v17 > 80000.0 || v17 < -80000.0) {
    return 3.4028e38;
  }
  float v19 = v3 * *(double *)(a1 + 48) + *(double *)(a1 + 24) * v2 + *(double *)(a1 + 72) * v4;
  return v17 - v19;
}

BOOL g_pinhole_to_pixel_jac(double *a1, double *a2, int a3, double *a4, unsigned int a5, int a6, int a7, float64x2_t *a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double *a17, uint64_t a18, uint64_t a19, float64x2_t *a20,float64x2_t *a21)
{
  double v26 = a14;
  double v27 = a13;
  double v31 = a10;
  double v33 = a15 + a9 * a11;
  double v34 = a16 + a10 * a11;
  double v35 = sqrt(v34 * v34 + v33 * v33);
  double v78 = v34;
  if ((a3 - 15) >= 0xFFFFFFFD)
  {
    v80[0] = 0.0;
    double v77 = a15 + a9 * a11;
    g_interp_bspline3_mix2(a5, a4, v80, a21, 1, v35 * 0.707106781, 0.0, 0.0);
    double v33 = v77;
    double v43 = v48 + 1.0;
    double v47 = v48 + 1.0 + v35 * v80[0];
    double v46 = v80[0] * 0.707106781;
    if (!a1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  double v75 = v31;
  if (a3 != 15) {
    __assert_rtn("g_pinhole_to_pixel_jac", "g_camera.c", 1146, "0");
  }
  double v36 = 1.41421356 / (double)(int)(a5 - 1);
  int v37 = (int)(v35 / v36);
  if ((int)(a5 - 2) < v37) {
    int v37 = a5 - 2;
  }
  double v38 = v35 / v36 - (double)v37;
  uint64_t v39 = v37;
  double v40 = a4[v37];
  uint64_t v41 = v37 + 1;
  double v42 = a4[v41];
  double v43 = (1.0 - v38) * v40 + 1.0 + v38 * v42;
  double v44 = v42 - v40;
  double v45 = v42 - v40;
  if (a21)
  {
    double v76 = v33;
    bzero(a21, 8 * (int)a5);
    double v33 = v76;
    a21->f64[v39] = 1.0 - v38;
    a21->f64[v41] = v38;
    double v45 = a4[v41] - a4[v39];
  }
  double v46 = v44 / v36;
  double v47 = v43 + v35 * v45 / v36;
  double v26 = a14;
  double v31 = v75;
  double v27 = a13;
  if (a1) {
LABEL_10:
  }
    *a1 = (v27 + 1.0) * (double)a6 * 0.5 + v33 * v43 * (double)a6 * 0.5 + -0.5;
LABEL_11:
  if (a2) {
    *a2 = (v26 + 1.0) * (double)a7 * 0.5 + v78 * (v43 * a12) * (double)a6 * 0.5 + -0.5;
  }
  __asm { FMOV            V1.2D, #0.5 }
  if (a8)
  {
    double v54 = v33 * (v46 * a11) / v35;
    double v55 = v78 * (v46 * a11) / v35;
    v56.f64[0] = v43 * a11 + v33 * v54;
    v56.f64[1] = v33 * v55;
    v57.f64[0] = v78 * a12 * v54;
    v57.f64[1] = v43 * a12 * a11 + v78 * a12 * v55;
    *a8 = vmulq_f64(vmulq_n_f64(v56, (double)a6), _Q1);
    a8[1] = vmulq_f64(vmulq_n_f64(v57, (double)a6), _Q1);
  }
  if (a17)
  {
    double v58 = (v78 * v31 + v33 * a9) * v46 / v35;
    *a17 = (v33 * v58 + v43 * a9) * (double)a6 * 0.5;
    a17[1] = (v78 * a12 * v58 + v43 * a12 * v31) * (double)a6 * 0.5;
  }
  if (a18)
  {
    *(void *)a18 = 0;
    *(double *)(a18 + 8) = v78 * v43 * (double)a6 * 0.5;
  }
  if (a19)
  {
    *(double *)a19 = (double)a6 * 0.5;
    *(void *)(a19 + 8) = 0;
    *(void *)(a19 + 16) = 0;
    *(double *)(a19 + 24) = (double)a7 * 0.5;
  }
  if (a20)
  {
    double v59 = v33 * v46 / v35;
    double v60 = v78 * v46 / v35;
    v61.f64[0] = v43 + v33 * v59;
    v61.f64[1] = v33 * v60;
    v62.f64[0] = v78 * a12 * v59;
    v62.f64[1] = v78 * a12 * v60 + a12 * v43;
    *a20 = vmulq_f64(vmulq_n_f64(v61, (double)a6), _Q1);
    a20[1] = vmulq_f64(vmulq_n_f64(v62, (double)a6), _Q1);
  }
  if ((int)a5 >= 1 && a21)
  {
    double v63 = (double)a6;
    if (a5 < 2)
    {
      uint64_t v64 = 0;
LABEL_30:
      uint64_t v68 = a5 - v64;
      uint64_t v69 = &a21->f64[v64 + a5];
      float v70 = &a21->f64[v64];
      do
      {
        double v71 = *v70;
        *v69++ = v78 * (*v70 * a12) * v63 * 0.5;
        *v70++ = v33 * v71 * v63 * 0.5;
        --v68;
      }
      while (v68);
      return v47 < 0.0;
    }
    uint64_t v64 = a5 & 0xFFFFFFFE;
    uint64_t v65 = v64;
    uint64_t v66 = a21;
    do
    {
      float64x2_t v67 = *v66;
      *(float64x2_t *)((char *)v66 + 8 * a5) = vmulq_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(*v66, a12), v78), v63), _Q1);
      *v66++ = vmulq_f64(vmulq_n_f64(vmulq_n_f64(v67, v33), v63), _Q1);
      v65 -= 2;
    }
    while (v65);
    if (v64 != a5) {
      goto LABEL_30;
    }
  }
  return v47 < 0.0;
}

uint64_t g_improj_to_xyz(uint64_t a1, int a2, int a3, double *a4, double *a5, double *a6, double a7, double a8)
{
  double v256 = 0.0;
  double cosval = 0.0;
  double v255 = 0.0;
  double v15 = a7 + 0.5;
  double v16 = a8 + 0.5;
  switch(*(_DWORD *)a1)
  {
    case 0:
      double cosval = 1.0;
      double v17 = -(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * tan(*(double *)(a1 + 8) * 0.5) * 2.0);
      double v18 = -(*(double *)(a1 + 32) - (v16 / (double)a3 + -0.5) * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      double v19 = *(double *)(a1 + 56);
      double v20 = *(double *)(a1 + 64);
      double v21 = *(double *)(a1 + 72);
      if (v19 != 0.0 || v20 != 0.0 || (double v22 = 1.0, v21 != 0.0))
      {
        double v23 = sqrt(v17 * v17 + v18 * v18);
        double v24 = 1.0
            - (v23 * (v19 + (v20 + v21 * v23) * v23) * v23 + 1.0 + -1.0)
            / (v23 * (v23 * (v23 * (v21 * 5.0) + v20 * 4.0) + v19 * 3.0) * v23 + 1.0);
        double v25 = v24
            - (v24 * (v23 * v24 * (v19 + (v20 + v21 * (v23 * v24)) * (v23 * v24)) * (v23 * v24) + 1.0) + -1.0)
            / (v23 * v24 * (v23 * v24 * (v21 * 5.0 * (v23 * v24) + v20 * 4.0) + v19 * 3.0) * (v23 * v24) + 1.0);
        double v26 = v25
            - (v25 * (v23 * v25 * (v19 + (v20 + v21 * (v23 * v25)) * (v23 * v25)) * (v23 * v25) + 1.0) + -1.0)
            / (v23 * v25 * (v23 * v25 * (v21 * 5.0 * (v23 * v25) + v20 * 4.0) + v19 * 3.0) * (v23 * v25) + 1.0);
        double v27 = v26
            - (v26 * (v23 * v26 * (v19 + (v20 + v21 * (v23 * v26)) * (v23 * v26)) * (v23 * v26) + 1.0) + -1.0)
            / (v23 * v26 * (v23 * v26 * (v21 * 5.0 * (v23 * v26) + v20 * 4.0) + v19 * 3.0) * (v23 * v26) + 1.0);
        double v28 = v23 * v27;
        double v22 = v27
            - (v27 * (v28 * (v19 + (v20 + v21 * v28) * v28) * v28 + 1.0) + -1.0)
            / (v28 * (v28 * (v21 * 5.0 * v28 + v20 * 4.0) + v19 * 3.0) * v28 + 1.0);
      }
      uint64_t v29 = 0;
      double sinval = v17 * v22 - *(double *)(a1 + 40);
      double v31 = v18 * v22 - *(double *)(a1 + 48);
      break;
    case 1:
      __double2 v137 = __sincos_stret(-(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * *(double *)(a1 + 8)));
      double sinval = v137.__sinval;
      double cosval = v137.__cosval;
      double v138 = v16 / (double)a3 + -0.5;
      uint64_t v29 = 0;
      double v31 = -(*(double *)(a1 + 32) - v138 * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      break;
    case 2:
      double v139 = -(*(double *)(a1 + 32) - (v16 / (double)a3 + -0.5) * *(double *)(a1 + 16));
      __double2 v140 = __sincos_stret(-(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * *(double *)(a1 + 8)));
      __double2 v141 = __sincos_stret(v139);
      double v31 = v141.__sinval;
      uint64_t v29 = 0;
      double cosval = v140.__cosval * v141.__cosval;
      double sinval = v140.__sinval * v141.__cosval;
      break;
    case 3:
      double cosval = 1.0;
      long double v32 = -(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * tan(*(double *)(a1 + 8) * 0.5) * 2.0);
      long double v33 = -(*(double *)(a1 + 32) - (v16 / (double)a3 + -0.5) * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      double v34 = sqrt(v32 * v32 + v33 * v33);
      double v35 = *(double *)(a1 + 64);
      double v36 = *(double *)(a1 + 72);
      double v37 = *(double *)(a1 + 56);
      double v38 = 1.0
          - (v34 * (v37 + (v35 + v36 * v34) * v34) * v34 + 1.0 + -1.0)
          / (v34 * (v34 * (v34 * (v36 * 5.0) + v35 * 4.0) + v37 * 3.0) * v34 + 1.0);
      double v39 = v38
          - (v38 * (v34 * v38 * (v37 + (v35 + v36 * (v34 * v38)) * (v34 * v38)) * (v34 * v38) + 1.0) + -1.0)
          / (v34 * v38 * (v34 * v38 * (v36 * 5.0 * (v34 * v38) + v35 * 4.0) + v37 * 3.0) * (v34 * v38) + 1.0);
      double v40 = v39
          - (v39 * (v34 * v39 * (v37 + (v35 + v36 * (v34 * v39)) * (v34 * v39)) * (v34 * v39) + 1.0) + -1.0)
          / (v34 * v39 * (v34 * v39 * (v36 * 5.0 * (v34 * v39) + v35 * 4.0) + v37 * 3.0) * (v34 * v39) + 1.0);
      double v41 = v40
          - (v40 * (v34 * v40 * (v37 + (v35 + v36 * (v34 * v40)) * (v34 * v40)) * (v34 * v40) + 1.0) + -1.0)
          / (v34 * v40 * (v34 * v40 * (v36 * 5.0 * (v34 * v40) + v35 * 4.0) + v37 * 3.0) * (v34 * v40) + 1.0);
      double v42 = v34 * v41;
      double v43 = v41
          - (v41 * (v42 * (v37 + (v35 + v36 * v42) * v42) * v42 + 1.0) + -1.0)
          / (v42 * (v42 * (v36 * 5.0 * v42 + v35 * 4.0) + v37 * 3.0) * v42 + 1.0);
      double v44 = v32 * v43 - *(double *)(a1 + 40);
      double v45 = v33 * v43 - *(double *)(a1 + 48);
      double v46 = fmin(sqrt(v44 * v44 + v45 * v45), 1.57079319);
      double v47 = 0.0;
      if (v46 != 0.0) {
        double v47 = tan(v46) / v46;
      }
      uint64_t v29 = 0;
      double sinval = v44 * v47;
      double v31 = v45 * v47;
      break;
    case 4:
      double cosval = 1.0;
      long double v48 = tan(*(double *)(a1 + 8) * 0.5);
      double sinval = (v15 / (double)a2 + -0.5) * v48 + (v15 / (double)a2 + -0.5) * v48;
      double v49 = v16 / (double)a3 + -0.5;
      long double v50 = tan(*(double *)(a1 + 16) * 0.5);
      uint64_t v29 = 0;
      double v31 = v49 * v50 + v49 * v50;
      break;
    case 5:
      double v51 = (v15 / (double)a2 + -0.5 - *(double *)(a1 + 24)) * *(double *)(a1 + 8);
      double v52 = (v16 / (double)a3 + -0.5 - *(double *)(a1 + 32)) * *(double *)(a1 + 16);
      double v53 = sqrt(v51 * v51 + v52 * v52);
      double v54 = v51 / (v53 + 1.0e-20);
      double v55 = *(double *)(a1 + 56);
      double v56 = *(double *)(a1 + 64);
      double v57 = *(double *)(a1 + 72);
      double v58 = v57 * 5.0;
      double v59 = 1.0
          - (v53 * (v55 + (v56 + v57 * v53) * v53) * v53 + 1.0 + -1.0)
          / (v53 * (v53 * (v53 * (v57 * 5.0) + v56 * 4.0) + v55 * 3.0) * v53 + 1.0);
      double v60 = v59
          - (v59 * (v53 * v59 * (v55 + (v56 + v57 * (v53 * v59)) * (v53 * v59)) * (v53 * v59) + 1.0) + -1.0)
          / (v53 * v59 * (v53 * v59 * (v57 * 5.0 * (v53 * v59) + v56 * 4.0) + v55 * 3.0) * (v53 * v59) + 1.0);
      double v61 = v60
          - (v60 * (v53 * v60 * (v55 + (v56 + v57 * (v53 * v60)) * (v53 * v60)) * (v53 * v60) + 1.0) + -1.0)
          / (v53 * v60 * (v53 * v60 * (v57 * 5.0 * (v53 * v60) + v56 * 4.0) + v55 * 3.0) * (v53 * v60) + 1.0);
      double v62 = v61
          - (v61 * (v53 * v61 * (v55 + (v56 + v57 * (v53 * v61)) * (v53 * v61)) * (v53 * v61) + 1.0) + -1.0)
          / (v53 * v61 * (v53 * v61 * (v57 * 5.0 * (v53 * v61) + v56 * 4.0) + v55 * 3.0) * (v53 * v61) + 1.0);
      double v63 = v62
          - (v62 * (v53 * v62 * (v55 + (v56 + v57 * (v53 * v62)) * (v53 * v62)) * (v53 * v62) + 1.0) + -1.0)
          / (v53 * v62 * (v53 * v62 * (v57 * 5.0 * (v53 * v62) + v56 * 4.0) + v55 * 3.0) * (v53 * v62) + 1.0);
      double v64 = v52 / (v53 + 1.0e-20);
      double v65 = v53 * v63;
      unsigned int v66 = 2
          * (fabs(v53 * v63 * (v55 + (v56 + v57 * (v53 * v63)) * (v53 * v63)) * (v53 * v63) + 1.0 + -1.0 / v63) > 0.01);
      double v67 = *(double *)(a1 + 40);
      if (v67 <= 0.174532925) {
        double v67 = 1.57079633;
      }
      if (v65 > v67) {
        unsigned int v66 = 2;
      }
      if (v65 * (v65 * (v58 * v65 + v56 * 4.0) + v55 * 3.0) * v65 + 1.0 >= 0.0) {
        uint64_t v29 = v66;
      }
      else {
        uint64_t v29 = 2;
      }
      __double2 v68 = __sincos_stret(v65);
      double sinval = v54 * v68.__sinval;
      double v31 = v64 * v68.__sinval;
      double cosval = v68.__cosval;
      break;
    case 6:
      double v142 = *(double *)(a1 + 56);
      double v143 = *(double *)(a1 + 64);
      double v144 = *(double *)(a1 + 72);
      double v145 = *(double *)(a1 + 24) * 0.000001;
      double v146 = *(double *)(a1 + 32) * 0.000001;
      double cosval = 1.0;
      long double v147 = tan(*(double *)(a1 + 8) * 0.5);
      double v148 = (v15 / (double)a2 + -0.5) * v147 + (v15 / (double)a2 + -0.5) * v147;
      long double v149 = tan(*(double *)(a1 + 16) * 0.5);
      double v150 = (v16 / (double)a3 + -0.5) * v149 + (v16 / (double)a3 + -0.5) * v149;
      int v151 = 5;
      double v152 = v150;
      double v153 = v148;
      do
      {
        double v154 = v152 * v152;
        double v155 = v153 * v153;
        double v156 = v152 * v152 + v153 * v153;
        double v157 = v142 * v156 + 1.0 + v143 * v156 * v156 + v156 * (v144 * v156) * v156;
        double v158 = v155 * v155 + v152 * v152 * (v153 * v153 * 6.0 + v152 * v152 * 5.0);
        double v159 = v155 * (v155 * v155)
             + v152 * v152 * (v152 * v152 * (v153 * v153 * 15.0 + v152 * v152 * 7.0) + v155 * v155 * 9.0);
        double v160 = v148 - (v146 * (v156 + v153 * 2.0) + (v145 + v145) * v153 * v152 + v153 * v157);
        double v161 = v150 - (v145 * (v156 + v152 * 2.0) + (v146 + v146) * v153 * v152 + v152 * v157);
        double v162 = 0.0
             - (v142 * (v152 * v152 + v153 * v153 * 3.0)
              + 1.0
              + v143 * (v154 * v154 + v153 * v153 * (v152 * v152 * 6.0 + v153 * v153 * 5.0))
              + v144
              * (v154 * (v154 * v154)
               + v153 * v153 * (v153 * v153 * (v152 * v152 * 15.0 + v153 * v153 * 7.0) + v154 * v154 * 9.0))
              + (v146 * (v153 + 1.0) + v145 * v152) * 2.0);
        double v163 = 0.0
             - (v142 * (v153 * v153 + v152 * v152 * 3.0)
              + 1.0
              + v143 * v158
              + v144 * v159
              + (v145 * (v152 + 1.0) + v146 * v153) * 2.0);
        double v164 = (v146 * v152 + v145 * v153 + v152 * v153 * (v142 + (v144 * 3.0 * v156 + v143 * 2.0) * v156)) * -2.0 + 0.0;
        double v165 = v162 * v163 - v164 * v164;
        double v153 = v153 + (v164 * v161 - v163 * v160) / v165;
        double v152 = v152 + (v164 * v160 - v161 * v162) / v165;
        --v151;
      }
      while (v151);
      uint64_t v29 = 0;
      double sinval = v153 - *(double *)(a1 + 40);
      double v31 = v152 - *(double *)(a1 + 48);
      break;
    case 7:
      double v166 = *(double *)(a1 + 16);
      double v168 = *(double *)(a1 + 32);
      double v167 = *(double *)(a1 + 40);
      double v169 = -(v168 - (v16 / (double)a3 + -0.5) * v166);
      if (v167 == 0.0 || v169 <= v167)
      {
        double v216 = *(double *)(a1 + 48);
        double v171 = 1.0;
        if (v216 != 0.0 && v169 < v216)
        {
          double v217 = -(*(double *)(a1 + 72) + -1.0) / (v216 + 1.57079633) * 0.5;
          double v171 = 1.0;
          double v169 = v216 + sqrt(-(v216 - v169) / v217 + 1.0 / v217 * 0.5 * (1.0 / v217 * 0.5)) - 1.0 / v217 * 0.5;
          double v218 = fabs(v169) / 1.57079633;
          double v219 = fabs(v216) / 1.57079633;
          if (v218 >= v219)
          {
            double v220 = (v218 - v219) / (1.0 - v219);
            double v221 = *(double *)(a1 + 64);
            double v222 = 1.0;
            if (v221 > 0.0) {
              double v222 = (v220 + v220 / v221 * (v220 / v221)) / (v220 / v221 * (v220 / v221) + 1.0);
            }
            double v171 = v220 * (*(double *)(a1 + 56) / 1.57079633 + -1.0) * v222 + 1.0;
          }
        }
      }
      else
      {
        double v170 = *(double *)(a1 + 56);
        double v171 = 1.0;
        double v169 = v167
             + 1.0 / ((v170 + -1.0) / (1.57079633 - v167) * 0.5) * -0.5
             - sqrt(-(v167 - v169) / ((v170 + -1.0) / (1.57079633 - v167) * 0.5)+ 1.0/ ((v170 + -1.0)/ (1.57079633 - v167)* 0.5)* 0.5* (1.0/ ((v170 + -1.0)/ (1.57079633 - v167)* 0.5)* 0.5));
        double v172 = fabs(v169) / 1.57079633;
        double v173 = fabs(v167) / 1.57079633;
        if (v172 >= v173)
        {
          double v174 = *(double *)(a1 + 64);
          double v175 = (v172 - v173) / (1.0 - v173);
          double v176 = (v170 / 1.57079633 + -1.0) * v175;
          double v177 = 1.0;
          if (v174 > 0.0) {
            double v177 = (v175 + v175 / v174 * (v175 / v174)) / (v175 / v174 * (v175 / v174) + 1.0);
          }
          double v171 = v176 * v177 + 1.0;
        }
      }
      double v223 = *(double *)(a1 + 8);
      double v224 = (v15 / (double)a2 + -0.5) / v171 * v223;
      __double2 v225 = __sincos_stret(v169);
      double v31 = v225.__sinval;
      double v226 = *(double *)(a1 + 24);
      double v227 = v224 / v225.__cosval - v226;
      __double2 v228 = __sincos_stret(v227);
      double cosval = v225.__cosval * v228.__cosval;
      double sinval = v225.__cosval * v228.__sinval;
      double v229 = fabs(v226 + v227);
      double v230 = fabs(v168 + v169);
      if (v229 + v229 <= v223) {
        uint64_t v29 = 2 * (v230 + v230 > v166);
      }
      else {
        uint64_t v29 = 2;
      }
      break;
    case 8:
      double cosval = 1.0;
      double v178 = -(*(double *)(a1 + 24) - (v15 / (double)a2 + -0.5) * tan(*(double *)(a1 + 8) * 0.5) * 2.0);
      double v179 = -(*(double *)(a1 + 32) - (v16 / (double)a3 + -0.5) * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      double v181 = *(double *)(a1 + 64);
      double v180 = *(double *)(a1 + 72);
      double v182 = *(double *)(a1 + 56);
      if (v182 == 0.0 && v180 == 0.0 && v181 == 0.0 && *(double *)(a1 + 40) == 0.0 && *(double *)(a1 + 48) == 0.0)
      {
        double v191 = 1.0;
      }
      else
      {
        double v183 = sqrt(v178 * v178 + v179 * v179);
        double v184 = *(double *)(a1 + 40);
        double v185 = *(double *)(a1 + 48);
        double v186 = 1.0
             - (v183
              * (v182 + v183 * (v180 + v183 * (v181 + v183 * (v184 + v183 * v185 * v183) * v183) * v183) * v183)
              * v183
              + 1.0
              + -1.0)
             / (v183
              * (v183
               * (v183
                * (v183 * (v183 * (v183 * (v183 * (v183 * (v183 * (v185 * 11.0)) + v184 * 9.0)) + v181 * 7.0))
                 + v180 * 5.0))
               + v182 * 3.0)
              * v183
              + 1.0);
        double v187 = v186
             - (v186
              * (v183
               * v186
               * (v182
                + v183
                * v186
                * (v180
                 + v183
                 * v186
                 * (v181 + v183 * v186 * (v184 + v185 * (v183 * v186) * (v183 * v186)) * (v183 * v186))
                 * (v183
                  * v186))
                * (v183
                 * v186))
               * (v183
                * v186)
               + 1.0)
              + -1.0)
             / (v183
              * v186
              * (v183
               * v186
               * (v183
                * v186
                * (v183
                 * v186
                 * (v183
                  * v186
                  * (v183 * v186 * (v183 * v186 * (v183 * v186 * (v185 * 11.0 * (v183 * v186)) + v184 * 9.0))
                   + v181 * 7.0))
                 + v180 * 5.0))
               + v182 * 3.0)
              * (v183
               * v186)
              + 1.0);
        double v188 = v187
             - (v187
              * (v183
               * v187
               * (v182
                + v183
                * v187
                * (v180
                 + v183
                 * v187
                 * (v181 + v183 * v187 * (v184 + v185 * (v183 * v187) * (v183 * v187)) * (v183 * v187))
                 * (v183
                  * v187))
                * (v183
                 * v187))
               * (v183
                * v187)
               + 1.0)
              + -1.0)
             / (v183
              * v187
              * (v183
               * v187
               * (v183
                * v187
                * (v183
                 * v187
                 * (v183
                  * v187
                  * (v183 * v187 * (v183 * v187 * (v183 * v187 * (v185 * 11.0 * (v183 * v187)) + v184 * 9.0))
                   + v181 * 7.0))
                 + v180 * 5.0))
               + v182 * 3.0)
              * (v183
               * v187)
              + 1.0);
        double v189 = v188
             - (v188
              * (v183
               * v188
               * (v182
                + v183
                * v188
                * (v180
                 + v183
                 * v188
                 * (v181 + v183 * v188 * (v184 + v185 * (v183 * v188) * (v183 * v188)) * (v183 * v188))
                 * (v183
                  * v188))
                * (v183
                 * v188))
               * (v183
                * v188)
               + 1.0)
              + -1.0)
             / (v183
              * v188
              * (v183
               * v188
               * (v183
                * v188
                * (v183
                 * v188
                 * (v183
                  * v188
                  * (v183 * v188 * (v183 * v188 * (v183 * v188 * (v185 * 11.0 * (v183 * v188)) + v184 * 9.0))
                   + v181 * 7.0))
                 + v180 * 5.0))
               + v182 * 3.0)
              * (v183
               * v188)
              + 1.0);
        double v190 = v183 * v189;
        double v191 = v189
             - (v189
              * (v190
               * (v182 + v190 * (v180 + v190 * (v181 + v190 * (v184 + v185 * v190 * v190) * v190) * v190) * v190)
               * v190
               + 1.0)
              + -1.0)
             / (v190
              * (v190
               * (v190
                * (v190 * (v190 * (v190 * (v190 * (v190 * (v185 * 11.0 * v190) + v184 * 9.0)) + v181 * 7.0)) + v180 * 5.0))
               + v182 * 3.0)
              * v190
              + 1.0);
      }
      uint64_t v29 = 0;
      double sinval = v178 * v191;
      double v31 = v179 * v191;
      break;
    case 9:
      double v192 = *(double *)(a1 + 56);
      double v193 = *(double *)(a1 + 64);
      double v194 = *(double *)(a1 + 72);
      double v195 = *(double *)(a1 + 80);
      double v196 = *(double *)(a1 + 88);
      double cosval = 1.0;
      double v197 = v15 / (double)a2 - *(double *)(a1 + 24);
      long double v198 = tan(*(double *)(a1 + 8) * 0.5);
      double v199 = v197 * v198 + v197 * v198;
      double v200 = v16 / (double)a3 - *(double *)(a1 + 32);
      long double v201 = tan(*(double *)(a1 + 16) * 0.5);
      double v202 = v200 * v201 + v200 * v201;
      int v203 = 5;
      double v31 = v202;
      double sinval = v199;
      do
      {
        double v204 = v31 * v31;
        double v205 = sinval * sinval;
        double v206 = v31 * v31 + sinval * sinval;
        double v207 = v192 * v206 + 1.0 + v194 * v206 * v206 + v206 * (v193 * v206) * v206;
        double v208 = v205 * v205 + v31 * v31 * (sinval * sinval * 6.0 + v31 * v31 * 5.0);
        double v209 = v205 * (v205 * v205)
             + v31 * v31 * (v31 * v31 * (sinval * sinval * 15.0 + v31 * v31 * 7.0) + v205 * v205 * 9.0);
        double v210 = v199 - (v196 * (v206 + (sinval + sinval) * sinval) + (v195 + v195) * sinval * v31 + sinval * v207);
        double v211 = v202 - (v195 * (v206 + (v31 + v31) * v31) + (v196 + v196) * sinval * v31 + v31 * v207);
        double v212 = 0.0
             - (v192 * (v31 * v31 + sinval * sinval * 3.0)
              + 1.0
              + v194 * (v204 * v204 + sinval * sinval * (v31 * v31 * 6.0 + sinval * sinval * 5.0))
              + v193
              * (v204 * (v204 * v204)
               + sinval * sinval * (sinval * sinval * (v31 * v31 * 15.0 + sinval * sinval * 7.0) + v204 * v204 * 9.0))
              + (v196 * (sinval * 2.0 + 1.0) + v195 * v31) * 2.0);
        double v213 = 0.0
             - (v192 * (sinval * sinval + v31 * v31 * 3.0)
              + 1.0
              + v194 * v208
              + v193 * v209
              + (v195 * (v31 * 2.0 + 1.0) + v196 * sinval) * 2.0);
        double v214 = (v196 * v31 + v195 * sinval + v31 * sinval * (v192 + (v193 * 3.0 * v206 + v194 * 2.0) * v206)) * -2.0
             + 0.0;
        double v215 = v212 * v213 - v214 * v214;
        double sinval = sinval + (v214 * v211 - v213 * v210) / v215;
        double v31 = v31 + (v214 * v210 - v211 * v212) / v215;
        --v203;
      }
      while (v203);
      uint64_t v29 = 0;
      break;
    case 0xA:
      fisheye_kannala_inv(&cosval, &v256, &v255, v15, v16, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), (double)a2, (double)a3);
      uint64_t v29 = 0;
      double v31 = v255;
      double sinval = v256;
      break;
    case 0xB:
      double v69 = *(double *)(a1 + 24);
      double v70 = *(double *)(a1 + 32);
      double v71 = *(double *)(a1 + 48);
      double v253 = *(double *)(a1 + 40);
      double cosval = 1.0;
      double v72 = -(v69 - (v15 / (double)a2 + -0.5) * tan(*(double *)(a1 + 8) * 0.5) * 2.0);
      double v73 = -(v70 - (v16 / (double)a3 + -0.5) * tan(*(double *)(a1 + 16) * 0.5) * 2.0);
      double v74 = *(double *)(a1 + 56);
      double v75 = *(double *)(a1 + 64);
      double v76 = *(double *)(a1 + 72);
      double v77 = *(double *)(a1 + 80);
      double v78 = *(double *)(a1 + 88);
      double v79 = *(double *)(a1 + 96);
      double v80 = *(double *)(a1 + 104);
      if (v74 + 0.0 + v75 + v76 + v77 + v78 + v79 + v80 == 0.0)
      {
        double v87 = 1.0;
      }
      else
      {
        double v81 = sqrt(v72 * v72 + v73 * v73);
        double v82 = 1.0
            - (v81
             * (v74
              + v81
              * (v75 + v81 * (v76 + v81 * (v77 + v81 * (v78 + v81 * (v79 + v81 * v80 * v81) * v81) * v81) * v81) * v81)
              * v81)
             * v81
             + 1.0
             + -1.0)
            / (v81
             * (v81
              * (v81
               * (v81
                * (v81
                 * (v81
                  * (v81
                   * (v81 * (v81 * (v81 * (v81 * (v81 * (v81 * (v80 * 15.0)) + v79 * 13.0)) + v78 * 11.0)) + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * v81
             + 1.0);
        double v83 = v82
            - (v82
             * (v81
              * v82
              * (v74
               + v81
               * v82
               * (v75
                + v81
                * v82
                * (v76
                 + v81
                 * v82
                 * (v77
                  + v81 * v82 * (v78 + v81 * v82 * (v79 + v80 * (v81 * v82) * (v81 * v82)) * (v81 * v82)) * (v81 * v82))
                 * (v81
                  * v82))
                * (v81
                 * v82))
               * (v81
                * v82))
              * (v81
               * v82)
              + 1.0)
             + -1.0)
            / (v81
             * v82
             * (v81
              * v82
              * (v81
               * v82
               * (v81
                * v82
                * (v81
                 * v82
                 * (v81
                  * v82
                  * (v81
                   * v82
                   * (v81
                    * v82
                    * (v81
                     * v82
                     * (v81 * v82 * (v81 * v82 * (v81 * v82 * (v80 * 15.0 * (v81 * v82)) + v79 * 13.0)) + v78 * 11.0))
                    + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * (v81
              * v82)
             + 1.0);
        double v84 = v83
            - (v83
             * (v81
              * v83
              * (v74
               + v81
               * v83
               * (v75
                + v81
                * v83
                * (v76
                 + v81
                 * v83
                 * (v77
                  + v81 * v83 * (v78 + v81 * v83 * (v79 + v80 * (v81 * v83) * (v81 * v83)) * (v81 * v83)) * (v81 * v83))
                 * (v81
                  * v83))
                * (v81
                 * v83))
               * (v81
                * v83))
              * (v81
               * v83)
              + 1.0)
             + -1.0)
            / (v81
             * v83
             * (v81
              * v83
              * (v81
               * v83
               * (v81
                * v83
                * (v81
                 * v83
                 * (v81
                  * v83
                  * (v81
                   * v83
                   * (v81
                    * v83
                    * (v81
                     * v83
                     * (v81 * v83 * (v81 * v83 * (v81 * v83 * (v80 * 15.0 * (v81 * v83)) + v79 * 13.0)) + v78 * 11.0))
                    + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * (v81
              * v83)
             + 1.0);
        double v85 = v84
            - (v84
             * (v81
              * v84
              * (v74
               + v81
               * v84
               * (v75
                + v81
                * v84
                * (v76
                 + v81
                 * v84
                 * (v77
                  + v81 * v84 * (v78 + v81 * v84 * (v79 + v80 * (v81 * v84) * (v81 * v84)) * (v81 * v84)) * (v81 * v84))
                 * (v81
                  * v84))
                * (v81
                 * v84))
               * (v81
                * v84))
              * (v81
               * v84)
              + 1.0)
             + -1.0)
            / (v81
             * v84
             * (v81
              * v84
              * (v81
               * v84
               * (v81
                * v84
                * (v81
                 * v84
                 * (v81
                  * v84
                  * (v81
                   * v84
                   * (v81
                    * v84
                    * (v81
                     * v84
                     * (v81 * v84 * (v81 * v84 * (v81 * v84 * (v80 * 15.0 * (v81 * v84)) + v79 * 13.0)) + v78 * 11.0))
                    + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * (v81
              * v84)
             + 1.0);
        double v86 = v81 * v85;
        double v87 = v85
            - (v85
             * (v86
              * (v74
               + v86
               * (v75 + v86 * (v76 + v86 * (v77 + v86 * (v78 + v86 * (v79 + v80 * v86 * v86) * v86) * v86) * v86) * v86)
               * v86)
              * v86
              + 1.0)
             + -1.0)
            / (v86
             * (v86
              * (v86
               * (v86
                * (v86
                 * (v86
                  * (v86
                   * (v86 * (v86 * (v86 * (v86 * (v86 * (v80 * 15.0 * v86) + v79 * 13.0)) + v78 * 11.0)) + v77 * 9.0))
                  + v76 * 7.0))
                + v75 * 5.0))
              + v74 * 3.0)
             * v86
             + 1.0);
      }
      uint64_t v29 = 0;
      double sinval = v72 * v87 - v253;
      double v31 = v73 * v87 - v71;
      break;
    case 0xF:
      double v88 = *(double *)(a1 + 24);
      double v89 = *(double *)(a1 + 32);
      uint64_t v90 = a1 + 56;
      double v91 = *(double *)(a1 + 8);
      double v92 = tan(v91 * 0.5);
      double v93 = 1.0;
      double v94 = v15 - (v88 + 1.0) * (double)a2 * 0.5;
      double v95 = (v94 + v94) / (double)a2;
      double v96 = v16 - (v89 + 1.0) * (double)a3 * 0.5;
      double v97 = (v96 + v96) / (double)a2 / (*(double *)(a1 + 16) / v91);
      double v98 = sqrt(v97 * v97 + v95 * v95);
      int v99 = (int)(v98 / 0.128564869);
      if (v99 >= 10) {
        int v99 = 10;
      }
      double v100 = v98 / 0.128564869 - (double)v99;
      uint64_t v101 = (double *)(v90 + 8 * v99);
      double v102 = v101[1];
      double v103 = (1.0 - v100) * *v101 + 1.0 + v100 * v102;
      double v104 = 1.0 - (v103 + -1.0) / ((v102 - *v101) * v98 / 0.128564869 + v103);
      double v105 = v98 * v104;
      double v106 = 1.0;
      double v107 = 1.0;
      if (v98 * v104 >= 0.0)
      {
        if ((int)(v105 / 0.128564869) >= 10) {
          int v108 = 10;
        }
        else {
          int v108 = (int)(v105 / 0.128564869);
        }
        double v109 = v105 / 0.128564869 - (double)v108;
        uint64_t v110 = (double *)(v90 + 8 * v108);
        double v111 = v110[1];
        double v107 = (1.0 - v109) * *v110 + 1.0 + v109 * v111;
        double v106 = v107 + v105 * (v111 - *v110) / 0.128564869;
      }
      double v112 = v104 - (v104 * v107 + -1.0) / v106;
      double v113 = v98 * v112;
      double v114 = 1.0;
      if (v98 * v112 >= 0.0)
      {
        int v115 = (int)(v113 / 0.128564869);
        if (v115 >= 10) {
          int v115 = 10;
        }
        double v116 = v113 / 0.128564869 - (double)v115;
        uint64_t v117 = (double *)(v90 + 8 * v115);
        double v118 = v117[1];
        double v114 = (1.0 - v116) * *v117 + 1.0 + v116 * v118;
        double v93 = v114 + v113 * (v118 - *v117) / 0.128564869;
      }
      double v119 = v112 - (v112 * v114 + -1.0) / v93;
      double v120 = v98 * v119;
      double v121 = 1.0;
      double v122 = 1.0;
      double v123 = 1.0;
      if (v98 * v119 >= 0.0)
      {
        int v124 = (int)(v120 / 0.128564869);
        if (v124 >= 10) {
          int v124 = 10;
        }
        double v125 = v120 / 0.128564869 - (double)v124;
        v126 = (double *)(v90 + 8 * v124);
        double v127 = v126[1];
        double v123 = (1.0 - v125) * *v126 + 1.0 + v125 * v127;
        double v122 = v123 + v120 * (v127 - *v126) / 0.128564869;
      }
      double v128 = v119 - (v119 * v123 + -1.0) / v122;
      double v129 = v98 * v128;
      double v130 = 1.0;
      if (v129 >= 0.0)
      {
        int v131 = (int)(v129 / 0.128564869);
        if (v131 >= 10) {
          int v131 = 10;
        }
        double v132 = v129 / 0.128564869 - (double)v131;
        int v133 = (double *)(v90 + 8 * v131);
        double v134 = v133[1];
        double v130 = (1.0 - v132) * *v133 + 1.0 + v132 * v134;
        double v121 = v130 + v129 * (v134 - *v133) / 0.128564869;
      }
      uint64_t v29 = 0;
      double v135 = v128 - (v128 * v130 + -1.0) / v121;
      double v136 = 1.0 / v92;
      double cosval = 1.0;
      double sinval = v95 * v135 / v136;
      double v31 = v97 * v135 / v136;
      break;
    default:
      if (v8 >= 0xFFFFFFFD)
      {
        unsigned int v231 = *(_DWORD *)a1 - 12;
        if (v231 >= 3) {
          __assert_rtn("g_proj_bspline_cnt", "g_camera.c", 924, "0 && \"Not a spline based camera model.\"");
        }
        unint64_t v232 = dword_21BB7CE48[v231];
        double v233 = *(double *)(a1 + 24);
        double v234 = *(double *)(a1 + 32);
        double v235 = *(double *)(a1 + 8);
        double v236 = 1.0 / tan(v235 * 0.5);
        double v237 = v15 - (v233 + 1.0) * (double)a2 * 0.5;
        double v238 = (v237 + v237) / (double)a2;
        double v239 = v16 - (v234 + 1.0) * (double)a3 * 0.5;
        double v240 = (v239 + v239) / (double)a2 / (*(double *)(a1 + 16) / v235);
        if (*(double *)(a1 + 56) == 0.0)
        {
          unint64_t v251 = 0;
          while (v232 - 1 != v251)
          {
            double v252 = *(double *)(a1 + 64 + 8 * v251++);
            if (v252 != 0.0)
            {
              if (v251 < v232) {
                goto LABEL_76;
              }
              break;
            }
          }
        }
        else
        {
LABEL_76:
          double v241 = sqrt(v240 * v240 + v238 * v238);
          double v258 = 0.0;
          double v254 = v238;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v241 * 0.707106781, 0.0, 0.0);
          double v243 = 1.0 - (v242 + 1.0 + -1.0) / (v242 + 1.0 + v241 * v258);
          double v258 = 0.0;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v241 * v243 * 0.707106781, 0.0, 0.0);
          double v245 = v243 - (v243 * (v244 + 1.0) + -1.0) / (v244 + 1.0 + v241 * v243 * v258);
          double v258 = 0.0;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v241 * v245 * 0.707106781, 0.0, 0.0);
          double v247 = v245 - (v245 * (v246 + 1.0) + -1.0) / (v246 + 1.0 + v241 * v245 * v258);
          double v258 = 0.0;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v241 * v247 * 0.707106781, 0.0, 0.0);
          double v249 = v241 * (v247 - (v247 * (v248 + 1.0) + -1.0) / (v248 + 1.0 + v241 * v247 * v258));
          double v258 = 0.0;
          g_interp_bspline3_mix2(v232, (double *)(a1 + 56), &v258, 0, 1, v249 * 0.707106781, 0.0, 0.0);
          double v238 = v254;
        }
        uint64_t v29 = 0;
        double cosval = 1.0;
        double sinval = v238 / v236;
        double v31 = v240 / v236;
      }
      else
      {
        printf("Unsupported projection type (%d)\n", *(_DWORD *)a1);
        double cosval = 0.0;
        uint64_t v29 = 1;
        double v31 = 0.0;
        double sinval = 0.0;
      }
      break;
  }
  *a4 = cosval;
  *a5 = sinval;
  *a6 = v31;
  return v29;
}

double fisheye_kannala_inv(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17)
{
  double v25 = (a4 / a16 + -0.5 - a12) * a10;
  double v26 = (a5 / a17 + -0.5 - a13) * a11;
  double v27 = sqrt(v26 * v26 + v25 * v25);
  double v28 = v27 * v27;
  double v29 = v28 * v28;
  double v30 = 1.0
      - (a6 * (v27 * v27) + 1.0 + a7 * (v28 * v28) + a8 * (v28 * (v28 * v28)) + a9 * (v29 * v29) + -1.0)
      / (a6 * 3.0 * (v27 * v27) + 1.0 + a7 * 5.0 * (v28 * v28) + a8 * 7.0 * (v28 * (v28 * v28)) + a9 * 9.0 * (v29 * v29));
  double v31 = v27 * v30 * (v27 * v30);
  double v32 = v31 * v31;
  double v33 = v30
      - (v30 * (a6 * v31 + 1.0 + a7 * (v31 * v31) + a8 * (v31 * (v31 * v31)) + a9 * (v32 * v32)) + -1.0)
      / (a6 * 3.0 * v31 + 1.0 + a7 * 5.0 * (v31 * v31) + a8 * 7.0 * (v31 * (v31 * v31)) + a9 * 9.0 * (v32 * v32));
  double v34 = v27 * v33 * (v27 * v33);
  double v35 = v34 * v34;
  double v36 = v33
      - (v33 * (a6 * v34 + 1.0 + a7 * (v34 * v34) + a8 * (v34 * (v34 * v34)) + a9 * (v35 * v35)) + -1.0)
      / (a6 * 3.0 * v34 + 1.0 + a7 * 5.0 * (v34 * v34) + a8 * 7.0 * (v34 * (v34 * v34)) + a9 * 9.0 * (v35 * v35));
  double v37 = v27 * v36 * (v27 * v36);
  double v38 = v37 * v37;
  double v39 = v36
      - (v36 * (a6 * v37 + 1.0 + a7 * (v37 * v37) + a8 * (v37 * (v37 * v37)) + a9 * (v38 * v38)) + -1.0)
      / (a6 * 3.0 * v37 + 1.0 + a7 * 5.0 * (v37 * v37) + a8 * 7.0 * (v37 * (v37 * v37)) + a9 * 9.0 * (v38 * v38));
  double v40 = v27 * v39 * (v27 * v39);
  double v41 = v40 * v40;
  double v42 = v39
      - (v39 * (a6 * v40 + 1.0 + a7 * (v40 * v40) + a8 * (v40 * (v40 * v40)) + a9 * (v41 * v41)) + -1.0)
      / (a6 * 3.0 * v40 + 1.0 + a7 * 5.0 * (v40 * v40) + a8 * 7.0 * (v40 * (v40 * v40)) + a9 * 9.0 * (v41 * v41));
  double v43 = v27 * v42 * (v27 * v42);
  double v44 = v43 * v43;
  double v45 = v42
      - (v42 * (a6 * v43 + 1.0 + a7 * (v43 * v43) + a8 * (v43 * (v43 * v43)) + a9 * (v44 * v44)) + -1.0)
      / (a6 * 3.0 * v43 + 1.0 + a7 * 5.0 * (v43 * v43) + a8 * 7.0 * (v43 * (v43 * v43)) + a9 * 9.0 * (v44 * v44));
  double v46 = v27 * v45 * (v27 * v45);
  double v47 = v46 * v46;
  double v48 = v45
      - (v45 * (a6 * v46 + 1.0 + a7 * (v46 * v46) + a8 * (v46 * (v46 * v46)) + a9 * (v47 * v47)) + -1.0)
      / (a6 * 3.0 * v46 + 1.0 + a7 * 5.0 * (v46 * v46) + a8 * 7.0 * (v46 * (v46 * v46)) + a9 * 9.0 * (v47 * v47));
  double v49 = v27 * v48 * (v27 * v48);
  double v50 = v49 * v49;
  double v51 = v48
      - (v48 * (a6 * v49 + 1.0 + a7 * (v49 * v49) + a8 * (v49 * (v49 * v49)) + a9 * (v50 * v50)) + -1.0)
      / (a6 * 3.0 * v49 + 1.0 + a7 * 5.0 * (v49 * v49) + a8 * 7.0 * (v49 * (v49 * v49)) + a9 * 9.0 * (v50 * v50));
  double v52 = v27 * v51 * (v27 * v51);
  double v53 = v52 * v52;
  double v54 = v51
      - (v51 * (a6 * v52 + 1.0 + a7 * (v52 * v52) + a8 * (v52 * (v52 * v52)) + a9 * (v53 * v53)) + -1.0)
      / (a6 * 3.0 * v52 + 1.0 + a7 * 5.0 * (v52 * v52) + a8 * 7.0 * (v52 * (v52 * v52)) + a9 * 9.0 * (v53 * v53));
  double v55 = v27 * v54 * (v27 * v54);
  double v56 = v26 / (v27 + 1.0e-20);
  double v57 = v25 / (v27 + 1.0e-20);
  __double2 v58 = __sincos_stret(v27* (v54- (v54 * (a6 * v55 + 1.0 + a7 * (v55 * v55) + a8 * (v55 * (v55 * v55)) + a9 * (v55 * v55 * (v55 * v55))) + -1.0)/ (a6 * 3.0 * v55+ 1.0+ a7 * 5.0 * (v55 * v55)+ a8 * 7.0 * (v55 * (v55 * v55))+ a9 * 9.0 * (v55 * v55 * (v55 * v55)))));
  *a2 = v57 * v58.__sinval;
  *a3 = v56 * v58.__sinval;
  *a1 = v58.__cosval;
  *a2 = *a2 / v58.__cosval - a14;
  *a3 = *a3 / *a1 - a15;
  *a1 = 1.0;
  double v59 = 1.0 / sqrt(*a2 * *a2 + 1.0 + *a3 * *a3);
  *a2 = *a2 * v59;
  *a3 = *a3 * v59;
  double result = *a1 * v59;
  *a1 = result;
  return result;
}

void g_improj2_to_xyz(uint64_t a1, float64x2_t *a2, double *a3)
{
  double v218 = 0.0;
  double v219 = 0.0;
  double cosval = 0.0;
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t v11 = vaddq_f64(*a2, _Q1);
  switch(*(_DWORD *)a1)
  {
    case 0:
      double cosval = 1.0;
      uint64_t v12 = *(void *)(a1 + 168);
      v13.i64[0] = (int)v12;
      v13.i64[1] = SHIDWORD(v12);
      __asm { FMOV            V1.2D, #-0.5 }
      _Q0 = vsubq_f64(vdivq_f64(vmlaq_f64(v11, _Q1, vcvtq_f64_s64(v13)), *(float64x2_t *)(a1 + 8)), *(float64x2_t *)(a1 + 40));
      double v16 = *(double *)(a1 + 72);
      double v17 = *(double *)(a1 + 80);
      double v18 = *(double *)(a1 + 88);
      if (v16 != 0.0 || v17 != 0.0 || v18 != 0.0)
      {
        _D5 = _Q0.f64[1];
        __asm { FMLA            D4, D5, V0.D[1] }
        double v21 = sqrt(_D4);
        double v22 = 1.0
            - (v21 * (v16 + (v17 + v18 * v21) * v21) * v21 + 1.0 + -1.0)
            / (v21 * (v21 * (v21 * (v18 * 5.0) + v17 * 4.0) + v16 * 3.0) * v21 + 1.0);
        double v23 = v22
            - (v22 * (v21 * v22 * (v16 + (v17 + v18 * (v21 * v22)) * (v21 * v22)) * (v21 * v22) + 1.0) + -1.0)
            / (v21 * v22 * (v21 * v22 * (v18 * 5.0 * (v21 * v22) + v17 * 4.0) + v16 * 3.0) * (v21 * v22) + 1.0);
        double v24 = v23
            - (v23 * (v21 * v23 * (v16 + (v17 + v18 * (v21 * v23)) * (v21 * v23)) * (v21 * v23) + 1.0) + -1.0)
            / (v21 * v23 * (v21 * v23 * (v18 * 5.0 * (v21 * v23) + v17 * 4.0) + v16 * 3.0) * (v21 * v23) + 1.0);
        double v25 = v24
            - (v24 * (v21 * v24 * (v16 + (v17 + v18 * (v21 * v24)) * (v21 * v24)) * (v21 * v24) + 1.0) + -1.0)
            / (v21 * v24 * (v21 * v24 * (v18 * 5.0 * (v21 * v24) + v17 * 4.0) + v16 * 3.0) * (v21 * v24) + 1.0);
        double v26 = v21 * v25;
        _Q0 = vmulq_n_f64(_Q0, v25- (v25 * (v26 * (v16 + (v17 + v18 * v26) * v26) * v26 + 1.0) + -1.0)/ (v26 * (v26 * (v18 * 5.0 * v26 + v17 * 4.0) + v16 * 3.0) * v26 + 1.0));
      }
      double v27 = _Q0.f64[0] - *(double *)(a1 + 56);
      double sinval = _Q0.f64[1] - *(double *)(a1 + 64);
      goto LABEL_54;
    case 1:
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/base/g_camera.c", 1979, (uint64_t)"g_improj2_to_xyz", "TODO: implement this projection type");
      abort();
    case 2:
      double v29 = -(*(double *)(a1 + 48) - (v11.f64[1] / (double)*(int *)(a1 + 172) + -0.5) * *(double *)(a1 + 32));
      __double2 v30 = __sincos_stret(-(*(double *)(a1 + 40)
                           - (v11.f64[0] / (double)*(int *)(a1 + 168) + -0.5) * *(double *)(a1 + 24)));
      __double2 v31 = __sincos_stret(v29);
      double sinval = v31.__sinval;
      double cosval = v30.__cosval * v31.__cosval;
      double v27 = v30.__sinval * v31.__cosval;
      goto LABEL_54;
    case 3:
      double cosval = 1.0;
      float64_t v32 = (v11.f64[0] + (double)*(int *)(a1 + 168) * -0.5) / *(double *)(a1 + 8) - *(double *)(a1 + 40);
      float64_t v33 = (v11.f64[1] + (double)*(int *)(a1 + 172) * -0.5) / *(double *)(a1 + 16) - *(double *)(a1 + 48);
      double v34 = sqrt(v32 * v32 + v33 * v33);
      double v35 = *(double *)(a1 + 72);
      double v36 = *(double *)(a1 + 80);
      double v37 = *(double *)(a1 + 88);
      double v38 = 1.0
          - (v34 * (v35 + (v36 + v37 * v34) * v34) * v34 + 1.0 + -1.0)
          / (v34 * (v34 * (v34 * (v37 * 5.0) + v36 * 4.0) + v35 * 3.0) * v34 + 1.0);
      double v39 = v38
          - (v38 * (v34 * v38 * (v35 + (v36 + v37 * (v34 * v38)) * (v34 * v38)) * (v34 * v38) + 1.0) + -1.0)
          / (v34 * v38 * (v34 * v38 * (v37 * 5.0 * (v34 * v38) + v36 * 4.0) + v35 * 3.0) * (v34 * v38) + 1.0);
      double v40 = v39
          - (v39 * (v34 * v39 * (v35 + (v36 + v37 * (v34 * v39)) * (v34 * v39)) * (v34 * v39) + 1.0) + -1.0)
          / (v34 * v39 * (v34 * v39 * (v37 * 5.0 * (v34 * v39) + v36 * 4.0) + v35 * 3.0) * (v34 * v39) + 1.0);
      double v41 = v40
          - (v40 * (v34 * v40 * (v35 + (v36 + v37 * (v34 * v40)) * (v34 * v40)) * (v34 * v40) + 1.0) + -1.0)
          / (v34 * v40 * (v34 * v40 * (v37 * 5.0 * (v34 * v40) + v36 * 4.0) + v35 * 3.0) * (v34 * v40) + 1.0);
      double v42 = v34 * v41;
      double v43 = v41
          - (v41 * (v42 * (v35 + (v36 + v37 * v42) * v42) * v42 + 1.0) + -1.0)
          / (v42 * (v42 * (v37 * 5.0 * v42 + v36 * 4.0) + v35 * 3.0) * v42 + 1.0);
      double v44 = v32 * v43 - *(double *)(a1 + 56);
      double v45 = v33 * v43 - *(double *)(a1 + 64);
      double v46 = fmin(sqrt(v44 * v44 + v45 * v45), 1.57079319);
      double v47 = 0.0;
      if (v46 != 0.0) {
        double v47 = tan(v46) / v46;
      }
      double v27 = v44 * v47;
      double sinval = v45 * v47;
      goto LABEL_54;
    case 4:
      double cosval = 1.0;
      double v27 = (v11.f64[0] + (double)*(int *)(a1 + 168) * -0.5) / *(double *)(a1 + 8);
      double sinval = (v11.f64[1] + (double)*(int *)(a1 + 172) * -0.5) / *(double *)(a1 + 16);
      goto LABEL_54;
    case 5:
      double v48 = *(double *)(a1 + 24) * (v11.f64[0] / (double)*(int *)(a1 + 168) + -0.5 - *(double *)(a1 + 40));
      double v49 = *(double *)(a1 + 32) * (v11.f64[1] / (double)*(int *)(a1 + 172) + -0.5 - *(double *)(a1 + 48));
      double v50 = sqrt(v48 * v48 + v49 * v49);
      double v51 = v48 / (v50 + 1.0e-20);
      double v52 = *(double *)(a1 + 72);
      double v53 = *(double *)(a1 + 80);
      double v54 = *(double *)(a1 + 88);
      double v55 = 1.0
          - (v50 * (v52 + (v53 + v54 * v50) * v50) * v50 + 1.0 + -1.0)
          / (v50 * (v50 * (v54 * 5.0 * v50 + v53 * 4.0) + v52 * 3.0) * v50 + 1.0);
      double v56 = v55
          - (v55 * (v50 * v55 * (v52 + (v53 + v54 * (v50 * v55)) * (v50 * v55)) * (v50 * v55) + 1.0) + -1.0)
          / (v50 * v55 * (v50 * v55 * (v54 * 5.0 * (v50 * v55) + v53 * 4.0) + v52 * 3.0) * (v50 * v55) + 1.0);
      double v57 = v56
          - (v56 * (v50 * v56 * (v52 + (v53 + v54 * (v50 * v56)) * (v50 * v56)) * (v50 * v56) + 1.0) + -1.0)
          / (v50 * v56 * (v50 * v56 * (v54 * 5.0 * (v50 * v56) + v53 * 4.0) + v52 * 3.0) * (v50 * v56) + 1.0);
      double v58 = v57
          - (v57 * (v50 * v57 * (v52 + (v53 + v54 * (v50 * v57)) * (v50 * v57)) * (v50 * v57) + 1.0) + -1.0)
          / (v50 * v57 * (v50 * v57 * (v54 * 5.0 * (v50 * v57) + v53 * 4.0) + v52 * 3.0) * (v50 * v57) + 1.0);
      double v59 = v49 / (v50 + 1.0e-20);
      __double2 v60 = __sincos_stret(v50* (v58- (v58 * (v50 * v58 * (v52 + (v53 + v54 * (v50 * v58)) * (v50 * v58)) * (v50 * v58) + 1.0) + -1.0)/ (v50 * v58 * (v50 * v58 * (v54 * 5.0 * (v50 * v58) + v53 * 4.0) + v52 * 3.0) * (v50 * v58) + 1.0)));
      double v27 = v51 * v60.__sinval;
      double sinval = v59 * v60.__sinval;
      double cosval = v60.__cosval;
      goto LABEL_54;
    case 6:
      double v61 = *(double *)(a1 + 72);
      double v62 = *(double *)(a1 + 80);
      double v63 = *(double *)(a1 + 88);
      double v64 = *(double *)(a1 + 40) * 0.000001;
      double v65 = *(double *)(a1 + 48) * 0.000001;
      double cosval = 1.0;
      float64_t v66 = v11.f64[0] / (double)*(int *)(a1 + 168) + -0.5;
      double v216 = v11.f64[1];
      long double v67 = tan(*(double *)(a1 + 24) * 0.5);
      double v68 = v67 * v66 + v67 * v66;
      double v69 = v216 / (double)*(int *)(a1 + 172) + -0.5;
      long double v70 = tan(*(double *)(a1 + 32) * 0.5);
      double v71 = v70 * v69 + v70 * v69;
      int v72 = 5;
      double v73 = v71;
      double v74 = v68;
      do
      {
        double v75 = v73 * v73;
        double v76 = v74 * v74;
        double v77 = v73 * v73 + v74 * v74;
        double v78 = v61 * v77 + 1.0 + v62 * v77 * v77 + v77 * (v63 * v77) * v77;
        double v79 = v76 * v76 + v73 * v73 * (v74 * v74 * 6.0 + v73 * v73 * 5.0);
        double v80 = v76 * (v76 * v76) + v73 * v73 * (v73 * v73 * (v74 * v74 * 15.0 + v73 * v73 * 7.0) + v76 * v76 * 9.0);
        double v81 = v68 - (v65 * (v77 + v74 * 2.0) + (v64 + v64) * v74 * v73 + v74 * v78);
        double v82 = v71 - (v64 * (v77 + v73 * 2.0) + (v65 + v65) * v74 * v73 + v73 * v78);
        double v83 = 0.0
            - (v61 * (v73 * v73 + v74 * v74 * 3.0)
             + 1.0
             + v62 * (v75 * v75 + v74 * v74 * (v73 * v73 * 6.0 + v74 * v74 * 5.0))
             + v63
             * (v75 * (v75 * v75) + v74 * v74 * (v74 * v74 * (v73 * v73 * 15.0 + v74 * v74 * 7.0) + v75 * v75 * 9.0))
             + (v65 * (v74 + 1.0) + v64 * v73) * 2.0);
        double v84 = 0.0
            - (v61 * (v74 * v74 + v73 * v73 * 3.0)
             + 1.0
             + v62 * v79
             + v63 * v80
             + (v64 * (v73 + 1.0) + v65 * v74) * 2.0);
        double v85 = (v65 * v73 + v64 * v74 + v73 * v74 * (v61 + (v63 * 3.0 * v77 + v62 * 2.0) * v77)) * -2.0 + 0.0;
        double v86 = v83 * v84 - v85 * v85;
        double v74 = v74 + (v85 * v82 - v84 * v81) / v86;
        double v73 = v73 + (v85 * v81 - v82 * v83) / v86;
        --v72;
      }
      while (v72);
      double v27 = v74 - *(double *)(a1 + 56);
      double sinval = v73 - *(double *)(a1 + 64);
      goto LABEL_54;
    case 8:
      int v107 = *(_DWORD *)(a1 + 172);
      double v108 = *(double *)(a1 + 16);
      float64_t v109 = (v11.f64[0] + (double)*(int *)(a1 + 168) * -0.5) / *(double *)(a1 + 8);
      double cosval = 1.0;
      double v27 = v109 - *(double *)(a1 + 40);
      double sinval = (v11.f64[1] + (double)v107 * -0.5) / v108 - *(double *)(a1 + 48);
      double v111 = *(double *)(a1 + 80);
      double v110 = *(double *)(a1 + 88);
      double v112 = *(double *)(a1 + 72);
      if (v112 != 0.0 || v110 != 0.0 || v111 != 0.0 || *(double *)(a1 + 56) != 0.0 || *(double *)(a1 + 64) != 0.0)
      {
        double v113 = sqrt(v27 * v27 + sinval * sinval);
        double v114 = *(double *)(a1 + 56);
        double v115 = *(double *)(a1 + 64);
        double v116 = 1.0
             - (v113
              * (v112 + v113 * (v110 + v113 * (v111 + v113 * (v114 + v113 * v115 * v113) * v113) * v113) * v113)
              * v113
              + 1.0
              + -1.0)
             / (v113
              * (v113
               * (v113
                * (v113 * (v113 * (v113 * (v113 * (v113 * (v113 * (v115 * 11.0)) + v114 * 9.0)) + v111 * 7.0))
                 + v110 * 5.0))
               + v112 * 3.0)
              * v113
              + 1.0);
        double v117 = v116
             - (v116
              * (v113
               * v116
               * (v112
                + v113
                * v116
                * (v110
                 + v113
                 * v116
                 * (v111 + v113 * v116 * (v114 + v115 * (v113 * v116) * (v113 * v116)) * (v113 * v116))
                 * (v113
                  * v116))
                * (v113
                 * v116))
               * (v113
                * v116)
               + 1.0)
              + -1.0)
             / (v113
              * v116
              * (v113
               * v116
               * (v113
                * v116
                * (v113
                 * v116
                 * (v113
                  * v116
                  * (v113 * v116 * (v113 * v116 * (v113 * v116 * (v115 * 11.0 * (v113 * v116)) + v114 * 9.0))
                   + v111 * 7.0))
                 + v110 * 5.0))
               + v112 * 3.0)
              * (v113
               * v116)
              + 1.0);
        double v118 = v117
             - (v117
              * (v113
               * v117
               * (v112
                + v113
                * v117
                * (v110
                 + v113
                 * v117
                 * (v111 + v113 * v117 * (v114 + v115 * (v113 * v117) * (v113 * v117)) * (v113 * v117))
                 * (v113
                  * v117))
                * (v113
                 * v117))
               * (v113
                * v117)
               + 1.0)
              + -1.0)
             / (v113
              * v117
              * (v113
               * v117
               * (v113
                * v117
                * (v113
                 * v117
                 * (v113
                  * v117
                  * (v113 * v117 * (v113 * v117 * (v113 * v117 * (v115 * 11.0 * (v113 * v117)) + v114 * 9.0))
                   + v111 * 7.0))
                 + v110 * 5.0))
               + v112 * 3.0)
              * (v113
               * v117)
              + 1.0);
        double v119 = v118
             - (v118
              * (v113
               * v118
               * (v112
                + v113
                * v118
                * (v110
                 + v113
                 * v118
                 * (v111 + v113 * v118 * (v114 + v115 * (v113 * v118) * (v113 * v118)) * (v113 * v118))
                 * (v113
                  * v118))
                * (v113
                 * v118))
               * (v113
                * v118)
               + 1.0)
              + -1.0)
             / (v113
              * v118
              * (v113
               * v118
               * (v113
                * v118
                * (v113
                 * v118
                 * (v113
                  * v118
                  * (v113 * v118 * (v113 * v118 * (v113 * v118 * (v115 * 11.0 * (v113 * v118)) + v114 * 9.0))
                   + v111 * 7.0))
                 + v110 * 5.0))
               + v112 * 3.0)
              * (v113
               * v118)
              + 1.0);
        double v120 = v113 * v119;
        double v121 = v119
             - (v119
              * (v120
               * (v112 + v120 * (v110 + v120 * (v111 + v120 * (v114 + v115 * v120 * v120) * v120) * v120) * v120)
               * v120
               + 1.0)
              + -1.0)
             / (v120
              * (v120
               * (v120
                * (v120 * (v120 * (v120 * (v120 * (v120 * (v115 * 11.0 * v120) + v114 * 9.0)) + v111 * 7.0)) + v110 * 5.0))
               + v112 * 3.0)
              * v120
              + 1.0);
        double v27 = v27 * v121;
        double sinval = sinval * v121;
      }
      goto LABEL_54;
    case 9:
      double v122 = *(double *)(a1 + 72);
      double v123 = *(double *)(a1 + 80);
      double v124 = *(double *)(a1 + 88);
      double v125 = *(double *)(a1 + 96);
      double v126 = *(double *)(a1 + 104);
      double cosval = 1.0;
      float64_t v127 = v11.f64[0] / (double)*(int *)(a1 + 168) - *(double *)(a1 + 40);
      double v217 = v11.f64[1];
      long double v128 = tan(*(double *)(a1 + 24) * 0.5);
      double v129 = v127 * v128 + v127 * v128;
      double v130 = v217 / (double)*(int *)(a1 + 172) - *(double *)(a1 + 48);
      long double v131 = tan(*(double *)(a1 + 32) * 0.5);
      double v132 = v130 * v131 + v130 * v131;
      int v133 = 5;
      double sinval = v132;
      double v27 = v129;
      do
      {
        double v134 = sinval * sinval;
        double v135 = v27 * v27;
        double v136 = sinval * sinval + v27 * v27;
        double v137 = v122 * v136 + 1.0 + v124 * v136 * v136 + v136 * (v123 * v136) * v136;
        double v138 = v135 * v135 + sinval * sinval * (v27 * v27 * 6.0 + sinval * sinval * 5.0);
        double v139 = v135 * (v135 * v135)
             + sinval * sinval * (sinval * sinval * (v27 * v27 * 15.0 + sinval * sinval * 7.0) + v135 * v135 * 9.0);
        double v140 = v129 - (v126 * (v136 + (v27 + v27) * v27) + (v125 + v125) * v27 * sinval + v27 * v137);
        double v141 = v132 - (v125 * (v136 + (sinval + sinval) * sinval) + (v126 + v126) * v27 * sinval + sinval * v137);
        double v142 = 0.0
             - (v122 * (sinval * sinval + v27 * v27 * 3.0)
              + 1.0
              + v124 * (v134 * v134 + v27 * v27 * (sinval * sinval * 6.0 + v27 * v27 * 5.0))
              + v123
              * (v134 * (v134 * v134)
               + v27 * v27 * (v27 * v27 * (sinval * sinval * 15.0 + v27 * v27 * 7.0) + v134 * v134 * 9.0))
              + (v126 * (v27 * 2.0 + 1.0) + v125 * sinval) * 2.0);
        double v143 = 0.0
             - (v122 * (v27 * v27 + sinval * sinval * 3.0)
              + 1.0
              + v124 * v138
              + v123 * v139
              + (v125 * (sinval * 2.0 + 1.0) + v126 * v27) * 2.0);
        double v144 = (v126 * sinval + v125 * v27 + sinval * v27 * (v122 + (v123 * 3.0 * v136 + v124 * 2.0) * v136)) * -2.0
             + 0.0;
        double v145 = v142 * v143 - v144 * v144;
        double v27 = v27 + (v144 * v141 - v143 * v140) / v145;
        double sinval = sinval + (v144 * v140 - v141 * v142) / v145;
        --v133;
      }
      while (v133);
      goto LABEL_54;
    case 0xA:
      fisheye_kannala_inv(&cosval, &v219, &v218, v11.f64[0], v11.f64[1], *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 24), *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), (double)*(int *)(a1 + 168), (double)*(int *)(a1 + 172));
      double sinval = v218;
      double v27 = v219;
      goto LABEL_54;
    case 0xB:
      double v147 = *(double *)(a1 + 56);
      double v146 = *(double *)(a1 + 64);
      double cosval = 1.0;
      uint64_t v148 = *(void *)(a1 + 168);
      v149.i64[0] = (int)v148;
      v149.i64[1] = SHIDWORD(v148);
      __asm { FMOV            V4.2D, #-0.5 }
      _Q3 = vsubq_f64(vdivq_f64(vmlaq_f64(v11, _Q4, vcvtq_f64_s64(v149)), *(float64x2_t *)(a1 + 8)), *(float64x2_t *)(a1 + 40));
      double v152 = *(double *)(a1 + 72);
      double v153 = *(double *)(a1 + 80);
      double v154 = *(double *)(a1 + 88);
      double v155 = *(double *)(a1 + 96);
      double v156 = *(double *)(a1 + 104);
      double v157 = *(double *)(a1 + 112);
      double v158 = *(double *)(a1 + 120);
      if (v152 + 0.0 + v153 + v154 + v155 + v156 + v157 + v158 != 0.0)
      {
        _D18 = _Q3.f64[1];
        __asm { FMLA            D17, D18, V3.D[1] }
        double v161 = sqrt(_D17);
        double v162 = 1.0
             - (v161
              * (v152
               + v161
               * (v153
                + v161
                * (v154 + v161 * (v155 + v161 * (v156 + v161 * (v157 + v161 * v158 * v161) * v161) * v161) * v161)
                * v161)
               * v161)
              * v161
              + 1.0
              + -1.0)
             / (v161
              * (v161
               * (v161
                * (v161
                 * (v161
                  * (v161
                   * (v161
                    * (v161 * (v161 * (v161 * (v161 * (v161 * (v161 * (v158 * 15.0)) + v157 * 13.0)) + v156 * 11.0))
                     + v155 * 9.0))
                   + v154 * 7.0))
                 + v153 * 5.0))
               + v152 * 3.0)
              * v161
              + 1.0);
        double v163 = v162
             - (v162
              * (v161
               * v162
               * (v152
                + v161
                * v162
                * (v153
                 + v161
                 * v162
                 * (v154
                  + v161
                  * v162
                  * (v155
                   + v161
                   * v162
                   * (v156 + v161 * v162 * (v157 + v158 * (v161 * v162) * (v161 * v162)) * (v161 * v162))
                   * (v161
                    * v162))
                  * (v161
                   * v162))
                 * (v161
                  * v162))
                * (v161
                 * v162))
               * (v161
                * v162)
               + 1.0)
              + -1.0)
             / (v161
              * v162
              * (v161
               * v162
               * (v161
                * v162
                * (v161
                 * v162
                 * (v161
                  * v162
                  * (v161
                   * v162
                   * (v161
                    * v162
                    * (v161
                     * v162
                     * (v161
                      * v162
                      * (v161 * v162 * (v161 * v162 * (v161 * v162 * (v158 * 15.0 * (v161 * v162)) + v157 * 13.0))
                       + v156 * 11.0))
                     + v155 * 9.0))
                   + v154 * 7.0))
                 + v153 * 5.0))
               + v152 * 3.0)
              * (v161
               * v162)
              + 1.0);
        double v164 = v163
             - (v163
              * (v161
               * v163
               * (v152
                + v161
                * v163
                * (v153
                 + v161
                 * v163
                 * (v154
                  + v161
                  * v163
                  * (v155
                   + v161
                   * v163
                   * (v156 + v161 * v163 * (v157 + v158 * (v161 * v163) * (v161 * v163)) * (v161 * v163))
                   * (v161
                    * v163))
                  * (v161
                   * v163))
                 * (v161
                  * v163))
                * (v161
                 * v163))
               * (v161
                * v163)
               + 1.0)
              + -1.0)
             / (v161
              * v163
              * (v161
               * v163
               * (v161
                * v163
                * (v161
                 * v163
                 * (v161
                  * v163
                  * (v161
                   * v163
                   * (v161
                    * v163
                    * (v161
                     * v163
                     * (v161
                      * v163
                      * (v161 * v163 * (v161 * v163 * (v161 * v163 * (v158 * 15.0 * (v161 * v163)) + v157 * 13.0))
                       + v156 * 11.0))
                     + v155 * 9.0))
                   + v154 * 7.0))
                 + v153 * 5.0))
               + v152 * 3.0)
              * (v161
               * v163)
              + 1.0);
        double v165 = v164
             - (v164
              * (v161
               * v164
               * (v152
                + v161
                * v164
                * (v153
                 + v161
                 * v164
                 * (v154
                  + v161
                  * v164
                  * (v155
                   + v161
                   * v164
                   * (v156 + v161 * v164 * (v157 + v158 * (v161 * v164) * (v161 * v164)) * (v161 * v164))
                   * (v161
                    * v164))
                  * (v161
                   * v164))
                 * (v161
                  * v164))
                * (v161
                 * v164))
               * (v161
                * v164)
               + 1.0)
              + -1.0)
             / (v161
              * v164
              * (v161
               * v164
               * (v161
                * v164
                * (v161
                 * v164
                 * (v161
                  * v164
                  * (v161
                   * v164
                   * (v161
                    * v164
                    * (v161
                     * v164
                     * (v161
                      * v164
                      * (v161 * v164 * (v161 * v164 * (v161 * v164 * (v158 * 15.0 * (v161 * v164)) + v157 * 13.0))
                       + v156 * 11.0))
                     + v155 * 9.0))
                   + v154 * 7.0))
                 + v153 * 5.0))
               + v152 * 3.0)
              * (v161
               * v164)
              + 1.0);
        double v166 = v161 * v165;
        _Q3 = vmulq_n_f64(_Q3, v165- (v165* (v166* (v152+ v166* (v153+ v166* (v154 + v166 * (v155 + v166 * (v156 + v166 * (v157 + v158 * v166 * v166) * v166) * v166) * v166)* v166)* v166)* v166+ 1.0)+ -1.0)/ (v166* (v166* (v166* (v166* (v166
                   * (v166
                    * (v166
                     * (v166 * (v166 * (v166 * (v166 * (v166 * (v158 * 15.0 * v166) + v157 * 13.0)) + v156 * 11.0))
                      + v155 * 9.0))
                    + v154 * 7.0))
                  + v153 * 5.0))
                + v152 * 3.0)
               * v166
               + 1.0));
      }
      double v27 = _Q3.f64[0] - v147;
      double sinval = _Q3.f64[1] - v146;
      goto LABEL_54;
    case 0xF:
      uint64_t v167 = a1 + 72;
      double v168 = 1.0;
      double v169 = (double)*(int *)(a1 + 168);
      float64_t v170 = v11.f64[0] - (*(double *)(a1 + 40) + 1.0) * v169 * 0.5;
      double v171 = (v170 + v170) / v169;
      float64_t v172 = v11.f64[1] - (*(double *)(a1 + 48) + 1.0) * (double)*(int *)(a1 + 172) * 0.5;
      double v173 = (v172 + v172) / v169 / *(double *)(a1 + 16);
      double v174 = sqrt(v173 * v173 + v171 * v171);
      int v175 = (int)(v174 / 0.128564869);
      if (v175 >= 10) {
        int v175 = 10;
      }
      double v176 = v174 / 0.128564869 - (double)v175;
      double v177 = (double *)(v167 + 8 * v175);
      double v178 = v177[1];
      double v179 = (1.0 - v176) * *v177 + 1.0 + v176 * v178;
      double v180 = 1.0 - (v179 + -1.0) / ((v178 - *v177) * v174 / 0.128564869 + v179);
      double v181 = v174 * v180;
      double v182 = 1.0;
      double v183 = 1.0;
      if (v174 * v180 >= 0.0)
      {
        if ((int)(v181 / 0.128564869) >= 10) {
          int v184 = 10;
        }
        else {
          int v184 = (int)(v181 / 0.128564869);
        }
        double v185 = v181 / 0.128564869 - (double)v184;
        double v186 = (double *)(v167 + 8 * v184);
        double v187 = v186[1];
        double v183 = (1.0 - v185) * *v186 + 1.0 + v185 * v187;
        double v182 = v183 + v181 * (v187 - *v186) / 0.128564869;
      }
      double v188 = v180 - (v180 * v183 + -1.0) / v182;
      double v189 = v174 * v188;
      double v190 = 1.0;
      if (v174 * v188 >= 0.0)
      {
        int v191 = (int)(v189 / 0.128564869);
        if (v191 >= 10) {
          int v191 = 10;
        }
        double v192 = v189 / 0.128564869 - (double)v191;
        double v193 = (double *)(v167 + 8 * v191);
        double v194 = v193[1];
        double v190 = (1.0 - v192) * *v193 + 1.0 + v192 * v194;
        double v168 = v190 + v189 * (v194 - *v193) / 0.128564869;
      }
      double v195 = v188 - (v188 * v190 + -1.0) / v168;
      double v196 = v174 * v195;
      double v197 = 1.0;
      double v198 = 1.0;
      double v199 = 1.0;
      if (v174 * v195 >= 0.0)
      {
        int v200 = (int)(v196 / 0.128564869);
        if (v200 >= 10) {
          int v200 = 10;
        }
        double v201 = v196 / 0.128564869 - (double)v200;
        double v202 = (double *)(v167 + 8 * v200);
        double v203 = v202[1];
        double v199 = (1.0 - v201) * *v202 + 1.0 + v201 * v203;
        double v198 = v199 + v196 * (v203 - *v202) / 0.128564869;
      }
      double v204 = *(double *)(a1 + 8);
      double v205 = v195 - (v195 * v199 + -1.0) / v198;
      double v206 = v174 * v205;
      double v207 = 1.0;
      if (v206 >= 0.0)
      {
        int v208 = (int)(v206 / 0.128564869);
        if (v208 >= 10) {
          int v208 = 10;
        }
        double v209 = (double *)(v167 + 8 * v208);
        double v210 = v209[1];
        double v207 = (1.0 - (v206 / 0.128564869 - (double)v208)) * *v209 + 1.0 + (v206 / 0.128564869 - (double)v208) * v210;
        double v197 = v207 + v206 * (v210 - *v209) / 0.128564869;
      }
      double v211 = v205 - (v205 * v207 + -1.0) / v197;
      double v212 = v173 * v211;
      double cosval = 1.0;
      double v27 = v171 * v211 / v204;
      double sinval = v212 / v204;
      goto LABEL_54;
    default:
      if (v3 < 0xFFFFFFFD)
      {
        log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/base/g_camera.c", 2227, (uint64_t)"g_improj2_to_xyz", "TODO: implement this projection type");
        abort();
      }
      int v87 = *(_DWORD *)a1 - 12;
      if (v87 >= 3) {
        __assert_rtn("g_proj_bspline_cnt", "g_camera.c", 924, "0 && \"Not a spline based camera model.\"");
      }
      unint64_t v88 = dword_21BB7CE48[v87];
      double v89 = *(double *)(a1 + 8);
      double v90 = (double)*(int *)(a1 + 168);
      float64_t v91 = v11.f64[0] - (*(double *)(a1 + 40) + 1.0) * v90 * 0.5;
      double v92 = (v91 + v91) / v90;
      float64_t v93 = v11.f64[1] - (*(double *)(a1 + 48) + 1.0) * (double)*(int *)(a1 + 172) * 0.5;
      double v94 = (v93 + v93) / v90 / *(double *)(a1 + 16);
      if (*(double *)(a1 + 72) != 0.0) {
        goto LABEL_19;
      }
      unint64_t v213 = 0;
      double v106 = 1.0;
      break;
  }
  while (v88 - 1 != v213)
  {
    double v214 = *(double *)(a1 + 80 + 8 * v213++);
    if (v214 != 0.0)
    {
      if (v213 < v88)
      {
LABEL_19:
        double v95 = sqrt(v94 * v94 + v92 * v92);
        double v221 = 0.0;
        double v215 = v89;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v95 * 0.707106781, 0.0, 0.0);
        double v97 = 1.0 - (v96 + 1.0 + -1.0) / (v96 + 1.0 + v95 * v221);
        double v221 = 0.0;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v95 * v97 * 0.707106781, 0.0, 0.0);
        double v99 = v97 - (v97 * (v98 + 1.0) + -1.0) / (v98 + 1.0 + v95 * v97 * v221);
        double v221 = 0.0;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v95 * v99 * 0.707106781, 0.0, 0.0);
        double v101 = v99 - (v99 * (v100 + 1.0) + -1.0) / (v100 + 1.0 + v95 * v99 * v221);
        double v221 = 0.0;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v95 * v101 * 0.707106781, 0.0, 0.0);
        double v103 = v101 - (v101 * (v102 + 1.0) + -1.0) / (v102 + 1.0 + v95 * v101 * v221);
        double v104 = v95 * v103;
        double v221 = 0.0;
        g_interp_bspline3_mix2(v88, (double *)(a1 + 72), &v221, 0, 1, v104 * 0.707106781, 0.0, 0.0);
        double v89 = v215;
        double v106 = v103 - (v103 * (v105 + 1.0) + -1.0) / (v105 + 1.0 + v104 * v221);
      }
      break;
    }
  }
  double cosval = 1.0;
  double v27 = v92 * v106 / v89;
  double sinval = v94 * v106 / v89;
LABEL_54:
  *a3 = cosval;
  a3[1] = v27;
  a3[2] = sinval;
}

uint64_t g_xyz_to_improj2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X2>, double *a4@<X3>, unsigned int a5@<W8>)
{
  int v8 = *(_DWORD *)a1;
  switch(*(_DWORD *)a1)
  {
    case 0:
      double v9 = 1.0;
      double v10 = 1.0 / *(double *)a2;
      uint64_t result = *(double *)a2 < 0.0;
      _Q0 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10), *(float64x2_t *)(a1 + 56));
      double v13 = *(double *)(a1 + 72);
      double v14 = *(double *)(a1 + 80);
      double v15 = *(double *)(a1 + 88);
      if (v13 != 0.0 || v14 != 0.0 || v15 != 0.0)
      {
        _D5 = _Q0.f64[1];
        __asm { FMLA            D1, D5, V0.D[1] }
        double v22 = sqrt(_D1);
        double v9 = v22 * (v13 + (v14 + v15 * v22) * v22) * v22 + 1.0;
        if (v22 * (v22 * (v22 * (v15 * 5.0) + v14 * 4.0) + v13 * 3.0) * v22 + 1.0 < 0.0) {
          uint64_t result = 1;
        }
      }
      goto LABEL_16;
    case 1:
      long double v23 = *(double *)(a2 + 8);
      double v24 = sqrt(v23 * v23 + *(double *)a2 * *(double *)a2);
      double v25 = *(double *)(a2 + 16) / v24;
      long double v26 = atan2(v23, *(long double *)a2);
      double v27 = *(double *)(a1 + 48);
      double v28 = *(double *)(a1 + 32);
      *a3 = ((v26
            + *(double *)(a1 + 40)
            + 3.14159265
            + (double)((int)((v26 + *(double *)(a1 + 40) + 3.14159265) * 0.159154943)
                     - (v26 + *(double *)(a1 + 40) + 3.14159265 < 0.0))
            * -6.28318531
            + -3.14159265)
           / *(double *)(a1 + 24)
           + 0.5)
          * (double)*(int *)(a1 + 168)
          + -0.5;
      double v29 = (v25 + v27) * 0.5;
      long double v30 = tan(v28 * 0.5);
      uint64_t result = 0;
      a3[1] = (v29 / v30 + 0.5) * (double)*(int *)(a1 + 172) + -0.5;
      double v10 = 1.0 / v24;
      if (!a4) {
        return result;
      }
      goto LABEL_25;
    case 2:
      long double v31 = *(double *)(a2 + 8);
      long double v32 = *(double *)(a2 + 16);
      double v33 = v31 * v31 + *(double *)a2 * *(double *)a2;
      long double v34 = atan2(v31, *(long double *)a2) + *(double *)(a1 + 40) + 3.14159265;
      long double v144 = v34 + (double)((int)(v34 * 0.159154943) - (v34 < 0.0)) * -6.28318531;
      long double v35 = atan2(v32, sqrt(v33));
      uint64_t result = 0;
      v36.f64[0] = v144;
      v36.f64[1] = v35;
      double v37 = (const double *)&qword_21BB7A798;
      *(void *)&v38.f64[0] = *(_OWORD *)&vld1q_dup_f64(v37);
      v38.f64[1] = *(float64_t *)(a1 + 48);
      float64x2_t v39 = vdivq_f64(vaddq_f64(v36, v38), *(float64x2_t *)(a1 + 24));
      __asm { FMOV            V1.2D, #0.5 }
      float64x2_t v41 = vaddq_f64(v39, _Q1);
      _Q1.f64[0] = *(float64_t *)(a1 + 168);
      v42.i64[0] = SLODWORD(_Q1.f64[0]);
      v42.i64[1] = SHIDWORD(_Q1.f64[0]);
      __asm { FMOV            V2.2D, #-0.5 }
      *(float64x2_t *)a3 = vmlaq_f64(_Q2, vcvtq_f64_s64(v42), v41);
      double v10 = 1.0 / sqrt(v33 + v32 * v32);
      if (!a4) {
        return result;
      }
      goto LABEL_25;
    case 3:
      double v44 = *(double *)a2;
      double v10 = 1.0 / *(double *)a2;
      _Q2 = vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10);
      _D1 = _Q2.f64[1];
      __asm { FMLA            D0, D1, V2.D[1] }
      double v48 = sqrt(_D0);
      double v49 = 1.0;
      if (v48 != 0.0)
      {
        float64x2_t v142 = _Q2;
        double v145 = 1.0 / *(double *)a2;
        long double v50 = atan(v48);
        _Q2 = v142;
        double v10 = v145;
        double v49 = v50 / v48;
      }
      _Q0 = vaddq_f64(vmulq_n_f64(_Q2, v49), *(float64x2_t *)(a1 + 56));
      _D5 = _Q0.f64[1];
      __asm { FMLA            D4, D5, V0.D[1] }
      double v53 = sqrt(_D4);
      double v9 = v53 * (*(double *)(a1 + 72) + (*(double *)(a1 + 80) + *(double *)(a1 + 88) * v53) * v53) * v53 + 1.0;
      uint64_t result = v53 > 20.0 || v44 < 0.0;
LABEL_16:
      float64x2_t v54 = vmlaq_n_f64(*(float64x2_t *)(a1 + 40), _Q0, v9);
      goto LABEL_24;
    case 4:
      double v10 = 1.0 / *(double *)a2;
      uint64_t result = *(double *)a2 < 0.0;
      float64x2_t v55 = vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10);
      goto LABEL_47;
    case 5:
      _Q1 = *(float64x2_t *)(a2 + 8);
      double v143 = vmulq_f64(_Q1, _Q1).f64[0];
      _D9 = *(double *)(a2 + 16);
      __asm { FMLA            D0, D9, V1.D[1] }
      long double v59 = sqrt(_D0);
      float64x2_t v146 = vdivq_f64(_Q1, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v59 + 1.0e-20), 0));
      double v60 = *(double *)a2;
      double v61 = atan2(v59, *(long double *)a2);
      double v62 = sqrt(v143 + v60 * v60 + _D9 * _D9);
      if (a4) {
        double v10 = 1.0 / v62;
      }
      else {
        double v10 = 0.0;
      }
      uint64_t result = v61 > 1.57079633;
      __asm { FMOV            V1.2D, #0.5 }
      float64x2_t v64 = vaddq_f64(*(float64x2_t *)(a1 + 40), vaddq_f64(vdivq_f64(vmulq_n_f64(v146, v61* (v61 * (*(double *)(a1 + 72) + (*(double *)(a1 + 80) + *(double *)(a1 + 88) * v61) * v61) * v61 + 1.0)), *(float64x2_t *)(a1 + 24)), _Q1));
      _Q1.f64[0] = *(float64_t *)(a1 + 168);
      v65.i64[0] = SLODWORD(_Q1.f64[0]);
      v65.i64[1] = SHIDWORD(_Q1.f64[0]);
      __asm { FMOV            V2.2D, #-0.5 }
      *(float64x2_t *)a3 = vmlaq_f64(_Q2, vcvtq_f64_s64(v65), v64);
      if (!a4) {
        return result;
      }
      goto LABEL_25;
    case 6:
      uint64_t result = *(double *)a2 < 0.0;
      double v10 = 1.0 / *(double *)a2;
      float64x2_t v67 = vmulq_f64(*(float64x2_t *)(a1 + 40), (float64x2_t)vdupq_n_s64(0x3EB0C6F7A0B5ED8DuLL));
      _Q5 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10), *(float64x2_t *)(a1 + 56));
      _D7 = _Q5.f64[1];
      __asm
      {
        FMLA            D6, D7, V5.D[1]
        FMOV            V2.2D, #2.0
      }
      float64x2_t v54 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_f64((float64x2_t)vextq_s8((int8x16_t)v67, (int8x16_t)v67, 8uLL), vmlaq_f64((float64x2_t)vdupq_lane_s64(_D6, 0), _Q2, _Q5)), vmulq_n_f64(vaddq_f64(v67, v67), _Q5.f64[0]), _Q5, 1), _Q5, (*(double *)(a1 + 72) + (*(double *)(a1 + 80) + *(double *)(a1 + 88) * *(double *)&_D6) * *(double *)&_D6)* *(double *)&_D6+ 1.0);
LABEL_24:
      uint64_t v72 = *(void *)(a1 + 168);
      v73.i64[0] = (int)v72;
      v73.i64[1] = SHIDWORD(v72);
      __asm
      {
        FMOV            V3.2D, #0.5
        FMOV            V0.2D, #-0.5
      }
      *(float64x2_t *)a3 = vaddq_f64(vmlaq_f64(vmulq_f64(vcvtq_f64_s64(v73), _Q3), *(float64x2_t *)(a1 + 8), v54), _Q0);
      if (a4) {
        goto LABEL_25;
      }
      return result;
    case 8:
      double v10 = 1.0 / *(double *)a2;
      _Q0 = vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10);
      uint64_t result = *(double *)a2 < 0.0;
      double v78 = *(double *)(a1 + 80);
      double v77 = *(double *)(a1 + 88);
      double v79 = *(double *)(a1 + 72);
      if (v79 == 0.0 && v77 == 0.0 && v78 == 0.0 && *(double *)(a1 + 56) == 0.0 && *(double *)(a1 + 64) == 0.0)
      {
        double v85 = 1.0;
      }
      else
      {
        _D6 = _Q0.f64[1];
        __asm { FMLA            D5, D6, V0.D[1] }
        double v82 = sqrt(_D5);
        double v83 = *(double *)(a1 + 56);
        double v84 = *(double *)(a1 + 64);
        double v85 = v82 * (v79 + v82 * (v77 + v82 * (v78 + v82 * (v83 + v82 * v84 * v82) * v82) * v82) * v82) * v82 + 1.0;
        if (v82
           * (v82
            * (v82
             * (v82 * (v82 * (v82 * (v82 * (v82 * (v82 * (v84 * 11.0)) + v83 * 9.0)) + v78 * 7.0)) + v77 * 5.0))
            + v79 * 3.0)
           * v82
           + 1.0 < 0.0)
          uint64_t result = 1;
      }
      float64x2_t v86 = vmlaq_n_f64(*(float64x2_t *)(a1 + 40), _Q0, v85);
      float64x2_t v87 = *(float64x2_t *)(a1 + 8);
      uint64_t v88 = *(void *)(a1 + 168);
      v89.i64[0] = (int)v88;
      v89.i64[1] = SHIDWORD(v88);
      float64x2_t v90 = vcvtq_f64_s64(v89);
      __asm { FMOV            V3.2D, #0.5 }
      goto LABEL_36;
    case 9:
      uint64_t result = *(double *)a2 < 0.0;
      double v10 = 1.0 / *(double *)a2;
      _Q4 = vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10);
      _D6 = _Q4.f64[1];
      __asm { FMLA            D5, D6, V4.D[1] }
      float64x2_t v86 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_f64(vmlaq_f64((float64x2_t)vdupq_lane_s64(_D5, 0), _Q4, vaddq_f64(_Q4, _Q4)), (float64x2_t)vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL)), vmulq_n_f64(vaddq_f64(*(float64x2_t *)(a1 + 96), *(float64x2_t *)(a1 + 96)), _Q4.f64[0]), _Q4, 1), _Q4, (*(double *)(a1 + 72) + (*(double *)(a1 + 88) + *(double *)(a1 + 80) * *(double *)&_D5) * *(double *)&_D5)* *(double *)&_D5+ 1.0);
      float64x2_t v87 = *(float64x2_t *)(a1 + 8);
      float64x2_t v90 = *(float64x2_t *)(a1 + 40);
      uint64_t v95 = *(void *)(a1 + 168);
      v96.i64[0] = (int)v95;
      v96.i64[1] = SHIDWORD(v95);
      _Q3 = vcvtq_f64_s64(v96);
LABEL_36:
      float64x2_t v97 = vmlaq_f64(vmulq_f64(v90, _Q3), v87, v86);
      __asm { FMOV            V0.2D, #-0.5 }
      *(float64x2_t *)a3 = vaddq_f64(v97, _Q0);
      if (!a4) {
        return result;
      }
      goto LABEL_25;
    case 0xA:
      double v99 = *(double *)(a1 + 72);
      double v100 = *(double *)(a1 + 80);
      double v101 = *(double *)(a1 + 88);
      double v102 = *(double *)(a1 + 96);
      float64x2_t v147 = *(float64x2_t *)(a1 + 40);
      float64x2_t v140 = *(float64x2_t *)(a2 + 8);
      float64x2_t v141 = *(float64x2_t *)(a1 + 24);
      uint64_t v103 = *(void *)(a1 + 168);
      v104.i64[0] = (int)v103;
      v104.i64[1] = SHIDWORD(v103);
      float64x2_t v105 = vaddq_f64(*(float64x2_t *)(a1 + 56), vdivq_f64(v140, (float64x2_t)vdupq_lane_s64(*(void *)a2, 0)));
      long double v106 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(void *)&vmulq_f64(v105, v105).f64[1]), v105.f64[0], v105.f64[0]));
      float64x2_t v139 = vdivq_f64(v105, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v106 + 1.0e-20), 0));
      long double v107 = atan(v106);
      long double v108 = v107 * v107;
      double v109 = v107
           * (v99 * (v107 * v107)
            + 1.0
            + v100 * (v108 * v108)
            + v101 * (v108 * (v108 * v108))
            + v102 * (v108 * v108 * (v108 * v108)));
      _V6.D[1] = v140.f64[1];
      __asm { FMOV            V2.2D, #0.5 }
      float64x2_t v112 = vmulq_f64(vaddq_f64(v147, vaddq_f64(vdivq_f64(vmulq_n_f64(v139, v109), v141), _Q2)), vcvtq_f64_s64(v104));
      _D4 = v140.f64[1];
      __asm { FMLA            D3, D4, V6.D[1] }
      double v115 = 1.0 / sqrt(_D3);
      if (a4) {
        double v10 = v115;
      }
      else {
        double v10 = 0.0;
      }
      uint64_t result = v109 > 1.57079633;
      __asm { FMOV            V0.2D, #-0.5 }
      *(float64x2_t *)a3 = vaddq_f64(v112, _Q0);
      if (!a4) {
        return result;
      }
      goto LABEL_25;
    case 0xB:
      double v117 = 1.0;
      double v10 = 1.0 / *(double *)a2;
      double v118 = *(double *)(a1 + 72);
      double v119 = *(double *)(a1 + 80);
      double v120 = *(double *)(a1 + 88);
      double v121 = *(double *)(a1 + 96);
      double v122 = *(double *)(a1 + 104);
      double v123 = *(double *)(a1 + 112);
      double v124 = *(double *)(a1 + 120);
      uint64_t result = *(double *)a2 < 0.0;
      _Q2 = vaddq_f64(*(float64x2_t *)(a1 + 56), vmulq_n_f64(*(float64x2_t *)(a2 + 8), v10));
      if (v118 + 0.0 + v119 + v120 + v121 + v122 + v123 + v124 != 0.0)
      {
        _D18 = _Q2.f64[1];
        __asm { FMLA            D1, D18, V2.D[1] }
        double v128 = sqrt(_D1);
        double v117 = v128
             * (v118
              + v128
              * (v119
               + v128
               * (v120 + v128 * (v121 + v128 * (v122 + v128 * (v123 + v128 * v124 * v128) * v128) * v128) * v128)
               * v128)
              * v128)
             * v128
             + 1.0;
        if (v128
           * (v128
            * (v128
             * (v128
              * (v128
               * (v128
                * (v128
                 * (v128 * (v128 * (v128 * (v128 * (v128 * (v128 * (v124 * 15.0)) + v123 * 13.0)) + v122 * 11.0))
                  + v121 * 9.0))
                + v120 * 7.0))
              + v119 * 5.0))
            + v118 * 3.0)
           * v128
           + 1.0 < 0.0)
          uint64_t result = 1;
      }
      float64x2_t v55 = vmlaq_n_f64(*(float64x2_t *)(a1 + 40), _Q2, v117);
LABEL_47:
      uint64_t v129 = *(void *)(a1 + 168);
      v130.i64[0] = (int)v129;
      v130.i64[1] = SHIDWORD(v129);
      __asm { FMOV            V3.2D, #0.5 }
      float64x2_t v132 = vmlaq_f64(vmulq_f64(vcvtq_f64_s64(v130), _Q3), *(float64x2_t *)(a1 + 8), v55);
      __asm { FMOV            V0.2D, #-0.5 }
      *(float64x2_t *)a3 = vaddq_f64(v132, _Q0);
      if (!a4) {
        return result;
      }
      goto LABEL_25;
    case 0xF:
      double v134 = *(double *)(a1 + 8);
      double v135 = *(double *)(a1 + 16);
      goto LABEL_55;
    default:
      if (a5 < 0xFFFFFFFD) {
        __assert_rtn("g_xyz_to_improj2", "g_camera.c", 6236, "0 && \"Not implemented!\"");
      }
      double v134 = *(double *)(a1 + 8);
      double v135 = *(double *)(a1 + 16);
      switch(v8)
      {
        case 12:
          unsigned int v136 = 7;
          break;
        case 14:
LABEL_55:
          unsigned int v136 = 12;
          break;
        case 13:
          unsigned int v136 = 10;
          break;
        default:
          __assert_rtn("g_proj_bspline_cnt", "g_camera.c", 924, "0 && \"Not a spline based camera model.\"");
      }
      BOOL v137 = *(double *)a2 < 0.0;
      double v148 = 1.0 / *(double *)a2;
      BOOL v138 = g_pinhole_to_pixel_jac(a3, a3 + 1, v8, (double *)(a1 + 72), v136, *(_DWORD *)(a1 + 168), *(_DWORD *)(a1 + 172), 0, *(double *)(a2 + 8) * v148, v148 * *(double *)(a2 + 16), v134, v135, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 0, 0, 0,
               0,
               0);
      double v10 = v148;
      if (v138) {
        uint64_t result = v137 | 2u;
      }
      else {
        uint64_t result = v137;
      }
      if (a4) {
LABEL_25:
      }
        *a4 = v10;
      return result;
  }
}

double g_coords_conv(double *a1, double *a2, double *a3)
{
  double v3 = a2[1];
  double v4 = a1[1];
  double v6 = a1[2];
  double v5 = a1[3];
  double v7 = a1[6];
  double v8 = a1[7];
  double v9 = a2[2];
  double v10 = a2[3];
  double v11 = *a2 * *a1 + 0.0 + v3 * v5 + v9 * v7;
  double v12 = a1[4];
  double v13 = a1[5];
  double v14 = *a2 * v4 + 0.0 + v3 * v12 + v9 * v8;
  double v15 = a1[8];
  double v16 = a1[9];
  double v17 = *a2 * v6 + 0.0 + v3 * v13 + v9 * v15;
  double v18 = a2[4];
  double v19 = a2[5];
  double v20 = v10 * *a1 + 0.0 + v18 * v5 + v19 * v7;
  double v21 = a2[6];
  double v22 = a2[7];
  double v23 = v21 * *a1 + 0.0 + v22 * v5;
  double v24 = a2[8];
  double v25 = v23 + v24 * v7;
  double v26 = v10 * v4 + 0.0 + v18 * v12 + v19 * v8;
  double v27 = v21 * v4 + 0.0 + v22 * v12;
  double v28 = v10 * v6 + 0.0 + v18 * v13 + v19 * v15;
  double v29 = v27 + v24 * v8;
  double v30 = v21 * v6 + 0.0 + v22 * v13;
  double v31 = a1[10];
  double v32 = a1[11];
  a3[9] = *a2 * v16 + 0.0 + v3 * v31 + v9 * v32 + a2[9];
  a3[10] = v10 * v16 + 0.0 + v18 * v31 + v19 * v32 + a2[10];
  a3[11] = v21 * v16 + 0.0 + v22 * v31 + v24 * v32 + a2[11];
  *a3 = v11;
  a3[1] = v14;
  a3[2] = v17;
  a3[3] = v20;
  a3[4] = v26;
  a3[5] = v28;
  double result = v30 + v24 * v15;
  a3[6] = v25;
  a3[7] = v29;
  a3[8] = result;
  return result;
}

double g_coords_diff(double *a1, double *a2, uint64_t a3)
{
  double v3 = a1[1];
  double v4 = a2[1];
  double v6 = a1[2];
  double v5 = a1[3];
  double v8 = a2[2];
  double v7 = a2[3];
  double v9 = a1[6];
  double v10 = a1[7];
  double v11 = a2[6];
  double v12 = a2[7];
  double v13 = *a2 * *a1 + 0.0 + v7 * v5 + v11 * v9;
  double v14 = a1[4];
  double v15 = a1[5];
  double v16 = *a2 * v3 + 0.0 + v7 * v14 + v11 * v10;
  double v17 = *a2 * v6 + 0.0 + v7 * v15;
  double v18 = a1[8];
  double v19 = a1[9];
  double v20 = v17 + v11 * v18;
  double v21 = a2[4];
  double v22 = a2[5];
  double v23 = v4 * *a1 + 0.0 + v21 * v5;
  double v24 = v4 * v3 + 0.0 + v21 * v14;
  double v25 = v4 * v6 + 0.0 + v21 * v15;
  double v26 = v23 + v12 * v9;
  double v27 = v24 + v12 * v10;
  double v28 = v25 + v12 * v18;
  double v29 = v8 * *a1 + 0.0 + v22 * v5;
  double v30 = a2[8];
  double v31 = a2[9];
  double v32 = v29 + v30 * v9;
  double v33 = v8 * v3 + 0.0 + v22 * v14 + v30 * v10;
  double v34 = v8 * v6 + 0.0 + v22 * v15 + v30 * v18;
  double v35 = a1[10] - a2[10];
  double v36 = a1[11] - a2[11];
  *(void *)(a3 + 72) = 0;
  double v37 = *a2 * (v19 - v31) + 0.0;
  *(double *)(a3 + 72) = v37;
  double v38 = v37 + a2[3] * v35;
  *(double *)(a3 + 72) = v38;
  *(double *)(a3 + 72) = v38 + a2[6] * v36;
  *(void *)(a3 + 80) = 0;
  double v39 = a2[1] * (v19 - v31) + 0.0;
  *(double *)(a3 + 80) = v39;
  double v40 = v39 + a2[4] * v35;
  *(double *)(a3 + 80) = v40;
  *(double *)(a3 + 80) = v40 + a2[7] * v36;
  *(void *)(a3 + 88) = 0;
  double v41 = a2[2] * (v19 - v31) + 0.0;
  *(double *)(a3 + 88) = v41;
  double v42 = v41 + a2[5] * v35;
  *(double *)(a3 + 88) = v42;
  double result = v42 + a2[8] * v36;
  *(double *)(a3 + 88) = result;
  *(double *)a3 = v13;
  *(double *)(a3 + 8) = v16;
  *(double *)(a3 + 16) = v20;
  *(double *)(a3 + 24) = v26;
  *(double *)(a3 + 32) = v27;
  *(double *)(a3 + 40) = v28;
  *(double *)(a3 + 48) = v32;
  *(double *)(a3 + 56) = v33;
  *(double *)(a3 + 64) = v34;
  return result;
}

double g_camera_global_to_local(double *a1, double *a2, double *a3)
{
  double v3 = a1[1];
  double v4 = a1[2];
  double v5 = a1[3];
  double v7 = a1[4];
  double v6 = a1[5];
  double v9 = a1[6];
  double v8 = a1[7];
  double v10 = a1[8];
  double v11 = a1[9];
  double v12 = a1[10];
  double v13 = a1[11];
  double v14 = *a1 * v11 + 0.0 + v5 * v12 + v9 * v13;
  double v15 = v3 * v11 + 0.0 + v7 * v12 + v8 * v13;
  double v16 = v4 * v11 + 0.0 + v6 * v12 + v10 * v13;
  double v17 = a2[1];
  double v19 = a2[2];
  double v18 = a2[3];
  double v20 = a2[6];
  double v21 = a2[7];
  double v22 = *a1 * *a2 + 0.0 + v5 * v18 + v9 * v20;
  double v23 = a2[4];
  double v24 = a2[5];
  double v25 = *a1 * v17 + 0.0 + v5 * v23 + v9 * v21;
  double v26 = a2[8];
  double v27 = a2[9];
  double v28 = *a1 * v19 + 0.0 + v5 * v24 + v9 * v26;
  double v29 = v3 * *a2 + 0.0 + v7 * v18 + v8 * v20;
  double v30 = v3 * v17 + 0.0 + v7 * v23 + v8 * v21;
  double v31 = v4 * *a2 + 0.0 + v6 * v18 + v10 * v20;
  double v32 = v4 * v17 + 0.0 + v6 * v23 + v10 * v21;
  double v33 = a2[10];
  double v34 = a2[11];
  double v35 = *a1 * v27 + 0.0 + v5 * v33 + v9 * v34;
  a3[10] = v3 * v27 + 0.0 + v7 * v33 + v8 * v34 - v15;
  a3[11] = v4 * v27 + 0.0 + v6 * v33 + v10 * v34 - v16;
  *a3 = v22;
  a3[1] = v25;
  a3[2] = v28;
  a3[3] = v29;
  a3[4] = v30;
  a3[5] = v3 * v19 + 0.0 + v7 * v24 + v8 * v26;
  a3[6] = v31;
  a3[7] = v32;
  double result = v35 - v14;
  a3[8] = v4 * v19 + 0.0 + v6 * v24 + v10 * v26;
  a3[9] = v35 - v14;
  return result;
}

double g_camera_local_to_global(double *a1, double *a2, double *a3)
{
  double v3 = a1[1];
  double v4 = a2[1];
  double v6 = a2[2];
  double v5 = a2[3];
  double v7 = a2[6];
  double v8 = a2[7];
  double v9 = a1[2];
  double v10 = a1[3];
  double v11 = *a1 * *a2 + 0.0 + v3 * v5 + v9 * v7;
  double v12 = a2[4];
  double v13 = a2[5];
  double v14 = *a1 * v4 + 0.0 + v3 * v12 + v9 * v8;
  double v15 = a2[8];
  double v16 = a2[9];
  double v17 = *a1 * v6 + 0.0 + v3 * v13 + v9 * v15;
  double v18 = a1[4];
  double v19 = a1[5];
  double v20 = v10 * *a2 + 0.0 + v18 * v5 + v19 * v7;
  double v21 = a1[6];
  double v22 = a1[7];
  double v23 = v21 * *a2 + 0.0 + v22 * v5;
  double v24 = a1[8];
  double v25 = v23 + v24 * v7;
  double v26 = v10 * v4 + 0.0 + v18 * v12 + v19 * v8;
  double v27 = v21 * v4 + 0.0 + v22 * v12;
  double v28 = v10 * v6 + 0.0 + v18 * v13 + v19 * v15;
  double v29 = v27 + v24 * v8;
  double v30 = v21 * v6 + 0.0 + v22 * v13;
  double v31 = a2[10];
  double v32 = a2[11];
  a3[9] = *a1 * v16 + 0.0 + v3 * v31 + v9 * v32 + a1[9];
  a3[10] = v10 * v16 + 0.0 + v18 * v31 + v19 * v32 + a1[10];
  a3[11] = v21 * v16 + 0.0 + v22 * v31 + v24 * v32 + a1[11];
  *a3 = v11;
  a3[1] = v14;
  a3[2] = v17;
  a3[3] = v20;
  a3[4] = v26;
  a3[5] = v28;
  double result = v30 + v24 * v15;
  a3[6] = v25;
  a3[7] = v29;
  a3[8] = result;
  return result;
}

float g_coordsf_conv(float *a1, float *a2, float *a3)
{
  float v3 = a2[1];
  float v4 = a1[1];
  float v6 = a1[2];
  float v5 = a1[3];
  float v7 = a1[6];
  float v8 = a1[7];
  float v9 = a2[2];
  float v10 = a2[3];
  float v11 = (float)((float)((float)(*a2 * *a1) + 0.0) + (float)(v3 * v5)) + (float)(v9 * v7);
  float v12 = a1[4];
  float v13 = a1[5];
  float v14 = (float)((float)((float)(*a2 * v4) + 0.0) + (float)(v3 * v12)) + (float)(v9 * v8);
  float v15 = a1[8];
  float v16 = a1[9];
  float v17 = (float)((float)((float)(*a2 * v6) + 0.0) + (float)(v3 * v13)) + (float)(v9 * v15);
  float v18 = a2[4];
  float v19 = a2[5];
  float v20 = (float)((float)((float)(v10 * *a1) + 0.0) + (float)(v18 * v5)) + (float)(v19 * v7);
  float v21 = a2[6];
  float v22 = a2[7];
  float v23 = (float)((float)(v21 * *a1) + 0.0) + (float)(v22 * v5);
  float v24 = a2[8];
  float v25 = v23 + (float)(v24 * v7);
  float v26 = (float)((float)((float)(v10 * v4) + 0.0) + (float)(v18 * v12)) + (float)(v19 * v8);
  float v27 = (float)((float)(v21 * v4) + 0.0) + (float)(v22 * v12);
  float v28 = (float)((float)((float)(v10 * v6) + 0.0) + (float)(v18 * v13)) + (float)(v19 * v15);
  float v29 = v27 + (float)(v24 * v8);
  float v30 = (float)((float)(v21 * v6) + 0.0) + (float)(v22 * v13);
  float v31 = a1[10];
  float v32 = a1[11];
  a3[9] = (float)((float)((float)((float)(*a2 * v16) + 0.0) + (float)(v3 * v31)) + (float)(v9 * v32)) + a2[9];
  a3[10] = (float)((float)((float)((float)(v10 * v16) + 0.0) + (float)(v18 * v31)) + (float)(v19 * v32)) + a2[10];
  a3[11] = (float)((float)((float)((float)(v21 * v16) + 0.0) + (float)(v22 * v31)) + (float)(v24 * v32)) + a2[11];
  *a3 = v11;
  a3[1] = v14;
  a3[2] = v17;
  a3[3] = v20;
  a3[4] = v26;
  a3[5] = v28;
  float result = v30 + (float)(v24 * v15);
  a3[6] = v25;
  a3[7] = v29;
  a3[8] = result;
  return result;
}

float g_coordsf_diff(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5.i32[0] = *(_DWORD *)(a1 + 8);
  v6.i32[0] = *(_DWORD *)(a1 + 20);
  float v11 = *(float *)(a2 + 8);
  float result = *(float *)(a2 + 20);
  v7.i32[0] = *(_DWORD *)(a1 + 32);
  float v13 = *(float *)(a2 + 32);
  float v14 = (float)((float)((float)(v11 * *(float *)v5.i32) + 0.0) + (float)(result * *(float *)v6.i32))
      + (float)(v13 * *(float *)v7.i32);
  float v15 = *(float *)(a1 + 36) - *(float *)(a2 + 36);
  float v16 = *(float *)(a1 + 40) - *(float *)(a2 + 40);
  float v17 = *(float *)(a1 + 44) - *(float *)(a2 + 44);
  v8.i64[0] = *(void *)a2;
  v9.i64[0] = *(void *)(a2 + 12);
  v10.i64[0] = *(void *)(a2 + 24);
  int32x4_t v18 = vdupq_lane_s32(*(int32x2_t *)v10.i8, 1);
  float32x4_t v19 = (float32x4_t)vzip1q_s32(v10, v18);
  v4.i64[0] = *(void *)a1;
  v3.i64[0] = *(void *)(a1 + 12);
  v18.i64[0] = *(void *)(a1 + 24);
  float32x2_t v20 = vmla_n_f32(vmla_n_f32(vmla_n_f32(0, *(float32x2_t *)a1, COERCE_FLOAT(*(void *)a2)), *(float32x2_t *)v3.i8, *(float *)v9.i32), *(float32x2_t *)v18.i8, *(float *)v10.i32);
  float32x4_t v21 = (float32x4_t)vextq_s8(vextq_s8(v5, v5, 4uLL), v4, 0xCuLL);
  v21.i32[3] = v21.i32[0];
  float32x4_t v22 = vmlaq_f32((float32x4_t)0, v21, (float32x4_t)vzip1q_s32(v8, vdupq_lane_s32(*(int32x2_t *)a2, 1)));
  float32x4_t v23 = (float32x4_t)vextq_s8(vextq_s8(v6, v6, 4uLL), v3, 0xCuLL);
  v23.i32[3] = v23.i32[0];
  float32x4_t v24 = vmlaq_f32(v22, v23, (float32x4_t)vzip1q_s32(v9, vdupq_lane_s32(*(int32x2_t *)v9.i8, 1)));
  float32x4_t v25 = (float32x4_t)vextq_s8(vextq_s8(v7, v7, 4uLL), (int8x16_t)v18, 0xCuLL);
  v25.i32[3] = v25.i32[0];
  float32x4_t v26 = vmlaq_f32(v24, v25, v19);
  *(_DWORD *)(a3 + 36) = 0;
  v25.f32[0] = (float)(*(float *)a2 * v15) + 0.0;
  *(_DWORD *)(a3 + 36) = v25.i32[0];
  v25.f32[0] = v25.f32[0] + (float)(*(float *)(a2 + 12) * v16);
  *(_DWORD *)(a3 + 36) = v25.i32[0];
  *(float *)(a3 + 36) = v25.f32[0] + (float)(*(float *)(a2 + 24) * v17);
  *(_DWORD *)(a3 + 40) = 0;
  v25.f32[0] = (float)(*(float *)(a2 + 4) * v15) + 0.0;
  *(_DWORD *)(a3 + 40) = v25.i32[0];
  v25.f32[0] = v25.f32[0] + (float)(*(float *)(a2 + 16) * v16);
  *(_DWORD *)(a3 + 40) = v25.i32[0];
  *(float *)(a3 + 40) = v25.f32[0] + (float)(*(float *)(a2 + 28) * v17);
  *(_DWORD *)(a3 + 44) = 0;
  float v27 = (float)(*(float *)(a2 + 8) * v15) + 0.0;
  *(float *)(a3 + 44) = v27;
  float v28 = v27 + (float)(*(float *)(a2 + 20) * v16);
  *(float *)(a3 + 44) = v28;
  *(float *)(a3 + 44) = v28 + (float)(*(float *)(a2 + 32) * v17);
  *(float32x2_t *)a3 = v20;
  *(float32x4_t *)(a3 + 8) = v26;
  *(float32x2_t *)(a3 + 24) = vmla_n_f32(vmla_n_f32(vmla_n_f32(0, *(float32x2_t *)v4.i8, v11), *(float32x2_t *)v3.i8, result), *(float32x2_t *)v18.i8, v13);
  *(float *)(a3 + 32) = v14;
  return result;
}

double g_coords_delta(double *a1, double *a2, double *a3)
{
  double v3 = a1[1];
  double v5 = a1[2];
  double v4 = a1[3];
  double v6 = a1[4];
  double v7 = a1[5];
  double v8 = a1[6];
  double v9 = a1[7];
  double v10 = a1[8];
  double v11 = a1[9];
  double v12 = a1[10];
  double v13 = a1[11];
  double v14 = *a1 * v11 + 0.0 + v4 * v12 + v8 * v13;
  double v15 = v3 * v11 + 0.0 + v6 * v12 + v9 * v13;
  double v16 = v5 * v11 + 0.0 + v7 * v12 + v10 * v13;
  double v17 = a2[1];
  double v18 = a2[2];
  double v19 = a2[3];
  double v20 = *a2 * *a1 + 0.0 + v17 * v3 + v18 * v5;
  double v21 = *a2 * v4 + 0.0 + v17 * v6 + v18 * v7;
  double v22 = *a2 * v8 + 0.0 + v17 * v9 + v18 * v10;
  double v23 = a2[4];
  double v24 = a2[5];
  double v25 = v19 * *a1 + 0.0 + v23 * v3 + v24 * v5;
  double v26 = a2[6];
  double v27 = a2[7];
  double v28 = v26 * *a1 + 0.0 + v27 * v3;
  double v29 = a2[8];
  a3[9] = 0.0 - *a2 * v14 - v17 * v15 - v18 * v16 + a2[9];
  a3[10] = 0.0 - v19 * v14 - v23 * v15 - v24 * v16 + a2[10];
  a3[11] = 0.0 - v26 * v14 - v27 * v15 - v29 * v16 + a2[11];
  *a3 = v20;
  a3[1] = v21;
  a3[2] = v22;
  a3[3] = v25;
  a3[4] = v19 * v4 + 0.0 + v23 * v6 + v24 * v7;
  a3[5] = v19 * v8 + 0.0 + v23 * v9 + v24 * v10;
  double result = v26 * v8 + 0.0 + v27 * v9 + v29 * v10;
  a3[6] = v28 + v29 * v5;
  a3[7] = v26 * v4 + 0.0 + v27 * v6 + v29 * v7;
  a3[8] = result;
  return result;
}

double g_coords_angle_diff(double *a1, double *a2)
{
  v35[3] = *(double *)MEMORY[0x263EF8340];
  double v2 = a1[1];
  double v3 = a2[1];
  double v5 = a1[2];
  double v4 = a1[3];
  double v7 = a2[2];
  double v6 = a2[3];
  double v8 = a1[6];
  double v9 = a1[7];
  double v10 = a2[6];
  double v11 = a2[7];
  double v12 = *a2 * *a1 + 0.0 + v6 * v4 + v10 * v8;
  double v13 = a1[4];
  double v14 = a1[5];
  double v15 = *a2 * v2 + 0.0 + v6 * v13 + v10 * v9;
  double v16 = a1[8];
  double v17 = *a2 * v5 + 0.0 + v6 * v14 + v10 * v16;
  double v18 = a2[4];
  double v19 = a2[5];
  double v20 = v3 * *a1 + 0.0 + v18 * v4 + v11 * v8;
  double v21 = v7 * *a1 + 0.0 + v19 * v4;
  double v22 = a2[8];
  double v23 = v21 + v22 * v8;
  double v24 = v3 * v2 + 0.0 + v18 * v13 + v11 * v9;
  double v25 = v7 * v2 + 0.0 + v19 * v13;
  double v26 = v3 * v5 + 0.0 + v18 * v14 + v11 * v16;
  double v27 = v25 + v22 * v9;
  double v28 = v7 * v5 + 0.0 + v19 * v14 + v22 * v16;
  double v29 = a1[9] - a2[9];
  double v30 = a1[10] - a2[10];
  double v31 = a1[11] - a2[11];
  double v32 = *a2 * v29 + 0.0 + v6 * v30;
  v34[10] = v3 * v29 + 0.0 + v18 * v30 + v11 * v31;
  v34[11] = v7 * v29 + 0.0 + v19 * v30 + v22 * v31;
  v34[0] = v12;
  v34[1] = v15;
  v34[2] = v17;
  v34[3] = v20;
  v34[4] = v24;
  v34[5] = v26;
  v34[6] = v23;
  v34[7] = v27;
  v34[8] = v28;
  v34[9] = v32 + v10 * v31;
  return g_log_so3(v35, v34);
}

void g_proj2_to_g_proj(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  unsigned int v4 = *(_DWORD *)a1;
  *(_DWORD *)a2 = *(_DWORD *)a1;
  if (v4 > 0xF) {
    goto LABEL_19;
  }
  if (((1 << v4) & 0xB59) == 0)
  {
    if (((1 << v4) & 0xF000) != 0)
    {
      long double v13 = atan(1.0 / *(double *)(a1 + 8));
      double v10 = v13 + v13;
      *(long double *)(a2 + 8) = v13 + v13;
      double v12 = (v13 + v13) * *(double *)(a1 + 16);
      goto LABEL_8;
    }
    if (((1 << v4) & 0x420) != 0)
    {
      double v10 = *(double *)(a1 + 24);
      double v12 = *(double *)(a1 + 32);
      *(double *)(a2 + 8) = v10;
      goto LABEL_8;
    }
LABEL_19:
    log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/base/g_camera.c", 6608, (uint64_t)"g_proj2_to_g_proj", "Lens type %d is not implemented!", v4);
    __assert_rtn("g_proj2_to_g_proj", "g_camera.c", 6608, "0");
  }
  long double v9 = atan((double)*(int *)(a1 + 168) / (*(double *)(a1 + 8) + *(double *)(a1 + 8)));
  double v10 = v9 + v9;
  *(long double *)(a2 + 8) = v9 + v9;
  long double v11 = atan((double)*(int *)(a1 + 172) / (*(double *)(a1 + 16) + *(double *)(a1 + 16)));
  double v12 = v11 + v11;
LABEL_8:
  *(double *)(a2 + 16) = v12;
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 40);
  double v14 = fabs(v12);
  if (v14 >= INFINITY && v14 <= INFINITY) {
    *(void *)(a2 + 16) = 0;
  }
  double v15 = fabs(v10);
  if (v15 >= INFINITY && v15 <= INFINITY) {
    *(void *)(a2 + 8) = 0;
  }
  long long v16 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 72) = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(a2 + 56) = v16;
  long long v17 = *(_OWORD *)(a1 + 104);
  long long v18 = *(_OWORD *)(a1 + 120);
  long long v19 = *(_OWORD *)(a1 + 136);
  *(_OWORD *)(a2 + 136) = *(_OWORD *)(a1 + 152);
  *(_OWORD *)(a2 + 120) = v19;
  *(_OWORD *)(a2 + 104) = v18;
  *(_OWORD *)(a2 + 88) = v17;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 56);
  if (a3) {
    *a3 = *(_DWORD *)(a1 + 168);
  }
  if (a4) {
    *a4 = *(_DWORD *)(a1 + 172);
  }
}

void rowl_setup(int *a1, unsigned int a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  if ((int)a2 >= 1)
  {
    bzero(a4, 4 * a2);
    long double v13 = a1;
    uint64_t v14 = a2;
    do
    {
      uint64_t v15 = *v13++;
      ++*(_DWORD *)&a4[4 * v15];
      --v14;
    }
    while (v14);
    if ((int)a2 >= 2)
    {
      long long v16 = a4 + 4;
      int v17 = *(_DWORD *)a4;
      uint64_t v18 = a2 - 1;
      do
      {
        v17 += *v16;
        *v16++ = v17;
        --v18;
      }
      while (v18);
    }
    uint64_t v19 = 0;
    do
    {
      uint64_t v20 = 4 * a1[v19];
      --*(_DWORD *)&a4[v20];
      *(_DWORD *)(a3 + 4 * *(int *)&a4[4 * a1[v19]]) = v19;
      ++v19;
    }
    while (a2 != v19);
    uint64_t v21 = 0;
    if (a2 < 8) {
      goto LABEL_14;
    }
    if ((unint64_t)(a5 - a6) < 0x20) {
      goto LABEL_14;
    }
    uint64_t v21 = a2 & 0xFFFFFFF8;
    double v22 = (_OWORD *)(a6 + 16);
    double v23 = (_OWORD *)(a5 + 16);
    *(void *)&long long v24 = -1;
    *((void *)&v24 + 1) = -1;
    uint64_t v25 = v21;
    do
    {
      *(v22 - 1) = v24;
      *double v22 = v24;
      v22 += 2;
      *(v23 - 1) = v24;
      *double v23 = v24;
      v23 += 2;
      v25 -= 8;
    }
    while (v25);
    if (v21 != a2)
    {
LABEL_14:
      uint64_t v26 = a2 - v21;
      uint64_t v27 = 4 * v21;
      double v28 = (_DWORD *)(a5 + 4 * v21);
      double v29 = (_DWORD *)(a6 + v27);
      do
      {
        *v29++ = -1;
        *v28++ = -1;
        --v26;
      }
      while (v26);
    }
    unint64_t v30 = 0;
    do
    {
      unint64_t v31 = v30++;
      LODWORD(v32) = a2;
      if (v30 < a2) {
        LODWORD(v32) = *(_DWORD *)&a4[4 * v30];
      }
      uint64_t v33 = *(int *)&a4[4 * v31];
      if ((int)v32 > (int)v33)
      {
        uint64_t v32 = (int)v32;
        uint64_t v34 = (int)v32 - 1;
        double v35 = (int *)(a3 + 4 * v34);
        int v36 = v31 - 1;
        if (v31)
        {
          uint64_t v37 = a3 - 4 + 4 * (int)v32;
          uint64_t v38 = v34 + 1;
          do
          {
            double v39 = v35;
            int v40 = v36;
            if (v38 != v32)
            {
              int v40 = *(_DWORD *)(v37 + 4);
              double v39 = (int *)v37;
            }
            --v32;
            *(_DWORD *)(a5 + 4 * *v39) = v40;
            v37 -= 4;
          }
          while (v32 > v33);
        }
        else
        {
          uint64_t v41 = v34 + 1;
          do
          {
            double v42 = v35;
            uint64_t v43 = a5;
            LODWORD(v44) = v36;
            if (v41 != v32)
            {
              double v45 = (_DWORD *)(a3 + 4 * v32);
              *(_DWORD *)(a5 + 4 * (int)*(v45 - 1)) = *v45;
              uint64_t v44 = (int)*(v45 - 1);
              double v42 = (int *)(a5 + 4 * v44);
              uint64_t v43 = a6;
            }
            --v32;
            *(_DWORD *)(v43 + 4 * *v42) = v44;
          }
          while (v32 > v33);
        }
      }
    }
    while (v30 != a2);
  }
}

void *cholskyf_create(uint64_t a1, int a2, int a3)
{
  int v6 = a3 - a2;
  double v7 = malloc_type_calloc(1uLL, 0x30uLL, 0x1090040B0206AFAuLL);
  double v8 = (char *)malloc_type_malloc(8 * a2, 0x100004052888210uLL);
  v7[1] = &v8[4 * a2];
  v7[2] = v8;
  *((_DWORD *)v7 + 6) = a2;
  *((_DWORD *)v7 + 10) = v6;
  *((_DWORD *)v7 + 11) = 1;
  if (a2 < 1)
  {
    unint64_t v11 = 0;
  }
  else
  {
    int v9 = 0;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    int v12 = 0;
    do
    {
      if (v12 < *(_DWORD *)(a1 + 4 * v10) + (int)v10)
      {
        uint64_t v13 = v12;
        int64_t v14 = ((unint64_t)(v9 + v12) << 32) + 0x100000000;
        do
        {
          uint64_t v15 = 4 * v13;
          *(_DWORD *)&v8[4 * a2 + v15] = v11;
          *(_DWORD *)&v8[v15] = v10;
          v11 += v14 >> 32;
          ++v13;
          v14 += 0x100000000;
        }
        while (v13 < *(int *)(a1 + 4 * v10) + (uint64_t)(int)v10);
        int v12 = v13;
      }
      ++v10;
      --v9;
    }
    while (v10 != a2);
  }
  unint64_t v16 = v11 + v6 * a3;
  int v17 = (char *)malloc_type_malloc(4 * v16, 0x9139AB02uLL);
  *double v7 = v17;
  v7[4] = &v17[4 * v11];
  *((_DWORD *)v7 + 7) = v16;
  if (v11 >= 0x7FFFFFFF) {
    __assert_rtn("cholskyf_create", "cholsky.c", 631, "cnt < INT32_MAX");
  }
  return v7;
}

void factorizef(uint64_t *a1, float *a2, uint64_t a3, float *a4, int *a5, uint64_t a6, float a7)
{
  unint64_t v9 = *((unsigned int *)a1 + 6);
  uint64_t v10 = (int)v9;
  unint64_t v11 = (float *)a1[4];
  uint64_t v13 = *a1;
  uint64_t v12 = a1[1];
  int64_t v14 = (int *)a1[2];
  int v15 = *((_DWORD *)a1 + 10);
  if (!*((_DWORD *)a1 + 11))
  {
    int v149 = *((_DWORD *)a1 + 10);
    double v150 = (float *)a1[4];
    uint64_t v43 = (char *)malloc_type_malloc(16 * (int)v9, 0x100004052888210uLL);
    uint64_t v44 = &v43[4 * (int)v9];
    uint64_t v45 = (uint64_t)&v44[4 * (int)v9];
    uint64_t v46 = v45 + 4 * (int)v9;
    double v47 = v43;
    int v151 = v44;
    rowl_setup(v14, v9, (uint64_t)v43, v44, v45, v46);
    double v48 = v47;
    uint64_t v49 = a6;
    if ((int)v9 < 1)
    {
LABEL_79:
      free(v48);
      uint64_t v10 = (int)v9;
      unint64_t v11 = v150;
      int v15 = v149;
      if (!*((_DWORD *)a1 + 10)) {
        return;
      }
      goto LABEL_80;
    }
    uint64_t v154 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = v13;
    while (1)
    {
      uint64_t v52 = v50;
      uint64_t v53 = 4 * v50;
      uint64_t v54 = v14[v50];
      uint64_t v55 = *(int *)(v12 + v53);
      float v56 = *a2++;
      float v57 = v56 + a7;
      float v58 = v56 + a7;
      long double v59 = (float *)(v13 + 4 * v55 + 4 * (v52 - v54));
      float *v59 = v56 + a7;
      if (v52 > v54)
      {
        double v60 = (float *)(v51 + 4 * (v154 + v55));
        uint64_t v61 = v54;
        float v58 = v57;
        do
        {
          float v62 = *v60++;
          float v58 = v58 - (float)(v62 * v62);
          float *v59 = v58;
          ++v61;
        }
        while (v52 != v61);
      }
      float v63 = v57 * 0.000000001;
      if (v58 > v63) {
        float v63 = v58;
      }
      float *v59 = sqrtf(v63);
      int v64 = a5[1];
      uint64_t v152 = v51;
      if (v64 == 1)
      {
        int v65 = *(_DWORD *)(v49 + 4 * v52);
        if (v65 == 1)
        {
          int v66 = -1;
          a5 += 2;
          int v67 = -1;
          int v68 = *(_DWORD *)(v46 + 4 * v52);
          if (v68 != -1) {
            goto LABEL_37;
          }
        }
        else
        {
          int v66 = a5[2];
          int v67 = a5[3] + v66;
          int v65 = 1;
          a5 += 2;
          int v68 = *(_DWORD *)(v46 + 4 * v52);
          if (v68 != -1)
          {
LABEL_37:
            uint64_t v69 = v13 - 4 * v54 + 4 * v55;
            long double v70 = a5;
            do
            {
              float v71 = 0.0;
              if (v68 < v66 || v68 >= v67)
              {
                float v73 = 0.0;
              }
              else
              {
                float v72 = *a2++;
                float v73 = v72;
              }
              uint64_t v74 = v68;
              uint64_t v75 = v14[v74];
              uint64_t v76 = *(int *)(v12 + v74 * 4);
              double v77 = (float *)(v13 + 4 * v76 + 4 * (v52 - v75));
              float *v77 = v73;
              if ((int)v75 <= (int)v54) {
                LODWORD(v78) = v54;
              }
              else {
                LODWORD(v78) = v75;
              }
              int v79 = v78 + 3;
              if (v52 > (int)v78 + 3)
              {
                uint64_t v80 = 0;
                if (v75 <= v54) {
                  uint64_t v81 = v54;
                }
                else {
                  uint64_t v81 = v75;
                }
                int v82 = v154 + v81;
                float v83 = 0.0;
                float v84 = 0.0;
                float v85 = 0.0;
                do
                {
                  float v85 = v85
                      + (float)(*(float *)(v13 + 4 * v81 + 4 * v76 - 4 * v75 + 4 * v80)
                              * *(float *)(v69 + 4 * v81 + 4 * v80));
                  int v86 = v80;
                  float v84 = v84 + (float)(v77[v82 + 1 + (int)v80] * v59[v82 + 1 + (int)v80]);
                  float v83 = v83 + (float)(v77[v82 + 2 + (int)v80] * v59[v82 + 2 + (int)v80]);
                  float v71 = v71 + (float)(v77[v79 - v52] * v59[v79 - v52]);
                  v80 += 4;
                  int v79 = v81 + v86 + 7;
                }
                while (v81 + v80 + 3 < v52);
                LODWORD(v78) = v81 + v80;
                float v71 = (float)((float)(v85 + v84) + v83) + v71;
                uint64_t v49 = a6;
              }
              float v87 = v73 - v71;
              float *v77 = v87;
              uint64_t v78 = (int)v78;
              if (v52 > (int)v78)
              {
                uint64_t v88 = v13 - 4 * v75 + 4 * v76;
                do
                {
                  float v87 = v87 - (float)(*(float *)(v88 + 4 * v78) * *(float *)(v69 + 4 * v78));
                  float *v77 = v87;
                  ++v78;
                }
                while (v52 != v78);
              }
              float *v77 = v87 / *v59;
              if (v67 == -1 || v68 + 1 < v67)
              {
                a5 = v70;
              }
              else
              {
                a5 = v70 + 2;
                if (++v65 == *(_DWORD *)(v49 + 4 * v52))
                {
                  int v66 = -1;
                  int v67 = -1;
                }
                else
                {
                  int v66 = v70[2];
                  int v67 = v70[3] + v66;
                }
              }
              int v68 = *(_DWORD *)(v46 + 4 * v68);
              long double v70 = a5;
            }
            while (v68 != -1);
          }
        }
      }
      else
      {
        int v65 = 0;
        int v66 = *a5;
        int v67 = v64 + *a5;
        int v68 = *(_DWORD *)(v46 + 4 * v52);
        if (v68 != -1) {
          goto LABEL_37;
        }
      }
      uint64_t v50 = v52 + 1;
      double v48 = v47;
      if (v52 + 1 < (int)v9)
      {
        uint64_t v89 = v52 + 2;
        int v90 = v9;
        if (v89 < (int)v9) {
          int v90 = *(_DWORD *)&v151[4 * v89];
        }
        uint64_t v91 = *(int *)&v151[4 * v50];
        if (v90 > (int)v91)
        {
          uint64_t v92 = v90;
          do
          {
            --v92;
            int v93 = *((_DWORD *)v47 + v92);
            uint64_t v94 = *(int *)(v45 + 4 * v93);
            int v95 = *(_DWORD *)(v46 + 4 * v94);
            for (BOOL i = v95 == -1; v95 < v93 && v95 != -1; BOOL i = v95 == -1)
            {
              LODWORD(v94) = v95;
              *(_DWORD *)(v45 + 4 * v93) = v95;
              int v95 = *(_DWORD *)(v46 + 4 * v95);
            }
            *(_DWORD *)(v46 + 4 * v93) = v95;
            if (!i)
            {
              *(_DWORD *)(v45 + 4 * v95) = v93;
              LODWORD(v94) = *(_DWORD *)(v45 + 4 * v93);
            }
            *(_DWORD *)(v46 + 4 * (int)v94) = v93;
          }
          while (v92 > v91);
        }
      }
      uint64_t v51 = v152 + 4;
      --v154;
      if (v50 == v9) {
        goto LABEL_79;
      }
    }
  }
  if ((int)v9 >= 1)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 1;
    uint64_t v19 = *a1;
    do
    {
      uint64_t v20 = v14[v17];
      uint64_t v21 = *(int *)(v12 + 4 * v17);
      uint64_t v22 = v13 + 4 * v21;
      float v23 = *a2++;
      float v24 = v23;
      float v25 = v23;
      uint64_t v26 = v17 - v20;
      *(float *)(v22 + 4 * (v17 - v20)) = v23;
      if (v17 > v20)
      {
        uint64_t v27 = (float *)(v19 + 4 * (v16 + v21));
        uint64_t v28 = v20;
        float v25 = v24;
        do
        {
          float v29 = *v27++;
          float v25 = v25 - (float)(v29 * v29);
          *(float *)(v22 + 4 * v26) = v25;
          ++v28;
        }
        while (v17 != v28);
      }
      float v30 = v24 * 0.000000001;
      if (v25 > v30) {
        float v30 = v25;
      }
      *(float *)(v22 + 4 * v26) = sqrtf(v30);
      uint64_t v31 = v17 + 1;
      if (v17 + 1 < v9)
      {
        uint64_t v32 = v13 - 4 * v20 + 4 * v21;
        uint64_t v33 = v18;
        do
        {
          uint64_t v34 = v14[v33];
          uint64_t v35 = v17 - v34;
          if (v17 < v34) {
            break;
          }
          float v36 = 0.0;
          if ((int)v33 - (int)v17 < *(_DWORD *)(a3 + 4 * v17))
          {
            float v37 = *a2++;
            float v36 = v37;
          }
          uint64_t v38 = *(int *)(v12 + 4 * v33);
          uint64_t v39 = v13 + 4 * v38;
          *(float *)(v39 + 4 * v35) = v36;
          if (v17 > v34)
          {
            uint64_t v40 = 4 * (v16 + v38);
            do
            {
              float v36 = v36 - (float)(*(float *)(v19 + v40) * *(float *)(v32 + 4 * v34));
              *(float *)(v39 + 4 * v35) = v36;
              ++v34;
              v40 += 4;
            }
            while (v17 != v34);
          }
          *(float *)(v39 + 4 * v35) = v36 / *(float *)(v22 + 4 * v26);
          ++v33;
        }
        while (v33 != v9);
      }
      ++v18;
      v19 += 4;
      --v16;
      ++v17;
    }
    while (v31 != v9);
  }
  if (!v15) {
    return;
  }
LABEL_80:
  int v99 = v15 + v9;
  if ((int)v9 >= 1)
  {
    if (v15 < 1) {
      return;
    }
    uint64_t v100 = 0;
    uint64_t v101 = 0;
    uint64_t v102 = 4 * v99;
    uint64_t v103 = v13;
    int64x2_t v104 = v11;
    do
    {
      uint64_t v105 = *(int *)(v12 + 4 * v101);
      uint64_t v106 = v13 + 4 * v105;
      uint64_t v107 = v14[v101];
      uint64_t v108 = v101 - v107;
      if (v101 <= v107)
      {
        double v118 = v104;
        int64_t v119 = v9;
        do
        {
          float v120 = *a4++;
          float *v118 = v120;
          float *v118 = v120 / *(float *)(v106 + 4 * v108);
          ++v119;
          double v118 = (float *)((char *)v118 + v102);
        }
        while (v119 < v99);
      }
      else
      {
        double v109 = &v11[v101];
        double v110 = (float *)(v103 + 4 * (v100 + v105));
        double v111 = v11;
        int64_t v112 = v9;
        do
        {
          unint64_t v113 = (v112 - v9) * v99;
          float v114 = *a4;
          v109[v113] = *a4;
          double v115 = v110;
          uint64_t v116 = v107;
          do
          {
            float v117 = *v115++;
            float v114 = v114 - (float)(v111[v116] * v117);
            v109[v113] = v114;
            ++v116;
          }
          while (v101 != v116);
          ++a4;
          v109[v113] = v114 / *(float *)(v106 + 4 * v108);
          ++v112;
          double v111 = (float *)((char *)v111 + v102);
        }
        while (v112 < v99);
      }
      ++v101;
      ++v104;
      v103 += 4;
      --v100;
    }
    while (v101 != v9);
  }
  if (v15 >= 1)
  {
    uint64_t v121 = (int)v9 + 1;
    double v122 = &v11[(v121 - v10) * v99];
    uint64_t v123 = 4 * v99;
    int v124 = -(int)v9;
    double v125 = v11;
    for (uint64_t j = v10; ; ++j)
    {
      float64_t v127 = &a4[j - v10];
      double v128 = &v11[(j - v10) * v99 + j];
      float v129 = *v127;
      *double v128 = *v127;
      float v130 = v129;
      if (j >= 1)
      {
        uint64_t v131 = j;
        float64x2_t v132 = v125;
        float v130 = v129;
        do
        {
          float v133 = *v132++;
          float v130 = v130 - (float)(v133 * v133);
          *double v128 = v130;
          --v131;
        }
        while (v131);
      }
      float v134 = v129 * 0.000000001;
      if (v130 > v134) {
        float v134 = v130;
      }
      *double v128 = sqrtf(v134);
      if (j + 1 >= v99) {
        return;
      }
      a4 = v127 + 1;
      double v135 = v122;
      uint64_t v136 = v121;
      do
      {
        BOOL v137 = &v11[j + (v136 - v10) * v99];
        float v138 = *a4;
        *BOOL v137 = *a4;
        if (j < 4)
        {
          LODWORD(v140) = 0;
          float v146 = v138 - 0.0;
          *BOOL v137 = v146;
          if (j <= 0) {
            goto LABEL_103;
          }
LABEL_110:
          uint64_t v147 = v140;
          do
          {
            float v146 = v146 - (float)(v135[v147] * v125[v147]);
            *BOOL v137 = v146;
            ++v147;
          }
          while (v147 < j);
          goto LABEL_103;
        }
        uint64_t v139 = 0;
        uint64_t v140 = 0;
        float v141 = 0.0;
        float v142 = 0.0;
        float v143 = 0.0;
        float v144 = 0.0;
        do
        {
          float v144 = v144 + (float)(v135[v139] * v125[v139]);
          float v143 = v143 + (float)(v137[v124 + 1 + (int)v140] * v128[v124 + 1 + (int)v140]);
          float v142 = v142 + (float)(v137[v124 + 2 + (int)v140] * v128[v124 + 2 + (int)v140]);
          float v141 = v141 + (float)(v135[v139 + 3] * v125[v139 + 3]);
          uint64_t v145 = v140 + 7;
          v140 += 4;
          v139 += 4;
        }
        while (v145 < j);
        float v146 = v138 - (float)((float)((float)(v144 + v143) + v142) + v141);
        *BOOL v137 = v146;
        if (j > (int)v140) {
          goto LABEL_110;
        }
LABEL_103:
        *BOOL v137 = v146 / *v128;
        ++v136;
        ++a4;
        double v135 = (float *)((char *)v135 + v123);
      }
      while (v99 != v136);
      ++v121;
      double v125 = (float *)((char *)v125 + v123);
      double v122 = (float *)((char *)v122 + v123);
      --v124;
    }
  }
}

void cholskyf_solve(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(unsigned int *)(a1 + 24);
  uint64_t v7 = *(unsigned int *)(a1 + 40);
  int v112 = v7;
  uint64_t v9 = *(void *)(a1 + 8);
  double v8 = *(int **)(a1 + 16);
  uint64_t v10 = (int)v7 + (int)v6;
  unint64_t v11 = (float *)malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  uint64_t v12 = v6;
  uint64_t v13 = v11;
  uint64_t v14 = a1;
  int v15 = *(float **)a1;
  uint64_t v16 = *(float **)(a1 + 32);
  if ((int)v12 >= 1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = v15;
    do
    {
      float v20 = *(float *)(a3 + 4 * v17);
      v11[v17] = v20;
      uint64_t v21 = v8[v17];
      if (v17 > v21)
      {
        do
        {
          float v22 = *v18++;
          float v20 = v20 - (float)(v22 * v11[v21]);
          v11[v17] = v20;
          ++v21;
        }
        while (v17 != v21);
      }
      float v19 = *v18++;
      v11[v17++] = v20 / v19;
    }
    while (v17 != v12);
  }
  uint64_t v23 = 4 * v10;
  if ((int)v7 >= 1)
  {
    uint64_t v24 = (int)v12;
    float v25 = v16;
    do
    {
      float v26 = *(float *)(a3 + 4 * v24);
      v11[v24] = v26;
      if (v24 >= 1)
      {
        uint64_t v27 = v24;
        uint64_t v28 = v11;
        do
        {
          float v29 = *v25++;
          float v30 = v29;
          float v31 = *v28++;
          float v26 = v26 - (float)(v30 * v31);
          v11[v24] = v26;
          --v27;
        }
        while (v27);
      }
      v11[v24++] = v26 / *v25;
      v25 += v10 - v24 + 1;
    }
    while (v10 > v24);
    uint64_t v32 = 0;
    uint64_t v33 = v7 + (int)v12;
    uint64_t v34 = (uint64_t)&v16[v7 - 1 + v7 * ((int)v12 + (uint64_t)(int)v7) + (int)v12];
    do
    {
      uint64_t v35 = v33--;
      float v36 = v11[v33];
      *(float *)(a2 + 4 * v33) = v36;
      if (v35 < v10)
      {
        float v37 = (float *)v34;
        uint64_t v38 = v32;
        do
        {
          float v36 = v36 - (float)(*v37 * *(float *)(a2 + 4 * (v7 + (int)v12) + 4 * v38));
          *(float *)(a2 + 4 * v33) = v36;
          float v37 = (float *)((char *)v37 + v23);
          ++v38;
        }
        while (v38);
      }
      *(float *)(a2 + 4 * v33) = v36 / v16[v33 + ((int)v33 - (int)v12) * (int)v10];
      --v32;
      v34 += v23 ^ 0xFFFFFFFFFFFFFFFCLL;
    }
    while (v33 > (int)v12);
  }
  if (!*(_DWORD *)(v14 + 44))
  {
    uint64_t v110 = (int)v12;
    uint64_t v111 = v12;
    uint64_t v50 = (char *)malloc_type_malloc(16 * (int)v12, 0x100004052888210uLL);
    if ((int)v111 < 1)
    {
LABEL_67:
      free(v50);
      goto LABEL_68;
    }
    uint64_t v108 = v50;
    double v109 = v16;
    uint64_t v51 = &v50[4 * v110];
    uint64_t v52 = &v51[4 * v110];
    uint64_t v53 = &v52[4 * v110];
    bzero(v51, 4 * v111);
    uint64_t v54 = v8;
    uint64_t v55 = v111;
    do
    {
      uint64_t v56 = *v54++;
      ++*(_DWORD *)&v51[4 * v56];
      --v55;
    }
    while (v55);
    uint64_t v50 = v108;
    if ((int)v111 >= 2)
    {
      float v57 = (int *)&v108[4 * v110];
      int v60 = *v57;
      float v58 = v57 + 1;
      int v59 = v60;
      uint64_t v61 = v111 - 1;
      do
      {
        v59 += *v58;
        *v58++ = v59;
        --v61;
      }
      while (v61);
    }
    for (uint64_t i = 0; i != v111; ++i)
    {
      uint64_t v63 = 4 * v8[i];
      --*(_DWORD *)&v51[v63];
      *(_DWORD *)&v108[4 * *(int *)&v51[4 * v8[i]]] = i;
    }
    if (v111 >= 0xC && (unint64_t)(-4 * v110) >= 0x20)
    {
      uint64_t v64 = v111 & 0x7FFFFFF8;
      uint64_t v91 = &v108[12 * v110 + 16];
      uint64_t v92 = &v108[8 * v110 + 16];
      *(void *)&long long v93 = -1;
      *((void *)&v93 + 1) = -1;
      uint64_t v94 = v111 & 0xFFFFFFF8;
      do
      {
        *((_OWORD *)v91 - 1) = v93;
        *(_OWORD *)uint64_t v91 = v93;
        v91 += 32;
        *((_OWORD *)v92 - 1) = v93;
        *(_OWORD *)uint64_t v92 = v93;
        v92 += 32;
        v94 -= 8;
      }
      while (v94);
      if (v64 == v111)
      {
LABEL_45:
        if (v111 >= 0xC
          && (uint64_t v69 = (int32x4_t *)&v108[12 * v110],
              long double v70 = (int32x4_t *)&v108[8 * v110],
              (unint64_t)((char *)v69 - (char *)v70) >= 0x20))
        {
          uint64_t v71 = v111 & 0x7FFFFFF8;
          int v95 = v70 + 1;
          int64x2_t v96 = v69 + 1;
          int32x4_t v97 = (int32x4_t)xmmword_21BB7A760;
          int32x4_t v98 = (int32x4_t)xmmword_21BB7A720;
          int32x4_t v99 = (int32x4_t)xmmword_21BB7A770;
          v100.i64[0] = -1;
          v100.i64[1] = -1;
          v101.i64[0] = 0x300000003;
          v101.i64[1] = 0x300000003;
          v102.i64[0] = 0x100000001;
          v102.i64[1] = 0x100000001;
          v103.i64[0] = 0x500000005;
          v103.i64[1] = 0x500000005;
          int64x2_t v104 = vdupq_n_s64(8uLL);
          v105.i64[0] = 0x800000008;
          v105.i64[1] = 0x800000008;
          uint64_t v106 = v111 & 0xFFFFFFF8;
          do
          {
            v95[-1] = vaddq_s32(v99, v100);
            *int v95 = vaddq_s32(v99, v101);
            int32x4_t v107 = vuzp1q_s32(v98, v97);
            v96[-1] = vaddq_s32(v107, v102);
            *int64x2_t v96 = vaddq_s32(v107, v103);
            int32x4_t v97 = (int32x4_t)vaddq_s64((int64x2_t)v97, v104);
            int32x4_t v98 = (int32x4_t)vaddq_s64((int64x2_t)v98, v104);
            int32x4_t v99 = vaddq_s32(v99, v105);
            v95 += 2;
            v96 += 2;
            v106 -= 8;
          }
          while (v106);
          if (v71 == v111)
          {
LABEL_50:
            *(_DWORD *)&v53[4 * (v111 - 1)] = -1;
            uint64_t v77 = (uint64_t)&v109[v110 - 1];
            uint64_t v78 = v110;
            do
            {
              uint64_t v79 = v78 - 1;
              uint64_t v80 = 4 * (v78 - 1);
              float v81 = v13[(unint64_t)v80 / 4];
              *(float *)(a2 + v80) = v81;
              for (int j = *(_DWORD *)&v53[v80]; j != -1; int j = *(_DWORD *)&v53[v83])
              {
                uint64_t v83 = 4 * j;
                float v81 = v81
                    - (float)(v15[*(int *)(v9 + v83) + v79 - v8[(unint64_t)v83 / 4]] * *(float *)(a2 + v83));
                *(float *)(a2 + 4 * v79) = v81;
              }
              uint64_t v84 = *(int *)&v51[4 * v79];
              LODWORD(v85) = v111;
              if (v78 < v110) {
                LODWORD(v85) = *(_DWORD *)&v51[4 * v78];
              }
              if ((int)v85 > (int)v84)
              {
                uint64_t v85 = (int)v85;
                do
                {
                  uint64_t v86 = *(int *)&v108[4 * v85 - 4];
                  uint64_t v87 = *(int *)&v52[4 * v86];
                  if (v87 != -1) {
                    *(_DWORD *)&v53[4 * v87] = *(_DWORD *)&v53[4 * v86];
                  }
                  uint64_t v88 = *(int *)&v53[4 * v86];
                  if (v88 != -1) {
                    *(_DWORD *)&v52[4 * v88] = *(_DWORD *)&v52[4 * v86];
                  }
                  --v85;
                }
                while (v85 > v84);
              }
              if (v112 >= 1)
              {
                uint64_t v89 = (float *)v77;
                uint64_t v90 = v110;
                do
                {
                  float v81 = v81 - (float)(*v89 * *(float *)(a2 + 4 * v90));
                  *(float *)(a2 + 4 * v79) = v81;
                  ++v90;
                  uint64_t v89 = (float *)((char *)v89 + v23);
                }
                while (v90 < v10);
              }
              *(float *)(a2 + v80) = v81 / v15[*(int *)(v9 + v80) + v79 - v8[(unint64_t)v80 / 4]];
              v77 -= 4;
              BOOL v42 = v78-- <= 1;
            }
            while (!v42);
            goto LABEL_67;
          }
        }
        else
        {
          uint64_t v71 = 0;
        }
        uint64_t v72 = 4 * v71;
        float v73 = &v108[12 * (int)v110 + 4 * v71];
        uint64_t v74 = v111 - v71;
        int v75 = v71 + 1;
        uint64_t v76 = &v108[8 * v110 + v72];
        do
        {
          *(_DWORD *)uint64_t v76 = v75 - 2;
          v76 += 4;
          *(_DWORD *)float v73 = v75;
          v73 += 4;
          ++v75;
          --v74;
        }
        while (v74);
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v64 = 0;
    }
    uint64_t v65 = v111 - v64;
    uint64_t v66 = 4 * v64;
    int v67 = &v108[8 * v110 + 4 * v64];
    int v68 = &v108[12 * (int)v110 + v66];
    do
    {
      *(_DWORD *)int v68 = -1;
      v68 += 4;
      *(_DWORD *)int v67 = -1;
      v67 += 4;
      --v65;
    }
    while (v65);
    goto LABEL_45;
  }
  if ((int)v12 >= 1)
  {
    uint64_t v39 = 0;
    uint64_t v40 = (uint64_t)&v16[v12 - 1];
    uint64_t v41 = v12;
    do
    {
      uint64_t v43 = v41 - 1;
      uint64_t v44 = 4 * (v41 - 1);
      float v45 = v11[(unint64_t)v44 / 4];
      *(float *)(a2 + v44) = v45;
      if (v41 < v12)
      {
        uint64_t v46 = v39;
        do
        {
          uint64_t v47 = v8[v12 + v46];
          if (v41 <= v47) {
            break;
          }
          float v45 = v45 - (float)(v15[*(int *)(v9 + 4 * v12 + 4 * v46) + v43 - v47] * *(float *)(a2 + 4 * v12 + 4 * v46));
          *(float *)(a2 + 4 * v43) = v45;
          ++v46;
        }
        while (v46);
      }
      if ((int)v7 >= 1)
      {
        double v48 = (float *)v40;
        uint64_t v49 = v12;
        do
        {
          float v45 = v45 - (float)(*v48 * *(float *)(a2 + 4 * v49));
          *(float *)(a2 + 4 * v43) = v45;
          ++v49;
          double v48 = (float *)((char *)v48 + v23);
        }
        while (v49 < v10);
      }
      *(float *)(a2 + v44) = v45 / v15[*(int *)(v9 + v44) + v43 - v8[(unint64_t)v44 / 4]];
      --v39;
      v40 -= 4;
      BOOL v42 = v41-- <= 1;
    }
    while (!v42);
  }
LABEL_68:
  free(v13);
}

void vl_locability_model_load(int a1, int a2, int a3, const char *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  double v8 = malloc_type_calloc(1uLL, 0x50uLL, 0x10800402CAE816BuLL);
  uint64_t v9 = v8;
  model = (uint64_t)v8;
  *double v8 = a1;
  if (a1 == 100)
  {
    long long v10 = xmmword_21BB7CE60;
    uint64_t v11 = (uint64_t)v8;
  }
  else
  {
    printf("%sError : ", (const char *)&str_1_0);
    if (a1 == 1) {
      printf("Promote your model here!");
    }
    else {
      printf("In %s : model version %d not defined");
    }
    putchar(10);
    long long v10 = xmmword_21BB7CE70;
    uint64_t v11 = model;
  }
  *(_OWORD *)(v9 + 1) = v10;
  free(*(void **)(v11 + 24));
  uint64_t v12 = malloc_type_malloc(4 * a3 / 16 * (a2 / 16) + 4095, 0xAD4DCA7BuLL);
  uint64_t v13 = model;
  *(void *)(model + 24) = v12;
  *(void *)(v13 + 32) = (char *)v12 + (-(int)v12 & 0xFFFLL);
  free(*(void **)(v13 + 40));
  uint64_t v14 = malloc_type_malloc(0x1003uLL, 0xE2AAD0CuLL);
  uint64_t v15 = model;
  *(void *)(model + 40) = v14;
  *(void *)(v15 + 48) = (char *)v14 + (-(int)v14 & 0xFFFLL);
  free(*(void **)(v15 + 56));
  uint64_t v16 = malloc_type_malloc(0x1003uLL, 0x2F694810uLL);
  uint64_t v17 = model;
  *(void *)(model + 56) = v16;
  *(void *)(v17 + 64) = (char *)v16 + (-(int)v16 & 0xFFFLL);
  sprintf(v20, "espressos/loc_v%d.mlmodelc", v9[3]);
  if (a4) {
    uint64_t v18 = a4;
  }
  else {
    uint64_t v18 = "com.apple.3dv.vl";
  }
  vl_get_model_path(&v19, v18, v20);
  operator new();
}

void sub_21BB5697C(_Unwind_Exception *a1)
{
  MEMORY[0x21D498F90](v2, 0x1080C40AA79BA9DLL);
  MEMORY[0x21D498F90](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void vl_locability_model_free()
{
  uint64_t v0 = model;
  if (model)
  {
    uint64_t v1 = *(vl_img_esp_nets_t **)(model + 72);
    if (v1)
    {
      vl_img_esp_nets_t::~vl_img_esp_nets_t(v1);
      MEMORY[0x21D498F90]();
      *(void *)(v0 + 72) = 0;
      uint64_t v0 = model;
    }
    free(*(void **)(v0 + 24));
    free(*(void **)(model + 40));
    free(*(void **)(model + 56));
    free((void *)model);
    model = 0;
  }
}

uint64_t vl_locability_forward()
{
  uint64_t result = espresso_plan_execute_sync();
  if ((result & 0x80000000) != 0)
  {
    uint64_t v1 = (FILE *)*MEMORY[0x263EF8348];
    status_string = (const char *)espresso_get_status_string();
    fprintf(v1, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 186, status_string);
    exception = __cxa_allocate_exception(0x10uLL);
    uint64_t v4 = espresso_get_status_string();
    MEMORY[0x21D498F60](exception, v4);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_21BB56B04(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t *vl_img_esp_net_t::vl_img_esp_net_t(uint64_t *a1)
{
  *a1 = espresso_create_context_auto();
  a1[1] = espresso_create_plan();
  espresso_get_default_storage_type();
  if ((espresso_plan_add_network() & 0x80000000) != 0)
  {
    double v3 = (FILE *)*MEMORY[0x263EF8348];
    status_string = (const char *)espresso_get_status_string();
    fprintf(v3, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 68, status_string);
    exception = __cxa_allocate_exception(0x10uLL);
    uint64_t v6 = espresso_get_status_string();
    MEMORY[0x21D498F60](exception, v6);
    goto LABEL_18;
  }
  if ((espresso_network_change_blob_shape() & 0x80000000) != 0)
  {
    uint64_t v7 = (FILE *)*MEMORY[0x263EF8348];
    double v8 = (const char *)espresso_get_status_string();
    fprintf(v7, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 72, v8);
    exception = __cxa_allocate_exception(0x10uLL);
    uint64_t v9 = espresso_get_status_string();
    MEMORY[0x21D498F60](exception, v9);
    goto LABEL_18;
  }
  if ((espresso_network_change_blob_shape() & 0x80000000) != 0)
  {
    long long v10 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v11 = (const char *)espresso_get_status_string();
    fprintf(v10, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 73, v11);
    exception = __cxa_allocate_exception(0x10uLL);
    uint64_t v12 = espresso_get_status_string();
    MEMORY[0x21D498F60](exception, v12);
    goto LABEL_18;
  }
  if ((espresso_network_change_blob_shape() & 0x80000000) != 0)
  {
    uint64_t v13 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v14 = (const char *)espresso_get_status_string();
    fprintf(v13, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 74, v14);
    exception = __cxa_allocate_exception(0x10uLL);
    uint64_t v15 = espresso_get_status_string();
    MEMORY[0x21D498F60](exception, v15);
    goto LABEL_18;
  }
  if ((espresso_plan_build() & 0x80000000) != 0)
  {
    uint64_t v16 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v17 = (const char *)espresso_get_status_string();
    fprintf(v16, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 76, v17);
    exception = __cxa_allocate_exception(0x10uLL);
    uint64_t v18 = espresso_get_status_string();
    MEMORY[0x21D498F60](exception, v18);
LABEL_18:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ((espresso_buffer_pack_tensor_shape() & 0x80000000) != 0)
  {
    char v19 = (FILE *)*MEMORY[0x263EF8348];
    float v20 = (const char *)espresso_get_status_string();
    fprintf(v19, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 84, v20);
    uint64_t v21 = __cxa_allocate_exception(0x10uLL);
    uint64_t v22 = espresso_get_status_string();
    MEMORY[0x21D498F60](v21, v22);
    __cxa_throw(v21, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ((espresso_buffer_pack_tensor_shape() & 0x80000000) != 0)
  {
    uint64_t v23 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v24 = (const char *)espresso_get_status_string();
    fprintf(v23, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 85, v24);
    float v25 = __cxa_allocate_exception(0x10uLL);
    uint64_t v26 = espresso_get_status_string();
    MEMORY[0x21D498F60](v25, v26);
    __cxa_throw(v25, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ((espresso_buffer_pack_tensor_shape() & 0x80000000) != 0)
  {
    uint64_t v27 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v28 = (const char *)espresso_get_status_string();
    fprintf(v27, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 86, v28);
    float v29 = __cxa_allocate_exception(0x10uLL);
    uint64_t v30 = espresso_get_status_string();
    MEMORY[0x21D498F60](v29, v30);
    __cxa_throw(v29, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ((espresso_network_bind_buffer() & 0x80000000) != 0)
  {
    float v31 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v32 = (const char *)espresso_get_status_string();
    fprintf(v31, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 89, v32);
    uint64_t v33 = __cxa_allocate_exception(0x10uLL);
    uint64_t v34 = espresso_get_status_string();
    MEMORY[0x21D498F60](v33, v34);
    __cxa_throw(v33, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ((espresso_network_bind_buffer() & 0x80000000) != 0)
  {
    uint64_t v35 = (FILE *)*MEMORY[0x263EF8348];
    float v36 = (const char *)espresso_get_status_string();
    fprintf(v35, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 91, v36);
    float v37 = __cxa_allocate_exception(0x10uLL);
    uint64_t v38 = espresso_get_status_string();
    MEMORY[0x21D498F60](v37, v38);
    __cxa_throw(v37, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ((espresso_network_bind_buffer() & 0x80000000) != 0)
  {
    uint64_t v39 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v40 = (const char *)espresso_get_status_string();
    fprintf(v39, "Error: %s:%d %s\n", "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/lib/verify/vl_verify_img.mm", 93, v40);
    uint64_t v41 = __cxa_allocate_exception(0x10uLL);
    uint64_t v42 = espresso_get_status_string();
    MEMORY[0x21D498F60](v41, v42);
    __cxa_throw(v41, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_21BB57278(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB5728C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB572A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB572B4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB572C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB572DC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB572F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB57304(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB57318(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB5732C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21BB57340(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void vl_img_esp_nets_t::~vl_img_esp_nets_t(vl_img_esp_nets_t *this)
{
  uint64_t v2 = *(void *)this;
  if (*(void *)this)
  {
    espresso_plan_build_clean();
    espresso_plan_destroy();
    espresso_context_destroy();
    MEMORY[0x21D498F90](v2, 0x1080C40AA79BA9DLL);
  }
  uint64_t v3 = *((void *)this + 1);
  if (v3)
  {
    espresso_plan_build_clean();
    espresso_plan_destroy();
    espresso_context_destroy();
    MEMORY[0x21D498F90](v3, 0x1080C40AA79BA9DLL);
  }
}

_DWORD *vl_match_sss_build(uint64_t a1, void *a2, int a3, int a4, int *a5)
{
  int v9 = *a5;
  long long v22 = xmmword_21BB7B340;
  long long v23 = xmmword_21BB7B350;
  int v24 = 0;
  uint64_t v25 = 0x3DCCCCCD3F800000;
  long long v26 = xmmword_21BB7B360;
  if (v9 <= 199)
  {
    switch(v9)
    {
      case 'd':
        HIDWORD(v25) = 1065353216;
        int v24 = 1;
        DWORD2(v23) = 2;
        *(void *)&long long v23 = 0x800000040;
        if (!*(_DWORD *)(a1 + 1564)) {
          goto LABEL_27;
        }
        goto LABEL_15;
      case 'e':
        int v24 = 1;
        DWORD2(v23) = 2;
        HIDWORD(v25) = 1065353216;
        DWORD2(v26) = 4;
        *(void *)&long long v23 = 0xA00000040;
        if (!*(_DWORD *)(a1 + 1564)) {
          goto LABEL_27;
        }
        goto LABEL_15;
      case 'f':
        int v24 = 1;
        DWORD2(v23) = 2;
        HIDWORD(v25) = 1065353216;
        DWORD2(v26) = 10;
        *(void *)&long long v23 = 0x1000000040;
        if (!*(_DWORD *)(a1 + 1564)) {
          goto LABEL_27;
        }
        goto LABEL_15;
      case 'g':
        int v24 = 1;
        DWORD2(v23) = 2;
        HIDWORD(v25) = 1065353216;
        DWORD2(v26) = 2;
        *(void *)&long long v23 = 0x600000040;
        if (!*(_DWORD *)(a1 + 1564)) {
          goto LABEL_27;
        }
        goto LABEL_15;
      case 'h':
        int v24 = 1;
        DWORD2(v23) = 2;
        HIDWORD(v25) = 1065353216;
        DWORD2(v26) = 2;
        goto LABEL_26;
      default:
        if (v9) {
          goto LABEL_34;
        }
        if (*(_DWORD *)(a1 + 1564)) {
          goto LABEL_15;
        }
        goto LABEL_27;
    }
  }
  if (v9 > 201)
  {
    if (v9 == 202)
    {
      DWORD2(v23) = 2;
      *(void *)((char *)&v26 + 4) = 0x100000006;
LABEL_26:
      *(void *)&long long v23 = 0x400000050;
      if (!*(_DWORD *)(a1 + 1564)) {
        goto LABEL_27;
      }
    }
    else
    {
      if (v9 != 706) {
LABEL_34:
      }
        __assert_rtn("sss_par_version", "sss.c", 255, "0 && \"Not implemented\"");
      int v24 = 1;
      DWORD2(v23) = 2;
      HIDWORD(v25) = 1065353216;
      DWORD2(v26) = 2;
      *(void *)&long long v23 = 0x800000060;
      if (!*(_DWORD *)(a1 + 1564)) {
        goto LABEL_27;
      }
    }
    goto LABEL_15;
  }
  if (v9 == 200)
  {
    DWORD2(v23) = 2;
    DWORD1(v26) = 6;
    *(void *)&long long v23 = 0x200000050;
    if (!*(_DWORD *)(a1 + 1564)) {
      goto LABEL_27;
    }
LABEL_15:
    *(void *)(a1 + 1472) -= mach_absolute_time();
    goto LABEL_28;
  }
  DWORD2(v23) = 2;
  *(void *)((char *)&v26 + 4) = 6;
  *(void *)&long long v23 = 0x300000050;
  if (*(_DWORD *)(a1 + 1564)) {
    goto LABEL_15;
  }
LABEL_27:
  clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 1384));
  clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 1368));
  clock_gettime(_CLOCK_MONOTONIC, (timespec *)(a1 + 1352));
LABEL_28:
  long long v10 = sss_create_ids(a2, 0, a4, a3, &v22);
  if (!*(_DWORD *)(a1 + 1564))
  {
    clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 1416));
    clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 1432));
    clock_gettime(_CLOCK_MONOTONIC, (timespec *)(a1 + 1400));
    uint64_t v18 = *(void *)(a1 + 1408)
        - *(void *)(a1 + 1360)
        + 1000000000 * (*(void *)(a1 + 1400) - *(void *)(a1 + 1352));
    *(void *)(a1 + 1448) = v18;
    *(void *)(a1 + 1472) += v18;
    uint64_t v19 = *(void *)(a1 + 1424)
        - *(void *)(a1 + 1376)
        + 1000000000 * (*(void *)(a1 + 1416) - *(void *)(a1 + 1368));
    *(void *)(a1 + 1456) = v19;
    *(void *)(a1 + 1480) += v19;
    uint64_t v20 = *(void *)(a1 + 1440)
        - *(void *)(a1 + 1392)
        + 1000000000 * (*(void *)(a1 + 1432) - *(void *)(a1 + 1384));
    *(void *)(a1 + 1464) = v20;
    *(void *)(a1 + 1488) += v20;
    ++*(_DWORD *)(a1 + 1496);
    if (*(_DWORD *)(a1 + 1564)) {
      goto LABEL_30;
    }
LABEL_32:
    log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v11, v12, v13, v14, v15, v16, v17, (char)&str_4_1);
    return v10;
  }
  *(void *)(a1 + 1472) += mach_absolute_time();
  if (!*(_DWORD *)(a1 + 1564)) {
    goto LABEL_32;
  }
LABEL_30:
  printf("Verbose : ");
  printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 1500), (double)*(uint64_t *)(a1 + 1472) * 0.000001);
  putchar(10);
  return v10;
}

void vl_match_sss(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5, int *a6, void *a7)
{
  uint64_t v12 = *a2 / a5;
  uint64_t v13 = (float *)malloc_type_calloc(2 * (int)v12, 4uLL, 0x100004052888210uLL);
  uint64_t v14 = v13;
  int v15 = *a6;
  long long v36 = xmmword_21BB7B340;
  long long v37 = xmmword_21BB7B350;
  int v38 = 0;
  uint64_t v39 = 0x3DCCCCCD3F800000;
  long long v40 = xmmword_21BB7B360;
  if (v15 <= 199)
  {
    switch(v15)
    {
      case 'd':
        HIDWORD(v39) = 1065353216;
        int v38 = 1;
        DWORD2(v37) = 2;
        uint64_t v16 = 0x800000040;
        goto LABEL_20;
      case 'e':
        int v38 = 1;
        DWORD2(v37) = 2;
        HIDWORD(v39) = 1065353216;
        DWORD2(v40) = 4;
        uint64_t v16 = 0xA00000040;
        goto LABEL_20;
      case 'f':
        int v38 = 1;
        DWORD2(v37) = 2;
        HIDWORD(v39) = 1065353216;
        DWORD2(v40) = 10;
        uint64_t v16 = 0x1000000040;
        goto LABEL_20;
      case 'g':
        int v38 = 1;
        DWORD2(v37) = 2;
        HIDWORD(v39) = 1065353216;
        DWORD2(v40) = 2;
        uint64_t v16 = 0x600000040;
        goto LABEL_20;
      case 'h':
        int v38 = 1;
        DWORD2(v37) = 2;
        HIDWORD(v39) = 1065353216;
        DWORD2(v40) = 2;
        goto LABEL_19;
      default:
        if (v15) {
          goto LABEL_36;
        }
        if ((int)v12 < 1) {
          goto LABEL_27;
        }
        goto LABEL_21;
    }
  }
  if (v15 > 201)
  {
    if (v15 == 202)
    {
      DWORD2(v37) = 2;
      *(void *)((char *)&v40 + 4) = 0x100000006;
LABEL_19:
      uint64_t v16 = 0x400000050;
    }
    else
    {
      if (v15 != 706) {
LABEL_36:
      }
        __assert_rtn("sss_par_version", "sss.c", 255, "0 && \"Not implemented\"");
      int v38 = 1;
      DWORD2(v37) = 2;
      HIDWORD(v39) = 1065353216;
      DWORD2(v40) = 2;
      uint64_t v16 = 0x800000060;
    }
  }
  else
  {
    DWORD2(v37) = 2;
    if (v15 == 200)
    {
      DWORD1(v40) = 6;
      uint64_t v16 = 0x200000050;
    }
    else
    {
      *(void *)((char *)&v40 + 4) = 6;
      uint64_t v16 = 0x300000050;
    }
  }
LABEL_20:
  *(void *)&long long v37 = v16;
  if ((int)v12 >= 1)
  {
LABEL_21:
    uint64_t v17 = a2[1];
    float v18 = (float)(255 * a5);
    uint64_t v19 = (char *)a7[1];
    if (v13)
    {
      uint64_t v20 = 0;
      uint64_t v21 = (uint64_t)v13;
      do
      {
        sss_knn(a4, (uint64_t)&v36, v18, v17 + v20 * *(int *)(a4 + 260), v19, v21, 2);
        ++v20;
        v19 += 8;
        v21 += 8;
      }
      while (v12 != v20);
    }
    else
    {
      uint64_t v22 = 0;
      do
      {
        sss_knn(a4, (uint64_t)&v36, v18, v17 + v22 * *(int *)(a4 + 260), v19, 0, 2);
        ++v22;
        v19 += 8;
      }
      while (v12 != v22);
    }
  }
LABEL_27:
  if ((int)a7[3] >= 1)
  {
    unint64_t v23 = a7[3];
    uint64_t v24 = a7[4];
    if (v23 < 8)
    {
      uint64_t v25 = 0;
LABEL_33:
      unint64_t v31 = v23 - v25;
      uint64_t v32 = 8 * v25;
      uint64_t v33 = (int32x2_t *)&v14[2 * v25];
      uint64_t v34 = (float32x2_t *)(v24 + v32);
      do
      {
        int32x2_t v35 = *v33++;
        *v34++ = vcvt_f32_s32(v35);
        --v31;
      }
      while (v31);
      goto LABEL_35;
    }
    uint64_t v25 = a7[3] & 0x7FFFFFF8;
    long long v26 = (float *)(v24 + 32);
    uint64_t v27 = v14 + 8;
    uint64_t v28 = a7[3] & 0xFFFFFFF8;
    do
    {
      float v29 = v27 - 8;
      float32x4x2_t v41 = vld2q_f32(v29);
      float32x4x2_t v42 = vld2q_f32(v27);
      v43.val[0] = vcvtq_f32_s32((int32x4_t)v41.val[0]);
      v43.val[1] = vcvtq_f32_s32((int32x4_t)v41.val[1]);
      uint64_t v30 = v26 - 8;
      vst2q_f32(v30, v43);
      v41.val[0] = vcvtq_f32_s32((int32x4_t)v42.val[0]);
      v41.val[1] = vcvtq_f32_s32((int32x4_t)v42.val[1]);
      vst2q_f32(v26, v41);
      v26 += 16;
      v27 += 16;
      v28 -= 8;
    }
    while (v28);
    if ((v23 & 7) != 0) {
      goto LABEL_33;
    }
  }
LABEL_35:
  free(v14);
}

uint64_t vl_pose_p2p(float *a1, float *a2, float *a3, float *a4, float *a5, float *a6)
{
  float v6 = *a1;
  float v7 = a1[1];
  float v8 = *a2;
  float v9 = a2[1];
  float v10 = a3[1];
  float v11 = a3[2];
  float v12 = a4[1];
  float v13 = a4[2];
  float v14 = *a5;
  float v15 = a5[1];
  float v17 = a5[6];
  float v16 = a5[7];
  float v113 = (float)(v10 * (float)(v15 - (float)(v16 * *a1))) + (float)(*a3 * (float)(*a5 - (float)(v17 * *a1)));
  float v18 = a5[8];
  float v19 = a5[2];
  float v20 = a5[3];
  float v21 = v19 - (float)(v18 * *a1);
  float v22 = *a5 - (float)(v17 * *a2);
  float v23 = v15 - (float)(v16 * *a2);
  float v107 = v19;
  float v24 = v19 - (float)(v18 * *a2);
  float v25 = a5[4];
  float v26 = a5[5];
  float v27 = (float)(v10 * (float)(v25 - (float)(v16 * v7))) + (float)(*a3 * (float)(v20 - (float)(v17 * v7)));
  float v28 = v26 - (float)(v18 * v7);
  float v29 = v20 - (float)(v17 * v9);
  float v30 = v25 - (float)(v16 * v9);
  float v114 = v18;
  float v112 = v26;
  float v31 = v26 - (float)(v18 * v9);
  float v32 = v7 - v9;
  float v33 = (float)((float)(v7 - v9)
              * (float)((float)((float)((float)(v113 - (float)(v11 * v21)) - (float)(*a4 * v22)) - (float)(v12 * v23))
                      + (float)(v13 * v24)))
      - (float)((float)(*a1 - *a2)
              * (float)((float)((float)((float)(v27 - (float)(v11 * v28)) - (float)(*a4 * v29)) - (float)(v12 * v30))
                      + (float)(v13 * v31)));
  float v108 = *a1;
  float v111 = v7;
  float v34 = v10;
  float v35 = (float)((float)(v7 - v9)
              * (float)((float)((float)((float)(v10 * (float)((float)(v6 * (float)(v17 * -2.0)) + (float)(v14 * 2.0)))
                                      - (float)(*a3 * (float)((float)(v6 * (float)(v16 * -2.0)) + (float)(v15 * 2.0))))
                              - (float)(v12 * (float)((float)(v8 * (float)(v17 * -2.0)) + (float)(v14 * 2.0))))
                      + (float)(*a4 * (float)((float)(v8 * (float)(v16 * -2.0)) + (float)(v15 * 2.0)))))
      - (float)((float)(v6 - v8)
              * (float)((float)((float)((float)(v10 * (float)((float)(v7 * (float)(v17 * -2.0)) + (float)(v20 * 2.0)))
                                      - (float)(*a3 * (float)((float)(v7 * (float)(v16 * -2.0)) + (float)(v25 * 2.0))))
                              - (float)(v12 * (float)((float)(v9 * (float)(v17 * -2.0)) + (float)(v20 * 2.0))))
                      + (float)(*a4 * (float)((float)(v9 * (float)(v16 * -2.0)) + (float)(v25 * 2.0)))));
  float v109 = *a1 - *a2;
  float v110 = v12;
  float v36 = sqrtf((float)((float)((float)(v109* (float)((float)((float)((float)(v27 + (float)(v11 * v28)) - (float)(*a4 * v29))- (float)(v12 * v30))- (float)(v13 * v31)))- (float)(v32* (float)((float)((float)((float)(v113 + (float)(v11 * v21)) - (float)(*a4 * v22))- (float)(v12 * v23))- (float)(v13 * v24))))* (float)(v33 * -4.0))+ (float)(v35 * v35));
  float v37 = (float)(v36 - v35) / (float)(v33 + v33);
  float v38 = v17;
  float v39 = (float)((float)-v35 - v36) / (float)(v33 + v33);
  float v40 = (float)(v37 * v37) + 1.0;
  float v41 = (float)(v37 * v37) + -1.0;
  float v42 = (float)(v41 * (float)-v17) + (float)((float)(v16 + v16) * v37);
  float v43 = v7 * (float)-v18;
  float v44 = (float)((float)((float)(v43 * v40) + (float)(v26 * v40)) * (float)-v11)
      + (float)(*a3 * (float)((float)((float)((float)(v25 * -2.0) * v37) + (float)(v7 * v42)) + (float)(v20 * v41)));
  float v45 = (float)(v39 * v39) + -1.0;
  float v46 = (float)(v45 * (float)-v17) + (float)((float)(v16 + v16) * v39);
  float v47 = (float)(v39 * v39) + 1.0;
  float v48 = (float)((float)((float)(v43 * v47) + (float)(v112 * v47)) * (float)-v11)
      + (float)(*a3 * (float)((float)((float)((float)(v25 * -2.0) * v39) + (float)(v7 * v46)) + (float)(v20 * v45)));
  float v49 = *a1 * (float)-v114;
  float v50 = (float)(v15 * -2.0) * v37;
  float v51 = (float)((float)((float)(v50 + (float)(*a1 * v42)) + (float)(*a5 * v41)) * (float)-*a3)
      + (float)(v11 * (float)((float)(v49 * v40) + (float)(v107 * v40)));
  float v52 = (float)(v15 * -2.0) * v39;
  float v53 = (float)((float)((float)(v52 + (float)(*a1 * v46)) + (float)(*a5 * v45)) * (float)-*a3)
      + (float)(a3[2] * (float)((float)(v49 * v47) + (float)(v107 * v47)));
  float v54 = *a2 * (float)-v114;
  float v55 = (float)(v16 * v41) + (float)((float)(v38 + v38) * v37);
  float v56 = (float)((float)((float)(v52 + (float)(*a2 * v46)) + (float)(*a5 * v45)) * (float)-*a4)
      + (float)(v13 * (float)((float)(v54 * v47) + (float)(v107 * v47)));
  float v57 = (float)((float)((float)((float)(v50 + (float)(v8 * v42)) + (float)(v14 * v41)) * (float)-*a4)
              + (float)(v13 * (float)((float)(v54 * v40) + (float)(v107 * v40))))
      + (float)((float)-v110
              * (float)((float)((float)((float)(v14 + v14) * v37) - (float)(v8 * v55)) + (float)(v15 * v41)));
  float v58 = (float)(v16 * v45) + (float)((float)(v38 + v38) * v39);
  float v59 = v56
      + (float)((float)-v110
              * (float)((float)((float)((float)(v14 + v14) * v39) - (float)(*a2 * v58)) + (float)(v15 * v45)));
  float v60 = v44
      + (float)(v34 * (float)((float)((float)((float)(v20 + v20) * v37) - (float)(v111 * v55)) + (float)(v25 * v41)));
  float v61 = (float)((float)((float)(v14 + v14) * v37) - (float)(*a1 * v55)) + (float)(v15 * v41);
  float v62 = (float)((float)(v51 - (float)(v34 * v61)) - v57) / (float)(v109 * v40);
  float v63 = -v34;
  float v64 = -(float)(v51 + (float)((float)-v34 * v61));
  float v65 = v48
      + (float)(v34 * (float)((float)((float)((float)(v20 + v20) * v39) - (float)(v111 * v58)) + (float)(v25 * v45)));
  float v66 = (float)((float)((float)(v14 + v14) * v39) - (float)(*a1 * v58)) + (float)(v15 * v45);
  float v67 = (float)((float)(v53 - (float)(v34 * v66)) - v59) / (float)(v109 * v47);
  float v68 = -(float)(v53 + (float)(v63 * v66));
  float v69 = (float)(1.0 - (float)(v37 * v37)) / v40;
  float v70 = (float)(v37 + v37) / v40;
  float v71 = (float)((float)((float)(*a5 * v69) + 0.0) + (float)(v15 * v70)) + (float)(v107 * 0.0);
  float v72 = (float)((float)(0.0 - (float)(*a5 * v70)) + (float)(v15 * v69)) + (float)(v107 * 0.0);
  float v73 = v107 + (float)((float)((float)(*a5 * 0.0) + 0.0) + (float)(v15 * 0.0));
  float v74 = (float)((float)((float)(v20 * v69) + 0.0) + (float)(v25 * v70)) + (float)(v112 * 0.0);
  float v75 = (float)((float)(0.0 - (float)(v20 * v70)) + (float)(v25 * v69)) + (float)(v112 * 0.0);
  float v76 = v112 + (float)((float)((float)(v20 * 0.0) + 0.0) + (float)(v25 * 0.0));
  float v77 = (float)((float)((float)(v38 * v69) + 0.0) + (float)(v16 * v70)) + (float)(v114 * 0.0);
  float v78 = (float)((float)(0.0 - (float)(v38 * v70)) + (float)(v16 * v69)) + (float)(v114 * 0.0);
  float v79 = v114 + (float)((float)((float)(v38 * 0.0) + 0.0) + (float)(v16 * 0.0));
  float v80 = (float)-(float)(v64 + (float)((float)(*a1 * v62) * v40)) / v40;
  float v81 = (float)-(float)(v60 + (float)((float)(v111 * v62) * v40)) / v40;
  *a6 = v77;
  a6[1] = v71;
  a6[2] = v74;
  a6[3] = v78;
  a6[8] = v76;
  a6[9] = (float)((float)(0.0 - (float)(v77 * v62)) + (float)(v71 * v80)) + (float)(v74 * v81);
  a6[6] = v79;
  a6[7] = v73;
  a6[4] = v72;
  a6[5] = v75;
  a6[10] = (float)((float)(0.0 - (float)(v78 * v62)) + (float)(v72 * v80)) + (float)(v75 * v81);
  a6[11] = (float)((float)(0.0 - (float)(v79 * v62)) + (float)(v73 * v80)) + (float)(v76 * v81);
  float v82 = (float)(1.0 - (float)(v39 * v39)) / v47;
  float v83 = (float)(v39 + v39) / v47;
  float v84 = a5[1];
  float v85 = a5[2];
  float v86 = a5[3];
  float v87 = (float)((float)((float)(*a5 * v82) + 0.0) + (float)(v84 * v83)) + (float)(v85 * 0.0);
  float v88 = (float)((float)(0.0 - (float)(*a5 * v83)) + (float)(v84 * v82)) + (float)(v85 * 0.0);
  float v89 = v85 + (float)((float)((float)(*a5 * 0.0) + 0.0) + (float)(v84 * 0.0));
  float v90 = a5[4];
  float v91 = a5[5];
  float v92 = (float)((float)((float)(v86 * v82) + 0.0) + (float)(v90 * v83)) + (float)(v91 * 0.0);
  float v93 = (float)((float)(0.0 - (float)(v86 * v83)) + (float)(v90 * v82)) + (float)(v91 * 0.0);
  float v94 = v91 + (float)((float)((float)(v86 * 0.0) + 0.0) + (float)(v90 * 0.0));
  float v95 = a5[6];
  float v96 = a5[7];
  float v97 = (float)((float)(v95 * v82) + 0.0) + (float)(v96 * v83);
  float v98 = (float)(0.0 - (float)(v95 * v83)) + (float)(v96 * v82);
  float v99 = (float)((float)(v95 * 0.0) + 0.0) + (float)(v96 * 0.0);
  float v100 = a5[8];
  float v101 = v97 + (float)(v100 * 0.0);
  float v102 = v98 + (float)(v100 * 0.0);
  float v103 = v100 + v99;
  float v104 = (float)-(float)(v68 + (float)((float)(v108 * v67) * v47)) / v47;
  float v105 = (float)-(float)(v65 + (float)((float)(v111 * v67) * v47)) / v47;
  a6[12] = v101;
  a6[13] = v87;
  a6[14] = v92;
  a6[15] = v102;
  a6[18] = v103;
  a6[19] = v89;
  a6[16] = v88;
  a6[17] = v93;
  a6[20] = v94;
  a6[21] = (float)((float)(0.0 - (float)(v101 * v67)) + (float)(v87 * v104)) + (float)(v92 * v105);
  a6[22] = (float)((float)(0.0 - (float)(v102 * v67)) + (float)(v88 * v104)) + (float)(v93 * v105);
  a6[23] = (float)((float)(0.0 - (float)(v103 * v67)) + (float)(v89 * v104)) + (float)(v94 * v105);
  return 2;
}

uint64_t vl_pose_p2p_z(float *a1, float *a2, float *a3, float *a4, uint64_t a5)
{
  float v5 = *a1;
  float v6 = a1[1];
  float v7 = *a2;
  float v8 = a2[1];
  float v9 = *a3;
  float v10 = a3[1];
  float v11 = a3[2];
  float v12 = *a4;
  float v13 = a4[1];
  float v14 = a4[2];
  float v15 = (float)((float)(*a3 + (float)(v10 * *a1)) - *a4) - (float)(v13 * *a2);
  float v16 = *a1 - *a2;
  float v17 = (float)((float)(v6 - v8) * v15)
      - (float)(v16 * (float)((float)((float)-(float)(v11 - (float)(v10 * v6)) - (float)(v13 * v8)) + v14));
  float v18 = (float)((float)(v6 - v8) * (float)((float)((float)(v10 - (float)(*a3 * *a1)) - v13) + (float)(*a4 * *a2)))
      - (float)(v16 * (float)((float)(v8 * *a4) - (float)(*a3 * v6)));
  float v19 = v18 + v18;
  float v20 = sqrtf((float)((float)((float)(v16 * (float)((float)((float)(v11 + (float)(v10 * v6)) - (float)(v13 * v8)) - v14))- (float)((float)(v6 - v8) * v15))* (float)(v17 * -4.0))+ (float)(v19 * v19));
  float v21 = (float)(v20 - v19) / (float)(v17 + v17);
  float v22 = -v13;
  float v23 = -v11;
  float v24 = (float)((float)-v19 - v20) / (float)(v17 + v17);
  float v25 = v6 * (float)-*a3;
  float v26 = -(float)(v10 * v6);
  float v27 = 1.0 / v16;
  float v28 = 1.0 - (float)(v21 * v21);
  float v29 = (float)(v21 * v21) + 1.0;
  float v30 = 1.0 / v29;
  float v31 = v28 * (float)(1.0 / v29);
  float v32 = v21 + v21;
  float v33 = (float)((float)(v29 * v23) + (float)(v25 * (float)(v21 + v21))) + (float)(v26 * v28);
  float v34 = (float)(*a3 * (float)(v28 + (float)(v5 * (float)(v21 + v21))))
      - (float)(v10 * (float)((float)(v21 * 2.0) - (float)(v5 * v28)));
  float v35 = (float)(1.0 / v29)
      * (float)(v27
              * (float)(v34
                      - (float)((float)((float)((float)(v21 * 2.0) - (float)(v7 * v28)) * v22)
                              - (float)(*a4 * (float)-(float)(v28 + (float)(v7 * (float)(v21 + v21)))))));
  float v36 = v33 + (float)((float)(v6 * v35) * v29);
  float v37 = (float)(1.0 / v29) * (float)-(float)(v34 - (float)((float)(*a1 * v35) * v29));
  float v38 = -(float)(v32 * v30);
  float v39 = -(float)(v28 * v30);
  *(float *)a5 = v38;
  *(float *)(a5 + 4) = v31;
  *(float *)(a5 + 12) = v39;
  *(float *)(a5 + 16) = v38;
  *(_DWORD *)(a5 + 8) = 0;
  *(_OWORD *)(a5 + 20) = xmmword_21BB7CE80;
  *(float *)(a5 + 36) = -(float)((float)(v31 * v37) + (float)(v38 * v35));
  *(float *)(a5 + 40) = -(float)((float)(v38 * v37) + (float)(v39 * v35));
  float v40 = -(float)(v36 * v30);
  float v41 = 1.0 - (float)(v24 * v24);
  float v42 = (float)(v24 * v24) + 1.0;
  float v43 = v41 * (float)(1.0 / v42);
  float v44 = (float)(v9 * (float)(v41 + (float)(v5 * (float)(v24 + v24))))
      - (float)(v10 * (float)((float)(v24 * 2.0) - (float)(v5 * v41)));
  float v45 = (float)(1.0 / v42)
      * (float)(v27
              * (float)(v44
                      - (float)((float)((float)((float)(v24 * 2.0) - (float)(v7 * v41)) * v22)
                              - (float)(v12 * (float)-(float)(v41 + (float)(v7 * (float)(v24 + v24)))))));
  float v46 = (float)(1.0 / v42) * (float)-(float)(v44 - (float)((float)(v5 * v45) * v42));
  float v47 = -(float)((float)(v24 + v24) * (float)(1.0 / v42));
  *(float *)(a5 + 44) = v40;
  *(float *)(a5 + 48) = v47;
  *(float *)(a5 + 52) = v43;
  *(float *)(a5 + 60) = -v43;
  *(float *)(a5 + 64) = v47;
  *(_DWORD *)(a5 + 56) = 0;
  *(_OWORD *)(a5 + 68) = xmmword_21BB7CE80;
  *(float *)(a5 + 84) = -(float)((float)(v43 * v46) + (float)(v47 * v45));
  *(float *)(a5 + 88) = -(float)((float)(v47 * v46) + (float)((float)-v43 * v45));
  *(float *)(a5 + 92) = -(float)((float)((float)((float)((float)(v42 * v23) + (float)(v25 * (float)(v24 + v24)))
                                               + (float)(v26 * v41))
                                       + (float)((float)(v6 * v45) * v42))
                               * (float)(1.0 / v42));
  return 2;
}

void lbl_par_ver(uint64_t a1, int a2)
{
  *(_OWORD *)(a1 + 232) = xmmword_21BB7CE90;
  *(_DWORD *)(a1 + 12) = 256;
  *(void *)(a1 + 224) = 0x3BA3D70A00000004;
  *(void *)(a1 + 216) = 0x177000000008;
  *(void *)(a1 + 4) = 3;
  *(void *)(a1 + 256) = 0;
  *(_DWORD *)(a1 + 248) = 0;
  memset_pattern16((void *)(a1 + 16), &unk_21BB7CEE0, 0xC8uLL);
  *(_DWORD *)(a1 + 16) = 1149239296;
  *(void *)(a1 + 268) = 0x3E800000BE800000;
  *(_DWORD *)a1 = a2;
  if (a2 <= 999)
  {
    switch(a2)
    {
      case 1:
      case 2:
      case 3:
        log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/lbl/lbl_par.c", 58, (uint64_t)"lbl_par_ver", "Deprecate lbl version %d", a2);
        abort();
      case 4:
        int v4 = 100;
        goto LABEL_34;
      case 5:
        *(_DWORD *)(a1 + 236) = 100;
LABEL_28:
        int v8 = 2000;
        goto LABEL_31;
      case 6:
        *(_DWORD *)(a1 + 236) = 100;
LABEL_30:
        int v8 = 2001;
LABEL_31:
        *(_DWORD *)(a1 + 244) = v8;
        *(_DWORD *)(a1 + 12) = 256;
        return;
      case 7:
LABEL_23:
        *(void *)(a1 + 236) = 0xBB800000064;
        *(_DWORD *)(a1 + 12) = 128;
        return;
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
        goto LABEL_61;
      case 33:
        *(_DWORD *)(a1 + 236) = 103;
        *(_DWORD *)(a1 + 12) = 256;
        return;
      case 34:
        int v4 = 104;
LABEL_34:
        *(_DWORD *)(a1 + 236) = v4;
        *(void *)(a1 + 16) = 0xBF8000003F000000;
        *(_DWORD *)(a1 + 12) = 256;
        return;
      case 35:
        *(_DWORD *)(a1 + 236) = 105;
        *(_DWORD *)(a1 + 216) = 32;
        *(_DWORD *)(a1 + 12) = 128;
        return;
      case 36:
        int v9 = 3001;
        goto LABEL_42;
      case 37:
        *(_DWORD *)(a1 + 236) = 3001;
        *(void *)(a1 + 16) = 0xBF8000003F000000;
        *(void *)(a1 + 224) = 0x3C03126FFFFFFFFFLL;
        long long v10 = xmmword_21BB7CED0;
        goto LABEL_39;
      case 38:
        *(_DWORD *)(a1 + 236) = 3001;
        *(void *)(a1 + 16) = 0xBF8000003F000000;
        *(void *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        long long v10 = xmmword_21BB7CEA0;
LABEL_39:
        *(_OWORD *)(a1 + 252) = v10;
        uint64_t v11 = 0x177000000020;
LABEL_48:
        *(void *)(a1 + 216) = v11;
        *(_DWORD *)(a1 + 12) = 64;
        return;
      case 39:
        *(_DWORD *)(a1 + 236) = 3100;
        *(void *)(a1 + 16) = 0xBF8000003F000000;
        *(_DWORD *)(a1 + 12) = 64;
        *(void *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        *(_OWORD *)(a1 + 252) = xmmword_21BB7CEA0;
        *(void *)(a1 + 216) = 0x177000000020;
        return;
      case 40:
        int v9 = 3002;
LABEL_42:
        *(_DWORD *)(a1 + 236) = v9;
        *(void *)(a1 + 16) = 0xBF8000003F000000;
        *(_DWORD *)(a1 + 216) = 32;
        *(_DWORD *)(a1 + 12) = 64;
        return;
      default:
        if (a2 != 807)
        {
          if (a2 == 808)
          {
            *(_DWORD *)(a1 + 236) = 104;
            *(void *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
            *(void *)(a1 + 216) = 0x7D000000001;
            *(_OWORD *)(a1 + 252) = xmmword_21BB7CEA0;
            *(_DWORD *)(a1 + 12) = 256;
            return;
          }
          goto LABEL_61;
        }
        *(_DWORD *)(a1 + 236) = 104;
        *(void *)(a1 + 224) = 0x3B83126FFFFFFFFFLL;
        *(void *)(a1 + 252) = 0xC00000001;
        *(_DWORD *)(a1 + 264) = 1;
        *(void *)(a1 + 216) = 0x5DC00000001;
        *(_DWORD *)(a1 + 12) = 256;
        break;
    }
  }
  else
  {
    if (a2 <= 2099)
    {
      switch(a2)
      {
        case 1000:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          *(_DWORD *)(a1 + 216) = 1;
          *(_DWORD *)(a1 + 12) = 256;
          return;
        case 1001:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          *(_OWORD *)(a1 + 16) = xmmword_21BB7CEC0;
          *(_DWORD *)(a1 + 32) = -1082130432;
          *(_DWORD *)(a1 + 12) = 256;
          return;
        case 1002:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          *(_OWORD *)(a1 + 16) = xmmword_21BB7CEB0;
          *(_DWORD *)(a1 + 12) = 256;
          return;
        case 1003:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          goto LABEL_28;
        case 1004:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          goto LABEL_30;
        case 1005:
          *(_DWORD *)(a1 + 224) = -1;
          goto LABEL_23;
        case 1006:
          *(_DWORD *)(a1 + 236) = 100;
          *(_DWORD *)(a1 + 224) = -1;
          int v7 = 2;
          goto LABEL_59;
        default:
          if (a2 == 2000)
          {
            log_msg(2, 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/lbl/lbl_par.c", 206, (uint64_t)"lbl_par_ver", "Please just use version 1000 with input_type=2");
            int v5 = 100;
            goto LABEL_26;
          }
          if (a2 == 2001)
          {
            log_msg(2, 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/lbl/lbl_par.c", 212, (uint64_t)"lbl_par_ver", "Please just use version 3004 with input_type=2");
            int v5 = 104;
LABEL_26:
            *(_DWORD *)(a1 + 236) = v5;
            *(_DWORD *)(a1 + 224) = -1;
            *(_DWORD *)(a1 + 12) = 256;
            return;
          }
          break;
      }
LABEL_61:
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/lbl/lbl_par.c", 349, (uint64_t)"lbl_par_ver", "Unknown lbl version %d", a2);
      abort();
    }
    switch(a2)
    {
      case 3003:
        int v5 = 103;
        goto LABEL_26;
      case 3004:
        *(_DWORD *)(a1 + 236) = 104;
        *(_DWORD *)(a1 + 224) = -1;
        int v7 = 1;
        *(_DWORD *)(a1 + 216) = 1;
        goto LABEL_59;
      case 3005:
        *(_DWORD *)(a1 + 236) = 105;
        *(void *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        *(_OWORD *)(a1 + 252) = xmmword_21BB7CEA0;
        *(void *)(a1 + 216) = 0x7D000000020;
        *(_DWORD *)(a1 + 12) = 128;
        return;
      case 3006:
        *(_DWORD *)(a1 + 236) = 3001;
        *(_DWORD *)(a1 + 224) = -1;
        *(_DWORD *)(a1 + 216) = 32;
        goto LABEL_55;
      case 3007:
        *(_DWORD *)(a1 + 236) = 3001;
        *(void *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        *(_OWORD *)(a1 + 252) = xmmword_21BB7CEA0;
        uint64_t v11 = 0x5DC00000020;
        goto LABEL_48;
      case 3008:
        int v12 = 3001;
        goto LABEL_52;
      case 3009:
        *(_DWORD *)(a1 + 236) = 104;
        *(void *)(a1 + 224) = 0x3BA3D70AFFFFFFFFLL;
        *(_OWORD *)(a1 + 252) = xmmword_21BB7CEA0;
        *(void *)(a1 + 216) = 0x7D000000020;
        goto LABEL_58;
      case 3010:
        int v12 = 3002;
LABEL_52:
        *(_DWORD *)(a1 + 236) = v12;
        unint64_t v13 = 0xFFFFD70AFFFFFFFFLL;
        goto LABEL_54;
      case 3011:
        *(_DWORD *)(a1 + 236) = 3003;
        unint64_t v13 = 0xD70A00000004;
LABEL_54:
        *(void *)(a1 + 224) = v13 & 0xFFFFFFFFFFFFLL | 0x3BA3000000000000;
        *(_OWORD *)(a1 + 252) = xmmword_21BB7CEA0;
        *(void *)(a1 + 216) = 0x7D000000020;
LABEL_55:
        *(_DWORD *)(a1 + 4) = 1;
        *(_DWORD *)(a1 + 12) = 64;
        return;
      default:
        if (a2 == 2100)
        {
          int v6 = 100;
        }
        else
        {
          if (a2 != 2101) {
            goto LABEL_61;
          }
          int v6 = 104;
        }
        *(_DWORD *)(a1 + 236) = v6;
        *(_DWORD *)(a1 + 224) = -1;
LABEL_58:
        int v7 = 1;
LABEL_59:
        *(_DWORD *)(a1 + 4) = v7;
        *(_DWORD *)(a1 + 12) = 256;
        break;
    }
  }
}

void vl_sift_desc(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v541 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (*(_DWORD *)(a4 + 212))
    {
      *(void *)(a4 + 120) -= mach_absolute_time();
    }
    else
    {
      clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a4 + 32));
      clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a4 + 16));
      clock_gettime(_CLOCK_MONOTONIC, (timespec *)a4);
    }
  }
  int v6 = (float32x4_t *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
  int v7 = (char *)malloc_type_calloc(0x2208uLL, 4uLL, 0x100004052888210uLL);
  int v8 = (float *)v7;
  if (*a2 >= 1)
  {
    uint64_t v9 = 0;
    v394 = (float *)(v7 + 21780);
    v393 = v7 + 8712;
    v392 = v7 + 13068;
    v391 = v7 + 17424;
    uint64_t v10 = 32;
    float v11 = -0.5;
    v395 = a2;
    v407 = (float *)v7;
    do
    {
      uint64_t v403 = a2[1];
      float v15 = (float *)(v403 + 288 * v9);
      float v16 = (int *)(*(void *)(a3 + 8) + 8 * v9);
      int v17 = v16[1];
      uint64_t v406 = *(void *)(*(void *)(a1 + 8) + 72 * *v16 + 8);
      float v18 = 1.0 / (float)(1 << *v16);
      float v19 = v15[1];
      if ((float)(v18 * *v15) <= 0.0) {
        float v20 = v11;
      }
      else {
        float v20 = 0.5;
      }
      float v21 = v20 + (float)(*v15 * v18);
      if ((float)(v18 * v19) <= 0.0) {
        float v22 = v11;
      }
      else {
        float v22 = 0.5;
      }
      float v23 = v22 + (float)(v19 * v18);
      float v24 = v18 * (float)(v15[2] * 3.75);
      double v25 = (float)(360.0 - v15[3]) * 3.14159265 / 180.0;
      *(float *)&double v25 = v25;
      double v398 = v25;
      __float2 v26 = __sincosf_stret(*(float *)&v25);
      bzero(v409, 0x5A0uLL);
      float v27 = (float *)malloc_type_realloc(0, 0x1E0uLL, 0xF4287634uLL);
      float v28 = v27;
      *(_OWORD *)float v27 = 0u;
      *((_OWORD *)v27 + 1) = 0u;
      *((_OWORD *)v27 + 2) = 0u;
      *((_OWORD *)v27 + 3) = 0u;
      *((_OWORD *)v27 + 4) = 0u;
      *((_OWORD *)v27 + 5) = 0u;
      *((_OWORD *)v27 + 6) = 0u;
      *((_OWORD *)v27 + 7) = 0u;
      *((_OWORD *)v27 + 8) = 0u;
      *((_OWORD *)v27 + 9) = 0u;
      *((_OWORD *)v27 + 10) = 0u;
      *((_OWORD *)v27 + 11) = 0u;
      *((_OWORD *)v27 + 12) = 0u;
      *((_OWORD *)v27 + 13) = 0u;
      *((_OWORD *)v27 + 14) = 0u;
      *((_OWORD *)v27 + 15) = 0u;
      *((_OWORD *)v27 + 16) = 0u;
      *((_OWORD *)v27 + 17) = 0u;
      *((_OWORD *)v27 + 18) = 0u;
      *((_OWORD *)v27 + 19) = 0u;
      *((_OWORD *)v27 + 20) = 0u;
      *((_OWORD *)v27 + 21) = 0u;
      *((_OWORD *)v27 + 22) = 0u;
      *((_OWORD *)v27 + 23) = 0u;
      *((_OWORD *)v27 + 24) = 0u;
      *((_OWORD *)v27 + 25) = 0u;
      *((_OWORD *)v27 + 26) = 0u;
      *((_OWORD *)v27 + 27) = 0u;
      *((_OWORD *)v27 + 28) = 0u;
      *((_OWORD *)v27 + 29) = 0u;
      float v399 = v21;
      float v400 = v23;
      float v29 = (float)(int)v21;
      float v30 = (float)(int)v23;
      float v31 = v29 - (float)(v26.__cosval * v24);
      float v32 = v31 + (float)(v26.__sinval * v24);
      *(float *)v41.i32 = v30 + (float)(v26.__sinval * v24);
      float v33 = *(float *)v41.i32 + (float)(v26.__cosval * v24);
      v408[0] = v32;
      v408[1] = v33;
      float v34 = v29 + (float)(v26.__cosval * v24);
      float v35 = v34 + (float)(v26.__sinval * v24);
      float v36 = v30 - (float)(v26.__sinval * v24);
      float v37 = v36 + (float)(v26.__cosval * v24);
      v408[2] = v35;
      v408[3] = v37;
      float v38 = v34 - (float)(v26.__sinval * v24);
      float v39 = v36 - (float)(v26.__cosval * v24);
      v408[4] = v38;
      v408[5] = v39;
      float v40 = v31 - (float)(v26.__sinval * v24);
      *(float *)v41.i32 = *(float *)v41.i32 - (float)(v26.__cosval * v24);
      v408[6] = v40;
      v408[7] = *(float *)v41.i32;
      long long v540 = xmmword_21BB7A770;
      if (v37 >= v33)
      {
        float v43 = vabds_f32(v37, v33);
        _NF = v35 < v32 && v43 < 0.001;
        if (_NF)
        {
          float v33 = v37;
          float v32 = v35;
          uint64_t v42 = 1;
          if (v39 < v37)
          {
LABEL_30:
            float v33 = v39;
            goto LABEL_31;
          }
        }
        else
        {
          uint64_t v42 = 0;
          if (v39 < v33) {
            goto LABEL_30;
          }
        }
      }
      else
      {
        float v33 = v37;
        uint64_t v42 = 1;
        if (v39 < v37) {
          goto LABEL_30;
        }
      }
      float v45 = vabds_f32(v39, v33);
      if (v38 < v32 && v45 < 0.001)
      {
        float v33 = v39;
        float v32 = v38;
LABEL_31:
        uint64_t v42 = 2;
      }
      if (*(float *)v41.i32 >= v33)
      {
        BOOL v49 = vabds_f32(*(float *)v41.i32, v33) < 0.001 && v40 < v32;
        uint64_t v48 = 3;
        if (!v49) {
          uint64_t v48 = v42;
        }
        int v47 = *(_DWORD *)((unint64_t)&v540 | (4 * v48));
      }
      else
      {
        int v47 = 3;
        uint64_t v48 = 3;
      }
      *(_DWORD *)((unint64_t)&v540 | (4 * v48)) = 0;
      LODWORD(v540) = v47;
      float v50 = &v408[2 * v47];
      float v51 = *v50;
      float v52 = v50[1];
      float v53 = &v408[2 * SDWORD1(v540)];
      float v54 = v53[1];
      if (v54 <= v52)
      {
        if (vabds_f32(v37, v52) >= 0.001 || v35 <= v51)
        {
          uint64_t v56 = 0;
          float v54 = v52;
          float v57 = &v408[2 * SDWORD2(v540)];
          float v58 = v57[1];
          if (v58 > v52) {
            goto LABEL_54;
          }
          goto LABEL_49;
        }
        float v51 = *v53;
      }
      uint64_t v56 = 1;
      float v57 = &v408[2 * SDWORD2(v540)];
      float v58 = v57[1];
      if (v58 > v54) {
        goto LABEL_54;
      }
LABEL_49:
      if (vabds_f32(v39, v54) < 0.001 && v38 > v51)
      {
        float v51 = *v57;
LABEL_54:
        float v54 = v58;
        uint64_t v56 = 2;
      }
      if (v408[2 * SHIDWORD(v540) + 1] <= v54)
      {
        float v62 = vabds_f32(*(float *)v41.i32, v54);
        BOOL v63 = v40 > v51 && v62 < 0.001;
        uint64_t v61 = 3;
        if (!v63) {
          uint64_t v61 = v56;
        }
        int v60 = *(_DWORD *)((unint64_t)&v540 | (4 * v61));
      }
      else
      {
        int v60 = HIDWORD(v540);
        uint64_t v61 = 3;
      }
      *(_DWORD *)((unint64_t)&v540 | (4 * v61)) = HIDWORD(v540);
      HIDWORD(v540) = v60;
      LODWORD(v61) = DWORD1(v540);
      float v64 = v408[2 * SDWORD1(v540)];
      uint64_t v65 = SDWORD2(v540);
      float v66 = v408[2 * SDWORD2(v540)];
      uint64_t v402 = 288 * v9;
      if (v64 <= v66)
      {
        float v67 = v408[2 * SDWORD2(v540)];
        uint64_t v61 = SDWORD2(v540);
        float v66 = v408[2 * SDWORD1(v540)];
        uint64_t v65 = SDWORD1(v540);
      }
      else
      {
        *(void *)((char *)&v540 + 4) = __PAIR64__(DWORD1(v540), DWORD2(v540));
        float v67 = v64;
        uint64_t v61 = (int)v61;
      }
      float v68 = &v408[2 * (int)v540];
      float v69 = *v68;
      float v70 = v68[1];
      float v71 = v408[2 * v65 + 1];
      float v72 = v408[2 * v61 + 1];
      float v73 = &v408[2 * v60];
      float v75 = *v73;
      float v74 = v73[1];
      double v76 = round(v70);
      *(double *)v77.i64 = v70 - v76;
      if (*(double *)v77.i64 < 0.0) {
        double v78 = 0.0;
      }
      else {
        double v78 = 1.0;
      }
      float v79 = v72 - v70;
      float v80 = v69 - v67;
      v538[0] = v72 - v70;
      v538[1] = v69 - v67;
      float v81 = (float)(v70 * (float)(v69 - v67)) + (float)(v69 * (float)(v72 - v70));
      float v82 = v74 - v72;
      v538[2] = v81;
      v538[3] = v74 - v72;
      float v83 = v67 - v75;
      float v84 = (float)(v72 * (float)(v67 - v75)) + (float)(v67 * (float)(v74 - v72));
      v538[4] = v67 - v75;
      v538[5] = v84;
      float v85 = v71 - v74;
      float v86 = v75 - v66;
      float v87 = (float)((float)(v75 - v66) * v74) + (float)(v75 * (float)(v71 - v74));
      v539[4] = v86;
      v539[5] = v87;
      float v88 = v70 - v71;
      float v89 = v66 - v69;
      v539[0] = v70 - v71;
      v539[1] = v66 - v69;
      float v90 = (float)((float)(v66 - v69) * v71) + (float)(v66 * (float)(v70 - v71));
      v539[2] = v90;
      v539[3] = v71 - v74;
      *(double *)v91.i64 = v74 - round(v74);
      int v92 = (int)(v76 + v78);
      if (v71 >= v72) {
        float v93 = v72;
      }
      else {
        float v93 = v71;
      }
      int v94 = (int)(float)(v93 + 1.0);
      if (v71 <= v72) {
        float v95 = v72;
      }
      else {
        float v95 = v71;
      }
      if (*(double *)v91.i64 <= 0.0) {
        double v96 = 0.0;
      }
      else {
        double v96 = 1.0;
      }
      float v97 = (float)v92;
      int v98 = v94 - v92;
      if (v94 <= v92)
      {
        int v98 = 0;
        float v102 = v27;
        int v103 = (int)(float)(v95 + 1.0);
        _VF = __OFSUB__(v103, v94);
        int v105 = v103 - v94;
        if ((v105 < 0) ^ _VF | (v105 == 0)) {
          goto LABEL_87;
        }
LABEL_85:
        uint64_t v106 = &v538[3 * (v71 > v72)];
        float v107 = &v539[3 * (v71 <= v72)];
        float v108 = v107[1];
        float v109 = -v107[2];
        float v110 = *v107;
        float v111 = v106[1];
        float v112 = -v106[2];
        float v113 = *v106;
        do
        {
          *(_DWORD *)float v102 = vcvtps_s32_f32((float)-(float)(v109 + (float)(v108 * v97)) / v110);
          *((_DWORD *)v102 + 1) = vcvtms_s32_f32((float)-(float)(v112 + (float)(v111 * v97)) / v113);
          v102 += 2;
          float v97 = v97 + 1.0;
          ++v98;
          --v105;
        }
        while (v105);
        goto LABEL_87;
      }
      float v99 = -v90;
      float v100 = -v81;
      int v101 = v94 - v92;
      float v102 = v27;
      do
      {
        *(_DWORD *)float v102 = vcvtps_s32_f32((float)-(float)(v99 + (float)(v89 * v97)) / v88);
        *((_DWORD *)v102 + 1) = vcvtms_s32_f32((float)-(float)(v100 + (float)(v80 * v97)) / v79);
        v102 += 2;
        float v97 = v97 + 1.0;
        --v101;
      }
      while (v101);
      int v103 = (int)(float)(v95 + 1.0);
      _VF = __OFSUB__(v103, v94);
      int v105 = v103 - v94;
      if (!((v105 < 0) ^ _VF | (v105 == 0))) {
        goto LABEL_85;
      }
LABEL_87:
      double v114 = roundf(v74) + v96;
      int v115 = (int)v114 - v103;
      uint64_t v404 = v10;
      if ((int)v114 > v103)
      {
        float v116 = -v84;
        int v117 = (int)v114 - v103;
        do
        {
          *(_DWORD *)float v102 = vcvtps_s32_f32((float)-(float)((float)(v86 * v97) - v87) / v85);
          *((_DWORD *)v102 + 1) = vcvtms_s32_f32((float)-(float)(v116 + (float)(v83 * v97)) / v82);
          v102 += 2;
          float v97 = v97 + 1.0;
          --v117;
        }
        while (v117);
        v98 += v115;
      }
      uint64_t v118 = v98;
      uint64_t v405 = v9;
      if (v98 <= 60)
      {
        uint64_t v120 = 60;
      }
      else
      {
        if (v98 <= 120) {
          uint64_t v119 = 120;
        }
        else {
          uint64_t v119 = v98;
        }
        float v28 = (float *)malloc_type_realloc(v27, 8 * v119, 0x28075C5FuLL);
        bzero(v28 + 120, 8 * v118 - 480);
        uint64_t v120 = v119;
      }
      v121.i64[0] = 0x100000001;
      v121.i64[1] = 0x100000001;
      uint64_t v122 = v406 + 24 * v17;
      int v123 = *(_DWORD *)(v122 + 8);
      int64_t v124 = *(int *)(v122 + 12);
      if ((float)(v24 * 1.4142) < v29
        && (float)(v24 * 1.4142) < v30
        && (float)((float)(v123 - 1) + (float)(v24 * -1.4142)) > v29
        && (float)((float)(v124 - 1) + (float)(v24 * -1.4142)) > v30)
      {
        float v125 = 1.5;
        float v126 = 10.0;
        goto LABEL_140;
      }
      int v401 = v17;
      if (v92 > 0)
      {
        uint64_t v127 = v118;
        float v125 = 1.5;
        float v126 = 10.0;
        uint64_t v128 = v92;
        if (v118 + v92 < v124) {
          goto LABEL_104;
        }
        goto LABEL_120;
      }
      if ((int)v118 < 1)
      {
        uint64_t v127 = 0;
        float v125 = 1.5;
        float v126 = 10.0;
        uint64_t v134 = -v118;
        if (v118 < 0) {
          goto LABEL_118;
        }
      }
      else
      {
        uint64_t v127 = 0;
        unint64_t v129 = 0;
        float v125 = 1.5;
        float v126 = 10.0;
        do
        {
          if (v28 && v129 >= (1 - v92)) {
            *(void *)&v28[2 * v127++] = *(void *)&v28[2 * v129];
          }
          ++v129;
        }
        while (v118 != v129);
        if (v127 > v120)
        {
          if (2 * v120 <= v127) {
            uint64_t v130 = v127;
          }
          else {
            uint64_t v130 = 2 * v120;
          }
          uint64_t v131 = v28;
          int v132 = v123;
          float v133 = (float *)malloc_type_realloc(v131, 8 * v130, 0x48BD7F9AuLL);
          uint64_t v120 = v130;
          int v123 = v132;
          v121.i64[0] = 0x100000001;
          v121.i64[1] = 0x100000001;
          float v28 = v133;
        }
        uint64_t v134 = v127 - v118;
        if (v127 > v118)
        {
LABEL_118:
          double v135 = (char *)&v28[2 * v118];
          int v136 = v123;
          uint64_t v137 = v120;
          bzero(v135, 8 * v134);
          uint64_t v120 = v137;
          int v123 = v136;
          v121.i64[0] = 0x100000001;
          v121.i64[1] = 0x100000001;
        }
      }
      int v92 = 1;
      uint64_t v128 = 1;
      if (v127 + 1 < v124)
      {
LABEL_104:
        uint64_t v118 = v127;
        int v17 = v401;
        if (v118 < 1) {
          goto LABEL_162;
        }
        goto LABEL_129;
      }
LABEL_120:
      if (v127 < 1)
      {
        uint64_t v118 = 0;
        uint64_t v140 = -v127;
        if (v127 < 0) {
          goto LABEL_161;
        }
      }
      else
      {
        uint64_t v118 = 0;
        uint64_t v138 = 0;
        uint64_t v139 = ~v128 + v124;
        do
        {
          if (v138 < v139 && v28) {
            *(void *)&v28[2 * v118++] = *(void *)&v28[2 * v138];
          }
          ++v138;
        }
        while (v138 < v127);
        if (v118 > v120)
        {
          uint64_t v202 = 2 * v120;
          if (2 * v120 <= v118) {
            uint64_t v202 = v118;
          }
          int v203 = v123;
          double v204 = (float *)malloc_type_realloc(v28, 8 * v202, 0xCA99F1EBuLL);
          int v123 = v203;
          v121.i64[0] = 0x100000001;
          v121.i64[1] = 0x100000001;
          float v28 = v204;
          uint64_t v140 = v118 - v127;
          if (v118 > v127)
          {
LABEL_161:
            double v205 = (char *)&v28[2 * v127];
            int v206 = v123;
            bzero(v205, 8 * v140);
            int v123 = v206;
            v121.i64[0] = 0x100000001;
            v121.i64[1] = 0x100000001;
            int v17 = v401;
            if (v118 < 1)
            {
LABEL_162:
              free(v28);
              int v8 = v407;
              goto LABEL_163;
            }
            goto LABEL_129;
          }
        }
        else
        {
          uint64_t v140 = v118 - v127;
          if (v118 > v127) {
            goto LABEL_161;
          }
        }
      }
      int v17 = v401;
      if (v118 < 1) {
        goto LABEL_162;
      }
LABEL_129:
      signed int v141 = v123 - 2;
      if ((unint64_t)v118 < 8)
      {
        uint64_t v142 = 0;
LABEL_134:
        uint64_t v147 = (signed int *)&v28[2 * v142 + 1];
        do
        {
          int v148 = *(v147 - 1);
          if (v148 <= 1) {
            int v148 = 1;
          }
          *(v147 - 1) = v148;
          signed int v149 = *v147;
          if (*v147 >= v141) {
            signed int v149 = v141;
          }
          *uint64_t v147 = v149;
          v147 += 2;
          ++v142;
        }
        while (v118 != v142);
        goto LABEL_140;
      }
      uint64_t v142 = v118 & 0x7FFFFFFFFFFFFFF8;
      int32x4_t v77 = vdupq_n_s32(v141);
      float v143 = v28 + 8;
      unint64_t v144 = v118 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        uint64_t v145 = v143 - 8;
        float32x4x2_t v543 = vld2q_f32(v145);
        float32x4x2_t v544 = vld2q_f32(v143);
        int32x4_t v146 = vmaxq_s32((int32x4_t)v543.val[0], v121);
        int32x4_t v91 = vminq_s32((int32x4_t)v543.val[1], v77);
        int32x4_t v41 = vmaxq_s32((int32x4_t)v544.val[0], v121);
        v543.val[1] = (float32x4_t)vminq_s32((int32x4_t)v544.val[1], v77);
        vst2q_f32(v145, *(float32x4x2_t *)(&v91 - 1));
        vst2q_f32(v143, *(float32x4x2_t *)v41.i8);
        v143 += 16;
        v144 -= 8;
      }
      while (v144);
      if (v118 != v142) {
        goto LABEL_134;
      }
LABEL_140:
      if (v118 < 1) {
        goto LABEL_162;
      }
      uint64_t v150 = 0;
      LODWORD(v151) = 0;
      uint64_t v152 = (uint64_t *)(v406 + 24 * v17);
      *(float *)v77.i32 = (float)(2.4997 / v24) * v26.__cosval;
      *(float *)v41.i32 = (float)(2.4997 / v24) * v26.__sinval;
      double v153 = v152 + 2;
      int32x4_t v154 = vdupq_n_s32((int)v399);
      uint64_t v155 = v92;
      float32x4_t v156 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.i8, 0);
      float32x4_t v157 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.i8, 0);
      int v8 = v407;
      v158.i64[0] = 0x800000008;
      v158.i64[1] = 0x800000008;
      do
      {
        while (1)
        {
          double v159 = (signed int *)&v28[2 * v150];
          signed int v160 = *v159;
          signed int v161 = v159[1];
          if (v161 >= v160) {
            break;
          }
          ++v155;
          if (++v150 == v118) {
            goto LABEL_153;
          }
        }
        float v162 = (float)(v155 - (int)v400);
        *(float *)v91.i32 = (float)-*(float *)v41.i32 * v162;
        *(float *)v121.i32 = *(float *)v77.i32 * v162;
        uint64_t v163 = *v152;
        uint64_t v164 = *v153 * v155;
        uint64_t v165 = v155++ - 1;
        uint64_t v166 = (int)v151;
        uint64_t v167 = (v161 - v160);
        uint64_t v168 = 2 * *v153;
        if (v167 < 7)
        {
          uint64_t v169 = v160;
          uint64_t v151 = (int)v151;
LABEL_149:
          uint64_t v191 = 0;
          uint64_t v192 = v163 + 2 * v169 + v168 * v155;
          uint64_t v193 = v163 + 2 * v169 + v168 * v165;
          double v194 = &v8[v151];
          int v195 = v161 - v169 + 1;
          double v196 = (unsigned __int16 *)(v163 + 2 * (v169 + v164) + 2);
          do
          {
            float v197 = (float)(v169 - (int)v399 + v191);
            v194[1089] = *(float *)v91.i32 + (float)(v197 * *(float *)v77.i32);
            float *v194 = *(float *)v121.i32 + (float)(v197 * *(float *)v41.i32);
            v194[2178] = (float)(*v196 - *(v196 - 2));
            v194[3267] = (float)(*(unsigned __int16 *)(v193 + 2 * v191) - *(unsigned __int16 *)(v192 + 2 * v191));
            ++v191;
            ++v194;
            ++v196;
          }
          while (v195 != v191);
          LODWORD(v151) = v151 + v191;
          goto LABEL_152;
        }
        uint64_t v170 = v167 + 1;
        uint64_t v171 = (v167 + 1) & 0x1FFFFFFF8;
        uint64_t v169 = v171 + v160;
        uint64_t v151 = v171 + (int)v151;
        int32x4_t v172 = vdupq_n_s32(v160);
        int32x4_t v173 = vaddq_s32(v172, (int32x4_t)xmmword_21BB7CF40);
        int32x4_t v174 = vaddq_s32(v172, (int32x4_t)xmmword_21BB7A770);
        float32x4_t v175 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v91.i8, 0);
        float32x4_t v176 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v121.i8, 0);
        double v177 = &v8[v166];
        double v178 = (uint16x4_t *)(v163 + 2 * (v164 + v160) + 2);
        uint64_t v179 = 2 * v160;
        double v180 = (uint16x8_t *)(v163 + v179 + v168 * v165);
        double v181 = (uint16x8_t *)(v163 + v179 + v168 * v155);
        uint64_t v182 = v171;
        do
        {
          float32x4_t v183 = vcvtq_f32_s32(vsubq_s32(v174, v154));
          float32x4_t v184 = vcvtq_f32_s32(vsubq_s32(v173, v154));
          *(float32x4_t *)(v177 + 1089) = vmlaq_f32(v175, v156, v183);
          *(float32x4_t *)(v177 + 1093) = vmlaq_f32(v175, v156, v184);
          *(float32x4_t *)double v177 = vmlaq_f32(v176, v157, v183);
          *((float32x4_t *)v177 + 1) = vmlaq_f32(v176, v157, v184);
          uint16x8_t v185 = *(uint16x8_t *)&v178[-1].u8[4];
          float32x4_t v186 = vcvtq_f32_s32((int32x4_t)vsubl_u16(*v178, *(uint16x4_t *)v185.i8));
          float32x4_t v187 = vcvtq_f32_s32((int32x4_t)vsubl_high_u16(*(uint16x8_t *)v178->i8, v185));
          *(float32x4_t *)(v177 + 2178) = v186;
          *(float32x4_t *)(v177 + 2182) = v187;
          uint16x8_t v188 = *v180++;
          uint16x8_t v189 = v188;
          uint16x8_t v190 = *v181++;
          *(float32x4_t *)(v177 + 3267) = vcvtq_f32_s32((int32x4_t)vsubl_u16(*(uint16x4_t *)v189.i8, *(uint16x4_t *)v190.i8));
          *(float32x4_t *)(v177 + 3271) = vcvtq_f32_s32((int32x4_t)vsubl_high_u16(v189, v190));
          int32x4_t v174 = vaddq_s32(v174, v158);
          int32x4_t v173 = vaddq_s32(v173, v158);
          v177 += 8;
          v178 += 2;
          v182 -= 8;
        }
        while (v182);
        int v8 = v407;
        if (v170 != v171) {
          goto LABEL_149;
        }
LABEL_152:
        ++v150;
      }
      while (v150 != v118);
LABEL_153:
      free(v28);
      if ((int)v151 >= 1)
      {
        uint64_t v198 = v151;
        if (v151 >= 4)
        {
          uint64_t v199 = v151 & 0x7FFFFFFC;
          uint64_t v276 = v151 & 0xFFFFFFFC;
          v277 = v8;
          int32x2_t v201 = *(int32x2_t *)&v398;
          do
          {
            float32x4_t v278 = *(float32x4_t *)(v277 + 3267);
            float32x4_t v279 = *(float32x4_t *)(v277 + 2178);
            int8x16_t v280 = (int8x16_t)vcltzq_f32(v279);
            float32x4_t v281 = (float32x4_t)vbslq_s8(v280, (int8x16_t)vnegq_f32(v279), (int8x16_t)v279);
            int8x16_t v282 = (int8x16_t)vcltzq_f32(v278);
            float32x4_t v283 = (float32x4_t)vbslq_s8(v282, (int8x16_t)vnegq_f32(v278), (int8x16_t)v278);
            int8x16_t v284 = (int8x16_t)vcgtq_f32(v283, v281);
            float32x4_t v285 = vdivq_f32((float32x4_t)vbslq_s8(v284, (int8x16_t)v281, (int8x16_t)v283), (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v281, v283), (int8x16_t)v281, (int8x16_t)v283));
            float32x4_t v286 = vmulq_f32(v285, v285);
            float32x4_t v287 = vmlaq_f32(v285, v285, vmulq_f32(v286, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBEA7BE2C), v286, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E232344u), (float32x4_t)vdupq_n_s32(0xBD3E7316), v286))));
            float32x4_t v288 = (float32x4_t)vbslq_s8(v284, (int8x16_t)vsubq_f32((float32x4_t)vdupq_n_s32(0x3FC90FDBu), v287), (int8x16_t)v287);
            float32x4_t v289 = (float32x4_t)vbslq_s8(v280, (int8x16_t)vsubq_f32((float32x4_t)vdupq_n_s32(0x40490FDBu), v288), (int8x16_t)v288);
            float32x4_t v290 = (float32x4_t)vbslq_s8(v282, (int8x16_t)vnegq_f32(v289), (int8x16_t)v289);
            *((int8x16_t *)v277 + 1089) = vandq_s8((int8x16_t)v290, vorrq_s8((int8x16_t)vcltzq_f32(v290), (int8x16_t)vcgezq_f32(v290)));
            v277 += 4;
            v276 -= 4;
          }
          while (v276);
          v200.i64[0] = 0x4100000041000000;
          v200.i64[1] = 0x4100000041000000;
          if (v199 != v151) {
            goto LABEL_180;
          }
        }
        else
        {
          uint64_t v199 = 0;
          v200.i64[0] = 0x4100000041000000;
          v200.i64[1] = 0x4100000041000000;
          int32x2_t v201 = *(int32x2_t *)&v398;
LABEL_180:
          uint64_t v291 = v151 - v199;
          v292 = (float *)&v393[4 * v199];
          do
          {
            float v293 = v292[1089];
            float v294 = -*v292;
            if (*v292 >= 0.0) {
              float v294 = *v292;
            }
            float v295 = -v293;
            if (v293 >= 0.0) {
              float v295 = v292[1089];
            }
            BOOL v296 = v294 < v295;
            if (v294 >= v295) {
              float v297 = v295;
            }
            else {
              float v297 = v294;
            }
            if (v294 <= v295) {
              float v294 = v295;
            }
            float v298 = v297 / v294;
            float v299 = v298
                 + (float)((float)((float)(v298 * v298)
                                 * (float)((float)((float)((float)((float)(v298 * v298) * -0.046496) + 0.15931)
                                                 * (float)(v298 * v298))
                                         + -0.32762))
                         * v298);
            if (v296) {
              float v299 = 1.5708 - v299;
            }
            float v300 = 3.1416 - v299;
            if (*v292 >= 0.0) {
              float v300 = v299;
            }
            _NF = v293 < 0.0;
            float v301 = -v300;
            if (!_NF) {
              float v301 = v300;
            }
            v292[2178] = v301;
            ++v292;
            --v291;
          }
          while (v291);
        }
        if (v151 >= 4)
        {
          uint64_t v302 = v151 & 0x7FFFFFFC;
          uint64_t v306 = v151 & 0xFFFFFFFC;
          v307 = v8;
          v305.i64[0] = 0xC1000000C1000000;
          v305.i64[1] = 0xC1000000C1000000;
          v308.i64[0] = 0xBE000000BE000000;
          v308.i64[1] = 0xBE000000BE000000;
          do
          {
            v309 = (float32x4_t *)(v307 + 1089);
            float32x4_t v310 = *(float32x4_t *)(v307 + 2178);
            float32x4_t v311 = vmulq_f32(*(float32x4_t *)(v307 + 3267), *(float32x4_t *)(v307 + 3267));
            float32x4_t v312 = *(float32x4_t *)v307;
            v307 += 4;
            float32x4_t v313 = vmlaq_f32(v311, v310, v310);
            float32x4_t v314 = vmulq_f32(vmlaq_f32(vmulq_f32(*v309, *v309), v312, v312), v308);
            float64x2_t v315 = (float64x2_t)vdupq_n_s64(0x3F70000000000000uLL);
            float64x2_t v316 = vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v314.f32), v315);
            float64x2_t v317 = vmulq_f64(vcvt_hight_f64_f32(v314), v315);
            __asm { FMOV            V4.2D, #1.0 }
            float64x2_t v321 = vaddq_f64(v317, _Q4);
            float64x2_t v322 = vaddq_f64(v316, _Q4);
            __asm { FMOV            V4.4S, #-23.0 }
            float32x4_t v324 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v322), v321);
            float32x4_t v325 = vmulq_f32(v324, v324);
            float32x4_t v326 = vmulq_f32(v325, v325);
            float32x4_t v327 = vmulq_f32(v326, v326);
            float32x4_t v328 = vmulq_f32(v327, v327);
            float32x4_t v329 = vmulq_f32(v328, v328);
            float32x4_t v330 = vmulq_f32(v329, v329);
            float32x4_t v331 = vmulq_f32(v330, v330);
            v309[1089] = vmulq_f32(vsqrtq_f32(v313), (float32x4_t)vbicq_s8((int8x16_t)vmulq_f32(v331, v331), (int8x16_t)vcgtq_f32(_Q4, v314)));
            v306 -= 4;
          }
          while (v306);
          double v303 = 1.0;
          float v304 = -0.125;
          if (v302 != v151) {
            goto LABEL_204;
          }
        }
        else
        {
          uint64_t v302 = 0;
          double v303 = 1.0;
          float v304 = -0.125;
          v305.i64[0] = 0xC1000000C1000000;
          v305.i64[1] = 0xC1000000C1000000;
LABEL_204:
          uint64_t v334 = v151 - v302;
          uint64_t v335 = v302;
          v336 = (float *)&v392[4 * v302];
          v337 = &v8[v335];
          do
          {
            float v338 = (float)((float)(v337[1089] * v337[1089]) + (float)(*v337 * *v337)) * v304;
            float v339 = 0.0;
            if (v338 >= -23.0)
            {
              float v340 = v338 * 0.00390625 + v303;
              float v341 = (float)((float)(v340 * v340) * (float)(v340 * v340))
                   * (float)((float)(v340 * v340) * (float)(v340 * v340));
              float v342 = (float)((float)(v341 * v341) * (float)(v341 * v341))
                   * (float)((float)(v341 * v341) * (float)(v341 * v341));
              float v339 = (float)(v342 * v342) * (float)(v342 * v342);
            }
            v336[2178] = sqrtf((float)(*v336 * *v336) + (float)(v337[2178] * v337[2178])) * v339;
            ++v336;
            ++v337;
            --v334;
          }
          while (v334);
        }
        if (v151 >= 4)
        {
          uint64_t v332 = v151 & 0x7FFFFFFC;
          float32x4_t v343 = (float32x4_t)vdupq_lane_s32(v201, 0);
          uint64_t v344 = v151 & 0xFFFFFFFC;
          v345 = v8;
          v333 = " score              ";
          do
          {
            float64x2_t v346 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
            float32x4_t v347 = vmulq_f32(vsubq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_f32(*(float32x4_t *)(v345 + 4356)), (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)(v345 + 4356)), v346)), vaddq_f64(vcvt_hight_f64_f32(*(float32x4_t *)(v345 + 4356)), v346)), *(int8x16_t *)(v345 + 4356)), v343), (float32x4_t)vdupq_n_s32(0x3FA2F983u));
            float32x4_t v348 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_f32(v347), (int8x16_t)vaddq_f32(v347, v200), (int8x16_t)v347);
            float32x4_t v349 = vrndmq_f32(v348);
            float32x4_t v350 = vsubq_f32(v348, v349);
            float32x4_t v351 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_f32(v349), (int8x16_t)vaddq_f32(v349, v200), (int8x16_t)v349);
            *(int8x16_t *)(v345 + 6534) = vbslq_s8((int8x16_t)vcgeq_f32(v351, v200), (int8x16_t)vaddq_f32(v351, v305), (int8x16_t)v351);
            *(float32x4_t *)(v345 + 7623) = v350;
            v345 += 4;
            v344 -= 4;
          }
          while (v344);
          if (v332 != v151) {
            goto LABEL_211;
          }
        }
        else
        {
          uint64_t v332 = 0;
          v333 = "Pose score              " + 4;
LABEL_211:
          uint64_t v352 = v151 - v332;
          v353 = (float *)&v391[4 * v332];
          do
          {
            float v354 = *v353;
            if (*v353 < 0.0)
            {
              float v355 = *v353 + *((double *)v333 + 59);
              float v354 = v355;
            }
            float v356 = (float)(v354 - *(float *)v201.i32) * 1.2732;
            if (v356 < 0.0) {
              float v356 = v356 + 8.0;
            }
            float v357 = floorf(v356);
            float v358 = v356 - v357;
            if (v357 < 0.0) {
              float v357 = v357 + 8.0;
            }
            if (v357 >= 8.0) {
              float v357 = v357 + -8.0;
            }
            v353[2178] = v357;
            v353[3267] = v358;
            ++v353;
            --v352;
          }
          while (v352);
        }
        v359 = v8;
        v360 = v394;
        do
        {
          while (1)
          {
            float v372 = *v359 + v125;
            float v373 = v359[1089] + v125;
            float v374 = floorf(v372);
            float v375 = floorf(v373);
            unsigned int v376 = (int)(float)((float)((float)((float)(v375 * v126) + (float)(v374 * 60.0)) + (float)(int)v360[1089])
                              + 70.0);
            if (v376 >= 0x121) {
              break;
            }
            float v361 = v360[2178];
            float v362 = *v360 * v361;
            float v363 = v372 - v374;
            float v364 = v373 - v375;
            float v365 = v364 * (float)(v363 * v362);
            float v366 = (float)(1.0 - v364) * (float)(v363 * v362);
            float v367 = 1.0 - v363;
            float v368 = (float)(1.0 - v363) * v362;
            float v369 = *v360 * (float)(1.0 - v361);
            float v370 = v363 * v369;
            float v371 = v367 * v369;
            *(float *)&v409[v376] = *(float *)&v409[v376] + (float)((float)(1.0 - v364) * v371);
            *(float *)&v409[v376 + 1] = (float)((float)(1.0 - v364) * v368) + *(float *)&v409[v376 + 1];
            *(float *)&v409[v376 + 10] = (float)(v364 * v371) + *(float *)&v409[v376 + 10];
            *(float *)&v409[v376 + 11] = (float)(v364 * v368) + *(float *)&v409[v376 + 11];
            *(float *)&v409[v376 + 60] = (float)((float)(1.0 - v364) * v370) + *(float *)&v409[v376 + 60];
            *(float *)&v409[v376 + 61] = v366 + *(float *)&v409[v376 + 61];
            *(float *)&v409[v376 + 70] = (float)(v364 * v370) + *(float *)&v409[v376 + 70];
            *(float *)&v409[v376 + 71] = v365 + *(float *)&v409[v376 + 71];
            ++v360;
            ++v359;
            if (!--v198) {
              goto LABEL_163;
            }
          }
          printf("%sWarning : ", (const char *)&unk_21BB738AE);
          printf("Out of range (%d)", v376);
          putchar(10);
          ++v360;
          ++v359;
          --v198;
        }
        while (v198);
      }
LABEL_163:
      uint64_t v207 = 0;
      float32x2_t v410 = vadd_f32(v417, v410);
      *(float32x2_t *)v6->f32 = v410;
      v6->i32[2] = v411;
      v6->i32[3] = v412;
      v6[1].i32[0] = v413;
      v6[1].i32[1] = v414;
      v6[1].i32[2] = v415;
      v6[1].i32[3] = v416;
      float32x2_t v418 = vadd_f32(v425, v418);
      *(float32x2_t *)v6[2].f32 = v418;
      v6[2].i32[2] = v419;
      v6[2].i32[3] = v420;
      v6[3].i32[0] = v421;
      v6[3].i32[1] = v422;
      v6[3].i32[2] = v423;
      v6[3].i32[3] = v424;
      float32x2_t v426 = vadd_f32(v433, v426);
      *(float32x2_t *)v6[4].f32 = v426;
      v6[4].i32[2] = v427;
      v6[4].i32[3] = v428;
      v6[5].i32[0] = v429;
      v6[5].i32[1] = v430;
      v6[5].i32[2] = v431;
      v6[5].i32[3] = v432;
      float32x2_t v434 = vadd_f32(v441, v434);
      *(float32x2_t *)v6[6].f32 = v434;
      v6[6].i32[2] = v435;
      v6[6].i32[3] = v436;
      v6[7].i32[0] = v437;
      v6[7].i32[1] = v438;
      v6[7].i32[2] = v439;
      v6[7].i32[3] = v440;
      float32x2_t v442 = vadd_f32(v449, v442);
      *(float32x2_t *)v6[8].f32 = v442;
      v6[8].i32[2] = v443;
      v6[8].i32[3] = v444;
      v6[9].i32[0] = v445;
      v6[9].i32[1] = v446;
      v6[9].i32[2] = v447;
      v6[9].i32[3] = v448;
      float32x2_t v450 = vadd_f32(v457, v450);
      *(float32x2_t *)v6[10].f32 = v450;
      v6[10].i32[2] = v451;
      v6[10].i32[3] = v452;
      v6[11].i32[0] = v453;
      v6[11].i32[1] = v454;
      v6[11].i32[2] = v455;
      v6[11].i32[3] = v456;
      float32x2_t v458 = vadd_f32(v465, v458);
      *(float32x2_t *)v6[12].f32 = v458;
      v6[12].i32[2] = v459;
      v6[12].i32[3] = v460;
      v6[13].i32[0] = v461;
      v6[13].i32[1] = v462;
      v6[13].i32[2] = v463;
      v6[13].i32[3] = v464;
      float32x2_t v466 = vadd_f32(v473, v466);
      *(float32x2_t *)v6[14].f32 = v466;
      v6[14].i32[2] = v467;
      v6[14].i32[3] = v468;
      v6[15].i32[0] = v469;
      v6[15].i32[1] = v470;
      v6[15].i32[2] = v471;
      v6[15].i32[3] = v472;
      float32x2_t v474 = vadd_f32(v481, v474);
      *(float32x2_t *)v6[16].f32 = v474;
      v6[16].i32[2] = v475;
      v6[16].i32[3] = v476;
      v6[17].i32[0] = v477;
      v6[17].i32[1] = v478;
      v6[17].i32[2] = v479;
      v6[17].i32[3] = v480;
      *(float32x2_t *)v6[18].f32 = vadd_f32(v489, v482);
      v6[18].i32[2] = v483;
      v6[18].i32[3] = v484;
      v6[19].i32[0] = v485;
      v6[19].i32[1] = v486;
      v6[19].i32[2] = v487;
      v6[19].i32[3] = v488;
      *(float32x2_t *)v6[20].f32 = vadd_f32(v497, v490);
      v6[20].i32[2] = v491;
      v6[20].i32[3] = v492;
      v6[21].i32[0] = v493;
      v6[21].i32[1] = v494;
      v6[21].i32[2] = v495;
      v6[21].i32[3] = v496;
      *(float32x2_t *)v6[22].f32 = vadd_f32(v505, v498);
      v6[22].i32[2] = v499;
      v6[22].i32[3] = v500;
      v6[23].i32[0] = v501;
      v6[23].i32[1] = v502;
      v6[23].i32[2] = v503;
      v6[23].i32[3] = v504;
      *(float32x2_t *)v6[24].f32 = vadd_f32(v513, v506);
      v6[24].i32[2] = v507;
      v6[24].i32[3] = v508;
      v6[25].i32[0] = v509;
      v6[25].i32[1] = v510;
      v6[25].i32[2] = v511;
      v6[25].i32[3] = v512;
      *(float32x2_t *)v6[26].f32 = vadd_f32(v521, v514);
      v6[26].i32[2] = v515;
      v6[26].i32[3] = v516;
      v6[27].i32[0] = v517;
      v6[27].i32[1] = v518;
      v6[27].i32[2] = v519;
      v6[27].i32[3] = v520;
      *(float32x2_t *)v6[28].f32 = vadd_f32(v529, v522);
      v6[28].i32[2] = v523;
      v6[28].i32[3] = v524;
      v6[29].i32[0] = v525;
      v6[29].i32[1] = v526;
      v6[29].i32[2] = v527;
      v6[29].i32[3] = v528;
      *(float32x2_t *)v6[30].f32 = vadd_f32(v537, v530);
      v6[30].i32[2] = v531;
      v6[30].i32[3] = v532;
      v6[31].i32[0] = v533;
      v6[31].i32[1] = v534;
      v6[31].i32[2] = v535;
      v6[31].i32[3] = v536;
      int32x2_t v208 = 0;
      do
      {
        *(float *)v208.i32 = *(float *)v208.i32 + (float)(v6->f32[v207] * v6->f32[v207]);
        ++v207;
      }
      while (v207 != 128);
      uint64_t v209 = 0;
      *(float *)v208.i32 = sqrtf(*(float *)v208.i32) * 0.2;
      float32x4_t v210 = (float32x4_t)vdupq_lane_s32(v208, 0);
      int8x16_t v211 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[1]), (int8x16_t)v6[1], (int8x16_t)v210);
      *(int8x16_t *)int v6 = vbslq_s8((int8x16_t)vcgtq_f32(v210, *v6), *(int8x16_t *)v6, (int8x16_t)v210);
      v6[1] = (float32x4_t)v211;
      int8x16_t v212 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[3]), (int8x16_t)v6[3], (int8x16_t)v210);
      v6[2] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[2]), (int8x16_t)v6[2], (int8x16_t)v210);
      v6[3] = (float32x4_t)v212;
      int8x16_t v213 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[5]), (int8x16_t)v6[5], (int8x16_t)v210);
      v6[4] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[4]), (int8x16_t)v6[4], (int8x16_t)v210);
      v6[5] = (float32x4_t)v213;
      int8x16_t v214 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[7]), (int8x16_t)v6[7], (int8x16_t)v210);
      v6[6] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[6]), (int8x16_t)v6[6], (int8x16_t)v210);
      v6[7] = (float32x4_t)v214;
      int8x16_t v215 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[9]), (int8x16_t)v6[9], (int8x16_t)v210);
      v6[8] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[8]), (int8x16_t)v6[8], (int8x16_t)v210);
      v6[9] = (float32x4_t)v215;
      int8x16_t v216 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[11]), (int8x16_t)v6[11], (int8x16_t)v210);
      v6[10] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[10]), (int8x16_t)v6[10], (int8x16_t)v210);
      v6[11] = (float32x4_t)v216;
      int8x16_t v217 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[13]), (int8x16_t)v6[13], (int8x16_t)v210);
      v6[12] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[12]), (int8x16_t)v6[12], (int8x16_t)v210);
      v6[13] = (float32x4_t)v217;
      int8x16_t v218 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[15]), (int8x16_t)v6[15], (int8x16_t)v210);
      v6[14] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[14]), (int8x16_t)v6[14], (int8x16_t)v210);
      v6[15] = (float32x4_t)v218;
      int8x16_t v219 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[17]), (int8x16_t)v6[17], (int8x16_t)v210);
      v6[16] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[16]), (int8x16_t)v6[16], (int8x16_t)v210);
      v6[17] = (float32x4_t)v219;
      int8x16_t v220 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[19]), (int8x16_t)v6[19], (int8x16_t)v210);
      v6[18] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[18]), (int8x16_t)v6[18], (int8x16_t)v210);
      v6[19] = (float32x4_t)v220;
      int8x16_t v221 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[21]), (int8x16_t)v6[21], (int8x16_t)v210);
      v6[20] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[20]), (int8x16_t)v6[20], (int8x16_t)v210);
      v6[21] = (float32x4_t)v221;
      int8x16_t v222 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[23]), (int8x16_t)v6[23], (int8x16_t)v210);
      v6[22] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[22]), (int8x16_t)v6[22], (int8x16_t)v210);
      v6[23] = (float32x4_t)v222;
      int8x16_t v223 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[25]), (int8x16_t)v6[25], (int8x16_t)v210);
      v6[24] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[24]), (int8x16_t)v6[24], (int8x16_t)v210);
      v6[25] = (float32x4_t)v223;
      int8x16_t v224 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[27]), (int8x16_t)v6[27], (int8x16_t)v210);
      v6[26] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[26]), (int8x16_t)v6[26], (int8x16_t)v210);
      v6[27] = (float32x4_t)v224;
      int8x16_t v225 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[29]), (int8x16_t)v6[29], (int8x16_t)v210);
      v6[28] = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[28]), (int8x16_t)v6[28], (int8x16_t)v210);
      v6[29] = (float32x4_t)v225;
      int8x16_t v226 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[30]), (int8x16_t)v6[30], (int8x16_t)v210);
      int8x16_t v227 = vbslq_s8((int8x16_t)vcgtq_f32(v210, v6[31]), (int8x16_t)v6[31], (int8x16_t)v210);
      v6[30] = (float32x4_t)v226;
      v6[31] = (float32x4_t)v227;
      int32x2_t v228 = 0;
      a2 = v395;
      v229.i64[0] = 0x4400000044000000;
      v229.i64[1] = 0x4400000044000000;
      do
      {
        *(float *)v228.i32 = *(float *)v228.i32 + (float)(v6->f32[v209] * v6->f32[v209]);
        ++v209;
      }
      while (v209 != 128);
      uint64_t v230 = 0;
      *(float *)v228.i32 = sqrtf(*(float *)v228.i32);
      float32x4_t v231 = (float32x4_t)vdupq_lane_s32(v228, 0);
      float32x4_t v232 = vdivq_f32(v6[1], v231);
      *int v6 = vdivq_f32(*v6, v231);
      v6[1] = v232;
      float32x4_t v233 = vdivq_f32(v6[3], v231);
      v6[2] = vdivq_f32(v6[2], v231);
      v6[3] = v233;
      float32x4_t v234 = vdivq_f32(v6[5], v231);
      v6[4] = vdivq_f32(v6[4], v231);
      v6[5] = v234;
      float32x4_t v235 = vdivq_f32(v6[7], v231);
      v6[6] = vdivq_f32(v6[6], v231);
      v6[7] = v235;
      float32x4_t v236 = vdivq_f32(v6[9], v231);
      v6[8] = vdivq_f32(v6[8], v231);
      v6[9] = v236;
      float32x4_t v237 = vdivq_f32(v6[11], v231);
      v6[10] = vdivq_f32(v6[10], v231);
      v6[11] = v237;
      float32x4_t v238 = vdivq_f32(v6[13], v231);
      v6[12] = vdivq_f32(v6[12], v231);
      v6[13] = v238;
      float32x4_t v239 = vdivq_f32(v6[15], v231);
      v6[14] = vdivq_f32(v6[14], v231);
      v6[15] = v239;
      float32x4_t v240 = vdivq_f32(v6[17], v231);
      v6[16] = vdivq_f32(v6[16], v231);
      v6[17] = v240;
      float32x4_t v241 = vdivq_f32(v6[19], v231);
      v6[18] = vdivq_f32(v6[18], v231);
      v6[19] = v241;
      float32x4_t v242 = vdivq_f32(v6[21], v231);
      v6[20] = vdivq_f32(v6[20], v231);
      v6[21] = v242;
      float32x4_t v243 = vdivq_f32(v6[23], v231);
      v6[22] = vdivq_f32(v6[22], v231);
      v6[23] = v243;
      float32x4_t v244 = vdivq_f32(v6[25], v231);
      v6[24] = vdivq_f32(v6[24], v231);
      v6[25] = v244;
      float32x4_t v245 = vdivq_f32(v6[27], v231);
      v6[26] = vdivq_f32(v6[26], v231);
      v6[27] = v245;
      float32x4_t v246 = vdivq_f32(v6[29], v231);
      v6[28] = vdivq_f32(v6[28], v231);
      v6[29] = v246;
      float32x4_t v247 = vdivq_f32(v6[30], v231);
      float32x4_t v248 = vdivq_f32(v6[31], v231);
      v6[30] = v247;
      v6[31] = v248;
      do
      {
        double v249 = (int8x16_t *)&v6[v230];
        float32x4_t v250 = vmulq_f32(v6[v230], v229);
        float32x4_t v251 = vmulq_f32(v6[v230 + 1], v229);
        int8x16_t v252 = (int8x16_t)vcltzq_f32(v250);
        int8x16_t v253 = (int8x16_t)vcltzq_f32(v251);
        float32x4_t v254 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        int8x16_t v255 = (int8x16_t)vcgtq_f32(v250, v254);
        int8x16_t v256 = (int8x16_t)vcgtq_f32(v251, v254);
        *double v249 = vbslq_s8(vbicq_s8(v255, v252), (int8x16_t)v254, vandq_s8((int8x16_t)v250, vbicq_s8(vmvnq_s8(v252), v255)));
        v249[1] = vbslq_s8(vbicq_s8(v256, v253), (int8x16_t)v254, vandq_s8((int8x16_t)v251, vbicq_s8(vmvnq_s8(v253), v256)));
        v230 += 2;
      }
      while (v230 != 32);
      float32x4_t v257 = vdivq_f32(v6[1], v254);
      *int v6 = vdivq_f32(*v6, v254);
      v6[1] = v257;
      float32x4_t v258 = vdivq_f32(v6[3], v254);
      v6[2] = vdivq_f32(v6[2], v254);
      v6[3] = v258;
      float32x4_t v259 = vdivq_f32(v6[5], v254);
      v6[4] = vdivq_f32(v6[4], v254);
      v6[5] = v259;
      float32x4_t v260 = vdivq_f32(v6[7], v254);
      v6[6] = vdivq_f32(v6[6], v254);
      v6[7] = v260;
      float32x4_t v261 = vdivq_f32(v6[9], v254);
      v6[8] = vdivq_f32(v6[8], v254);
      v6[9] = v261;
      float32x4_t v262 = vdivq_f32(v6[11], v254);
      v6[10] = vdivq_f32(v6[10], v254);
      v6[11] = v262;
      float32x4_t v263 = vdivq_f32(v6[13], v254);
      v6[12] = vdivq_f32(v6[12], v254);
      v6[13] = v263;
      float32x4_t v264 = vdivq_f32(v6[15], v254);
      v6[14] = vdivq_f32(v6[14], v254);
      v6[15] = v264;
      float32x4_t v265 = vdivq_f32(v6[17], v254);
      v6[16] = vdivq_f32(v6[16], v254);
      v6[17] = v265;
      float32x4_t v266 = vdivq_f32(v6[19], v254);
      v6[18] = vdivq_f32(v6[18], v254);
      v6[19] = v266;
      float32x4_t v267 = vdivq_f32(v6[21], v254);
      v6[20] = vdivq_f32(v6[20], v254);
      v6[21] = v267;
      float32x4_t v268 = vdivq_f32(v6[23], v254);
      v6[22] = vdivq_f32(v6[22], v254);
      v6[23] = v268;
      float32x4_t v269 = vdivq_f32(v6[25], v254);
      v6[24] = vdivq_f32(v6[24], v254);
      v6[25] = v269;
      float32x4_t v270 = vdivq_f32(v6[27], v254);
      v6[26] = vdivq_f32(v6[26], v254);
      v6[27] = v270;
      float32x4_t v271 = vdivq_f32(v6[29], v254);
      v6[28] = vdivq_f32(v6[28], v254);
      v6[29] = v271;
      float32x4_t v272 = vdivq_f32(v6[31], v254);
      v6[30] = vdivq_f32(v6[30], v254);
      v6[31] = v272;
      if (v403 + v402 + 32 >= (unint64_t)&v6[32] || (unint64_t)v6 >= v403 + v402 + 160)
      {
        int v12 = (int8x16_t *)(v403 + 288 * v405);
        v13.i64[0] = 0xBF000000BF000000;
        v13.i64[1] = 0xBF000000BF000000;
        v14.i64[0] = 0x3F0000003F000000;
        v14.i64[1] = 0x3F0000003F000000;
        v12[2] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(*v6, v254)), v14, v13), v254, *v6)), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[1], v254)), v14, v13), v254, v6[1]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[2], v254)), v14, v13), v254, v6[2])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[3], v254)), v14, v13), v254, v6[3]))));
        v12[3] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[4], v254)), v14, v13), v254, v6[4])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[5], v254)), v14, v13), v254, v6[5]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[6], v254)), v14, v13), v254, v6[6])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[7], v254)), v14, v13), v254, v6[7]))));
        v12[4] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[8], v254)), v14, v13), v254, v6[8])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[9], v254)), v14, v13), v254, v6[9]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[10], v254)), v14, v13), v254, v6[10])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[11], v254)), v14, v13), v254, v6[11]))));
        v12[5] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[12], v254)), v14, v13), v254, v6[12])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[13], v254)), v14, v13), v254, v6[13]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[14], v254)), v14, v13), v254, v6[14])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[15], v254)), v14, v13), v254, v6[15]))));
        v12[6] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[16], v254)), v14, v13), v254, v6[16])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[17], v254)), v14, v13), v254, v6[17]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[18], v254)), v14, v13), v254, v6[18])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[19], v254)), v14, v13), v254, v6[19]))));
        v12[7] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[20], v254)), v14, v13), v254, v6[20])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[21], v254)), v14, v13), v254, v6[21]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[22], v254)), v14, v13), v254, v6[22])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[23], v254)), v14, v13), v254, v6[23]))));
        v12[8] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[24], v254)), v14, v13), v254, v6[24])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[25], v254)), v14, v13), v254, v6[25]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[26], v254)), v14, v13), v254, v6[26])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[27], v254)), v14, v13), v254, v6[27]))));
        v12[9] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[28], v254)), v14, v13), v254, v6[28])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[29], v254)), v14, v13), v254, v6[29]))), (int8x16_t)vuzp1q_s16((int16x8_t)vcvtq_s32_f32(
                                             vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[30], v254)), v14, v13), v254, v6[30])), (int16x8_t)vcvtq_s32_f32(vmlaq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtzq_f32(vmulq_f32(v6[31], v254)), v14, v13), v254, v6[31]))));
        float v11 = -0.5;
      }
      else
      {
        uint64_t v273 = 0;
        float v11 = -0.5;
        do
        {
          float v274 = v6->f32[v273];
          if ((float)(v274 * 255.0) <= 0.0) {
            float v275 = -0.5;
          }
          else {
            float v275 = 0.5;
          }
          *(unsigned char *)(v403 + v404 + v273++) = (int)(float)(v275 + (float)(v274 * 255.0));
        }
        while (v273 != 128);
      }
      uint64_t v9 = v405 + 1;
      uint64_t v10 = v404 + 288;
    }
    while (*v395 > v405 + 1);
  }
  free(v8);
  free(v6);
  if (a4)
  {
    if (*(_DWORD *)(a4 + 212))
    {
      *(void *)(a4 + 120) += mach_absolute_time();
      if (*(_DWORD *)(a4 + 212))
      {
LABEL_231:
        printf("Verbose : ");
        printf("Total time for %40s : %7.3f ms", (const char *)(a4 + 148), (double)*(uint64_t *)(a4 + 120) * 0.000001);
        putchar(10);
        return;
      }
    }
    else
    {
      clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a4 + 64));
      clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a4 + 80));
      clock_gettime(_CLOCK_MONOTONIC, (timespec *)(a4 + 48));
      uint64_t v384 = *(void *)(a4 + 56) - *(void *)(a4 + 8) + 1000000000 * (*(void *)(a4 + 48) - *(void *)a4);
      uint64_t v385 = *(void *)(a4 + 72) - *(void *)(a4 + 24) + 1000000000 * (*(void *)(a4 + 64) - *(void *)(a4 + 16));
      uint64_t v386 = *(void *)(a4 + 88) - *(void *)(a4 + 40) + 1000000000 * (*(void *)(a4 + 80) - *(void *)(a4 + 32));
      uint64_t v387 = *(void *)(a4 + 128);
      uint64_t v388 = v384 + *(void *)(a4 + 120);
      *(void *)(a4 + 96) = v384;
      *(void *)(a4 + 104) = v385;
      uint64_t v389 = v385 + v387;
      *(void *)(a4 + 112) = v386;
      *(void *)(a4 + 120) = v388;
      uint64_t v390 = v386 + *(void *)(a4 + 136);
      *(void *)(a4 + 128) = v389;
      *(void *)(a4 + 136) = v390;
      ++*(_DWORD *)(a4 + 144);
      if (*(_DWORD *)(a4 + 212)) {
        goto LABEL_231;
      }
    }
    log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v377, v378, v379, v380, v381, v382, v383, (char)&str_4_1);
  }
}

double vl_par_default@<D0>(char *a1@<X8>)
{
  uint64_t v1 = a1;
  uint64_t v9 = *MEMORY[0x263EF8340];
  bzero(a1, 0x3F0uLL);
  *((void *)v1 + 1) = 0x300000007;
  *(void *)(v1 + 20) = 0x412000003D75C28FLL;
  *(void *)(v1 + 28) = -3232969523;
  *((_DWORD *)v1 + 9) = 1061997773;
  *((void *)v1 + 5) = 0x700000003;
  *(void *)(v1 + 52) = 0xA3D75C28FLL;
  *(void *)(v1 + 60) = 0x53F000000;
  *(void *)(v1 + 68) = 0x3FC0000040900000;
  *(void *)(v1 + 76) = 0x3F4CCCCD00000024;
  *((_DWORD *)v1 + 22) = 1000;
  *(void *)(v1 + 92) = 0;
  *(void *)(v1 + 100) = 0x40000000000;
  *((_DWORD *)v1 + 28) = 942130604;
  *((void *)v1 + 19) = 0x6400000002;
  *((void *)v1 + 21) = 0x1400000000;
  *((void *)v1 + 30) = 0;
  *((_DWORD *)v1 + 62) = 0;
  *((void *)v1 + 58) = 0;
  *((void *)v1 + 59) = 0;
  *((void *)v1 + 57) = 0;
  *((void *)v1 + 22) = 0x186A000000002;
  v1 += 176;
  *((void *)v1 + 1) = 0x3F59999A3BDA740ELL;
  *((void *)v1 + 2) = 1061158912;
  *((_DWORD *)v1 + 6) = 1065353216;
  *(_OWORD *)(v1 + 28) = xmmword_21BB7CFC0;
  *(void *)(v1 + 44) = 0x8000000080000000;
  *((_DWORD *)v1 + 13) = 1065353216;
  *((void *)v1 + 7) = 0;
  *(void *)(v1 + 76) = 0x3FC000003F000000;
  *(void *)(v1 + 84) = 0x13F800000;
  *(_OWORD *)(v1 + 92) = xmmword_21BB7CFD0;
  *((_DWORD *)v1 + 27) = 0;
  *((void *)v1 + 14) = 1;
  *((_DWORD *)v1 + 30) = 1070386381;
  *((_DWORD *)v1 + 33) = 0;
  *(void *)(v1 + 124) = 0;
  *((void *)v1 + 17) = 0xFFFFFFFFFLL;
  *((_OWORD *)v1 + 9) = 0u;
  *((_OWORD *)v1 + 10) = 0u;
  *((_OWORD *)v1 + 11) = xmmword_21BB7CFE0;
  *((void *)v1 + 24) = 0x3C8EFA353F800000;
  *((void *)v1 + 25) = 0x143DB2B8C2;
  *((void *)v1 + 26) = 0x240000000;
  *((void *)v1 + 27) = 0;
  *((void *)v1 + 28) = 0x3F8000003A0EFA35;
  *((_DWORD *)v1 + 58) = 1061997773;
  *(_OWORD *)(v1 + 236) = xmmword_21BB7CFF0;
  *(_OWORD *)(v1 + 252) = xmmword_21BB7D000;
  *((_DWORD *)v1 + 67) = 1084227584;
  *((void *)v1 + 34) = 0x53DB2B8C2;
  *((void *)v1 + 38) = 0x434800003F7D70A4;
  *((void *)v1 + 39) = 1135542272;
  *((void *)v1 + 40) = 0;
  *(_OWORD *)(v1 + 328) = xmmword_21BB7D010;
  *((_DWORD *)v1 + 86) = 0;
  *(_OWORD *)(v1 + 348) = xmmword_21BB7D020;
  *(void *)(v1 + 364) = 0x3F8CCCCD00000005;
  *(_OWORD *)(v1 + 372) = xmmword_21BB7D030;
  *(_OWORD *)(v1 + 388) = xmmword_21BB7D040;
  *(void *)(v1 + 404) = 0x40A0000000000000;
  __asm { FMOV            V0.2S, #20.0 }
  *((void *)v1 - 7) = _D0;
  *((void *)v1 - 6) = 0;
  *((void *)v1 - 5) = 0;
  *((void *)v1 - 4) = 0x100000015;
  *(_OWORD *)(v1 + 412) = xmmword_21BB7D050;
  *((_DWORD *)v1 + 107) = 1;
  *((void *)v1 + 54) = 0x600000000;
  *((void *)v1 + 55) = 1077936128;
  *((void *)v1 + 56) = 0x3FAACEE9F37BEBD5;
  *(_OWORD *)(v1 + 456) = xmmword_21BB7D060;
  slam_tracker_vo_par_ver(0, (uint64_t)__src);
  *(_OWORD *)(v1 + 472) = xmmword_21BB7D070;
  *((void *)v1 + 61) = 120;
  memcpy(v1 + 496, __src, 0x130uLL);
  *(void *)&double result = 0xA00000000;
  *((_OWORD *)v1 + 50) = xmmword_21BB7D080;
  return result;
}

void *plq_create_helper(void *a1, int a2, _DWORD *a3)
{
  v82[1] = *MEMORY[0x263EF8340];
  int v6 = malloc_type_calloc(1uLL, 0x80uLL, 0x10B0040C0F52B6EuLL);
  int v7 = v6;
  uint64_t v8 = *a1;
  *int v6 = *a1;
  v6[1] = v8;
  float v9 = *((float *)&v8 + 1);
  if (a2 <= 1)
  {
    uint64_t v10 = a2;
    float v13 = *((float *)&v8 + 1);
    float v14 = *(float *)&v8;
  }
  else
  {
    uint64_t v10 = a2;
    uint64_t v11 = a2 - 1;
    int v12 = (float *)a1 + 3;
    float v13 = *((float *)&v8 + 1);
    float v14 = *(float *)&v8;
    do
    {
      if (*(float *)&v8 >= *(v12 - 1)) {
        *(float *)&uint64_t v8 = *(v12 - 1);
      }
      if (v9 >= *v12) {
        float v9 = *v12;
      }
      *(_DWORD *)int v6 = v8;
      *((float *)v6 + 1) = v9;
      if (v14 <= *(v12 - 1)) {
        float v14 = *(v12 - 1);
      }
      float v15 = *v12;
      v12 += 2;
      float v16 = v15;
      if (v13 <= v15) {
        float v13 = v16;
      }
      *((float *)v6 + 2) = v14;
      *((float *)v6 + 3) = v13;
      --v11;
    }
    while (v11);
  }
  float v17 = v14 + 0.000001;
  float v18 = v13 + 0.000001;
  *((float *)v6 + 2) = v17;
  *((float *)v6 + 3) = v18;
  int v19 = (a2 + 4) / 5;
  uint64_t v20 = (int)sqrt((double)v19);
  int v21 = (v19 + (int)v20 - 1) / (int)v20;
  *((_DWORD *)v6 + 24) = v20;
  *((_DWORD *)v6 + 25) = v21;
  float v22 = v17 - *(float *)&v8;
  *((float *)v6 + 28) = v22;
  *((float *)v6 + 26) = v22 / (float)v21;
  *((float *)v6 + 27) = (float)(v18 - v9) / (float)(int)v20;
  size_t v23 = v21 * (int)v20;
  v6[7] = malloc_type_malloc(4 * v23, 0x100004052888210uLL);
  *((void *)v7 + 6) = malloc_type_malloc(4 * v23, 0x100004052888210uLL);
  *((void *)v7 + 5) = malloc_type_malloc(4 * (v21 * (int)v20 + 1), 0x100004052888210uLL);
  *((void *)v7 + 8) = malloc_type_malloc(4 * v21, 0x100004052888210uLL);
  *((void *)v7 + 9) = malloc_type_malloc(4 * v21, 0x100004052888210uLL);
  *((void *)v7 + 10) = malloc_type_malloc(4 * v21, 0x100004052888210uLL);
  *((void *)v7 + 11) = malloc_type_malloc(4 * v21, 0x100004052888210uLL);
  *((void *)v7 + 2) = malloc_type_malloc(8 * a2, 0x100004000313F17uLL);
  *((void *)v7 + 3) = malloc_type_malloc(4 * a2, 0x100004052888210uLL);
  *((void *)v7 + 4) = malloc_type_malloc(4 * a2, 0x100004052888210uLL);
  float v24 = malloc_type_calloc(v23, 4uLL, 0x100004052888210uLL);
  uint64_t v25 = MEMORY[0x270FA5388](v24, v82);
  float v28 = (char *)v82 - ((v27 + 15) & 0x7FFFFFFF0);
  if (a2 >= 1)
  {
    float v29 = *((float *)v7 + 28);
    float v30 = *(float *)v7;
    float v31 = *((float *)v7 + 1);
    float v32 = *((float *)v7 + 3) - v31;
    float v33 = (float *)a1 + 1;
    float v34 = (int *)v28;
    uint64_t v35 = v10;
    do
    {
      float v36 = (float)(*(v33 - 1) - v30) / v29;
      if (v36 < 0.0) {
        float v36 = 0.0;
      }
      if (v36 > 1.0) {
        float v36 = 1.0;
      }
      int v37 = *((_DWORD *)v7 + 25);
      int v38 = (int)(float)(v36 * (float)v37);
      float v39 = *v33;
      v33 += 2;
      float v40 = (float)(v39 - v31) / v32;
      if (v40 < 0.0) {
        float v40 = 0.0;
      }
      if (v40 > 1.0) {
        float v40 = 1.0;
      }
      int v41 = v38 + v37 * (int)(float)(v40 * (float)*((int *)v7 + 24));
      uint64_t v42 = 4 * v41;
      int v43 = *(_DWORD *)(v25 + v42);
      *v34++ = v41;
      *(_DWORD *)(v25 + v42) = v43 + 1;
      --v35;
    }
    while (v35);
  }
  float v44 = (int *)MEMORY[0x270FA5388](v25, v26);
  uint64_t v48 = (char *)v82 - v47;
  *(_DWORD *)((char *)v82 - v47) = 0;
  uint64_t v49 = *((void *)v7 + 5);
  if ((int)v23 >= 1)
  {
    int v50 = 0;
    uint64_t v51 = v23;
    float v52 = v48 + 4;
    float v53 = v44;
    float v54 = (_DWORD *)*((void *)v7 + 5);
    do
    {
      int v55 = *v53++;
      *v54++ = v50;
      v50 += v55;
      *v52++ = v50;
      --v51;
    }
    while (v51);
  }
  *(_DWORD *)(v49 + 4 * v23) = a2;
  if (a2 >= 1)
  {
    do
    {
      uint64_t v56 = *v46++;
      uint64_t v57 = *(int *)&v48[4 * v56];
      *(_DWORD *)&v48[4 * v56] = v57 + 1;
      LODWORD(v56) = *a3++;
      uint64_t v58 = 4 * v57;
      uint64_t v59 = *((void *)v7 + 2);
      *(_DWORD *)(*((void *)v7 + 3) + v58) = v56;
      *(void *)(v59 + 8 * v57) = *a1;
      LODWORD(v56) = *(_DWORD *)a1++;
      *(float *)(*((void *)v7 + 4) + v58) = (float)(*(float *)&v56 - *(float *)v7) / *((float *)v7 + 28);
      --v10;
    }
    while (v10);
  }
  if ((int)v45 >= 1)
  {
    uint64_t v60 = v45;
    if ((int)v20 >= 1)
    {
      uint64_t v61 = 0;
      uint64_t v63 = *((void *)v7 + 6);
      uint64_t v62 = *((void *)v7 + 7);
      uint64_t v64 = *((void *)v7 + 5);
      uint64_t v65 = 4 * v45;
      int v66 = v45 * (v20 - 1);
      do
      {
        uint64_t v67 = 0;
        int v68 = -1;
        int v69 = v61;
        uint64_t v70 = v20;
        do
        {
          *(_DWORD *)(v62 + v67) = v68;
          if (*(_DWORD *)(v64 + v67) != *(_DWORD *)(v64 + v67 + 4)) {
            int v68 = v69;
          }
          v69 += v45;
          v67 += v65;
          --v70;
        }
        while (v70);
        int v71 = -1;
        uint64_t v72 = 4 * ((int)v20 - 1) * v45;
        int v73 = v66;
        uint64_t v74 = (int)v20 + 1;
        do
        {
          *(_DWORD *)(v63 + v72) = v71;
          if (*(_DWORD *)(v64 + v72) != *(_DWORD *)(v64 + v72 + 4)) {
            int v71 = v73;
          }
          --v74;
          v73 -= v45;
          v72 -= v65;
        }
        while (v74 > 1);
        ++v61;
        v64 += 4;
        v62 += 4;
        ++v66;
        v63 += 4;
      }
      while (v61 != v45);
    }
    float v75 = *(float *)v7;
    double v76 = (float *)*((void *)v7 + 8);
    int32x4_t v77 = (float *)*((void *)v7 + 9);
    double v78 = (float *)*((void *)v7 + 10);
    float v79 = (float *)*((void *)v7 + 11);
    float v80 = 0.0;
    do
    {
      *v76++ = v75;
      *v78++ = v80;
      float v80 = (float)(1.0 / (float)v21) + v80;
      float v75 = v75 + *((float *)v7 + 26);
      *v77++ = v75;
      *v79++ = v80;
      --v60;
    }
    while (v60);
  }
  free(v44);
  return v7;
}

void *plq_create_ids(void *a1, uint64_t a2)
{
  v31[1] = *MEMORY[0x263EF8340];
  if (!a2) {
    return 0;
  }
  unsigned int v2 = a2;
  MEMORY[0x270FA5388](a1, a2);
  int v5 = (int32x4_t *)((char *)v31 - v4);
  if (v6 < 1)
  {
    helper = plq_create_helper(a1, v2, (void *)((char *)v31 - v4));
    helper[15] = plq_create_helper(a1, v2, v5);
    return helper;
  }
  if (v2 < 8)
  {
    for (uint64_t i = 0; i != v2; ++i)
LABEL_10:
      v5->i32[i] = i;
    goto LABEL_11;
  }
  uint64_t i = v2 & 0xFFFFFFF8;
  int32x4_t v9 = (int32x4_t)xmmword_21BB7A770;
  uint64_t v10 = v5 + 1;
  v11.i64[0] = 0x400000004;
  v11.i64[1] = 0x400000004;
  v12.i64[0] = 0x800000008;
  v12.i64[1] = 0x800000008;
  uint64_t v13 = i;
  do
  {
    v10[-1] = v9;
    *uint64_t v10 = vaddq_s32(v9, v11);
    int32x4_t v9 = vaddq_s32(v9, v12);
    v10 += 2;
    v13 -= 8;
  }
  while (v13);
  if (i != v2) {
    goto LABEL_10;
  }
LABEL_11:
  helper = plq_create_helper(a1, v2, v5);
  if (v2 < 8)
  {
    uint64_t v14 = 0;
LABEL_16:
    uint64_t v20 = v2 - v14;
    int v21 = (int32x2_t *)&a1[v14];
    do
    {
      *int v21 = vrev64_s32(*v21);
      ++v21;
      --v20;
    }
    while (v20);
    goto LABEL_18;
  }
  uint64_t v14 = v2 & 0xFFFFFFF8;
  float v15 = (float *)(a1 + 4);
  uint64_t v16 = v14;
  do
  {
    float v17 = v15 - 8;
    float32x4x2_t v32 = vld2q_f32(v17);
    float32x4x2_t v34 = vld2q_f32(v15);
    float32x4_t v18 = v32.val[0];
    float32x4_t v19 = v34.val[0];
    vst2q_f32(v17, *(float32x4x2_t *)((char *)&v32 + 16));
    vst2q_f32(v15, *(float32x4x2_t *)((char *)&v34 + 16));
    v15 += 16;
    v16 -= 8;
  }
  while (v16);
  if (v14 != v2) {
    goto LABEL_16;
  }
LABEL_18:
  helper[15] = plq_create_helper(a1, v2, v5);
  if (v2 < 8)
  {
    uint64_t v22 = 0;
LABEL_23:
    uint64_t v28 = v2 - v22;
    float v29 = (int32x2_t *)&a1[v22];
    do
    {
      *float v29 = vrev64_s32(*v29);
      ++v29;
      --v28;
    }
    while (v28);
    return helper;
  }
  uint64_t v22 = v2 & 0xFFFFFFF8;
  size_t v23 = (float *)(a1 + 4);
  uint64_t v24 = v22;
  do
  {
    uint64_t v25 = v23 - 8;
    float32x4x2_t v33 = vld2q_f32(v25);
    float32x4x2_t v35 = vld2q_f32(v23);
    float32x4_t v26 = v33.val[0];
    float32x4_t v27 = v35.val[0];
    vst2q_f32(v25, *(float32x4x2_t *)((char *)&v33 + 16));
    vst2q_f32(v23, *(float32x4x2_t *)((char *)&v35 + 16));
    v23 += 16;
    v24 -= 8;
  }
  while (v24);
  if (v22 != v2) {
    goto LABEL_23;
  }
  return helper;
}

void plq_free(uint64_t a1)
{
  if (a1)
  {
    plq_free(*(void *)(a1 + 120));
    free(*(void **)(a1 + 16));
    free(*(void **)(a1 + 24));
    free(*(void **)(a1 + 32));
    free(*(void **)(a1 + 40));
    free(*(void **)(a1 + 56));
    free(*(void **)(a1 + 48));
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    free((void *)a1);
  }
}

uint64_t plq_inside_circle_helper(uint64_t a1, float *a2, float *a3, uint64_t a4, int a5)
{
  if (*(uint64_t *)a4 >= 0x80000000) {
    __assert_rtn("plq_inside_circle_helper", "plq.c", 302, "da_size(ids) <= INT32_MAX");
  }
  uint64_t v165 = *(void *)a4;
  float v9 = *a2;
  float v10 = (float)(*a2 - *(float *)a1) / *(float *)(a1 + 112);
  if (v10 < 0.0) {
    float v10 = 0.0;
  }
  if (v10 > 1.0) {
    float v10 = 1.0;
  }
  int v11 = *(_DWORD *)(a1 + 100);
  int v12 = (int)(float)(v10 * (float)v11);
  float v13 = (float)(a2[1] - *(float *)(a1 + 4)) / (float)(*(float *)(a1 + 12) - *(float *)(a1 + 4));
  BOOL v14 = v13 < 0.0 || v13 > 1.0;
  if (v13 > 1.0 && v13 >= 0.0) {
    float v15 = 1.0;
  }
  else {
    float v15 = 0.0;
  }
  if (v14) {
    float v13 = v15;
  }
  int v166 = v11 * (int)(float)(v13 * (float)*(int *)(a1 + 96));
  int v163 = (v166 + v12) / v11 * v11;
  int v164 = (v166 + v12) % v11;
  float v16 = *(float *)(*(void *)(a1 + 64) + 4 * v164);
  int v167 = v12;
  int v168 = v163 + v11;
  if (v166 + v12 != v163 + v11)
  {
    float v93 = v16 - v9;
    uint64_t v94 = v166 + (uint64_t)v12;
    do
    {
      if (v93 >= 0.0 && (float)(v93 * v93) > *a3) {
        break;
      }
      add_cell_points_circle((void *)a1, v94, a2, a3, a4, a5);
      int v95 = *(_DWORD *)(a1 + 100);
      LODWORD(v96) = (int)v94 % v95;
      uint64_t v97 = 4 * ((int)v94 % v95);
      uint64_t v99 = *(void *)(a1 + 64);
      uint64_t v98 = *(void *)(a1 + 72);
      float v100 = *(float *)(v98 + v97);
      float v101 = *a2;
      float v102 = v100 - *a2;
      float v103 = *(float *)(v99 + v97);
      float v104 = v103 - *a2;
      float v105 = vabds_f32(v100, *a2);
      float v106 = vabds_f32(v103, *a2);
      float v107 = v105 >= v106 ? v106 : v105;
      BOOL v108 = v104 >= 0.0 || v102 <= 0.0;
      float v109 = v108 ? v107 : 0.0;
      uint64_t v170 = v94;
      int v110 = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v94);
      if (v110 == -1)
      {
        uint64_t v113 = v94;
      }
      else
      {
        float v111 = *a3;
        float v112 = *(float *)(a1 + 4) + (float)((float)(v110 / v95) * *(float *)(a1 + 108));
        if ((float)((float)(a2[1] - v112) * (float)(a2[1] - v112)) <= (float)(*a3 + (float)((float)-v109 * v109)))
        {
          do
          {
            double v114 = (int *)(*(void *)(a1 + 40) + 4 * v110);
            int v115 = *v114;
            int v116 = v114[1];
            if (v116 > v115)
            {
              if (a5)
              {
                int v117 = v116 - v115;
                uint64_t v118 = 4 * v115;
                uint64_t v119 = 8 * v115;
                do
                {
                  float v121 = (float)((float)(*(float *)(*(void *)(a1 + 16) + v119 + 4) - a2[1])
                               * (float)(*(float *)(*(void *)(a1 + 16) + v119 + 4) - a2[1]))
                       + (float)((float)(*(float *)(*(void *)(a1 + 16) + v119) - *a2)
                               * (float)(*(float *)(*(void *)(a1 + 16) + v119) - *a2));
                  if (v121 <= v111)
                  {
                    uint64_t v122 = *(void *)a4;
                    uint64_t v123 = *(void *)(a4 + 16);
                    if (*(void *)a4 >= v123)
                    {
                      if (v123) {
                        uint64_t v124 = 2 * v123;
                      }
                      else {
                        uint64_t v124 = 64;
                      }
                      if (v124 <= v122) {
                        uint64_t v125 = v122 + 1;
                      }
                      else {
                        uint64_t v125 = v124;
                      }
                      if (v125)
                      {
                        *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v125, 0xE9E18EBAuLL);
                        uint64_t v122 = *(void *)a4;
                      }
                      *(void *)(a4 + 16) = v125;
                    }
                    int v120 = *(_DWORD *)(*(void *)(a1 + 24) + v118);
                    *(void *)a4 = v122 + 1;
                    *(_DWORD *)(*(void *)(a4 + 8) + 4 * v122) = v120;
                    *a3 = v121;
                    float v111 = v121;
                  }
                  v118 += 4;
                  v119 += 8;
                  --v117;
                }
                while (v117);
              }
              else
              {
                int v126 = v116 - v115;
                uint64_t v127 = 4 * v115;
                uint64_t v128 = 8 * v115;
                do
                {
                  if ((float)((float)((float)(*(float *)(*(void *)(a1 + 16) + v128 + 4) - a2[1])
                                     * (float)(*(float *)(*(void *)(a1 + 16) + v128 + 4) - a2[1]))
                             + (float)((float)(*(float *)(*(void *)(a1 + 16) + v128) - *a2)
                                     * (float)(*(float *)(*(void *)(a1 + 16) + v128) - *a2))) <= *a3)
                  {
                    uint64_t v129 = *(void *)a4;
                    uint64_t v130 = *(void *)(a4 + 16);
                    if (*(void *)a4 >= v130)
                    {
                      if (v130) {
                        uint64_t v131 = 2 * v130;
                      }
                      else {
                        uint64_t v131 = 64;
                      }
                      if (v131 <= v129) {
                        uint64_t v132 = v129 + 1;
                      }
                      else {
                        uint64_t v132 = v131;
                      }
                      if (v132)
                      {
                        *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v132, 0xE9E18EBAuLL);
                        uint64_t v129 = *(void *)a4;
                      }
                      *(void *)(a4 + 16) = v132;
                    }
                    *(void *)a4 = v129 + 1;
                    *(_DWORD *)(*(void *)(a4 + 8) + 4 * v129) = *(_DWORD *)(*(void *)(a1 + 24) + v127);
                  }
                  v127 += 4;
                  v128 += 8;
                  --v126;
                }
                while (v126);
                float v111 = *a3;
              }
            }
            int v110 = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v110);
            int v95 = *(_DWORD *)(a1 + 100);
          }
          while (v110 != -1
               && (float)((float)(a2[1]
                                - (float)(*(float *)(a1 + 4) + (float)((float)(v110 / v95) * *(float *)(a1 + 108))))
                        * (float)(a2[1]
                                - (float)(*(float *)(a1 + 4) + (float)((float)(v110 / v95) * *(float *)(a1 + 108))))) <= (float)(v111 + (float)((float)-v109 * v109)));
          float v101 = *a2;
          uint64_t v99 = *(void *)(a1 + 64);
          uint64_t v98 = *(void *)(a1 + 72);
          uint64_t v113 = v170;
          uint64_t v96 = (int)v170 % v95;
        }
        else
        {
          uint64_t v96 = (int)v96;
          uint64_t v113 = v94;
        }
        uint64_t v133 = 4 * v96;
        float v134 = *(float *)(v98 + v133);
        float v135 = *(float *)(v99 + v133);
        float v102 = v134 - v101;
        float v104 = v135 - v101;
        float v105 = vabds_f32(v134, v101);
        float v106 = vabds_f32(v135, v101);
      }
      if (v105 >= v106) {
        float v136 = v106;
      }
      else {
        float v136 = v105;
      }
      if (v104 >= 0.0 || v102 <= 0.0) {
        float v138 = v136;
      }
      else {
        float v138 = 0.0;
      }
      int v139 = *(_DWORD *)(*(void *)(a1 + 56) + 4 * v113);
      if (v139 != -1)
      {
        float v140 = *a3;
        float v141 = *a3 + (float)((float)-v138 * v138);
        int v142 = v139 / v95;
        do
        {
          float v143 = *(float *)(a1 + 4) + (float)((float)(v142 + 1) * *(float *)(a1 + 108));
          if ((float)((float)(a2[1] - v143) * (float)(a2[1] - v143)) > v141) {
            break;
          }
          unint64_t v144 = (int *)(*(void *)(a1 + 40) + 4 * v139);
          int v145 = *v144;
          int v146 = v144[1];
          if (v146 > v145)
          {
            if (a5)
            {
              int v147 = v146 - v145;
              uint64_t v148 = 4 * v145;
              uint64_t v149 = 8 * v145;
              do
              {
                float v151 = (float)((float)(*(float *)(*(void *)(a1 + 16) + v149 + 4) - a2[1])
                             * (float)(*(float *)(*(void *)(a1 + 16) + v149 + 4) - a2[1]))
                     + (float)((float)(*(float *)(*(void *)(a1 + 16) + v149) - *a2)
                             * (float)(*(float *)(*(void *)(a1 + 16) + v149) - *a2));
                if (v151 <= v140)
                {
                  uint64_t v152 = *(void *)a4;
                  uint64_t v153 = *(void *)(a4 + 16);
                  if (*(void *)a4 >= v153)
                  {
                    if (v153) {
                      uint64_t v154 = 2 * v153;
                    }
                    else {
                      uint64_t v154 = 64;
                    }
                    if (v154 <= v152) {
                      uint64_t v155 = v152 + 1;
                    }
                    else {
                      uint64_t v155 = v154;
                    }
                    if (v155)
                    {
                      *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v155, 0xE9E18EBAuLL);
                      uint64_t v152 = *(void *)a4;
                    }
                    *(void *)(a4 + 16) = v155;
                  }
                  int v150 = *(_DWORD *)(*(void *)(a1 + 24) + v148);
                  *(void *)a4 = v152 + 1;
                  *(_DWORD *)(*(void *)(a4 + 8) + 4 * v152) = v150;
                  *a3 = v151;
                  float v140 = v151;
                }
                v148 += 4;
                v149 += 8;
                --v147;
              }
              while (v147);
            }
            else
            {
              int v156 = v146 - v145;
              uint64_t v157 = 4 * v145;
              uint64_t v158 = 8 * v145;
              do
              {
                if ((float)((float)((float)(*(float *)(*(void *)(a1 + 16) + v158 + 4) - a2[1])
                                   * (float)(*(float *)(*(void *)(a1 + 16) + v158 + 4) - a2[1]))
                           + (float)((float)(*(float *)(*(void *)(a1 + 16) + v158) - *a2)
                                   * (float)(*(float *)(*(void *)(a1 + 16) + v158) - *a2))) <= *a3)
                {
                  uint64_t v159 = *(void *)a4;
                  uint64_t v160 = *(void *)(a4 + 16);
                  if (*(void *)a4 >= v160)
                  {
                    if (v160) {
                      uint64_t v161 = 2 * v160;
                    }
                    else {
                      uint64_t v161 = 64;
                    }
                    if (v161 <= v159) {
                      uint64_t v162 = v159 + 1;
                    }
                    else {
                      uint64_t v162 = v161;
                    }
                    if (v162)
                    {
                      *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v162, 0xE9E18EBAuLL);
                      uint64_t v159 = *(void *)a4;
                    }
                    *(void *)(a4 + 16) = v162;
                  }
                  *(void *)a4 = v159 + 1;
                  *(_DWORD *)(*(void *)(a4 + 8) + 4 * v159) = *(_DWORD *)(*(void *)(a1 + 24) + v157);
                }
                v157 += 4;
                v158 += 8;
                --v156;
              }
              while (v156);
              float v140 = *a3;
            }
          }
          float v141 = v140 + (float)((float)-v138 * v138);
          int v139 = *(_DWORD *)(*(void *)(a1 + 56) + 4 * v139);
          int v142 = v139 / *(_DWORD *)(a1 + 100);
        }
        while (v139 != -1);
      }
      uint64_t v94 = v170 + 1;
      float v93 = v93 + *(float *)(a1 + 104);
    }
    while (v168 != v170 + 1);
  }
  if (v164 >= 1)
  {
    float v17 = v9 - v16;
    uint64_t v18 = v166 + (uint64_t)v167;
    do
    {
      if ((float)(v17 * v17) > *a3) {
        break;
      }
      uint64_t v19 = v18 - 1;
      add_cell_points_circle((void *)a1, v19, a2, a3, a4, a5);
      int v20 = *(_DWORD *)(a1 + 100);
      LODWORD(v21) = (int)v19 % v20;
      uint64_t v22 = 4 * ((int)v19 % v20);
      uint64_t v24 = *(void *)(a1 + 64);
      uint64_t v23 = *(void *)(a1 + 72);
      float v25 = *(float *)(v23 + v22);
      float v26 = *a2;
      float v27 = v25 - *a2;
      float v28 = *(float *)(v24 + v22);
      float v29 = v28 - *a2;
      float v30 = vabds_f32(v25, *a2);
      float v31 = vabds_f32(v28, *a2);
      float v32 = v30 >= v31 ? v31 : v30;
      BOOL v33 = v29 >= 0.0 || v27 <= 0.0;
      float v34 = v33 ? v32 : 0.0;
      uint64_t v169 = v19;
      int v35 = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v19);
      if (v35 == -1)
      {
        uint64_t v38 = v19;
      }
      else
      {
        float v36 = *a3;
        float v37 = *(float *)(a1 + 4) + (float)((float)(v35 / v20) * *(float *)(a1 + 108));
        if ((float)((float)(a2[1] - v37) * (float)(a2[1] - v37)) <= (float)(*a3 + (float)((float)-v34 * v34)))
        {
          do
          {
            float v39 = (int *)(*(void *)(a1 + 40) + 4 * v35);
            int v40 = *v39;
            int v41 = v39[1];
            if (v41 > v40)
            {
              if (a5)
              {
                int v42 = v41 - v40;
                uint64_t v43 = 4 * v40;
                uint64_t v44 = 8 * v40;
                do
                {
                  float v46 = (float)((float)(*(float *)(*(void *)(a1 + 16) + v44 + 4) - a2[1])
                              * (float)(*(float *)(*(void *)(a1 + 16) + v44 + 4) - a2[1]))
                      + (float)((float)(*(float *)(*(void *)(a1 + 16) + v44) - *a2)
                              * (float)(*(float *)(*(void *)(a1 + 16) + v44) - *a2));
                  if (v46 <= v36)
                  {
                    uint64_t v47 = *(void *)a4;
                    uint64_t v48 = *(void *)(a4 + 16);
                    if (*(void *)a4 >= v48)
                    {
                      if (v48) {
                        uint64_t v49 = 2 * v48;
                      }
                      else {
                        uint64_t v49 = 64;
                      }
                      if (v49 <= v47) {
                        uint64_t v50 = v47 + 1;
                      }
                      else {
                        uint64_t v50 = v49;
                      }
                      if (v50)
                      {
                        *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v50, 0xE9E18EBAuLL);
                        uint64_t v47 = *(void *)a4;
                      }
                      *(void *)(a4 + 16) = v50;
                    }
                    int v45 = *(_DWORD *)(*(void *)(a1 + 24) + v43);
                    *(void *)a4 = v47 + 1;
                    *(_DWORD *)(*(void *)(a4 + 8) + 4 * v47) = v45;
                    *a3 = v46;
                    float v36 = v46;
                  }
                  v43 += 4;
                  v44 += 8;
                  --v42;
                }
                while (v42);
              }
              else
              {
                int v51 = v41 - v40;
                uint64_t v52 = 4 * v40;
                uint64_t v53 = 8 * v40;
                do
                {
                  if ((float)((float)((float)(*(float *)(*(void *)(a1 + 16) + v53 + 4) - a2[1])
                                     * (float)(*(float *)(*(void *)(a1 + 16) + v53 + 4) - a2[1]))
                             + (float)((float)(*(float *)(*(void *)(a1 + 16) + v53) - *a2)
                                     * (float)(*(float *)(*(void *)(a1 + 16) + v53) - *a2))) <= *a3)
                  {
                    uint64_t v54 = *(void *)a4;
                    uint64_t v55 = *(void *)(a4 + 16);
                    if (*(void *)a4 >= v55)
                    {
                      if (v55) {
                        uint64_t v56 = 2 * v55;
                      }
                      else {
                        uint64_t v56 = 64;
                      }
                      if (v56 <= v54) {
                        uint64_t v57 = v54 + 1;
                      }
                      else {
                        uint64_t v57 = v56;
                      }
                      if (v57)
                      {
                        *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v57, 0xE9E18EBAuLL);
                        uint64_t v54 = *(void *)a4;
                      }
                      *(void *)(a4 + 16) = v57;
                    }
                    *(void *)a4 = v54 + 1;
                    *(_DWORD *)(*(void *)(a4 + 8) + 4 * v54) = *(_DWORD *)(*(void *)(a1 + 24) + v52);
                  }
                  v52 += 4;
                  v53 += 8;
                  --v51;
                }
                while (v51);
                float v36 = *a3;
              }
            }
            int v35 = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v35);
            int v20 = *(_DWORD *)(a1 + 100);
          }
          while (v35 != -1
               && (float)((float)(a2[1]
                                - (float)(*(float *)(a1 + 4) + (float)((float)(v35 / v20) * *(float *)(a1 + 108))))
                        * (float)(a2[1]
                                - (float)(*(float *)(a1 + 4) + (float)((float)(v35 / v20) * *(float *)(a1 + 108))))) <= (float)(v36 + (float)((float)-v34 * v34)));
          float v26 = *a2;
          uint64_t v24 = *(void *)(a1 + 64);
          uint64_t v23 = *(void *)(a1 + 72);
          uint64_t v38 = v169;
          uint64_t v21 = (int)v169 % v20;
        }
        else
        {
          uint64_t v21 = (int)v21;
          uint64_t v38 = v19;
        }
        uint64_t v58 = 4 * v21;
        float v59 = *(float *)(v23 + v58);
        float v60 = *(float *)(v24 + v58);
        float v27 = v59 - v26;
        float v29 = v60 - v26;
        float v30 = vabds_f32(v59, v26);
        float v31 = vabds_f32(v60, v26);
      }
      if (v30 >= v31) {
        float v61 = v31;
      }
      else {
        float v61 = v30;
      }
      if (v29 >= 0.0 || v27 <= 0.0) {
        float v63 = v61;
      }
      else {
        float v63 = 0.0;
      }
      int v64 = *(_DWORD *)(*(void *)(a1 + 56) + 4 * v38);
      if (v64 != -1)
      {
        float v65 = *a3;
        float v66 = *a3 + (float)((float)-v63 * v63);
        int v67 = v64 / v20;
        do
        {
          float v68 = *(float *)(a1 + 4) + (float)((float)(v67 + 1) * *(float *)(a1 + 108));
          if ((float)((float)(a2[1] - v68) * (float)(a2[1] - v68)) > v66) {
            break;
          }
          int v69 = (int *)(*(void *)(a1 + 40) + 4 * v64);
          int v70 = *v69;
          int v71 = v69[1];
          if (v71 > v70)
          {
            uint64_t v72 = 4 * v70;
            uint64_t v73 = 8 * v70;
            if (a5)
            {
              int v74 = v71 - v70;
              do
              {
                float v76 = (float)((float)(*(float *)(*(void *)(a1 + 16) + v73 + 4) - a2[1])
                            * (float)(*(float *)(*(void *)(a1 + 16) + v73 + 4) - a2[1]))
                    + (float)((float)(*(float *)(*(void *)(a1 + 16) + v73) - *a2)
                            * (float)(*(float *)(*(void *)(a1 + 16) + v73) - *a2));
                if (v76 <= v65)
                {
                  uint64_t v77 = *(void *)a4;
                  uint64_t v78 = *(void *)(a4 + 16);
                  if (*(void *)a4 >= v78)
                  {
                    if (v78) {
                      uint64_t v79 = 2 * v78;
                    }
                    else {
                      uint64_t v79 = 64;
                    }
                    if (v79 <= v77) {
                      uint64_t v80 = v77 + 1;
                    }
                    else {
                      uint64_t v80 = v79;
                    }
                    if (v80)
                    {
                      *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v80, 0xE9E18EBAuLL);
                      uint64_t v77 = *(void *)a4;
                    }
                    *(void *)(a4 + 16) = v80;
                  }
                  int v75 = *(_DWORD *)(*(void *)(a1 + 24) + v72);
                  *(void *)a4 = v77 + 1;
                  *(_DWORD *)(*(void *)(a4 + 8) + 4 * v77) = v75;
                  *a3 = v76;
                  float v65 = v76;
                }
                v72 += 4;
                v73 += 8;
                --v74;
              }
              while (v74);
            }
            else
            {
              int v81 = v71 - v70;
              do
              {
                if ((float)((float)((float)(*(float *)(*(void *)(a1 + 16) + v73 + 4) - a2[1])
                                   * (float)(*(float *)(*(void *)(a1 + 16) + v73 + 4) - a2[1]))
                           + (float)((float)(*(float *)(*(void *)(a1 + 16) + v73) - *a2)
                                   * (float)(*(float *)(*(void *)(a1 + 16) + v73) - *a2))) <= *a3)
                {
                  uint64_t v82 = *(void *)a4;
                  uint64_t v83 = *(void *)(a4 + 16);
                  if (*(void *)a4 >= v83)
                  {
                    if (v83) {
                      uint64_t v84 = 2 * v83;
                    }
                    else {
                      uint64_t v84 = 64;
                    }
                    if (v84 <= v82) {
                      uint64_t v85 = v82 + 1;
                    }
                    else {
                      uint64_t v85 = v84;
                    }
                    if (v85)
                    {
                      *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v85, 0xE9E18EBAuLL);
                      uint64_t v82 = *(void *)a4;
                    }
                    *(void *)(a4 + 16) = v85;
                  }
                  *(void *)a4 = v82 + 1;
                  *(_DWORD *)(*(void *)(a4 + 8) + 4 * v82) = *(_DWORD *)(*(void *)(a1 + 24) + v72);
                }
                v72 += 4;
                v73 += 8;
                --v81;
              }
              while (v81);
              float v65 = *a3;
            }
          }
          float v66 = v65 + (float)((float)-v63 * v63);
          int v64 = *(_DWORD *)(*(void *)(a1 + 56) + 4 * v64);
          int v67 = v64 / *(_DWORD *)(a1 + 100);
        }
        while (v64 != -1);
      }
      float v17 = v17 + *(float *)(a1 + 104);
      uint64_t v18 = v169;
    }
    while (v169 > v163);
  }
  uint64_t v86 = *(void *)a4;
  if (a5 && v86 > (int)v165)
  {
    float v87 = *(_DWORD **)(a4 + 8);
    uint64_t v88 = *(void *)(a4 + 16);
    v87[(int)v165] = v87[v86 - 1];
    uint64_t v89 = ((v165 << 32) + 0x100000000) >> 32;
    if (v89 > v88)
    {
      uint64_t v90 = 2 * v88;
      if (!v88) {
        uint64_t v90 = 64;
      }
      if (v90 <= v89) {
        uint64_t v91 = ((v165 << 32) + 0x100000000) >> 32;
      }
      else {
        uint64_t v91 = v90;
      }
      if (v91)
      {
        float v87 = malloc_type_realloc(v87, 4 * v91, 0x6E177FACuLL);
        *(void *)(a4 + 8) = v87;
      }
      *(void *)(a4 + 16) = v91;
    }
    if (v89 > v86) {
      bzero(&v87[*(void *)a4], 4 * (v89 - v86));
    }
    *(void *)a4 = v89;
    return 1;
  }
  else
  {
    if (v86 >= 0x80000000) {
      __assert_rtn("plq_inside_circle_helper", "plq.c", 336, "da_size(ids) <= INT32_MAX");
    }
    return (v86 - v165);
  }
}

uint64_t plq_inside_line(uint64_t result, float *a2, float *a3, uint64_t a4, float a5, double a6, double a7, double a8, double a9)
{
  if (result)
  {
    uint64_t v14 = result;
    float v16 = *a2;
    float v15 = a2[1];
    float v17 = *a3;
    float v18 = a3[1];
    float v19 = vabds_f32(*a2, *a3);
    float v20 = vabds_f32(v15, v18);
    if (v19 >= v20) {
      float v21 = v20;
    }
    else {
      float v21 = v19;
    }
    if (v21 >= 0.001)
    {
      if (v19 < v20)
      {
        uint64_t v64 = *(void *)(result + 120);
        if (v64) {
          float v65 = *a2;
        }
        else {
          float v65 = a2[1];
        }
        if (v64)
        {
          float v16 = a2[1];
          float v66 = *a3;
        }
        else
        {
          float v66 = a3[1];
        }
        if (v64)
        {
          float v17 = a3[1];
          uint64_t v14 = *(void *)(result + 120);
        }
        float v15 = v65;
        float v18 = v66;
      }
      uint64_t v67 = *(void *)a4;
      if (*(uint64_t *)a4 >= 0x80000000) {
        __assert_rtn("plq_inside_line", "plq.c", 523, "da_size(ids) <= INT32_MAX");
      }
      if (v16 <= v17 && (v16 == v17 ? (BOOL v68 = v15 <= v18) : (BOOL v68 = 1), v68))
      {
        float v69 = v15;
        *(float *)&a9 = v16;
        float v15 = v18;
        float v16 = v17;
      }
      else
      {
        float v69 = v18;
        *(float *)&a9 = v17;
      }
      float v70 = v16 - *(float *)&a9;
      float v71 = v15 - v69;
      float v72 = sqrtf((float)(v71 * v71) + (float)(v70 * v70));
      float v73 = 0.0;
      float v74 = 0.0;
      if (v72 > 0.0)
      {
        float v73 = v70 / v72;
        float v74 = v71 / v72;
      }
      float v75 = fabsf(v73 * a5) + fabsf(v74 * (float)((float)-(float)(v74 * a5) / v73));
      if (v75 < -0.000001)
      {
        log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/containers/plq.c", 540, (uint64_t)"plq_inside_line", "y_diff_for_line should not be negative, vec = %f, %f", v73, v74);
        __assert_rtn("plq_inside_line", "plq.c", 540, "0");
      }
      int v76 = *(_DWORD *)(v14 + 100);
      v9.i32[0] = *(_DWORD *)v14;
      float v77 = vabds_f32(*(float *)&a9, *(float *)v14);
      float v78 = *(float *)(v14 + 8);
      float v79 = vabds_f32(v16, v78);
      if (v77 <= v79) {
        float v77 = v79;
      }
      if (v77 >= 0.000001)
      {
        *(float *)v11.i32 = v15 + v75;
        *(float *)v12.i32 = v69 + v75;
        LODWORD(v83) = *(_DWORD *)(v14 + 4);
        float v82 = (float)v76;
        v10.i32[0] = *(_DWORD *)(v14 + 112);
        *(float *)&v11.i32[1] = (float)(v15 + v75) + (float)(v75 * -2.0);
        v84.f32[0] = v69 + v75;
        v84.f32[1] = (float)(v69 + v75) + (float)(v75 * -2.0);
        *(float32x2_t *)v11.i8 = vsub_f32(*(float32x2_t *)v11.i8, v84);
        HIDWORD(v83) = *(_DWORD *)(v14 + 12);
        *(float *)&v12.i32[1] = v84.f32[1];
        float32x4_t v85 = vdivq_f32(vsubq_f32(vmlaq_n_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a9, 0), vdivq_f32(vsubq_f32((float32x4_t)vdupq_lane_s64(v83, 0), (float32x4_t)vzip1q_s32(v12, v12)), (float32x4_t)vzip1q_s32(v11, v11)), v70), (float32x4_t)vdupq_lane_s32(v9, 0)), (float32x4_t)vdupq_lane_s32(v10, 0));
        int8x16_t v86 = (int8x16_t)vcltzq_f32(v85);
        float32x4_t v87 = (float32x4_t)vdupq_n_s32(0x3F7FFFEFu);
        int8x16_t v88 = (int8x16_t)vcgtq_f32(v85, v87);
        int32x4_t v89 = vcvtq_s32_f32(vmulq_n_f32((float32x4_t)vbslq_s8(vorrq_s8(v88, v86), vandq_s8((int8x16_t)v87, vbicq_s8(v88, v86)), (int8x16_t)v85), (float)v76));
        int v80 = vminvq_s32(v89);
        if (v80 >= v76) {
          int v80 = *(_DWORD *)(v14 + 100);
        }
        int v90 = vmaxvq_s32(v89);
        if (v90 < 0) {
          int v81 = -1;
        }
        else {
          int v81 = v90;
        }
      }
      else
      {
        int v80 = 0;
        int v81 = v76 - 1;
        v10.i32[0] = *(_DWORD *)(v14 + 112);
        float v82 = (float)v76;
      }
      float v91 = *(float *)&a9 - a5;
      float v92 = (float)((float)(*(float *)&a9 - a5) - *(float *)v9.i32) / *(float *)v10.i32;
      BOOL v93 = v92 < 0.0 || v92 > 1.0;
      if (v92 > 1.0 && v92 >= 0.0) {
        float v94 = 1.0;
      }
      else {
        float v94 = 0.0;
      }
      if (v93) {
        float v92 = v94;
      }
      float v95 = v16 + a5;
      float v96 = (float)((float)(v16 + a5) - *(float *)v9.i32) / *(float *)v10.i32;
      BOOL v97 = v96 < 0.0 || v96 > 1.0;
      if (v96 > 1.0 && v96 >= 0.0) {
        float v98 = 1.0;
      }
      else {
        float v98 = 0.0;
      }
      if (v97) {
        float v96 = v98;
      }
      if (v80 <= (int)(float)(v82 * v92)) {
        int v99 = (int)(float)(v82 * v92);
      }
      else {
        int v99 = v80;
      }
      if (v81 >= (int)(float)(v82 * v96)) {
        int v100 = (int)(float)(v82 * v96);
      }
      else {
        int v100 = v81;
      }
      uint64_t v101 = *(void *)a4;
      if (v99 <= v100)
      {
        float v102 = v69 + (float)(v74 * (float)((float)(*(float *)v9.i32 - *(float *)&a9) / v73));
        uint64_t v103 = v99;
        int v144 = v100 + 1;
        float v104 = (float)(v15 + (float)(v74 * (float)((float)(v78 - v16) / v73))) - v102;
        uint64_t v142 = *(void *)a4;
        uint64_t v101 = *(void *)a4;
        do
        {
          uint64_t v105 = *(void *)(v14 + 80);
          uint64_t v106 = *(void *)(v14 + 88);
          float v107 = v102 + (float)(v104 * *(float *)(v105 + 4 * v103));
          float v108 = v102 + (float)(v104 * *(float *)(v106 + 4 * v103));
          if (v107 >= v108) {
            float v109 = v102 + (float)(v104 * *(float *)(v106 + 4 * v103));
          }
          else {
            float v109 = v102 + (float)(v104 * *(float *)(v105 + 4 * v103));
          }
          float v110 = (float)(v109 - v75) + -0.000001;
          if (v107 <= v108) {
            float v107 = v102 + (float)(v104 * *(float *)(v106 + 4 * v103));
          }
          float v111 = (float)(v75 + v107) + 0.000001;
          int v112 = *(_DWORD *)(v14 + 100);
          float v113 = *(float *)(v14 + 4);
          float v114 = *(float *)(v14 + 12) - v113;
          float v115 = (float)(v110 - v113) / v114;
          BOOL v116 = v115 < 0.0 || v115 > 1.0;
          if (v115 > 1.0 && v115 >= 0.0) {
            float v117 = 1.0;
          }
          else {
            float v117 = 0.0;
          }
          if (v116) {
            float v115 = v117;
          }
          float v118 = (float)*(int *)(v14 + 96);
          int v119 = v112 * (int)(float)(v115 * v118);
          uint64_t v146 = v103;
          int v148 = v99;
          int v120 = v119 + v103;
          float v121 = (float)(v111 - v113) / v114;
          BOOL v122 = v121 < 0.0 || v121 > 1.0;
          if (v121 > 1.0 && v121 >= 0.0) {
            float v123 = 1.0;
          }
          else {
            float v123 = 0.0;
          }
          if (v122) {
            float v121 = v123;
          }
          int v124 = v112 * (int)(float)(v121 * v118);
          if (v120 != -1 && v119 <= v124)
          {
            int v126 = v124 + v99;
            do
            {
              uint64_t v128 = (int *)(*(void *)(v14 + 40) + 4 * v120);
              int v129 = *v128;
              int v130 = v128[1] - *v128;
              if (v130 >= 1)
              {
                uint64_t v131 = (float *)(*(void *)(v14 + 32) + 4 * v129);
                uint64_t v132 = *(void *)(v14 + 16) + 8 * v129;
                uint64_t v133 = (int *)(*(void *)(v14 + 24) + 4 * v129);
                uint64_t v134 = *(void *)(a4 + 16);
                do
                {
                  if (v101 >= v134)
                  {
                    uint64_t v140 = 2 * v134;
                    if (!v134) {
                      uint64_t v140 = 64;
                    }
                    if (v140 <= v101) {
                      uint64_t v134 = v101 + 1;
                    }
                    else {
                      uint64_t v134 = v140;
                    }
                    if (v134)
                    {
                      *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v134, 0xE793A602uLL);
                      uint64_t v101 = *(void *)a4;
                    }
                    *(void *)(a4 + 16) = v134;
                  }
                  float v135 = *(float *)v132;
                  float v136 = *(float *)(v132 + 4);
                  v132 += 8;
                  LODWORD(v137) = v135 < v91;
                  if (v135 > v95) {
                    LODWORD(v137) = 1;
                  }
                  float v138 = *v131++;
                  if (vabds_f32(v102 + (float)(v104 * v138), v136) > v75) {
                    uint64_t v137 = 1;
                  }
                  else {
                    uint64_t v137 = v137;
                  }
                  int v139 = *v133++;
                  *(_DWORD *)(*(void *)(a4 + 8) + 4 * v101) = v139;
                  uint64_t v101 = v101 - v137 + 1;
                  *(void *)a4 = v101;
                  --v130;
                }
                while (v130);
              }
              int v120 = *(_DWORD *)(*(void *)(v14 + 48) + 4 * v120);
            }
            while (v120 != -1 && v120 <= v126);
          }
          uint64_t v103 = v146 + 1;
          int v99 = v148 + 1;
        }
        while (v144 != v146 + 1);
        if (v101 > 0x7FFFFFFF) {
          __assert_rtn("plq_inside_line", "plq.c", 577, "da_size(ids) <= INT32_MAX");
        }
        LODWORD(v67) = v142;
      }
      return (v101 - v67);
    }
    else
    {
      if (v16 >= v17) {
        float v22 = *a3;
      }
      else {
        float v22 = *a2;
      }
      float v23 = v22 - a5;
      if (v16 <= v17) {
        float v16 = *a3;
      }
      float v24 = v16 + a5;
      if (v15 >= v18) {
        float v25 = a3[1];
      }
      else {
        float v25 = a2[1];
      }
      float v26 = v25 - a5;
      if (v15 <= v18) {
        float v15 = a3[1];
      }
      float v27 = v15 + a5;
      float v28 = *(float *)(result + 4);
      float v29 = *(float *)(result + 112);
      float v30 = (float)(v23 - *(float *)result) / v29;
      float v31 = 0.0;
      if (v30 < 0.0) {
        float v30 = 0.0;
      }
      if (v30 > 1.0) {
        float v30 = 1.0;
      }
      float v32 = (float)(v24 - *(float *)result) / v29;
      if (v32 < 0.0) {
        float v32 = 0.0;
      }
      if (v32 <= 1.0) {
        float v33 = v32;
      }
      else {
        float v33 = 1.0;
      }
      float v34 = *(float *)(result + 12) - v28;
      float v35 = (float)(v26 - v28) / v34;
      if (v35 < 0.0) {
        float v35 = 0.0;
      }
      if (v35 > 1.0) {
        float v35 = 1.0;
      }
      float v36 = (float)(v27 - v28) / v34;
      BOOL v37 = v36 < 0.0 || v36 > 1.0;
      if (v36 > 1.0 && v36 >= 0.0) {
        float v31 = 1.0;
      }
      if (v37) {
        float v36 = v31;
      }
      uint64_t v38 = *(void *)a4;
      if (*(uint64_t *)a4 > 0x7FFFFFFF) {
        __assert_rtn("plq_inside_rectangle", "plq.c", 463, "da_size(ids) <= INT32_MAX");
      }
      float v39 = (float)*(int *)(result + 100);
      int v40 = (int)(float)(v30 * v39);
      uint64_t v41 = *(void *)a4;
      int v147 = (int)(float)(v33 * v39);
      if (v40 <= v147)
      {
        float v42 = (float)*(int *)(result + 96);
        int v143 = (int)(float)(v36 * v42);
        int v145 = (int)(float)(v35 * v42);
        uint64_t v141 = *(void *)a4;
        uint64_t v41 = *(void *)a4;
        do
        {
          int v43 = *(_DWORD *)(v14 + 100);
          int v44 = v43 * v145;
          int v45 = v43 * v145 + v40;
          int v46 = v43 * v143;
          BOOL v47 = v44 > v46 || v45 == -1;
          if (!v47)
          {
            int v48 = v46 + v40;
            do
            {
              uint64_t v50 = (int *)(*(void *)(v14 + 40) + 4 * v45);
              int v51 = *v50;
              int v52 = v50[1];
              if (v52 > v51)
              {
                int v53 = v52 - v51;
                uint64_t v54 = 4 * v51;
                uint64_t v55 = 8 * v51;
                do
                {
                  uint64_t v56 = *(void *)(v14 + 16);
                  float v57 = *(float *)(v56 + v55);
                  if (v57 >= v23 && v57 <= v24)
                  {
                    float v59 = *(float *)(v56 + v55 + 4);
                    if (v59 >= v26 && v59 <= v27)
                    {
                      uint64_t v61 = *(void *)(a4 + 16);
                      if (v41 >= v61)
                      {
                        if (v61) {
                          uint64_t v62 = 2 * v61;
                        }
                        else {
                          uint64_t v62 = 64;
                        }
                        if (v62 <= v41) {
                          uint64_t v63 = v41 + 1;
                        }
                        else {
                          uint64_t v63 = v62;
                        }
                        if (v63)
                        {
                          *(void *)(a4 + 8) = malloc_type_realloc(*(void **)(a4 + 8), 4 * v63, 0x8F0AF0D1uLL);
                          uint64_t v41 = *(void *)a4;
                        }
                        *(void *)(a4 + 16) = v63;
                      }
                      *(_DWORD *)(*(void *)(a4 + 8) + 4 * v41++) = *(_DWORD *)(*(void *)(v14 + 24) + v54);
                      *(void *)a4 = v41;
                    }
                  }
                  v54 += 4;
                  v55 += 8;
                  --v53;
                }
                while (v53);
              }
              int v45 = *(_DWORD *)(*(void *)(v14 + 48) + 4 * v45);
            }
            while (v45 <= v48 && v45 != -1);
          }
          BOOL v47 = v40++ == v147;
        }
        while (!v47);
        LODWORD(v38) = v141;
        if (v41 > 0x7FFFFFFF) {
          __assert_rtn("plq_inside_rectangle", "plq.c", 482, "da_size(ids) <= INT32_MAX");
        }
      }
      return (v41 - v38);
    }
  }
  return result;
}

void *add_cell_points_circle(void *result, int a2, float *a3, float *a4, uint64_t a5, int a6)
{
  int v6 = (int *)(result[5] + 4 * a2);
  int v7 = *v6;
  int v8 = v6[1];
  if (v8 > v7)
  {
    int32x4_t v12 = result;
    if (a6)
    {
      float v13 = *a4;
      int v14 = v8 - v7;
      uint64_t v15 = 4 * v7;
      uint64_t v16 = 8 * v7;
      do
      {
        float v18 = (float)((float)(*(float *)(v12[2] + v16 + 4) - a3[1]) * (float)(*(float *)(v12[2] + v16 + 4) - a3[1]))
            + (float)((float)(*(float *)(v12[2] + v16) - *a3) * (float)(*(float *)(v12[2] + v16) - *a3));
        if (v18 <= v13)
        {
          uint64_t v19 = *(void *)a5;
          uint64_t v20 = *(void *)(a5 + 16);
          if (*(void *)a5 >= v20)
          {
            if (v20) {
              uint64_t v21 = 2 * v20;
            }
            else {
              uint64_t v21 = 64;
            }
            if (v21 <= v19) {
              uint64_t v22 = v19 + 1;
            }
            else {
              uint64_t v22 = v21;
            }
            if (v22)
            {
              double result = malloc_type_realloc(*(void **)(a5 + 8), 4 * v22, 0xE9E18EBAuLL);
              *(void *)(a5 + 8) = result;
              uint64_t v19 = *(void *)a5;
            }
            *(void *)(a5 + 16) = v22;
          }
          int v17 = *(_DWORD *)(v12[3] + v15);
          *(void *)a5 = v19 + 1;
          *(_DWORD *)(*(void *)(a5 + 8) + 4 * v19) = v17;
          *a4 = v18;
          float v13 = v18;
        }
        v15 += 4;
        v16 += 8;
        --v14;
      }
      while (v14);
    }
    else
    {
      int v23 = v8 - v7;
      uint64_t v24 = 4 * v7;
      uint64_t v25 = 8 * v7;
      do
      {
        if ((float)((float)((float)(*(float *)(v12[2] + v25 + 4) - a3[1])
                           * (float)(*(float *)(v12[2] + v25 + 4) - a3[1]))
                   + (float)((float)(*(float *)(v12[2] + v25) - *a3) * (float)(*(float *)(v12[2] + v25) - *a3))) <= *a4)
        {
          uint64_t v26 = *(void *)a5;
          uint64_t v27 = *(void *)(a5 + 16);
          if (*(void *)a5 >= v27)
          {
            if (v27) {
              uint64_t v28 = 2 * v27;
            }
            else {
              uint64_t v28 = 64;
            }
            if (v28 <= v26) {
              uint64_t v29 = v26 + 1;
            }
            else {
              uint64_t v29 = v28;
            }
            if (v29)
            {
              double result = malloc_type_realloc(*(void **)(a5 + 8), 4 * v29, 0xE9E18EBAuLL);
              *(void *)(a5 + 8) = result;
              uint64_t v26 = *(void *)a5;
            }
            *(void *)(a5 + 16) = v29;
          }
          *(void *)a5 = v26 + 1;
          *(_DWORD *)(*(void *)(a5 + 8) + 4 * v26) = *(_DWORD *)(v12[3] + v24);
        }
        v24 += 4;
        v25 += 8;
        --v23;
      }
      while (v23);
    }
  }
  return result;
}

_DWORD *vl_create(uint64_t a1, uint64_t a2, const char *a3, uint64_t (*a4)(void, void, void), uint64_t a5, unsigned char *a6, uint64_t a7)
{
  int v14 = malloc_type_calloc(1uLL, 0x3978uLL, 0x10B004006F153EEuLL);
  if (vl_os_log_once_token != -1) {
    dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
  }
  uint64_t v15 = vl_os_log_log;
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, v14);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v17 = v16;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_21BAD2000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "vl instance", "vl_create", v19, 2u);
    }
  }
  vl_par_default((char *)v19);
  memcpy(v14, v19, 0x3F0uLL);
  v14[252] = -1;
  vl_context_init((uint64_t)(v14 + 534), a6);
  vl_map_init((uint64_t)(v14 + 1194), (uint64_t)(v14 + 30), (uint64_t)(v14 + 38), a1, a2, a3);
  if (a7) {
    __strcpy_chk();
  }
  vl_log_callback = a4;
  vl_log_callback_context = a5;
  return v14;
}

void vl_free(uint64_t a1)
{
  uint64_t v2 = a1 + 12080;
  vl_dump_stop(a1 + 12080);
  free(*(void **)(a1 + 1944));
  free(*(void **)(a1 + 1968));
  free(*(void **)(a1 + 2040));
  free(*(void **)(a1 + 2016));
  free(*(void **)(a1 + 2064));
  free(*(void **)(a1 + 2088));
  free(*(void **)(a1 + 2112));
  uint64_t v3 = *(void *)(a1 + 14424);
  if (v3) {
    slam_tracker_vo_free(v3);
  }
  while (!*(_DWORD *)(a1 + 4824))
    usleep(0x186A0u);
  *(_DWORD *)(a1 + 4824) = 0;
  pthread_join(*(pthread_t *)(a1 + 5504), 0);
  vl_context_free(a1 + 2136);
  vl_map_free(*(void *)(a1 + 1016));
  vl_dump_clear(v2);
  if (vl_os_log_once_token != -1) {
    dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
  }
  uint64_t v4 = vl_os_log_log;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, (const void *)a1);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)int v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_21BAD2000, v4, OS_SIGNPOST_INTERVAL_END, v6, "vl instance", "vl_free", v7, 2u);
    }
  }
  free((void *)a1);
}

uint64_t vl_update(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 4294967293;
  }
  uint64_t v3 = (const float *)(a2 + 32);
  int32x4_t v4 = (int32x4_t)vld1q_dup_f32(v3);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s32((int32x4_t)vl_argo_support_location_type, v4))), 0xFuLL))) & 1) != 0|| (float v5 = *(float *)(a2 + 24), v5 < 0.0)|| *(double *)&vl_gps_max_horz_accuracy < v5)
  {
    printf("%sError : ", "");
    printf("VL update got bad location : type (%d) uncertainty(%f)", *(_DWORD *)(a2 + 32), *(float *)(a2 + 24));
    putchar(10);
    return 4294967292;
  }
  else
  {
    uint64_t v6 = vl_map_update((int *)(a1 + 4776), v5, a1 + 120, (double *)a2, 0);
    vl_dump_update(a1 + 12080, (uint64_t *)a2, v6, *(float *)(a2 + 24));
    if (vl_os_log_once_token != -1) {
      dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
    }
    int32x2_t v9 = vl_os_log_log;
    os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)vl_os_log_log);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        double v12 = *(double *)a2;
        uint64_t v13 = *(void *)(a2 + 8);
        uint64_t v14 = *(void *)(a2 + 16);
        double v15 = *(float *)(a2 + 24);
        *(_DWORD *)buf = 134218752;
        double v17 = v12;
        __int16 v18 = 2048;
        uint64_t v19 = v13;
        __int16 v20 = 2048;
        uint64_t v21 = v14;
        __int16 v22 = 2048;
        double v23 = v15;
        _os_signpost_emit_with_name_impl(&dword_21BAD2000, v9, OS_SIGNPOST_EVENT, v11, "vl_update", "vl_update position %f %f %f uncertainty %f", buf, 0x2Au);
      }
    }
  }
  return v6;
}

uint64_t vl_get_altitudes(uint64_t a1, _DWORD *a2, void *a3, float a4, float a5)
{
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 5360);
    if (v5)
    {
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      vl_height_get_for_latlon((int *)(v5 + 608), (uint64_t)&v23, a4, a5);
      int v8 = v23;
      if (v23)
      {
        *a2 = v23;
        int32x2_t v9 = (char *)malloc_type_malloc(4 * v8, 0x100004052888210uLL);
        *a3 = v9;
        uint64_t v11 = v23;
        os_signpost_id_t v10 = (char *)v24;
        if (v23 >= 1)
        {
          uint64_t v12 = 0;
          if ((unint64_t)v23 < 8) {
            goto LABEL_10;
          }
          if ((unint64_t)(v9 - (char *)v24) < 0x20) {
            goto LABEL_10;
          }
          uint64_t v12 = v23 & 0x7FFFFFFFFFFFFFF8;
          uint64_t v13 = v24 + 1;
          uint64_t v14 = v9 + 16;
          unint64_t v15 = v23 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            long long v16 = *v13;
            *(v14 - 1) = *(v13 - 1);
            *uint64_t v14 = v16;
            v13 += 2;
            v14 += 2;
            v15 -= 8;
          }
          while (v15);
          if (v11 != v12)
          {
LABEL_10:
            uint64_t v17 = v11 - v12;
            uint64_t v18 = 4 * v12;
            uint64_t v19 = &v9[v18];
            __int16 v20 = &v10[v18];
            do
            {
              int v21 = *(_DWORD *)v20;
              v20 += 4;
              *(_DWORD *)uint64_t v19 = v21;
              v19 += 4;
              --v17;
            }
            while (v17);
          }
        }
        free(v10);
        return 0;
      }
      else
      {
        return 1;
      }
    }
    else
    {
      printf("%sError : ", "");
      printf("Map tile not loaded");
      putchar(10);
      return 3;
    }
  }
  else
  {
    printf("%sError : ", "");
    printf("VL not initialized");
    putchar(10);
    return 2;
  }
}

uint64_t vl_locate(uint64_t a1, void *ptr, long long *a3, uint64_t a4)
{
  uint64_t v353 = *MEMORY[0x263EF8340];
  long long v349 = 0u;
  long long v350 = 0u;
  long long v348 = 0u;
  if (vl_os_log_once_token != -1) {
    dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
  }
  long long v346 = 0u;
  long long v347 = 0u;
  long long v344 = 0u;
  long long v345 = 0u;
  long long v342 = 0u;
  long long v343 = 0u;
  int v8 = vl_os_log_log;
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf[0].tv_sec) = 0;
      _os_signpost_emit_with_name_impl(&dword_21BAD2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "vl_locate", (const char *)&unk_21BB79E01, (uint8_t *)buf, 2u);
    }
  }
  printf("Verbose : ");
  printf("------------------------------------------------------------");
  putchar(10);
  printf("Verbose : ");
  printf("Processing image of size:          %d x %d", *((_DWORD *)ptr + 2), *((_DWORD *)ptr + 3));
  putchar(10);
  printf("Verbose : ");
  long double v11 = atan((float)((float)(*((_DWORD *)ptr + 2) / 2) / *(float *)a3));
  long double v12 = (v11 + v11) * 180.0 / 3.14159265;
  long double v13 = atan((float)((float)(*((_DWORD *)ptr + 3) / 2) / *((float *)a3 + 4)));
  printf("FOV:                               %.2f x %.2f degrees", (double)v12, (double)((v13 + v13) * 180.0 / 3.14159265));
  putchar(10);
  printf("Verbose : ");
  printf("GPS Uncertainty:                   %.2f m", *((float *)a3 + 18));
  putchar(10);
  printf("Verbose : ");
  printf("Core Motion heading & uncertainty: %.2f +- %.2f degrees", *((float *)a3 + 24), *((float *)a3 + 25));
  putchar(10);
  log_col_app((uint64_t)"VL ver:                            %d", v14, v15, v16, v17, v18, v19, v20, *(_DWORD *)(a1 + 1008));
  printf("Verbose : ");
  printf("------------------------------------------------------------");
  putchar(10);
  if (!*(_DWORD *)(a1 + 14688))
  {
    buf[0].tv_sec = 0;
    buf[0].tv_nsec = 0;
    clock_gettime(_CLOCK_MONOTONIC, buf);
    *(double *)(a1 + 14680) = (double)buf[0].tv_sec + (double)buf[0].tv_nsec * 0.000000001;
    int v21 = (timespec *)(a1 + 11864);
    if (*(_DWORD *)(a1 + 12076)) {
      goto LABEL_8;
    }
LABEL_10:
    clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 11896));
    clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 11880));
    clock_gettime(_CLOCK_MONOTONIC, v21);
    goto LABEL_11;
  }
  int v21 = (timespec *)(a1 + 11864);
  if (!*(_DWORD *)(a1 + 12076)) {
    goto LABEL_10;
  }
LABEL_8:
  *(void *)(a1 + 11984) -= mach_absolute_time();
LABEL_11:
  uint64_t v341 = a1 + 12080;
  vl_dump_locate(a1 + 12080, (uint64_t)ptr, (uint64_t)a3, a1 + 1424);
  memset(buf, 0, 32);
  if (*(_DWORD *)(a1 + 12080) && (*(unsigned char *)(a1 + 12084) & 8) != 0)
  {
    uint64_t v22 = 0;
    unsigned int v23 = 0;
    do
    {
      unsigned int v23 = (1025 * (v23 + *(char *)(a1 + v22))) ^ ((1025 * (v23 + *(char *)(a1 + v22))) >> 6);
      ++v22;
    }
    while (v22 != 1008);
    __darwin_time_t v24 = 32769 * ((9 * v23) ^ ((9 * v23) >> 11));
    strcpy((char *)buf, "vl");
    uint64_t v25 = *(void *)(a1 + 13744);
    uint64_t v26 = *(void *)(a1 + 13760);
    if (v25 >= v26)
    {
      uint64_t v27 = 2 * v26;
      _ZF = v26 == 0;
      uint64_t v29 = 4;
      if (!_ZF) {
        uint64_t v29 = v27;
      }
      if (v29 <= v25) {
        uint64_t v30 = v25 + 1;
      }
      else {
        uint64_t v30 = v29;
      }
      if (v30)
      {
        *(void *)(a1 + 13752) = realloc(*(void **)(a1 + 13752), 56 * v30);
        uint64_t v25 = *(void *)(a1 + 13744);
      }
      *(void *)(a1 + 13760) = v30;
    }
    *(void *)(a1 + 13744) = v25 + 1;
    float v31 = (timespec *)(*(void *)(a1 + 13752) + 56 * v25);
    *float v31 = buf[0];
    v31[1] = buf[1];
    v31[2].tv_sec = 0x20202020726150;
    v31[2].tv_nsec = 0x100000000;
    v31[3].tv_sec = v24;
  }
  long long v32 = *(_OWORD *)(a1 + 11840);
  *(_OWORD *)(a1 + 11648) = v32;
  long long v33 = *(_OWORD *)(a1 + 11824);
  *(_OWORD *)(a1 + 11632) = v33;
  long long v34 = *(_OWORD *)(a1 + 11808);
  *(_OWORD *)(a1 + 11616) = v34;
  long long v35 = *(_OWORD *)(a1 + 11792);
  *(_OWORD *)(a1 + 11600) = v35;
  long long v36 = *(_OWORD *)(a1 + 11760);
  *(_OWORD *)(a1 + 11568) = v36;
  long long v37 = *(_OWORD *)(a1 + 11776);
  *(_OWORD *)(a1 + 11584) = v37;
  *(_OWORD *)(a1 + 9464) = v32;
  *(_OWORD *)(a1 + 9448) = v33;
  *(_OWORD *)(a1 + 9432) = v34;
  *(_OWORD *)(a1 + 9416) = v35;
  *(_OWORD *)(a1 + 9384) = v36;
  *(_OWORD *)(a1 + 9400) = v37;
  long long v348 = xmmword_21BB7A730;
  long long v349 = xmmword_21BB7A730;
  LODWORD(v350) = 1065353216;
  *(float *)&long long v32 = sqrtf((float)((float)(*((float *)a3 + 27) * *((float *)a3 + 27))+ (float)(*((float *)a3 + 26) * *((float *)a3 + 26)))+ (float)(*((float *)a3 + 28) * *((float *)a3 + 28)));
  LODWORD(buf[0].tv_nsec) = 0;
  buf[0].tv_sec = 0;
  double v38 = *(float *)&v32;
  if (*(float *)&v32 < 0.95 || v38 > 1.05)
  {
    printf("%sWarning : ", "");
    printf("Gravity does not seem to be correct (len: %f)", v38);
    putchar(10);
  }
  else if (!vl_img_get_gv((uint64_t)a3, *(_DWORD *)(a1 + 500), (float *)buf))
  {
    if (*(_DWORD *)(a1 + 14696) || *(float *)a3 > 0.0 && *(float *)a3 <= 10000.0)
    {
      float v39 = *(double *)&vl_camera_min_gravity_angle * 3.14159265 / 180.0;
      float v40 = acos((float)((float)((float)(*(float *)&buf[0].tv_sec + (float)(*((float *)&buf[0].tv_sec + 1) * 0.0))
                               + (float)(*(float *)&buf[0].tv_nsec * 0.0))
                       / (float)(sqrtf((float)((float)(*((float *)&buf[0].tv_sec + 1) * *((float *)&buf[0].tv_sec + 1))+ (float)(*(float *)&buf[0].tv_sec * *(float *)&buf[0].tv_sec))+ (float)(*(float *)&buf[0].tv_nsec * *(float *)&buf[0].tv_nsec))+ 1.0e-20)));
      if (v40 < v39)
      {
        uint64_t v44 = 0x4000;
      }
      else
      {
        uint64_t v41 = (const float *)(a3 + 5);
        int32x4_t v42 = (int32x4_t)vld1q_dup_f32(v41);
        if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s32((int32x4_t)vl_argo_support_location_type, v42))), 0xFuLL))))
        {
          uint64_t v44 = 16387;
        }
        else
        {
          float v43 = *((float *)a3 + 18);
          if (v43 >= 0.0 && *(double *)&vl_gps_max_horz_accuracy >= v43) {
            uint64_t v44 = 1;
          }
          else {
            uint64_t v44 = 16388;
          }
        }
      }
    }
    else
    {
      printf("%sError : ", "");
      printf("Calibration does not seem to be correct (K[0] = %f)", *(float *)a3);
      putchar(10);
      uint64_t v44 = 16386;
    }
    goto LABEL_38;
  }
  uint64_t v44 = 16385;
LABEL_38:
  uint64_t v45 = a1 + 1016;
  vl_map_free(*(void *)(a1 + 1016));
  *(void *)(a1 + 1016) = 0;
  int v46 = vl_map_get(a1 + 4776, *((float *)a3 + 18), a1 + 120, (double *)a3 + 6, a1 + 1016);
  switch(v46)
  {
    case 0:
      goto LABEL_44;
    case 1:
      uint64_t v44 = 4;
      if (!*(_DWORD *)(a1 + 560)) {
        goto LABEL_49;
      }
      goto LABEL_45;
    case 2:
      uint64_t v44 = 8;
LABEL_44:
      if (*(_DWORD *)(a1 + 560)) {
        goto LABEL_45;
      }
      goto LABEL_49;
    case 3:
      uint64_t v44 = 16;
      if (!*(_DWORD *)(a1 + 560)) {
        goto LABEL_49;
      }
      goto LABEL_45;
    default:
      printf("%sError : ", "");
      printf("Unsupported map status: %d", v46);
      putchar(10);
      if (!*(_DWORD *)(a1 + 560)) {
        goto LABEL_49;
      }
LABEL_45:
      BOOL v47 = (void *)*(unsigned int *)(a1 + 564);
      if (!model_0 || *(_DWORD *)model_0 != v47 && (vl_hs_model_free(), !model_0)) {
        vl_hs_model_load(v47, (const char *)(a1 + 9920));
      }
LABEL_49:
      if (v44 != 1 && *(int *)(a1 + 4748) >= 1 && !*(_DWORD *)(a1 + 656) && !*(_DWORD *)(a1 + 976)) {
        goto LABEL_54;
      }
      float v340 = (float *)a4;
      if (vl_img_init((uint64_t)ptr, (uint64_t)a3, a1 + 176, *(_DWORD *)(a1 + 14696), *(_DWORD *)(a1 + 14700), a1 + 1024))goto LABEL_54; {
      if (*(_DWORD *)(a1 + 572))
      }
      {
        unint64_t v59 = vl_locability_score(a1 + 2136, a1 + 1024, (float *)(a1 + 1256), *(_DWORD *)(a1 + 576));
        printf("Info : ");
        printf("Locability: Score %f, status %d", *(float *)&v59, HIDWORD(v59) == 0);
        putchar(10);
        if (HIDWORD(v59))
        {
          uint64_t v44 = 0x8000;
          goto LABEL_54;
        }
      }
      v337 = v21;
      if (vl_os_log_once_token != -1) {
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      }
      float v60 = vl_os_log_log;
      os_signpost_id_t v61 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v62 = v61;
        if (os_signpost_enabled(v60))
        {
          LOWORD(buf[0].tv_sec) = 0;
          _os_signpost_emit_with_name_impl(&dword_21BAD2000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v62, "vl_kpts_extract", (const char *)&unk_21BB79E01, (uint8_t *)buf, 2u);
        }
      }
      float v339 = (uint64_t *)(a1 + 1936);
      vl_kpts_extract();
      uint64_t v338 = a1 + 1024;
      if (vl_os_log_once_token != -1) {
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      }
      uint64_t v63 = vl_os_log_log;
      os_signpost_id_t v64 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v65 = v64;
        if (os_signpost_enabled(v63))
        {
          __darwin_time_t v66 = *v339;
          LODWORD(buf[0].tv_sec) = 134217984;
          *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = v66;
          _os_signpost_emit_with_name_impl(&dword_21BAD2000, v63, OS_SIGNPOST_INTERVAL_END, v65, "vl_kpts_extract", "%lld", (uint8_t *)buf, 0xCu);
        }
      }
      vl_dump_kpts(v341, v339);
      if (v44 != 1 && !*(_DWORD *)(a1 + 656) && !*(_DWORD *)(a1 + 976))
      {
        int v21 = v337;
        goto LABEL_54;
      }
      int v21 = v337;
      if (*(_DWORD *)(a1 + 168) && *(void *)v45) {
        vl_retrieval(a1 + 7368, (uint64_t)v339, (uint64_t *)(*(void *)v45 + 48), a1 + 168);
      }
      uint64_t v67 = *(void *)(a1 + 14416);
      uint64_t v68 = a1 + 1024;
      if (v67 && *(_DWORD *)(v67 + 576) == 1)
      {
        uint64_t v69 = *(void *)(a1 + 1936);
        uint64_t v70 = **(void **)(v67 + 560);
        uint64_t v71 = *(void *)(a1 + 1952);
        if (v70 > v71)
        {
          uint64_t v72 = 2 * v71;
          if (v72 <= v70) {
            uint64_t v73 = v70;
          }
          else {
            uint64_t v73 = v72;
          }
          if (v73) {
            *(void *)(a1 + 1944) = malloc_type_realloc(*(void **)(a1 + 1944), 288 * v73, 0xAC89C964uLL);
          }
          *(void *)(a1 + 1952) = v73;
          uint64_t v68 = a1 + 1024;
        }
        if (v70 > v69) {
          bzero((void *)(*(void *)(a1 + 1944) + 288 * *(void *)(a1 + 1936)), 288 * (v70 - v69));
        }
        uint64_t v74 = *(void *)(*(void *)(a1 + 14416) + 560);
        *(void *)(a1 + 1936) = *(void *)v74;
        int v21 = v337;
        if (*(uint64_t *)v74 >= 1) {
          memcpy(*(void **)(a1 + 1944), *(const void **)(v74 + 8), 288 * *(void *)v74);
        }
      }
      if (v44 != 1 && *(_DWORD *)(a1 + 648))
      {
        update_tracker(a1 + 6992, v68, v339, a1, (uint64_t *)(a1 + 14424));
        update_tracker_meta(a1 + 6992, a3, 0, 0, 0, 0, a1);
      }
      if (v44 != 1 && *(_DWORD *)(a1 + 976))
      {
        update_history(a1 + 11664, v44, (long long *)a4, v68, a3, 0, 0, (uint64_t)v339, *(void *)(a1 + 1016), a1);
        goto LABEL_54;
      }
      if (v44 != 1) {
        goto LABEL_54;
      }
      if (vl_os_log_once_token != -1) {
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      }
      float v75 = vl_os_log_log;
      os_signpost_id_t v76 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v77 = v76;
        if (os_signpost_enabled(v75))
        {
          LOWORD(buf[0].tv_sec) = 0;
          _os_signpost_emit_with_name_impl(&dword_21BAD2000, v75, OS_SIGNPOST_INTERVAL_BEGIN, v77, "vl_match", (const char *)&unk_21BB79E01, (uint8_t *)buf, 2u);
        }
      }
      vl_match(a1 + 6344, v339, (uint64_t *)(a1 + 1984), *(void *)(a1 + 1016) + 48, (uint64_t *)(*(void *)(a1 + 1016) + 752), v68, (_DWORD *)(a1 + 152), a1 + 2008, v341);
      if (vl_os_log_once_token != -1) {
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      }
      float v78 = vl_os_log_log;
      os_signpost_id_t v79 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v80 = v79;
        if (os_signpost_enabled(v78))
        {
          __darwin_time_t v81 = *(void *)(a1 + 2008);
          LODWORD(buf[0].tv_sec) = 134217984;
          *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = v81;
          _os_signpost_emit_with_name_impl(&dword_21BAD2000, v78, OS_SIGNPOST_INTERVAL_END, v80, "vl_match", "Matches: %lld", (uint8_t *)buf, 0xCu);
        }
      }
      if (*(_DWORD *)(a1 + 648)) {
        update_tracker(a1 + 6992, v68, v339, a1, (uint64_t *)(a1 + 14424));
      }
      if ((int)*(void *)(a1 + 1936) >= 1)
      {
        float v82 = *(float32x2_t **)(a1 + 1944);
        uint64_t v83 = *(void *)(a1 + 1936);
        do
        {
          float64x2_t v351 = vcvtq_f64_f32(*v82);
          memset(buf, 0, 24);
          g_improj2_to_xyz(a1 + 1048, &v351, (double *)&buf[0].tv_sec);
          float32x2_t *v82 = vcvt_f32_f64(*(float64x2_t *)&buf[0].tv_nsec);
          v82 += 36;
          --v83;
        }
        while (v83);
      }
      uint64_t v84 = *(void *)(a1 + 14416);
      if (!v84 || *(_DWORD *)(v84 + 576) != 2) {
        goto LABEL_131;
      }
      uint64_t v85 = *(void *)(a1 + 1936);
      uint64_t v86 = *(void *)(*(void *)(v84 + 568) + 80);
      uint64_t v87 = *(void *)(a1 + 1952);
      if (v86 > v87)
      {
        uint64_t v209 = 2 * v87;
        if (v209 <= v86) {
          uint64_t v210 = v86;
        }
        else {
          uint64_t v210 = v209;
        }
        if (v210) {
          *(void *)(a1 + 1944) = malloc_type_realloc(*(void **)(a1 + 1944), 288 * v210, 0xFFC4D0D3uLL);
        }
        *(void *)(a1 + 1952) = v210;
        uint64_t v88 = v86 - v85;
        if (v86 <= v85)
        {
LABEL_121:
          uint64_t v89 = *(void *)(*(void *)(a1 + 14416) + 568);
          uint64_t v90 = *(void *)(v89 + 80);
          *(void *)(a1 + 1936) = v90;
          if (v90 < 1) {
            goto LABEL_123;
          }
          goto LABEL_122;
        }
      }
      else
      {
        uint64_t v88 = v86 - v85;
        if (v86 <= v85) {
          goto LABEL_121;
        }
      }
      bzero((void *)(*(void *)(a1 + 1944) + 288 * *(void *)(a1 + 1936)), 288 * v88);
      uint64_t v89 = *(void *)(*(void *)(a1 + 14416) + 568);
      uint64_t v90 = *(void *)(v89 + 80);
      *(void *)(a1 + 1936) = v90;
      if (v90 >= 1)
      {
LABEL_122:
        memcpy(*(void **)(a1 + 1944), *(const void **)(v89 + 88), 288 * v90);
        uint64_t v89 = *(void *)(*(void *)(a1 + 14416) + 568);
      }
LABEL_123:
      uint64_t v91 = *(void *)(a1 + 2032);
      uint64_t v92 = *(void *)(v89 + 152);
      uint64_t v93 = *(void *)(a1 + 2048);
      if (v92 > v93)
      {
        uint64_t v211 = 2 * v93;
        _ZF = v93 == 0;
        uint64_t v212 = 32;
        if (!_ZF) {
          uint64_t v212 = v211;
        }
        if (v212 <= v92) {
          uint64_t v213 = v92;
        }
        else {
          uint64_t v213 = v212;
        }
        if (v213) {
          *(void *)(a1 + 2040) = malloc_type_realloc(*(void **)(a1 + 2040), 8 * v213, 0xAC66EC66uLL);
        }
        *(void *)(a1 + 2048) = v213;
        uint64_t v94 = v92 - v91;
        if (v92 <= v91)
        {
LABEL_125:
          uint64_t v95 = *(void *)(*(void *)(a1 + 14416) + 568);
          uint64_t v96 = *(void *)(v95 + 152);
          *(void *)(a1 + 2032) = v96;
          if (v96 < 1) {
            goto LABEL_127;
          }
          goto LABEL_126;
        }
      }
      else
      {
        uint64_t v94 = v92 - v91;
        if (v92 <= v91) {
          goto LABEL_125;
        }
      }
      bzero((void *)(*(void *)(a1 + 2040) + 8 * *(void *)(a1 + 2032)), 8 * v94);
      uint64_t v95 = *(void *)(*(void *)(a1 + 14416) + 568);
      uint64_t v96 = *(void *)(v95 + 152);
      *(void *)(a1 + 2032) = v96;
      if (v96 >= 1)
      {
LABEL_126:
        memcpy(*(void **)(a1 + 2040), *(const void **)(v95 + 160), 8 * v96);
        uint64_t v95 = *(void *)(*(void *)(a1 + 14416) + 568);
      }
LABEL_127:
      uint64_t v97 = *(void *)(a1 + 2008);
      uint64_t v98 = *(void *)(v95 + 128);
      uint64_t v99 = *(void *)(a1 + 2024);
      if (v98 > v99)
      {
        uint64_t v214 = 2 * v99;
        _ZF = v99 == 0;
        uint64_t v215 = 32;
        if (!_ZF) {
          uint64_t v215 = v214;
        }
        if (v215 <= v98) {
          uint64_t v216 = v98;
        }
        else {
          uint64_t v216 = v215;
        }
        if (v216) {
          *(void *)(a1 + 2016) = malloc_type_realloc(*(void **)(a1 + 2016), 8 * v216, 0x731363FDuLL);
        }
        *(void *)(a1 + 2024) = v216;
        uint64_t v100 = v98 - v97;
        if (v98 <= v97)
        {
LABEL_129:
          uint64_t v101 = *(void *)(*(void *)(a1 + 14416) + 568);
          uint64_t v102 = *(void *)(v101 + 128);
          *(void *)(a1 + 2008) = v102;
          if (v102 < 1) {
            goto LABEL_131;
          }
          goto LABEL_130;
        }
      }
      else
      {
        uint64_t v100 = v98 - v97;
        if (v98 <= v97) {
          goto LABEL_129;
        }
      }
      bzero((void *)(*(void *)(a1 + 2016) + 8 * *(void *)(a1 + 2008)), 8 * v100);
      uint64_t v101 = *(void *)(*(void *)(a1 + 14416) + 568);
      uint64_t v102 = *(void *)(v101 + 128);
      *(void *)(a1 + 2008) = v102;
      if (v102 >= 1) {
LABEL_130:
      }
        memcpy(*(void **)(a1 + 2016), *(const void **)(v101 + 136), 8 * v102);
LABEL_131:
      if (vl_os_log_once_token != -1) {
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      }
      uint64_t v103 = vl_os_log_log;
      os_signpost_id_t v104 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v105 = v104;
        if (os_signpost_enabled(v103))
        {
          LOWORD(buf[0].tv_sec) = 0;
          _os_signpost_emit_with_name_impl(&dword_21BAD2000, v103, OS_SIGNPOST_INTERVAL_BEGIN, v105, "vl_pose", (const char *)&unk_21BB79E01, (uint8_t *)buf, 2u);
        }
      }
      v336 = (__darwin_time_t *)(a1 + 2056);
      vl_pose(a1 + 7584, v338, v339, a1 + 1984, *(void *)(a1 + 1016) + 48, *(void *)(a1 + 1016) + 608, (uint64_t *)(a1 + 2008), 0, a1 + 176, v341, (uint64_t)&v348, a1 + 2056, (_DWORD *)(a4 + 100), (_DWORD *)(a4 + 96));
      uint64_t v106 = *(void *)(a1 + 1936);
      if ((int)v106 >= 1)
      {
        float v107 = *(float32x2_t **)(a1 + 1944);
        uint64_t v108 = *(void *)(a1 + 1936);
        do
        {
          float64x2_t v351 = 0uLL;
          buf[0].tv_sec = 0x3FF0000000000000;
          *(float64x2_t *)&buf[0].tv_nsec = vcvtq_f64_f32(*v107);
          g_xyz_to_improj2(a1 + 1048, (uint64_t)buf, v351.f64, 0, v106);
          *float v107 = vcvt_f32_f64(v351);
          v107 += 36;
          --v108;
        }
        while (v108);
      }
      uint64_t v109 = *(void *)(a1 + 2056);
      if ((int)v109 >= 1)
      {
        float v110 = *(float32x2_t **)(a1 + 2064);
        uint64_t v111 = *(void *)(a1 + 2056);
        do
        {
          float64x2_t v351 = 0uLL;
          buf[0].tv_sec = 0x3FF0000000000000;
          *(float64x2_t *)&buf[0].tv_nsec = vcvtq_f64_f32(*v110);
          g_xyz_to_improj2(a1 + 1048, (uint64_t)buf, v351.f64, 0, v109);
          *v110++ = vcvt_f32_f64(v351);
          --v111;
        }
        while (v111);
      }
      if (vl_os_log_once_token != -1) {
        dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
      }
      int v112 = vl_os_log_log;
      os_signpost_id_t v113 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v114 = v113;
        if (os_signpost_enabled(v112))
        {
          __darwin_time_t v115 = *v336;
          LODWORD(buf[0].tv_sec) = 134217984;
          *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = v115;
          _os_signpost_emit_with_name_impl(&dword_21BAD2000, v112, OS_SIGNPOST_INTERVAL_END, v114, "vl_pose", "Inliers: %lld", (uint8_t *)buf, 0xCu);
        }
      }
      BOOL v116 = (double *)(*(void *)(a1 + 1016) + 288);
      buf[0] = (timespec)vcvtq_f64_f32(*(float32x2_t *)&v348);
      buf[1] = (timespec)vcvtq_f64_f32(*(float32x2_t *)((char *)&v348 + 8));
      buf[2] = (timespec)vcvtq_f64_f32(*(float32x2_t *)&v349);
      buf[3] = (timespec)vcvtq_f64_f32(*(float32x2_t *)((char *)&v349 + 8));
      uint8_t buf[4] = (timespec)vcvtq_f64_f32(*(float32x2_t *)&v350);
      buf[5] = (timespec)vcvtq_f64_f32(*(float32x2_t *)((char *)&v350 + 8));
      g_camera_local_to_global(v116, (double *)&buf[0].tv_sec, (double *)&v342);
      uint64_t v117 = a1 + 2056;
      uint64_t v44 = vl_verify_post(v338, *(void *)(a1 + 1016), (double *)&v342, v336, *(unsigned int *)(a1 + 8056), (float *)a4, a1, v118);
      if (v44 == 1)
      {
        _D19 = (float32x2_t)vdup_n_s32(0x404F5C28u);
        float v327 = *(float *)(a4 + 204) * 3.24;
        float v322 = *(float *)(a4 + 180) * 3.24;
        float v330 = *(float *)(a4 + 216) * 3.24;
        float __b = *(float *)(a4 + 208) * 3.24;
        float v334 = *(float *)(a4 + 228) * 3.24;
        _D3 = vadd_f32(vmul_f32(*(float32x2_t *)(a4 + 100), _D19), (float32x2_t)1008981771);
        _S30 = DWORD1(v348);
        _S8 = v348;
        float32x2_t v123 = vadd_f32(vmul_f32(*(float32x2_t *)(a4 + 124), _D19), (float32x2_t)0x3C23D70B00000000);
        _KR00_8 = *((void *)&v348 + 1);
        float32x2_t v125 = vmla_n_f32(vmla_n_f32(0, _D3, *(float *)&v348), v123, *((float *)&v348 + 3));
        _D6 = v123;
        float32x2_t v127 = vadd_f32(vmul_f32(*(float32x2_t *)(a4 + 148), _D19), 0);
        _S12 = DWORD2(v349);
        float32x2_t v129 = vmla_n_f32(v125, v127, *((float *)&v349 + 2));
        float32x2_t v130 = v127;
        float32x2_t v131 = vmul_f32(*(float32x2_t *)(a4 + 172), _D19);
        float32x2_t v132 = vmla_f32(v129, 0, v131);
        _D28 = v131;
        float32x2_t v134 = vmul_f32(*(float32x2_t *)(a4 + 196), _D19);
        float32x2_t v135 = vmla_f32(v132, 0, v134);
        _D24 = v134;
        float32x2_t v137 = vmul_f32(*(float32x2_t *)(a4 + 220), _D19);
        _D11 = vmla_f32(v135, 0, v137);
        __asm { FMLA            S1, S10, V11.S[1] }
        _S23 = v349;
        __asm { FMLA            S14, S23, V11.S[1] }
        _S22 = DWORD1(v349);
        __asm { FMLA            S29, S22, V11.S[1] }
        float32x2_t v313 = _D3;
        float32x2_t v314 = v130;
        float32x2_t v315 = _D6;
        float32x2_t v316 = _D28;
        _S21 = HIDWORD(v349);
        float32x2_t v317 = _D24;
        float32x2_t v318 = v137;
        _D11 = vmla_f32(vmla_f32(vmla_f32(vmla_n_f32(vmla_n_f32(vmla_n_f32(0, _D3, *((float *)&v348 + 1)), _D6, *(float *)&v349), v130, *((float *)&v349 + 3)), 0, _D28), 0, _D24), 0, v137);
        __asm
        {
          FMLA            S27, S10, V11.S[1]
          FMLA            S26, S23, V11.S[1]
          FMLA            S25, S22, V11.S[1]
        }
        _D5 = vmul_f32(*(float32x2_t *)(a4 + 112), _D19);
        __asm { FMLA            S13, S8, V5.S[1] }
        _S7 = v350;
        _D0 = vmla_f32(vmla_f32(vmla_f32(vmla_n_f32(vmla_n_f32(vmla_n_f32(0, _D3, *((float *)&v348 + 2)), _D6, *((float *)&v349 + 1)), v130, *(float *)&v350), 0, _D28), 0, _D24), 0, v137);
        _D11.i32[0] = 0;
        _D24.f32[0] = (float)(*(float *)(a4 + 108) * 3.24) + 0.0;
        float v303 = *(float *)(a4 + 120) * 3.24;
        float v304 = *(float *)(a4 + 144) * 3.24;
        float v156 = (float)(*(float *)(a4 + 132) * 3.24) + 0.0;
        _D20 = vmul_f32(*(float32x2_t *)(a4 + 136), _D19);
        __asm
        {
          FMLA            S13, S10, V20.S[1]
          FMLA            S17, S10, V0.S[1]
        }
        float v160 = (float)(*(float *)(a4 + 156) * 3.24) + 0.01;
        _D4 = vmul_f32(*(float32x2_t *)(a4 + 160), _D19);
        float32x2_t v320 = vmul_f32(*(float32x2_t *)(a4 + 232), _D19);
        float32x2_t v321 = vmul_f32(*(float32x2_t *)(a4 + 188), _D19);
        double v312 = (float)(*(float *)(a4 + 212) * 3.24) + 0.00000304617429;
        double v324 = (float)(*(float *)(a4 + 240) * 3.24) + 0.00000304617429;
        double v325 = (float)(*(float *)(a4 + 184) * 3.24) + 0.00000304617429;
        __asm
        {
          FMLA            S19, S30, V5.S[1]
          FMLA            S19, S23, V20.S[1]
          FMLA            S6, S23, V0.S[1]
          FMLA            S3, S22, V0.S[1]
          FMLA            S23, S9, V5.S[1]
          FMLA            S23, S22, V20.S[1]
        }
        _D28.f32[0] = (float)((float)((float)((float)((float)((float)(_D24.f32[0] * *(float *)&v348) + 0.0)
                                                    + (float)(v156 * *((float *)&v348 + 3)))
                                            + (float)(v160 * *((float *)&v349 + 2)))
                                    + (float)(v322 * 0.0))
                            + (float)(v327 * 0.0))
                    + (float)(v334 * 0.0);
        float v305 = _S1 + (float)(*((float *)&v349 + 2) * _D28.f32[0]);
        float v306 = _S14 + (float)(*((float *)&v349 + 3) * _D28.f32[0]);
        float v307 = _S29 + (float)(*(float *)&v350 * _D28.f32[0]);
        float v164 = (float)((float)((float)((float)((float)((float)(_D24.f32[0] * *((float *)&v348 + 1)) + 0.0)
                                             + (float)(v156 * *(float *)&v349))
                                     + (float)(v160 * *((float *)&v349 + 3)))
                             + (float)(v322 * 0.0))
                     + (float)(v327 * 0.0))
             + (float)(v334 * 0.0);
        float v308 = _S27 + (float)(*((float *)&v349 + 2) * v164);
        float v309 = _S26 + (float)(*((float *)&v349 + 3) * v164);
        float v165 = vmlas_n_f32(vmlas_n_f32(vmlas_n_f32(0.0, *(float *)&v348, _D5.f32[0]), *((float *)&v348 + 3), _D20.f32[0]), *((float *)&v349 + 2), _D4.f32[0]);
        __asm { FMLA            S13, S12, V4.S[1] }
        _D0.f32[0] = (float)((float)((float)((float)((float)((float)(_D24.f32[0] * *((float *)&v348 + 2)) + 0.0)
                                                   + (float)(v156 * *((float *)&v349 + 1)))
                                           + (float)(v160 * *(float *)&v350))
                                   + (float)(v322 * 0.0))
                           + (float)(v327 * 0.0))
                   + (float)(v334 * 0.0);
        float v319 = _S17 + (float)(*((float *)&v349 + 2) * _D0.f32[0]);
        float v167 = vmlas_n_f32(vmlas_n_f32(vmlas_n_f32(0.0, *((float *)&v348 + 1), _D5.f32[0]), *(float *)&v349, _D20.f32[0]), *((float *)&v349 + 3), _D4.f32[0]);
        __asm { FMLA            S19, S21, V4.S[1] }
        float v310 = _S25 + (float)(*(float *)&v350 * v164);
        float v311 = _D6.f32[0] + (float)(*((float *)&v349 + 3) * _D0.f32[0]);
        float v323 = _D3.f32[0] + (float)(*(float *)&v350 * _D0.f32[0]);
        float v168 = vmlas_n_f32(vmlas_n_f32(vmlas_n_f32(0.0, *((float *)&v348 + 2), _D5.f32[0]), *((float *)&v349 + 1), _D20.f32[0]), *(float *)&v350, _D4.f32[0]);
        __asm { FMLA            S23, S7, V4.S[1] }
        float v170 = *(float *)(a4 + 168) * 3.24;
        *(float32x2_t *)(a4 + 112) = _D5;
        _D0.i32[0] = 0;
        __asm { FMLA            S0, S0, V5.S[1] }
        *(_DWORD *)(a4 + 108) = _D24.i32[0];
        *(float *)(a4 + 132) = v156;
        *(float32x2_t *)(a4 + 136) = _D20;
        __asm { FMLA            S0, S11, V20.S[1] }
        *(float *)(a4 + 120) = v303;
        *(float *)(a4 + 144) = v304;
        *(float *)(a4 + 156) = v160;
        float v171 = (float)((float)((float)(_D24.f32[0] * 0.0) + 0.0) + (float)(v156 * 0.0)) + (float)(v160 * 0.0);
        *(float32x2_t *)(a4 + 160) = _D4;
        float v172 = vmlas_n_f32(vmlas_n_f32(vmlas_n_f32(0.0, 0.0, _D5.f32[0]), 0.0, _D20.f32[0]), 0.0, _D4.f32[0]);
        __asm { FMLA            S0, S11, V4.S[1] }
        *(float *)(a4 + 168) = v170;
        _D4.f32[0] = (float)((float)((float)(v303 * 0.0) + 0.0) + (float)(v304 * 0.0)) + (float)(v170 * 0.0);
        *(float32x2_t *)(a4 + 100) = v313;
        *(float32x2_t *)(a4 + 124) = v315;
        *(float32x2_t *)(a4 + 148) = v314;
        float32x2_t v173 = vmla_f32(vmla_f32(vmla_f32(0, 0, v313), 0, v315), 0, v314);
        *(float32x2_t *)(a4 + 172) = v316;
        float32x2_t v174 = vadd_f32(v316, v173);
        float32x2_t v175 = vmla_f32(v173, 0, v316);
        *(float32x2_t *)(a4 + 196) = v317;
        _D20 = vadd_f32(v321, 0);
        _D21 = vadd_f32(v320, 0);
        _D18 = vmla_f32(vmla_f32(v174, 0, v317), 0, v318);
        _D5 = vmla_f32(vadd_f32(v317, v175), 0, v318);
        *(float32x2_t *)(a4 + 220) = v318;
        _D29 = vadd_f32(v318, vmla_f32(v175, 0, v317));
        float v181 = v312;
        float v182 = _D21.f32[1] + (float)(vmlas_n_f32(_D0.f32[0], 0.0, _D20.f32[0]) + (float)(v181 * 0.0));
        float v183 = v325;
        _D3.f32[0] = v324;
        __asm { FMLA            S28, S11, V20.S[1] }
        float v184 = vmlas_n_f32((float)(v165 + (float)(v183 * 0.0)) + (float)((float)(__b + 0.0) * 0.0), 0.0, _D21.f32[0]);
        __asm { FMLA            S13, S11, V21.S[1] }
        _D28.f32[0] = (float)(_D28.f32[0] + (float)((float)(v330 + 0.0) * 0.0)) + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 100) = (float)((float)(v305 + (float)(v184 * 0.0)) + (float)(_S13 * 0.0))
                             + (float)(_D28.f32[0] * 0.0);
        *(float *)(a4 + 104) = (float)((float)(v306 + (float)(v184 * 0.0)) + (float)(_S13 * 0.0))
                             + (float)(_D28.f32[0] * 0.0);
        *(float *)(a4 + 108) = (float)((float)(v307 + (float)(v184 * 0.0)) + (float)(_S13 * 0.0))
                             + (float)(_D28.f32[0] * 0.0);
        __asm { FMLA            S27, S11, V20.S[1] }
        float v187 = vmlas_n_f32((float)(v167 + (float)(v183 * 0.0)) + (float)((float)(__b + 0.0) * 0.0), 0.0, _D21.f32[0]);
        __asm { FMLA            S19, S11, V21.S[1] }
        float v188 = (float)(_S27 + (float)((float)(v330 + 0.0) * 0.0)) + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 124) = (float)((float)(v308 + (float)(v187 * 0.0)) + (float)(_D19.f32[0] * 0.0))
                             + (float)(v188 * 0.0);
        *(float *)(a4 + 128) = (float)((float)(v309 + (float)(v187 * 0.0)) + (float)(_D19.f32[0] * 0.0))
                             + (float)(v188 * 0.0);
        *(float *)(a4 + 132) = (float)((float)(v310 + (float)(v187 * 0.0)) + (float)(_D19.f32[0] * 0.0))
                             + (float)(v188 * 0.0);
        __asm { FMLA            S6, S11, V20.S[1] }
        _D19.f32[0] = vmlas_n_f32((float)(v168 + (float)(v183 * 0.0)) + (float)((float)(__b + 0.0) * 0.0), 0.0, _D21.f32[0]);
        __asm { FMLA            S23, S11, V21.S[1] }
        _D6.f32[0] = (float)(_D6.f32[0] + (float)((float)(v330 + 0.0) * 0.0)) + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 148) = (float)((float)(v319 + (float)(_D19.f32[0] * 0.0)) + (float)(_S23 * 0.0))
                             + (float)(_D6.f32[0] * 0.0);
        *(float *)(a4 + 152) = (float)((float)(v311 + (float)(_D19.f32[0] * 0.0)) + (float)(_S23 * 0.0))
                             + (float)(_D6.f32[0] * 0.0);
        *(float *)(a4 + 184) = v183;
        *(float *)(a4 + 156) = (float)((float)(v323 + (float)(_D19.f32[0] * 0.0)) + (float)(_S23 * 0.0))
                             + (float)(_D6.f32[0] * 0.0);
        __asm { FMLA            S6, S11, V18.S[1] }
        _D18.f32[0] = vmlas_n_f32((float)(v172 + v183) + (float)((float)(__b + 0.0) * 0.0), 0.0, _D21.f32[0]);
        _D6.f32[0] = _D6.f32[0]
                   + (float)((float)((float)((float)(v322 + v171) + (float)(v327 * 0.0)) + (float)(v334 * 0.0)) * 0.0);
        __asm { FMLA            S24, S11, V21.S[1] }
        float v190 = (float)((float)(_D20.f32[1] + _D4.f32[0]) + (float)((float)(v330 + 0.0) * 0.0))
             + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 184) = (float)((float)(_D18.f32[0] + _D6.f32[0]) + (float)(_D24.f32[0] * 0.0))
                             + (float)(v190 * 0.0);
        *(float32x2_t *)(a4 + 188) = _D20;
        _D6.f32[0] = _D6.f32[0] + (float)(_D18.f32[0] * 0.0);
        *(float *)(a4 + 188) = (float)(_D24.f32[0] + _D6.f32[0]) + (float)(v190 * 0.0);
        *(float *)(a4 + 192) = v190 + (float)(_D6.f32[0] + (float)(_D24.f32[0] * 0.0));
        *(float *)(a4 + 180) = v322;
        _D6.f32[0] = v171 + (float)(v322 * 0.0);
        float v191 = v172 + (float)(v183 * 0.0);
        *(float *)(a4 + 204) = v327;
        __asm { FMLA            S4, S11, V20.S[1] }
        *(float *)(a4 + 228) = v334;
        *(float *)(a4 + 208) = __b + 0.0;
        *(float *)(a4 + 212) = v181;
        *(float *)(a4 + 216) = v330 + 0.0;
        *(float32x2_t *)(a4 + 232) = _D21;
        v175.f32[0] = _D21.f32[0] + (float)(v191 + (float)((float)(__b + 0.0) * 0.0));
        _D18.f32[0] = vmlas_n_f32((float)(__b + 0.0) + v191, 0.0, _D21.f32[0]);
        __asm { FMLA            S0, S11, V21.S[1] }
        *(_DWORD *)(a4 + 240) = _D3.i32[0];
        float v192 = (float)(_D4.f32[0] + (float)((float)(v330 + 0.0) * 0.0)) + _D3.f32[0];
        _D3.f32[0] = (float)((float)(v330 + 0.0) + _D4.f32[0]) + (float)(_D3.f32[0] * 0.0);
        __asm { FMLA            S4, S11, V5.S[1] }
        _D4.f32[0] = _D4.f32[0] + (float)((float)((float)(v327 + _D6.f32[0]) + (float)(v334 * 0.0)) * 0.0);
        *(float *)(a4 + 208) = (float)((float)(_D18.f32[0] + _D4.f32[0]) + (float)(_D0.f32[0] * 0.0))
                             + (float)(_D3.f32[0] * 0.0);
        _D4.f32[0] = _D4.f32[0] + (float)(_D18.f32[0] * 0.0);
        *(float *)(a4 + 212) = (float)(_D0.f32[0] + _D4.f32[0]) + (float)(_D3.f32[0] * 0.0);
        *(float *)(a4 + 216) = _D3.f32[0] + (float)(_D4.f32[0] + (float)(_D0.f32[0] * 0.0));
        __asm { FMLA            S0, S11, V29.S[1] }
        _D0.f32[0] = _D0.f32[0] + (float)((float)(v334 + (float)(_D6.f32[0] + (float)(v327 * 0.0))) * 0.0);
        _D3.f32[0] = v175.f32[0] + _D0.f32[0];
        _D0.f32[0] = _D0.f32[0] + (float)(v175.f32[0] * 0.0);
        *(float *)(a4 + 232) = (float)(_D3.f32[0] + (float)(v182 * 0.0)) + (float)(v192 * 0.0);
        *(float *)(a4 + 236) = (float)(v182 + _D0.f32[0]) + (float)(v192 * 0.0);
        *(float *)(a4 + 240) = v192 + (float)(_D0.f32[0] + (float)(v182 * 0.0));
        *(_DWORD *)(a4 + 204) = 0;
        *(void *)(a4 + 196) = 0;
        *(void *)(a4 + 220) = 0;
        *(_DWORD *)(a4 + 228) = 0;
        *(void *)(a4 + 112) = 0;
        *(_DWORD *)(a4 + 120) = 0;
        *(void *)(a4 + 136) = 0;
        *(_DWORD *)(a4 + 144) = 0;
        *(void *)(a4 + 176) = 0;
        *(void *)(a4 + 160) = 0;
        *(void *)(a4 + 168) = 0;
        uint64_t v193 = (float *)malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
        double v194 = (char *)malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
        if (fabs(*((float *)&v349 + 2)) >= 1.0)
        {
          long double v206 = *((float *)&v348 + 1);
          long double v207 = *((float *)&v348 + 2);
          if (*((float *)&v349 + 2) <= -1.0)
          {
            double v201 = atan2(v206, v207) + 0.0;
            float v204 = 0.0;
            int v208 = 1061752795;
          }
          else
          {
            double v201 = atan2(-v206, -v207);
            float v204 = 0.0;
            int v208 = -1085730853;
          }
          float v205 = *(float *)&v208;
        }
        else
        {
          long double v195 = *(float *)&v350;
          long double v196 = *((float *)&v349 + 3);
          long double v197 = *((float *)&v348 + 3);
          long double v198 = *(float *)&v348;
          double v199 = asin(-*((float *)&v349 + 2));
          double v200 = atan2(v197, v198);
          double v201 = atan2(v196, v195);
          float v202 = v200;
          float v203 = v199;
          float v204 = v202 * 0.5;
          float v205 = v203 * 0.5;
        }
        float v217 = v201;
        __float2 v218 = __sincosf_stret(v204);
        __float2 v219 = __sincosf_stret(v205);
        __float2 v220 = __sincosf_stret(v217 * 0.5);
        float v221 = (float)(v219.__cosval * v218.__cosval) * v220.__cosval;
        float v222 = (float)(v219.__sinval * v218.__sinval) * v220.__sinval;
        float v223 = (float)(v219.__cosval * v218.__cosval) * v220.__sinval;
        float v224 = (float)(v219.__sinval * v218.__sinval) * v220.__cosval;
        float v225 = (float)(v219.__cosval * v218.__sinval) * v220.__sinval;
        float v226 = (float)(v219.__sinval * v218.__cosval) * v220.__cosval;
        float v227 = (float)(v219.__cosval * v218.__sinval) * v220.__cosval;
        float v228 = (float)(v219.__sinval * v218.__cosval) * v220.__sinval;
        float v229 = v228 - v227;
        float v230 = v226 + v225;
        float v231 = v223 - v224;
        float v232 = (float)-v222 - v221;
        float v328 = v225 - v226;
        float v329 = v228 + v227;
        float v331 = v221 - v222;
        float __ba = v224 + v223;
        float v335 = v224 - v223;
        float v326 = v227 - v228;
        float v233 = v221 + v222;
        float v234 = 1.0 - (float)(v233 * v233);
        float v235 = acosf(v221 + v222);
        float v236 = (float)(v235 + v235) / sqrtf(v234);
        float v237 = -(float)(powf(v234, 1.5) - (float)((float)(v233 * v234) * v235));
        float v238 = v237 / powf(v234, 2.5);
        float v239 = (float)(v231 + v231) * v238;
        float v240 = (float)(v230 + v230) * v238;
        float v241 = (float)(v326 + v326) * v238;
        float v242 = (float)((float)((float)((float)(v241 * v335) + 0.0) + (float)(v232 * 0.0)) + (float)(v326 * 0.0))
             + (float)(v236 * v230);
        float v243 = (float)((float)((float)((float)((float)(v239 * v229) + 0.0) + (float)(v236 * v230)) + (float)(v231 * 0.0))
                     + (float)(v232 * 0.0))
             * 0.5;
        float v244 = (float)((float)((float)((float)((float)(v240 * v229) + 0.0) + (float)(v230 * 0.0)) + (float)(v236 * v231))
                     + (float)(v232 * 0.0))
             * 0.5;
        float v245 = (float)((float)((float)((float)((float)(v241 * v229) + 0.0) + (float)(v230 * 0.0)) + (float)(v231 * 0.0))
                     + (float)(v236 * v232))
             * 0.5;
        float v246 = (float)((float)((float)((float)((float)(v239 * v328) + 0.0) + (float)(v236 * v329)) + (float)(v331 * 0.0))
                     + (float)(__ba * 0.0))
             * 0.5;
        float v247 = (float)((float)((float)((float)((float)(v240 * v328) + 0.0) + (float)(v329 * 0.0)) + (float)(v236 * v331))
                     + (float)(__ba * 0.0))
             * 0.5;
        float v248 = (float)((float)((float)((float)((float)(v241 * v328) + 0.0) + (float)(v329 * 0.0)) + (float)(v331 * 0.0))
                     + (float)(v236 * __ba))
             * 0.5;
        float v249 = (float)((float)((float)((float)((float)(v239 * v335) + 0.0) + (float)(v236 * v232)) + (float)(v326 * 0.0))
                     + (float)(v230 * 0.0))
             * 0.5;
        float v250 = (float)((float)((float)((float)((float)(v240 * v335) + 0.0) + (float)(v232 * 0.0)) + (float)(v236 * v326))
                     + (float)(v230 * 0.0))
             * 0.5;
        float *v193 = v340[46];
        v193[1] = v340[47];
        v193[2] = v340[48];
        v193[3] = v340[52];
        v193[4] = v340[53];
        v193[5] = v340[54];
        v193[6] = v340[58];
        v193[7] = v340[59];
        v193[8] = v340[60];
        *((_DWORD *)v194 + 2) = 0;
        *(void *)double v194 = 0;
        float v251 = (float)(*v193 * v243) + 0.0;
        *(float *)double v194 = v251;
        float v252 = (float)(v193[1] * v243) + 0.0;
        *((float *)v194 + 1) = v252;
        float v253 = (float)(v193[2] * v243) + 0.0;
        *((float *)v194 + 2) = v253;
        float v254 = v251 + (float)(v193[3] * v246);
        *(float *)double v194 = v254;
        float v255 = v252 + (float)(v193[4] * v246);
        *((float *)v194 + 1) = v255;
        float v256 = v253 + (float)(v193[5] * v246);
        *((float *)v194 + 2) = v256;
        *(float *)double v194 = v254 + (float)(v193[6] * v249);
        *((float *)v194 + 1) = v255 + (float)(v193[7] * v249);
        *((float *)v194 + 2) = v256 + (float)(v193[8] * v249);
        *((_DWORD *)v194 + 5) = 0;
        *(void *)(v194 + 12) = 0;
        float v257 = (float)(*v193 * v244) + 0.0;
        *((float *)v194 + 3) = v257;
        float v258 = (float)(v193[1] * v244) + 0.0;
        *((float *)v194 + 4) = v258;
        float v259 = (float)(v193[2] * v244) + 0.0;
        *((float *)v194 + 5) = v259;
        float v260 = v257 + (float)(v193[3] * v247);
        *((float *)v194 + 3) = v260;
        float v261 = v258 + (float)(v193[4] * v247);
        *((float *)v194 + 4) = v261;
        float v262 = v259 + (float)(v193[5] * v247);
        *((float *)v194 + 5) = v262;
        *((float *)v194 + 3) = v260 + (float)(v193[6] * v250);
        *((float *)v194 + 4) = v261 + (float)(v193[7] * v250);
        *((float *)v194 + 5) = v262 + (float)(v193[8] * v250);
        *((_DWORD *)v194 + 8) = 0;
        *((void *)v194 + 3) = 0;
        float v263 = (float)(*v193 * v245) + 0.0;
        *((float *)v194 + 6) = v263;
        float v264 = (float)(v193[1] * v245) + 0.0;
        *((float *)v194 + 7) = v264;
        float v265 = (float)(v193[2] * v245) + 0.0;
        *((float *)v194 + 8) = v265;
        float v266 = v263 + (float)(v193[3] * v248);
        *((float *)v194 + 6) = v266;
        float v267 = v264 + (float)(v193[4] * v248);
        *((float *)v194 + 7) = v267;
        float v268 = v265 + (float)(v193[5] * v248);
        *((float *)v194 + 8) = v268;
        *((float *)v194 + 6) = v266 + (float)(v193[6] * (float)(v242 * 0.5));
        *((float *)v194 + 7) = v267 + (float)(v193[7] * (float)(v242 * 0.5));
        *((float *)v194 + 8) = v268 + (float)(v193[8] * (float)(v242 * 0.5));
        v340[48] = 0.0;
        *((void *)v340 + 23) = 0;
        float v269 = (float)(v243 * *(float *)v194) + 0.0;
        v340[46] = v269;
        float v270 = (float)(v244 * *(float *)v194) + 0.0;
        v340[47] = v270;
        float v271 = (float)(v245 * *(float *)v194) + 0.0;
        v340[48] = v271;
        float v272 = v269 + (float)(v246 * *((float *)v194 + 1));
        v340[46] = v272;
        float v273 = v270 + (float)(v247 * *((float *)v194 + 1));
        v340[47] = v273;
        float v274 = v271 + (float)(v248 * *((float *)v194 + 1));
        v340[48] = v274;
        v340[46] = v272 + (float)(v249 * *((float *)v194 + 2));
        v340[47] = v273 + (float)(v250 * *((float *)v194 + 2));
        v340[48] = v274 + (float)((float)(v242 * 0.5) * *((float *)v194 + 2));
        v340[54] = 0.0;
        *((void *)v340 + 26) = 0;
        float v275 = (float)(v243 * *((float *)v194 + 3)) + 0.0;
        v340[52] = v275;
        float v276 = (float)(v244 * *((float *)v194 + 3)) + 0.0;
        v340[53] = v276;
        float v277 = (float)(v245 * *((float *)v194 + 3)) + 0.0;
        v340[54] = v277;
        float v278 = v275 + (float)(v246 * *((float *)v194 + 4));
        v340[52] = v278;
        float v279 = v276 + (float)(v247 * *((float *)v194 + 4));
        v340[53] = v279;
        float v280 = v277 + (float)(v248 * *((float *)v194 + 4));
        v340[54] = v280;
        v340[52] = v278 + (float)(v249 * *((float *)v194 + 5));
        v340[53] = v279 + (float)(v250 * *((float *)v194 + 5));
        v340[54] = v280 + (float)((float)(v242 * 0.5) * *((float *)v194 + 5));
        v340[60] = 0.0;
        *((void *)v340 + 29) = 0;
        float v281 = (float)(v243 * *((float *)v194 + 6)) + 0.0;
        v340[58] = v281;
        float v282 = (float)(v244 * *((float *)v194 + 6)) + 0.0;
        v340[59] = v282;
        float v283 = (float)(v245 * *((float *)v194 + 6)) + 0.0;
        v340[60] = v283;
        float v284 = v281 + (float)(v246 * *((float *)v194 + 7));
        v340[58] = v284;
        float v285 = v282 + (float)(v247 * *((float *)v194 + 7));
        v340[59] = v285;
        float v286 = v283 + (float)(v248 * *((float *)v194 + 7));
        v340[60] = v286;
        v340[58] = v284 + (float)(v249 * *((float *)v194 + 8));
        v340[59] = v285 + (float)(v250 * *((float *)v194 + 8));
        v340[60] = v286 + (float)((float)(v242 * 0.5) * *((float *)v194 + 8));
        free(v193);
        float32x4_t v287 = v194;
        a4 = (uint64_t)v340;
        free(v287);
        uint64_t v117 = a1 + 2056;
      }
      else
      {
        *(_DWORD *)(a4 + 96) = 0;
        memset_pattern16((void *)(a4 + 100), &unk_21BB7CEE0, 0x90uLL);
      }
      vl_dump_detail(v341, a1, (double *)(*(void *)(a1 + 1016) + 288));
      long long v288 = v343;
      *(_OWORD *)a4 = v342;
      *(_OWORD *)(a4 + 16) = v288;
      long long v289 = v345;
      *(_OWORD *)(a4 + 32) = v344;
      *(_OWORD *)(a4 + 48) = v289;
      long long v290 = v347;
      *(_OWORD *)(a4 + 64) = v346;
      *(_OWORD *)(a4 + 80) = v290;
      long long v291 = *(_OWORD *)(a4 + 128);
      long long v292 = *(_OWORD *)(a4 + 144);
      long long v293 = *(_OWORD *)(a4 + 160);
      *(_OWORD *)(a1 + 14608) = *(_OWORD *)(a4 + 176);
      *(_OWORD *)(a1 + 14592) = v293;
      *(_OWORD *)(a1 + 14576) = v292;
      *(_OWORD *)(a1 + 14560) = v291;
      long long v294 = *(_OWORD *)(a4 + 192);
      long long v295 = *(_OWORD *)(a4 + 208);
      long long v296 = *(_OWORD *)(a4 + 224);
      *(void *)(a1 + 14672) = *(void *)(a4 + 240);
      *(_OWORD *)(a1 + 14656) = v296;
      *(_OWORD *)(a1 + 14640) = v295;
      *(_OWORD *)(a1 + 14624) = v294;
      long long v298 = *(_OWORD *)(a4 + 32);
      long long v297 = *(_OWORD *)(a4 + 48);
      long long v299 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)(a1 + 14432) = *(_OWORD *)a4;
      *(_OWORD *)(a1 + 14448) = v299;
      *(_OWORD *)(a1 + 14464) = v298;
      long long v300 = *(_OWORD *)(a4 + 96);
      long long v301 = *(_OWORD *)(a4 + 112);
      long long v302 = *(_OWORD *)(a4 + 80);
      *(_OWORD *)(a1 + 14496) = *(_OWORD *)(a4 + 64);
      *(_OWORD *)(a1 + 14544) = v301;
      *(_OWORD *)(a1 + 14528) = v300;
      *(_OWORD *)(a1 + 14480) = v297;
      *(_OWORD *)(a1 + 14512) = v302;
      int v21 = v337;
      if (*(_DWORD *)(a1 + 976)) {
        update_history(a1 + 11664, v44, (long long *)a4, v338, a3, (long long *)(*(void *)(a1 + 1016) + 288), v117, (uint64_t)v339, *(void *)(a1 + 1016), a1);
      }
      update_tracker_meta(a1 + 6992, a3, v117, *(_OWORD **)(a1 + 1016), (long long *)a4, v44, a1);
      vl_dump_result(v341, a4, (_OWORD *)(*(void *)(a1 + 1016) + 4), v44);
      vl_dump_stats(v341, a1);
      if (*(_DWORD *)(a1 + 12080)
        && (*(unsigned char *)(a1 + 12084) & 8) != 0
        && *(_DWORD *)(a1 + 12112)
        && *(unsigned char *)(a1 + 12628))
      {
        vl_t_print(a1, v341, 0);
      }
LABEL_54:
      vl_timer_stop((uint64_t)v21);
      if (*(_DWORD *)(a1 + 12076))
      {
        printf("Verbose : ");
        printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 12012), (double)*(uint64_t *)(a1 + 11984) * 0.000001);
        putchar(10);
        if (vl_os_log_once_token == -1) {
          goto LABEL_56;
        }
      }
      else
      {
        log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v48, v49, v50, v51, v52, v53, v54, (char)&str_4_1);
        if (vl_os_log_once_token == -1) {
          goto LABEL_56;
        }
      }
      dispatch_once(&vl_os_log_once_token, &__block_literal_global_4);
LABEL_56:
      uint64_t v55 = vl_os_log_log;
      os_signpost_id_t v56 = os_signpost_id_make_with_pointer((os_log_t)vl_os_log_log, ptr);
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v57 = v56;
        if (os_signpost_enabled(v55))
        {
          LOWORD(buf[0].tv_sec) = 0;
          _os_signpost_emit_with_name_impl(&dword_21BAD2000, v55, OS_SIGNPOST_INTERVAL_END, v57, "vl_locate", (const char *)&unk_21BB79E01, (uint8_t *)buf, 2u);
        }
      }
      return v44;
  }
}

uint64_t update_tracker(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v45 = 0;
  memset(v44, 0, sizeof(v44));
  int v9 = *(_DWORD *)(a4 + 4);
  if (v9 == 1) {
    size_t v10 = 64;
  }
  else {
    size_t v10 = 256;
  }
  long long v38 = 0uLL;
  long long v39 = 0uLL;
  float64x2_t v37 = 0uLL;
  if (*(_DWORD *)(a1 + 212))
  {
    *(void *)(a1 + 120) -= mach_absolute_time();
  }
  else
  {
    clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 32));
    clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 16));
    clock_gettime(_CLOCK_MONOTONIC, (timespec *)a1);
  }
  uint64_t v11 = *a3;
  long double v12 = malloc_type_malloc(8 * *a3, 0xF8770C40uLL);
  if (v9 == 1) {
    char v13 = 6;
  }
  else {
    char v13 = 8;
  }
  uint64_t v14 = (char *)malloc_type_malloc(*a3 << v13, 0xC392F6A1uLL);
  v40[0] = v11;
  v40[1] = v10;
  uint64_t v41 = v12;
  int32x4_t v42 = v14;
  uint64_t v43 = 0;
  if (*a3 >= 1)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = (void *)(a3[1] + v16);
      *((void *)v12 + v17) = *v18;
      memcpy(&v15[v17++ << v13], v18 + 4, v10);
      v16 += 288;
    }
    while (*a3 > v17);
  }
  if (!*a5)
  {
    uint64_t v19 = (char *)malloc_type_calloc(1uLL, 0x3E8uLL, 0x10B004018FDDA7FuLL);
    *((void *)v19 + 38) = malloc_type_calloc(*(int *)(a4 + 672), 0x370uLL, 0x10B0040F0DEE453uLL);
    *((_DWORD *)v19 + 148) = -1;
    memcpy(v19, (const void *)(a4 + 672), 0x130uLL);
    *(_OWORD *)(v19 + 712) = xmmword_21BB7A730;
    *(_OWORD *)(v19 + 728) = xmmword_21BB7A730;
    *(_OWORD *)(v19 + 744) = xmmword_21BB7A730;
    long long v20 = *(_OWORD *)(v19 + 728);
    *(_OWORD *)(v19 + 760) = *(_OWORD *)(v19 + 712);
    *(_OWORD *)(v19 + 776) = v20;
    *(_OWORD *)(v19 + 792) = *(_OWORD *)(v19 + 744);
    *a5 = (uint64_t)v19;
  }
  g_proj2_to_g_proj(a2 + 24, (uint64_t)v44, 0, 0);
  float64x2_t v37 = vcvtq_f64_f32(*(float32x2_t *)(a2 + 292));
  *(double *)&long long v38 = *(float *)(a2 + 300);
  float v21 = *(float *)(a2 + 280);
  if (fabsf(v21) >= 1.0)
  {
    float v27 = *(float *)(a2 + 260);
    if (v21 <= -1.0)
    {
      float v24 = atan2f(v27, *(float *)(a2 + 264)) + 0.0;
      double v25 = 0.0;
      double v26 = 1.57079637;
    }
    else
    {
      float v24 = atan2f(-v27, -*(float *)(a2 + 264));
      double v25 = 0.0;
      double v26 = -1.57079637;
    }
  }
  else
  {
    float v22 = asinf(-v21);
    float v23 = atan2f(*(float *)(a2 + 268), *(float *)(a2 + 256));
    float v24 = atan2f(*(float *)(a2 + 284), *(float *)(a2 + 288));
    double v25 = v23;
    double v26 = v22;
  }
  *((double *)&v38 + 1) = v25;
  *(double *)&long long v39 = v26;
  *((double *)&v39 + 1) = v24;
  slam_tracker_vo_add(*a5, v37.f64, 0, (uint64_t)v44, *(_DWORD *)(a2 + 192), *(_DWORD *)(a2 + 196), v40, 0, 0.0, 0, 0, 0, 0, 0, 0);
  free(v41);
  free(v42);
  printf("Verbose : ");
  printf("Update slam vio tracker: %d track points", *(void *)(*a5 + 368));
  putchar(10);
  vl_timer_stop(a1);
  if (!*(_DWORD *)(a1 + 212)) {
    return log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v28, v29, v30, v31, v32, v33, v34, (char)&str_4_1);
  }
  printf("Verbose : ");
  printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 148), (double)*(uint64_t *)(a1 + 120) * 0.000001);
  return putchar(10);
}

void update_tracker_meta(uint64_t a1, long long *a2, uint64_t a3, _OWORD *a4, long long *a5, int a6, uint64_t a7)
{
  long long v11 = 0uLL;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  uint64_t v99 = 0;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v84 = 0u;
  if (a4)
  {
    vl_inliers_clone((uint64_t)&v107, a3);
    long long v11 = *(_OWORD *)((char *)a4 + 4);
    long long v104 = a4[22];
    long long v105 = a4[23];
    long long v106 = a4[24];
    long long v100 = a4[18];
    long long v101 = a4[19];
    long long v102 = a4[20];
    long long v103 = a4[21];
    long long v86 = a5[2];
    long long v87 = a5[3];
    long long v84 = *a5;
    long long v85 = a5[1];
    long long v90 = a5[6];
    long long v91 = a5[7];
    long long v88 = a5[4];
    long long v89 = a5[5];
    long long v94 = a5[10];
    long long v95 = a5[11];
    long long v92 = a5[8];
    long long v93 = a5[9];
    uint64_t v99 = *((void *)a5 + 30);
    long long v97 = a5[13];
    long long v98 = a5[14];
    long long v96 = a5[12];
  }
  if (a6 == 1) {
    *(_DWORD *)(a1 + 372) = 1;
  }
  uint64_t v14 = *(void *)(a1 + 216);
  uint64_t v15 = *(void *)(a1 + 232);
  long long v83 = v11;
  if (v14 >= v15)
  {
    if (v15) {
      uint64_t v16 = 2 * v15;
    }
    else {
      uint64_t v16 = 1;
    }
    if (v16 <= v14) {
      uint64_t v17 = v14 + 1;
    }
    else {
      uint64_t v17 = v16;
    }
    if (v17)
    {
      uint64_t v18 = malloc_type_realloc(*(void **)(a1 + 224), 168 * v17, 0xD7E3667EuLL);
      long long v11 = v83;
      *(void *)(a1 + 224) = v18;
      uint64_t v14 = *(void *)(a1 + 216);
    }
    *(void *)(a1 + 232) = v17;
  }
  *(void *)(a1 + 216) = v14 + 1;
  uint64_t v19 = *(void *)(a1 + 224) + 168 * v14;
  long long v20 = a2[2];
  long long v21 = *a2;
  *(_OWORD *)(v19 + 16) = a2[1];
  *(_OWORD *)(v19 + 32) = v20;
  long long v22 = a2[3];
  long long v23 = a2[4];
  long long v24 = a2[6];
  *(_OWORD *)(v19 + 80) = a2[5];
  *(_OWORD *)(v19 + 96) = v24;
  *(_OWORD *)(v19 + 48) = v22;
  *(_OWORD *)(v19 + 64) = v23;
  long long v25 = a2[7];
  long long v26 = a2[8];
  long long v27 = a2[9];
  *(void *)(v19 + 160) = *((void *)a2 + 20);
  *(_OWORD *)(v19 + 128) = v26;
  *(_OWORD *)(v19 + 144) = v27;
  *(_OWORD *)(v19 + 112) = v25;
  *(_OWORD *)uint64_t v19 = v21;
  uint64_t v28 = *(void *)(a1 + 240);
  uint64_t v29 = *(void *)(a1 + 256);
  if (v28 >= v29)
  {
    uint64_t v30 = 2 * v29;
    BOOL v31 = v29 == 0;
    uint64_t v32 = 3;
    if (!v31) {
      uint64_t v32 = v30;
    }
    if (v32 <= v28) {
      uint64_t v33 = v28 + 1;
    }
    else {
      uint64_t v33 = v32;
    }
    if (v33)
    {
      uint64_t v34 = malloc_type_realloc(*(void **)(a1 + 248), 80 * v33, 0x7F86C945uLL);
      long long v11 = v83;
      *(void *)(a1 + 248) = v34;
      uint64_t v28 = *(void *)(a1 + 240);
    }
    *(void *)(a1 + 256) = v33;
  }
  *(void *)(a1 + 240) = v28 + 1;
  long long v35 = (_OWORD *)(*(void *)(a1 + 248) + 80 * v28);
  long long v36 = v111;
  long long v37 = v109;
  v35[3] = v110;
  double v35[4] = v36;
  long long v38 = v108;
  *long long v35 = v107;
  v35[1] = v38;
  v35[2] = v37;
  uint64_t v39 = *(void *)(a1 + 264);
  uint64_t v40 = *(void *)(a1 + 280);
  if (v39 >= v40)
  {
    uint64_t v41 = 2 * v40;
    BOOL v31 = v40 == 0;
    uint64_t v42 = 16;
    if (!v31) {
      uint64_t v42 = v41;
    }
    if (v42 <= v39) {
      uint64_t v43 = v39 + 1;
    }
    else {
      uint64_t v43 = v42;
    }
    if (v43)
    {
      uint64_t v44 = malloc_type_realloc(*(void **)(a1 + 272), 16 * v43, 0x30DC2C38uLL);
      long long v11 = v83;
      *(void *)(a1 + 272) = v44;
      uint64_t v39 = *(void *)(a1 + 264);
    }
    *(void *)(a1 + 280) = v43;
  }
  *(void *)(a1 + 264) = v39 + 1;
  *(_OWORD *)(*(void *)(a1 + 272) + 16 * v39) = v11;
  uint64_t v45 = *(void *)(a1 + 288);
  uint64_t v46 = *(void *)(a1 + 304);
  if (v45 >= v46)
  {
    uint64_t v47 = 2 * v46;
    BOOL v31 = v46 == 0;
    uint64_t v48 = 2;
    if (!v31) {
      uint64_t v48 = v47;
    }
    if (v48 <= v45) {
      uint64_t v49 = v45 + 1;
    }
    else {
      uint64_t v49 = v48;
    }
    if (v49)
    {
      *(void *)(a1 + 296) = malloc_type_realloc(*(void **)(a1 + 296), 112 * v49, 0x37CD1277uLL);
      uint64_t v45 = *(void *)(a1 + 288);
    }
    *(void *)(a1 + 304) = v49;
  }
  *(void *)(a1 + 288) = v45 + 1;
  uint64_t v50 = (_OWORD *)(*(void *)(a1 + 296) + 112 * v45);
  *uint64_t v50 = v100;
  v50[1] = v101;
  v50[5] = v105;
  v50[6] = v106;
  v50[2] = v102;
  v50[3] = v103;
  v50[4] = v104;
  uint64_t v51 = *(void *)(a1 + 312);
  uint64_t v52 = *(void *)(a1 + 328);
  if (v51 >= v52)
  {
    if (v52) {
      uint64_t v53 = 2 * v52;
    }
    else {
      uint64_t v53 = 1;
    }
    if (v53 <= v51) {
      uint64_t v54 = v51 + 1;
    }
    else {
      uint64_t v54 = v53;
    }
    if (v54)
    {
      *(void *)(a1 + 320) = malloc_type_realloc(*(void **)(a1 + 320), 248 * v54, 0x28A0E52AuLL);
      uint64_t v51 = *(void *)(a1 + 312);
    }
    *(void *)(a1 + 328) = v54;
  }
  *(void *)(a1 + 312) = v51 + 1;
  uint64_t v55 = *(void *)(a1 + 320) + 248 * v51;
  *(_OWORD *)(v55 + 192) = v96;
  *(_OWORD *)(v55 + 208) = v97;
  *(_OWORD *)(v55 + 224) = v98;
  *(void *)(v55 + 240) = v99;
  *(_OWORD *)(v55 + 128) = v92;
  *(_OWORD *)(v55 + 144) = v93;
  *(_OWORD *)(v55 + 160) = v94;
  *(_OWORD *)(v55 + 176) = v95;
  *(_OWORD *)(v55 + 64) = v88;
  *(_OWORD *)(v55 + 80) = v89;
  *(_OWORD *)(v55 + 96) = v90;
  *(_OWORD *)(v55 + 112) = v91;
  *(_OWORD *)uint64_t v55 = v84;
  *(_OWORD *)(v55 + 16) = v85;
  *(_OWORD *)(v55 + 32) = v86;
  *(_OWORD *)(v55 + 48) = v87;
  uint64_t v56 = *(void *)(a1 + 336);
  uint64_t v57 = *(void *)(a1 + 352);
  if (v56 >= v57)
  {
    uint64_t v58 = 2 * v57;
    BOOL v31 = v57 == 0;
    uint64_t v59 = 64;
    if (!v31) {
      uint64_t v59 = v58;
    }
    if (v59 <= v56) {
      uint64_t v60 = v56 + 1;
    }
    else {
      uint64_t v60 = v59;
    }
    if (v60)
    {
      *(void *)(a1 + 344) = malloc_type_realloc(*(void **)(a1 + 344), 4 * v60, 0x68464711uLL);
      uint64_t v56 = *(void *)(a1 + 336);
    }
    *(void *)(a1 + 352) = v60;
  }
  *(void *)(a1 + 336) = v56 + 1;
  *(_DWORD *)(*(void *)(a1 + 344) + 4 * v56) = a6;
  int v61 = *(_DWORD *)(a1 + 364) + 1;
  *(_DWORD *)(a1 + 364) = v61;
  ++*(_DWORD *)(a1 + 360);
  uint64_t v62 = *(int *)(a7 + 652);
  if (v61 >= (int)v62 && *(_DWORD *)(a1 + 372))
  {
    *(_DWORD *)(a1 + 364) = 0;
    *(void *)(a1 + 368) = 1;
    uint64_t v63 = *(void *)(a1 + 216);
    if (v63 <= v62) {
      return;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 368) = 0;
    uint64_t v63 = *(void *)(a1 + 216);
    if (v63 <= v62) {
      return;
    }
  }
  uint64_t v64 = v63 - 1;
  if (v63 != 1)
  {
    memmove(*(void **)(a1 + 224), (const void *)(*(void *)(a1 + 224) + 168), 168 * v64);
    uint64_t v64 = *(void *)(a1 + 216) - 1;
  }
  *(void *)(a1 + 216) = v64;
  uint64_t v65 = *(void *)(a1 + 240);
  if (v65 < 1)
  {
    uint64_t v68 = 0;
    goto LABEL_74;
  }
  __darwin_time_t v66 = *(void ***)(a1 + 248);
  free(v66[1]);
  free(v66[4]);
  free(v66[7]);
  uint64_t v65 = *(void *)(a1 + 240);
  if (v65 >= 2)
  {
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    do
    {
      uint64_t v69 = (_OWORD *)(*(void *)(a1 + 248) + v67);
      long long v70 = v69[9];
      long long v71 = v69[7];
      v69[3] = v69[8];
      v69[4] = v70;
      long long v72 = v69[6];
      *uint64_t v69 = v69[5];
      v69[1] = v72;
      v69[2] = v71;
      uint64_t v73 = v68 + 2;
      ++v68;
      uint64_t v65 = *(void *)(a1 + 240);
      v67 += 80;
    }
    while (v73 < v65);
LABEL_74:
    uint64_t v74 = *(void *)(a1 + 256);
    if (v68 <= v74) {
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  uint64_t v68 = 0;
  uint64_t v74 = *(void *)(a1 + 256);
  if (v74 >= 0)
  {
LABEL_75:
    uint64_t v75 = v68 - v65;
    if (v68 <= v65) {
      goto LABEL_76;
    }
LABEL_95:
    bzero((void *)(*(void *)(a1 + 248) + 80 * *(void *)(a1 + 240)), 80 * v75);
    *(void *)(a1 + 240) = v68;
    uint64_t v76 = *(void *)(a1 + 264) - 1;
    if (*(void *)(a1 + 264) == 1) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_87:
  uint64_t v80 = 2 * v74;
  BOOL v31 = v74 == 0;
  uint64_t v81 = 3;
  if (!v31) {
    uint64_t v81 = v80;
  }
  if (v81 <= v68) {
    uint64_t v82 = v68;
  }
  else {
    uint64_t v82 = v81;
  }
  if (v82) {
    *(void *)(a1 + 248) = malloc_type_realloc(*(void **)(a1 + 248), 80 * v82, 0x487A3CEuLL);
  }
  *(void *)(a1 + 256) = v82;
  uint64_t v75 = v68 - v65;
  if (v68 > v65) {
    goto LABEL_95;
  }
LABEL_76:
  *(void *)(a1 + 240) = v68;
  uint64_t v76 = *(void *)(a1 + 264) - 1;
  if (*(void *)(a1 + 264) != 1)
  {
LABEL_77:
    memmove(*(void **)(a1 + 272), (const void *)(*(void *)(a1 + 272) + 16), 16 * v76);
    uint64_t v76 = *(void *)(a1 + 264) - 1;
  }
LABEL_78:
  *(void *)(a1 + 264) = v76;
  uint64_t v77 = *(void *)(a1 + 288) - 1;
  if (*(void *)(a1 + 288) != 1)
  {
    memmove(*(void **)(a1 + 296), (const void *)(*(void *)(a1 + 296) + 112), 112 * v77);
    uint64_t v77 = *(void *)(a1 + 288) - 1;
  }
  *(void *)(a1 + 288) = v77;
  uint64_t v78 = *(void *)(a1 + 312) - 1;
  if (*(void *)(a1 + 312) != 1)
  {
    memmove(*(void **)(a1 + 320), (const void *)(*(void *)(a1 + 320) + 248), 248 * v78);
    uint64_t v78 = *(void *)(a1 + 312) - 1;
  }
  *(void *)(a1 + 312) = v78;
  uint64_t v79 = *(void *)(a1 + 336) - 1;
  if (*(void *)(a1 + 336) != 1)
  {
    memmove(*(void **)(a1 + 344), (const void *)(*(void *)(a1 + 344) + 4), 4 * v79);
    uint64_t v79 = *(void *)(a1 + 336) - 1;
  }
  *(void *)(a1 + 336) = v79;
}

uint64_t update_history(uint64_t a1, int a2, long long *a3, uint64_t a4, long long *a5, long long *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  bzero(v47, 0x360uLL);
  long long v18 = a3[13];
  long long v61 = a3[12];
  long long v62 = v18;
  long long v63 = a3[14];
  uint64_t v19 = *((void *)a3 + 30);
  long long v20 = a3[9];
  long long v57 = a3[8];
  long long v58 = v20;
  long long v21 = a3[11];
  long long v59 = a3[10];
  long long v60 = v21;
  long long v22 = a3[5];
  long long v53 = a3[4];
  long long v54 = v22;
  long long v23 = a3[7];
  long long v55 = a3[6];
  long long v56 = v23;
  long long v24 = a3[1];
  long long v49 = *a3;
  long long v50 = v24;
  long long v25 = a3[3];
  long long v51 = a3[2];
  long long v52 = v25;
  long long v26 = *(_OWORD *)(a4 + 136);
  long long v27 = *(_OWORD *)(a4 + 168);
  long long v73 = *(_OWORD *)(a4 + 152);
  long long v74 = v27;
  long long v75 = *(_OWORD *)(a4 + 184);
  long long v28 = *(_OWORD *)(a4 + 72);
  long long v29 = *(_OWORD *)(a4 + 104);
  long long v69 = *(_OWORD *)(a4 + 88);
  long long v70 = v29;
  long long v71 = *(_OWORD *)(a4 + 120);
  long long v72 = v26;
  long long v30 = *(_OWORD *)(a4 + 40);
  long long v65 = *(_OWORD *)(a4 + 24);
  long long v66 = v30;
  long long v67 = *(_OWORD *)(a4 + 56);
  long long v68 = v28;
  int v48 = a2;
  long long v31 = a5[9];
  long long v85 = a5[8];
  long long v86 = v31;
  long long v32 = a5[5];
  long long v81 = a5[4];
  long long v82 = v32;
  long long v33 = a5[7];
  long long v83 = a5[6];
  long long v84 = v33;
  long long v34 = a5[1];
  long long v77 = *a5;
  long long v78 = v34;
  long long v35 = a5[3];
  long long v79 = a5[2];
  long long v80 = v35;
  uint64_t v36 = *((void *)a5 + 20);
  uint64_t v64 = v19;
  uint64_t v87 = v36;
  if (a9) {
    long long v76 = *(_OWORD *)(a9 + 4);
  }
  uint64_t v37 = *(void *)a8;
  if (*(uint64_t *)a8 <= 0)
  {
    long long v88 = 0u;
    uint64_t v89 = v37;
    goto LABEL_8;
  }
  long long v38 = malloc_type_malloc(288 * v37, 0x5FA3D4E9uLL);
  *((void *)&v88 + 1) = v38;
  uint64_t v37 = *(void *)a8;
  uint64_t v89 = v37;
  if (v37 <= 0)
  {
LABEL_8:
    uint64_t v41 = a10;
    *(void *)&long long v88 = v37;
    goto LABEL_9;
  }
  uint64_t v39 = v38;
  bzero(v38, 288 * v37);
  uint64_t v40 = *(void *)a8;
  *(void *)&long long v88 = v40;
  uint64_t v41 = a10;
  if (v40 >= 1) {
    memcpy(v39, *(const void **)(a8 + 8), 288 * v40);
  }
LABEL_9:
  if (a7)
  {
    long long v42 = a6[5];
    long long v94 = a6[4];
    long long v95 = v42;
    long long v96 = a6[6];
    long long v43 = a6[1];
    long long v90 = *a6;
    long long v91 = v43;
    long long v44 = a6[2];
    long long v93 = a6[3];
    long long v92 = v44;
    vl_inliers_clone((uint64_t)&v97, a7);
  }
  vl_context_history_add_frame(a1, v47);
  int v45 = *(_DWORD *)(v41 + 980);
  return vl_context_history_trim(a1, v45);
}

void vl_inliers_clone(uint64_t a1, uint64_t a2)
{
  if (*(uint64_t *)a2 >= 1)
  {
    int32x4_t v4 = malloc_type_malloc(8 * *(void *)a2, 0x26162EF0uLL);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = v4;
    uint64_t v5 = *(void *)a2;
    *(void *)(a1 + 16) = *(void *)a2;
    if (v5 < 1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int32x4_t v4 = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  uint64_t v5 = *(void *)a2;
  *(void *)(a1 + 16) = *(void *)a2;
  if (v5 >= 1)
  {
LABEL_3:
    bzero(v4, 8 * v5);
    uint64_t v5 = *(void *)a2;
  }
LABEL_4:
  *(void *)a1 = v5;
  if (*(uint64_t *)a2 >= 1) {
    memcpy(*(void **)(a1 + 8), *(const void **)(a2 + 8), 8 * *(void *)a2);
  }
  uint64_t v6 = *(void *)(a2 + 24);
  if (v6 >= 1)
  {
    int v7 = malloc_type_malloc(12 * v6, 0x94AB6477uLL);
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = v7;
    uint64_t v8 = *(void *)(a2 + 24);
    *(void *)(a1 + 40) = v8;
    if (v8 < 1) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int v7 = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 40) = v8;
  if (v8 >= 1)
  {
LABEL_8:
    bzero(v7, 12 * v8);
    uint64_t v8 = *(void *)(a2 + 24);
  }
LABEL_9:
  *(void *)(a1 + 24) = v8;
  uint64_t v9 = *(void *)(a2 + 24);
  if (v9 >= 1) {
    memcpy(*(void **)(a1 + 32), *(const void **)(a2 + 32), 12 * v9);
  }
  uint64_t v10 = *(void *)(a2 + 48);
  if (v10 >= 1)
  {
    long long v11 = malloc_type_malloc(8 * v10, 0x37168EFEuLL);
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = v11;
    uint64_t v12 = *(void *)(a2 + 48);
    *(void *)(a1 + 64) = v12;
    if (v12 < 1) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  long long v11 = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  uint64_t v12 = *(void *)(a2 + 48);
  *(void *)(a1 + 64) = v12;
  if (v12 >= 1)
  {
LABEL_13:
    bzero(v11, 8 * v12);
    uint64_t v12 = *(void *)(a2 + 48);
  }
LABEL_14:
  *(void *)(a1 + 48) = v12;
  uint64_t v13 = *(void *)(a2 + 48);
  if (v13 >= 1)
  {
    uint64_t v14 = *(void **)(a1 + 56);
    uint64_t v15 = *(const void **)(a2 + 56);
    memcpy(v14, v15, 8 * v13);
  }
}

void log_msg(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6, ...)
{
  va_start(va, a6);
  log_msg_internal(a1, a2, a3, a4, a5, 0, 0, a6, va);
}

uint64_t log_console_fmt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, FILE *a9)
{
  int v9 = MEMORY[0x270FA5388]();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  long long v52 = v14;
  uint64_t v16 = v15;
  int v18 = v17;
  long long v20 = v19;
  char v22 = v21;
  int v23 = v9;
  uint64_t v59 = *MEMORY[0x263EF8340];
  memset(v58, 0, sizeof(v58));
  memset(v57, 0, sizeof(v57));
  bzero(&v55[0].tm_isdst, 0x400uLL);
  *(void *)&v55[0].tm_sec = 0;
  *(void *)&v55[0].tm_hour = 0;
  double v53 = 0.0;
  uint64_t v54 = 0;
  if ((v22 & 2) != 0)
  {
    *(void *)&v56.tv_usec = 0;
    v56.tv_sec = 0;
    if (gettimeofday(&v56, 0) || (double)(v56.tv_usec + 1000000 * v56.tv_sec) / 1000000.0 <= 1514764800.0) {
      __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
    }
    int v25 = __sprintf_chk((char *)&v56, 0, 0x2728uLL, "(");
    long long v26 = strrchr(v20, 47);
    if (v26) {
      long long v27 = v26 + 1;
    }
    else {
      long long v27 = v20;
    }
    if (v25 <= 1) {
      long long v28 = (const char *)&unk_21BB738AE;
    }
    else {
      long long v28 = " ";
    }
    if (v25 <= 1) {
      size_t v29 = 1;
    }
    else {
      size_t v29 = 2;
    }
    uint64_t v30 = v11;
    if (v25 <= 1) {
      uint64_t v31 = v25;
    }
    else {
      uint64_t v31 = v25 + 1;
    }
    memcpy((char *)&v56 + v25, v28, v29);
    int v32 = v31 + sprintf((char *)&v56 + v31, "%s:%d", v27, v18);
    uint64_t v11 = v30;
    if (v32 <= 1) {
      long long v33 = (const char *)&unk_21BB738AE;
    }
    else {
      long long v33 = " ";
    }
    if (v32 <= 1) {
      size_t v34 = 1;
    }
    else {
      size_t v34 = 2;
    }
    if (v32 <= 1) {
      int v35 = v32;
    }
    else {
      int v35 = v32 + 1;
    }
    memcpy((char *)&v56 + v32, v33, v34);
    size_t v36 = strlen(v16);
    int v37 = v36;
    memcpy((char *)&v56 + v35, v16, v36 + 1);
    *(_WORD *)((char *)&v56.tv_sec + v35 + v37) = 41;
    int v24 = v35 + v37 + 1;
  }
  else
  {
    int v24 = 0;
    LOBYTE(v56.tv_sec) = 0;
  }
  int v38 = 31;
  int v39 = v23;
  switch(v23)
  {
    case 1:
      goto LABEL_32;
    case 2:
      int v39 = 0;
      int v38 = 33;
      goto LABEL_32;
    case 3:
      LOBYTE(v58[0]) = 0;
      goto LABEL_33;
    case 4:
      int v38 = 35;
      int v39 = 1;
      goto LABEL_32;
    case 5:
      int v39 = 0;
      int v38 = 35;
LABEL_32:
      __sprintf_chk((char *)v58, 0, 0x20uLL, "%c[%d;%dm", 27, v39, v38);
LABEL_33:
      __sprintf_chk((char *)v57, 0, 0x20uLL, "%c[0m", 27);
      long long v51 = off_2643BA3D0[v23];
      if (v11)
      {
        strcpy((char *)&v55[0].tm_isdst, "  ");
        int v40 = snprintf((char *)&v55[0].tm_isdst + 2, 0x3FEuLL, "%s=", *v13);
        uint64_t v41 = v40 + 2;
        int v42 = snprintf_log_field_value((char *)&v55[0].tm_isdst + v41, 1022 - v40, (uint64_t)v13);
        uint64_t v43 = v11 - 1;
        if (v11 != 1)
        {
          uint64_t v44 = v41 + v42;
          uint64_t v45 = (uint64_t)(v13 + 3);
          uint64_t v46 = v13 + 3;
          do
          {
            uint64_t v47 = v44 + snprintf((char *)&v55[0].tm_isdst + v44, 1024 - v44, ", ");
            int v48 = *v46;
            v46 += 3;
            uint64_t v49 = v47 + snprintf((char *)&v55[0].tm_isdst + v47, 1024 - v47, "%s=", v48);
            uint64_t v44 = v49 + (int)snprintf_log_field_value((char *)&v55[0].tm_isdst + v49, 1024 - (int)v49, v45);
            uint64_t v45 = (uint64_t)v46;
            --v43;
          }
          while (v43);
        }
      }
      if (v24 >= 1024) {
        log_msg(2, 0, "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/util/log.c", 697, "log_console_fmt", "Exceeded log field buffer %d >= %d. Next log line will be cut short.", v24, 1024);
      }
      *(void *)&v55[0].tm_mon = 0;
      *(void *)&v55[0].tm_wday = 0;
      gettimeofday((timeval *)&v55[0].tm_mon, 0);
      v55[0].tm_sec = *(void *)&v55[0].tm_mon / 86400;
      *(double *)&v55[0].tm_hour = (double)v55[0].tm_wday / 1000.0 / 1000.0
                                 + (double)(*(void *)&v55[0].tm_mon - 86400 * v55[0].tm_sec);
      dtime_get(v55, 0, 0, 0, (int *)&v54 + 1, (int *)&v54, &v53, 1000000);
      fprintf(a9, "%02d:%02d:%02d %s%-7s%s: %s%s%s\n", HIDWORD(v54), v54, (int)v53, (const char *)v58, v51, (const char *)&v56, v52, (const char *)&v55[0].tm_isdst, (const char *)v57);
      return fflush(a9);
    default:
      abort();
  }
}

uint64_t log_to_other_targets_lf(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (targets[0])
  {
    uint64_t v15 = result;
    if (pthread_rwlock_rdlock(&targets_lock)) {
      __assert_rtn("log_to_other_targets_lf", "log.c", 874, "err == 0 && \"Could not acquire lock of targets variable. Has log been initialized?\"");
    }
    uint64_t v16 = targets[0];
    if (targets[0])
    {
      unint64_t v17 = 0;
      do
      {
        if (*(_DWORD *)(v16 + 32) >= v15)
        {
          int v18 = *(_DWORD *)(v16 + 8);
          if (v18 == 1)
          {
            (*(void (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v16)(*(void *)(v16 + 24), *(unsigned int *)(v16 + 36), v15, a2, a3, a4, a5, a6, a7, a8);
          }
          else if (!v18)
          {
            (*(void (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v16)(*(void *)(v16 + 24), *(unsigned int *)(v16 + 36), v15, a2, a3, a4, a5, a6, v20, v21);
          }
        }
        if (v17 > 8) {
          break;
        }
        uint64_t v19 = &targets[v17++];
        uint64_t v16 = v19[1];
      }
      while (v16);
    }
    double result = pthread_rwlock_unlock(&targets_lock);
    if (result) {
      __assert_rtn("log_to_other_targets_lf", "log.c", 888, "err == 0 && \"Could not release log lock\"");
    }
  }
  return result;
}

__darwin_time_t toc_explicit(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, const char *a8, char a9)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (a1 <= 3)
  {
    *(void *)size_t v36 = 0;
    uint64_t v37 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    *(_OWORD *)int v32 = 0u;
    long long v33 = 0u;
    v38.tv_sec = 0;
    *(void *)&v38.tv_usec = 0;
    if (gettimeofday(&v38, 0) || (__darwin_time_t v17 = v38.tv_usec + 1000000 * v38.tv_sec, (double)v17 / 1000000.0 <= 1514764800.0)) {
LABEL_38:
    }
      __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
    uint64_t v18 = v17 - a2;
    vsnprintf(__str, 0x400uLL, a8, &a9);
    if (a3)
    {
      if (v18 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v18;
      }
      snprintf(v36, 0x10uLL, " = %8d Hz", llround(1000000.0 / (double)v19));
    }
    if (a4)
    {
      uint64_t v20 = fopen("/proc/self/status", "rt");
      if (v20)
      {
        uint64_t v21 = v20;
        while (fgets((char *)&v38, 512, v21))
        {
          if (LODWORD(v38.tv_sec) == *(_DWORD *)"VmRSS:" && WORD2(v38.tv_sec) == *(unsigned __int16 *)"S:")
          {
            uint64_t v23 = atol((const char *)&v38.tv_sec + 6);
            goto LABEL_21;
          }
        }
        uint64_t v23 = -1;
LABEL_21:
        fclose(v21);
      }
      else
      {
        uint64_t v23 = -1;
      }
      double v24 = (double)v23;
      double v25 = (double)v23 * 0.000000953674316;
      double v26 = ((double)v23 - *(double *)&toc_explicit_last_mem_usage) * 0.000000953674316;
      long long v27 = fopen("/proc/self/status", "rt");
      if (v27)
      {
        long long v28 = v27;
        while (fgets((char *)&v38, 512, v28))
        {
          if (LODWORD(v38.tv_sec) == *(_DWORD *)"VmSize:" && *(_DWORD *)((char *)&v38.tv_sec + 3) == *(_DWORD *)"ize:")
          {
            uint64_t v30 = atol((const char *)&v38.tv_sec + 7);
            goto LABEL_33;
          }
        }
        uint64_t v30 = -1;
LABEL_33:
        fclose(v28);
      }
      else
      {
        uint64_t v30 = -1;
      }
      snprintf(v32, 0x40uLL, ", RSS = %6.2f GB (delta: %6.2f GB), VM = %6.2f GB", v25, v26, (double)v30 * 0.000000953674316);
      toc_explicit_last_mem_usage = *(void *)&v24;
    }
    snprintf((char *)&v38, 0x800uLL, "toc: %12.2f ms%s%s (%s)", (double)v18 * 0.001, v36, v32, __str);
    log_msg(a1, 0, a5, a6, a7, "%s", (const char *)&v38);
  }
  v38.tv_sec = 0;
  *(void *)&v38.tv_usec = 0;
  if (gettimeofday(&v38, 0)) {
    goto LABEL_38;
  }
  __darwin_time_t result = v38.tv_usec + 1000000 * v38.tv_sec;
  if ((double)result / 1000000.0 <= 1514764800.0) {
    goto LABEL_38;
  }
  return result;
}

unsigned char *log_args_buf(char *a1, int a2, void **a3, char *__format, va_list a5)
{
  uint64_t v8 = a1;
  int v9 = vsnprintf(a1, a2, __format, a5);
  if (v9 < 0) {
    return 0;
  }
  if (v8 && v9 < a2) {
    goto LABEL_6;
  }
  size_t v10 = (v9 + 1);
  uint64_t v11 = (char *)malloc_type_malloc(v10, 0x89E5C99DuLL);
  *a3 = v11;
  if (!v11) {
    return 0;
  }
  int v9 = vsnprintf(v11, v10, __format, a5);
  uint64_t v8 = *a3;
  if (v9 < 0)
  {
    free(*a3);
    return 0;
  }
LABEL_6:
  if (v9)
  {
    uint64_t v12 = (v9 - 1);
    if (v8[v12] == 10) {
      v8[v12] = 0;
    }
  }
  return v8;
}

uint64_t snprintf_log_field_value(char *a1, int a2, uint64_t a3)
{
  switch(*(_DWORD *)(a3 + 16))
  {
    case 0:
      return snprintf(a1, a2, "\"%s\"");
    case 1:
      return snprintf(a1, a2, "%d");
    case 2:
      return snprintf(a1, a2, "%u");
    case 3:
      return snprintf(a1, a2, "%lld");
    case 4:
      return snprintf(a1, a2, "%llu");
    case 5:
    case 6:
      return snprintf(a1, a2, "%f");
    case 7:
      int v7 = snprintf(a1, a2 & ~(a2 >> 31), "[");
      int v8 = v7;
      uint64_t v9 = *(void *)(a3 + 8);
      if (*(uint64_t *)v9 >= 1)
      {
        uint64_t v10 = **(void **)(v9 + 8);
        long long v27 = &unk_21BB738AE;
        uint64_t v28 = v10;
        uint64_t v29 = 0;
        int v8 = snprintf_log_field_value(&a1[v7], (a2 - v7) & ~((a2 - v7) >> 31), &v27) + v7;
        if (*(uint64_t *)v9 >= 2)
        {
          uint64_t v11 = 1;
          do
          {
            uint64_t v12 = *(void *)(*(void *)(v9 + 8) + 8 * v11);
            long long v27 = &unk_21BB738AE;
            uint64_t v28 = v12;
            uint64_t v29 = 0;
            uint64_t v13 = v8 + (uint64_t)snprintf(&a1[v8], (a2 - v8) & ~((a2 - v8) >> 31), ",");
            int v8 = snprintf_log_field_value(&a1[v13], (a2 - v13) & ~((a2 - (int)v13) >> 31), &v27)
               + v13;
            ++v11;
          }
          while (v11 < *(void *)v9);
        }
      }
      goto LABEL_24;
    case 8:
      int v14 = snprintf(a1, a2 & ~(a2 >> 31), "[");
      int v8 = v14;
      uint64_t v15 = *(uint64_t **)(a3 + 8);
      if (*v15 >= 1)
      {
        uint64_t v16 = (_DWORD *)v15[1];
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        long long v27 = &unk_21BB738AE;
        LODWORD(v28) = *v16;
        LODWORD(v29) = 1;
        int v8 = snprintf_log_field_value(&a1[v14], (a2 - v14) & ~((a2 - v14) >> 31), &v27) + v14;
        if (*v15 >= 2)
        {
          uint64_t v17 = 1;
          do
          {
            uint64_t v18 = v15[1];
            uint64_t v28 = 0;
            uint64_t v29 = 0;
            long long v27 = &unk_21BB738AE;
            LODWORD(v28) = *(_DWORD *)(v18 + 4 * v17);
            LODWORD(v29) = 1;
            uint64_t v19 = v8 + (uint64_t)snprintf(&a1[v8], (a2 - v8) & ~((a2 - v8) >> 31), ",");
            int v8 = snprintf_log_field_value(&a1[v19], (a2 - v19) & ~((a2 - (int)v19) >> 31), &v27)
               + v19;
            ++v17;
          }
          while (v17 < *v15);
        }
      }
      goto LABEL_24;
    case 9:
      int v20 = snprintf(a1, a2 & ~(a2 >> 31), "[");
      int v8 = v20;
      uint64_t v21 = *(uint64_t **)(a3 + 8);
      if (*v21 >= 1)
      {
        char v22 = (uint64_t *)v21[1];
        uint64_t v29 = 6;
        long long v27 = &unk_21BB738AE;
        uint64_t v28 = *v22;
        int v8 = snprintf_log_field_value(&a1[v20], (a2 - v20) & ~((a2 - v20) >> 31), &v27) + v20;
        if (*v21 >= 2)
        {
          uint64_t v23 = 1;
          do
          {
            uint64_t v24 = v21[1];
            uint64_t v29 = 6;
            uint64_t v25 = *(void *)(v24 + 8 * v23);
            long long v27 = &unk_21BB738AE;
            uint64_t v28 = v25;
            uint64_t v26 = v8 + (uint64_t)snprintf(&a1[v8], (a2 - v8) & ~((a2 - v8) >> 31), ",");
            int v8 = snprintf_log_field_value(&a1[v26], (a2 - v26) & ~((a2 - (int)v26) >> 31), &v27)
               + v26;
            ++v23;
          }
          while (v23 < *v21);
        }
      }
LABEL_24:
      uint64_t result = (snprintf(&a1[v8], (a2 - v8) & ~((a2 - v8) >> 31), "]") + v8);
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void log_msg_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char *__format, va_list a9)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v22 = 0;
  if (a1 <= 3)
  {
    uint64_t v16 = log_args_buf(v23, 1024, &v22, __format, a9);
    if (!v16)
    {
LABEL_15:
      free(v22);
      return;
    }
    uint64_t v17 = v16;
    if (running_in_bootstrapped_env_ret == -1)
    {
      uint64_t v19 = getenv("SCHEDULER_BOOTSTRAP");
      if (v19)
      {
        running_in_bootstrapped_env_ret = *v19 != 0;
        uint64_t v18 = (FILE *)*MEMORY[0x263EF8358];
        if (running_in_bootstrapped_env_ret) {
          goto LABEL_5;
        }
      }
      else
      {
        running_in_bootstrapped_env_ret = 0;
        uint64_t v18 = (FILE *)*MEMORY[0x263EF8358];
      }
    }
    else
    {
      uint64_t v18 = (FILE *)*MEMORY[0x263EF8358];
      if (running_in_bootstrapped_env_ret)
      {
LABEL_5:
        log_to_file_handle((uint64_t)v18, 2, a1, a2, a3, a4, a5, (uint64_t)v17, a6, a7);
LABEL_14:
        log_to_other_targets_lf(a1, a2, a3, a4, a5, (uint64_t)v17, a6, a7);
        goto LABEL_15;
      }
    }
    if ((a2 & 2) != 0)
    {
      size_t v20 = strlen(v17);
      uint64_t v21 = (char *)malloc_type_calloc(v20 + 12, 1uLL, 0x100004077774924uLL);
      sprintf(v21, "CRITICAL - %s", v17);
      log_console_fmt(a1, a2, a3, a4, a5, (uint64_t)v21, a6, a7, v18);
      if (v21) {
        free(v21);
      }
    }
    else
    {
      log_console_fmt(a1, a2, a3, a4, a5, (uint64_t)v17, a6, a7, v18);
    }
    goto LABEL_14;
  }
}

void log_to_file_handle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10 = MEMORY[0x270FA5388]();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  int v22 = v11;
  uint64_t v23 = (FILE *)v10;
  uint64_t v24 = a9;
  uint64_t v65 = *MEMORY[0x263EF8340];
  if ((v20 & 2) != 0)
  {
    uint64_t v28 = v13;
    uint64_t v29 = v12;
    size_t v30 = strlen(v14);
    uint64_t v26 = (char *)malloc_type_calloc(v30 + 12, 1uLL, 0x100004077774924uLL);
    sprintf(v26, "CRITICAL - %s", v15);
    uint64_t v12 = v29;
    uint64_t v13 = v28;
    uint64_t v25 = v26;
    uint64_t v27 = a10;
    if (v22 != 2) {
      goto LABEL_3;
    }
LABEL_8:
    bzero(v61, 0x400uLL);
    *(void *)&v63.tv_usec = 0;
    v63.tv_sec = 0;
    if (gettimeofday(&v63, 0)
      || (double v31 = (double)(v63.tv_usec + 1000000 * v63.tv_sec) / 1000000.0, v31 <= 1514764800.0))
    {
      __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
    }
    size_t v32 = strlen(v26);
    char v64 = 0;
    if (v32)
    {
      unint64_t v33 = 0;
      size_t v34 = 0;
      do
      {
        unsigned int v35 = v26[v34];
        if (v35 > 0x21)
        {
          if (v35 == 92 || v35 == 34)
          {
            if (v33 > 0x27FD) {
              break;
            }
            *((unsigned char *)&v63.tv_sec + v33++) = 92;
          }
        }
        else if (v35 == 10 || v35 == 13)
        {
          LOBYTE(v35) = 95;
        }
        *((unsigned char *)&v63.tv_sec + v33++) = v35;
        ++v34;
      }
      while (v34 < v32 && v33 < 0x27FF);
      if (v33 > 0x27FE) {
        goto LABEL_30;
      }
    }
    else
    {
      unint64_t v33 = 0;
    }
    *((unsigned char *)&v63.tv_sec + v33) = 0;
LABEL_30:
    size_t v37 = strlen((const char *)&v63);
    uint64_t v38 = 0;
    int v39 = (char *)&v63 + v37 - 1;
    uint64_t v40 = MEMORY[0x263EF8318];
    do
    {
      while (1)
      {
        int v42 = (char *)&v63 + v38;
        unsigned int v43 = *((char *)&v63.tv_sec + v38);
        if ((v43 & 0x80000000) != 0) {
          break;
        }
        ++v38;
        if ((*(_DWORD *)(v40 + 4 * v43 + 60) & 0x4000) == 0 || v42 >= v39) {
          goto LABEL_41;
        }
      }
      ++v38;
      if (__maskrune(v43, 0x4000uLL)) {
        BOOL v41 = v42 >= v39;
      }
      else {
        BOOL v41 = 1;
      }
    }
    while (!v41);
LABEL_41:
    uint64_t v45 = v37 - v38 + 1;
    uint64_t v46 = (char *)&v63 + v38 - 1;
    do
    {
      unsigned int v47 = *v39;
      if ((v47 & 0x80000000) != 0)
      {
        int v48 = __maskrune(v47, 0x4000uLL);
        uint64_t v49 = v39 - 1;
        --v45;
        if (v39 <= v46) {
          break;
        }
      }
      else
      {
        int v48 = *(_DWORD *)(v40 + 4 * v47 + 60) & 0x4000;
        uint64_t v49 = v39 - 1;
        --v45;
        if (v39 <= v46) {
          break;
        }
      }
      int v39 = v49;
    }
    while (v48);
    if (v46 <= v49 + 1)
    {
      unsigned int v50 = *v46;
      if ((v50 & 0x80000000) != 0) {
        int v51 = __maskrune(v50, 0x4000uLL);
      }
      else {
        int v51 = *(_DWORD *)(v40 + 4 * v50 + 60) & 0x4000;
      }
      if (v51) {
        int v52 = v45;
      }
      else {
        int v52 = v45 + 1;
      }
      uint64_t v53 = v52;
      __memmove_chk();
      *((unsigned char *)&v63.tv_sec + v53) = 0;
    }
    if (v27)
    {
      int v54 = 0;
      long long v55 = (const char **)a9;
      do
      {
        timeval v56 = *v55;
        v55 += 3;
        uint64_t v57 = v54 + (uint64_t)snprintf(&v61[v54], (1024 - v54) & ~((1024 - v54) >> 31), ",\"%s\":", v56);
        int v54 = v57 + snprintf_log_field_value(&v61[v57], (1024 - v57) & ~((1024 - (int)v57) >> 31), v24);
        uint64_t v24 = (uint64_t)v55;
        --v27;
      }
      while (v27);
      if (v54 >= 1024) {
        log_msg(2, 0, "/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/util/log.c", 798, "log_bootstrap_fmt", "Exceeded log field buffer %d >= %d. Next log line will be cut short.", v54, 1024);
      }
    }
    time_t v60 = (uint64_t)v31;
    memset(&v59, 0, sizeof(v59));
    gmtime_r(&v60, &v59);
    if (snprintf(__str, 0x80uLL, "%d-%02d-%02dT%02d:%02d:%02d.%06d", v59.tm_year + 1900, v59.tm_mon + 1, v59.tm_mday, v59.tm_hour, v59.tm_min, v59.tm_sec, (int)((v31 - floor(v31)) * 1000000.0)) >= 0x80)__assert_rtn("timestamp_ISO_8601", "log.c", 735, "len > snprintf(buf, len, \"%d-%02d-%02dT%02d:%02d:%02d.%06d\", tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec, (int)((timestamp - floor(timestamp)) * 1000000)) && \"timestamp truncated\""); {
    fprintf(v23, "{\"time\":\"%sZ\",\"level\":\"%s\",\"msg\":\"%s\",\"file\":\"%s\",\"function\":\"%s\",\"line\":%d%s}\n", v58, __str);
    }
    goto LABEL_62;
  }
  uint64_t v25 = 0;
  uint64_t v26 = (char *)v14;
  uint64_t v27 = a10;
  if (v11 == 2) {
    goto LABEL_8;
  }
LABEL_3:
  if (v22 == 1)
  {
    log_console_fmt(v12, v21, v19, v13, v17, (uint64_t)v26, a9, v27, v23);
    goto LABEL_63;
  }
  if (v22 || !*v15) {
    goto LABEL_63;
  }
  fprintf(v23, "%s\n", v12);
LABEL_62:
  fflush(v23);
LABEL_63:
  if (v25) {
    free(v25);
  }
}

double g_frustum_corners_from_camera(float64x2_t *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  *(void *)uint64_t v46 = 0x3FF0000000000000;
  *(_OWORD *)&v46[8] = 0u;
  *(_OWORD *)unsigned int v47 = 0u;
  *(void *)&v47[16] = 0x3FF0000000000000;
  long long v48 = 0u;
  float64x2_t v49 = 0u;
  double v50 = 1.0;
  memset(v51, 0, sizeof(v51));
  double v52 = 1.0;
  g_rot_xyz((double *)v46, -a1[2].f64[1], -a1[2].f64[0], -a1[1].f64[1]);
  double v8 = a1->f64[0];
  double v9 = a1->f64[1];
  double v10 = a1[1].f64[0];
  *(double *)uint64_t v46 = *(double *)v46 + *(double *)v47 * a1->f64[0];
  *(double *)&v46[8] = *(double *)&v46[8] + *(double *)v47 * v9;
  *(double *)&v46[16] = *(double *)&v46[16] + *(double *)v47 * v10;
  *(double *)&unsigned char v47[8] = *(double *)&v47[8] + *((double *)&v48 + 1) * v8;
  *(double *)&v47[16] = *(double *)&v47[16] + *((double *)&v48 + 1) * v9;
  *(double *)&long long v48 = *(double *)&v48 + *((double *)&v48 + 1) * v10;
  v49.f64[0] = v49.f64[0] + v51[0].f64[0] * v8;
  v49.f64[1] = v49.f64[1] + v51[0].f64[0] * v9;
  double v50 = v50 + v51[0].f64[0] * v10;
  v51[0].f64[1] = v51[0].f64[1] + v52 * v8;
  v51[1].f64[0] = v51[1].f64[0] + v52 * v9;
  v51[1].f64[1] = v51[1].f64[1] + v52 * v10;
  g_improj_to_xyz(a2, 1, 1, (double *)a3, (double *)(a3 + 8), (double *)(a3 + 16), 0.5, 0.5);
  double v11 = *(double *)a3;
  double v12 = *(double *)(a3 + 8);
  double v13 = *(double *)(a3 + 16);
  double v14 = a1[1].f64[0];
  float64_t v15 = v51[1].f64[1] + v12 * *(double *)&v48 + *(double *)&v46[16] * *(double *)a3 + v50 * v13 - v14;
  *(double *)(a3 + 112) = v14 + v15 * a5;
  float64x2_t v16 = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v47[8], v12), *(float64x2_t *)v46, v11), v49, v13), *(float64x2_t *)((char *)v51 + 8));
  float64x2_t v17 = *a1;
  float64x2_t v18 = vsubq_f64(v16, *a1);
  *(float64x2_t *)(a3 + 96) = vmlaq_n_f64(*a1, v18, a5);
  *(float64x2_t *)a3 = vmlaq_n_f64(v17, v18, a4);
  *(double *)(a3 + 16) = v14 + v15 * a4;
  g_improj_to_xyz(a2, 1, 1, (double *)(a3 + 24), (double *)(a3 + 32), (double *)(a3 + 40), -0.5, 0.5);
  double v19 = *(double *)(a3 + 24);
  double v20 = *(double *)(a3 + 32);
  double v21 = *(double *)(a3 + 40);
  double v22 = a1[1].f64[0];
  float64_t v23 = v51[1].f64[1] + v20 * *(double *)&v48 + *(double *)&v46[16] * v19 + v50 * v21 - v22;
  *(double *)(a3 + 136) = v22 + v23 * a5;
  float64x2_t v24 = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v47[8], v20), *(float64x2_t *)v46, v19), v49, v21), *(float64x2_t *)((char *)v51 + 8));
  float64x2_t v25 = *a1;
  float64x2_t v26 = vsubq_f64(v24, *a1);
  *(float64x2_t *)(a3 + 120) = vmlaq_n_f64(*a1, v26, a5);
  *(float64x2_t *)(a3 + 24) = vmlaq_n_f64(v25, v26, a4);
  *(double *)(a3 + 40) = v22 + v23 * a4;
  g_improj_to_xyz(a2, 1, 1, (double *)(a3 + 48), (double *)(a3 + 56), (double *)(a3 + 64), 0.5, -0.5);
  double v27 = *(double *)(a3 + 48);
  double v28 = *(double *)(a3 + 56);
  double v29 = *(double *)(a3 + 64);
  double v30 = a1[1].f64[0];
  float64_t v31 = v51[1].f64[1] + v28 * *(double *)&v48 + *(double *)&v46[16] * v27 + v50 * v29 - v30;
  *(double *)(a3 + 160) = v30 + v31 * a5;
  float64x2_t v32 = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v47[8], v28), *(float64x2_t *)v46, v27), v49, v29), *(float64x2_t *)((char *)v51 + 8));
  float64x2_t v33 = *a1;
  float64x2_t v34 = vsubq_f64(v32, *a1);
  *(float64x2_t *)(a3 + 144) = vmlaq_n_f64(*a1, v34, a5);
  *(float64x2_t *)(a3 + 48) = vmlaq_n_f64(v33, v34, a4);
  *(double *)(a3 + 64) = v30 + v31 * a4;
  g_improj_to_xyz(a2, 1, 1, (double *)(a3 + 72), (double *)(a3 + 80), (double *)(a3 + 88), -0.5, -0.5);
  double v35 = *(double *)(a3 + 72);
  double v36 = *(double *)(a3 + 80);
  double v37 = *(double *)(a3 + 88);
  double v38 = a1[1].f64[0];
  float64_t v39 = v51[1].f64[1] + v36 * *(double *)&v48 + *(double *)&v46[16] * v35 + v50 * v37 - v38;
  *(double *)(a3 + 184) = v38 + v39 * a5;
  float64x2_t v40 = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v47[8], v36), *(float64x2_t *)v46, v35), v49, v37), *(float64x2_t *)((char *)v51 + 8));
  float64x2_t v41 = *a1;
  float64x2_t v42 = vsubq_f64(v40, *a1);
  *(float64x2_t *)(a3 + 168) = vmlaq_n_f64(*a1, v42, a5);
  *(float64x2_t *)(a3 + 72) = vmlaq_n_f64(v41, v42, a4);
  double result = v38 + v39 * a4;
  *(double *)(a3 + 88) = result;
  return result;
}

void g_frustum_from_camera(double *a1, float64x2_t *a2, uint64_t a3, double a4, double a5)
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  g_frustum_corners_from_camera(a2, a3, (uint64_t)&v81, a4, a5);
  double v6 = v81;
  double v7 = v82;
  double v9 = v83;
  double v8 = v84;
  double v10 = v84 - v81;
  double v12 = v85;
  double v11 = v86;
  double v13 = v85 - v82;
  double v14 = v86 - v83;
  double v15 = v87;
  double v16 = v88;
  double v17 = v87 - v81;
  double v18 = v88 - v82;
  double v19 = v89;
  double v20 = v89 - v83;
  double v21 = (v85 - v82) * (v89 - v83) - (v86 - v83) * (v88 - v82);
  double v22 = (v86 - v83) * (v87 - v81) - (v84 - v81) * (v89 - v83);
  double v23 = (v84 - v81) * (v88 - v82) - (v85 - v82) * (v87 - v81);
  double v24 = sqrt(v22 * v22 + v21 * v21 + v23 * v23);
  double v25 = 0.0;
  double v26 = 0.0;
  double v27 = 0.0;
  double v28 = 0.0;
  if (v24 > 0.0)
  {
    double v26 = v21 / v24;
    double v27 = v22 / v24;
    double v28 = v23 / v24;
  }
  *a1 = v26;
  a1[1] = v27;
  a1[2] = v28;
  a1[3] = v7 * v27 + v26 * v6 + v28 * v9;
  double v29 = v99;
  double v30 = v100;
  double v32 = v93;
  double v31 = v94;
  double v33 = v101;
  double v34 = v95;
  double v35 = v96;
  double v36 = v97;
  double v37 = v98;
  double v38 = (v100 - v94) * (v98 - v95) - (v101 - v95) * (v97 - v94);
  double v39 = (v101 - v95) * (v96 - v93) - (v99 - v93) * (v98 - v95);
  double v40 = (v99 - v93) * (v97 - v94) - (v100 - v94) * (v96 - v93);
  double v41 = sqrt(v39 * v39 + v38 * v38 + v40 * v40);
  double v42 = 0.0;
  double v43 = 0.0;
  if (v41 > 0.0)
  {
    double v25 = v38 / v41;
    double v42 = v39 / v41;
    double v43 = v40 / v41;
  }
  a1[4] = v25;
  a1[5] = v42;
  a1[6] = v43;
  a1[7] = v31 * v42 + v25 * v32 + v43 * v34;
  double v44 = v32 - v6;
  double v45 = v31 - v7;
  double v46 = v34 - v9;
  double v47 = v45 * v14 - (v34 - v9) * v13;
  double v48 = (v34 - v9) * v10 - v44 * v14;
  double v49 = v44 * v13 - v45 * v10;
  double v50 = sqrt(v48 * v48 + v47 * v47 + v49 * v49);
  double v51 = 0.0;
  double v52 = 0.0;
  double v53 = 0.0;
  double v54 = 0.0;
  if (v50 > 0.0)
  {
    double v52 = v47 / v50;
    double v53 = v48 / v50;
    double v54 = v49 / v50;
  }
  a1[8] = v52;
  a1[9] = v53;
  a1[10] = v54;
  a1[11] = v7 * v53 + v52 * v6 + v54 * v9;
  double v55 = v90;
  double v56 = v91;
  double v57 = v92;
  double v58 = v29 - v15;
  double v59 = v30 - v16;
  double v60 = v33 - v19;
  double v61 = (v91 - v16) * v60 - (v92 - v19) * (v30 - v16);
  double v62 = (v92 - v19) * v58 - (v90 - v15) * v60;
  double v63 = (v90 - v15) * v59 - (v91 - v16) * v58;
  double v64 = sqrt(v62 * v62 + v61 * v61 + v63 * v63);
  double v65 = 0.0;
  double v66 = 0.0;
  if (v64 > 0.0)
  {
    double v51 = v61 / v64;
    double v65 = v62 / v64;
    double v66 = v63 / v64;
  }
  a1[12] = v51;
  a1[13] = v65;
  a1[14] = v66;
  a1[15] = v16 * v65 + v51 * v15 + v66 * v19;
  double v67 = v18 * v46 - v20 * v45;
  double v68 = v20 * v44 - v17 * v46;
  double v69 = v17 * v45 - v18 * v44;
  double v70 = sqrt(v68 * v68 + v67 * v67 + v69 * v69);
  double v71 = 0.0;
  double v72 = 0.0;
  double v73 = 0.0;
  double v74 = 0.0;
  if (v70 > 0.0)
  {
    double v72 = v67 / v70;
    double v73 = v68 / v70;
    double v74 = v69 / v70;
  }
  a1[16] = v72;
  a1[17] = v73;
  a1[18] = v74;
  a1[19] = v7 * v73 + v72 * v6 + v74 * v9;
  double v75 = (v36 - v12) * (v57 - v11) - (v37 - v11) * (v56 - v12);
  double v76 = (v37 - v11) * (v55 - v8) - (v35 - v8) * (v57 - v11);
  double v77 = (v35 - v8) * (v56 - v12) - (v36 - v12) * (v55 - v8);
  double v78 = sqrt(v76 * v76 + v75 * v75 + v77 * v77);
  double v79 = 0.0;
  double v80 = 0.0;
  if (v78 > 0.0)
  {
    double v71 = v75 / v78;
    double v79 = v76 / v78;
    double v80 = v77 / v78;
  }
  a1[20] = v71;
  a1[21] = v79;
  a1[22] = v80;
  a1[23] = v12 * v79 + v71 * v8 + v80 * v11;
}

uint64_t g_frustum_isect_lseg(double *a1, double *a2, double *a3, double *a4, double *a5)
{
  double v5 = *a3;
  double v6 = a3[1];
  double v7 = *a2;
  double v8 = a2[1];
  double v9 = a3[2];
  double v10 = a2[2];
  double v11 = a1[16];
  double v12 = a1[17];
  double v14 = a1[18];
  double v13 = a1[19];
  double v15 = v8 * v12 + v11 * *a2 + v14 * v10 - v13;
  double v16 = v6 * v12 + v11 * *a3 + v14 * v9 - v13;
  if (v15 < 0.0 && v16 < 0.0) {
    return 0;
  }
  double v17 = v5 - v7;
  double v18 = v6 - v8;
  double v19 = v9 - v10;
  double v20 = 0.0;
  if (v15 < 0.0 || (double v21 = 1.0, v16 < 0.0))
  {
    double v22 = v18 * v12 + v17 * v11 + v19 * v14;
    double v23 = -v15 / v22;
    if (v22 >= 0.0)
    {
      double v25 = 1.0;
      double v21 = 1.0;
      if (v23 <= 0.0) {
        goto LABEL_10;
      }
    }
    else
    {
      double v21 = 1.0;
      BOOL v24 = v23 < 1.0;
      double v25 = -v15 / v22;
      double v23 = 0.0;
      if (!v24) {
        goto LABEL_10;
      }
    }
    double v21 = v25;
    double v20 = v23;
    if (v25 <= v23) {
      return 0;
    }
  }
LABEL_10:
  double v26 = a1[20];
  double v27 = a1[21];
  double v28 = a1[22];
  double v29 = a1[23];
  double v30 = v8 * v27 + v26 * v7 + v28 * v10 - v29;
  double v31 = v6 * v27 + v26 * v5 + v28 * v9 - v29;
  if (v30 < 0.0 && v31 < 0.0) {
    return 0;
  }
  if (v30 >= 0.0 && v31 >= 0.0) {
    goto LABEL_20;
  }
  double v32 = v18 * v27 + v17 * v26 + v19 * v28;
  double v33 = -v30 / v32;
  if (v32 >= 0.0)
  {
    if (v33 > v20) {
      goto LABEL_19;
    }
  }
  else if (v33 < v21)
  {
    double v21 = -v30 / v32;
  }
  double v33 = v20;
LABEL_19:
  double v20 = v33;
  if (v21 <= v33) {
    return 0;
  }
LABEL_20:
  double v34 = a1[12];
  double v35 = a1[13];
  double v36 = a1[14];
  double v37 = a1[15];
  double v38 = v8 * v35 + v34 * v7 + v36 * v10 - v37;
  double v39 = v6 * v35 + v34 * v5 + v36 * v9 - v37;
  if (v38 < 0.0 && v39 < 0.0) {
    return 0;
  }
  if (v38 >= 0.0 && v39 >= 0.0) {
    goto LABEL_30;
  }
  double v40 = v18 * v35 + v17 * v34 + v19 * v36;
  double v41 = -v38 / v40;
  if (v40 >= 0.0)
  {
    if (v41 > v20) {
      goto LABEL_29;
    }
  }
  else if (v41 < v21)
  {
    double v21 = -v38 / v40;
  }
  double v41 = v20;
LABEL_29:
  double v20 = v41;
  if (v21 <= v41) {
    return 0;
  }
LABEL_30:
  double v42 = a1[8];
  double v43 = a1[9];
  double v44 = a1[10];
  double v45 = a1[11];
  double v46 = v8 * v43 + v42 * v7 + v44 * v10 - v45;
  double v47 = v6 * v43 + v42 * v5 + v44 * v9 - v45;
  if (v46 < 0.0 && v47 < 0.0) {
    return 0;
  }
  if (v46 >= 0.0 && v47 >= 0.0) {
    goto LABEL_40;
  }
  double v48 = v18 * v43 + v17 * v42 + v19 * v44;
  double v49 = -v46 / v48;
  if (v48 >= 0.0)
  {
    if (v49 > v20) {
      goto LABEL_39;
    }
  }
  else if (v49 < v21)
  {
    double v21 = -v46 / v48;
  }
  double v49 = v20;
LABEL_39:
  double v20 = v49;
  if (v21 <= v49) {
    return 0;
  }
LABEL_40:
  double v50 = a1[4];
  double v51 = a1[5];
  double v52 = a1[6];
  double v53 = a1[7];
  double v54 = v8 * v51 + v50 * v7 + v52 * v10 - v53;
  double v55 = v6 * v51 + v50 * v5 + v52 * v9 - v53;
  if (v54 < 0.0 && v55 < 0.0) {
    return 0;
  }
  if (v54 >= 0.0 && v55 >= 0.0) {
    goto LABEL_50;
  }
  double v56 = v18 * v51 + v17 * v50 + v19 * v52;
  double v57 = -v54 / v56;
  if (v56 >= 0.0)
  {
    if (v57 > v20) {
      goto LABEL_49;
    }
  }
  else if (v57 < v21)
  {
    double v21 = -v54 / v56;
  }
  double v57 = v20;
LABEL_49:
  double v20 = v57;
  if (v21 <= v57) {
    return 0;
  }
LABEL_50:
  double v58 = a1[1];
  double v59 = v8 * v58 + *a1 * v7;
  double v60 = a1[2];
  double v61 = a1[3];
  double v62 = v59 + v60 * v10 - v61;
  double v63 = v6 * v58 + *a1 * v5 + v60 * v9 - v61;
  if (v62 < 0.0 && v63 < 0.0) {
    return 0;
  }
  if (v62 < 0.0 || v63 < 0.0)
  {
    double v65 = v18 * v58 + v17 * *a1 + v19 * v60;
    double v66 = -v62 / v65;
    if (v65 >= 0.0)
    {
      if (v66 > v20) {
        goto LABEL_60;
      }
    }
    else if (v66 < v21)
    {
      double v21 = -v62 / v65;
    }
    double v66 = v20;
LABEL_60:
    double v20 = v66;
    if (v21 > v66) {
      goto LABEL_61;
    }
    return 0;
  }
LABEL_61:
  if (a4) {
    *a4 = v20;
  }
  if (a5) {
    *a5 = v21;
  }
  return 1;
}

unint64_t pmem_alloc_ex(uint64_t a1, unint64_t a2, void *(*a3)(size_t a1, uint64_t a2))
{
  double v6 = (char *)malloc_type_malloc(0x40uLL, 0x10800409FEEBF35uLL);
  if (!a2) {
    a2 = 16;
  }
  if (!v6)
  {
    printf("header malloc failed, size: %lu\n", 64);
    double v13 = (FILE **)MEMORY[0x263EF8348];
    fprintf((FILE *)*MEMORY[0x263EF8348], "header malloc failed, size: %lu\n", 64);
    fflush((FILE *)*MEMORY[0x263EF8358]);
    fflush(*v13);
    abort();
  }
  double v7 = v6;
  *(_OWORD *)(v6 + 24) = 0u;
  *((void *)v6 + 7) = 0;
  if (a3) {
    double v8 = a3;
  }
  else {
    double v8 = pmem_default_alloc;
  }
  *(_OWORD *)(v6 + 40) = 0uLL;
  *(_OWORD *)(v6 + 8) = 0uLL;
  *(void *)double v6 = a1;
  unint64_t v9 = a1 + a2 + 8;
  *((_DWORD *)v6 + 6) = 1;
  uint64_t v10 = (uint64_t)v8(v9, (uint64_t)v6);
  unint64_t v11 = *((void *)v7 + 1);
  if (v11 < v9) {
    __assert_rtn("pmem_alloc_ex", "pmem.c", 249, "header->size_allocated >= min_size && \"Allocator should allocate at least enough space!\"");
  }
  if (!v10)
  {
    double v14 = pmem_type_to_str(*((_DWORD *)v7 + 8));
    printf("Allocation (%s) failed, size: %llu\n", v14, *((void *)v7 + 1));
    double v15 = (FILE **)MEMORY[0x263EF8348];
    double v16 = (FILE *)*MEMORY[0x263EF8348];
    double v17 = pmem_type_to_str(*((_DWORD *)v7 + 8));
    fprintf(v16, "Allocation (%s) failed, size: %llu\n", v17, *((void *)v7 + 1));
    fflush((FILE *)*MEMORY[0x263EF8358]);
    fflush(*v15);
    abort();
  }
  unint64_t result = (v10 + a2 + 7) / a2 * a2;
  *(void *)(result - 8) = v7;
  atomic_fetch_add(&global_stats[1], 1uLL);
  atomic_fetch_add(&global_stats[2], 1uLL);
  atomic_fetch_add(global_stats, v11);
  atomic_fetch_add(&pmem_total_refs, 1uLL);
  atomic_fetch_add(&_pmem_total_blocks, 1uLL);
  atomic_fetch_add(&pmem_bytes_allocated, v11);
  return result;
}

void *pmem_default_alloc(size_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1 <= 0x100000)
  {
    *(void *)(a2 + 8) = a1;
    *(_DWORD *)(a2 + 32) = 1;
    unint64_t result = malloc_type_malloc(a1, 0x9D8D5591uLL);
    *(void *)(a2 + 56) = result;
    *(void *)(a2 + 40) = pmem_malloc_free;
  }
  else
  {
    unint64_t result = mmap(0, a1, 3, 4098, -1, 0);
    if ((unint64_t)result + 1 > 1)
    {
      *(void *)(a2 + 8) = a1;
      *(_DWORD *)(a2 + 32) = 2;
      *(void *)(a2 + 40) = pmem_mmap_free;
      *(void *)(a2 + 48) = pmem_mmap_write_protect;
      *(void *)(a2 + 56) = result;
    }
    else
    {
      double v5 = __error();
      strerror_r(*v5, __strerrbuf, 0x64uLL);
      double v6 = __error();
      printf("Failed to mmap block of size: %zu, error %d: %s\n", a1, *v6, __strerrbuf);
      double v7 = (FILE *)*MEMORY[0x263EF8348];
      double v8 = __error();
      fprintf(v7, "Failed to mmap block of size: %zu, error %d: %s\n", a1, *v8, __strerrbuf);
      return 0;
    }
  }
  return result;
}

char *pmem_type_to_str(unsigned int a1)
{
  if (a1 >= 6) {
    __assert_rtn("pmem_type_to_str", "pmem.c", 500, "0 && \"Unsupported type\"");
  }
  return off_2643BA400[a1];
}

uint64_t pmem_mmap_free(uint64_t a1)
{
  return 0;
}

BOOL pmem_mmap_write_protect(uint64_t a1)
{
  return mprotect(*(void **)(a1 + 56), *(void *)(a1 + 8), 1) != 0;
}

uint64_t pmem_malloc_free(uint64_t a1)
{
  return 0;
}

void lbl_feature_extract_kpts_score_map(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, int a10, int a11, int a12, uint64_t a13)
{
  uint64_t v13 = MEMORY[0x270FA5388]();
  int v581 = v16;
  v575 = v17;
  v576 = v18;
  double v19 = v15;
  double v20 = v14;
  uint64_t v22 = v21;
  float v24 = v23;
  int32x2_t v580 = v25;
  float v27 = v26;
  double v29 = v28;
  uint64_t v30 = v13;
  uint64_t v597 = *MEMORY[0x263EF8340];
  if (v14) {
    double v31 = v14;
  }
  else {
    double v31 = v15;
  }
  int v32 = *((_DWORD *)v31 + 3);
  int v586 = *((_DWORD *)v31 + 2);
  v589.__darwin_time_t tv_sec = 0;
  *(void *)&v589.tv_usec = 0;
  if (gettimeofday(&v589, 0)
    || (double)(v589.tv_usec + 1000000 * v589.tv_sec) / 1000000.0 <= 1514764800.0
    || (v589.__darwin_time_t tv_sec = 0, *(void *)&v589.tv_usec = 0, gettimeofday(&v589, 0))
    || (HIWORD(v46) = 0, (double)(v589.tv_usec + 1000000 * v589.tv_sec) / 1000000.0 <= 1514764800.0))
  {
    __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
  }
  *(void *)uint64_t v30 = 0;
  if (v29) {
    *double v29 = 0;
  }
  v577 = v29;
  *(void *)uint64_t v22 = 0;
  uint64_t v47 = *(void *)(v30 + 16);
  if (v47 <= 999)
  {
    uint64_t v48 = 2 * v47;
    if (2 * v47 <= 1000) {
      uint64_t v48 = 1000;
    }
    if (v47) {
      uint64_t v49 = v48;
    }
    else {
      uint64_t v49 = 1000;
    }
    *(void *)(v30 + 8) = malloc_type_realloc(*(void **)(v30 + 8), 8 * v49, 0x33ED2BBBuLL);
    *(void *)(v30 + 16) = v49;
  }
  uint64_t v50 = *(void *)(v22 + 16);
  if (v50 <= 999)
  {
    uint64_t v51 = 2 * v50;
    if (2 * v50 <= 1000) {
      uint64_t v51 = 1000;
    }
    if (v50) {
      uint64_t v52 = v51;
    }
    else {
      uint64_t v52 = 1000;
    }
    *(void *)(v22 + 8) = malloc_type_realloc(*(void **)(v22 + 8), 4 * v52, 0x4C142334uLL);
    *(void *)(v22 + 16) = v52;
  }
  uint64_t v587 = v30;
  if (v20) {
    float v27 = v27 * 65535.0;
  }
  uint64_t v578 = (v32 - 1);
  int v584 = v32;
  if (v20)
  {
    if (v32 >= 3 && v586 >= 3)
    {
      uint64_t v53 = (v586 - 1);
      uint64_t v54 = 1;
      do
      {
        double v55 = (unsigned __int16 *)(*v20 + 2 * v20[2] * v54 + 2);
        uint64_t v56 = v54 - 1;
        uint64_t v57 = v54 + 1;
        uint64_t v58 = 1;
        do
        {
          while (1)
          {
            unsigned int v63 = *v55++;
            float v64 = (float)v63;
            if (v27 > (float)v63) {
              break;
            }
            uint64_t v59 = v20[2];
            LOWORD(v46) = *(_WORD *)(*v20 + 2 * (v59 * v54 + v58 - 1));
            uint64_t v60 = v58 + 1;
            LOWORD(v33) = *(_WORD *)(*v20 + 2 * (v59 * v54 + v58 + 1));
            uint64_t v61 = v59 * v56;
            LOWORD(v34) = *(_WORD *)(*v20 + 2 * (v59 * v56 + v58));
            uint64_t v62 = v59 * v57;
            LOWORD(v35) = *(_WORD *)(*v20 + 2 * (v62 + v58));
            LOWORD(v36) = *(_WORD *)(*v20 + 2 * (v61 + v58 - 1));
            LOWORD(v37) = *(_WORD *)(*v20 + 2 * (v61 + v58 + 1));
            LOWORD(v38) = *(_WORD *)(*v20 + 2 * (v62 + v58 - 1));
            LOWORD(v39) = *(_WORD *)(*v20 + 2 * (v62 + v58 + 1));
            pick_xy((void *)a9, v58, v54, v586, v584, a13, v587, v22, v64, (float)v46, (float)v33, (float)v34, (float)v35, (float)v36, (float)v37, (float)v38, (float)v39, v27, v581);
            uint64_t v58 = v60;
            if (v60 == v53) {
              goto LABEL_30;
            }
          }
          ++v58;
        }
        while (v58 != v53);
LABEL_30:
        ++v54;
      }
      while (v57 != v578);
    }
  }
  else if (v32 >= 3 && v586 >= 3)
  {
    uint64_t v65 = (v586 - 1);
    uint64_t v66 = 1;
    do
    {
      double v67 = (float *)(*v19 + 4 * v19[2] * v66 + 4);
      uint64_t v69 = v66 + 1;
      uint64_t v70 = 1;
      do
      {
        while (1)
        {
          float v73 = *v67++;
          float v74 = v73;
          if (v73 < v27) {
            break;
          }
          uint64_t v71 = v19[2];
          uint64_t v72 = v70 + 1;
          uint64_t v68 = v66 - 1;
          pick_xy((void *)a9, v70, v66, v586, v584, a13, v587, v22, v74, *(float *)(*v19 + 4 * (v71 * v66 + v70 - 1)), *(float *)(*v19 + 4 * (v71 * v66 + v70 + 1)), *(float *)(*v19 + 4 * (v71 * v68 + v70)), *(float *)(*v19 + 4 * (v71 * v69 + v70)), *(float *)(*v19 + 4 * (v71 * v68 + v70 - 1)), *(float *)(*v19 + 4 * (v71 * v68 + v70 + 1)), *(float *)(*v19 + 4 * (v71 * v69 + v70 - 1)), *(float *)(*v19 + 4 * (v71 * v69 + v70 + 1)), v27, v581);
          uint64_t v70 = v72;
          if (v72 == v65) {
            goto LABEL_39;
          }
        }
        ++v70;
      }
      while (v70 != v65);
LABEL_39:
      ++v66;
    }
    while (v69 != v578);
  }
  uint64_t v75 = v587;
  uint64_t v76 = *(void *)v587;
  double v77 = v575;
  double v78 = v577;
  if (*(void *)v587 <= a10)
  {
LABEL_197:
    if (!v577) {
      return;
    }
    goto LABEL_198;
  }
  if (a11 < 1)
  {
    unsigned int v588 = 1337;
    uint64_t v131 = v22;
    if (!v76)
    {
LABEL_172:
      uint64_t v177 = *(void *)v131;
      uint64_t v178 = *(void *)(v131 + 16);
      if (v178 < a10)
      {
        uint64_t v179 = 2 * v178;
        BOOL v180 = v178 == 0;
        uint64_t v181 = 64;
        if (!v180) {
          uint64_t v181 = v179;
        }
        if (v181 <= a10) {
          uint64_t v182 = a10;
        }
        else {
          uint64_t v182 = v181;
        }
        if (v182) {
          *(void *)(v131 + 8) = malloc_type_realloc(*(void **)(v131 + 8), 4 * v182, 0x725F3E93uLL);
        }
        *(void *)(v131 + 16) = v182;
      }
      if (a10 > v177) {
        bzero((void *)(*(void *)(v131 + 8) + 4 * *(void *)v131), 4 * (a10 - v177));
      }
      *(void *)uint64_t v131 = a10;
      uint64_t v183 = *(void *)v587;
      uint64_t v184 = *(void *)(v587 + 16);
      double v77 = v575;
      double v78 = v577;
      if (v184 < a10)
      {
        uint64_t v185 = 2 * v184;
        BOOL v180 = v184 == 0;
        uint64_t v186 = 32;
        if (!v180) {
          uint64_t v186 = v185;
        }
        if (v186 <= a10) {
          uint64_t v187 = a10;
        }
        else {
          uint64_t v187 = v186;
        }
        if (v187) {
          *(void *)(v587 + 8) = malloc_type_realloc(*(void **)(v587 + 8), 8 * v187, 0xD6854830uLL);
        }
        *(void *)(v587 + 16) = v187;
      }
      if (a10 > v183) {
        bzero((void *)(*(void *)(v587 + 8) + 8 * *(void *)v587), 8 * (a10 - v183));
      }
      *(void *)uint64_t v587 = a10;
      if (!v577) {
        return;
      }
      goto LABEL_198;
    }
    float32x2_t v132 = *(uint64_t **)(v587 + 8);
    uint64_t v133 = *(float **)(v22 + 8);
    uint64_t v134 = a10;
LABEL_112:
    if (v76 <= 9999)
    {
      uint64_t v140 = rand_r(&v588) % v76;
      goto LABEL_114;
    }
    uint64_t v150 = 0;
    uint64_t v151 = 0;
    while (1)
    {
      uint64_t v152 = (v76 - 1 + v150) / 26;
      uint64_t v153 = (2 * v76 - 2 + v150) / 26;
      float v154 = v133[v152];
      float v155 = v133[v150 / 26];
      float v156 = v133[v153];
      if ((float)(v154 - v155) >= 0.0)
      {
        if ((float)(v156 - v155) < 0.0) {
          goto LABEL_128;
        }
        if ((float)(v156 - v154) < 0.0)
        {
LABEL_130:
          *(__darwin_time_t *)((char *)&v589.tv_sec + v151) = v153;
          goto LABEL_122;
        }
      }
      else if ((float)(v156 - v154) >= 0.0)
      {
        if ((float)(v156 - v155) < 0.0) {
          goto LABEL_130;
        }
LABEL_128:
        *(__darwin_time_t *)((char *)&v589.tv_sec + v151) = v150 / 26;
        goto LABEL_122;
      }
      *(__darwin_time_t *)((char *)&v589.tv_sec + v151) = v152;
LABEL_122:
      v151 += 8;
      v150 += 3 * v76 - 3;
      if (v151 == 72)
      {
        float v162 = v133[*(void *)&v589.tv_usec];
        float v163 = v133[v589.tv_sec];
        float v164 = v133[v590];
        if ((float)(v162 - v163) >= 0.0)
        {
          __darwin_time_t tv_sec = v589.tv_sec;
          if ((float)(v164 - v163) >= 0.0)
          {
            if ((float)(v164 - v162) >= 0.0) {
              __darwin_time_t tv_sec = *(void *)&v589.tv_usec;
            }
            else {
              __darwin_time_t tv_sec = v590;
            }
          }
        }
        else
        {
          __darwin_time_t tv_sec = *(void *)&v589.tv_usec;
          if ((float)(v164 - v162) >= 0.0)
          {
            __darwin_time_t tv_sec = v589.tv_sec;
            if ((float)(v164 - v163) < 0.0) {
              __darwin_time_t tv_sec = v590;
            }
          }
        }
        float v166 = v133[v592];
        float v167 = v133[v591];
        float v168 = v133[v593];
        if ((float)(v166 - v167) >= 0.0)
        {
          uint64_t v169 = v591;
          if ((float)(v168 - v167) >= 0.0)
          {
            if ((float)(v168 - v166) >= 0.0) {
              uint64_t v169 = v592;
            }
            else {
              uint64_t v169 = v593;
            }
          }
        }
        else
        {
          uint64_t v169 = v592;
          if ((float)(v168 - v166) >= 0.0)
          {
            if ((float)(v168 - v167) >= 0.0) {
              uint64_t v169 = v591;
            }
            else {
              uint64_t v169 = v593;
            }
          }
        }
        float v170 = v133[v595];
        float v171 = v133[v594];
        float v172 = v133[v596];
        if ((float)(v170 - v171) >= 0.0)
        {
          uint64_t v173 = v594;
          if ((float)(v172 - v171) >= 0.0)
          {
            if ((float)(v172 - v170) >= 0.0) {
              uint64_t v173 = v595;
            }
            else {
              uint64_t v173 = v596;
            }
          }
        }
        else
        {
          uint64_t v173 = v595;
          if ((float)(v172 - v170) >= 0.0)
          {
            if ((float)(v172 - v171) >= 0.0) {
              uint64_t v173 = v594;
            }
            else {
              uint64_t v173 = v596;
            }
          }
        }
        float v174 = v133[v169];
        float v175 = v133[tv_sec];
        float v176 = v133[v173];
        if ((float)(v174 - v175) >= 0.0)
        {
          uint64_t v140 = tv_sec;
          if ((float)(v176 - v175) >= 0.0)
          {
            if ((float)(v176 - v174) >= 0.0) {
              uint64_t v140 = v169;
            }
            else {
              uint64_t v140 = v173;
            }
          }
        }
        else
        {
          uint64_t v140 = v169;
          if ((float)(v176 - v174) >= 0.0)
          {
            uint64_t v140 = tv_sec;
            if ((float)(v176 - v175) < 0.0) {
              uint64_t v140 = v173;
            }
          }
        }
LABEL_114:
        float v141 = *v133;
        *uint64_t v133 = v133[v140];
        v133[v140] = v141;
        uint64_t v142 = *v132;
        *float32x2_t v132 = v132[v140];
        v132[v140] = v142;
        if (v76 < 2)
        {
          uint64_t v144 = 0;
          uint64_t v143 = 0;
        }
        else
        {
          uint64_t v143 = 0;
          uint64_t v144 = 0;
          for (uint64_t i = 1; i != v76; ++i)
          {
            float v146 = v133[i];
            if ((float)(*v133 - v146) <= 0.0)
            {
              v133[i] = v133[++v144];
              v133[v144] = v146;
              uint64_t v147 = v132[i];
              v132[i] = v132[v144];
              v132[v144] = v147;
              if ((float)(*v133 - v133[i]) == 0.0)
              {
                float v148 = v133[v144];
                v133[v144] = v133[++v143];
                v133[v143] = v148;
                uint64_t v149 = v132[v144];
                v132[v144] = v132[v143];
                v132[v143] = v149;
              }
            }
          }
        }
        uint64_t v157 = v144 - v143;
        uint64_t v158 = v144 - v143;
        do
        {
          float v159 = v133[v158];
          v133[v158] = v133[v143];
          v133[v143] = v159;
          uint64_t v160 = v132[v158];
          v132[v158] = v132[v143];
          v132[v143] = v160;
          ++v158;
          BOOL v161 = v143-- <= 0;
        }
        while (!v161);
        if (v134 <= v144 && v134 >= v157) {
          goto LABEL_172;
        }
        uint64_t v135 = v144 + 1;
        float v136 = &v133[v135];
        float32x2_t v137 = &v132[v135];
        uint64_t v138 = v134 - v135;
        uint64_t v139 = v76 - v135;
        if (v134 < v157)
        {
          uint64_t v76 = v157;
        }
        else
        {
          uint64_t v133 = v136;
          float32x2_t v132 = v137;
          uint64_t v76 = v139;
        }
        if (v134 >= v157) {
          uint64_t v134 = v138;
        }
        if (!v76) {
          goto LABEL_172;
        }
        goto LABEL_112;
      }
    }
  }
  double v79 = malloc_type_malloc(8 * (int)v76, 0x100004000313F17uLL);
  double v80 = malloc_type_malloc(4 * (int)v76, 0x100004052888210uLL);
  double v81 = v80;
  uint64_t v574 = v22;
  if ((int)v76 <= a10)
  {
    free(v79);
    free(v81);
    goto LABEL_197;
  }
  v573 = v80;
  v572 = (char *)v79;
  float v82 = (float)v586 / (float)(((int)v578 + a11) / a11);
  float v83 = -0.5;
  if (v82 <= 0.0) {
    float v84 = -0.5;
  }
  else {
    float v84 = 0.5;
  }
  int v85 = (int)(float)(v82 + v84);
  if (v85 <= 1) {
    int v85 = 1;
  }
  float v86 = (float)v584 / (float)((v586 + a11 - 1) / a11);
  if (v86 > 0.0) {
    float v83 = 0.5;
  }
  int v87 = (int)(float)(v86 + v83);
  if (v87 <= 1) {
    int v87 = 1;
  }
  if (v586 > v584)
  {
    int v88 = (v87 + (int)v578) / v87;
  }
  else
  {
    int v87 = a11;
    int v88 = ((int)v578 + a11) / a11;
  }
  if (v586 > v584) {
    int v89 = (v586 + a11 - 1) / a11;
  }
  else {
    int v89 = (v586 + v85 - 1) / v85;
  }
  if (v586 > v584) {
    int v90 = a11;
  }
  else {
    int v90 = v85;
  }
  size_t v91 = v90 * v87;
  uint64_t v92 = (v90 * v87 + 1);
  double v93 = (int *)malloc_type_calloc(v91, 4uLL, 0x100004052888210uLL);
  double v94 = (int *)malloc_type_calloc((int)v92, 4uLL, 0x100004052888210uLL);
  float v95 = (float)v89;
  if ((int)v76 >= 1)
  {
    uint64_t v96 = v76;
    double v97 = (float *)(*(void *)(v587 + 8) + 4);
    do
    {
      float v98 = *(v97 - 1);
      if (v98 <= (float)(v586 - 1)) {
        float v99 = *(v97 - 1);
      }
      else {
        float v99 = (float)(v586 - 1);
      }
      if (v98 >= 0.0) {
        float v100 = v99;
      }
      else {
        float v100 = 0.0;
      }
      float v101 = *v97;
      v97 += 2;
      float v102 = v101;
      if (v101 <= (float)(int)v578) {
        float v103 = v102;
      }
      else {
        float v103 = (float)(int)v578;
      }
      float v104 = v100 / v95;
      if (v102 >= 0.0) {
        float v105 = v103;
      }
      else {
        float v105 = 0.0;
      }
      uint64_t v106 = (int)v104 + v90 * (int)(float)(v105 / (float)v88);
      ++v93[v106];
      --v96;
    }
    while (v96);
  }
  *double v94 = 0;
  if ((int)v91 >= 1)
  {
    int v107 = 0;
    uint64_t v108 = v92 - 1;
    long long v109 = v94 + 1;
    long long v110 = v93;
    do
    {
      int v111 = *v110++;
      v107 += v111;
      *v109++ = v107;
      --v108;
    }
    while (v108);
  }
  if ((int)v76 >= 1)
  {
    uint64_t v112 = 0;
    uint64_t v113 = 0;
    do
    {
      os_signpost_id_t v114 = (float *)(*(void *)(v587 + 8) + v113);
      float v115 = v114[1];
      if (*v114 <= (float)(v586 - 1)) {
        float v116 = *v114;
      }
      else {
        float v116 = (float)(v586 - 1);
      }
      if (*v114 >= 0.0) {
        float v117 = v116;
      }
      else {
        float v117 = 0.0;
      }
      float v118 = v117 / v95;
      if (v115 <= (float)(int)v578) {
        float v119 = v114[1];
      }
      else {
        float v119 = (float)(int)v578;
      }
      int v120 = (int)v118;
      if (v115 >= 0.0) {
        float v121 = v119;
      }
      else {
        float v121 = 0.0;
      }
      uint64_t v122 = v120 + v90 * (int)(float)(v121 / (float)v88);
      uint64_t v123 = v94[v122];
      v94[v122] = v123 + 1;
      *(void *)&v572[8 * v123] = *(void *)v114;
      v573[v123] = *(_DWORD *)(*(void *)(v574 + 8) + v112);
      v113 += 8;
      v112 += 4;
    }
    while (8 * v76 != v113);
  }
  *double v94 = 0;
  v585 = v94;
  if ((int)v91 > 0)
  {
    int v124 = 0;
    uint64_t v125 = v92 - 1;
    int v126 = v94 + 1;
    float32x2_t v127 = v93;
    do
    {
      int v128 = *v127++;
      v124 += v128;
      *v126++ = v124;
      --v125;
    }
    while (v125);
    float32x2_t v129 = (int32x4_t *)malloc_type_malloc(4 * v91, 0x100004052888210uLL);
    if (v91 >= 8)
    {
      size_t v130 = v91 & 0x7FFFFFF8;
      int32x4_t v358 = (int32x4_t)xmmword_21BB7A770;
      v359 = v129 + 1;
      v360.i64[0] = 0x400000004;
      v360.i64[1] = 0x400000004;
      v361.i64[0] = 0x800000008;
      v361.i64[1] = 0x800000008;
      uint64_t v362 = v91 & 0xFFFFFFF8;
      do
      {
        v359[-1] = v358;
        int32x4_t *v359 = vaddq_s32(v358, v360);
        int32x4_t v358 = vaddq_s32(v358, v361);
        v359 += 2;
        v362 -= 8;
      }
      while (v362);
      if (v130 == v91) {
        goto LABEL_307;
      }
    }
    else
    {
      size_t v130 = 0;
    }
    do
    {
      v129->i32[v130] = v130;
      ++v130;
    }
    while (v91 != v130);
LABEL_307:
    unint64_t v357 = v91;
    float v356 = (int *)v129;
    goto LABEL_308;
  }
  float v356 = (int *)malloc_type_malloc(4 * v91, 0x100004052888210uLL);
  unint64_t v357 = v91;
LABEL_308:
  float v363 = (char *)malloc_type_malloc(0x200uLL, 0x5AA2E4D5uLL);
  uint64_t v364 = 0;
  char v365 = 1;
  uint64_t v366 = 32;
  float v367 = (char *)v93;
  float v368 = v356;
  unint64_t v571 = v357;
  v579 = (char *)v93;
  float v369 = v356;
  v582 = v356;
  do
  {
    uint64_t v370 = v364;
    while (1)
    {
      if ((v365 & 1) == 0)
      {
        --v370;
        float v371 = (uint64_t *)&v363[16 * v370];
        unint64_t v357 = v371[1];
        uint64_t v372 = *v371;
        float v367 = (char *)&v93[v372];
        float v368 = &v369[v372];
      }
      if ((uint64_t)v357 > 15) {
        break;
      }
      if ((uint64_t)v357 > 1)
      {
        int v373 = 2;
        for (uint64_t j = 1; j != v357; ++j)
        {
          int v375 = v373;
          do
          {
            uint64_t v376 = (v375 - 1);
            uint64_t v377 = (v375 - 2);
            int v378 = *(_DWORD *)&v367[4 * v376];
            int v379 = *(_DWORD *)&v367[4 * v377];
            if (v378 >= v379) {
              break;
            }
            uint64_t v380 = v376;
            *(_DWORD *)&v367[v380 * 4] = v379;
            uint64_t v381 = v377;
            *(_DWORD *)&v367[v381 * 4] = v378;
            int v382 = v368[v376];
            v368[v380] = v368[v381];
            v368[v381] = v382;
            int v375 = v376;
          }
          while ((int)v376 > 1);
          ++v373;
        }
      }
      char v365 = 0;
      unint64_t v357 = 0;
      if (v370 < 1) {
        goto LABEL_380;
      }
    }
    if (v357 > 0x27)
    {
      uint64_t v389 = 0;
      uint64_t v390 = 0;
      if (v357 <= 0x7D0) {
        uint64_t v391 = 8;
      }
      else {
        uint64_t v391 = 26;
      }
      if (v357 <= 0x7D0) {
        unint64_t v392 = 3;
      }
      else {
        unint64_t v392 = 9;
      }
      while (1)
      {
        uint64_t v393 = (uint64_t)(v357 - 1 + v389) / v391;
        int v394 = *(_DWORD *)&v367[4 * (v389 / v391)];
        int v395 = *(_DWORD *)&v367[4 * v393];
        uint64_t v396 = (uint64_t)(2 * v357 - 2 + v389) / v391;
        int v397 = *(_DWORD *)&v367[4 * v396];
        if (v394 >= v395)
        {
          if (v394 < v397) {
            goto LABEL_346;
          }
          if (v395 < v397)
          {
LABEL_348:
            *(&v589.tv_sec + v390) = v396;
            goto LABEL_340;
          }
        }
        else if (v395 >= v397)
        {
          if (v394 < v397) {
            goto LABEL_348;
          }
LABEL_346:
          *(&v589.tv_sec + v390) = v389 / v391;
          goto LABEL_340;
        }
        *(&v589.tv_sec + v390) = v393;
LABEL_340:
        ++v390;
        v389 += 3 * v357 - 3;
        if (v392 == v390)
        {
          while (1)
          {
            uint64_t v398 = 0;
            uint64_t v399 = 0;
            unint64_t v400 = v392;
            v392 /= 3uLL;
            if (v392 <= 1) {
              uint64_t v401 = 1;
            }
            else {
              uint64_t v401 = v392;
            }
            uint64_t v402 = 8 * v401;
            do
            {
              __darwin_time_t v403 = *(__darwin_time_t *)((char *)&v589.tv_sec + v398);
              __darwin_time_t v404 = *(void *)((char *)&v589.tv_usec + v398);
              int v405 = *(_DWORD *)&v367[4 * v403];
              __darwin_time_t v406 = *(void *)((char *)&v589 + v398 + 16);
              int v407 = *(_DWORD *)&v367[4 * v404];
              int v408 = *(_DWORD *)&v367[4 * v406];
              if (v405 >= v407)
              {
                if (v405 < v408) {
                  goto LABEL_361;
                }
                if (v407 >= v408)
                {
LABEL_354:
                  *(__darwin_time_t *)((char *)&v589.tv_sec + v399) = v404;
                  goto LABEL_355;
                }
              }
              else
              {
                if (v407 < v408) {
                  goto LABEL_354;
                }
                if (v405 >= v408)
                {
LABEL_361:
                  *(__darwin_time_t *)((char *)&v589.tv_sec + v399) = v403;
                  goto LABEL_355;
                }
              }
              *(__darwin_time_t *)((char *)&v589.tv_sec + v399) = v406;
LABEL_355:
              v399 += 8;
              v398 += 24;
            }
            while (v402 != v399);
            if (v400 < 9)
            {
              __darwin_time_t v383 = v589.tv_sec;
              int v384 = *(_DWORD *)v367;
              goto LABEL_365;
            }
          }
        }
      }
    }
    __darwin_time_t v383 = v357 >> 1;
    int v384 = *(_DWORD *)v367;
    int v385 = *(_DWORD *)&v367[4 * (v357 >> 1)];
    __darwin_time_t v386 = v357 - 1;
    int v387 = *(_DWORD *)&v367[4 * v357 - 4];
    if (v385 >= v387) {
      __darwin_time_t v388 = v357 >> 1;
    }
    else {
      __darwin_time_t v388 = v357 - 1;
    }
    if (v384 >= v387) {
      __darwin_time_t v386 = 0;
    }
    else {
      __darwin_time_t v388 = 0;
    }
    if (v385 >= v387) {
      __darwin_time_t v383 = v386;
    }
    if (v384 >= v385) {
      __darwin_time_t v383 = v388;
    }
LABEL_365:
    uint64_t v409 = 0;
    uint64_t v410 = 0;
    uint64_t v411 = v383;
    *(_DWORD *)float v367 = *(_DWORD *)&v367[v411 * 4];
    *(_DWORD *)&v367[v411 * 4] = v384;
    int v412 = *v368;
    *float v368 = v368[v411];
    v368[v411] = v412;
    for (uint64_t k = 1; k != v357; ++k)
    {
      int v414 = *(_DWORD *)&v367[4 * k];
      if (v414 <= *(_DWORD *)v367)
      {
        uint64_t v415 = ++v409;
        uint64_t v416 = k;
        *(_DWORD *)&v367[v416 * 4] = *(_DWORD *)&v367[4 * v409];
        *(_DWORD *)&v367[v415 * 4] = v414;
        int v417 = v368[k];
        v368[v416] = v368[v409];
        v368[v415] = v417;
        if (*(_DWORD *)&v367[4 * k] == *(_DWORD *)v367)
        {
          ++v410;
          int v418 = *(_DWORD *)&v367[4 * v409];
          uint64_t v419 = v410;
          *(_DWORD *)&v367[4 * v409] = *(_DWORD *)&v367[4 * v410];
          *(_DWORD *)&v367[v419 * 4] = v418;
          int v420 = v368[v409];
          v368[v409] = v368[v410];
          v368[v419] = v420;
        }
      }
    }
    uint64_t v421 = 4 * v409 - 4 * v410;
    uint64_t v422 = v410;
    do
    {
      int v423 = *(_DWORD *)&v367[v421];
      uint64_t v424 = v422;
      *(_DWORD *)&v367[v421] = *(_DWORD *)&v367[4 * v422];
      *(_DWORD *)&v367[v424 * 4] = v423;
      int v425 = *(int *)((char *)v368 + v421);
      *(int *)((char *)v368 + v421) = v368[v422];
      v368[v424] = v425;
      v421 += 4;
      BOOL v161 = v422-- <= 0;
    }
    while (!v161);
    uint64_t v364 = v370 + 1;
    if (v370 + 1 >= v366)
    {
      uint64_t v426 = 2 * v366;
      float v363 = (char *)malloc_type_realloc(v363, 32 * v366, 0x4E0BDDC7uLL);
      float v369 = v582;
      uint64_t v366 = v426;
      uint64_t v75 = v587;
    }
    __int32 v427 = &v363[16 * v370];
    *(void *)__int32 v427 = v409 + ((v367 - v579) >> 2) + 1;
    *((void *)v427 + 1) = v357 + ~v409;
    unint64_t v357 = v409 - v410;
    BOOL v180 = v409 == v410;
    double v93 = (int *)v579;
    char v365 = !v180;
    double v77 = v575;
  }
  while ((v370 & 0x8000000000000000) == 0 || v357);
LABEL_380:
  free(v363);
  unint64_t v428 = v571;
  if ((int)v571 >= 1)
  {
    __int32 v429 = v93;
    uint64_t v430 = v571;
    int v431 = a10;
    do
    {
      uint64_t v432 = *v429;
      if (v430 * v432 > v431)
      {
        uint64_t v432 = v431 / v430;
        *__int32 v429 = v432;
      }
      v431 -= v432;
      ++v429;
      --v430;
    }
    while (v430);
  }
  float32x2_t v433 = (char *)malloc_type_malloc(0x200uLL, 0x5AA2E4D5uLL);
  uint64_t v434 = 0;
  BOOL v435 = 1;
  uint64_t v436 = 32;
  __int32 v437 = v93;
  __int32 v438 = v582;
  __int32 v439 = (char *)v582;
  while (2)
  {
    uint64_t v440 = v434;
    while (1)
    {
      if (!v435)
      {
        --v440;
        float32x2_t v441 = (uint64_t *)&v433[16 * v440];
        unint64_t v428 = v441[1];
        uint64_t v442 = *v441;
        __int32 v439 = (char *)&v438[v442];
        __int32 v437 = &v93[v442];
      }
      if ((uint64_t)v428 > 15) {
        break;
      }
      if ((uint64_t)v428 > 1)
      {
        int v443 = 2;
        for (uint64_t m = 1; m != v428; ++m)
        {
          int v445 = v443;
          do
          {
            uint64_t v446 = (v445 - 1);
            uint64_t v447 = (v445 - 2);
            int v448 = *(_DWORD *)&v439[4 * v446];
            int v449 = *(_DWORD *)&v439[4 * v447];
            if (v448 >= v449) {
              break;
            }
            uint64_t v450 = v446;
            *(_DWORD *)&v439[v450 * 4] = v449;
            uint64_t v451 = v447;
            *(_DWORD *)&v439[v451 * 4] = v448;
            int v452 = v437[v446];
            v437[v450] = v437[v451];
            v437[v451] = v452;
            int v445 = v446;
          }
          while ((int)v446 > 1);
          ++v443;
        }
      }
      BOOL v435 = 0;
      unint64_t v428 = 0;
      if (v440 < 1) {
        goto LABEL_454;
      }
    }
    if (v428 > 0x27)
    {
      uint64_t v459 = 0;
      uint64_t v460 = 0;
      if (v428 <= 0x7D0) {
        uint64_t v461 = 8;
      }
      else {
        uint64_t v461 = 26;
      }
      if (v428 <= 0x7D0) {
        unint64_t v462 = 3;
      }
      else {
        unint64_t v462 = 9;
      }
      while (1)
      {
        uint64_t v463 = (uint64_t)(v428 - 1 + v459) / v461;
        int v464 = *(_DWORD *)&v439[4 * (v459 / v461)];
        int v465 = *(_DWORD *)&v439[4 * v463];
        uint64_t v466 = (uint64_t)(2 * v428 - 2 + v459) / v461;
        int v467 = *(_DWORD *)&v439[4 * v466];
        if (v464 >= v465)
        {
          if (v464 < v467) {
            goto LABEL_423;
          }
          if (v465 < v467)
          {
LABEL_425:
            *(&v589.tv_sec + v460) = v466;
            goto LABEL_417;
          }
        }
        else if (v465 >= v467)
        {
          if (v464 < v467) {
            goto LABEL_425;
          }
LABEL_423:
          *(&v589.tv_sec + v460) = v459 / v461;
          goto LABEL_417;
        }
        *(&v589.tv_sec + v460) = v463;
LABEL_417:
        ++v460;
        v459 += 3 * v428 - 3;
        if (v462 == v460)
        {
          while (1)
          {
            uint64_t v468 = 0;
            uint64_t v469 = 0;
            unint64_t v470 = v462;
            v462 /= 3uLL;
            if (v462 <= 1) {
              uint64_t v471 = 1;
            }
            else {
              uint64_t v471 = v462;
            }
            uint64_t v472 = 8 * v471;
            do
            {
              __darwin_time_t v473 = *(__darwin_time_t *)((char *)&v589.tv_sec + v468);
              __darwin_time_t v474 = *(void *)((char *)&v589.tv_usec + v468);
              int v475 = *(_DWORD *)&v439[4 * v473];
              __darwin_time_t v476 = *(void *)((char *)&v589 + v468 + 16);
              int v477 = *(_DWORD *)&v439[4 * v474];
              int v478 = *(_DWORD *)&v439[4 * v476];
              if (v475 >= v477)
              {
                if (v475 < v478) {
                  goto LABEL_438;
                }
                if (v477 >= v478)
                {
LABEL_431:
                  *(__darwin_time_t *)((char *)&v589.tv_sec + v469) = v474;
                  goto LABEL_432;
                }
              }
              else
              {
                if (v477 < v478) {
                  goto LABEL_431;
                }
                if (v475 >= v478)
                {
LABEL_438:
                  *(__darwin_time_t *)((char *)&v589.tv_sec + v469) = v473;
                  goto LABEL_432;
                }
              }
              *(__darwin_time_t *)((char *)&v589.tv_sec + v469) = v476;
LABEL_432:
              v469 += 8;
              v468 += 24;
            }
            while (v472 != v469);
            if (v470 < 9)
            {
              __darwin_time_t v453 = v589.tv_sec;
              int v454 = *(_DWORD *)v439;
              goto LABEL_442;
            }
          }
        }
      }
    }
    __darwin_time_t v453 = v428 >> 1;
    int v454 = *(_DWORD *)v439;
    int v455 = *(_DWORD *)&v439[4 * (v428 >> 1)];
    __darwin_time_t v456 = v428 - 1;
    int v457 = *(_DWORD *)&v439[4 * v428 - 4];
    if (v455 >= v457) {
      __darwin_time_t v458 = v428 >> 1;
    }
    else {
      __darwin_time_t v458 = v428 - 1;
    }
    if (v454 >= v457) {
      __darwin_time_t v456 = 0;
    }
    else {
      __darwin_time_t v458 = 0;
    }
    if (v455 >= v457) {
      __darwin_time_t v453 = v456;
    }
    if (v454 >= v455) {
      __darwin_time_t v453 = v458;
    }
LABEL_442:
    uint64_t v479 = 0;
    uint64_t v480 = 0;
    uint64_t v481 = v453;
    *(_DWORD *)__int32 v439 = *(_DWORD *)&v439[v481 * 4];
    *(_DWORD *)&v439[v481 * 4] = v454;
    int v482 = *v437;
    *__int32 v437 = v437[v481];
    v437[v481] = v482;
    for (uint64_t n = 1; n != v428; ++n)
    {
      int v484 = *(_DWORD *)&v439[4 * n];
      if (v484 <= *(_DWORD *)v439)
      {
        uint64_t v485 = ++v480;
        uint64_t v486 = n;
        *(_DWORD *)&v439[v486 * 4] = *(_DWORD *)&v439[4 * v480];
        *(_DWORD *)&v439[v485 * 4] = v484;
        int v487 = v437[n];
        v437[v486] = v437[v480];
        v437[v485] = v487;
        if (*(_DWORD *)&v439[4 * n] == *(_DWORD *)v439)
        {
          ++v479;
          int v488 = *(_DWORD *)&v439[4 * v480];
          uint64_t v489 = v479;
          *(_DWORD *)&v439[4 * v480] = *(_DWORD *)&v439[4 * v479];
          *(_DWORD *)&v439[v489 * 4] = v488;
          int v490 = v437[v480];
          v437[v480] = v437[v479];
          v437[v489] = v490;
        }
      }
    }
    uint64_t v491 = 4 * v480 - 4 * v479;
    uint64_t v492 = v479;
    do
    {
      int v493 = *(_DWORD *)&v439[v491];
      uint64_t v494 = v492;
      *(_DWORD *)&v439[v491] = *(_DWORD *)&v439[4 * v492];
      *(_DWORD *)&v439[v494 * 4] = v493;
      int v495 = *(int *)((char *)v437 + v491);
      *(int *)((char *)v437 + v491) = v437[v492];
      v437[v494] = v495;
      v491 += 4;
      BOOL v161 = v492-- <= 0;
    }
    while (!v161);
    uint64_t v434 = v440 + 1;
    if (v440 + 1 >= v436)
    {
      uint64_t v496 = 2 * v436;
      float32x2_t v433 = (char *)malloc_type_realloc(v433, 32 * v436, 0x4E0BDDC7uLL);
      __int32 v438 = v582;
      uint64_t v436 = v496;
      uint64_t v75 = v587;
    }
    float32x2_t v497 = &v433[16 * v440];
    *(void *)float32x2_t v497 = v480 + ((v439 - (char *)v438) >> 2) + 1;
    *((void *)v497 + 1) = v428 + ~v480;
    unint64_t v428 = v480 - v479;
    BOOL v435 = v480 != v479;
    double v77 = v575;
    double v93 = (int *)v579;
    if ((v440 & 0x8000000000000000) == 0 || v428) {
      continue;
    }
    break;
  }
LABEL_454:
  float32x2_t v498 = v438;
  free(v433);
  free(v498);
  *(void *)uint64_t v75 = 0;
  *(void *)uint64_t v574 = 0;
  __int32 v499 = v572;
  double v78 = v577;
  if ((int)v571 >= 1)
  {
    uint64_t v500 = 0;
    uint64_t v501 = v571;
    while (1)
    {
      uint64_t v583 = v500 + 1;
      int v503 = v585[v500 + 1];
      int v504 = v585[v500];
      int v505 = v93[v500];
      if (v503 - v504 > v505) {
        break;
      }
LABEL_462:
      if (v505 >= 1)
      {
        uint64_t v506 = v585[v500];
        uint64_t v507 = *(void *)v75;
        uint64_t v508 = *(void *)v75 + v505;
        uint64_t v509 = *(void *)(v75 + 16);
        if (v508 > v509)
        {
          uint64_t v510 = 2 * v509;
          BOOL v180 = v509 == 0;
          uint64_t v511 = 32;
          if (!v180) {
            uint64_t v511 = v510;
          }
          if (v511 <= v508) {
            uint64_t v512 = *(void *)v75 + v505;
          }
          else {
            uint64_t v512 = v511;
          }
          if (v512)
          {
            *(void *)(v75 + 8) = malloc_type_realloc(*(void **)(v75 + 8), 8 * v512, 0x815F1FB0uLL);
            uint64_t v507 = *(void *)v75;
            int v505 = *(_DWORD *)&v579[4 * v500];
          }
          *(void *)(v75 + 16) = v512;
        }
        memcpy((void *)(*(void *)(v75 + 8) + 8 * v507), &v499[8 * v506], 8 * v505);
        double v93 = (int *)v579;
        uint64_t v513 = *(int *)&v579[4 * v500];
        *(void *)v75 += v513;
        if ((int)v513 >= 1)
        {
          float32x2_t v514 = v78;
          uint64_t v515 = v75;
          uint64_t v516 = v501;
          __int32 v517 = v499;
          uint64_t v518 = v585[v500];
          uint64_t v519 = *(void *)v574;
          uint64_t v520 = *(void *)v574 + v513;
          uint64_t v521 = *(void *)(v574 + 16);
          if (v520 <= v521)
          {
            __int32 v502 = (void *)v574;
          }
          else
          {
            uint64_t v522 = 2 * v521;
            BOOL v180 = v521 == 0;
            uint64_t v523 = 64;
            if (!v180) {
              uint64_t v523 = v522;
            }
            if (v523 <= v520) {
              uint64_t v524 = *(void *)v574 + v513;
            }
            else {
              uint64_t v524 = v523;
            }
            __int32 v502 = (void *)v574;
            if (v524)
            {
              *(void *)(v574 + 8) = malloc_type_realloc(*(void **)(v574 + 8), 4 * v524, 0x313DB283uLL);
              uint64_t v519 = *(void *)v574;
              uint64_t v513 = *(int *)&v579[4 * v500];
            }
            *(void *)(v574 + 16) = v524;
          }
          memcpy((void *)(v502[1] + 4 * v519), &v573[v518], 4 * v513);
          double v93 = (int *)v579;
          *v502 += *(int *)&v579[4 * v500];
          __int32 v499 = v517;
          uint64_t v501 = v516;
          uint64_t v75 = v515;
          double v78 = v514;
          double v77 = v575;
        }
      }
      ++v500;
      if (v583 == v501) {
        goto LABEL_549;
      }
    }
    unsigned int v588 = 1337;
    if (v503 == v504)
    {
LABEL_461:
      double v78 = v577;
      double v93 = (int *)v579;
      int v505 = *(_DWORD *)&v579[4 * v500];
      double v77 = v575;
      goto LABEL_462;
    }
    uint64_t v525 = v505;
    uint64_t v526 = v503 - v504;
    uint64_t v527 = v585[v500];
    __int32 v528 = &v499[8 * v527];
    float32x2_t v529 = (float *)&v573[v527];
    while (2)
    {
      if (v526 <= 9999)
      {
        uint64_t v535 = rand_r(&v588) % v526;
        goto LABEL_491;
      }
      uint64_t v545 = 0;
      uint64_t v546 = 0;
LABEL_500:
      uint64_t v547 = (v526 - 1 + v545) / 26;
      uint64_t v548 = (2 * v526 - 2 + v545) / 26;
      float v549 = v529[v547];
      float v550 = v529[v545 / 26];
      float v551 = v529[v548];
      if ((float)(v549 - v550) >= 0.0)
      {
        if ((float)(v551 - v550) < 0.0) {
          goto LABEL_505;
        }
        if ((float)(v551 - v549) < 0.0) {
          goto LABEL_507;
        }
      }
      else if ((float)(v551 - v549) >= 0.0)
      {
        if ((float)(v551 - v550) < 0.0)
        {
LABEL_507:
          *(__darwin_time_t *)((char *)&v589.tv_sec + v546) = v548;
LABEL_499:
          v546 += 8;
          v545 += 3 * v526 - 3;
          if (v546 == 72)
          {
            float v556 = v529[*(void *)&v589.tv_usec];
            float v557 = v529[v589.tv_sec];
            float v558 = v529[v590];
            if ((float)(v556 - v557) >= 0.0)
            {
              __darwin_time_t v559 = v589.tv_sec;
              if ((float)(v558 - v557) >= 0.0)
              {
                if ((float)(v558 - v556) >= 0.0) {
                  __darwin_time_t v559 = *(void *)&v589.tv_usec;
                }
                else {
                  __darwin_time_t v559 = v590;
                }
              }
            }
            else
            {
              __darwin_time_t v559 = *(void *)&v589.tv_usec;
              if ((float)(v558 - v556) >= 0.0)
              {
                __darwin_time_t v559 = v589.tv_sec;
                if ((float)(v558 - v557) < 0.0) {
                  __darwin_time_t v559 = v590;
                }
              }
            }
            float v560 = v529[v592];
            float v561 = v529[v591];
            float v562 = v529[v593];
            if ((float)(v560 - v561) >= 0.0)
            {
              uint64_t v563 = v591;
              if ((float)(v562 - v561) >= 0.0)
              {
                if ((float)(v562 - v560) >= 0.0) {
                  uint64_t v563 = v592;
                }
                else {
                  uint64_t v563 = v593;
                }
              }
            }
            else
            {
              uint64_t v563 = v592;
              if ((float)(v562 - v560) >= 0.0)
              {
                if ((float)(v562 - v561) >= 0.0) {
                  uint64_t v563 = v591;
                }
                else {
                  uint64_t v563 = v593;
                }
              }
            }
            float v564 = v529[v595];
            float v565 = v529[v594];
            float v566 = v529[v596];
            if ((float)(v564 - v565) >= 0.0)
            {
              uint64_t v567 = v594;
              if ((float)(v566 - v565) >= 0.0)
              {
                if ((float)(v566 - v564) >= 0.0) {
                  uint64_t v567 = v595;
                }
                else {
                  uint64_t v567 = v596;
                }
              }
            }
            else
            {
              uint64_t v567 = v595;
              if ((float)(v566 - v564) >= 0.0)
              {
                if ((float)(v566 - v565) >= 0.0) {
                  uint64_t v567 = v594;
                }
                else {
                  uint64_t v567 = v596;
                }
              }
            }
            float v568 = v529[v563];
            float v569 = v529[v559];
            float v570 = v529[v567];
            if ((float)(v568 - v569) >= 0.0)
            {
              uint64_t v535 = v559;
              if ((float)(v570 - v569) >= 0.0)
              {
                if ((float)(v570 - v568) >= 0.0) {
                  uint64_t v535 = v563;
                }
                else {
                  uint64_t v535 = v567;
                }
              }
            }
            else
            {
              uint64_t v535 = v563;
              if ((float)(v570 - v568) >= 0.0)
              {
                uint64_t v535 = v559;
                if ((float)(v570 - v569) < 0.0) {
                  uint64_t v535 = v567;
                }
              }
            }
LABEL_491:
            float v536 = *v529;
            *float32x2_t v529 = v529[v535];
            v529[v535] = v536;
            uint64_t v537 = *(void *)v528;
            *(void *)__int32 v528 = *(void *)&v528[8 * v535];
            *(void *)&v528[8 * v535] = v537;
            if (v526 < 2)
            {
              uint64_t v539 = 0;
              uint64_t v538 = 0;
            }
            else
            {
              uint64_t v538 = 0;
              uint64_t v539 = 0;
              for (iuint64_t i = 1; ii != v526; ++ii)
              {
                float v541 = v529[ii];
                if ((float)(*v529 - v541) <= 0.0)
                {
                  v529[ii] = v529[++v539];
                  v529[v539] = v541;
                  uint64_t v542 = *(void *)&v528[8 * ii];
                  *(void *)&v528[8 * ii] = *(void *)&v528[8 * v539];
                  *(void *)&v528[8 * v539] = v542;
                  if ((float)(*v529 - v529[ii]) == 0.0)
                  {
                    float v543 = v529[v539];
                    v529[v539] = v529[++v538];
                    v529[v538] = v543;
                    uint64_t v544 = *(void *)&v528[8 * v539];
                    *(void *)&v528[8 * v539] = *(void *)&v528[8 * v538];
                    *(void *)&v528[8 * v538] = v544;
                  }
                }
              }
            }
            uint64_t v552 = v539 - v538;
            uint64_t v553 = v539 - v538;
            do
            {
              float v554 = v529[v553];
              v529[v553] = v529[v538];
              v529[v538] = v554;
              uint64_t v555 = *(void *)&v528[8 * v553];
              *(void *)&v528[8 * v553] = *(void *)&v528[8 * v538];
              *(void *)&v528[8 * v538] = v555;
              ++v553;
              BOOL v161 = v538-- <= 0;
            }
            while (!v161);
            if (v525 <= v539 && v525 >= v552) {
              goto LABEL_461;
            }
            uint64_t v530 = v539 + 1;
            __int32 v531 = &v529[v530];
            __int32 v532 = &v528[8 * v530];
            uint64_t v533 = v525 - v530;
            uint64_t v534 = v526 - v530;
            if (v525 < v552)
            {
              uint64_t v526 = v552;
            }
            else
            {
              float32x2_t v529 = v531;
              __int32 v528 = v532;
              uint64_t v526 = v534;
            }
            if (v525 >= v552) {
              uint64_t v525 = v533;
            }
            if (!v526) {
              goto LABEL_461;
            }
            continue;
          }
          goto LABEL_500;
        }
LABEL_505:
        *(__darwin_time_t *)((char *)&v589.tv_sec + v546) = v545 / 26;
        goto LABEL_499;
      }
      break;
    }
    *(__darwin_time_t *)((char *)&v589.tv_sec + v546) = v547;
    goto LABEL_499;
  }
LABEL_549:
  free(v93);
  free(v585);
  free(v499);
  free(v573);
  if (v78)
  {
LABEL_198:
    float v188 = fabsf(*(float *)v580.i32);
    float v189 = fabsf(v24);
    float v190 = v576;
    if (v77) {
      float v190 = v77;
    }
    uint64_t v191 = *((int *)v190 + 2);
    uint64_t v192 = v190[2] / v191;
    uint64_t v193 = v78[2];
    if (v188 == INFINITY || v189 == INFINITY)
    {
      uint64_t v203 = *(void *)v75;
      uint64_t v204 = *v78;
      uint64_t v205 = v203 * 4 * (int)v192;
      if (v205 > v193)
      {
        uint64_t v206 = 2 * v193;
        BOOL v180 = v193 == 0;
        uint64_t v207 = 256;
        if (!v180) {
          uint64_t v207 = v206;
        }
        if (v207 <= v205) {
          size_t v208 = v205;
        }
        else {
          size_t v208 = v207;
        }
        if (v208) {
          v78[1] = malloc_type_realloc((void *)v78[1], v208, 0x9E332015uLL);
        }
        v78[2] = v208;
      }
      if (v205 > v204) {
        bzero((void *)(*v78 + v78[1]), v205 - v204);
      }
      uint64_t v200 = v587;
      uint64_t v201 = *(void *)v587;
      uint64_t v202 = 4;
      *double v78 = *(void *)v587 * 4 * (int)v192;
      if (v201 < 1) {
        return;
      }
    }
    else
    {
      double v194 = (void *)v75;
      uint64_t v195 = *v78;
      int64_t v196 = *v194 * (int)v192;
      if (v196 > v193)
      {
        uint64_t v197 = 2 * v193;
        BOOL v180 = v193 == 0;
        uint64_t v198 = 256;
        if (!v180) {
          uint64_t v198 = v197;
        }
        if (v198 <= v196) {
          size_t v199 = v196;
        }
        else {
          size_t v199 = v198;
        }
        if (v199) {
          v78[1] = malloc_type_realloc((void *)v78[1], v199, 0x166E72E9uLL);
        }
        v78[2] = v199;
      }
      if (v196 > v195) {
        bzero((void *)(*v78 + v78[1]), v196 - v195);
      }
      uint64_t v200 = v587;
      uint64_t v201 = *(void *)v587;
      uint64_t v202 = 1;
      *double v78 = *(void *)v587 * (int)v192;
      if (v201 < 1) {
        return;
      }
    }
    uint64_t v209 = 0;
    double v210 = (float)(v586 / (int)v191);
    float v211 = 256.0 / (float)(v24 - *(float *)v580.i32);
    uint64_t v212 = v202 * (v192 << 32);
    unint64_t v213 = v192 & 0xF;
    float32x4_t v214 = (float32x4_t)vdupq_lane_s32(v580, 0);
    v215.i64[0] = 0xFF000000FFLL;
    v215.i64[1] = 0xFF000000FFLL;
    while (1)
    {
      uint64_t v216 = (float *)(*(void *)(v200 + 8) + 8 * v209);
      double v223 = (*v216 + 0.5) / v210 + -0.5;
      *(float *)&double v223 = v223;
      float v217 = (v216[1] + 0.5) / v210 + -0.5;
      int v218 = (int)*(float *)&v223;
      int v219 = (int)v217;
      int v220 = (int)(float)(*(float *)&v223 + 1.0);
      int v221 = (int)(float)(v217 + 1.0);
      float v222 = *(float *)&v223 - (float)(int)*(float *)&v223;
      v42.f32[0] = v217 - (float)(int)v217;
      *(float *)&double v223 = (float)(1.0 - v222) * (float)(1.0 - v42.f32[0]);
      float v224 = v222 * (float)(1.0 - v42.f32[0]);
      *(float *)v40.i32 = (float)(1.0 - v222) * v42.f32[0];
      v41.f32[0] = v222 * v42.f32[0];
      if (v77) {
        break;
      }
      int v241 = *((_DWORD *)v576 + 2);
      int v240 = *((_DWORD *)v576 + 3);
      int v242 = v241 - 1;
      if (v241 - 1 >= v220) {
        int v242 = v220;
      }
      if (v240 - 1 >= v221) {
        int v243 = v221;
      }
      else {
        int v243 = v240 - 1;
      }
      uint64_t v244 = *v576;
      float v230 = *(float *)v580.i32;
      if (!a12)
      {
        if ((int)v192 < 1) {
          goto LABEL_228;
        }
        uint64_t v261 = v218;
        uint64_t v262 = v242;
        uint64_t v263 = v242 + v241 * (uint64_t)v243;
        uint64_t v264 = 4 * v240 * (uint64_t)v241;
        uint64_t v265 = v261 + v241 * (uint64_t)v243;
        uint64_t v266 = v262 + v241 * (uint64_t)v219;
        uint64_t v267 = v261 + v241 * (uint64_t)v219;
        float v268 = &v589;
        uint64_t v269 = v192;
        do
        {
          v43.i32[0] = *(_DWORD *)(v244 + 4 * v265);
          *(float *)&v268->__darwin_time_t tv_sec = (float)((float)((float)(v224 * *(float *)(v244 + 4 * v266))
                                                  + (float)(*(float *)(v244 + 4 * v267) * *(float *)&v223))
                                          + (float)(v43.f32[0] * *(float *)v40.i32))
                                  + (float)(*(float *)(v244 + 4 * v263) * v41.f32[0]);
          float v268 = (timeval *)((char *)v268 + 4);
          v244 += v264;
          --v269;
        }
        while (v269);
        goto LABEL_272;
      }
      if ((int)v192 < 1) {
        goto LABEL_228;
      }
      uint64_t v245 = v218 * (int)v192;
      uint64_t v246 = v219;
      uint64_t v247 = v576[2];
      uint64_t v248 = v242 * (int)v192;
      if (v192 >= 8uLL)
      {
        float32x4_t v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v223, 0);
        float32x4_t v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 0);
        float32x4_t v271 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0);
        uint64_t v272 = 4 * v245;
        uint64_t v273 = 4 * v248;
        uint64_t v274 = v244 + 4 * v247 * v243;
        float v275 = (float32x4_t *)&v590;
        unint64_t v276 = v192 - (unint64_t)(v192 & 7);
        do
        {
          float32x4_t v44 = *(float32x4_t *)(v274 + v273);
          float32x4_t v45 = *(float32x4_t *)(v274 + v273 + 16);
          float32x4_t v277 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(*(float32x4_t *)(v244 + 4 * v247 * v246 + 16 + v273), v224), v42, *(float32x4_t *)(v244 + 4 * v247 * v246 + 16 + v272)), v43, *(float32x4_t *)(v274 + v272 + 16)), v271, v45);
          v275[-1] = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(*(float32x4_t *)(v244 + 4 * v247 * v246 + v273), v224), v42, *(float32x4_t *)(v244 + 4 * v247 * v246 + v272)), v43, *(float32x4_t *)(v274 + v272)), v271, v44);
          *float v275 = v277;
          v272 += 32;
          v275 += 2;
          v273 += 32;
          v276 -= 8;
        }
        while (v276);
        unint64_t v249 = v192 - (unint64_t)(v192 & 7);
        double v77 = v575;
        double v78 = v577;
        if ((v192 & 7) == 0) {
          goto LABEL_272;
        }
      }
      else
      {
        unint64_t v249 = 0;
      }
      uint64_t v278 = v247 * v246;
      uint64_t v279 = v244 + 4 * (v247 * v246 + v245);
      uint64_t v280 = v244 + 4 * (v278 + v248);
      uint64_t v281 = v244 + 4 * (v247 * v243 + v245);
      uint64_t v282 = v244 + 4 * (v247 * v243 + v248);
      do
      {
        v43.i32[0] = *(_DWORD *)(v281 + 4 * v249);
        *((float *)&v589.tv_sec + v249) = (float)((float)((float)(v224 * *(float *)(v280 + 4 * v249))
                                                        + (float)(*(float *)(v279 + 4 * v249) * *(float *)&v223))
                                                + (float)(v43.f32[0] * *(float *)v40.i32))
                                        + (float)(*(float *)(v282 + 4 * v249) * v41.f32[0]);
        ++v249;
      }
      while (v192 != v249);
LABEL_272:
      uint64_t v321 = v78[1];
      uint64_t v322 = (v212 * v209) >> 32;
      float v323 = (int8x16_t *)(v321 + v322);
      float v324 = 0.0;
      double v325 = &v589;
      uint64_t v326 = v192;
      do
      {
        float v327 = *(float *)&v325->tv_sec;
        double v325 = (timeval *)((char *)v325 + 4);
        float v324 = v324 + (float)(v327 * v327);
        --v326;
      }
      while (v326);
      float v328 = 0.0;
      if (v324 > 1.0e-12) {
        float v328 = 1.0 / sqrtf(v324);
      }
      if (v188 == INFINITY || v189 == INFINITY)
      {
        if (v192 >= 8uLL)
        {
          float v331 = (int16x8_t *)(v321 + v322 + 16);
          unint64_t v332 = v192 - (unint64_t)(v192 & 7);
          v333 = (float32x4_t *)&v590;
          do
          {
            int16x8_t v40 = (int16x8_t)vmulq_n_f32(*v333, v328);
            v331[-1] = (int16x8_t)vmulq_n_f32(v333[-1], v328);
            *float v331 = v40;
            v333 += 2;
            v331 += 2;
            v332 -= 8;
          }
          while (v332);
          unint64_t v329 = v192 - (unint64_t)(v192 & 7);
          if ((v192 & 7) == 0) {
            goto LABEL_228;
          }
        }
        else
        {
          unint64_t v329 = 0;
        }
        unint64_t v334 = v192 - v329;
        uint64_t v335 = 4 * v329;
        v336 = (float *)(v321 + v322 + 4 * v329);
        v337 = (float *)((char *)&v589 + v335);
        do
        {
          float v338 = *v337++;
          *v336++ = v328 * v338;
          --v334;
        }
        while (v334);
LABEL_228:
        uint64_t v200 = v587;
        if (v201 <= ++v209) {
          return;
        }
      }
      else
      {
        if (v192 < 8uLL)
        {
          unint64_t v330 = 0;
LABEL_296:
          unint64_t v351 = v192 - v330;
          uint64_t v352 = (unsigned char *)(v321 + v330 + v322);
          uint64_t v353 = (float *)&v589 + v330;
          do
          {
            float v354 = *v353++;
            int v355 = (int)(float)(v211 * (float)((float)(v328 * v354) - v230));
            if (v355 >= 255) {
              int v355 = 255;
            }
            *v352++ = v355 & ~(v355 >> 31);
            --v351;
          }
          while (v351);
          goto LABEL_300;
        }
        if (v192 >= 0x10uLL)
        {
          float v340 = (float32x4_t *)&v589;
          unint64_t v341 = v192 - (unint64_t)(v192 & 0xF);
          do
          {
            float32x4_t v42 = vmulq_n_f32(vsubq_f32(vmulq_n_f32(v340[3], v328), v214), v211);
            float32x4_t v41 = vmulq_n_f32(vsubq_f32(vmulq_n_f32(v340[2], v328), v214), v211);
            unsigned long long v342 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vminq_u32(vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(vmulq_n_f32(*v340, v328), v214), v211)), v215), (int16x8_t)vminq_u32(vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(vmulq_n_f32(v340[1], v328), v214), v211)), v215)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL);
            uint32x4_t v343 = vmovl_high_u16((uint16x8_t)v342);
            float32x4_t v43 = (float32x4_t)vmovl_u16(*(uint16x4_t *)&v342);
            int16x8_t v40 = (int16x8_t)vminq_u32(vcvtq_u32_f32(v42), v215);
            unsigned long long v344 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vminq_u32(vcvtq_u32_f32(v41), v215), v40) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL);
            float32x4_t v45 = (float32x4_t)vmovl_high_u16((uint16x8_t)v344);
            float32x4_t v44 = (float32x4_t)vmovl_u16(*(uint16x4_t *)&v344);
            *v323++ = vqtbl4q_s8(*(int8x16x4_t *)v43.f32, (int8x16_t)xmmword_21BB7AA90);
            v340 += 4;
            v341 -= 16;
          }
          while (v341);
          if ((v192 & 0xF) == 0) {
            goto LABEL_300;
          }
          unint64_t v339 = v192 - (unint64_t)(v192 & 0xF);
          unint64_t v330 = v339;
          if (v213 < 8) {
            goto LABEL_296;
          }
        }
        else
        {
          unint64_t v339 = 0;
        }
        long long v345 = (float32x4_t *)((char *)&v589 + 4 * v339);
        long long v346 = (void *)(v321 + v339 + v322);
        unint64_t v347 = (v192 & 7) - v192 + v339;
        do
        {
          float32x4_t v349 = *v345;
          float32x4_t v348 = v345[1];
          v345 += 2;
          unsigned long long v350 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vminq_u32(vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(vmulq_n_f32(v349, v328), v214), v211)), v215), (int16x8_t)vminq_u32(vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(vmulq_n_f32(v348, v328), v214), v211)), v215)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL);
          float32x4_t v41 = (float32x4_t)vmovl_high_u16((uint16x8_t)v350);
          int16x8_t v40 = (int16x8_t)vmovl_u16(*(uint16x4_t *)&v350);
          *v346++ = vqtbl2q_s8(*(int8x16x2_t *)v40.i8, (int8x16_t)xmmword_21BB7AAA0).u64[0];
          v347 += 8;
        }
        while (v347);
        unint64_t v330 = v192 - (unint64_t)(v192 & 7);
        if ((v192 & 7) != 0) {
          goto LABEL_296;
        }
LABEL_300:
        uint64_t v200 = v587;
        uint64_t v201 = *(void *)v587;
        if (*(void *)v587 <= ++v209) {
          return;
        }
      }
    }
    int v225 = *((_DWORD *)v77 + 2);
    int v226 = *((_DWORD *)v77 + 3);
    int v227 = v225 - 1;
    if (v225 - 1 >= v220) {
      int v227 = v220;
    }
    if (v226 - 1 >= v221) {
      int v228 = v221;
    }
    else {
      int v228 = v226 - 1;
    }
    uint64_t v229 = *v77;
    float v230 = *(float *)v580.i32;
    if (!a12)
    {
      if ((int)v192 < 1) {
        goto LABEL_228;
      }
      uint64_t v250 = v218;
      uint64_t v251 = v227;
      uint64_t v252 = v227 + v225 * (uint64_t)v228;
      uint64_t v253 = v226 * (uint64_t)v225;
      uint64_t v254 = v218 + v225 * (uint64_t)v228;
      uint64_t v255 = v251 + v225 * (uint64_t)v219;
      float v256 = &v589;
      uint64_t v257 = v192;
      uint64_t v258 = v250 + v225 * (uint64_t)v219;
      double v78 = v577;
      do
      {
        v42.i8[0] = *(unsigned char *)(v229 + v258);
        v42.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v42.f32)).u64[0];
        v43.i8[0] = *(unsigned char *)(v229 + v255);
        int8x8_t v259 = (int8x8_t)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v43.f32)).u64[0];
        *(float *)v259.i32 = v224 * (float)v259.i32[0];
        v42.f32[0] = *(float *)v259.i32 + (float)((float)v42.i32[0] * *(float *)&v223);
        v259.i8[0] = *(unsigned char *)(v229 + v254);
        int8x8_t v260 = (int8x8_t)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v259)).u64[0];
        *(float *)v260.i32 = (float)v260.i32[0];
        v42.f32[0] = v42.f32[0] + (float)(*(float *)v260.i32 * *(float *)v40.i32);
        v260.i8[0] = *(unsigned char *)(v229 + v252);
        v43.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v260)).u64[0];
        v43.f32[0] = (float)v43.i32[0];
        v42.f32[0] = v42.f32[0] + (float)(v43.f32[0] * v41.f32[0]);
        LODWORD(v256->tv_sec) = v42.i32[0];
        float v256 = (timeval *)((char *)v256 + 4);
        v229 += v253;
        --v257;
      }
      while (v257);
      goto LABEL_272;
    }
    if ((int)v192 < 1) {
      goto LABEL_228;
    }
    uint64_t v231 = v219;
    uint64_t v232 = v77[2];
    uint64_t v233 = v232 * v231;
    uint64_t v234 = v229 + v233 + v218 * (uint64_t)(int)v192;
    uint64_t v235 = v229 + v233 + v227 * (uint64_t)(int)v192;
    uint64_t v236 = v232 * v228;
    uint64_t v237 = v229 + v236 + v218 * (uint64_t)(int)v192;
    uint64_t v238 = v229 + v236 + v227 * (uint64_t)(int)v192;
    if (v192 < 4uLL)
    {
      unint64_t v239 = 0;
      do
      {
LABEL_271:
        v42.i8[0] = *(unsigned char *)(v234 + v239);
        v42.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v42.f32)).u64[0];
        v43.i8[0] = *(unsigned char *)(v235 + v239);
        int8x8_t v319 = (int8x8_t)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v43.f32)).u64[0];
        *(float *)v319.i32 = v224 * (float)v319.i32[0];
        v42.f32[0] = *(float *)v319.i32 + (float)((float)v42.i32[0] * *(float *)&v223);
        v319.i8[0] = *(unsigned char *)(v237 + v239);
        int8x8_t v320 = (int8x8_t)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v319)).u64[0];
        *(float *)v320.i32 = (float)v320.i32[0];
        v42.f32[0] = v42.f32[0] + (float)(*(float *)v320.i32 * *(float *)v40.i32);
        v320.i8[0] = *(unsigned char *)(v238 + v239);
        v43.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v320)).u64[0];
        v43.f32[0] = (float)v43.i32[0];
        v42.f32[0] = v42.f32[0] + (float)(v43.f32[0] * v41.f32[0]);
        *((_DWORD *)&v589.tv_sec + v239++) = v42.i32[0];
      }
      while (v192 != v239);
      goto LABEL_272;
    }
    if (v192 >= 0x10uLL)
    {
      uint64_t v283 = v218 * (uint64_t)(int)v192;
      float32x4_t v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v223, 0);
      float32x4_t v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 0);
      uint64_t v284 = v229 + v233;
      float32x4_t v285 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0);
      uint64_t v286 = v229 + v236;
      float32x4_t v287 = &v589;
      uint64_t v288 = v227 * (uint64_t)(int)v192;
      unint64_t v289 = v192 - (unint64_t)(v192 & 0xF);
      do
      {
        int8x16_t v290 = *(int8x16_t *)(v284 + v283);
        float32x4_t v291 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v290.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)));
        int32x4_t v292 = vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v290.i8, *(int8x8_t *)&v210), 8uLL), 8uLL));
        v290.i64[0] = vextq_s8(v290, v290, 8uLL).u64[0];
        float32x4_t v293 = vcvtq_f32_s32(v292);
        int8x16_t v294 = *(int8x16_t *)(v284 + v288);
        int8x8_t v295 = (int8x8_t)vextq_s8(v294, v294, 8uLL).u64[0];
        float32x4_t v296 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v290.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)));
        float32x4_t v297 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v290.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)));
        float32x4_t v298 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v295, *(int8x8_t *)&v210), 8uLL), 8uLL)));
        float32x4_t v299 = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v294.i8, *(int8x8_t *)&v210), 8uLL), 8uLL))), v224);
        float32x4_t v300 = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v294.i8, *(int8x8_t *)&v210), 8uLL), 8uLL))), v224);
        float32x4_t v301 = vmulq_n_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v295, *(int8x8_t *)&v210), 8uLL), 8uLL))), v224);
        float32x4_t v302 = vmlaq_f32(v300, v42, v293);
        int8x16_t v303 = *(int8x16_t *)(v286 + v283);
        int8x8_t v304 = (int8x8_t)vextq_s8(v303, v303, 8uLL).u64[0];
        float32x4_t v305 = vmlaq_f32(v299, v42, v291);
        float32x4_t v306 = vmlaq_f32(vmulq_n_f32(v298, v224), v42, v297);
        int8x16_t v307 = *(int8x16_t *)(v286 + v288);
        v291.i64[0] = vextq_s8(v307, v307, 8uLL).u64[0];
        float32x4_t v45 = vmlaq_f32(vmlaq_f32(v302, v43, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v303.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)))), v285, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v307.i8, *(int8x8_t *)&v210), 8uLL), 8uLL))));
        float32x4_t v44 = vmlaq_f32(vmlaq_f32(v305, v43, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v303.i8, *(int8x8_t *)&v210), 8uLL), 8uLL)))), v285, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v307.i8, *(int8x8_t *)&v210), 8uLL), 8uLL))));
        *float32x4_t v287 = (timeval)v45;
        v287[1] = (timeval)v44;
        v287[2] = (timeval)vmlaq_f32(vmlaq_f32(v306, v43, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v304, *(int8x8_t *)&v210), 8uLL), 8uLL)))), v285, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v291.f32, *(int8x8_t *)&v210), 8uLL), 8uLL))));
        v287[3] = (timeval)vmlaq_f32(vmlaq_f32(vmlaq_f32(v301, v42, v296), v43, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v304, *(int8x8_t *)&v210), 8uLL), 8uLL)))), v285, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v291.f32, *(int8x8_t *)&v210), 8uLL), 8uLL))));
        v284 += 16;
        v286 += 16;
        v287 += 4;
        v289 -= 16;
      }
      while (v289);
      double v77 = v575;
      double v78 = v577;
      if ((v192 & 0xF) == 0) {
        goto LABEL_272;
      }
      unint64_t v270 = v192 - (unint64_t)(v192 & 0xF);
      unint64_t v239 = v270;
      if (v213 < 4) {
        goto LABEL_271;
      }
    }
    else
    {
      unint64_t v270 = 0;
    }
    float32x4_t v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v223, 0);
    float32x4_t v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 0);
    float v308 = (float32x4_t *)((char *)&v589 + 4 * v270);
    unint64_t v309 = v192 - (unint64_t)(v192 & 3);
    float32x4_t v310 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0);
    uint64_t v311 = v238;
    uint64_t v312 = v237;
    uint64_t v313 = v235;
    uint64_t v314 = v234;
    do
    {
      v44.i32[0] = *(_DWORD *)(v314 + v270);
      float32x4_t v315 = vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v44.f32)));
      v45.i32[0] = *(_DWORD *)(v313 + v270);
      float32x4_t v316 = vmlaq_f32(vmulq_n_f32(vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v45.f32))), v224), v42, v315);
      v315.i32[0] = *(_DWORD *)(v312 + v270);
      float32x4_t v317 = vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v315.f32)));
      float32x4_t v318 = vmlaq_f32(v316, v43, v317);
      v317.i32[0] = *(_DWORD *)(v311 + v270);
      float32x4_t v44 = vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v317.f32)));
      float32x4_t v45 = vmlaq_f32(v318, v310, v44);
      *v308++ = v45;
      v314 += 4;
      v313 += 4;
      v312 += 4;
      v311 += 4;
      v309 -= 4;
    }
    while (v270 != v309);
    unint64_t v239 = v192 - (unint64_t)(v192 & 3);
    double v77 = v575;
    double v78 = v577;
    if ((v192 & 3) == 0) {
      goto LABEL_272;
    }
    goto LABEL_271;
  }
}

void *pick_xy(void *result, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, float a11, float a12, float a13, float a14, float a15, float a16, float a17, float a18, int a19)
{
  if (result == 4)
  {
    if (a9 <= a10 || a9 <= a11 || a9 <= a12 || a9 <= a13) {
      return result;
    }
  }
  else if (result == 8)
  {
    BOOL v21 = a9 < a13 || a9 <= a10;
    BOOL v22 = v21 || a9 < a11;
    BOOL v23 = v22 || a9 <= a12;
    BOOL v24 = v23 || a9 <= a14;
    BOOL v25 = v24 || a9 <= a15;
    BOOL v26 = v25 || a9 <= a16;
    if (v26 || a9 <= a17) {
      return result;
    }
  }
  float v31 = a9;
  if (a6)
  {
    uint64_t v32 = *(void *)(a6 + 16) * (int)(((double)a3 + 0.5) * (double)*(int *)(a6 + 12) / (double)a5 + -0.5)
        + (int)(((double)a2 + 0.5) * (double)*(int *)(a6 + 8) / (double)a4 + -0.5);
    float v31 = (float)(*(float *)(*(void *)a6 + 4 * v32) * a9) <= 1.0 ? *(float *)(*(void *)a6 + 4 * v32) * a9 : 1.0;
    if (v31 < a18) {
      return result;
    }
  }
  if (a19)
  {
    float v33 = 1.0 / (float)((float)((float)((float)(a9 + a10) + a11) + a12) + a13);
    float v34 = (float)(a11 - a10) * v33;
    float v35 = -1.0;
    float v36 = -1.0;
    if (v34 >= -1.0)
    {
      float v36 = 1.0;
      if (v34 <= 1.0) {
        float v36 = v34;
      }
    }
    float v37 = (float)(a13 - a12) * v33;
    if (v37 >= -1.0)
    {
      float v35 = 1.0;
      if (v37 <= 1.0) {
        float v35 = v37;
      }
    }
    float v38 = v36 + (float)a2;
    float v39 = v35 + (float)a3;
    uint64_t v40 = *(void *)a7;
    uint64_t v41 = *(void *)(a7 + 16);
    if (*(void *)a7 < v41) {
      goto LABEL_60;
    }
    goto LABEL_52;
  }
  float v38 = (float)a2;
  float v39 = (float)a3;
  uint64_t v40 = *(void *)a7;
  uint64_t v41 = *(void *)(a7 + 16);
  if (*(void *)a7 >= v41)
  {
LABEL_52:
    uint64_t v42 = 2 * v41;
    BOOL v43 = v41 == 0;
    uint64_t v44 = 32;
    if (!v43) {
      uint64_t v44 = v42;
    }
    if (v44 <= v40) {
      uint64_t v45 = v40 + 1;
    }
    else {
      uint64_t v45 = v44;
    }
    if (v45)
    {
      unint64_t result = malloc_type_realloc(*(void **)(a7 + 8), 8 * v45, 0xE13CAFE2uLL);
      *(void *)(a7 + 8) = result;
      uint64_t v40 = *(void *)a7;
    }
    *(void *)(a7 + 16) = v45;
  }
LABEL_60:
  *(void *)a7 = v40 + 1;
  unsigned int v46 = (float *)(*(void *)(a7 + 8) + 8 * v40);
  *unsigned int v46 = v38;
  v46[1] = v39;
  uint64_t v47 = *(void *)a8;
  uint64_t v48 = *(void *)(a8 + 16);
  if (*(void *)a8 >= v48)
  {
    uint64_t v49 = 2 * v48;
    BOOL v43 = v48 == 0;
    uint64_t v50 = 64;
    if (!v43) {
      uint64_t v50 = v49;
    }
    if (v50 <= v47) {
      uint64_t v51 = v47 + 1;
    }
    else {
      uint64_t v51 = v50;
    }
    if (v51)
    {
      unint64_t result = malloc_type_realloc(*(void **)(a8 + 8), 4 * v51, 0x13292637uLL);
      *(void *)(a8 + 8) = result;
      uint64_t v47 = *(void *)a8;
    }
    *(void *)(a8 + 16) = v51;
  }
  *(void *)a8 = v47 + 1;
  *(float *)(*(void *)(a8 + 8) + 4 * v47) = v31;
  return result;
}

double g_rot_xyz(double *a1, double a2, double a3, double a4)
{
  __double2 v7 = __sincos_stret(a4);
  __double2 v8 = __sincos_stret(a3);
  __double2 v9 = __sincos_stret(a2);
  double v10 = -(v7.__sinval * v8.__cosval);
  double v11 = v9.__sinval * (v8.__sinval * v7.__cosval) + v7.__sinval * v9.__cosval;
  double v12 = v7.__cosval * v9.__cosval - v8.__sinval * v7.__sinval * v9.__sinval;
  double v13 = -(v8.__cosval * v9.__sinval);
  double v14 = v7.__sinval * v9.__sinval - v8.__sinval * v7.__cosval * v9.__cosval;
  double v15 = v9.__cosval * (v8.__sinval * v7.__sinval) + v7.__cosval * v9.__sinval;
  double v16 = *a1;
  double v17 = a1[1];
  double v18 = a1[2];
  double v19 = v12 * v17 + *a1 * v10 + v18 * v15;
  *a1 = v11 * v17 + *a1 * (v8.__cosval * v7.__cosval) + v18 * v14;
  a1[1] = v19;
  a1[2] = v13 * v17 + v16 * v8.__sinval + v18 * (v9.__cosval * v8.__cosval);
  double v20 = a1[4];
  double v21 = a1[5];
  double v22 = a1[6];
  a1[4] = v11 * v21 + v20 * (v8.__cosval * v7.__cosval) + v22 * v14;
  a1[5] = v12 * v21 + v20 * v10 + v22 * v15;
  a1[6] = v13 * v21 + v20 * v8.__sinval + v22 * (v9.__cosval * v8.__cosval);
  double v23 = a1[8];
  double v24 = a1[9];
  double v25 = a1[10];
  a1[8] = v11 * v24 + v23 * (v8.__cosval * v7.__cosval) + v25 * v14;
  a1[9] = v12 * v24 + v23 * v10 + v25 * v15;
  a1[10] = v13 * v24 + v23 * v8.__sinval + v25 * (v9.__cosval * v8.__cosval);
  double v26 = a1[12];
  double v27 = a1[13];
  double v28 = v11 * v27 + v26 * (v8.__cosval * v7.__cosval);
  double v29 = a1[14];
  a1[12] = v28 + v29 * v14;
  a1[13] = v12 * v27 + v26 * v10 + v29 * v15;
  double result = v13 * v27 + v26 * v8.__sinval + v29 * (v9.__cosval * v8.__cosval);
  a1[14] = result;
  return result;
}

double g_mul_4x4(double *a1, double *a2, double *a3)
{
  double v3 = a2[1];
  double v4 = a2[2];
  double v5 = a2[3];
  double v6 = a3[4];
  double v7 = a3[5];
  double v8 = a3[1];
  double v10 = a3[8];
  double v9 = a3[9];
  double v12 = a3[12];
  double v11 = a3[13];
  double v13 = v3 * v6 + *a2 * *a3 + v4 * v10 + v5 * v12;
  double v14 = v3 * v7 + *a2 * v8 + v4 * v9 + v5 * v11;
  double v15 = a3[6];
  double v16 = a3[7];
  double v17 = a3[2];
  double v18 = a3[3];
  double v19 = a3[10];
  double v20 = a3[11];
  double v22 = a3[14];
  double v21 = a3[15];
  double v23 = v3 * v15 + *a2 * v17 + v4 * v19 + v5 * v22;
  double v24 = v3 * v16 + *a2 * v18 + v4 * v20 + v5 * v21;
  double v25 = a2[4];
  double v26 = a2[5];
  double v27 = a2[6];
  double v28 = a2[7];
  double v29 = v6 * v26 + v25 * *a3 + v27 * v10 + v28 * v12;
  double v30 = v7 * v26 + v25 * v8 + v27 * v9 + v28 * v11;
  double v31 = v15 * v26 + v25 * v17 + v27 * v19 + v28 * v22;
  double v32 = v16 * v26 + v25 * v18 + v27 * v20 + v28 * v21;
  double v33 = a2[8];
  double v34 = a2[9];
  double v36 = a2[10];
  double v35 = a2[11];
  double v37 = v6 * v34 + v33 * *a3 + v36 * v10 + v35 * v12;
  double v38 = v7 * v34 + v33 * v8 + v36 * v9 + v35 * v11;
  double v39 = v15 * v34 + v33 * v17 + v36 * v19 + v35 * v22;
  double v40 = v16 * v34 + v33 * v18 + v36 * v20 + v35 * v21;
  double v41 = a2[12];
  double v42 = a2[13];
  double v43 = a2[14];
  double v44 = a2[15];
  double v45 = v6 * v42 + v41 * *a3 + v43 * v10 + v44 * v12;
  *a1 = v13;
  a1[1] = v14;
  a1[2] = v23;
  a1[3] = v24;
  a1[4] = v29;
  a1[5] = v30;
  a1[6] = v31;
  a1[7] = v32;
  a1[8] = v37;
  a1[9] = v38;
  a1[10] = v39;
  a1[11] = v40;
  a1[12] = v45;
  a1[13] = v7 * v42 + v41 * v8 + v43 * v9 + v44 * v11;
  double result = v16 * v42 + v41 * v18 + v43 * v20 + v44 * v21;
  a1[14] = v15 * v42 + v41 * v17 + v43 * v19 + v44 * v22;
  a1[15] = result;
  return result;
}

double g_log_so3(double *a1, double *a2)
{
  double v4 = a2[4];
  double v5 = a2[8];
  double v6 = *a2 + v4 + v5;
  if (v6 == -1.0)
  {
    double v7 = sqrt((*a2 + -1.0) * 0.5 + 1.0);
    if (v7 == 0.0)
    {
      double v8 = sqrt((v4 + -1.0) * 0.5 + 1.0);
      if (v8 == 0.0)
      {
        double v9 = sqrt((v5 + -1.0) * 0.5 + 1.0);
        if (v9 == 0.0)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/base/g_matrix.c", 398, (uint64_t)"g_log_so3", "One of b, c, d should be nonzero");
          exit(1);
        }
        double v7 = a2[2] * 0.5 / v9;
        double v8 = a2[5] * 0.5 / v9;
      }
      else
      {
        double v7 = a2[1] * 0.5 / v8;
        double v9 = a2[7] * 0.5 / v8;
      }
    }
    else
    {
      double v8 = a2[1] * 0.5 / v7;
      double v9 = a2[2] * 0.5 / v7;
    }
    *a1 = v7 * 3.14159265;
    a1[1] = v8 * 3.14159265;
    a1[2] = v9 * 3.14159265;
    return 3.14159265;
  }
  else
  {
    double v10 = 0.5;
    double v11 = (v6 + -1.0) * 0.5;
    double v12 = 1.0;
    if (v11 <= 1.0) {
      double v12 = (v6 + -1.0) * 0.5;
    }
    if (v11 >= -1.0) {
      double v13 = v12;
    }
    else {
      double v13 = -1.0;
    }
    long double v14 = acos(v13);
    double v15 = v14;
    if (v14 != 0.0) {
      double v10 = v14 * 0.5 / sin(v14);
    }
    *a1 = -(v10 * (a2[5] - a2[7]));
    a1[1] = v10 * (a2[2] - a2[6]);
    a1[2] = -(v10 * (a2[1] - a2[3]));
    return v15;
  }
}

void g_exp_so3(double *a1, double *a2)
{
  double v2 = *a2 * *a2 + 0.0 + a2[1] * a2[1] + a2[2] * a2[2];
  *a1 = 1.0;
  a1[1] = 0.0;
  a1[2] = 0.0;
  a1[3] = 0.0;
  a1[4] = 1.0;
  a1[5] = 0.0;
  a1[6] = 0.0;
  a1[7] = 0.0;
  a1[8] = 1.0;
  double v3 = sqrt(v2);
  if (v3 != 0.0)
  {
    double v6 = a2[1];
    double v5 = a2[2];
    double v7 = *a2;
    long double v8 = sin(v3) / v3;
    long double v9 = v8 * 0.0;
    long double v10 = v8 * v6;
    long double v11 = v8 * v5;
    long double v12 = v8 * v7;
    double v13 = v9 + 1.0;
    double v14 = 0.0 - v11;
    double v15 = v10 + 0.0;
    double v16 = v11 + 0.0;
    double v17 = 0.0 - v12;
    double v18 = 0.0 - v10;
    double v19 = v12 + 0.0;
    double v20 = 0.0 - v5 * v5;
    double v21 = v20 - v6 * v6;
    double v22 = 0.0 - v5 * 0.0 - v5 * 0.0 + v6 * v7;
    double v23 = v6 * 0.0 + 0.0 + v5 * v7 + v6 * 0.0;
    double v24 = v5 * 0.0 + 0.0 + v5 * 0.0 + v7 * v6;
    double v25 = v20 + 0.0 - v7 * v7;
    double v26 = v5 * v6 + 0.0;
    double v27 = v26 - v7 * 0.0 - v7 * 0.0;
    double v28 = 0.0 - v6 * 0.0 + v7 * v5 - v6 * 0.0;
    double v29 = v26 + v7 * 0.0 + v7 * 0.0;
    double v30 = 0.0 - v6 * v6 - v7 * v7 + 0.0;
    if (fabs(v3) >= 0.001)
    {
      double v40 = v19;
      double v41 = v25;
      double v32 = v18;
      double v42 = v15;
      double v43 = v17;
      double v33 = v16;
      double v34 = v14;
      double v44 = v22;
      double v45 = v21;
      double v35 = v27;
      double v38 = v29;
      double v39 = v28;
      double v37 = v30;
      long double v36 = cos(v3);
      double v30 = v37;
      double v29 = v38;
      double v28 = v39;
      double v19 = v40;
      double v27 = v35;
      double v25 = v41;
      double v15 = v42;
      double v22 = v44;
      double v21 = v45;
      double v14 = v34;
      double v16 = v33;
      double v17 = v43;
      double v18 = v32;
      double v31 = (1.0 - v36) / v3 / v3;
    }
    else
    {
      double v31 = v3 * v3 / -24.0 + 0.5;
    }
    *a1 = v13 + v21 * v31;
    a1[1] = v14 + v22 * v31;
    a1[2] = v15 + v23 * v31;
    a1[3] = v16 + v24 * v31;
    a1[4] = v13 + v25 * v31;
    a1[5] = v17 + v27 * v31;
    a1[6] = v18 + v28 * v31;
    a1[7] = v19 + v29 * v31;
    a1[8] = v13 + v30 * v31;
  }
}

double g_inv_3x3(double *a1, double *a2)
{
  double v3 = a2[7];
  double v2 = a2[8];
  double v4 = a2[4];
  double v5 = a2[5];
  double v6 = v2 * v4 - v3 * v5;
  double v7 = a2[2];
  double v8 = a2[1];
  double v9 = v2 * v8 - v3 * v7;
  double v10 = v5 * v8 - v4 * v7;
  double result = *a2 * v6 - v9 * a2[3] + a2[6] * v10;
  *a1 = v6 * (1.0 / result);
  a1[1] = -(v9 * (1.0 / result));
  a1[2] = v10 * (1.0 / result);
  a1[3] = -((a2[8] * a2[3] - a2[6] * a2[5]) * (1.0 / result));
  a1[4] = 1.0 / result * (a2[8] * *a2 - a2[6] * a2[2]);
  a1[5] = -((a2[5] * *a2 - a2[3] * a2[2]) * (1.0 / result));
  a1[6] = 1.0 / result * (a2[7] * a2[3] - a2[6] * a2[4]);
  a1[7] = -((a2[7] * *a2 - a2[6] * a2[1]) * (1.0 / result));
  a1[8] = 1.0 / result * (a2[4] * *a2 - a2[3] * a2[1]);
  return result;
}

uint64_t vl_pose_count_inliers(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v19 = *a2;
  uint64_t v20 = a2[1];
  unint64_t v21 = *a2;
  float v22 = a6 * a6;
  double v23 = *(float **)(a3 + 8);
  float v24 = *(float *)(a1 + 40);
  float v25 = *(float *)(a1 + 44);
  v11.i32[0] = *(_DWORD *)(a1 + 8);
  float v26 = *(float *)(a1 + 12);
  v12.i32[0] = *(_DWORD *)a1;
  v13.i32[0] = *(_DWORD *)(a1 + 4);
  v14.i32[0] = *(_DWORD *)(a1 + 32);
  float v27 = *(float *)(a1 + 36);
  v15.i32[0] = *(_DWORD *)(a1 + 24);
  v16.i32[0] = *(_DWORD *)(a1 + 28);
  *(float *)v17.i32 = (float)((float)(v26 * v24) + (float)(*(float *)a1 * v27)) + (float)(*(float *)v15.i32 * v25);
  float v28 = *(float *)(a1 + 16);
  float v29 = *(float *)(a1 + 20);
  *(float *)&a11 = (float)((float)(v24 * v28) + (float)(*(float *)v13.i32 * v27)) + (float)(*(float *)v16.i32 * v25);
  *(float *)v18.i32 = (float)((float)(v24 * v29) + (float)(*(float *)v11.i32 * v27)) + (float)(*(float *)v14.i32 * v25);
  float v110 = v28;
  float v108 = *(float *)&a11;
  float v109 = v29;
  float v107 = *(float *)v18.i32;
  if (a5)
  {
    *(void *)a5 = 0;
    *(void *)(a5 + 24) = 0;
    *(void *)(a5 + 48) = 0;
    if ((int)v19 >= 1)
    {
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 8 * v21;
      float v105 = v26;
      float v106 = v22;
      __int32 v103 = v12.i32[0];
      __int32 v104 = v11.i32[0];
      __int32 v101 = v14.i32[0];
      __int32 v102 = v13.i32[0];
      __int32 v99 = v16.i32[0];
      __int32 v100 = v15.i32[0];
      __int32 v98 = v17.i32[0];
      do
      {
        float v35 = *v23;
        float v36 = v23[1];
        float v37 = v23[2];
        float v38 = (float)((float)((float)(v26 * v36) + (float)(*(float *)v12.i32 * *v23)) + (float)(*(float *)v15.i32 * v37))
            - *(float *)v17.i32;
        if (v38 > 0.0)
        {
          float v39 = (float)((float)((float)(v28 * v36) + (float)(*(float *)v13.i32 * v35)) + (float)(*(float *)v16.i32 * v37))
              - *(float *)&a11;
          float v40 = (float)((float)((float)(v29 * v36) + (float)(*(float *)v11.i32 * v35)) + (float)(*(float *)v14.i32 * v37))
              - *(float *)v18.i32;
          if ((float)((float)((float)(v40 - (float)(*(float *)(v20 + v32 + 4) * v38))
                             * (float)(v40 - (float)(*(float *)(v20 + v32 + 4) * v38)))
                     + (float)((float)(v39 - (float)(*(float *)(v20 + v32) * v38))
                             * (float)(v39 - (float)(*(float *)(v20 + v32) * v38)))) < (float)(v22 * (float)(v38 * v38)))
          {
            uint64_t v41 = *(void *)a5;
            uint64_t v42 = *(void *)(a5 + 16);
            if (*(void *)a5 >= v42)
            {
              if (v42) {
                uint64_t v43 = 2 * v42;
              }
              else {
                uint64_t v43 = 32;
              }
              if (v43 <= v41) {
                uint64_t v44 = v41 + 1;
              }
              else {
                uint64_t v44 = v43;
              }
              if (v44)
              {
                double v45 = malloc_type_realloc(*(void **)(a5 + 8), 8 * v44, 0x531BEAACuLL);
                *(float *)v18.i32 = v107;
                *(float *)&a11 = v108;
                float v29 = v109;
                float v28 = v110;
                v17.i32[0] = v98;
                v16.i32[0] = v99;
                v15.i32[0] = v100;
                v14.i32[0] = v101;
                v13.i32[0] = v102;
                v12.i32[0] = v103;
                v11.i32[0] = v104;
                float v26 = v105;
                float v22 = v106;
                *(void *)(a5 + 8) = v45;
                uint64_t v41 = *(void *)a5;
              }
              *(void *)(a5 + 16) = v44;
            }
            *(void *)a5 = v41 + 1;
            *(void *)(*(void *)(a5 + 8) + 8 * v41) = *(void *)(v20 + v32);
            uint64_t v46 = *(void *)(a5 + 24);
            uint64_t v47 = *(void *)(a5 + 40);
            if (v46 >= v47)
            {
              uint64_t v48 = 2 * v47;
              BOOL v49 = v47 == 0;
              uint64_t v50 = 21;
              if (!v49) {
                uint64_t v50 = v48;
              }
              if (v50 <= v46) {
                uint64_t v51 = v46 + 1;
              }
              else {
                uint64_t v51 = v50;
              }
              if (v51)
              {
                uint64_t v52 = malloc_type_realloc(*(void **)(a5 + 32), 12 * v51, 0xB5DEB5F3uLL);
                *(float *)v18.i32 = v107;
                *(float *)&a11 = v108;
                float v29 = v109;
                float v28 = v110;
                v17.i32[0] = v98;
                v16.i32[0] = v99;
                v15.i32[0] = v100;
                v14.i32[0] = v101;
                v13.i32[0] = v102;
                v12.i32[0] = v103;
                v11.i32[0] = v104;
                float v26 = v105;
                float v22 = v106;
                *(void *)(a5 + 32) = v52;
                uint64_t v46 = *(void *)(a5 + 24);
              }
              *(void *)(a5 + 40) = v51;
            }
            uint64_t v33 = (v33 + 1);
            *(void *)(a5 + 24) = v46 + 1;
            uint64_t v53 = *(void *)(a5 + 32) + 12 * v46;
            uint64_t v54 = *(void *)v23;
            *(float *)(v53 + 8) = v23[2];
            *(void *)uint64_t v53 = v54;
            if (a4)
            {
              uint64_t v55 = *(void *)(a5 + 48);
              uint64_t v56 = *(void *)(a5 + 64);
              if (v55 >= v56)
              {
                if (v56) {
                  uint64_t v57 = 2 * v56;
                }
                else {
                  uint64_t v57 = 32;
                }
                if (v57 <= v55) {
                  uint64_t v58 = v55 + 1;
                }
                else {
                  uint64_t v58 = v57;
                }
                if (v58)
                {
                  uint64_t v59 = malloc_type_realloc(*(void **)(a5 + 56), 8 * v58, 0x6F8980F0uLL);
                  *(float *)v18.i32 = v107;
                  *(float *)&a11 = v108;
                  float v29 = v109;
                  float v28 = v110;
                  v17.i32[0] = v98;
                  v16.i32[0] = v99;
                  v15.i32[0] = v100;
                  v14.i32[0] = v101;
                  v13.i32[0] = v102;
                  v12.i32[0] = v103;
                  v11.i32[0] = v104;
                  float v26 = v105;
                  float v22 = v106;
                  *(void *)(a5 + 56) = v59;
                  uint64_t v55 = *(void *)(a5 + 48);
                }
                *(void *)(a5 + 64) = v58;
              }
              *(void *)(a5 + 48) = v55 + 1;
              *(void *)(*(void *)(a5 + 56) + 8 * v55) = *(void *)(*(void *)(a4 + 8) + v32);
            }
          }
        }
        v23 += 3;
        v32 += 8;
      }
      while (v34 != v32);
      return v33;
    }
    return 0;
  }
  if ((int)v19 < 1) {
    return 0;
  }
  if (v21 >= 8)
  {
    uint64_t v60 = *a2 & 0xFFFFFFF8;
    uint64_t v61 = (float *)(v20 + 8 * v60);
    uint64_t v62 = &v23[3 * v60];
    float32x4_t v63 = (float32x4_t)vdupq_lane_s32(v12, 0);
    float32x4_t v64 = (float32x4_t)vdupq_lane_s32(v15, 0);
    float32x4_t v65 = (float32x4_t)vdupq_lane_s32(v17, 0);
    float32x4_t v66 = (float32x4_t)vdupq_lane_s32(v13, 0);
    float32x4_t v67 = (float32x4_t)vdupq_lane_s32(v16, 0);
    float32x4_t v68 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a11, 0);
    uint64_t v69 = (const float *)(v20 + 32);
    float32x4_t v70 = (float32x4_t)vdupq_lane_s32(v11, 0);
    int32x4_t v71 = 0uLL;
    float32x4_t v72 = (float32x4_t)vdupq_lane_s32(v14, 0);
    uint64_t v73 = v60;
    float32x4_t v74 = (float32x4_t)vdupq_lane_s32(v18, 0);
    int32x4_t v75 = 0uLL;
    do
    {
      uint64_t v76 = v23;
      float32x4x3_t v111 = vld3q_f32(v76);
      v76 += 12;
      float32x4x3_t v112 = vld3q_f32(v76);
      double v77 = v69 - 8;
      float32x4_t v78 = vsubq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(v111.val[1], v26), v111.val[0], v63), v111.val[2], v64), v65);
      float32x4_t v79 = vsubq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(v111.val[1], v28), v111.val[0], v66), v111.val[2], v67), v68);
      float32x4_t v80 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v111.val[1], v29), v111.val[0], v70), v111.val[2], v72);
      float32x4_t v81 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v112.val[1], v110), v112.val[0], v66), v112.val[2], v67);
      float32x4_t v82 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v112.val[1], v109), v112.val[0], v70), v112.val[2], v72);
      *(float32x4x2_t *)v111.val[0].f32 = vld2q_f32(v77);
      v111.val[2] = vsubq_f32(vmlaq_f32(vmlaq_f32(vmulq_n_f32(v112.val[1], v26), v112.val[0], v63), v112.val[2], v64), v65);
      v112.val[0] = vsubq_f32(v80, v74);
      *(float32x4x2_t *)v112.val[1].f32 = vld2q_f32(v69);
      float32x4_t v83 = vsubq_f32(v81, v68);
      float v29 = *(float *)(a1 + 20);
      float32x4_t v84 = vmlsq_f32(v79, v78, v111.val[0]);
      v112.val[0] = vmlsq_f32(v112.val[0], v78, v111.val[1]);
      float32x4_t v85 = vmlsq_f32(vsubq_f32(v82, v74), v111.val[2], v112.val[2]);
      float32x4_t v86 = vmlsq_f32(v83, v111.val[2], v112.val[1]);
      v111.val[1] = vmulq_f32(v85, v85);
      float v28 = *(float *)(a1 + 16);
      int32x4_t v71 = vsubq_s32(v71, (int32x4_t)vandq_s8((int8x16_t)vcgtzq_f32(v78), (int8x16_t)vcgtq_f32(vmulq_n_f32(vmulq_f32(v78, v78), v22), vmlaq_f32(vmulq_f32(v112.val[0], v112.val[0]), v84, v84))));
      int32x4_t v75 = vsubq_s32(v75, (int32x4_t)vandq_s8((int8x16_t)vcgtzq_f32(v111.val[2]), (int8x16_t)vcgtq_f32(vmulq_n_f32(vmulq_f32(v111.val[2], v111.val[2]), v22), vmlaq_f32(v111.val[1], v86, v86))));
      v23 += 24;
      v69 += 16;
      v73 -= 8;
    }
    while (v73);
    uint64_t v33 = vaddvq_s32(vaddq_s32(v75, v71));
    *(float *)v18.i32 = v107;
    *(float *)&a11 = v108;
    if ((*a2 & 7) == 0) {
      return v33;
    }
  }
  else
  {
    LODWORD(v60) = 0;
    LODWORD(v33) = 0;
    uint64_t v61 = (float *)a2[1];
    uint64_t v62 = *(float **)(a3 + 8);
  }
  int v87 = v19 - v60;
  do
  {
    float v88 = v62[1];
    float v89 = v62[2];
    float v90 = (float)((float)((float)(v26 * v88) + (float)(*(float *)v12.i32 * *v62)) + (float)(*(float *)v15.i32 * v89))
        - *(float *)v17.i32;
    float v91 = (float)(v29 * v88) + (float)(*(float *)v11.i32 * *v62);
    float v92 = (float)((float)((float)(v28 * v88) + (float)(*(float *)v13.i32 * *v62)) + (float)(*(float *)v16.i32 * v89))
        - *(float *)&a11;
    float v93 = (float)(v91 + (float)(*(float *)v14.i32 * v89)) - *(float *)v18.i32;
    float v94 = *v61;
    float v95 = v61[1];
    v61 += 2;
    BOOL v96 = v90 > 0.0;
    if ((float)((float)((float)(v93 - (float)(v95 * v90)) * (float)(v93 - (float)(v95 * v90)))
               + (float)((float)(v92 - (float)(v94 * v90)) * (float)(v92 - (float)(v94 * v90)))) >= (float)(v22 * (float)(v90 * v90)))
      BOOL v96 = 0;
    uint64_t v33 = (v33 + v96);
    v62 += 3;
    --v87;
  }
  while (v87);
  return v33;
}

uint64_t vl_pose_get_inliers(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, float a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v12 = *a4;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  if ((int)v12 < 1)
  {
    int32x2_t v17 = 0;
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v37 = a1;
    uint64_t v38 = a5;
    int32x2_t v13 = 0;
    uint64_t v14 = 0;
    int32x2_t v15 = 0;
    uint64_t v16 = 0;
    int32x2_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = v12;
    uint64_t v39 = v12;
    do
    {
      int v22 = *(_DWORD *)(a4[1] + 8 * v19);
      uint64_t v23 = *(void *)(a3 + 8);
      uint64_t v24 = *(void *)(*(void *)(a2 + 8) + 288 * v19);
      uint64_t v25 = v19 + 1;
      if (v19 >= v18)
      {
        uint64_t v26 = 2 * v18;
        if (!v18) {
          uint64_t v26 = 32;
        }
        if (v26 <= v19) {
          uint64_t v18 = v19 + 1;
        }
        else {
          uint64_t v18 = v26;
        }
        if (v18)
        {
          float v27 = malloc_type_realloc(v17, 8 * v18, 0x94E0E51BuLL);
          uint64_t v20 = v39;
          int32x2_t v17 = v27;
        }
      }
      *((void *)v17 + v19) = v24;
      if (v19 >= v16)
      {
        uint64_t v28 = 2 * v16;
        if (!v16) {
          uint64_t v28 = 21;
        }
        if (v28 <= v19) {
          uint64_t v16 = v19 + 1;
        }
        else {
          uint64_t v16 = v28;
        }
        if (v16)
        {
          float v29 = (char *)malloc_type_realloc(v15, 12 * v16, 0xF219AA0DuLL);
          uint64_t v20 = v39;
          int32x2_t v15 = v29;
        }
      }
      double v30 = (uint64_t *)(v23 + 12 * v22);
      uint64_t v31 = *v30;
      uint64_t v32 = &v15[12 * v19];
      *((_DWORD *)v32 + 2) = *((_DWORD *)v30 + 2);
      *(void *)uint64_t v32 = v31;
      if (v19 >= v14)
      {
        uint64_t v33 = 2 * v14;
        if (!v14) {
          uint64_t v33 = 32;
        }
        if (v33 <= v19) {
          uint64_t v14 = v19 + 1;
        }
        else {
          uint64_t v14 = v33;
        }
        if (v14)
        {
          uint64_t v34 = (char *)malloc_type_realloc(v13, 8 * v14, 0x1DE93B76uLL);
          uint64_t v20 = v39;
          int32x2_t v13 = v34;
        }
      }
      unint64_t v21 = &v13[8 * v19];
      *(_DWORD *)unint64_t v21 = v22;
      *((_DWORD *)v21 + 1) = v19++;
    }
    while (v25 != v20);
    uint64_t v50 = v17;
    uint64_t v51 = v18;
    uint64_t v47 = v15;
    uint64_t v48 = v16;
    uint64_t v44 = v13;
    uint64_t v45 = v14;
    a1 = v37;
    a5 = v38;
  }
  uint64_t v49 = v20;
  uint64_t v46 = v20;
  uint64_t v43 = v20;
  uint64_t v35 = vl_pose_count_inliers(a1, &v49, (uint64_t)&v46, (uint64_t)&v43, a5, a6, a7, a8, a9, a10, a11);
  free(v17);
  free(v47);
  free(v44);
  return v35;
}

uint64_t vl_pose(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14)
{
  uint64_t v142 = 0;
  uint64_t v143 = 0;
  uint64_t v144 = 0;
  uint64_t v16 = (timespec *)(a1 + 3688);
  uint64_t v130 = a1 + 3688;
  if (*(_DWORD *)(a1 + 3900))
  {
    *(void *)(a1 + 3808) -= mach_absolute_time();
  }
  else
  {
    clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 3720));
    clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 3704));
    clock_gettime(_CLOCK_MONOTONIC, v16);
  }
  vl_dump_detail_add_hash(a10, (uint64_t)"vl_pose input", a3, a7, (void *)a5);
  vl_dump_detail_pose_input(a10, (uint64_t)a3, (uint64_t)a7);
  float64x2_t v17 = *(float64x2_t *)(a5 + 240);
  uint64_t v145 = *(void *)(a2 + 232);
  int v146 = *(_DWORD *)(a2 + 240);
  double v18 = *(double *)(a2 + 200) - *(double *)(a5 + 312);
  double v19 = *(double *)(a2 + 208) - *(double *)(a5 + 320);
  double v20 = *(double *)(a2 + 216) - *(double *)(a5 + 328);
  double v21 = v19 * *(double *)(a5 + 280) + *(double *)(a5 + 256) * v18 + *(double *)(a5 + 304) * v20;
  float32x2_t v147 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a5 + 264), v19), v17, v18), *(float64x2_t *)(a5 + 288), v20));
  float v22 = v21;
  uint64_t v133 = a1 + 360;
  uint64_t v135 = (double *)(a5 + 240);
  *(float *)&double v18 = (float)(*(float *)(a2 + 224) + 8.0) * 3.0;
  float v148 = v22;
  int v149 = LODWORD(v18);
  *(void *)a12 = 0;
  *(void *)(a12 + 24) = 0;
  *(void *)(a12 + 48) = 0;
  *(void *)(a1 + 3928) = 0;
  *(void *)(a1 + 3952) = 0;
  uint64_t v23 = 1;
  do
  {
    if ((*(_DWORD *)a9 & v23) != 0)
    {
      ptr[0] = 0;
      ptr[1] = 0;
      v140.i64[0] = 0;
      switch((int)v23)
      {
        case 0:
          printf("Verbose : ");
          printf("Skipping pose estimation (VL_POSE_METHOD_NONE)");
          putchar(10);
          goto LABEL_6;
        case 1:
        case 2:
        case 4:
        case 32:
          float64x2_t v151 = 0u;
          float64x2_t v152 = 0u;
          float64x2_t v150 = 0u;
          if (vl_pose_ransac(a1, v23, a2, (uint64_t)a3, a5, (uint64_t)a7, (uint64_t)&v145, a9 + 4, (uint64_t)&v150) != 1)goto LABEL_29; {
          float v27 = ptr[0];
          }
          if ((uint64_t)ptr[0] >= v140.i64[0])
          {
            uint64_t v28 = 5;
            if (v140.i64[0]) {
              uint64_t v28 = 2 * v140.i64[0];
            }
            if (v28 <= (uint64_t)ptr[0]) {
              uint64_t v29 = (uint64_t)ptr[0] + 1;
            }
            else {
              uint64_t v29 = v28;
            }
            if (v29)
            {
              ptr[1] = malloc_type_realloc(ptr[1], 48 * v29, 0x756B030FuLL);
              float v27 = ptr[0];
            }
            v140.i64[0] = v29;
          }
          ptr[0] = (char *)v27 + 1;
          double v30 = (float64x2_t *)((char *)ptr[1] + 48 * (void)v27);
          float64x2_t v31 = v152;
          float64x2_t v32 = v150;
          v30[1] = v151;
          v30[2] = v31;
          *double v30 = v32;
          if ((uint64_t)ptr[0] < 1) {
            goto LABEL_6;
          }
          goto LABEL_30;
        case 3:
        case 5:
        case 6:
        case 7:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
          goto LABEL_25;
        case 8:
          vl_pose_score(v133, a2, (uint64_t)a3, a4, a5, (uint64_t)a7, a6, a9 + 60, (uint64_t)ptr);
LABEL_29:
          if ((uint64_t)ptr[0] >= 1) {
            goto LABEL_30;
          }
          goto LABEL_6;
        case 16:
          vl_pose_g_ps(v133, a2, (uint64_t)a3, a5, a6, (uint64_t)a7, a8, a9, (uint64_t)ptr);
          if ((uint64_t)ptr[0] < 1) {
            goto LABEL_6;
          }
          goto LABEL_30;
        case 64:
          printf("%sAborting : ", (const char *)&unk_21BB738AE);
          printf("Not support running CSL in standalone compilation.");
          putchar(10);
          __assert_rtn("pose_solver", "vl_pose.c", 265, "0");
        default:
          if (v23 == 128)
          {
            uint64_t v33 = (float32x4_t *)malloc_type_realloc(0, 0xF0uLL, 0x37F70F79uLL);
            ptr[1] = v33;
            v140.i64[0] = 5;
            ptr[0] = (void *)1;
            float64x2_t v154 = 0u;
            float64x2_t v155 = 0u;
            float64x2_t v152 = 0u;
            float64x2_t v153 = 0u;
            float64x2_t v150 = 0u;
            float64x2_t v151 = 0u;
            g_coords_diff((double *)(a2 + 304), v135, (uint64_t)&v150);
            float32x4_t v34 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v152), v153);
            *uint64_t v33 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v150), v151);
            v33[1] = v34;
            v33[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v154), v155);
            if ((uint64_t)ptr[0] < 1) {
              goto LABEL_6;
            }
          }
          else
          {
LABEL_25:
            printf("%sError : ", (const char *)&unk_21BB738AE);
            printf("Unsupported detection method %d", *(_DWORD *)a9);
            putchar(10);
            if ((uint64_t)ptr[0] < 1) {
              goto LABEL_6;
            }
          }
LABEL_30:
          uint64_t v35 = v142;
          if (v142 >= v144)
          {
            if (2 * v144 <= v142) {
              uint64_t v36 = v142 + 1;
            }
            else {
              uint64_t v36 = 2 * v144;
            }
            if (v36)
            {
              uint64_t v143 = malloc_type_realloc(v143, 280 * v36, 0xF35B09BuLL);
              uint64_t v35 = v142;
            }
            uint64_t v144 = v36;
          }
          uint64_t v142 = v35 + 1;
          uint64_t v37 = (uint64_t *)v143;
          uint64_t v38 = (char *)v143 + 280 * v35;
          *((_OWORD *)v38 + 2) = 0u;
          *((_OWORD *)v38 + 3) = 0u;
          *((_OWORD *)v38 + 4) = 0u;
          *((_OWORD *)v38 + 5) = 0u;
          *((_OWORD *)v38 + 6) = 0u;
          *((_OWORD *)v38 + 7) = 0u;
          *((_OWORD *)v38 + 8) = 0u;
          *((_OWORD *)v38 + 9) = 0u;
          *((_OWORD *)v38 + 10) = 0u;
          *((_OWORD *)v38 + 11) = 0u;
          *((_OWORD *)v38 + 12) = 0u;
          *((_OWORD *)v38 + 13) = 0u;
          *((_OWORD *)v38 + 14) = 0u;
          *((_OWORD *)v38 + 15) = 0u;
          *((_OWORD *)v38 + 16) = 0u;
          *((void *)v38 + 34) = 0;
          *(_OWORD *)uint64_t v38 = 0u;
          *((_OWORD *)v38 + 1) = 0u;
          long long v40 = *((_OWORD *)ptr[1] + 1);
          long long v39 = *((_OWORD *)ptr[1] + 2);
          long long v41 = *(_OWORD *)ptr[1];
          *((_OWORD *)v38 + 1) = v40;
          *((_OWORD *)v38 + 2) = v39;
          *(_OWORD *)uint64_t v38 = v41;
          if (*(_DWORD *)(a9 + 344) == 2)
          {
            float v42 = *(double *)(a2 + 32);
            vl_pose_irefine((long long *)v38, a3, a5, (uint64_t)a7, a9, (float32x2_t *)v38, (uint64_t)&v37[35 * v35 + 16], (uint64_t)&v37[35 * v35 + 6], v42);
          }
          else
          {
            double v50 = *(double *)(a2 + 32);
            float v51 = *(float *)(a9 + 328) / v50;
            vl_pose_get_inliers((uint64_t)v38, (uint64_t)a3, a5, a7, (uint64_t)&v37[35 * v35 + 6], v51, v50, *(double *)&v40, v24, v25, v26);
            if (*(_DWORD *)(a9 + 344) == 1)
            {
              float v52 = *(float *)(a9 + 348) / *(double *)(a2 + 32);
              vl_pose_refine((float32x2_t *)v38, (uint64_t)&v37[35 * v35 + 6], &v37[35 * v35 + 9], *(_DWORD *)(a9 + 364), (float32x2_t *)v38, (uint64_t)&v37[35 * v35 + 16], v52, *(float *)(a9 + 356), *(float *)(a9 + 360));
            }
          }
          if (v23 > 0x20) {
            goto LABEL_45;
          }
          if (((1 << v23) & 0x100000016) != 0)
          {
            log_col_app((uint64_t)"RANSAC inlier = %s%d%s", v43, v44, v45, v46, v47, v48, v49, (char)&unk_21BB738AE);
            goto LABEL_6;
          }
          if (((1 << v23) & 0x10100) != 0)
          {
            log_col_app((uint64_t)"SCORE inlier  = %s%d%s", v43, v44, v45, v46, v47, v48, v49, (char)&unk_21BB738AE);
          }
          else
          {
LABEL_45:
            if (v23 == 128) {
              log_col_app((uint64_t)"INPUT inlier  = %s%d%s", v43, v44, v45, v46, v47, v48, v49, (char)&unk_21BB738AE);
            }
          }
LABEL_6:
          free(ptr[1]);
          break;
      }
    }
    uint64_t v23 = (2 * v23);
  }
  while (v23 != 256);
  if (!v142)
  {
    *a14 = 0;
    *(void *)a12 = 0;
    *(void *)(a12 + 24) = 0;
    *(void *)(a12 + 48) = 0;
    goto LABEL_111;
  }
  vl_dump_detail_pose_score(a10, &v142);
  if (*(_DWORD *)(a9 + 384))
  {
    vl_hs_compute_hypothesis_scores(a1 + 2120, (unint64_t *)&v142, a2, a3, a5, (uint64_t)a7, (void *)*(unsigned int *)(a9 + 388));
    if (v142 >= 1)
    {
      uint64_t v60 = 0;
      uint64_t v61 = 272;
      do
      {
        double v128 = *(float *)((char *)v143 + v61);
        log_col_app((uint64_t)"POSE Confidence = %7.5f", v53, v54, v55, v56, v57, v58, v59, SLOBYTE(v128));
        ++v60;
        v61 += 280;
      }
      while (v142 > v60);
    }
  }
  else if (v142 >= 1)
  {
    uint64_t v62 = 0;
    uint64_t v63 = 272;
    do
    {
      float32x4_t v64 = (float *)((char *)v143 + v63);
      float v65 = (1.0
           - exp(-((double)*(int *)((char *)v143 + v63 - 224)
                 * 0.13
                 * ((double)*(int *)((char *)v143 + v63 - 224)
                  * 0.13))))
          * 0.980000019;
      *float32x4_t v64 = v65;
      double v129 = v65;
      log_col_app((uint64_t)"POSE Confidence = %7.5f", v66, v67, v68, v69, v70, v71, v72, SLOBYTE(v129));
      ++v62;
      v63 += 280;
    }
    while (v142 > v62);
  }
  vl_dump_detail_pose_referee(a10, &v142);
  uint64_t v73 = v142;
  if (v142 >= 1)
  {
    uint64_t v74 = 0;
    uint64_t v75 = *(void *)(a1 + 3928);
    uint64_t v76 = *(void *)(a1 + 3944);
    uint64_t v77 = 272;
    do
    {
      float32x4_t v78 = (char *)v143;
      if (v75 >= v76)
      {
        uint64_t v79 = 2 * v76;
        if (!v76) {
          uint64_t v79 = 64;
        }
        if (v79 <= v75) {
          uint64_t v76 = v75 + 1;
        }
        else {
          uint64_t v76 = v79;
        }
        if (v76)
        {
          *(void *)(a1 + 3936) = malloc_type_realloc(*(void **)(a1 + 3936), 4 * v76, 0xB5B411DAuLL);
          uint64_t v75 = *(void *)(a1 + 3928);
          uint64_t v73 = v142;
        }
        *(void *)(a1 + 3944) = v76;
      }
      *(void *)(a1 + 3928) = v75 + 1;
      *(_DWORD *)(*(void *)(a1 + 3936) + 4 * v75) = *(_DWORD *)&v78[v77];
      ++v74;
      v77 += 280;
      ++v75;
    }
    while (v74 < v73);
  }
  if (!*(_DWORD *)(a9 + 376))
  {
LABEL_82:
    vl_dump_detail_pose_fuse(a10, &v142);
    uint64_t v92 = v142;
    if (v142 > 0) {
      goto LABEL_83;
    }
    goto LABEL_101;
  }
  if (*(_DWORD *)(a1 + 3684))
  {
    *(void *)(a1 + 3592) -= mach_absolute_time();
    if (*(void *)(a1 + 3976)) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  clock_gettime(_CLOCK_THREAD_CPUTIME_ID, (timespec *)(a1 + 3504));
  clock_gettime(_CLOCK_PROCESS_CPUTIME_ID, (timespec *)(a1 + 3488));
  clock_gettime(_CLOCK_MONOTONIC, (timespec *)(a1 + 3472));
  if (!*(void *)(a1 + 3976))
  {
LABEL_74:
    size_t v80 = *(int *)(a9 + 380);
    float32x4_t v81 = malloc_type_calloc(1uLL, 0x50uLL, 0x1020040FF0452BCuLL);
    v81[3] = v80;
    *(void *)float32x4_t v81 = malloc_type_calloc(v80, 0x2C8uLL, 0x10300403D7DEA7AuLL);
    *((void *)v81 + 2) = 0x40A0240000000000;
    v81[6] = 8;
    *((_OWORD *)v81 + 2) = xmmword_21BB7CDB0;
    *((_OWORD *)v81 + 3) = xmmword_21BB7CDC0;
    *((_OWORD *)v81 + 4) = xmmword_21BB7CDD0;
    *(void *)(a1 + 3976) = v81;
  }
LABEL_75:
  if (v142 >= 1)
  {
    uint64_t v82 = 0;
    uint64_t v83 = 272;
    do
    {
      float32x4_t v84 = (char *)v143 + v83;
      if (vl_pose_fuse(*(uint64_t **)(a1 + 3976), v135, (float32x2_t *)((char *)v143 + v83 - 272), *(const void **)((char *)v143 + v83 - 216), *(const void **)((char *)v143 + v83 - 192), *(_DWORD *)((char *)v143 + v83 - 200), (float32x2_t *)(a2 + 256), (float *)((char *)v143 + v83), *(float *)((char *)v143 + v83), 0.0, (float32x4_t *)((char *)v143 + v83 - 272), (char *)v143 + v83 - 144, a2, a2 + 24))
      {
        *float32x4_t v84 = 0;
      }
      ++v82;
      v83 += 280;
    }
    while (v142 > v82);
  }
  vl_timer_stop(a1 + 3472);
  if (*(_DWORD *)(a1 + 3684))
  {
    printf("Verbose : ");
    printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 3620), (double)*(uint64_t *)(a1 + 3592) * 0.000001);
    putchar(10);
    goto LABEL_82;
  }
  log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v85, v86, v87, v88, v89, v90, v91, (char)&str_4_1);
  vl_dump_detail_pose_fuse(a10, &v142);
  uint64_t v92 = v142;
  if (v142 > 0)
  {
LABEL_83:
    uint64_t v93 = 0;
    uint64_t v94 = *(void *)(a1 + 3952);
    uint64_t v95 = *(void *)(a1 + 3968);
    uint64_t v96 = 272;
    do
    {
      double v97 = (char *)v143;
      if (v94 >= v95)
      {
        uint64_t v98 = 2 * v95;
        if (!v95) {
          uint64_t v98 = 64;
        }
        if (v98 <= v94) {
          uint64_t v95 = v94 + 1;
        }
        else {
          uint64_t v95 = v98;
        }
        if (v95)
        {
          *(void *)(a1 + 3960) = malloc_type_realloc(*(void **)(a1 + 3960), 4 * v95, 0xA03FE08uLL);
          uint64_t v94 = *(void *)(a1 + 3952);
          uint64_t v92 = v142;
        }
        *(void *)(a1 + 3968) = v95;
      }
      *(void *)(a1 + 3952) = v94 + 1;
      *(_DWORD *)(*(void *)(a1 + 3960) + 4 * v94) = *(_DWORD *)&v97[v96];
      ++v93;
      v96 += 280;
      ++v94;
    }
    while (v93 < v92);
    __int32 v99 = (char *)v143;
    if (v92 < 1)
    {
      int v100 = -1;
    }
    else if (v92 == 1)
    {
      int v100 = 0;
    }
    else
    {
      int v101 = 0;
      float v102 = *((float *)v143 + 68);
      uint64_t v103 = 1;
      uint64_t v104 = 552;
      do
      {
        if (*(float *)((char *)v143 + v104) > v102)
        {
          float v102 = *(float *)((char *)v143 + v104);
          int v101 = v103;
        }
        ++v103;
        v104 += 280;
      }
      while (v92 != v103);
      int v100 = v101;
    }
    goto LABEL_107;
  }
LABEL_101:
  int v100 = -1;
  __int32 v99 = (char *)v143;
LABEL_107:
  float v105 = &v99[280 * v100];
  long long v106 = *(_OWORD *)v105;
  long long v107 = *((_OWORD *)v105 + 2);
  *(_OWORD *)(a11 + 16) = *((_OWORD *)v105 + 1);
  *(_OWORD *)(a11 + 32) = v107;
  *(_OWORD *)a11 = v106;
  float64x2_t v151 = *((float64x2_t *)v105 + 4);
  float64x2_t v152 = *((float64x2_t *)v105 + 5);
  float64x2_t v153 = *((float64x2_t *)v105 + 6);
  float64x2_t v154 = *((float64x2_t *)v105 + 7);
  float64x2_t v150 = *((float64x2_t *)v105 + 3);
  *((_OWORD *)v105 + 3) = *(_OWORD *)a12;
  long long v108 = *(_OWORD *)(a12 + 64);
  long long v110 = *(_OWORD *)(a12 + 16);
  long long v109 = *(_OWORD *)(a12 + 32);
  *((_OWORD *)v105 + 6) = *(_OWORD *)(a12 + 48);
  *((_OWORD *)v105 + 7) = v108;
  *((_OWORD *)v105 + 4) = v110;
  *((_OWORD *)v105 + 5) = v109;
  float64x2_t v111 = v154;
  float64x2_t v112 = v152;
  *(float64x2_t *)(a12 + 48) = v153;
  *(float64x2_t *)(a12 + 64) = v111;
  float64x2_t v113 = v151;
  *(float64x2_t *)a12 = v150;
  *(float64x2_t *)(a12 + 16) = v113;
  *(float64x2_t *)(a12 + 32) = v112;
  *a13 = *((_DWORD *)v105 + 32);
  a13[1] = *((_DWORD *)v105 + 33);
  a13[2] = *((_DWORD *)v105 + 34);
  a13[3] = *((_DWORD *)v105 + 35);
  a13[4] = *((_DWORD *)v105 + 36);
  a13[5] = *((_DWORD *)v105 + 37);
  a13[6] = *((_DWORD *)v105 + 38);
  a13[7] = *((_DWORD *)v105 + 39);
  a13[8] = *((_DWORD *)v105 + 40);
  a13[9] = *((_DWORD *)v105 + 41);
  a13[10] = *((_DWORD *)v105 + 42);
  a13[11] = *((_DWORD *)v105 + 43);
  a13[12] = *((_DWORD *)v105 + 44);
  a13[13] = *((_DWORD *)v105 + 45);
  a13[14] = *((_DWORD *)v105 + 46);
  a13[15] = *((_DWORD *)v105 + 47);
  a13[16] = *((_DWORD *)v105 + 48);
  a13[17] = *((_DWORD *)v105 + 49);
  a13[18] = *((_DWORD *)v105 + 50);
  a13[19] = *((_DWORD *)v105 + 51);
  a13[20] = *((_DWORD *)v105 + 52);
  a13[21] = *((_DWORD *)v105 + 53);
  a13[22] = *((_DWORD *)v105 + 54);
  a13[23] = *((_DWORD *)v105 + 55);
  a13[24] = *((_DWORD *)v105 + 56);
  a13[25] = *((_DWORD *)v105 + 57);
  a13[26] = *((_DWORD *)v105 + 58);
  a13[27] = *((_DWORD *)v105 + 59);
  a13[28] = *((_DWORD *)v105 + 60);
  a13[29] = *((_DWORD *)v105 + 61);
  a13[30] = *((_DWORD *)v105 + 62);
  a13[31] = *((_DWORD *)v105 + 63);
  a13[32] = *((_DWORD *)v105 + 64);
  a13[33] = *((_DWORD *)v105 + 65);
  a13[34] = *((_DWORD *)v105 + 66);
  a13[35] = *((_DWORD *)v105 + 67);
  LODWORD(v106) = *((_DWORD *)v105 + 68);
  *a14 = v106;
  vl_dump_detail_pose_result(a10, (float32x2_t *)a11, a12, *(float *)&v106);
  if (*(double *)(a1 + 4056) != 0.0 || *(double *)(a1 + 4064) != 0.0 || *(double *)(a1 + 4072) != 0.0)
  {
    float64x2_t v154 = 0u;
    float64x2_t v155 = 0u;
    float64x2_t v152 = 0u;
    float64x2_t v153 = 0u;
    float64x2_t v150 = 0u;
    float64x2_t v151 = 0u;
    g_camera_global_to_local(v135, (double *)(a1 + 3984), v150.f64);
    *(float32x4_t *)ptr = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v150), v151);
    float32x4_t v140 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v152), v153);
    float32x4_t v141 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v154), v155);
    *(_DWORD *)(a12 + 72) = vl_pose_get_inliers((uint64_t)ptr, (uint64_t)a3, a5, a7, 0, *(float *)(a9 + 8), *(double *)v141.i64, *(double *)v140.i64, v114, v115, v116);
    printf("Verbose : ");
    printf("%s: %d inliers_gt_pose", "vl_pose", *(_DWORD *)(a12 + 72));
    putchar(10);
  }
LABEL_111:
  if (v142 >= 1)
  {
    uint64_t v117 = 0;
    for (uint64_t i = 0; i < v142; ++i)
    {
      float v119 = (void **)((char *)v143 + v117);
      free(*(void **)((char *)v143 + v117 + 56));
      free(v119[10]);
      free(v119[13]);
      v117 += 280;
    }
  }
  free(v143);
  vl_timer_stop(v130);
  if (!*(_DWORD *)(a1 + 3900)) {
    return log_col_app((uint64_t)"%s%s%s:%s%7.1fms%s", v120, v121, v122, v123, v124, v125, v126, (char)&str_4_1);
  }
  printf("Verbose : ");
  printf("Total time for %40s : %7.3f ms", (const char *)(a1 + 3836), (double)*(uint64_t *)(a1 + 3808) * 0.000001);
  return putchar(10);
}

int32x2_t slam_tracker_vo_par_ver@<D0>(int a1@<W0>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 0:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_DWORD *)a2 = 10;
      *(_DWORD *)(a2 + 20) = 360000;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_OWORD *)(a2 + 36) = xmmword_21BB7D180;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      int32x4_t v2 = vdupq_n_s32(0x3F7D70A4u);
      *(_DWORD *)(a2 + 88) = 12;
      *(int32x4_t *)(a2 + 104) = v2;
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(void *)(a2 + 120) = v2.i64[0];
      *(void *)(a2 + 128) = 0x100000002;
      *(void *)(a2 + 140) = 0x500000003;
      *(_DWORD *)(a2 + 148) = 2;
      *(_OWORD *)(a2 + 152) = xmmword_21BB7D1A0;
      *(int32x4_t *)(a2 + 168) = vdupq_n_s32(0x3DCCCCCDu);
      *(_DWORD *)(a2 + 232) = 1043422380;
      *(_OWORD *)(a2 + 184) = xmmword_21BB7D1B0;
      *(void *)(a2 + 200) = 0x3F0000003F000000;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      int32x2_t result = vdup_n_s32(0x7F800000u);
      *(int32x2_t *)(a2 + 264) = result;
      *(_DWORD *)(a2 + 296) = -1;
      break;
    case 32:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      int32x4_t v4 = vdupq_n_s32(0x3F7D70A4u);
      *(_DWORD *)(a2 + 88) = 12;
      *(int32x4_t *)(a2 + 104) = v4;
      *(void *)(a2 + 120) = v4.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(void *)(a2 + 196) = 0x3F0000003F000000;
      *(_DWORD *)(a2 + 204) = 1056964608;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(void *)(a2 + 260) = 0x3F26666600000002;
      *(_DWORD *)(a2 + 268) = 2139095040;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(void *)(a2 + 208) = 0x3A83126F3A83126FLL;
      *(void *)(a2 + 216) = 0x3A83126F3A83126FLL;
      *(void *)(a2 + 224) = 0x3A83126F3A83126FLL;
      *(_DWORD *)a2 = 20;
      *(void *)(a2 + 140) = 0x20000000ALL;
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 168) = xmmword_21BB7D260;
      *(int32x2_t *)(a2 + 184) = vdup_n_s32(0x3C8EFA35u);
      *(_DWORD *)(a2 + 192) = 1016003125;
      *(void *)(a2 + 128) = 0x100000001;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(void *)(a2 + 36) = 0x3FC0000040A00000;
      int32x2_t result = (int32x2_t)0x412000003C23D70ALL;
      *(_OWORD *)(a2 + 152) = xmmword_21BB7D210;
      *(_DWORD *)(a2 + 20) = 122500;
      break;
    case 35:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      int32x4_t v5 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v5;
      *(void *)(a2 + 120) = v5.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(void *)(a2 + 164) = 0x3DCCCCCD3DB2B8C2;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(_OWORD *)(a2 + 196) = xmmword_21BB7D240;
      *(int32x4_t *)(a2 + 212) = vdupq_n_s32(0x3A83126Fu);
      *(_DWORD *)a2 = 20;
      *(void *)(a2 + 140) = 0x20000000ALL;
      *(void *)(a2 + 148) = 0x3C23D70A00000001;
      *(void *)(a2 + 128) = 0x100000001;
      *(void *)(a2 + 228) = 0x40A000003A83126FLL;
      *(_OWORD *)(a2 + 36) = xmmword_21BB7D250;
      *(_DWORD *)(a2 + 156) = 1092616192;
      *(_DWORD *)(a2 + 160) = 1065353216;
      *(_DWORD *)(a2 + 20) = 122500;
      *(void *)(a2 + 264) = 0x3DCCCCCD3F266666;
      *(_DWORD *)(a2 + 292) = 1069547520;
      int32x2_t result = (int32x2_t)0xF00000001;
      *(void *)(a2 + 240) = 0xF00000001;
      *(void *)(a2 + 172) = 0x3D4CCCCD3DCCCCCDLL;
      *(void *)(a2 + 180) = 0x3AE4C3883D4CCCCDLL;
      *(void *)(a2 + 188) = 0x3AE4C3883AE4C388;
      break;
    case 36:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      int32x4_t v6 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v6;
      *(void *)(a2 + 120) = v6.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(void *)(a2 + 260) = 0x3F26666600000002;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)a2 = 20;
      *(void *)(a2 + 140) = 0x20000000ALL;
      *(void *)(a2 + 148) = 0x3C23D70A00000001;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 156) = xmmword_21BB7D220;
      *(void *)(a2 + 128) = 0x900000001;
      *(_OWORD *)(a2 + 272) = xmmword_21BB7D230;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_DWORD *)(a2 + 268) = 1036831949;
      *(_DWORD *)(a2 + 292) = 1069547520;
      *(void *)(a2 + 196) = 0x3F8000003E4CCCCDLL;
      *(_DWORD *)(a2 + 204) = 1065353216;
      *(void *)(a2 + 172) = 0x3D4CCCCD3E19999ALL;
      *(void *)(a2 + 180) = 0x3AE4C3883D4CCCCDLL;
      *(void *)(a2 + 188) = 0x3AE4C3883AE4C388;
      *(_OWORD *)(a2 + 208) = xmmword_21BB7D1D0;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      int32x2_t result = (int32x2_t)0x3F80000040A00000;
      *(void *)(a2 + 36) = 0x3F80000040A00000;
      break;
    case 37:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      int32x4_t v7 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v7;
      *(void *)(a2 + 120) = v7.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(void *)(a2 + 264) = 0x3DCCCCCD3F266666;
      *(void *)(a2 + 148) = 0x3C23D70A00000001;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 156) = xmmword_21BB7D220;
      *(void *)(a2 + 128) = 0x900000001;
      *(_OWORD *)(a2 + 272) = xmmword_21BB7D230;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_DWORD *)(a2 + 292) = 1069547520;
      *(void *)(a2 + 196) = 0x3F8000003E4CCCCDLL;
      *(_DWORD *)(a2 + 204) = 1065353216;
      *(void *)(a2 + 172) = 0x3D4CCCCD3E19999ALL;
      *(void *)(a2 + 180) = 0x3AE4C3883D4CCCCDLL;
      *(_OWORD *)(a2 + 208) = xmmword_21BB7D1D0;
      *(void *)(a2 + 188) = 0x3AE4C3883AE4C388;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(void *)(a2 + 36) = 0x3F80000040A00000;
      *(_DWORD *)a2 = 16;
      int32x2_t result = (int32x2_t)0x20000000FLL;
      *(void *)(a2 + 140) = 0x20000000FLL;
      *(_DWORD *)(a2 + 296) = 7;
      break;
    case 38:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      int32x4_t v8 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v8;
      *(void *)(a2 + 120) = v8.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)a2 = 20;
      *(void *)(a2 + 140) = 0x20000000ALL;
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 152) = xmmword_21BB7D210;
      *(_OWORD *)(a2 + 264) = xmmword_21BB7D1C0;
      *(_OWORD *)(a2 + 208) = xmmword_21BB7D1D0;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_DWORD *)(a2 + 292) = 1069547520;
      *(void *)(a2 + 196) = 0x3F8000003E4CCCCDLL;
      *(_DWORD *)(a2 + 204) = 1065353216;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(void *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(void *)(a2 + 36) = 0x3F80000040E00000;
      *(void *)(a2 + 172) = 0x3DCCCCCD3F000000;
      *(void *)(a2 + 180) = 0x3D0EFA353DCCCCCDLL;
      *(void *)(a2 + 188) = 0x3D0EFA353D0EFA35;
      int32x2_t result = (int32x2_t)0x1900000001;
      *(void *)(a2 + 128) = 0x1900000001;
      break;
    case 39:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      int32x4_t v9 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v9;
      *(void *)(a2 + 120) = v9.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)a2 = 20;
      *(void *)(a2 + 140) = 0x20000000ALL;
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 264) = xmmword_21BB7D1C0;
      *(_OWORD *)(a2 + 208) = xmmword_21BB7D1D0;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_DWORD *)(a2 + 292) = 1069547520;
      *(void *)(a2 + 196) = 0x3F8000003E4CCCCDLL;
      *(_DWORD *)(a2 + 204) = 1065353216;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(void *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(void *)(a2 + 36) = 0x3F80000040E00000;
      *(void *)(a2 + 172) = 0x3DCCCCCD3F000000;
      *(void *)(a2 + 180) = 0x3D0EFA353DCCCCCDLL;
      *(void *)(a2 + 188) = 0x3D0EFA353D0EFA35;
      *(void *)(a2 + 128) = 0x3800000001;
      int32x2_t result = (int32x2_t)0x412000003DCCCCCDLL;
      *(_OWORD *)(a2 + 152) = xmmword_21BB7D1E0;
      break;
    case 40:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      int32x4_t v10 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v10;
      *(void *)(a2 + 120) = v10.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(_OWORD *)(a2 + 200) = xmmword_21BB7D1F0;
      *(_OWORD *)(a2 + 264) = xmmword_21BB7D1C0;
      *(_OWORD *)(a2 + 216) = xmmword_21BB7D200;
      *(void *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(_OWORD *)(a2 + 152) = xmmword_21BB7D1E0;
      *(void *)(a2 + 172) = 0x3F0000003E4CCCCDLL;
      *(void *)(a2 + 180) = 0x3E32B8C23F000000;
      *(void *)(a2 + 188) = 0x3DB2B8C23DB2B8C2;
      *(_DWORD *)(a2 + 292) = 1067030938;
      *(void *)(a2 + 36) = 0x3FC0000040400000;
      *(void *)(a2 + 128) = 0x3900000001;
      *(_DWORD *)(a2 + 196) = 1056964608;
      *(_DWORD *)a2 = 16;
      int32x2_t result = (int32x2_t)0x200000008;
      *(void *)(a2 + 140) = 0x200000008;
      break;
    case 41:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      int32x4_t v11 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v11;
      *(void *)(a2 + 120) = v11.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 264) = xmmword_21BB7D1C0;
      *(_OWORD *)(a2 + 208) = xmmword_21BB7D1D0;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(void *)(a2 + 200) = 0x3F8000003F800000;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(void *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(_OWORD *)(a2 + 152) = xmmword_21BB7D1E0;
      *(_DWORD *)(a2 + 292) = 1067030938;
      *(void *)(a2 + 128) = 0x3900000001;
      *(_DWORD *)(a2 + 196) = 1056964608;
      *(_DWORD *)a2 = 16;
      *(void *)(a2 + 140) = 0x200000008;
      *(void *)(a2 + 172) = 0x3F8000003E4CCCCDLL;
      *(void *)(a2 + 180) = 0x3E32B8C23F800000;
      *(void *)(a2 + 188) = 0x3DB2B8C23DB2B8C2;
      int32x2_t result = (int32x2_t)0x3F80000040400000;
      *(void *)(a2 + 36) = 0x3F80000040400000;
      break;
    case 42:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_DWORD *)(a2 + 52) = 2;
      *(void *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      int32x4_t v12 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v12;
      *(void *)(a2 + 120) = v12.i64[0];
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 168) = 1036831949;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      *(_DWORD *)(a2 + 296) = -1;
      *(int32x2_t *)(a2 + 44) = vdup_n_s32(0x3F7AE148u);
      *(_DWORD *)(a2 + 148) = 1;
      *(_DWORD *)(a2 + 240) = 1;
      *(_OWORD *)(a2 + 264) = xmmword_21BB7D1C0;
      *(_OWORD *)(a2 + 208) = xmmword_21BB7D1D0;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_DWORD *)(a2 + 232) = 1084227584;
      *(_DWORD *)(a2 + 20) = 122500;
      *(void *)(a2 + 200) = 0x3F8000003F800000;
      *(int32x2_t *)(a2 + 224) = vdup_n_s32(0x3A64C388u);
      *(void *)(a2 + 280) = 0xBB03126F3C23D70ALL;
      *(_OWORD *)(a2 + 152) = xmmword_21BB7D1E0;
      *(_DWORD *)(a2 + 292) = 1067030938;
      *(_DWORD *)(a2 + 196) = 1056964608;
      *(void *)(a2 + 172) = 0x3F8000003E4CCCCDLL;
      *(void *)(a2 + 180) = 0x3E32B8C23F800000;
      *(void *)(a2 + 188) = 0x3DB2B8C23DB2B8C2;
      *(void *)(a2 + 36) = 0x3F80000040400000;
      *(void *)(a2 + 128) = 0x1900000001;
      *(_DWORD *)a2 = 24;
      int32x2_t result = (int32x2_t)0x20000000CLL;
      *(void *)(a2 + 140) = 0x20000000CLL;
      break;
    case 70:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_DWORD *)(a2 + 20) = 360000;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_OWORD *)(a2 + 36) = xmmword_21BB7D180;
      *(void *)(a2 + 8) = 0x4024000000000000;
      *(_DWORD *)(a2 + 88) = 12;
      int32x4_t v13 = vdupq_n_s32(0x3F7D70A4u);
      *(int32x4_t *)(a2 + 104) = v13;
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(_DWORD *)(a2 + 52) = 2;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(void *)(a2 + 120) = v13.i64[0];
      *(void *)(a2 + 128) = 0x100000002;
      *(void *)(a2 + 140) = 0x500000003;
      *(_DWORD *)(a2 + 148) = 2;
      *(_OWORD *)(a2 + 152) = xmmword_21BB7D1A0;
      *(int32x4_t *)(a2 + 168) = vdupq_n_s32(0x3DCCCCCDu);
      *(_DWORD *)(a2 + 232) = 1043422380;
      *(_OWORD *)(a2 + 184) = xmmword_21BB7D1B0;
      *(void *)(a2 + 200) = 0x3F0000003F000000;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      int32x2_t result = vdup_n_s32(0x7F800000u);
      *(_DWORD *)(a2 + 260) = 2;
      *(int32x2_t *)(a2 + 264) = result;
      *(_DWORD *)(a2 + 296) = -1;
      *(_DWORD *)a2 = 11;
      break;
    case 71:
      *(_OWORD *)(a2 + 272) = 0u;
      *(_OWORD *)(a2 + 288) = 0u;
      *(_OWORD *)(a2 + 240) = 0u;
      *(_OWORD *)(a2 + 256) = 0u;
      *(_OWORD *)(a2 + 208) = 0u;
      *(_OWORD *)(a2 + 224) = 0u;
      *(_OWORD *)(a2 + 176) = 0u;
      *(_OWORD *)(a2 + 192) = 0u;
      *(_OWORD *)(a2 + 144) = 0u;
      *(_OWORD *)(a2 + 160) = 0u;
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_DWORD *)(a2 + 20) = 360000;
      *(void *)(a2 + 24) = 0x47C350003E4CCCCDLL;
      *(_OWORD *)(a2 + 36) = xmmword_21BB7D180;
      *(void *)(a2 + 8) = 0x4024000000000000;
      int32x4_t v14 = vdupq_n_s32(0x3F7D70A4u);
      *(_DWORD *)(a2 + 88) = 12;
      *(int32x4_t *)(a2 + 104) = v14;
      *(_OWORD *)(a2 + 56) = xmmword_21BB7D190;
      *(int32x2_t *)(a2 + 72) = vdup_n_s32(0x7FC00000u);
      *(void *)(a2 + 120) = v14.i64[0];
      *(void *)(a2 + 128) = 0x100000002;
      *(void *)(a2 + 140) = 0x500000003;
      *(_OWORD *)(a2 + 152) = xmmword_21BB7D1A0;
      *(int32x4_t *)(a2 + 168) = vdupq_n_s32(0x3DCCCCCDu);
      *(_DWORD *)(a2 + 232) = 1043422380;
      *(_OWORD *)(a2 + 184) = xmmword_21BB7D1B0;
      *(void *)(a2 + 200) = 0x3F0000003F000000;
      *(_DWORD *)(a2 + 52) = 2;
      *(_DWORD *)(a2 + 148) = 2;
      *(void *)(a2 + 252) = 0x3CCCCCCD3DCCCCCDLL;
      *(_DWORD *)(a2 + 260) = 2;
      int32x2_t result = vdup_n_s32(0x7F800000u);
      *(int32x2_t *)(a2 + 264) = result;
      *(_DWORD *)(a2 + 296) = -1;
      *(_DWORD *)a2 = 11;
      *(_DWORD *)(a2 + 80) = 2143289344;
      *(_DWORD *)(a2 + 84) = 1;
      break;
    default:
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 378, (uint64_t)"slam_tracker_vo_par_ver", "Unknown version %d", a1);
      abort();
  }
  return result;
}

void slam_tracker_vo_free(uint64_t a1)
{
  if (*(int *)(a1 + 588) >= 1)
  {
    uint64_t v2 = 0;
    for (uint64_t i = 0; i < *(int *)(a1 + 588); ++i)
    {
      uint64_t v4 = *(void *)(a1 + 304) + v2;
      free(*(void **)(v4 + 368));
      free(*(void **)(v4 + 376));
      free(*(void **)(v4 + 384));
      free(*(void **)(v4 + 392));
      free(*(void **)(v4 + 400));
      uint64_t v5 = *(void *)(v4 + 408);
      if (v5)
      {
        uint64_t v6 = *(void *)(v5 - 8 * *(void *)(v4 + 424) - 8);
        signed int v7 = atomic_fetch_add((atomic_uint *volatile)(v6 + 24), 0xFFFFFFFF) - 1;
        if (v7 < 0) {
          goto LABEL_18;
        }
        if (v7)
        {
          atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
          atomic_fetch_or(&global_stats[2], 0);
          atomic_fetch_or(global_stats, 0);
          atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
          atomic_fetch_or(&_pmem_total_blocks, 0);
          atomic_fetch_or(&pmem_bytes_allocated, 0);
        }
        else
        {
          unint64_t v8 = -*(void *)(v6 + 8);
          atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
          atomic_fetch_add(&global_stats[2], 0xFFFFFFFFFFFFFFFFLL);
          atomic_fetch_add(global_stats, v8);
          atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
          atomic_fetch_add(&_pmem_total_blocks, 0xFFFFFFFFFFFFFFFFLL);
          atomic_fetch_add(&pmem_bytes_allocated, v8);
          (*(void (**)(uint64_t))(v6 + 40))(v6);
          free((void *)v6);
        }
        *(void *)(v4 + 408) = 0;
      }
      free(*(void **)(v4 + 768));
      bzero((void *)v4, 0x370uLL);
      v2 += 880;
    }
  }
  free(*(void **)(a1 + 304));
  slam_tracker_vo_map_free(a1 + 312);
  slam_tracker_vo_smap_free(a1 + 440);
  free(*(void **)(a1 + 816));
  free(*(void **)(a1 + 840));
  free(*(void **)(a1 + 864));
  free(*(void **)(a1 + 936));
  free(*(void **)(a1 + 888));
  free(*(void **)(a1 + 912));
  uint64_t v9 = *(void *)(a1 + 960);
  if (v9)
  {
    uint64_t v10 = *(void *)(v9 - 32 * *(void *)(a1 + 976) - 8);
    signed int v11 = atomic_fetch_add((atomic_uint *volatile)(v10 + 24), 0xFFFFFFFF) - 1;
    if (v11 < 0) {
LABEL_18:
    }
      __assert_rtn("pmem_free", "pmem.c", 302, "count >= 0 && \"Negative count! Something is broken, double free? Memory corruption?\"");
    if (v11)
    {
      atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_or(&global_stats[2], 0);
      atomic_fetch_or(global_stats, 0);
      atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_or(&_pmem_total_blocks, 0);
      atomic_fetch_or(&pmem_bytes_allocated, 0);
    }
    else
    {
      unint64_t v12 = -*(void *)(v10 + 8);
      atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_add(&global_stats[2], 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_add(global_stats, v12);
      atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_add(&_pmem_total_blocks, 0xFFFFFFFFFFFFFFFFLL);
      atomic_fetch_add(&pmem_bytes_allocated, v12);
      (*(void (**)(uint64_t))(v10 + 40))(v10);
      free((void *)v10);
    }
  }
  free((void *)a1);
}

void slam_tracker_vo_map_free(uint64_t a1)
{
  if (*(uint64_t *)a1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 8;
    do
    {
      free(*(void **)(*(void *)(a1 + 8) + v3));
      ++v2;
      v3 += 24;
    }
    while (*(void *)a1 > v2);
  }
  free(*(void **)(a1 + 8));
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  free(*(void **)(a1 + 32));
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  free(*(void **)(a1 + 64));
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  free(*(void **)(a1 + 88));
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  free(*(void **)(a1 + 112));
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
}

void slam_tracker_vo_smap_free(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  free(*(void **)(a1 + 32));
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  free(*(void **)(a1 + 56));
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  free(*(void **)(a1 + 80));
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  free(*(void **)(a1 + 104));
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  free(*(void **)(a1 + 128));
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
}

uint64_t slam_tracker_vo_add(uint64_t a1, double *a2, int a3, uint64_t a4, int a5, int a6, int *a7, uint64_t a8, double a9, uint64_t a10, int a11, int a12, const void *a13, int a14, long long *a15)
{
  uint64_t v969 = *MEMORY[0x263EF8340];
  *(void *)&v957.tv_usec = 0;
  v957.__darwin_time_t tv_sec = 0;
  if (gettimeofday(&v957, 0) || (double)(v957.tv_usec + 1000000 * v957.tv_sec) / 1000000.0 <= 1514764800.0) {
    goto LABEL_700;
  }
  int v924 = a6;
  int v937 = a5;
  double v940 = 0.0;
  uint64_t v22 = a1;
  ++*(_DWORD *)(a1 + 584);
  uint64_t v23 = *(unsigned int *)(a1 + 588);
  int v24 = *(_DWORD *)(a1 + 140);
  if (v24 >= (int)v23) {
    int v24 = *(_DWORD *)(a1 + 588);
  }
  if ((int)v23 >= 1)
  {
    uint64_t v25 = *(void *)(a1 + 304);
    if (v23 == 1)
    {
      uint64_t v26 = 0;
LABEL_11:
      uint64_t v29 = v23 - v26;
      double v30 = (_DWORD *)(v25 + 880 * v26 + 668);
      do
      {
        *double v30 = 1;
        v30 += 220;
        --v29;
      }
      while (v29);
      goto LABEL_13;
    }
    uint64_t v26 = v23 & 0xFFFFFFFE;
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)(a1 + 304);
    do
    {
      *(_DWORD *)(v28 + 668) = 1;
      *(_DWORD *)(v28 + 1548) = 1;
      v28 += 1760;
      v27 -= 2;
    }
    while (v27);
    if (v26 != v23) {
      goto LABEL_11;
    }
  }
LABEL_13:
  int v31 = v24 - 1;
  if (v24 <= 1) {
    goto LABEL_21;
  }
  uint64_t v32 = *(void *)(a1 + 304);
  int v33 = *(_DWORD *)(a1 + 592) + v23;
  if (v24 == 2)
  {
    unsigned int v34 = 0;
LABEL_19:
    int v37 = v33 - v34;
    unsigned int v38 = ~v34 + v24;
    do
    {
      *(_DWORD *)(v32 + 880 * (v37 % (int)v23) + 668) = 0;
      --v37;
      --v38;
    }
    while (v38);
    goto LABEL_21;
  }
  unsigned int v34 = v31 & 0xFFFFFFFE;
  unsigned int v35 = v31 & 0xFFFFFFFE;
  int v36 = *(_DWORD *)(a1 + 592) + v23;
  do
  {
    *(_DWORD *)(v32 + 880 * (v36 % (int)v23) + 668) = 0;
    *(_DWORD *)(v32 + 880 * ((v36 - 1) % (int)v23) + 668) = 0;
    v36 -= 2;
    v35 -= 2;
  }
  while (v35);
  uint64_t v22 = a1;
  if (v31 != v34) {
    goto LABEL_19;
  }
LABEL_21:
  if (v23 == *(_DWORD *)v22)
  {
    int v39 = (*(_DWORD *)(v22 + 592) + 1) % (int)v23;
    long long v40 = (unsigned __int8 *)malloc_type_calloc(*(void *)(v22 + 368), 1uLL, 0x49B87F16uLL);
    slam_vo_map_marginalize_cam(v22, v39, (uint64_t)v40);
    remove_map_points(v22, v40);
    free(v40);
    uint64_t v41 = *(void *)(v22 + 304);
    uint64_t v42 = v41 + 880 * v39;
    free(*(void **)(v42 + 368));
    free(*(void **)(v42 + 376));
    free(*(void **)(v42 + 384));
    free(*(void **)(v42 + 392));
    free(*(void **)(v42 + 400));
    uint64_t v43 = *(void *)(v42 + 408);
    if (v43)
    {
      uint64_t v44 = *(void *)(v43 - 8 * *(void *)(v42 + 424) - 8);
      signed int v45 = atomic_fetch_add((atomic_uint *volatile)(v44 + 24), 0xFFFFFFFF) - 1;
      if (v45 < 0) {
        __assert_rtn("pmem_free", "pmem.c", 302, "count >= 0 && \"Negative count! Something is broken, double free? Memory corruption?\"");
      }
      if (v45)
      {
        atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
        atomic_fetch_or(&global_stats[2], 0);
        atomic_fetch_or(global_stats, 0);
        atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
        atomic_fetch_or(&_pmem_total_blocks, 0);
        atomic_fetch_or(&pmem_bytes_allocated, 0);
      }
      else
      {
        unint64_t v51 = -*(void *)(v44 + 8);
        atomic_fetch_add(&global_stats[1], 0xFFFFFFFFFFFFFFFFLL);
        atomic_fetch_add(&global_stats[2], 0xFFFFFFFFFFFFFFFFLL);
        atomic_fetch_add(global_stats, v51);
        atomic_fetch_add(&pmem_total_refs, 0xFFFFFFFFFFFFFFFFLL);
        atomic_fetch_add(&_pmem_total_blocks, 0xFFFFFFFFFFFFFFFFLL);
        atomic_fetch_add(&pmem_bytes_allocated, v51);
        (*(void (**)(uint64_t))(v44 + 40))(v44);
        free((void *)v44);
      }
      *(void *)(v42 + 408) = 0;
    }
    free(*(void **)(v41 + 880 * v39 + 768));
    bzero((void *)(v41 + 880 * v39), 0x370uLL);
    uint64_t v22 = a1;
    int v46 = *(_DWORD *)(a1 + 588);
    int v47 = v46 - 1;
    int v48 = v46 - 1 + v39;
    int v49 = v48 / v46;
    if (*(int *)(a1 + 16) <= 0)
    {
LABEL_32:
      *(_DWORD *)(v22 + 16) = a7[1];
      int v50 = v48 - v49 * v46;
      v915 = a2;
      if (!a2) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  else
  {
    int v46 = v23 + 1;
    *(_DWORD *)(v22 + 588) = v23 + 1;
    int v39 = v23;
    int v47 = v23;
    int v48 = 2 * v23;
    int v49 = 2 * (int)v23 / ((int)v23 + 1);
    if (*(int *)(v22 + 16) <= 0) {
      goto LABEL_32;
    }
  }
  int v50 = v48 - v49 * v46;
  v915 = a2;
  if (!a2)
  {
LABEL_34:
    if (v46 < 3)
    {
      double v940 = 1.0;
      _Q17 = 0uLL;
      double v63 = 1.0;
      double v64 = 0.0;
      float64x2_t v920 = 0u;
      int v912 = a3;
      if (!a2) {
        goto LABEL_72;
      }
      goto LABEL_69;
    }
    uint64_t v52 = *(void *)(v22 + 304);
    uint64_t v53 = (float64x2_t *)(v52 + 880 * v50);
    uint64_t v54 = (float64x2_t *)(v52 + 880 * ((v50 + v47) % v46));
    double v55 = v53[31].f64[1];
    double v911 = a9 - v55;
    double v56 = (a9 - v55) / (v55 - v54[31].f64[1]);
    if (*(_DWORD *)(v22 + 96))
    {
      memset(v959, 0, 64);
      timeval v957 = (timeval)0;
      long long v958 = 0u;
      g_coords_diff(v53->f64, v54->f64, (uint64_t)&v957);
      float v57 = v56;
      if (v57 != 1.0)
      {
        double v929 = v57;
        *(float64x2_t *)&v959[40] = vmulq_n_f64(*(float64x2_t *)&v959[40], v57);
        *(double *)&v959[56] = *(double *)&v959[56] * v57;
        g_log_so3((double *)&v967.tv_sec, (double *)&v957.tv_sec);
        timeval v967 = (timeval)vmulq_n_f64((float64x2_t)v967, v929);
        *(double *)v968 = *(double *)v968 * v929;
        g_exp_so3((double *)&v957.tv_sec, (double *)&v967.tv_sec);
      }
      double v58 = *(double *)&v959[40];
      *(_OWORD *)v930 = *(_OWORD *)&v959[48];
      if (fabs(*(double *)&v959[16]) >= 1.0)
      {
        if (*(double *)&v959[16] <= -1.0)
        {
          double v59 = atan2(*(long double *)&v957.tv_usec, *(long double *)&v958) + 0.0;
          float64x2_t v61 = (float64x2_t)xmmword_21BB7D270;
        }
        else
        {
          double v59 = atan2(-*(double *)&v957.tv_usec, -*(double *)&v958);
          float64x2_t v61 = (float64x2_t)xmmword_21BB7D280;
        }
        float64x2_t v60 = *(float64x2_t *)v930;
      }
      else
      {
        long double v919 = asin(-*(double *)&v959[16]);
        long double v905 = atan2(*((long double *)&v958 + 1), *(long double *)&v957.tv_sec);
        double v59 = atan2(*(long double *)&v959[24], *(long double *)&v959[32]);
        v61.f64[0] = v905;
        float64x2_t v60 = *(float64x2_t *)v930;
        v61.f64[1] = v919;
      }
    }
    else
    {
      float v67 = v56;
      double v68 = v67;
      double v58 = (v53[4].f64[1] - v54[4].f64[1]) * v68;
      float64x2_t v60 = vmulq_n_f64(vsubq_f64(v53[5], v54[5]), v68);
      float64x2_t v61 = 0uLL;
      double v59 = 0.0;
    }
    uint64_t v22 = a1;
    double v63 = v58 * *(float *)(a1 + 104);
    double v940 = v63;
    _Q17 = vmulq_f64(v60, vcvtq_f64_f32(*(float32x2_t *)(a1 + 108)));
    float64x2_t v920 = vmulq_f64(v61, vcvtq_f64_f32(*(float32x2_t *)(a1 + 116)));
    double v64 = v59 * *(float *)(a1 + 124);
    float v69 = *(float *)(a1 + 60);
    if (fabsf(v69) != INFINITY)
    {
      v70.i32[0] = *(_DWORD *)(a1 + 64);
      if (fabsf(v70.f32[0]) != INFINITY && fabsf(*(float *)(a1 + 68)) != INFINITY)
      {
        v71.i32[0] = *(_DWORD *)(a1 + 72);
        if (fabsf(v71.f32[0]) == INFINITY) {
          goto LABEL_68;
        }
        if (fabsf(*(float *)(a1 + 76)) != INFINITY)
        {
          float v72 = *(float *)(a1 + 80);
          if (fabsf(v72) != INFINITY && *(int *)(a1 + 588) >= 2)
          {
            v70.i32[1] = *(_DWORD *)(a1 + 68);
            float v73 = v911 * v69;
            float64x2_t v74 = vcvtq_f64_f32(v70);
            v71.i32[1] = *(_DWORD *)(a1 + 76);
            float64x2_t v75 = vcvtq_f64_f32(v71);
            float v76 = v911 * v72;
            float v77 = -v76;
            if (v63 <= (float)-v73) {
              double v63 = (float)-v73;
            }
            double v78 = v77;
            if (v64 > v77) {
              double v78 = v64;
            }
            double v79 = v73;
            if (v63 >= v79) {
              double v63 = v79;
            }
            double v940 = v63;
            float32x2_t v80 = vcvt_f32_f64(vmulq_n_f64(v74, v911));
            float64x2_t v81 = vcvtq_f64_f32(vneg_f32(v80));
            float64x2_t v82 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q17, v81), (int8x16_t)_Q17, (int8x16_t)v81);
            float64x2_t v83 = vcvtq_f64_f32(v80);
            _Q17 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v83, v82), (int8x16_t)v82, (int8x16_t)v83);
            *(float32x2_t *)&v83.f64[0] = vcvt_f32_f64(vmulq_n_f64(v75, v911));
            float64x2_t v84 = vcvtq_f64_f32(vneg_f32(*(float32x2_t *)&v83.f64[0]));
            float64x2_t v85 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v920, v84), (int8x16_t)v920, (int8x16_t)v84);
            float64x2_t v86 = vcvtq_f64_f32(*(float32x2_t *)&v83.f64[0]);
            float64x2_t v920 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v86, v85), (int8x16_t)v85, (int8x16_t)v86);
            if (v78 >= v76) {
              double v64 = v76;
            }
            else {
              double v64 = v78;
            }
            int v912 = 1;
            if (!a2) {
              goto LABEL_72;
            }
LABEL_69:
            if (*(_DWORD *)(v22 + 100))
            {
              _D2 = _Q17.f64[1];
              __asm { FMLA            D0, D2, V17.D[1] }
              double v91 = sqrt(_D0);
              if (v91 <= 0.0)
              {
                float64x2_t v92 = 0uLL;
                double v93 = 0.0;
              }
              else
              {
                float64x2_t v92 = vdivq_f64(_Q17, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v91, 0));
                double v93 = v63 / v91;
              }
              int v65 = 0;
              double v94 = sqrt(a2[1] * a2[1] + *a2 * *a2 + a2[2] * a2[2]);
              double v940 = v93 * v94;
              float64x2_t v906 = vmulq_n_f64(v92, v94);
              goto LABEL_75;
            }
LABEL_72:
            float64x2_t v906 = _Q17;
            int v65 = 0;
LABEL_75:
            uint64_t v66 = &v940;
            int v899 = 1;
            goto LABEL_76;
          }
LABEL_68:
          int v912 = 1;
          if (!a2) {
            goto LABEL_72;
          }
          goto LABEL_69;
        }
      }
    }
    int v912 = 1;
    if (!a2) {
      goto LABEL_72;
    }
    goto LABEL_69;
  }
LABEL_33:
  if (*(_DWORD *)(v22 + 92)) {
    goto LABEL_34;
  }
  int v912 = a3;
  int v899 = 0;
  float64x2_t v906 = 0u;
  int v65 = 1;
  double v64 = 0.0;
  uint64_t v66 = a2;
  float64x2_t v920 = 0u;
LABEL_76:
  int v902 = *(_DWORD *)(v22 + 16);
  uint64_t v95 = *(void *)(v22 + 304);
  int v931 = v39;
  uint64_t v96 = (timeval *)(v95 + 880 * v39);
  bzero(v96, 0x370uLL);
  timeval v97 = *(timeval *)(a4 + 16);
  v96[12] = *(timeval *)a4;
  v96[13] = v97;
  timeval v98 = *(timeval *)(a4 + 32);
  timeval v99 = *(timeval *)(a4 + 48);
  timeval v100 = *(timeval *)(a4 + 80);
  v96[16] = *(timeval *)(a4 + 64);
  v96[17] = v100;
  v96[14] = v98;
  v96[15] = v99;
  timeval v101 = *(timeval *)(a4 + 96);
  timeval v102 = *(timeval *)(a4 + 112);
  timeval v103 = *(timeval *)(a4 + 128);
  v96[21].__darwin_time_t tv_sec = *(void *)(a4 + 144);
  v96[19] = v102;
  v96[20] = v103;
  v96[18] = v101;
  if (*a7 && (v937 < 1 || v924 <= 0))
  {
    log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 539, (uint64_t)"init_cam", "Image dimensions must be given");
    __assert_rtn("init_cam", "slam_tracker_vo.c", 539, "0");
  }
  memset(v968, 0, 56);
  timeval v967 = (timeval)0;
  v957.__darwin_time_t tv_sec = 0;
  LODWORD(v957.tv_sec) = *(_DWORD *)a4;
  double v104 = *(double *)(a4 + 8);
  if ((v957.tv_sec & 0xFFFFFFFC) == 0xC)
  {
    double v105 = 1.0 / tan(v104 * 0.5);
    double v106 = *(double *)(a4 + 16);
    double v107 = v106 / v104;
    int v108 = v924;
  }
  else
  {
    long double v109 = tan(v104 * 0.5);
    int v108 = v924;
    double v106 = *(double *)(a4 + 16);
    double v105 = (double)v937 / (v109 + v109);
    long double v110 = tan(v106 * 0.5);
    double v107 = (double)v924 / (v110 + v110);
  }
  *(double *)&v957.tv_usec = v105;
  *(double *)&long long v958 = v107;
  *((double *)&v958 + 1) = v104;
  *(double *)v959 = v106;
  long long v960 = *(_OWORD *)(a4 + 88);
  long long v961 = *(_OWORD *)(a4 + 104);
  long long v962 = *(_OWORD *)(a4 + 120);
  long long v963 = *(_OWORD *)(a4 + 136);
  *(_OWORD *)&v959[40] = *(_OWORD *)(a4 + 56);
  *(_OWORD *)&v959[56] = *(_OWORD *)(a4 + 72);
  *(_OWORD *)&v959[8] = *(_OWORD *)(a4 + 24);
  *(_OWORD *)&v959[24] = *(_OWORD *)(a4 + 40);
  int v964 = v937;
  int v965 = v108;
  float64x2_t v111 = v906;
  if (v106 == 0.0) {
    *(void *)v959 = 0;
  }
  if (v104 == 0.0) {
    *((void *)&v958 + 1) = 0;
  }
  int v842 = v931;
  *((double *)&v968[3] + 1) = *v66;
  float64x2_t v112 = v915;
  if (v65)
  {
    float64x2_t v111 = *(float64x2_t *)(v915 + 1);
    float64x2_t v920 = *(float64x2_t *)(v915 + 3);
    double v64 = v915[5];
  }
  v968[4] = v111;
  __double2 v113 = __sincos_stret(v920.f64[0]);
  __double2 v114 = __sincos_stret(v920.f64[1]);
  __double2 v115 = __sincos_stret(v64);
  *(double *)&v967.__darwin_time_t tv_sec = v114.__cosval * v113.__cosval;
  *(double *)&v967.tv_usec = v114.__sinval * v113.__cosval * v115.__sinval - v113.__sinval * v115.__cosval;
  *(double *)v968 = v113.__sinval * v115.__sinval + v114.__sinval * v113.__cosval * v115.__cosval;
  *((double *)v968 + 1) = v114.__cosval * v113.__sinval;
  *(double *)&v968[1] = v113.__cosval * v115.__cosval + v114.__sinval * v113.__sinval * v115.__sinval;
  *((double *)&v968[1] + 1) = v114.__sinval * v113.__sinval * v115.__cosval - v113.__cosval * v115.__sinval;
  *(double *)&v968[2] = -v114.__sinval;
  *((double *)&v968[2] + 1) = v114.__cosval * v115.__sinval;
  *(double *)&v968[3] = v114.__cosval * v115.__cosval;
  int v116 = v912;
  if (v912)
  {
    if (v931 == v50)
    {
      int v117 = v931;
      float v118 = (void *)(v95 + 880 * v931);
      v118[22] = 0;
      v118[23] = 0;
      v118[12] = 0x3FF0000000000000;
      v118[13] = 0;
      v118[14] = 0;
      v118[15] = 0;
      v118[16] = 0x3FF0000000000000;
      v118[17] = 0;
      v118[18] = 0;
      v118[19] = 0;
      v118[20] = 0x3FF0000000000000;
      v118[21] = 0;
      timeval v119 = (timeval)*((_OWORD *)v118 + 7);
      *uint64_t v96 = *((timeval *)v118 + 6);
      v96[1] = v119;
      timeval v120 = (timeval)*((_OWORD *)v118 + 8);
      timeval v121 = (timeval)*((_OWORD *)v118 + 9);
      timeval v122 = (timeval)*((_OWORD *)v118 + 11);
      v96[4] = *((timeval *)v118 + 10);
      v96[5] = v122;
      v96[2] = v120;
      v96[3] = v121;
      goto LABEL_95;
    }
    int v117 = v931;
    g_coords_conv((double *)&v967.tv_sec, (double *)(v95 + 880 * v50 + 96), (double *)(v95 + 880 * v931 + 96));
  }
  else
  {
    uint64_t v123 = v95 + 880 * v931;
    timeval v124 = (timeval)v968[0];
    *uint64_t v96 = v967;
    v96[1] = v124;
    timeval v125 = (timeval)v968[1];
    timeval v126 = (timeval)v968[2];
    timeval v127 = (timeval)v968[4];
    v96[4] = (timeval)v968[3];
    v96[5] = v127;
    v96[2] = v125;
    v96[3] = v126;
    long long v128 = v968[2];
    long long v129 = v968[4];
    long long v130 = v968[1];
    *(_OWORD *)(v123 + 160) = v968[3];
    *(_OWORD *)(v123 + 176) = v129;
    *(_OWORD *)(v123 + 128) = v130;
    *(_OWORD *)(v123 + 144) = v128;
    long long v131 = v968[0];
    int v117 = v931;
    *(timeval *)(v123 + 96) = v967;
    *(_OWORD *)(v123 + 112) = v131;
    if (v931 == v50) {
      goto LABEL_95;
    }
    g_coords_diff((double *)(v123 + 96), (double *)(v95 + 880 * v50 + 96), (uint64_t)&v967);
  }
  g_coords_conv((double *)&v967.tv_sec, (double *)(v95 + 880 * v50), (double *)&v96->tv_sec);
LABEL_95:
  int v132 = v117;
  uint64_t v133 = v95 + 880 * v117;
  *(_DWORD *)(v133 + 520) = v899;
  *(_DWORD *)(v133 + 480) = v937;
  *(_DWORD *)(v133 + 484) = v924;
  *(void *)(v133 + 368) = malloc_type_malloc(8 * *a7, 0x100004000313F17uLL);
  *(void *)(v133 + 376) = malloc_type_malloc(8 * *a7, 0x100004000313F17uLL);
  *(void *)(v133 + 384) = malloc_type_malloc(*a7 * (uint64_t)v902, 0x86A3BDCuLL);
  memcpy(*(void **)(v133 + 368), *((const void **)a7 + 1), 8 * *a7);
  memcpy(*(void **)(v133 + 376), *((const void **)a7 + 1), 8 * *a7);
  memcpy(*(void **)(v133 + 384), *((const void **)a7 + 2), *a7 * (uint64_t)v902);
  uint64_t v134 = (const void *)*((void *)a7 + 3);
  if (v134)
  {
    size_t v135 = 4 * *a7;
    float v136 = malloc_type_malloc(v135, 0xD0C59E7EuLL);
    size_t v137 = v135;
    float64x2_t v112 = v915;
    memcpy(v136, v134, v137);
    *(void *)(v95 + 880 * v132 + 392) = v136;
  }
  uint64_t v138 = malloc_type_malloc(4 * *a7, 0x100004052888210uLL);
  *(void *)(v95 + 880 * v132 + 400) = v138;
  LODWORD(v139) = *a7;
  if (*a7 < 1)
  {
    uint64_t v141 = a8;
  }
  else
  {
    uint64_t v140 = 0;
    uint64_t v141 = a8;
    do
    {
      v138[v140++] = -1;
      uint64_t v139 = *a7;
    }
    while (v140 < v139);
  }
  uint64_t v142 = (float32x2_t **)(v133 + 368);
  int v143 = v931;
  uint64_t v144 = v95 + 880 * v931;
  *(_DWORD *)(v144 + 488) = v139;
  if (a15 && *(void *)a15)
  {
    uint64_t v145 = v95 + 880 * v931;
    uint64_t v146 = *(void *)(*(void *)a15 - 8 * *((void *)a15 + 2) - 8);
    atomic_fetch_add(&global_stats[1], 1uLL);
    atomic_fetch_or(&global_stats[2], 0);
    atomic_fetch_or(global_stats, 0);
    atomic_fetch_add(&pmem_total_refs, 1uLL);
    atomic_fetch_or(&_pmem_total_blocks, 0);
    atomic_fetch_or(&pmem_bytes_allocated, 0);
    atomic_fetch_add((atomic_uint *volatile)(v146 + 24), 1u);
    long long v147 = *a15;
    *(void *)(v145 + 424) = *((void *)a15 + 2);
    *(_OWORD *)(v145 + 408) = v147;
    long long v148 = *(long long *)((char *)a15 + 24);
    *(void *)(v145 + 448) = *((void *)a15 + 5);
    *(_OWORD *)(v145 + 432) = v148;
    long long v149 = a15[3];
    *(void *)(v145 + 472) = *((void *)a15 + 8);
    *(_OWORD *)(v145 + 456) = v149;
    LODWORD(v139) = *(_DWORD *)(v144 + 488);
  }
  uint64_t v150 = v95 + 880 * v931;
  rectify_pts((uint64_t)&v957, *v142, v139, (float *)(v150 + 344));
  *(double *)(v150 + 504) = a9;
  *(_DWORD *)(v150 + 492) = a14;
  *(float *)(v150 + 360) = (float)(*(float *)(v150 + 352) - *(float *)(v150 + 344)) / (float)v937;
  *(void *)(v150 + 744) = 0x7FF8000000000000;
  *(_DWORD *)(v150 + 524) = 2143289344;
  if (v141)
  {
    uint64_t v151 = *(void *)(a1 + 304);
    v957.__darwin_time_t tv_sec = 0;
    LODWORD(v957.tv_sec) = *(_DWORD *)a10;
    double v152 = *(double *)(a10 + 8);
    if ((v957.tv_sec & 0xFFFFFFFC) == 0xC)
    {
      double v153 = 1.0 / tan(v152 * 0.5);
      double v154 = *(double *)(a10 + 16);
      double v155 = v154 / v152;
    }
    else
    {
      long double v156 = tan(v152 * 0.5);
      double v154 = *(double *)(a10 + 16);
      double v153 = (double)a11 / (v156 + v156);
      long double v157 = tan(v154 * 0.5);
      double v155 = (double)a12 / (v157 + v157);
    }
    *(double *)&v957.tv_usec = v153;
    *(double *)&long long v958 = v155;
    *((double *)&v958 + 1) = v152;
    *(double *)v959 = v154;
    long long v960 = *(_OWORD *)(a10 + 88);
    long long v961 = *(_OWORD *)(a10 + 104);
    long long v962 = *(_OWORD *)(a10 + 120);
    long long v963 = *(_OWORD *)(a10 + 136);
    *(_OWORD *)&v959[40] = *(_OWORD *)(a10 + 56);
    *(_OWORD *)&v959[56] = *(_OWORD *)(a10 + 72);
    *(_OWORD *)&v959[8] = *(_OWORD *)(a10 + 24);
    *(_OWORD *)&v959[24] = *(_OWORD *)(a10 + 40);
    int v964 = a11;
    int v965 = a12;
    if (v154 == 0.0) {
      *(void *)v959 = 0;
    }
    int v143 = v931;
    if (v152 == 0.0) {
      *((void *)&v958 + 1) = 0;
    }
    uint64_t v158 = v151 + 880 * v931;
    *(void *)(v158 + 848) = *(void *)v141;
    *(void *)(v158 + 856) = *(void *)(v141 + 8);
    *(void *)(v158 + 864) = *(void *)(v141 + 16);
    double v159 = *(double *)(v141 + 32);
    double v160 = *(double *)(v141 + 40);
    __double2 v161 = __sincos_stret(*(double *)(v141 + 24));
    __double2 v162 = __sincos_stret(v159);
    __double2 v163 = __sincos_stret(v160);
    *(double *)(v158 + 776) = v161.__cosval * v162.__cosval;
    *(double *)(v158 + 784) = v161.__cosval * v162.__sinval * v163.__sinval - v161.__sinval * v163.__cosval;
    *(double *)(v158 + 792) = v161.__sinval * v163.__sinval + v161.__cosval * v162.__sinval * v163.__cosval;
    *(double *)(v158 + 800) = v161.__sinval * v162.__cosval;
    *(double *)(v158 + 808) = v161.__cosval * v163.__cosval + v161.__sinval * v162.__sinval * v163.__sinval;
    *(double *)(v158 + 816) = v161.__sinval * v162.__sinval * v163.__cosval - v161.__cosval * v163.__sinval;
    *(double *)(v158 + 824) = -v162.__sinval;
    *(double *)(v158 + 832) = v162.__cosval * v163.__sinval;
    *(double *)(v158 + 840) = v162.__cosval * v163.__cosval;
    float v164 = malloc_type_malloc(8 * *(int *)(v158 + 488), 0x100004000313F17uLL);
    *(void *)(v158 + 768) = v164;
    memcpy(v164, a13, 8 * *(int *)(v158 + 488));
    rectify_pts((uint64_t)&v957, *(float32x2_t **)(v158 + 768), *(_DWORD *)(v158 + 488), (float *)&v967);
    int v116 = v912;
  }
  uint64_t v841 = *(void *)(a1 + 304);
  *(_DWORD *)(v841 + 880 * v143 + 496) = v931;
  *(_DWORD *)(a1 + 592) = v931;
  if (*(int *)(a1 + 588) >= 2 && (*(unsigned char *)(a1 + 132) & 0x10) != 0) {
    __assert_rtn("slam_tracker_vo_add", "slam_tracker_vo.c", 2505, "0");
  }
  if (!v116) {
    float64x2_t v112 = 0;
  }
  *(void *)&v957.tv_usec = 0;
  v957.__darwin_time_t tv_sec = 0;
  if (gettimeofday(&v957, 0) || (double)(v957.tv_usec + 1000000 * v957.tv_sec) / 1000000.0 <= 1514764800.0) {
    goto LABEL_700;
  }
  uint64_t v165 = *(void *)(a1 + 304);
  int v843 = *(_DWORD *)(a1 + 592);
  uint64_t v166 = v165 + 880 * v843;
  long long v945 = 0u;
  memset(v946, 0, 112);
  float v167 = (int *)(v166 + 488);
  v876 = malloc_type_malloc(4 * *(int *)(v166 + 488), 0x100004052888210uLL);
  ids = plq_create_ids(*(void **)(v166 + 368), *(unsigned int *)(v166 + 488));
  v938 = malloc_type_malloc(*(void *)(a1 + 312), 0xB7634210uLL);
  uint64_t v168 = *(unsigned int *)(v166 + 488);
  if ((int)v168 <= 0)
  {
    uint64_t v173 = (int)v168;
    *(void *)&long long v945 = (int)v168;
    *((void *)&v946[2] + 1) = (int)v168;
    int v170 = v168;
    *((void *)&v946[0] + 1) = (int)v168;
    *(void *)&v946[4] = (int)v168;
    uint64_t v178 = (float32x2_t *)a1;
    if ((int)v168 < 1) {
      goto LABEL_150;
    }
    goto LABEL_146;
  }
  if (*(unsigned int *)(v166 + 488) <= 0xAuLL) {
    uint64_t v169 = 10;
  }
  else {
    uint64_t v169 = *(unsigned int *)(v166 + 488);
  }
  *((void *)&v945 + 1) = malloc_type_realloc(0, 24 * v169, 0x2142F1D7uLL);
  *(void *)&v946[0] = v169;
  bzero(*((void **)&v945 + 1), 24 * v168);
  int v170 = *v167;
  uint64_t v171 = *v167;
  *(void *)&long long v945 = v171;
  if (v170 <= 0)
  {
    *((void *)&v946[2] + 1) = v170;
    *((void *)&v946[0] + 1) = v170;
    goto LABEL_144;
  }
  if (v170 <= 21) {
    uint64_t v172 = 21;
  }
  else {
    uint64_t v172 = v170;
  }
  *(void *)&v946[3] = malloc_type_realloc(0, 12 * v172, 0x6B88BC02uLL);
  *((void *)&v946[3] + 1) = v172;
  bzero(*(void **)&v946[3], 12 * v171);
  int v170 = *v167;
  uint64_t v173 = *v167;
  *((void *)&v946[2] + 1) = v173;
  if (v170 <= 0)
  {
    *((void *)&v946[0] + 1) = v170;
    *(void *)&v946[4] = v170;
    uint64_t v178 = (float32x2_t *)a1;
    if (v170 < 1) {
      goto LABEL_150;
    }
    goto LABEL_146;
  }
  if (v170 <= 64) {
    uint64_t v174 = 64;
  }
  else {
    uint64_t v174 = v170;
  }
  *(void *)&v946[1] = malloc_type_realloc(0, 4 * v174, 0x221EED95uLL);
  *((void *)&v946[1] + 1) = v174;
  bzero(*(void **)&v946[1], 4 * v173);
  int v170 = *v167;
  uint64_t v171 = *v167;
  *((void *)&v946[0] + 1) = v171;
  if (v170 <= 0)
  {
LABEL_144:
    *(void *)&v946[4] = v171;
    uint64_t v178 = (float32x2_t *)a1;
    goto LABEL_150;
  }
  if (v170 <= 64) {
    uint64_t v175 = 64;
  }
  else {
    uint64_t v175 = v170;
  }
  float v176 = malloc_type_realloc(0, 4 * v175, 0xC84F66E0uLL);
  *((void *)&v946[4] + 1) = v176;
  *(void *)&v946[5] = v175;
  bzero(v176, 4 * v171);
  int v170 = *v167;
  uint64_t v173 = *v167;
  *(void *)&v946[4] = v173;
  if (v170 < 1)
  {
    uint64_t v178 = (float32x2_t *)a1;
    if (v170 < 1) {
      goto LABEL_150;
    }
  }
  else
  {
    uint64_t v177 = 0;
    uint64_t v178 = (float32x2_t *)a1;
    do
    {
      *((_DWORD *)v176 + v177++) = -1;
      uint64_t v173 = *v167;
    }
    while (v177 < v173);
    int v170 = *v167;
    if (*v167 < 1) {
      goto LABEL_150;
    }
  }
LABEL_146:
  if (v173 <= 64) {
    uint64_t v179 = 64;
  }
  else {
    uint64_t v179 = v173;
  }
  *(void *)&v946[6] = malloc_type_realloc(0, 4 * v179, 0x5F09FB56uLL);
  *((void *)&v946[6] + 1) = v179;
  bzero(*(void **)&v946[6], 4 * v173);
  uint64_t v178 = (float32x2_t *)a1;
  int v170 = *v167;
LABEL_150:
  *((void *)&v946[5] + 1) = v170;
  int v180 = v178[73].i32[1];
  if (v180 >= 2)
  {
    int v181 = v180 - 1;
    uint64_t v182 = v876;
    do
    {
      if (*(_DWORD *)(*(void *)&v178[38] + 880 * ((v178[74].i32[0] + v181) % v180) + 488))
      {
        int v183 = (v843 + v181) % v180;
        v859 = (int *)(v166 + 488);
        if (v183 == v843) {
          goto LABEL_228;
        }
        goto LABEL_159;
      }
      --v181;
    }
    while (v181);
    int v183 = 0;
    v859 = (int *)(v166 + 488);
    if (!v843) {
      goto LABEL_228;
    }
    goto LABEL_159;
  }
  int v183 = 0;
  uint64_t v182 = v876;
  v859 = (int *)(v166 + 488);
  if (v843)
  {
LABEL_159:
    float32x2_t v184 = v178[38];
    int v185 = v183;
    uint64_t v186 = *(void *)&v184 + 880 * v183;
    LODWORD(v187) = *(_DWORD *)(v186 + 488);
    if ((int)v187 <= 0)
    {
      if ((int)v187 <= v170) {
        LODWORD(v187) = v170;
      }
      float v238 = 0.0;
      goto LABEL_224;
    }
    v916 = v112;
    uint64_t v921 = v165;
    unint64_t v189 = v178[2].u32[0];
    int v188 = v178[2].i32[1];
    float v190 = *(float *)(v165 + 880 * v843 + 360) * 0.1;
    uint64_t v191 = (int *)(v186 + 488);
    uint64_t v192 = *(void *)&v184 + 880 * v185;
    uint64_t v193 = (void *)(v192 + 368);
    v932 = (uint64_t *)(v192 + 384);
    v925 = (uint64_t *)(v165 + 880 * v843 + 384);
    float32x2_t v910 = v178[38];
    int v913 = v185;
    if ((v189 & 0xF) != 0)
    {
      uint64_t v194 = (uint64_t)ids;
      if ((int)v189 < 1)
      {
        uint64_t v248 = 0;
        uint64_t v249 = 0;
        int v197 = 0;
        float v250 = v190 * v190;
        do
        {
          if (v194)
          {
            uint64_t v253 = (float *)(*v193 + v248);
            *(void *)&v957.tv_usec = 0;
            v957.__darwin_time_t tv_sec = 0;
            *(void *)&long long v958 = 0;
            *(float *)&v967.__darwin_time_t tv_sec = v250;
            plq_inside_circle_helper(v194, v253, (float *)&v967, (uint64_t)&v957, 1);
            if (v957.tv_sec == 1)
            {
              uint64_t v254 = *(void **)&v957.tv_usec;
              int v251 = **(_DWORD **)&v957.tv_usec;
            }
            else
            {
              if (v957.tv_sec) {
                goto LABEL_722;
              }
              int v251 = -1;
              uint64_t v254 = *(void **)&v957.tv_usec;
            }
            free(v254);
            LODWORD(v187) = *v191;
            uint64_t v178 = (float32x2_t *)a1;
            uint64_t v194 = (uint64_t)ids;
          }
          else
          {
            int v251 = -1;
          }
          _ZF = v188 < 0 || v251 == -1;
          if (!_ZF) {
            ++v197;
          }
          ++v249;
          v248 += 8;
          float v167 = v859;
        }
        while (v249 < (int)v187);
        goto LABEL_219;
      }
      if (ids)
      {
        uint64_t v195 = 0;
        uint64_t v196 = 0;
        int v197 = 0;
        float v198 = v190 * v190;
        uint64_t v199 = 16;
        while (1)
        {
          uint64_t v200 = (float *)(*v193 + 8 * v196);
          *(void *)&v957.tv_usec = 0;
          v957.__darwin_time_t tv_sec = 0;
          *(void *)&long long v958 = 0;
          *(float *)&v967.__darwin_time_t tv_sec = v198;
          plq_inside_circle_helper(v194, v200, (float *)&v967, (uint64_t)&v957, 1);
          if (v957.tv_sec == 1)
          {
            int v201 = **(_DWORD **)&v957.tv_usec;
            free(*(void **)&v957.tv_usec);
            if (v201 != -1)
            {
              uint64_t v202 = *v932;
              uint64_t v203 = *v925;
              uint64_t v204 = v201 * (int)v189;
              uint64_t v178 = (float32x2_t *)a1;
              if (v189 < 8)
              {
                uint64_t v205 = 0;
                int v206 = 0;
                goto LABEL_181;
              }
              if (v189 >= 0x20)
              {
                int32x4_t v208 = 0uLL;
                uint64_t v209 = (uint8x8_t *)(v202 + v199);
                int32x4_t v210 = 0uLL;
                float v211 = (uint8x8_t *)(v203 + v204 + 16);
                uint64_t v212 = v189 & 0xFFFFFFE0;
                int32x4_t v213 = 0uLL;
                int32x4_t v214 = 0uLL;
                int32x4_t v215 = 0uLL;
                int32x4_t v216 = 0uLL;
                int32x4_t v217 = 0uLL;
                int32x4_t v218 = 0uLL;
                do
                {
                  uint8x16_t v219 = *(uint8x16_t *)v209[-2].i8;
                  uint8x16_t v220 = *(uint8x16_t *)v211[-2].i8;
                  int16x8_t v221 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v219.i8, *(uint8x8_t *)v220.i8);
                  int16x8_t v222 = (int16x8_t)vsubl_high_u8(v219, v220);
                  int16x8_t v223 = (int16x8_t)vsubl_u8(*v209, *v211);
                  int16x8_t v224 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v209->i8, *(uint8x16_t *)v211->i8);
                  int32x4_t v214 = vmlal_high_s16(v214, v222, v222);
                  int32x4_t v213 = vmlal_s16(v213, *(int16x4_t *)v222.i8, *(int16x4_t *)v222.i8);
                  int32x4_t v210 = vmlal_high_s16(v210, v221, v221);
                  int32x4_t v208 = vmlal_s16(v208, *(int16x4_t *)v221.i8, *(int16x4_t *)v221.i8);
                  int32x4_t v218 = vmlal_high_s16(v218, v224, v224);
                  int32x4_t v217 = vmlal_s16(v217, *(int16x4_t *)v224.i8, *(int16x4_t *)v224.i8);
                  int32x4_t v216 = vmlal_high_s16(v216, v223, v223);
                  int32x4_t v215 = vmlal_s16(v215, *(int16x4_t *)v223.i8, *(int16x4_t *)v223.i8);
                  v209 += 4;
                  v211 += 4;
                  v212 -= 32;
                }
                while (v212);
                int v206 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v215, v208), vaddq_s32(v217, v213)), vaddq_s32(vaddq_s32(v216, v210), vaddq_s32(v218, v214))));
                uint64_t v205 = v189 & 0xFFFFFFE0;
                if (v205 != v189)
                {
                  uint64_t v207 = v189 & 0xFFFFFFE0;
                  if ((v189 & 0x18) == 0) {
                    goto LABEL_181;
                  }
                  goto LABEL_178;
                }
              }
              else
              {
                int v206 = 0;
                uint64_t v207 = 0;
LABEL_178:
                int32x4_t v225 = (int32x4_t)v206;
                int32x4_t v226 = 0uLL;
                int v227 = (uint8x8_t *)(v202 + v207 + v195);
                int v228 = (uint8x8_t *)(v203 + v207 + v204);
                uint64_t v229 = v207 - (v189 & 0xFFFFFFF8);
                do
                {
                  uint8x8_t v230 = *v227++;
                  uint8x8_t v231 = v230;
                  uint8x8_t v232 = *v228++;
                  int16x8_t v233 = (int16x8_t)vsubl_u8(v231, v232);
                  int32x4_t v226 = vmlal_high_s16(v226, v233, v233);
                  int32x4_t v225 = vmlal_s16(v225, *(int16x4_t *)v233.i8, *(int16x4_t *)v233.i8);
                  v229 += 8;
                }
                while (v229);
                int v206 = vaddvq_s32(vaddq_s32(v225, v226));
                uint64_t v205 = v189 & 0xFFFFFFF8;
                if (v205 != v189)
                {
LABEL_181:
                  uint64_t v234 = v189 - v205;
                  uint64_t v235 = (unsigned __int8 *)(v203 + v205 + v204);
                  uint64_t v236 = v202 + v205;
                  do
                  {
                    int v237 = *v235++;
                    v206 += (*(unsigned __int8 *)(v236 + v195) - v237) * (*(unsigned __int8 *)(v236 + v195) - v237);
                    ++v236;
                    --v234;
                  }
                  while (v234);
                }
              }
              if (v206 <= v188) {
                ++v197;
              }
              goto LABEL_167;
            }
          }
          else
          {
            if (v957.tv_sec) {
              goto LABEL_722;
            }
            free(*(void **)&v957.tv_usec);
          }
          uint64_t v178 = (float32x2_t *)a1;
LABEL_167:
          ++v196;
          uint64_t v187 = *v191;
          v199 += v189;
          v195 += v189;
          uint64_t v194 = (uint64_t)ids;
          if (v196 >= v187)
          {
            float v167 = v859;
            goto LABEL_219;
          }
        }
      }
LABEL_218:
      int v197 = 0;
LABEL_219:
      if ((int)v187 <= *v167) {
        LODWORD(v187) = *v167;
      }
      float v238 = (float)v197;
      if (v197 <= 99) {
        float v238 = 0.0;
      }
      uint64_t v182 = v876;
      float64x2_t v112 = v916;
      uint64_t v165 = v921;
      float32x2_t v184 = v910;
      int v185 = v913;
LABEL_224:
      float v255 = (float)(*(float *)(*(void *)&v184 + 880 * v185 + 512) * 0.5)
           + (float)((float)(v238 / (float)(int)v187) * 0.5);
      uint64_t v256 = v165 + 880 * v843;
      *(float *)(v256 + 512) = v255;
      if (v112)
      {
        uint64_t v257 = (float *)(v256 + 512);
        double v258 = v112[1];
        double v260 = v112[2];
        double v259 = v112[3];
        double v261 = v112[4];
        double v262 = v112[5];
        float v263 = sqrt(v258 * v258 + *v112 * *v112 + v260 * v260);
        *(double *)&v959[40] = *v112;
        *(double *)&v959[48] = v258;
        *(double *)&v959[56] = v260;
        __double2 v264 = __sincos_stret(v259);
        __double2 v265 = __sincos_stret(v261);
        __double2 v266 = __sincos_stret(v262);
        *(double *)&v957.__darwin_time_t tv_sec = v264.__cosval * v265.__cosval;
        *(double *)&v957.tv_usec = v264.__cosval * v265.__sinval * v266.__sinval - v264.__sinval * v266.__cosval;
        *(double *)&long long v958 = v264.__sinval * v266.__sinval + v264.__cosval * v265.__sinval * v266.__cosval;
        *((double *)&v958 + 1) = v264.__sinval * v265.__cosval;
        *(double *)v959 = v264.__cosval * v266.__cosval + v264.__sinval * v265.__sinval * v266.__sinval;
        *(double *)&v959[8] = v264.__sinval * v265.__sinval * v266.__cosval - v264.__cosval * v266.__sinval;
        *(double *)&v959[16] = -v265.__sinval;
        *(double *)&v959[24] = v265.__cosval * v266.__sinval;
        *(double *)&v959[32] = v265.__cosval * v266.__cosval;
        double v267 = g_log_so3((double *)&v967.tv_sec, (double *)&v957.tv_sec);
        uint64_t v178 = (float32x2_t *)a1;
        float v268 = v267;
        float v255 = *v257;
        uint64_t v182 = v876;
        if ((float)(*(float *)(a1 + 284)
                   + (float)((float)((float)(*(float *)(a1 + 276) * v268) + (float)(*(float *)(a1 + 272) * v263))
                           + (float)(*(float *)(a1 + 280) * v255))) > 0.0)
          goto LABEL_227;
      }
      if (v255 >= v178[33].f32[0])
      {
LABEL_227:
        uint64_t v269 = (_OWORD *)(*(void *)&v178[38] + 880 * v185);
        long long v270 = v269[1];
        *(_OWORD *)uint64_t v166 = *v269;
        *(_OWORD *)(v166 + 16) = v270;
        long long v271 = v269[2];
        long long v272 = v269[3];
        long long v273 = v269[5];
        *(_OWORD *)(v166 + 64) = v269[4];
        *(_OWORD *)(v166 + 80) = v273;
        *(_OWORD *)(v166 + 32) = v271;
        *(_OWORD *)(v166 + 48) = v272;
        uint64_t v274 = v165 + 880 * v843;
        float v275 = (_OWORD *)(*(void *)&v178[38] + 880 * v185);
        long long v276 = v275[7];
        *(_OWORD *)(v274 + 96) = v275[6];
        *(_OWORD *)(v274 + 112) = v276;
        long long v277 = v275[8];
        long long v278 = v275[9];
        long long v279 = v275[11];
        *(_OWORD *)(v274 + 160) = v275[10];
        *(_OWORD *)(v274 + 176) = v279;
        *(_OWORD *)(v274 + 128) = v277;
        *(_OWORD *)(v274 + 144) = v278;
        *(_DWORD *)(v274 + 516) = 1;
        log_msg(3, 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1872, (uint64_t)"spawn", "Stop detected from kpts: %f static points", v255);
        uint64_t v178 = (float32x2_t *)a1;
      }
      goto LABEL_228;
    }
    uint64_t v239 = (uint64_t)ids;
    if ((int)v189 < 1)
    {
      uint64_t v834 = 0;
      uint64_t v835 = 0;
      int v197 = 0;
      float v836 = v190 * v190;
      do
      {
        if (v239)
        {
          v839 = (float *)(*v193 + v834);
          *(void *)&v957.tv_usec = 0;
          v957.__darwin_time_t tv_sec = 0;
          *(void *)&long long v958 = 0;
          *(float *)&v967.__darwin_time_t tv_sec = v836;
          plq_inside_circle_helper(v239, v839, (float *)&v967, (uint64_t)&v957, 1);
          if (v957.tv_sec == 1)
          {
            v840 = *(void **)&v957.tv_usec;
            int v837 = **(_DWORD **)&v957.tv_usec;
          }
          else
          {
            if (v957.tv_sec)
            {
LABEL_722:
              log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/core/containers/plq.c", 600, (uint64_t)"plq_nn", "The size here should be exactly 1.");
              __assert_rtn("plq_nn", "plq.c", 600, "0");
            }
            int v837 = -1;
            v840 = *(void **)&v957.tv_usec;
          }
          free(v840);
          LODWORD(v187) = *v191;
          uint64_t v178 = (float32x2_t *)a1;
          uint64_t v239 = (uint64_t)ids;
        }
        else
        {
          int v837 = -1;
        }
        if (v188 >= 0 && v837 != -1) {
          ++v197;
        }
        ++v835;
        v834 += 8;
        float v167 = v859;
      }
      while (v835 < (int)v187);
      goto LABEL_219;
    }
    if (!ids) {
      goto LABEL_218;
    }
    uint64_t v240 = 0;
    uint64_t v241 = 0;
    int v197 = 0;
    float v242 = v190 * v190;
    while (1)
    {
      while (1)
      {
        int v243 = (float *)(*v193 + 8 * v241);
        *(void *)&v957.tv_usec = 0;
        v957.__darwin_time_t tv_sec = 0;
        *(void *)&long long v958 = 0;
        *(float *)&v967.__darwin_time_t tv_sec = v242;
        plq_inside_circle_helper(v239, v243, (float *)&v967, (uint64_t)&v957, 1);
        if (v957.tv_sec == 1) {
          break;
        }
        if (v957.tv_sec) {
          goto LABEL_722;
        }
        free(*(void **)&v957.tv_usec);
LABEL_194:
        uint64_t v178 = (float32x2_t *)a1;
        ++v241;
        uint64_t v187 = *v191;
        v240 += v189;
        uint64_t v239 = (uint64_t)ids;
        if (v241 >= v187) {
          goto LABEL_219;
        }
      }
      int v244 = **(_DWORD **)&v957.tv_usec;
      free(*(void **)&v957.tv_usec);
      if (v244 == -1) {
        goto LABEL_194;
      }
      unint64_t v245 = 0;
      int v246 = 0;
      uint64_t v178 = (float32x2_t *)a1;
      do
      {
        uint8x16_t v247 = vabdq_u8(*(uint8x16_t *)(*v932 + v240 + v245), *(uint8x16_t *)(*v925 + v244 * (int)v189 + v245));
        v246 += vaddlvq_u16(vqaddq_u16(vmull_u8(*(uint8x8_t *)v247.i8, *(uint8x8_t *)v247.i8), vmull_high_u8(v247, v247)));
        v245 += 16;
      }
      while (v245 < v189);
      if (v246 <= v188) {
        ++v197;
      }
      ++v241;
      uint64_t v187 = *v191;
      v240 += v189;
      uint64_t v239 = (uint64_t)ids;
      if (v241 >= v187) {
        goto LABEL_219;
      }
    }
  }
LABEL_228:
  uint64_t v280 = v165 + 880 * v843;
  int v281 = *(_DWORD *)(v280 + 516);
  if (v281) {
    int v282 = v178[119].i32[0] + 1;
  }
  else {
    int v282 = 0;
  }
  int v283 = 0;
  v852 = (uint64_t *)&v178[39];
  v853 = (int *)(v280 + 516);
  v178[119].i32[0] = v282;
  uint64_t v284 = v165 + 880 * v843;
  v888 = (float *)(v284 + 360);
  v897 = (uint64_t *)(v284 + 400);
  float32x4_t v285 = (float *)(v284 + 344);
  v907 = (float *)(v284 + 352);
  v903 = (float *)(v284 + 356);
  v900 = (float *)(v284 + 348);
  v885 = (float *)(v284 + 344);
  v880 = (uint64_t *)(v284 + 384);
  float v286 = 1.0;
  __asm { FMOV            V12.2S, #1.0 }
  while (1)
  {
    if (v281)
    {
      if (v283 >= 1) {
        goto LABEL_449;
      }
    }
    else if (v283 >= v178[6].i32[1])
    {
      goto LABEL_449;
    }
    _ZF = (v283 | v281) == 0;
    uint64_t v288 = 10;
    if (_ZF) {
      uint64_t v288 = 9;
    }
    float v289 = v178->f32[v288];
    float v290 = *v888;
    uint64_t v291 = v945;
    if ((uint64_t)v945 >= 1)
    {
      uint64_t v292 = *((void *)&v945 + 1);
      if ((void)v945 == 1)
      {
        unint64_t v293 = 0;
LABEL_245:
        uint64_t v296 = v291 - v293;
        float32x4_t v297 = (void *)(v292 + 24 * v293);
        do
        {
          *float32x4_t v297 = 0;
          v297 += 3;
          --v296;
        }
        while (v296);
        goto LABEL_247;
      }
      unint64_t v293 = v945 & 0xFFFFFFFFFFFFFFFELL;
      unint64_t v294 = v945 & 0xFFFFFFFFFFFFFFFELL;
      int8x8_t v295 = (void *)*((void *)&v945 + 1);
      do
      {
        *int8x8_t v295 = 0;
        v295[3] = 0;
        v295 += 6;
        v294 -= 2;
      }
      while (v294);
      if (v291 != v293) {
        goto LABEL_245;
      }
    }
LABEL_247:
    if (*v167 >= 1)
    {
      uint64_t v298 = 0;
      uint64_t v299 = *v897;
      do
      {
        *(_DWORD *)(v299 + 4 * v298++) = -1;
        uint64_t v300 = *v167;
      }
      while (v298 < v300);
      if ((int)v300 >= 1)
      {
        uint64_t v301 = 0;
        do
          v182[v301++] = v178[2].i32[1];
        while (v301 < *v167);
      }
    }
    int v858 = v283;
    float v302 = v289 * v290;
    LODWORD(v946[2]) = v178[45].i32[0];
    bzero(v938, *(void *)&v178[39]);
    uint64_t v178 = (float32x2_t *)a1;
    int v303 = *(_DWORD *)(a1 + 588);
    float v882 = v302;
    float v875 = v302 * v302;
    if (v303 > 1)
    {
      int v933 = 1;
      while (1)
      {
        __int32 v304 = v178[74].i32[0];
        float32x2_t v305 = v178[38];
        unint64_t v307 = v178[2].u32[0];
        __int32 v306 = v178[2].i32[1];
        float v308 = v178[5].f32[1];
        float32x2_t v922 = v178[3];
        float v309 = v178[4].f32[0];
        float v310 = v178[7].f32[0];
        v948 = malloc_type_malloc(0x100uLL, 0x100004052888210uLL);
        v947 = 0;
        uint64_t v949 = 64;
        *(void *)&v967.tv_usec = 0;
        v967.__darwin_time_t tv_sec = 0;
        if (gettimeofday(&v967, 0) || (double)(v967.tv_usec + 1000000 * v967.tv_sec) / 1000000.0 <= 1514764800.0) {
          goto LABEL_700;
        }
        v954.f64[1] = 0.0;
        long double v955 = 0.0;
        double v956 = 0.0;
        double v311 = (float)(v286 / (float)(*v907 - *v285));
        double v312 = (float)(v286 / (float)(*v903 - *v900));
        timeval v967 = (timeval)0;
        memset(v968, 0, 136);
        LODWORD(v967.tv_sec) = 4;
        long double v313 = atan(1.0 / (v311 + v311));
        *(double *)&v967.tv_usec = v313 + v313;
        long double v314 = atan(1.0 / (v312 + v312));
        *(double *)v968 = v314 + v314;
        float64x2_t v953 = *(float64x2_t *)(v166 + 72);
        v954.f64[0] = *(float64_t *)(v166 + 88);
        double v315 = *(double *)(v166 + 48);
        if (fabs(v315) < 1.0) {
          break;
        }
        v954.f64[1] = 0.0;
        if (*(double *)(v166 + 48) > -1.0)
        {
          long double v955 = -1.57079633;
          double v316 = -*(double *)(v166 + 8);
          double v317 = -*(double *)(v166 + 16);
          goto LABEL_261;
        }
        long double v955 = 1.57079633;
        double v318 = atan2(*(long double *)(v166 + 8), *(long double *)(v166 + 16)) + 0.0;
LABEL_263:
        double v956 = v318;
        g_frustum_from_camera((double *)&v957.tv_sec, &v953, (uint64_t)&v967, v922.f32[0], v922.f32[1]);
        if (v922.f32[0] > v309) {
          float v309 = v922.f32[0];
        }
        v954.f64[1] = 0.0;
        long double v955 = 0.0;
        double v956 = 0.0;
        double v319 = (float)(v286 / (float)(*v907 - *v285));
        double v320 = (float)(v286 / (float)(*v903 - *v900));
        timeval v967 = (timeval)0;
        memset(v968, 0, 136);
        LODWORD(v967.tv_sec) = 4;
        long double v321 = atan(1.0 / (v319 + v319));
        *(double *)&v967.tv_usec = v321 + v321;
        long double v322 = atan(1.0 / (v320 + v320));
        *(double *)v968 = v322 + v322;
        float64x2_t v953 = *(float64x2_t *)(v166 + 72);
        v954.f64[0] = *(float64_t *)(v166 + 88);
        double v323 = *(double *)(v166 + 48);
        if (fabs(v323) < 1.0)
        {
          long double v955 = asin(-v323);
          v954.f64[1] = atan2(*(long double *)(v166 + 24), *(long double *)v166);
          double v324 = *(double *)(v166 + 56);
          double v325 = *(double *)(v166 + 64);
LABEL_269:
          double v326 = atan2(v324, v325);
          goto LABEL_271;
        }
        v954.f64[1] = 0.0;
        if (*(double *)(v166 + 48) > -1.0)
        {
          long double v955 = -1.57079633;
          double v324 = -*(double *)(v166 + 8);
          double v325 = -*(double *)(v166 + 16);
          goto LABEL_269;
        }
        long double v955 = 1.57079633;
        double v326 = atan2(*(long double *)(v166 + 8), *(long double *)(v166 + 16)) + 0.0;
LABEL_271:
        float v286 = 1.0;
        int v327 = (v303 - v933 + v304) % v303;
        __int16 v328 = v327;
        double v956 = v326;
        g_frustum_from_camera(&v966, &v953, (uint64_t)&v967, v309, v922.f32[1]);
        uint64_t v329 = *(void *)&v305 + 880 * v327;
        if (*(int *)(v329 + 488) >= 1)
        {
          uint64_t v330 = 0;
          uint64_t v331 = 0;
          __int32 v332 = v306;
          uint64_t v333 = *(void *)&v305 + 880 * v327;
          unint64_t v334 = (int *)(v329 + 488);
          int v891 = 10 * v332;
          uint64_t v335 = (uint64_t *)(v333 + 400);
          int8x8_t v926 = (int8x8_t)vdiv_f32(_D12, v922);
          v917 = (void *)(v333 + 392);
          int v878 = v328 & 0x7FFF;
          uint64_t v336 = 16;
          do
          {
            uint64_t v337 = *(void *)(v333 + 368);
            *(void *)&v967.tv_usec = 0;
            v967.__darwin_time_t tv_sec = 0;
            *(void *)&v968[0] = 0;
            float64x2_t v953 = 0uLL;
            v954.f64[0] = 0.0;
            double v950 = 0.0;
            double v944 = 0.0;
            uint64_t v338 = *(int *)(*v335 + 4 * v331);
            if (v338 == -1)
            {
              if (v933 != 1) {
                goto LABEL_274;
              }
              if (*v917)
              {
                float v421 = 1.0 / *(float *)(*v917 + 4 * v331);
                v422.i32[1] = v926.i32[1];
                v422.f32[0] = v310 + v421;
                v423.i32[0] = v926.i32[0];
                v423.f32[1] = v421 - v310;
                int8x8_t v424 = (int8x8_t)vcgt_f32(v423, v422);
                v423.i32[0] = v422.i32[0];
                float32x2_t v347 = vdiv_f32(_D12, (float32x2_t)vbsl_s8(v424, (int8x8_t)v423, v926));
                int v340 = -1;
              }
              else
              {
                int v340 = -1;
                float32x2_t v347 = v922;
              }
              uint64_t v339 = a1;
              uint64_t v348 = *(void *)(a1 + 960);
              float v349 = *(float *)(v337 + 8 * v331);
              float v350 = *(float *)(v337 + 8 * v331 + 4);
              if (v348) {
                goto LABEL_278;
              }
            }
            else
            {
              if (*((unsigned char *)v938 + v338)) {
                goto LABEL_274;
              }
              uint64_t v339 = a1;
              *((unsigned char *)v938 + v338) = 1;
              int v340 = *(_DWORD *)(*v335 + 4 * v331);
              unint64_t v341 = (float *)(*(void *)(a1 + 376) + 12 * v340);
              float v342 = *(double *)(v333 + 24) * (v341[1] - *(double *)(v333 + 80))
                   + *(double *)v333 * (*v341 - *(double *)(v333 + 72))
                   + *(double *)(v333 + 48) * (v341[2] - *(double *)(v333 + 88));
              float v343 = 1.0 / v342;
              v344.i32[1] = v926.i32[1];
              v344.f32[0] = v310 + v343;
              v345.i32[0] = v926.i32[0];
              v345.f32[1] = v343 - v310;
              int8x8_t v346 = (int8x8_t)vcgt_f32(v345, v344);
              v345.i32[0] = v344.i32[0];
              float32x2_t v347 = vdiv_f32(_D12, (float32x2_t)vbsl_s8(v346, (int8x8_t)v345, v926));
              uint64_t v348 = *(void *)(a1 + 960);
              float v349 = *(float *)(v337 + 8 * v331);
              float v350 = *(float *)(v337 + 8 * v331 + 4);
              if (v348)
              {
LABEL_278:
                int v351 = *(_DWORD *)(v339 + 992);
                int v352 = (int)(float)((float)((float)v351 * 0.5) + (float)(v349 * *(float *)(v339 + 984)));
                int v353 = *(_DWORD *)(v339 + 996);
                int v354 = (int)(float)((float)((float)v353 * 0.5) + (float)(v350 * *(float *)(v339 + 988)));
                if (v351 <= v352) {
                  int v355 = v351 - 1;
                }
                else {
                  int v355 = (int)(float)((float)((float)v351 * 0.5) + (float)(v349 * *(float *)(v339 + 984)));
                }
                int v356 = 2 * v355;
                if (v353 <= v354) {
                  int v357 = v353 - 1;
                }
                else {
                  int v357 = (int)(float)((float)((float)v353 * 0.5) + (float)(v350 * *(float *)(v339 + 988)));
                }
                if (v354 < 0) {
                  int v357 = 0;
                }
                if (v352 < 0) {
                  int v356 = 0;
                }
                int32x4_t v358 = (const float *)(v348 + 4 * (*(void *)(v339 + 976) * v357 + v356));
                float32x2_t v359 = vld1_dup_f32(v358++);
                float32x2_t v360 = vld1_dup_f32(v358);
                float32x2_t v347 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v359, v347), (int8x8_t)v359, vbsl_s8((int8x8_t)vcgt_f32(v347, v360), (int8x8_t)v360, (int8x8_t)v347));
              }
            }
            double v361 = v349;
            double v362 = v350;
            double v363 = sqrt(v361 * v361 + 1.0 + v362 * v362);
            double v364 = v361 / v363;
            double v365 = v362 / v363;
            if (v363 > 0.0) {
              double v366 = 1.0 / v363;
            }
            else {
              double v366 = 0.0;
            }
            if (v363 > 0.0) {
              double v367 = v364;
            }
            else {
              double v367 = 0.0;
            }
            if (v363 > 0.0) {
              double v368 = v365;
            }
            else {
              double v368 = 0.0;
            }
            double v369 = v366 * v347.f32[0];
            double v370 = v367 * v347.f32[0];
            double v371 = v368 * v347.f32[0];
            double v372 = *(double *)v333;
            double v373 = *(double *)(v333 + 8);
            double v374 = *(double *)(v333 + 16);
            double v375 = *(double *)(v333 + 24);
            double v377 = *(double *)(v333 + 64);
            double v376 = *(double *)(v333 + 72);
            *(double *)&__darwin_time_t v378 = v376 + v370 * v373 + *(double *)v333 * v369 + v374 * v371;
            double v379 = *(double *)(v333 + 32);
            double v380 = *(double *)(v333 + 40);
            double v381 = v370 * v379 + v375 * v369 + v380 * v371;
            double v382 = *(double *)(v333 + 48);
            double v383 = *(double *)(v333 + 56);
            double v384 = v370 * v383 + v382 * v369 + v377 * v371;
            double v385 = *(double *)(v333 + 80);
            double v386 = *(double *)(v333 + 88);
            v967.__darwin_time_t tv_sec = v378;
            *(double *)&v967.tv_usec = v385 + v381;
            *(double *)v968 = v386 + v384;
            BOOL v387 = v363 <= 0.0;
            if (v363 > 0.0) {
              double v388 = 1.0 / v363;
            }
            else {
              double v388 = 0.0;
            }
            if (v387)
            {
              double v364 = 0.0;
              double v365 = 0.0;
            }
            double v389 = v347.f32[1];
            double v390 = v388 * v389;
            double v391 = v364 * v389;
            double v392 = v365 * v389;
            v953.f64[0] = v376 + v373 * v391 + v372 * v390 + v374 * v392;
            v953.f64[1] = v385 + v379 * v391 + v375 * v390 + v380 * v392;
            v954.f64[0] = v386 + v383 * v391 + v382 * v390 + v377 * v392;
            if (!g_frustum_isect_lseg((double *)&v957.tv_sec + 24 * (v340 == -1), (double *)&v967.tv_sec, v953.f64, &v950, &v944))goto LABEL_274; {
            double v393 = *(double *)(v166 + 72);
            }
            double v394 = *(double *)(v166 + 80);
            double v395 = *(double *)&v967.tv_sec + (v953.f64[0] - *(double *)&v967.tv_sec) * v950 - v393;
            double v396 = *(double *)(v166 + 24);
            double v397 = *(double *)&v967.tv_usec + (v953.f64[1] - *(double *)&v967.tv_usec) * v950 - v394;
            double v398 = *(double *)(v166 + 48);
            double v399 = *(double *)(v166 + 88);
            double v400 = *(double *)v968 + (v954.f64[0] - *(double *)v968) * v950 - v399;
            float v401 = v396 * v397 + *(double *)v166 * v395 + v398 * v400;
            if (v401 <= 0.0) {
              goto LABEL_274;
            }
            double v402 = *(double *)v968 + (v954.f64[0] - *(double *)v968) * v944 - v399;
            double v403 = *(double *)&v967.tv_sec + (v953.f64[0] - *(double *)&v967.tv_sec) * v944 - v393;
            double v404 = *(double *)&v967.tv_usec + (v953.f64[1] - *(double *)&v967.tv_usec) * v944 - v394;
            float v405 = v396 * v404 + *(double *)v166 * v403 + v398 * v402;
            if (v405 <= 0.0) {
              goto LABEL_274;
            }
            double v406 = *(double *)(v166 + 32);
            double v407 = *(double *)(v166 + 40);
            double v408 = *(double *)(v166 + 8);
            double v409 = *(double *)(v166 + 16);
            double v410 = v397 * v406 + v408 * v395;
            double v411 = v397 * v407 + v409 * v395;
            double v412 = *(double *)(v166 + 56);
            double v413 = *(double *)(v166 + 64);
            double v414 = v410 + v412 * v400;
            *(float *)&double v414 = v414;
            *(float *)&double v411 = v411 + v413 * v400;
            *(float *)&double v414 = *(float *)&v414 / v401;
            float v415 = *(float *)&v411 / v401;
            double v416 = v407 * v404 + v409 * v403 + v413 * v402;
            double v418 = v406 * v404 + v408 * v403;
            double v417 = v418 + v412 * v402;
            *(float *)&double v418 = v416;
            *(float *)&double v416 = v417;
            *(float *)&double v416 = *(float *)&v416 / v405;
            *(float *)&double v417 = *(float *)&v418 / v405;
            *(float *)&double v418 = (float)((float)(v415 - *(float *)&v417) * (float)(v415 - *(float *)&v417))
                            + (float)((float)(*(float *)&v414 - *(float *)&v416)
                                    * (float)(*(float *)&v414 - *(float *)&v416));
            if (*(float *)&v418 >= 1.0e-12)
            {
              v942[0] = *(float *)&v414;
              v942[1] = v415;
              v941[0] = *(float *)&v416;
              v941[1] = *(float *)&v417;
              int v419 = plq_inside_line((uint64_t)ids, v942, v941, (uint64_t)&v947, v882, v414, v416, v417, v418);
              uint64_t v420 = v307 & 0xFFFFFFE0;
              if (v419 > 0) {
                goto LABEL_317;
              }
              goto LABEL_273;
            }
            v943[0] = *(float *)&v414;
            v943[1] = v415;
            if (ids)
            {
              float v952 = v875;
              int v419 = plq_inside_circle_helper((uint64_t)ids, v943, &v952, (uint64_t)&v947, 0);
              uint64_t v420 = v307 & 0xFFFFFFE0;
              if (v419 > 0)
              {
LABEL_317:
                uint64_t v425 = *(void *)(v333 + 384);
                uint64_t v426 = *v880;
                uint64_t v427 = v419;
                unint64_t v428 = (int *)v948;
                if ((v307 & 0xF) != 0)
                {
                  if ((int)v307 > 0)
                  {
                    uint64_t v429 = 0;
                    int v430 = -1;
                    int v431 = v891;
                    int v432 = v891;
                    while (1)
                    {
                      uint64_t v434 = *((_DWORD *)v948 + v429) * (int)v307;
                      if (v307 >= 8)
                      {
                        if (v307 < 0x20)
                        {
                          int v436 = 0;
                          uint64_t v437 = 0;
LABEL_338:
                          int32x4_t v455 = 0uLL;
                          int32x4_t v456 = (int32x4_t)v436;
                          int v457 = (uint8x8_t *)(v425 + v330 + v437);
                          __darwin_time_t v458 = (uint8x8_t *)(v426 + v437 + v434);
                          uint64_t v459 = v437 - (v307 & 0xFFFFFFF8);
                          do
                          {
                            uint8x8_t v460 = *v457++;
                            uint8x8_t v461 = v460;
                            uint8x8_t v462 = *v458++;
                            int16x8_t v463 = (int16x8_t)vsubl_u8(v461, v462);
                            int32x4_t v455 = vmlal_high_s16(v455, v463, v463);
                            int32x4_t v456 = vmlal_s16(v456, *(int16x4_t *)v463.i8, *(int16x4_t *)v463.i8);
                            v459 += 8;
                          }
                          while (v459);
                          int v436 = vaddvq_s32(vaddq_s32(v456, v455));
                          uint64_t v435 = v307 & 0xFFFFFFF8;
                          if (v435 == v307) {
                            goto LABEL_320;
                          }
                          goto LABEL_341;
                        }
                        int32x4_t v438 = 0uLL;
                        __int32 v439 = (uint8x8_t *)(v426 + 16 + v434);
                        int32x4_t v440 = 0uLL;
                        uint64_t v441 = v420;
                        uint64_t v442 = (uint8x8_t *)(v425 + v336);
                        int32x4_t v443 = 0uLL;
                        int32x4_t v444 = 0uLL;
                        int32x4_t v445 = 0uLL;
                        int32x4_t v446 = 0uLL;
                        int32x4_t v447 = 0uLL;
                        int32x4_t v448 = 0uLL;
                        do
                        {
                          uint8x16_t v449 = *(uint8x16_t *)v442[-2].i8;
                          uint8x16_t v450 = *(uint8x16_t *)v439[-2].i8;
                          int16x8_t v451 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v449.i8, *(uint8x8_t *)v450.i8);
                          int16x8_t v452 = (int16x8_t)vsubl_high_u8(v449, v450);
                          int16x8_t v453 = (int16x8_t)vsubl_u8(*v442, *v439);
                          int16x8_t v454 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v442->i8, *(uint8x16_t *)v439->i8);
                          int32x4_t v444 = vmlal_high_s16(v444, v452, v452);
                          int32x4_t v443 = vmlal_s16(v443, *(int16x4_t *)v452.i8, *(int16x4_t *)v452.i8);
                          int32x4_t v440 = vmlal_high_s16(v440, v451, v451);
                          int32x4_t v438 = vmlal_s16(v438, *(int16x4_t *)v451.i8, *(int16x4_t *)v451.i8);
                          int32x4_t v448 = vmlal_high_s16(v448, v454, v454);
                          int32x4_t v447 = vmlal_s16(v447, *(int16x4_t *)v454.i8, *(int16x4_t *)v454.i8);
                          int32x4_t v446 = vmlal_high_s16(v446, v453, v453);
                          int32x4_t v445 = vmlal_s16(v445, *(int16x4_t *)v453.i8, *(int16x4_t *)v453.i8);
                          v442 += 4;
                          v439 += 4;
                          v441 -= 32;
                        }
                        while (v441);
                        int v436 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v445, v438), vaddq_s32(v447, v443)), vaddq_s32(vaddq_s32(v446, v440), vaddq_s32(v448, v444))));
                        if (v420 == v307) {
                          goto LABEL_320;
                        }
                        uint64_t v437 = v420;
                        uint64_t v435 = v420;
                        if ((v307 & 0x18) != 0) {
                          goto LABEL_338;
                        }
                      }
                      else
                      {
                        uint64_t v435 = 0;
                        int v436 = 0;
                      }
LABEL_341:
                      uint64_t v464 = v307 - v435;
                      int v465 = (unsigned __int8 *)(v426 + v435 + v434);
                      uint64_t v466 = v425 + v435;
                      do
                      {
                        int v467 = *v465++;
                        v436 += (*(unsigned __int8 *)(v466 + v330) - v467) * (*(unsigned __int8 *)(v466 + v330) - v467);
                        ++v466;
                        --v464;
                      }
                      while (v464);
LABEL_320:
                      if (v436 < v431) {
                        int v431 = v436;
                      }
                      BOOL v433 = v436 < v432;
                      if (v436 <= v432) {
                        int v431 = v432;
                      }
                      if (v436 < v432) {
                        int v432 = v436;
                      }
                      if (v433) {
                        int v430 = *((_DWORD *)v948 + v429);
                      }
                      if (++v429 == v419) {
                        goto LABEL_372;
                      }
                    }
                  }
                  int v430 = -1;
                  int v431 = v891;
                  int v432 = v891;
                  do
                  {
                    int v475 = *v428++;
                    int v474 = v475;
                    v431 &= v431 >> 31;
                    BOOL v476 = v432 < 0;
                    if (v432 >= 0) {
                      int v431 = v432;
                    }
                    v432 &= v432 >> 31;
                    if (!v476) {
                      int v430 = v474;
                    }
                    --v427;
                  }
                  while (v427);
                }
                else if ((int)v307 <= 0)
                {
                  int v430 = -1;
                  int v431 = v891;
                  int v432 = v891;
                  do
                  {
                    int v478 = *v428++;
                    int v477 = v478;
                    v431 &= v431 >> 31;
                    BOOL v479 = v432 < 0;
                    if (v432 >= 0) {
                      int v431 = v432;
                    }
                    v432 &= v432 >> 31;
                    if (!v479) {
                      int v430 = v477;
                    }
                    --v427;
                  }
                  while (v427);
                }
                else
                {
                  uint64_t v468 = 0;
                  uint64_t v469 = v425 + v330;
                  int v430 = -1;
                  int v431 = v891;
                  int v432 = v891;
                  do
                  {
                    unint64_t v470 = 0;
                    int v471 = 0;
                    do
                    {
                      uint8x16_t v472 = vabdq_u8(*(uint8x16_t *)(v469 + v470), *(uint8x16_t *)(v426 + *((_DWORD *)v948 + v468) * (int)v307 + v470));
                      v471 += vaddlvq_u16(vqaddq_u16(vmull_u8(*(uint8x8_t *)v472.i8, *(uint8x8_t *)v472.i8), vmull_high_u8(v472, v472)));
                      v470 += 16;
                    }
                    while (v470 < v307);
                    if (v471 < v431) {
                      int v431 = v471;
                    }
                    BOOL v473 = v471 < v432;
                    if (v471 <= v432) {
                      int v431 = v432;
                    }
                    if (v471 < v432) {
                      int v432 = v471;
                    }
                    if (v473) {
                      int v430 = *((_DWORD *)v948 + v468);
                    }
                    ++v468;
                  }
                  while (v468 != v427);
                }
LABEL_372:
                v947 = 0;
                if (v430 == -1) {
                  goto LABEL_274;
                }
                if (v432 > v876[v430] || (float)((float)(v308 * v308) * (float)v431) < (float)v432) {
                  goto LABEL_274;
                }
                int v481 = v430;
                v876[v430] = v432;
                int v482 = *(_DWORD *)(*v335 + 4 * v331);
                uint64_t v483 = *((void *)&v945 + 1);
                int v484 = (void *)(*((void *)&v945 + 1) + 24 * v430);
                int v485 = v843 & 0x7FFF | (v430 << 15);
                uint64_t v486 = 4 * v430;
                if (v482 == -1)
                {
                  *int v484 = 0;
                  uint64_t v499 = v483 + 24 * v430;
                  uint64_t v502 = *(void *)(v499 + 16);
                  uint64_t v501 = (uint64_t *)(v499 + 16);
                  uint64_t v500 = v502;
                  if (v502 < 1)
                  {
                    uint64_t v519 = 2 * v500;
                    if (2 * v500 <= 1) {
                      uint64_t v519 = 1;
                    }
                    if (!v500) {
                      uint64_t v519 = 64;
                    }
                    uint64_t v848 = v519;
                    uint64_t v851 = v483 + 24 * v481;
                    uint64_t v870 = v486;
                    v873 = v484;
                    int v867 = v485;
                    uint64_t v861 = v483;
                    int v864 = v481;
                    v856 = v501;
                    int v504 = malloc_type_realloc(*(void **)(v851 + 8), 4 * v519, 0xAA23C071uLL);
                    uint64_t v500 = v848;
                    uint64_t v501 = v856;
                    uint64_t v483 = v861;
                    int v481 = v864;
                    uint64_t v486 = v870;
                    int v484 = v873;
                    int v485 = v867;
                    *(void *)(v851 + 8) = v504;
                    uint64_t *v856 = v848;
                    uint64_t v503 = *v873;
                  }
                  else
                  {
                    uint64_t v503 = 0;
                    int v504 = *(_DWORD **)(v483 + 24 * v430 + 8);
                  }
                  uint64_t v520 = v503 + 1;
                  *int v484 = v503 + 1;
                  v504[v503] = v878 | (v331 << 15);
                  if (v503 + 1 >= v500)
                  {
                    uint64_t v521 = v503 + 2;
                    if (2 * v500 > v520) {
                      uint64_t v521 = 2 * v500;
                    }
                    if (v521)
                    {
                      v862 = (void *)(v483 + 24 * v481 + 8);
                      uint64_t v865 = v521;
                      uint64_t v871 = v486;
                      v874 = v484;
                      int v868 = v485;
                      v857 = v501;
                      int v504 = malloc_type_realloc(v504, 4 * v521, 0x374EE50AuLL);
                      uint64_t v521 = v865;
                      uint64_t v501 = v857;
                      uint64_t v486 = v871;
                      int v484 = v874;
                      int v485 = v868;
                      void *v862 = v504;
                      uint64_t v520 = *v874;
                    }
                    *uint64_t v501 = v521;
                  }
                  *int v484 = v520 + 1;
                  v504[v520] = v485;
                  int v522 = LODWORD(v946[2])++;
                  *(_DWORD *)(*(void *)&v946[1] + v486) = v522;
                  *(_DWORD *)(*v897 + v486) = -1;
                  goto LABEL_274;
                }
                uint64_t v487 = a1;
                uint64_t v488 = *(void *)(a1 + 320);
                *int v484 = 0;
                uint64_t v489 = *(void *)(v488 + 24 * v482);
                uint64_t v869 = v486;
                v872 = v484;
                int v866 = v485;
                uint64_t v860 = v483;
                int v863 = v481;
                if (v489 < 1)
                {
                  uint64_t v505 = 0;
                  uint64_t v506 = v483 + 24 * v481;
                  uint64_t v509 = *(void *)(v506 + 16);
                  uint64_t v507 = (uint64_t *)(v506 + 16);
                  uint64_t v508 = v509;
                  if (v509 <= 0) {
                    goto LABEL_391;
                  }
                }
                else
                {
                  v854 = (uint64_t *)(v488 + 24 * v482);
                  int v490 = (const void *)v854[1];
                  uint64_t v491 = v483 + 24 * v481;
                  uint64_t v494 = *(void *)(v491 + 16);
                  int v493 = (uint64_t *)(v491 + 16);
                  uint64_t v492 = v494;
                  if (v489 <= v494)
                  {
                    uint64_t v498 = 0;
                    float32x2_t v497 = *(char **)(v483 + 24 * v481 + 8);
                  }
                  else
                  {
                    v846 = v493;
                    v849 = (const void *)v854[1];
                    uint64_t v495 = 2 * v492;
                    _ZF = v492 == 0;
                    uint64_t v496 = 64;
                    if (!_ZF) {
                      uint64_t v496 = v495;
                    }
                    if (v496 > v489) {
                      uint64_t v489 = v496;
                    }
                    uint64_t v844 = v489;
                    uint64_t v845 = v483 + 24 * v481;
                    float32x2_t v497 = (char *)malloc_type_realloc(*(void **)(v845 + 8), 4 * v489, 0xE017DAD8uLL);
                    *(void *)(v845 + 8) = v497;
                    int v490 = v849;
                    uint64_t *v846 = v844;
                    uint64_t v498 = *v872;
                    uint64_t v489 = *v854;
                  }
                  memcpy(&v497[4 * v498], v490, 4 * v489);
                  uint64_t v486 = v869;
                  int v484 = v872;
                  uint64_t v505 = *v872 + *v854;
                  void *v872 = v505;
                  uint64_t v487 = a1;
                  int v485 = v866;
                  uint64_t v483 = v860;
                  int v481 = v863;
                  uint64_t v510 = v860 + 24 * v863;
                  uint64_t v511 = *(void *)(v510 + 16);
                  uint64_t v507 = (uint64_t *)(v510 + 16);
                  uint64_t v508 = v511;
                  if (v505 >= v511)
                  {
LABEL_391:
                    uint64_t v512 = 2 * v508;
                    _ZF = v508 == 0;
                    uint64_t v513 = 64;
                    if (!_ZF) {
                      uint64_t v513 = v512;
                    }
                    if (v513 <= v505) {
                      uint64_t v513 = v505 + 1;
                    }
                    if (v513)
                    {
                      uint64_t v847 = v483 + 24 * v481;
                      uint64_t v850 = v513;
                      v855 = v507;
                      float32x2_t v514 = malloc_type_realloc(*(void **)(v847 + 8), 4 * v513, 0xF6B6293uLL);
                      uint64_t v513 = v850;
                      uint64_t v483 = v860;
                      int v481 = v863;
                      uint64_t v486 = v869;
                      int v484 = v872;
                      int v485 = v866;
                      *(void *)(v847 + 8) = v514;
                      uint64_t v507 = v855;
                      uint64_t v487 = a1;
                      uint64_t v505 = *v872;
                    }
                    *uint64_t v507 = v513;
                  }
                }
                *int v484 = v505 + 1;
                *(_DWORD *)(*(void *)(v483 + 24 * v481 + 8) + 4 * v505) = v485;
                uint64_t v515 = *v335;
                *(_DWORD *)(*v897 + v486) = *(_DWORD *)(*v335 + 4 * v331);
                uint64_t v516 = *(void *)&v946[3] + 12 * v481;
                uint64_t v517 = *(void *)(v487 + 376) + 12 * *(int *)(v515 + 4 * v331);
                uint64_t v518 = *(void *)v517;
                *(_DWORD *)(v516 + 8) = *(_DWORD *)(v517 + 8);
                *(void *)uint64_t v516 = v518;
                *(_DWORD *)(*(void *)&v946[1] + v486) = *(_DWORD *)(*(void *)(v487 + 344)
                                                                    + 4 * *(int *)(*v335 + 4 * v331));
                goto LABEL_274;
              }
            }
LABEL_273:
            v947 = 0;
LABEL_274:
            ++v331;
            v336 += (int)v307;
            v330 += (int)v307;
          }
          while (v331 < *v334);
        }
        *(void *)&v967.tv_usec = 0;
        v967.__darwin_time_t tv_sec = 0;
        if (gettimeofday(&v967, 0) || (double)(v967.tv_usec + 1000000 * v967.tv_sec) / 1000000.0 <= 1514764800.0) {
          goto LABEL_700;
        }
        free(v948);
        uint64_t v178 = (float32x2_t *)a1;
        int v303 = *(_DWORD *)(a1 + 588);
        ++v933;
        float32x4_t v285 = v885;
        if (v933 >= v303) {
          goto LABEL_414;
        }
      }
      long double v955 = asin(-v315);
      v954.f64[1] = atan2(*(long double *)(v166 + 24), *(long double *)v166);
      double v316 = *(double *)(v166 + 56);
      double v317 = *(double *)(v166 + 64);
LABEL_261:
      double v318 = atan2(v316, v317);
      goto LABEL_263;
    }
LABEL_414:
    float v167 = v859;
    LODWORD(v523) = *v859;
    if (*v859 < 1) {
      break;
    }
    uint64_t v524 = 0;
    uint64_t v525 = 0;
    uint64_t v526 = (int *)*((void *)&v945 + 1);
    uint64_t v527 = 4;
    float v528 = -1.0;
    do
    {
      if (*(void *)v526)
      {
        float32x2_t v529 = (float *)(*(void *)&v946[3] + v524);
        float v530 = slam_vo_map_triangulate_track(a1, v526, *(_DWORD *)(*v897 + 4 * v525), *(void *)&v946[3] + v524);
        uint64_t v178 = (float32x2_t *)a1;
        if ((float)(v530 * (float)((float)(*v888 * *(float *)(a1 + 160)) * (float)(*v888 * *(float *)(a1 + 160)))) >= v875
          || (double v531 = *v529 - *(double *)(v166 + 72),
              double v532 = v529[1] - *(double *)(v166 + 80),
              double v533 = v529[2] - *(double *)(v166 + 88),
              float v534 = *(double *)(v166 + 24) * v532 + *(double *)v166 * v531 + *(double *)(v166 + 48) * v533,
              v534 <= 0.0)
          || (float v535 = v532 * *(double *)(v166 + 40) + *(double *)(v166 + 16) * v531 + *(double *)(v166 + 64) * v533,
              float v536 = v532 * *(double *)(v166 + 32) + *(double *)(v166 + 8) * v531 + *(double *)(v166 + 56) * v533,
              (float)((float)((float)((float)(v535 / v534) - *(float *)(*(void *)(v166 + 368) + v527))
                            * (float)((float)(v535 / v534) - *(float *)(*(void *)(v166 + 368) + v527)))
                    + (float)((float)((float)(v536 / v534) - *(float *)(*(void *)(v166 + 368) + v527 - 4))
                            * (float)((float)(v536 / v534) - *(float *)(*(void *)(v166 + 368) + v527 - 4)))) >= v875))
        {
          *(void *)uint64_t v526 = 0;
          *(_DWORD *)(*v897 + 4 * v525) = -2;
        }
      }
      ++v525;
      uint64_t v523 = *v859;
      v527 += 8;
      v526 += 6;
      v524 += 12;
    }
    while (v525 < v523);
    uint64_t v182 = v876;
    int v537 = v858;
    if (v178[73].i32[1] > 1) {
      goto LABEL_426;
    }
LABEL_232:
    int v283 = v537 + 1;
    int v281 = *v853;
  }
  float v528 = -1.0;
  BOOL v387 = v303 <= 1;
  uint64_t v182 = v876;
  int v537 = v858;
  if (v387) {
    goto LABEL_232;
  }
LABEL_426:
  if (v178[119].i32[0] > 3) {
    goto LABEL_232;
  }
  if ((int)v523 >= 1 && *(void *)&v178[49])
  {
    uint64_t v538 = 0;
    uint64_t v539 = *v897;
    uint64_t v540 = *((void *)&v946[4] + 1);
    do
    {
      uint64_t v541 = *(unsigned int *)(v539 + 4 * v538);
      if ((v541 & 0x80000000) == 0)
      {
        *(_DWORD *)(v540 + 4 * v538) = *(_DWORD *)(*(void *)&v178[50] + 4 * v541);
        LODWORD(v523) = *v859;
      }
      ++v538;
    }
    while (v538 < (int)v523);
  }
  float v542 = tracker_bundle(a1, &v945, 1);
  uint64_t v178 = (float32x2_t *)a1;
  if (((LODWORD(v542) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E || (LODWORD(v542) & 0x7FFFFFFFu) - 1 <= 0x7FFFFE)
  {
    uint64_t v544 = *((void *)&v946[2] + 1);
    if (*((uint64_t *)&v946[2] + 1) >= (uint64_t)v945) {
      uint64_t v544 = v945;
    }
    if (v544 >= 1)
    {
      uint64_t v545 = 0;
      uint64_t v546 = (float *)(*(void *)&v946[3] + 8);
      uint64_t v547 = (void *)(*((void *)&v945 + 1) + 8);
      do
      {
        uint64_t v548 = *(v547 - 1);
        if (v548)
        {
          float v549 = *(float *)(a1 + 40) * *v888;
          unint64_t v550 = *(unsigned int *)(*v547 + (((v548 << 32) - 0x100000000) >> 30));
          uint64_t v551 = *(void *)(a1 + 304);
          uint64_t v552 = (double *)(v551 + 880 * (v550 & 0x7FFF));
          if ((int)v548 >= 2) {
            float v549 = (float)((float)(int)v548 / (float)((float)(int)v548 + v528)) * v549;
          }
          double v553 = *(v546 - 2) - v552[9];
          double v554 = *(v546 - 1) - v552[10];
          double v555 = *v546 - v552[11];
          float v556 = v552[3] * v554 + *v552 * v553 + v552[6] * v555;
          if (v556 <= 0.0
            || (float v557 = (float *)(*(void *)(v551 + 880 * (v550 & 0x7FFF) + 368) + 8 * (v550 >> 15)),
                float v558 = v554 * v552[5] + v552[2] * v553 + v552[8] * v555,
                float v559 = v554 * v552[4] + v552[1] * v553 + v552[7] * v555,
                (float)((float)((float)((float)(v558 / v556) - v557[1]) * (float)((float)(v558 / v556) - v557[1]))
                      + (float)((float)((float)(v559 / v556) - *v557) * (float)((float)(v559 / v556) - *v557))) >= (float)(v549 * v549)))
          {
            *(_DWORD *)(*v897 + 4 * v545) = -2;
          }
        }
        ++v545;
        v546 += 3;
        v547 += 3;
      }
      while (v544 != v545);
    }
    goto LABEL_232;
  }
LABEL_449:
  int v560 = v843 & 0x7FFF;
  if (*v167 >= 1)
  {
    uint64_t v561 = 0;
    uint64_t v562 = 0;
    uint64_t v563 = 0;
    do
    {
      uint64_t v564 = *v897;
      int v565 = *(_DWORD *)(*v897 + 4 * v563);
      if (v565 == -1)
      {
        v576 = (long long *)(*((void *)&v945 + 1) + v561);
        if (*(void *)(*((void *)&v945 + 1) + v561) == 2)
        {
          uint64_t v577 = *v852;
          *(_DWORD *)(v564 + 4 * v563) = *v852;
          unsigned int v578 = **((_DWORD **)v576 + 1) & 0x7FFF;
          if (v578 == v843)
          {
            log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1967, (uint64_t)"spawn", "im(%d) == idx(%d)", v843, v843);
            __assert_rtn("spawn", "slam_tracker_vo.c", 1967, "0");
          }
          *(_DWORD *)(*(void *)(*(void *)&v178[38] + 880 * v578 + 400)
                    + (((unint64_t)**((unsigned int **)v576 + 1) >> 13) & 0x7FFFC)) = v577;
          uint64_t v579 = (uint64_t)v178[41];
          if (v577 >= v579)
          {
            uint64_t v580 = 2 * v579;
            _ZF = v579 == 0;
            uint64_t v581 = 10;
            if (!_ZF) {
              uint64_t v581 = v580;
            }
            if (v581 <= v577) {
              uint64_t v582 = v577 + 1;
            }
            else {
              uint64_t v582 = v581;
            }
            if (v582)
            {
              *(void *)(a1 + 320) = malloc_type_realloc(*(void **)(a1 + 320), 24 * v582, 0x22EB8AF2uLL);
              uint64_t v178 = (float32x2_t *)a1;
              uint64_t v577 = *(void *)(a1 + 312);
            }
            v178[41] = (float32x2_t)v582;
          }
          v178[39] = (float32x2_t)(v577 + 1);
          uint64_t v583 = *(void *)&v178[40] + 24 * v577;
          long long v584 = *v576;
          *(void *)(v583 + 16) = *((void *)v576 + 2);
          *(_OWORD *)uint64_t v583 = v584;
          uint64_t v585 = (uint64_t)v178[46];
          uint64_t v586 = (uint64_t)v178[48];
          if (v585 >= v586)
          {
            uint64_t v587 = 2 * v586;
            _ZF = v586 == 0;
            uint64_t v588 = 21;
            if (!_ZF) {
              uint64_t v588 = v587;
            }
            if (v588 <= v585) {
              uint64_t v589 = v585 + 1;
            }
            else {
              uint64_t v589 = v588;
            }
            if (v589)
            {
              *(void *)(a1 + 376) = malloc_type_realloc(*(void **)(a1 + 376), 12 * v589, 0x390EB5DFuLL);
              uint64_t v178 = (float32x2_t *)a1;
              uint64_t v585 = *(void *)(a1 + 368);
            }
            v178[48] = (float32x2_t)v589;
          }
          v178[46] = (float32x2_t)(v585 + 1);
          uint64_t v590 = *(void *)&v178[47] + 12 * v585;
          uint64_t v591 = *(void *)(*(void *)&v946[3] + v562);
          *(_DWORD *)(v590 + 8) = *(_DWORD *)(*(void *)&v946[3] + v562 + 8);
          *(void *)uint64_t v590 = v591;
          uint64_t v592 = (uint64_t)v178[42];
          uint64_t v593 = (uint64_t)v178[44];
          if (v592 >= v593)
          {
            uint64_t v594 = 2 * v593;
            _ZF = v593 == 0;
            uint64_t v595 = 64;
            if (!_ZF) {
              uint64_t v595 = v594;
            }
            if (v595 <= v592) {
              uint64_t v596 = v592 + 1;
            }
            else {
              uint64_t v596 = v595;
            }
            if (v596)
            {
              *(void *)(a1 + 344) = malloc_type_realloc(*(void **)(a1 + 344), 4 * v596, 0x4D21A1F0uLL);
              uint64_t v178 = (float32x2_t *)a1;
              uint64_t v592 = *(void *)(a1 + 336);
            }
            v178[44] = (float32x2_t)v596;
          }
          v178[42] = (float32x2_t)(v592 + 1);
          __int32 v597 = v178[45].i32[0];
          v178[45].i32[0] = v597 + 1;
          *(_DWORD *)(*(void *)&v178[43] + 4 * v592) = v597;
          uint64_t v598 = (uint64_t)v178[52];
          uint64_t v599 = (uint64_t)v178[54];
          if (v598 >= v599)
          {
            uint64_t v600 = 2 * v599;
            _ZF = v599 == 0;
            uint64_t v601 = 64;
            if (!_ZF) {
              uint64_t v601 = v600;
            }
            if (v601 <= v598) {
              uint64_t v602 = v598 + 1;
            }
            else {
              uint64_t v602 = v601;
            }
            if (v602)
            {
              *(void *)(a1 + 424) = malloc_type_realloc(*(void **)(a1 + 424), 4 * v602, 0x28193C7DuLL);
              uint64_t v178 = (float32x2_t *)a1;
              uint64_t v598 = *(void *)(a1 + 416);
            }
            v178[54] = (float32x2_t)v602;
          }
          v178[52] = (float32x2_t)(v598 + 1);
          *(_DWORD *)(*(void *)&v178[53] + 4 * v598) = v578;
          *((void *)v576 + 1) = 0;
        }
      }
      else if (v565 == -2)
      {
        *(_DWORD *)(v564 + 4 * v563) = -1;
      }
      else
      {
        int v566 = *(_DWORD *)(*v897 + 4 * v563);
        float32x2_t v567 = v178[40];
        float v568 = (uint64_t *)(*(void *)&v567 + 24 * v565);
        uint64_t v569 = *(void *)&v178[47] + 12 * v565;
        uint64_t v570 = *(void *)(*(void *)&v946[3] + v562);
        *(_DWORD *)(v569 + 8) = *(_DWORD *)(*(void *)&v946[3] + v562 + 8);
        *(void *)uint64_t v569 = v570;
        uint64_t v571 = *v568;
        uint64_t v572 = v568[2];
        if (*v568 >= v572)
        {
          uint64_t v573 = 2 * v572;
          _ZF = v572 == 0;
          uint64_t v574 = 64;
          if (!_ZF) {
            uint64_t v574 = v573;
          }
          if (v574 <= v571) {
            uint64_t v575 = v571 + 1;
          }
          else {
            uint64_t v575 = v574;
          }
          if (v575)
          {
            *(void *)(*(void *)&v567 + 24 * v566 + 8) = malloc_type_realloc(*(void **)(*(void *)&v567 + 24 * v566 + 8), 4 * v575, 0x62BA15E6uLL);
            uint64_t v178 = (float32x2_t *)a1;
            uint64_t v571 = *v568;
          }
          v568[2] = v575;
        }
        *float v568 = v571 + 1;
        *(_DWORD *)(*(void *)(*(void *)&v567 + 24 * v566 + 8) + 4 * v571) = v560;
      }
      ++v563;
      v562 += 12;
      v561 += 24;
      v560 += 0x8000;
    }
    while (v563 < *v859);
  }
  slam_tracker_vo_map_free((uint64_t)&v945);
  plq_free((uint64_t)ids);
  free(v876);
  free(v938);
  v603 = (void *)a1;
  uint64_t v604 = *(void *)(a1 + 392);
  uint64_t v605 = *(void *)(a1 + 368);
  if (v605 == v604) {
    goto LABEL_516;
  }
  uint64_t v606 = *(void *)(a1 + 408);
  if (v605 <= v606)
  {
    uint64_t v610 = v605 - v604;
    if (v605 <= v604) {
      goto LABEL_514;
    }
  }
  else
  {
    uint64_t v607 = 2 * v606;
    _ZF = v606 == 0;
    uint64_t v608 = 64;
    if (!_ZF) {
      uint64_t v608 = v607;
    }
    if (v608 <= v605) {
      uint64_t v609 = *(void *)(a1 + 368);
    }
    else {
      uint64_t v609 = v608;
    }
    if (v609)
    {
      *(void *)(a1 + 400) = malloc_type_realloc(*(void **)(a1 + 400), 4 * v609, 0x92CE5E8FuLL);
      v603 = (void *)a1;
    }
    v603[51] = v609;
    uint64_t v610 = v605 - v604;
    if (v605 <= v604)
    {
LABEL_514:
      uint64_t v611 = v603[46];
      v603[49] = v611;
      uint64_t v612 = (int)v604;
      if (v611 > (int)v604) {
        goto LABEL_515;
      }
      goto LABEL_516;
    }
  }
  bzero((void *)(v603[50] + 4 * v603[49]), 4 * v610);
  v603 = (void *)a1;
  uint64_t v611 = *(void *)(a1 + 368);
  *(void *)(a1 + 392) = v611;
  uint64_t v612 = (int)v604;
  if (v611 > (int)v604) {
LABEL_515:
  }
    memset((void *)(v603[50] + 4 * v612), 255, 4 * v611 - 4 * (int)v604);
LABEL_516:
  *(void *)&v957.tv_usec = 0;
  v957.__darwin_time_t tv_sec = 0;
  if (gettimeofday(&v957, 0) || (double)(v957.tv_usec + 1000000 * v957.tv_sec) / 1000000.0 <= 1514764800.0) {
    goto LABEL_700;
  }
  uint64_t v613 = a1;
  if (!*(_DWORD *)(a1 + 84)) {
    goto LABEL_596;
  }
  uint64_t v614 = *(void *)(a1 + 304);
  int v615 = *(_DWORD *)(a1 + 592);
  long long v945 = 0u;
  memset(v946, 0, sizeof(v946));
  *(void *)v896 = v614 + 880 * v615;
  v898 = (int *)(*(void *)v896 + 488);
  LODWORD(v616) = *(_DWORD *)(*(void *)v896 + 488);
  if ((int)v616 <= 0)
  {
    uint64_t v616 = (int)v616;
  }
  else
  {
    uint64_t v617 = 0;
    int v877 = v615;
    uint64_t v879 = v614;
    uint64_t v618 = v614 + 880 * v615;
    v923 = (void *)(v618 + 400);
    v894 = (uint64_t *)(v618 + 376);
    v890 = (int *)(v618 + 416);
    v892 = (_DWORD *)(v618 + 192);
    v889 = (int *)(v618 + 420);
    v887 = (double *)(v618 + 200);
    v619 = (double *)(v618 + 208);
    v886 = (_OWORD *)(v618 + 248);
    v884 = (_OWORD *)(v618 + 216);
    v881 = (uint64_t *)(v618 + 408);
    v883 = (_OWORD *)(v618 + 232);
    int v620 = *v898;
    v893 = v619;
    do
    {
      int v621 = *(_DWORD *)(*v923 + 4 * v617);
      if (v621 != -1)
      {
        uint64_t v622 = *(void *)(*(void *)(v613 + 320) + 24 * v621 + 8)
             + 4 * *(void *)(*(void *)(v613 + 320) + 24 * v621);
        int v623 = *(_DWORD *)(v622 - 4) & 0x7FFF;
        int v624 = *(_DWORD *)(v613 + 592);
        if (v623 != v624)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 2294, (uint64_t)"_tracker_subpix_refine", "im(%d) != tracker->last_cam(%d)", *(_DWORD *)(v622 - 4) & 0x7FFF, v624);
          __assert_rtn("_tracker_subpix_refine", "slam_tracker_vo.c", 2294, "0");
        }
        unint64_t v625 = *(unsigned int *)(v622 - 8);
        unsigned int v626 = v625 & 0x7FFF;
        if (v623 == v626)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 2295, (uint64_t)"_tracker_subpix_refine", "im(%d)==in_ref(%d)", v625 & 0x7FFF, v625 & 0x7FFF);
          __assert_rtn("_tracker_subpix_refine", "slam_tracker_vo.c", 2295, "0");
        }
        uint64_t v627 = *(void *)(v613 + 376);
        unint64_t v628 = v625 >> 15;
        uint64_t v629 = *(void *)(v613 + 304);
        uint64_t v630 = v629 + 880 * (v625 & 0x7FFF);
        int v631 = *(_DWORD *)(v613 + 88);
        uint64_t v632 = *v894;
        v633 = (float *)(*v894 + 8 * v617);
        uint64_t v634 = *(void *)v633;
        uint64_t v635 = *(void *)(v630 + 376);
        LODWORD(v944) = 0;
        v943[0] = 0.0;
        int v636 = *(_DWORD *)(*(void *)(v630 + 400) + 4 * (v625 >> 15));
        if (v636 != v621)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 2218, (uint64_t)"_tracker_match_subpix_refine", "track[kpt_ref](%d) != trk(%d)", v636, v621);
          __assert_rtn("_tracker_match_subpix_refine", "slam_tracker_vo.c", 2218, "0");
        }
        if (v631 >= 33)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 2219, (uint64_t)"_tracker_match_subpix_refine", "patch_w > max_w");
          __assert_rtn("_tracker_match_subpix_refine", "slam_tracker_vo.c", 2219, "0");
        }
        uint64_t v637 = v631;
        v947 = &v957;
        uint64_t v949 = v631;
        HIDWORD(v948) = v631;
        LODWORD(v948) = v631;
        float32x2_t v638 = vcvt_f32_f64(vsubq_f64(*(float64x2_t *)(v630 + 72), vcvtq_f64_f32(*(float32x2_t *)(v627 + 12 * v621))));
        float v639 = *(double *)(v630 + 88) - *(float *)(v627 + 12 * v621 + 8);
        double v640 = sqrt((float)(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v638, v638).i32[1]), v638.f32[0], v638.f32[0])
                          + (float)(v639 * v639)));
        v939 = v633;
        if (v640 <= 0.0)
        {
          *(double *)&float32x2_t v641 = 0.0;
          float v642 = 0.0;
        }
        else
        {
          float32x2_t v641 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v638), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v640, 0)));
          float v642 = v639 / v640;
        }
        uint64_t v927 = v635;
        v934 = (float *)(v627 + 12 * v621);
        int v914 = v631;
        uint64_t v918 = v632;
        uint64_t v901 = v634;
        memset(v968, 0, sizeof(v968));
        timeval v967 = (timeval)0;
        double v950 = *(double *)&v641;
        float v951 = v642;
        uint64_t v643 = v629 + 880 * v626;
        int v644 = *(_DWORD *)(v643 + 416);
        int v645 = *(_DWORD *)(v643 + 420);
        uint64_t v908 = v643;
        LODWORD(v967.tv_sec) = *(_DWORD *)(v643 + 192);
        uint64_t v646 = v643;
        if ((v967.tv_sec & 0xFFFFFFFC) == 0xC)
        {
          double v647 = *(double *)(v643 + 200);
          double v648 = 1.0 / tan(v647 * 0.5);
          double v649 = *(double *)(v646 + 208) / v647;
        }
        else
        {
          long double v650 = tan(*(double *)(v643 + 200) * 0.5);
          double v648 = (double)v644 / (v650 + v650);
          long double v651 = tan(*(double *)(v646 + 208) * 0.5);
          double v649 = (double)v645 / (v651 + v651);
        }
        *(double *)&v967.tv_usec = v648;
        *(double *)v968 = v649;
        uint64_t v652 = v629 + 880 * v626;
        long long v654 = *(_OWORD *)(v652 + 200);
        uint64_t v653 = v652 + 200;
        *(_OWORD *)((char *)v968 + 8) = v654;
        long long v655 = *(_OWORD *)(v653 + 64);
        *(_OWORD *)((char *)&v968[3] + 8) = *(_OWORD *)(v653 + 48);
        *(_OWORD *)((char *)&v968[4] + 8) = v655;
        long long v656 = *(_OWORD *)(v653 + 80);
        long long v657 = *(_OWORD *)(v653 + 96);
        long long v658 = *(_OWORD *)(v653 + 128);
        *(_OWORD *)((char *)&v968[7] + 8) = *(_OWORD *)(v653 + 112);
        *(_OWORD *)((char *)&v968[8] + 8) = v658;
        *(_OWORD *)((char *)&v968[5] + 8) = v656;
        *(_OWORD *)((char *)&v968[6] + 8) = v657;
        *(_OWORD *)((char *)&v968[1] + 8) = *(_OWORD *)(v653 + 16);
        *(_OWORD *)((char *)&v968[2] + 8) = *(_OWORD *)(v653 + 32);
        *((void *)&v968[9] + 1) = __PAIR64__(v645, v644);
        if (*(double *)(v653 + 8) == 0.0) {
          *(void *)&v968[1] = 0;
        }
        if (*(double *)v653 == 0.0) {
          *((void *)&v968[0] + 1) = 0;
        }
        v659 = (float32x2_t *)(v927 + 8 * v628);
        _jac_patch_to_improj2(v953.f64, v934, (float *)&v950, (double *)v630, (uint64_t)&v967, v659->f32[0], v659->f32[1]);
        float64x2_t v928 = v953;
        float64x2_t v904 = v954;
        int v660 = *v890;
        int v661 = *v889;
        LODWORD(v967.tv_sec) = *v892;
        if ((v967.tv_sec & 0xFFFFFFFC) == 0xC)
        {
          double v662 = *v887;
          double v663 = 1.0 / tan(*v887 * 0.5);
          v664 = v893;
          double v665 = *v893 / v662;
        }
        else
        {
          long double v666 = tan(*v887 * 0.5);
          v664 = v893;
          double v663 = (double)v660 / (v666 + v666);
          long double v667 = tan(*v893 * 0.5);
          double v665 = (double)v661 / (v667 + v667);
        }
        *(double *)&v967.tv_usec = v663;
        *(double *)v968 = v665;
        *(_OWORD *)((char *)v968 + 8) = *(_OWORD *)v887;
        long long v668 = v886[1];
        *(_OWORD *)((char *)&v968[3] + 8) = *v886;
        *(_OWORD *)((char *)&v968[4] + 8) = v668;
        long long v669 = v886[2];
        long long v670 = v886[3];
        long long v671 = v886[5];
        *(_OWORD *)((char *)&v968[7] + 8) = v886[4];
        *(_OWORD *)((char *)&v968[8] + 8) = v671;
        *(_OWORD *)((char *)&v968[5] + 8) = v669;
        *(_OWORD *)((char *)&v968[6] + 8) = v670;
        *(_OWORD *)((char *)&v968[1] + 8) = *v884;
        *(_OWORD *)((char *)&v968[2] + 8) = *v883;
        *((void *)&v968[9] + 1) = __PAIR64__(v661, v660);
        if (*v664 == 0.0) {
          *(void *)&v968[1] = 0;
        }
        if (*v887 == 0.0) {
          *((void *)&v968[0] + 1) = 0;
        }
        _jac_patch_to_improj2(v953.f64, v934, (float *)&v950, *(double **)v896, (uint64_t)&v967, *v939, v939[1]);
        uint64_t v674 = fabs(v953.f64[0] * v954.f64[1] - v954.f64[0] * v953.f64[1]);
        if (v674 <= 0x7FF0000000000000 && v674 != 0x7FF0000000000000 && v674 != 0)
        {
          if (v914 >= 1)
          {
            uint64_t v677 = 0;
            uint64_t v678 = v629 + 880 * v626;
            v679 = (int *)(v908 + 416);
            v680 = (int *)(v908 + 420);
            double v681 = 1.0 / (v953.f64[0] * v954.f64[1] - v954.f64[0] * v953.f64[1]);
            v682 = (uint64_t *)(v678 + 408);
            float32x2_t v683 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)0, v928, v954.f64[1] * v681), v904, -(v953.f64[1] * v681)));
            float32x2_t v684 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)0, v928, -(v954.f64[0] * v681)), v904, v953.f64[0] * v681));
            v685 = (uint64_t *)(v678 + 424);
            float32x2_t v686 = vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*v659), vcvtq_f64_f32(vadd_f32(v683, v684)), (float)((float)v914 + -1.0) * -0.5));
            v687 = &v957;
            do
            {
              uint64_t v688 = *v682;
              uint64_t v689 = *v685;
              v690 = v687;
              uint64_t v691 = v637;
              float32x2_t v692 = v686;
              do
              {
                int v706 = (int)v692.f32[0];
                if ((int)v692.f32[0] < 0)
                {
                  if (v706 != -1)
                  {
                    int v708 = 0;
                    uint64_t v709 = 0;
                    float v710 = v692.f32[1];
                    int v711 = (int)v692.f32[1];
                    if (((int)v692.f32[1] & 0x80000000) == 0) {
                      goto LABEL_556;
                    }
                    goto LABEL_575;
                  }
                  int v708 = 0;
                  int v707 = *v679 - 1;
                }
                else
                {
                  int v707 = *v679 - 1;
                  if (*v679 <= v706) {
                    int v708 = *v679 - 1;
                  }
                  else {
                    int v708 = (int)v692.f32[0];
                  }
                }
                if (v707 <= v706) {
                  LODWORD(v709) = v707;
                }
                else {
                  LODWORD(v709) = v706 + 1;
                }
                uint64_t v709 = (int)v709;
                float v710 = v692.f32[1];
                int v711 = (int)v692.f32[1];
                if (((int)v692.f32[1] & 0x80000000) == 0)
                {
LABEL_556:
                  int v693 = *v680 - 1;
                  if (*v680 <= v711) {
                    int v694 = *v680 - 1;
                  }
                  else {
                    int v694 = v711;
                  }
                  goto LABEL_559;
                }
LABEL_575:
                if (v711 != -1)
                {
                  int v694 = 0;
                  uint64_t v695 = 0;
                  goto LABEL_563;
                }
                int v694 = 0;
                int v693 = *v680 - 1;
LABEL_559:
                if (v693 <= v711) {
                  LODWORD(v695) = v693;
                }
                else {
                  LODWORD(v695) = v711 + 1;
                }
                uint64_t v695 = (int)v695;
LABEL_563:
                *(float *)&unsigned int v696 = (float)v694;
                float v697 = v710 - (float)v694;
                uint64_t v698 = v695 * v689;
                LOBYTE(v696) = *(unsigned char *)(v688 + v698 + v708);
                float v699 = (float)v696;
                uint64_t v700 = v689 * v694;
                LOBYTE(v672) = *(unsigned char *)(v688 + v700 + v708);
                float v672 = (float)LODWORD(v672);
                float v701 = v699 - v672;
                LOBYTE(v673) = *(unsigned char *)(v688 + v698 + v709);
                *(float *)&unsigned int v702 = v672 + (float)LODWORD(v673);
                float v703 = *(float *)&v702 - v699;
                LOBYTE(v702) = *(unsigned char *)(v688 + v700 + v709);
                float v704 = (float)v702;
                float v705 = v703 - v704;
                float v673 = v704 - v672;
                LOBYTE(v690->tv_sec) = (int)(float)((float)((float)((float)((float)(v692.f32[0] - (float)v708) * v673)
                                                                  + (float)((float)((float)(v692.f32[0] - (float)v708)
                                                                                  * v697)
                                                                          * v705))
                                                          + (float)(v697 * v701))
                                                  + v672);
                v690 = (timeval *)((char *)v690 + 1);
                float32x2_t v692 = vadd_f32(v692, v683);
                --v691;
              }
              while (v691);
              float32x2_t v686 = vadd_f32(v686, v684);
              ++v677;
              v687 = (timeval *)((char *)v687 + v637);
            }
            while (v677 != v637);
          }
          uint64_t v712 = v918 + 8 * v617;
          float v713 = p_klt(v881, (uint64_t *)&v947, (float *)&v944, v943, 5, *v939, *(float *)(v712 + 4)).n64_f32[0];
          float *v939 = *(float *)&v944;
          *(float *)(v712 + 4) = v943[0];
          if (v713 > 1000000.0) {
            *(void *)v939 = v901;
          }
        }
        int v620 = *v898;
        uint64_t v613 = a1;
      }
      ++v617;
      uint64_t v616 = v620;
    }
    while (v617 < v620);
    int v615 = v877;
    uint64_t v614 = v879;
  }
  uint64_t v714 = v614 + 880 * v615;
  memcpy(*(void **)(v714 + 368), *(const void **)(v714 + 376), 8 * v616);
  int v715 = *(_DWORD *)(v714 + 480);
  int v716 = *(_DWORD *)(v714 + 484);
  LODWORD(v945) = *(_DWORD *)(v714 + 192);
  if ((v945 & 0xFFFFFFFC) == 0xC)
  {
    double v717 = *(double *)(v714 + 200);
    double v718 = 1.0 / tan(v717 * 0.5);
    double v719 = *(double *)(v714 + 208) / v717;
  }
  else
  {
    long double v720 = tan(*(double *)(v714 + 200) * 0.5);
    double v718 = (double)v715 / (v720 + v720);
    long double v721 = tan(*(double *)(v714 + 208) * 0.5);
    double v719 = (double)v716 / (v721 + v721);
  }
  *((double *)&v945 + 1) = v718;
  *(double *)v946 = v719;
  uint64_t v722 = v614 + 880 * v615;
  long long v724 = *(_OWORD *)(v722 + 200);
  uint64_t v723 = v722 + 200;
  *(_OWORD *)((char *)v946 + 8) = v724;
  long long v725 = *(_OWORD *)(v723 + 48);
  *(_OWORD *)((char *)&v946[4] + 8) = *(_OWORD *)(v723 + 64);
  *(_OWORD *)((char *)&v946[3] + 8) = v725;
  long long v726 = *(_OWORD *)(v723 + 80);
  long long v727 = *(_OWORD *)(v723 + 96);
  long long v728 = *(_OWORD *)(v723 + 112);
  *(_OWORD *)((char *)&v946[8] + 8) = *(_OWORD *)(v723 + 128);
  *(_OWORD *)((char *)&v946[7] + 8) = v728;
  *(_OWORD *)((char *)&v946[6] + 8) = v727;
  *(_OWORD *)((char *)&v946[5] + 8) = v726;
  *(_OWORD *)((char *)&v946[1] + 8) = *(_OWORD *)(v723 + 16);
  *(_OWORD *)((char *)&v946[2] + 8) = *(_OWORD *)(v723 + 32);
  *((void *)&v946[9] + 1) = __PAIR64__(v716, v715);
  if (*(double *)(v723 + 8) == 0.0) {
    *(void *)&v946[1] = 0;
  }
  if (*(double *)v723 == 0.0) {
    *((void *)&v946[0] + 1) = 0;
  }
  rectify_pts((uint64_t)&v945, *(float32x2_t **)(v714 + 368), *v898, (float *)(v614 + 880 * v615 + 344));
  *(void *)&v957.tv_usec = 0;
  v957.__darwin_time_t tv_sec = 0;
  if (gettimeofday(&v957, 0) || (double)(v957.tv_usec + 1000000 * v957.tv_sec) / 1000000.0 <= 1514764800.0) {
    goto LABEL_700;
  }
  uint64_t v613 = a1;
LABEL_596:
  if (*(int *)(v613 + 128) >= 1)
  {
    int v729 = 0;
    do
    {
      if (*(int *)(v613 + 588) < 2 || *(int *)(v613 + 952) > 3) {
        break;
      }
      float v730 = tracker_bundle(a1, v852, *(_DWORD *)(v613 + 140));
      uint64_t v613 = a1;
      int v731 = LODWORD(v730) & 0x7FFFFFFF;
      BOOL v732 = (LODWORD(v730) & 0x7FFFFFFFu) > 0x7F800000 || v731 == 2139095040;
      if (v732 || v731 == 0) {
        break;
      }
      int64_t v734 = *(void *)(a1 + 368);
      uint64_t v735 = *(void *)(a1 + 312);
      if (v734 < v735) {
        uint64_t v735 = *(void *)(a1 + 368);
      }
      if (v735 >= 1)
      {
        int v935 = v729;
        int64_t v736 = 0;
        uint64_t v737 = a1;
        v738 = (float *)(v841 + 880 * v842 + 360);
        do
        {
          uint64_t v740 = *(void *)(v737 + 320);
          v741 = (uint64_t *)(v740 + 24 * v736);
          float v742 = *(float *)(v737 + 40) * *v738;
          uint64_t v743 = *v741;
          if ((int)*v741 >= 2) {
            float v742 = v742 * (float)((float)(int)v743 / (float)((float)(int)v743 + -1.0));
          }
          if (v743 < 1)
          {
            int v744 = 0;
          }
          else
          {
            int v744 = 0;
            v745 = *(unsigned int **)(v740 + 24 * v736 + 8);
            uint64_t v746 = *(void *)(v737 + 304);
            double v747 = *(float *)(*(void *)(v737 + 376) + 12 * v736);
            uint64_t v748 = *(void *)(v737 + 376) + 12 * v736;
            double v749 = *(float *)(v748 + 4);
            double v750 = *(float *)(v748 + 8);
            float v751 = v742 * v742;
            v752 = v745;
            uint64_t v753 = *v741;
            do
            {
              while (1)
              {
                unsigned int v755 = *v752++;
                unsigned int v754 = v755;
                unsigned int v756 = v755 & 0x7FFF;
                unint64_t v757 = (unint64_t)v755 >> 15;
                v758 = (double *)(v746 + 880 * (v755 & 0x7FFF));
                double v759 = v747 - v758[9];
                double v760 = v749 - v758[10];
                double v761 = v750 - v758[11];
                float v762 = v758[3] * v760 + *v758 * v759 + v758[6] * v761;
                if (v762 > 0.0)
                {
                  double v763 = v758[4];
                  double v764 = v758[1];
                  double v765 = v758[7];
                  double v766 = v760 * v758[5] + v758[2] * v759 + v758[8] * v761;
                  v767 = (float *)(*(void *)(v746 + 880 * v756 + 368) + 8 * v757);
                  *(float *)&double v766 = v766;
                  float v768 = v760 * v763 + v764 * v759 + v765 * v761;
                  if ((float)((float)((float)((float)(*(float *)&v766 / v762) - v767[1])
                                     * (float)((float)(*(float *)&v766 / v762) - v767[1]))
                             + (float)((float)((float)(v768 / v762) - *v767) * (float)((float)(v768 / v762) - *v767))) < v751)
                    break;
                }
                *(_DWORD *)(*(void *)(v746 + 880 * v756 + 400) + 4 * v757) = -1;
                if (!--v753) {
                  goto LABEL_625;
                }
              }
              v745[v744++] = v754;
              --v753;
            }
            while (v753);
          }
LABEL_625:
          uint64_t v769 = v744;
          uint64_t v770 = v740 + 24 * v736;
          uint64_t v773 = *(void *)(v770 + 16);
          v772 = (uint64_t *)(v770 + 16);
          uint64_t v771 = v773;
          if (v773 < v769)
          {
            uint64_t v774 = 2 * v771;
            _ZF = v771 == 0;
            uint64_t v775 = 64;
            if (!_ZF) {
              uint64_t v775 = v774;
            }
            if (v775 <= v769) {
              uint64_t v776 = v769;
            }
            else {
              uint64_t v776 = v775;
            }
            if (v776)
            {
              *(void *)(v740 + 24 * v736 + 8) = malloc_type_realloc(*(void **)(v740 + 24 * v736 + 8), 4 * v776, 0xD0B74C21uLL);
              uint64_t v737 = a1;
              v738 = (float *)(v841 + 880 * v842 + 360);
            }
            uint64_t *v772 = v776;
          }
          if (v769 > v743)
          {
            bzero((void *)(*(void *)(v740 + 24 * v736 + 8) + 4 * *v741), 4 * (v769 - v743));
            uint64_t v737 = a1;
          }
          uint64_t *v741 = v769;
          ++v736;
          int64_t v734 = *(void *)(v737 + 368);
          int64_t v739 = *(void *)(v737 + 312);
          if (v734 < v739) {
            int64_t v739 = *(void *)(v737 + 368);
          }
        }
        while (v736 < v739);
        int v729 = v935;
      }
      uint64_t v777 = *(int *)(a1 + 260);
      int v778 = *(_DWORD *)(a1 + 592);
      int v779 = *(_DWORD *)a1;
      v780 = (unsigned __int8 *)malloc_type_malloc(v734, 0xD7518E5FuLL);
      v781 = v780;
      if (*(uint64_t *)(a1 + 312) >= 1)
      {
        uint64_t v782 = 0;
        uint64_t v783 = 0;
        do
        {
          uint64_t v787 = *(void *)(a1 + 320);
          uint64_t v788 = *(void *)(v787 + v782);
          if (v788) {
            int v784 = **(_DWORD **)(v787 + v782 + 8) & 0x7FFF;
          }
          else {
            int v784 = -1;
          }
          BOOL v786 = v788 < v777 && v784 != (v778 + 1) % v779;
          v780[v783++] = v786;
          v782 += 24;
        }
        while (*v852 > v783);
      }
      remove_map_points(a1, v780);
      free(v781);
      uint64_t v613 = a1;
      ++v729;
    }
    while (v729 < *(_DWORD *)(a1 + 128));
  }
  if (*(_DWORD *)(v613 + 300))
  {
    uint64_t v789 = *v852;
    if (*v852)
    {
      if (v789 < 1)
      {
        float v792 = 0.0;
        uint64_t v793 = *(void *)(v613 + 928);
        uint64_t v794 = *(void *)(v613 + 944);
        if (v793 >= v794) {
          goto LABEL_664;
        }
      }
      else
      {
        if ((unint64_t)v789 >= 9)
        {
          uint64_t v795 = *v852 & 7;
          if ((v789 & 7) == 0) {
            uint64_t v795 = 8;
          }
          uint64_t v790 = v789 - v795;
          int32x4_t v796 = 0uLL;
          uint64_t v797 = v790;
          v798 = *(const double **)(v613 + 320);
          int32x4_t v799 = 0uLL;
          do
          {
            v800 = v798 + 12;
            v801 = v798;
            unsigned long long v802 = (unsigned __int128)vld3q_f64(v801);
            v801 += 6;
            unsigned long long v803 = (unsigned __int128)vld3q_f64(v801);
            unsigned long long v804 = (unsigned __int128)vld3q_f64(v800);
            v805 = v798 + 18;
            unsigned long long v806 = (unsigned __int128)vld3q_f64(v805);
            int32x4_t v796 = vaddq_s32(v796, vuzp1q_s32((int32x4_t)v802, (int32x4_t)v803));
            int32x4_t v799 = vaddq_s32(v799, vuzp1q_s32((int32x4_t)v804, (int32x4_t)v806));
            v798 += 24;
            v797 -= 8;
          }
          while (v797);
          int v791 = vaddvq_s32(vaddq_s32(v799, v796));
        }
        else
        {
          uint64_t v790 = 0;
          int v791 = 0;
        }
        uint64_t v807 = v789 - v790;
        v808 = (int *)(*(void *)(v613 + 320) + 24 * v790);
        do
        {
          int v809 = *v808;
          v808 += 6;
          v791 += v809;
          --v807;
        }
        while (v807);
        float v792 = (float)v791;
        uint64_t v793 = *(void *)(v613 + 928);
        uint64_t v794 = *(void *)(v613 + 944);
        if (v793 >= v794)
        {
LABEL_664:
          uint64_t v810 = 2 * v794;
          _ZF = v794 == 0;
          uint64_t v811 = 64;
          if (!_ZF) {
            uint64_t v811 = v810;
          }
          if (v811 <= v793) {
            uint64_t v812 = v793 + 1;
          }
          else {
            uint64_t v812 = v811;
          }
          if (v812)
          {
            *(void *)(a1 + 936) = malloc_type_realloc(*(void **)(a1 + 936), 4 * v812, 0xCAFCB628uLL);
            uint64_t v613 = a1;
            uint64_t v793 = *(void *)(a1 + 928);
            uint64_t v789 = *(void *)(a1 + 312);
          }
          *(void *)(v613 + 944) = v812;
        }
      }
      *(void *)(v613 + 928) = v793 + 1;
      *(float *)(*(void *)(v613 + 936) + 4 * v793) = v792 / (float)v789;
    }
  }
  double v813 = *(double *)(*(void *)(v613 + 304) + 880 * *(int *)(v613 + 592) + 504);
  if (v813 > *(double *)(v613 + 600) + *(double *)(v613 + 8))
  {
    if (*(int *)(v613 + 588) >= 1)
    {
      uint64_t v814 = 0;
      uint64_t v815 = 0;
      do
      {
        g_norm_rot3((double *)(*(void *)(v613 + 304) + v814));
        uint64_t v613 = a1;
        ++v815;
        v814 += 880;
      }
      while (v815 < *(int *)(a1 + 588));
      double v813 = *(double *)(*(void *)(a1 + 304) + 880 * *(int *)(a1 + 592) + 504);
    }
    *(double *)(v613 + 600) = v813;
  }
  int v816 = *(_DWORD *)(v613 + 296);
  if (v816 != -1 && (v816 & 0x80000000) == 0 && *(_DWORD *)(v613 + 588) > *(_DWORD *)(v613 + 140))
  {
    int v817 = -1;
    do
      ++v817;
    while (v817 < v816);
  }
  float v818 = *(float *)(v613 + 288);
  if (v818 > 0.0)
  {
    uint64_t v819 = *(void *)(v613 + 304);
    int v820 = *(_DWORD *)(v613 + 592);
    uint64_t v821 = *(unsigned int *)(v819 + 880 * v820 + 488);
    if ((int)v821 < 1)
    {
      if ((float)(v818 * (float)(int)v821) > 0.0) {
        goto LABEL_696;
      }
    }
    else
    {
      v822 = *(int32x4_t **)(v819 + 880 * v820 + 400);
      if (v821 < 8)
      {
        uint64_t v823 = 0;
        int v824 = 0;
        goto LABEL_693;
      }
      uint64_t v823 = v821 & 0x7FFFFFF8;
      v825 = v822 + 1;
      int32x4_t v826 = 0uLL;
      v827.i64[0] = -1;
      v827.i64[1] = -1;
      uint64_t v828 = v821 & 0xFFFFFFF8;
      int32x4_t v829 = 0uLL;
      do
      {
        int32x4_t v826 = vsubq_s32(v826, vcgtq_s32(v825[-1], v827));
        int32x4_t v829 = vsubq_s32(v829, vcgtq_s32(*v825, v827));
        v825 += 2;
        v828 -= 8;
      }
      while (v828);
      int v824 = vaddvq_s32(vaddq_s32(v829, v826));
      if (v823 != v821)
      {
LABEL_693:
        uint64_t v830 = v821 - v823;
        v831 = &v822->i32[v823];
        do
        {
          int v832 = *v831++;
          v824 += v832 >= 0;
          --v830;
        }
        while (v830);
      }
      if ((float)(v818 * (float)(int)v821) > (float)v824) {
LABEL_696:
      }
        *(_DWORD *)(v819 + 880 * v820 + 872) = 1;
    }
  }
  *(void *)&v957.tv_usec = 0;
  v957.__darwin_time_t tv_sec = 0;
  if (gettimeofday(&v957, 0) || (double)(v957.tv_usec + 1000000 * v957.tv_sec) / 1000000.0 <= 1514764800.0) {
LABEL_700:
  }
    __assert_rtn("u_timel", "arch_dtime.c", 118, "ret == 0 && result/1e6 > 1514764800L");
  return *(void *)(a1 + 304) + 880 * *(int *)(a1 + 592);
}

float tracker_bundle(uint64_t a1, void *a2, int a3)
{
  uint64_t v448 = *MEMORY[0x263EF8340];
  size_t v3 = *(unsigned int *)(a1 + 588);
  float v4 = 0.0;
  if ((int)v3 < 2) {
    return v4;
  }
  int v5 = *(_DWORD *)(a1 + 132);
  int v425 = 0;
  uint64_t v6 = a2[7];
  int v7 = (v5 << 31 >> 31) & a3;
  int v8 = a3;
  int v9 = a3 & (v5 << 30 >> 31);
  int v10 = a3 & (v5 << 29 >> 31);
  int v11 = a3 & (v5 << 28 >> 31);
  int v12 = v5 << 26;
  if ((v5 & 0x10) != 0) {
    unsigned int v13 = 2 * v3 + 3;
  }
  else {
    unsigned int v13 = v3;
  }
  int v385 = v10;
  int v377 = v11;
  int v375 = (a3 + 1) & (v12 >> 31);
  int v14 = v7 + v9 + v10 + v11 + v375;
  if (v375) {
    uint64_t v15 = v13 + 1;
  }
  else {
    uint64_t v15 = v13;
  }
  double v379 = (char *)malloc_type_malloc(48 * v3, 0x1000040EED21634uLL);
  uint64_t v376 = v15;
  uint64_t v383 = v6;
  double v384 = (int32x2_t *)malloc_type_malloc(32 * (int)v15, 0x1080040D47BEB4BuLL);
  uint64_t v16 = (void **)malloc_type_calloc((int)v6, 0x50uLL, 0x10B00409D415480uLL);
  float64x2_t v17 = (unsigned __int8 *)malloc_type_malloc(v3, 0x100004077774924uLL);
  uint64_t v374 = (int)v6;
  double v18 = malloc_type_calloc((int)v6, 1uLL, 0x100004077774924uLL);
  uint64_t v19 = v14;
  double v20 = (void **)malloc_type_calloc(v14, 0x50uLL, 0x1080040DF7CDACAuLL);
  long long v420 = 0u;
  uint64_t v421 = 0;
  int v423 = 0;
  *(void *)((char *)&v420 + 4) = 0x100000005;
  uint64_t v422 = 0x7F8000003727C5ACLL;
  int32x2_t v424 = vdup_n_s32(0x7F800000u);
  uint64_t v429 = 0;
  int v430 = 0;
  long long v428 = 0uLL;
  long long v426 = 0uLL;
  int v427 = 0;
  int v381 = v8;
  if (!(v14 + v6))
  {
    double v21 = v379;
    uint64_t v22 = v20;
    uint64_t v23 = v384;
    if ((int)v6 < 1) {
      goto LABEL_196;
    }
LABEL_193:
    uint64_t v352 = v6;
    int v353 = v16 + 4;
    do
    {
      free(*(v353 - 3));
      int v354 = *v353;
      v353 += 10;
      free(v354);
      --v352;
    }
    while (v352);
    int v8 = v381;
    goto LABEL_196;
  }
  uint64_t v378 = v6;
  uint64_t v373 = v14;
  int v24 = v8;
  uint64_t v380 = (uint64_t)v20;
  int v403 = v7;
  uint64_t v25 = (char *)&v20[10 * v7];
  double v397 = &v25[80 * v9];
  if (v24 >= (int)v3) {
    int v26 = v3;
  }
  else {
    int v26 = v24;
  }
  memset(v17, 1, v3);
  uint64_t v27 = a1;
  size_t v28 = v3;
  int v29 = v9;
  if (v26 >= 1)
  {
    int v30 = 0;
    do
      v17[((int)v3 + v30-- + *(_DWORD *)(a1 + 592)) % (int)v3] = 0;
    while (-v26 != v30);
  }
  int v31 = a2;
  v17[(*(_DWORD *)(a1 + 592) + 1) % (int)v28] = 1;
  uint64_t v23 = v384;
  int v32 = v7;
  if ((int)v378 >= 1)
  {
    for (uint64_t i = 0; i != v383; ++i)
    {
      uint64_t v34 = a2[1];
      unsigned int v35 = (uint64_t *)(v34 + 24 * i);
      uint64_t v36 = *v35;
      if (*v35 > 1 || (v18[i] = 1, uint64_t v36 = *v35, *v35 >= 1))
      {
        int v37 = *(_DWORD **)(v34 + 24 * i + 8);
        if (!v17[*v37 & 0x7FFF]) {
          continue;
        }
        uint64_t v38 = 0;
        int v39 = v37 + 1;
        while (v36 - 1 != v38)
        {
          if (!v17[v39[v38++] & 0x7FFF])
          {
            if (v36 <= v38) {
              break;
            }
            goto LABEL_20;
          }
        }
      }
      v18[i] = 1;
LABEL_20:
      ;
    }
  }
  uint64_t v41 = 0;
  uint64_t v42 = (float32x4_t *)v379;
  uint64_t v408 = (uint64_t)&v397[80 * v385 + 80 * v377];
  uint64_t v43 = (float64x2_t *)(*(void *)(a1 + 304) + 64);
  uint64_t v44 = v17;
  do
  {
    float32x4_t *v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v43[-4]), v43[-3]);
    v42[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v43[-2]), v43[-1]);
    float64x2_t v46 = *v43;
    float64x2_t v45 = v43[1];
    v43 += 55;
    v42[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v46), v45);
    int v47 = &v384[v41];
    *int v47 = (int32x2_t)v42;
    v47[1].i32[0] = 48;
    if (*v44++) {
      int v49 = 0;
    }
    else {
      int v49 = 6;
    }
    v47[2].i32[0] = v49;
    v47[3] = (int32x2_t)bon_upd_cs;
    v41 += 4;
    v42 += 3;
  }
  while (4 * v28 != v41);
  float v401 = v17;
  double v382 = v18;
  BOOL v387 = v16;
  size_t v395 = v28;
  if (v29 >= 1)
  {
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    int v52 = 0;
    float v53 = 1.0 / *(float *)(a1 + 164);
    float v54 = 1.0 / *(float *)(a1 + 168);
    do
    {
      if (!v401[v51])
      {
        uint64_t v62 = *(void *)(v27 + 304);
        if (!*(_DWORD *)(v27 + 136) || !*(_DWORD *)(v62 + v50 + 520))
        {
          *(void *)&v25[80 * v52] = bon_eval_fnc_abspose;
          double v63 = &v25[80 * v52];
          *((_DWORD *)v63 + 5) = -1;
          *((_DWORD *)v63 + 6) = v51;
          *((_DWORD *)v63 + 16) = 1;
          double v64 = (char *)malloc_type_malloc(0x54uLL, 0xD0C59E7EuLL);
          *(float *)double v64 = v53;
          *((_DWORD *)v64 + 1) = 0;
          *((float *)v64 + 2) = v53;
          *(void *)(v64 + 12) = 0;
          *((float *)v64 + 5) = v53;
          *((void *)v64 + 3) = 0;
          *((_DWORD *)v64 + 8) = 0;
          *((float *)v64 + 9) = v54;
          *((void *)v64 + 5) = 0;
          *((void *)v64 + 6) = 0;
          *((float *)v64 + 14) = v54;
          *(void *)(v64 + 68) = 0;
          *(void *)(v64 + 60) = 0;
          *((_DWORD *)v64 + 19) = 0;
          *((float *)v64 + 20) = v54;
          *((void *)v63 + 9) = v64;
          *((_DWORD *)v63 + 4) = 6;
          int v65 = (float32x2_t *)malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL);
          *((void *)v63 + 1) = v65;
          float32_t v66 = *(double *)(v62 + v50 + 184);
          double v67 = *(double *)(v62 + v50 + 152);
          float v68 = *(double *)(v62 + v50 + 144);
          double v69 = *(double *)(v62 + v50 + 96);
          double v70 = *(double *)(v62 + v50 + 104);
          double v72 = *(double *)(v62 + v50 + 112);
          double v71 = *(double *)(v62 + v50 + 120);
          double v73 = *(double *)(v62 + v50 + 160);
          *int v65 = vcvt_f32_f64(*(float64x2_t *)(v62 + v50 + 168));
          v65[1].f32[0] = v66;
          if (fabsf(v68) < 1.0)
          {
            float v55 = v73;
            float v56 = v67;
            float v57 = v71;
            float v58 = v69;
            float v59 = asinf(-v68);
            float v60 = atan2f(v57, v58);
            float v61 = atan2f(v56, v55);
          }
          else
          {
            float v74 = v70;
            float v75 = v72;
            if (v68 <= -1.0)
            {
              float v60 = 0.0;
              float v61 = atan2f(v74, v75) + 0.0;
              *(float *)&int v76 = 1.5708;
            }
            else
            {
              float v61 = atan2f(-v74, -v75);
              float v60 = 0.0;
              *(float *)&int v76 = -1.5708;
            }
            float v59 = *(float *)&v76;
          }
          int v32 = v403;
          v65[1].f32[1] = v60;
          v65[2].f32[0] = v59;
          ++v52;
          v65[2].f32[1] = v61;
          uint64_t v27 = a1;
          size_t v28 = v395;
        }
      }
      ++v51;
      v50 += 880;
    }
    while (v28 != v51);
    BOOL v358 = v52 <= v381;
    int v31 = a2;
    float64x2_t v17 = v401;
    uint64_t v23 = v384;
    if (!v358)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1369, (uint64_t)"tracker_bundle_bon", "term_index > n_cam_opt");
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1369, "0");
    }
  }
  if (v32 >= 1)
  {
    int v77 = 0;
    uint64_t v78 = 0;
    int v79 = 0;
    long long v80 = 0uLL;
    float32x4_t v432 = 0u;
    memset(v431, 0, sizeof(v431));
    float32x4_t v418 = 0u;
    float32x4_t v419 = 0u;
    float32x4_t v417 = 0u;
    uint64_t v429 = 0;
    int v430 = 0;
    long long v428 = 0uLL;
    long long v426 = 0uLL;
    int v427 = 0;
    float v392 = 1.0 / *(float *)(v27 + 192);
    float v389 = 1.0 / *(float *)(v27 + 188);
    float v81 = 1.0 / *(float *)(v27 + 184);
    float v82 = 1.0 / *(float *)(v27 + 172);
    float v83 = 1.0 / *(float *)(v27 + 176);
    size_t v84 = v28;
    float v85 = 1.0 / *(float *)(v27 + 180);
    do
    {
      while (1)
      {
        int v86 = (v77 + *(_DWORD *)(v27 + 588) - 1) % *(_DWORD *)(v27 + 588);
        uint64_t v87 = *(void *)(v27 + 304);
        int v88 = v86;
        long long v415 = v80;
        long long v416 = v80;
        long long v414 = v80;
        double v89 = *(double *)(v87 + v78 + 504);
        double v90 = *(double *)(v87 + 880 * v86 + 504);
        int v91 = *v17++;
        if ((!v91 || !v401[v86])
          && v86 != *(_DWORD *)(v27 + 592)
          && (!*(_DWORD *)(v27 + 136) || !*(_DWORD *)(v87 + v78 + 520)))
        {
          break;
        }
        size_t v28 = v395;
        v78 += 880;
        ++v77;
        if (!--v84) {
          goto LABEL_71;
        }
      }
      double v92 = v89 - v90;
      if (*(_DWORD *)(v27 + 240) && v92 <= 0.0)
      {
        log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1392, (uint64_t)"tracker_bundle_bon", "Negative time detected, dt: %f", v89 - v90);
        __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1392, "0");
      }
      int v404 = v79;
      *(void *)(v380 + 80 * v79) = bon_eval_fnc_relpose;
      uint64_t v93 = v380 + 80 * v79;
      *(_DWORD *)(v93 + 20) = -1;
      *(_DWORD *)(v93 + 24) = v86;
      *(_DWORD *)(v93 + 28) = v77;
      *(_DWORD *)(v93 + 64) = 2;
      double v94 = (char *)malloc_type_malloc(0x54uLL, 0xD0C59E7EuLL);
      *(float *)double v94 = v392;
      *((_DWORD *)v94 + 1) = 0;
      *((float *)v94 + 2) = v389;
      *(void *)(v94 + 12) = 0;
      *((float *)v94 + 5) = v81;
      *((void *)v94 + 3) = v429;
      *((_DWORD *)v94 + 8) = v430;
      *((float *)v94 + 9) = v82;
      *(_OWORD *)(v94 + 40) = v428;
      *((float *)v94 + 14) = v83;
      *(_OWORD *)(v94 + 60) = v426;
      *((_DWORD *)v94 + 19) = v427;
      *((float *)v94 + 20) = v85;
      *(void *)(v93 + 72) = v94;
      uint64_t v95 = (float32x2_t **)(v93 + 72);
      *((_DWORD *)v95 - 14) = 6;
      *(v95 - 8) = (float32x2_t *)malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL);
      uint64_t v96 = (float64x2_t *)(v87 + 880 * v88);
      v431[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v96[6]), v96[7]);
      v431[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v96[8]), v96[9]);
      float32x4_t v432 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v96[10]), v96[11]);
      float32x4_t v417 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v87 + v78 + 96)), *(float64x2_t *)(v87 + v78 + 112));
      float32x4_t v418 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v87 + v78 + 128)), *(float64x2_t *)(v87 + v78 + 144));
      float32x4_t v419 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v87 + v78 + 160)), *(float64x2_t *)(v87 + v78 + 176));
      g_coordsf_diff((uint64_t)&v417, (uint64_t)v431, (uint64_t)&v414);
      uint64_t v97 = (uint64_t)*(v95 - 8);
      *(void *)uint64_t v97 = *(void *)((char *)&v416 + 4);
      *(_DWORD *)(v97 + 8) = HIDWORD(v416);
      if (fabsf(*((float *)&v415 + 2)) >= 1.0)
      {
        if (*((float *)&v415 + 2) <= -1.0)
        {
          float v99 = 0.0;
          *(float *)&double v89 = atan2f(*((float *)&v414 + 1), *((float *)&v414 + 2)) + 0.0;
          *(float *)&int v100 = 1.5708;
        }
        else
        {
          *(float *)&double v89 = atan2f(-*((float *)&v414 + 1), -*((float *)&v414 + 2));
          float v99 = 0.0;
          *(float *)&int v100 = -1.5708;
        }
        float v98 = *(float *)&v100;
      }
      else
      {
        float v98 = asinf(-*((float *)&v415 + 2));
        float v99 = atan2f(*((float *)&v414 + 3), *(float *)&v414);
        *(float *)&double v89 = atan2f(*((float *)&v415 + 3), *(float *)&v416);
      }
      *(float *)(v97 + 12) = v99;
      *(float *)(v97 + 16) = v98;
      *(_DWORD *)(v97 + 20) = LODWORD(v89);
      uint64_t v27 = a1;
      long long v80 = 0uLL;
      if (*(_DWORD *)(v87 + v78 + 516))
      {
        LODWORD(v89) = *(_DWORD *)(a1 + 208);
        if (*(float *)&v89 > 0.0)
        {
          timeval v101 = *v95;
          v101->f32[0] = 1.0 / *(float *)(a1 + 228);
          v101[1].f32[0] = 1.0 / *(float *)(a1 + 224);
          v101[2].f32[1] = 1.0 / *(float *)(a1 + 220);
          v101[4].f32[1] = 1.0 / *(float *)(a1 + 208);
          v101[7].f32[0] = 1.0 / *(float *)(a1 + 212);
          *(float *)&double v89 = 1.0 / *(float *)(a1 + 216);
          v101[10].i32[0] = LODWORD(v89);
        }
      }
      size_t v28 = v395;
      if (*(_DWORD *)(a1 + 240))
      {
        timeval v102 = *v95;
        float32x4_t v103 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((*v95)[2]), 1.0 / v92)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)(*v95)[2].f32), 1.0 / v92));
        *(float32x4_t *)v102->f32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(**v95), 1.0 / v92)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)(*v95)->f32), 1.0 / v92));
        *(float32x4_t *)v102[2].f32 = v103;
        float32x4_t v104 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v102[6]), 1.0 / v92)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)v102[6].f32), 1.0 / v92));
        *(float32x4_t *)v102[4].f32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v102[4]), 1.0 / v92)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)v102[4].f32), 1.0 / v92));
        *(float32x4_t *)v102[6].f32 = v104;
        *(float32x4_t *)v102[8].f32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v102[8]), 1.0 / v92)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)v102[8].f32), 1.0 / v92));
        double v90 = v102[10].f32[0];
        double v89 = 1.0 / v92 * v90;
        *(float *)&double v89 = v89;
        v102[10].i32[0] = LODWORD(v89);
      }
      int v79 = v404 + 1;
      int v31 = a2;
      v78 += 880;
      ++v77;
      --v84;
    }
    while (v84);
LABEL_71:
    if (v79 > v381)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1418, (uint64_t)"tracker_bundle_bon", "term_index > n_cam_opt", v89, v90);
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1418, "0");
    }
    float64x2_t v17 = v401;
    uint64_t v16 = v387;
  }
  uint64_t v105 = v378 << 32;
  double v106 = &v397[80 * v385];
  if ((int)v28 >= 4 && v377)
  {
    int v107 = 0;
    float v108 = 1.0 / *(float *)(v27 + 196);
    float v109 = 1.0 / *(float *)(v27 + 200);
    int v110 = 3;
    float v111 = 1.0 / *(float *)(v27 + 204);
    do
    {
      int v120 = v28;
      timeval v121 = &v106[80 * v107];
      int v122 = (v110 + *(_DWORD *)(v27 + 592) - 2) % v120;
      *((_DWORD *)v121 + 6) = v122;
      int v123 = (v122 + 1) % v120;
      *((_DWORD *)v121 + 7) = v123;
      int v124 = (v122 + 2) % v120;
      *((_DWORD *)v121 + 8) = v124;
      int v125 = (v122 + 3) % v120;
      *((_DWORD *)v121 + 9) = v125;
      if (!v401[v122] || !v401[v123] || !v401[v124] || !v401[v125])
      {
        float64x2_t v112 = &v106[80 * v107];
        *((_DWORD *)v112 + 16) = 4;
        *((_DWORD *)v112 + 5) = -1;
        __double2 v113 = (char *)malloc_type_malloc(0x18uLL, 0xD0C59E7EuLL);
        *(float *)__double2 v113 = v108;
        *((_DWORD *)v113 + 1) = 0;
        *((float *)v113 + 2) = v109;
        *(void *)(v113 + 12) = 0;
        *((float *)v113 + 5) = v111;
        *((void *)v112 + 9) = v113;
        *((_DWORD *)v112 + 4) = 3;
        *(void *)timeval v121 = bon_eval_acc;
        __double2 v114 = (float *)malloc_type_malloc(0xCuLL, 0x100004052888210uLL);
        double v106 = &v397[80 * v385];
        uint64_t v27 = a1;
        *((void *)v112 + 1) = v114;
        uint64_t v105 = v378 << 32;
        uint64_t v115 = *(void *)(a1 + 304);
        double v116 = *(double *)(v115 + 880 * *((int *)v121 + 6) + 504);
        float v117 = *(double *)(v115 + 880 * *((int *)v121 + 7) + 504) - v116;
        *__double2 v114 = v117;
        float v118 = *(double *)(v115 + 880 * *((int *)v121 + 8) + 504) - v116;
        v114[1] = v118;
        float v119 = *(double *)(v115 + 880 * *((int *)v121 + 9) + 504) - v116;
        v114[2] = v119;
        ++v107;
      }
      ++v110;
      size_t v28 = v395;
    }
    while (v395 != v110);
    int v31 = a2;
    float64x2_t v17 = v401;
    uint64_t v23 = v384;
    uint64_t v16 = v387;
    if (v107 > v381)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1455, (uint64_t)"tracker_bundle_bon", "term_index > n_cam_opt");
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1455, "0");
    }
  }
  if (v375)
  {
    int v126 = 0;
    int v127 = 0;
    int v128 = v376 - 1;
    long long v129 = &v23[4 * (int)v376 - 4];
    *long long v129 = (int32x2_t)(v27 + 712);
    v129[1].i32[0] = 48;
    v129[3] = (int32x2_t)bon_upd_cs;
    v129[2].i32[0] = 3;
    float v405 = v129 + 2;
    float v130 = 1.0 / *(float *)(v27 + 252);
    float v131 = 1.0 / *(float *)(v27 + 256);
    uint64_t v132 = 504;
    uint64_t v133 = v17;
    do
    {
      int v134 = (v126 + *(_DWORD *)(v27 + 588) - 1) % *(_DWORD *)(v27 + 588);
      int v135 = *v133++;
      if ((!v135 || !v17[v134]) && v134 != *(_DWORD *)(v27 + 592))
      {
        uint64_t v136 = *(void *)(v27 + 304);
        *(void *)(v408 + 80 * v127) = bon_eval_fnc_fm;
        uint64_t v137 = v408 + 80 * v127;
        *(_DWORD *)(v137 + 20) = -1;
        *(_DWORD *)(v137 + 24) = v134;
        *(_DWORD *)(v137 + 28) = v126;
        *(_DWORD *)(v137 + 32) = v128;
        *(_DWORD *)(v137 + 64) = 3;
        uint64_t v138 = (float *)malloc_type_malloc(0xCuLL, 0xD0C59E7EuLL);
        uint64_t v27 = a1;
        *uint64_t v138 = v130;
        v138[1] = 0.0;
        v138[2] = v131;
        *(void *)(v137 + 72) = v138;
        *(_DWORD *)(v137 + 16) = 2;
        uint64_t v16 = v387;
        double v139 = *(double *)(v136 + v132);
        uint64_t v140 = v136 + 880 * v134;
        float64x2_t v17 = v401;
        double v141 = 1.0 / (v139 - *(double *)(v140 + 504));
        *(float32x2_t *)uint64_t v138 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)COERCE_UNSIGNED_INT64(v130), v141));
        *(float *)&double v141 = v141 * v131;
        v138[2] = *(float *)&v141;
        ++v127;
      }
      v132 += 880;
      ++v126;
      --v28;
    }
    while (v28);
    uint64_t v142 = v408 + 80 * v127;
    *(_DWORD *)(v142 + 20) = -1;
    *(_DWORD *)(v142 + 24) = v128;
    *(_DWORD *)(v142 + 64) = 1;
    *(_DWORD *)(v142 + 16) = v405->i32[0];
    *(void *)uint64_t v142 = bon_eval_fnc_bs;
    int v143 = (long long *)(v27 + 760);
    uint64_t v144 = malloc_type_malloc(0x30uLL, 0xD0C59E7EuLL);
    long long v145 = *v143;
    long long v146 = v143[2];
    v144[1] = v143[1];
    v144[2] = v146;
    *uint64_t v144 = v145;
    *(void *)(v142 + 8) = v144;
    int v147 = *(_DWORD *)(v142 + 16) + *(_DWORD *)(v142 + 16) * *(_DWORD *)(v142 + 16);
    long long v148 = malloc_type_calloc((uint64_t)(v147 + (v147 < 0)) >> 1, 4uLL, 0x100004052888210uLL);
    *(void *)(v142 + 72) = v148;
    uint64_t v149 = *(unsigned int *)(v142 + 16);
    double v18 = v382;
    uint64_t v23 = v384;
    size_t v28 = v395;
    int v31 = a2;
    uint64_t v105 = v378 << 32;
    if ((int)v149 >= 1)
    {
      if (v149 == 3)
      {
        *long long v148 = 1113927393;
        v148[2] = 1113927393;
        v148[5] = 1113927393;
      }
      else
      {
        *long long v148 = 1113927393;
        if (v149 != 1)
        {
          v148[2] = 1113927393;
          if (v149 != 2)
          {
            v148[5] = 1113927393;
            uint64_t v150 = 9;
            for (uint64_t j = 3; j != v149; ++j)
            {
              v148[v150] = 1148846079;
              v150 += (j + 2);
            }
          }
        }
      }
    }
    uint64_t v27 = a1;
    if (v127 >= v375)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1478, (uint64_t)"tracker_bundle_bon", "term_index > n_fm");
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1478, "0");
    }
  }
  if (v385 >= 1)
  {
    int v152 = 0;
    int v153 = 0;
    uint64_t v154 = 520;
    size_t v155 = v28;
    long double v156 = v17;
    float v157 = 1.0 / *(float *)(v27 + 232);
    do
    {
      int v158 = (v152 + *(_DWORD *)(v27 + 588) - 1) % *(_DWORD *)(v27 + 588);
      uint64_t v159 = *(void *)(v27 + 304);
      int v160 = v158;
      double v161 = *(double *)(v159 + v154 - 16);
      double v162 = *(double *)(v159 + 880 * v158 + 504);
      int v163 = *v156++;
      if ((!v163 || !v17[v158])
        && v158 != *(_DWORD *)(v27 + 592)
        && (!*(_DWORD *)(v27 + 136) || !*(_DWORD *)(v159 + v154)))
      {
        double v164 = v161 - v162;
        if (*(_DWORD *)(v27 + 240) && v164 <= 0.0)
        {
          log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1497, (uint64_t)"tracker_bundle_bon", "Negative time detected, dt: %f", v161 - v162);
          __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1497, "0");
        }
        *(void *)&v397[80 * v153] = bon_eval_fnc_distance;
        uint64_t v165 = &v397[80 * v153];
        *((_DWORD *)v165 + 5) = -1;
        *((_DWORD *)v165 + 6) = v158;
        *((_DWORD *)v165 + 7) = v152;
        *((_DWORD *)v165 + 16) = 2;
        uint64_t v166 = (float *)malloc_type_malloc(4uLL, 0xD0C59E7EuLL);
        *uint64_t v166 = v157;
        *((void *)v165 + 9) = v166;
        float v167 = (float **)(v165 + 72);
        *((_DWORD *)v167 - 14) = 1;
        uint64_t v168 = (float *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
        *(v167 - 8) = v168;
        uint64_t v169 = (double *)(v159 + 880 * v160);
        double v170 = v169[21] - *(double *)(v159 + v154 - 352);
        double v171 = v169[23] - *(double *)(v159 + v154 - 336);
        *(float *)&double v170 = sqrt((v169[22] - *(double *)(v159 + v154 - 344)) * (v169[22] - *(double *)(v159 + v154 - 344))+ v170 * v170+ v171 * v171);
        *uint64_t v168 = *(float *)&v170;
        uint64_t v27 = a1;
        if (*(_DWORD *)(a1 + 240))
        {
          float v172 = **v167 / v164;
          **float v167 = v172;
        }
        ++v153;
        float64x2_t v17 = v401;
      }
      uint64_t v16 = v387;
      v154 += 880;
      ++v152;
      --v155;
    }
    while (v155);
    double v18 = v382;
    uint64_t v23 = v384;
    size_t v28 = v395;
    int v31 = a2;
    uint64_t v105 = v378 << 32;
    if (v153 > v381)
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1513, (uint64_t)"tracker_bundle_bon", "term_index > n_cam_opt");
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1513, "0");
    }
  }
  v31[13] = 0;
  uint64_t v173 = v31[15];
  uint64_t v174 = v383;
  if (v374 > v173)
  {
    uint64_t v175 = 2 * v173;
    BOOL v221 = v173 == 0;
    uint64_t v176 = 64;
    if (!v221) {
      uint64_t v176 = v175;
    }
    if (v176 <= v374) {
      uint64_t v177 = v374;
    }
    else {
      uint64_t v177 = v176;
    }
    if (v177)
    {
      uint64_t v178 = malloc_type_realloc((void *)v31[14], 4 * v177, 0x4398D04AuLL);
      uint64_t v27 = a1;
      v31[14] = v178;
    }
    v31[15] = v177;
  }
  if (v105 >= 1)
  {
    bzero((void *)(v31[14] + 4 * v31[13]), (unint64_t)v105 >> 30);
    uint64_t v27 = a1;
  }
  v31[13] = v374;
  if ((int)v378 >= 1)
  {
    uint64_t v179 = 0;
    int v180 = (v376 << 16) - 0x10000;
    do
    {
      if (v18[v179]) {
        goto LABEL_127;
      }
      uint64_t v181 = v31[1];
      uint64_t v182 = v31[8];
      int v183 = &v16[10 * v179];
      int v386 = -1;
      *((_DWORD *)v183 + 13) = -1;
      double v393 = (_DWORD *)v183 + 13;
      if (v31[10] > v179) {
        int v386 = *(_DWORD *)(v31[11] + 4 * v179);
      }
      float32x2_t v184 = &v16[10 * v179];
      int v185 = (uint64_t *)(v181 + 24 * v179);
      uint64_t v186 = *v184;
      uint64_t v187 = *v185;
      uint64_t v188 = (uint64_t)v184[2];
      if (*v185 <= v188)
      {
        uint64_t v193 = v187 - (void)v186;
        if (v187 <= (uint64_t)v186) {
          goto LABEL_140;
        }
      }
      else
      {
        uint64_t v189 = 2 * v188;
        BOOL v221 = v188 == 0;
        uint64_t v190 = 32;
        if (!v221) {
          uint64_t v190 = v189;
        }
        if (v190 <= v187) {
          uint64_t v191 = *v185;
        }
        else {
          uint64_t v191 = v190;
        }
        if (v191)
        {
          uint64_t v192 = malloc_type_realloc(v184[1], 8 * v191, 0x4183AA16uLL);
          int v180 = (v376 << 16) - 0x10000;
          uint64_t v27 = a1;
          v184[1] = v192;
        }
        v184[2] = (void *)v191;
        uint64_t v193 = v187 - (void)v186;
        if (v187 <= (uint64_t)v186)
        {
LABEL_140:
          uint64_t v194 = *v185;
          *float32x2_t v184 = (void *)*v185;
          if (v194 < 1) {
            goto LABEL_161;
          }
          goto LABEL_144;
        }
      }
      bzero((char *)v184[1] + 8 * (void)*v184, 8 * v193);
      int v180 = (v376 << 16) - 0x10000;
      uint64_t v27 = a1;
      uint64_t v195 = *v185;
      *float32x2_t v184 = (void *)*v185;
      if (v195 < 1) {
        goto LABEL_161;
      }
LABEL_144:
      uint64_t v196 = 0;
      int v197 = (float *)(v182 + 12 * v179);
      float v198 = (void *)(v181 + 24 * v179 + 8);
      uint64_t v199 = &v16[10 * v179];
      uint64_t v200 = (uint64_t *)(v199 + 3);
      int v201 = (uint64_t *)(v199 + 5);
      uint64_t v202 = v199 + 4;
      double v409 = v197 + 1;
      double v411 = v197;
      double v406 = v197 + 2;
      double v390 = (float *)(v199 + 6);
      float v203 = INFINITY;
      do
      {
        unint64_t v204 = *(unsigned int *)(*v198 + 4 * v196);
        uint64_t v205 = *v200;
        uint64_t v206 = *v201;
        if (*v200 >= *v201)
        {
          uint64_t v207 = 2 * v206;
          BOOL v221 = v206 == 0;
          uint64_t v208 = 64;
          if (!v221) {
            uint64_t v208 = v207;
          }
          if (v208 <= v205) {
            uint64_t v209 = v205 + 1;
          }
          else {
            uint64_t v209 = v208;
          }
          if (v209)
          {
            int32x4_t v210 = malloc_type_realloc(*v202, 4 * v209, 0x34C81B78uLL);
            int v180 = (v376 << 16) - 0x10000;
            uint64_t v27 = a1;
            *uint64_t v202 = v210;
            uint64_t v205 = *v200;
          }
          *int v201 = v209;
        }
        *uint64_t v200 = v205 + 1;
        *((_DWORD *)*v202 + v205) = v204 & 0x7FFF | v180;
        *((void *)v184[1] + v196) = *(void *)(*(void *)(*(void *)(v27 + 304) + 880 * (v204 & 0x7FFF) + 368)
                                                + 8 * (v204 >> 15));
        uint64_t v211 = *v185;
        uint64_t v212 = *v185 - 1;
        if (*v185 <= 1) {
          uint64_t v212 = 1;
        }
        if (v212 > v196)
        {
          int32x4_t v213 = (double *)(*(void *)(v27 + 304) + 880 * (v204 & 0x7FFF));
          float v214 = v213[3] * (*v409 - v213[10]) + *v213 * (*v411 - v213[9]) + v213[6] * (*v406 - v213[11]);
          if (v203 > v214)
          {
            *double v390 = 1.0 / v214;
            _DWORD *v393 = v196;
            *(_DWORD *)(a2[14] + 4 * v179) = v204 & 0x7FFF;
            float v203 = v214;
          }
        }
        ++v196;
      }
      while (v211 > v196);
      float64x2_t v17 = v401;
      uint64_t v16 = v387;
      if (v203 >= *(float *)(v27 + 24))
      {
LABEL_161:
        if (*v393 != -1)
        {
          double v18 = v382;
          uint64_t v174 = v383;
          uint64_t v23 = v384;
          size_t v28 = v395;
          int v31 = a2;
          uint64_t v105 = v378 << 32;
          if (v386 != -1)
          {
            int32x4_t v215 = &v16[10 * v179];
            v215[7] = (void *)(*(void *)(v27 + 448) + 12 * v386);
            v215[8] = (void *)(*(void *)(v27 + 472) + 36 * v386);
            v215[9] = (void *)(*(void *)(v27 + 568) + 48 * v386);
          }
          goto LABEL_127;
        }
      }
      double v18 = v382;
      uint64_t v174 = v383;
      v382[v179] = 1;
      uint64_t v23 = v384;
      size_t v28 = v395;
      int v31 = a2;
      uint64_t v105 = v378 << 32;
LABEL_127:
      ++v179;
    }
    while (v179 != v174);
  }
  if (v105 >= 1)
  {
    uint64_t v216 = 0;
    if (v374 <= 1) {
      uint64_t v217 = 1;
    }
    else {
      uint64_t v217 = v374;
    }
    int32x4_t v218 = v18;
    uint8x16_t v219 = v16;
    do
    {
      while (1)
      {
        int v220 = *v218++;
        BOOL v221 = v220 || v16 == 0;
        if (!v221) {
          break;
        }
        free(v219[1]);
        free(v219[4]);
        uint64_t v27 = a1;
        v219 += 10;
        if (!--v217) {
          goto LABEL_175;
        }
      }
      int16x8_t v222 = &v16[10 * v216];
      *(_OWORD *)int16x8_t v222 = *(_OWORD *)v219;
      long long v223 = *((_OWORD *)v219 + 1);
      long long v224 = *((_OWORD *)v219 + 2);
      long long v225 = *((_OWORD *)v219 + 4);
      *((_OWORD *)v222 + 3) = *((_OWORD *)v219 + 3);
      *((_OWORD *)v222 + 4) = v225;
      *((_OWORD *)v222 + 1) = v223;
      *((_OWORD *)v222 + 2) = v224;
      ++v216;
      v219 += 10;
      --v217;
    }
    while (v217);
LABEL_175:
    uint64_t v19 = v373;
    if (!(v216 | v373)) {
      goto LABEL_176;
    }
LABEL_178:
    int v226 = v28 - 1;
    int v8 = v381;
    if ((int)v28 - 1 >= v381) {
      int v226 = v381;
    }
    int v227 = *(_DWORD *)(v27 + 592);
    int v228 = ((int)v28 - v226 + v227 + 1) % (int)v28;
    int v425 = v228;
    double v21 = v379;
    uint64_t v22 = (void **)v380;
    if (v17[v228])
    {
      log_msg(1, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1575, (uint64_t)"tracker_bundle_bon", "cam %d locked", v425);
      __assert_rtn("tracker_bundle_bon", "slam_tracker_vo.c", 1575, "0");
    }
    LODWORD(v420) = 0;
    *(void *)((char *)&v420 + 4) = *(void *)(v27 + 144);
    float v229 = *(float *)(v27 + 156);
    HIDWORD(v420) = *(_DWORD *)(v27 + 152);
    LODWORD(v421) = 0;
    uint64_t v230 = *(void *)(v27 + 304);
    float v231 = *(float *)(v230 + 880 * v227 + 360);
    *((float *)&v421 + 1) = *(float *)(v27 + 160) * v231;
    *(float *)v424.i32 = v231 * v229;
    v424.i32[1] = 1084227584;
    int v232 = *(_DWORD *)(v27 + 236);
    LODWORD(v422) = 925353388;
    float v233 = 1.0 / *(float *)(v27 + 24);
    int v423 = v232;
    *((float *)&v422 + 1) = v233;
    float v234 = bon2(v23, v376, (uint64_t)v16, v216, v380, v19, (int *)&v420, (uint64_t)&v425, 1, v230 + 880 * v228 + 524);
    uint64_t v235 = a2[7];
    if (v235 >= 1)
    {
      uint64_t v236 = 0;
      int v237 = 0;
      float v238 = v18;
      do
      {
        if (!*v238++)
        {
          uint64_t v240 = (float *)&v16[10 * v237];
          float v241 = 1.0 / v240[12];
          uint64_t v242 = *((int *)v240 + 13);
          int v243 = (float *)(*((void *)v240 + 1) + 8 * v242);
          float v244 = v241 * *v243;
          float v245 = v241 * v243[1];
          int v246 = (float *)&v379[48 * *(unsigned __int16 *)(*((void *)v240 + 4) + 4 * v242)];
          float v247 = v246[9] + (float)((float)((float)(v244 * v246[1]) + (float)(*v246 * v241)) + (float)(v246[2] * v245));
          float v248 = (float)((float)(v244 * v246[4]) + (float)(v246[3] * v241)) + (float)(v246[5] * v245);
          uint64_t v249 = (float *)(a2[8] + v236);
          float v250 = (float)(v244 * v246[7]) + (float)(v246[6] * v241);
          float v251 = v246[10] + v248;
          float v252 = v246[11] + (float)(v250 + (float)(v246[8] * v245));
          *uint64_t v249 = v247;
          v249[1] = v251;
          v249[2] = v252;
          ++v237;
        }
        v236 += 12;
        --v235;
      }
      while (v235);
    }
    uint64_t v253 = *(float64x2_t **)(a1 + 304);
    uint64_t v254 = v253 + 3;
    float v255 = (float32x2_t *)(v379 + 24);
    do
    {
      v254[2] = vcvtq_f64_f32(v255[2]);
      v254[-3] = vcvtq_f64_f32(v255[-3]);
      *uint64_t v254 = vcvtq_f64_f32(*v255);
      v254[-2] = vcvtq_f64_f32(v255[-2]);
      v254[-1] = vcvtq_f64_f32(v255[-1]);
      v254[1] = vcvtq_f64_f32(v255[1]);
      v254 += 55;
      v255 += 6;
      --v28;
    }
    while (v28);
    float v388 = v234;
    unint64_t v256 = 0;
    int v257 = (v425 + *(_DWORD *)(a1 + 588) - 1) % *(_DWORD *)(a1 + 588);
    *(void *)((char *)v431 + 12) = 0;
    *(uint64_t *)((char *)v432.i64 + 4) = 0;
    DWORD1(v431[1]) = 0;
    v432.i32[3] = 0;
    uint64_t v434 = 0;
    v435[1] = 0;
    v435[0] = 0;
    int v436 = 1065353216;
    uint64_t v439 = 0;
    uint64_t v437 = 0;
    uint64_t v438 = 0;
    uint64_t v441 = 0;
    uint64_t v443 = 0;
    uint64_t v442 = 0;
    int v440 = 1065353216;
    int v444 = 1065353216;
    f64 = v253[55 * v257].f64;
    float v259 = *f64;
    *(float *)int v431 = v259;
    float v260 = f64[1];
    *((float *)v431 + 1) = v260;
    float v261 = f64[2];
    *((float *)v431 + 2) = v261;
    float v262 = f64[3];
    *((float *)&v431[1] + 2) = v262;
    float v263 = f64[4];
    *((float *)&v431[1] + 3) = v263;
    float v264 = f64[5];
    v432.f32[0] = v264;
    float v265 = f64[6];
    *(float *)BOOL v433 = v265;
    float v266 = f64[7];
    *(float *)&v433[1] = v266;
    float v267 = f64[8];
    *(float *)&v433[2] = v267;
    float v268 = &v253[55 * v425];
    uint64_t v269 = (float32x4_t *)((char *)&v268[32].f64[1] + 4);
    long long v270 = v268 + 34;
    do
    {
      long long v271 = (char *)v431 + v256;
      *((void *)v271 + 19) = 0;
      *((void *)v271 + 20) = 0;
      *((void *)v271 + 18) = 0;
      float v272 = *(float *)((char *)&v270[-1] + v256 - 4);
      float v273 = *(float *)&v270[-1].f64[v256 / 8];
      float v274 = (float)(v445.f32[v256 / 4] + (float)(v259 * v272)) + (float)(v262 * v273);
      float v275 = (float)(v445.f32[v256 / 4 + 1] + (float)(v260 * v272)) + (float)(v263 * v273);
      float v276 = (float)(v445.f32[v256 / 4 + 2] + (float)(v261 * v272)) + (float)(v264 * v273);
      float v277 = (float)(v445.f32[v256 / 4 + 3] + (float)(v272 * 0.0)) + (float)(v273 * 0.0);
      float v278 = (float)(*(float *)&v447[v256 / 4 - 1] + (float)(v272 * 0.0)) + (float)(v273 * 0.0);
      float v279 = (float)(*(float *)&v447[v256 / 4] + (float)(v272 * 0.0)) + (float)(v273 * 0.0);
      float v280 = *((float *)&v270->f64[v256 / 8 - 1] - 1);
      float v281 = *(float *)&v270->f64[v256 / 8 - 1];
      float v282 = v277 + (float)(v280 * 0.0);
      float v283 = v278 + (float)(v280 * 0.0);
      float v284 = v279 + (float)(v280 * 0.0);
      float v285 = (float)(v274 + (float)(v265 * v280)) + (float)(v281 * 0.0);
      float v286 = (float)(v275 + (float)(v266 * v280)) + (float)(v281 * 0.0);
      float v287 = (float)(v276 + (float)(v267 * v280)) + (float)(v281 * 0.0);
      float v288 = v281 + v282;
      float v289 = v283 + (float)(v281 * 0.0);
      float v290 = *((float *)&v270->f64[v256 / 8 - 1] + 1);
      float v291 = v285 + (float)(v290 * 0.0);
      float v292 = v286 + (float)(v290 * 0.0);
      float v293 = v287 + (float)(v290 * 0.0);
      float v294 = v288 + (float)(v290 * 0.0);
      float v295 = v290 + v289;
      float v296 = (float)(v284 + (float)(v281 * 0.0)) + (float)(v290 * 0.0);
      float v297 = *(float *)&v270->f64[v256 / 8];
      *((float *)v271 + 36) = v291 + (float)(v297 * 0.0);
      *((float *)v271 + 37) = v292 + (float)(v297 * 0.0);
      *((float *)v271 + 38) = v293 + (float)(v297 * 0.0);
      *((float *)v271 + 39) = v294 + (float)(v297 * 0.0);
      *((float *)v271 + 40) = v295 + (float)(v297 * 0.0);
      *((float *)v271 + 41) = v297 + v296;
      v256 += 24;
    }
    while (v256 != 144);
    float32x4_t v412 = v445;
    float v410 = v446;
    float v407 = *(float *)v447;
    float v402 = *(float *)&v447[1];
    float v400 = *(float *)&v447[2];
    float v398 = *(float *)&v447[3];
    float v396 = *(float *)&v447[4];
    float v394 = *(float *)&v447[5];
    float v391 = *(float *)&v447[6];
    float v298 = *(float *)&v447[7];
    float v299 = *(float *)&v447[8];
    float v300 = *(float *)&v447[9];
    float v301 = *(float *)&v447[10];
    float v302 = *(float *)&v447[11];
    float v303 = *(float *)&v447[12];
    float v304 = *(float *)&v447[13];
    float v305 = *(float *)&v447[14];
    float v306 = *(float *)&v447[15];
    float v307 = *(float *)&v447[16];
    float v308 = *(float *)&v447[17];
    float v309 = *(float *)&v447[18];
    float v310 = *(float *)&v447[19];
    float v311 = *(float *)&v447[20];
    float v312 = *(float *)&v447[21];
    float v313 = *(float *)&v447[22];
    float v314 = *(float *)&v447[23];
    float v315 = *(float *)&v447[24];
    float v316 = *(float *)&v447[25];
    float v317 = *(float *)&v447[26];
    float v318 = *(float *)&v447[27];
    float v319 = *(float *)&v447[28];
    float v320 = *(float *)&v447[29];
    unint64_t v321 = 48;
    float v322 = *(float *)&v447[30];
    do
    {
      v269->i64[1] = 0;
      v269[1].i64[0] = 0;
      v269->i64[0] = 0;
      float v323 = *(float *)((char *)&v426 + v321 + 8);
      float32x4_t v324 = vmlaq_n_f32(*v269, v412, v323);
      float32x4_t *v269 = v324;
      float32_t v325 = v269[1].f32[0] + (float)(v410 * v323);
      float32_t v326 = v269[1].f32[1] + (float)(v407 * v323);
      v269[1].f32[0] = v325;
      v269[1].f32[1] = v326;
      float v327 = *(float *)((char *)&v428 + v321 + 8);
      float32_t v328 = v324.f32[0] + (float)(v402 * v327);
      float32_t v329 = v324.f32[1] + (float)(v400 * v327);
      v269->f32[0] = v328;
      v269->f32[1] = v329;
      float32_t v330 = v324.f32[2] + (float)(v398 * v327);
      v324.f32[0] = v324.f32[3] + (float)(v396 * v327);
      v269->f32[2] = v330;
      v269->i32[3] = v324.i32[0];
      float32_t v331 = v325 + (float)(v394 * v327);
      float32_t v332 = v326 + (float)(v391 * v327);
      v269[1].f32[0] = v331;
      v269[1].f32[1] = v332;
      float v333 = *(float *)((char *)v431 + v321);
      float32_t v334 = v328 + (float)(v298 * v333);
      float32_t v335 = v329 + (float)(v299 * v333);
      v269->f32[0] = v334;
      v269->f32[1] = v335;
      float32_t v336 = v330 + (float)(v300 * v333);
      v324.f32[0] = v324.f32[0] + (float)(v301 * v333);
      v269->f32[2] = v336;
      v269->i32[3] = v324.i32[0];
      float32_t v337 = v331 + (float)(v302 * v333);
      float32_t v338 = v332 + (float)(v303 * v333);
      v269[1].f32[0] = v337;
      v269[1].f32[1] = v338;
      float v339 = *(float *)((char *)&v431[1] + v321 + 8);
      float32_t v340 = v334 + (float)(v304 * v339);
      float32_t v341 = v335 + (float)(v305 * v339);
      v269->f32[0] = v340;
      v269->f32[1] = v341;
      float32_t v342 = v336 + (float)(v306 * v339);
      v324.f32[0] = v324.f32[0] + (float)(v307 * v339);
      v269->f32[2] = v342;
      v269->i32[3] = v324.i32[0];
      float32_t v343 = v337 + (float)(v308 * v339);
      float32_t v344 = v338 + (float)(v309 * v339);
      v269[1].f32[0] = v343;
      v269[1].f32[1] = v344;
      float v345 = *(float *)&v433[v321 / 4];
      float32_t v346 = v340 + (float)(v310 * v345);
      float32_t v347 = v341 + (float)(v311 * v345);
      v269->f32[0] = v346;
      v269->f32[1] = v347;
      float32_t v348 = v342 + (float)(v312 * v345);
      v324.f32[0] = v324.f32[0] + (float)(v313 * v345);
      v269->f32[2] = v348;
      v269->i32[3] = v324.i32[0];
      float32_t v349 = v343 + (float)(v314 * v345);
      float32_t v350 = v344 + (float)(v315 * v345);
      v269[1].f32[0] = v349;
      v269[1].f32[1] = v350;
      float v351 = *(float *)((char *)v435 + v321 + 4);
      v269->f32[0] = v346 + (float)(v316 * v351);
      v269->f32[1] = v347 + (float)(v317 * v351);
      v269->f32[2] = v348 + (float)(v318 * v351);
      v269->f32[3] = v324.f32[0] + (float)(v319 * v351);
      v269[1].f32[0] = v349 + (float)(v320 * v351);
      v269[1].f32[1] = v350 + (float)(v322 * v351);
      v321 += 4;
      uint64_t v269 = (float32x4_t *)((char *)v269 + 24);
    }
    while (v321 != 72);
    LODWORD(v6) = v216;
    float v4 = v388;
    if ((int)v216 < 1) {
      goto LABEL_196;
    }
    goto LABEL_193;
  }
  LODWORD(v216) = 0;
  uint64_t v19 = v373;
  if (v373) {
    goto LABEL_178;
  }
LABEL_176:
  log_msg(2, 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VisualLocalization/argo/pwin/slam/slam_tracker_vo.c", 1568, (uint64_t)"tracker_bundle_bon", "%s: Nothing to optimize, skipping", "tracker_bundle_bon");
  float v4 = 0.0;
  int v8 = v381;
  double v21 = v379;
  uint64_t v22 = (void **)v380;
LABEL_196:
  free(v16);
  free(v23);
  if ((int)v19 >= 1)
  {
    int v355 = v22 + 9;
    do
    {
      free(*(v355 - 8));
      int v356 = *v355;
      v355 += 10;
      free(v356);
      --v19;
    }
    while (v19);
  }
  free(v22);
  free(v21);
  free(v17);
  free(v18);
  int v357 = (void *)a1;
  if (*(_DWORD *)(a1 + 300))
  {
    BOOL v358 = v4 < 0.0 || ((LODWORD(v4) & 0x7FFFFFFFu) - 0x800000) >> 24 > 0x7E;
    if (!v358 || (LODWORD(v4) - 1) <= 0x7FFFFE)
    {
      if (v8 == 1)
      {
        uint64_t v360 = *(void *)(a1 + 880);
        uint64_t v361 = *(void *)(a1 + 896);
        if (v360 >= v361)
        {
          uint64_t v362 = 2 * v361;
          BOOL v221 = v361 == 0;
          uint64_t v363 = 64;
          if (!v221) {
            uint64_t v363 = v362;
          }
          if (v363 <= v360) {
            uint64_t v364 = v360 + 1;
          }
          else {
            uint64_t v364 = v363;
          }
          if (v364)
          {
            double v365 = malloc_type_realloc(*(void **)(a1 + 888), 4 * v364, 0xFE8AFB6EuLL);
            int v357 = (void *)a1;
            *(void *)(a1 + 888) = v365;
            uint64_t v360 = *(void *)(a1 + 880);
          }
          v357[112] = v364;
        }
        v357[110] = v360 + 1;
        double v366 = v357 + 111;
      }
      else
      {
        uint64_t v360 = *(void *)(a1 + 904);
        uint64_t v367 = *(void *)(a1 + 920);
        if (v360 >= v367)
        {
          uint64_t v368 = 2 * v367;
          BOOL v221 = v367 == 0;
          uint64_t v369 = 64;
          if (!v221) {
            uint64_t v369 = v368;
          }
          if (v369 <= v360) {
            uint64_t v370 = v360 + 1;
          }
          else {
            uint64_t v370 = v369;
          }
          if (v370)
          {
            double v371 = malloc_type_realloc(*(void **)(a1 + 912), 4 * v370, 0xE4417889uLL);
            int v357 = (void *)a1;
            *(void *)(a1 + 912) = v371;
            uint64_t v360 = *(void *)(a1 + 904);
          }
          v357[115] = v370;
        }
        v357[113] = v360 + 1;
        double v366 = v357 + 114;
      }
      *(float *)(*v366 + 4 * v360) = v4;
    }
  }
  return v4;
}

void remove_map_points(uint64_t a1, unsigned __int8 *a2)
{
  float v4 = malloc_type_malloc(4 * *(void *)(a1 + 368), 0x9777BE39uLL);
  int v5 = v4;
  uint64_t v6 = *(void *)(a1 + 368);
  if (v6 >= 1)
  {
    int v7 = 0;
    int v8 = a2;
    int v9 = v4;
    do
    {
      int v10 = *v8++;
      BOOL v11 = v10 == 0;
      if (v10) {
        int v12 = -1;
      }
      else {
        int v12 = v7;
      }
      if (v11) {
        ++v7;
      }
      *v9++ = v12;
      --v6;
    }
    while (v6);
  }
  uint64_t v13 = *(void *)(a1 + 312);
  if (v13 < 1)
  {
    uint64_t v15 = 0;
    uint64_t v22 = *(void *)(a1 + 328);
    if (v22 >= 0) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    for (uint64_t i = 0; i < v13; ++i)
    {
      while (1)
      {
        uint64_t v17 = *(void *)(a1 + 320);
        if (!a2[i] && v17 != 0) {
          break;
        }
        free(*(void **)(v17 + v14 + 8));
        ++i;
        uint64_t v13 = *(void *)(a1 + 312);
        v14 += 24;
        if (i >= v13) {
          goto LABEL_17;
        }
      }
      long long v19 = *(_OWORD *)(v17 + v14);
      uint64_t v20 = *(void *)(v17 + v14 + 16);
      uint64_t v21 = v17 + 24 * v15;
      *(void *)(v21 + 16) = v20;
      *(_OWORD *)uint64_t v21 = v19;
      ++v15;
      uint64_t v13 = *(void *)(a1 + 312);
      v14 += 24;
    }
LABEL_17:
    uint64_t v22 = *(void *)(a1 + 328);
    if (v15 <= v22)
    {
LABEL_18:
      uint64_t v23 = v15 - v13;
      if (v15 <= v13) {
        goto LABEL_19;
      }
      goto LABEL_36;
    }
  }
  uint64_t v33 = 2 * v22;
  BOOL v11 = v22 == 0;
  uint64_t v34 = 10;
  if (!v11) {
    uint64_t v34 = v33;
  }
  if (v34 <= v15) {
    uint64_t v35 = v15;
  }
  else {
    uint64_t v35 = v34;
  }
  if (v35) {
    *(void *)(a1 + 320) = malloc_type_realloc(*(void **)(a1 + 320), 24 * v35, 0x83A307D0uLL);
  }
  *(void *)(a1 + 328) = v35;
  uint64_t v23 = v15 - v13;
  if (v15 <= v13)
  {
LABEL_19:
    *(void *)(a1 + 312) = v15;
    uint64_t v24 = *(void *)(a1 + 368);
    if (v24 >= 1) {
      goto LABEL_20;
    }
LABEL_37:
    uint64_t v26 = 0;
    goto LABEL_38;
  }
LABEL_36:
  bzero((void *)(*(void *)(a1 + 320) + 24 * *(void *)(a1 + 312)), 24 * v23);
  *(void *)(a1 + 312) = v15;
  uint64_t v24 = *(void *)(a1 + 368);
  if (v24 < 1) {
    goto LABEL_37;
  }
LABEL_20:
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  for (uint64_t j = 0; j < v24; ++j)
  {
    uint64_t v28 = *(void *)(a1 + 376);
    if (a2[j]) {
      BOOL v29 = 1;
    }
    else {
      BOOL v29 = v28 == 0;
    }
    if (!v29)
    {
      int v30 = (uint64_t *)(v28 + v25);
      uint64_t v31 = v28 + 12 * v26;
      uint64_t v32 = *v30;
      *(_DWORD *)(v31 + 8) = *((_DWORD *)v30 + 2);
      *(void *)uint64_t v31 = v32;
      ++v26;
      uint64_t v24 = *(void *)(a1 + 368);
    }
    v25 += 12;
  }
LABEL_38:
  uint64_t v36 = *(void *)(a1 + 384);
  if (v26 > v36)
  {
    uint64_t v45 = 2 * v36;
    BOOL v11 = v36 == 0;
    uint64_t v46 = 21;
    if (!v11) {
      uint64_t v46 = v45;
    }
    if (v46 <= v26) {
      uint64_t v47 = v26;
    }
    else {
      uint64_t v47 = v46;
    }
    if (v47) {
      *(void *)(a1 + 376) = malloc_type_realloc(*(void **)(a1 + 376), 12 * v47, 0x4AD6A2C5uLL);
    }
    *(void *)(a1 + 384) = v47;
    uint64_t v37 = v26 - v24;
    if (v26 <= v24)
    {
LABEL_40:
      *(void *)(a1 + 368) = v26;
      uint64_t v38 = *(void *)(a1 + 336);
      if (v38 >= 1) {
        goto LABEL_41;
      }
LABEL_55:
      uint64_t v40 = 0;
      goto LABEL_56;
    }
  }
  else
  {
    uint64_t v37 = v26 - v24;
    if (v26 <= v24) {
      goto LABEL_40;
    }
  }
  bzero((void *)(*(void *)(a1 + 376) + 12 * *(void *)(a1 + 368)), 12 * v37);
  *(void *)(a1 + 368) = v26;
  uint64_t v38 = *(void *)(a1 + 336);
  if (v38 < 1) {
    goto LABEL_55;
  }
LABEL_41:
  uint64_t v39 = *(void *)(a1 + 344);
  if (v39)
  {
    uint64_t v40 = 0;
    uint64_t v41 = a2;
    uint64_t v42 = *(_DWORD **)(a1 + 344);
    uint64_t v43 = v38;
    do
    {
      if (!*v41++) {
        *(_DWORD *)(v39 + 4 * v40++) = *v42;
      }
      ++v42;
      --v43;
    }
    while (v43);
LABEL_56:
    uint64_t v48 = *(void *)(a1 + 352);
    if (v40 <= v48) {
      goto LABEL_57;
    }
    goto LABEL_65;
  }
  uint64_t v40 = 0;
  uint64_t v48 = *(void *)(a1 + 352);
  if (v48 >= 0)
  {
LABEL_57:
    uint64_t v49 = v40 - v38;
    if (v40 <= v38) {
      goto LABEL_58;
    }
    goto LABEL_73;
  }
LABEL_65:
  uint64_t v57 = 2 * v48;
  BOOL v11 = v48 == 0;
  uint64_t v58 = 64;
  if (!v11) {
    uint64_t v58 = v57;
  }
  if (v58 <= v40) {
    uint64_t v59 = v40;
  }
  else {
    uint64_t v59 = v58;
  }
  if (v59) {
    *(void *)(a1 + 344) = malloc_type_realloc(*(void **)(a1 + 344), 4 * v59, 0x7BE4EF1EuLL);
  }
  *(void *)(a1 + 352) = v59;
  uint64_t v49 = v40 - v38;
  if (v40 <= v38)
  {
LABEL_58:
    *(void *)(a1 + 336) = v40;
    uint64_t v50 = *(void *)(a1 + 392);
    if (v50 >= 1) {
      goto LABEL_59;
    }
LABEL_74:
    uint64_t v52 = 0;
    goto LABEL_75;
  }
LABEL_73:
  bzero((void *)(*(void *)(a1 + 344) + 4 * *(void *)(a1 + 336)), 4 * v49);
  *(void *)(a1 + 336) = v40;
  uint64_t v50 = *(void *)(a1 + 392);
  if (v50 < 1) {
    goto LABEL_74;
  }
LABEL_59:
  uint64_t v51 = *(void *)(a1 + 400);
  if (v51)
  {
    uint64_t v52 = 0;
    float v53 = a2;
    float v54 = *(_DWORD **)(a1 + 400);
    uint64_t v55 = v50;
    do
    {
      if (!*v53++) {
        *(_DWORD *)(v51 + 4 * v52++) = *v54;
      }
      ++v54;
      --v55;
    }
    while (v55);
LABEL_75:
    uint64_t v60 = *(void *)(a1 + 408);
    if (v52 <= v60) {
      goto LABEL_76;
    }
    goto LABEL_84;
  }
  uint64_t v52 = 0;
  uint64_t v60 = *(void *)(a1 + 408);
  if (v60 >= 0)
  {
LABEL_76:
    uint64_t v61 = v52 - v50;
    if (v52 <= v50) {
      goto LABEL_77;
    }
    goto LABEL_92;
  }
LABEL_84:
  uint64_t v68 = 2 * v60;
  BOOL v11 = v60 == 0;
  uint64_t v69 = 64;
  if (!v11) {
    uint64_t v69 = v68;
  }
  if (v69 <= v52) {
    uint64_t v70 = v52;
  }
  else {
    uint64_t v70 = v69;
  }
  if (v70) {
    *(void *)(a1 + 400) = malloc_type_realloc(*(void **)(a1 + 400), 4 * v70, 0xD771EB33uLL);
  }
  *(void *)(a1 + 408) = v70;
  uint64_t v61 = v52 - v50;
  if (v52 <= v50)
  {
LABEL_77:
    *(void *)(a1 + 392) = v52;
    uint64_t v62 = *(void *)(a1 + 416);
    if (v62 >= 1) {
      goto LABEL_78;
    }
LABEL_93:
    uint64_t v64 = 0;
    goto LABEL_94;
  }
LABEL_92:
  bzero((void *)(*(void *)(a1 + 400) + 4 * *(void *)(a1 + 392)), 4 * v61);
  *(void *)(a1 + 392) = v52;
  uint64_t v62 = *(void *)(a1 + 416);
  if (v62 < 1) {
    goto LABEL_93;
  }
LABEL_78:
  uint64_t v63 = *(void *)(a1 + 424);
  if (v63)
  {
    uint64_t v64 = 0;
    int v65 = *(_DWORD **)(a1 + 424);
    uint64_t v66 = v62;
    do
    {
      if (!*a2++) {
        *(_DWORD *)(v63 + 4 * v64++) = *v65;
      }
      ++v65;
      --v66;
    }
    while (v66);
LABEL_94:
    uint64_t v71 = *(void *)(a1 + 432);
    if (v64 <= v71) {
      goto LABEL_95;
    }
    goto LABEL_99;
  }
  uint64_t v64 = 0;
  uint64_t v71 = *(void *)(a1 + 432);
  if (v71 >= 0)
  {
LABEL_95:
    uint64_t v72 = v64 - v62;
    if (v64 <= v62) {
      goto LABEL_96;
    }
    goto LABEL_107;
  }
LABEL_99:
  uint64_t v74 = 2 * v71;
  BOOL v11 = v71 == 0;
  uint64_t v75 = 64;
  if (!v11) {
    uint64_t v75 = v74;
  }
  if (v75 <= v64) {
    uint64_t v76 = v64;
  }
  else {
    uint64_t v76 = v75;
  }
  if (v76) {
    *(void *)(a1 + 424) = malloc_type_realloc(*(void **)(a1 + 424), 4 * v76, 0x18E4DAECuLL);
  }
  *(void *)(a1 + 432) = v76;
  uint64_t v72 = v64 - v62;
  if (v64 <= v62)
  {
LABEL_96:
    *(void *)(a1 + 416) = v64;
    int v73 = *(_DWORD *)(a1 + 588);
    if (v73 < 1) {
      goto LABEL_116;
    }
    goto LABEL_108;
  }
LABEL_107:
  bzero((void *)(*(void *)(a1 + 424) + 4 * *(void *)(a1 + 416)), 4 * v72);
  *(void *)(a1 + 416) = v64;
  int v73 = *(_DWORD *)(a1 + 588);
  if (v73 < 1) {
    goto LABEL_116;
  }
LABEL_108:
  uint64_t v77 = 0;
  uint64_t v78 = *(void *)(a1 + 304);
  do
  {
    uint64_t v79 = v78 + 880 * v77;
    int v80 = *(_DWORD *)(v79 + 488);
    if (v80 >= 1)
    {
      uint64_t v81 = 0;
      float v82 = (int *)(v79 + 488);
      uint64_t v83 = *(void *)(v78 + 880 * v77 + 400);
      do
      {
        uint64_t v84 = *(int *)(v83 + 4 * v81);
        if (v84 != -1)
        {
          *(_DWORD *)(v83 + 4 * v81) = v5[v84];
          int v80 = *v82;
        }
        ++v81;
      }
      while (v81 < v80);
      int v73 = *(_DWORD *)(a1 + 588);
    }
    ++v77;
  }
  while (v77 < v73);
LABEL_116:
  free(v5);
}

double rectify_pts(uint64_t a1, float32x2_t *a2, int a3, float *a4)
{
  LODWORD(v5) = a3;
  uint64_t v31 = 0;
  double v32 = 0.0;
  double v33 = 0.0;
  int v8 = *(_DWORD *)(a1 + 172) - 1;
  v34.f64[0] = (double)*(int *)(a1 + 168) + -0.5;
  v34.f64[1] = (double)v8 * 0.5;
  g_improj2_to_xyz(a1, &v34, (double *)&v31);
  long double v9 = v32;
  float v10 = v32;
  *a4 = -v10;
  a4[2] = v10;
  double v11 = (double)*(int *)(a1 + 172) + -0.5;
  v34.f64[0] = (double)(*(_DWORD *)(a1 + 168) - 1) * 0.5;
  v34.f64[1] = v11;
  g_improj2_to_xyz(a1, &v34, (double *)&v31);
  long double v12 = v33;
  float v13 = v33;
  a4[1] = -v13;
  a4[3] = v13;
  int v14 = *(_DWORD *)(a1 + 168);
  int v15 = *(_DWORD *)(a1 + 172);
  if ((int)v5 >= 1)
  {
    uint64_t v5 = v5;
    do
    {
      float64x2_t v30 = vcvtq_f64_f32(*a2);
      uint64_t v28 = 0;
      float64x2_t v29 = 0uLL;
      g_improj2_to_xyz(a1, &v30, (double *)&v28);
      *a2++ = vcvt_f32_f64(v29);
      --v5;
    }
    while (v5);
  }
  double v16 = atan(v9);
  double v17 = v16 + v16;
  if (v16 + v16 == 0.0) {
    double v18 = 0.0;
  }
  else {
    double v18 = v16 + v16;
  }
  long double v19 = atan(v12);
  double v20 = v19 + v19;
  if (v20 == 0.0) {
    double v21 = 0.0;
  }
  else {
    double v21 = v20;
  }
  long double v22 = tan(v20 * 0.5);
  long double v23 = v22 + v22;
  long double v24 = v17 * 0.5;
  long double v25 = (double)v15 / v23;
  long double v26 = tan(v24);
  *(void *)a1 = 4;
  *(long double *)(a1 + 8) = (double)v14 / (v26 + v26);
  *(long double *)(a1 + 16) = v25;
  *(double *)(a1 + 24) = v18;
  *(double *)(a1 + 32) = v21;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_DWORD *)(a1 + 168) = v14;
  *(_DWORD *)(a1 + 172) = v15;
  return result;
}

void _jac_patch_to_improj2(double *a1, float *a2, float *a3, double *a4, uint64_t a5, float a6, float a7)
{
  v58[6] = *MEMORY[0x263EF8340];
  float v11 = a2[1];
  double v12 = a4[10];
  double v13 = *a2 - a4[9];
  float64x2_t v56 = 0uLL;
  double v57 = 0.0;
  double v14 = (v11 - v12) * (v11 - v12) + v13 * v13;
  double v15 = a2[2] - a4[11];
  float v16 = sqrt(v14 + v15 * v15);
  v53.f64[0] = a6;
  v53.f64[1] = a7;
  g_improj2_to_xyz(a5, &v53, v56.f64);
  double v17 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(void *)&vmulq_f64(v56, v56).f64[1]), v56.f64[0], v56.f64[0]) + v57 * v57);
  if (v17 <= 0.0)
  {
    float64x2_t v18 = 0uLL;
    double v19 = 0.0;
  }
  else
  {
    float64x2_t v18 = vdivq_f64(v56, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v17, 0));
    double v19 = v57 / v17;
  }
  float64x2_t v54 = vmulq_n_f64(v18, v16);
  double v55 = v19 * v16;
  double v20 = *a3;
  float v21 = a3[2];
  if (fabs(v20) <= fabsf(v21))
  {
    double v25 = (float)-v21;
    float v22 = a3[1];
    double v24 = v22;
    double v23 = 0.0;
  }
  else
  {
    float v22 = a3[1];
    double v23 = (float)-v22;
    double v24 = 0.0;
    double v25 = *a3;
  }
  double v26 = sqrt(v25 * v25 + v23 * v23 + v24 * v24);
  double v27 = 0.0;
  double v28 = 0.0;
  double v29 = 0.0;
  if (v26 > 0.0)
  {
    double v29 = v23 / v26;
    double v28 = v25 / v26;
    double v27 = v24 / v26;
  }
  double v30 = v22;
  double v31 = v21;
  double v32 = v30 * v27 - v28 * v31;
  double v33 = v31 * v29 - v27 * v20;
  double v34 = v20 * v28 - v29 * v30;
  double v35 = a4[1];
  double v37 = a4[2];
  double v36 = a4[3];
  double v38 = *a4 * v29 + 0.0 + v36 * v28;
  double v39 = *a4 * v32 + 0.0 + v36 * v33;
  double v40 = a4[6];
  double v41 = a4[7];
  double v42 = v38 + v40 * v27;
  double v43 = v39 + v40 * v34;
  double v44 = v35 * v29 + 0.0;
  double v45 = v35 * v32 + 0.0;
  double v46 = v37 * v29 + 0.0;
  double v47 = v37 * v32 + 0.0;
  double v48 = a4[4];
  double v49 = a4[5];
  *(double *)uint64_t v58 = v42;
  *(double *)&v58[1] = v44 + v48 * v28 + v41 * v27;
  double v50 = v45 + v48 * v33 + v41 * v34;
  double v51 = v47 + v49 * v33;
  double v52 = a4[8];
  *(double *)&_OWORD v58[2] = v46 + v49 * v28 + v52 * v27;
  *(double *)&v58[3] = v43;
  *(double *)&v58[4] = v50;
  *(double *)&v58[5] = v51 + v52 * v34;
  g_jac_apply_proj(v54.f64, a5, (uint64_t)v58, a1, 2);
}

uint64_t vl_verify_post(uint64_t a1, uint64_t a2, double *a3, void *a4, uint64_t a5, float *a6, uint64_t a7, uint64_t a8)
{
  double v12 = a3[9];
  double v13 = a3[10];
  v46[0] = v12;
  v46[1] = v13;
  double v14 = a3[11];
  v46[2] = v14;
  float v15 = *(float *)(a7 + 632);
  float v16 = *(float *)(a7 + 640);
  if (v16 < 0.0 && *(_DWORD *)(a7 + 560))
  {
    float v17 = a6[24];
    if (v17 >= 0.000001)
    {
      if (model_0)
      {
        if (*(float *)(model_0 + 40) > v17) {
          return 32;
        }
        return 1;
      }
      printf("%sError : ", (const char *)&str_1_4);
      printf("vl_hs: Model not initiated");
      putchar(10);
      if (*(float *)(model_0 + 40) <= v17) {
        return 1;
      }
    }
    return 32;
  }
  if (*(_DWORD *)(a7 + 592) && *a4 < *(int *)(a7 + 612))
  {
    log_col_app((uint64_t)"%sFailed%s due to low inlier number. %d/%d", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_21BB738AE);
    return 32;
  }
  if (*(_DWORD *)(a7 + 596)
    && ((float v19 = vl_height_get_for_global(a2 + 608, v46), v19 < *(float *)(a7 + 620)) || v19 > *(float *)(a7 + 616)))
  {
    if (v19 == 3.4028e38) {
      log_col_app((uint64_t)"%sRejected%s: height = %sNone%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_21BB738AE);
    }
    else {
      log_col_app((uint64_t)"%sRejected%s: height = %s%.02f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_21BB738AE);
    }
    return 128;
  }
  else
  {
    if (*(_DWORD *)(a7 + 600))
    {
      double v20 = sqrt(v13 * v13 + v12 * v12 + v14 * v14);
      double v21 = 0.0;
      double v22 = 0.0;
      double v23 = 0.0;
      if (v20 > 0.0)
      {
        double v21 = v12 / v20;
        double v22 = v13 / v20;
        double v23 = v14 / v20;
      }
      double v24 = *(float *)(a1 + 232);
      double v25 = *(float *)(a1 + 236);
      double v26 = *(float *)(a1 + 240);
      if (acos(-(v22 * (a3[3] * v24 + 0.0 + a3[4] * v25 + a3[5] * v26))- v21 * (*a3 * v24 + 0.0 + a3[1] * v25 + a3[2] * v26)- v23 * (a3[6] * v24 + 0.0 + a3[7] * v25 + a3[8] * v26)) > *(double *)(a7 + 624))
      {
        log_col_app((uint64_t)"%sRejected%s: gravity = %s%.02f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_21BB738AE);
        return 256;
      }
    }
    if (!*(_DWORD *)(a7 + 604)) {
      goto LABEL_24;
    }
    double v27 = *(double *)(a1 + 200);
    double v28 = *(double *)(a1 + 208);
    double v29 = *(double *)(a1 + 216);
    double v30 = v12 - v27;
    double v31 = v13 - v28;
    double v32 = v14 - v29;
    double v33 = sqrt(v28 * v28 + v27 * v27 + v29 * v29);
    double v34 = 0.0;
    double v35 = 0.0;
    double v36 = 0.0;
    if (v33 > 0.0)
    {
      double v34 = -v27 / v33;
      double v35 = -v28 / v33;
      double v36 = -v29 / v33;
    }
    double v37 = v31 * v35 + v30 * v34 + v32 * v36;
    if (sqrt((v31 - v35 * v37) * (v31 - v35 * v37)+ (v30 - v34 * v37) * (v30 - v34 * v37)+ (v32 - v36 * v37) * (v32 - v36 * v37)) <= v15 * *(float *)(a1 + 224))
    {
LABEL_24:
      if (a6[24] < v16)
      {
        log_col_app((uint64_t)"%sRejected%s: conf = %s%.04f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_21BB738AE);
        return 4096;
      }
      log_col_app((uint64_t)"%sAccepted%s: conf = %s%.04f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_21BB738AE);
      float v45 = *(float *)(a7 + 644);
      if (v45 >= 0.0 && sqrtf((float)(a6[25] + a6[32]) + a6[39]) > v45)
      {
        log_col_app((uint64_t)"%sRejected%s: sdev = %s%.02f%s.", v38, v39, v40, v41, v42, v43, v44, (char)&unk_21BB738AE);
        return 64;
      }
      return 1;
    }
    log_col_app((uint64_t)"%sRejected%s: gps = %s%.02f%s.", a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (char)&unk_21BB738AE);
    return 512;
  }
}

tm *dtime_get(tm *result, int *a2, int *a3, int *a4, int *a5, int *a6, double *a7, int tm_gmtoff)
{
  int tm_sec = result->tm_sec;
  if (result->tm_sec == -16777215) {
    __assert_rtn("dtime_get", "arch_dtime.c", 450, "dtime_is_def(t)");
  }
  float v15 = result;
  if (tm_gmtoff == 1000000)
  {
    time_t v50 = 0;
    memset(&v49, 0, sizeof(v49));
    time(&v50);
    double result = localtime_r(&v50, &v49);
    tm_gmtoff = v49.tm_gmtoff;
    int tm_sec = v15->tm_sec;
  }
  double v16 = *(double *)&v15->tm_hour + (double)tm_gmtoff;
  if (v16 < 0.0 || v16 >= 86400.0)
  {
    int v18 = vcvtmd_s64_f64(v16 / 86400.0);
    tm_sec += v18;
    double v16 = v16 - (double)v18 * 86400.0;
  }
  double v19 = v16 / 60.0 / 60.0;
  int v20 = (int)v19;
  if (a5)
  {
    int v21 = 0;
    *a5 = v20;
  }
  else
  {
    int v21 = (int)v19;
  }
  double v22 = v16 - (double)(3600 * v20);
  int v23 = (int)(v22 / 60.0);
  if (a6) {
    *a6 = v23;
  }
  if (a7) {
    *a7 = v22 - (double)(60 * v23);
  }
  if (a5)
  {
    int v24 = *a5;
    if (*a5 >= 24)
    {
      *a5 -= 24;
LABEL_20:
      ++tm_sec;
      goto LABEL_25;
    }
    if (v24 < 0)
    {
      *a5 = v24 + 24;
LABEL_24:
      --tm_sec;
    }
  }
  else
  {
    if (v21 > 23) {
      goto LABEL_20;
    }
    if (v21 < 0) {
      goto LABEL_24;
    }
  }
LABEL_25:
  if (tm_sec != -1)
  {
    unint64_t v25 = 0;
    if (a2)
    {
      int v26 = 1969;
      do
      {
        unint64_t v27 = v25;
        if ((++v26 & 3) != 0) {
          uint64_t v28 = 365;
        }
        else {
          uint64_t v28 = 366;
        }
        unint64_t v25 = v28 + v27;
      }
      while (v25 <= tm_sec);
      char v29 = 0;
      *a2 = v26;
    }
    else
    {
      char v29 = -79;
      do
      {
        unint64_t v27 = v25;
        if ((++v29 & 3) != 0) {
          uint64_t v31 = 365;
        }
        else {
          uint64_t v31 = 366;
        }
        unint64_t v25 = v31 + v27;
      }
      while (v25 <= tm_sec);
    }
    unint64_t v32 = tm_sec - v27;
    if (!a3)
    {
      if (a2)
      {
        unint64_t v40 = v32 - 31;
        if ((uint64_t)v32 < 31) {
          goto LABEL_110;
        }
        unint64_t v41 = (*(unsigned char *)a2 & 3) != 0 ? 28 : 29;
        LODWORD(v32) = v32 - 31;
        BOOL v47 = v40 >= v41;
        unint64_t v42 = v40 - v41;
        if (!v47) {
          goto LABEL_110;
        }
      }
      else
      {
        unint64_t v43 = v32 - 31;
        if ((uint64_t)v32 < 31) {
          goto LABEL_110;
        }
        unint64_t v44 = (v29 & 3) != 0 ? 28 : 29;
        LODWORD(v32) = v32 - 31;
        BOOL v47 = v43 >= v44;
        unint64_t v42 = v43 - v44;
        if (!v47) {
          goto LABEL_110;
        }
      }
      LODWORD(v32) = v42;
      if ((uint64_t)v42 >= 31)
      {
        LODWORD(v32) = v42 - 31;
        if (v42 >= 0x3D)
        {
          LODWORD(v32) = v42 - 61;
          if (v42 >= 0x5C)
          {
            LODWORD(v32) = v42 - 92;
            if (v42 >= 0x7A)
            {
              LODWORD(v32) = v42 - 122;
              if (v42 >= 0x99)
              {
                LODWORD(v32) = v42 - 153;
                if (v42 >= 0xB8)
                {
                  LODWORD(v32) = v42 - 184;
                  if (v42 >= 0xD6)
                  {
                    LODWORD(v32) = v42 - 214;
                    if (v42 >= 0xF5)
                    {
                      LODWORD(v32) = v42 - 245;
                      if (v42 >= 0x113)
                      {
                        int v45 = -306;
                        if (v42 < 0x132) {
                          int v45 = -275;
                        }
                        LODWORD(v32) = v45 + v42;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      goto LABEL_110;
    }
    if (a2)
    {
      int v33 = 1;
      unint64_t v34 = v32 - 31;
      if ((uint64_t)v32 < 31) {
        goto LABEL_109;
      }
      *a3 = 1;
      unint64_t v35 = 28;
      if ((*(unsigned char *)a2 & 3) == 0) {
        unint64_t v35 = 29;
      }
      BOOL v47 = v34 >= v35;
      unint64_t v32 = v34 - v35;
      if (!v47)
      {
LABEL_93:
        int v33 = 2;
LABEL_94:
        LODWORD(v32) = v34;
        goto LABEL_109;
      }
      LODWORD(v34) = v32 - 31;
      if ((uint64_t)v32 >= 31)
      {
        int v36 = v32 - 61;
        if (v32 >= 0x3D)
        {
          LODWORD(v34) = v32 - 92;
          if (v32 >= 0x5C)
          {
            int v37 = v32 - 122;
            if (v32 >= 0x7A)
            {
              LODWORD(v34) = v32 - 153;
              if (v32 >= 0x99)
              {
                int v38 = v32 - 184;
                if (v32 >= 0xB8)
                {
                  LODWORD(v34) = v32 - 214;
                  if (v32 >= 0xD6)
                  {
                    int v39 = v32 - 245;
                    if (v32 >= 0xF5)
                    {
                      LODWORD(v34) = v32 - 275;
                      if (v32 >= 0x113)
                      {
                        int v33 = 12;
                        BOOL v47 = v32 >= 0x132;
                        LODWORD(v32) = v32 - 306;
                        if (!v47) {
                          goto LABEL_94;
                        }
                        *a3 = 12;
                        int v33 = 13;
LABEL_109:
                        *a3 = v33;
LABEL_110:
                        int v30 = v32 + 1;
                        goto LABEL_111;
                      }
LABEL_118:
                      int v33 = 11;
                      LODWORD(v32) = v39;
                      goto LABEL_109;
                    }
                    goto LABEL_116;
                  }
                  goto LABEL_108;
                }
                goto LABEL_106;
              }
              goto LABEL_104;
            }
            goto LABEL_102;
          }
          goto LABEL_100;
        }
        goto LABEL_98;
      }
    }
    else
    {
      unint64_t v34 = v32 - 31;
      if ((uint64_t)v32 < 31)
      {
        int v33 = 1;
        goto LABEL_109;
      }
      unint64_t v46 = 28;
      if ((v29 & 3) == 0) {
        unint64_t v46 = 29;
      }
      BOOL v47 = v34 >= v46;
      unint64_t v32 = v34 - v46;
      if (!v47) {
        goto LABEL_93;
      }
      LODWORD(v34) = v32 - 31;
      if ((uint64_t)v32 >= 31)
      {
        int v36 = v32 - 61;
        if (v32 >= 0x3D)
        {
          LODWORD(v34) = v32 - 92;
          if (v32 >= 0x5C)
          {
            int v37 = v32 - 122;
            if (v32 >= 0x7A)
            {
              LODWORD(v34) = v32 - 153;
              if (v32 >= 0x99)
              {
                int v38 = v32 - 184;
                if (v32 >= 0xB8)
                {
                  LODWORD(v34) = v32 - 214;
                  if (v32 >= 0xD6)
                  {
                    int v39 = v32 - 245;
                    if (v32 >= 0xF5)
                    {
                      if (v32 >= 0x113)
                      {
                        BOOL v47 = v32 >= 0x132;
                        int v48 = -306;
                        if (v32 < 0x132) {
                          int v48 = -275;
                        }
                        LODWORD(v32) = v32 + v48;
                        if (v47) {
                          int v33 = 13;
                        }
                        else {
                          int v33 = 12;
                        }
                        goto LABEL_109;
                      }
                      goto LABEL_118;
                    }
LABEL_116:
                    int v33 = 10;
                    goto LABEL_94;
                  }
LABEL_108:
                  int v33 = 9;
                  LODWORD(v32) = v38;
                  goto LABEL_109;
                }
LABEL_106:
                int v33 = 8;
                goto LABEL_94;
              }
LABEL_104:
              int v33 = 7;
              LODWORD(v32) = v37;
              goto LABEL_109;
            }
LABEL_102:
            int v33 = 6;
            goto LABEL_94;
          }
LABEL_100:
          int v33 = 5;
          LODWORD(v32) = v36;
          goto LABEL_109;
        }
LABEL_98:
        int v33 = 4;
        goto LABEL_94;
      }
    }
    int v33 = 3;
    goto LABEL_109;
  }
  if (a2) {
    *a2 = 1969;
  }
  if (a3) {
    *a3 = 12;
  }
  int v30 = 31;
LABEL_111:
  if (a4) {
    *a4 = v30;
  }
  return result;
}

void _da_sort_indexed(char *a1, int64_t a2, void **a3, int64_t *a4, int64_t *a5, size_t a6, int (__cdecl *a7)(const void *, const void *))
{
  size_t v14 = a6 + 8;
  float v15 = (char *)malloc_type_malloc((a6 + 8) * a2, 0x38CCE670uLL);
  if (*a5 < a2)
  {
    free(*a3);
    *a3 = malloc_type_malloc(8 * a2, 0xD43CE050uLL);
    *a5 = a2;
  }
  if (a2)
  {
    int v24 = a4;
    uint64_t v16 = 0;
    float v17 = a1;
    int v18 = v15;
    do
    {
      memcpy(v18, v17, a6);
      double v19 = &v18[a6];
      *(void *)double v19 = v16;
      int v18 = v19 + 8;
      ++v16;
      v17 += a6;
    }
    while (a2 != v16);
    qsort(v15, a2, v14, a7);
    uint64_t v20 = 0;
    int v21 = v15;
    a4 = v24;
    do
    {
      memcpy(a1, v21, a6);
      double v22 = &v21[a6];
      uint64_t v23 = *(void *)v22;
      int v21 = v22 + 8;
      *((void *)*a3 + v20++) = v23;
      a1 += a6;
    }
    while (a2 != v20);
  }
  else
  {
    qsort(v15, 0, v14, a7);
  }
  *a4 = a2;
  free(v15);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

void CGImageRelease(CGImageRef image)
{
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t GEOAngleDifferenceDegrees()
{
  return MEMORY[0x270F30070]();
}

uint64_t GEOCalculateDistance()
{
  return MEMORY[0x270F30090]();
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x270F300A8]();
}

uint64_t GEOConfigGetInteger()
{
  return MEMORY[0x270F300D0]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x270F30140]();
}

uint64_t GEOGetMonotonicTime()
{
  return MEMORY[0x270F30170]();
}

uint64_t GEOMapPointForCoordinate()
{
  return MEMORY[0x270F30180]();
}

uint64_t GEOOnce()
{
  return MEMORY[0x270F301B8]();
}

uint64_t GEOTileKeyEquals()
{
  return MEMORY[0x270F301D8]();
}

uint64_t GEOTileLoaderClientIdentifier()
{
  return MEMORY[0x270F301E0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__double cosval = v2;
  result.__double sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__double cosval = v2;
  result.__double sinval = v1;
  return result;
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x270ED7ED0]();
}

int __vsprintf_chk(char *a1, int a2, size_t a3, const char *a4, va_list a5)
{
  return MEMORY[0x270ED7F38](a1, *(void *)&a2, a3, a4, a5);
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
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

uint64_t archive_entry_free()
{
  return MEMORY[0x270F97D48]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x270F97D78]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x270F97DC0]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x270F97E00]();
}

uint64_t archive_entry_set_size()
{
  return MEMORY[0x270F97E08]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x270F97FA0]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x270F97FA8]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x270F97FB0]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x270F97FE8]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x270F97FF0]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x270F97FF8]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x270F98018]();
}

uint64_t archive_write_set_format_v7tar()
{
  return MEMORY[0x270F98080]();
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x270ED86F0](a1);
}

void bzero(void *a1, size_t a2)
{
}

float cbrtf(float a1)
{
  MEMORY[0x270ED87C0](a1);
  return result;
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F58](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x270F27EC8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_context_auto()
{
  return MEMORY[0x270F27F10]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_get_default_storage_type()
{
  return MEMORY[0x270F27F48]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x270F27F68]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_input_vimagebuffer_planar8()
{
  return MEMORY[0x270F27FD8]();
}

uint64_t espresso_network_change_blob_shape()
{
  return MEMORY[0x270F27FF8]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x270F28030]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x270F28048]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x270F28080]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return MEMORY[0x270F30248]();
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x270F30260]();
}

uint64_t geo_isolate_sync_data()
{
  return MEMORY[0x270F30268]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x270F30270]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270ED9DE0](a1, a2);
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x270EDA028](*(void *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x270EDA030](*(void *)&a2, a1);
  return result;
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A8](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5C0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

int nftw(const char *a1, int (__cdecl *a2)(const char *, const stat *, int, FTW *), int a3, int a4)
{
  return MEMORY[0x270EDA728](a1, a2, *(void *)&a3, *(void *)&a4);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

void perror(const char *a1)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int rand_r(unsigned int *a1)
{
  return MEMORY[0x270EDB0E0](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB150](__ptr, __size);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

void rewind(FILE *a1)
{
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

long double sinh(long double __x)
{
  MEMORY[0x270EDB4F8](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x270EDB650](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x270EDEF18](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF2E8](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF380](src, dest, tempBuffer, *(void *)&flags);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
}