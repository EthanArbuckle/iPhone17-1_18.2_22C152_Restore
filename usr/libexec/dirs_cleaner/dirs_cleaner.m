uint64_t start()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  char v7;
  const char **v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  int v12;
  FILE *v13;
  int *v14;
  FILE *v15;
  size_t v16;
  BOOL v17;
  FILE *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  int v24;
  FILE *v25;
  FILE *v26;
  const char *v27;
  int v28;
  const char *v29;
  FILE *v30;
  const char *v31;
  char *v32;
  unsigned int v33;
  int v34;
  FILE *v35;
  char *v36;
  int *v37;
  int v38;
  FILE *v39;
  char *v40;
  int v41;
  FILE *v42;
  char *v43;
  int v44;
  FILE *v45;
  char *v46;
  _removefile_state *v48;
  int v49;
  FILE *v50;
  char *v51;
  uint64_t v52;
  FILE *v53;
  const char *v54;
  int v55;
  int v56;
  FILE *v57;
  char *v58;
  int v59;
  int v60;
  int v61;
  FILE *v62;
  char *v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int *v68;
  FILE *v69;
  int v70;
  FILE *v71;
  const char *v72;
  int v73;
  FILE *v74;
  const char *v75;
  uint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  int v81;
  char v82;
  char v83[1024];
  char v84[64];
  _WORD v85[2];
  int v86;
  __darwin_time_t v87[4];
  removefile_state_t state;
  pthread_t v89;
  pthread_mutex_t v90;
  pthread_cond_t v91;
  int v92;
  _DWORD v93[2];
  uint64_t v94;
  unsigned __int16 v95;
  int v96;
  int v97;
  unsigned int v98;
  char v99[868];
  statfs v100;

  v0 = __chkstk_darwin();
  if (v0 == 1 || (v2 = v1, v3 = v0, v4 = strcmp(*(const char **)(v1 + 8), "--init"), v5 = v4, v3 == 2) && !v4)
  {
    fwrite("usage: dirs_cleaner [--init] directory ...\n", 0x2BuLL, 1uLL, __stderrp);
    exit(64);
  }
  bzero(v83, 0x520uLL);
  if (v5)
  {
    v85[0] = 5;
    if (v3 < 2) {
      return 0;
    }
    v81 = v5;
    v6 = 1;
    goto LABEL_11;
  }
  if (!sub_1000034B0(v87, 0x14u, 0)) {
    v98 |= 1u;
  }
  v85[0] = 5;
  if (v3 > 2)
  {
    v81 = 0;
    v6 = 2;
LABEL_11:
    v82 = 0;
    v7 = 0;
    v8 = (const char **)(v2 + 8 * v6);
    v9 = v3 - v6;
    while (1)
    {
      v10 = *v8;
      bzero(&v100, 0x878uLL);
      bzero(v99, 0x400uLL);
      v11 = realpath_DARWIN_EXTSN(v10, v99);
      if (!v11)
      {
        v14 = __error();
        v15 = __stderrp;
        strerror(*v14);
        fprintf(v15, "%s: realpath: (%s, NULL, ...) failed with errno=%d: %s\n");
        goto LABEL_32;
      }
      v12 = statfs(v11, &v100);
      if (v12)
      {
        v13 = __stderrp;
        strerror(v12);
        fprintf(v13, "%s: statfs: (%s, NULL, ...) failed with errno=%d: %s\n");
        goto LABEL_32;
      }
      v16 = strlen(v100.f_mntonname);
      if (v16 == 12)
      {
        if (*(void *)v100.f_mntonname != 0x657461766972702FLL || *(_DWORD *)&v100.f_mntonname[8] != 1918989871)
        {
LABEL_31:
          v20 = __stderrp;
          strerror(22);
          fprintf(v20, "%s: (bad path: %s, NULL, ...) failed with errno=%d: %s\n");
        }
      }
      else
      {
        if (v16 != 19) {
          goto LABEL_31;
        }
        v17 = *(void *)v100.f_mntonname == 0x657461766972702FLL
           && *(void *)&v100.f_mntonname[8] == 0x626F6D2F7261762FLL;
        if (!v17 || *(void *)&v100.f_mntonname[11] != 0x656C69626F6D2F72) {
          goto LABEL_31;
        }
      }
LABEL_32:
      v21 = __strlcpy_chk();
      v22 = v21;
      if ((unint64_t)(v21 - 1) > 0x3B)
      {
        v25 = __stderrp;
        strerror(22);
        fprintf(v25, "%s: strlcpy(%s, %s, %zu) failed with errno=%d: %s\n");
LABEL_40:
        v84[0] = 0;
        v24 = v98 | 1;
        goto LABEL_41;
      }
      if (v83[v21 + 1023] != 47)
      {
        v22 = v21 + 1;
        *(_WORD *)&v83[v21 + 1024] = 47;
      }
      if (mkdir(v84, 0x1C0u))
      {
        v23 = __error();
        if (*v23 != 17)
        {
          v26 = __stderrp;
          strerror(*v23);
          fprintf(v26, "%s: mkdir(%s, 0700) failed with errno=%d: %s\n");
          goto LABEL_40;
        }
      }
      v83[v22 + 1026] = 0;
      v97 = v22;
      v24 = v98;
LABEL_41:
      v27 = *v8;
      v98 = v24 & 0xFFFFFFFD;
      if (realpath_DARWIN_EXTSN(v27, v83) && (v86 = 1073971208, !getattrlist(v83, v85, v93, 0x18uLL, 0)))
      {
        if (v93[1] == 2)
        {
          v95 &= 0xFFFu;
          if (!strncmp("/tmp", v27, 4uLL))
          {
            v95 = 1023;
            v94 = 0;
          }
LABEL_49:
          v33 = v98;
          if ((v98 & 1) == 0)
          {
            *(_WORD *)&v83[v97 + 1024] = 22616;
            if (mkdtemp(v84))
            {
              v86 = 1073971200;
              *(void *)&v100.f_bsize = v94;
              LODWORD(v100.f_blocks) = v95;
              HIDWORD(v100.f_blocks) = v96;
              if (setattrlist(v84, v85, &v100, 0x10uLL, 0))
              {
                v34 = *__error();
                v35 = __stderrp;
                v36 = strerror(v34);
                fprintf(v35, "%s: setattrlist(%s, ...) failed with errno=%d: %s\n", "dc_swap_dirs", v84, v34, v36);
                if (!v34)
                {
LABEL_62:
                  if ((v98 & 2) == 0)
                  {
                    v82 = 1;
                    goto LABEL_65;
                  }
                  goto LABEL_63;
                }
              }
              else
              {
                if (!renamex_np(v83, v84, 2u)) {
                  goto LABEL_62;
                }
                v41 = *__error();
                v42 = __stderrp;
                v43 = strerror(v41);
                fprintf(v42, "%s: renamex_np(%s, %s, RENAME_SWAP) failed with errno=%d: %s\n", "dc_swap_dirs", v83, v84, v41, v43);
                if (!v41) {
                  goto LABEL_62;
                }
              }
              v98 |= 2u;
              if (rmdir(v84))
              {
                v44 = *__error();
                v45 = __stderrp;
                v46 = strerror(v44);
                fprintf(v45, "%s: rmdir(%s) failed with errno=%d: %s\n", "dc_swap_dirs", v84, v44, v46);
              }
              goto LABEL_62;
            }
            v38 = *__error();
            v39 = __stderrp;
            v40 = strerror(v38);
            fprintf(v39, "%s: mkdtemp(%s) failed with errno=%d: %s\n", "dc_reset", v84, v38, v40);
            v33 = v98;
          }
          v98 = v33 | 2;
LABEL_63:
          v28 = sub_10000328C(v83, 1);
          if (!v28) {
            goto LABEL_65;
          }
          v29 = "dc_clean_sync: %s: %s\n";
          goto LABEL_45;
        }
        v37 = __error();
        v28 = 20;
        *v37 = 20;
      }
      else
      {
        v28 = *__error();
        if (!v28) {
          goto LABEL_49;
        }
      }
      v29 = "dc_reset: %s: %s\n";
LABEL_45:
      v30 = __stderrp;
      v31 = *v8;
      v32 = strerror(v28);
      fprintf(v30, v29, v31, v32);
      v7 = 1;
LABEL_65:
      ++v8;
      if (!--v9)
      {
        if (v81) {
          return 0;
        }
        if (v7)
        {
          if ((v98 & 1) == 0)
          {
            v83[v97 + 1024] = 0;
            sub_10000328C(v83, 0);
          }
          return 0;
        }
        if ((v82 & 1) == 0 || !sub_100003358((uint64_t)v83)) {
          return 0;
        }
        v83[v97 + 1024] = 0;
        v48 = removefile_state_alloc();
        state = v48;
        if (!v48)
        {
          v53 = __stderrp;
          v76 = 12;
          v77 = strerror(12);
          v54 = "%s: removefile_state_alloc(...) failed with errno=%d: %s\n";
LABEL_79:
          fprintf(v53, v54, "dc_init_thread_ctx", v76, v77, v80);
          goto LABEL_87;
        }
        if (removefile_state_set(v48, 3u, sub_10000357C))
        {
          v49 = *__error();
          v50 = __stderrp;
          v51 = strerror(v49);
          fprintf(v50, "%s: failed to set error cb!\n failed with errno=%d: %s\n", "dc_init_thread_ctx", v49, v51);
        }
        v52 = pthread_mutex_init(&v90, 0);
        if (v52)
        {
          v53 = __stderrp;
          v76 = v52;
          v77 = strerror(v52);
          v54 = "%s: pthread_mutex_init(...) failed with errno=%d: %s\n";
          goto LABEL_79;
        }
        v55 = pthread_cond_init(&v91, 0);
        if (v55)
        {
          v56 = v55;
          v57 = __stderrp;
          v58 = strerror(v55);
          fprintf(v57, "%s: pthread_cond_init(...) failed with errno=%d: %s\n", "dc_init_thread_ctx", v56, v58);
          goto LABEL_86;
        }
        v59 = pthread_mutex_lock(&v90);
        if (v59)
        {
          v73 = v59;
          v74 = __stderrp;
          v79 = strerror(v59);
          v75 = "dtc_lock";
        }
        else
        {
          v60 = pthread_create(&v89, 0, (void *(__cdecl *)(void *))sub_100003608, v83);
          if (v60)
          {
            v61 = v60;
            v62 = __stderrp;
            v63 = strerror(v60);
            fprintf(v62, "%s: pthread_create(...) failed with errno=%d: %s\n", "dc_init_thread_ctx", v61, v63);
            v64 = pthread_mutex_unlock(&v90);
            if (!v64)
            {
              pthread_cond_destroy(&v91);
LABEL_86:
              pthread_mutex_destroy(&v90);
LABEL_87:
              if ((v98 & 4) == 0)
              {
LABEL_93:
                removefile_state_free(state);
                return 0;
              }
              v65 = pthread_mutex_lock(&v90);
              if (v65)
              {
                v70 = v65;
                v71 = __stderrp;
                v78 = strerror(v65);
                v72 = "dtc_lock";
              }
              else if ((v98 & 8) == 0 && (v98 |= 8u, (v66 = pthread_cond_signal(&v91)) != 0))
              {
                v70 = v66;
                v71 = __stderrp;
                v78 = strerror(v66);
                v72 = "dtc_signal";
              }
              else
              {
                v67 = pthread_mutex_unlock(&v90);
                if (!v67)
                {
                  pthread_join(v89, 0);
                  pthread_cond_destroy(&v91);
                  pthread_mutex_destroy(&v90);
                  goto LABEL_93;
                }
                v70 = v67;
                v71 = __stderrp;
                v78 = strerror(v67);
                v72 = "dtc_unlock";
              }
              fprintf(v71, "dirs_cleaner: tag=%s err=%d err_str=%s\n", v72, v70, v78);
LABEL_103:
              exit(71);
            }
          }
          else
          {
            v92 = 4;
            v98 |= 4u;
            v64 = pthread_mutex_unlock(&v90);
            if (!v64)
            {
              if (removefile(v84, state, 0x303u))
              {
                v68 = __error();
                if (*v68 != 89)
                {
                  v69 = __stderrp;
                  strerror(*v68);
                  fprintf(v69, "%s: removefile(%s, ...) failed with errno=%d: %s\n");
                }
              }
              goto LABEL_87;
            }
          }
          v73 = v64;
          v74 = __stderrp;
          v79 = strerror(v64);
          v75 = "dtc_unlock";
        }
        fprintf(v74, "dirs_cleaner: tag=%s err=%d err_str=%s\n", v75, v73, v79);
        goto LABEL_103;
      }
    }
  }
  return 0;
}

uint64_t sub_10000328C(const char *a1, int a2)
{
  if (a2) {
    v2 = a1;
  }
  else {
    v2 = a1 + 1024;
  }
  v3 = removefile_state_alloc();
  v4 = v3;
  if (v3) {
    removefile_state_set(v3, 3u, sub_10000357C);
  }
  if (!removefile(v2, v4, 0x303u))
  {
    uint64_t v6 = 0;
    if (!v4) {
      return v6;
    }
    goto LABEL_8;
  }
  v5 = __error();
  uint64_t v6 = *v5;
  v7 = __stderrp;
  v8 = strerror(*v5);
  fprintf(v7, "%s: removefile(%s, NULL, ...) failed with errno=%d: %s\n", "dc_clean_sync", v2, v6, v8);
  if (v4) {
LABEL_8:
  }
    removefile_state_free(v4);
  return v6;
}

BOOL sub_100003358(uint64_t a1)
{
  BOOL result = sub_1000034B0((__darwin_time_t *)(a1 + 1128), *(_DWORD *)(a1 + 1272), (void *)(a1 + 1112));
  if (result)
  {
    memset(&v9, 0, 512);
    if (statfs((const char *)a1, &v9))
    {
      int v3 = *__error();
      v4 = __stderrp;
      v5 = strerror(v3);
      fprintf(v4, "%s: statfs(%s, ...) failed with errno=%d: %s\n", "dc_should_reclaim", (const char *)a1, v3, v5);
      return 0;
    }
    else
    {
      uint64_t v6 = 0x40000000 / v9.f_bsize;
      uint64_t v7 = 5 * v9.f_blocks / 0x64;
      if (v7 < v6) {
        uint64_t v6 = 5 * v9.f_blocks / 0x64;
      }
      if (v7 >= 0x10000000 / v9.f_bsize) {
        uint64_t v8 = v6;
      }
      else {
        uint64_t v8 = 0x10000000 / v9.f_bsize;
      }
      return v8 > v9.f_bfree;
    }
  }
  return result;
}

BOOL sub_1000034B0(__darwin_time_t *a1, unsigned int a2, void *a3)
{
  v12.tv_sec = 0;
  *(void *)&v12.tv_usec = 0;
  if (gettimeofday(&v12, 0))
  {
    int v6 = *__error();
    uint64_t v7 = __stderrp;
    uint64_t v8 = strerror(v6);
    fprintf(v7, "%s: gettimeofday(...) failed with errno=%d: %s\n", "dtc_timespan2timespec", v6, v8);
    __darwin_time_t v9 = 0;
  }
  else if (a3)
  {
    __darwin_time_t v10 = a2;
    if (*a3 - v12.tv_sec < a2) {
      __darwin_time_t v10 = *a3 - v12.tv_sec;
    }
    __darwin_time_t v9 = v10 + v12.tv_sec;
    if (*a3 <= v12.tv_sec) {
      __darwin_time_t v9 = 0;
    }
  }
  else
  {
    __darwin_time_t v9 = v12.tv_sec + a2;
  }
  *a1 = v9;
  return v9 != 0;
}

uint64_t sub_10000357C(_removefile_state *a1)
{
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst)) {
    fprintf(__stderrp, "dc removefile unknown error on path: %s ");
  }
  else {
    fprintf(__stderrp, "dc removefile error: %d on path: %s ");
  }
  fwrite("...continuing...\n", 0x11uLL, 1uLL, __stderrp);
  return 1;
}

uint64_t sub_100003608(uint64_t a1)
{
  v2 = (pthread_mutex_t *)(a1 + 1160);
  int v3 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 1160));
  if (v3)
  {
LABEL_12:
    __darwin_time_t v9 = __stderrp;
    strerror(v3);
    fprintf(v9, "dirs_cleaner: tag=%s err=%d err_str=%s\n");
    goto LABEL_13;
  }
  while ((*(unsigned char *)(a1 + 1308) & 8) == 0)
  {
    int v3 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 1224), v2, (const timespec *)(a1 + 1128));
    if (v3)
    {
      if (v3 != 60) {
        goto LABEL_12;
      }
      if (!sub_100003358(a1))
      {
        if (removefile_cancel(*(removefile_state_t *)(a1 + 1144)))
        {
          int v4 = *__error();
          v5 = __stderrp;
          int v6 = strerror(v4);
          fprintf(v5, "%s: removefile_cancel(...) failed with errno=%d: %s\n", "dtc_timer", v4, v6);
        }
        *(_DWORD *)(a1 + 1308) |= 8u;
      }
    }
  }
  int v7 = pthread_mutex_unlock(v2);
  if (v7)
  {
    __darwin_time_t v10 = __stderrp;
    strerror(v7);
    fprintf(v10, "dirs_cleaner: tag=%s err=%d err_str=%s\n");
LABEL_13:
    exit(71);
  }
  return 0;
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_timedwait(a1, a2, a3);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

int removefile_cancel(removefile_state_t state)
{
  return _removefile_cancel(state);
}

removefile_state_t removefile_state_alloc(void)
{
  return _removefile_state_alloc();
}

int removefile_state_free(removefile_state_t a1)
{
  return _removefile_state_free(a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return _removefile_state_get(state, key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return _renamex_np(a1, a2, a3);
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}