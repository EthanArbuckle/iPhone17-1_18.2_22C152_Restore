uint64_t MIMachOUnhideArchsSavingOriginalHeader(const char *a1)
{
  int v2;
  int v3;
  void *v4;
  uint64_t v5;
  int *v6;
  int *v7;
  size_t v8;
  int v9;
  int *v10;
  int *v12;
  size_t v13;
  size_t size;
  void *v15;

  size = 0;
  v15 = 0;
  v2 = open(a1, 256);
  if (v2 < 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v6 = __error();
      strerror(*v6);
      MOLogWrite();
    }
    v4 = 0;
    goto LABEL_12;
  }
  v3 = v2;
  if (fgetxattr(v2, "com.apple.installd.hidden_archs_fat_header", 0, 0, 0, 0) != -1)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (create_new_header_for_unhiding(v3, &v15, &size))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v7 = __error();
      strerror(*v7);
      MOLogWrite();
    }
    v5 = 0;
    v4 = 0;
    goto LABEL_32;
  }
  if (size)
  {
    v4 = malloc_type_malloc(size, 0x87799A7EuLL);
    *__error() = 0;
    v8 = size;
    if (v8 != pread(v3, v4, size, 0))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    close(v3);
    v9 = open(a1, 258);
    if ((v9 & 0x80000000) == 0)
    {
      v3 = v9;
      if (fsetxattr(v9, "com.apple.installd.hidden_archs_fat_header", v4, size, 0, 2))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
          goto LABEL_31;
        }
      }
      else
      {
        *__error() = 0;
        v13 = size;
        if (v13 == pwrite(v3, v15, size, 0))
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
            MOLogWrite();
          }
          goto LABEL_7;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
LABEL_31:
          v5 = 0;
          goto LABEL_32;
        }
      }
LABEL_30:
      v10 = __error();
      strerror(*v10);
      MOLogWrite();
      goto LABEL_31;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v12 = __error();
      strerror(*v12);
      MOLogWrite();
    }
LABEL_12:
    v5 = 0;
    goto LABEL_33;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) < 7) {
    goto LABEL_6;
  }
LABEL_5:
  MOLogWrite();
LABEL_6:
  v4 = 0;
LABEL_7:
  v5 = 1;
LABEL_32:
  close(v3);
LABEL_33:
  if (v15) {
    free(v15);
  }
  if (v4) {
    free(v4);
  }
  return v5;
}

uint64_t MIMachOCreateHiddenArchsExecutableIfNeeded(const char *a1, char *a2, unsigned char *a3)
{
  *a3 = 0;
  int v5 = open(a1, 256);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    ssize_t v7 = fgetxattr(v5, "com.apple.installd.hidden_archs_fat_header", 0, 0, 0, 0);
    if (v7 < 0)
    {
      if (*__error() == 93)
      {
        v9 = 0;
        goto LABEL_17;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v16 = __error();
        strerror(*v16);
        MOLogWrite();
      }
LABEL_32:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      v9 = 0;
LABEL_36:
      uint64_t v14 = 0;
LABEL_37:
      int v12 = v6;
      goto LABEL_38;
    }
    size_t v8 = v7;
    v9 = malloc_type_malloc(v7, 0x2907A5C4uLL);
    ssize_t v10 = fgetxattr(v6, "com.apple.installd.hidden_archs_fat_header", v9, v8, 0, 0);
    if (v10 < 0)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_27:
        if (v9) {
          free(v9);
        }
        goto LABEL_32;
      }
      v15 = __error();
      strerror(*v15);
    }
    else
    {
      if (v8 == v10)
      {
        if (v8)
        {
          int v11 = mkstemp(a2);
          if (v11 != -1)
          {
            int v12 = v11;
            if (fcopyfile(v6, v11, 0, 0xAu))
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
                goto LABEL_53;
              }
            }
            else
            {
              *__error() = 0;
              if (v8 == pwrite(v12, v9, v8, 0))
              {
                if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
                  MOLogWrite();
                }
                uint64_t v14 = 1;
                *a3 = 1;
LABEL_54:
                close(v6);
                if (v12 < 0)
                {
LABEL_39:
                  if (v9) {
                    free(v9);
                  }
                  return v14;
                }
LABEL_38:
                close(v12);
                goto LABEL_39;
              }
              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
LABEL_53:
                uint64_t v14 = 0;
                goto LABEL_54;
              }
            }
            v19 = __error();
            strerror(*v19);
            MOLogWrite();
            goto LABEL_53;
          }
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v18 = __error();
            strerror(*v18);
            MOLogWrite();
          }
          goto LABEL_36;
        }
LABEL_17:
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
          MOLogWrite();
        }
        uint64_t v14 = 1;
        goto LABEL_37;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_27;
      }
    }
    MOLogWrite();
    goto LABEL_27;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v13 = __error();
    strerror(*v13);
    MOLogWrite();
  }
  return 0;
}

uint64_t hardlink_copy_hierarchy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, CFErrorRef *a10)
{
  uint64_t v10 = MEMORY[0x270FA5388]();
  CFArrayRef v12 = v11;
  uint64_t v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (char *)v10;
  uint64_t v324 = *MEMORY[0x263EF8340];
  bzero(to, 0x400uLL);
  bzero(v283, 0x400uLL);
  bzero(&v281, 0x410uLL);
  v280[0] = v25;
  v280[1] = 0;
  v26 = fts_open_b(v280, 85, &__block_literal_global);
  if (!v26)
  {
    v41 = __error();
    strerror(*v41);
    CFErrorRef v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 746, v42, v43, 0, v44, @"fts_open of %s failed: %s", v45, (char)v25);
    goto LABEL_24;
  }
  v27 = v26;
  if (!v22)
  {
    bzero(cf, 0x400uLL);
    if ((unint64_t)__strlcpy_chk() < 0x400)
    {
      LOWORD(v245.st_dev) = 0;
      *(void *)__str = 0;
      if ((realpath_parent_no_symlink((const char *)cf, v283, (mode_t *)&v245, (CFErrorRef *)__str) & 1) == 0)
      {
        CFErrorRef v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 786, v55, v56, *(const void **)__str, v57, @"Failed to realpath parent of %s", v58, (char)cf);
        CFErrorRef v64 = *(CFErrorRef *)__str;
        if (!*(void *)__str) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      if (!LOWORD(v245.st_dev) || (v245.st_dev & 0xF000) == 0x4000)
      {
        v83 = 0;
        BOOL v244 = 0;
        goto LABEL_41;
      }
      CFErrorRef v54 = _CreateAndLogDMError("hardlink_copy_hierarchy", 792, v55, v56, 0, v57, @"Entity exists at %s but it's not a directory", v58, (char)v283);
      goto LABEL_14;
    }
    CFStringRef v51 = @"Destination path was too long";
    int v52 = 779;
LABEL_13:
    CFErrorRef v54 = _CreateAndLogDMError("hardlink_copy_hierarchy", v52, v47, v48, 0, v49, v51, v50, (char)fts_path);
LABEL_14:
    CFErrorRef v46 = v54;
    goto LABEL_23;
  }
  if (!realpath_DARWIN_EXTSN(v24, v283))
  {
    v53 = __error();
    strerror(*v53);
    LOBYTE(fts_path) = (_BYTE)v24;
    CFStringRef v51 = @"realpath of '%s' failed at element '%s': %s";
    int v52 = 752;
    goto LABEL_13;
  }
  memset(&v245, 0, sizeof(v245));
  int v28 = open(v22, 256);
  if (v28 < 0)
  {
    v59 = __error();
    strerror(*v59);
    CFErrorRef v36 = _CreateAndLogDMError("open_delta_manifest", 416, v60, v61, 0, v62, @"Could not open %s: %s", v63, (char)v22);
LABEL_20:
    CFErrorRef v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 758, v37, v38, v36, v39, @"Failed to open manifest %s", v40, (char)v22);
    if (v36)
    {
      CFErrorRef v64 = v36;
LABEL_22:
      CFRelease(v64);
    }
LABEL_23:
    fts_close(v27);
    goto LABEL_24;
  }
  int v29 = v28;
  if (fstat(v28, &v245))
  {
    v30 = __error();
    strerror(*v30);
    CFErrorRef v35 = _CreateAndLogDMError("open_delta_manifest", 421, v31, v32, 0, v33, @"Could not stat %s: %s", v34, (char)v22);
LABEL_7:
    CFErrorRef v36 = v35;
LABEL_8:
    close(v29);
    goto LABEL_20;
  }
  v66 = mmap(0, v245.st_size, 1, 1026, v29, 0);
  if (v66 == (void *)-1)
  {
    v160 = __error();
    strerror(*v160);
    CFErrorRef v35 = _CreateAndLogDMError("open_delta_manifest", 435, v161, v162, 0, v163, @"Failed to map file at %s; error %s",
            v164,
            (char)v22);
    goto LABEL_7;
  }
  v243 = v66;
  if (madvise(v66, v245.st_size, 2) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v67 = __error();
    LOBYTE(fts_path) = strerror(*v67);
    MOLogWrite();
  }
  v68 = malloc_type_calloc(1uLL, 0x18uLL, 0x1010040113C0ABBuLL);
  if (!v68)
  {
    CFErrorRef v36 = _CreateAndLogDMError("open_delta_manifest", 446, v69, v70, 0, v71, @"Failed to allocate command stream object", v72, (char)fts_path);
    munmap(v243, v245.st_size);
    goto LABEL_8;
  }
  v73 = v68;
  void *v68 = v243;
  v68[1] = v245.st_size;
  v68[2] = 0;
  long long v323 = 0u;
  long long v322 = 0u;
  long long v321 = 0u;
  long long v320 = 0u;
  long long v319 = 0u;
  long long v318 = 0u;
  long long v317 = 0u;
  long long v316 = 0u;
  long long v315 = 0u;
  long long v314 = 0u;
  long long v313 = 0u;
  long long v312 = 0u;
  long long v311 = 0u;
  long long v310 = 0u;
  long long v309 = 0u;
  long long v308 = 0u;
  long long v307 = 0u;
  long long v306 = 0u;
  long long v305 = 0u;
  long long v304 = 0u;
  long long v303 = 0u;
  long long v302 = 0u;
  long long v301 = 0u;
  long long v300 = 0u;
  long long v299 = 0u;
  long long v298 = 0u;
  long long v297 = 0u;
  long long v296 = 0u;
  long long v295 = 0u;
  long long v294 = 0u;
  long long v293 = 0u;
  *(_OWORD *)cf = 0u;
  long long v278 = 0u;
  long long v279 = 0u;
  long long v276 = 0u;
  long long v277 = 0u;
  long long v274 = 0u;
  long long v275 = 0u;
  long long v272 = 0u;
  long long v273 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  long long v266 = 0u;
  long long v267 = 0u;
  long long v264 = 0u;
  long long v265 = 0u;
  long long v262 = 0u;
  long long v263 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  long long v258 = 0u;
  long long v259 = 0u;
  long long v256 = 0u;
  long long v257 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  *(_OWORD *)__str = 0u;
  long long v249 = 0u;
  __int16 v247 = 0;
  int v246 = 0;
  __int16 v291 = 0;
  uint64_t v290 = 0;
  if ((read_string_to_terminator(v68, 0, (uint64_t)&v246, 6uLL) & 1) == 0)
  {
    CFStringRef v165 = @"Failed to read magic";
    int v166 = 299;
LABEL_155:
    CFErrorRef v78 = _CreateAndLogDMError("validate_stream", v166, v74, v75, 0, v76, v165, v77, (char)fts_path);
    goto LABEL_156;
  }
  if (v246 ^ 0x44617069 | v247)
  {
    CFErrorRef v78 = _CreateAndLogDMError("validate_stream", 305, v74, v75, 0, v76, @"Stream had invalid magic: %s", v77, (char)&v246);
LABEL_156:
    CFErrorRef v167 = v78;
LABEL_157:
    CFErrorRef v36 = _CreateAndLogDMError("open_delta_manifest", 456, v79, v80, v167, v81, @"Invalid manifest file at %s", v82, (char)v22);
    if (v167) {
      CFRelease(v167);
    }
    munmap(v243, v245.st_size);
    free(v73);
    goto LABEL_8;
  }
  if ((read_string_to_terminator(v73, 0, (uint64_t)&v290, 0xAuLL) & 1) == 0)
  {
    CFStringRef v165 = @"Failed to read version from manifest header";
    int v166 = 310;
    goto LABEL_155;
  }
  uint64_t v169 = strtol((const char *)&v290, 0, 10);
  if ((unint64_t)(v169 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    CFErrorRef v78 = _CreateAndLogDMError("validate_stream", 318, v170, v171, 0, v172, @"Manifest had invalid version: %ld; expected 1, 2, or 3",
            v173,
            v169);
    goto LABEL_156;
  }
  uint64_t v242 = v169;
  if ((read_string_to_terminator(v73, 0, (uint64_t)cf, 0x200uLL) & 1) == 0)
  {
    CFStringRef v165 = @"Failed to read manifest source version";
    int v166 = 323;
    goto LABEL_155;
  }
  v240 = v73;
  if (v20) {
    v176 = v18;
  }
  else {
    v176 = "";
  }
  if (v20) {
    v177 = v20;
  }
  else {
    v177 = "0";
  }
  if (v20) {
    v178 = " ";
  }
  else {
    v178 = "";
  }
  if (v176) {
    v179 = v176;
  }
  else {
    v179 = "";
  }
  if (snprintf(__str, 0x200uLL, "%s%s%s", v177, v178, v179) > 0x1FF)
  {
    CFErrorRef v184 = _CreateAndLogDMError("validate_stream", 350, v180, v181, 0, v182, @"Incoming expected source version string \"%s%s%s\" was too long", v183, (char)v177);
LABEL_227:
    CFErrorRef v167 = v184;
LABEL_228:
    v73 = v240;
    goto LABEL_157;
  }
  for (i = __str; *i == 10; ++i)
  {
    char *i = 32;
LABEL_223:
    ;
  }
  if (*i) {
    goto LABEL_223;
  }
  if (strcmp(__str, (const char *)cf))
  {
    fts_path = (std::__fs::filesystem::path *)cf;
    CFStringRef v206 = @"Got manifest for version \"%s\", but expected version \"%s\"";
    int v207 = 357;
    goto LABEL_226;
  }
  if (v242 < 2) {
    goto LABEL_249;
  }
  char v289 = 0;
  long long v288 = 0u;
  long long v287 = 0u;
  long long v286 = 0u;
  *(_OWORD *)v285 = 0u;
  if (!read_string_to_terminator(v240, 0, (uint64_t)v285, 0x41uLL))
  {
    CFStringRef v206 = @"Failed to read stream";
    int v207 = 375;
LABEL_226:
    CFErrorRef v184 = _CreateAndLogDMError("validate_stream", v207, v202, v203, 0, v204, v206, v205, (char)fts_path);
    goto LABEL_227;
  }
  if (!v16)
  {
    CFStringRef v206 = @"expected_infoplisthash is NULL";
    int v207 = 371;
    goto LABEL_226;
  }
  if (memcmp(v16, v285, 0x41uLL))
  {
    CFStringRef v206 = @"Compare of info plist hash failed";
    int v207 = 367;
    goto LABEL_226;
  }
  if ((unint64_t)v242 >= 3)
  {
    v285[0] = 0;
    if ((validate_supported_devices(v240, v12, (CFErrorRef *)v285) & 1) == 0)
    {
      CFErrorRef v167 = _CreateAndLogDMError("validate_stream", 384, v225, v226, v285[0], v227, @"Failed to validate supported devices", v228, (char)fts_path);
      if (v285[0]) {
        CFRelease(v285[0]);
      }
      goto LABEL_228;
    }
  }
LABEL_249:
  close(v29);
  cf[0] = 0;
  if ((read_next_manifest_command(v240, &v281, (CFErrorRef *)cf, v229, v230, v231, v232, v233) & 1) == 0)
  {
    CFErrorRef v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 765, v234, v235, cf[0], v236, @"Failed to read first manifest command", v237, (char)fts_path);
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    char v168 = 0;
    int v112 = -1;
    v83 = (void **)v240;
    goto LABEL_235;
  }
  BOOL v244 = v281 != 120;
  v83 = (void **)v240;
LABEL_41:
  size_t v84 = strlen(v25);
  v85 = fts_read(v27);
  if (!v85)
  {
    uint64_t v241 = 0;
LABEL_161:
    if (v22 && v281 != 120)
    {
      CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1110, v86, v87, 0, v89, @"Got done processing bundle but there were still commands remaining in manifest.", v91, (char)fts_path);
      goto LABEL_233;
    }
    CFErrorRef v46 = 0;
    if (a9) {
      *a9 = v241 << 9;
    }
    int v112 = -1;
    char v168 = 1;
    if (!v83) {
      goto LABEL_236;
    }
LABEL_235:
    munmap(*v83, (size_t)v83[1]);
    free(v83);
    goto LABEL_236;
  }
  v92 = v85;
  v239 = v83;
  uint64_t v241 = 0;
  while (1)
  {
    to[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
    unsigned int fts_info = v92->fts_info;
    if (fts_info > 0xD || ((1 << fts_info) & 0x314A) == 0)
    {
      v98 = 0;
      int v99 = 0;
    }
    else
    {
      v95 = &v92->fts_path[v84];
      int v97 = *v95;
      v96 = v95 + 1;
      if (v97 == 47) {
        v98 = v96;
      }
      else {
        v98 = &v92->fts_path[v84];
      }
      if (fts_info != 6 && v244 && !_utf_aware_strcmp(v282, v98))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          LOBYTE(fts_path) = v281;
          MOLogWrite();
        }
        int v99 = 1;
      }
      else
      {
        int v99 = 0;
      }
      unsigned int fts_info = v92->fts_info;
    }
    switch(fts_info)
    {
      case 1u:
        if (v99 && (v281 == 45 || v281 == 43))
        {
          if (fts_set(v27, v92, 4))
          {
            v214 = __error();
            strerror(*v214);
            CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1012, v215, v216, 0, v217, @"Failed to skip directory %s: %s", v218, (char)v98);
            goto LABEL_233;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            LOBYTE(fts_path) = (_BYTE)v98;
            MOLogWrite();
          }
LABEL_139:
          cf[0] = 0;
          if (read_next_manifest_command(v83, &v281, (CFErrorRef *)cf, v87, v88, v89, v90, v91))
          {
            if (v281 == 120)
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
                MOLogWrite();
              }
              BOOL v244 = 0;
            }
            goto LABEL_145;
          }
          CFErrorRef v174 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1094, v151, v152, cf[0], v153, @"Failed to read next manifest command", v154, (char)fts_path);
          goto LABEL_171;
        }
        *(_WORD *)__str = 0;
        cf[0] = 0;
        if ((make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
        {
          CFErrorRef v174 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1023, v123, v87, cf[0], v89, @"Failed to make dest path for directory %s", v91, (char)v98);
          goto LABEL_171;
        }
        if (*(_WORD *)__str && (*(_WORD *)__str & 0xF000) != 0x4000)
        {
          CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1030, v123, v87, 0, v89, @"Non-directory entity with mode 0%o exists at directory location in dest path %s", v91, __str[0]);
          goto LABEL_233;
        }
        if (*(_WORD *)__str)
        {
          if (*(unsigned __int16 *)__str != (v92->fts_statp->st_mode | 0x80)
            && chmod((const char *)to, v92->fts_statp->st_mode | 0x80))
          {
            v224 = __error();
            strerror(*v224);
            CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1043, v124, v125, 0, v126, @"Failed to make destination directory \"%s\" writable: %s", v127, (char)to);
LABEL_233:
            CFErrorRef v46 = v128;
            goto LABEL_234;
          }
        }
        else
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            fts_path = to;
            MOLogWrite();
          }
          if (mkdir((const char *)to, v92->fts_statp->st_mode | 0x80))
          {
            v219 = __error();
            strerror(*v219);
            CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1038, v220, v221, 0, v222, @"mkdir of '%s' failed: %s", v223, (char)to);
            goto LABEL_233;
          }
        }
        goto LABEL_138;
      case 3u:
      case 8u:
        if (v281 == 94) {
          int v100 = v99;
        }
        else {
          int v100 = 0;
        }
        if (v100 != 1)
        {
          if (v99 && (v281 == 45 || v281 == 43))
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v98;
              MOLogWrite();
            }
          }
          else
          {
            *(_WORD *)__str = 0;
            cf[0] = 0;
            if ((make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
            {
              CFErrorRef v174 = _CreateAndLogDMError("hardlink_copy_hierarchy", 975, v129, v130, cf[0], v131, @"Failed to make dest path for file %s", v132, (char)v98);
LABEL_171:
              CFErrorRef v46 = v174;
              CFTypeRef v175 = cf[0];
              if (!cf[0]) {
                goto LABEL_234;
              }
LABEL_201:
              CFRelease(v175);
              goto LABEL_234;
            }
            if (*(_WORD *)__str)
            {
              CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 982, v129, v130, 0, v131, @"Entity with mode 0%o exists at file location in dest path %s", v132, __str[0]);
              goto LABEL_233;
            }
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              fts_path = (std::__fs::filesystem::path *)v92->fts_path;
              MOLogWrite();
            }
            if (link(v92->fts_path, (const char *)to))
            {
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              {
                v133 = v92->fts_path;
                v134 = __error();
                strerror(*v134);
                LOBYTE(fts_path) = (_BYTE)v133;
                v83 = v239;
                MOLogWrite();
              }
              if (copyfile(v92->fts_path, (const char *)to, 0, 0xC000Fu))
              {
                v208 = v92->fts_path;
                v209 = __error();
                strerror(*v209);
                CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 991, v210, v211, 0, v212, @"copyfile of %s to %s failed: %s", v213, (char)v208);
                goto LABEL_233;
              }
            }
          }
          goto LABEL_137;
        }
        LOWORD(v285[0]) = 0;
        bzero(cf, 0x400uLL);
        *(void *)&v245.st_dev = 0;
        if ((make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)v285, (CFErrorRef *)&v245) & 1) == 0)
        {
          CFErrorRef v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 882, v101, v102, *(const void **)&v245.st_dev, v103, @"Failed to make dest path for file %s", v104, (char)v98);
          CFTypeRef v175 = *(CFTypeRef *)&v245.st_dev;
          if (!*(void *)&v245.st_dev) {
            goto LABEL_234;
          }
          goto LABEL_201;
        }
        size_t v105 = v84;
        mode_t v106 = (mode_t)v285[0];
        if (!LOWORD(v285[0]))
        {
          CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 889, v101, v102, 0, v103, @"Entity does not exist at file location in dest path %s", v104, (char)to);
          goto LABEL_233;
        }
        if (snprintf((char *)cf, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
        {
          CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 894, v107, v108, 0, v109, @"failed to make newfile path: %s.XXXXXXX", v110, (char)to);
          goto LABEL_233;
        }
        int v111 = mkstemp((char *)cf);
        if (v111 == -1)
        {
          v186 = __error();
          strerror(*v186);
          CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 899, v187, v188, 0, v189, @"mktemp failed for %s : %s", v190, (char)cf);
          goto LABEL_233;
        }
        int v112 = v111;
        v113 = v92->fts_path;
        bzero(__str, 0x400uLL);
        if (v14 && !_utf_aware_strcmp(v113, v14))
        {
          if (snprintf(__str, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
          {
            CFErrorRef v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 914, v137, v138, 0, v139, @"failed to make newfile path: %s.XXXXXXX", v140, (char)to);
            goto LABEL_212;
          }
          LOBYTE(v290) = 0;
          if (!MIMachOCreateHiddenArchsExecutableIfNeeded(v14, __str, &v290))
          {
            CFStringRef v193 = @"Failed to create hidden archs executable";
            int v194 = 920;
LABEL_207:
            CFErrorRef v191 = _CreateAndLogDMError("hardlink_copy_hierarchy", v194, v141, v142, 0, v143, v193, v144, (char)fts_path);
LABEL_208:
            CFErrorRef v46 = v191;
            goto LABEL_211;
          }
          BOOL v114 = (_BYTE)v290 != 0;
          if ((_BYTE)v290) {
            v113 = __str;
          }
        }
        else
        {
          BOOL v114 = 0;
        }
        if (patch_file(v113, (const char *)to, v112))
        {
          CFErrorRef v191 = _CreateAndLogDMError("hardlink_copy_hierarchy", 934, v145, v146, 0, v147, @"patch_file failed for:\n\t%s\n\t%s\n\t%s", v148, (char)v113);
          goto LABEL_208;
        }
        if (fchmod(v112, v106))
        {
          v192 = __error();
          fts_path = (std::__fs::filesystem::path *)cf;
          strerror(*v192);
          CFStringRef v193 = @"chmod failed for %s : %s";
          int v194 = 939;
          goto LABEL_207;
        }
        close(v112);
        rename((const std::__fs::filesystem::path *)cf, to, v149);
        if (v150)
        {
          v195 = __error();
          strerror(*v195);
          CFErrorRef v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 948, v196, v197, 0, v198, @"rename of %s to %s failed: %s", v199, (char)cf);
          int v112 = -1;
LABEL_211:
          v83 = v239;
LABEL_212:
          char v168 = 0;
          if (v83) {
            goto LABEL_235;
          }
          goto LABEL_236;
        }
        if (v114) {
          unlink(v113);
        }
        v83 = v239;
        size_t v84 = v105;
LABEL_137:
        v241 += v92->fts_statp->st_blocks;
LABEL_138:
        if (v99) {
          goto LABEL_139;
        }
LABEL_145:
        v92 = fts_read(v27);
        if (!v92) {
          goto LABEL_161;
        }
        break;
      case 4u:
      case 7u:
      case 0xAu:
        CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1078, v86, v87, 0, v89, @"FTS in %s returned an error %d for path '%s'", v91, (char)"hardlink_copy_hierarchy");
        goto LABEL_233;
      case 6u:
        LOWORD(cf[0]) = 0;
        if (!make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)cf, 0)) {
          goto LABEL_138;
        }
        if (((uint64_t)cf[0] & 0xF000) == 0x4000 && (int st_mode = v92->fts_statp->st_mode, st_mode != LOWORD(cf[0])))
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            fts_path = to;
            MOLogWrite();
            LOWORD(st_mode) = v92->fts_statp->st_mode;
          }
          if (chmod((const char *)to, st_mode))
          {
            v155 = __error();
            strerror(*v155);
            CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1060, v156, v157, 0, v158, @"chmod of '%s' failed: %s", v159, (char)to);
            goto LABEL_233;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          LOBYTE(fts_path) = cf[0];
          MOLogWrite();
        }
        goto LABEL_138;
      case 0xCu:
      case 0xDu:
        if (v99 && (v281 == 43 || v281 == 45)) {
          goto LABEL_137;
        }
        LOWORD(v245.st_dev) = 0;
        *(void *)__str = 0;
        if (make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)&v245, (CFErrorRef *)__str))
        {
          if (LOWORD(v245.st_dev))
          {
            CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 855, v115, v116, 0, v117, @"Entity with mode 0%o exists at symlink location in dest path %s", v118, v245.st_dev);
            goto LABEL_233;
          }
          uint64_t v119 = gLogHandle;
          if (gLogHandle)
          {
            p_fts_path = (const char **)&v92->fts_path;
            v120 = v92->fts_path;
            if (*(int *)(gLogHandle + 44) <= 6
              || (fts_path = (std::__fs::filesystem::path *)v92->fts_path,
                  MOLogWrite(),
                  uint64_t v119 = gLogHandle,
                  v120 = *p_fts_path,
                  gLogHandle))
            {
              if (*(int *)(v119 + 44) >= 7)
              {
                LOBYTE(fts_path) = (_BYTE)v120;
                MOLogWrite();
              }
            }
          }
          else
          {
            p_fts_path = (const char **)&v92->fts_path;
            v120 = v92->fts_path;
          }
          ssize_t v135 = readlink(v120, (char *)cf, 0x400uLL);
          if (v135 < 0)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
LABEL_198:
              v185 = __error();
              strerror(*v185);
              MOLogWrite();
            }
LABEL_199:
            CFErrorRef v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 862, v136, v87, 0, v89, @"Failed to copy symlink %s to %s", v91, (char)*p_fts_path);
            goto LABEL_233;
          }
          *((unsigned char *)cf + v135) = 0;
          if (symlink((const char *)cf, (const char *)to))
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
              goto LABEL_198;
            }
            goto LABEL_199;
          }
          goto LABEL_137;
        }
        CFErrorRef v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 848, v115, v116, *(const void **)__str, v117, @"Failed to make dest path for symlink %s", v118, (char)v98);
        CFTypeRef v175 = *(CFTypeRef *)__str;
        if (*(void *)__str) {
          goto LABEL_201;
        }
LABEL_234:
        char v168 = 0;
        int v112 = -1;
        if (v83) {
          goto LABEL_235;
        }
LABEL_236:
        fts_close(v27);
        if ((v112 & 0x80000000) == 0) {
          close(v112);
        }
        if (v168) {
          return 1;
        }
LABEL_24:
        if (a10)
        {
          uint64_t result = 0;
          *a10 = v46;
        }
        else
        {
          if (v46) {
            CFRelease(v46);
          }
          return 0;
        }
        return result;
      default:
        goto LABEL_138;
    }
  }
}

uint64_t __hardlink_copy_hierarchy_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _utf_aware_strcmp((char *)(*(void *)a2 + 104), (const char *)(*(void *)a3 + 104));
}

uint64_t _utf_aware_strcmp(char *cStr, const char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  CFStringRef v5 = CFStringCreateWithCString(v3, a2, 0x8000100u);
  bzero(buffer, 0x400uLL);
  bzero(__s2, 0x400uLL);
  if (!CFStringGetFileSystemRepresentation(v4, buffer, 1024)
    || !CFStringGetFileSystemRepresentation(v5, __s2, 1024))
  {
    uint64_t v6 = 0xFFFFFFFFLL;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v6 = strcmp(buffer, __s2);
  if (v4) {
LABEL_6:
  }
    CFRelease(v4);
LABEL_7:
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

CFErrorRef _CreateAndLogDMError(const char *a1, int a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, const __CFString *a7, uint64_t a8, char a9)
{
  int valuePtr = a2;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFStringRef v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  CFDictionaryAddValue(Mutable, @"FunctionName", v13);
  if (v13) {
    CFRelease(v13);
  }
  CFNumberRef v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"SourceFileLine", v14);
  if (v14) {
    CFRelease(v14);
  }
  if (a5) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC88], a5);
  }
  CFStringRef v15 = CFStringCreateWithFormatAndArguments(0, 0, a7, &a9);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC70], v15);
  if (v15) {
    CFRelease(v15);
  }
  CFErrorRef v16 = CFErrorCreate(0, @"MIInstallerDeltaErrorDomain", 1, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v16;
}

uint64_t read_next_manifest_command(void *a1, unsigned __int8 *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v9 = a1[1];
  uint64_t v8 = a1[2];
  if (v8 >= v9) {
    read_next_manifest_command_cold_1();
  }
  if (v8 + 1 >= v9)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      LOBYTE(v31) = 1;
      MOLogWrite();
    }
    CFStringRef v26 = @"Failed to read command from manifest";
    int v27 = 508;
  }
  else
  {
    int v13 = *(unsigned __int8 *)(*a1 + v8);
    *a2 = v13;
    ++a1[2];
    BOOL v14 = (v13 - 43) > 0x33 || ((1 << (v13 - 43)) & 0x8000000040005) == 0;
    if (v14 && v13 != 120)
    {
      CFErrorRef v28 = _CreateAndLogDMError("read_next_manifest_command", 514, (uint64_t)a3, a4, 0, a6, @"Stream had invalid command: %hhu", a8, v13);
      goto LABEL_26;
    }
    char string_to_terminator = read_string_to_terminator(a1, 1, (uint64_t)(a2 + 1), 0x400uLL);
    int v20 = *a2;
    if ((string_to_terminator & 1) == 0)
    {
      CFErrorRef v28 = _CreateAndLogDMError("read_next_manifest_command", 520, v16, v17, 0, v18, @"Failed to read arg1 of command %hhu", v19, *a2);
      goto LABEL_26;
    }
    if (v20 != 61) {
      goto LABEL_12;
    }
    *(void *)__str = 0;
    uint64_t v33 = 0;
    char v35 = 0;
    uint64_t v34 = 0;
    if ((read_string_to_terminator(a1, 1, (uint64_t)__str, 0x19uLL) & 1) == 0)
    {
      CFErrorRef v28 = _CreateAndLogDMError("read_next_manifest_command", 528, v21, v22, 0, v23, @"Failed to read arg2 of command %hhu", v24, *a2);
      goto LABEL_26;
    }
    uint64_t v25 = strtoll(__str, 0, 10);
    *((void *)a2 + 129) = v25;
    if (v25)
    {
      int v20 = *a2;
LABEL_12:
      if (v20 != 120 || !strncmp((const char *)a2 + 1, "EOF", 3uLL)) {
        return 1;
      }
      CFStringRef v26 = @"Got malformed EOF marker";
      int v27 = 542;
      goto LABEL_25;
    }
    uint64_t v31 = __str;
    CFStringRef v26 = @"Invalid touch time \"%s\" found for path \"%s\"";
    int v27 = 535;
  }
LABEL_25:
  CFErrorRef v28 = _CreateAndLogDMError("read_next_manifest_command", v27, (uint64_t)a3, a4, 0, a6, v26, a8, (char)v31);
LABEL_26:
  if (a3)
  {
    uint64_t v29 = 0;
    *a3 = v28;
  }
  else
  {
    if (v28) {
      CFRelease(v28);
    }
    return 0;
  }
  return v29;
}

uint64_t realpath_parent_no_symlink(const char *a1, char *a2, mode_t *a3, CFErrorRef *a4)
{
  size_t v8 = strlen(a1);
  size_t v13 = v8 - 1;
  if (a1[v8 - 1] == 47)
  {
    a1[v13] = 0;
    size_t v13 = v8 - 2;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
LABEL_6:
    char v30 = (char)a1;
    CFStringRef v14 = @"Failed to find parent of '%s'";
    int v15 = 588;
LABEL_7:
    CFErrorRef v16 = _CreateAndLogDMError("realpath_parent_no_symlink", v15, v9, v10, 0, v11, v14, v12, v30);
    goto LABEL_8;
  }
  while (a1[v13] != 47)
  {
    if (&a1[--v13] < a1) {
      goto LABEL_6;
    }
  }
  if (v13)
  {
    uint64_t v18 = (char *)&a1[v13];
    a1[v13] = 0;
    if (!realpath_DARWIN_EXTSN(a1, a2))
    {
      uint64_t v24 = __error();
      strerror(*v24);
      CFErrorRef v16 = _CreateAndLogDMError("realpath_parent_no_symlink", 599, v25, v26, 0, v27, @"realpath of '%s' failed at element '%s': %s", v28, (char)a1);
      char *v18 = 47;
      if (a4) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
    char *v18 = 47;
    if (strlcat(a2, v18, 0x400uLL) >= 0x400)
    {
      CFStringRef v14 = @"Path was too long";
      int v15 = 608;
      goto LABEL_7;
    }
  }
  else
  {
    strlcpy(a2, a1, 0x400uLL);
  }
  memset(&v31, 0, sizeof(v31));
  if (lstat(a2, &v31))
  {
    mode_t st_mode = 0;
LABEL_23:
    *a3 = st_mode;
    return 1;
  }
  mode_t st_mode = v31.st_mode;
  if ((v31.st_mode & 0xF000) != 0xA000) {
    goto LABEL_23;
  }
  CFErrorRef v16 = _CreateAndLogDMError("realpath_parent_no_symlink", 618, v19, v20, 0, v21, @"Found symlink at destination path \"%s\"; this is not allowed.",
          v22,
          (char)a2);
LABEL_8:
  if (a4)
  {
LABEL_9:
    uint64_t v17 = 0;
    *a4 = v16;
    return v17;
  }
LABEL_18:
  if (v16) {
    CFRelease(v16);
  }
  return 0;
}

uint64_t make_and_check_dest_path(const char *a1, const char *a2, char *a3, mode_t *a4, CFErrorRef *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  bzero(__str, 0x400uLL);
  if (snprintf(__str, 0x400uLL, "%s/%s", a1, a2) < 0x400)
  {
    CFTypeRef cf = 0;
    if ((realpath_parent_no_symlink(__str, a3, a4, (CFErrorRef *)&cf) & 1) == 0)
    {
      CFErrorRef v23 = _CreateAndLogDMError("make_and_check_dest_path", 701, v15, v16, cf, v17, @"Failed to realpath parent of %s", v18, (char)__str);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      goto LABEL_7;
    }
    if (!_utf_aware_strcmp(__str, a3)) {
      return 1;
    }
    CFErrorRef v14 = _CreateAndLogDMError("make_and_check_dest_path", 709, v19, v20, 0, v21, @"realpath'd destpath '%s' is different from non-realpath '%s'", v22, (char)a3);
  }
  else
  {
    CFErrorRef v14 = _CreateAndLogDMError("make_and_check_dest_path", 695, v10, v11, 0, v12, @"Dest path '%s/%s' was too long", v13, (char)a1);
  }
  CFErrorRef v23 = v14;
LABEL_7:
  if (a5)
  {
    uint64_t result = 0;
    *a5 = v23;
  }
  else
  {
    if (v23) {
      CFRelease(v23);
    }
    return 0;
  }
  return result;
}

uint64_t read_string_to_terminator(void *a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1[2];
  if (v4 >= a1[1]) {
    read_string_to_terminator_cold_1();
  }
  if (!a4) {
    return 0;
  }
  unint64_t v5 = 0;
  while (1)
  {
    int v6 = *(unsigned __int8 *)(*a1 + v4);
    a1[2] = v4 + 1;
    int v7 = v6 == 9 ? a2 : 0;
    if (v6 == 10 || v7 != 0) {
      break;
    }
    *(unsigned char *)(a3 + v5++) = v6;
    uint64_t v4 = a1[2];
    if (v4 >= a1[1] || v5 >= a4) {
      return 0;
    }
  }
  *(unsigned char *)(a3 + v5) = 0;
  return 1;
}

uint64_t validate_supported_devices(void *a1, const __CFArray *a2, CFErrorRef *a3)
{
  uint64_t v10 = malloc_type_calloc(1uLL, 0x800uLL, 0x30FCD377uLL);
  if (!v10)
  {
    CFStringRef v34 = @"Failed to malloc buffer for line";
    int v35 = 200;
LABEL_23:
    CFErrorRef v36 = _CreateAndLogDMError("validate_supported_devices", v35, v6, v7, 0, v8, v34, v9, v44);
    free(v10);
    goto LABEL_24;
  }
  if ((read_string_to_terminator(a1, 0, (uint64_t)v10, 0x800uLL) & 1) == 0)
  {
    CFStringRef v34 = @"Failed to read supported devices from stream";
    int v35 = 205;
    goto LABEL_23;
  }
  if (!*v10)
  {
    if (!a2)
    {
      free(v10);
      return 1;
    }
    CFStringRef v34 = @"Existing app lists supported devices but there were none in the manifest";
    int v35 = 211;
    goto LABEL_23;
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, 0x8000100u);
  if (!v12)
  {
    CFStringRef v34 = @"Failed to create patch supported devices string";
    int v35 = 222;
    goto LABEL_23;
  }
  CFStringRef v13 = v12;
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v11, v12, @" ");
  CFArrayRef v19 = ArrayBySeparatingStrings;
  if (!ArrayBySeparatingStrings || !CFArrayGetCount(ArrayBySeparatingStrings))
  {
    CFErrorRef v38 = _CreateAndLogDMError("validate_supported_devices", 228, v15, v16, 0, v17, @"Failed to split patch supported devices string", v18, v44);
LABEL_32:
    CFErrorRef v36 = v38;
    free(v10);
    char v39 = 0;
    Mutable = 0;
    uint64_t v22 = 0;
    goto LABEL_42;
  }
  if (!a2)
  {
    CFErrorRef v38 = _CreateAndLogDMError("validate_supported_devices", 234, v15, v16, 0, v17, @"Target app had no supported devices but patch did: %@", v18, (char)v19);
    goto LABEL_32;
  }
  CFStringRef v45 = v13;
  uint64_t v20 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  Mutable = CFArrayCreateMutable(v11, 0, MEMORY[0x263EFFF70]);
  uint64_t v22 = CFArrayCreateMutable(v11, 0, v20);
  uint64_t Count = CFArrayGetCount(a2);
  uint64_t v24 = CFArrayGetCount(v19);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
      v46.location = 0;
      v46.length = v24;
      if (!CFArrayContainsValue(v19, v46, ValueAtIndex)) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }
  if (v24 >= 1)
  {
    for (CFIndex j = 0; j != v24; ++j)
    {
      uint64_t v28 = CFArrayGetValueAtIndex(v19, j);
      v47.location = 0;
      v47.length = Count;
      if (!CFArrayContainsValue(a2, v47, v28)) {
        CFArrayAppendValue(v22, v28);
      }
    }
  }
  if (Mutable && CFArrayGetCount(Mutable))
  {
    CFErrorRef v33 = _CreateAndLogDMError("validate_supported_devices", 242, v29, v30, 0, v31, @"Expected supported devices had devices that were not in patch: %@", v32, (char)Mutable);
  }
  else
  {
    if (!v22 || !CFArrayGetCount(v22))
    {
      CFErrorRef v36 = 0;
      char v39 = 1;
      goto LABEL_41;
    }
    CFErrorRef v33 = _CreateAndLogDMError("validate_supported_devices", 247, v40, v41, 0, v42, @"Patch listed devices that were not in expected supported devices: %@", v43, (char)v22);
  }
  CFErrorRef v36 = v33;
  char v39 = 0;
LABEL_41:
  CFStringRef v13 = v45;
  free(v10);
LABEL_42:
  CFRelease(v13);
  if (v19) {
    CFRelease(v19);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v39) {
    return 1;
  }
LABEL_24:
  if (a3)
  {
    uint64_t result = 0;
    *a3 = v36;
  }
  else
  {
    if (v36) {
      CFRelease(v36);
    }
    return 0;
  }
  return result;
}

id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    uint64_t v19 = [v17 mutableCopy];
  }
  else {
    uint64_t v19 = objc_opt_new();
  }
  uint64_t v20 = (void *)v19;
  if (v18)
  {
    uint64_t v21 = (void *)[[NSString alloc] initWithFormat:v18 arguments:a8];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  uint64_t v22 = [NSString stringWithUTF8String:a1];
  [v20 setObject:v22 forKeyedSubscript:@"FunctionName"];

  CFErrorRef v23 = [NSNumber numberWithInt:a2];
  [v20 setObject:v23 forKeyedSubscript:@"SourceFileLine"];

  uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:v15 code:a4 userInfo:v20];

  return v24;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

id _CreateAndLogError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

id _CreateAndLogErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a5;
  id v16 = _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  id v17 = [v16 userInfo];
  uint64_t v18 = *MEMORY[0x263F08320];
  uint64_t v19 = [v17 objectForKeyedSubscript:*MEMORY[0x263F08320]];

  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v20 = [v15 domain];
      [v15 code];
      uint64_t v21 = [v15 userInfo];
      CFErrorRef v23 = [v21 objectForKeyedSubscript:v18];
      MOLogWrite();
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return v16;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1 = a1;
  v2 = [v1 domain];
  if ([v2 isEqualToString:@"MIInstallerErrorDomain"]
    && [v1 code] == 12)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v4 = [v1 domain];
    if ([v4 isEqualToString:@"MIInstallerErrorDomain"]
      && [v1 code] == 11)
    {
      BOOL v3 = 1;
    }
    else
    {
      unint64_t v5 = [v1 domain];
      if ([v5 isEqualToString:@"MIInstallerErrorDomain"]) {
        BOOL v3 = [v1 code] == 35;
      }
      else {
        BOOL v3 = 0;
      }
    }
  }

  return v3;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    v2 = [NSString stringWithUTF8String:v0];
    free(v1);
  }
  else
  {
    v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }

  return v2;
}

uint64_t patchFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t buf = 0;
  unint64_t v35 = 0;
  uint64_t v36 = 0;
  if ((*(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t, void))(a3 + 16))(a3, 3, &v37, 32, 0) != 32)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      return 0;
    }
LABEL_34:
    uint64_t v27 = __error();
    strerror(*v27);
LABEL_37:
    MOLogWrite();
    return 0;
  }
  if ((void)v37 != 0x3034464649445342)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      return 0;
    }
    goto LABEL_37;
  }
  uint64_t v9 = BZOpen(a3, 4, a4, 32);
  if (!v9)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      return 0;
    }
    goto LABEL_34;
  }
  uint64_t v10 = v9;
  CFAllocatorRef v11 = BZOpen(a3, 5, a4, *((void *)&v37 + 1) + 32);
  if (!v11)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v29 = __error();
      strerror(*v29);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_84;
  }
  CFStringRef v12 = v11;
  CFStringRef v13 = BZOpen(a3, 6, a4, *((void *)&v37 + 1) + v38 + 32);
  if (!v13)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v30 = __error();
      strerror(*v30);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_83;
  }
  CFErrorRef v14 = v13;
  id v15 = malloc_type_malloc(0x10000uLL, 0xBA17AE47uLL);
  if (!v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v31 = __error();
      strerror(*v31);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_82;
  }
  id v16 = v15;
  id v17 = malloc_type_malloc(0x10000uLL, 0xCE350E8DuLL);
  if (!v17)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v32 = __error();
      strerror(*v32);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_81;
  }
  uint64_t v18 = v17;
  if (!*((void *)&v38 + 1))
  {
    uint64_t v26 = 1;
    goto LABEL_80;
  }
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v33 = (uint64_t)v12;
  while (1)
  {
    if (BZRead((uint64_t)v10, &buf, 24) != 24)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_79;
      }
      goto LABEL_78;
    }
    if (v36 < 0) {
      uint64_t v36 = -(v36 & 0x7FFFFFFFFFFFFFFFLL);
    }
    unint64_t v21 = buf;
    if (buf) {
      break;
    }
LABEL_23:
    unint64_t v24 = v35;
    if (v35)
    {
      while (1)
      {
        uint64_t v25 = v24 >= 0x10000 ? 0x10000 : v24;
        if (v25 != (int)BZRead((uint64_t)v14, v18, v25)) {
          break;
        }
        if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))(a5, 2, v18, v25, v19) != v25)
        {
          CFStringRef v12 = (void *)v33;
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_79;
          }
          goto LABEL_78;
        }
        v19 += v25;
        v24 -= v25;
        if (!v24) {
          goto LABEL_30;
        }
      }
      CFStringRef v12 = (void *)v33;
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_79;
      }
LABEL_78:
      MOLogWrite();
LABEL_79:
      uint64_t v26 = 0;
      goto LABEL_80;
    }
LABEL_30:
    v20 += v36;
    uint64_t v26 = 1;
    CFStringRef v12 = (void *)v33;
    if (v19 >= *((void *)&v38 + 1)) {
      goto LABEL_80;
    }
  }
  while (1)
  {
    if (v21 >= 0x10000) {
      uint64_t v22 = 0x10000;
    }
    else {
      uint64_t v22 = v21;
    }
    if ((*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t))(a1 + 16))(a1, 1, v16, v22, v20) != v22)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        goto LABEL_68;
      }
      goto LABEL_69;
    }
    if (v22 != (int)BZRead(v33, v18, v22))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        goto LABEL_68;
      }
      goto LABEL_69;
    }
    uint64_t v23 = 0;
    do
    {
      *((unsigned char *)v18 + v23) += v16[v23];
      ++v23;
    }
    while (v22 != v23);
    if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))(a5, 2, v18, v22, v19) != v22)break; {
    v20 += v22;
    }
    v19 += v22;
    v21 -= v22;
    if (!v21) {
      goto LABEL_23;
    }
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
LABEL_68:
  }
    MOLogWrite();
LABEL_69:
  uint64_t v26 = 0;
  CFStringRef v12 = (void *)v33;
LABEL_80:
  free(v18);
LABEL_81:
  free(v16);
LABEL_82:
  BZClose(v14);
LABEL_83:
  BZClose(v12);
LABEL_84:
  BZClose(v10);
  return v26;
}

void *BZOpen(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int bzerror = 0;
  uint64_t v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040A4FBEE0AuLL);
  uint64_t v9 = v8;
  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
LABEL_12:
    CFStringRef v12 = __error();
    strerror(*v12);
LABEL_13:
    MOLogWrite();
LABEL_14:
    BZClose(v9);
    return 0;
  }
  *(_DWORD *)uint64_t v8 = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a1;
  uint64_t v10 = funopen(v8, (int (__cdecl *)(void *, char *, int))_fh_read, 0, 0, 0);
  v9[4] = v10;
  if (!v10)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  CFAllocatorRef v11 = BZ2_bzReadOpen(&bzerror, v10, 0, 0, 0, 0);
  v9[5] = v11;
  if (!v11)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  return v9;
}

uint64_t BZRead(uint64_t a1, void *buf, int len)
{
  int bzerror = 0;
  uint64_t result = BZ2_bzRead(&bzerror, *(BZFILE **)(a1 + 40), buf, len);
  if ((bzerror & 0xFFFFFFFB) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

void BZClose(void *a1)
{
  int bzerror = 0;
  if (a1)
  {
    v2 = (BZFILE *)a1[5];
    if (v2) {
      BZ2_bzReadClose(&bzerror, v2);
    }
    BOOL v3 = (FILE *)a1[4];
    if (v3) {
      fclose(v3);
    }
    free(a1);
  }
}

uint64_t patch_file(const char *a1, const char *a2, int a3)
{
  memset(&v22, 0, sizeof(v22));
  memset(&v21, 0, sizeof(v21));
  int v5 = open(a1, 256);
  if (v5 != -1)
  {
    int v6 = v5;
    if (fstat(v5, &v22) == -1)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_17;
      }
    }
    else
    {
      int v7 = open(a2, 256);
      if (v7 != -1)
      {
        int v8 = v7;
        if (fstat(v7, &v21) == -1)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_24;
          }
          CFStringRef v13 = __error();
          strerror(*v13);
        }
        else
        {
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 0x40000000;
          v19[2] = __patch_file_block_invoke;
          v19[3] = &__block_descriptor_tmp_0;
          int v20 = v6;
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 0x40000000;
          v17[2] = __patch_file_block_invoke_2;
          v17[3] = &__block_descriptor_tmp_42;
          int v18 = v8;
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 0x40000000;
          v15[2] = __patch_file_block_invoke_3;
          v15[3] = &__block_descriptor_tmp_44;
          int v16 = a3;
          if (patchFile((uint64_t)v19, v9, (uint64_t)v17, v21.st_size, (uint64_t)v15))
          {
            uint64_t v10 = 0;
LABEL_25:
            close(v8);
            goto LABEL_26;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_24:
            uint64_t v10 = 0xFFFFFFFFLL;
            goto LABEL_25;
          }
        }
        MOLogWrite();
        goto LABEL_24;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_17:
        uint64_t v10 = 0xFFFFFFFFLL;
LABEL_26:
        close(v6);
        return v10;
      }
    }
    CFStringRef v12 = __error();
    strerror(*v12);
    MOLogWrite();
    goto LABEL_17;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    CFAllocatorRef v11 = __error();
    strerror(*v11);
    MOLogWrite();
  }
  return 0xFFFFFFFFLL;
}

ssize_t __patch_file_block_invoke(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t __patch_file_block_invoke_2(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t __patch_file_block_invoke_3(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pwrite(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

uint64_t _fh_read(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
  if (result == -1) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 16) += result;
  return result;
}

__CFString *MICopyProcessNameForPid()
{
  int v0 = MEMORY[0x270FA5388]();
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v1 = proc_pidpath(v0, buffer, 0x1000u);
  if (v1 < 1)
  {
    BOOL v3 = @"Unknown Process Name";
  }
  else
  {
    v2 = (void *)[[NSString alloc] initWithBytes:buffer length:v1 encoding:4];
    BOOL v3 = [v2 lastPathComponent];
  }

  return v3;
}

id MIFetchInfoForUsername(const char *a1, uid_t *a2, gid_t *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (sysconf(71) == -1) {
    MIFetchInfoForUsername_cold_1(&v15, v20);
  }
  uint64_t v8 = MEMORY[0x270FA5388]();
  memset(&v15, 0, sizeof(v15));
  CFErrorRef v14 = 0;
  id result = (id)getpwnam_r(a1, &v15, (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v9, &v14);
  if (result)
  {
    uint64_t v13 = 0;
    memset(v20, 0, sizeof(v20));
    int v11 = (int)result;
    os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    CFStringRef v12 = strerror(v11);
    int v16 = 136315394;
    id v17 = a1;
    __int16 v18 = 2080;
    unint64_t v19 = v12;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_13:
    MIFetchInfoForUsername_cold_2(&v16, v20);
  }
  if (!v14) {
    goto LABEL_13;
  }
  if (a2) {
    *a2 = v15.pw_uid;
  }
  if (a3) {
    *a3 = v15.pw_gid;
  }
  if (a4)
  {
    id result = [NSURL fileURLWithFileSystemRepresentation:v15.pw_dir isDirectory:1 relativeToURL:0];
    *a4 = result;
  }
  return result;
}

uint64_t MIFetchInfoForUID(uint64_t a1, void *a2, gid_t *a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (sysconf(71) == -1)
  {
    int v19 = *__error();
    int v20 = (void *)*MEMORY[0x263F08438];
    uint64_t v21 = v19;
    stat v22 = strerror(v19);
    id v17 = _CreateError((uint64_t)"MIFetchInfoForUID", 140, v20, v21, 0, 0, @"Failed to get home dir path size: %s", v23, (uint64_t)v22);
    uint64_t v18 = 0;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v10 = MEMORY[0x270FA5388]();
  memset(&v27, 0, sizeof(v27));
  uint64_t v26 = 0;
  int v12 = getpwuid_r(a1, &v27, (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, &v26);
  if (v12)
  {
    CFErrorRef v14 = (void *)*MEMORY[0x263F08438];
    uint64_t v15 = v12;
    strerror(v12);
    _CreateError((uint64_t)"MIFetchInfoForUID", 150, v14, v15, 0, 0, @"getpwuid_r failed for uid %d : %s", v16, a1);
    id v17 = LABEL_4:;
    uint64_t v18 = 0;
    goto LABEL_5;
  }
  if (!v26)
  {
    _CreateError((uint64_t)"MIFetchInfoForUID", 155, (void *)*MEMORY[0x263F08438], 2, 0, 0, @"getpwuid_r succeeded but no user was found with uid %d", v13, a1);
    goto LABEL_4;
  }
  if (a2)
  {
    *a2 = [NSString stringWithUTF8String:v27.pw_name];
  }
  if (a3) {
    *a3 = v27.pw_gid;
  }
  if (a4)
  {
    uint64_t v18 = 1;
    [NSURL fileURLWithFileSystemRepresentation:v27.pw_dir isDirectory:1 relativeToURL:0];
    id v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
    uint64_t v18 = 1;
  }
LABEL_5:
  if (!a5) {
    goto LABEL_10;
  }
LABEL_8:
  if ((v18 & 1) == 0) {
    *a5 = v17;
  }
LABEL_10:

  return v18;
}

void MIGetCurrentMobileUserInfo(_DWORD *a1, _DWORD *a2)
{
  if (MIGetCurrentMobileUserInfo_onceToken != -1) {
    dispatch_once(&MIGetCurrentMobileUserInfo_onceToken, &__block_literal_global_0);
  }
  *a1 = MIGetCurrentMobileUserInfo_uid;
  *a2 = MIGetCurrentMobileUserInfo_gid;
}

id __MIGetCurrentMobileUserInfo_block_invoke()
{
  return MIFetchInfoForUsername("mobile", (uid_t *)&MIGetCurrentMobileUserInfo_uid, (gid_t *)&MIGetCurrentMobileUserInfo_gid, 0);
}

uint64_t MIAssumeIdentityOfUsername(const char *a1, void *a2)
{
  uint64_t v4 = 0;
  MIFetchInfoForUsername(a1, (uid_t *)&v4 + 1, (gid_t *)&v4, 0);
  return MIAssumeIdentity(HIDWORD(v4), v4, a2);
}

uint64_t MIAssumeIdentity(uint64_t a1, gid_t a2, void *a3)
{
  if (!(a2 | a1))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      MIAssumeIdentity_cold_1();
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  id v19 = 0;
  id v20 = 0;
  int v6 = MIFetchInfoForUID(a1, &v20, 0, 0, &v19);
  id v7 = v20;
  id v8 = v19;
  if (v6)
  {
    if (pthread_setugid_np(a1, a2))
    {
      size_t v9 = __error();
      uint64_t v10 = (void *)*MEMORY[0x263F08438];
      uint64_t v18 = *v9;
      strerror(*v9);
      _CreateAndLogError((uint64_t)"MIAssumeIdentity", 228, v10, v18, 0, 0, @"pthread_setugid_np failed for uid %d gid %d; error %d (%s)",
        v11,
        a1);
    }
    else
    {
      if (!initgroups((const char *)[v7 UTF8String], a2))
      {
        uint64_t v16 = 1;
        goto LABEL_16;
      }
      uint64_t v12 = *__error();
      MIRestoreIdentity();
      uint64_t v13 = (void *)*MEMORY[0x263F08438];
      strerror(v12);
      _CreateAndLogError((uint64_t)"MIAssumeIdentity", 238, v13, v12, 0, 0, @"SYS_initgroups failed; error %d (%s)",
        v14,
        v12);
    uint64_t v15 = };

    id v8 = (id)v15;
  }
  if (a3)
  {
    id v8 = v8;
    uint64_t v16 = 0;
    *a3 = v8;
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_16:

  return v16;
}

uint64_t MIRestoreIdentity()
{
  uid_t v0 = getuid();
  if (!(v0 | getgid()))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      MIRestoreIdentity_cold_1();
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  uint64_t result = pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if (result)
  {
    int v2 = *__error();
    os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    strerror(v2);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  return result;
}

uint64_t MIAssumeMobileIdentity(void *a1)
{
  if (MIGetCurrentMobileUserInfo_onceToken != -1) {
    dispatch_once(&MIGetCurrentMobileUserInfo_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = MIGetCurrentMobileUserInfo_uid;
  gid_t v3 = MIGetCurrentMobileUserInfo_gid;

  return MIAssumeIdentity(v2, v3, a1);
}

id MILoadInfoPlist(void *a1, void *a2)
{
  return MILoadInfoPlistWithError(a1, a2, 0);
}

id MILoadInfoPlistWithError(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v24 = 0;
  id v7 = (__CFBundle *)_CreateCFBundle(v5, 0, &v24);
  id v8 = v24;
  if (!v7)
  {
    uint64_t v13 = 0;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v6)
  {
    uint64_t FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist();
    if (FilteredInfoPlist)
    {
      uint64_t v11 = (const void *)FilteredInfoPlist;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v11))
      {
        uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v11];
        CFRelease(v11);
      }
      else
      {
        CFTypeID v17 = CFGetTypeID(v11);
        CFStringRef v18 = CFCopyTypeIDDescription(v17);
        uint64_t v20 = _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 363, @"MIInstallerErrorDomain", 3, 0, 0, @"Object returned from _CFBundleCreateFilteredInfoPlist was not a dictionary, was type %@", v19, (uint64_t)v18);

        if (v18) {
          CFRelease(v18);
        }
        CFRelease(v11);
        uint64_t v13 = 0;
        id v8 = (id)v20;
      }
      goto LABEL_17;
    }
    uint64_t v16 = _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 357, @"MIInstallerErrorDomain", 3, 0, 0, @"Failed to get filtered Info.plist with keys %@ from bundle %@", v10, (uint64_t)v6);

LABEL_16:
    uint64_t v13 = 0;
    id v8 = (id)v16;
    goto LABEL_17;
  }
  CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v7);
  if (!InfoDictionary)
  {
    uint64_t v21 = [v5 path];
    uint64_t v16 = _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 378, @"MIInstallerErrorDomain", 35, 0, 0, @"CFBundleGetInfoDictionary failed for bundle at %@", v22, (uint64_t)v21);

    goto LABEL_16;
  }
  uint64_t v15 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:InfoDictionary];
  uint64_t v13 = v15;
  if (v15) {
    [v15 removeObjectForKey:@"CFBundleInfoPlistURL"];
  }
LABEL_17:
  CFRelease(v7);
  if (!a3) {
    goto LABEL_20;
  }
LABEL_18:
  if (!v13) {
    *a3 = v8;
  }
LABEL_20:

  return v13;
}

const void *_CreateCFBundle(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t Unique = _CFBundleCreateUnique();
  if (!Unique)
  {
    uint64_t v12 = [v5 path];
    _CreateAndLogError((uint64_t)"_CreateCFBundle", 296, @"MIInstallerErrorDomain", 3, 0, 0, @"Failed to create CFBundle for %@", v13, (uint64_t)v12);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = 0;
    if (!a3)
    {
LABEL_23:
      id v7 = 0;
      goto LABEL_24;
    }
LABEL_11:
    id v11 = v11;
    id v7 = 0;
    *a3 = v11;
    goto LABEL_24;
  }
  id v7 = (const void *)Unique;
  id v8 = (id)_CFBundleCopyInfoPlistURL();
  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      uint64_t v26 = v7;
      MOLogWrite();
    }
    [v5 URLByAppendingPathComponent:@"Info.plist" isDirectory:0, v26];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  size_t v9 = +[MIFileManager defaultManager];
  id v28 = 0;
  char v10 = [v9 itemIsFileAtURL:v8 error:&v28];
  id v11 = v28;

  if ((v10 & 1) == 0)
  {
    uint64_t v14 = [v11 domain];
    uint64_t v15 = *MEMORY[0x263F08438];
    if ([v14 isEqualToString:*MEMORY[0x263F08438]])
    {
      uint64_t v16 = [v11 code];

      if (v16 == 2)
      {
        CFTypeID v17 = [v8 path];
        _CreateAndLogError((uint64_t)"_CreateCFBundle", 310, @"MIInstallerErrorDomain", 35, v11, 0, @"Info.plist missing at %@", v18, (uint64_t)v17);
        goto LABEL_22;
      }
    }
    else
    {
    }
    uint64_t v19 = [v11 domain];
    if ([v19 isEqualToString:v15])
    {
      uint64_t v20 = [v11 code];

      if (v20 == 22)
      {
        CFTypeID v17 = [v8 path];
        uint64_t v27 = (uint64_t)v17;
        uint64_t v22 = @"Expected Info.plist file at %@ but found something that was not a file.";
        uint64_t v23 = 312;
LABEL_21:
        _CreateAndLogError((uint64_t)"_CreateCFBundle", v23, @"MIInstallerErrorDomain", 3, v11, 0, v22, v21, v27);
        uint64_t v24 = LABEL_22:;

        CFRelease(v7);
        id v11 = (id)v24;
        if (!a3) {
          goto LABEL_23;
        }
        goto LABEL_11;
      }
    }
    else
    {
    }
    CFTypeID v17 = [v8 path];
    uint64_t v27 = (uint64_t)v17;
    uint64_t v22 = @"Error when introspecting %@";
    uint64_t v23 = 314;
    goto LABEL_21;
  }
  if (a2)
  {
    id v8 = v8;
    *a2 = v8;
  }
LABEL_24:

  return v7;
}

id MILoadRawInfoPlist(void *a1, void *a2)
{
  id v11 = 0;
  id v12 = 0;
  gid_t v3 = _CreateCFBundle(a1, &v12, &v11);
  id v4 = v12;
  id v5 = v11;
  if (v3)
  {
    id v10 = v5;
    id v6 = [NSDictionary MI_dictionaryWithContentsOfURL:v4 options:0 error:&v10];
    id v7 = v10;

    id v8 = (void *)[v6 mutableCopy];
    CFRelease(v3);
    id v5 = v7;
    if (!a2) {
      goto LABEL_7;
    }
  }
  else
  {
    id v8 = 0;
    if (!a2) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a2 = v5;
  }
LABEL_7:

  return v8;
}

void MIRecordCurrentBuildVersion(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)_CFCopySystemVersionDictionary();
  id v7 = 0;
  char v3 = [v2 MI_writeToURL:v1 format:200 options:268435457 error:&v7];
  id v4 = v7;
  if (v3)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v5 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];
      id v6 = [v2 objectForKeyedSubscript:@"ReleaseType"];
      MOLogWrite();

LABEL_8:
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v5 = [v1 path];
    MOLogWrite();
    goto LABEL_8;
  }
}

uint64_t MIIsBuildUpgrade(uint64_t a1, void *a2)
{
  char v3 = [NSDictionary dictionaryWithContentsOfURL:a1];
  id v4 = v3;
  if (!v3)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
      goto LABEL_16;
    }
LABEL_15:
    MOLogWrite();
LABEL_16:
    id v12 = 0;
    uint64_t v13 = 0;
    size_t v9 = 0;
    id v11 = 0;
    id v7 = 0;
    goto LABEL_26;
  }
  uint64_t v5 = *MEMORY[0x263EFFAB0];
  uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];
  if (!v6)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v7 = (id)v6;
  id v8 = (void *)_CFCopySystemVersionDictionary();
  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v12 = 0;
    uint64_t v13 = 0;
    size_t v9 = 0;
    goto LABEL_25;
  }
  size_t v9 = v8;
  uint64_t v10 = [v8 objectForKeyedSubscript:v5];
  if (!v10)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v12 = 0;
    uint64_t v13 = 0;
LABEL_25:
    id v11 = 0;
    goto LABEL_26;
  }
  id v11 = (void *)v10;
  id v12 = [v4 objectForKeyedSubscript:@"ReleaseType"];
  uint64_t v13 = [v9 objectForKeyedSubscript:@"ReleaseType"];
  if ([v7 isEqual:v11])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
    uint64_t v14 = 0;
    goto LABEL_29;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
    MOLogWrite();
  }
LABEL_26:
  if (a2)
  {
    id v7 = v7;
    *a2 = v7;
  }
  uint64_t v14 = 1;
LABEL_29:

  return v14;
}

id MILoadFilteredPlist(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  CFTypeRef v25 = 0;
  CFTypeRef cf = 0;
  id v24 = 0;
  id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:3 error:&v24];
  id v8 = v24;
  if (!v7)
  {
    id v12 = [v5 path];
    _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 502, @"MIInstallerErrorDomain", 4, v8, 0, @"Failed to read plist from %@", v15, (uint64_t)v12);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!v6)
  {
    id v23 = 0;
    uint64_t v10 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:0 format:0 error:&v23];
    id v13 = v23;

    if (!v10)
    {
      id v12 = [v5 path];
      _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 520, @"MIInstallerErrorDomain", 4, v13, 0, @"Failed to decode plist from %@", v20, (uint64_t)v12);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    id v8 = v13;
    goto LABEL_12;
  }
  int Filtered = _CFPropertyListCreateFiltered();
  uint64_t v10 = (void *)v25;
  if (Filtered) {
    BOOL v11 = v25 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    CFTypeRef v25 = 0;
LABEL_12:
    objc_opt_class();
    id v12 = v10;
    if (objc_opt_isKindOfClass()) {
      id v17 = v12;
    }
    else {
      id v17 = 0;
    }

    if (v17)
    {
      id v16 = v8;
      goto LABEL_24;
    }
    uint64_t v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 526, @"MIInstallerErrorDomain", 4, 0, 0, @"Object returned from _CFPropertyListCreateFiltered was not a dictionary, was type %@", v19, (uint64_t)v13);
    goto LABEL_18;
  }
  id v12 = (id)cf;
  CFTypeRef cf = 0;
  id v13 = [v5 path];
  _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 511, @"MIInstallerErrorDomain", 4, v12, 0, @"Failed to decode plist from %@", v14, (uint64_t)v13);
LABEL_18:
  id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
  id v8 = v13;
LABEL_21:

  if (a3)
  {
    id v16 = v16;
    id v12 = 0;
    *a3 = v16;
  }
  else
  {
    id v12 = 0;
  }
LABEL_24:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v25)
  {
    CFRelease(v25);
    CFTypeRef v25 = 0;
  }
  id v21 = v12;

  return v21;
}

id MICopyCurrentBuildVersion()
{
  if (MICopyCurrentBuildVersion_onceToken != -1) {
    dispatch_once(&MICopyCurrentBuildVersion_onceToken, &__block_literal_global_105);
  }
  uid_t v0 = (void *)MICopyCurrentBuildVersion_buildVersion;

  return v0;
}

void __MICopyCurrentBuildVersion_block_invoke()
{
  uid_t v0 = (void *)_CFCopySystemVersionDictionaryValue();
  objc_opt_class();
  id v1 = v0;
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  char v3 = (void *)MICopyCurrentBuildVersion_buildVersion;
  MICopyCurrentBuildVersion_buildVersion = (uint64_t)v2;

  if (!MICopyCurrentBuildVersion_buildVersion && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MOLogWrite();
  }
}

void MIAssertHighResourceUsage()
{
  if (!atomic_fetch_add(sResourceExpectationCount, 1u))
  {
    uint64_t v0 = getpid();
    MEMORY[0x270EDAD30](v0);
  }
}

void MIClearResourceAssertion()
{
  if (atomic_fetch_add(sResourceExpectationCount, 0xFFFFFFFF) == 1)
  {
    uint64_t v0 = getpid();
    MEMORY[0x270EDADB0](v0);
  }
}

id MICreateSHA256Digest(void *a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  memset(md, 0, sizeof(md));
  memset(&v48, 0, sizeof(v48));
  id v3 = a1;
  if (lstat((const char *)[v3 fileSystemRepresentation], &v48))
  {
    id v4 = __error();
    int v5 = *v4;
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v4 userInfo:0];
    uint64_t v7 = [v3 fileSystemRepresentation];
    strerror(v5);
    _CreateAndLogError((uint64_t)"MICreateSHA256Digest", 121, @"MIInstallerErrorDomain", 4, v6, 0, @"Failed to stat path %s : %s", v8, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  if (v48.st_size <= 0xFFFFFFF)
  {
    id v47 = 0;
    BOOL v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v3 options:3 error:&v47];
    id v9 = v47;
    if (v11)
    {
      id v12 = v11;
      CC_SHA256((const void *)[v12 bytes], [v12 length], (unsigned __int8 *)md);

LABEL_28:
      uint64_t v22 = (char *)malloc_type_calloc(1uLL, 0x41uLL, 0x67229F93uLL);
      id v23 = v22;
      uint64_t v24 = 0;
      CFTypeRef v25 = (unsigned __int8 *)md;
      do
      {
        unsigned int v26 = *v25++;
        uint64_t v27 = &v22[v24];
        char *v27 = _HexToASCII_hex[(unint64_t)v26 >> 4];
        v24 += 2;
        v27[1] = _HexToASCII_hex[v26 & 0xF];
      }
      while (v24 != 64);
      v22[64] = 0;
      uint64_t v10 = [NSString stringWithUTF8String:v22];
      free(v23);
      if (!a2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    goto LABEL_3;
  }
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x8810000000;
  CFStringRef v45 = "";
  memset(&v46, 0, sizeof(v46));
  CC_SHA256_Init(&v46);
  id v13 = v3;
  uint64_t v14 = (const char *)[v13 fileSystemRepresentation];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  uint64_t v39 = __MICreateSHA256Digest_block_invoke;
  uint64_t v40 = &unk_264BB30F8;
  uint64_t v41 = &v42;
  long long v37 = v38;
  memset(&v49, 0, sizeof(v49));
  int v15 = open(v14, 256);
  int v16 = v15;
  if (v15 < 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v20 = __error();
      strerror(*v20);
      MOLogWrite();
    }
    uint64_t v19 = 0;
LABEL_21:
    int v18 = 0;
  }
  else
  {
    if (fstat(v15, &v49))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    if (v49.st_size >= 0x10000) {
      off_t st_size = 0x10000;
    }
    else {
      off_t st_size = v49.st_size;
    }
    uint64_t v19 = malloc_type_malloc(st_size, 0xBF9B6362uLL);
    if (!v19)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_13;
      }
LABEL_12:
      id v17 = __error();
      strerror(*v17);
      MOLogWrite();
LABEL_13:
      int v18 = 0;
      uint64_t v19 = 0;
LABEL_23:
      close(v16);
      goto LABEL_24;
    }
    off_t v30 = v49.st_size;
    if (v49.st_size < 1)
    {
      int v18 = 1;
      goto LABEL_23;
    }
    id v36 = v13;
    off_t v31 = 0;
    while (1)
    {
      off_t v32 = v30 - v31;
      if (st_size >= v32) {
        off_t st_size = v32;
      }
      ssize_t v33 = read(v16, v19, st_size);
      ssize_t v34 = v33;
      if (v33 == -1)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          unint64_t v35 = __error();
          id v13 = v36;
          strerror(*v35);
          MOLogWrite();
          goto LABEL_21;
        }
        goto LABEL_60;
      }
      if (v33 <= 0) {
        break;
      }
      int v18 = v39((uint64_t)v37, v19, v33);
      if (v18)
      {
        v31 += v34;
        off_t v30 = v49.st_size;
        if (v31 < v49.st_size) {
          continue;
        }
      }
      goto LABEL_61;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
      id v13 = v36;
      goto LABEL_21;
    }
LABEL_60:
    int v18 = 0;
LABEL_61:
    id v13 = v36;
  }
  if (v16 != -1) {
    goto LABEL_23;
  }
LABEL_24:
  if (v19) {
    free(v19);
  }

  CC_SHA256_Final((unsigned __int8 *)md, (CC_SHA256_CTX *)(v43 + 4));
  if (v18)
  {
    _Block_object_dispose(&v42, 8);
    id v9 = 0;
    goto LABEL_28;
  }
  _CreateAndLogError((uint64_t)"MICreateSHA256Digest", 148, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to read %@", v21, (uint64_t)v13);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v42, 8);
LABEL_3:
  uint64_t v10 = 0;
  if (!a2) {
    goto LABEL_33;
  }
LABEL_31:
  if (!v10) {
    *a2 = v9;
  }
LABEL_33:

  return v10;
}

void sub_230C9BC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MICreateSHA256Digest_block_invoke(uint64_t a1, const void *a2, CC_LONG a3)
{
  return 1;
}

void MIRunTransactionalTask(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = a1;
  id v6 = (void *)os_transaction_create();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __MIRunTransactionalTask_block_invoke;
  v9[3] = &unk_264BB3120;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  id v8 = v4;
  dispatch_async(v5, v9);
}

uint64_t __MIRunTransactionalTask_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t MIApplyAppPatch(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v103 = a3;
  id v9 = a4;
  id v10 = NSURL;
  uint64_t v11 = NSTemporaryDirectory();
  id v12 = [v10 fileURLWithPath:v11 isDirectory:1];

  uint64_t v102 = v12;
  id v13 = [v12 URLByAppendingPathComponent:@"ApplyAppPatchWorkingDir" isDirectory:1];
  mode_t v106 = [v13 URLByAppendingPathComponent:@"PreviousVersion" isDirectory:1];
  uint64_t v14 = [v13 URLByAppendingPathComponent:@"Patch" isDirectory:1];
  uint64_t v104 = [v14 URLByAppendingPathComponent:@"Payload" isDirectory:1];
  int v15 = +[MIFileManager defaultManager];
  id v118 = 0;
  LOBYTE(v11) = [v15 removeItemAtURL:v13 error:&v118];
  id v16 = v118;

  if ((v11 & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_89;
    }
    uint64_t v62 = [v13 path];
    v67 = v62;
    id v68 = v16;
    goto LABEL_88;
  }
  uint64_t v101 = v14;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v67 = v7;
    MOLogWrite();
  }
  id v17 = [NSURL fileURLWithPath:v7 isDirectory:0];
  id v117 = v16;
  BOOL v18 = +[MIBOMWrapper extractZipArchiveAtURL:v17 toURL:v106 withError:&v117];
  id v19 = v117;

  if (!v18)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v67 = [v106 path];
      id v68 = v19;
      MOLogWrite();
    }
    size_t v105 = 0;
    id v23 = 0;
    char v63 = 0;
    id v16 = v19;
    goto LABEL_91;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v67 = v8;
    MOLogWrite();
  }
  uint64_t v20 = [NSURL fileURLWithPath:v8 isDirectory:0];
  id v116 = v19;
  BOOL v21 = +[MIBOMWrapper extractZipArchiveAtURL:v20 toURL:v14 withError:&v116];
  id v16 = v116;

  if (!v21)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_89;
    }
    uint64_t v62 = [v14 path];
    v67 = v62;
    id v68 = v16;
LABEL_88:
    MOLogWrite();

LABEL_89:
    size_t v105 = 0;
    id v23 = 0;
    goto LABEL_90;
  }
  uint64_t v22 = [v106 URLByAppendingPathComponent:@"Payload" isDirectory:1];
  _FindBundles(v22);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  if (!v23 || ![v23 count])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v67 = [v106 path];
      MOLogWrite();
    }
    size_t v105 = 0;
    goto LABEL_90;
  }
  uint64_t v24 = _FindBundles(v104);
  size_t v105 = v24;
  if (!v24 || (CFTypeRef v25 = v24, ![v24 count]))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v61 = [v14 path];
      v67 = v61;
LABEL_99:
      MOLogWrite();
    }
LABEL_90:
    char v63 = 0;
    goto LABEL_91;
  }
  id v72 = v9;
  id v73 = v8;
  id v74 = v7;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v23 = v23;
  uint64_t v99 = [v23 countByEnumeratingWithState:&v112 objects:v119 count:16];
  if (!v99) {
    goto LABEL_74;
  }
  uint64_t v98 = *(void *)v113;
  uint64_t v86 = *MEMORY[0x263EFFAA0];
  uint64_t v87 = *MEMORY[0x263EFFB70];
  uint64_t v85 = *MEMORY[0x263EFFB50];
  id v96 = v23;
  while (2)
  {
    for (uint64_t i = 0; i != v99; ++i)
    {
      if (*(void *)v113 != v98) {
        objc_enumerationMutation(v23);
      }
      uint64_t v27 = *(void **)(*((void *)&v112 + 1) + 8 * i);
      id v28 = [v23 objectForKeyedSubscript:v27, v67, v68, v69, v70, v71];
      uint64_t v29 = [v25 objectForKeyedSubscript:v27];
      id v107 = [v28 objectForKeyedSubscript:@"com.apple.MobileInstallation.BundleURL"];
      uint64_t v30 = [v29 objectForKeyedSubscript:@"com.apple.MobileInstallation.BundleURL"];
      if (!v30)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          v67 = v27;
          MOLogWrite();
        }
        goto LABEL_28;
      }
      off_t v31 = (void *)v30;
      off_t v32 = [@"com.apple.deltainstallcommands." stringByAppendingString:v27];
      uint64_t v33 = [v14 URLByAppendingPathComponent:v32 isDirectory:0];

      ssize_t v34 = +[MIFileManager defaultManager];
      id v100 = (id)v33;
      LODWORD(v33) = [v34 itemDoesNotExistAtURL:v33];

      if (v33)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          v67 = v27;
          MOLogWrite();
        }

        uint64_t v14 = v101;
        id v23 = v96;
LABEL_28:

        continue;
      }
      unint64_t v35 = [v107 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
      id v111 = 0;
      v94 = v35;
      uint64_t v36 = MICreateSHA256Digest(v35, &v111);
      id v37 = v111;
      id v97 = (id)v36;
      v95 = v37;
      if (!v36)
      {
        id v44 = v37;
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          int v46 = 6;
          uint64_t v14 = v101;
          id v23 = v96;
          CFStringRef v45 = v94;
        }
        else
        {
          CFStringRef v45 = v94;
          v67 = [v94 path];
          id v68 = v44;
          MOLogWrite();
          int v46 = 6;
          uint64_t v14 = v101;
          id v23 = v96;
        }
        goto LABEL_70;
      }
      long long v38 = [v29 objectForKeyedSubscript:v87];
      v93 = MIStringifyObject(v38);

      uint64_t v39 = [v29 objectForKeyedSubscript:v86];
      uint64_t v88 = MIStringifyObject(v39);

      uint64_t v40 = [v28 objectForKeyedSubscript:v87];
      MIStringifyObject(v40);
      id v92 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v41 = [v28 objectForKeyedSubscript:v86];
      MIStringifyObject(v41);
      id v91 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v42 = [v28 objectForKeyedSubscript:v85];
      objc_opt_class();
      id v43 = v42;
      if (objc_opt_isKindOfClass()) {
        id v89 = v43;
      }
      else {
        id v89 = 0;
      }

      id v47 = [v28 objectForKeyedSubscript:@"UISupportedDevices"];
      objc_opt_class();
      id v48 = v47;
      if (objc_opt_isKindOfClass()) {
        id v49 = v48;
      }
      else {
        id v49 = 0;
      }
      uint64_t v14 = v101;

      if (!v49)
      {
        uint64_t v50 = [v28 objectForKeyedSubscript:@"SupportedDevices"];
        objc_opt_class();
        id v51 = v50;
        if (objc_opt_isKindOfClass()) {
          id v49 = v51;
        }
        else {
          id v49 = 0;
        }

        uint64_t v14 = v101;
      }
      objc_opt_class();
      uint64_t v90 = v49;
      if (MIArrayContainsOnlyClass(v49))
      {
        id v83 = [v107 URLByAppendingPathComponent:v89 isDirectory:0];
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          CFTypeRef v70 = v93;
          uint64_t v71 = v88;
          uint64_t v69 = v91;
          MOLogWrite();
        }
        CFTypeRef cf = 0;
        id v76 = v107;
        uint64_t v81 = [v76 fileSystemRepresentation];
        id v75 = v31;
        uint64_t v79 = [v75 fileSystemRepresentation];
        id v52 = v100;
        uint64_t v78 = [v52 fileSystemRepresentation];
        uint64_t v77 = [v92 UTF8String];
        uint64_t v53 = [v91 UTF8String];
        uint64_t v54 = [v97 UTF8String];
        id v84 = v83;
        if (hardlink_copy_hierarchy(v81, v79, v78, v77, v53, v54, [v84 fileSystemRepresentation], (uint64_t)v90, 0, (CFErrorRef *)&cf))
        {
          uint64_t v55 = +[MIFileManager defaultManager];
          id v109 = v16;
          uint64_t v80 = v52;
          char v56 = [v55 removeItemAtURL:v52 error:&v109];
          id v82 = v109;

          uint64_t v14 = v101;
          if (v56)
          {
            [v105 removeObjectForKey:v27];
            int v46 = 0;
LABEL_67:
            id v23 = v96;
            CFStringRef v45 = v94;
            id v16 = v82;
            uint64_t v57 = v84;
            goto LABEL_68;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            int v46 = 6;
            goto LABEL_67;
          }
          [v80 path];
          v67 = id v16 = v82;
          id v68 = v82;
          MOLogWrite();

          int v46 = 6;
        }
        else
        {
          uint64_t v58 = v52;
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v59 = [v76 path];
            uint64_t v60 = [v75 path];
            uint64_t v69 = [v58 path];
            CFTypeRef v70 = cf;
            v67 = v59;
            id v68 = v60;
            MOLogWrite();
          }
          if (cf) {
            CFRelease(cf);
          }
          int v46 = 6;
          uint64_t v14 = v101;
        }
        id v23 = v96;
        CFStringRef v45 = v94;
        uint64_t v57 = v84;
LABEL_68:

        goto LABEL_69;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v67 = [v107 path];
        MOLogWrite();
        uint64_t v57 = v67;
        int v46 = 6;
        id v23 = v96;
        CFStringRef v45 = v94;
        goto LABEL_68;
      }
      int v46 = 6;
      id v23 = v96;
      CFStringRef v45 = v94;
LABEL_69:

LABEL_70:
      if (v46)
      {

        id v8 = v73;
        id v7 = v74;
        id v9 = v72;
        goto LABEL_90;
      }
      CFTypeRef v25 = v105;
    }
    uint64_t v99 = [v23 countByEnumeratingWithState:&v112 objects:v119 count:16];
    if (v99) {
      continue;
    }
    break;
  }
LABEL_74:

  if ([v25 count])
  {
    id v8 = v73;
    id v7 = v74;
    id v9 = v72;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v61 = [v25 allKeys:v67, v68, v69, v70, v71];
      v67 = v61;
      goto LABEL_99;
    }
    goto LABEL_90;
  }
  id v8 = v73;
  id v7 = v74;
  id v9 = v72;
  if ((_CreateZipFromDirectory(v14, v103) & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v67 = v103;
      MOLogWrite();
    }
    goto LABEL_90;
  }
  char v63 = 1;
LABEL_91:
  CFErrorRef v64 = +[MIFileManager defaultManager];
  id v108 = v16;
  [v64 removeItemAtURL:v13 error:&v108];
  id v65 = v108;

  return v63 & 1;
}

id _FindBundles(void *a1)
{
  v37[6] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_opt_new();
  id v3 = +[MIFileManager defaultManager];
  id v35 = 0;
  id v4 = [v3 urlsForItemsInDirectoryAtURL:v1 ignoringSymlinks:1 error:&v35];
  id v5 = v35;

  if (v4)
  {
    id v24 = v5;
    id v25 = v1;
    unsigned int v26 = v2;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obCFIndex j = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      uint64_t v9 = *MEMORY[0x263EFFB58];
      uint64_t v29 = *MEMORY[0x263EFFB70];
      uint64_t v28 = *MEMORY[0x263EFFAA0];
      uint64_t v27 = *MEMORY[0x263EFFB50];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v12 = [v11 pathExtension:v22];
          id v13 = v12;
          if (v12 && [v12 isEqualToString:@"app"])
          {
            v37[0] = v9;
            v37[1] = v29;
            v37[2] = v28;
            v37[3] = v27;
            v37[4] = @"UISupportedDevices";
            v37[5] = @"SupportedDevices";
            uint64_t v14 = (void *)MEMORY[0x263EFF8C0];
            id v15 = v11;
            id v16 = [v14 arrayWithObjects:v37 count:6];
            id v17 = [MEMORY[0x263EFFA08] setWithArray:v16];
            BOOL v18 = MILoadInfoPlist(v15, v17);

            [v18 setObject:v15 forKeyedSubscript:@"com.apple.MobileInstallation.BundleURL"];
            id v19 = [v18 objectForKeyedSubscript:v9];
            if (v19)
            {
              [v26 setObject:v18 forKeyedSubscript:v19];
            }
            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              uint64_t v22 = v18;
              MOLogWrite();
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v7);
    }

    id v2 = v26;
    id v20 = v26;
    id v1 = v25;
    id v5 = v24;
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v23 = [v1 path];
      MOLogWrite();
    }
    id v20 = 0;
  }

  return v20;
}

uint64_t _CreateZipFromDirectory(void *a1, void *a2)
{
  v12[3] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v10 = fopen((const char *)[v4 fileSystemRepresentation], "w+x");
  if (v10)
  {
    uint64_t v5 = *MEMORY[0x263F7BE20];
    v11[0] = *MEMORY[0x263F7BE18];
    v11[1] = v5;
    v12[0] = *MEMORY[0x263F7BE08];
    v12[1] = MEMORY[0x263EFFA88];
    v11[2] = *MEMORY[0x263F7BE28];
    v12[2] = &unk_26E5A3260;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    [v3 fileSystemRepresentation];
    uint64_t StreamableZip = SZArchiverCreateStreamableZip();
    fclose(v10);
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v4 fileSystemRepresentation];
      uint64_t v8 = __error();
      strerror(*v8);
      MOLogWrite();
    }
    uint64_t StreamableZip = 0;
  }

  return StreamableZip;
}

void _InitTraversalState(void *a1)
{
}

void *_DestroyTraversalState(uint64_t a1)
{
  for (uint64_t i = *(void **)a1; *(void *)a1; uint64_t i = *(void **)a1)
  {
    *(void *)a1 = *i;
    --*(unsigned char *)(a1 + 1051);
    _FreeContinuation(a1, (uint64_t)i);
  }
  while (1)
  {
    id v3 = *(void **)(a1 + 8);
    if (!v3) {
      break;
    }
    *(void *)(a1 + 8) = *v3;
    free(v3);
  }
  while (1)
  {
    uint64_t result = *(void **)(a1 + 16);
    if (!result) {
      break;
    }
    *(void *)(a1 + 16) = *result;
    free(result);
  }
  return result;
}

void *_PopContinuation(uint64_t a1)
{
  uint64_t result = *(void **)a1;
  if (result)
  {
    *(void *)a1 = *result;
    --*(unsigned char *)(a1 + 1051);
  }
  return result;
}

uint64_t _FreeContinuation(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a2 + 8);
  if (v4)
  {
    *id v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v4;
  }
  uint64_t result = *(unsigned int *)(a2 + 24);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *(_DWORD *)(a2 + 24) = -1;
  }
  *(void *)a2 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2;
  return result;
}

void *_CreateAndPushContinuation(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 16) = *v2;
  }
  else
  {
    id v2 = malloc_type_malloc(0x20uLL, 0x103004057E7F81CuLL);
    if (!v2)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      return 0;
    }
  }
  AttrBuffer = _GetAttrBuffer(a1);
  v2[1] = AttrBuffer;
  if (!AttrBuffer)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    free(v2);
    return 0;
  }
  v2[2] = 0;
  v2[3] = 0xFFFFFFFFLL;
  void *v2 = *(void *)a1;
  *(void *)a1 = v2;
  ++*(unsigned char *)(a1 + 1051);
  return v2;
}

void *_GetAttrBuffer(uint64_t a1)
{
  id v1 = *(void **)(a1 + 8);
  if (v1)
  {
    *(void *)(a1 + 8) = *v1;
    return v1;
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 1050);
  if (v3 >= 0x10)
  {
    id v4 = *(void **)a1;
    if (*(void *)a1 && v4[1])
    {
      while (1)
      {
        uint64_t v5 = v4;
        id v4 = (void *)*v4;
        if (!v4) {
          break;
        }
        if (!v4[1])
        {
          if (!v5) {
            goto LABEL_15;
          }
          break;
        }
      }
      id v1 = (void *)v5[1];
      v5[1] = 0;
      *((_DWORD *)v5 + 7) = 0;
      *((_DWORD *)v5 + 5) = 0;
      int v6 = *((_DWORD *)v5 + 6);
      if ((v6 & 0x80000000) == 0)
      {
        close(v6);
        *((_DWORD *)v5 + 6) = -1;
      }
    }
    else
    {
LABEL_15:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      return 0;
    }
    return v1;
  }
  *(unsigned char *)(a1 + 1050) = v3 + 1;

  return malloc_type_malloc(0x4000uLL, 0x8D484474uLL);
}

uint64_t _PushContinuation(uint64_t result, void *a2)
{
  *a2 = *(void *)result;
  *(void *)uint64_t result = a2;
  ++*(unsigned char *)(result + 1051);
  return result;
}

BOOL _PushPathBuf(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 1048);
  unint64_t v4 = a3 + v3 + 1;
  if (v4 <= 0x3FF)
  {
    uint64_t v6 = a1 + 24;
    *(unsigned char *)(a1 + 24 + v3) = 47;
    memcpy((void *)(*(unsigned __int16 *)(a1 + 1048) + a1 + 24 + 1), a2, a3);
    *(_WORD *)(a1 + 1048) = v4;
    *(unsigned char *)(v6 + v4) = 0;
  }
  return v4 < 0x400;
}

uint64_t _PopPathBuf(uint64_t result)
{
  uint64_t v1 = *(unsigned __int16 *)(result + 1048);
  if (*(_WORD *)(result + 1048))
  {
    do
    {
      BOOL v2 = *(unsigned char *)(result + 23 + v1) == 47 || v1 == 1;
      --v1;
    }
    while (!v2);
  }
  *(unsigned char *)(result + 24 + (unsigned __int16)v1) = 0;
  *(_WORD *)(result + 1048) = v1;
  return result;
}

uint64_t _LastPathElement(unint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a1 + a2;
  while (1)
  {
    uint64_t v5 = v3;
    uint64_t v6 = v4 + v3;
    int v7 = *(unsigned __int8 *)(v6 - 1);
    if (v6 - 1 <= a1) {
      break;
    }
    uint64_t v3 = v5 - 1;
    if (v7 == 47) {
      goto LABEL_6;
    }
  }
  if (v7 == 47)
  {
LABEL_6:
    *a3 = -v5;
    return v4 + v5;
  }
  return 0;
}

uint64_t TraverseDirectory(uint64_t a1, char a2, unsigned int a3, void *a4, void *a5)
{
  return TraverseDirectoryWithPostTraversal(a1, a2, a3, a4, a5, 0);
}

uint64_t TraverseDirectoryWithPostTraversal(uint64_t a1, char a2, unsigned int a3, void *a4, void *a5, void *a6)
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  uint64_t v104 = 5;
  if (a3) {
    int v13 = -1610579959;
  }
  else {
    int v13 = -1610612727;
  }
  LODWORD(v106) = (a3 >> 6) & 4 | (a3 >> 7) & 1;
  HIDWORD(v104) = v13 & 0xBDB8FFFF | (((a3 >> 1) & 7) << 16) & 0xBDBFFFFF | (((a3 >> 5) & 1) << 22) & 0xBDFFFFFF | (((a3 >> 4) & 1) << 30) | (((a3 >> 6) & 1) << 25);
  HIDWORD(v105) = 6;
  bzero(&v122, 0x420uLL);
  if (!a1)
  {
    _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 891, @"MIInstallerErrorDomain", 25, 0, 0, @"%s was called with a NULL path parameter.", v14, (uint64_t)"_Bool TraverseDirectoryWithPostTraversal(const char *, TraverseDirectoryOptions, TraverseDirectoryAdditionalFetchProperties, NSError *__autoreleasing *, __strong TraverseDirectoryItemBlock, __strong TraverseDirectoryPostTraversalBlock)");
    goto LABEL_15;
  }
  unint64_t v15 = __strlcpy_chk();
  if (v15 >= 0x400)
  {
    _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 898, @"MIInstallerErrorDomain", 4, 0, 0, @"Attempted to iterate directories starting at a path that was too long: %s", v16, a1);
LABEL_15:
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  unsigned __int16 v126 = v15;
  id v17 = _CreateAndPushContinuation((uint64_t)&v122);
  if (!v17)
  {
    _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 906, (void *)*MEMORY[0x263F08438], 12, 0, 0, @"Failed to create a continuation", v18, v97);
    goto LABEL_15;
  }
  if ((a2 & 1) == 0)
  {
    uint64_t v19 = (uint64_t)v17;
    char v20 = a2;
    id v21 = v11;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    *(_OWORD *)__errnum = 0u;
    uint64_t v121 = 0;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v116 = 0u;
    id v108 = 0;
    id v109 = 0;
    char v107 = 0;
    int ContinuationFD = _GetContinuationFD((uint64_t)&v122, v19, 0, &v108);
    id v23 = v108;
    if (ContinuationFD == -1)
    {
      a2 = v20;
    }
    else
    {
      if (!fgetattrlist(ContinuationFD, &v104, *(void **)(v19 + 8), 0x4000uLL, 0))
      {
        _ParseAttributeBuf((uint64_t)v125, *(void *)(v19 + 8), (uint64_t)&v110, &v109, 0, &v107);
        a2 = v20;
        if (DWORD1(v112) != 2)
        {
          int v69 = *(_DWORD *)(v19 + 24);
          if ((v69 & 0x80000000) == 0)
          {
            close(v69);
            *(_DWORD *)(v19 + 24) = -1;
          }
        }
        uint64_t v70 = 0;
        while (1)
        {
          uint64_t v71 = v70;
          id v72 = (char *)&v122 + v126 + v70;
          int v73 = v72[23];
          if (v72 + 23 <= v125) {
            break;
          }
          uint64_t v70 = v71 - 1;
          if (v73 == 47) {
            goto LABEL_102;
          }
        }
        if (v73 != 47)
        {
          uint64_t v28 = _CreateAndLogError((uint64_t)"_CallBlockForBaseItem", 839, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to locate last path element in %s", v68, (uint64_t)v125);
          goto LABEL_13;
        }
LABEL_102:
        BOOL v74 = _CallClientBlock(v20, (uint64_t)v125, v126, (uint64_t)&v125[v126 + v71], -v71, 0, (uint64_t)&v110, (uint64_t)&v116, (uint64_t)v109, v21)- 1 < 2;
        int v75 = DWORD1(v112) != 2 || v74;
        if (v107) {
          int v65 = 1;
        }
        else {
          int v65 = v75;
        }
        id v64 = 0;
        int v66 = 1;
        goto LABEL_89;
      }
      int v24 = *__error();
      id v25 = (void *)*MEMORY[0x263F08438];
      uint64_t v26 = v24;
      strerror(v24);
      uint64_t v28 = _CreateAndLogError((uint64_t)"_CallBlockForBaseItem", 823, v25, v26, 0, 0, @"fgetattrlist for %s failed: %s", v27, (uint64_t)v125);
      a2 = v20;
LABEL_13:

      id v23 = (id)v28;
    }
    id v64 = v23;
    int v65 = 0;
    int v66 = 0;
    id v23 = v64;
LABEL_89:

    id v29 = v64;
    if (!v66) {
      goto LABEL_16;
    }
    if (v65) {
      goto LABEL_91;
    }
    goto LABEL_21;
  }
  id v29 = 0;
LABEL_21:
  long long v32 = v122;
  if (!v122) {
    goto LABEL_91;
  }
  uint64_t v98 = (uint64_t (**)(char *, unsigned char *))(v12 + 16);
  uint64_t v99 = a4;
  char v100 = a2;
  while (1)
  {
    v122 = (int32x2_t *)*v32;
    --v127;
    if (!*(void *)&v32[1])
    {
      AttrBuffer = _GetAttrBuffer((uint64_t)&v122);
      v32[1] = (int32x2_t)AttrBuffer;
      if (!AttrBuffer) {
        break;
      }
    }
    while (1)
    {
      id v103 = v11;
      uint64_t v102 = v12;
      uint64_t v121 = 0;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      *(_OWORD *)__errnum = 0u;
      long long v112 = 0u;
      long long v110 = 0u;
      unsigned int v36 = v32[3].u16[2];
      if (!v32[3].i16[2]) {
        goto LABEL_62;
      }
      unsigned __int32 v37 = v32[2].u32[0];
      unsigned __int32 v38 = v32[2].u32[1];
      unsigned int v39 = v37 - v38;
      if (v37 < v38)
      {
        _CreateAndLogError((uint64_t)"_ProcessContinuation", 650, @"MIInstallerErrorDomain", 4, 0, 0, @"Internal error: totalProcessedEntryCount (%u) was less than reprocessCount (%u)", v35, v32[2].u32[0]);
        v67 = LABEL_93:;
LABEL_117:
        id v82 = v67;

LABEL_118:
        id v83 = v82;

        id v84 = (void *)v32[1];
        if (v84)
        {
          *id v84 = v123;
          uint64_t v123 = v84;
        }
        int v85 = v32[3].i32[0];
        if ((v85 & 0x80000000) == 0)
        {
          close(v85);
          v32[3].i32[0] = -1;
        }
        *long long v32 = (int32x2_t)v124;
        uint64_t v124 = v32;
        id v29 = v83;
        goto LABEL_123;
      }
      if (v37 == v38)
      {
        uint64_t v40 = v32[3].u16[3];
      }
      else
      {
        if (v39 >= v36)
        {
          v32[2].i32[1] = v38 + v36;
          v32[3].i16[3] = v36;
          goto LABEL_62;
        }
        uint64_t v40 = (unsigned __int16)(v37 - v38);
        v32[3].i16[3] = v39;
        v32[2].i32[1] = v37;
      }
      int32x2_t v41 = v32[1];
      if (v40)
      {
        int v42 = 0;
        unint64_t v43 = 0;
        while (1)
        {
          uint64_t v44 = *(unsigned int *)(*(void *)&v41 + v43);
          v43 += v44;
          if (v43 > 0x4000) {
            break;
          }
          if (++v42 >= v40) {
            goto LABEL_37;
          }
        }
        _CreateAndLogError((uint64_t)"_ProcessContinuation", 685, @"MIInstallerErrorDomain", 4, 0, 0, @"Read entry length %u for entry %hu but that put us off the end of the buffer", v35, v44);
        goto LABEL_93;
      }
      unint64_t v43 = 0;
LABEL_37:
      id v101 = v11;
      if (v40 < v36)
      {
        while (1)
        {
          id v108 = 0;
          id v109 = 0;
          char v107 = 0;
          _ParseAttributeBuf((uint64_t)v125, *(void *)&v41 + v43, (uint64_t)&v110, &v108, &v109, &v107);
          uint64_t v46 = (uint64_t)v109;
          if (!v109) {
            break;
          }
          v43 += v110;
          if (v43 > 0x4000)
          {
            id v76 = @"MIInstallerErrorDomain";
            uint64_t v97 = v110;
            uint64_t v77 = @"Read entry length %u for entry %hu but that put us off the end of the buffer";
            uint64_t v78 = 709;
            goto LABEL_112;
          }
          uint64_t v47 = __errnum[2];
          if (__errnum[2])
          {
            uint64_t v80 = (void *)*MEMORY[0x263F08438];
            strerror(__errnum[2]);
            _CreateAndLogError((uint64_t)"_ProcessContinuation", 716, v80, v47, 0, 0, @"got error while processing entry %hu in %s : %s", v81, v40);
            goto LABEL_116;
          }
          size_t v48 = (v112 - 1);
          if (!_PushPathBuf((uint64_t)&v122, v109, v48))
          {
            id v76 = (__CFString *)*MEMORY[0x263F08438];
            uint64_t v97 = v46;
            uint64_t v77 = @"Could not append element \"%s\" of length %zd to path \"%s\" because it would make the path longer than MAXPATHLEN";
            uint64_t v78 = 723;
            uint64_t v79 = 63;
            goto LABEL_115;
          }
          int v49 = _CallClientBlock(v100, (uint64_t)v125, v126, v46, v48, v127 + 1, (uint64_t)&v110, (uint64_t)&v116, (uint64_t)v108, v103);
          if (v49 == 2)
          {
            char v107 = 1;
          }
          else if (v49 == 1)
          {
            goto LABEL_127;
          }
          ++v32[3].i16[3];
          v32[2] = vadd_s32(v32[2], (int32x2_t)0x100000001);
          if (DWORD1(v112) == 2)
          {
            if (!v107)
            {
              *long long v32 = (int32x2_t)v122;
              v122 = v32;
              ++v127;
              if (_CreateAndPushContinuation((uint64_t)&v122))
              {

                id v11 = v101;
                goto LABEL_85;
              }
              id v76 = (__CFString *)*MEMORY[0x263F08438];
              uint64_t v77 = @"Failed to create a continuation";
              uint64_t v78 = 753;
              uint64_t v79 = 12;
LABEL_115:
              _CreateAndLogError((uint64_t)"_ProcessContinuation", v78, v76, v79, 0, 0, v77, v45, v97);
              v67 = LABEL_116:;
              id v11 = v101;
              goto LABEL_117;
            }
            if (v12)
            {
              uint64_t v50 = (void *)MEMORY[0x230FCAB50]();
              int v51 = (*v98)(v102, v125);
              if (!v51)
              {
LABEL_127:

                id v92 = (void *)v32[1];
                id v11 = v101;
                if (v92)
                {
                  void *v92 = v123;
                  uint64_t v123 = v92;
                }
                int v93 = v32[3].i32[0];
                if ((v93 & 0x80000000) == 0)
                {
                  close(v93);
                  v32[3].i32[0] = -1;
                }
                *long long v32 = (int32x2_t)v124;
                uint64_t v124 = v32;
                goto LABEL_91;
              }
            }
          }
          uint64_t v52 = v126;
          if (v126)
          {
            id v11 = v101;
            do
            {
              unsigned __int16 v53 = v52 - 1;
              BOOL v54 = v125[v52 - 1] == 47 || v52 == 1;
              --v52;
            }
            while (!v54);
            uint64_t v52 = v53;
          }
          else
          {
            id v11 = v101;
          }
          uint64_t v40 = (v40 + 1);
          v125[v52] = 0;
          unsigned __int16 v126 = v52;
          if (v40 >= v32[3].u16[2]) {
            goto LABEL_62;
          }
        }
        id v76 = @"MIInstallerErrorDomain";
        uint64_t v97 = v40;
        uint64_t v77 = @"Entry %hu in %s did not include name information even though we requested it.";
        uint64_t v78 = 702;
LABEL_112:
        uint64_t v79 = 4;
        goto LABEL_115;
      }
LABEL_62:

      *(void *)&long long v110 = 0;
      int v55 = _GetContinuationFD((uint64_t)&v122, (uint64_t)v32, 1, &v110);
      id v56 = (id)v110;
      if (v55 == -1) {
        goto LABEL_125;
      }
      int v57 = getattrlistbulk(v55, &v104, *(void **)&v32[1], 0x4000uLL, 0);
      if (!v57) {
        break;
      }
      if (v57 == -1)
      {
        int v86 = *__error();
        uint64_t v87 = (void *)*MEMORY[0x263F08438];
        uint64_t v88 = v86;
        uint64_t v89 = v32[2].u32[0];
        strerror(v86);
        uint64_t v91 = _CreateAndLogError((uint64_t)"_PopulateAttrBuf", 410, v87, v88, 0, 0, @"getattrlistbulk failed on entry %u in %s : %s", v90, v89);

        id v56 = (id)v91;
LABEL_125:
        id v82 = v56;

        goto LABEL_118;
      }
      v32[3].i16[2] = v57;
      v32[3].i16[3] = 0;
    }
    if (!v12 || (v100 & 1) != 0 && !v122) {
      goto LABEL_71;
    }
    uint64_t v58 = (void *)MEMORY[0x230FCAB50]();
    if (!(*v98)(v102, v125))
    {
      v95 = (void *)v32[1];
      if (v95)
      {
        void *v95 = v123;
        uint64_t v123 = v95;
      }
      int v96 = v32[3].i32[0];
      if ((v96 & 0x80000000) == 0)
      {
        close(v96);
        v32[3].i32[0] = -1;
      }
      *long long v32 = (int32x2_t)v124;
      uint64_t v124 = v32;
      goto LABEL_91;
    }
LABEL_71:
    uint64_t v59 = v126;
    if (v126)
    {
      do
      {
        unsigned __int16 v60 = v59 - 1;
        BOOL v61 = v125[v59 - 1] == 47 || v59 == 1;
        --v59;
      }
      while (!v61);
      uint64_t v59 = v60;
    }
    v125[v59] = 0;
    unsigned __int16 v126 = v59;
    uint64_t v62 = (void *)v32[1];
    if (v62)
    {
      *uint64_t v62 = v123;
      uint64_t v123 = v62;
    }
    int v63 = v32[3].i32[0];
    if ((v63 & 0x80000000) == 0)
    {
      close(v63);
      v32[3].i32[0] = -1;
    }
    *long long v32 = (int32x2_t)v124;
    uint64_t v124 = v32;
LABEL_85:
    long long v32 = v122;
    if (!v122)
    {
LABEL_91:
      _DestroyTraversalState((uint64_t)&v122);
      uint64_t v30 = 1;
      goto LABEL_19;
    }
  }
  uint64_t v94 = _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 931, (void *)*MEMORY[0x263F08438], 12, 0, 0, @"Failed to locate an attrBuf", v34, v97);

  id v29 = (id)v94;
LABEL_123:
  a4 = v99;
LABEL_16:
  _DestroyTraversalState((uint64_t)&v122);
  if (a4)
  {
    id v29 = v29;
    uint64_t v30 = 0;
    *a4 = v29;
  }
  else
  {
    uint64_t v30 = 0;
  }
LABEL_19:

  return v30;
}

uint64_t _GetContinuationFD(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4 = *(unsigned int *)(a2 + 24);
  if (v4 == -1)
  {
    if (a3) {
      int v8 = 1048832;
    }
    else {
      int v8 = 0x200000;
    }
    uint64_t v9 = a1 + 24;
    uint64_t v10 = open((const char *)(a1 + 24), v8);
    if ((v10 & 0x80000000) == 0)
    {
      uint64_t v4 = v10;
      id v5 = 0;
      *(_DWORD *)(a2 + 24) = v4;
      goto LABEL_14;
    }
    id v11 = __error();
    uint64_t v12 = *v11;
    int v13 = (void *)*MEMORY[0x263F08438];
    if (v12 == 2)
    {
      strerror(2);
      _CreateError((uint64_t)"_GetContinuationFD", 301, v13, 2, 0, 0, @"Failed to open %s : %s", v14, v9);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4) {
        goto LABEL_13;
      }
    }
    else
    {
      strerror(*v11);
      _CreateAndLogError((uint64_t)"_GetContinuationFD", 303, v13, v12, 0, 0, @"Failed to open %s : %s", v15, v9);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
      {
LABEL_13:
        uint64_t v4 = 0xFFFFFFFFLL;
        goto LABEL_14;
      }
    }
    id v5 = v5;
    *a4 = v5;
    goto LABEL_13;
  }
  id v5 = 0;
LABEL_14:

  return v4;
}

uint64_t _ParseAttributeBuf(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, unsigned char *a6)
{
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = *(_DWORD *)a2;
  int v9 = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a3 + 4) = *(_OWORD *)(a2 + 4);
  *(_DWORD *)(a3 + 20) = v9;
  int v10 = *(_DWORD *)(a3 + 4);
  if ((v10 & 0x20000000) == 0)
  {
    id v11 = (uint64_t *)(a2 + 24);
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    int v13 = 0;
    if ((v10 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(_DWORD *)(a3 + 24) = *(_DWORD *)(a2 + 24);
  id v11 = (uint64_t *)(a2 + 28);
  if ((v10 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v12 = *v11;
  *(void *)(a3 + 28) = *v11;
  int v13 = (char *)v11++ + (int)v12;
  if ((v10 & 8) != 0)
  {
LABEL_7:
    int v14 = *(_DWORD *)v11;
    id v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 36) = v14;
  }
LABEL_8:
  if ((v10 & 0x8000) != 0)
  {
    int v16 = *(_DWORD *)v11;
    id v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 40) = v16;
    if ((v10 & 0x10000) == 0)
    {
LABEL_10:
      if ((v10 & 0x20000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }
  else if ((v10 & 0x10000) == 0)
  {
    goto LABEL_10;
  }
  int v17 = *(_DWORD *)v11;
  id v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 44) = v17;
  if ((v10 & 0x20000) == 0)
  {
LABEL_11:
    if ((v10 & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
LABEL_17:
  int v18 = *(_DWORD *)v11;
  id v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 48) = v18;
  if ((v10 & 0x40000) == 0)
  {
LABEL_12:
    if ((v10 & 0x400000) == 0) {
      goto LABEL_13;
    }
LABEL_19:
    uint64_t v20 = *v11;
    *(void *)(a3 + 56) = *v11;
    uint64_t v15 = (char *)v11++ + (int)v20;
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_18:
  int v19 = *(_DWORD *)v11;
  id v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 52) = v19;
  if ((v10 & 0x400000) != 0) {
    goto LABEL_19;
  }
LABEL_13:
  uint64_t v15 = 0;
  if ((v10 & 0x2000000) != 0)
  {
LABEL_20:
    uint64_t v21 = *v11++;
    *(void *)(a3 + 64) = v21;
  }
LABEL_21:
  if ((v10 & 0x40000000) != 0)
  {
    int v22 = *(_DWORD *)v11;
    id v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 72) = v22;
  }
  if (*(_DWORD *)(a3 + 36) == 2)
  {
    int v23 = *(_DWORD *)(a3 + 12);
    if ((v23 & 2) != 0)
    {
      int v24 = *(_DWORD *)v11;
      id v11 = (uint64_t *)((char *)v11 + 4);
      *(_DWORD *)(a3 + 80) = v24;
      if (!v24) {
        *a6 = 1;
      }
    }
    if ((v23 & 4) != 0)
    {
      int v25 = *(_DWORD *)v11;
      *(_DWORD *)(a3 + 84) = v25;
      if ((v25 & 3) != 0)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
          uint64_t result = MOLogWrite();
        }
        *a6 = 1;
      }
    }
  }
  else
  {
    int v27 = *(_DWORD *)(a3 + 16);
    if (v27)
    {
      int v28 = *(_DWORD *)v11;
      id v11 = (uint64_t *)((char *)v11 + 4);
      *(_DWORD *)(a3 + 80) = v28;
    }
    if ((v27 & 4) != 0) {
      *(void *)(a3 + 88) = *v11;
    }
  }
  if (a5) {
    *a5 = v13;
  }
  if (a4) {
    *a4 = v15;
  }
  return result;
}

uint64_t _CallClientBlock(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  int v18 = a10;
  int v19 = *(_DWORD *)(a7 + 36);
  if ((a1 & 2) != 0 && v19 == 2)
  {
    uint64_t v20 = 0;
  }
  else
  {
    BOOL v21 = a9;
    *(void *)a8 = *(void *)(a7 + 64);
    *(void *)(a8 + 8) = *(void *)(a7 + 88);
    *(void *)(a8 + 16) = a2;
    *(void *)(a8 + 24) = a3;
    *(void *)(a8 + 32) = a4;
    uint64_t v22 = *(unsigned int *)(a7 + 52);
    *(void *)(a8 + 40) = a5;
    *(void *)(a8 + 48) = v22;
    *(_DWORD *)(a8 + 56) = v19;
    int v23 = *(_DWORD *)(a7 + 72);
    *(_DWORD *)(a8 + 60) = *(_DWORD *)(a7 + 80);
    *(_DWORD *)(a8 + 64) = v23;
    *(void *)(a8 + 68) = *(void *)(a7 + 40);
    *(_DWORD *)(a8 + 76) = *(_DWORD *)(a7 + 80);
    __int16 v24 = *(_WORD *)(a7 + 48) & 0xFFF;
    *(_WORD *)(a8 + 80) = v24;
    unsigned int v25 = v19 - 1;
    if (v25 <= 6) {
      *(_WORD *)(a8 + 80) = word_230CAFEE0[v25] | v24;
    }
    if (a9) {
      BOOL v21 = *(_DWORD *)(a9 + 36) != -1;
    }
    *(unsigned char *)(a8 + 82) = v21;
    *(unsigned char *)(a8 + 83) = a6;
    uint64_t v26 = (void *)MEMORY[0x230FCAB50]();
    char v28 = 1;
    if (v18[2](v18, a8, &v28)) {
      uint64_t v20 = 2 * (v28 == 0);
    }
    else {
      uint64_t v20 = 1;
    }
  }

  return v20;
}

uint64_t MIBooleanValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF980] arrayWithCapacity:[v1 count]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  long long v9 = (void *)[v2 copy];

  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __MIDictionaryContainsOnlyClasses_block_invoke;
  v8[3] = &unk_264BB3148;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_230C9E8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MIDictionaryContainsOnlyClasses_block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass() & 1) == 0 || a1[6] && (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }
}

id MIStringifyObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v1;
    }
    else
    {
      id v2 = [NSString stringWithFormat:@"%@", v1];
    }
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (MIArrayContainsOnlyClass(v1))
      {
        id v2 = v1;
LABEL_7:
        id v3 = v2;
        goto LABEL_12;
      }
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        v6[0] = v1;
        id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [v1 allObjects];
        if (MIArrayContainsOnlyClass(v4)) {
          id v3 = v4;
        }
        else {
          id v3 = 0;
        }

        goto LABEL_12;
      }
    }
  }
  id v3 = 0;
LABEL_12:

  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

uint64_t _removefile_error_callback(_removefile_state *a1, uint64_t a2, _DWORD *a3)
{
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    int dst = 2;
  }
  else if (dst != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    strerror(dst);
    MOLogWrite();
  }
  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0;
}

uint64_t _CopyfileStatusCallback(uint64_t a1, int a2, uint64_t a3, const char *a4, uint64_t a5, void *a6)
{
  if (a2 == 3)
  {
    id v8 = a6;
    uint64_t v9 = *__error();
    if ([v8 ignoreErrors])
    {
      if (a1)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
          goto LABEL_17;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_17;
      }
      strerror(v9);
LABEL_16:
      MOLogWrite();
LABEL_17:
      uint64_t v10 = 1;
LABEL_28:

      return v10;
    }
    if (v9 == 45)
    {
      memset(&v23, 0, sizeof(v23));
      if (lstat(a4, &v23))
      {
        uint64_t v12 = *__error();
        _CreateError((uint64_t)"_CopyfileStatusCallback", 237, (void *)*MEMORY[0x263F08438], v12, 0, 0, @"lstat returned an error when trying to determine type for %s", v13, (uint64_t)a4);
        uint64_t v20 = LABEL_27:;
        [v8 setError:v20];

        uint64_t v10 = 2;
        goto LABEL_28;
      }
      unsigned int v17 = v23.st_mode & 0xF000;
      if (v17 >= 0x6000)
      {
        if (v17 == 24576)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        if (v17 == 49152)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      else
      {
        if (v17 == 4096)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        if (v17 == 0x2000)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      int v18 = (void *)*MEMORY[0x263F08438];
      if (a1)
      {
        uint64_t v22 = a1;
        uint64_t v15 = @"copyfile hit ENOTSUP at %d while copying %s to %s; src mode: 0%o";
        uint64_t v16 = 258;
      }
      else
      {
        uint64_t v22 = (uint64_t)a4;
        uint64_t v15 = @"copyfile hit ENOTSUP in source hierarchy while copying %s to %s; src mode: 0%o";
        uint64_t v16 = 256;
      }
      uint64_t v19 = 45;
    }
    else
    {
      long long v14 = (void *)*MEMORY[0x263F08438];
      strerror(v9);
      if (a1)
      {
        uint64_t v22 = a1;
        uint64_t v15 = @"copyfile failed at %d while copying %s to %s: %s (%d)";
        uint64_t v16 = 267;
      }
      else
      {
        uint64_t v22 = (uint64_t)a4;
        uint64_t v15 = @"copyfile failed in source hierarchy while copying %s to %s: %s (%d)";
        uint64_t v16 = 265;
      }
      int v18 = v14;
      uint64_t v19 = v9;
    }
    _CreateError((uint64_t)"_CopyfileStatusCallback", v16, v18, v19, 0, 0, v15, v11, v22);
    goto LABEL_27;
  }
  return 0;
}

void sub_230CA08EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
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

void sub_230CA12D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
}

void sub_230CA1DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_230CA208C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230CA26F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _dataForEAKey(char *name, int fd, void *a3)
{
  unint64_t v6 = fgetxattr(fd, name, 0, 0, 0, 32);
  if ((v6 & 0x8000000000000000) != 0)
  {
    int v11 = *__error();
    uint64_t v12 = (void *)*MEMORY[0x263F08438];
    uint64_t v13 = v11;
    strerror(v11);
    _CreateError((uint64_t)"_dataForEAKey", 1549, v12, v13, 0, 0, @"Could not get data length for extended attribute key %s: %s", v14, (uint64_t)name);
LABEL_8:
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  size_t v8 = v6;
  if (!v6)
  {
    uint64_t v30 = name;
    uint64_t v9 = @"Data for extended attribute key %s was empty";
    uint64_t v10 = 1552;
    goto LABEL_7;
  }
  if (v6 > 0x1000)
  {
    uint64_t v30 = name;
    uint64_t v9 = @"Data length is more than 4 KB for extended attribute key %s: length is %zd bytes";
    uint64_t v10 = 1555;
LABEL_7:
    _CreateError((uint64_t)"_dataForEAKey", v10, @"MIInstallerErrorDomain", 4, 0, 0, v9, v7, (uint64_t)v30);
    goto LABEL_8;
  }
  uint64_t v19 = malloc_type_malloc(v6, 0x1F5EDC03uLL);
  if (!v19)
  {
    int v22 = *__error();
    stat v23 = (void *)*MEMORY[0x263F08438];
    uint64_t v24 = v22;
    strerror(v22);
    _CreateError((uint64_t)"_dataForEAKey", 1561, v23, v24, 0, 0, @"Failed to malloc %zd bytes for extended attribute key %s: %s", v25, v8);
    goto LABEL_8;
  }
  uint64_t v16 = v19;
  ssize_t v20 = fgetxattr(fd, name, v19, v8, 0, 32);
  if (v20 < 0)
  {
    int v26 = *__error();
    int v27 = (void *)*MEMORY[0x263F08438];
    uint64_t v28 = v26;
    strerror(v26);
    _CreateError((uint64_t)"_dataForEAKey", 1567, v27, v28, 0, 0, @"Failed to malloc %zd bytes for extended attribute key %s: %s", v29, v8);
  }
  else
  {
    if (v20)
    {
      unsigned int v17 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v16 length:v20 freeWhenDone:1];
      id v15 = 0;
      if (v17) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    _CreateError((uint64_t)"_dataForEAKey", 1570, @"MIInstallerErrorDomain", 4, 0, 0, @"Data for key %s returned length 0, expected length %zd", v21, (uint64_t)name);
  }
  id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  free(v16);
  if (a3)
  {
    id v15 = v15;
    unsigned int v17 = 0;
    *a3 = v15;
  }
  else
  {
    unsigned int v17 = 0;
  }
LABEL_12:

  return v17;
}

uint64_t _CheckRealpathHasBasePrefix(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  bzero(v26, 0x400uLL);
  id v20 = v3;
  realpath_DARWIN_EXTSN((const char *)[v20 fileSystemRepresentation], v26);
  id v5 = [NSString stringWithFileSystemRepresentation:v26];
  unint64_t v6 = [v5 pathComponents];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v4 pathComponents];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      uint64_t v12 = v4;
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v10 + i < (unint64_t)[v6 count])
        {
          id v15 = [v6 objectAtIndexedSubscript:v10 + i];
          char v16 = [v14 isEqualToString:v15];

          if (v16) {
            continue;
          }
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          uint64_t v17 = 0;
          id v4 = v12;
        }
        else
        {
          [v20 fileSystemRepresentation];
          id v4 = v12;
          uint64_t v19 = [v12 path];
          MOLogWrite();

          uint64_t v17 = 0;
        }
        goto LABEL_16;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      v10 += i;
      uint64_t v17 = 1;
      id v4 = v12;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v17 = 1;
  }
LABEL_16:

  return v17;
}

void sub_230CA6A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230CA8518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

uint64_t immutable_open(int a1, char *a2, int a3, unsigned int a4)
{
  uint64_t v4 = open(a2, a3, a4);
  uint64_t v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    if (fcntl(v4, 68, 1) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      unint64_t v6 = __error();
      uint64_t v10 = strerror(*v6);
      MOLogWrite();
    }
    if (fcntl(v5, 48, 1, v10) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v7 = __error();
      uint64_t v11 = strerror(*v7);
      MOLogWrite();
    }
    if (fcntl(v5, 76, 1, v11) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v8 = __error();
      strerror(*v8);
      MOLogWrite();
    }
  }
  return v5;
}

uint64_t bom_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = BOMCopierUserData();
  if (v4)
  {
    *(_DWORD *)uint64_t v4 = a3;
    *(unsigned char *)(v4 + 4) = 1;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    MOLogWrite();
  }
  return 2;
}

uint64_t bom_fatal_error_handler()
{
  uint64_t v0 = BOMCopierUserData();
  if (v0) {
    *(unsigned char *)(v0 + 4) = 1;
  }
  uint64_t result = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    return MOLogWrite();
  }
  return result;
}

uint64_t bom_fatal_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = BOMCopierUserData();
  if (result)
  {
    *(_DWORD *)uint64_t result = a3;
    *(unsigned char *)(result + 4) = 1;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    return MOLogWrite();
  }
  return result;
}

uint64_t bom_copier_copy_file_finished_handler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = BOMCopierUserData();
  if (result) {
    *(void *)(result + 16) += a4;
  }
  return result;
}

unint64_t *bom_copier_copy_file_update_handler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (unint64_t *)BOMCopierUserData();
  if (result)
  {
    v5.n128_f64[0] = (double)(result[2] + a3) / (double)result[1] * 100.0;
    unint64_t v6 = *(uint64_t (**)(unint64_t, __n128))(result[3] + 16);
    unint64_t v7 = result[3];
    return (unint64_t *)v6(v7, v5);
  }
  return result;
}

uint64_t create_new_header_for_hiding(int a1, void *a2, size_t *a3, int a4)
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  if (!a2 || !a3)
  {
LABEL_13:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  *a2 = 0;
  *a3 = 0;
  if (!examine_binary(a1, (uint64_t)&v9))
  {
    if ((v9 & 0x3E) != 0x2E) {
      return 0;
    }
    if (v10 < 2)
    {
      if (HIDWORD(v10) == HIDWORD(v9) - 1) {
        return create_fat_disk_header(HIDWORD(v10), a2, a3);
      }
      if (a4) {
        return create_reordered_hidden_disk_header(a1, a2, a3, HIDWORD(v9), SHIDWORD(v10));
      }
      syslog(3, "arm64 slice at index %u, not last (nfat_arch = %u)\n");
    }
    else
    {
      syslog(3, "too many (%u) arm64 slices\n");
    }
    goto LABEL_13;
  }
  return 0xFFFFFFFFLL;
}

uint64_t examine_binary(int a1, uint64_t a2)
{
  fat_header fat_header = 0;
  memset(&v21, 0, sizeof(v21));
  memset(&v20, 0, sizeof(v20));
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  uint64_t result = fstat(a1, &v20);
  if (result != -1)
  {
    if (read_or_error(a1, &fat_header, 8uLL, 0))
    {
      if (fat_header.magic != -1095041334) {
        return 0;
      }
      swap_fat_header(&fat_header, NX_LittleEndian);
      uint32_t nfat_arch = fat_header.nfat_arch;
      *(_DWORD *)(a2 + 4) = fat_header.nfat_arch;
      if (read_fat_arch(a1, nfat_arch, &v21))
      {
        if (v21.cputype == 16777228)
        {
          long long v18 = 0u;
          long long v19 = 0u;
          if (v20.st_size > v21.offset && v21.size >= 0x1C && v20.st_size >= v21.size + v21.offset && v21.align <= 0x40)
          {
            if (v21.size + (unint64_t)v21.offset > 0x1F)
            {
              if (read_or_error(a1, &v18, 0x20uLL, v21.offset) && v18 == -17958193 && HIDWORD(v18) == 2)
              {
                *(_DWORD *)a2 |= 0x10u;
                ++fat_header.nfat_arch;
              }
            }
            else
            {
              *__error() = 34;
            }
          }
        }
        if (fat_header.nfat_arch)
        {
          int v6 = 0;
          while (1)
          {
            if (!read_fat_arch(a1, v6, &v21)) {
              return 0xFFFFFFFFLL;
            }
            if (v21.cputype == 12)
            {
              *(_DWORD *)a2 |= 2u;
              int v7 = 1;
            }
            else
            {
              int v7 = 0;
              if (v21.cputype == 16777228)
              {
                *(_DWORD *)a2 |= 4u;
                ++*(_DWORD *)(a2 + 8);
                *(_DWORD *)(a2 + 12) = v6;
              }
            }
            long long v18 = 0u;
            long long v19 = 0u;
            if (v21.size + (unint64_t)v21.offset <= 0x1F)
            {
              *__error() = 34;
              return 0xFFFFFFFFLL;
            }
            if (!read_or_error(a1, &v18, 0x20uLL, v21.offset)) {
              return 0xFFFFFFFFLL;
            }
            if (v18 == -17958193) {
              break;
            }
            if (v18 == -17958194)
            {
              int v8 = HIDWORD(v18);
              int v9 = v19;
              uint64_t v10 = 28;
              uint64_t v11 = 28;
              goto LABEL_29;
            }
            syslog(5, "ignoring slice with magic %08x\n", v18);
LABEL_47:
            if (++v6 >= fat_header.nfat_arch) {
              return 0;
            }
          }
          int v8 = HIDWORD(v18);
          int v9 = v19;
          uint64_t v10 = 32;
          uint64_t v11 = 32;
LABEL_29:
          if (v8 == 2)
          {
            *(_DWORD *)a2 |= 0x20u;
            uint64_t v11 = v10;
          }
          if (v7)
          {
            if (v9)
            {
              while (1)
              {
                uint64_t v17 = 0;
                BOOL v12 = slice_pread(a1, &v17, 8uLL, v11, v21.offset, v21.size);
                BOOL v13 = v12;
                if (!v12) {
                  goto LABEL_42;
                }
                if (v17 == 37) {
                  break;
                }
                v11 += HIDWORD(v17);
                if (!--v9) {
                  goto LABEL_36;
                }
              }
              uint64_t v15 = 0;
              uint64_t v16 = 0;
              if (!slice_pread(a1, &v15, 0x10uLL, v11, v21.offset, v21.size))
              {
LABEL_42:
                int v14 = 1;
                goto LABEL_43;
              }
              if (WORD1(v16) <= 6u) {
                *(_DWORD *)a2 |= 8u;
              }
            }
            else
            {
LABEL_36:
              BOOL v13 = 0;
            }
            int v14 = 6;
LABEL_43:
            if (v14 != 6 || v13)
            {
              if (v14 != 6) {
                return 0xFFFFFFFFLL;
              }
            }
            else
            {
              *(_DWORD *)a2 |= 8u;
            }
          }
          goto LABEL_47;
        }
        return 0;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t create_reordered_hidden_disk_header(int a1, void *a2, size_t *a3, unsigned int a4, int a5)
{
  if (a4 >= 0x401)
  {
    __n128 v5 = __error();
    int v6 = 22;
LABEL_7:
    *__n128 v5 = v6;
    return 0xFFFFFFFFLL;
  }
  size_t v12 = 20 * a4 + 8;
  BOOL v13 = malloc_type_malloc(v12, 0x63868CB2uLL);
  if (!v13)
  {
    __n128 v5 = __error();
    int v6 = 12;
    goto LABEL_7;
  }
  int v14 = v13;
  if (read_or_error(a1, v13, v12, 0))
  {
    uint64_t result = 0;
    uint64_t v16 = &v14[5 * a4 - 3];
    int v17 = v16[4];
    long long v18 = &v14[5 * a5 + 2];
    long long v19 = *(_OWORD *)v18;
    v16[4] = v18[4];
    long long v20 = *(_OWORD *)v16;
    *(_OWORD *)uint64_t v16 = v19;
    *(_OWORD *)long long v18 = v20;
    v18[4] = v17;
    v14[1] = bswap32(a4 - 1);
    *a2 = v14;
    *a3 = v12;
    return result;
  }
  free(v14);
  return 0xFFFFFFFFLL;
}

uint64_t create_fat_disk_header(unsigned int a1, void *a2, void *a3)
{
  int v6 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  if (v6)
  {
    int v7 = v6;
    uint64_t result = 0;
    *int v7 = -1095041334;
    v7[1] = bswap32(a1);
    *a2 = v7;
    *a3 = 8;
  }
  else
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t create_new_header_for_unhiding(int a1, void *a2, void *a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  *a2 = 0;
  *a3 = 0;
  if (!examine_binary(a1, (uint64_t)&v6))
  {
    if ((~v6 & 0x3E) != 0) {
      return 0;
    }
    if (v7 < 2)
    {
      if (HIDWORD(v7) == HIDWORD(v6)) {
        return create_fat_disk_header(HIDWORD(v7) + 1, a2, a3);
      }
      syslog(3, "arm64 slice at index %u, not last (uint32_t nfat_arch = %u)\n");
    }
    else
    {
      syslog(3, "too many (%u) arm64 slices\n");
    }
    goto LABEL_11;
  }
  return 0xFFFFFFFFLL;
}

uint64_t hide_archs_if_needed(char *a1, int a2, unsigned char *a3)
{
  return swizzle_archs_if_needed(a1, 1, a2, a3);
}

uint64_t swizzle_archs_if_needed(char *a1, int a2, int a3, unsigned char *a4)
{
  size_t v20 = 0;
  fat_arch v21 = 0;
  if (a4) {
    *a4 = 0;
  }
  int v8 = open(a1, 256);
  int v9 = v8;
  if (v8 == -1)
  {
    uint64_t v10 = __error();
    uint64_t v11 = strerror(*v10);
    syslog(3, "Could not open %s for reading: %s", a1, v11);
    goto LABEL_11;
  }
  if (a2)
  {
    if (!create_new_header_for_hiding(v8, &v21, &v20, a3)) {
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v12 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if (a3) {
    syslog(4, "allow_reorder not allowed for unhiding");
  }
  if (create_new_header_for_unhiding(v9, &v21, &v20)) {
    goto LABEL_11;
  }
LABEL_12:
  if (v20)
  {
    close(v9);
    int v13 = open(a1, 258);
    int v9 = v13;
    if (v13 == -1)
    {
      int v17 = __error();
      strerror(*v17);
      syslog(3, "Could not open %s for writing: %s");
    }
    else
    {
      size_t v14 = v20;
      ssize_t v15 = pwrite(v13, v21, v20, 0);
      ssize_t v16 = v15;
      if (v15 != v14 && v15 != -1) {
        *__error() = 5;
      }
      if (v16 == v14)
      {
        if (a4)
        {
          uint64_t v12 = 0;
          *a4 = 1;
          goto LABEL_23;
        }
      }
      else
      {
        long long v18 = __error();
        strerror(*v18);
        syslog(3, "Could not write new header to executable: %s");
      }
    }
  }
  uint64_t v12 = 0;
LABEL_23:
  if (v21) {
    free(v21);
  }
  if (v9 != -1) {
    close(v9);
  }
  return v12;
}

uint64_t unhide_archs_if_needed(char *a1, unsigned char *a2)
{
  return swizzle_archs_if_needed(a1, 0, 0, a2);
}

BOOL read_or_error(int a1, void *a2, size_t a3, off_t a4)
{
  ssize_t v5 = pread(a1, a2, a3, a4);
  ssize_t v6 = v5;
  if (v5 != a3 && v5 != -1) {
    *__error() = 5;
  }
  return v6 == a3;
}

BOOL read_fat_arch(int a1, int a2, fat_arch *a3)
{
  BOOL v4 = read_or_error(a1, a3, 0x14uLL, 20 * a2 + 8);
  if (v4) {
    swap_fat_arch(a3, 1u, NX_LittleEndian);
  }
  return v4;
}

BOOL slice_pread(int a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4 < 0 || (uint64_t)(a4 + a3) > a6 + a5)
  {
    *__error() = 34;
    return 0;
  }
  else
  {
    off_t v7 = a5 + a4;
    return read_or_error(a1, a2, a3, v7);
  }
}

void read_next_manifest_command_cold_1()
{
}

void read_string_to_terminator_cold_1()
{
}

void MIFetchInfoForUsername_cold_1(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  strerror(v4);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void MIFetchInfoForUsername_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void MIAssumeIdentity_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  id v1 = "MIAssumeIdentity";
  _os_log_fault_impl(&dword_230C95000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "%s: Attempting to assume an identity of 0/0, which should be the default for the helper service", (uint8_t *)&v0, 0xCu);
}

void MIRestoreIdentity_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  id v1 = "MIRestoreIdentity";
  _os_log_fault_impl(&dword_230C95000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "%s: Attempting to restore an identity without having first assumed an identity", (uint8_t *)&v0, 0xCu);
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x270F126B0]();
}

uint64_t BOMCopierCountFilesInArchive()
{
  return MEMORY[0x270F126B8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x270F126C0]();
}

uint64_t BOMCopierNewWithSys()
{
  return MEMORY[0x270F126D0]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x270F126D8]();
}

uint64_t BOMCopierSetCopyFileUpdateHandler()
{
  return MEMORY[0x270F126E0]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x270F126E8]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x270F126F0]();
}

uint64_t BOMCopierSetFileErrorHandler()
{
  return MEMORY[0x270F12700]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x270F12708]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x270F12710]();
}

int BZ2_bzRead(int *bzerror, BZFILE *b, void *buf, int len)
{
  return MEMORY[0x270F981D8](bzerror, b, buf, *(void *)&len);
}

void BZ2_bzReadClose(int *bzerror, BZFILE *b)
{
}

BZFILE *__cdecl BZ2_bzReadOpen(int *bzerror, FILE *f, int verbosity, int small, void *unused, int nUnused)
{
  return (BZFILE *)MEMORY[0x270F981E8](bzerror, f, *(void *)&verbosity, *(void *)&small, unused, *(void *)&nUnused);
}

uint64_t BomSys_free()
{
  return MEMORY[0x270F12718]();
}

uint64_t BomSys_init()
{
  return MEMORY[0x270F12720]();
}

uint64_t BomSys_set_open()
{
  return MEMORY[0x270F12728]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x270EE45F0](bundle);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

uint64_t MOLogWrite()
{
  return MEMORY[0x270F4B390]();
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x270EF2AB8](table, pointer);
}

void NSHashInsertKnownAbsent(NSHashTable *table, const void *pointer)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SZArchiverCreateStreamableZip()
{
  return MEMORY[0x270F79028]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x270EE55B0]();
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return MEMORY[0x270EE55B8]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x270EE55C0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x270EE55F8]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x270EE56D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

ssize_t acl_copy_ext_native(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x270ED84B0](buf_p, acl, size);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x270ED84C8](obj_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x270ED84F0](path_p, *(void *)&type);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x270ED8538](*(void *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x270ED8540](*(void *)&fd, acl);
}

ssize_t acl_size(acl_t acl)
{
  return MEMORY[0x270ED8578](acl);
}

char *__cdecl acl_to_text(acl_t acl, ssize_t *len_p)
{
  return (char *)MEMORY[0x270ED8580](acl, len_p);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x270ED8F00](a1, a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x270ED8FD0]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x270ED9100](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x270ED9108]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x270ED9110](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x270ED9120](s, *(void *)&flag, src);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x270ED9188](dirp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x270ED98A0](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x270ED98D8](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9948](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9970](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x270ED9990](*(void *)&fd, namebuff, size, *(void *)&options);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x270ED9A60](*(void *)&fd, name, *(void *)&options);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9AD0](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9AE0](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x270ED9B48](a1);
}

FTS *__cdecl fts_open_b(char *const *a1, int a2, void *a3)
{
  return (FTS *)MEMORY[0x270ED9B58](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x270ED9B60](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x270ED9B68](a1, a2, *(void *)&a3);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x270ED9B78](a1, a2, a3, a4, a5);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x270ED9B80](*(void *)&a1, a2);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x270ED9BB0](*(void *)&a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

gid_t getgid(void)
{
  return MEMORY[0x270ED9C10]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D30](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D40](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int initgroups(const char *a1, int a2)
{
  return MEMORY[0x270ED9ED0](a1, *(void *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA018](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270EDA020](a1, *(void *)&a2, *(void *)&a3);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x270EDA068](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x270EDA528](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x270EDA550](path, omode);
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return MEMORY[0x270EDB050](*(void *)&a1, *(void *)&a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x270EDB1F0](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x270EDB1F8]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x270EDB200](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x270EDB208](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x270EDB210](state, *(void *)&key, value);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x270EDB218](path, name, *(void *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x270EDB240](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDB268](a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270EDB3C8](a1, a2, a3, a4, *(void *)&a5);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6E8](__str, __endptr, *(void *)&__base);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB770](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x270EDB7C8](*(void *)&a1);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}