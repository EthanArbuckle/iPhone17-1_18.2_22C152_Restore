uint64_t mfm_lock()
{
  uint64_t result;

  if (mfm_arena) {
    return malloc_zone_error(64, 0, (uint64_t)"exclaves lock not supported");
  }
  return result;
}

void mfm_reinit_lock()
{
  uint64_t v0 = mfm_arena;
  if (mfm_arena)
  {
    *(void *)mfm_arena = 0;
    *(void *)(v0 + 8) = 0;
  }
}

uint64_t mfmi_enumerator(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  uint64_t result = mfmi_read_zone(a1, a4, a5, &v27);
  if (result) {
    return result;
  }
  if ((a3 & 4) != 0)
  {
    uint64_t v28 = a4;
    uint64_t v29 = 0x8000;
    a6(a1, a2, 4, &v28, 1);
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 1) == 0) {
        return 0;
      }
      goto LABEL_8;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v28 = a4 + 0x8000;
  uint64_t v29 = 1015808;
  a6(a1, a2, 2, &v28, 1);
  if ((a3 & 1) == 0) {
    return 0;
  }
LABEL_8:
  uint64_t v12 = v27;
  if (!*(void *)(v27 + 24)) {
    return 0;
  }
  unint64_t v13 = 0;
  unsigned int v14 = 0;
  do
  {
    unint64_t v15 = (v13 + 1) >> 5;
    uint64_t v16 = v15 & 0x7FFFFFFFFFFFFFELL;
    uint64_t v17 = v12 + 8 * (v15 & 0x7FFFFFFFFFFFFFELL);
    unint64_t v18 = *(void *)(v17 + 256) >> (v13 + 1);
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
LABEL_12:
      unint64_t v20 = v19 + 1;
      goto LABEL_13;
    }
    unint64_t v23 = ((_BYTE)v13 + 1) & 0x3F;
    unint64_t v24 = *(void *)(v17 + 272);
    if (!v24)
    {
      unint64_t v25 = *(void *)(v12 + ((8 * v15) | 8) + 256);
      if (v23 < 0x31) {
        LODWORD(v26) = 0;
      }
      else {
        uint64_t v26 = *(void *)(v12 + 8 * v16 + 280);
      }
      unint64_t v19 = (unsigned __int16)((v25 >> v23) | ((unint64_t)(2 * v26) << (v23 ^ 0x3Fu)));
      goto LABEL_12;
    }
    unint64_t v20 = __clz(__rbit64(v24)) - v23 + 65;
LABEL_13:
    if ((*(void *)(v12 + 256 + ((v13 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v13) & *(void *)(v12
                                                                                                  + 256
                                                                                                  + ((v13 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8))) != 0)
    {
      uint64_t v21 = v12;
      if (v14 == 32)
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))a6)(a1, a2, 1, &v28);
        unsigned int v14 = 0;
        uint64_t v21 = v27;
      }
      v22 = &v28 + 2 * v14;
      uint64_t *v22 = v12 + 16 * v13 + 0x8000 + a4 - v21;
      v22[1] = 16 * v20;
      ++v14;
      uint64_t v12 = v21;
    }
    v13 += v20;
  }
  while (v13 < *(void *)(v12 + 24));
  if (v14) {
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))a6)(a1, a2, 1, &v28);
  }
  return 0;
}

unint64_t mfmi_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x4000) {
    return 0;
  }
  else {
    return (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
}

uint64_t mfmi_check()
{
  return 1;
}

uint64_t mfmi_print_self(uint64_t a1, int a2)
{
  uint64_t result = mfm_arena;
  if (mfm_arena) {
    return print_mfm_arena(mfm_arena, a2 != 0, (void (*)(const char *, ...))malloc_report_simple);
  }
  return result;
}

uint64_t mfmi_force_lock()
{
  if (mfm_arena) {
    return malloc_zone_error(64, 0, (uint64_t)"exclaves lock not supported");
  }
  return result;
}

uint64_t mfmi_force_unlock()
{
  if (mfm_arena) {
    return malloc_zone_error(64, 0, (uint64_t)"exclaves lock not supported");
  }
  return result;
}

void mfmi_statistics_self(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = mfm_arena;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if (v2)
  {
    unint64_t v3 = *(void *)(v2 + 32);
    *(_DWORD *)a2 = *(void *)(v2 + 40);
    uint64_t v4 = 16 * *(unsigned int *)(v2 + 16);
    *(void *)(a2 + 24) = 0x100000;
    uint64_t v5 = ((((v3 >> 2) & 0x1FFFFFFFFFFFFFF8) + *MEMORY[0x263EF8AF8] + 255) & -*MEMORY[0x263EF8AF8])
       + *(void *)(a2 + 16)
       + ((*MEMORY[0x263EF8AF8] + 16 * v3 - 1) & -*MEMORY[0x263EF8AF8]);
    *(void *)(a2 + 8) = v4;
    *(void *)(a2 + 16) = v5;
  }
}

uint64_t mfmi_locked()
{
  if (mfm_arena) {
    malloc_zone_error(64, 0, (uint64_t)"exclaves lock not supported");
  }
  return 0;
}

void mfmi_reinit_lock()
{
  uint64_t v0 = mfm_arena;
  if (mfm_arena)
  {
    *(void *)mfm_arena = 0;
    *(void *)(v0 + 8) = 0;
  }
}

uint64_t mfmi_print_task(uint64_t a1, unsigned int a2, const void *a3, uint64_t (*a4)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t (*a5)(const char *, ...))
{
  uint64_t v9 = 0;
  if (mfmi_read_zone(a1, (uint64_t)a3, a4, &v9)) {
    return a5("Failed to read ProbGuard zone at %p\n", a3);
  }
  else {
    return print_mfm_arena(v9, a2 > 1, (void (*)(const char *, ...))a5);
  }
}

uint64_t mfmi_statistics_task(uint64_t a1, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t a4)
{
  uint64_t v9 = 0;
  uint64_t result = mfmi_read_zone(a1, a2, a3, &v9);
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  if (!result)
  {
    uint64_t v6 = v9;
    unint64_t v7 = *(void *)(v9 + 32);
    *(_DWORD *)a4 = *(void *)(v9 + 40);
    *(void *)(a4 + 24) = 0x100000;
    uint64_t v8 = ((((v7 >> 2) & 0x1FFFFFFFFFFFFFF8) + *MEMORY[0x263EF8AF8] + 255) & -*MEMORY[0x263EF8AF8])
       + *(void *)(a4 + 16)
       + ((*MEMORY[0x263EF8AF8] + 16 * v7 - 1) & -*MEMORY[0x263EF8AF8]);
    *(void *)(a4 + 8) = 16 * *(unsigned int *)(v6 + 16);
    *(void *)(a4 + 16) = v8;
  }
  return result;
}

uint64_t mfmi_read_zone(uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void *a4)
{
  uint64_t v5 = a3;
  if (!a3)
  {
    if (task && !mach_task_is_self(task)) {
      mfmi_read_zone_cold_1();
    }
    uint64_t v5 = _malloc_default_reader;
  }

  return v5(task, a2, 0x100000, a4);
}

uint64_t _malloc_default_reader(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1 && !mach_task_is_self(a1)) {
    mfmi_read_zone_cold_1();
  }
  *a4 = a2;
  return 0;
}

uint64_t print_mfm_arena(uint64_t a1, char a2, void (*a3)(const char *, ...))
{
  a3("mfm_arena info\n");
  a3(" address      : %p\n", (const void *)a1);
  a3(" size         : %zd\n", 16 * *(unsigned int *)(a1 + 16));
  a3(" high water   : %zd\n", 16 * *(void *)(a1 + 24));
  a3(" arena        : [%p, %p)\n", (const void *)(a1 + 0x8000), (const void *)(a1 + 0x100000));
  a3("\n");
  a3("freelists\n");
  for (uint64_t i = 0; i != 11; ++i)
  {
    uint64_t v6 = a1 + 16 * i;
    a3(" size %-8zd:\n", 16 << i);
    uint64_t v9 = *(void *)(v6 + 48);
    uint64_t v8 = (uint64_t *)(v6 + 48);
    for (uint64_t j = v9; ; uint64_t j = *v10)
    {
      v10 = (uint64_t *)(a1 + 16 * j);
      if (v10 == v8) {
        break;
      }
      unint64_t v11 = ((16 * j - 0x8000) >> 4) + 1;
      unint64_t v12 = v11 >> 5;
      uint64_t v13 = (v11 >> 5) & 0x7FFFFFFFFFFFFFELL;
      uint64_t v14 = a1 + 8 * v13;
      unint64_t v15 = *(void *)(v14 + 256) >> v11;
      if (v15)
      {
        unint64_t v16 = __clz(__rbit64(v15)) + 1;
LABEL_6:
        a3("  [%p, %p) size=%zd\n", (const void *)(a1 + 16 * j), &v10[2 * v16], 16 * v16);
        continue;
      }
      unint64_t v17 = v11 & 0x3F;
      unint64_t v18 = *(void *)(v14 + 272);
      if (v18)
      {
        unint64_t v16 = __clz(__rbit64(v18)) - v17 + 65;
        goto LABEL_6;
      }
      unint64_t v19 = *(void *)(a1 + ((8 * v12) | 8) + 256);
      if (v17 < 0x31) {
        LODWORD(v20) = 0;
      }
      else {
        uint64_t v20 = *(void *)(a1 + 8 * v13 + 280);
      }
      uint64_t v21 = (unsigned __int16)((v19 >> v17) | ((unint64_t)(2 * v20) << (v17 ^ 0x3Fu)))
          + 1;
      a3("  [%p, %p) size=%zd\n", (const void *)(a1 + 16 * j), &v10[2 * v21], 16 * v21);
    }
  }
  uint64_t result = ((uint64_t (*)(const char *))a3)("\n");
  if (a2)
  {
    a3("blocks\n");
    unint64_t v23 = *(void *)(a1 + 24);
    if (v23)
    {
      unint64_t v24 = 0;
      do
      {
        unint64_t v25 = (v24 + 1) >> 5;
        uint64_t v26 = v25 & 0x7FFFFFFFFFFFFFELL;
        uint64_t v27 = a1 + 8 * (v25 & 0x7FFFFFFFFFFFFFELL);
        unint64_t v28 = *(void *)(v27 + 256) >> (v24 + 1);
        if (v28)
        {
          unint64_t v29 = __clz(__rbit64(v28));
        }
        else
        {
          unint64_t v32 = ((_BYTE)v24 + 1) & 0x3F;
          unint64_t v33 = *(void *)(v27 + 272);
          if (v33)
          {
            unint64_t v30 = __clz(__rbit64(v33)) - v32 + 65;
            goto LABEL_21;
          }
          unint64_t v34 = *(void *)(a1 + ((8 * v25) | 8) + 256);
          if (v32 < 0x31) {
            LODWORD(v35) = 0;
          }
          else {
            uint64_t v35 = *(void *)(a1 + 8 * v26 + 280);
          }
          unint64_t v29 = (unsigned __int16)((v34 >> v32) | ((unint64_t)(2 * v35) << (v32 ^ 0x3Fu)));
        }
        unint64_t v30 = v29 + 1;
LABEL_21:
        if ((*(void *)(a1 + 256 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v24) & *(void *)(a1 + 256 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8))) != 0) {
          v31 = "*";
        }
        else {
          v31 = " *";
        }
        a3(" %c[%p, %p) size=%zd\n", *v31, (const void *)(a1 + 16 * v24 + 0x8000), (const void *)(a1 + 16 * v24 + 0x8000 + 16 * v30), 16 * v30);
        v24 += v30;
        unint64_t v23 = *(void *)(a1 + 24);
      }
      while (v24 < v23);
    }
    a3("  [%p, %p) size=%zd (bump)\n", (const void *)(a1 + 16 * v23 + 0x8000), (const void *)(a1 + 0x100000), 1015808 - 16 * v23);
    return ((uint64_t (*)(const char *))a3)("\n");
  }
  return result;
}

uint64_t xzm_segment_group_segment_foreach_span(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1 + 2128;
  if (*(unsigned char *)(a1 + 36) != 1)
  {
    unint64_t v7 = v3 + 80 * *(unsigned int *)(a1 + 32);
    if (v3 >= v7) {
      return 0;
    }
    while (1)
    {
      int v8 = *(unsigned char *)(v3 + 64) & 0xF;
      if ((v8 - 5) < 4) {
        break;
      }
      if (v8 == 2)
      {
        uint64_t v9 = 1;
        goto LABEL_8;
      }
      unint64_t v10 = 0;
      do
      {
        unint64_t v11 = v3 + v10 + 80;
        unsigned int v12 = *(unsigned char *)(v3 + v10 + 144) & 0xF;
        BOOL v13 = v12 > 7 || ((1 << v12) & 0xE4) == 0;
        v10 += 80;
      }
      while (v13 && v12 != 8 && v11 < v7);
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, void))(a2 + 16))(a2, v3, -858993459 * (v10 >> 4));
      if (result) {
        return result;
      }
      v3 += v10;
LABEL_10:
      if (v3 >= v7) {
        return 0;
      }
    }
    uint64_t v9 = *(unsigned int *)(v3 + 72);
LABEL_8:
    uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a2 + 16))(a2, v3, v9);
    if (result) {
      return result;
    }
    v3 += 80 * v9;
    goto LABEL_10;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 2200);
  uint64_t v5 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a2 + 16);

  return v5(a2, v3, v4);
}

uint64_t xzm_segment_table_foreach(unsigned int *a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  if (a4)
  {
    unint64_t v8 = *a4;
    if (a2) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  unint64_t v8 = 0;
  if (!a2)
  {
LABEL_11:
    uint64_t result = 0;
    if (a4) {
      *a4 = v8;
    }
    return result;
  }
LABEL_5:
  while (1)
  {
    unsigned int v9 = *a1++;
    unint64_t v10 = (unint64_t)v9 << 15;
    if (v9 && v8 != v10)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t))(a3 + 16))(a3, v10);
      unint64_t v8 = v10;
      if (result) {
        return result;
      }
    }
    if (!--v6) {
      goto LABEL_11;
    }
  }
}

uint64_t xzm_ptr_in_use_enumerator(uint64_t task, uint64_t a2, char a3, unint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, void **), void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))
{
  unint64_t v7 = a5;
  if (!a5)
  {
    if (task && !mach_task_is_self(task)) {
      mfmi_read_zone_cold_1();
    }
    unint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void **))_malloc_default_reader_0;
  }
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  unint64_t v29 = 0;
  uint64_t result = _xzm_introspect_map_zone_and_main(task, a4, v7, &v31, &v30, &v29);
  if (!result)
  {
    unint64_t v13 = v29;
    uint64_t v14 = v30;
    BOOL v15 = v29 == a4;
    if (v29 != a4
      || (uint64_t result = mfm_introspect(task, a2, a3, *(void *)(v30 + 368), (uint64_t (*)(task_name_t, uint64_t, uint64_t, void *))v7, a6), !result))
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 0x40000000;
      v25[2] = __xzm_ptr_in_use_enumerator_block_invoke;
      v25[3] = &__block_descriptor_tmp;
      BOOL v27 = (a3 & 4) != 0;
      BOOL v28 = v15;
      int v26 = task;
      v25[4] = a6;
      v25[5] = a2;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 0x40000000;
      v20[2] = __xzm_ptr_in_use_enumerator_block_invoke_3;
      v20[3] = &__block_descriptor_tmp_4;
      BOOL v22 = v27;
      int v21 = task;
      v20[4] = a6;
      v20[5] = a2;
      BOOL v23 = (a3 & 2) != 0;
      char v24 = a3 & 1;
      if (v13 == a4)
      {
        unint64_t v16 = v17;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 0x40000000;
        v17[2] = __xzm_ptr_in_use_enumerator_block_invoke_4;
        v17[3] = &__block_descriptor_tmp_6;
        BOOL v19 = (a3 & 2) != 0;
        int v18 = task;
        v17[4] = a6;
        v17[5] = a2;
      }
      else
      {
        unint64_t v16 = 0;
      }
      return _xzm_introspect_enumerate(task, (uint64_t (*)(void))v7, a4, v31, v13, v14, a3 & 1, (uint64_t)v25, (uint64_t)&__block_literal_global, (uint64_t)v20, (uint64_t)v16);
    }
  }
  return result;
}

void xzm_print_task(uint64_t a1, uint64_t a2, const void *a3, uint64_t (*a4)(void), void (*a5)(const char *, ...))
{
  uint64_t v99 = 0;
  uint64_t v100 = 0;
  unint64_t v98 = 0;
  if (!_xzm_introspect_map_zone_and_main(a1, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void **))a4, &v100, &v99, &v98))
  {
    unsigned int v9 = (const void *)v98;
    a5("Begin xzone malloc JSON:\n");
    a5("{\n");
    a5("\"desc\": \"xzone malloc\", \n");
    a5("\"addr\": \"%p\", \n", a3);
    a5("\"segment_size\": %zu, \n", 0x400000uLL);
    a5("\"slice_size\": %zu, \n", 0x4000uLL);
    unint64_t v10 = (unsigned __int8 *)v100;
    a5("\"mzone\": %d, \n", *(unsigned __int16 *)(v100 + 208));
    a5("\"is_main\": %d, \n", v9 == a3);
    a5("\"max_slot_config\": %d, \n", v10[240] & 3);
    uint64_t v94 = 0;
    v95 = &v94;
    uint64_t v96 = 0x2000000000;
    uint64_t v97 = 0;
    uint64_t v90 = 0;
    v91 = &v90;
    uint64_t v92 = 0x2000000000;
    uint64_t v93 = 0;
    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x2000000000;
    v89[3] = 0;
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 0x40000000;
    v87[2] = __xzm_print_block_invoke;
    v87[3] = &unk_2655BB3D0;
    int v88 = a1;
    v87[4] = v89;
    v87[5] = &v94;
    v87[6] = &v90;
    v87[7] = a5;
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x2000000000;
    char v86 = 1;
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x2000000000;
    char v82 = 1;
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 0x40000000;
    v72 = __xzm_print_block_invoke_2;
    v73 = &unk_2655BB3F8;
    uint64_t v11 = v99;
    v77 = a5;
    uint64_t v78 = v99;
    v75 = &v83;
    v76 = &v79;
    v74 = v87;
    if (v9 != a3)
    {
      unint64_t v67 = (unint64_t)v9;
LABEL_15:
      a5("\"spans\": {\n");
      *((unsigned char *)v84 + 24) = 1;
      *((unsigned char *)v80 + 24) = 0;
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 0x40000000;
      v70[2] = __xzm_print_block_invoke_3;
      v70[3] = &unk_2655BB420;
      v70[5] = &v83;
      v70[6] = a5;
      v70[4] = v87;
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 0x40000000;
      v69[2] = __xzm_print_block_invoke_4;
      v69[3] = &unk_2655BB448;
      v69[6] = a5;
      v69[7] = v11;
      v69[4] = v87;
      v69[5] = &v83;
      if (v9 == a3)
      {
        unint64_t v16 = v68;
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 0x40000000;
        v68[2] = __xzm_print_block_invoke_5;
        v68[3] = &unk_2655BB470;
        v68[6] = a5;
        v68[7] = v11;
        v68[4] = v87;
        v68[5] = &v83;
      }
      else
      {
        unint64_t v16 = 0;
      }
      int v17 = _xzm_introspect_enumerate(a1, a4, (unint64_t)a3, (uint64_t)v10, v67, v11, 0, (uint64_t)v70, (uint64_t)v71, (uint64_t)v69, (uint64_t)v16);
      mach_vm_address_t v18 = v91[3];
      if (v18) {
        mach_vm_deallocate(*MEMORY[0x263EF8960], v18, 4 * v95[3]);
      }
      if (!v17)
      {
        a5("}\n");
        a5("}\n");
        a5("End xzone malloc JSON\n");
      }
      goto LABEL_33;
    }
    a5("\"bucketing_key\": \"%016llx%016llx\", \n", *(void *)(v99 + 344), *(void *)(v99 + 352));
    a5("\"guard_config\": {\n");
    a5("    \"guards_enabled\": %d, \n", *(unsigned __int8 *)(v11 + 512));
    a5("    \"data_guards_enabled\": %d, \n", *(unsigned __int8 *)(v11 + 513));
    a5("    \"tiny_run_size\": %d, \n", *(unsigned __int8 *)(v11 + 514));
    a5("    \"tiny_guard_density\": %d, \n", *(unsigned __int8 *)(v11 + 515));
    a5("    \"small_run_size\": %d, \n", *(unsigned __int8 *)(v11 + 516));
    a5("    \"small_guard_density\": %d \n", *(unsigned __int8 *)(v11 + 517));
    a5("}, \n");
    if ((*(unsigned char *)(v11 + 360) & 8) != 0) {
      unsigned int v12 = "true";
    }
    else {
      unsigned int v12 = "false";
    }
    a5("\"defer_large\": %s, \n", v12);
    if ((*(unsigned char *)(v11 + 360) & 4) != 0) {
      unint64_t v13 = "true";
    }
    else {
      unint64_t v13 = "false";
    }
    a5("\"defer_xzones\": %s, \n", v13);
    uint64_t v14 = *(void *)(v11 + 520);
    if (v14)
    {
      v69[0] = 0;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t, void *))a4)(a1, v14, 8256, v69)) {
        goto LABEL_33;
      }
      uint64_t v15 = v69[0];
      v68[0] = 0;
      if (*(void *)v69[0])
      {
        if (((unsigned int (*)(uint64_t, void, uint64_t, void *))a4)(a1, *(void *)v69[0], 16 * *(void *)(v69[0] + 8) + 32, v68))
        {
          goto LABEL_33;
        }
        v66 = (void *)v68[0];
      }
      else
      {
        v66 = 0;
      }
      a5("\"reclaim_buffer\": { \n");
      a5("    \"va_in_buffer\": %llu, \n", *(void *)(v15 + 16));
      a5("    \"last_accounting_given_to_kernel\": %llu, \n", *(void *)(v15 + 24));
      a5("    \"buffer\": \"%p\", \n", *(const void **)v15);
      a5("    \"buffer_len\": %llu, \n", *(void *)(v15 + 8));
      if (*(void *)v15 && *(void *)(v15 + 8))
      {
        a5("    \"indices\": { \n");
        a5("        \"head\": %llu, \n", *v66);
        a5("        \"busy\": %llu, \n", v66[2]);
        a5("        \"tail\": %llu \n", v66[1]);
        a5("    }, \n");
        a5("    \"entries\": [ \n");
        if (*(void *)(v15 + 8))
        {
          unint64_t v19 = 0;
          unsigned int v20 = 1;
          do
          {
            int v21 = &v66[2 * v19];
            a5("        { \n");
            a5("            \"index\": %u, \n", v20 - 1);
            a5("            \"address\": \"%p\", \n", (const void *)v21[4]);
            a5("            \"size\": %u, \n", *((_DWORD *)v21 + 10));
            a5("            \"behavior\": %u, \n", *((unsigned __int16 *)v21 + 22));
            a5("            \"flags\": \"0x%x\" \n", *((unsigned __int16 *)v21 + 23));
            a5("        }");
            if (*(void *)(v15 + 8) - 1 > v19) {
              a5(",");
            }
            a5(" \n");
            unint64_t v19 = v20;
          }
          while (*(void *)(v15 + 8) > (unint64_t)v20++);
        }
        a5("    ] \n");
      }
      a5("}, \n");
    }
    a5("\"range_groups\": {\n");
    unint64_t v23 = *(void *)(v11 + 416);
    if (v98 <= v23)
    {
      uint64_t v24 = *(unsigned __int8 *)(v11 + 361);
      unint64_t v25 = v23 - v98;
      if (!__CFADD__(v25, 80 * v24) && v25 + 80 * v24 <= *(void *)(v11 + 336))
      {
        int v26 = (unsigned __int8 *)(v25 + v11);
        if (v25 + v11)
        {
          unint64_t v67 = v98;
          v64 = v9;
          if (*(unsigned char *)(v11 + 361))
          {
            unint64_t v27 = 0;
            do
            {
              a5("    ");
              if (v27) {
                a5(", ");
              }
              a5("\"%d\": {\n", *v26);
              a5("        \"id\": %d, \n", *v26);
              a5("        \"lock\": %u, \n", *((_DWORD *)v26 + 4));
              a5("        \"base\": \"%p\", \n", *((const void **)v26 + 6));
              a5("        \"size\": %zu, \n", *((void *)v26 + 7));
              a5("        \"next\": \"%p\", \n", *((const void **)v26 + 8));
              a5("        \"remaining\": %zu\n", *((void *)v26 + 9));
              a5("    }\n");
              ++v27;
              v26 += 80;
            }
            while (v27 < *(unsigned __int8 *)(v11 + 361));
          }
          a5("}, \n");
          a5("\"segment_groups\": {\n");
          unint64_t v28 = *(void *)(v11 + 424);
          if (v67 <= v28)
          {
            uint64_t v29 = *(unsigned __int8 *)(v11 + 376);
            unint64_t v30 = v28 - v67;
            if (!__CFADD__(v30, 544 * v29) && v30 + 544 * v29 <= *(void *)(v11 + 336))
            {
              unint64_t v31 = v30 + v11;
              if (v30 + v11)
              {
                if (*(unsigned char *)(v11 + 376))
                {
                  uint64_t v32 = 0;
                  while (1)
                  {
                    a5("    ");
                    if (v32) {
                      a5(", ");
                    }
                    a5("\"%d\": {\n", *(unsigned __int8 *)(v31 + 544 * v32));
                    unint64_t v33 = *(char *)(v31 + 544 * v32);
                    unint64_t v34 = "unknown";
                    if (v33 <= 3) {
                      unint64_t v34 = (&off_2655BB4A8)[v33];
                    }
                    a5("        \"id\": \"%s\", \n", v34);
                    a5("        \"segment_cache\": { \n");
                    unint64_t v35 = v31 + 544 * v32;
                    a5("            \"max_count\": %u, \n", *(unsigned __int16 *)(v35 + 512));
                    a5("            \"count\": %u, \n", *(unsigned __int16 *)(v35 + 514));
                    a5("            \"max_entry_slices\": %u, \n", *(_DWORD *)(v35 + 516));
                    a5("            \"segments\": { \n");
                    if (*(_WORD *)(v35 + 514))
                    {
                      v36 = *(const void **)(v31 + 544 * v32 + 496);
                      if (v36) {
                        break;
                      }
                    }
LABEL_58:
                    a5("            } \n");
                    a5("        } \n");
                    a5("    }\n");
                    if (++v32 >= (unint64_t)*(unsigned __int8 *)(v11 + 376)) {
                      goto LABEL_59;
                    }
                  }
                  while (1)
                  {
                    v69[0] = 0;
                    if (((unsigned int (*)(uint64_t, const void *, uint64_t, void *))a4)(a1, v36, 22608, v69)|| v72((uint64_t)v71, v36, v69[0], "                    "))
                    {
                      goto LABEL_33;
                    }
                    v36 = *(const void **)(v69[0] + 40);
                    if (!v36) {
                      goto LABEL_58;
                    }
                  }
                }
LABEL_59:
                a5("}, \n");
                a5("\"xzones\": {\n");
                unint64_t v37 = *(void *)(v11 + 216);
                if (v67 <= v37)
                {
                  uint64_t v38 = *(unsigned __int8 *)(v11 + 210);
                  unint64_t v39 = v37 - v67;
                  unint64_t v40 = v37 - v67 + 112 * v38;
                  if (!__CFADD__(v37 - v67, 112 * v38))
                  {
                    unint64_t v41 = *(void *)(v11 + 336);
                    if (v40 <= v41)
                    {
                      unint64_t v61 = v39 + v11;
                      if (v39 + v11)
                      {
                        unint64_t v42 = *(void *)(v11 + 224);
                        if (v67 <= v42)
                        {
                          unint64_t v43 = v42 - v67;
                          BOOL v44 = __CFADD__(v42 - v67, 48* *(unsigned __int8 *)(v11 + 210)* (unint64_t)*(unsigned __int8 *)(v11 + 211));
                          unint64_t v45 = v42
                              - v67
                              + 48 * *(unsigned __int8 *)(v11 + 210) * (unint64_t)*(unsigned __int8 *)(v11 + 211);
                          if (!v44)
                          {
                            unint64_t v46 = v43 + v11;
                            unint64_t v65 = v46;
                            if (v45 <= v41 && v46 != 0)
                            {
                              unint64_t v10 = (unsigned __int8 *)v100;
                              if (*(unsigned __int8 *)(v100 + 210) >= 2u)
                              {
                                unint64_t v48 = 1;
                                do
                                {
                                  a5("    \"%d\": {\n", v48);
                                  unint64_t v49 = v61 + 112 * v48;
                                  a5("        \"id\": %d, \n", *(unsigned __int8 *)(v49 + 88));
                                  a5("        \"bucket\": %d, \n", *(unsigned __int8 *)(v49 + 92));
                                  a5("        \"segment_group\": %zu, \n", 0xF0F0F0F0F0F0F0F1* ((uint64_t)(*(void *)(v49 + 56) - *(void *)(v11 + 424)) >> 5));
                                  uint64_t v50 = *(void *)(v49 + 64);
                                  v49 += 64;
                                  a5("        \"block_size\": %llu, \n", v50);
                                  a5("        \"chunk_capacity\": %u, \n", *(_DWORD *)(v49 + 20));
                                  a5("        \"sequestered\": %d,\n", *(unsigned char *)(v49 + 30) & 1);
                                  v63 = (void *)v49;
                                  unint64_t v51 = *(char *)(v49 + 29);
                                  v52 = "UNKNOWN";
                                  if (v51 <= 2) {
                                    v52 = (&off_2655BB490)[v51];
                                  }
                                  a5("        \"slot_config\": \"%s\",\n", v52);
                                  a5("        \"allocation_slots\": [\n");
                                  if (v10[211])
                                  {
                                    int v53 = 0;
                                    unint64_t v62 = v48;
                                    do
                                    {
                                      unsigned int v54 = v48 + v53 * v10[210];
                                      unint64_t v55 = v65;
                                      v56 = (const void **)(v65 + 48 * v54);
                                      a5("            {\n");
                                      if (*v63 > 0x1000uLL)
                                      {
                                        a5("                \"chunk\": \"%p\",\n", *v56);
                                        unint64_t v60 = v65 + 48 * v54;
                                        a5("                \"allocations\": %lu,\n", *(unsigned int *)(v60 + 32));
                                        a5("                \"contentions\": %lu,\n", *(unsigned int *)(v60 + 36));
                                        unint64_t v48 = v62;
                                      }
                                      else
                                      {
                                        a5("                \"atomic_value\": \"0x%llx\",\n", *v56);
                                        a5("                \"xsg_locked\": \"0x%llx\",\n", *(_DWORD *)v56 & 1);
                                        a5("                \"xsg_waiters\": \"0x%llx\",\n", (*(_DWORD *)v56 >> 1) & 1);
                                        a5("                \"xsc_ptr\": \"0x%llx\",\n", ((unint64_t)*v56 >> 2) & 0x7FFFFFFFFFFFLL);
                                        unint64_t v57 = v65 + 48 * v54;
                                        a5("                \"allocations\": %lu,\n", *(unsigned int *)(v57 + 32));
                                        a5("                \"contentions\": %lu,\n", *(_DWORD *)(v57 + 36) & 0xFFFFFF);
                                        unsigned int v58 = HIBYTE(*(_DWORD *)(v57 + 36));
                                        v59 = "UNKNOWN";
                                        if (v58 <= 2) {
                                          v59 = (&off_2655BB490)[(char)v58];
                                        }
                                        a5("                \"slot_config\": \"%s\",\n", v59);
                                        unint64_t v48 = v62;
                                        unint64_t v55 = v65;
                                      }
                                      a5("                \"last_chunk_empty_ts\": %llu\n", *(void *)(v55 + 48 * v54 + 40));
                                      a5("            }");
                                      if (v10[211] - 1 > v53) {
                                        a5(",");
                                      }
                                      a5("\n");
                                      ++v53;
                                    }
                                    while (v53 < v10[211]);
                                  }
                                  a5("        ]\n");
                                  a5("    }");
                                  if (v10[210] - 1 > (int)v48) {
                                    a5(",");
                                  }
                                  a5("\n");
                                  ++v48;
                                }
                                while (v48 < v10[210]);
                              }
                              a5("}, \n");
                              unsigned int v9 = v64;
                              goto LABEL_15;
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
LABEL_33:
    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(&v83, 8);
    _Block_object_dispose(v89, 8);
    _Block_object_dispose(&v90, 8);
    _Block_object_dispose(&v94, 8);
  }
}

uint64_t _xzm_introspect_map_zone_and_main(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, void **), void *a4, void *a5, void *a6)
{
  uint64_t v10 = a2;
  unint64_t v19 = 0;
  uint64_t result = a3(a1, a2, 336, &v19);
  if (!result)
  {
    unint64_t v13 = v19[25];
    if (v13 < 0x150) {
      return 5;
    }
    uint64_t result = a3(a1, v10, v19[25], &v19);
    if (!result)
    {
      mach_vm_address_t v18 = 0;
      uint64_t v15 = v19;
      uint64_t v16 = v19[29];
      if (v16)
      {
        uint64_t result = a3(a1, v19[29], 528, &v18);
        if (result) {
          return result;
        }
        unint64_t v17 = v18[42];
        if (v17 < 0x210) {
          return 5;
        }
        uint64_t result = a3(a1, v16, v18[42], &v18);
        if (result) {
          return result;
        }
        uint64_t v15 = v18;
        if (v17 < v18[42]) {
          return 5;
        }
        uint64_t v10 = v16;
      }
      else
      {
        mach_vm_address_t v18 = v19;
        if (v19[42] != v13) {
          return 5;
        }
      }
      if (!v19) {
        _xzm_introspect_map_zone_and_main_cold_1();
      }
      if (!v10) {
        _xzm_introspect_map_zone_and_main_cold_2((const void *)result, v14);
      }
      uint64_t result = 0;
      *a4 = v19;
      *a5 = v15;
      *a6 = v10;
    }
  }
  return result;
}

uint64_t _xzm_introspect_enumerate(unsigned int a1, uint64_t (*a2)(void), unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  BOOL v15 = a3 == a5;
  uint64_t v16 = (void *)(a6 + 336);
  unint64_t v17 = (uint64_t *)(a4 + 200);
  if (a3 == a5) {
    unint64_t v17 = (uint64_t *)(a6 + 336);
  }
  uint64_t v18 = *v17;
  if (a3 != a5) {
    goto LABEL_17;
  }
  unint64_t v19 = *(void *)(a6 + 432);
  unint64_t v20 = v19 - a3;
  if (v19 < a3) {
    return 5;
  }
  unsigned int v21 = *(unsigned __int8 *)(a6 + 362);
  uint64_t v22 = 80 * *(unsigned __int8 *)(a6 + 362);
  uint64_t result = 5;
  BOOL v24 = __CFADD__(v20, v22);
  unint64_t v25 = v20 + v22;
  if (v24) {
    return result;
  }
  if (v25 > *(void *)(a6 + 336)) {
    return result;
  }
  uint64_t v26 = v20 + a6;
  if (!(v20 + a6)) {
    return result;
  }
  if (!*(unsigned char *)(a6 + 362))
  {
LABEL_17:
    unint64_t v32 = *(void *)(a6 + 440);
    BOOL v24 = v32 >= a5;
    unint64_t v33 = v32 - a5;
    if (v24)
    {
      uint64_t result = 5;
      if (v33 < 0xFFFFFFFFFFFF0000 && v33 + 0x10000 <= *v16)
      {
        uint64_t v34 = v33 + a6;
        if (v33 + a6)
        {
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          v57[0] = MEMORY[0x263EF8330];
          v57[1] = 0x40000000;
          unsigned int v58 = ___xzm_introspect_enumerate_block_invoke;
          v59 = &unk_2655BB3A8;
          unsigned int v67 = a1;
          uint64_t v64 = a4;
          unint64_t v65 = a3;
          uint64_t v66 = v18;
          char v68 = a7;
          uint64_t v60 = a9;
          uint64_t v61 = a10;
          BOOL v69 = v15;
          uint64_t v62 = a11;
          v63 = a2;
          while (1)
          {
            uint64_t v37 = *(unsigned int *)(v34 + v35);
            uint64_t v38 = v37 << 15;
            if (v37 && v36 != v38)
            {
              uint64_t result = v58((uint64_t)v57, v38);
              uint64_t v36 = v38;
              if (result) {
                break;
              }
            }
            v35 += 4;
            if (v35 == 0x10000)
            {
              unint64_t v40 = *(void *)(a6 + 448);
              if (v40 >> 62) {
                return 5;
              }
              unint64_t v41 = *(void *)(a6 + 456);
              uint64_t result = 0;
              BOOL v24 = v41 >= a5;
              unint64_t v42 = v41 - a5;
              if (v24 && !__CFADD__(v42, 4 * v40) && v42 + 4 * v40 <= *v16)
              {
                uint64_t result = 0;
                uint64_t v43 = v42 + a6;
                if (v42 + a6)
                {
                  if (v40)
                  {
                    uint64_t v44 = 0;
                    while (1)
                    {
                      uint64_t v45 = *(unsigned int *)(v43 + 4 * v44);
                      if (v45) {
                        break;
                      }
LABEL_48:
                      uint64_t result = 0;
                      if (++v44 >= v40) {
                        return result;
                      }
                    }
                    v70 = 0;
                    uint64_t result = ((uint64_t (*)(void, uint64_t, uint64_t, void **))a2)(a1, v45 << 16, 0x10000, &v70);
                    if (!result)
                    {
                      uint64_t v46 = 0;
                      v47 = v70;
                      while (1)
                      {
                        uint64_t v48 = *(unsigned int *)((char *)v47 + v46);
                        uint64_t v49 = v48 << 15;
                        if (v48 && v36 != v49)
                        {
                          uint64_t result = v58((uint64_t)v57, v49);
                          uint64_t v36 = v49;
                          if (result) {
                            break;
                          }
                        }
                        v46 += 4;
                        if (v46 == 0x10000)
                        {
                          unint64_t v40 = *(void *)(a6 + 448);
                          goto LABEL_48;
                        }
                      }
                    }
                  }
                }
              }
              return result;
            }
          }
        }
      }
      return result;
    }
    return 5;
  }
  uint64_t v28 = 0;
  BOOL v53 = a3 == a5;
  char v54 = a7;
  uint64_t v51 = v20 + a6;
  uint64_t v52 = v18;
  while (!*(void *)(v26 + 80 * v28 + 32))
  {
LABEL_16:
    if (++v28 >= (unint64_t)v21) {
      goto LABEL_17;
    }
  }
  uint64_t v29 = v26 + 80 * v28;
  unint64_t v30 = (unsigned int *)(v29 + 20);
  unint64_t v31 = (unsigned __int8 *)(v29 + 16);
  while (1)
  {
    v70 = 0;
    uint64_t result = a2(a1);
    if (result) {
      return result;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void))(a8 + 16))(a8, v70[1], *v30, *v31);
    if (result) {
      return result;
    }
    if (!*v70)
    {
      unsigned int v21 = *(unsigned __int8 *)(a6 + 362);
      BOOL v15 = v53;
      a7 = v54;
      uint64_t v26 = v51;
      uint64_t v18 = v52;
      goto LABEL_16;
    }
  }
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 52) && *(unsigned char *)(a1 + 53))
  {
    v4[0] = a2;
    v4[1] = a3;
    (*(void (**)(void, void, uint64_t, void *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 4, v4, 1);
  }
  return 0;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_2()
{
  return 0;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v13 = *(unsigned char *)(a4 + 64) & 0xF;
  if (*(unsigned char *)(a1 + 52)) {
    BOOL v14 = v13 == 7;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    uint64_t v18 = a2;
    unint64_t v19 = 0x8000;
    (*(void (**)(void, void, uint64_t, uint64_t *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 4, &v18, 1);
  }
  int v15 = *(unsigned __int8 *)(a1 + 53);
  if (*(unsigned char *)(a1 + 53) || *(unsigned char *)(a1 + 54))
  {
    uint64_t v18 = a6;
    unint64_t v19 = (unint64_t)a5 << 14;
    if (v13 == 5 || v13 == 2)
    {
      if (v15) {
        (*(void (**)(void, void, uint64_t, uint64_t *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 2, &v18, 1);
      }
      if (*(unsigned char *)(a1 + 54)) {
        (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 1, a8, a9);
      }
    }
    else
    {
      (*(void (**)(void, void, uint64_t, uint64_t *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 3, &v18, 1);
    }
  }
  return 0;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  if (*(unsigned char *)(a1 + 52) && (*(unsigned char *)(a3 + 36) != 1 || (*(unsigned char *)(a4 + 64) & 0xF) != 7))
  {
    v7[0] = a6;
    v7[1] = (unint64_t)a5 << 14;
    (*(void (**)(void, void, uint64_t, void *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 2, v7, 1);
  }
  return 0;
}

uint64_t _malloc_default_reader_0(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1 && !mach_task_is_self(a1)) {
    mfmi_read_zone_cold_1();
  }
  *a4 = a2;
  return 0;
}

uint64_t ___xzm_introspect_enumerate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = 0;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 56))(*(unsigned int *)(a1 + 88), a2, 22608, &v14);
  if (!result)
  {
    uint64_t v13 = 0;
    uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t *))(a1 + 56))(*(unsigned int *)(a1 + 88), *(void *)(v14 + 64), (unint64_t)*(unsigned int *)(v14 + 28) << 14, &v13);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      if (!result)
      {
        v5[0] = MEMORY[0x263EF8330];
        v5[1] = 0x40000000;
        v5[2] = ___xzm_introspect_enumerate_block_invoke_2;
        v5[3] = &unk_2655BB380;
        uint64_t v7 = v14;
        uint64_t v8 = v13;
        uint64_t v9 = *(void *)(a1 + 64);
        long long v10 = *(_OWORD *)(a1 + 72);
        __int16 v12 = *(_WORD *)(a1 + 92);
        uint64_t v11 = a2;
        long long v6 = *(_OWORD *)(a1 + 40);
        return xzm_segment_group_segment_foreach_span(v14, (uint64_t)v5);
      }
    }
  }
  return result;
}

uint64_t ___xzm_introspect_enumerate_block_invoke_2()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v3 = v2;
  uint64_t v4 = (unsigned int *)v1;
  v49[2048] = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(v0 + 48);
  unint64_t v6 = 0x3333333333334000 * ((unint64_t)(v1 - v5 - 2128) >> 4);
  uint64_t v7 = (v6 & 0x3FFFFFFFC000) + *(void *)(v5 + 64);
  unsigned int v8 = *(unsigned char *)(v1 + 64) & 0xF;
  if (v8 <= 7 && ((1 << v8) & 0xE4) != 0)
  {
    uint64_t v10 = *(void *)(v0 + 64);
    if (*(unsigned __int16 *)(v1 + 66) == *(unsigned __int16 *)(v10 + 208))
    {
      uint64_t v11 = *(void *)(v0 + 56);
      if (v8 == 5 || v8 == 2)
      {
        unint64_t v12 = *(void *)(v0 + 72);
        unint64_t v13 = *(void *)(v10 + 216) + 112 * *(unsigned __int8 *)(v1 + 65);
        if (v12 > v13) {
          return 5;
        }
        unint64_t v21 = v13 - v12;
        BOOL v22 = __CFADD__(v13 - v12, 112);
        unint64_t v23 = v13 - v12 + 112;
        char v24 = v22;
        uint64_t v14 = 5;
        uint64_t v20 = v21 + v10;
        if (!(v21 + v10) || (v24 & 1) != 0 || v23 > *(void *)(v0 + 80)) {
          return v14;
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      if (!*(unsigned char *)(v0 + 96)) {
        return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(*(void *)(v0 + 32) + 16))(*(void *)(v0 + 32), *(void *)(v0 + 88), v5, v1, v2, v7, v20, 0, 0);
      }
      uint64_t v25 = *(void *)(v0 + 88);
      uint64_t v26 = *(void *)(v0 + 32);
      if (v8 == 2 || v8 == 5)
      {
        bzero(v49, 0x4000uLL);
        unint64_t v27 = *(unsigned int *)(v20 + 84);
        uint64_t v14 = 5;
        if (v27 > 0x400) {
          return v14;
        }
        uint64_t v28 = *(void *)(v20 + 64);
        uint64_t v29 = v28;
        if (((unint64_t)v3 << 14) / v28 != v27) {
          return v14;
        }
        if (v8 == 5)
        {
          if (v27)
          {
            unsigned int v30 = 0;
            uint64_t v31 = 0;
            uint64_t v32 = 0;
            unsigned int v33 = *v4;
            do
            {
              if (((v33 >> v31) & 1) == 0)
              {
                uint64_t v34 = &v49[2 * v32];
                *uint64_t v34 = v7 + v30;
                v34[1] = v28;
                ++v32;
              }
              ++v31;
              v30 += v28;
            }
            while (v27 != v31);
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void *, void))(v26 + 16))(v26, v25, v5, v4, v3, v7, v20, v49, v32);
          }
LABEL_58:
          LODWORD(v32) = 0;
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void *, void))(v26 + 16))(v26, v25, v5, v4, v3, v7, v20, v49, v32);
        }
        unint64_t v36 = *(void *)v4;
        if ((~*v4 & 0x7FELL) != 0)
        {
          unint64_t v37 = *(void *)v4 & 0x7FFLL;
          if (v37 > 0x3FF)
          {
            unint64_t v38 = 0;
          }
          else
          {
            unint64_t v38 = 0;
            unint64_t v39 = v28 >> 4;
            do
            {
              if (v37 % v39) {
                break;
              }
              unint64_t v40 = &v49[2 * (v37 / v39)];
              if (*v40) {
                break;
              }
              ++v38;
              *unint64_t v40 = 1;
              unint64_t v37 = *(void *)(v6 + v11 + 16 * v37 + 8) & 0x7FFLL;
            }
            while (v37 < 0x400);
          }
          unint64_t v41 = (v36 >> 11) & 0x7FF;
          if (v38 >= v41 || v41 > v27) {
            uint64_t v43 = 0;
          }
          else {
            uint64_t v43 = v38 - v41;
          }
          uint64_t v44 = v43 + v27;
          if (v44)
          {
            uint64_t v32 = 0;
            uint64_t v45 = (unsigned __int8 *)v49;
            uint64_t v46 = v7;
            do
            {
              int v47 = *v45;
              v45 += 16;
              if (!v47)
              {
                uint64_t v48 = &v49[2 * v32];
                *uint64_t v48 = v46;
                v48[1] = v29;
                ++v32;
              }
              v46 += v29;
              --v44;
            }
            while (v44);
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void *, void))(v26 + 16))(v26, v25, v5, v4, v3, v7, v20, v49, v32);
          }
          goto LABEL_58;
        }
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void, void))(v26 + 16))(v26, v25, v5, v4, v3, v7, v20, 0, 0);
      }
      else
      {
        v49[0] = (v6 & 0x3FFFFFFFC000) + *(void *)(v5 + 64);
        v49[1] = (unint64_t)v2 << 14;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void *, uint64_t))(v26 + 16))(v26, v25, v5, v1, v2, v7, 0, v49, 1);
      }
    }
  }
  uint64_t v14 = *(unsigned __int8 *)(v0 + 97);
  if (!*(unsigned char *)(v0 + 97)) {
    return v14;
  }
  if (*(_WORD *)(v1 + 66)) {
    return 0;
  }
  uint64_t v15 = *(void *)(v0 + 88);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t))(*(void *)(v0 + 40)
                                                                                              + 16);
  uint64_t v17 = *(void *)(v0 + 40);
  uint64_t v18 = (v6 & 0x3FFFFFFFC000) + *(void *)(v5 + 64);

  return v16(v17, v15, v5, v4, v2, v18);
}

uint64_t __xzm_print_block_invoke(uint64_t a1, mach_vm_offset_t address, unint64_t a3, const char *a4)
{
  uint64_t result = *(unsigned int *)(a1 + 64);
  if (!result) {
    return result;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  mach_vm_offset_t v10 = *(void *)(v9 + 24);
  uint64_t v11 = (unint64_t *)MEMORY[0x263EF8AF8];
  unint64_t v12 = *MEMORY[0x263EF8AF8];
  if (v10 > address || v10 + v12 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < a3 + address)
  {
    *(void *)(v9 + 24) = address;
    mach_vm_size_t v13 = a3 / v12;
    if (a3 % v12) {
      ++v13;
    }
    unint64_t v14 = 0x400000 / v12;
    if (v13 <= v14) {
      mach_vm_size_t v15 = v14;
    }
    else {
      mach_vm_size_t v15 = v13;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    mach_vm_size_t v17 = *(void *)(v16 + 24);
    if (v15 > v17)
    {
      mach_vm_address_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      unint64_t v19 = (vm_map_t *)MEMORY[0x263EF8960];
      if (v18)
      {
        mach_vm_deallocate(*MEMORY[0x263EF8960], v18, 4 * v17);
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      *(void *)(v16 + 24) = v15;
      uint64_t result = mach_vm_allocate(*v19, (mach_vm_address_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 4 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1);
      if (result) {
        return result;
      }
      LODWORD(result) = *(_DWORD *)(a1 + 64);
    }
    mach_vm_size_t dispositions_count = v15;
    if (a3 <= 0x400000) {
      mach_vm_size_t v20 = 0x400000;
    }
    else {
      mach_vm_size_t v20 = a3;
    }
    uint64_t result = mach_vm_page_range_query(result, address, v20, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), &dispositions_count);
    if (result) {
      return result;
    }
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"dispositions\": \"", a4);
  uint64_t v28 = a4;
  if (*v11 > a3)
  {
    uint64_t v23 = 0;
    uint64_t v22 = 0;
LABEL_29:
    (*(void (**)(const char *))(a1 + 56))("\", \n");
    (*(void (**)(const char *, ...))(a1 + 56))("%s    \"dirty_count\": %zu, \n", v28, v23);
    (*(void (**)(const char *, ...))(a1 + 56))("%s    \"swapped_count\": %zu, \n", v28, v22);
    return 0;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    mach_vm_offset_t v24 = (address - *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) / *v11;
    while (v24 < *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      int v25 = *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 4 * v24);
      if ((v25 & 8) != 0)
      {
        ++v23;
        unint64_t v27 = "d";
      }
      else
      {
        unint64_t v26 = v25 & 0x10;
        if (v26) {
          unint64_t v27 = "s";
        }
        else {
          unint64_t v27 = "c";
        }
        v22 += v26 >> 4;
      }
      (*(void (**)(const char *))(a1 + 56))(v27);
      ++v24;
      if (++v21 >= a3 / *v11) {
        goto LABEL_29;
      }
    }
    return 5;
  }
}

uint64_t __xzm_print_block_invoke_2(uint64_t a1, const void *a2, uint64_t a3, const char *a4)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    (*(void (**)(const char *))(a1 + 56))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s\"%p\": {\n", a4, a2);
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"addr\": \"%p\", \n", a4, a2);
  unint64_t v8 = 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(*(void *)(a3 + 16) - *(void *)(*(void *)(a1 + 64) + 424)) >> 5);
  uint64_t v9 = "unknown";
  if ((v8 & 0xFC) == 0) {
    uint64_t v9 = (&off_2655BB4A8)[(char)v8];
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"segment_group\": \"%s\", \n", a4, v9);
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"body_addr\": \"%p\", \n", a4, *(const void **)(a3 + 64));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"used\": %u, \n", a4, *(_DWORD *)(a3 + 24));
  mach_vm_offset_t v10 = "huge_segment";
  if (*(unsigned char *)(a3 + 36) != 1) {
    mach_vm_offset_t v10 = "unknown";
  }
  if (*(unsigned char *)(a3 + 36)) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = "normal_segment";
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"kind\": \"%s\", \n", a4, v11);
  if (*(void *)(a3 + 56) == -1) {
    unint64_t v12 = "%s    \"reclaim_id\": -1, \n";
  }
  else {
    unint64_t v12 = "%s    \"reclaim_id\": %llu, \n";
  }
  (*(void (**)(const char *))(a1 + 56))(v12);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a3 + 64));
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"slice_count\": %u, \n", a4, *(_DWORD *)(a3 + 28));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"slice_entry_count\": %u \n", a4, *(_DWORD *)(a3 + 32));
  (*(void (**)(const char *, ...))(a1 + 56))("%s}\n", a4);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return 0;
}

uint64_t __xzm_print_block_invoke_3(uint64_t a1, const void *a2, int a3, unsigned int a4)
{
  (*(void (**)(const char *))(a1 + 48))("    ");
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    (*(void (**)(const char *))(a1 + 48))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 48))("\"%p\": {\n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"addr\": \"%p\", \n", a2);
  if (a4 > 3) {
    unint64_t v8 = "unknown slab";
  }
  else {
    unint64_t v8 = (&off_2655BB4C8)[(char)a4];
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(const char *, ...))(a1 + 48))("        \"size\": %u \n", a3);
  (*(void (**)(const char *))(a1 + 48))("    }\n");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return 0;
}

uint64_t __xzm_print_block_invoke_4(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, int a5, const void *a6, uint64_t a7)
{
  (*(void (**)(const char *))(a1 + 48))("    ");
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    (*(void (**)(const char *))(a1 + 48))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 48))("\"%p\": {\n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"addr\": \"%p\", \n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"metadata_addr\": \"%p\", \n", &a2[a4 - a3]);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"mzone\": %d, \n", *(unsigned __int16 *)(a4 + 66));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"xzone\": %d, \n", *(unsigned __int8 *)(a4 + 65));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment\": \"%p\", \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment_group\": %zu, \n", 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(*(void *)(a3 + 16) - *(void *)(*(void *)(a1 + 56) + 424)) >> 5));
  uint64_t v14 = *(unsigned char *)(a4 + 64) & 0xF;
  if (v14 > 8) {
    mach_vm_size_t v15 = "unknown";
  }
  else {
    mach_vm_size_t v15 = (&off_2655BB4E8)[v14];
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v15);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"slice_count\": %u, \n", a5);
  if (a7) {
    int v16 = *(_DWORD *)(a7 + 64);
  }
  else {
    int v16 = 0;
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        \"block_size\": %u, \n", v16);
  (*(void (**)(const char *))(a1 + 48))("        \"in_use\": 1, \n");
  if (*(void *)(a3 + 0xFFFFFFFE66666668 * ((unint64_t)(a4 - a3 - 2128) >> 4) + 72) == -1) {
    mach_vm_size_t v17 = "        \"reclaim_id\": -1, \n";
  }
  else {
    mach_vm_size_t v17 = "        \"reclaim_id\": %llu, \n";
  }
  (*(void (**)(const char *))(a1 + 48))(v17);
  uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  if (!v18)
  {
    if (v14 == 5 || v14 == 2) {
      (*(void (**)(const char *, ...))(a1 + 48))("        \"bucket\": %u,\n", *(unsigned __int8 *)(a7 + 92));
    }
    if (v14 == 5)
    {
      (*(void (**)(const char *, ...))(a1 + 48))("        \"free\": \"0x%x\",\n", *(_DWORD *)a4);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"used\": %u,\n", *(_DWORD *)(a4 + 4));
      (*(void (**)(const char *))(a1 + 48))("        \"alloc_idx\": %u,\n");
    }
    else if (v14 == 2)
    {
      (*(void (**)(const char *, ...))(a1 + 48))("        \"meta\": \"0x%llx\",\n", *(void *)a4);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_alloc_head\": \"0x%llx\",\n", *(_DWORD *)a4 & 0x7FF);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_free_count\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 11) & 0x7FF);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_alloc_idx\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 22) & 0x3F);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_on_partial_list\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 28) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_on_empty_list\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 29) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_walk_locked\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 30) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_head_seqno\": \"0x%llx\",\n", (*(void *)a4 >> 38) & 0x1FFFLL);
      (*(void (**)(const char *))(a1 + 48))("        \"xca_seqno\": \"0x%llx\",\n");
    }
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_preallocated\": %d,\n", (*(unsigned __int8 *)(a4 + 64) >> 6) & 1);
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_pristine\": %d\n", (*(unsigned __int8 *)(a4 + 64) >> 4) & 1);
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return v18;
}

uint64_t __xzm_print_block_invoke_5(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, int a5, const void *a6)
{
  (*(void (**)(const char *))(a1 + 48))("    ");
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    (*(void (**)(const char *))(a1 + 48))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 48))("\"%p\": {\n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"addr\": \"%p\", \n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"metadata_addr\": \"%p\", \n", &a2[a4 - a3]);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"mzone\": %d, \n", *(unsigned __int16 *)(a4 + 66));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"xzone\": %d, \n", *(unsigned __int8 *)(a4 + 65));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment\": \"%p\", \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment_group\": %zu, \n", 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(*(void *)(a3 + 16) - *(void *)(*(void *)(a1 + 56) + 424)) >> 5));
  uint64_t v12 = *(unsigned char *)(a4 + 64) & 0xF;
  if (v12 > 8) {
    mach_vm_size_t v13 = "unknown";
  }
  else {
    mach_vm_size_t v13 = (&off_2655BB4E8)[v12];
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v13);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"slice_count\": %u, \n", a5);
  if (*(void *)(a3 + 0xFFFFFFFE66666668 * ((unint64_t)(a4 - a3 - 2128) >> 4) + 72) == -1) {
    uint64_t v14 = "        \"reclaim_id\": -1, \n";
  }
  else {
    uint64_t v14 = "        \"reclaim_id\": %llu, \n";
  }
  (*(void (**)(const char *))(a1 + 48))(v14);
  uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  if (!v15)
  {
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_preallocated\": %d,\n", (*(unsigned __int8 *)(a4 + 64) >> 6) & 1);
    (*(void (**)(const char *))(a1 + 48))("        \"in_use\": 0 \n");
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return v15;
}

uint64_t _malloc_default_debug_sleep_time()
{
  if (malloc_error_sleep) {
    return 3600;
  }
  else {
    return 0;
  }
}

char *malloc_print_configure()
{
  uint64_t v0 = getenv("MallocDebugReport");
  if (v0)
  {
    uint64_t v1 = v0;
    if (_platform_strcmp())
    {
      if (_platform_strcmp())
      {
        if (_platform_strcmp())
        {
          debug_mode = 2;
          malloc_printf("Unrecognized value for MallocDebugReport (%s) - using 'stderr'\n", v1);
        }
        else
        {
          debug_mode = 0;
        }
        goto LABEL_12;
      }
      unint64_t v2 = 0x26A994000uLL;
      int v3 = 1;
    }
    else
    {
      unint64_t v2 = 0x26A994000;
      int v3 = 2;
    }
    *(_DWORD *)(v2 + 3692) = v3;
    goto LABEL_12;
  }
  if (isatty(2)) {
    debug_mode = 2;
  }
LABEL_12:
  if (getenv("MallocErrorStop")) {
    malloc_error_stop = 1;
  }
  uint64_t result = getenv("MallocErrorSleep");
  if (result) {
    malloc_error_sleep = 1;
  }
  return result;
}

void malloc_printf(const char *format, ...)
{
}

uint64_t malloc_vreport(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t result = _simple_salloc();
  if (result)
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_sprintf();
    }
    if (a3) {
      _simple_sprintf();
    }
    _simple_vsprintf();
    if ((a1 & 0x100) != 0)
    {
      long long v44 = 0u;
      long long v43 = 0u;
      long long v42 = 0u;
      long long v41 = 0u;
      long long v40 = 0u;
      long long v39 = 0u;
      long long v38 = 0u;
      long long v37 = 0u;
      long long v36 = 0u;
      long long v35 = 0u;
      long long v34 = 0u;
      long long v33 = 0u;
      long long v32 = 0u;
      long long v31 = 0u;
      long long v30 = 0u;
      long long v29 = 0u;
      long long v28 = 0u;
      long long v27 = 0u;
      long long v26 = 0u;
      long long v25 = 0u;
      long long v24 = 0u;
      long long v23 = 0u;
      long long v22 = 0u;
      long long v21 = 0u;
      *(_OWORD *)array = 0u;
      int v10 = backtrace(array, 50);
      if (v10)
      {
        uint64_t v11 = v10;
        backtrace_image_offsets(array, &image_offsets, v10);
        if ((int)v11 >= 1)
        {
          uint64_t v12 = 0;
          p_image_offset image_offsets = &image_offsets;
          do
          {
            *(void *)uu1 = 0;
            uint64_t v18 = 0;
            if (!v12 || uuid_compare(uu1, p_image_offsets->uuid))
            {
              uuid_copy(uu1, p_image_offsets->uuid);
              memset(out, 0, 37);
              uuid_unparse(p_image_offsets->uuid, out);
            }
            _simple_sappend();
            _simple_sprintf();
            ++v12;
            ++p_image_offsets;
          }
          while (v11 != v12);
        }
      }
    }
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0)) {
      _simple_put();
    }
    if (!(_malloc_no_asl_log | a1 & 0x10))
    {
      _simple_string();
      _simple_asl_log();
    }
    if ((a1 & 0x40) != 0)
    {
      uint64_t result = _simple_string();
      uint64_t v14 = result;
    }
    else
    {
      uint64_t result = _simple_sfree();
      uint64_t v14 = 0;
    }
  }
  else
  {
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
    {
      if ((a1 & 0x20) == 0)
      {
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        getprogname();
        getpid();
        _simple_dprintf();
      }
      if (a3) {
        _simple_dprintf();
      }
      uint64_t result = _simple_vdprintf();
    }
    if ((a1 & 0x40) != 0) {
      uint64_t v14 = a5;
    }
    else {
      uint64_t v14 = 0;
    }
  }
  if ((a1 & 0xC0) != 0)
  {
    uint64_t result = _malloc_put(a1, "*** set a breakpoint in malloc_error_break to debug\n");
    if (malloc_error_stop == 1)
    {
      _malloc_put(5u, "*** sending SIGSTOP to help debug\n");
      pid_t v15 = getpid();
      uint64_t result = kill(v15, 17);
    }
    else if (a2)
    {
      _malloc_put(5u, "*** sleeping to help debug\n");
      uint64_t result = sleep(a2);
    }
  }
  if ((a1 & 0x40) != 0)
  {
    qword_26A994E28 = v14;
    abort();
  }
  return result;
}

ssize_t _malloc_put(unsigned int a1, const void *a2)
{
  ssize_t result = _simple_salloc();
  if (result)
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_sprintf();
    }
    _simple_sprintf();
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0)) {
      _simple_put();
    }
    if (_malloc_no_asl_log & ~(a1 >> 4))
    {
      _simple_string();
      _simple_asl_log();
    }
    return _simple_sfree();
  }
  else if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_dprintf();
    }
    size_t v5 = _platform_strlen();
    return write(2, a2, v5);
  }
  return result;
}

uint64_t malloc_report(unsigned int a1, uint64_t a2)
{
  if (malloc_error_sleep) {
    unsigned int v3 = 3600;
  }
  else {
    unsigned int v3 = 0;
  }
  return malloc_vreport(a1, v3, 0, 0, a2);
}

uint64_t malloc_report_simple(uint64_t a1)
{
  if (malloc_error_sleep) {
    unsigned int v1 = 3600;
  }
  else {
    unsigned int v1 = 0;
  }
  return malloc_vreport(0x30u, v1, 0, 0, a1);
}

uint64_t malloc_zone_error(__int16 a1, char a2, uint64_t a3)
{
  char v3 = a2 ^ 1;
  if ((a1 & 0x100) == 0) {
    char v3 = 1;
  }
  if ((((a1 & 0x40) == 0) & v3) != 0) {
    unsigned int v4 = 147;
  }
  else {
    unsigned int v4 = 67;
  }
  if (malloc_error_sleep) {
    unsigned int v5 = 3600;
  }
  else {
    unsigned int v5 = 0;
  }
  return malloc_vreport(v4, v5, 0, 0, a3);
}

void _xzm_introspect_map_zone_and_main_cold_1()
{
  qword_26A994E28 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"zone\" failed (/Library/Caches/com.apple.xbs/Sources/l"
                             "ibmalloc_frameworks/src/xzone/xzone_introspect.c:557)";
  __break(1u);
}

void _xzm_introspect_map_zone_and_main_cold_2(const void *a1, int a2)
{
  qword_26A994E28 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"main_address\" failed (/Library/Caches/com.apple.xbs/S"
                             "ources/libmalloc_frameworks/src/xzone/xzone_introspect.c:559)";
  __break(1u);
  _Block_object_dispose(a1, a2);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x270ED8130]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x270ED8138]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x270ED83B0]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x270ED83B8]();
}

uint64_t _simple_put()
{
  return MEMORY[0x270ED83C0]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x270ED83C8]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x270ED83D0]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x270ED83D8]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x270ED83E0]();
}

uint64_t _simple_string()
{
  return MEMORY[0x270ED83E8]();
}

uint64_t _simple_vdprintf()
{
  return MEMORY[0x270ED83F0]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x270ED83F8]();
}

void abort(void)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

void backtrace_image_offsets(void *const *array, image_offset *image_offsets, int size)
{
}

void bzero(void *a1, size_t a2)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x270EDA270](*(void *)&task);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x270EDA290](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDA298](*(void *)&target, address, size);
}

kern_return_t mach_vm_page_range_query(vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x270EDA2B0](*(void *)&target_map, address, size, dispositions, dispositions_count);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}