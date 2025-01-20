void __cxa_bad_cast(void)
{
  std::bad_cast *exception;
  std::bad_cast *v1;

  exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_cast::bad_cast(exception);
}

void __cxa_bad_typeid(void)
{
  exception = (std::bad_typeid *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_typeid::bad_typeid(exception);
}

void __cxa_throw_bad_array_new_length(void)
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void demangling_terminate_handler(void)
{
  globals_fast = (const _Unwind_Exception **)__cxa_get_globals_fast();
  if (!globals_fast || (v8 = *globals_fast) == 0) {
    abort_message("terminating", v1, v2, v3, v4, v5, v6, v7, v33);
  }
  if (__cxxabiv1::__isOurExceptionClass(v8 + 3))
  {
    if (__cxxabiv1::__getExceptionClass(v8 + 3) == 0x434C4E47432B2B01) {
      exception_cleanup = v8->exception_cleanup;
    }
    else {
      exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&v8[4];
    }
    v34 = exception_cleanup;
    private_1 = (const __cxxabiv1::__shim_type_info *)v8->private_1;
    __cxa_demangle((const char *)(*((void *)private_1 + 1) & 0x7FFFFFFFFFFFFFFFLL), 0, 0, 0);
    {
      char v25 = cause;
      (*(void (**)(void *))(*(void *)v34 + 16))(v34);
      abort_message("terminating due to %s exception of type %s: %s", v26, v27, v28, v29, v30, v31, v32, v25);
    }
    abort_message("terminating due to %s exception of type %s", v18, v19, v20, v21, v22, v23, v24, cause);
  }
  abort_message("terminating due to %s foreign exception", v9, v10, v11, v12, v13, v14, v15, cause);
}

void sub_20D718BB0(_Unwind_Exception *exception_object)
{
  if (v1) {
    v2(v1);
  }
  _Unwind_Resume(exception_object);
}

void demangling_unexpected_handler(void)
{
  cause = (uint64_t)"unexpected";
  std::terminate();
}

std::unexpected_handler std::set_unexpected(std::unexpected_handler a1)
{
  if (a1) {
    std::unexpected_handler v1 = a1;
  }
  else {
    std::unexpected_handler v1 = (std::unexpected_handler)demangling_unexpected_handler;
  }
  return (std::unexpected_handler)atomic_exchange((atomic_ullong *volatile)&__cxa_unexpected_handler, (unint64_t)v1);
}

void __clang_call_terminate(void *a1)
{
}

std::terminate_handler std::set_terminate(std::terminate_handler a1)
{
  if (a1) {
    std::unexpected_handler v1 = a1;
  }
  else {
    std::unexpected_handler v1 = demangling_terminate_handler;
  }
  return (std::terminate_handler)atomic_exchange((atomic_ullong *volatile)&__cxa_terminate_handler, (unint64_t)v1);
}

std::new_handler std::set_new_handler(std::new_handler a1)
{
  return (std::new_handler)atomic_exchange(&__cxa_new_handler, (unint64_t)a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  uint64_t v4 = (const char *)MEMORY[0x270FA5388](lpmangled, lpout, lpoutlen, lpstatus);
  v8 = v7;
  uint64_t v73 = *MEMORY[0x263EF8340];
  if (!v4 || (uint64_t v9 = v6, v10 = v5, v11 = (unsigned __int8 *)v4, v5) && !v6)
  {
    uint64_t v12 = 0;
    if (v7) {
      *uint64_t v7 = -3;
    }
    return v12;
  }
  size_t v13 = strlen(v4);
  v50 = v11;
  v51 = &v11[v13];
  v52 = v55;
  v53 = v55;
  v54 = v56;
  memset(v55, 0, sizeof(v55));
  v56[0] = v57;
  v56[1] = v57;
  memset(v57, 0, sizeof(v57));
  memset(v59, 0, sizeof(v59));
  v58[0] = v59;
  v58[1] = v59;
  v56[2] = v58;
  v58[2] = v60;
  v60[0] = v61;
  v60[1] = v61;
  v60[2] = &v62;
  memset(v61, 0, sizeof(v61));
  memset(v65, 0, sizeof(v65));
  v62 = v65;
  v63 = v65;
  v64 = &v66;
  __int16 v66 = 1;
  char v67 = 0;
  uint64_t v68 = -1;
  int v70 = 0;
  uint64_t v69 = 0;
  v71[0] = 0u;
  v72 = v71;
  if (v13 < 2)
  {
LABEL_20:
    if (v51 != v50) {
      goto LABEL_21;
    }
    goto LABEL_63;
  }
  if (*(_WORD *)v11 == 23135)
  {
    uint64_t v35 = 2;
  }
  else
  {
    if (v13 < 3) {
      goto LABEL_20;
    }
    if (*(_WORD *)v11 != 24415 || v11[2] != 90)
    {
      if (v13 < 4) {
        goto LABEL_20;
      }
      if (*(_DWORD *)v11 == 1516199775)
      {
        uint64_t v39 = 4;
      }
      else
      {
        if (v13 < 5) {
          goto LABEL_20;
        }
        if (*(_DWORD *)v11 != 1600085855 || v11[4] != 90) {
          goto LABEL_20;
        }
        uint64_t v39 = 5;
      }
      v50 = &v11[v39];
      if (!v45
        || (v40 = v50, (unint64_t)(v51 - v50) < 0xD)
        || (*(void *)v50 == 0x695F6B636F6C625FLL ? (BOOL v41 = *(void *)(v50 + 5) == 0x656B6F766E695F6BLL) : (BOOL v41 = 0),
            !v41))
      {
LABEL_53:
        v36 = 0;
        goto LABEL_64;
      }
      v50 += 13;
      if (v40 + 13 == v51 || v40[13] != 95)
      {
      }
      else
      {
        v50 = v40 + 14;
        if (!v24) {
          goto LABEL_53;
        }
      }
      if (v51 != v50)
      {
        if (*v50 != 46) {
          goto LABEL_53;
        }
        v50 = v51;
      }
LABEL_63:
      v36 = v23;
LABEL_64:
      if (v36)
      {
LABEL_65:
        if (v10) {
          uint64_t v42 = *v9;
        }
        else {
          uint64_t v42 = 0;
        }
        v45 = v10;
        uint64_t v46 = 0;
        uint64_t v47 = v42;
        uint64_t v48 = -1;
        int v49 = 1;
        if (v62 != v63) {
          abort_message("%s:%d: %s", v24, v25, v26, v27, v28, v29, v30, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/cxa_demangle.cpp");
        }
        uint64_t v43 = v46++;
        *((unsigned char *)v45 + v43) = 0;
        if (v9) {
          *uint64_t v9 = v46;
        }
        int v31 = 0;
        uint64_t v12 = (char *)v45;
        if (!v8) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    uint64_t v35 = 3;
  }
  v50 = &v11[v35];
  if (v36)
  {
    v37 = v50;
    if (v51 == v50) {
      goto LABEL_65;
    }
    uint64_t v44 = v51 - v50;
    if (*v50 == 46)
    {
      *((unsigned char *)v38 + 8) = 1;
      *(_WORD *)((char *)v38 + 9) = *(_WORD *)((unsigned char *)v38 + 9) & 0xF000 | 0x540;
      void *v38 = off_26C223420;
      v38[2] = v36;
      v38[3] = v37;
      v38[4] = v44;
      v50 = v51;
      v36 = v38;
      goto LABEL_65;
    }
  }
LABEL_21:
  uint64_t v12 = 0;
  int v31 = -2;
  if (v8) {
LABEL_22:
  }
    int *v8 = v31;
LABEL_23:
  uint64_t v32 = (void **)v72;
  if (v72)
  {
    do
    {
      while (1)
      {
        char v33 = (void **)*v32;
        v72 = *v32;
        if (v32 == (void **)v71) {
          break;
        }
        free(v32);
        uint64_t v32 = (void **)v72;
        if (!v72) {
          goto LABEL_28;
        }
      }
      uint64_t v32 = v33;
    }
    while (v33);
  }
LABEL_28:
  v71[0] = 0uLL;
  v72 = v71;
  if (v62 != v65) {
    free(v62);
  }
  if (v60[0] != v61) {
    free(v60[0]);
  }
  if (v58[0] != v59) {
    free(v58[0]);
  }
  if (v56[0] != v57) {
    free(v56[0]);
  }
  if (v52 != v55) {
    free(v52);
  }
  return v12;
}

void sub_20D7191A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::Node::print(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
  if ((*(_WORD *)(a1 + 9) & 0xC0) != 0x40)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 40);
    return v5(a1, a2);
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>::~ManglingParser(void *a1)
{
  uint64_t v2 = a1 + 101;
  uint64_t v3 = (void *)a1[613];
  if (v3)
  {
    do
    {
      while (1)
      {
        uint64_t v4 = (void *)*v3;
        a1[613] = *v3;
        if (v3 == v2) {
          break;
        }
        free(v3);
        uint64_t v3 = (void *)a1[613];
        if (!v3) {
          goto LABEL_6;
        }
      }
      uint64_t v3 = v4;
    }
    while (v4);
  }
LABEL_6:
  *uint64_t v2 = 0;
  v2[1] = 0;
  a1[613] = v2;
  uint64_t v5 = (void *)a1[90];
  if (v5 != a1 + 93) {
    free(v5);
  }
  uint64_t v6 = (void *)a1[83];
  if (v6 != a1 + 86) {
    free(v6);
  }
  uint64_t v7 = (void *)a1[72];
  if (v7 != a1 + 75) {
    free(v7);
  }
  v8 = (void *)a1[37];
  if (v8 != a1 + 40) {
    free(v8);
  }
  uint64_t v9 = (void *)a1[2];
  if (v9 != a1 + 5) {
    free(v9);
  }
  return a1;
}

void *anonymous namespace'::itanium_demangle::OutputBuffer::grow(void *this, uint64_t a2)
{
  unint64_t v2 = this[2];
  unint64_t v3 = this[1] + a2;
  if (v3 > v2)
  {
    uint64_t v4 = this;
    size_t v5 = v3 + 992;
    unint64_t v6 = 2 * v2;
    if (v6 <= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = v6;
    }
    this[2] = v7;
    this = malloc_type_realloc((void *)*this, v7, 0x4D9D93A4uLL);
    *uint64_t v4 = this;
    if (!this) {
      abort();
    }
  }
  return this;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::consumeIf(const void **a1, const void *a2, size_t a3)
{
  unint64_t v3 = (char *)*a1;
  if (a3 > (unsigned char *)a1[1] - (unsigned char *)*a1 || memcmp(*a1, a2, a3)) {
    return 0;
  }
  *a1 = &v3[a3];
  return 1;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseEncoding(unsigned __int8 **a1)
{
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  unint64_t v11 = v10 - *a1;
  if (v10 != *a1)
  {
    int v12 = *v9;
    if (v12 == 71)
    {
      if (v11 < 2) {
        goto LABEL_113;
      }
      int v31 = (char)v9[1];
      switch(v31)
      {
        case 'I':
          *a1 = v9 + 2;
          v82 = 0;
          uint64_t v32 = v82;
          if (v82) {
            char v50 = v49;
          }
          else {
            char v50 = 1;
          }
          if (v50) {
            goto LABEL_113;
          }
          *((unsigned char *)v21 + 8) = 21;
          *(_WORD *)((char *)v21 + 9) = *(_WORD *)((unsigned char *)v21 + 9) & 0xF000 | 0x540;
          *uint64_t v21 = off_26C221570;
          char v33 = "initializer for module ";
          uint64_t v34 = 23;
          break;
        case 'R':
          *a1 = v9 + 2;
          if (!v82) {
            goto LABEL_113;
          }
          uint64_t v48 = *a1;
          if (*a1 == a1[1] || *v48 != 95)
          {
            if (!v47) {
              goto LABEL_113;
            }
          }
          else
          {
            *a1 = v48 + 1;
          }
          goto LABEL_107;
        case 'V':
          *a1 = v9 + 2;
          if (!v32) {
            goto LABEL_113;
          }
          *((unsigned char *)v21 + 8) = 21;
          *(_WORD *)((char *)v21 + 9) = *(_WORD *)((unsigned char *)v21 + 9) & 0xF000 | 0x540;
          *uint64_t v21 = off_26C221570;
          char v33 = "guard variable for ";
          uint64_t v34 = 19;
          break;
        default:
          goto LABEL_113;
      }
      v21[2] = v33;
      v21[3] = v34;
      v21[4] = v32;
      goto LABEL_114;
    }
    if (v12 == 84)
    {
      if (v11 >= 2)
      {
        if (v11 <= 2)
        {
          switch(v9[1])
          {
            case 'A':
              *a1 = v9 + 2;
              v82 = v46;
              if (!v46) {
                goto LABEL_113;
              }
              break;
            case 'B':
            case 'D':
            case 'E':
            case 'F':
            case 'G':
              goto LABEL_81;
            case 'C':
              *a1 = v9 + 2;
              if (!v82) {
                goto LABEL_113;
              }
              if (!v63) {
                goto LABEL_113;
              }
              int v70 = *a1;
              if (*a1 == a1[1]) {
                goto LABEL_113;
              }
              if (*v70 != 95) {
                goto LABEL_113;
              }
              *a1 = v70 + 1;
              if (!v79.n128_u64[0]) {
                goto LABEL_113;
              }
              break;
            case 'H':
              *a1 = v9 + 2;
              if (!v82) {
                goto LABEL_113;
              }
              break;
            case 'I':
              *a1 = v9 + 2;
              if (!v82) {
                goto LABEL_113;
              }
              break;
            default:
              JUMPOUT(0);
          }
        }
        else
        {
          switch(v9[1])
          {
            case 'S':
              *a1 = v9 + 2;
              if (!v82) {
                goto LABEL_113;
              }
              goto LABEL_107;
            case 'T':
              *a1 = v9 + 2;
              if (!v82) {
                goto LABEL_113;
              }
              goto LABEL_107;
            case 'U':
              goto LABEL_81;
            case 'V':
              *a1 = v9 + 2;
              if (!v82) {
                goto LABEL_113;
              }
              goto LABEL_107;
            case 'W':
              *a1 = v9 + 2;
              if (!v82) {
                goto LABEL_113;
              }
              goto LABEL_107;
            default:
              if (v9[1] != 99) {
                goto LABEL_81;
              }
              *a1 = v9 + 2;
                goto LABEL_113;
                goto LABEL_113;
              if (!v82) {
                goto LABEL_113;
              }
              break;
          }
        }
        goto LABEL_107;
      }
LABEL_81:
      v61 = v9 + 1;
      *a1 = v61;
      BOOL v62 = v10 != v61 && *v61 == 118;
      {
        if (v82)
        {
          if (v62) {
          else
          }
          goto LABEL_107;
        }
      }
      goto LABEL_113;
    }
  }
  LOWORD(v82) = 0;
  HIDWORD(v82) = 0;
  v83[0] = 0;
  unint64_t v84 = (a1[91] - a1[90]) >> 3;
  char v85 = 0;
  v81 = v21;
  if (v21)
  {
    unint64_t v22 = v84;
    uint64_t v23 = a1[90];
    unint64_t v24 = (a1[91] - v23) >> 3;
    if (v84 < v24)
    {
      uint64_t v25 = a1[83];
      if (v25 == a1[84]) {
        goto LABEL_113;
      }
      if (!*(void *)v25) {
        goto LABEL_113;
      }
      uint64_t v26 = *(void *)&v23[8 * v84];
      unint64_t v27 = *(void *)(v26 + 16);
      uint64_t v28 = **(void **)v25;
      if (v27 >= (*(void *)(*(void *)v25 + 8) - v28) >> 3) {
        goto LABEL_113;
      }
      unint64_t v29 = v84 + 1;
      while (1)
      {
        *(void *)(v26 + 24) = *(void *)(v28 + 8 * v27);
        if (v24 == v29) {
          break;
        }
        unint64_t v30 = v29;
        if (*(void *)v25)
        {
          uint64_t v26 = *(void *)&v23[8 * v29];
          unint64_t v27 = *(void *)(v26 + 16);
          uint64_t v28 = **(void **)v25;
          ++v29;
          if (v27 < (*(void *)(*(void *)v25 + 8) - v28) >> 3) {
            continue;
          }
        }
        if (v30 >= v24) {
          goto LABEL_28;
        }
        goto LABEL_113;
      }
    }
    if (v24 < v22) {
      abort_message("%s:%d: %s", v14, v15, v16, v17, v18, v19, v20, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
    }
    a1[91] = &v23[8 * v22];
LABEL_28:
    v36 = *a1;
    uint64_t v35 = a1[1];
    unint64_t v37 = v35 - *a1;
    if (v35 != *a1)
    {
      unsigned int v38 = *v36 - 46;
      BOOL v39 = v38 > 0x31;
      uint64_t v40 = (1 << v38) & 0x2000000800001;
      if (v39 || v40 == 0)
      {
        uint64_t v80 = 0;
        if (v37 >= 0xD && *(void *)v36 == 0x6C62616E65396155 && *(void *)(v36 + 5) == 0x4966695F656C6261)
        {
          v71 = v36 + 13;
          *a1 = v71;
          unint64_t v72 = (a1[3] - a1[2]) >> 3;
          while (v71 == v35 || *v71 != 69)
          {
            v79.n128_u64[0] = v73;
            if (!v73) {
              goto LABEL_113;
            }
            v71 = *a1;
            uint64_t v35 = a1[1];
          }
          *a1 = v71 + 1;
          v79.n128_u64[1] = v75;
          uint64_t v80 = v76;
        }
        v78 = 0;
        if (!(_BYTE)v82)
        {
          if (BYTE1(v82))
          {
            if (!v78) {
              goto LABEL_113;
            }
          }
        }
        __n128 v79 = 0uLL;
        uint64_t v44 = *a1;
        uint64_t v43 = a1[1];
        if (*a1 == v43 || *v44 != 118)
        {
          unint64_t v51 = (a1[3] - a1[2]) >> 3;
          while (1)
          {
            v77 = v52;
            if (!v52) {
              goto LABEL_113;
            }
            if (v85) {
              BOOL v53 = v51 == (a1[3] - a1[2]) >> 3;
            }
            else {
              BOOL v53 = 0;
            }
            if (v53)
            {
              *((unsigned char *)v54 + 8) = 87;
              *(_WORD *)((char *)v54 + 9) = *(_WORD *)((unsigned char *)v54 + 9) & 0xF000 | 0x540;
              void *v54 = off_26C223340;
              v54[2] = v52;
              v77 = v54;
            }
            if (a1[1] != *a1)
            {
              unsigned int v55 = **a1 - 46;
              BOOL v39 = v55 > 0x31;
              uint64_t v56 = (1 << v55) & 0x2000800800001;
              if (v39 || v56 == 0) {
                continue;
              }
            }
            v79.n128_u64[1] = v58;
            v45 = *a1;
            uint64_t v43 = a1[1];
            goto LABEL_72;
          }
        }
        v45 = v44 + 1;
        *a1 = v45;
LABEL_72:
        v77 = 0;
        if (v45 != v43 && *v45 == 81)
        {
          *a1 = v45 + 1;
          char v59 = *((unsigned char *)a1 + 778);
          *((unsigned char *)a1 + 778) = 1;
          *((unsigned char *)a1 + 778) = v59;
          v77 = (void *)v60;
          if (!v60)
          {
LABEL_113:
            uint64_t v21 = 0;
            goto LABEL_114;
          }
        }
LABEL_107:
        uint64_t v21 = v13;
      }
    }
  }
LABEL_114:
  return v21;
}

void sub_20D719C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Unwind_Resume(a1);
}

char *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseNumber(char **a1, int a2)
{
  uint64_t result = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = result;
  if (a2)
  {
    if (result == v4) {
      return 0;
    }
    uint64_t v5 = result;
    if (*result == 110)
    {
      uint64_t v5 = result + 1;
      *a1 = result + 1;
    }
  }
  if (v4 == v5) {
    return 0;
  }
  if (*v5 < 0) {
    return 0;
  }
  uint64_t v6 = MEMORY[0x263EF8318];
  if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *v5 + 60) & 0x400) == 0) {
    return 0;
  }
  do
  {
    if (*v5 < 0) {
      break;
    }
    if ((*(_DWORD *)(v6 + 4 * *v5 + 60) & 0x400) == 0) {
      break;
    }
    *a1 = ++v5;
  }
  while (v5 != v4);
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[34],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, const char *a2, uint64_t *a3)
{
  size_t v6 = strlen(a2);
  uint64_t v7 = *a3;
  *((unsigned char *)v5 + 8) = 21;
  *(_WORD *)((char *)v5 + 9) = *(_WORD *)((unsigned char *)v5 + 9) & 0xF000 | 0x540;
  *uint64_t v5 = off_26C221570;
  v5[2] = a2;
  v5[3] = v6;
  v5[4] = v7;
  return v5;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v75 = 0;
  uint64_t v9 = *(unsigned __int8 **)a1;
  uint64_t v10 = *(unsigned __int8 **)(a1 + 8);
  unint64_t v11 = (unint64_t)&v10[-*(void *)a1];
  if (v10 == *(unsigned __int8 **)a1)
  {
LABEL_60:
LABEL_61:
    uint64_t v23 = v19;
    unint64_t v75 = v19;
    if (!v19) {
      return v23;
    }
    goto LABEL_62;
  }
  int v12 = *v9;
  switch(*v9)
  {
    case 'A':
      if (v12 != 65) {
        goto LABEL_146;
      }
      *(void *)a1 = v9 + 1;
      v77 = 0;
      if (v10 == v9 + 1)
      {
        if ((*(unsigned char *)(MEMORY[0x263EF8318] + 61) & 4) == 0) {
          goto LABEL_135;
        }
LABEL_139:
        v76.n128_u64[1] = v60;
        v77 = v61;
        BOOL v62 = *(unsigned __int8 **)a1;
        if (*(void *)a1 == *(void *)(a1 + 8) || *v62 != 95) {
          goto LABEL_146;
        }
        uint64_t v21 = v62 + 1;
        goto LABEL_142;
      }
      uint64_t v20 = (char)v9[1];
      if (v20 < 0) {
        goto LABEL_135;
      }
      if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v20 + 60) & 0x400) != 0) {
        goto LABEL_139;
      }
      if (v20 == 95)
      {
        uint64_t v21 = v9 + 2;
LABEL_142:
        *(void *)a1 = v21;
        goto LABEL_143;
      }
LABEL_135:
      if (!v58) {
        goto LABEL_146;
      }
      char v59 = *(unsigned __int8 **)a1;
      if (*(void *)a1 == *(void *)(a1 + 8) || *v59 != 95) {
        goto LABEL_146;
      }
      *(void *)a1 = v59 + 1;
      v77 = v58;
LABEL_143:
      if (!v76.n128_u64[0])
      {
LABEL_146:
        uint64_t v23 = 0;
        goto LABEL_147;
      }
LABEL_145:
      uint64_t v23 = v26;
LABEL_147:
      unint64_t v75 = v23;
      if (v23) {
LABEL_62:
      }
      return v23;
    case 'C':
      *(void *)a1 = v9 + 1;
      if (!v76.n128_u64[0]) {
        return 0;
      }
      goto LABEL_155;
    case 'D':
      if (v11 < 2) {
        return 0;
      }
      uint64_t v23 = 0;
      int v24 = v9[1];
      switch(v9[1])
      {
        case 'B':
        case 'U':
          LOBYTE(v77) = v24 == 66;
          unint64_t v25 = (unint64_t)(v9 + 2);
          *(void *)a1 = v25;
          if (v10 == (unsigned __int8 *)v25)
          {
            unint64_t v25 = 0;
          }
          else
          {
            LODWORD(v25) = *(char *)v25;
            if ((v25 & 0x80000000) != 0) {
              goto LABEL_182;
            }
            unint64_t v25 = v25;
          }
          if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v25 + 60) & 0x400) != 0)
          {
            v76.n128_u64[1] = v72;
            v76.n128_u64[0] = v73;
            goto LABEL_185;
          }
LABEL_182:
          v76.n128_u64[0] = v71;
          if (!v71) {
            return 0;
          }
LABEL_185:
          v74 = *(unsigned __int8 **)a1;
          if (*(void *)a1 == *(void *)(a1 + 8) || *v74 != 95) {
            return 0;
          }
          *(void *)a1 = v74 + 1;
LABEL_188:
          uint64_t v23 = v67;
          break;
        case 'F':
          *(void *)a1 = v9 + 2;
          v76.n128_u64[1] = v68;
          v76.n128_u64[0] = v69;
          int v70 = *(unsigned __int8 **)a1;
          if (*(void *)a1 == *(void *)(a1 + 8) || *v70 != 95) {
            return 0;
          }
          *(void *)a1 = v70 + 1;
          goto LABEL_188;
        case 'K':
        case 'k':
          BOOL v64 = v24 == 107;
          if (v24 == 107) {
            uint64_t v65 = " auto";
          }
          else {
            uint64_t v65 = " decltype(auto)";
          }
          unint64_t v66 = 15;
          if (v64) {
            unint64_t v66 = 5;
          }
          v76.n128_u64[0] = (unint64_t)v65;
          v76.n128_u64[1] = v66;
          *(void *)a1 = v9 + 2;
          if (!v77) {
            return 0;
          }
          goto LABEL_188;
        case 'O':
        case 'o':
        case 'w':
        case 'x':
          goto LABEL_133;
        case 'T':
        case 't':
          goto LABEL_61;
        case 'a':
          *(void *)a1 = v9 + 2;
          uint64_t v40 = "auto";
          goto LABEL_106;
        case 'c':
          *(void *)a1 = v9 + 2;
          char v49 = "decltype(auto)";
          goto LABEL_95;
        case 'd':
          *(void *)a1 = v9 + 2;
          v54 = "decimal64";
          goto LABEL_114;
        case 'e':
          *(void *)a1 = v9 + 2;
          v45 = "decimal128";
          goto LABEL_74;
        case 'f':
          *(void *)a1 = v9 + 2;
          v54 = "decimal32";
          goto LABEL_114;
        case 'h':
          *(void *)a1 = v9 + 2;
          uint64_t v40 = "half";
          goto LABEL_106;
        case 'i':
          *(void *)a1 = v9 + 2;
          uint64_t v48 = "char32_t";
          goto LABEL_86;
        case 'n':
          *(void *)a1 = v9 + 2;
          char v49 = "std::nullptr_t";
          goto LABEL_95;
        case 'p':
          *(void *)a1 = v9 + 2;
          if (!v76.n128_u64[0]) {
            return 0;
          }
          goto LABEL_155;
        case 's':
          *(void *)a1 = v9 + 2;
          uint64_t v48 = "char16_t";
          goto LABEL_86;
        case 'u':
          *(void *)a1 = v9 + 2;
          BOOL v53 = "char8_t";
          goto LABEL_110;
        case 'v':
          goto LABEL_61;
        default:
          return v23;
      }
      return v23;
    case 'F':
      goto LABEL_133;
    case 'G':
      *(void *)a1 = v9 + 1;
      if (!v76.n128_u64[0]) {
        return 0;
      }
      goto LABEL_155;
    case 'K':
    case 'V':
    case 'r':
      unint64_t v13 = v12 == 114;
      if (v11 > v13)
      {
        int v14 = v12 == 114 ? 2 : 1;
        if (v9[v13] == 86) {
          LODWORD(v13) = v14;
        }
      }
      unint64_t v15 = v13;
      if (v11 > v13)
      {
        if (v9[v13] == 75) {
          unint64_t v15 = (v13 + 1);
        }
        else {
          unint64_t v15 = v13;
        }
        LODWORD(v13) = v15;
      }
      if (v11 <= v15) {
        goto LABEL_20;
      }
      int v16 = v9[v15];
      if (v16 != 70)
      {
        unint64_t v17 = v13 + 1;
        BOOL v18 = v16 == 68 && v11 > v17;
        if (!v18) {
          goto LABEL_20;
        }
        unsigned int v55 = v9[v17] - 79;
        BOOL v18 = v55 > 0x29;
        uint64_t v56 = (1 << v55) & 0x30100000001;
        if (v18 || v56 == 0) {
          goto LABEL_20;
        }
      }
LABEL_133:
      goto LABEL_61;
    case 'M':
      if (v12 != 77) {
        goto LABEL_146;
      }
      *(void *)a1 = v9 + 1;
      if (!v76.n128_u64[0]) {
        goto LABEL_146;
      }
      if (!v77) {
        goto LABEL_146;
      }
      goto LABEL_145;
    case 'O':
      *(void *)a1 = v9 + 1;
      if (!v76.n128_u64[0]) {
        return 0;
      }
      LODWORD(v77) = 1;
      goto LABEL_46;
    case 'P':
      *(void *)a1 = v9 + 1;
      if (!v76.n128_u64[0]) {
        return 0;
      }
      goto LABEL_155;
    case 'R':
      *(void *)a1 = v9 + 1;
      if (!v76.n128_u64[0]) {
        return 0;
      }
      LODWORD(v77) = 0;
LABEL_46:
      goto LABEL_155;
    case 'S':
      if (v11 >= 2 && v9[1] == 116) {
        goto LABEL_60;
      }
      LOBYTE(v77) = 0;
      unint64_t v75 = v27;
      if (!v27) {
        return 0;
      }
      uint64_t v23 = v27;
      if (*(void *)(a1 + 8) == *(void *)a1)
      {
        int v34 = v77;
      }
      else
      {
        int v34 = v77;
        if (**(unsigned char **)a1 == 73)
        {
          if ((_BYTE)v77)
          {
            if (!*(unsigned char *)(a1 + 776)) {
              return v23;
            }
          }
          else
          {
          }
LABEL_153:
          v76.n128_u64[0] = v63;
          if (v63)
          {
            goto LABEL_155;
          }
          return 0;
        }
      }
      if (v34) {
        return v23;
      }
      goto LABEL_62;
    case 'T':
      if (v11 >= 2)
      {
        unsigned int v35 = v9[1] - 101;
        BOOL v18 = v35 > 0x10;
        int v36 = (1 << v35) & 0x14001;
        if (!v18 && v36 != 0) {
          goto LABEL_60;
        }
      }
      unint64_t v75 = v23;
      if (!v23) {
        return v23;
      }
      if (*(unsigned char *)(a1 + 776) && *(void *)(a1 + 8) != *(void *)a1 && **(unsigned char **)a1 == 73) {
        goto LABEL_153;
      }
      goto LABEL_62;
    case 'U':
LABEL_20:
      goto LABEL_61;
    case 'a':
      *(void *)a1 = v9 + 1;
      BOOL v39 = "signed char";
      goto LABEL_69;
    case 'b':
      *(void *)a1 = v9 + 1;
      uint64_t v40 = "BOOL";
      goto LABEL_106;
    case 'c':
      *(void *)a1 = v9 + 1;
      uint64_t v40 = "char";
      goto LABEL_106;
    case 'd':
      *(void *)a1 = v9 + 1;
      uint64_t v23 = v41;
      *((unsigned char *)v41 + 8) = 8;
      *(_WORD *)((char *)v41 + 9) = *(_WORD *)((unsigned char *)v41 + 9) & 0xF000 | 0x540;
      *BOOL v41 = off_26C221660;
      uint64_t v42 = "double";
      uint64_t v43 = 6;
      goto LABEL_118;
    case 'e':
      *(void *)a1 = v9 + 1;
      BOOL v39 = "long double";
LABEL_69:
    case 'f':
      *(void *)a1 = v9 + 1;
      uint64_t v44 = "float";
      goto LABEL_91;
    case 'g':
      *(void *)a1 = v9 + 1;
      v45 = "__float128";
LABEL_74:
    case 'h':
      *(void *)a1 = v9 + 1;
      uint64_t v46 = "unsigned char";
      goto LABEL_82;
    case 'i':
      *(void *)a1 = v9 + 1;
      int v47 = "int";
      goto LABEL_120;
    case 'j':
      *(void *)a1 = v9 + 1;
      uint64_t v23 = v41;
      *((unsigned char *)v41 + 8) = 8;
      *(_WORD *)((char *)v41 + 9) = *(_WORD *)((unsigned char *)v41 + 9) & 0xF000 | 0x540;
      *BOOL v41 = off_26C221660;
      uint64_t v42 = "unsigned int";
      uint64_t v43 = 12;
      goto LABEL_118;
    case 'l':
      *(void *)a1 = v9 + 1;
      uint64_t v40 = "long";
      goto LABEL_106;
    case 'm':
      *(void *)a1 = v9 + 1;
      uint64_t v46 = "unsigned long";
LABEL_82:
    case 'n':
      *(void *)a1 = v9 + 1;
      uint64_t v48 = "__int128";
LABEL_86:
    case 'o':
      *(void *)a1 = v9 + 1;
      uint64_t v23 = v41;
      *((unsigned char *)v41 + 8) = 8;
      *(_WORD *)((char *)v41 + 9) = *(_WORD *)((unsigned char *)v41 + 9) & 0xF000 | 0x540;
      *BOOL v41 = off_26C221660;
      uint64_t v42 = "unsigned __int128";
      uint64_t v43 = 17;
      goto LABEL_118;
    case 's':
      *(void *)a1 = v9 + 1;
      uint64_t v44 = "short";
LABEL_91:
    case 't':
      *(void *)a1 = v9 + 1;
      char v49 = "unsigned short";
LABEL_95:
    case 'u':
      *(void *)a1 = v9 + 1;
      v76.n128_u64[1] = v50;
      if (!v50) {
        return 0;
      }
      unint64_t v51 = *(unsigned __int8 **)a1;
      if (*(void *)a1 == *(void *)(a1 + 8) || *v51 != 73)
      {
      }
      else
      {
        *(void *)a1 = v51 + 1;
        if (!v77) {
          return 0;
        }
        v52 = *(unsigned __int8 **)a1;
        if (*(void *)a1 == *(void *)(a1 + 8) || *v52 != 69) {
          return 0;
        }
        *(void *)a1 = v52 + 1;
      }
LABEL_155:
      uint64_t v23 = v22;
      unint64_t v75 = v22;
      goto LABEL_62;
    case 'v':
      *(void *)a1 = v9 + 1;
      uint64_t v40 = "void";
LABEL_106:
    case 'w':
      *(void *)a1 = v9 + 1;
      BOOL v53 = "wchar_t";
LABEL_110:
    case 'x':
      *(void *)a1 = v9 + 1;
      v54 = "long long";
LABEL_114:
    case 'y':
      *(void *)a1 = v9 + 1;
      uint64_t v23 = v41;
      *((unsigned char *)v41 + 8) = 8;
      *(_WORD *)((char *)v41 + 9) = *(_WORD *)((unsigned char *)v41 + 9) & 0xF000 | 0x540;
      *BOOL v41 = off_26C221660;
      uint64_t v42 = "unsigned long long";
      uint64_t v43 = 18;
LABEL_118:
      v41[2] = v42;
      v41[3] = v43;
      return v23;
    case 'z':
      *(void *)a1 = v9 + 1;
      int v47 = "...";
LABEL_120:
    default:
      goto LABEL_60;
  }
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::SaveTemplateParams::SaveTemplateParams(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = a2;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 8) = a1 + 32;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 64) = a1 + 88;
  *(void *)(a1 + 16) = a1 + 32;
  *(void *)(a1 + 24) = a1 + 64;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 72) = a1 + 88;
  *(void *)(a1 + 80) = a1 + 152;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  uint64_t v3 = *(void **)a1;
  v3[84] = *(void *)(*(void *)a1 + 664);
  v3[73] = v3[72];
  return a1;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(const char **)a1;
  unint64_t v11 = *(const char **)(a1 + 8);
  if (v11 == *(const char **)a1) {
    goto LABEL_8;
  }
  int v12 = *(unsigned __int8 *)v10;
  if (v12 == 90)
  {
    *(void *)a1 = v10 + 1;
    if (!v46[0]) {
      return 0;
    }
    uint64_t v26 = *(const char **)a1;
    unint64_t v25 = *(const char **)(a1 + 8);
    if (*(const char **)a1 == v25 || *v26 != 69) {
      return 0;
    }
    *(void *)a1 = v26 + 1;
    if (v26 + 1 != v25 && v26[1] == 115)
    {
      *(void *)a1 = v26 + 2;
    }
    uint64_t v40 = *(const char **)a1;
    if (*(void *)a1 == *(void *)(a1 + 8) || *v40 != 100)
    {
      if (v44)
      {
        goto LABEL_87;
      }
    }
    else
    {
      *(void *)a1 = v40 + 1;
      BOOL v41 = *(const char **)a1;
      if (*(void *)a1 != *(void *)(a1 + 8) && *v41 == 95)
      {
        *(void *)a1 = v41 + 1;
        if (v44)
        {
LABEL_87:
          uint64_t v20 = v42;
LABEL_89:
          return v20;
        }
      }
    }
    uint64_t v20 = 0;
    goto LABEL_89;
  }
  if (v12 != 78)
  {
LABEL_8:
    LOBYTE(v46[0]) = 0;
    v45[0] = (uint64_t)v20;
    if (!v20) {
      return v20;
    }
    if (*(void *)(a1 + 8) == *(void *)a1 || **(unsigned char **)a1 != 73)
    {
      if (!LOBYTE(v46[0])) {
        return v20;
      }
      return 0;
    }
    if (!LOBYTE(v46[0])) {
    if (!v21)
    }
      return 0;
    uint64_t v22 = v21;
    if (a2) {
      *(unsigned char *)(a2 + 1) = 1;
    }
    *((unsigned char *)v23 + 8) = 45;
    *(_WORD *)((char *)v23 + 9) = *(_WORD *)((unsigned char *)v23 + 9) & 0xF000 | 0x540;
    *uint64_t v23 = off_26C223180;
    v23[2] = v20;
    v23[3] = v22;
    return v23;
  }
  *(void *)a1 = v10 + 1;
  if (v10 + 1 != v11 && v10[1] == 72)
  {
    unint64_t v13 = v10 + 2;
    *(void *)a1 = v13;
    if (a2) {
      *(unsigned char *)(a2 + 24) = 1;
    }
    goto LABEL_38;
  }
  if (a2) {
    *(_DWORD *)(a2 + 4) = v27;
  }
  unint64_t v13 = *(const char **)a1;
  unint64_t v11 = *(const char **)(a1 + 8);
  if (*(const char **)a1 == v11) {
    goto LABEL_33;
  }
  int v28 = *(unsigned __int8 *)v13;
  if (v28 != 82)
  {
    if (v28 == 79)
    {
      *(void *)a1 = ++v13;
      if (a2)
      {
        char v29 = 2;
LABEL_37:
        *(unsigned char *)(a2 + 8) = v29;
        goto LABEL_38;
      }
      goto LABEL_38;
    }
LABEL_33:
    if (a2) {
      *(unsigned char *)(a2 + 8) = 0;
    }
    goto LABEL_38;
  }
  *(void *)a1 = ++v13;
  if (a2)
  {
    char v29 = 1;
    goto LABEL_37;
  }
LABEL_38:
  uint64_t v20 = 0;
  v45[0] = 0;
  while (v13 == v11 || *v13 != 69)
  {
    if (a2) {
      *(unsigned char *)(a2 + 1) = 0;
    }
    unint64_t v30 = v11 - v13;
    if (!v30) {
      goto LABEL_61;
    }
    uint64_t v31 = 0;
    unsigned int v32 = *(unsigned __int8 *)v13;
    if (v32 > 0x52)
    {
      if (v32 != 83)
      {
        if (v32 == 84)
        {
          if (v20) {
            return 0;
          }
          goto LABEL_63;
        }
LABEL_62:
        goto LABEL_63;
      }
      if (v30 >= 2 && v13[1] == 116)
      {
        *(void *)a1 = v13 + 2;
      }
      else
      {
        if (!v31) {
          return 0;
        }
      }
      if (*((unsigned char *)v31 + 8) == 27) {
        goto LABEL_62;
      }
      if (v20) {
        return 0;
      }
      v45[0] = (uint64_t)v31;
      uint64_t v20 = v31;
      unint64_t v13 = *(const char **)a1;
      unint64_t v11 = *(const char **)(a1 + 8);
    }
    else
    {
      if (v32 == 68)
      {
        if (v30 >= 2 && (*((unsigned __int8 *)v13 + 1) | 0x20) == 0x74)
        {
          if (v20) {
            return 0;
          }
LABEL_63:
          uint64_t v20 = v36;
          v45[0] = (uint64_t)v36;
          if (!v36) {
            return v20;
          }
          goto LABEL_64;
        }
LABEL_61:
        uint64_t v31 = 0;
        goto LABEL_62;
      }
      if (v32 != 73) {
        goto LABEL_62;
      }
      if (!v20) {
        return v20;
      }
      if (!v33 || *((unsigned char *)v20 + 8) == 45) {
        return 0;
      }
      uint64_t v34 = v33;
      if (a2) {
        *(unsigned char *)(a2 + 1) = 1;
      }
      *((unsigned char *)v35 + 8) = 45;
      *(_WORD *)((char *)v35 + 9) = *(_WORD *)((unsigned char *)v35 + 9) & 0xF000 | 0x540;
      *unsigned int v35 = off_26C223180;
      v35[2] = v20;
      v35[3] = v34;
      v45[0] = (uint64_t)v35;
      uint64_t v20 = v35;
LABEL_64:
      unint64_t v13 = *(const char **)a1;
      unint64_t v37 = *(const char **)(a1 + 8);
      unint64_t v11 = *(const char **)a1;
      if (*(const char **)a1 != v37)
      {
        unint64_t v11 = *(const char **)(a1 + 8);
        if (*v13 == 77)
        {
          *(void *)a1 = ++v13;
          unint64_t v11 = v37;
        }
      }
    }
  }
  *(void *)a1 = v13 + 1;
  if (v20)
  {
    uint64_t v38 = *(void *)(a1 + 304);
    if (*(void *)(a1 + 296) != v38)
    {
      *(void *)(a1 + 304) = v38 - 8;
      return v20;
    }
    return 0;
  }
  return v20;
}

void sub_20D71B114(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Unwind_Resume(a1);
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseTemplateArg(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(char **)a1;
  uint64_t v9 = *(char **)(a1 + 8);
  if (v9 == *(char **)a1) {
    int v11 = 0;
  }
  else {
    int v11 = *v10;
  }
  HIDWORD(v12) = v11;
  LODWORD(v12) = v11 - 74;
  switch((v12 >> 1))
  {
    case 0u:
      unint64_t v13 = v10 + 1;
      *(void *)a1 = v13;
      unint64_t v14 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
      while (1)
      {
        if (v13 != v9 && *v13 == 69)
        {
          *(void *)a1 = v13 + 1;
          uint64_t v18 = v22;
          *((unsigned char *)v19 + 8) = 41;
          *(_WORD *)((char *)v19 + 9) = *(_WORD *)((unsigned char *)v19 + 9) & 0xF000 | 0x540;
          uint64_t v20 = off_26C2231F0;
          goto LABEL_30;
        }
        if (!v23) {
          break;
        }
        unint64_t v13 = *(char **)a1;
        uint64_t v9 = *(char **)(a1 + 8);
      }
      break;
    case 1u:
      if ((unint64_t)&v9[-*(void *)a1] >= 2 && v10[1] == 90)
      {
        *(void *)a1 = v10 + 2;
          goto LABEL_22;
      }
      else
      {
      }
      break;
    case 5u:
        goto LABEL_18;
      if (v15)
      {
        uint64_t v16 = v15;
        if (v17)
        {
          uint64_t v18 = v17;
          *((unsigned char *)v19 + 8) = 34;
          *(_WORD *)((char *)v19 + 9) = *(_WORD *)((unsigned char *)v19 + 9) & 0xF000 | 0x540;
          uint64_t v20 = off_26C223260;
LABEL_30:
          *uint64_t v19 = v20;
          v19[2] = v16;
          v19[3] = v18;
        }
      }
      break;
    case 7u:
      *(void *)a1 = v10 + 1;
      {
LABEL_22:
        uint64_t v21 = *(char **)a1;
        if (*(void *)a1 != *(void *)(a1 + 8) && *v21 == 69) {
          *(void *)a1 = v21 + 1;
        }
      }
      break;
    default:
LABEL_18:
      break;
  }
}

const void **anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,32ul>::push_back(const void **result, uint64_t *size)
{
  uint64_t v3 = result;
  uint64_t v4 = (char *)result[1];
  if (v4 == result[2])
  {
    uint64_t v5 = (void *)*result;
    uint64_t v6 = v4 - (unsigned char *)*v3;
    if (*v3 == v3 + 3)
    {
      uint64_t result = (const void **)malloc_type_malloc(2 * v6, 0x2004093837F09uLL);
      if (!result) {
        goto LABEL_11;
      }
      uint64_t v7 = result;
      uint64_t v8 = v3[1];
      if (v8 != *v3) {
        uint64_t result = (const void **)memmove(result, *v3, v8 - (unsigned char *)*v3);
      }
      *uint64_t v3 = v7;
    }
    else
    {
      uint64_t result = (const void **)malloc_type_realloc(v5, 2 * v6, 0x2004093837F09uLL);
      uint64_t v7 = result;
      *uint64_t v3 = result;
      if (!result) {
LABEL_11:
      }
        abort();
    }
    uint64_t v4 = (char *)&v7[v6 >> 3];
    v3[1] = v4;
    v3[2] = &v7[v6 >> 2];
  }
  uint64_t v9 = *size;
  v3[1] = v4 + 8;
  *(void *)uint64_t v4 = v9;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::EnableIfAttr,anonymous namespace'::itanium_demangle::NodeArray>(uint64_t a1, __n128 *a2)
{
  *((unsigned char *)v3 + 8) = 10;
  __int16 v4 = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C2232D0;
  __n128 result = *a2;
  *(_WORD *)((char *)v3 + 9) = v4;
  *((__n128 *)v3 + 1) = result;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::popTrailingNodeArray(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1[2];
  uint64_t v9 = a1[3];
  if (a2 > (v9 - v8) >> 3) {
    goto LABEL_6;
  }
  unint64_t v12 = (const void *)(v8 + 8 * a2);
  unint64_t v14 = v13;
  size_t v15 = v9 - (void)v12;
  if (v15) {
    memmove(v13, v12, v15);
  }
  uint64_t v16 = a1[2];
  if (a2 > (a1[3] - v16) >> 3) {
LABEL_6:
  }
    abort_message("%s:%d: %s", a2, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
  a1[3] = v16 + 8 * a2;
  return v14;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::FunctionEncoding,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Qualifiers &,anonymous namespace'::itanium_demangle::FunctionRefQual &>(uint64_t a1, uint64_t *a2, uint64_t *a3, __n128 *a4, uint64_t *a5, uint64_t *a6, int *a7, char *a8)
{
  uint64_t v16 = *a2;
  uint64_t v17 = *a3;
  uint64_t v18 = *a5;
  uint64_t v19 = *a6;
  int v20 = *a7;
  char v21 = *a8;
  *((unsigned char *)v15 + 8) = 19;
  __int16 v22 = *(_WORD *)((unsigned char *)v15 + 9) & 0xF000 | 0x100;
  *size_t v15 = off_26C2233B0;
  __n128 result = *a4;
  *(_WORD *)((char *)v15 + 9) = v22;
  v15[2] = v16;
  v15[3] = v17;
  *((__n128 *)v15 + 2) = result;
  v15[6] = v18;
  v15[7] = v19;
  *((_DWORD *)v15 + 16) = v20;
  *((unsigned char *)v15 + 68) = v21;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::SaveTemplateParams::~SaveTemplateParams(void *a1)
{
  uint64_t v2 = (void *)a1[8];
  if (v2 != a1 + 11) {
    free(v2);
  }
  uint64_t v3 = (void *)a1[1];
  if (v3 != a1 + 4) {
    free(v3);
  }
  return a1;
}

char *anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,8ul> *,4ul>::operator=(char *__dst, uint64_t a2)
{
  uint64_t v5 = (unsigned char *)(a2 + 24);
  __int16 v4 = *(unsigned char **)a2;
  uint64_t v7 = __dst + 24;
  uint64_t v6 = *(char **)__dst;
  if (v4 == v5)
  {
    if (v6 != v7)
    {
      free(v6);
      *(void *)__dst = v7;
      *((void *)__dst + 1) = v7;
      *((void *)__dst + 2) = __dst + 56;
      __int16 v4 = *(unsigned char **)a2;
    }
    uint64_t v10 = *(unsigned char **)(a2 + 8);
    if (v10 == v4)
    {
      int v11 = v4;
    }
    else
    {
      memmove(v7, v4, v10 - v4);
      __int16 v4 = *(unsigned char **)a2;
      int v11 = *(unsigned char **)(a2 + 8);
    }
    *((void *)__dst + 1) = &v7[v11 - v4];
    *(void *)(a2 + 8) = v4;
  }
  else
  {
    *(void *)__dst = v4;
    if (v6 == v7)
    {
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(a2 + 8);
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = v5;
      *(void *)(a2 + 16) = a2 + 56;
    }
    else
    {
      *(void *)a2 = v6;
      uint64_t v8 = *((void *)__dst + 1);
      *((void *)__dst + 1) = *(void *)(a2 + 8);
      *(void *)(a2 + 8) = v8;
      uint64_t v9 = *((void *)__dst + 2);
      *((void *)__dst + 2) = *(void *)(a2 + 16);
      *(void *)(a2 + 8) = *(void *)a2;
      *(void *)(a2 + 16) = v9;
    }
  }
  return __dst;
}

char *anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,8ul>::operator=(char *__dst, uint64_t a2)
{
  uint64_t v5 = (unsigned char *)(a2 + 24);
  __int16 v4 = *(unsigned char **)a2;
  uint64_t v7 = __dst + 24;
  uint64_t v6 = *(char **)__dst;
  if (v4 == v5)
  {
    if (v6 != v7)
    {
      free(v6);
      *(void *)__dst = v7;
      *((void *)__dst + 1) = v7;
      *((void *)__dst + 2) = __dst + 88;
      __int16 v4 = *(unsigned char **)a2;
    }
    uint64_t v10 = *(unsigned char **)(a2 + 8);
    if (v10 == v4)
    {
      int v11 = v4;
    }
    else
    {
      memmove(v7, v4, v10 - v4);
      __int16 v4 = *(unsigned char **)a2;
      int v11 = *(unsigned char **)(a2 + 8);
    }
    *((void *)__dst + 1) = &v7[v11 - v4];
    *(void *)(a2 + 8) = v4;
  }
  else
  {
    *(void *)__dst = v4;
    if (v6 == v7)
    {
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(a2 + 8);
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = v5;
      *(void *)(a2 + 16) = a2 + 88;
    }
    else
    {
      *(void *)a2 = v6;
      uint64_t v8 = *((void *)__dst + 1);
      *((void *)__dst + 1) = *(void *)(a2 + 8);
      *(void *)(a2 + 8) = v8;
      uint64_t v9 = *((void *)__dst + 2);
      *((void *)__dst + 2) = *(void *)(a2 + 16);
      *(void *)(a2 + 8) = *(void *)a2;
      *(void *)(a2 + 16) = v9;
    }
  }
  return __dst;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[31],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221570;
  result[2] = "template parameter object for ";
  result[3] = 30;
  result[4] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[12],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221570;
  result[2] = "vtable for ";
  result[3] = 11;
  result[4] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[9],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221570;
  result[2] = "VTT for ";
  result[3] = 8;
  result[4] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[14],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221570;
  result[2] = "typeinfo for ";
  result[3] = 13;
  result[4] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[19],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221570;
  result[2] = "typeinfo name for ";
  result[3] = 18;
  result[4] = v4;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseCallOffset(uint64_t a1)
{
  std::unexpected_handler v1 = *(char **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8)) {
    return 1;
  }
  int v3 = *v1;
  if (v3 != 118)
  {
    if (v3 == 104)
    {
      *(void *)a1 = v1 + 1;
      uint64_t v4 = 1;
      goto LABEL_5;
    }
    return 1;
  }
  *(void *)a1 = v1 + 1;
  uint64_t v4 = 1;
  if (!v8) {
    return v4;
  }
  uint64_t v9 = *(char **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8) || *v9 != 95) {
    return v4;
  }
  *(void *)a1 = v9 + 1;
LABEL_5:
  if (v5)
  {
    uint64_t v6 = *(char **)a1;
    if (*(void *)a1 != *(void *)(a1 + 8) && *v6 == 95)
    {
      uint64_t v4 = 0;
      *(void *)a1 = v6 + 1;
    }
  }
  return v4;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[27],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221570;
  result[2] = "covariant return thunk to ";
  result[3] = 26;
  result[4] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::CtorVtableSpecialName,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  *((unsigned char *)result + 8) = 22;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C2215F0;
  result[2] = v6;
  result[3] = v7;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[41],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221570;
  result[2] = "thread-local initialization routine for ";
  result[3] = 40;
  result[4] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[18],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221570;
  result[2] = "virtual thunk to ";
  result[3] = 17;
  result[4] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[22],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221570;
  result[2] = "non-virtual thunk to ";
  result[3] = 21;
  result[4] = v4;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSeqId(unsigned __int8 **a1, uint64_t *a2)
{
  int v3 = *a1;
  uint64_t v2 = (char *)a1[1];
  if (v2 == (char *)*a1 || (char)*v3 < 48) {
    return 1;
  }
  unsigned int v4 = *v3;
  if (v4 >= 0x3A && v4 - 65 > 0x19) {
    return 1;
  }
  uint64_t v6 = 0;
  do
  {
    if ((char)*v3 < 48) {
      break;
    }
    if (*v3 >= 0x3Au)
    {
      if (*v3 - 65 >= 0x1A) {
        break;
      }
      uint64_t v7 = -55;
    }
    else
    {
      uint64_t v7 = -48;
    }
    uint64_t v6 = v7 + 36 * v6 + *v3++;
    *a1 = v3;
  }
  while (v3 != (unsigned __int8 *)v2);
  uint64_t result = 0;
  *a2 = v6;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[25],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 21;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C221570;
  result[2] = "reference temporary for ";
  result[3] = 24;
  result[4] = v4;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseModuleNameOpt(void *a1, uint64_t *a2)
{
  uint64_t v2 = (unsigned char *)*a1;
  int v3 = (unsigned char *)a1[1];
  if ((unsigned char *)*a1 != v3)
  {
    uint64_t v6 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 101);
    uint64_t v7 = (const void **)(a1 + 37);
    while (*v2 == 87)
    {
      *a1 = v2 + 1;
      if (v2 + 1 == v3 || v2[1] != 80)
      {
        char v8 = 0;
      }
      else
      {
        *a1 = v2 + 2;
        char v8 = 1;
      }
      if (!v9) {
        return 1;
      }
      uint64_t v10 = v9;
      uint64_t v12 = *a2;
      *((unsigned char *)v11 + 8) = 27;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((unsigned char *)v11 + 9) & 0xF000 | 0x540;
      *int v11 = off_26C2216D0;
      v11[2] = v12;
      v11[3] = v10;
      *((unsigned char *)v11 + 32) = v8;
      *a2 = (uint64_t)v11;
      unint64_t v14 = v11;
      uint64_t v2 = (unsigned char *)*a1;
      int v3 = (unsigned char *)a1[1];
      if ((unsigned char *)*a1 == v3) {
        return 0;
      }
    }
  }
  return 0;
}

void *anonymous namespace'::BumpPointerAllocator::allocate(_anonymous_namespace_::BumpPointerAllocator *this, int a2)
{
  unint64_t v3 = (a2 + 15) & 0xFFFFFFF0;
  uint64_t v4 = (void *)*((void *)this + 512);
  uint64_t v5 = v4[1];
  if (v5 + v3 >= 0xFF0)
  {
    if (v3 >= 0xFF1)
    {
      uint64_t v6 = malloc_type_malloc(v3 + 16, 0x4F7E35AFuLL);
      if (v6)
      {
        uint64_t v7 = (void *)*((void *)this + 512);
        *uint64_t v6 = *v7;
        v6[1] = 0;
        *uint64_t v7 = v6;
        return v6 + 2;
      }
LABEL_8:
      std::terminate();
    }
    uint64_t v4 = malloc_type_malloc(0x1000uLL, 0x6ADE0C5BuLL);
    if (!v4) {
      goto LABEL_8;
    }
    uint64_t v5 = 0;
    *uint64_t v4 = *((void *)this + 512);
    v4[1] = 0;
    *((void *)this + 512) = v4;
  }
  v4[1] = v5 + v3;
  return (void *)((char *)v4 + v5 + 16);
}

uint64_t anonymous namespace'::itanium_demangle::Node::hasRHSComponentSlow()
{
  return 0;
}

uint64_t anonymous namespace'::itanium_demangle::Node::hasArraySlow()
{
  return 0;
}

uint64_t anonymous namespace'::itanium_demangle::Node::hasFunctionSlow()
{
  return 0;
}

uint64_t anonymous namespace'::itanium_demangle::SpecialName::printLeft(void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = a1[3];
  if (v4)
  {
    uint64_t v5 = (const void *)a1[2];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }
  uint64_t v6 = a1[4];
}

uint64_t anonymous namespace'::itanium_demangle::Node::getBaseName(_anonymous_namespace_::itanium_demangle::Node *this)
{
  return 0;
}

void anonymous namespace'::itanium_demangle::SpecialName::~SpecialName(_anonymous_namespace_::itanium_demangle::SpecialName *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::CtorVtableSpecialName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24);
  *((void *)this + 1) += 24;
  *(_DWORD *)(*(void *)this + *((void *)this + 1)) = 762210605;
  *((void *)this + 1) += 4;
  uint64_t v4 = *(void *)(a1 + 24);
}

void anonymous namespace'::itanium_demangle::CtorVtableSpecialName::~CtorVtableSpecialName(_anonymous_namespace_::itanium_demangle::CtorVtableSpecialName *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSourceName(uint64_t a1)
{
  unint64_t v7 = 0;
  uint64_t result = 0;
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = *(unsigned __int8 **)a1;
    unint64_t v5 = v7;
    if (v7 - 1 >= *(void *)(a1 + 8) - *(void *)a1)
    {
      return 0;
    }
    else
    {
      *(void *)a1 = &v4[v7];
      if (v5 >= 0xA && *(void *)v4 == 0x5F4C41424F4C475FLL && *((_WORD *)v4 + 4) == 20063)
      {
        uint64_t v4 = "(anonymous namespace)";
        unint64_t v5 = 21;
      }
      *((unsigned char *)result + 8) = 8;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
      *uint64_t result = off_26C221660;
      result[2] = v4;
      result[3] = v5;
    }
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parsePositiveInteger(unsigned __int8 **a1, uint64_t *a2)
{
  *a2 = 0;
  unint64_t v3 = *a1;
  char v2 = a1[1];
  if (v2 == *a1) {
    return 1;
  }
  int v4 = *v3;
  if ((v4 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  if ((v4 - 48) <= 9)
  {
    uint64_t v6 = 0;
    unint64_t v7 = v3 + 1;
    do
    {
      uint64_t v8 = 5 * v6;
      *a2 = 2 * v8;
      *a1 = v7;
      uint64_t v6 = (char)*(v7 - 1) + 2 * v8 - 48;
      *a2 = v6;
      if (v7 == v2) {
        break;
      }
      int v9 = *v7++;
    }
    while ((v9 - 48) <= 9);
  }
  return 0;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,std::string_view &>(uint64_t a1, __n128 *a2)
{
  *((unsigned char *)v3 + 8) = 8;
  __int16 v4 = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *unint64_t v3 = off_26C221660;
  __n128 result = *a2;
  *(_WORD *)((char *)v3 + 9) = v4;
  *((__n128 *)v3 + 1) = result;
  return result;
}

void *anonymous namespace'::itanium_demangle::NameType::printLeft(void *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v2 = result[3];
  if (v2)
  {
    __int16 v4 = (const void *)result[2];
    __n128 result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v4, v2);
    *((void *)this + 1) += v2;
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::NameType::getBaseName(_anonymous_namespace_::itanium_demangle::NameType *this)
{
  return *((void *)this + 2);
}

void anonymous namespace'::itanium_demangle::NameType::~NameType(_anonymous_namespace_::itanium_demangle::NameType *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::ModuleName::printLeft(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  {
    if (*(unsigned char *)(a1 + 32)) {
      char v5 = 58;
    }
    else {
      char v5 = 46;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 32)) {
      goto LABEL_9;
    }
    char v5 = 58;
  }
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  a2[1] = v7 + 1;
  *(unsigned char *)(v6 + v7) = v5;
LABEL_9:
  uint64_t v8 = *(void *)(a1 + 24);
}

void anonymous namespace'::itanium_demangle::ModuleName::~ModuleName(_anonymous_namespace_::itanium_demangle::ModuleName *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnscopedName(void *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v6 = (_WORD *)*a1;
  uint64_t v7 = (_WORD *)a1[1];
  if ((unint64_t)v7 - *a1 >= 2 && *v6 == 29779)
  {
    *a1 = v6 + 1;
    uint64_t v6 = (_WORD *)*a1;
    uint64_t v7 = (_WORD *)a1[1];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v7 == v6 || *(unsigned char *)v6 != 83)
  {
    uint64_t v10 = 0;
  }
  else
  {
    if (!result) {
      return result;
    }
    uint64_t v10 = (uint64_t)result;
    if (*((unsigned char *)result + 8) != 27)
    {
      __n128 result = 0;
      if (a3)
      {
        if (!v8)
        {
          *a3 = 1;
          return (void *)v10;
        }
      }
      return result;
    }
  }
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseTemplateArgs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned char **)a1;
  int v9 = *(unsigned char **)(a1 + 8);
  if (*(unsigned char **)a1 != v9 && *v8 == 73)
  {
    int v10 = a2;
    uint64_t v12 = v8 + 1;
    *(void *)a1 = v12;
    if (a2)
    {
      *(void *)(a1 + 672) = *(void *)(a1 + 664);
      uint64_t v36 = a1 + 576;
      *(void *)(a1 + 584) = *(void *)(a1 + 576);
      uint64_t v12 = *(unsigned char **)a1;
      int v9 = *(unsigned char **)(a1 + 8);
    }
    unint64_t v34 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
    unint64_t v13 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    while (v12 == v9 || *v12 != 69)
    {
      if (v10)
      {
        uint64_t v36 = v14;
        if (!v14) {
          return;
        }
        uint64_t v15 = v14;
        unsigned int v35 = (void *)v15;
        int v16 = *(unsigned __int8 *)(v15 + 8);
        if (v16 == 41)
        {
          uint64_t v18 = *(void *)(v15 + 16);
          uint64_t v19 = *(void *)(v15 + 24);
          *((unsigned char *)v20 + 8) = 40;
          __int16 v21 = *(_WORD *)((unsigned char *)v20 + 9) & 0xF000;
          *int v20 = off_26C2230A0;
          v20[2] = v18;
          v20[3] = v19;
          __int16 v22 = v21 | 0xA80;
          *(_WORD *)((char *)v20 + 9) = v21 | 0xA80;
          uint64_t v23 = 8 * v19;
          if (v19)
          {
            uint64_t v24 = 8 * v19;
            uint64_t v25 = v18;
            while ((*(_WORD *)(*(void *)v25 + 9) & 0x300) == 0x100)
            {
              v25 += 8;
              v24 -= 8;
              if (!v24) {
                goto LABEL_19;
              }
            }
          }
          else
          {
LABEL_19:
            __int16 v22 = v21 | 0x980;
            *(_WORD *)((char *)v20 + 9) = v21 | 0x980;
          }
          if (v19)
          {
            uint64_t v26 = 8 * v19;
            uint64_t v27 = v18;
            while ((*(_WORD *)(*(void *)v27 + 9) & 0xC00) == 0x400)
            {
              v27 += 8;
              v26 -= 8;
              if (!v26) {
                goto LABEL_24;
              }
            }
          }
          else
          {
LABEL_24:
            __int16 v22 = v22 & 0xF3FF | 0x400;
            *(_WORD *)((char *)v20 + 9) = v22;
          }
          if (v19)
          {
            while ((*(_WORD *)(*(void *)v18 + 9) & 0xC0) == 0x40)
            {
              v18 += 8;
              v23 -= 8;
              if (!v23) {
                goto LABEL_28;
              }
            }
          }
          else
          {
LABEL_28:
            *(_WORD *)((char *)v20 + 9) = v22 & 0xFF3F | 0x40;
          }
          unsigned int v35 = v20;
        }
        else if (v16 == 34)
        {
          unsigned int v35 = *(void **)(v15 + 24);
        }
      }
      else
      {
        uint64_t v36 = v17;
        if (!v17) {
          return;
        }
      }
      uint64_t v12 = *(unsigned char **)a1;
      int v9 = *(unsigned char **)(a1 + 8);
      if (*(unsigned char **)a1 != v9 && *v12 == 81)
      {
        *(void *)a1 = v12 + 1;
        char v28 = *(unsigned char *)(a1 + 778);
        *(unsigned char *)(a1 + 778) = 1;
        *(unsigned char *)(a1 + 778) = v28;
        if (!v29) {
          return;
        }
        uint64_t v12 = *(unsigned char **)a1;
        if (*(void *)a1 == *(void *)(a1 + 8) || *v12 != 69) {
          return;
        }
LABEL_38:
        *(void *)a1 = v12 + 1;
        uint64_t v32 = v31;
        *((unsigned char *)v33 + 8) = 43;
        *(_WORD *)((char *)v33 + 9) = *(_WORD *)((unsigned char *)v33 + 9) & 0xF000 | 0x540;
        *uint64_t v33 = off_26C223110;
        v33[2] = v30;
        v33[3] = v32;
        v33[4] = v29;
        return;
      }
    }
    uint64_t v29 = 0;
    goto LABEL_38;
  }
}

void sub_20D71C9A8(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 778) = v2;
  _Unwind_Resume(a1);
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameWithTemplateArgs,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  *((unsigned char *)result + 8) = 45;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C223180;
  result[2] = v6;
  result[3] = v7;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseCVQualifiers(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  char v2 = *(unsigned char **)(a1 + 8);
  if (*(unsigned char **)a1 == v2 || *v1 != 114)
  {
    uint64_t v3 = 0;
  }
  else
  {
    *(void *)a1 = ++v1;
    uint64_t v3 = 4;
  }
  if (v1 != v2)
  {
    if (*v1 == 86)
    {
      *(void *)a1 = ++v1;
      uint64_t v3 = v3 | 2;
    }
    if (v1 != v2 && *v1 == 75)
    {
      *(void *)a1 = v1 + 1;
      return v3 | 1;
    }
  }
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseTemplateParam(uint64_t a1)
{
  char v2 = *(unsigned __int8 **)a1;
  uint64_t v1 = *(unsigned __int8 **)(a1 + 8);
  if (*(unsigned __int8 **)a1 == v1 || *v2 != 84) {
    return 0;
  }
  uint64_t v4 = v2 + 1;
  *(void *)a1 = v2 + 1;
  uint64_t v26 = 0;
  if (v2 + 1 == v1)
  {
    unint64_t v6 = 0;
    uint64_t v25 = 0;
  }
  else
  {
    if (*v4 == 76)
    {
      *(void *)a1 = v2 + 2;
      char v5 = *(unsigned __int8 **)a1;
      uint64_t v1 = *(unsigned __int8 **)(a1 + 8);
      if (*(unsigned __int8 **)a1 == v1 || *v5 != 95) {
        return 0;
      }
      unint64_t v6 = v26 + 1;
      uint64_t v4 = v5 + 1;
      *(void *)a1 = v4;
    }
    else
    {
      unint64_t v6 = 0;
    }
    uint64_t v25 = 0;
    if (v4 != v1 && *v4 == 95)
    {
      unint64_t v7 = 0;
      goto LABEL_18;
    }
  }
  uint64_t v4 = *(unsigned __int8 **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8) || *v4 != 95) {
    return 0;
  }
  unint64_t v7 = v25 + 1;
LABEL_18:
  *(void *)a1 = v4 + 1;
  if (*(unsigned char *)(a1 + 778))
  {
    int64_t v8 = v4 - v2;
    *((unsigned char *)v9 + 8) = 8;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((unsigned char *)v9 + 9) & 0xF000 | 0x540;
    *int v9 = off_26C221660;
    v9[2] = v2;
    v9[3] = v8;
    return v9;
  }
  if (*(unsigned char *)(a1 + 777) && !v6)
  {
    *((unsigned char *)v9 + 8) = 44;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((unsigned char *)v9 + 9) & 0xF000 | 0xA80;
    *int v9 = off_26C221740;
    v9[2] = v7;
    v9[3] = 0;
    *((unsigned char *)v9 + 32) = 0;
    int v11 = *(char **)(a1 + 728);
    if (v11 == *(char **)(a1 + 736))
    {
      uint64_t v12 = *(unsigned char **)(a1 + 720);
      uint64_t v13 = v11 - v12;
      if (v12 == (unsigned char *)(a1 + 744))
      {
        __int16 v21 = (char *)malloc_type_malloc(2 * v13, 0x2004093837F09uLL);
        if (!v21) {
          goto LABEL_43;
        }
        uint64_t v14 = v21;
        __int16 v22 = *(unsigned char **)(a1 + 720);
        uint64_t v23 = *(unsigned char **)(a1 + 728);
        if (v23 != v22) {
          memmove(v21, v22, v23 - v22);
        }
        *(void *)(a1 + 720) = v14;
      }
      else
      {
        uint64_t v14 = (char *)malloc_type_realloc(v12, 2 * (v11 - v12), 0x2004093837F09uLL);
        *(void *)(a1 + 720) = v14;
        if (!v14) {
LABEL_43:
        }
          abort();
      }
      int v11 = &v14[8 * (v13 >> 3)];
      *(void *)(a1 + 736) = &v14[8 * (v13 >> 2)];
    }
    *(void *)(a1 + 728) = v11 + 8;
    *(void *)int v11 = v9;
    return v9;
  }
  uint64_t v15 = *(void *)(a1 + 664);
  uint64_t v16 = *(void *)(a1 + 672) - v15;
  if (v6 < v16 >> 3)
  {
    uint64_t v17 = *(void **)(v15 + 8 * v6);
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v18 = *v17;
      if (v7 < (v19[1] - v18) >> 3) {
        return *(void **)(v18 + 8 * v7);
      }
    }
  }
  int v9 = 0;
  unint64_t v20 = v16 >> 3;
  if (v6 <= v20 && *(void *)(a1 + 784) == v6)
  {
    if (v6 == v20)
    {
      uint64_t v24 = 0;
    }
  }
  return v9;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseDecltype(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  char v2 = *(unsigned char **)(a1 + 8);
  if (*(unsigned char **)a1 == v2) {
    return 0;
  }
  if (*v1 != 68) {
    return 0;
  }
  *(void *)a1 = v1 + 1;
  if (v1 + 1 == v2 || (v1[1] | 0x20) != 0x74) {
    return 0;
  }
  *(void *)a1 = v1 + 2;
  if (!result) {
    return result;
  }
  char v5 = *(unsigned char **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8) || *v5 != 69) {
    return 0;
  }
  unint64_t v6 = result;
  *(void *)a1 = v5 + 1;
  *((unsigned char *)result + 8) = 60;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221C80;
  result[2] = "decltype";
  result[3] = 8;
  result[5] = 0;
  result[6] = 0;
  result[4] = v6;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[4]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSubstitution(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 **)a1;
  char v2 = *(unsigned __int8 **)(a1 + 8);
  if (*(unsigned __int8 **)a1 == v2 || *v1 != 83) {
    return 0;
  }
  *(void *)a1 = v1 + 1;
  if (v2 == v1 + 1) {
    goto LABEL_11;
  }
  unsigned int v4 = v1[1];
  if ((char)v1[1] < 97)
  {
    if (v4 == 95)
    {
      *(void *)a1 = v1 + 2;
      uint64_t v7 = *(void *)(a1 + 296);
      if (v7 != *(void *)(a1 + 304)) {
        return *(void **)v7;
      }
      return 0;
    }
LABEL_11:
    uint64_t v14 = 0;
    char v5 = 0;
    int64_t v8 = *(unsigned __int8 **)a1;
    if (*(void *)a1 != *(void *)(a1 + 8) && *v8 == 95)
    {
      unint64_t v9 = (unint64_t)v14 + 1;
      *(void *)a1 = v8 + 1;
      uint64_t v10 = *(void *)(a1 + 296);
      if (v9 < (*(void *)(a1 + 304) - v10) >> 3) {
        return *(void **)(v10 + 8 * v9);
      }
    }
    return 0;
  }
  if (v4 > 0x7A) {
    goto LABEL_11;
  }
  char v5 = 0;
  int v6 = 0;
  switch(v1[1])
  {
    case 'a':
      goto LABEL_24;
    case 'b':
      int v6 = 1;
      goto LABEL_24;
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
      return v5;
    case 'd':
      int v6 = 5;
      goto LABEL_24;
    case 'i':
      int v6 = 3;
      goto LABEL_24;
    default:
      if (v4 == 111)
      {
        int v6 = 4;
      }
      else
      {
        if (v4 != 115) {
          return v5;
        }
        int v6 = 2;
      }
LABEL_24:
      *(void *)a1 = v1 + 2;
      *((unsigned char *)v5 + 8) = 48;
      *(_WORD *)((char *)v5 + 9) = *(_WORD *)((unsigned char *)v5 + 9) & 0xF000 | 0x540;
      *((_DWORD *)v5 + 3) = v6;
      *char v5 = off_26C222CB0;
      uint64_t v14 = v12;
      if (v12 != v5)
      {
        uint64_t v13 = v12;
        char v5 = v13;
      }
      break;
  }
  return v5;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnqualifiedName(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4 = (void *)a3;
  uint64_t v41 = a4;
  uint64_t v42 = (void *)a3;
  int64_t v8 = *(char **)a1;
  unint64_t v9 = *(unsigned __int8 **)(a1 + 8);
  if (!v4) {
    goto LABEL_7;
  }
  if (v8 == (char *)v9)
  {
    char v10 = 1;
    goto LABEL_31;
  }
  if (*v8 == 70)
  {
    char v10 = 0;
    *(void *)a1 = ++v8;
  }
  else
  {
LABEL_7:
    char v10 = 1;
  }
  if (v8 == (char *)v9)
  {
LABEL_31:
    goto LABEL_32;
  }
  if (*v8 == 76) {
    *(void *)a1 = ++v8;
  }
  if (v9 != (unsigned __int8 *)v8 && *v8 >= 49)
  {
    unsigned int v11 = *v8;
    if (v11 <= 0x39)
    {
LABEL_32:
      uint64_t v18 = v12;
      goto LABEL_33;
    }
    if (v11 == 85)
    {
      goto LABEL_32;
    }
  }
  if ((unint64_t)(v9 - (unsigned __int8 *)v8) < 2 || *(_WORD *)v8 != 17220)
  {
    if (v9 != (unsigned __int8 *)v8 && *v8 - 67 <= 1)
    {
      uint64_t v7 = 0;
      if (!v4 || v41) {
        return v7;
      }
      if (*((unsigned char *)v4 + 8) == 48)
      {
        int v14 = *((_DWORD *)v4 + 3);
        *((unsigned char *)v13 + 8) = 47;
        *(_WORD *)((char *)v13 + 9) = *(_WORD *)((unsigned char *)v13 + 9) & 0xF000 | 0x540;
        *uint64_t v13 = off_26C222D38;
        *((_DWORD *)v13 + 3) = v14;
        uint64_t v42 = v13;
        int64_t v8 = *(char **)a1;
        unint64_t v9 = *(unsigned __int8 **)(a1 + 8);
        unsigned int v4 = v13;
      }
      if (v8 == (char *)v9) {
        return 0;
      }
      int v15 = *v8;
      if (v15 == 67)
      {
        uint64_t v16 = (unsigned __int8 *)(v8 + 1);
        *(void *)a1 = v8 + 1;
        if (v8 + 1 == (char *)v9)
        {
          int v17 = 0;
          uint64_t v16 = v9;
        }
        else if (*v16 == 73)
        {
          uint64_t v16 = (unsigned __int8 *)(v8 + 2);
          *(void *)a1 = v8 + 2;
          int v17 = 1;
        }
        else
        {
          int v17 = 0;
        }
        if (v9 == v16 || *v16 - 49 > 4) {
          return 0;
        }
        LODWORD(v40) = 0;
        LODWORD(v40) = (char)*v16 - 48;
        *(void *)a1 = v16 + 1;
        if (a2) {
          *a2 = 1;
        }
        if (v17
        {
          uint64_t v18 = 0;
          goto LABEL_33;
        }
        char v43 = 0;
      }
      else
      {
        uint64_t v7 = 0;
        if ((unint64_t)(v9 - (unsigned __int8 *)v8) < 2) {
          return v7;
        }
        if (v15 != 68) {
          return v7;
        }
        uint64_t v7 = 0;
        unsigned int v39 = v8[1];
        if (v39 > 0x35 || ((1 << v39) & 0x37000000000000) == 0) {
          return v7;
        }
        LODWORD(v40) = 0;
        LODWORD(v40) = v8[1] - 48;
        *(void *)a1 = v8 + 2;
        if (a2) {
          *a2 = 1;
        }
        char v43 = 1;
      }
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  *(void *)a1 = v8 + 2;
  uint64_t v26 = *(void *)(a1 + 16);
  uint64_t v27 = *(void *)(a1 + 24);
  if (!v40) {
    return 0;
  }
  unint64_t v28 = (v27 - v26) >> 3;
  while (1)
  {
    unsigned int v35 = *(char **)a1;
    if (*(void *)a1 != *(void *)(a1 + 8) && *v35 == 69) {
      break;
    }
    if (!v40) {
      return 0;
    }
  }
  *(void *)a1 = v35 + 1;
  uint64_t v38 = v37;
  *((unsigned char *)v18 + 8) = 53;
  *(_WORD *)((char *)v18 + 9) = *(_WORD *)((unsigned char *)v18 + 9) & 0xF000 | 0x540;
  *uint64_t v18 = off_26C222E00;
  v18[2] = v36;
  v18[3] = v38;
LABEL_33:
  if (!v18 || (uint64_t v19 = v41) == 0)
  {
    if (v18) {
      goto LABEL_37;
    }
    return 0;
  }
  *((unsigned char *)v20 + 8) = 28;
  *(_WORD *)((char *)v20 + 9) = *(_WORD *)((unsigned char *)v20 + 9) & 0xF000 | 0x540;
  *unint64_t v20 = off_26C222EE0;
  v20[2] = v19;
  v20[3] = v18;
  uint64_t v18 = v20;
LABEL_37:
  uint64_t v7 = v21;
  if (v21) {
    char v22 = v10;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    *((unsigned char *)v23 + 8) = 25;
    *(_WORD *)((char *)v23 + 9) = *(_WORD *)((unsigned char *)v23 + 9) & 0xF000 | 0x540;
    uint64_t v24 = off_26C222F50;
    goto LABEL_45;
  }
  if (v4 && v21)
  {
    *((unsigned char *)v23 + 8) = 24;
    *(_WORD *)((char *)v23 + 9) = *(_WORD *)((unsigned char *)v23 + 9) & 0xF000 | 0x540;
    uint64_t v24 = off_26C222FC0;
LABEL_45:
    *uint64_t v23 = v24;
    v23[2] = v4;
    v23[3] = v7;
    return v23;
  }
  return v7;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,std::string_view>(uint64_t a1, __n128 *a2)
{
  *((unsigned char *)v3 + 8) = 8;
  __int16 v4 = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C221660;
  __n128 result = *a2;
  *(_WORD *)((char *)v3 + 9) = v4;
  *((__n128 *)v3 + 1) = result;
  return result;
}

const void **anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,8ul> *,4ul>::push_back(const void **result, uint64_t *size)
{
  uint64_t v3 = result;
  __int16 v4 = (char *)result[1];
  if (v4 == result[2])
  {
    char v5 = (void *)*result;
    uint64_t v6 = v4 - (unsigned char *)*v3;
    if (*v3 == v3 + 3)
    {
      __n128 result = (const void **)malloc_type_malloc(2 * v6, 0x2004093837F09uLL);
      if (!result) {
        goto LABEL_11;
      }
      uint64_t v7 = result;
      int64_t v8 = v3[1];
      if (v8 != *v3) {
        __n128 result = (const void **)memmove(result, *v3, v8 - (unsigned char *)*v3);
      }
      *uint64_t v3 = v7;
    }
    else
    {
      __n128 result = (const void **)malloc_type_realloc(v5, 2 * v6, 0x2004093837F09uLL);
      uint64_t v7 = result;
      *uint64_t v3 = result;
      if (!result) {
LABEL_11:
      }
        abort();
    }
    __int16 v4 = (char *)&v7[v6 >> 3];
    v3[1] = v4;
    v3[2] = &v7[v6 >> 2];
  }
  uint64_t v9 = *size;
  v3[1] = v4 + 8;
  *(void *)__int16 v4 = v9;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[5]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::hasRHSComponentSlow(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 0;
  }
  *(unsigned char *)(a1 + 32) = 1;
  uint64_t v3 = *(void *)(a1 + 24);
  unsigned int v4 = *(unsigned __int8 *)(v3 + 9);
  if ((v4 & 0xC0) == 0x80) {
    uint64_t result = (**(uint64_t (***)(uint64_t))v3)(v3);
  }
  else {
    uint64_t result = v4 < 0x40;
  }
  *(unsigned char *)(a1 + 32) = 0;
  return result;
}

void sub_20D71D804(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::hasArraySlow(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 0;
  }
  *(unsigned char *)(a1 + 32) = 1;
  uint64_t v3 = *(unsigned char **)(a1 + 24);
  int v4 = v3[10] & 3;
  if (v4 == 2) {
    uint64_t result = (*(uint64_t (**)(unsigned char *))(*(void *)v3 + 8))(v3);
  }
  else {
    uint64_t result = v4 == 0;
  }
  *(unsigned char *)(a1 + 32) = 0;
  return result;
}

void sub_20D71D88C(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::hasFunctionSlow(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 0;
  }
  *(unsigned char *)(a1 + 32) = 1;
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = (*(unsigned __int16 *)(v3 + 9) >> 10) & 3;
  if (v4 == 2) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
  }
  else {
    uint64_t result = v4 == 0;
  }
  *(unsigned char *)(a1 + 32) = 0;
  return result;
}

void sub_20D71D914(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::getSyntaxNode(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!*(unsigned char *)(a1 + 32))
  {
    *(unsigned char *)(a1 + 32) = 1;
    uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
    *(unsigned char *)(v1 + 32) = 0;
    return v2;
  }
  return v1;
}

void sub_20D71D980(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::printLeft(uint64_t result)
{
  if (!*(unsigned char *)(result + 32))
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 32) = 1;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(result + 24) + 32))(*(void *)(result + 24));
    *(unsigned char *)(v1 + 32) = 0;
  }
  return result;
}

void sub_20D71D9E4(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::printRight(uint64_t result)
{
  if (!*(unsigned char *)(result + 32))
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 32) = 1;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(result + 24) + 40))(*(void *)(result + 24));
    *(unsigned char *)(v1 + 32) = 0;
  }
  return result;
}

void sub_20D71DA48(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

void anonymous namespace'::itanium_demangle::ForwardTemplateReference::~ForwardTemplateReference(_anonymous_namespace_::itanium_demangle::ForwardTemplateReference *this)
{
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseExpr(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 **)a1;
  if (*(void *)(a1 + 8) - *(void *)a1 >= 2uLL && *(_WORD *)v2 == 29543)
  {
    *(void *)a1 = v2 + 2;
    int v3 = 1;
  }
  else
  {
    int v3 = 0;
  }
  char v148 = v3;
  if (v4)
  {
    unsigned int v11 = v4;
    v147.n128_u64[0] = (unint64_t)Symbol;
    v147.n128_u64[1] = v12;
    uint64_t v20 = v12;
    switch(v11[2])
    {
      case 1u:
        __int16 v21 = *(unsigned __int8 **)a1;
        if (*(void *)a1 != *(void *)(a1 + 8) && *v21 == 95)
        {
          *(void *)a1 = v21 + 1;
          goto LABEL_9;
        }
        if (v64)
        {
          uint64_t v65 = v64;
          unsigned int v66 = v11[3];
          *((unsigned char *)v67 + 8) = 56;
          *(_WORD *)((char *)v67 + 9) = *(_WORD *)((unsigned char *)v67 + 9) & 0xF000 | (v66 >> 1) | 0x540;
          *uint64_t v67 = off_26C221890;
          v67[2] = v65;
          v67[3] = Symbol;
          v67[4] = v20;
        }
        return;
      case 2u:
        int v27 = (char)v11[3] >> 1;
        v151.n128_u64[0] = (unint64_t)Symbol;
        v151.n128_u64[1] = v12;
        int v150 = v27;
        if ((void)v146)
        {
          if (v149) {
        }
          }
        return;
      case 3u:
        if (v151.n128_u64[0])
        {
          if ((void)v146)
          {
            LODWORD(v149) = (char)v11[3] >> 1;
          }
        }
        return;
      case 4u:
        if (v151.n128_u64[0])
        {
          if ((void)v146)
          {
            LODWORD(v149) = (char)v11[3] >> 1;
          }
        }
        return;
      case 5u:
        unint64_t v28 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
        while (1)
        {
          uint64_t v29 = *(unsigned __int8 **)a1;
          if (*(void *)a1 != *(void *)(a1 + 8) && *v29 == 95) {
            break;
          }
          if (!v151.n128_u64[0]) {
            return;
          }
        }
        *(void *)a1 = v29 + 1;
        v151.n128_u64[1] = v71;
        if (v149)
        {
          unint64_t v79 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
          while (1)
          {
            uint64_t v80 = *(unsigned __int8 **)a1;
            if (*(void *)a1 != *(void *)(a1 + 8) && *v80 == 69) {
              break;
            }
            if (!v78) {
              return;
            }
            if (!(void)v146) {
              return;
            }
          }
          *(void *)a1 = v80 + 1;
          *((void *)&v146 + 1) = v93;
          int v94 = (char)v11[3];
          char v145 = v94 & 1;
          int v150 = v94 >> 1;
        }
        return;
      case 6u:
        if (v30)
        {
          uint64_t v31 = v30;
          unsigned int v32 = v11[3];
          *((unsigned char *)v33 + 8) = 65;
          *(_WORD *)((char *)v33 + 9) = *(_WORD *)((unsigned char *)v33 + 9) & 0xF000 | (v32 >> 1) | 0x540;
          *uint64_t v33 = off_26C221A50;
          v33[2] = v31;
          *((unsigned char *)v33 + 24) = v3;
          *((unsigned char *)v33 + 25) = v32 & 1;
        }
        return;
      case 7u:
        if ((void)v146)
        {
          unint64_t v40 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
          while (1)
          {
            uint64_t v41 = *(unsigned __int8 **)a1;
            if (*(void *)a1 != *(void *)(a1 + 8) && *v41 == 69)
            {
              *(void *)a1 = v41 + 1;
              v151.n128_u64[1] = v83;
              LODWORD(v149) = (char)v11[3] >> 1;
              unint64_t v84 = (__n128 *)&v146;
              goto LABEL_91;
            }
            if (!v151.n128_u64[0]) {
              break;
            }
          }
        }
        return;
      case 8u:
        char v42 = *(unsigned char *)(a1 + 776);
        *(unsigned char *)(a1 + 776) = 0;
        *(void *)&long long v146 = v43;
        *(unsigned char *)(a1 + 776) = v42;
        if (!v43) {
          return;
        }
        unint64_t v50 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
        unint64_t v51 = *(unsigned __int8 **)a1;
        v52 = *(unsigned __int8 **)(a1 + 8);
        if (*(unsigned __int8 **)a1 == v52 || *v51 != 95)
        {
          int v53 = 0;
        }
        else
        {
          *(void *)a1 = ++v51;
          int v53 = 1;
        }
        break;
      case 9u:
        if (v151.n128_u64[0])
        {
          if ((void)v146)
          {
            if (v149)
            {
              int v150 = (char)v11[3] >> 1;
            }
          }
        }
        return;
      case 0xAu:
        return;
      case 0xBu:
        if (v151.n128_u64[0])
        {
          if ((void)v146)
          {
            LODWORD(v149) = (char)v11[3] >> 1;
          }
        }
        return;
      case 0xCu:
        if (v11[3]) {
        else
        }
        uint64_t v68 = v26;
        if (v26)
        {
          unsigned int v69 = v11[3];
          *((unsigned char *)v70 + 8) = 60;
          *(_WORD *)((char *)v70 + 9) = *(_WORD *)((unsigned char *)v70 + 9) & 0xF000 | (v69 >> 1) | 0x540;
          *int v70 = off_26C221C80;
          v70[2] = Symbol;
          v70[3] = v20;
          v70[5] = 0;
          v70[6] = 0;
          v70[4] = v68;
        }
        return;
      default:
LABEL_9:
        return;
    }
    while (v51 == v52 || *v51 != 69)
    {
      if (!v151.n128_u64[0]) {
        return;
      }
      if ((v53 & 1) == 0)
      {
        v151.n128_u64[1] = v85;
        if (v85 != 1) {
          return;
        }
        goto LABEL_118;
      }
      unint64_t v51 = *(unsigned __int8 **)a1;
      v52 = *(unsigned __int8 **)(a1 + 8);
    }
    *(void *)a1 = v51 + 1;
    v151.n128_u64[1] = v89;
    if (v89 == 1) {
      int v90 = 1;
    }
    else {
      int v90 = v53;
    }
    if (v90 == 1)
    {
LABEL_118:
      LODWORD(v149) = (char)v11[3] >> 1;
      return;
    }
    return;
  }
  char v22 = *(unsigned __int8 **)a1;
  uint64_t v23 = *(char **)(a1 + 8);
  unint64_t v24 = (unint64_t)&v23[-*(void *)a1];
  if (v24 < 2) {
    return;
  }
  int v25 = *v22;
  switch(v25)
  {
    case 'f':
      v54 = (char *)(v22 + 1);
      int v55 = v22[1];
      if (v55 != 112)
      {
        if (v55 != 76) {
          goto LABEL_105;
        }
        if (v24 < 3)
        {
          uint64_t v56 = 0;
        }
        else
        {
          if ((char)v22[2] < 0) {
            goto LABEL_105;
          }
          uint64_t v56 = v22[2];
        }
        if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v56 + 60) & 0x400) == 0)
        {
LABEL_105:
          if (v22 != (unsigned __int8 *)v23)
          {
            *(void *)a1 = v54;
            if (v23 != v54)
            {
              int v87 = *v54;
              if (v87 > 107)
              {
                if (v87 == 108)
                {
                  int v92 = 0;
                  int v88 = 1;
                }
                else
                {
                  if (v87 != 114) {
                    return;
                  }
                  int v88 = 0;
                  int v92 = 0;
                }
              }
              else
              {
                if (v87 == 76)
                {
                  int v88 = 1;
                }
                else
                {
                  if (v87 != 82) {
                    return;
                  }
                  int v88 = 0;
                }
                int v92 = 1;
              }
              *(void *)a1 = v22 + 2;
              if (v95)
              {
                uint64_t v96 = (uint64_t)v95;
                int v97 = v95[2];
                if (v97 == 2
                  || v97 == 4 && *(unsigned char *)(strlen(*((const char **)v95 + 1)) + *((void *)v95 + 1) - 1) == 42)
                {
                  if (v98)
                  {
                    uint64_t v99 = v98;
                    if (v92)
                    {
                      if (!v100) {
                        return;
                      }
                      if (v88) {
                        uint64_t v101 = v99;
                      }
                      else {
                        uint64_t v101 = v100;
                      }
                      if (v88) {
                        uint64_t v99 = v100;
                      }
                    }
                    else
                    {
                      uint64_t v101 = 0;
                    }
                    uint64_t v114 = v113;
                    *((unsigned char *)v115 + 8) = 71;
                    *(_WORD *)((char *)v115 + 9) = *(_WORD *)((unsigned char *)v115 + 9) & 0xF000 | 0x540;
                    void *v115 = off_26C222460;
                    v115[2] = v99;
                    v115[3] = v101;
                    v115[4] = v112;
                    v115[5] = v114;
                    *((unsigned char *)v115 + 48) = v88;
                    return;
                  }
                }
              }
            }
          }
          return;
        }
      }
      return;
    case 'T':
      return;
    case 'L':
      return;
  }
  if (*(_WORD *)v22 != 27753)
  {
    if (*(_WORD *)v22 == 25453)
    {
      *(void *)a1 = v22 + 2;
      return;
    }
    {
      if (v151.n128_u64[0])
      {
        v147.n128_u32[0] = 2;
      }
      return;
    }
    v86 = *(unsigned __int8 **)a1;
    if (*(void *)(a1 + 8) - *(void *)a1 >= 2uLL && *v86 == 114 && (v86[1] | 0x20) == 0x71)
    {
      return;
    }
    {
      return;
    }
    {
      if (v151.n128_u64[0]) {
      return;
      }
    }
    {
      if (*(void *)(a1 + 8) != *(void *)a1 && **(unsigned char **)a1 == 84)
      {
        if (v151.n128_u64[0]) {
        return;
        }
      }
      v151.n128_u64[0] = v116;
      if (!v116) {
        return;
      }
LABEL_174:
      return;
    }
    {
      unint64_t v109 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
      while (1)
      {
        v110 = *(unsigned __int8 **)a1;
        if (*(void *)a1 != *(void *)(a1 + 8) && *v110 == 69) {
          break;
        }
        v151.n128_u64[0] = v111;
        if (!v111) {
          return;
        }
      }
      *(void *)a1 = v110 + 1;
      v151.n128_u64[1] = v125;
      v151.n128_u64[0] = v126;
      goto LABEL_174;
    }
    {
      if (v147.n128_u64[0])
      {
        unint64_t v123 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
        while (1)
        {
          v124 = *(unsigned __int8 **)a1;
          if (*(void *)a1 != *(void *)(a1 + 8) && *v124 == 69) {
            break;
          }
          if (!v151.n128_u64[0]) {
            return;
          }
        }
        *(void *)a1 = v124 + 1;
        v151.n128_u64[1] = v140;
      }
      return;
    }
    {
      return;
    }
    {
      if (v151.n128_u64[0]) {
      return;
      }
    }
    v127 = *(unsigned __int8 **)a1;
    if (*(void *)a1 == *(void *)(a1 + 8) || *v127 != 117)
    {
      return;
    }
    *(void *)a1 = v127 + 1;
    v147.n128_u64[0] = (unint64_t)v128;
    if (!v128) {
      return;
    }
    v129 = (void *)(*(uint64_t (**)(void *))(*v128 + 48))(v128);
    if (v130 == 8 && *v129 == 0x666F646975755F5FLL)
    {
      v142 = *(unsigned __int8 **)a1;
      if (*(void *)a1 != *(void *)(a1 + 8))
      {
        int v143 = *v142;
        if (v143 == 122)
        {
          *(void *)a1 = v142 + 1;
          goto LABEL_199;
        }
        if (v143 == 116)
        {
          *(void *)a1 = v142 + 1;
LABEL_199:
          *(void *)&long long v146 = v144;
          if (!v144) {
            return;
          }
          uint64_t v137 = *(void *)(a1 + 24) - *(void *)(a1 + 16);
          goto LABEL_193;
        }
      }
    }
    uint64_t v137 = *(void *)(a1 + 24) - *(void *)(a1 + 16);
    while (1)
    {
      v138 = *(unsigned __int8 **)a1;
      if (*(void *)a1 != *(void *)(a1 + 8) && *v138 == 69) {
        break;
      }
      v151.n128_u64[0] = v139;
      if (!v139) {
        return;
      }
    }
    *(void *)a1 = v138 + 1;
LABEL_193:
    v151.n128_u64[1] = v141;
    LODWORD(v149) = 1;
    unint64_t v84 = &v147;
LABEL_91:
    return;
  }
  v81 = v22 + 2;
  *(void *)a1 = v81;
  unint64_t v82 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
  while (v81 == (unsigned __int8 *)v23 || *v81 != 69)
  {
    if (!v151.n128_u64[0]) {
      return;
    }
    v81 = *(unsigned __int8 **)a1;
    uint64_t v23 = *(char **)(a1 + 8);
  }
  *(void *)a1 = v81 + 1;
  v151.n128_u64[1] = v91;
}

unsigned __int8 *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseOperatorEncoding(unsigned __int8 **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)(a1[1] - *a1) < 2) {
    return 0;
  }
  unint64_t v2 = 0;
  int v3 = *v1;
  uint64_t v4 = 61;
  do
  {
    unint64_t v5 = (v4 + v2) >> 1;
       + 16 * v5;
    if (*v6 >= (char)v3)
    {
      if (*v6 == v3)
      {
        if (v6[1] >= (char)v1[1]) {
          uint64_t v4 = (v4 + v2) >> 1;
        }
        else {
          unint64_t v2 = v5 + 1;
        }
      }
      else
      {
        uint64_t v4 = (v4 + v2) >> 1;
      }
    }
    else
    {
      unint64_t v2 = v5 + 1;
    }
  }
  while (v4 != v2);
     + 16 * v2;
  if (*v7 != v3 || v7[1] != v1[1]) {
    return 0;
  }
  *a1 = v1 + 2;
  return v7;
}

const char *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::OperatorInfo::getSymbol(uint64_t a1)
{
  unint64_t v2 = *(const char **)(a1 + 8);
  size_t v3 = strlen(v2);
  size_t v10 = v3;
  if (*(unsigned __int8 *)(a1 + 2) > 0xAu) {
    return v2;
  }
  if (v3 < 8 || *(void *)v2 != 0x726F74617265706FLL) {
    abort_message("%s:%d: %s", v3, v4, v5, v6, v7, v8, v9, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
  }
  uint64_t result = v2 + 8;
  if (v10 != 8 && *result == 32) {
    return v2 + 9;
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parsePrefixExpr(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (result)
  {
    uint64_t v9 = result;
    *((unsigned char *)result + 8) = 66;
    *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | a4 & 0x3F | 0x540;
    *uint64_t result = off_26C221820;
    result[2] = a2;
    result[3] = a3;
    result[4] = v9;
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ArraySubscriptExpr,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, uint64_t *a3, _WORD *a4)
{
  uint64_t v8 = *a2;
  uint64_t v9 = *a3;
  char v10 = *a4;
  *((unsigned char *)result + 8) = 55;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | v10 & 0x3F | 0x540;
  *uint64_t result = off_26C221900;
  result[2] = v8;
  result[3] = v9;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::MemberExpr,anonymous namespace'::itanium_demangle::Node *&,std::string_view &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, __n128 *a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v10 = *a2;
  uint64_t v11 = *a4;
  char v12 = *a5;
  *((unsigned char *)v9 + 8) = 58;
  __int16 v13 = *(_WORD *)((unsigned char *)v9 + 9) & 0xF000 | v12 & 0x3F;
  *uint64_t v9 = off_26C221970;
  __n128 result = *a3;
  *(_WORD *)((char *)v9 + 9) = v13 | 0x540;
  v9[2] = v10;
  *(__n128 *)(v9 + 3) = result;
  v9[5] = v11;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NewExpr,anonymous namespace'::itanium_demangle::NodeArray &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray &,BOOL &,BOOL,anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, __n128 *a2, uint64_t *a3, long long *a4, char *a5, char *a6, _WORD *a7)
{
  uint64_t v14 = *a3;
  char v15 = *a5;
  char v16 = *a6;
  char v17 = *a7;
  *((unsigned char *)v13 + 8) = 64;
  __int16 v18 = *(_WORD *)((unsigned char *)v13 + 9) & 0xF000 | v17 & 0x3F;
  *__int16 v13 = off_26C2219E0;
  __n128 result = *a2;
  long long v20 = *a4;
  *(_WORD *)((char *)v13 + 9) = v18 | 0x540;
  *((__n128 *)v13 + 1) = result;
  v13[4] = v14;
  *(_OWORD *)(v13 + 5) = v20;
  *((unsigned char *)v13 + 56) = v15;
  *((unsigned char *)v13 + 57) = v16;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::CallExpr,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray,anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, __n128 *a3, _WORD *a4)
{
  uint64_t v8 = *a2;
  char v9 = *a4;
  *((unsigned char *)v7 + 8) = 63;
  __int16 v10 = *(_WORD *)((unsigned char *)v7 + 9) & 0xF000 | v9 & 0x3F;
  *uint64_t v7 = off_26C221AC0;
  __n128 result = *a3;
  *(_WORD *)((char *)v7 + 9) = v10 | 0x540;
  v7[2] = v8;
  *(__n128 *)(v7 + 3) = result;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ConversionExpr,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray &,anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, __n128 *a3, _WORD *a4)
{
  uint64_t v8 = *a2;
  char v9 = *a4;
  *((unsigned char *)v7 + 8) = 68;
  __int16 v10 = *(_WORD *)((unsigned char *)v7 + 9) & 0xF000 | v9 & 0x3F;
  *uint64_t v7 = off_26C221B30;
  __n128 result = *a3;
  *(_WORD *)((char *)v7 + 9) = v10 | 0x540;
  v7[2] = v8;
  *(__n128 *)(v7 + 3) = result;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ConditionalExpr,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v10 = *a2;
  uint64_t v11 = *a3;
  uint64_t v12 = *a4;
  char v13 = *a5;
  *((unsigned char *)result + 8) = 57;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | v13 & 0x3F | 0x540;
  *__n128 result = off_26C221BA0;
  result[2] = v10;
  result[3] = v11;
  result[4] = v12;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::CastExpr,std::string_view &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, __n128 *a2, uint64_t *a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v10 = *a3;
  uint64_t v11 = *a4;
  char v12 = *a5;
  *((unsigned char *)v9 + 8) = 61;
  __int16 v13 = *(_WORD *)((unsigned char *)v9 + 9) & 0xF000 | v12 & 0x3F;
  *char v9 = off_26C221C10;
  __n128 result = *a2;
  *(_WORD *)((char *)v9 + 9) = v13 | 0x540;
  *((__n128 *)v9 + 1) = result;
  v9[4] = v10;
  v9[5] = v11;
  return result;
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseExprPrimary(uint64_t a1)
{
  uint64_t v1 = *(char **)a1;
  unint64_t v2 = *(char **)(a1 + 8);
  if (*(char **)a1 != v2 && *v1 == 76)
  {
    uint64_t v4 = v1 + 1;
    *(void *)a1 = v1 + 1;
    unint64_t v5 = v2 - (v1 + 1);
    if (v2 == v1 + 1)
    {
LABEL_9:
      if (v27)
      {
        v26.n128_u64[1] = v7;
        if (v7)
        {
          uint64_t v8 = *(char **)a1;
          if (*(void *)a1 != *(void *)(a1 + 8) && *v8 == 69)
          {
            *(void *)a1 = v8 + 1;
          }
        }
      }
    }
    else
    {
      switch(*(unsigned char *)v4)
      {
        case 'A':
          if (v26.n128_u64[0])
          {
            uint64_t v6 = *(char **)a1;
            if (*(void *)a1 != *(void *)(a1 + 8) && *v6 == 69)
            {
              *(void *)a1 = v6 + 1;
            }
          }
          return;
        case 'D':
          if (v5 >= 2 && *v4 == 28228)
          {
            char v9 = v1 + 3;
            *(void *)a1 = v1 + 3;
            if (v1 + 3 != v2)
            {
              if (*v9 == 48)
              {
                char v9 = v1 + 4;
                *(void *)a1 = v1 + 4;
              }
              if (v9 != v2 && *v9 == 69)
              {
                *(void *)a1 = v9 + 1;
              }
            }
          }
          return;
        case 'T':
          return;
        case 'U':
          if (v5 >= 2 && v1[2] == 108)
          {
            if (v26.n128_u64[0])
            {
              uint64_t v10 = *(char **)a1;
              if (*(void *)a1 != *(void *)(a1 + 8) && *v10 == 69)
              {
                *(void *)a1 = v10 + 1;
              }
            }
          }
          return;
        case '_':
          if (v5 >= 2 && *v4 == 23135)
          {
            *(void *)a1 = v1 + 3;
            {
              uint64_t v11 = *(char **)a1;
              if (*(void *)a1 != *(void *)(a1 + 8) && *v11 == 69) {
                *(void *)a1 = v11 + 1;
              }
            }
          }
          return;
        case 'a':
          *(void *)a1 = v1 + 2;
          char v12 = "signed char";
          uint64_t v13 = 11;
          goto LABEL_77;
        case 'b':
          if (v5 >= 3 && (*v4 == 12386 ? (BOOL v14 = v1[3] == 69) : (BOOL v14 = 0), v14))
          {
            *(void *)a1 = v1 + 4;
            v26.n128_u32[0] = 0;
          }
          else
          {
            v26.n128_u32[0] = 1;
          }
          return;
        case 'c':
          *(void *)a1 = v1 + 2;
          char v12 = "char";
          uint64_t v13 = 4;
          goto LABEL_77;
        case 'd':
          char v15 = v1 + 2;
          *(void *)a1 = v1 + 2;
          if ((unint64_t)(v2 - (v1 + 2)) < 0x11) {
            return;
          }
          uint64_t v16 = 0;
          char v17 = v1 + 18;
          while ((v15[v16] & 0x80000000) == 0
               && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v15[v16] + 60) & 0x10000) != 0)
          {
            if (++v16 == 16)
            {
              *(void *)a1 = v17;
              if (v17 != v2 && *v17 == 69)
              {
                *(void *)a1 = v1 + 19;
                *((unsigned char *)v18 + 8) = 79;
                *(_WORD *)((char *)v18 + 9) = *(_WORD *)((unsigned char *)v18 + 9) & 0xF000 | 0x540;
                *__int16 v18 = off_26C221E40;
                uint64_t v19 = 16;
                goto LABEL_87;
              }
              return;
            }
          }
          return;
        case 'e':
          long long v20 = v1 + 2;
          *(void *)a1 = v1 + 2;
          if ((unint64_t)(v2 - (v1 + 2)) < 0x21) {
            return;
          }
          uint64_t v21 = 0;
          char v22 = v1 + 34;
          while ((v20[v21] & 0x80000000) == 0
               && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v20[v21] + 60) & 0x10000) != 0)
          {
            if (++v21 == 32)
            {
              *(void *)a1 = v22;
              if (v22 != v2 && *v22 == 69)
              {
                *(void *)a1 = v1 + 35;
                *((unsigned char *)v23 + 8) = 80;
                *(_WORD *)((char *)v23 + 9) = *(_WORD *)((unsigned char *)v23 + 9) & 0xF000 | 0x540;
                *uint64_t v23 = off_26C221EB0;
                v23[2] = v20;
                v23[3] = 32;
              }
              return;
            }
          }
          return;
        case 'f':
          char v15 = v1 + 2;
          *(void *)a1 = v1 + 2;
          if ((unint64_t)(v2 - (v1 + 2)) < 9) {
            return;
          }
          uint64_t v24 = 0;
          int v25 = v1 + 10;
          break;
        case 'h':
          *(void *)a1 = v1 + 2;
          char v12 = "unsigned char";
          uint64_t v13 = 13;
          goto LABEL_77;
        case 'i':
          *(void *)a1 = v1 + 2;
          char v12 = (const char *)&unk_20D72EF7A;
          uint64_t v13 = 0;
          goto LABEL_77;
        case 'j':
          *(void *)a1 = v1 + 2;
          char v12 = "u";
          goto LABEL_67;
        case 'l':
          *(void *)a1 = v1 + 2;
          char v12 = "l";
LABEL_67:
          uint64_t v13 = 1;
          goto LABEL_77;
        case 'm':
          *(void *)a1 = v1 + 2;
          char v12 = "ul";
          goto LABEL_75;
        case 'n':
          *(void *)a1 = v1 + 2;
          char v12 = "__int128";
          uint64_t v13 = 8;
          goto LABEL_77;
        case 'o':
          *(void *)a1 = v1 + 2;
          char v12 = "unsigned __int128";
          uint64_t v13 = 17;
          goto LABEL_77;
        case 's':
          *(void *)a1 = v1 + 2;
          char v12 = "short";
          uint64_t v13 = 5;
          goto LABEL_77;
        case 't':
          *(void *)a1 = v1 + 2;
          char v12 = "unsigned short";
          uint64_t v13 = 14;
          goto LABEL_77;
        case 'w':
          *(void *)a1 = v1 + 2;
          char v12 = "wchar_t";
          uint64_t v13 = 7;
          goto LABEL_77;
        case 'x':
          *(void *)a1 = v1 + 2;
          char v12 = "ll";
LABEL_75:
          uint64_t v13 = 2;
          goto LABEL_77;
        case 'y':
          *(void *)a1 = v1 + 2;
          char v12 = "ull";
          uint64_t v13 = 3;
LABEL_77:
          return;
        default:
          goto LABEL_9;
      }
      while ((v15[v24] & 0x80000000) == 0
           && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v15[v24] + 60) & 0x10000) != 0)
      {
        if (++v24 == 8)
        {
          *(void *)a1 = v25;
          if (v25 != v2 && *v25 == 69)
          {
            *(void *)a1 = v1 + 11;
            *((unsigned char *)v18 + 8) = 78;
            *(_WORD *)((char *)v18 + 9) = *(_WORD *)((unsigned char *)v18 + 9) & 0xF000 | 0x540;
            *__int16 v18 = off_26C221DD0;
            uint64_t v19 = 8;
LABEL_87:
            v18[2] = v15;
            v18[3] = v19;
          }
          return;
        }
      }
    }
  }
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseFunctionParam(uint64_t a1)
{
  unint64_t v2 = *(char **)a1;
  unint64_t v3 = *(void *)(a1 + 8) - *(void *)a1;
  if (v3 < 3)
  {
    if (v3 != 2) {
      return;
    }
    goto LABEL_8;
  }
  if (*(_WORD *)v2 != 28774 || v2[2] != 84)
  {
LABEL_8:
    if (*(_WORD *)v2 == 28774)
    {
      *(void *)a1 = v2 + 2;
      uint64_t v11 = *(char **)a1;
      if (*(void *)a1 != *(void *)(a1 + 8) && *v11 == 95)
      {
        char v12 = v9;
        uint64_t v13 = v10;
        *(void *)a1 = v11 + 1;
        *((unsigned char *)v14 + 8) = 67;
        *(_WORD *)((char *)v14 + 9) = *(_WORD *)((unsigned char *)v14 + 9) & 0xF000 | 0x540;
        *BOOL v14 = off_26C2223F0;
        v14[2] = v12;
        v14[3] = v13;
      }
    }
    else if (*(_WORD *)v2 == 19558)
    {
      *(void *)a1 = v2 + 2;
      if (v5)
      {
        uint64_t v6 = *(char **)a1;
        if (*(void *)a1 != *(void *)(a1 + 8) && *v6 == 112)
        {
          *(void *)a1 = v6 + 1;
          v15.n128_u64[1] = v7;
          uint64_t v8 = *(char **)a1;
          if (*(void *)a1 != *(void *)(a1 + 8) && *v8 == 95)
          {
            *(void *)a1 = v8 + 1;
          }
        }
      }
    }
    return;
  }
  *(void *)a1 = v2 + 3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseBracedExpr(void *a1)
{
  unint64_t v2 = (unsigned char *)*a1;
  if (a1[1] - *a1 < 2uLL || *v2 != 100)
  {
LABEL_9:
  }
  int v3 = (char)v2[1];
  switch(v3)
  {
    case 'X':
      *a1 = v2 + 2;
      if (result)
      {
        unint64_t v7 = result;
        if (result)
        {
          uint64_t v8 = result;
          if (result)
          {
            char v9 = result;
            *((unsigned char *)result + 8) = 82;
            *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
            *__n128 result = off_26C2225B0;
            result[2] = v7;
            result[3] = v8;
            result[4] = v9;
          }
        }
      }
      break;
    case 'x':
      *a1 = v2 + 2;
      if (result)
      {
        uint64_t v10 = result;
        if (result)
        {
          uint64_t v11 = result;
          *((unsigned char *)result + 8) = 81;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
          *__n128 result = off_26C222540;
          result[2] = v10;
          result[3] = v11;
          *((unsigned char *)result + 32) = 1;
        }
      }
      break;
    case 'i':
      *a1 = v2 + 2;
      if (result)
      {
        uint64_t v5 = result;
        if (result)
        {
          uint64_t v6 = result;
          *((unsigned char *)result + 8) = 81;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
          *__n128 result = off_26C222540;
          result[2] = v5;
          result[3] = v6;
          *((unsigned char *)result + 32) = 0;
        }
      }
      return result;
    default:
      goto LABEL_9;
  }
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::InitListExpr,decltype(nullptr),anonymous namespace'::itanium_demangle::NodeArray>(uint64_t a1, __n128 *a2)
{
  *((unsigned char *)v3 + 8) = 70;
  __int16 v4 = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *int v3 = off_26C222620;
  __n128 result = *a2;
  *(_WORD *)((char *)v3 + 9) = v4;
  v3[2] = 0;
  *(__n128 *)(v3 + 3) = result;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parsePointerToMemberConversionExpr(uint64_t a1)
{
  if (result)
  {
    int v3 = result;
    if (result)
    {
      __int16 v4 = result;
      unint64_t v7 = *(char **)a1;
      if (*(void *)a1 == *(void *)(a1 + 8) || *v7 != 69)
      {
        return 0;
      }
      else
      {
        uint64_t v8 = v5;
        uint64_t v9 = v6;
        *(void *)a1 = v7 + 1;
        *((unsigned char *)result + 8) = 69;
        *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x542;
        *__n128 result = off_26C222690;
        result[2] = v3;
        result[3] = v4;
        result[4] = v8;
        result[5] = v9;
      }
    }
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::EnclosingExpr,char const(&)[10],anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, _WORD *a3)
{
  uint64_t v6 = *a2;
  char v7 = *a3;
  *((unsigned char *)result + 8) = 60;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | v7 & 0x3F | 0x540;
  *__n128 result = off_26C221C80;
  result[2] = "noexcept ";
  result[3] = 9;
  result[5] = 0;
  result[6] = 0;
  result[4] = v6;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseRequiresExpr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(_WORD **)a1;
  uint64_t v9 = *(unsigned char **)(a1 + 8);
  if ((unint64_t)&v9[-*(void *)a1] < 2) {
    return 0;
  }
  if (*v8 == 20850)
  {
    char v12 = v8 + 1;
    *(void *)a1 = v12;
    unint64_t v13 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
    while (v12 == v9 || *v12 != 95)
    {
      uint64_t v44 = result;
      if (!result) {
        return result;
      }
      char v12 = *(unsigned char **)a1;
      uint64_t v9 = *(unsigned char **)(a1 + 8);
    }
    *(void *)a1 = v12 + 1;
    uint64_t v43 = v15;
    uint64_t v11 = *(unsigned char **)a1;
    uint64_t v9 = *(unsigned char **)(a1 + 8);
  }
  else
  {
    if (*v8 != 29042) {
      return 0;
    }
    char v42 = 0;
    uint64_t v43 = 0;
    uint64_t v11 = v8 + 1;
    *(void *)a1 = v11;
  }
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v44 = 0;
  if (v11 != v9)
  {
    unint64_t v41 = (v17 - v16) >> 3;
    __int16 v18 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    while (1)
    {
      int v19 = *v11;
      if (v19 == 81) {
        break;
      }
      if (v19 == 84)
      {
        *(void *)a1 = v11 + 1;
        if (!v29) {
          return 0;
        }
        uint64_t v26 = v29;
        *((unsigned char *)v27 + 8) = 85;
        *(_WORD *)((char *)v27 + 9) = *(_WORD *)((unsigned char *)v27 + 9) & 0xF000 | 0x540;
        unint64_t v28 = off_26C222770;
        goto LABEL_24;
      }
      if (v19 != 88) {
        return 0;
      }
      *(void *)a1 = v11 + 1;
      if (!v20) {
        return 0;
      }
      uint64_t v21 = v20;
      char v22 = *(unsigned char **)a1;
      uint64_t v23 = *(unsigned char **)(a1 + 8);
      if (*(unsigned char **)a1 == v23 || *v22 != 78)
      {
        char v24 = 0;
      }
      else
      {
        *(void *)a1 = ++v22;
        char v24 = 1;
      }
      if (v22 == v23 || *v22 != 82)
      {
        uint64_t v30 = 0;
      }
      else
      {
        *(void *)a1 = v22 + 1;
        if (!v30) {
          return 0;
        }
      }
      *((unsigned char *)v27 + 8) = 84;
      *(_WORD *)((char *)v27 + 9) = *(_WORD *)((unsigned char *)v27 + 9) & 0xF000 | 0x540;
      *uint64_t v27 = off_26C222700;
      v27[2] = v21;
      *((unsigned char *)v27 + 24) = v24;
      v27[4] = v30;
LABEL_32:
      uint64_t v44 = v27;
      uint64_t v11 = *(unsigned char **)a1;
      uint64_t v37 = *(unsigned char **)(a1 + 8);
      if (*(unsigned char **)a1 != v37 && *v11 == 69)
      {
        *(void *)a1 = v11 + 1;
        uint64_t v40 = v39;
        *((unsigned char *)result + 8) = 83;
        *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
        *__n128 result = off_26C222850;
        result[2] = v42;
        result[3] = v43;
        result[4] = v38;
        result[5] = v40;
        return result;
      }
      uint64_t v44 = 0;
      if (v11 == v37) {
        return 0;
      }
    }
    *(void *)a1 = v11 + 1;
    if (!v25) {
      return 0;
    }
    uint64_t v26 = v25;
    *((unsigned char *)v27 + 8) = 86;
    *(_WORD *)((char *)v27 + 9) = *(_WORD *)((unsigned char *)v27 + 9) & 0xF000 | 0x540;
    unint64_t v28 = off_26C2227E0;
LABEL_24:
    *uint64_t v27 = v28;
    v27[2] = v26;
    goto LABEL_32;
  }
  return 0;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSubobjectExpr(uint64_t a1)
{
  if (result)
  {
    int v3 = result;
    if (result)
    {
      __int16 v4 = result;
      unint64_t v13 = *(char **)a1;
      BOOL v14 = *(char **)(a1 + 8);
      if (*(char **)a1 != v14)
      {
        uint64_t v15 = v5;
        uint64_t v16 = v6;
        uint64_t v17 = *(void *)(a1 + 16);
        uint64_t v18 = *(void *)(a1 + 24);
        int v19 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
        int v20 = *v13;
        if (v20 == 95)
        {
          uint64_t v30 = *(void *)(a1 + 24);
          uint64_t v31 = *(void *)(a1 + 16);
          uint64_t v32 = v5;
          while (1)
          {
            *(void *)a1 = v13 + 1;
            uint64_t v23 = v22;
            *((unsigned char *)v24 + 8) = 8;
            *(_WORD *)((char *)v24 + 9) = *(_WORD *)((unsigned char *)v24 + 9) & 0xF000 | 0x540;
            *char v24 = off_26C221660;
            v24[2] = v21;
            v24[3] = v23;
            uint64_t v33 = v24;
            unint64_t v13 = *(char **)a1;
            BOOL v14 = *(char **)(a1 + 8);
            if (*(char **)a1 == v14) {
              break;
            }
            int v20 = *v13;
            if (v20 != 95)
            {
              uint64_t v17 = v31;
              uint64_t v15 = v32;
              uint64_t v18 = v30;
              goto LABEL_9;
            }
          }
        }
        else
        {
LABEL_9:
          BOOL v25 = v13 != v14 && v20 == 112;
          char v26 = v25;
          if (v25) {
            *(void *)a1 = ++v13;
          }
          if (v13 != v14 && *v13 == 69)
          {
            *(void *)a1 = v13 + 1;
            uint64_t v29 = v28;
            *((unsigned char *)result + 8) = 59;
            *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
            *__n128 result = off_26C2228C0;
            result[2] = v3;
            result[3] = v4;
            result[4] = v15;
            result[5] = v16;
            result[6] = v27;
            result[7] = v29;
            *((unsigned char *)result + 64) = v26;
            return result;
          }
        }
      }
      return 0;
    }
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ParameterPackExpansion,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 42;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C2224D0;
  result[2] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SizeofParamPackExpr,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 62;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C222930;
  result[2] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::EnclosingExpr,char const(&)[11],anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 60;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C221C80;
  result[2] = "sizeof... ";
  result[3] = 10;
  result[4] = v4;
  result[5] = 0;
  result[6] = 0;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NodeArrayNode,anonymous namespace'::itanium_demangle::NodeArray>(uint64_t a1, __n128 *a2)
{
  *((unsigned char *)v3 + 8) = 0;
  __int16 v4 = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *int v3 = off_26C2229A0;
  __n128 result = *a2;
  *(_WORD *)((char *)v3 + 9) = v4;
  *((__n128 *)v3 + 1) = result;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::InitListExpr,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray>(uint64_t a1, uint64_t *a2, __n128 *a3)
{
  uint64_t v6 = *a2;
  *((unsigned char *)v5 + 8) = 70;
  __int16 v7 = *(_WORD *)((unsigned char *)v5 + 9) & 0xF000 | 0x540;
  *uint64_t v5 = off_26C222620;
  __n128 result = *a3;
  *(_WORD *)((char *)v5 + 9) = v7;
  v5[2] = v6;
  *(__n128 *)(v5 + 3) = result;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[6]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *int v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ThrowExpr,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 72;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C222A10;
  result[2] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnresolvedName(uint64_t a1, int a2)
{
  uint64_t v4 = *(char **)a1;
  uint64_t v5 = *(char **)(a1 + 8);
  unint64_t v6 = (unint64_t)&v5[-*(void *)a1];
  if (v6 >= 3)
  {
    if (*(_WORD *)v4 == 29299 && v4[2] == 78)
    {
      *(void *)a1 = v4 + 3;
      if (v11)
      {
        uint64_t v18 = v11;
        if (*(void *)(a1 + 8) != *(void *)a1 && **(unsigned char **)a1 == 73)
        {
          if (!v19) {
            return 0;
          }
          uint64_t v20 = v19;
          *((unsigned char *)v21 + 8) = 45;
          *(_WORD *)((char *)v21 + 9) = *(_WORD *)((unsigned char *)v21 + 9) & 0xF000 | 0x540;
          *uint64_t v21 = off_26C223180;
          v21[2] = v18;
          v21[3] = v20;
          uint64_t v18 = v21;
        }
        uint64_t v22 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
        while (1)
        {
          uint64_t v23 = *(char **)a1;
          if (*(void *)a1 != *(void *)(a1 + 8) && *v23 == 69) {
            break;
          }
          if (!v8) {
            return v8;
          }
          *((unsigned char *)v24 + 8) = 23;
          *(_WORD *)((char *)v24 + 9) = *(_WORD *)((unsigned char *)v24 + 9) & 0xF000 | 0x540;
          *char v24 = off_26C222A80;
          v24[2] = v18;
          v24[3] = v8;
          uint64_t v18 = v24;
        }
        *(void *)a1 = v23 + 1;
        if (v39)
        {
          uint64_t v40 = v39;
          *((unsigned char *)v8 + 8) = 23;
          *(_WORD *)((char *)v8 + 9) = *(_WORD *)((unsigned char *)v8 + 9) & 0xF000 | 0x540;
          void *v8 = off_26C222A80;
          v8[2] = v18;
          v8[3] = v40;
          return v8;
        }
      }
      return 0;
    }
  }
  else if (v6 != 2)
  {
    goto LABEL_9;
  }
  if (*(_WORD *)v4 == 29299)
  {
    unint64_t v10 = (unint64_t)(v4 + 2);
    *(void *)a1 = v10;
    if (v5 == (char *)v10)
    {
      unint64_t v10 = 0;
    }
    else
    {
      LODWORD(v10) = *(char *)v10;
      if ((v10 & 0x80000000) != 0) {
        goto LABEL_27;
      }
      unint64_t v10 = v10;
    }
    if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v10 + 60) & 0x400) == 0)
    {
LABEL_27:
      uint64_t v45 = v25;
      if (v25)
      {
        uint64_t v32 = v25;
        if (*(void *)(a1 + 8) == *(void *)a1 || **(unsigned char **)a1 != 73)
        {
LABEL_47:
          if (v41)
          {
            char v42 = v41;
            *((unsigned char *)v8 + 8) = 23;
            *(_WORD *)((char *)v8 + 9) = *(_WORD *)((unsigned char *)v8 + 9) & 0xF000 | 0x540;
            void *v8 = off_26C222A80;
            v8[2] = v32;
            v8[3] = v42;
            return v8;
          }
        }
        else
        {
          uint64_t v44 = v33;
          if (v33)
          {
            goto LABEL_47;
          }
        }
      }
      return 0;
    }
    if (!v34) {
      return 0;
    }
    uint64_t v35 = v34;
    uint64_t v32 = 0;
    while (1)
    {
      if (v32)
      {
        *((unsigned char *)v36 + 8) = 23;
        *(_WORD *)((char *)v36 + 9) = *(_WORD *)((unsigned char *)v36 + 9) & 0xF000 | 0x540;
        void *v36 = off_26C222A80;
        v36[2] = v32;
        uint64_t v37 = v36 + 3;
        uint64_t v32 = v36;
      }
      else
      {
        if (!a2)
        {
          uint64_t v32 = v35;
          goto LABEL_39;
        }
        *((unsigned char *)v32 + 8) = 46;
        *(_WORD *)((char *)v32 + 9) = *(_WORD *)((unsigned char *)v32 + 9) & 0xF000 | 0x540;
        *uint64_t v32 = off_26C222C40;
        uint64_t v37 = v32 + 2;
      }
      void *v37 = v35;
LABEL_39:
      uint64_t v38 = *(char **)a1;
      if (*(void *)a1 != *(void *)(a1 + 8) && *v38 == 69)
      {
        *(void *)a1 = v38 + 1;
        goto LABEL_47;
      }
      if (!v35) {
        return 0;
      }
    }
  }
LABEL_9:
  if (v8 && a2)
  {
    *((unsigned char *)v9 + 8) = 46;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((unsigned char *)v9 + 9) & 0xF000 | 0x540;
    *uint64_t v9 = off_26C222C40;
    v9[2] = v8;
    return v9;
  }
  return v8;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::BinaryExpr,anonymous namespace'::itanium_demangle::Node *&,std::string_view &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec &>(uint64_t a1, uint64_t *a2, __n128 *a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v10 = *a2;
  uint64_t v11 = *a4;
  char v12 = *a5;
  *((unsigned char *)v9 + 8) = 54;
  __int16 v13 = *(_WORD *)((unsigned char *)v9 + 9) & 0xF000 | v12 & 0x3F;
  *uint64_t v9 = off_26C2217B0;
  __n128 result = *a3;
  *(_WORD *)((char *)v9 + 9) = v13 | 0x540;
  v9[2] = v10;
  *(__n128 *)(v9 + 3) = result;
  v9[5] = v11;
  return result;
}

void *anonymous namespace'::itanium_demangle::BinaryExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*((_DWORD *)this + 8)) {
    goto LABEL_2;
  }
  uint64_t v15 = *(unsigned char **)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16 != 2)
  {
    if (v16 == 1 && *v15 == 62) {
      goto LABEL_19;
    }
LABEL_2:
    int v4 = 0;
    goto LABEL_3;
  }
  if (memcmp(v15, ">>", 2uLL)) {
    goto LABEL_2;
  }
LABEL_19:
  int v4 = 1;
  *((_DWORD *)this + 8) = 1;
  uint64_t v17 = *(void *)this;
  uint64_t v18 = *((void *)this + 1);
  *((void *)this + 1) = v18 + 1;
  *(unsigned char *)(v17 + v18) = 40;
LABEL_3:
  int v5 = *(unsigned __int16 *)(a1 + 9);
  __int16 v6 = (_WORD)v5 << 10;
  int v7 = (unsigned __int16)((_WORD)v5 << 10);
  int v8 = v5 << 26 >> 26;
  if (v7 == 17408) {
    int v9 = 15;
  }
  else {
    int v9 = v8;
  }
  if (*(void *)(a1 + 32) == 1 && **(unsigned char **)(a1 + 24) == 44)
  {
    size_t v10 = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
    size_t v10 = *(void *)(a1 + 32);
    if (!v10) {
      goto LABEL_11;
    }
  }
  uint64_t v11 = *(const void **)(a1 + 24);
  memcpy((void *)(*(void *)this + *((void *)this + 1)), v11, v10);
  *((void *)this + 1) += v10;
LABEL_11:
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
  if (v4)
  {
    --*((_DWORD *)this + 8);
    uint64_t v13 = *(void *)this;
    uint64_t v14 = *((void *)this + 1);
    *((void *)this + 1) = v14 + 1;
    *(unsigned char *)(v13 + v14) = 41;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::BinaryExpr::~BinaryExpr(_anonymous_namespace_::itanium_demangle::BinaryExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::Node::printAsOperand(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this, int a3, int a4)
{
  if (a4 + a3 <= (*(unsigned __int16 *)(a1 + 9) << 26 >> 26))
  {
    ++*((_DWORD *)this + 8);
    uint64_t v7 = *(void *)this;
    uint64_t v8 = *((void *)this + 1);
    *((void *)this + 1) = v8 + 1;
    *(unsigned char *)(v7 + v8) = 40;
    --*((_DWORD *)this + 8);
    uint64_t v9 = *(void *)this;
    uint64_t v10 = *((void *)this + 1);
    *((void *)this + 1) = v10 + 1;
    *(unsigned char *)(v9 + v10) = 41;
  }
  else
  {
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::PrefixExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = *(void *)(a1 + 24);
  if (v4)
  {
    int v5 = *(const void **)(a1 + 16);
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(unsigned __int16 *)(a1 + 9) << 26 >> 26;
}

void anonymous namespace'::itanium_demangle::PrefixExpr::~PrefixExpr(_anonymous_namespace_::itanium_demangle::PrefixExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::PostfixExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  size_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = *(const void **)(a1 + 24);
    __n128 result = memcpy((void *)(*(void *)a2 + *((void *)a2 + 1)), v6, v5);
    *((void *)a2 + 1) += v5;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::PostfixExpr::~PostfixExpr(_anonymous_namespace_::itanium_demangle::PostfixExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::ArraySubscriptExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  ++*((_DWORD *)a2 + 8);
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 91;
  --*((_DWORD *)a2 + 8);
  uint64_t v7 = *(void *)a2;
  uint64_t v8 = *((void *)a2 + 1);
  *((void *)a2 + 1) = v8 + 1;
  *(unsigned char *)(v7 + v8) = 93;
  return result;
}

void anonymous namespace'::itanium_demangle::ArraySubscriptExpr::~ArraySubscriptExpr(_anonymous_namespace_::itanium_demangle::ArraySubscriptExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::MemberExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  size_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(const void **)(a1 + 24);
    memcpy((void *)(*(void *)a2 + *((void *)a2 + 1)), v5, v4);
    *((void *)a2 + 1) += v4;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = *(unsigned __int16 *)(a1 + 9) << 26 >> 26;
}

void anonymous namespace'::itanium_demangle::MemberExpr::~MemberExpr(_anonymous_namespace_::itanium_demangle::MemberExpr *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::NewExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*(unsigned char *)(a1 + 56))
  {
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 14906;
    *((void *)this + 1) += 2;
  }
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(unsigned char *)(v4 + 2) = 119;
  *(_WORD *)uint64_t v4 = 25966;
  *((void *)this + 1) += 3;
  if (*(unsigned char *)(a1 + 57))
  {
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 23899;
    *((void *)this + 1) += 2;
  }
  if (*(void *)(a1 + 24))
  {
    ++*((_DWORD *)this + 8);
    uint64_t v5 = *(void *)this;
    uint64_t v6 = *((void *)this + 1);
    *((void *)this + 1) = v6 + 1;
    *(unsigned char *)(v5 + v6) = 40;
    --*((_DWORD *)this + 8);
    uint64_t v7 = *(void *)this;
    uint64_t v8 = *((void *)this + 1);
    *((void *)this + 1) = v8 + 1;
    *(unsigned char *)(v7 + v8) = 41;
  }
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
  if (*(void *)(a1 + 48))
  {
    ++*((_DWORD *)this + 8);
    uint64_t v10 = *(void *)this;
    uint64_t v11 = *((void *)this + 1);
    *((void *)this + 1) = v11 + 1;
    *(unsigned char *)(v10 + v11) = 40;
    --*((_DWORD *)this + 8);
    uint64_t v12 = *(void *)this;
    uint64_t v13 = *((void *)this + 1);
    *((void *)this + 1) = v13 + 1;
    *(unsigned char *)(v12 + v13) = 41;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::NewExpr::~NewExpr(_anonymous_namespace_::itanium_demangle::NewExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::NodeArray::printWithComma(void *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (result[1])
  {
    int v3 = result;
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)this + 1);
    char v6 = 1;
    do
    {
      uint64_t v7 = v5;
      if ((v6 & 1) == 0)
      {
        *(_WORD *)(*(void *)this + *((void *)this + 1)) = 8236;
        uint64_t v7 = *((void *)this + 1) + 2;
        *((void *)this + 1) = v7;
      }
      if (v7 == *((void *)this + 1))
      {
        *((void *)this + 1) = v5;
      }
      else
      {
        char v6 = 0;
        uint64_t v5 = *((void *)this + 1);
      }
      ++v4;
    }
    while (v4 != v3[1]);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::DeleteExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*(unsigned char *)(a1 + 24))
  {
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 14906;
    *((void *)this + 1) += 2;
  }
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_WORD *)(v4 + 4) = 25972;
  *(_DWORD *)uint64_t v4 = 1701602660;
  *((void *)this + 1) += 6;
  if (*(unsigned char *)(a1 + 25))
  {
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 23899;
    *((void *)this + 1) += 2;
  }
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  *(unsigned char *)(v5 + v6) = 32;
  uint64_t v7 = *(void *)(a1 + 16);
}

void anonymous namespace'::itanium_demangle::DeleteExpr::~DeleteExpr(_anonymous_namespace_::itanium_demangle::DeleteExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::CallExpr::printLeft(uint64_t a1, uint64_t a2)
{
  ++*(_DWORD *)(a2 + 32);
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 40;
  --*(_DWORD *)(a2 + 32);
  uint64_t v7 = *(void *)a2;
  uint64_t v8 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = v8 + 1;
  *(unsigned char *)(v7 + v8) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::CallExpr::~CallExpr(_anonymous_namespace_::itanium_demangle::CallExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::ConversionExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  ++*((_DWORD *)this + 8);
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 41;
  ++*((_DWORD *)this + 8);
  uint64_t v8 = *(void *)this;
  uint64_t v9 = *((void *)this + 1);
  *((void *)this + 1) = v9 + 1;
  *(unsigned char *)(v8 + v9) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v11 = *(void *)this;
  uint64_t v12 = *((void *)this + 1);
  *((void *)this + 1) = v12 + 1;
  *(unsigned char *)(v11 + v12) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::ConversionExpr::~ConversionExpr(_anonymous_namespace_::itanium_demangle::ConversionExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::ConditionalExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  uint64_t v4 = *(void *)a2 + *((void *)a2 + 1);
  *(unsigned char *)(v4 + 2) = 32;
  *(_WORD *)uint64_t v4 = 16160;
  *((void *)a2 + 1) += 3;
  uint64_t v5 = *(void *)a2 + *((void *)a2 + 1);
  *(unsigned char *)(v5 + 2) = 32;
  *(_WORD *)uint64_t v5 = 14880;
  *((void *)a2 + 1) += 3;
  uint64_t v6 = *(void *)(a1 + 32);
}

void anonymous namespace'::itanium_demangle::ConditionalExpr::~ConditionalExpr(_anonymous_namespace_::itanium_demangle::ConditionalExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::CastExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = *(void *)(a1 + 24);
  if (v4)
  {
    uint64_t v5 = *(const void **)(a1 + 16);
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }
  int v6 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = 0;
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 60;
  (*(void (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 32) + 32))(*(void *)(a1 + 32), this);
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 62;
  *((_DWORD *)this + 8) = v6 + 1;
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(unsigned char *)(v7 + v8) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v10 = *(void *)this;
  uint64_t v11 = *((void *)this + 1);
  *((void *)this + 1) = v11 + 1;
  *(unsigned char *)(v10 + v11) = 41;
  return result;
}

void sub_20D721618(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

void anonymous namespace'::itanium_demangle::CastExpr::~CastExpr(_anonymous_namespace_::itanium_demangle::CastExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::EnclosingExpr::printLeft(void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = a1[3];
  if (v4)
  {
    uint64_t v5 = (const void *)a1[2];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }
  ++*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(unsigned char *)(v9 + v10) = 41;
  size_t v11 = a1[6];
  if (v11)
  {
    uint64_t v12 = (const void *)a1[5];
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v12, v11);
    *((void *)this + 1) += v11;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::EnclosingExpr::~EnclosingExpr(_anonymous_namespace_::itanium_demangle::EnclosingExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseIntegerLiteral(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *(char **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8) || *v8 != 69) {
    return 0;
  }
  uint64_t v9 = v6;
  uint64_t v10 = v7;
  *(void *)a1 = v8 + 1;
  *((unsigned char *)result + 8) = 77;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C221CF0;
  result[2] = a2;
  result[3] = a3;
  result[4] = v9;
  result[5] = v10;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::BoolExpr,int>(uint64_t a1, _DWORD *a2)
{
  BOOL v4 = *a2 != 0;
  *((unsigned char *)result + 8) = 73;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C221D60;
  *((unsigned char *)result + 11) = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::StringLiteral,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 74;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C221F20;
  result[2] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[8]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *int v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnnamedTypeName(unsigned __int8 **a1, uint64_t a2)
{
  if (a2) {
    a1[84] = a1[83];
  }
  int v3 = (char *)*a1;
  if ((unint64_t)(a1[1] - *a1) < 2) {
    return 0;
  }
  switch(*(_WORD *)v3)
  {
    case 0x7455:
      *a1 = (unsigned __int8 *)(v3 + 2);
      uint64_t v9 = (char *)*a1;
      if (*a1 != a1[1] && *v9 == 95)
      {
        uint64_t v10 = v7;
        uint64_t v11 = v8;
        *a1 = (unsigned __int8 *)(v9 + 1);
        *((unsigned char *)v4 + 8) = 51;
        *(_WORD *)((char *)v4 + 9) = *(_WORD *)((unsigned char *)v4 + 9) & 0xF000 | 0x540;
        *size_t v4 = off_26C221F90;
        v4[2] = v10;
        v4[3] = v11;
        return v4;
      }
      return 0;
    case 0x6C55:
      *a1 = (unsigned __int8 *)(v3 + 2);
      uint64_t v12 = a1[98];
      a1[98] = (unsigned __int8 *)((a1[84] - a1[83]) >> 3);
      uint64_t v13 = a1[2];
      uint64_t v14 = a1[3];
      {
        if (!v46.n128_u64[0]) {
          goto LABEL_43;
        }
      }
      unint64_t v28 = (v14 - v13) >> 3;
      v46.n128_u64[1] = v29;
      if (!v29)
      {
        uint64_t v30 = a1[84];
        if (v30 == a1[83]) {
          abort_message("%s:%d: %s", 0, v22, v23, v24, v25, v26, v27, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
        }
        a1[84] = v30 - 8;
      }
      uint64_t v45 = 0;
      uint64_t v31 = (char *)*a1;
      uint64_t v32 = a1[1];
      if (*a1 == v32)
      {
LABEL_28:
        while (1)
        {
          if (!(void)v44) {
            goto LABEL_43;
          }
          if (a1[1] == *a1)
          {
            int v35 = 0;
          }
          else
          {
            int v35 = **a1;
            if (v35 == 69) {
              goto LABEL_34;
            }
          }
          if (v35 == 81) {
            goto LABEL_34;
          }
        }
      }
      if (*v31 == 81)
      {
        *a1 = (unsigned __int8 *)(v31 + 1);
        char v33 = *((unsigned char *)a1 + 778);
        *((unsigned char *)a1 + 778) = 1;
        *((unsigned char *)a1 + 778) = v33;
        uint64_t v45 = v34;
        if (!v34) {
          goto LABEL_43;
        }
        uint64_t v31 = (char *)*a1;
        uint64_t v32 = a1[1];
      }
      if (v32 == (unsigned __int8 *)v31 || *v31 != 118) {
        goto LABEL_28;
      }
      *a1 = (unsigned __int8 *)(v31 + 1);
LABEL_34:
      *((void *)&v44 + 1) = v21;
      uint64_t v43 = 0;
      uint64_t v36 = (char *)*a1;
      uint64_t v37 = a1[1];
      if (*a1 == v37) {
        goto LABEL_43;
      }
      if (*v36 == 81)
      {
        *a1 = (unsigned __int8 *)(v36 + 1);
        char v38 = *((unsigned char *)a1 + 778);
        *((unsigned char *)a1 + 778) = 1;
        *((unsigned char *)a1 + 778) = v38;
        uint64_t v43 = v39;
        if (!v39) {
          goto LABEL_43;
        }
        uint64_t v36 = (char *)*a1;
        uint64_t v37 = a1[1];
      }
      if (v36 != (char *)v37 && *v36 == 69)
      {
        *a1 = (unsigned __int8 *)(v36 + 1);
        *((void *)&v42 + 1) = v21;
        uint64_t v40 = (char *)*a1;
        if (*a1 != a1[1] && *v40 == 95)
        {
          *a1 = (unsigned __int8 *)(v40 + 1);
          size_t v4 = v41;
LABEL_44:
          a1[98] = v12;
          return v4;
        }
      }
LABEL_43:
      size_t v4 = 0;
      goto LABEL_44;
    case 0x6255:
      *a1 = (unsigned __int8 *)(v3 + 2);
      uint64_t v6 = (char *)*a1;
      if (*a1 != a1[1] && *v6 == 95)
      {
        *a1 = (unsigned __int8 *)(v6 + 1);
        *((unsigned char *)v4 + 8) = 8;
        *(_WORD *)((char *)v4 + 9) = *(_WORD *)((unsigned char *)v4 + 9) & 0xF000 | 0x540;
        *size_t v4 = off_26C221660;
        v4[2] = "'block-literal'";
        v4[3] = 15;
        return v4;
      }
      break;
  }
  return 0;
}

void sub_20D721D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, ...)
{
  va_start(va, a19);
  *(void *)(v19 + 784) = v20;
  _Unwind_Resume(a1);
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::LambdaExpr,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 75;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C222310;
  result[2] = v4;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::EnumLiteral,anonymous namespace'::itanium_demangle::Node *&,std::string_view &>(uint64_t a1, uint64_t *a2, __n128 *a3)
{
  uint64_t v6 = *a2;
  *((unsigned char *)v5 + 8) = 76;
  __int16 v7 = *(_WORD *)((unsigned char *)v5 + 9) & 0xF000 | 0x540;
  *uint64_t v5 = off_26C222380;
  __n128 result = *a3;
  *(_WORD *)((char *)v5 + 9) = v7;
  v5[2] = v6;
  *(__n128 *)(v5 + 3) = result;
  return result;
}

void *anonymous namespace'::itanium_demangle::IntegerLiteral::printLeft(void *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v3 = result;
  if (result[3] >= 4uLL)
  {
    ++*((_DWORD *)this + 8);
    uint64_t v4 = *(void *)this;
    uint64_t v5 = *((void *)this + 1);
    *((void *)this + 1) = v5 + 1;
    *(unsigned char *)(v4 + v5) = 40;
    size_t v6 = v3[3];
    if (v6)
    {
      __int16 v7 = (const void *)v3[2];
      memcpy((void *)(*(void *)this + *((void *)this + 1)), v7, v6);
      *((void *)this + 1) += v6;
    }
    --*((_DWORD *)this + 8);
    uint64_t v8 = *(void *)this;
    uint64_t v9 = *((void *)this + 1);
    *((void *)this + 1) = v9 + 1;
    *(unsigned char *)(v8 + v9) = 41;
  }
  uint64_t v10 = (unsigned char *)v3[4];
  if (*v10 == 110)
  {
    uint64_t v11 = *(void *)this;
    uint64_t v13 = (void *)((char *)this + 8);
    uint64_t v12 = *((void *)this + 1);
    *((void *)this + 1) = v12 + 1;
    *(unsigned char *)(v11 + v12) = 45;
    uint64_t v14 = v3[5];
    size_t v15 = v14 - 1;
    if (v14 == 1) {
      goto LABEL_11;
    }
    uint64_t v10 = (unsigned char *)(v3[4] + 1);
    uint64_t v16 = *(void *)this;
    uint64_t v17 = *((void *)this + 1);
  }
  else
  {
    size_t v15 = v3[5];
    if (!v15) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)this;
    uint64_t v13 = (void *)((char *)this + 8);
    uint64_t v17 = *((void *)this + 1);
  }
  __n128 result = memcpy((void *)(v16 + v17), v10, v15);
  *v13 += v15;
LABEL_11:
  size_t v18 = v3[3];
  if (v18 - 4 >= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v19 = (const void *)v3[2];
    __n128 result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v19, v18);
    *((void *)this + 1) += v18;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::IntegerLiteral::~IntegerLiteral(_anonymous_namespace_::itanium_demangle::IntegerLiteral *this)
{
}

void *anonymous namespace'::itanium_demangle::BoolExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*(unsigned char *)(a1 + 11)) {
    size_t v3 = 4;
  }
  else {
    size_t v3 = 5;
  }
  if (*(unsigned char *)(a1 + 11)) {
    uint64_t v4 = "true";
  }
  else {
    uint64_t v4 = "false";
  }
  __n128 result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v4, v3);
  *((void *)this + 1) += v3;
  return result;
}

void anonymous namespace'::itanium_demangle::BoolExpr::~BoolExpr(_anonymous_namespace_::itanium_demangle::BoolExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::FloatLiteralImpl<float>::printLeft(void *result, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*((void *)result + 3) >= 8uLL)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)result + 2);
    uint64_t v5 = v16;
    uint64_t v6 = MEMORY[0x263EF8318];
    do
    {
      uint64_t v7 = *(unsigned __int8 *)(v4 + v3);
      if ((*(char *)(v4 + v3) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v7 + 60) & 0x400) != 0) {
        char v8 = -48;
      }
      else {
        char v8 = -87;
      }
      uint64_t v9 = *(unsigned __int8 *)(v4 + v3 + 1);
      if ((*(char *)(v4 + v3 + 1) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v9 + 60) & 0x400) != 0) {
        char v10 = -48;
      }
      else {
        char v10 = -87;
      }
      *++uint64_t v5 = v9 + v10 + 16 * (v7 + v8);
      v3 += 2;
    }
    while (v3 != 8);
    if (v5 > &v16[1])
    {
      uint64_t v11 = &v16[2];
      do
      {
        char v12 = *(v11 - 1);
        *(v11 - 1) = *v5;
        *v5-- = v12;
      }
      while (v11++ < v5);
    }
    *(void *)__str = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    __n128 result = (void *)snprintf(__str, 0x18uLL, "%af", *(float *)&v16[1]);
    if (result)
    {
      int v14 = (int)result;
      size_t v15 = (int)result;
      __n128 result = memcpy((void *)(*a2 + a2[1]), __str, v15);
      a2[1] += v14;
    }
  }
  return result;
}

void anonymous namespace'::itanium_demangle::FloatLiteralImpl<float>::~FloatLiteralImpl()
{
}

void *anonymous namespace'::itanium_demangle::FloatLiteralImpl<double>::printLeft(void *result, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*((void *)result + 3) >= 0x10uLL)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)result + 2);
    uint64_t v5 = (char *)&v16 + 7;
    uint64_t v6 = MEMORY[0x263EF8318];
    do
    {
      uint64_t v7 = *(unsigned __int8 *)(v4 + v3);
      if ((*(char *)(v4 + v3) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v7 + 60) & 0x400) != 0) {
        char v8 = -48;
      }
      else {
        char v8 = -87;
      }
      uint64_t v9 = *(unsigned __int8 *)(v4 + v3 + 1);
      if ((*(char *)(v4 + v3 + 1) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v9 + 60) & 0x400) != 0) {
        char v10 = -48;
      }
      else {
        char v10 = -87;
      }
      *++uint64_t v5 = v9 + v10 + 16 * (v7 + v8);
      v3 += 2;
    }
    while (v3 != 16);
    if (v5 > (char *)&v17)
    {
      uint64_t v11 = (char *)&v17 + 1;
      do
      {
        char v12 = *(v11 - 1);
        *(v11 - 1) = *v5;
        *v5-- = v12;
      }
      while (v11++ < v5);
    }
    *(_OWORD *)__str = 0u;
    long long v19 = 0u;
    __n128 result = (void *)snprintf(__str, 0x20uLL, "%a", v17);
    if (result)
    {
      int v14 = (int)result;
      size_t v15 = (int)result;
      __n128 result = memcpy((void *)(*a2 + a2[1]), __str, v15);
      a2[1] += v14;
    }
  }
  return result;
}

void anonymous namespace'::itanium_demangle::FloatLiteralImpl<double>::~FloatLiteralImpl()
{
}

void *anonymous namespace'::itanium_demangle::FloatLiteralImpl<long double>::printLeft(void *result, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*((void *)result + 3) >= 0x20uLL)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)result + 2);
    uint64_t v5 = (char *)&v16 + 7;
    uint64_t v6 = MEMORY[0x263EF8318];
    do
    {
      uint64_t v7 = *(unsigned __int8 *)(v4 + v3);
      if ((*(char *)(v4 + v3) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v7 + 60) & 0x400) != 0) {
        char v8 = -48;
      }
      else {
        char v8 = -87;
      }
      uint64_t v9 = *(unsigned __int8 *)(v4 + v3 + 1);
      if ((*(char *)(v4 + v3 + 1) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v9 + 60) & 0x400) != 0) {
        char v10 = -48;
      }
      else {
        char v10 = -87;
      }
      *++uint64_t v5 = v9 + v10 + 16 * (v7 + v8);
      v3 += 2;
    }
    while (v3 != 32);
    if (v5 > (char *)&v17)
    {
      uint64_t v11 = (char *)&v17 + 1;
      do
      {
        char v12 = *(v11 - 1);
        *(v11 - 1) = *v5;
        *v5-- = v12;
      }
      while (v11++ < v5);
    }
    *(_OWORD *)__str = 0u;
    memset(v19, 0, sizeof(v19));
    __n128 result = (void *)snprintf(__str, 0x2AuLL, "%LaL", v17);
    if (result)
    {
      int v14 = (int)result;
      size_t v15 = (int)result;
      __n128 result = memcpy((void *)(*a2 + a2[1]), __str, v15);
      a2[1] += v14;
    }
  }
  return result;
}

void anonymous namespace'::itanium_demangle::FloatLiteralImpl<long double>::~FloatLiteralImpl()
{
}

void *anonymous namespace'::itanium_demangle::StringLiteral::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 15394;
  *((void *)this + 1) += 2;
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 8766;
  *((void *)this + 1) += 2;
  return result;
}

void anonymous namespace'::itanium_demangle::StringLiteral::~StringLiteral(_anonymous_namespace_::itanium_demangle::StringLiteral *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::ScopedTemplateParamList::ScopedTemplateParamList(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t)(*(void *)(a2 + 672) - *(void *)(a2 + 664)) >> 3;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 16) = a1 + 40;
  *(void *)(a1 + 24) = a1 + 40;
  *(void *)(a1 + 32) = a1 + 104;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  uint64_t v5 = a1 + 16;
  return a1;
}

void sub_20D7226D8(_Unwind_Exception *exception_object)
{
  if (*v2 != v1) {
    free(*v2);
  }
  _Unwind_Resume(exception_object);
}

BOOL anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::isTemplateParamDecl(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  unint64_t v2 = *(void *)(a1 + 8) - *(void *)a1;
  if (!v2 || *v1 != 84) {
    return 0;
  }
  if (v2 < 2) {
    int v3 = 0;
  }
  else {
    int v3 = (char)v1[1];
  }
  uint64_t v5 = memchr("yptnk", v3, 5uLL);
  if (v5) {
    BOOL v6 = v5 - "yptnk" == -1;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseTemplateParamDecl(uint64_t a1, const void **a2)
{
  unint64_t v2 = *(_WORD **)a1;
  if (*(void *)(a1 + 8) - *(void *)a1 < 2uLL) {
    return 0;
  }
  if (*v2 == 31060)
  {
    *(void *)a1 = v2 + 1;
    int v6 = *(_DWORD *)(a1 + 792);
    *(_DWORD *)(a1 + 792) = v6 + 1;
    uint64_t v7 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    *((unsigned char *)v8 + 8) = 33;
    *(_WORD *)((char *)v8 + 9) = *(_WORD *)((unsigned char *)v8 + 9) & 0xF000 | 0x540;
    void *v8 = off_26C222000;
    *((_DWORD *)v8 + 3) = 0;
    *((_DWORD *)v8 + 4) = v6;
    v37[0] = (uint64_t)v8;
    if (a2) {
    *((unsigned char *)v3 + 8) = 35;
    }
    *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x500;
    *int v3 = off_26C222070;
    v3[2] = v8;
  }
  else if (*v2 == 27476)
  {
    *(void *)a1 = v2 + 1;
    if (!v9) {
      return 0;
    }
    uint64_t v10 = v9;
    int v11 = *(_DWORD *)(a1 + 792);
    *(_DWORD *)(a1 + 792) = v11 + 1;
    char v12 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    *((unsigned char *)v13 + 8) = 33;
    *(_WORD *)((char *)v13 + 9) = *(_WORD *)((unsigned char *)v13 + 9) & 0xF000 | 0x540;
    *uint64_t v13 = off_26C222000;
    *((_DWORD *)v13 + 3) = 0;
    *((_DWORD *)v13 + 4) = v11;
    v37[0] = (uint64_t)v13;
    if (a2) {
    *((unsigned char *)v3 + 8) = 36;
    }
    *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x500;
    *int v3 = off_26C2220E0;
    v3[2] = v10;
    v3[3] = v13;
  }
  else
  {
    if (*v2 == 28244)
    {
      *(void *)a1 = v2 + 1;
      int v14 = *(_DWORD *)(a1 + 796);
      *(_DWORD *)(a1 + 796) = v14 + 1;
      *((unsigned char *)v15 + 8) = 33;
      *(_WORD *)((char *)v15 + 9) = *(_WORD *)((unsigned char *)v15 + 9) & 0xF000 | 0x540;
      *size_t v15 = off_26C222000;
      *((_DWORD *)v15 + 3) = 1;
      *((_DWORD *)v15 + 4) = v14;
      v37[0] = (uint64_t)v15;
      if (a2) {
      if (v16)
      }
      {
        uint64_t v17 = v16;
        *((unsigned char *)v3 + 8) = 37;
        *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x500;
        *int v3 = off_26C222150;
        v3[2] = v15;
        v3[3] = v17;
        return v3;
      }
      return 0;
    }
    if (*v2 != 29780)
    {
      if (*v2 == 28756)
      {
        *(void *)a1 = v2 + 1;
        if (v37[0]) {
      }
        }
      return 0;
    }
    *(void *)a1 = v2 + 1;
    int v18 = *(_DWORD *)(a1 + 800);
    *(_DWORD *)(a1 + 800) = v18 + 1;
    *((unsigned char *)v19 + 8) = 33;
    *(_WORD *)((char *)v19 + 9) = *(_WORD *)((unsigned char *)v19 + 9) & 0xF000 | 0x540;
    *long long v19 = off_26C222000;
    *((_DWORD *)v19 + 3) = 2;
    *((_DWORD *)v19 + 4) = v18;
    v37[0] = (uint64_t)v19;
    if (a2) {
    unint64_t v20 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
    }
    uint64_t v27 = *(unsigned char **)a1;
    unint64_t v28 = *(unsigned char **)(a1 + 8);
    do
    {
      if (v27 != v28 && *v27 == 69)
      {
        uint64_t v31 = 0;
        goto LABEL_34;
      }
      if (!v36) {
        goto LABEL_32;
      }
      uint64_t v27 = *(unsigned char **)a1;
      unint64_t v28 = *(unsigned char **)(a1 + 8);
    }
    while (*(unsigned char **)a1 == v28 || *v27 != 81);
    *(void *)a1 = v27 + 1;
    char v30 = *(unsigned char *)(a1 + 778);
    *(unsigned char *)(a1 + 778) = 1;
    *(unsigned char *)(a1 + 778) = v30;
    if (!v31 || (uint64_t v27 = *(unsigned char **)a1, *(void *)a1 == *(void *)(a1 + 8)) || *v27 != 69)
    {
LABEL_32:
      int v3 = 0;
      goto LABEL_35;
    }
LABEL_34:
    *(void *)a1 = v27 + 1;
    uint64_t v34 = v33;
    *((unsigned char *)v3 + 8) = 38;
    *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x500;
    *int v3 = off_26C2221C0;
    v3[2] = v19;
    v3[3] = v32;
    v3[4] = v34;
    v3[5] = v31;
LABEL_35:
  }
  return v3;
}

void sub_20D722C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  *(unsigned char *)(v9 + 778) = v10;
  _Unwind_Resume(a1);
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ClosureTypeName,anonymous namespace'::itanium_demangle::NodeArray &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray &,anonymous namespace'::itanium_demangle::Node *&,std::string_view &>(uint64_t a1, __n128 *a2, uint64_t *a3, long long *a4, uint64_t *a5, long long *a6)
{
  uint64_t v12 = *a3;
  uint64_t v13 = *a5;
  *((unsigned char *)v11 + 8) = 52;
  __int16 v14 = *(_WORD *)((unsigned char *)v11 + 9) & 0xF000 | 0x540;
  *int v11 = off_26C2222A0;
  __n128 result = *a2;
  long long v16 = *a4;
  long long v17 = *a6;
  *(_WORD *)((char *)v11 + 9) = v14;
  *((__n128 *)v11 + 1) = result;
  v11[4] = v12;
  *(_OWORD *)(v11 + 5) = v16;
  v11[7] = v13;
  *((_OWORD *)v11 + 4) = v17;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::ScopedTemplateParamList::~ScopedTemplateParamList(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = a1[1];
  uint64_t v9 = *(void *)(*a1 + 664);
  if (v8 > (*(void *)(*a1 + 672) - v9) >> 3) {
    abort_message("%s:%d: %s", a2, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
  }
  *(void *)(*a1 + 672) = v9 + 8 * v8;
  int v11 = (void *)a1[2];
  if (v11 != a1 + 5) {
    free(v11);
  }
  return a1;
}

void *anonymous namespace'::itanium_demangle::UnnamedTypeName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(void *)(*(void *)this + *((void *)this + 1)) = 0x64656D616E6E7527;
  *((void *)this + 1) += 8;
  size_t v4 = *(void *)(a1 + 24);
  if (v4)
  {
    uint64_t v5 = *(const void **)(a1 + 16);
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 39;
  return result;
}

void anonymous namespace'::itanium_demangle::UnnamedTypeName::~UnnamedTypeName(_anonymous_namespace_::itanium_demangle::UnnamedTypeName *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::TemplateParamPackDecl,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 39;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x500;
  *__n128 result = off_26C222230;
  result[2] = v4;
  return result;
}

const void **anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,8ul>::push_back(const void **result, uint64_t *size)
{
  int v3 = result;
  uint64_t v4 = (char *)result[1];
  if (v4 == result[2])
  {
    uint64_t v5 = (void *)*result;
    uint64_t v6 = v4 - (unsigned char *)*v3;
    if (*v3 == v3 + 3)
    {
      __n128 result = (const void **)malloc_type_malloc(2 * v6, 0x2004093837F09uLL);
      if (!result) {
        goto LABEL_11;
      }
      uint64_t v7 = result;
      unint64_t v8 = v3[1];
      if (v8 != *v3) {
        __n128 result = (const void **)memmove(result, *v3, v8 - (unsigned char *)*v3);
      }
      *int v3 = v7;
    }
    else
    {
      __n128 result = (const void **)malloc_type_realloc(v5, 2 * v6, 0x2004093837F09uLL);
      uint64_t v7 = result;
      *int v3 = result;
      if (!result) {
LABEL_11:
      }
        abort();
    }
    uint64_t v4 = (char *)&v7[v6 >> 3];
    v3[1] = v4;
    v3[2] = &v7[v6 >> 2];
  }
  uint64_t v9 = *size;
  v3[1] = v4 + 8;
  *(void *)uint64_t v4 = v9;
  return result;
}

_DWORD *anonymous namespace'::itanium_demangle::SyntheticTemplateParamName::printLeft(_DWORD *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v3 = result;
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v4 = result[3];
  if (v4 == 2)
  {
    uint64_t v5 = 3;
    uint64_t v7 = (void *)((char *)this + 8);
    uint64_t v10 = *(void *)this + *((void *)this + 1);
    *(unsigned char *)(v10 + 2) = 84;
    *(_WORD *)uint64_t v10 = 21540;
  }
  else
  {
    if (v4 == 1)
    {
      uint64_t v5 = 2;
      uint64_t v6 = *(void *)this;
      uint64_t v7 = (void *)((char *)this + 8);
      uint64_t v8 = *((void *)this + 1);
      __int16 v9 = 20004;
    }
    else
    {
      if (v4) {
        goto LABEL_9;
      }
      uint64_t v5 = 2;
      uint64_t v6 = *(void *)this;
      uint64_t v7 = (void *)((char *)this + 8);
      uint64_t v8 = *((void *)this + 1);
      __int16 v9 = 21540;
    }
    *(_WORD *)(v6 + v8) = v9;
  }
  *v7 += v5;
LABEL_9:
  int v11 = v3[4];
  if (v11)
  {
    uint64_t v12 = 0;
    unint64_t v13 = (v11 - 1);
    do
    {
      v16[v12-- + 20] = (v13 % 0xA) | 0x30;
      BOOL v14 = v13 >= 9;
      BOOL v15 = v13 == 9;
      v13 /= 0xAuLL;
    }
    while (!v15 && v14);
    if (v12)
    {
      __n128 result = memcpy((void *)(*(void *)this + *((void *)this + 1)), &v16[v12 + 21], -v12);
      *((void *)this + 1) -= v12;
    }
  }
  return result;
}

void anonymous namespace'::itanium_demangle::SyntheticTemplateParamName::~SyntheticTemplateParamName(_anonymous_namespace_::itanium_demangle::SyntheticTemplateParamName *this)
{
}

void *anonymous namespace'::itanium_demangle::TypeTemplateParamDecl::printLeft(int a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)"typename ";
  *(unsigned char *)(v4 + 8) = 32;
  *((void *)this + 1) += 9;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::TypeTemplateParamDecl::printRight(uint64_t a1, uint64_t a2)
{
}

void anonymous namespace'::itanium_demangle::TypeTemplateParamDecl::~TypeTemplateParamDecl(_anonymous_namespace_::itanium_demangle::TypeTemplateParamDecl *this)
{
}

void *anonymous namespace'::itanium_demangle::ConstrainedTypeTemplateParamDecl::printLeft(uint64_t a1, void *a2)
{
  *(unsigned char *)(*a2 + a2[1]++) = 32;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ConstrainedTypeTemplateParamDecl::printRight(uint64_t a1, uint64_t a2)
{
}

void anonymous namespace'::itanium_demangle::ConstrainedTypeTemplateParamDecl::~ConstrainedTypeTemplateParamDecl(_anonymous_namespace_::itanium_demangle::ConstrainedTypeTemplateParamDecl *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::NonTypeTemplateParamDecl::printLeft(uint64_t a1, void *a2)
{
  (*(void (**)(void))(**(void **)(a1 + 24) + 32))(*(void *)(a1 + 24));
  uint64_t result = *(void *)(a1 + 24);
  unsigned int v5 = *(unsigned __int8 *)(result + 9);
  if ((v5 & 0xC0) != 0x80)
  {
    if (v5 < 0x40) {
      return result;
    }
    goto LABEL_5;
  }
  uint64_t result = (**(uint64_t (***)(uint64_t, void *))result)(result, a2);
  if ((result & 1) == 0)
  {
LABEL_5:
    *(unsigned char *)(*a2 + a2[1]++) = 32;
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::NonTypeTemplateParamDecl::printRight(uint64_t a1, uint64_t a2)
{
  int v3 = *(uint64_t (**)(void))(**(void **)(a1 + 24) + 40);

  return v3();
}

void anonymous namespace'::itanium_demangle::NonTypeTemplateParamDecl::~NonTypeTemplateParamDecl(_anonymous_namespace_::itanium_demangle::NonTypeTemplateParamDecl *this)
{
}

void *anonymous namespace'::itanium_demangle::TemplateTemplateParamDecl::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = 0;
  uint64_t v5 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v5 = *(void *)"template<";
  *(unsigned char *)(v5 + 8) = 60;
  *((void *)this + 1) += 9;
  uint64_t v7 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v7 = *(void *)"> typename ";
  *(_DWORD *)(v7 + 7) = 543518049;
  *((void *)this + 1) += 11;
  *((_DWORD *)this + 8) = v4;
  return result;
}

void sub_20D723458(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::TemplateTemplateParamDecl::printRight(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = *a2 + a2[1];
    *(void *)uint64_t v5 = *(void *)" requires ";
    *(_WORD *)(v5 + 8) = 8307;
    a2[1] += 10;
    uint64_t v6 = *(void *)(a1 + 40);
  }
  return result;
}

void anonymous namespace'::itanium_demangle::TemplateTemplateParamDecl::~TemplateTemplateParamDecl(_anonymous_namespace_::itanium_demangle::TemplateTemplateParamDecl *this)
{
}

void *anonymous namespace'::itanium_demangle::TemplateParamPackDecl::printLeft(uint64_t a1, void *a2)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16));
  uint64_t v4 = *a2 + a2[1];
  *(unsigned char *)(v4 + 2) = 46;
  *(_WORD *)uint64_t v4 = 11822;
  a2[1] += 3;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::TemplateParamPackDecl::printRight(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40))();
}

void anonymous namespace'::itanium_demangle::TemplateParamPackDecl::~TemplateParamPackDecl(_anonymous_namespace_::itanium_demangle::TemplateParamPackDecl *this)
{
}

void *anonymous namespace'::itanium_demangle::ClosureTypeName::printLeft(void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = (_DWORD *)(*(void *)this + *((void *)this + 1));
  *(_DWORD *)((char *)v4 + 3) = 1633968749;
  *uint64_t v4 = 1835101223;
  *((void *)this + 1) += 7;
  size_t v5 = a1[9];
  if (v5)
  {
    uint64_t v6 = (const void *)a1[8];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v6, v5);
    *((void *)this + 1) += v5;
  }
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 39;
}

void anonymous namespace'::itanium_demangle::ClosureTypeName::~ClosureTypeName(_anonymous_namespace_::itanium_demangle::ClosureTypeName *this)
{
}

void *anonymous namespace'::itanium_demangle::ClosureTypeName::printDeclarator(void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (a1[3])
  {
    int v4 = *((_DWORD *)this + 8);
    *((_DWORD *)this + 8) = 0;
    *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 60;
    *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 62;
    *((_DWORD *)this + 8) = v4;
  }
  if (a1[4])
  {
    uint64_t v5 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v5 = *(void *)" requires ";
    *(_WORD *)(v5 + 8) = 8307;
    *((void *)this + 1) += 10;
    *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
  }
  ++*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(unsigned char *)(v9 + v10) = 41;
  if (a1[7])
  {
    uint64_t v11 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v11 = *(void *)" requires ";
    *(_WORD *)(v11 + 8) = 8307;
    *((void *)this + 1) += 10;
    uint64_t v12 = a1[7];
  }
  return result;
}

void sub_20D723878(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

void *anonymous namespace'::itanium_demangle::LambdaExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 23899;
  *((void *)this + 1) += 2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v4 + 8) == 52) {
  uint64_t v6 = *(void *)this + *((void *)this + 1);
  }
  *(unsigned char *)(v6 + 4) = 125;
  *(_DWORD *)uint64_t v6 = 774778491;
  *((void *)this + 1) += 5;
  return result;
}

void anonymous namespace'::itanium_demangle::LambdaExpr::~LambdaExpr(_anonymous_namespace_::itanium_demangle::LambdaExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::EnumLiteral::printLeft(uint64_t *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  ++*((_DWORD *)this + 8);
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(unsigned char *)(v7 + v8) = 41;
  uint64_t v9 = (unsigned char *)a1[3];
  if (*v9 == 110)
  {
    uint64_t v10 = *(void *)this;
    uint64_t v11 = *((void *)this + 1);
    *((void *)this + 1) = v11 + 1;
    *(unsigned char *)(v10 + v11) = 45;
    uint64_t v12 = a1[4];
    size_t v13 = v12 - 1;
    if (v12 == 1) {
      return result;
    }
    uint64_t v14 = a1[3] + 1;
    BOOL v15 = (void *)(*(void *)this + *((void *)this + 1));
    long long v16 = (const void *)v14;
  }
  else
  {
    size_t v13 = a1[4];
    if (!v13) {
      return result;
    }
    BOOL v15 = (void *)(*(void *)this + *((void *)this + 1));
    long long v16 = v9;
  }
  uint64_t result = memcpy(v15, v16, v13);
  *((void *)this + 1) += v13;
  return result;
}

void anonymous namespace'::itanium_demangle::EnumLiteral::~EnumLiteral(_anonymous_namespace_::itanium_demangle::EnumLiteral *this)
{
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::FunctionParam,std::string_view &>(uint64_t a1, __n128 *a2)
{
  *((unsigned char *)v3 + 8) = 67;
  __int16 v4 = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *int v3 = off_26C2223F0;
  __n128 result = *a2;
  *(_WORD *)((char *)v3 + 9) = v4;
  *((__n128 *)v3 + 1) = result;
  return result;
}

void *anonymous namespace'::itanium_demangle::FunctionParam::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 28774;
  *((void *)this + 1) += 2;
  size_t v5 = *(void *)(a1 + 24);
  if (v5)
  {
    uint64_t v6 = *(const void **)(a1 + 16);
    __n128 result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v6, v5);
    *((void *)this + 1) += v5;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::FunctionParam::~FunctionParam(_anonymous_namespace_::itanium_demangle::FunctionParam *this)
{
}

void *anonymous namespace'::itanium_demangle::FoldExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  ++*((_DWORD *)this + 8);
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 40;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(a1 + 24);
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    ++*((_DWORD *)this + 8);
    uint64_t v7 = *(void *)this;
    uint64_t v8 = *((void *)this + 1);
    *((void *)this + 1) = v8 + 1;
    *(unsigned char *)(v7 + v8) = 40;
    uint64_t v9 = *(void *)(a1 + 16);
    char v26 = 42;
    __int16 v27 = 1344;
    uint64_t v25 = off_26C2224D0;
    uint64_t v28 = v9;
    --*((_DWORD *)this + 8);
    uint64_t v10 = *(void *)this;
    uint64_t v11 = *((void *)this + 1);
    *((void *)this + 1) = v11 + 1;
    *(unsigned char *)(v10 + v11) = 41;
  }
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
  size_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    size_t v13 = *(const void **)(a1 + 32);
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v13, v12);
    *((void *)this + 1) += v12;
  }
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
LABEL_8:
  uint64_t v14 = *(void *)this + *((void *)this + 1);
  *(unsigned char *)(v14 + 2) = 46;
  *(_WORD *)uint64_t v14 = 11822;
  *((void *)this + 1) += 3;
  if (*(unsigned char *)(a1 + 48) || *(void *)(a1 + 24))
  {
    *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
    size_t v15 = *(void *)(a1 + 40);
    if (v15)
    {
      long long v16 = *(const void **)(a1 + 32);
      memcpy((void *)(*(void *)this + *((void *)this + 1)), v16, v15);
      *((void *)this + 1) += v15;
    }
    *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
    if (*(unsigned char *)(a1 + 48))
    {
      ++*((_DWORD *)this + 8);
      uint64_t v17 = *(void *)this;
      uint64_t v18 = *((void *)this + 1);
      *((void *)this + 1) = v18 + 1;
      *(unsigned char *)(v17 + v18) = 40;
      uint64_t v19 = *(void *)(a1 + 16);
      char v26 = 42;
      __int16 v27 = 1344;
      uint64_t v25 = off_26C2224D0;
      uint64_t v28 = v19;
      --*((_DWORD *)this + 8);
      uint64_t v20 = *(void *)this;
      uint64_t v21 = *((void *)this + 1);
      *((void *)this + 1) = v21 + 1;
      *(unsigned char *)(v20 + v21) = 41;
    }
    else
    {
    }
  }
  --*((_DWORD *)this + 8);
  uint64_t v23 = *(void *)this;
  uint64_t v24 = *((void *)this + 1);
  *((void *)this + 1) = v24 + 1;
  *(unsigned char *)(v23 + v24) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::FoldExpr::~FoldExpr(_anonymous_namespace_::itanium_demangle::FoldExpr *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPackExpansion::printLeft(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 24);
  int v5 = *(_DWORD *)(a2 + 28);
  *(void *)(a2 + 24) = -1;
  uint64_t v6 = *(void *)(a2 + 8);
  unsigned int v8 = *(_DWORD *)(a2 + 28);
  if (v8 == -1)
  {
    uint64_t v10 = *(void *)a2 + *(void *)(a2 + 8);
    *(unsigned char *)(v10 + 2) = 46;
    *(_WORD *)uint64_t v10 = 11822;
    uint64_t v6 = *(void *)(a2 + 8) + 3;
    goto LABEL_8;
  }
  if (!v8)
  {
LABEL_8:
    *(void *)(a2 + 8) = v6;
    goto LABEL_9;
  }
  if (v8 >= 2)
  {
    for (int i = 1; i != v8; ++i)
    {
      *(_WORD *)(*(void *)a2 + *(void *)(a2 + 8)) = 8236;
      *(void *)(a2 + 8) += 2;
      *(_DWORD *)(a2 + 24) = i;
    }
  }
LABEL_9:
  *(_DWORD *)(a2 + 24) = v4;
  *(_DWORD *)(a2 + 28) = v5;
  return result;
}

void sub_20D723FBC(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + 24) = v2;
  *(_DWORD *)(v1 + 28) = v3;
  _Unwind_Resume(a1);
}

void anonymous namespace'::itanium_demangle::ParameterPackExpansion::~ParameterPackExpansion(_anonymous_namespace_::itanium_demangle::ParameterPackExpansion *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::BracedExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  if (v4)
  {
    *(unsigned char *)(v5 + v6) = 91;
    uint64_t v7 = *(void *)this;
    uint64_t v8 = *((void *)this + 1);
    *((void *)this + 1) = v8 + 1;
    *(unsigned char *)(v7 + v8) = 93;
  }
  else
  {
    *(unsigned char *)(v5 + v6) = 46;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  if (*(unsigned __int8 *)(v9 + 8) - 81 >= 2)
  {
    uint64_t v10 = *(void *)this + *((void *)this + 1);
    *(unsigned char *)(v10 + 2) = 32;
    *(_WORD *)uint64_t v10 = 15648;
    *((void *)this + 1) += 3;
    uint64_t v9 = *(void *)(a1 + 24);
  }
}

void anonymous namespace'::itanium_demangle::BracedExpr::~BracedExpr(_anonymous_namespace_::itanium_demangle::BracedExpr *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::BracedRangeExpr::printLeft(uint64_t *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 91;
  uint64_t v6 = *(void *)this + *((void *)this + 1);
  *(unsigned char *)(v6 + 4) = 32;
  *(_DWORD *)uint64_t v6 = 774778400;
  *((void *)this + 1) += 5;
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(unsigned char *)(v7 + v8) = 93;
  uint64_t v9 = a1[4];
  if (*(unsigned __int8 *)(v9 + 8) - 81 >= 2)
  {
    uint64_t v10 = *(void *)this + *((void *)this + 1);
    *(unsigned char *)(v10 + 2) = 32;
    *(_WORD *)uint64_t v10 = 15648;
    *((void *)this + 1) += 3;
    uint64_t v9 = a1[4];
  }
}

void anonymous namespace'::itanium_demangle::BracedRangeExpr::~BracedRangeExpr(_anonymous_namespace_::itanium_demangle::BracedRangeExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::InitListExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4) {
  uint64_t v5 = *(void *)this;
  }
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  *(unsigned char *)(v5 + v6) = 123;
  uint64_t v8 = *(void *)this;
  uint64_t v9 = *((void *)this + 1);
  *((void *)this + 1) = v9 + 1;
  *(unsigned char *)(v8 + v9) = 125;
  return result;
}

void anonymous namespace'::itanium_demangle::InitListExpr::~InitListExpr(_anonymous_namespace_::itanium_demangle::InitListExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::PointerToMemberConversionExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  ++*((_DWORD *)this + 8);
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 41;
  ++*((_DWORD *)this + 8);
  uint64_t v8 = *(void *)this;
  uint64_t v9 = *((void *)this + 1);
  *((void *)this + 1) = v9 + 1;
  *(unsigned char *)(v8 + v9) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v11 = *(void *)this;
  uint64_t v12 = *((void *)this + 1);
  *((void *)this + 1) = v12 + 1;
  *(unsigned char *)(v11 + v12) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::PointerToMemberConversionExpr::~PointerToMemberConversionExpr(_anonymous_namespace_::itanium_demangle::PointerToMemberConversionExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::ExprRequirement::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
  if (*(unsigned char *)(a1 + 24) || *(void *)(a1 + 32))
  {
    ++*((_DWORD *)this + 8);
    uint64_t v4 = *(void *)this;
    uint64_t v5 = *((void *)this + 1);
    *((void *)this + 1) = v5 + 1;
    *(unsigned char *)(v4 + v5) = 123;
  }
  if (*(unsigned char *)(a1 + 24) || *(void *)(a1 + 32))
  {
    --*((_DWORD *)this + 8);
    uint64_t v6 = *(void *)this;
    uint64_t v7 = *((void *)this + 1);
    *((void *)this + 1) = v7 + 1;
    *(unsigned char *)(v6 + v7) = 125;
    if (*(unsigned char *)(a1 + 24))
    {
      uint64_t v8 = *(void *)this + *((void *)this + 1);
      *(void *)uint64_t v8 = *(void *)" noexcept";
      *(unsigned char *)(v8 + 8) = 116;
      *((void *)this + 1) += 9;
    }
  }
  if (*(void *)(a1 + 32))
  {
    *(_DWORD *)(*(void *)this + *((void *)this + 1)) = 540945696;
    *((void *)this + 1) += 4;
  }
  uint64_t v10 = *(void *)this;
  uint64_t v11 = *((void *)this + 1);
  *((void *)this + 1) = v11 + 1;
  *(unsigned char *)(v10 + v11) = 59;
  return result;
}

void anonymous namespace'::itanium_demangle::ExprRequirement::~ExprRequirement(_anonymous_namespace_::itanium_demangle::ExprRequirement *this)
{
}

void *anonymous namespace'::itanium_demangle::TypeRequirement::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)" typename ";
  *(_WORD *)(v4 + 8) = 8293;
  *((void *)this + 1) += 10;
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 59;
  return result;
}

void anonymous namespace'::itanium_demangle::TypeRequirement::~TypeRequirement(_anonymous_namespace_::itanium_demangle::TypeRequirement *this)
{
}

void *anonymous namespace'::itanium_demangle::NestedRequirement::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)" requires ";
  *(_WORD *)(v4 + 8) = 8307;
  *((void *)this + 1) += 10;
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 59;
  return result;
}

void anonymous namespace'::itanium_demangle::NestedRequirement::~NestedRequirement(_anonymous_namespace_::itanium_demangle::NestedRequirement *this)
{
}

void *anonymous namespace'::itanium_demangle::RequiresExpr::printLeft(void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(void *)(*(void *)this + *((void *)this + 1)) = 0x7365726975716572;
  *((void *)this + 1) += 8;
  if (a1[3])
  {
    uint64_t v4 = *(void *)this;
    uint64_t v5 = *((void *)this + 1);
    *((void *)this + 1) = v5 + 1;
    *(unsigned char *)(v4 + v5) = 32;
    ++*((_DWORD *)this + 8);
    uint64_t v6 = *(void *)this;
    uint64_t v7 = *((void *)this + 1);
    *((void *)this + 1) = v7 + 1;
    *(unsigned char *)(v6 + v7) = 40;
    --*((_DWORD *)this + 8);
    uint64_t v8 = *(void *)this;
    uint64_t v9 = *((void *)this + 1);
    *((void *)this + 1) = v9 + 1;
    *(unsigned char *)(v8 + v9) = 41;
  }
  uint64_t v10 = *(void *)this;
  uint64_t v11 = *((void *)this + 1);
  *((void *)this + 1) = v11 + 1;
  *(unsigned char *)(v10 + v11) = 32;
  ++*((_DWORD *)this + 8);
  uint64_t v12 = *(void *)this;
  uint64_t v13 = *((void *)this + 1);
  *((void *)this + 1) = v13 + 1;
  *(unsigned char *)(v12 + v13) = 123;
  uint64_t v14 = a1[5];
  if (v14)
  {
    size_t v15 = (uint64_t *)a1[4];
    uint64_t v16 = 8 * v14;
    do
    {
      uint64_t v17 = *v15++;
      v16 -= 8;
    }
    while (v16);
  }
  uint64_t v18 = *(void *)this;
  uint64_t v19 = *((void *)this + 1);
  *((void *)this + 1) = v19 + 1;
  *(unsigned char *)(v18 + v19) = 32;
  --*((_DWORD *)this + 8);
  uint64_t v21 = *(void *)this;
  uint64_t v22 = *((void *)this + 1);
  *((void *)this + 1) = v22 + 1;
  *(unsigned char *)(v21 + v22) = 125;
  return result;
}

void anonymous namespace'::itanium_demangle::RequiresExpr::~RequiresExpr(_anonymous_namespace_::itanium_demangle::RequiresExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::SubobjectExpr::printLeft(uint64_t *a1, void *a2)
{
  *(_WORD *)(*a2 + a2[1]) = 15406;
  a2[1] += 2;
  uint64_t v4 = *a2 + a2[1];
  *(void *)uint64_t v4 = *(void *)" at offset ";
  *(_DWORD *)(v4 + 7) = 544499059;
  a2[1] += 11;
  size_t v5 = a1[5];
  if (!v5)
  {
    size_t v5 = 1;
    *(unsigned char *)(*a2 + a2[1]) = 48;
LABEL_8:
    a2[1] += v5;
    goto LABEL_9;
  }
  uint64_t v6 = (unsigned char *)a1[4];
  if (*v6 != 110)
  {
    uint64_t v9 = (void *)(*a2 + a2[1]);
    uint64_t v10 = v6;
    goto LABEL_7;
  }
  *(unsigned char *)(*a2 + a2[1]++) = 45;
  uint64_t v7 = a1[5];
  size_t v5 = v7 - 1;
  if (v7 != 1)
  {
    uint64_t v8 = a1[4] + 1;
    uint64_t v9 = (void *)(*a2 + a2[1]);
    uint64_t v10 = (const void *)v8;
LABEL_7:
    memcpy(v9, v10, v5);
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)(*a2 + a2[1]++) = 62;
  return result;
}

void anonymous namespace'::itanium_demangle::SubobjectExpr::~SubobjectExpr(_anonymous_namespace_::itanium_demangle::SubobjectExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::SizeofParamPackExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)"sizeof...";
  *(unsigned char *)(v4 + 8) = 46;
  *((void *)this + 1) += 9;
  ++*((_DWORD *)this + 8);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  *(unsigned char *)(v5 + v6) = 40;
  uint64_t v7 = *(void *)(a1 + 16);
  char v12 = 42;
  __int16 v13 = 1344;
  uint64_t v11 = off_26C2224D0;
  uint64_t v14 = v7;
  --*((_DWORD *)this + 8);
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(unsigned char *)(v9 + v10) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::SizeofParamPackExpr::~SizeofParamPackExpr(_anonymous_namespace_::itanium_demangle::SizeofParamPackExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::NodeArrayNode::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
}

void anonymous namespace'::itanium_demangle::NodeArrayNode::~NodeArrayNode(_anonymous_namespace_::itanium_demangle::NodeArrayNode *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::ThrowExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_WORD *)(v4 + 4) = 8311;
  *(_DWORD *)uint64_t v4 = 1869768820;
  *((void *)this + 1) += 6;
  uint64_t v5 = *(void *)(a1 + 16);
}

void anonymous namespace'::itanium_demangle::ThrowExpr::~ThrowExpr(_anonymous_namespace_::itanium_demangle::ThrowExpr *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnresolvedType(const void **a1)
{
  if (a1[1] != *a1)
  {
    int v2 = *(unsigned __int8 *)*a1;
    if (v2 == 68)
    {
      goto LABEL_9;
    }
    if (v2 == 84)
    {
LABEL_9:
      uint64_t v5 = v3;
      uint64_t v6 = v3;
      if (v3) {
      return v5;
      }
    }
  }
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSimpleId(void *a1)
{
  if (v8 && a1[1] != *a1 && *(unsigned char *)*a1 == 73)
  {
    if (v9)
    {
      uint64_t v10 = v9;
      *((unsigned char *)v11 + 8) = 45;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((unsigned char *)v11 + 9) & 0xF000 | 0x540;
      *uint64_t v11 = off_26C223180;
      v11[2] = v8;
      v11[3] = v10;
      return v11;
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseBaseUnresolvedName(const void **a1)
{
  uint64_t v2 = (unsigned __int8 *)*a1;
  uint64_t v3 = (char *)a1[1];
  if (v3 == *a1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    if ((char)*v2 < 0) {
      goto LABEL_6;
    }
    uint64_t v4 = *v2;
  }
  if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v4 + 60) & 0x400) == 0)
  {
LABEL_6:
    if ((unint64_t)(v3 - (unsigned char *)*a1) < 2) {
      goto LABEL_10;
    }
    if (*(_WORD *)v2 != 28260)
    {
      if (*(_WORD *)v2 == 28271) {
        *a1 = v2 + 2;
      }
LABEL_10:
      if (!v11 || a1[1] == *a1 || *(unsigned char *)*a1 != 73) {
        return v11;
      }
      if (v12)
      {
        uint64_t v13 = v12;
        *((unsigned char *)v14 + 8) = 45;
        *(_WORD *)((char *)v14 + 9) = *(_WORD *)((unsigned char *)v14 + 9) & 0xF000 | 0x540;
        *uint64_t v14 = off_26C223180;
        v14[2] = v11;
        v14[3] = v13;
        return v14;
      }
      return 0;
    }
    unint64_t v16 = (unint64_t)(v2 + 2);
    *a1 = (const void *)v16;
    if (v3 == (char *)v16)
    {
      unint64_t v16 = 0;
    }
    else
    {
      LODWORD(v16) = *(char *)v16;
      if ((v16 & 0x80000000) != 0) {
        goto LABEL_23;
      }
      unint64_t v16 = v16;
    }
    if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v16 + 60) & 0x400) != 0)
    {
LABEL_25:
      uint64_t v18 = v17;
      if (v17)
      {
        *((unsigned char *)v11 + 8) = 50;
        *(_WORD *)((char *)v11 + 9) = *(_WORD *)((unsigned char *)v11 + 9) & 0xF000 | 0x540;
        *uint64_t v11 = off_26C222AF0;
        v11[2] = v18;
        return v11;
      }
      return 0;
    }
LABEL_23:
    goto LABEL_25;
  }
}

uint64_t anonymous namespace'::itanium_demangle::QualifiedName::printLeft(uint64_t a1, void *a2)
{
  *(_WORD *)(*a2 + a2[1]) = 14906;
  a2[1] += 2;
  uint64_t v4 = *(void *)(a1 + 24);
}

uint64_t anonymous namespace'::itanium_demangle::QualifiedName::getBaseName(_anonymous_namespace_::itanium_demangle::QualifiedName *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 3) + 48))();
}

void anonymous namespace'::itanium_demangle::QualifiedName::~QualifiedName(_anonymous_namespace_::itanium_demangle::QualifiedName *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseOperatorName(uint64_t a1, unsigned char *a2)
{
  if (v4)
  {
    unsigned int v5 = v4[2];
    if (v5 == 8)
    {
      char v6 = *(unsigned char *)(a1 + 776);
      *(unsigned char *)(a1 + 776) = 0;
      int v7 = *(unsigned __int8 *)(a1 + 777);
      if (a2) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = v7 == 0;
      }
      char v9 = !v8;
      *(unsigned char *)(a1 + 777) = v9;
      if (v10)
      {
        if (a2) {
          *a2 = 1;
        }
        *((unsigned char *)result + 8) = 4;
        *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
        *uint64_t result = off_26C222B60;
        result[2] = v10;
      }
      else
      {
        uint64_t result = 0;
      }
      *(unsigned char *)(a1 + 777) = v7;
      *(unsigned char *)(a1 + 776) = v6;
      return result;
    }
    if (v5 <= 0xA && (v5 != 4 || (v4[3] & 1) != 0))
    {
      uint64_t v14 = (const char *)*((void *)v4 + 1);
      size_t v15 = strlen(v14);
      *((unsigned char *)result + 8) = 8;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
      *uint64_t result = off_26C221660;
      result[2] = v14;
      result[3] = v15;
      return result;
    }
    return 0;
  }
  uint64_t v12 = *(unsigned __int8 **)a1;
  uint64_t v13 = *(unsigned __int8 **)(a1 + 8);
  if ((unint64_t)&v13[-*(void *)a1] >= 2 && *(_WORD *)v12 == 26988)
  {
    *(void *)a1 = v12 + 2;
    if (result)
    {
      unint64_t v16 = result;
      *((unsigned char *)result + 8) = 20;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
      *uint64_t result = off_26C222BD0;
      result[2] = v16;
    }
  }
  else
  {
    if (v12 == v13) {
      return 0;
    }
    if (*v12 != 118) {
      return 0;
    }
    *(void *)a1 = v12 + 1;
    if (v13 == v12 + 1 || v12[1] - 48 > 9) {
      return 0;
    }
    *(void *)a1 = v12 + 2;
    uint64_t v17 = result;
    if (result) {
  }
    }
  return result;
}

void sub_20D72519C(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 777) = v3;
  *(unsigned char *)(v1 + 776) = v2;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::DtorName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 126;
  uint64_t v4 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 32);

  return v4();
}

void anonymous namespace'::itanium_demangle::DtorName::~DtorName(_anonymous_namespace_::itanium_demangle::DtorName *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ConversionOperatorType,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 4;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C222B60;
  result[2] = v4;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ConversionOperatorType::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)"operator ";
  *(unsigned char *)(v4 + 8) = 32;
  *((void *)this + 1) += 9;
  uint64_t v5 = *(void *)(a1 + 16);
}

void anonymous namespace'::itanium_demangle::ConversionOperatorType::~ConversionOperatorType(_anonymous_namespace_::itanium_demangle::ConversionOperatorType *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::LiteralOperator::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)"operator\"\" ";
  *(_DWORD *)(v4 + 7) = 539107954;
  *((void *)this + 1) += 11;
  uint64_t v5 = *(void *)(a1 + 16);
}

void anonymous namespace'::itanium_demangle::LiteralOperator::~LiteralOperator(_anonymous_namespace_::itanium_demangle::LiteralOperator *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::GlobalQualifiedName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 14906;
  *((void *)this + 1) += 2;
  uint64_t v4 = *(void *)(a1 + 16);
}

uint64_t anonymous namespace'::itanium_demangle::GlobalQualifiedName::getBaseName(_anonymous_namespace_::itanium_demangle::GlobalQualifiedName *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 48))();
}

void anonymous namespace'::itanium_demangle::GlobalQualifiedName::~GlobalQualifiedName(_anonymous_namespace_::itanium_demangle::GlobalQualifiedName *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseAbiTags(void *a1, void *a2)
{
  char v3 = (unsigned char *)*a1;
  if (*a1 != a1[1])
  {
    uint64_t v5 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 101);
    while (*v3 == 66)
    {
      *a1 = v3 + 1;
      if (!v7) {
        return 0;
      }
      BOOL v8 = v6;
      uint64_t v9 = v7;
      __int16 v11 = *(_WORD *)((char *)a2 + 9);
      *((unsigned char *)result + 8) = 9;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | v11 & 0xFC0;
      *uint64_t result = off_26C222D90;
      result[2] = a2;
      result[3] = v8;
      result[4] = v9;
      char v3 = (unsigned char *)*a1;
      a2 = result;
      if (*a1 == a1[1]) {
        return result;
      }
    }
  }
  return a2;
}

void *anonymous namespace'::itanium_demangle::SpecialSubstitution::printLeft(_anonymous_namespace_::itanium_demangle::SpecialSubstitution *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(unsigned char *)(v4 + 4) = 58;
  *(_DWORD *)uint64_t v4 = 979661939;
  *((void *)this + 1) += 5;
  if (v13)
  {
    uint64_t v14 = result;
    size_t v15 = v13;
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v14, v15);
    *((void *)this + 1) += v15;
  }
  return result;
}

const char *anonymous namespace'::itanium_demangle::SpecialSubstitution::getBaseName(_anonymous_namespace_::itanium_demangle::SpecialSubstitution *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *((unsigned int *)this + 3);
  uint64_t v9 = "basic_string";
  uint64_t result = "allocator";
  switch(v8)
  {
    case 1:
      return "basic_string";
    case 2:
      goto LABEL_7;
    case 3:
      uint64_t v9 = "basic_istream";
      goto LABEL_7;
    case 4:
      uint64_t v9 = "basic_ostream";
      goto LABEL_7;
    case 5:
      uint64_t v9 = "basic_iostream";
LABEL_7:
      if (*(_DWORD *)v9 != 1769169250 || *((_WORD *)v9 + 2) != 24419) {
        abort_message("%s:%d: %s", 9, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
      }
      uint64_t result = v9 + 6;
      break;
    default:
      return result;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::SpecialSubstitution::~SpecialSubstitution(_anonymous_namespace_::itanium_demangle::SpecialSubstitution *this)
{
}

void *anonymous namespace'::itanium_demangle::ExpandedSpecialSubstitution::printLeft(_DWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(unsigned char *)(v4 + 4) = 58;
  *(_DWORD *)uint64_t v4 = 979661939;
  *((void *)this + 1) += 5;
  uint64_t result = (void *)(*(uint64_t (**)(_DWORD *))(*(void *)a1 + 48))(a1);
  if (v6)
  {
    uint64_t v7 = result;
    size_t v8 = v6;
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v7, v8);
    *((void *)this + 1) += v8;
  }
  if (a1[3] >= 2u)
  {
    qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "<char, std::char_traits<char>", 29);
    *((void *)this + 1) += 29;
    if (a1[3] == 2)
    {
      qmemcpy((void *)(*(void *)this + *((void *)this + 1)), ", std::allocator<char>", 22);
      *((void *)this + 1) += 22;
    }
    *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 62;
  }
  return result;
}

char *anonymous namespace'::itanium_demangle::ExpandedSpecialSubstitution::getBaseName(_anonymous_namespace_::itanium_demangle::ExpandedSpecialSubstitution *this)
{
  return (&off_2641163F8)[*((int *)this + 3)];
}

void anonymous namespace'::itanium_demangle::ExpandedSpecialSubstitution::~ExpandedSpecialSubstitution(_anonymous_namespace_::itanium_demangle::ExpandedSpecialSubstitution *this)
{
}

unsigned __int8 *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseBareSourceName(uint64_t a1)
{
  unint64_t v4 = 0;
  uint64_t result = 0;
  if ((v2 & 1) == 0)
  {
    uint64_t result = *(unsigned __int8 **)a1;
    if (*(void *)(a1 + 8) - *(void *)a1 >= v4) {
      *(void *)a1 = &result[v4];
    }
    else {
      return 0;
    }
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbiTagAttr::printLeft(uint64_t a1, void *a2)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16));
  uint64_t v4 = *a2 + a2[1];
  *(unsigned char *)(v4 + 4) = 58;
  *(_DWORD *)uint64_t v4 = 1768055131;
  a2[1] += 5;
  size_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = *(const void **)(a1 + 24);
    memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }
  *(unsigned char *)(*a2 + a2[1]++) = 93;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbiTagAttr::getBaseName(_anonymous_namespace_::itanium_demangle::AbiTagAttr *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 48))();
}

void anonymous namespace'::itanium_demangle::AbiTagAttr::~AbiTagAttr(_anonymous_namespace_::itanium_demangle::AbiTagAttr *this)
{
}

void *anonymous namespace'::itanium_demangle::StructuredBindingName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  ++*((_DWORD *)this + 8);
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 91;
  --*((_DWORD *)this + 8);
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(unsigned char *)(v7 + v8) = 93;
  return result;
}

void anonymous namespace'::itanium_demangle::StructuredBindingName::~StructuredBindingName(_anonymous_namespace_::itanium_demangle::StructuredBindingName *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::CtorDtorName,anonymous namespace'::itanium_demangle::Node *&,BOOL,int &>(uint64_t a1, uint64_t *a2, char *a3, int *a4)
{
  uint64_t v8 = *a2;
  char v9 = *a3;
  int v10 = *a4;
  *((unsigned char *)result + 8) = 49;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C222E70;
  result[2] = v8;
  *((unsigned char *)result + 24) = v9;
  *((_DWORD *)result + 7) = v10;
  return result;
}

void *anonymous namespace'::itanium_demangle::CtorDtorName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*(unsigned char *)(a1 + 24))
  {
    *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 126;
  }
  uint64_t result = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 16) + 48))(*(void *)(a1 + 16));
  if (v5)
  {
    uint64_t v6 = result;
    size_t v7 = v5;
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v6, v7);
    *((void *)this + 1) += v7;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::CtorDtorName::~CtorDtorName(_anonymous_namespace_::itanium_demangle::CtorDtorName *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::ModuleEntity::printLeft(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  a2[1] = v5 + 1;
  *(unsigned char *)(v4 + v5) = 64;
  uint64_t v6 = *(void *)(a1 + 16);
}

uint64_t anonymous namespace'::itanium_demangle::ModuleEntity::getBaseName(_anonymous_namespace_::itanium_demangle::ModuleEntity *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 3) + 48))();
}

void anonymous namespace'::itanium_demangle::ModuleEntity::~ModuleEntity(_anonymous_namespace_::itanium_demangle::ModuleEntity *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::MemberLikeFriendName::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2 + a2[1];
  *(void *)uint64_t v4 = *(void *)"::friend ";
  *(unsigned char *)(v4 + 8) = 32;
  a2[1] += 9;
  uint64_t v5 = *(void *)(a1 + 24);
}

uint64_t anonymous namespace'::itanium_demangle::MemberLikeFriendName::getBaseName(_anonymous_namespace_::itanium_demangle::MemberLikeFriendName *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 3) + 48))();
}

void anonymous namespace'::itanium_demangle::MemberLikeFriendName::~MemberLikeFriendName(_anonymous_namespace_::itanium_demangle::MemberLikeFriendName *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::NestedName::printLeft(uint64_t a1, void *a2)
{
  *(_WORD *)(*a2 + a2[1]) = 14906;
  a2[1] += 2;
  uint64_t v4 = *(void *)(a1 + 24);
}

uint64_t anonymous namespace'::itanium_demangle::NestedName::getBaseName(_anonymous_namespace_::itanium_demangle::NestedName *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 3) + 48))();
}

void anonymous namespace'::itanium_demangle::NestedName::~NestedName(_anonymous_namespace_::itanium_demangle::NestedName *this)
{
}

const char *anonymous namespace'::itanium_demangle::parse_discriminator(const char *this, const char *a2, const char *a3)
{
  if (this != a2)
  {
    uint64_t v3 = *(unsigned __int8 *)this;
    if (v3 == 95)
    {
      if (this + 1 != a2 && (this[1] & 0x80000000) == 0)
      {
        if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)this + 1) + 60) & 0x400) != 0)
        {
          this += 2;
        }
        else
        {
          uint64_t v4 = this + 2;
          if (this[1] == 95 && v4 != a2)
          {
            while (1)
            {
              uint64_t v6 = *(unsigned __int8 *)v4;
              if (*v4 < 0 || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v6 + 60) & 0x400) == 0) {
                break;
              }
              if (++v4 == a2) {
                return this;
              }
            }
            if (v6 == 95) {
              return v4 + 1;
            }
          }
        }
      }
    }
    else if ((v3 & 0x80) == 0 && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v3 + 60) & 0x400) != 0)
    {
      size_t v7 = this + 1;
      while (v7 != a2)
      {
        int v8 = *v7;
        if ((v8 & 0x80000000) == 0)
        {
          ++v7;
          if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v8 + 60) & 0x400) != 0) {
            continue;
          }
        }
        return this;
      }
      return a2;
    }
  }
  return this;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[15]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::LocalName,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  *((unsigned char *)result + 8) = 26;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C223030;
  result[2] = v6;
  result[3] = v7;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::LocalName::printLeft(uint64_t a1, void *a2)
{
  *(_WORD *)(*a2 + a2[1]) = 14906;
  a2[1] += 2;
  uint64_t v4 = *(void *)(a1 + 24);
}

void anonymous namespace'::itanium_demangle::LocalName::~LocalName(_anonymous_namespace_::itanium_demangle::LocalName *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::hasRHSComponentSlow(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0;
    unint64_t v3 = *(void *)(a1 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(a1 + 24);
  }
  if (v3 <= v2) {
    return 0;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 16) + 8 * v2);
  unsigned int v5 = *(unsigned __int8 *)(v4 + 9);
  if ((v5 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v4)(v4);
  }
  else {
    return v5 < 0x40;
  }
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::hasArraySlow(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0;
    unint64_t v3 = *(void *)(a1 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(a1 + 24);
  }
  if (v3 <= v2) {
    return 0;
  }
  uint64_t v4 = *(unsigned char **)(*(void *)(a1 + 16) + 8 * v2);
  int v5 = v4[10] & 3;
  if (v5 == 2) {
    return (*(uint64_t (**)(void))(*(void *)v4 + 8))();
  }
  else {
    return v5 == 0;
  }
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::hasFunctionSlow(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0;
    unint64_t v3 = *(void *)(a1 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(a1 + 24);
  }
  if (v3 <= v2) {
    return 0;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 16) + 8 * v2);
  int v5 = (*(unsigned __int16 *)(v4 + 9) >> 10) & 3;
  if (v5 == 2) {
    return (*(uint64_t (**)(void))(*(void *)v4 + 16))();
  }
  else {
    return v5 == 0;
  }
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::getSyntaxNode(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0;
    unint64_t v3 = *(void *)(result + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(result + 24);
  }
  if (v3 > v2) {
    return (*(uint64_t (**)(void))(**(void **)(*(void *)(result + 16) + 8 * v2) + 24))();
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::printLeft(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0;
    unint64_t v3 = *(void *)(result + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(result + 24);
  }
  if (v3 > v2) {
    return (*(uint64_t (**)(void))(**(void **)(*(void *)(result + 16) + 8 * v2) + 32))();
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::printRight(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0;
    unint64_t v3 = *(void *)(result + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(result + 24);
  }
  if (v3 > v2) {
    return (*(uint64_t (**)(void))(**(void **)(*(void *)(result + 16) + 8 * v2) + 40))();
  }
  return result;
}

void anonymous namespace'::itanium_demangle::ParameterPack::~ParameterPack(_anonymous_namespace_::itanium_demangle::ParameterPack *this)
{
}

void *anonymous namespace'::itanium_demangle::TemplateArgs::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = 0;
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 60;
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 62;
  *((_DWORD *)this + 8) = v4;
  return result;
}

void sub_20D726390(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

void anonymous namespace'::itanium_demangle::TemplateArgs::~TemplateArgs(_anonymous_namespace_::itanium_demangle::TemplateArgs *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::NameWithTemplateArgs::printLeft(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
}

uint64_t anonymous namespace'::itanium_demangle::NameWithTemplateArgs::getBaseName(_anonymous_namespace_::itanium_demangle::NameWithTemplateArgs *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 48))();
}

void anonymous namespace'::itanium_demangle::NameWithTemplateArgs::~NameWithTemplateArgs(_anonymous_namespace_::itanium_demangle::NameWithTemplateArgs *this)
{
}

void *anonymous namespace'::itanium_demangle::TemplateArgumentPack::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
}

void anonymous namespace'::itanium_demangle::TemplateArgumentPack::~TemplateArgumentPack(_anonymous_namespace_::itanium_demangle::TemplateArgumentPack *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::TemplateParamQualifiedArg::printLeft(uint64_t a1, uint64_t a2)
{
}

void anonymous namespace'::itanium_demangle::TemplateParamQualifiedArg::~TemplateParamQualifiedArg(_anonymous_namespace_::itanium_demangle::TemplateParamQualifiedArg *this)
{
}

void *anonymous namespace'::itanium_demangle::EnableIfAttr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)" [enable_if:";
  *(_DWORD *)(v4 + 8) = 979790175;
  *((void *)this + 1) += 12;
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 93;
  return result;
}

void anonymous namespace'::itanium_demangle::EnableIfAttr::~EnableIfAttr(_anonymous_namespace_::itanium_demangle::EnableIfAttr *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::ExplicitObjectParameter::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(unsigned char *)(v4 + 4) = 32;
  *(_DWORD *)uint64_t v4 = 1936287860;
  *((void *)this + 1) += 5;
  uint64_t v5 = *(void *)(a1 + 16);
}

void anonymous namespace'::itanium_demangle::ExplicitObjectParameter::~ExplicitObjectParameter(_anonymous_namespace_::itanium_demangle::ExplicitObjectParameter *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::FunctionEncoding::hasRHSComponentSlow()
{
  return 1;
}

uint64_t anonymous namespace'::itanium_demangle::FunctionEncoding::hasFunctionSlow()
{
  return 1;
}

uint64_t anonymous namespace'::itanium_demangle::FunctionEncoding::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 32))(v4, a2);
    uint64_t v5 = *(void *)(a1 + 16);
    unsigned int v6 = *(unsigned __int8 *)(v5 + 9);
    if ((v6 & 0xC0) == 0x80)
    {
      if ((**(uint64_t (***)(uint64_t, void *))v5)(v5, a2)) {
        goto LABEL_7;
      }
    }
    else if (v6 < 0x40)
    {
      goto LABEL_7;
    }
    *(unsigned char *)(*a2 + a2[1]++) = 32;
  }
LABEL_7:
  uint64_t v7 = *(void *)(a1 + 24);
}

uint64_t anonymous namespace'::itanium_demangle::FunctionEncoding::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  ++*((_DWORD *)this + 8);
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 41;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v8 + 40))(v8, this);
  }
  int v9 = *(_DWORD *)(a1 + 64);
  if (v9)
  {
    uint64_t v13 = *(void *)this + *((void *)this + 1);
    *(_WORD *)(v13 + 4) = 29811;
    *(_DWORD *)uint64_t v13 = 1852793632;
    *((void *)this + 1) += 6;
    int v9 = *(_DWORD *)(a1 + 64);
    if ((v9 & 2) == 0)
    {
LABEL_5:
      if ((v9 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v14 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v14 = *(void *)" volatile";
  *(unsigned char *)(v14 + 8) = 101;
  *((void *)this + 1) += 9;
  if ((*(_DWORD *)(a1 + 64) & 4) != 0)
  {
LABEL_6:
    uint64_t v10 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v10 = *(void *)" restrict";
    *(unsigned char *)(v10 + 8) = 116;
    *((void *)this + 1) += 9;
  }
LABEL_7:
  int v11 = *(unsigned __int8 *)(a1 + 68);
  if (v11 == 2)
  {
    uint64_t v12 = 3;
    uint64_t v15 = *(void *)this + *((void *)this + 1);
    *(unsigned char *)(v15 + 2) = 38;
    *(_WORD *)uint64_t v15 = 9760;
  }
  else
  {
    if (v11 != 1) {
      goto LABEL_15;
    }
    uint64_t v12 = 2;
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 9760;
  }
  *((void *)this + 1) += v12;
LABEL_15:
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
  if (*(void *)(a1 + 56))
  }
  {
    uint64_t v17 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v17 = *(void *)" requires ";
    *(_WORD *)(v17 + 8) = 8307;
    *((void *)this + 1) += 10;
    uint64_t v18 = *(void *)(a1 + 56);
  }
  return result;
}

void anonymous namespace'::itanium_demangle::FunctionEncoding::~FunctionEncoding(_anonymous_namespace_::itanium_demangle::FunctionEncoding *this)
{
}

void *anonymous namespace'::itanium_demangle::DotSuffix::printLeft(uint64_t *a1, void *a2)
{
  *(_WORD *)(*a2 + a2[1]) = 10272;
  a2[1] += 2;
  size_t v4 = a1[4];
  if (v4)
  {
    uint64_t v5 = (const void *)a1[3];
    memcpy((void *)(*a2 + a2[1]), v5, v4);
    a2[1] += v4;
  }
  *(unsigned char *)(*a2 + a2[1]++) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::DotSuffix::~DotSuffix(_anonymous_namespace_::itanium_demangle::DotSuffix *this)
{
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseFunctionType(uint64_t a1)
{
  uint64_t v10 = *(_WORD **)a1;
  int v9 = *(unsigned char **)(a1 + 8);
  if ((unint64_t)&v9[-*(void *)a1] < 2)
  {
LABEL_2:
    int v11 = 0;
    goto LABEL_12;
  }
  if (*v10 != 28484)
  {
    if (*v10 == 20292)
    {
      *(void *)a1 = v10 + 1;
      if (!v29) {
        return;
      }
      char v30 = *(unsigned char **)a1;
      if (*(void *)a1 == *(void *)(a1 + 8) || *v30 != 69) {
        return;
      }
      uint64_t v31 = v29;
      *(void *)a1 = v30 + 1;
      *((unsigned char *)v11 + 8) = 17;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((unsigned char *)v11 + 9) & 0xF000 | 0x540;
      *int v11 = off_26C223490;
      v11[2] = v31;
      goto LABEL_12;
    }
    if (*v10 == 30532)
    {
      uint64_t v12 = v10 + 1;
      *(void *)a1 = v12;
      unint64_t v13 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
      while (v12 == v9 || *v12 != 69)
      {
        if (!v40) {
          return;
        }
        uint64_t v12 = *(unsigned char **)a1;
        int v9 = *(unsigned char **)(a1 + 8);
      }
      *(void *)a1 = v12 + 1;
      uint64_t v39 = v38;
      *((unsigned char *)v11 + 8) = 18;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((unsigned char *)v11 + 9) & 0xF000 | 0x540;
      *int v11 = off_26C223500;
      v11[2] = v37;
      v11[3] = v39;
      goto LABEL_12;
    }
    goto LABEL_2;
  }
  *(void *)a1 = v10 + 1;
LABEL_12:
  uint64_t v14 = *(_WORD **)a1;
  uint64_t v15 = *(_WORD **)(a1 + 8);
  if ((unint64_t)v15 - *(void *)a1 >= 2 && *v14 == 30788) {
    *(void *)a1 = ++v14;
  }
  if (v14 == v15 || *(unsigned char *)v14 != 70) {
    return;
  }
  *(void *)a1 = (char *)v14 + 1;
  if ((_WORD *)((char *)v14 + 1) != v15 && *((unsigned char *)v14 + 1) == 89) {
    *(void *)a1 = v14 + 1;
  }
  if (!v16) {
    return;
  }
  uint64_t v23 = v16;
  unint64_t v24 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
  uint64_t v25 = 1;
  while (1)
  {
    while (1)
    {
      char v26 = *(_WORD **)a1;
      uint64_t v27 = *(void *)(a1 + 8);
      if (*(void *)a1 == v27) {
        goto LABEL_25;
      }
      int v28 = *(unsigned __int8 *)v26;
      if (v28 != 118) {
        break;
      }
      *(void *)a1 = (char *)v26 + 1;
    }
    if (v28 == 69)
    {
      char v32 = 0;
      goto LABEL_39;
    }
LABEL_25:
    if ((unint64_t)(v27 - (void)v26) >= 2)
    {
      if (*v26 == 17746)
      {
        char v32 = 1;
        uint64_t v25 = 2;
        goto LABEL_39;
      }
      if (*v26 == 17743) {
        break;
      }
    }
    if (!v40) {
      return;
    }
  }
  uint64_t v25 = 2;
  char v32 = 2;
LABEL_39:
  *(void *)a1 = (char *)v26 + v25;
  uint64_t v35 = v34;
  *((unsigned char *)v36 + 8) = 16;
  *(_WORD *)((char *)v36 + 9) = *(_WORD *)((unsigned char *)v36 + 9) & 0xF000 | 0x100;
  void *v36 = off_26C223570;
  v36[2] = v23;
  v36[3] = v33;
  v36[4] = v35;
  *((_DWORD *)v36 + 10) = v8;
  *((unsigned char *)v36 + 44) = v32;
  v36[6] = v11;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseQualifiedType(void *a1)
{
  uint64_t v2 = (unsigned char *)*a1;
  if (*a1 == a1[1] || *v2 != 85)
  {
    if (v17 && v16)
    {
      __int16 v19 = *(_WORD *)((char *)v17 + 9);
      *((unsigned char *)v18 + 8) = 3;
      *(_WORD *)((char *)v18 + 9) = *(_WORD *)((unsigned char *)v18 + 9) & 0xF000 | v19 & 0xFC0;
      *uint64_t v18 = off_26C2236C0;
      *((_DWORD *)v18 + 3) = v16;
      v18[2] = v17;
      return v18;
    }
  }
  else
  {
    *a1 = v2 + 1;
    if (!v4) {
      return 0;
    }
    int v11 = v3;
    unint64_t v12 = v4;
    if (v4 < 9 || (*(void *)v3 == 0x746F7270636A626FLL ? (BOOL v13 = v3[8] == 111) : (BOOL v13 = 0), !v13))
    {
      if (a1[1] == *a1 || *(unsigned char *)*a1 != 73)
      {
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v15 = v14;
        if (!v14) {
          return 0;
        }
      }
      if (v20)
      {
        uint64_t v21 = v20;
        *((unsigned char *)v17 + 8) = 2;
        *(_WORD *)((char *)v17 + 9) = *(_WORD *)((unsigned char *)v17 + 9) & 0xF000 | 0x540;
        *uint64_t v17 = off_26C223650;
        v17[2] = v21;
        v17[3] = v11;
        v17[4] = v12;
        v17[5] = v15;
        return v17;
      }
      return 0;
    }
    long long v29 = *(_OWORD *)a1;
    *a1 = v3 + 9;
    a1[1] = &v3[v4];
    *(_OWORD *)a1 = v29;
    if (!v23) {
      return 0;
    }
    unint64_t v24 = v22;
    uint64_t v25 = v23;
    if (!v26) {
      return 0;
    }
    uint64_t v27 = v26;
    *((unsigned char *)v17 + 8) = 11;
    *(_WORD *)((char *)v17 + 9) = *(_WORD *)((unsigned char *)v17 + 9) & 0xF000 | 0x540;
    *uint64_t v17 = off_26C2235E0;
    v17[2] = v27;
    v17[3] = v24;
    v17[4] = v25;
  }
  return v17;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[12]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[14]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[10]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[9]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[11]>(uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((unsigned char *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((unsigned char *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_26C221660;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::TransformedType,std::string_view &,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, __n128 *a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  *((unsigned char *)v5 + 8) = 7;
  __int16 v7 = *(_WORD *)((unsigned char *)v5 + 9) & 0xF000 | 0x540;
  *uint64_t v5 = off_26C223730;
  __n128 result = *a2;
  *(_WORD *)((char *)v5 + 9) = v7;
  *((__n128 *)v5 + 1) = result;
  v5[4] = v6;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::BinaryFPType,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 31;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C2237A0;
  result[2] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::BitIntType,anonymous namespace'::itanium_demangle::Node *&,BOOL &>(uint64_t a1, uint64_t *a2, char *a3)
{
  uint64_t v6 = *a2;
  char v7 = *a3;
  *((unsigned char *)result + 8) = 32;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C223810;
  result[2] = v6;
  *((unsigned char *)result + 24) = v7;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::PostfixQualifiedType,anonymous namespace'::itanium_demangle::Node *&,std::string_view &>(uint64_t a1, uint64_t *a2, __n128 *a3)
{
  uint64_t v6 = *a2;
  *((unsigned char *)v5 + 8) = 5;
  __int16 v7 = *(_WORD *)((unsigned char *)v5 + 9) & 0xF000 | 0x540;
  *uint64_t v5 = off_26C223880;
  __n128 result = *a3;
  *(_WORD *)((char *)v5 + 9) = v7;
  v5[2] = v6;
  *(__n128 *)(v5 + 3) = result;
  return result;
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseVectorType(uint64_t a1)
{
  uint64_t v1 = *(char **)a1;
  uint64_t v2 = *(char **)(a1 + 8);
  if ((unint64_t)&v2[-*(void *)a1] < 2 || *(_WORD *)v1 != 30276) {
    return;
  }
  *(void *)a1 = v1 + 2;
  if (v2 == v1 + 2 || v1[2] < 49) {
    goto LABEL_15;
  }
  unsigned int v4 = v1[2];
  if (v4 <= 0x39)
  {
    uint64_t v7 = v6;
    *((unsigned char *)v8 + 8) = 8;
    *(_WORD *)((char *)v8 + 9) = *(_WORD *)((unsigned char *)v8 + 9) & 0xF000 | 0x540;
    void *v8 = off_26C221660;
    v8[2] = v5;
    v8[3] = v7;
    uint64_t v21 = v8;
    uint64_t v9 = *(char **)a1;
    uint64_t v10 = *(char **)(a1 + 8);
    if (*(char **)a1 != v10 && *v9 == 95)
    {
      *(void *)a1 = v9 + 1;
      if (v9 + 1 == v10 || v9[1] != 112)
      {
        if (v20) {
      }
        }
      else
      {
        *(void *)a1 = v9 + 2;
      }
    }
    return;
  }
  if (v4 != 95)
  {
LABEL_15:
    if (v14)
    {
      uint64_t v15 = *(char **)a1;
      if (*(void *)a1 != *(void *)(a1 + 8) && *v15 == 95)
      {
        uint64_t v16 = v14;
        *(void *)a1 = v15 + 1;
        if (v17)
        {
          uint64_t v18 = v17;
          *((unsigned char *)v19 + 8) = 29;
          *(_WORD *)((char *)v19 + 9) = *(_WORD *)((unsigned char *)v19 + 9) & 0xF000 | 0x540;
          *__int16 v19 = off_26C223960;
          v19[2] = v18;
          v19[3] = v16;
        }
      }
    }
  }
  else
  {
    *(void *)a1 = v1 + 3;
    if (v11)
    {
      uint64_t v12 = v11;
      *((unsigned char *)v13 + 8) = 29;
      *(_WORD *)((char *)v13 + 9) = *(_WORD *)((unsigned char *)v13 + 9) & 0xF000 | 0x540;
      *BOOL v13 = off_26C223960;
      v13[2] = v12;
      v13[3] = 0;
    }
  }
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseClassEnumType(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (_WORD *)*a1;
  if (a1[1] - *a1 < 2uLL)
  {
LABEL_5:
  }
  switch(*v9)
  {
    case 0x7354:
      uint64_t v11 = "struct";
      uint64_t v12 = 6;
      break;
    case 0x7554:
      uint64_t v11 = "union";
      uint64_t v12 = 5;
      break;
    case 0x6554:
      uint64_t v11 = "enum";
      uint64_t v12 = 4;
      break;
    default:
      goto LABEL_5;
  }
  *a1 = v9 + 1;
  if (result)
  {
    BOOL v13 = result;
    *((unsigned char *)result + 8) = 6;
    *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
    *__n128 result = off_26C223AB0;
    result[2] = v11;
    result[3] = v12;
    result[4] = v13;
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::PointerType,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *(_WORD *)(*a2 + 9);
  *((unsigned char *)result + 8) = 12;
  *(_WORD *)((char *)result + 9) = v5 & 0xC0 | *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x500;
  *__n128 result = off_26C223B20;
  result[2] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ReferenceType,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::ReferenceKind>(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  int v7 = *a3;
  char v8 = *(_WORD *)(*a2 + 9);
  *((unsigned char *)result + 8) = 13;
  *(_WORD *)((char *)result + 9) = v8 & 0xC0 | *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x500;
  *__n128 result = off_26C223B90;
  result[2] = v6;
  *((_DWORD *)result + 6) = v7;
  *((unsigned char *)result + 28) = 0;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::PostfixQualifiedType,anonymous namespace'::itanium_demangle::Node *&,char const(&)[9]>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 5;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C223880;
  result[2] = v4;
  result[3] = " complex";
  result[4] = 8;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::PostfixQualifiedType,anonymous namespace'::itanium_demangle::Node *&,char const(&)[11]>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 5;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_26C223880;
  result[2] = v4;
  result[3] = " imaginary";
  result[4] = 10;
  return result;
}

void *anonymous namespace'::itanium_demangle::NoexceptSpec::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(void *)(*(void *)this + *((void *)this + 1)) = 0x7470656378656F6ELL;
  *((void *)this + 1) += 8;
  ++*((_DWORD *)this + 8);
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(unsigned char *)(v7 + v8) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::NoexceptSpec::~NoexceptSpec(_anonymous_namespace_::itanium_demangle::NoexceptSpec *this)
{
}

void *anonymous namespace'::itanium_demangle::DynamicExceptionSpec::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(unsigned char *)(v4 + 4) = 119;
  *(_DWORD *)uint64_t v4 = 1869768820;
  *((void *)this + 1) += 5;
  ++*((_DWORD *)this + 8);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  *(unsigned char *)(v5 + v6) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v8 = *(void *)this;
  uint64_t v9 = *((void *)this + 1);
  *((void *)this + 1) = v9 + 1;
  *(unsigned char *)(v8 + v9) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::DynamicExceptionSpec::~DynamicExceptionSpec(_anonymous_namespace_::itanium_demangle::DynamicExceptionSpec *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::FunctionType::hasRHSComponentSlow()
{
  return 1;
}

uint64_t anonymous namespace'::itanium_demangle::FunctionType::hasFunctionSlow()
{
  return 1;
}

void *anonymous namespace'::itanium_demangle::FunctionType::printLeft(uint64_t a1, void *a2)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16));
  *(unsigned char *)(*a2 + a2[1]++) = 32;
  return result;
}

void *anonymous namespace'::itanium_demangle::FunctionType::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  ++*((_DWORD *)this + 8);
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(unsigned char *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 41;
  __n128 result = (void *)(*(uint64_t (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16), this);
  int v9 = *(_DWORD *)(a1 + 40);
  if (v9)
  {
    uint64_t v13 = *(void *)this + *((void *)this + 1);
    *(_WORD *)(v13 + 4) = 29811;
    *(_DWORD *)uint64_t v13 = 1852793632;
    *((void *)this + 1) += 6;
    int v9 = *(_DWORD *)(a1 + 40);
    if ((v9 & 2) == 0)
    {
LABEL_3:
      if ((v9 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v14 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v14 = *(void *)" volatile";
  *(unsigned char *)(v14 + 8) = 101;
  *((void *)this + 1) += 9;
  if ((*(_DWORD *)(a1 + 40) & 4) != 0)
  {
LABEL_4:
    uint64_t v10 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v10 = *(void *)" restrict";
    *(unsigned char *)(v10 + 8) = 116;
    *((void *)this + 1) += 9;
  }
LABEL_5:
  int v11 = *(unsigned __int8 *)(a1 + 44);
  if (v11 == 2)
  {
    uint64_t v12 = 3;
    uint64_t v15 = *(void *)this + *((void *)this + 1);
    *(unsigned char *)(v15 + 2) = 38;
    *(_WORD *)uint64_t v15 = 9760;
  }
  else
  {
    if (v11 != 1) {
      goto LABEL_13;
    }
    uint64_t v12 = 2;
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 9760;
  }
  *((void *)this + 1) += v12;
LABEL_13:
  if (*(void *)(a1 + 48))
  {
    uint64_t v16 = *(void *)this;
    uint64_t v17 = *((void *)this + 1);
    *((void *)this + 1) = v17 + 1;
    *(unsigned char *)(v16 + v17) = 32;
    uint64_t v18 = *(void *)(a1 + 48);
  }
  return result;
}

void anonymous namespace'::itanium_demangle::FunctionType::~FunctionType(_anonymous_namespace_::itanium_demangle::FunctionType *this)
{
}

void *anonymous namespace'::itanium_demangle::ObjCProtoName::printLeft(uint64_t *a1, void *a2)
{
  *(unsigned char *)(*a2 + a2[1]++) = 60;
  size_t v4 = a1[4];
  if (v4)
  {
    uint64_t v5 = (const void *)a1[3];
    memcpy((void *)(*a2 + a2[1]), v5, v4);
    a2[1] += v4;
  }
  *(unsigned char *)(*a2 + a2[1]++) = 62;
  return result;
}

void anonymous namespace'::itanium_demangle::ObjCProtoName::~ObjCProtoName(_anonymous_namespace_::itanium_demangle::ObjCProtoName *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::VendorExtQualType::printLeft(uint64_t *a1, void *a2)
{
  *(unsigned char *)(*a2 + a2[1]++) = 32;
  size_t v4 = a1[4];
  if (v4)
  {
    uint64_t v5 = (const void *)a1[3];
    memcpy((void *)(*a2 + a2[1]), v5, v4);
    a2[1] += v4;
  }
  uint64_t result = a1[5];
  if (result)
  {
  }
  return result;
}

void anonymous namespace'::itanium_demangle::VendorExtQualType::~VendorExtQualType(_anonymous_namespace_::itanium_demangle::VendorExtQualType *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::QualType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  }
  else {
    return v2 < 0x40;
  }
}

uint64_t anonymous namespace'::itanium_demangle::QualType::hasArraySlow(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 16);
  int v2 = v1[10] & 3;
  if (v2 == 2) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 8))();
  }
  else {
    return v2 == 0;
  }
}

uint64_t anonymous namespace'::itanium_demangle::QualType::hasFunctionSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int v2 = (*(unsigned __int16 *)(v1 + 9) >> 10) & 3;
  if (v2 == 2) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 16))();
  }
  else {
    return v2 == 0;
  }
}

void *anonymous namespace'::itanium_demangle::QualType::printLeft(uint64_t a1, void *a2)
{
  uint64_t result = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16));
  int v5 = *(_DWORD *)(a1 + 12);
  if (v5)
  {
    uint64_t v7 = *a2 + a2[1];
    *(_WORD *)(v7 + 4) = 29811;
    *(_DWORD *)uint64_t v7 = 1852793632;
    a2[1] += 6;
    int v5 = *(_DWORD *)(a1 + 12);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v8 = *a2 + a2[1];
  *(void *)uint64_t v8 = *(void *)" volatile";
  *(unsigned char *)(v8 + 8) = 101;
  a2[1] += 9;
  if ((*(_DWORD *)(a1 + 12) & 4) == 0) {
    return result;
  }
LABEL_4:
  uint64_t v6 = *a2 + a2[1];
  *(void *)uint64_t v6 = *(void *)" restrict";
  *(unsigned char *)(v6 + 8) = 116;
  a2[1] += 9;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::QualType::printRight(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40))();
}

void anonymous namespace'::itanium_demangle::QualType::~QualType(_anonymous_namespace_::itanium_demangle::QualType *this)
{
}

void *anonymous namespace'::itanium_demangle::TransformedType::printLeft(void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = a1[3];
  if (v4)
  {
    int v5 = (const void *)a1[2];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 40;
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(unsigned char *)(v9 + v10) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::TransformedType::~TransformedType(_anonymous_namespace_::itanium_demangle::TransformedType *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::BinaryFPType::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_WORD *)(v4 + 4) = 29793;
  *(_DWORD *)uint64_t v4 = 1869366879;
  *((void *)this + 1) += 6;
  uint64_t v5 = *(void *)(a1 + 16);
}

void anonymous namespace'::itanium_demangle::BinaryFPType::~BinaryFPType(_anonymous_namespace_::itanium_demangle::BinaryFPType *this)
{
}

void *anonymous namespace'::itanium_demangle::BitIntType::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v4 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v4 = *(void *)"unsigned ";
    *(unsigned char *)(v4 + 8) = 32;
    *((void *)this + 1) += 9;
  }
  uint64_t v5 = (_DWORD *)(*(void *)this + *((void *)this + 1));
  *(_DWORD *)((char *)v5 + 3) = 1953384820;
  *uint64_t v5 = 1953055327;
  *((void *)this + 1) += 7;
  ++*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(unsigned char *)(v9 + v10) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::BitIntType::~BitIntType(_anonymous_namespace_::itanium_demangle::BitIntType *this)
{
}

void *anonymous namespace'::itanium_demangle::PostfixQualifiedType::printLeft(uint64_t a1, void *a2)
{
  uint64_t result = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16));
  size_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = *(const void **)(a1 + 24);
    uint64_t result = memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::PostfixQualifiedType::~PostfixQualifiedType(_anonymous_namespace_::itanium_demangle::PostfixQualifiedType *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::PixelVectorType,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((unsigned char *)result + 8) = 30;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C2238F0;
  result[2] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::VectorType,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  *((unsigned char *)result + 8) = 29;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_26C223960;
  result[2] = v6;
  result[3] = v7;
  return result;
}

void *anonymous namespace'::itanium_demangle::PixelVectorType::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "pixel vector[", 13);
  *((void *)this + 1) += 13;
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 93;
  return result;
}

void anonymous namespace'::itanium_demangle::PixelVectorType::~PixelVectorType(_anonymous_namespace_::itanium_demangle::PixelVectorType *this)
{
}

void *anonymous namespace'::itanium_demangle::VectorType::printLeft(uint64_t a1, void *a2)
{
  *(void *)(*a2 + a2[1]) = 0x5B726F7463657620;
  a2[1] += 8;
  uint64_t v4 = *(void *)(a1 + 24);
  if (v4) {
  *(unsigned char *)(*a2 + a2[1]++) = 93;
  }
  return result;
}

void anonymous namespace'::itanium_demangle::VectorType::~VectorType(_anonymous_namespace_::itanium_demangle::VectorType *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ArrayType,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  *((unsigned char *)result + 8) = 15;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x400;
  *uint64_t result = off_26C2239D0;
  result[2] = v6;
  result[3] = v7;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ArrayType::hasRHSComponentSlow()
{
  return 1;
}

uint64_t anonymous namespace'::itanium_demangle::ArrayType::hasArraySlow()
{
  return 1;
}

uint64_t anonymous namespace'::itanium_demangle::ArrayType::printLeft(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 32))();
}

uint64_t anonymous namespace'::itanium_demangle::ArrayType::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *((void *)this + 1);
  if (!v8) {
    abort_message("%s:%d: %s", (uint64_t)this, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/Utility.h");
  }
  if (*(unsigned char *)(v8 + *(void *)this - 1) != 93)
  {
    *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 32;
  }
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 91;
  uint64_t v11 = *(void *)(a1 + 24);
  if (v11) {
  *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 93;
  }
  uint64_t v12 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 40);

  return v12();
}

void anonymous namespace'::itanium_demangle::ArrayType::~ArrayType(_anonymous_namespace_::itanium_demangle::ArrayType *this)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::PointerToMemberType,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  char v8 = *(_WORD *)(*a3 + 9);
  *((unsigned char *)result + 8) = 14;
  *(_WORD *)((char *)result + 9) = v8 & 0xC0 | *(_WORD *)((unsigned char *)result + 9) & 0xF000 | 0x500;
  *uint64_t result = off_26C223A40;
  result[2] = v6;
  result[3] = v7;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::PointerToMemberType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  }
  else {
    return v2 < 0x40;
  }
}

void *anonymous namespace'::itanium_demangle::PointerToMemberType::printLeft(uint64_t a1, void *a2)
{
  (*(void (**)(void))(**(void **)(a1 + 24) + 32))(*(void *)(a1 + 24));
  uint64_t v4 = *(void *)(a1 + 24);
  unsigned int v5 = *(unsigned __int16 *)(v4 + 9);
  int v6 = (v5 >> 8) & 3;
  if (!v6) {
    goto LABEL_8;
  }
  if (v6 == 2)
  {
    if ((*(uint64_t (**)(uint64_t, void *))(*(void *)v4 + 8))(v4, a2)) {
      goto LABEL_8;
    }
    uint64_t v4 = *(void *)(a1 + 24);
    unsigned int v5 = *(unsigned __int16 *)(v4 + 9);
  }
  int v7 = (v5 >> 10) & 3;
  if (v7 && (v7 != 2 || ((*(uint64_t (**)(uint64_t, void *))(*(void *)v4 + 16))(v4, a2) & 1) == 0))
  {
    char v8 = 32;
    goto LABEL_10;
  }
LABEL_8:
  char v8 = 40;
LABEL_10:
  *(unsigned char *)(*a2 + a2[1]++) = v8;
  uint64_t v10 = *a2 + a2[1];
  *(unsigned char *)(v10 + 2) = 42;
  *(_WORD *)uint64_t v10 = 14906;
  a2[1] += 3;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::PointerToMemberType::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)(a1 + 24);
  unsigned int v5 = *(unsigned __int16 *)(v4 + 9);
  int v6 = (v5 >> 8) & 3;
  if (!v6) {
    goto LABEL_8;
  }
  if (v6 == 2)
  {
    if ((*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 8))(v4, this))
    {
LABEL_8:
      *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 41;
      goto LABEL_9;
    }
    uint64_t v4 = *(void *)(a1 + 24);
    unsigned int v5 = *(unsigned __int16 *)(v4 + 9);
  }
  int v7 = (v5 >> 10) & 3;
  if (!v7
    || v7 == 2
    && (*(unsigned int (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 16))(v4, this))
  {
    goto LABEL_8;
  }
LABEL_9:
  char v8 = *(uint64_t (**)(void))(**(void **)(a1 + 24) + 40);

  return v8();
}

void anonymous namespace'::itanium_demangle::PointerToMemberType::~PointerToMemberType(_anonymous_namespace_::itanium_demangle::PointerToMemberType *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::ElaboratedTypeSpefType::printLeft(void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = a1[3];
  if (v4)
  {
    unsigned int v5 = (const void *)a1[2];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(unsigned char *)(v6 + v7) = 32;
  uint64_t v8 = a1[4];
}

void anonymous namespace'::itanium_demangle::ElaboratedTypeSpefType::~ElaboratedTypeSpefType(_anonymous_namespace_::itanium_demangle::ElaboratedTypeSpefType *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::PointerType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  }
  else {
    return v2 < 0x40;
  }
}

void *anonymous namespace'::itanium_demangle::PointerType::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v4 + 8) != 11
  {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 32))(v4, a2);
    uint64_t v10 = *(unsigned char **)(a1 + 16);
    if ((v10[10] & 3) == 0
      || (v10[10] & 3) == 2 && (*(unsigned int (**)(unsigned char *, void *))(*(void *)v10 + 8))(v10, a2))
    {
      *(unsigned char *)(*a2 + a2[1]++) = 32;
    }
    uint64_t v11 = *(void *)(a1 + 16);
    unsigned int v12 = *(unsigned __int16 *)(v11 + 9);
    int v13 = (v12 >> 8) & 3;
    if (v13)
    {
      if (v13 != 2)
      {
LABEL_14:
        int v14 = (v12 >> 10) & 3;
        if (v14 && (v14 != 2 || !(*(unsigned int (**)(uint64_t, void *))(*(void *)v11 + 16))(v11, a2))) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
      if (((*(uint64_t (**)(uint64_t, void *))(*(void *)v11 + 8))(v11, a2) & 1) == 0)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        unsigned int v12 = *(unsigned __int16 *)(v11 + 9);
        goto LABEL_14;
      }
    }
LABEL_17:
    *(unsigned char *)(*a2 + a2[1]++) = 40;
LABEL_18:
    char v9 = 42;
    goto LABEL_19;
  }
  uint64_t v5 = *a2 + a2[1];
  *(unsigned char *)(v5 + 2) = 60;
  *(_WORD *)uint64_t v5 = 25705;
  a2[1] += 3;
  size_t v6 = *(void *)(v4 + 32);
  if (v6)
  {
    uint64_t v7 = *(const void **)(v4 + 24);
    memcpy((void *)(*a2 + a2[1]), v7, v6);
    a2[1] += v6;
  }
  char v9 = 62;
LABEL_19:
  *(unsigned char *)(*a2 + a2[1]++) = v9;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::PointerType::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v4 + 8) == 11)
  {
    if (result) {
      return result;
    }
  }
  unsigned int v6 = *(unsigned __int16 *)(v4 + 9);
  int v7 = (v6 >> 8) & 3;
  if (!v7) {
    goto LABEL_10;
  }
  if (v7 == 2)
  {
    if ((*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 8))(v4, this))
    {
LABEL_10:
      *(unsigned char *)(*(void *)this + (*((void *)this + 1))++) = 41;
      goto LABEL_11;
    }
    uint64_t v4 = *(void *)(a1 + 16);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 9);
  }
  int v8 = (v6 >> 10) & 3;
  if (!v8
    || v8 == 2
    && (*(unsigned int (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 16))(v4, this))
  {
    goto LABEL_10;
  }
LABEL_11:
  char v9 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 40);

  return v9();
}

void anonymous namespace'::itanium_demangle::PointerType::~PointerType(_anonymous_namespace_::itanium_demangle::PointerType *this)
{
}

BOOL anonymous namespace'::itanium_demangle::ObjCProtoName::isObjCObject(_anonymous_namespace_::itanium_demangle::ObjCProtoName *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (*(unsigned char *)(v1 + 8) != 8 || *(void *)(v1 + 24) != 11) {
    return 0;
  }
  unsigned int v2 = *(uint64_t **)(v1 + 16);
  uint64_t v3 = *v2;
  uint64_t v4 = *(uint64_t *)((char *)v2 + 3);
  return v3 == 0x6A626F5F636A626FLL && v4 == 0x7463656A626F5F63;
}

uint64_t anonymous namespace'::itanium_demangle::ReferenceType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  }
  else {
    return v2 < 0x40;
  }
}

uint64_t anonymous namespace'::itanium_demangle::ReferenceType::printLeft(uint64_t result, void *a2)
{
  if (!*(unsigned char *)(result + 28))
  {
    uint64_t v3 = result;
    *(unsigned char *)(result + 28) = 1;
    uint64_t v5 = v4;
    if (!v4)
    {
LABEL_22:
      *(unsigned char *)(v3 + 28) = 0;
      return result;
    }
    unsigned int v6 = result;
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 32))(v4, a2);
    if ((*(unsigned char *)(v5 + 10) & 3) == 0
      || (*(unsigned char *)(v5 + 10) & 3) == 2
      && (*(unsigned int (**)(uint64_t, void *))(*(void *)v5 + 8))(v5, a2))
    {
      *(unsigned char *)(*a2 + a2[1]++) = 32;
    }
    unsigned int v7 = *(unsigned __int16 *)(v5 + 9);
    int v8 = (v7 >> 8) & 3;
    if (!v8) {
      goto LABEL_14;
    }
    if (v8 == 2)
    {
      if ((*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 8))(v5, a2)) {
        goto LABEL_14;
      }
      unsigned int v7 = *(unsigned __int16 *)(v5 + 9);
    }
    int v9 = (v7 >> 10) & 3;
    if (v9 && (v9 != 2 || !(*(unsigned int (**)(uint64_t, void *))(*(void *)v5 + 16))(v5, a2)))
    {
LABEL_15:
      uint64_t v10 = v6;
      if (v6) {
        size_t v11 = 2;
      }
      else {
        size_t v11 = 1;
      }
      if (v10) {
        unsigned int v12 = "&&";
      }
      else {
        unsigned int v12 = "&";
      }
      uint64_t result = (uint64_t)memcpy((void *)(*a2 + a2[1]), v12, v11);
      a2[1] += v11;
      goto LABEL_22;
    }
LABEL_14:
    *(unsigned char *)(*a2 + a2[1]++) = 40;
    goto LABEL_15;
  }
  return result;
}

void sub_20D7292D4(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 28) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ReferenceType::printRight(uint64_t result, void *a2)
{
  if (!*(unsigned char *)(result + 28))
  {
    uint64_t v3 = result;
    *(unsigned char *)(result + 28) = 1;
    uint64_t v5 = v4;
    if (!v4)
    {
LABEL_12:
      *(unsigned char *)(v3 + 28) = 0;
      return result;
    }
    unsigned int v6 = *(unsigned __int16 *)(v4 + 9);
    int v7 = (v6 >> 8) & 3;
    if (v7)
    {
      if (v7 != 2)
      {
LABEL_7:
        int v8 = (v6 >> 10) & 3;
        if (v8 && (v8 != 2 || !(*(unsigned int (**)(uint64_t, void *))(*(void *)v5 + 16))(v5, a2))) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      if (((*(uint64_t (**)(uint64_t, void *))(*(void *)v4 + 8))(v4, a2) & 1) == 0)
      {
        unsigned int v6 = *(unsigned __int16 *)(v5 + 9);
        goto LABEL_7;
      }
    }
LABEL_10:
    *(unsigned char *)(*a2 + a2[1]++) = 41;
LABEL_11:
    uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 40))(v5, a2);
    goto LABEL_12;
  }
  return result;
}

void sub_20D729404(_Unwind_Exception *a1)
{
  *(unsigned char *)(v1 + 28) = 0;
  _Unwind_Resume(a1);
}

void anonymous namespace'::itanium_demangle::ReferenceType::~ReferenceType(_anonymous_namespace_::itanium_demangle::ReferenceType *this)
{
}

uint64_t anonymous namespace'::itanium_demangle::ReferenceType::collapse(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 16);
  ptr = (char *)v25;
  uint64_t v23 = (char *)v25;
  unint64_t v24 = (char *)&v26;
  memset(v25, 0, sizeof(v25));
  while (1)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 24))(v4, a2);
    if (*(unsigned char *)(v5 + 8) != 13) {
      break;
    }
    uint64_t v4 = *(void *)(v5 + 16);
    if (*(_DWORD *)(v5 + 24) < (signed int)v3) {
      unsigned int v3 = *(_DWORD *)(v5 + 24);
    }
    int v13 = v23;
    if (v23 == v24)
    {
      uint64_t v14 = v23 - ptr;
      if (ptr == (char *)v25)
      {
        uint64_t v16 = (char *)malloc_type_malloc(2 * (v23 - ptr), 0x6004044C4A2DFuLL);
        uint64_t v15 = v16;
        if (!v16) {
LABEL_23:
        }
          abort();
        uint64_t v6 = (uint64_t)ptr;
        size_t v7 = v23 - ptr;
        if (v23 != ptr) {
          memmove(v16, ptr, v7);
        }
        ptr = v15;
      }
      else
      {
        uint64_t v15 = (char *)malloc_type_realloc(ptr, 2 * (v23 - ptr), 0x6004044C4A2DFuLL);
        ptr = v15;
        if (!v15) {
          goto LABEL_23;
        }
      }
      int v13 = &v15[8 * (v14 >> 3)];
      unint64_t v24 = &v15[8 * (v14 >> 2)];
    }
    uint64_t v23 = v13 + 8;
    *(void *)int v13 = v4;
    uint64_t v17 = ptr;
    uint64_t v18 = v23 - ptr;
    if ((unint64_t)(v23 - ptr) >= 9)
    {
      unint64_t v19 = v18 >> 3;
      unint64_t v20 = (v18 >> 3) - 1;
      if (v19 <= v20 >> 1) {
        abort_message("%s:%d: %s", v6, v7, v8, v9, v10, v11, v12, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
      }
      if (v4 == *(void *)&ptr[8 * (v20 >> 1)]) {
        goto LABEL_19;
      }
    }
  }
  uint64_t v17 = ptr;
LABEL_19:
  if (v17 != (char *)v25) {
    free(v17);
  }
  return v3;
}

void sub_20D7295EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  if (a12 != v12) {
    free(a12);
  }
  _Unwind_Resume(exception_object);
}

void *__cxa_get_globals()
{
  globals_fast = __cxa_get_globals_fast();
  if (!globals_fast)
  {
    uint64_t v1 = __cxxabiv1::__calloc_with_fallback(1uLL, 0x10uLL);
    if (!v1) {
      abort_message("cannot allocate __cxa_eh_globals", v2, v3, v4, v5, v6, v7, v8, v17);
    }
    globals_fast = v1;
      abort_message("std::__libcpp_tls_set failure in __cxa_get_globals()", v9, v10, v11, v12, v13, v14, v15, v17);
  }
  return globals_fast;
}

void *__cxa_get_globals_fast()
{
  {
    abort_message("execute once failure in __cxa_get_globals_fast()", v0, v1, v2, v3, v4, v5, v6, vars0);
  }

  return pthread_getspecific(v7);
}

uint64_t __cxxabiv1::anonymous namespace'::construct_(__cxxabiv1::_anonymous_namespace_ *this)
{
  if (result) {
    abort_message("cannot create thread specific key for __cxa_get_globals()", v2, v3, v4, v5, v6, v7, v8, vars0);
  }
  return result;
}

uint64_t __cxxabiv1::anonymous namespace'::destruct_(__cxxabiv1::_anonymous_namespace_ *this, void *a2)
{
  __cxxabiv1::__free_with_fallback(this, a2);
  if (result) {
    abort_message("cannot zero out thread value for __cxa_get_globals()", v3, v4, v5, v6, v7, v8, v9, vars0);
  }
  return result;
}

void *__cxxabiv1::anonymous namespace'::InitByteGlobalMutex<__cxxabiv1::anonymous namespace'::LibcppMutex,__cxxabiv1::anonymous namespace'::LibcppCondVar,__cxxabiv1::anonymous namespace'::GlobalStatic<__cxxabiv1::anonymous namespace'::LibcppMutex>::instance,__cxxabiv1::anonymous namespace'::GlobalStatic<__cxxabiv1::anonymous namespace'::LibcppCondVar>::instance,&__cxxabiv1::anonymous namespace'::PlatformThreadID>::LockGuard::~LockGuard(void *a1)
{
  if (pthread_mutex_unlock(&stru_26AA44090)) {
    abort_message("%s failed to release mutex", v2, v3, v4, v5, v6, v7, v8, *a1);
  }
  return a1;
}

std::unexpected_handler std::get_unexpected(void)
{
  return (std::unexpected_handler)atomic_load_explicit((atomic_ullong *volatile)&__cxa_unexpected_handler, memory_order_acquire);
}

void std::terminate(void)
{
  globals_fast = (const _Unwind_Exception **)__cxa_get_globals_fast();
  if (globals_fast)
  {
    uint64_t v1 = *globals_fast;
    if (*globals_fast)
    {
      if (__cxxabiv1::__isOurExceptionClass(v1 + 3))
      {
        exception_cleanup = (void (*)(void))v1[1].exception_cleanup;
        if (!exception_cleanup) {
          std::__terminate(0);
        }
        std::__terminate(exception_cleanup);
      }
    }
  }
  terminate = std::get_terminate();
  std::__terminate(terminate);
}

void std::__unexpected(void (*a1)(void))
{
  a1();
  abort_message("unexpected_handler unexpectedly returned", v1, v2, v3, v4, v5, v6, v7, vars0);
}

void std::unexpected(void)
{
}

std::terminate_handler std::get_terminate(void)
{
  return (std::terminate_handler)atomic_load_explicit((atomic_ullong *volatile)&__cxa_terminate_handler, memory_order_acquire);
}

void std::__terminate(void (*a1)(void))
{
  a1();
  abort_message("terminate_handler unexpectedly returned", v1, v2, v3, v4, v5, v6, v7, vars0);
}

void sub_20D729888()
{
}

std::new_handler std::get_new_handler(void)
{
  return (std::new_handler)atomic_load_explicit(&__cxa_new_handler, memory_order_acquire);
}

void *__cxa_vec_new(size_t element_count, size_t element_size, size_t padding_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor)
{
  return __cxa_vec_new2(element_count, element_size, padding_size, constructor, destructor, (void *(*)(size_t))operator new[], (void (*)(void *))operator delete[]);
}

void *__cxa_vec_new2(size_t element_count, size_t element_size, size_t padding_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor, void *(*alloc)(size_t), void (*dealloc)(void *))
{
  if (!is_mul_ok(element_count, element_size)
    || (size_t v9 = element_count,
        BOOL v10 = __CFADD__(element_count * element_size, padding_size),
        element_count = element_count * element_size + padding_size,
        v10))
  {
  }
  uint64_t v13 = (char *)alloc(element_count);
  if (!v13) {
    return 0;
  }
  uint64_t v14 = v13;
  if (padding_size)
  {
    uint64_t v14 = &v13[padding_size];
    *(void *)&v13[padding_size - 8] = v9;
  }
  __cxa_vec_ctor(v14, v9, element_size, constructor, destructor);
  return v14;
}

void sub_20D729980(_Unwind_Exception *a1)
{
  v1(v2);
  _Unwind_Resume(a1);
}

__cxa_vec_ctor_return_type __cxa_vec_ctor(void *array_address, size_t element_count, size_t element_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor)
{
  if (constructor)
  {
    uint64_t v7 = (char *)array_address;
    v9[0] = array_address;
    v9[1] = &i;
    v9[2] = element_size;
    v9[3] = destructor;
    char v10 = 1;
    for (size_t i = 0; i < element_count; v7 += element_size)
    {
      constructor(v7);
      ++i;
    }
    char v10 = 0;
  }
}

void sub_20D729A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__cxa_vec_new3(size_t element_count, size_t element_size, size_t padding_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor, void *(*alloc)(size_t), void (*dealloc)(void *, size_t))
{
  if (!is_mul_ok(element_count, element_size) || __CFADD__(element_count * element_size, padding_size)) {
  uint64_t v12 = (char *)alloc(element_count * element_size + padding_size);
  }
  if (!v12) {
    return 0;
  }
  uint64_t v13 = v12;
  if (padding_size)
  {
    uint64_t v13 = &v12[padding_size];
    *(void *)&v12[padding_size - 8] = element_count;
  }
  __cxa_vec_ctor(v13, element_count, element_size, constructor, destructor);
  return v13;
}

void sub_20D729AE8(_Unwind_Exception *a1)
{
  v1(v3, v2);
  _Unwind_Resume(a1);
}

__cxa_vec_ctor_return_type __cxa_vec_cctor(void *dest_array, void *src_array, size_t element_count, size_t element_size, __cxa_cdtor_return_type (*constructor)(void *, void *), __cxa_cdtor_type destructor)
{
  if (constructor)
  {
    v12[0] = dest_array;
    v12[1] = &v14;
    v12[2] = element_size;
    v12[3] = destructor;
    char v13 = 1;
    size_t v14 = 0;
    if (element_count)
    {
      uint64_t v11 = 0;
      do
      {
        constructor((char *)dest_array + v11, (char *)src_array + v11);
        ++v14;
        v11 += element_size;
      }
      while (v14 < element_count);
    }
    char v13 = 0;
  }
}

void sub_20D729BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __cxxabiv1::anonymous namespace'::st_cxa_cleanup::~st_cxa_cleanup(__cxxabiv1::_anonymous_namespace_::st_cxa_cleanup *this)
{
  if (*((unsigned char *)this + 32))
  {
    uint64_t v1 = (void (*)(void))*((void *)this + 3);
    if (v1)
    {
      uint64_t v2 = *((void *)this + 2);
      uint64_t v3 = **((void **)this + 1);
      uint64_t v4 = -v2;
      uint64_t v5 = v3 + 1;
      for (uint64_t i = *(void *)this + v2 * (v3 - 1); --v5; uint64_t i = v7)
      {
        uint64_t v7 = i + v4;
        v1();
      }
    }
  }
}

void __cxa_vec_dtor(void *array_address, size_t element_count, size_t element_size, __cxa_cdtor_type destructor)
{
  if (destructor)
  {
    size_t v18 = element_count;
    v16[0] = array_address;
    v16[1] = &v18;
    v16[2] = element_size;
    v16[3] = destructor;
    char v17 = 1;
    __cxa_uncaught_exception();
    uint64_t v12 = -(uint64_t)element_size;
    for (uint64_t i = (char *)array_address + element_size * (element_count - 1); v18--; uint64_t i = v15)
    {
      uint64_t v15 = &i[v12];
      ((void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))destructor)(i, v8, v9, v10, v11);
    }
    char v17 = 0;
  }
}

void sub_20D729CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (v9) {
    std::terminate();
  }
  _Unwind_Resume(a1);
}

void __cxa_vec_cleanup(void *array_address, size_t element_count, size_t s, __cxa_cdtor_type destructor)
{
  if (destructor)
  {
    uint64_t v5 = -(uint64_t)s;
    size_t v6 = element_count + 1;
    for (uint64_t i = (char *)array_address + s * (element_count - 1); --v6; uint64_t i = v8)
    {
      uint64_t v8 = &i[v5];
      ((void (*)(void))destructor)();
    }
  }
}

void __cxa_vec_delete(void *array_address, size_t element_size, size_t padding_size, __cxa_cdtor_type destructor)
{
}

void __cxa_vec_delete2(void *array_address, size_t element_size, size_t padding_size, __cxa_cdtor_type destructor, void (*dealloc)(void *))
{
  if (array_address)
  {
    size_t v6 = (char *)array_address - padding_size;
    if (padding_size)
    {
      if (destructor) {
        __cxa_vec_dtor(array_address, *((void *)array_address - 1), element_size, destructor);
      }
    }
    ((void (*)(char *, size_t))dealloc)(v6, element_size);
  }
}

void sub_20D729DA8(_Unwind_Exception *a1)
{
  v1(v2);
  _Unwind_Resume(a1);
}

void __cxa_vec_delete3(void *array_address, size_t element_size, size_t padding_size, __cxa_cdtor_type destructor, void (*dealloc)(void *, size_t))
{
  if (array_address)
  {
    size_t v6 = (char *)array_address - padding_size;
    if (padding_size)
    {
      size_t v8 = *((void *)array_address - 1);
      size_t v9 = padding_size + v8 * element_size;
      if (destructor) {
        __cxa_vec_dtor(array_address, v8, element_size, destructor);
      }
    }
    else
    {
      size_t v9 = 0;
    }
    dealloc(v6, v9);
  }
}

void sub_20D729E24(_Unwind_Exception *a1)
{
  v1(v2, v3);
  _Unwind_Resume(a1);
}

void __cxxabiv1::anonymous namespace'::throw_bad_array_new_length(__cxxabiv1::_anonymous_namespace_ *this)
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v2 = std::bad_array_new_length::bad_array_new_length(exception);
}

void __cxa_pure_virtual(void)
{
  abort_message("Pure virtual function called!", v0, v1, v2, v3, v4, v5, v6, vars0);
}

void __cxa_deleted_virtual(void)
{
  abort_message("Deleted virtual function called!", v0, v1, v2, v3, v4, v5, v6, vars0);
}

void std::exception::~exception(std::exception *this)
{
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return "std::exception";
}

void std::bad_exception::~bad_exception(std::bad_exception *this)
{
}

const char *__cdecl std::bad_exception::what(const std::bad_exception *this)
{
  return "std::bad_exception";
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  this->__vftable = (std::bad_alloc_vtbl *)&off_26C223C00;
  return this;
}

{
  this->__vftable = (std::bad_alloc_vtbl *)&off_26C223C00;
  return this;
}

void std::bad_alloc::~bad_alloc(std::bad_alloc *this)
{
}

const char *__cdecl std::bad_alloc::what(const std::bad_alloc *this)
{
  return "std::bad_alloc";
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  this->__vftable = (std::bad_array_new_length_vtbl *)&off_26C223C28;
  return this;
}

{
  this->__vftable = (std::bad_array_new_length_vtbl *)&off_26C223C28;
  return this;
}

void std::bad_array_new_length::~bad_array_new_length(std::bad_array_new_length *this)
{
}

const char *__cdecl std::bad_array_new_length::what(const std::bad_array_new_length *this)
{
  return "bad_array_new_length";
}

void std::logic_error::~logic_error(std::logic_error *this)
{
  this->__vftable = (std::logic_error_vtbl *)off_26C223CF8;
  imp = this->__imp_.__imp_;
  {
    uint64_t v4 = dlopen("/usr/lib/libstdc++.6.dylib", 16);
    if (v4)
    {
      uint64_t v5 = dlsym(v4, "_ZNSs4_Rep20_S_empty_rep_storageE");
      uint64_t v6 = (uint64_t)v5 + 24;
      if (!v5) {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  {
    uint64_t v3 = this->__imp_.__imp_;
    if ((int)(atomic_fetch_add((atomic_uint *volatile)v3 - 2, 0xFFFFFFFF) - 1) < 0) {
      operator delete((void *)(v3 - 24));
    }
  }

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  std::logic_error::~logic_error(this);

  JUMPOUT(0x21055C430);
}

const char *__cdecl std::logic_error::what(const std::logic_error *this)
{
  return this->__imp_.__imp_;
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)off_26C223D20;
  imp = this->__imp_.__imp_;
  {
    uint64_t v4 = dlopen("/usr/lib/libstdc++.6.dylib", 16);
    if (v4)
    {
      uint64_t v5 = dlsym(v4, "_ZNSs4_Rep20_S_empty_rep_storageE");
      uint64_t v6 = (uint64_t)v5 + 24;
      if (!v5) {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  {
    uint64_t v3 = this->__imp_.__imp_;
    if ((int)(atomic_fetch_add((atomic_uint *volatile)v3 - 2, 0xFFFFFFFF) - 1) < 0) {
      operator delete((void *)(v3 - 24));
    }
  }

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x21055C430);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return this->__imp_.__imp_;
}

void std::domain_error::~domain_error(std::domain_error *this)
{
  std::logic_error::~logic_error(this);

  JUMPOUT(0x21055C430);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
  std::logic_error::~logic_error(this);

  JUMPOUT(0x21055C430);
}

void std::length_error::~length_error(std::length_error *this)
{
  std::logic_error::~logic_error(this);

  JUMPOUT(0x21055C430);
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
  std::logic_error::~logic_error(this);

  JUMPOUT(0x21055C430);
}

void std::range_error::~range_error(std::range_error *this)
{
  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x21055C430);
}

void std::overflow_error::~overflow_error(std::overflow_error *this)
{
  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x21055C430);
}

void std::underflow_error::~underflow_error(std::underflow_error *this)
{
  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x21055C430);
}

void std::type_info::~type_info(std::type_info *this)
{
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  this->__vftable = (std::bad_cast_vtbl *)off_26C223F38;
  return this;
}

{
  this->__vftable = (std::bad_cast_vtbl *)off_26C223F38;
  return this;
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x21055C430);
}

const char *__cdecl std::bad_cast::what(const std::bad_cast *this)
{
  return "std::bad_cast";
}

std::bad_typeid *__cdecl std::bad_typeid::bad_typeid(std::bad_typeid *this)
{
  this->__vftable = (std::bad_typeid_vtbl *)off_26C223F60;
  return this;
}

{
  this->__vftable = (std::bad_typeid_vtbl *)off_26C223F60;
  return this;
}

void std::bad_typeid::~bad_typeid(std::bad_typeid *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x21055C430);
}

const char *__cdecl std::bad_typeid::what(const std::bad_typeid *this)
{
  return "std::bad_typeid";
}

void abort_message(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (FILE **)MEMORY[0x263EF8348];
  fwrite("libc++abi: ", 0xBuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  uint64_t v11 = &a9;
  vfprintf(*v10, a1, &a9);
  fputc(10, *v10);
  uint64_t v11 = 0;
  vasprintf(&v11, a1, &a9);
  qword_267703EE0 = (uint64_t)v11;
  abort();
}

int *__cxxabiv1::__aligned_malloc_with_fallback(unint64_t a1)
{
  if (a1 <= 1) {
    unint64_t v1 = 1;
  }
  else {
    unint64_t v1 = a1;
  }
  if (((v1 + 15) & 0xFFFFFFFFFFFFFFF0) <= v1) {
    size_t v2 = v1;
  }
  else {
    size_t v2 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  uint64_t result = (int *)malloc_type_aligned_alloc(0x10uLL, v2, 0x76A2E741uLL);
  if (!result)
  {
  }
  return result;
}

int *anonymous namespace'::fallback_malloc(_anonymous_namespace_ *this)
{
  {
    size_t v9 = &dword_267703F3C;
    dword_267703F3C = 8192128;
  }
  {
LABEL_11:
    char v13 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v11 = ((unint64_t)this + 3) >> 2;
    unint64_t v12 = v11 + 1;
    while (1)
    {
      char v13 = v9 + 1;
      if (((unint64_t)(v9 + 1) & 0xF) != 0) {
        abort_message("%s:%d: %s", v2, v3, v4, v5, v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/fallback_malloc.cpp");
      }
      size_t v14 = v9;
      unint64_t v15 = *((unsigned __int16 *)v9 + 1);
      uint64_t v16 = ((_BYTE)v15 - (_BYTE)v12) & 3;
      if (v12 >= v15) {
        uint64_t v16 = 0;
      }
      unint64_t v17 = v16 + v12;
      if (v17 < v15) {
        break;
      }
      if (v11 < v15)
      {
        uint64_t v20 = *(unsigned __int16 *)v14;
        if (v10) {
          *(_WORD *)uint64_t v10 = v20;
        }
        else {
        *(_WORD *)size_t v14 = 0;
        }
        goto LABEL_18;
      }
      uint64_t v18 = 4 * *(unsigned __int16 *)v14;
      uint64_t v10 = v14;
      if (v18 == 512) {
        goto LABEL_11;
      }
    }
    *((_WORD *)v14 + 1) = v15 - v17;
    unint64_t v19 = (unsigned __int16 *)&v14[(unsigned __int16)(v15 - v17)];
    *unint64_t v19 = 0;
    v19[1] = v17;
    char v13 = (int *)(v19 + 2);
    if (((unint64_t)(v19 + 2) & 0xF) != 0) {
      abort_message("%s:%d: %s", v2, v3, v4, v5, v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/fallback_malloc.cpp");
    }
  }
LABEL_18:
  return v13;
}

void sub_20D72A79C(_Unwind_Exception *a1)
{
}

void *__cxxabiv1::__calloc_with_fallback(size_t a1, size_t a2)
{
  uint64_t v4 = malloc_type_calloc(a1, a2, 0x6119B3B9uLL);
  if (!v4)
  {
    size_t v5 = a2 * a1;
    uint64_t v4 = v6;
    if (v6) {
      bzero(v6, v5);
    }
  }
  return v4;
}

void __cxxabiv1::__aligned_free_with_fallback(void *a1, void *a2)
{
  {
    free(a1);
  }
  else
  {
  }
}

uint64_t anonymous namespace'::fallback_free(_anonymous_namespace_ *this, void *a2)
{
  uint64_t v3 = (unsigned __int16 *)((char *)this - 4);
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
LABEL_9:
  }
  else
  {
    size_t v5 = 0;
    uint64_t v6 = *((unsigned __int16 *)this - 1);
    while (1)
    {
      uint64_t v8 = v7[1];
      if (&v7[2 * v8] == v3)
      {
        v7[1] = v6 + v8;
      }
      if (&v3[2 * v6] == v7) {
        break;
      }
      uint64_t v9 = 4 * *v7;
      size_t v5 = v7;
      if (v9 == 512) {
        goto LABEL_9;
      }
    }
    *((_WORD *)this - 1) = v6 + v8;
    if (v5)
    {
    }
    else
    {
      *uint64_t v3 = *v7;
    }
  }
}

void __cxxabiv1::__free_with_fallback(void *a1, void *a2)
{
  {
    free(a1);
  }
  else
  {
  }
}

void __cxxabiv1::__fundamental_type_info::~__fundamental_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

void __cxxabiv1::__array_type_info::~__array_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

void __cxxabiv1::__function_type_info::~__function_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

void __cxxabiv1::__enum_type_info::~__enum_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

void __cxxabiv1::__class_type_info::~__class_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

void __cxxabiv1::__si_class_type_info::~__si_class_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

void __cxxabiv1::__vmi_class_type_info::~__vmi_class_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

void __cxxabiv1::__pbase_type_info::~__pbase_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

void __cxxabiv1::__pointer_type_info::~__pointer_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

void __cxxabiv1::__pointer_to_member_type_info::~__pointer_to_member_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);

  JUMPOUT(0x21055C430);
}

BOOL is_equal(const std::type_info *a1, const std::type_info *a2, char a3)
{
  if (a3)
  {
    return a1 == a2
        || strcmp((const char *)(a1->__type_name & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2->__type_name & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  else
  {
    return std::type_info::operator==[abi:ne180100]((uint64_t)a1, (uint64_t)a2);
  }
}

uint64_t __cxxabiv1::__array_type_info::can_catch(__cxxabiv1::__array_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  return 0;
}

uint64_t __cxxabiv1::__function_type_info::can_catch(__cxxabiv1::__function_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  return 0;
}

const __cxxabiv1::__shim_type_info *__cxxabiv1::__class_type_info::can_catch(__cxxabiv1::__class_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  if (std::type_info::operator==[abi:ne180100]((uint64_t)this, (uint64_t)a2)) {
    return (const __cxxabiv1::__shim_type_info *)1;
  }
  uint64_t result = __cxxabiv1::is_class_type(a2);
  if (result)
  {
    v7[0] = result;
    v7[1] = 0;
    v7[2] = this;
    v7[3] = -1;
    long long v8 = 0u;
    memset(v9, 0, sizeof(v9));
    char v10 = 1;
    uint64_t v11 = 0;
    *(_DWORD *)&v9[24] = 1;
    (*(void (**)(const __cxxabiv1::__shim_type_info *, void *, void, uint64_t))(*(void *)result + 56))(result, v7, *a3, 1);
    uint64_t result = (const __cxxabiv1::__shim_type_info *)(*(_DWORD *)v9 == 1);
    if (*(_DWORD *)v9 == 1) {
      *a3 = (void *)v8;
    }
  }
  return result;
}

const __cxxabiv1::__shim_type_info *__cxxabiv1::is_class_type(const __cxxabiv1::__shim_type_info *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  unint64_t v1 = a1;
  {
    return 0;
  }
  return v1;
}

void __cxxabiv1::__class_type_info::process_found_base_class(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4 = *(_DWORD *)(a2 + 60);
  if (v4)
  {
    if (*(void *)(a2 + 40) == *(void *)(a2 + 80) && *(void *)(a2 + 32) == a3)
    {
      if (*(_DWORD *)(a2 + 48) == 2) {
        *(_DWORD *)(a2 + 48) = a4;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 60) = v4 + 1;
      *(_DWORD *)(a2 + 48) = 2;
      *(unsigned char *)(a2 + 78) = 1;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 48) = a4;
    uint64_t v5 = *(void *)(a2 + 80);
    *(void *)(a2 + 32) = a3;
    *(void *)(a2 + 40) = v5;
    *(_DWORD *)(a2 + 60) = 1;
  }
}

void __cxxabiv1::__class_type_info::has_unambiguous_public_base(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  BOOL v7 = std::type_info::operator==[abi:ne180100](a1, *(void *)(a2 + 16));
  if (v7)
  {
    __cxxabiv1::__class_type_info::process_found_base_class(v7, a2, a3, a4);
  }
}

void __cxxabiv1::__si_class_type_info::has_unambiguous_public_base(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  BOOL v8 = std::type_info::operator==[abi:ne180100](a1, *(void *)(a2 + 16));
  if (v8)
  {
    __cxxabiv1::__class_type_info::process_found_base_class(v8, a2, a3, a4);
  }
  else
  {
    uint64_t v9 = *(void (**)(void))(**(void **)(a1 + 16) + 56);
    v9();
  }
}

uint64_t __cxxabiv1::__base_class_type_info::has_unambiguous_public_base(void *a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 79) && (a1[1] & 1) != 0) {
    *(void *)(a2 + 80) = *(void *)(*a1 + 8) & 0x7FFFFFFFFFFFFFFFLL;
  }
  return (*(uint64_t (**)(void))(*(void *)*a1 + 56))(*a1);
}

void __cxxabiv1::__vmi_class_type_info::has_unambiguous_public_base(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  BOOL v8 = std::type_info::operator==[abi:ne180100](a1, *(void *)(a2 + 16));
  if (v8)
  {
    __cxxabiv1::__class_type_info::process_found_base_class(v8, a2, a3, a4);
  }
  else
  {
    unint64_t v9 = a1 + 24 + 16 * *(unsigned int *)(a1 + 20);
    __cxxabiv1::__base_class_type_info::has_unambiguous_public_base((void *)(a1 + 24), a2);
    if (a1 + 40 < v9)
    {
      unint64_t v10 = a1 + 56;
      do
      {
        __cxxabiv1::__base_class_type_info::has_unambiguous_public_base((void *)(v10 - 16), a2);
        if (*(unsigned char *)(a2 + 78)) {
          BOOL v11 = 1;
        }
        else {
          BOOL v11 = v10 >= v9;
        }
        v10 += 16;
      }
      while (!v11);
    }
  }
}

uint64_t __cxxabiv1::__pbase_type_info::can_catch(__cxxabiv1::__pbase_type_info *this, const __cxxabiv1::__shim_type_info *lpsrc, void **a3)
{
  if ((*((unsigned char *)this + 16) & 0x18) != 0) {
    return this == lpsrc
  }
        || strcmp((const char *)(*((void *)this + 1) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*((void *)lpsrc + 1) & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  if (!lpsrc) {
    return 0;
  }
  if (!result) {
    return result;
  }
  if ((*(unsigned char *)(result + 16) & 0x18) != 0)
  {
    return this == lpsrc
        || strcmp((const char *)(*((void *)this + 1) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*((void *)lpsrc + 1) & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  else
  {
    return std::type_info::operator==[abi:ne180100]((uint64_t)this, (uint64_t)lpsrc);
  }
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  BOOL v8 = v15;
  BOOL v9 = is_equal(v15, (const std::type_info *)lpdtype, 0);
  unint64_t v10 = v14;
  if (v9)
  {
    BOOL v11 = v16;
    unint64_t v12 = v14;
  }
  else
  {
    if (!result)
    {
    }
  }
  return result;
}

uint64_t __cxxabiv1::__pointer_type_info::can_catch(__cxxabiv1::__pointer_type_info *this, const __cxxabiv1::__shim_type_info *a2, void ***a3)
{
  {
    *a3 = 0;
    return 1;
  }
  if (__cxxabiv1::__pbase_type_info::can_catch(this, a2, v6))
  {
    if (*a3) {
      *a3 = (void **)**a3;
    }
    return 1;
  }
  if (!a2) {
    __cxa_bad_typeid();
  }
  if (result)
  {
    if (*a3) {
      *a3 = (void **)**a3;
    }
    int v8 = *((_DWORD *)a2 + 4);
    int v9 = *((_DWORD *)this + 4);
    if ((v8 & ~(_BYTE)v9 & 7) != 0
      || (v9 & ~(_BYTE)v8 & 0x60) != 0)
    {
      return 0;
    }
    if (std::type_info::operator==[abi:ne180100](*((void *)this + 3), *((void *)a2 + 3))) {
      return 1;
    }
    {
      unint64_t v10 = (const void *)*((void *)a2 + 3);
      if (v10) {
      return 1;
      }
    }
    BOOL v11 = (const void *)*((void *)this + 3);
    if (!v11) {
      goto LABEL_30;
    }
    if (v12)
    {
      if (*((unsigned char *)this + 16))
      {
        char v13 = (const __cxxabiv1::__shim_type_info *)*((void *)a2 + 3);
        return __cxxabiv1::__pointer_type_info::can_catch_nested(v12, v13);
      }
      return 0;
    }
    if (v14)
    {
      if ((*((unsigned char *)this + 16) & 1) == 0) {
        return 0;
      }
      unint64_t v15 = (const __cxxabiv1::__shim_type_info *)*((void *)a2 + 3);
      return __cxxabiv1::__pointer_to_member_type_info::can_catch_nested(v14, v15);
    }
    else
    {
LABEL_30:
      uint64_t result = (uint64_t)__cxxabiv1::is_class_type((const __cxxabiv1::__shim_type_info *)v11);
      if (result)
      {
        uint64_t v16 = result;
        uint64_t result = (uint64_t)__cxxabiv1::is_class_type(*((const __cxxabiv1::__shim_type_info **)a2 + 3));
        if (result)
        {
          uint64_t v17 = *a3;
          BOOL v18 = *a3 != 0;
          v20[0] = result;
          v20[1] = 0;
          v20[2] = v16;
          v20[3] = -1;
          long long v21 = 0u;
          memset(v22, 0, sizeof(v22));
          BOOL v23 = v18;
          uint64_t v24 = 0;
          *(_DWORD *)&v22[24] = 1;
          (*(void (**)(uint64_t, void *, void **, uint64_t))(*(void *)result + 56))(result, v20, v17, 1);
          uint64_t result = *(_DWORD *)v22 == 1;
          if (*(_DWORD *)v22 == 1)
          {
            unint64_t v19 = (void **)v21;
            if (!v17) {
              unint64_t v19 = 0;
            }
            *a3 = v19;
          }
        }
      }
    }
  }
  return result;
}

uint64_t __cxxabiv1::__pointer_type_info::can_catch_nested(__cxxabiv1::__pointer_type_info *this, const __cxxabiv1::__shim_type_info *lpsrc)
{
  if (!lpsrc) {
    return 0;
  }
  while (1)
  {
    if (!result) {
      break;
    }
    uint64_t v4 = result;
    if ((*(_DWORD *)(result + 16) & ~*((_DWORD *)this + 4)) != 0) {
      return 0;
    }
    if (std::type_info::operator==[abi:ne180100](*((void *)this + 3), *(void *)(result + 24))) {
      return 1;
    }
    if ((*((unsigned char *)this + 16) & 1) == 0) {
      return 0;
    }
    uint64_t v5 = (const void *)*((void *)this + 3);
    if (!v5) {
      return 0;
    }
    if (!v6)
    {
      if (result)
      {
        BOOL v7 = *(const __cxxabiv1::__shim_type_info **)(v4 + 24);
        return __cxxabiv1::__pointer_to_member_type_info::can_catch_nested((__cxxabiv1::__pointer_to_member_type_info *)result, v7);
      }
      return result;
    }
    this = v6;
    lpsrc = *(const __cxxabiv1::__shim_type_info **)(v4 + 24);
    if (!lpsrc) {
      return 0;
    }
  }
  return result;
}

BOOL __cxxabiv1::__pointer_to_member_type_info::can_catch_nested(__cxxabiv1::__pointer_to_member_type_info *this, const __cxxabiv1::__shim_type_info *lpsrc)
{
  if (!lpsrc) {
    return 0;
  }
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  if ((v3[2] & ~*((_DWORD *)this + 4)) != 0
    || !std::type_info::operator==[abi:ne180100](*((void *)this + 3), v3[3]))
  {
    return 0;
  }
  uint64_t v5 = *((void *)this + 4);
  uint64_t v6 = v4[4];

  return std::type_info::operator==[abi:ne180100](v5, v6);
}

uint64_t __cxxabiv1::__pointer_to_member_type_info::can_catch(__cxxabiv1::__pointer_to_member_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  {
    BOOL v7 = (const void *)*((void *)this + 3);
    if (v7
    {
      int v8 = &__cxxabiv1::__pointer_to_member_type_info::can_catch(__cxxabiv1::__shim_type_info const*,void *&)const::null_ptr_rep;
    }
    else
    {
      int v8 = &__cxxabiv1::__pointer_to_member_type_info::can_catch(__cxxabiv1::__shim_type_info const*,void *&)const::null_ptr_rep;
    }
    *a3 = v8;
    return 1;
  }
  if (__cxxabiv1::__pbase_type_info::can_catch(this, a2, v6)) {
    return 1;
  }
  if (!a2) {
    return 0;
  }
  if (!result) {
    return result;
  }
  uint64_t v10 = result;
  int v11 = *(_DWORD *)(result + 16);
  int v12 = *((_DWORD *)this + 4);
  if ((v11 & ~(_BYTE)v12 & 7) != 0
    || (v12 & ~(_BYTE)v11 & 0x60) != 0)
  {
    return 0;
  }
  uint64_t result = std::type_info::operator==[abi:ne180100](*((void *)this + 3), *(void *)(result + 24));
  if (result)
  {
    uint64_t v13 = *((void *)this + 4);
    uint64_t v14 = *(void *)(v10 + 32);
    return std::type_info::operator==[abi:ne180100](v13, v14);
  }
  return result;
}

void *__cxxabiv1::anonymous namespace'::dyn_cast_get_derived_info(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(*a2 - 16);
  *uint64_t result = (char *)a2 + v3;
  result[1] = *(void *)(v2 - 8);
  result[2] = v3;
  return result;
}

const void *__cxxabiv1::anonymous namespace'::dyn_cast_to_derived(__cxxabiv1::_anonymous_namespace_ *this, const void *a2, void *a3, const __cxxabiv1::__class_type_info *a4, const __cxxabiv1::__class_type_info *a5, uint64_t a6)
{
  if (a6 < 0)
  {
    if (a6 == -2) {
      return 0;
    }
    unint64_t v15 = a4;
    uint64_t v16 = this;
    uint64_t v17 = a3;
    uint64_t v18 = a6;
    long long v19 = 0u;
    memset(v20, 0, 24);
    *(_DWORD *)&v20[24] = 1;
    *(_DWORD *)&v20[28] = 0x1000000;
    uint64_t v21 = 0;
    (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, const void *, uint64_t, void))(*(void *)a4 + 40))(a4, &v15, a2, a2, 1, 0);
    int v13 = *(_DWORD *)v20;
    if (!*(_DWORD *)v20)
    {
      if ((add_explicit & (add_explicit - 1)) == 0) {
        syslog(3, "dynamic_cast error 1: Both of the following type_info's should have public visibility. At least one of them is hidden. %s, %s.\n", (const char *)(a3[1] & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*((void *)a4 + 1) & 0x7FFFFFFFFFFFFFFFLL));
      }
      unint64_t v15 = a4;
      uint64_t v16 = this;
      uint64_t v17 = a3;
      uint64_t v18 = a6;
      long long v19 = 0u;
      memset(v20, 0, 31);
      v20[31] = 1;
      uint64_t v21 = 0;
      *(_DWORD *)&v20[24] = 1;
      (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, const void *, uint64_t, uint64_t))(*(void *)a4 + 40))(a4, &v15, a2, a2, 1, 1);
      int v13 = *(_DWORD *)v20;
    }
    BOOL v8 = v13 == 1;
  }
  else
  {
    BOOL v8 = (const __cxxabiv1::__class_type_info *)((char *)a5 + a6) == 0;
  }
  if (v8) {
    return a2;
  }
  else {
    return 0;
  }
}

char *__cxxabiv1::anonymous namespace'::dyn_cast_try_downcast(__cxxabiv1::_anonymous_namespace_ *this, uint64_t a2, const void *a3, const __cxxabiv1::__class_type_info *a4, unint64_t a5)
{
  if ((a5 & 0x8000000000000000) != 0) {
    return 0;
  }
  uint64_t v5 = (char *)this - a5;
  if ((uint64_t)((uint64_t)this - a5) < a2) {
    return 0;
  }
  v7[0] = a4;
  v7[1] = (char *)this - a5;
  v7[2] = a3;
  v7[3] = a5;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  int v11 = 1;
  int v12 = 0x1000000;
  uint64_t v13 = 0;
  (*(void (**)(const __cxxabiv1::__class_type_info *, void *, uint64_t, uint64_t, uint64_t, void))(*(void *)a4 + 40))(a4, v7, a2, a2, 1, 0);
  if (v9) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t __cxxabiv1::anonymous namespace'::dyn_cast_slow(__cxxabiv1::_anonymous_namespace_ *this, const void *a2, void *a3, const __cxxabiv1::__class_type_info *a4, const __cxxabiv1::__class_type_info *a5, const __cxxabiv1::__class_type_info *a6)
{
  uint64_t v16 = a4;
  uint64_t v17 = this;
  uint64_t v18 = a3;
  long long v19 = a6;
  memset(v21, 0, sizeof(v21));
  long long v20 = 0u;
  char v22 = 1;
  uint64_t v23 = 0;
  (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, uint64_t, void))(*(void *)a5 + 48))(a5, &v16, a2, 1, 0);
  if (!*(void *)v21)
  {
    if ((add_explicit & (add_explicit - 1)) == 0) {
      syslog(3, "dynamic_cast error 2: One or more of the following type_info's has hidden visibility or is defined in more than one translation unit. They should all have public visibility. %s, %s, %s.\n", (const char *)(a3[1] & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*((void *)a5 + 1) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*((void *)a4 + 1) & 0x7FFFFFFFFFFFFFFFLL));
    }
    uint64_t v16 = a4;
    uint64_t v17 = this;
    uint64_t v18 = a3;
    long long v19 = a6;
    long long v20 = 0u;
    memset(v21, 0, sizeof(v21));
    char v22 = 1;
    uint64_t v23 = 0;
    (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, uint64_t, uint64_t))(*(void *)a5 + 48))(a5, &v16, a2, 1, 1);
  }
  if (*(_DWORD *)&v21[12] == 1)
  {
    if (*(_DWORD *)v21 == 1) {
      return v20;
    }
    uint64_t result = 0;
    if (!*(_DWORD *)&v21[16] && *(void *)&v21[4] == 0x100000001) {
      return v20;
    }
  }
  else if (*(_DWORD *)&v21[12])
  {
    return 0;
  }
  else if (*(_DWORD *)&v21[8] == 1 && *(_DWORD *)&v21[4] == 1 && *(_DWORD *)&v21[16] == 1)
  {
    return *((void *)&v20 + 1);
  }
  else
  {
    return 0;
  }
  return result;
}

void __cxxabiv1::__class_type_info::process_static_type_above_dst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(unsigned char *)(a2 + 77) = 1;
  if (*(void *)(a2 + 8) != a4) {
    return;
  }
  *(unsigned char *)(a2 + 76) = 1;
  uint64_t v5 = *(void *)(a2 + 32);
  if (!v5)
  {
    *(void *)(a2 + 32) = a3;
    *(_DWORD *)(a2 + 48) = a5;
    *(_DWORD *)(a2 + 60) = 1;
    if (a5 != 1) {
      return;
    }
    int v6 = *(_DWORD *)(a2 + 72);
    goto LABEL_11;
  }
  if (v5 != a3)
  {
    ++*(_DWORD *)(a2 + 60);
    goto LABEL_12;
  }
  int v6 = *(_DWORD *)(a2 + 48);
  if (v6 == 2)
  {
    *(_DWORD *)(a2 + 48) = a5;
    int v6 = a5;
  }
  if (*(_DWORD *)(a2 + 72) == 1)
  {
LABEL_11:
    if (v6 != 1) {
      return;
    }
LABEL_12:
    *(unsigned char *)(a2 + 78) = 1;
  }
}

void __cxxabiv1::__class_type_info::process_static_type_below_dst(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (*(void *)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1) {
    *(_DWORD *)(a2 + 52) = a4;
  }
}

uint64_t __cxxabiv1::__vmi_class_type_info::search_below_dst(uint64_t result, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  uint64_t v8 = result;
  uint64_t v9 = *(void *)(a2 + 16);
  if ((a5 & 1) == 0)
  {
    uint64_t result = std::type_info::operator==[abi:ne180100](result, v9);
    if ((result & 1) == 0)
    {
      uint64_t result = std::type_info::operator==[abi:ne180100](v8, *(void *)a2);
      if ((result & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
LABEL_13:
    if (*(void **)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1) {
      *(_DWORD *)(a2 + 52) = a4;
    }
    return result;
  }
  if (v9 == result) {
    goto LABEL_13;
  }
  uint64_t v10 = (const char *)(*(void *)(result + 8) & 0x7FFFFFFFFFFFFFFFLL);
  uint64_t result = strcmp(v10, (const char *)(*(void *)(v9 + 8) & 0x7FFFFFFFFFFFFFFFLL));
  if (!result) {
    goto LABEL_13;
  }
  if (*(void *)a2 != v8)
  {
    uint64_t result = strcmp(v10, (const char *)(*(void *)(*(void *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL));
    if (result)
    {
LABEL_6:
      unint64_t v11 = v8 + 24 + 16 * *(unsigned int *)(v8 + 20);
      uint64_t result = __cxxabiv1::__base_class_type_info::search_below_dst((uint64_t *)(v8 + 24), a2, a3, a4);
      int v12 = (uint64_t *)(v8 + 40);
      if (v8 + 40 < v11)
      {
        int v13 = *(_DWORD *)(v8 + 16);
        if ((v13 & 2) != 0 || *(_DWORD *)(a2 + 60) == 1)
        {
          do
          {
            if (*(unsigned char *)(a2 + 78)) {
              break;
            }
            uint64_t result = __cxxabiv1::__base_class_type_info::search_below_dst(v12, a2, a3, a4);
            v12 += 2;
          }
          while ((unint64_t)v12 < v11);
        }
        else if (v13)
        {
          do
          {
            if (*(unsigned char *)(a2 + 78) || *(_DWORD *)(a2 + 60) == 1 && *(_DWORD *)(a2 + 48) == 1) {
              break;
            }
            uint64_t result = __cxxabiv1::__base_class_type_info::search_below_dst(v12, a2, a3, a4);
            v12 += 2;
          }
          while ((unint64_t)v12 < v11);
        }
        else
        {
          do
          {
            if (*(unsigned char *)(a2 + 78)) {
              break;
            }
            if (*(_DWORD *)(a2 + 60) == 1) {
              break;
            }
            uint64_t result = __cxxabiv1::__base_class_type_info::search_below_dst(v12, a2, a3, a4);
            v12 += 2;
          }
          while ((unint64_t)v12 < v11);
        }
      }
      return result;
    }
  }
LABEL_17:
  if (*(void **)(a2 + 32) == a3 || *(void **)(a2 + 40) == a3)
  {
    if (a4 == 1) {
      *(_DWORD *)(a2 + 56) = 1;
    }
    return result;
  }
  *(_DWORD *)(a2 + 56) = a4;
  if (*(_DWORD *)(a2 + 68) == 4)
  {
LABEL_48:
    *(void *)(a2 + 40) = a3;
    int v20 = *(_DWORD *)(a2 + 60);
    ++*(_DWORD *)(a2 + 64);
    if (v20 == 1 && *(_DWORD *)(a2 + 48) == 2) {
      *(unsigned char *)(a2 + 78) = 1;
    }
    return result;
  }
  uint64_t v14 = *(unsigned int *)(v8 + 20);
  if (!v14)
  {
    *(_DWORD *)(a2 + 68) = 4;
    goto LABEL_48;
  }
  char v15 = 0;
  char v16 = 0;
  uint64_t v17 = (uint64_t *)(v8 + 24);
  unint64_t v18 = v8 + 24 + 16 * v14;
  do
  {
    *(_WORD *)(a2 + 76) = 0;
    uint64_t result = __cxxabiv1::__base_class_type_info::search_above_dst(v17, a2, (uint64_t)a3, a3, 1);
    if (*(unsigned char *)(a2 + 78)) {
      break;
    }
    if (*(unsigned char *)(a2 + 77))
    {
      if (*(unsigned char *)(a2 + 76))
      {
        char v16 = 1;
        if (*(_DWORD *)(a2 + 48) == 1) {
          goto LABEL_32;
        }
        char v15 = 1;
        if ((*(unsigned char *)(v8 + 16) & 2) == 0) {
          goto LABEL_32;
        }
      }
      else
      {
        if ((*(unsigned char *)(v8 + 16) & 1) == 0) {
          goto LABEL_32;
        }
        char v15 = 1;
      }
    }
    v17 += 2;
  }
  while ((unint64_t)v17 < v18);
  if (v15)
  {
LABEL_32:
    int v19 = 3;
    goto LABEL_47;
  }
  int v19 = 4;
LABEL_47:
  *(_DWORD *)(a2 + 68) = v19;
  if ((v16 & 1) == 0) {
    goto LABEL_48;
  }
  return result;
}

uint64_t __cxxabiv1::__base_class_type_info::search_above_dst(uint64_t *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5 = a1[1];
  uint64_t v6 = v5 >> 8;
  if (v5) {
    uint64_t v6 = *(void *)(*a4 + v6);
  }
  uint64_t v7 = *a1;
  uint64_t v8 = (char *)a4 + v6;
  if ((v5 & 2) != 0) {
    a5 = a5;
  }
  else {
    a5 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t))(*(void *)v7 + 40))(v7, a2, a3, v8, a5);
}

uint64_t __cxxabiv1::__base_class_type_info::search_below_dst(uint64_t *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = v4 >> 8;
  if (v4) {
    uint64_t v5 = *(void *)(*a3 + v5);
  }
  uint64_t v6 = *a1;
  uint64_t v7 = (char *)a3 + v5;
  if ((v4 & 2) != 0) {
    a4 = a4;
  }
  else {
    a4 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t))(*(void *)v6 + 48))(v6, a2, v7, a4);
}

uint64_t __cxxabiv1::__si_class_type_info::search_below_dst(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v9 = result;
  uint64_t v10 = *(void *)(a2 + 16);
  if (a5)
  {
    if (v10 != result)
    {
      unint64_t v11 = (const char *)(*(void *)(result + 8) & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t result = strcmp(v11, (const char *)(*(void *)(v10 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if (result)
      {
        if (*(void *)a2 != v9)
        {
          uint64_t result = strcmp(v11, (const char *)(*(void *)(*(void *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL));
          if (result)
          {
LABEL_6:
            int v12 = *(uint64_t (**)(void))(**(void **)(v9 + 16) + 48);
            return v12();
          }
        }
        goto LABEL_14;
      }
    }
LABEL_10:
    if (*(void *)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1) {
      *(_DWORD *)(a2 + 52) = a4;
    }
    return result;
  }
  uint64_t result = std::type_info::operator==[abi:ne180100](result, v10);
  if (result) {
    goto LABEL_10;
  }
  uint64_t result = std::type_info::operator==[abi:ne180100](v9, *(void *)a2);
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
LABEL_14:
  if (*(void *)(a2 + 32) == a3 || *(void *)(a2 + 40) == a3)
  {
    if (a4 == 1) {
      *(_DWORD *)(a2 + 56) = 1;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 56) = a4;
    if (*(_DWORD *)(a2 + 68) != 4)
    {
      *(_WORD *)(a2 + 76) = 0;
      uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v9 + 16)
                                                                                              + 40))(*(void *)(v9 + 16), a2, a3, a3, 1, a5);
      if (*(unsigned char *)(a2 + 77))
      {
        int v13 = *(unsigned __int8 *)(a2 + 76);
        *(_DWORD *)(a2 + 68) = 3;
        if (v13) {
          return result;
        }
      }
      else
      {
        *(_DWORD *)(a2 + 68) = 4;
      }
    }
    *(void *)(a2 + 40) = a3;
    int v14 = *(_DWORD *)(a2 + 60);
    ++*(_DWORD *)(a2 + 64);
    if (v14 == 1 && *(_DWORD *)(a2 + 48) == 2) {
      *(unsigned char *)(a2 + 78) = 1;
    }
  }
  return result;
}

uint64_t __cxxabiv1::__class_type_info::search_below_dst(uint64_t result, uint64_t *a2, uint64_t a3, int a4, char a5)
{
  uint64_t v8 = result;
  uint64_t v9 = a2[2];
  if (a5)
  {
    if (v9 != result)
    {
      uint64_t v10 = (const char *)(*(void *)(result + 8) & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t result = strcmp(v10, (const char *)(*(void *)(v9 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if (result)
      {
        if (*a2 != v8)
        {
          uint64_t result = strcmp(v10, (const char *)(*(void *)(*a2 + 8) & 0x7FFFFFFFFFFFFFFFLL));
          if (result) {
            return result;
          }
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
    uint64_t result = std::type_info::operator==[abi:ne180100](result, v9);
    if ((result & 1) == 0)
    {
      uint64_t result = std::type_info::operator==[abi:ne180100](v8, *a2);
      if ((result & 1) == 0) {
        return result;
      }
LABEL_12:
      if (a2[4] == a3 || a2[5] == a3)
      {
        if (a4 == 1) {
          *((_DWORD *)a2 + 14) = 1;
        }
      }
      else
      {
        *((_DWORD *)a2 + 14) = a4;
        a2[5] = a3;
        int v11 = *((_DWORD *)a2 + 15);
        ++*((_DWORD *)a2 + 16);
        if (v11 == 1 && *((_DWORD *)a2 + 12) == 2) {
          *((unsigned char *)a2 + 78) = 1;
        }
        *((_DWORD *)a2 + 17) = 4;
      }
      return result;
    }
  }
  if (a2[1] == a3 && *((_DWORD *)a2 + 13) != 1) {
    *((_DWORD *)a2 + 13) = a4;
  }
  return result;
}

void __cxxabiv1::__vmi_class_type_info::search_above_dst(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char a6)
{
  uint64_t v10 = a1;
  uint64_t v11 = *(void *)(a2 + 16);
  if ((a6 & 1) == 0)
  {
    a1 = std::type_info::operator==[abi:ne180100](a1, v11);
    if ((a1 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_15:
    __cxxabiv1::__class_type_info::process_static_type_above_dst(a1, a2, a3, (uint64_t)a4, a5);
    return;
  }
  if (v11 == a1) {
    goto LABEL_15;
  }
  a1 = strcmp((const char *)(*(void *)(a1 + 8) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*(void *)(v11 + 8) & 0x7FFFFFFFFFFFFFFFLL));
  if (!a1) {
    goto LABEL_15;
  }
LABEL_4:
  char v12 = *(unsigned char *)(a2 + 76);
  char v13 = *(unsigned char *)(a2 + 77);
  unint64_t v14 = v10 + 24 + 16 * *(unsigned int *)(v10 + 20);
  *(_WORD *)(a2 + 76) = 0;
  __cxxabiv1::__base_class_type_info::search_above_dst((uint64_t *)(v10 + 24), a2, a3, a4, a5);
  int v15 = *(unsigned __int8 *)(a2 + 76);
  int v16 = (v15 | v12);
  int v17 = *(unsigned __int8 *)(a2 + 77);
  int v18 = (v17 | v13);
  for (uint64_t i = (uint64_t *)(v10 + 40); (unint64_t)i < v14 && !*(unsigned char *)(a2 + 78); i += 2)
  {
    if (v15)
    {
      if (*(_DWORD *)(a2 + 48) == 1 || (*(unsigned char *)(v10 + 16) & 2) == 0) {
        break;
      }
    }
    else if (v17 && (*(unsigned char *)(v10 + 16) & 1) == 0)
    {
      break;
    }
    *(_WORD *)(a2 + 76) = 0;
    __cxxabiv1::__base_class_type_info::search_above_dst(i, a2, a3, a4, a5);
    int v15 = *(unsigned __int8 *)(a2 + 76);
    v16 |= v15;
    int v17 = *(unsigned __int8 *)(a2 + 77);
    v18 |= v17;
  }
  *(unsigned char *)(a2 + 76) = v16 != 0;
  *(unsigned char *)(a2 + 77) = v18 != 0;
}

void __cxxabiv1::__si_class_type_info::search_above_dst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, char a6)
{
  uint64_t v10 = a1;
  uint64_t v11 = *(void *)(a2 + 16);
  if (a6)
  {
    if (v11 != a1)
    {
      a1 = strcmp((const char *)(*(void *)(a1 + 8) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*(void *)(v11 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if (a1)
      {
LABEL_4:
        char v12 = *(void (**)(void))(**(void **)(v10 + 16) + 40);
        v12();
        return;
      }
    }
  }
  else
  {
    a1 = std::type_info::operator==[abi:ne180100](a1, v11);
    if ((a1 & 1) == 0) {
      goto LABEL_4;
    }
  }

  __cxxabiv1::__class_type_info::process_static_type_above_dst(a1, a2, a3, a4, a5);
}

void __cxxabiv1::__class_type_info::search_above_dst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, char a6)
{
  uint64_t v10 = *(void *)(a2 + 16);
  if (a6)
  {
    if (v10 != a1)
    {
      a1 = strcmp((const char *)(*(void *)(a1 + 8) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*(void *)(v10 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if (a1) {
        return;
      }
    }
  }
  else
  {
    a1 = std::type_info::operator==[abi:ne180100](a1, v10);
    if ((a1 & 1) == 0) {
      return;
    }
  }

  __cxxabiv1::__class_type_info::process_static_type_above_dst(a1, a2, a3, a4, a5);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2, const std::nothrow_t *a3)
{
  return operator new(__sz, a2);
}

void sub_20D72C6C0(void *a1)
{
}

void *__cdecl operator new[](size_t __sz, std::align_val_t a2, const std::nothrow_t *a3)
{
  return operator new(__sz, a2);
}

void sub_20D72C6EC(void *a1)
{
}

void operator delete(void *__p, size_t __sz, std::align_val_t a3)
{
}

void operator delete[](void *__p, size_t __sz, std::align_val_t a3)
{
}

void operator new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  __vtable(a1, a2, a3, a4, a5, a6, a7, a8);
}

void operator new[](uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  __vtable(a1, a2, a3, a4, a5, a6, a7, a8);
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#2}::__invoke(unint64_t a1, malloc_type_id_t a2))(void)
{
  uint64_t result = __typed_operator_new_impl[abi:ne180100](a1, a2);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v4 = std::bad_alloc::bad_alloc(exception);
  }
  return result;
}

void (*__typed_operator_new_impl[abi:ne180100](unint64_t a1, malloc_type_id_t a2))(void)
{
  malloc_type_id_t v2 = a2;
  if (a1 <= 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = a1;
  }
  size_t v4 = v3;
  while (1)
  {
    uint64_t result = (void (*)(void))malloc_type_malloc(v4, a2);
    if (result) {
      break;
    }
    uint64_t result = std::get_new_handler();
    if (!result) {
      break;
    }
    result();
    size_t v4 = v3;
    a2 = v2;
  }
  return result;
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#4}::__invoke(unint64_t a1, malloc_type_id_t a2))(void)
{
  uint64_t result = __typed_operator_new_impl[abi:ne180100](a1, a2);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    size_t v4 = std::bad_alloc::bad_alloc(exception);
  }
  return result;
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#2}::__invoke(unint64_t a1, uint64_t a2, malloc_type_id_t a3))(void)
{
  return __typed_operator_new_impl[abi:ne180100](a1, a3);
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#4}::__invoke(unint64_t a1, uint64_t a2, malloc_type_id_t a3))(void)
{
  return __typed_operator_new_impl[abi:ne180100](a1, a3);
}

void $_1::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  abort_message("Terminating due to typed operator new being invoked before its static initializer in libcxx has been executed. This is likely happening in code with -ftyped-cxx-new-delete enabled and statically linking against libc++abi. If that is the case, and you cannot avoid invoking operator new in a static initializer, please try disabling TMO for that code with -fno-typed-cxx-new-delete. Otherwise, please file a bug report against libc++.", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void $_2::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  abort_message("Terminating due to typed operator new being invoked before its static initializer in libcxx has been executed. This is likely happening in code with -ftyped-cxx-new-delete enabled and statically linking against libc++abi. If that is the case, and you cannot avoid invoking operator new in a static initializer, please try disabling TMO for that code with -fno-typed-cxx-new-delete. Otherwise, please file a bug report against libc++.", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void $_3::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  abort_message("Terminating due to typed operator new being invoked before its static initializer in libcxx has been executed. This is likely happening in code with -ftyped-cxx-new-delete enabled and statically linking against libc++abi. If that is the case, and you cannot avoid invoking operator new in a static initializer, please try disabling TMO for that code with -fno-typed-cxx-new-delete. Otherwise, please file a bug report against libc++.", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void $_4::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  abort_message("Terminating due to typed operator new being invoked before its static initializer in libcxx has been executed. This is likely happening in code with -ftyped-cxx-new-delete enabled and statically linking against libc++abi. If that is the case, and you cannot avoid invoking operator new in a static initializer, please try disabling TMO for that code with -fno-typed-cxx-new-delete. Otherwise, please file a bug report against libc++.", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _GLOBAL__sub_I_stdlib_typed_new_cpp()
{
  BOOL v1 = (unint64_t)operator new[] < (unint64_t)operator new
    || (unint64_t)operator new[] > (unint64_t)_Unwind_DeleteException;
  if ((unint64_t)operator new > (unint64_t)_Unwind_DeleteException || v1) {
    uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#3}::__invoke;
  }
  else {
    uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#4}::__invoke;
  }
  BOOL v5 = (unint64_t)operator new[] < (unint64_t)operator new
    || (unint64_t)operator new[] > (unint64_t)_Unwind_DeleteException;
  BOOL v6 = (unint64_t)operator new < (unint64_t)operator new
    || (unint64_t)operator new > (unint64_t)_Unwind_DeleteException;
  int v7 = v6;
  if (v6 || v5) {
    uint64_t v9 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#3}::__invoke;
  }
  else {
    uint64_t v9 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#4}::__invoke;
  }
  if (v7) {
    uint64_t v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#1}::__invoke;
  }
  else {
    uint64_t v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#2}::__invoke;
  }
  uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#2}::__invoke;
  if ((unint64_t)operator new > (unint64_t)_Unwind_DeleteException) {
    uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#1}::__invoke;
  }
  __vtable = v11;
  __vtable = v3;
  __vtable = v10;
  __vtable = v9;
}

void *__cxxabiv1::__setExceptionClass(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  return result;
}

_Unwind_Exception_Class __cxxabiv1::__getExceptionClass(const _Unwind_Exception *a1)
{
  return a1->exception_class;
}

BOOL __cxxabiv1::__isOurExceptionClass(const _Unwind_Exception *a1)
{
  return a1->exception_class >> 8 == 0x434C4E47432B2BLL;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  size_t v1 = (thrown_size + 143) & 0xFFFFFFFFFFFFFFF0;
  malloc_type_id_t v2 = __cxxabiv1::__aligned_malloc_with_fallback(v1);
  uint64_t v3 = v2;
  if (!v2) {
    std::terminate();
  }
  bzero(v2, v1);
  return v3 + 32;
}

void *__cxa_begin_catch(void *a1)
{
  BOOL isOurExceptionClass = __cxxabiv1::__isOurExceptionClass((const _Unwind_Exception *)a1);
  globals = (uintptr_t *)__cxa_get_globals();
  size_t v4 = __cxxabiv1::cxa_exception_from_exception_unwind_exception((_Unwind_Exception *)a1);
  if (isOurExceptionClass)
  {
    int private_2 = v4[1].private_2;
    if (private_2 < 0) {
      int private_2 = -private_2;
    }
    LODWORD(v4[1].private_2) = private_2 + 1;
    if (v4 != (_Unwind_Exception *)*globals)
    {
      v4[1].private_1 = *globals;
      uintptr_t *globals = (uintptr_t)v4;
    }
    --*((_DWORD *)globals + 2);
    if (v4[2].private_2) {
      return (void *)v4[2].private_2;
    }
    else {
      return 0;
    }
  }
  else
  {
    if (*globals) {
      std::terminate();
    }
    uintptr_t *globals = (uintptr_t)v4;
    return (char *)a1 + 32;
  }
}

void __cxa_free_exception(void *a1)
{
  __cxxabiv1::__aligned_free_with_fallback((char *)a1 - 128, v1);
}

uint64_t __cxa_init_primary_exception(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 - 120) = 0;
  std::unexpected_handler unexpected = std::get_unexpected();
  if (unexpected) {
    std::unexpected_handler v7 = unexpected;
  }
  else {
    std::unexpected_handler v7 = 0;
  }
  *(void *)(a1 - 96) = v7;
  std::terminate_handler terminate = std::get_terminate();
  if (terminate) {
    std::terminate_handler v9 = terminate;
  }
  else {
    std::terminate_handler v9 = 0;
  }
  *(void *)(a1 - 88) = v9;
  *(void *)(a1 - 112) = a2;
  if (a3) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t result = a1 - 128;
  *(void *)(a1 - 104) = v10;
  *(void *)(a1 - 32) = 0x434C4E47432B2B00;
  *(void *)(a1 - 24) = __cxxabiv1::exception_cleanup_func;
  return result;
}

void __cxxabiv1::exception_cleanup_func(_Unwind_Reason_Code a1, _Unwind_Exception *a2)
{
  if (a1 != _URC_FOREIGN_EXCEPTION_CAUGHT)
  {
    exception_cleanup = (void (*)(void))a2[-2].exception_cleanup;
    if (!exception_cleanup) {
      std::__terminate(0);
    }
    std::__terminate(exception_cleanup);
  }
  __cxa_decrement_exception_refcount(&a2[1]);
}

double __cxa_allocate_dependent_exception()
{
  uint64_t v0 = __cxxabiv1::__aligned_malloc_with_fallback(0x80uLL);
  if (!v0) {
    std::terminate();
  }
  double result = 0.0;
  *((_OWORD *)v0 + 6) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  *((_OWORD *)v0 + 4) = 0u;
  *((_OWORD *)v0 + 5) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  *((_OWORD *)v0 + 3) = 0u;
  *(_OWORD *)uint64_t v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  return result;
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  globals = __cxa_get_globals();
  ++globals[2];
  inited = (_Unwind_Exception *)__cxa_init_primary_exception((uint64_t)a1, (uint64_t)lptinfo, (uint64_t)a3);
  inited->exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))1;
  _Unwind_RaiseException(inited + 3);
  __cxxabiv1::failed_throw((uint64_t)inited);
}

void __cxxabiv1::failed_throw(uint64_t a1)
{
  __cxa_begin_catch((void *)(a1 + 96));
  uint64_t v2 = *(void (**)(void))(a1 + 40);
  if (!v2) {
    std::__terminate(0);
  }
  std::__terminate(v2);
}

void *__cxa_get_exception_ptr(void *a1)
{
  if (*((void *)a1 - 1)) {
    return (void *)*((void *)a1 - 1);
  }
  else {
    return 0;
  }
}

_Unwind_Exception *__cxxabiv1::cxa_exception_from_exception_unwind_exception(_Unwind_Exception *a1)
{
  return a1 - 3;
}

void __cxa_end_catch(void)
{
  globals_fast = (uint64_t *)__cxa_get_globals_fast();
  uint64_t v2 = *globals_fast;
  if (*globals_fast)
  {
    if (*(void *)(v2 + 96) >> 8 == 0x434C4E47432B2BLL)
    {
      int v3 = *(_DWORD *)(v2 + 56);
      if (v3 < 0)
      {
        *(_DWORD *)(v2 + 56) = v3 + 1;
        if (v3 == -1) {
          uint64_t *globals_fast = *(void *)(v2 + 48);
        }
      }
      else
      {
        int v4 = v3 - 1;
        *(_DWORD *)(v2 + 56) = v4;
        if (!v4)
        {
          uint64_t *globals_fast = *(void *)(v2 + 48);
          if (*(unsigned char *)(v2 + 96) == 1)
          {
            uint64_t v5 = *(void *)(v2 + 8) - 128;
            __cxxabiv1::__aligned_free_with_fallback((void *)v2, v0);
            uint64_t v2 = v5;
          }
          BOOL v6 = (void *)(v2 + 128);
          __cxa_decrement_exception_refcount(v6);
        }
      }
    }
    else
    {
      _Unwind_DeleteException((_Unwind_Exception *)(v2 + 96));
      uint64_t *globals_fast = 0;
    }
  }
}

void __cxa_decrement_exception_refcount(void *primary_exception)
{
  if (primary_exception && atomic_fetch_add((atomic_ullong *volatile)primary_exception - 15, 0xFFFFFFFFFFFFFFFFLL) == 1)
  {
    int v3 = (void (*)(void *))*((void *)primary_exception - 13);
    if (v3) {
      v3(primary_exception);
    }
    __cxxabiv1::__aligned_free_with_fallback((char *)primary_exception - 128, v1);
  }
}

struct type_info *__cxa_current_exception_type(void)
{
  double result = (struct type_info *)__cxa_get_globals_fast();
  if (result)
  {
    uint64_t v1 = *(void *)result;
    if (*(void *)result && *(void *)(v1 + 96) >> 8 == 0x434C4E47432B2BLL) {
      return *(struct type_info **)(v1 + 16);
    }
    else {
      return 0;
    }
  }
  return result;
}

void __cxa_rethrow(void)
{
  globals = __cxa_get_globals();
  uint64_t v1 = *(void *)globals;
  if (*(void *)globals)
  {
    unint64_t v2 = *(void *)(v1 + 96) & 0xFFFFFFFFFFFFFF00;
    if (v2 == 0x434C4E47432B2B00)
    {
      *(_DWORD *)(v1 + 56) = -*(_DWORD *)(v1 + 56);
      ++globals[2];
    }
    else
    {
      *(void *)globals = 0;
    }
    _Unwind_RaiseException((_Unwind_Exception *)(v1 + 96));
    __cxa_begin_catch((void *)(v1 + 96));
    if (v2 == 0x434C4E47432B2B00)
    {
      int v3 = *(void (**)(void))(v1 + 40);
      if (!v3) {
        std::__terminate(0);
      }
      std::__terminate(v3);
    }
  }
  std::terminate();
}

void __cxa_increment_exception_refcount(void *primary_exception)
{
  if (primary_exception) {
    atomic_fetch_add((atomic_ullong *volatile)primary_exception - 15, 1uLL);
  }
}

void *__cxa_current_primary_exception(void)
{
  double result = __cxa_get_globals_fast();
  if (result)
  {
    uint64_t v1 = *(atomic_ullong **)result;
    if (*(void *)result && (unint64_t)v1[12] >> 8 == 0x434C4E47432B2BLL)
    {
      if (v1[12] == 1) {
        uint64_t v1 = (atomic_ullong *)(v1[1] - 128);
      }
      double result = v1 + 16;
      atomic_fetch_add(v1 + 1, 1uLL);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __cxa_rethrow_primary_exception(void *primary_exception)
{
  if (primary_exception)
  {
    __cxa_allocate_dependent_exception();
    int v3 = v2;
    v2->exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))primary_exception;
    atomic_fetch_add((atomic_ullong *volatile)primary_exception - 15, 1uLL);
    v2->private_1 = *((void *)primary_exception - 14);
    std::unexpected_handler unexpected = std::get_unexpected();
    if (unexpected) {
      std::unexpected_handler v5 = unexpected;
    }
    else {
      std::unexpected_handler v5 = 0;
    }
    v3[1].exception_class = (_Unwind_Exception_Class)v5;
    std::terminate_handler terminate = std::get_terminate();
    if (terminate) {
      std::unexpected_handler v7 = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))terminate;
    }
    else {
      std::unexpected_handler v7 = 0;
    }
    v3[3].exception_class = 0x434C4E47432B2B01;
    uint64_t v8 = v3 + 3;
    v8[-2].exception_cleanup = v7;
    globals = __cxa_get_globals();
    ++globals[2];
    v8->exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))__cxxabiv1::dependent_exception_cleanup;
    _Unwind_RaiseException(v8);
    __cxa_begin_catch(v8);
  }
}

void __cxxabiv1::dependent_exception_cleanup(_Unwind_Reason_Code a1, _Unwind_Exception *a2)
{
  if (a1 != _URC_FOREIGN_EXCEPTION_CAUGHT)
  {
    exception_cleanup = (void (*)(void))a2[-2].exception_cleanup;
    if (!exception_cleanup) {
      std::__terminate(0);
    }
    std::__terminate(exception_cleanup);
  }
  unint64_t v2 = a2 - 3;
  __cxa_decrement_exception_refcount(a2[-3].exception_cleanup);

  __cxxabiv1::__aligned_free_with_fallback(v2, v3);
}

BOOL __cxa_uncaught_exception(void)
{
  return __cxa_uncaught_exceptions() != 0;
}

unsigned int __cxa_uncaught_exceptions(void)
{
  globals_fast = __cxa_get_globals_fast();
  if (globals_fast) {
    LODWORD(globals_fast) = globals_fast[2];
  }
  return globals_fast;
}

uint64_t __gxx_personality_v0(int a1, int a2, uint64_t a3, _Unwind_Exception *a4, _Unwind_Context *context)
{
  uint64_t result = 3;
  if (a1 != 1 || !a4 || !context) {
    return result;
  }
  char v9 = a2;
  unint64_t v10 = a3 & 0xFFFFFFFFFFFFFF00;
  if (a2 == 6 && v10 == 0x434C4E47432B2B00)
  {
    _Unwind_Exception_Class exception_class = a4[-1].exception_class;
    *(void *)&long long v82 = SHIDWORD(a4[-2].private_2);
    *((void *)&v82 + 1) = exception_class;
    long long v83 = *(_OWORD *)&a4[-1].exception_cleanup;
    uintptr_t private_2 = a4[-1].private_2;
    __cxxabiv1::set_registers((uint64_t)a4, context, &v82);
    if ((v82 & 0x8000000000000000) != 0) {
      a4[-1].uintptr_t private_1 = 0;
    }
    return 7;
  }
  uintptr_t private_2 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  int v85 = 3;
  BOOL v12 = (a2 & 1) == 0;
  if (a2)
  {
    if ((a2 & 0xE) != 0) {
      return result;
    }
  }
  else
  {
    if ((a2 & 2) == 0) {
      return result;
    }
    if ((~a2 & 0xC) == 0)
    {
      int v85 = 2;
LABEL_12:
      __cxxabiv1::set_registers((uint64_t)a4, context, &v82);
      if ((v82 & 0x8000000000000000) != 0) {
        a4[-1].uintptr_t private_1 = 0;
      }
      return 7;
    }
  }
  uintptr_t LanguageSpecificData = _Unwind_GetLanguageSpecificData(context);
  if (!LanguageSpecificData) {
    return 8;
  }
  unint64_t v14 = (unsigned __int8 *)LanguageSpecificData;
  BOOL v76 = v12;
  unint64_t v79 = v10;
  *(void *)&long long v83 = LanguageSpecificData;
  uintptr_t IP = _Unwind_GetIP(context);
  uintptr_t RegionStart = _Unwind_GetRegionStart(context);
  uintptr_t v17 = RegionStart;
  unsigned int v20 = *v14;
  int v19 = v14 + 1;
  unsigned int v18 = v20;
  unint64_t v89 = v19;
  if (v20 == 255)
  {
    EncodedPointer = (char *)RegionStart;
  }
  else
  {
    EncodedPointer = (char *)__cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v89, v18, 0);
    int v19 = v89;
  }
  int v22 = *v19;
  uint64_t v21 = v19 + 1;
  unint64_t v89 = v21;
  char v81 = v22;
  if (v22 == 255)
  {
    uint64_t v80 = 0;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    do
    {
      char v25 = *v21++;
      v23 |= (unint64_t)(v25 & 0x7F) << v24;
      v24 += 7;
    }
    while (v25 < 0);
    uint64_t v80 = &v21[v23];
  }
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  unint64_t v28 = IP + ~v17;
  long long v29 = v21 + 1;
  unint64_t v89 = v21 + 1;
  unsigned int v30 = *v21;
  do
  {
    char v31 = *v29++;
    v26 |= (unint64_t)(v31 & 0x7F) << v27;
    v27 += 7;
  }
  while (v31 < 0);
  int v88 = v29;
  unint64_t v89 = v29;
  uint64_t v75 = v26;
  if (!v26)
  {
LABEL_38:
    BOOL v41 = v79 == 0x434C4E47432B2B00;
    goto LABEL_39;
  }
  char v32 = &v29[v26];
  while (1)
  {
    unint64_t v33 = __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v88, v30, 0);
    unint64_t v34 = __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v88, v30, 0);
    int v87 = 0;
    unint64_t v35 = __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v88, v30, 0);
    unint64_t v36 = v35 ? v35 : 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    int v87 = (char *)v36;
    uint64_t v39 = v88;
    do
    {
      char v40 = *v39++;
      v37 |= (unint64_t)(v40 & 0x7F) << v38;
      v38 += 7;
    }
    while (v40 < 0);
    int v88 = v39;
    if (v33 <= v28 && v28 < v34 + v33) {
      break;
    }
    if (v28 < v33 || v39 >= v32) {
      goto LABEL_38;
    }
  }
  if (!v36) {
    return 8;
  }
  if (&EncodedPointer[v36])
  {
    int v87 = &EncodedPointer[v36];
    unint64_t v42 = v79;
    int v43 = v76;
    long long v44 = &EncodedPointer[v36];
  }
  else
  {
    long long v44 = 0;
    int v87 = 0;
    unint64_t v42 = v79;
    int v43 = v76;
  }
  *((void *)&v83 + 1) = v44;
  if (!v37)
  {
LABEL_78:
    if (v43) {
      uint64_t result = 6;
    }
    else {
      uint64_t result = 8;
    }
    int v85 = result;
    if (!v43) {
      return result;
    }
LABEL_88:
    if (v9) {
      goto LABEL_89;
    }
    goto LABEL_12;
  }
  uint64_t v45 = 0;
  uint64_t v46 = (uint64_t)&v29[v75 - 1 + v37];
  int v78 = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&a4[1];
  while (1)
  {
    uint64_t v47 = 0;
    unint64_t v48 = 0;
    uint64_t v49 = (unsigned __int8 *)v46;
    do
    {
      unsigned int v51 = *v49++;
      unsigned int v50 = v51;
      v47 |= (unint64_t)(v51 & 0x7F) << v48;
      v48 += 7;
    }
    while ((v51 & 0x80) != 0);
    BOOL v52 = v48 < 0x40;
    uint64_t v53 = -1 << v48;
    if ((v52 & (v50 >> 6)) == 0) {
      uint64_t v53 = 0;
    }
    uint64_t v54 = v47 | v53;
    if ((v47 | v53) >= 1)
    {
      unint64_t v55 = v42;
      unint64_t shim_type_info = __cxxabiv1::get_shim_type_info(v47 | v53, v80, v81, v42 == 0x434C4E47432B2B00, a4, 0);
      if (!shim_type_info) {
        goto LABEL_83;
      }
      if (v55 == 0x434C4E47432B2B00)
      {
        unint64_t v57 = shim_type_info;
        v86 = 0;
        _Unwind_Exception_Class ExceptionClass = __cxxabiv1::__getExceptionClass(a4);
        exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&a4[1];
        if (ExceptionClass == 0x434C4E47432B2B01) {
          exception_cleanup = a4[-3].exception_cleanup;
        }
        v86 = exception_cleanup;
        if (!exception_cleanup) {
          goto LABEL_94;
        }
        uintptr_t private_1 = a4[-3].private_1;
        if (!private_1) {
          goto LABEL_94;
        }
        if ((*(unsigned int (**)(unint64_t, uintptr_t, void (__cdecl **)(_Unwind_Reason_Code, _Unwind_Exception *)))(*(void *)v57 + 32))(v57, private_1, &v86))
        {
          uint64_t v73 = v86;
          *(void *)&long long v82 = v54;
          *((void *)&v82 + 1) = v46;
          goto LABEL_87;
        }
        uint64_t v61 = v45;
        unint64_t v42 = v79;
      }
      else
      {
        unint64_t v42 = v55;
        uint64_t v61 = v45;
      }
      goto LABEL_71;
    }
    uint64_t v61 = (v54 == 0) | v45;
    if ((v9 & 8) == 0 && v54)
    {
      if (v42 != 0x434C4E47432B2B00)
      {
LABEL_83:
        *(void *)&long long v82 = v54;
        *((void *)&v82 + 1) = v46;
        if (__cxxabiv1::__getExceptionClass(a4) == 0x434C4E47432B2B01) {
          int v78 = a4[-3].exception_cleanup;
        }
        uint64_t v73 = v78;
LABEL_87:
        uintptr_t private_2 = (uintptr_t)v73;
        int v85 = 6;
        unint64_t v42 = v79;
        goto LABEL_88;
      }
      uint64_t v62 = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&a4[1];
      if (__cxxabiv1::__getExceptionClass(a4) == 0x434C4E47432B2B01) {
        uint64_t v62 = a4[-3].exception_cleanup;
      }
      if (!v62 || (uint64_t v63 = (const __cxxabiv1::__shim_type_info *)a4[-3].private_1) == 0)
      {
LABEL_94:
        BOOL v41 = 1;
LABEL_39:
        __cxxabiv1::call_terminate(v41, a4);
      }
      BOOL can_catch = __cxxabiv1::exception_spec_can_catch(v54, v80, v81, v63, v62, a4, 0);
      uint64_t v61 = v45;
      unint64_t v42 = v79;
      if (can_catch) {
        break;
      }
    }
LABEL_71:
    uint64_t v65 = 0;
    unint64_t v66 = 0;
    uint64_t v67 = v49;
    do
    {
      unsigned int v69 = *v67++;
      unsigned int v68 = v69;
      v65 |= (unint64_t)(v69 & 0x7F) << v66;
      v66 += 7;
    }
    while ((v69 & 0x80) != 0);
    BOOL v70 = v66 < 0x40;
    uint64_t v71 = -1 << v66;
    if ((v70 & (v68 >> 6)) == 0) {
      uint64_t v71 = 0;
    }
    uint64_t v72 = v65 | v71;
    if (!v72)
    {
      int v43 = v61 & ((v9 & 2) >> 1);
      goto LABEL_78;
    }
    uint64_t v46 = (uint64_t)&v49[v72];
    uint64_t v45 = v61;
  }
  *(void *)&long long v82 = v54;
  *((void *)&v82 + 1) = v46;
  uintptr_t private_2 = (uintptr_t)v62;
  int v85 = 6;
  if ((v9 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_89:
  if (v42 == 0x434C4E47432B2B00)
  {
    _Unwind_Exception_Class v74 = *((void *)&v82 + 1);
    HIDWORD(a4[-2].private_2) = v82;
    a4[-1]._Unwind_Exception_Class exception_class = v74;
    *(_OWORD *)&a4[-1].exception_cleanup = v83;
    a4[-1].uintptr_t private_2 = private_2;
  }
  return 6;
}

void __cxxabiv1::set_registers(uint64_t a1, _Unwind_Context *a2, void *a3)
{
  MEMORY[0x21055C3A0](a2, 0, a1);
  MEMORY[0x21055C3A0](a2, 1, *a3);
  _Unwind_GetGR(a2, -2);
  uintptr_t v5 = a3[3];

  _Unwind_SetIP(a2, v5);
}

void __cxa_call_unexpected(void *a1)
{
  if (!a1)
  {
    __cxa_begin_catch(0);
    std::terminate();
  }
  __cxa_begin_catch(a1);
  if (__cxxabiv1::__isOurExceptionClass((const _Unwind_Exception *)a1))
  {
    if (*((void *)a1 - 8)) {
      std::unexpected_handler unexpected = (void (*)(void))*((void *)a1 - 8);
    }
    else {
      std::unexpected_handler unexpected = 0;
    }
  }
  else
  {
    std::get_terminate();
    std::unexpected_handler unexpected = std::get_unexpected();
  }
  std::__unexpected(unexpected);
}

void sub_20D72DD08(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *a10, std::bad_exception a11, unsigned __int8 *a12)
{
}

void sub_20D72DEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::bad_exception a11)
{
}

void __cxxabiv1::call_terminate(int a1, _Unwind_Exception *a2)
{
  __cxa_begin_catch(a2);
  if (a1)
  {
    exception_cleanup = (void (*)(void))a2[-2].exception_cleanup;
    if (!exception_cleanup) {
      std::__terminate(0);
    }
    std::__terminate(exception_cleanup);
  }
  std::terminate();
}

unint64_t __cxxabiv1::readEncodedPointer(const unsigned __int8 **a1, unsigned int a2, uint64_t a3)
{
  if (a2 != 255)
  {
    int v3 = *a1;
    switch(a2 & 0xF)
    {
      case 0u:
      case 4u:
      case 0xCu:
        uintptr_t v5 = v3 + 8;
        unint64_t v4 = *(void *)v3;
        goto LABEL_17;
      case 1u:
        unint64_t v4 = 0;
        uint64_t v6 = 0;
        uintptr_t v5 = *a1;
        do
        {
          char v7 = *v5++;
          v4 |= (unint64_t)(v7 & 0x7F) << v6;
          v6 += 7;
        }
        while (v7 < 0);
        goto LABEL_17;
      case 2u:
        uintptr_t v5 = v3 + 2;
        unint64_t v4 = *(unsigned __int16 *)v3;
        goto LABEL_17;
      case 3u:
        uintptr_t v5 = v3 + 4;
        unint64_t v4 = *(unsigned int *)v3;
        goto LABEL_17;
      case 9u:
        uint64_t v8 = 0;
        unint64_t v9 = 0;
        uintptr_t v5 = *a1;
        do
        {
          unsigned int v11 = *v5++;
          unsigned int v10 = v11;
          v8 |= (unint64_t)(v11 & 0x7F) << v9;
          v9 += 7;
        }
        while ((v11 & 0x80) != 0);
        BOOL v12 = v9 < 0x40;
        uint64_t v13 = -1 << v9;
        if ((v12 & (v10 >> 6)) == 0) {
          uint64_t v13 = 0;
        }
        unint64_t v4 = v8 | v13;
        goto LABEL_17;
      case 0xAu:
        uintptr_t v5 = v3 + 2;
        unint64_t v4 = *(__int16 *)v3;
        goto LABEL_17;
      case 0xBu:
        uintptr_t v5 = v3 + 4;
        unint64_t v4 = *(int *)v3;
LABEL_17:
        int v14 = (a2 >> 4) & 7;
        switch(v14)
        {
          case 0:
            goto LABEL_22;
          case 3:
            if (!v4) {
              goto LABEL_28;
            }
            v4 += a3;
            if (!v4) {
              goto LABEL_28;
            }
            break;
          case 1:
            if (!v4) {
              goto LABEL_28;
            }
            v4 += (unint64_t)v3;
LABEL_22:
            if (!v4)
            {
LABEL_28:
              *a1 = v5;
              return v4;
            }
            break;
          default:
LABEL_30:
            abort();
        }
        if ((a2 & 0x80) != 0) {
          unint64_t v4 = *(void *)v4;
        }
        goto LABEL_28;
      default:
        goto LABEL_30;
    }
  }
  return 0;
}

BOOL __cxxabiv1::exception_spec_can_catch(uint64_t a1, const unsigned __int8 *a2, char a3, const __cxxabiv1::__shim_type_info *a4, void *a5, _Unwind_Exception *a6, uint64_t a7)
{
  if (!a2)
  {
    __cxa_begin_catch(a6);
    std::terminate();
  }
  uint64_t v13 = 0;
  char v14 = 0;
  for (uint64_t i = ~a1; ; ++i)
  {
    v13 |= (unint64_t)(a2[i] & 0x7F) << v14;
    if ((a2[i] & 0x80) == 0) {
      break;
    }
    v14 += 7;
LABEL_8:
    ;
  }
  if (v13)
  {
    unint64_t shim_type_info = __cxxabiv1::get_shim_type_info(v13, a2, a3, 1, a6, a7);
    unsigned int v18 = a5;
    if (!(*(unsigned int (**)(unint64_t, const __cxxabiv1::__shim_type_info *, void **))(*(void *)shim_type_info + 32))(shim_type_info, a4, &v18))
    {
      uint64_t v13 = 0;
      char v14 = 0;
      goto LABEL_8;
    }
  }
  return v13 == 0;
}

unint64_t __cxxabiv1::get_shim_type_info(uint64_t a1, const unsigned __int8 *a2, char a3, int a4, _Unwind_Exception *a5, uint64_t a6)
{
  if (!a2 || (a3 & 0xFu) >= 0xD || ((0x1C1Du >> (a3 & 0xF)) & 1) == 0) {
    __cxxabiv1::call_terminate(a4, a5);
  }
  char v7 = (unsigned __int8 *)&a2[qword_20D7315E8[a3 & 0xF] * a1];
  return __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v7, a3, a6);
}

int __cxa_guard_acquire(__guard *a1)
{
  LOBYTE(v1) = atomic_load_explicit((atomic_uchar *volatile)a1, memory_order_acquire);
  if (v1) {
    return 0;
  }
  unint64_t v4 = "__cxa_guard_acquire";
  uint64_t v26 = "__cxa_guard_acquire";
  if (pthread_mutex_lock(&stru_26AA44090)) {
    abort_message("%s failed to acquire mutex", v5, v6, v7, v8, v9, v10, v11, (char)"__cxa_guard_acquire");
  }
  char v12 = *((unsigned char *)a1 + 1);
  if ((v12 & 2) != 0)
  {
    int v13 = *((_DWORD *)a1 + 1);
    char v14 = pthread_self();
    LODWORD(v4) = pthread_mach_thread_np(v14);
    if (v13 == v4) {
      abort_message("__cxa_guard_acquire detected recursive initialization: do you have a function-local static variable whose initialization depends on that function?", v15, v16, v17, v18, v19, v20, v21, v25);
    }
  }
  while (1)
  {
    int v22 = *((unsigned __int8 *)a1 + 1);
    if ((v22 & 2) == 0) {
      break;
    }
    *((unsigned char *)a1 + 1) = v22 | 4;
    pthread_cond_wait(&_MergedGlobals, &stru_26AA44090);
  }
  if (v22 != 1)
  {
    if ((v12 & 2) == 0)
    {
      uint64_t v23 = pthread_self();
      LODWORD(v4) = pthread_mach_thread_np(v23);
    }
    *((_DWORD *)a1 + 1) = v4;
    *((unsigned char *)a1 + 1) = 2;
  }
  BOOL v2 = v22 != 1;
  return v2;
}

void sub_20D72E314(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Unwind_Resume(a1);
}

void __cxa_guard_release(__guard *a1)
{
  atomic_store(1u, (unsigned __int8 *)a1);
  uint64_t v17 = "__cxa_guard_release";
  if (pthread_mutex_lock(&stru_26AA44090)) {
    abort_message("%s failed to acquire mutex", v2, v3, v4, v5, v6, v7, v8, (char)"__cxa_guard_release");
  }
  char v9 = *((unsigned char *)a1 + 1);
  *((unsigned char *)a1 + 1) = 1;
  if ((v9 & 4) != 0)
  {
    if (pthread_cond_broadcast(&_MergedGlobals)) {
      abort_message("%s failed to broadcast", v10, v11, v12, v13, v14, v15, v16, (char)"__cxa_guard_release");
    }
  }
}

void __cxa_guard_abort(__guard *a1)
{
  uint64_t v17 = "__cxa_guard_abort";
  if (pthread_mutex_lock(&stru_26AA44090)) {
    abort_message("%s failed to acquire mutex", v2, v3, v4, v5, v6, v7, v8, (char)"__cxa_guard_abort");
  }
  *((_DWORD *)a1 + 1) = 0;
  char v9 = *((unsigned char *)a1 + 1);
  *((unsigned char *)a1 + 1) = 0;
  if ((v9 & 4) != 0)
  {
    if (pthread_cond_broadcast(&_MergedGlobals)) {
      abort_message("%s failed to broadcast", v10, v11, v12, v13, v14, v15, v16, (char)"__cxa_guard_abort");
    }
  }
}

void *__cdecl operator new(size_t __sz)
{
  if (__sz <= 1) {
    size_t v2 = 1;
  }
  else {
    size_t v2 = __sz;
  }
  while (1)
  {
    uint64_t result = malloc_type_malloc(v2, (v1 >> 2) | 0xC0000000000);
    if (result) {
      break;
    }
    new_handler = std::get_new_handler();
    if (!new_handler)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      uint64_t v6 = std::bad_alloc::bad_alloc(exception);
    }
    new_handler();
  }
  return result;
}

{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return operator new(__sz);
}

{
  while (1)
    ;
}

void sub_20D72E4EC(void *a1)
{
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return operator new[](__sz);
}

{
  while (1)
    ;
}

void sub_20D72E51C(void *a1)
{
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  if (__sz <= 1) {
    size_t v2 = 1;
  }
  else {
    size_t v2 = __sz;
  }
  if (a2 <= 8) {
    std::align_val_t v3 = 8;
  }
  else {
    std::align_val_t v3 = a2;
  }
  if (((v2 + v3 - 1) & -(uint64_t)v3) <= v2) {
    size_t v4 = v2;
  }
  else {
    size_t v4 = (v2 + v3 - 1) & -(uint64_t)v3;
  }
  while (1)
  {
    uint64_t result = malloc_type_aligned_alloc(v3, v4, 0x76A2E741uLL);
    if (result) {
      break;
    }
    new_handler = std::get_new_handler();
    if (!new_handler)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      uint64_t v8 = std::bad_alloc::bad_alloc(exception);
    }
    new_handler();
  }
  return result;
}

{
  while (1)
    ;
}

void _Unwind_DeleteException(_Unwind_Exception *exception_object)
{
}

uintptr_t _Unwind_GetGR(_Unwind_Context *context, int index)
{
  return MEMORY[0x270ED7D30](context, *(void *)&index);
}

uintptr_t _Unwind_GetIP(_Unwind_Context *context)
{
  return MEMORY[0x270ED7D38](context);
}

uintptr_t _Unwind_GetLanguageSpecificData(_Unwind_Context *context)
{
  return MEMORY[0x270ED7D40](context);
}

uintptr_t _Unwind_GetRegionStart(_Unwind_Context *context)
{
  return MEMORY[0x270ED7D48](context);
}

_Unwind_Reason_Code _Unwind_RaiseException(_Unwind_Exception *exception_object)
{
  return MEMORY[0x270ED7D50](exception_object);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _Unwind_SetGR(_Unwind_Context *context, int index, uintptr_t new_value)
{
}

void _Unwind_SetIP(_Unwind_Context *a1, uintptr_t new_value)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete[](void *__p, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator delete[](void *__p, std::align_val_t a2)
{
  while (1)
    ;
}

void operator delete[](void *__p, size_t __sz)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator delete(void *__p, std::align_val_t a2)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator delete(void *__p, size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, std::align_val_t a2)
{
  while (1)
    ;
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA380](alignment, size, type_id);
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void syslog(int a1, const char *a2, ...)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}