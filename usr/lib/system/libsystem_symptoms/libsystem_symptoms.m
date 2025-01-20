void *symptom_framework_init(unsigned int a1, char *__s)
{
  size_t v4;
  uint64_t vars8;

  v4 = strlen(__s);
  if (a1 > 0xFF || v4 > 0x400) {
    return 0;
  }

  return obtain_symptom_framework(a1, __s, v4);
}

dispatch_queue_t __framework_creation_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("symptom_init_queue", 0);
  framework_creation_queue_serialization_q = (uint64_t)result;
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
  v9 = malloc_type_calloc(1uLL, a3 + 27, 0xC0EB7443uLL);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  v10 = v9;
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

uint64_t get_symptom_qual_size(uint64_t a1)
{
  v1 = *(uint64_t ***)(a1 + 104);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  do
  {
    result += *((unsigned __int16 *)v1 + 7) + 4;
    v1 = (uint64_t **)*v1;
  }
  while (v1);
  return result;
}

uint64_t get_symptom_qual_count(uint64_t a1)
{
  v1 = *(uint64_t **)(a1 + 104);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  do
  {
    if ((*((unsigned char *)v1 + 19) & 0x40) == 0) {
      ++result;
    }
    v1 = (uint64_t *)*v1;
  }
  while (v1);
  return result;
}

void __obtain_symptom_framework_block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 48);
  v3 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4 = malloc_type_calloc(1uLL, 0x168uLL, 0x10B0040F933FA69uLL);
  uint64_t v5 = MEMORY[0x1E4F14C38];
  if (!v4) {
    goto LABEL_25;
  }
  v6 = malloc_type_malloc(v2 + 1, 0xC50D3191uLL);
  v4[3] = v6;
  if (!v6) {
    goto LABEL_24;
  }
  label.tv_sec = 0;
  if (!v3)
  {
    __break(1u);
LABEL_40:
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
        unsigned char *v6 = 0;
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
      unsigned char *v6 = v9;
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
    v12 = (void *)v4[3];
    if (v12) {
      free(v12);
    }
LABEL_24:
    free(v4);
    v4 = 0;
    goto LABEL_25;
  }
  label.tv_sec = 0;
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
  *(_OWORD *)(v4 + 11) = xmmword_1D0BA8EC0;
  *((_DWORD *)v4 + 26) = 1;
  gettimeofday(&label, 0);
  *((_DWORD *)v4 + 52) = label.tv_usec ^ LODWORD(label.tv_sec);
  if (*(void *)(v5 + 320) != -1) {
    goto LABEL_40;
  }
  uint64_t v10 = *(void *)(v5 + 328);
  if (!v10) {
    goto LABEL_25;
  }
LABEL_19:
  uint64_t v11 = *(void *)(v10 + 8);
  void *v4 = v11;
  if (!v11) {
    *(void *)(v10 + 16) = v4;
  }
  *(void *)(v10 + 8) = v4;
LABEL_25:
  if (*(void *)(v5 + 320) == -1) {
    v13 = *(int **)(v5 + 328);
  }
  else {
    v13 = (int *)_os_alloc_once();
  }
  int v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    if (v4) {
      v15 = (const char *)v4[3];
    }
    else {
      v15 = "<nil>";
    }
    printf("create_symptom_framework returns %p, name %s\n", v4, v15);
    int v14 = *v13;
  }
  if ((v14 & 4) != 0)
  {
    if (v4) {
      v16 = (const char *)v4[3];
    }
    else {
      v16 = "<nil>";
    }
    _sr_log("create_symptom_framework returns %p, name %s\n", v4, v16);
  }
}

void *obtain_symptom_framework(int a1, char *a2, size_t a3)
{
  uint64_t result = find_symptom_reporter_by_name(a1, a2, a3);
  if (!result)
  {
    if (framework_creation_queue_pred != -1) {
      dispatch_once(&framework_creation_queue_pred, &__block_literal_global_0);
    }
    block[0] = MEMORY[0x1E4F14BE8];
    block[1] = 0x40000000;
    block[2] = __obtain_symptom_framework_block_invoke;
    block[3] = &__block_descriptor_tmp_1;
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
  uint64_t v6 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v7 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("find_symptom_reporter_by_name  %s   len %ld\n", __s2, __n);
    int v8 = *v7;
  }
  if ((v8 & 4) != 0) {
    _sr_log("find_symptom_reporter_by_name  %s   len %ld\n", __s2, __n);
  }
  if (*(void *)(v6 + 320) == -1)
  {
    uint64_t v9 = *(void *)(v6 + 328);
    if (!v9) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v9 = _os_alloc_once();
    if (!v9) {
      goto LABEL_23;
    }
  }
  uint64_t v10 = *(void **)(v9 + 8);
  if (v10)
  {
    while (1)
    {
      if (*(void *)(v6 + 320) == -1) {
        uint64_t v11 = *(int **)(v6 + 328);
      }
      else {
        uint64_t v11 = (int *)_os_alloc_once();
      }
      int v12 = *v11;
      if ((*v11 & 2) != 0)
      {
        printf("find_symptom_reporter_by_name  check sr %p name len %ld\n", v10, v10[4]);
        int v12 = *v11;
      }
      if ((v12 & 4) != 0) {
        _sr_log("find_symptom_reporter_by_name  check sr %p name len %ld\n", v10, v10[4]);
      }
      if (*((_DWORD *)v10 + 3) == a1 && v10[4] == __n && !strncmp((const char *)v10[3], __s2, __n)) {
        return v10;
      }
      uint64_t v10 = (void *)*v10;
      if (!v10)
      {
        if (*(void *)(v6 + 320) == -1) {
          break;
        }
        v13 = (int *)_os_alloc_once();
        goto LABEL_24;
      }
    }
  }
LABEL_23:
  v13 = *(int **)(v6 + 328);
LABEL_24:
  int v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    puts("find_symptom_reporter_by_name  returns NULL");
    int v14 = *v13;
  }
  if ((v14 & 4) != 0) {
    _sr_log("find_symptom_reporter_by_name  returns NULL\n");
  }
  return 0;
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

BOOL _symptoms_is_daemon_fallback_blacklisted(int a1, char *a2)
{
  if (_symptoms_is_daemon_fallback_blacklisted_onceToken != -1) {
    dispatch_once(&_symptoms_is_daemon_fallback_blacklisted_onceToken, &__block_literal_global_23);
  }
  return (_symptoms_is_daemon_fallback_blacklisted_is_fallback_blacklisted & 1) != 0
      || a2 && _symptoms_is_daemon_fallback_blacklisted_is_media_play && !strcasecmp(a2, "com.apple.mobilesafari");
}

const char *___symptoms_is_daemon_fallback_blacklisted_block_invoke()
{
  uint64_t result = getprogname();
  if (result)
  {
    int v1 = result;
    uint64_t v2 = 0;
    while (strcmp(v1, _block_invoke_2_kBlacklistedProcessNameList[v2]))
    {
      if (++v2 == 7) {
        goto LABEL_7;
      }
    }
    _symptoms_is_daemon_fallback_blacklisted_is_fallback_blacklisted = 1;
LABEL_7:
    uint64_t result = (const char *)strcmp(v1, "mediaserverd");
    if (!result || (uint64_t result = (const char *)strcmp(v1, "mediaplaybackd"), !result)) {
      _symptoms_is_daemon_fallback_blacklisted_is_media_play = 1;
    }
  }
  return result;
}

uint64_t symptoms_go_multithreaded(uint64_t result)
{
  *(unsigned char *)(result + 32) = 1;
  return result;
}

uint64_t symptom_send(void *a1)
{
  if (a1)
  {
    sr_log_symptom((uint64_t)a1);
    uint64_t v2 = a1[14];
    if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
      uint64_t v3 = *(void *)(MEMORY[0x1E4F14C38] + 328);
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

unsigned char *sr_log_symptom(uint64_t a1)
{
  return sr_log_symptom_action(a1, 0);
}

void handle_symptom(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v7 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("handle_symptom entry, symptom pointer %p   sc filter seqno %d  sr seqno %d\n", a3, *(_DWORD *)(a2 + 56), *(_DWORD *)(a1 + 104));
    int v8 = *v7;
  }
  if ((v8 & 4) != 0) {
    _sr_log("handle_symptom entry, symptom pointer %p   sc filter seqno %d  sr seqno %d\n", a3, *(_DWORD *)(a2 + 56), *(_DWORD *)(a1 + 104));
  }
  if (*(_DWORD *)(a2 + 56) == *(_DWORD *)(a1 + 104))
  {
    if (*(void *)(v6 + 320) == -1) {
      uint64_t v9 = *(int **)(v6 + 328);
    }
    else {
      uint64_t v9 = (int *)_os_alloc_once();
    }
    uint64_t v10 = (unsigned int *)(a2 + 44);
    int v11 = *v9;
    if ((*v9 & 2) != 0)
    {
      puts("handle_symptom: filter with sc filter");
      int v11 = *v9;
    }
    if ((v11 & 4) != 0) {
      _sr_log("handle_symptom: filter with sc filter\n");
    }
  }
  else
  {
    if (*(void *)(v6 + 320) == -1) {
      int v12 = *(int **)(v6 + 328);
    }
    else {
      int v12 = (int *)_os_alloc_once();
    }
    uint64_t v10 = (unsigned int *)(a1 + 88);
    int v13 = *v12;
    if ((*v12 & 2) != 0)
    {
      puts("handle_symptom: filter with global filter");
      int v13 = *v12;
    }
    if ((v13 & 4) != 0) {
      _sr_log("handle_symptom: filter with global filter\n");
    }
  }
  if (*(void *)(v6 + 320) == -1) {
    int v14 = *(int **)(v6 + 328);
  }
  else {
    int v14 = (int *)_os_alloc_once();
  }
  int v15 = *v14;
  if ((*v14 & 2) != 0)
  {
    printf("filter_new_symptom: entry, q->sq_len %lu cf->cf_queue_len_max %d cf->cf_queue_len_alert %d\n", *(void *)(a2 + 64), v10[2], v10[1]);
    int v15 = *v14;
  }
  if ((v15 & 4) != 0) {
    _sr_log("filter_new_symptom: entry, q->sq_len %lu cf->cf_queue_len_max %d cf->cf_queue_len_alert %d\n", *(void *)(a2 + 64), v10[2], v10[1]);
  }
  unsigned int v16 = v10[2];
  if (!v16)
  {
    if (*(void *)(v6 + 320) == -1) {
      v24 = *(int **)(v6 + 328);
    }
    else {
      v24 = (int *)_os_alloc_once();
    }
    int v25 = *v24;
    if ((*v24 & 2) != 0)
    {
      printf("filter_new_symptom: cf->cf_queue_len_max == 0, DROP");
      int v25 = *v24;
    }
    if ((v25 & 4) != 0) {
      _sr_log("filter_new_symptom: cf->cf_queue_len_max == 0, DROP");
    }
    goto LABEL_58;
  }
  if (*v10)
  {
    v50.__darwin_time_t tv_sec = 0;
    *(void *)&v50.tv_usec = 0;
    gettimeofday(&v50, 0);
    v17 = (uint64_t *)(a2 + 72);
    uint64_t v18 = *(void *)(a2 + 72);
    __darwin_time_t tv_sec = v50.tv_sec;
    __darwin_time_t v20 = *v10;
    if (v18 && v50.tv_sec - *(unsigned int *)(v18 + 24) > v20)
    {
      do
      {
        uint64_t v21 = *(void *)v18;
        uint64_t *v17 = *(void *)v18;
        if (!v21) {
          *(void *)(a2 + 80) = v17;
        }
        --*(void *)(a2 + 64);
        update_globals_for_symptom_removal(a1, (const void **)v18);
        if (*(void *)(v6 + 320) == -1) {
          v22 = *(int **)(v6 + 328);
        }
        else {
          v22 = (int *)_os_alloc_once();
        }
        int v23 = *v22;
        if ((*v22 & 2) != 0)
        {
          puts("filter_new_symptom: DROP_HEAD (Age limit)");
          int v23 = *v22;
        }
        if ((v23 & 4) != 0) {
          _sr_log("filter_new_symptom: DROP_HEAD (Age limit)\n");
        }
        symptom_free((void *)v18, "Too old");
        uint64_t v18 = *v17;
        __darwin_time_t v20 = *v10;
      }
      while (*v17 && tv_sec - *(unsigned int *)(v18 + 24) > v20);
      int v26 = 1025;
    }
    else
    {
      int v26 = 1;
    }
    if (tv_sec - *((unsigned int *)a3 + 6) > v20)
    {
      if (*(void *)(v6 + 320) == -1) {
        v27 = *(int **)(v6 + 328);
      }
      else {
        v27 = (int *)_os_alloc_once();
      }
      int v28 = *v27;
      if ((*v27 & 2) != 0)
      {
        printf("filter_new_symptom: too old DROP");
        int v28 = *v27;
      }
      if ((v28 & 4) != 0) {
        _sr_log("filter_new_symptom: too old DROP");
      }
LABEL_58:
      int v26 = 256;
      goto LABEL_86;
    }
    unsigned int v16 = v10[2];
  }
  else
  {
    int v26 = 1;
  }
  unint64_t v29 = *(void *)(a2 + 64);
  if (v29 >= v16)
  {
    ++*(void *)(a1 + 304);
    v30 = *(const void ***)(a2 + 72);
    v31 = *v30;
    *(void *)(a2 + 72) = *v30;
    if (!v31) {
      *(void *)(a2 + 80) = a2 + 72;
    }
    *(void *)(a2 + 64) = v29 - 1;
    update_globals_for_symptom_removal(a1, v30);
    if (*(void *)(v6 + 320) == -1) {
      v32 = *(int **)(v6 + 328);
    }
    else {
      v32 = (int *)_os_alloc_once();
    }
    int v33 = *v32;
    if ((*v32 & 2) != 0)
    {
      puts("filter_new_symptom: DROP_HEAD");
      int v33 = *v32;
    }
    if ((v33 & 4) != 0) {
      _sr_log("filter_new_symptom: DROP_HEAD\n");
    }
    symptom_free(v30, "Queue length limit");
    int v26 = 1025;
  }
  if (*((unsigned char *)a3 + 17) == 4)
  {
    v26 |= 0x2000u;
  }
  else
  {
    *a3 = 0;
    **(void **)(a2 + 80) = a3;
    *(void *)(a2 + 80) = a3;
    unint64_t v34 = *(void *)(a2 + 64) + 1;
    *(void *)(a2 + 64) = v34;
    ++*(void *)(a1 + 120);
    unint64_t v35 = v10[1];
    if (v34 >= v35)
    {
      if (*(void *)(v6 + 320) == -1) {
        v36 = *(int **)(v6 + 328);
      }
      else {
        v36 = (int *)_os_alloc_once();
      }
      int v37 = *v36;
      if ((*v36 & 2) != 0)
      {
        printf("filter_new_symptom: q->sq_len %zdd >= cf->cf_queue_len_alert %d ALERT\n", v34, v35);
        int v37 = *v36;
      }
      if ((v37 & 4) != 0) {
        _sr_log("filter_new_symptom: q->sq_len %zdd >= cf->cf_queue_len_alert %d ALERT\n", *(void *)(a2 + 64), v10[1]);
      }
      v26 |= 2u;
    }
  }
  if (*(void *)(v6 + 320) == -1) {
    v38 = *(int **)(v6 + 328);
  }
  else {
    v38 = (int *)_os_alloc_once();
  }
  int v39 = *v38;
  if ((*v38 & 2) != 0)
  {
    printf("filter_new_symptom: return %x\n", v26);
    int v39 = *v38;
  }
  if ((v39 & 4) != 0) {
    _sr_log("filter_new_symptom: return %x\n", v26);
  }
LABEL_86:
  if (*(void *)(v6 + 320) == -1) {
    v40 = *(int **)(v6 + 328);
  }
  else {
    v40 = (int *)_os_alloc_once();
  }
  int v41 = *v40;
  if ((*v40 & 2) != 0)
  {
    printf("symptom_post action flags %x from filter %p\n", v26, v10);
    int v41 = *v40;
  }
  if ((v41 & 4) != 0) {
    _sr_log("symptom_post action flags %x from filter %p\n", v26, v10);
  }
  sr_log_symptom_action((uint64_t)a3, v26);
  if ((v26 & 0x2000) != 0)
  {
    if (*(void *)(v6 + 320) == -1) {
      v42 = *(int **)(v6 + 328);
    }
    else {
      v42 = (int *)_os_alloc_once();
    }
    int v43 = *v42;
    if ((*v42 & 2) != 0)
    {
      printf("push_symptom_to_nhm, symptom %p\n", a3);
      int v43 = *v42;
    }
    if ((v43 & 4) != 0) {
      _sr_log("push_symptom_to_nhm, symptom %p\n", a3);
    }
    v44 = malloc_type_malloc(0x28A0uLL, 0xAA6ABA9DuLL);
    if (!v44)
    {
LABEL_109:
      if ((v26 & 0x100) == 0)
      {
        v49 = "Drop (immediate)";
LABEL_112:
        symptom_free(a3, v49);
        return;
      }
LABEL_111:
      ++*(void *)(a1 + 312);
      v49 = "Drop (filter)";
      goto LABEL_112;
    }
    v45 = v44;
    *((_DWORD *)v44 + 1) = 2359299;
    __int16 v46 = (_WORD)v44 + 8;
    fill_sender_id(a1, (uint64_t)(v44 + 4));
    v50.__darwin_time_t tv_sec = 10444;
    symptom = read_symptom((uint64_t)a3, (_DWORD *)v45 + 11, (unint64_t *)&v50);
    *(_DWORD *)symptom = 0;
    _WORD *v45 = 1;
    unsigned __int16 v48 = (_WORD)symptom - v46 + 8;
    v45[1] = v48;
    if (!*(unsigned char *)(a1 + 113))
    {
      connect_symptom_framework(a1);
      if (!*(unsigned char *)(a1 + 113))
      {
LABEL_108:
        free(v45);
        goto LABEL_109;
      }
      unsigned __int16 v48 = v45[1];
    }
    symptom_transport_send(a1, v45, v48 + 4);
    ++*(void *)(a1 + 288);
    goto LABEL_108;
  }
  if ((v26 & 2) != 0)
  {
    ensure_sym_ctrl_is_queued(a1, a2);
    ensure_alert(a1);
  }
  if ((v26 & 0x100) != 0) {
    goto LABEL_111;
  }
}

unsigned char *sr_log_symptom_action(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F14BF8];
  uint64_t v4 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1)
  {
    uint64_t result = *(unsigned char **)(MEMORY[0x1E4F14C38] + 328);
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t result = (unsigned char *)_os_alloc_once();
    if (!result) {
      return result;
    }
  }
  if ((*result & 1) == 0) {
    return result;
  }
  unsigned int v6 = snprintf(__str, 0x5DBuLL, "Symptom Sender Name: %s", *(const char **)(*(void *)(a1 + 112) + 24));
  if (v6 >= 0x5DB) {
    uint64_t v7 = 1499;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = snprintf(&__str[v7], 1499 - v7, "Symptom ID %x    ", *(_DWORD *)(a1 + 32));
  uint64_t v9 = 0;
  if ((unint64_t)(v7 + v8) >= 0x5DB) {
    unint64_t v10 = 1499;
  }
  else {
    unint64_t v10 = v7 + v8;
  }
  do
  {
    if ((*(_DWORD *)(a1 + 20) >> v9))
    {
      v10 += snprintf(&__str[v10], 1499 - v10, "QUAL[%d] %llx ", v9, *(void *)(a1 + 40 + 8 * v9));
      uint64_t v11 = 1499;
      if (v10 > 0x5DB) {
        break;
      }
    }
    ++v9;
    uint64_t v11 = v10;
  }
  while (v9 != 8);
  if (a2)
  {
    uint64_t v12 = 1499;
    int v13 = snprintf(&__str[v11], 1499 - v11, "ACTION:");
    if ((unint64_t)(v11 + v13) < 0x5DB) {
      uint64_t v12 = v11 + v13;
    }
    if (a2)
    {
      int v15 = snprintf(&__str[v12], 1499 - v12, " save");
      if ((unint64_t)(v12 + v15) >= 0x5DB) {
        uint64_t v12 = 1499;
      }
      else {
        v12 += v15;
      }
      if ((a2 & 2) == 0)
      {
LABEL_18:
        if ((a2 & 0x100) == 0) {
          goto LABEL_19;
        }
        goto LABEL_43;
      }
    }
    else if ((a2 & 2) == 0)
    {
      goto LABEL_18;
    }
    unsigned int v16 = &__str[v12];
    size_t v17 = 1499 - v12;
    if ((a2 & 0x1000) != 0) {
      int v18 = snprintf(v16, v17, " alert-send");
    }
    else {
      int v18 = snprintf(v16, v17, " alert-pend");
    }
    if ((unint64_t)(v12 + v18) >= 0x5DB) {
      uint64_t v12 = 1499;
    }
    else {
      v12 += v18;
    }
    if ((a2 & 0x100) == 0)
    {
LABEL_19:
      if ((a2 & 0x400) == 0) {
        goto LABEL_20;
      }
      goto LABEL_47;
    }
LABEL_43:
    int v19 = snprintf(&__str[v12], 1499 - v12, " drop");
    if ((unint64_t)(v12 + v19) >= 0x5DB) {
      uint64_t v12 = 1499;
    }
    else {
      v12 += v19;
    }
    if ((a2 & 0x400) == 0)
    {
LABEL_20:
      if ((a2 & 0x800) == 0) {
        goto LABEL_21;
      }
      goto LABEL_51;
    }
LABEL_47:
    int v20 = snprintf(&__str[v12], 1499 - v12, " (note, dropped older)");
    if ((unint64_t)(v12 + v20) >= 0x5DB) {
      uint64_t v12 = 1499;
    }
    else {
      v12 += v20;
    }
    if ((a2 & 0x800) == 0)
    {
LABEL_21:
      if ((a2 & 0x4000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_55;
    }
LABEL_51:
    int v21 = snprintf(&__str[v12], 1499 - v12, " drop (NOMEM)");
    if ((unint64_t)(v12 + v21) >= 0x5DB) {
      uint64_t v12 = 1499;
    }
    else {
      v12 += v21;
    }
    if ((a2 & 0x4000) == 0)
    {
LABEL_22:
      if ((a2 & 0x8000) == 0)
      {
LABEL_26:
        snprintf(&__str[v12], 1499 - v12, " ALERTS posted %d", *(unsigned __int8 *)(*(void *)(a1 + 112) + 114));
        goto LABEL_27;
      }
LABEL_23:
      int v14 = snprintf(&__str[v12], 1499 - v12, " sent");
      if ((unint64_t)(v12 + v14) >= 0x5DB) {
        uint64_t v12 = 1499;
      }
      else {
        v12 += v14;
      }
      goto LABEL_26;
    }
LABEL_55:
    int v22 = snprintf(&__str[v12], 1499 - v12, " reinit");
    if ((unint64_t)(v12 + v22) >= 0x5DB) {
      uint64_t v12 = 1499;
    }
    else {
      v12 += v22;
    }
    if ((a2 & 0x8000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
LABEL_27:
  if (*(void *)(v4 + 320) == -1) {
    uint64_t result = *(unsigned char **)(v4 + 328);
  }
  else {
    uint64_t result = (unsigned char *)_os_alloc_once();
  }
  if ((*result & 2) != 0) {
    return (unsigned char *)printf(" SYMPTOM-LOG-STRING: %s\n", __str);
  }
  return result;
}

uint64_t dump_symptom_state(uint64_t a1)
{
  dump_system_reporter(a1);
  dump_idents(a1);

  return dump_active_idents(a1);
}

_DWORD *dump_system_reporter(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(_DWORD **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v3 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v3 & 0xA) != 0 || (puts("System global... "), *(void *)(v2 + 320) == -1)) {
    uint64_t v4 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v4 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v4 & 0xA) != 0
    || (printf(" sr_ctrl_head        first, last  %p %p\n", *(const void **)(a1 + 40), *(const void **)(a1 + 48)),
        *(void *)(v2 + 320) == -1))
  {
    uint64_t v5 = *(_DWORD **)(v2 + 328);
  }
  else
  {
    uint64_t v5 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v5 & 0xA) != 0 || (printf(" sr_ctrl_num    %lu\n", *(void *)(a1 + 56)), *(void *)(v2 + 320) == -1)) {
    unsigned int v6 = *(_DWORD **)(v2 + 328);
  }
  else {
    unsigned int v6 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v6 & 0xA) != 0
    || (printf(" sr_ctrl_active_head first, last  %p %p\n", *(const void **)(a1 + 64), *(const void **)(a1 + 72)),
        *(void *)(v2 + 320) == -1))
  {
    uint64_t v7 = *(_DWORD **)(v2 + 328);
  }
  else
  {
    uint64_t v7 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v7 & 0xA) != 0 || (printf(" sr_num_active  %lu\n", *(void *)(a1 + 80)), *(void *)(v2 + 320) == -1)) {
    int v8 = *(_DWORD **)(v2 + 328);
  }
  else {
    int v8 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v8 & 0xA) == 0) {
    puts(" sr_filter ...");
  }
  dump_creation_filter((_DWORD *)(a1 + 88));
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v9 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v9 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v9 & 0xA) != 0 || (printf(" sr_filter_seqno  %u\n", *(_DWORD *)(a1 + 104)), *(void *)(v2 + 320) == -1)) {
    unint64_t v10 = *(_DWORD **)(v2 + 328);
  }
  else {
    unint64_t v10 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v10 & 0xA) != 0
    || (printf(" sr_alert_sent       %d\n", *(unsigned __int8 *)(a1 + 114)), *(void *)(v2 + 320) == -1))
  {
    uint64_t result = *(_DWORD **)(v2 + 328);
  }
  else
  {
    uint64_t result = (_DWORD *)_os_alloc_once();
  }
  if ((~*result & 0xA) == 0) {
    return (_DWORD *)printf(" sr_q_counts         %lu\n", *(void *)(a1 + 120));
  }
  return result;
}

uint64_t dump_idents(uint64_t a1)
{
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t result = *(void *)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t result = _os_alloc_once();
  }
  if ((~*(_DWORD *)result & 0xA) == 0) {
    uint64_t result = puts("dump_idents.. ");
  }
  for (uint64_t i = *(void *)(a1 + 40); i; uint64_t i = *(void *)(i + 16))
    uint64_t result = (uint64_t)dump_ident((const void **)i);
  return result;
}

_DWORD *dump_ident(const void **a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(_DWORD **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v3 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v3 & 0xA) != 0 || (printf("symptom_ctrl at %p\n", a1), *(void *)(v2 + 320) == -1)) {
    uint64_t v4 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v4 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v4 & 0xA) != 0 || (printf(" sc_magic               %x\n", *(_DWORD *)a1), *(void *)(v2 + 320) == -1)) {
    uint64_t v5 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v5 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v5 & 0xA) != 0 || (printf(" sc_flags               %x\n", *((_DWORD *)a1 + 1)), *(void *)(v2 + 320) == -1)) {
    unsigned int v6 = *(_DWORD **)(v2 + 328);
  }
  else {
    unsigned int v6 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v6 & 0xA) != 0 || (printf(" sc_id                  %x\n", *((_DWORD *)a1 + 2)), *(void *)(v2 + 320) == -1)) {
    uint64_t v7 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v7 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v7 & 0xA) != 0 || (printf(" sc_link                %p\n", a1[2]), *(void *)(v2 + 320) == -1)) {
    int v8 = *(_DWORD **)(v2 + 328);
  }
  else {
    int v8 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v8 & 0xA) != 0 || (printf(" sc_active_link         %p\n", a1[3]), *(void *)(v2 + 320) == -1)) {
    uint64_t v9 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v9 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v9 & 0xA) != 0
    || (printf(" sc_active_link_in_use  %d\n", *((unsigned __int8 *)a1 + 40)), *(void *)(v2 + 320) == -1))
  {
    unint64_t v10 = *(_DWORD **)(v2 + 328);
  }
  else
  {
    unint64_t v10 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v10 & 0xA) == 0) {
    puts(" sc_filter ...");
  }
  dump_creation_filter((_DWORD *)a1 + 11);
  if (*(void *)(v2 + 320) == -1) {
    uint64_t v11 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v11 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v11 & 0xA) != 0 || (printf(" sc_symptom_q len %lu\n", a1[8]), *(void *)(v2 + 320) == -1)) {
    uint64_t result = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t result = (_DWORD *)_os_alloc_once();
  }
  if ((~*result & 0xA) == 0) {
    return (_DWORD *)printf(" sc_symptom_q first, last %p %p\n", a1[9], a1[10]);
  }
  return result;
}

_DWORD *dump_creation_filter(_DWORD *a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(_DWORD **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v3 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v3 & 0xA) != 0 || (printf("    cf_queue_len_max    %x\n", a1[2]), *(void *)(v2 + 320) == -1)) {
    uint64_t v4 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v4 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v4 & 0xA) != 0 || (printf("    cf_queue_len_alert  %x\n", a1[1]), *(void *)(v2 + 320) == -1)) {
    uint64_t result = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t result = (_DWORD *)_os_alloc_once();
  }
  if ((~*result & 0xA) == 0) {
    return (_DWORD *)printf("    cf_filter_seqno     %x\n", a1[3]);
  }
  return result;
}

uint64_t dump_active_idents(uint64_t a1)
{
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t result = *(void *)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t result = _os_alloc_once();
  }
  if ((~*(_DWORD *)result & 0xA) == 0) {
    uint64_t result = puts("dump_active_idents.. ");
  }
  for (uint64_t i = *(void *)(a1 + 64); i; uint64_t i = *(void *)(i + 24))
    uint64_t result = (uint64_t)dump_ident((const void **)i);
  return result;
}

void ensure_symptom_framework_connect(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x1E4F14C38] + 328);
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
  if ((v4 & 4) != 0) {
    _sr_log("ensure_symptom_framework_connect %s, set sr_connect_queued\n", *(const char **)(a1 + 24));
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
    unint64_t v10 = *(int **)(v2 + 328);
  }
  else {
    unint64_t v10 = (int *)_os_alloc_once();
  }
  int v11 = *v10;
  if ((*v10 & 2) != 0)
  {
    printf("ensure_connect, update backoff value, uptime_secs %lu\n", v9);
    int v11 = *v10;
  }
  if ((v11 & 4) != 0) {
    _sr_log("ensure_connect, update backoff value, uptime_secs %lu\n", v9);
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
    int v15 = *(int **)(v2 + 328);
  }
  else {
    int v15 = (int *)_os_alloc_once();
  }
  int v16 = *v15;
  if ((*v15 & 2) != 0)
  {
    printf("delay_after_interruption is %lld nanoseconds\n", v14);
    int v16 = *v15;
  }
  if ((v16 & 4) != 0) {
    _sr_log("delay_after_interruption is %lld nanoseconds\n", v14);
  }
  unint64_t v17 = 1000000000 * (tv_sec - *(void *)(a1 + 176));
  if (v14 <= v17)
  {
    connect_symptom_framework(a1);
  }
  else
  {
    dispatch_time_t v18 = dispatch_time(0, v14 - v17);
    int v19 = *(NSObject **)(a1 + 128);
    block[0] = MEMORY[0x1E4F14BE8];
    block[1] = 0x40000000;
    block[2] = __ensure_symptom_framework_connect_block_invoke;
    block[3] = &__block_descriptor_tmp_57;
    block[4] = a1;
    dispatch_after(v18, v19, block);
  }
}

uint64_t ensure_sym_ctrl_is_queued(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v5 = *(int **)(MEMORY[0x1E4F14C38] + 328);
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
  if ((v6 & 4) != 0) {
    _sr_log("ensure_sym_ctrl_is_queued, sc %p, in use %d\n", (const void *)a2, *(unsigned __int8 *)(a2 + 40));
  }
  if (!*(unsigned char *)(a2 + 40))
  {
    *(unsigned char *)(a2 + 40) = 1;
    *(void *)(a2 + 24) = 0;
    BOOL v7 = *(void **)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    *(void *)(a2 + 32) = v7;
    *BOOL v7 = a2;
    *(void *)(a1 + 72) = a2 + 24;
    *(void *)(a1 + 80) = v8 + 1;
  }
  if (*(void *)(v4 + 320) == -1) {
    unint64_t v9 = *(int **)(v4 + 328);
  }
  else {
    unint64_t v9 = (int *)_os_alloc_once();
  }
  int v10 = *v9;
  if ((*v9 & 2) != 0)
  {
    printf("After ensure_sym_ctrl_is_queued %p\n", (const void *)a2);
    int v10 = *v9;
  }
  if ((v10 & 4) != 0) {
    _sr_log("After ensure_sym_ctrl_is_queued %p\n", (const void *)a2);
  }

  return dump_symptom_state(a1);
}

void connect_symptom_framework(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x1E4F14C38] + 328);
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
  if ((v4 & 4) != 0) {
    _sr_log("connect_symptom_framework called\n");
  }
  if (*(void *)(a1 + 136))
  {
    uint64_t v5 = *(void *)(v2 + 320);
LABEL_10:
    ++*(void *)(a1 + 344);
    *(_WORD *)(a1 + 113) = 1;
    if (v5 == -1) {
      BOOL v7 = *(int **)(v2 + 328);
    }
    else {
      BOOL v7 = (int *)_os_alloc_once();
    }
    int v8 = *v7;
    if ((*v7 & 2) != 0)
    {
      printf("connect_symptom_framework: %s transport connect OK, unset sr_connect_queued\n", *(const char **)(a1 + 24));
      int v8 = *v7;
    }
    if ((v8 & 4) != 0) {
      _sr_log("connect_symptom_framework: %s transport connect OK, unset sr_connect_queued\n", *(const char **)(a1 + 24));
    }
    *(unsigned char *)(a1 + 216) = 0;
    uint64_t v9 = *(void *)(v2 + 320);
    if (*(void *)(a1 + 80))
    {
      if (v9 == -1) {
        int v10 = *(int **)(v2 + 328);
      }
      else {
        int v10 = (int *)_os_alloc_once();
      }
      int v11 = *v10;
      if ((*v10 & 2) != 0)
      {
        puts("connect_symptom_framework: ensure_alert");
        int v11 = *v10;
      }
      if ((v11 & 4) != 0) {
        _sr_log("connect_symptom_framework: ensure_alert\n");
      }
      ensure_alert(a1);
      uint64_t v9 = *(void *)(v2 + 320);
    }
    if (v9 == -1) {
      unint64_t v12 = *(int **)(v2 + 328);
    }
    else {
      unint64_t v12 = (int *)_os_alloc_once();
    }
    int v13 = *v12;
    if ((*v12 & 2) != 0)
    {
      puts("connect_symptom_framework: exit");
      int v13 = *v12;
    }
    if ((v13 & 4) != 0)
    {
      _sr_log("connect_symptom_framework: exit\n");
    }
    return;
  }
  int v6 = symptom_transport_connect(a1);
  uint64_t v5 = *(void *)(v2 + 320);
  if ((v6 & 0x80000000) == 0) {
    goto LABEL_10;
  }
  if (v5 == -1) {
    unint64_t v14 = *(int **)(v2 + 328);
  }
  else {
    unint64_t v14 = (int *)_os_alloc_once();
  }
  int v15 = *v14;
  if ((*v14 & 2) != 0)
  {
    printf("connect_symptom_framework: %s transport connect failed, unset sr_connect_queued\n", *(const char **)(a1 + 24));
    int v15 = *v14;
  }
  if ((v15 & 4) != 0) {
    _sr_log("connect_symptom_framework: %s transport connect failed, unset sr_connect_queued\n", *(const char **)(a1 + 24));
  }
  *(unsigned char *)(a1 + 216) = 0;

  ensure_symptom_framework_connect(a1);
}

uint64_t symptom_transport_connect(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x1E4F14C38] + 328);
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
  if ((v4 & 4) != 0) {
    _sr_log("symptom_transport_connect called, connecting to %s\n", "com.apple.usymptomsd");
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.usymptomsd", *(dispatch_queue_t *)(a1 + 128), 2uLL);
  *(void *)(a1 + 136) = mach_service;
  if (mach_service)
  {
    gettimeofday((timeval *)(a1 + 160), 0);
    xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 136), *(dispatch_queue_t *)(a1 + 128));
    int v6 = *(_xpc_connection_s **)(a1 + 136);
    handler[0] = MEMORY[0x1E4F14BE8];
    handler[1] = 0x40000000;
    handler[2] = __symptom_transport_connect_block_invoke;
    handler[3] = &__block_descriptor_tmp_0;
    handler[4] = a1;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(*(xpc_connection_t *)(a1 + 136));
    return 0;
  }
  else
  {
    if (*(void *)(v2 + 320) == -1) {
      int v8 = *(int **)(v2 + 328);
    }
    else {
      int v8 = (int *)_os_alloc_once();
    }
    int v9 = *v8;
    if ((*v8 & 2) != 0)
    {
      printf("failed to connect to %s\n", "com.apple.usymptomsd");
      int v9 = *v8;
    }
    if ((v9 & 4) != 0) {
      _sr_log("failed to connect to %s\n", "com.apple.usymptomsd");
    }
    return 0xFFFFFFFFLL;
  }
}

void __symptom_transport_connect_block_invoke(uint64_t a1, void *a2)
{
  int v4 = (const void *)MEMORY[0x1D25ECB20](a2);
  uint64_t v5 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    int v6 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    int v6 = (int *)_os_alloc_once();
  }
  int v7 = *v6;
  if ((*v6 & 2) != 0)
  {
    printf("symptom_transport_connect event handler called on %p for %p evcount %lu errcount %lu\n", *(const void **)(a1 + 32), a2, *(void *)(*(void *)(a1 + 32) + 224), *(void *)(*(void *)(a1 + 32) + 240));
    int v7 = *v6;
  }
  if ((v7 & 4) != 0) {
    _sr_log("symptom_transport_connect event handler called on %p for %p evcount %lu errcount %lu\n", *(const void **)(a1 + 32), a2, *(void *)(*(void *)(a1 + 32) + 224), *(void *)(*(void *)(a1 + 32) + 240));
  }
  if (v4 != (const void *)MEMORY[0x1E4F14D58])
  {
    if (v4 == (const void *)MEMORY[0x1E4F14D40])
    {
      *(void *)(*(void *)(a1 + 32) + 152) = 0;
      if (*(void *)(v5 + 320) == -1) {
        int v20 = *(int **)(v5 + 328);
      }
      else {
        int v20 = (int *)_os_alloc_once();
      }
      int v21 = *v20;
      if ((*v20 & 2) != 0)
      {
        printf("handling incoming message");
        int v21 = *v20;
      }
      if ((v21 & 4) != 0) {
        _sr_log("handling incoming message");
      }
      int v22 = *(void **)(a1 + 32);
      size_t length = 0;
      data = (unsigned __int16 *)xpc_dictionary_get_data(a2, "payload", &length);
      uint64_t v24 = *(void *)(v5 + 320);
      if (data)
      {
        int v25 = data;
        if (v24 == -1) {
          int v26 = *(int **)(v5 + 328);
        }
        else {
          int v26 = (int *)_os_alloc_once();
        }
        int v27 = *v26;
        if ((*v26 & 2) != 0)
        {
          printf("handle_incoming_xpc_dictionary:  desc %p size %lu\n", v25, length);
          int v27 = *v26;
        }
        if ((v27 & 4) != 0) {
          _sr_log("handle_incoming_xpc_dictionary:  desc %p size %lu\n", v25, length);
        }
        size_t v28 = length;
        size_t v29 = v22[29] + length;
        ++v22[28];
        v22[29] = v29;
        symptoms_incoming_message((uint64_t)v22, v25, v28);
      }
      else
      {
        if (v24 == -1) {
          v36 = *(int **)(v5 + 328);
        }
        else {
          v36 = (int *)_os_alloc_once();
        }
        int v37 = *v36;
        if ((*v36 & 2) != 0)
        {
          printf("handle_incoming_xpc_dictionary:  ERR message with no payload");
          int v37 = *v36;
        }
        if ((v37 & 4) != 0) {
          _sr_log("handle_incoming_xpc_dictionary:  ERR message with no payload");
        }
        ++v22[30];
      }
    }
    else
    {
      if (*(void *)(v5 + 320) == -1) {
        int v8 = *(int **)(v5 + 328);
      }
      else {
        int v8 = (int *)_os_alloc_once();
      }
      int v9 = *v8;
      if ((*v8 & 2) != 0)
      {
        printf("unexpected message from peer %p", v4);
        int v9 = *v8;
      }
      if ((v9 & 4) != 0) {
        _sr_log("unexpected message from peer %p", v4);
      }
      ++*(void *)(*(void *)(a1 + 32) + 240);
    }
    return;
  }
  if (*(void *)(v5 + 320) == -1) {
    int v10 = *(int **)(v5 + 328);
  }
  else {
    int v10 = (int *)_os_alloc_once();
  }
  int v11 = *v10;
  unint64_t v12 = (const char **)MEMORY[0x1E4F14D08];
  if ((*v10 & 2) != 0)
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E4F14D08]);
    printf("connection error: %s\n", string);
    int v11 = *v10;
  }
  if ((v11 & 4) != 0)
  {
    unint64_t v14 = xpc_dictionary_get_string(a2, *v12);
    _sr_log("connection error: %s\n", v14);
  }
  if (a2 == (void *)MEMORY[0x1E4F14CF8])
  {
    _sr_log("%s: %s", *(const char **)(*(void *)(a1 + 32) + 24), "SymptomReporter: XPC connection to Symptom Framework interrupted\n");
    uint64_t v30 = *(void *)(a1 + 32);
    ++*(void *)(v30 + 144);
    *(unsigned char *)(v30 + 113) = 0;
    ++*(void *)(v30 + 328);
LABEL_46:
    symptoms_transport_dropped(v30);
    return;
  }
  if (a2 != (void *)MEMORY[0x1E4F14D00])
  {
    uint64_t v15 = *(void *)(v5 + 320);
    if (a2 == (void *)MEMORY[0x1E4F14D10])
    {
      if (v15 == -1) {
        v38 = *(int **)(v5 + 328);
      }
      else {
        v38 = (int *)_os_alloc_once();
      }
      int v39 = *v38;
      if ((*v38 & 2) != 0)
      {
        puts("symptom_transport: skipping TERMINATION_IMMINENT event");
        int v39 = *v38;
      }
      if ((v39 & 4) != 0)
      {
        _sr_log("symptom_transport: skipping TERMINATION_IMMINENT event\n");
      }
    }
    else
    {
      if (v15 == -1) {
        int v16 = *(int **)(v5 + 328);
      }
      else {
        int v16 = (int *)_os_alloc_once();
      }
      int v17 = *v16;
      if ((*v16 & 2) != 0)
      {
        dispatch_time_t v18 = xpc_dictionary_get_string(a2, *v12);
        printf("symptom_transport: unhandled connection error: %s", v18);
        int v17 = *v16;
      }
      if ((v17 & 4) != 0)
      {
        int v19 = xpc_dictionary_get_string(a2, *v12);
        _sr_log("symptom_transport: unhandled connection error: %s", v19);
      }
    }
    return;
  }
  uint64_t v31 = *(void *)(a1 + 32);
  v32 = *(void **)(v31 + 136);
  if (v32)
  {
    xpc_release(v32);
    *(void *)(*(void *)(a1 + 32) + 136) = 0;
    uint64_t v31 = *(void *)(a1 + 32);
  }
  *(void *)(v31 + 136) = 0;
  uint64_t v33 = *(void *)(a1 + 32);
  *(unsigned char *)(v33 + 113) = 0;
  ++*(void *)(v33 + 336);
  unsigned int v34 = *(_DWORD *)(v33 + 212) + 1;
  *(_DWORD *)(v33 + 212) = v34;
  if (v34 >= 2)
  {
    *(_DWORD *)(v33 + 212) = 0;
    uint64_t v35 = *(void *)(v5 + 320);
LABEL_78:
    if (v35 == -1) {
      int v43 = *(int **)(v5 + 328);
    }
    else {
      int v43 = (int *)_os_alloc_once();
    }
    int v44 = *v43;
    if ((*v43 & 2) != 0)
    {
      puts("symptom_transport: CONNECTION_INVALID");
      int v44 = *v43;
    }
    if ((v44 & 4) != 0) {
      _sr_log("symptom_transport: CONNECTION_INVALID\n");
    }
    uint64_t v30 = *(void *)(a1 + 32);
    unint64_t v45 = *(void *)(v30 + 152) + 1;
    *(void *)(v30 + 152) = v45;
    if (v45 >= 4)
    {
      _sr_log("%s: %s", *(const char **)(v30 + 24), "SymptomReporter: Disabling Symptom Transport after perstent invalid connections\n");
      *(unsigned char *)(*(void *)(a1 + 32) + 115) = 1;
      return;
    }
    if (*(void *)(v30 + 192) < 0xDF8475800uLL) {
      *(void *)(v30 + 192) = 60000000000;
    }
    goto LABEL_46;
  }
  uint64_t v35 = *(void *)(v5 + 320);
  if (!v34) {
    goto LABEL_78;
  }
  if (v35 == -1) {
    v40 = *(int **)(v5 + 328);
  }
  else {
    v40 = (int *)_os_alloc_once();
  }
  int v41 = *v40;
  if ((*v40 & 2) != 0)
  {
    printf("symptom_transport: XPC connection invalid for %s, switch to %s\n", "com.apple.usymptomsd", "com.apple.usymptomsd");
    int v41 = *v40;
  }
  if ((v41 & 4) != 0) {
    _sr_log("symptom_transport: XPC connection invalid for %s, switch to %s\n", "com.apple.usymptomsd", "com.apple.usymptomsd");
  }
  uint64_t v42 = *(void *)(a1 + 32);

  symptoms_transport_fastdrop(v42);
}

void symptoms_incoming_message(uint64_t a1, unsigned __int16 *a2, unint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F14BF8];
  uint64_t v6 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    int v7 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    int v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    puts("+++ SYMPTOMSD MESSAGE RECEIVED +++");
    int v8 = *v7;
  }
  if ((v8 & 4) != 0) {
    _sr_log("+++ SYMPTOMSD MESSAGE RECEIVED +++\n");
  }
  if (a3 < 4) {
    return;
  }
  while (1)
  {
    unsigned int v9 = *a2;
    if (v9 <= 0xB) {
      break;
    }
    if (v9 != 12)
    {
      if (v9 == 41)
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
        else
        {
          _sr_log("SymptomReporter incoming_message, SYMTLV_TERMINAL_ACK sz too small %zd");
        }
      }
      return;
    }
    _sr_log("SymptomReporter incoming_message, SYMTLV_FILTER sc %zd desc->stlv_len %d filter size %zd", a3, a2[1], 0x10uLL);
    unint64_t v20 = a2[1];
    if (a3 < 0x14 || v20 < 0x10 || (v20 & 0xF) != 0)
    {
      _sr_log("SymptomReporter incoming_message, SYMTLV_FILTER sz %zd fails consistency checks, desc->stlv_len %d");
      return;
    }
    if (*(void *)(v6 + 320) == -1) {
      int v21 = *(int **)(v6 + 328);
    }
    else {
      int v21 = (int *)_os_alloc_once();
    }
    unint64_t v22 = v20 >> 4;
    int v23 = *v21;
    if ((*v21 & 2) != 0)
    {
      printf("apply_new_filters, count is %zd, seqno %d\n", v22, *(_DWORD *)(a1 + 104) + 1);
      int v23 = *v21;
    }
    if ((v23 & 4) != 0) {
      _sr_log("apply_new_filters, count is %zd, seqno %d\n", v22, *(_DWORD *)(a1 + 104) + 1);
    }
    ++*(_DWORD *)(a1 + 104);
    uint64_t v24 = a2 + 8;
    do
    {
      int v25 = *(v24 - 2);
      uint64_t v26 = *(void *)(v6 + 320);
      if (!v25)
      {
        uint64_t v31 = (_DWORD *)(a1 + 88);
        goto LABEL_54;
      }
      if (v26 == -1) {
        int v27 = *(int **)(v6 + 328);
      }
      else {
        int v27 = (int *)_os_alloc_once();
      }
      int v28 = *v27;
      if ((*v27 & 2) != 0)
      {
        printf("apply_new_filters, Symptom: %x   Qlert %d    Q drop %d\n", v25, *((unsigned __int16 *)v24 - 2), *((unsigned __int16 *)v24 - 1));
        int v28 = *v27;
      }
      int v29 = *(v24 - 2);
      if ((v28 & 4) != 0)
      {
        _sr_log("apply_new_filters, Symptom: %x   Qlert %d    Q drop %d\n", v29, *((unsigned __int16 *)v24 - 2), *((unsigned __int16 *)v24 - 1));
        int v29 = *(v24 - 2);
      }
      symptom_ctrl = get_symptom_ctrl((void *)a1, v29);
      if (symptom_ctrl)
      {
        uint64_t v31 = (_DWORD *)symptom_ctrl + 11;
        uint64_t v26 = *(void *)(v6 + 320);
LABEL_54:
        int v32 = *(_DWORD *)(a1 + 104);
        _DWORD *v31 = *v24;
        v31[1] = *((unsigned __int16 *)v24 - 2);
        v31[2] = *((unsigned __int16 *)v24 - 1);
        v31[3] = v32;
        if (v26 == -1) {
          uint64_t v33 = *(int **)(v6 + 328);
        }
        else {
          uint64_t v33 = (int *)_os_alloc_once();
        }
        int v34 = *v33;
        if ((*v33 & 2) != 0)
        {
          printf("update_filter_values, max age %d, alert len %d drop len %d seqno %d\n", *v31, v31[1], v31[2], v32);
          int v34 = *v33;
        }
        if ((v34 & 4) != 0) {
          _sr_log("update_filter_values, max age %d, alert len %d drop len %d seqno %d\n", *v31, v31[1], v31[2], v32);
        }
      }
      v24 += 4;
      --v22;
    }
    while (v22);
    if (*(void *)(v6 + 320) == -1) {
      uint64_t v35 = *(int **)(v6 + 328);
    }
    else {
      uint64_t v35 = (int *)_os_alloc_once();
    }
    int v36 = *v35;
    if ((*v35 & 2) != 0)
    {
      printf("apply_new_filters");
      int v36 = *v35;
    }
    if ((v36 & 4) != 0) {
      _sr_log("apply_new_filters");
    }
    reevaluate_sr_symptoms(a1);
    uint64_t v37 = a2[1];
    a3 = a3 - v37 - 4;
    a2 = (unsigned __int16 *)((char *)a2 + v37 + 4);
LABEL_72:
    if (a3 <= 3) {
      return;
    }
  }
  if (v9 == 1)
  {
    a2 += 2;
    a3 -= 4;
    goto LABEL_72;
  }
  if (v9 == 11)
  {
    unint64_t v10 = a3 - 16;
    if (a3 >= 0x10 && a2[1] == 12)
    {
      int v11 = *((_DWORD *)a2 + 3);
      if (*(void *)(v6 + 320) == -1) {
        unint64_t v12 = *(int **)(v6 + 328);
      }
      else {
        unint64_t v12 = (int *)_os_alloc_once();
      }
      memset(v39, 0, 60);
      int v13 = *v12;
      if ((*v12 & 2) != 0)
      {
        printf("new_symptoms_read: ack_id %d\n", v11);
        int v13 = *v12;
      }
      if ((v13 & 4) != 0) {
        _sr_log("new_symptoms_read: ack_id %d\n", v11);
      }
      unint64_t v14 = (char *)malloc_type_malloc(0x28A0uLL, 0x23FD76D0uLL);
      uint64_t v15 = v14;
      if (v14) {
        int v16 = v14;
      }
      else {
        int v16 = (char *)v39;
      }
      int v17 = (char *)&v39[3] + 8;
      if (v14)
      {
        unint64_t v38 = 10340;
        int v17 = read_symptoms(a1, v14 + 56, &v38);
      }
      if (v15) {
        dispatch_time_t v18 = v15;
      }
      else {
        dispatch_time_t v18 = (char *)v39;
      }
      *((_DWORD *)v18 + 1) = 3145735;
      if (v15) {
        int v19 = v15 + 8;
      }
      else {
        int v19 = (char *)v39 + 8;
      }
      read_current_status(a1, (uint64_t)v19, v11, 1);
      *(_DWORD *)int v17 = 0;
      *(_WORD *)int v16 = 1;
      *((_WORD *)v18 + 1) = (_WORD)v17 - (_WORD)v19 + 8;
      symptom_transport_send(a1, v16, (unsigned __int16)((_WORD)v17 - (_WORD)v19 + 8) + 4);
      ++*(void *)(a1 + 280);
      sr_log_status_send(a1, (uint64_t)v16);
      if (v15) {
        free(v15);
      }
      a2 = (unsigned __int16 *)((char *)a2 + a2[1] + 4);
      a3 = v10;
      goto LABEL_72;
    }
    _sr_log("SymptomReporter incoming_message, SYMTLV_READ sz too small %zd");
  }
}

void ensure_alert(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F14BF8];
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
  uint64_t v7 = *(void *)(MEMORY[0x1E4F14C38] + 320);
  if (v6)
  {
    int v8 = v6;
    if (v7 == -1) {
      unsigned int v9 = *(int **)(MEMORY[0x1E4F14C38] + 328);
    }
    else {
      unsigned int v9 = (int *)_os_alloc_once();
    }
    int v10 = *v9;
    if ((*v9 & 2) != 0)
    {
      printf("symptom_transport_send:  ptr %p size %lu \n", a2, a3);
      int v10 = *v9;
    }
    if ((v10 & 4) != 0) {
      _sr_log("symptom_transport_send:  ptr %p size %lu \n", a2, a3);
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
      int v13 = *(int **)(MEMORY[0x1E4F14C38] + 328);
    }
    else {
      int v13 = (int *)_os_alloc_once();
    }
    int v14 = *v13;
    if ((*v13 & 2) != 0)
    {
      puts("symptom_transport_send:  ERR no dictionary");
      int v14 = *v13;
    }
    if ((v14 & 4) != 0) {
      _sr_log("symptom_transport_send:  ERR no dictionary\n");
    }
    return 0xFFFFFFFFLL;
  }
}

unsigned char *sr_log_status_send(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F14BF8];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1)
  {
    uint64_t result = *(unsigned char **)(MEMORY[0x1E4F14C38] + 328);
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t result = (unsigned char *)_os_alloc_once();
    if (!result) {
      return result;
    }
  }
  if (*result)
  {
    int v13 = *(const char **)(a1 + 24);
    uint64_t v5 = 1499;
    unsigned int v6 = snprintf(__str, 0x5DBuLL, "Status Sender Name: %s", v13);
    if (v6 >= 0x5DB) {
      uint64_t v7 = 1499;
    }
    else {
      uint64_t v7 = v6;
    }
    int v8 = snprintf(&__str[v7], 1499 - v7, "Sent STATUS flags");
    if ((unint64_t)(v7 + v8) < 0x5DB) {
      uint64_t v5 = v7 + v8;
    }
    char v9 = *(unsigned char *)(a2 + 10);
    if (v9)
    {
      int v11 = snprintf(&__str[v5], 1499 - v5, " resp");
      if ((unint64_t)(v5 + v11) >= 0x5DB) {
        uint64_t v5 = 1499;
      }
      else {
        v5 += v11;
      }
      if ((v9 & 2) == 0)
      {
LABEL_11:
        if ((v9 & 4) == 0) {
          return (unsigned char *)snprintf(&__str[v5], 1499 - v5, " ack-id %d  num-alerts %d num-queued %d", *(_DWORD *)(a2 + 12), *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20));
        }
LABEL_12:
        int v10 = snprintf(&__str[v5], 1499 - v5, " EAGAIN !!!");
        if ((unint64_t)(v5 + v10) >= 0x5DB) {
          uint64_t v5 = 1499;
        }
        else {
          v5 += v10;
        }
        return (unsigned char *)snprintf(&__str[v5], 1499 - v5, " ack-id %d  num-alerts %d num-queued %d", *(_DWORD *)(a2 + 12), *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20));
      }
    }
    else if ((*(unsigned char *)(a2 + 10) & 2) == 0)
    {
      goto LABEL_11;
    }
    int v12 = snprintf(&__str[v5], 1499 - v5, " alert");
    if ((unint64_t)(v5 + v12) >= 0x5DB) {
      uint64_t v5 = 1499;
    }
    else {
      v5 += v12;
    }
    if ((v9 & 4) == 0) {
      return (unsigned char *)snprintf(&__str[v5], 1499 - v5, " ack-id %d  num-alerts %d num-queued %d", *(_DWORD *)(a2 + 12), *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20));
    }
    goto LABEL_12;
  }
  return result;
}

_DWORD *read_current_status(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v6 = *(void *)(a1 + 80);
  *(unsigned char *)(a1 + 114) = v6 != 0;
  if (v6) {
    int v7 = a4 | 2;
  }
  else {
    int v7 = a4;
  }
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
    if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1)
    {
      int v12 = *(int **)(MEMORY[0x1E4F14C38] + 328);
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
  if ((v13 & 4) != 0) {
    _sr_log("read_current_status, ack id %d, flags %d num_alerts %d  num_queued %d\n", v5, v7, *(_DWORD *)(v4 + 8), *(_DWORD *)(v4 + 12));
  }

  return dump_status((unsigned __int8 *)v4);
}

_DWORD *dump_status(unsigned __int8 *a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(_DWORD **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v3 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v3 & 0xA) != 0 || (puts("Reporter status:"), *(void *)(v2 + 320) == -1)) {
    uint64_t v4 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v4 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v4 & 0xA) != 0 || (printf("srs_version             %d\n", *a1), *(void *)(v2 + 320) == -1)) {
    int v5 = *(_DWORD **)(v2 + 328);
  }
  else {
    int v5 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v5 & 0xA) != 0 || (printf("srs_flags               %0x\n", a1[2]), *(void *)(v2 + 320) == -1)) {
    uint64_t v6 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v6 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v6 & 0xA) != 0
    || (printf("srs_ack_id              %0x\n", *((_DWORD *)a1 + 1)), *(void *)(v2 + 320) == -1))
  {
    int v7 = *(_DWORD **)(v2 + 328);
  }
  else
  {
    int v7 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v7 & 0xA) != 0 || (printf("srs_num_alerts          %d\n", *((_DWORD *)a1 + 2)), *(void *)(v2 + 320) == -1)) {
    uint64_t v8 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v8 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v8 & 0xA) != 0 || (printf("srs_num_queued          %d\n", *((_DWORD *)a1 + 3)), *(void *)(v2 + 320) == -1)) {
    uint64_t result = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t result = (_DWORD *)_os_alloc_once();
  }
  if ((~*result & 0xA) == 0)
  {
    return (_DWORD *)puts("srs_sym_basic   ...");
  }
  return result;
}

char *read_symptoms(uint64_t a1, char *a2, unint64_t *a3)
{
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v6 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    int v7 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    int v7 = (int *)_os_alloc_once();
  }
  int v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("read_symptoms for sr %p %s\n", (const void *)a1, *(const char **)(a1 + 24));
    int v8 = *v7;
  }
  if ((v8 & 4) != 0) {
    _sr_log("read_symptoms for sr %p %s\n", (const void *)a1, *(const char **)(a1 + 24));
  }
  for (uint64_t i = *(void **)(a1 + 64); i; uint64_t i = *(void **)(a1 + 64))
  {
    sym_ctrl_dequeue(a1, (uint64_t)i);
    if (*(void *)(v6 + 320) == -1) {
      unint64_t v10 = *(int **)(v6 + 328);
    }
    else {
      unint64_t v10 = (int *)_os_alloc_once();
    }
    int v11 = *v10;
    if ((*v10 & 2) != 0)
    {
      printf("read_symptoms for sc %p, q len %zu\n", i, i[8]);
      int v11 = *v10;
    }
    if ((v11 & 4) != 0) {
      _sr_log("read_symptoms for sc %p, q len %zu\n", i, i[8]);
    }
    int v32 = 0;
    uint64_t v33 = &v32;
    if (*(void *)(v6 + 320) == -1) {
      int v12 = *(int **)(v6 + 328);
    }
    else {
      int v12 = (int *)_os_alloc_once();
    }
    int v13 = *v12;
    if ((*v12 & 2) != 0)
    {
      puts("read_symptoms_from_q: entry");
      int v13 = *v12;
    }
    if ((v13 & 4) != 0) {
      _sr_log("read_symptoms_from_q: entry\n");
    }
    int v14 = (const void **)(i + 9);
    uint64_t v15 = (const void **)i[9];
    if (v15)
    {
      int v16 = a2;
      while (1)
      {
        int v17 = *v15;
        *int v14 = *v15;
        if (!v17) {
          i[10] = v14;
        }
        symptom = read_symptom((uint64_t)v15, v16, a3);
        uint64_t v19 = *(void *)(v6 + 320);
        if (symptom == v16) {
          break;
        }
        a2 = symptom;
        if (v19 == -1) {
          unint64_t v20 = *(int **)(v6 + 328);
        }
        else {
          unint64_t v20 = (int *)_os_alloc_once();
        }
        int v21 = *v20;
        if ((*v20 & 2) != 0)
        {
          puts("read_symptoms_from_q: added next symptom");
          int v21 = *v20;
        }
        if ((v21 & 4) != 0) {
          _sr_log("read_symptoms_from_q: added next symptom\n");
        }
        --i[8];
        ++*(void *)(a1 + 296);
        update_globals_for_symptom_removal(a1, v15);
        symptom_free(v15, "transport OK");
        uint64_t v15 = (const void **)i[9];
        int v16 = a2;
        if (!v15) {
          goto LABEL_41;
        }
      }
      if (v19 == -1) {
        unint64_t v22 = *(int **)(v6 + 328);
      }
      else {
        unint64_t v22 = (int *)_os_alloc_once();
      }
      int v23 = *v22;
      if ((*v22 & 2) != 0)
      {
        printf("read_symptoms_from_q: no next symptom available");
        int v23 = *v22;
      }
      if ((v23 & 4) != 0) {
        _sr_log("read_symptoms_from_q: no next symptom available");
      }
      char *v15 = 0;
      *uint64_t v33 = v15;
      uint64_t v33 = v15;
      *a3 = 0;
      a2 = v16;
    }
LABEL_41:
    uint64_t v24 = v32;
    if (!v32) {
      goto LABEL_47;
    }
    if (*v14)
    {
      *uint64_t v33 = *v14;
      uint64_t v33 = (const void **)i[10];
      i[9] = 0;
      i[10] = v14;
      uint64_t v24 = v32;
      if (!v32) {
        goto LABEL_47;
      }
    }
    else
    {
      int v14 = (const void **)i[10];
    }
    *int v14 = v24;
    i[10] = v33;
LABEL_47:
    if (i[8])
    {
      i[3] = 0;
      int v25 = v31;
      i[4] = v31;
      *int v25 = (uint64_t)i;
      uint64_t v31 = i + 3;
    }
  }
  while (1)
  {
    uint64_t v28 = v30;
    if (!v30) {
      break;
    }
    uint64_t v26 = *(void *)(v30 + 24);
    int v27 = *(void **)(v30 + 32);
    if (v26)
    {
      *(void *)(v26 + 32) = v27;
      int v27 = *(void **)(v28 + 32);
    }
    else
    {
      uint64_t v31 = *(uint64_t **)(v30 + 32);
    }
    void *v27 = v26;
    ensure_sym_ctrl_is_queued(a1, v28);
  }
  return a2;
}

uint64_t update_globals_for_symptom_removal(uint64_t a1, const void **a2)
{
  --*(void *)(a1 + 120);
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x1E4F14C38] + 328);
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
  if ((v4 & 4) != 0) {
    _sr_log("update globals to remove symptom at %p\n", a2);
  }

  return dump_symptom(a2);
}

void symptom_post(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(_DWORD **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v3 = (_DWORD *)_os_alloc_once();
  }
  if ((*v3 & 2) != 0)
  {
    printf("symptom_post entry, symptom pointer %p\n", (const void *)a1);
    if ((*v3 & 4) == 0)
    {
LABEL_5:
      if (!a1) {
        return;
      }
      goto LABEL_6;
    }
  }
  else if ((*v3 & 4) == 0)
  {
    goto LABEL_5;
  }
  _sr_log("symptom_post entry, symptom pointer %p\n", (const void *)a1);
  if (!a1) {
    return;
  }
LABEL_6:
  dump_symptom((const void **)a1);
  uint64_t v4 = *(void *)(a1 + 112);
  if (*(unsigned char *)(v4 + 115))
  {
    int v5 = "Disabled";
LABEL_8:
    symptom_free((void *)a1, v5);
    return;
  }
  if (!*(unsigned char *)(v4 + 352))
  {
    int v5 = "Singlethreaded";
    goto LABEL_8;
  }
  symptom_ctrl = get_symptom_ctrl(*(void **)(a1 + 112), *(_DWORD *)(a1 + 32));
  if (*(void *)(v2 + 320) == -1) {
    int v7 = *(_DWORD **)(v2 + 328);
  }
  else {
    int v7 = (_DWORD *)_os_alloc_once();
  }
  if ((*v7 & 2) == 0)
  {
    if ((*v7 & 4) == 0) {
      goto LABEL_19;
    }
LABEL_25:
    _sr_log("symptom_post obtained control structure at %p\n", symptom_ctrl);
    if (symptom_ctrl) {
      goto LABEL_20;
    }
LABEL_26:
    sr_log_symptom_action(a1, 2048);
    int v5 = "No mem";
    goto LABEL_8;
  }
  printf("symptom_post obtained control structure at %p\n", symptom_ctrl);
  if ((*v7 & 4) != 0) {
    goto LABEL_25;
  }
LABEL_19:
  if (!symptom_ctrl) {
    goto LABEL_26;
  }
LABEL_20:

  handle_symptom(v4, (uint64_t)symptom_ctrl, (void *)a1);
}

uint64_t dump_symptom(const void **a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(_DWORD **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v3 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v3 & 0xA) != 0 || (printf(" Symptom at %p\n", a1), *(void *)(v2 + 320) == -1)) {
    uint64_t v4 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v4 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v4 & 0xA) != 0 || (printf("   s_link next  %p\n", *a1), *(void *)(v2 + 320) == -1)) {
    int v5 = *(_DWORD **)(v2 + 328);
  }
  else {
    int v5 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v5 & 0xA) == 0) {
    printf("   s_magic      %x\n", *((_DWORD *)a1 + 2));
  }

  return dump_basic_symptom((unsigned __int8 *)a1 + 16);
}

uint64_t dump_basic_symptom(unsigned __int8 *a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(_DWORD **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v3 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v3 & 0xA) != 0 || (printf(" sb_version         %d\n", *a1), *(void *)(v2 + 320) == -1)) {
    uint64_t v4 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v4 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v4 & 0xA) != 0 || (printf(" sb_flags           %x\n", *((_DWORD *)a1 + 1)), *(void *)(v2 + 320) == -1)) {
    int v5 = *(_DWORD **)(v2 + 328);
  }
  else {
    int v5 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v5 & 0xA) != 0 || (printf(" sb_timestamp_secs  %d\n", *((_DWORD *)a1 + 2)), *(void *)(v2 + 320) == -1)) {
    uint64_t v6 = *(_DWORD **)(v2 + 328);
  }
  else {
    uint64_t v6 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v6 & 0xA) != 0 || (printf(" sb_timestamp_nsecs %d\n", *((_DWORD *)a1 + 3)), *(void *)(v2 + 320) == -1)) {
    int v7 = *(_DWORD **)(v2 + 328);
  }
  else {
    int v7 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v7 & 0xA) != 0)
  {
    uint64_t v8 = -1;
  }
  else
  {
    printf(" sb_ident           %d\n", *((_DWORD *)a1 + 4));
    uint64_t v8 = *(void *)(v2 + 320);
  }
  for (uint64_t i = 0; i != 8; ++i)
  {
    if (v8 == -1) {
      uint64_t result = *(void *)(v2 + 328);
    }
    else {
      uint64_t result = _os_alloc_once();
    }
    if ((~*(_DWORD *)result & 0xA) != 0)
    {
      uint64_t v8 = -1;
    }
    else
    {
      uint64_t result = printf(" sb_qualifier[%d]    %llx\n", i, *(void *)&a1[8 * i + 24]);
      uint64_t v8 = *(void *)(v2 + 320);
    }
  }
  return result;
}

void symptom_free(void *a1, const char *a2)
{
  if (a1)
  {
    while (1)
    {
      uint64_t v4 = (void *)a1[13];
      if (!v4) {
        break;
      }
      a1[13] = *v4;
      free(v4);
    }
    *((_DWORD *)a1 + 2) = -823271763;
    if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
      int v5 = *(int **)(MEMORY[0x1E4F14C38] + 328);
    }
    else {
      int v5 = (int *)_os_alloc_once();
    }
    int v6 = *v5;
    if ((*v5 & 2) != 0)
    {
      printf("Free symptom %p, %s", a1, a2);
      int v6 = *v5;
    }
    if ((v6 & 4) != 0) {
      _sr_log("Free symptom %p, %s", a1, a2);
    }
    free(a1);
  }
}

uint64_t sym_ctrl_dequeue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  int v5 = *(void **)(a2 + 32);
  if (v4)
  {
    *(void *)(v4 + 32) = v5;
    int v5 = *(void **)(a2 + 32);
  }
  else
  {
    *(void *)(a1 + 72) = v5;
  }
  *int v5 = v4;
  *(unsigned char *)(a2 + 40) = 0;
  --*(void *)(a1 + 80);
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    int v6 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    int v6 = (int *)_os_alloc_once();
  }
  int v7 = *v6;
  if ((*v6 & 2) != 0)
  {
    printf("After sym_ctrl_dequeue  %p\n", (const void *)a2);
    int v7 = *v6;
  }
  if ((v7 & 4) != 0) {
    _sr_log("After sym_ctrl_dequeue  %p\n", (const void *)a2);
  }

  return dump_symptom_state(a1);
}

char *read_symptom(uint64_t a1, _DWORD *a2, unint64_t *a3)
{
  uint64_t v4 = (char *)a2;
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

void *get_symptom_ctrl(void *a1, int a2)
{
  uint64_t result = (void *)a1[5];
  if (result)
  {
    while (*((_DWORD *)result + 2) != a2)
    {
      uint64_t result = (void *)result[2];
      if (!result) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    uint64_t result = malloc_type_calloc(1uLL, 0x58uLL, 0x10A0040C61C5460uLL);
    if (result)
    {
      *uint64_t result = 3435986669;
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

uint64_t symptom_set_qualifier(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a3 <= 7)
    {
      uint64_t result = 0;
      *(void *)(a1 + 8 * a3 + 40) = a2;
      *(_DWORD *)(a1 + 20) |= 1 << a3;
    }
  }
  return result;
}

void *symptom_new(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = 0;
  if (a1)
  {
    if (!(a2 >> 20))
    {
      uint64_t v5 = malloc_type_calloc(1uLL, 0x78uLL, 0x1020040647A71D6uLL);
      uint64_t v2 = v5;
      if (v5)
      {
        v8.__darwin_time_t tv_sec = 0;
        *(void *)&v8.tv_usec = 0;
        v5[1] = 0x580002CEEDFEEDLL;
        *((unsigned char *)v5 + 16) = 1;
        *((_DWORD *)v5 + 5) = 0;
        gettimeofday(&v8, 0);
        int v6 = 1000 * v8.tv_usec;
        *((_DWORD *)v2 + 6) = v8.tv_sec;
        *((_DWORD *)v2 + 7) = v6;
        *(_OWORD *)(v2 + 5) = 0u;
        *(_OWORD *)(v2 + 7) = 0u;
        *(_OWORD *)(v2 + 9) = 0u;
        *(_OWORD *)(v2 + 11) = 0u;
        *((_DWORD *)v2 + 8) = a2 | (*(_DWORD *)(a1 + 12) << 20);
        v2[14] = a1;
      }
    }
  }
  return v2;
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

uint64_t symptom_send_immediate(uint64_t a1)
{
  if (a1)
  {
    *(unsigned char *)(a1 + 17) = 4;
    sr_log_symptom(a1);
    uint64_t v2 = *(void *)(a1 + 112);
    if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
      uint64_t v3 = *(void *)(MEMORY[0x1E4F14C38] + 328);
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

uint64_t _symptoms_daemon_fallback_initial_disposition(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (_symptoms_daemon_fallback_initial_disposition_onceToken != -1) {
    dispatch_once(&_symptoms_daemon_fallback_initial_disposition_onceToken, &__block_literal_global);
  }
  uint64_t result = _symptoms_daemon_fallback_initial_disposition_initial_disposition;
  if (_symptoms_daemon_fallback_initial_disposition_initial_disposition == 2)
  {
    if (a4)
    {
      *a4 = 0x2000000;
      return 2;
    }
    else
    {
      uint64_t result = 0;
      _symptoms_daemon_fallback_initial_disposition_initial_disposition = 0;
    }
  }
  return result;
}

size_t ___symptoms_daemon_fallback_initial_disposition_block_invoke()
{
  size_t result = (size_t)getprogname();
  if (result)
  {
    uint64_t v1 = (const char *)result;
    size_t v2 = strlen((const char *)result);
    for (uint64_t i = 0; i != 7; ++i)
    {
      size_t result = strlen(_block_invoke_2_kBlacklistedProcessNameList[i]);
      if (v2 >= result)
      {
        size_t result = strncasecmp(v1, _block_invoke_2_kBlacklistedProcessNameList[i], result);
        if (!result)
        {
          int v8 = 0;
          goto LABEL_14;
        }
      }
    }
    if (!_symptoms_daemon_fallback_initial_disposition_initial_disposition) {
      return result;
    }
    uint64_t v4 = 0;
    for (char j = 1; ; char j = 0)
    {
      char v6 = j;
      uint64_t v7 = _block_invoke_kPreemptProcessNameList[v4];
      size_t result = strlen(v7);
      if (v2 >= result)
      {
        size_t result = strncasecmp(v1, v7, result);
        if (!result) {
          break;
        }
      }
      uint64_t v4 = 1;
      if ((v6 & 1) == 0) {
        return result;
      }
    }
    int v8 = 2;
LABEL_14:
    _symptoms_daemon_fallback_initial_disposition_initial_disposition = v8;
  }
  return result;
}

uint64_t _symptoms_daemon_fallback_subseq_disposition(int a1, int a2, const unsigned __int8 *a3, NSObject *a4, void *aBlock)
{
  if (a4) {
    BOOL v7 = aBlock == 0;
  }
  else {
    BOOL v7 = 1;
  }
  uint64_t v8 = !v7;
  if (!v7)
  {
    long long v10 = _Block_copy(aBlock);
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "type", 1uLL);
    xpc_dictionary_set_uint64(v11, "seqno", 6uLL);
    xpc_dictionary_set_uint64(v11, "howmany", 1uLL);
    xpc_dictionary_set_uuid(v11, "uuid", a3);
    uint64_t v12 = _create_connection_connection;
    if (_create_connection_connection)
    {
LABEL_9:
      v17[0] = MEMORY[0x1E4F14BE8];
      v17[1] = 0x40000000;
      v17[2] = ___symptoms_daemon_fallback_subseq_disposition_block_invoke;
      v17[3] = &unk_1E6897140;
      v17[4] = v10;
      v17[5] = v11;
      if (_service_queue_service_queue_once != -1) {
        dispatch_once(&_service_queue_service_queue_once, &__block_literal_global_34);
      }
      block[0] = MEMORY[0x1E4F14BE8];
      block[1] = 0x40000000;
      block[2] = ___send_with_reply_block_invoke;
      block[3] = &unk_1E6897228;
      void block[6] = v11;
      block[7] = a4;
      block[4] = v17;
      void block[5] = v12;
      dispatch_sync((dispatch_queue_t)_service_queue_service_queue, block);
      return v8;
    }
    if (_service_queue_service_queue_once != -1) {
      dispatch_once(&_service_queue_service_queue_once, &__block_literal_global_34);
    }
    _create_connection_connection = (uint64_t)xpc_connection_create_mach_service("com.apple.symptoms.symptomsd.managed_events", (dispatch_queue_t)_service_queue_service_queue, 2uLL);
    if (_create_connection_connection)
    {
      if (MEMORY[0x1D25ECB20]() == MEMORY[0x1E4F14D28])
      {
        xpc_connection_set_event_handler((xpc_connection_t)_create_connection_connection, &__block_literal_global_30);
        xpc_connection_resume((xpc_connection_t)_create_connection_connection);
        uint64_t v12 = _create_connection_connection;
        if (_create_connection_connection) {
          goto LABEL_9;
        }
      }
      else
      {
        if (_create_connection_connection) {
          xpc_release((xpc_object_t)_create_connection_connection);
        }
        _create_connection_connection = 0;
      }
    }
    v16[0] = MEMORY[0x1E4F14BE8];
    v16[1] = 0x40000000;
    v16[2] = ___symptoms_daemon_fallback_subseq_disposition_block_invoke_2;
    v16[3] = &unk_1E6897168;
    v16[4] = v10;
    v16[5] = v11;
    dispatch_async(a4, v16);
    return v8;
  }
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    int v13 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    int v13 = (int *)_os_alloc_once();
  }
  int v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    printf("incorrect arguments (queue/completion): %p/%p", a4, aBlock);
    int v14 = *v13;
  }
  if ((v14 & 4) != 0) {
    _sr_log("incorrect arguments (queue/completion): %p/%p", a4, aBlock);
  }
  return v8;
}

void ___symptoms_daemon_fallback_subseq_disposition_block_invoke(uint64_t a1, void *a2)
{
  if (!a2)
  {
    char v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  uint64_t v4 = MEMORY[0x1D25ECB20](a2);
  uint64_t v5 = MEMORY[0x1E4F14D40];
  if (v4 != MEMORY[0x1E4F14D40])
  {
    char v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  if (xpc_dictionary_get_uint64(a2, "error"))
  {
    char v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  xpc_object_t value = xpc_dictionary_get_value(a2, "event_data");
  uint64_t v8 = value;
  if (!value || MEMORY[0x1D25ECB20](value) != MEMORY[0x1E4F14D18])
  {
    if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
      long long v9 = *(int **)(MEMORY[0x1E4F14C38] + 328);
    }
    else {
      long long v9 = (int *)_os_alloc_once();
    }
    int v10 = *v9;
    if ((*v9 & 2) != 0)
    {
      printf("incorrect event_data: %p", v8);
      int v10 = *v9;
    }
    if ((v10 & 4) != 0) {
      _sr_log("incorrect event_data: %p");
    }
LABEL_15:
    char v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  size_t count = xpc_array_get_count(v8);
  if (count != 1)
  {
    size_t v17 = count;
    if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
      dispatch_time_t v18 = *(int **)(MEMORY[0x1E4F14C38] + 328);
    }
    else {
      dispatch_time_t v18 = (int *)_os_alloc_once();
    }
    int v19 = *v18;
    if ((*v18 & 2) != 0)
    {
      printf("incorrect event_data count: %zu", v17);
      int v19 = *v18;
    }
    if ((v19 & 4) != 0) {
      _sr_log("incorrect event_data count: %zu");
    }
    goto LABEL_15;
  }
  xpc_object_t v13 = xpc_array_get_value(v8, 0);
  int v14 = v13;
  if (!v13 || MEMORY[0x1D25ECB20](v13) != v5)
  {
    if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
      uint64_t v15 = *(int **)(MEMORY[0x1E4F14C38] + 328);
    }
    else {
      uint64_t v15 = (int *)_os_alloc_once();
    }
    int v16 = *v15;
    if ((*v15 & 2) != 0)
    {
      printf("incorrect dict: %p", v14);
      int v16 = *v15;
    }
    if ((v16 & 4) != 0) {
      _sr_log("incorrect dict: %p");
    }
    goto LABEL_15;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v14, "reason_code");
  uint64_t v21 = uint64;
  if (uint64 == -1)
  {
    unint64_t v24 = 0;
    int v23 = 1;
  }
  else
  {
    unint64_t v22 = 0x1000000;
    if (uint64 > 0x1000000) {
      unint64_t v22 = uint64;
    }
    if (v22 >= 0x4000000) {
      unint64_t v22 = 0x4000000;
    }
    if (uint64) {
      int v23 = 2;
    }
    else {
      int v23 = 0;
    }
    if (uint64) {
      unint64_t v24 = v22;
    }
    else {
      unint64_t v24 = 0;
    }
  }
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    int v25 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    int v25 = (int *)_os_alloc_once();
  }
  int v26 = *v25;
  if ((*v25 & 2) != 0)
  {
    printf("actionable new fallback disposition: (dispo/grant/hinted): %d/%llu/%llu", v23, v24, v21);
    int v26 = *v25;
  }
  if ((v26 & 4) != 0) {
    _sr_log("actionable new fallback disposition: (dispo/grant/hinted): %d/%llu/%llu", v23, v24, v21);
  }
  char v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_16:
  v6();
  _Block_release(*(const void **)(a1 + 32));
  xpc_object_t v11 = *(void **)(a1 + 40);

  xpc_release(v11);
}

void ___symptoms_daemon_fallback_subseq_disposition_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  size_t v2 = *(void **)(a1 + 40);

  xpc_release(v2);
}

void ___create_connection_block_invoke(uint64_t a1, const void *a2)
{
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    uint64_t v3 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    uint64_t v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("connection handler received object  %p", a2);
    int v4 = *v3;
  }
  if ((v4 & 4) != 0) {
    _sr_log("connection handler received object  %p", a2);
  }
  if (MEMORY[0x1D25ECB20](a2) == MEMORY[0x1E4F14D58] && _create_connection_connection)
  {
    xpc_connection_cancel((xpc_connection_t)_create_connection_connection);
    if (_create_connection_connection) {
      xpc_release((xpc_object_t)_create_connection_connection);
    }
    _create_connection_connection = 0;
  }
}

dispatch_queue_t ___service_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.symptoms.service.queue", 0);
  _service_queue_service_queue = (uint64_t)result;
  return result;
}

void ___send_with_reply_block_invoke(uint64_t a1)
{
}

void send_current(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 108);
  if ((v2 + 1) > 1) {
    int v3 = v2 + 1;
  }
  else {
    int v3 = 1;
  }
  *(_DWORD *)(a1 + 108) = v3;
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    int v4 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    int v4 = (int *)_os_alloc_once();
  }
  int v5 = *v4;
  if ((*v4 & 2) != 0)
  {
    printf("send_current: ack_id %d\n", *(_DWORD *)(a1 + 108));
    int v5 = *v4;
  }
  if ((v5 & 4) != 0) {
    _sr_log("send_current: ack_id %d\n", *(_DWORD *)(a1 + 108));
  }
  char v6 = (char *)malloc_type_malloc(0x28A0uLL, 0x8F63F342uLL);
  if (v6)
  {
    BOOL v7 = v6;
    *((_DWORD *)v6 + 1) = 2359299;
    __int16 v8 = (_WORD)v6 + 8;
    fill_sender_id(a1, (uint64_t)(v6 + 8));
    unint64_t v10 = 10344;
    long long v9 = read_symptoms(a1, v7 + 44, &v10);
    *(_DWORD *)long long v9 = 262184;
    *((_DWORD *)v9 + 1) = *(_DWORD *)(a1 + 108);
    *(_WORD *)BOOL v7 = 1;
    *((_WORD *)v7 + 1) = (_WORD)v9 + 4 - v8 + 8;
    symptom_transport_send(a1, v7, (unsigned __int16)((_WORD)v9 + 4 - v8 + 8) + 4);
    *(unsigned char *)(a1 + 112) = 1;
    ++*(void *)(a1 + 280);
    free(v7);
  }
}

void symptoms_transport_dropped(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    int v3 = *(int **)(MEMORY[0x1E4F14C38] + 328);
  }
  else {
    int v3 = (int *)_os_alloc_once();
  }
  int v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("symptoms_transport_dropped %s\n", *(const char **)(a1 + 24));
    int v4 = *v3;
  }
  if ((v4 & 4) != 0) {
    _sr_log("symptoms_transport_dropped %s\n", *(const char **)(a1 + 24));
  }
  gettimeofday((timeval *)(a1 + 176), 0);
  ++*(_DWORD *)(a1 + 104);
  if (*(void *)(v2 + 320) == -1) {
    int v5 = *(int **)(v2 + 328);
  }
  else {
    int v5 = (int *)_os_alloc_once();
  }
  int v6 = *v5;
  if ((*v5 & 2) != 0)
  {
    printf("reset_sr_filters for %s\n", *(const char **)(a1 + 24));
    int v6 = *v5;
  }
  if ((v6 & 4) != 0) {
    _sr_log("reset_sr_filters for %s\n", *(const char **)(a1 + 24));
  }
  reevaluate_sr_symptoms(a1);
  if (*(void *)(a1 + 80))
  {
    if (*(void *)(v2 + 320) == -1) {
      BOOL v7 = *(int **)(v2 + 328);
    }
    else {
      BOOL v7 = (int *)_os_alloc_once();
    }
    int v8 = *v7;
    if ((*v7 & 2) != 0)
    {
      printf("symptoms_transport_dropped %s, immediate reconnect\n", *(const char **)(a1 + 24));
      int v8 = *v7;
    }
    if ((v8 & 4) != 0) {
      _sr_log("symptoms_transport_dropped %s, immediate reconnect\n", *(const char **)(a1 + 24));
    }
    if (*(unsigned char *)(a1 + 216))
    {
      if (*(void *)(v2 + 320) == -1) {
        long long v9 = *(int **)(v2 + 328);
      }
      else {
        long long v9 = (int *)_os_alloc_once();
      }
      int v10 = *v9;
      if ((*v9 & 2) != 0)
      {
        printf("symptoms_transport_dropped %s, immediate reconnect, but connect queued\n", *(const char **)(a1 + 24));
        int v10 = *v9;
      }
      if ((v10 & 4) != 0) {
        _sr_log("symptoms_transport_dropped %s, immediate reconnect, but connect queued\n", *(const char **)(a1 + 24));
      }
    }
    else
    {
      ensure_symptom_framework_connect(a1);
    }
  }
}

uint64_t reevaluate_sr_symptoms(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = (const void *)result;
    uint64_t v3 = MEMORY[0x1E4F14C38];
    do
    {
      if (*(void *)(v3 + 320) == -1)
      {
        int v4 = *(int **)(v3 + 328);
      }
      else
      {
        dispatch_queue_t result = _os_alloc_once();
        int v4 = (int *)result;
      }
      int v5 = *v4;
      if ((*v4 & 2) != 0)
      {
        dispatch_queue_t result = printf("reevaluate_sr_symptoms: evaluate symptom control %p, id %x\n", (const void *)v1, *(_DWORD *)(v1 + 8));
        int v5 = *v4;
      }
      if ((v5 & 4) != 0) {
        dispatch_queue_t result = _sr_log("reevaluate_sr_symptoms: evaluate symptom control %p, id %x\n", (const void *)v1, *(_DWORD *)(v1 + 8));
      }
      int v16 = 0;
      size_t v17 = &v16;
      if (*(void *)(v3 + 320) == -1)
      {
        int v6 = *(int **)(v3 + 328);
      }
      else
      {
        dispatch_queue_t result = _os_alloc_once();
        int v6 = (int *)result;
      }
      int v7 = *v6;
      if ((*v6 & 2) != 0)
      {
        dispatch_queue_t result = printf("reevaluate_sc_symptoms: sr %p sc %p\n", v2, (const void *)v1);
        int v7 = *v6;
      }
      if ((v7 & 4) != 0) {
        dispatch_queue_t result = _sr_log("reevaluate_sc_symptoms: sr %p sc %p\n", v2, (const void *)v1);
      }
      if (*(unsigned char *)(v1 + 40))
      {
        sym_ctrl_dequeue((uint64_t)v2, v1);
        if (*(void *)(v3 + 320) == -1) {
          int v8 = *(int **)(v3 + 328);
        }
        else {
          int v8 = (int *)_os_alloc_once();
        }
        int v9 = *v8;
        if ((*v8 & 2) != 0)
        {
          puts("reevaluate_sc_symptoms: sc was active, dequeued");
          int v9 = *v8;
        }
        if ((v9 & 4) != 0) {
          _sr_log("reevaluate_sc_symptoms: sc was active, dequeued\n");
        }
        dispatch_queue_t result = dump_symptom_state((uint64_t)v2);
      }
      int v10 = *(const void ***)(v1 + 72);
      if (v10)
      {
        const void *v17 = v10;
        size_t v17 = *(const void ****)(v1 + 80);
        *(void *)(v1 + 72) = 0;
        *(void *)(v1 + 80) = v1 + 72;
      }
      *(void *)(v1 + 64) = 0;
      while (1)
      {
        xpc_object_t v11 = v16;
        if (!v16) {
          break;
        }
        int v16 = (const void **)*v16;
        if (!v16) {
          size_t v17 = &v16;
        }
        update_globals_for_symptom_removal((uint64_t)v2, v11);
        if (*(void *)(v3 + 320) == -1) {
          uint64_t v12 = *(int **)(v3 + 328);
        }
        else {
          uint64_t v12 = (int *)_os_alloc_once();
        }
        int v13 = *v12;
        if ((*v12 & 2) != 0)
        {
          printf("reevaluate_sc_symptoms: evaluate symptom %p\n", v11);
          int v13 = *v12;
        }
        if ((v13 & 4) != 0) {
          _sr_log("reevaluate_sc_symptoms: evaluate symptom %p\n", v11);
        }
        dispatch_queue_t result = handle_symptom(v2, v1, v11);
        if (*(void *)(v3 + 320) == -1)
        {
          int v14 = *(int **)(v3 + 328);
        }
        else
        {
          dispatch_queue_t result = _os_alloc_once();
          int v14 = (int *)result;
        }
        int v15 = *v14;
        if ((*v14 & 2) != 0)
        {
          dispatch_queue_t result = puts("reevaluate_sc_symptoms: after evaluate symptom");
          int v15 = *v14;
        }
        if ((v15 & 4) != 0) {
          dispatch_queue_t result = _sr_log("reevaluate_sc_symptoms: after evaluate symptom\n");
        }
      }
      uint64_t v1 = *(void *)(v1 + 16);
    }
    while (v1);
  }
  return result;
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
      unsigned char *v4 = v6;
      if (!v6) {
        break;
      }
      ++v4;
      ++v3;
      if ((unint64_t)--v5 <= 1)
      {
        unsigned char *v4 = 0;
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

uint64_t __ensure_symptom_framework_connect_block_invoke(uint64_t a1)
{
  if (*(void *)(MEMORY[0x1E4F14C38] + 320) == -1) {
    int v2 = *(int **)(MEMORY[0x1E4F14C38] + 328);
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
  if ((v3 & 4) != 0) {
    _sr_log("ensure_symptom_framework_connect: connect after delay\n");
  }
  uint64_t v4 = *(void *)(a1 + 32);

  return connect_symptom_framework(v4);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40CF6D8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1F40CF3D8]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1F40CF3E0]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1F40D0718]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CF7E0](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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
  return (dispatch_queue_t)MEMORY[0x1F40CF488](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CF500](when, delta);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CF8C8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CF8D0](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0670](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0678](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CF920](__dst, __src, __n);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CF960](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CF968](a1);
}

int rand_r(unsigned int *a1)
{
  return MEMORY[0x1F40CF980](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CF9E8](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CFA00](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CFA20](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CFA60](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CFA68](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CFA70](__s1, __s2, __n);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40D0B80](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40D0BA0](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40D0BF0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
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
  return (xpc_object_t)MEMORY[0x1F40D0CA0](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40D0CD0](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40D0CE8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40D0CF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40D0D00](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40D0D70](object);
}