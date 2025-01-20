uint64_t symptom_set_qualifier(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a3 <= 7)
    {
      result = 0;
      *(void *)(a1 + 8 * a3 + 40) = a2;
      *(_DWORD *)(a1 + 20) |= 1 << a3;
    }
  }
  return result;
}

uint64_t symptom_send(void *a1)
{
  if (a1)
  {
    sr_log_symptom((uint64_t)a1);
    uint64_t v2 = a1[14];
    if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
      uint64_t v3 = *(void *)(MEMORY[0x263EF8430] + 328);
    }
    else {
      uint64_t v3 = _os_alloc_once();
    }
    if (!*(unsigned char *)(v3 + 32))
    {
      if (!_dispatch_is_multithreaded())
      {
        *(unsigned char *)(v2 + 352) = 0;
        symptom_free(a1, "Not Multithreaded");
        return 0;
      }
      if (*(void *)(v3 + 24) != -1) {
        dispatch_once_f((dispatch_once_t *)(v3 + 24), (void *)v3, (dispatch_function_t)symptoms_go_multithreaded);
      }
    }
    *(unsigned char *)(v2 + 352) = 1;
    dispatch_async_f(*(dispatch_queue_t *)(v2 + 128), a1, (dispatch_function_t)symptom_post);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

void sr_log_symptom(uint64_t a1)
{
}

void *symptom_create(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = strrchr((char *)a1, 46);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = (unint64_t)&v2[-a1];
  if ((unint64_t)&v2[-a1] < 2) {
    return 0;
  }
  size_t v4 = strlen((const char *)(a1 + 1));
  if (v4 > 0x64) {
    return 0;
  }
  size_t v7 = v4;
  unint64_t v8 = v3 - 31;
  if (v3 >= 0x1F)
  {
    size_t v9 = 31;
  }
  else
  {
    unint64_t v8 = 0;
    size_t v9 = v3;
  }
  v10 = obtain_symptom_framework(0, (char *)(a1 + v8), v9);
  v11 = _basic_symptom_create();
  v5 = v11;
  if (v11)
  {
    *((_DWORD *)v11 + 8) = 0;
    v11[14] = v10;
    v12 = (char *)malloc_type_calloc(1uLL, v7 + 28, 0x36C593A7uLL);
    if (v12)
    {
      v13 = v12;
      *((_DWORD *)v12 + 2) = 11337453;
      *((_WORD *)v12 + 6) = 8;
      *((_WORD *)v12 + 7) = (v7 & 0xFFFC) + 12;
      *((_DWORD *)v12 + 4) = 0;
      *((_DWORD *)v12 + 5) = v7 + 1;
      v14 = v12 + 24;
      memcpy(v12 + 24, (const void *)a1, v7 + 1);
      if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
        v15 = *(int **)(MEMORY[0x263EF8430] + 328);
      }
      else {
        v15 = (int *)_os_alloc_once();
      }
      int v16 = *v15;
      if ((*v15 & 2) != 0)
      {
        printf("symptom_create copied name %s\n", v14);
        int v16 = *v15;
      }
      if ((v16 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        symptom_create_cold_1((uint64_t)v14);
      }
      *((_DWORD *)v13 + 4) = 0x20000000;
      *(void *)v13 = 0;
      v5[13] = v13;
      *((_DWORD *)v5 + 5) |= 0x40000000u;
    }
  }
  return v5;
}

void *obtain_symptom_framework(int a1, char *a2, size_t a3)
{
  result = find_symptom_reporter_by_name(a1, a2, a3);
  if (!result)
  {
    if (framework_creation_queue_pred != -1) {
      dispatch_once(&framework_creation_queue_pred, &__block_literal_global);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __obtain_symptom_framework_block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    int v8 = a1;
    block[4] = a2;
    block[5] = a3;
    dispatch_sync((dispatch_queue_t)framework_creation_queue_serialization_q, block);
    return find_symptom_reporter_by_name(a1, a2, a3);
  }
  return result;
}

void *find_symptom_reporter_by_name(int a1, char *__s2, size_t __n)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v6 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    size_t v7 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    size_t v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("find_symptom_reporter_by_name  %s   len %ld\n", __s2, __n);
    int v8 = *v7;
  }
  if ((v8 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    find_symptom_reporter_by_name_cold_2();
  }
  if (*(void *)(v6 + 320) == -1)
  {
    uint64_t v9 = *(void *)(v6 + 328);
    if (!v9) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v9 = _os_alloc_once();
    if (!v9) {
      goto LABEL_26;
    }
  }
  v10 = *(void **)(v9 + 8);
  if (v10)
  {
    v11 = &_os_log_internal;
    while (1)
    {
      if (*(void *)(v6 + 320) == -1) {
        v12 = *(int **)(v6 + 328);
      }
      else {
        v12 = (int *)_os_alloc_once();
      }
      int v13 = *v12;
      if ((*v12 & 2) != 0)
      {
        printf("find_symptom_reporter_by_name  check sr %p name len %ld\n", v10, v10[4]);
        int v13 = *v12;
      }
      if ((v13 & 4) != 0 && os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = v10[4];
        *(_DWORD *)buf = 134218240;
        v27 = v10;
        __int16 v28 = 2048;
        uint64_t v29 = v14;
        _os_log_debug_impl(&dword_21874A000, v11, OS_LOG_TYPE_DEBUG, "find_symptom_reporter_by_name  check sr %p name len %ld\n", buf, 0x16u);
      }
      if (*((_DWORD *)v10 + 3) == a1 && v10[4] == __n && !strncmp((const char *)v10[3], __s2, __n)) {
        return v10;
      }
      v10 = (void *)*v10;
      if (!v10)
      {
        if (*(void *)(v6 + 320) == -1) {
          break;
        }
        v15 = (int *)_os_alloc_once();
        goto LABEL_27;
      }
    }
  }
LABEL_26:
  v15 = *(int **)(v6 + 328);
LABEL_27:
  int v16 = *v15;
  if ((*v15 & 2) != 0)
  {
    puts("find_symptom_reporter_by_name  returns NULL");
    int v16 = *v15;
  }
  if ((v16 & 4) != 0)
  {
    BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v17) {
      find_symptom_reporter_by_name_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  return 0;
}

void *_basic_symptom_create()
{
  v0 = malloc_type_calloc(1uLL, 0x78uLL, 0x1020040647A71D6uLL);
  v1 = v0;
  if (v0)
  {
    v4.tv_sec = 0;
    *(void *)&v4.tv_usec = 0;
    v0[1] = 0x580002CEEDFEEDLL;
    *((unsigned char *)v0 + 16) = 1;
    *((_DWORD *)v0 + 5) = 0;
    gettimeofday(&v4, 0);
    int v2 = 1000 * v4.tv_usec;
    *((_DWORD *)v1 + 6) = v4.tv_sec;
    *((_DWORD *)v1 + 7) = v2;
    *(_OWORD *)(v1 + 5) = 0u;
    *(_OWORD *)(v1 + 7) = 0u;
    *(_OWORD *)(v1 + 9) = 0u;
    *(_OWORD *)(v1 + 11) = 0u;
  }
  return v1;
}

void symptom_post(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    unint64_t v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    unint64_t v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("symptom_post entry, symptom pointer %p\n", (const void *)a1);
    int v4 = *v3;
  }
  if ((v4 & 4) == 0 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (!a1) {
      return;
    }
LABEL_8:
    dump_symptom((const void **)a1);
    uint64_t v5 = *(void *)(a1 + 112);
    if (*(unsigned char *)(v5 + 115))
    {
      uint64_t v6 = "Disabled";
LABEL_10:
      symptom_free((void *)a1, v6);
      return;
    }
    if (!*(unsigned char *)(v5 + 352))
    {
      uint64_t v6 = "Singlethreaded";
      goto LABEL_10;
    }
    symptom_ctrl = get_symptom_ctrl(*(void **)(a1 + 112), *(_DWORD *)(a1 + 32));
    if (*(void *)(v2 + 320) == -1) {
      int v8 = *(int **)(v2 + 328);
    }
    else {
      int v8 = (int *)_os_alloc_once();
    }
    int v9 = *v8;
    if ((*v8 & 2) != 0)
    {
      printf("symptom_post obtained control structure at %p\n", symptom_ctrl);
      int v9 = *v8;
    }
    if ((v9 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      symptom_post_cold_1();
      if (symptom_ctrl) {
        goto LABEL_20;
      }
    }
    else if (symptom_ctrl)
    {
LABEL_20:
      handle_symptom(v5, (uint64_t)symptom_ctrl, (void *)a1);
      return;
    }
    sr_log_symptom_action(a1, 2048);
    uint64_t v6 = "No mem";
    goto LABEL_10;
  }
  symptom_post_cold_2();
  if (a1) {
    goto LABEL_8;
  }
}

void handle_symptom(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    size_t v7 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    size_t v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("handle_symptom entry, symptom pointer %p   sc filter seqno %d  sr seqno %d\n", a3, *(_DWORD *)(a2 + 56), *(_DWORD *)(a1 + 104));
    int v8 = *v7;
  }
  if ((v8 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    handle_symptom_cold_12();
  }
  if (*(_DWORD *)(a2 + 56) == *(_DWORD *)(a1 + 104))
  {
    if (*(void *)(v6 + 320) == -1) {
      int v9 = *(int **)(v6 + 328);
    }
    else {
      int v9 = (int *)_os_alloc_once();
    }
    v10 = (unsigned int *)(a2 + 44);
    int v11 = *v9;
    if ((*v9 & 2) != 0)
    {
      puts("handle_symptom: filter with sc filter");
      int v11 = *v9;
    }
    if ((v11 & 4) != 0)
    {
      BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v12) {
        handle_symptom_cold_10(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  else
  {
    if (*(void *)(v6 + 320) == -1) {
      uint64_t v20 = *(int **)(v6 + 328);
    }
    else {
      uint64_t v20 = (int *)_os_alloc_once();
    }
    v10 = (unsigned int *)(a1 + 88);
    int v21 = *v20;
    if ((*v20 & 2) != 0)
    {
      puts("handle_symptom: filter with global filter");
      int v21 = *v20;
    }
    if ((v21 & 4) != 0)
    {
      BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v22) {
        handle_symptom_cold_11(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  if (*(void *)(v6 + 320) == -1) {
    uint64_t v30 = *(int **)(v6 + 328);
  }
  else {
    uint64_t v30 = (int *)_os_alloc_once();
  }
  v31 = (void *)(a2 + 64);
  int v32 = *v30;
  if ((*v30 & 2) != 0)
  {
    printf("filter_new_symptom: entry, q->sq_len %lu cf->cf_queue_len_max %d cf->cf_queue_len_alert %d\n", *v31, v10[2], v10[1]);
    int v32 = *v30;
  }
  if ((v32 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    handle_symptom_cold_9();
  }
  unsigned int v33 = v10[2];
  if (!v33)
  {
    if (*(void *)(v6 + 320) == -1) {
      v41 = *(int **)(v6 + 328);
    }
    else {
      v41 = (int *)_os_alloc_once();
    }
    int v42 = *v41;
    if ((*v41 & 2) != 0)
    {
      printf("filter_new_symptom: cf->cf_queue_len_max == 0, DROP");
      int v42 = *v41;
    }
    if ((v42 & 4) != 0)
    {
      BOOL v43 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v43) {
        handle_symptom_cold_3(v43, v44, v45, v46, v47, v48, v49, v50);
      }
    }
    goto LABEL_65;
  }
  if (*v10)
  {
    v100.__darwin_time_t tv_sec = 0;
    *(void *)&v100.tv_usec = 0;
    gettimeofday(&v100, 0);
    v34 = (uint64_t *)(a2 + 72);
    uint64_t v35 = *(void *)(a2 + 72);
    __darwin_time_t tv_sec = v100.tv_sec;
    __darwin_time_t v37 = *v10;
    if (v35 && v100.tv_sec - *(unsigned int *)(v35 + 24) > v37)
    {
      do
      {
        uint64_t v38 = *(void *)v35;
        uint64_t *v34 = *(void *)v35;
        if (!v38) {
          *(void *)(a2 + 80) = v34;
        }
        --*v31;
        update_globals_for_symptom_removal(a1, (const void **)v35);
        if (*(void *)(v6 + 320) == -1) {
          v39 = *(int **)(v6 + 328);
        }
        else {
          v39 = (int *)_os_alloc_once();
        }
        int v40 = *v39;
        if ((*v39 & 2) != 0)
        {
          puts("filter_new_symptom: DROP_HEAD (Age limit)");
          int v40 = *v39;
        }
        if ((v40 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          handle_symptom_cold_8(&v98, v99);
        }
        symptom_free((void *)v35, "Too old");
        uint64_t v35 = *v34;
        __darwin_time_t v37 = *v10;
      }
      while (*v34 && tv_sec - *(unsigned int *)(v35 + 24) > v37);
      uint64_t v51 = 1025;
    }
    else
    {
      uint64_t v51 = 1;
    }
    if (tv_sec - *((unsigned int *)a3 + 6) > v37)
    {
      if (*(void *)(v6 + 320) == -1) {
        v52 = *(int **)(v6 + 328);
      }
      else {
        v52 = (int *)_os_alloc_once();
      }
      int v53 = *v52;
      if ((*v52 & 2) != 0)
      {
        printf("filter_new_symptom: too old DROP");
        int v53 = *v52;
      }
      if ((v53 & 4) != 0)
      {
        BOOL v54 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        if (v54) {
          handle_symptom_cold_7(v54, v55, v56, v57, v58, v59, v60, v61);
        }
      }
LABEL_65:
      uint64_t v51 = 256;
      goto LABEL_96;
    }
    unsigned int v33 = v10[2];
  }
  else
  {
    uint64_t v51 = 1;
  }
  uint64_t v62 = *v31;
  if (*v31 >= (unint64_t)v33)
  {
    ++*(void *)(a1 + 304);
    v63 = *(const void ***)(a2 + 72);
    v64 = *v63;
    *(void *)(a2 + 72) = *v63;
    if (!v64) {
      *(void *)(a2 + 80) = a2 + 72;
    }
    void *v31 = v62 - 1;
    update_globals_for_symptom_removal(a1, v63);
    if (*(void *)(v6 + 320) == -1) {
      v65 = *(int **)(v6 + 328);
    }
    else {
      v65 = (int *)_os_alloc_once();
    }
    int v66 = *v65;
    if ((*v65 & 2) != 0)
    {
      puts("filter_new_symptom: DROP_HEAD");
      int v66 = *v65;
    }
    if ((v66 & 4) != 0)
    {
      BOOL v67 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v67) {
        handle_symptom_cold_6(v67, v68, v69, v70, v71, v72, v73, v74);
      }
    }
    symptom_free(v63, "Queue length limit");
    uint64_t v51 = 1025;
  }
  if (*((unsigned char *)a3 + 17) == 4)
  {
    uint64_t v51 = v51 | 0x2000;
  }
  else
  {
    *a3 = 0;
    **(void **)(a2 + 80) = a3;
    *(void *)(a2 + 80) = a3;
    unint64_t v75 = *(void *)(a2 + 64) + 1;
    *(void *)(a2 + 64) = v75;
    ++*(void *)(a1 + 120);
    unint64_t v76 = v10[1];
    if (v75 >= v76)
    {
      v97 = a3;
      if (*(void *)(v6 + 320) == -1) {
        v77 = *(int **)(v6 + 328);
      }
      else {
        v77 = (int *)_os_alloc_once();
      }
      int v78 = *v77;
      if ((*v77 & 2) != 0)
      {
        printf("filter_new_symptom: q->sq_len %zdd >= cf->cf_queue_len_alert %d ALERT\n", v75, v76);
        int v78 = *v77;
      }
      if ((v78 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        handle_symptom_cold_5();
      }
      uint64_t v51 = v51 | 2;
      a3 = v97;
    }
  }
  if (*(void *)(v6 + 320) == -1) {
    v79 = *(int **)(v6 + 328);
  }
  else {
    v79 = (int *)_os_alloc_once();
  }
  int v80 = *v79;
  if ((*v79 & 2) != 0)
  {
    printf("filter_new_symptom: return %x\n", v51);
    int v80 = *v79;
  }
  if ((v80 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    handle_symptom_cold_4(v51);
  }
LABEL_96:
  if (*(void *)(v6 + 320) == -1) {
    v81 = *(int **)(v6 + 328);
  }
  else {
    v81 = (int *)_os_alloc_once();
  }
  int v82 = *v81;
  if ((*v81 & 2) != 0)
  {
    printf("symptom_post action flags %x from filter %p\n", v51, v10);
    int v82 = *v81;
  }
  if ((v82 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    handle_symptom_cold_2((uint64_t)v10, v51, v83, v84, v85, v86, v87, v88);
  }
  sr_log_symptom_action((uint64_t)a3, v51);
  if ((v51 & 0x2000) != 0)
  {
    if (*(void *)(v6 + 320) == -1) {
      v89 = *(int **)(v6 + 328);
    }
    else {
      v89 = (int *)_os_alloc_once();
    }
    int v90 = *v89;
    if ((*v89 & 2) != 0)
    {
      printf("push_symptom_to_nhm, symptom %p\n", a3);
      int v90 = *v89;
    }
    if ((v90 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      handle_symptom_cold_1();
    }
    v91 = malloc_type_malloc(0x28A0uLL, 0xAA6ABA9DuLL);
    if (!v91)
    {
LABEL_121:
      if ((v51 & 0x100) == 0)
      {
        v96 = "Drop (immediate)";
LABEL_124:
        symptom_free(a3, v96);
        return;
      }
LABEL_123:
      ++*(void *)(a1 + 312);
      v96 = "Drop (filter)";
      goto LABEL_124;
    }
    v92 = v91;
    *((_DWORD *)v91 + 1) = 2359299;
    __int16 v93 = (_WORD)v91 + 8;
    fill_sender_id(a1, (uint64_t)(v91 + 4));
    v100.__darwin_time_t tv_sec = 10444;
    symptom = read_symptom((uint64_t)a3, (_DWORD *)v92 + 11, (unint64_t *)&v100);
    *(_DWORD *)symptom = 0;
    _WORD *v92 = 1;
    unsigned __int16 v95 = (_WORD)symptom - v93 + 8;
    v92[1] = v95;
    if (!*(unsigned char *)(a1 + 113))
    {
      connect_symptom_framework(a1);
      if (!*(unsigned char *)(a1 + 113))
      {
LABEL_120:
        free(v92);
        goto LABEL_121;
      }
      unsigned __int16 v95 = v92[1];
    }
    symptom_transport_send(a1, v92, v95 + 4);
    ++*(void *)(a1 + 288);
    goto LABEL_120;
  }
  if ((v51 & 2) != 0)
  {
    ensure_sym_ctrl_is_queued(a1, a2);
    ensure_alert(a1);
  }
  if ((v51 & 0x100) != 0) {
    goto LABEL_123;
  }
}

void sr_log_symptom_action(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1)
  {
    uint64_t v5 = *(unsigned char **)(MEMORY[0x263EF8430] + 328);
    if (!v5) {
      return;
    }
  }
  else
  {
    uint64_t v5 = (unsigned char *)_os_alloc_once();
    if (!v5) {
      return;
    }
  }
  if ((*v5 & 1) == 0) {
    return;
  }
  unsigned int v6 = snprintf(__str, 0x95uLL, "Symptom ID %x    ", *(_DWORD *)(a1 + 32));
  uint64_t v7 = 0;
  if (v6 >= 0x95) {
    unint64_t v8 = 149;
  }
  else {
    unint64_t v8 = v6;
  }
  do
  {
    if ((*(_DWORD *)(a1 + 20) >> v7))
    {
      v8 += snprintf(&__str[v8], 149 - v8, "QUAL[%d] %llx ", v7, *(void *)(a1 + 40 + 8 * v7));
      uint64_t v9 = 149;
      if (v8 > 0x95) {
        break;
      }
    }
    ++v7;
    uint64_t v9 = v8;
  }
  while (v7 != 8);
  if (a2)
  {
    uint64_t v10 = 149;
    int v11 = snprintf(&__str[v9], 149 - v9, "ACTION:");
    if ((unint64_t)(v9 + v11) < 0x95) {
      uint64_t v10 = v9 + v11;
    }
    if (a2)
    {
      int v15 = snprintf(&__str[v10], 149 - v10, " save");
      if ((unint64_t)(v10 + v15) >= 0x95) {
        uint64_t v10 = 149;
      }
      else {
        v10 += v15;
      }
      if ((a2 & 2) == 0)
      {
LABEL_15:
        if ((a2 & 0x100) == 0) {
          goto LABEL_16;
        }
        goto LABEL_45;
      }
    }
    else if ((a2 & 2) == 0)
    {
      goto LABEL_15;
    }
    uint64_t v16 = &__str[v10];
    size_t v17 = 149 - v10;
    if ((a2 & 0x1000) != 0) {
      int v18 = snprintf(v16, v17, " alert-send");
    }
    else {
      int v18 = snprintf(v16, v17, " alert-pend");
    }
    if ((unint64_t)(v10 + v18) >= 0x95) {
      uint64_t v10 = 149;
    }
    else {
      v10 += v18;
    }
    if ((a2 & 0x100) == 0)
    {
LABEL_16:
      if ((a2 & 0x400) == 0) {
        goto LABEL_17;
      }
      goto LABEL_49;
    }
LABEL_45:
    int v19 = snprintf(&__str[v10], 149 - v10, " drop");
    if ((unint64_t)(v10 + v19) >= 0x95) {
      uint64_t v10 = 149;
    }
    else {
      v10 += v19;
    }
    if ((a2 & 0x400) == 0)
    {
LABEL_17:
      if ((a2 & 0x800) == 0) {
        goto LABEL_18;
      }
      goto LABEL_53;
    }
LABEL_49:
    int v20 = snprintf(&__str[v10], 149 - v10, " (note, dropped older)");
    if ((unint64_t)(v10 + v20) >= 0x95) {
      uint64_t v10 = 149;
    }
    else {
      v10 += v20;
    }
    if ((a2 & 0x800) == 0)
    {
LABEL_18:
      if ((a2 & 0x4000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_57;
    }
LABEL_53:
    int v21 = snprintf(&__str[v10], 149 - v10, " drop (NOMEM)");
    if ((unint64_t)(v10 + v21) >= 0x95) {
      uint64_t v10 = 149;
    }
    else {
      v10 += v21;
    }
    if ((a2 & 0x4000) == 0)
    {
LABEL_19:
      if ((a2 & 0x8000) == 0)
      {
LABEL_23:
        snprintf(&__str[v10], 149 - v10, " ALERTS posted %d", *(unsigned __int8 *)(*(void *)(a1 + 112) + 114));
        goto LABEL_24;
      }
LABEL_20:
      int v12 = snprintf(&__str[v10], 149 - v10, " sent");
      if ((unint64_t)(v10 + v12) >= 0x95) {
        uint64_t v10 = 149;
      }
      else {
        v10 += v12;
      }
      goto LABEL_23;
    }
LABEL_57:
    int v22 = snprintf(&__str[v10], 149 - v10, " reinit");
    if ((unint64_t)(v10 + v22) >= 0x95) {
      uint64_t v10 = 149;
    }
    else {
      v10 += v22;
    }
    if ((a2 & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
LABEL_24:
  if (*(void *)(v4 + 320) == -1) {
    uint64_t v13 = *(int **)(v4 + 328);
  }
  else {
    uint64_t v13 = (int *)_os_alloc_once();
  }
  int v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    printf(" SYMPTOM-LOG-STRING: %s\n", __str);
    int v14 = *v13;
  }
  if ((v14 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    sr_log_symptom_action_cold_2();
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    sr_log_symptom_action_cold_1();
  }
}

void *get_symptom_ctrl(void *a1, int a2)
{
  result = (void *)a1[5];
  if (result)
  {
    while (*((_DWORD *)result + 2) != a2)
    {
      result = (void *)result[2];
      if (!result) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    result = malloc_type_calloc(1uLL, 0x58uLL, 0x10A0040C61C5460uLL);
    if (result)
    {
      void *result = 3435986669;
      *((_DWORD *)result + 2) = a2;
      *((_DWORD *)result + 14) = 0;
      result[9] = 0;
      result[8] = 0;
      result[10] = result + 9;
      uint64_t v5 = a1[5];
      result[2] = v5;
      if (!v5) {
        a1[6] = result + 2;
      }
      a1[5] = result;
      ++a1[7];
    }
  }
  return result;
}

void ensure_sym_ctrl_is_queued(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v5 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v5 = (int *)_os_alloc_once();
  }
  int v6 = *v5;
  if ((*v5 & 2) != 0)
  {
    printf("ensure_sym_ctrl_is_queued, sc %p, in use %d\n", (const void *)a2, *(unsigned __int8 *)(a2 + 40));
    int v6 = *v5;
  }
  if ((v6 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    ensure_sym_ctrl_is_queued_cold_2();
  }
  if (!*(unsigned char *)(a2 + 40))
  {
    *(unsigned char *)(a2 + 40) = 1;
    *(void *)(a2 + 24) = 0;
    uint64_t v7 = *(void **)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    *(void *)(a2 + 32) = v7;
    *uint64_t v7 = a2;
    *(void *)(a1 + 72) = a2 + 24;
    *(void *)(a1 + 80) = v8 + 1;
  }
  if (*(void *)(v4 + 320) == -1) {
    uint64_t v9 = *(int **)(v4 + 328);
  }
  else {
    uint64_t v9 = (int *)_os_alloc_once();
  }
  int v10 = *v9;
  if ((*v9 & 2) != 0)
  {
    printf("After ensure_sym_ctrl_is_queued %p\n", (const void *)a2);
    int v10 = *v9;
  }
  if ((v10 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    ensure_sym_ctrl_is_queued_cold_1();
  }
  dump_symptom_state(a1);
}

void ensure_alert(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 113))
  {
    int v2 = *(_DWORD *)(a1 + 16);
    if (v2 == 2)
    {
      if (!*(unsigned char *)(a1 + 112))
      {
        send_current(a1);
      }
    }
    else if (v2 == 1 && !*(unsigned char *)(a1 + 114))
    {
      int v5 = 0;
      memset(v4, 0, sizeof(v4));
      uint64_t v3 = 0x30000700380001;
      read_current_status(a1, (uint64_t)v4, 0, 2);
      int v5 = 0;
      symptom_transport_send(a1, &v3, 0x3CuLL);
      ++*(void *)(a1 + 272);
      sr_log_status_send(a1, (uint64_t)&v3);
      *(unsigned char *)(a1 + 114) = 1;
    }
  }
  else if (!*(unsigned char *)(a1 + 216))
  {
    ensure_symptom_framework_connect(a1);
  }
}

uint64_t symptom_transport_send(uint64_t a1, const void *a2, size_t a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  uint64_t v7 = *(void *)(MEMORY[0x263EF8430] + 320);
  if (v6)
  {
    uint64_t v8 = v6;
    if (v7 == -1) {
      uint64_t v9 = *(int **)(MEMORY[0x263EF8430] + 328);
    }
    else {
      uint64_t v9 = (int *)_os_alloc_once();
    }
    int v10 = *v9;
    if ((*v9 & 2) != 0)
    {
      printf("symptom_transport_send:  ptr %p size %lu \n", a2, a3);
      int v10 = *v9;
    }
    if ((v10 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      symptom_transport_send_cold_2();
    }
    size_t v11 = *(void *)(a1 + 264) + a3;
    ++*(void *)(a1 + 256);
    *(void *)(a1 + 264) = v11;
    xpc_dictionary_set_data(v8, "payload", a2, a3);
    if (*(unsigned char *)(a1 + 352)) {
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 136), v8);
    }
    xpc_release(v8);
    return 0;
  }
  else
  {
    if (v7 == -1) {
      uint64_t v13 = *(int **)(MEMORY[0x263EF8430] + 328);
    }
    else {
      uint64_t v13 = (int *)_os_alloc_once();
    }
    int v14 = *v13;
    if ((*v13 & 2) != 0)
    {
      puts("symptom_transport_send:  ERR no dictionary");
      int v14 = *v13;
    }
    if ((v14 & 4) != 0)
    {
      BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v15) {
        symptom_transport_send_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    return 0xFFFFFFFFLL;
  }
}

void sr_log_status_send(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1)
  {
    uint64_t v3 = *(unsigned char **)(MEMORY[0x263EF8430] + 328);
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = (unsigned char *)_os_alloc_once();
    if (!v3) {
      return;
    }
  }
  if (*v3)
  {
    strcpy(v8, "Sent STATUS flags");
    char v4 = *(unsigned char *)(a2 + 10);
    if (v4)
    {
      strcpy(&v8[17], " resp");
      uint64_t v5 = 22;
      if ((v4 & 2) == 0)
      {
LABEL_11:
        if ((v4 & 4) != 0)
        {
          int v7 = snprintf(&v8[v5], 149 - v5, " EAGAIN !!!");
          if ((unint64_t)(v5 + v7) >= 0x95) {
            uint64_t v5 = 149;
          }
          else {
            v5 += v7;
          }
        }
        snprintf(&v8[v5], 149 - v5, " ack-id %d  num-alerts %d num-queued %d", *(_DWORD *)(a2 + 12), *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20));
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          sr_log_symptom_action_cold_1();
        }
        return;
      }
    }
    else
    {
      uint64_t v5 = 17;
      if ((*(unsigned char *)(a2 + 10) & 2) == 0) {
        goto LABEL_11;
      }
    }
    int v6 = snprintf(&v8[v5], 149 - v5, " alert");
    if ((unint64_t)(v5 + v6) >= 0x95) {
      uint64_t v5 = 149;
    }
    else {
      v5 += v6;
    }
    goto LABEL_11;
  }
}

void read_current_status(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 80);
  if (v6) {
    int v7 = a4 | 2;
  }
  else {
    int v7 = a4;
  }
  *(unsigned char *)(a1 + 114) = v6 != 0;
  *(unsigned char *)a2 = 3;
  *(unsigned char *)(a2 + 1) = *(_DWORD *)(a1 + 12);
  *(unsigned char *)(a2 + 2) = v7;
  *(unsigned char *)(a2 + 3) = 0;
  *(_DWORD *)(a2 + 4) = a3;
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = *(void *)(a1 + 120);
  uint64_t v8 = *(void *)(a1 + 24);
  if (v8)
  {
    int v5 = a3;
    uint64_t v4 = a2;
    uint64_t v9 = 0;
    unint64_t v10 = 32;
    while (1)
    {
      int v11 = *(unsigned __int8 *)(v8 + v9);
      *(unsigned char *)(a2 + v9 + 16) = v11;
      if (!v11) {
        break;
      }
      --v10;
      ++v9;
      if (v10 <= 1)
      {
        *(unsigned char *)(a2 + v9 + 16) = 0;
        break;
      }
    }
    if (*(void *)(MEMORY[0x263EF8430] + 320) == -1)
    {
      int v12 = *(int **)(MEMORY[0x263EF8430] + 328);
      goto LABEL_11;
    }
  }
  else
  {
    __break(1u);
  }
  int v12 = (int *)_os_alloc_once();
LABEL_11:
  int v13 = *v12;
  if ((*v12 & 2) != 0)
  {
    printf("read_current_status, ack id %d, flags %d num_alerts %d  num_queued %d\n", v5, v7, *(_DWORD *)(v4 + 8), *(_DWORD *)(v4 + 12));
    int v13 = *v12;
  }
  if ((v13 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v14 = *(_DWORD *)(v4 + 8);
    int v15 = *(_DWORD *)(v4 + 12);
    *(_DWORD *)buf = 67109888;
    int v17 = v5;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 1024;
    int v21 = v14;
    __int16 v22 = 1024;
    int v23 = v15;
    _os_log_debug_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "read_current_status, ack id %d, flags %d num_alerts %d  num_queued %d\n", buf, 0x1Au);
  }
  dump_status((unsigned __int8 *)v4);
}

void dump_symptom_state(uint64_t a1)
{
  dump_system_reporter(a1);
  dump_idents(a1);
  dump_active_idents(a1);
}

void dump_system_reporter(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      puts("System global... ");
      int v4 = *v3;
    }
    if ((v4 & 4) != 0)
    {
      BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v5) {
        dump_system_reporter_cold_9(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v13 = *(int **)(v2 + 328);
  }
  else {
    int v13 = (int *)_os_alloc_once();
  }
  int v14 = *v13;
  if ((*v13 & 8) != 0)
  {
    if ((v14 & 2) != 0)
    {
      printf(" sr_ctrl_head        first, last  %p %p\n", *(const void **)(a1 + 40), *(const void **)(a1 + 48));
      int v14 = *v13;
    }
    if ((v14 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_system_reporter_cold_8();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v15 = *(int **)(v2 + 328);
  }
  else {
    int v15 = (int *)_os_alloc_once();
  }
  int v16 = *v15;
  if ((*v15 & 8) != 0)
  {
    if ((v16 & 2) != 0)
    {
      printf(" sr_ctrl_num    %lu\n", *(void *)(a1 + 56));
      int v16 = *v15;
    }
    if ((v16 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_system_reporter_cold_7();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v17 = *(int **)(v2 + 328);
  }
  else {
    int v17 = (int *)_os_alloc_once();
  }
  int v18 = *v17;
  if ((*v17 & 8) != 0)
  {
    if ((v18 & 2) != 0)
    {
      printf(" sr_ctrl_active_head first, last  %p %p\n", *(const void **)(a1 + 64), *(const void **)(a1 + 72));
      int v18 = *v17;
    }
    if ((v18 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_system_reporter_cold_6();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v19 = *(int **)(v2 + 328);
  }
  else {
    int v19 = (int *)_os_alloc_once();
  }
  int v20 = *v19;
  if ((*v19 & 8) != 0)
  {
    if ((v20 & 2) != 0)
    {
      printf(" sr_num_active  %lu\n", *(void *)(a1 + 80));
      int v20 = *v19;
    }
    if ((v20 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_system_reporter_cold_5();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v21 = *(int **)(v2 + 328);
  }
  else {
    int v21 = (int *)_os_alloc_once();
  }
  int v22 = *v21;
  if ((*v21 & 8) != 0)
  {
    if ((v22 & 2) != 0)
    {
      puts(" sr_filter ...");
      int v22 = *v21;
    }
    if ((v22 & 4) != 0)
    {
      BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v23) {
        dump_system_reporter_cold_4(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }
  dump_creation_filter((_DWORD *)(a1 + 88));
  if (*(void *)(v2 + 320) == -1) {
    v31 = *(int **)(v2 + 328);
  }
  else {
    v31 = (int *)_os_alloc_once();
  }
  int v32 = *v31;
  if ((*v31 & 8) != 0)
  {
    if ((v32 & 2) != 0)
    {
      printf(" sr_filter_seqno  %u\n", *(_DWORD *)(a1 + 104));
      int v32 = *v31;
    }
    if ((v32 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_system_reporter_cold_3();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    unsigned int v33 = *(int **)(v2 + 328);
  }
  else {
    unsigned int v33 = (int *)_os_alloc_once();
  }
  int v34 = *v33;
  if ((*v33 & 8) != 0)
  {
    if ((v34 & 2) != 0)
    {
      printf(" sr_alert_sent       %d\n", *(unsigned __int8 *)(a1 + 114));
      int v34 = *v33;
    }
    if ((v34 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_system_reporter_cold_2();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v35 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v35 = (int *)_os_alloc_once();
  }
  int v36 = *v35;
  if ((*v35 & 8) != 0)
  {
    if ((v36 & 2) != 0)
    {
      printf(" sr_q_counts         %lu\n", *(void *)(a1 + 120));
      int v36 = *v35;
    }
    if ((v36 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_system_reporter_cold_1();
    }
  }
}

void dump_symptom(const void **a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      printf(" Symptom at %p\n", a1);
      int v4 = *v3;
    }
    if ((v4 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_symptom_cold_3();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    BOOL v5 = *(int **)(v2 + 328);
  }
  else {
    BOOL v5 = (int *)_os_alloc_once();
  }
  int v6 = *v5;
  if ((*v5 & 8) != 0)
  {
    if ((v6 & 2) != 0)
    {
      printf("   s_link next  %p\n", *a1);
      int v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_symptom_cold_2();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v7 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 8) != 0)
  {
    if ((v8 & 2) != 0)
    {
      printf("   s_magic      %x\n", *((_DWORD *)a1 + 2));
      int v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_symptom_cold_1();
    }
  }
  dump_basic_symptom((unsigned __int8 *)a1 + 16);
}

void dump_status(unsigned __int8 *a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      puts("Reporter status:");
      int v4 = *v3;
    }
    if ((v4 & 4) != 0)
    {
      BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v5) {
        dump_status_cold_7(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v13 = *(int **)(v2 + 328);
  }
  else {
    int v13 = (int *)_os_alloc_once();
  }
  int v14 = *v13;
  if ((*v13 & 8) != 0)
  {
    if ((v14 & 2) != 0)
    {
      printf("srs_version             %d\n", *a1);
      int v14 = *v13;
    }
    if ((v14 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_status_cold_6();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v15 = *(int **)(v2 + 328);
  }
  else {
    int v15 = (int *)_os_alloc_once();
  }
  int v16 = *v15;
  if ((*v15 & 8) != 0)
  {
    if ((v16 & 2) != 0)
    {
      printf("srs_flags               %0x\n", a1[2]);
      int v16 = *v15;
    }
    if ((v16 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_status_cold_5();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v17 = *(int **)(v2 + 328);
  }
  else {
    int v17 = (int *)_os_alloc_once();
  }
  int v18 = *v17;
  if ((*v17 & 8) != 0)
  {
    if ((v18 & 2) != 0)
    {
      printf("srs_ack_id              %0x\n", *((_DWORD *)a1 + 1));
      int v18 = *v17;
    }
    if ((v18 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_status_cold_4();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v19 = *(int **)(v2 + 328);
  }
  else {
    int v19 = (int *)_os_alloc_once();
  }
  int v20 = *v19;
  if ((*v19 & 8) != 0)
  {
    if ((v20 & 2) != 0)
    {
      printf("srs_num_alerts          %d\n", *((_DWORD *)a1 + 2));
      int v20 = *v19;
    }
    if ((v20 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_status_cold_3();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v21 = *(int **)(v2 + 328);
  }
  else {
    int v21 = (int *)_os_alloc_once();
  }
  int v22 = *v21;
  if ((*v21 & 8) != 0)
  {
    if ((v22 & 2) != 0)
    {
      printf("srs_num_queued          %d\n", *((_DWORD *)a1 + 3));
      int v22 = *v21;
    }
    if ((v22 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_status_cold_2();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    BOOL v23 = *(int **)(v2 + 328);
  }
  else {
    BOOL v23 = (int *)_os_alloc_once();
  }
  int v24 = *v23;
  if ((*v23 & 8) != 0)
  {
    if ((v24 & 2) != 0)
    {
      puts("srs_sym_basic   ...");
      int v24 = *v23;
    }
    if ((v24 & 4) != 0)
    {
      BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v25) {
        dump_status_cold_1(v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
  }
}

void dump_idents(uint64_t a1)
{
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v2 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v2 = (int *)_os_alloc_once();
  }
  int v3 = *v2;
  if ((*v2 & 8) != 0)
  {
    if ((v3 & 2) != 0)
    {
      puts("dump_idents.. ");
      int v3 = *v2;
    }
    if ((v3 & 4) != 0)
    {
      BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v4) {
        dump_idents_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  for (uint64_t i = *(void *)(a1 + 40); i; uint64_t i = *(void *)(i + 16))
    dump_ident((const void **)i);
}

void dump_basic_symptom(unsigned __int8 *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    int v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    int v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      printf(" sb_version         %d\n", *a1);
      int v4 = *v3;
    }
    if ((v4 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_basic_symptom_cold_5();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v5 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v5 = (int *)_os_alloc_once();
  }
  int v6 = *v5;
  if ((*v5 & 8) != 0)
  {
    if ((v6 & 2) != 0)
    {
      printf(" sb_flags           %x\n", *((_DWORD *)a1 + 1));
      int v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_basic_symptom_cold_4();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v7 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 8) != 0)
  {
    if ((v8 & 2) != 0)
    {
      printf(" sb_timestamp_secs  %d\n", *((_DWORD *)a1 + 2));
      int v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_basic_symptom_cold_3();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v9 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v9 = (int *)_os_alloc_once();
  }
  int v10 = *v9;
  if ((*v9 & 8) != 0)
  {
    if ((v10 & 2) != 0)
    {
      printf(" sb_timestamp_nsecs %d\n", *((_DWORD *)a1 + 3));
      int v10 = *v9;
    }
    if ((v10 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_basic_symptom_cold_2();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v11 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v11 = (int *)_os_alloc_once();
  }
  int v12 = *v11;
  if ((*v11 & 8) != 0)
  {
    if ((v12 & 2) != 0)
    {
      printf(" sb_ident           %d\n", *((_DWORD *)a1 + 4));
      int v12 = *v11;
    }
    if ((v12 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_basic_symptom_cold_1();
    }
  }
  uint64_t v13 = 0;
  int v14 = a1 + 24;
  int v15 = &_os_log_internal;
  do
  {
    if (*(void *)(v2 + 320) == -1) {
      int v16 = *(int **)(v2 + 328);
    }
    else {
      int v16 = (int *)_os_alloc_once();
    }
    int v17 = *v16;
    if ((*v16 & 8) != 0)
    {
      if ((v17 & 2) != 0)
      {
        printf(" sb_qualifier[%d]    %llx\n", v13, *(void *)&v14[8 * v13]);
        int v17 = *v16;
      }
      if ((v17 & 4) != 0 && os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *(void *)&v14[8 * v13];
        *(_DWORD *)buf = 67109376;
        int v20 = v13;
        __int16 v21 = 2048;
        uint64_t v22 = v18;
        _os_log_debug_impl(&dword_21874A000, v15, OS_LOG_TYPE_DEBUG, " sb_qualifier[%d]    %llx\n", buf, 0x12u);
      }
    }
    ++v13;
  }
  while (v13 != 8);
}

void dump_active_idents(uint64_t a1)
{
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v2 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v2 = (int *)_os_alloc_once();
  }
  int v3 = *v2;
  if ((*v2 & 8) != 0)
  {
    if ((v3 & 2) != 0)
    {
      puts("dump_active_idents.. ");
      int v3 = *v2;
    }
    if ((v3 & 4) != 0)
    {
      BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v4) {
        dump_active_idents_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  for (uint64_t i = *(void *)(a1 + 64); i; uint64_t i = *(void *)(i + 24))
    dump_ident((const void **)i);
}

void dump_ident(const void **a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    int v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    int v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      printf("symptom_ctrl at %p\n", a1);
      int v4 = *v3;
    }
    if ((v4 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_ident_cold_10();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v5 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v5 = (int *)_os_alloc_once();
  }
  int v6 = *v5;
  if ((*v5 & 8) != 0)
  {
    if ((v6 & 2) != 0)
    {
      printf(" sc_magic               %x\n", *(_DWORD *)a1);
      int v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_ident_cold_9();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v7 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 8) != 0)
  {
    if ((v8 & 2) != 0)
    {
      printf(" sc_flags               %x\n", *((_DWORD *)a1 + 1));
      int v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_ident_cold_8();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v9 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v9 = (int *)_os_alloc_once();
  }
  int v10 = *v9;
  if ((*v9 & 8) != 0)
  {
    if ((v10 & 2) != 0)
    {
      printf(" sc_id                  %x\n", *((_DWORD *)a1 + 2));
      int v10 = *v9;
    }
    if ((v10 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_ident_cold_7();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v11 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v11 = (int *)_os_alloc_once();
  }
  int v12 = *v11;
  if ((*v11 & 8) != 0)
  {
    if ((v12 & 2) != 0)
    {
      printf(" sc_link                %p\n", a1[2]);
      int v12 = *v11;
    }
    if ((v12 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_ident_cold_6();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v13 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v13 = (int *)_os_alloc_once();
  }
  int v14 = *v13;
  if ((*v13 & 8) != 0)
  {
    if ((v14 & 2) != 0)
    {
      printf(" sc_active_link         %p\n", a1[3]);
      int v14 = *v13;
    }
    if ((v14 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_ident_cold_5();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v15 = *(int **)(v2 + 328);
  }
  else {
    int v15 = (int *)_os_alloc_once();
  }
  int v16 = *v15;
  if ((*v15 & 8) != 0)
  {
    if ((v16 & 2) != 0)
    {
      printf(" sc_active_link_in_use  %d\n", *((unsigned __int8 *)a1 + 40));
      int v16 = *v15;
    }
    if ((v16 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_ident_cold_4();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    int v17 = *(int **)(v2 + 328);
  }
  else {
    int v17 = (int *)_os_alloc_once();
  }
  int v18 = *v17;
  if ((*v17 & 8) != 0)
  {
    if ((v18 & 2) != 0)
    {
      puts(" sc_filter ...");
      int v18 = *v17;
    }
    if ((v18 & 4) != 0)
    {
      BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v19) {
        dump_ident_cold_3(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }
  dump_creation_filter((_DWORD *)a1 + 11);
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v27 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v27 = (int *)_os_alloc_once();
  }
  int v28 = *v27;
  if ((*v27 & 8) != 0)
  {
    if ((v28 & 2) != 0)
    {
      printf(" sc_symptom_q len %lu\n", a1[8]);
      int v28 = *v27;
    }
    if ((v28 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_ident_cold_2();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v29 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v29 = (int *)_os_alloc_once();
  }
  int v30 = *v29;
  if ((*v29 & 8) != 0)
  {
    if ((v30 & 2) != 0)
    {
      printf(" sc_symptom_q first, last %p %p\n", a1[9], a1[10]);
      int v30 = *v29;
    }
    if ((v30 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_ident_cold_1();
    }
  }
}

void dump_creation_filter(_DWORD *a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    int v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    int v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      printf("    cf_queue_len_max    %x\n", a1[2]);
      int v4 = *v3;
    }
    if ((v4 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_creation_filter_cold_3();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v5 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v5 = (int *)_os_alloc_once();
  }
  int v6 = *v5;
  if ((*v5 & 8) != 0)
  {
    if ((v6 & 2) != 0)
    {
      printf("    cf_queue_len_alert  %x\n", a1[1]);
      int v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_creation_filter_cold_2();
    }
  }
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v7 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 8) != 0)
  {
    if ((v8 & 2) != 0)
    {
      printf("    cf_filter_seqno     %x\n", a1[3]);
      int v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      dump_creation_filter_cold_1();
    }
  }
}

BOOL is_valid_symptom(uint64_t a1)
{
  BOOL result = 0;
  if (*(_DWORD *)(a1 + 8) == -823263507)
  {
    uint64_t v1 = *(void *)(a1 + 112);
    if (v1)
    {
      if (*(_DWORD *)(v1 + 8) == 195165933) {
        return 1;
      }
    }
  }
  return result;
}

BOOL is_valid_symptom_reporter(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) == 195165933;
}

BOOL is_valid_symptom_ctrl(_DWORD *a1)
{
  return *a1 == -858980627;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void *symptom_framework_init(unsigned int a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (a1 > 0xFF || v4 > 0x400) {
    return 0;
  }
  return obtain_symptom_framework(a1, __s, v4);
}

void *symptom_new(uint64_t a1, unsigned int a2)
{
  BOOL result = 0;
  if (a1 && !(a2 >> 20))
  {
    BOOL result = _basic_symptom_create();
    if (result)
    {
      *((_DWORD *)result + 8) = a2 | (*(_DWORD *)(a1 + 12) << 20);
      result[14] = a1;
    }
  }
  return result;
}

uint64_t symptom_set_additional_qualifier(uint64_t a1, int a2, size_t a3, const void *a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v8 = ((a3 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 8;
  if (get_symptom_qual_size(a1) + v8 > 0x2710) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)get_symptom_qual_count(a1) > 0x13) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = malloc_type_calloc(1uLL, a3 + 27, 0xC0EB7443uLL);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  int v10 = v9;
  *((_DWORD *)v9 + 2) = 11337453;
  *((_WORD *)v9 + 6) = 8;
  *((_WORD *)v9 + 7) = v8;
  *((_DWORD *)v9 + 4) = a2;
  *((_DWORD *)v9 + 5) = a3;
  if (a3)
  {
    if (a4) {
      memcpy(v9 + 3, a4, a3);
    }
  }
  uint64_t result = 0;
  void *v10 = *(void *)(a1 + 104);
  *(void *)(a1 + 104) = v10;
  *(_DWORD *)(a1 + 20) |= 0x40000000u;
  return result;
}

uint64_t symptom_set_additional_digest(uint64_t a1, int a2, CC_LONG a3, const void *a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)(get_symptom_qual_size(a1) - 9961) < 0xFFFFFFFFFFFFD8EFLL) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)get_symptom_qual_count(a1) > 0x13) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v8 = malloc_type_calloc(1uLL, 0x38uLL, 0x29B02B86uLL);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  *((void *)v8 + 1) = 0x28000800ACFEEDLL;
  *((_DWORD *)v8 + 4) = a2 | 0x80000000;
  *((_DWORD *)v8 + 5) = 32;
  CC_SHA256(a4, a3, (unsigned __int8 *)v8 + 24);
  uint64_t result = 0;
  *uint64_t v9 = *(void *)(a1 + 104);
  *(void *)(a1 + 104) = v9;
  *(_DWORD *)(a1 + 20) |= 0x40000000u;
  return result;
}

uint64_t symptom_send_immediate(uint64_t a1)
{
  if (a1)
  {
    *(unsigned char *)(a1 + 17) = 4;
    sr_log_symptom(a1);
    uint64_t v2 = *(void *)(a1 + 112);
    if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
      uint64_t v3 = *(void *)(MEMORY[0x263EF8430] + 328);
    }
    else {
      uint64_t v3 = _os_alloc_once();
    }
    if (!*(unsigned char *)(v3 + 32))
    {
      if (!_dispatch_is_multithreaded())
      {
        *(unsigned char *)(v2 + 352) = 0;
        symptom_free((void *)a1, "Not Multithreaded");
        return 0;
      }
      if (*(void *)(v3 + 24) != -1) {
        dispatch_once_f((dispatch_once_t *)(v3 + 24), (void *)v3, (dispatch_function_t)symptoms_go_multithreaded);
      }
    }
    *(unsigned char *)(v2 + 352) = 1;
    dispatch_async_f(*(dispatch_queue_t *)(v2 + 128), (void *)a1, (dispatch_function_t)symptom_post);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t symptom_framework_set_version(uint64_t a1, int a2)
{
  if (a1) {
    BOOL v2 = (a2 - 1) >= 2;
  }
  else {
    BOOL v2 = 1;
  }
  uint64_t v3 = !v2;
  if (v3 == 1) {
    *(_DWORD *)(a1 + 16) = a2;
  }
  return v3;
}

uint64_t symptom_transport_connect(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("symptom_transport_connect called, connecting to %s\n", "com.apple.usymptomsd");
    int v4 = *v3;
  }
  if ((v4 & 4) != 0)
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v5) {
      symptom_transport_connect_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.usymptomsd", *(dispatch_queue_t *)(a1 + 128), 2uLL);
  *(void *)(a1 + 136) = mach_service;
  if (mach_service)
  {
    gettimeofday((timeval *)(a1 + 160), 0);
    xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 136), *(dispatch_queue_t *)(a1 + 128));
    int v14 = *(_xpc_connection_s **)(a1 + 136);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __symptom_transport_connect_block_invoke;
    handler[3] = &__block_descriptor_tmp;
    handler[4] = a1;
    xpc_connection_set_event_handler(v14, handler);
    xpc_connection_resume(*(xpc_connection_t *)(a1 + 136));
    return 0;
  }
  else
  {
    if (*(void *)(v2 + 320) == -1) {
      int v16 = *(int **)(v2 + 328);
    }
    else {
      int v16 = (int *)_os_alloc_once();
    }
    int v17 = *v16;
    if ((*v16 & 2) != 0)
    {
      printf("failed to connect to %s\n", "com.apple.usymptomsd");
      int v17 = *v16;
    }
    if ((v17 & 4) != 0)
    {
      BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v18) {
        symptom_transport_connect_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    return 0xFFFFFFFFLL;
  }
}

void __symptom_transport_connect_block_invoke(uint64_t a1, void *a2)
{
  int v4 = (const void *)MEMORY[0x21D4713B0](a2);
  uint64_t v5 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v6 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v6 = (int *)_os_alloc_once();
  }
  int v7 = *v6;
  if ((*v6 & 2) != 0)
  {
    printf("symptom_transport_connect event handler called on %p for %p evcount %lu errcount %lu\n", *(const void **)(a1 + 32), a2, *(void *)(*(void *)(a1 + 32) + 224), *(void *)(*(void *)(a1 + 32) + 240));
    int v7 = *v6;
  }
  if ((v7 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __symptom_transport_connect_block_invoke_cold_10(a1, (uint64_t)a2);
  }
  if (v4 != (const void *)MEMORY[0x263EF8720])
  {
    if (v4 == (const void *)MEMORY[0x263EF8708])
    {
      *(void *)(*(void *)(a1 + 32) + 152) = 0;
      if (*(void *)(v5 + 320) == -1) {
        int v17 = *(int **)(v5 + 328);
      }
      else {
        int v17 = (int *)_os_alloc_once();
      }
      int v18 = *v17;
      if ((*v17 & 2) != 0)
      {
        printf("handling incoming message");
        int v18 = *v17;
      }
      if ((v18 & 4) != 0)
      {
        BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        if (v19) {
          __symptom_transport_connect_block_invoke_cold_8(v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }
      uint64_t v27 = *(void **)(a1 + 32);
      size_t length = 0;
      data = (unsigned __int16 *)xpc_dictionary_get_data(a2, "payload", &length);
      uint64_t v29 = *(void *)(v5 + 320);
      if (data)
      {
        int v30 = data;
        if (v29 == -1) {
          uint64_t v31 = *(int **)(v5 + 328);
        }
        else {
          uint64_t v31 = (int *)_os_alloc_once();
        }
        int v32 = *v31;
        if ((*v31 & 2) != 0)
        {
          printf("handle_incoming_xpc_dictionary:  desc %p size %lu\n", v30, length);
          int v32 = *v31;
        }
        if ((v32 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          __symptom_transport_connect_block_invoke_cold_7();
        }
        size_t v33 = length;
        size_t v34 = v27[29] + length;
        ++v27[28];
        v27[29] = v34;
        symptoms_incoming_message((uint64_t)v27, v30, v33);
      }
      else
      {
        if (v29 == -1) {
          v41 = *(int **)(v5 + 328);
        }
        else {
          v41 = (int *)_os_alloc_once();
        }
        int v42 = *v41;
        if ((*v41 & 2) != 0)
        {
          printf("handle_incoming_xpc_dictionary:  ERR message with no payload");
          int v42 = *v41;
        }
        if ((v42 & 4) != 0)
        {
          BOOL v43 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
          if (v43) {
            __symptom_transport_connect_block_invoke_cold_6(v43, v44, v45, v46, v47, v48, v49, v50);
          }
        }
        ++v27[30];
      }
    }
    else
    {
      if (*(void *)(v5 + 320) == -1) {
        uint64_t v8 = *(int **)(v5 + 328);
      }
      else {
        uint64_t v8 = (int *)_os_alloc_once();
      }
      int v9 = *v8;
      if ((*v8 & 2) != 0)
      {
        printf("unexpected message from peer %p", v4);
        int v9 = *v8;
      }
      if ((v9 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        __symptom_transport_connect_block_invoke_cold_9();
      }
      ++*(void *)(*(void *)(a1 + 32) + 240);
    }
    return;
  }
  if (*(void *)(v5 + 320) == -1) {
    uint64_t v10 = *(int **)(v5 + 328);
  }
  else {
    uint64_t v10 = (int *)_os_alloc_once();
  }
  int v11 = *v10;
  if ((*v10 & 2) != 0)
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    printf("connection error: %s\n", string);
    int v11 = *v10;
  }
  if ((v11 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __symptom_transport_connect_block_invoke_cold_5(a2);
  }
  if (a2 == (void *)MEMORY[0x263EF86A0])
  {
    sr_log_xpc_event(*(void *)(a1 + 32), (uint64_t)"SymptomReporter: XPC connection to Symptom Framework interrupted\n");
    uint64_t v35 = *(void *)(a1 + 32);
    ++*(void *)(v35 + 144);
    *(unsigned char *)(v35 + 113) = 0;
    ++*(void *)(v35 + 328);
    goto LABEL_52;
  }
  if (a2 != (void *)MEMORY[0x263EF86A8])
  {
    uint64_t v13 = *(void *)(v5 + 320);
    if (a2 == (void *)MEMORY[0x263EF86C0])
    {
      if (v13 == -1) {
        uint64_t v51 = *(int **)(v5 + 328);
      }
      else {
        uint64_t v51 = (int *)_os_alloc_once();
      }
      int v52 = *v51;
      if ((*v51 & 2) != 0)
      {
        puts("symptom_transport: skipping TERMINATION_IMMINENT event");
        int v52 = *v51;
      }
      if ((v52 & 4) != 0)
      {
        BOOL v53 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        if (v53) {
          __symptom_transport_connect_block_invoke_cold_3(v53, v54, v55, v56, v57, v58, v59, v60);
        }
      }
    }
    else
    {
      if (v13 == -1) {
        int v14 = *(int **)(v5 + 328);
      }
      else {
        int v14 = (int *)_os_alloc_once();
      }
      int v15 = *v14;
      if ((*v14 & 2) != 0)
      {
        int v16 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        printf("symptom_transport: unhandled connection error: %s", v16);
        int v15 = *v14;
      }
      if ((v15 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        __symptom_transport_connect_block_invoke_cold_4(a2);
      }
    }
    return;
  }
  uint64_t v36 = *(void *)(a1 + 32);
  __darwin_time_t v37 = *(void **)(v36 + 136);
  if (v37)
  {
    xpc_release(v37);
    *(void *)(*(void *)(a1 + 32) + 136) = 0;
    uint64_t v36 = *(void *)(a1 + 32);
  }
  *(void *)(v36 + 136) = 0;
  uint64_t v38 = *(void *)(a1 + 32);
  *(unsigned char *)(v38 + 113) = 0;
  ++*(void *)(v38 + 336);
  unsigned int v39 = *(_DWORD *)(v38 + 212) + 1;
  *(_DWORD *)(v38 + 212) = v39;
  if (v39 >= 2)
  {
    *(_DWORD *)(v38 + 212) = 0;
    uint64_t v40 = *(void *)(v5 + 320);
LABEL_81:
    if (v40 == -1) {
      uint64_t v71 = *(int **)(v5 + 328);
    }
    else {
      uint64_t v71 = (int *)_os_alloc_once();
    }
    int v72 = *v71;
    if ((*v71 & 2) != 0)
    {
      puts("symptom_transport: CONNECTION_INVALID");
      int v72 = *v71;
    }
    if ((v72 & 4) != 0)
    {
      BOOL v73 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v73) {
        __symptom_transport_connect_block_invoke_cold_1(v73, v74, v75, v76, v77, v78, v79, v80);
      }
    }
    uint64_t v35 = *(void *)(a1 + 32);
    unint64_t v81 = *(void *)(v35 + 152) + 1;
    *(void *)(v35 + 152) = v81;
    if (v81 >= 4)
    {
      sr_log_xpc_event(v35, (uint64_t)"SymptomReporter: Disabling Symptom Transport after perstent invalid connections\n");
      *(unsigned char *)(*(void *)(a1 + 32) + 115) = 1;
      return;
    }
    if (*(void *)(v35 + 192) < 0xDF8475800uLL) {
      *(void *)(v35 + 192) = 60000000000;
    }
LABEL_52:
    symptoms_transport_dropped(v35);
    return;
  }
  uint64_t v40 = *(void *)(v5 + 320);
  if (!v39) {
    goto LABEL_81;
  }
  if (v40 == -1) {
    uint64_t v61 = *(int **)(v5 + 328);
  }
  else {
    uint64_t v61 = (int *)_os_alloc_once();
  }
  int v62 = *v61;
  if ((*v61 & 2) != 0)
  {
    printf("symptom_transport: XPC connection invalid for %s, switch to %s\n", "com.apple.usymptomsd", "com.apple.usymptomsd");
    int v62 = *v61;
  }
  if ((v62 & 4) != 0)
  {
    BOOL v63 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v63) {
      __symptom_transport_connect_block_invoke_cold_2(v63, v64, v65, v66, v67, v68, v69, v70);
    }
  }
  symptoms_transport_fastdrop(*(void *)(a1 + 32));
}

void sr_log_xpc_event(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 24);
    int v5 = 136315394;
    uint64_t v6 = v4;
    __int16 v7 = 2080;
    uint64_t v8 = a2;
    _os_log_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v5, 0x16u);
  }
}

uint64_t symptoms_go_multithreaded(uint64_t result)
{
  *(unsigned char *)(result + 32) = 1;
  return result;
}

void _symptoms_globals_init(uint64_t a1)
{
  if (_dispatch_is_fork_of_multithreaded_parent())
  {
    *(unsigned char *)(a1 + 32) = -1;
  }
  else if (_dispatch_is_multithreaded() && *(void *)(a1 + 24) != -1)
  {
    dispatch_once_f((dispatch_once_t *)(a1 + 24), (void *)a1, (dispatch_function_t)symptoms_go_multithreaded);
  }
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a1 + 8;
}

_DWORD *set_symptom_verbosity(int a1)
{
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1)
  {
    uint64_t result = *(_DWORD **)(MEMORY[0x263EF8430] + 328);
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t result = (_DWORD *)_os_alloc_once();
    if (!result) {
      return result;
    }
  }
  _DWORD *result = a1;
  return result;
}

uint64_t symptom_framework_stats(uint64_t a1, _OWORD *a2)
{
  if (a2)
  {
    *(unsigned char *)(a1 + 320) = *(unsigned char *)(a1 + 113);
    long long v2 = *(_OWORD *)(a1 + 224);
    long long v3 = *(_OWORD *)(a1 + 240);
    long long v4 = *(_OWORD *)(a1 + 272);
    a2[2] = *(_OWORD *)(a1 + 256);
    a2[3] = v4;
    *a2 = v2;
    a2[1] = v3;
    long long v5 = *(_OWORD *)(a1 + 336);
    long long v7 = *(_OWORD *)(a1 + 288);
    long long v6 = *(_OWORD *)(a1 + 304);
    a2[6] = *(_OWORD *)(a1 + 320);
    a2[7] = v5;
    a2[4] = v7;
    a2[5] = v6;
  }
  return 1;
}

void symptom_free(void *a1, const char *a2)
{
  if (a1)
  {
    while (1)
    {
      long long v4 = (void *)a1[13];
      if (!v4) {
        break;
      }
      a1[13] = *v4;
      free(v4);
    }
    *((_DWORD *)a1 + 2) = -823271763;
    if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
      long long v5 = *(int **)(MEMORY[0x263EF8430] + 328);
    }
    else {
      long long v5 = (int *)_os_alloc_once();
    }
    int v6 = *v5;
    if ((*v5 & 2) != 0)
    {
      printf("Free symptom %p, %s", a1, a2);
      int v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      symptom_free_cold_1();
    }
    free(a1);
  }
}

uint64_t get_symptom_qual_size(uint64_t a1)
{
  uint64_t v1 = *(uint64_t ***)(a1 + 104);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  do
  {
    result += *((unsigned __int16 *)v1 + 7) + 4;
    uint64_t v1 = (uint64_t **)*v1;
  }
  while (v1);
  return result;
}

uint64_t get_symptom_qual_count(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 104);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  do
  {
    if ((*((unsigned char *)v1 + 19) & 0x40) == 0) {
      ++result;
    }
    uint64_t v1 = (uint64_t *)*v1;
  }
  while (v1);
  return result;
}

void symptoms_incoming_message(uint64_t a1, unsigned __int16 *a2, unint64_t a3)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v6 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    long long v7 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    long long v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    puts("+++ SYMPTOMSD MESSAGE RECEIVED +++");
    int v8 = *v7;
  }
  if ((v8 & 4) != 0)
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v9) {
      symptoms_incoming_message_cold_5(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  if (a3 < 4) {
    return;
  }
  int v17 = &_os_log_internal;
  while (1)
  {
    unsigned int v18 = *a2;
    if (v18 <= 0xB) {
      break;
    }
    if (v18 != 12)
    {
      if (v18 == 41)
      {
        if (a3 >= 8 && a2[1] == 4)
        {
          ++*(void *)(a1 + 248);
          if (*((_DWORD *)a2 + 1) == *(_DWORD *)(a1 + 108))
          {
            *(unsigned char *)(a1 + 112) = 0;
            if (*(void *)(a1 + 80)) {
              send_current(a1);
            }
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          symptoms_incoming_message_cold_4(buf, a3, &buf[4]);
        }
      }
      return;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v53 = a2[1];
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = a3;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v53;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = 16;
      _os_log_debug_impl(&dword_21874A000, v17, OS_LOG_TYPE_DEBUG, "SymptomReporter incoming_message, SYMTLV_FILTER sc %zd desc->stlv_len %d filter size %zd", buf, 0x1Cu);
    }
    if (a3 < 0x14 || (unint64_t v30 = a2[1], v30 < 0x10) || (v30 & 0xF) != 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v55 = a2[1];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = a3;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v55;
        _os_log_error_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SymptomReporter incoming_message, SYMTLV_FILTER sz %zd fails consistency checks, desc->stlv_len %d", buf, 0x12u);
      }
      return;
    }
    if (*(void *)(v6 + 320) == -1) {
      uint64_t v31 = *(int **)(v6 + 328);
    }
    else {
      uint64_t v31 = (int *)_os_alloc_once();
    }
    unint64_t v32 = v30 >> 4;
    int v33 = *v31;
    if ((*v31 & 2) != 0)
    {
      printf("apply_new_filters, count is %zd, seqno %d\n", v30 >> 4, *(_DWORD *)(a1 + 104) + 1);
      int v33 = *v31;
    }
    if ((v33 & 4) != 0 && os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v54 = *(_DWORD *)(a1 + 104) + 1;
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v30 >> 4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v54;
      _os_log_debug_impl(&dword_21874A000, v17, OS_LOG_TYPE_DEBUG, "apply_new_filters, count is %zd, seqno %d\n", buf, 0x12u);
    }
    ++*(_DWORD *)(a1 + 104);
    size_t v34 = a2 + 8;
    do
    {
      int v35 = *(v34 - 2);
      uint64_t v36 = *(void *)(v6 + 320);
      if (!v35)
      {
        uint64_t v40 = (_DWORD *)(a1 + 88);
        goto LABEL_61;
      }
      if (v36 == -1) {
        __darwin_time_t v37 = *(int **)(v6 + 328);
      }
      else {
        __darwin_time_t v37 = (int *)_os_alloc_once();
      }
      int v38 = *v37;
      if ((*v37 & 2) != 0)
      {
        printf("apply_new_filters, Symptom: %x   Qlert %d    Q drop %d\n", v35, *((unsigned __int16 *)v34 - 2), *((unsigned __int16 *)v34 - 1));
        int v38 = *v37;
      }
      if ((v38 & 4) != 0 && os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int v47 = *(v34 - 2);
        int v48 = *((unsigned __int16 *)v34 - 2);
        int v49 = *((unsigned __int16 *)v34 - 1);
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = v47;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v48;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v49;
        _os_log_debug_impl(&dword_21874A000, v17, OS_LOG_TYPE_DEBUG, "apply_new_filters, Symptom: %x   Qlert %d    Q drop %d\n", buf, 0x14u);
      }
      symptom_ctrl = get_symptom_ctrl((void *)a1, *(v34 - 2));
      if (symptom_ctrl)
      {
        uint64_t v40 = (_DWORD *)symptom_ctrl + 11;
        uint64_t v36 = *(void *)(v6 + 320);
LABEL_61:
        int v41 = *(_DWORD *)(a1 + 104);
        *uint64_t v40 = *v34;
        v40[1] = *((unsigned __int16 *)v34 - 2);
        v40[2] = *((unsigned __int16 *)v34 - 1);
        v40[3] = v41;
        if (v36 == -1) {
          int v42 = *(int **)(v6 + 328);
        }
        else {
          int v42 = (int *)_os_alloc_once();
        }
        int v43 = *v42;
        if ((*v42 & 2) != 0)
        {
          printf("update_filter_values, max age %d, alert len %d drop len %d seqno %d\n", *v40, v40[1], v40[2], v41);
          int v43 = *v42;
        }
        if ((v43 & 4) != 0 && os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v44 = *v40;
          int v45 = v40[1];
          int v46 = v40[2];
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&uint8_t buf[4] = v44;
          buf[8] = 0;
          buf[9] = 4;
          *(_DWORD *)&buf[10] = v45;
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&buf[16] = v46;
          *(_WORD *)&buf[20] = 1024;
          *(_DWORD *)&buf[22] = v41;
          _os_log_debug_impl(&dword_21874A000, v17, OS_LOG_TYPE_DEBUG, "update_filter_values, max age %d, alert len %d drop len %d seqno %d\n", buf, 0x1Au);
        }
      }
      v34 += 4;
      --v32;
    }
    while (v32);
    if (*(void *)(v6 + 320) == -1) {
      uint64_t v50 = *(int **)(v6 + 328);
    }
    else {
      uint64_t v50 = (int *)_os_alloc_once();
    }
    int v51 = *v50;
    if ((*v50 & 2) != 0)
    {
      printf("apply_new_filters");
      int v51 = *v50;
    }
    if ((v51 & 4) != 0 && os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      symptoms_incoming_message_cold_1(&v57, v58);
    }
    reevaluate_sr_symptoms((void *)a1);
    uint64_t v52 = a2[1];
    a3 = a3 - v52 - 4;
    a2 = (unsigned __int16 *)((char *)a2 + v52 + 4);
LABEL_81:
    if (a3 <= 3) {
      return;
    }
  }
  if (v18 == 1)
  {
    a2 += 2;
    a3 -= 4;
    goto LABEL_81;
  }
  if (v18 == 11)
  {
    unint64_t v19 = a3 - 16;
    if (a3 >= 0x10 && a2[1] == 12)
    {
      int v20 = *((_DWORD *)a2 + 3);
      if (*(void *)(v6 + 320) == -1) {
        uint64_t v21 = *(int **)(v6 + 328);
      }
      else {
        uint64_t v21 = (int *)_os_alloc_once();
      }
      memset(buf, 0, 60);
      int v22 = *v21;
      if ((*v21 & 2) != 0)
      {
        printf("new_symptoms_read: ack_id %d\n", v20);
        int v22 = *v21;
      }
      if ((v22 & 4) != 0 && os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        symptoms_incoming_message_cold_2(v59, v20, v60);
      }
      int v23 = v20;
      uint64_t v24 = (char *)malloc_type_malloc(0x28A0uLL, 0x23FD76D0uLL);
      uint64_t v25 = (uint8_t *)v24;
      if (v24) {
        uint64_t v26 = (uint8_t *)v24;
      }
      else {
        uint64_t v26 = buf;
      }
      uint64_t v27 = (char *)&buf[56];
      if (v24)
      {
        unint64_t v56 = 10340;
        uint64_t v27 = read_symptoms(a1, v24 + 56, &v56);
      }
      if (v25) {
        int v28 = v25;
      }
      else {
        int v28 = buf;
      }
      *((_DWORD *)v28 + 1) = 3145735;
      if (v25) {
        uint64_t v29 = v25 + 8;
      }
      else {
        uint64_t v29 = &buf[8];
      }
      read_current_status(a1, (uint64_t)v29, v23, 1);
      *(_DWORD *)uint64_t v27 = 0;
      *(_WORD *)uint64_t v26 = 1;
      *((_WORD *)v28 + 1) = (_WORD)v27 - (_WORD)v29 + 8;
      symptom_transport_send(a1, v26, (unsigned __int16)((_WORD)v27 - (_WORD)v29 + 8) + 4);
      ++*(void *)(a1 + 280);
      sr_log_status_send(a1, (uint64_t)v26);
      if (v25) {
        free(v25);
      }
      a2 = (unsigned __int16 *)((char *)a2 + a2[1] + 4);
      a3 = v19;
      int v17 = &_os_log_internal;
      goto LABEL_81;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      symptoms_incoming_message_cold_3(buf, a3, &buf[4]);
    }
  }
}

void send_current(uint64_t a1)
{
  long long v3 = (int *)(a1 + 108);
  int v2 = *(_DWORD *)(a1 + 108);
  if ((v2 + 1) > 1) {
    int v4 = v2 + 1;
  }
  else {
    int v4 = 1;
  }
  *long long v3 = v4;
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    long long v5 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    long long v5 = (int *)_os_alloc_once();
  }
  int v6 = *v5;
  if ((*v5 & 2) != 0)
  {
    printf("send_current: ack_id %d\n", *v3);
    int v6 = *v5;
  }
  if ((v6 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    send_current_cold_1(v3);
  }
  long long v7 = (char *)malloc_type_malloc(0x28A0uLL, 0x8F63F342uLL);
  if (v7)
  {
    int v8 = v7;
    *((_DWORD *)v7 + 1) = 2359299;
    __int16 v9 = (_WORD)v7 + 8;
    fill_sender_id(a1, (uint64_t)(v7 + 8));
    unint64_t v11 = 10344;
    uint64_t v10 = read_symptoms(a1, v8 + 44, &v11);
    *(_DWORD *)uint64_t v10 = 262184;
    *((_DWORD *)v10 + 1) = *(_DWORD *)(a1 + 108);
    *(_WORD *)int v8 = 1;
    *((_WORD *)v8 + 1) = (_WORD)v10 + 4 - v9 + 8;
    symptom_transport_send(a1, v8, (unsigned __int16)((_WORD)v10 + 4 - v9 + 8) + 4);
    *(unsigned char *)(a1 + 112) = 1;
    ++*(void *)(a1 + 280);
    free(v8);
  }
}

void symptoms_transport_dropped(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    long long v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    long long v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("symptoms_transport_dropped %s\n", *(const char **)(a1 + 24));
    int v4 = *v3;
  }
  if ((v4 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    symptoms_transport_dropped_cold_4();
  }
  gettimeofday((timeval *)(a1 + 176), 0);
  ++*(_DWORD *)(a1 + 104);
  if (*(void *)(v2 + 320) == -1) {
    long long v5 = *(int **)(v2 + 328);
  }
  else {
    long long v5 = (int *)_os_alloc_once();
  }
  int v6 = *v5;
  if ((*v5 & 2) != 0)
  {
    printf("reset_sr_filters for %s\n", *(const char **)(a1 + 24));
    int v6 = *v5;
  }
  if ((v6 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    symptoms_transport_dropped_cold_3();
  }
  reevaluate_sr_symptoms((void *)a1);
  if (*(void *)(a1 + 80))
  {
    if (*(void *)(v2 + 320) == -1) {
      long long v7 = *(int **)(v2 + 328);
    }
    else {
      long long v7 = (int *)_os_alloc_once();
    }
    int v8 = *v7;
    if ((*v7 & 2) != 0)
    {
      printf("symptoms_transport_dropped %s, immediate reconnect\n", *(const char **)(a1 + 24));
      int v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      symptoms_transport_dropped_cold_2();
    }
    if (*(unsigned char *)(a1 + 216))
    {
      if (*(void *)(v2 + 320) == -1) {
        __int16 v9 = *(int **)(v2 + 328);
      }
      else {
        __int16 v9 = (int *)_os_alloc_once();
      }
      int v10 = *v9;
      if ((*v9 & 2) != 0)
      {
        printf("symptoms_transport_dropped %s, immediate reconnect, but connect queued\n", *(const char **)(a1 + 24));
        int v10 = *v9;
      }
      if ((v10 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        symptoms_transport_dropped_cold_1();
      }
    }
    else
    {
      ensure_symptom_framework_connect(a1);
    }
  }
}

void reevaluate_sr_symptoms(void *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1[5];
  if (v1)
  {
    uint64_t v3 = MEMORY[0x263EF8430];
    int v4 = &_os_log_internal;
    do
    {
      if (*(void *)(v3 + 320) == -1) {
        long long v5 = *(int **)(v3 + 328);
      }
      else {
        long long v5 = (int *)_os_alloc_once();
      }
      int v6 = *v5;
      if ((*v5 & 2) != 0)
      {
        printf("reevaluate_sr_symptoms: evaluate symptom control %p, id %x\n", (const void *)v1, *(_DWORD *)(v1 + 8));
        int v6 = *v5;
      }
      if ((v6 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        int v17 = *(_DWORD *)(v1 + 8);
        *(_DWORD *)buf = 134218240;
        uint64_t v27 = (void *)v1;
        __int16 v28 = 1024;
        LODWORD(v29) = v17;
        _os_log_debug_impl(&dword_21874A000, v4, OS_LOG_TYPE_DEBUG, "reevaluate_sr_symptoms: evaluate symptom control %p, id %x\n", buf, 0x12u);
      }
      int v22 = 0;
      int v23 = &v22;
      if (*(void *)(v3 + 320) == -1) {
        long long v7 = *(int **)(v3 + 328);
      }
      else {
        long long v7 = (int *)_os_alloc_once();
      }
      int v8 = *v7;
      if ((*v7 & 2) != 0)
      {
        printf("reevaluate_sc_symptoms: sr %p sc %p\n", a1, (const void *)v1);
        int v8 = *v7;
      }
      if ((v8 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v27 = a1;
        __int16 v28 = 2048;
        uint64_t v29 = v1;
        _os_log_debug_impl(&dword_21874A000, v4, OS_LOG_TYPE_DEBUG, "reevaluate_sc_symptoms: sr %p sc %p\n", buf, 0x16u);
      }
      if (*(unsigned char *)(v1 + 40))
      {
        sym_ctrl_dequeue((uint64_t)a1, v1);
        if (*(void *)(v3 + 320) == -1) {
          __int16 v9 = *(int **)(v3 + 328);
        }
        else {
          __int16 v9 = (int *)_os_alloc_once();
        }
        int v10 = *v9;
        if ((*v9 & 2) != 0)
        {
          puts("reevaluate_sc_symptoms: sc was active, dequeued");
          int v10 = *v9;
        }
        if ((v10 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
          reevaluate_sr_symptoms_cold_3(&v20, v21);
        }
        dump_symptom_state((uint64_t)a1);
      }
      unint64_t v11 = *(const void ***)(v1 + 72);
      if (v11)
      {
        *int v23 = v11;
        int v23 = *(const void ****)(v1 + 80);
        *(void *)(v1 + 72) = 0;
        *(void *)(v1 + 80) = v1 + 72;
      }
      *(void *)(v1 + 64) = 0;
      while (1)
      {
        uint64_t v12 = v22;
        if (!v22) {
          break;
        }
        int v22 = (const void **)*v22;
        if (!v22) {
          int v23 = &v22;
        }
        update_globals_for_symptom_removal((uint64_t)a1, v12);
        if (*(void *)(v3 + 320) == -1) {
          uint64_t v13 = *(int **)(v3 + 328);
        }
        else {
          uint64_t v13 = (int *)_os_alloc_once();
        }
        int v14 = *v13;
        if ((*v13 & 2) != 0)
        {
          printf("reevaluate_sc_symptoms: evaluate symptom %p\n", v12);
          int v14 = *v13;
        }
        if ((v14 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
          reevaluate_sr_symptoms_cold_2(v24, (uint64_t)v12, &v25);
        }
        handle_symptom(a1, v1, v12);
        if (*(void *)(v3 + 320) == -1) {
          uint64_t v15 = *(int **)(v3 + 328);
        }
        else {
          uint64_t v15 = (int *)_os_alloc_once();
        }
        int v16 = *v15;
        if ((*v15 & 2) != 0)
        {
          puts("reevaluate_sc_symptoms: after evaluate symptom");
          int v16 = *v15;
        }
        if ((v16 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
          reevaluate_sr_symptoms_cold_1(&v18, v19);
        }
      }
      uint64_t v1 = *(void *)(v1 + 16);
    }
    while (v1);
  }
}

void ensure_symptom_framework_connect(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("ensure_symptom_framework_connect %s, set sr_connect_queued\n", *(const char **)(a1 + 24));
    int v4 = *v3;
  }
  if ((v4 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    ensure_symptom_framework_connect_cold_3();
  }
  v21.__darwin_time_t tv_sec = 0;
  *(void *)&v21.tv_usec = 0;
  *(unsigned char *)(a1 + 216) = 1;
  gettimeofday(&v21, 0);
  __darwin_time_t tv_sec = v21.tv_sec;
  uint64_t v6 = *(void *)(a1 + 160);
  BOOL v7 = __OFSUB__(v21.tv_sec, v6);
  uint64_t v8 = v21.tv_sec - v6;
  if (v8 < 0 != v7) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = v8;
  }
  if (*(void *)(v2 + 320) == -1) {
    int v10 = *(int **)(v2 + 328);
  }
  else {
    int v10 = (int *)_os_alloc_once();
  }
  int v11 = *v10;
  if ((*v10 & 2) != 0)
  {
    printf("ensure_connect, update backoff value, uptime_secs %lu\n", v9);
    int v11 = *v10;
  }
  if ((v11 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    ensure_symptom_framework_connect_cold_2();
  }
  if (v9 < 0x259)
  {
    unint64_t v12 = *(void *)(a1 + 192);
    if (v12 < 0x8BB2C97000)
    {
      v12 *= 2;
      uint64_t v13 = 2 * *(void *)(a1 + 200);
      *(void *)(a1 + 192) = v12;
      *(void *)(a1 + 200) = v13;
    }
    if (v12 > 0x8BB2C97000)
    {
      *(void *)(a1 + 192) = 600000000000;
      unint64_t v12 = 600000000000;
    }
    if (*(void *)(a1 + 200) > 0xB2D05E00uLL) {
      *(void *)(a1 + 200) = 3000000000;
    }
  }
  else
  {
    unint64_t v12 = 100000000;
    *(int64x2_t *)(a1 + 192) = vdupq_n_s64(0x5F5E100uLL);
  }
  unint64_t v14 = (unint64_t)rand_r((unsigned int *)(a1 + 208)) % *(void *)(a1 + 200) + v12;
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v15 = *(int **)(v2 + 328);
  }
  else {
    uint64_t v15 = (int *)_os_alloc_once();
  }
  int v16 = *v15;
  if ((*v15 & 2) != 0)
  {
    printf("delay_after_interruption is %lld nanoseconds\n", v14);
    int v16 = *v15;
  }
  if ((v16 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    ensure_symptom_framework_connect_cold_1();
  }
  unint64_t v17 = 1000000000 * (tv_sec - *(void *)(a1 + 176));
  if (v14 <= v17)
  {
    connect_symptom_framework(a1);
  }
  else
  {
    dispatch_time_t v18 = dispatch_time(0, v14 - v17);
    unint64_t v19 = *(NSObject **)(a1 + 128);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ensure_symptom_framework_connect_block_invoke;
    block[3] = &__block_descriptor_tmp_53;
    block[4] = a1;
    dispatch_after(v18, v19, block);
  }
}

void connect_symptom_framework(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    puts("connect_symptom_framework called");
    int v4 = *v3;
  }
  if ((v4 & 4) != 0)
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v5) {
      connect_symptom_framework_cold_5(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (*(void *)(a1 + 136))
  {
    uint64_t v13 = *(void *)(v2 + 320);
LABEL_11:
    ++*(void *)(a1 + 344);
    *(_WORD *)(a1 + 113) = 1;
    if (v13 == -1) {
      uint64_t v15 = *(int **)(v2 + 328);
    }
    else {
      uint64_t v15 = (int *)_os_alloc_once();
    }
    int v16 = *v15;
    if ((*v15 & 2) != 0)
    {
      printf("connect_symptom_framework: %s transport connect OK, unset sr_connect_queued\n", *(const char **)(a1 + 24));
      int v16 = *v15;
    }
    if ((v16 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      connect_symptom_framework_cold_4();
    }
    *(unsigned char *)(a1 + 216) = 0;
    uint64_t v17 = *(void *)(v2 + 320);
    if (*(void *)(a1 + 80))
    {
      if (v17 == -1) {
        dispatch_time_t v18 = *(int **)(v2 + 328);
      }
      else {
        dispatch_time_t v18 = (int *)_os_alloc_once();
      }
      int v19 = *v18;
      if ((*v18 & 2) != 0)
      {
        puts("connect_symptom_framework: ensure_alert");
        int v19 = *v18;
      }
      if ((v19 & 4) != 0)
      {
        BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        if (v20) {
          connect_symptom_framework_cold_3(v20, v21, v22, v23, v24, v25, v26, v27);
        }
      }
      ensure_alert(a1);
      uint64_t v17 = *(void *)(v2 + 320);
    }
    if (v17 == -1) {
      __int16 v28 = *(int **)(v2 + 328);
    }
    else {
      __int16 v28 = (int *)_os_alloc_once();
    }
    int v29 = *v28;
    if ((*v28 & 2) != 0)
    {
      puts("connect_symptom_framework: exit");
      int v29 = *v28;
    }
    if ((v29 & 4) != 0)
    {
      BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v30) {
        connect_symptom_framework_cold_2(v30, v31, v32, v33, v34, v35, v36, v37);
      }
    }
    return;
  }
  int v14 = symptom_transport_connect(a1);
  uint64_t v13 = *(void *)(v2 + 320);
  if ((v14 & 0x80000000) == 0) {
    goto LABEL_11;
  }
  if (v13 == -1) {
    int v38 = *(int **)(v2 + 328);
  }
  else {
    int v38 = (int *)_os_alloc_once();
  }
  int v39 = *v38;
  if ((*v38 & 2) != 0)
  {
    printf("connect_symptom_framework: %s transport connect failed, unset sr_connect_queued\n", *(const char **)(a1 + 24));
    int v39 = *v38;
  }
  if ((v39 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    connect_symptom_framework_cold_1();
  }
  *(unsigned char *)(a1 + 216) = 0;
  ensure_symptom_framework_connect(a1);
}

void __obtain_symptom_framework_block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 48);
  uint64_t v3 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  int v4 = malloc_type_calloc(1uLL, 0x168uLL, 0x10B0040F933FA69uLL);
  uint64_t v5 = MEMORY[0x263EF8430];
  if (!v4) {
    goto LABEL_25;
  }
  uint64_t v6 = malloc_type_malloc(v2 + 1, 0xC50D3191uLL);
  _OWORD v4[3] = v6;
  if (!v6) {
    goto LABEL_24;
  }
  label.__darwin_time_t tv_sec = 0;
  if (!v3)
  {
    __break(1u);
LABEL_38:
    uint64_t v10 = _os_alloc_once();
    if (!v10) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if ((unint64_t)(v2 + 1) < 2)
  {
    uint64_t v7 = v2 + 1;
    if (v2 != -1)
    {
LABEL_11:
      if (v7) {
        *uint64_t v6 = 0;
      }
    }
  }
  else
  {
    uint64_t v7 = 1;
    uint64_t v8 = v2 + 1;
    while (1)
    {
      int v9 = *v3;
      *uint64_t v6 = v9;
      if (!v9) {
        break;
      }
      ++v6;
      ++v3;
      if ((unint64_t)--v8 <= 1)
      {
        if (v2 != -1) {
          goto LABEL_11;
        }
        break;
      }
    }
  }
  v4[4] = v2;
  asprintf((char **)&label, "%s symptoms", (const char *)v4[3]);
  if (label.tv_sec)
  {
    v4[16] = dispatch_queue_create((const char *)label.tv_sec, 0);
    if (label.tv_sec) {
      free((void *)label.tv_sec);
    }
  }
  if (!v4[16])
  {
    uint64_t v12 = (void *)v4[3];
    if (v12) {
      free(v12);
    }
LABEL_24:
    free(v4);
    int v4 = 0;
    goto LABEL_25;
  }
  label.__darwin_time_t tv_sec = 0;
  *(void *)&label.tv_usec = 0;
  v4[5] = 0;
  *((_DWORD *)v4 + 3) = v1;
  *((_DWORD *)v4 + 4) = 1;
  *((_DWORD *)v4 + 2) = 195165933;
  v4[6] = v4 + 5;
  v4[7] = 0;
  v4[8] = 0;
  v4[9] = v4 + 8;
  v4[10] = 0;
  *(_WORD *)((char *)v4 + 113) = 0;
  *((_DWORD *)v4 + 53) = 0;
  *((int64x2_t *)v4 + 12) = vdupq_n_s64(0x5F5E100uLL);
  *(_OWORD *)(v4 + 11) = xmmword_218753AB0;
  *((_DWORD *)v4 + 26) = 1;
  gettimeofday(&label, 0);
  *((_DWORD *)v4 + 52) = label.tv_usec ^ LODWORD(label.tv_sec);
  if (*(void *)(v5 + 320) != -1) {
    goto LABEL_38;
  }
  uint64_t v10 = *(void *)(v5 + 328);
  if (!v10) {
    goto LABEL_25;
  }
LABEL_19:
  uint64_t v11 = *(void *)(v10 + 8);
  *int v4 = v11;
  if (!v11) {
    *(void *)(v10 + 16) = v4;
  }
  *(void *)(v10 + 8) = v4;
LABEL_25:
  if (*(void *)(v5 + 320) == -1) {
    uint64_t v13 = *(int **)(v5 + 328);
  }
  else {
    uint64_t v13 = (int *)_os_alloc_once();
  }
  int v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    if (v4) {
      uint64_t v15 = (const char *)v4[3];
    }
    else {
      uint64_t v15 = "<nil>";
    }
    printf("create_symptom_framework returns %p, name %s\n", v4, v15);
    int v14 = *v13;
  }
  if ((v14 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __obtain_symptom_framework_block_invoke_cold_1();
  }
}

void update_globals_for_symptom_removal(uint64_t a1, const void **a2)
{
  --*(void *)(a1 + 120);
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("update globals to remove symptom at %p\n", a2);
    int v4 = *v3;
  }
  if ((v4 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    update_globals_for_symptom_removal_cold_1();
  }
  dump_symptom(a2);
}

uint64_t fill_sender_id(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 12);
  *(unsigned char *)a2 = *(_DWORD *)(result + 16);
  *(unsigned char *)(a2 + 1) = v2;
  *(_WORD *)(a2 + 2) = 0;
  uint64_t v3 = *(unsigned __int8 **)(result + 24);
  if (v3)
  {
    int v4 = (unsigned char *)(a2 + 4);
    uint64_t v5 = 32;
    while (1)
    {
      int v6 = *v3;
      *int v4 = v6;
      if (!v6) {
        break;
      }
      ++v4;
      ++v3;
      if ((unint64_t)--v5 <= 1)
      {
        *int v4 = 0;
        return result;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *read_symptom(uint64_t a1, _DWORD *a2, unint64_t *a3)
{
  int v4 = (char *)a2;
  int v6 = *(uint64_t ***)(a1 + 104);
  if (v6)
  {
    uint64_t v7 = 0;
    do
    {
      v7 += *((unsigned __int16 *)v6 + 7) + 4;
      int v6 = (uint64_t **)*v6;
    }
    while (v6);
    unint64_t v8 = v7 + 92;
  }
  else
  {
    unint64_t v8 = 92;
  }
  if (v8 <= *a3)
  {
    *a2 = 5767170;
    long long v9 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a2 + 5) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(a2 + 1) = v9;
    long long v10 = *(_OWORD *)(a1 + 48);
    long long v11 = *(_OWORD *)(a1 + 64);
    long long v12 = *(_OWORD *)(a1 + 80);
    *(void *)(a2 + 21) = *(void *)(a1 + 96);
    *(_OWORD *)(a2 + 17) = v12;
    *(_OWORD *)(a2 + 13) = v11;
    *(_OWORD *)(a2 + 9) = v10;
    sr_log_symptom_action(a1, 0x8000);
    v4 += 92;
    *a3 -= 92;
    for (uint64_t i = *(uint64_t ***)(a1 + 104); i; uint64_t i = (uint64_t **)*i)
    {
      size_t v14 = *((unsigned __int16 *)i + 7) + 4;
      memcpy(v4, (char *)i + 12, v14);
      v4 += v14;
      *a3 -= v14;
    }
  }
  return v4;
}

char *read_symptoms(uint64_t a1, char *a2, unint64_t *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v6 = MEMORY[0x263EF8430];
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v7 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("read_symptoms for sr %p %s\n", (const void *)a1, *(const char **)(a1 + 24));
    int v8 = *v7;
  }
  if ((v8 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    read_symptoms_cold_4();
  }
  long long v9 = *(void **)(a1 + 64);
  if (v9)
  {
    long long v10 = &_os_log_internal;
    do
    {
      sym_ctrl_dequeue(a1, (uint64_t)v9);
      if (*(void *)(v6 + 320) == -1) {
        long long v11 = *(int **)(v6 + 328);
      }
      else {
        long long v11 = (int *)_os_alloc_once();
      }
      int v12 = *v11;
      if ((*v11 & 2) != 0)
      {
        printf("read_symptoms for sc %p, q len %zu\n", v9, v9[8]);
        int v12 = *v11;
      }
      if ((v12 & 4) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = v9[8];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v27;
        _os_log_debug_impl(&dword_21874A000, v10, OS_LOG_TYPE_DEBUG, "read_symptoms for sc %p, q len %zu\n", buf, 0x16u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      if (*(void *)(v6 + 320) == -1) {
        uint64_t v13 = *(int **)(v6 + 328);
      }
      else {
        uint64_t v13 = (int *)_os_alloc_once();
      }
      int v14 = *v13;
      if ((*v13 & 2) != 0)
      {
        puts("read_symptoms_from_q: entry");
        int v14 = *v13;
      }
      if ((v14 & 4) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        read_symptoms_cold_3(&v38, v39);
      }
      int v16 = (const void **)(v9 + 9);
      uint64_t v15 = (const void **)v9[9];
      if (v15)
      {
        uint64_t v17 = a2;
        while (1)
        {
          dispatch_time_t v18 = *v15;
          *int v16 = *v15;
          if (!v18) {
            v9[10] = v16;
          }
          symptom = read_symptom((uint64_t)v15, v17, a3);
          uint64_t v20 = *(void *)(v6 + 320);
          if (symptom == v17) {
            break;
          }
          a2 = symptom;
          if (v20 == -1) {
            uint64_t v21 = *(int **)(v6 + 328);
          }
          else {
            uint64_t v21 = (int *)_os_alloc_once();
          }
          int v22 = *v21;
          if ((*v21 & 2) != 0)
          {
            puts("read_symptoms_from_q: added next symptom");
            int v22 = *v21;
          }
          if ((v22 & 4) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            read_symptoms_cold_2(&v34, v35);
          }
          --v9[8];
          ++*(void *)(a1 + 296);
          update_globals_for_symptom_removal(a1, v15);
          symptom_free(v15, "transport OK");
          uint64_t v15 = (const void **)v9[9];
          uint64_t v17 = a2;
          if (!v15) {
            goto LABEL_47;
          }
        }
        if (v20 == -1) {
          uint64_t v23 = *(int **)(v6 + 328);
        }
        else {
          uint64_t v23 = (int *)_os_alloc_once();
        }
        int v24 = *v23;
        if ((*v23 & 2) != 0)
        {
          printf("read_symptoms_from_q: no next symptom available");
          int v24 = *v23;
        }
        if ((v24 & 4) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          read_symptoms_cold_1(&v36, v37);
        }
        const char *v15 = 0;
        **(void **)&buf[8] = v15;
        *(void *)&buf[8] = v15;
        *a3 = 0;
        a2 = v17;
      }
LABEL_47:
      uint64_t v25 = *(const void **)buf;
      if (!*(void *)buf) {
        goto LABEL_53;
      }
      if (*v16)
      {
        **(void **)&buf[8] = *v16;
        *(void *)&buf[8] = v9[10];
        v9[9] = 0;
        v9[10] = v16;
        uint64_t v25 = *(const void **)buf;
        if (!*(void *)buf) {
          goto LABEL_53;
        }
      }
      else
      {
        int v16 = (const void **)v9[10];
      }
      *int v16 = v25;
      v9[10] = *(void *)&buf[8];
LABEL_53:
      if (v9[8])
      {
        v9[3] = 0;
        uint64_t v26 = v33;
        v9[4] = v33;
        *uint64_t v26 = (uint64_t)v9;
        uint64_t v33 = v9 + 3;
      }
      long long v9 = *(void **)(a1 + 64);
    }
    while (v9);
  }
  while (1)
  {
    uint64_t v30 = v32;
    if (!v32) {
      break;
    }
    uint64_t v28 = *(void *)(v32 + 24);
    int v29 = *(void **)(v32 + 32);
    if (v28)
    {
      *(void *)(v28 + 32) = v29;
      int v29 = *(void **)(v30 + 32);
    }
    else
    {
      uint64_t v33 = *(uint64_t **)(v32 + 32);
    }
    *int v29 = v28;
    ensure_sym_ctrl_is_queued(a1, v30);
  }
  return a2;
}

void sym_ctrl_dequeue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void **)(a2 + 32);
  if (v4)
  {
    *(void *)(v4 + 32) = v5;
    uint64_t v5 = *(void **)(a2 + 32);
  }
  else
  {
    *(void *)(a1 + 72) = v5;
  }
  void *v5 = v4;
  *(unsigned char *)(a2 + 40) = 0;
  --*(void *)(a1 + 80);
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    uint64_t v6 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    uint64_t v6 = (int *)_os_alloc_once();
  }
  int v7 = *v6;
  if ((*v6 & 2) != 0)
  {
    printf("After sym_ctrl_dequeue  %p\n", (const void *)a2);
    int v7 = *v6;
  }
  if ((v7 & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    sym_ctrl_dequeue_cold_1();
  }
  dump_symptom_state(a1);
}

void __ensure_symptom_framework_connect_block_invoke(uint64_t a1)
{
  if (*(void *)(MEMORY[0x263EF8430] + 320) == -1) {
    int v2 = *(int **)(MEMORY[0x263EF8430] + 328);
  }
  else {
    int v2 = (int *)_os_alloc_once();
  }
  int v3 = *v2;
  if ((*v2 & 2) != 0)
  {
    puts("ensure_symptom_framework_connect: connect after delay");
    int v3 = *v2;
  }
  if ((v3 & 4) != 0)
  {
    BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v4) {
      __ensure_symptom_framework_connect_block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  connect_symptom_framework(*(void *)(a1 + 32));
}

dispatch_queue_t __framework_creation_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("symptom_init_queue", 0);
  framework_creation_queue_serialization_q = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_3_0(unsigned char *result, unsigned char *a2)
{
  _DWORD *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_5_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sr_log_symptom_action_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "%s", v1, v2, v3, v4, v5);
}

void sr_log_symptom_action_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, " SYMPTOM-LOG-STRING: %s\n", v1, v2, v3, v4, v5);
}

void dump_basic_symptom_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sb_ident           %d\n", v1, v2, v3, v4, v5);
}

void dump_basic_symptom_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sb_timestamp_nsecs %d\n", v1, v2, v3, v4, v5);
}

void dump_basic_symptom_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sb_timestamp_secs  %d\n", v1, v2, v3, v4, v5);
}

void dump_basic_symptom_cold_4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sb_flags           %x\n", v1, v2, v3, v4, v5);
}

void dump_basic_symptom_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sb_version         %d\n", v1, v2, v3, v4, v5);
}

void dump_symptom_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, "   s_magic      %x\n", v1, v2, v3, v4, v5);
}

void dump_symptom_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "   s_link next  %p\n", v1, v2, v3, v4, v5);
}

void dump_symptom_cold_3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, " Symptom at %p\n", v1, v2, v3, v4, v5);
}

void dump_status_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void dump_status_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, "srs_num_queued          %d\n", v1, v2, v3, v4, v5);
}

void dump_status_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, "srs_num_alerts          %d\n", v1, v2, v3, v4, v5);
}

void dump_status_cold_4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, "srs_ack_id              %0x\n", v1, v2, v3, v4, v5);
}

void dump_status_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, "srs_flags               %0x\n", v1, v2, v3, v4, v5);
}

void dump_status_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, "srs_version             %d\n", v1, v2, v3, v4, v5);
}

void dump_status_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void dump_creation_filter_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, "    cf_filter_seqno     %x\n", v1, v2, v3, v4, v5);
}

void dump_creation_filter_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, "    cf_queue_len_alert  %x\n", v1, v2, v3, v4, v5);
}

void dump_creation_filter_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, "    cf_queue_len_max    %x\n", v1, v2, v3, v4, v5);
}

void dump_ident_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21874A000, &_os_log_internal, v0, " sc_symptom_q first, last %p %p\n", v1, v2, v3, v4, v5);
}

void dump_ident_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, " sc_symptom_q len %lu\n", v1, v2, v3, v4, v5);
}

void dump_ident_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void dump_ident_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sc_active_link_in_use  %d\n", v1, v2, v3, v4, v5);
}

void dump_ident_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, " sc_active_link         %p\n", v1, v2, v3, v4, v5);
}

void dump_ident_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, " sc_link                %p\n", v1, v2, v3, v4, v5);
}

void dump_ident_cold_7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sc_id                  %x\n", v1, v2, v3, v4, v5);
}

void dump_ident_cold_8()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sc_flags               %x\n", v1, v2, v3, v4, v5);
}

void dump_ident_cold_9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sc_magic               %x\n", v1, v2, v3, v4, v5);
}

void dump_ident_cold_10()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "symptom_ctrl at %p\n", v1, v2, v3, v4, v5);
}

void dump_active_idents_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void dump_idents_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void dump_system_reporter_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, " sr_q_counts         %lu\n", v1, v2, v3, v4, v5);
}

void dump_system_reporter_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sr_alert_sent       %d\n", v1, v2, v3, v4, v5);
}

void dump_system_reporter_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21874A000, &_os_log_internal, v0, " sr_filter_seqno  %u\n", v1, v2, v3, v4, v5);
}

void dump_system_reporter_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void dump_system_reporter_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, " sr_num_active  %lu\n", v1, v2, v3, v4, v5);
}

void dump_system_reporter_cold_6()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21874A000, &_os_log_internal, v0, " sr_ctrl_active_head first, last  %p %p\n", v1, v2, v3, v4, v5);
}

void dump_system_reporter_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, " sr_ctrl_num    %lu\n", v1, v2, v3, v4, v5);
}

void dump_system_reporter_cold_8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21874A000, &_os_log_internal, v0, " sr_ctrl_head        first, last  %p %p\n", v1, v2, v3, v4, v5);
}

void dump_system_reporter_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void symptom_create_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "symptom_create copied name %s\n", (uint8_t *)&v1, 0xCu);
}

void symptom_transport_send_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void symptom_transport_send_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_21874A000, &_os_log_internal, v0, "symptom_transport_send:  ptr %p size %lu \n", v1, v2, v3, v4, v5);
}

void symptom_transport_connect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void symptom_transport_connect_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __symptom_transport_connect_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __symptom_transport_connect_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __symptom_transport_connect_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __symptom_transport_connect_block_invoke_cold_4(void *a1)
{
  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v1, "symptom_transport: unhandled connection error: %s", v2, v3, v4, v5, v6);
}

void __symptom_transport_connect_block_invoke_cold_5(void *a1)
{
  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v1, "connection error: %s\n", v2, v3, v4, v5, v6);
}

void __symptom_transport_connect_block_invoke_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __symptom_transport_connect_block_invoke_cold_7()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_21874A000, &_os_log_internal, v0, "handle_incoming_xpc_dictionary:  desc %p size %lu\n", v1, v2, v3, v4, v5);
}

void __symptom_transport_connect_block_invoke_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __symptom_transport_connect_block_invoke_cold_9()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "unexpected message from peer %p", v1, v2, v3, v4, v5);
}

void __symptom_transport_connect_block_invoke_cold_10(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 224);
  uint64_t v4 = *(void *)(v2 + 240);
  int v5 = 134218752;
  uint64_t v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  __int16 v9 = 2048;
  uint64_t v10 = v3;
  __int16 v11 = 2048;
  uint64_t v12 = v4;
  _os_log_debug_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "symptom_transport_connect event handler called on %p for %p evcount %lu errcount %lu\n", (uint8_t *)&v5, 0x2Au);
}

void symptom_free_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_21874A000, &_os_log_internal, v0, "Free symptom %p, %s", v1, v2, v3, v4, v5);
}

void symptom_post_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "symptom_post obtained control structure at %p\n", v1, v2, v3, v4, v5);
}

void symptom_post_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "symptom_post entry, symptom pointer %p\n", v1, v2, v3, v4, v5);
}

void handle_symptom_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "push_symptom_to_nhm, symptom %p\n", v1, v2, v3, v4, v5);
}

void handle_symptom_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_symptom_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21874A000, &_os_log_internal, a3, "filter_new_symptom: cf->cf_queue_len_max == 0, DROP", a5, a6, a7, a8, 0);
}

void handle_symptom_cold_4(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "filter_new_symptom: return %x\n", (uint8_t *)v1, 8u);
}

void handle_symptom_cold_5()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_0(&dword_21874A000, &_os_log_internal, v0, "filter_new_symptom: q->sq_len %zdd >= cf->cf_queue_len_alert %d ALERT\n", v1, v2, v3, v4, v5);
}

void handle_symptom_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_symptom_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_symptom_cold_8(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_21874A000, &_os_log_internal, v2, "filter_new_symptom: DROP_HEAD (Age limit)\n", v3);
}

void handle_symptom_cold_9()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9_0();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_debug_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "filter_new_symptom: entry, q->sq_len %lu cf->cf_queue_len_max %d cf->cf_queue_len_alert %d\n", v2, 0x18u);
}

void handle_symptom_cold_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_symptom_cold_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_symptom_cold_12()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 1024;
  int v4 = v0;
  __int16 v5 = 1024;
  int v6 = v1;
  _os_log_debug_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "handle_symptom entry, symptom pointer %p   sc filter seqno %d  sr seqno %d\n", v2, 0x18u);
}

void symptoms_incoming_message_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_21874A000, &_os_log_internal, v2, "apply_new_filters", v3);
}

void symptoms_incoming_message_cold_2(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_debug_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "new_symptoms_read: ack_id %d\n", buf, 8u);
}

void symptoms_incoming_message_cold_3(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 134217984;
  *a3 = a2;
  _os_log_error_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SymptomReporter incoming_message, SYMTLV_READ sz too small %zd", buf, 0xCu);
}

void symptoms_incoming_message_cold_4(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 134217984;
  *a3 = a2;
  _os_log_error_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SymptomReporter incoming_message, SYMTLV_TERMINAL_ACK sz too small %zd", buf, 0xCu);
}

void symptoms_incoming_message_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void send_current_cold_1(int *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_debug_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "send_current: ack_id %d\n", (uint8_t *)v2, 8u);
}

void symptoms_transport_dropped_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "symptoms_transport_dropped %s, immediate reconnect, but connect queued\n", v1, v2, v3, v4, v5);
}

void symptoms_transport_dropped_cold_2()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "symptoms_transport_dropped %s, immediate reconnect\n", v1, v2, v3, v4, v5);
}

void symptoms_transport_dropped_cold_3()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "reset_sr_filters for %s\n", v1, v2, v3, v4, v5);
}

void symptoms_transport_dropped_cold_4()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "symptoms_transport_dropped %s\n", v1, v2, v3, v4, v5);
}

void reevaluate_sr_symptoms_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_21874A000, &_os_log_internal, v2, "reevaluate_sc_symptoms: after evaluate symptom\n", v3);
}

void reevaluate_sr_symptoms_cold_2(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 134217984;
  *a3 = a2;
  _os_log_debug_impl(&dword_21874A000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "reevaluate_sc_symptoms: evaluate symptom %p\n", buf, 0xCu);
}

void reevaluate_sr_symptoms_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_21874A000, &_os_log_internal, v2, "reevaluate_sc_symptoms: sc was active, dequeued\n", v3);
}

void ensure_symptom_framework_connect_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "delay_after_interruption is %lld nanoseconds\n", v1, v2, v3, v4, v5);
}

void ensure_symptom_framework_connect_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "ensure_connect, update backoff value, uptime_secs %lu\n", v1, v2, v3, v4, v5);
}

void ensure_symptom_framework_connect_cold_3()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "ensure_symptom_framework_connect %s, set sr_connect_queued\n", v1, v2, v3, v4, v5);
}

void connect_symptom_framework_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "connect_symptom_framework: %s transport connect failed, unset sr_connect_queued\n", v1, v2, v3, v4, v5);
}

void connect_symptom_framework_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void connect_symptom_framework_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void connect_symptom_framework_cold_4()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "connect_symptom_framework: %s transport connect OK, unset sr_connect_queued\n", v1, v2, v3, v4, v5);
}

void connect_symptom_framework_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void find_symptom_reporter_by_name_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21874A000, &_os_log_internal, a3, "find_symptom_reporter_by_name  returns NULL\n", a5, a6, a7, a8, 0);
}

void find_symptom_reporter_by_name_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_21874A000, &_os_log_internal, v0, "find_symptom_reporter_by_name  %s   len %ld\n", v1, v2, v3, v4, v5);
}

void __obtain_symptom_framework_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_21874A000, &_os_log_internal, v0, "create_symptom_framework returns %p, name %s\n", v1, v2, v3, v4, v5);
}

void ensure_sym_ctrl_is_queued_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "After ensure_sym_ctrl_is_queued %p\n", v1, v2, v3, v4, v5);
}

void ensure_sym_ctrl_is_queued_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_21874A000, &_os_log_internal, v0, "ensure_sym_ctrl_is_queued, sc %p, in use %d\n", v1, v2, v3, v4, v5);
}

void update_globals_for_symptom_removal_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "update globals to remove symptom at %p\n", v1, v2, v3, v4, v5);
}

void read_symptoms_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_21874A000, &_os_log_internal, v2, "read_symptoms_from_q: no next symptom available", v3);
}

void read_symptoms_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_21874A000, &_os_log_internal, v2, "read_symptoms_from_q: added next symptom\n", v3);
}

void read_symptoms_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_21874A000, &_os_log_internal, v2, "read_symptoms_from_q: entry\n", v3);
}

void read_symptoms_cold_4()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_21874A000, &_os_log_internal, v0, "read_symptoms for sr %p %s\n", v1, v2, v3, v4, v5);
}

void sym_ctrl_dequeue_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21874A000, &_os_log_internal, v0, "After sym_ctrl_dequeue  %p\n", v1, v2, v3, v4, v5);
}

void __ensure_symptom_framework_connect_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x270ED7F48]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x270ED7F50]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x270ED8048]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int rand_r(unsigned int *a1)
{
  return MEMORY[0x270EDB0E0](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}