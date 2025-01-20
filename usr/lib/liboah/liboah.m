const char *oah_get_runtime_location()
{
  return "/usr/libexec/rosetta/runtime";
}

BOOL oah_is_translation_available()
{
  return rosetta_is_translation_available_on_volume((std::string *)"/");
}

uint64_t oah_is_current_process_translated()
{
  if (qword_26B434AD8 != -1) {
    dispatch_once(&qword_26B434AD8, &unk_270ED2878);
  }
  return byte_26AA36B48;
}

uint64_t oah_is_process_translated(int a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (proc_pidinfo(a1, 13, 0, buffer, 64) == 64) {
    return (v3 >> 25) & 1;
  }
  else {
    return 0;
  }
}

char *rosetta_create_exit_payload_string(const char *a1, size_t a2, char *__s1)
{
  if (!__s1) {
    return 0;
  }
  size_t v6 = strnlen(__s1, 0x400uLL);
  v7 = byte_26AA36348;
  memcpy(byte_26AA36348, __s1, v6);
  strlcpy(&byte_26AA36348[v6], a1, a2);
  return v7;
}

const char *rosetta_get_runtime_location()
{
  return "/usr/libexec/rosetta/runtime";
}

BOOL rosetta_is_translation_available_on_volume(std::string *a1)
{
  memset(&v7, 0, sizeof(v7));
  v1 = (std::string *)((char *)a1 - 1);
  do
  {
    int v2 = v1->__r_.__value_.__s.__data_[1];
    v1 = (std::string *)((char *)v1 + 1);
  }
  while (v2);
  sub_263D99B24(&v7, a1, v1);
  std::string::append(&v7, "/Library/Apple/usr/libexec/oah/libRosettaRuntime");
  v6.__val_ = 0;
  v6.__cat_ = std::system_category();
  std::__fs::filesystem::__status((const std::__fs::filesystem::path *)&v7, &v6);
  if (v8)
  {
    v6.__val_ = 0;
    std::system_category();
    uint64_t v3 = v8;
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
  if (v3) {
    BOOL v4 = v3 == 255;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

std::string *sub_263D99B24(std::string *this, std::string *a2, std::string *a3)
{
  BOOL v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = (char *)a3 - (char *)a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    v10 = this;
  }
  if (v10 > v4 || (std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    v13 = this;
    if ((v6 & 0x80) != 0) {
      v13 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    v14 = (char *)v13 + size;
    do
    {
      std::string::value_type v15 = v4->__r_.__value_.__s.__data_[0];
      BOOL v4 = (std::string *)((char *)v4 + 1);
      *v14++ = v15;
    }
    while (v4 != a3);
    std::string::value_type *v14 = 0;
    std::string::size_type v16 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v16;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v16 & 0x7F;
    }
  }
  else
  {
    if (v7 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    if (v7 > 0x16)
    {
      uint64_t v17 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17) {
        uint64_t v17 = v7 | 7;
      }
      uint64_t v18 = v17 + 1;
      p_p = (std::string::value_type *)operator new(v17 + 1);
      std::string::size_type v24 = v7;
      int64_t v25 = v18 | 0x8000000000000000;
      __p = p_p;
    }
    else
    {
      HIBYTE(v25) = v7;
      p_p = (std::string::value_type *)&__p;
    }
    do
    {
      std::string::value_type v19 = v4->__r_.__value_.__s.__data_[0];
      BOOL v4 = (std::string *)((char *)v4 + 1);
      *p_p++ = v19;
    }
    while (v4 != a3);
    std::string::value_type *p_p = 0;
    if (v25 >= 0) {
      v20 = (const std::string::value_type *)&__p;
    }
    else {
      v20 = (const std::string::value_type *)__p;
    }
    if (v25 >= 0) {
      std::string::size_type v21 = HIBYTE(v25);
    }
    else {
      std::string::size_type v21 = v24;
    }
    std::string::append(this, v20, v21);
    if (SHIBYTE(v25) < 0) {
      operator delete(__p);
    }
  }
  return this;
}

BOOL rosetta_is_translation_available()
{
  return rosetta_is_translation_available_on_volume((std::string *)"/");
}

BOOL rosetta_has_been_previously_installed_on_volume(std::string *a1)
{
  memset(&v7, 0, sizeof(v7));
  int v2 = (std::string *)((char *)a1 - 1);
  do
  {
    int v3 = v2->__r_.__value_.__s.__data_[1];
    int v2 = (std::string *)((char *)v2 + 1);
  }
  while (v3);
  sub_263D99B24(&v7, a1, v2);
  std::string::append(&v7, "/Library/Apple/usr/share/rosetta/rosetta");
  v6.__val_ = 0;
  v6.__cat_ = std::system_category();
  std::__fs::filesystem::__status((const std::__fs::filesystem::path *)&v7, &v6);
  BOOL v4 = v8 && (v6.__val_ = 0, v6.__cat_ = std::system_category(), v8 != 255) && v8
    || rosetta_is_translation_available_on_volume(a1);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
  return v4;
}

BOOL rosetta_has_been_previously_installed()
{
  return rosetta_has_been_previously_installed_on_volume((std::string *)"/");
}

uint64_t rosetta_is_current_process_translated()
{
  if (qword_26B434AD8 != -1) {
    dispatch_once(&qword_26B434AD8, &unk_270ED2878);
  }
  return byte_26AA36B48;
}

uint64_t sub_263D99DE4()
{
  int v2 = 0;
  size_t v1 = 4;
  uint64_t result = sysctlbyname("sysctl.proc_translated", &v2, &v1, 0, 0);
  byte_26AA36B48 = v2 > 0;
  return result;
}

uint64_t rosetta_is_process_translated(int a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (proc_pidinfo(a1, 13, 0, buffer, 64) == 64) {
    return (v3 >> 25) & 1;
  }
  else {
    return 0;
  }
}

uint64_t rosetta_has_platform_support()
{
  uint64_t v0 = (MEMORY[0xFFFFFC010] >> 34) & 1;
  if ((~MEMORY[0xFFFFFC010] & 0x6000000000) == 0) {
    LODWORD(v0) = 1;
  }
  if ((~MEMORY[0xFFFFFC010] & 0x9000000000) != 0) {
    return 0;
  }
  else {
    return v0;
  }
}

uint64_t rosetta_get_preferred_architecture_from_architectures(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 16777228;
  if (a2)
  {
    uint64_t v3 = 0;
    char v4 = 0;
    int v5 = 0;
    while (1)
    {
      int v6 = *(_DWORD *)(a1 + 4 * v3);
      if (v6 == 16777223) {
        break;
      }
      if (v6 == 16777228)
      {
        ++v3;
        char v4 = 1;
        if (v3 == a2) {
          return v2;
        }
      }
      else
      {
LABEL_8:
        if (a2 == ++v3)
        {
          if (v4) {
            return v2;
          }
          goto LABEL_12;
        }
      }
    }
    int v5 = 1;
    goto LABEL_8;
  }
  int v5 = 0;
LABEL_12:
  if ((rosetta_is_translation_available_on_volume((std::string *)"/") & v5) != 0) {
    return 16777223;
  }
  else {
    return 0;
  }
}

uint64_t rosetta_convert_to_rosetta_absolute_time()
{
  return __udivti3();
}

uint64_t rosetta_convert_to_system_absolute_time()
{
  return __udivti3();
}

const char *rosetta_get_runtime_version()
{
  MEMORY[0x270FA5388]();
  v142[4091] = *MEMORY[0x263EF8340];
  int v1 = open("/Library/Apple/usr/libexec/oah/libRosettaRuntime", 256);
  if (v1 < 0) {
    return 0;
  }
  int v2 = v1;
  if (pread(v1, &__buf, 0x10uLL, 0) == 16)
  {
    if (__buf == -1095041334)
    {
      unsigned __int8 v4 = 0;
    }
    else if (__buf == -17958193)
    {
      unsigned __int8 v4 = 1;
    }
    else if (__buf == 0x2031765F646C7964 && v139 == 0x34365F36387820)
    {
      unsigned __int8 v4 = 2;
    }
    else if (__buf == 0x6568636143746F41)
    {
      unsigned __int8 v4 = 3;
    }
    else
    {
      unsigned __int8 v4 = 4;
    }
  }
  else
  {
    unsigned __int8 v4 = 4;
  }
  off_t v6 = lseek(v2, 0, 2);
  if (v6 < 0 || v4 - 2 < 3) {
    goto LABEL_19;
  }
  unint64_t v10 = v6;
  if (v4 == 1)
  {
    off_t v27 = 0;
    unint64_t v28 = v6;
  }
  else if (v4)
  {
    off_t v27 = 0;
    unint64_t v28 = 0;
  }
  else
  {
    if (pread(v2, &__buf, 0x1000uLL, 0) != 4096) {
      goto LABEL_19;
    }
    unint64_t v11 = bswap32(HIDWORD(__buf));
    if (v11 > 0xCC || !HIDWORD(__buf)) {
      goto LABEL_19;
    }
    unint64_t v12 = 0;
    BOOL v13 = 0;
    v14 = v142;
    do
    {
      std::string::value_type v15 = (char *)&v139 + 20 * v12;
      unsigned int v16 = bswap32(*((_DWORD *)v15 + 2));
      if (v16 < 20 * (int)v11 + 8) {
        break;
      }
      unsigned int v17 = bswap32(v141[5 * v12]);
      BOOL v104 = __CFADD__(v16, v17);
      unsigned int v18 = v16 + v17;
      if (v104 || (v16 & ~(-1 << v15[19])) != 0) {
        break;
      }
      int32x2_t v19 = *(int32x2_t *)v15;
      v20 = (unsigned int *)v14;
      unint64_t v21 = v12;
      while (++v21 < v11)
      {
        int32x2_t v22 = vceq_s32(v19, *(int32x2_t *)(v20 - 3));
        if ((v22.i32[0] & v22.i32[1] & 1) == 0)
        {
          unsigned int v24 = *(v20 - 1);
          unsigned int v23 = *v20;
          v20 += 5;
          unsigned int v25 = bswap32(v24);
          BOOL v26 = v16 < v25 + bswap32(v23);
          if (v16 <= v25) {
            BOOL v26 = v25 < v18;
          }
          if (!v26) {
            continue;
          }
        }
        goto LABEL_164;
      }
      ++v12;
      v14 = (void *)((char *)v14 + 20);
      BOOL v13 = v12 >= v11;
    }
    while (v12 != v11);
LABEL_164:
    if (!v13) {
      goto LABEL_19;
    }
    unint64_t v28 = 0;
    off_t v27 = 0;
    v91 = v141;
    do
    {
      if (*(v91 - 3) == 201326593)
      {
        unint64_t v28 = bswap32(*v91);
        off_t v27 = bswap32(*(v91 - 1));
      }
      v91 += 5;
      --v11;
    }
    while (v11);
    if (!v27)
    {
LABEL_19:
      int v7 = 0;
      int v8 = 0;
      goto LABEL_20;
    }
  }
  ssize_t v29 = pread(v2, &__buf, 0x8000uLL, v27);
  int v7 = 0;
  if (v29 < 4096 || v28 + v27 > v10)
  {
    int v8 = 0;
    goto LABEL_20;
  }
  int v8 = 0;
  if (!HIDWORD(v28))
  {
    int v30 = 0;
    if (v29 < 0x20 || __buf != -17958193) {
      goto LABEL_223;
    }
    int v7 = 0;
    if (HIDWORD(__buf) == 16777228)
    {
      int v30 = 0;
      if (HIDWORD(v139) > 8) {
        goto LABEL_223;
      }
      int v7 = 0;
      if (((1 << SBYTE4(v139)) & 0x1C4) != 0)
      {
        int v30 = 0;
        if (v141[0] > 0xFFFFFFDF || (v141[0] + 32) > 0x8000uLL) {
          goto LABEL_223;
        }
        uint64_t v136 = v141[0];
        unint64_t v137 = v141[0] + 32;
        int v7 = 0;
        if (v141[0] + 32 <= v29)
        {
          unint64_t v31 = v140;
          if (v140)
          {
            int v124 = 0;
            char v129 = 0;
            int v32 = 0;
            unint64_t v33 = 0;
            uint64_t v132 = 0;
            uint64_t v133 = 0;
            uint64_t v34 = 0;
            unint64_t v126 = 0;
            uint64_t v127 = 0;
            unint64_t v125 = 0;
            int v134 = 0;
            int v35 = 0;
            LOBYTE(v128) = 0;
            int v8 = 0;
            unint64_t v130 = -1;
            unint64_t v131 = 0;
            uint64_t v36 = 32;
            unsigned int v37 = v141[0] + 32;
            while (1)
            {
              uint64_t v38 = v36 + 8;
              if ((unint64_t)(v36 + 8) >> 32) {
                BOOL v39 = 1;
              }
              else {
                BOOL v39 = v38 > v37;
              }
              if (v39) {
                goto LABEL_179;
              }
              v40 = (char *)&__buf + v36;
              uint64_t v41 = *(unsigned int *)((char *)&__buf + v36 + 4);
              if (v41 < 8) {
                goto LABEL_179;
              }
              uint64_t v42 = v36 + v41;
              if ((unint64_t)(v36 + v41) >> 32 || v42 > v37) {
                goto LABEL_179;
              }
              int v44 = *(_DWORD *)v40;
              if (*(int *)v40 <= 26)
              {
                if (v44 <= 4)
                {
                  if (v44 == -2147483608)
                  {
                    int v30 = 0;
                    if (v32) {
                      goto LABEL_223;
                    }
                    int v7 = 0;
                    if (v41 != 24) {
                      goto LABEL_224;
                    }
                    unint64_t v33 = *((void *)v40 + 1);
                    int v32 = 1;
                    unsigned int v37 = v137;
                  }
                  else if (v44 == -892679679 {
                         && (v41 != 32
                  }
                          || (*((unsigned int *)v40 + 4) + 32 * (unint64_t)*((unsigned int *)v40 + 5)) >> 32
                          || __CFADD__(*((_DWORD *)v40 + 2), *((_DWORD *)v40 + 3))))
                  {
                    goto LABEL_179;
                  }
                }
                else
                {
                  switch(v44)
                  {
                    case 5:
                      if (v32) {
                        goto LABEL_179;
                      }
                      int v30 = 0;
                      uint64_t v50 = (v38 << 31 >> 31) + 4;
                      uint64_t v51 = v50 << 31 >> 31;
                      if (v51 != v50 || v51 < 0) {
                        goto LABEL_223;
                      }
                      int v7 = 0;
                      if (v50 > v42) {
                        goto LABEL_224;
                      }
                      if (*(_DWORD *)((char *)&__buf + (v36 + 8)) != 6
                        || (unint64_t)(v36 + 272) >> 32)
                      {
                        goto LABEL_179;
                      }
                      int v30 = 0;
                      uint64_t v52 = ((v36 + 272) << 31 >> 31) + 8;
                      uint64_t v53 = v52 << 31 >> 31;
                      if (v53 != v52 || v53 < 0) {
                        goto LABEL_223;
                      }
                      int v7 = 0;
                      if (v52 > v42) {
                        goto LABEL_224;
                      }
                      unint64_t v33 = *(uint64_t *)((char *)&__buf + (v36 + 272));
                      int v32 = 2;
                      unsigned int v37 = v137;
                      break;
                    case 14:
                      char v129 = 1;
                      break;
                    case 25:
                      if (v41 < 0x48) {
                        goto LABEL_179;
                      }
                      int v120 = v35;
                      int v121 = v32;
                      unint64_t v122 = v33;
                      unint64_t v123 = v31;
                      int v30 = 0;
                      uint64_t v45 = *((unsigned int *)v40 + 16);
                      unint64_t v46 = (80 * v45) & 0xFFFFFFF0;
                      if (80 * v45 != v46) {
                        goto LABEL_223;
                      }
                      uint64_t v119 = v34;
                      if (v46 > 0xFFFFFFB7) {
                        goto LABEL_223;
                      }
                      int v7 = 0;
                      if (80 * v45 + 72 != v41) {
                        goto LABEL_224;
                      }
                      LODWORD(v133) = v133 + 1;
                      uint64_t v0 = v40 + 8;
                      if (strcmp(v40 + 8, "__PAGEZERO"))
                      {
                        if (!strcmp(v40 + 8, "__LINKEDIT"))
                        {
                          if (v125 != v126) {
                            goto LABEL_179;
                          }
                          unint64_t v47 = *((void *)v40 + 3);
                          unint64_t v48 = *((void *)v40 + 4) + v47;
                          LODWORD(v127) = *((_DWORD *)v40 + 12) + *((_DWORD *)v40 + 10);
                          unint64_t v125 = v48;
                          unint64_t v126 = v47;
                        }
                        else
                        {
                          unint64_t v47 = *((void *)v40 + 3);
                          unint64_t v48 = *((void *)v40 + 4) + v47;
                        }
                        unint64_t v54 = v130;
                        if (v47 < v130) {
                          unint64_t v54 = v47;
                        }
                        unint64_t v55 = v131;
                        if (v48 > v131) {
                          unint64_t v55 = v48;
                        }
                        unint64_t v130 = v54;
                        unint64_t v131 = v55;
                        if (v45)
                        {
                          v56 = (char *)&__buf + v36 + 72;
                          int v57 = strncmp(v40 + 8, "__DATA", 0x10uLL);
                          int v58 = 0;
                          unsigned int v135 = 0;
                          do
                          {
                            if (!v57)
                            {
                              if (strncmp(v56, "__stubs_sh", 0x10uLL))
                              {
                                uint64_t v73 = strncmp(v56, "__all_image_info", 0x10uLL);
                                if (!v73)
                                {
                                  if (v134) {
                                    sub_263D9AB50(v73, 518, v74, v75, v76, v77, v78, v79, v118);
                                  }
                                  int v134 = 1;
                                }
                              }
                            }
                            if (!strncmp(v0, "__DATA_DIRTY", 0x10uLL))
                            {
                              uint64_t v59 = strncmp(v56, "__all_image_info", 0x10uLL);
                              if (!v59)
                              {
                                if (v134) {
                                  sub_263D9AB50(v59, 528, v60, v61, v62, v63, v64, v65, v118);
                                }
                                int v134 = 1;
                              }
                            }
                            if ((v56[65] & 4) != 0)
                            {
                              uint64_t v66 = *((void *)v56 + 5);
                              if (v66)
                              {
                                char v67 = v58;
                                int v30 = 0;
                                uint64_t v68 = *((unsigned int *)v56 + 12);
                                unint64_t v69 = v68 + v66;
                                if (__CFADD__(v68, v66)) {
                                  goto LABEL_223;
                                }
                                int v7 = 0;
                                if (HIDWORD(v69)) {
                                  goto LABEL_224;
                                }
                                if (__CFADD__(*((void *)v56 + 4), v66)) {
                                  goto LABEL_179;
                                }
                                unsigned int v70 = v135;
                                if (v135 <= v69) {
                                  unsigned int v70 = v69;
                                }
                                if ((v67 & 1) == 0) {
                                  unsigned int v70 = v69;
                                }
                                unsigned int v135 = v70;
                                if (!strncmp(v0, "__TEXT", 0x10uLL))
                                {
                                  int v71 = strncmp(v56, "__stubs", 0x10uLL);
                                  int v72 = HIDWORD(v133);
                                  if (!v71) {
                                    int v72 = v69;
                                  }
                                  HIDWORD(v133) = v72;
                                }
                                int v58 = 1;
                              }
                            }
                            v56 += 80;
                            --v45;
                          }
                          while (v45);
                          int v80 = v124 | v58 ^ 1;
                          unsigned int v81 = HIDWORD(v127);
                          if ((v80 & 1) == 0) {
                            unsigned int v81 = v135;
                          }
                          HIDWORD(v127) = v81;
                          v124 |= v80 ^ 1;
                        }
                      }
                      unsigned int v37 = v137;
                      unint64_t v33 = v122;
                      unint64_t v31 = v123;
                      int v35 = v120;
                      int v32 = v121;
                      uint64_t v34 = v119;
                      break;
                  }
                }
                goto LABEL_161;
              }
              if (v44 <= 35)
              {
                if (v44 == 27)
                {
                  if ((v41 != 24) | BYTE4(v132) & 1) {
                    goto LABEL_179;
                  }
                  BYTE4(v132) = 1;
                }
                else if (v44 == 29)
                {
                  if ((v41 != 16) | v132 & 1) {
                    goto LABEL_179;
                  }
                  LOBYTE(v132) = 1;
                }
                goto LABEL_161;
              }
              if (v44 == 36) {
                break;
              }
              if (v44 == 42)
              {
                if (!v8)
                {
                  if (v41 != 16) {
                    goto LABEL_179;
                  }
                  unint64_t v128 = *((void *)v40 + 1);
                  unint64_t v118 = v128 >> 8;
                }
                int v8 = 1;
                goto LABEL_161;
              }
              if (v44 == 50)
              {
                if (v35) {
                  goto LABEL_114;
                }
                if (v41 < 0x18) {
                  goto LABEL_179;
                }
                int v49 = *((_DWORD *)v40 + 2);
                if (v49 == 6 || v49 == 1) {
                  goto LABEL_114;
                }
                int v35 = 0;
              }
LABEL_161:
              ++v34;
              uint64_t v36 = v42;
              if (v34 == v31)
              {
                uint64_t v82 = v42 - 32;
                unsigned int v84 = v133;
                unsigned int v83 = HIDWORD(v133);
                unsigned int v86 = v127;
                unsigned int v85 = HIDWORD(v127);
                unsigned __int8 v87 = v128;
                unint64_t v89 = v130;
                unint64_t v88 = v131;
                char v90 = v129;
                goto LABEL_172;
              }
            }
            if (!v35)
            {
              int v35 = 1;
              if (v41 != 16) {
                goto LABEL_179;
              }
              goto LABEL_161;
            }
LABEL_114:
            int v35 = 1;
            goto LABEL_161;
          }
          int v8 = 0;
          unsigned __int8 v87 = 0;
          unsigned int v86 = 0;
          unsigned int v83 = 0;
          unsigned int v85 = 0;
          unint64_t v88 = 0;
          uint64_t v82 = 0;
          unsigned int v84 = 0;
          unint64_t v33 = 0;
          int v32 = 0;
          char v90 = 0;
          unint64_t v89 = -1;
LABEL_172:
          if (v82 == v136 && (v32 != 1) | v90 & 1)
          {
            if (v32 != 1)
            {
              if (!v32)
              {
                int v30 = 0;
                goto LABEL_182;
              }
              goto LABEL_180;
            }
            BOOL v104 = __CFADD__(v89, v33);
            v33 += v89;
            if (!v104)
            {
LABEL_180:
              int v30 = 0;
              if (v33 >= v89 && v88 > v33)
              {
LABEL_182:
                if (v84 <= 0xFF)
                {
                  int v7 = 0;
                  unint64_t v92 = v31;
                  if (v31)
                  {
                    unint64_t v93 = 0;
                    char v94 = 0;
                    uint64_t v95 = 32;
                    do
                    {
                      v96 = (char *)&__buf + v95;
                      int v97 = *(_DWORD *)((char *)&__buf + v95);
                      v95 += *(unsigned int *)((char *)&__buf + v95 + 4);
                      if (v97 == 25)
                      {
                        unsigned int v98 = *((_DWORD *)v96 + 15);
                        if (v98 > 7 || *((_DWORD *)v96 + 14) > 7u) {
                          goto LABEL_179;
                        }
                        if (v98 && (*((_DWORD *)v96 + 15) & 1) == 0) {
                          goto LABEL_179;
                        }
                        unint64_t v100 = *((void *)v96 + 5);
                        unint64_t v101 = *((void *)v96 + 6);
                        if (!v100 && v101)
                        {
                          if ((v101 < v137) | v94 & 1) {
                            goto LABEL_179;
                          }
                          char v94 = 1;
                        }
                        uint64_t v102 = *((void *)v96 + 4);
                        unint64_t v103 = v93 + 1;
                        if (v101 | v102) {
                          BOOL v104 = v103 >= v92;
                        }
                        else {
                          BOOL v104 = 1;
                        }
                        if (!v104)
                        {
                          unint64_t v105 = v101 + v100;
                          unint64_t v106 = *((void *)v96 + 3);
                          unint64_t v107 = v102 + v106;
                          unint64_t v108 = v92 - 1 - v93;
                          uint64_t v109 = v95;
                          do
                          {
                            v110 = (uint64_t *)((char *)&__buf + v109);
                            if (*(_DWORD *)((char *)&__buf + v109) == 25)
                            {
                              uint64_t v111 = v110[6];
                              uint64_t v112 = v110[4];
                              if (v111 | v112)
                              {
                                unint64_t v113 = v110[5];
                                unint64_t v114 = v113 + v111;
                                if (v113 < v105 && v100 < v114) {
                                  goto LABEL_179;
                                }
                                unint64_t v116 = v110[3];
                                if (v106 < v112 + v116 && v116 < v107) {
                                  goto LABEL_179;
                                }
                              }
                            }
                            v109 += *(unsigned int *)((char *)&__buf + v109 + 4);
                          }
                          while (--v108);
                        }
                      }
                      else
                      {
                        unint64_t v103 = v93 + 1;
                      }
                      unint64_t v93 = v103;
                    }
                    while (v103 != v92);
                    if ((v94 & 1) == 0) {
                      goto LABEL_179;
                    }
                    int v7 = 0;
                    uint64_t v0 = (const char *)(v87 | (v118 << 8));
                    if (v137 <= v28
                      && v85 <= v28
                      && v86 <= v28
                      && v83 <= v28)
                    {
                      int v7 = 1;
                      int v30 = v8;
                      goto LABEL_224;
                    }
                    goto LABEL_20;
                  }
                  goto LABEL_224;
                }
              }
LABEL_223:
              int v7 = 0;
              goto LABEL_224;
            }
          }
LABEL_179:
          int v30 = 0;
          int v7 = 0;
        }
      }
    }
LABEL_224:
    int v8 = v30;
  }
LABEL_20:
  close(v2);
  if (v8) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return 0;
  }
  else {
    return v0;
  }
}

uint64_t rosetta_get_expected_version()
{
  return 0x1560000000000;
}

uint64_t aot_symbolication_session_create()
{
  return 0;
}

uint64_t aot_init_shared_cache_info()
{
  return 0;
}

uint64_t aot_address_in_shared_cache()
{
  return 0;
}

uint64_t aot_get_shared_cache_fragment_type()
{
  return 0;
}

uint64_t aot_get_x86_address_shared_cache()
{
  return 0;
}

uint64_t aot_get_x86_address()
{
  return 0;
}

uint64_t rosetta_thread_get_state()
{
  return 46;
}

uint64_t rosetta_get_x86_thread_state()
{
  return 5;
}

uint64_t rosetta_get_rflags()
{
  return 0;
}

uint64_t oah_get_x86_thread_state()
{
  return 5;
}

uint64_t oah_get_rflags()
{
  return 0;
}

void sub_263D9AB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = vsnprintf(__str, 0x400uLL, "encountered multiple dyld __all_image_info", &a9);
  sub_263D9ABB8(v9, v10, v11, v12, v13, v14, v15, v16, (char)"!dyld_all_image_infos_addr.has_value()");
}

void sub_263D9ABB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_263D9AC04()
{
  dprintf(2, "%s %s", byte_26AA36B50, &byte_26AA36B50[1024]);
  __crashreporter_info__ = (uint64_t)byte_26AA36B50;
  uint64_t v0 = (std::string *)abort_with_payload();
  std::string::append(v0, v1);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98910]();
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
}

void abort(void)
{
}

uint64_t abort_with_payload()
{
  return MEMORY[0x270ED8460]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x270ED9668](*(void *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}