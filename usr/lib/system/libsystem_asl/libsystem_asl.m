void ___asl_open_default_block_invoke()
{
  uint64_t v0;
  uint64_t vars8;

  v0 = asl_client_open(0, 0, 4u);
  off_26AA46130 = (_UNKNOWN *)v0;
  if (v0) {
    *(_DWORD *)(v0 + 12) = 0;
  }

  _asl_notify_open(0);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  va_start(va, format);
  uint32_t v7 = _asl_evaluate_send(client, msg, level);
  if ((v7 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v7 & 0x80000) != 0)
    {
      int v8 = _asl_lib_vlog_text(client, v7, msg, format, va);
      goto LABEL_8;
    }
  }
  else if ((v7 & 0x1A0000) != 0)
  {
    int v8 = _asl_lib_vlog(client, v7, msg, format, va);
    goto LABEL_8;
  }
  int v8 = 0;
LABEL_8:
  if (v8) {
    return -1;
  }
  else {
    return 0;
  }
}

void _asl_notify_open(int a1)
{
  if (a1)
  {
    pthread_mutex_lock(&stru_26AA460E0);
    LODWORD(_asl_global) = _asl_global + 1;
    if (DWORD2(_asl_global) != -1)
    {
LABEL_15:
      pthread_mutex_unlock(&stru_26AA460E0);
      return;
    }
  }
  else
  {
    LODWORD(_asl_global) = _asl_global + 1;
    if (DWORD2(_asl_global) != -1) {
      return;
    }
  }
  if (DWORD1(_asl_global) == -1 && notify_register_check("com.apple.asl.remote", (int *)&_asl_global + 1)) {
    DWORD1(_asl_global) = -1;
  }
  if (HIDWORD(_asl_global) == -1 && notify_register_plain()) {
    HIDWORD(_asl_global) = -1;
  }
  v2 = asl_remote_notify_name();
  if (v2)
  {
    v3 = v2;
    int v4 = notify_register_plain();
    free(v3);
    if (v4) {
      DWORD2(_asl_global) = -1;
    }
  }
  if (a1) {
    goto LABEL_15;
  }
}

char *asl_remote_notify_name()
{
  getpid();
  v1 = 0;
  if (geteuid()) {
    asprintf(&v1, "user.uid.%d.syslog.%d");
  }
  else {
    asprintf(&v1, "%s.%d");
  }
  return v1;
}

uint64_t asl_client_open(const char *a1, char *a2, unsigned int a3)
{
  v6 = malloc_type_calloc(1uLL, 0x68uLL, 0x10A0040ED89ACDEuLL);
  uint64_t v7 = (uint64_t)v6;
  if (!v6)
  {
    v13 = __error();
LABEL_12:
    int *v13 = 12;
    return v7;
  }
  void *v6 = 0x100000005;
  int v8 = asl_msg_new(0);
  *(void *)(v7 + 32) = v8;
  if (!v8)
  {
    asl_release((asl_object_t)v7);
    v13 = __error();
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  *(_DWORD *)(v7 + 12) = a3;
  *(_DWORD *)(v7 + 16) = getpid();
  *(_DWORD *)(v7 + 20) = getuid();
  *(_DWORD *)(v7 + 24) = getgid();
  if (a1)
  {
LABEL_7:
    asl_msg_set_key_val(*(int **)(v7 + 32), "Sender", a1);
    goto LABEL_8;
  }
  v9 = _NSGetArgv();
  a1 = **v9;
  if (a1)
  {
    v10 = strrchr(**v9, 47);
    if (v10) {
      a1 = v10 + 1;
    }
    goto LABEL_7;
  }
LABEL_8:
  if (a2)
  {
    v11 = *(int **)(v7 + 32);
    v12 = a2;
  }
  else
  {
    v14 = *(int **)(v7 + 32);
    if (*(_DWORD *)(v7 + 20)) {
      int v15 = 8;
    }
    else {
      int v15 = 24;
    }
    v12 = asl_syslog_faciliy_num_to_name(v15);
    v11 = v14;
  }
  asl_msg_set_key_val(v11, "Facility", v12);
  if ((a3 & 0x10000000) != 0) {
    int v16 = 65599;
  }
  else {
    int v16 = 196671;
  }
  *(_DWORD *)(v7 + 40) = ((a3 >> 11) & 0x40000 | v16) ^ 0x40000;
  if (*(unsigned char *)(v7 + 12))
  {
    if (fcntl(2, 1) < 0)
    {
      *(_DWORD *)(v7 + 12) &= ~1u;
    }
    else
    {
      int v17 = fileno((FILE *)*MEMORY[0x263EF8C10]);
      asl_client_add_output_file(v7, v17, "std", "lcl", 255, 1);
    }
  }
  return v7;
}

uint64_t asl_msg_set_key_val_op(int *a1, char *__s1, const char *a3, int a4)
{
  uint64_t v65 = *MEMORY[0x263EF8C08];
  uint64_t v4 = 0xFFFFFFFFLL;
  if (!a1 || !__s1) {
    return v4;
  }
  if (a4) {
    int v8 = ((a4 & 7) == 0) | a4;
  }
  else {
    int v8 = 0;
  }
  if (!strcmp(__s1, "Level"))
  {
    if (a3)
    {
      if ((*a3 & 0xF8) != 0x30 || a3[1])
      {
        if (!strcasecmp(a3, "Emergency"))
        {
          a3 = "0";
        }
        else if (!strcasecmp(a3, "Alert"))
        {
          a3 = "1";
        }
        else if (!strcasecmp(a3, "Critical"))
        {
          a3 = "2";
        }
        else if (!strcasecmp(a3, "Error"))
        {
          a3 = "3";
        }
        else if (!strcasecmp(a3, "Warning"))
        {
          a3 = "4";
        }
        else if (!strcasecmp(a3, "Notice"))
        {
          a3 = "5";
        }
        else if (!strcasecmp(a3, "Info"))
        {
          a3 = "6";
        }
        else
        {
          a3 = "7";
        }
      }
    }
    else
    {
      a3 = "7";
    }
  }
  int v9 = strcmp(__s1, "Message");
  v10 = 0;
  if (!a3 || v9) {
    goto LABEL_34;
  }
  unsigned int v11 = strlen(a3);
  uint64_t v12 = 0;
  do
  {
    if (!(v11 + v12))
    {
      a3 = 0;
      goto LABEL_28;
    }
    int v13 = a3[v11 - 1 + v12--];
  }
  while (v13 == 10);
  unsigned int v14 = v11 + v12 + 1;
  if (v14 >= v11)
  {
LABEL_28:
    v10 = 0;
    goto LABEL_34;
  }
  size_t v15 = v11 + v12 + 1;
  if (v14 <= 0x1FF)
  {
    __memcpy_chk();
    v10 = 0;
    a3 = &v64;
    goto LABEL_33;
  }
  int v16 = (char *)malloc_type_malloc(v11 + v12 + 2, 0xA163A346uLL);
  if (!v16) {
    return 0xFFFFFFFFLL;
  }
  v10 = v16;
  memcpy(v16, a3, v15);
  a3 = v10;
LABEL_33:
  a3[v15] = 0;
LABEL_34:
  int v17 = *a1;
  unsigned int v63 = -1;
  v62 = 0;
  if (v17 == 1 || _asl_msg_index(a1, __s1, &v63, &v62) == -1)
  {
    v20 = a1;
    v21 = __s1;
    v22 = a3;
    __int16 v23 = v8;
LABEL_42:
    uint64_t v4 = _asl_msg_new_key_val_op(v20, v21, v22, v23);
    goto LABEL_43;
  }
  v18 = v62;
  int v61 = v8;
  uint64_t v60 = v63;
  if (!v62) {
    goto LABEL_52;
  }
  if (*v62 == 1)
  {
    if (v63 > 9) {
      goto LABEL_52;
    }
    int v19 = 10;
LABEL_48:
    uint64_t v25 = *((unsigned __int16 *)v62 + v19 + v63 + 16);
    if (v25 == 0xFFFF)
    {
      unsigned int v59 = 0;
      unsigned int v28 = 0;
      v26 = 0;
      v27 = 0;
      LOWORD(v25) = -1;
      if (a3) {
        goto LABEL_54;
      }
      goto LABEL_78;
    }
    if ((v25 & 0xC000) != 0x4000)
    {
      __int16 v29 = *((_WORD *)v62 + v19 + v63 + 16);
      goto LABEL_53;
    }
    unsigned int v59 = 0;
    v26 = 0;
    v27 = *(char **)((char *)v62 + (v25 & 0x3FFF) + 92);
    unsigned int v28 = 8;
    if (!a3) {
      goto LABEL_78;
    }
LABEL_54:
    if (v26 && !strcmp(a3, v26) || v27 && !strcmp(a3, v27))
    {
      uint64_t v4 = 0;
      if (v61 != -1)
      {
        if (v18)
        {
          uint64_t v4 = 0;
          if (v60 <= 9 && *v18 == 1)
          {
            uint64_t v4 = 0;
            *((_WORD *)v18 + v60 + 36) = v61;
          }
        }
      }
      goto LABEL_43;
    }
    uint64_t v30 = v25 & 0x3FFF;
    if (v26 && v30 + v59 == v18[3])
    {
      if (*v18)
      {
        if (v60 > 9 || *v18 != 1) {
          goto LABEL_99;
        }
        int v31 = 10;
      }
      else
      {
        if (v60 >= 0xF)
        {
LABEL_99:
          unsigned int v59 = 0;
          v18[3] = v30;
          goto LABEL_105;
        }
        int v31 = 15;
      }
      *((_WORD *)v18 + (v31 + v60) + 16) = -1;
      goto LABEL_99;
    }
    if (!v27 || v28 + v30 != v18[3]) {
      goto LABEL_105;
    }
    if (*v18)
    {
      int v32 = v60;
      if (v60 > 9 || *v18 != 1) {
        goto LABEL_104;
      }
      int v33 = 10;
    }
    else
    {
      int v32 = v60;
      if (v60 >= 0xF)
      {
LABEL_104:
        v18[3] = v30;
        *((void *)v18 + 2) += ~strlen(v27);
        free(v27);
        unsigned int v28 = 0;
        v27 = 0;
LABEL_105:
        int v38 = strlen(a3);
        size_t v39 = (v38 + 1);
        if (v39 <= 0xDC) {
          unsigned int v40 = v38 + 1;
        }
        else {
          unsigned int v40 = 8;
        }
        if (v27 && v40 <= v28)
        {
          *((void *)v62 + 2) += ~strlen(v27);
          free(v27);
          goto LABEL_113;
        }
        if (!v27 && v40 <= v59)
        {
LABEL_113:
          if (v39 >= 0xDD)
          {
            v41 = strdup(a3);
            if (v41)
            {
              v42 = v41;
              size_t v43 = strlen(v41);
              v44 = v62;
              *((void *)v62 + 2) += v43 + 1;
              if (*v44)
              {
                int v45 = v61;
                if (v63 > 9 || *v44 != 1) {
                  goto LABEL_141;
                }
                int v46 = 10;
              }
              else
              {
                int v45 = v61;
                if (v63 >= 0xF)
                {
LABEL_141:
                  *(void *)((char *)v44 + v30 + 92) = v42;
LABEL_146:
                  if (v45 != -1 && v62)
                  {
                    uint64_t v4 = 0;
                    if (v63 <= 9 && *v62 == 1)
                    {
                      uint64_t v4 = 0;
                      *((_WORD *)v62 + v63 + 36) = v45;
                    }
                    goto LABEL_43;
                  }
                  goto LABEL_176;
                }
                int v46 = 15;
              }
              *((_WORD *)v44 + v46 + v63 + 16) = v30 | 0x4000;
              goto LABEL_141;
            }
LABEL_137:
            uint64_t v4 = 0xFFFFFFFFLL;
            goto LABEL_43;
          }
          v47 = v62;
          if (v62)
          {
            if (*v62)
            {
              if (v63 > 9 || *v62 != 1) {
                goto LABEL_145;
              }
              int v48 = 10;
              goto LABEL_144;
            }
            if (v63 < 0xF)
            {
              int v48 = 15;
LABEL_144:
              *((_WORD *)v62 + v48 + v63 + 16) = v30;
            }
          }
LABEL_145:
          memcpy((char *)v47 + v30 + 92, a3, v39);
          int v45 = v61;
          goto LABEL_146;
        }
        v49 = v62;
        if (v27)
        {
          *((void *)v62 + 2) += ~strlen(v27);
          free(v27);
          v49 = v62;
        }
        uint64_t v50 = v49[3];
        if (v40 > 220 - (int)v50)
        {
          uint64_t v51 = v63;
          int v52 = *v49;
          if (*v49)
          {
            __int16 v23 = v61;
            if (v63 > 9 || v52 != 1)
            {
LABEL_159:
              if (v51 <= 9 && v52 == 1) {
                *((_WORD *)v49 + v51 + 36) = 0;
              }
              goto LABEL_162;
            }
            int v53 = 10;
          }
          else
          {
            __int16 v23 = v61;
            if (v63 >= 0xF)
            {
LABEL_162:
              v20 = a1;
              v21 = __s1;
              v22 = a3;
              goto LABEL_42;
            }
            int v53 = 15;
          }
          *((_WORD *)v49 + v63 + 16) = -1;
          *((_WORD *)v49 + (v53 + v51) + 16) = -1;
          goto LABEL_159;
        }
        v49[3] = v50 + v40;
        if (v39 >= 0xDD)
        {
          v54 = strdup(a3);
          if (!v54) {
            goto LABEL_137;
          }
          v55 = v54;
          *((void *)v49 + 2) += strlen(v54) + 1;
          if (*v49)
          {
            int v56 = v61;
            if (v63 > 9 || *v49 != 1) {
              goto LABEL_170;
            }
            int v57 = 10;
          }
          else
          {
            int v56 = v61;
            if (v63 >= 0xF)
            {
LABEL_170:
              *(void *)((char *)v49 + v50 + 92) = v55;
              goto LABEL_171;
            }
            int v57 = 15;
          }
          *((_WORD *)v49 + v57 + v63 + 16) = v50 | 0x4000;
          goto LABEL_170;
        }
        if (*v49)
        {
          if (v63 > 9 || *v49 != 1) {
            goto LABEL_166;
          }
          int v58 = 10;
        }
        else
        {
          if (v63 >= 0xF)
          {
LABEL_166:
            memcpy((char *)v49 + v50 + 92, a3, v39);
            int v56 = v61;
LABEL_171:
            if (v56 != -1 && v62)
            {
              uint64_t v4 = 0;
              if (v63 <= 9 && *v62 == 1)
              {
                uint64_t v4 = 0;
                *((_WORD *)v62 + v63 + 36) = v56;
              }
              goto LABEL_43;
            }
LABEL_176:
            uint64_t v4 = 0;
            goto LABEL_43;
          }
          int v58 = 15;
        }
        *((_WORD *)v49 + v58 + v63 + 16) = v50;
        goto LABEL_166;
      }
      int v33 = 15;
    }
    *((_WORD *)v18 + (v33 + v32) + 16) = -1;
    goto LABEL_104;
  }
  if (!*v62 && v63 < 0xF)
  {
    int v19 = 15;
    goto LABEL_48;
  }
LABEL_52:
  LODWORD(v25) = 0;
  __int16 v29 = 0;
LABEL_53:
  v26 = (char *)v62 + v25 + 92;
  unsigned int v28 = 0;
  v27 = 0;
  unsigned int v59 = strlen(v26) + 1;
  LOWORD(v25) = v29;
  if (a3) {
    goto LABEL_54;
  }
LABEL_78:
  if (v27)
  {
    *((void *)v62 + 2) += ~strlen(v27);
    free(v27);
    v18 = v62;
    unsigned int v34 = v63;
    int v35 = v61;
    if (!v62) {
      goto LABEL_176;
    }
  }
  else
  {
    int v35 = v61;
    unsigned int v34 = v63;
    if (!v62) {
      goto LABEL_176;
    }
  }
  int v36 = *v18;
  if (*v18)
  {
    if (v34 <= 9 && v36 == 1)
    {
      int v37 = 10;
      goto LABEL_88;
    }
  }
  else if (v34 < 0xF)
  {
    int v37 = 15;
LABEL_88:
    *((_WORD *)v18 + v37 + v34 + 16) = -1;
  }
  if (v35 == -1) {
    goto LABEL_176;
  }
  uint64_t v4 = 0;
  if (v34 <= 9 && v36 == 1)
  {
    uint64_t v4 = 0;
    *((_WORD *)v18 + v34 + 36) = v35;
  }
LABEL_43:
  if (v10) {
    free(v10);
  }
  return v4;
}

uint64_t asl_msg_set_key_val(int *a1, char *a2, const char *a3)
{
  return asl_msg_set_key_val_op(a1, a2, a3, 0);
}

uint64_t _asl_msg_new_key_val_op(int *a1, char *__s, const char *a3, __int16 a4)
{
  v6 = a1;
  int v7 = *a1;
  if (*a1 == 1) {
    unsigned int v8 = 10;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v7) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 15;
  }
  int v33 = 0;
  __src = 0;
  unsigned int v10 = strlen(__s);
  int v11 = _asl_msg_std_key(__s, v10);
  if (v11) {
    unsigned int v12 = 0;
  }
  else {
    unsigned int v12 = v10 + 1;
  }
  if (a3)
  {
    unsigned int v13 = strlen(a3) + 1;
    uint64_t v30 = v13;
  }
  else
  {
    unsigned int v13 = 0;
    uint64_t v30 = 0;
  }
  if (v12 < 0xDD)
  {
    unsigned int v14 = 0;
  }
  else
  {
    unsigned int v14 = strdup(__s);
    __src = v14;
    unsigned int v12 = 8;
  }
  int v32 = v11;
  if (v13 < 0xDD)
  {
    size_t v15 = 0;
  }
  else
  {
    size_t v15 = strdup(a3);
    int v33 = v15;
    unsigned int v13 = 8;
  }
  unsigned int v16 = v13 + v12;
  if (v12 && v16 >= 0xDD && !v15)
  {
    size_t v15 = strdup(a3);
    int v33 = v15;
    unsigned int v16 = v12 + 8;
    unsigned int v13 = 8;
  }
  if (v16 >= 0xDD && !v14)
  {
    unsigned int v14 = strdup(__s);
    __src = v14;
    unsigned int v16 = v13 + 8;
    unsigned int v12 = 8;
  }
  if (v16 > 0xDC)
  {
LABEL_27:
    if (v14) {
      free(v14);
    }
    if (v15) {
      free(v15);
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v18 = v10;
  while (1)
  {
    int v19 = (char *)v6;
    if (v16 <= 220 - v6[3] && v9 != 0) {
      break;
    }
LABEL_43:
    v6 = (int *)*((void *)v19 + 3);
    if (!v6)
    {
      uint64_t v23 = v18;
      page = _asl_msg_make_page(v7);
      if (!page) {
        goto LABEL_27;
      }
      LODWORD(v21) = 0;
      *((void *)v19 + 3) = page;
      int v19 = page;
      LOWORD(v25) = v32;
      uint64_t v18 = v23;
      if (!v32) {
        goto LABEL_48;
      }
      goto LABEL_51;
    }
  }
  unint64_t v21 = 0;
  int v22 = *(_DWORD *)v19;
  while (v22 && (v22 != 1 || v21 > 9) || *(__int16 *)&v19[2 * v21 + 32] != -1)
  {
    if (v9 == ++v21) {
      goto LABEL_43;
    }
  }
  LOWORD(v25) = v32;
  if (!v32)
  {
LABEL_48:
    uint64_t v25 = *((unsigned int *)v19 + 3);
    if (v14)
    {
      uint64_t v26 = v18;
      memcpy(&v19[v25 + 92], &__src, v12);
      *((void *)v19 + 2) += v26;
      LOWORD(v25) = v25 | 0x4000;
    }
    else
    {
      memcpy(&v19[v25 + 92], __s, v12);
    }
  }
LABEL_51:
  int v27 = *(_DWORD *)v19;
  if (!*(_DWORD *)v19 || v21 <= 9 && v27 == 1) {
    *(_WORD *)&v19[2 * v21 + 32] = v25;
  }
  unsigned int v28 = *((_DWORD *)v19 + 3) + v12;
  *((_DWORD *)v19 + 3) = v28;
  if (a3)
  {
    if (v33)
    {
      memcpy(&v19[v28 + 92], &v33, v13);
      *((void *)v19 + 2) += v30;
      LOWORD(v28) = v28 | 0x4000;
    }
    else
    {
      memcpy(&v19[v28 + 92], a3, v13);
    }
    int v27 = *(_DWORD *)v19;
    if (*(_DWORD *)v19)
    {
      if (v21 > 9 || v27 != 1) {
        goto LABEL_65;
      }
      int v29 = 10;
    }
    else
    {
      int v29 = 15;
    }
    *(_WORD *)&v19[2 * (v29 + v21) + 32] = v28;
LABEL_65:
    *((_DWORD *)v19 + 3) += v13;
  }
  if (v21 <= 9 && v27 == 1) {
    *(_WORD *)&v19[2 * (v21 + 20) + 32] = a4;
  }
  uint64_t result = 0;
  ++*((_DWORD *)v19 + 2);
  return result;
}

void syslog(int a1, const char *a2, ...)
{
  va_start(va, a2);
  _vsyslog(a1, a2, va);
}

double _jump_alloc()
{
  v0 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
  if (v0)
  {
    *(void *)&double result = 0x100000002;
    void *v0 = 0x100000002;
  }
  return result;
}

char *_jump_alloc_0(int a1)
{
  double result = _asl_msg_make_page(a1);
  if (result)
  {
    *(_DWORD *)double result = a1;
    *((_DWORD *)result + 1) = 1;
  }
  return result;
}

char *_asl_msg_make_page(int a1)
{
  v2 = (char *)malloc_type_calloc(1uLL, 0x138uLL, 0x1020040D2F95E9BuLL);
  v3 = v2;
  if (v2)
  {
    if (a1 == 1) {
      int v4 = 20;
    }
    else {
      int v4 = 0;
    }
    if (!a1) {
      int v4 = 30;
    }
    if (v4) {
      memset(v2 + 32, 255, (2 * v4));
    }
    *((void *)v3 + 2) = 312;
    *(_DWORD *)v3 = a1;
  }
  return v3;
}

void _vsyslog(__int16 a1, const char *a2, va_list a3)
{
  int v5 = a1 & 7;
  int v6 = a1 & 0x3F8;
  pthread_mutex_lock(&_sl_lock);
  int v7 = (__asl_object_s *)_sl_asl;
  if (!_sl_asl)
  {
    _sl_asl = (uint64_t)asl_open(0, 0, 0x10000u);
    _sl_mask = 255;
    asl_set_filter((asl_object_t)_sl_asl, 255);
    int v7 = (__asl_object_s *)_sl_asl;
  }
  unsigned int v8 = asl_retain(v7);
  pthread_mutex_unlock(&_sl_lock);
  uint64_t v9 = asl_new(0);
  if (v6)
  {
    unsigned int v10 = asl_syslog_faciliy_num_to_name(v6);
    if (v10) {
      asl_set(v9, "Facility", v10);
    }
  }
  uint32_t v11 = _asl_evaluate_send(v8, v9, v5);
  if ((v11 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v11 & 0x80000) != 0) {
      _asl_lib_vlog_text(v8, v11, v9, a2, a3);
    }
  }
  else if ((v11 & 0x1A0000) != 0)
  {
    _asl_lib_vlog(v8, v11, v9, a2, a3);
  }
  asl_release(v8);
  asl_release(v9);
}

void asl_release(asl_object_t obj)
{
  if (obj && *(_DWORD *)obj <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_42);
    }
    if (atomic_fetch_add((atomic_uint *volatile)obj + 1, 0xFFFFFFFF) == 1)
    {
      v2 = *(void (**)(asl_object_t))(asl_jump[*(unsigned int *)obj] + 8);
      if (v2)
      {
        v2(obj);
      }
    }
  }
}

uint32_t _asl_evaluate_send(asl_object_t client, asl_object_t msg, int level)
{
  int check = 0;
  __s1 = 0;
  uint64_t state64 = 0;
  if (level < 0) {
    unsigned int v5 = 7;
  }
  else {
    unsigned int v5 = level;
  }
  if (asl_msg_lookup(msg, "Level", (int **)&__s1, 0)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = __s1 == 0;
  }
  if (!v6) {
    unsigned int v5 = atoi(__s1);
  }
  if (v5 >= 7) {
    unsigned int v5 = 7;
  }
  if (client)
  {
    if (asl_get_type(client) != 5) {
      return v5 | 0x30000;
    }
    if (*((void *)client + 8)) {
      return v5 | 0x100000;
    }
  }
  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    client = (asl_object_t)off_26AA46130;
    if (!off_26AA46130) {
      return v5 | 0x50000;
    }
  }
  int control = asl_client_get_control((uint64_t)client);
  unsigned int v9 = *((_DWORD *)client + 10);
  unsigned int v10 = control & 0xFFFF0000 | v5 | (*((_DWORD *)client + 10) << 13) & 0x200000;
  if ((*((unsigned char *)client + 12) & 4) == 0)
  {
    pthread_mutex_lock(&stru_26AA460E0);
    if ((DWORD1(_asl_global) & 0x80000000) == 0)
    {
      int check = 0;
      if (!notify_check(SDWORD1(_asl_global), &check))
      {
        if (check)
        {
          if ((HIDWORD(_asl_global) & 0x80000000) == 0)
          {
            uint64_t state64 = 0;
            if (!notify_get_state(SHIDWORD(_asl_global), &state64)) {
              qword_26AA460A8 = state64;
            }
          }
          if ((DWORD2(_asl_global) & 0x80000000) == 0)
          {
            uint64_t state64 = 0;
            if (!notify_get_state(SDWORD2(_asl_global), &state64)) {
              qword_26AA460A0 = state64;
            }
          }
        }
      }
    }
    if ((qword_26AA460A8 & 0x10000) != 0)
    {
      unsigned int v10 = v10 & 0xFFD90007 | qword_26AA460A8 & 0x60000 | 0x200000;
      int v11 = qword_26AA460A0;
      if ((_BYTE)qword_26AA460A8) {
        unsigned int v9 = qword_26AA460A0;
      }
    }
    else
    {
      int v11 = qword_26AA460A0;
    }
    if ((v11 & 0x10000) != 0)
    {
      unsigned int v10 = v10 & 0xFFF1FFFF | v11 & 0xE0000 | 0x200000;
      if ((_BYTE)v11) {
        unsigned int v9 = v11;
      }
    }
    pthread_mutex_unlock(&stru_26AA460E0);
  }
  unsigned int v12 = v10 & 0xFFFDFFFF;
  if ((v9 >> v5)) {
    unsigned int v12 = v10;
  }
  if (!v9) {
    unsigned int v12 = v10;
  }
  if (*((_DWORD *)client + 13)) {
    int v13 = v12 | 0x80000;
  }
  else {
    int v13 = v12;
  }
  __s1 = 0;
  int v14 = asl_msg_lookup(msg, "com.apple.message.domain", (int **)&__s1, 0);
  if (__s1) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15) {
    unsigned int v16 = v13 & 0xFF7BFFFF | 0x800000;
  }
  else {
    unsigned int v16 = v13;
  }
  __s1 = 0;
  int v17 = asl_msg_lookup(msg, "com.apple.iokit.domain", (int **)&__s1, 0);
  uint64_t v18 = __s1;
  __s1 = 0;
  int v19 = asl_msg_lookup(msg, "ASLOption", (int **)&__s1, 0);
  v20 = __s1;
  __s1 = 0;
  if (asl_msg_lookup(msg, "CFLog Local Time", (int **)&__s1, 0)) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = __s1 == 0;
  }
  int v22 = !v21;
  if (v19) {
    BOOL v23 = 1;
  }
  else {
    BOOL v23 = v20 == 0;
  }
  if (!v23) {
    int v22 = 1;
  }
  if (v17) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v18 == 0;
  }
  if (!v24) {
    int v22 = 1;
  }
  if (v22) {
    uint32_t v7 = v16 & 0xFFFBFFFF;
  }
  else {
    uint32_t v7 = v16;
  }
  __s1 = 0;
  if (!asl_msg_lookup(msg, "Facility", (int **)&__s1, 0) && (uint64_t v25 = __s1) != 0
    || !asl_msg_lookup(*((_DWORD **)client + 4), "Facility", (int **)&__s1, 0) && (uint64_t v25 = __s1) != 0)
  {
    if (!strcmp(v25, "com.apple.system.lastlog") || !strcmp(v25, "com.apple.system.utmpx")) {
      uint32_t v7 = v16 & 0xFFFBFFFF;
    }
    uint64_t v26 = asl_syslog_faciliy_num_to_name(112);
    if (!strcmp(v25, v26)) {
      return v16 & 0xFFFBFFFF;
    }
  }
  return v7;
}

uint64_t asl_msg_lookup(_DWORD *a1, char *a2, int **a3, _WORD *a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  uint64_t v6 = 0xFFFFFFFFLL;
  unsigned int v10 = -1;
  unsigned int v9 = 0;
  if (_asl_msg_index(a1, a2, &v10, &v9) != -1)
  {
    if (a3) {
      *a3 = _asl_msg_slot_val(v9, v10);
    }
    if (a4)
    {
      if (v9)
      {
        __int16 v7 = 0;
        if (v10 <= 9 && *v9 == 1) {
          __int16 v7 = *((_WORD *)v9 + v10 + 36);
        }
      }
      else
      {
        __int16 v7 = 0;
      }
      uint64_t v6 = 0;
      *a4 = v7;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t _asl_msg_index(_DWORD *a1, char *__s, _DWORD *a3, void *a4)
{
  if (!__s) {
    return 0xFFFFFFFFLL;
  }
  __int16 v7 = a1;
  if (*a1 == 1) {
    int v8 = 10;
  }
  else {
    int v8 = 0;
  }
  if (*a1) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 15;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = a1;
  }
  unsigned int v10 = strlen(__s);
  int v11 = _asl_msg_std_key(__s, v10);
  int v12 = 0;
  while (2)
  {
    uint64_t v13 = 0;
    int v14 = v7 + 23;
    do
    {
      int v15 = *v7;
      if (*v7 == 1)
      {
        if (v13 > 9) {
          goto LABEL_22;
        }
      }
      else
      {
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = v13 >= 0xF;
        }
        if (v16) {
          goto LABEL_22;
        }
      }
      if (*((__int16 *)v7 + v13 + 16) == -1) {
        goto LABEL_49;
      }
LABEL_22:
      if (v11)
      {
        if (v15 == 1)
        {
          if (v13 > 9)
          {
LABEL_26:
            int v17 = 0;
            goto LABEL_33;
          }
        }
        else if (v15 || v13 >= 0xF)
        {
          goto LABEL_26;
        }
        int v17 = *((unsigned __int16 *)v7 + v13 + 16);
LABEL_33:
        if (v17 == v11) {
          return (v12 + v13);
        }
        goto LABEL_49;
      }
      if (v15 == 1)
      {
        if (v13 > 9) {
          goto LABEL_46;
        }
      }
      else if (v15 || v13 >= 0xF)
      {
        goto LABEL_46;
      }
      uint64_t v18 = (char *)v7 + 2 * v13;
      if ((*((_WORD *)v18 + 16) & 0xC000) == 0x8000) {
        goto LABEL_49;
      }
      if (v15 == 1 && v13 > 9) {
        goto LABEL_46;
      }
      __int16 v19 = *((_WORD *)v18 + 16);
      if ((v19 & 0xC000) != 0x4000)
      {
        if (v15 == 1 && v13 > 9) {
LABEL_46:
        }
          uint64_t v21 = 0;
        else {
          uint64_t v21 = *((unsigned __int16 *)v18 + 16);
        }
        v20 = (char *)v14 + v21;
        goto LABEL_48;
      }
      if (v15 && v13 > 9) {
        __int16 v19 = 0;
      }
      v20 = *(const char **)((char *)v14 + (v19 & 0x3FFF));
LABEL_48:
      if (!strcmp(__s, v20)) {
        return (v12 + v13);
      }
LABEL_49:
      ++v13;
      if (a3) {
        *a3 = v13;
      }
    }
    while (v13 < v9);
    __int16 v7 = (_DWORD *)*((void *)v7 + 3);
    if (v7)
    {
      if (a3) {
        *a3 = 0;
      }
      if (a4) {
        *a4 = v7;
      }
      v12 += v13;
      continue;
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t _asl_msg_std_key(char *__s1, unsigned int a2)
{
  if (a2 >= 0x13 && !strncmp(__s1, "com.apple.message.", 0x12uLL))
  {
    unsigned int v5 = __s1 + 18;
    if (!strcmp(v5, "domain"))
    {
      return (unsigned __int16)-32511;
    }
    else if (!strcmp(v5, "domain_scope"))
    {
      return (unsigned __int16)-32510;
    }
    else if (!strcmp(v5, "result"))
    {
      return (unsigned __int16)-32509;
    }
    else if (!strcmp(v5, "signature"))
    {
      return (unsigned __int16)-32508;
    }
    else if (!strcmp(v5, "signature2"))
    {
      return (unsigned __int16)-32507;
    }
    else if (!strcmp(v5, "signature3"))
    {
      return (unsigned __int16)-32506;
    }
    else if (!strcmp(v5, "success"))
    {
      return (unsigned __int16)-32505;
    }
    else if (!strcmp(v5, "uuid"))
    {
      return (unsigned __int16)-32504;
    }
    else if (!strcmp(v5, "value"))
    {
      return (unsigned __int16)-32503;
    }
    else if (!strcmp(v5, "value2"))
    {
      return (unsigned __int16)-32502;
    }
    else if (!strcmp(v5, "value3"))
    {
      return (unsigned __int16)-32501;
    }
    else if (!strcmp(v5, "value4"))
    {
      return (unsigned __int16)-32500;
    }
    else if (!strcmp(v5, "value5"))
    {
      return (unsigned __int16)-32499;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    switch(a2)
    {
      case 3u:
        if (!strcmp(__s1, "PID"))
        {
          unsigned __int16 v4 = -32762;
        }
        else if (!strcmp(__s1, "UID"))
        {
          unsigned __int16 v4 = -32761;
        }
        else
        {
          if (strcmp(__s1, "GID")) {
            goto LABEL_7;
          }
          unsigned __int16 v4 = -32760;
        }
        break;
      case 4u:
LABEL_7:
        if (!strcmp(__s1, "Time"))
        {
          unsigned __int16 v4 = -32767;
        }
        else
        {
          if (strcmp(__s1, "Host")) {
            goto LABEL_9;
          }
          unsigned __int16 v4 = -32765;
        }
        break;
      case 5u:
LABEL_9:
        if (strcmp(__s1, "Level")) {
          goto LABEL_10;
        }
        unsigned __int16 v4 = -32759;
        break;
      case 6u:
LABEL_10:
        if (!strcmp(__s1, "Sender"))
        {
          unsigned __int16 v4 = -32764;
        }
        else
        {
          if (strcmp(__s1, "RefPID")) {
            goto LABEL_12;
          }
          unsigned __int16 v4 = -32754;
        }
        break;
      case 7u:
LABEL_12:
        if (!strcmp(__s1, "Message"))
        {
          unsigned __int16 v4 = -32758;
        }
        else if (!strcmp(__s1, "Session"))
        {
          unsigned __int16 v4 = -32755;
        }
        else if (!strcmp(__s1, "ReadUID"))
        {
          unsigned __int16 v4 = -32757;
        }
        else if (!strcmp(__s1, "ReadGID"))
        {
          unsigned __int16 v4 = -32756;
        }
        else
        {
          if (strcmp(__s1, "RefProc")) {
            goto LABEL_17;
          }
          unsigned __int16 v4 = -32753;
        }
        break;
      case 8u:
LABEL_17:
        if (strcmp(__s1, "Facility")) {
          goto LABEL_18;
        }
        unsigned __int16 v4 = -32763;
        break;
      case 9u:
LABEL_18:
        if (strcmp(__s1, "ASLOption")) {
          goto LABEL_19;
        }
        unsigned __int16 v4 = -32750;
        break;
      case 0xBu:
LABEL_19:
        if (strcmp(__s1, "TimeNanoSec")) {
          goto LABEL_20;
        }
        unsigned __int16 v4 = -32766;
        break;
      case 0xCu:
LABEL_20:
        if (strcmp(__s1, "ASLMessageID")) {
          goto LABEL_21;
        }
        unsigned __int16 v4 = -32752;
        break;
      case 0xDu:
LABEL_21:
        if (strcmp(__s1, "ASLExpireTime")) {
          goto LABEL_22;
        }
        unsigned __int16 v4 = -32751;
        break;
      case 0xEu:
LABEL_22:
        if (strcmp(__s1, "ASLFreeNotify")) {
          goto LABEL_23;
        }
        unsigned __int16 v4 = -32749;
        break;
      default:
LABEL_23:
        unsigned __int16 v4 = 0;
        break;
    }
  }
  return v4;
}

char *asl_syslog_faciliy_num_to_name(int a1)
{
  if (a1 < 0) {
    return 0;
  }
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1;
  unsigned int v1 = v2 >> 3;
  if (v1 > 0x18) {
    return 0;
  }
  else {
    return off_264104A18[v1];
  }
}

uint64_t asl_client_get_control(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 40);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

int *_asl_msg_slot_val(int *result, unsigned int a2)
{
  if (!result) {
    return result;
  }
  int v2 = *result;
  if (a2 >= 0xF && !v2 || a2 >= 0xA && v2 == 1) {
    return 0;
  }
  if (v2 == 1)
  {
    if (a2 <= 9)
    {
      int v3 = 10;
      goto LABEL_13;
    }
LABEL_17:
    unsigned int v4 = 0;
    return (int *)((char *)result + v4 + 92);
  }
  if (v2 || a2 >= 0xF) {
    goto LABEL_17;
  }
  int v3 = 15;
LABEL_13:
  unsigned int v4 = *((unsigned __int16 *)result + v3 + a2 + 16);
  if (v4 == 0xFFFF) {
    return 0;
  }
  if ((v4 & 0xC000) != 0x4000)
  {
    if ((v4 & 0xC000) != 0) {
      return 0;
    }
    return (int *)((char *)result + v4 + 92);
  }
  return *(int **)((char *)result + (v4 & 0x3FFF) + 92);
}

uint32_t asl_get_type(asl_object_t obj)
{
  if (obj) {
    return *(_DWORD *)obj;
  }
  else {
    return -1;
  }
}

asl_object_t asl_retain(asl_object_t obj)
{
  if (obj) {
    atomic_fetch_add((atomic_uint *volatile)obj + 1, 1u);
  }
  return obj;
}

asl_object_t asl_new(uint32_t type)
{
  if (type > 6) {
    return 0;
  }
  uint64_t v1 = *(void *)&type;
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_45);
  }
  int v2 = *(uint64_t (**)(uint64_t))asl_jump[v1];
  if (!v2) {
    return 0;
  }

  return (asl_object_t)v2(v1);
}

void _jump_dealloc_0(void *a1)
{
  if (a1)
  {
    int v2 = (void *)a1[2];
    if (v2)
    {
      if (*((_DWORD *)a1 + 2))
      {
        unint64_t v3 = 0;
        do
          asl_msg_release(*(asl_object_t *)(a1[2] + 8 * v3++));
        while (v3 < *((unsigned int *)a1 + 2));
        int v2 = (void *)a1[2];
      }
      free(v2);
    }
    free(a1);
  }
}

void _jump_dealloc_1(_DWORD *a1)
{
  if (a1)
  {
    if (a1[3] == 1)
    {
      int v2 = (void **)*((void *)a1 + 14);
      asl_legacy1_close(v2);
    }
    else
    {
      unint64_t v3 = (void *)*((void *)a1 + 3);
      if (v3)
      {
        do
        {
          unsigned int v4 = (void *)v3[2];
          free(v3);
          *((void *)a1 + 3) = v4;
          unint64_t v3 = v4;
        }
        while (v4);
      }
      free(*((void **)a1 + 4));
      unsigned int v5 = (FILE *)*((void *)a1 + 13);
      if (v5) {
        fclose(v5);
      }
      uint64_t v6 = (void *)*((void *)a1 + 15);
      if (v6) {
        free(v6);
      }
      *((_OWORD *)a1 + 6) = 0u;
      *((_OWORD *)a1 + 7) = 0u;
      *((_OWORD *)a1 + 4) = 0u;
      *((_OWORD *)a1 + 5) = 0u;
      *((_OWORD *)a1 + 2) = 0u;
      *((_OWORD *)a1 + 3) = 0u;
      *(_OWORD *)a1 = 0u;
      *((_OWORD *)a1 + 1) = 0u;
      free(a1);
    }
  }
}

void _jump_dealloc_2(char *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    while (1)
    {
      int v2 = (char *)*((void *)v1 + 3);
      unsigned int v3 = *(_DWORD *)v1 == 1 ? 10 : 0;
      uint64_t v4 = *(_DWORD *)v1 ? v3 : 15;
      if (v4) {
        break;
      }
LABEL_30:
      free(v1);
      uint64_t v1 = v2;
      if (!v2) {
        return;
      }
    }
    unint64_t v5 = 0;
    uint64_t v6 = v1 + 92;
    while (1)
    {
      int v7 = *(_DWORD *)v1;
      if (!*(_DWORD *)v1) {
        break;
      }
      if (v7 != 1)
      {
        int v8 = 0;
        if (!v7)
        {
LABEL_20:
          uint64_t v9 = 15;
LABEL_21:
          __int16 v10 = *(_WORD *)&v1[2 * v5 + 32 + 2 * v9];
          goto LABEL_22;
        }
LABEL_15:
        if (v7 == 1 && v5 <= 9)
        {
          uint64_t v9 = 10;
          goto LABEL_21;
        }
        __int16 v10 = 0;
LABEL_22:
        if (v8 == 32787)
        {
          int v11 = _asl_msg_slot_val((int *)v1, v5);
          if (v11) {
            notify_post((const char *)v11);
          }
        }
        else if ((v8 & 0xC000) == 0x4000)
        {
          free(*(void **)&v6[v8 & 0x3FFF]);
        }
        if ((v10 & 0xC000) == 0x4000) {
          free(*(void **)&v6[v10 & 0x3FFF]);
        }
        goto LABEL_29;
      }
      if (v5 <= 9) {
        break;
      }
LABEL_29:
      if (v4 == ++v5) {
        goto LABEL_30;
      }
    }
    int v8 = *(unsigned __int16 *)&v1[2 * v5 + 32];
    if (!v7) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
}

void _jump_dealloc_3(void *a1)
{
  if (a1)
  {
    int v2 = (void *)a1[2];
    if (v2) {
      free(v2);
    }
    a1[2] = 0;
    asl_store_file_closeall((uint64_t)a1);
    unsigned int v3 = (FILE *)a1[3];
    if (v3) {
      fclose(v3);
    }
    free(a1);
  }
}

char *asl_msg_new(int a1)
{
  double result = _asl_msg_make_page(a1);
  if (result)
  {
    *(_DWORD *)double result = a1;
    *((_DWORD *)result + 1) = 1;
  }
  return result;
}

int asl_set_filter(asl_object_t client, int f)
{
  __int16 v2 = f;
  if (!client)
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    unint64_t v5 = off_26AA46130;
    if (off_26AA46130)
    {
      pthread_mutex_lock(&stru_26AA460E0);
      int v6 = asl_client_set_filter((uint64_t)v5, v2);
      pthread_mutex_unlock(&stru_26AA460E0);
      return v6;
    }
    return -1;
  }
  if (asl_get_type(client) != 5) {
    return -1;
  }

  return asl_client_set_filter((uint64_t)client, v2);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  char v3 = opts;
  uint64_t v4 = asl_client_open(ident, (char *)facility, opts);
  unint64_t v5 = (__asl_object_s *)v4;
  if ((v3 & 4) == 0 && v4) {
    _asl_notify_open(1);
  }
  return v5;
}

uint64_t asl_client_set_filter(uint64_t a1, __int16 a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = *(unsigned __int16 *)(a1 + 40);
  *(_WORD *)(a1 + 40) = a2;
  return result;
}

void *_asl_object_init()
{
  asl_jump[0] = (uint64_t)asl_msg_jump_table();
  qword_26AA46150 = (uint64_t)asl_msg_jump_table();
  qword_26AA46158 = (uint64_t)asl_msg_list_jump_table();
  qword_26AA46160 = (uint64_t)asl_file_jump_table();
  qword_26AA46168 = (uint64_t)asl_store_jump_table();
  uint64_t result = asl_client_jump_table();
  qword_26AA46170 = (uint64_t)result;
  return result;
}

uint64_t (**asl_msg_jump_table())()
{
  return &asl_msg_jump_table_jump;
}

void *asl_store_jump_table()
{
  return &asl_store_jump_table_jump;
}

uint64_t (**asl_msg_list_jump_table())()
{
  return &asl_msg_list_jump_table_jump;
}

void *asl_file_jump_table()
{
  return &asl_file_jump_table_jump;
}

void *asl_client_jump_table()
{
  return &asl_client_jump_table_jump;
}

void asl_client_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

uint64_t asl_client_add_output_file(uint64_t a1, int a2, const char *a3, const char *a4, int a5, int a6)
{
  if (!a1) {
    return 9999;
  }
  uint64_t v12 = *(unsigned int *)(a1 + 52);
  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)(a1 + 56);
    while (*(_DWORD *)(v14 + v13) != a2)
    {
      v13 += 32;
      if (32 * v12 == v13)
      {
        int v15 = *(void **)(a1 + 56);
        goto LABEL_9;
      }
    }
    free(*(void **)(v14 + v13 + 16));
    uint64_t v21 = *(void *)(a1 + 56) + v13;
    *(void *)(v21 + 16) = 0;
    if (a3) {
      *(void *)(v21 + 16) = strdup(a3);
    }
    free(*(void **)(v21 + 24));
    uint64_t v22 = *(void *)(a1 + 56) + v13;
    *(void *)(v22 + 24) = 0;
    if (a4) {
      *(void *)(v22 + 24) = strdup(a4);
    }
    uint64_t result = 0;
    *(_DWORD *)(v22 + 4) = a6;
    *(_DWORD *)(v22 + 8) = a5;
  }
  else
  {
    int v15 = 0;
    *(void *)(a1 + 56) = 0;
LABEL_9:
    int v17 = (char *)reallocf(v15, 32 * (v12 + 1));
    *(void *)(a1 + 56) = v17;
    if (v17)
    {
      uint64_t v18 = *(unsigned int *)(a1 + 52);
      __int16 v19 = &v17[32 * v18];
      *(_DWORD *)__int16 v19 = a2;
      *((_DWORD *)v19 + 1) = a6;
      *((_DWORD *)v19 + 2) = a5;
      *((void *)v19 + 2) = 0;
      if (a3) {
        *((void *)v19 + 2) = strdup(a3);
      }
      *((void *)v19 + 3) = 0;
      v20 = (char **)(v19 + 24);
      if (a4) {
        const char *v20 = strdup(a4);
      }
      uint64_t result = 0;
      *(_DWORD *)(a1 + 52) = v18 + 1;
    }
    else
    {
      return 9999;
    }
  }
  return result;
}

uint64_t asl_client_open_from_file(int a1, const char *a2, char *a3)
{
  uint64_t v4 = asl_client_open(a2, a3, 0);
  uint64_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 40) = 196863;
    if (asl_file_open_write_fd(a1, (void *)(v4 + 64)))
    {
      _asl_client_free_internal(v5);
      return 0;
    }
    else
    {
      *(void *)(v5 + 72) = 1;
    }
  }
  return v5;
}

void _asl_client_free_internal(uint64_t a1)
{
  if (a1)
  {
    __int16 v2 = *(__asl_object_s **)(a1 + 32);
    if (v2) {
      asl_msg_release(v2);
    }
    *(void *)(a1 + 32) = 0;
    char v3 = *(__asl_object_s **)(a1 + 64);
    if (v3) {
      asl_file_close(v3);
    }
    *(void *)(a1 + 64) = 0;
    if (*(_DWORD *)(a1 + 52))
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        free(*(void **)(*(void *)(a1 + 56) + v4 + 16));
        free(*(void **)(*(void *)(a1 + 56) + v4 + 24));
        ++v5;
        v4 += 32;
      }
      while (v5 < *(unsigned int *)(a1 + 52));
    }
    free(*(void **)(a1 + 56));
    free((void *)a1);
  }
}

asl_object_t asl_client_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

uint64_t asl_client_send(__asl_object_s *a1, __asl_object_s *a2)
{
  return asl_client_internal_send(a1, a2);
}

uint64_t asl_client_match(uint64_t a1, char *a2, char **a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  if (!asl_store_location())
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    LODWORD(v22) = 0;
    int v15 = asl_msg_list_to_string(a2, &v22);
    free(v15);
    uint64_t v16 = 0;
    if (asl_store_open_read(0, &v25)) {
      return v16;
    }
    if (v25)
    {
      uint64_t v16 = asl_store_match((uint64_t)v25, (uint64_t)a2, &v26, a4, a5, a6, a7);
      int v17 = v25;
      *a3 = v26;
      asl_store_close(v17);
      return v16;
    }
    return 0;
  }
  uint64_t v25 = 0;
  mach_port_t service_port = asl_core_get_service_port();
  if (!service_port) {
    return 0;
  }
  mach_port_t v14 = service_port;
  vm_size_t size = 0;
  int v23 = 0;
  vm_address_t address = 0;
  uint64_t v26 = 0;
  if (a2)
  {
    uint64_t v26 = asl_msg_list_to_string(a2, (_DWORD *)&size + 1);
    if (!v26) {
      return 0;
    }
    goto LABEL_10;
  }
  asprintf(&v26, "0\n");
  HIDWORD(size) = 3;
  if (!v26) {
    return 0;
  }
LABEL_10:
  uint64_t v18 = (unsigned int *)MEMORY[0x263EF8C60];
  if (vm_allocate(*MEMORY[0x263EF8C60], &address, HIDWORD(size), 1358954497)) {
    return 0;
  }
  memmove((void *)address, v26, HIDWORD(size));
  free(v26);
  uint64_t v22 = 0;
  int v20 = _asl_server_match(v14, address, SHIDWORD(size), a4, a5, a6, a7, &v25, &size, &v22, &v23);
  uint64_t v16 = 0;
  if (!v20)
  {
    *a3 = v22;
    uint64_t v16 = (uint64_t)asl_msg_list_from_string((const char *)v25);
    MEMORY[0x210558590](*v18, v25, size);
  }
  return v16;
}

uint64_t asl_client_search(uint64_t a1, __asl_object_s *a2)
{
  if (asl_store_location())
  {
    *(void *)&size[1] = 0;
    int v18 = 0;
    unsigned int v19 = 0;
    int v17 = 0;
    mach_port_t service_port = asl_core_get_service_port();
    if (!service_port) {
      return 0;
    }
    mach_port_t v4 = service_port;
    vm_address_t address = 0;
    size[0] = 0;
    unint64_t v5 = asl_msg_to_string(a2, size);
    uint64_t v21 = 0;
    if (v5)
    {
      int v6 = v5;
      asprintf(&v21, "1\n%s\n", v5);
      size[0] += 3;
      free(v6);
    }
    else
    {
      asprintf(&v21, "0\n");
      size[0] = 3;
    }
    if (v21
      && (uint64_t v9 = (unsigned int *)MEMORY[0x263EF8C60],
          !vm_allocate(*MEMORY[0x263EF8C60], &address, size[0], 1358954497)))
    {
      memmove((void *)address, v21, size[0]);
      free(v21);
      uint64_t v10 = 0;
      if (!_asl_server_query_2(v4, address, size[0], 0, 0, 0, &size[1], &v19, &v17, &v18))
      {
        uint64_t v10 = (uint64_t)asl_msg_list_from_string(*(const char **)&size[1]);
        MEMORY[0x210558590](*v9, *(void *)&size[1], v19);
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    LOWORD(address) = 0;
    uint64_t v21 = 0;
    *(void *)&size[1] = 0;
    int v17 = 0;
    unint64_t v7 = 0;
    if (!asl_msg_lookup(a2, "ASLMessageID", (int **)&v17, &address) && v17)
    {
      char v8 = address;
      if ((address & 2) != 0)
      {
        uint64_t v11 = atoll(v17);
        if (v8) {
          unint64_t v7 = v11;
        }
        else {
          unint64_t v7 = v11 + 1;
        }
      }
      else
      {
        unint64_t v7 = 0;
      }
    }
    uint64_t v10 = 0;
    if (!asl_store_open_read(0, &size[1]))
    {
      uint64_t v12 = *(void *)&size[1];
      if (*(void *)&size[1])
      {
        if (a2)
        {
          asl_msg_list_new();
          mach_port_t v14 = (__asl_object_s *)v13;
          asl_msg_list_append(v13, a2);
          uint64_t v12 = *(void *)&size[1];
        }
        else
        {
          mach_port_t v14 = 0;
        }
        uint64_t v10 = asl_store_match(v12, (uint64_t)v14, &v21, v7, 0, 0, 1);
        asl_store_close(*(__asl_object_s **)&size[1]);
        asl_msg_list_release(v14);
      }
    }
  }
  return v10;
}

uint64_t asl_client_set_control(uint64_t a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = *(unsigned int *)(a1 + 40);
  *(_DWORD *)(a1 + 40) = a2;
  return result;
}

uint64_t asl_client_set_output_file_filter(uint64_t a1, int a2, int a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(unsigned int *)(a1 + 52);
  if (!v3) {
    return 0;
  }
  for (i = (_DWORD *)(*(void *)(a1 + 56) + 8); *(i - 2) != a2; i += 8)
  {
    if (!--v3) {
      return 0;
    }
  }
  uint64_t result = *i;
  _DWORD *i = a3;
  return result;
}

uint64_t asl_client_remove_output_file(uint64_t a1, int a2)
{
  if (!a1) {
    return 1;
  }
  int v3 = *(_DWORD *)(a1 + 52);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)(a1 + 56);
  while (*(_DWORD *)(v6 + v5) != a2)
  {
    v5 += 32;
    if (v3 == ++v4) {
      return 0;
    }
  }
  free(*(void **)(v6 + 32 * (int)v4 + 16));
  free(*(void **)(*(void *)(a1 + 56) + 32 * (int)v4 + 24));
  unint64_t v8 = v4 + 1;
  LODWORD(v9) = *(_DWORD *)(a1 + 52);
  if ((int)v4 + 1 < v9)
  {
    uint64_t v10 = v5 + 32;
    uint64_t v11 = 32 * (int)v4;
    do
    {
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = (_OWORD *)(v12 + v11);
      mach_port_t v14 = (_OWORD *)(v12 + v10);
      long long v15 = v14[1];
      _OWORD *v13 = *v14;
      v13[1] = v15;
      ++v8;
      unint64_t v9 = *(unsigned int *)(a1 + 52);
      v11 += 32;
      v10 += 32;
    }
    while (v8 < v9);
  }
  uint64_t v16 = *(void **)(a1 + 56);
  *(_DWORD *)(a1 + 52) = v9 - 1;
  if (v9 == 1)
  {
    free(v16);
    uint64_t result = 0;
    *(void *)(a1 + 56) = 0;
  }
  else
  {
    int v17 = reallocf(v16, 32 * (v9 - 1));
    *(void *)(a1 + 56) = v17;
    if (v17) {
      return 0;
    }
    *(_DWORD *)(a1 + 52) = 0;
    return 9999;
  }
  return result;
}

uint64_t asl_client_kvdict(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t _jump_append(__asl_object_s *a1, asl_object_t obj)
{
  uint64_t result = asl_get_type(obj);
  if (result == 2)
  {
    asl_msg_list_reset_iteration((uint64_t)obj, 0);
    do
    {
      uint64_t result = asl_msg_list_next((uint64_t)obj);
      if (!result) {
        break;
      }
      uint64_t result = asl_client_internal_send(a1, (__asl_object_s *)result);
    }
    while (!result);
  }
  else if (result <= 1)
  {
    return asl_client_internal_send(a1, obj);
  }
  return result;
}

uint64_t _jump_search(int a1, asl_object_t obj)
{
  uint64_t type = asl_get_type(obj);
  if (obj && type >= 2) {
    return 0;
  }

  return asl_client_search(type, obj);
}

uint64_t _jump_match(int a1, asl_object_t obj, char **a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  uint64_t type = asl_get_type(obj);
  if (obj && type != 2) {
    return 0;
  }

  return asl_client_match(type, (char *)obj, a3, a4, a5, a6, a7);
}

void _asl_fork_child()
{
  _asl_global = xmmword_20CD77A60;
  qword_26AA460C8 = 0;
  dword_26AA460D0 = 0;
  qword_26AA460B0 = 0;
  qword_26AA460B8 = 0;
  dword_26AA460C0 = 0;
  pthread_mutex_init(&stru_26AA460E0, 0);

  _asl_redirect_fork_child();
}

uint64_t asl_core_get_service_port()
{
  if (qword_26AA460C8 != -1) {
    dispatch_once(&qword_26AA460C8, &__block_literal_global_28);
  }
  return dword_26AA460D0;
}

void *_asl_open_default()
{
  if (_asl_open_default_once != -1) {
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  }
  return off_26AA46130;
}

int asl_add_output_file(asl_object_t client, int fd, const char *mfmt, const char *tfmt, int filter, int text_encoding)
{
  if (client)
  {
    if (asl_get_type(client) == 5)
    {
      int v12 = asl_client_add_output_file((uint64_t)client, fd, mfmt, tfmt, filter, text_encoding);
      goto LABEL_8;
    }
    return -1;
  }
  if (_asl_open_default_once != -1) {
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  }
  uint64_t v13 = off_26AA46130;
  if (!off_26AA46130) {
    return -1;
  }
  pthread_mutex_lock(&stru_26AA460E0);
  int v12 = asl_client_add_output_file((uint64_t)v13, fd, mfmt, tfmt, filter, text_encoding);
  pthread_mutex_unlock(&stru_26AA460E0);
LABEL_8:
  if (v12) {
    return -1;
  }
  else {
    return 0;
  }
}

int asl_set_output_file_filter(asl_object_t client, int fd, int filter)
{
  if (!client)
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    unint64_t v7 = off_26AA46130;
    if (off_26AA46130)
    {
      pthread_mutex_lock(&stru_26AA460E0);
      int v8 = asl_client_set_output_file_filter((uint64_t)v7, fd, filter);
      pthread_mutex_unlock(&stru_26AA460E0);
      return v8;
    }
    return -1;
  }
  if (asl_get_type(client) != 5) {
    return -1;
  }

  return asl_client_set_output_file_filter((uint64_t)client, fd, filter);
}

uint64_t asl_add_output(__asl_object_s *a1, int a2, const char *a3, const char *a4, int text_encoding)
{
  return asl_add_output_file(a1, a2, a3, a4, 255, text_encoding);
}

int asl_add_log_file(asl_object_t client, int descriptor)
{
  return asl_add_output_file(client, descriptor, "std", "lcl", 255, 1);
}

uint64_t asl_remove_output_file(__asl_object_s *a1, int a2)
{
  if (a1)
  {
    if (asl_get_type(a1) == 5)
    {
      int v4 = asl_client_remove_output_file((uint64_t)a1, a2);
      goto LABEL_8;
    }
    return 0xFFFFFFFFLL;
  }
  if (_asl_open_default_once != -1) {
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  }
  uint64_t v5 = off_26AA46130;
  if (!off_26AA46130) {
    return 0xFFFFFFFFLL;
  }
  pthread_mutex_lock(&stru_26AA460E0);
  int v4 = asl_client_remove_output_file((uint64_t)v5, a2);
  pthread_mutex_unlock(&stru_26AA460E0);
LABEL_8:
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t _asl_lib_vlog_text(__asl_object_s *a1, unsigned __int8 a2, __asl_object_s *a3, const char *a4, va_list a5)
{
  uint64_t v31 = *MEMORY[0x263EF8C08];
  uint64_t v10 = __error();
  if (!a4) {
    return 1;
  }
  int v11 = 0;
  int v12 = 0;
  unsigned int v13 = 0;
  int v14 = 0;
  int v15 = *v10;
  int v29 = 0;
  while (a4[v11] == 37)
  {
    int v16 = v11 + 1;
    if (!a4[v11 + 1]) {
      goto LABEL_9;
    }
    if (a4[v11 + 1] == 109)
    {
      strerror_r(v15, __strerrbuf, 0x800uLL);
      int v17 = strlen(__strerrbuf);
      int v14 = 1;
      int v11 = v16;
      unsigned int v13 = v17;
    }
    else
    {
      int v17 = 2;
      ++v11;
    }
LABEL_10:
    v12 += v17;
    ++v11;
  }
  if (a4[v11])
  {
LABEL_9:
    int v17 = 1;
    goto LABEL_10;
  }
  if (v14)
  {
    int v18 = (char *)malloc_type_malloc((v12 + 1), 0xBA4130ABuLL);
    if (v18)
    {
      unsigned int v19 = v18;
      unsigned int v28 = a3;
      int v20 = 0;
      int v21 = 0;
      while (1)
      {
        int v22 = a4[v20];
        if (v22 != 37) {
          break;
        }
        uint64_t v23 = (v20 + 1);
        if (!a4[v23]) {
          goto LABEL_25;
        }
        if (a4[v23] != 109 || v13 == 0)
        {
          v19[v21] = 37;
          int v25 = v21 + 1;
          v21 += 2;
          v19[v25] = a4[v23];
        }
        else
        {
          memcpy(&v19[v21], __strerrbuf, v13);
          v21 += v13;
        }
LABEL_26:
        int v20 = v23 + 1;
      }
      if (!a4[v20])
      {
        v19[v21] = 0;
        int v29 = 0;
        vasprintf(&v29, v19, a5);
        free(v19);
        a3 = v28;
        goto LABEL_30;
      }
      v19[v21++] = v22;
LABEL_25:
      LODWORD(v23) = v20;
      goto LABEL_26;
    }
    return 9;
  }
  else
  {
    int v29 = 0;
    vasprintf(&v29, a4, a5);
LABEL_30:
    if (!v29) {
      return 9;
    }
    uint64_t v26 = _asl_send_message_text(0, 0, a1, a2, a3, v29, 1);
    free(v29);
  }
  return v26;
}

uint64_t _asl_send_message_text(__asl_object_s *a1, int *a2, asl_object_t obj, unsigned __int8 a4, __asl_object_s *a5, const char *a6, int a7)
{
  asl_object_t v12 = a1;
  if (!a1)
  {
    if (obj)
    {
      if (asl_get_type(obj) == 5) {
        asl_object_t v12 = obj;
      }
      else {
        asl_object_t v12 = 0;
      }
    }
    else
    {
      if (_asl_open_default_once != -1) {
        dispatch_once(&_asl_open_default_once, &__block_literal_global);
      }
      asl_object_t v12 = (asl_object_t)off_26AA46130;
      if (!off_26AA46130) {
        return 9999;
      }
    }
  }
  if (a4 >= 7u) {
    unsigned int v14 = 7;
  }
  else {
    unsigned int v14 = a4;
  }
  if (!a2)
  {
    v35.tv_sec = 0;
    *(void *)&v35.tv_usec = 0;
    if (gettimeofday(&v35, 0))
    {
      v35.tv_sec = time(0);
      v35.tv_usec = 0;
    }
    unsigned int v34 = 0;
    if (asl_msg_lookup(a5, "Sender", &v34, 0)) {
      unsigned int v34 = 0;
    }
    int v33 = 0;
    uint64_t v15 = asl_msg_lookup(a5, "Facility", &v33, 0);
    if (v15)
    {
      int v17 = 0;
      int v33 = 0;
    }
    else
    {
      int v17 = v33;
    }
    int v18 = asl_base_msg((uint64_t)v12, v14, (uint64_t)&v35, v34, v17, a6);
    if (v18)
    {
      a2 = asl_msg_merge(v18, a5);
      int v16 = (__asl_object_s *)a2;
      goto LABEL_23;
    }
    return 9999;
  }
  uint64_t v15 = 0;
  int v16 = 0;
LABEL_23:
  unint64_t v19 = *((unsigned int *)v12 + 13);
  if (v19)
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0;
    int v22 = 1 << v14;
    do
    {
      uint64_t v23 = *((void *)v12 + 7);
      int v24 = *(_DWORD *)(v23 + v20);
      if (a7)
      {
        if ((v24 - 1) < 2) {
          goto LABEL_29;
        }
      }
      else if ((v24 & 0x80000000) == 0)
      {
LABEL_29:
        uint64_t v25 = v23 + v20;
        int v26 = *(_DWORD *)(v25 + 8);
        if (v26) {
          BOOL v27 = (v26 & v22) == 0;
        }
        else {
          BOOL v27 = 1;
        }
        if (!v27)
        {
          LODWORD(v35.tv_sec) = 0;
          unsigned int v28 = asl_format_message((char *)a2, *(char **)(v25 + 16), *(char **)(v25 + 24), *(_DWORD *)(v25 + 4), &v35);
          if (v28)
          {
            int v29 = v28;
            unsigned int v30 = write(*(_DWORD *)(*((void *)v12 + 7) + v20), v28, (LODWORD(v35.tv_sec) - 1));
            if ((v30 & 0x80000000) != 0)
            {
              uint64_t v31 = *((void *)v12 + 7);
              if (*(_DWORD *)(v31 + v20) == 2) {
                uint64_t v15 = 0;
              }
              else {
                uint64_t v15 = v30;
              }
              *(_DWORD *)(v31 + v20) = -1;
            }
            else
            {
              uint64_t v15 = 0;
            }
            free(v29);
          }
          unint64_t v19 = *((unsigned int *)v12 + 13);
        }
      }
      ++v21;
      v20 += 32;
    }
    while (v21 < v19);
  }
  if (v16) {
    asl_msg_release(v16);
  }
  return v15;
}

uint64_t _asl_lib_vlog(__asl_object_s *a1, int a2, __asl_object_s *a3, const char *a4, va_list a5)
{
  uint64_t v31 = *MEMORY[0x263EF8C08];
  uint64_t v10 = __error();
  if (!a4) {
    return 1;
  }
  int v11 = 0;
  int v12 = 0;
  unsigned int v13 = 0;
  int v14 = 0;
  int v15 = *v10;
  int v29 = 0;
  while (a4[v11] == 37)
  {
    int v16 = v11 + 1;
    if (!a4[v11 + 1]) {
      goto LABEL_9;
    }
    if (a4[v11 + 1] == 109)
    {
      strerror_r(v15, __strerrbuf, 0x800uLL);
      int v17 = strlen(__strerrbuf);
      int v14 = 1;
      int v11 = v16;
      unsigned int v13 = v17;
    }
    else
    {
      int v17 = 2;
      ++v11;
    }
LABEL_10:
    v12 += v17;
    ++v11;
  }
  if (a4[v11])
  {
LABEL_9:
    int v17 = 1;
    goto LABEL_10;
  }
  if (v14)
  {
    int v18 = (char *)malloc_type_malloc((v12 + 1), 0xEC53D65AuLL);
    if (v18)
    {
      unint64_t v19 = v18;
      unsigned int v28 = a3;
      int v20 = 0;
      int v21 = 0;
      while (1)
      {
        int v22 = a4[v20];
        if (v22 != 37) {
          break;
        }
        uint64_t v23 = (v20 + 1);
        if (!a4[v23]) {
          goto LABEL_25;
        }
        if (a4[v23] != 109 || v13 == 0)
        {
          v19[v21] = 37;
          int v25 = v21 + 1;
          v21 += 2;
          v19[v25] = a4[v23];
        }
        else
        {
          memcpy(&v19[v21], __strerrbuf, v13);
          v21 += v13;
        }
LABEL_26:
        int v20 = v23 + 1;
      }
      if (!a4[v20])
      {
        v19[v21] = 0;
        int v29 = 0;
        vasprintf(&v29, v19, a5);
        free(v19);
        a3 = v28;
        goto LABEL_30;
      }
      v19[v21++] = v22;
LABEL_25:
      LODWORD(v23) = v20;
      goto LABEL_26;
    }
    return 9;
  }
  else
  {
    int v29 = 0;
    vasprintf(&v29, a4, a5);
LABEL_30:
    if (!v29) {
      return 9;
    }
    uint64_t v26 = _asl_send_message(a1, a2, a3, v29);
    free(v29);
  }
  return v26;
}

uint64_t _asl_send_message(asl_object_t obj, int a2, __asl_object_s *a3, const char *a4)
{
  uint64_t v49 = *MEMORY[0x263EF8C08];
  int v46 = 0;
  v47 = 0;
  v45.tv_sec = 0;
  *(void *)&v45.tv_usec = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2000000000;
  int v44 = 0;
  if ((a2 & 0x1A0000) == 0)
  {
    uint64_t v12 = 0;
    goto LABEL_40;
  }
  int v6 = a2;
  if (obj)
  {
    uint32_t type = asl_get_type(obj);
    if (v6 >= 7u) {
      unsigned int v9 = 7;
    }
    else {
      unsigned int v9 = v6;
    }
    if (type != 5)
    {
      char v14 = 0;
      asl_object_t v11 = 0;
      int v13 = 0;
      goto LABEL_21;
    }
    int v10 = 0;
    asl_object_t v11 = obj;
  }
  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    asl_object_t v11 = (asl_object_t)off_26AA46130;
    if (!off_26AA46130) {
      goto LABEL_37;
    }
    if (v6 >= 7u) {
      unsigned int v9 = 7;
    }
    else {
      unsigned int v9 = v6;
    }
    int v10 = 1;
  }
  if (*((void *)v11 + 8)) {
    int v13 = 1;
  }
  else {
    int v13 = v10;
  }
  char v14 = 1;
LABEL_21:
  if (gettimeofday(&v45, 0))
  {
    v45.tv_sec = time(0);
    v45.tv_usec = 0;
  }
  v47 = 0;
  if (asl_msg_lookup(a3, "Sender", &v47, 0)) {
    v47 = 0;
  }
  int v46 = 0;
  if (asl_msg_lookup(a3, "Facility", &v46, 0))
  {
    int v15 = 0;
    int v46 = 0;
  }
  else
  {
    int v15 = v46;
  }
  int v16 = asl_base_msg((uint64_t)v11, v9, (uint64_t)&v45, v47, v15, a4);
  if (!v16)
  {
LABEL_37:
    uint64_t v12 = 9999;
    goto LABEL_40;
  }
  int v17 = v16;
  if ((v6 & 0x200000) != 0) {
    _asl_set_option(v16);
  }
  if (v13) {
    pthread_mutex_lock(&stru_26AA460E0);
  }
  int v18 = asl_msg_merge(v17, a3);
  if (v14)
  {
    uint64_t v19 = *((void *)v11 + 8);
    if (v19)
    {
      if (v18)
      {
        uint64_t v12 = asl_file_save(v19, v18, (uint64_t *)v11 + 9);
        ++*((void *)v11 + 9);
      }
      else
      {
        uint64_t v12 = 9999;
      }
      goto LABEL_89;
    }
    block[0] = MEMORY[0x263EF8BF8];
    block[1] = 0x40000000;
    block[2] = ___asl_send_message_block_invoke;
    block[3] = &unk_264104758;
    block[4] = &v41;
    if (_asl_send_message_noquota_once != -1) {
      dispatch_once(&_asl_send_message_noquota_once, block);
    }
    if (*((_DWORD *)v42 + 6))
    {
      int v21 = asl_base_msg((uint64_t)v11, 2u, (uint64_t)&v45, v47, v46, "*** MESSAGE QUOTA DISABLED FOR THIS PROCESS ***");
      asl_msg_set_key_val(v21, "ASLOption", "store");
      if ((v6 & 0x200000) != 0) {
        goto LABEL_60;
      }
    }
    else
    {
      int v21 = 0;
      if ((v6 & 0x200000) != 0) {
        goto LABEL_60;
      }
    }
    int v22 = dword_26AA460C0;
    if (dword_26AA460C0 != -1)
    {
      uint64_t v24 = qword_26AA460B0;
      atomic_ullong v23 = qword_26AA460B8;
      unsigned int v25 = dword_26AA460C0;
      __darwin_time_t v26 = v45.tv_sec - qword_26AA460B0;
      if (v45.tv_sec > qword_26AA460B0)
      {
        int v27 = 10 * v26;
        if (v26 >= 3600) {
          int v27 = 36000;
        }
        unsigned int v25 = v27 + dword_26AA460C0;
        if (v25 >= 0x8CA0) {
          unsigned int v25 = 36000;
        }
        atomic_compare_exchange_strong(&qword_26AA460B0, (unint64_t *)&v24, v45.tv_sec);
      }
      if (v25)
      {
        atomic_compare_exchange_strong(&dword_26AA460C0, (unsigned int *)&v22, v25 - 1);
      }
      else if (v45.tv_sec - v23 < 61)
      {
        v6 &= ~0x20000u;
      }
      else
      {
        v6 |= 0x400000u;
        atomic_compare_exchange_strong(&qword_26AA460B8, (unint64_t *)&v23, v45.tv_sec);
      }
    }
LABEL_60:
    if (qword_26AA460C8 != -1) {
      dispatch_once(&qword_26AA460C8, &__block_literal_global_28);
    }
    uint64_t v12 = 0;
    if ((v6 & 0x20000) == 0 || !dword_26AA460D0) {
      goto LABEL_86;
    }
    if ((v6 & 0x400000) != 0)
    {
      asl_msg_set_key_val(v18, "Level", "Critical");
      asl_msg_set_key_val(v18, "Message", "*** LOG MESSAGE QUOTA EXCEEDED - SOME MESSAGES FROM THIS PROCESS HAVE BEEN DISCARDED ***");
    }
    if (!v21)
    {
LABEL_71:
      int v32 = asl_msg_to_string_raw(-1073741822, v18, "raw");
      uint64_t v33 = asl_string_length((uint64_t)v32);
      uint64_t v12 = v33;
      if (v33 > 0x1F4000)
      {
        snprintf(__str, 0x100uLL, "*** ASL MESSAGE SIZE (%u bytes) EXCEEDED MAXIMIMUM SIZE (%u bytes) ***", v33, 2048000);
        unsigned int v34 = asl_base_msg((uint64_t)v11, 2u, (uint64_t)&v45, v47, v46, __str);
        asl_string_release((uint64_t)v32);
        if (v34)
        {
          if ((v6 & 0x200000) != 0) {
            _asl_set_option(v34);
          }
          int v32 = asl_msg_to_string_raw(-1073741822, v34, "raw");
          uint64_t v35 = asl_string_length((uint64_t)v32);
          asl_msg_release((asl_object_t)v34);
        }
        else
        {
          uint64_t v35 = 0;
        }
        uint64_t v12 = v35;
      }
      uint64_t v36 = asl_string_allocated_size((uint64_t)v32);
      int v37 = asl_string_release_return_bytes(v32);
      if (v12)
      {
        if (!_asl_server_message(dword_26AA460D0, (uint64_t)v37, v12))
        {
          uint64_t v12 = 0;
          goto LABEL_86;
        }
        uint64_t v38 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v38 = 0;
        if (!v36)
        {
LABEL_86:
          if (v18 && *((_DWORD *)v11 + 13)) {
            _asl_send_message_text(v11, v18, obj, v6, a3, a4, 0);
          }
LABEL_89:
          asl_msg_release((asl_object_t)v18);
          if (!v13) {
            goto LABEL_40;
          }
          goto LABEL_39;
        }
      }
      uint64_t v12 = v38;
      MEMORY[0x210558590](*MEMORY[0x263EF8C60], v37, v36);
      goto LABEL_86;
    }
    size_t v39 = (__asl_object_s *)v21;
    unsigned int v28 = asl_msg_to_string_raw(-1073741822, v21, "raw");
    int v29 = asl_string_length((uint64_t)v28);
    uint64_t v30 = asl_string_allocated_size((uint64_t)v28);
    uint64_t v31 = asl_string_release_return_bytes(v28);
    if (v29)
    {
      if (!_asl_server_message(dword_26AA460D0, (uint64_t)v31, v29))
      {
LABEL_70:
        asl_msg_release(v39);
        goto LABEL_71;
      }
    }
    else if (!v30)
    {
      goto LABEL_70;
    }
    MEMORY[0x210558590](*MEMORY[0x263EF8C60], v31, v30);
    goto LABEL_70;
  }
  asl_append(obj, (asl_object_t)v18);
  asl_msg_release((asl_object_t)v18);
  uint64_t v12 = 0;
  if (v13) {
LABEL_39:
  }
    pthread_mutex_unlock(&stru_26AA460E0);
LABEL_40:
  _Block_object_dispose(&v41, 8);
  return v12;
}

int asl_vlog(asl_object_t obj, asl_object_t msg, int level, const char *format, va_list ap)
{
  uint32_t v9 = _asl_evaluate_send(obj, msg, level);
  if ((v9 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v9 & 0x80000) != 0)
    {
      int v10 = _asl_lib_vlog_text(obj, v9, msg, format, ap);
      goto LABEL_8;
    }
  }
  else if ((v9 & 0x1A0000) != 0)
  {
    int v10 = _asl_lib_vlog(obj, v9, msg, format, ap);
    goto LABEL_8;
  }
  int v10 = 0;
LABEL_8:
  if (v10) {
    return -1;
  }
  else {
    return 0;
  }
}

int _asl_lib_log(asl_object_t client, uint32_t eval, asl_object_t msg, const char *format, ...)
{
  va_start(va, format);
  if ((eval & 0x1A0000) != 0) {
    return _asl_lib_vlog(client, eval, msg, format, va);
  }
  else {
    return 0;
  }
}

int asl_log_message(int level, const char *format, ...)
{
  va_start(va, format);
  uint32_t v3 = _asl_evaluate_send(0, 0, level);
  if ((v3 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v3 & 0x80000) != 0)
    {
      int v4 = _asl_lib_vlog_text(0, v3, 0, format, va);
      goto LABEL_8;
    }
  }
  else if ((v3 & 0x1A0000) != 0)
  {
    int v4 = _asl_lib_vlog(0, v3, 0, format, va);
    goto LABEL_8;
  }
  int v4 = 0;
LABEL_8:
  if (v4) {
    return -1;
  }
  else {
    return 0;
  }
}

uint64_t asl_get_filter(asl_object_t obj, _DWORD *a2, _DWORD *a3, _DWORD *a4, int *a5)
{
  if (obj && asl_get_type(obj) != 5) {
    return 0xFFFFFFFFLL;
  }
  if (_asl_open_default_once != -1) {
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  }
  if (obj) {
    asl_object_t v10 = obj;
  }
  else {
    asl_object_t v10 = (asl_object_t)off_26AA46130;
  }
  if (v10)
  {
    int v11 = *((unsigned __int8 *)v10 + 40);
    if (!off_26AA46130) {
      goto LABEL_28;
    }
  }
  else
  {
    int v11 = 0;
    if (!off_26AA46130) {
      goto LABEL_28;
    }
  }
  if ((*((unsigned char *)off_26AA46130 + 12) & 4) == 0)
  {
    int check = 0;
    uint64_t v16 = 0;
    pthread_mutex_lock(&stru_26AA460E0);
    if ((DWORD1(_asl_global) & 0x80000000) == 0)
    {
      int check = 0;
      if (!notify_check(SDWORD1(_asl_global), &check))
      {
        if (check)
        {
          if ((HIDWORD(_asl_global) & 0x80000000) == 0)
          {
            uint64_t v16 = 0;
            if (!notify_get_state(SHIDWORD(_asl_global), &v16)) {
              qword_26AA460A8 = v16;
            }
          }
          if ((DWORD2(_asl_global) & 0x80000000) == 0)
          {
            uint64_t v16 = 0;
            if (!notify_get_state(SDWORD2(_asl_global), &v16)) {
              qword_26AA460A0 = v16;
            }
          }
        }
      }
    }
    int v13 = qword_26AA460A8;
    int v14 = qword_26AA460A0;
    if (qword_26AA460A0) {
      int v15 = 2;
    }
    else {
      int v15 = qword_26AA460A8 != 0;
    }
    pthread_mutex_unlock(&stru_26AA460E0);
    if (!a2) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_28:
  int v13 = 0;
  int v14 = 0;
  int v15 = 0;
  if (a2) {
LABEL_29:
  }
    *a2 = v11;
LABEL_30:
  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = v14;
  }
  uint64_t result = 0;
  if (a5) {
    *a5 = v15;
  }
  return result;
}

uint64_t asl_set_local_control(__asl_object_s *a1, int a2)
{
  if (a1)
  {
    uint32_t v3 = a1;
    if (asl_get_type(a1) != 5) {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    uint32_t v3 = (__asl_object_s *)off_26AA46130;
    if (!off_26AA46130) {
      return 0xFFFFFFFFLL;
    }
  }

  return asl_client_set_control((uint64_t)v3, a2);
}

uint64_t asl_get_local_control(__asl_object_s *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    if (asl_get_type(a1) != 5) {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    if (_asl_open_default_once != -1) {
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    }
    uint64_t v1 = (__asl_object_s *)off_26AA46130;
    if (!off_26AA46130) {
      return 0xFFFFFFFFLL;
    }
  }

  return asl_client_get_control((uint64_t)v1);
}

int *asl_base_msg(uint64_t a1, unsigned int a2, uint64_t a3, int *a4, int *a5, const char *a6)
{
  unint64_t v7 = (const char *)a5;
  int v8 = (const char *)a4;
  uint64_t v25 = *MEMORY[0x263EF8C08];
  int v22 = a5;
  atomic_ullong v23 = a4;
  uint64_t v12 = (int *)asl_msg_new(0);
  int v13 = v12;
  if (!v12) {
    return v13;
  }
  if (a2 <= 7) {
    asl_msg_set_key_val(v12, "Level", level_to_number_string[a2]);
  }
  if (a3)
  {
    snprintf(__str, 0x40uLL, "%llu", *(void *)a3);
    asl_msg_set_key_val(v13, "Time", __str);
    snprintf(__str, 0x40uLL, "%d", 1000 * *(_DWORD *)(a3 + 8));
    asl_msg_set_key_val(v13, "TimeNanoSec", __str);
  }
  if (a6) {
    asl_msg_set_key_val(v13, "Message", a6);
  }
  pid_t v14 = getpid();
  snprintf(__str, 0x40uLL, "%u", v14);
  asl_msg_set_key_val(v13, "PID", __str);
  os_activity_id_t identifier = os_activity_get_identifier(MEMORY[0x263EF8CB8], 0);
  if (identifier)
  {
    snprintf(__str, 0x40uLL, "0x%016llx", identifier);
    asl_msg_set_key_val(v13, "OSActivityID", __str);
  }
  if (!a1 || v8)
  {
LABEL_26:
    if (!v8) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (asl_msg_lookup(*(_DWORD **)(a1 + 32), "Sender", &v23, 0) || (int v8 = (const char *)v23) == 0)
  {
    atomic_ullong v23 = 0;
    uint64_t v16 = (const char *)qword_26AA460D8;
    if (!qword_26AA460D8)
    {
      int v17 = _NSGetArgv();
      int v18 = **v17;
      if (v18)
      {
        uint64_t v19 = strrchr(**v17, 47);
        pthread_mutex_lock(&stru_26AA460E0);
        if (!qword_26AA460D8)
        {
          if (v19) {
            int v20 = v19 + 1;
          }
          else {
            int v20 = v18;
          }
          qword_26AA460D8 = (uint64_t)strdup(v20);
        }
        pthread_mutex_unlock(&stru_26AA460E0);
      }
      if (qword_26AA460D8) {
        uint64_t v16 = (const char *)qword_26AA460D8;
      }
      else {
        uint64_t v16 = "Unknown";
      }
    }
    asl_msg_set_key_val(v13, "Sender", v16);
    int v8 = (const char *)v23;
    goto LABEL_26;
  }
LABEL_27:
  asl_msg_set_key_val(v13, "Sender", v8);
  unint64_t v7 = (const char *)v22;
LABEL_28:
  if (a1 && !v7)
  {
    if (asl_msg_lookup(*(_DWORD **)(a1 + 32), "Facility", &v22, 0)) {
      return v13;
    }
    unint64_t v7 = (const char *)v22;
  }
  if (v7) {
    asl_msg_set_key_val(v13, "Facility", v7);
  }
  return v13;
}

uint64_t asl_client_internal_send(__asl_object_s *a1, __asl_object_s *a2)
{
  uint32_t v4 = _asl_evaluate_send(a1, a2, -1);
  val_for_key = asl_msg_get_val_for_key((int *)a2, "Message");
  if ((v4 & 0x40000) != 0 && val_for_key && *(unsigned char *)val_for_key && os_log_shim_enabled())
  {
    int v6 = asl_msg_get_val_for_key((int *)a2, "Level");
    if (v6) {
      atoi((const char *)v6);
    }
    os_log_with_args_wrapper();
    uint64_t result = 0;
    if ((v4 & 0x80000) != 0) {
      return _asl_send_message_text(0, 0, a1, v4, a2, 0, 1);
    }
  }
  else if ((v4 & 0x1A0000) != 0)
  {
    return _asl_send_message(a1, v4, a2, 0);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t os_log_with_args_wrapper()
{
  return os_log_with_args();
}

int asl_create_auxiliary_file(asl_object_t msg, const char *title, const char *uti, int *out_descriptor)
{
  if (!out_descriptor) {
    return -1;
  }
  if (_asl_auxiliary(msg, title, uti, 0, out_descriptor)) {
    return -1;
  }
  return 0;
}

uint64_t _asl_auxiliary(__asl_object_s *a1, const char *a2, const char *a3, const char *a4, _DWORD *a5)
{
  uint64_t v36 = *MEMORY[0x263EF8C08];
  asl_object_t v10 = (int *)asl_msg_new(0);
  int v11 = v10;
  if (a4) {
    asl_msg_set_key_val(v10, "ASLAuxURL", a4);
  }
  if (a2) {
    asl_msg_set_key_val(v11, "ASLAuxTitle", a2);
  }
  if (a3) {
    uint64_t v12 = a3;
  }
  else {
    uint64_t v12 = "public.data";
  }
  asl_msg_set_key_val(v11, "ASLAuxUTI", v12);
  int v13 = asl_msg_merge(v11, a1);
  if (!a5)
  {
    uint32_t v18 = _asl_evaluate_send(0, (asl_object_t)v13, -1);
    uint64_t v19 = _asl_send_message(0, v18, (__asl_object_s *)v13, 0);
    asl_msg_release((asl_object_t)v13);
    return v19;
  }
  uint64_t v34 = 0;
  unsigned int v33 = 0;
  int v32 = 0;
  if (asl_store_location())
  {
    pid_t v14 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040F89CB87BuLL);
    if (v14)
    {
      int v15 = v14;
      if ((pipe(v35) & 0x80000000) == 0)
      {
        dispatch_fd_t v16 = v35[0];
        int v17 = dispatch_semaphore_create(0);
        v15[2] = v17;
        *(_DWORD *)int v15 = v35[1];
        if (!_asl_aux_save_context((uint64_t)v15))
        {
          uint64_t v25 = dispatch_queue_create("ASL_AUX_PIPE_Q", 0);
          cleanup_handler[0] = MEMORY[0x263EF8BF8];
          cleanup_handler[1] = 0x40000000;
          cleanup_handler[2] = ___asl_auxiliary_block_invoke;
          cleanup_handler[3] = &__block_descriptor_tmp_57;
          dispatch_fd_t v31 = v16;
          __darwin_time_t v26 = dispatch_io_create(0, v16, v25, cleanup_handler);
          *a5 = v35[1];
          dispatch_io_set_low_water(v26, 0xFFFFFFFFFFFFFFFFLL);
          v29[0] = MEMORY[0x263EF8BF8];
          v29[1] = 0x40000000;
          v29[2] = ___asl_auxiliary_block_invoke_2;
          v29[3] = &__block_descriptor_tmp_60;
          v29[4] = v13;
          v29[5] = v17;
          v29[6] = v26;
          v29[7] = v25;
          dispatch_io_read(v26, 0, 0xFFFFFFFFFFFFFFFFLL, v25, v29);
          return 0;
        }
        close(v35[0]);
        close(v35[1]);
        dispatch_release(v17);
      }
      free(v15);
    }
    return 9999;
  }
  if (qword_26AA460C8 != -1) {
    dispatch_once(&qword_26AA460C8, &__block_literal_global_28);
  }
  if (!dword_26AA460D0) {
    return 9999;
  }
  int v21 = asl_msg_to_string_raw(-1073741822, v13, "raw");
  uint64_t v22 = asl_string_length((uint64_t)v21);
  uint64_t v23 = asl_string_allocated_size((uint64_t)v21);
  uint64_t v24 = asl_string_release_return_bytes(v21);
  if (!v22)
  {
    asl_msg_release((asl_object_t)v13);
    MEMORY[0x210558590](*MEMORY[0x263EF8C60], v24, v23);
    return 9999;
  }
  HIDWORD(v34) = 0;
  unsigned int v33 = 0;
  if (_asl_server_create_aux_link(dword_26AA460D0, (uint64_t)v24, v22, (_DWORD *)&v34 + 1, &v32, &v34, &v33))
  {
    MEMORY[0x210558590](*MEMORY[0x263EF8C60], v24, v23);
LABEL_22:
    asl_msg_release((asl_object_t)v13);
    return 9999;
  }
  if (v33)
  {
    asl_msg_release((asl_object_t)v13);
    return v33;
  }
  if (v32)
  {
    asl_msg_set_key_val(v13, "ASLAuxURL", v32);
    MEMORY[0x210558590](*MEMORY[0x263EF8C60], v32, v34);
  }
  if (!HIDWORD(v34)) {
    goto LABEL_22;
  }
  int v27 = fileport_makefd();
  mach_port_deallocate(*MEMORY[0x263EF8C60], HIDWORD(v34));
  if (v27 < 0)
  {
    asl_msg_release((asl_object_t)v13);
  }
  else
  {
    unsigned int v28 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040F89CB87BuLL);
    if (v28)
    {
      *a5 = v27;
      *(_DWORD *)unsigned int v28 = v27;
      v28[1] = v13;
      return _asl_aux_save_context((uint64_t)v28);
    }
  }
  return 0xFFFFFFFFLL;
}

int asl_log_auxiliary_location(asl_object_t msg, const char *title, const char *uti, const char *url)
{
  if (_asl_auxiliary(msg, title, uti, url, 0)) {
    return -1;
  }
  else {
    return 0;
  }
}

int asl_close_auxiliary_file(int descriptor)
{
  pthread_mutex_lock(&stru_26AA460E0);
  if (dword_26AA46120 < 1)
  {
LABEL_5:
    uint32_t v4 = 0;
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v2 = 0;
  while (1)
  {
    uint32_t v3 = *(void **)(qword_26AA46128 + 8 * v2);
    if (*(_DWORD *)v3 == descriptor) {
      break;
    }
    if (dword_26AA46120 == ++v2) {
      goto LABEL_5;
    }
  }
  uint32_t v4 = (__asl_object_s *)*((void *)v3 + 1);
  uint64_t v5 = *((void *)v3 + 2);
  free(v3);
  uint64_t v9 = (dword_26AA46120 - 1);
  if ((int)v2 + 1 < dword_26AA46120)
  {
    do
    {
      *(void *)(qword_26AA46128 + 8 * v2) = *(void *)(qword_26AA46128 + 8 * v2 + 8);
      ++v2;
    }
    while (v9 != v2);
  }
  dword_26AA46120 = v9;
  if (v9)
  {
    qword_26AA46128 = (uint64_t)reallocf((void *)qword_26AA46128, 8 * (int)v9);
    if (qword_26AA46128)
    {
      int v6 = 0;
      goto LABEL_7;
    }
    dword_26AA46120 = 0;
LABEL_6:
    int v6 = -1;
    goto LABEL_7;
  }
  free((void *)qword_26AA46128);
  int v6 = 0;
  qword_26AA46128 = 0;
LABEL_7:
  pthread_mutex_unlock(&stru_26AA460E0);
  close(descriptor);
  if (v4)
  {
    uint32_t v7 = _asl_evaluate_send(0, v4, -1);
    if (_asl_send_message(0, v7, v4, 0)) {
      int v6 = -1;
    }
    asl_msg_release(v4);
  }
  if (v5)
  {
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
  }
  return v6;
}

asl_object_t _asl_server_control_query()
{
  if (qword_26AA460C8 != -1) {
    dispatch_once(&qword_26AA460C8, &__block_literal_global_28);
  }
  if (!dword_26AA460D0) {
    return 0;
  }
  vm_address_t address = 0;
  uint64_t v6 = 0;
  uint64_t v9 = 0;
  unsigned int v8 = 0;
  v0 = (unsigned int *)MEMORY[0x263EF8C60];
  asl_object_t v1 = 0;
  if (vm_allocate(*MEMORY[0x263EF8C60], &address, 0x1BuLL, 1358954497)) {
    return v1;
  }
  vm_address_t v2 = address;
  *(_OWORD *)vm_address_t address = *(_OWORD *)"1\nQ [= ASLOption control]\n";
  strcpy((char *)(v2 + 11), "ption control]\n");
  int v7 = 0;
  asl_object_t v1 = 0;
  if (_asl_server_query_2(dword_26AA460D0, v2, 27, 0, 256, 0, &v9, &v8, &v6, &v7)) {
    return v1;
  }
  uint32_t v3 = asl_msg_list_from_string(v9);
  MEMORY[0x210558590](*v0, v9, v8);
  if (!v3) {
    return 0;
  }
  if (*((_DWORD *)v3 + 2)) {
    asl_object_t v1 = asl_msg_retain(**((asl_object_t **)v3 + 2));
  }
  else {
    asl_object_t v1 = 0;
  }
  asl_msg_list_release(v3);
  return v1;
}

uint64_t asl_store_location()
{
  if (qword_26AA460C8 != -1) {
    dispatch_once(&qword_26AA460C8, &__block_literal_global_28);
  }
  uint64_t result = dword_26AA460D0;
  if (dword_26AA460D0)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v2 = 0;
    int v1 = _asl_server_query_2(dword_26AA460D0, 0, 0, 0, -1, 0, &v4, (_DWORD *)&v3 + 1, &v2, &v3);
    uint64_t result = 0;
    if (!v1)
    {
      if (v4) {
        MEMORY[0x210558590](*MEMORY[0x263EF8C60], v4, HIDWORD(v3));
      }
      return v3 == 0;
    }
  }
  return result;
}

asl_object_t asl_open_path(const char *path, uint32_t opts)
{
  memset(&v12, 0, sizeof(v12));
  asl_object_t v10 = 0;
  int v11 = 0;
  if (opts) {
    uint32_t v3 = opts;
  }
  else {
    uint32_t v3 = 0x80000000;
  }
  if ((v3 & 0x80000000) != 0)
  {
    if (path)
    {
      memset(&v12, 0, sizeof(v12));
      if (stat(path, &v12) < 0) {
        return 0;
      }
      if ((__int16)v12.st_mode < 0)
      {
        int v6 = asl_file_open_read(path, (uint64_t *)&v11);
        goto LABEL_25;
      }
      if ((v12.st_mode & 0x4000) == 0) {
        return 0;
      }
      uint64_t v5 = (char *)path;
    }
    else
    {
      uint64_t v5 = "/var/log/asl";
    }
    int v6 = asl_store_open_read(v5, &v10);
LABEL_23:
    uint64_t v9 = v10;
    goto LABEL_26;
  }
  asl_object_t result = 0;
  if (path && (v3 & 1) != 0)
  {
    memset(&v12, 0, sizeof(v12));
    if (stat(path, &v12) < 0)
    {
      if (*__error() != 2) {
        return 0;
      }
      if ((v3 & 2) != 0)
      {
LABEL_22:
        int v6 = asl_store_open_write(path, &v10);
        goto LABEL_23;
      }
    }
    else if (((__int16)v12.st_mode & 0x80000000) == 0)
    {
      if ((v12.st_mode & 0x4000) != 0) {
        goto LABEL_22;
      }
      return 0;
    }
    uint64_t v7 = geteuid();
    uint64_t v8 = getegid();
    int v6 = asl_file_open_write(path, 0x1A4u, v7, v8, (uint64_t *)&v11);
LABEL_25:
    uint64_t v9 = v11;
LABEL_26:
    if (v6) {
      return 0;
    }
    else {
      return v9;
    }
  }
  return result;
}

uint64_t ___asl_global_init_block_invoke()
{
  v0 = getenv("ASL_DISABLE");
  if (!v0 || (uint64_t result = strcmp(v0, "1"), result))
  {
    uint64_t result = bootstrap_look_up2();
    if (result) {
      dword_26AA460D0 = 0;
    }
  }
  return result;
}

void _asl_set_option(int *a1)
{
  uint64_t v4 = 0;
  if (asl_msg_lookup(a1, "ASLOption", (int **)&v4, 0)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = v4 == 0;
  }
  if (v2)
  {
    asl_msg_set_key_val(a1, "ASLOption", "store");
  }
  else
  {
    uint32_t v3 = 0;
    asprintf(&v3, "%s %s", "store", v4);
    asl_msg_set_key_val(a1, "ASLOption", v3);
    free(v3);
  }
}

int *___asl_send_message_block_invoke(uint64_t a1)
{
  memset(&v5, 0, sizeof(v5));
  int v2 = *__error();
  if (stat("/etc/asl/.noquota", &v5))
  {
    uint32_t v3 = getenv("ASL_QUOTA_DISABLED");
    if (v3 && !strcmp(v3, "1"))
    {
      dword_26AA460C0 = -1;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else
  {
    dword_26AA460C0 = -1;
  }
  uint64_t result = __error();
  *uint64_t result = v2;
  return result;
}

uint64_t _asl_aux_save_context(uint64_t a1)
{
  pthread_mutex_lock(&stru_26AA460E0);
  int v2 = reallocf((void *)qword_26AA46128, 8 * dword_26AA46120 + 8);
  qword_26AA46128 = (uint64_t)v2;
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = dword_26AA46120++;
    v2[v4] = a1;
  }
  else
  {
    dword_26AA46120 = 0;
    uint64_t v3 = 9999;
  }
  pthread_mutex_unlock(&stru_26AA460E0);
  return v3;
}

uint64_t ___asl_auxiliary_block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void ___asl_auxiliary_block_invoke_2(uint64_t a1, int a2, dispatch_data_t data, int a4)
{
  if (!a4)
  {
    size_t size_ptr = dispatch_data_get_size(data);
    if (size_ptr)
    {
      asl_object_t v10 = 0;
      uint64_t v7 = dispatch_data_create_map(data, (const void **)&v10, &size_ptr);
      uint64_t v8 = asl_core_encode_buffer(v10, size_ptr);
      asl_msg_set_key_val(*(int **)(a1 + 32), "ASLAuxData", v8);
      free(v8);
      uint32_t v9 = _asl_evaluate_send(0, *(asl_object_t *)(a1 + 32), -1);
      _asl_send_message(0, v9, *(__asl_object_s **)(a1 + 32), 0);
      asl_msg_release(*(asl_object_t *)(a1 + 32));
      dispatch_release(v7);
    }
  }
  if (a2)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 48));
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
  }
}

uint64_t asl_core_string_hash(char *__s, unsigned int a2)
{
  if (!__s) {
    return 0;
  }
  int v2 = __s;
  if (!a2)
  {
    if (*__s)
    {
      a2 = strlen(__s);
      goto LABEL_5;
    }
    return 0;
  }
LABEL_5:
  int v3 = -1640531527;
  if (a2 < 0xC)
  {
    int v4 = 0;
    unsigned int v6 = -1640531527;
    unsigned int v5 = a2;
  }
  else
  {
    int v4 = 0;
    unsigned int v5 = a2;
    unsigned int v6 = -1640531527;
    do
    {
      int v7 = v6 + v2[4] + (v2[5] << 8) + (v2[6] << 16) + (v2[7] << 24);
      unsigned int v8 = v4 + v2[8] + (v2[9] << 8) + (v2[10] << 16) + (v2[11] << 24);
      int v9 = (v3 + *v2 + (v2[1] << 8) + (v2[2] << 16) + (v2[3] << 24) - (v7 + v8)) ^ (v8 >> 13);
      unsigned int v10 = (v7 - v8 - v9) ^ (v9 << 8);
      unsigned int v11 = (v8 - v9 - v10) ^ (v10 >> 13);
      int v12 = (v9 - v10 - v11) ^ (v11 >> 12);
      unsigned int v13 = (v10 - v11 - v12) ^ (v12 << 16);
      unsigned int v14 = (v11 - v12 - v13) ^ (v13 >> 5);
      int v3 = (v12 - v13 - v14) ^ (v14 >> 3);
      unsigned int v6 = (v13 - v14 - v3) ^ (v3 << 10);
      int v4 = (v14 - v3 - v6) ^ (v6 >> 15);
      v2 += 12;
      v5 -= 12;
    }
    while (v5 > 0xB);
  }
  unsigned int v16 = v4 + a2;
  switch(v5)
  {
    case 1u:
      goto LABEL_22;
    case 2u:
      goto LABEL_21;
    case 3u:
      goto LABEL_20;
    case 4u:
      goto LABEL_19;
    case 5u:
      goto LABEL_18;
    case 6u:
      goto LABEL_17;
    case 7u:
      goto LABEL_16;
    case 8u:
      goto LABEL_15;
    case 9u:
      goto LABEL_14;
    case 0xAu:
      goto LABEL_13;
    case 0xBu:
      v16 += v2[10] << 24;
LABEL_13:
      v16 += v2[9] << 16;
LABEL_14:
      v16 += v2[8] << 8;
LABEL_15:
      v6 += v2[7] << 24;
LABEL_16:
      v6 += v2[6] << 16;
LABEL_17:
      v6 += v2[5] << 8;
LABEL_18:
      v6 += v2[4];
LABEL_19:
      v3 += v2[3] << 24;
LABEL_20:
      v3 += v2[2] << 16;
LABEL_21:
      v3 += v2[1] << 8;
LABEL_22:
      v3 += *v2;
      break;
    default:
      break;
  }
  int v17 = (v3 - v6 - v16) ^ (v16 >> 13);
  unsigned int v18 = (v6 - v16 - v17) ^ (v17 << 8);
  unsigned int v19 = (v16 - v17 - v18) ^ (v18 >> 13);
  int v20 = (v17 - v18 - v19) ^ (v19 >> 12);
  unsigned int v21 = (v18 - v19 - v20) ^ (v20 << 16);
  unsigned int v22 = (v19 - v20 - v21) ^ (v21 >> 5);
  int v23 = (v20 - v21 - v22) ^ (v22 >> 3);
  unsigned int v24 = (v22 - v23 - ((v21 - v22 - v23) ^ (v23 << 10))) ^ (((v21 - v22 - v23) ^ (v23 << 10)) >> 15);
  if (v24 <= 1) {
    return 1;
  }
  else {
    return v24;
  }
}

const char *asl_core_error(unsigned int a1)
{
  if (a1 > 0xE) {
    return "Operation Failed";
  }
  else {
    return off_2641047D8[a1];
  }
}

const char *asl_core_level_to_string(unsigned int a1)
{
  if (a1 <= 7) {
    return ASL_LEVEL_TO_STRING[a1];
  }
  else {
    return "invalid";
  }
}

uint64_t asl_core_check_access(int a1, gid_t a2, uid_t uid, int a4, char a5)
{
  uint64_t result = 0;
  if (!uid) {
    return result;
  }
  int v7 = a5 & 3;
  if ((a5 & 3) == 0) {
    return result;
  }
  if (v7 == 2) {
    return asl_core_check_group_access(a2, uid, a4);
  }
  if (v7 != 1)
  {
    uint64_t result = 0;
    if (a1 == -1 || a1 == uid) {
      return result;
    }
    return asl_core_check_group_access(a2, uid, a4);
  }
  if (a1 == uid || a1 == -1) {
    return 0;
  }
  else {
    return 10;
  }
}

uint64_t asl_core_check_group_access(gid_t a1, uid_t uid, int a3)
{
  uint64_t result = 0;
  uint64_t v8 = *MEMORY[0x263EF8C08];
  if (a1 != -1 && a1 != a3)
  {
    memset(uu, 0, sizeof(uu));
    memset(group, 0, sizeof(group));
    mbr_uid_to_uuid(uid, uu);
    mbr_gid_to_uuid(a1, group);
    int ismember = 0;
    mbr_check_membership(uu, group, &ismember);
    if (ismember) {
      return 0;
    }
    else {
      return 10;
    }
  }
  return result;
}

unint64_t asl_core_htonq(unint64_t a1)
{
  return bswap64(a1);
}

unint64_t asl_core_ntohq(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t asl_core_new_msg_id(uint64_t a1)
{
  if (!a1) {
    a1 = _asl_core_msg_next_id;
  }
  _asl_core_msg_next_id = a1 + 1;
  pthread_mutex_unlock(&core_lock);
  return a1;
}

uint64_t asl_filesystem_path(int a1)
{
  if (asl_filesystem_path_once != -1) {
    dispatch_once(&asl_filesystem_path_once, &__block_literal_global_0);
  }
  if (a1 == 1) {
    return asl_filesystem_path_asl_filesystem_path_archive;
  }
  if (a1) {
    return 0;
  }
  return asl_filesystem_path_asl_filesystem_path_database;
}

uint64_t __asl_filesystem_path_block_invoke()
{
  return asprintf((char **)&asl_filesystem_path_asl_filesystem_path_archive, "%s/asl.archive", "/var/log");
}

unsigned char *asl_core_encode_buffer(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t result = 0;
  uint64_t v33 = *MEMORY[0x263EF8C08];
  if (!a1 || !a2) {
    return result;
  }
  bzero(v31, 0x400uLL);
  uint64_t v28 = 0;
  uint64_t v5 = a2;
  uint64_t v6 = a2;
  int v7 = a1;
  do
  {
    int v8 = *v7++;
    ++v31[v8];
    --v6;
  }
  while (v6);
  char v9 = 0;
  uint64_t v10 = 0;
  char v11 = 1;
  do
  {
    char v12 = v11;
    *(_DWORD *)&v29[4 * v10] = 1;
    unsigned int v13 = v32;
    uint64_t v14 = 1;
    uint64_t v15 = 2;
    int v16 = v28;
    while (1)
    {
      unsigned int v17 = v31[v15];
      if (v17 < v13) {
        break;
      }
LABEL_11:
      if (++v15 == 256) {
        goto LABEL_14;
      }
    }
    *(_DWORD *)&v29[4 * v10] = v15;
    if (v17 && (v9 & (v17 == v16)) == 0)
    {
      uint64_t v14 = v15;
      unsigned int v13 = v17;
      goto LABEL_11;
    }
    uint64_t v14 = v15;
LABEL_14:
    char v11 = 0;
    *(_DWORD *)&v29[4 * v10 - 8] = v31[v14];
    v31[v14] = -1;
    char v9 = 1;
    uint64_t v10 = 1;
  }
  while ((v12 & 1) != 0);
  int v18 = a2 + v28 + HIDWORD(v28);
  uint64_t result = malloc_type_malloc((v18 + 3), 0x861EDB8FuLL);
  if (result)
  {
    uint64_t v19 = 0;
    result[v18 + 2] = 0;
    char v20 = v29[0];
    *uint64_t result = v29[0];
    char v21 = v30;
    result[1] = v30;
    unsigned int v22 = 2;
    do
    {
      int v23 = a1[v19];
      if (a1[v19])
      {
        uint64_t v24 = 0;
        char v25 = 1;
        while (1)
        {
          char v26 = v25;
          if (*(_DWORD *)&v29[4 * v24] == v23) {
            break;
          }
          char v25 = 0;
          uint64_t v24 = 1;
          if ((v26 & 1) == 0)
          {
            unsigned int v27 = v22;
            goto LABEL_24;
          }
        }
        unsigned int v27 = v22 + 1;
        result[v22] = v21;
        LOBYTE(v23) = v24 + 1;
        LODWORD(v24) = 2;
      }
      else
      {
        LODWORD(v24) = 1;
        unsigned int v27 = v22;
        LOBYTE(v23) = v20;
      }
LABEL_24:
      v22 += v24;
      result[v27] = v23;
      ++v19;
    }
    while (v19 != v5);
  }
  return result;
}

uint64_t asl_core_decode_buffer(const char *a1, void *a2, int *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a3)
  {
    int v7 = *(unsigned __int8 *)a1;
    v19[0] = *a1;
    int v8 = *((unsigned __int8 *)a1 + 1);
    v19[1] = a1[1];
    unsigned int v9 = strlen(a1);
    unsigned int v10 = v9;
    if (v9 >= 3)
    {
      int v11 = 0;
      LODWORD(v12) = 2;
      while (1)
      {
        if (a1[v12] == v8)
        {
          uint64_t v12 = v12 + 1;
          if (v12 == v9 || a1[v12] - 3 < 0xFFFFFFFE) {
            break;
          }
        }
        LODWORD(v12) = v12 + 1;
        --v11;
        if (v12 >= v9)
        {
          if (!v11) {
            return 0xFFFFFFFFLL;
          }
          int v13 = -v11;
          uint64_t v14 = malloc_type_malloc(-v11, 0x99E5D2B7uLL);
          if (!v14) {
            return 0xFFFFFFFFLL;
          }
          if (v10 >= 3)
          {
            int v15 = 0;
            LODWORD(v16) = 2;
            do
            {
              int v17 = a1[v16];
              if (v17 == v7)
              {
                LOBYTE(v17) = 0;
              }
              else if (v17 == v8)
              {
                uint64_t v16 = v16 + 1;
                LOBYTE(v17) = v19[a1[v16] - 1];
              }
              v14[v15++] = v17;
              LODWORD(v16) = v16 + 1;
            }
            while (v16 < v10);
          }
          uint64_t v3 = 0;
          *a3 = v13;
          *a2 = v14;
          return v3;
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  return v3;
}

BOOL asl_core_str_match(char *a1, char *__s, unsigned int a3, int a4, unsigned int a5, unsigned int *a6)
{
  if (!a1) {
    return a3 == 0;
  }
  int v11 = a1;
  unsigned int v12 = 0;
  unsigned int v13 = 0;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  *a6 = v13;
  char v14 = *v11;
  if (*v11)
  {
    while (1)
    {
      if (a4 && v13 == a4) {
        return 1;
      }
      if (__s)
      {
        int v15 = strchr(__s, v14);
        BOOL v16 = !v15 || (a5 & 1) == 0;
        if (((v15 == 0) & (a5 >> 1)) == 0 && v16) {
          break;
        }
      }
      unsigned int v17 = v12;
      if (a6) {
        unsigned int v17 = *a6;
      }
      ++v11;
      unsigned int v13 = v17 + 1;
      if (a6) {
        goto LABEL_3;
      }
LABEL_5:
      char v14 = *v11;
      unsigned int v12 = v13;
      if (!*v11) {
        goto LABEL_19;
      }
    }
    if (a6) {
      unsigned int v12 = *a6;
    }
  }
  else
  {
LABEL_19:
    unsigned int v12 = v13;
  }
  return v12 >= a3;
}

BOOL asl_core_str_match_char(unsigned __int8 *a1, unsigned __int8 a2, unsigned int a3, char a4, unsigned int *a5)
{
  if (a5) {
    *a5 = 0;
  }
  if (!a1) {
    return a3 == 0;
  }
  int v5 = *a1;
  if ((a4 & 1) != 0 && v5 == a2)
  {
    unsigned int v6 = 1;
    if (!a5) {
      return v6 >= a3;
    }
    *a5 = 1;
    if ((a4 & 2) == 0 || *a1 == a2) {
      return v6 >= a3;
    }
  }
  else
  {
    if ((a4 & 2) == 0 || v5 == a2)
    {
      if (a5) {
        unsigned int v6 = *a5;
      }
      else {
        unsigned int v6 = 0;
      }
      return v6 >= a3;
    }
    if (!a5)
    {
      unsigned int v6 = 1;
      return v6 >= a3;
    }
  }
  unsigned int v6 = 1;
  *a5 = 1;
  return v6 >= a3;
}

unint64_t asl_core_str_to_uint32(unint64_t result, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  int v2 = (char *)result;
  LODWORD(result) = 0;
  uint64_t v3 = a2;
  do
  {
    int v4 = *v2++;
    uint64_t result = (v4 + 10 * result - 48);
    --v3;
  }
  while (v3);
  return result;
}

const char *asl_core_str_to_size(const char *result)
{
  if (result)
  {
    int v1 = result;
    uint64_t result = (const char *)strlen(result);
    if (result)
    {
      int v2 = v1[(void)result - 1];
      if (v2 > 90) {
        LOBYTE(v2) = v2 - 32;
      }
      unsigned __int8 v3 = v2 - 71;
      if (v3 > 6u) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = qword_20CD77AA8[(char)v3];
      }
      return (const char *)(atoll(v1) * v4);
    }
  }
  return result;
}

const char *asl_core_str_to_time(const char *result, int a2)
{
  if (result)
  {
    LODWORD(v2) = a2;
    unsigned __int8 v3 = result;
    uint64_t result = (const char *)strlen(result);
    if (result)
    {
      int v4 = v3[(void)result - 1];
      if (v4 > 90) {
        LOBYTE(v4) = v4 - 32;
      }
      if (v4 > 0x4Cu)
      {
        if (v4 == 83)
        {
          uint64_t v2 = 1;
          return (const char *)(atoll(v3) * v2);
        }
        if (v4 == 77)
        {
          uint64_t v2 = 60;
          return (const char *)(atoll(v3) * v2);
        }
      }
      else
      {
        if (v4 == 68)
        {
          uint64_t v2 = 86400;
          return (const char *)(atoll(v3) * v2);
        }
        if (v4 == 72)
        {
          uint64_t v2 = 3600;
          return (const char *)(atoll(v3) * v2);
        }
      }
      uint64_t v2 = v2;
      return (const char *)(atoll(v3) * v2);
    }
  }
  return result;
}

uint64_t asl_core_time_to_str(int a1, char *a2, size_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8C08];
  long long v5 = 0uLL;
  *(_OWORD *)__str = 0u;
  long long v16 = 0u;
  int v6 = a1 / 86400;
  int v7 = a1 % 86400 / 3600;
  int v8 = a1 % 86400 % 3600;
  unsigned int v9 = ((__int16)((34953 * (__int16)v8) >> 16) >> 5)
     + (((v8 + ((-30583 * (__int16)v8) >> 16)) & 0x8000) >> 15);
  uint64_t v10 = (__int16)(v8
                - 60
                * (((__int16)((34953 * (__int16)v8) >> 16) >> 5)
                 + (((v8 + ((-30583 * (__int16)v8) >> 16)) & 0x8000) >> 15)));
  if (a1 / 86400)
  {
    int v11 = "s";
    if (v6 == 1) {
      int v11 = (const char *)&unk_20CD78005;
    }
    snprintf(__str, 0x20uLL, "%u day%s", a1 / 86400, v11);
    long long v5 = 0uLL;
  }
  *(_OWORD *)unsigned int v13 = v5;
  long long v14 = v5;
  snprintf(v13, 0x20uLL, "%02u:%02u:%02lld", v7, v9, v10);
  if (v7 + v9 + v10)
  {
    if (v6) {
      return snprintf(a2, a3, "%s %s");
    }
    return snprintf(a2, a3, "%s");
  }
  if (v6) {
    return snprintf(a2, a3, "%s");
  }

  return snprintf(a2, a3, "0");
}

uint64_t asl_core_str_match_c_time(uint64_t result, time_t *a2, _DWORD *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    memset(&v59, 0, sizeof(v59));
    time_t v58 = time(0);
    localtime_r(&v58, &v59);
    int tm_year = v59.tm_year;
    memset(&v59, 0, sizeof(v59));
    v59.int tm_year = tm_year;
    if (!strncasecmp((const char *)v5, "jan", 3uLL))
    {
      int v7 = 0;
    }
    else if (!strncasecmp((const char *)v5, "feb", 3uLL))
    {
      int v7 = 1;
    }
    else if (!strncasecmp((const char *)v5, "mar", 3uLL))
    {
      int v7 = 2;
    }
    else
    {
      int v7 = 3;
      if (strncasecmp((const char *)v5, "apr", 3uLL))
      {
        if (!strncasecmp((const char *)v5, "may", 3uLL))
        {
          int v7 = 4;
        }
        else if (!strncasecmp((const char *)v5, "jun", 3uLL))
        {
          int v7 = 5;
        }
        else if (!strncasecmp((const char *)v5, "jul", 3uLL))
        {
          int v7 = 6;
        }
        else if (!strncasecmp((const char *)v5, "aug", 3uLL))
        {
          int v7 = 7;
        }
        else if (!strncasecmp((const char *)v5, "sep", 3uLL))
        {
          int v7 = 8;
        }
        else if (!strncasecmp((const char *)v5, "oct", 3uLL))
        {
          int v7 = 9;
        }
        else if (!strncasecmp((const char *)v5, "nov", 3uLL))
        {
          int v7 = 10;
        }
        else
        {
          if (strncasecmp((const char *)v5, "dec", 3uLL)) {
            return 0;
          }
          int v7 = 11;
        }
      }
    }
    v59.tm_mon = v7;
    LOBYTE(v8) = *(unsigned char *)(v5 + 3);
    if (!(_BYTE)v8) {
      return 0;
    }
    uint64_t v9 = 0;
    do
    {
      if (!memchr("\t ", (char)v8, 3uLL)) {
        break;
      }
      int v8 = *(unsigned __int8 *)(v5 + 4 + v9++);
    }
    while (v8);
    if (!v9) {
      return 0;
    }
    uint64_t v10 = (unsigned char *)(v5 + 3 + v9);
    LOBYTE(v11) = *v10;
    if (!*v10) {
      return 0;
    }
    uint64_t v12 = 0;
    unsigned int v13 = (char *)(v5 + 3 + v9);
    while (1)
    {
      if (v12 == 2)
      {
        LODWORD(v12) = 2;
        goto LABEL_38;
      }
      if (!memchr("0123456789", (char)v11, 0xBuLL)) {
        break;
      }
      int v11 = *(unsigned __int8 *)(v9 + v5 + 4 + v12++);
      if (!v11) {
        goto LABEL_38;
      }
    }
    if (!v12) {
      return 0;
    }
LABEL_38:
    int v14 = 0;
    uint64_t v15 = v12;
    do
    {
      int v16 = *v13++;
      int v14 = v16 + 10 * v14 - 48;
      --v15;
    }
    while (v15);
    v59.tm_mday = v14;
    if (v14 > 31) {
      return 0;
    }
    uint64_t v17 = &v10[v12];
    LOBYTE(v18) = *v17;
    if (!*v17) {
      return 0;
    }
    uint64_t v19 = 0;
    do
    {
      if (!memchr("\t ", (char)v18, 3uLL)) {
        break;
      }
      int v18 = *(unsigned __int8 *)(v9 + (unint64_t)v12 + v5 + 4 + v19++);
    }
    while (v18);
    if (!v19) {
      return 0;
    }
    char v20 = &v17[v19];
    LOBYTE(v21) = *v20;
    if (!*v20) {
      return 0;
    }
    uint64_t v22 = 0;
    int v23 = v20;
    uint64_t v57 = v19;
    unint64_t v24 = v9 + (unint64_t)v19 + v12 + v5 + 4;
    while (1)
    {
      if (v22 == 2)
      {
        LODWORD(v22) = 2;
        goto LABEL_54;
      }
      if (!memchr("0123456789", (char)v21, 0xBuLL)) {
        break;
      }
      int v21 = *(unsigned __int8 *)(v24 + v22++);
      if (!v21) {
        goto LABEL_54;
      }
    }
    if (!v22) {
      return 0;
    }
LABEL_54:
    int v25 = 0;
    uint64_t v26 = v22;
    uint64_t v27 = v22;
    do
    {
      int v28 = *v23++;
      int v25 = v28 + 10 * v25 - 48;
      --v27;
    }
    while (v27);
    v59.tm_hour = v25;
    if (v25 > 23) {
      return 0;
    }
    int v29 = &v20[v22];
    if (*v29 != 58) {
      return 0;
    }
    int v32 = v29[1];
    dispatch_fd_t v31 = v29 + 1;
    LOBYTE(v30) = v32;
    if (!v32) {
      return 0;
    }
    uint64_t v33 = 0;
    uint64_t v34 = v31;
    uint64_t v55 = v26;
    uint64_t v35 = v9 + v26 + v57 + v12 + v5 + 5;
    do
    {
      if (v33 == 2)
      {
        LODWORD(v33) = 2;
        uint64_t v36 = v55;
        goto LABEL_66;
      }
      if (!memchr("0123456789", (char)v30, 0xBuLL)) {
        break;
      }
      int v30 = *(unsigned __int8 *)(v35 + v33++);
    }
    while (v30);
    uint64_t v36 = v55;
    if (v33 < 2) {
      return 0;
    }
LABEL_66:
    int v37 = 0;
    uint64_t v38 = v33;
    do
    {
      int v39 = *v34++;
      int v37 = v39 + 10 * v37 - 48;
      --v38;
    }
    while (v38);
    v59.tm_min = v37;
    if (v37 > 59) {
      return 0;
    }
    unsigned int v40 = &v31[v33];
    if (*v40 != 58) {
      return 0;
    }
    int v43 = v40[1];
    v42 = v40 + 1;
    LOBYTE(v41) = v43;
    if (!v43) {
      return 0;
    }
    uint64_t v44 = 0;
    uint64_t v54 = v33;
    int v56 = v42;
    unint64_t v45 = v9 + (unint64_t)v33 + v36 + v57 + v12 + v5 + 6;
    do
    {
      if (v44 == 2)
      {
        LODWORD(v44) = 2;
        goto LABEL_78;
      }
      if (!memchr("0123456789", (char)v41, 0xBuLL)) {
        break;
      }
      int v41 = *(unsigned __int8 *)(v45 + v44++);
    }
    while (v41);
    if (v44 < 2) {
      return 0;
    }
LABEL_78:
    int v46 = 0;
    uint64_t v47 = v44;
    uint64_t v48 = v44;
    do
    {
      int v49 = *v42++;
      int v46 = v49 + 10 * v46 - 48;
      --v48;
    }
    while (v48);
    v59.tm_sec = v46;
    if (v46 > 59) {
      return 0;
    }
    int v50 = v56 + v44;
    LOBYTE(v51) = v56[v47];
    if ((_BYTE)v51)
    {
      uint64_t v52 = 0;
      uint64_t v53 = v9 + v47 + v54 + v36 + v57 + v12 + v5 + 6;
      while (v52 != 1)
      {
        if (!memchr(" \t\n", (char)v51, 4uLL))
        {
          if (!v52) {
            return 0;
          }
          break;
        }
        int v51 = *(unsigned __int8 *)(v53 + v52++);
        if (!v51) {
          break;
        }
      }
    }
    v59.tm_isdst = -1;
    if (a3) {
      *a3 = v50 - v5;
    }
    if (a2) {
      *a2 = mktime(&v59);
    }
    return 1;
  }
  return result;
}

time_t asl_core_parse_time(char *__s, int *a2)
{
  time_t v8 = 0;
  if (a2) {
    *a2 = 0;
  }
  if (!__s) {
    return -1;
  }
  unsigned int v4 = strlen(__s);
  if (!v4) {
    return -1;
  }
  int v5 = *__s;
  if (v5 == 45 || v5 == 43) {
    goto LABEL_7;
  }
  if ((v5 & 0xFFFFFFDF) - 65 > 0x19)
  {
    if (v4 <= 4)
    {
LABEL_7:
      int matched = asl_core_str_match_absolute_or_relative_time((uint64_t)__s, &v8, a2);
      goto LABEL_8;
    }
    if (__s[4] == 46)
    {
      int matched = asl_core_str_match_dotted_time((uint64_t)__s, &v8, a2);
    }
    else
    {
      if (asl_core_str_match_absolute_or_relative_time((uint64_t)__s, &v8, a2)) {
        return v8;
      }
      int matched = asl_core_str_match_iso_8601_time((uint64_t)__s, &v8, a2);
    }
  }
  else
  {
    int matched = asl_core_str_match_c_time((uint64_t)__s, &v8, a2);
  }
LABEL_8:
  if (matched) {
    return v8;
  }
  else {
    return -1;
  }
}

uint64_t asl_core_str_match_absolute_or_relative_time(uint64_t result, void *a2, _DWORD *a3)
{
  if (!result) {
    return result;
  }
  int v5 = (unsigned char *)result;
  LOBYTE(v6) = *(unsigned char *)result;
  if (*(unsigned char *)result)
  {
    uint64_t v7 = 0;
    while (v7 != 1)
    {
      if (!memchr("+-", (char)v6, 3uLL)) {
        goto LABEL_13;
      }
      int v6 = v5[++v7];
      if (!v6)
      {
        if (v7 != 1) {
          goto LABEL_13;
        }
        break;
      }
    }
    time_t v8 = time(0);
    if (*v5 == 45) {
      int v9 = -1;
    }
    else {
      int v9 = 1;
    }
    LODWORD(v7) = 1;
  }
  else
  {
    LODWORD(v7) = 0;
LABEL_13:
    time_t v8 = 0;
    int v9 = 1;
  }
  uint64_t v10 = &v5[v7];
  LOBYTE(v11) = *v10;
  if (!*v10) {
    return 0;
  }
  uint64_t v12 = 0;
  do
  {
    if (!memchr("0123456789", (char)v11, 0xBuLL)) {
      break;
    }
    int v11 = v5[v7 + 1 + v12++];
  }
  while (v11);
  if (!v12) {
    return 0;
  }
  int v27 = v9;
  time_t v28 = v8;
  int v29 = a2;
  int v13 = 0;
  uint64_t v14 = v12;
  uint64_t v15 = &v5[v7];
  uint64_t v16 = v12;
  do
  {
    int v17 = *v15++;
    int v13 = v17 + 10 * v13 - 48;
    --v16;
  }
  while (v16);
  int v18 = &v10[v12];
  int v19 = *v18;
  if (v10[v14])
  {
    uint64_t v20 = 0;
    LOBYTE(v21) = *v18;
    while (v20 != 1)
    {
      if (memchr("SsMmHhDdWw", (char)v21, 0xBuLL))
      {
        int v21 = v5[v7 + 1 + v14 + v20++];
        if (v21) {
          continue;
        }
      }
      goto LABEL_29;
    }
    LODWORD(v20) = 1;
LABEL_29:
    if (v19 <= 99)
    {
      if (v19 <= 76)
      {
        if (v19 != 68)
        {
          if (v19 != 72) {
            goto LABEL_47;
          }
          goto LABEL_37;
        }
LABEL_44:
        int v22 = 86400;
        goto LABEL_46;
      }
      if (v19 != 77)
      {
        if (v19 != 87) {
          goto LABEL_47;
        }
        goto LABEL_45;
      }
LABEL_43:
      v13 *= 60;
      goto LABEL_47;
    }
    if (v19 > 108)
    {
      if (v19 == 119)
      {
LABEL_45:
        int v22 = 604800;
        goto LABEL_46;
      }
      if (v19 == 109) {
        goto LABEL_43;
      }
    }
    else
    {
      if (v19 == 100) {
        goto LABEL_44;
      }
      if (v19 == 104)
      {
LABEL_37:
        int v22 = 3600;
LABEL_46:
        v13 *= v22;
      }
    }
  }
  else
  {
    LODWORD(v20) = 0;
  }
LABEL_47:
  int v23 = &v18[v20];
  LOBYTE(v24) = *v23;
  if (*v23)
  {
    uint64_t v25 = 0;
    unint64_t v26 = (unint64_t)&v5[v14 + 1 + v20 + v7];
    while (v25 != 1)
    {
      if (!memchr(" \t\n", (char)v24, 4uLL))
      {
        if (!v25) {
          return 0;
        }
        break;
      }
      int v24 = *(unsigned __int8 *)(v26 + v25++);
      if (!v24) {
        break;
      }
    }
  }
  if (a3) {
    *a3 = v23 - v5;
  }
  if (v29) {
    *int v29 = v28 + v13 * v27;
  }
  return 1;
}

uint64_t asl_core_str_match_dotted_time(uint64_t result, time_t *a2, _DWORD *a3)
{
  memset(&v74, 0, sizeof(v74));
  if (result)
  {
    unsigned __int8 v3 = (char *)result;
    LOBYTE(v4) = *(unsigned char *)result;
    if (!*(unsigned char *)result) {
      return 0;
    }
    uint64_t v7 = 0;
    do
    {
      if (v7 == 4)
      {
        LODWORD(v7) = 4;
        goto LABEL_10;
      }
      if (!memchr("0123456789", (char)v4, 0xBuLL)) {
        break;
      }
      int v4 = v3[++v7];
    }
    while (v4);
    if (v7 < 4) {
      return 0;
    }
    int v8 = 0;
    int v9 = v3;
    uint64_t v10 = v7;
    do
    {
      int v11 = *v9++;
      int v8 = v11 + 10 * v8 - 48;
      --v10;
    }
    while (v10);
    v74.int tm_year = v8 - 1900;
    uint64_t v12 = &v3[v7];
    if (*v12 != 46) {
      return 0;
    }
    int v15 = v12[1];
    uint64_t v14 = v12 + 1;
    LOBYTE(v13) = v15;
    if (!v15) {
      return 0;
    }
LABEL_10:
    uint64_t v16 = 0;
    int v17 = v14;
    while (1)
    {
      if (v16 == 2)
      {
        LODWORD(v16) = 2;
        goto LABEL_21;
      }
      if (!memchr("0123456789", (char)v13, 0xBuLL)) {
        break;
      }
      int v13 = v3[v7 + 2 + v16++];
      if (!v13) {
        goto LABEL_21;
      }
    }
    if (!v16) {
      return 0;
    }
    int v18 = 0;
    uint64_t v19 = v16;
    do
    {
      int v20 = *v17++;
      int v18 = v20 + 10 * v18 - 48;
      --v19;
    }
    while (v19);
    if ((v18 - 13) < 0xFFFFFFF4) {
      return 0;
    }
    v74.tm_mon = v18 - 1;
    int v21 = &v14[v16];
    if (*v21 != 46) {
      return 0;
    }
    int v24 = v21[1];
    int v23 = v21 + 1;
    LOBYTE(v22) = v24;
    if (!v24) {
      return 0;
    }
LABEL_21:
    uint64_t v25 = 0;
    unint64_t v26 = v23;
    while (1)
    {
      if (v25 == 2)
      {
        LODWORD(v25) = 2;
        goto LABEL_33;
      }
      if (!memchr("0123456789", (char)v22, 0xBuLL)) {
        break;
      }
      int v22 = v3[v7 + 3 + (unint64_t)v16 + v25++];
      if (!v22) {
        goto LABEL_33;
      }
    }
    if (!v25) {
      return 0;
    }
    int v27 = 0;
    uint64_t v28 = v25;
    do
    {
      int v29 = *v26++;
      int v27 = v29 + 10 * v27 - 48;
      --v28;
    }
    while (v28);
    v74.tm_mday = v27;
    if (v27 > 31) {
      return 0;
    }
    int v30 = &v23[v25];
    LOBYTE(v31) = *v30;
    if (!*v30) {
      return 0;
    }
    uint64_t v32 = 0;
    do
    {
      if (!memchr("\t ", (char)v31, 3uLL)) {
        break;
      }
      int v31 = v3[v16 + 3 + v7 + (unint64_t)v25 + v32++];
    }
    while (v31);
    if (!v32) {
      return 0;
    }
    uint64_t v33 = &v30[v32];
    LOBYTE(v34) = *v33;
    if (!*v33) {
      return 0;
    }
LABEL_33:
    uint64_t v35 = 0;
    uint64_t v69 = v32;
    v70 = v33;
    uint64_t v36 = v33;
    while (1)
    {
      if (v35 == 2)
      {
        LODWORD(v35) = 2;
        goto LABEL_49;
      }
      if (!memchr("0123456789", (char)v34, 0xBuLL)) {
        break;
      }
      int v34 = v3[v25
                              + 3
                              + (unint64_t)v16
                              + v7
                              + v69
                              + v35++];
      if (!v34) {
        goto LABEL_49;
      }
    }
    if (!v35) {
      return 0;
    }
    int v37 = 0;
    uint64_t v38 = v35;
    uint64_t v39 = v35;
    do
    {
      int v40 = *v36++;
      int v37 = v40 + 10 * v37 - 48;
      --v39;
    }
    while (v39);
    v74.tm_hour = v37;
    if (v37 > 23) {
      return 0;
    }
    int v41 = &v70[v35];
    if (*v41 != 58) {
      return 0;
    }
    int v44 = v41[1];
    int v43 = v41 + 1;
    LOBYTE(v42) = v44;
    if (!v44) {
      return 0;
    }
LABEL_49:
    uint64_t v45 = 0;
    v71 = v43;
    uint64_t v67 = v38;
    unint64_t v46 = (unint64_t)&v3[v25
                              + 4
                              + (unint64_t)v16
                              + v7
                              + v38
                              + v69];
    do
    {
      if (v45 == 2)
      {
        LODWORD(v45) = 2;
        goto LABEL_61;
      }
      if (!memchr("0123456789", (char)v42, 0xBuLL)) {
        break;
      }
      int v42 = *(unsigned __int8 *)(v46 + v45++);
    }
    while (v42);
    if (v45 < 2) {
      return 0;
    }
    int v47 = 0;
    uint64_t v48 = v45;
    uint64_t v68 = v45;
    do
    {
      int v49 = *v43++;
      int v47 = v49 + 10 * v47 - 48;
      --v48;
    }
    while (v48);
    v74.tm_min = v47;
    if (v47 > 59) {
      return 0;
    }
    v72 = &v71[v45];
    if (*v72 != 58) {
      return 0;
    }
    int v50 = v72[1];
    v73 = v72 + 1;
    if (!v50) {
      return 0;
    }
LABEL_61:
    uint64_t v51 = 0;
    uint64_t v52 = v73;
    unint64_t v53 = (unint64_t)&v3[v25
                              + 5
                              + (unint64_t)v16
                              + v7
                              + v45
                              + v67
                              + v69];
    do
    {
      if (v51 == 2)
      {
        LODWORD(v51) = 2;
        goto LABEL_73;
      }
      if (!memchr("0123456789", (char)v50, 0xBuLL)) {
        break;
      }
      int v50 = *(unsigned __int8 *)(v53 + v51++);
    }
    while (v50);
    if (v51 < 2) {
      return 0;
    }
    int v54 = 0;
    uint64_t v55 = v51;
    uint64_t v66 = v51;
    do
    {
      int v56 = *v52++;
      int v54 = v56 + 10 * v54 - 48;
      --v55;
    }
    while (v55);
    v74.tm_sec = v54;
    if (v54 > 59) {
      return 0;
    }
    uint64_t v57 = &v73[v51];
    LOBYTE(v58) = *v57;
    if (!*v57) {
      return 0;
    }
LABEL_73:
    uint64_t v59 = 0;
    do
    {
      if (!memchr("\t ", (char)v58, 3uLL)) {
        break;
      }
      int v58 = v3[v25
                              + 5
                              + (unint64_t)v16
                              + v7
                              + v66
                              + v68
                              + v67
                              + v69
                              + v59++];
    }
    while (v58);
    if (v59 && (uint64_t v60 = &v57[v59], !strncmp(v60, "UTC", 3uLL)))
    {
      int v63 = *((unsigned __int8 *)v60 + 3);
      int v62 = v60 + 3;
      LOBYTE(v61) = v63;
      if (v63)
      {
        uint64_t v64 = 0;
        unint64_t v65 = (unint64_t)&v3[v25
                                  + 8
                                  + (unint64_t)v16
                                  + v7
                                  + v59
                                  + v66
                                  + v68
                                  + v67
                                  + v69];
        while (v64 != 1)
        {
          if (!memchr(" \t\n", (char)v61, 4uLL))
          {
            if (!v64) {
              return 0;
            }
            break;
          }
          int v61 = *(unsigned __int8 *)(v65 + v64++);
          if (!v61) {
            break;
          }
        }
      }
      if (a3) {
        *a3 = v62 - v3;
      }
      if (a2) {
        *a2 = timegm(&v74);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t asl_core_str_match_iso_8601_time(uint64_t result, time_t *a2, int *a3)
{
  memset(&v99, 0, sizeof(v99));
  if (result)
  {
    unsigned __int8 v3 = (char *)result;
    LOBYTE(v4) = *(unsigned char *)result;
    if (!*(unsigned char *)result) {
      return 0;
    }
    uint64_t v7 = 0;
    do
    {
      if (v7 == 4)
      {
        LODWORD(v7) = 4;
        goto LABEL_10;
      }
      if (!memchr("0123456789", (char)v4, 0xBuLL)) {
        break;
      }
      int v4 = v3[++v7];
    }
    while (v4);
    if (v7 < 4) {
      return 0;
    }
LABEL_10:
    int v8 = 0;
    int v9 = v3;
    uint64_t v10 = v7;
    do
    {
      int v11 = *v9++;
      int v8 = v11 + 10 * v8 - 48;
      --v10;
    }
    while (v10);
    v99.int tm_year = v8 - 1900;
    int v12 = v3[v7];
    BOOL v13 = v12 == 45;
    uint64_t v14 = v12 == 45 ? &v3[v7 + 1] : &v3[v7];
    LOBYTE(v15) = *v14;
    if (!*v14) {
      return 0;
    }
    uint64_t v16 = 0;
    int v17 = v14;
    do
    {
      if (v16 == 2)
      {
        LODWORD(v16) = 2;
        goto LABEL_23;
      }
      if (!memchr("0123456789", (char)v15, 0xBuLL)) {
        break;
      }
      int v15 = v3[v7 + 1 + v13 + v16++];
    }
    while (v15);
    if (v16 < 2) {
      return 0;
    }
LABEL_23:
    int v18 = 0;
    uint64_t v19 = v16;
    do
    {
      int v20 = *v17++;
      int v18 = v20 + 10 * v18 - 48;
      --v19;
    }
    while (v19);
    if ((v18 - 13) < 0xFFFFFFF4) {
      return 0;
    }
    v99.tm_mon = v18 - 1;
    BOOL v21 = v14[v16] == 45;
    int v22 = v14[v16] == 45 ? &v14[v16 + 1] : &v14[v16];
    LOBYTE(v23) = *v22;
    if (!*v22) {
      return 0;
    }
    uint64_t v24 = 0;
    uint64_t v25 = v22;
    BOOL v97 = v21;
    uint64_t v98 = v16;
    unint64_t v26 = (unint64_t)&v3[v7 + 1 + (unint64_t)v16 + v13 + v21];
    do
    {
      if (v24 == 2)
      {
        LODWORD(v24) = 2;
        v100[0] = 2;
        goto LABEL_37;
      }
      if (!memchr("0123456789", (char)v23, 0xBuLL)) {
        break;
      }
      int v23 = *(unsigned __int8 *)(v26 + v24++);
    }
    while (v23);
    v100[0] = v24;
    if (v24 <= 1) {
      return 0;
    }
LABEL_37:
    int v27 = 0;
    uint64_t v28 = v24;
    uint64_t v29 = v24;
    do
    {
      int v30 = *v25++;
      int v27 = v30 + 10 * v27 - 48;
      --v29;
    }
    while (v29);
    v99.tm_mday = v27;
    if (v27 > 31) {
      return 0;
    }
    uint64_t result = asl_core_str_match(&v22[v24], "Tt", 1u, 1, 1u, v100);
    if (result)
    {
      uint64_t v31 = v100[0];
      uint64_t v32 = &v22[v28 + v100[0]];
      uint64_t result = asl_core_str_match(v32, "0123456789", 2u, 2, 1u, v100);
      if (result)
      {
        uint64_t v33 = v100[0];
        if (v100[0])
        {
          int v34 = 0;
          uint64_t v35 = v32;
          uint64_t v36 = v100[0];
          do
          {
            int v37 = *v35++;
            int v34 = v37 + 10 * v34 - 48;
            --v36;
          }
          while (v36);
          v99.tm_hour = v34;
          if (v34 > 23) {
            return 0;
          }
        }
        else
        {
          uint64_t v33 = 0;
          v99.tm_hour = 0;
        }
        int v38 = v32[v33];
        BOOL v39 = v38 == 58;
        v100[0] = v38 == 58;
        int v40 = v38 == 58 ? &v32[v33 + 1] : &v32[v33];
        uint64_t result = asl_core_str_match(v40, "0123456789", 2u, 2, 1u, v100);
        if (result)
        {
          uint64_t v41 = v100[0];
          if (v100[0])
          {
            int v42 = 0;
            int v43 = v40;
            uint64_t v44 = v100[0];
            do
            {
              int v45 = *v43++;
              int v42 = v45 + 10 * v42 - 48;
              --v44;
            }
            while (v44);
            v99.tm_min = v42;
            if (v42 > 59) {
              return 0;
            }
          }
          else
          {
            uint64_t v41 = 0;
            v99.tm_min = 0;
          }
          BOOL v53 = v40[v41] == 58;
          BOOL v95 = v53;
          uint64_t v96 = v41;
          v100[0] = v53;
          unint64_t v46 = v53 ? &v40[v41 + 1] : &v40[v41];
          uint64_t result = asl_core_str_match(v46, "0123456789", 2u, 2, 1u, v100);
          if (result)
          {
            BOOL v94 = v39;
            uint64_t v47 = v100[0];
            if (v100[0])
            {
              int v48 = 0;
              int v49 = v46;
              uint64_t v50 = v100[0];
              do
              {
                int v51 = *v49++;
                int v48 = v51 + 10 * v48 - 48;
                --v50;
              }
              while (v50);
              v99.tm_sec = v48;
              if (v48 > 59) {
                return 0;
              }
            }
            else
            {
              uint64_t v47 = 0;
              int v48 = 0;
              v99.tm_sec = 0;
            }
            unsigned int v52 = v46[v47];
            BOOL v53 = v52 > 0x20 || ((1 << v52) & 0x100000601) == 0;
            if (!v53)
            {
              v99.tm_isdst = -1;
              if (a3) {
                *a3 = v46 + v47 - v3;
              }
              if (!a2) {
                return 1;
              }
              time_t v54 = mktime(&v99);
              goto LABEL_78;
            }
            uint64_t v90 = v31;
            v91 = &v46[v47];
            uint64_t v55 = 0;
            v100[0] = 0;
            uint64_t v88 = v47;
            uint64_t v89 = v33;
            uint64_t v56 = (uint64_t)&v3[v98 + 1 + v7 + v28 + v95 + v94 + v97 + v13 + v47 + v96 + v33 + v31];
            unsigned int v57 = v52;
            LOBYTE(v58) = v52;
            while (1)
            {
              if (v55 == 1)
              {
                LODWORD(v55) = 1;
                goto LABEL_87;
              }
              if (!memchr("Zz+-", (char)v58, 5uLL)) {
                break;
              }
              int v58 = *(unsigned __int8 *)(v56 + v55++);
              v100[0] = v55;
              if (!v58) {
                goto LABEL_87;
              }
            }
            if (!v55) {
              return 0;
            }
LABEL_87:
            v92 = &v91[v55];
            if (v57 == 45)
            {
              int v62 = 3600;
            }
            else
            {
              if (v57 == 122 || v57 == 90)
              {
                LOBYTE(v59) = *v92;
                if (*v92)
                {
                  uint64_t v60 = 0;
                  v100[0] = 0;
                  uint64_t v61 = (uint64_t)&v3[v13
                                   + 1
                                   + v88
                                   + v96
                                   + v89
                                   + v90
                                   + v98
                                   + v7
                                   + v28
                                   + v95
                                   + v55
                                   + v94
                                   + v97];
                  while (v60 != 1)
                  {
                    if (!memchr(" \t\n", (char)v59, 4uLL))
                    {
                      if (!v60) {
                        return 0;
                      }
                      break;
                    }
                    int v59 = *(unsigned __int8 *)(v61 + v60++);
                    v100[0] = v60;
                    if (!v59) {
                      break;
                    }
                  }
                }
                if (!a3) {
                  goto LABEL_109;
                }
                int v67 = v92 - v3;
                goto LABEL_108;
              }
              int v62 = -3600;
            }
            int v87 = v62;
            v100[0] = 0;
            LOBYTE(v62) = *v92;
            if (*v92)
            {
              uint64_t v63 = 0;
              uint64_t v85 = v55;
              uint64_t v64 = v98 + v7 + v28 + v95 + v55;
              unint64_t v65 = v92;
              uint64_t v66 = (uint64_t)&v3[v13 + 1 + v88 + v96 + v89 + v90 + v64 + v94 + v97];
              while (1)
              {
                if (v63 == 2)
                {
                  LODWORD(v63) = 2;
                  goto LABEL_112;
                }
                if (!memchr("0123456789", (char)v62, 0xBuLL)) {
                  break;
                }
                int v62 = *(unsigned __int8 *)(v66 + v63++);
                v100[0] = v63;
                if (!v62) {
                  goto LABEL_112;
                }
              }
              if (!v63) {
                return 0;
              }
LABEL_112:
              int v68 = 0;
              uint64_t v69 = v63;
              uint64_t v86 = v63;
              do
              {
                int v70 = *v65++;
                int v68 = v70 + 10 * v68 - 48;
                --v69;
              }
              while (v69);
              if (v68 <= 23)
              {
                int v71 = v68;
                v72 = &v92[v86];
                v100[0] = 0;
                BOOL v84 = v92[v86] == 58;
                if (v92[v86] == 58) {
                  ++v72;
                }
                v93 = v72;
                int v73 = *v72;
                if (v73)
                {
                  uint64_t v74 = 0;
                  while (1)
                  {
                    if (v74 == 2)
                    {
                      LODWORD(v74) = 2;
                      goto LABEL_125;
                    }
                    if (!memchr("0123456789", (char)v73, 0xBuLL)) {
                      break;
                    }
                    int v73 = v3[v97
                                            + 1
                                            + v13
                                            + v88
                                            + v96
                                            + v89
                                            + v90
                                            + v7
                                            + v86
                                            + v85
                                            + v28
                                            + v98
                                            + v95
                                            + v94
                                            + v84
                                            + v74++];
                    v100[0] = v74;
                    if (!v73) {
                      goto LABEL_125;
                    }
                  }
                  if (!v74) {
                    goto LABEL_129;
                  }
LABEL_125:
                  int v75 = 0;
                  uint64_t v76 = v74;
                  uint64_t v77 = v74;
                  v78 = v93;
                  do
                  {
                    int v79 = *v78++;
                    int v75 = v79 + 10 * v75 - 48;
                    --v77;
                  }
                  while (v77);
                  if (v75 > 59) {
                    return 0;
                  }
                }
                else
                {
LABEL_129:
                  uint64_t v76 = 0;
                  int v75 = 0;
                }
                v99.tm_sec = v48 + v87 * v71 + 60 * v75;
                v80 = &v93[v76];
                if (!v93[v76])
                {
LABEL_138:
                  if (!a3) {
                    goto LABEL_109;
                  }
                  int v67 = v80 - v3;
LABEL_108:
                  *a3 = v67;
LABEL_109:
                  if (!a2) {
                    return 1;
                  }
                  time_t v54 = timegm(&v99);
LABEL_78:
                  *a2 = v54;
                  return 1;
                }
                v100[0] = 0;
                LOBYTE(v81) = *v80;
                if (*v80)
                {
                  uint64_t v82 = 0;
                  uint64_t v83 = (uint64_t)&v3[v13
                                   + 1
                                   + v88
                                   + v96
                                   + v89
                                   + v90
                                   + v76
                                   + v7
                                   + v86
                                   + v85
                                   + v28
                                   + v98
                                   + v84
                                   + v95
                                   + v94
                                   + v97];
                  while (v82 != 1)
                  {
                    if (!memchr(" \t\n", (char)v81, 4uLL))
                    {
                      if (!v82) {
                        return 0;
                      }
                      goto LABEL_138;
                    }
                    int v81 = *(unsigned __int8 *)(v83 + v82++);
                    v100[0] = v82;
                    if (!v81) {
                      goto LABEL_138;
                    }
                  }
                  goto LABEL_138;
                }
              }
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

time_t asl_parse_time(char *a1)
{
  return asl_core_parse_time(a1, 0);
}

void *asl_string_new(int a1)
{
  uint64_t result = malloc_type_calloc(1uLL, 0x30uLL, 0x1010040C41FE6D2uLL);
  if (result)
  {
    *uint64_t result = 0x100000006;
    *((_DWORD *)result + 2) = a1;
    result[2] = 256;
    if (a1 < 0) {
      result[2] = *MEMORY[0x263EF8C78];
    }
    result[3] = 0;
    result[4] = 0;
    if ((a1 & 0x40000000) != 0) {
      return asl_string_append_no_encoding_len(result, "         0 ", 0xBuLL);
    }
  }
  return result;
}

void *asl_string_append_no_encoding_len(void *a1, char *__s, size_t a3)
{
  if (a1 && __s)
  {
    size_t v5 = a3;
    if (!a3) {
      size_t v5 = strlen(__s);
    }
    if (a1[3]) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = v5 + 1;
    }
    if ((_asl_string_grow((uint64_t)a1, v6) & 0x80000000) == 0)
    {
      memcpy((void *)(a1[5] + a1[4]), __s, v5);
      uint64_t v7 = a1[5];
      size_t v8 = a1[4] + v5;
      a1[4] = v8;
      *(unsigned char *)(v7 + v8) = 0;
    }
  }
  return a1;
}

uint64_t asl_string_retain(uint64_t result)
{
  if (result) {
    atomic_fetch_add((atomic_uint *volatile)(result + 4), 1u);
  }
  return result;
}

void asl_string_release(uint64_t a1)
{
  if (a1 && atomic_fetch_add((atomic_uint *volatile)(a1 + 4), 0xFFFFFFFF) == 1)
  {
    if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0) {
      MEMORY[0x210558590](*MEMORY[0x263EF8C60], *(void *)(a1 + 40), *(void *)(a1 + 24));
    }
    else {
      free(*(void **)(a1 + 40));
    }
    free((void *)a1);
  }
}

char *asl_string_release_return_bytes(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8C08];
  if (!a1) {
    return 0;
  }
  if ((*((unsigned char *)a1 + 11) & 0x40) != 0)
  {
    snprintf(__str, 0xBuLL, "%10lu", *((void *)a1 + 4) - 10);
    uint64_t v2 = *((void *)a1 + 5);
    *(void *)uint64_t v2 = *(void *)__str;
    *(_WORD *)(v2 + 8) = v8;
  }
  if (atomic_fetch_add((atomic_uint *volatile)a1 + 1, 0xFFFFFFFF) == 1)
  {
    uint64_t v3 = *((void *)a1 + 5);
    free(a1);
    return (char *)v3;
  }
  if ((*((_DWORD *)a1 + 2) & 0x80000000) != 0)
  {
    vm_size_t v6 = *((void *)a1 + 3);
    if (v6)
    {
      *(void *)__str = 0;
      uint64_t v3 = 0;
      if (!vm_allocate(*MEMORY[0x263EF8C60], (vm_address_t *)__str, v6, 1358954497))
      {
        memcpy(*(void **)__str, *((const void **)a1 + 5), *((void *)a1 + 3));
        return *(char **)__str;
      }
      return (char *)v3;
    }
    return 0;
  }
  if (!*((void *)a1 + 4)) {
    return 0;
  }
  int v4 = (const char *)*((void *)a1 + 5);

  return strdup(v4);
}

uint64_t asl_string_bytes(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x263EF8C08];
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 11) & 0x40) != 0)
    {
      snprintf(__str, 0xBuLL, "%10lu", *(void *)(result + 32) - 10);
      uint64_t v2 = *(void *)(v1 + 40);
      *(void *)uint64_t v2 = *(void *)__str;
      *(_WORD *)(v2 + 8) = v4;
    }
    return *(void *)(v1 + 40);
  }
  return result;
}

uint64_t asl_string_length(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 32);
    if (v1) {
      return v1 + 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t asl_string_allocated_size(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void *asl_string_append_char_no_encoding(void *a1, char a2)
{
  if (a1)
  {
    if (a1[3]) {
      unint64_t v4 = 1;
    }
    else {
      unint64_t v4 = 2;
    }
    if ((_asl_string_grow((uint64_t)a1, v4) & 0x80000000) == 0)
    {
      *(unsigned char *)(a1[5] + a1[4]) = a2;
      uint64_t v5 = a1[5];
      uint64_t v6 = a1[4] + 1;
      a1[4] = v6;
      *(unsigned char *)(v5 + v6) = 0;
    }
  }
  return a1;
}

uint64_t _asl_string_grow(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v4 = (size_t *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v3 + ~v5 >= a2) {
      return 0;
    }
    size_t v6 = (v5 + a2 + *(void *)(a1 + 16)) / *(void *)(a1 + 16) * *(void *)(a1 + 16);
  }
  else
  {
    size_t v6 = (a2 + *(void *)(a1 + 16) - 1) / *(void *)(a1 + 16) * *(void *)(a1 + 16);
  }
  if ((*(_DWORD *)(a1 + 8) & 0x80000000) == 0)
  {
    __int16 v8 = reallocf(*(void **)(a1 + 40), v6);
    *(void *)(a1 + 40) = v8;
    if (v8)
    {
      uint64_t result = 0;
      *unint64_t v4 = v6;
      return result;
    }
    *unint64_t v4 = 0;
    v4[1] = 0;
    return 0xFFFFFFFFLL;
  }
  vm_address_t address = 0;
  uint64_t v9 = (unsigned int *)MEMORY[0x263EF8C60];
  if (vm_allocate(*MEMORY[0x263EF8C60], &address, v6, 1358954497)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = *(const void **)(a1 + 40);
  if (v10)
  {
    memcpy((void *)address, v10, *(void *)(a1 + 24));
    MEMORY[0x210558590](*v9, *(void *)(a1 + 40), *(void *)(a1 + 24));
  }
  uint64_t result = 0;
  *(void *)(a1 + 40) = address;
  *(void *)(a1 + 24) = v6;
  return result;
}

void *asl_string_append_no_encoding(void *a1, char *a2)
{
  return asl_string_append_no_encoding_len(a1, a2, 0);
}

uint64_t asl_string_append(uint64_t a1, char *a2)
{
  return asl_string_append_internal(a1, a2, 0);
}

uint64_t asl_string_append_internal(uint64_t a1, char *a2, int a3)
{
  uint64_t v3 = a1;
  uint64_t v33 = *MEMORY[0x263EF8C08];
  if (!a1) {
    return v3;
  }
  unint64_t v4 = a2;
  if (!a2) {
    return v3;
  }
  switch(*(_DWORD *)(a1 + 8) & 0xF)
  {
    case 0:
      size_t v5 = 0;
      goto LABEL_143;
    case 1:
      int v6 = *a2;
      if (!*a2) {
        return v3;
      }
      size_t v5 = 0;
      uint64_t v7 = 0;
      while (1)
      {
        int v8 = v4[1];
        if (v4[1]) {
          unsigned __int8 v9 = v4[2];
        }
        else {
          unsigned __int8 v9 = 0;
        }
        if (v6 == 8)
        {
          if (v5)
          {
            asl_string_append_no_encoding_len((void *)v3, v7, v5);
            uint64_t v7 = 0;
          }
          uint64_t v10 = (void *)v3;
          int v11 = "^H";
        }
        else
        {
          if (v6 == 13 || v6 == 10)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v7, v5);
              uint64_t v7 = 0;
            }
          }
          else
          {
            if (v6 == 194 && v8 == 133)
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v7, v5);
                uint64_t v7 = 0;
              }
              asl_string_append_no_encoding_len((void *)v3, "\n\t", 2uLL);
              size_t v5 = 0;
              ++v4;
              goto LABEL_20;
            }
            if (v6 != 226 || v8 != 128 || (v9 & 0xFE) != 0xA8)
            {
              if (!v7) {
                uint64_t v7 = v4;
              }
              ++v5;
              goto LABEL_20;
            }
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v7, v5);
              uint64_t v7 = 0;
            }
            v4 += 3;
          }
          uint64_t v10 = (void *)v3;
          int v11 = "\n\t";
        }
        asl_string_append_no_encoding_len(v10, v11, 2uLL);
        size_t v5 = 0;
LABEL_20:
        int v12 = *++v4;
        int v6 = v12;
        if (!v12)
        {
          if (v5)
          {
            a1 = v3;
            a2 = v7;
            goto LABEL_143;
          }
          return v3;
        }
      }
    case 2:
      unsigned __int8 v13 = *a2;
      if (!*a2) {
        return v3;
      }
      size_t v5 = 0;
      int v15 = 0;
      do
      {
        if ((v13 & 0x80) != 0)
        {
          if (v13 == 160)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v15, v5);
              int v15 = 0;
            }
            int v17 = (void *)v3;
            int v18 = "\\240";
            size_t v19 = 4;
            goto LABEL_85;
          }
          if (v5)
          {
            asl_string_append_no_encoding_len((void *)v3, v15, v5);
            int v15 = 0;
          }
          asl_string_append_no_encoding_len((void *)v3, "\\M", 2uLL);
          size_t v5 = 0;
          unsigned __int8 v16 = v13 & 0x7F;
        }
        else
        {
          unsigned __int8 v16 = v13;
        }
        if (v16 == 32)
        {
          if (a3)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v15, v5);
              int v15 = 0;
            }
            int v17 = (void *)v3;
            int v18 = "\\s";
LABEL_84:
            size_t v19 = 2;
LABEL_85:
            asl_string_append_no_encoding_len(v17, v18, v19);
LABEL_86:
            size_t v5 = 0;
            goto LABEL_87;
          }
        }
        else
        {
          unsigned int v20 = v16;
          if ((v13 & 0x80) == 0 && v16 == 92)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v15, v5);
              int v15 = 0;
            }
            int v17 = (void *)v3;
            int v18 = "\\\\"";
            goto LABEL_84;
          }
          if ((v13 & 0x80) == 0 && (*(_DWORD *)(v3 + 8) & 2) != 0)
          {
            int v21 = *v4;
            if (v21 == 93 || v21 == 91)
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v15, v5);
                int v15 = 0;
                int v21 = *v4;
              }
              int v17 = (void *)v3;
              if (v21 == 91) {
                int v18 = "\\[";
              }
              else {
                int v18 = "\\]";
              }
              goto LABEL_84;
            }
          }
          if (v20 == 127)
          {
            if ((v13 & 0x80) != 0)
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v15, v5);
                int v15 = 0;
              }
            }
            else
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v15, v5);
                int v15 = 0;
              }
              asl_string_append_char_no_encoding((void *)v3, 92);
            }
            int v17 = (void *)v3;
            int v18 = "^?";
            goto LABEL_84;
          }
          if ((v20 - 33) > 0x5Du)
          {
            if ((v13 & 0x80) != 0 || (v20 - 7) > 6u)
            {
              if (v20 > 0x1F) {
                goto LABEL_94;
              }
              if ((v13 & 0x80) != 0)
              {
                if (v5)
                {
                  asl_string_append_no_encoding_len((void *)v3, v15, v5);
                  int v15 = 0;
                }
              }
              else
              {
                if (v5)
                {
                  asl_string_append_no_encoding_len((void *)v3, v15, v5);
                  int v15 = 0;
                }
                asl_string_append_char_no_encoding((void *)v3, 92);
              }
              appended = asl_string_append_char_no_encoding((void *)v3, 94);
              char v23 = v20 + 64;
            }
            else
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((void *)v3, v15, v5);
                int v15 = 0;
              }
              appended = asl_string_append_char_no_encoding((void *)v3, 92);
              char v23 = aAbtnvfr[v20 - 7];
            }
LABEL_100:
            asl_string_append_char_no_encoding(appended, v23);
            goto LABEL_86;
          }
          if ((v13 & 0x80) != 0)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((void *)v3, v15, v5);
              int v15 = 0;
            }
            appended = asl_string_append_char_no_encoding((void *)v3, 45);
            char v23 = v20;
            goto LABEL_100;
          }
        }
LABEL_94:
        if (!v15) {
          int v15 = v4;
        }
        ++v5;
LABEL_87:
        int v24 = *++v4;
        unsigned __int8 v13 = v24;
      }
      while (v24);
      if (v5)
      {
        a1 = v3;
        a2 = v15;
LABEL_143:
        asl_string_append_no_encoding_len((void *)a1, a2, v5);
      }
      return v3;
    case 3:
      uint64_t v25 = 0;
      size_t v26 = 0;
      while (2)
      {
        unsigned int v27 = *v4;
        if (v27 <= 0x26)
        {
          if (v27 == 34)
          {
            if (v26)
            {
              asl_string_append_no_encoding_len((void *)v3, v25, v26);
              uint64_t v25 = 0;
            }
            uint64_t v28 = (void *)v3;
            uint64_t v29 = "&quot;";
            goto LABEL_130;
          }
          if (v27 == 38)
          {
            if (v26)
            {
              asl_string_append_no_encoding_len((void *)v3, v25, v26);
              uint64_t v25 = 0;
            }
            uint64_t v28 = (void *)v3;
            uint64_t v29 = "&amp;";
            size_t v30 = 5;
            goto LABEL_131;
          }
          if (!*v4)
          {
            if (v26)
            {
              a1 = v3;
              a2 = v25;
              size_t v5 = v26;
              goto LABEL_143;
            }
            return v3;
          }
        }
        else
        {
          switch(v27)
          {
            case '\'':
              if (v26)
              {
                asl_string_append_no_encoding_len((void *)v3, v25, v26);
                uint64_t v25 = 0;
              }
              uint64_t v28 = (void *)v3;
              uint64_t v29 = "&apos;";
              goto LABEL_130;
            case '<':
              if (v26)
              {
                asl_string_append_no_encoding_len((void *)v3, v25, v26);
                uint64_t v25 = 0;
              }
              uint64_t v28 = (void *)v3;
              uint64_t v29 = "&lt;";
              goto LABEL_120;
            case '>':
              if (v26)
              {
                asl_string_append_no_encoding_len((void *)v3, v25, v26);
                uint64_t v25 = 0;
              }
              uint64_t v28 = (void *)v3;
              uint64_t v29 = "&gt;";
LABEL_120:
              size_t v30 = 4;
LABEL_131:
              asl_string_append_no_encoding_len(v28, v29, v30);
              size_t v26 = 0;
LABEL_132:
              ++v4;
              continue;
          }
        }
        break;
      }
      if ((v27 & 0x80) != 0)
      {
        if (__maskrune(*v4, 0x200uLL)) {
          goto LABEL_127;
        }
      }
      else if ((*(_DWORD *)(MEMORY[0x263EF8C00] + 4 * *v4 + 60) & 0x200) != 0)
      {
LABEL_127:
        if (v26)
        {
          asl_string_append_no_encoding_len((void *)v3, v25, v26);
          uint64_t v25 = 0;
        }
        snprintf(__str, 8uLL, "&#x%02hhx;", v27);
        uint64_t v29 = __str;
        uint64_t v28 = (void *)v3;
LABEL_130:
        size_t v30 = 6;
        goto LABEL_131;
      }
      if (!v25) {
        uint64_t v25 = v4;
      }
      ++v26;
      goto LABEL_132;
    default:
      return v3;
  }
}

uint64_t asl_string_append_asl_key(uint64_t a1, char *a2)
{
  return asl_string_append_internal(a1, a2, 1);
}

void *asl_string_append_op(void *result, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8C08];
  if (!result) {
    return result;
  }
  if (!a2) {
    return asl_string_append_char_no_encoding(result, 46);
  }
  if ((a2 & 0x10) != 0)
  {
    v7[0] = 67;
    int v2 = 1;
    if ((a2 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v2 = 0;
  if ((a2 & 0x100) != 0) {
LABEL_7:
  }
    v7[v2++] = 82;
LABEL_8:
  if ((a2 & 0x80) != 0)
  {
    v7[v2++] = 78;
    if ((a2 & 0x20) == 0)
    {
LABEL_10:
      if ((a2 & 0x40) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((a2 & 0x20) == 0)
  {
    goto LABEL_10;
  }
  if ((a2 & 0x40) != 0)
  {
    v7[v2++] = 83;
LABEL_16:
    v7[v2++] = 90;
    goto LABEL_17;
  }
  v7[v2++] = 65;
LABEL_17:
  int v3 = a2 & 7;
  char v4 = 61;
  int v5 = v2;
  switch(a2 & 7)
  {
    case 1:
      goto LABEL_28;
    case 2:
      char v4 = 62;
      goto LABEL_27;
    case 3:
      int v5 = v2 + 1;
      char v6 = 62;
      goto LABEL_24;
    case 4:
      char v4 = 60;
      goto LABEL_27;
    case 5:
      int v5 = v2 + 1;
      char v6 = 60;
LABEL_24:
      v7[v2] = v6;
      char v4 = 61;
      int v3 = 2;
      goto LABEL_28;
    case 6:
      char v4 = 33;
      goto LABEL_27;
    case 7:
      char v4 = 84;
LABEL_27:
      int v3 = 1;
      int v5 = v2;
LABEL_28:
      v2 += v3;
      v7[v5] = v4;
      break;
    default:
      if (!v2) {
        return asl_string_append_char_no_encoding(result, 46);
      }
      break;
  }
  v7[v2] = 0;
  return asl_string_append_no_encoding_len(result, v7, 0);
}

void *asl_string_append_xml_tag(void *a1, char *a2, char *a3)
{
  appended = asl_string_append_no_encoding_len(a1, "\t\t<", 3uLL);
  char v6 = asl_string_append_no_encoding_len(appended, a2, 0);
  uint64_t v7 = asl_string_append_char_no_encoding(v6, 62);
  uint64_t v8 = (void *)asl_string_append_internal((uint64_t)v7, a3, 0);
  unsigned __int8 v9 = asl_string_append_no_encoding_len(v8, "</", 2uLL);
  uint64_t v10 = asl_string_append_no_encoding_len(v9, a2, 0);

  return asl_string_append_no_encoding_len(v10, ">\n", 2uLL);
}

void _asl_redirect_fork_child()
{
  if (redirect_descriptors)
  {
    free((void *)redirect_descriptors);
    n_redirect_descriptors = 0;
    redirect_descriptors = 0;
  }
}

int asl_log_descriptor(asl_object_t asl, asl_object_t msg, int level, int descriptor, uint32_t fd_type)
{
  uint64_t v15 = *MEMORY[0x263EF8C08];
  uint64_t v10 = __error();
  if (fd_type != 1)
  {
    if (fd_type != 2) {
      asl_log_descriptor_cold_1();
    }
    int v12 = *v10;
    if (pipe(v14) != -1 && fcntl(v14[0], 2, 1) != -1)
    {
      if (dup2(v14[1], descriptor) != -1)
      {
        if (descriptor == 1) {
          setlinebuf((FILE *)*MEMORY[0x263EF8C18]);
        }
        close(v14[1]);
        return asl_log_from_descriptor((uint64_t)asl, (int *)msg, level, v14[0]);
      }
      close(v14[0]);
      close(v14[1]);
    }
    int v13 = *__error();
    *__error() = v12;
    return v13;
  }

  return asl_log_from_descriptor((uint64_t)asl, (int *)msg, level, descriptor);
}

uint64_t asl_log_from_descriptor(uint64_t a1, int *obj, int a3, int a4)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = 0;
  if (asl_log_from_descriptor_once_control != -1)
  {
    dispatch_once_f(&asl_log_from_descriptor_once_control, 0, (dispatch_function_t)asl_descriptor_init);
    if ((a4 & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v8 = 9;
    goto LABEL_11;
  }
  if (a4 < 0) {
    goto LABEL_10;
  }
LABEL_3:
  if (obj && (obj = asl_msg_copy((asl_object_t)obj)) == 0)
  {
    uint64_t v8 = 12;
  }
  else
  {
    v10[0] = MEMORY[0x263EF8BF8];
    v10[1] = 0x40000000;
    v10[2] = __asl_log_from_descriptor_block_invoke;
    v10[3] = &unk_264104858;
    int v11 = a4;
    int v12 = a3;
    v10[4] = &v13;
    v10[5] = a1;
    v10[6] = obj;
    dispatch_sync((dispatch_queue_t)redirect_serial_q, v10);
    if (*((_DWORD *)v14 + 6))
    {
      asl_msg_release((asl_object_t)obj);
      uint64_t v8 = *((unsigned int *)v14 + 6);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
LABEL_11:
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t asl_descriptor_init()
{
  redirect_descriptors = (uint64_t)malloc_type_calloc(0x10uLL, 0x30uLL, 0x10300407440E19AuLL);
  if (!redirect_descriptors) {
    asl_descriptor_init_cold_1();
  }
  n_redirect_descriptors = 16;
  redirect_serial_q = (uint64_t)dispatch_queue_create("com.apple.asl-redirect", 0);
  if (!redirect_serial_q) {
    asl_descriptor_init_cold_2();
  }
  read_source_uuid_t group = (uint64_t)dispatch_group_create();
  if (!read_source_group) {
    asl_descriptor_init_cold_3();
  }

  return atexit((void (*)(void))redirect_atexit);
}

void __asl_log_from_descriptor_block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 >= n_redirect_descriptors)
  {
    int v4 = 1 << (fls(v2) + 1);
    int v5 = (char *)malloc_type_realloc((void *)redirect_descriptors, 48 * v4, 0x10300407440E19AuLL);
    if (!v5)
    {
LABEL_11:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *__error();
      return;
    }
    uint64_t v3 = (uint64_t)v5;
    redirect_descriptors = (uint64_t)v5;
    bzero(&v5[48 * n_redirect_descriptors], 48 * (v4 - (uint64_t)n_redirect_descriptors));
    n_redirect_descriptors = v4;
    int v2 = *(_DWORD *)(a1 + 56);
  }
  else
  {
    uint64_t v3 = redirect_descriptors;
  }
  if (*(void *)(v3 + 48 * v2 + 24))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 9;
    return;
  }
  char v6 = malloc_type_malloc(0x200uLL, 0x84842478uLL);
  uint64_t v7 = redirect_descriptors;
  int v8 = *(_DWORD *)(a1 + 56);
  *(void *)(redirect_descriptors + 48 * v8 + 24) = v6;
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v9 = v7 + 48 * v8;
  *(void *)(v9 + 32) = v6;
  *(_DWORD *)uint64_t v9 = *(_DWORD *)(a1 + 60);
  asl_object_t v10 = asl_client_retain(*(asl_object_t *)(a1 + 40));
  int v11 = *(_DWORD *)(a1 + 56);
  uint64_t v12 = redirect_descriptors + 48 * v11;
  *(void *)(v12 + 8) = v10;
  *(void *)(v12 + 16) = *(void *)(a1 + 48);
  fcntl(v11, 4, 4);
  uint64_t v13 = dispatch_source_create(MEMORY[0x263EF8BE0], *(int *)(a1 + 56), 0, (dispatch_queue_t)redirect_serial_q);
  *(void *)(redirect_descriptors + 48 * *(int *)(a1 + 56) + 40) = v13;
  dispatch_set_context(v13, v13);
  dispatch_source_set_event_handler_f(v13, (dispatch_function_t)read_from_source);
  dispatch_source_set_cancel_handler_f(v13, (dispatch_function_t)cancel_source);
  dispatch_group_enter((dispatch_group_t)read_source_group);

  dispatch_resume(v13);
}

void read_from_source(NSObject *a1)
{
  int handle = dispatch_source_get_handle(a1);
  if (_read_redirect(handle, 0) == -1)
  {
    dispatch_source_cancel(a1);
  }
}

void cancel_source(NSObject *a1)
{
  int handle = dispatch_source_get_handle(a1);
  uint64_t v3 = redirect_descriptors + 48 * handle;
  _read_redirect(handle, 1);
  close(handle);
  asl_client_release(*(asl_object_t *)(v3 + 8));
  asl_msg_release(*(asl_object_t *)(v3 + 16));
  free(*(void **)(v3 + 24));
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  dispatch_release(a1);
  int v4 = read_source_group;

  dispatch_group_leave(v4);
}

intptr_t redirect_atexit()
{
  int v0 = n_redirect_descriptors;
  if (n_redirect_descriptors <= 1)
  {
LABEL_4:
    if (v0 < 1) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  if (*(void *)(redirect_descriptors + 72))
  {
    fflush((FILE *)*MEMORY[0x263EF8C18]);
    int v0 = n_redirect_descriptors;
    goto LABEL_4;
  }
LABEL_5:
  uint64_t v1 = 0;
  uint64_t v2 = redirect_descriptors;
  uint64_t v3 = 40;
  do
  {
    int v4 = *(NSObject **)(v2 + v3);
    if (v4)
    {
      dispatch_source_cancel(v4);
      uint64_t v2 = redirect_descriptors;
      int v0 = n_redirect_descriptors;
    }
    ++v1;
    v3 += 48;
  }
  while (v1 < v0);
LABEL_9:
  int v5 = read_source_group;
  dispatch_time_t v6 = dispatch_time(0, 3000000000);

  return dispatch_group_wait(v5, v6);
}

uint64_t _read_redirect(int a1, int a2)
{
  uint64_t v3 = redirect_descriptors;
  uint64_t v4 = redirect_descriptors + 48 * a1;
  int v5 = (const char **)(v4 + 32);
  uint64_t v7 = (void **)(v4 + 24);
  ssize_t v8 = read(a1, *(void **)(v4 + 32), *(void *)(v4 + 24) - *(void *)(v4 + 32) + 511);
  int v20 = a1;
  uint64_t v21 = v3;
  if (v8 < 1)
  {
    unsigned int v10 = 0;
  }
  else
  {
    uint64_t v9 = v3 + 48 * a1;
    unsigned int v10 = 0;
    int v11 = (asl_object_t *)(v9 + 8);
    uint64_t v12 = (asl_object_t *)(v9 + 16);
    do
    {
      uint64_t v13 = &(*v5)[v8];
      *int v5 = v13;
      const char *v13 = 0;
      uint64_t v14 = (const char *)*v7;
      uint64_t v15 = (char *)*v5;
      if (*v7 >= *v5)
      {
        int v17 = (char *)*v7;
      }
      else
      {
        unsigned int v22 = v10;
        while (1)
        {
          uint64_t v16 = 0;
          int v17 = (char *)v14;
          while (v14[v16])
          {
            if (v14[v16] == 10)
            {
              v14[v16] = 0;
              uint64_t v15 = (char *)*v5;
              break;
            }
            ++v16;
          }
          int v18 = &v14[v16];
          if (&v14[v16] >= v15 && *v7 != v14) {
            break;
          }
          asl_log(*v11, *v12, *(_DWORD *)v4, "%s", v14);
          uint64_t v14 = v18 + 1;
          uint64_t v15 = (char *)*v5;
          if (v18 + 1 >= *v5)
          {
            uint64_t v14 = (const char *)*v7;
            v17 += v16 + 1;
            goto LABEL_16;
          }
        }
        memmove(*v7, v14, (unsigned char *)*v7 - v14 + 512);
        uint64_t v14 = (const char *)*v7;
        uint64_t v15 = (char *)*v7 + v16;
        *int v5 = v15;
LABEL_16:
        unsigned int v10 = v22;
      }
      if (v17 == v15)
      {
        *int v5 = v14;
        uint64_t v15 = (char *)v14;
      }
      v10 += v8;
      ssize_t v8 = read(a1, v15, v14 - v15 + 511);
    }
    while (v8 > 0);
  }
  if ((a2 || !v8) && *v5 > *v7)
  {
    **int v5 = 0;
    asl_log(*(asl_object_t *)(v21 + 48 * v20 + 8), *(asl_object_t *)(v21 + 48 * v20 + 16), *(_DWORD *)v4, "%s", (const char *)*v7);
  }
  if (v8) {
    return v10;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

double asl_msg_list_new()
{
  int v0 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
  if (v0)
  {
    *(void *)&double result = 0x100000002;
    void *v0 = 0x100000002;
  }
  return result;
}

void *asl_msg_list_new_count(unsigned int a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
  uint64_t v3 = v2;
  if (v2)
  {
    *(void *)uint64_t v2 = 0x100000002;
    *((_DWORD *)v2 + 2) = a1;
    uint64_t v4 = reallocf(*((void **)v2 + 2), 8 * a1);
    v3[2] = v4;
    if (!v4)
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

asl_object_t asl_msg_list_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

void asl_msg_list_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

char *asl_msg_list_to_string(char *result, _DWORD *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  if (result)
  {
    uint64_t v2 = result;
    if (*((_DWORD *)result + 2) && *((void *)result + 2))
    {
      double result = (char *)asl_string_new(2);
      if (result)
      {
        uint64_t v4 = result;
        snprintf(__str, 0x10uLL, "%u", *((_DWORD *)v2 + 2));
        asl_string_append((uint64_t)v4, __str);
        asl_string_append_char_no_encoding(v4, 10);
        if (*((_DWORD *)v2 + 2))
        {
          unint64_t v5 = 0;
          do
          {
            asl_string_append_asl_msg(v4, *(_DWORD **)(*((void *)v2 + 2) + 8 * v5));
            asl_string_append_char_no_encoding(v4, 10);
            ++v5;
          }
          while (v5 < *((unsigned int *)v2 + 2));
        }
        *a2 = asl_string_length((uint64_t)v4);
        return asl_string_release_return_bytes(v4);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *asl_msg_list_to_asl_string(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  if (!a1 || !*(_DWORD *)(a1 + 8) || !*(void *)(a1 + 16)) {
    return 0;
  }
  uint64_t v3 = asl_string_new(a2);
  if (v3)
  {
    snprintf(__str, 0x10uLL, "%u", *(_DWORD *)(a1 + 8));
    asl_string_append((uint64_t)v3, __str);
    asl_string_append_char_no_encoding(v3, 10);
    if (*(_DWORD *)(a1 + 8))
    {
      unint64_t v4 = 0;
      do
      {
        asl_string_append_asl_msg(v3, *(_DWORD **)(*(void *)(a1 + 16) + 8 * v4));
        asl_string_append_char_no_encoding(v3, 10);
        ++v4;
      }
      while (v4 < *(unsigned int *)(a1 + 8));
    }
  }
  return v3;
}

__asl_object_s *asl_msg_list_from_string(const char *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (char *)a1;
  int v2 = atoi(a1);
  if (!v2) {
    return 0;
  }
  int v3 = v2;
  unint64_t v4 = (__asl_object_s *)malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
  unint64_t v5 = v4;
  if (v4)
  {
    *(void *)unint64_t v4 = 0x100000002;
    while (1)
    {
      dispatch_time_t v6 = strchr(v1, 10);
      if (!v6) {
        break;
      }
      uint64_t v1 = v6 + 1;
      uint64_t v7 = asl_msg_from_string((uint64_t)(v6 + 1));
      if (!v7) {
        break;
      }
      ssize_t v8 = v7;
      asl_msg_list_insert((uint64_t)v5, 0xFFFFFFFF, v7);
      asl_msg_release(v8);
      if (!--v3) {
        return v5;
      }
    }
    asl_release(v5);
    return 0;
  }
  return v5;
}

void asl_msg_list_append(uint64_t a1, asl_object_t obj)
{
}

void asl_msg_list_insert(uint64_t a1, unsigned int a2, asl_object_t obj)
{
  if (a1)
  {
    if (obj)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 8);
      if (v5 != -1)
      {
        if (v5 >= a2) {
          unsigned int v6 = a2;
        }
        else {
          unsigned int v6 = *(_DWORD *)(a1 + 8);
        }
        uint32_t type = asl_get_type(obj);
        if (type >= 2)
        {
          unsigned int v8 = asl_object_count(obj);
          if (!v8) {
            return;
          }
        }
        else
        {
          unsigned int v8 = 1;
        }
        uint64_t v9 = *(unsigned int *)(a1 + 8);
        if (!((v9 + (unint64_t)v8) >> 32))
        {
          unsigned int v10 = reallocf(*(void **)(a1 + 16), 8 * (v9 + v8));
          *(void *)(a1 + 16) = v10;
          if (v10)
          {
            uint64_t v11 = *(unsigned int *)(a1 + 8);
            if (v11 > v6)
            {
              uint64_t v12 = 8 * v11;
              uint64_t v13 = 8 * (v11 - 1);
              do
              {
                *(void *)(*(void *)(a1 + 16) + v12) = *(void *)(*(void *)(a1 + 16) + v13);
                v12 -= 8;
                v13 -= 8;
                LODWORD(v11) = v11 - 1;
              }
              while (v6 < v11);
            }
            asl_object_set_iteration_index(obj, 0);
            if (type >= 2)
            {
              unsigned int v14 = v8;
              do
              {
                *(void *)(*(void *)(a1 + 16) + 8 * v6++) = asl_object_next(obj);
                --v14;
              }
              while (v14);
            }
            else
            {
              *(void *)(*(void *)(a1 + 16) + 8 * v6) = asl_retain(obj);
            }
            asl_object_set_iteration_index(obj, 0);
            *(_DWORD *)(a1 + 8) += v8;
          }
          else
          {
            *(void *)(a1 + 8) = 0;
          }
        }
      }
    }
  }
}

void asl_msg_list_prepend(uint64_t a1, asl_object_t obj)
{
}

uint64_t asl_msg_list_count(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t asl_msg_list_get_index(uint64_t result, unint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned int *)(result + 8) <= a2)
    {
      return 0;
    }
    else
    {
      uint64_t v3 = *(void *)(result + 16);
      if (v3)
      {
        return *(void *)(v3 + 8 * a2);
      }
      else
      {
        double result = 0;
        *(void *)(v2 + 8) = 0;
      }
    }
  }
  return result;
}

void *asl_msg_list_remove_index(void *result, unint64_t a2)
{
  if (result)
  {
    unsigned int v2 = a2;
    uint64_t v3 = result;
    if (*((unsigned int *)result + 2) > a2)
    {
      uint64_t v4 = result[2];
      if (!v4) {
        goto LABEL_8;
      }
      asl_msg_release(*(asl_object_t *)(v4 + 8 * a2));
      unsigned int v5 = *((_DWORD *)v3 + 2);
      if (v2 + 1 < v5)
      {
        uint64_t v6 = 8 * (v2 + 1);
        unsigned int v7 = ~v2 + v5;
        do
        {
          *(void *)(v3[2] + 8 * v2) = *(void *)(v3[2] + v6);
          v6 += 8;
          --v7;
        }
        while (v7);
      }
      unsigned int v8 = v5 - 1;
      *((_DWORD *)v3 + 2) = v8;
      double result = reallocf((void *)v3[2], 8 * v8);
      v3[2] = result;
      if (!result) {
LABEL_8:
      }
        v3[1] = 0;
    }
  }
  return result;
}

uint64_t asl_msg_list_next(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = *(unsigned int *)(a1 + 12);
  if (v1 >= *(_DWORD *)(a1 + 8)) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v2 = *(void *)(v2 + 8 * v1);
    *(_DWORD *)(a1 + 12) = v1 + 1;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
  }
  return v2;
}

uint64_t asl_msg_list_prev(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  unsigned int v1 = *(_DWORD *)(a1 + 12);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    if (v1 >= *(_DWORD *)(a1 + 8)) {
      unsigned int v1 = *(_DWORD *)(a1 + 8);
    }
    unsigned int v3 = v1 - 1;
    *(_DWORD *)(a1 + 12) = v3;
    return *(void *)(v2 + 8 * v3);
  }
  else
  {
    uint64_t v4 = 0;
    *(void *)(a1 + 8) = 0;
  }
  return v4;
}

uint64_t asl_msg_list_reset_iteration(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (*(unsigned int *)(result + 8) < a2) {
      int v2 = -1;
    }
    else {
      int v2 = a2;
    }
    *(_DWORD *)(result + 12) = v2;
  }
  return result;
}

uint64_t asl_msg_list_search(uint64_t a1, _DWORD *a2)
{
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 16))
  {
    uint64_t v5 = 0;
    *(void *)(a1 + 8) = 0;
    return v5;
  }
  if (!*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  unint64_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    if (!a2 || asl_msg_cmp(a2, *(_DWORD **)(*(void *)(a1 + 16) + 8 * v4)))
    {
      if (!v5)
      {
        uint64_t v6 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
        uint64_t v5 = (uint64_t)v6;
        if (!v6) {
          return v5;
        }
        void *v6 = 0x100000002;
      }
      asl_msg_list_insert(v5, 0xFFFFFFFF, *(asl_object_t *)(*(void *)(a1 + 16) + 8 * v4));
    }
    ++v4;
  }
  while (v4 < *(unsigned int *)(a1 + 8));
  return v5;
}

uint64_t asl_msg_list_match(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4, unint64_t a5, unsigned int a6, int a7)
{
  v27.tv_sec = 0;
  *(void *)&v27.tv_usec = 0;
  if (!a1) {
    return 0;
  }
  if (*(void *)(a1 + 16))
  {
    v26.tv_sec = 0;
    *(void *)&v26.tv_usec = 0;
    if (a6 && !gettimeofday(&v26, 0))
    {
      unsigned int v15 = v26.tv_usec + a6 % 0xF4240;
      BOOL v16 = v15 > 0xF4240;
      if (v15 > 0xF4240) {
        v15 -= 1000000;
      }
      __darwin_suseconds_t v24 = v15;
      if (v16) {
        __darwin_time_t v13 = v26.tv_sec + a6 / 0xF4240uLL + 1;
      }
      else {
        __darwin_time_t v13 = v26.tv_sec + a6 / 0xF4240uLL;
      }
    }
    else
    {
      __darwin_suseconds_t v24 = 0;
      __darwin_time_t v13 = 0;
    }
    unint64_t v17 = *(unsigned int *)(a1 + 8);
    int v18 = v17 - 1;
    if (a7 < 0)
    {
      if (v17 <= a4) {
        LODWORD(a4) = v17 - 1;
      }
      int v19 = -1;
      int v18 = 0;
      goto LABEL_18;
    }
    if (v17 > a4)
    {
      int v19 = 1;
LABEL_18:
      unsigned int v20 = 0;
      uint64_t v14 = 0;
      while (!a2)
      {
        int v21 = 1;
        if (a3) {
          goto LABEL_21;
        }
LABEL_22:
        if (v21)
        {
          if (!v14)
          {
            unsigned int v22 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
            uint64_t v14 = (uint64_t)v22;
            if (!v22) {
              return v14;
            }
            void *v22 = 0x100000002;
          }
          asl_msg_list_insert(v14, 0xFFFFFFFF, *(asl_object_t *)(*(void *)(a1 + 16) + 8 * a4));
          ++v20;
        }
        if (v20 >= a5
          || v13 && !gettimeofday(&v27, 0) && (v27.tv_sec > v13 || v27.tv_sec == v13 && v27.tv_usec > v24))
        {
          return v20;
        }
        LODWORD(a4) = a4 + v19;
        if (v18 == a4) {
          return v14;
        }
      }
      int v21 = asl_msg_cmp_list(*(void *)(*(void *)(a1 + 16) + 8 * a4), a2);
      if (!a3) {
        goto LABEL_22;
      }
LABEL_21:
      *a3 = a4;
      goto LABEL_22;
    }
    if (a3)
    {
      uint64_t v14 = 0;
      *a3 = v17;
      return v14;
    }
    return 0;
  }
  uint64_t v14 = 0;
  *(void *)(a1 + 8) = 0;
  return v14;
}

uint64_t _jump_count(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t _jump_next(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = *(unsigned int *)(a1 + 12);
  if (v1 >= *(_DWORD *)(a1 + 8)) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v2 = *(void *)(v2 + 8 * v1);
    *(_DWORD *)(a1 + 12) = v1 + 1;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
  }
  return v2;
}

uint64_t _jump_prev(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  unsigned int v1 = *(_DWORD *)(a1 + 12);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    if (v1 >= *(_DWORD *)(a1 + 8)) {
      unsigned int v1 = *(_DWORD *)(a1 + 8);
    }
    unsigned int v3 = v1 - 1;
    *(_DWORD *)(a1 + 12) = v3;
    return *(void *)(v2 + 8 * v3);
  }
  else
  {
    uint64_t v4 = 0;
    *(void *)(a1 + 8) = 0;
  }
  return v4;
}

uint64_t _jump_get_object_at_index(uint64_t result, unint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned int *)(result + 8) <= a2)
    {
      return 0;
    }
    else
    {
      uint64_t v3 = *(void *)(result + 16);
      if (v3)
      {
        return *(void *)(v3 + 8 * a2);
      }
      else
      {
        double result = 0;
        *(void *)(v2 + 8) = 0;
      }
    }
  }
  return result;
}

uint64_t _jump_set_iteration_index(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (*(unsigned int *)(result + 8) < a2) {
      int v2 = -1;
    }
    else {
      int v2 = a2;
    }
    *(_DWORD *)(result + 12) = v2;
  }
  return result;
}

void _jump_append_0(uint64_t a1, asl_object_t obj)
{
  if (asl_get_type(obj) <= 1)
  {
    asl_msg_list_insert(a1, 0xFFFFFFFF, obj);
  }
}

void _jump_prepend(uint64_t a1, asl_object_t obj)
{
  if (asl_get_type(obj) <= 1)
  {
    asl_msg_list_insert(a1, 0, obj);
  }
}

uint64_t _jump_search_0(uint64_t a1, asl_object_t obj)
{
  uint32_t type = asl_get_type(obj);
  if (obj && type >= 2) {
    return 0;
  }

  return asl_msg_list_search(a1, obj);
}

uint64_t _jump_match_0(uint64_t a1, asl_object_t obj, unint64_t *a3, unint64_t a4, unint64_t a5, unsigned int a6, int a7)
{
  uint32_t type = asl_get_type(obj);
  if (obj && type != 2) {
    return 0;
  }

  return asl_msg_list_match(a1, (uint64_t)obj, a3, a4, a5, a6, a7);
}

asl_object_t asl_file_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

void asl_file_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

uint64_t asl_file_close(__asl_object_s *a1)
{
  if (a1) {
    asl_release(a1);
  }
  return 0;
}

uint64_t asl_file_open_write_fd(int a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8C08];
  uint64_t result = 9999;
  if ((a1 & 0x80000000) == 0 && a2)
  {
    uint64_t v5 = malloc_type_calloc(1uLL, 0x80uLL, 0x10B0040093DCD73uLL);
    if (v5)
    {
      uint64_t v6 = v5;
      *uint64_t v5 = 0x100000003;
      unsigned int v7 = fdopen(a1, "w+");
      v6[13] = v7;
      if (v7)
      {
        long long v13 = 0u;
        memset(v16, 0, sizeof(v16));
        long long v15 = 0u;
        long long v14 = 0u;
        qmemcpy(__ptr, "ASL DB", sizeof(__ptr));
        *(_DWORD *)((char *)&v13 + 6) = 0x2000000;
        time_t v8 = time(0);
        v6[11] = v8;
        *(void *)((char *)&v14 + 2) = asl_core_htonq(v8);
        *(_DWORD *)((char *)&v14 + 10) = 0x80000000;
        int v9 = fwrite(__ptr, 0x50uLL, 1uLL, (FILE *)v6[13]);
        unsigned int v10 = (FILE *)v6[13];
        if (v9 == 1)
        {
          fflush(v10);
          v6[12] = 80;
          uint64_t v11 = malloc_type_malloc(0x11AuLL, 0xB9549B7uLL);
          uint64_t result = 0;
          v6[15] = v11;
          *a2 = v6;
          return result;
        }
        fclose(v10);
      }
      free(v6);
      return 9999;
    }
    else
    {
      return 9;
    }
  }
  return result;
}

uint64_t asl_file_create(const char *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return open(a1, 2562, a4);
}

uint64_t asl_file_open_write(const char *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8C08];
  unsigned int v20 = 0;
  memset(&v21, 0, sizeof(v21));
  if (!stat(a1, &v21))
  {
    if ((v21.st_mode & 0xF000) != 0x8000) {
      return 2;
    }
    if (v21.st_size)
    {
      unsigned int v10 = malloc_type_calloc(1uLL, 0x80uLL, 0x10B0040093DCD73uLL);
      if (!v10) {
        return 9;
      }
      uint64_t v11 = (uint64_t)v10;
      void *v10 = 0x100000003;
      uint64_t v12 = fopen(a1, "r+");
      *(void *)(v11 + 104) = v12;
      if (v12)
      {
        if ((int)fread(&__ptr, 0x50uLL, 1uLL, v12) <= 0) {
          goto LABEL_38;
        }
        BOOL v13 = __ptr == 541872961 && v23 == 16964;
        if (v13 && v24 == 0x2000000)
        {
          *(void *)(v11 + 88) = asl_core_ntohq(v26);
          *(void *)(v11 + 40) = asl_core_ntohq(v25);
          unint64_t v14 = asl_core_ntohq(v27);
          *(void *)(v11 + 48) = v14;
          st_vm_size_t size = v21.st_size;
          *(void *)(v11 + 96) = v21.st_size;
          if (v14 + 122 > st_size)
          {
LABEL_18:
            *(void *)(v11 + 48) = 0;
LABEL_19:
            if (*(_DWORD *)(v11 + 12) == 1)
            {
              uint64_t set_position_last = 9999;
LABEL_32:
              asl_release((asl_object_t)v11);
              return set_position_last;
            }
            uint64_t set_position_last = asl_file_read_set_position_last(v11, 0);
            if (set_position_last) {
              goto LABEL_32;
            }
            *(void *)(v11 + 64) = *(void *)(v11 + 72);
            if (!fseeko(*(FILE **)(v11 + 104), 0, 2))
            {
              *(void *)(v11 + 96) = ftello(*(FILE **)(v11 + 104));
              uint64_t set_position_last = 0;
              *(void *)(v11 + 120) = malloc_type_malloc(0x11AuLL, 0x4CB36572uLL);
              *a5 = v11;
              return set_position_last;
            }
LABEL_38:
            asl_release((asl_object_t)v11);
            return 7;
          }
          uint64_t uint64 = asl_file_read_uint32(v11, v14 + 2, &v20);
          if (!uint64)
          {
            uint64_t v19 = *(void *)(v11 + 48);
            if (v19 + (unint64_t)v20 > *(void *)(v11 + 96)) {
              goto LABEL_18;
            }
            if (!v19) {
              goto LABEL_19;
            }
            uint64_t uint64 = asl_file_read_uint64(v11, v19 + 14, (unint64_t *)(v11 + 56));
            if (!uint64) {
              goto LABEL_19;
            }
          }
          uint64_t set_position_last = uint64;
          goto LABEL_32;
        }
        asl_release((asl_object_t)v11);
        return 2;
      }
      free((void *)v11);
    }
    else
    {
      int v16 = open(a1, 2050, a2);
      if ((v16 & 0x80000000) == 0) {
        return asl_file_open_write_fd(v16, a5);
      }
    }
    return 9999;
  }
  if (*__error() != 2) {
    return 9999;
  }
  int v8 = open(a1, 2562, a2);
  if (v8 < 0) {
    return 9999;
  }
  uint64_t set_position_last = asl_file_open_write_fd(v8, a5);
  if (set_position_last) {
    unlink(a1);
  }
  return set_position_last;
}

uint64_t asl_file_read_uint32(uint64_t a1, off_t a2, _DWORD *a3)
{
  uint64_t v4 = *(FILE **)(a1 + 104);
  if (!v4) {
    return 2;
  }
  if ((unint64_t)(a2 + 4) > *(void *)(a1 + 96)) {
    return 7;
  }
  if (fseeko(v4, a2, 0)) {
    return 7;
  }
  unsigned int __ptr = 0;
  if (fread(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 104)) != 1) {
    return 7;
  }
  uint64_t result = 0;
  if (a3) {
    *a3 = bswap32(__ptr);
  }
  return result;
}

uint64_t asl_file_read_uint64(uint64_t a1, off_t a2, unint64_t *a3)
{
  uint64_t v4 = *(FILE **)(a1 + 104);
  if (!v4) {
    return 2;
  }
  if ((unint64_t)(a2 + 8) > *(void *)(a1 + 96)) {
    return 7;
  }
  if (fseeko(v4, a2, 0)) {
    return 7;
  }
  unint64_t __ptr = 0;
  if (fread(&__ptr, 8uLL, 1uLL, *(FILE **)(a1 + 104)) != 1) {
    return 7;
  }
  if (!a3) {
    return 0;
  }
  unint64_t v6 = asl_core_ntohq(__ptr);
  uint64_t result = 0;
  *a3 = v6;
  return result;
}

uint64_t asl_file_read_set_position(uint64_t a1, int a2)
{
  if (!a1) {
    return 2;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999;
  }
  if (a2 == 3)
  {
    return asl_file_read_set_position_last(a1, 0);
  }
  else
  {
    if (!a2)
    {
      *(void *)(a1 + 80) = 0;
      uint64_t v5 = *(void *)(a1 + 40);
      *(void *)(a1 + 72) = v5;
      if (!v5) {
        return 0;
      }
      return asl_file_read_uint64(a1, v5 + 14, (unint64_t *)(a1 + 80));
    }
    unsigned int v11 = 0;
    if (a2 == 1)
    {
      uint64_t v6 = *(void *)(a1 + 72);
      uint64_t result = 14;
      if (!v6) {
        return result;
      }
      if (v6 == *(void *)(a1 + 40)) {
        return result;
      }
      uint64_t result = asl_file_read_uint32(a1, v6 + 2, &v11);
      if (result) {
        return result;
      }
      off_t v7 = *(void *)(a1 + 72) + v11 - 2;
LABEL_24:
      *(void *)(a1 + 80) = 0;
      unint64_t v12 = 0;
      if (asl_file_read_uint64(a1, v7, &v12)) {
        return 7;
      }
      unint64_t v9 = v12;
      if (v12 + 122 > *(void *)(a1 + 96)) {
        goto LABEL_29;
      }
      unint64_t v10 = *(void *)(a1 + 72);
      if (a2 == 1)
      {
        if (v12 < v10)
        {
          *(void *)(a1 + 72) = v12;
          if (!v9) {
            return 14;
          }
          return asl_file_read_uint64(a1, v9 + 14, (unint64_t *)(a1 + 80));
        }
      }
      else if (v12 > v10)
      {
        *(void *)(a1 + 72) = v12;
        return asl_file_read_uint64(a1, v9 + 14, (unint64_t *)(a1 + 80));
      }
LABEL_29:
      *(void *)(a1 + 72) = 0;
      return 14;
    }
    if (a2 != 2) {
      return 1;
    }
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t result = 14;
    if (v8 && v8 != *(void *)(a1 + 48))
    {
      off_t v7 = v8 + 6;
      goto LABEL_24;
    }
  }
  return result;
}

uint64_t asl_file_compact(uint64_t a1, char *a2, unsigned int a3)
{
  if (!a1) {
    return 2;
  }
  if (!a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999;
  }
  uint64_t v12 = 0;
  BOOL v13 = 0;
  memset(&v14, 0, sizeof(v14));
  if (!stat(a2, &v14) || *__error() != 2) {
    return 9999;
  }
  uint64_t set_position = asl_file_read_set_position(a1, 0);
  if (!set_position)
  {
    long long v15 = 0;
    uint64_t set_position = asl_file_open_write(a2, a3, v6, v7, (uint64_t *)&v15);
    if (!set_position)
    {
      *((_DWORD *)v15 + 2) = 12;
      while (1)
      {
        unint64_t v9 = *(void *)(a1 + 72);
        if (!v9)
        {
          uint64_t set_position = 0;
          goto LABEL_21;
        }
        BOOL v13 = 0;
        if (*(_DWORD *)(a1 + 12) == 1)
        {
          uint64_t set_position = 9999;
          goto LABEL_21;
        }
        uint64_t pos = asl_file_fetch_pos(a1, v9, 1, (int **)&v13);
        if (pos) {
          break;
        }
        uint64_t v12 = 0;
        uint64_t set_position = asl_file_save((uint64_t)v15, v13, &v12);
        asl_msg_release(v13);
        if (set_position) {
          goto LABEL_21;
        }
      }
      uint64_t set_position = pos;
LABEL_21:
      if (v15) {
        asl_release(v15);
      }
    }
  }
  return set_position;
}

uint64_t asl_file_fetch_next(uint64_t a1, int **a2)
{
  if (!a1) {
    return 2;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999;
  }
  return asl_file_fetch_pos(a1, *(void *)(a1 + 72), 1, a2);
}

uint64_t asl_file_save(uint64_t a1, _DWORD *a2, uint64_t *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8C08];
  unint64_t v37 = 0;
  if (!a1 || !*(void *)(a1 + 104)) {
    return 2;
  }
  if (!a2) {
    return 5;
  }
  if (*(unsigned char *)(a1 + 8)) {
    return 11;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  int8x16_t v41 = 0u;
  unint64_t v38 = 0;
  uint64_t v39 = -1;
  if (a3 && *a3) {
    uint64_t v39 = *a3;
  }
  __s1 = 0;
  unint64_t v36 = 0;
  int8x16_t v41 = (int8x16_t)xmmword_20CD77B00;
  LODWORD(v42) = -1;
  *(void *)&long long v40 = 0;
  *((void *)&v40 + 1) = 0x700000000;
  unint64_t v46 = *(void *)(a1 + 64);
  __s = 0;
  unsigned int v6 = asl_msg_fetch(a2, 0, &__s1, (int **)&__s, 0);
  if (v6 != -1)
  {
    unsigned int v7 = v6;
    unint64_t __ptr = 0;
    uint64_t v8 = (unint64_t *)__src;
    while (1)
    {
      unint64_t v9 = __s1;
      if (!__s1) {
        goto LABEL_44;
      }
      if (!strcmp(__s1, "Time"))
      {
        if (__s) {
          *(void *)&long long v40 = asl_core_parse_time(__s, 0);
        }
        goto LABEL_44;
      }
      if (!strcmp(v9, "TimeNanoSec"))
      {
        if (__s) {
          DWORD2(v40) = atoi(__s);
        }
        goto LABEL_44;
      }
      if (!strcmp(v9, "Host"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v43;
        goto LABEL_43;
      }
      if (!strcmp(v9, "Sender"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v43 + 1;
        goto LABEL_43;
      }
      if (!strcmp(v9, "PID"))
      {
        if (__s) {
          v41.i32[0] = atoi(__s);
        }
        goto LABEL_44;
      }
      if (!strcmp(v9, "RefPID"))
      {
        if (__s) {
          DWORD1(v42) = atoi(__s);
        }
        goto LABEL_44;
      }
      if (!strcmp(v9, "UID"))
      {
        if (__s) {
          v41.i32[1] = atoi(__s);
        }
        goto LABEL_44;
      }
      if (!strcmp(v9, "GID"))
      {
        if (__s) {
          v41.i32[2] = atoi(__s);
        }
        goto LABEL_44;
      }
      if (!strcmp(v9, "Level"))
      {
        if (__s) {
          WORD6(v40) = atoi(__s);
        }
        goto LABEL_44;
      }
      if (!strcmp(v9, "Message"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v44 + 1;
        goto LABEL_43;
      }
      if (!strcmp(v9, "Facility"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v44;
        goto LABEL_43;
      }
      if (!strcmp(v9, "RefProc")) {
        break;
      }
      if (!strcmp(v9, "Session"))
      {
        uint64_t v12 = __s;
        if (!__s) {
          goto LABEL_44;
        }
        uint64_t v13 = a1;
        stat v14 = (unint64_t *)&v45 + 1;
LABEL_43:
        uint64_t v10 = asl_file_string_encode(v13, v12, v14);
        if (v10) {
          goto LABEL_102;
        }
        goto LABEL_44;
      }
      if (!strcmp(v9, "ReadUID"))
      {
        __int16 v15 = HIWORD(v40);
        if ((BYTE14(v40) & 1) != 0 || !__s) {
          goto LABEL_44;
        }
        v41.i32[3] = atoi(__s);
        __int16 v16 = v15 | 1;
LABEL_70:
        HIWORD(v40) = v16;
        goto LABEL_44;
      }
      if (!strcmp(v9, "ReadGID"))
      {
        __int16 v17 = HIWORD(v40);
        if ((BYTE14(v40) & 2) != 0 || !__s) {
          goto LABEL_44;
        }
        LODWORD(v42) = atoi(__s);
        __int16 v16 = v17 | 2;
        goto LABEL_70;
      }
      if (!strcmp(v9, "ASLMessageID"))
      {
        if ((*(unsigned char *)(a1 + 8) & 8) != 0)
        {
          uint64_t v18 = atoll(__s);
          uint64_t v39 = v18;
          if (a3) {
            *a3 = v18;
          }
        }
      }
      else if (strcmp(v9, "ASLOption"))
      {
        uint64_t v10 = asl_file_string_encode(a1, v9, &v37);
        if (v10 || (unint64_t v36 = 0, __s) && (v10 = asl_file_string_encode(a1, __s, &v36), v10))
        {
LABEL_102:
          uint64_t v19 = v10;
          free(__ptr);
          return v19;
        }
        unsigned int v11 = DWORD2(v42);
        if (DWORD2(v42) >= 0x80)
        {
          unint64_t __ptr = reallocf(__ptr, 8 * (DWORD2(v42) + 2));
          if (!__ptr) {
            return 9;
          }
          unsigned int v11 = DWORD2(v42);
          uint64_t v8 = (unint64_t *)__ptr;
          if (DWORD2(v42) == 128)
          {
            memcpy(__ptr, __src, 0x400uLL);
            unsigned int v11 = 128;
          }
        }
        v8[v11] = v37;
        DWORD2(v42) = v11 + 2;
        v8[v11 + 1] = v36;
      }
LABEL_44:
      unsigned int v7 = asl_msg_fetch(a2, v7, &__s1, (int **)&__s, 0);
      if (v7 == -1)
      {
        unsigned int v21 = DWORD2(v42);
        unsigned int v22 = __ptr;
        goto LABEL_80;
      }
    }
    uint64_t v12 = __s;
    if (!__s) {
      goto LABEL_44;
    }
    uint64_t v13 = a1;
    stat v14 = (unint64_t *)&v45;
    goto LABEL_43;
  }
  unsigned int v21 = 0;
  unsigned int v22 = 0;
  uint64_t v8 = (unint64_t *)__src;
LABEL_80:
  int v23 = 8 * v21;
  int v24 = *(_OWORD **)(a1 + 120);
  if (!v24 || 8 * v21 + 122 > 0x11A)
  {
    unint64_t v25 = (char *)malloc_type_calloc(1uLL, (v23 + 122), 0x9B8C8ED8uLL);
    if (v25) {
      goto LABEL_83;
    }
    return 9;
  }
  v24[15] = 0u;
  v24[16] = 0u;
  v24[13] = 0u;
  v24[14] = 0u;
  v24[11] = 0u;
  v24[12] = 0u;
  v24[9] = 0u;
  v24[10] = 0u;
  v24[7] = 0u;
  v24[8] = 0u;
  v24[5] = 0u;
  v24[6] = 0u;
  v24[3] = 0u;
  v24[4] = 0u;
  v24[1] = 0u;
  v24[2] = 0u;
  *int v24 = 0u;
  *(_OWORD *)((char *)v24 + 266) = 0u;
  unint64_t v25 = *(char **)(a1 + 120);
  if (!v25) {
    return 9;
  }
LABEL_83:
  unint64_t v26 = v39;
  if (v39 == -1)
  {
    unint64_t v26 = *(void *)(a1 + 56) + 1;
    *(void *)(a1 + 56) = v26;
    uint64_t v39 = v26;
  }
  *(_WORD *)unint64_t v25 = 0;
  *(_DWORD *)(v25 + 2) = bswap32(v23 + 116);
  *(void *)(v25 + 6) = asl_core_htonq(v38);
  *(void *)(v25 + 14) = asl_core_htonq(v26);
  *(void *)(v25 + 22) = asl_core_htonq(v40);
  *(_DWORD *)(v25 + 30) = bswap32(DWORD2(v40));
  *((_WORD *)v25 + 17) = bswap32(WORD6(v40)) >> 16;
  *((_WORD *)v25 + 18) = bswap32(HIWORD(v40)) >> 16;
  *(int8x16_t *)(v25 + 38) = vrev32q_s8(v41);
  *(int8x8_t *)(v25 + 54) = vrev32_s8(*(int8x8_t *)&v42);
  *(_DWORD *)(v25 + 62) = bswap32(v21);
  *(void *)(v25 + 66) = asl_core_htonq(v43);
  *(void *)(v25 + 74) = asl_core_htonq(*((unint64_t *)&v43 + 1));
  *(void *)(v25 + 82) = asl_core_htonq(v44);
  *(void *)(v25 + 90) = asl_core_htonq(*((unint64_t *)&v44 + 1));
  *(void *)(v25 + 98) = asl_core_htonq(v45);
  *(void *)(v25 + 106) = asl_core_htonq(*((unint64_t *)&v45 + 1));
  unint64_t v27 = (unint64_t *)(v25 + 114);
  uint64_t v28 = DWORD2(v42);
  if (DWORD2(v42))
  {
    do
    {
      unint64_t v29 = *v8++;
      *v27++ = asl_core_htonq(v29);
      --v28;
    }
    while (v28);
  }
  unint64_t *v27 = asl_core_htonq(v46);
  free(v22);
  if (!fseeko(*(FILE **)(a1 + 104), 0, 2))
  {
    off_t v30 = ftello(*(FILE **)(a1 + 104));
    *(void *)(a1 + 48) = v30;
    unint64_t v36 = asl_core_htonq(v30);
    fwrite(v25, (v23 + 122), 1uLL, *(FILE **)(a1 + 104));
    fflush(*(FILE **)(a1 + 104));
    if (v25 != *(char **)(a1 + 120)) {
      free(v25);
    }
    uint64_t v31 = *(void *)(a1 + 64);
    off_t v32 = v31 ? v31 + 6 : 16;
    if (!fseeko(*(FILE **)(a1 + 104), v32, 0))
    {
      uint64_t v19 = 8;
      if (fwrite(&v36, 8uLL, 1uLL, *(FILE **)(a1 + 104)) != 1) {
        return v19;
      }
      if (!fseeko(*(FILE **)(a1 + 104), 37, 0))
      {
        uint64_t v19 = 8;
        if (fwrite(&v36, 8uLL, 1uLL, *(FILE **)(a1 + 104)) != 1) {
          return v19;
        }
        if (!fseeko(*(FILE **)(a1 + 104), 0, 2))
        {
          fflush(*(FILE **)(a1 + 104));
          uint64_t v19 = 0;
          *(void *)(a1 + 96) = ftello(*(FILE **)(a1 + 104));
          *(void *)(a1 + 64) = *(void *)(a1 + 48);
          return v19;
        }
      }
    }
  }
  return 8;
}

uint64_t asl_file_filter(uint64_t a1, char *a2, uint64_t a3, char a4, unsigned int a5, int a6, int a7, _DWORD *a8, void (*a9)(int *))
{
  uint64_t v23 = 0;
  if (a8) {
    *a8 = 0;
  }
  if (!a1) {
    return 2;
  }
  if (!a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999;
  }
  int v24 = 0;
  memset(&v25, 0, sizeof(v25));
  if (!stat(a2, &v25) || *__error() != 2) {
    return 9999;
  }
  uint64_t set_position = asl_file_read_set_position(a1, 0);
  if (!set_position)
  {
    unint64_t v26 = 0;
    uint64_t set_position = asl_file_open_write(a2, a5, v15, v16, (uint64_t *)&v26);
    if (!set_position)
    {
      int v18 = 0;
      *((_DWORD *)v26 + 2) = 12;
      while (1)
      {
        unint64_t v19 = *(void *)(a1 + 72);
        if (!v19)
        {
          uint64_t set_position = 0;
          goto LABEL_31;
        }
        int v24 = 0;
        if (*(_DWORD *)(a1 + 12) == 1)
        {
          uint64_t set_position = 9999;
          goto LABEL_31;
        }
        uint64_t pos = asl_file_fetch_pos(a1, v19, 1, &v24);
        if (pos) {
          break;
        }
        if ((a4 & 1) == (asl_msg_cmp_list((uint64_t)v24, a3) == 0))
        {
          if (a9)
          {
            val_for_key = asl_msg_get_val_for_key(v24, "ASLAuxURL");
            if (val_for_key) {
              a9(val_for_key);
            }
          }
          uint64_t set_position = 0;
        }
        else
        {
          uint64_t set_position = asl_file_save((uint64_t)v26, v24, &v23);
          if (!set_position) {
            ++v18;
          }
        }
        asl_msg_release((asl_object_t)v24);
        if (set_position) {
          goto LABEL_31;
        }
      }
      uint64_t set_position = pos;
LABEL_31:
      if (v26) {
        asl_release(v26);
      }
      if (a8) {
        *a8 = v18;
      }
    }
  }
  return set_position;
}

uint64_t asl_file_filter_level(uint64_t a1, char *a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7, void (*a8)(void))
{
  uint64_t v23 = 0;
  if (a7) {
    *a7 = 0;
  }
  if (!a1) {
    return 2;
  }
  if (!a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999;
  }
  uint64_t v26 = 0;
  int v24 = 0;
  char v21 = 0;
  memset(&v25, 0, sizeof(v25));
  if (!stat(a2, &v25) || *__error() != 2) {
    return 9999;
  }
  if (fseeko(*(FILE **)(a1 + 104), 36, 0)) {
    return 7;
  }
  char __ptr = 0;
  fread(&__ptr, 1uLL, 1uLL, *(FILE **)(a1 + 104));
  uint64_t result = asl_file_read_set_position(a1, 0);
  if (!result)
  {
    uint64_t v26 = 0;
    uint64_t result = asl_file_open_write(a2, a4, v15, v16, &v26);
    if (!result)
    {
      int v17 = 0;
      int v18 = 0;
      *(_DWORD *)(v26 + 8) = 12;
      while (!v17)
      {
        unint64_t v19 = *(void *)(a1 + 72);
        if (!v19) {
          break;
        }
        int v24 = 0;
        if (*(_DWORD *)(a1 + 12) == 1 || asl_file_fetch_pos(a1, v19, 1, &v24)) {
          break;
        }
        int v17 = 0;
        if (v24)
        {
          val_for_key = asl_msg_get_val_for_key(v24, "Level");
          int v17 = 0;
          if (val_for_key)
          {
            if ((a3 >> atoi((const char *)val_for_key)))
            {
              int v17 = asl_file_save(v26, v24, &v23);
              if (!v17) {
                ++v18;
              }
            }
            else
            {
              if (a8 && asl_msg_get_val_for_key(v24, "ASLAuxURL")) {
                a8();
              }
              int v17 = 0;
            }
            asl_msg_release((asl_object_t)v24);
          }
        }
      }
      char v21 = __ptr & a3;
      if (fseeko(*(FILE **)(v26 + 104), 36, 0)) {
        return 7;
      }
      fwrite(&v21, 1uLL, 1uLL, *(FILE **)(v26 + 104));
      if (v26) {
        asl_release((asl_object_t)v26);
      }
      uint64_t result = 0;
      if (a7) {
        *a7 = v18;
      }
    }
  }
  return result;
}

uint64_t asl_file_string_encode(uint64_t a1, char *__s, unint64_t *a3)
{
  if (!*(void *)(a1 + 104)) {
    return 2;
  }
  unsigned int v6 = strlen(__s);
  if (v6 <= 7)
  {
    unint64_t v21 = v6 | 0x80u;
    __memcpy_chk();
    unint64_t v7 = asl_core_ntohq(v21);
LABEL_4:
    uint64_t result = 0;
    *a3 = v7;
    return result;
  }
  size_t v9 = v6 + 1;
  if (v9 > 0x6C)
  {
    int v10 = 0;
  }
  else
  {
    int v10 = asl_core_string_hash(__s, v9);
    unint64_t v11 = *(void *)(a1 + 24);
    if (v11)
    {
      uint64_t v12 = 0;
      unint64_t v13 = *(void *)(a1 + 24);
      while (1)
      {
        stat v14 = (unint64_t *)v13;
        if (v10 == *(_DWORD *)(v13 + 8) && !strcmp(__s, (const char *)(v13 + 24))) {
          break;
        }
        unint64_t v13 = v14[2];
        uint64_t v12 = v14;
        if (!v13) {
          goto LABEL_14;
        }
      }
      if (v12)
      {
        v12[2] = v14[2];
        int v14[2] = v11;
        *(void *)(a1 + 24) = v14;
      }
      unint64_t v7 = *v14;
      goto LABEL_4;
    }
  }
LABEL_14:
  unint64_t v7 = ftello(*(FILE **)(a1 + 104));
  __int16 __ptr = 256;
  if (fwrite(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 104)) != 1) {
    return 8;
  }
  unsigned int v22 = bswap32(v9);
  if (fwrite(&v22, 4uLL, 1uLL, *(FILE **)(a1 + 104)) != 1
    || fwrite(__s, v9, 1uLL, *(FILE **)(a1 + 104)) != 1)
  {
    return 8;
  }
  fflush(*(FILE **)(a1 + 104));
  if (v9 > 0x6C) {
    goto LABEL_4;
  }
  uint64_t v15 = *(_DWORD **)(a1 + 32);
  if (v15)
  {
    *(void *)(a1 + 32) = 0;
LABEL_25:
    *(void *)uint64_t v15 = v7;
    v15[2] = v10;
    uint64_t v16 = *(void *)(a1 + 24);
    *((void *)v15 + 2) = v16;
    memcpy(v15 + 6, __s, v9);
    *(void *)(a1 + 24) = v15;
    int v17 = *(_DWORD *)(a1 + 16);
    if ((*(unsigned char *)(a1 + 8) & 4) != 0 || v17 != 128)
    {
      *(_DWORD *)(a1 + 16) = v17 + 1;
    }
    else
    {
      do
      {
        int v18 = (_OWORD *)v16;
        unint64_t v19 = v15;
        uint64_t v16 = *(void *)(v16 + 16);
        uint64_t v15 = v18;
      }
      while (v16);
      *((void *)v19 + 2) = 0;
      file_string_dispose(a1, v18);
    }
    goto LABEL_4;
  }
  uint64_t v15 = malloc_type_calloc(1uLL, 0x88uLL, 0x10200408BEEBE60uLL);
  if (v15) {
    goto LABEL_25;
  }
  return 9;
}

uint64_t asl_file_open_read(const char *a1, uint64_t *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8C08];
  unsigned int v19 = 0;
  memset(&v17, 0, sizeof(v17));
  if (stat(a1, &v17)) {
    return 9999;
  }
  uint64_t v5 = fopen(a1, "r");
  if (v5)
  {
    unsigned int v6 = v5;
    if ((int)fread(&__ptr, 0x50uLL, 1uLL, v5) <= 0 || (__ptr == 541872961 ? (BOOL v7 = v21 == 16964) : (BOOL v7 = 0), !v7))
    {
      fclose(v6);
      return 2;
    }
    int v18 = 0;
    unsigned int v9 = v22;
    if (v22 != 0x1000000 || (fclose(v6), uint64_t v4 = asl_legacy1_open(a1, &v18), !v4))
    {
      int v10 = malloc_type_calloc(1uLL, 0x80uLL, 0x10B0040093DCD73uLL);
      if (!v10)
      {
        fclose(v6);
        return 9;
      }
      uint64_t v11 = (uint64_t)v10;
      void *v10 = 0x100000003;
      v10[13] = v6;
      *((_DWORD *)v10 + 2) = 1;
      *((_DWORD *)v10 + 3) = bswap32(v9);
      uint64_t v12 = v18;
      if (v18)
      {
        uint64_t v4 = 0;
        *((_DWORD *)v10 + 2) = 17;
        v10[14] = v12;
LABEL_25:
        *a2 = v11;
        return v4;
      }
      v10[5] = asl_core_ntohq(v23);
      unint64_t v13 = asl_core_ntohq(v24);
      *(void *)(v11 + 48) = v13;
      st_vm_size_t size = v17.st_size;
      *(void *)(v11 + 96) = v17.st_size;
      if (v13 + 122 > st_size) {
        goto LABEL_21;
      }
      uint64_t uint64 = asl_file_read_uint32(v11, v13 + 2, &v19);
      if (uint64) {
        goto LABEL_27;
      }
      if (*(void *)(v11 + 48) + (unint64_t)v19 > *(void *)(v11 + 96)) {
LABEL_21:
      }
        *(void *)(v11 + 48) = 0;
      uint64_t v15 = *(void *)(v11 + 40);
      *(void *)(v11 + 72) = v15;
      if (!v15 || (uint64_t uint64 = asl_file_read_uint64(v11, v15 + 14, (unint64_t *)(v11 + 80)), !uint64))
      {
        uint64_t v4 = 0;
        goto LABEL_25;
      }
LABEL_27:
      uint64_t v4 = uint64;
      fclose(*(FILE **)(v11 + 104));
      free((void *)v11);
    }
  }
  else if (*__error() == 13)
  {
    return 10;
  }
  else
  {
    return 9999;
  }
  return v4;
}

uint64_t asl_file_read_set_position_last(uint64_t a1, int a2)
{
  if (a2 || (uint64_t v3 = *(void *)(a1 + 48)) == 0)
  {
    unint64_t v5 = *(void *)(a1 + 40);
    *(void *)(a1 + 72) = v5;
    *(void *)(a1 + 80) = 0;
    *(_DWORD *)(a1 + 20) = 0;
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t result = asl_file_read_uint64(a1, v5 + 6, &v8);
      if (result) {
        break;
      }
      unint64_t v5 = v8;
      unint64_t v6 = *(void *)(a1 + 72);
      if (v8 + 122 > *(void *)(a1 + 96) || v8 <= v6)
      {
        unint64_t v8 = 0;
        ++*(_DWORD *)(a1 + 20);
        if (v6) {
          asl_file_read_uint64(a1, v6 + 14, (unint64_t *)(a1 + 80));
        }
        return 0;
      }
      ++*(_DWORD *)(a1 + 20);
      *(void *)(a1 + 72) = v5;
    }
  }
  else
  {
    *(void *)(a1 + 72) = v3;
    return asl_file_read_uint64(a1, v3 + 14, (unint64_t *)(a1 + 80));
  }
  return result;
}

uint64_t asl_file_fetch_pos(uint64_t a1, unint64_t a2, int a3, int **a4)
{
  if (!*(void *)(a1 + 104)) {
    return 2;
  }
  if (!a4) {
    return 1;
  }
  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
    return 12;
  }
  uint64_t v28 = 0;
  unint64_t v29 = 0;
  unsigned int v25 = 0;
  unsigned int v26 = 0;
  uint64_t v31 = 0;
  uint64_t result = asl_file_fetch_object(a1, 0, a2, (const void **)&v31, &v25);
  if (!result && v31)
  {
    if (v25 <= 0x73 || 8 * (unint64_t)bswap32(*((_DWORD *)v31 + 14)) + 116 > v25)
    {
      free(v31);
      *(void *)(a1 + 72) = 0;
      *(void *)(a1 + 80) = 0;
      return 7;
    }
    unint64_t v8 = asl_msg_new(0);
    unsigned int v9 = (char *)v31;
    if (!v8)
    {
      free(v31);
      return 9;
    }
    int v10 = (int *)v8;
    unint64_t v11 = asl_core_ntohq(*(void *)v31);
    off_t v30 = (unint64_t *)(v9 + 8);
    asl_file_fetch_helper_64(&v30, v10, "ASLMessageID");
    asl_file_fetch_helper_64(&v30, v10, "Time");
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "TimeNanoSec", 0, 0);
    asl_file_fetch_helper_16(&v30, v10, "Level");
    off_t v30 = (unint64_t *)((char *)v30 + 2);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "PID", 0, 0);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "UID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "GID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "ReadUID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "ReadGID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "RefPID", 1, 0);
    unsigned int v12 = *(_DWORD *)v30;
    off_t v30 = (unint64_t *)((char *)v30 + 4);
    unsigned int object = 0;
    asl_file_fetch_helper_str(a1, &v30, v10, "Host", &object);
    if (object
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Sender", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Facility", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Message", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "RefProc", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Session", &object), object))
    {
LABEL_22:
      asl_msg_release((asl_object_t)v10);
      free(v31);
      *(void *)(a1 + 72) = 0;
      *(void *)(a1 + 80) = 0;
      return object;
    }
    unsigned int v13 = bswap32(v12);
    stat v14 = v30;
    if (v13 >= 2)
    {
      unsigned int v15 = v13 >> 1;
      while (1)
      {
        uint64_t v16 = v14;
        uint64_t v28 = 0;
        unint64_t v29 = 0;
        unsigned int v26 = 0;
        unint64_t v17 = asl_core_ntohq(*v14);
        unsigned int object = asl_file_fetch_object(a1, 1, v17, (const void **)&v29, &v26);
        if (object) {
          goto LABEL_22;
        }
        unint64_t v18 = asl_core_ntohq(v16[1]);
        unsigned int v26 = 0;
        if (v18)
        {
          unsigned int object = asl_file_fetch_object(a1, 1, v18, (const void **)&v28, &v26);
          if (object)
          {
            free(v29);
            goto LABEL_22;
          }
          unsigned int v19 = 0;
        }
        else
        {
          unsigned int v19 = object;
        }
        unsigned int v20 = v29;
        if (!v19 && v29)
        {
          asl_msg_set_key_val(v10, (char *)v29, (const char *)v28);
          unsigned int v20 = v29;
        }
        free(v20);
        free(v28);
        stat v14 = v16 + 2;
        if (!--v15)
        {
          stat v14 = v16 + 2;
          break;
        }
      }
    }
    unint64_t v21 = asl_core_ntohq(*v14);
    free(v31);
    if (a3 < 0)
    {
      if (!v21)
      {
        unint64_t v11 = 0;
        goto LABEL_45;
      }
      unsigned int v22 = (void *)(a1 + 72);
      unint64_t v11 = v21;
      if (v21 < *(void *)(a1 + 72)) {
        goto LABEL_45;
      }
    }
    else if (!v11 || (unsigned int v22 = (void *)(a1 + 72), v11 > *(void *)(a1 + 72)))
    {
LABEL_45:
      *(void *)(a1 + 72) = v11;
      *(void *)(a1 + 80) = 0;
      unint64_t v23 = (void *)(a1 + 72);
      if (v11)
      {
        if (v11 + 14 > *(void *)(a1 + 96))
        {
          uint64_t result = 0;
          *unint64_t v23 = 0;
          *(void *)(a1 + 80) = 0;
LABEL_52:
          *a4 = v10;
          return result;
        }
        unsigned int object = fseeko(*(FILE **)(a1 + 104), v11 + 14, 0);
        if (object || (unint64_t __ptr = 0, object = fread(&__ptr, 8uLL, 1uLL, *(FILE **)(a1 + 104)), object != 1))
        {
          asl_msg_release((asl_object_t)v10);
          *unint64_t v23 = 0;
          *(void *)(a1 + 80) = 0;
          return 7;
        }
        *(void *)(a1 + 80) = asl_core_ntohq(__ptr);
      }
      uint64_t result = 0;
      goto LABEL_52;
    }
    uint64_t result = 0;
    void *v22 = 0;
    v22[1] = 0;
    return result;
  }
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  return result;
}

uint64_t asl_file_fetch_previous(uint64_t a1, int **a2)
{
  if (!a1) {
    return 2;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 9999;
  }
  return asl_file_fetch_pos(a1, *(void *)(a1 + 72), -1, a2);
}

uint64_t asl_file_fetch(uint64_t a1, unint64_t a2, int **a3)
{
  if (!a1) {
    return 2;
  }
  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
    return 12;
  }
  if (*(_DWORD *)(a1 + 12) == 1)
  {
    if (a3)
    {
      BOOL v7 = *(uint64_t **)(a1 + 112);
      return asl_legacy1_fetch(v7, a2, a3);
    }
    return 0;
  }
  unint64_t v8 = *(void *)(a1 + 80);
  if (v8) {
    goto LABEL_12;
  }
  uint64_t result = asl_file_read_set_position(a1, 0);
  if (!result)
  {
    unint64_t v8 = *(void *)(a1 + 80);
    if (!v8) {
      return 4;
    }
LABEL_12:
    while (v8 < a2)
    {
      uint64_t result = asl_file_read_set_position(a1, 2);
      if (result) {
        return result;
      }
      unint64_t v8 = *(void *)(a1 + 80);
      if (v8 - 1 >= a2) {
        return 4;
      }
    }
    while (v8 > a2)
    {
      uint64_t result = asl_file_read_set_position(a1, 1);
      if (!result)
      {
        unint64_t v8 = *(void *)(a1 + 80);
        uint64_t result = 4;
        if (v8 >= a2 && v8 != 0) {
          continue;
        }
      }
      return result;
    }
    if (v8 != a2) {
      return 4;
    }
    if (!a3) {
      return 0;
    }
    unint64_t v10 = *(void *)(a1 + 72);
    return asl_file_fetch_pos(a1, v10, 1, a3);
  }
  return result;
}

uint64_t asl_file_cursor(uint64_t result)
{
  if (result)
  {
    if ((*(unsigned char *)(result + 8) & 1) != 0 && *(_DWORD *)(result + 12) != 1) {
      return *(void *)(result + 80);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t asl_file_match_start(uint64_t a1, unint64_t a2, int a3)
{
  if (!a1) {
    return 2;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 2;
  }
  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
    return 12;
  }
  if (a3 < 0) {
    int v7 = 1;
  }
  else {
    int v7 = 2;
  }
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t result = asl_file_read_set_position(a1, 0);
    if (result) {
      return result;
    }
    while (1)
    {
LABEL_14:
      unint64_t v8 = *(void *)(a1 + 80);
      if (a3 < 0)
      {
        if (v8 <= a2) {
          return 0;
        }
      }
      else if (v8 >= a2)
      {
        return 0;
      }
      uint64_t result = asl_file_read_set_position(a1, v7);
      if (result) {
        return result;
      }
    }
  }
  uint64_t result = asl_file_read_set_position_last(a1, 0);
  if (!result) {
    goto LABEL_14;
  }
  return result;
}

uint64_t asl_file_match_next(uint64_t a1, uint64_t a2, __asl_object_s **a3, void *a4, int a5)
{
  if (!a1) {
    return 2;
  }
  if (!a3) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    return 2;
  }
  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
    return 12;
  }
  if (!*(void *)(a1 + 72)) {
    return 14;
  }
  *a3 = 0;
  if (a2) {
    BOOL v9 = *(_DWORD *)(a2 + 8) == 0;
  }
  else {
    BOOL v9 = 1;
  }
  unsigned int v13 = 0;
  *a4 = *(void *)(a1 + 80);
  uint64_t result = asl_file_fetch_pos(a1, *(void *)(a1 + 72), a5, (int **)&v13);
  switch(result)
  {
    case 0:
      if (v9) {
        goto LABEL_28;
      }
      if (*(_DWORD *)(a2 + 8))
      {
        unint64_t v10 = 0;
        do
          int v11 = asl_msg_cmp(*(_DWORD **)(*(void *)(a2 + 16) + 8 * v10++), v13);
        while (v10 < *(unsigned int *)(a2 + 8) && v11 == 0);
        if (v11)
        {
LABEL_28:
          uint64_t result = 0;
          *a3 = v13;
          return result;
        }
      }
      *a3 = 0;
      asl_msg_release(v13);
      return 13;
    case 0xA:
      return 13;
    case 1:
      if (*(void *)(a1 + 72)) {
        return 1;
      }
      else {
        return 14;
      }
  }
  return result;
}

uint64_t asl_file_match(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  v35.tv_sec = 0;
  *(void *)&v35.tv_usec = 0;
  uint64_t v33 = 0;
  if (!a1 || (*(unsigned char *)(a1 + 8) & 1) == 0) {
    return 0;
  }
  int v9 = a5;
  if (*(_DWORD *)(a1 + 12) == 1)
  {
    asl_legacy1_match(*(void *)(a1 + 112), a2, &v33, a3, a4, a5, a7);
    return v33;
  }
  if (a2) {
    BOOL v15 = *(_DWORD *)(a2 + 8) == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (a7 < 0) {
    int v16 = 1;
  }
  else {
    int v16 = 2;
  }
  if ((a7 & 0x80000000) == 0)
  {
    if (!asl_file_read_set_position(a1, 0)) {
      goto LABEL_16;
    }
    return 0;
  }
  if (asl_file_read_set_position_last(a1, 0)) {
    return 0;
  }
  do
  {
LABEL_16:
    unint64_t v18 = *(void *)(a1 + 80);
    if (a7 < 0)
    {
      if (v18 <= a4) {
        break;
      }
    }
    else if (v18 >= a4)
    {
      break;
    }
  }
  while (!asl_file_read_set_position(a1, v16));
  v34.tv_sec = 0;
  *(void *)&v34.tv_usec = 0;
  if (a6)
  {
    if (gettimeofday(&v34, 0))
    {
      __darwin_suseconds_t v32 = 0;
      __darwin_time_t v19 = 0;
      v34.tv_sec = 0;
      *(void *)&v34.tv_usec = 0;
    }
    else
    {
      __darwin_time_t v19 = v34.tv_sec + a6 / 0xF4240uLL;
      v34.tv_sec = v19;
      unsigned int v20 = v34.tv_usec + a6 % 0xF4240;
      v34.tv_usec = v20;
      if (v20 <= 0xF4240)
      {
        __darwin_suseconds_t v32 = v20;
      }
      else
      {
        __darwin_suseconds_t v32 = v20 - 1000000;
        v34.tv_usec = v20 - 1000000;
        v34.tv_sec = ++v19;
      }
    }
  }
  else
  {
    __darwin_suseconds_t v32 = 0;
    __darwin_time_t v19 = 0;
  }
  uint64_t v13 = 0;
  uint64_t v21 = 0;
  int v22 = 0;
  uint64_t v23 = (v9 - 1);
  while (1)
  {
    do
    {
      asl_object_t obj = 0;
      int pos = asl_file_fetch_pos(a1, *(void *)(a1 + 72), a7, (int **)&obj);
    }
    while (pos == 10);
    if (pos) {
      return v13;
    }
    *a3 = *(void *)(a1 + 80);
    if (v15) {
      goto LABEL_52;
    }
    if (*(_DWORD *)(a2 + 8))
    {
      BOOL v31 = v15;
      __darwin_time_t v25 = v19;
      uint64_t v26 = v23;
      unint64_t v27 = 0;
      do
        int v28 = asl_msg_cmp(*(_DWORD **)(*(void *)(a2 + 16) + 8 * v27++), obj);
      while (v27 < *(unsigned int *)(a2 + 8) && v28 == 0);
      uint64_t v23 = v26;
      __darwin_time_t v19 = v25;
      BOOL v15 = v31;
      if (v28 == 1)
      {
LABEL_52:
        if (!v21)
        {
          asl_msg_list_new();
          uint64_t v13 = v30;
          uint64_t v33 = v30;
          if (!v30) {
            return v13;
          }
        }
        asl_msg_list_append(v13, obj);
        if (v23 < ++v22) {
          return v13;
        }
        if (!v19 || gettimeofday(&v35, 0)) {
          goto LABEL_48;
        }
        if (v35.tv_sec > v19) {
          return v13;
        }
        if (v35.tv_sec == v19)
        {
          uint64_t v21 = v13;
          if (v35.tv_usec > v32) {
            return v13;
          }
        }
        else
        {
LABEL_48:
          uint64_t v21 = v13;
        }
      }
    }
    asl_msg_release(obj);
  }
}

uint64_t asl_file_size(uint64_t result)
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

uint64_t asl_file_ctime(uint64_t result)
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

void asl_file_list_close(asl_object_t *a1)
{
  if (a1)
  {
    unsigned int v1 = a1;
    do
    {
      int v2 = (asl_object_t *)v1[1];
      if (*v1) {
        asl_release(*v1);
      }
      free(v1);
      unsigned int v1 = v2;
    }
    while (v2);
  }
}

void *asl_file_list_add(uint64_t a1, uint64_t a2)
{
  if (a2 && *(_DWORD *)(a2 + 12) != 1)
  {
    uint64_t v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
    if (v4)
    {
      *uint64_t v4 = a2;
      v4[1] = a1;
      return v4;
    }
    else
    {
      return 0;
    }
  }
  return (void *)a1;
}

void **asl_file_list_match_start(uint64_t *a1, unint64_t a2, int a3)
{
  if (!a1) {
    return 0;
  }
  unint64_t v5 = a1;
  unint64_t v6 = (void **)malloc_type_calloc(1uLL, 0x10uLL, 0x10200403A5D3213uLL);
  if (v6)
  {
    do
    {
      if (!asl_file_match_start(*v5, a2, a3) && *(void *)(*v5 + 80)) {
        FILE *v6 = asl_file_list_insert(*v6, *v5, a3);
      }
      unint64_t v5 = (uint64_t *)v5[1];
    }
    while (v5);
    *((_DWORD *)v6 + 2) = a3;
  }
  return v6;
}

void *asl_file_list_insert(void *a1, uint64_t a2, int a3)
{
  if (!a2) {
    return a1;
  }
  uint64_t result = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
  if (result)
  {
    *uint64_t result = a2;
    if (a1)
    {
      unint64_t v7 = *(void *)(a2 + 80);
      unint64_t v8 = *(void *)(*a1 + 80);
      if (a3 < 0)
      {
        if (v7 > v8) {
          goto LABEL_6;
        }
      }
      else if (v7 < v8)
      {
LABEL_6:
        result[1] = a1;
        return result;
      }
      int v9 = (void *)a1[1];
      unint64_t v10 = a1;
      if (!v9)
      {
LABEL_15:
        v10[1] = result;
        return a1;
      }
      int v11 = a1;
      while (1)
      {
        unint64_t v10 = v9;
        unint64_t v12 = *(void *)(*v9 + 80);
        if (a3 < 0)
        {
          if (v7 > v12)
          {
LABEL_16:
            result[1] = v10;
            v11[1] = result;
            return a1;
          }
        }
        else if (v7 < v12)
        {
          goto LABEL_16;
        }
        int v9 = (void *)v10[1];
        int v11 = v10;
        if (!v9) {
          goto LABEL_15;
        }
      }
    }
  }
  return result;
}

uint64_t asl_file_list_match_next(uint64_t result, uint64_t a2, uint64_t *a3, int a4)
{
  if (!result) {
    return result;
  }
  if (!a3) {
    return 1;
  }
  uint64_t v5 = result;
  unint64_t v6 = *(uint64_t **)result;
  if (!*(void *)result) {
    return 0;
  }
  unsigned int v8 = 0;
  unsigned int v9 = a4 - 1;
  while (1)
  {
    asl_object_t obj = 0;
    int matched = asl_file_match_next(*v6, a2, &obj, &v21, *(_DWORD *)(v5 + 8));
    int v11 = obj;
    if (!obj) {
      goto LABEL_10;
    }
    uint64_t v12 = *a3;
    if (!*a3) {
      break;
    }
LABEL_9:
    asl_msg_list_append(v12, v11);
    asl_msg_release(obj);
    ++v8;
LABEL_10:
    unint64_t v6 = *(uint64_t **)v5;
    if (matched || !*(void *)(*v6 + 80))
    {
      uint64_t v13 = (uint64_t *)v6[1];
      free(*(void **)v5);
      *(void *)uint64_t v5 = v13;
      unint64_t v6 = v13;
      if (!v13) {
        return 0;
      }
    }
    stat v14 = (void *)v6[1];
    if (v14)
    {
      int v15 = *(_DWORD *)(v5 + 8);
      uint64_t v16 = *v6;
      unint64_t v17 = *(void *)(*v6 + 80);
      unint64_t v18 = *(void *)(*v14 + 80);
      if ((v15 & 0x80000000) == 0)
      {
        if (v17 <= v18) {
          goto LABEL_18;
        }
LABEL_17:
        *(void *)uint64_t v5 = v14;
        v6[1] = 0;
        *(void *)uint64_t v5 = asl_file_list_insert(v14, v16, v15);
        free(v6);
        unint64_t v6 = *(uint64_t **)v5;
        goto LABEL_18;
      }
      if (v17 <= v18) {
        goto LABEL_17;
      }
    }
LABEL_18:
    uint64_t result = 0;
    if (!v6 || v9 < v8) {
      return result;
    }
  }
  asl_msg_list_new();
  *a3 = v12;
  if (v12)
  {
    int v11 = obj;
    goto LABEL_9;
  }
  __darwin_time_t v19 = *(uint64_t **)v5;
  if (*(void *)v5)
  {
    do
    {
      unsigned int v20 = (uint64_t *)v19[1];
      free(v19);
      __darwin_time_t v19 = v20;
    }
    while (v20);
  }
  *(void *)uint64_t v5 = 0;
  return 9;
}

void asl_file_list_match_end(void *a1)
{
  if (a1)
  {
    int v2 = (void *)*a1;
    if (v2)
    {
      do
      {
        uint64_t v3 = (void *)v2[1];
        free(v2);
        int v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

uint64_t asl_file_list_match(uint64_t *a1, uint64_t a2, void *a3, unint64_t a4, int a5, unsigned int a6, int a7)
{
  uint64_t v7 = 0;
  if (a1 && a3)
  {
    stat v14 = a1;
    int v15 = 0;
    asl_object_t obj = 0;
    do
    {
      if (!asl_file_match_start(*v14, a4, a7) && *(void *)(*v14 + 80)) {
        int v15 = asl_file_list_insert(v15, *v14, a7);
      }
      stat v14 = (uint64_t *)v14[1];
    }
    while (v14);
    if (!v15) {
      return 0;
    }
    v32.__darwin_time_t tv_sec = 0;
    *(void *)&v32.tv_usec = 0;
    if (a6)
    {
      if (gettimeofday(&v32, 0))
      {
        v32.__darwin_time_t tv_sec = 0;
        *(void *)&v32.tv_usec = 0;
      }
      else
      {
        __darwin_time_t v16 = v32.tv_sec + a6 / 0xF4240uLL;
        v32.__darwin_time_t tv_sec = v16;
        unsigned int v17 = v32.tv_usec + a6 % 0xF4240;
        v32.tv_usec = v17;
        if (v17 > 0xF4240)
        {
          v32.tv_usec = v17 - 1000000;
          v32.__darwin_time_t tv_sec = v16 + 1;
        }
      }
    }
    uint64_t v7 = 0;
    unsigned int v18 = 0;
    v33.__darwin_time_t tv_sec = 0;
    *(void *)&v33.tv_usec = 0;
    unsigned int v19 = a5 - 1;
    do
    {
      if (v19 < v18) {
        goto LABEL_40;
      }
      asl_object_t obj = 0;
      asl_file_match_next(*v15, a2, &obj, a3, a7);
      unsigned int v20 = obj;
      if (obj)
      {
        if (!v7)
        {
          asl_msg_list_new();
          uint64_t v7 = v21;
          if (!v21)
          {
            do
            {
              unint64_t v29 = (uint64_t *)v15[1];
              free(v15);
              int v15 = v29;
            }
            while (v29);
            return v7;
          }
          unsigned int v20 = obj;
        }
        asl_msg_list_append(v7, v20);
        asl_msg_release(obj);
        ++v18;
      }
      if (*(void *)(*v15 + 80) || (v22 = (uint64_t *)v15[1], free(v15), (int v15 = v22) != 0))
      {
        uint64_t v23 = (void *)v15[1];
        if (v23)
        {
          uint64_t v24 = *v15;
          unint64_t v25 = *(void *)(*v15 + 80);
          unint64_t v26 = *(void *)(*v23 + 80);
          if (a7 < 0)
          {
            if (v25 > v26) {
              goto LABEL_28;
            }
LABEL_27:
            v15[1] = 0;
            unint64_t v27 = asl_file_list_insert(v23, v24, a7);
            free(v15);
            int v15 = v27;
            goto LABEL_28;
          }
          if (v25 > v26) {
            goto LABEL_27;
          }
        }
      }
LABEL_28:
      __darwin_time_t tv_sec = v32.tv_sec;
      if (v32.tv_sec
        && !gettimeofday(&v33, 0)
        && (v33.tv_sec > tv_sec || v33.tv_sec == tv_sec && v33.tv_usec > v32.tv_usec))
      {
        if (!v15) {
          return v7;
        }
        do
        {
LABEL_40:
          uint64_t v30 = (uint64_t *)v15[1];
          free(v15);
          int v15 = v30;
        }
        while (v30);
        return v7;
      }
    }
    while (v15);
  }
  return v7;
}

uint64_t _jump_count_0(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 8) & 1) != 0
      && (uint64_t v2 = *(void *)(result + 72),
          uint64_t v3 = *(void *)(result + 80),
          !asl_file_read_set_position_last(result, 1)))
    {
      *(void *)(v1 + 72) = v2;
      *(void *)(v1 + 80) = v3;
      return *(unsigned int *)(v1 + 20);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

int *_jump_next_0(int *result)
{
  uint64_t v1 = 0;
  if (result)
  {
    if (result[3] == 1)
    {
      return 0;
    }
    else if (asl_file_fetch_pos((uint64_t)result, *((void *)result + 9), 1, &v1))
    {
      return 0;
    }
    else
    {
      return v1;
    }
  }
  return result;
}

int *_jump_prev_0(int *result)
{
  uint64_t v1 = 0;
  if (result)
  {
    if (result[3] == 1)
    {
      return 0;
    }
    else if (asl_file_fetch_pos((uint64_t)result, *((void *)result + 9), -1, &v1))
    {
      return 0;
    }
    else
    {
      return v1;
    }
  }
  return result;
}

int *_jump_get_object_at_index_0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = 0;
  if (asl_file_fetch(a1, a2, &v3)) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t _jump_set_iteration_index_0(uint64_t result, unint64_t a2)
{
  if (result && (*(unsigned char *)(result + 8) & 1) != 0)
  {
    if (a2 == -1)
    {
      return asl_file_read_set_position_last(result, 0);
    }
    else if (a2)
    {
      return asl_file_fetch(result, a2, 0);
    }
    else
    {
      *(void *)(result + 80) = 0;
      uint64_t v2 = *(void *)(result + 40);
      *(void *)(result + 72) = v2;
      if (v2) {
        return asl_file_read_uint64(result, v2 + 14, (unint64_t *)(result + 80));
      }
    }
  }
  return result;
}

uint64_t _jump_append_1(uint64_t a1, asl_object_t obj)
{
  uint64_t result = asl_get_type(obj);
  if (a1 && (*(unsigned char *)(a1 + 8) & 1) == 0)
  {
    uint64_t v5 = 0;
    if (result == 2)
    {
      asl_msg_list_reset_iteration((uint64_t)obj, 0);
      do
      {
        uint64_t result = asl_msg_list_next((uint64_t)obj);
        if (!result) {
          break;
        }
        uint64_t result = asl_file_save(a1, (_DWORD *)result, &v5);
      }
      while (!result);
    }
    else if (result <= 1)
    {
      return asl_file_save(a1, obj, &v5);
    }
  }
  return result;
}

uint64_t _jump_search_1(uint64_t a1, asl_object_t obj)
{
  uint32_t type = asl_get_type(obj);
  uint64_t v11 = 0;
  if (!obj)
  {
    uint64_t v5 = a1;
    asl_object_t v6 = 0;
    return asl_file_match(v5, (uint64_t)v6, &v11, 0, 0, 0, 1);
  }
  if (type == 2)
  {
    uint64_t v5 = a1;
    asl_object_t v6 = obj;
    return asl_file_match(v5, (uint64_t)v6, &v11, 0, 0, 0, 1);
  }
  if (type > 1) {
    return 0;
  }
  asl_msg_list_new();
  unint64_t v10 = (__asl_object_s *)v9;
  asl_msg_list_append(v9, obj);
  uint64_t v7 = asl_file_match(a1, (uint64_t)v10, &v11, 0, 0, 0, 1);
  asl_msg_list_release(v10);
  return v7;
}

uint64_t _jump_match_1(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  uint64_t v9 = 0;
  uint64_t result = asl_file_match(a1, a2, &v9, a4, a5, a6, a7);
  *a3 = v9;
  return result;
}

double file_string_dispose(uint64_t a1, _OWORD *a2)
{
  if (*(void *)(a1 + 32))
  {
    free(a2);
  }
  else
  {
    *(void *)(a1 + 32) = a2;
    *((void *)a2 + 16) = 0;
    double result = 0.0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t asl_file_fetch_object(uint64_t a1, int a2, unint64_t a3, const void **a4, unsigned int *a5)
{
  uint64_t v32 = *MEMORY[0x263EF8C08];
  if (!*(void *)(a1 + 104)) {
    return 2;
  }
  uint64_t v6 = 1;
  if (a3 && a4 && a5)
  {
    *a4 = 0;
    *a5 = 0;
    unint64_t v11 = asl_core_htonq(a3);
    unint64_t v29 = v11;
    if ((v11 & 0x80) == 0)
    {
      if (a2 == 1)
      {
        uint64_t v12 = *(void *)(a1 + 24);
        if (v12)
        {
          if (*(void *)v12 == a3)
          {
            uint64_t v13 = 0;
LABEL_16:
            __darwin_time_t v16 = strdup((const char *)(v12 + 24));
            *a4 = v16;
            if (v16)
            {
              *a5 = *(_DWORD *)(v12 + 8);
              if (v13)
              {
                uint64_t v6 = 0;
                uint64_t v17 = *(void *)(a1 + 24);
                *(void *)(v13 + 16) = *(void *)(v12 + 16);
                *(void *)(v12 + 16) = v17;
                *(void *)(a1 + 24) = v12;
                return v6;
              }
              return 0;
            }
            return 9;
          }
          uint64_t v15 = *(void *)(a1 + 24);
          while (1)
          {
            uint64_t v12 = *(void *)(v15 + 16);
            if (!v12) {
              break;
            }
            uint64_t v13 = v15;
            uint64_t v15 = *(void *)(v15 + 16);
            if (*(void *)v12 == a3) {
              goto LABEL_16;
            }
          }
        }
      }
      if (a3 + 6 > *(void *)(a1 + 96)) {
        return 7;
      }
      if (fseeko(*(FILE **)(a1 + 104), a3, 0)) {
        return 7;
      }
      unsigned __int16 __ptr = 0;
      if (fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 104)) != 1) {
        return 7;
      }
      if (a2 == bswap32(__ptr) >> 16)
      {
        *(_DWORD *)__s1 = 0;
        if (fread(__s1, 4uLL, 1uLL, *(FILE **)(a1 + 104)) == 1)
        {
          if (*(_DWORD *)__s1)
          {
            size_t v18 = bswap32(*(unsigned int *)__s1);
            if (a3 + 6 + v18 <= *(void *)(a1 + 96))
            {
              unsigned int v19 = malloc_type_calloc(1uLL, v18, 0xB5C59029uLL);
              *a4 = v19;
              if (!v19) {
                return 9;
              }
              if (fread(v19, v18, 1uLL, *(FILE **)(a1 + 104)) == 1)
              {
                if (a2 != 1)
                {
                  uint64_t v6 = 0;
                  *a5 = v18;
                  return v6;
                }
                unsigned int v20 = (void *)*a4;
                uint64_t v21 = (v18 - 1);
                if (!*((unsigned char *)*a4 + v21) && strlen((const char *)*a4) == v21)
                {
                  *a5 = v18;
                  if (v18 <= 0x6C)
                  {
                    int v22 = *(_DWORD **)(a1 + 32);
                    if (v22)
                    {
                      *(void *)(a1 + 32) = 0;
                    }
                    else
                    {
                      int v22 = malloc_type_calloc(1uLL, 0x88uLL, 0x10200408BEEBE60uLL);
                      if (!v22) {
                        return 0;
                      }
                    }
                    *(void *)int v22 = a3;
                    v22[2] = v18;
                    unint64_t v25 = *(void **)(a1 + 24);
                    *((void *)v22 + 2) = v25;
                    memcpy(v22 + 6, *a4, v18);
                    *(void *)(a1 + 24) = v22;
                    int v26 = *(_DWORD *)(a1 + 16);
                    if ((*(unsigned char *)(a1 + 8) & 4) != 0 || v26 != 128)
                    {
                      uint64_t v6 = 0;
                      *(_DWORD *)(a1 + 16) = v26 + 1;
                      return v6;
                    }
                    do
                    {
                      unint64_t v27 = v22;
                      int v22 = v25;
                      unint64_t v25 = (void *)v25[2];
                    }
                    while (v25);
                    *((void *)v27 + 2) = 0;
                    file_string_dispose(a1, v22);
                  }
                  return 0;
                }
              }
              else
              {
                unsigned int v20 = (void *)*a4;
              }
              free(v20);
              *a4 = 0;
            }
          }
        }
        return 7;
      }
      return 2;
    }
    if (a2 != 1) {
      return 2;
    }
    unsigned int v14 = v11 & 0xF;
    if (v14 > 7) {
      return 2;
    }
    char v31 = 0;
    *(void *)__s1 = 0;
    uint64_t v6 = 9;
    __memcpy_chk();
    uint64_t v23 = strdup(__s1);
    *a4 = v23;
    if (v23)
    {
      uint64_t v6 = 0;
      *a5 = v14;
    }
  }
  return v6;
}

unint64_t asl_file_fetch_helper_64(unint64_t **a1, int *a2, char *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8C08];
  unint64_t result = asl_core_ntohq(**a1);
  ++*a1;
  if (a2)
  {
    if (a3)
    {
      snprintf(__str, 0x100uLL, "%llu", result);
      return asl_msg_set_key_val(a2, a3, __str);
    }
  }
  return result;
}

unsigned int **asl_file_fetch_helper_32(unsigned int **result, int *a2, char *a3, int a4, int a5)
{
  uint64_t v10 = *MEMORY[0x263EF8C08];
  unsigned int v5 = *(*result)++;
  if (a2)
  {
    if (a3)
    {
      unsigned int v8 = bswap32(v5);
      if (!a4 || v8 != a5)
      {
        snprintf(__str, 0x100uLL, "%u", v8);
        return (unsigned int **)asl_msg_set_key_val(a2, a3, __str);
      }
    }
  }
  return result;
}

void *asl_file_fetch_helper_16(void *result, int *a2, char *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  unsigned int v3 = *(unsigned __int16 *)*result;
  *result += 2;
  if (a2)
  {
    if (a3)
    {
      snprintf(__str, 0x100uLL, "%hu", __rev16(v3));
      return (void *)asl_msg_set_key_val(a2, a3, __str);
    }
  }
  return result;
}

void asl_file_fetch_helper_str(uint64_t a1, unint64_t **a2, int *a3, char *a4, _DWORD *a5)
{
  unint64_t v10 = asl_core_ntohq(**a2);
  ++*a2;
  uint64_t v12 = 0;
  unsigned int v11 = 0;
  if (v10) {
    LODWORD(v10) = asl_file_fetch_object(a1, 1, v10, (const void **)&v12, &v11);
  }
  if (a5) {
    *a5 = v10;
  }
  if (!v10)
  {
    if (v12)
    {
      asl_msg_set_key_val(a3, a4, (const char *)v12);
      free(v12);
    }
  }
}

uint64_t asl_legacy1_open(const char *a1, void ***a2)
{
  uint64_t v23 = *MEMORY[0x263EF8C08];
  memset(&v18, 0, sizeof(v18));
  if (stat(a1, &v18) < 0) {
    return 9999;
  }
  st_vm_size_t size = v18.st_size;
  unsigned int v5 = (void **)malloc_type_calloc(1uLL, 0x18uLL, 0x102004093CA8EA1uLL);
  if (!v5) {
    return 9;
  }
  uint64_t v6 = v5;
  uint64_t v7 = fopen(a1, "r");
  v6[2] = v7;
  if (!v7)
  {
LABEL_10:
    free(v6);
    return 2;
  }
  memset(__ptr, 0, sizeof(__ptr));
  if (fread(__ptr, 0x50uLL, 1uLL, v7) == 1)
  {
    if (LODWORD(__ptr[0]) != 541872961 || WORD2(__ptr[0]) != 16964)
    {
      fclose((FILE *)v6[2]);
      goto LABEL_10;
    }
    if (!fseek((FILE *)v6[2], 80, 0))
    {
      uint64_t v10 = st_size / 80;
      unsigned int v11 = malloc_type_calloc(v10, 0x18uLL, 0x1000040FE83055AuLL);
      uint64_t *v6 = v11;
      if (v11)
      {
        if (v10 >= 2)
        {
          unsigned int v12 = 0;
          int v13 = 1;
          while (1)
          {
            if (fread(v20, 0x50uLL, 1uLL, (FILE *)v6[2]) != 1) {
              goto LABEL_15;
            }
            if (!v20[0]) {
              break;
            }
            if (v20[0] == 2)
            {
              unsigned int v15 = 0;
              unint64_t v14 = bswap64(v21);
              goto LABEL_27;
            }
            if (v20[0] == 4)
            {
              unint64_t v14 = bswap64(v21);
              unsigned int v15 = bswap32(v22);
LABEL_27:
              uint64_t v16 = (uint64_t)*v6 + 24 * v12;
              *(unsigned char *)uint64_t v16 = v20[0];
              *(_DWORD *)(v16 + 4) = v13;
              *(void *)(v16 + 8) = v14;
              *(_DWORD *)(v16 + 16) = v15;
              ++v12;
            }
            if (v10 == ++v13)
            {
              unsigned int v11 = *v6;
              goto LABEL_31;
            }
          }
          unint64_t v14 = 0;
          unsigned int v15 = 0;
          goto LABEL_27;
        }
        unsigned int v12 = 0;
LABEL_31:
        uint64_t v17 = reallocf(v11, 24 * v12);
        uint64_t *v6 = v17;
        if (v17)
        {
          *((_DWORD *)v6 + 2) = v12;
          qsort(v17, v12, 0x18uLL, (int (__cdecl *)(const void *, const void *))slot_comp);
        }
      }
    }
LABEL_15:
    uint64_t result = 0;
    *a2 = v6;
  }
  else
  {
    fclose((FILE *)v6[2]);
    free(v6);
    return 7;
  }
  return result;
}

uint64_t asl_legacy1_close(void **a1)
{
  if (!a1) {
    return 2;
  }
  uint64_t v2 = *a1;
  if (v2) {
    free(v2);
  }
  unsigned int v3 = (FILE *)a1[2];
  if (v3) {
    fclose(v3);
  }
  free(a1);
  return 0;
}

uint64_t asl_legacy1_fetch(uint64_t *a1, unint64_t a2, int **a3)
{
  if (!a1) {
    return 2;
  }
  uint64_t result = 1;
  if (a2 != -1 && a3)
  {
    unsigned int v6 = slotlist_find(a1, a2, 0);
    if (v6 == -1)
    {
      return 4;
    }
    else
    {
      uint64_t result = msg_fetch((uint64_t)a1, *(_DWORD *)(*a1 + 24 * v6 + 4), a3);
      if (!result)
      {
        if (*a3) {
          return 0;
        }
        else {
          return 9999;
        }
      }
    }
  }
  return result;
}

uint64_t slotlist_find(uint64_t *a1, unint64_t a2, int a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2)
  {
    int v5 = *((_DWORD *)a1 + 2);
    if (v5)
    {
      uint64_t v6 = (v5 - 1);
      uint64_t v7 = *a1;
      if (v6 < 2)
      {
        uint64_t v8 = 0;
LABEL_15:
        uint64_t result = v6;
        if (*(void *)(v7 + 24 * v6 + 8) != a2)
        {
          if (*(void *)(v7 + 24 * v8 + 8) == a2)
          {
            return v8;
          }
          else if (a3 >= 0)
          {
            return 0xFFFFFFFFLL;
          }
          else
          {
            return v8;
          }
        }
      }
      else
      {
        LODWORD(v8) = 0;
        uint64_t result = v6 >> 1;
        while (1)
        {
          unint64_t v9 = *(void *)(v7 + 24 * result + 8);
          if (v9 == a2) {
            break;
          }
          if (v9 <= a2) {
            uint64_t v6 = v6;
          }
          else {
            uint64_t v6 = result;
          }
          if (v9 <= a2) {
            uint64_t v8 = result;
          }
          else {
            uint64_t v8 = v8;
          }
          uint64_t result = v8 + ((v6 - v8) >> 1);
          if ((v6 - v8) <= 1) {
            goto LABEL_15;
          }
        }
      }
    }
  }
  return result;
}

uint64_t msg_fetch(uint64_t a1, int a2, int **a3)
{
  uint64_t v28 = *MEMORY[0x263EF8C08];
  if (!a3) {
    return 1;
  }
  *a3 = 0;
  if ((fseek(*(FILE **)(a1 + 16), (80 * a2), 0) & 0x80000000) == 0)
  {
    int sid = 0;
    unsigned int v19 = 0;
    unsigned int v20 = 0;
    if (fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) == 1)
    {
      int v5 = (int *)asl_msg_new(0);
      if (!v5) {
        return 9;
      }
      uint64_t v6 = v5;
      unint64_t v21 = &v25;
      asl_legacy1_fetch_helper_64((unint64_t **)&v21, v5, "ASLMessageID");
      asl_legacy1_fetch_helper_32(&v21, v6, "ReadUID", 1, -1);
      asl_legacy1_fetch_helper_32(&v21, v6, "ReadGID", 1, -1);
      asl_legacy1_fetch_helper_64((unint64_t **)&v21, v6, "Time");
      asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v21, v6, "Host", &sid);
      asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v21, v6, "Sender", &sid);
      asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v21, v6, "Facility", &sid);
      uint64_t v7 = (unint64_t *)v21;
      snprintf(__str, 0x100uLL, "%u", bswap32(*v21));
      asl_msg_set_key_val(v6, "Level", __str);
      snprintf(__str, 0x100uLL, "%u", bswap32(*((_DWORD *)v7 + 1)));
      asl_msg_set_key_val(v6, "PID", __str);
      snprintf(__str, 0x100uLL, "%u", bswap32(*((_DWORD *)v7 + 2)));
      asl_msg_set_key_val(v6, "UID", __str);
      unsigned int v8 = bswap32(*((_DWORD *)v7 + 3));
      unint64_t v21 = (unsigned int *)(v7 + 2);
      snprintf(__str, 0x100uLL, "%u", v8);
      asl_msg_set_key_val(v6, "GID", __str);
      asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v21, v6, "Message", &sid);
      if (!v24)
      {
LABEL_28:
        uint64_t result = 0;
        *a3 = v6;
        return result;
      }
      unsigned int v9 = 0;
      unsigned int v10 = 0;
      unsigned int v11 = bswap32(v24);
      while ((fseek(*(FILE **)(a1 + 16), 80 * v11, 0) & 0x80000000) == 0
           && fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) == 1)
      {
        unsigned int v12 = bswap32(v25);
        if (!v9) {
          unsigned int v9 = v12;
        }
        if (v10 < v9)
        {
          unsigned int v13 = 0;
          unint64_t v14 = (unint64_t *)v26;
          while (1)
          {
            unsigned int v20 = 0;
            int sid = string_fetch_sid(a1, bswap64(*(v14 - 1)), &v20);
            unsigned int v19 = 0;
            if (!sid)
            {
              int sid = string_fetch_sid(a1, bswap64(*v14), &v19);
              unsigned int v15 = v20;
              if (sid) {
                BOOL v16 = 1;
              }
              else {
                BOOL v16 = v20 == 0;
              }
              if (v16) {
                goto LABEL_20;
              }
              asl_msg_set_key_val(v6, (char *)v20, (const char *)v19);
            }
            unsigned int v15 = v20;
LABEL_20:
            if (v15) {
              free(v15);
            }
            if (v19) {
              free(v19);
            }
            unsigned int v17 = v13 + 1;
            if (v13 <= 2)
            {
              v14 += 2;
              ++v13;
              if (v17 + v10 < v9) {
                continue;
              }
            }
            v10 += v17;
            break;
          }
        }
        unsigned int v11 = bswap32(v24);
        if (!v24) {
          goto LABEL_28;
        }
      }
      asl_msg_release((asl_object_t)v6);
    }
  }
  return 7;
}

uint64_t asl_legacy1_match(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, unint64_t a5, uint64_t a6, int a7)
{
  asl_object_t obj = 0;
  if (!a1) {
    return 2;
  }
  uint64_t v8 = 1;
  if (a3 && a4)
  {
    *a3 = 0;
    if (a7 < 0) {
      int v12 = -1;
    }
    else {
      int v12 = 1;
    }
    if (a5 == -1 && a7 < 0) {
      uint64_t v13 = *(unsigned int *)(a1 + 8);
    }
    else {
      uint64_t v13 = slotlist_find((uint64_t *)a1, a5, v12);
    }
    uint64_t search_slot = next_search_slot(a1, v13, v12);
    if (search_slot == -1) {
      return 0;
    }
    uint64_t v15 = search_slot;
    if (search_slot < *(_DWORD *)(a1 + 8))
    {
      if (a2)
      {
        unsigned int v22 = *(_DWORD *)(a2 + 8);
        BOOL v16 = v22 == 0;
      }
      else
      {
        unsigned int v22 = 0;
        BOOL v16 = 1;
      }
      asl_msg_list_new();
      *a3 = v17;
      if (!v17) {
        return 9;
      }
      if (v15 != -1)
      {
        uint64_t v8 = 0;
        while (1)
        {
          if (v15 >= *(_DWORD *)(a1 + 8)) {
            return v8;
          }
          uint64_t v18 = *(void *)a1 + 24 * v15;
          int v19 = *(_DWORD *)(v18 + 4);
          *a4 = *(void *)(v18 + 8);
          uint64_t v8 = msg_fetch(a1, v19, (int **)&obj);
          if (!v16)
          {
            if (!v22) {
              goto LABEL_28;
            }
            uint64_t v20 = 0;
            while (asl_msg_cmp(*(_DWORD **)(*(void *)(a2 + 16) + v20), obj) != 1)
            {
              v20 += 8;
              if (8 * v22 == v20) {
                goto LABEL_28;
              }
            }
          }
          asl_msg_list_append(*a3, obj);
LABEL_28:
          asl_msg_release(obj);
          uint64_t v15 = next_search_slot(a1, v15, v12);
          if (v15 == -1) {
            return v8;
          }
        }
      }
      return 0;
    }
    return 9999;
  }
  return v8;
}

uint64_t slot_comp(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (!a2) {
      return 1;
    }
    unint64_t v2 = *(void *)(a1 + 8);
    unint64_t v3 = *(void *)(a2 + 8);
    if (v2 < v3) {
      return 0xFFFFFFFFLL;
    }
    if (v2 == v3)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 4);
      unsigned int v6 = *(_DWORD *)(a2 + 4);
      BOOL v7 = v5 >= v6;
      BOOL v8 = v5 != v6;
      if (v7) {
        return v8;
      }
      else {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 1;
    }
  }
  else if (a2)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

unint64_t **asl_legacy1_fetch_helper_64(unint64_t **result, int *a2, char *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  unint64_t v3 = *(*result)++;
  if (a3)
  {
    snprintf(__str, 0x100uLL, "%llu", bswap64(v3));
    return (unint64_t **)asl_msg_set_key_val(a2, a3, __str);
  }
  return result;
}

unsigned int **asl_legacy1_fetch_helper_32(unsigned int **result, int *a2, char *a3, int a4, int a5)
{
  uint64_t v10 = *MEMORY[0x263EF8C08];
  unsigned int v5 = *(*result)++;
  if (a3)
  {
    unsigned int v8 = bswap32(v5);
    if (!a4 || v8 != a5)
    {
      snprintf(__str, 0x100uLL, "%u", v8);
      return (unsigned int **)asl_msg_set_key_val(a2, a3, __str);
    }
  }
  return result;
}

void asl_legacy1_fetch_helper_str(uint64_t a1, unint64_t **a2, int *a3, char *a4, _DWORD *a5)
{
  unint64_t v8 = *(*a2)++;
  uint64_t v10 = 0;
  if (v8)
  {
    int sid = string_fetch_sid(a1, bswap64(v8), &v10);
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int sid = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = sid;
LABEL_4:
  if (!sid)
  {
    if (v10)
    {
      asl_msg_set_key_val(a3, a4, (const char *)v10);
      free(v10);
    }
  }
}

uint64_t string_fetch_sid(uint64_t a1, unint64_t a2, void *a3)
{
  *(void *)&v30[55] = *MEMORY[0x263EF8C08];
  if (!a3) {
    return 1;
  }
  *a3 = 0;
  if (a2 == -1) {
    return 0;
  }
  unint64_t v4 = bswap64(a2);
  char v25 = HIBYTE(v4);
  __int16 v24 = HIDWORD(v4) >> 8;
  int v23 = v4 >> 8;
  if ((a2 & 0x8000000000000000) != 0)
  {
    size_t v21 = HIBYTE(a2) & 0xF;
    unsigned int v22 = malloc_type_calloc(1uLL, v21, 0xDF7C2B50uLL);
    *a3 = v22;
    if (!v22) {
      return 9;
    }
    memcpy(v22, &v23, v21);
    return 0;
  }
  unsigned int v6 = slotlist_find((uint64_t *)a1, a2, 0);
  if (v6 == -1) {
    return 6;
  }
  int v7 = *(_DWORD *)(*(void *)a1 + 24 * v6 + 4);
  *a3 = 0;
  if (fseek(*(FILE **)(a1 + 16), (80 * v7), 0) < 0
    || fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) != 1)
  {
    return 7;
  }
  if (__ptr != 4) {
    return 3;
  }
  if (!v29) {
    return 0;
  }
  size_t v8 = bswap32(v29);
  unsigned int v9 = v27;
  uint64_t v10 = (char *)malloc_type_calloc(1uLL, v8, 0xA8A1A17EuLL);
  if (!v10) {
    return 9;
  }
  unsigned int v11 = v10;
  if (v8 >= 0x37) {
    size_t v12 = 55;
  }
  else {
    size_t v12 = v8;
  }
  memcpy(v10, v30, v12);
  BOOL v13 = v9 != 0;
  unsigned int v14 = v8 - v12;
  BOOL v15 = v8 != v12;
  if (v8 == v12 || !v9)
  {
LABEL_23:
    if (!v13 && !v15)
    {
      uint64_t result = 0;
      *a3 = v11;
      return result;
    }
  }
  else
  {
    unsigned int v16 = bswap32(v9);
    uint64_t v17 = &v11[v12];
    while ((fseek(*(FILE **)(a1 + 16), 80 * v16, 0) & 0x80000000) == 0
         && fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) == 1)
    {
      unsigned int v18 = v27;
      if (v14 >= 0x4B) {
        size_t v19 = 75;
      }
      else {
        size_t v19 = v14;
      }
      memcpy(v17, v28, v19);
      v14 -= v19;
      BOOL v13 = v18 != 0;
      BOOL v15 = v14 != 0;
      if (v18)
      {
        unsigned int v16 = bswap32(v18);
        v17 += v19;
        if (v14) {
          continue;
        }
      }
      goto LABEL_23;
    }
  }
  free(v11);
  return 7;
}

uint64_t next_search_slot(uint64_t a1, uint64_t a2, int a3)
{
  if ((a3 & 0x80000000) == 0)
  {
    while (1)
    {
      a2 = (a2 + 1);
      if (a2 >= *(_DWORD *)(a1 + 8)) {
        break;
      }
      if (*(unsigned char *)(*(void *)a1 + 24 * a2) == 2) {
        return a2;
      }
    }
    return 0xFFFFFFFFLL;
  }
  if (!a2 || *(_DWORD *)(a1 + 8) < a2) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v4 = *(unsigned char **)a1;
  for (uint64_t i = 24 * a2 - 24; i; i -= 24)
  {
    int v6 = v4[i];
    a2 = (a2 - 1);
    if (v6 == 2) {
      return a2;
    }
  }
  if (*v4 == 2) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

asl_object_t asl_msg_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

void asl_msg_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

unsigned int *asl_msg_type(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t asl_msg_count(uint64_t a1)
{
  for (uint64_t i = 0; a1; a1 = *(void *)(a1 + 24))
    uint64_t i = (*(_DWORD *)(a1 + 8) + i);
  return i;
}

uint64_t _asl_msg_dump(uint64_t result, const char *a2, _DWORD *a3)
{
  if (result)
  {
    unint64_t v3 = a3;
    unsigned int v5 = (FILE *)result;
    if (a3)
    {
      if (*a3 == 1) {
        unsigned int v6 = 10;
      }
      else {
        unsigned int v6 = 0;
      }
      if (*a3) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 15;
      }
      for (char i = 1; ; char i = 0)
      {
        if (i)
        {
          fprintf(v5, "asl_msg %s: %p\n", a2, v3);
          fprintf(v5, "    refcount: %u\n", v3[1]);
          fprintf(v5, "    asl_type: %u\n");
        }
        else
        {
          fprintf(v5, "  page: %p\n");
        }
        fprintf(v5, "    count: %u\n", v3[2]);
        fprintf(v5, "    data_size: %u\n", v3[3]);
        fprintf(v5, "    mem_size: %llu\n", *((void *)v3 + 2));
        uint64_t result = fprintf(v5, "    next: %p\n", *((const void **)v3 + 3));
        if (v7) {
          break;
        }
LABEL_33:
        unint64_t v3 = (_DWORD *)*((void *)v3 + 3);
        if (!v3) {
          return result;
        }
      }
      unint64_t v9 = 0;
      while (1)
      {
        fprintf(v5, "    slot[%d]: ", v9);
        if (*v3 && (*v3 != 1 || v9 > 9)) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = *((unsigned __int16 *)v3 + v9 + 16);
        }
        _asl_msg_dump_kv(v5, (uint64_t)v3, v10);
        fputc(32, v5);
        if (!*v3) {
          break;
        }
        if (*v3 == 1 && v9 <= 9)
        {
          uint64_t v11 = 10;
LABEL_26:
          unsigned int v12 = *((unsigned __int16 *)v3 + v9 + v11 + 16);
          goto LABEL_27;
        }
        unsigned int v12 = 0;
LABEL_27:
        uint64_t result = _asl_msg_dump_kv(v5, (uint64_t)v3, v12);
        if (*v3 == 1)
        {
          if (v9 > 9) {
            int v13 = 0;
          }
          else {
            int v13 = *((unsigned __int16 *)v3 + v9 + 36);
          }
          uint64_t result = fprintf(v5, " 0x%04x\n", v13);
        }
        if (v7 == ++v9) {
          goto LABEL_33;
        }
      }
      uint64_t v11 = 15;
      goto LABEL_26;
    }
    return fprintf((FILE *)result, "asl_msg %s: NULL\n", a2);
  }
  return result;
}

size_t _asl_msg_dump_kv(FILE *__stream, uint64_t a2, unsigned int a3)
{
  if (a3 == 0xFFFF)
  {
    unsigned int v5 = "-free-";
    size_t v6 = 6;
LABEL_7:
    return fwrite(v5, v6, 1uLL, __stream);
  }
  if ((a3 & 0xC000) == 0x4000) {
    return fprintf(__stream, "(extern: %s)", *(const char **)(a2 + (a3 & 0x3FFF) + 92));
  }
  if ((a3 & 0xC000) == 0x8000)
  {
    switch(a3)
    {
      case 0x8001u:
        unsigned int v5 = "(dict: Time)";
        goto LABEL_19;
      case 0x8002u:
        unsigned int v5 = "(dict: Nano)";
        goto LABEL_19;
      case 0x8003u:
        unsigned int v5 = "(dict: Host)";
LABEL_19:
        size_t v6 = 12;
        goto LABEL_7;
      case 0x8004u:
        unsigned int v5 = "(dict: Sender)";
        goto LABEL_34;
      case 0x8005u:
        unsigned int v5 = "(dict: Facility)";
        size_t v6 = 16;
        goto LABEL_7;
      case 0x8006u:
      case 0x800Eu:
        unsigned int v5 = "(dict: PID)";
        goto LABEL_24;
      case 0x8007u:
        unsigned int v5 = "(dict: UID)";
        goto LABEL_24;
      case 0x8008u:
        unsigned int v5 = "(dict: GID)";
LABEL_24:
        size_t v6 = 11;
        goto LABEL_7;
      case 0x8009u:
        unsigned int v5 = "(dict: Level)";
        size_t v6 = 13;
        goto LABEL_7;
      case 0x800Au:
        unsigned int v5 = "(dict: Message)";
        goto LABEL_31;
      case 0x800Bu:
        unsigned int v5 = "(dict: ReadUID)";
        goto LABEL_31;
      case 0x800Cu:
        unsigned int v5 = "(dict: ReadGID)";
        goto LABEL_31;
      case 0x800Du:
        unsigned int v5 = "(dict: Session)";
        goto LABEL_31;
      case 0x800Fu:
        unsigned int v5 = "(dict: RefProc)";
LABEL_31:
        size_t v6 = 15;
        break;
      case 0x8010u:
        unsigned int v5 = "(dict: ASLMessageID)";
        size_t v6 = 20;
        break;
      case 0x8011u:
        unsigned int v5 = "(dict: Expire)";
LABEL_34:
        size_t v6 = 14;
        break;
      case 0x8012u:
        unsigned int v5 = "(dict: ASLOption)";
LABEL_37:
        size_t v6 = 17;
        break;
      default:
        switch(a3)
        {
          case 0x8101u:
            unsigned int v5 = "(dict: com.apple.message.domain)";
            goto LABEL_51;
          case 0x8102u:
            unsigned int v5 = "(dict: com.apple.message.domain_scope)";
            size_t v6 = 38;
            goto LABEL_7;
          case 0x8103u:
            unsigned int v5 = "(dict: com.apple.message.result)";
            goto LABEL_51;
          case 0x8104u:
            unsigned int v5 = "(dict: com.apple.message.signature)";
            size_t v6 = 35;
            goto LABEL_7;
          case 0x8105u:
            unsigned int v5 = "(dict: com.apple.message.signature2)";
            goto LABEL_43;
          case 0x8106u:
            unsigned int v5 = "(dict: com.apple.message.signature3)";
LABEL_43:
            size_t v6 = 36;
            goto LABEL_7;
          case 0x8107u:
            unsigned int v5 = "(dict: com.apple.message.success)";
            size_t v6 = 33;
            goto LABEL_7;
          case 0x8108u:
            unsigned int v5 = "(dict: com.apple.message.uuid)";
            size_t v6 = 30;
            goto LABEL_7;
          case 0x8109u:
            unsigned int v5 = "(dict: com.apple.message.value)";
            size_t v6 = 31;
            goto LABEL_7;
          case 0x810Au:
            unsigned int v5 = "(dict: com.apple.message.value2)";
            goto LABEL_51;
          case 0x810Bu:
            unsigned int v5 = "(dict: com.apple.message.value3)";
            goto LABEL_51;
          case 0x810Cu:
            unsigned int v5 = "(dict: com.apple.message.value4)";
            goto LABEL_51;
          case 0x810Du:
            unsigned int v5 = "(dict: com.apple.message.value5)";
LABEL_51:
            size_t v6 = 32;
            break;
          default:
            unsigned int v5 = "(dict: -unknown-)";
            goto LABEL_37;
        }
        break;
    }
    goto LABEL_7;
  }
  return fputs((const char *)(a2 + a3 + 92), __stream);
}

uint64_t asl_msg_fetch(_DWORD *a1, unsigned int a2, char **a3, int **a4, _WORD *a5)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  size_t v6 = a1;
  if (*a1 == 1) {
    int v7 = 10;
  }
  else {
    int v7 = 0;
  }
  if (*a1) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 15;
  }
  unsigned int v9 = HIBYTE(a2);
  if (HIBYTE(a2) == 255) {
    return 0xFFFFFFFFLL;
  }
  int v13 = a2 & 0xFFFFFF;
  if ((a2 & 0xFFFFFF) != 0)
  {
    int v14 = a2 & 0xFFFFFF;
    do
    {
      size_t v6 = (_DWORD *)*((void *)v6 + 3);
      if (!v6) {
        return 0xFFFFFFFFLL;
      }
    }
    while (--v14);
  }
  if (a3) {
    *a3 = _asl_msg_slot_key((char *)v6, HIBYTE(a2));
  }
  if (a4) {
    *a4 = _asl_msg_slot_val(v6, v9);
  }
  if (a5)
  {
    __int16 v15 = 0;
    if (a2 >> 25 <= 4 && *v6 == 1) {
      __int16 v15 = *((_WORD *)v6 + v9 + 36);
    }
    *a5 = v15;
  }
  while (++v9 < v8)
  {
LABEL_27:
    if (*((__int16 *)v6 + v9 + 16) != -1) {
      return v13 | (v9 << 24);
    }
  }
  size_t v6 = (_DWORD *)*((void *)v6 + 3);
  if (v6)
  {
    unsigned int v9 = 0;
    ++v13;
    goto LABEL_27;
  }
  return 4278190080;
}

char *_asl_msg_slot_key(char *result, unsigned int a2)
{
  if (result)
  {
    int v2 = *(_DWORD *)result;
    if (a2 >= 0xF && !v2 || a2 >= 0xA && v2 == 1) {
      return 0;
    }
    if (v2 == 1)
    {
      if (a2 > 9)
      {
LABEL_10:
        LODWORD(v3) = 0;
LABEL_11:
        result += v3 + 92;
        return result;
      }
    }
    else if (v2 || a2 >= 0xF)
    {
      goto LABEL_10;
    }
    uint64_t v3 = *(unsigned __int16 *)&result[2 * a2 + 32];
    if (v3 == 0xFFFF) {
      return 0;
    }
    switch(v3 & 0xC000)
    {
      case 0x8000:
        if ((unsigned __int16)(v3 + 0x7FFF) > 0x12u)
        {
          LOWORD(v3) = v3 + 32511;
          if ((unsigned __int16)v3 > 0xCu) {
            return 0;
          }
          uint64_t v3 = (unsigned __int16)v3;
          unint64_t v4 = MTStandardKey;
        }
        else
        {
          uint64_t v3 = (unsigned __int16)(v3 + 0x7FFF);
          unint64_t v4 = ASLStandardKey;
        }
        return v4[v3];
      case 0x4000:
        return *(char **)&result[(v3 & 0x3FFF) + 92];
      case 0:
        goto LABEL_11;
      default:
        return 0;
    }
  }
  return result;
}

int *asl_msg_get_val_for_key(int *result, char *a2)
{
  if (result)
  {
    unsigned int v3 = -1;
    int v2 = 0;
    if (_asl_msg_index(result, a2, &v3, &v2) == -1) {
      return 0;
    }
    else {
      return _asl_msg_slot_val(v2, v3);
    }
  }
  return result;
}

char *asl_msg_key(int *a1, int a2)
{
  if (!a1) {
    return 0;
  }
  int v2 = 0;
  if (*a1 == 1) {
    LODWORD(v3) = 10;
  }
  else {
    LODWORD(v3) = 0;
  }
  if (*a1) {
    uint64_t v3 = v3;
  }
  else {
    uint64_t v3 = 15;
  }
  while (!v3)
  {
LABEL_17:
    a1 = (int *)*((void *)a1 + 3);
    if (!a1) {
      return 0;
    }
  }
  unint64_t v4 = 0;
  int v5 = *a1;
  while (1)
  {
    if ((!v5 || v5 == 1 && v4 <= 9) && *((__int16 *)a1 + v4 + 16) == -1) {
      goto LABEL_16;
    }
    if (v2 == a2) {
      return _asl_msg_slot_key((char *)a1, v4);
    }
    ++v2;
LABEL_16:
    if (v3 == ++v4) {
      goto LABEL_17;
    }
  }
}

void asl_msg_unset(_DWORD *a1, char *a2)
{
  if (a1 && a2)
  {
    unsigned int v3 = -1;
    int v2 = 0;
    if (_asl_msg_index(a1, a2, &v3, &v2) != -1) {
      _asl_msg_unset_page_slot(v2, v3);
    }
  }
}

void _asl_msg_unset_page_slot(int *a1, unsigned int a2)
{
  if (a1)
  {
    int v4 = *a1;
    if (*a1 == 1) {
      unsigned int v5 = 10;
    }
    else {
      unsigned int v5 = 0;
    }
    if (!v4) {
      unsigned int v5 = 15;
    }
    if (v5 > a2)
    {
      if (v4 == 1)
      {
        if (a2 > 9) {
          goto LABEL_28;
        }
      }
      else
      {
        if (v4)
        {
          int v6 = 0;
LABEL_15:
          if (v4 == 1)
          {
            if (a2 <= 9)
            {
              int v7 = 10;
              goto LABEL_21;
            }
          }
          else if (!v4 && a2 < 0xF)
          {
            int v7 = 15;
LABEL_21:
            __int16 v8 = *((_WORD *)a1 + v7 + a2 + 16);
LABEL_23:
            if (v6 == 0xFFFF) {
              return;
            }
            if ((v6 & 0xC000) == 0x4000)
            {
              unsigned int v9 = *(char **)((char *)a1 + (v6 & 0x3FFF) + 92);
              *((void *)a1 + 2) += ~strlen(v9);
              free(v9);
            }
            if ((v8 & 0xC000) == 0x4000)
            {
              unsigned int v10 = *(char **)((char *)a1 + (v8 & 0x3FFF) + 92);
              *((void *)a1 + 2) += ~strlen(v10);
              free(v10);
            }
LABEL_28:
            int v11 = *a1;
            if (*a1)
            {
              if (a2 > 9 || v11 != 1)
              {
LABEL_35:
                if (a2 <= 9 && v11 == 1) {
                  *((_WORD *)a1 + a2 + 36) = 0;
                }
                goto LABEL_38;
              }
              int v12 = 10;
            }
            else
            {
              if (a2 >= 0xF)
              {
LABEL_38:
                --a1[2];
                return;
              }
              int v12 = 15;
            }
            *((_WORD *)a1 + a2 + 16) = -1;
            *((_WORD *)a1 + v12 + a2 + 16) = -1;
            goto LABEL_35;
          }
          __int16 v8 = 0;
          goto LABEL_23;
        }
        if (a2 >= 0xF) {
          goto LABEL_28;
        }
      }
      int v6 = *((unsigned __int16 *)a1 + a2 + 16);
      goto LABEL_15;
    }
  }
}

void asl_msg_unset_index(uint64_t a1, unsigned int a2)
{
  int v5 = -1;
  int v4 = 0;
  if (a1 && !_asl_msg_resolve_index(a1, a2, &v4, &v5))
  {
    int v2 = v4;
    unsigned int v3 = v5;
    _asl_msg_unset_page_slot(v2, v3);
  }
}

uint64_t _asl_msg_resolve_index(uint64_t a1, unsigned int a2, void *a3, _DWORD *a4)
{
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1)
  {
    uint64_t v5 = 0;
    *a4 = -1;
    *a3 = 0;
    if (*(_DWORD *)a1 == 1) {
      unsigned int v6 = 10;
    }
    else {
      unsigned int v6 = 0;
    }
    if (*(_DWORD *)a1) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 15;
    }
    do
    {
      uint64_t v8 = (*(_DWORD *)(a1 + 8) + v5);
      if (v8 >= a2)
      {
        *a3 = a1;
        if (v7)
        {
          uint64_t v9 = 0;
          uint64_t v8 = v5;
          while (1)
          {
            if (*(__int16 *)(a1 + 32 + 2 * v9) != -1)
            {
              if (v8 == a2)
              {
                uint64_t v4 = 0;
                *a4 = v9;
                return v4;
              }
              uint64_t v8 = (v8 + 1);
            }
            if (v7 == ++v9) {
              goto LABEL_17;
            }
          }
        }
        uint64_t v8 = v5;
      }
LABEL_17:
      a1 = *(void *)(a1 + 24);
      uint64_t v5 = v8;
    }
    while (a1);
    return 0xFFFFFFFFLL;
  }
  return v4;
}

int *asl_msg_merge(int *a1, asl_object_t obj)
{
  if (obj)
  {
    int v14 = 0;
    __int16 v15 = 0;
    uint32_t type = asl_get_type(obj);
    uint32_t v5 = type;
    unsigned int v6 = a1;
    if (!a1)
    {
      page = _asl_msg_make_page(type);
      unsigned int v6 = (int *)page;
      if (page)
      {
        *(_DWORD *)page = v5;
        *((_DWORD *)page + 1) = 1;
      }
    }
    unsigned __int16 v16 = 0;
    unsigned int v8 = asl_msg_fetch(obj, 0, &v15, (int **)&v14, &v16);
    if (v8 != -1)
    {
      for (unsigned int i = v8; i != -1; unsigned int i = asl_msg_fetch(obj, i, &v15, (int **)&v14, &v16))
      {
        if (!v5) {
          unsigned __int16 v16 = 0;
        }
        unsigned int v10 = v14;
        int v11 = v15;
        int v12 = v16;
        if (a1)
        {
          if (!v6) {
            continue;
          }
          if (!v15) {
            continue;
          }
          int v18 = -1;
          uint64_t v17 = 0;
          if (_asl_msg_index(v6, v15, &v18, &v17) != -1) {
            continue;
          }
        }
        asl_msg_set_key_val_op(v6, v11, v10, v12);
      }
    }
    return v6;
  }
  return a1;
}

int *asl_msg_copy(asl_object_t obj)
{
  return asl_msg_merge(0, obj);
}

uint64_t _asl_msg_test(_DWORD *a1, _DWORD *a2)
{
  unsigned __int16 v16 = 0;
  __s1 = 0;
  __int16 v18 = 0;
  unsigned int v4 = asl_msg_fetch(a1, 0, &__s1, (int **)&v16, &v18);
  if (v4 == -1) {
    return 1;
  }
  unsigned int v5 = v4;
  while (1)
  {
    __int16 v15 = 0;
    uint64_t result = asl_msg_lookup(a2, __s1, (int **)&v15, 0);
    __int16 v7 = v18;
    int v8 = v18 & 7;
    if (!v8) {
      goto LABEL_13;
    }
    if (v8 == 7)
    {
      if (result) {
        return 0;
      }
      goto LABEL_14;
    }
    if (!result)
    {
      int v9 = strcmp(__s1, "Time");
      unsigned int v10 = v15;
      int v11 = v16;
      if (!v9 && (v7 & 0x160) == 0)
      {
        if (v16)
        {
          if (v15)
          {
            time_t v12 = asl_core_parse_time(v16, 0);
            if ((v12 & 0x8000000000000000) == 0)
            {
              unint64_t v13 = v12;
              unint64_t v14 = asl_core_parse_time(v10, 0);
              if ((v14 & 0x8000000000000000) == 0)
              {
                switch(v8)
                {
                  case 2:
                    uint64_t result = v14 > v13;
                    goto LABEL_13;
                  case 3:
                    uint64_t result = v14 >= v13;
                    goto LABEL_13;
                  case 4:
                    uint64_t result = v14 < v13;
                    goto LABEL_13;
                  case 5:
                    uint64_t result = v14 <= v13;
                    goto LABEL_13;
                  case 6:
                    uint64_t result = v14 != v13;
                    goto LABEL_13;
                  case 7:
                    goto LABEL_14;
                  default:
                    uint64_t result = v14 == v13;
                    goto LABEL_13;
                }
              }
            }
          }
        }
      }
      uint64_t result = _asl_msg_test_expression(v7, v11, v10);
LABEL_13:
      if (!result) {
        return result;
      }
      goto LABEL_14;
    }
    if (v8 != 6) {
      return 0;
    }
LABEL_14:
    unsigned int v5 = asl_msg_fetch(a1, v5, &__s1, (int **)&v16, &v18);
    if (v5 == -1) {
      return 1;
    }
  }
}

uint64_t _asl_msg_test_expression(__int16 a1, char *a2, char *__s)
{
  int v3 = a1 & 7;
  if (v3 == 7) {
    return 1;
  }
  unsigned int v5 = __s;
  unsigned int v6 = a2;
  __int16 v7 = a1;
  if ((a1 & 0x20) == 0)
  {
    if ((a1 & 0x40) == 0)
    {
      size_t v8 = 0;
LABEL_24:
      return _asl_msg_basic_test(a1, a2, __s, v8);
    }
    if (__s)
    {
      unsigned int v10 = strlen(__s);
      if (!v6) {
        return v7 & 1;
      }
    }
    else
    {
      unsigned int v10 = 0;
      if (!a2) {
        return v7 & 1;
      }
    }
    size_t v13 = strlen(v6);
    size_t v8 = v13;
    if (v13)
    {
      if (v10 >= v13)
      {
        __s = &v5[v10 - v13];
        a1 = v7;
        a2 = v6;
        goto LABEL_24;
      }
      return v3 == 6;
    }
    return v7 & 1;
  }
  if ((a1 & 0x40) == 0)
  {
    if (__s)
    {
      unsigned int v9 = strlen(__s);
      if (!v6) {
        return v7 & 1;
      }
    }
    else
    {
      unsigned int v9 = 0;
      if (!a2) {
        return v7 & 1;
      }
    }
    size_t v12 = strlen(v6);
    size_t v8 = v12;
    if (v12)
    {
      if (v9 >= v12)
      {
        a1 = v7;
        a2 = v6;
        __s = v5;
        goto LABEL_24;
      }
      return v3 == 6;
    }
    return v7 & 1;
  }
  if (__s)
  {
    unsigned int v11 = strlen(__s);
    if (!v6) {
      return v7 & 1;
    }
  }
  else
  {
    unsigned int v11 = 0;
    if (!a2) {
      return v7 & 1;
    }
  }
  size_t v14 = strlen(v6);
  size_t v15 = v14;
  if (!v14) {
    return v7 & 1;
  }
  unsigned int v16 = v11 - v14;
  if (v11 < v14) {
    return v3 == 6;
  }
  uint64_t result = 0;
  if (v3 != 2 && v3 != 4)
  {
    int v18 = 0;
    unsigned int v19 = 0;
    do
    {
      while (_asl_msg_basic_test(v7 & 0xFF0 | 1u, v6, &v5[v19], v15))
      {
        if (v7) {
          return 1;
        }
        ++v18;
        if (++v19 > v16) {
          return v18 == 0;
        }
      }
      ++v19;
    }
    while (v19 <= v16);
    if ((v7 & 1) == 0) {
      return v18 == 0;
    }
    return 0;
  }
  return result;
}

uint64_t asl_msg_cmp(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = 0;
  if (a1)
  {
    unsigned int v4 = a2;
    if (a2)
    {
      if (*a1 == *a2)
      {
        int v5 = 0;
        unsigned int v6 = a1;
        do
        {
          v5 += v6[2];
          unsigned int v6 = (_DWORD *)*((void *)v6 + 3);
        }
        while (v6);
        __int16 v7 = a2;
        do
        {
          LODWORD(v6) = v7[2] + v6;
          __int16 v7 = (_DWORD *)*((void *)v7 + 3);
        }
        while (v7);
        if (v5 == v6)
        {
          int v14 = 0;
          unsigned int v11 = 0;
          size_t v12 = 0;
          size_t v13 = 0;
          unsigned int v8 = asl_msg_fetch(a1, 0, &v13, (int **)&v12, (_WORD *)&v14 + 1);
          if (v8 == -1) {
            return 1;
          }
          unsigned int v9 = v8;
          while (!asl_msg_lookup(v4, v13, (int **)&v11, &v14)
               && !strcmp(v12, v11)
               && (*a1 != 1 || HIWORD(v14) == (unsigned __int16)v14))
          {
            unsigned int v9 = asl_msg_fetch(a1, v9, &v13, (int **)&v12, (_WORD *)&v14 + 1);
            if (v9 == -1) {
              return 1;
            }
          }
        }
        return 0;
      }
      else
      {
        if (*a1 == 1)
        {
          unsigned int v10 = a1;
        }
        else
        {
          unsigned int v10 = a2;
          a2 = a1;
        }
        return _asl_msg_test(v10, a2);
      }
    }
  }
  return result;
}

uint64_t asl_msg_cmp_list(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (a2 && *(_DWORD *)(a2 + 8))
    {
      int v3 = (_DWORD *)result;
      uint64_t v4 = 0;
      while (!_asl_msg_test(*(_DWORD **)(*(void *)(a2 + 16) + 8 * v4), v3))
      {
        if (++v4 >= (unint64_t)*(unsigned int *)(a2 + 8)) {
          return 0;
        }
      }
    }
    return 1;
  }
  return result;
}

void *asl_msg_to_string_raw(int a1, _DWORD *a2, const char *a3)
{
  if (!a2) {
    return 0;
  }
  int v5 = 0;
  unsigned int v6 = a2;
  do
  {
    v5 += v6[2];
    unsigned int v6 = (_DWORD *)*((void *)v6 + 3);
  }
  while (v6);
  if (!v5) {
    return 0;
  }
  __int16 v7 = asl_string_new(a1);
  if (v7)
  {
    __s = 0;
    __s1 = 0;
    int v14 = 0;
    asl_msg_lookup(a2, "TimeNanoSec", (int **)&v14, 0);
    unsigned int v8 = asl_msg_fetch(a2, 0, &__s1, (int **)&__s, 0);
    if (v8 != -1)
    {
      unsigned int v9 = v8;
      int v10 = 0;
      do
      {
        if (__s1)
        {
          if (v10) {
            asl_string_append_char_no_encoding(v7, 32);
          }
          asl_string_append_char_no_encoding(v7, 91);
          asl_string_append_asl_key((uint64_t)v7, __s1);
          if (!strcmp(__s1, "Time"))
          {
            asl_string_append_char_no_encoding(v7, 32);
            if (__s && (unsigned int v11 = _asl_time_string(a3, __s, v14)) != 0)
            {
              size_t v12 = v11;
              asl_string_append_no_encoding(v7, v11);
              free(v12);
            }
            else
            {
              asl_string_append_char_no_encoding(v7, 48);
            }
          }
          else if (__s)
          {
            asl_string_append_char_no_encoding(v7, 32);
            asl_string_append((uint64_t)v7, __s);
          }
          asl_string_append_char_no_encoding(v7, 93);
          ++v10;
        }
        unsigned int v9 = asl_msg_fetch(a2, v9, &__s1, (int **)&__s, 0);
      }
      while (v9 != -1);
    }
  }
  return v7;
}

char *_asl_time_string(const char *a1, char *__s, const char *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8C08];
  time_t v26 = 0;
  memset(&v25, 0, sizeof(v25));
  __int16 v24 = 0;
  *(void *)unsigned int v27 = 0;
  if (!a1 || strlen(a1) > 0x1F)
  {
    unsigned int v6 = 0;
    strcpy(__str, "local");
LABEL_4:
    v29[0] = 0;
    goto LABEL_5;
  }
  int v23 = a1;
  unsigned int v6 = __str;
  snprintf(__str, 0x20uLL, "%s", v23);
  unsigned int v11 = strchr(__str, 46);
  if (!v11) {
    goto LABEL_4;
  }
  char *v11 = 0;
  int v12 = atoi(v11 + 1);
  v29[0] = 0;
  if (v12)
  {
    unsigned int v13 = v12;
    if (a3) {
      int v14 = atoi(a3);
    }
    else {
      int v14 = 0;
    }
    snprintf(v29, 0x10uLL, ".%09u", v14);
    if (v13 >= 9) {
      uint64_t v16 = 9;
    }
    else {
      uint64_t v16 = v13;
    }
    v29[v16 + 1] = 0;
    unsigned int v6 = __str;
  }
LABEL_5:
  time_t v26 = 0;
  if (__s) {
    time_t v26 = asl_core_parse_time(__s, 0);
  }
  if (!strcasecmp(__str, "lcl") || !strcasecmp(__str, "local"))
  {
    uint64_t result = ctime_r(&v26, v30);
    if (!result) {
      return result;
    }
    result[19] = 0;
    asprintf(&v24, "%s%s");
    return v24;
  }
  if (!strcasecmp(__str, "jz") || !strcasecmp(__str, "iso8601") || !strcasecmp(__str, "iso8601e"))
  {
    strncasecmp(__str, "iso8601", 7uLL);
    uint64_t result = (char *)localtime_r(&v26, &v25);
    if (!result) {
      return result;
    }
    if (v25.tm_gmtoff >= 0) {
      unint64_t tm_gmtoff = v25.tm_gmtoff;
    }
    else {
      unint64_t tm_gmtoff = -v25.tm_gmtoff;
    }
    if (tm_gmtoff % 0xE10 > 0x3B) {
      snprintf(v27, 8uLL, "%c%02lld:%02lld");
    }
    else {
      snprintf(v27, 8uLL, "%c%02lld");
    }
    asprintf(&v24, "%d-%02d-%02d%c%02d:%02d:%02d%s%s", (v25.tm_year + 1900), (v25.tm_mon + 1), v25.tm_mday);
    return v24;
  }
  if (!strcasecmp(__str, "iso8601b"))
  {
    uint64_t result = (char *)localtime_r(&v26, &v25);
    if (result)
    {
      if (v25.tm_gmtoff >= 0) {
        unint64_t v17 = v25.tm_gmtoff;
      }
      else {
        unint64_t v17 = -v25.tm_gmtoff;
      }
      if (v17 % 0xE10 > 0x3B) {
        snprintf(v27, 8uLL, "%c%02lld:%02lld");
      }
      else {
        snprintf(v27, 8uLL, "%c%02lld");
      }
      asprintf(&v24, "%d%02d%02dT%02d%02d%02d%s%s", (v25.tm_year + 1900), (v25.tm_mon + 1));
      return v24;
    }
    return result;
  }
  if (!strcasecmp(__str, "sec") || !strcasecmp(__str, "raw"))
  {
    asprintf(&v24, "%llu%s");
    return v24;
  }
  if (!strcasecmp(__str, "j"))
  {
    uint64_t result = (char *)localtime_r(&v26, &v25);
    if (!result) {
      return result;
    }
    asprintf(&v24, "%d-%02d-%02d %02d:%02d:%02d%s", (v25.tm_year + 1900));
    return v24;
  }
  if (!strcasecmp(__str, "utc")
    || !strcasecmp(__str, "zulu")
    || !strcasecmp(__str, "iso8601z")
    || !strcasecmp(__str, "iso8601ez"))
  {
    strncasecmp(__str, "iso8601", 7uLL);
    uint64_t result = (char *)gmtime_r(&v26, &v25);
    if (!result) {
      return result;
    }
    asprintf(&v24, "%d-%02d-%02d%c%02d:%02d:%02d%sZ", (v25.tm_year + 1900), (v25.tm_mon + 1));
    return v24;
  }
  if (!strcasecmp(__str, "iso8601bz"))
  {
    uint64_t result = (char *)gmtime_r(&v26, &v25);
    if (!result) {
      return result;
    }
    asprintf(&v24, "%d%02d%02dT%02d%02d%02d%sZ", (v25.tm_year + 1900));
    return v24;
  }
  int v7 = __str[0];
  if (!__str[1] && ((__str[0] & 0xDF) - 65) <= 0x19u)
  {
    unsigned __int8 v8 = __str[0] - 32;
    if (__str[0] <= 0x60u) {
      unsigned __int8 v8 = __str[0];
    }
    if (v8 == 90)
    {
      uint64_t v9 = 0;
      goto LABEL_77;
    }
    if (v8 - 65 <= 8)
    {
      uint64_t v9 = 3600 * v8 - 230400;
      goto LABEL_77;
    }
    if (v8 - 75 <= 2)
    {
      uint64_t v9 = 3600 * v8 - 234000;
      goto LABEL_77;
    }
    if (v8 - 78 <= 0xB)
    {
      uint64_t v9 = 3600 * (77 - v8);
      goto LABEL_77;
    }
    return 0;
  }
  int v18 = *v6;
  if (v18 == 45 || v18 == 43)
  {
    int v19 = *++v6;
    int v18 = v19;
  }
  if ((v18 - 48) > 9) {
    return 0;
  }
  int v20 = atoi(v6);
  size_t v21 = strchr(v6, 58);
  if (v21)
  {
    int v22 = atoi(v21 + 1);
    if (v7 == 45) {
      uint64_t v9 = -(3600 * v20 + 60 * v22);
    }
    else {
      uint64_t v9 = 3600 * v20 + 60 * v22;
    }
    if (v22)
    {
      snprintf(v27, 8uLL, "%c%02lld:%02lld");
      goto LABEL_77;
    }
  }
  else if (v7 == 45)
  {
    uint64_t v9 = -3600 * v20;
  }
  else
  {
    uint64_t v9 = 3600 * v20;
  }
  snprintf(v27, 8uLL, "%c%02lld");
LABEL_77:
  v26 += v9;
  memset(&v25, 0, sizeof(v25));
  uint64_t result = (char *)gmtime_r(&v26, &v25);
  if (result)
  {
    if ((__str[0] - 65) > 0x19)
    {
      if ((__str[0] - 97) > 0x19) {
        asprintf(&v24, "%d-%02d-%02d %02d:%02d:%02d%s%s", (v25.tm_year + 1900), (v25.tm_mon + 1));
      }
      else {
        asprintf(&v24, "%d-%02d-%02d %02d:%02d:%02d%s%c", (v25.tm_year + 1900), (v25.tm_mon + 1));
      }
    }
    else
    {
      asprintf(&v24, "%d-%02d-%02d %02d:%02d:%02d%s%c", (v25.tm_year + 1900), (v25.tm_mon + 1));
    }
    return v24;
  }
  return result;
}

void *asl_string_append_asl_msg(void *a1, _DWORD *a2)
{
  if (a2)
  {
    if (*a2 == 1) {
      asl_string_append((uint64_t)a1, "Q ");
    }
    uint64_t v9 = 0;
    int v10 = 0;
    unsigned __int16 v8 = 0;
    unsigned int v4 = asl_msg_fetch(a2, 0, &v10, (int **)&v9, &v8);
    if (v4 != -1)
    {
      unsigned int v5 = v4;
      int v6 = 0;
      do
      {
        if (v6) {
          asl_string_append_char_no_encoding(a1, 32);
        }
        asl_string_append_char_no_encoding(a1, 91);
        if (*a2 == 1)
        {
          asl_string_append_op(a1, v8);
          asl_string_append_char_no_encoding(a1, 32);
        }
        asl_string_append_asl_key((uint64_t)a1, v10);
        if (v9)
        {
          asl_string_append_char_no_encoding(a1, 32);
          asl_string_append((uint64_t)a1, v9);
        }
        asl_string_append_char_no_encoding(a1, 93);
        unsigned int v5 = asl_msg_fetch(a2, v5, &v10, (int **)&v9, &v8);
        --v6;
      }
      while (v5 != -1);
    }
  }
  return a1;
}

char *asl_msg_to_string(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = (char *)asl_string_new(2);
  if (result)
  {
    unsigned int v5 = result;
    appended = asl_string_append_asl_msg(result, a1);
    *a2 = asl_string_length((uint64_t)appended);
    return asl_string_release_return_bytes(v5);
  }
  return result;
}

__asl_object_s *asl_msg_from_string(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  int v26 = 0;
  uint64_t v25 = a1;
  next_word = (const char *)_asl_msg_get_next_word(&v25, &v26, 1);
  if (!next_word) {
    return 0;
  }
  int v2 = next_word;
  int v3 = strcmp(next_word, "Q");
  if (v3)
  {
    if (v26 == 4)
    {
      free(v2);
      unsigned int v4 = _asl_msg_get_next_word(&v25, &v26, 1);
      if (!v4) {
        return 0;
      }
      int v2 = v4;
    }
    int v5 = 0;
  }
  else
  {
    free(v2);
    int v5 = 1;
    int v2 = _asl_msg_get_next_word(&v25, &v26, 1);
  }
  int v6 = (char *)malloc_type_calloc(1uLL, 0x138uLL, 0x1020040D2F95E9BuLL);
  int v7 = (__asl_object_s *)v6;
  if (!v6) {
    return v7;
  }
  *(void *)&long long v8 = -1;
  *((void *)&v8 + 1) = -1;
  *(_OWORD *)(v6 + 76) = v8;
  *((_OWORD *)v6 + 3) = v8;
  *((_OWORD *)v6 + 4) = v8;
  *((_OWORD *)v6 + 2) = v8;
  *((void *)v6 + 2) = 312;
  *(_DWORD *)int v6 = v5;
  *((_DWORD *)v6 + 1) = 1;
  if (!v2) {
    return v7;
  }
  while (2)
  {
    if (v26 != 1) {
      goto LABEL_67;
    }
    free(v2);
    if (v3)
    {
      int v9 = 0;
      goto LABEL_43;
    }
    int v10 = _asl_msg_get_next_word(&v25, &v26, 1);
    if (!v10 || v26 != 3)
    {
      if (v10) {
        goto LABEL_66;
      }
      goto LABEL_67;
    }
    int v9 = 0;
    for (unsigned int i = 0; ; ++i)
    {
      int v12 = *((unsigned __int8 *)v10 + i);
      if (v12 == 67)
      {
        v9 |= 0x10u;
        goto LABEL_22;
      }
      if (!*((unsigned char *)v10 + i)) {
        goto LABEL_42;
      }
      if (v12 == 46) {
        break;
      }
LABEL_22:
      int v13 = v9 | 0x100;
      if (v12 != 82) {
        int v13 = v9;
      }
      if (v12 == 78) {
        v13 |= 0x80u;
      }
      if (v12 == 83) {
        v13 |= 0x60u;
      }
      if (v12 == 65) {
        v13 |= 0x20u;
      }
      if (v12 == 90) {
        v13 |= 0x40u;
      }
      if (v12 == 60) {
        v13 |= 4u;
      }
      if (v12 == 62) {
        v13 |= 2u;
      }
      int v14 = v13 | (v12 == 61);
      if (v12 == 33) {
        v14 |= 6u;
      }
      if (v12 == 84) {
        int v9 = v14 | 7;
      }
      else {
        int v9 = v14;
      }
    }
    int v9 = 0;
LABEL_42:
    free(v10);
LABEL_43:
    int v10 = _asl_msg_get_next_word(&v25, &v26, 1);
    size_t v15 = (char *)v10;
    int v16 = v26;
    if (v26 == 4) {
      int v16 = 3;
    }
    int v26 = v16;
    if (!v10 || v16 != 3)
    {
      if (v10) {
        goto LABEL_66;
      }
      goto LABEL_67;
    }
    unint64_t v17 = (char *)_asl_msg_get_next_word(&v25, &v26, 0);
    if (v26 == 4) {
      int v18 = 3;
    }
    else {
      int v18 = v26;
    }
    int v26 = v18;
    if (v17)
    {
      int v19 = v17;
      if (v18 == 3)
      {
        int v20 = (int *)v7;
        size_t v21 = v15;
        int v22 = v19;
LABEL_55:
        asl_msg_set_key_val_op(v20, v21, v22, v9);
        free(v15);
        free(v19);
        if (v18 == 2) {
          goto LABEL_59;
        }
        int v23 = _asl_msg_get_next_word(&v25, &v26, 1);
        if (v23)
        {
          if (v26 != 2) {
            goto LABEL_67;
          }
          free(v23);
LABEL_59:
          int v2 = _asl_msg_get_next_word(&v25, &v26, 1);
          if (!v2) {
            return v7;
          }
          continue;
        }
      }
      else
      {
        if (v18 == 2)
        {
          int v20 = (int *)v7;
          size_t v21 = v15;
          int v22 = 0;
          goto LABEL_55;
        }
        free(v15);
        int v10 = v19;
LABEL_66:
        free(v10);
LABEL_67:
        asl_release(v7);
        return 0;
      }
    }
    else
    {
      asl_msg_set_key_val_op((int *)v7, v15, 0, v9);
      free(v15);
    }
    return v7;
  }
}

void *_asl_msg_get_next_word(void *result, _DWORD *a2, int a3)
{
  *a2 = 0;
  if (!result) {
    return result;
  }
  int v3 = (unsigned char *)*result;
  if (!*result || !*v3) {
    return 0;
  }
  if (*v3 == 32) {
    *uint64_t result = ++v3;
  }
  if (a3)
  {
    while (1)
    {
      unsigned int v5 = *v3;
      if (v5 != 32 && v5 != 9) {
        break;
      }
      *uint64_t result = ++v3;
    }
  }
  else
  {
    unsigned int v5 = *v3;
  }
  if (!v5 || v5 == 10) {
    return 0;
  }
  if (v5 == 91)
  {
    *a2 = 1;
    *uint64_t result = v3 + 1;
    uint64_t result = malloc_type_malloc(2uLL, 0x84EE176DuLL);
    if (!result) {
      return result;
    }
    __int16 v8 = 91;
LABEL_48:
    *(_WORD *)uint64_t result = v8;
    return result;
  }
  if (a3 && v5 == 32)
  {
    int v9 = 0;
    *uint64_t result = v3;
    int v10 = v3;
    goto LABEL_45;
  }
  uint64_t v11 = 0;
  int v9 = 0;
  unsigned int v12 = 0;
  while (v5 == 92)
  {
    unsigned int v5 = v12 + 1;
    int v13 = v3[v12 + 1];
    uint64_t v14 = (v13 - 77);
    if (v14 > 0x29) {
      goto LABEL_37;
    }
    if (((1 << (v13 - 77)) & 0x2E20231C000) == 0)
    {
      if (v13 != 77)
      {
        if (v14 == 17)
        {
          unsigned int v5 = v12 + 2;
          goto LABEL_40;
        }
LABEL_37:
        if ((v13 & 0xFC) != 0x30) {
          return 0;
        }
      }
      if (!v3[v12 + 2]) {
        return 0;
      }
      unsigned int v5 = v12 + 3;
LABEL_40:
      if (!v3[v5]) {
        return 0;
      }
    }
LABEL_41:
    uint64_t v11 = v5 + 1;
    unsigned int v12 = v11;
    ++v9;
    LOBYTE(v5) = v3[v11];
    if (a3 && v3[v11] == 32) {
      goto LABEL_43;
    }
  }
  if ((_BYTE)v5 && v5 != 93)
  {
    unsigned int v5 = v12;
    goto LABEL_41;
  }
LABEL_43:
  int v10 = &v3[v11];
  *uint64_t result = &v3[v11];
  if (v12)
  {
    char v15 = 0;
LABEL_50:
    *a2 = 4;
    uint64_t result = malloc_type_malloc((v9 + 1), 0x506CB7DEuLL);
    if (result)
    {
      if ((v15 & 1) == 0)
      {
        LODWORD(v16) = 0;
        unsigned int v17 = 0;
        while (1)
        {
          int v18 = v3[v17];
          if (v18 == 92)
          {
            *a2 = 3;
            uint64_t v19 = v17 + 1;
            int v20 = v3[v19];
            LOBYTE(v18) = 7;
            switch(v3[v19])
            {
              case '[':
              case '\\':
              case ']':
                LOBYTE(v18) = v3[v19];
                break;
              case '^':
                LODWORD(v19) = v17 + 2;
                int v18 = v3[v17 + 2];
                if (v18 == 63) {
                  LOBYTE(v18) = 127;
                }
                else {
                  LOBYTE(v18) = v18 - 64;
                }
                break;
              case '_':
              case 'c':
              case 'd':
              case 'e':
              case 'g':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'l':
              case 'm':
              case 'o':
              case 'p':
              case 'q':
              case 'u':
                goto LABEL_69;
              case 'a':
                break;
              case 'b':
                LOBYTE(v18) = 8;
                break;
              case 'f':
                LOBYTE(v18) = 12;
                break;
              case 'n':
                LOBYTE(v18) = 10;
                break;
              case 'r':
                LOBYTE(v18) = 13;
                break;
              case 's':
                LOBYTE(v18) = 32;
                break;
              case 't':
                LOBYTE(v18) = 9;
                break;
              case 'v':
                LOBYTE(v18) = 11;
                break;
              default:
                if (v20 == 77)
                {
                  int v21 = v3[v17 + 2];
                  if (v21 == 45)
                  {
                    LODWORD(v19) = v17 + 3;
                    LOBYTE(v18) = v3[v17 + 3] ^ 0x80;
                  }
                  else
                  {
                    if (v21 != 94) {
                      goto LABEL_84;
                    }
                    LODWORD(v19) = v17 + 3;
                    int v18 = v3[v17 + 3];
                    if (v18 == 63) {
                      LOBYTE(v18) = -1;
                    }
                    else {
                      LOBYTE(v18) = v18 + 64;
                    }
                  }
                }
                else
                {
LABEL_69:
                  if ((v20 & 0xFC) != 0x30
                    || (char v22 = v3[v17 + 2], (v22 - 56) <= 0xF7u)
                    || (LODWORD(v19) = v17 + 3, char v23 = v3[v17 + 3], (v23 - 56) <= 0xF7u))
                  {
LABEL_84:
                    *a2 = 0;
                    free(result);
                    return 0;
                  }
                  LOBYTE(v18) = ((_BYTE)v20 << 6) + 8 * v22 + v23 + 80;
                }
                break;
            }
          }
          else
          {
            if ((v18 - 58) <= 0xF5u) {
              *a2 = 3;
            }
            LODWORD(v19) = v17;
          }
          *((unsigned char *)result + v16) = v18;
          uint64_t v16 = (v16 + 1);
          unsigned int v17 = v19 + 1;
          if ((int)v19 + 1 >= v12) {
            goto LABEL_53;
          }
        }
      }
      uint64_t v16 = 0;
LABEL_53:
      *((unsigned char *)result + v16) = 0;
    }
    return result;
  }
LABEL_45:
  if (*v10 != 93)
  {
    unsigned int v12 = 0;
    char v15 = 1;
    goto LABEL_50;
  }
  *a2 = 2;
  *uint64_t result = v10 + 1;
  uint64_t result = malloc_type_malloc(2uLL, 0x140FDDB3uLL);
  if (result)
  {
    __int16 v8 = 93;
    goto LABEL_48;
  }
  return result;
}

char *asl_format_message(char *result, char *__s1, char *a3, int a4, _DWORD *a5)
{
  uint64_t v88 = *MEMORY[0x263EF8C08];
  *a5 = 0;
  if (!result) {
    return result;
  }
  int v9 = result;
  uint64_t v83 = 0;
  BOOL v84 = 0;
  int v81 = 0;
  uint64_t v82 = 0;
  v80 = 0;
  v78 = 0;
  long long v79 = 0uLL;
  __s = 0;
  __s1a = 0;
  int v75 = 0;
  if (!__s1 || !strcmp(__s1, "raw"))
  {
LABEL_171:
    int v75 = 0;
    asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
    uint64_t v30 = (char *)asl_msg_to_string_raw(a4, v9, a3);
    int v26 = v30;
    goto LABEL_172;
  }
  if (!strcmp(__s1, "std")) {
    goto LABEL_31;
  }
  if (!strcmp(__s1, "bsd")) {
    goto LABEL_35;
  }
  if (!strcmp(__s1, "xml"))
  {
    asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
    uint64_t result = (char *)asl_string_new(a4);
    if (!result) {
      return result;
    }
    unsigned int v12 = result;
    asl_string_append_char_no_encoding(result, 9);
    asl_string_append_no_encoding(v12, "<dict>");
    asl_string_append_char_no_encoding(v12, 10);
    unsigned int v13 = asl_msg_fetch(v9, 0, &__s1a, (int **)&__s, 0);
    if (v13 == -1)
    {
LABEL_27:
      asl_string_append_char_no_encoding(v12, 9);
      asl_string_append_no_encoding(v12, "</dict>");
      asl_string_append_char_no_encoding(v12, 10);
      *a5 = asl_string_length((uint64_t)v12);
      char v22 = v12;
      return asl_string_release_return_bytes(v22);
    }
    unsigned int v14 = v13;
    while (1)
    {
      if (asl_is_utf8((unsigned __int8 *)__s1a) == 1)
      {
        asl_string_append_xml_tag(v12, "key", __s1a);
        if (!strcmp(__s1a, "Time"))
        {
          unsigned int v17 = _asl_time_string(a3, __s, v75);
          if (!v17)
          {
            char v15 = v12;
            uint64_t v16 = "0";
            goto LABEL_25;
          }
          int v18 = v17;
          uint64_t v19 = v12;
          int v20 = "string";
        }
        else
        {
          if (asl_is_utf8((unsigned __int8 *)__s) == 1)
          {
            char v15 = v12;
            uint64_t v16 = __s;
LABEL_25:
            asl_string_append_xml_tag(v15, "string", v16);
            goto LABEL_26;
          }
          size_t v21 = strlen(__s);
          int v18 = asl_b64_encode((uint64_t)__s, v21);
          uint64_t v19 = v12;
          int v20 = "data";
        }
        asl_string_append_xml_tag(v19, v20, v18);
        free(v18);
      }
LABEL_26:
      unsigned int v14 = asl_msg_fetch(v9, v14, &__s1a, (int **)&__s, 0);
      if (v14 == -1) {
        goto LABEL_27;
      }
    }
  }
  if (strcmp(__s1, "msg"))
  {
    if (!strncmp(__s1, "raw", 3uLL) && __s1[3] == 46)
    {
      if (!a3)
      {
        int v11 = __s1[4];
        int v10 = __s1 + 4;
        if (v11)
        {
          a3 = __str;
          snprintf(__str, 0x10uLL, "sec.%s", v10);
        }
        else
        {
          a3 = 0;
        }
      }
      goto LABEL_171;
    }
    if (!strncmp(__s1, "std", 3uLL) && __s1[3] == 46)
    {
      if (a3)
      {
LABEL_31:
        int v23 = 1;
        goto LABEL_36;
      }
      int v73 = __s1[4];
      v72 = __s1 + 4;
      int v23 = 1;
      if (v73) {
        goto LABEL_167;
      }
      goto LABEL_169;
    }
    if (!strncmp(__s1, "bsd", 3uLL) && __s1[3] == 46)
    {
      if (!a3)
      {
        int v23 = 0;
        int v74 = __s1[4];
        v72 = __s1 + 4;
        if (v74)
        {
LABEL_167:
          a3 = __str;
          snprintf(__str, 0x10uLL, "lcl.%s", v72);
          goto LABEL_36;
        }
LABEL_169:
        a3 = 0;
LABEL_36:
        int v75 = 0;
        asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
        v78 = 0;
        long long v79 = 0uLL;
        uint64_t v83 = 0;
        BOOL v84 = 0;
        int v81 = 0;
        uint64_t v82 = 0;
        v80 = 0;
        __int16 v24 = 0;
        if (!asl_msg_lookup(v9, "Time", (int **)&v78, 0)) {
          __int16 v24 = _asl_time_string(a3, v78, v75);
        }
        unsigned int v25 = 7;
        if (!asl_msg_lookup(v9, "Level", (int **)&v80, 0) && v80) {
          unsigned int v25 = atoi(v80);
        }
        if (!asl_msg_lookup(v9, "Host", (int **)&v84, 0) && !v84) {
          BOOL v84 = "unknown";
        }
        if (!asl_msg_lookup(v9, "Sender", (int **)&v82, 0) && !v82) {
          uint64_t v82 = "unknown";
        }
        asl_msg_lookup(v9, "PID", (int **)&v83, 0);
        asl_msg_lookup(v9, "Message", (int **)&v81, 0);
        asl_msg_lookup(v9, "RefProc", (int **)&v79 + 1, 0);
        asl_msg_lookup(v9, "RefPID", (int **)&v79, 0);
        uint64_t result = (char *)asl_string_new(a4);
        if (result)
        {
          int v26 = result;
          if (v24)
          {
            asl_string_append((uint64_t)result, v24);
            free(v24);
          }
          else
          {
            asl_string_append_char_no_encoding(result, 48);
          }
          asl_string_append_char_no_encoding(v26, 32);
          asl_string_append((uint64_t)v26, v84);
          asl_string_append_char_no_encoding(v26, 32);
          asl_string_append((uint64_t)v26, v82);
          if (v83 && strcmp(v83, "-1"))
          {
            asl_string_append_char_no_encoding(v26, 91);
            asl_string_append((uint64_t)v26, v83);
            asl_string_append_char_no_encoding(v26, 93);
          }
          int v27 = DWORD2(v79) | v79;
          if (v79 != 0)
          {
            asl_string_append_no_encoding(v26, " (");
            if (*((void *)&v79 + 1)) {
              asl_string_append((uint64_t)v26, *((char **)&v79 + 1));
            }
            int v27 = v79;
            if ((void)v79)
            {
              asl_string_append_char_no_encoding(v26, 91);
              asl_string_append((uint64_t)v26, (char *)v79);
              asl_string_append_char_no_encoding(v26, 93);
              int v27 = (void)v79 != 0;
            }
          }
          if (*((void *)&v79 + 1) || v27) {
            asl_string_append_char_no_encoding(v26, 41);
          }
          if (v23)
          {
            asl_string_append_no_encoding(v26, " <");
            if (v25 > 7) {
              uint64_t v28 = "unknown";
            }
            else {
              uint64_t v28 = off_264104978[v25];
            }
            asl_string_append((uint64_t)v26, v28);
            asl_string_append_char_no_encoding(v26, 62);
          }
          asl_string_append_no_encoding(v26, ": ");
          unsigned int v29 = v81;
          if (!v81) {
            goto LABEL_69;
          }
          goto LABEL_68;
        }
        return result;
      }
LABEL_35:
      int v23 = 0;
      goto LABEL_36;
    }
    asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
    uint64_t result = (char *)asl_string_new(a4);
    if (!result) {
      return result;
    }
    uint64_t v32 = result;
    size_t v33 = strlen(__s1);
    if (v33 >= 0x201)
    {
      uint64_t result = (char *)malloc_type_malloc(v33, 0xEEF22BB4uLL);
      timeval v34 = result;
      if (!result) {
        return result;
      }
    }
    else
    {
      timeval v34 = __str;
    }
    LODWORD(v35) = 0;
LABEL_78:
    unint64_t v36 = &__s1[(int)v35];
    unsigned int v37 = *v36;
    if (v37 != 36)
    {
      if (v37 == 92)
      {
        uint64_t v47 = (int)v35;
        uint64_t v35 = (int)v35 + 1;
        unsigned int v48 = __s1[v35];
        if (v48 > 0x60)
        {
          switch(__s1[v35])
          {
            case 'a':
              uint64_t v39 = v32;
              char v38 = 7;
              goto LABEL_82;
            case 'b':
              uint64_t v39 = v32;
              char v38 = 8;
              goto LABEL_82;
            case 'e':
              uint64_t v39 = v32;
              char v38 = 27;
              goto LABEL_82;
            case 'f':
              uint64_t v39 = v32;
              char v38 = 12;
              goto LABEL_82;
            case 'n':
              uint64_t v39 = v32;
              char v38 = 10;
              goto LABEL_82;
            case 'r':
              uint64_t v39 = v32;
              char v38 = 13;
              goto LABEL_82;
            case 's':
              uint64_t v39 = v32;
              char v38 = 32;
              goto LABEL_82;
            case 't':
              uint64_t v39 = v32;
              char v38 = 9;
              goto LABEL_82;
            case 'v':
              uint64_t v39 = v32;
              char v38 = 11;
              goto LABEL_82;
            default:
              goto LABEL_143;
          }
        }
        switch(v48)
        {
          case '$':
            uint64_t v39 = v32;
            char v38 = 36;
            break;
          case '\'':
            uint64_t v39 = v32;
            char v38 = 39;
            break;
          case '\\':
            uint64_t v39 = v32;
            char v38 = 92;
            break;
          default:
LABEL_143:
            unsigned int v37 = (char)v48 - 48;
            if (v37 > 9) {
              goto LABEL_162;
            }
            int v65 = v47 + 2;
            unsigned int v66 = __s1[v47 + 2] - 48;
            if (v66 <= 9)
            {
              uint64_t v67 = v47 + 3;
              int v68 = __s1[v67];
              LOBYTE(v37) = v66 + 8 * v37;
              LODWORD(v35) = (v68 - 48) <= 9 ? v67 : v65;
              if ((v68 - 48) <= 9) {
                LOBYTE(v37) = v68 - 48 + 8 * v37;
              }
            }
LABEL_81:
            char v38 = v37;
            uint64_t v39 = v32;
            break;
        }
LABEL_82:
        asl_string_append_char_no_encoding(v39, v38);
        goto LABEL_162;
      }
      if (*v36) {
        goto LABEL_81;
      }
      if (v34 != __str) {
        free(v34);
      }
      asl_string_append_char_no_encoding(v32, 10);
      *a5 = asl_string_length((uint64_t)v32);
      char v22 = v32;
      return asl_string_release_return_bytes(v22);
    }
    int v40 = 0;
    int v41 = v35 + 1;
    uint64_t v42 = v41;
    long long v43 = &__s1[v41];
    while (1)
    {
      int v45 = *v43++;
      int v44 = v45;
      if (v45 <= 39) {
        break;
      }
      if (v44 != 41)
      {
        if (v44 == 40)
        {
          ++v40;
          goto LABEL_98;
        }
LABEL_94:
        if (v44 == 9 && v40 == 0) {
          goto LABEL_106;
        }
        goto LABEL_98;
      }
      v40 -= v40 > 0;
      if (!v40)
      {
        ++v41;
LABEL_106:
        size_t v49 = v41 - v42;
        memcpy(v34, v36 + 1, v49);
        int v50 = 0;
        int v51 = 0;
        unsigned int v52 = 0;
        BOOL v53 = 0;
        v34[v49] = 0;
        while (2)
        {
          time_t v54 = &v34[v50];
          int v55 = *v54;
          if (v55 == 40) {
            goto LABEL_120;
          }
          if (v55 == 41)
          {
            char *v54 = 0;
            int v51 = 1;
LABEL_120:
            ++v50;
            continue;
          }
          break;
        }
        if (*v54)
        {
          BOOL v56 = v51 == 1;
          BOOL v57 = v53 == 0;
          BOOL v58 = !v56 || !v57;
          if (v56 && v57) {
            int v59 = 1;
          }
          else {
            int v59 = v51;
          }
          if (v58) {
            uint64_t v60 = (char *)v53;
          }
          else {
            uint64_t v60 = &v34[v50];
          }
          if (v52)
          {
            int v51 = v59;
            BOOL v53 = v60;
          }
          else
          {
            unsigned int v52 = &v34[v50];
          }
          goto LABEL_120;
        }
        if (v52)
        {
          uint64_t v85 = 0;
          uint64_t v86 = 0;
          asl_msg_lookup(v9, "TimeNanoSec", (int **)&v85, 0);
          if (!asl_msg_lookup(v9, v52, (int **)&v86, 0))
          {
            uint64_t v61 = v86;
            if (v86)
            {
              if (!strcmp(v52, "Time"))
              {
                if (v53) {
                  int v62 = v53;
                }
                else {
                  int v62 = a3;
                }
                uint64_t v69 = _asl_time_string(v62, v61, v85);
                if (v69)
                {
                  asl_string_append_no_encoding(v32, v69);
                  free(v69);
                }
                else
                {
                  asl_string_append_char_no_encoding(v32, 48);
                }
              }
              else
              {
                if (strcmp(v52, "Level"))
                {
                  asl_string_append((uint64_t)v32, v61);
                  goto LABEL_161;
                }
                if (v53)
                {
                  if (!strcmp(v53, "str"))
                  {
                    unsigned int v70 = atoi(v61);
                    uint64_t v64 = "unknown";
                    if (v70 <= 7)
                    {
                      int v71 = off_264104978;
                      goto LABEL_158;
                    }
                  }
                  else
                  {
                    if (strcmp(v53, "char")) {
                      goto LABEL_142;
                    }
                    unsigned int v70 = atoi(v61);
                    uint64_t v64 = "?";
                    if (v70 <= 7)
                    {
                      int v71 = off_2641049B8;
LABEL_158:
                      uint64_t v64 = v71[v70];
                    }
                  }
                  uint64_t v86 = v64;
                  uint64_t v63 = v32;
                }
                else
                {
LABEL_142:
                  uint64_t v63 = v32;
                  uint64_t v64 = v61;
                }
                asl_string_append_no_encoding(v63, v64);
              }
            }
          }
        }
LABEL_161:
        LODWORD(v35) = v41 - 1;
LABEL_162:
        LODWORD(v35) = v35 + 1;
        goto LABEL_78;
      }
LABEL_98:
      ++v41;
    }
    if (v44 == 32)
    {
      if (!v40) {
        goto LABEL_106;
      }
      goto LABEL_98;
    }
    if (!v44) {
      goto LABEL_106;
    }
    goto LABEL_94;
  }
  asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
  int v81 = 0;
  int v31 = asl_msg_lookup(v9, "Message", (int **)&v81, 0);
  uint64_t result = 0;
  if (!v31)
  {
    uint64_t result = (char *)asl_string_new(a4);
    if (result)
    {
      int v26 = result;
      unsigned int v29 = v81;
LABEL_68:
      asl_string_append((uint64_t)v26, v29);
LABEL_69:
      uint64_t v30 = v26;
LABEL_172:
      asl_string_append_char_no_encoding(v30, 10);
      *a5 = asl_string_length((uint64_t)v26);
      char v22 = v26;
      return asl_string_release_return_bytes(v22);
    }
  }
  return result;
}

_DWORD *_asl_log_args_to_xpc(uint64_t a1, _DWORD *a2, void *a3)
{
  unsigned int v5 = (_DWORD *)asl_client_kvdict(a1);
  _asl_msg_to_xpc(v5, a3);

  return _asl_msg_to_xpc(a2, a3);
}

_DWORD *_asl_msg_to_xpc(_DWORD *result, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8C08];
  if (result)
  {
    if (a2)
    {
      int v3 = result;
      unsigned int v14 = 0;
      __s = 0;
      unsigned int v13 = 0;
      asl_msg_lookup(result, "TimeNanoSec", (int **)&v13, 0);
      uint64_t result = (_DWORD *)asl_msg_fetch(v3, 0, &__s, (int **)&v14, 0);
      if (result != -1)
      {
        unsigned int v4 = result;
        do
        {
          unsigned int v5 = __s;
          if (__s)
          {
            unsigned int v6 = strlen(__s);
            int v7 = _asl_msg_std_key(__s, v6);
            __int16 v8 = v14;
            if (!v14)
            {
              xpc_object_t v9 = xpc_null_create();
              goto LABEL_21;
            }
            if (v7 != 32770)
            {
              if (v7 == 32769)
              {
                int64_t v10 = 1000000000 * asl_core_parse_time(v14, 0);
                if (v13) {
                  v10 += atoll(v13);
                }
                xpc_object_t v9 = xpc_date_create(v10);
              }
              else if (v7)
              {
                if ((v7 & 0xFFFFFFF7) == 0x8006
                  || (unsigned __int16)(v7 + 32761) <= 1u
                  || v7 == 32777
                  || (unsigned __int16)(v7 + 32757) <= 1u)
                {
                  int64_t v11 = atoll(v14);
                  xpc_object_t v9 = xpc_int64_create(v11);
                }
                else
                {
                  if (v7 == 32784) {
                    goto LABEL_22;
                  }
LABEL_11:
                  xpc_object_t v9 = xpc_string_create(v8);
                }
              }
              else
              {
                if (strcmp(v5, "SenderMachUUID")) {
                  goto LABEL_11;
                }
                memset(uu, 0, sizeof(uu));
                if (uuid_parse(v8, uu)) {
                  goto LABEL_22;
                }
                xpc_object_t v9 = xpc_uuid_create(uu);
              }
LABEL_21:
              unsigned int v12 = v9;
              xpc_dictionary_set_value(a2, __s, v9);
              xpc_release(v12);
            }
          }
LABEL_22:
          uint64_t result = (_DWORD *)asl_msg_fetch(v3, v4, &__s, (int **)&v14, 0);
          unsigned int v4 = result;
        }
        while (result != -1);
      }
    }
  }
  return result;
}

uint64_t _jump_set_key_val_op(int *a1, char *a2, const char *a3, int a4)
{
  if (asl_msg_set_key_val_op(a1, a2, a3, a4)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t _jump_get_key_val_op_at_index(uint64_t a1, unsigned int a2, char **a3, int **a4, _WORD *a5)
{
  uint64_t v8 = 0xFFFFFFFFLL;
  unsigned int v12 = -1;
  int64_t v11 = 0;
  if (!_asl_msg_resolve_index(a1, a2, &v11, &v12))
  {
    if (a3) {
      *a3 = _asl_msg_slot_key(v11, v12);
    }
    if (a4) {
      *a4 = _asl_msg_slot_val((int *)v11, v12);
    }
    if (a5)
    {
      if (v11)
      {
        __int16 v9 = 0;
        if (v12 <= 9 && *(_DWORD *)v11 == 1) {
          __int16 v9 = *(_WORD *)&v11[2 * v12 + 72];
        }
      }
      else
      {
        __int16 v9 = 0;
      }
      uint64_t v8 = 0;
      *a5 = v9;
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

uint64_t _jump_count_1(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    LODWORD(result) = 0;
    do
    {
      uint64_t result = (*(_DWORD *)(v1 + 8) + result);
      uint64_t v1 = *(void *)(v1 + 24);
    }
    while (v1);
  }
  return result;
}

int *_jump_append_2(int *a1, asl_object_t obj)
{
  uint64_t result = (int *)asl_get_type(obj);
  if (result <= 1)
  {
    return asl_msg_merge(a1, obj);
  }
  return result;
}

uint64_t _jump_prepend_0(uint64_t result, asl_object_t obj)
{
  if (result)
  {
    int v3 = (int *)result;
    uint64_t result = asl_get_type(obj);
    if (result <= 1)
    {
      if (obj)
      {
        unsigned __int16 v9 = 0;
        int v7 = 0;
        uint64_t v8 = 0;
        uint32_t type = asl_get_type(obj);
        uint64_t result = asl_msg_fetch(obj, 0, &v8, (int **)&v7, &v9);
        if (result != -1)
        {
          unsigned int v5 = result;
          do
          {
            if (type)
            {
              int v6 = v9;
            }
            else
            {
              int v6 = 0;
              unsigned __int16 v9 = 0;
            }
            asl_msg_set_key_val_op(v3, v8, v7, v6);
            uint64_t result = asl_msg_fetch(obj, v5, &v8, (int **)&v7, &v9);
            unsigned int v5 = result;
          }
          while (result != -1);
        }
      }
    }
  }
  return result;
}

uint64_t _jump_search_2(__asl_object_s *a1, _DWORD *a2)
{
  if (!a1 || a2 && (*a2 > 1u || !asl_msg_cmp(a1, a2))) {
    return 0;
  }
  asl_msg_list_new();
  uint64_t v4 = v3;
  asl_msg_list_append(v3, a1);
  return v4;
}

uint64_t _jump_match_2(__asl_object_s *a1, uint64_t a2)
{
  if (!a1 || a2 && !asl_msg_cmp_list((uint64_t)a1, a2)) {
    return 0;
  }
  asl_msg_list_new();
  uint64_t v4 = v3;
  asl_msg_list_append(v3, a1);
  return v4;
}

uint64_t _asl_msg_basic_test(__int16 a1, char *a2, char *__s1, size_t __n)
{
  char v4 = a1;
  if (!a2 || !__s1) {
    return v4 & 6;
  }
  int v6 = a1 & 7;
  if ((a1 & 0x100) != 0)
  {
    uint64_t result = 0;
    if (v6 == 2 || v6 == 4) {
      return result;
    }
    memset(&v23, 0, sizeof(v23));
    if ((v4 & 0x10) != 0) {
      int v9 = 7;
    }
    else {
      int v9 = 5;
    }
    if (!regcomp(&v23, a2, v9))
    {
      int v19 = regexec(&v23, __s1, 0, 0, 0);
      MEMORY[0x210558450](&v23);
      if (v6 == 6) {
        return v19 != 0;
      }
      else {
        return v19 == 0;
      }
    }
    return v4 & 6;
  }
  if ((a1 & 0x80) != 0)
  {
    int64_t v10 = a2 + 1;
    if (((*a2 - 43) & 0xFD) != 0) {
      int64_t v10 = a2;
    }
    int v11 = *v10;
    if (v11)
    {
      uint64_t v12 = (((*a2 - 43) & 0xFD) == 0) + 1;
      while (((char)v11 - 48) < 0xA)
      {
        int v11 = a2[v12++];
        if (!v11)
        {
          unsigned int v13 = __s1 + 1;
          if (((*__s1 - 43) & 0xFD) != 0) {
            unsigned int v13 = __s1;
          }
          int v14 = *v13;
          if (v14)
          {
            uint64_t v15 = (((*__s1 - 43) & 0xFD) == 0) + 1;
            while (((char)v14 - 48) < 0xA)
            {
              int v14 = __s1[v15++];
              if (!v14)
              {
                uint64_t v16 = atoll(a2);
                uint64_t v17 = atoll(__s1);
                switch(v6)
                {
                  case 1:
                    return v17 == v16;
                  case 2:
                    BOOL v20 = v17 <= v16;
LABEL_44:
                    uint64_t result = !v20;
                    break;
                  case 3:
                    uint64_t result = v17 >= v16;
                    break;
                  case 4:
                    BOOL v21 = v17 < v16;
LABEL_50:
                    uint64_t result = v21;
                    break;
                  case 5:
                    uint64_t result = v17 <= v16;
                    break;
                  case 6:
                    BOOL v22 = v17 == v16;
LABEL_54:
                    uint64_t result = !v22;
                    break;
                  default:
                    uint64_t result = 0;
                    break;
                }
                return result;
              }
            }
          }
          break;
        }
      }
    }
    return v6 == 6;
  }
  else
  {
    if ((a1 & 0x10) != 0)
    {
      if (__n) {
        int v7 = strncasecmp(__s1, a2, __n);
      }
      else {
        int v7 = strcasecmp(__s1, a2);
      }
    }
    else if (__n)
    {
      int v7 = strncmp(__s1, a2, __n);
    }
    else
    {
      int v7 = strcmp(__s1, a2);
    }
    switch(v6)
    {
      case 1:
        return v7 == 0;
      case 2:
        BOOL v20 = v7 <= 0;
        goto LABEL_44;
      case 3:
        uint64_t result = v7 >= 0;
        break;
      case 4:
        uint64_t result = v7 >> 31;
        break;
      case 5:
        BOOL v21 = v7 < 1;
        goto LABEL_50;
      case 6:
        BOOL v22 = v7 == 0;
        goto LABEL_54;
      default:
        return v6 == 6;
    }
  }
  return result;
}

uint64_t asl_store_open_write(const char *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8C08];
  if (!a2) {
    return 1;
  }
  started = _asl_start_today();
  if (!started) {
    return 9999;
  }
  unsigned int v5 = started;
  if (!a1) {
    a1 = (const char *)asl_filesystem_path(0);
  }
  int v18 = 0;
  unint64_t __ptr = 0;
  memset(&v19, 0, sizeof(v19));
  if (!stat(a1, &v19))
  {
    if ((v19.st_mode & 0xF000) == 0x4000) {
      goto LABEL_11;
    }
    return 2;
  }
  if (*__error() != 2) {
    return 2;
  }
  if (mkdir(a1, 0x1EDu)) {
    return 8;
  }
LABEL_11:
  snprintf(__str, 0x400uLL, "%s/%s", a1, "StoreData");
  memset(&v19, 0, sizeof(v19));
  if (stat(__str, &v19))
  {
    if (*__error() == 2)
    {
      int v7 = fopen(__str, "w+");
      if (v7)
      {
        uint64_t v8 = v7;
        unint64_t __ptr = 0;
        if (fwrite(&__ptr, 8uLL, 1uLL, v7) != 1 || (int v18 = 0, fwrite(&v18, 4uLL, 1uLL, v8) != 1))
        {
          fclose(v8);
          return 8;
        }
        fflush(v8);
        goto LABEL_21;
      }
    }
    return 9999;
  }
  int v9 = fopen(__str, "r+");
  if (!v9) {
    return 9999;
  }
  uint64_t v8 = v9;
  if (fread(&__ptr, 8uLL, 1uLL, v9) != 1)
  {
    fclose(v8);
    return 7;
  }
  unint64_t __ptr = asl_core_ntohq(__ptr);
LABEL_21:
  int64_t v10 = malloc_type_calloc(1uLL, 0xA58uLL, 0x10B004012294A83uLL);
  if (!v10)
  {
    fclose(v8);
    return 9;
  }
  int v11 = v10;
  void *v10 = 0x100000004;
  if (a1) {
    uint64_t v12 = a1;
  }
  else {
    uint64_t v12 = (const char *)asl_filesystem_path(0);
  }
  unsigned int v13 = strdup(v12);
  v11[2] = v13;
  if (!v13)
  {
    fclose(v8);
    free(v11);
    return 9;
  }
  uint64_t v14 = 0;
  v11[326] = v5;
  v11[327] = (char *)v5 + 86400;
  uint64_t v15 = __ptr + 1;
  v11[3] = v8;
  v11[4] = v15;
  do
  {
    uint64_t v16 = &v11[v14];
    *(_OWORD *)(v16 + 5) = 0uLL;
    v16[9] = 0;
    *(_OWORD *)(v16 + 7) = 0uLL;
    v16[6] = -1;
    v14 += 5;
  }
  while (v14 != 320);
  uint64_t result = 0;
  *a2 = v11;
  return result;
}

uint64_t asl_store_set_flags(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t result = *(unsigned int *)(result + 2640);
    *(_DWORD *)(v2 + 2640) = a2;
  }
  return result;
}

uint64_t asl_store_statistics(uint64_t a1, char **a2)
{
  if (!a1) {
    return 2;
  }
  if (!a2) {
    return 1;
  }
  uint64_t v3 = asl_msg_new(0);
  if (!v3) {
    return 9;
  }
  char v4 = v3;
  uint64_t result = 0;
  *a2 = v4;
  return result;
}

uint64_t asl_store_open_read(char *a1, void *a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t v3 = a1;
  if (!a1) {
    uint64_t v3 = (const char *)asl_filesystem_path(0);
  }
  memset(&v9, 0, sizeof(v9));
  if (stat(v3, &v9) || (v9.st_mode & 0xF000) != 0x4000) {
    return 2;
  }
  char v4 = malloc_type_calloc(1uLL, 0xA58uLL, 0x10B004012294A83uLL);
  if (v4)
  {
    unsigned int v5 = v4;
    *char v4 = 0x100000004;
    if (v3) {
      int v6 = v3;
    }
    else {
      int v6 = (const char *)asl_filesystem_path(0);
    }
    uint64_t v8 = strdup(v6);
    v5[2] = v8;
    if (v8)
    {
      uint64_t result = 0;
      *a2 = v5;
      return result;
    }
    free(v5);
  }
  return 9;
}

uint64_t asl_store_max_file_size(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 2;
  }
  uint64_t result = 0;
  *(void *)(a1 + 2632) = a2;
  return result;
}

double asl_store_file_closeall(uint64_t a1)
{
  if (a1)
  {
    for (uint64_t i = 0; i != 2560; i += 40)
    {
      uint64_t v3 = (void *)(a1 + i);
      char v4 = *(__asl_object_s **)(a1 + i + 72);
      if (v4) {
        asl_file_close(v4);
      }
      v3[9] = 0;
      unsigned int v5 = (void *)v3[8];
      if (v5) {
        free(v5);
      }
      v3[8] = 0;
      uint64_t v6 = a1 + i;
      double result = NAN;
      *(void *)(v6 + 48) = -1;
      *(void *)(v6 + 56) = 0;
      v3[5] = 0;
    }
  }
  return result;
}

asl_object_t asl_store_retain(asl_object_t obj)
{
  if (obj) {
    asl_retain(obj);
  }
  return obj;
}

void asl_store_release(asl_object_t obj)
{
  if (obj) {
    asl_release(obj);
  }
}

uint64_t asl_store_close(__asl_object_s *a1)
{
  if (a1) {
    asl_release(a1);
  }
  return 0;
}

uint64_t asl_store_sweep_file_cache(uint64_t a1)
{
  if (!a1) {
    return 2;
  }
  time_t v2 = time(0);
  asl_store_file_cache_lru(a1, v2, 0x40u);
  return 0;
}

uint64_t asl_store_file_cache_lru(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4 = 0;
  LODWORD(v5) = 0;
  uint64_t v6 = a2 - 300;
  uint64_t v7 = a3;
  uint64_t v8 = (uint64_t *)(a1 + 40 * a3 + 40);
  stat v9 = (__asl_object_s **)(a1 + 72);
  do
  {
    if (v7 == v4)
    {
      uint64_t v10 = *v8;
    }
    else
    {
      uint64_t v10 = (uint64_t)*(v9 - 4);
      if (v10 < v6)
      {
        asl_file_close(*v9);
        *stat v9 = 0;
        int v11 = *(v9 - 1);
        if (v11) {
          free(v11);
        }
        uint64_t v10 = 0;
        *(v9 - 3) = (__asl_object_s *)-1;
        *(v9 - 2) = 0;
        *(v9 - 1) = 0;
        *(v9 - 4) = 0;
      }
    }
    if (v10 >= *(void *)(a1 + 40 * v5 + 40)) {
      uint64_t v5 = v5;
    }
    else {
      uint64_t v5 = v4;
    }
    ++v4;
    v9 += 5;
  }
  while (v4 != 64);
  return v5;
}

char *asl_store_file_path(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  while (*(void *)(a1 + v2 + 72) != a2)
  {
    v2 += 40;
    if (v2 == 2560) {
      return 0;
    }
  }
  uint64_t v3 = *(const char **)(a1 + v2 + 64);
  if (v3) {
    return strdup(v3);
  }
  else {
    return 0;
  }
}

double asl_store_file_close(uint64_t a1, __asl_object_s *a2)
{
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = (void *)(a1 + v3);
      if (*(__asl_object_s **)(a1 + v3 + 72) == a2) {
        break;
      }
      v3 += 40;
      if (v3 == 2560) {
        return result;
      }
    }
    asl_file_close(a2);
    v4[9] = 0;
    uint64_t v5 = (void *)v4[8];
    if (v5) {
      free(v5);
    }
    v4[8] = 0;
    uint64_t v6 = a1 + v3;
    double result = NAN;
    *(void *)(v6 + 48) = -1;
    *(void *)(v6 + 56) = 0;
    v4[5] = 0;
  }
  return result;
}

uint64_t asl_store_save(uint64_t a1, _DWORD *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8C08];
  if (!a1) {
    return 2;
  }
  if (!a2) {
    return 1;
  }
  memset(&v42, 0, sizeof(v42));
  uint64_t v4 = time(0);
  BOOL v5 = *(void *)(a1 + 2624) + 300 <= v4;
  __s = 0;
  if (asl_msg_lookup(a2, "Time", (int **)&__s, 0) || !__s)
  {
    time_t v41 = v4;
    time_t v6 = v4;
  }
  else
  {
    time_t v6 = asl_core_parse_time(__s, 0);
    time_t v41 = v6;
  }
  time_t v8 = *(void *)(a1 + 2616);
  if (v6 >= v8 && v4 >= v8)
  {
    asl_store_file_closeall(a1);
    started = _asl_start_today();
    *(void *)(a1 + 2608) = started;
    if (!started)
    {
      started = *(tm **)(a1 + 2616);
      *(void *)(a1 + 2608) = started;
    }
    BOOL v5 = 0;
    *(void *)(a1 + 2616) = (char *)started + 86400;
  }
  if (*(unsigned char *)(a1 + 2640))
  {
    int v10 = -1;
    int v11 = -1;
  }
  else
  {
    __s = 0;
    int v10 = -1;
    if (!asl_msg_lookup(a2, "ReadUID", (int **)&__s, 0) && __s) {
      int v10 = atoi(__s);
    }
    __s = 0;
    int v11 = -1;
    if (!asl_msg_lookup(a2, "ReadGID", (int **)&__s, 0) && __s) {
      int v11 = atoi(__s);
    }
  }
  time_t v40 = 0;
  if ((*(unsigned char *)(a1 + 2640) & 2) != 0)
  {
    int v13 = 0;
    time_t v12 = 0;
  }
  else
  {
    __s = 0;
    time_t v12 = 0;
    int v13 = 0;
    if (!asl_msg_lookup(a2, "ASLExpireTime", (int **)&__s, 0) && __s)
    {
      int v13 = 1;
      time_t v40 = 1;
      time_t v41 = asl_core_parse_time(__s, 0);
      time_t v12 = 1;
    }
  }
  if (fseeko(*(FILE **)(a1 + 24), 0, 0)) {
    return 8;
  }
  unint64_t __ptr = asl_core_htonq(*(void *)(a1 + 32));
  uint64_t v7 = 8;
  if (fwrite(&__ptr, 8uLL, 1uLL, *(FILE **)(a1 + 24)) != 1) {
    return v7;
  }
  fflush(*(FILE **)(a1 + 24));
  unint64_t __ptr = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = __ptr + 1;
  *(void *)(a1 + 2624) = v4;
  if (!localtime_r(&v41, &v42)) {
    return 9999;
  }
  if (v13)
  {
    *(void *)&v42.tm_sec = 0;
    *(void *)&v42.tm_hour = 0;
    ++v42.tm_mon;
    time_t v40 = mktime(&v42);
    if (localtime_r(&v40, &v42))
    {
      snprintf(__str, 0x80uLL, "BB.%d.%02d.%02d", v42.tm_year + 1900, v42.tm_mon + 1, v42.tm_mday);
      time_t v12 = v40;
      goto LABEL_36;
    }
    return 9999;
  }
  snprintf(__str, 0x80uLL, "%d.%02d.%02d", v42.tm_year + 1900, v42.tm_mon + 1, v42.tm_mday);
LABEL_36:
  uint64_t v14 = 0;
  for (uint64_t i = 0; i != 64; ++i)
  {
    if (*(_DWORD *)(a1 + v14 + 48) == v10 && *(_DWORD *)(a1 + v14 + 52) == v11 && *(void *)(a1 + v14 + 56) == v12)
    {
      uint64_t v16 = *(__asl_object_s **)(a1 + v14 + 72);
      if (v16)
      {
        *(void *)(a1 + v14 + 40) = v4;
        if (v5) {
          asl_store_file_cache_lru(a1, v4, i);
        }
        goto LABEL_53;
      }
    }
    v14 += 40;
  }
  *(_DWORD *)int v45 = 0;
  unsigned int v43 = 0;
  unsigned __int16 v44 = 420;
  ug_path = asl_store_make_ug_path(*(void *)(a1 + 16), (uint64_t)__str, (uint64_t)"asl", v10, v11, v45, &v43, &v44);
  if (!ug_path) {
    return 9;
  }
  int v18 = ug_path;
  __to.__pn_.__r_.__value_.__r.__words[0] = 0;
  uint64_t v19 = asl_file_open_write(ug_path, v44, *(unsigned int *)v45, v43, (uint64_t *)&__to);
  if (v19)
  {
    uint64_t v7 = v19;
    free(v18);
    return v7;
  }
  int v20 = asl_store_file_cache_lru(a1, v4, 0x40u);
  uint64_t v21 = a1 + 40 * v20;
  __int16 v24 = *(__asl_object_s **)(v21 + 72);
  regex_t v23 = (void *)(v21 + 72);
  BOOL v22 = v24;
  if (v24) {
    asl_file_close(v22);
  }
  uint64_t v25 = a1 + 40 * v20;
  uint64_t v28 = *(void **)(v25 + 64);
  int v27 = (char **)(v25 + 64);
  int v26 = v28;
  if (v28) {
    free(v26);
  }
  *regex_t v23 = __to.__pn_.__r_.__value_.__r.__words[0];
  _DWORD *v27 = v18;
  uint64_t v29 = a1 + 40 * v20;
  *(_DWORD *)(v29 + 48) = v10;
  *(_DWORD *)(v29 + 52) = v11;
  *(void *)(v29 + 56) = v12;
  *(v23 - 4) = time(0);
  uint64_t v16 = (__asl_object_s *)__to.__pn_.__r_.__value_.__r.__words[0];
LABEL_53:
  uint64_t v7 = asl_file_save((uint64_t)v16, a2, (uint64_t *)&__ptr);
  if (!v7)
  {
    unint64_t v30 = asl_file_size((uint64_t)v16);
    asl_file_ctime((uint64_t)v16);
    unint64_t v31 = *(void *)(a1 + 2632);
    if (v31)
    {
      if (v30 > v31)
      {
        uint64_t v32 = (std::__fs::filesystem::path *)asl_store_file_path(a1, (uint64_t)v16);
        asl_store_file_close(a1, v16);
        if (v32)
        {
          unsigned int v33 = strlen((const char *)v32);
          if ((v33 & 0xFFFFFFFC) != 0 && (unsigned int v34 = v33, !strcmp((const char *)v32 + v33 - 4, ".asl")))
          {
            snprintf(v45, 0x400uLL, "%s", (const char *)v32);
            v45[v34 - 4] = 0;
            snprintf((char *)&__to, 0x400uLL, "%s.%llu.asl");
          }
          else
          {
            snprintf((char *)&__to, 0x400uLL, "%s.%llu");
          }
          rename(v32, &__to, v35);
          if (v36) {
            uint64_t v7 = 9999;
          }
          else {
            uint64_t v7 = 0;
          }
          free(v32);
        }
        else
        {
          uint64_t v7 = 0;
        }
        asl_trigger_aslmanager();
      }
    }
  }
  return v7;
}

uint64_t asl_store_open_aux(uint64_t a1, _DWORD *a2, _DWORD *a3, char **a4)
{
  uint64_t v25 = *MEMORY[0x263EF8C08];
  if (!a1) {
    return 2;
  }
  uint64_t result = 1;
  if (a2 && a3 && a4)
  {
    memset(&v21, 0, sizeof(v21));
    __s = 0;
    time_t v20 = time(0);
    if (*(unsigned char *)(a1 + 2640))
    {
      int v9 = -1;
      int v10 = -1;
    }
    else
    {
      __s = 0;
      int v9 = -1;
      if (!asl_msg_lookup(a2, "ReadUID", (int **)&__s, 0) && __s) {
        int v9 = atoi(__s);
      }
      __s = 0;
      int v10 = -1;
      if (!asl_msg_lookup(a2, "ReadGID", (int **)&__s, 0) && __s) {
        int v10 = atoi(__s);
      }
    }
    time_t v19 = 0;
    if ((*(unsigned char *)(a1 + 2640) & 2) != 0
      || (__s = 0, asl_msg_lookup(a2, "ASLExpireTime", (int **)&__s, 0))
      || !__s)
    {
      if (!localtime_r(&v20, &v21)) {
        return 9999;
      }
      snprintf(__str, 0x80uLL, "AUX.%d.%02d.%02d");
    }
    else
    {
      time_t v20 = asl_core_parse_time(__s, 0);
      if (!localtime_r(&v20, &v21)) {
        return 9999;
      }
      *(void *)&v21.tm_sec = 0;
      *(void *)&v21.tm_hour = 0;
      ++v21.tm_mon;
      time_t v19 = mktime(&v21);
      if (!localtime_r(&v19, &v21)) {
        return 9999;
      }
      snprintf(__str, 0x80uLL, "BB.AUX.%d.%02d.%02d");
    }
    snprintf(v24, 0x400uLL, "%s/%s", *(const char **)(a1 + 16), __str);
    memset(&v22, 0, sizeof(v22));
    if (stat(v24, &v22))
    {
      if (*__error() == 2)
      {
        if (mkdir(v24, 0x1EDu)) {
          return 8;
        }
LABEL_27:
        uint64_t v11 = *(void *)(a1 + 32);
        *(void *)(a1 + 32) = v11 + 1;
        snprintf(v24, 0x80uLL, "%s/%llu", __str, v11);
        v22.st_dev = 0;
        unsigned int v17 = 0;
        unsigned __int16 v16 = 420;
        ug_path = asl_store_make_ug_path(*(void *)(a1 + 16), (uint64_t)v24, 0, v9, v10, &v22, &v17, &v16);
        if (!ug_path) {
          return 9;
        }
        int v13 = ug_path;
        int v14 = asl_file_create(ug_path, v22.st_dev, v17, v16);
        if ((v14 & 0x80000000) == 0)
        {
          int v15 = v14;
          *a4 = 0;
          asprintf(a4, "file://%s", v13);
          free(v13);
          uint64_t result = 0;
          *a3 = v15;
          return result;
        }
        free(v13);
        *a3 = -1;
        return 8;
      }
      return 9999;
    }
    if ((v22.st_mode & 0xF000) == 0x4000) {
      goto LABEL_27;
    }
    return 2;
  }
  return result;
}

char *asl_store_make_ug_path(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, _DWORD *a6, _DWORD *a7, _WORD *a8)
{
  int v9 = 0;
  *a6 = 0;
  *a7 = 0;
  *a8 = 420;
  if (a4 == -1)
  {
    if (a5 == -1)
    {
      if (a3) {
        asprintf(&v9, "%s/%s.%s");
      }
      else {
        asprintf(&v9, "%s/%s");
      }
    }
    else
    {
      *a7 = a5;
      *a8 = 384;
      if (a3) {
        asprintf(&v9, "%s/%s.G%d.%s");
      }
      else {
        asprintf(&v9, "%s/%s.G%d");
      }
    }
  }
  else
  {
    *a6 = a4;
    if (a5 == -1)
    {
      *a8 = 384;
      if (a3) {
        asprintf(&v9, "%s/%s.U%d.%s");
      }
      else {
        asprintf(&v9, "%s/%s.U%d");
      }
    }
    else
    {
      *a7 = a5;
      *a8 = 384;
      if (a3) {
        asprintf(&v9, "%s/%s.U%d.G%u.%s");
      }
      else {
        asprintf(&v9, "%s/%s.U%d.G%d");
      }
    }
  }
  return v9;
}

uint64_t asl_store_match(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, int a5, unsigned int a6, int a7)
{
  uint64_t v24 = *MEMORY[0x263EF8C08];
  if (!a1) {
    return 0;
  }
  int v14 = opendir(*(const char **)(a1 + 16));
  if (!v14) {
    return 0;
  }
  int v15 = v14;
  uint64_t v22 = 0;
  unsigned __int16 v16 = readdir(v14);
  for (i = 0; v16; unsigned __int16 v16 = readdir(v15))
  {
    int v19 = v16->d_name[0];
    d_name = v16->d_name;
    if (v19 != 46)
    {
      snprintf(__str, 0x400uLL, "%s/%s", *(const char **)(a1 + 16), d_name);
      if (!asl_file_open_read(__str, &v22))
      {
        if (v22) {
          uint64_t i = asl_file_list_add((uint64_t)i, v22);
        }
      }
    }
  }
  closedir(v15);
  uint64_t v20 = asl_file_list_match(i, a2, a3, a4, a5, a6, a7);
  asl_file_list_close((asl_object_t *)i);
  return v20;
}

uint64_t asl_store_match_timeout(uint64_t a1, uint64_t a2, unsigned int **a3, void *a4, unint64_t a5, int a6, int a7, unsigned int a8)
{
  asl_object_t obj = 0;
  if (!a3) {
    return 9999;
  }
  *a3 = 0;
  uint64_t v15 = asl_store_open_read(0, &obj);
  if (!v15)
  {
    if (a2)
    {
      if (*(_DWORD *)a2)
      {
        unsigned __int16 v16 = asl_new(2u);
        unsigned int v17 = *(_DWORD *)a2;
        *(_DWORD *)(a2 + 4) = 0;
        if (v17)
        {
          unsigned int v18 = 0;
          do
          {
            asl_append(v16, *(asl_object_t *)(*(void *)(a2 + 8) + 8 * v18));
            unsigned int v19 = *(_DWORD *)a2;
            unsigned int v18 = *(_DWORD *)(a2 + 4) + 1;
            *(_DWORD *)(a2 + 4) = v18;
          }
          while (v18 < v19);
        }
      }
      else
      {
        unsigned __int16 v16 = 0;
        *(_DWORD *)(a2 + 4) = 0;
      }
    }
    else
    {
      unsigned __int16 v16 = 0;
    }
    uint64_t v20 = (__asl_object_s *)asl_store_match((uint64_t)obj, (uint64_t)v16, a4, a5, a6, a8, a7);
    asl_release(obj);
    asl_release(v16);
    if (v20)
    {
      unsigned int v21 = asl_count(v20);
      if (v21)
      {
        uint64_t v22 = (unsigned int *)malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
        if (v22)
        {
          regex_t v23 = v22;
          unsigned int *v22 = v21;
          *((void *)v22 + 1) = malloc_type_calloc(v21, 8uLL, 0x80040B8603338uLL);
          v23[1] = 0;
          if (*v23)
          {
            do
            {
              uint64_t v24 = asl_next(v20);
              asl_object_t v25 = asl_retain(v24);
              unsigned int v27 = *v23;
              uint64_t v26 = v23[1];
              *(void *)(*((void *)v23 + 1) + 8 * v26) = v25;
              v23[1] = v26 + 1;
            }
            while ((int)v26 + 1 < v27);
          }
          uint64_t v15 = 0;
          v23[1] = 0;
          *a3 = v23;
        }
        else
        {
          uint64_t v15 = 9;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      asl_release(v20);
    }
    else
    {
      return 0;
    }
  }
  return v15;
}

uint64_t asl_store_match_start(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8C08];
  if (!a1) {
    return 2;
  }
  time_t v6 = *(void **)(a1 + 2600);
  if (v6) {
    asl_file_list_match_end(v6);
  }
  *(void *)(a1 + 2600) = 0;
  uint64_t v7 = opendir(*(const char **)(a1 + 16));
  if (!v7) {
    return 7;
  }
  time_t v8 = v7;
  uint64_t v15 = 0;
  int v9 = readdir(v7);
  for (i = 0; v9; int v9 = readdir(v8))
  {
    int v12 = v9->d_name[0];
    d_name = v9->d_name;
    if (v12 != 46)
    {
      snprintf(__str, 0x400uLL, "%s/%s", *(const char **)(a1 + 16), d_name);
      if (!asl_file_open_read(__str, &v15))
      {
        if (v15) {
          uint64_t i = asl_file_list_add((uint64_t)i, v15);
        }
      }
    }
  }
  closedir(v8);
  int matched = asl_file_list_match_start(i, a2, a3);
  *(void *)(a1 + 2600) = matched;
  if (matched) {
    return 0;
  }
  else {
    return 9999;
  }
}

uint64_t asl_store_match_next(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  if (!a1) {
    return 2;
  }
  uint64_t result = *(void *)(a1 + 2600);
  if (result) {
    return asl_file_list_match_next(result, a2, a3, a4);
  }
  return result;
}

uint64_t _jump_next_1(uint64_t a1)
{
  uint64_t v7 = 0;
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2 == -1) {
    return 0;
  }
  *(void *)(a1 + 8) = v2 + 1;
  uint64_t v3 = asl_store_match(a1, 0, &v7, v2 + 1, 1, 0, 1);
  if (v3)
  {
    uint64_t v4 = (__asl_object_s *)v3;
    *(void *)(a1 + 8) = v7;
    uint64_t index = asl_msg_list_get_index(v3, 0);
    asl_msg_list_release(v4);
  }
  else
  {
    uint64_t index = 0;
    *(void *)(a1 + 8) = -1;
  }
  return index;
}

uint64_t _jump_prev_1(uint64_t a1)
{
  uint64_t v7 = 0;
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0;
  }
  *(void *)(a1 + 8) = v2 - 1;
  if (v2 == 1) {
    return 0;
  }
  uint64_t v3 = asl_store_match(a1, 0, &v7, v2 - 1, 1, 0, -1);
  if (v3)
  {
    uint64_t v4 = (__asl_object_s *)v3;
    *(void *)(a1 + 8) = v7;
    uint64_t index = asl_msg_list_get_index(v3, 0);
    asl_msg_list_release(v4);
  }
  else
  {
    uint64_t index = 0;
    *(void *)(a1 + 8) = 0;
  }
  return index;
}

uint64_t _jump_set_iteration_index_1(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

uint64_t _jump_append_3(uint64_t a1, asl_object_t obj)
{
  uint64_t result = asl_get_type(obj);
  if (a1 && (*(unsigned char *)(a1 + 2640) & 1) == 0)
  {
    if (result == 2)
    {
      asl_msg_list_reset_iteration((uint64_t)obj, 0);
      do
      {
        uint64_t result = asl_msg_list_next((uint64_t)obj);
        if (!result) {
          break;
        }
        uint64_t result = asl_store_save(a1, (_DWORD *)result);
      }
      while (!result);
    }
    else if (result <= 1)
    {
      return asl_store_save(a1, obj);
    }
  }
  return result;
}

uint64_t _jump_search_3(uint64_t a1, asl_object_t obj)
{
  uint32_t type = asl_get_type(obj);
  uint64_t v11 = 0;
  if (!obj)
  {
    uint64_t v5 = a1;
    asl_object_t v6 = 0;
    return asl_store_match(v5, (uint64_t)v6, &v11, 0, 0, 0, 1);
  }
  if (type == 2)
  {
    uint64_t v5 = a1;
    asl_object_t v6 = obj;
    return asl_store_match(v5, (uint64_t)v6, &v11, 0, 0, 0, 1);
  }
  if (type > 1) {
    return 0;
  }
  asl_msg_list_new();
  int v10 = (__asl_object_s *)v9;
  asl_msg_list_append(v9, obj);
  uint64_t v7 = asl_store_match(a1, (uint64_t)v10, &v11, 0, 0, 0, 1);
  asl_msg_list_release(v10);
  return v7;
}

uint64_t _jump_match_3(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, int a5, unsigned int a6, int a7)
{
  uint64_t v9 = 0;
  uint64_t result = asl_store_match(a1, a2, &v9, a4, a5, a6, a7);
  *a3 = v9;
  return result;
}

tm *_asl_start_today()
{
  memset(&v1, 0, sizeof(v1));
  time_t v2 = time(0);
  uint64_t result = localtime_r(&v2, &v1);
  if (result)
  {
    *(void *)&v1.tm_sec = 0;
    v1.tm_hour = 0;
    return (tm *)mktime(&v1);
  }
  return result;
}

uint64_t asl_is_utf8(unsigned __int8 *a1)
{
  if (!a1) {
    return 1;
  }
  int v2 = *a1;
  uint64_t result = 1;
  if (v2)
  {
    int v4 = 0;
    int v5 = 0;
    asl_object_t v6 = a1 + 1;
    while (1)
    {
      switch(v5)
      {
        case 0:
          if ((v2 & 0x80) == 0)
          {
            int v5 = 0;
            int v4 = 0;
LABEL_51:
            BOOL v7 = 1;
            goto LABEL_52;
          }
          if ((v2 + 62) < 0x1Eu)
          {
            int v5 = 1;
            int v4 = 1;
            goto LABEL_51;
          }
          if (v2 == 224)
          {
            int v5 = 1;
            int v4 = 2;
            goto LABEL_51;
          }
          if ((v2 + 31) < 0xFu)
          {
            int v5 = 1;
            int v4 = 3;
            goto LABEL_51;
          }
          if (v2 == 240)
          {
            int v5 = 1;
            int v4 = 4;
            goto LABEL_51;
          }
          if ((v2 + 15) < 3u)
          {
            int v5 = 1;
            int v4 = 5;
            goto LABEL_51;
          }
          BOOL v7 = v2 == 244;
          if (v2 == 244) {
            int v4 = 6;
          }
          else {
            int v4 = 0;
          }
          int v5 = 1;
LABEL_52:
          int v15 = *v6++;
          LOBYTE(v2) = v15;
          if (!v15 || !v7) {
            return v7;
          }
          break;
        case 1:
          switch(v4)
          {
            case 1:
              int v5 = (char)v2 > -65;
              BOOL v7 = (char)v2 < -64;
              int v4 = 1;
              goto LABEL_52;
            case 2:
              BOOL v7 = (v2 & 0xE0) == 160;
              if ((v2 & 0xE0) == 0xA0) {
                int v5 = 2;
              }
              else {
                int v5 = 1;
              }
              int v4 = 2;
              goto LABEL_52;
            case 3:
              BOOL v7 = (char)v2 < -64;
              if ((char)v2 >= -64) {
                int v5 = 1;
              }
              else {
                int v5 = 2;
              }
              int v4 = 3;
              goto LABEL_52;
            case 4:
              unsigned int v14 = (v2 + 112);
              BOOL v7 = v14 < 0x30;
              if (v14 >= 0x30) {
                int v5 = 1;
              }
              else {
                int v5 = 2;
              }
              int v4 = 4;
              goto LABEL_52;
            case 5:
              BOOL v7 = (char)v2 < -64;
              if ((char)v2 >= -64) {
                int v5 = 1;
              }
              else {
                int v5 = 2;
              }
              int v4 = 5;
              goto LABEL_52;
            case 6:
              BOOL v7 = (char)v2 < -112;
              if ((char)v2 >= -112) {
                int v5 = 1;
              }
              else {
                int v5 = 2;
              }
              int v4 = 6;
              goto LABEL_52;
            default:
              return 0;
          }
        case 2:
          unsigned int v8 = v4 & 0xFFFFFFFE;
          BOOL v7 = (v4 - 4) < 3 && (char)v2 < -64;
          if (v7) {
            int v9 = 3;
          }
          else {
            int v9 = 2;
          }
          int v10 = (char)v2;
          BOOL v11 = (char)v2 < -64;
          int v12 = 2 * (v10 > -65);
          BOOL v13 = v8 == 2;
          if (v8 == 2) {
            int v5 = v12;
          }
          else {
            int v5 = v9;
          }
          if (v13) {
            BOOL v7 = v11;
          }
          goto LABEL_52;
        case 3:
          BOOL v7 = (v4 - 4) < 3 && (char)v2 < -64;
          if (v7) {
            int v5 = 0;
          }
          else {
            int v5 = 3;
          }
          goto LABEL_52;
        default:
          return 0;
      }
    }
  }
  return result;
}

unsigned char *asl_b64_encode(uint64_t a1, unint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t result = malloc_type_malloc((4 * ((a2 + 2) / 3)) | 1, 0x1B493FFBuLL);
    if (result)
    {
      result[(2 * (((a2 + 2) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64)) & 0xFFFFFFFFFFFFFFFCLL] = 0;
      if (a2 < 3)
      {
        unint64_t v9 = 0;
        uint64_t v5 = 0;
        unint64_t v6 = 1;
      }
      else
      {
        uint64_t v5 = 0;
        unint64_t v6 = 1;
        do
        {
          BOOL v7 = &result[v5 + 1];
          *(v7 - 1) = aAbcdefghijklmn[(unint64_t)*(unsigned __int8 *)(a1 + v6 - 1) >> 2];
          *BOOL v7 = aAbcdefghijklmn[((unint64_t)*(unsigned __int8 *)(a1 + v6) >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (*(unsigned char *)(a1 + v6 - 1) & 3))];
          v7[1] = aAbcdefghijklmn[((unint64_t)*(unsigned __int8 *)(a1 + v6 + 1) >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (*(unsigned char *)(a1 + v6) & 0xF))];
          v5 += 4;
          v7[2] = aAbcdefghijklmn[*(unsigned char *)(a1 + v6 + 1) & 0x3F];
          unint64_t v8 = v6 + 4;
          v6 += 3;
        }
        while (v8 < a2);
        unint64_t v9 = v6 - 1;
      }
      if (v9 < a2)
      {
        uint64_t v11 = v5 | 1;
        result[v5] = aAbcdefghijklmn[(unint64_t)*(unsigned __int8 *)(a1 + v9) >> 2];
        uint64_t v12 = 16 * (*(unsigned char *)(a1 + v9) & 3);
        if (v6 >= a2)
        {
          char v15 = aAbcdefghijklmn[v12];
          uint64_t v16 = v5 | 2;
          result[v11] = v15;
          uint64_t v14 = v5 | 3;
          result[v16] = 61;
        }
        else
        {
          result[v11] = aAbcdefghijklmn[v12 | ((unint64_t)*(unsigned __int8 *)(a1 + v6) >> 4)];
          uint64_t v13 = v5 | 2;
          uint64_t v14 = v5 | 3;
          result[v13] = aAbcdefghijklmn[4 * (*(unsigned char *)(a1 + v6) & 0xF)];
        }
        result[v14] = 61;
      }
    }
    else
    {
      int v10 = __error();
      uint64_t result = 0;
      int *v10 = 12;
    }
  }
  return result;
}

uint64_t asl_syslog_faciliy_name_to_num(const char *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!strcasecmp(a1, "auth")) {
    return 32;
  }
  if (!strcasecmp(a1, "authpriv")) {
    return 80;
  }
  if (!strcasecmp(a1, "cron")) {
    return 72;
  }
  if (!strcasecmp(a1, "daemon")) {
    return 24;
  }
  if (!strcasecmp(a1, "ftp")) {
    return 88;
  }
  if (!strcasecmp(a1, "install")) {
    return 112;
  }
  uint64_t result = strcasecmp(a1, "kern");
  if (!result) {
    return result;
  }
  if (!strcasecmp(a1, "lpr")) {
    return 48;
  }
  if (!strcasecmp(a1, "mail")) {
    return 16;
  }
  if (!strcasecmp(a1, "netinfo")) {
    return 96;
  }
  if (!strcasecmp(a1, "remoteauth")) {
    return 104;
  }
  if (!strcasecmp(a1, "news")) {
    return 56;
  }
  if (!strcasecmp(a1, "security")) {
    return 32;
  }
  if (!strcasecmp(a1, "syslog")) {
    return 40;
  }
  if (!strcasecmp(a1, "user")) {
    return 8;
  }
  if (!strcasecmp(a1, "uucp")) {
    return 64;
  }
  if (!strcasecmp(a1, "local0")) {
    return 128;
  }
  if (!strcasecmp(a1, "local1")) {
    return 136;
  }
  if (!strcasecmp(a1, "local2")) {
    return 144;
  }
  if (!strcasecmp(a1, "local3")) {
    return 152;
  }
  if (!strcasecmp(a1, "local4")) {
    return 160;
  }
  if (!strcasecmp(a1, "local5")) {
    return 168;
  }
  if (!strcasecmp(a1, "local6")) {
    return 176;
  }
  if (!strcasecmp(a1, "local7")) {
    return 184;
  }
  if (!strcasecmp(a1, "launchd")) {
    return 192;
  }
  return 0xFFFFFFFFLL;
}

uint64_t asl_trigger_aslmanager()
{
  mach_service = xpc_connection_create_mach_service("com.apple.aslmanager", 0, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_1);
  xpc_connection_resume(mach_service);
  if (!mach_service) {
    return 0xFFFFFFFFLL;
  }
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = v1;
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(mach_service, v1);
  if (v3) {
    xpc_release(v3);
  }
  xpc_release(v2);
  xpc_release(mach_service);
  return 0;
}

uint64_t asl_object_set_key_val_op(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1 || *a1 > 6u) {
    return 0xFFFFFFFFLL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_2);
  }
  unint64_t v8 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }

  return v8(a1, a2, a3, a4);
}

void asl_object_unset_key(_DWORD *a1, uint64_t a2)
{
  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_3);
    }
    int v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 24);
    if (v4)
    {
      v4(a1, a2);
    }
  }
}

uint64_t asl_object_get_val_op_for_key(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1 || *a1 > 6u) {
    return 0xFFFFFFFFLL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_6);
  }
  unint64_t v8 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 32);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }

  return v8(a1, a2, a3, a4);
}

uint64_t asl_object_get_key_val_op_at_index(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1 || *a1 > 6u) {
    return 0xFFFFFFFFLL;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_9);
  }
  int v10 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 40);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }

  return v10(a1, a2, a3, a4, a5);
}

uint64_t asl_object_count(_DWORD *a1)
{
  if (!a1 || *a1 > 6u) {
    return 0;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_12);
  }
  int v2 = *(uint64_t (**)(_DWORD *))(asl_jump[*a1] + 48);
  if (!v2) {
    return 0;
  }

  return v2(a1);
}

uint64_t asl_object_next(_DWORD *a1)
{
  if (!a1 || *a1 > 6u) {
    return 0;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_15);
  }
  int v2 = *(uint64_t (**)(_DWORD *))(asl_jump[*a1] + 56);
  if (!v2) {
    return 0;
  }

  return v2(a1);
}

uint64_t asl_object_prev(_DWORD *a1)
{
  if (!a1 || *a1 > 6u) {
    return 0;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_18);
  }
  int v2 = *(uint64_t (**)(_DWORD *))(asl_jump[*a1] + 64);
  if (!v2) {
    return 0;
  }

  return v2(a1);
}

uint64_t asl_object_get_object_at_index(_DWORD *a1, uint64_t a2)
{
  if (!a1 || *a1 > 6u) {
    return 0;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_21);
  }
  int v4 = *(uint64_t (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 72);
  if (!v4) {
    return 0;
  }

  return v4(a1, a2);
}

void asl_object_set_iteration_index(_DWORD *a1, uint64_t a2)
{
  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_24);
    }
    int v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 80);
    if (v4)
    {
      v4(a1, a2);
    }
  }
}

void asl_object_remove_object_at_index(_DWORD *a1, uint64_t a2)
{
  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_27);
    }
    int v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 88);
    if (v4)
    {
      v4(a1, a2);
    }
  }
}

void asl_object_append(int *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    int v6 = *a1;
    if (*a1 > 6) {
      return;
    }
  }
  else
  {
    int v6 = 5;
  }
  if (asl_object_once != -1) {
    dispatch_once(&asl_object_once, &__block_literal_global_30);
  }
  BOOL v7 = *(void (**)(int *, uint64_t, uint64_t))(asl_jump[v6] + 96);
  if (v7)
  {
    v7(a1, a2, a3);
  }
}

void asl_object_prepend(_DWORD *a1, uint64_t a2)
{
  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_33);
    }
    int v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 104);
    if (v4)
    {
      v4(a1, a2);
    }
  }
}

uint64_t asl_object_search(_DWORD *a1, __asl_object_s *a2)
{
  if (a1)
  {
    if (*a1 > 6u) {
      return 0;
    }
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_36);
    }
    int v4 = *(uint64_t (**)(_DWORD *, __asl_object_s *))(asl_jump[*a1] + 112);
    if (v4)
    {
      return v4(a1, a2);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return asl_client_search(0, a2);
  }
}

uint64_t asl_object_match(_DWORD *a1, char *a2, char **a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (*a1 > 6u) {
      return 0;
    }
    if (asl_object_once != -1) {
      dispatch_once(&asl_object_once, &__block_literal_global_39);
    }
    uint64_t v14 = *(uint64_t (**)(_DWORD *, char *, char **, unint64_t, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 120);
    if (v14)
    {
      return v14(a1, a2, a3, a4, a5, a6, a7);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return asl_client_match(0, a2, a3, a4, a5, a6, a7);
  }
}

uint64_t asl_get_value_for_key(_DWORD *a1, uint64_t a2)
{
  uint64_t v4 = 0;
  __int16 v3 = 0;
  asl_object_get_val_op_for_key(a1, a2, (uint64_t)&v4, (uint64_t)&v3);
  return v4;
}

int asl_set(asl_object_t obj, const char *key, const char *value)
{
  if (!obj) {
    return -1;
  }
  if (*(_DWORD *)obj == 1) {
    uint64_t v3 = 0xFFFFLL;
  }
  else {
    uint64_t v3 = 0;
  }
  return asl_object_set_key_val_op(obj, (uint64_t)key, (uint64_t)value, v3);
}

uint64_t asl_unset_key(_DWORD *a1, uint64_t a2)
{
  return 0;
}

void asl_append(asl_object_t obj, asl_object_t obj_to_add)
{
  asl_object_append((int *)obj, (uint64_t)obj_to_add, v2);
}

int asl_send(asl_object_t obj, asl_object_t msg)
{
  asl_object_append((int *)obj, (uint64_t)msg, v2);
  return 0;
}

const char *__cdecl asl_key(asl_object_t msg, uint32_t n)
{
  uint64_t v3 = 0;
  if (asl_object_get_key_val_op_at_index(msg, n, (uint64_t)&v3, 0, 0)) {
    return 0;
  }
  else {
    return v3;
  }
}

const char *__cdecl asl_get(asl_object_t msg, const char *key)
{
  uint64_t v3 = 0;
  if (asl_object_get_val_op_for_key(msg, (uint64_t)key, (uint64_t)&v3, 0)) {
    return 0;
  }
  else {
    return v3;
  }
}

int asl_fetch_key_val_op(asl_object_t msg, uint32_t n, const char **key, const char **val, uint32_t *op)
{
  unsigned __int16 v7 = 0;
  int result = asl_object_get_key_val_op_at_index(msg, n, (uint64_t)key, (uint64_t)val, (uint64_t)&v7);
  if (op)
  {
    if (!result) {
      *op = v7;
    }
  }
  return result;
}

int asl_set_query(asl_object_t msg, const char *key, const char *value, uint32_t op)
{
  return asl_object_set_key_val_op(msg, (uint64_t)key, (uint64_t)value, (unsigned __int16)op);
}

int asl_unset(asl_object_t obj, const char *key)
{
  return 0;
}

char *__cdecl asl_format(char *msg, const char *msg_fmt, const char *time_fmt, uint32_t text_encoding)
{
  if (msg)
  {
    if (*(_DWORD *)msg)
    {
      return 0;
    }
    else
    {
      int v4 = 0;
      return asl_format_message(msg, (char *)msg_fmt, (char *)time_fmt, text_encoding, &v4);
    }
  }
  return msg;
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void openlog(const char *a1, int a2, int a3)
{
  pthread_mutex_lock(&_sl_lock);
  if (_sl_asl) {
    asl_release((asl_object_t)_sl_asl);
  }
  _sl_asl = 0;
  free((void *)_sl_ident);
  _sl_ident = 0;
  if (a1) {
    _sl_ident = (uint64_t)strdup(a1);
  }
  _sl_fac = a3;
  int v6 = asl_syslog_faciliy_num_to_name(a3);
  _sl_opts = a2;
  if ((a2 & 0x1000) != 0) {
    int v7 = 65540;
  }
  else {
    int v7 = 0x10000;
  }
  _sl_mask = 255;
  _sl_asl = (uint64_t)asl_open((const char *)_sl_ident, v6, v7 & 0xFFFFFFFE | (a2 >> 5) & 1);
  asl_set_filter((asl_object_t)_sl_asl, _sl_mask);

  pthread_mutex_unlock(&_sl_lock);
}

void closelog(void)
{
  pthread_mutex_lock(&_sl_lock);
  if (_sl_asl) {
    asl_close((asl_object_t)_sl_asl);
  }
  _sl_asl = 0;
  free((void *)_sl_ident);
  _sl_ident = 0;
  _sl_fac = 0;

  pthread_mutex_unlock(&_sl_lock);
}

int setlogmask(int a1)
{
  if (!a1) {
    return _sl_mask;
  }
  pthread_mutex_lock(&_sl_lock);
  _sl_mask = a1;
  int v2 = asl_set_filter((asl_object_t)_sl_asl, a1);
  if ((_sl_opts & 0x20) != 0) {
    asl_set_output_file_filter((asl_object_t)_sl_asl, 2, a1);
  }
  pthread_mutex_unlock(&_sl_lock);
  return v2;
}

uint64_t _asl_server_create_aux_link(int a1, uint64_t a2, int a3, _DWORD *a4, void *a5, _DWORD *a6, _DWORD *a7)
{
  *(void *)&rcv_name[16] = 0x100000000;
  *(void *)&v21[4] = 0;
  memset(v22, 0, sizeof(v22));
  *(_OWORD *)rcv_name = 0u;
  uint64_t v19 = a2;
  int v20 = 16777473;
  *(_DWORD *)unsigned int v21 = a3;
  *(void *)&v21[4] = *MEMORY[0x263EF8C38];
  *(_DWORD *)uint64_t v22 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v17 = -2147478253;
  *(void *)&rcv_name[12] = 0x7500000000;
  if (MEMORY[0x263EF8C80])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v17);
    mach_port_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)&v17, 3, 0x38u, 0x50u, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v13)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 217)
      {
        if (v17 < 0)
        {
          uint64_t v14 = 4294966996;
          if (*(_DWORD *)&rcv_name[20] == 2
            && *(_DWORD *)rcv_name == 72
            && !*(_DWORD *)&rcv_name[4]
            && HIWORD(v20) << 16 == 1114112
            && v21[11] == 1)
          {
            int v15 = *(_DWORD *)v22;
            if (*(_DWORD *)v22 == *(_DWORD *)&v22[12])
            {
              uint64_t v14 = 0;
              *a4 = v19;
              *a5 = *(void *)v21;
              *a6 = v15;
              *a7 = *(_DWORD *)&v22[16];
              return v14;
            }
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          uint64_t v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (*(_DWORD *)&rcv_name[4]) {
              uint64_t v14 = 4294966996;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }
        else
        {
          uint64_t v14 = 4294966996;
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v17);
      return v14;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  return v14;
}

uint64_t _asl_server_message(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 16777473;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x263EF8C38];
  int v9 = a3;
  *(void *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_20CD77B50;
  if (MEMORY[0x263EF8C80]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
}

uint64_t _asl_server_register_direct_watch(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF8C38];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 119;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x263EF8C80]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t _asl_server_cancel_direct_watch(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF8C38];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 120;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x263EF8C80]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t _asl_server_query_2(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, void *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  msg.msgh_id = 0;
  uint64_t v23 = 0;
  long long v24 = 0u;
  uint64_t v25 = 0;
  *(_OWORD *)&msg.msgh_vm_size_t size = 0u;
  int v19 = 1;
  uint64_t v20 = a2;
  int v21 = 16777473;
  int v22 = a3;
  uint64_t v23 = *MEMORY[0x263EF8C38];
  LODWORD(v24) = a3;
  *(void *)((char *)&v24 + 4) = a4;
  HIDWORD(v24) = a5;
  LODWORD(v25) = a6;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x7900000000;
  if (MEMORY[0x263EF8C80])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v14 = mach_msg(&msg, 3, 0x48u, 0x4Cu, reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v14)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v15 = 4294966988;
      }
      else if (msg.msgh_id == 221)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996;
          if (v19 == 1 && msg.msgh_size == 68 && !msg.msgh_remote_port && HIBYTE(v21) == 1)
          {
            int v16 = v22;
            if (v22 == v24)
            {
              uint64_t v15 = 0;
              *a7 = v20;
              *a8 = v16;
              *a9 = *(void *)((char *)&v24 + 4);
              *a10 = HIDWORD(v24);
              return v15;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v15 = 4294966996;
          if (HIDWORD(v20))
          {
            if (msg.msgh_remote_port) {
              uint64_t v15 = 4294966996;
            }
            else {
              uint64_t v15 = HIDWORD(v20);
            }
          }
        }
        else
        {
          uint64_t v15 = 4294966996;
        }
      }
      else
      {
        uint64_t v15 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v15;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v15;
}

uint64_t _asl_server_match(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, int a7, void *a8, _DWORD *a9, void *a10, _DWORD *a11)
{
  int v19 = 1;
  uint64_t v20 = a2;
  int v21 = 16777473;
  int v22 = a3;
  uint64_t v23 = *MEMORY[0x263EF8C38];
  int v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  int v27 = a6;
  int v28 = a7;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v18.msgh_bits = 2147489043;
  v18.msgh_remote_port = a1;
  v18.msgh_local_port = reply_port;
  *(void *)&v18.msgh_voucher_port = 0x7A00000000;
  if (MEMORY[0x263EF8C80])
  {
    voucher_mach_msg_set(&v18);
    mach_port_t reply_port = v18.msgh_local_port;
  }
  uint64_t v14 = mach_msg(&v18, 3, 0x50u, 0x4Cu, reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v18.msgh_local_port);
  }
  else
  {
    if (!v14)
    {
      if (v18.msgh_id == 71)
      {
        uint64_t v15 = 4294966988;
      }
      else if (v18.msgh_id == 222)
      {
        if ((v18.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996;
          if (v19 == 1 && *(void *)&v18.msgh_size == 68 && HIBYTE(v21) == 1)
          {
            int v16 = v22;
            if (v22 == v24)
            {
              uint64_t v15 = 0;
              *a8 = v20;
              *a9 = v16;
              *a10 = v25;
              *a11 = v26;
              return v15;
            }
          }
        }
        else if (v18.msgh_size == 36)
        {
          uint64_t v15 = 4294966996;
          if (HIDWORD(v20))
          {
            if (v18.msgh_remote_port) {
              uint64_t v15 = 4294966996;
            }
            else {
              uint64_t v15 = HIDWORD(v20);
            }
          }
        }
        else
        {
          uint64_t v15 = 4294966996;
        }
      }
      else
      {
        uint64_t v15 = 4294966995;
      }
      mach_msg_destroy(&v18);
      return v15;
    }
    mig_dealloc_reply_port(v18.msgh_local_port);
  }
  return v15;
}

void asl_log_descriptor_cold_1()
{
  __assert_rtn("asl_log_descriptor", "asl_fd.c", 292, "fd_type == ASL_LOG_DESCRIPTOR_WRITE");
}

void asl_descriptor_init_cold_1()
{
  __assert_rtn("asl_descriptor_init", "asl_fd.c", 195, "(redirect_descriptors = calloc(16, sizeof(*redirect_descriptors))) != NULL");
}

void asl_descriptor_init_cold_2()
{
  __assert_rtn("asl_descriptor_init", "asl_fd.c", 199, "redirect_serial_q != NULL");
}

void asl_descriptor_init_cold_3()
{
  __assert_rtn("asl_descriptor_init", "asl_fd.c", 202, "read_source_group != NULL");
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

char ***_NSGetArgv(void)
{
  return (char ***)MEMORY[0x270EDCEB0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270EDD478]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270EDCED8](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270EDCEE0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270EDCFD8](a1, a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x270EDCFE0](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x270EDCFE8](a1);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x270EDCFF0](a1);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x270EDDDB0]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270EDD5C8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270EDD038](a1);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x270EDD048](a1, a2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x270EDCB58](data, buffer_ptr, size_ptr);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270EDCB70](data);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270EDCB90]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270EDCBA8](group, timeout);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x270EDCBB8](type, *(void *)&fd, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
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
  return (dispatch_queue_t)MEMORY[0x270EDCC78](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270EDCCB0](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270EDCCB8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270EDCCC0](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270EDCD00](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x270EDCD10](source);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270EDCD68](when, delta);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x270EDD600](*(void *)&a1, *(void *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270EDD068](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270EDD620](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270EDD070](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270EDD088](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270EDD090](a1);
}

uint64_t fileport_makefd()
{
  return MEMORY[0x270EDD648]();
}

int fls(int a1)
{
  return MEMORY[0x270EDDC60](*(void *)&a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270EDD0C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270EDD0C8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270EDD0D0](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270EDD0D8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270EDD0E0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270EDD0E8](a1, a2, *(void *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270EDD0F0](__stream, a2, *(void *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x270EDD100](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270EDD128](__ptr, __size, __nitems, __stream);
}

gid_t getegid(void)
{
  return MEMORY[0x270EDD6C0]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270EDD130](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270EDD6D0]();
}

gid_t getgid(void)
{
  return MEMORY[0x270EDD6D8]();
}

pid_t getpid(void)
{
  return MEMORY[0x270EDD6F0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270EDD148](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x270EDD708]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDD150](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDD170](a1, a2);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDD7A0](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDD7C0](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB00](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB10](ptr, size, type_id);
}

int mbr_check_membership(const uuid_t user, const uuid_t group, int *ismember)
{
  return MEMORY[0x270EDD428](user, group, ismember);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x270EDD430](*(void *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x270EDD438](*(void *)&uid, uu);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDD178](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDD188](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDD190](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDD198](__b, *(void *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x270EDD898]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDD8A8](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDD1B8](a1);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x270EDDB50](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDDB58](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDDB60](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDDB68](name, out_token);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x270EDDB70]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDD8D0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDD1C8](a1);
}

os_activity_id_t os_activity_get_identifier(os_activity_t activity, os_activity_id_t *parent_id)
{
  return MEMORY[0x270EDDD38](activity, parent_id);
}

uint64_t os_log_shim_enabled()
{
  return MEMORY[0x270EDDD48]();
}

uint64_t os_log_with_args()
{
  return MEMORY[0x270EDDD58]();
}

int pipe(int a1[2])
{
  return MEMORY[0x270EDD908](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDDCA8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDDCB0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDDCB8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDD960](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDD200](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDDB28](__ptr, __size);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x270EDD218](a1, a2, *(void *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x270EDD220](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x270EDD248](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDD268](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDD9E0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDD290](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDD298](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDD2A0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDD2B0](__s1);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDD2C0](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDD2E0](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDD2E8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDD2F0](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDD320](__s, *(void *)&__c);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDD378](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x270EDD380](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDDA58](a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDD3B0](in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDD3C8](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDDA68](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDDA70](*(void *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDDA88](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDDA90](*(void *)&__fd, __buf, __nbyte);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDDDE8](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDDE08](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x270EDDE48](interval);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDDE58](keys, values, count);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDDED8](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDDEE0]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDDEF8](string);
}