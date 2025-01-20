id sub_100001BC8()
{
  uint64_t path;
  __CFString *v1;
  void *v2;
  NSErrorUserInfoKey v4;
  __CFString *v5;
  uint64_t vars8;

  path = container_error_get_path();
  if (path)
  {
    v1 = +[NSString stringWithFileSystemRepresentation:path];
  }
  else
  {
    v1 = @"Failed to read container error path";
  }
  v4 = NSFilePathErrorKey;
  v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

__CFString *sub_100001DFC()
{
  v0 = (void *)container_copy_unlocalized_description();
  if (v0)
  {
    v1 = +[NSString stringWithUTF8String:v0];
  }
  else
  {
    v1 = @"<No container description>";
  }
  free(v0);
  return v1;
}

void sub_100002EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

uint64_t sub_100002F04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002F14(uint64_t a1)
{
}

uint64_t sub_100002F1C(uint64_t a1, uint64_t a2)
{
  id v11 = 0;
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithContainer:a2 error:&v11];
  id v6 = v11;
  id v7 = v11;
  if (v5)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v10 = sub_100001DFC();
      MOLogWrite();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1000032A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000032B8(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t MIMachOUnhideArchsSavingOriginalHeader(const char *a1)
{
  size_t size = 0;
  v15 = 0;
  int v2 = open(a1, 256);
  if (v2 < 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v6 = __error();
      strerror(*v6);
      MOLogWrite();
    }
    v4 = 0;
    goto LABEL_12;
  }
  int v3 = v2;
  if (fgetxattr(v2, "com.apple.installd.hidden_archs_fat_header", 0, 0, 0, 0) != -1)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (sub_100013A84(v3, &v15, &size))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v7 = __error();
      strerror(*v7);
      MOLogWrite();
    }
    uint64_t v5 = 0;
    v4 = 0;
    goto LABEL_32;
  }
  if (size)
  {
    v4 = malloc_type_malloc(size, 0x87799A7EuLL);
    *__error() = 0;
    size_t v8 = size;
    if (v8 != pread(v3, v4, size, 0))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    close(v3);
    int v9 = open(a1, 258);
    if ((v9 & 0x80000000) == 0)
    {
      int v3 = v9;
      if (fsetxattr(v9, "com.apple.installd.hidden_archs_fat_header", v4, size, 0, 2))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
          goto LABEL_31;
        }
      }
      else
      {
        *__error() = 0;
        size_t v13 = size;
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
          uint64_t v5 = 0;
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
    uint64_t v5 = 0;
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
  uint64_t v5 = 1;
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
        int v9 = 0;
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
      int v9 = 0;
LABEL_36:
      uint64_t v14 = 0;
LABEL_37:
      int v12 = v6;
      goto LABEL_38;
    }
    size_t v8 = v7;
    int v9 = malloc_type_malloc(v7, 0x2907A5C4uLL);
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
    size_t v13 = __error();
    strerror(*v13);
    MOLogWrite();
  }
  return 0;
}

uint64_t hardlink_copy_hierarchy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, CFErrorRef *a10)
{
  uint64_t v10 = __chkstk_darwin();
  CFArrayRef v12 = v11;
  uint64_t v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (char *)v10;
  bzero(to, 0x400uLL);
  bzero(v283, 0x400uLL);
  bzero(&v281, 0x410uLL);
  v280[0] = v25;
  v280[1] = 0;
  v26 = fts_open_b(v280, 85, &stru_1000209A8);
  if (!v26)
  {
    v41 = __error();
    strerror(*v41);
    CFErrorRef v46 = sub_100005D9C("hardlink_copy_hierarchy", 746, v42, v43, 0, v44, @"fts_open of %s failed: %s", v45, (char)v25);
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
      if ((sub_10000618C((const char *)cf, v283, (mode_t *)&v245, (CFErrorRef *)__str) & 1) == 0)
      {
        CFErrorRef v46 = sub_100005D9C("hardlink_copy_hierarchy", 786, v55, v56, *(const void **)__str, v57, @"Failed to realpath parent of %s", v58, (char)cf);
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
      CFErrorRef v54 = sub_100005D9C("hardlink_copy_hierarchy", 792, v55, v56, 0, v57, @"Entity exists at %s but it's not a directory", v58, (char)v283);
      goto LABEL_14;
    }
    CFStringRef v51 = @"Destination path was too long";
    int v52 = 779;
LABEL_13:
    CFErrorRef v54 = sub_100005D9C("hardlink_copy_hierarchy", v52, v47, v48, 0, v49, v51, v50, (char)fts_path);
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
    CFErrorRef v36 = sub_100005D9C("open_delta_manifest", 416, v60, v61, 0, v62, @"Could not open %s: %s", v63, (char)v22);
LABEL_20:
    CFErrorRef v46 = sub_100005D9C("hardlink_copy_hierarchy", 758, v37, v38, v36, v39, @"Failed to open manifest %s", v40, (char)v22);
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
    CFErrorRef v35 = sub_100005D9C("open_delta_manifest", 421, v31, v32, 0, v33, @"Could not stat %s: %s", v34, (char)v22);
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
    CFErrorRef v35 = sub_100005D9C("open_delta_manifest", 435, v161, v162, 0, v163, @"Failed to map file at %s; error %s",
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
    CFErrorRef v36 = sub_100005D9C("open_delta_manifest", 446, v69, v70, 0, v71, @"Failed to allocate command stream object", v72, (char)fts_path);
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
  if ((sub_1000064C8(v68, 0, (uint64_t)&v246, 6uLL) & 1) == 0)
  {
    CFStringRef v165 = @"Failed to read magic";
    int v166 = 299;
LABEL_155:
    CFErrorRef v78 = sub_100005D9C("validate_stream", v166, v74, v75, 0, v76, v165, v77, (char)fts_path);
    goto LABEL_156;
  }
  if (v246 ^ 0x44617069 | v247)
  {
    CFErrorRef v78 = sub_100005D9C("validate_stream", 305, v74, v75, 0, v76, @"Stream had invalid magic: %s", v77, (char)&v246);
LABEL_156:
    CFErrorRef v167 = v78;
LABEL_157:
    CFErrorRef v36 = sub_100005D9C("open_delta_manifest", 456, v79, v80, v167, v81, @"Invalid manifest file at %s", v82, (char)v22);
    if (v167) {
      CFRelease(v167);
    }
    munmap(v243, v245.st_size);
    free(v73);
    goto LABEL_8;
  }
  if ((sub_1000064C8(v73, 0, (uint64_t)&v290, 0xAuLL) & 1) == 0)
  {
    CFStringRef v165 = @"Failed to read version from manifest header";
    int v166 = 310;
    goto LABEL_155;
  }
  uint64_t v169 = strtol((const char *)&v290, 0, 10);
  if ((unint64_t)(v169 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    CFErrorRef v78 = sub_100005D9C("validate_stream", 318, v170, v171, 0, v172, @"Manifest had invalid version: %ld; expected 1, 2, or 3",
            v173,
            v169);
    goto LABEL_156;
  }
  uint64_t v242 = v169;
  if ((sub_1000064C8(v73, 0, (uint64_t)cf, 0x200uLL) & 1) == 0)
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
    CFErrorRef v184 = sub_100005D9C("validate_stream", 350, v180, v181, 0, v182, @"Incoming expected source version string \"%s%s%s\" was too long", v183, (char)v177);
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
  if (!sub_1000064C8(v240, 0, (uint64_t)v285, 0x41uLL))
  {
    CFStringRef v206 = @"Failed to read stream";
    int v207 = 375;
LABEL_226:
    CFErrorRef v184 = sub_100005D9C("validate_stream", v207, v202, v203, 0, v204, v206, v205, (char)fts_path);
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
    if ((sub_100006540(v240, v12, (CFErrorRef *)v285) & 1) == 0)
    {
      CFErrorRef v167 = sub_100005D9C("validate_stream", 384, v225, v226, v285[0], v227, @"Failed to validate supported devices", v228, (char)fts_path);
      if (v285[0]) {
        CFRelease(v285[0]);
      }
      goto LABEL_228;
    }
  }
LABEL_249:
  close(v29);
  cf[0] = 0;
  if ((sub_100005F2C(v240, &v281, (CFErrorRef *)cf, v229, v230, v231, v232, v233) & 1) == 0)
  {
    CFErrorRef v46 = sub_100005D9C("hardlink_copy_hierarchy", 765, v234, v235, cf[0], v236, @"Failed to read first manifest command", v237, (char)fts_path);
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
      CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 1110, v86, v87, 0, v89, @"Got done processing bundle but there were still commands remaining in manifest.", v91, (char)fts_path);
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
      if (fts_info != 6 && v244 && !sub_100005C8C(v282, v98))
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
            CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 1012, v215, v216, 0, v217, @"Failed to skip directory %s: %s", v218, (char)v98);
            goto LABEL_233;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            LOBYTE(fts_path) = (_BYTE)v98;
            MOLogWrite();
          }
LABEL_139:
          cf[0] = 0;
          if (sub_100005F2C(v83, &v281, (CFErrorRef *)cf, v87, v88, v89, v90, v91))
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
          CFErrorRef v174 = sub_100005D9C("hardlink_copy_hierarchy", 1094, v151, v152, cf[0], v153, @"Failed to read next manifest command", v154, (char)fts_path);
          goto LABEL_171;
        }
        *(_WORD *)__str = 0;
        cf[0] = 0;
        if ((sub_100006354(v283, v98, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
        {
          CFErrorRef v174 = sub_100005D9C("hardlink_copy_hierarchy", 1023, v123, v87, cf[0], v89, @"Failed to make dest path for directory %s", v91, (char)v98);
          goto LABEL_171;
        }
        if (*(_WORD *)__str && (*(_WORD *)__str & 0xF000) != 0x4000)
        {
          CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 1030, v123, v87, 0, v89, @"Non-directory entity with mode 0%o exists at directory location in dest path %s", v91, __str[0]);
          goto LABEL_233;
        }
        if (*(_WORD *)__str)
        {
          if (*(unsigned __int16 *)__str != (v92->fts_statp->st_mode | 0x80)
            && chmod((const char *)to, v92->fts_statp->st_mode | 0x80))
          {
            v224 = __error();
            strerror(*v224);
            CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 1043, v124, v125, 0, v126, @"Failed to make destination directory \"%s\" writable: %s", v127, (char)to);
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
            CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 1038, v220, v221, 0, v222, @"mkdir of '%s' failed: %s", v223, (char)to);
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
            if ((sub_100006354(v283, v98, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
            {
              CFErrorRef v174 = sub_100005D9C("hardlink_copy_hierarchy", 975, v129, v130, cf[0], v131, @"Failed to make dest path for file %s", v132, (char)v98);
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
              CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 982, v129, v130, 0, v131, @"Entity with mode 0%o exists at file location in dest path %s", v132, __str[0]);
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
                CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 991, v210, v211, 0, v212, @"copyfile of %s to %s failed: %s", v213, (char)v208);
                goto LABEL_233;
              }
            }
          }
          goto LABEL_137;
        }
        LOWORD(v285[0]) = 0;
        bzero(cf, 0x400uLL);
        *(void *)&v245.st_dev = 0;
        if ((sub_100006354(v283, v98, (char *)to, (mode_t *)v285, (CFErrorRef *)&v245) & 1) == 0)
        {
          CFErrorRef v46 = sub_100005D9C("hardlink_copy_hierarchy", 882, v101, v102, *(const void **)&v245.st_dev, v103, @"Failed to make dest path for file %s", v104, (char)v98);
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
          CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 889, v101, v102, 0, v103, @"Entity does not exist at file location in dest path %s", v104, (char)to);
          goto LABEL_233;
        }
        if (snprintf((char *)cf, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
        {
          CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 894, v107, v108, 0, v109, @"failed to make newfile path: %s.XXXXXXX", v110, (char)to);
          goto LABEL_233;
        }
        int v111 = mkstemp((char *)cf);
        if (v111 == -1)
        {
          v186 = __error();
          strerror(*v186);
          CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 899, v187, v188, 0, v189, @"mktemp failed for %s : %s", v190, (char)cf);
          goto LABEL_233;
        }
        int v112 = v111;
        v113 = v92->fts_path;
        bzero(__str, 0x400uLL);
        if (v14 && !sub_100005C8C(v113, v14))
        {
          if (snprintf(__str, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
          {
            CFErrorRef v46 = sub_100005D9C("hardlink_copy_hierarchy", 914, v137, v138, 0, v139, @"failed to make newfile path: %s.XXXXXXX", v140, (char)to);
            goto LABEL_212;
          }
          LOBYTE(v290) = 0;
          if (!MIMachOCreateHiddenArchsExecutableIfNeeded(v14, __str, &v290))
          {
            CFStringRef v193 = @"Failed to create hidden archs executable";
            int v194 = 920;
LABEL_207:
            CFErrorRef v191 = sub_100005D9C("hardlink_copy_hierarchy", v194, v141, v142, 0, v143, v193, v144, (char)fts_path);
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
          CFErrorRef v191 = sub_100005D9C("hardlink_copy_hierarchy", 934, v145, v146, 0, v147, @"patch_file failed for:\n\t%s\n\t%s\n\t%s", v148, (char)v113);
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
          CFErrorRef v46 = sub_100005D9C("hardlink_copy_hierarchy", 948, v196, v197, 0, v198, @"rename of %s to %s failed: %s", v199, (char)cf);
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
        CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 1078, v86, v87, 0, v89, @"FTS in %s returned an error %d for path '%s'", v91, (char)"hardlink_copy_hierarchy");
        goto LABEL_233;
      case 6u:
        LOWORD(cf[0]) = 0;
        if (!sub_100006354(v283, v98, (char *)to, (mode_t *)cf, 0)) {
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
            CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 1060, v156, v157, 0, v158, @"chmod of '%s' failed: %s", v159, (char)to);
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
        if (sub_100006354(v283, v98, (char *)to, (mode_t *)&v245, (CFErrorRef *)__str))
        {
          if (LOWORD(v245.st_dev))
          {
            CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 855, v115, v116, 0, v117, @"Entity with mode 0%o exists at symlink location in dest path %s", v118, v245.st_dev);
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
            CFErrorRef v128 = sub_100005D9C("hardlink_copy_hierarchy", 862, v136, v87, 0, v89, @"Failed to copy symlink %s to %s", v91, (char)*p_fts_path);
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
        CFErrorRef v46 = sub_100005D9C("hardlink_copy_hierarchy", 848, v115, v116, *(const void **)__str, v117, @"Failed to make dest path for symlink %s", v118, (char)v98);
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

int sub_100005C78(id a1, const _ftsent **a2, const _ftsent **a3)
{
  return sub_100005C8C((*a2)->fts_name, (*a3)->fts_name);
}

uint64_t sub_100005C8C(char *cStr, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  bzero(buffer, 0x400uLL);
  bzero(__s2, 0x400uLL);
  if (!CFStringGetFileSystemRepresentation(v3, buffer, 1024)
    || !CFStringGetFileSystemRepresentation(v4, __s2, 1024))
  {
    uint64_t v5 = 0xFFFFFFFFLL;
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v5 = strcmp(buffer, __s2);
  if (v3) {
LABEL_6:
  }
    CFRelease(v3);
LABEL_7:
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

CFErrorRef sub_100005D9C(const char *a1, int a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, const __CFString *a7, uint64_t a8, char a9)
{
  int valuePtr = a2;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
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
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, a5);
  }
  CFStringRef v15 = CFStringCreateWithFormatAndArguments(0, 0, a7, &a9);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  CFDictionaryAddValue(Mutable, kCFErrorLocalizedDescriptionKey, v15);
  if (v15) {
    CFRelease(v15);
  }
  CFErrorRef v16 = CFErrorCreate(0, @"MIInstallerDeltaErrorDomain", 1, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v16;
}

uint64_t sub_100005F2C(void *a1, unsigned __int8 *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[1];
  uint64_t v8 = a1[2];
  if (v8 >= v9) {
    sub_100013E14();
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
      CFErrorRef v28 = sub_100005D9C("read_next_manifest_command", 514, (uint64_t)a3, a4, 0, a6, @"Stream had invalid command: %hhu", a8, v13);
      goto LABEL_26;
    }
    char v15 = sub_1000064C8(a1, 1, (uint64_t)(a2 + 1), 0x400uLL);
    int v20 = *a2;
    if ((v15 & 1) == 0)
    {
      CFErrorRef v28 = sub_100005D9C("read_next_manifest_command", 520, v16, v17, 0, v18, @"Failed to read arg1 of command %hhu", v19, *a2);
      goto LABEL_26;
    }
    if (v20 != 61) {
      goto LABEL_12;
    }
    *(void *)__str = 0;
    uint64_t v33 = 0;
    char v35 = 0;
    uint64_t v34 = 0;
    if ((sub_1000064C8(a1, 1, (uint64_t)__str, 0x19uLL) & 1) == 0)
    {
      CFErrorRef v28 = sub_100005D9C("read_next_manifest_command", 528, v21, v22, 0, v23, @"Failed to read arg2 of command %hhu", v24, *a2);
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
  CFErrorRef v28 = sub_100005D9C("read_next_manifest_command", v27, (uint64_t)a3, a4, 0, a6, v26, a8, (char)v31);
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

uint64_t sub_10000618C(const char *a1, char *a2, mode_t *a3, CFErrorRef *a4)
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
    CFErrorRef v16 = sub_100005D9C("realpath_parent_no_symlink", v15, v9, v10, 0, v11, v14, v12, v30);
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
      CFErrorRef v16 = sub_100005D9C("realpath_parent_no_symlink", 599, v25, v26, 0, v27, @"realpath of '%s' failed at element '%s': %s", v28, (char)a1);
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
  CFErrorRef v16 = sub_100005D9C("realpath_parent_no_symlink", 618, v19, v20, 0, v21, @"Found symlink at destination path \"%s\"; this is not allowed.",
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

uint64_t sub_100006354(const char *a1, const char *a2, char *a3, mode_t *a4, CFErrorRef *a5)
{
  bzero(__str, 0x400uLL);
  if (snprintf(__str, 0x400uLL, "%s/%s", a1, a2) < 0x400)
  {
    CFTypeRef cf = 0;
    if ((sub_10000618C(__str, a3, a4, (CFErrorRef *)&cf) & 1) == 0)
    {
      CFErrorRef v23 = sub_100005D9C("make_and_check_dest_path", 701, v15, v16, cf, v17, @"Failed to realpath parent of %s", v18, (char)__str);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      goto LABEL_7;
    }
    if (!sub_100005C8C(__str, a3)) {
      return 1;
    }
    CFErrorRef v14 = sub_100005D9C("make_and_check_dest_path", 709, v19, v20, 0, v21, @"realpath'd destpath '%s' is different from non-realpath '%s'", v22, (char)a3);
  }
  else
  {
    CFErrorRef v14 = sub_100005D9C("make_and_check_dest_path", 695, v10, v11, 0, v12, @"Dest path '%s/%s' was too long", v13, (char)a1);
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

uint64_t sub_1000064C8(void *a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1[2];
  if (v4 >= a1[1]) {
    sub_100013E40();
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

uint64_t sub_100006540(void *a1, const __CFArray *a2, CFErrorRef *a3)
{
  uint64_t v10 = malloc_type_calloc(1uLL, 0x800uLL, 0x30FCD377uLL);
  if (!v10)
  {
    CFStringRef v32 = @"Failed to malloc buffer for line";
    int v33 = 200;
LABEL_23:
    CFErrorRef v34 = sub_100005D9C("validate_supported_devices", v33, v6, v7, 0, v8, v32, v9, v42);
    free(v10);
    goto LABEL_24;
  }
  if ((sub_1000064C8(a1, 0, (uint64_t)v10, 0x800uLL) & 1) == 0)
  {
    CFStringRef v32 = @"Failed to read supported devices from stream";
    int v33 = 205;
    goto LABEL_23;
  }
  if (!*v10)
  {
    if (!a2)
    {
      free(v10);
      return 1;
    }
    CFStringRef v32 = @"Existing app lists supported devices but there were none in the manifest";
    int v33 = 211;
    goto LABEL_23;
  }
  CFStringRef v11 = CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
  if (!v11)
  {
    CFStringRef v32 = @"Failed to create patch supported devices string";
    int v33 = 222;
    goto LABEL_23;
  }
  CFStringRef v12 = v11;
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v11, @" ");
  CFArrayRef v18 = ArrayBySeparatingStrings;
  if (!ArrayBySeparatingStrings || !CFArrayGetCount(ArrayBySeparatingStrings))
  {
    CFErrorRef v36 = sub_100005D9C("validate_supported_devices", 228, v14, v15, 0, v16, @"Failed to split patch supported devices string", v17, v42);
LABEL_32:
    CFErrorRef v34 = v36;
    free(v10);
    char v37 = 0;
    Mutable = 0;
    uint64_t v20 = 0;
    goto LABEL_42;
  }
  if (!a2)
  {
    CFErrorRef v36 = sub_100005D9C("validate_supported_devices", 234, v14, v15, 0, v16, @"Target app had no supported devices but patch did: %@", v17, (char)v18);
    goto LABEL_32;
  }
  CFStringRef v43 = v12;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t v20 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t Count = CFArrayGetCount(a2);
  uint64_t v22 = CFArrayGetCount(v18);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
      v44.location = 0;
      v44.length = v22;
      if (!CFArrayContainsValue(v18, v44, ValueAtIndex)) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }
  if (v22 >= 1)
  {
    for (CFIndex j = 0; j != v22; ++j)
    {
      uint64_t v26 = CFArrayGetValueAtIndex(v18, j);
      v45.location = 0;
      v45.length = Count;
      if (!CFArrayContainsValue(a2, v45, v26)) {
        CFArrayAppendValue(v20, v26);
      }
    }
  }
  if (Mutable && CFArrayGetCount(Mutable))
  {
    CFErrorRef v31 = sub_100005D9C("validate_supported_devices", 242, v27, v28, 0, v29, @"Expected supported devices had devices that were not in patch: %@", v30, (char)Mutable);
  }
  else
  {
    if (!v20 || !CFArrayGetCount(v20))
    {
      CFErrorRef v34 = 0;
      char v37 = 1;
      goto LABEL_41;
    }
    CFErrorRef v31 = sub_100005D9C("validate_supported_devices", 247, v38, v39, 0, v40, @"Patch listed devices that were not in expected supported devices: %@", v41, (char)v20);
  }
  CFErrorRef v34 = v31;
  char v37 = 0;
LABEL_41:
  CFStringRef v12 = v43;
  free(v10);
LABEL_42:
  CFRelease(v12);
  if (v18) {
    CFRelease(v18);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v37) {
    return 1;
  }
LABEL_24:
  if (a3)
  {
    uint64_t result = 0;
    *a3 = v34;
  }
  else
  {
    if (v34) {
      CFRelease(v34);
    }
    return 0;
  }
  return result;
}

id MobileInstallationHelperServiceProtocolInterface()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100025B00);
  WeakRetained = objc_loadWeakRetained(&qword_100025B08);
  if (!WeakRetained)
  {
    WeakRetained = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MobileInstallationHelperServiceProtocol];
    objc_storeWeak(&qword_100025B08, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100025B00);
  return WeakRetained;
}

id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    id v19 = [v17 mutableCopy];
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  uint64_t v20 = v19;
  if (v18)
  {
    id v21 = [objc_alloc((Class)NSString) initWithFormat:v18 arguments:a8];
    [v20 setObject:v21 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  uint64_t v22 = +[NSString stringWithUTF8String:a1];
  [v20 setObject:v22 forKeyedSubscript:MIFunctionNameErrorKey];

  CFErrorRef v23 = +[NSNumber numberWithInt:a2];
  [v20 setObject:v23 forKeyedSubscript:MISourceFileLineErrorKey];

  uint64_t v24 = +[NSError errorWithDomain:v15 code:a4 userInfo:v20];

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
  id v18 = [v17 objectForKeyedSubscript:NSLocalizedDescriptionKey];

  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v19 = [v15 domain];
      [v15 code];
      uint64_t v20 = [v15 userInfo];
      uint64_t v22 = [v20 objectForKeyedSubscript:NSLocalizedDescriptionKey];
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
  int v2 = [v1 domain];
  uint64_t v3 = MIInstallerErrorDomain;
  if ([v2 isEqualToString:MIInstallerErrorDomain] && objc_msgSend(v1, "code") == (id)12)
  {
    BOOL v4 = 1;
  }
  else
  {
    unint64_t v5 = [v1 domain];
    if ([v5 isEqualToString:v3] && objc_msgSend(v1, "code") == (id)11)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [v1 domain];
      if ([v6 isEqualToString:v3]) {
        BOOL v4 = [v1 code] == (id)35;
      }
      else {
        BOOL v4 = 0;
      }
    }
  }

  return v4;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    int v2 = +[NSString stringWithUTF8String:v0];
    free(v1);
  }
  else
  {
    int v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }
  return v2;
}

__CFString *MICopyProcessNameForPid()
{
  int v0 = __chkstk_darwin();
  int v1 = proc_pidpath(v0, buffer, 0x1000u);
  if (v1 < 1)
  {
    uint64_t v3 = @"Unknown Process Name";
  }
  else
  {
    id v2 = [objc_alloc((Class)NSString) initWithBytes:buffer length:v1 encoding:4];
    uint64_t v3 = [v2 lastPathComponent];
  }
  return v3;
}

id MIFetchInfoForUsername(const char *a1, uid_t *a2, gid_t *a3, void *a4)
{
  if (sysconf(71) == -1) {
    sub_100013E6C(&v15, v20);
  }
  uint64_t v8 = __chkstk_darwin();
  memset(&v15, 0, sizeof(v15));
  uint64_t v14 = 0;
  id result = (id)getpwnam_r(a1, &v15, (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v9, &v14);
  if (result)
  {
    uint64_t v13 = 0;
    memset(v20, 0, sizeof(v20));
    int v11 = (int)result;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    CFStringRef v12 = strerror(v11);
    int v16 = 136315394;
    id v17 = a1;
    __int16 v18 = 2080;
    id v19 = v12;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_13:
    sub_100013F30(&v16, v20);
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
    id result = +[NSURL fileURLWithFileSystemRepresentation:v15.pw_dir isDirectory:1 relativeToURL:0];
    *a4 = result;
  }
  return result;
}

uint64_t MIFetchInfoForUID(uint64_t a1, void *a2, gid_t *a3, void *a4, void *a5)
{
  if (sysconf(71) == -1)
  {
    int v18 = *__error();
    uint64_t v19 = v18;
    uint64_t v20 = strerror(v18);
    int v16 = _CreateError((uint64_t)"MIFetchInfoForUID", 140, NSPOSIXErrorDomain, v19, 0, 0, @"Failed to get home dir path size: %s", v21, (uint64_t)v20);
    uint64_t v17 = 0;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v10 = __chkstk_darwin();
  memset(&v25, 0, sizeof(v25));
  uint64_t v24 = 0;
  int v12 = getpwuid_r(a1, &v25, (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, &v24);
  if (v12)
  {
    uint64_t v14 = v12;
    strerror(v12);
    _CreateError((uint64_t)"MIFetchInfoForUID", 150, NSPOSIXErrorDomain, v14, 0, 0, @"getpwuid_r failed for uid %d : %s", v15, a1);
    int v16 = LABEL_4:;
    uint64_t v17 = 0;
    goto LABEL_5;
  }
  if (!v24)
  {
    _CreateError((uint64_t)"MIFetchInfoForUID", 155, NSPOSIXErrorDomain, 2, 0, 0, @"getpwuid_r succeeded but no user was found with uid %d", v13, a1);
    goto LABEL_4;
  }
  if (a2)
  {
    *a2 = +[NSString stringWithUTF8String:v25.pw_name];
  }
  if (a3) {
    *a3 = v25.pw_gid;
  }
  if (a4)
  {
    uint64_t v17 = 1;
    +[NSURL fileURLWithFileSystemRepresentation:v25.pw_dir isDirectory:1 relativeToURL:0];
    int v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v16 = 0;
    uint64_t v17 = 1;
  }
LABEL_5:
  if (!a5) {
    goto LABEL_10;
  }
LABEL_8:
  if ((v17 & 1) == 0) {
    *a5 = v16;
  }
LABEL_10:

  return v17;
}

void MIGetCurrentMobileUserInfo(_DWORD *a1, _DWORD *a2)
{
  if (qword_100025B18 != -1) {
    dispatch_once(&qword_100025B18, &stru_100020A30);
  }
  *a1 = dword_100025B10;
  *a2 = dword_100025B14;
}

void sub_1000073C0(id a1)
{
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
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100013FE0();
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  id v17 = 0;
  id v18 = 0;
  int v6 = MIFetchInfoForUID(a1, &v18, 0, 0, &v17);
  id v7 = v18;
  id v8 = v17;
  if (v6)
  {
    if (pthread_setugid_np(a1, a2))
    {
      size_t v9 = __error();
      uint64_t v16 = *v9;
      strerror(*v9);
      _CreateAndLogError((uint64_t)"MIAssumeIdentity", 228, NSPOSIXErrorDomain, v16, 0, 0, @"pthread_setugid_np failed for uid %d gid %d; error %d (%s)",
        v10,
        a1);
    }
    else
    {
      if (!initgroups((const char *)[v7 UTF8String], a2))
      {
        uint64_t v14 = 1;
        goto LABEL_16;
      }
      uint64_t v11 = *__error();
      MIRestoreIdentity();
      strerror(v11);
      _CreateAndLogError((uint64_t)"MIAssumeIdentity", 238, NSPOSIXErrorDomain, v11, 0, 0, @"SYS_initgroups failed; error %d (%s)",
        v12,
        v11);
    uint64_t v13 = };

    id v8 = (id)v13;
  }
  if (a3)
  {
    id v8 = v8;
    uint64_t v14 = 0;
    *a3 = v8;
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_16:

  return v14;
}

uint64_t MIRestoreIdentity()
{
  uid_t v0 = getuid();
  if (!(v0 | getgid()))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100014068();
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  uint64_t result = pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if (result)
  {
    int v2 = *__error();
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    strerror(v2);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  return result;
}

uint64_t MIAssumeMobileIdentity(void *a1)
{
  if (qword_100025B18 != -1) {
    dispatch_once(&qword_100025B18, &stru_100020A30);
  }
  uint64_t v2 = dword_100025B10;
  gid_t v3 = dword_100025B14;
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
  id v25 = 0;
  id v7 = (__CFBundle *)sub_100007A74(v5, 0, &v25);
  id v8 = v25;
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
        uint64_t v13 = +[NSMutableDictionary dictionaryWithDictionary:v11];
        CFRelease(v11);
      }
      else
      {
        CFTypeID v17 = CFGetTypeID(v11);
        CFStringRef v18 = CFCopyTypeIDDescription(v17);
        uint64_t v20 = _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 363, MIInstallerErrorDomain, 3, 0, 0, @"Object returned from _CFBundleCreateFilteredInfoPlist was not a dictionary, was type %@", v19, (uint64_t)v18);

        if (v18) {
          CFRelease(v18);
        }
        CFRelease(v11);
        uint64_t v13 = 0;
        id v8 = (id)v20;
      }
      goto LABEL_17;
    }
    uint64_t v16 = _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 357, MIInstallerErrorDomain, 3, 0, 0, @"Failed to get filtered Info.plist with keys %@ from bundle %@", v10, (uint64_t)v6);

LABEL_16:
    uint64_t v13 = 0;
    id v8 = (id)v16;
    goto LABEL_17;
  }
  CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v7);
  if (!InfoDictionary)
  {
    uint64_t v21 = (void *)MIInstallerErrorDomain;
    uint64_t v22 = [v5 path];
    uint64_t v16 = _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 378, v21, 35, 0, 0, @"CFBundleGetInfoDictionary failed for bundle at %@", v23, (uint64_t)v22);

    goto LABEL_16;
  }
  uint64_t v15 = +[NSMutableDictionary dictionaryWithDictionary:InfoDictionary];
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

const void *sub_100007A74(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t Unique = _CFBundleCreateUnique();
  if (!Unique)
  {
    uint64_t v12 = (void *)MIInstallerErrorDomain;
    uint64_t v13 = [v5 path];
    _CreateAndLogError((uint64_t)"_CreateCFBundle", 296, v12, 3, 0, 0, @"Failed to create CFBundle for %@", v14, (uint64_t)v13);
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
      uint64_t v28 = v7;
      MOLogWrite();
    }
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", @"Info.plist", 0, v28);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  size_t v9 = +[MIFileManager defaultManager];
  id v30 = 0;
  unsigned __int8 v10 = [v9 itemIsFileAtURL:v8 error:&v30];
  id v11 = v30;

  if ((v10 & 1) == 0)
  {
    uint64_t v15 = [v11 domain];
    if ([v15 isEqualToString:NSPOSIXErrorDomain])
    {
      id v16 = [v11 code];

      if (v16 == (id)2)
      {
        CFTypeID v17 = (void *)MIInstallerErrorDomain;
        CFStringRef v18 = [v8 path];
        _CreateAndLogError((uint64_t)"_CreateCFBundle", 310, v17, 35, v11, 0, @"Info.plist missing at %@", v19, (uint64_t)v18);
        goto LABEL_22;
      }
    }
    else
    {
    }
    uint64_t v20 = [v11 domain];
    if ([v20 isEqualToString:NSPOSIXErrorDomain])
    {
      id v21 = [v11 code];

      if (v21 == (id)22)
      {
        uint64_t v22 = (void *)MIInstallerErrorDomain;
        CFStringRef v18 = [v8 path];
        uint64_t v29 = (uint64_t)v18;
        uint64_t v24 = @"Expected Info.plist file at %@ but found something that was not a file.";
        uint64_t v25 = 312;
LABEL_21:
        _CreateAndLogError((uint64_t)"_CreateCFBundle", v25, v22, 3, v11, 0, v24, v23, v29);
        uint64_t v26 = LABEL_22:;

        CFRelease(v7);
        id v11 = (id)v26;
        if (!a3) {
          goto LABEL_23;
        }
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v22 = (void *)MIInstallerErrorDomain;
    CFStringRef v18 = [v8 path];
    uint64_t v29 = (uint64_t)v18;
    uint64_t v24 = @"Error when introspecting %@";
    uint64_t v25 = 314;
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
  gid_t v3 = sub_100007A74(a1, &v12, &v11);
  id v4 = v12;
  id v5 = v11;
  if (v3)
  {
    id v10 = v5;
    id v6 = +[NSDictionary MI_dictionaryWithContentsOfURL:v4 options:0 error:&v10];
    id v7 = v10;

    id v8 = [v6 mutableCopy];
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
  unsigned __int8 v3 = objc_msgSend(v2, "MI_writeToURL:format:options:error:", v1, 200, 268435457, &v7);
  id v4 = v7;
  if (v3)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v5 = [v2 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];
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
  unsigned __int8 v3 = +[NSDictionary dictionaryWithContentsOfURL:a1];
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
  uint64_t v5 = _kCFSystemVersionBuildVersionKey;
  uint64_t v6 = [v3 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];
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
  CFTypeRef v29 = 0;
  CFTypeRef cf = 0;
  id v28 = 0;
  id v7 = +[NSData dataWithContentsOfURL:v5 options:3 error:&v28];
  id v8 = v28;
  if (!v7)
  {
    id v16 = (void *)MIInstallerErrorDomain;
    id v12 = [v5 path];
    _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 502, v16, 4, v8, 0, @"Failed to read plist from %@", v17, (uint64_t)v12);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!v6)
  {
    id v27 = 0;
    uint64_t v10 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:0 error:&v27];
    id v14 = v27;

    if (!v10)
    {
      uint64_t v23 = (void *)MIInstallerErrorDomain;
      id v12 = [v5 path];
      _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 520, v23, 4, v14, 0, @"Failed to decode plist from %@", v24, (uint64_t)v12);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    id v8 = v14;
    goto LABEL_12;
  }
  int Filtered = _CFPropertyListCreateFiltered();
  uint64_t v10 = (void *)v29;
  if (Filtered) {
    BOOL v11 = v29 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    CFTypeRef v29 = 0;
LABEL_12:
    objc_opt_class();
    id v12 = v10;
    if (objc_opt_isKindOfClass()) {
      id v19 = v12;
    }
    else {
      id v19 = 0;
    }

    if (v19)
    {
      id v18 = v8;
      goto LABEL_24;
    }
    uint64_t v20 = (void *)MIInstallerErrorDomain;
    id v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 526, v20, 4, 0, 0, @"Object returned from _CFPropertyListCreateFiltered was not a dictionary, was type %@", v22, (uint64_t)v14);
    goto LABEL_18;
  }
  id v12 = (id)cf;
  CFTypeRef cf = 0;
  uint64_t v13 = (void *)MIInstallerErrorDomain;
  id v14 = [v5 path];
  _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 511, v13, 4, v12, 0, @"Failed to decode plist from %@", v15, (uint64_t)v14);
LABEL_18:
  id v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
  id v8 = v14;
LABEL_21:

  if (a3)
  {
    id v18 = v18;
    id v12 = 0;
    *a3 = v18;
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
  if (v29)
  {
    CFRelease(v29);
    CFTypeRef v29 = 0;
  }
  id v25 = v12;

  return v25;
}

id MICopyCurrentBuildVersion()
{
  if (qword_100025B28 != -1) {
    dispatch_once(&qword_100025B28, &stru_100020A50);
  }
  uid_t v0 = (void *)qword_100025B20;
  return v0;
}

void sub_1000085A8(id a1)
{
  id v1 = (void *)_CFCopySystemVersionDictionaryValue();
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  id v4 = (void *)qword_100025B20;
  qword_100025B20 = (uint64_t)v3;

  if (!qword_100025B20 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MOLogWrite();
  }
}

void MIAssertHighResourceUsage()
{
  if (!atomic_fetch_add(dword_100025B30, 1u))
  {
    uint64_t v0 = getpid();
    _proc_disable_cpumon(v0);
  }
}

void MIClearResourceAssertion()
{
  if (atomic_fetch_add(dword_100025B30, 0xFFFFFFFF) == 1)
  {
    uint64_t v0 = getpid();
    _proc_set_cpumon_defaults(v0);
  }
}

uint64_t sub_100009288(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 4)
  {
    id v7 = [v5 pathExtension];
    unsigned int v8 = [v7 isEqualToString:@"lproj"];

    if (v8)
    {
      size_t v9 = [v6 URLByAppendingPathComponent:@"InfoPlist.strings" isDirectory:0];
      uint64_t v10 = +[MIFileManager defaultManager];
      unsigned int v11 = [v10 itemExistsAtURL:v9];

      if (v11)
      {
        id v12 = *(void **)(a1 + 32);
        uint64_t v13 = [v6 lastPathComponent];
        id v14 = [v12 URLByAppendingPathComponent:v13 isDirectory:1];

        uint64_t v15 = +[MIFileManager defaultManager];
        id v24 = 0;
        unsigned __int8 v16 = [v15 createDirectoryAtURL:v14 withIntermediateDirectories:0 mode:493 error:&v24];
        id v17 = v24;

        if (v16)
        {
          id v18 = [v14 URLByAppendingPathComponent:@"InfoPlist.strings" isDirectory:0];
          id v19 = +[MIFileManager defaultManager];
          id v23 = v17;
          unsigned __int8 v20 = [v19 copyItemAtURL:v9 toURL:v18 error:&v23];
          id v21 = v23;

          if ((v20 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
            MOLogWrite();
          }
        }
        else
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
            MOLogWrite();
          }
          id v21 = v17;
        }
      }
    }
  }

  return 1;
}

uint64_t sub_10000A4F8()
{
  qword_100025B38 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return _objc_release_x1();
}

void sub_10000AE04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000AE34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4MIFetchInfoForUsername("mobile", (uid_t *)&dword_100025B10, (gid_t *)&dword_100025B14, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4MIFetchInfoForUsername("mobile", (uid_t *)&dword_100025B10, (gid_t *)&dword_100025B14, 0) = 0;
  return result;
}

void sub_10000AE44(uint64_t a1)
{
}

uint64_t sub_10000AE4C(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = [v5 lastPathComponent];
  if (*(unsigned char *)(a1 + 72))
  {
    if (a3 == 4)
    {
      if ([*(id *)(a1 + 40) containsObject:v6]) {
        goto LABEL_4;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
        goto LABEL_29;
      }
    }
    else if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
    {
      goto LABEL_29;
    }
LABEL_28:
    id v24 = [v5 path];
    MOLogWrite();

LABEL_29:
    uint64_t v13 = 1;
    goto LABEL_30;
  }
LABEL_4:
  if ([v6 isEqualToString:@".com.apple.mobile_container_manager.metadata.plist"])
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  id v7 = [*(id *)(a1 + 48) URLByAppendingPathComponent:v6 isDirectory:1];
  unsigned int v8 = *(void **)(a1 + 56);
  id v36 = 0;
  unsigned __int8 v9 = [v8 removeItemAtURL:v7 error:&v36];
  id v10 = v36;
  if ((v9 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    CFTypeRef v29 = [v7 path];
    id v32 = v10;
    uint64_t v26 = v11;
    MOLogWrite();
  }
  id v12 = *(void **)(a1 + 56);
  id v35 = v10;
  uint64_t v13 = (uint64_t)objc_msgSend(v12, "moveItemIfExistsAtURL:toURL:error:", v5, v7, &v35, v26, v29, v32);
  id v14 = v35;

  if ((v13 & 1) == 0)
  {
    uint64_t v15 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      unsigned __int8 v16 = (void *)getuid();
      uint64_t v17 = getgid();
      uint64_t v33 = geteuid();
      uint64_t v34 = getegid();
      uint64_t v30 = v17;
      id v27 = v16;
      MOLogWrite();
      uint64_t v15 = gLogHandle;
      if (!gLogHandle) {
        goto LABEL_20;
      }
    }
    if (*(int *)(v15 + 44) >= 5)
    {
LABEL_20:
      id v27 = objc_msgSend(v5, "path", v27, v30, v33, v34);
      MOLogWrite();
    }
    objc_msgSend(*(id *)(a1 + 56), "logAccessPermissionsForURL:", v5, v27);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v28 = [v7 path];
      MOLogWrite();
    }
    objc_msgSend(*(id *)(a1 + 56), "logAccessPermissionsForURL:", v7, v28);
    id v18 = (void *)MIInstallerErrorDomain;
    id v19 = [v5 path];
    CFErrorRef v31 = [v7 path];
    uint64_t v21 = _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]_block_invoke", 183, v18, 21, v14, 0, @"Failed to move %@ to %@ : %@", v20, (uint64_t)v19);
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
    id v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 4MIFetchInfoForUsername("mobile", (uid_t *)&dword_100025B10, (gid_t *)&dword_100025B14, 0) = v21;
  }
LABEL_30:

  return v13;
}

id sub_10000B528(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_runAsyncForIdentifier:description:operation:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_10000BB1C(id *a1)
{
  id v2 = [a1[4] block];
  v2[2]();

  id v3 = [a1[5] internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BBF4;
  block[3] = &unk_100020B10;
  id v7 = a1[6];
  id v4 = a1[4];
  id v5 = a1[5];
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v3, block);
}

id sub_10000BBF4(uint64_t a1)
{
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    [*(id *)(a1 + 40) descString];
    v7 = uint64_t v6 = v2;
    MOLogWrite();
  }
  id v3 = objc_msgSend(*(id *)(a1 + 48), "activeIdentifiers", v6, v7);
  [v3 removeObject:*(void *)(a1 + 32)];

  id v4 = *(void **)(a1 + 48);
  return objc_msgSend(v4, "_onQueue_deQueueIfNeeded");
}

uint64_t patchFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
    id v27 = __error();
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
  id v9 = sub_10000C998(a3, 4, a4, 32);
  if (!v9)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      return 0;
    }
    goto LABEL_34;
  }
  id v10 = v9;
  uint64_t v11 = sub_10000C998(a3, 5, a4, *((void *)&v37 + 1) + 32);
  if (!v11)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      CFTypeRef v29 = __error();
      strerror(*v29);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_84;
  }
  id v12 = v11;
  uint64_t v13 = sub_10000C998(a3, 6, a4, *((void *)&v37 + 1) + v38 + 32);
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
  id v14 = v13;
  uint64_t v15 = malloc_type_malloc(0x10000uLL, 0xBA17AE47uLL);
  if (!v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      CFErrorRef v31 = __error();
      strerror(*v31);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_82;
  }
  unsigned __int8 v16 = v15;
  uint64_t v17 = malloc_type_malloc(0x10000uLL, 0xCE350E8DuLL);
  if (!v17)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v32 = __error();
      strerror(*v32);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_81;
  }
  id v18 = v17;
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
    if (sub_10000CB30((uint64_t)v10, &buf, 24) != 24)
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
        if (v25 != (int)sub_10000CB30((uint64_t)v14, v18, v25)) {
          break;
        }
        if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))(a5, 2, v18, v25, v19) != v25)
        {
          id v12 = (void *)v33;
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
      id v12 = (void *)v33;
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
    id v12 = (void *)v33;
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
    if (v22 != (int)sub_10000CB30(v33, v18, v22))
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
  id v12 = (void *)v33;
LABEL_80:
  free(v18);
LABEL_81:
  free(v16);
LABEL_82:
  sub_10000CBAC(v14);
LABEL_83:
  sub_10000CBAC(v12);
LABEL_84:
  sub_10000CBAC(v10);
  return v26;
}

void *sub_10000C998(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int bzerror = 0;
  id v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040A4FBEE0AuLL);
  id v9 = v8;
  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
LABEL_12:
    id v12 = __error();
    strerror(*v12);
LABEL_13:
    MOLogWrite();
LABEL_14:
    sub_10000CBAC(v9);
    return 0;
  }
  *(_DWORD *)id v8 = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a1;
  id v10 = funopen(v8, (int (__cdecl *)(void *, char *, int))sub_10000CF54, 0, 0, 0);
  v9[4] = v10;
  if (!v10)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  uint64_t v11 = BZ2_bzReadOpen(&bzerror, v10, 0, 0, 0, 0);
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

uint64_t sub_10000CB30(uint64_t a1, void *buf, int len)
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

void sub_10000CBAC(void *a1)
{
  int bzerror = 0;
  if (a1)
  {
    uint64_t v2 = (BZFILE *)a1[5];
    if (v2) {
      BZ2_bzReadClose(&bzerror, v2);
    }
    id v3 = (FILE *)a1[4];
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
          uint64_t v13 = __error();
          strerror(*v13);
        }
        else
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 0x40000000;
          v19[2] = sub_10000CF18;
          v19[3] = &unk_100020B30;
          int v20 = v6;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 0x40000000;
          v17[2] = sub_10000CF2C;
          v17[3] = &unk_100020B50;
          int v18 = v8;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 0x40000000;
          v15[2] = sub_10000CF40;
          v15[3] = &unk_100020B70;
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
    id v12 = __error();
    strerror(*v12);
    MOLogWrite();
    goto LABEL_17;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    uint64_t v11 = __error();
    strerror(*v11);
    MOLogWrite();
  }
  return 0xFFFFFFFFLL;
}

ssize_t sub_10000CF18(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_10000CF2C(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_10000CF40(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pwrite(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

uint64_t sub_10000CF54(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
  if (result == -1) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 16) += result;
  return result;
}

id MIGetBooleanEntitlement(void *a1, void *a2, id a3)
{
  id v5 = a2;
  if (a1)
  {
    int v6 = [a1 objectForKeyedSubscript:v5];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        a3 = [v6 BOOLValue];
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        MOLogWrite();
      }
    }
    else
    {
      a3 = 0;
    }
  }
  else
  {
    a3 = 0;
  }

  return a3;
}

uint64_t MIGetFirstTrueBooleanEntitlement(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a2;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (MIGetBooleanEntitlement(v5, *(void **)(*((void *)&v13 + 1) + 8 * (void)v10), a3))
        {
          uint64_t v11 = 1;
          goto LABEL_11;
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

id MIHasUpgradeEnabledEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.upgrade-enabled", 0);
}

id MIHasContainerRequiredEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.container-required", (id)1);
}

id MIHasNoContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-container", 0);
}

id MIHasNoSandboxEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-sandbox", 0);
}

BOOL MIHasSeatbeltProfilesEntitlement(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"seatbelt-profiles"];
  BOOL v2 = v1 != 0;

  return v2;
}

id MIHasPlatformApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"platform-application", 0);
}

id MIHasSystemContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.security.system-container", 0);
}

id MIHasXPCServicesAllowedEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.xpc-services-enabled", 0);
}

id MIHasSystemApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.system-application", 0);
}

id MIHasWebKitPushBundleEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.webkit.pushbundle", 0);
}

id MIHasMarketplaceEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.marketplace.app-installation", 0);
}

id MICopyPlaceholderEntitlements(void *a1)
{
  uint64_t v1 = [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  BOOL v2 = +[NSDictionary dictionaryWithContentsOfURL:v1];

  return v2;
}

id MIWritePlaceholderEntitlements(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  id v7 = objc_msgSend(v5, "MI_writeToURL:format:options:error:", v6, 200, 268435457, a3);

  return v7;
}

id MICopyApplicationGroupEntitlement(void *a1)
{
  return sub_10000D398(a1, @"com.apple.security.application-groups");
}

id sub_10000D398(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 objectForKeyedSubscript:v3];
  if (!v4) {
    goto LABEL_14;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if (isKindOfClass)
  {
    if (MIArrayContainsOnlyClass(v4))
    {
      id v6 = v4;
LABEL_7:
      id v7 = +[NSSet setWithArray:v6];
      id v8 = [v7 allObjects];

      goto LABEL_16;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
LABEL_13:
    MOLogWrite();
LABEL_14:
    id v6 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v10 = v4;
  id v6 = +[NSArray arrayWithObjects:&v10 count:1];
  if (v6) {
    goto LABEL_7;
  }
LABEL_15:
  id v8 = 0;
LABEL_16:

  return v8;
}

BOOL MIHasAnyApplicationGroupEntitlements(void *a1)
{
  uint64_t v1 = sub_10000D398(a1, @"com.apple.security.application-groups");
  BOOL v2 = v1 != 0;

  return v2;
}

id MICopySystemGroupEntitlement(void *a1)
{
  id v1 = a1;
  BOOL v2 = sub_10000D398(v1, @"com.apple.security.system-groups");
  id v3 = v2;
  if (!v2 || ![v2 count])
  {
    uint64_t v4 = sub_10000D398(v1, @"com.apple.security.system-group-containers");

    id v3 = (void *)v4;
  }

  return v3;
}

BOOL MIHasAnySystemGroupEntitlements(void *a1)
{
  id v1 = MICopySystemGroupEntitlement(a1);
  BOOL v2 = v1 != 0;

  return v2;
}

id MIHasOnDemandInstallCapableEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.on-demand-install-capable", 0);
}

id MICopyParentIdentifiersEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.parent-application-identifiers"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id MICopyApplicationIdentifierEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"application-identifier"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id MICopyPreviousApplicationIdentifiersEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"previous-application-identifiers"];
  objc_opt_class();
  id v2 = MIArrayifyThing(v1);

  return v2;
}

id MIHasBetaReportsActiveEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"beta-reports-active", 0);
}

id MICopyKeychainAccessGroupEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"keychain-access-groups"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id MIHasSwiftPlaygroundsAppEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.swift-playgrounds-app", 0);
}

id MICopyAppManagementDomainEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.app-management-domain"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainValue(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    if ([v1 hasPrefix:@"swift-playgrounds"])
    {
      uint64_t v3 = 2;
    }
    else if ([v2 isEqualToString:@"com.apple.WebKit.PushBundles"])
    {
      uint64_t v3 = 3;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainEntitlement(void *a1)
{
  id v1 = MICopyAppManagementDomainEntitlement(a1);
  uint64_t v2 = MIClassifyAppManagementDomainValue(v1);

  return v2;
}

id MICopyNetworkExtensionEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.networking.networkextension"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id MICopyAssociatedAppClipsEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.associated-appclip-app-identifiers"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id MIHasDriverKitEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.driverkit", 0);
}

id MICopyDataProtectionClassEntitlement(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection"];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (!v4)
  {
    id v5 = [v1 objectForKeyedSubscript:@"data-protection-class"];
    objc_opt_class();
    id v6 = v5;
    id v4 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;

    if (!v4)
    {
      id v7 = [v1 objectForKeyedSubscript:@"DataProtectionClass"];
      objc_opt_class();
      id v8 = v7;
      if (objc_opt_isKindOfClass()) {
        id v4 = v8;
      }
      else {
        id v4 = 0;
      }
    }
  }

  return v4;
}

id MICopyDataProtectionIfAvailableEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection-if-available"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3)
  {
    id v4 = v2;
  }
  else
  {
    objc_opt_class();
    id v5 = v2;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      id v7 = v5;
      objc_opt_class();
      MIArrayFilteredToContainOnlyClass(v7);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

id MIHasBrowserEngineHostEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.host", 0);
}

id MIHasEmbeddedBrowserEngineEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.embedded-web-browser-engine", 0);
}

id MIHasBrowserEngineRenderingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.rendering", 0);
}

id MIHasBrowserEngineNetworkingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.networking", 0);
}

id MIHasBrowserEngineContentEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.webcontent", 0);
}

id MICopyMemoryTransferAcceptEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-accept"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id MICopyMemoryTransferSendEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-send"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id MIHasDefaultBrowserEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser", 0);
}

id MIHasBrowserAppInstallationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.browser.app-installation", 0);
}

id MIBooleanValue(void *a1, id a2)
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
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  id v2 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      id v5 = 0;
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
      id v3 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
  id v1 = a1;
  id v2 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v1 count]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (CFIndex i = 0; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v9 = [v2 copy];
  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E2E8;
  v8[3] = &unk_100020B98;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_10000E2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E2E8(void *a1, void *a2, void *a3, unsigned char *a4)
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
      id v2 = +[NSString stringWithFormat:@"%@", v1];
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
        id v6 = v1;
        id v2 = +[NSArray arrayWithObjects:&v6 count:1];
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = [v1 allObjects];
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

int main(int argc, const char **argv, const char **envp)
{
  +[NSError _setFileNameLocalizationEnabled:0];
  id v3 = +[MIFileManager defaultManager];
  CFTypeRef v29 = (void *)os_transaction_create();
  id v4 = &BZ2_bzRead_ptr;
  id v5 = +[MIDaemonConfiguration sharedInstance];
  BOOL v6 = [v5 helperLogDirectory];
  id v28 = [v6 URLByAppendingPathComponent:@"mobile_installation_helper.log" isDirectory:0];

  id v7 = +[MIDaemonConfiguration sharedInstance];
  LODWORD(v6) = [v7 allowsInternalSecurityPolicy];

  uint64_t v8 = 0;
  id v9 = 0;
  if (v6) {
    int v10 = 4;
  }
  else {
    int v10 = 1;
  }
  int v31 = v10 + 1;
  do
  {
    uint64_t v11 = v9;
    char v12 = +[NSString stringWithFormat:@"%s.%u", "mobile_installation_helper.log", v8, v27];
    long long v13 = [v4[251] sharedInstance];
    long long v14 = [v13 logDirectory];
    long long v15 = [v14 URLByAppendingPathComponent:v12 isDirectory:0];

    long long v16 = [v4[251] sharedInstance];
    uint64_t v17 = [v16 helperLogDirectory];
    int v18 = [(id)v17 URLByAppendingPathComponent:v12 isDirectory:0];

    id v32 = v11;
    LOBYTE(v17) = [v3 moveItemIfExistsAtURL:v15 toURL:v18 error:&v32];
    id v9 = v32;

    if ((v17 & 1) == 0)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        unint64_t v19 = [v15 path];
        uint64_t v26 = [v18 path];
        id v27 = v9;
        MOLogWrite();

        id v4 = &BZ2_bzRead_ptr;
      }

      id v9 = 0;
    }

    uint64_t v8 = (v8 + 1);
  }
  while (v31 != v8);
  gLogHandle = MOLogOpen();
  if (!gLogHandle) {
    syslog(3, "Failed to set up rotating logs at path %s", (const char *)[v28 fileSystemRepresentation]);
  }
  id v20 = v28;
  [v20 fileSystemRepresentation];
  MOLogEnableDiskLogging();
  ICLSetLoggingHandle();
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
    MOLogWrite();
  }
  signal(15, (void (__cdecl *)(int))1);
  stat v21 = dispatch_get_global_queue(21, 0);
  stat v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v21);
  dispatch_source_set_event_handler(v22, &stru_100020BF8);
  dispatch_activate(v22);
  uint64_t v23 = +[NSXPCListener serviceListener];
  unint64_t v24 = objc_opt_new();
  [v23 setDelegate:v24];

  [v23 resume];

  return 0;
}

void sub_10000ECB0(id a1)
{
  uint64_t v1 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
    uint64_t v1 = MOLogWrite();
  }
  _xpc_transaction_exit_clean(v1);
}

void sub_10000ED58(id a1)
{
  uint64_t v1 = [MILimitedConcurrencyQueue alloc];
  id v4 = +[MIDaemonConfiguration sharedInstance];
  id v2 = -[MILimitedConcurrencyQueue initWithName:width:](v1, "initWithName:width:", @"com.apple.MobileInstallationHelperService.LimitedConcurrencyQueue", [v4 nSimultaneousInstallations]);
  id v3 = (void *)qword_100025B50;
  qword_100025B50 = (uint64_t)v2;
}

void sub_10000FA68()
{
}

void sub_10000FB4C(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10000FACCLL);
  }
  JUMPOUT(0x10000FB60);
}

void sub_1000105B8()
{
}

void sub_1000106D8(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x100010654);
  }
  JUMPOUT(0x1000106ECLL);
}

void sub_100010D64()
{
}

void sub_100010E3C()
{
}

id sub_100011024(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_stageItemAtURL:options:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_100011304()
{
}

void sub_1000113C4()
{
}

void sub_1000114EC(id a1)
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.MobileInstallation.%s", "-[MobileInstallationHelperService makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:completion:]_block_invoke");
  id v3 = objc_claimAutoreleasedReturnValue();
  dispatch_workloop_t v1 = dispatch_workloop_create((const char *)[v3 UTF8String]);
  id v2 = (void *)qword_100025B60;
  qword_100025B60 = (uint64_t)v1;
}

id sub_100011560(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_100011B98(_Unwind_Exception *a1)
{
}

#error "100011C3C: call analysis failed (funcsize=37)"

void sub_100011C60()
{
}

void sub_100011DB8(id a1)
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.MobileInstallation.%s", "-[MobileInstallationHelperService createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:]_block_invoke");
  id v3 = objc_claimAutoreleasedReturnValue();
  dispatch_workloop_t v1 = dispatch_workloop_create((const char *)[v3 UTF8String]);
  id v2 = (void *)qword_100025B70;
  qword_100025B70 = (uint64_t)v1;
}

id sub_100011E2C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 72), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

void sub_100012174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

id sub_10001219C(uint64_t a1, void *a2, int a3, unsigned char *a4)
{
  id v7 = [a2 path];
  uint64_t v8 = [v7 substringFromIndex:*(void *)(a1 + 56)];

  id v9 = [*(id *)(a1 + 32) containsObject:v8];
  if (v9)
  {
    if (a3 == 4) {
      *a4 = 1;
    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v11 = [*(id *)(a1 + 40) path];
      MOLogWrite();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }

  return v9;
}

void sub_10001256C()
{
}

void sub_100012630()
{
}

void sub_100012770(id a1)
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.MobileInstallation.%s", "-[MobileInstallationHelperService createAppSnapshotWithBundleID:snapshotToURL:onlyV1AppIfPresent:placeholderOnly:completion:]_block_invoke");
  id v3 = objc_claimAutoreleasedReturnValue();
  dispatch_workloop_t v1 = dispatch_workloop_create((const char *)[v3 UTF8String]);
  id v2 = (void *)qword_100025B80;
  qword_100025B80 = (uint64_t)v1;
}

id sub_1000127E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_createAppSnapshotWithBundleID:snapshotToURL:onlyV1AppIfPresent:placeholderOnly:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(void *)(a1 + 56));
}

uint64_t sub_10001342C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W8>)
{
  *(void *)(a3 + 14) = v4;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = result;
  *(_WORD *)(a3 + 32) = a4;
  *(void *)(a3 + 34) = a2;
  return result;
}

void sub_100013448(uint64_t a1@<X2>, uint64_t a2@<X8>, float a3@<S0>)
{
  *(float *)a1 = a3;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2080;
}

uint64_t sub_10001345C(int a1, void *a2, size_t *a3, int a4)
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
  if (!sub_100013550(a1, (uint64_t)&v9))
  {
    if ((v9 & 0x3E) != 0x2E) {
      return 0;
    }
    if (v10 < 2)
    {
      if (HIDWORD(v10) == HIDWORD(v9) - 1) {
        return sub_100013A00(HIDWORD(v10), a2, a3);
      }
      if (a4) {
        return sub_1000138E8(a1, a2, a3, HIDWORD(v9), SHIDWORD(v10));
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

uint64_t sub_100013550(int a1, uint64_t a2)
{
  fat_header fat_header = 0;
  memset(&v21, 0, sizeof(v21));
  memset(&v20, 0, sizeof(v20));
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  uint64_t result = fstat(a1, &v20);
  if (result != -1)
  {
    if (sub_100013D20(a1, &fat_header, 8uLL, 0))
    {
      if (fat_header.magic != -1095041334) {
        return 0;
      }
      swap_fat_header(&fat_header, NX_LittleEndian);
      uint32_t nfat_arch = fat_header.nfat_arch;
      *(_DWORD *)(a2 + 4) = fat_header.nfat_arch;
      if (sub_100013D6C(a1, nfat_arch, &v21))
      {
        if (v21.cputype == 16777228)
        {
          long long v18 = 0u;
          long long v19 = 0u;
          if (v20.st_size > v21.offset && v21.size >= 0x1C && v20.st_size >= v21.size + v21.offset && v21.align <= 0x40)
          {
            if (v21.size + (unint64_t)v21.offset > 0x1F)
            {
              if (sub_100013D20(a1, &v18, 0x20uLL, v21.offset) && v18 == -17958193 && HIDWORD(v18) == 2)
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
            if (!sub_100013D6C(a1, v6, &v21)) {
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
            if (!sub_100013D20(a1, &v18, 0x20uLL, v21.offset)) {
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
                BOOL v12 = sub_100013DC0(a1, &v17, 8uLL, v11, v21.offset, v21.size);
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
              if (!sub_100013DC0(a1, &v15, 0x10uLL, v11, v21.offset, v21.size))
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

uint64_t sub_1000138E8(int a1, void *a2, size_t *a3, unsigned int a4, int a5)
{
  if (a4 >= 0x401)
  {
    id v5 = __error();
    int v6 = 22;
LABEL_7:
    *id v5 = v6;
    return 0xFFFFFFFFLL;
  }
  size_t v12 = 20 * a4 + 8;
  BOOL v13 = malloc_type_malloc(v12, 0x63868CB2uLL);
  if (!v13)
  {
    id v5 = __error();
    int v6 = 12;
    goto LABEL_7;
  }
  int v14 = v13;
  if (sub_100013D20(a1, v13, v12, 0))
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

uint64_t sub_100013A00(unsigned int a1, void *a2, void *a3)
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

uint64_t sub_100013A84(int a1, void *a2, void *a3)
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
  if (!sub_100013550(a1, (uint64_t)&v6))
  {
    if ((~v6 & 0x3E) != 0) {
      return 0;
    }
    if (v7 < 2)
    {
      if (HIDWORD(v7) == HIDWORD(v6)) {
        return sub_100013A00(HIDWORD(v7) + 1, a2, a3);
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

uint64_t sub_100013B4C(char *a1, int a2, unsigned char *a3)
{
  return sub_100013B5C(a1, 1, a2, a3);
}

uint64_t sub_100013B5C(char *a1, int a2, int a3, unsigned char *a4)
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
    if (!sub_10001345C(v8, &v21, &v20, a3)) {
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v12 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if (a3) {
    syslog(4, "allow_reorder not allowed for unhiding");
  }
  if (sub_100013A84(v9, &v21, &v20)) {
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

uint64_t sub_100013D10(char *a1, unsigned char *a2)
{
  return sub_100013B5C(a1, 0, 0, a2);
}

BOOL sub_100013D20(int a1, void *a2, size_t a3, off_t a4)
{
  ssize_t v5 = pread(a1, a2, a3, a4);
  ssize_t v6 = v5;
  if (v5 != a3 && v5 != -1) {
    *__error() = 5;
  }
  return v6 == a3;
}

BOOL sub_100013D6C(int a1, int a2, fat_arch *a3)
{
  BOOL v4 = sub_100013D20(a1, a3, 0x14uLL, 20 * a2 + 8);
  if (v4) {
    swap_fat_arch(a3, 1u, NX_LittleEndian);
  }
  return v4;
}

BOOL sub_100013DC0(int a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4 < 0 || (uint64_t)(a4 + a3) > a6 + a5)
  {
    *__error() = 34;
    return 0;
  }
  else
  {
    off_t v7 = a5 + a4;
    return sub_100013D20(a1, a2, a3, v7);
  }
}

void sub_100013E14()
{
}

void sub_100013E40()
{
}

void sub_100013E6C(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  strerror(v4);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100013F30(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100013FE0()
{
  int v0 = 136315138;
  dispatch_workloop_t v1 = "MIAssumeIdentity";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Attempting to assume an identity of 0/0, which should be the default for the helper service", (uint8_t *)&v0, 0xCu);
}

void sub_100014068()
{
  int v0 = 136315138;
  dispatch_workloop_t v1 = "MIRestoreIdentity";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Attempting to restore an identity without having first assumed an identity", (uint8_t *)&v0, 0xCu);
}

void sub_1000140F0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100013448(a3, (uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]", 4.8153e-34);
  sub_10001342C(v4, v5, v6, v7);
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: User %s does not have read/write but does have execute access to %@ : %s", v8, 0x2Au);
}

void sub_10001415C(void *a1, uint64_t a2, uint8_t *buf)
{
  int v4 = *(_DWORD *)(a2 + 16);
  int v5 = *(_DWORD *)(a2 + 20);
  int v6 = *(unsigned __int16 *)(a2 + 4);
  *(void *)(buf + 4) = "-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]";
  *((_WORD *)buf + 6) = 2080;
  *(_DWORD *)unint64_t buf = 136316418;
  *(void *)(buf + 14) = "_installd";
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a1;
  *((_WORD *)buf + 16) = 1024;
  *(_DWORD *)(buf + 34) = v4;
  *((_WORD *)buf + 19) = 1024;
  *((_DWORD *)buf + 1MIFetchInfoForUsername("mobile", (uid_t *)&dword_100025B10, (gid_t *)&dword_100025B14, 0) = v5;
  *((_WORD *)buf + 22) = 1024;
  *(_DWORD *)(buf + 46) = v6;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: User %s is unable to traverse past %@ %u/%u 0%o", buf, 0x32u);
}

void sub_100014204(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100013448(a3, (uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]", 4.8153e-34);
  sub_10001342C(v4, v5, v6, v7);
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: User %s is unable to traverse past %@ but lstat of that path failed: %s", v8, 0x2Au);
}

int BZ2_bzRead(int *bzerror, BZFILE *b, void *buf, int len)
{
  return _BZ2_bzRead(bzerror, b, buf, len);
}

void BZ2_bzReadClose(int *bzerror, BZFILE *b)
{
}

BZFILE *__cdecl BZ2_bzReadOpen(int *bzerror, FILE *f, int verbosity, int small, void *unused, int nUnused)
{
  return _BZ2_bzReadOpen(bzerror, f, verbosity, small, unused, nUnused);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return _CFBundleGetInfoDictionary(bundle);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return _CFCopyTypeIDDescription(type_id);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

uint64_t ICLSetLoggingHandle()
{
  return _ICLSetLoggingHandle();
}

uint64_t LICreateDeviceAppropriateHomeScreenIconImageFromBundle()
{
  return _LICreateDeviceAppropriateHomeScreenIconImageFromBundle();
}

uint64_t LICreateIconForBundleAndDisplayGamut()
{
  return _LICreateIconForBundleAndDisplayGamut();
}

uint64_t MOLogEnableDiskLogging()
{
  return _MOLogEnableDiskLogging();
}

uint64_t MOLogOpen()
{
  return _MOLogOpen();
}

uint64_t MOLogWrite()
{
  return _MOLogWrite();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return __CFBundleCopyInfoPlistURL();
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return __CFBundleCreateFilteredInfoPlist();
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return __CFCopySystemVersionDictionaryValue();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return __CFPropertyListCreateFiltered();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return _audit_token_to_egid(atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return _audit_token_to_euid(atoken);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

uint64_t container_copy_object()
{
  return _container_copy_object();
}

uint64_t container_copy_unlocalized_description()
{
  return _container_copy_unlocalized_description();
}

uint64_t container_delete_all_container_content()
{
  return _container_delete_all_container_content();
}

uint64_t container_disk_usage()
{
  return _container_disk_usage();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_error_free()
{
  return _container_error_free();
}

uint64_t container_error_get_path()
{
  return _container_error_get_path();
}

uint64_t container_error_get_posix_errno()
{
  return _container_error_get_posix_errno();
}

uint64_t container_error_get_type()
{
  return _container_error_get_type();
}

uint64_t container_free_array_of_containers()
{
  return _container_free_array_of_containers();
}

uint64_t container_free_object()
{
  return _container_free_object();
}

uint64_t container_get_class()
{
  return _container_get_class();
}

uint64_t container_get_error_description()
{
  return _container_get_error_description();
}

uint64_t container_get_identifier()
{
  return _container_get_identifier();
}

uint64_t container_get_info_value_for_key()
{
  return _container_get_info_value_for_key();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_get_persona_unique_string()
{
  return _container_get_persona_unique_string();
}

uint64_t container_is_equal()
{
  return _container_is_equal();
}

uint64_t container_is_new()
{
  return _container_is_new();
}

uint64_t container_is_transient()
{
  return _container_is_transient();
}

uint64_t container_operation_delete_array()
{
  return _container_operation_delete_array();
}

uint64_t container_operation_delete_reclaim_disk_space()
{
  return _container_operation_delete_reclaim_disk_space();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_create_from_container()
{
  return _container_query_create_from_container();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_iterate_results_sync()
{
  return _container_query_iterate_results_sync();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_group_identifiers()
{
  return _container_query_set_group_identifiers();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_include_other_owners()
{
  return _container_query_set_include_other_owners();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

uint64_t container_query_set_transient()
{
  return _container_query_set_transient();
}

uint64_t container_recreate_structure()
{
  return _container_recreate_structure();
}

uint64_t container_regenerate_uuid()
{
  return _container_regenerate_uuid();
}

uint64_t container_replace()
{
  return _container_replace();
}

uint64_t container_serialize_copy_deserialized_reference()
{
  return _container_serialize_copy_deserialized_reference();
}

uint64_t container_serialize_copy_serialized_reference()
{
  return _container_serialize_copy_serialized_reference();
}

uint64_t container_set_info_value()
{
  return _container_set_info_value();
}

uint64_t container_subdirectories_for_class()
{
  return _container_subdirectories_for_class();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

void dispatch_activate(dispatch_object_t object)
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
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return _fcopyfile(from_fd, to_fd, a3, flags);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _fgetxattr(fd, name, value, size, position, options);
}

void free(void *a1)
{
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _fsetxattr(fd, name, value, size, position, options);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTS *__cdecl fts_open_b(char *const *a1, int a2, void *a3)
{
  return _fts_open_b(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return _fts_set(a1, a2, a3);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return _funopen(a1, a2, a3, a4, a5);
}

gid_t getegid(void)
{
  return _getegid();
}

uid_t geteuid(void)
{
  return _geteuid();
}

gid_t getgid(void)
{
  return _getgid();
}

pid_t getpid(void)
{
  return _getpid();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return _getpwnam_r(a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return _getpwuid_r(a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return _getuid();
}

int initgroups(const char *a1, int a2)
{
  return _initgroups(a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return _lchown(a1, a2, a3);
}

int link(const char *a1, const char *a2)
{
  return _link(a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

int madvise(void *a1, size_t a2, int a3)
{
  return _madvise(a1, a2, a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return _pthread_setugid_np(a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_activeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 activeIdentifiers];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowsInternalSecurityPolicy(void *a1, const char *a2, ...)
{
  return [a1 allowsInternalSecurityPolicy];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleName(void *a1, const char *a2, ...)
{
  return [a1 bundleName];
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return [a1 bundleType];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cfBundle(void *a1, const char *a2, ...)
{
  return [a1 cfBundle];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_containerClass(void *a1, const char *a2, ...)
{
  return [a1 containerClass];
}

id objc_msgSend_containerURL(void *a1, const char *a2, ...)
{
  return [a1 containerURL];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentUserCachesDirectory(void *a1, const char *a2, ...)
{
  return [a1 currentUserCachesDirectory];
}

id objc_msgSend_currentUserDataDirectory(void *a1, const char *a2, ...)
{
  return [a1 currentUserDataDirectory];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataContainerRootItemNames(void *a1, const char *a2, ...)
{
  return [a1 dataContainerRootItemNames];
}

id objc_msgSend_dataDirectory(void *a1, const char *a2, ...)
{
  return [a1 dataDirectory];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_descString(void *a1, const char *a2, ...)
{
  return [a1 descString];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destURL(void *a1, const char *a2, ...)
{
  return [a1 destURL];
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return [a1 diskUsage];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return [a1 gid];
}

id objc_msgSend_helperLogDirectory(void *a1, const char *a2, ...)
{
  return [a1 helperLogDirectory];
}

id objc_msgSend_iTunesMetadataURL(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadataURL];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierQueue(void *a1, const char *a2, ...)
{
  return [a1 identifierQueue];
}

id objc_msgSend_infoPlistSubset(void *a1, const char *a2, ...)
{
  return [a1 infoPlistSubset];
}

id objc_msgSend_installAndStagingQueue(void *a1, const char *a2, ...)
{
  return [a1 installAndStagingQueue];
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return [a1 internalQueue];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isTransient(void *a1, const char *a2, ...)
{
  return [a1 isTransient];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logDirectory(void *a1, const char *a2, ...)
{
  return [a1 logDirectory];
}

id objc_msgSend_mcmContainer(void *a1, const char *a2, ...)
{
  return [a1 mcmContainer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nSimultaneousInstallations(void *a1, const char *a2, ...)
{
  return [a1 nSimultaneousInstallations];
}

id objc_msgSend_oldArchiveDirectory(void *a1, const char *a2, ...)
{
  return [a1 oldArchiveDirectory];
}

id objc_msgSend_oldDataDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 oldDataDirectoryPath];
}

id objc_msgSend_oldLoggingPath(void *a1, const char *a2, ...)
{
  return [a1 oldLoggingPath];
}

id objc_msgSend_onlyV1(void *a1, const char *a2, ...)
{
  return [a1 onlyV1];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_performAPFSClone(void *a1, const char *a2, ...)
{
  return [a1 performAPFSClone];
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 personaUniqueString];
}

id objc_msgSend_placeholderOnly(void *a1, const char *a2, ...)
{
  return [a1 placeholderOnly];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resultDict(void *a1, const char *a2, ...)
{
  return [a1 resultDict];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_roleUserMigrationMarkerFilePath(void *a1, const char *a2, ...)
{
  return [a1 roleUserMigrationMarkerFilePath];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stagingRootForSystemContent(void *a1, const char *a2, ...)
{
  return [a1 stagingRootForSystemContent];
}

id objc_msgSend_stagingRootForUserContent(void *a1, const char *a2, ...)
{
  return [a1 stagingRootForUserContent];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_waitingOperations(void *a1, const char *a2, ...)
{
  return [a1 waitingOperations];
}

id objc_msgSend_watchKitAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 watchKitAppBundleID];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}